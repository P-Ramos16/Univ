	.data
prm1:	.asciiz	"Introduza dois numeros :\n"
prm2:	.asciiz	"A soma dos números e' : "

	.text
main:	la	$a0, prm1
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move	$t1, $v0
	
	li	$v0, 5
	syscall
	move	$t2, $v0
	
	la	$a0, prm2
	li	$v0, 4
	syscall
	
	add	$t0, $t1, $t2
	move	$a0, $t0
	li	$v0, 1
	syscall
		
	li	$v0, 10
	syscall
	