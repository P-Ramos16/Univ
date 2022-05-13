	.data
frase:	.asciiz "Hello World!"

	.text
main:
	addi 	$v0, $0, 4		# $v0 = $0 + 4
	la	$a0, frase
	syscall
	
	addi	$v0 $0, 10
	syscall