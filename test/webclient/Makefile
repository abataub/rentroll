TOP = ./../..
ACCORDDB=${TOP}/test/setup/accord.sql
THISDIR="webclient"

.PHONY: test

webclient: config.json accord.sql linkNodeModule
	@echo "*** Completed in ${THISDIR} ***"

test: webclient nyc_output
	@touch fail
	./functest.sh
	@rm -f fail
	@echo "*** headless UI testing with cypress.io done in test/webclient ***"

jshint:
	@touch fail
	jshint  --config .jshintrc  cypress
	@rm -rf fail

clean:
	@rm -f *log *.g [a-z] err.txt fail ./accord.sql ./conf*.json fail

all: clean jshint test

link:
	ln -s

linkNodeModule:
	if [ ! -d node_modules ]; then \
		echo "node_modules does not exits.  Will attempt to create..."; \
		sh -c "ln -s `npm root -g`"; \
	fi ;\
	if [ ! -d node_modules ]; then \
		echo "Could not make node_modules directory" ;\
		exit 1 ;\
	fi

config.json:
	@/usr/local/accord/bin/getfile.sh accord/webclient/confdev.json
	@cp confdev.json config.json

accord.sql:
	@cp ${ACCORDDB} .

package:
	@echo "*** PACKAGE completed in test/webclient ***"

secure:
	@rm -f config.json confdev.json confprod.json

nyc_output:
	if [ ! -e .nyc_output/out.json ]; then \
		echo "out.json does not exits.  Will attempt to create..."; \
		mkdir .nyc_output;\
		touch .nyc_output/out.json;\
		echo "{}" > .nyc_output/out.json;\
	fi ;\
	if [ ! -e .nyc_output/out.json ]; then \
		echo "Could not make node_modules directory" ;\
		exit 1 ;\
	fi
