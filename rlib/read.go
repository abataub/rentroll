package rlib

import "database/sql"

// As the database structures change, having the calls that Read from the database into these structures located
// in one place simplifies maintenance

// ReadAccountDepository reads a full AccountDepository structure from the database based on the supplied row object
// func ReadAccountDepository(row *sql.Row, a *AccountDepository) error {
// 	return row.Scan(&a.ADID, &a.BID, &a.LID, &a.DEPID, &a.LastModTime, &a.LastModBy)
// }

// // ReadAccountDepositories reads a full AccountDepository structure from the database based on the supplied rows object
// func ReadAccountDepositories(rows *sql.Rows, a *AccountDepository) error {
// 	return rows.Scan(&a.ADID, &a.BID, &a.LID, &a.DEPID, &a.LastModTime, &a.LastModBy)
// }

// ReadAR reads a full AR structure from the database based on the supplied row object
func ReadAR(row *sql.Row, a *AR) error {
	return row.Scan(&a.ARID, &a.BID, &a.Name, &a.ARType, &a.DebitLID, &a.CreditLID, &a.Description, &a.DtStart, &a.DtStop, &a.LastModTime, &a.LastModBy)
}

// ReadARs reads a full AR structure from the database based on the supplied rows object
func ReadARs(rows *sql.Rows, a *AR) error {
	return rows.Scan(&a.ARID, &a.BID, &a.Name, &a.ARType, &a.DebitLID, &a.CreditLID, &a.Description, &a.DtStart, &a.DtStop, &a.LastModTime, &a.LastModBy)
}

// ReadAssessment reads a full Assessment structure of data from the database based on the supplied Rows pointer.
func ReadAssessment(row *sql.Row, a *Assessment) {
	Errcheck(row.Scan(&a.ASMID, &a.PASMID, &a.BID, &a.RID, &a.ATypeLID, &a.RAID, &a.Amount,
		&a.Start, &a.Stop, &a.RentCycle, &a.ProrationCycle, &a.InvoiceNo, &a.AcctRule, &a.ARID, &a.Comment,
		&a.LastModTime, &a.LastModBy))
}

// ReadAssessments reads a full Assessment structure of data from the database based on the supplied Rows pointer.
func ReadAssessments(rows *sql.Rows, a *Assessment) {
	Errcheck(rows.Scan(&a.ASMID, &a.PASMID, &a.BID, &a.RID, &a.ATypeLID, &a.RAID, &a.Amount,
		&a.Start, &a.Stop, &a.RentCycle, &a.ProrationCycle, &a.InvoiceNo, &a.AcctRule, &a.ARID, &a.Comment,
		&a.LastModTime, &a.LastModBy))
}

// ReadBusiness reads a full Business structure from the database based on the supplied row object
func ReadBusiness(row *sql.Row, a *Business) {
	Errcheck(row.Scan(&a.BID, &a.Designation, &a.Name, &a.DefaultRentCycle, &a.DefaultProrationCycle, &a.DefaultGSRPC, &a.LastModTime, &a.LastModBy))
}

// ReadBusinesses reads a full Business structure from the database based on the supplied rows object
func ReadBusinesses(rows *sql.Rows, a *Business) {
	Errcheck(rows.Scan(&a.BID, &a.Designation, &a.Name, &a.DefaultRentCycle, &a.DefaultProrationCycle, &a.DefaultGSRPC, &a.LastModTime, &a.LastModBy))
}

// ReadCustomAttribute reads a full CustomAttribute structure from the database based on the supplied row object
func ReadCustomAttribute(row *sql.Row, a *CustomAttribute) {
	Errcheck(row.Scan(&a.CID, &a.BID, &a.Type, &a.Name, &a.Value, &a.Units, &a.LastModTime, &a.LastModBy))
}

// ReadCustomAttributes reads a full CustomAttribute structure from the database based on the supplied rows object
func ReadCustomAttributes(rows *sql.Rows, a *CustomAttribute) {
	Errcheck(rows.Scan(&a.CID, &a.BID, &a.Type, &a.Name, &a.Value, &a.Units, &a.LastModTime, &a.LastModBy))
}

// ReadCustomAttributeRef reads a full CustomAttributeRef structure from the database based on the supplied row object
func ReadCustomAttributeRef(row *sql.Row, a *CustomAttributeRef) {
	Errcheck(row.Scan(&a.ElementType, &a.BID, &a.ID, &a.CID))
}

