
	thumb_func_start MOD53_021E5900
MOD53_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	sub sp, #8
	movs r2, #1
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x50
	lsls r2, r2, #0x12
	bl FUN_0201A910
	movs r1, #6
	adds r0, r5, #0
	lsls r1, r1, #6
	movs r2, #0x50
	bl FUN_02007280
	movs r2, #6
	movs r1, #0
	lsls r2, r2, #6
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x50
	str r0, [r4]
	adds r0, r5, #0
	bl FUN_020072A4
	ldr r0, [r0, #8]
	str r0, [r4, #4]
	bl FUN_02028EA8
	movs r1, #0
	str r0, [r4, #8]
	str r1, [r4, #0xc]
	str r1, [r4, #0x10]
	str r1, [r4, #0x14]
	ldr r0, [r4, #8]
	adds r2, r1, #0
	str r0, [sp]
	movs r0, #0x50
	movs r3, #7
	str r1, [sp, #4]
	bl FUN_020830D8
	movs r1, #0x12
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, #8]
	movs r2, #0
	str r0, [sp]
	movs r0, #0x50
	movs r1, #3
	movs r3, #7
	str r2, [sp, #4]
	bl FUN_020830D8
	movs r2, #0x49
	lsls r2, r2, #2
	adds r1, r2, #0
	str r0, [r4, r2]
	movs r0, #0
	adds r1, #0x58
	str r0, [r4, r1]
	adds r2, #0x18
	str r0, [r4, r2]
	bl FUN_02002B8C
	ldr r1, [r4]
	movs r0, #4
	bl FUN_02002CEC
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end MOD53_021E5900
