
	thumb_func_start ov51_021E5AC0
ov51_021E5AC0: @ 0x021E5AC0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A120
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5D44 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5D48 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	movs r2, #5
	movs r0, #3
	movs r1, #0x19
	lsls r2, r2, #0x10
	bl FUN_0201A910
	ldr r1, _021E5D4C @ =0x00003444
	adds r0, r5, #0
	movs r2, #0x19
	bl FUN_02007280
	ldr r2, _021E5D4C @ =0x00003444
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r0, r5, #0
	bl FUN_020072A4
	adds r1, r4, #0
	adds r1, #0xe4
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe8
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r1, [r0]
	ldr r0, _021E5D50 @ =0x0000066C
	ldr r0, [r1, r0]
	bl FUN_020183F0
	ldr r1, _021E5D54 @ =0x0000310C
	str r0, [r4, r1]
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r1, [r0]
	movs r0, #0x67
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl FUN_02028EA8
	adds r5, r0, #0
	bl FUN_0202AD3C
	ldr r1, _021E5D58 @ =0x0000343E
	strb r0, [r4, r1]
	adds r0, r5, #0
	bl FUN_0202ADCC
	ldr r1, _021E5D5C @ =0x0000343D
	strb r0, [r4, r1]
	bl FUN_02037474
	cmp r0, #1
	bne _021E5B96
	ldr r1, _021E5D60 @ =0x0000343A
	movs r0, #2
	ldrb r2, [r4, r1]
	orrs r0, r2
	strb r0, [r4, r1]
_021E5B96:
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	ldr r1, _021E5D60 @ =0x0000343A
	adds r0, #0x33
	ldrb r0, [r0]
	cmp r0, #0
	beq _021E5BB4
	ldrb r2, [r4, r1]
	movs r0, #1
	bics r2, r0
	movs r0, #1
	orrs r0, r2
	strb r0, [r4, r1]
	b _021E5BBC
_021E5BB4:
	ldrb r2, [r4, r1]
	movs r0, #1
	bics r2, r0
	strb r2, [r4, r1]
_021E5BBC:
	ldr r2, _021E5D60 @ =0x0000343A
	ldrb r0, [r4, r2]
	lsls r1, r0, #0x1e
	lsrs r1, r1, #0x1f
	cmp r1, #1
	bne _021E5BDC
	adds r1, r4, #0
	adds r1, #0xe4
	ldr r3, [r1]
	ldr r1, _021E5D64 @ =0x00000678
	ldr r1, [r3, r1]
	cmp r1, #0
	bne _021E5BDC
	movs r1, #1
	bics r0, r1
	strb r0, [r4, r2]
_021E5BDC:
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	ldrb r0, [r0]
	adds r0, #0xf9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _021E5C1C
	ldr r7, _021E5D68 @ =0x00003424
	movs r3, #1
	movs r2, #0
	adds r0, r2, #0
	adds r1, r3, #0
	adds r5, r7, #0
