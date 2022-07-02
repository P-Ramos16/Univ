	.data
prm1:	.asciiz	"Introduza um numero\n"
res:	.asciiz	"O fatorial do número inserido é: "

	.text
main:	la	$a0, prm1
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	li	$t1, 1
	move	$t2, $t0
	
for:	beq	$t2, $0, endfor
	mul	$t1, $t1, $t2
	add	$t2, $t2, -1
	j 	for
	
endfor:	la	$a0, res
	li	$v0, 4
	syscall

	move	$a0, $t1
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall