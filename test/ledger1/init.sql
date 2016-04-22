-- Initialize Rentroll Database with EXAMPLE 1 data 
--   This example revolves around a fictional business:

-- Business:
-- 	Springfield Retirement Castle
-- 	2001 Creaking Oak Drive
-- 	Springfield, MO 65803
-- 	USA

-- Renters:
-- 	Homer Simpson
-- 	Edna Krabappel

-- EXAMPLE 1  -  UNIT 101
-- 	Assessment period:  Nov 1, 2015 – Nov 30, 2015
-- 	Property: #1 
-- 	Unit 101
-- 	Monthly Rent: from Jul 1, 2012 to Oct 31, 2015:  $1000
--  			  beginning Nov 1 2015:  $1200
-- 	Unit Specialty: Lake View ($50)
-- 	Unit Specialty: Fireplace ($20)

-- 	Deposit currently held:  $1000
-- 	Deposit for next renter: $1500

-- 	Renter 1: (Edna Krabappel) vacates unit 101
-- 		She occupies the unit from Nov 1 – Nov 8 (8 days)
-- 		RentalAgreement #1 has set rent of $1000/month
-- 		$250 of her $1000 deposit was forfeited to cover damages assessed
-- 		The remaining $750 was returned to Krabappel
-- 		Krabappel also rents a carport @ $35/month
-- 		Her rental charges for the 8 days she stays in November: 
-- 			Rent:      8/30 of $1000 = $266.67 
-- 			Fireplace: 8/30 of   $20 =   $5.33
-- 			Lake View: 8/30 of   $50 =  $13.33
-- 			Carport:   8/30 of   $35 =   $9.33
-- 			----------------------------------
-- 			Rent for November:         $294.66					

-- 	Unit was vacant from Nov 9 – Nov 20 (12 days)
-- 			Unit loss to vacancy:      $428.00

-- 	Renter 2 (Homer Simpson) rents unit 101
-- 		RentalAgreement #8
-- 		He signs a 1 year rental agreement for unit 101:  
-- 			Rent:     $1270/month   ($1200 + $50 + $20)
-- 			Deposit:  $1500
-- 			Carports: 2   @$35/month each
-- 		He occupies unit 101 from Nov 21 – Nov 30  (10 days)
-- 		He sends in a check for 1880.00 which breaks down as follows
-- 			Rent:      10/30 of $1200 =  $400.00 
-- 			Fireplace: 10/30 of   $20 =    $6.67
-- 			Lake View: 10/30 of   $50 =   $16.67
-- 			Carport 1: 10/30 of   $35 =    11.67
-- 			Carport 2: 10/30 of   $35 =    11.67
-- 			-------------------------------------
-- 			Rent for November:           $446.68
-- 			Deposit:                    $1500.00  (since there is no proration on security deposit)
-- 			-------------------------------------
-- 			Total:                      $1946.68	


USE rentroll

