# src/bash/livy-rester/funcs/run-integration-tests.func.sh

# v0.5.6
# ---------------------------------------------------------
# cat doc/txt/livy-rester/funcs/run-integration-tests.func.txt
# ---------------------------------------------------------
doRunIntegrationTests(){

	doLog "DEBUG START doRunIntegrationTests @run-integration-tests.func.sh"
   cd $product_instance_dir 

	doLog "INFO re-start the livy-rester app-layer just for sure"
   test -z "${livy-rester_project:-}" && \
      doExit 10 "FATAL ERROR running $action without defined livy-rester project environment vars
      !!! Run : source lib/bash/funcs/parse-cnf-env-vars.sh ; doParseCnfEnvVars
      cnf/livy-rester.dev.host-name.cnf"

   bash src/bash/livy-rester/livy-rester.sh -a mojo-morbo-stop 
   test $? -ne 0 && return

   bash src/bash/livy-rester/livy-rester.sh -a mojo-morbo-start
   test $? -ne 0 && return

   doLog "INFO make a backup of the current db"
   bash src/bash/livy-rester/livy-rester.sh -a backup-postgres-db
	
   doLog "INFO re-create the $env_type db"
   bash src/bash/livy-rester/livy-rester.sh -a run-pgsql-scripts

   last_db_backup_file=$(find  -name $postgres_db_name*.sql | sort -n | tail -n 1)
   psql -d $postgres_db_name < "$last_db_backup_file"

   doLog "INFO generating md docs"
   bash src/bash/livy-rester/livy-rester.sh -a generate-md-docs

   test $? -ne 0 && return
   
   doLog "INFO START integration testing - do run all the implemented action tests" 
   perl src/perl/livy-rester/t/TestIssueTracker.pl
   test $? -ne 0 && return
	echo -e "\n\n\n" 
   
   doLog "INFO re-create the $env_type db"
   bash src/bash/livy-rester/livy-rester.sh -a run-pgsql-scripts

   last_db_backup_file=$(find  -name $postgres_db_name*.sql | sort -n | tail -n 1)
   psql -d $postgres_db_name < "$last_db_backup_file"

	doLog "DEBUG STOP  doRunIntegrationTests"
}


# eof file: src/bash/livy-rester/funcs/run-integration-tests.func.sh
