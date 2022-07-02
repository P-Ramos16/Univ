	.data
res1:	.asciiz	"$t0 AND $t1 = "
res2:	.asciiz	"\n$t0 OR $t1 ="
res3:	.asciiz	"\n$t0 NOR $t1 ="
res4:	.asciiz	"\n$t0 XNOR $t1 ="


	.text
main:	li	$t0, 0x12345678
	li	$t1, 0x0000000F	

	la	$a0, res1
	li	$v0, 4
	syscall		
	and 	$a0, $t0, $t1	
	li	$v0, 34
	syscall
	
	la	$a0, res2
	li	$v0, 4
	syscall
	or 	$a0, $t0, $t1
	li	$v0, 34
	syscall
	
	la	$a0, res3
	li	$v0, 4
	syscall
	nor 	$a0, $t0, $t1	
	li	$v0, 34
	syscall
	
	la	$a0, res4
	li	$v0, 4
	syscall
	xor 	$a0, $t0, $t1	
	not	$a0, $a0
	li	$v0, 34
	syscall
	
	li	$v0, 10
	syscall