-- ----------------------------------------------------------------------------------------
--    ASSESSMENT TYPES
-- ----------------------------------------------------------------------------------------
--  Type:  0 = DEBIT,  1 = CREDIT
INSERT INTO assessmenttypes (Name,Description) VALUES
	("Rent",						 	" 1 Rent: the recurring amount due under an Occupancy Agreement.  While most residential leases are one year or less, commecial leases may go on decades.  In those cases there is a formula for rent increases.  For example, our lease to HD Supply in Pacoima provides that we increase rent 7% on each 3rd year anniversary of Lease, and our Viacom lease provides for an annual fixed 2% increase.  Some leases provide for increases based upon CPI.   Rent is tied to a Unit and a Payor."),
	("Security Deposit",			 	" 2 Security Deposit: We often assess an amount to secure performance by the tenant under their occupancy agreement.  When collected, this amount is a liability.  A security deposit is either returned (i.e., a negative assessment) or forfeited for Tenant’s non-performance (in which case it is assessed as Forfeited Security Deposit-an item of income)."),
	("Security Deposit Forfeiture", 	" 3 Security Deposit Forfeiture: when we collect a security deposit, we record this as a liability (since we owe this money to the tenant in the absence of a breach).  When the tenant breaches, we may apply that deposit to their obligation, which constitutes income (and a corresponding decrease in the liability).  This is a non-recurring item, and will apply to a Payor and a Unit."),
	("Application Fees",			 	" 4 Application Fees: the non-recurring fee charged for considering a rental application.  This fee will apply to a Unit and a Payor only if the applicant is accepted as a tenant.  I believe we should set up any applicant that pays an Application fee as a Payor with very limited information just so we have a record the party by whom payments are made and other payment data.  If they end up leasing, they will already be in the system."),
	("Landlord Lien Sales",			 	" 5 Landlord Lien Sales: under some state laws, a landlord has a lien that arises by operation of law for personal business that remains in the Unit after a tenancy has terminated.  The landlord is allowed to sell the business, and apply the sales proceeds to the amount owed to the landlord.  This is a non-recurring assessment that will apply to a Unit and a Payor."),
	("Pet Fees",					 	" 6 Pet Fees: some properties charge a one-time and/or monthly fee for a pet.  Thus, this may or may not be a recurring fee, and will apply to a Unit and a Payor."),
	("Eviction Fees",				 	" 7 Eviction Fees: when we file an eviction on a tenant and the tenant reinstates by paying what is owed, we include a charge for the fees associated with filing the eviction.  This is not a recurring fee and will apply to a Unit and a Payor."),
	("Electric Reimbursement",		 	" 8 Electric Reimbursement: when we pay the electic, we charge a fixed fee to the resident for useage up to a certain amount.  This is a recurring fee, and will apply to a Payor and a Unit."),
	("Electric Overage",			 	" 9 Electric Overage: when we pay the electric and the resident uses an amount of electricity in excess of the maximum useage, we charge the resident for the overage.  This is calculated monthly and may or may not recur.  The charge will apply to a Payor and a Unit."),
	("Water Reimbursement",			 	"10 Water Reimbursement: when we pay the water, we charge a fixed fee to the resident for useage up to a certain amount.  This is a recurring fee, and will apply to a Payor and a Unit."),
	("Water Overage",				 	"11 Water Overage: when we pay the water and the resident uses an amount of water in excess of the maximum useage, we charge the resident for the overage.  This is calculated monthly and may or may not recur.  The charge will apply to a Payor and a Unit."),
	("Trash Fee",					 	"12 Trash Fee: sometimes we charge a fee for collection of trash.  The charge will apply to a Payor and a Unit."),
	("Utility Fine",				 	"13 Utility Fine: certain jurisdictions (CA mostly) will fine the landlord when water useage exceeds a prescribed amount.  So long as the landlord has taken certain measures for conservation, the landlord is allowed to pass these charges onto the tenants.  This is a non-recurring assessment that is associated with a Payor and a Unit."),
	("NSF Fee",						 	"14 NSF Fee: when a resident bounces a check, we charge an NSF fee.  This is a non-recurring assessment that is associated with a Payor and a Unit."),
	("Maintenance Fee",				 	"15 Maintenance Fee: when residents damage a Unit we may impose a fee for the repair.  We may also charge a fee to replace keys or do other similar items.  This is a non-recurring assessment that is associated with a Payor and a Unit."),
	("Fines",						 	"16 Fines: Certain acts by a resident may result in a fine being imposed, for example a towing fee for parking in a fire lane, or a fine for outside storage after a given number of warnings, etc.  These are non-recurring assessments that are associated with a Payor and a Unit."),
	("Month to Month Fee",			 	"17 Month to Month Fee: When a permanent resident chooses to a month-to-month occupancy agreement, we may charge an increased fee for this.  This will be a recurring fee that is associated with a Payor and a Unit."),
	("Cancelation Fees",			 	"18 Cancelation Fees: For our hotel guests, we may charge a no-show fee for those that booked a room, but never show up.  This is a non-recurring fee that is associated with a Payor, but not a Unit."),
	("Housekeeping Fee",			 	"19 Housekeeping Fee: Some guests and residents want a special cleaning from time to time, and this fee is charged.  This is a non-recurring fee that is associated with a Payor and a Unit."),
	("Extra Person Charge",			 	"20 Extra Person Charge: Some guests bring additional people and are charged a fee.  This is a recurring charge that is associated with a Payor and a Unit."),
	("Furniture Rental",			 	"21 Furniture Rental: Some residents prefer to lease furniture from us, and we charge a fee for this.  This will be a recurring fee that is associated with a Payor and a Unit."),
	("Platinum Service Fee",		 	"22 Platinum Service Fee: This is a fee that we charge for our highest level of service (housekeeping, food and linen service).  This will be a recurring fee that is associated with a Payor and a Unit."),
	("Gold Service Fee",			 	"23 Gold Service Fee: This is a fee that we charge for our intermediate level of service (housekeeping and food).  This will be a recurring fee that is associated with a Payor and a Unit."),
	("Silver Service Fee",			 	"24 Silver Service Fee: This is a fee that we charge for our basic level of service (housekeeping).  This will be a recurring fee that is associated with a Payor and a Unit."),
	("Sales Tax",					 	"25 Sales Tax: This is not a fee, but rather a liability.  Although the sales tax is owed by the purchaser, state law requires that the tax be collected and remitted by the Payee.  In this respect, this assessment is exactly like a security deposit.  It is collected by us and is a liability until further disposition.  (when we remit to the state sales tax agency, we eliminate the liability.)  Not all transactions are taxable.  Generally, hotel stays are taxable, along with furniture rental, and platinum, gold and silver service fees."),
	("TOT Tax",						 	"26 TOT Tax: This stands for Transient Occupancy Tax.  This tax is levied on hotel stays, and varies by jurisdiction.  If applicable, it will always be assessed, and will be a liability until remitted by us to the taxing authority."),
	("Reletting Fees",				 	"27 Reletting Fees: When a tenant moves early, we may charge a fee for reletting their apartment.  This is associated with a Payor and a Unit."),
	("Carport Fees",				 	"28 Carport Fees: I think we should set these up as a Unit, since the rental of a carport is the same as any other unit."),
	("Garage Fees",					 	"29 Garage Fees: I think we should set up a Garage as a special Unit for the same reason."),
	("Reserved Parking Fees",		 	"30 Reserved Parking Fees: Once again, we may be better off to treat these as a special Unit."),
	("Transfer fees",				 	"31 Transfer fees: when a resident moves from one Unit to another Unit, we often charge a fee.  This is non-recurring and will be associated with a Unit (the one from which the occupant moved) and a Payor."),
	("Washer/Dryer Fee",			 	"32 Washer/Dryer Fee: If we provide a washer/dryer, sometimes we charge a fee.  This will be recurring and will be associated with a Payor and a Unit.  (Note: sometimes we charge a washer/dryer connection fee—a fee that is assessed because the particular unit has a connection for washer/dryer.  This will be treated as a Unit Specialty, and not tracked separately as an assessable item.)"),
	("Association Dues Assessment", 	"33 Association Dues Assessment: Sometimes a business will have an owner’s association that charges dues, and these are billed to the tenant.  This will be recurring, and will be associated with a Unit and a Payor."),
	("Insurance Reimbursement",		 	"34 Insurance Reimbursement: Sometime the occupant pays for insurance.  This may or may not be recurring, and will be associated with a Unit and a Payor."),
	("Tax Reimbursement",			 	"35 Tax Reimbursement: Some tenants pay for the ad volarem business taxes associated with their unit.  This may or may not be recurring, and will be associated with a Unit and a Payor."),
	("Special Event Fees", 				"36 Sometimes a guest or resident may use a common area or location and be charged a fee for this.  At the moment, this will cover meeting rooms (unless a particular meeting room is set up as a Unit), catering fees, set up fees, etc.  We may choose to further delineate these items in future versions.  For the moment, we need a place to record this income.  This is non-recurring.  This will be associated with a Payor, but not a Unit."),
	("Convenience Store Sales", 		"37 We will not create the module right now to track inventory and sales by items, but we need to have a category for this to tie into our main system.  This will be non-recurring, and will be associated with a special Payor (“Convenience Store”) but not a Unit."),
	("Courtesy Car Rental", 			"38 I would like for each of our cars to be a Unit for accounting purposes.  Renting a car is really no different than renting an apartment.  We should discuss this."),
	("Vending Income", 					"39 This will be non-recurring (even though we collect daily, we do not know the amount).  These will be associated with a special Payor (“Vending”), but not a Unit."),
	("Transportation", 					"40 This may or may not be recurring.  It is possible that we have a hotel guest that requires daily shuttles and we charge a fixed rate per day.  More often, it is a one-time fee.  This will be associated with a Payor, but not a Unit."),
	("Food Sales", 						"41 Like Convenience Store Sales, we will need to create a module for this, but for the moment we can enter this as a lump sum.  This will be non-recurring, and may or may not be associated with a particular Payor.  (For example, if our guest brings someone with them, and we charge for their friend to eat, there is really no need to set up a Payor for that guest.  However, if we charge a separate fee to the Guest, it should appear on the Payor’s statement.  An example of this is room service.)"),
	("Liquor Sales", 					"42 "),
	("WashNFold Income", 				"43 We will ultimately need a module for this, but for the moment a lump sum is fine.  This will be non-recurring and will be associated with a particular Payor."),
	("Spa Sales", 						"44 We will eventually need a module for this, but a lump sum is fine for now.  This will be a non-recurring charge, and may or may not be associated with a particular Payor."),
	("Fitness Center", 					"45 Sales.  This may be for rental of the fitness center or for trainer fees, etc.  We will eventually need a module, but a lump sum is fine for now.  This will be a non-recurring charge, and may or may not be associate with a particular Payor."),
	("CashOverShort", 					"46 When we count out cash receipts, we need to account for this.  This, again, is a case of a special Payor, and is not associate with any particular unit.	"),
	("Late Payment Fee",				"47 Late payment of a fee"),
	("Other Income",					"48 (If this gets used, it means we may need to look at setting up a gl no for whatever happened)"),
	("Bad Debt Write-Off",				"49 Bad Debt"),
	("Off Line",						"50 Off Line"),
	("Concession",						"51 concession"),
	("Employee",						"52 employee"),
	("Damages",							"53 damages to the rentable"),
	("Pest Control Reimbursement",		"54 "),
	("Security Deposit Return",			"55 "),
	("Transfer to Alternate Receivable","56 "),
	("Returned Payments",				"57 "),
	("Security Deposit Assessment",		"58 "),
	("Lake View",						"59 Unit specialty charge - Lake View"),
	("Courtyard View",					"60 Unit specialty charge - Courtyard View"),
	("Penthouse",						"61 Unit specialty charge - Penthouse"),
	("Fireplace",						"62 Unit specialty charge - Fireplace");


