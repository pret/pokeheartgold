
	thumb_func_start MOD103_021EC940
MOD103_021EC940: @ 0x021EC940
	push {r3, r4, r5, lr}
	movs r2, #1
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x9c
	lsls r2, r2, #0x10
	bl FUN_0201A910
	adds r0, r5, #0
	movs r1, #0x2c
	movs r2, #0x9c
	bl FUN_02007280
	movs r1, #0
	movs r2, #0x2c
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	bl FUN_020072A4
	str r0, [r4, #8]
	ldr r0, [r0]
	bl FUN_02028EA8
	str r0, [r4]
	ldr r0, [r4, #8]
	ldr r0, [r0]
	bl FUN_0202B50C
	str r0, [r4, #4]
	movs r0, #8
	str r0, [r4, #0x28]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end MOD103_021EC940
