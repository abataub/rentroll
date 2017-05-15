package rlib

import "strings"

// Define all the SQL prepared statements.

// June 3, 2016 -- As the params change, it's easy to forget to update all the statements with the correct
// field names and the proper number of replacement characters.  I'm starting a convention where the SELECT
// fields are set into a variable and used on all the SELECT statements for that table.  The fields and
// replacement variables for INSERT and UPDATE are derived from the SELECT string.

var mySQLRpl = string("?")
var myRpl = mySQLRpl

// TRNSfields defined fields for Transactant, used in at least one other function
var TRNSfields = string("TCID,BID,NLID,FirstName,MiddleName,LastName,PreferredName,CompanyName,IsCompany,PrimaryEmail,SecondaryEmail,WorkPhone,CellPhone,Address,Address2,City,State,PostalCode,Country,Website,LastModTime,LastModBy")

// ASMTflds defined fields for AssessmentTypes, used in at least one other function
// var ASMTflds = string("ASMTID,RARequired,ManageToBudget,Name,Description,LastModTime,LastModBy")

// GenSQLInsertAndUpdateStrings generates a string suitable for SQL INSERT and UPDATE statements given the fields as used in SELECT statements.
//
//  example:
//	given this string:      "LID,BID,RAID,GLNumber,Status,Type,Name,AcctType,RAAssociated,LastModTime,LastModBy"
//  we return these five strings:
//  1)  "BID,RAID,GLNumber,Status,Type,Name,AcctType,RAAssociated,LastModBy"                  	-- use for SELECT
//  2)  "?,?,?,?,?,?,?,?,?"  																	-- use for INSERT
//  3)  "BID=?RAID=?,GLNumber=?,Status=?,Type=?,Name=?,AcctType=?,RAAssociated=?,LastModBy=?"   -- use for UPDATE
//  4)  "LID,BID,RAID,GLNumber,Status,Type,Name,AcctType,RAAssociated,LastModBy", 				-- use for INSERT (no PRIMARYKEY), add "WHERE LID=?"
//  5)  "?,?,?,?,?,?,?,?,?,?"  																	-- use for INSERT (no PRIMARYKEY)
//
// Note that in this convention, we remove LastModTime from insert and update statements (the db is set up to update them by default) and
// we remove the initial ID as that number is AUTOINCREMENT on INSERTs and is not updated on UPDATE.
func GenSQLInsertAndUpdateStrings(s string) (string, string, string, string, string) {
	sa := strings.Split(s, ",")
	s0 := sa[0]
	s2 := sa[1:]  // skip the ID
	l2 := len(s2) // how many fields
	if l2 > 2 {
		if s2[l2-2] == "LastModTime" { // if the last 2 values are "LastModTime" and "LastModBy"...
			s2[l2-2] = s2[l2-1] // ...move "LastModBy" to the previous slot...
			s2 = s2[:l2-1]      // ...and remove value .  We don't write LastModTime because it is set to automatically update
		}
	}
	s = strings.Join(s2, ",")
	l2 = len(s2) // may have changed

	// now s2 has the proper number of fields.  Produce a
	s3 := myRpl + ","               // start of the INSERT string  -- FOR USE WITH PRIMARY KEY AUTOINCREMENT
	s4 := s2[0] + "=" + myRpl + "," // start of the UPDATE string
	for i := 1; i < l2; i++ {
		s3 += myRpl               // for the INSERT string
		s4 += s2[i] + "=" + myRpl // for the UPDATE string
		if i < l2-1 {             // if there are more fields to come...
			s3 += "," // ...add a comma...
			s4 += "," // ...to both strings
		}
	}
	s5 := s0 + "," + s     // for INSERT where first val is not AUTOINCREMENT
	s6 := s3 + "," + myRpl // for INSERT where first val is not AUTOINCREMENT
	return s, s3, s4, s5, s6
}

