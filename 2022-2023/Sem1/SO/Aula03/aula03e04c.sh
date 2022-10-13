#!/bin/bash
#This script does a very simple test for checking disk space.
space=$(df -h | grep "/dev/nvme0n1p2" | awk '{print $5}' | grep % | grep -v Use | sort -n \
	| tail -1 | cut -d "%" -f1 -)
echo "largest occupied space = $space%"





case $space in
	[0-9]|1[0-9]|2[0-9]|3[0-9]|4[0-9]|5[0-9]|6[0-9]) # espaço < 70%
		Message="All OK."
		;;
	7[0-9]|8[0-9]) # 70% <= espaço < 90%
		Message="Cleaning out. One partition is $space % full."
		;;
	9[0-9]) # 90% <= espaço < 99%
		Message="Better buy a new disk. One partition is $space % full."
		;;
	99) # espaço = 99%
		Message="I'm drowning here! There's a partition at $space %!"
		;;
	*)
		Message="I seem to be running with a non-existent disk..."
		;;
esac
echo $Message
