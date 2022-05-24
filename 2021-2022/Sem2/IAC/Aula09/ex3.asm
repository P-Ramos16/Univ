# 3.1 / 3.2 / 3.3
	.data
prompt: .asciiz	 "Introduza dois números :\n"
result: .asciiz	 "A soma dos dois números é :\n"
	
	
	
	.text	
main:	la 	$a0, prompt 	# $a0 = prompt
	li	$v0, 4 		# $v0 = 4 (syscall "print_str")
	syscall 		# print_str( prompt )
		
	li	$v0, 5 		# $v0 = 5 (syscall "read_int")
	syscall 		# read_int() (o valor lido é devolvido no reg. $v0)
	move 	$t0, $v0 	# $t0 = $v0 ( num = read_int() )
	
	li	$v0, 5 		# $v0 = 5 (syscall "read_int")
	syscall 		# read_int() (o valor lido é devolvido no reg. $v0)
	move 	$t1, $v0 	# $t1 = $v0 ( num = read_int() )
	
	la 	$a0, result 	# $a0 = result
	li	$v0, 4 		# $v0 = 4 (syscall "print_str")
	syscall 		# print_str( prompt )
	
	add	$a0, $t0, $t1	# $a0 = a + b
	li	$v0, 1	 	# $v0 = 1 (syscall "print_int")
	
	#li	$v0, 36	 	overflow com intu10 (unassigned) (ex3.3)
	
	syscall 		# print_str( prompt )