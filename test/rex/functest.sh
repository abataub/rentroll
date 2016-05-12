#!/bin/bash
RRBIN="../../tmp/rentroll"
MYSQLOPTS=""
UNAME=$(uname)
CVSLOAD="${RRBIN}/rrloadcsv"
LOGFILE="log"

if [ "${UNAME}" == "Darwin" -o "${IAMJENKINS}" == "jenkins" ]; then
	MYSQLOPTS="--no-defaults"
fi

echo "CSV IMPORT TEST" > ${LOGFILE}
echo -n "Date/Time: " >>${LOGFILE}
date >> ${LOGFILE}
echo >>${LOGFILE}

echo "CREATE NEW DATABASE" >> ${LOGFILE} 2>&1
${RRBIN}/rrnewdb >> ${LOGFILE} 2>&1
echo >>${LOGFILE}

echo "import business"
echo "DEFINE BUSINESS" >> ${LOGFILE} 2>&1
${CVSLOAD} -b business.csv -L 3 >> ${LOGFILE} 2>&1
echo >>${LOGFILE}

echo "import assessment types"
echo "DEFINE ASSESSMENT TYPES" >> ${LOGFILE} 2>&1
${CVSLOAD} -a asmtypes.csv -L 4 >> ${LOGFILE} 2>&1
echo >>${LOGFILE}

echo "import rentable types"
echo "DEFINE RENTABLE TYPES" >> ${LOGFILE} 2>&1
${CVSLOAD} -R rentabletypes.csv -L 5,JM1 >> ${LOGFILE} 2>&1
echo >>${LOGFILE}

echo "import rentables"
echo "DEFINE RENTABLES" >> ${LOGFILE} 2>&1
${CVSLOAD} -r rentable.csv -L 6,JM1 >> ${LOGFILE} 2>&1
echo >>${LOGFILE}

echo "import people"
echo "DEFINE PEOPLE" >> ${LOGFILE} 2>&1
${CVSLOAD} -p people.csv  -L 7 >> ${LOGFILE} 2>&1
echo >>${LOGFILE}

echo -n "PHASE x: Log file check...  "
if [ ! -f log.gold -o ! -f log ]; then
	echo "Missing file -- Required files for this check: log.gold and log"
	exit 1
fi
declare -a out_filters=(
	's/^Date\/Time:.*/current time/'
	's/(20[1-4][0-9]\/[0-1][0-9]\/[0-3][0-9] [0-2][0-9]:[0-5][0-9]:[0-5][0-9] )(.*)/$2/'	
)
cp log.gold ll.g
cp log llog
for f in "${out_filters[@]}"
do
	perl -pe "$f" ll.g > x1; mv x1 ll.g
	perl -pe "$f" llog > y1; mv y1 llog
done
UDIFFS=$(diff llog ll.g | wc -l)
if [ ${UDIFFS} -eq 0 ]; then
	echo "PASSED"
	rm -f ll.g llog
else
	echo "FAILED:  differences are as follows:"
	diff ll.g llog
	exit 1
fi
