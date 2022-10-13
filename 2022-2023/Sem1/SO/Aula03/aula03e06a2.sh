#!/bin/bash
# Wait for a host, given as argument, to come back online.
host=$1
while true; do
	
	$pingStatus = ping -c 1 "$host" >& /dev/null

	case $pingStatus in
		true)
			echo "$host is available again!"
			break
		;;
		*)
			echo ping -c 1 "$host" >& /dev/null;
			echo "$host is still unavailable."
		;;
	esac

	sleep 5
done;