// ReadCustomAttributeRefs reads a full CustomAttributeRef structure from the database based on the supplied rows object
func ReadCustomAttributeRefs(rows *sql.Rows, a *CustomAttributeRef) {
	Errcheck(rows.Scan(&a.ElementType, &a.BID, &a.ID, &a.CID))
}

// ReadDemandSource reads a full DemandSource structure from the database based on the supplied row object
func ReadDemandSource(row *sql.Row, a *DemandSource) {
	Errcheck(row.Scan(&a.SourceSLSID, &a.BID, &a.Name, &a.Industry, &a.LastModTime, &a.LastModBy))
}

// ReadDemandSources reads a full DemandSource structure from the database based on the supplied rows object
func ReadDemandSources(rows *sql.Rows, a *DemandSource) {
	Errcheck(rows.Scan(&a.SourceSLSID, &a.BID, &a.Name, &a.Industry, &a.LastModTime, &a.LastModBy))
}

// ReadDeposit reads a full Deposit structure from the database based on the supplied row object
func ReadDeposit(row *sql.Row, a *Deposit) error {
	return row.Scan(&a.DID, &a.BID, &a.DEPID, &a.DPMID, &a.Dt, &a.Amount, &a.LastModTime, &a.LastModBy)
}

// ReadDeposits reads a full Deposit structure from the database based on the supplied rows object
func ReadDeposits(rows *sql.Rows, a *Deposit) error {
	return rows.Scan(&a.DID, &a.BID, &a.DEPID, &a.DPMID, &a.Dt, &a.Amount, &a.LastModTime, &a.LastModBy)
}

// ReadDepository reads a full Depository structure from the database based on the supplied row object
func ReadDepository(row *sql.Row, a *Depository) error {
	return row.Scan(&a.DEPID, &a.BID, &a.LID, &a.Name, &a.AccountNo, &a.LastModTime, &a.LastModBy)
}

// ReadDepositories reads a full Depository structure from the database based on the supplied rows object
func ReadDepositories(rows *sql.Rows, a *Depository) error {
	return rows.Scan(&a.DEPID, &a.BID, &a.LID, &a.Name, &a.AccountNo, &a.LastModTime, &a.LastModBy)
}

// ReadDepositPart reads a full DepositPart structure from the database based on the supplied row object
func ReadDepositPart(row *sql.Row, a *DepositPart) {
	Errcheck(row.Scan(&a.DID, &a.BID, &a.RCPTID))
}

// ReadDepositParts reads a full DepositPart structure from the database based on the supplied row object
func ReadDepositParts(rows *sql.Rows, a *DepositPart) {
	Errcheck(rows.Scan(&a.DID, &a.BID, &a.RCPTID))
}

// ReadGLAccount reads a full Ledger structure of data from the database based on the supplied Rows pointer.
func ReadGLAccount(row *sql.Row, a *GLAccount) {
	Errcheck(row.Scan(&a.LID, &a.PLID, &a.BID, &a.RAID, &a.GLNumber,
		&a.Status, &a.Type, &a.Name, &a.AcctType, &a.RAAssociated, &a.AllowPost, &a.RARequired,
		&a.ManageToBudget, &a.Description, &a.LastModTime, &a.LastModBy))
}

// ReadGLAccounts reads a full Ledger structure of data from the database based on the supplied Rows pointer.
func ReadGLAccounts(rows *sql.Rows, a *GLAccount) {
	Errcheck(rows.Scan(&a.LID, &a.PLID, &a.BID, &a.RAID, &a.GLNumber,
		&a.Status, &a.Type, &a.Name, &a.AcctType, &a.RAAssociated, &a.AllowPost, &a.RARequired,
		&a.ManageToBudget, &a.Description, &a.LastModTime, &a.LastModBy))
}

// ReadInvoice reads a full Invoice structure of data from the database based on the supplied Rows pointer.
func ReadInvoice(row *sql.Row, a *Invoice) {
	Errcheck(row.Scan(&a.InvoiceNo, &a.BID, &a.Dt, &a.DtDue, &a.Amount, &a.DeliveredBy, &a.LastModTime, &a.LastModBy))
}

// ReadInvoices reads a full Invoice structure of data from the database based on the supplied Rows pointer.
func ReadInvoices(rows *sql.Rows, a *Invoice) {
	Errcheck(rows.Scan(&a.InvoiceNo, &a.BID, &a.Dt, &a.DtDue, &a.Amount, &a.DeliveredBy, &a.LastModTime, &a.LastModBy))
}

// ReadInvoiceAssessments reads a full InvoiceAssessment structure of data from the database based on the supplied Rows pointer.
func ReadInvoiceAssessments(rows *sql.Rows, a *InvoiceAssessment) {
	Errcheck(rows.Scan(&a.InvoiceNo, &a.BID, &a.ASMID))
}

