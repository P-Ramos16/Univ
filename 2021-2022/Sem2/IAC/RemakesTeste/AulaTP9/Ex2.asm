	.data 
str:	.asciiz "Linha Teste"
dst:	.space 	40

	.text
main:	la	$a0, str

	jal	strlen
	
	move	$a0, $v0
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall





strlen:	li	$t0, 0	#t0 = n
	li	$t1, 0	#t1 = i
	
lenfor:	addu	$t3, $a0, $t1
	lb	$t4, 0($t3)
	beq	$t4, '\0', lenend
	
	addi 	$t0, $t0, 1
	addi 	$t1, $t1, 1	
	j	lenfor
	
lenend:	move	$v0, $t0
	jr	$ra
	

	
strcopy:li	$t0, 0
copyfor:addu	$t2, $a0, $t0
	lb	$t3, 0($t2)
	beq	$t3, '\0', copend
	
	addu	$t4, $a1, $t0	
	sb	$t3, 0($t4)
	
	addi	$t0, $t1, 1	
	j 	copyfor
copend:	move	$v0, $t4
	jr	$ra
	
strcat:	jal	strcopy
	move	$t0,  $v0
	