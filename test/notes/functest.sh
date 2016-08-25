#!/bin/bash
TESTNAME="Notes Tester, Note Types"
TESTSUMMARY="Generate NoteList, Add Notes and Note Replies"

source ../share/base.sh

docsvtest "a" "-b nb.csv -O nt.csv -L 17,${BUD}" "Notes"

./notes > ${LOGFILE}

logcheck