-- ----------------------------------------------------------------------------------------
--     PAYMENT TYPES
-- ----------------------------------------------------------------------------------------
INSERT INTO paymenttypes (Name,Description) VALUES
	("Check","Personal check from payor"),
	("VISA","Credit card charge"),
	("AMEX", "American Express credit card"),
	("Cash","Cash");


-- ----------------------------------------------------------------------------------------
--     AVAILABILITY TYPES
-- ----------------------------------------------------------------------------------------
INSERT INTO availabilitytypes (Name) VALUES
	("Occupied"),
	("Offline"),
	("Administrative"),
	("Vacant"),
	("Not Ready"),
	("Vacant - Made Ready"),
	("Vacant - Inspected");



-- define the business
-- INSERT INTO business (Name,Address,Address2,City,State,PostalCode,Country,Phone,DefaultOccupancyType,ParkingPermitInUse) VALUES
-- 	("Springfield Retirement Castle","2001 Creaking Oak Drive","","Springfield","MO","65803","USA","939-555-1000",3,0);
INSERT INTO business (DES,Name,DefaultOccupancyType,ParkingPermitInUse) VALUES
	("SRC", "Springfield Retirement Castle",4,0);

-- =======================================================================
--  RENTABLE TYPES
-- =======================================================================
INSERT INTO rentabletypes (BID,Style, Name,Frequency,Proration,Report,ManageToBudget) VALUES
	(1,"GM","Geezer Miser", 6,4,1,1),				-- 1  
	(1,"FS","Flat Studio",  6,4,1,1),				-- 2  
	(1,"SBL","SB Loft",     6,4,1,1),				-- 3  
	(1,"KDS","KD Suite",    6,4,1,1),				-- 4  
	(1,"CAR","Vehicle",     3,0,1,1), 				-- 5  Car
	(1,"CPT","Carport",     6,4,1,1);		 		-- 6  Carport

