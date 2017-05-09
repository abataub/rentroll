package ws

import (
	"encoding/json"
	"fmt"
	"net/http"
	"rentroll/rlib"
)

// ARSendForm is a structure specifically for the UI. It will be
// automatically populated from an rlib.AR struct
type ARSendForm struct {
	Recid       int64 `json:"recid"` // this is to support the w2ui form
	ARID        int64
	BID         int64
	Name        string
	ARType      int64
	DebitLID    int64
	CreditLID   int64
	Description string
	DtStart     rlib.JSONTime
	DtStop      rlib.JSONTime
	LastModTime rlib.JSONTime
	LastModBy   int64
}

// ARSaveForm is a structure specifically for the return value from w2ui.
// Data does not always come back in the same format it was sent. For example,
// values from dropdown lists come back in the form of a rlib.W2uiHTMLSelect struct.
// So, we break up the ingest into 2 parts. First, we read back the fields that look
// just like the xxxSendForm -- this is what is in xxxSaveForm. Then we readback
// the data that has changed, which is in the xxxSaveOther struct.  All this data
// is merged into the appropriate database structure using MigrateStructData.
type ARSaveForm struct {
	Recid       int64 `json:"recid"` // this is to support the w2ui form
	ARID        int64
	Name        string
	ARType      int64
	DebitLID    int64
	CreditLID   int64
	Description string
	DtStart     rlib.JSONTime
	DtStop      rlib.JSONTime
	LastModTime rlib.JSONTime
	LastModBy   int64
}

// ARSaveOther is a struct to handle the UI list box selections
type ARSaveOther struct {
	BID rlib.W2uiHTMLSelect
}

// PrARGrid is a structure specifically for the UI Grid.
type PrARGrid struct {
	Recid       int64 `json:"recid"` // this is to support the w2ui form
	ARID        int64
	BID         int64
	Name        string
	ARType      int64
	DebitLID    int64
	CreditLID   int64
	Description string
	DtStart     rlib.JSONTime
	DtStop      rlib.JSONTime
}

// SaveARInput is the input data format for a Save command
type SaveARInput struct {
	Status   string     `json:"status"`
	Recid    int64      `json:"recid"`
	FormName string     `json:"name"`
	Record   ARSaveForm `json:"record"`
}

// SaveAROther is the input data format for the "other" data on the Save command
type SaveAROther struct {
	Status string      `json:"status"`
	Recid  int64       `json:"recid"`
	Name   string      `json:"name"`
	Record ARSaveOther `json:"record"`
}

// SearchARsResponse is a response string to the search request for receipts
type SearchARsResponse struct {
	Status  string     `json:"status"`
	Total   int64      `json:"total"`
	Records []PrARGrid `json:"records"`
}

// GetARResponse is the response to a GetAR request
type GetARResponse struct {
	Status string     `json:"status"`
	Record ARSendForm `json:"record"`
}

// SvcSearchHandlerARs generates a report of all ARs defined business d.BID
// wsdoc {
//  @Title  Search Account Rules
//	@URL /v1/ars/:BUI
//  @Method  POST
//	@Synopsis Search Account Rules
//  @Description  Search all ARs and return those that match the Search Logic.
//  @Desc By default, the search is made for receipts from "today" to 31 days prior.
//	@Input WebGridSearchRequest
//  @Response SearchARsResponse
// wsdoc }
func SvcSearchHandlerARs(w http.ResponseWriter, r *http.Request, d *ServiceData) {
	funcname := "SvcSearchHandlerARs"
	fmt.Printf("Entered %s\n", funcname)
	var (
		err error
		g   SearchARsResponse
	)
	order := "Name ASC"                                              // default ORDER
	q := fmt.Sprintf("SELECT %s FROM AR ", rlib.RRdb.DBFields["AR"]) // the fields we want
	qw := fmt.Sprintf("BID=%d", d.BID)
	q += "WHERE " + qw + " ORDER BY "
	if len(d.wsSearchReq.Sort) > 0 {
		for i := 0; i < len(d.wsSearchReq.Sort); i++ {
			if i > 0 {
				q += ","
			}
			q += d.wsSearchReq.Sort[i].Field + " " + d.wsSearchReq.Sort[i].Direction
		}
	} else {
		q += order
	}

	// now set up the offset and limit
	q += fmt.Sprintf(" LIMIT %d OFFSET %d", d.wsSearchReq.Limit, d.wsSearchReq.Offset)
	fmt.Printf("db query = %s\n", q)

	g.Total, err = GetRowCount("AR", qw)
	if err != nil {
		fmt.Printf("Error from GetRowCount: %s\n", err.Error())
		SvcGridErrorReturn(w, err)
		return
	}
	rows, err := rlib.RRdb.Dbrr.Query(q)
	if err != nil {
		fmt.Printf("Error from DB Query: %s\n", err.Error())
		SvcGridErrorReturn(w, err)
		return
	}
	defer rows.Close()

	i := int64(d.wsSearchReq.Offset)
	count := 0
	for rows.Next() {
		var p rlib.AR
		var q PrARGrid
		rlib.ReadARs(rows, &p)
		rlib.MigrateStructVals(&p, &q)
		q.Recid = p.ARID
		g.Records = append(g.Records, q)
		count++ // update the count only after adding the record
		if count >= d.wsSearchReq.Limit {
			break // if we've added the max number requested, then exit
		}
		i++
	}
	fmt.Printf("g.Total = %d\n", g.Total)
	rlib.Errcheck(rows.Err())
	w.Header().Set("Content-Type", "application/json")
	g.Status = "success"
	SvcWriteResponse(&g, w)
}

