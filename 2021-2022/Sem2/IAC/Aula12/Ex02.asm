
	.data
prompt: .asciiz	 "Introduza uma string: "
prompt1: .asciiz "O tamanho da string é : "
buffer:   .space 100


	.text
main:
	# print ao prompt
	la 	$a0, prompt
	li	$v0, 4
	syscall
	
	li	$v0, 8
	la	$a0, buffer
	li	$a1, 16
	syscall			# $a0 = input

	jal 	strlen		# $v0 = factorial(input)	
	move	$t0, $v0
	
	move	$a1, $a0
	la	$a0, prompt1	# $a0 = resprm
	li 	$v0, 4		# print resprm
	syscall
	
	move	$a0, $t0	# $a0 = input
	li 	$v0, 1		# print $s1
	syscall
	
	li	$v0, 10
	syscall			# exit
	
	

strlen:	li	$t0, 0		# n = 0
	li	$t1, 0		# i = 0
	
for:	addu	$t2, $a0, $t1	# $t2 = &str[i]
	addi	$t1, $t1, 1	# i++
	lb	$t3, 0($t2)	# $t3 = byte em str[i]
	beq	$t3, '\0', endfor
	addi	$t0, $t0, 1	# n++
	j 	for
	
endfor:	subi	$t0, $t0, 1	# n - 1
	move	$v0, $t0	# $v0 = n
	jr	$ra

strcopy:li	$t0, 0		# i = 0
	
for:	addu	$t1, $a0, $t0	# $t2 = &str[i]
	lb	$t2, 0($t1)	# $t3 = byte em str[i]
	beq	$t2, '\0', endfor
	
	addu	$t3, $v0, $t0	# $t3 = &dst[i]
	sb	$t2, 0($t3)
	
	addi	$t0, $t0, 1	# i++
	j 	for
	
endfor:	subi	$t0, $t0, 1	# n - 1
	move	$v0, $t0	# $v0 = n
	jr	
