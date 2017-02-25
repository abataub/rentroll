package ws

//
// This command returns the rentables associated with the supplied RAID.  If no dates are supplied
// then the current date is assumed.

import (
	"encoding/json"
	"fmt"
	"net/http"
	"rentroll/rlib"
	"strings"
	"time"
)

// RAR is the web service structure for RentalAgreementRentables
type RAR struct {
	Recid        int64         `json:"recid"` // this is to support the w2ui form
	RAID         int64         // associated rental agreement
	BID          int64         // Business
	RID          int64         // the Rentable
	RentableName string        // name of RID
	ContractRent float64       // the rent
	RARDtStart   rlib.JSONTime // start date/time for this Rentable
	RARDtStop    rlib.JSONTime // stop date/time
}

// RARList is the struct containing the JSON return values for this web service
type RARList struct {
	Status  string `json:"status"`
	Total   int64  `json:"total"`
	Records []RAR  `json:"records"`
}

// SvcRARentables returns the Rentables associated with the RAID supplied
//  Called with URL:
//       0    1   2   3
// 		/v1/rar/BID/RAID?dt=2017-01-03
// wsdoc {
//  @Title  Rental Agreement Rentables
//	@URL /v1/rar/:BUI/:RAID ? dt=:DATE
//	@Method GET
//	@Synopsis Get Rentables for Rental Agreement :RAID
//  @Description Returns all the rentables associated Rental Agreement RAID as of :DATE
//  @Input none
//  @Response RAR
// wsdoc }
func SvcRARentables(w http.ResponseWriter, r *http.Request, d *ServiceData) {
	// fmt.Printf("entered SvcRARentables\n")
	s := r.URL.String()
	s1 := strings.Split(s, "?")
	ss := strings.Split(s1[0][1:], "/")
	raid, err := rlib.IntFromString(ss[3], "bad RAID value")
	if err != nil {
		SvcGridErrorReturn(w, err)
		return
	}
	now := time.Now()
	dt := now
	if len(s1) > 1 && len(s1[1]) > 0 {
		sd := strings.Split(s1[1], "=")
		dt, err = rlib.StringToDate(sd[1])
		if err != nil {
			SvcGridErrorReturn(w, fmt.Errorf("invalid date:  %s", sd[1]))
			return
		}
	}
	var rar RARList
	m := rlib.GetRentalAgreementRentables(raid, &dt, &dt)
	for i := 0; i < len(m); i++ {
		var xr RAR
		xr.Recid = int64(i + 1)
		r := rlib.GetRentable(m[i].RID)
		rlib.MigrateStructVals(&m[i], &xr)
		xr.RentableName = r.RentableName
		rar.Records = append(rar.Records, xr)
	}
	rar.Status = "success"
	rar.Total = int64(len(m))
	b, err := json.Marshal(&rar)
	if err != nil {
		SvcGridErrorReturn(w, fmt.Errorf("cannot marshal records:  %s", err.Error()))
		return
	}
	w.Write(b)
}