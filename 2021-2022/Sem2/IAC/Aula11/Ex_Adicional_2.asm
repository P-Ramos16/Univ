	.data
lista:	.space	24	#size * 4
str:	.asciiz	"Insira um número >\n"
str2:	.asciiz " - "

	.text
main: 	la	$a0, str
	li	$v0, 4
	syscall
	
	la	$t1, lista
	li	$t0, 0
	
	
for1:	bge	$t0, 6, endfor1
		
	li	$v0, 5
	syscall
		
	sll	$t2, $t0, 2
	addu	$t2, $t1, $t2
	move	$t2, $v0
	
	addi	$t0, $t0, 1
	j for1

endfor1:
	li	$t0, 0
	
for0:	bge	$t0, 6, endfor0
	
	sll	$t2, $t0, 2
	addu	$t2, $t1, $t2
	lw	$a0, 0($t2)
	li	$v0, 1
	syscall
		
	la	$a0, str2
	li	$v0, 4
	syscall
	
	addi	$t0, $t0, 1
	j for0

endfor0:
	li	$v0, 10
	syscall