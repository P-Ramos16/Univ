	.data
prm1: 	.asciiz "Introduza um numero\n"
res: 	.asciiz "O fatorial do número inserido é: "
	
	.text
main:	la	$a0, prm1
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move	$a0, $v0
	
	jal	fact
	
	move	$s0, $v0
	
	la	$a0, res
	li	$v0, 4
	syscall
	
	move	$a0, $s0
	li	$v0, 1
	syscall


	li	$v0, 10
	syscall



fact:	li	$t0, 1
	move	$t1, $a0
	
fafor:	beq	$t1, 0, faend
	mul	$t0, $t0, $t1
	subi	$t1, $t1, 1
	j 	fafor
	
faend:	move 	$v0, $t0
	jr	$ra