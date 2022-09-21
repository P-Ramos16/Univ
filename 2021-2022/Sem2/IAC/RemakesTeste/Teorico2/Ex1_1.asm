	.data
nums:	.word	-2, 3, -19, 4, 8, 120, -131, 17
msg:	.asciiz	"O nr de impares: "

	.text
main:	li	$s0, 0
	li	$s1, 0
	la	$s4, nums
	
for:	beq	$s0, 8, endfor
	
	sll	$s2, $s0, 2
	addu	$s2, $s4, $s2
	lw	$s3, 0($s2)
	and	$s3, $s3, 0x00000001
	
	beq	$s3, 0, skip
	addi	$s1, $s1, 1
	
skip:	addi	$s0, $s0, 1
	j 	for
	
endfor:	la	$a0, msg
	li	$v0, 4
	syscall
	
	move	$a0, $s1
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall