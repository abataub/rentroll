package rrpt

import (
	"context"
	"gotable"
	"rentroll/rlib"
)

// VehicleReportTable returns a table containing a report of all
// vehicles in the supplied business
func VehicleReportTable(ctx context.Context, bid int64) gotable.Table {
	const funcname = "VehicleReportTable"
	var (
		err error
	)

	// table init
	tbl := getRRTable()

	m, err := rlib.GetVehiclesByBID(ctx, bid)
	if err != nil {
		rlib.LogAndPrintError(funcname, err)
		tbl.SetSection3(err.Error())
		return tbl
	}

	var b rlib.Business
	err = rlib.GetBusiness(ctx, bid, &b)
	if err != nil {
		rlib.LogAndPrintError(funcname, err)
		tbl.SetSection3(err.Error())
		return tbl
	}

	const (
		VID                 = 0
		Business            = iota
		Type                = iota
		Make                = iota
		Model               = iota
		Color               = iota
		Year                = iota
		LicensePlateState   = iota
		LicensePlateNumber  = iota
		ParkingPermitNumber = iota
		User                = iota
		CellPhone           = iota
		WorkPhone           = iota
		Email               = iota
		DtStart             = iota
		DtStop              = iota
	)

	tbl.AddColumn("VID", 12, gotable.CELLSTRING, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("BUD", 5, gotable.CELLSTRING, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("Type", 15, gotable.CELLSTRING, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("Make", 20, gotable.CELLSTRING, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("Model", 20, gotable.CELLSTRING, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("Color", 12, gotable.CELLSTRING, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("Year", 5, gotable.CELLINT, gotable.COLJUSTIFYRIGHT)
	tbl.AddColumn("License Plate State", 2, gotable.CELLSTRING, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("License Plate Number", 12, gotable.CELLSTRING, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("Parking Permit Number", 12, gotable.CELLSTRING, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("User", 35, gotable.CELLSTRING, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("Cell Phone", 35, gotable.CELLSTRING, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("Work Phone", 35, gotable.CELLSTRING, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("Email", 50, gotable.CELLSTRING, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("DtStart", 8, gotable.CELLDATE, gotable.COLJUSTIFYLEFT)
	tbl.AddColumn("DtStop", 8, gotable.CELLDATE, gotable.COLJUSTIFYLEFT)

	for i := 0; i < len(m); i++ {
		var t rlib.Transactant
		if m[i].TCID > 0 {
			err = rlib.GetTransactant(ctx, m[i].TCID, &t)
		}

		// just before adding row to gotable, modify end date if applicable based app.dateMode
		rlib.HandleInterfaceEDI(&m[i], bid)

		tbl.AddRow()
		tbl.Puts(-1, VID, m[i].IDtoString())
		tbl.Puts(-1, Business, b.Designation)
		tbl.Puts(-1, Type, m[i].VehicleType)
		tbl.Puts(-1, Make, m[i].VehicleMake)
		tbl.Puts(-1, Model, m[i].VehicleModel)
		tbl.Puts(-1, Color, m[i].VehicleColor)
		tbl.Puti(-1, Year, m[i].VehicleYear)
		tbl.Puts(-1, LicensePlateState, m[i].LicensePlateState)
		tbl.Puts(-1, LicensePlateNumber, m[i].LicensePlateNumber)
		tbl.Puts(-1, ParkingPermitNumber, m[i].ParkingPermitNumber)
		tbl.Puts(-1, User, t.GetUserName())
		tbl.Puts(-1, CellPhone, t.CellPhone)
		tbl.Puts(-1, WorkPhone, t.WorkPhone)
		tbl.Puts(-1, Email, t.PrimaryEmail)
		tbl.Putd(-1, DtStart, m[i].DtStart)
		tbl.Putd(-1, DtStop, m[i].DtStop)
	}
	//tbl.Sort(0, len(tbl.Row)-1, 1)
	// tbl.AddLineAfter(len(tbl.Row) - 1)                          // a line after the last row in the table
	// tbl.InsertSumRow(len(tbl.Row), 0, len(tbl.Row)-1, []int{4}) // insert @ len essentially adds a row.  Only want to sum column 4
	tbl.TightenColumns()
	return tbl
}

// VehicleReport returns a text report for vehicles
// ri contains the BID needed by this report
func VehicleReport(ctx context.Context, ri *ReporterInfo) string {
	t := VehicleReportTable(ctx, ri.Bid)
	s, err := t.SprintTable()
	if err != nil {
		rlib.Ulog("VehicleReport: error = %s", err.Error())
	}
	return s
}
