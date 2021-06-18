
	thumb_func_start MOD56_021E5C20
MOD56_021E5C20: @ 0x021E5C20
	push {r3, r4, r5, lr}
	movs r2, #2
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x29
	lsls r2, r2, #0x10
	bl FUN_0201A910
	adds r0, r5, #0
	movs r1, #0xc4
	movs r2, #0x29
	bl FUN_02007280
	movs r1, #0
	movs r2, #0xc4
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x29
	str r0, [r4]
	adds r0, r5, #0
	bl FUN_020072A4
	str r0, [r4, #0x1c]
	ldrh r0, [r0]
	ldr r1, _021E5C98 @ =0x0000FFFF
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	ldr r0, [r4, #0x1c]
	ldrb r0, [r0, #2]
	strb r0, [r4, #0x11]
	ldr r0, [r4, #0x1c]
	ldrb r0, [r0, #3]
	strb r0, [r4, #0x12]
	ldrb r0, [r4, #0x11]
	strb r0, [r4, #0x16]
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x1c]
	strh r1, [r0]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #4]
	bl FUN_0202AD3C
	strb r0, [r4, #0x10]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #4]
	bl FUN_0202ADCC
	strb r0, [r4, #0xb]
	movs r0, #1
	bl FUN_02002B34
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #8]
	bl FUN_020183F0
	strb r0, [r4, #0xa]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5C98: .4byte 0x0000FFFF
	thumb_func_end MOD56_021E5C20