// ReadInvoicePayors reads a full InvoicePayor structure of data from the database based on the supplied Rows pointer.
func ReadInvoicePayors(rows *sql.Rows, a *InvoicePayor) {
	Errcheck(rows.Scan(&a.InvoiceNo, &a.BID, &a.PID))
}

// ReadJournal reads a full Journal structure of data from the database based on the supplied Rows pointer.
func ReadJournal(row *sql.Row, a *Journal) {
	Errcheck(row.Scan(&a.JID, &a.BID, &a.Dt, &a.Amount, &a.Type, &a.ID, &a.Comment, &a.LastModTime, &a.LastModBy))
}

// ReadJournals reads a full Journal structure of data from the database based on the supplied Rows pointer.
func ReadJournals(rows *sql.Rows, a *Journal) {
	Errcheck(rows.Scan(&a.JID, &a.BID, &a.Dt, &a.Amount, &a.Type, &a.ID, &a.Comment, &a.LastModTime, &a.LastModBy))
}

// ReadJournalAllocation reads a full JournalAllocation structure of data from the database based on the supplied Rows pointer.
func ReadJournalAllocation(row *sql.Row, a *JournalAllocation) {
	Errcheck(row.Scan(&a.JAID, &a.BID, &a.JID, &a.RID, &a.RAID, &a.Amount, &a.ASMID, &a.AcctRule))
}

// ReadJournalAllocations reads a full JournalAllocation structure of data from the database based on the supplied Rows pointer.
func ReadJournalAllocations(rows *sql.Rows, a *JournalAllocation) {
	Errcheck(rows.Scan(&a.JAID, &a.BID, &a.JID, &a.RID, &a.RAID, &a.Amount, &a.ASMID, &a.AcctRule))
}

// ReadLedgerEntry reads a full LedgerEntry structure of data from the database based on the supplied Rows pointer.
func ReadLedgerEntry(row *sql.Row, a *LedgerEntry) {
	Errcheck(row.Scan(&a.LEID, &a.BID, &a.JID, &a.JAID, &a.LID, &a.RAID, &a.RID, &a.Dt, &a.Amount, &a.Comment, &a.LastModTime, &a.LastModBy))
}

// ReadLedgerEntries reads a full LedgerEntry structure of data from the database based on the supplied Rows pointer.
func ReadLedgerEntries(rows *sql.Rows, a *LedgerEntry) {
	Errcheck(rows.Scan(&a.LEID, &a.BID, &a.JID, &a.JAID, &a.LID, &a.RAID, &a.RID, &a.Dt, &a.Amount, &a.Comment, &a.LastModTime, &a.LastModBy))
}

// ReadRentableMarketRate reads a full RentableMarketRate structure of data from the database based on the supplied Rows pointer.
func ReadRentableMarketRate(row *sql.Row, a *RentableMarketRate) {
	Errcheck(row.Scan(&a.RTID, &a.BID, &a.MarketRate, &a.DtStart, &a.DtStop))
}

// ReadRentableMarketRates reads a full RentableMarketRate structure of data from the database based on the supplied Rows pointer.
func ReadRentableMarketRates(rows *sql.Rows, a *RentableMarketRate) {
	Errcheck(rows.Scan(&a.RTID, &a.BID, &a.MarketRate, &a.DtStart, &a.DtStop))
}

// ReadLedgerMarker reads a full LedgerMarker structure of data from the database based on the supplied Rows pointer.
func ReadLedgerMarker(row *sql.Row, a *LedgerMarker) {
	Errcheck(row.Scan(&a.LMID, &a.LID, &a.BID, &a.RAID, &a.RID, &a.Dt, &a.Balance, &a.State, &a.LastModTime, &a.LastModBy))
}

// ReadLedgerMarkers reads a full LedgerMarker structure of data from the database based on the supplied Rows pointer.
func ReadLedgerMarkers(rows *sql.Rows, a *LedgerMarker) {
	Errcheck(rows.Scan(&a.LMID, &a.LID, &a.BID, &a.RAID, &a.RID, &a.Dt, &a.Balance, &a.State, &a.LastModTime, &a.LastModBy))
}

// ReadNote reads a full Note structure from the database based on the supplied row object
func ReadNote(row *sql.Row, a *Note) {
	Errcheck(row.Scan(&a.NID, &a.BID, &a.NLID, &a.PNID, &a.NTID, &a.RID, &a.RAID, &a.TCID, &a.Comment, &a.LastModTime, &a.LastModBy))
}

