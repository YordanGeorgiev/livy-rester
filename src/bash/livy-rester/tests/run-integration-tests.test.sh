# src/bash/livy-rester/funcs/run-integration-tests.test.sh

# v1.3.0
doTestRunIntegrationTests(){

	doLog "DEBUG START doTestRunIntegrationTests"
	
	# Action !!!
   bash src/bash/livy-rester/livy-rester.sh -a run-perl-unit-tests

	doLog "DEBUG STOP  doTestRunIntegrationTests"
}
# eof func doTestRunIntegrationTests


# eof file: src/bash/livy-rester/funcs/run-integration-tests.test.sh
