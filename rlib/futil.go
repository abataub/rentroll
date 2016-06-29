package rlib

// This file is a random collection of utility routines...

import (
	"encoding/csv"
	"fmt"
	"os"
	"strconv"
	"strings"
	"time"
)

// SumFloat is the struct used by ProcessSum to handle rounding problems
type SumFloat struct {
	Val       float64 // the actual value to sum
	Amount    float64 // the amount rounded to the nearest cent with
	Remainder float64 // the difference between val and amt
}

// PrintSum is a utility / debug helper tool for ProcessSumFloats
func PrintSum(a []SumFloat) {
	fmt.Printf("%11s  %7s  %11s  %11s  %7s  %11s\n", "VAL", "AMT", "REMAINDER", "SUM", "RND SUM", "DIFF")
	var sum = float64(0)
	var rndsum = float64(0)

	for i := 0; i < len(a); i++ {
		sum += a[i].Val
		rndsum += a[i].Amount
		fmt.Printf("%11.7f  %7.2f  %11.7f  %11.7f  %7.2f  %11.7f\n", a[i].Val, a[i].Amount, a[i].Remainder, sum, rndsum, rndsum-sum)
	}
}

// ProcessSumFloats adds an array of floating point numbers keeping a running list
// of values that are rounded to the nearest cent (0.01) maintaning a fractional
// remainder which is applied when the cumulative remainder is equal to or
// exceeds $0.005.  Here is an example of when this is useful.
//
// Suppose the rental amount is $10/month on a particular rentable type. Suppose
// that 6 of these types are rented and charged for on a single Assessment. The
// charge per month would be $60. Suppose they returned the items early using
// only 20 out of 30 days.  This is 2/3 of the rental price or $40. The ProrationCycle
// for this item is daily. But if you itemize the charge, the amount for each
// item is $6.66666666...  This rounds to $6.67 per item. But if you add up
// each item, the cumulative error due to rounding will cause it to total
// to more than $40.
//
// |      |  Actual          | Decimal  | Rounded   |   Actual  |
// | Item |  Prorated Rent   | Rounded  | Dec. Sum  |    Sum    |  Error
// |--------------------------------------------------------------------------
// |   1  |  6.666666666...  |  6.67    |   6.67    |   6.67    |  0
// |   2  |  6.666666666...  |  6.67    |  13.34    |  13.33    |  0.01
// |   3  |  6.666666666...  |  6.67    |  20.01    |  20.00    |  0.01
// |   4  |  6.666666666...  |  6.67    |  26.28    |  26.66    |  0.02
// |   5  |  6.666666666...  |  6.67    |  33.35    |  33.33    |  0.02
// |   6  |  6.666666666...  |  6.67    |  40.02    |  40.00    |  0.02
//
// The error will just continue grow the more "sub-items" there are.
// We need a way to distribute the fractional error so that the results are
// always as close as they can be when expressed in dollars-and-cents.
// Using an array and this routine, the fractional difference between the
// actual amount and the amount expressed in dollars-and-cents is carried
// forward through the calculations. As each element of the array is processed
// if the cumulative error amount is greater or equal to $0.005, it will
// be added to the current amount.  The net effect of this is that the
// total error across many items will be kept to less than $0.005.
//
// | Item |  VAL        |   AMT  |  REMAINDER | Actual SUM  | RND SUM
// |------------------------------------------|-------------|-----------
// |   1  |  6.6666667  |  6.67  |  0.0033333 |  6.6666667  |  6.67
// |   1  |  6.6666667  |  6.66  |  0.0033333 | 13.3333333  | 13.33
// |   1  |  6.6666667  |  6.67  | -0.0016667 | 20.0000000  | 20.00
// |   1  |  6.6666667  |  6.67  |  0.0033333 | 26.6666667  | 26.67
// |   1  |  6.6666667  |  6.66  |  0.0033333 | 33.3333333  | 33.33
// |   1  |  6.6666667  |  6.67  | -0.0016667 | 40.0000000  | 40.00
// |   1  |  6.6666667  |  6.67  |  0.0033333 | 46.6666667  | 46.67
// |   1  |  6.6666667  |  6.66  |  0.0033333 | 53.3333333  | 53.33
// |   1  |  6.6666667  |  6.67  | -0.0016667 | 60.0000000  | 60.00
// |   1  |  6.6666667  |  6.67  |  0.0033333 | 66.6666667  | 66.67
//
// The Amt value is changed by a penny here and there to keep the running
// total as close to the actual value as possible.
//
// The code and tests for this are in the Sandbox
//
// The basic rule on using the rounding capabilities:
//		a) When breaking up a single assessment and calculating prorated charges,
//         call this routine and use the Amount values it generates
//      b) When summing multiple separate assessments, use RoundToCent on the
//         Amount and sum the amounts
//=================================================================================
func ProcessSumFloats(a []SumFloat) {
	var xtra = float64(0)
	var halfcent = float64(0.005)
	for i := 0; i < len(a); i++ {
		xtra += a[i].Remainder
		if xtra >= halfcent { // if we've got over 1/2 cent of error
			a[i].Amount = RoundToCent(a[i].Val - halfcent) // reduce the actual Amount by half a cent and re-round
			xtra -= halfcent                               // adjust ongoing Remainder
			if i+1 < len(a) {                              // if there's a next element in the list...
				a[i+1].Remainder -= halfcent // ...gotta adjust its Remainder
			}
		} else if xtra <= -halfcent { // if we're trending negative over 1/2 cent
			a[i].Amount = RoundToCent(a[i].Val + halfcent) // reduce the actual Amount by half a cent and re-round
			xtra += halfcent                               // adjust ongoing Remainder
			if i+1 < len(a) {                              // if there's a next element in the list...
				a[i+1].Remainder += halfcent // ...gotta adjust its Remainder
			}
		}
	}
}

