# src/bash/livy-rester/funcs/check-spark-session-status.spec.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doSpecCheckSparkSessionStatus comments ...
# ---------------------------------------------------------
doSpecCheckSparkSessionStatus(){

	doLog "DEBUG START doSpecCheckSparkSessionStatus"
	
	cat doc/txt/livy-rester/specs/check-spark-session-status.spec.txt
	
	sleep "$sleep_interval"
	# add your action implementation code here ... 
	# Action !!!

	doLog "DEBUG STOP  doSpecCheckSparkSessionStatus"
}
# eof func doSpecCheckSparkSessionStatus


# eof file: src/bash/livy-rester/funcs/check-spark-session-status.spec.sh