// SvcFormHandlerAR formats a complete data record for a person suitable for use with the w2ui Form
// For this call, we expect the URI to contain the BID and the ARID as follows:
//           0    1     2   3
// uri 		/v1/receipt/BUI/ARID
// The server command can be:
//      get
//      save
//      delete
//-----------------------------------------------------------------------------------
func SvcFormHandlerAR(w http.ResponseWriter, r *http.Request, d *ServiceData) {
	fmt.Printf("Entered SvcFormHandlerAR\n")
	var err error
	if d.ID, err = SvcExtractIDFromURI(r.RequestURI, "ARID", 3, w); err != nil {
		return
	}

	fmt.Printf("Request: %s:  BID = %d,  ID = %d\n", d.wsSearchReq.Cmd, d.BID, d.ID)

	switch d.wsSearchReq.Cmd {
	case "get":
		getAR(w, r, d)
		break
	case "save":
		saveAR(w, r, d)
		break
	default:
		err = fmt.Errorf("Unhandled command: %s", d.wsSearchReq.Cmd)
		SvcGridErrorReturn(w, err)
		return
	}
}

// saveAR returns the requested receipt
// wsdoc {
//  @Title  Save AR
//	@URL /v1/receipt/:BUI/:ARID
//  @Method  GET
//	@Synopsis Save a AR
//  @Desc  This service saves a AR.  If :ARID exists, it will
//  @Desc  be updated with the information supplied. All fields must
//  @Desc  be supplied. If ARID is 0, then a new receipt is created.
//	@Input SaveARInput
//  @Response SvcStatusResponse
// wsdoc }
func saveAR(w http.ResponseWriter, r *http.Request, d *ServiceData) {
	funcname := "saveAR"
	fmt.Printf("SvcFormHandlerAR save\n")
	fmt.Printf("record data = %s\n", d.data)

	var foo SaveARInput
	data := []byte(d.data)
	if err := json.Unmarshal(data, &foo); err != nil {
		e := fmt.Errorf("%s: Error with json.Unmarshal:  %s", funcname, err.Error())
		SvcGridErrorReturn(w, e)
		return
	}

	var a rlib.AR
	rlib.MigrateStructVals(&foo.Record, &a) // the variables that don't need special handling

	fmt.Printf("saveAR - first migrate: a = %#v\n", a)

	var bar SaveAROther
	if err := json.Unmarshal(data, &bar); err != nil {
		e := fmt.Errorf("%s: Error with json.Unmarshal:  %s", funcname, err.Error())
		SvcGridErrorReturn(w, e)
		return
	}

	var ok bool
	a.BID, ok = rlib.RRdb.BUDlist[bar.Record.BID.ID]
	if !ok {
		e := fmt.Errorf("%s: Could not map BID value: %s", funcname, bar.Record.BID.ID)
		rlib.Ulog("%s", e.Error())
		SvcGridErrorReturn(w, e)
		return
	}
	fmt.Printf("saveAR - second migrate: a = %#v\n", a)

	var err error
	if a.ARID == 0 && d.ID == 0 {
		// This is a new AR
		fmt.Printf(">>>> NEW RECEIPT IS BEING ADDED\n")
		_, err = rlib.InsertAR(&a)
	} else {
		// update existing record
		err = rlib.UpdateAR(&a)
	}
	if err != nil {
		e := fmt.Errorf("%s: Error saving receipt (ARID=%d\n: %s", funcname, d.ID, err.Error())
		SvcGridErrorReturn(w, e)
		return
	}

	SvcWriteSuccessResponseWithID(w, a.ARID)
}

// GetAR returns the requested receipt
// wsdoc {
//  @Title  Get AR
//	@URL /v1/receipt/:BUI/:ARID
//  @Method  GET
//	@Synopsis Get information on a AR
//  @Description  Return all fields for receipt :ARID
//	@Input WebGridSearchRequest
//  @Response GetARResponse
// wsdoc }
func getAR(w http.ResponseWriter, r *http.Request, d *ServiceData) {
	fmt.Printf("entered getAR\n")
	var g GetARResponse
	a, err := rlib.GetAR(d.ID)
	if err != nil {
		SvcGridErrorReturn(w, err)
		return
	}
	if a.ARID > 0 {
		var gg ARSendForm
		rlib.MigrateStructVals(&a, &gg)
		g.Record = gg
	}
	g.Status = "success"
	SvcWriteResponse(&g, w)
}