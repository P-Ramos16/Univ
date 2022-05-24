# 2.1 / 2.2
	.text
main:	li	$t0, 0xF0000003

	addi	$t4, $0, 4

	sllv	$t1, $t0, $t4
	srlv	$t2, $t0, $t4
	srav	$t3, $t0, $t4