
	thumb_func_start MOD120_0225F020
MOD120_0225F020: @ 0x0225F020
	push {r4, lr}
	movs r1, #0x34
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x34
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end MOD120_0225F020
