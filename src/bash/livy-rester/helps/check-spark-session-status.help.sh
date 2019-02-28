# src/bash/livy-rester/funcs/check-spark-session-status.help.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doHelpCheckSparkSessionStatus comments ...
# ---------------------------------------------------------
doHelpCheckSparkSessionStatus(){

	doLog "DEBUG START doHelpCheckSparkSessionStatus"
	
	cat doc/txt/livy-rester/helps/check-spark-session-status.help.txt
	
	sleep "$sleep_interval"
	# add your action implementation code here ... 
	# Action !!!

	doLog "DEBUG STOP  doHelpCheckSparkSessionStatus"
}
# eof func doHelpCheckSparkSessionStatus


# eof file: src/bash/livy-rester/funcs/check-spark-session-status.help.sh