// ReadNotes reads a full Note structure from the database based on the supplied row object
func ReadNotes(rows *sql.Rows, a *Note) {
	Errcheck(rows.Scan(&a.NID, &a.BID, &a.NLID, &a.PNID, &a.NTID, &a.RID, &a.RAID, &a.TCID, &a.Comment, &a.LastModTime, &a.LastModBy))
}

// ReadPaymentType reads a full PaymentType structure from the database based on the supplied row object
func ReadPaymentType(row *sql.Row, a *PaymentType) {
	Errcheck(row.Scan(&a.PMTID, &a.BID, &a.Name, &a.Description, &a.LastModTime, &a.LastModBy))
}

// ReadPaymentTypes reads a full PaymentType structure from the database based on the supplied rows object
func ReadPaymentTypes(rows *sql.Rows, a *PaymentType) {
	Errcheck(rows.Scan(&a.PMTID, &a.BID, &a.Name, &a.Description, &a.LastModTime, &a.LastModBy))
}

// ReadPayor reads a full Payor structure from the database based on the supplied row object
func ReadPayor(row *sql.Row, a *Payor) {
	Errcheck(row.Scan(&a.TCID, &a.BID, &a.CreditLimit, &a.TaxpayorID, &a.AccountRep, &a.EligibleFuturePayor, &a.LastModTime, &a.LastModBy))
}

// ReadPayors reads a full Payor structure from the database based on the supplied rows object
func ReadPayors(rows *sql.Rows, a *Payor) {
	Errcheck(rows.Scan(&a.TCID, &a.BID, &a.CreditLimit, &a.TaxpayorID, &a.AccountRep, &a.EligibleFuturePayor, &a.LastModTime, &a.LastModBy))
}

// ReadProspect reads a full Prospect structure from the database based on the supplied row object
func ReadProspect(row *sql.Row, a *Prospect) {
	Errcheck(row.Scan(&a.TCID, &a.BID, &a.EmployerName, &a.EmployerStreetAddress,
		&a.EmployerCity, &a.EmployerState, &a.EmployerPostalCode, &a.EmployerEmail, &a.EmployerPhone, &a.Occupation,
		&a.ApplicationFee, &a.DesiredUsageStartDate, &a.RentableTypePreference, &a.FLAGS, &a.Approver, &a.DeclineReasonSLSID,
		&a.OtherPreferences, &a.FollowUpDate, &a.CSAgent, &a.OutcomeSLSID, &a.FloatingDeposit, &a.RAID,
		&a.LastModTime, &a.LastModBy))
}

// ReadProspects reads a full Prospect structure from the database based on the supplied rows object
func ReadProspects(rows *sql.Rows, a *Prospect) {
	Errcheck(rows.Scan(&a.TCID, &a.BID, &a.EmployerName, &a.EmployerStreetAddress,
		&a.EmployerCity, &a.EmployerState, &a.EmployerPostalCode, &a.EmployerEmail, &a.EmployerPhone, &a.Occupation,
		&a.ApplicationFee, &a.DesiredUsageStartDate, &a.RentableTypePreference, &a.FLAGS, &a.Approver, &a.DeclineReasonSLSID,
		&a.OtherPreferences, &a.FollowUpDate, &a.CSAgent, &a.OutcomeSLSID, &a.FloatingDeposit, &a.RAID,
		&a.LastModTime, &a.LastModBy))
}

// ReadRatePlan reads a full RatePlan structure from the database based on the supplied row object
func ReadRatePlan(row *sql.Row, a *RatePlan) {
	Errcheck(row.Scan(&a.RPID, &a.BID, &a.Name, &a.LastModTime, &a.LastModBy))
}

// ReadRatePlans reads a full RatePlan structure from the database based on the supplied row object
func ReadRatePlans(rows *sql.Rows, a *RatePlan) {
	Errcheck(rows.Scan(&a.RPID, &a.BID, &a.Name, &a.LastModTime, &a.LastModBy))
}

// ReadRatePlanRef reads a full RatePlanRef structure from the database based on the supplied row object
func ReadRatePlanRef(row *sql.Row, a *RatePlanRef) {
	Errcheck(row.Scan(&a.RPRID, &a.BID, &a.RPID, &a.DtStart, &a.DtStop, &a.FeeAppliesAge, &a.MaxNoFeeUsers,
		&a.AdditionalUserFee, &a.PromoCode, &a.CancellationFee, &a.FLAGS, &a.LastModTime, &a.LastModBy))
}

