	.data
prm1:	.asciiz	"Insira 6 numeros: \n"
lista:	.space	24

	.text
main:	la	$a0, prm1	
	li	$v0, 4
	syscall
	
	la	$a1, lista
	li	$t0, 0
	
for:	beq	$t0, 6, endfor

	li	$v0, 5
	syscall
	
	sll	$t1, $t0, 2
	addu	$a2, $a1, $t1
	sw	$v0, 0($a2)
	
	addi	$t0, $t0, 1	
	j for

endfor:	li	$t0, 0
	
for0:	bge	$t0, 6, endfor0
	
	sll	$t2, $t0, 2
	addu	$t2, $a1, $t2
	lw	$a0, 0($t2)
	li	$v0, 1
	syscall
	
	addi	$t0, $t0, 1
	j for0

endfor0:
	
	li	$v0, 10
	syscall
	