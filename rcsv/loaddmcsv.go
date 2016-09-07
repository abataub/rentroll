package rcsv

import (
	"rentroll/rlib"
	"strings"
)

// Deposit Method CSV Loader
//        CSV file format:
//        0    1
//        BUD, Name
//        REX, Hand Delivery
//        REX, Scanned Batch
//        REX, CC Shift 4, CC NAYAX, ACH, US Mail...

// CreateDepositMethod creates a database record for the values supplied in sa[]
func CreateDepositMethod(sa []string, lineno int) int {
	funcname := "CreateDepositMethod"
	var a rlib.DepositMethod // start the struct we'll be saving

	const (
		BUD  = 0
		Name = iota
	)

	// csvCols is an array that defines all the columns that should be in this csv file
	var csvCols = []CSVColumn{
		{"BUD", BUD},
		{"Name", Name},
	}

	if ValidateCSVColumns(csvCols, sa, funcname, lineno) > 0 {
		return 1
	}
	if lineno == 1 {
		return 0
	}

	//-------------------------------------------------------------------
	// Make sure the rlib.Business is in the database
	//-------------------------------------------------------------------
	des := strings.ToLower(strings.TrimSpace(sa[BUD])) // this should be BUD
	if len(des) > 0 {                                  // make sure it's not empty
		b1 := rlib.GetBusinessByDesignation(des) // see if we can find the biz
		if len(b1.Designation) == 0 {
			rlib.Ulog("%s: line %d, Business with designation %s does not exist\n", funcname, lineno, sa[BUD])
			return CsvErrorSensitivity
		}
		a.BID = b1.BID
	}

	//-------------------------------------------------------------------
	// Check to see if this name type is already in the database
	//-------------------------------------------------------------------
	name := strings.TrimSpace(sa[Name]) // this should be the RATemplateName
	if len(name) > 0 {
		a1, err := rlib.GetDepositMethodByName(a.BID, name)
		if err != nil {
			s := err.Error()
			if !strings.Contains(s, "no rows") {
				rlib.Ulog("%s: line %d -   returned error %v\n", funcname, lineno, err)
			}
		}
		if len(a1.Name) > 0 {
			rlib.Ulog("%s: line %d - DepositMethod with Name %s already exists\n", funcname, lineno, name)
			return CsvErrorSensitivity
		}
	}

	a.Name = name
	rlib.InsertDepositMethod(&a)
	return 0
}

// LoadDepositMethodsCSV loads a csv file with assessment types and processes each one
func LoadDepositMethodsCSV(fname string) {
	t := rlib.LoadCSV(fname)
	for i := 0; i < len(t); i++ {
		if CreateDepositMethod(t[i], i+1) > 0 {
			return
		}
	}
}