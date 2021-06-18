
	thumb_func_start MOD80_02229EE0
MOD80_02229EE0: @ 0x02229EE0
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r0, r2, #0
	adds r1, r4, #0
	adds r2, r3, #0
	bl FUN_02007524
	pop {r4, pc}
	.align 2, 0
	thumb_func_end MOD80_02229EE0
