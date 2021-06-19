
	thumb_func_start MOD36_021E5900
MOD36_021E5900: @ 0x021E5900
	push {r3, lr}
	movs r2, #2
	movs r0, #3
	movs r1, #0x4b
	lsls r2, r2, #0x10
	bl FUN_0201A910
	bl FUN_020010C8
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end MOD36_021E5900
