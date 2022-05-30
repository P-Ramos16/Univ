# 	RESPOSTA: 	Overflow quando n = 32
	
	.data
prompt:	.asciiz	"Introduza um numero\n"
resprm:	.asciiz	"O fatorial do número inserido é: "

	.text
main:	la	$a0, prompt
	li 	$v0, 4
	syscall			# print prompt
	
	li	$v0, 5
	syscall			# $v0 = input
	
	move	$s0, $v0	# $s0 = input
	li	$s1, 1		# $s1 = 0
	move	$s2, $s0	# $s2 = input
	
	
for:	beq	$s2, $0, endfor # if input == 0

	mul	$s1, $s1, $s2	# $s1 = $s1 * $s2

	subi	$s2, $s2, 1	# $s2--
	j 	for
	
endfor:
	la	$a0, resprm	# $a0 = resprm
	li 	$v0, 4		# print resprm
	syscall
	
	move	$a0, $s1	# $a0 = $s1
	li 	$v0, 1		# print $s1
	syscall
	
	li	$v0, 10
	syscall			# exit
