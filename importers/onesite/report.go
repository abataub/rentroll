package onesite

import (
	"fmt"
	"rentroll/importers/core"
	"rentroll/rcsv"
	"rentroll/rlib"
	"rentroll/rrpt"
	"sort"
	"strconv"
	"strings"
	"time"
)

// getReportHeader used to get report header first
func getReportHeader(importTime time.Time, csvFile string) string {
	// get date
	importYear, importMonth, importDate := importTime.Date()
	importDt := fmt.Sprintf("%d/%d/%d", importMonth, importDate, importYear)

	// get local timezone
	tz, _ := importTime.Zone()

	// format time in Kitchen
	kitchenFormat := importTime.Format(time.Kitchen)

	importLocalTime := kitchenFormat + " " + tz

	reportHeader := ""
	reportHeader += "Accord RentRoll Onesite Importer\n"
	reportHeader += "Date: " + importDt + "\n"
	reportHeader += "Time: " + importLocalTime + "\n"
	reportHeader += "Import File: " + csvFile + "\n"
	reportHeader += "\n"
	return reportHeader
}

// generateSummaryReport used to generate summary report from argued struct
func generateSummaryReport(
	summaryCount map[int]map[string]int,
	BID int64,
) string {
	var report string

	tableTitle := "SUMMARY"
	report += strings.Repeat("=", len(tableTitle))
	report += "\n" + tableTitle + "\n"
	report += strings.Repeat("=", len(tableTitle))
	report += "\n"

	var tbl rlib.Table
	tbl.Init()
	tbl.AddColumn("Data Type", 30, rlib.CELLSTRING, rlib.COLJUSTIFYLEFT)
	tbl.AddColumn("Total Possible", 10, rlib.CELLSTRING, rlib.COLJUSTIFYLEFT)
	tbl.AddColumn("Total Imported", 10, rlib.CELLSTRING, rlib.COLJUSTIFYLEFT)
	tbl.AddColumn("Issues", 10, rlib.CELLSTRING, rlib.COLJUSTIFYLEFT)

	// evaluate import count
	core.GetImportedCount(summaryCount, BID)

	// sort indices
	summaryCountIndexes := []int{}
	for index := range summaryCount {
		summaryCountIndexes = append(summaryCountIndexes, index)
	}
	sort.Ints(summaryCountIndexes)

	for _, dbType := range summaryCountIndexes {

		// get each db type map
		countMap := summaryCount[dbType]

		// add row
		tbl.AddRow()
		tbl.Puts(-1, 0, core.DBTypeMap[dbType])
		tbl.Puts(-1, 1, strconv.Itoa(countMap["possible"]))
		tbl.Puts(-1, 2, strconv.Itoa(countMap["imported"]))
		tbl.Puts(-1, 3, strconv.Itoa(countMap["issues"]))
	}

	report += tbl.SprintTable(rlib.RPTTEXT)
	report += "\n"

	return report
}

// generateDetailedReport gives detailed report with (rowNumber, unit, db type, reason)
func generateDetailedReport(
	csvErrors map[int][]string,
	unitMap map[int]string,
	summaryCount map[int]map[string]int,
) (string, bool) {

	// return detailed report, tell program should it generate csv report?
	// in case of no errors, but has some warnings then csv report needs to be generated

	csvReportGenerate := true

	var detailedReport string
	tableTitle := "DETAILED REPORT BY UNIT"
	detailedReport += strings.Repeat("=", len(tableTitle))
	detailedReport += "\n" + tableTitle + "\n"
	detailedReport += strings.Repeat("=", len(tableTitle))
	detailedReport += "\n"

	var tbl rlib.Table
	tbl.Init()
	tbl.AddColumn("Input Line", 6, rlib.CELLSTRING, rlib.COLJUSTIFYLEFT)
	tbl.AddColumn("Unit Name", 20, rlib.CELLSTRING, rlib.COLJUSTIFYLEFT)
	// tbl.AddColumn("RentRoll DB Type", 20, rlib.CELLSTRING, rlib.COLJUSTIFYLEFT)
	tbl.AddColumn("Description", 100, rlib.CELLSTRING, rlib.COLJUSTIFYLEFT)

	csvErrorIndexes := []int{}
	for rowIndex := range csvErrors {
		csvErrorIndexes = append(csvErrorIndexes, rowIndex)
	}
	sort.Ints(csvErrorIndexes)

	for _, rowIndex := range csvErrorIndexes {

		// get error from index
		reportError := csvErrors[rowIndex]

		// check that rowIndex is -1
		// -1 means no data found in csv
		if rowIndex == -1 {
			tbl.AddRow()
			tbl.Puts(-1, 0, "")
			tbl.Puts(-1, 1, "")
			// tbl.Puts(-1, 2, "") //rentroll db type
			tbl.Puts(-1, 2, reportError[0])

			// append detailed section
			detailedReport += tbl.SprintTable(rlib.RPTTEXT)

			// return
			csvReportGenerate = false
			return detailedReport, csvReportGenerate
		}

		// get unit from map
		unit, _ := unitMap[rowIndex]

		// used to separate errors, warnings
		rowErrors, rowWarnings := []string{}, []string{}

		for _, reason := range reportError {
			if strings.HasPrefix(reason, "E:") {

				// if any error captured then do not generate csv report
				csvReportGenerate = false

				// red color
				reason = strings.Replace(reason, "E:", "", -1)

				// if error not appended already then
				if !core.StringInSlice(reason, rowErrors) {
					rowErrors = append(rowErrors, reason)
				}
			}
			if strings.HasPrefix(reason, "W:") {
				// orange color
				reason = strings.Replace(reason, "W:", "", -1)

				// if warning not appended already then
				if !core.StringInSlice(reason, rowWarnings) {
					rowWarnings = append(rowWarnings, reason)
				}
			}
		}

		// first put errors
		for _, errorText := range rowErrors {
			errorText := strings.Split(errorText, ">:")
			dbType, reason := errorText[0], errorText[1]
			dbType = strings.Replace(dbType, "<", "", -1)
			dbTypeInt, _ := strconv.Atoi(dbType)

			// count issues in summary report
			summaryCount[dbTypeInt]["issues"]++

			// put in tabl
			tbl.AddRow()
			tbl.Puts(-1, 0, strconv.Itoa(rowIndex))
			tbl.Puts(-1, 1, unit)
			// tbl.Puts(-1, 2, core.DBTypeMap[dbTypeInt])
			tbl.Puts(-1, 2, reason)
		}

		// then warnings
		for _, warningText := range rowWarnings {
			warningText := strings.Split(warningText, ">:")
			dbType, reason := warningText[0], warningText[1]
			dbType = strings.Replace(dbType, "<", "", -1)
			dbTypeInt, _ := strconv.Atoi(dbType)

			// prefixed with "Warning: "
			reason = "Warning: " + reason

			// count issues in summary report
			summaryCount[dbTypeInt]["issues"]++

			tbl.AddRow()
			tbl.Puts(-1, 0, strconv.Itoa(rowIndex))
			tbl.Puts(-1, 1, unit)
			// tbl.Puts(-1, 2, core.DBTypeMap[dbTypeInt])
			tbl.Puts(-1, 2, reason)
		}
	}

	// append detailed section
	detailedReport += tbl.SprintTable(rlib.RPTTEXT)
	detailedReport += "\n"

	// return
	return detailedReport, csvReportGenerate
}