INSERT INTO rentablemarketrate (RTID,MarketRate,DtStart,DtStop) VALUES
	(1, 1100.00, "1970-01-01 00:00:00", "2015-10-31 00:00:00"),   	-- 1:  GM, Geezer Miser 
	(2, 1500.00, "1970-01-01 00:00:00", "9999-12-31 00:00:00"),		-- 2:  FS, Flat Studio
	(3, 1750.00, "1970-01-01 00:00:00", "9999-12-31 00:00:00"),		-- 3: SBL, SB Loft
	(4, 2000.00, "1970-01-01 00:00:00", "9999-12-31 00:00:00"),		-- 4: KDS, Krusty Deluxe Suite
	(5,   10.00, "1970-01-01 00:00:00", "9999-12-31 00:00:00"),		-- 5  Car
	(6,   35.00, "1970-01-01 00:00:00", "9999-12-31 00:00:00"),		-- 6  Carport
	(1, 1200.00, "2015-10-01 00:00:00", "9999-12-31 00:00:00");   	-- 1:  GM, Geezer Miser  ** RAISED THE RENT **


-- define unit specialties

-- rentablespecialtytype
INSERT INTO rentablespecialtytypes (BID,Name,Fee,Description) VALUES
	(1,"Lake View",50.0,"Overlooks the lake"),						-- assmt 59
	(1,"Courtyard View",50.0,"Rear windows view the courtyard"),	-- assmt 60
	(1,"Top Floor",100.0,"Penthouse"),								-- assmt 61
	(1,"Fireplace",20.0,"Wood burning, gas fireplace");				-- assmt 62

-- define the assessments
INSERT INTO businessassessments (BID,ASMTID) VALUES
	(1, 1),		-- Rent
	(1, 2),		-- Security Deposit
	(1, 3),		-- Security Deposit Forfeiture
	(1, 4);		-- Application Fees

-- define the building
INSERT INTO building (BID,Address,Address2,City,State,PostalCode,Country) VALUES
	(1,"2001 Creaking Oak Drive","","Springfield","MO","65803","USA");


-- Rental agreement templates
INSERT INTO rentalagreementtemplate (ReferenceNumber, RentalAgreementType) VALUES
	("RAT001", 2),
	("RAT002", 2),	-- port
	("RAT003", 2),	-- rental unit
	("RAT004", 2);

-- =======================================================================
--  RENTABLE UNITS
-- =======================================================================
INSERT INTO rentable (LID,RTID,BID,UNITID,Name,Assignment) VALUES
	(1,1,1,  1,"101",1),  -- unit 1
  	(2,2,1,  2,"102",1),
  	(3,3,1,  3,"103",1),
  	(4,4,1,  4,"104",1),
  	(5,1,1,  5,"105",1),
  	(6,2,1,  6,"106",1),
  	(7,3,1,  7,"107",1);

-- =======================================================================
--  carports
-- =======================================================================
INSERT INTO rentable (LID,RTID,BID,UNITID,Name,Assignment,DefaultOccType,OccType) VALUES
	( 8,6,1,  0,"CP001",1,2,2),		-- carport  Krabappel, then Simpson
	( 9,6,1,  0,"CP002",1,2,2);		-- carport  Simpson
	-- (10,2,1,  1,"CP003",1,2,2),		-- carport
	-- (11,2,1,  1,"CP004",1,2,2),		-- carport
	-- (12,2,1,  1,"CP005",1,2,2),		-- carport
	-- (13,2,1,  1,"CP006",1,2,2),		-- carport
	-- (14,2,1,  1,"CP007",1,2,2),		-- carport
	-- (15,2,1,  1,"CP008",1,2,2),		-- carport
	-- (16,2,1,  1,"CP009",1,2,2),		-- carport
	-- (17,2,1,  1,"CP010",1,2,2),		-- carport
	-- (18,2,1,  1,"CP011",1,2,2);		-- carport


