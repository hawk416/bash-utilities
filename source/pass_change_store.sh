#!/bin/bash
#
# Source this file to set a new pass store
#check if pass path is set, otherwise set to $HOME
if [ -z "$PASSWORD_STORE_DIR" ]
then
	echo "Pass path not set, setting to: $HOME"
	export PASSWORD_STORE_DIR=$HOME/.password-store
fi
if [ -z "$1" ]
then
	echo "Please provide path to password store"
else
	if [ ! -z $(readlink -f "$1") ]
	then
		# check that the password store exists
		if [ -e "$1/.password-store" ]
		then
			echo "Setting password store to $1/.password-store"
			export PASSWORD_STORE_DIR=$1/.password-store
		else
			echo "Password store:\"$1/.password-store\" not found!"
		fi
	fi
fi