// ReadRatePlanRefs reads a full RatePlanRef structure from the database based on the supplied row object
func ReadRatePlanRefs(rows *sql.Rows, a *RatePlanRef) {
	Errcheck(rows.Scan(&a.RPRID, &a.BID, &a.RPID, &a.DtStart, &a.DtStop, &a.FeeAppliesAge, &a.MaxNoFeeUsers,
		&a.AdditionalUserFee, &a.PromoCode, &a.CancellationFee, &a.FLAGS, &a.LastModTime, &a.LastModBy))
}

// ReadRatePlanRefRTRate reads a full RatePlanRefRTRate structure from the database based on the supplied row object
func ReadRatePlanRefRTRate(row *sql.Row, a *RatePlanRefRTRate) {
	Errcheck(row.Scan(&a.RPRID, &a.BID, &a.RTID, &a.FLAGS, &a.Val))
}

// ReadRatePlanRefRTRates reads a full RatePlanRefRTRate structure from the database based on the supplied row object
func ReadRatePlanRefRTRates(rows *sql.Rows, a *RatePlanRefRTRate) {
	Errcheck(rows.Scan(&a.RPRID, &a.BID, &a.RTID, &a.FLAGS, &a.Val))
}

// ReadRatePlanRefSPRate reads a full RatePlanRefSPRate structure from the database based on the supplied row object
func ReadRatePlanRefSPRate(row *sql.Row, a *RatePlanRefSPRate) {
	Errcheck(row.Scan(&a.RPRID, &a.BID, &a.RTID, &a.RSPID, &a.FLAGS, &a.Val))
}

// ReadRatePlanRefSPRates reads a full RatePlanRefSPRate structure from the database based on the supplied row object
func ReadRatePlanRefSPRates(rows *sql.Rows, a *RatePlanRefSPRate) {
	Errcheck(rows.Scan(&a.RPRID, &a.BID, &a.RTID, &a.RSPID, &a.FLAGS, &a.Val))
}

// ReadReceipt reads a full Receipt structure of data from the database based on the supplied Rows pointer.
func ReadReceipt(row *sql.Row, a *Receipt) {
	Errcheck(row.Scan(&a.RCPTID, &a.PRCPTID, &a.BID, &a.TCID, &a.PMTID, &a.DEPID, &a.DID, &a.Dt, &a.DocNo, &a.Amount, &a.AcctRule, &a.Comment,
		&a.OtherPayorName, &a.LastModTime, &a.LastModBy))
}

// ReadReceipts reads a full Receipt structure of data from the database based on the supplied Rows pointer.
func ReadReceipts(rows *sql.Rows, a *Receipt) {
	Errcheck(rows.Scan(&a.RCPTID, &a.PRCPTID, &a.BID, &a.TCID, &a.PMTID, &a.DEPID, &a.DID, &a.Dt, &a.DocNo, &a.Amount, &a.AcctRule, &a.Comment,
		&a.OtherPayorName, &a.LastModTime, &a.LastModBy))
}

// ReadReceiptAllocation reads a full ReceiptAllocation structure of data from the database based on the supplied Rows pointer.
func ReadReceiptAllocation(row *sql.Row, a *ReceiptAllocation) {
	Errcheck(row.Scan(&a.RCPAID, &a.RCPTID, &a.BID, &a.RAID, &a.Dt, &a.Amount, &a.ASMID, &a.AcctRule))
}

// ReadReceiptAllocations reads a full ReceiptAllocation structure of data from the database based on the supplied Rows pointer.
func ReadReceiptAllocations(rows *sql.Rows, a *ReceiptAllocation) {
	Errcheck(rows.Scan(&a.RCPAID, &a.RCPTID, &a.BID, &a.RAID, &a.Dt, &a.Amount, &a.ASMID, &a.AcctRule))
}

// ReadRentableTypeDown reads a full RentableTypeDown structure of data from the database based on the supplied Row pointer.
func ReadRentableTypeDown(rows *sql.Rows, a *RentableTypeDown) error {
	return rows.Scan(&a.Recid, &a.RentableName)
}

// ReadRentable reads a full Rentable structure of data from the database based on the supplied Row pointer.
func ReadRentable(row *sql.Row, a *Rentable) error {
	return row.Scan(&a.RID, &a.BID, &a.RentableName, &a.AssignmentTime, &a.LastModTime, &a.LastModBy)
}

// ReadRentables reads a full Rentable structure of data from the database based on the supplied Rows pointer.
func ReadRentables(rows *sql.Rows, a *Rentable) error {
	return rows.Scan(&a.RID, &a.BID, &a.RentableName, &a.AssignmentTime, &a.LastModTime, &a.LastModBy)
}