-- =======================================================================
--  UNITS
-- =======================================================================
--     OccType == occupancy type -- 0 = unset, 1 = leasehold, 2 = month-to-month, 3 = hotel, 4 = hourly rental
INSERT INTO unit (RID,BLDGID,RTID) VALUES
	 (1,1,1),
	 (2,1,2),
	 (3,1,3),
	 (4,1,4),
	 (5,1,1),
	 (6,1,2),
	 (7,1,3);

-- =======================================================================
--  UNIT SPECIALTIES
-- =======================================================================
INSERT INTO rentablespecialties (BID,UNITID,USPID) VALUES
	(1,1,1),
	(1,1,4),
	(1,2,2),
	(1,2,3),
	(1,2,4),
	(1,3,1),
	(1,4,2),
	(1,4,4),
	(1,6,3),
	(1,7,1),
	(1,7,4),
	(1,7,3);

-- =======================================================================
--  TRANSACTANTS
-- =======================================================================
-- define the tenants.  First as transactants, second as tenants, 3rd as payors
INSERT INTO transactant (FirstName,LastName) VALUES
	("Edna", "Krabappel"),			-- 1
	("Ned", "Flanders"),			-- 2
	("Moe", "Szyslak"),				-- 3
	("Montgomery", "Burns"),		-- 4
	("Nelson", "Muntz"),			-- 5
	("Milhouse", "Van Houten"),		-- 6
	("Clancey", "Wiggum"),			-- 7
	("Homer", "Simpson");			-- 8

-- define the tenants.
INSERT INTO tenant (TCID) VALUES
	  (1),  (2),  (3),  (4),  (5),  (6),  (7),  (8);

-- define the payors.
INSERT INTO payor (TCID) VALUES
	  (1),  (2),  (3),  (4),  (5),  (6),  (7),  (8);

-- =======================================================================
--  RENTAL AGREEMENTS
--    These are initially generated when the rentor changes from
--    an applicant to a tenant (or payor as the case may be)
--    RATID - rental agreement template
-- =======================================================================
INSERT INTO rentalagreement (RATID,BID,PrimaryTenant,RentalStart,RentalStop,Renewal) VALUES
	(6,1, 1,"2004-01-01","2015-11-08",1),	--  1 Krabappel
	(6,1, 2,"2004-01-01","2017-07-04",1),	--  2 Flanders
	(6,1, 3,"2004-01-01","2017-07-04",1),	--  3 Szyslak
	(6,1, 4,"2004-01-01","2017-07-04",1),	--  4 Burns
	(6,1, 5,"2004-01-01","2017-07-04",1),	--  5 Muntz
	(6,1, 6,"2004-01-01","2017-07-04",1),	--  6 Van Houten
	(6,1, 7,"2004-01-01","2017-07-04",1),	--  7 Wiggum
	(6,1, 8,"2015-11-21","2016-11-21",1);	--  8 Simpson

INSERT INTO agreementrentables (RAID,RID,UNITID,DtStart,DtStop) VALUES
	(1,1,1,"2004-01-01","2015-11-08"),		-- Krabappel - apartment
	(1,8,0,"2004-01-01","2015-11-08"),		-- Krabappel - carport
	(8,1,1,"2015-11-21","2016-11-21"),		-- Simpson - apartment
	(8,8,0,"2015-11-21","2016-11-21"),		-- Simpson - carport 1
	(8,9,0,"2015-11-21","2016-11-21");		-- Simpson - carport 2

INSERT INTO agreementpayors (RAID,PID,DtStart,DtStop) VALUES
	(1,1,"2004-01-01","2015-11-08"),		-- Krabappel is payor for rental agreement 1
	(8,8,"2015-11-21","2016-11-21");		-- Simpson is payor for rental agreements 8

-- =======================================================================
--  CONTRACT RENT ASSESSMENTS
--    These are initially generated when the rentor changes from
--    an applicant to a tenant (or payor as the case may be)
-- =======================================================================
INSERT INTO assessments (UNITID,BID,RID,ASMTID,RAID,Amount,Start,Stop,Frequency,ProrationMethod, AcctRule) VALUES
	(1, 1, 1, 1, 1,1000.00,"2014-07-01","2015-11-08", 6, 4, "d ${DFLTGENRCV} _, c ${DFLTGSRENT} ${UMR}, d ${DFLTLTL} ${UMR} _ -"),		-- #1  Krabappel - Rent
	(1, 1, 1, 1, 8,1200.00,"2015-11-21","2016-11-21", 6, 4, "d ${DFLTGENRCV} _, c ${DFLTGSRENT} ${UMR}, d ${DFLTLTL} ${UMR} ${aval(${DFLTGENRCV})} -");		-- #2  Simpson rent
	-- (1, 1, 1, 1, 1,1000.00,"2014-07-01","2015-11-08", 6, 4, "d ${DFLTGENRCV} 1000.0, c ${DFLTGSRENT} 1000.0"),		-- #1  Krabappel - Rent
	-- (1, 1, 1, 1, 8,1000.00,"2015-11-21","2016-11-21", 6, 4, "d ${DFLTGENRCV} 1000.0, c ${DFLTGSRENT} 1000.0");		-- #2  Simpson rent
	-- (2, 1, 2, 1, 2,1050.00,"2011-04-01","2016-04-30", 6, 4, "d ${DFLTGENRCV} 1050.00, c ${DFLTGSRENT} 1050.00"),		
	-- (3, 1, 3, 1, 3,1095.00,"2015-04-01","2016-03-31", 6, 4, "d ${DFLTGENRCV} 1095.00, c ${DFLTGSRENT} 1095.00"),
	-- (4, 1, 4, 1, 4,1075.00,"2013-10-01","2016-03-31", 6, 4, "d ${DFLTGENRCV} 1075.00, c ${DFLTGSRENT} 1075.00"),
	-- (5, 1, 5, 1, 5, 950.00,"2015-04-01","2016-03-31", 6, 4, "d ${DFLTGENRCV}  950.00, c ${DFLTGSRENT}  950.00"),
	-- (6, 1, 6, 1, 6,1095.00,"2015-10-01","2015-10-31", 6, 4, "d ${DFLTGENRCV} 1095.00, c ${DFLTGSRENT} 1095.00"),
	-- (7, 1, 7, 1, 7,1045.00,"2001-11-01","2016-05-31", 6, 4, "d ${DFLTGENRCV} 1045.00, c ${DFLTGSRENT} 1045.00");

