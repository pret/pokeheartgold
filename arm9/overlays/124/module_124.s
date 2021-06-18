
	thumb_func_start MOD124_02260C20
MOD124_02260C20: @ 0x02260C20
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02260CF8 @ =0x0000007B
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #0
	adds r1, r7, #0
	ldr r4, _02260CFC @ =0x0097B4B1
	blx FUN_020D8D60
	ldr r0, _02260D00 @ =0x02260D69
	blx FUN_0225F4A8
	cmp r0, #0
	bne _02260C40
	movs r1, #1
	b _02260C42
_02260C40:
	movs r1, #0
_02260C42:
	ldr r0, _02260D04 @ =0x00000301
	muls r0, r1, r0
	adds r4, r4, r0
	adds r0, r6, #0
	bl FUN_020072A4
	ldr r0, [r0, #8]
	str r0, [r5, #0xc]
	movs r0, #0
	str r0, [r5, #0x10]
	ldr r0, _02260D08 @ =0x02260D6D
	blx FUN_0225F688
	cmp r0, #0
	bne _02260C64
	movs r1, #1
	b _02260C66
_02260C64:
	movs r1, #0
_02260C66:
	movs r0, #0x2f
	muls r0, r1, r0
	adds r4, r4, r0
	ldr r0, [r5, #0xc]
	bl FUN_0203B9C4
	bl FUN_0203B958
	str r0, [r5, #0x20]
	bl FUN_0203AF9C
	str r0, [r5, #0x30]
	ldr r0, _02260D0C @ =0x02260D59
	blx FUN_0225F520
	adds r6, r0, #0
	ldr r1, _02260D10 @ =0x000003A1
	adds r0, r5, #0
	muls r6, r1, r6
	movs r1, #0xb
	bl FUN_0203B610
	movs r0, #0xb
	bl FUN_020787A8
	adds r1, r5, #0
	adds r1, #0x94
	str r0, [r1]
	movs r0, #0
	adds r1, r7, #0
	blx FUN_020D8DB4
	ldr r1, _02260D14 @ =0x00000989
	adds r0, r4, r6
	blx FUN_020F2BA4
	cmp r1, #0
	beq _02260CB8
	adds r0, r5, #0
	bl FUN_02260D1C
_02260CB8:
	movs r0, #0xb
	bl FUN_02092BB8
	adds r1, r5, #0
	adds r1, #0xa8
	str r0, [r1]
	movs r0, #0xb
	bl FUN_0206A1D4
	movs r1, #0x42
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xb
	adds r1, r5, #0
	bl FUN_02092D98
	movs r1, #0x45
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	adds r1, #0x10
	str r0, [r5, r1]
	ldr r1, _02260D18 @ =0x00000FE9
	adds r0, r4, r6
	blx FUN_020F2BA4
	cmp r1, #0
	beq _02260CF6
	adds r0, r5, #0
	bl FUN_02260D1C
_02260CF6:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02260CF8: .4byte 0x0000007B
_02260CFC: .4byte 0x0097B4B1
_02260D00: .4byte 0x02260D69
_02260D04: .4byte 0x00000301
_02260D08: .4byte 0x02260D6D
_02260D0C: .4byte 0x02260D59
_02260D10: .4byte 0x000003A1
_02260D14: .4byte 0x00000989
_02260D18: .4byte 0x00000FE9
	thumb_func_end MOD124_02260C20

	thumb_func_start FUN_02260D1C
FUN_02260D1C: @ 0x02260D1C
	push {r4, r5, r6, lr}
	movs r5, #0
	adds r6, r0, #0
	adds r4, r5, #0
_02260D24:
	ldr r0, [r6, #0xc]
	bl FUN_02028E9C
	adds r1, r4, #0
	bl FUN_02028F98
	cmp r0, #1
	bne _02260D36
	adds r5, r5, #1
_02260D36:
	adds r4, r4, #1
	cmp r4, #0x10
	blt _02260D24
	cmp r5, #0
	bne _02260D44
	ldr r1, _02260D54 @ =0x00004E20
	b _02260D4A
_02260D44:
	ldr r0, _02260D54 @ =0x00004E20
	adds r1, r5, #0
	muls r1, r0, r1
_02260D4A:
	movs r0, #3
	bl FUN_0201AACC
	pop {r4, r5, r6, pc}
	nop
_02260D54: .4byte 0x00004E20
	thumb_func_end FUN_02260D1C
