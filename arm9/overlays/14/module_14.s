
	thumb_func_start MOD14_021E5900
MOD14_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	movs r2, #1
	adds r5, r0, #0
	movs r0, #3
	movs r1, #9
	lsls r2, r2, #0x10
	bl FUN_0201A910
	adds r0, r5, #0
	movs r1, #0x38
	movs r2, #9
	bl FUN_02007280
	movs r1, #0
	movs r2, #0x38
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	bl FUN_020072A4
	str r0, [r4]
	ldr r0, [r0]
	bl FUN_020270D8
	str r0, [r4, #4]
	bl FUN_02073D4C
	strb r0, [r4, #0x1f]
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02074904
	str r0, [r4, #8]
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0207879C
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02028EA8
	str r0, [r4, #0x10]
	adds r0, r4, #0
	movs r1, #0xff
	adds r0, #0x21
	strb r1, [r0]
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #0xb
	str r0, [r4, #0x30]
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end MOD14_021E5900