// ReadRentableStatus reads a full RentableStatus structure of data from the database based on the supplied Row pointer.
func ReadRentableStatus(row *sql.Rows, a *RentableStatus) error {
	return row.Scan(&a.RID, &a.BID, &a.DtStart, &a.DtStop, &a.DtNoticeToVacate, &a.Status, &a.LastModTime, &a.LastModBy)
}

// ReadRentableStatuss reads a full RentableStatus structure of data from the database based on the supplied Rows pointer.
func ReadRentableStatuss(rows *sql.Rows, a *RentableStatus) error {
	return rows.Scan(&a.RID, &a.BID, &a.DtStart, &a.DtStop, &a.DtNoticeToVacate, &a.Status, &a.LastModTime, &a.LastModBy)
}

// ReadRentalAgreement reads a full RentalAgreement structure of data from the database based on the supplied Row pointer.
func ReadRentalAgreement(row *sql.Row, a *RentalAgreement) error {
	return row.Scan(&a.RAID, &a.RATID, &a.BID, &a.NLID, &a.AgreementStart, &a.AgreementStop, &a.PossessionStart,
		&a.PossessionStop, &a.RentStart, &a.RentStop, &a.RentCycleEpoch, &a.UnspecifiedAdults, &a.UnspecifiedChildren,
		&a.Renewal, &a.SpecialProvisions,
		&a.LeaseType, &a.ExpenseAdjustmentType, &a.ExpensesStop, &a.ExpenseStopCalculation, &a.BaseYearEnd,
		&a.ExpenseAdjustment, &a.EstimatedCharges, &a.RateChange, &a.NextRateChange, &a.PermittedUses, &a.ExclusiveUses,
		&a.ExtensionOption, &a.ExtensionOptionNotice, &a.ExpansionOption, &a.ExpansionOptionNotice, &a.RightOfFirstRefusal,
		&a.LastModTime, &a.LastModBy)
}

// ReadRentalAgreements reads a full RentalAgreement structure of data from the database based on the supplied Rows pointer.
func ReadRentalAgreements(rows *sql.Rows, a *RentalAgreement) error {
	return rows.Scan(&a.RAID, &a.RATID, &a.BID, &a.NLID, &a.AgreementStart, &a.AgreementStop, &a.PossessionStart,
		&a.PossessionStop, &a.RentStart, &a.RentStop, &a.RentCycleEpoch, &a.UnspecifiedAdults, &a.UnspecifiedChildren,
		&a.Renewal, &a.SpecialProvisions,
		&a.LeaseType, &a.ExpenseAdjustmentType, &a.ExpensesStop, &a.ExpenseStopCalculation, &a.BaseYearEnd,
		&a.ExpenseAdjustment, &a.EstimatedCharges, &a.RateChange, &a.NextRateChange, &a.PermittedUses, &a.ExclusiveUses,
		&a.ExtensionOption, &a.ExtensionOptionNotice, &a.ExpansionOption, &a.ExpansionOptionNotice, &a.RightOfFirstRefusal,
		&a.LastModTime, &a.LastModBy)
}

// ReadRentalAgreementGrids reads a full RentalAgreementGrid structure of data from the database based on the supplied Rows pointer.
func ReadRentalAgreementGrids(rows *sql.Rows, a *RentalAgreementGrid) error {
	return rows.Scan(&a.RAID, &a.TCIDPayor, &a.AgreementStart, &a.AgreementStop)
}

// ReadRentalAgreementPayor reads a full RentalAgreementPayor structure of data from the database based on the supplied Row pointer.
func ReadRentalAgreementPayor(row *sql.Row, a *RentalAgreementPayor) error {
	return row.Scan(&a.RAPID, &a.RAID, &a.BID, &a.TCID, &a.DtStart, &a.DtStop, &a.FLAGS)
}

// ReadRentalAgreementPayors reads a full RentalAgreementPayor structure of data from the database based on the supplied Rows pointer.
func ReadRentalAgreementPayors(rows *sql.Rows, a *RentalAgreementPayor) error {
	return rows.Scan(&a.RAPID, &a.RAID, &a.BID, &a.TCID, &a.DtStart, &a.DtStop, &a.FLAGS)
}

// ReadRentalAgreementPet reads a full RentalAgreementPet structure of data from the database based on the supplied Row pointer.
func ReadRentalAgreementPet(row *sql.Row, a *RentalAgreementPet) error {
	return row.Scan(&a.PETID, &a.BID, &a.RAID, &a.Type, &a.Breed, &a.Color, &a.Weight, &a.Name, &a.DtStart, &a.DtStop, &a.LastModTime, &a.LastModBy)
}

