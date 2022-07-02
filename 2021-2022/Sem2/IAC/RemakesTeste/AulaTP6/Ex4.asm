	.data 
prm1:	.asciiz "Digitos do hexadecimal :\n"
space:	.asciiz "\n"

	.text
main:	la	$a0, prm1
	li	$v0, 4
	syscall
	
	li	$t0, 0x80000000
	li	$t1, 0xFFFFFFFF
	li	$t2, 0	
	
for:	beq	$t2, 32, endfor

	and	$a0, $t0, $t1
	li	$v0, 35
	syscall
	
	la	$a0, space
	li	$v0, 4
	syscall
	
	srl	$t0, $t0, 1
	addi	$t2, $t2, 1	
	j for

endfor:	li	$v0, 10
	syscall
	
	