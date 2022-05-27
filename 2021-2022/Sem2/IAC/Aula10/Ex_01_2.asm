	.data
prompt:	.asciiz	"Introduza um numero\n"

	.text
main:	la	$a0, prompt
	li 	$v0, 4
	syscall			# print prompt
	
	li	$v0, 5
	syscall			# $v0 = input
	
	move	$s0, $v0	# $s0 = input
	li	$s1, 0		# $s1 = 0
	
	la	$a0, '-'	# $a0 = '-'
	li 	$v0, 11		# print char
	
for:	beq	$s0, $s1, endfor# if $s0 == $s1
	syscall			# print
	addi	$s1, $s1, 1	# $s1++
	j 	for
	
endfor:
	li	$v0, 10
	syscall