// ReadRentalAgreementPets reads a full RentalAgreementPet structure of data from the database based on the supplied Rows pointer.
func ReadRentalAgreementPets(rows *sql.Rows, a *RentalAgreementPet) error {
	return rows.Scan(&a.PETID, &a.BID, &a.RAID, &a.Type, &a.Breed, &a.Color, &a.Weight, &a.Name, &a.DtStart, &a.DtStop, &a.LastModTime, &a.LastModBy)
}

// ReadRentalAgreementRentable reads a full RentalAgreementRentable structure of data from the database based on the supplied Row pointer.
func ReadRentalAgreementRentable(row *sql.Row, a *RentalAgreementRentable) error {
	return row.Scan(&a.RARID, &a.RAID, &a.BID, &a.RID, &a.CLID, &a.ContractRent, &a.RARDtStart, &a.RARDtStop)
}

// ReadRentalAgreementRentables reads a full RentalAgreementRentable structure of data from the database based on the supplied Rows pointer.
func ReadRentalAgreementRentables(rows *sql.Rows, a *RentalAgreementRentable) error {
	return rows.Scan(&a.RARID, &a.RAID, &a.BID, &a.RID, &a.CLID, &a.ContractRent, &a.RARDtStart, &a.RARDtStop)
}

// ReadRentalAgreementTemplate reads a full RentalAgreementTemplate structure of data from the database based on the supplied Row pointer.
func ReadRentalAgreementTemplate(row *sql.Row, a *RentalAgreementTemplate) error {
	return row.Scan(&a.RATID, &a.BID, &a.RATemplateName, &a.LastModTime, &a.LastModBy)
}

// ReadRentalAgreementTemplates reads a full RentalAgreementTemplate structure of data from the database based on the supplied Rows pointer.
func ReadRentalAgreementTemplates(rows *sql.Rows, a *RentalAgreementTemplate) error {
	return rows.Scan(&a.RATID, &a.BID, &a.RATemplateName, &a.LastModTime, &a.LastModBy)
}

// ReadRentableUser reads a full RentableUser structure of data from the database based on the supplied Row pointer.
func ReadRentableUser(row *sql.Row, a *RentableUser) error {
	return row.Scan(&a.RUID, &a.RID, &a.BID, &a.TCID, &a.DtStart, &a.DtStop)
}

// ReadRentableUsers reads a full RentableUser structure of data from the database based on the supplied Rows pointer.
func ReadRentableUsers(rows *sql.Rows, a *RentableUser) error {
	return rows.Scan(&a.RUID, &a.RID, &a.BID, &a.TCID, &a.DtStart, &a.DtStop)
}

// ReadStringList reads a full StringList structure from the database based on the supplied row object
func ReadStringList(row *sql.Row, a *StringList) {
	Errcheck(row.Scan(&a.SLID, &a.BID, &a.Name, &a.LastModTime, &a.LastModBy))
}

// ReadStringLists reads a full StringList structure from the database based on the supplied rows object
func ReadStringLists(rows *sql.Rows, a *StringList) {
	Errcheck(rows.Scan(&a.SLID, &a.BID, &a.Name, &a.LastModTime, &a.LastModBy))
}

// ReadSLString reads a full SLString structure from the database based on the supplied row object
func ReadSLString(row *sql.Row, a *SLString) {
	Errcheck(row.Scan(&a.SLSID, &a.BID, &a.SLID, &a.Value, &a.LastModTime, &a.LastModBy))
}

// ReadSLStrings reads a full SLString structure from the database based on the supplied rows
func ReadSLStrings(rows *sql.Rows, a *SLString) {
	Errcheck(rows.Scan(&a.SLSID, &a.BID, &a.SLID, &a.Value, &a.LastModTime, &a.LastModBy))
}

// ReadTransactant reads a full Transactant structure from the database based on the supplied row object
func ReadTransactant(row *sql.Row, a *Transactant) error {
	return row.Scan(&a.TCID, &a.BID, &a.NLID, &a.FirstName, &a.MiddleName, &a.LastName, &a.PreferredName, &a.CompanyName, &a.IsCompany, &a.PrimaryEmail, &a.SecondaryEmail, &a.WorkPhone, &a.CellPhone, &a.Address, &a.Address2, &a.City, &a.State, &a.PostalCode, &a.Country, &a.Website, &a.LastModTime, &a.LastModBy)
}

