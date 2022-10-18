#!/bin/bash

function imprime_msg() {
	echo "A minha primeira funcao"
	return 0
}


function numeric_to_string() {
	case "$1" in
	1)
		echo "Um"
		;;
	2)
		echo "Dois"
		;;
	3)
		echo "Três"
		;;
	*)
		echo "Outro numero"
	esac
	return $1
}

function equals() {
	
	# -n faz nao criar newline após o echo

	echo -n "Qual o primeiro número?  > "
	read var1

        echo -n "Qual o segundo número?   > "
	read var2


	if (( $var1 == $var2 )); then
		echo "> Os números são iguais ($var1)"
	
	elif (( $var1 > $var2 )); then
		echo "> O número $var1 é maior do que $var2"

	else
		echo "> O número $var2 é maior do que $var1"
	fi

	return 0
}
