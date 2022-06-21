
	.data
prompt1: .asciiz	"Insira a frase1: "
prompt2: .asciiz	"Insira a frase2: "
numchar: .asciiz 	"O numero de caracteres da frase1 é: "
catphr:	 .asciiz 	"A frase concatenada é: "
buffer:  .space 	100


	.text
main:
	# print ao prompt
	la 	$a0, prompt1
	li	$v0, 4
	syscall	
	li	$v0, 8
	la	$a0, buffer
	li	$a1, 16
	syscall			# $a0 = input
	move	$s0, $a0
	
	
	move	$a0, $s0
	jal 	strlen		# $v0 = factorial(input)	
	move	$s2, $v0
	
	
	# print ao prompt
	la 	$a0, prompt2
	li	$v0, 4
	syscall	
	li	$v0, 8
	la	$a0, buffer
	li	$a1, 16
	syscall			# $a0 = input
	move	$s1, $a0
	
	
	
	la	$a0, numchar	# $a0 = resprm
	li 	$v0, 4		# print resprm
	syscall	
	move	$a0, $s2	# $a0 = input
	li 	$v0, 1		# print $s1
	syscall
	
	
	
	move	$a0, $s0
	move	$a0, $s0
	jal 	strcopy		# $v0 = strcopy(input)	
	move	$s2, $v0
	
	
	
	
	
	
	li	$v0, 10
	syscall			# exit
	
	

strlen:	li	$t0, 0		# n = 0
	li	$t1, 0		# i = 0
	
lenfor:	addu	$t2, $a0, $t1	# $t2 = &str[i]
	addi	$t1, $t1, 1	# i++
	lb	$t3, 0($t2)	# $t3 = byte em str[i]
	beq	$t3, '\0', lenendfor
	addi	$t0, $t0, 1	# n++
	j 	lenfor
	
lenendfor:subi	$t0, $t0, 1	# n - 1
	move	$v0, $t0	# $v0 = n
	jr	$ra






strcopy:li	$t0, 0		# i = 0
	
copyfor:addu	$t1, $a0, $t0	# $t2 = &str[i]
	lb	$t2, 0($t1)	# $t3 = byte em str[i]
	beq	$t2, '\0', copyendfor
	
	addu	$t3, $v0, $t0	# $t3 = &dst[i]
	sb	$t2, 0($t3)
	
	addi	$t0, $t0, 1	# i++
	j 	copyfor

copyendfor:
	jr	$ra


strcat:
	subiu	$sp, $sp,8
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)	
	move	$s0, $a0
	
catfor:	lb	$t0, 0($a0)	# $t3 = byte em str[i]
	beq	$t0, '\0', catendfor	
	addiu	$a0, $a0, 1	# $t3 = &dst[i]
	j 	catfor

catendfor:
	jal	strcopy
	move	$v0, $a0
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	addu	$sp, $sp, 8
	jr	$ra