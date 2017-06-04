#!/bin/bash
#description: star/stop script for vlc in http interface mode
#usage: vlc.sh start/stop/status
var_help="""VLC start/stop script for running VLC in http interface mode
Usage: vlc.sh start/stop/status/help
"""
var_command=$1
# For puleaudio support
#var_special="--aout=pulse"
#var_prefix=PULSE_SINK=1

var_pid=$(ps ax| grep -e '[^]]vlc -I http' | awk '{ print $1 }')
var_status=$(ps ax| grep -e '[^]]vlc -I http' | wc -l)

## MAIN
case $var_command in
	"status")
		if [ "$var_status" == "0" ]
		then
			echo "VLC is currently not running"
		else
			echo "VLC is running on PID: $var_pid"
		fi
		exit
	;;
	"start")
		if [ "$var_status" == "0" ]		
		then
			printf "password: "
			read var_pass
			echo "Starting VLC in HTTP Interface mode"
			$var_prefix vlc -I http --http-password $var_pass $var_special &
		else
			echo "VLC is already running"
		fi
		exit
	;;
	"stop")
		if [ "$var_status" == "0" ]
		then
			echo "Caanot stop VLC because it is currently not running!"
		else
			echo "Stopping VLC on PID: $var_pid"
			while [ $(ps ax| grep -e '[^]]vlc -I http' | wc -l) != "0" ]; do
				var_pid=$(ps ax| grep -e '[^]]vlc -I http' | awk '{ print $1 }')
				echo $var_pid | xargs -n1 kill
			done
		fi
		exit
	;;
	"help")
		echo $var_help
		exit
	;;
	*)
		echo "Error, the command: $vlc_command is not recognized!"
		echo $var_help
		exit
	;;
esac
