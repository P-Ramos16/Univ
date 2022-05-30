	.data
prompt: .asciiz	"Introduza um numero\n"
respar: .asciiz	"O numero é par\n"
resimp: .asciiz	"O numero é impar\n"

	.text
main:	la	$a0, prompt
	li 	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	
	andi	$t0, $v0, 1

if:	bne	$t0, $0, else
	la	$a0, respar
	j endif
	
else:	la	$a0, resimp
	
endif:	li	$v0, 4
	syscall
	li	$v0, 10
	syscall