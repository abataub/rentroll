#!/bin/bash

#==========================================================================
#  This script performs SQL schema changes on the test databases that are
#  saved as SQL files in the test directory. It loads them, performs the
#  ALTER commands, then saves the sql file.
#
#  If the test file uses its own database saved as a .sql file, make sure
#  it is listed in the dbs array
#==========================================================================

MODFILE="dbqqqmods.sql"
MYSQL="mysql --no-defaults"
MYSQLDUMP="mysqldump --no-defaults"

#=====================================================
#  History of db mods
#=====================================================
# # Sep 25, 2017
# ALTER TABLE RentalAgreement ADD COLUMN FLAGS BIGINT NOT NULL DEFAULT 0 AFTER RightOfFirstRefusal;
# # Sep 26, 2017
# ALTER TABLE AR ADD COLUMN FLAGS BIGINT NOT NULL DEFAULT 0 AFTER DtStop;
# ALTER TABLE AR ADD COLUMN DefaultAmount DECIMAL(19,4) NOT NULL DEFAULT 0.0 AFTER FLAGS;
# # Sep 27, 2017
# ALTER TABLE Receipt ADD COLUMN RAID BIGINT NOT NULL DEFAULT 0 AFTER DID;
# # Oct 9, 2017
# ALTER TABLE Rentable ADD COLUMN MRStatus SMALLINT NOT NULL DEFAULT 0 AFTER AssignmentTime;
# ALTER TABLE Rentable ADD DtMRStart TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER MRStatus;
# ALTER TABLE RentableStatus CHANGE Status UseStatus SMALLINT NOT NULL DEFAULT 0;
# ALTER TABLE RentableStatus ADD COLUMN LeaseStatus SMALLINT NOT NULL DEFAULT 0 AFTER UseStatus;
# DROP TABLE IF EXISTS SubAR;
# CREATE TABLE SubAR (
#     SARID BIGINT NOT NULL AUTO_INCREMENT,
#     ARID BIGINT NOT NULL DEFAULT 0,                         -- Which ARID
#     SubARID BIGINT NOT NULL DEFAULT 0,                      -- ARID of the sub-account rule
#     BID BIGINT NOT NULL DEFAULT 0,
#     LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- when was this record last written
#     LastModBy BIGINT NOT NULL DEFAULT 0,                    -- employee UID (from phonebook) that modified it
#     CreateTS TIMESTAMP DEFAULT CURRENT_TIMESTAMP,           -- when was this record created
#     CreateBy BIGINT NOT NULL DEFAULT 0,                     -- employee UID (from phonebook) that created this record
#     PRIMARY KEY(SARID)
# );
# ALTER TABLE Assessments ADD COLUMN AGRCPTID BIGINT NOT NULL DEFAULT 0 AFTER RPASMID;

# # 13 Dec, 2017
# ALTER TABLE CustomAttrRef ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE CustomAttrRef ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE RentalAgreementRentables ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE RentalAgreementRentables ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE RentalAgreementPayors ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE RentalAgreementPayors ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE RentableUsers ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE RentableUsers ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE RentalAgreementTax ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE RentalAgreementTax ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE CommissionLedger ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE CommissionLedger ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE RatePlanRefRTRate ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE RatePlanRefRTRate ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE RatePlanRefSPRate ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE RatePlanRefSPRate ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE RatePlanOD ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE RatePlanOD ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE OtherDeliverables ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE OtherDeliverables ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE RentableMarketRate ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE RentableMarketRate ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE RentableTypeTax ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE RentableTypeTax ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE RentableSpecialty ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE RentableSpecialty ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE AvailabilityTypes ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE AvailabilityTypes ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE BusinessAssessments ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE BusinessAssessments ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE BusinessPaymentTypes ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE BusinessPaymentTypes ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE InvoiceAssessment ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE InvoiceAssessment ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE InvoicePayor ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE InvoicePayor ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE JournalAllocation ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE JournalAllocation ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE JournalAudit DROP COLUMN ModTime;
# ALTER TABLE JournalAudit ADD CreateTS TIMESTAMP DEFAULT CURRENT_TIMESTAMP AFTER UID;
# ALTER TABLE JournalAudit ADD CreateBy BIGINT NOT NULL DEFAULT 0 AFTER CreateTS;
# ALTER TABLE JournalAudit ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE JournalAudit ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE JournalMarkerAudit DROP COLUMN ModTime;
# ALTER TABLE JournalMarkerAudit ADD CreateTS TIMESTAMP DEFAULT CURRENT_TIMESTAMP AFTER UID;
# ALTER TABLE JournalMarkerAudit ADD CreateBy BIGINT NOT NULL DEFAULT 0 AFTER CreateTS;
# ALTER TABLE JournalMarkerAudit ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE JournalMarkerAudit ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE LedgerAudit DROP COLUMN ModTime;
# ALTER TABLE LedgerAudit ADD CreateTS TIMESTAMP DEFAULT CURRENT_TIMESTAMP AFTER UID;
# ALTER TABLE LedgerAudit ADD CreateBy BIGINT NOT NULL DEFAULT 0 AFTER CreateTS;
# ALTER TABLE LedgerAudit ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE LedgerAudit ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;
# ALTER TABLE LedgerMarkerAudit DROP COLUMN ModTime;
# ALTER TABLE LedgerMarkerAudit ADD CreateTS TIMESTAMP DEFAULT CURRENT_TIMESTAMP AFTER UID;
# ALTER TABLE LedgerMarkerAudit ADD CreateBy BIGINT NOT NULL DEFAULT 0 AFTER CreateTS;
# ALTER TABLE LedgerMarkerAudit ADD LastModTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER CreateBy;
# ALTER TABLE LedgerMarkerAudit ADD LastModBy BIGINT NOT NULL DEFAULT 0 AFTER LastModTime;

