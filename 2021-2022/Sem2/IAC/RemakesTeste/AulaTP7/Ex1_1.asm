	.data
prm1:	.asciiz	"Introduza um numero\n"
respar:	.asciiz	"O numero é par\n"
resimp:	.asciiz	"O numero é impar\n"

	.text
main:	la	$a0, prm1
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	andi	$t1, $t0, 1
	beq	$t1, 0, if
	
	la	$a0, resimp
	li	$v0, 4
	syscall
	j	end
	
if:	la	$a0, respar
	li	$v0, 4
	syscall	

end:	li	$v0, 10
	syscall