-- =======================================================================
--  UNIT SPECIALTY ASSESSMENTS
-- =======================================================================
INSERT INTO assessments (UNITID,BID,RID,ASMTID,RAID,Amount,Start,Stop,Frequency,ProrationMethod, AcctRule) VALUES
	(1, 1, 1, 59, 1,50.00,"2014-07-01","2015-11-08", 6, 4, "d ${DFLTGENRCV} _, c ${DFLTGSRENT} _"),		-- #3 Lake view  Krabappel
	(1, 1, 1, 62, 1,20.00,"2014-07-01","2015-11-08", 6, 4, "d ${DFLTGENRCV} _, c ${DFLTGSRENT} _"),		-- #4 Fireplace  Krabappel
	(1, 1, 1, 59, 8,50.00,"2015-11-21","2016-11-21", 6, 4, "d ${DFLTGENRCV} _, c ${DFLTGSRENT} _"),		-- #5 Lake view  Simpson
	(1, 1, 1, 62, 8,20.00,"2015-11-21","2016-11-21", 6, 4, "d ${DFLTGENRCV} _, c ${DFLTGSRENT} _");		-- #6 Fireplace  Simpson

-- =======================================================================
--  CONTRACT SECURITY DEPOSIT
--    These are initially generated when the rentor changes from
--    an applicant to a tenant (or payor as the case may be)
-- =======================================================================
INSERT INTO assessments (UNITID,BID,RID,ASMTID,RAID,Amount,Start,Stop,Frequency,ProrationMethod, AcctRule) VALUES
	(  1, 1, 1, 2, 1,1000.00,"2014-07-01", "2014-07-01", 0, 0, "d ${DFLTSECDEPRCV} _, c ${DFLTSECDEPASMT} _"),		-- #7 Krabappel deposit
	(  1, 1, 1, 2, 8,1500.00,"2015-11-21", "2015-11-21", 0, 0, "d ${DFLTSECDEPRCV} _, c ${DFLTSECDEPASMT} _");		-- #8 Simpson deposit

-- =======================================================================
--  CARPORT ASSESSMENTS
--    These can be generated at any time. Typically they will be
--    created along with the rental agreement
-- =======================================================================
INSERT INTO assessments (UNITID,BID,RID,ASMTID,RAID,Amount,Start,Stop,Frequency,ProrationMethod, AcctRule) VALUES
	(1, 1, 8, 28, 1,35.00,"2014-07-01","2015-11-08", 6, 4, "d ${DFLTGENRCV} _, c 42007 _"),		-- #9  Krabappel, ends Nov 10
	(1, 1, 8, 28, 8,35.00,"2015-11-21","2016-11-10", 6, 4, "d ${DFLTGENRCV} _, c 42007 _"),		-- #10 Simpson, starts Nov 21
	(1, 1, 9, 28, 8,35.00,"2015-11-21","2016-11-10", 6, 4, "d ${DFLTGENRCV} _, c 42007 _");		-- #11 Simpson, starts Nov 21

-- =======================================================================
--  DAMAGE ASSESSMENTS
-- =======================================================================
INSERT INTO assessments (UNITID,BID,RID,ASMTID,RAID,Amount,Start,Stop,Frequency,ProrationMethod, AcctRule) VALUES
	(1, 1, 1, 53, 1,250.00,"2015-11-08","2015-11-08", 0, 0, "d ${DFLTSECDEPASMT} _, c 42006 _"),	-- #12  Krabappel, $250 damages
	(1, 1, 1, 55, 1,750.00,"2015-11-08","2015-11-08", 0, 0, "d ${DFLTSECDEPASMT} _, c 10001 _");

