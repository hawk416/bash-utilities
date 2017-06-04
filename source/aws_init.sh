#!/bin/bash
#
# description
# Asks you for the pass command path to the account AWS access key's.
# Assumes the key and secret are named $INPUT.key/secret respectivelly.

# check that path exists
if [ ! -e $PASSWORD_STORE_DIR/$1 ]
then
	echo "Path:\"$1\" not found!"
else
	#export the environment
	export AWS_ACCESS_KEY_ID="$(pass $1.key)"
	export AWS_SECRET_ACCESS_KEY="$(pass $1.secret)"
	# all done
	echo "Environment setup for $1"
fi
