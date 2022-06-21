
	.data
prompt: .asciiz	 "Introduza um numero: "
prompt1: .asciiz "O fatorial do número "
resprm:	.asciiz	" é: "

	.text
main:
	# print ao prompt
	la 	$a0, prompt
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall			# $v0 = input

	move	$a0, $v0	# $a0 = input	
	jal factorial		# $v0 = factorial(input)	
	move	$t0, $v0
	
	move	$a1, $a0
	la	$a0, prompt1	# $a0 = resprm
	li 	$v0, 4		# print resprm
	syscall
	
	move	$a0, $a1
	li 	$v0, 1		# print $s1
	syscall
	
	la	$a0, resprm	# $a0 = resprm
	li 	$v0, 4		# print resprm
	syscall
	
	move	$a0, $t0	# $a0 = input
	li 	$v0, 1		# print $s1
	syscall
	
	li	$v0, 10
	syscall			# exit
	
factorial:
	sub	$sp, $sp, 4
	sw	$a0, 0($sp)
	li	$s0, 1
	
for:	beq	$a0, $0, endfor # if input == 0

	mul	$s0, $s0, $a0	# $s1 = $s1 * $s2

	subi	$a0, $a0, 1	# $s2--
	j 	for
	
endfor:
	move	$v0, $s0
	lw	$a0, 0($sp)
	add	$sp, $sp, 4	
	jr	$ra