# # 1 Jan, 2018
# ALTER TABLE rentroll.CustomAttrRef ADD CARID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY;
# ALTER TABLE rentroll.RatePlanRefRTRate ADD RPRRTRateID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY;
# ALTER TABLE rentroll.RatePlanRefSPRate ADD RPRSPRateID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY;
# ALTER TABLE rentroll.RentableSpecialtyRef ADD RSPRefID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY;
# ALTER TABLE rentroll.Prospect MODIFY TCID BIGINT NOT NULL;
# ALTER TABLE rentroll.User MODIFY TCID BIGINT NOT NULL;
# ALTER TABLE rentroll.Payor MODIFY TCID BIGINT NOT NULL;
# ALTER TABLE rentroll.InvoiceAssessment ADD InvoiceASMID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY;
# ALTER TABLE rentroll.InvoicePayor ADD InvoicePayorID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY;

# # 15 Feb, 2018
# ALTER TABLE rentroll.Business ADD FLAGS BIGINT NOT NULL DEFAULT 0 AFTER DefaultGSRPC;


# 11-MAR-2018
# CREATE TABLE Task (
#     TID BIGINT NOT NULL AUTO_INCREMENT,
#     BID BIGINT NOT NULL DEFAULT 0,
#     TLID BIGINT NOT NULL DEFAULT 0,                             -- the TaskList to which this task belongs
#     Name VARCHAR(256) NOT NULL DEFAULT '',                      -- Task text
#     Worker VARCHAR(80) NOT NULL DEFAULT '',                     -- Name of the associated work function
#     DtDue TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00',     -- Task Due Date
#     DtPreDue TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00',  -- Pre Completion due date
#     DtDone TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00',    -- Task completion Date
#     DtPreDone TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00', -- Task Pre Completion Date
#     FLAGS BIGINT NOT NULL DEFAULT 0,                            -- 1<<0 pre-completion required (if 0 then there is no pre-completion required)
#                                                                 -- 1<<1 PreCompletion done (if 0 it is not yet done)
#                                                                 -- 1<<2 Completion done (if 0 it is not yet done)
#     LastModTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- when was this record last written
#     LastModBy BIGINT NOT NULL DEFAULT 0,                        -- employee UID (from phonebook) that modified it
#     CreateTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,      -- when was this record created
#     CreateBy BIGINT NOT NULL DEFAULT 0,                         -- employee UID (from phonebook) that created this record
#     PRIMARY KEY(TID)
# );

# CREATE TABLE TaskList (
#     TLID BIGINT NOT NULL AUTO_INCREMENT,
#     BID BIGINT NOT NULL DEFAULT 0,
#     Name VARCHAR(256) NOT NULL DEFAULT '',                      -- TaskList name
#     Cycle BIGINT NOT NULL DEFAULT 0,                            -- recurrence frequency (not editable)
#     DtDue TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00',     -- All tasks in task list are due on this date
#     DtPreDue TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00',  -- All tasks in task list pre-completion date
#     DtDone TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00',    -- Task completion Date
#     DtPreDone TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00', -- Task Pre Completion Date
#     FLAGS BIGINT NOT NULL DEFAULT 0,                            -- 1<<0 
#     LastModTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- when was this record last written
#     LastModBy BIGINT NOT NULL DEFAULT 0,                        -- employee UID (from phonebook) that modified it
#     CreateTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,      -- when was this record created
#     CreateBy BIGINT NOT NULL DEFAULT 0,                         -- employee UID (from phonebook) that created this record
#     PRIMARY KEY(TLID)
# );

# CREATE TABLE TaskListDefinition (
#     TLDID BIGINT NOT NULL AUTO_INCREMENT,
#     BID BIGINT NOT NULL DEFAULT 0,
#     Name VARCHAR(256) NOT NULL DEFAULT '',                      -- TaskList name
#     Cycle BIGINT NOT NULL DEFAULT 0,                            -- recurrence frequency (editable)
#     DtDue TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00',     -- All tasks in task list are due on this date
#     DtPreDue TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00',  -- All tasks in task list pre-completion date
#     DtDone TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00',    -- Task completion Date
#     DtPreDone TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00', -- Task Pre Completion Date
#     FLAGS BIGINT NOT NULL DEFAULT 0,                            -- 1<<0 
#     LastModTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- when was this record last written
#     LastModBy BIGINT NOT NULL DEFAULT 0,                        -- employee UID (from phonebook) that modified it
#     CreateTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,      -- when was this record created
#     CreateBy BIGINT NOT NULL DEFAULT 0,                         -- employee UID (from phonebook) that created this record
#     PRIMARY KEY(TLDID)
# );

