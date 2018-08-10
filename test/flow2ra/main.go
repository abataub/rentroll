// The purpose of this test is to validate the db update routines.
package main

import (
	"context"
	"database/sql"
	"encoding/json"
	"extres"
	"flag"
	"fmt"
	"os"
	"rentroll/rlib"
	"rentroll/ws"
	"time"

	_ "github.com/go-sql-driver/mysql"
)

// App is the global application structure
var App struct {
	dbdir   *sql.DB        // phonebook db
	dbrr    *sql.DB        //rentroll db
	DBDir   string         // phonebook database
	DBRR    string         //rentroll database
	DBUser  string         // user for all databases
	PortRR  int            // rentroll port
	Bud     string         // Biz Unit Descriptor
	Xbiz    rlib.XBusiness // lots of info about this biz
	NoAuth  bool           //
	Verbose bool           //
	FlowID  int64          // the flow to migrate to permanent tables
	NewRA   bool           // if true then generate a new RA from the internal json
}

func readCommandLineArgs() {
	dbuPtr := flag.String("B", "ec2-user", "database user name")
	dbnmPtr := flag.String("N", "accord", "directory database (accord)")
	dbrrPtr := flag.String("M", "rentroll", "database name (rentroll)")
	pBud := flag.String("b", "REX", "Business Unit Identifier (Bud)")
	portPtr := flag.Int("p", 8270, "port on which RentRoll server listens")
	idPtr := flag.Int("flowid", 0, "FlowID to migrate. If not specified then RAID 1 is migrated.")
	noauth := flag.Bool("noauth", false, "if specified, inhibit authentication")
	verb := flag.Bool("v", false, "verbose output - shows the ciphertext")
	newra := flag.Bool("new", false, "generate a new ORIGIN rental agreement from internal data")

	flag.Parse()

	App.DBDir = *dbnmPtr
	App.DBRR = *dbrrPtr
	App.DBUser = *dbuPtr
	App.PortRR = *portPtr
	App.Bud = *pBud
	App.NoAuth = *noauth
	App.Verbose = *verb
	App.FlowID = int64(*idPtr)
	App.NewRA = *newra
}

func main() {
	var err error
	readCommandLineArgs()
	rlib.RRReadConfig()

	//----------------------------
	// Open RentRoll database
	//----------------------------
	if err = rlib.RRReadConfig(); err != nil {
		fmt.Printf("sql.Open for database=%s, dbuser=%s: Error = %v\n", rlib.AppConfig.RRDbname, rlib.AppConfig.RRDbuser, err)
		os.Exit(1)
	}

	s := extres.GetSQLOpenString(rlib.AppConfig.RRDbname, &rlib.AppConfig)
	App.dbrr, err = sql.Open("mysql", s)
	if nil != err {
		fmt.Printf("sql.Open for database=%s, dbuser=%s: Error = %v\n", rlib.AppConfig.RRDbname, rlib.AppConfig.RRDbuser, err)
		os.Exit(1)
	}
	defer App.dbrr.Close()
	err = App.dbrr.Ping()
	if nil != err {
		fmt.Printf("DBRR.Ping for database=%s, dbuser=%s: Error = %v\n", rlib.AppConfig.RRDbname, rlib.AppConfig.RRDbuser, err)
		os.Exit(1)
	}

	//----------------------------
	// Open Phonebook database
	//----------------------------
	s = extres.GetSQLOpenString(rlib.AppConfig.Dbname, &rlib.AppConfig)
	App.dbdir, err = sql.Open("mysql", s)
	if nil != err {
		fmt.Printf("sql.Open: Error = %v\n", err)
		os.Exit(1)
	}
	err = App.dbdir.Ping()
	if nil != err {
		fmt.Printf("dbdir.Ping: Error = %v\n", err)
		os.Exit(1)
	}

	rlib.RpnInit()
	rlib.InitDBHelpers(App.dbrr, App.dbdir)
	rlib.SetAuthFlag(App.NoAuth)
	rlib.SessionInit(10) // must be called before calling InitBizInternals

	//--------------------------------------
	// create background context
	//--------------------------------------
	rlib.SessionInit(15) // must be called first, creates channels
	now := time.Now()
	expire := now.Add(1 * time.Minute)
	ssn := rlib.SessionNew("Flow2RATester", "Flow2RATester", "Flow2RATester", -99999, "", 0, &expire)
	ctx := context.Background()
	ctx = rlib.SetSessionContextKey(ctx, ssn)
	if App.NewRA {
		DoNewRA(ctx, ssn)
	} else {
		DoExistingRA(ctx, ssn)
	}
}

