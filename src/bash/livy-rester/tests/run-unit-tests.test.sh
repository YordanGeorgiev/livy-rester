# src/bash/livy-rester/funcs/run-unit-tests.test.sh

# v1.0.9
# ---------------------------------------------------------
# just call the 
# ---------------------------------------------------------
doTestRunUnitTests(){

	doLog "DEBUG START doTestRunUnitTests"
	
	sleep "$sleep_interval"
   cd $product_instance_dir
   clear ; bash src/bash/livy-rester/livy-rester.sh -a run-unit-tests
	doLog "DEBUG STOP  doTestRunUnitTests"
}
# eof func doTestRunUnitTests


# eof file: src/bash/livy-rester/funcs/run-unit-tests.test.sh
