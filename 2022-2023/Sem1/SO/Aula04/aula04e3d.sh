#!/bin/bash

fileContents=$(< numbers.txt)

echo $fileContents

IFS=', ' read -r -a array <<< "$fileContents"

temp=0

for i in "${!array[@]}"; do
	for j in "${!array[@]}"-1;do

		if [[ ${array[j+1]} < ${array[j]} ]]; then
			temp=${array[j+1]}
			array[$j+1]=${array[j]}
			array[$j]=$temp		
		fi

	done	    
done


for element in "${array[@]}"
do
    echo "$element"
done