// generateRCSVReport return report for all type of csv defined here from rcsv
func generateRCSVReport(
	business *rlib.Business,
	summaryCount map[int]map[string]int,
	csvFile string,
) string {

	var r = []rrpt.ReporterInfo{
		{ReportNo: 5, OutputFormat: rlib.RPTTEXT, Handler: rcsv.RRreportRentableTypes, Bid: business.BID},
		{ReportNo: 6, OutputFormat: rlib.RPTTEXT, Handler: rcsv.RRreportRentables, Bid: business.BID},
		{ReportNo: 7, OutputFormat: rlib.RPTTEXT, Handler: rcsv.RRreportPeople, Bid: business.BID},
		{ReportNo: 9, OutputFormat: rlib.RPTTEXT, Handler: rcsv.RRreportRentalAgreements, Bid: business.BID},
		{ReportNo: 14, OutputFormat: rlib.RPTTEXT, Handler: rcsv.RRreportCustomAttributes, Bid: business.BID},
		{ReportNo: 15, OutputFormat: rlib.RPTTEXT, Handler: rcsv.RRreportCustomAttributeRefs, Bid: business.BID},
	}

	var rcsvReport string

	title := fmt.Sprintf("RECORDS FOR BUSINESS UNIT DESIGNATION: %s", business.Name)
	rcsvReport += strings.Repeat("=", len(title))
	rcsvReport += "\n" + title + "\n"
	rcsvReport += strings.Repeat("=", len(title))
	rcsvReport += "\n"

	for i := 0; i < len(r); i++ {
		rcsvReport += r[i].Handler(&r[i])
		rcsvReport += strings.Repeat("=", 80)
		rcsvReport += "\n"
	}

	return rcsvReport
}

// successReport generates success report
func successReport(
	business *rlib.Business,
	summaryCount map[int]map[string]int,
	csvFile string,
	debugMode int,
	currentTime time.Time,
) string {

	var report string

	// import header line for report
	report = getReportHeader(currentTime, csvFile)

	// append summary report
	report += generateSummaryReport(summaryCount, business.BID)

	// csv report for all types if testmode is on
	if debugMode == 1 {
		report += generateRCSVReport(business, summaryCount, csvFile)
	}

	// return
	return report
}

// errorReporting used to report the errors for onesite csv
func errorReporting(
	business *rlib.Business,
	csvErrors map[int][]string,
	unitMap map[int]string,
	summaryCount map[int]map[string]int,
	csvFile string,
	debugMode int,
	currentTime time.Time,
) (string, bool) {

	var errReport string

	// import header line for report
	errReport = getReportHeader(currentTime, csvFile)

	// first generate detailed report because summary count also be used in it
	// but append it after summary report
	detailedReport, csvReportGenerate := generateDetailedReport(csvErrors, unitMap, summaryCount)

	// append summary report
	errReport += generateSummaryReport(summaryCount, business.BID)

	// append detailedReport
	errReport += detailedReport

	// if true then generate csv report
	// specia case: when there are only warnings but no errors
	if csvReportGenerate && debugMode == 1 {
		errReport += generateRCSVReport(business, summaryCount, csvFile)
	}

	// return
	return errReport, csvReportGenerate
}