// ReadTransactants reads a full Transactant structure from the database based on the supplied rows object
func ReadTransactants(rows *sql.Rows, a *Transactant) {
	Errcheck(rows.Scan(&a.TCID, &a.BID, &a.NLID, &a.FirstName, &a.MiddleName, &a.LastName, &a.PreferredName, &a.CompanyName, &a.IsCompany, &a.PrimaryEmail, &a.SecondaryEmail, &a.WorkPhone, &a.CellPhone, &a.Address, &a.Address2, &a.City, &a.State, &a.PostalCode, &a.Country, &a.Website, &a.LastModTime, &a.LastModBy))
}

// ReadTransactantTypeDowns reads the TCID and full name of Transactants based on the supplied rows object
func ReadTransactantTypeDowns(rows *sql.Rows, a *TransactantTypeDown) {
	Errcheck(rows.Scan(&a.TCID, &a.FirstName, &a.MiddleName, &a.LastName, &a.CompanyName, &a.IsCompany))
}

// ReadUser reads a full User structure from the database based on the supplied row object
func ReadUser(row *sql.Row, a *User) {
	Errcheck(row.Scan(&a.TCID, &a.BID, &a.Points, &a.DateofBirth, &a.EmergencyContactName, &a.EmergencyContactAddress, &a.EmergencyContactTelephone, &a.EmergencyEmail, &a.AlternateAddress, &a.EligibleFutureUser, &a.Industry, &a.SourceSLSID, &a.LastModTime, &a.LastModBy))
}

// ReadUsers reads a full User structure from the database based on the supplied rows object
func ReadUsers(rows *sql.Rows, a *User) {
	Errcheck(rows.Scan(&a.TCID, &a.BID, &a.Points, &a.DateofBirth, &a.EmergencyContactName, &a.EmergencyContactAddress, &a.EmergencyContactTelephone, &a.EmergencyEmail, &a.AlternateAddress, &a.EligibleFutureUser, &a.Industry, &a.SourceSLSID, &a.LastModTime, &a.LastModBy))
}

// ReadVehicle reads a full Vehicle structure from the database based on the supplied row object
func ReadVehicle(row *sql.Row, a *Vehicle) {
	Errcheck(row.Scan(&a.VID, &a.TCID, &a.BID, &a.VehicleType, &a.VehicleMake, &a.VehicleModel, &a.VehicleColor, &a.VehicleYear, &a.LicensePlateState, &a.LicensePlateNumber, &a.ParkingPermitNumber, &a.DtStart, &a.DtStop, &a.LastModTime, &a.LastModBy))
}

// ReadVehicles reads a full Vehicle structure from the database based on the supplied rows object
func ReadVehicles(rows *sql.Rows, a *Vehicle) {
	Errcheck(rows.Scan(&a.VID, &a.TCID, &a.BID, &a.VehicleType, &a.VehicleMake, &a.VehicleModel, &a.VehicleColor, &a.VehicleYear, &a.LicensePlateState, &a.LicensePlateNumber, &a.ParkingPermitNumber, &a.DtStart, &a.DtStop, &a.LastModTime, &a.LastModBy))
}

// ReadTCIDByNote reads TCID, got from Transactant record
func ReadTCIDByNote(rows *sql.Rows, id *int) {
	Errcheck(rows.Scan(id))
}

// ReadCountBusinessCustomAttrRefs reads total count for CustomAttrRefs
// for particular associated business
func ReadCountBusinessCustomAttrRefs(rows *sql.Rows, id *int) {
	Errcheck(rows.Scan(id))
}

// ReadCountBusinessCustomAttributes reads total count for CustomAttributes
// for particular associated business
func ReadCountBusinessCustomAttributes(rows *sql.Rows, id *int) {
	Errcheck(rows.Scan(id))
}

// ReadCountBusinessRentableTypes reads total count for RentableTypes
// for particular associated business
func ReadCountBusinessRentableTypes(rows *sql.Rows, id *int) {
	Errcheck(rows.Scan(id))
}

// ReadCountBusinessTransactants reads total count for Transactants
// for particular associated business
func ReadCountBusinessTransactants(rows *sql.Rows, id *int) {
	Errcheck(rows.Scan(id))
}

// ReadCountBusinessRentables reads total count for Rentables
// for particular associated business
func ReadCountBusinessRentables(rows *sql.Rows, id *int) {
	Errcheck(rows.Scan(id))
}

// ReadCountBusinessRentalAgreements reads total count for RentalAgreements
// for particular associated business
func ReadCountBusinessRentalAgreements(rows *sql.Rows, id *int) {
	Errcheck(rows.Scan(id))
}
