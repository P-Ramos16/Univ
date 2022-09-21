	.data
msg:	.asciiz	"\n -->Teste2 de IAC, ex2b<--"
minus:	.asciiz	"\nO nr de minusculas e:"

	.text
main:	la	$a0, msg
	li	$v0, 4
	syscall
	
	la	$a0, minus
	li	$v0, 4
	syscall
	
	la	$a0, msg
	jal 	nr_minus
	move	$a0, $v0
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall
	
	
nr_minus:
	addi	$sp, $sp, -16
	sw	$t0, 0($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
	sw	$t3, 12($sp)
	
	li	$t0, 0
	li	$t1, 0
	
while:	sll	$t2, $t1, 2
	addu	$t2, $t2, $a0
	lw	$t3, 0($t2)
	addi	$t1, $t1, 1
	
	beq	$t3, '\0', endwh
	
	blt	$t3, 'z', while
	bgt	$t3, 'a', while
	
	move	$t5, $a0
	move	$a0, $t3
	li	$v0, 11
	syscall
	move	$a0, $t5	
	
	addi	$t0, $t0, 1
	j 	while

endwh:	move	$v0, $t0
	lw	$t3, 12($sp)	
	lw	$t2, 8($sp)	
	lw	$t1, 4($sp)	
	lw	$t0, 0($sp)
	addi	$sp, $sp, 12	
	jr	$ra