package rcsv

import (
	"context"
	"fmt"
	"rentroll/rlib"
	"strconv"
	"strings"
)

// CSV file format:
//   0   1     2        3         4         5        6                  7                   8
// 	BUD, TCID, VehicleMake, VehicleModel, VehicleColor, VehicleYear, LicensePlateState, LicensePlateNumber, ParkingPermitNumber
// 	REX, 1
// 	REX, 1
// 	REX, 1
// 	REX, 1
// 	REX, 1
// 	REX, 1
// 	REX, 1

// CreateVehicleFromCSV reads a rental specialty type string array and creates a database record for the rental specialty type.
// If the return value is not 0, abort the csv load
func CreateVehicleFromCSV(ctx context.Context, sa []string, lineno int) (int, error) {
	const funcname = "CreateVehicleFromCSV"

	var (
		err error
		tr  rlib.Transactant
		t   rlib.Vehicle
	)

	const (
		BUD                 = 0
		TCID                = iota
		VehicleType         = iota
		VehicleMake         = iota
		VehicleModel        = iota
		VehicleColor        = iota
		VehicleYear         = iota
		LicensePlateState   = iota
		LicensePlateNumber  = iota
		ParkingPermitNumber = iota
		DtStart             = iota
		DtStop              = iota
	)

	// csvCols is an array that defines all the columns that should be in this csv file
	var csvCols = []CSVColumn{
		{"BUD", BUD},
		{"User", TCID},
		{"VehicleType", VehicleType},
		{"VehicleMake", VehicleMake},
		{"VehicleModel", VehicleModel},
		{"VehicleColor", VehicleColor},
		{"VehicleYear", VehicleYear},
		{"LicensePlateState", LicensePlateState},
		{"LicensePlateNumber", LicensePlateNumber},
		{"ParkingPermitNumber", ParkingPermitNumber},
		{"DtStart", DtStart},
		{"DtStop", DtStop},
	}

	y, err := ValidateCSVColumnsErr(csvCols, sa, funcname, lineno)
	if y {
		return 1, err
	}
	if lineno == 1 {
		return 0, nil // we've validated the col headings, all is good, send the next line
	}

	for i := 0; i < len(sa); i++ {
		s := strings.TrimSpace(sa[i])
		switch i {
		case BUD: // business
			des := strings.ToLower(strings.TrimSpace(sa[0])) // this should be BUD

			//-------------------------------------------------------------------
			// Make sure the rlib.Business is in the database
			//-------------------------------------------------------------------
			if len(des) > 0 { // make sure it's not empty
				b1, err := rlib.GetBusinessByDesignation(ctx, des) // see if we can find the biz
				if err != nil {
					return CsvErrorSensitivity, fmt.Errorf("%s: line %d, error while getting business by designation(%s): %s", funcname, lineno, des, err.Error())
				}
				if len(b1.Designation) == 0 {
					return CsvErrorSensitivity, fmt.Errorf("%s: line %d, Business with designation %s does not exist", funcname, lineno, sa[0])
				}
				tr.BID = b1.BID
			}
		case TCID:
			tr, err = rlib.GetTransactantByPhoneOrEmail(ctx, tr.BID, s)
			if err != nil {
				return CsvErrorSensitivity, fmt.Errorf("%s: line %d, error getting Transactant with %s listed as a phone or email: %s", funcname, lineno, s, err.Error())
			}
			if tr.TCID < 1 {
				return CsvErrorSensitivity, fmt.Errorf("%s: line %d, no Transactant found with %s listed as a phone or email", funcname, lineno, s)
			}
			t.TCID = tr.TCID
		case VehicleType:
			t.VehicleType = s
		case VehicleMake:
			t.VehicleMake = s
		case VehicleModel:
			t.VehicleModel = s
		case VehicleColor:
			t.VehicleColor = s
		case VehicleYear:
			if len(s) > 0 {
				i, err := strconv.Atoi(strings.TrimSpace(s))
				if err != nil {
					return CsvErrorSensitivity, fmt.Errorf("%s: line %d - VehicleYear value is invalid: %s", funcname, lineno, s)
				}
				t.VehicleYear = int64(i)
			}
		case LicensePlateState:
			t.LicensePlateState = s
		case LicensePlateNumber:
			t.LicensePlateNumber = s
		case ParkingPermitNumber:
			t.ParkingPermitNumber = s
		case DtStart:
			if len(s) > 0 {
				t.DtStart, err = rlib.StringToDate(s) // required field
				if err != nil {
					return CsvErrorSensitivity, fmt.Errorf("%s: line %d - invalid start date.  Error = %s", funcname, lineno, err.Error())
				}
			}
		case DtStop:
			if len(s) > 0 {
				t.DtStop, err = rlib.StringToDate(s) // required field
				if err != nil {
					return CsvErrorSensitivity, fmt.Errorf("%s: line %d - invalid start date.  Error = %s", funcname, lineno, err.Error())
				}
			}
		default:
			return CsvErrorSensitivity, fmt.Errorf("i = %d, unknown field", i)
		}
	}

	//-------------------------------------------------------------------
	// Check for duplicate...
	//-------------------------------------------------------------------
	// TODO(Steve): ignore error?
	tm, _ := rlib.GetVehiclesByLicensePlate(ctx, t.LicensePlateNumber)
	for i := 0; i < len(tm); i++ {
		if t.LicensePlateNumber == tm[i].LicensePlateNumber && t.LicensePlateState == tm[i].LicensePlateState {
			return CsvErrorSensitivity, fmt.Errorf("%s: line %d - vehicle with License Plate %s in State = %s already exists", funcname, lineno, t.LicensePlateNumber, t.LicensePlateState)
		}
	}

	//-------------------------------------------------------------------
	// OK, just insert the records and we're done
	//-------------------------------------------------------------------
	t.TCID = tr.TCID
	t.BID = tr.BID
	vid, err := rlib.InsertVehicle(ctx, &t)
	if nil != err {
		return CsvErrorSensitivity, fmt.Errorf("%s: line %d - error inserting Vehicle = %v", funcname, lineno, err)
	}

	if vid == 0 {
		return CsvErrorSensitivity, fmt.Errorf("%s: line %d - after InsertVehicle vid = %d", funcname, lineno, vid)
	}
	return 0, nil
}

// LoadVehicleCSV loads a csv file with vehicles
func LoadVehicleCSV(ctx context.Context, fname string) []error {
	return LoadRentRollCSV(ctx, fname, CreateVehicleFromCSV)
}