func buildPreparedStatements() {
	var err error
	var s1, s2, s3, s4, s5, flds string
	// Prepare("select deduction from deductions where uid=?")
	// Prepare("select type from compensation where uid=?")
	// Prepare("INSERT INTO compensation (uid,type) VALUES(?,?)")
	// Prepare("DELETE FROM compensation WHERE UID=?")
	// Prepare("update classes set Name=?,Designation=?,Description=?,lastmodby=? where ClassCode=?")
	// Errcheck(err)

	//===============================
	//  AccountDepository
	//===============================
	// flds = "ADID,BID,LID,DEPID,LastModTime,LastModBy"
	// RRdb.DBFields["AccountDepository"] = flds
	// RRdb.Prepstmt.GetAccountDepository, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM AccountDepository WHERE ADID=?")
	// Errcheck(err)
	// RRdb.Prepstmt.GetAllAccountDepositories, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM AccountDepository WHERE BID=?")
	// Errcheck(err)

	// s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	// RRdb.Prepstmt.InsertAccountDepository, err = RRdb.Dbrr.Prepare("INSERT INTO AccountDepository (" + s1 + ") VALUES(" + s2 + ")")
	// Errcheck(err)
	// RRdb.Prepstmt.UpdateAccountDepository, err = RRdb.Dbrr.Prepare("UPDATE AccountDepository SET " + s3 + " WHERE ADID=?")
	// Errcheck(err)
	// RRdb.Prepstmt.DeleteAccountDepository, err = RRdb.Dbrr.Prepare("DELETE FROM AccountDepository WHERE ADID=?")
	// Errcheck(err)

	//===============================
	//  AccountRule
	//  AR
	//===============================
	flds = "ARID,BID,Name,ARType,DebitLID,CreditLID,Description,DtStart,DtStop,LastModTime,LastModBy"
	RRdb.DBFields["AR"] = flds
	RRdb.Prepstmt.GetAR, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM AR WHERE ARID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetARByName, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM AR WHERE BID=? AND Name=?")
	Errcheck(err)
	RRdb.Prepstmt.GetARsByType, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM AR WHERE BID=? AND ARType=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllARs, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM AR WHERE BID=?")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertAR, err = RRdb.Dbrr.Prepare("INSERT INTO AR (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateAR, err = RRdb.Dbrr.Prepare("UPDATE AR SET " + s3 + " WHERE ARID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteAR, err = RRdb.Dbrr.Prepare("DELETE FROM AR WHERE ARID=?")
	Errcheck(err)

	//===============================
	//  RentalAgreementPet
	//===============================
	flds = "PETID,BID,RAID,Type,Breed,Color,Weight,Name,DtStart,DtStop,LastModTime,LastModBy"
	RRdb.DBFields["RentalAgreementPets"] = flds
	RRdb.Prepstmt.GetRentalAgreementPet, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RentalAgreementPets WHERE PETID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllRentalAgreementPets, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RentalAgreementPets WHERE RAID=?")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertRentalAgreementPet, err = RRdb.Dbrr.Prepare("INSERT INTO RentalAgreementPets (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRentalAgreementPet, err = RRdb.Dbrr.Prepare("UPDATE RentalAgreementPets SET " + s3 + " WHERE PETID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteRentalAgreementPet, err = RRdb.Dbrr.Prepare("DELETE FROM RentalAgreementPets WHERE PETID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteAllRentalAgreementPets, err = RRdb.Dbrr.Prepare("DELETE FROM RentalAgreementPets WHERE RAID=?")
	Errcheck(err)

	//===============================
	//  Assessments
	//===============================
	flds = "ASMID,PASMID,BID,RID,ATypeLID,RAID,Amount,Start,Stop,RentCycle,ProrationCycle,InvoiceNo,AcctRule,ARID,FLAGS,Comment,LastModTime,LastModBy"
	RRdb.DBFields["Assessments"] = flds
	RRdb.Prepstmt.GetAssessment, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Assessments WHERE ASMID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAssessmentInstance, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Assessments WHERE Start=? AND PASMID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAssessmentDuplicate, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Assessments WHERE Start=? AND Amount=? AND PASMID=? AND RID=? AND RAID=? AND ATypeLID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllAssessmentsByBusiness, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Assessments WHERE BID=? AND (PASMID=0 OR RentCycle=0) AND Start<? AND Stop>=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRecurringAssessmentsByBusiness, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Assessments WHERE BID=? AND PASMID=0 AND RentCycle>0 AND Start<? AND Stop>=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllSingleInstanceAssessments, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Assessments WHERE BID=? AND (PASMID!=0 OR RentCycle=0) AND Start<? AND Stop>=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllAssessmentsByRAID, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Assessments WHERE (RentCycle=0  OR (RentCycle>0 AND PASMID>0)) AND RAID=? AND Start<? AND Stop>=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllRentableAssessments, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Assessments WHERE RID=? AND Stop >= ? AND Start < ?")
	Errcheck(err)
	RRdb.Prepstmt.GetUnpaidAssessmentsByRAID, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Assessments WHERE RAID=? AND (FLAGS & 1)=0 AND (PASMID!=0 OR RentCycle=0) ORDER BY Start ASC")
	Errcheck(err)
	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertAssessment, err = RRdb.Dbrr.Prepare("INSERT INTO Assessments (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateAssessment, err = RRdb.Dbrr.Prepare("UPDATE Assessments SET " + s3 + " WHERE ASMID=?")
	Errcheck(err)

	//===============================
	//  Building
	//===============================
	RRdb.Prepstmt.InsertBuilding, err = RRdb.Dbrr.Prepare("INSERT INTO Building (BID,Address,Address2,City,State,PostalCode,Country,LastModBy) VALUES(?,?,?,?,?,?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.InsertBuildingWithID, err = RRdb.Dbrr.Prepare("INSERT INTO Building (BLDGID,BID,Address,Address2,City,State,PostalCode,Country,LastModBy) VALUES(?,?,?,?,?,?,?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.GetBuilding, err = RRdb.Dbrr.Prepare("SELECT BLDGID,BID,Address,Address2,City,State,PostalCode,Country,LastModTime,LastModBy FROM Building WHERE BLDGID=?")
	Errcheck(err)

	//==========================================
	// Business
	//==========================================
	flds = "BID,BUD,Name,DefaultRentCycle,DefaultProrationCycle,DefaultGSRPC,LastModTime,LastModBy"
	RRdb.DBFields["Business"] = flds
	RRdb.Prepstmt.GetAllBusinesses, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Business ORDER BY Name ASC")
	Errcheck(err)
	RRdb.Prepstmt.GetBusiness, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Business WHERE BID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetBusinessByDesignation, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Business WHERE BUD=?")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertBusiness, err = RRdb.Dbrr.Prepare("INSERT INTO Business (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateBusiness, err = RRdb.Dbrr.Prepare("UPDATE Business SET " + s3 + " WHERE BID=?")
	Errcheck(err)

	RRdb.Prepstmt.GetAllBusinessSpecialtyTypes, err = RRdb.Dbrr.Prepare("SELECT RSPID,BID,Name,Fee,Description FROM RentableSpecialty WHERE BID=?")
	Errcheck(err)

	//==========================================
	// Custom Attribute
	//==========================================
	flds = "CID,BID,Type,Name,Value,Units,LastModTime,LastModBy"
	RRdb.DBFields["CustomAttr"] = flds
	RRdb.Prepstmt.CountBusinessCustomAttributes, err = RRdb.Dbrr.Prepare("SELECT COUNT(CID) FROM CustomAttr WHERE BID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetCustomAttribute, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM CustomAttr WHERE CID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetCustomAttributeByVals, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM CustomAttr WHERE Type=? AND Name=? AND Value=? AND Units=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllCustomAttributes, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM CustomAttr")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertCustomAttribute, err = RRdb.Dbrr.Prepare("INSERT INTO CustomAttr (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateCustomAttribute, err = RRdb.Dbrr.Prepare("UPDATE CustomAttr SET " + s3 + " WHERE CID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteCustomAttribute, err = RRdb.Dbrr.Prepare("DELETE FROM CustomAttr WHERE CID=?")
	Errcheck(err)

	//==========================================
	// Custom Attribute Ref
	//==========================================
	flds = "ElementType,BID,ID,CID"
	RRdb.DBFields["CustomAttrRef"] = flds
	RRdb.Prepstmt.CountBusinessCustomAttrRefs, err = RRdb.Dbrr.Prepare("SELECT COUNT(CID) FROM CustomAttrRef WHERE BID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetCustomAttributeRefs, err = RRdb.Dbrr.Prepare("SELECT CID FROM CustomAttrRef WHERE ElementType=? and ID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetCustomAttributeRef, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM CustomAttrRef WHERE ElementType=? and ID=? and CID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllCustomAttributeRefs, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM CustomAttrRef")
	Errcheck(err)

	RRdb.Prepstmt.InsertCustomAttributeRef, err = RRdb.Dbrr.Prepare("INSERT INTO CustomAttrRef (ElementType,BID,ID,CID) VALUES(?,?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.DeleteCustomAttributeRef, err = RRdb.Dbrr.Prepare("DELETE FROM CustomAttrRef WHERE CID=? and ElementType=? and ID=?")
	Errcheck(err)

	//==========================================
	// DEPOSIT
	//==========================================
	DepositFlds := "DID,BID,DEPID,DPMID,Dt,Amount,LastModTime,LastModBy"
	RRdb.DBFields["Deposit"] = flds
	RRdb.Prepstmt.GetDeposit, err = RRdb.Dbrr.Prepare("SELECT " + DepositFlds + " FROM Deposit WHERE DID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllDepositsInRange, err = RRdb.Dbrr.Prepare("SELECT " + DepositFlds + " FROM Deposit WHERE BID=? AND ?<=Dt AND Dt<?")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(DepositFlds)

	RRdb.Prepstmt.InsertDeposit, err = RRdb.Dbrr.Prepare("INSERT INTO Deposit (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.DeleteDeposit, err = RRdb.Dbrr.Prepare("DELETE FROM Deposit WHERE DID=?")
	Errcheck(err)
	RRdb.Prepstmt.UpdateDeposit, err = RRdb.Dbrr.Prepare("UPDATE Deposit SET " + s3 + " WHERE DID=?")
	Errcheck(err)

	//==========================================
	// DEPOSIT METHOD
	//==========================================
	RRdb.Prepstmt.GetDepositMethod, err = RRdb.Dbrr.Prepare("SELECT DPMID,BID,Name FROM DepositMethod WHERE DPMID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetDepositMethodByName, err = RRdb.Dbrr.Prepare("SELECT DPMID,BID,Name FROM DepositMethod WHERE BID=? and Name=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllDepositMethods, err = RRdb.Dbrr.Prepare("SELECT DPMID,BID,Name FROM DepositMethod WHERE BID=?")
	Errcheck(err)
	RRdb.Prepstmt.InsertDepositMethod, err = RRdb.Dbrr.Prepare("INSERT INTO DepositMethod (BID,Name) VALUES (?,?)")
	Errcheck(err)
	RRdb.Prepstmt.UpdateDepositMethod, err = RRdb.Dbrr.Prepare("UPDATE DepositMethod SET BID=?,Name=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteDepositMethod, err = RRdb.Dbrr.Prepare("DELETE FROM DepositMethod WHERE DPMID=?")
	Errcheck(err)

	//==========================================
	// DEPOSIT PART
	//==========================================
	RRdb.Prepstmt.GetDepositParts, err = RRdb.Dbrr.Prepare("SELECT DID,BID,RCPTID FROM DepositPart WHERE DID=?")
	Errcheck(err)
	RRdb.Prepstmt.InsertDepositPart, err = RRdb.Dbrr.Prepare("INSERT INTO DepositPart (DID,BID,RCPTID) VALUES (?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.DeleteDepositParts, err = RRdb.Dbrr.Prepare("DELETE FROM DepositPart WHERE DID=?")
	Errcheck(err)

	//==========================================
	// DEPOSITORY
	//==========================================
	flds = "DEPID,BID,LID,Name,AccountNo,LastModTime,LastModBy"
	RRdb.DBFields["Depository"] = flds
	RRdb.Prepstmt.GetDepository, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Depository WHERE DEPID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetDepositoryByAccount, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Depository WHERE BID=? AND AccountNo=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllDepositories, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Depository WHERE BID=?")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)

	RRdb.Prepstmt.InsertDepository, err = RRdb.Dbrr.Prepare("INSERT INTO Depository (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.DeleteDepository, err = RRdb.Dbrr.Prepare("DELETE FROM Depository WHERE DEPID=?")
	Errcheck(err)
	RRdb.Prepstmt.UpdateDepository, err = RRdb.Dbrr.Prepare("UPDATE Depository SET " + s3 + " WHERE DEPID=?")
	Errcheck(err)

	//==========================================
	// INVOICE
	//==========================================
	flds = "InvoiceNo,BID,Dt,DtDue,Amount,DeliveredBy,LastModTime,LastModBy"
	RRdb.DBFields["Invoice"] = flds
	RRdb.Prepstmt.GetInvoice, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Invoice WHERE InvoiceNo=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllInvoicesInRange, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Invoice WHERE BID=? AND ?>=Dt AND DtDue<=?")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertInvoice, err = RRdb.Dbrr.Prepare("INSERT INTO Invoice (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.DeleteInvoice, err = RRdb.Dbrr.Prepare("DELETE FROM Invoice WHERE InvoiceNo=?")
	Errcheck(err)
	RRdb.Prepstmt.UpdateInvoice, err = RRdb.Dbrr.Prepare("UPDATE Invoice SET " + s3 + " WHERE InvoiceNo=?")
	Errcheck(err)

	//==========================================
	// INVOICE PART
	//==========================================
	RRdb.Prepstmt.GetInvoiceAssessments, err = RRdb.Dbrr.Prepare("SELECT InvoiceNo,BID, ASMID FROM InvoiceAssessment WHERE InvoiceNo=?")
	Errcheck(err)
	RRdb.Prepstmt.InsertInvoiceAssessment, err = RRdb.Dbrr.Prepare("INSERT INTO InvoiceAssessment (InvoiceNo,BID,ASMID) VALUES (?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.DeleteInvoiceAssessments, err = RRdb.Dbrr.Prepare("DELETE FROM InvoiceAssessment WHERE InvoiceNo=?")
	Errcheck(err)

	//==========================================
	// INVOICE PAYOR
	//==========================================
	RRdb.Prepstmt.GetInvoicePayors, err = RRdb.Dbrr.Prepare("SELECT InvoiceNo,BID,PID FROM InvoicePayor WHERE InvoiceNo=?")
	Errcheck(err)
	RRdb.Prepstmt.InsertInvoicePayor, err = RRdb.Dbrr.Prepare("INSERT INTO InvoicePayor (InvoiceNo,BID,PID) VALUES (?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.DeleteInvoicePayors, err = RRdb.Dbrr.Prepare("DELETE FROM InvoicePayor WHERE InvoiceNo=?")
	Errcheck(err)

	//==========================================
	// JOURNAL
	//==========================================
	flds = "JID,BID,Dt,Amount,Type,ID,Comment,LastModTime,LastModBy"
	RRdb.DBFields["Journal"] = flds
	RRdb.Prepstmt.GetJournal, err = RRdb.Dbrr.Prepare("select " + flds + " from Journal WHERE JID=?")
	Errcheck(err)
	// RRdb.Prepstmt.GetJournalInstance, err = RRdb.Dbrr.Prepare("select " + flds + " from Journal WHERE Type=0 and Raid=0 and ID=? and ?<=Dt and Dt<?")
	// Errcheck(err)
	RRdb.Prepstmt.GetJournalVacancy, err = RRdb.Dbrr.Prepare("select " + flds + " from Journal WHERE Type=0 and ID=? and ?<=Dt and Dt<?")
	Errcheck(err)
	RRdb.Prepstmt.GetJournalByReceiptID, err = RRdb.Dbrr.Prepare("select " + flds + " from Journal WHERE Type=2 and ID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllJournalsInRange, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from Journal WHERE BID=? and ?<=Dt and Dt<?")
	Errcheck(err)

	s1, s2, _, _, _ = GenSQLInsertAndUpdateStrings(flds)

	RRdb.Prepstmt.InsertJournal, err = RRdb.Dbrr.Prepare("INSERT INTO Journal (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.DeleteJournalEntry, err = RRdb.Dbrr.Prepare("DELETE FROM Journal WHERE JID=?")
	Errcheck(err)

	// Journal Allocation
	RRdb.Prepstmt.GetJournalAllocation, err = RRdb.Dbrr.Prepare("SELECT JAID,BID,JID,RID,RAID,Amount,ASMID,AcctRule from JournalAllocation WHERE JAID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetJournalAllocations, err = RRdb.Dbrr.Prepare("SELECT JAID,BID,JID,RID,RAID,Amount,ASMID,AcctRule from JournalAllocation WHERE JID=? ORDER BY Amount DESC, RAID ASC, ASMID ASC")
	Errcheck(err)

	RRdb.Prepstmt.InsertJournalAllocation, err = RRdb.Dbrr.Prepare("INSERT INTO JournalAllocation (BID,JID,RID,RAID,Amount,ASMID,AcctRule) VALUES(?,?,?,?,?,?,?)")
	Errcheck(err)

	RRdb.Prepstmt.DeleteJournalAllocation, err = RRdb.Dbrr.Prepare("DELETE FROM JournalAllocation WHERE JAID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteJournalAllocations, err = RRdb.Dbrr.Prepare("DELETE FROM JournalAllocation WHERE JID=?")
	Errcheck(err)

	RRdb.Prepstmt.UpdateJournalAllocation, err = RRdb.Dbrr.Prepare("UPDATE JournalAllocation SET BID=?,JID=?,RID=?,RAID=?,Amount=?,ASMID=?,AcctRule=? WHERE JAID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetJournalMarker, err = RRdb.Dbrr.Prepare("SELECT JMID,BID,State,DtStart,DtStop from JournalMarker WHERE JMID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetJournalMarkers, err = RRdb.Dbrr.Prepare("SELECT JMID,BID,State,DtStart,DtStop from JournalMarker ORDER BY JMID DESC LIMIT ?")
	Errcheck(err)
	RRdb.Prepstmt.InsertJournalMarker, err = RRdb.Dbrr.Prepare("INSERT INTO JournalMarker (BID,State,DtStart,DtStop) VALUES(?,?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.DeleteJournalMarker, err = RRdb.Dbrr.Prepare("DELETE FROM JournalMarker WHERE JMID=?")
	Errcheck(err)

	//==========================================
	// LEDGER-->  GLAccount
	//==========================================
	flds = "LID,PLID,BID,RAID,GLNumber,Status,Type,Name,AcctType,RAAssociated,AllowPost,RARequired,ManageToBudget,Description,LastModTime,LastModBy"
	RRdb.DBFields["GLAccount"] = flds
	RRdb.Prepstmt.GetLedgerByGLNo, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM GLAccount WHERE BID=? AND GLNumber=?")
	Errcheck(err)
	RRdb.Prepstmt.GetLedgerByName, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM GLAccount WHERE BID=? AND Name=?")
	Errcheck(err)
	RRdb.Prepstmt.GetLedgerByType, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM GLAccount WHERE BID=? AND Type=?")
	Errcheck(err)
	// RRdb.Prepstmt.GetRABalanceLedger, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM GLAccount WHERE BID=? AND Type=1 AND RAID=?")
	// Errcheck(err)
	// RRdb.Prepstmt.GetSecDepBalanceLedger, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM GLAccount WHERE BID=? AND Type=2 AND RAID=?")
	// Errcheck(err)
	RRdb.Prepstmt.GetLedger, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM GLAccount WHERE LID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetLedgerList, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM GLAccount WHERE BID=? ORDER BY GLNumber ASC, Name ASC")
	Errcheck(err)
	RRdb.Prepstmt.GetDefaultLedgers, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM GLAccount WHERE BID=? AND Type>=10 ORDER BY GLNumber ASC")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)

	RRdb.Prepstmt.InsertLedger, err = RRdb.Dbrr.Prepare("INSERT INTO GLAccount (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.DeleteLedger, err = RRdb.Dbrr.Prepare("DELETE FROM GLAccount WHERE LID=?")
	Errcheck(err)
	RRdb.Prepstmt.UpdateLedger, err = RRdb.Dbrr.Prepare("UPDATE GLAccount SET " + s3 + " WHERE LID=?")
	Errcheck(err)

	//==========================================
	// LEDGER ENTRY
	//==========================================
	flds = "LEID,BID,JID,JAID,LID,RAID,RID,Dt,Amount,Comment,LastModTime,LastModBy"
	RRdb.DBFields["LedgerEntry"] = flds
	RRdb.Prepstmt.GetAllLedgerEntriesInRange, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from LedgerEntry WHERE BID=? AND ?<=Dt AND Dt<?")
	Errcheck(err)
	RRdb.Prepstmt.GetLedgerEntriesInRange, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from LedgerEntry WHERE BID=? AND LID=? AND RAID=? AND ?<=Dt AND Dt<?")
	Errcheck(err)
	// RRdb.Prepstmt.GetLedgerEntriesInRangeByGLNo, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from LedgerEntry WHERE BID=? AND GLNo=? AND ?<=Dt AND Dt<? ORDER BY JAID ASC")
	// Errcheck(err)
	RRdb.Prepstmt.GetLedgerEntriesInRangeByLID, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from LedgerEntry WHERE BID=? AND LID=? AND ?<=Dt AND Dt<? ORDER BY Amount DESC, Dt ASC")
	Errcheck(err)
	RRdb.Prepstmt.GetLedgerEntryByJAID, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from LedgerEntry WHERE BID=? AND LID=? AND JAID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetLedgerEntriesForRAID, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM LedgerEntry WHERE ?<=Dt AND Dt<? AND RAID=? AND LID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetLedgerEntriesForRentable, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM LedgerEntry WHERE ?<=Dt AND Dt<? AND RID=? AND LID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllLedgerEntriesForRAID, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM LedgerEntry WHERE ?<=Dt AND Dt<? AND RAID=? ORDER BY Dt ASC")
	Errcheck(err)
	RRdb.Prepstmt.GetAllLedgerEntriesForRID, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM LedgerEntry WHERE ?<=Dt AND Dt<? AND RID=? ORDER BY Dt ASC")
	Errcheck(err)
	RRdb.Prepstmt.GetLedgerEntry, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM LedgerEntry where LEID=?")
	Errcheck(err)

	s1, s2, _, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertLedgerEntry, err = RRdb.Dbrr.Prepare("INSERT INTO LedgerEntry (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.DeleteLedgerEntry, err = RRdb.Dbrr.Prepare("DELETE FROM LedgerEntry WHERE LEID=?")
	Errcheck(err)

	//==========================================
	// LEDGER MARKER
	//==========================================
	flds = "LMID,LID,BID,RAID,RID,Dt,Balance,State,LastModTime,LastModBy"
	RRdb.DBFields["LedgerMarker"] = flds
	RRdb.Prepstmt.GetLatestLedgerMarkerByLID, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM LedgerMarker WHERE BID=? and LID=? and RAID=0 and RID=0 ORDER BY Dt DESC")
	Errcheck(err)
	RRdb.Prepstmt.GetLedgerMarkerByDateRange, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM LedgerMarker WHERE BID=? and LID=? and RAID=0 and RID=0 and Dt>?  ORDER BY LID ASC")
	Errcheck(err)
	// RRdb.Prepstmt.GetLedgerMarkerByRAID, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM LedgerMarker WHERE BID=? and LID=? and Dt>? ORDER BY LID ASC")
	// Errcheck(err)
	RRdb.Prepstmt.GetLedgerMarkers, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM LedgerMarker WHERE BID=? and RAID=0 and RID=0 ORDER BY LMID DESC LIMIT ?")
	Errcheck(err)

	// RRdb.Prepstmt.GetAllLedgerMarkersOnOrBefore, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM (SELECT * FROM LedgerMarker WHERE BID=? and RAID=0 and RID=0 and Dt<=? ORDER BY Dt DESC) AS t1 GROUP BY LID")
	// Errcheck(err)
	RRdb.Prepstmt.GetLedgerMarkerOnOrBefore, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM LedgerMarker WHERE BID=? and LID=? and RAID=0 and RID=0 and Dt<=? ORDER BY Dt DESC LIMIT 1")
	Errcheck(err)
	RRdb.Prepstmt.GetRALedgerMarkerOnOrBefore, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM LedgerMarker WHERE BID=? and LID=? and RAID=? and Dt<=?  ORDER BY Dt DESC LIMIT 1")
	Errcheck(err)
	RRdb.Prepstmt.GetRentableLedgerMarkerOnOrBefore, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM LedgerMarker WHERE BID=? and LID=? and RID=? and Dt<=?  ORDER BY Dt DESC LIMIT 1")
	Errcheck(err)
	RRdb.Prepstmt.DeleteLedgerMarker, err = RRdb.Dbrr.Prepare("DELETE FROM LedgerMarker WHERE LMID=?")
	Errcheck(err)
	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertLedgerMarker, err = RRdb.Dbrr.Prepare("INSERT INTO LedgerMarker (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateLedgerMarker, err = RRdb.Dbrr.Prepare("UPDATE LedgerMarker SET " + s3 + " WHERE LMID=?")
	Errcheck(err)

	//==========================================
	// NOTES
	//==========================================
	flds = "NID,BID,NLID,PNID,NTID,RID,RAID,TCID,Comment,LastModTime,LastModBy"
	RRdb.DBFields["Notes"] = flds
	RRdb.Prepstmt.GetNote, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Notes WHERE NID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetNoteAndChildNotes, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Notes WHERE PNID=? ORDER BY LastModTime ASC")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertNote, err = RRdb.Dbrr.Prepare("INSERT INTO Notes (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateNote, err = RRdb.Dbrr.Prepare("UPDATE Notes SET " + s3 + " WHERE NID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteNote, err = RRdb.Dbrr.Prepare("DELETE FROM Notes WHERE NID=?")
	Errcheck(err)

	//==========================================
	// NOTELIST
	//==========================================
	flds = "NLID,BID,LastModTime,LastModBy"
	RRdb.DBFields["Notes"] = flds
	RRdb.Prepstmt.GetNoteList, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM NoteList WHERE NLID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetNoteListMembers, err = RRdb.Dbrr.Prepare("SELECT NID FROM Notes WHERE NLID=? and PNID=0")
	Errcheck(err)
	s1, s2, _, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertNoteList, err = RRdb.Dbrr.Prepare("INSERT INTO NoteList (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.DeleteNoteList, err = RRdb.Dbrr.Prepare("DELETE FROM NoteList WHERE NLID=?")
	Errcheck(err)

	//==========================================
	// NOTETYPE
	//==========================================
	flds = "NTID,BID,Name,LastModTime,LastModBy"
	RRdb.Prepstmt.GetNoteType, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM NoteType WHERE NTID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllNoteTypes, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM NoteType WHERE BID=?")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertNoteType, err = RRdb.Dbrr.Prepare("INSERT INTO NoteType (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateNoteType, err = RRdb.Dbrr.Prepare("UPDATE NoteType SET " + s3 + " WHERE NTID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteNoteType, err = RRdb.Dbrr.Prepare("DELETE FROM NoteType WHERE NTID=?")
	Errcheck(err)

	//==========================================
	// PAYMENT TYPES
	//==========================================
	flds = "PMTID,BID,Name,Description,LastModTime,LastModBy"
	RRdb.DBFields["PaymentType"] = flds
	RRdb.Prepstmt.GetPaymentType, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM PaymentType WHERE PMTID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetPaymentTypeByName, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM PaymentType WHERE BID=? AND Name=?")
	Errcheck(err)
	RRdb.Prepstmt.GetPaymentTypesByBusiness, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM PaymentType WHERE BID=?")
	Errcheck(err)
	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertPaymentType, err = RRdb.Dbrr.Prepare("INSERT INTO PaymentType (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdatePaymentType, err = RRdb.Dbrr.Prepare("UPDATE PaymentType SET " + s3 + " WHERE PMTID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeletePaymentType, err = RRdb.Dbrr.Prepare("DELETE FROM PaymentType WHERE PMTID=?")
	Errcheck(err)

	//==========================================
	// PAYOR
	//==========================================
	flds = "TCID,BID,CreditLimit,TaxpayorID,AccountRep,EligibleFuturePayor,LastModTime,LastModBy"
	RRdb.DBFields["Payor"] = flds
	RRdb.Prepstmt.GetPayor, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Payor where TCID=?")
	Errcheck(err)
	_, _, s3, s4, s5 = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertPayor, err = RRdb.Dbrr.Prepare("INSERT INTO Payor (" + s4 + ") VALUES(" + s5 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdatePayor, err = RRdb.Dbrr.Prepare("UPDATE Payor SET " + s3 + " WHERE TCID=?")
	Errcheck(err)

	//==========================================
	// PROSPECT
	//==========================================
	flds = "TCID,BID,EmployerName,EmployerStreetAddress,EmployerCity,EmployerState,EmployerPostalCode,EmployerEmail,EmployerPhone,Occupation,ApplicationFee,DesiredUsageStartDate,RentableTypePreference,FLAGS,Approver,DeclineReasonSLSID,OtherPreferences,FollowUpDate,CSAgent,OutcomeSLSID,FloatingDeposit,RAID,LastModTime,LastModBy"
	RRdb.DBFields["Prospect"] = flds
	RRdb.Prepstmt.GetProspect, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Prospect where TCID=?")
	Errcheck(err)
	_, _, s3, s4, s5 = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertProspect, err = RRdb.Dbrr.Prepare("INSERT INTO Prospect (" + s4 + ") VALUES(" + s5 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateProspect, err = RRdb.Dbrr.Prepare("UPDATE Prospect SET " + s3 + " WHERE TCID=?")
	Errcheck(err)

	//==========================================
	// RATE PLAN
	//==========================================
	flds = "RPID,BID,Name,LastModTime,LastModBy"
	RRdb.DBFields["RatePlan"] = flds
	RRdb.Prepstmt.GetRatePlan, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RatePlan WHERE RPID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRatePlanByName, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RatePlan WHERE BID=? AND Name=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllRatePlans, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RatePlan WHERE BID=?")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertRatePlan, err = RRdb.Dbrr.Prepare("INSERT INTO RatePlan (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRatePlan, err = RRdb.Dbrr.Prepare("UPDATE RatePlan SET " + s3 + " WHERE RPID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteRatePlan, err = RRdb.Dbrr.Prepare("DELETE FROM RatePlan WHERE RPID=?")
	Errcheck(err)

	flds = "RPRID,BID,RPID,DtStart,DtStop,FeeAppliesAge,MaxNoFeeUsers,AdditionalUserFee,PromoCode,CancellationFee,FLAGS,LastModTime,LastModBy"
	RRdb.DBFields["RatePlanRef"] = flds
	RRdb.Prepstmt.GetRatePlanRef, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RatePlanRef WHERE RPRID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRatePlanRefsInRange, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from RatePlanRef WHERE RPID=? and ?>=DtStart and ?<DtStop")
	Errcheck(err)
	RRdb.Prepstmt.GetAllRatePlanRefsInRange, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from RatePlanRef WHERE ?>=DtStart and ?<DtStop")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertRatePlanRef, err = RRdb.Dbrr.Prepare("INSERT INTO RatePlanRef (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRatePlanRef, err = RRdb.Dbrr.Prepare("UPDATE RatePlanRef SET " + s3 + " WHERE RPRID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteRatePlanRef, err = RRdb.Dbrr.Prepare("DELETE FROM RatePlanRef WHERE RPRID=?")
	Errcheck(err)

	flds = "RPRID,BID,RTID,FLAGS,Val"
	RRdb.DBFields["RatePlanRefRTRate"] = flds
	RRdb.Prepstmt.GetRatePlanRefRTRate, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RatePlanRefRTRate WHERE RPRID=? and RTID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllRatePlanRefRTRates, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RatePlanRefRTRate WHERE RPRID=?")
	Errcheck(err)
	RRdb.Prepstmt.InsertRatePlanRefRTRate, err = RRdb.Dbrr.Prepare("INSERT INTO RatePlanRefRTRate (" + flds + ") VALUES(?,?,?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRatePlanRefRTRate, err = RRdb.Dbrr.Prepare("UPDATE  RatePlanRefRTRate SET BID=?,FLAGS=?,Val=? WHERE RPRID=? and RTID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteRatePlanRefRTRate, err = RRdb.Dbrr.Prepare("DELETE FROM  RatePlanRefRTRate WHERE RPRID=? and RTID=?")
	Errcheck(err)

	flds = "RPRID,BID,RTID,RSPID,FLAGS,Val"
	RRdb.DBFields["RatePlanRefSPRate"] = flds
	RRdb.Prepstmt.GetRatePlanRefSPRate, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RatePlanRefSPRate WHERE RPRID=? and RTID=? and RSPID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllRatePlanRefSPRates, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RatePlanRefSPRate WHERE RPRID=? and RTID=?")
	Errcheck(err)
	RRdb.Prepstmt.InsertRatePlanRefSPRate, err = RRdb.Dbrr.Prepare("INSERT INTO RatePlanRefSPRate (" + flds + ") VALUES(?,?,?,?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRatePlanRefSPRate, err = RRdb.Dbrr.Prepare("UPDATE RatePlanRefSPRate SET FLAGS=?,Val=? WHERE RPRID=? and RTID=? and RSPID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteRatePlanRefSPRate, err = RRdb.Dbrr.Prepare("DELETE FROM RatePlanRefSPRate WHERE RPRID=? and RSPID=?")
	Errcheck(err)

	//==========================================
	// RECEIPT
	//==========================================
	flds = "RCPTID,PRCPTID,BID,TCID,PMTID,DEPID,DID,Dt,DocNo,Amount,AcctRule,ARID,Comment,OtherPayorName,LastModTime,LastModBy"
	RRdb.DBFields["Receipt"] = flds
	RRdb.Prepstmt.GetReceipt, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Receipt WHERE RCPTID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetReceiptDuplicate, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Receipt WHERE Dt=? AND Amount=? AND DocNo=?")
	Errcheck(err)
	RRdb.Prepstmt.GetReceiptsInDateRange, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Receipt WHERE BID=? AND Dt >= ? AND Dt < ?")
	Errcheck(err)
	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertReceipt, err = RRdb.Dbrr.Prepare("INSERT INTO Receipt (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.DeleteReceipt, err = RRdb.Dbrr.Prepare("DELETE FROM Receipt WHERE RCPTID=?")
	Errcheck(err)
	RRdb.Prepstmt.UpdateReceipt, err = RRdb.Dbrr.Prepare("UPDATE Receipt SET " + s3 + " WHERE RCPTID=?")
	Errcheck(err)

	//==========================================
	// RECEIPT ALLOCATION
	//==========================================
	flds = "RCPAID,RCPTID,BID,RAID,Dt,Amount,ASMID,AcctRule"
	RRdb.DBFields["ReceiptAllocation"] = flds
	RRdb.Prepstmt.GetReceiptAllocation, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM ReceiptAllocation WHERE RCPAID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetReceiptAllocations, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM ReceiptAllocation WHERE RCPTID=? ORDER BY Amount DESC, RAID ASC, ASMID ASC")
	Errcheck(err)
	RRdb.Prepstmt.GetReceiptAllocationsInRAIDDateRange, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM ReceiptAllocation WHERE BID=? AND RAID=? AND Dt >= ? and Dt < ?")
	Errcheck(err)
	s1, s2, _, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertReceiptAllocation, err = RRdb.Dbrr.Prepare("INSERT INTO ReceiptAllocation (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.DeleteReceiptAllocation, err = RRdb.Dbrr.Prepare("DELETE FROM ReceiptAllocation WHERE RCPAID=?") // delete just this allocation
	Errcheck(err)
	RRdb.Prepstmt.DeleteReceiptAllocations, err = RRdb.Dbrr.Prepare("DELETE FROM ReceiptAllocation WHERE RCPTID=?") // delete all associated with the receipt
	Errcheck(err)
	RRdb.Prepstmt.UpdateReceiptAllocation, err = RRdb.Dbrr.Prepare("UPDATE ReceiptAllocation SET RCPTID=?,BID=?,RAID=?,Dt=?,Amount=?,ASMID=?,AcctRule=? WHERE RCPAID=?")
	Errcheck(err)

	//===============================
	//  Rentable
	//===============================
	flds = "RID,BID,RentableName,AssignmentTime,LastModTime,LastModBy"
	RRdb.DBFields["Rentable"] = flds
	RRdb.Prepstmt.CountBusinessRentables, err = RRdb.Dbrr.Prepare("SELECT COUNT(RID) FROM Rentable WHERE BID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRentableTypeDown, err = RRdb.Dbrr.Prepare("SELECT RID,RentableName FROM Rentable WHERE BID=? AND (RentableName LIKE ?) LIMIT ?")
	Errcheck(err)
	RRdb.Prepstmt.GetRentable, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Rentable WHERE RID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRentableByName, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Rentable WHERE RentableName=? AND BID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllRentablesByBusiness, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Rentable WHERE BID=?")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertRentable, err = RRdb.Dbrr.Prepare("INSERT INTO Rentable (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRentable, err = RRdb.Dbrr.Prepare("UPDATE Rentable SET " + s3 + " WHERE RID=?")
	Errcheck(err)

	//===============================
	//  Rental Agreement
	//===============================
	flds = "RAID,RATID,BID,NLID,AgreementStart,AgreementStop,PossessionStart,PossessionStop,RentStart,RentStop,RentCycleEpoch,UnspecifiedAdults,UnspecifiedChildren,Renewal,SpecialProvisions,LeaseType,ExpenseAdjustmentType,ExpensesStop,ExpenseStopCalculation,BaseYearEnd,ExpenseAdjustment,EstimatedCharges,RateChange,NextRateChange,PermittedUses,ExclusiveUses,ExtensionOption,ExtensionOptionNotice,ExpansionOption,ExpansionOptionNotice,RightOfFirstRefusal,LastModTime,LastModBy"
	RRdb.DBFields["RentalAgreement"] = flds
	RRdb.Prepstmt.CountBusinessRentalAgreements, err = RRdb.Dbrr.Prepare("SELECT COUNT(RAID) FROM RentalAgreement WHERE BID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRentalAgreementByBusiness, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from RentalAgreement where BID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRentalAgreement, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RentalAgreement WHERE RAID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllRentalAgreementsByRange, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RentalAgreement WHERE BID=? AND ?<=AgreementStop AND ?>AgreementStart")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertRentalAgreement, err = RRdb.Dbrr.Prepare("INSERT INTO RentalAgreement (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRentalAgreement, err = RRdb.Dbrr.Prepare("UPDATE RentalAgreement SET " + s3 + " WHERE RAID=?")
	Errcheck(err)

	RRdb.Prepstmt.GetAllRentalAgreements, err = RRdb.Dbrr.Prepare("SELECT RAID from RentalAgreement WHERE BID=?")
	Errcheck(err)

	//====================================================
	//  Rental Agreement { Rentable | Users | Payors }
	//====================================================
	flds = "RARID,RAID,BID,RID,CLID,ContractRent,RARDtStart,RARDtStop"
	RRdb.DBFields["RentalAgreementRentables"] = flds
	RRdb.Prepstmt.GetRARentableForDate, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from RentalAgreementRentables WHERE RAID=? AND ?>=RARDtStart AND ?<RARDtStop")
	Errcheck(err)
	RRdb.Prepstmt.GetRentalAgreementRentables, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from RentalAgreementRentables WHERE RAID=? and ?<RARDtStop and ?>=RARDtStart")
	Errcheck(err)
	RRdb.Prepstmt.GetRentalAgreementsForRentable, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from RentalAgreementRentables WHERE RID=? and ?<RARDtStop and ?>RARDtStart")
	Errcheck(err)
	RRdb.Prepstmt.GetAgreementsForRentable, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from RentalAgreementRentables WHERE RID=? and ?<RARDtStop and ?>RARDtStart")
	Errcheck(err)
	RRdb.Prepstmt.GetRentalAgreementRentable, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from RentalAgreementRentables WHERE RARID=?")
	Errcheck(err)
	RRdb.Prepstmt.InsertRentalAgreementRentable, err = RRdb.Dbrr.Prepare("INSERT INTO RentalAgreementRentables (RAID,BID,RID,CLID,ContractRent,RARDtStart,RARDtStop) VALUES(?,?,?,?,?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRentalAgreementRentable, err = RRdb.Dbrr.Prepare("UPDATE RentalAgreementRentables SET RAID=?,BID=?,RID=?,CLID=?,ContractRent=?,RARDtStart=?,RARDtStop=? WHERE RARID=?")
	Errcheck(err)
	RRdb.Prepstmt.FindAgreementByRentable, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RentalAgreementRentables WHERE RID=? AND RARDtStop>? AND RARDtStart<=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteRentalAgreementRentable, err = RRdb.Dbrr.Prepare("DELETE FROM RentalAgreementRentables WHERE RARID=?")
	Errcheck(err)

	RRdb.Prepstmt.GetRentableUser, err = RRdb.Dbrr.Prepare("SELECT RUID,RID,BID,TCID,DtStart,DtStop from RentableUsers WHERE RUID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRentableUsersInRange, err = RRdb.Dbrr.Prepare("SELECT RUID,RID,BID,TCID,DtStart,DtStop from RentableUsers WHERE RID=? and ?<DtStop and ?>=DtStart")
	Errcheck(err)
	RRdb.Prepstmt.GetRentableUserByRBT, err = RRdb.Dbrr.Prepare("SELECT RUID,RID,BID,TCID,DtStart,DtStop from RentableUsers WHERE RID=? AND BID=? AND TCID=?")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRentableUser, err = RRdb.Dbrr.Prepare("UPDATE RentableUsers SET RID=?,BID=?,TCID=?,DtStart=?,DtStop=? WHERE RUID=?")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRentableUserByRBT, err = RRdb.Dbrr.Prepare("UPDATE RentableUsers SET DtStart=?,DtStop=? WHERE RID=? AND BID=? AND TCID=?")
	Errcheck(err)
	RRdb.Prepstmt.InsertRentableUser, err = RRdb.Dbrr.Prepare("INSERT INTO RentableUsers (RID,BID,TCID,DtStart,DtStop) VALUES(?,?,?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.DeleteRentableUserByRBT, err = RRdb.Dbrr.Prepare("DELETE from RentableUsers WHERE RID=? AND BID=? AND TCID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteRentableUser, err = RRdb.Dbrr.Prepare("DELETE FROM RentableUsers WHERE RUID=?")
	Errcheck(err)

	flds = "RAPID,RAID,BID,TCID,DtStart,DtStop,FLAGS"
	RRdb.Prepstmt.GetRentalAgreementPayor, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from RentalAgreementPayors WHERE RAPID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRentalAgreementPayorsInRange, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from RentalAgreementPayors WHERE RAID=? and ?<DtStop and ?>=DtStart")
	Errcheck(err)
	RRdb.Prepstmt.GetRentalAgreementPayorByRBT, err = RRdb.Dbrr.Prepare("SELECT " + flds + " from RentalAgreementPayors WHERE RAID=? AND BID=? AND TCID=?")
	Errcheck(err)
	RRdb.Prepstmt.InsertRentalAgreementPayor, err = RRdb.Dbrr.Prepare("INSERT INTO RentalAgreementPayors (RAID,BID,TCID,DtStart,DtStop,FLAGS) VALUES(?,?,?,?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRentalAgreementPayor, err = RRdb.Dbrr.Prepare("UPDATE RentalAgreementPayors SET RAID=?,BID=?,TCID=?,DtStart=?,DtStop=?,FLAGS=? WHERE RAPID=?")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRentalAgreementPayorByRBT, err = RRdb.Dbrr.Prepare("UPDATE RentalAgreementPayors SET DtStart=?,DtStop=?,FLAGS=? WHERE RAID=? AND BID=? AND TCID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteRentalAgreementPayorByRBT, err = RRdb.Dbrr.Prepare("DELETE from RentalAgreementPayors WHERE RAID=? AND BID=? AND TCID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteRentalAgreementPayor, err = RRdb.Dbrr.Prepare("DELETE FROM RentalAgreementPayors WHERE RAPID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRentalAgreementsByPayor, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RentalAgreementPayors WHERE BID=? AND TCID=? AND DtStart<=? AND ?<DtStop")
	Errcheck(err)

	//===============================
	//  Rental Agreement Template
	//===============================
	flds = "RATID,BID,RATemplateName,LastModTime,LastModBy"
	RRdb.DBFields["RentalAgreementTemplate"] = flds
	RRdb.Prepstmt.GetAllRentalAgreementTemplates, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RentalAgreementTemplate")
	Errcheck(err)
	RRdb.Prepstmt.GetRentalAgreementTemplate, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RentalAgreementTemplate WHERE RATID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRentalAgreementByRATemplateName, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RentalAgreementTemplate WHERE RATemplateName=?")
	Errcheck(err)
	s1, s2, _, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertRentalAgreementTemplate, err = RRdb.Dbrr.Prepare("INSERT INTO RentalAgreementTemplate (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)

	//===============================
	//  RentableTypeRef
	//===============================
	flds = "RID,BID,RTID,OverrideRentCycle,OverrideProrationCycle,DtStart,DtStop,LastModTime,LastModBy"
	RRdb.DBFields["RentableTypeRef"] = flds
	RRdb.Prepstmt.GetRentableTypeRefsByRange, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RentableTypeRef WHERE RID=? and DtStop>? and DtStart<? ORDER BY DtStart ASC")
	Errcheck(err)

	//s1, s2, s3, s4, s5 = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertRentableTypeRef, err = RRdb.Dbrr.Prepare("INSERT INTO RentableTypeRef (RID,BID,RTID,OverrideRentCycle,OverrideProrationCycle,DtStart,DtStop,LastModBy) VALUES(?,?,?,?,?,?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRentableTypeRef, err = RRdb.Dbrr.Prepare("UPDATE RentableTypeRef SET BID=?,RTID=?,OverrideRentCycle=?,OverrideProrationCycle=?,DtStart=?,DtStop=?,LastModBy=? WHERE RID=? and DtStart=? and DtStop=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteRentableTypeRef, err = RRdb.Dbrr.Prepare("DELETE from RentableTypeRef WHERE RID=? and DtStart=? and DtStop=?")
	Errcheck(err)

	//===============================
	//  RentableSpecialtyRef
	//===============================
	RRdb.Prepstmt.GetRentableSpecialtyRefs, err = RRdb.Dbrr.Prepare("SELECT RSPID FROM RentableSpecialtyRef WHERE BID=? and RID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRentableSpecialtyRefsByRange, err = RRdb.Dbrr.Prepare("SELECT BID,RID,RSPID,DtStart,DtStop,LastModTime,LastModBy FROM RentableSpecialtyRef WHERE BID=? and RID=? and DtStop>? and DtStart<? ORDER BY DtStart ASC")
	Errcheck(err)
	RRdb.Prepstmt.GetAllRentableSpecialtyRefs, err = RRdb.Dbrr.Prepare("SELECT BID,RID,RSPID,DtStart,DtStop,LastModTime,LastModBy FROM RentableSpecialtyRef WHERE BID=? ORDER BY DtStart ASC")
	Errcheck(err)

	RRdb.Prepstmt.InsertRentableSpecialtyRef, err = RRdb.Dbrr.Prepare("INSERT INTO RentableSpecialtyRef (BID,RID,RSPID,DtStart,DtStop,LastModBy) VALUES(?,?,?,?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRentableSpecialtyRef, err = RRdb.Dbrr.Prepare("UPDATE RentableSpecialtyRef SET RSPID=?,LastModBy=? WHERE RID=? and DtStart=? and DtStop=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteRentableSpecialtyRef, err = RRdb.Dbrr.Prepare("DELETE from RentableSpecialtyRef WHERE RID=? and DtStart=? and DtStop=?")
	Errcheck(err)

	//===============================
	//  RentableSpecialty
	//===============================
	RRdb.Prepstmt.InsertRentableSpecialtyType, err = RRdb.Dbrr.Prepare("INSERT INTO RentableSpecialty (RSPID,BID,Name,Fee,Description) VALUES(?,?,?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.GetRentableSpecialtyTypeByName, err = RRdb.Dbrr.Prepare("SELECT RSPID,BID,Name,Fee,Description FROM RentableSpecialty WHERE BID=? and Name=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRentableSpecialtyType, err = RRdb.Dbrr.Prepare("SELECT RSPID,BID,Name,Fee,Description FROM RentableSpecialty WHERE RSPID=?")
	Errcheck(err)

	//===============================
	//  RentableStatus
	//===============================
	flds = "RID,BID,DtStart,DtStop,DtNoticeToVacate,Status,LastModTime,LastModBy"
	RRdb.DBFields["RentableStatus"] = flds
	RRdb.Prepstmt.GetRentableStatusByRange, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM RentableStatus WHERE RID=? and DtStop>? and DtStart<?")
	Errcheck(err)

	RRdb.Prepstmt.InsertRentableStatus, err = RRdb.Dbrr.Prepare("INSERT INTO RentableStatus (RID,BID,DtStart,DtStop,DtNoticeToVacate,Status,LastModBy) VALUES(?,?,?,?,?,?,?)")
	Errcheck(err)
	RRdb.Prepstmt.UpdateRentableStatus, err = RRdb.Dbrr.Prepare("UPDATE RentableStatus SET BID=?,DtNoticeToVacate=?,Status=?,LastModBy=? WHERE RID=? and DtStart=? and DtStop=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteRentableStatus, err = RRdb.Dbrr.Prepare("DELETE from RentableStatus WHERE RID=? and DtStart=? and DtStop=?")
	Errcheck(err)

	//===============================
	//  Rentable Type
	//===============================
	RTYfields := "RTID,BID,Style,Name,RentCycle,Proration,GSRPC,ManageToBudget,LastModTime,LastModBy"
	RRdb.DBFields["RentableTypes"] = flds
	RRdb.Prepstmt.CountBusinessRentableTypes, err = RRdb.Dbrr.Prepare("SELECT COUNT(RTID) FROM RentableTypes WHERE BID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRentableType, err = RRdb.Dbrr.Prepare("SELECT " + RTYfields + " FROM RentableTypes WHERE RTID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetRentableTypeByStyle, err = RRdb.Dbrr.Prepare("SELECT " + RTYfields + " FROM RentableTypes WHERE Style=? and BID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllBusinessRentableTypes, err = RRdb.Dbrr.Prepare("SELECT " + RTYfields + " FROM RentableTypes WHERE BID=? ORDER BY RTID ASC")
	Errcheck(err)

	s1, s2, _, _, _ = GenSQLInsertAndUpdateStrings(RTYfields)
	RRdb.Prepstmt.InsertRentableType, err = RRdb.Dbrr.Prepare("INSERT INTO RentableTypes (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)

	//===============================
	//  RentableMarketRates
	//===============================
	RRdb.Prepstmt.GetRentableMarketRates, err = RRdb.Dbrr.Prepare("SELECT RTID,BID,MarketRate,DtStart,DtStop from RentableMarketRate WHERE RTID=?")
	Errcheck(err)
	RRdb.Prepstmt.InsertRentableMarketRates, err = RRdb.Dbrr.Prepare("INSERT INTO RentableMarketRate (RTID,BID,MarketRate,DtStart,DtStop) VALUES(?,?,?,?,?)")
	Errcheck(err)

	//==========================================
	// SOURCE
	//==========================================
	SRCflds := "SourceSLSID,BID,Name,Industry,LastModTime,LastModBy"
	RRdb.DBFields["DemandSource"] = flds
	RRdb.Prepstmt.GetDemandSource, err = RRdb.Dbrr.Prepare("SELECT " + SRCflds + " FROM DemandSource WHERE SourceSLSID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetDemandSourceByName, err = RRdb.Dbrr.Prepare("SELECT " + SRCflds + " FROM DemandSource WHERE BID=? and Name=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllDemandSources, err = RRdb.Dbrr.Prepare("SELECT " + SRCflds + " FROM DemandSource WHERE BID=?")
	Errcheck(err)
	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(SRCflds)
	RRdb.Prepstmt.InsertDemandSource, err = RRdb.Dbrr.Prepare("INSERT INTO DemandSource (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateDemandSource, err = RRdb.Dbrr.Prepare("UPDATE DemandSource SET " + s3 + " WHERE SourceSLSID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteDemandSource, err = RRdb.Dbrr.Prepare("DELETE from DemandSource WHERE SourceSLSID=?")
	Errcheck(err)

	//==========================================
	// STRING LIST
	//==========================================
	STRLflds := "SLID,BID,Name,LastModTime,LastModBy"
	RRdb.DBFields["StringList"] = flds
	RRdb.Prepstmt.GetStringList, err = RRdb.Dbrr.Prepare("SELECT " + STRLflds + " FROM StringList WHERE SLID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllStringLists, err = RRdb.Dbrr.Prepare("SELECT " + STRLflds + " FROM StringList WHERE BID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetStringListByName, err = RRdb.Dbrr.Prepare("SELECT " + STRLflds + " FROM StringList WHERE BID=? AND Name=?")
	Errcheck(err)
	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(STRLflds)
	RRdb.Prepstmt.InsertStringList, err = RRdb.Dbrr.Prepare("INSERT INTO StringList (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateStringList, err = RRdb.Dbrr.Prepare("UPDATE StringList SET " + s3 + " WHERE SLID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteStringList, err = RRdb.Dbrr.Prepare("DELETE from StringList WHERE SLID=?")
	Errcheck(err)

	SLSflds := "SLSID,BID,SLID,Value,LastModTime,LastModBy"
	RRdb.Prepstmt.GetSLString, err = RRdb.Dbrr.Prepare("SELECT " + SLSflds + " FROM SLString WHERE SLSID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetSLStrings, err = RRdb.Dbrr.Prepare("SELECT " + SLSflds + " FROM SLString WHERE SLID=?")
	Errcheck(err)
	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(SLSflds)
	RRdb.Prepstmt.InsertSLString, err = RRdb.Dbrr.Prepare("INSERT INTO SLString (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateSLString, err = RRdb.Dbrr.Prepare("UPDATE SLString SET " + s3 + " WHERE SLSID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteSLString, err = RRdb.Dbrr.Prepare("DELETE from SLString WHERE SLSID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteSLStrings, err = RRdb.Dbrr.Prepare("DELETE from SLString WHERE SLID=?")
	Errcheck(err)

	//==========================================
	// TRANSACTANT
	//==========================================
	// "TCID,BID,NLID,FirstName,MiddleName,LastName,PreferredName,CompanyName,IsCompany,PrimaryEmail,SecondaryEmail,WorkPhone,CellPhone,Address,Address2,City,State,PostalCode,Country,Website,LastModTime,LastModBy"
	RRdb.Prepstmt.GetTransactantTypeDown, err = RRdb.Dbrr.Prepare("SELECT TCID,FirstName,MiddleName,LastName,CompanyName,IsCompany FROM Transactant WHERE BID=? AND (FirstName LIKE ? OR MiddleName LIKE ? OR LastName LIKE ? OR CompanyName LIKE ?) LIMIT ?")
	Errcheck(err)
	RRdb.Prepstmt.CountBusinessTransactants, err = RRdb.Dbrr.Prepare("SELECT COUNT(TCID) FROM Transactant WHERE BID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetTransactant, err = RRdb.Dbrr.Prepare("SELECT " + TRNSfields + " FROM Transactant WHERE TCID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetAllTransactants, err = RRdb.Dbrr.Prepare("SELECT " + TRNSfields + " FROM Transactant")
	Errcheck(err)
	RRdb.Prepstmt.GetAllTransactantsForBID, err = RRdb.Dbrr.Prepare("SELECT " + TRNSfields + " FROM Transactant WHERE BID=?")
	Errcheck(err)
	RRdb.Prepstmt.FindTransactantByPhoneOrEmail, err = RRdb.Dbrr.Prepare("SELECT " + TRNSfields + " FROM Transactant where WorkPhone=? OR CellPhone=? or PrimaryEmail=? or SecondaryEmail=?")
	Errcheck(err)
	RRdb.Prepstmt.FindTCIDByNote, err = RRdb.Dbrr.Prepare("SELECT t.TCID FROM Transactant t, Notes n WHERE t.NLID = n.NLID AND n.Comment=?")
	Errcheck(err)

	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(TRNSfields)
	RRdb.Prepstmt.InsertTransactant, err = RRdb.Dbrr.Prepare("INSERT INTO Transactant (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateTransactant, err = RRdb.Dbrr.Prepare("UPDATE Transactant SET " + s3 + " WHERE TCID=?")
	Errcheck(err)

	//==========================================
	// UIGrid
	//==========================================
	RRdb.Prepstmt.UIRAGrid, err = RRdb.Dbrr.Prepare("SELECT ra.RAID,rap.TCID,ra.AgreementStart,ra.AgreementStop FROM RentalAgreement ra INNER JOIN RentalAgreementPayors rap ON ra.RAID=rap.RAID AND rap.DtStart<=? AND ?<rap.DtStop WHERE ra.BID=?")
	Errcheck(err)

	//==========================================
	// User
	//==========================================
	flds = "TCID,BID,Points,DateofBirth,EmergencyContactName,EmergencyContactAddress,EmergencyContactTelephone,EmergencyEmail,AlternateAddress,EligibleFutureUser,Industry,SourceSLSID,LastModTime,LastModBy"
	RRdb.DBFields["User"] = flds
	RRdb.Prepstmt.GetUser, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM User where TCID=?")
	Errcheck(err)
	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	// TCID is included as it needs to be the same as the TransactantID
	s4 = "INSERT INTO User (" + "TCID," + s1 + ") VALUES(" + "?," + s2 + ")"
	// fmt.Printf("Insert User SQL:  \"%s\"\n", s4)
	RRdb.Prepstmt.InsertUser, err = RRdb.Dbrr.Prepare(s4)
	Errcheck(err)
	RRdb.Prepstmt.UpdateUser, err = RRdb.Dbrr.Prepare("UPDATE User SET " + s3 + " WHERE TCID=?")
	Errcheck(err)
	// RRdb.Prepstmt.DeleteUser, err = RRdb.Dbrr.Prepare("DELETE from User WHERE TCID=?")
	// Errcheck(err)

	//==========================================
	// Vehicle
	//==========================================
	flds = "VID,TCID,BID,VehicleType,VehicleMake,VehicleModel,VehicleColor,VehicleYear,LicensePlateState,LicensePlateNumber,ParkingPermitNumber,DtStart,DtStop,LastModTime,LastModBy"
	RRdb.DBFields["Vehicle"] = flds
	RRdb.Prepstmt.GetVehicle, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Vehicle where VID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetVehiclesByTransactant, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Vehicle where TCID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetVehiclesByBID, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Vehicle where BID=?")
	Errcheck(err)
	RRdb.Prepstmt.GetVehiclesByLicensePlate, err = RRdb.Dbrr.Prepare("SELECT " + flds + " FROM Vehicle where LicensePlateNumber=?")
	Errcheck(err)
	s1, s2, s3, _, _ = GenSQLInsertAndUpdateStrings(flds)
	RRdb.Prepstmt.InsertVehicle, err = RRdb.Dbrr.Prepare("INSERT INTO Vehicle (" + s1 + ") VALUES(" + s2 + ")")
	Errcheck(err)
	RRdb.Prepstmt.UpdateVehicle, err = RRdb.Dbrr.Prepare("UPDATE Vehicle SET " + s3 + " WHERE VID=?")
	Errcheck(err)
	RRdb.Prepstmt.DeleteVehicle, err = RRdb.Dbrr.Prepare("DELETE from Vehicle WHERE VID=?")
	Errcheck(err)

}