# CREATE TABLE TaskDescriptor (
#     TDID BIGINT NOT NULL AUTO_INCREMENT,
#     BID BIGINT NOT NULL DEFAULT 0,
#     TLDID BIGINT NOT NULL DEFAULT 0,                            -- the TaskListDefinition to which this taskDescr belongs
#     Name VARCHAR(256) NOT NULL DEFAULT '',                      -- Task text
#     Worker VARCHAR(80) NOT NULL DEFAULT '',                     -- Name of the associated work function
#     EpochDue TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00',  -- Task Due Date
#     EpochPreDue TIMESTAMP NOT NULL DEFAULT '1970-01-01 00:00:00', -- Pre Completion due date
#     FLAGS BIGINT NOT NULL DEFAULT 0,                            -- 1<<0 pre-completion required (if 0 then there is no pre-completion required)
#     LastModTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- when was this record last written
#     LastModBy BIGINT NOT NULL DEFAULT 0,                        -- employee UID (from phonebook) that modified it
#     CreateTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,      -- when was this record created
#     CreateBy BIGINT NOT NULL DEFAULT 0,                         -- employee UID (from phonebook) that created this record
#     PRIMARY KEY(TDID)
# );

# # March 12, 2018 -- AWS production mysql server required DATETIME rather than TIMESTAMP for Default val
# ALTER TABLE Task MODIFY DtDue DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';
# ALTER TABLE Task MODIFY DtPreDue DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';
# ALTER TABLE Task MODIFY DtDone DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';
# ALTER TABLE Task MODIFY DtPreDone DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';

# ALTER TABLE TaskList MODIFY DtDue DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';
# ALTER TABLE TaskList MODIFY DtPreDue DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';
# ALTER TABLE TaskList MODIFY DtDone DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';
# ALTER TABLE TaskList MODIFY DtPreDone DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';

# ALTER TABLE TaskListDefinition MODIFY DtDue DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';
# ALTER TABLE TaskListDefinition MODIFY DtPreDue DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';
# ALTER TABLE TaskListDefinition MODIFY DtDone DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';
# ALTER TABLE TaskListDefinition MODIFY DtPreDone DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';

# ALTER TABLE TaskDescriptor MODIFY EpochDue DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';
# ALTER TABLE TaskDescriptor MODIFY EpochPreDue DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00';

# # March 14, 2018
# DROP TABLE IF EXISTS TaskListDefinition;
# CREATE TABLE TaskListDefinition (
#     TLDID BIGINT NOT NULL AUTO_INCREMENT,
#     BID BIGINT NOT NULL DEFAULT 0,
#     Name VARCHAR(256) NOT NULL DEFAULT '',                      -- TaskList name
#     Cycle BIGINT NOT NULL DEFAULT 0,                            -- recurrence frequency (editable)
#     Epoch DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00',      -- TaskList start Date
#     EpochDue DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00',   -- TaskList Due Date
#     EpochPreDue DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00', -- Pre Completion due date
#     FLAGS BIGINT NOT NULL DEFAULT 0,                            -- 1<<0 
#     LastModTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- when was this record last written
#     LastModBy BIGINT NOT NULL DEFAULT 0,                        -- employee UID (from phonebook) that modified it
#     CreateTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,      -- when was this record created
#     CreateBy BIGINT NOT NULL DEFAULT 0,                         -- employee UID (from phonebook) that created this record
#     PRIMARY KEY(TLDID)
# );

#=====================================================
#  Put modifications to schema in the lines below
#=====================================================
cat >${MODFILE} <<EOF
EOF

#=====================================================
#  Put dir/sqlfilename in the list below
#=====================================================
declare -a dbs=(
    'acctbal/baltest.sql'
    'payorstmt/pstmt.sql'
    'rfix/rcptfixed.sql'
    'rfix/receipts.sql'
    'roller/prodrr.sql'
    'roller/rr.sql'
    'rr/rr.sql'
    'setup/accord.sql'
    'setup/old.sql'
    'webclient/webclientTest.sql'
    'websvc1/asmtest.sql'
    'websvc3/tasks.sql'
    'workerasm/rr.sql'
)

for f in "${dbs[@]}"
do
	echo -n "${f}: loading... "
	${MYSQL} rentroll < ${f}
	echo -n "updating... "
	${MYSQL} rentroll < ${MODFILE}
	echo -n "saving... "
	${MYSQLDUMP} rentroll > ${f}
	echo "done"
done