-- =======================================================================
--  OTHER ASSESSMENTS
-- =======================================================================
-- INSERT INTO assessments (UNITID,BID,RID,ASMTID,Amount,Start,Stop,Frequency, AcctRule) VALUES
-- 	(  1,1,1,10, 50.00,"2015-10-01", "2016-12-31", 6, "d ${DFLTGENRCV}, c 42002"),	-- Water (utility) reimbursement
-- 	(  1,1,1,21,150.00,"2015-12-01", "2015-12-01", 0, "d ${DFLTGENRCV}, c 42002"),	-- Furniture rental
-- 	(  2,1,2,10,100.00,"2015-10-01", "2016-12-21", 6, "d ${DFLTGENRCV}, c 42002"),	-- Water (utility) reimbursement
-- 	(  2,1,2,47, 90.00,"2015-12-01", "2015-12-01", 0, "d ${DFLTGENRCV}, c 42003"),	-- Late payment fee
-- 	(  3,1,3,47,155.00,"2015-12-01", "2015-12-01", 0, "d ${DFLTGENRCV}, c 42003"),	-- Late payment fee
-- 	(  4,1,4,10,100.00,"2015-10-01", "2016-12-31", 6, "d ${DFLTGENRCV}, c 42002"),	-- Water (utility) reimbursement
-- 	(  4,1,4,28,105.00,"2001-10-01", "2016-05-31", 6, "d ${DFLTGENRCV}, c 42007"),	-- carport fee
-- 	(  5,1,5,10,100.00,"2015-10-01", "2016-12-31", 6, "d ${DFLTGENRCV}, c 42002"),	-- Water (utility) reimbursement
-- 	(  5,1,5,28, 35.00,"2015-10-01", "2016-12-01", 6, "d ${DFLTGENRCV}, c 42007"),	-- carport fee
-- 	(  6,1,6,10,100.00,"2015-10-01", "2016-12-31", 6, "d ${DFLTGENRCV}, c 42002"),	-- Water (utility) reimbursement
-- 	(  7,1,7,47, 90.00,"2015-12-01", "2015-12-01", 0, "d ${DFLTGENRCV}, c 42003"),	-- Late payment fee
-- 	(  7,1,7,10,100.00,"2015-10-01", "2016-12-31", 6, "d ${DFLTGENRCV}, c 42002"),	-- Water (utility) reimbursement
-- 	(  7,1,7,11, 17.00,"2015-12-01", "2015-12-31", 0, "d ${DFLTGENRCV}, c 42002");	-- Water (utility) Overage

-- =======================================================================
--  RECEIPTS
-- =======================================================================

-- TODO:  ADD ACCTRULE TO RECEIPTS...

INSERT INTO receipt (BID,RAID,PMTID,Dt,Amount,AcctRule) VALUES
	(1,1,2,"2004-01-01", 1000.00, "d ${DFLTCASH} _, c 11002 _");			-- 1  Krabappel's initial security deposit
INSERT INTO receiptallocation (RCPTID,Amount,ASMID,AcctRule) VALUES
	(1,1000.00,7, "d ${DFLTCASH} 1000.00, c 11002 1000.00");		

INSERT INTO receipt (BID,RAID,PMTID,Dt,Amount,AcctRule) VALUES
	(1,1,1,"2015-11-21",  294.66, "c ${DFLTGENRCV} 266.67, d ${DFLTCASH} 266.67, c ${DFLTGENRCV} 13.33, d ${DFLTCASH} 13.33, c ${DFLTGENRCV} 5.33, d ${DFLTCASH} 5.33, c ${DFLTGENRCV} 9.33,d ${DFLTCASH} 9.33"); 			-- 2   Krabappel pays her fees in full
INSERT INTO receiptallocation (RCPTID,Amount,ASMID,AcctRule) VALUES
	(2,266.67,1,"c ${DFLTGENRCV} _, d ${DFLTCASH} _"),	-- rent
	(2, 13.33,3,"c ${DFLTGENRCV} _, d ${DFLTCASH} _"),	-- Lake View
	(2,  5.33,4,"c ${DFLTGENRCV} _, d ${DFLTCASH} _"),	-- Fireplace
	(2,  9.33,9,"c ${DFLTGENRCV} _, d ${DFLTCASH} _");	-- CP001

INSERT INTO receipt (BID,RAID,PMTID,Dt,Amount,AcctRule) VALUES
	(1,8,1,"2015-11-15",1946.68, "d ${DFLTCASH} 1500.00, c 11002 1500.00, c ${DFLTGENRCV} 400.00, d ${DFLTCASH} 400.00, c ${DFLTGENRCV} 16.67, d ${DFLTCASH} 16.67, c ${DFLTGENRCV} 6.67, d ${DFLTCASH} 6.67, c ${DFLTGENRCV} 11.67,d ${DFLTCASH} 11.67, c ${DFLTGENRCV} 11.67,d ${DFLTCASH} 11.67");  			-- 3   Simpson pays his fees in full
INSERT INTO receiptallocation (RCPTID,Amount,ASMID,AcctRule) VALUES
	(3,1500.00, 8,"d ${DFLTCASH}   _,c ${DFLTSECDEPRCV} _"),	--  security deposit
	(3, 400.00, 2,"c ${DFLTGENRCV} _,d ${DFLTCASH}      _"),	--  rent
	(3,  16.67, 5,"c ${DFLTGENRCV} _,d ${DFLTCASH}      _"),	--  Lake View
	(3,   6.67, 6,"c ${DFLTGENRCV} _,d ${DFLTCASH}      _"),	--  Fireplace
	(3,  11.67,10,"c ${DFLTGENRCV} _,d ${DFLTCASH}      _"),	--  CP001
	(3,  11.67,11,"c ${DFLTGENRCV} _,d ${DFLTCASH}      _");	--  CP002