// Stripchars returns a string with the characters from chars removed
func Stripchars(str, chars string) string {
	return strings.Map(func(r rune) rune {
		if strings.IndexRune(chars, r) < 0 {
			return r
		}
		return -1
	}, str)
}

// YesNoToInt takes multiple forms of "Yes" and converts to integer 1, multiple forms of "No" to integer 0
func YesNoToInt(si string) (int64, error) {
	s := strings.ToUpper(strings.TrimSpace(si))
	switch {
	case s == "Y" || s == "YES" || s == "1":
		return YES, nil
	case s == "N" || s == "NO" || s == "0":
		return NO, nil
	default:
		err := fmt.Errorf("Unrecognized yes/no string: %s.", si)
		return NO, err
	}
}

// IsValidAccrual returns true if a is a valid accrual value, false otherwise
func IsValidAccrual(a int64) bool {
	return !(a < ACCRUALNORECUR || a > ACCRUALYEARLY)
}

// AccrualDuration converts an accrual frequency into the time duration it represents
func AccrualDuration(a int64) time.Duration {
	var d = time.Duration(0)
	switch a {
	case ACCRUALNORECUR:
	case ACCRUALSECONDLY:
		d = time.Second
	case ACCRUALMINUTELY:
		d = time.Minute
	case ACCRUALHOURLY:
		d = time.Hour
	case ACCRUALDAILY:
		d = time.Hour * 24
	case ACCRUALWEEKLY:
		d = time.Hour * 24 * 7
	case ACCRUALMONTHLY:
		d = time.Hour * 24 * 30 // yea, I know this isn't exactly right
	case ACCRUALQUARTERLY:
		d = time.Hour * 24 * 90 // yea, I know this isn't exactly right
	case ACCRUALYEARLY:
		d = time.Hour * 24 * 365 // yea, I know this isn't exactly right
	default:
		Ulog("AccrualDuration: invalid accrual value: %d\n", a)
	}
	return d
}

// IsSQLNoResultsError returns true if the error provided is a sql err indicating no rows in the solution set.
func IsSQLNoResultsError(err error) bool {
	s := fmt.Sprintf("%v", err)
	return strings.Contains(s, "no rows in result")
}

// IntFromString converts the supplied string to an int64 value. If there
// is a problem in the conversion, it generates an error message.
func IntFromString(sa string, errmsg string) (int64, bool) {
	var n = int64(0)
	s := strings.TrimSpace(sa)
	if len(s) > 0 {
		i, err := strconv.Atoi(s)
		if err != nil {
			fmt.Printf("CreateAssessmentsFromCSV: %s: %s\n", errmsg, s)
			return n, false
		}
		n = int64(i)
	}
	return n, true
}

// FloatFromString converts the supplied string to an int64 value. If there
// is a problem in the conversion, it generates an error message.
func FloatFromString(sa string, errmsg string) (float64, bool) {
	var f = float64(0)
	s := strings.TrimSpace(sa)
	if len(s) > 0 {
		x, err := strconv.ParseFloat(s, 64)
		if err != nil {
			Ulog("CreateAssessmentsFromCSV: I%s: %s\n", errmsg, sa)
			return f, false
		}
		f = x
	}
	return f, true
}

// LoadCSV loads a comma-separated-value file into an array of strings and returns the array of strings
func LoadCSV(fname string) [][]string {
	t := [][]string{}
	f, err := os.Open(fname)
	if nil == err {
		defer f.Close()
		reader := csv.NewReader(f)
		reader.FieldsPerRecord = -1
		rawCSVdata, err := reader.ReadAll()
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
		for _, sa := range rawCSVdata {
			t = append(t, sa)
		}
	} else {
		Ulog("LoadCSV: could not open CSV file. err = %v\n", err)
	}
	return t
}
