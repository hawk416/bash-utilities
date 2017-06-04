#!/bin/bash
#
# create new pass store
input_get_istrue(){
	local input
	printf "$1 [y/n]: "
	read input
	if [ "$input" == "y" ] || [ "$input" == "Y" ] || [ "$input" == "yes" ] || [ "$input" == "Yes" ]
	then
		input=0
	else
		input=1
	fi
	return $input
}

pass_init_store(){
	local input
	local gpg_key
	if 	(input_get_istrue "Would you like to create the store?")
	then
		mkdir -p $$1
		export PASSWORD_STORE_DIR=$1/.password-store
		echo "Choose from the list below: "
		gpg --list-keys
		printf "Select key: "
		read gpg_key
		pass init $gpg_key
	fi
}

#### MAIN ####
if [ -z "$1" ]
then
	printf "Enter path: "
	read pass_path
else
	#set path from input
	pass_path=$1
fi
#get the absolute path
if [ ! -z $(readlink -f "$pass_path") ]
then
	pass_path=$(readlink -f $pass_path)
fi

# check that the password store exists
if [ -e "$pass_path/.password-store" ]
then
	echo "Password store $pass_path/.password-store already exists!"
else
	pass_init_store $pass_path
fi