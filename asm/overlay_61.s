
	thumb_func_start ov61_021E5900
ov61_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	sub sp, #0x10
	movs r2, #1
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x2e
	lsls r2, r2, #0x12
	bl FUN_0201A910
	ldr r1, _021E5A20 @ =0x00000598
	adds r0, r5, #0
	movs r2, #0x2e
	bl FUN_02007280
	ldr r2, _021E5A20 @ =0x00000598
	adds r4, r0, #0
	movs r1, #0
	blx FUN_020D4994
	adds r0, r4, #0
	movs r1, #0x2e
	adds r0, #0x20
	movs r2, #0x20
	str r1, [r4, #4]
	bl FUN_0201AC14
	adds r0, r5, #0
	bl FUN_020072A4
	adds r5, r0, #0
	ldr r0, [r5, #4]
	bl FUN_0202ADCC
	movs r1, #0xe9
	lsls r1, r1, #2
	strb r0, [r4, r1]
	ldr r0, _021E5A24 @ =0x00000578
	movs r1, #0
	adds r5, #8
	adds r2, r4, #0
_021E5950:
	adds r1, r1, #1
	str r5, [r2, r0]
	adds r5, #0xec
	adds r2, r2, #4
	cmp r1, #3
	blt _021E5950
	ldr r0, _021E5A28 @ =0x000003A5
	movs r1, #1
	strb r1, [r4, r0]
	ldr r0, _021E5A2C @ =ov61_021E60B8
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl ov61_021E60C8
	ldr r0, [r4, #4]
	bl ov61_021E60E8
	adds r0, r4, #0
	bl ov61_021E6140
	ldr r0, [r4, #4]
	bl FUN_0201AC88
	str r0, [r4, #8]
	movs r1, #1
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	add r0, sp, #0
	bl FUN_0201ACB0
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	bl ov61_021E6350
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	ldr r0, _021E5A30 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	bl FUN_02020080
	adds r0, r4, #0
	bl ov61_021E6B6C
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	bl ov61_021E6C3C
	adds r0, r4, #0
	bl ov61_021E6508
	adds r0, r4, #0
	bl ov61_021E6564
	ldr r0, [r4, #4]
	bl FUN_02023114
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x10]
	bl FUN_02019014
	ldr r1, _021E5A34 @ =0x00000574
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov61_021E6488
	adds r0, r4, #0
	bl ov61_021E6944
	adds r0, r4, #0
	bl ov61_021E6FC4
	movs r0, #0
	bl FUN_02002B34
	movs r0, #1
	bl FUN_02002B50
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E5A20: .4byte 0x00000598
_021E5A24: .4byte 0x00000578
_021E5A28: .4byte 0x000003A5
_021E5A2C: .4byte ov61_021E60B8
_021E5A30: .4byte 0x021D116C
_021E5A34: .4byte 0x00000574
	thumb_func_end ov61_021E5900

	thumb_func_start ov61_021E5A38
ov61_021E5A38: @ 0x021E5A38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	movs r6, #0
	cmp r1, #0xc
	bls _021E5A4E
	b _021E5E86
_021E5A4E:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5A5A: @ jump table
	.2byte _021E5A74 - _021E5A5A - 2 @ case 0
	.2byte _021E5AA6 - _021E5A5A - 2 @ case 1
	.2byte _021E5AB4 - _021E5A5A - 2 @ case 2
	.2byte _021E5AFE - _021E5A5A - 2 @ case 3
	.2byte _021E5B4C - _021E5A5A - 2 @ case 4
	.2byte _021E5B70 - _021E5A5A - 2 @ case 5
	.2byte _021E5CF2 - _021E5A5A - 2 @ case 6
	.2byte _021E5D72 - _021E5A5A - 2 @ case 7
	.2byte _021E5D8C - _021E5A5A - 2 @ case 8
	.2byte _021E5DA2 - _021E5A5A - 2 @ case 9
	.2byte _021E5DBC - _021E5A5A - 2 @ case 10
	.2byte _021E5E52 - _021E5A5A - 2 @ case 11
	.2byte _021E5E78 - _021E5A5A - 2 @ case 12
_021E5A74:
	movs r1, #7
	bl ov61_021E6DFC
	movs r0, #2
	adds r1, r6, #0
	bl FUN_02022C60
	movs r0, #4
	adds r1, r6, #0
	bl FUN_02022C60
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #4]
	adds r2, r1, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	str r0, [r5]
	b _021E5E86
_021E5AA6:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5B94
	movs r0, #2
	str r0, [r5]
	b _021E5E86
_021E5AB4:
	ldr r0, _021E5E0C @ =0x00000574
	ldr r0, [r4, r0]
	bl FUN_020190E8
	cmp r0, #0
	beq _021E5B94
	adds r0, r6, #0
	str r0, [sp]
	ldr r0, _021E5E10 @ =0x0001020F
	ldr r1, _021E5E14 @ =0x000003A5
	str r0, [sp, #4]
	ldrb r0, [r4, r1]
	movs r2, #1
	movs r3, #0xbe
	str r0, [sp, #8]
	adds r0, r1, #0
	adds r0, #0xb
	adds r0, r4, r0
	str r0, [sp, #0xc]
	subs r1, #9
	ldr r0, [r4, r1]
	ldr r1, [r4, #4]
	bl ov61_021E6D78
	ldr r1, _021E5E18 @ =0x000003A6
	strb r0, [r4, r1]
	movs r0, #2
	adds r1, r6, #0
	bl FUN_02022C60
	movs r0, #4
	adds r1, r6, #0
	bl FUN_02022C60
	movs r0, #4
	str r0, [r5]
	b _021E5E86
_021E5AFE:
	movs r1, #0xe5
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	movs r2, #1
	adds r0, r0, #1
	str r0, [sp]
	ldr r0, _021E5E10 @ =0x0001020F
	movs r3, #0xbe
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r0, #0x11
	ldrb r0, [r4, r0]
	str r0, [sp, #8]
	adds r0, r1, #0
	adds r0, #0x1c
	adds r0, r4, r0
	str r0, [sp, #0xc]
	adds r1, #8
	ldr r0, [r4, r1]
	ldr r1, [r4, #4]
	bl ov61_021E6D78
	ldr r1, _021E5E18 @ =0x000003A6
	strb r0, [r4, r1]
	adds r0, r4, #0
	movs r1, #8
	bl ov61_021E6DFC
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	str r0, [r5]
	b _021E5E86
_021E5B4C:
	ldr r0, _021E5E18 @ =0x000003A6
	ldrb r0, [r4, r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021E5B94
	movs r0, #0x3b
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x3b
	adds r1, r6, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r0, #5
	str r0, [r5]
	b _021E5E86
_021E5B70:
	ldr r0, _021E5E0C @ =0x00000574
	ldr r0, [r4, r0]
	bl FUN_020190E8
	cmp r0, #0
	beq _021E5B94
	adds r0, r4, #0
	bl ov61_021E6E40
	cmp r0, #7
	beq _021E5B8E
	cmp r0, #8
	bne _021E5B90
	movs r6, #1
	b _021E5B90
_021E5B8E:
	movs r6, #2
_021E5B90:
	cmp r0, #8
	bls _021E5B96
_021E5B94:
	b _021E5E86
_021E5B96:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5BA2: @ jump table
	.2byte _021E5E86 - _021E5BA2 - 2 @ case 0
	.2byte _021E5C1E - _021E5BA2 - 2 @ case 1
	.2byte _021E5C32 - _021E5BA2 - 2 @ case 2
	.2byte _021E5C1E - _021E5BA2 - 2 @ case 3
	.2byte _021E5C32 - _021E5BA2 - 2 @ case 4
	.2byte _021E5BB4 - _021E5BA2 - 2 @ case 5
	.2byte _021E5C5E - _021E5BA2 - 2 @ case 6
	.2byte _021E5C48 - _021E5BA2 - 2 @ case 7
	.2byte _021E5CB2 - _021E5BA2 - 2 @ case 8
_021E5BB4:
	ldr r0, _021E5E1C @ =0x00000584
	movs r1, #2
	str r1, [r4, r0]
	movs r2, #0
	movs r0, #0xe5
	str r2, [sp, #0x14]
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r0, #8
	adds r1, r1, #4
	str r1, [sp]
	ldr r1, _021E5E10 @ =0x0001020F
	movs r3, #0xbe
	str r1, [sp, #4]
	str r2, [sp, #8]
	add r1, sp, #0x14
	str r1, [sp, #0xc]
	ldr r0, [r4, r0]
	ldr r1, [r4, #4]
	bl ov61_021E6D78
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	lsls r1, r0, #2
	ldr r0, _021E5E20 @ =0x021E7398
	ldr r0, [r0, r1]
	movs r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02006218
	adds r0, r4, #0
	movs r1, #7
	bl ov61_021E6DFC
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	adds r0, r4, #0
	bl ov61_021E7220
	movs r0, #5
	str r0, [r5]
	b _021E5E86
_021E5C1E:
	ldr r1, _021E5E24 @ =0xFFFFF800
	ldr r0, _021E5E28 @ =0x0000039A
	strh r1, [r4, r0]
	movs r0, #6
	str r0, [r5]
	ldr r0, _021E5E2C @ =0x00000607
	asrs r1, r1, #2
	bl FUN_02006134
	b _021E5E86
_021E5C32:
	movs r1, #2
	ldr r0, _021E5E28 @ =0x0000039A
	lsls r1, r1, #0xa
	strh r1, [r4, r0]
	movs r0, #6
	str r0, [r5]
	ldr r0, _021E5E2C @ =0x00000607
	ldr r1, _021E5E30 @ =0xFFFFFE00
	bl FUN_02006134
	b _021E5E86
_021E5C48:
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #7
	str r0, [r5]
	b _021E5E86
_021E5C5E:
	movs r2, #0xe5
	lsls r2, r2, #2
	ldr r7, [r4, r2]
	adds r0, r4, #0
	adds r3, r7, #3
	movs r1, #0x78
	subs r2, #0x54
	adds r0, #0x70
	muls r1, r3, r1
	adds r0, r0, r1
	adds r2, r4, r2
	lsls r1, r7, #3
	adds r1, r2, r1
	bl ov61_021E6820
	movs r2, #0xe5
	lsls r2, r2, #2
	ldr r1, [r4, r2]
	adds r0, r4, #0
	adds r3, r1, #3
	movs r1, #0x78
	adds r0, #0x70
	muls r1, r3, r1
	subs r2, #0x3c
	adds r0, r0, r1
	adds r1, r4, r2
	bl ov61_021E6814
	movs r1, #0x36
	adds r0, r4, #0
	lsls r1, r1, #4
	adds r0, #0x70
	adds r1, r4, r1
	bl ov61_021E6814
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xa
	str r0, [r5]
	b _021E5E86
_021E5CB2:
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #2
	bne _021E5D7E
	ldr r0, _021E5E1C @ =0x00000584
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #7
	bl ov61_021E6DFC
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0xed
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov61_021E7248
	movs r0, #0xea
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #9
	str r0, [r5]
	b _021E5E86
_021E5CF2:
	ldr r1, _021E5E28 @ =0x0000039A
	ldrsh r1, [r4, r1]
	bl ov61_021E6AE0
	cmp r0, #0
	beq _021E5D7E
	ldr r0, _021E5E1C @ =0x00000584
	movs r1, #2
	str r1, [r4, r0]
	adds r2, r6, #0
	movs r0, #0xe5
	str r2, [sp, #0x10]
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r0, #8
	adds r1, r1, #4
	str r1, [sp]
	ldr r1, _021E5E10 @ =0x0001020F
	movs r3, #0xbe
	str r1, [sp, #4]
	str r2, [sp, #8]
	add r1, sp, #0x10
	str r1, [sp, #0xc]
	ldr r0, [r4, r0]
	ldr r1, [r4, #4]
	bl ov61_021E6D78
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	lsls r1, r0, #2
	ldr r0, _021E5E20 @ =0x021E7398
	ldr r0, [r0, r1]
	adds r1, r6, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02006218
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	beq _021E5D5E
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
_021E5D5E:
	adds r0, r4, #0
	bl ov61_021E7220
	movs r0, #0xea
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #5
	str r0, [r5]
	b _021E5E86
_021E5D72:
	ldr r2, _021E5E34 @ =0xFFFFEA20
	adds r1, r6, #0
	bl ov61_021E7268
	cmp r0, #0
	bne _021E5D80
_021E5D7E:
	b _021E5E86
_021E5D80:
	adds r0, r4, #0
	bl ov61_021E7220
	movs r0, #8
	str r0, [r5]
	b _021E5E86
_021E5D8C:
	bl ov61_021E68E4
	cmp r0, #0
	beq _021E5E86
	movs r0, #0xea
	movs r1, #2
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #3
	str r0, [r5]
	b _021E5E86
_021E5DA2:
	ldr r1, _021E5E34 @ =0xFFFFEA20
	adds r2, r6, #0
	bl ov61_021E7268
	cmp r0, #0
	beq _021E5E86
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov61_021E6B2C
	movs r0, #2
	str r0, [r5]
	b _021E5E86
_021E5DBC:
	movs r0, #0xa
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	ldr r3, _021E5E38 @ =0x00007FFF
	str r0, [sp, #8]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r6, #0
	bl FUN_0200FA24
	ldr r7, _021E5E1C @ =0x00000584
	movs r0, #1
	str r0, [r4, r7]
	ldr r1, _021E5E3C @ =0x0000DCC0
	add r0, sp, #0x10
	strh r1, [r0, #0x1c]
	ldr r1, _021E5E40 @ =0x000011A4
	ldr r3, _021E5E44 @ =0x021E73A4
	strh r1, [r0, #0x1e]
	ldm r3!, {r0, r1}
	add r2, sp, #0x30
	stm r2!, {r0, r1}
	ldr r0, [r3]
	subs r7, #0x10
	str r0, [r2]
	movs r0, #0x19
	lsls r0, r0, #0xe
	str r0, [sp, #0x3c]
	ldr r0, [r4, r7]
	add r1, sp, #0x2c
	movs r2, #8
	bl FUN_02019040
	movs r0, #0xb
	str r0, [r5]
	ldr r0, _021E5E48 @ =0x000005F8
	b _021E5E4C
	nop
_021E5E0C: .4byte 0x00000574
_021E5E10: .4byte 0x0001020F
_021E5E14: .4byte 0x000003A5
_021E5E18: .4byte 0x000003A6
_021E5E1C: .4byte 0x00000584
_021E5E20: .4byte 0x021E7398
_021E5E24: .4byte 0xFFFFF800
_021E5E28: .4byte 0x0000039A
_021E5E2C: .4byte 0x00000607
_021E5E30: .4byte 0xFFFFFE00
_021E5E34: .4byte 0xFFFFEA20
_021E5E38: .4byte 0x00007FFF
_021E5E3C: .4byte 0x0000DCC0
_021E5E40: .4byte 0x000011A4
_021E5E44: .4byte 0x021E73A4
_021E5E48: .4byte 0x000005F8
_021E5E4C:
	bl FUN_0200604C
	b _021E5E86
_021E5E52:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5E86
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	adds r1, r6, #0
	str r0, [sp, #8]
	ldr r3, _021E5F50 @ =0x00007FFF
	movs r0, #3
	adds r2, r1, #0
	bl FUN_0200FA24
	movs r0, #0xc
	str r0, [r5]
	b _021E5E86
_021E5E78:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5E86
	add sp, #0x40
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E5E86:
	cmp r6, #0
	beq _021E5EDC
	cmp r6, #1
	add r0, sp, #0x10
	bne _021E5EAE
	ldr r1, _021E5F54 @ =0x0000DCC0
	ldr r3, _021E5F58 @ =_021E7380
	strh r1, [r0, #8]
	ldr r1, _021E5F5C @ =0x000011A4
	add r2, sp, #0x1c
	strh r1, [r0, #0xa]
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #0
	str r0, [r2]
	movs r0, #0x19
	lsls r0, r0, #0xe
	str r0, [sp, #0x28]
	b _021E5ECA
_021E5EAE:
	ldr r1, _021E5F60 @ =0x0000EA20
	ldr r3, _021E5F64 @ =0x021E73BC
	strh r1, [r0, #8]
	ldr r1, _021E5F68 @ =0x00001024
	add r2, sp, #0x1c
	strh r1, [r0, #0xa]
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #2
	str r0, [r2]
	movs r0, #0xf
	lsls r0, r0, #0xe
	str r0, [sp, #0x28]
_021E5ECA:
	movs r0, #0xeb
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _021E5F6C @ =0x00000574
	add r1, sp, #0x18
	ldr r0, [r4, r0]
	movs r2, #8
	bl FUN_02019040
_021E5EDC:
	ldr r0, _021E5F70 @ =0x00000584
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021E5EFA
	movs r0, #0xd6
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov61_021E682C
	movs r0, #0x36
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov61_021E682C
	b _021E5F1E
_021E5EFA:
	cmp r0, #2
	bne _021E5F06
	adds r0, r4, #0
	bl ov61_021E6894
	b _021E5F1E
_021E5F06:
	movs r1, #0xd1
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	movs r2, #0
	str r2, [r0]
	adds r0, r1, #0
	adds r0, #8
	ldr r0, [r4, r0]
	adds r1, #0x10
	str r2, [r0]
	ldr r0, [r4, r1]
	str r2, [r0]
_021E5F1E:
	movs r0, #0xda
	lsls r0, r0, #2
	adds r3, r4, r0
	ldr r2, [r3, #4]
	movs r0, #1
	ldr r1, [r2]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [r2]
	ldr r2, [r3, #4]
	ldr r0, [r2, #8]
	ldr r1, [r2]
	ldrh r0, [r0, #4]
	lsls r0, r0, #0xc
	cmp r1, r0
	blt _021E5F42
	movs r0, #0
	str r0, [r2]
_021E5F42:
	adds r0, r4, #0
	bl ov61_021E61FC
	movs r0, #0
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5F50: .4byte 0x00007FFF
_021E5F54: .4byte 0x0000DCC0
_021E5F58: .4byte _021E7380
_021E5F5C: .4byte 0x000011A4
_021E5F60: .4byte 0x0000EA20
_021E5F64: .4byte 0x021E73BC
_021E5F68: .4byte 0x00001024
_021E5F6C: .4byte 0x00000574
_021E5F70: .4byte 0x00000584
	thumb_func_end ov61_021E5A38

	thumb_func_start ov61_021E5F74
ov61_021E5F74: @ 0x021E5F74
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_020072A4
	adds r6, r0, #0
	movs r0, #0
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B50
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [r6]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	ldr r0, _021E6060 @ =0x00000574
	ldr r0, [r4, r0]
	bl FUN_02019030
	ldr r0, [r4, #0x10]
	bl FUN_02023120
	adds r0, r4, #0
	bl ov61_021E6730
	adds r0, r4, #0
	bl ov61_021E6750
	movs r0, #0xed
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov61_021E6068
	ldr r0, _021E6064 @ =0x0000043C
	ldr r0, [r4, r0]
	bl FUN_02024504
	movs r0, #0xed
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200A0D0
	movs r0, #0xee
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200A0D0
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200A0D0
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0200A0D0
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov61_021E6E30
	movs r0, #0x3a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov61_021E6E30
	ldr r0, [r4, #8]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #8]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #8]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4, #8]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [r4, #8]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [r4, #8]
	bl FUN_0201AB0C
	ldr r0, [r4, #0xc]
	bl FUN_02026F54
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x2e
	bl FUN_0201A9C4
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E6060: .4byte 0x00000574
_021E6064: .4byte 0x0000043C
	thumb_func_end ov61_021E5F74

	thumb_func_start ov61_021E6068
ov61_021E6068: @ 0x021E6068
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
	adds r4, r5, #0
	adds r6, r5, #0
_021E6072:
	ldr r0, [r4, #0x18]
	bl FUN_0200AEB0
	ldr r0, [r4, #0x1c]
	bl FUN_0200B0A8
	ldr r0, [r5]
	ldr r1, [r4, #0x18]
	bl FUN_0200A75C
	ldr r0, [r5, #4]
	ldr r1, [r4, #0x1c]
	bl FUN_0200A75C
	ldr r0, [r5, #8]
	ldr r1, [r4, #0x20]
	bl FUN_0200A75C
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x24]
	bl FUN_0200A75C
	ldr r0, [r6, #0x60]
	bl FUN_0201AB0C
	ldr r0, [r6, #0x6c]
	bl FUN_0201AB0C
	adds r7, r7, #1
	adds r4, #0x18
	adds r6, r6, #4
	cmp r7, #3
	blt _021E6072
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov61_021E6068

	thumb_func_start ov61_021E60B8
ov61_021E60B8: @ 0x021E60B8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200B224
	ldr r0, [r4, #8]
	bl FUN_0201EEB4
	pop {r4, pc}
	thumb_func_end ov61_021E60B8

	thumb_func_start ov61_021E60C8
ov61_021E60C8: @ 0x021E60C8
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E60E4 @ =0x021E7494
	add r3, sp, #0
	movs r2, #5
_021E60D2:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E60D2
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E60E4: .4byte 0x021E7494
	thumb_func_end ov61_021E60C8

	thumb_func_start ov61_021E60E8
ov61_021E60E8: @ 0x021E60E8
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	adds r2, r0, #0
	str r4, [sp, #0x10]
	bl FUN_0200B150
	ldr r5, _021E6138 @ =0x021E73F8
	add r3, sp, #0x14
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	ldr r1, _021E613C @ =0x00200010
	movs r2, #0x10
	str r4, [sp, #0x20]
	bl FUN_020215C0
	movs r0, #3
	adds r1, r4, #0
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_021E6138: .4byte 0x021E73F8
_021E613C: .4byte 0x00200010
	thumb_func_end ov61_021E60E8

	thumb_func_start ov61_021E6140
ov61_021E6140: @ 0x021E6140
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #4
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #4]
	movs r2, #2
	adds r3, r1, #0
	bl FUN_02026EB4
	str r0, [r4, #0xc]
	ldr r0, _021E61DC @ =0x04000060
	ldr r2, _021E61E0 @ =0xFFFFCFFF
	ldrh r1, [r0]
	adds r3, r1, #0
	ands r3, r2
	movs r1, #0x10
	orrs r1, r3
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _021E61E4 @ =0x0000CFFB
	ands r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	adds r3, r1, #0
	ands r3, r2
	movs r1, #8
	orrs r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	adds r3, r4, #0
	ands r2, r1
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r0]
	ldr r1, _021E61E8 @ =0x00001084
	ldr r0, _021E61EC @ =0x00000588
	movs r2, #0
_021E6190:
	adds r2, r2, #1
	strh r1, [r3, r0]
	adds r3, r3, #2
	cmp r2, #8
	blt _021E6190
	ldr r0, _021E61EC @ =0x00000588
	adds r0, r4, r0
	blx FUN_020CF8E4
	movs r1, #0
	ldr r0, _021E61F0 @ =0x000043FF
	ldr r2, _021E61F4 @ =0x00007FFF
	movs r3, #0x3f
	str r1, [sp]
	blx FUN_020CF910
	movs r0, #0
	ldr r2, _021E61F8 @ =0xFFFFF000
	adds r1, r0, #0
	adds r3, r0, #0
	blx FUN_020BF034
	ldr r1, _021E61F4 @ =0x00007FFF
	movs r0, #0
	blx FUN_020BF070
	ldr r0, _021E61F4 @ =0x00007FFF
	movs r2, #0
	adds r1, r0, #0
	blx FUN_020BF084
	ldr r0, _021E61F4 @ =0x00007FFF
	movs r2, #0
	adds r1, r0, #0
	blx FUN_020BF0A8
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_021E61DC: .4byte 0x04000060
_021E61E0: .4byte 0xFFFFCFFF
_021E61E4: .4byte 0x0000CFFB
_021E61E8: .4byte 0x00001084
_021E61EC: .4byte 0x00000588
_021E61F0: .4byte 0x000043FF
_021E61F4: .4byte 0x00007FFF
_021E61F8: .4byte 0xFFFFF000
	thumb_func_end ov61_021E6140

	thumb_func_start ov61_021E61FC
ov61_021E61FC: @ 0x021E61FC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _021E623C @ =0x0000043C
	ldr r0, [r4, r0]
	bl FUN_0202457C
	bl FUN_02026E48
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	bl FUN_02023154
	adds r0, r4, #0
	bl ov61_021E6240
	movs r2, #1
	movs r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	blx FUN_020C2528
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E623C: .4byte 0x0000043C
	thumb_func_end ov61_021E61FC

	thumb_func_start ov61_021E6240
ov61_021E6240: @ 0x021E6240
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x98
	ldr r3, _021E633C @ =0x021E73EC
	adds r5, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x8c
	str r2, [sp]
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r4, r5, #0
	str r0, [r2]
	movs r6, #0
	adds r4, #0x70
	add r7, sp, #0x68
_021E625C:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _021E629C
	adds r0, r7, #0
	blx FUN_020CAFEC
	adds r0, r4, #0
	adds r0, #0x74
	ldrh r0, [r0]
	ldr r1, _021E6340 @ =0x021094DC
	asrs r0, r0, #4
	lsls r3, r0, #2
	ldr r0, _021E6340 @ =0x021094DC
	ldrsh r1, [r1, r3]
	adds r2, r0, r3
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r0, sp, #0x44
	bl FUN_020CB0EC
	add r0, sp, #0x44
	adds r1, r7, #0
	adds r2, r7, #0
	blx FUN_020CB410
	adds r1, r4, #0
	ldr r3, [sp]
	adds r0, r4, #0
	adds r1, #0x5c
	adds r2, r7, #0
	bl FUN_0201F554
_021E629C:
	adds r6, r6, #1
	adds r4, #0x78
	cmp r6, #2
	blt _021E625C
	add r2, sp, #0x14
	movs r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	ldr r4, _021E6344 @ =0x021E73E0
	str r0, [r2, #8]
	ldm r4!, {r0, r1}
	add r3, sp, #8
	stm r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	adds r0, r2, #0
	blx FUN_020BEFD4
	movs r0, #0xe6
	lsls r0, r0, #2
	ldrh r4, [r5, r0]
	add r0, sp, #0x20
	blx FUN_020CAFEC
	asrs r0, r4, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	ldr r3, _021E6340 @ =0x021094DC
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0x20
	bl FUN_020CB0EC
	ldr r1, _021E6348 @ =0x021DA558
	add r0, sp, #0x20
	blx FUN_020D4928
	ldr r1, _021E634C @ =0x021DA51C
	movs r0, #0xa4
	ldr r2, [r1, #0x7c]
	bics r2, r0
	add r0, sp, #8
	str r2, [r1, #0x7c]
	blx FUN_020BF004
	blx FUN_020BEF98
	adds r5, #0x70
	movs r4, #2
	adds r5, #0xf0
	movs r6, #0x11
	movs r7, #1
_021E6308:
	ldr r0, [r5, #0x58]
	cmp r0, #0
	beq _021E632E
	movs r1, #0
	adds r0, r6, #0
	adds r2, r1, #0
	blx FUN_020C2528
	adds r0, r5, #0
	bl ov61_021E6A28
	movs r0, #0x12
	add r1, sp, #4
	adds r2, r7, #0
	str r7, [sp, #4]
	blx FUN_020C2528
	blx FUN_020BEF98
_021E632E:
	adds r4, r4, #1
	adds r5, #0x78
	cmp r4, #6
	blt _021E6308
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E633C: .4byte 0x021E73EC
_021E6340: .4byte 0x021094DC
_021E6344: .4byte 0x021E73E0
_021E6348: .4byte 0x021DA558
_021E634C: .4byte 0x021DA51C
	thumb_func_end ov61_021E6240

	thumb_func_start ov61_021E6350
ov61_021E6350: @ 0x021E6350
	push {r3, r4, r5, r6, lr}
	sub sp, #0x8c
	adds r4, r1, #0
	ldr r1, _021E6470 @ =0x04000008
	adds r5, r0, #0
	ldrh r2, [r1]
	movs r0, #3
	ldr r6, _021E6474 @ =0x021E745C
	bics r2, r0
	movs r0, #2
	orrs r0, r2
	strh r0, [r1]
	add r3, sp, #0x70
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #1
	str r0, [r3]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r6, _021E6478 @ =0x021E7478
	add r3, sp, #0x54
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #2
	str r0, [r3]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	adds r0, r5, #0
	movs r1, #2
	bl FUN_0201CAE0
	ldr r6, _021E647C @ =0x021E7408
	add r3, sp, #0x38
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #4
	str r0, [r3]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	adds r0, r5, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r6, _021E6480 @ =0x021E7424
	add r3, sp, #0x1c
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #5
	str r0, [r3]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	adds r0, r5, #0
	movs r1, #5
	bl FUN_0201CAE0
	ldr r6, _021E6484 @ =0x021E7440
	add r3, sp, #0
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #6
	str r0, [r3]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	adds r0, r5, #0
	movs r1, #6
	bl FUN_0201CAE0
	add sp, #0x8c
	pop {r3, r4, r5, r6, pc}
	nop
_021E6470: .4byte 0x04000008
_021E6474: .4byte 0x021E745C
_021E6478: .4byte 0x021E7478
_021E647C: .4byte 0x021E7408
_021E6480: .4byte 0x021E7424
_021E6484: .4byte 0x021E7440
	thumb_func_end ov61_021E6350

	thumb_func_start ov61_021E6488
ov61_021E6488: @ 0x021E6488
	push {r3, r4, lr}
	sub sp, #0x2c
	ldr r3, _021E64FC @ =0x021E73C8
	adds r4, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x14
	stm r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, _021E6500 @ =0x0000DCC0
	str r0, [r2]
	movs r2, #0
	movs r0, #0xf
	str r2, [r4, #0x14]
	lsls r0, r0, #0xc
	str r0, [r4, #0x18]
	str r2, [r4, #0x1c]
	add r0, sp, #0xc
	strh r1, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	str r2, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	movs r1, #0x19
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r3, _021E6504 @ =0x000011A4
	adds r0, #0x14
	lsls r1, r1, #0xe
	add r2, sp, #0xc
	bl FUN_02023254
	ldr r1, [r4, #0x10]
	add r0, sp, #0x14
	bl FUN_02023514
	movs r0, #1
	lsls r0, r0, #0xe
	ldr r2, [r4, #0x10]
	lsls r1, r0, #6
	bl FUN_02023240
	movs r1, #0
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x24]
	str r1, [sp, #0x20]
	str r1, [sp, #0x28]
	ldr r1, [r4, #0x10]
	add r0, sp, #0x20
	bl FUN_02023204
	ldr r0, [r4, #0x10]
	bl FUN_0202313C
	add sp, #0x2c
	pop {r3, r4, pc}
	.align 2, 0
_021E64FC: .4byte 0x021E73C8
_021E6500: .4byte 0x0000DCC0
_021E6504: .4byte 0x000011A4
	thumb_func_end ov61_021E6488

	thumb_func_start ov61_021E6508
ov61_021E6508: @ 0x021E6508
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xed
	lsls r0, r0, #2
	adds r4, r5, r0
	adds r1, r4, #0
	ldr r2, [r5, #4]
	movs r0, #3
	adds r1, #0x8c
	bl FUN_02009F40
	adds r1, r4, #0
	adds r1, #0x88
	str r0, [r1]
	ldr r2, [r5, #4]
	movs r0, #3
	movs r1, #0
	bl FUN_0200A090
	movs r1, #0xed
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r2, [r5, #4]
	movs r0, #3
	movs r1, #1
	bl FUN_0200A090
	str r0, [r4, #4]
	ldr r2, [r5, #4]
	movs r0, #3
	movs r1, #2
	bl FUN_0200A090
	str r0, [r4, #8]
	movs r0, #3
	ldr r2, [r5, #4]
	adds r1, r0, #0
	bl FUN_0200A090
	str r0, [r4, #0xc]
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov61_021E6508

	thumb_func_start ov61_021E6564
ov61_021E6564: @ 0x021E6564
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, [r5, #4]
	movs r1, #3
	adds r0, #0x30
	bl ov61_021E6768
	adds r0, r5, #0
	movs r2, #0xe
	movs r3, #2
	adds r0, #0x70
	movs r1, #0
	lsls r2, r2, #0xc
	lsls r3, r3, #0x10
	bl ov61_021E6934
	movs r1, #1
	lsls r1, r1, #0xc
	adds r0, r5, #0
	adds r0, #0x70
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov61_021E693C
	adds r0, r5, #0
	ldr r2, [r5, #4]
	adds r0, #0x40
	movs r1, #0
	bl ov61_021E6768
	movs r1, #0
	adds r0, r5, #0
	adds r0, #0xe8
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov61_021E6934
	movs r1, #1
	lsls r1, r1, #0xc
	adds r0, r5, #0
	adds r0, #0xe8
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov61_021E693C
	adds r0, r5, #0
	ldr r2, [r5, #4]
	adds r0, #0x50
	movs r1, #1
	bl ov61_021E6768
	movs r1, #0
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov61_021E6934
	movs r0, #0x16
	movs r1, #1
	lsls r1, r1, #0xc
	lsls r0, r0, #4
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov61_021E693C
	adds r0, r5, #0
	ldr r2, [r5, #4]
	adds r0, #0x60
	movs r1, #2
	bl ov61_021E6768
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x70
	adds r1, #0x30
	bl ov61_021E67BC
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xe8
	adds r1, #0x40
	bl ov61_021E67BC
	movs r0, #0x16
	lsls r0, r0, #4
	adds r1, r5, #0
	adds r0, r5, r0
	adds r1, #0x50
	bl ov61_021E67BC
	adds r6, r5, #0
	adds r7, r5, #0
	movs r4, #0
	adds r6, #0x70
	adds r7, #0x60
_021E6628:
	adds r1, r4, #3
	movs r0, #0x78
	muls r0, r1, r0
	adds r0, r6, r0
	adds r1, r7, #0
	bl ov61_021E67BC
	adds r4, r4, #1
	cmp r4, #3
	blt _021E6628
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0xc8
	str r1, [r0]
	movs r1, #0x6e
	lsls r1, r1, #2
	movs r2, #1
	adds r0, r1, #0
	str r2, [r5, r1]
	subs r0, #0x78
	str r2, [r5, r0]
	adds r0, r1, #0
	adds r0, #0x78
	str r2, [r5, r0]
	adds r1, #0xf0
	movs r0, #0x32
	adds r3, r5, #0
	str r2, [r5, r1]
	lsls r0, r0, #4
	str r2, [r5, r0]
	adds r0, #0x48
	adds r0, r5, r0
	str r0, [sp]
	adds r2, r5, #0
	ldr r1, [r5, #4]
	movs r0, #7
	adds r2, #0x20
	adds r3, #0x50
	bl ov61_021E67D4
	movs r0, #0xd
	lsls r0, r0, #6
	adds r0, r5, r0
	str r0, [sp]
	adds r2, r5, #0
	adds r3, r5, #0
	ldr r1, [r5, #4]
	movs r0, #6
	adds r2, #0x20
	adds r3, #0x60
	bl ov61_021E67D4
	movs r0, #0xd2
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	adds r2, r5, #0
	adds r3, r5, #0
	ldr r1, [r5, #4]
	movs r0, #6
	adds r2, #0x20
	adds r3, #0x60
	bl ov61_021E67D4
	movs r0, #0x35
	lsls r0, r0, #4
	adds r0, r5, r0
	str r0, [sp]
	adds r2, r5, #0
	adds r3, r5, #0
	ldr r1, [r5, #4]
	movs r0, #6
	adds r2, #0x20
	adds r3, #0x60
	bl ov61_021E67D4
	movs r0, #0xd6
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	adds r2, r5, #0
	adds r3, r5, #0
	ldr r1, [r5, #4]
	movs r0, #5
	adds r2, #0x20
	adds r3, #0x60
	bl ov61_021E67D4
	movs r0, #0x36
	lsls r0, r0, #4
	adds r0, r5, r0
	str r0, [sp]
	adds r2, r5, #0
	adds r3, r5, #0
	ldr r1, [r5, #4]
	movs r0, #4
	adds r2, #0x20
	adds r3, #0x30
	bl ov61_021E67D4
	movs r0, #0x16
	movs r1, #0xda
	lsls r0, r0, #4
	lsls r1, r1, #2
	adds r0, r5, r0
	adds r1, r5, r1
	bl ov61_021E6814
	movs r0, #0x76
	movs r1, #0xd
	lsls r0, r0, #2
	lsls r1, r1, #6
	adds r0, r5, r0
	adds r1, r5, r1
	bl ov61_021E6814
	movs r1, #0x25
	lsls r1, r1, #4
	adds r0, r5, r1
	adds r1, #0xf8
	adds r1, r5, r1
	bl ov61_021E6814
	movs r1, #0xb2
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r1, #0x88
	adds r1, r5, r1
	bl ov61_021E6814
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov61_021E6564

	thumb_func_start ov61_021E6730
ov61_021E6730: @ 0x021E6730
	push {r4, r5, r6, lr}
	movs r1, #0xd
	lsls r1, r1, #6
	adds r6, r0, #0
	movs r4, #0
	adds r5, r0, r1
	adds r6, #0x20
_021E673E:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov61_021E6918
	adds r4, r4, #1
	adds r5, #8
	cmp r4, #6
	blt _021E673E
	pop {r4, r5, r6, pc}
	thumb_func_end ov61_021E6730

	thumb_func_start ov61_021E6750
ov61_021E6750: @ 0x021E6750
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r5, #0x30
_021E6758:
	adds r0, r5, #0
	bl ov61_021E6908
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #4
	blt _021E6758
	pop {r3, r4, r5, pc}
	thumb_func_end ov61_021E6750

	thumb_func_start ov61_021E6768
ov61_021E6768: @ 0x021E6768
	push {r3, r4, lr}
	sub sp, #4
	adds r3, r2, #0
	movs r2, #0
	adds r4, r0, #0
	str r2, [sp]
	movs r0, #0x52
	bl FUN_02007A44
	str r0, [r4]
	blx FUN_020C3B40
	str r0, [r4, #4]
	cmp r0, #0
	beq _021E67A6
	adds r2, r0, #0
	adds r2, #8
	beq _021E679A
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _021E679A
	ldrh r1, [r0, #0xe]
	adds r1, r2, r1
	adds r1, r1, #4
	b _021E679C
_021E679A:
	movs r1, #0
_021E679C:
	cmp r1, #0
	beq _021E67A6
	ldr r1, [r1]
	adds r0, r0, r1
	b _021E67A8
_021E67A6:
	movs r0, #0
_021E67A8:
	str r0, [r4, #8]
	ldr r0, [r4]
	blx FUN_020C3B50
	str r0, [r4, #0xc]
	bl FUN_0201F668
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov61_021E6768

	thumb_func_start ov61_021E67BC
ov61_021E67BC: @ 0x021E67BC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	bl FUN_0201F64C
	ldr r1, [r4, #8]
	adds r0, r5, #0
	blx FUN_020BE120
	pop {r3, r4, r5, pc}
	thumb_func_end ov61_021E67BC

	thumb_func_start ov61_021E67D4
ov61_021E67D4: @ 0x021E67D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	str r2, [sp, #4]
	movs r2, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x20]
	str r2, [sp]
	movs r0, #0x52
	adds r1, r6, #0
	adds r3, r7, #0
	bl FUN_02007A44
	str r0, [r4]
	movs r1, #0
	blx FUN_020C3B90
	adds r6, r0, #0
	ldr r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r1, r6, #0
	blx FUN_020C2B7C
	str r0, [r4, #4]
	ldr r2, [r5, #8]
	ldr r3, [r5, #0xc]
	adds r1, r6, #0
	blx FUN_020BE008
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov61_021E67D4

	thumb_func_start ov61_021E6814
ov61_021E6814: @ 0x021E6814
	ldr r3, _021E681C @ =FUN_020BE294
	ldr r1, [r1, #4]
	bx r3
	nop
_021E681C: .4byte FUN_020BE294
	thumb_func_end ov61_021E6814

	thumb_func_start ov61_021E6820
ov61_021E6820: @ 0x021E6820
	ldr r3, _021E6828 @ =FUN_020BE388
	ldr r1, [r1, #4]
	bx r3
	nop
_021E6828: .4byte FUN_020BE388
	thumb_func_end ov61_021E6820

	thumb_func_start ov61_021E682C
ov61_021E682C: @ 0x021E682C
	ldr r3, [r0, #4]
	movs r0, #1
	ldr r2, [r3]
	lsls r0, r0, #0xc
	adds r2, r2, r0
	ldr r0, [r3, #8]
	movs r1, #0
	ldrh r0, [r0, #4]
	lsls r0, r0, #0xc
	cmp r2, r0
	beq _021E6846
	str r2, [r3]
	b _021E6848
_021E6846:
	movs r1, #1
_021E6848:
	adds r0, r1, #0
	bx lr
	thumb_func_end ov61_021E682C

	thumb_func_start ov61_021E684C
ov61_021E684C: @ 0x021E684C
	push {r3, r4}
	ldr r4, [r0, #4]
	movs r2, #1
	ldr r3, [r4]
	lsls r2, r2, #0xc
	adds r2, r3, r2
	str r2, [r4]
	cmp r1, #2
	bne _021E686E
	ldr r4, [r0, #4]
	movs r2, #0xa
	ldr r3, [r4]
	lsls r2, r2, #0xe
	cmp r3, r2
	bne _021E686E
	lsls r2, r2, #1
	str r2, [r4]
_021E686E:
	ldr r3, [r0, #4]
	ldr r0, [r3, #8]
	ldr r2, [r3]
	ldrh r0, [r0, #4]
	lsls r0, r0, #0xc
	cmp r2, r0
	blt _021E688E
	cmp r1, #2
	bne _021E688A
	movs r0, #5
	lsls r0, r0, #0x10
	str r0, [r3]
	pop {r3, r4}
	bx lr
_021E688A:
	movs r0, #0
	str r0, [r3]
_021E688E:
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov61_021E684C

	thumb_func_start ov61_021E6894
ov61_021E6894: @ 0x021E6894
	push {r3, r4, r5, lr}
	movs r1, #0xe5
	adds r5, r0, #0
	lsls r1, r1, #2
	adds r0, r1, #0
	ldr r4, [r5, r1]
	subs r0, #0x54
	adds r2, r5, r0
	lsls r0, r4, #0x18
	adds r1, #0x18
	lsrs r0, r0, #0x15
	ldr r1, [r5, r1]
	adds r0, r2, r0
	bl ov61_021E684C
	adds r0, r4, #1
	movs r1, #3
	blx FUN_020F2BA4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x15
	adds r2, r5, r1
	movs r1, #0xd1
	lsls r1, r1, #2
	ldr r1, [r2, r1]
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #2
	movs r1, #3
	blx FUN_020F2BA4
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x15
	adds r1, r5, r0
	movs r0, #0xd1
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r2, #0
	str r2, [r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov61_021E6894

	thumb_func_start ov61_021E68E4
ov61_021E68E4: @ 0x021E68E4
	movs r2, #0xe5
	lsls r2, r2, #2
	ldr r1, [r0, r2]
	subs r2, #0x50
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x15
	adds r0, r0, r1
	ldr r0, [r0, r2]
	ldr r1, [r0]
	movs r0, #5
	lsls r0, r0, #0x10
	cmp r1, r0
	blt _021E6902
	movs r0, #1
	bx lr
_021E6902:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov61_021E68E4

	thumb_func_start ov61_021E6908
ov61_021E6908: @ 0x021E6908
	push {r3, lr}
	ldr r0, [r0]
	cmp r0, #0
	beq _021E6914
	bl FUN_0201AB0C
_021E6914:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov61_021E6908

	thumb_func_start ov61_021E6918
ov61_021E6918: @ 0x021E6918
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E6930
	adds r0, r1, #0
	ldr r1, [r4, #4]
	blx FUN_020C2BA0
	ldr r0, [r4]
	bl FUN_0201AB0C
_021E6930:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov61_021E6918

	thumb_func_start ov61_021E6934
ov61_021E6934: @ 0x021E6934
	str r1, [r0, #0x5c]
	str r2, [r0, #0x60]
	str r3, [r0, #0x64]
	bx lr
	thumb_func_end ov61_021E6934

	thumb_func_start ov61_021E693C
ov61_021E693C: @ 0x021E693C
	str r1, [r0, #0x68]
	str r2, [r0, #0x6c]
	str r3, [r0, #0x70]
	bx lr
	thumb_func_end ov61_021E693C

	thumb_func_start ov61_021E6944
ov61_021E6944: @ 0x021E6944
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	ldr r3, _021E6A20 @ =0x021E73B0
	adds r7, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x34
	str r2, [sp, #8]
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r5, #0
	str r0, [r2]
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	str r5, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r7, #0
	str r0, [sp, #0xc]
	adds r0, #0x70
	str r0, [sp, #0xc]
_021E696E:
	adds r0, r5, #0
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	asrs r0, r0, #4
	lsls r1, r0, #2
	ldr r0, _021E6A24 @ =0x021094DC
	ldr r3, _021E6A24 @ =0x021094DC
	adds r2, r0, r1
	ldrsh r1, [r3, r1]
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r0, sp, #0x10
	bl FUN_020CB0EC
	ldr r0, [sp, #8]
	add r1, sp, #0x10
	add r2, sp, #0x40
	blx FUN_020CB630
	movs r0, #0xc
	muls r0, r4, r0
	adds r6, r7, r0
	movs r0, #0x37
	lsls r0, r0, #4
	add r3, sp, #0x40
	adds r2, r6, r0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #0xdd
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	movs r0, #0xd
	lsls r0, r0, #0xc
	adds r1, r1, r0
	movs r0, #0xdd
	lsls r0, r0, #2
	str r1, [r6, r0]
	adds r1, r4, #3
	adds r6, r1, #0
	movs r0, #0x78
	muls r6, r0, r6
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x40]
	ldr r2, [sp, #0x44]
	ldr r3, [sp, #0x48]
	adds r0, r0, r6
	bl ov61_021E6934
	ldr r0, [sp, #0xc]
	movs r1, #1
	lsls r1, r1, #0xc
	adds r0, r0, r6
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov61_021E693C
	movs r0, #0x78
	muls r0, r4, r0
	movs r1, #0x93
	ldr r2, [sp]
	adds r0, r7, r0
	lsls r1, r1, #2
	strh r2, [r0, r1]
	movs r2, #0
	adds r1, r1, #2
	strh r2, [r0, r1]
	adds r0, r4, #1
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	movs r0, #1
	lsls r0, r0, #0x10
	adds r5, r5, r0
	ldr r0, [sp, #4]
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #3
	blt _021E696E
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_021E6A20: .4byte 0x021E73B0
_021E6A24: .4byte 0x021094DC
	thumb_func_end ov61_021E6944

	thumb_func_start ov61_021E6A28
ov61_021E6A28: @ 0x021E6A28
	push {r4, lr}
	sub sp, #0x30
	add r1, sp, #0
	adds r4, r0, #0
	bl ov61_021E6A48
	movs r0, #0x19
	add r1, sp, #0
	movs r2, #0xc
	blx FUN_020C2528
	adds r0, r4, #0
	blx FUN_020BFCC8
	add sp, #0x30
	pop {r4, pc}
	thumb_func_end ov61_021E6A28

	thumb_func_start ov61_021E6A48
ov61_021E6A48: @ 0x021E6A48
	push {r4, r5, lr}
	sub sp, #0x94
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	blx FUN_020CB6AC
	ldr r0, [r5, #0x64]
	adds r1, r4, #0
	str r0, [sp]
	ldr r2, [r5, #0x5c]
	ldr r3, [r5, #0x60]
	adds r0, r4, #0
	blx FUN_020CB708
	add r0, sp, #0x64
	blx FUN_020CB6AC
	adds r0, r5, #0
	adds r0, #0x76
	ldrh r0, [r0]
	ldr r3, _021E6ADC @ =0x021094DC
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #4
	bl FUN_020CB800
	add r1, sp, #0x64
	add r0, sp, #4
	adds r2, r1, #0
	blx FUN_020CBBC8
	adds r0, r5, #0
	adds r0, #0x74
	ldrh r0, [r0]
	ldr r3, _021E6ADC @ =0x021094DC
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #4
	bl FUN_020CB820
	add r1, sp, #0x64
	add r0, sp, #4
	adds r2, r1, #0
	blx FUN_020CBBC8
	ldr r1, [r5, #0x68]
	ldr r2, [r5, #0x6c]
	ldr r3, [r5, #0x70]
	add r0, sp, #0x34
	bl FUN_020CB7B4
	add r0, sp, #0x64
	adds r1, r4, #0
	adds r2, r4, #0
	blx FUN_020CBBC8
	add r0, sp, #0x34
	adds r1, r4, #0
	adds r2, r4, #0
	blx FUN_020CBBC8
	add sp, #0x94
	pop {r4, r5, pc}
	.align 2, 0
_021E6ADC: .4byte 0x021094DC
	thumb_func_end ov61_021E6A48

	thumb_func_start ov61_021E6AE0
ov61_021E6AE0: @ 0x021E6AE0
	push {r4, lr}
	movs r3, #0xe6
	lsls r3, r3, #2
	ldrsh r4, [r0, r3]
	movs r2, #0
	adds r4, r4, r1
	strh r4, [r0, r3]
	cmp r1, #0
	ldrsh r4, [r0, r3]
	blt _021E6B0A
	ldr r1, _021E6B24 @ =0x00005555
	cmp r4, r1
	blt _021E6B1E
	strh r2, [r0, r3]
	adds r1, r3, #2
	strh r2, [r0, r1]
	movs r1, #1
	bl ov61_021E6B2C
	movs r2, #1
	b _021E6B1E
_021E6B0A:
	ldr r1, _021E6B28 @ =0xFFFFAAAB
	cmp r4, r1
	bgt _021E6B1E
	strh r2, [r0, r3]
	adds r1, r3, #2
	strh r2, [r0, r1]
	movs r1, #2
	bl ov61_021E6B2C
	movs r2, #1
_021E6B1E:
	adds r0, r2, #0
	pop {r4, pc}
	nop
_021E6B24: .4byte 0x00005555
_021E6B28: .4byte 0xFFFFAAAB
	thumb_func_end ov61_021E6AE0

	thumb_func_start ov61_021E6B2C
ov61_021E6B2C: @ 0x021E6B2C
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #2
	bne _021E6B4A
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	adds r0, r0, #1
	blx FUN_020F2BA4
	movs r0, #0xe5
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _021E6B64
_021E6B4A:
	cmp r1, #1
	bne _021E6B64
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	subs r0, r0, #1
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	bpl _021E6B5E
	movs r1, #2
_021E6B5E:
	movs r0, #0xe5
	lsls r0, r0, #2
	str r1, [r4, r0]
_021E6B64:
	adds r0, r4, #0
	bl ov61_021E6944
	pop {r4, pc}
	thumb_func_end ov61_021E6B2C

	thumb_func_start ov61_021E6B6C
ov61_021E6B6C: @ 0x021E6B6C
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_0201D39C
	movs r1, #0xe7
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_0201D39C
	movs r1, #0x3a
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r2, #4
	str r2, [sp, #8]
	movs r3, #2
	str r3, [sp, #0xc]
	movs r0, #0x1f
	str r0, [sp, #0x10]
	subs r1, r1, #4
	ldr r0, [r4, #8]
	ldr r1, [r4, r1]
	bl FUN_0201D40C
	movs r0, #0x13
	str r0, [sp]
	movs r1, #0x1d
	str r1, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x1f
	str r0, [sp, #0x10]
	lsls r1, r1, #5
	movs r2, #1
	ldr r0, [r4, #8]
	ldr r1, [r4, r1]
	adds r3, r2, #0
	bl FUN_0201D40C
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0x3a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0xe9
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	movs r1, #4
	lsls r2, r1, #7
	str r0, [sp]
	ldr r0, [r4, #4]
	movs r3, #0
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	bl FUN_0200E644
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r4, #4]
	movs r1, #8
	str r0, [sp, #4]
	movs r0, #0x52
	movs r2, #4
	movs r3, #0x40
	bl FUN_02007938
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r4, #4]
	movs r1, #8
	str r0, [sp, #4]
	movs r0, #0x52
	movs r2, #0
	movs r3, #0x40
	bl FUN_02007938
	movs r0, #0xe7
	lsls r0, r0, #2
	movs r1, #0
	movs r2, #2
	ldr r0, [r4, r0]
	lsls r2, r2, #8
	adds r3, r1, #0
	bl FUN_0200E998
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov61_021E6B6C

	thumb_func_start ov61_021E6C3C
ov61_021E6C3C: @ 0x021E6C3C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r4, r1, #0
	str r0, [sp, #8]
	movs r0, #0x52
	movs r1, #0xd
	adds r2, r5, #0
	movs r3, #2
	str r4, [sp, #0xc]
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x52
	movs r1, #0xa
	adds r2, r5, #0
	movs r3, #5
	str r4, [sp, #0xc]
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x52
	movs r1, #0x10
	adds r2, r5, #0
	movs r3, #6
	str r4, [sp, #0xc]
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x52
	movs r1, #0xe
	adds r2, r5, #0
	movs r3, #2
	str r4, [sp, #0xc]
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x52
	movs r1, #0xb
	adds r2, r5, #0
	movs r3, #5
	str r4, [sp, #0xc]
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x52
	movs r1, #0x11
	adds r2, r5, #0
	movs r3, #6
	str r4, [sp, #0xc]
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x52
	movs r1, #0xc
	movs r2, #0
	movs r3, #0x60
	str r4, [sp, #4]
	bl FUN_02007938
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x52
	movs r1, #9
	movs r2, #4
	movs r3, #0x60
	str r4, [sp, #4]
	bl FUN_02007938
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x52
	movs r1, #0xf
	movs r2, #4
	movs r3, #0x80
	str r4, [sp, #4]
	bl FUN_02007938
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #3
	movs r2, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201CA4C
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #3
	movs r2, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0201CA4C
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #4
	movs r2, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #6
	adds r3, r2, #0
	bl FUN_0201CA4C
	adds r0, r5, #0
	movs r1, #2
	bl FUN_0201BF7C
	adds r0, r5, #0
	movs r1, #5
	bl FUN_0201BF7C
	adds r0, r5, #0
	movs r1, #6
	bl FUN_0201BF7C
	movs r0, #0xb
	str r0, [sp]
	ldr r0, _021E6D74 @ =0x04001050
	movs r1, #4
	movs r2, #0x22
	movs r3, #5
	blx FUN_020CF15C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E6D74: .4byte 0x04001050
	thumb_func_end ov61_021E6C3C

	thumb_func_start ov61_021E6D78
ov61_021E6D78: @ 0x021E6D78
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r4, [sp, #0x34]
	adds r5, r0, #0
	ldr r0, [r4]
	adds r7, r1, #0
	adds r6, r2, #0
	str r3, [sp, #0x10]
	cmp r0, #0
	beq _021E6D90
	bl GF_AssertFail
_021E6D90:
	ldr r2, [sp, #0x10]
	movs r0, #0
	movs r1, #0x1b
	adds r3, r7, #0
	bl FUN_0200BAF8
	adds r7, r0, #0
	bne _021E6DA4
	bl GF_AssertFail
_021E6DA4:
	ldr r1, [sp, #0x28]
	adds r0, r7, #0
	bl FUN_0200BBA0
	ldr r1, [sp, #0x2c]
	str r0, [r4]
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl FUN_0201D978
	movs r3, #0
	ldr r0, [sp, #0x30]
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	movs r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r4]
	adds r0, r5, #0
	bl FUN_020200FC
	adds r4, r0, #0
	cmp r6, #0
	beq _021E6DE8
	movs r1, #0
	movs r2, #2
	adds r0, r5, #0
	lsls r2, r2, #8
	adds r3, r1, #0
	bl FUN_0200E998
	b _021E6DEE
_021E6DE8:
	adds r0, r5, #0
	bl FUN_0201D578
_021E6DEE:
	adds r0, r7, #0
	bl FUN_0200BB44
	adds r0, r4, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov61_021E6D78

	thumb_func_start ov61_021E6DFC
ov61_021E6DFC: @ 0x021E6DFC
	push {lr}
	sub sp, #0x14
	movs r2, #0
	adds r3, r0, #0
	str r2, [sp, #0x10]
	ldr r0, _021E6E2C @ =0x00010200
	str r1, [sp]
	str r0, [sp, #4]
	str r2, [sp, #8]
	add r0, sp, #0x10
	str r0, [sp, #0xc]
	movs r0, #0x3a
	lsls r0, r0, #4
	ldr r0, [r3, r0]
	ldr r1, [r3, #4]
	movs r3, #0xbe
	bl ov61_021E6D78
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	add sp, #0x14
	pop {pc}
	nop
_021E6E2C: .4byte 0x00010200
	thumb_func_end ov61_021E6DFC

	thumb_func_start ov61_021E6E30
ov61_021E6E30: @ 0x021E6E30
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0201D520
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov61_021E6E30

	thumb_func_start ov61_021E6E40
ov61_021E6E40: @ 0x021E6E40
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r4, #0
	bl FUN_0202534C
	cmp r0, #0
	bne _021E6EB6
	ldr r0, _021E6F74 @ =0x021D110C
	movs r1, #1
	ldr r2, [r0, #0x48]
	adds r0, r2, #0
	tst r0, r1
	beq _021E6E78
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r2, [r5, r0]
	cmp r2, #2
	bne _021E6E6A
	movs r4, #6
	b _021E6F62
_021E6E6A:
	cmp r2, #1
	bne _021E6E72
	movs r4, #7
	b _021E6F62
_021E6E72:
	str r1, [r5, r0]
	movs r4, #5
	b _021E6F62
_021E6E78:
	movs r0, #2
	adds r3, r2, #0
	tst r3, r0
	beq _021E6E8E
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #2
	bne _021E6F62
	movs r4, #8
	b _021E6F62
_021E6E8E:
	movs r3, #0x20
	tst r3, r2
	beq _021E6EA2
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #2
	beq _021E6F62
	adds r4, r1, #0
	b _021E6F62
_021E6EA2:
	movs r1, #0x10
	tst r1, r2
	beq _021E6F62
	movs r1, #0xea
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	cmp r1, #2
	beq _021E6F62
	adds r4, r0, #0
	b _021E6F62
_021E6EB6:
	ldr r0, _021E6F74 @ =0x021D110C
	ldr r0, [r0, #0x44]
	cmp r0, #0
	bne _021E6F62
	bl FUN_02025358
	cmp r0, #0
	beq _021E6F62
	ldr r1, _021E6F78 @ =0x021D114C
	add r2, sp, #0xc
	ldrh r0, [r1, #0x20]
	ldrh r1, [r1, #0x22]
	add r3, sp, #0
	blx FUN_020C28F8
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #2
	bne _021E6EE2
	movs r3, #6
	b _021E6EE4
_021E6EE2:
	movs r3, #0xd
_021E6EE4:
	movs r0, #0x37
	lsls r0, r0, #4
	lsls r3, r3, #0xc
	adds r0, r5, r0
	add r1, sp, #0xc
	add r2, sp, #0
	bl ov61_021E6F98
	cmp r0, #3
	beq _021E6F56
	movs r2, #0xea
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	cmp r1, #2
	bne _021E6F12
	subs r2, #0x14
	ldr r1, [r5, r2]
	cmp r0, r1
	bne _021E6F0E
	movs r4, #6
	b _021E6F62
_021E6F0E:
	movs r4, #8
	b _021E6F62
_021E6F12:
	cmp r1, #1
	bne _021E6F34
	adds r1, r2, #0
	subs r1, #0x14
	ldr r1, [r5, r1]
	cmp r0, r1
	bne _021E6F24
	movs r4, #7
	b _021E6F62
_021E6F24:
	adds r2, r2, #4
	lsls r1, r1, #0x18
	ldr r2, [r5, r2]
	lsrs r1, r1, #0x18
	bl ov61_021E6F80
	adds r4, r0, #0
	b _021E6F62
_021E6F34:
	adds r1, r2, #0
	subs r1, #0x14
	ldr r1, [r5, r1]
	cmp r0, r1
	bne _021E6F46
	movs r0, #1
	str r0, [r5, r2]
	movs r4, #5
	b _021E6F62
_021E6F46:
	adds r2, r2, #4
	lsls r1, r1, #0x18
	ldr r2, [r5, r2]
	lsrs r1, r1, #0x18
	bl ov61_021E6F80
	adds r4, r0, #0
	b _021E6F62
_021E6F56:
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #2
	bne _021E6F62
	movs r4, #8
_021E6F62:
	cmp r4, #6
	bne _021E6F6C
	ldr r0, _021E6F7C @ =0x000005EA
	bl FUN_0200604C
_021E6F6C:
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_021E6F74: .4byte 0x021D110C
_021E6F78: .4byte 0x021D114C
_021E6F7C: .4byte 0x000005EA
	thumb_func_end ov61_021E6E40

	thumb_func_start ov61_021E6F80
ov61_021E6F80: @ 0x021E6F80
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #1
	movs r1, #3
	blx FUN_020F2998
	cmp r1, r4
	bne _021E6F94
	movs r0, #1
	pop {r4, pc}
_021E6F94:
	movs r0, #2
	pop {r4, pc}
	thumb_func_end ov61_021E6F80

	thumb_func_start ov61_021E6F98
ov61_021E6F98: @ 0x021E6F98
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	str r2, [sp]
	adds r6, r3, #0
	movs r4, #0
_021E6FA4:
	movs r0, #0xc
	muls r0, r4, r0
	ldr r2, [sp]
	adds r0, r5, r0
	adds r1, r7, #0
	bl FUN_02020B9C
	cmp r0, r6
	ble _021E6FC0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _021E6FA4
_021E6FC0:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov61_021E6F98

	thumb_func_start ov61_021E6FC4
ov61_021E6FC4: @ 0x021E6FC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r0, #0
	ldr r1, [r6, #4]
	movs r0, #0x5d
	bl FUN_02007688
	str r0, [sp, #0x18]
	movs r0, #0xed
	lsls r0, r0, #2
	adds r5, r6, r0
	adds r0, r5, #0
	str r0, [sp, #0x24]
	adds r0, #0x78
	movs r4, #0
	str r5, [sp, #0x14]
	str r6, [sp, #0x10]
	adds r7, r5, #0
	str r0, [sp, #0x24]
_021E6FEA:
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r2, #9
	movs r3, #0
	bl FUN_0200A3C8
	ldr r1, [sp, #0x14]
	movs r2, #6
	str r0, [r1, #0x18]
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [r5, #4]
	movs r3, #0
	bl FUN_0200A480
	ldr r1, [sp, #0x14]
	movs r2, #0xa
	str r0, [r1, #0x1c]
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	movs r3, #0
	bl FUN_0200A540
	ldr r1, [sp, #0x14]
	movs r2, #0x10
	str r0, [r1, #0x20]
	str r4, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [r5, #0xc]
	movs r3, #0
	bl FUN_0200A540
	ldr r1, [sp, #0x14]
	movs r2, #0
	str r0, [r1, #0x24]
	ldr r1, [sp, #0x10]
	ldr r0, _021E7104 @ =0x00000578
	ldr r0, [r1, r0]
	movs r1, #5
	bl FUN_0206E540
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	ldr r0, _021E7104 @ =0x00000578
	movs r2, #0
	ldr r0, [r1, r0]
	movs r1, #0x6f
	bl FUN_0206E540
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	ldr r0, _021E7104 @ =0x00000578
	ldr r0, [r1, r0]
	bl FUN_0207003C
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	str r0, [sp, #4]
	str r0, [sp, #8]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x18
	ldr r0, [sp, #0x24]
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x18
	movs r3, #2
	bl FUN_020701E4
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x78
	adds r1, #0x7a
	ldrh r0, [r0]
	ldrh r1, [r1]
	ldr r2, [r6, #4]
	bl FUN_0201442C
	str r0, [r7, #0x60]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x78
	adds r1, #0x7c
	ldrh r0, [r0]
	ldrh r1, [r1]
	ldr r2, [r6, #4]
	bl FUN_02014450
	str r0, [r7, #0x6c]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, [r7, #0x60]
	ldr r3, [r7, #0x6c]
	bl ov61_021E7108
	lsls r1, r4, #0x18
	ldr r2, [r6, #4]
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov61_021E7188
	ldr r0, [sp, #0x14]
	adds r4, r4, #1
	adds r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r7, r7, #4
	adds r0, r0, #4
	str r0, [sp, #0x10]
	cmp r4, #3
	bge _021E70F8
	b _021E6FEA
_021E70F8:
	ldr r0, [sp, #0x18]
	bl FUN_0200770C
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7104: .4byte 0x00000578
	thumb_func_end ov61_021E6FC4

	thumb_func_start ov61_021E7108
ov61_021E7108: @ 0x021E7108
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r1, #0
	add r1, sp, #0x10
	ldrb r1, [r1, #0x10]
	adds r4, r2, #0
	adds r6, r3, #0
	str r1, [sp]
	bl FUN_0200A7BC
	adds r5, r0, #0
	ldr r1, [sp]
	adds r0, r7, #0
	bl FUN_0200A7BC
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_0200ADA4
	adds r0, r7, #0
	bl FUN_0200B00C
	adds r0, r5, #0
	bl FUN_0200AF00
	adds r5, r0, #0
	adds r0, r7, #0
	adds r1, r5, #0
	bl FUN_0200B0F8
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #2
	blx FUN_020B802C
	str r0, [sp, #4]
	adds r0, r7, #0
	movs r1, #2
	blx FUN_020B8078
	movs r1, #0x32
	adds r5, r0, #0
	adds r0, r4, #0
	lsls r1, r1, #6
	blx FUN_020D2894
	movs r2, #0x32
	ldr r1, [sp, #4]
	adds r0, r4, #0
	lsls r2, r2, #6
	blx FUN_020CFECC
	adds r0, r6, #0
	movs r1, #0x20
	blx FUN_020D2894
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0x20
	blx FUN_020CFD70
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov61_021E7108

	thumb_func_start ov61_021E7188
ov61_021E7188: @ 0x021E7188
	push {r4, r5, r6, lr}
	sub sp, #0x80
	adds r4, r1, #0
	adds r5, r0, #0
	movs r0, #0
	str r4, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r6, r2, #0
	ldr r2, [r5]
	adds r3, r4, #0
	str r2, [sp, #0x14]
	ldr r2, [r5, #4]
	str r2, [sp, #0x18]
	ldr r2, [r5, #8]
	str r2, [sp, #0x1c]
	ldr r2, [r5, #0xc]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x5c
	adds r2, r4, #0
	bl FUN_02009D48
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #0
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r1, [r0, #0x20]
	movs r0, #2
	str r0, [sp, #0x54]
	lsls r0, r0, #0x12
	str r0, [sp, #0x34]
	movs r0, #0x12
	lsls r0, r0, #0x10
	str r0, [sp, #0x38]
	movs r0, #0x6d
	lsls r0, r0, #2
	adds r5, r5, r0
	str r1, [sp, #0x50]
	str r6, [sp, #0x58]
	lsls r4, r4, #2
	add r0, sp, #0x2c
	bl FUN_02024624
	str r0, [r5, r4]
	ldr r0, [r5, r4]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r5, r4]
	movs r1, #0
	bl FUN_020248F0
	ldr r0, [r5, r4]
	movs r1, #0
	bl FUN_02024830
	add sp, #0x80
	pop {r4, r5, r6, pc}
	thumb_func_end ov61_021E7188

	thumb_func_start ov61_021E7220
ov61_021E7220: @ 0x021E7220
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xed
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov61_021E7248
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r4, r0
	ldr r0, _021E7244 @ =0x00000568
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	pop {r4, pc}
	.align 2, 0
_021E7244: .4byte 0x00000568
	thumb_func_end ov61_021E7220

	thumb_func_start ov61_021E7248
ov61_021E7248: @ 0x021E7248
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	movs r6, #0x6d
	adds r5, r0, #0
	adds r7, r4, #0
	lsls r6, r6, #2
_021E7254:
	ldr r0, [r5, r6]
	adds r1, r7, #0
	bl FUN_02024830
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _021E7254
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov61_021E7248

	thumb_func_start ov61_021E7268
ov61_021E7268: @ 0x021E7268
	push {r0, r1, r2, r3}
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	movs r2, #0xe5
	lsls r2, r2, #2
	adds r4, r0, #0
	adds r0, r2, #0
	adds r0, #0x13
	ldrb r0, [r4, r0]
	ldr r5, [r4, r2]
	movs r3, #8
	adds r1, r0, #1
	adds r0, r2, #0
	adds r0, #0x13
	strb r1, [r4, r0]
	adds r2, #0x13
	ldrb r2, [r4, r2]
	add r0, sp, #0x54
	add r1, sp, #0x58
	bl ov61_021E7348
	add r2, sp, #0xc
	ldr r3, _021E7330 @ =0x021E73D4
	adds r6, r0, #0
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021E7334 @ =0x021E738C
	str r0, [r2]
	add r2, sp, #0
	ldm r3!, {r0, r1}
	mov ip, r2
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [sp, #4]
	ldr r0, _021E7338 @ =0x0000D73F
	adds r2, r7, #0
	adds r0, r1, r0
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, ip
	blx FUN_020CCDAC
	asrs r0, r6, #4
	lsls r3, r0, #1
	lsls r1, r3, #1
	ldr r2, _021E733C @ =0x021094DC
	adds r3, r3, #1
	lsls r3, r3, #1
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	add r0, sp, #0x18
	bl FUN_020CB0D0
	adds r0, r7, #0
	add r1, sp, #0x18
	adds r2, r0, #0
	blx FUN_020CB630
	adds r0, r7, #0
	add r1, sp, #0
	adds r2, r0, #0
	blx FUN_020CCD78
	adds r2, r4, #0
	adds r1, r5, #3
	movs r0, #0x78
	muls r0, r1, r0
	adds r2, #0x70
	adds r0, r2, r0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl ov61_021E6934
	movs r0, #0x78
	muls r0, r5, r0
	adds r1, r4, r0
	ldr r0, _021E7340 @ =0x0000024E
	strh r6, [r1, r0]
	ldr r0, _021E7344 @ =0x000003A7
	ldrb r1, [r4, r0]
	cmp r1, #8
	blo _021E7324
	movs r1, #0
	strb r1, [r4, r0]
	add sp, #0x3c
	movs r0, #1
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
_021E7324:
	movs r0, #0
	add sp, #0x3c
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.align 2, 0
_021E7330: .4byte 0x021E73D4
_021E7334: .4byte 0x021E738C
_021E7338: .4byte 0x0000D73F
_021E733C: .4byte 0x021094DC
_021E7340: .4byte 0x0000024E
_021E7344: .4byte 0x000003A7
	thumb_func_end ov61_021E7268

	thumb_func_start ov61_021E7348
ov61_021E7348: @ 0x021E7348
	push {r4, lr}
	ldr r4, [r0]
	ldr r0, [r1]
	cmp r0, r4
	blt _021E7364
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	muls r0, r2, r0
	adds r1, r3, #0
	blx FUN_020F2998
	b _021E7376
_021E7364:
	subs r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	muls r0, r2, r0
	adds r1, r3, #0
	blx FUN_020F2998
	rsbs r0, r0, #0
_021E7376:
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov61_021E7348

	.rodata

_021E7380:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x98, 0x00, 0x00, 0x00, 0x9B, 0x00, 0x00, 0x00
	.byte 0x9E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x05, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x03, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	@ 0x021E74BC
