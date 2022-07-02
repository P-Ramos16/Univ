	.data
textm:	.asciiz "texto em minusculas"
textM:	.space	20

	.text
main:	li	$t0, 0
	la	$a0, textm
	la	$a1, textM
	

while:	addu	$t1, $a0, $t0
	lb	$t3, 0($t1)	#t3 = copia de minus[i]
	beq	$t3, '\0', endwh
	
	addi	$t3, $t3, 'A'	#t3 + 'A'
	subi	$t3, $t3, 'a'	#t3 - 'a'
	
	addu	$t2, $a1, $t0
	sb	$t3, 0($t2)
	
	
	addi	$t0, $t0, 1
	j while
	
endwh:	la	$a0, textM
	li	$v0, 4
	syscall		#printstr maius
	