_021E5BFA:
	adds r6, r4, #0
	adds r6, #0xe8
	ldr r6, [r6]
	ldrh r6, [r6, #6]
	tst r6, r3
	beq _021E5C0C
	adds r6, r4, r2
	strb r1, [r6, r5]
	b _021E5C10
_021E5C0C:
	adds r6, r4, r2
	strb r0, [r6, r7]
_021E5C10:
	lsls r3, r3, #0x11
	adds r2, r2, #1
	lsrs r3, r3, #0x10
	cmp r2, #0x10
	blt _021E5BFA
	b _021E5C2C
_021E5C1C:
	movs r3, #0
	ldr r0, _021E5D68 @ =0x00003424
	adds r2, r3, #0
_021E5C22:
	adds r1, r4, r3
	adds r3, r3, #1
	strb r2, [r1, r0]
	cmp r3, #0x10
	blt _021E5C22
_021E5C2C:
	movs r0, #0x19
	bl FUN_0201AC88
	str r0, [r4]
	adds r0, r4, #0
	bl ov51_021E5F64
	bl ov51_021E60D4
	ldr r0, [r4]
	bl ov51_021E6238
	adds r0, r4, #0
	bl ov51_021E6354
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	movs r0, #1
	bl FUN_02002B8C
	movs r0, #1
	bl FUN_02002B34
	movs r1, #0
	movs r0, #0x38
	adds r2, r1, #0
	bl FUN_02004EC4
	ldr r0, _021E5D6C @ =0x000033A0
	adds r0, r4, r0
	bl ov51_021E7DA4
	ldr r0, _021E5D70 @ =0x00000694
	bl FUN_0200604C
	ldr r0, _021E5D74 @ =0x0000311C
	adds r0, r4, r0
	bl ov51_021E78F8
	ldr r2, _021E5D68 @ =0x00003424
	ldr r0, _021E5D74 @ =0x0000311C
	adds r1, r4, r2
	adds r2, #0x16
	ldrb r2, [r4, r2]
	adds r0, r4, r0
	lsls r2, r2, #0x1f
	lsrs r2, r2, #0x1f
	bl ov51_021E7AF4
	ldr r0, _021E5D74 @ =0x0000311C
	adds r0, r4, r0
	bl ov51_021E7BD0
	adds r0, r4, #0
	bl ov51_021E6E60
	ldr r2, _021E5D78 @ =0x000033CC
	adds r0, r4, #0
	ldr r2, [r4, r2]
	adds r0, #0x54
	movs r1, #1
	bl ov51_021E7664
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r1, [r0]
	ldr r0, _021E5D7C @ =0x00000674
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021E5CC2
	movs r1, #1
	b _021E5CC4
_021E5CC2:
	movs r1, #0
_021E5CC4:
	ldr r0, _021E5D80 @ =0x000030F4
	str r1, [r4, r0]
	adds r1, r4, #0
	adds r1, #0xe4
	ldr r2, [r1]
	movs r0, #0
	ldr r1, _021E5D7C @ =0x00000674
	subs r3, r0, #1
	str r0, [r2, r1]
	ldr r1, _021E5D84 @ =0x00003434
	ldr r2, _021E5D88 @ =0x00003108
	strb r0, [r4, r1]
	str r3, [r4, r2]
	adds r2, r1, #0
	subs r2, #0x98
	str r0, [r4, r2]
	adds r1, r1, #4
	strb r0, [r4, r1]
	bl ov51_021E6C00
	adds r0, r4, #0
	bl ov51_021E6734
	adds r0, r4, #0
	movs r1, #0
	bl ov51_021E76A4
	ldr r0, _021E5D8C @ =ov51_021E6B88
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_0203A964
	movs r0, #1
	movs r1, #0x2a
	bl FUN_02005B50
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x19
	movs r1, #3
	str r0, [sp, #8]
	movs r0, #2
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	adds r4, #0xe8
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #7
	beq _021E5D3C
	cmp r0, #8
	beq _021E5D3C
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
_021E5D3C:
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E5D44: .4byte 0xFFFFE0FF
_021E5D48: .4byte 0x04001000
_021E5D4C: .4byte 0x00003444
_021E5D50: .4byte 0x0000066C
_021E5D54: .4byte 0x0000310C
_021E5D58: .4byte 0x0000343E
_021E5D5C: .4byte 0x0000343D
_021E5D60: .4byte 0x0000343A
_021E5D64: .4byte 0x00000678
_021E5D68: .4byte 0x00003424
_021E5D6C: .4byte 0x000033A0
_021E5D70: .4byte 0x00000694
_021E5D74: .4byte 0x0000311C
_021E5D78: .4byte 0x000033CC
_021E5D7C: .4byte 0x00000674
_021E5D80: .4byte 0x000030F4
_021E5D84: .4byte 0x00003434
_021E5D88: .4byte 0x00003108
_021E5D8C: .4byte ov51_021E6B88
	thumb_func_end ov51_021E5AC0

	thumb_func_start ov51_021E5D90
ov51_021E5D90: @ 0x021E5D90
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #5
	bhi _021E5E96
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5DAE: @ jump table
	.2byte _021E5DBA - _021E5DAE - 2 @ case 0
	.2byte _021E5DC8 - _021E5DAE - 2 @ case 1
	.2byte _021E5E3A - _021E5DAE - 2 @ case 2
	.2byte _021E5E48 - _021E5DAE - 2 @ case 3
	.2byte _021E5E56 - _021E5DAE - 2 @ case 4
	.2byte _021E5E70 - _021E5DAE - 2 @ case 5
_021E5DBA:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5E96
	movs r0, #1
	str r0, [r5]
	b _021E5E96
_021E5DC8:
	bl ov51_021E6B44
	cmp r0, #3
	bne _021E5DDC
	ldr r0, _021E5EB8 @ =0x00003436
	movs r1, #0
	strb r1, [r4, r0]
	movs r0, #3
	str r0, [r5]
	b _021E5E26
_021E5DDC:
	cmp r0, #4
	bne _021E5DFA
	ldr r0, _021E5EBC @ =0x0000311C
	movs r1, #1
	adds r0, r4, r0
	movs r2, #3
	adds r3, r1, #0
	bl ov51_021E7D44
	ldr r0, _021E5EB8 @ =0x00003436
	movs r1, #0
	strb r1, [r4, r0]
	movs r0, #4
	str r0, [r5]
	b _021E5E26
_021E5DFA:
	cmp r0, #5
	bne _021E5E26
	ldr r0, _021E5EBC @ =0x0000311C
	movs r2, #1
	adds r0, r4, r0
	movs r1, #0
	adds r3, r2, #0
	bl ov51_021E7D44
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #0x19
	str r1, [sp, #8]
	movs r1, #4
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	movs r0, #2
	str r0, [r5]
_021E5E26:
	adds r1, r4, #0
	adds r1, #0xe8
	ldr r1, [r1]
	adds r0, r4, #0
	ldrb r1, [r1, #4]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	bl ov51_021E6DA8
	b _021E5E96
_021E5E3A:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5E96
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_021E5E48:
	bl ov51_021E6888
	cmp r0, #0
	beq _021E5E96
	movs r0, #1
	str r0, [r5]
	b _021E5E96
_021E5E56:
	bl ov51_021E67A4
	cmp r0, #1
	beq _021E5E64
	cmp r0, #2
	beq _021E5E6A
	b _021E5E96
_021E5E64:
	movs r0, #1
	str r0, [r5]
	b _021E5E96
_021E5E6A:
	movs r0, #5
	str r0, [r5]
	b _021E5E96
_021E5E70:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #0x19
	str r1, [sp, #8]
	movs r1, #4
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r1, [r0]
	ldr r0, _021E5EC0 @ =0x00000674
	movs r2, #1
	str r2, [r1, r0]
	movs r0, #2
	str r0, [r5]
_021E5E96:
	ldr r0, _021E5EC4 @ =0x0000343F
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	ldrb r1, [r4, r0]
	cmp r1, #0x80
	blo _021E5EA8
	movs r1, #0
	strb r1, [r4, r0]
_021E5EA8:
	ldr r0, _021E5EBC @ =0x0000311C
	ldr r0, [r4, r0]
	bl FUN_0202457C
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E5EB8: .4byte 0x00003436
_021E5EBC: .4byte 0x0000311C
_021E5EC0: .4byte 0x00000674
_021E5EC4: .4byte 0x0000343F
	thumb_func_end ov51_021E5D90

	thumb_func_start ov51_021E5EC8
ov51_021E5EC8: @ 0x021E5EC8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov51_021E6C00
	adds r0, r4, #0
	bl ov51_021E6038
	ldr r0, _021E5F4C @ =0x0000311C
	adds r0, r4, r0
	bl ov51_021E7CA4
	ldr r0, _021E5F50 @ =0x000030EC
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, _021E5F54 @ =0x000033B8
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, _021E5F58 @ =0x000033B0
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl ov51_021E6EF0
	ldr r0, [r4]
	bl ov51_021E6644
	bl FUN_02021238
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #0
	bl FUN_02002B34
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r1, [r0]
	ldr r0, _021E5F5C @ =0x0000066C
	ldr r0, [r1, r0]
	ldr r1, _021E5F60 @ =0x0000310C
	ldr r1, [r4, r1]
	bl FUN_02018410
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x19
	bl FUN_0201A9C4
	movs r0, #1
	movs r1, #0x7f
	bl FUN_02005B50
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5F4C: .4byte 0x0000311C
_021E5F50: .4byte 0x000030EC
_021E5F54: .4byte 0x000033B8
_021E5F58: .4byte 0x000033B0
_021E5F5C: .4byte 0x0000066C
_021E5F60: .4byte 0x0000310C
	thumb_func_end ov51_021E5EC8

	thumb_func_start ov51_021E5F64
ov51_021E5F64: @ 0x021E5F64
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #4
	movs r1, #0x19
	bl FUN_02002CEC
	ldr r2, _021E6014 @ =0x000002D7
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x19
	bl FUN_0200BAF8
	ldr r1, _021E6018 @ =0x000033C4
	str r0, [r5, r1]
	movs r0, #4
	movs r1, #0x19
	bl FUN_02026354
	ldr r1, _021E601C @ =0x000033C8
	str r0, [r5, r1]
	movs r0, #0x20
	movs r1, #0x19
	bl FUN_02026354
	ldr r1, _021E6020 @ =0x000033D0
	str r0, [r5, r1]
	movs r0, #0xa
	movs r1, #0x19
	bl FUN_02026354
	ldr r1, _021E6024 @ =0x000033D4
	str r0, [r5, r1]
	movs r0, #5
	movs r1, #0x19
	bl FUN_02026354
	ldr r2, _021E6028 @ =0x000033CC
	movs r1, #0xb
	str r0, [r5, r2]
	adds r0, r2, #0
	subs r0, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	ldr r7, _021E602C @ =0x000033D8
	movs r6, #0
	adds r4, r5, #0
_021E5FC4:
	ldr r0, _021E6018 @ =0x000033C4
	adds r1, r6, #0
	ldr r0, [r5, r0]
	adds r1, #0xe
	bl FUN_0200BBA0
	str r0, [r4, r7]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #3
	blt _021E5FC4
	ldr r7, _021E6030 @ =0x000033E4
	movs r4, #0
	adds r6, r5, #0
_021E5FE0:
	ldr r0, _021E6018 @ =0x000033C4
	adds r1, r4, #0
	ldr r0, [r5, r0]
	adds r1, #0x11
	bl FUN_0200BBA0
	str r0, [r6, r7]
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #2
	blt _021E5FE0
	ldr r7, _021E6034 @ =0x000033EC
	movs r4, #0
	adds r6, r5, #0
_021E5FFC:
	ldr r0, _021E6018 @ =0x000033C4
	adds r1, r4, #0
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	str r0, [r6, r7]
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #0xe
	blt _021E5FFC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6014: .4byte 0x000002D7
_021E6018: .4byte 0x000033C4
_021E601C: .4byte 0x000033C8
_021E6020: .4byte 0x000033D0
_021E6024: .4byte 0x000033D4
_021E6028: .4byte 0x000033CC
_021E602C: .4byte 0x000033D8
_021E6030: .4byte 0x000033E4
_021E6034: .4byte 0x000033EC
	thumb_func_end ov51_021E5F64

	thumb_func_start ov51_021E6038
ov51_021E6038: @ 0x021E6038
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _021E60A8 @ =0x000033EC
	movs r4, #0
	adds r5, r6, #0
_021E6042:
	ldr r0, [r5, r7]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xe
	blt _021E6042
	ldr r0, _021E60AC @ =0x000033E8
	ldr r0, [r6, r0]
	bl FUN_02026380
	ldr r0, _021E60B0 @ =0x000033E4
	ldr r0, [r6, r0]
	bl FUN_02026380
	ldr r0, _021E60B4 @ =0x000033E0
	ldr r0, [r6, r0]
	bl FUN_02026380
	ldr r0, _021E60B8 @ =0x000033DC
	ldr r0, [r6, r0]
	bl FUN_02026380
	ldr r0, _021E60BC @ =0x000033D8
	ldr r0, [r6, r0]
	bl FUN_02026380
	ldr r0, _021E60C0 @ =0x000033CC
	ldr r0, [r6, r0]
	bl FUN_02026380
	ldr r0, _021E60C4 @ =0x000033D4
	ldr r0, [r6, r0]
	bl FUN_02026380
	ldr r0, _021E60C8 @ =0x000033D0
	ldr r0, [r6, r0]
	bl FUN_02026380
	ldr r0, _021E60CC @ =0x000033C8
	ldr r0, [r6, r0]
	bl FUN_02026380
	ldr r0, _021E60D0 @ =0x000033C4
	ldr r0, [r6, r0]
	bl FUN_0200BB44
	movs r0, #4
	bl FUN_02002DB4
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E60A8: .4byte 0x000033EC
_021E60AC: .4byte 0x000033E8
_021E60B0: .4byte 0x000033E4
_021E60B4: .4byte 0x000033E0
_021E60B8: .4byte 0x000033DC
_021E60BC: .4byte 0x000033D8
_021E60C0: .4byte 0x000033CC
_021E60C4: .4byte 0x000033D4
_021E60C8: .4byte 0x000033D0
_021E60CC: .4byte 0x000033C8
_021E60D0: .4byte 0x000033C4
	thumb_func_end ov51_021E6038

	thumb_func_start ov51_021E60D4
ov51_021E60D4: @ 0x021E60D4
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E60F0 @ =0x021E7EA8
	add r3, sp, #0
	movs r2, #5
_021E60DE:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E60DE
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E60F0: .4byte 0x021E7EA8
	thumb_func_end ov51_021E60D4

	thumb_func_start ov51_021E60F4
ov51_021E60F4: @ 0x021E60F4
	push {r4, r5, lr}
	sub sp, #0x64
	adds r3, r0, #0
	adds r0, r2, #0
	adds r0, #0xf9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _021E6132
	cmp r1, #0
	beq _021E612E
	ldr r5, _021E61F0 @ =0x021E7E08
	add r4, sp, #0x4c
	adds r2, r4, #0
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	cmp r3, #5
	bls _021E6128
	bl GF_AssertFail
	ldr r1, [sp, #0x4c]
	b _021E61B0
_021E6128:
	lsls r0, r3, #2
	ldr r1, [r2, r0]
	b _021E61B0
_021E612E:
	movs r1, #6
	b _021E61B0
_021E6132:
	cmp r2, #0xa
	bne _021E615A
	ldr r5, _021E61F4 @ =0x021E7DF0
	add r4, sp, #0x34
	adds r2, r4, #0
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	cmp r3, #5
	bls _021E6154
	bl GF_AssertFail
	ldr r1, [sp, #0x34]
	b _021E61B0
_021E6154:
	lsls r0, r3, #2
	ldr r1, [r2, r0]
	b _021E61B0
_021E615A:
	cmp r2, #0xb
	bne _021E6182
	ldr r5, _021E61F8 @ =0x021E7E20
	add r4, sp, #0x1c
	adds r2, r4, #0
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	cmp r3, #5
	bls _021E617C
	bl GF_AssertFail
	ldr r1, [sp, #0x1c]
	b _021E61B0
_021E617C:
	lsls r0, r3, #2
	ldr r1, [r2, r0]
	b _021E61B0
_021E6182:
	cmp r2, #0xc
	bne _021E61AA
	ldr r5, _021E61FC @ =0x021E7DD8
	add r4, sp, #4
	adds r2, r4, #0
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	cmp r3, #5
	bls _021E61A4
	bl GF_AssertFail
	ldr r1, [sp, #4]
	b _021E61B0
_021E61A4:
	lsls r0, r3, #2
	ldr r1, [r2, r0]
	b _021E61B0
_021E61AA:
	bl GF_AssertFail
	movs r1, #0
_021E61B0:
	movs r0, #0x31
	add r2, sp, #0
	movs r3, #0x19
	bl FUN_020079F4
	adds r4, r0, #0
	ldr r0, [sp]
	movs r1, #2
	ldr r0, [r0, #0xc]
	lsls r1, r1, #8
	blx FUN_020D2894
	ldr r0, [sp]
	movs r1, #0x20
	ldr r5, [r0, #0xc]
	adds r2, r1, #0
	adds r0, r5, #0
	adds r0, #0x20
	adds r2, #0xe0
	blx FUN_020CFCC0
	movs r1, #0x1e
	lsls r1, r1, #4
	adds r0, r5, r1
	movs r2, #0x20
	blx FUN_020CFCC0
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x64
	pop {r4, r5, pc}
	.align 2, 0
_021E61F0: .4byte 0x021E7E08
_021E61F4: .4byte 0x021E7DF0
_021E61F8: .4byte 0x021E7E20
_021E61FC: .4byte 0x021E7DD8
	thumb_func_end ov51_021E60F4

	thumb_func_start ov51_021E6200
ov51_021E6200: @ 0x021E6200
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x31
	movs r1, #0x3c
	add r2, sp, #0
	movs r3, #0x19
	bl FUN_020079F4
	adds r6, r0, #0
	ldr r0, [sp]
	lsls r4, r4, #5
	ldr r5, [r0, #0xc]
	movs r1, #0x20
	adds r0, r5, r4
	blx FUN_020D2894
	adds r0, r5, r4
	movs r1, #0x80
	movs r2, #0x20
	blx FUN_020CFCC0
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov51_021E6200

	thumb_func_start ov51_021E6238
ov51_021E6238: @ 0x021E6238
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	ldr r2, _021E6338 @ =0x04000304
	adds r4, r0, #0
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	ldr r5, _021E633C @ =0x021E7DC8
	orrs r0, r1
	strh r0, [r2]
	add r3, sp, #0xa8
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E6340 @ =0x021E7E8C
	add r3, sp, #0x8c
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #7
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #2
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201CAE0
	ldr r5, _021E6344 @ =0x021E7ED0
	add r3, sp, #0x54
	movs r2, #7
_021E628A:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E628A
	adds r0, r4, #0
	movs r1, #4
	add r2, sp, #0x54
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	adds r0, r4, #0
	movs r1, #5
	add r2, sp, #0x70
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201CAE0
	ldr r5, _021E6348 @ =0x021E7E70
	add r3, sp, #0x38
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #6
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #2
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201CAE0
	ldr r5, _021E634C @ =0x021E7E38
	add r3, sp, #0x1c
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #2
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _021E6350 @ =0x021E7E54
	add r3, sp, #0
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #3
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	nop
_021E6338: .4byte 0x04000304
_021E633C: .4byte 0x021E7DC8
_021E6340: .4byte 0x021E7E8C
_021E6344: .4byte 0x021E7ED0
_021E6348: .4byte 0x021E7E70
_021E634C: .4byte 0x021E7E38
_021E6350: .4byte 0x021E7E54
	thumb_func_end ov51_021E6238

	thumb_func_start ov51_021E6354
ov51_021E6354: @ 0x021E6354
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	movs r0, #0x31
	movs r1, #0
	add r2, sp, #0x20
	movs r3, #0x19
	bl FUN_020079F4
	adds r5, r0, #0
	ldr r0, [sp, #0x20]
	movs r1, #2
	ldr r0, [r0, #0xc]
	lsls r1, r1, #8
	blx FUN_020D2894
	ldr r0, [sp, #0x20]
	movs r2, #2
	ldr r0, [r0, #0xc]
	movs r1, #0
	lsls r2, r2, #8
	blx FUN_020CFCC0
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r2, [r0]
	ldrb r1, [r2, #4]
	ldrb r0, [r2, #3]
	ldrb r2, [r2]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1f
	bl ov51_021E60F4
	movs r0, #0x31
	movs r1, #0x1c
	add r2, sp, #0x1c
	movs r3, #0x19
	bl FUN_020079F4
	adds r5, r0, #0
	ldr r0, [sp, #0x1c]
	movs r1, #2
	ldr r0, [r0, #0xc]
	lsls r1, r1, #8
	blx FUN_020D2894
	ldr r0, [sp, #0x1c]
	movs r2, #2
	ldr r0, [r0, #0xc]
	movs r1, #0
	lsls r2, r2, #8
	blx FUN_020CFC6C
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	ldrb r1, [r0, #5]
	cmp r1, #0xff
	bne _021E6442
	movs r2, #0
	movs r0, #0x31
	movs r1, #0x2c
	movs r3, #0x19
	str r2, [sp]
	bl FUN_02007A44
	ldr r1, _021E6624 @ =0x000030EC
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E63F2
	bl GF_AssertFail
_021E63F2:
	ldr r1, _021E6624 @ =0x000030EC
	ldr r0, [r4, r1]
	adds r1, r1, #4
	adds r1, r4, r1
	blx FUN_020B70F4
	cmp r0, #0
	bne _021E6406
	bl GF_AssertFail
_021E6406:
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	ldr r3, _021E6628 @ =0x000033B4
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	bne _021E642C
	movs r0, #0x19
	str r0, [sp]
	movs r0, #0x31
	movs r1, #0x36
	movs r2, #0
	adds r3, r4, r3
	bl FUN_020079D8
	ldr r1, _021E662C @ =0x000033B0
	str r0, [r4, r1]
	b _021E6498
_021E642C:
	movs r0, #0x19
	str r0, [sp]
	movs r0, #0x31
	movs r1, #0x37
	movs r2, #0
	adds r3, r4, r3
	bl FUN_020079D8
	ldr r1, _021E662C @ =0x000033B0
	str r0, [r4, r1]
	b _021E6498
_021E6442:
	lsls r3, r1, #2
	ldr r1, _021E6630 @ =0x021E7F08
	movs r2, #0
	ldr r1, [r1, r3]
	movs r0, #0x31
	movs r3, #0x19
	str r2, [sp]
	bl FUN_02007A44
	ldr r1, _021E6624 @ =0x000030EC
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E6462
	bl GF_AssertFail
_021E6462:
	ldr r1, _021E6624 @ =0x000030EC
	ldr r0, [r4, r1]
	adds r1, r1, #4
	adds r1, r4, r1
	blx FUN_020B70F4
	cmp r0, #0
	bne _021E6476
	bl GF_AssertFail
_021E6476:
	ldr r3, _021E6628 @ =0x000033B4
	movs r0, #0x19
	str r0, [sp]
	movs r0, #0x31
	movs r1, #0x3d
	movs r2, #0
	adds r3, r4, r3
	bl FUN_020079D8
	ldr r1, _021E662C @ =0x000033B0
	str r0, [r4, r1]
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	bl ov51_021E6200
_021E6498:
	adds r0, r4, #0
	bl ov51_021E6C6C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x19
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0x31
	movs r1, #0x29
	movs r3, #6
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x19
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0x31
	movs r1, #0x2f
	movs r3, #6
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x19
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0x31
	movs r1, #0x2a
	movs r3, #5
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x19
	str r0, [sp, #0xc]
	movs r0, #0x31
	ldr r2, [r4]
	adds r1, r0, #0
	movs r3, #5
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x19
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0x31
	movs r1, #0x2b
	movs r3, #2
	bl FUN_020078F0
	ldr r3, _021E6634 @ =0x000033BC
	movs r0, #0x19
	str r0, [sp]
	movs r0, #0x31
	movs r1, #0x35
	movs r2, #0
	adds r3, r4, r3
	bl FUN_020079D8
	ldr r1, _021E6638 @ =0x000033B8
	str r0, [r4, r1]
	adds r1, #0x82
	ldrb r0, [r4, r1]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021E6550
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x19
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0x31
	movs r1, #0x34
	movs r3, #2
	bl FUN_02007914
	b _021E6568
_021E6550:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x19
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0x31
	movs r1, #0x33
	movs r3, #2
	bl FUN_02007914
_021E6568:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x19
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0x31
	movs r1, #0x32
	movs r3, #3
	bl FUN_02007914
	ldr r1, _021E663C @ =0x0000343A
	ldrb r0, [r4, r1]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _021E65C8
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	cmp r0, #0xff
	blo _021E65C8
	subs r1, #0x7e
	ldr r0, [r4, r1]
	movs r3, #7
	str r3, [sp]
	movs r1, #9
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl FUN_0201C4EC
	b _021E6608
_021E65C8:
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r0, _021E6640 @ =0x0000FFFF
	cmp r1, r0
	bne _021E6608
	ldr r0, _021E6634 @ =0x000033BC
	movs r2, #7
	ldr r0, [r4, r0]
	movs r1, #9
	str r2, [sp]
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	movs r2, #0
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	movs r3, #0xe
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl FUN_0201C4EC
_021E6608:
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201BF7C
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	adds r4, #0xec
	adds r0, #0x68
	adds r1, r4, #0
	bl ov51_021E6CF0
	add sp, #0x24
	pop {r4, r5, pc}
	.align 2, 0
_021E6624: .4byte 0x000030EC
_021E6628: .4byte 0x000033B4
_021E662C: .4byte 0x000033B0
_021E6630: .4byte 0x021E7F08
_021E6634: .4byte 0x000033BC
_021E6638: .4byte 0x000033B8
_021E663C: .4byte 0x0000343A
_021E6640: .4byte 0x0000FFFF
	thumb_func_end ov51_021E6354

	thumb_func_start ov51_021E6644
ov51_021E6644: @ 0x021E6644
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x1f
	movs r1, #0
	bl FUN_02022CC8
	movs r2, #0
	adds r0, r4, #0
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #5
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201BC8C
	movs r1, #3
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201BB4C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov51_021E6644

	thumb_func_start ov51_021E66C0
ov51_021E66C0: @ 0x021E66C0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, _021E6730 @ =0x000030F4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E66FC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x19
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0x31
	movs r1, #0x2f
	movs r3, #6
	bl FUN_02007914
	adds r0, r4, #4
	movs r1, #7
	movs r2, #0xa
	bl ov51_021E74D4
	ldr r0, [r4]
	movs r1, #7
	bl FUN_0201CAE0
	add sp, #0x10
	pop {r4, pc}
_021E66FC:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x19
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0x31
	movs r1, #0x30
	movs r3, #6
	bl FUN_02007914
	adds r0, r4, #4
	movs r1, #0
	movs r2, #6
	bl ov51_021E74D4
	adds r0, r4, #0
	bl ov51_021E6CCC
	ldr r0, [r4]
	movs r1, #7
	bl FUN_0201CAE0
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E6730: .4byte 0x000030F4
	thumb_func_end ov51_021E66C0

	thumb_func_start ov51_021E6734
ov51_021E6734: @ 0x021E6734
	push {r4, lr}
	adds r4, r0, #0
	bl ov51_021E66C0
	ldr r0, _021E679C @ =0x0000311C
	movs r1, #0
	adds r0, r4, r0
	adds r2, r1, #0
	movs r3, #1
	bl ov51_021E7D44
	ldr r0, _021E67A0 @ =0x000030F4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E6762
	adds r0, r4, #0
	bl ov51_021E6C6C
	adds r0, r4, #0
	movs r1, #1
	bl ov51_021E76EC
	b _021E6776
_021E6762:
	adds r2, r4, #0
	ldr r0, [r4]
	movs r1, #7
	adds r2, #0xec
	bl ov51_021E6D44
	adds r0, r4, #0
	movs r1, #0
	bl ov51_021E76EC
_021E6776:
	adds r2, r4, #0
	adds r2, #0xe8
	ldr r2, [r2]
	adds r0, r4, #0
	adds r1, r4, #4
	bl ov51_021E6F18
	adds r2, r4, #0
	adds r2, #0xe8
	ldr r2, [r2]
	adds r0, r4, #0
	adds r1, r4, #4
	bl ov51_021E7208
	adds r0, r4, #0
	adds r1, r4, #4
	bl ov51_021E71D0
	pop {r4, pc}
	.align 2, 0
_021E679C: .4byte 0x0000311C
_021E67A0: .4byte 0x000030F4
	thumb_func_end ov51_021E6734

	thumb_func_start ov51_021E67A4
ov51_021E67A4: @ 0x021E67A4
	push {r4, lr}
	ldr r1, _021E6884 @ =0x00003436
	adds r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #4
	bhi _021E6880
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_021E67BC: @ jump table
	.2byte _021E67C6 - _021E67BC - 2 @ case 0
	.2byte _021E67D6 - _021E67BC - 2 @ case 1
	.2byte _021E6800 - _021E67BC - 2 @ case 2
	.2byte _021E683E - _021E67BC - 2 @ case 3
	.2byte _021E6860 - _021E67BC - 2 @ case 4
_021E67C6:
	movs r1, #0
	bl ov51_021E77A0
	ldr r0, _021E6884 @ =0x00003436
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _021E6880
_021E67D6:
	adds r0, r1, #6
	ldrb r0, [r4, r0]
	bl FUN_02020094
	cmp r0, #0
	beq _021E67E6
	movs r0, #0
	pop {r4, pc}
_021E67E6:
	adds r0, r4, #0
	movs r1, #0
	bl ov51_021E7804
	adds r0, r4, #0
	movs r1, #1
	bl ov51_021E6E10
	ldr r0, _021E6884 @ =0x00003436
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _021E6880
_021E6800:
	movs r1, #0
	bl ov51_021E786C
	cmp r0, #0
	blt _021E6880
	bne _021E6818
	adds r0, r4, #0
	movs r1, #0
	bl ov51_021E6E10
	movs r0, #1
	pop {r4, pc}
_021E6818:
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	beq _021E6830
	adds r0, r4, #0
	movs r1, #1
	bl ov51_021E77A0
	b _021E6834
_021E6830:
	movs r0, #2
	pop {r4, pc}
_021E6834:
	ldr r0, _021E6884 @ =0x00003436
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _021E6880
_021E683E:
	adds r0, r1, #6
	ldrb r0, [r4, r0]
	bl FUN_02020094
	cmp r0, #0
	beq _021E684E
	movs r0, #0
	pop {r4, pc}
_021E684E:
	adds r0, r4, #0
	movs r1, #1
	bl ov51_021E7804
	ldr r0, _021E6884 @ =0x00003436
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _021E6880
_021E6860:
	movs r1, #1
	bl ov51_021E786C
	cmp r0, #0
	beq _021E6870
	cmp r0, #1
	beq _021E687C
	b _021E6880
_021E6870:
	adds r0, r4, #0
	movs r1, #0
	bl ov51_021E6E10
	movs r0, #1
	pop {r4, pc}
_021E687C:
	movs r0, #2
	pop {r4, pc}
_021E6880:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E6884: .4byte 0x00003436
	thumb_func_end ov51_021E67A4

	thumb_func_start ov51_021E6888
ov51_021E6888: @ 0x021E6888
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _021E69D4 @ =0x00003436
	adds r4, r0, #0
	ldrb r2, [r4, r1]
	movs r5, #0
	cmp r2, #5
	bls _021E6898
	b _021E69C4
_021E6898:
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_021E68A4: @ jump table
	.2byte _021E68B0 - _021E68A4 - 2 @ case 0
	.2byte _021E68DE - _021E68A4 - 2 @ case 1
	.2byte _021E6918 - _021E68A4 - 2 @ case 2
	.2byte _021E6930 - _021E68A4 - 2 @ case 3
	.2byte _021E696E - _021E68A4 - 2 @ case 4
	.2byte _021E697E - _021E68A4 - 2 @ case 5
_021E68B0:
	movs r0, #8
	subs r1, #0xa2
	str r0, [r4, r1]
	ldr r1, _021E69D8 @ =0x000030FC
	lsls r2, r0, #9
	str r2, [r4, r1]
	adds r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	adds r0, #0x80
	str r0, [r4, r1]
	adds r0, r1, #4
	ldr r2, [r4, r0]
	adds r2, #0x80
	str r2, [r4, r0]
	ldr r0, _021E69DC @ =0x00000695
	bl FUN_0200604C
	ldr r0, _021E69D4 @ =0x00003436
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _021E69C4
_021E68DE:
	adds r3, r1, #0
	subs r3, #0xa2
	ldr r7, [r4, r3]
	ldr r6, _021E69D8 @ =0x000030FC
	movs r3, #0xc
	movs r0, #2
	subs r3, r3, r7
	ldr r2, [r4, r6]
	lsls r0, r3
	subs r0, r2, r0
	str r0, [r4, r6]
	ldr r0, [r4, r6]
	cmp r0, #0
	bgt _021E6904
	movs r0, #0x24
	str r0, [r4, r6]
	ldrb r0, [r4, r1]
	adds r0, r0, #1
	strb r0, [r4, r1]
_021E6904:
	ldr r0, _021E69E0 @ =0x00003394
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #1
	bgt _021E69C4
	movs r1, #1
	str r1, [r4, r0]
	b _021E69C4
_021E6918:
	ldr r2, _021E69E4 @ =0x000030F4
	movs r1, #1
	ldr r3, [r4, r2]
	eors r1, r3
	str r1, [r4, r2]
	bl ov51_021E66C0
	ldr r0, _021E69D4 @ =0x00003436
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _021E69C4
_021E6930:
	ldr r1, _021E69E4 @ =0x000030F4
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _021E6946
	bl ov51_021E6C6C
	adds r0, r4, #0
	movs r1, #1
	bl ov51_021E76EC
	b _021E6964
_021E6946:
	adds r2, r4, #0
	ldr r0, [r4]
	movs r1, #7
	adds r2, #0xec
	bl ov51_021E6D44
	ldr r0, _021E69E8 @ =0x0000343A
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	bne _021E6964
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov51_021E76EC
_021E6964:
	ldr r0, _021E69D4 @ =0x00003436
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _021E69C4
_021E696E:
	adds r1, r4, #4
	bl ov51_021E71D0
	ldr r0, _021E69D4 @ =0x00003436
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _021E69C4
_021E697E:
	adds r0, r1, #0
	subs r0, #0xa2
	ldr r0, [r4, r0]
	adds r2, r0, #1
	adds r0, r1, #0
	subs r0, #0xa2
	str r2, [r4, r0]
	adds r0, r1, #0
	subs r0, #0xa2
	ldr r0, [r4, r0]
	cmp r0, #8
	ble _021E699C
	movs r0, #8
	subs r1, #0xa2
	str r0, [r4, r1]
_021E699C:
	ldr r2, _021E69E0 @ =0x00003394
	ldr r3, _021E69D8 @ =0x000030FC
	ldr r6, [r4, r2]
	movs r2, #0xc
	movs r0, #2
	subs r2, r2, r6
	adds r6, r0, #0
	ldr r1, [r4, r3]
	lsls r6, r2
	adds r1, r1, r6
	str r1, [r4, r3]
	ldr r2, [r4, r3]
	lsls r1, r0, #0xb
	cmp r2, r1
	blt _021E69C4
	str r1, [r4, r3]
	str r1, [r4, r3]
	adds r0, r3, #4
	str r1, [r4, r0]
	movs r5, #1
_021E69C4:
	ldr r1, _021E69E8 @ =0x0000343A
	movs r0, #4
	ldrb r2, [r4, r1]
	orrs r0, r2
	strb r0, [r4, r1]
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E69D4: .4byte 0x00003436
_021E69D8: .4byte 0x000030FC
_021E69DC: .4byte 0x00000695
_021E69E0: .4byte 0x00003394
_021E69E4: .4byte 0x000030F4
_021E69E8: .4byte 0x0000343A
	thumb_func_end ov51_021E6888

	thumb_func_start ov51_021E69EC
ov51_021E69EC: @ 0x021E69EC
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldr r0, _021E6A44 @ =0x000030FC
	ldr r0, [r4, r0]
	blx FUN_020CCBB0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0x31
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	blx FUN_020CCBB0
	str r0, [sp, #0x14]
	blx FUN_020D3AB4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6A48 @ =0x04001020
	add r1, sp, #8
	movs r2, #0x80
	movs r3, #0x60
	blx FUN_020CF0AC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6A4C @ =0x04001030
	add r1, sp, #8
	movs r2, #0x80
	movs r3, #0x60
	blx FUN_020CF0AC
	ldr r1, _021E6A50 @ =0x0000343A
	movs r0, #4
	ldrb r2, [r4, r1]
	bics r2, r0
	strb r2, [r4, r1]
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
_021E6A44: .4byte 0x000030FC
_021E6A48: .4byte 0x04001020
_021E6A4C: .4byte 0x04001030
_021E6A50: .4byte 0x0000343A
	thumb_func_end ov51_021E69EC

	thumb_func_start ov51_021E6A54
ov51_021E6A54: @ 0x021E6A54
	push {r3, lr}
	ldr r1, _021E6A9C @ =0x021D110C
	movs r2, #1
	ldr r1, [r1, #0x48]
	tst r2, r1
	beq _021E6A7C
	ldr r2, _021E6AA0 @ =0x000030F4
	ldr r2, [r0, r2]
	cmp r2, #0
	beq _021E6A8E
	ldr r2, _021E6AA4 @ =0x0000343A
	ldrb r0, [r0, r2]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	bne _021E6A8E
	ldr r0, _021E6AA8 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #4
	pop {r3, pc}
_021E6A7C:
	movs r0, #2
	tst r0, r1
	beq _021E6A8E
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #5
	pop {r3, pc}
_021E6A8E:
	movs r0, #0x30
	tst r0, r1
	beq _021E6A98
	movs r0, #3
	pop {r3, pc}
_021E6A98:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_021E6A9C: .4byte 0x021D110C
_021E6AA0: .4byte 0x000030F4
_021E6AA4: .4byte 0x0000343A
_021E6AA8: .4byte 0x000005DC
	thumb_func_end ov51_021E6A54

	thumb_func_start ov51_021E6AAC
ov51_021E6AAC: @ 0x021E6AAC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02025358
	cmp r0, #0
	bne _021E6ABE
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E6ABE:
	ldr r0, _021E6B28 @ =_021E7DB8
	bl FUN_02025320
	cmp r0, #0
	beq _021E6AD8
	movs r0, #1
	str r0, [r4]
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #5
	pop {r3, r4, r5, pc}
_021E6AD8:
	ldr r0, _021E6B2C @ =0x000030F4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6B02
	ldr r0, _021E6B30 @ =0x0000343A
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	bne _021E6B02
	ldr r0, _021E6B34 @ =0x021E7DBC
	bl FUN_02025320
	cmp r0, #0
	beq _021E6B02
	movs r0, #1
	str r0, [r4]
	ldr r0, _021E6B38 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #4
	pop {r3, r4, r5, pc}
_021E6B02:
	ldr r0, _021E6B3C @ =0x021E7DC0
	bl FUN_02025320
	cmp r0, #0
	beq _021E6B24
	ldr r1, _021E6B40 @ =0x021D114C
	movs r0, #0xd1
	ldrh r2, [r1, #0x20]
	lsls r0, r0, #6
	strb r2, [r5, r0]
	ldrh r1, [r1, #0x22]
	adds r0, r0, #1
	strb r1, [r5, r0]
	movs r0, #1
	str r0, [r4]
	movs r0, #3
	pop {r3, r4, r5, pc}
_021E6B24:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6B28: .4byte _021E7DB8
_021E6B2C: .4byte 0x000030F4
_021E6B30: .4byte 0x0000343A
_021E6B34: .4byte 0x021E7DBC
_021E6B38: .4byte 0x000005DC
_021E6B3C: .4byte 0x021E7DC0
_021E6B40: .4byte 0x021D114C
	thumb_func_end ov51_021E6AAC

	thumb_func_start ov51_021E6B44
ov51_021E6B44: @ 0x021E6B44
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	subs r2, r1, #1
	ldr r1, _021E6B80 @ =0x00003108
	adds r4, r0, #0
	str r2, [r4, r1]
	add r1, sp, #0
	bl ov51_021E6AAC
	ldr r1, [sp]
	cmp r1, #0
	beq _021E6B6A
	ldr r1, _021E6B84 @ =0x0000310C
	movs r2, #1
	add sp, #4
	str r2, [r4, r1]
	pop {r3, r4, pc}
_021E6B6A:
	adds r0, r4, #0
	bl ov51_021E6A54
	cmp r0, #0
	beq _021E6B7A
	ldr r1, _021E6B84 @ =0x0000310C
	movs r2, #0
	str r2, [r4, r1]
_021E6B7A:
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E6B80: .4byte 0x00003108
_021E6B84: .4byte 0x0000310C
	thumb_func_end ov51_021E6B44

	thumb_func_start ov51_021E6B88
ov51_021E6B88: @ 0x021E6B88
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _021E6BF0 @ =0x0000343F
	movs r1, #5
	ldrb r0, [r4, r0]
	movs r2, #0
	rsbs r5, r0, #0
	ldr r0, [r4]
	adds r3, r5, #0
	bl FUN_0201BC8C
	ldr r0, [r4]
	movs r1, #5
	movs r2, #3
	adds r3, r5, #0
	bl FUN_0201BC8C
	ldr r0, [r4]
	movs r1, #3
	movs r2, #0
	adds r3, r5, #0
	bl FUN_0201BC8C
	movs r1, #3
	ldr r0, [r4]
	adds r2, r1, #0
	adds r3, r5, #0
	bl FUN_0201BC8C
	ldr r0, _021E6BF4 @ =0x0000343A
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	beq _021E6BD2
	adds r0, r4, #0
	bl ov51_021E69EC
_021E6BD2:
	ldr r0, [r4]
	bl FUN_0201EEB4
	bl FUN_0202061C
	bl FUN_0200B224
	ldr r3, _021E6BF8 @ =0x027E0000
	ldr r1, _021E6BFC @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r3, r4, r5, pc}
	nop
_021E6BF0: .4byte 0x0000343F
_021E6BF4: .4byte 0x0000343A
_021E6BF8: .4byte 0x027E0000
_021E6BFC: .4byte 0x00003FF8
	thumb_func_end ov51_021E6B88

	thumb_func_start ov51_021E6C00
ov51_021E6C00: @ 0x021E6C00
	push {r4, lr}
	sub sp, #0x18
	movs r0, #1
	lsls r0, r0, #0xc
	blx FUN_020CCBB0
	adds r4, r0, #0
	movs r0, #1
	lsls r0, r0, #0xc
	blx FUN_020CCBB0
	movs r1, #0
	str r4, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	blx FUN_020D3AB4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6C60 @ =0x04001020
	add r1, sp, #8
	movs r2, #0x80
	movs r3, #0x60
	blx FUN_020CF0AC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6C64 @ =0x04001030
	add r1, sp, #8
	movs r2, #0x80
	movs r3, #0x60
	blx FUN_020CF0AC
	blx FUN_020D3AB4
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6C68 @ =0x04000030
	add r1, sp, #8
	movs r2, #0x80
	str r3, [sp, #4]
	blx FUN_020CF0AC
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
_021E6C60: .4byte 0x04001020
_021E6C64: .4byte 0x04001030
_021E6C68: .4byte 0x04000030
	thumb_func_end ov51_021E6C00

	thumb_func_start ov51_021E6C6C
ov51_021E6C6C: @ 0x021E6C6C
	push {r3, r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, _021E6CC4 @ =0x000030F0
	movs r1, #7
	ldr r3, [r4, r0]
	movs r0, #0
	str r0, [sp]
	ldr r2, [r3, #0x14]
	ldr r0, [r4]
	ldr r3, [r3, #0x10]
	bl FUN_0201C0C0
	ldr r0, _021E6CC8 @ =0x000033B4
	movs r1, #0xa
	ldr r0, [r4, r0]
	movs r2, #0x15
	str r1, [sp]
	movs r1, #0xb
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	movs r3, #5
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #7
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl FUN_0201C4EC
	ldr r0, [r4]
	movs r1, #7
	bl FUN_0201BF7C
	add sp, #0x1c
	pop {r3, r4, pc}
	.align 2, 0
_021E6CC4: .4byte 0x000030F0
_021E6CC8: .4byte 0x000033B4
	thumb_func_end ov51_021E6C6C

	thumb_func_start ov51_021E6CCC
ov51_021E6CCC: @ 0x021E6CCC
	push {r3, lr}
	sub sp, #0x10
	movs r1, #6
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #9
	str r1, [sp, #8]
	movs r1, #0x10
	str r1, [sp, #0xc]
	ldr r0, [r0]
	movs r1, #7
	movs r2, #0
	movs r3, #0x14
	bl FUN_0201C8C4
	add sp, #0x10
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov51_021E6CCC

	thumb_func_start ov51_021E6CF0
ov51_021E6CF0: @ 0x021E6CF0
	push {r4, r5, r6, r7}
	movs r2, #3
	movs r4, #0
	lsls r2, r2, #0xc
_021E6CF8:
	asrs r3, r4, #2
	lsrs r3, r3, #0x1d
	adds r3, r4, r3
	asrs r3, r3, #3
	lsrs r6, r3, #0x1f
	lsls r5, r3, #0x1d
	subs r5, r5, r6
	movs r3, #0x1d
	rors r5, r3
	adds r3, r6, r5
	asrs r5, r4, #5
	lsrs r5, r5, #0x1a
	lsls r3, r3, #0x18
	adds r5, r4, r5
	lsrs r3, r3, #0x18
	asrs r5, r5, #6
	lsls r5, r5, #3
	adds r3, r0, r3
	ldrb r3, [r5, r3]
	lsrs r7, r4, #0x1f
	lsls r6, r4, #0x1d
	subs r6, r6, r7
	movs r5, #0x1d
	rors r6, r5
	adds r5, r7, r6
	lsls r5, r5, #0x18
	adds r6, r3, #0
	lsrs r5, r5, #0x18
	asrs r6, r5
	movs r3, #1
	ands r3, r6
	strb r3, [r1, r4]
	adds r4, r4, #1
	cmp r4, r2
	blt _021E6CF8
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
	thumb_func_end ov51_021E6CF0

	thumb_func_start ov51_021E6D44
ov51_021E6D44: @ 0x021E6D44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r1, #0
	movs r1, #1
	str r1, [sp]
	lsls r1, r7, #0x18
	movs r3, #3
	str r0, [sp, #4]
	lsrs r1, r1, #0x18
	lsls r3, r3, #0xc
	bl FUN_0201C0C0
	lsls r1, r7, #0x18
	ldr r0, [sp, #4]
	lsrs r1, r1, #0x18
	bl FUN_0201CC08
	movs r4, #0
	adds r1, r0, #0
	adds r3, r4, #0
	adds r0, r4, #0
_021E6D6E:
	adds r5, r3, #0
	adds r5, #0xc
	lsls r5, r5, #6
	adds r2, r0, #0
	adds r5, r1, r5
_021E6D78:
	lsls r6, r2, #1
	adds r4, r4, #1
	adds r2, r2, #1
	lsls r4, r4, #0x10
	lsls r2, r2, #0x18
	lsrs r4, r4, #0x10
	adds r6, r5, r6
	lsrs r2, r2, #0x18
	strh r4, [r6, #8]
	cmp r2, #0x18
	blo _021E6D78
	adds r2, r3, #1
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	cmp r3, #8
	blo _021E6D6E
	lsls r1, r7, #0x18
	ldr r0, [sp, #4]
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov51_021E6D44

	thumb_func_start ov51_021E6DA8
ov51_021E6DA8: @ 0x021E6DA8
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _021E6E02
	ldr r0, _021E6E04 @ =0x000030F4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E6DF2
	ldr r2, _021E6E08 @ =0x00003439
	ldrb r0, [r4, r2]
	cmp r0, #0
	bne _021E6DE0
	adds r1, r4, #0
	adds r1, #0xe8
	subs r2, #0x71
	ldr r1, [r1]
	ldr r2, [r4, r2]
	adds r0, r4, #4
	bl ov51_021E757C
	ldr r2, _021E6E0C @ =0x000033CC
	adds r0, r4, #0
	ldr r2, [r4, r2]
	adds r0, #0x54
	movs r1, #1
	bl ov51_021E7664
	b _021E6DF2
_021E6DE0:
	cmp r0, #0xf
	bne _021E6DF2
	subs r2, #0x6d
	adds r0, r4, #0
	ldr r2, [r4, r2]
	adds r0, #0x54
	movs r1, #0
	bl ov51_021E7664
_021E6DF2:
	ldr r0, _021E6E08 @ =0x00003439
	movs r1, #0x1e
	ldrb r0, [r4, r0]
	adds r0, r0, #1
	blx FUN_020F2998
	ldr r0, _021E6E08 @ =0x00003439
	strb r1, [r4, r0]
_021E6E02:
	pop {r4, pc}
	.align 2, 0
_021E6E04: .4byte 0x000030F4
_021E6E08: .4byte 0x00003439
_021E6E0C: .4byte 0x000033CC
	thumb_func_end ov51_021E6DA8

	thumb_func_start ov51_021E6E10
ov51_021E6E10: @ 0x021E6E10
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #1
	ldr r0, _021E6E5C @ =0x0000311C
	bne _021E6E38
	adds r0, r5, r0
	movs r1, #1
	movs r2, #2
	movs r3, #0
	bl ov51_021E7D44
	movs r1, #0
	ldr r0, _021E6E5C @ =0x0000311C
	adds r2, r1, #0
	adds r0, r5, r0
	adds r3, r1, #0
	bl ov51_021E7D44
	b _021E6E52
_021E6E38:
	movs r1, #1
	adds r0, r5, r0
	movs r2, #2
	adds r3, r1, #0
	bl ov51_021E7D44
	ldr r0, _021E6E5C @ =0x0000311C
	movs r1, #0
	adds r0, r5, r0
	adds r2, r1, #0
	movs r3, #1
	bl ov51_021E7D44
_021E6E52:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov51_021E78D0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6E5C: .4byte 0x0000311C
	thumb_func_end ov51_021E6E10

	thumb_func_start ov51_021E6E60
ov51_021E6E60: @ 0x021E6E60
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r7, _021E6EE4 @ =0x021E7F48
	movs r4, #0
	adds r6, r5, #4
_021E6E6C:
	lsls r1, r4, #4
	lsls r2, r4, #3
	ldr r0, [r5]
	adds r1, r6, r1
	adds r2, r7, r2
	bl FUN_0201D4F8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xe
	blo _021E6E6C
	movs r2, #0
	str r2, [sp]
	ldr r0, [r5]
	movs r1, #7
	movs r3, #1
	bl FUN_0201C1F4
	movs r2, #0
	str r2, [sp]
	ldr r0, [r5]
	movs r1, #4
	movs r3, #1
	bl FUN_0201C1F4
	ldr r0, _021E6EE8 @ =0x0000343D
	ldr r2, _021E6EEC @ =0x000003E1
	ldrb r0, [r5, r0]
	movs r1, #4
	movs r3, #0xd
	str r0, [sp]
	movs r0, #0x19
	str r0, [sp, #4]
	ldr r0, [r5]
	bl FUN_0200E644
	movs r1, #7
	movs r0, #4
	lsls r1, r1, #6
	movs r2, #0x19
	bl FUN_02003030
	movs r0, #0x19
	bl FUN_0201660C
	movs r1, #0xcf
	lsls r1, r1, #6
	str r0, [r5, r1]
	ldr r0, [r5]
	movs r1, #7
	bl FUN_0201EFBC
	ldr r0, [r5]
	movs r1, #4
	bl FUN_0201EFBC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6EE4: .4byte 0x021E7F48
_021E6EE8: .4byte 0x0000343D
_021E6EEC: .4byte 0x000003E1
	thumb_func_end ov51_021E6E60

	thumb_func_start ov51_021E6EF0
ov51_021E6EF0: @ 0x021E6EF0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xcf
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r5, #0
	adds r4, r4, #4
_021E6F02:
	lsls r0, r5, #4
	adds r0, r4, r0
	bl FUN_0201D520
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xe
	blo _021E6F02
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov51_021E6EF0

	thumb_func_start ov51_021E6F18
ov51_021E6F18: @ 0x021E6F18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r7, r0, #0
	ldr r0, _021E71BC @ =0x000033C4
	adds r6, r1, #0
	ldr r0, [r7, r0]
	adds r5, r2, #0
	str r0, [sp, #0x20]
	movs r4, #0
_021E6F2A:
	lsls r0, r4, #4
	str r0, [sp, #0x24]
	adds r0, r6, r0
	movs r1, #0
	bl FUN_0201D978
	cmp r4, #3
	bne _021E6F44
	bne _021E6F68
	ldrb r0, [r5, #4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	beq _021E6F68
_021E6F44:
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E71C0 @ =0x00010200
	lsls r2, r4, #2
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r7, r2
	str r0, [sp, #0xc]
	ldr r2, _021E71C4 @ =0x000033EC
	ldr r0, [sp, #0x24]
	movs r1, #0
	ldr r2, [r3, r2]
	adds r0, r6, r0
	adds r3, r1, #0
	bl FUN_020200FC
_021E6F68:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	blo _021E6F2A
	movs r0, #0x20
	movs r1, #0x19
	bl FUN_02026354
	str r0, [sp, #0x1c]
	ldr r0, _021E71C8 @ =0x000033D0
	movs r1, #0x20
	ldr r0, [r7, r0]
	movs r2, #0x19
	str r0, [sp, #0x18]
	movs r0, #6
	bl FUN_0200BD18
	adds r4, r0, #0
	ldr r0, _021E71CC @ =0x000033D4
	movs r2, #0
	ldr r0, [r7, r0]
	movs r1, #0x60
	str r0, [sp, #0x14]
	str r0, [sp]
	ldrh r0, [r5, #0x28]
	adds r3, r2, #0
	str r0, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0xff
	str r0, [sp, #0x10]
	adds r0, r6, #0
	bl ov51_021E74F4
	ldr r0, _021E71C8 @ =0x000033D0
	adds r1, r5, #0
	ldr r0, [r7, r0]
	adds r1, #8
	bl FUN_020269A0
	ldr r0, _021E71C8 @ =0x000033D0
	movs r2, #0
	ldr r0, [r7, r0]
	movs r1, #0x68
	str r0, [sp]
	adds r0, r6, #0
	adds r0, #0x10
	adds r3, r2, #0
	bl ov51_021E7540
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [r5, #0x1c]
	adds r0, r4, #0
	movs r1, #5
	movs r3, #6
	bl FUN_0200BFCC
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	movs r1, #0x13
	bl FUN_0200BB6C
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	adds r0, r4, #0
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [sp, #0x18]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0x88
	subs r3, r1, r0
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E71C0 @ =0x00010200
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r0, #0x20
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldrb r0, [r5, #4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	beq _021E7076
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [r5, #0x20]
	adds r0, r4, #0
	movs r1, #5
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	movs r1, #0x1a
	bl FUN_0200BB6C
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	adds r0, r4, #0
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [sp, #0x18]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0x88
	subs r3, r1, r0
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E71C0 @ =0x00010200
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r0, #0x30
	str r1, [sp, #0xc]
	bl FUN_020200FC
_021E7076:
	ldr r0, [sp, #0x14]
	movs r2, #0
	str r0, [sp]
	ldr r0, [r5, #0x24]
	movs r1, #0x88
	str r0, [sp, #4]
	movs r0, #9
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0xff
	str r0, [sp, #0x10]
	adds r0, r6, #0
	adds r0, #0x40
	adds r3, r2, #0
	bl ov51_021E74F4
	ldrb r0, [r5, #4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _021E70DA
	ldr r0, [r5, #0x18]
	bl FUN_0202CE24
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, [r5, #0x18]
	bl FUN_0202CE28
	movs r3, #2
	adds r2, r0, #0
	str r3, [sp]
	movs r1, #1
	adds r0, r4, #0
	str r1, [sp, #4]
	bl FUN_0200BFCC
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	movs r1, #0x15
	bl FUN_0200BB6C
	b _021E710A
_021E70DA:
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldrh r2, [r5, #0x2a]
	adds r0, r4, #0
	movs r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	movs r3, #2
	adds r2, r5, #0
	str r3, [sp]
	movs r1, #1
	str r1, [sp, #4]
	adds r2, #0x2e
	ldrb r2, [r2]
	adds r0, r4, #0
	bl FUN_0200BFCC
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	movs r1, #0x14
	bl FUN_0200BB6C
_021E710A:
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	adds r0, r4, #0
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [sp, #0x18]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe0
	subs r3, r1, r0
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E71C0 @ =0x00010200
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r0, #0x50
	str r1, [sp, #0xc]
	bl FUN_020200FC
	movs r1, #2
	adds r2, r5, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r2, #0x2f
	ldrb r2, [r2]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_0200BFCC
	adds r2, r5, #0
	adds r2, #0x30
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0200CB1C
	movs r3, #2
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r5, #0x31
	ldrb r2, [r5]
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0200BFCC
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	movs r1, #0x16
	bl FUN_0200BB6C
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	adds r0, r4, #0
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [sp, #0x18]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe0
	subs r3, r1, r0
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E71C0 @ =0x00010200
	adds r6, #0x60
	str r0, [sp, #8]
	ldr r2, [sp, #0x18]
	adds r0, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x1c]
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0200BDA0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E71BC: .4byte 0x000033C4
_021E71C0: .4byte 0x00010200
_021E71C4: .4byte 0x000033EC
_021E71C8: .4byte 0x000033D0
_021E71CC: .4byte 0x000033D4
	thumb_func_end ov51_021E6F18

	thumb_func_start ov51_021E71D0
ov51_021E71D0: @ 0x021E71D0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, _021E7204 @ =0x000030F4
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _021E71F0
	movs r5, #7
	adds r4, #0x70
_021E71E0:
	adds r0, r4, #0
	bl FUN_0201D578
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #0xb
	blt _021E71E0
	pop {r3, r4, r5, pc}
_021E71F0:
	movs r5, #0
_021E71F2:
	adds r0, r4, #0
	bl FUN_0201D578
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #7
	blt _021E71F2
	pop {r3, r4, r5, pc}
	nop
_021E7204: .4byte 0x000030F4
	thumb_func_end ov51_021E71D0

	thumb_func_start ov51_021E7208
ov51_021E7208: @ 0x021E7208
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r1, #0
	ldr r1, _021E74C4 @ =0x000033C4
	str r0, [sp, #0x14]
	ldr r0, [r0, r1]
	str r2, [sp, #0x18]
	str r0, [sp, #0x1c]
	movs r4, #7
	movs r6, #0
_021E721C:
	lsls r7, r4, #4
	adds r0, r5, r7
	movs r1, #0
	bl FUN_0201D978
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E74C8 @ =0x00010200
	ldr r2, [sp, #0x14]
	str r0, [sp, #8]
	lsls r3, r4, #2
	adds r3, r2, r3
	ldr r2, _021E74CC @ =0x000033EC
	str r6, [sp, #0xc]
	ldr r2, [r3, r2]
	adds r0, r5, r7
	adds r1, r6, #0
	adds r3, r6, #0
	bl FUN_020200FC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xb
	blo _021E721C
	movs r0, #0x20
	movs r1, #0x19
	bl FUN_02026354
	adds r7, r0, #0
	ldr r1, _021E74D0 @ =0x000033D0
	ldr r0, [sp, #0x14]
	movs r2, #0x19
	ldr r4, [r0, r1]
	movs r0, #6
	movs r1, #0x20
	bl FUN_0200BD18
	ldr r1, [sp, #0x18]
	adds r6, r0, #0
	adds r1, #0x33
	ldrb r1, [r1]
	cmp r1, #0
	beq _021E72EC
	movs r1, #2
	str r1, [sp]
	movs r2, #1
	str r2, [sp, #4]
	ldr r2, [sp, #0x18]
	adds r3, r1, #0
	adds r2, #0x32
	ldrb r2, [r2]
	bl FUN_0200BFCC
	ldr r2, [sp, #0x18]
	adds r0, r6, #0
	adds r2, #0x33
	ldrb r2, [r2]
	movs r1, #3
	bl FUN_0200CB1C
	movs r3, #2
	ldr r2, [sp, #0x18]
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r2, #0x34
	ldrb r2, [r2]
	adds r0, r6, #0
	movs r1, #4
	bl FUN_0200BFCC
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	adds r0, r6, #0
	ldrh r2, [r2, #0x2c]
	movs r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	movs r3, #2
	ldr r2, [sp, #0x18]
	str r3, [sp]
	movs r1, #1
	str r1, [sp, #4]
	adds r2, #0x35
	ldrb r2, [r2]
	adds r0, r6, #0
	bl FUN_0200BFCC
	ldr r0, [sp, #0x1c]
	movs r1, #0x16
	adds r2, r7, #0
	bl FUN_0200BB6C
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	b _021E7324
_021E72EC:
	ldr r0, [sp, #0x1c]
	movs r1, #0xc
	adds r2, r7, #0
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r7, #0
	adds r3, r1, #0
	bl FUN_0200BE3C
	movs r3, #0
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #1
	adds r2, r7, #0
	bl FUN_0200BE3C
	ldr r0, [sp, #0x1c]
	movs r1, #0x19
	adds r2, r4, #0
	bl FUN_0200BB6C
_021E7324:
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe0
	subs r3, r1, r0
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E74C8 @ =0x00010200
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x70
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x1c]
	movs r1, #0x14
	adds r2, r7, #0
	bl FUN_0200BB6C
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe0
	subs r3, r1, r0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E74C8 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x70
	adds r2, r4, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	adds r0, r6, #0
	ldr r2, [r2, #0x38]
	movs r1, #5
	movs r3, #6
	bl FUN_0200BFCC
	ldr r0, [sp, #0x1c]
	movs r1, #0x1b
	adds r2, r7, #0
	bl FUN_0200BB6C
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe0
	subs r3, r1, r0
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E74C8 @ =0x00010200
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x80
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x1c]
	movs r1, #0x17
	adds r2, r4, #0
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E74C8 @ =0x00010200
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x90
	movs r3, #0x70
	str r1, [sp, #0xc]
	bl FUN_020200FC
	movs r2, #0
	ldr r0, [sp, #0x18]
	str r4, [sp]
	ldr r0, [r0, #0x40]
	movs r1, #0xe0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0xff
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r0, #0x90
	adds r3, r2, #0
	bl ov51_021E74F4
	ldr r0, [sp, #0x1c]
	movs r1, #0x18
	adds r2, r4, #0
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E74C8 @ =0x00010200
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x90
	movs r3, #0xb0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x18]
	str r4, [sp]
	ldr r0, [r0, #0x3c]
	movs r1, #0xe0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0xff
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r0, #0x90
	movs r2, #0x40
	movs r3, #0
	bl ov51_021E74F4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	adds r0, r6, #0
	ldr r2, [r2, #0x44]
	movs r1, #5
	movs r3, #6
	bl FUN_0200BFCC
	ldr r0, [sp, #0x1c]
	movs r1, #0x1b
	adds r2, r7, #0
	bl FUN_0200BB6C
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe0
	subs r3, r1, r0
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E74C8 @ =0x00010200
	adds r5, #0xa0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r4, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_0200BDA0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E74C4: .4byte 0x000033C4
_021E74C8: .4byte 0x00010200
_021E74CC: .4byte 0x000033EC
_021E74D0: .4byte 0x000033D0
	thumb_func_end ov51_021E7208

	thumb_func_start ov51_021E74D4
ov51_021E74D4: @ 0x021E74D4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r6, r2, #0
	adds r5, r0, #0
	cmp r4, r6
	bhi _021E74F2
_021E74E0:
	lsls r0, r4, #4
	adds r0, r5, r0
	bl FUN_0201D8C8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	bls _021E74E0
_021E74F2:
	pop {r4, r5, r6, pc}
	thumb_func_end ov51_021E74D4

	thumb_func_start ov51_021E74F4
ov51_021E74F4: @ 0x021E74F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	movs r0, #1
	adds r4, r2, #0
	str r0, [sp]
	add r2, sp, #0x18
	adds r5, r1, #0
	adds r6, r3, #0
	ldrb r2, [r2, #0x18]
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x34]
	bl FUN_02026464
	movs r0, #0
	ldr r1, [sp, #0x28]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	adds r3, r3, r4
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E753C @ =0x00010200
	ldr r2, [sp, #0x28]
	str r0, [sp, #8]
	movs r1, #0
	adds r0, r7, #0
	subs r3, r5, r3
	str r1, [sp, #0xc]
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E753C: .4byte 0x00010200
	thumb_func_end ov51_021E74F4

	thumb_func_start ov51_021E7540
ov51_021E7540: @ 0x021E7540
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0
	adds r4, r2, #0
	ldr r1, [sp, #0x28]
	adds r6, r3, #0
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	adds r3, r3, r4
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E7578 @ =0x00010200
	ldr r2, [sp, #0x28]
	str r0, [sp, #8]
	movs r1, #0
	adds r0, r7, #0
	subs r3, r5, r3
	str r1, [sp, #0xc]
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7578: .4byte 0x00010200
	thumb_func_end ov51_021E7540

	thumb_func_start ov51_021E757C
ov51_021E757C: @ 0x021E757C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r1, #0
	adds r7, r0, #0
	ldr r0, [r5, #0x18]
	cmp r0, #0
	bne _021E758E
	bl GF_AssertFail
_021E758E:
	ldr r0, [r5, #0x18]
	bl FUN_0202CE24
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r7, #0
	movs r1, #0
	adds r0, #0x50
	movs r2, #0xb8
	adds r3, r1, #0
	bl FUN_0201DA74
	ldr r2, _021E765C @ =0x000002D7
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x19
	bl FUN_0200BAF8
	str r0, [sp, #0x10]
	movs r0, #0x20
	movs r1, #0x19
	bl FUN_02026354
	adds r4, r0, #0
	movs r0, #0x20
	movs r1, #0x19
	bl FUN_02026354
	str r0, [sp, #0x14]
	movs r0, #2
	movs r1, #0x20
	movs r2, #0x19
	bl FUN_0200BD18
	adds r6, r0, #0
	ldr r0, [r5, #0x18]
	bl FUN_0202CE24
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, [r5, #0x18]
	bl FUN_0202CE28
	movs r3, #2
	adds r2, r0, #0
	str r3, [sp]
	movs r1, #1
	adds r0, r6, #0
	str r1, [sp, #4]
	bl FUN_0200BFCC
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x14]
	movs r1, #0x15
	bl FUN_0200BB6C
	ldr r2, [sp, #0x14]
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe0
	subs r3, r1, r0
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E7660 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r7, #0x50
	adds r0, r7, #0
	adds r2, r4, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	bl FUN_0200BB44
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_0200BDA0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E765C: .4byte 0x000002D7
_021E7660: .4byte 0x00010200
	thumb_func_end ov51_021E757C

	thumb_func_start ov51_021E7664
ov51_021E7664: @ 0x021E7664
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	cmp r1, #0
	beq _021E7684
	movs r1, #0
	str r1, [sp]
	ldr r3, _021E76A0 @ =0x00010200
	str r1, [sp, #4]
	str r3, [sp, #8]
	movs r3, #0xcd
	str r1, [sp, #0xc]
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, pc}
_021E7684:
	movs r1, #5
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #0xcd
	adds r3, r1, #0
	bl FUN_0201DA74
	adds r0, r4, #0
	bl FUN_0201D578
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E76A0: .4byte 0x00010200
	thumb_func_end ov51_021E7664

	thumb_func_start ov51_021E76A4
ov51_021E76A4: @ 0x021E76A4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r1, _021E76E4 @ =0x000033D8
	adds r5, r0, #0
	ldr r1, [r5, r1]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	movs r1, #0x30
	subs r4, r1, r0
	adds r0, r5, #0
	adds r0, #0xd4
	movs r1, #0
	bl FUN_0201D978
	movs r1, #4
	str r1, [sp]
	movs r2, #0
	ldr r0, _021E76E8 @ =0x00050400
	str r2, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r2, _021E76E4 @ =0x000033D8
	adds r0, r5, #0
	ldr r2, [r5, r2]
	adds r0, #0xd4
	lsrs r3, r4, #1
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E76E4: .4byte 0x000033D8
_021E76E8: .4byte 0x00050400
	thumb_func_end ov51_021E76A4

	thumb_func_start ov51_021E76EC
ov51_021E76EC: @ 0x021E76EC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xc4
	cmp r1, #0
	bne _021E7706
	ldr r0, _021E778C @ =0x0000343A
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _021E7706
	movs r1, #1
_021E7706:
	cmp r1, #0
	beq _021E7712
	cmp r1, #1
	beq _021E7756
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E7712:
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r1, _021E7790 @ =0x000033E0
	movs r0, #4
	ldr r1, [r5, r1]
	movs r2, #0
	bl FUN_02002F30
	movs r1, #0x60
	subs r3, r1, r0
	movs r1, #4
	str r1, [sp]
	movs r2, #0
	ldr r0, _021E7794 @ =0x00050400
	str r2, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r2, _021E7790 @ =0x000033E0
	adds r0, r4, #0
	ldr r2, [r5, r2]
	lsrs r3, r3, #1
	bl FUN_020200FC
	ldr r0, _021E7798 @ =0x0000311C
	movs r1, #1
	adds r0, r5, r0
	movs r2, #2
	adds r3, r1, #0
	bl ov51_021E7D44
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E7756:
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #4
	str r0, [sp]
	movs r1, #0
	ldr r0, _021E7794 @ =0x00050400
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r2, _021E779C @ =0x000033DC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, _021E7798 @ =0x0000311C
	movs r1, #1
	adds r0, r5, r0
	movs r2, #4
	adds r3, r1, #0
	bl ov51_021E7D44
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E778C: .4byte 0x0000343A
_021E7790: .4byte 0x000033E0
_021E7794: .4byte 0x00050400
_021E7798: .4byte 0x0000311C
_021E779C: .4byte 0x000033DC
	thumb_func_end ov51_021E76EC

	thumb_func_start ov51_021E77A0
ov51_021E77A0: @ 0x021E77A0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	bne _021E77B6
	ldr r2, _021E77F4 @ =0x000003E1
	adds r0, #0xb4
	movs r1, #1
	movs r3, #0xd
	bl FUN_0200E998
_021E77B6:
	adds r0, r5, #0
	adds r0, #0xb4
	movs r1, #0xf
	bl FUN_0201D978
	movs r3, #0
	ldr r2, _021E77F8 @ =0x0000343E
	str r3, [sp]
	ldrb r0, [r5, r2]
	lsls r4, r4, #2
	adds r4, r5, r4
	str r0, [sp, #4]
	ldr r0, _021E77FC @ =0x0001020F
	subs r2, #0x5a
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r4, r2]
	adds r0, #0xb4
	movs r1, #1
	bl FUN_020200FC
	ldr r1, _021E7800 @ =0x0000343C
	strb r0, [r5, r1]
	ldr r0, [r5]
	movs r1, #4
	bl FUN_0201EFBC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E77F4: .4byte 0x000003E1
_021E77F8: .4byte 0x0000343E
_021E77FC: .4byte 0x0001020F
_021E7800: .4byte 0x0000343C
	thumb_func_end ov51_021E77A0

	thumb_func_start ov51_021E7804
ov51_021E7804: @ 0x021E7804
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, [r4]
	movs r1, #0x1a
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _021E7864 @ =0x000003A5
	movs r2, #0xf
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r1, [r0, #0x10]
	movs r1, #6
	strb r1, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	bics r1, r2
	ldr r2, _021E7868 @ =0x0000310C
	ldr r2, [r4, r2]
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	movs r2, #0xf
	ands r2, r3
	orrs r1, r2
	strb r1, [r0, #0x12]
	ldrb r2, [r0, #0x12]
	movs r1, #0xf0
	bics r2, r1
	strb r2, [r0, #0x12]
	movs r0, #0xcf
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl FUN_020166FC
	ldr r0, [r4]
	movs r1, #4
	bl FUN_0201EFBC
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_021E7864: .4byte 0x000003A5
_021E7868: .4byte 0x0000310C
	thumb_func_end ov51_021E7804

	thumb_func_start ov51_021E786C
ov51_021E786C: @ 0x021E786C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xcf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r6, r1, #0
	bl FUN_020168F4
	cmp r0, #1
	beq _021E7886
	cmp r0, #2
	beq _021E788A
	b _021E788E
_021E7886:
	movs r4, #1
	b _021E7894
_021E788A:
	movs r4, #0
	b _021E7894
_021E788E:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021E7894:
	movs r0, #0xcf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_020169C0
	ldr r1, _021E78CC @ =0x0000310C
	str r0, [r5, r1]
	movs r0, #0xcf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_020169CC
	cmp r4, #0
	beq _021E78B4
	cmp r6, #0
	beq _021E78C6
_021E78B4:
	adds r0, r5, #0
	adds r0, #0xb4
	movs r1, #0
	bl FUN_0200E9BC
	ldr r0, [r5]
	movs r1, #4
	bl FUN_0201EFBC
_021E78C6:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_021E78CC: .4byte 0x0000310C
	thumb_func_end ov51_021E786C

	thumb_func_start ov51_021E78D0
ov51_021E78D0: @ 0x021E78D0
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #1
	bne _021E78E8
	adds r0, #0xd4
	bl FUN_0201D8E4
	adds r4, #0xc4
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
_021E78E8:
	adds r0, #0xd4
	bl FUN_0201D5C8
	adds r4, #0xc4
	adds r0, r4, #0
	bl FUN_0201D5C8
	pop {r4, pc}
	thumb_func_end ov51_021E78D0

	thumb_func_start ov51_021E78F8
ov51_021E78F8: @ 0x021E78F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	movs r2, #1
	lsls r2, r2, #0x1a
	str r0, [sp, #0x14]
	ldr r0, [r2]
	ldr r1, _021E7AD8 @ =0xFFCFFFEF
	adds r3, r0, #0
	ldr r0, _021E7ADC @ =0x00200010
	ands r3, r1
	orrs r0, r3
	str r0, [r2]
	ldr r2, _021E7AE0 @ =0x04001000
	ldr r0, [r2]
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r2]
	bl ov51_021E7D68
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x19
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	ldr r1, [sp, #0x14]
	movs r0, #0x21
	adds r1, r1, #4
	movs r2, #0x19
	bl FUN_02009F40
	ldr r1, [sp, #0x14]
	movs r2, #0xe
	str r0, [r1]
	adds r0, r1, #0
	adds r0, r0, #4
	movs r1, #0
	lsls r2, r2, #0x10
	bl FUN_02009FC8
	movs r7, #0x4f
	ldr r4, _021E7AE4 @ =0x021E7FB8
	ldr r5, [sp, #0x14]
	movs r6, #0
	lsls r7, r7, #2
_021E7964:
	ldrb r0, [r4]
	adds r1, r6, #0
	movs r2, #0x19
	bl FUN_0200A090
	movs r1, #0x4b
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldrb r0, [r4]
	adds r1, r6, #0
	movs r2, #0x19
	bl FUN_0200A090
	str r0, [r5, r7]
	adds r6, r6, #1
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r6, #4
	blt _021E7964
	ldr r0, _021E7AE8 @ =0x021E7FBC
	ldr r3, _021E7AEC @ =0x021E7FC4
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [sp, #0x24]
	movs r5, #0
	str r0, [sp, #0x28]
	add r2, sp, #0x1c
	movs r1, #8
_021E799C:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _021E799C
	ldr r4, [sp, #0x14]
	add r7, sp, #0x24
	add r6, sp, #0x1c
_021E79AE:
	str r5, [sp]
	ldr r0, [r7]
	movs r1, #0x31
	str r0, [sp, #4]
	movs r0, #0x19
	str r0, [sp, #8]
	movs r0, #0x4b
	lsls r0, r0, #2
	ldrb r2, [r6]
	ldr r0, [r4, r0]
	movs r3, #0
	bl FUN_0200A1D8
	movs r1, #0x53
	lsls r1, r1, #2
	str r0, [r4, r1]
	str r5, [sp]
	ldr r0, [r7]
	movs r3, #0
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x19
	str r0, [sp, #0xc]
	adds r0, r1, #0
	subs r0, #0x1c
	ldrb r2, [r6, #1]
	ldr r0, [r4, r0]
	movs r1, #0x31
	bl FUN_0200A234
	movs r1, #0x15
	lsls r1, r1, #4
	str r0, [r4, r1]
	str r5, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x19
	str r0, [sp, #8]
	adds r0, r1, #0
	subs r0, #0x1c
	ldrb r2, [r6, #2]
	ldr r0, [r4, r0]
	movs r1, #0x31
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x55
	lsls r1, r1, #2
	str r0, [r4, r1]
	str r5, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x19
	str r0, [sp, #8]
	adds r0, r1, #0
	subs r0, #0x1c
	ldrb r2, [r6, #3]
	ldr r0, [r4, r0]
	movs r1, #0x31
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x56
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0xc
	ldr r0, [r4, r0]
	bl FUN_0200ACF0
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200AF94
	adds r5, r5, #1
	adds r7, r7, #4
	adds r6, r6, #4
	adds r4, #0x10
	cmp r5, #2
	blt _021E79AE
	ldr r4, _021E7AF0 @ =0x021E7FDC
	add r3, sp, #0x2c
	movs r2, #8
_021E7A58:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E7A58
	movs r0, #0x31
	movs r1, #0x19
	bl FUN_02007688
	str r0, [sp, #0x18]
	movs r1, #0x8e
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	movs r4, #0
	adds r7, r0, r1
_021E7A74:
	ldr r0, [sp, #0x14]
	lsls r6, r4, #2
	add r1, sp, #0x2c
	adds r5, r0, r6
	ldr r0, [sp, #0x18]
	ldr r1, [r1, r6]
	movs r2, #0x19
	bl FUN_0200771C
	movs r1, #0x7e
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E7AAE
	adds r1, r7, r6
	blx FUN_020B7140
	cmp r0, #0
	bne _021E7AB2
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0201AB0C
	bl GF_AssertFail
	b _021E7AB2
_021E7AAE:
	bl GF_AssertFail
_021E7AB2:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x10
	blo _021E7A74
	ldr r0, [sp, #0x18]
	bl FUN_0200770C
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	nop
_021E7AD8: .4byte 0xFFCFFFEF
_021E7ADC: .4byte 0x00200010
_021E7AE0: .4byte 0x04001000
_021E7AE4: .4byte 0x021E7FB8
_021E7AE8: .4byte 0x021E7FBC
_021E7AEC: .4byte 0x021E7FC4
_021E7AF0: .4byte 0x021E7FDC
	thumb_func_end ov51_021E78F8

	thumb_func_start ov51_021E7AF4
ov51_021E7AF4: @ 0x021E7AF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x88
	str r1, [sp, #0x2c]
	movs r1, #0
	adds r5, r0, #0
	str r2, [sp, #0x30]
	movs r2, #0x4b
	str r1, [sp]
	subs r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #1
	lsls r2, r2, #2
	str r0, [sp, #0x10]
	ldr r0, [r5, r2]
	adds r3, r1, #0
	str r0, [sp, #0x14]
	adds r0, r2, #4
	ldr r0, [r5, r0]
	str r0, [sp, #0x18]
	adds r0, r2, #0
	adds r0, #8
	ldr r0, [r5, r0]
	adds r2, #0xc
	str r0, [sp, #0x1c]
	ldr r0, [r5, r2]
	adds r2, r1, #0
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	add r0, sp, #0x64
	bl FUN_02009D48
	ldr r0, [r5]
	movs r7, #0
	str r0, [sp, #0x34]
	add r0, sp, #0x64
	str r0, [sp, #0x38]
	movs r0, #1
	lsls r0, r0, #0xc
	str r7, [sp, #0x3c]
	str r7, [sp, #0x40]
	str r7, [sp, #0x44]
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	str r0, [sp, #0x50]
	add r0, sp, #0x34
	strh r7, [r0, #0x20]
	movs r0, #2
	str r0, [sp, #0x58]
	movs r0, #1
	str r0, [sp, #0x5c]
	movs r0, #0x19
	str r0, [sp, #0x60]
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _021E7B6A
	movs r7, #0x28
_021E7B6A:
	ldr r6, _021E7BCC @ =0x021E801C
	movs r4, #0
_021E7B6E:
	ldr r0, [r6]
	lsls r0, r0, #0xc
	str r0, [sp, #0x3c]
	ldr r0, [r6, #4]
	adds r0, r7, r0
	lsls r0, r0, #0xc
	str r0, [sp, #0x40]
	add r0, sp, #0x34
	bl FUN_02024624
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_020248F0
	ldr r0, [sp, #0x2c]
	ldrb r0, [r0, r4]
	cmp r0, #0
	beq _021E7BB0
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _021E7BBC
	cmp r4, #7
	ble _021E7BBC
_021E7BB0:
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
_021E7BBC:
	adds r4, r4, #1
	adds r6, #8
	adds r5, r5, #4
	cmp r4, #0x10
	blt _021E7B6E
	add sp, #0x88
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7BCC: .4byte 0x021E801C
	thumb_func_end ov51_021E7AF4

	thumb_func_start ov51_021E7BD0
ov51_021E7BD0: @ 0x021E7BD0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x80
	movs r1, #1
	adds r5, r0, #0
	str r1, [sp]
	subs r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r3, #0x4f
	str r1, [sp, #0x10]
	lsls r3, r3, #2
	ldr r2, [r5, r3]
	str r2, [sp, #0x14]
	adds r2, r3, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	adds r2, r3, #0
	adds r2, #8
	ldr r2, [r5, r2]
	adds r3, #0xc
	str r2, [sp, #0x1c]
	ldr r2, [r5, r3]
	adds r3, r1, #0
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x5c
	adds r2, r1, #0
	bl FUN_02009D48
	ldr r0, [r5]
	movs r6, #0
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	movs r0, #1
	lsls r0, r0, #0xc
	str r6, [sp, #0x34]
	str r6, [sp, #0x38]
	str r6, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r6, [r0, #0x20]
	movs r0, #2
	str r0, [sp, #0x54]
	movs r0, #0x19
	ldr r4, _021E7C9C @ =0x021E80A4
	ldr r7, _021E7CA0 @ =0x021E80A0
	str r6, [sp, #0x50]
	str r0, [sp, #0x58]
_021E7C3C:
	ldrb r0, [r4]
	lsls r0, r0, #0xc
	str r0, [sp, #0x34]
	ldrb r0, [r4, #1]
	lsls r1, r0, #0xc
	movs r0, #0xe
	lsls r0, r0, #0x10
	adds r0, r1, r0
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl FUN_02024624
	movs r1, #0x1f
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x1f
	lsls r0, r0, #4
	ldrb r1, [r7]
	ldr r0, [r5, r0]
	bl FUN_020248F0
	movs r0, #0x1f
	lsls r0, r0, #4
	movs r1, #2
	ldr r0, [r5, r0]
	subs r1, r1, r6
	bl FUN_02024ADC
	movs r0, #0x1f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	adds r6, r6, #1
	adds r4, r4, #2
	adds r5, r5, #4
	adds r7, r7, #1
	cmp r6, #2
	blt _021E7C3C
	add sp, #0x80
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7C9C: .4byte 0x021E80A4
_021E7CA0: .4byte 0x021E80A0
	thumb_func_end ov51_021E7BD0

	thumb_func_start ov51_021E7CA4
ov51_021E7CA4: @ 0x021E7CA4
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0x7e
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_021E7CAE:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_0201AB0C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x10
	blo _021E7CAE
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200AEB0
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200AEB0
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200B0A8
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200B0A8
	movs r7, #0x4f
	movs r4, #0
	lsls r7, r7, #2
_021E7CF0:
	lsls r0, r4, #2
	adds r6, r5, r0
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200A0D0
	ldr r0, [r6, r7]
	bl FUN_0200A0D0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _021E7CF0
	movs r2, #3
	adds r0, r5, #4
	movs r1, #0
	lsls r2, r2, #0x12
	bl FUN_02009FC8
	ldr r0, [r5]
	bl FUN_02024504
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E7D40 @ =0xFFCFFFEF
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r2]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7D40: .4byte 0xFFCFFFEF
	thumb_func_end ov51_021E7CA4

	thumb_func_start ov51_021E7D44
ov51_021E7D44: @ 0x021E7D44
	push {r4, r5, r6, lr}
	adds r6, r3, #0
	movs r3, #0x1f
	lsls r3, r3, #4
	lsls r4, r1, #2
	adds r5, r0, r3
	ldr r0, [r5, r4]
	adds r1, r2, #0
	bl FUN_020248F0
	ldr r0, [r5, r4]
	bl FUN_02024964
	ldr r0, [r5, r4]
	adds r1, r6, #0
	bl FUN_02024830
	pop {r4, r5, r6, pc}
	thumb_func_end ov51_021E7D44

	thumb_func_start ov51_021E7D68
ov51_021E7D68: @ 0x021E7D68
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E7DA0 @ =0x021E7FCC
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_020215A0
	movs r0, #2
	movs r1, #0x19
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	movs r0, #0x19
	bl FUN_0200B2E0
	movs r0, #0x19
	bl FUN_0200B2E8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E7DA0: .4byte 0x021E7FCC
	thumb_func_end ov51_021E7D68

	thumb_func_start ov51_021E7DA4
ov51_021E7DA4: @ 0x021E7DA4
	movs r2, #0
	movs r1, #0xff
_021E7DA8:
	strb r2, [r0]
	strb r1, [r0, #1]
	adds r2, r2, #1
	adds r0, r0, #2
	cmp r2, #4
	blt _021E7DA8
	bx lr
	.align 2, 0
	thumb_func_end ov51_021E7DA4

	.rodata

_021E7DB8:
	.byte 0xA8, 0xBF, 0xBF, 0xFF, 0xA8, 0xBF, 0x00, 0x70
	.byte 0x00, 0xA8, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x1D, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x1E, 0x06
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4C, 0x00, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00, 0x45, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00
	.byte 0x4A, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x00
	.byte 0x4D, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x47, 0x00, 0x00, 0x00
	.byte 0x3F, 0x00, 0x00, 0x00, 0x4B, 0x00, 0x00, 0x00, 0x07, 0x02, 0x03, 0x0C, 0x02, 0x0F, 0x81, 0x00
	.byte 0x07, 0x11, 0x03, 0x0D, 0x02, 0x0F, 0x99, 0x00, 0x07, 0x02, 0x06, 0x11, 0x02, 0x0F, 0xB3, 0x00
	.byte 0x07, 0x02, 0x09, 0x11, 0x02, 0x0F, 0xD5, 0x00, 0x07, 0x02, 0x0D, 0x11, 0x02, 0x0F, 0xF7, 0x00
	.byte 0x07, 0x02, 0x10, 0x1C, 0x02, 0x0F, 0x19, 0x01, 0x07, 0x02, 0x12, 0x1C, 0x02, 0x0F, 0x51, 0x01
	.byte 0x07, 0x02, 0x01, 0x1C, 0x04, 0x0F, 0xC1, 0x00, 0x07, 0x02, 0x06, 0x1C, 0x02, 0x0F, 0x31, 0x01
	.byte 0x07, 0x02, 0x08, 0x1C, 0x02, 0x0F, 0x69, 0x01, 0x07, 0x02, 0x0A, 0x1C, 0x02, 0x0F, 0xA1, 0x01
	.byte 0x04, 0x02, 0x01, 0x1B, 0x04, 0x0E, 0x39, 0x03, 0x04, 0x01, 0x15, 0x10, 0x03, 0x0F, 0x09, 0x03
	.byte 0x04, 0x19, 0x15, 0x06, 0x03, 0x0F, 0xF7, 0x02, 0x01, 0x02, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x2E, 0x1E, 0x3A, 0x3B, 0x2D, 0x1D, 0x38, 0x39, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00
	.byte 0x25, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x58, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x58, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x88, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x88, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0xB0, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0xB0, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00

	.data

_021E80A0:
	.byte 0x00, 0x04, 0x00, 0x00, 0xC0, 0xA8, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x021E80C0
