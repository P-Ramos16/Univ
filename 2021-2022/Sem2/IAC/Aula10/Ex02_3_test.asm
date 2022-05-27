# 4
	.data
prompt: .asciiz	 "$t1 > "
newLine:.asciiz "\n"

	
	.text	
main:	li	$t1, 0xFFFFFFFF

	# print ao prompt
	la 	$a0, prompt
	li	$v0, 4
	syscall
	
	# print a uma new line
	la     $a0, newLine
	li	$v0, 4
	syscall		
		
	# print ao valor de $t1
	move	$a0, $t1
	li	$v0, 34
	syscall
	
	# print a duas new line
	la     $a0, newLine
	li	$v0, 4
	syscall
	syscall
	
	
	add	$s1, $0 ,$0	# i = 0
	li	$t2, 0x0000000F # mask para o $t1
for:	beq	$s1, 8, forend	# if i == 0 go to forend

	and	$t0, $t1, $t2	# aplicar a mascara
		
	# print ao t0
	move	$a0, $t0	
     	addi   $v0, $0, 4
	li	$v0, 34
	syscall
	
	# print a uma new line
	la     $a0, newLine
	li	$v0, 4
	syscall
		
	sll	$t2, $t2, 4	# shift à mascara
	addi 	$s1, $s1, 1	# i++
	j 	for		# jump to for
		
forend:	li 	$v0, 10
	syscall 		# exit()
	
	