// DoExistingRA does all the useful and interesting work
func DoExistingRA(ctx context.Context, s *rlib.Session) {
	var flowID = int64(App.FlowID)

	if flowID == 0 {
		raid := int64(1)
		//--------------------------------------
		// Make a Flow out of one of the RAs
		//--------------------------------------
		ra, err := rlib.GetRentalAgreement(ctx, raid)
		if err != nil {
			fmt.Printf("Could not read RentalAgreement: %s\n", err.Error())
			return
		}

		//--------------------------------------
		// Insert new flow
		//--------------------------------------
		rlib.Console("Creating a Flow for RAID %d\n", ra.RAID)
		flowID, err = ws.GetRA2FlowCore(ctx, &ra, s.UID)
		if err != nil {
			rlib.Console("DoExistingRA - CB.err\n")
			fmt.Printf("Could not get Flow for RAID = %d: %s\n", ra.RAID, err.Error())
			return
		}

		//-------------------------------------------------------------------
		// Here we select a random date on which to apply these changes.
		// In this case we'll use 2 months after the Agreement Start date.
		//-------------------------------------------------------------------
		dtUpdate := ra.AgreementStart.AddDate(0, 2, 0) // the date on which we want to start the updated RA
		err = setUpdatedRAStartDate(ctx, flowID, &dtUpdate)
		if err != nil {
			fmt.Printf("Could not update start date of flow: %s\n", err.Error())
			return
		}
	}

	rlib.Console("\n==========================================================\n")
	rlib.Console("   Amend existing Rental Agreement base on FlowID = %d\n", flowID)
	rlib.Console("=======================================================\n")

	//------------------------------------------------------------
	// Insert it back into the permanent db tables as an updated
	// Rental Agreement linked to its predecessor
	//------------------------------------------------------------
	tx, tctx, err := rlib.NewTransactionWithContext(ctx)
	if err != nil {
		fmt.Printf("Could not create transaction context: %s\n", err.Error())
		return
	}
	nraid, err := ws.Flow2RA(tctx, flowID)
	if err != nil {
		tx.Rollback()
		rlib.Console("Flow2RA error\n")
		fmt.Printf("Could not write Flow back to db: %s\n", err.Error())
		return
	}
	rlib.Console("\tFlow2RA returns nraid = %d\n", nraid)
	rlib.Console("\tRemoving flow: %d\n", flowID)
	if err = rlib.DeleteFlow(ctx, flowID); err != nil {
		fmt.Printf("Error deleting flow: %s\n", err.Error())
		return
	}
	if err = tx.Commit(); err != nil {
		fmt.Printf("Error committing transaction: %s\n", err.Error())
		return
	}
	rlib.Console("\tSuccess. New RAID = %d, State: Active\n", nraid)

	//------------------------------------------------------------------------
	// bump the state up to Notice To Move. This means no basic data change,
	// we only change the meta info...
	//------------------------------------------------------------------------
	rlib.Console("\n==========================================================\n")
	rlib.Console("   Amend to Notice-To-Move for RAID = %d\n", nraid)
	rlib.Console("==========================================================\n")
	if err = setToNoticeToMove(ctx, s, nraid); err != nil {
		fmt.Printf("Error in setToNoticeToMove: %s\n", err.Error())
		return
	}

	rlib.Console("Completed without errors\n")
}

func setUpdatedRAStartDate(ctx context.Context, flowid int64, dt *time.Time) error {
	var raf rlib.RAFlowJSONData
	//-------------------------------------------
	// Read the flow data into a data structure
	//-------------------------------------------
	flow, err := rlib.GetFlow(ctx, flowid)
	if err != nil {
		return err
	}
	err = json.Unmarshal(flow.Data, &raf)
	if err != nil {
		return err
	}
	rdt := rlib.JSONDate(*dt)
	raf.Dates.AgreementStart = rdt
	raf.Dates.RentStart = rdt
	raf.Dates.PossessionStart = rdt
	// rentable fees
	for i := 0; i < len(raf.Rentables); i++ {
		for j := 0; j < len(raf.Rentables[i].Fees); j++ {
			raf.Rentables[i].Fees[j].Start = rdt
		}
	}
	// pet fees update
	for i := 0; i < len(raf.Pets); i++ {
		raf.Pets[i].DtStart = rdt
		for j := 0; j < len(raf.Pets[i].Fees); j++ {
			raf.Pets[i].Fees[j].Start = rdt
		}
	}
	// vehicle fees
	for i := 0; i < len(raf.Vehicles); i++ {
		raf.Vehicles[i].DtStart = rdt
		for j := 0; j < len(raf.Vehicles[i].Fees); j++ {
			raf.Vehicles[i].Fees[j].Start = rdt
		}
	}

	var d []byte
	//--------------------------------------------
	// update pets
	//--------------------------------------------
	if len(raf.Pets) > 0 {
		d, err = json.Marshal(&raf.Pets)
		if err != nil {
			return err
		}
		err = rlib.UpdateFlowPartData(ctx, "pets", d, &flow)
		if err != nil {
			return err
		}
	}
	//--------------------------------------------
	// update Vehicles
	//--------------------------------------------
	if len(raf.Vehicles) > 0 {
		d, err = json.Marshal(&raf.Vehicles)
		if err != nil {
			return err
		}
		err = rlib.UpdateFlowPartData(ctx, "vehicles", d, &flow)
		if err != nil {
			return err
		}
	}
	//--------------------------------------------
	// update Rentables
	//--------------------------------------------
	if len(raf.Rentables) > 0 {
		d, err = json.Marshal(&raf.Rentables)
		if err != nil {
			return err
		}
		err = rlib.UpdateFlowPartData(ctx, "rentables", d, &flow)
		if err != nil {
			return err
		}
	}
	//--------------------------------------------
	// update Dates
	//--------------------------------------------
	if d, err = json.Marshal(&raf.Dates); err != nil {
		return err
	}
	if err = rlib.UpdateFlowPartData(ctx, "dates", d, &flow); err != nil {
		return err
	}

	return nil
}
