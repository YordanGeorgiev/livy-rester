# src/bash/livy-rester/funcs/remove-action-files.func.sh

# v0.1.0
# ---------------------------------------------------------
# obs we assume that the caller is in the product_instance_dir
# simply delete each file which greps finds to match to the action
# name(s) cnfigured in the : 
# src/bash/livy-rester/tests/rem-livy-rester-actions.lst
# list file
# ---------------------------------------------------------
doRemoveActionFiles(){

	doLog "DEBUG START doRemoveActionFiles"
	
	# for each defined action 	
	while read -r act ; do (
		
		doLog "INFO STOP  :: removing action: $act"
		find . | grep $act | cut -c 3- | xargs rm -rfv "{}"
      for env in `echo dev tst prd src`; do perl -pi -e 's/^.*?'$act'.*\n$//gm' "met/.$env.livy-rester" ;done;
		
	); 
	done< <(cat "src/bash/livy-rester/tests/rem-livy-rester-actions.lst")

	doLog "DEBUG STOP  doRemoveActionFiles"
}
# eof func doRemoveActionFiles


# eof file: src/bash/livy-rester/funcs/remove-action-files.func.sh
