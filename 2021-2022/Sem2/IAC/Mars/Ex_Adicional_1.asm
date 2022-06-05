	.data
lista:	.word	4, 3, -2, 1, 27, 45
str:	.asciiz	"O conteudo do array é >\n"
str2:	.asciiz " - "

	.text
main: 	la	$a0, str
	li	$v0, 4
	syscall
	
	la	$t1, lista
	li	$t0, 0
for:	bge	$t0, 6, endfor
	
	sll	$t2, $t0, 2
	addu	$t2, $t1, $t2
	lw	$a0, 0($t2)
	li	$v0, 1
	syscall
		
	la	$a0, str2
	li	$v0, 4
	syscall
	
	addi	$t0, $t0, 1
	j for

endfor: