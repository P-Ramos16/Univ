#!/bin/bash
# Conditional block if

if (( "$1" > 5 && "$1" < 10 )); then
	echo "True  -> Número maior do que 5 e menor do que 10"
else
	echo "False -> Número menor do que 5 ou maior do que 10"
fi
