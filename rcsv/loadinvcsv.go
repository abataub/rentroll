package rcsv

import (
	"context"
	"fmt"
	"rentroll/rlib"
	"strings"
)

// CVS record format:
// 0    1        /* 2        */ 3        4            5
// BUD, Date,    /*PayorSpec,*/ DateDue, DeliveredBy, AssessmentSpec
// REX, 6/1/16,  /*DEP001,   */ 7/1/16   1,           "ASM00001,2"

// CreateInvoicesFromCSV reads an invoice type string array and creates a database record
func CreateInvoicesFromCSV(ctx context.Context, sa []string, lineno int) (int, error) {
	const funcname = "CreateInvoicesFromCSV"
	var (
		err error
		inv rlib.Invoice
	)

	const (
		BUD            = 0
		Date           = iota
		DateDue        = iota
		DeliveredBy    = iota
		AssessmentSpec = iota
	)
	// PayorSpec      = iota

	// csvCols is an array that defines all the columns that should be in this csv file
	var csvCols = []CSVColumn{
		{"BUD", BUD},
		{"Date", Date},
		{"DateDue", DateDue},
		{"DeliveredBy", DeliveredBy},
		{"AssessmentSpec", AssessmentSpec},
	}
	// {"PayorSpec", PayorSpec},

	y, err := ValidateCSVColumnsErr(csvCols, sa, funcname, lineno)
	if y {
		return 1, err
	}
	if lineno == 1 {
		return 0, nil // we've validated the col headings, all is good, send the next line
	}

	//-------------------------------------------------------------------
	// Make sure the rlib.Business is in the database
	//-------------------------------------------------------------------
	bud := strings.ToLower(strings.TrimSpace(sa[BUD]))
	if len(bud) > 0 {
		b1, err := rlib.GetBusinessByDesignation(ctx, bud)
		if err != nil {
			return CsvErrorSensitivity, fmt.Errorf("%s: line %d - error while getting business by designation(%s), Error: %s", funcname, lineno, sa[BUD], err.Error())
		}
		if len(b1.Designation) == 0 {
			return CsvErrorSensitivity, fmt.Errorf("%s: line %d - Business with designation %s does not exist", funcname, lineno, sa[BUD])
		}
		inv.BID = b1.BID
	}

	//-------------------------------------------------------------------
	// Date
	//-------------------------------------------------------------------
	inv.Dt, err = rlib.StringToDate(sa[Date])
	if err != nil {
		fmt.Printf("%s: line %d - invalid start date:  %s\n", funcname, lineno, sa[Date])
	}

	//-------------------------------------------------------------------
	// PayorSpecs
	//-------------------------------------------------------------------
	// t, err := CSVLoaderTransactantList(sa[PayorSpec])
	// if err != nil {
	// 	fmt.Printf("%s: line %d - invalid payor list:  %s\n", funcname, lineno, sa[PayorSpec])
	// }

	//-------------------------------------------------------------------
	// Date Due
	//-------------------------------------------------------------------
	inv.DtDue, err = rlib.StringToDate(sa[DateDue])
	if err != nil {
		return CsvErrorSensitivity, fmt.Errorf("%s: line %d - invalid due date:  %s", funcname, lineno, sa[DateDue])
	}

	//-------------------------------------------------------------------
	// DeliveredBy
	//-------------------------------------------------------------------
	inv.DeliveredBy = strings.TrimSpace(sa[DeliveredBy])

	//-------------------------------------------------------------------
	// Assessments - comma separated list of ASMIDs. Could be of the form
	// ASM00001 or simply 1.
	//-------------------------------------------------------------------
	var asmts []int64
	var mm []rlib.Assessment
	var tot = float64(0)

	s := strings.TrimSpace(sa[AssessmentSpec])
	ssa := strings.Split(s, ",")
	if len(ssa) == 0 {
		return CsvErrorSensitivity, fmt.Errorf("%s: line %d - no assessments found. You must supply at least one assessment", funcname, lineno)
	}
	RAID := int64(0) // initialize as unset...
	for i := 0; i < len(ssa); i++ {
		id := CSVLoaderGetASMID(ssa[i])
		if 0 == id {
			return CsvErrorSensitivity, fmt.Errorf("%s: line %d - invalid assessment number: %s", funcname, lineno, ssa[i])
		}
		asmts = append(asmts, id)
		// load each assessment so that we can total the amount and see if it matches Amount
		a, err := rlib.GetAssessment(ctx, id)
		if err != nil {
			return CsvErrorSensitivity, fmt.Errorf("%s: line %d -  error getting Assessment %d: %v", funcname, lineno, id, err)
		}
		if RAID == 0 { // if RAID has not been set...
			RAID = a.RAID // ...set it now
		}
		if RAID != a.RAID { // the RAID needs to be the same for every assessment, if not it's an error
			serr := fmt.Sprintf("%s: line %d -  Assessment %d belongs to Rental Agreement %d.\n", funcname, lineno, a.ASMID, a.RAID)
			return CsvErrorSensitivity, fmt.Errorf("%s\tAll Assessments must belong to the same Rental Agreement", serr)
		}

		tot += a.Amount
		mm = append(mm, a) // may need this later
	}
	inv.Amount = tot

	// build the payor list
	m, err := rlib.GetRentalAgreementPayorsInRange(ctx, RAID, &inv.Dt, &inv.DtDue) // these are the main payors
	if err != nil {
		return CsvErrorSensitivity, fmt.Errorf("%s: line %d -  Error while getting agreement payors for RAID(%d), inv.Dt(%q), inv.DtDue(%q). Error: %s", funcname, lineno, RAID, inv.Dt, inv.DtDue, err.Error())
	}
	// for i := 0; i < len(t); i++ {                                 // if there are any additional people that should receive the invoice...
	// 	var a rlib.RentalAgreementPayor // add them...
	// 	a.TCID = t[i].TCID              // as a RentalAgreementPayor struct...
	// 	m = append(m, a)                // in this array
	// }

	if err != nil {
		return CsvErrorSensitivity, fmt.Errorf("%s: line %d -  error getting Rental Agreement %d: %v", funcname, lineno, RAID, err)
	}

	//-------------------------------------------------------------------
	// We have all we need. Write the records.  First, the Invoice itself
	//-------------------------------------------------------------------
	id, err := rlib.InsertInvoice(ctx, &inv)
	if err != nil {
		return CsvErrorSensitivity, fmt.Errorf("%s: line %d -  error inserting invoice: %v", funcname, lineno, err)
	}
	// Next, its associated Assessments
	for i := 0; i < len(asmts); i++ {
		var a rlib.InvoiceAssessment
		a.InvoiceNo = id
		a.ASMID = asmts[i]
		a.BID = inv.BID
		_, err = rlib.InsertInvoiceAssessment(ctx, &a)
		if nil != err {
			err = rlib.DeleteInvoice(ctx, id)
			if err != nil {
				return CsvErrorSensitivity, fmt.Errorf("%s: line %d -  error deleting invoice(%d) : %v", funcname, lineno, id, err.Error())
			}
			return CsvErrorSensitivity, fmt.Errorf("%s: line %d -  error inserting invoice part: %v", funcname, lineno, err)
		}
	}
	// Finally, the payors
	for i := 0; i < len(m); i++ {
		var a rlib.InvoicePayor
		a.InvoiceNo = id
		a.BID = inv.BID
		a.PID = m[i].TCID
		_, err = rlib.InsertInvoicePayor(ctx, &a)
		if nil != err {
			err = rlib.DeleteInvoice(ctx, id)
			if err != nil {
				return CsvErrorSensitivity, fmt.Errorf("%s: line %d -  error deleting invoice(%d) : %v", funcname, lineno, id, err.Error())
			}
			return CsvErrorSensitivity, fmt.Errorf("%s: line %d -  error inserting invoice payor: %v", funcname, lineno, err)
		}
	}
	return 0, nil
}

// LoadInvoicesCSV loads a csv file with deposits and creates Invoice records
func LoadInvoicesCSV(ctx context.Context, fname string) []error {
	return LoadRentRollCSV(ctx, fname, CreateInvoicesFromCSV)
}
