
	thumb_func_start MOD44_02229EE0
MOD44_02229EE0: @ 0x02229EE0
	push {r3, lr}
	movs r1, #0x16
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl FUN_020503D0
	movs r1, #2
	movs r2, #0x1b
	bl FUN_02066930
	pop {r3, pc}
	.align 2, 0
	thumb_func_end MOD44_02229EE0
