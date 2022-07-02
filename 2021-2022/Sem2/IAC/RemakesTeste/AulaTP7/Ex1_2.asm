	.data
prm1:	.asciiz	"Introduza um numero\n"

	.text
main:	la	$a0, prm1
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	li	$t1, 0
for:	beq	$t1, $t0, endfor

	li	$a0, '-'
	li	$v0, 11
	syscall
	
	addi	$t1, $t1, 1
	j for
	
endfor:	li	$v0, 10
	syscall

	