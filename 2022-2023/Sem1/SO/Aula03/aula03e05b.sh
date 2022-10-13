#!/bin/bash
# For all the files in a folder, show their properties

if [[ $2 != "" ]]; then
	echo "Too many arguments! Expected one but recieved more!"

elif [[ !(-d $1) ]]; then
	echo "$1 is not a valid directory!"

else
	for f in $1/*; do
                file "$f"
        done

fi
