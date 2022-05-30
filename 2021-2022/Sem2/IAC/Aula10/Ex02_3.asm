# 4
	.data
prompt: .asciiz	 "Introduza um numero: "
resprm:	.asciiz "\n O número em hexadecimal e’: "
newLine:.asciiz "\n"

	
	.text	
main:	li	$t1, 0xFFFFFFFF

	# print ao prompt
	la 	$a0, prompt
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
	li	$t2, 0xF0000000 # mask para o $t1
for:	beq	$s1, 8, forend	# if i == 32 go to forend

	and	$t0, $t1, $t2	# aplicar a mascara
		
	# print ao t0
	move	$a0, $t0	
	li	$v0, 35
	syscall
	
	la     $a0, newLine
	li	$v0, 4
	syscall
		
	sll	$t1, $t1, 4	# shift à mascara
	addi 	$s1, $s1, 1	# i++
	j 	for		# jump to for
		
forend:	li 	$v0, 10
	syscall 		# exit()
	
	