-- INSERT INTO receipt (BID,PID,RAID,PMTID,Dt,Amount) VALUES
-- 	(1,1,1,55,"2015-11-11", 750.00);  			-- 4   Security Deposit refuncd to Krabappel
-- INSERT INTO receiptallocation (RCPTID,Amount,ASMID) VALUES
-- 	(4,750.00,7);		-- security deposit return
	-- (1,1,1,"2015-12-06",1100.00),
	-- (2,2,1,"2015-12-15", 805.00), 
	-- (3,3,1,"2015-12-15",1060.00),
	-- (4,4,4,"2015-12-07", 200.00),	
	-- (4,4,4,"2015-12-09", 350.00),	
	-- (6,6,1,"2015-12-15", 995.00),	
	-- (7,7,1,"2015-12-03", 950.00),	
	-- (7,7,1,"2015-12-10", 950.00);

-- =======================================================================
--  JOURNAL MARKERS
-- =======================================================================
INSERT INTO journalmarker (BID,State,DtStart,DtStop) VALUES
	(1, 3, "2015-10-31", "2015-10-31");


-- =======================================================================
--  LEDGERS MARKERS
-- =======================================================================
INSERT INTO ledgermarker (BID,PID,GLNumber,Status,State,DtStart,DtStop,Balance,Type,Name) VALUES
	(1,1,"RA-1", 2,3,"2015-10-01","2015-10-31",0.0,2,"Krabappel"),						--  1 Krabappel
	(1,2,"RA-2", 2,3,"2015-10-01","2015-10-31",0.0,2,"Flanders"),						--  2 Flanders
	(1,3,"RA-3", 2,3,"2015-10-01","2015-10-31",0.0,2,"Szyslak"),						--  3 Szyslak
	(1,4,"RA-4", 2,3,"2015-10-01","2015-10-31",0.0,2,"Burns"),							--  4 Burns
	(1,5,"RA-5", 2,3,"2015-10-01","2015-10-31",0.0,2,"Muntz"),							--  5 Muntz
	(1,6,"RA-6", 2,3,"2015-10-01","2015-10-31",0.0,2,"Van Houten"),						--  6 Van Houten
	(1,7,"RA-7", 2,3,"2015-10-01","2015-10-31",0.0,2,"Wiggum"),							--  7 Wiggum
	(1,8,"RA-8", 2,3,"2015-10-01","2015-10-31",0.0,2,"Simpson"),						--  8 Simpson
	(1,0,"11003",2,3,"2015-10-01","2015-10-31",0.0,0,"American Express 93892335 In Process"),
	(1,0,"10004",2,3,"2015-10-01","2015-10-31",0.0,0,"MasterCard/VISA 38992355 in Process"),
	(1,0,"10005",2,3,"2015-10-01","2015-10-31",0.0,0,"Discover 883523553 In Process"),
	(1,0,"40002",2,3,"2015-10-01","2015-10-31",0.0,0,"Carport Rental"),
	(1,0,"41002",2,3,"2015-10-01","2015-10-31",0.0,0,"Administrative Concession"),
	(1,0,"41003",2,3,"2015-10-01","2015-10-31",0.0,0,"Off Line Unit"),
	(1,0,"41005",2,3,"2015-10-01","2015-10-31",0.0,0,"Employee Concession"),
	(1,0,"41006",2,3,"2015-10-01","2015-10-31",0.0,0,"Payor Concession"),
	(1,0,"41007",2,3,"2015-10-01","2015-10-31",0.0,0,"Bad Debt Write-Off"),
	(1,0,"41999",2,3,"2015-10-01","2015-10-31",0.0,0,"Other Offsets"),
	(1,0,"42001",2,3,"2015-10-01","2015-10-31",0.0,0,"Pet Fees"),
	(1,0,"42002",2,3,"2015-10-01","2015-10-31",0.0,0,"Utility Reimbursement"),
	(1,0,"42003",2,3,"2015-10-01","2015-10-31",0.0,0,"Late Fees"),
	(1,0,"42004",2,3,"2015-10-01","2015-10-31",0.0,0,"Damages"),
	(1,0,"42005",2,3,"2015-10-01","2015-10-31",0.0,0,"Pest Control Reimbursements"),
	(1,0,"42006",2,3,"2015-10-01","2015-10-31",0.0,0,"Security Deposit Forfeiture"),
	(1,0,"42007",2,3,"2015-10-01","2015-10-31",0.0,0,"Carports"),
	(1,0,"42008",2,3,"2015-10-01","2015-10-31",0.0,0,"Utility overage"),
	(1,0,"42999",2,3,"2015-10-01","2015-10-31",0.0,0,"Other Income");
         
UPDATE ledgermarker SET Balance=-1000.00 WHERE GLNumber="23000";
UPDATE ledgermarker SET Name="Bank Account FRB 2332352" WHERE GLNumber = "10001";
