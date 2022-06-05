	.data
minus:	.asciiz "texto em minusculas"
maius:	.space	20

# i -> $t0
#	&minus[0] -> $a0
#	&mainus[0] -> $a1
#	&minus[1] -> $t1
#	&mainus[1] -> $t2
#	&cópia de mainus[i] -> $t3

	.text
main:	li	$t0, 0
	la	$a0, minus
	la	$a1, maius
while:	addu	$t1, $a0, $t0
	lb	$t3, 0($t1)	#t3 = copia de minus[i]
	beq	$t3, '\0', endwhile
	
	addi	$t3, $t3, 'A'	#t3 + 'A'
	subi	$t3, $t3, 'a'	#t3 - 'a'
	
	addu	$t2, $a1, $t0
	sb	$t3, 0($t2)
	
	
	addi	$t0, $t0, 1
	j while
endwhile:
	la	$a0, maius
	li	$v0, 4
	syscall		#printstr maius