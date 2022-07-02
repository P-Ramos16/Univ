	.data
prm1:	.asciiz "SLL >"
prm2:	.asciiz "\nSRL >"
prm3:	.asciiz "\nSRA >"

	.text
main:	li	$t0, 0xF2345678
	li	$t4, 4
	
	
	la	$a0, prm1
	li	$v0, 4
	syscall
	
	sllv	$t1, $t0, $t4
	move	$a0, $t1
	li	$v0, 34
	syscall
		
	
	la	$a0, prm2
	li	$v0, 4
	syscall
	
	srlv	$t2, $t0, $t4
	move	$a0, $t2
	li	$v0, 34
	syscall
	
	
	la	$a0, prm3
	li	$v0, 4
	syscall
	
	srav	$t3, $t0, $t4
	move	$a0, $t3
	li	$v0, 34
	syscall
	
	