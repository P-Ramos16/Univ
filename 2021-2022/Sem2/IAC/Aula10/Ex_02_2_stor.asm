.main	
	li	$t1, 0xFFFFFFFF
	li	$t2, 0xF0000000
	li	$t0, 0
	
for:	bge	$t0, 8, endfor
	and	$a0, $t1, $t2
	srl	$a0, $a0, 28
	li	$v0, 34
	syscall
	sll	$t1, $t1, 4
	addi	$t0, $t0, 1
	j for
endfor: