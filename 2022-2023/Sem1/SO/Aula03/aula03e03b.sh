#!/bin/bash
# This script checks the existence of a file
echo "Checking..."
if [[ -f $1 ]] ; then
	echo "$1 existe."
	ls -l $1
else
	echo "$1 não existe"
fi
echo "...done."
