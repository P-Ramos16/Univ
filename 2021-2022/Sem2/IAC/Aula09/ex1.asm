# 1.1 / 1.2
	.text
main:	li	$t0, 0x12345678
	li	$t1, 0x0000000F
	and	$t2, $t0, $t1
	or	$t3, $t0, $t1
	nor	$t4, $t0, $t1
	xor	$t5, $t0, $t1

# 1.3
	# nand
	li	$t7, 0xFFFFFFFF
	and	$t6, $t0, $t7
	not	$t6, $t6