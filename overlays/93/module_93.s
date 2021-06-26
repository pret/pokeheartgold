
	thumb_func_start ov93_0225C540
ov93_0225C540: @ 0x0225C540
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x75
	lsls r2, r0, #0x11
	bl FUN_0201A910
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #0x75
	bl FUN_02007280
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x40
	blx FUN_020D4994
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov93_0225C6D8
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov93_0225C540

	thumb_func_start ov93_0225C574
ov93_0225C574: @ 0x0225C574
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	bl FUN_02007290
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_020072A4
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov93_0225C730
	cmp r0, #1
	bne _0225C596
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225C596:
	ldr r0, [r4]
	cmp r0, #8
	bls _0225C59E
	b _0225C6B0
_0225C59E:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225C5AA: @ jump table
	.2byte _0225C5BC - _0225C5AA - 2 @ case 0
	.2byte _0225C5D8 - _0225C5AA - 2 @ case 1
	.2byte _0225C5F4 - _0225C5AA - 2 @ case 2
	.2byte _0225C610 - _0225C5AA - 2 @ case 3
	.2byte _0225C62C - _0225C5AA - 2 @ case 4
	.2byte _0225C654 - _0225C5AA - 2 @ case 5
	.2byte _0225C67A - _0225C5AA - 2 @ case 6
	.2byte _0225C690 - _0225C5AA - 2 @ case 7
	.2byte _0225C6B0 - _0225C5AA - 2 @ case 8
_0225C5BC:
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x31
	strb r1, [r0]
	ldr r0, _0225C6B8 @ =0x02262A08
	adds r1, r5, #0
	movs r2, #0x75
	bl FUN_0200724C
	str r0, [r5, #0x28]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C5D8:
	ldr r0, [r5, #0x28]
	bl FUN_020072A8
	cmp r0, #1
	bne _0225C6B4
	ldr r0, [r5, #0x28]
	bl FUN_02007278
	movs r0, #0
	str r0, [r5, #0x28]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C5F4:
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0x31
	strb r1, [r0]
	ldr r0, _0225C6BC @ =_022629F8
	adds r1, r5, #0
	movs r2, #0x75
	bl FUN_0200724C
	str r0, [r5, #0x28]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C610:
	ldr r0, [r5, #0x28]
	bl FUN_020072A8
	cmp r0, #1
	bne _0225C6B4
	ldr r0, [r5, #0x28]
	bl FUN_02007278
	movs r0, #0
	str r0, [r5, #0x28]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C62C:
	adds r6, #0x38
	ldrb r0, [r6]
	cmp r0, #0
	beq _0225C638
	bl FUN_021E6A4C
_0225C638:
	adds r0, r5, #0
	movs r1, #2
	adds r0, #0x31
	strb r1, [r0]
	ldr r0, _0225C6B8 @ =0x02262A08
	adds r1, r5, #0
	movs r2, #0x75
	bl FUN_0200724C
	str r0, [r5, #0x28]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C654:
	ldr r0, [r5, #0x28]
	bl FUN_020072A8
	cmp r0, #1
	bne _0225C6B4
	ldr r0, [r5, #0x28]
	bl FUN_02007278
	movs r1, #0
	str r1, [r5, #0x28]
	ldr r0, [r5, #0x38]
	cmp r0, #1
	bne _0225C672
	str r1, [r4]
	b _0225C6B4
_0225C672:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C67A:
	movs r0, #0
	movs r1, #1
	bl FUN_020398D4
	movs r0, #0xde
	bl FUN_02037AC0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C690:
	movs r0, #0xde
	bl FUN_02037B38
	cmp r0, #1
	beq _0225C6A8
	bl FUN_02037454
	adds r5, r0, #0
	bl FUN_020347A0
	cmp r5, r0
	bge _0225C6B4
_0225C6A8:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C6B0:
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225C6B4:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225C6B8: .4byte 0x02262A08
_0225C6BC: .4byte _022629F8
	thumb_func_end ov93_0225C574

	thumb_func_start ov93_0225C6C0
ov93_0225C6C0: @ 0x0225C6C0
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02007290
	adds r0, r4, #0
	bl FUN_02007294
	movs r0, #0x75
	bl FUN_0201A9C4
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov93_0225C6C0

	thumb_func_start ov93_0225C6D8
ov93_0225C6D8: @ 0x0225C6D8
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	bl FUN_0203769C
	movs r5, #0
	adds r4, r5, #0
_0225C6E6:
	adds r0, r4, #0
	bl FUN_02034818
	cmp r0, #0
	beq _0225C6FA
	adds r0, r6, r5
	adds r0, #0x2c
	strb r4, [r0]
	adds r5, r5, #1
	b _0225C702
_0225C6FA:
	adds r1, r6, r4
	adds r1, #0x2c
	movs r0, #0xff
	strb r0, [r1]
_0225C702:
	adds r4, r4, #1
	cmp r4, #4
	blt _0225C6E6
	adds r0, r6, #0
	adds r0, #0x30
	strb r5, [r0]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	strb r1, [r0]
	str r7, [sp]
	adds r1, r7, #0
	adds r1, #0x39
	ldr r2, [r7, #0x34]
	adds r7, #0x38
	ldrb r1, [r1]
	ldrb r3, [r7]
	adds r0, r6, #0
	bl FUN_02258800
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov93_0225C6D8

	thumb_func_start ov93_0225C730
ov93_0225C730: @ 0x0225C730
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #0
	bne _0225C74E
	bl FUN_02258B54
	cmp r0, #1
	bne _0225C74E
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x3d
	strb r1, [r0]
_0225C74E:
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225C762
	ldr r0, [r4, #0x28]
	cmp r0, #0
	bne _0225C762
	movs r0, #1
	pop {r4, pc}
_0225C762:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov93_0225C730

	thumb_func_start ov93_0225C768
ov93_0225C768: @ 0x0225C768
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r1, [r0]
	ldr r2, _0225CA54 @ =0xFFFFE0FF
	ands r1, r2
	str r1, [r0]
	ldr r1, _0225CA58 @ =0x04001000
	ldr r3, [r1]
	ands r2, r3
	str r2, [r1]
	ldr r3, [r0]
	ldr r2, _0225CA5C @ =0xFFFF1FFF
	ands r3, r2
	str r3, [r0]
	ldr r3, [r1]
	adds r0, #0x50
	ands r2, r3
	str r2, [r1]
	movs r3, #0x10
	movs r1, #1
	movs r2, #0x3f
	str r3, [sp]
	blx FUN_020CF15C
	movs r0, #3
	str r0, [sp]
	ldr r0, _0225CA60 @ =0x04001050
	movs r1, #8
	movs r2, #0x1f
	movs r3, #0xd
	blx FUN_020CF15C
	ldr r1, _0225CA64 @ =0x00003850
	adds r0, r4, #0
	movs r2, #0x75
	bl FUN_02007280
	ldr r2, _0225CA64 @ =0x00003850
	adds r5, r0, #0
	movs r1, #0
	blx FUN_020D4994
	adds r0, r5, #0
	adds r0, #0xa8
	movs r1, #0x75
	movs r2, #0x20
	bl FUN_0201AC14
	movs r0, #0x75
	bl ov93_0225CF14
	adds r1, r5, #0
	adds r1, #0x98
	str r0, [r1]
	adds r0, r4, #0
	bl FUN_020072A4
	str r0, [r5]
	adds r0, r5, #0
	bl ov93_022626FC
	movs r0, #0x75
	bl FUN_020030E8
	adds r1, r5, #0
	adds r1, #0x8c
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02003B50
	adds r0, r5, #0
	adds r0, #0x8c
	movs r2, #2
	ldr r0, [r0]
	movs r1, #0
	lsls r2, r2, #8
	movs r3, #0x75
	bl FUN_02003120
	adds r0, r5, #0
	adds r0, #0x8c
	movs r1, #1
	ldr r0, [r0]
	lsls r2, r1, #9
	movs r3, #0x75
	bl FUN_02003120
	adds r0, r5, #0
	adds r0, #0x8c
	movs r2, #7
	ldr r0, [r0]
	movs r1, #2
	lsls r2, r2, #6
	movs r3, #0x75
	bl FUN_02003120
	adds r0, r5, #0
	adds r0, #0x8c
	movs r2, #2
	ldr r0, [r0]
	movs r1, #3
	lsls r2, r2, #8
	movs r3, #0x75
	bl FUN_02003120
	movs r0, #0x75
	bl FUN_0201AC88
	str r0, [r5, #0x2c]
	movs r0, #0x40
	movs r1, #0x75
	bl FUN_0202055C
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	ldr r0, [r5, #0x2c]
	bl ov93_0225D1D8
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	adds r0, r5, #0
	bl ov93_0225CFC0
	movs r0, #0x75
	bl FUN_0200CF18
	ldr r1, _0225CA68 @ =0x02262AA8
	ldr r2, _0225CA6C @ =0x02262A7C
	movs r3, #0x20
	str r0, [r5, #0x24]
	bl FUN_0200CF70
	ldr r1, _0225CA70 @ =0x00100010
	movs r0, #1
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	ldr r0, [r5, #0x24]
	bl FUN_0200CF38
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	movs r2, #0xe0
	bl FUN_0200CFF4
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, _0225CA74 @ =0x02262A90
	bl FUN_0200D3F8
	ldr r0, [r5, #0x24]
	bl FUN_0200CF6C
	movs r2, #0x16
	movs r1, #0
	lsls r2, r2, #0x10
	bl FUN_02009FC8
	adds r0, r5, #0
	bl ov93_0225D674
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xc
	movs r3, #0x75
	bl FUN_0200BAF8
	adds r1, r5, #0
	adds r1, #0x80
	str r0, [r1]
	movs r0, #0x75
	bl FUN_0200BD08
	adds r1, r5, #0
	adds r1, #0x84
	str r0, [r1]
	movs r0, #5
	lsls r0, r0, #6
	movs r1, #0x75
	bl FUN_02026354
	adds r1, r5, #0
	adds r1, #0x88
	str r0, [r1]
	movs r0, #0x13
	movs r1, #0x75
	bl FUN_02013534
	adds r1, r5, #0
	adds r1, #0x90
	str r0, [r1]
	ldr r1, _0225CA78 @ =0x00001468
	adds r0, r5, #0
	adds r1, r5, r1
	bl ov93_02261310
	movs r0, #0xc9
	movs r1, #0x75
	bl FUN_02007688
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov93_0225DB2C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov93_0225DBC8
	adds r0, r5, #0
	bl ov93_0225D380
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov93_0225D78C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov93_0225DA40
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov93_0225DD2C
	adds r0, r4, #0
	bl FUN_0200770C
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xe0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #0x10
	movs r2, #7
	movs r3, #0x75
	bl FUN_02003200
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x50
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #0x10
	movs r2, #7
	movs r3, #0x75
	bl FUN_02003200
	adds r0, r5, #0
	bl ov93_0225D4EC
	adds r0, r5, #0
	movs r1, #0
	bl ov93_0225D5AC
	adds r0, r5, #0
	bl ov93_0225D468
	bl FUN_0203A880
	adds r0, r5, #0
	bl ov93_0225E7B0
	adds r1, r5, #0
	adds r1, #0xd4
	str r0, [r1]
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x75
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0x1b
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, _0225CA7C @ =ov93_0225D07C
	ldr r2, _0225CA80 @ =0x0000EA60
	adds r1, r5, #0
	bl FUN_0200E320
	adds r1, r5, #0
	adds r1, #0x94
	str r0, [r1]
	ldr r0, _0225CA84 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	bl FUN_02022D24
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #1
	bl FUN_02002B50
	movs r0, #0
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B8C
	ldr r0, [r5, #0x28]
	bl FUN_0200E2B0
	movs r1, #0x75
	bl FUN_02258BD4
	str r0, [r5, #0x1c]
	bl FUN_02258C74
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x8c
	lsls r2, r2, #0x14
	ldr r0, [r0]
	movs r1, #2
	lsrs r2, r2, #0x10
	movs r3, #0x60
	bl FUN_020032A4
	ldr r0, _0225CA88 @ =ov93_0225CEA0
	adds r1, r5, #0
	bl FUN_0201A0FC
	ldr r0, [r5]
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225CA4C
	movs r0, #0x75
	bl FUN_021E69A8
_0225CA4C:
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0225CA54: .4byte 0xFFFFE0FF
_0225CA58: .4byte 0x04001000
_0225CA5C: .4byte 0xFFFF1FFF
_0225CA60: .4byte 0x04001050
_0225CA64: .4byte 0x00003850
_0225CA68: .4byte 0x02262AA8
_0225CA6C: .4byte 0x02262A7C
_0225CA70: .4byte 0x00100010
_0225CA74: .4byte 0x02262A90
_0225CA78: .4byte 0x00001468
_0225CA7C: .4byte ov93_0225D07C
_0225CA80: .4byte 0x0000EA60
_0225CA84: .4byte 0x021D116C
_0225CA88: .4byte ov93_0225CEA0
	thumb_func_end ov93_0225C768

	thumb_func_start ov93_0225CA8C
ov93_0225CA8C: @ 0x0225CA8C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r1, [r4]
	adds r2, r1, #0
	adds r2, #0x3d
	ldrb r2, [r2]
	cmp r2, #1
	bne _0225CAF6
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225CAB2
	cmp r0, #1
	b _0225CAE0
_0225CAB2:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0225CABE
	bl FUN_0200FB70
_0225CABE:
	movs r0, #0
	bl FUN_0200FC20
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0225CCE0 @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	adds r1, #0x3e
	adds r0, r0, #1
	strb r0, [r1]
	b _0225CAF0
_0225CAE0:
	adds r0, r1, #0
	bl FUN_02258B98
	cmp r0, #1
	bne _0225CAF0
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0225CAF0:
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_0225CAF6:
	ldr r2, [r5]
	cmp r2, #6
	bhi _0225CB60
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0225CB08: @ jump table
	.2byte _0225CB16 - _0225CB08 - 2 @ case 0
	.2byte _0225CB26 - _0225CB08 - 2 @ case 1
	.2byte _0225CB34 - _0225CB08 - 2 @ case 2
	.2byte _0225CB46 - _0225CB08 - 2 @ case 3
	.2byte _0225CB56 - _0225CB08 - 2 @ case 4
	.2byte _0225CB6E - _0225CB08 - 2 @ case 5
	.2byte _0225CCBA - _0225CB08 - 2 @ case 6
_0225CB16:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0225CB60
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225CCC8
_0225CB26:
	movs r0, #0xd3
	bl FUN_02037AC0
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225CCC8
_0225CB34:
	movs r0, #0xd3
	bl FUN_02037B38
	cmp r0, #1
	bne _0225CB60
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225CCC8
_0225CB46:
	bl ov93_022627A4
	cmp r0, #1
	bne _0225CB60
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225CCC8
_0225CB56:
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r2, [r4, #8]
	cmp r2, r1
	bhs _0225CB62
_0225CB60:
	b _0225CCC8
_0225CB62:
	bl ov93_0225E10C
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225CCC8
_0225CB6E:
	movs r1, #0xbf
	lsls r1, r1, #6
	ldr r1, [r4, r1]
	cmp r1, #1
	bne _0225CB9A
	bl ov93_02262250
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x75
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0x1a
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
_0225CB9A:
	adds r0, r4, #0
	bl ov93_0225E764
	ldr r0, [r4, #0x20]
	cmp r0, #7
	bhi _0225CC78
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225CBB2: @ jump table
	.2byte _0225CC78 - _0225CBB2 - 2 @ case 0
	.2byte _0225CBC2 - _0225CBB2 - 2 @ case 1
	.2byte _0225CC0E - _0225CBB2 - 2 @ case 2
	.2byte _0225CC28 - _0225CBB2 - 2 @ case 3
	.2byte _0225CC34 - _0225CBB2 - 2 @ case 4
	.2byte _0225CC78 - _0225CBB2 - 2 @ case 5
	.2byte _0225CC5E - _0225CBB2 - 2 @ case 6
	.2byte _0225CC6A - _0225CBB2 - 2 @ case 7
_0225CBC2:
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _0225CCE0 @ =0xFFFF1FFF
	adds r3, r0, #0
	ands r2, r1
	lsrs r1, r0, #0xc
	orrs r1, r2
	str r1, [r0]
	adds r1, r0, #0
	ldr r2, _0225CCE4 @ =0x0000044C
	adds r1, #0x42
	strh r2, [r1]
	adds r1, r0, #0
	ldr r2, _0225CCE8 @ =0x0000A8B8
	adds r1, #0x46
	strh r2, [r1]
	adds r3, #0x48
	ldrh r2, [r3]
	ldr r1, _0225CCEC @ =0xFFFFC0FF
	ands r2, r1
	lsrs r1, r0, #0xe
	orrs r1, r2
	strh r1, [r3]
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r1, #0x3f
	bics r2, r1
	movs r1, #0x1f
	orrs r2, r1
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r0]
	adds r0, r4, #0
	bl ov93_02262310
	movs r0, #2
	str r0, [r4, #0x20]
_0225CC0E:
	ldr r1, _0225CCF0 @ =0x0000174C
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov93_02262374
	cmp r0, #1
	bne _0225CC78
	ldr r0, _0225CCF4 @ =0x00001768
	movs r1, #1
	str r1, [r4, r0]
	movs r0, #0
	str r0, [r4, #0x20]
	b _0225CC78
_0225CC28:
	ldr r0, [r4, #0x1c]
	bl FUN_02258C8C
	movs r0, #4
	str r0, [r4, #0x20]
	b _0225CC78
_0225CC34:
	ldr r0, [r4, #0x1c]
	bl FUN_02258CE0
	cmp r0, #1
	bne _0225CC78
	ldr r0, _0225CCF8 @ =0x00002FB8
	movs r1, #1
	str r1, [r4, r0]
	ldr r0, _0225CCFC @ =0x00001559
	movs r1, #0
	strb r1, [r4, r0]
	movs r0, #5
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl ov93_0225D4B8
	adds r0, r4, #0
	movs r1, #1
	bl ov93_0225D5AC
	b _0225CC78
_0225CC5E:
	ldr r0, [r4, #0x1c]
	bl FUN_02258CB0
	movs r0, #7
	str r0, [r4, #0x20]
	b _0225CC78
_0225CC6A:
	ldr r0, [r4, #0x1c]
	bl FUN_02258CE0
	cmp r0, #1
	bne _0225CC78
	movs r0, #8
	str r0, [r4, #0x20]
_0225CC78:
	adds r0, r4, #0
	bl ov93_0225E4B0
	adds r0, r4, #0
	bl ov93_0225E370
	ldr r0, _0225CD00 @ =0x00002FBC
	ldr r0, [r4, r0]
	cmp r0, #1
	beq _0225CCC8
	adds r0, r4, #0
	bl ov93_0225E300
	cmp r0, #1
	bne _0225CC9C
	ldr r0, _0225CD04 @ =0x00002FC4
	movs r1, #0xd
	str r1, [r4, r0]
_0225CC9C:
	ldr r1, _0225CCF8 @ =0x00002FB8
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _0225CCC8
	subs r0, r1, #4
	ldr r2, [r4, r0]
	ldr r0, _0225CD08 @ =0x00000516
	cmp r2, r0
	bhi _0225CCC8
	subs r0, r1, #4
	ldr r0, [r4, r0]
	adds r2, r0, #1
	subs r0, r1, #4
	str r2, [r4, r0]
	b _0225CCC8
_0225CCBA:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0225CCC8
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0225CCC8:
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl ov93_0225E7AC
	ldr r0, _0225CD0C @ =0x0000384C
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0225CCE0: .4byte 0xFFFF1FFF
_0225CCE4: .4byte 0x0000044C
_0225CCE8: .4byte 0x0000A8B8
_0225CCEC: .4byte 0xFFFFC0FF
_0225CCF0: .4byte 0x0000174C
_0225CCF4: .4byte 0x00001768
_0225CCF8: .4byte 0x00002FB8
_0225CCFC: .4byte 0x00001559
_0225CD00: .4byte 0x00002FBC
_0225CD04: .4byte 0x00002FC4
_0225CD08: .4byte 0x00000516
_0225CD0C: .4byte 0x0000384C
	thumb_func_end ov93_0225CA8C

	thumb_func_start ov93_0225CD10
ov93_0225CD10: @ 0x0225CD10
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, _0225CE94 @ =0x00002FD0
	ldr r1, [r4, r0]
	ldr r0, [r4]
	str r1, [r0, #0x24]
	ldr r0, [r4, #0x1c]
	bl FUN_02258C38
	adds r0, r4, #0
	bl ov93_022602E4
	adds r0, r4, #0
	bl ov93_02260608
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	adds r0, r4, #0
	bl ov93_0225D6E0
	adds r0, r4, #0
	bl ov93_0225D9E8
	adds r0, r4, #0
	bl ov93_0225DAF8
	adds r0, r4, #0
	bl ov93_0225DBC4
	adds r0, r4, #0
	bl ov93_0225DD28
	adds r0, r4, #0
	bl ov93_0225DED0
	adds r1, r4, #0
	adds r1, #0xd4
	ldr r1, [r1]
	adds r0, r4, #0
	bl ov93_0225E860
	adds r5, r4, #0
	movs r6, #0
	adds r5, #0x30
_0225CD72:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r6, r6, #1
	adds r5, #0x10
	cmp r6, #5
	blt _0225CD72
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	ldr r0, [r4, #0x2c]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x2c]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0x2c]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x2c]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4, #0x2c]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [r4, #0x2c]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [r4, #0x2c]
	movs r1, #7
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl FUN_020135AC
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	bl FUN_0200D998
	ldr r0, [r4, #0x24]
	bl FUN_0200D108
	bl FUN_020205AC
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02003150
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02003150
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #2
	bl FUN_02003150
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #3
	bl FUN_02003150
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_02003104
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_0200BDA0
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_0200BB44
	ldr r0, [r4, #0x2c]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl ov93_0225D064
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl FUN_0200E390
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0225CE98 @ =0xFFFF1FFF
	ands r1, r0
	str r1, [r2]
	ldr r2, _0225CE9C @ =0x04001000
	adds r4, #0x98
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	ldr r0, [r4]
	bl ov93_0225CFB8
	bl FUN_02021238
	adds r0, r7, #0
	bl FUN_02007294
	movs r0, #0
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B50
	movs r0, #0
	bl FUN_02002B8C
	bl FUN_0203A914
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225CE94: .4byte 0x00002FD0
_0225CE98: .4byte 0xFFFF1FFF
_0225CE9C: .4byte 0x04001000
	thumb_func_end ov93_0225CD10

	thumb_func_start ov93_0225CEA0
ov93_0225CEA0: @ 0x0225CEA0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0xd4
	ldr r1, [r1]
	bl ov93_0225EA50
	bl FUN_0202061C
	bl FUN_0200D034
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_0200398C
	ldr r0, _0225CF04 @ =0x00001454
	ldrb r1, [r4, r0]
	cmp r1, #1
	bne _0225CED8
	movs r0, #7
	movs r1, #1
	bl FUN_0201BC28
	ldr r0, _0225CF04 @ =0x00001454
	movs r1, #0
	strb r1, [r4, r0]
	b _0225CEEE
_0225CED8:
	adds r0, r0, #1
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _0225CEEE
	movs r0, #7
	movs r1, #0
	bl FUN_0201BC28
	ldr r0, _0225CF08 @ =0x00001455
	movs r1, #0
	strb r1, [r4, r0]
_0225CEEE:
	ldr r0, [r4, #0x2c]
	bl FUN_0201EEB4
	ldr r3, _0225CF0C @ =0x027E0000
	ldr r1, _0225CF10 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_0225CF04: .4byte 0x00001454
_0225CF08: .4byte 0x00001455
_0225CF0C: .4byte 0x027E0000
_0225CF10: .4byte 0x00003FF8
	thumb_func_end ov93_0225CEA0

	thumb_func_start ov93_0225CF14
ov93_0225CF14: @ 0x0225CF14
	push {r3, lr}
	sub sp, #8
	movs r1, #2
	str r1, [sp]
	ldr r1, _0225CF30 @ =ov93_0225CF34
	movs r2, #1
	str r1, [sp, #4]
	movs r1, #0
	adds r3, r1, #0
	bl FUN_02026EB4
	add sp, #8
	pop {r3, pc}
	nop
_0225CF30: .4byte ov93_0225CF34
	thumb_func_end ov93_0225CF14

	thumb_func_start ov93_0225CF34
ov93_0225CF34: @ 0x0225CF34
	push {r3, lr}
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r0, _0225CFA0 @ =0x04000008
	movs r1, #3
	ldrh r2, [r0]
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	strh r1, [r0]
	adds r0, #0x58
	ldrh r2, [r0]
	ldr r1, _0225CFA4 @ =0xFFFFCFFD
	ands r2, r1
	strh r2, [r0]
	adds r2, r1, #2
	ldrh r3, [r0]
	adds r1, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _0225CFA8 @ =0x0000CFFB
	ands r3, r2
	strh r3, [r0]
	ldrh r3, [r0]
	subs r2, #0x1c
	ands r3, r1
	movs r1, #8
	orrs r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	ands r1, r2
	strh r1, [r0]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	blx FUN_020CF82C
	movs r0, #0
	ldr r2, _0225CFAC @ =0x00007FFF
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r1, _0225CFB0 @ =0xBFFF0000
	ldr r0, _0225CFB4 @ =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_0225CFA0: .4byte 0x04000008
_0225CFA4: .4byte 0xFFFFCFFD
_0225CFA8: .4byte 0x0000CFFB
_0225CFAC: .4byte 0x00007FFF
_0225CFB0: .4byte 0xBFFF0000
_0225CFB4: .4byte 0x04000580
	thumb_func_end ov93_0225CF34

	thumb_func_start ov93_0225CFB8
ov93_0225CFB8: @ 0x0225CFB8
	ldr r3, _0225CFBC @ =FUN_02026F54
	bx r3
	.align 2, 0
_0225CFBC: .4byte FUN_02026F54
	thumb_func_end ov93_0225CFB8

	thumb_func_start ov93_0225CFC0
ov93_0225CFC0: @ 0x0225CFC0
	push {r4, lr}
	sub sp, #0x18
	ldr r3, _0225D058 @ =0x02262A38
	adds r4, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0xc
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #0x75
	bl FUN_02023114
	adds r1, r4, #0
	adds r1, #0x9c
	str r0, [r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	movs r1, #0x7b
	str r0, [sp, #8]
	ldr r2, _0225D05C @ =0x02262A18
	ldr r3, _0225D060 @ =0x00000FA4
	add r0, sp, #0xc
	lsls r1, r1, #0xc
	bl FUN_02023254
	adds r2, r4, #0
	adds r2, #0x9c
	movs r0, #1
	movs r1, #0xe1
	ldr r2, [r2]
	lsls r0, r0, #0xc
	lsls r1, r1, #0xe
	bl FUN_02023240
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_0202313C
	movs r0, #0x75
	bl FUN_02023114
	adds r1, r4, #0
	adds r1, #0xa0
	str r0, [r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #5
	str r0, [sp, #8]
	ldr r2, _0225D05C @ =0x02262A18
	ldr r3, _0225D060 @ =0x00000FA4
	add r0, sp, #0xc
	lsls r1, r1, #0x10
	bl FUN_02023254
	adds r4, #0xa0
	movs r0, #1
	movs r1, #0xe1
	ldr r2, [r4]
	lsls r0, r0, #0xc
	lsls r1, r1, #0xe
	bl FUN_02023240
	add sp, #0x18
	pop {r4, pc}
	nop
_0225D058: .4byte 0x02262A38
_0225D05C: .4byte 0x02262A18
_0225D060: .4byte 0x00000FA4
	thumb_func_end ov93_0225CFC0

	thumb_func_start ov93_0225D064
ov93_0225D064: @ 0x0225D064
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_02023120
	adds r4, #0xa0
	ldr r0, [r4]
	bl FUN_02023120
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov93_0225D064

	thumb_func_start ov93_0225D07C
ov93_0225D07C: @ 0x0225D07C
	push {r4, lr}
	sub sp, #0x40
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x34]
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	movs r0, #0
	str r0, [sp, #0x28]
	str r0, [sp, #0x2c]
	str r0, [sp, #0x30]
	add r0, sp, #4
	adds r4, r1, #0
	blx FUN_020CAFEC
	ldr r1, _0225D1B0 @ =0x000015A8
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov93_02262034
	ldr r1, _0225D1B4 @ =0x00001468
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov93_02261354
	ldr r1, _0225D1B8 @ =0x00001560
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov93_02261D1C
	adds r0, r4, #0
	bl ov93_0225FFF8
	ldr r2, _0225D1BC @ =0x00001428
	ldr r1, [r4, #0x2c]
	adds r0, r4, #0
	adds r2, r4, r2
	bl ov93_0225FE80
	adds r0, r4, #0
	bl ov93_02260660
	adds r0, r4, #0
	bl ov93_0225E03C
	adds r0, r4, #0
	bl ov93_02260A30
	bl FUN_02026E48
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_0202313C
	adds r1, r4, #0
	adds r1, #0x9c
	ldr r1, [r1]
	movs r0, #1
	bl FUN_020233D8
	bl FUN_02023154
	movs r0, #0
	ldr r2, _0225D1C0 @ =0xFFFFF000
	adds r1, r0, #0
	adds r3, r0, #0
	blx FUN_020BF034
	ldr r1, _0225D1C4 @ =0x0000739C
	movs r0, #0
	blx FUN_020BF070
	ldr r0, _0225D1C8 @ =0x00007FFF
	movs r2, #0
	adds r1, r0, #0
	blx FUN_020BF084
	ldr r0, _0225D1C8 @ =0x00007FFF
	movs r2, #0
	adds r1, r0, #0
	blx FUN_020BF0A8
	add r0, sp, #0x28
	blx FUN_020BEFD4
	ldr r1, _0225D1CC @ =0x021DA558
	add r0, sp, #4
	blx FUN_020D4928
	ldr r1, _0225D1D0 @ =0x021DA51C
	movs r0, #0xa4
	ldr r2, [r1, #0x7c]
	bics r2, r0
	add r0, sp, #0x34
	str r2, [r1, #0x7c]
	blx FUN_020BF004
	blx FUN_020BEF98
	adds r1, r4, #0
	adds r1, #0xd4
	ldr r1, [r1]
	adds r0, r4, #0
	bl ov93_0225E898
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	ldr r0, _0225D1D4 @ =0x000013B0
	adds r0, r4, r0
	bl FUN_020181EC
	adds r0, r4, #0
	adds r0, #0xe8
	bl FUN_020181EC
	adds r0, r4, #0
	bl ov93_0225E0A4
	movs r2, #1
	movs r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	blx FUN_020C2528
	bl FUN_02026E48
	bl FUN_0201543C
	cmp r0, #0
	ble _0225D18C
	bl FUN_02026E48
_0225D18C:
	bl FUN_02015460
	ldr r0, [r4, #0x28]
	bl FUN_0200D020
	bl FUN_0200D03C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
	ldr r1, [r4, #0x2c]
	movs r0, #0x75
	bl FUN_020399FC
	add sp, #0x40
	pop {r4, pc}
	nop
_0225D1B0: .4byte 0x000015A8
_0225D1B4: .4byte 0x00001468
_0225D1B8: .4byte 0x00001560
_0225D1BC: .4byte 0x00001428
_0225D1C0: .4byte 0xFFFFF000
_0225D1C4: .4byte 0x0000739C
_0225D1C8: .4byte 0x00007FFF
_0225D1CC: .4byte 0x021DA558
_0225D1D0: .4byte 0x021DA51C
_0225D1D4: .4byte 0x000013B0
	thumb_func_end ov93_0225D07C

	thumb_func_start ov93_0225D1D8
ov93_0225D1D8: @ 0x0225D1D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x8c
	adds r5, r0, #0
	bl FUN_02022C54
	ldr r4, _0225D36C @ =0x02262AC8
	add r3, sp, #0x10
	movs r2, #5
_0225D1E8:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0225D1E8
	add r0, sp, #0x10
	bl FUN_02022BE8
	movs r1, #6
	movs r2, #2
	movs r0, #0
	lsls r1, r1, #0x18
	lsls r2, r2, #0x12
	blx FUN_020D47EC
	movs r1, #0x62
	movs r2, #2
	movs r0, #0
	lsls r1, r1, #0x14
	lsls r2, r2, #0x10
	blx FUN_020D47EC
	movs r1, #0x19
	movs r2, #1
	movs r0, #0
	lsls r1, r1, #0x16
	lsls r2, r2, #0x12
	blx FUN_020D47EC
	movs r1, #0x66
	movs r2, #2
	movs r0, #0
	lsls r1, r1, #0x14
	lsls r2, r2, #0x10
	blx FUN_020D47EC
	ldr r4, _0225D370 @ =0x02262A44
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r4, _0225D374 @ =0x02262B40
	add r3, sp, #0x38
	movs r2, #0xa
_0225D248:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0225D248
	ldr r0, [r4]
	movs r1, #1
	str r0, [r3]
	adds r0, r5, #0
	add r2, sp, #0x38
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r5, #0
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	movs r1, #1
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	movs r1, #2
	add r2, sp, #0x54
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #2
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r5, #0
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	movs r1, #3
	add r2, sp, #0x70
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #3
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r5, #0
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201BC8C
	movs r1, #3
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	ldr r1, _0225D378 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	movs r0, #2
	orrs r0, r2
	strh r0, [r1]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r4, #0
	ldr r6, _0225D37C @ =0x02262B94
	adds r7, r4, #0
_0225D2F4:
	cmp r4, #3
	bge _0225D30A
	adds r1, r4, #4
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0201B1E4
	b _0225D31A
_0225D30A:
	adds r1, r4, #4
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	movs r3, #1
	bl FUN_0201B1E4
_0225D31A:
	adds r0, r4, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x75
	bl FUN_0201C1C4
	adds r1, r4, #4
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r1, r4, #4
	lsls r1, r1, #0x18
	movs r2, #0
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r1, r4, #4
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r4, r4, #1
	adds r6, #0x1c
	cmp r4, #4
	blo _0225D2F4
	movs r0, #7
	movs r1, #0
	bl FUN_0201BC28
	add sp, #0x8c
	pop {r4, r5, r6, r7, pc}
	nop
_0225D36C: .4byte 0x02262AC8
_0225D370: .4byte 0x02262A44
_0225D374: .4byte 0x02262B40
_0225D378: .4byte 0x04000008
_0225D37C: .4byte 0x02262B94
	thumb_func_end ov93_0225D1D8

	thumb_func_start ov93_0225D380
ov93_0225D380: @ 0x0225D380
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	movs r0, #3
	lsls r0, r0, #8
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #0x2c]
	adds r1, #0x30
	movs r2, #1
	movs r3, #0xb
	bl FUN_0201D40C
	movs r0, #1
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #0xc5
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #0x2c]
	adds r1, #0x40
	movs r2, #4
	movs r3, #0x12
	bl FUN_0201D40C
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #0xca
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #0x2c]
	adds r1, #0x50
	movs r2, #4
	movs r3, #0x15
	bl FUN_0201D40C
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #0xcf
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #0x2c]
	adds r1, #0x60
	movs r2, #4
	movs r3, #1
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0x40
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x50
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x60
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1c
	str r0, [sp, #4]
	movs r2, #4
	adds r1, r4, #0
	str r2, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	ldr r0, _0225D464 @ =0x00000359
	adds r1, #0x70
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x2c]
	movs r3, #2
	bl FUN_0201D40C
	adds r4, #0x70
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_0225D464: .4byte 0x00000359
	thumb_func_end ov93_0225D380

	thumb_func_start ov93_0225D468
ov93_0225D468: @ 0x0225D468
	push {r3, r4, r5, lr}
	sub sp, #0x10
	movs r2, #0x35
	adds r5, r0, #0
	adds r0, #0x70
	movs r1, #1
	lsls r2, r2, #4
	movs r3, #6
	bl FUN_0200E580
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200BBA0
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	ldr r0, _0225D4B4 @ =0x0001020F
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x70
	adds r2, r4, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r5, #0x70
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225D4B4: .4byte 0x0001020F
	thumb_func_end ov93_0225D468

	thumb_func_start ov93_0225D4B8
ov93_0225D4B8: @ 0x0225D4B8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D4E8 @ =0x000003FF
	movs r1, #4
	movs r3, #1
	bl FUN_0201C8C4
	ldr r0, [r4, #0x2c]
	movs r1, #4
	bl FUN_0201EFBC
	add sp, #0x10
	pop {r4, pc}
	nop
_0225D4E8: .4byte 0x000003FF
	thumb_func_end ov93_0225D4B8

	thumb_func_start ov93_0225D4EC
ov93_0225D4EC: @ 0x0225D4EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	bl FUN_0203769C
	str r0, [sp, #0x10]
	adds r0, r5, #0
	str r0, [sp, #0x18]
	adds r0, #0x30
	movs r4, #0
	str r0, [sp, #0x18]
	b _0225D590
_0225D504:
	ldr r0, [r5]
	ldr r2, [sp, #0x10]
	adds r1, r0, r4
	adds r1, #0x2c
	ldrb r1, [r1]
	cmp r2, r1
	beq _0225D58E
	bl FUN_022588CC
	movs r1, #0x75
	bl FUN_02028F68
	ldr r1, [r5]
	adds r6, r0, #0
	adds r1, r1, r4
	adds r1, #0x2c
	ldrb r1, [r1]
	adds r0, r5, #0
	bl ov93_0225E3C4
	str r0, [sp, #0x14]
	ldr r0, [r5]
	adds r1, r0, r4
	adds r1, #0x2c
	ldrb r1, [r1]
	bl FUN_022588A4
	cmp r0, #1
	bne _0225D542
	ldr r7, _0225D5A0 @ =0x0007080F
	b _0225D544
_0225D542:
	ldr r7, _0225D5A4 @ =0x0001020F
_0225D544:
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsrs r1, r0, #0x1f
	adds r1, r0, r1
	asrs r2, r1, #1
	movs r1, #0x28
	subs r3, r1, r2
	movs r1, #1
	tst r0, r1
	beq _0225D560
	subs r3, r3, #1
_0225D560:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5]
	adds r2, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r1, r0, #2
	ldr r0, _0225D5A8 @ =0x02262A68
	adds r1, r0, r1
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, r1]
	lsls r1, r0, #4
	ldr r0, [sp, #0x18]
	adds r0, r0, r1
	movs r1, #0
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_0201AB0C
_0225D58E:
	adds r4, r4, #1
_0225D590:
	ldr r0, [r5]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r4, r0
	blt _0225D504
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0225D5A0: .4byte 0x0007080F
_0225D5A4: .4byte 0x0001020F
_0225D5A8: .4byte 0x02262A68
	thumb_func_end ov93_0225D4EC

	thumb_func_start ov93_0225D5AC
ov93_0225D5AC: @ 0x0225D5AC
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	cmp r1, #1
	bne _0225D604
	movs r0, #0xd
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D670 @ =0x000003FF
	movs r3, #0
	bl FUN_0201C8C4
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	movs r3, #0x11
	str r3, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D670 @ =0x000003FF
	bl FUN_0201C8C4
	movs r0, #0xd
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D670 @ =0x000003FF
	movs r3, #0x14
	bl FUN_0201C8C4
	b _0225D662
_0225D604:
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #2
	beq _0225D614
	cmp r0, #3
	beq _0225D64A
	b _0225D662
_0225D614:
	movs r0, #0xd
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D670 @ =0x000003FF
	movs r3, #0
	bl FUN_0201C8C4
	movs r0, #0xd
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D670 @ =0x000003FF
	movs r3, #0x14
	bl FUN_0201C8C4
	b _0225D662
_0225D64A:
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	movs r3, #0x11
	str r3, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D670 @ =0x000003FF
	bl FUN_0201C8C4
_0225D662:
	ldr r0, [r4, #0x2c]
	movs r1, #4
	bl FUN_0201EFBC
	add sp, #0x10
	pop {r4, pc}
	nop
_0225D670: .4byte 0x000003FF
	thumb_func_end ov93_0225D5AC

	thumb_func_start ov93_0225D674
ov93_0225D674: @ 0x0225D674
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl FUN_02014DA0
	movs r1, #0x12
	movs r0, #0x75
	lsls r1, r1, #0xa
	bl FUN_0201AA8C
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x75
	str r0, [sp, #4]
	movs r3, #0x12
	ldr r0, _0225D6D8 @ =ov93_0225D744
	ldr r1, _0225D6DC @ =ov93_0225D768
	lsls r3, r3, #0xa
	bl FUN_02014DB4
	adds r1, r4, #0
	adds r1, #0xa4
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_02015524
	adds r2, r0, #0
	movs r0, #1
	movs r1, #0xe1
	lsls r0, r0, #0xc
	lsls r1, r1, #0xe
	bl FUN_02023240
	movs r0, #0xd5
	movs r1, #0
	movs r2, #0x75
	bl FUN_02015264
	adds r4, #0xa4
	adds r1, r0, #0
	ldr r0, [r4]
	movs r2, #0xa
	movs r3, #1
	bl FUN_0201526C
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_0225D6D8: .4byte ov93_0225D744
_0225D6DC: .4byte ov93_0225D768
	thumb_func_end ov93_0225D674

	thumb_func_start ov93_0225D6E0
ov93_0225D6E0: @ 0x0225D6E0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_020154D0
	adds r4, #0xa4
	adds r5, r0, #0
	ldr r0, [r4]
	bl FUN_02014EBC
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov93_0225D6E0

	thumb_func_start ov93_0225D700
ov93_0225D700: @ 0x0225D700
	push {r3, lr}
	adds r3, r0, #0
	cmp r1, #0
	beq _0225D712
	cmp r1, #1
	beq _0225D720
	cmp r1, #2
	beq _0225D72E
	b _0225D73C
_0225D712:
	adds r0, #0xa4
	movs r1, #0
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_02015494
	pop {r3, pc}
_0225D720:
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #1
	movs r2, #0
	bl FUN_02015494
	pop {r3, pc}
_0225D72E:
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #2
	movs r2, #0
	bl FUN_02015494
	pop {r3, pc}
_0225D73C:
	bl FUN_0202551C
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov93_0225D700

	thumb_func_start ov93_0225D744
ov93_0225D744: @ 0x0225D744
	push {r4, lr}
	ldr r3, _0225D764 @ =0x02110924
	movs r2, #0
	ldr r3, [r3]
	blx r3
	adds r4, r0, #0
	bne _0225D756
	bl FUN_0202551C
_0225D756:
	adds r0, r4, #0
	bl FUN_02015354
	lsls r0, r4, #0x10
	lsrs r0, r0, #0xd
	pop {r4, pc}
	nop
_0225D764: .4byte 0x02110924
	thumb_func_end ov93_0225D744

	thumb_func_start ov93_0225D768
ov93_0225D768: @ 0x0225D768
	push {r4, lr}
	ldr r3, _0225D788 @ =0x0211092C
	movs r2, #1
	ldr r3, [r3]
	blx r3
	adds r4, r0, #0
	bne _0225D77A
	bl FUN_0202551C
_0225D77A:
	adds r0, r4, #0
	bl FUN_02015394
	lsls r0, r4, #0x10
	lsrs r0, r0, #0xd
	pop {r4, pc}
	nop
_0225D788: .4byte 0x0211092C
	thumb_func_end ov93_0225D768

	thumb_func_start ov93_0225D78C
ov93_0225D78C: @ 0x0225D78C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r5, r0, #0
	str r1, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225D9C4 @ =0x00002713
	str r1, [sp, #0x2c]
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r2, [r5, #0x24]
	ldr r3, [r5, #0x28]
	movs r1, #2
	bl FUN_0200D68C
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0x1e
	subs r0, r1, r0
	lsrs r0, r0, #1
	adds r4, r0, #6
	adds r2, r5, #0
	ldr r3, _0225D9C8 @ =0x0000169C
	str r6, [sp]
	movs r0, #0
	ldr r1, _0225D9CC @ =0x000E0F00
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r1, _0225D9C4 @ =0x00002713
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r1, r4, #0
	adds r1, #0x24
	str r1, [sp, #0x14]
	movs r1, #0xa8
	str r1, [sp, #0x18]
	str r0, [sp, #0x1c]
	movs r0, #1
	str r0, [sp, #0x20]
	movs r0, #0xc
	str r0, [sp, #0x24]
	movs r0, #2
	str r0, [sp, #0x28]
	adds r2, #0x90
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x28]
	ldr r2, [r2]
	adds r3, r5, r3
	bl ov93_02261EB8
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200BBA0
	str r0, [sp, #0x30]
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200BBA0
	str r0, [sp, #0x38]
	movs r0, #0
	str r0, [sp, #0x34]
	ldr r0, _0225D9D0 @ =0x000015AC
	adds r7, r5, r0
	adds r0, #0x14
	adds r6, r5, r0
_0225D840:
	ldr r0, [sp, #0x30]
	adds r2, r5, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0225D9CC @ =0x000E0F00
	adds r2, #0x90
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0225D9C4 @ =0x00002713
	adds r3, r7, #0
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r0, #0xa8
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	movs r0, #3
	str r0, [sp, #0x20]
	movs r0, #0xc
	str r0, [sp, #0x24]
	movs r0, #0xa
	str r0, [sp, #0x28]
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x28]
	ldr r2, [r2]
	bl ov93_02261EB8
	ldr r0, [sp, #0x38]
	adds r2, r5, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0225D9CC @ =0x000E0F00
	adds r2, #0x90
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0225D9C4 @ =0x00002713
	adds r3, r6, #0
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r0, #0xa8
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	movs r0, #3
	str r0, [sp, #0x20]
	movs r0, #0xc
	str r0, [sp, #0x24]
	movs r0, #0xa
	str r0, [sp, #0x28]
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x28]
	ldr r2, [r2]
	bl ov93_02261EB8
	ldr r0, [sp, #0x34]
	adds r4, r4, #6
	adds r0, r0, #1
	adds r7, #0x28
	adds r6, #0x28
	str r0, [sp, #0x34]
	cmp r0, #6
	blt _0225D840
	ldr r0, [sp, #0x30]
	bl FUN_02026380
	ldr r0, [sp, #0x38]
	bl FUN_02026380
	ldr r0, _0225D9D4 @ =0x000015A8
	adds r0, r5, r0
	bl ov93_02261FC8
	adds r0, r5, #0
	bl ov93_02262250
	ldr r0, [sp, #0x2c]
	movs r1, #2
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225D9D8 @ =0x00002714
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r2, [r5, #0x24]
	ldr r3, [r5, #0x28]
	bl FUN_0200D68C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225D9DC @ =0x00002712
	ldr r2, [sp, #0x2c]
	str r0, [sp, #8]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	movs r3, #0x18
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225D9DC @ =0x00002712
	ldr r2, [sp, #0x2c]
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	movs r3, #0x1a
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225D9DC @ =0x00002712
	ldr r2, [sp, #0x2c]
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	movs r3, #0x19
	bl FUN_0200D71C
	adds r0, r5, #0
	bl ov93_02262230
	ldr r1, _0225D9D4 @ =0x000015A8
	str r0, [r5, r1]
	movs r0, #0xc8
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225D9DC @ =0x00002712
	movs r1, #2
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r2, [r5, #0x24]
	ldr r3, [r5, #0x28]
	bl FUN_0200D644
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225D9E0 @ =0x00002711
	movs r2, #0xc8
	str r0, [sp, #8]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	movs r3, #0x15
	bl FUN_0200D4A4
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225D9E0 @ =0x00002711
	movs r2, #0xc8
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	movs r3, #0x16
	bl FUN_0200D6D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225D9E0 @ =0x00002711
	movs r2, #0xc8
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	movs r3, #0x17
	bl FUN_0200D704
	adds r0, r5, #0
	bl ov93_02262344
	ldr r1, _0225D9E4 @ =0x0000174C
	str r0, [r5, r1]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_0225D9C4: .4byte 0x00002713
_0225D9C8: .4byte 0x0000169C
_0225D9CC: .4byte 0x000E0F00
_0225D9D0: .4byte 0x000015AC
_0225D9D4: .4byte 0x000015A8
_0225D9D8: .4byte 0x00002714
_0225D9DC: .4byte 0x00002712
_0225D9E0: .4byte 0x00002711
_0225D9E4: .4byte 0x0000174C
	thumb_func_end ov93_0225D78C

	thumb_func_start ov93_0225D9E8
ov93_0225D9E8: @ 0x0225D9E8
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _0225DA30 @ =0x000015AC
	movs r6, #0
	adds r4, r7, r0
	adds r0, #0x14
	adds r5, r7, r0
_0225D9F6:
	adds r0, r4, #0
	bl ov93_02261FB0
	adds r0, r5, #0
	bl ov93_02261FB0
	adds r6, r6, #1
	adds r4, #0x28
	adds r5, #0x28
	cmp r6, #6
	blt _0225D9F6
	ldr r0, _0225DA34 @ =0x0000169C
	adds r0, r7, r0
	bl ov93_02261FB0
	adds r0, r7, #0
	bl ov93_02262310
	ldr r1, _0225DA38 @ =0x000015A8
	adds r0, r7, #0
	ldr r1, [r7, r1]
	bl ov93_02262338
	ldr r1, _0225DA3C @ =0x0000174C
	adds r0, r7, #0
	ldr r1, [r7, r1]
	bl ov93_02262368
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225DA30: .4byte 0x000015AC
_0225DA34: .4byte 0x0000169C
_0225DA38: .4byte 0x000015A8
_0225DA3C: .4byte 0x0000174C
	thumb_func_end ov93_0225D9E8

	thumb_func_start ov93_0225DA40
ov93_0225DA40: @ 0x0225DA40
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r4, r1, #0
	adds r5, r0, #0
	str r4, [sp]
	movs r0, #0x17
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #9
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	ldr r0, _0225DAE4 @ =0x00002716
	movs r1, #3
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r2, [r5, #0x24]
	ldr r3, [r5, #0x28]
	bl FUN_0200D68C
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _0225DAE8 @ =0x00002714
	adds r2, r4, #0
	str r0, [sp, #8]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	movs r3, #0x14
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225DAE8 @ =0x00002714
	adds r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	movs r3, #0x16
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225DAE8 @ =0x00002714
	adds r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	movs r3, #0x15
	bl FUN_0200D71C
	adds r0, r5, #0
	bl ov93_022609E0
	ldr r1, _0225DAEC @ =0x00001458
	adds r0, r5, #0
	adds r1, r5, r1
	bl ov93_022610B0
	ldr r1, _0225DAF0 @ =0x00001468
	adds r0, r5, #0
	adds r1, r5, r1
	bl ov93_02261164
	ldr r1, _0225DAF4 @ =0x00001560
	adds r0, r5, #0
	adds r1, r5, r1
	bl ov93_02261BBC
	adds r0, r5, #0
	bl ov93_02260CF8
	adds r0, r5, #0
	bl ov93_02260E1C
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_0225DAE4: .4byte 0x00002716
_0225DAE8: .4byte 0x00002714
_0225DAEC: .4byte 0x00001458
_0225DAF0: .4byte 0x00001468
_0225DAF4: .4byte 0x00001560
	thumb_func_end ov93_0225DA40

	thumb_func_start ov93_0225DAF8
ov93_0225DAF8: @ 0x0225DAF8
	push {r4, lr}
	adds r4, r0, #0
	bl ov93_02260A14
	ldr r1, _0225DB20 @ =0x00001458
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov93_0226114C
	ldr r1, _0225DB24 @ =0x00001468
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov93_022612E0
	ldr r1, _0225DB28 @ =0x00001560
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov93_02261C3C
	pop {r4, pc}
	.align 2, 0
_0225DB20: .4byte 0x00001458
_0225DB24: .4byte 0x00001468
_0225DB28: .4byte 0x00001560
	thumb_func_end ov93_0225DAF8

	thumb_func_start ov93_0225DB2C
ov93_0225DB2C: @ 0x0225DB2C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x8c
	adds r4, r1, #0
	ldr r0, [r0]
	movs r1, #0xc9
	movs r2, #4
	movs r3, #0x75
	bl FUN_02003200
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #2
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x75
	str r0, [sp, #0xc]
	movs r1, #3
	ldr r2, [r5, #0x2c]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_02007B68
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	adds r0, r4, #0
	movs r3, #2
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #1
	movs r3, #2
	bl FUN_02007B68
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	adds r5, #0x8c
	str r0, [sp, #4]
	ldr r0, [r5]
	movs r2, #2
	adds r3, r1, #0
	bl FUN_02003D5C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov93_0225DB2C

	thumb_func_start ov93_0225DBC4
ov93_0225DBC4: @ 0x0225DBC4
	bx lr
	.align 2, 0
	thumb_func_end ov93_0225DBC4

	thumb_func_start ov93_0225DBC8
ov93_0225DBC8: @ 0x0225DBC8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0xa0
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x8c
	adds r4, r1, #0
	ldr r0, [r0]
	movs r1, #0xc9
	movs r2, #5
	movs r3, #0x75
	bl FUN_02003200
	movs r0, #1
	str r0, [sp]
	movs r0, #5
	lsls r0, r0, #6
	str r0, [sp, #4]
	movs r0, #0x60
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #0xc9
	movs r2, #6
	movs r3, #0x75
	bl FUN_0200319C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #0xd
	movs r3, #6
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #0xe
	movs r3, #6
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #0x12
	movs r3, #5
	bl FUN_02007B44
	ldr r0, [r5]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #2
	beq _0225DC64
	cmp r0, #3
	beq _0225DC7E
	b _0225DC98
_0225DC64:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #0xf
	movs r3, #5
	bl FUN_02007B68
	b _0225DCB0
_0225DC7E:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #0x10
	movs r3, #5
	bl FUN_02007B68
	b _0225DCB0
_0225DC98:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #0x11
	movs r3, #5
	bl FUN_02007B68
_0225DCB0:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #0x12
	movs r3, #4
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	adds r0, r4, #0
	movs r1, #0x13
	movs r3, #4
	bl FUN_02007B68
	adds r0, r5, #0
	bl ov93_02260BF0
	adds r0, r5, #0
	bl ov93_02260BB0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x75
	str r0, [sp, #4]
	movs r2, #0x35
	ldr r0, [r5, #0x2c]
	movs r1, #4
	lsls r2, r2, #4
	movs r3, #6
	bl FUN_0200E3DC
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #1
	movs r2, #0x60
	movs r3, #0x20
	bl FUN_020032A4
	movs r3, #0
	str r3, [sp]
	movs r1, #1
	str r1, [sp, #4]
	adds r5, #0x8c
	ldr r0, [r5]
	movs r2, #2
	bl FUN_02003D5C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov93_0225DBC8

	thumb_func_start ov93_0225DD28
ov93_0225DD28: @ 0x0225DD28
	bx lr
	.align 2, 0
	thumb_func_end ov93_0225DD28

	thumb_func_start ov93_0225DD2C
ov93_0225DD2C: @ 0x0225DD2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #8]
	str r0, [sp, #0x10]
	adds r0, #0xd8
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r7, #0
	bl FUN_0203769C
	adds r1, r0, #0
	ldr r0, [sp, #8]
	bl ov93_0225E45C
	adds r4, r0, #0
	movs r1, #0x14
	muls r4, r1, r4
	ldr r2, _0225DEB4 @ =0x02262AF0
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r2, [r2, r4]
	movs r3, #0x75
	bl FUN_02018030
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	adds r0, #0x10
	bl FUN_020181B0
	ldr r0, [sp, #0x10]
	adds r1, r7, #0
	ldr r2, _0225DEB8 @ =0xFFFE7000
	adds r0, #0x10
	adds r3, r1, #0
	bl FUN_020182A8
	ldr r0, [sp, #0x10]
	movs r1, #1
	lsls r1, r1, #0xc
	adds r0, #0x10
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_020182C4
	ldr r0, [sp, #0x10]
	movs r1, #1
	adds r0, #0x10
	bl FUN_020182A0
	ldr r2, _0225DEBC @ =0x02262AF4
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r2, [r2, r4]
	adds r0, #0x88
	movs r3, #0x75
	bl FUN_02018030
	ldr r2, _0225DEC0 @ =0x02262AF8
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r2, [r2, r4]
	adds r0, #0x98
	movs r3, #0x75
	bl FUN_02018030
	ldr r2, _0225DEC4 @ =0x02262AFC
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r2, [r2, r4]
	adds r0, #0xa8
	movs r3, #0x75
	bl FUN_02018030
	ldr r2, _0225DEC8 @ =0x02262B00
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r2, [r2, r4]
	adds r0, #0xb8
	movs r3, #0x75
	bl FUN_02018030
	adds r0, r7, #0
	str r0, [sp, #0x1c]
	movs r1, #0x51
	ldr r0, [sp, #0x10]
	lsls r1, r1, #2
	adds r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r0, [sp, #0x24]
	adds r0, #0xa8
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x20]
	adds r0, #0x88
	str r0, [sp, #0x20]
_0225DDEC:
	movs r0, #0
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x14]
	ldr r6, [sp, #0x10]
	str r0, [sp, #0x18]
_0225DDF6:
	cmp r7, #0
	bne _0225DE18
	movs r0, #0x75
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x18]
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, #0x23
	bl FUN_020180BC
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r7, [r6, r0]
	b _0225DE24
_0225DE18:
	ldr r3, [sp, #0x24]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_020180E8
_0225DE24:
	adds r0, r5, #0
	movs r1, #0
	bl FUN_02018198
	ldr r0, [sp, #0x18]
	adds r4, #0x10
	adds r0, r0, #1
	adds r5, #0x90
	adds r6, #0x90
	str r0, [sp, #0x18]
	cmp r0, #4
	blt _0225DDF6
	movs r0, #9
	ldr r1, [sp, #0x14]
	lsls r0, r0, #6
	adds r0, r1, r0
	str r0, [sp, #0x14]
	movs r0, #9
	ldr r1, [sp, #0x10]
	lsls r0, r0, #6
	adds r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #8
	blt _0225DDEC
	ldr r1, [sp, #8]
	ldr r0, _0225DECC @ =0x000013A0
	movs r2, #0x1e
	adds r0, r1, r0
	ldr r1, [sp, #0xc]
	movs r3, #0x75
	bl FUN_02018030
	ldr r1, [sp, #8]
	ldr r0, _0225DECC @ =0x000013A0
	adds r2, r1, #0
	adds r0, r1, r0
	ldr r1, _0225DECC @ =0x000013A0
	adds r0, #0x10
	adds r1, r2, r1
	bl FUN_020181B0
	ldr r1, [sp, #8]
	ldr r0, _0225DECC @ =0x000013A0
	ldr r2, _0225DEB8 @ =0xFFFE7000
	adds r0, r1, r0
	movs r1, #0
	adds r0, #0x10
	adds r3, r1, #0
	bl FUN_020182A8
	ldr r1, [sp, #8]
	ldr r0, _0225DECC @ =0x000013A0
	adds r0, r1, r0
	movs r1, #1
	lsls r1, r1, #0xc
	adds r0, #0x10
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_020182C4
	ldr r1, [sp, #8]
	ldr r0, _0225DECC @ =0x000013A0
	adds r0, r1, r0
	adds r0, #0x10
	movs r1, #1
	bl FUN_020182A0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225DEB4: .4byte 0x02262AF0
_0225DEB8: .4byte 0xFFFE7000
_0225DEBC: .4byte 0x02262AF4
_0225DEC0: .4byte 0x02262AF8
_0225DEC4: .4byte 0x02262AFC
_0225DEC8: .4byte 0x02262B00
_0225DECC: .4byte 0x000013A0
	thumb_func_end ov93_0225DD2C

	thumb_func_start ov93_0225DED0
ov93_0225DED0: @ 0x0225DED0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r6, #0xd8
	str r0, [sp]
	adds r0, r6, #0
	bl FUN_02018068
	adds r5, r6, #0
	movs r4, #0
	adds r5, #0x88
_0225DEE6:
	adds r0, r5, #0
	bl FUN_02018068
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #4
	blt _0225DEE6
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x51
	lsls r0, r0, #2
	adds r7, r6, r0
	ldr r6, [sp]
	adds r6, #0xa8
_0225DF02:
	movs r4, #0
	adds r5, r7, #0
_0225DF06:
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_020180F8
	adds r4, r4, #1
	adds r5, #0x90
	cmp r4, #4
	blt _0225DF06
	movs r0, #9
	lsls r0, r0, #6
	adds r7, r7, r0
	ldr r0, [sp, #4]
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #8
	blt _0225DF02
	ldr r1, _0225DF34 @ =0x000013A0
	ldr r0, [sp]
	adds r0, r0, r1
	bl FUN_02018068
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225DF34: .4byte 0x000013A0
	thumb_func_end ov93_0225DED0

	thumb_func_start ov93_0225DF38
ov93_0225DF38: @ 0x0225DF38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x4b
	lsls r0, r0, #4
	adds r5, #0xd8
	cmp r1, r0
	ble _0225DF4C
	movs r2, #3
	b _0225DF5E
_0225DF4C:
	cmp r1, #2
	ble _0225DF54
	movs r2, #2
	b _0225DF5E
_0225DF54:
	cmp r1, #1
	ble _0225DF5C
	movs r2, #1
	b _0225DF5E
_0225DF5C:
	movs r2, #0
_0225DF5E:
	adds r0, r5, #0
	str r0, [sp, #4]
	adds r0, #0x88
	movs r1, #0x90
	str r0, [sp, #4]
	lsls r0, r2, #4
	muls r1, r2, r1
	movs r3, #9
	mov ip, r0
	movs r0, #0
	adds r1, r5, r1
	lsls r3, r3, #6
_0225DF76:
	adds r4, r1, #0
	adds r4, #0xc8
	ldr r4, [r4]
	cmp r4, #0
	bne _0225DFF2
	adds r4, r2, #0
	movs r1, #0x90
	muls r4, r1, r4
	lsls r1, r0, #3
	adds r0, r0, r1
	lsls r7, r0, #6
	adds r0, r5, #0
	adds r0, #0xcc
	adds r6, r0, r7
	ldr r1, [sp, #4]
	mov r2, ip
	adds r0, r6, r4
	adds r1, r1, r2
	bl FUN_020181B0
	movs r1, #0
	ldr r2, _0225E000 @ =0xFFFE7000
	adds r0, r6, r4
	adds r3, r1, #0
	bl FUN_020182A8
	movs r1, #1
	lsls r1, r1, #0xc
	adds r0, r6, r4
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_020182C4
	adds r0, r6, r4
	movs r1, #1
	bl FUN_020182A0
	movs r0, #0x51
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, r0, r7
	str r0, [sp]
	adds r0, r0, r4
	movs r1, #0
	bl FUN_02018198
	ldr r1, [sp]
	adds r0, r6, r4
	adds r1, r1, r4
	bl FUN_020181D4
	adds r0, r5, r7
	adds r0, r0, r4
	movs r1, #1
	adds r0, #0xc8
	str r1, [r0]
	ldr r0, _0225E004 @ =0x00000591
	bl FUN_0200604C
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225DFF2:
	adds r0, r0, #1
	adds r1, r1, r3
	cmp r0, #8
	blt _0225DF76
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E000: .4byte 0xFFFE7000
_0225E004: .4byte 0x00000591
	thumb_func_end ov93_0225DF38

	thumb_func_start ov93_0225E008
ov93_0225E008: @ 0x0225E008
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r0, r1, #3
	adds r0, r1, r0
	adds r4, #0xd8
	lsls r6, r0, #6
	adds r0, r4, #0
	adds r0, #0xcc
	movs r3, #0x90
	adds r5, r2, #0
	muls r5, r3, r5
	adds r3, #0xb4
	adds r1, r4, r3
	adds r0, r0, r6
	adds r1, r1, r6
	adds r0, r0, r5
	adds r1, r1, r5
	bl FUN_020181E0
	adds r0, r4, r6
	adds r0, r0, r5
	movs r1, #0
	adds r0, #0xc8
	str r1, [r0]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov93_0225E008

	thumb_func_start ov93_0225E03C
ov93_0225E03C: @ 0x0225E03C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r1, #0x51
	str r0, [sp]
	str r0, [sp, #8]
	adds r0, #0xd8
	lsls r1, r1, #2
	str r0, [sp, #8]
	adds r0, r0, r1
	movs r7, #0
	str r0, [sp, #4]
_0225E052:
	ldr r4, [sp, #8]
	ldr r5, [sp, #4]
	movs r6, #0
_0225E058:
	adds r0, r4, #0
	adds r0, #0xc8
	ldr r0, [r0]
	cmp r0, #1
	bne _0225E07A
	movs r1, #1
	adds r0, r5, #0
	lsls r1, r1, #0xc
	bl FUN_0201815C
	cmp r0, #1
	bne _0225E07A
	ldr r0, [sp]
	adds r1, r7, #0
	adds r2, r6, #0
	bl ov93_0225E008
_0225E07A:
	adds r6, r6, #1
	adds r4, #0x90
	adds r5, #0x90
	cmp r6, #4
	blt _0225E058
	movs r0, #9
	ldr r1, [sp, #8]
	lsls r0, r0, #6
	adds r0, r1, r0
	str r0, [sp, #8]
	movs r0, #9
	ldr r1, [sp, #4]
	lsls r0, r0, #6
	adds r0, r1, r0
	adds r7, r7, #1
	str r0, [sp, #4]
	cmp r7, #8
	blt _0225E052
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov93_0225E03C

	thumb_func_start ov93_0225E0A4
ov93_0225E0A4: @ 0x0225E0A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	adds r0, #0xd8
	str r0, [sp]
	ldr r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r7, #0xcc
_0225E0B6:
	ldr r4, [sp]
	movs r6, #0
	adds r5, r7, #0
_0225E0BC:
	adds r0, r4, #0
	adds r0, #0xc8
	ldr r0, [r0]
	cmp r0, #1
	bne _0225E0CC
	adds r0, r5, #0
	bl FUN_020181EC
_0225E0CC:
	adds r6, r6, #1
	adds r4, #0x90
	adds r5, #0x90
	cmp r6, #4
	blt _0225E0BC
	movs r0, #9
	ldr r1, [sp]
	lsls r0, r0, #6
	adds r0, r1, r0
	str r0, [sp]
	movs r0, #9
	lsls r0, r0, #6
	adds r7, r7, r0
	ldr r0, [sp, #4]
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #8
	blt _0225E0B6
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov93_0225E0A4

	thumb_func_start ov93_0225E0F4
ov93_0225E0F4: @ 0x0225E0F4
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0203769C
	ldr r1, [r4, #4]
	cmp r1, r0
	bne _0225E106
	movs r0, #1
	pop {r4, pc}
_0225E106:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov93_0225E0F4

	thumb_func_start ov93_0225E10C
ov93_0225E10C: @ 0x0225E10C
	push {r4, r5, r6, r7}
	ldr r5, [r0]
	ldr r3, [r0, #0xc]
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r6, [r4]
	adds r1, r5, #0
	adds r1, #0x2c
	movs r2, #1
	ldrb r1, [r1]
	cmp r6, #1
	ble _0225E13C
	adds r4, r0, #4
_0225E126:
	ldr r7, [r4, #0xc]
	cmp r3, r7
	bhs _0225E134
	adds r1, r5, r2
	adds r1, #0x2c
	ldrb r1, [r1]
	adds r3, r7, #0
_0225E134:
	adds r2, r2, #1
	adds r4, r4, #4
	cmp r2, r6
	blt _0225E126
_0225E13C:
	str r1, [r0, #4]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov93_0225E10C

	thumb_func_start ov93_0225E144
ov93_0225E144: @ 0x0225E144
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	str r1, [sp]
	adds r5, r2, #0
	bl ov93_0225E1E0
	cmp r0, #1
	beq _0225E196
	ldr r0, _0225E198 @ =0x00002F04
	movs r1, #0x3c
	adds r6, r4, r0
	ldr r0, [sp]
	lsls r7, r0, #2
	ldr r0, [r6, r7]
	blx FUN_020F2998
	adds r0, r1, #0
	ldr r1, _0225E19C @ =0x00001C1C
	movs r3, #0x4b
	ldr r2, [sp]
	lsls r3, r3, #4
	adds r1, r4, r1
	muls r3, r2, r3
	adds r2, r1, r3
	movs r1, #0x14
	muls r1, r0, r1
	ldr r0, [r6, r7]
	adds r4, r2, r1
	adds r0, r0, #1
	str r0, [r6, r7]
	ldr r0, [r2, r1]
	cmp r0, #0
	beq _0225E18A
	bl FUN_0202551C
_0225E18A:
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
_0225E196:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E198: .4byte 0x00002F04
_0225E19C: .4byte 0x00001C1C
	thumb_func_end ov93_0225E144

	thumb_func_start ov93_0225E1A0
ov93_0225E1A0: @ 0x0225E1A0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _0225E1D8 @ =0x00002F14
	lsls r4, r7, #2
	adds r5, r6, r0
	ldr r0, [r5, r4]
	movs r1, #0x3c
	blx FUN_020F2998
	ldr r0, _0225E1DC @ =0x00001C1C
	adds r2, r6, r0
	movs r0, #0x4b
	lsls r0, r0, #4
	muls r0, r7, r0
	adds r0, r2, r0
	movs r2, #0x14
	muls r2, r1, r2
	ldr r1, [r0, r2]
	cmp r1, #0
	beq _0225E1D4
	ldr r1, [r5, r4]
	adds r0, r0, r2
	adds r1, r1, #1
	str r1, [r5, r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225E1D4:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E1D8: .4byte 0x00002F14
_0225E1DC: .4byte 0x00001C1C
	thumb_func_end ov93_0225E1A0

	thumb_func_start ov93_0225E1E0
ov93_0225E1E0: @ 0x0225E1E0
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #7
	bhi _0225E228
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225E1F8: @ jump table
	.2byte _0225E228 - _0225E1F8 - 2 @ case 0
	.2byte _0225E228 - _0225E1F8 - 2 @ case 1
	.2byte _0225E208 - _0225E1F8 - 2 @ case 2
	.2byte _0225E208 - _0225E1F8 - 2 @ case 3
	.2byte _0225E208 - _0225E1F8 - 2 @ case 4
	.2byte _0225E208 - _0225E1F8 - 2 @ case 5
	.2byte _0225E208 - _0225E1F8 - 2 @ case 6
	.2byte _0225E208 - _0225E1F8 - 2 @ case 7
_0225E208:
	ldr r0, _0225E22C @ =0x00002EF0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0225E214
	bl FUN_0202551C
_0225E214:
	ldr r0, _0225E22C @ =0x00002EF0
	adds r2, r5, r0
	ldm r4!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225E228:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225E22C: .4byte 0x00002EF0
	thumb_func_end ov93_0225E1E0

	thumb_func_start ov93_0225E230
ov93_0225E230: @ 0x0225E230
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov93_0225E27C
	cmp r0, #1
	beq _0225E270
	ldr r0, _0225E274 @ =0x00002F24
	movs r1, #0x3c
	ldr r0, [r5, r0]
	blx FUN_020F2998
	ldr r0, _0225E278 @ =0x0000176C
	adds r2, r5, r0
	movs r0, #0x14
	muls r0, r1, r0
	ldr r1, _0225E274 @ =0x00002F24
	adds r6, r2, r0
	ldr r3, [r5, r1]
	adds r3, r3, #1
	str r3, [r5, r1]
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225E264
	bl FUN_0202551C
_0225E264:
	ldm r4!, {r0, r1}
	stm r6!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r6!, {r0, r1}
	ldr r0, [r4]
	str r0, [r6]
_0225E270:
	pop {r4, r5, r6, pc}
	nop
_0225E274: .4byte 0x00002F24
_0225E278: .4byte 0x0000176C
	thumb_func_end ov93_0225E230

	thumb_func_start ov93_0225E27C
ov93_0225E27C: @ 0x0225E27C
	push {r4, lr}
	adds r2, r1, #0
	ldr r1, [r2]
	cmp r1, #7
	bhi _0225E2CC
	adds r3, r1, r1
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_0225E292: @ jump table
	.2byte _0225E2CC - _0225E292 - 2 @ case 0
	.2byte _0225E2CC - _0225E292 - 2 @ case 1
	.2byte _0225E2A2 - _0225E292 - 2 @ case 2
	.2byte _0225E2A2 - _0225E292 - 2 @ case 3
	.2byte _0225E2A2 - _0225E292 - 2 @ case 4
	.2byte _0225E2A2 - _0225E292 - 2 @ case 5
	.2byte _0225E2A2 - _0225E292 - 2 @ case 6
	.2byte _0225E2A2 - _0225E292 - 2 @ case 7
_0225E2A2:
	ldr r3, _0225E2D0 @ =0x00002EDC
	ldr r4, [r0, r3]
	cmp r4, #0
	bne _0225E2BC
	adds r3, r0, r3
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	movs r0, #1
	pop {r4, pc}
_0225E2BC:
	cmp r1, r4
	bne _0225E2C4
	movs r0, #1
	pop {r4, pc}
_0225E2C4:
	bl FUN_0202551C
	movs r0, #0
	pop {r4, pc}
_0225E2CC:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0225E2D0: .4byte 0x00002EDC
	thumb_func_end ov93_0225E27C

	thumb_func_start ov93_0225E2D4
ov93_0225E2D4: @ 0x0225E2D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0225E2F8 @ =0x00002F28
	movs r1, #0x3c
	ldr r0, [r4, r0]
	blx FUN_020F2998
	ldr r0, _0225E2FC @ =0x0000176C
	adds r2, r1, #0
	adds r3, r4, r0
	movs r0, #0x14
	muls r2, r0, r2
	ldr r1, [r3, r2]
	adds r0, r3, r2
	cmp r1, #0
	bne _0225E2F6
	movs r0, #0
_0225E2F6:
	pop {r4, pc}
	.align 2, 0
_0225E2F8: .4byte 0x00002F28
_0225E2FC: .4byte 0x0000176C
	thumb_func_end ov93_0225E2D4

	thumb_func_start ov93_0225E300
ov93_0225E300: @ 0x0225E300
	push {r3, r4, r5, lr}
	ldr r2, _0225E364 @ =0x00002FC4
	adds r5, r0, #0
	ldr r1, [r5, r2]
	cmp r1, #0
	ble _0225E314
	subs r0, r1, #1
	str r0, [r5, r2]
	movs r0, #0
	pop {r3, r4, r5, pc}
_0225E314:
	adds r1, r2, #0
	subs r1, #0xe8
	ldr r1, [r5, r1]
	cmp r1, #0
	beq _0225E338
	subs r2, #0xe8
	adds r1, r5, r2
	bl ov93_02262724
	cmp r0, #1
	bne _0225E334
	ldr r0, _0225E368 @ =0x00002EDC
	movs r1, #0
	str r1, [r5, r0]
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225E334:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0225E338:
	bl ov93_0225E2D4
	adds r4, r0, #0
	bne _0225E344
	movs r0, #0
	pop {r3, r4, r5, pc}
_0225E344:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov93_02262724
	cmp r0, #1
	bne _0225E360
	movs r0, #0
	str r0, [r4]
	ldr r0, _0225E36C @ =0x00002F28
	ldr r1, [r5, r0]
	adds r1, r1, #1
	str r1, [r5, r0]
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225E360:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225E364: .4byte 0x00002FC4
_0225E368: .4byte 0x00002EDC
_0225E36C: .4byte 0x00002F28
	thumb_func_end ov93_0225E300

	thumb_func_start ov93_0225E370
ov93_0225E370: @ 0x0225E370
	push {r3, r4, r5, lr}
	ldr r1, _0225E3B4 @ =0x00002EF0
	adds r5, r0, #0
	adds r1, r5, r1
	bl ov93_022627C0
	cmp r0, #1
	beq _0225E3B2
	ldr r0, [r5]
	movs r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	ble _0225E3B2
_0225E38C:
	ldr r1, [r5]
	adds r0, r5, #0
	adds r1, r1, r4
	adds r1, #0x2c
	ldrb r1, [r1]
	bl ov93_0225E1A0
	adds r1, r0, #0
	beq _0225E3A6
	adds r0, r5, #0
	bl ov93_022627C0
	b _0225E38C
_0225E3A6:
	ldr r0, [r5]
	adds r4, r4, #1
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r4, r0
	blt _0225E38C
_0225E3B2:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225E3B4: .4byte 0x00002EF0
	thumb_func_end ov93_0225E370

	thumb_func_start ov93_0225E3B8
ov93_0225E3B8: @ 0x0225E3B8
	ldr r1, _0225E3C0 @ =0x00002FC8
	ldr r0, [r0, r1]
	bx lr
	nop
_0225E3C0: .4byte 0x00002FC8
	thumb_func_end ov93_0225E3B8

	thumb_func_start ov93_0225E3C4
ov93_0225E3C4: @ 0x0225E3C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r7, r1, #0
	bl FUN_0203769C
	movs r6, #0xff
	adds r4, r6, #0
	movs r1, #0
	b _0225E3F6
_0225E3D8:
	ldr r2, [r5]
	adds r2, r2, r1
	adds r2, #0x2c
	ldrb r2, [r2]
	cmp r0, r2
	bne _0225E3E6
	adds r4, r1, #0
_0225E3E6:
	ldr r2, [r5]
	adds r2, r2, r1
	adds r2, #0x2c
	ldrb r2, [r2]
	cmp r7, r2
	bne _0225E3F4
	adds r6, r1, #0
_0225E3F4:
	adds r1, r1, #1
_0225E3F6:
	ldr r2, [r5]
	adds r2, #0x30
	ldrb r2, [r2]
	cmp r1, r2
	blt _0225E3D8
	movs r0, #0
	cmp r6, #0xff
	beq _0225E40C
	cmp r4, #0xff
	beq _0225E40C
	movs r0, #1
_0225E40C:
	cmp r0, #0
	bne _0225E414
	bl FUN_0202551C
_0225E414:
	movs r1, #0
	ldr r0, _0225E458 @ =0x02262A54
	b _0225E440
_0225E41A:
	ldr r2, [r5]
	adds r2, #0x30
	ldrb r2, [r2]
	lsls r2, r2, #2
	adds r2, r0, r2
	ldrb r2, [r1, r2]
	cmp r4, r2
	bne _0225E42C
	str r1, [sp]
_0225E42C:
	ldr r2, [r5]
	adds r2, #0x30
	ldrb r2, [r2]
	lsls r2, r2, #2
	adds r2, r0, r2
	ldrb r2, [r1, r2]
	cmp r6, r2
	bne _0225E43E
	str r1, [sp, #4]
_0225E43E:
	adds r1, r1, #1
_0225E440:
	ldr r2, [r5]
	adds r2, #0x30
	ldrb r2, [r2]
	cmp r1, r2
	blt _0225E41A
	ldr r1, [sp, #4]
	ldr r0, [sp]
	subs r0, r1, r0
	bpl _0225E454
	adds r0, r0, r2
_0225E454:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E458: .4byte 0x02262A54
	thumb_func_end ov93_0225E3C4

	thumb_func_start ov93_0225E45C
ov93_0225E45C: @ 0x0225E45C
	push {r4, lr}
	ldr r3, [r0]
	movs r2, #0
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r4, [r0]
	cmp r4, #0
	ble _0225E482
_0225E46C:
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r1, r0
	bne _0225E47A
	adds r0, r2, #0
	pop {r4, pc}
_0225E47A:
	adds r2, r2, #1
	adds r3, r3, #1
	cmp r2, r4
	blt _0225E46C
_0225E482:
	bl FUN_0202551C
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov93_0225E45C

	thumb_func_start ov93_0225E48C
ov93_0225E48C: @ 0x0225E48C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0225E4AC @ =0x00002FD4
	adds r4, r1, #0
	ldr r0, [r5, r0]
	adds r6, r2, #0
	cmp r0, #0
	beq _0225E4A0
	bl FUN_0202551C
_0225E4A0:
	ldr r0, _0225E4AC @ =0x00002FD4
	str r4, [r5, r0]
	adds r0, r0, #4
	str r6, [r5, r0]
	pop {r4, r5, r6, pc}
	nop
_0225E4AC: .4byte 0x00002FD4
	thumb_func_end ov93_0225E48C

	thumb_func_start ov93_0225E4B0
ov93_0225E4B0: @ 0x0225E4B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0225E538 @ =0x00002FD4
	movs r1, #0
	ldr r2, [r4, r0]
	cmp r2, #6
	bhi _0225E508
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0225E4CA: @ jump table
	.2byte _0225E508 - _0225E4CA - 2 @ case 0
	.2byte _0225E4D8 - _0225E4CA - 2 @ case 1
	.2byte _0225E4DC - _0225E4CA - 2 @ case 2
	.2byte _0225E4E0 - _0225E4CA - 2 @ case 3
	.2byte _0225E4E4 - _0225E4CA - 2 @ case 4
	.2byte _0225E4F0 - _0225E4CA - 2 @ case 5
	.2byte _0225E4FC - _0225E4CA - 2 @ case 6
_0225E4D8:
	movs r1, #1
	b _0225E50C
_0225E4DC:
	movs r1, #1
	b _0225E50C
_0225E4E0:
	movs r1, #1
	b _0225E50C
_0225E4E4:
	subs r0, #8
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0225E50C
	movs r1, #1
	b _0225E50C
_0225E4F0:
	ldr r0, _0225E53C @ =0x0000339C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225E50C
	movs r1, #1
	b _0225E50C
_0225E4FC:
	ldr r0, _0225E540 @ =0x00001768
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0225E50C
	movs r1, #1
	b _0225E50C
_0225E508:
	movs r0, #0
	pop {r4, pc}
_0225E50C:
	cmp r1, #1
	bne _0225E534
	ldr r0, _0225E544 @ =0x00002FD8
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02037AC0
	adds r0, r4, #0
	bl ov93_0225E0F4
	cmp r0, #1
	bne _0225E52A
	movs r1, #7
	b _0225E52C
_0225E52A:
	movs r1, #0
_0225E52C:
	ldr r0, _0225E538 @ =0x00002FD4
	str r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
_0225E534:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0225E538: .4byte 0x00002FD4
_0225E53C: .4byte 0x0000339C
_0225E540: .4byte 0x00001768
_0225E544: .4byte 0x00002FD8
	thumb_func_end ov93_0225E4B0

	thumb_func_start ov93_0225E548
ov93_0225E548: @ 0x0225E548
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0225E580 @ =0x00002FD4
	ldr r2, [r4, r0]
	cmp r2, #7
	beq _0225E558
	movs r0, #0
	pop {r4, pc}
_0225E558:
	adds r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, r1
	beq _0225E564
	movs r0, #0
	pop {r4, pc}
_0225E564:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02037B38
	cmp r0, #1
	bne _0225E57A
	ldr r0, _0225E580 @ =0x00002FD4
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
_0225E57A:
	movs r0, #0
	pop {r4, pc}
	nop
_0225E580: .4byte 0x00002FD4
	thumb_func_end ov93_0225E548

	thumb_func_start ov93_0225E584
ov93_0225E584: @ 0x0225E584
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4, #0xc]
	cmp r1, #5
	bhi _0225E616
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225E59A: @ jump table
	.2byte _0225E5A6 - _0225E59A - 2 @ case 0
	.2byte _0225E5B6 - _0225E59A - 2 @ case 1
	.2byte _0225E5CE - _0225E59A - 2 @ case 2
	.2byte _0225E5DC - _0225E59A - 2 @ case 3
	.2byte _0225E5F4 - _0225E59A - 2 @ case 4
	.2byte _0225E602 - _0225E59A - 2 @ case 5
_0225E5A6:
	ldrb r2, [r4, #0x18]
	movs r1, #1
	bl ov93_0226297C
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E616
_0225E5B6:
	ldrb r1, [r4, #0x18]
	bl ov93_0225E548
	cmp r0, #1
	bne _0225E616
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E616
_0225E5CE:
	ldrb r1, [r4, #0x18]
	bl ov93_022629B8
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E616
_0225E5DC:
	ldrb r1, [r4, #0x18]
	bl ov93_0225E548
	cmp r0, #1
	bne _0225E616
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E616
_0225E5F4:
	ldrb r1, [r4, #0x18]
	bl ov93_022628F4
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E616
_0225E602:
	ldrb r1, [r4, #0x18]
	bl ov93_0225E548
	cmp r0, #1
	bne _0225E616
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	movs r0, #1
	pop {r4, pc}
_0225E616:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov93_0225E584

	thumb_func_start ov93_0225E61C
ov93_0225E61C: @ 0x0225E61C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r1, _0225E6E8 @ =0x00002FB4
	ldr r0, _0225E6EC @ =0x00000516
	ldr r2, [r5, r1]
	cmp r2, r0
	bls _0225E64C
	adds r0, r1, #0
	adds r0, #0x20
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225E64C
	adds r0, r1, #0
	subs r0, #0xd8
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225E64C
	subs r1, #0xc4
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _0225E64C
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225E64C:
	ldr r0, [r4, #0xc]
	cmp r0, #3
	bhi _0225E6E4
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225E65E: @ jump table
	.2byte _0225E666 - _0225E65E - 2 @ case 0
	.2byte _0225E684 - _0225E65E - 2 @ case 1
	.2byte _0225E69E - _0225E65E - 2 @ case 2
	.2byte _0225E6CE - _0225E65E - 2 @ case 3
_0225E666:
	ldr r0, _0225E6F0 @ =0x00002FC8
	ldr r0, [r5, r0]
	bl ov93_0225FDF4
	ldr r1, _0225E6F0 @ =0x00002FC8
	adds r2, r0, #0
	ldrb r3, [r4, #0x18]
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov93_02262884
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E6E4
_0225E684:
	ldrb r1, [r4, #0x18]
	adds r0, r5, #0
	bl ov93_0225E548
	cmp r0, #1
	bne _0225E6E4
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E6E4
_0225E69E:
	ldr r0, _0225E6F4 @ =0x00001434
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0225E6E4
	subs r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, r1
	blt _0225E6E4
	ldr r0, _0225E6F0 @ =0x00002FC8
	ldr r1, [r5, r0]
	adds r1, r1, #1
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov93_0225E3B8
	adds r1, r0, #0
	ldrb r2, [r4, #0x18]
	adds r0, r5, #0
	bl ov93_02262830
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E6E4
_0225E6CE:
	ldrb r1, [r4, #0x18]
	adds r0, r5, #0
	bl ov93_0225E548
	cmp r0, #1
	bne _0225E6E4
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	movs r0, #0
	str r0, [r4, #0xc]
_0225E6E4:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225E6E8: .4byte 0x00002FB4
_0225E6EC: .4byte 0x00000516
_0225E6F0: .4byte 0x00002FC8
_0225E6F4: .4byte 0x00001434
	thumb_func_end ov93_0225E61C

	thumb_func_start ov93_0225E6F8
ov93_0225E6F8: @ 0x0225E6F8
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4, #0xc]
	cmp r1, #3
	bhi _0225E75E
	adds r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0225E70E: @ jump table
	.2byte _0225E716 - _0225E70E - 2 @ case 0
	.2byte _0225E724 - _0225E70E - 2 @ case 1
	.2byte _0225E73C - _0225E70E - 2 @ case 2
	.2byte _0225E748 - _0225E70E - 2 @ case 3
_0225E716:
	ldrb r1, [r4, #0x18]
	bl ov93_02262934
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E75E
_0225E724:
	ldrb r1, [r4, #0x18]
	bl ov93_0225E548
	cmp r0, #1
	bne _0225E75E
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E75E
_0225E73C:
	ldr r0, [r0, #0x20]
	cmp r0, #8
	bne _0225E75E
	adds r0, r1, #1
	str r0, [r4, #0xc]
	b _0225E75E
_0225E748:
	ldr r1, [r4, #0x14]
	adds r1, r1, #1
	str r1, [r4, #0x14]
	cmp r1, #0x5a
	blt _0225E75E
	bl ov93_02262748
	cmp r0, #1
	bne _0225E75E
	movs r0, #1
	pop {r4, pc}
_0225E75E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov93_0225E6F8

	thumb_func_start ov93_0225E764
ov93_0225E764: @ 0x0225E764
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov93_0225E0F4
	cmp r0, #0
	bne _0225E774
	movs r0, #0
	pop {r3, r4, r5, pc}
_0225E774:
	adds r0, r5, #0
	adds r0, #0xb8
	ldr r2, [r0]
	adds r4, r5, #0
	adds r4, #0xb8
	cmp r2, #3
	blo _0225E786
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225E786:
	lsls r3, r2, #2
	ldr r2, _0225E7A8 @ =0x02262A20
	adds r0, r5, #0
	ldr r2, [r2, r3]
	adds r1, r4, #0
	blx r2
	cmp r0, #1
	bne _0225E7A4
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	str r0, [r4, #0xc]
	str r0, [r4, #0x14]
	str r0, [r4, #0x10]
_0225E7A4:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225E7A8: .4byte 0x02262A20
	thumb_func_end ov93_0225E764

	thumb_func_start ov93_0225E7AC
ov93_0225E7AC: @ 0x0225E7AC
	bx lr
	.align 2, 0
	thumb_func_end ov93_0225E7AC

	thumb_func_start ov93_0225E7B0
ov93_0225E7B0: @ 0x0225E7B0
	push {r3, r4, r5, lr}
	movs r1, #0x9e
	adds r5, r0, #0
	movs r0, #0x75
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0x9e
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [r5]
	ldr r1, [r0, #0x34]
	movs r0, #0x27
	lsls r0, r0, #4
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov93_0225EC98
	adds r0, r4, #0
	blx FUN_0225EF0C
	adds r0, r4, #0
	blx FUN_0225EF5C
	ldr r0, [r5]
	ldr r0, [r0, #0x34]
	cmp r0, #1
	beq _0225E806
	cmp r0, #2
	bne _0225E81A
	movs r1, #1
	movs r0, #0x26
	lsls r1, r1, #0x12
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r1, #0x1a
	lsls r1, r1, #0xe
	adds r0, r0, #4
	str r1, [r4, r0]
	b _0225E828
_0225E806:
	movs r1, #9
	movs r0, #0x26
	lsls r1, r1, #0x10
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r1, #7
	lsls r1, r1, #0x10
	adds r0, r0, #4
	str r1, [r4, r0]
	b _0225E828
_0225E81A:
	movs r1, #6
	movs r0, #0x26
	lsls r1, r1, #0x10
	lsls r0, r0, #4
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
_0225E828:
	movs r0, #0x87
	movs r1, #0x80
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r1, #0x28
	adds r0, r0, #4
	str r1, [r4, r0]
	adds r0, r5, #0
	blx FUN_0225F9D8
	adds r0, r5, #0
	blx FUN_0225FB00
	movs r1, #0x8d
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	blx FUN_0225FB6C
	movs r1, #2
	movs r0, #0x92
	lsls r1, r1, #0xc
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov93_0225E7B0

	thumb_func_start ov93_0225E860
ov93_0225E860: @ 0x0225E860
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x8d
	adds r4, r1, #0
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	blx FUN_0225FBE4
	adds r0, r5, #0
	blx FUN_0225FABC
	ldr r0, [r4]
	bl FUN_0201AB0C
	movs r0, #0x93
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	thumb_func_end ov93_0225E860

	thumb_func_start ov93_0225E898
ov93_0225E898: @ 0x0225E898
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	movs r1, #0x91
	adds r5, r0, #0
	movs r0, #0
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5, #0x20]
	cmp r0, #2
	bne _0225E8D8
	ldr r0, _0225EA38 @ =0x00001758
	adds r2, r1, #0
	ldr r3, [r5, r0]
	subs r2, #0x38
	str r3, [r4, r2]
	adds r2, r0, #4
	ldr r3, [r5, r2]
	adds r2, r1, #0
	subs r2, #0x34
	str r3, [r4, r2]
	adds r2, r0, #0
	adds r2, #8
	ldr r3, [r5, r2]
	adds r2, r1, #0
	subs r2, #0x30
	str r3, [r4, r2]
	adds r0, #0xc
	ldr r0, [r5, r0]
	subs r1, #0x2c
	str r0, [r4, r1]
	b _0225E920
_0225E8D8:
	ldr r0, _0225EA3C @ =0x00002FB8
	ldr r2, [r5, r0]
	cmp r2, #0
	beq _0225E8E8
	adds r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0225E900
_0225E8E8:
	movs r1, #0x83
	lsls r1, r1, #2
	movs r2, #0
	str r2, [r4, r1]
	adds r0, r1, #4
	str r2, [r4, r0]
	adds r0, r1, #0
	adds r0, #8
	str r2, [r4, r0]
	adds r1, #0xc
	str r2, [r4, r1]
	b _0225E920
_0225E900:
	ldr r2, _0225EA40 @ =0x021D114C
	adds r0, r1, #0
	ldrh r3, [r2, #0x20]
	subs r0, #0x38
	str r3, [r4, r0]
	adds r0, r1, #0
	ldrh r3, [r2, #0x22]
	subs r0, #0x34
	str r3, [r4, r0]
	adds r0, r1, #0
	ldrh r3, [r2, #0x26]
	subs r0, #0x30
	subs r1, #0x2c
	str r3, [r4, r0]
	ldrh r0, [r2, #0x24]
	str r0, [r4, r1]
_0225E920:
	adds r0, r4, #0
	blx FUN_0225F370
	movs r0, #0x85
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225E946
	adds r0, r4, #0
	bl ov93_0225EB38
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bne _0225E946
	bne _0225E946
	movs r0, #0x9d
	movs r1, #0
	lsls r0, r0, #2
	strb r1, [r4, r0]
_0225E946:
	adds r0, r4, #0
	blx FUN_0225F44C
	adds r0, r4, #0
	bl ov93_0225EB70
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	blx FUN_0225FB6C
	movs r0, #0x9a
	lsls r0, r0, #2
	ldrsh r1, [r4, r0]
	cmp r1, #0
	ble _0225E97C
	adds r1, #8
	strh r1, [r4, r0]
	ldrsh r1, [r4, r0]
	cmp r1, #0x1e
	ble _0225E976
	movs r1, #0x1e
	strh r1, [r4, r0]
_0225E976:
	adds r0, r4, #0
	bl ov93_0225EDFC
_0225E97C:
	ldr r0, _0225EA44 @ =0x00002FBC
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _0225EA34
	subs r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0225EA34
	movs r2, #0x91
	lsls r2, r2, #2
	ldr r1, [r4, r2]
	cmp r1, #0
	ble _0225EA34
	adds r0, r2, #0
	adds r0, #0x18
	ldr r0, [r4, r0]
	adds r2, #0xdc
	movs r7, #0
	cmp r0, r2
	bge _0225E9C4
	adds r0, r4, #0
	bl ov93_0225EDB8
	cmp r0, #1
	bne _0225E9D4
	movs r0, #0x9a
	movs r1, #8
	lsls r0, r0, #2
	strh r1, [r4, r0]
	adds r1, r7, #0
	adds r0, #0xd
	strb r1, [r4, r0]
	ldr r0, _0225EA48 @ =0x0000058E
	bl FUN_0200604C
	b _0225E9D4
_0225E9C4:
	adds r0, r4, #0
	bl ov93_0225EDE8
	movs r0, #0x9a
	adds r1, r7, #0
	lsls r0, r0, #2
	strh r1, [r4, r0]
	movs r7, #1
_0225E9D4:
	movs r1, #0x91
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov93_0225EA6C
	adds r6, r0, #0
	cmp r7, #1
	bne _0225E9F2
	movs r0, #0x19
	muls r0, r6, r0
	movs r1, #0x64
	blx FUN_020F2998
	adds r6, r6, r0
_0225E9F2:
	ldr r1, _0225EA4C @ =0x00002FC8
	adds r0, r5, #0
	ldr r1, [r5, r1]
	adds r2, r6, #0
	add r3, sp, #0
	bl ov93_02260F14
	adds r0, r5, #0
	add r1, sp, #0
	bl ov93_02260F3C
	adds r0, r5, #0
	add r1, sp, #0
	bl ov93_0225FEC4
	movs r1, #0x91
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov93_0225EA98
	movs r2, #0x91
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r7, #0
	bl ov93_0225EAE0
	movs r0, #0x91
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_0225EA34:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225EA38: .4byte 0x00001758
_0225EA3C: .4byte 0x00002FB8
_0225EA40: .4byte 0x021D114C
_0225EA44: .4byte 0x00002FBC
_0225EA48: .4byte 0x0000058E
_0225EA4C: .4byte 0x00002FC8
	thumb_func_end ov93_0225E898

	thumb_func_start ov93_0225EA50
ov93_0225EA50: @ 0x0225EA50
	push {r3, lr}
	ldr r0, _0225EA68 @ =0x00000276
	ldrb r2, [r1, r0]
	cmp r2, #1
	bne _0225EA64
	movs r2, #0
	strb r2, [r1, r0]
	adds r0, r1, #0
	bl ov93_0225ED3C
_0225EA64:
	pop {r3, pc}
	nop
_0225EA68: .4byte 0x00000276
	thumb_func_end ov93_0225EA50

	thumb_func_start ov93_0225EA6C
ov93_0225EA6C: @ 0x0225EA6C
	cmp r1, #0x62
	blt _0225EA76
	movs r2, #0x4b
	lsls r2, r2, #4
	b _0225EA7A
_0225EA76:
	movs r2, #0xa
	muls r2, r1, r2
_0225EA7A:
	movs r1, #0x27
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	ldr r3, _0225EA90 @ =FUN_020F2998
	lsls r1, r0, #2
	ldr r0, _0225EA94 @ =0x022630D8
	ldr r0, [r0, r1]
	movs r1, #0x64
	muls r0, r2, r0
	bx r3
	nop
_0225EA90: .4byte FUN_020F2998
_0225EA94: .4byte 0x022630D8
	thumb_func_end ov93_0225EA6C

	thumb_func_start ov93_0225EA98
ov93_0225EA98: @ 0x0225EA98
	movs r2, #0x91
	lsls r2, r2, #2
	ldr r1, [r0, r2]
	cmp r1, #0x62
	blt _0225EAB2
	adds r1, r2, #4
	ldr r3, [r0, r1]
	movs r1, #1
	lsls r1, r1, #0xc
	adds r3, r3, r1
	adds r1, r2, #4
	str r3, [r0, r1]
	b _0225EACC
_0225EAB2:
	blt _0225EAC4
	adds r1, r2, #4
	ldr r3, [r0, r1]
	movs r1, #1
	lsls r1, r1, #0xc
	adds r3, r3, r1
	adds r1, r2, #4
	str r3, [r0, r1]
	b _0225EACC
_0225EAC4:
	movs r3, #2
	lsls r3, r3, #0xc
	adds r1, r2, #4
	str r3, [r0, r1]
_0225EACC:
	movs r1, #0x92
	lsls r1, r1, #2
	movs r2, #0x11
	ldr r3, [r0, r1]
	lsls r2, r2, #0xc
	cmp r3, r2
	ble _0225EADC
	str r2, [r0, r1]
_0225EADC:
	bx lr
	.align 2, 0
	thumb_func_end ov93_0225EA98

	thumb_func_start ov93_0225EAE0
ov93_0225EAE0: @ 0x0225EAE0
	push {r3, lr}
	cmp r3, #1
	bne _0225EAFE
	movs r2, #0x91
	lsls r2, r2, #2
	ldr r2, [r1, r2]
	cmp r2, #0x62
	blt _0225EAFE
	movs r1, #0
	bl ov93_0225D700
	ldr r0, _0225EB34 @ =0x00000592
	bl FUN_0200604C
	pop {r3, pc}
_0225EAFE:
	movs r2, #0x91
	lsls r2, r2, #2
	ldr r2, [r1, r2]
	cmp r2, #0x62
	bge _0225EB32
	ldr r2, [r1, #0x20]
	ldr r1, [r1, #0x10]
	cmp r1, r2
	bge _0225EB20
	movs r1, #2
	bl ov93_0225D700
	movs r0, #0x59
	lsls r0, r0, #4
	bl FUN_0200604C
	pop {r3, pc}
_0225EB20:
	cmp r1, r2
	ble _0225EB32
	movs r1, #1
	bl ov93_0225D700
	movs r0, #0x59
	lsls r0, r0, #4
	bl FUN_0200604C
_0225EB32:
	pop {r3, pc}
	.align 2, 0
_0225EB34: .4byte 0x00000592
	thumb_func_end ov93_0225EAE0

	thumb_func_start ov93_0225EB38
ov93_0225EB38: @ 0x0225EB38
	push {r4, lr}
	movs r1, #0x8e
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225EB6C
	movs r2, #0
	str r2, [r4, r1]
	subs r2, r2, #1
	adds r1, r1, #4
	str r2, [r4, r1]
	blx FUN_0225F9AC
	movs r1, #9
	lsls r1, r1, #6
	ldr r2, [r4, r1]
	subs r2, r2, r0
	adds r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0x19
	bge _0225EB6C
	movs r2, #0
	adds r0, r1, #4
	str r2, [r4, r0]
_0225EB6C:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov93_0225EB38

	thumb_func_start ov93_0225EB70
ov93_0225EB70: @ 0x0225EB70
	push {r4, r5, r6, lr}
	sub sp, #0x38
	adds r5, r0, #0
	ldr r0, _0225EC80 @ =0x2D8B6127
	add r1, sp, #0x1c
	str r0, [sp, #0x1c]
	movs r0, #0x32
	movs r2, #1
	blx FUN_020C2528
	ldr r0, _0225EC84 @ =0x00007FFF
	add r1, sp, #0x18
	str r0, [sp, #0x18]
	movs r0, #0x33
	movs r2, #1
	blx FUN_020C2528
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	movs r0, #0
	str r0, [sp, #0x2c]
	movs r0, #0x13
	lsls r0, r0, #0xc
	str r0, [sp, #0x30]
	ldr r0, _0225EC88 @ =0xFFFFB000
	add r1, sp, #0x2c
	str r0, [sp, #0x34]
	movs r0, #0x1c
	movs r2, #3
	blx FUN_020C2528
	movs r0, #0x99
	lsls r0, r0, #2
	ldr r4, [r5, r0]
	adds r0, r0, #6
	ldrsh r0, [r5, r0]
	movs r1, #0x64
	muls r0, r4, r0
	blx FUN_020F2998
	movs r1, #0x26
	lsls r1, r1, #4
	adds r6, r4, r0
	adds r0, r1, #0
	ldr r4, [r5, r1]
	adds r0, #8
	adds r1, #0xc
	ldrsh r2, [r5, r0]
	ldrsh r0, [r5, r1]
	movs r1, #0x64
	adds r0, r2, r0
	muls r0, r4, r0
	blx FUN_020F2998
	adds r0, r4, r0
	str r0, [sp, #0x20]
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x28]
	movs r0, #0x1b
	add r1, sp, #0x20
	movs r2, #3
	str r6, [sp, #0x24]
	blx FUN_020C2528
	movs r0, #3
	str r0, [sp, #0x14]
	movs r0, #0x10
	add r1, sp, #0x14
	movs r2, #1
	blx FUN_020C2528
	movs r1, #0
	movs r0, #0x15
	adds r2, r1, #0
	blx FUN_020C2528
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #0x10
	add r1, sp, #0x10
	movs r2, #1
	blx FUN_020C2528
	movs r0, #1
	adds r1, r0, #0
	bl ov93_0225EE4C
	blx FUN_0225EE98
	ldr r1, [r5, #4]
	movs r2, #1
	ldr r0, [r1, #0x2c]
	lsls r4, r0, #0x10
	ldr r0, [r1, #8]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0225EC8C @ =0x1FFFFFFF
	ands r1, r0
	ldr r0, _0225EC90 @ =0x72400000
	orrs r0, r1
	str r0, [sp, #0xc]
	movs r0, #0x2a
	add r1, sp, #0xc
	blx FUN_020C2528
	lsrs r0, r4, #0x11
	str r0, [sp, #8]
	movs r0, #0x2b
	add r1, sp, #8
	movs r2, #1
	blx FUN_020C2528
	ldr r0, _0225EC94 @ =0x001F00C1
	add r1, sp, #4
	str r0, [sp, #4]
	movs r0, #0x29
	movs r2, #1
	blx FUN_020C2528
	adds r0, r5, #0
	blx FUN_0225EFAC
	movs r2, #1
	movs r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	blx FUN_020C2528
	blx FUN_020C23F4
	add sp, #0x38
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225EC80: .4byte 0x2D8B6127
_0225EC84: .4byte 0x00007FFF
_0225EC88: .4byte 0xFFFFB000
_0225EC8C: .4byte 0x1FFFFFFF
_0225EC90: .4byte 0x72400000
_0225EC94: .4byte 0x001F00C1
	thumb_func_end ov93_0225EB70

	thumb_func_start ov93_0225EC98
ov93_0225EC98: @ 0x0225EC98
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0xc9
	movs r1, #0x1d
	movs r2, #0x75
	bl FUN_02007524
	str r0, [r5]
	blx FUN_020C3B50
	str r0, [r5, #4]
	bl FUN_0201F668
	ldr r6, [r5, #4]
	ldrh r0, [r6, #0x30]
	ldr r7, [r6, #0x38]
	lsls r4, r0, #3
	ldr r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	str r0, [sp]
	movs r0, #0x93
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0225ECD0
	bl FUN_0202551C
_0225ECD0:
	movs r0, #0x75
	adds r1, r4, #0
	bl FUN_0201AA8C
	movs r1, #0x93
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0x75
	adds r1, r4, #0
	bl FUN_0201AA8C
	movs r1, #0x25
	lsls r1, r1, #4
	str r0, [r5, r1]
	subs r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r6, r7
	adds r2, r4, #0
	blx FUN_020D4A50
	movs r1, #0x25
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r6, r7
	adds r2, r4, #0
	blx FUN_020D4A50
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r4, #0
	blx FUN_020D2894
	movs r1, #0x96
	ldr r0, [sp]
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r0, r1, #4
	str r4, [r5, r0]
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0225ED2A
	bl FUN_0202551C
_0225ED2A:
	ldr r2, [r5, #4]
	ldr r0, [r5]
	ldr r1, [r2, #0x14]
	adds r1, r2, r1
	subs r1, r1, r0
	bl FUN_0201AC38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov93_0225EC98

	thumb_func_start ov93_0225ED3C
ov93_0225ED3C: @ 0x0225ED3C
	push {r4, lr}
	adds r4, r0, #0
	blx FUN_020D0AD4
	movs r2, #0x25
	lsls r2, r2, #4
	adds r1, r2, #0
	ldr r0, [r4, r2]
	adds r1, #8
	adds r2, r2, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	blx FUN_020D0B08
	blx FUN_020D0B74
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov93_0225ED3C

	thumb_func_start ov93_0225ED60
ov93_0225ED60: @ 0x0225ED60
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r0, r1, #1
	adds r0, r1, r0
	movs r1, #0x32
	lsls r0, r0, #0xa
	lsls r1, r1, #4
	blx FUN_020F2998
	adds r0, #0x80
	asrs r3, r0, #8
	cmp r3, #0x10
	ble _0225ED7E
	movs r3, #0x10
_0225ED7E:
	movs r2, #0x93
	movs r0, #0x1f
	lsls r2, r2, #2
	str r0, [sp]
	adds r1, r2, #4
	ldr r0, [r4, r2]
	adds r2, #8
	ldr r2, [r4, r2]
	lsls r3, r3, #0x18
	lsls r2, r2, #0xf
	ldr r1, [r4, r1]
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_02003DE8
	movs r1, #0x25
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	blx FUN_020D2894
	ldr r0, _0225EDB4 @ =0x00000276
	movs r1, #1
	strb r1, [r4, r0]
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0225EDB4: .4byte 0x00000276
	thumb_func_end ov93_0225ED60

	thumb_func_start ov93_0225EDB8
ov93_0225EDB8: @ 0x0225EDB8
	push {r4, lr}
	movs r2, #0x97
	lsls r2, r2, #2
	ldr r3, [r0, r2]
	movs r4, #0
	adds r1, r3, r1
	str r1, [r0, r2]
	adds r1, r2, #0
	ldr r3, [r0, r2]
	adds r1, #0xc4
	cmp r3, r1
	blt _0225EDD8
	adds r1, r2, #0
	adds r1, #0xc4
	str r1, [r0, r2]
	movs r4, #1
_0225EDD8:
	movs r1, #0x97
	lsls r1, r1, #2
	ldr r1, [r0, r1]
	bl ov93_0225ED60
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov93_0225EDB8

	thumb_func_start ov93_0225EDE8
ov93_0225EDE8: @ 0x0225EDE8
	movs r1, #0x97
	ldr r3, _0225EDF8 @ =ov93_0225ED60
	movs r2, #0
	lsls r1, r1, #2
	str r2, [r0, r1]
	ldr r1, [r0, r1]
	bx r3
	nop
_0225EDF8: .4byte ov93_0225ED60
	thumb_func_end ov93_0225EDE8

	thumb_func_start ov93_0225EDFC
ov93_0225EDFC: @ 0x0225EDFC
	push {r4, lr}
	movs r2, #0x9a
	adds r4, r0, #0
	lsls r2, r2, #2
	ldrsh r1, [r4, r2]
	cmp r1, #0
	beq _0225EE44
	adds r1, r2, #0
	adds r1, #0xd
	ldrb r1, [r4, r1]
	adds r3, r1, #1
	adds r1, r2, #0
	adds r1, #0xd
	strb r3, [r4, r1]
	adds r1, r2, #0
	adds r1, #0xd
	ldrb r1, [r4, r1]
	cmp r1, #4
	bne _0225EE32
	subs r2, #0xc
	ldr r2, [r4, r2]
	lsrs r1, r2, #0x1f
	adds r1, r2, r1
	asrs r1, r1, #1
	bl ov93_0225ED60
	pop {r4, pc}
_0225EE32:
	cmp r1, #8
	bne _0225EE44
	subs r2, #0xc
	ldr r1, [r4, r2]
	bl ov93_0225ED60
	ldr r0, _0225EE48 @ =0x00000275
	movs r1, #0
	strb r1, [r4, r0]
_0225EE44:
	pop {r4, pc}
	nop
_0225EE48: .4byte 0x00000275
	thumb_func_end ov93_0225EDFC

	thumb_func_start ov93_0225EE4C
ov93_0225EE4C: @ 0x0225EE4C
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r0, #0
	beq _0225EE5A
	movs r0, #1
	b _0225EE5C
_0225EE5A:
	movs r0, #0
_0225EE5C:
	lsls r1, r0, #0xf
	ldr r0, _0225EE90 @ =0x21085EF7
	movs r2, #1
	orrs r0, r1
	str r0, [sp, #4]
	movs r0, #0x30
	add r1, sp, #4
	blx FUN_020C2528
	cmp r4, #0
	beq _0225EE76
	movs r0, #1
	b _0225EE78
_0225EE76:
	movs r0, #0
_0225EE78:
	lsls r1, r0, #0xf
	ldr r0, _0225EE94 @ =0x00007FFF
	movs r2, #1
	orrs r0, r1
	str r0, [sp]
	movs r0, #0x31
	add r1, sp, #0
	blx FUN_020C2528
	add sp, #8
	pop {r4, pc}
	nop
_0225EE90: .4byte 0x21085EF7
_0225EE94: .4byte 0x00007FFF
	thumb_func_end ov93_0225EE4C

	arm_func_start FUN_0225EE98
FUN_0225EE98: @ 0x0225EE98
	push {r4, r5, r6, lr}
	sub sp, sp, #0x80
	add r3, sp, #0
	mov r6, #0
_0225EEA8:
	lsl r0, r6, #1
	add r5, r0, #1
	smull r1, r0, r5, r5
	umull ip, r2, r5, r1
	mla r2, r5, r0, r2
	asr r4, r5, #0x1f
	umull lr, r0, r5, ip
	mla r2, r4, r1, r2
	mla r0, r5, r2, r0
	mla r0, r4, ip, r0
	lsr r1, lr, #0x18
	orr r1, r1, r0, lsl #8
	add r0, r6, #1
	strb r1, [r3, r6]
	and r6, r0, #0xff
	cmp r6, #0x7f
	blo _0225EEA8
	mov ip, #0xff
	add r1, sp, #0
	mov r0, #0x34
	mov r2, #0x20
	strb ip, [r3, #0x7f]
	bl FUN_020C2528
	add sp, sp, #0x80
	pop {r4, r5, r6, pc}
	arm_func_end FUN_0225EE98

	arm_func_start FUN_0225EF0C
FUN_0225EF0C: @ 0x0225EF0C
	push {r4, lr}
	mov lr, #0
	mov r4, lr
	mov ip, lr
	mov r1, #0x80000
_0225EF20:
	add r3, r0, lr, lsl #5
	str ip, [r3, #0xc]
	str r4, [r3, #0x10]
	str ip, [r3, #0x14]
	sub r2, r4, #0x10000
	str r2, [r3, #0x18]
	str r1, [r3, #0x1c]
	str r4, [r3, #0x20]
	str r1, [r3, #0x24]
	add lr, lr, #1
	str r2, [r3, #0x28]
	cmp lr, #8
	sub r4, r4, #0x10000
	blt _0225EF20
	pop {r4, pc}
	arm_func_end FUN_0225EF0C

	arm_func_start FUN_0225EF5C
FUN_0225EF5C: @ 0x0225EF5C
	push {r4, lr}
	mov lr, #0
	mov r4, lr
	mov ip, lr
	mov r1, #0x80000
_0225EF70:
	add r3, r0, lr, lsl #5
	str ip, [r3, #0x10c]
	str r4, [r3, #0x110]
	str ip, [r3, #0x114]
	add r2, r4, #0x10000
	str r2, [r3, #0x118]
	str r1, [r3, #0x11c]
	str r4, [r3, #0x120]
	str r1, [r3, #0x124]
	add lr, lr, #1
	mov r4, r2
	str r2, [r3, #0x128]
	cmp lr, #8
	blt _0225EF70
	pop {r4, pc}
	arm_func_end FUN_0225EF5C

	arm_func_start FUN_0225EFAC
FUN_0225EFAC: @ 0x0225EFAC
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x48
	mov sb, #0
	ldr r6, _0225F264 @ =0x1FF00000
	mov sl, r0
	mov r4, sb
	add r8, sp, #2
	add r7, sp, #0
	mov fp, sb
	mov r5, sb
_0225EFD4:
	mov r0, #1
	str r0, [sp, #0x44]
	mov r0, #0x40
	add r1, sp, #0x44
	mov r2, #1
	bl FUN_020C2528
	add r1, sl, sb, lsl #5
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #0x10]
	mov r2, r8
	mov r3, r7
	bl FUN_0225F268
	add r1, sl, sb, lsl #5
	ldr r0, [r1, #0x10c]
	ldr r1, [r1, #0x110]
	lsl r0, r0, #8
	lsl r1, r1, #8
	asr r1, r1, #0x10
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	lsr r1, r1, #0x10
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	orr r0, r1, r0, lsr #16
	str r0, [sp, #0x40]
	mov r0, #0x22
	add r1, sp, #0x40
	mov r2, #1
	bl FUN_020C2528
	mov r0, #0x21
	add r1, sp, #0x3c
	mov r2, #1
	str r6, [sp, #0x3c]
	bl FUN_020C2528
	ldrh r3, [sp, #2]
	ldrh r2, [sp]
	mov r0, #0x23
	add r1, sp, #0x34
	orr r2, r3, r2, lsl #16
	str r2, [sp, #0x34]
	mov r2, #2
	str r5, [sp, #0x38]
	bl FUN_020C2528
	add r1, sl, sb, lsl #5
	ldr r0, [r1, #0x14]
	ldr r1, [r1, #0x18]
	mov r2, r8
	mov r3, r7
	bl FUN_0225F268
	add r1, sl, sb, lsl #5
	ldr r0, [r1, #0x114]
	ldr r1, [r1, #0x118]
	lsl r0, r0, #8
	lsl r1, r1, #8
	asr r1, r1, #0x10
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	lsr r1, r1, #0x10
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	orr r0, r1, r0, lsr #16
	str r0, [sp, #0x30]
	mov r0, #0x22
	add r1, sp, #0x30
	mov r2, #1
	bl FUN_020C2528
	mov r0, #0x21
	add r1, sp, #0x2c
	mov r2, #1
	str r6, [sp, #0x2c]
	bl FUN_020C2528
	ldrh r3, [sp, #2]
	ldrh r2, [sp]
	mov r0, #0x23
	add r1, sp, #0x24
	orr r2, r3, r2, lsl #16
	str r2, [sp, #0x24]
	mov r2, #2
	str r4, [sp, #0x28]
	bl FUN_020C2528
	add r1, sl, sb, lsl #5
	ldr r0, [r1, #0x24]
	ldr r1, [r1, #0x28]
	mov r2, r8
	mov r3, r7
	bl FUN_0225F268
	add r1, sl, sb, lsl #5
	ldr r0, [r1, #0x124]
	ldr r1, [r1, #0x128]
	lsl r0, r0, #8
	lsl r1, r1, #8
	asr r1, r1, #0x10
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	lsr r1, r1, #0x10
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	orr r0, r1, r0, lsr #16
	str r0, [sp, #0x20]
	mov r0, #0x22
	add r1, sp, #0x20
	mov r2, #1
	bl FUN_020C2528
	mov r0, #0x21
	add r1, sp, #0x1c
	mov r2, #1
	str r6, [sp, #0x1c]
	bl FUN_020C2528
	ldrh r3, [sp, #2]
	ldrh r2, [sp]
	mov r0, #0x23
	add r1, sp, #0x14
	orr r2, r3, r2, lsl #16
	str r2, [sp, #0x14]
	mov r2, #2
	str fp, [sp, #0x18]
	bl FUN_020C2528
	add r1, sl, sb, lsl #5
	ldr r0, [r1, #0x1c]
	ldr r1, [r1, #0x20]
	mov r2, r8
	mov r3, r7
	bl FUN_0225F268
	add r1, sl, sb, lsl #5
	ldr r0, [r1, #0x11c]
	ldr r1, [r1, #0x120]
	lsl r0, r0, #8
	lsl r1, r1, #8
	asr r1, r1, #0x10
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	lsr r1, r1, #0x10
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	orr r0, r1, r0, lsr #16
	str r0, [sp, #0x10]
	mov r0, #0x22
	add r1, sp, #0x10
	mov r2, #1
	bl FUN_020C2528
	mov r0, #0x21
	add r1, sp, #0xc
	mov r2, #1
	str r6, [sp, #0xc]
	bl FUN_020C2528
	mov r0, #0
	str r0, [sp, #8]
	ldrh r3, [sp, #2]
	ldrh r2, [sp]
	mov r0, #0x23
	add r1, sp, #4
	orr r2, r3, r2, lsl #16
	str r2, [sp, #4]
	mov r2, #2
	bl FUN_020C2528
	mov r1, #0
	mov r0, #0x41
	mov r2, r1
	bl FUN_020C2528
	add sb, sb, #1
	cmp sb, #8
	blt _0225EFD4
	add sp, sp, #0x48
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0225F264: .4byte 0x1FF00000
	arm_func_end FUN_0225EFAC

	arm_func_start FUN_0225F268
FUN_0225F268: @ 0x0225F268
	push {r3, r4, r5, r6, r7, lr}
	asr r4, r0, #0x1f
	mov r5, r1
	lsl r1, r4, #0xc
	mov r7, r2
	mov r6, r3
	orr r1, r1, r0, lsr #20
	lsl r0, r0, #0xc
	mov r2, #0x80000
	mov r3, #0
	bl FUN_020F2750
	asr r1, r5, #0x1f
	lsl r1, r1, #0xc
	mov r4, r0
	orr r1, r1, r5, lsr #20
	lsl r0, r5, #0xc
	mov r2, #0x80000
	mov r3, #0
	bl FUN_020F2750
	mov r5, r0
	ldr r0, _0225F36C @ =0x00007FFF
	cmp r4, r0
	ble _0225F2C8
	blx FUN_0202551C
_0225F2C8:
	mov r0, #0x8000
	rsb r0, r0, #0
	cmp r4, r0
	bge _0225F2DC
	blx FUN_0202551C
_0225F2DC:
	ldr r0, _0225F36C @ =0x00007FFF
	cmp r5, r0
	ble _0225F2EC
	blx FUN_0202551C
_0225F2EC:
	mov r0, #0x8000
	rsb r0, r0, #0
	cmp r5, r0
	bge _0225F300
	blx FUN_0202551C
_0225F300:
	ldr r0, _0225F36C @ =0x00007FFF
	sub r1, r4, #0x800
	cmp r1, r0
	ble _0225F314
	blx FUN_0202551C
_0225F314:
	mov r0, #0x8000
	sub r1, r4, #0x800
	rsb r0, r0, #0
	cmp r1, r0
	bge _0225F32C
	blx FUN_0202551C
_0225F32C:
	ldr r0, _0225F36C @ =0x00007FFF
	add r1, r5, #0x800
	cmp r1, r0
	ble _0225F340
	blx FUN_0202551C
_0225F340:
	mov r0, #0x8000
	add r1, r5, #0x800
	rsb r0, r0, #0
	cmp r1, r0
	bge _0225F358
	blx FUN_0202551C
_0225F358:
	sub r0, r4, #0x800
	strh r0, [r7]
	add r0, r5, #0x800
	strh r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225F36C: .4byte 0x00007FFF
	arm_func_end FUN_0225F268

	arm_func_start FUN_0225F370
FUN_0225F370: @ 0x0225F370
	push {r3, r4, r5, lr}
	mov r4, r0
	ldr r1, [r4, #0x238]
	cmp r1, #1
	ldrne r1, [r4, #0x218]
	cmpne r1, #0
	moveq r0, #0
	popeq {r3, r4, r5, pc}
	ldr r2, [r4, #0x270]
	ldr r3, _0225F43C @ =0x02262C07
	ldr r1, _0225F440 @ =0x02262C05
	ldrb lr, [r3, r2, lsl #2]
	ldr r5, [r4, #0x230]
	ldrb r3, [r1, r2, lsl #2]
	ldr ip, [r4, #0x20c]
	add r1, lr, r5, asr #12
	cmp ip, r3
	blt _0225F3E4
	ldr r3, _0225F444 @ =0x02262C06
	ldrb r3, [r3, r2, lsl #2]
	cmp ip, r3
	bgt _0225F3E4
	ldr ip, [r4, #0x210]
	cmp ip, r1
	blt _0225F3E4
	ldr r3, _0225F448 @ =0x02262C08
	ldrb r2, [r3, r2, lsl #2]
	cmp ip, r2
	ble _0225F3EC
_0225F3E4:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0225F3EC:
	mov r2, #1
	str r2, [r4, #0x238]
	ldr r2, [r4, #0x20c]
	str r2, [r4, #0x224]
	ldr r2, [r4, #0x210]
	str r2, [r4, #0x228]
	ldr r2, [r4, #0x210]
	sub r1, r2, r1
	str r1, [r4, #0x22c]
	ldr r2, [r4, #0x20]
	ldr r1, [r4, #0x10]
	sub r1, r1, r2
	add r1, r1, r1, lsr #31
	add r1, r2, r1, asr #1
	rsb r1, r1, #0
	str r1, [r4, #0x230]
	bl FUN_0225F9AC
	str r0, [r4, #0x240]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225F43C: .4byte 0x02262C07
_0225F440: .4byte 0x02262C05
_0225F444: .4byte 0x02262C06
_0225F448: .4byte 0x02262C08
	arm_func_end FUN_0225F370

	arm_func_start FUN_0225F44C
FUN_0225F44C: @ 0x0225F44C
	push {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0x238]
	mov r4, #0
	cmp r0, #1
	bne _0225F4E8
	ldr r2, [r5, #0x23c]
	ldr r1, [r5, #0x210]
	cmp r1, r2
	movlt r0, r4
	strblt r4, [r5, #0x274]
	poplt {r3, r4, r5, pc}
	strbeq r4, [r5, #0x274]
	moveq r0, #1
	popeq {r3, r4, r5, pc}
	sub r0, r4, #1
	cmp r2, r0
	beq _0225F4BC
	cmp r1, r2
	ble _0225F4BC
	ldr r0, _0225F540 @ =0x0000058F
	blx FUN_02006184
	cmp r0, #0
	bne _0225F4BC
	ldr r0, _0225F540 @ =0x0000058F
	blx FUN_0200604C
	mov r0, #1
	strb r0, [r5, #0x274]
_0225F4BC:
	ldr r1, [r5, #0x270]
	ldr r0, _0225F544 @ =0x02262C07
	ldr ip, [r5, #0x210]
	ldr r3, [r5, #0x22c]
	ldr r2, [r5, #0x230]
	ldrb r0, [r0, r1, lsl #2]
	sub r1, ip, r3
	str ip, [r5, #0x23c]
	add r0, r2, r0, lsl #12
	rsb r2, r0, r1, lsl #12
	b _0225F4F4
_0225F4E8:
	ldr r0, [r5, #0x248]
	mov r4, #1
	rsb r2, r0, #0
_0225F4F4:
	mov r0, r5
	mov r1, r4
	bl FUN_0225F548
	cmp r0, #0
	beq _0225F51C
	cmp r0, #1
	cmpne r0, #2
	bne _0225F51C
	mov r0, r5
	blx ov93_0225EB38
_0225F51C:
	ldr r2, [r5, #0x20]
	ldr r1, [r5, #0x10]
	mov r0, #1
	sub r1, r1, r2
	add r1, r1, r1, lsr #31
	add r1, r2, r1, asr #1
	rsb r1, r1, #0
	str r1, [r5, #0x230]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225F540: .4byte 0x0000058F
_0225F544: .4byte 0x02262C07
	arm_func_end FUN_0225F44C

	arm_func_start FUN_0225F548
FUN_0225F548: @ 0x0225F548
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov r4, r0
	ldr r5, [r4, #0x10]
	ldr r3, [r4, #0x20]
	rsb r6, r5, #0
	rsb r7, r3, #0
	sub r3, r6, r7
	add r3, r3, r3, lsr #31
	mov r5, r2
	mov r2, #0
	mov sb, r1
	add r8, r7, r3, asr #1
	str r2, [sp, #8]
	bl FUN_0225F8AC
	cmp r0, #0
	beq _0225F5A0
	cmp r0, #1
	beq _0225F5B4
	cmp r0, #2
	beq _0225F5E0
	b _0225F608
_0225F5A0:
	add r1, r6, r5
	add r0, r7, r5
	str r1, [sp, #0x10]
	str r0, [sp, #0xc]
	b _0225F608
_0225F5B4:
	add r0, sp, #0x10
	str r0, [sp]
	add sl, sp, #0xc
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	str sl, [sp, #4]
	bl FUN_0225F8E4
	str r0, [sp, #8]
	b _0225F608
_0225F5E0:
	add r0, sp, #0xc
	str r0, [sp]
	add sl, sp, #0x10
	mov r0, r4
	mov r1, r5
	mov r2, r7
	mov r3, r6
	str sl, [sp, #4]
	bl FUN_0225F8E4
	str r0, [sp, #8]
_0225F608:
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	sub r0, r2, r1
	add r0, r0, r0, lsr #31
	add r5, r1, r0, asr #1
	cmp r8, r5
	cmpeq r6, r2
	cmpeq r7, r1
	addeq sp, sp, #0x14
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r5, #0
	movlt r5, #0
	cmp r2, #0
	movlt r0, #0
	strlt r0, [sp, #0x10]
	cmp r1, #0
	movlt r0, #0
	strlt r0, [sp, #0xc]
	cmp r5, #0x64000
	movgt r0, #1
	strgt r0, [sp, #8]
	ldr r0, [sp, #0x10]
	movgt r5, #0x64000
	cmp r0, #0x64000
	ble _0225F680
	mov r0, #0x64000
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #8]
_0225F680:
	ldr r0, [sp, #0xc]
	cmp r0, #0x64000
	ble _0225F69C
	mov r0, #0x64000
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #8]
_0225F69C:
	mov r0, r4
	mov r1, sb
	bl FUN_0225F8AC
	cmp r0, #0
	beq _0225F6C0
	cmp r0, #1
	beq _0225F700
	cmp r0, #2
	beq _0225F6E0
_0225F6C0:
	ldr r0, [sp, #0xc]
	mov r1, #0x40000
	sub r0, r0, r5
	bl FUN_020CD5DC
	add r1, r0, #0x8000
	lsl r1, r1, #0x10
	lsr fp, r1, #0x10
	b _0225F724
_0225F6E0:
	ldr r0, [sp, #0xc]
	mov r1, #0x40000
	sub r0, r0, r5
	bl FUN_020CD5DC
	add r1, r0, #0x8000
	lsl r1, r1, #0x10
	lsr fp, r1, #0x10
	b _0225F724
_0225F700:
	ldr r0, [sp, #0x10]
	mov r1, #0x40000
	sub r0, r0, r5
	rsb r1, r1, #0
	bl FUN_020CD5DC
	mov fp, r0
	add r0, fp, #0x8000
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
_0225F724:
	asr r1, fp, #4
	lsl r7, r1, #1
	add r2, r7, #1
	ldr r1, _0225F8A4 @ =0x021094DC
	lsl r2, r2, #1
	ldrsh r3, [r1, r2]
	asr r2, r0, #4
	lsl r6, r2, #1
	lsl r2, r3, #6
	add r2, r2, #0x40000
	str r2, [r4, #0xc]
	lsl r2, r7, #1
	ldrsh r7, [r1, r2]
	add r2, r6, #1
	lsl r2, r2, #1
	add r7, r5, r7, lsl #6
	rsb r7, r7, #0
	str r7, [r4, #0x10]
	ldrsh r7, [r1, r2]
	ldr r2, _0225F8A8 @ =0x92492493
	rsb r3, r5, #0x70000
	lsl r7, r7, #6
	add r7, r7, #0x40000
	lsl r6, r6, #1
	str r7, [r4, #0x1c]
	ldrsh r6, [r1, r6]
	smull r1, lr, r2, r3
	add r1, r5, r6, lsl #6
	rsb r6, r1, #0
	add lr, r3, lr
	lsr r1, r3, #0x1f
	str r6, [r4, #0x20]
	cmp r0, #0x8000
	add lr, r1, lr, asr #2
	smullls r1, r6, r2, r0
	addls r6, r0, r6
	lsrls r1, r0, #0x1f
	bls _0225F7D0
	rsb r1, r0, #0x10000
	rsb r3, r1, #0
	smull r1, r6, r2, r3
	add r6, r3, r6
	lsr r1, r3, #0x1f
_0225F7D0:
	add r6, r1, r6, asr #2
	ldr r3, _0225F8A4 @ =0x021094DC
	mov r7, r6
	mov r8, lr
	mov ip, #1
_0225F7E4:
	sub r1, fp, r7
	asr r1, r1, #4
	lsl r1, r1, #1
	add r2, r3, r1, lsl #1
	ldrsh sb, [r2, #2]
	sub r2, r0, r7
	lsl r1, r1, #1
	lsl sb, sb, #6
	add sl, sb, #0x40000
	asr r2, r2, #4
	lsl sb, r2, #1
	add r2, r4, ip, lsl #5
	str sl, [r2, #0xc]
	ldrsh r1, [r3, r1]
	lsl sl, sb, #1
	add sb, r3, sb, lsl #1
	add r1, r5, r1, lsl #6
	add r1, r8, r1
	rsb r1, r1, #0
	str r1, [r2, #0x10]
	ldrsh r1, [sb, #2]
	add r7, r7, r6
	add ip, ip, #1
	lsl r1, r1, #6
	add r1, r1, #0x40000
	str r1, [r2, #0x1c]
	ldrsh r1, [r3, sl]
	cmp ip, #7
	add r1, r5, r1, lsl #6
	add r1, r8, r1
	rsb r1, r1, #0
	str r1, [r2, #0x20]
	ldr r1, [r2, #0xc]
	add r8, r8, lr
	str r1, [r2, #-0xc]
	ldr r1, [r2, #0x10]
	str r1, [r2, #-8]
	ldr r1, [r2, #0x1c]
	str r1, [r2, #4]
	ldr r1, [r2, #0x20]
	str r1, [r2, #8]
	blt _0225F7E4
	ldr r0, [sp, #8]
	cmp r0, #1
	moveq r0, #2
	movne r0, #0
	add sp, sp, #0x14
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0225F8A4: .4byte 0x021094DC
_0225F8A8: .4byte 0x92492493
	arm_func_end FUN_0225F548

	arm_func_start FUN_0225F8AC
FUN_0225F8AC: @ 0x0225F8AC
	cmp r1, #1
	moveq r0, #0
	bxeq lr
	ldr r2, [r0, #0x21c]
	ldr r1, [r0, #0x224]
	sub r0, r2, #0x10
	cmp r1, r0
	movlt r0, #1
	bxlt lr
	add r0, r2, #0x10
	cmp r1, r0
	movgt r0, #2
	movle r0, #0
	bx lr
	arm_func_end FUN_0225F8AC

	arm_func_start FUN_0225F8E4
FUN_0225F8E4: @ 0x0225F8E4
	push {r4, lr}
	ldr lr, [sp, #8]
	add r4, r2, r1
	mov r0, #0
	cmp r4, #0x64000
	subgt r0, r4, #0x64000
	subgt r1, r1, r0
	movgt r0, #1
	ldr ip, [sp, #0xc]
	str r2, [lr]
	str r3, [ip]
	add r4, r2, r1
	str r4, [lr]
	cmp r3, r2
	strgt r3, [ip]
	popgt {r4, pc}
	mov r2, #0x19
	mul r2, r1, r2
	ldr lr, _0225F948 @ =0x51EB851F
	lsr r1, r2, #0x1f
	smull r2, r4, lr, r2
	add r4, r1, r4, asr #5
	sub r1, r3, r4
	str r1, [ip]
	pop {r4, pc}
	.align 2, 0
_0225F948: .4byte 0x51EB851F
	arm_func_end FUN_0225F8E4

	arm_func_start FUN_0225F94C
FUN_0225F94C: @ 0x0225F94C
	push {r3, r4, r5, lr}
	ldr r5, [r0, #0x20]
	ldr r1, [r0, #0x10]
	ldr r4, [r0, #0x1c]
	sub r1, r1, r5
	add r1, r1, r1, lsr #31
	ldr lr, [r0, #0xc]
	ldr ip, [r0, #0xe4]
	ldr r3, [r0, #0xd4]
	ldr r2, [r0, #0xd8]
	add r0, r5, r1, asr #1
	sub r0, r2, r0
	sub r2, r4, lr
	sub r1, ip, r3
	add r1, r2, r1
	rsb r0, r0, #0
	smull r2, r0, r1, r0
	adds r1, r2, #0x800
	adc r0, r0, #0
	lsr r1, r1, #0xc
	orr r1, r1, r0, lsl #20
	add r0, r1, r1, lsr #31
	asr r0, r0, #1
	pop {r3, r4, r5, pc}
	arm_func_end FUN_0225F94C

	arm_func_start FUN_0225F9AC
FUN_0225F9AC: @ 0x0225F9AC
	push {r3, lr}
	bl FUN_0225F94C
	mov r2, #0x64
	umull r3, r1, r0, r2
	asr r0, r0, #0x1f
	mla r1, r0, r2, r1
	mov r0, r3
	mov r3, #0
	mov r2, #0x3200000
	bl FUN_020F2750
	pop {r3, pc}
	arm_func_end FUN_0225F9AC

	arm_func_start FUN_0225F9D8
FUN_0225F9D8: @ 0x0225F9D8
	push {r3, r4, r5, lr}
	sub sp, sp, #0x18
	mov r5, r0
	mov r0, #0xc9
	mov r1, #0x75
	blx FUN_02007688
	mov r4, r0
	str r4, [sp]
	mov r0, #0x3a
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	ldr r0, _0225FAB4 @ =0x00002715
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x8c]
	ldr r2, [r5, #0x24]
	ldr r3, [r5, #0x28]
	mov r1, #2
	blx FUN_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r0, _0225FAB8 @ =0x00002713
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	mov r2, r4
	mov r3, #0x37
	blx FUN_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225FAB8 @ =0x00002713
	mov r2, r4
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	mov r3, #0x39
	blx FUN_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225FAB8 @ =0x00002713
	mov r2, r4
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	mov r3, #0x38
	blx FUN_0200D71C
	mov r0, r4
	blx FUN_0200770C
	add sp, sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225FAB4: .4byte 0x00002715
_0225FAB8: .4byte 0x00002713
	arm_func_end FUN_0225F9D8

	arm_func_start FUN_0225FABC
FUN_0225FABC: @ 0x0225FABC
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x28]
	ldr r1, _0225FAF8 @ =0x00002713
	blx FUN_0200D958
	ldr r0, [r4, #0x28]
	ldr r1, _0225FAF8 @ =0x00002713
	blx FUN_0200D978
	ldr r0, [r4, #0x28]
	ldr r1, _0225FAF8 @ =0x00002713
	blx FUN_0200D988
	ldr r0, [r4, #0x28]
	ldr r1, _0225FAFC @ =0x00002715
	blx FUN_0200D968
	pop {r4, pc}
	.align 2, 0
_0225FAF8: .4byte 0x00002713
_0225FAFC: .4byte 0x00002715
	arm_func_end FUN_0225FABC

	arm_func_start FUN_0225FB00
FUN_0225FB00: @ 0x0225FB00
	push {r4, r5, lr}
	sub sp, sp, #0x34
	ldr lr, _0225FB68 @ =0x02262C38
	mov r5, r0
	ldm lr!, {r0, r1, r2, r3}
	add ip, sp, #0
	mov r4, ip
	stm ip!, {r0, r1, r2, r3}
	ldm lr!, {r0, r1, r2, r3}
	stm ip!, {r0, r1, r2, r3}
	ldm lr!, {r0, r1, r2, r3}
	stm ip!, {r0, r1, r2, r3}
	ldr r0, [lr]
	mov r2, r4
	str r0, [ip]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	blx FUN_0200D734
	mov r4, r0
	mov r1, #0
	blx FUN_0200DCE8
	ldr r0, [r4]
	blx FUN_0200DC0C
	mov r0, r4
	add sp, sp, #0x34
	pop {r4, r5, pc}
	.align 2, 0
_0225FB68: .4byte 0x02262C38
	arm_func_end FUN_0225FB00

	arm_func_start FUN_0225FB6C
FUN_0225FB6C: @ 0x0225FB6C
	push {r4, r5, r6, lr}
	mov r6, r0
	ldr r2, [r6, #0x238]
	mov r5, r1
	cmp r2, #0
	moveq r4, #0
	beq _0225FB94
	mov r1, #0
	bl FUN_0225F8AC
	add r4, r0, #1
_0225FB94:
	ldr r1, [r6, #0x270]
	ldr r0, _0225FBE0 @ =0x02262C07
	ldr r3, [r6, #0x21c]
	ldrb r0, [r0, r1, lsl #2]
	ldr r2, [r6, #0x230]
	lsl r1, r3, #0x10
	add r0, r0, r2, asr #12
	lsl r2, r0, #0x10
	mov r0, r5
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	mov r3, #0x160000
	blx FUN_0200DDF4
	mov r0, r5
	mov r1, r4
	blx FUN_0200DC4C
	ldr r0, [r5]
	blx FUN_0200DC0C
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225FBE0: .4byte 0x02262C07
	arm_func_end FUN_0225FB6C

	arm_func_start FUN_0225FBE4
FUN_0225FBE4: @ 0x0225FBE4
	ldr ip, _0225FBEC @ =FUN_0200D9DC
	bx ip
	.align 2, 0
_0225FBEC: .4byte FUN_0200D9DC
	arm_func_end FUN_0225FBE4

	thumb_func_start ov93_0225FBF0
ov93_0225FBF0: @ 0x0225FBF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	str r1, [sp, #0x10]
	movs r0, #0xc9
	movs r1, #0x75
	adds r5, r2, #0
	adds r4, r3, #0
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0x75
	str r1, [sp, #0xc]
	ldr r1, _0225FC7C @ =0x02262CEC
	lsls r6, r5, #3
	ldrh r1, [r1, r6]
	adds r2, r7, #0
	movs r3, #7
	str r0, [sp, #0x14]
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	ldr r1, _0225FC80 @ =0x02262CEE
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x75
	str r0, [sp, #0xc]
	ldrh r1, [r1, r6]
	ldr r0, [sp, #0x14]
	adds r2, r7, #0
	movs r3, #7
	bl FUN_02007B68
	ldr r0, [sp, #0x14]
	bl FUN_0200770C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x30
	blx FUN_020D4994
	ldr r0, [sp, #0x10]
	movs r1, #0xc
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r0, _0225FC84 @ =0x02262FD4
	lsls r1, r5, #2
	adds r0, r0, r2
	ldr r0, [r1, r0]
	movs r1, #1
	str r0, [r4, #0xc]
	str r5, [r4, #4]
	adds r0, r4, #0
	str r1, [r4]
	adds r0, #0x2c
	strb r1, [r0]
	ldr r2, [sp, #0x10]
	adds r0, r7, #0
	adds r1, r4, #0
	bl ov93_0225FCA4
	ldr r0, _0225FC88 @ =0x000005EB
	bl FUN_0200604C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225FC7C: .4byte 0x02262CEC
_0225FC80: .4byte 0x02262CEE
_0225FC84: .4byte 0x02262FD4
_0225FC88: .4byte 0x000005EB
	thumb_func_end ov93_0225FBF0

	thumb_func_start ov93_0225FC8C
ov93_0225FC8C: @ 0x0225FC8C
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #7
	bl FUN_0201CAE0
	movs r0, #0
	str r0, [r4]
	movs r0, #1
	adds r4, #0x2d
	strb r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov93_0225FC8C

	thumb_func_start ov93_0225FCA4
ov93_0225FCA4: @ 0x0225FCA4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r1, #0
	str r0, [sp, #4]
	ldr r0, [r5]
	cmp r0, #0
	beq _0225FD86
	add r0, sp, #0xc
	str r0, [sp]
	adds r0, r2, #0
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	add r3, sp, #0x10
	bl ov93_0225FD8C
	movs r0, #1
	ldr r1, [sp, #0x10]
	lsls r0, r0, #0xc
	cmp r1, r0
	bne _0225FCD0
	movs r7, #0
	b _0225FCF0
_0225FCD0:
	bge _0225FCE2
	lsls r1, r1, #7
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r1, r0, #0xc
	movs r0, #0x80
	subs r7, r0, r1
	b _0225FCF0
_0225FCE2:
	subs r0, r1, r0
	lsls r1, r0, #7
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	rsbs r7, r0, #0
_0225FCF0:
	movs r0, #1
	ldr r1, [sp, #0xc]
	lsls r0, r0, #0xc
	cmp r1, r0
	bne _0225FCFE
	movs r6, #0
	b _0225FD1E
_0225FCFE:
	bge _0225FD10
	lsls r1, r1, #7
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r1, r0, #0xc
	movs r0, #0x80
	subs r6, r0, r1
	b _0225FD1E
_0225FD10:
	subs r0, r1, r0
	lsls r1, r0, #7
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	rsbs r6, r0, #0
_0225FD1E:
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _0225FD28
	movs r4, #0
	b _0225FD44
_0225FD28:
	bl FUN_0201FD44
	movs r1, #7
	ands r0, r1
	adds r4, r0, #1
	ldr r1, [r5, #0x28]
	movs r0, #1
	tst r0, r1
	beq _0225FD3C
	rsbs r4, r4, #0
_0225FD3C:
	ldr r1, [r5, #0x28]
	movs r0, #1
	eors r0, r1
	str r0, [r5, #0x28]
_0225FD44:
	ldr r0, [sp, #0x10]
	blx FUN_020CCBB0
	adds r5, r0, #0
	ldr r0, [sp, #0xc]
	blx FUN_020CCBB0
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	movs r1, #7
	movs r2, #3
	adds r3, r5, #0
	bl FUN_0201F25C
	ldr r0, [sp, #4]
	ldr r3, [sp, #8]
	movs r1, #7
	movs r2, #6
	bl FUN_0201F25C
	ldr r0, [sp, #4]
	movs r1, #7
	movs r2, #0
	subs r3, r4, r7
	bl FUN_0201F238
	movs r3, #0x27
	ldr r0, [sp, #4]
	movs r1, #7
	movs r2, #3
	subs r3, r3, r6
	bl FUN_0201F238
_0225FD86:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov93_0225FCA4

	thumb_func_start ov93_0225FD8C
ov93_0225FD8C: @ 0x0225FD8C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r3, #0
	ldr r0, _0225FDE8 @ =0x02262CF0
	lsls r3, r1, #3
	ldr r0, [r0, r3]
	adds r6, r5, #0
	muls r0, r2, r0
	movs r2, #0xc
	muls r6, r2, r6
	ldr r3, _0225FDEC @ =0x02262FD4
	lsls r2, r1, #2
	adds r1, r3, r6
	ldr r1, [r2, r1]
	blx FUN_020F2998
	movs r1, #3
	lsls r1, r1, #8
	adds r2, r0, r1
	ldr r1, [sp, #0x10]
	str r2, [r4]
	str r2, [r1]
	movs r1, #1
	lsls r1, r1, #0xc
	cmp r2, r1
	ble _0225FDE6
	movs r1, #0xd
	lsls r1, r1, #8
	subs r0, r0, r1
	ldr r2, _0225FDF0 @ =0x0000119A
	asrs r1, r0, #0x1f
	movs r3, #0
	blx FUN_020F2948
	movs r3, #2
	movs r5, #0
	lsls r3, r3, #0xa
	adds r3, r0, r3
	adcs r1, r5
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	ldr r2, [r4]
	orrs r1, r0
	adds r0, r2, r1
	str r0, [r4]
_0225FDE6:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225FDE8: .4byte 0x02262CF0
_0225FDEC: .4byte 0x02262FD4
_0225FDF0: .4byte 0x0000119A
	thumb_func_end ov93_0225FD8C

	thumb_func_start ov93_0225FDF4
ov93_0225FDF4: @ 0x0225FDF4
	cmp r0, #0xa
	blt _0225FDFC
	movs r0, #2
	bx lr
_0225FDFC:
	cmp r0, #5
	blt _0225FE04
	movs r0, #1
	bx lr
_0225FE04:
	movs r0, #0
	bx lr
	thumb_func_end ov93_0225FDF4

	thumb_func_start ov93_0225FE08
ov93_0225FE08: @ 0x0225FE08
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x10]
	adds r6, r2, #0
	adds r0, r0, r6
	adds r7, r3, #0
	str r0, [r4, #0x10]
	movs r1, #6
	blx FUN_020F2998
	str r0, [r4, #0x14]
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov93_0225E3C4
	adds r1, r4, #0
	adds r1, #0x18
	lsls r0, r0, #2
	ldr r2, [r1, r0]
	adds r2, r2, r6
	str r2, [r1, r0]
	bl FUN_0203769C
	cmp r7, r0
	bne _0225FE4E
	ldr r1, _0225FE54 @ =0x00003848
	ldr r0, [r5, r1]
	adds r0, r0, r6
	str r0, [r5, r1]
	ldr r0, _0225FE58 @ =0x000015A8
	ldr r1, [r5, r1]
	adds r0, r5, r0
	bl ov93_02262098
_0225FE4E:
	ldr r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225FE54: .4byte 0x00003848
_0225FE58: .4byte 0x000015A8
	thumb_func_end ov93_0225FE08

	thumb_func_start ov93_0225FE5C
ov93_0225FE5C: @ 0x0225FE5C
	ldr r1, [r0, #0x10]
	cmp r1, #0
	bne _0225FE66
	movs r0, #0
	bx lr
_0225FE66:
	ldr r2, [r0, #0x14]
	cmp r1, r2
	bge _0225FE6E
	adds r2, r1, #0
_0225FE6E:
	ldr r1, [r0, #0x10]
	subs r1, r1, r2
	str r1, [r0, #0x10]
	ldr r1, [r0, #8]
	adds r1, r1, r2
	str r1, [r0, #8]
	movs r0, #1
	bx lr
	.align 2, 0
	thumb_func_end ov93_0225FE5C

	thumb_func_start ov93_0225FE80
ov93_0225FE80: @ 0x0225FE80
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0225FEA8 @ =0x00002FCC
	adds r6, r1, #0
	ldr r0, [r5, r0]
	adds r4, r2, #0
	cmp r0, #0
	beq _0225FEA4
	adds r0, r4, #0
	bl ov93_0225FE5C
	ldr r2, [r5]
	adds r0, r6, #0
	adds r2, #0x30
	ldrb r2, [r2]
	adds r1, r4, #0
	bl ov93_0225FCA4
_0225FEA4:
	pop {r4, r5, r6, pc}
	nop
_0225FEA8: .4byte 0x00002FCC
	thumb_func_end ov93_0225FE80

	thumb_func_start ov93_0225FEAC
ov93_0225FEAC: @ 0x0225FEAC
	ldr r1, _0225FEBC @ =0x00001428
	ldr r3, _0225FEC0 @ =FUN_020F2998
	adds r2, r0, r1
	ldr r1, [r2, #8]
	movs r0, #0x64
	muls r0, r1, r0
	ldr r1, [r2, #0xc]
	bx r3
	.align 2, 0
_0225FEBC: .4byte 0x00001428
_0225FEC0: .4byte FUN_020F2998
	thumb_func_end ov93_0225FEAC

	thumb_func_start ov93_0225FEC4
ov93_0225FEC4: @ 0x0225FEC4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0225FF14 @ =0x00002FDC
	adds r4, r1, #0
	movs r3, #0
	adds r2, r5, #0
_0225FED2:
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _0225FF00
	ldr r2, _0225FF14 @ =0x00002FDC
	movs r6, #0x18
	adds r2, r5, r2
	muls r6, r3, r6
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r2, r6
	bl ov93_0225FF1C
	str r0, [sp]
	ldr r1, _0225FF18 @ =0x00001560
	ldrb r2, [r4, #1]
	ldrb r3, [r4]
	adds r0, r5, #0
	adds r1, r5, r1
	bl ov93_02261C58
	add sp, #4
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0225FF00:
	adds r3, r3, #1
	adds r2, #0x18
	cmp r3, #0x28
	blt _0225FED2
	bl FUN_0202551C
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0225FF14: .4byte 0x00002FDC
_0225FF18: .4byte 0x00001560
	thumb_func_end ov93_0225FEC4

	thumb_func_start ov93_0225FF1C
ov93_0225FF1C: @ 0x0225FF1C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r2, #0
	adds r7, r0, #0
	ldr r0, [r4]
	adds r5, r1, #0
	cmp r0, #0
	beq _0225FF2E
	bl FUN_0202551C
_0225FF2E:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x18
	blx FUN_020D4994
	ldrb r1, [r5]
	adds r0, r7, #0
	bl ov93_0225E3C4
	ldr r1, [r7]
	ldr r3, _0225FFF4 @ =0x02263010
	adds r1, #0x30
	ldrb r2, [r1]
	movs r1, #0x28
	muls r1, r2, r1
	movs r2, #0xa
	muls r2, r0, r2
	ldrb r0, [r5]
	adds r1, r3, r1
	adds r6, r1, r2
	strh r0, [r4, #4]
	ldrh r0, [r5, #2]
	adds r1, r6, #0
	strh r0, [r4, #6]
	ldr r0, [r5, #8]
	str r0, [r4, #8]
	str r6, [r4, #0x14]
	ldrb r0, [r5, #1]
	strb r0, [r4, #0xe]
	adds r0, r7, #0
	bl ov93_0226027C
	str r0, [r4, #0x10]
	bl FUN_0203769C
	ldrb r1, [r5]
	cmp r1, r0
	bne _0225FF8E
	ldr r1, [r5, #4]
	adds r0, r7, #0
	bl ov93_0225DF38
	movs r0, #0x19
	strh r0, [r4, #0xc]
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_0200DCE8
_0225FF8E:
	movs r0, #1
	str r0, [r4]
	add r1, sp, #0
	movs r3, #0x16
	ldr r0, [r4, #0x10]
	adds r1, #2
	add r2, sp, #0
	lsls r3, r3, #0x10
	movs r5, #0
	bl FUN_0200DE94
	ldrb r0, [r6, #7]
	cmp r0, #3
	bhi _0225FFE8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225FFB6: @ jump table
	.2byte _0225FFBE - _0225FFB6 - 2 @ case 0
	.2byte _0225FFCA - _0225FFB6 - 2 @ case 1
	.2byte _0225FFD4 - _0225FFB6 - 2 @ case 2
	.2byte _0225FFDE - _0225FFB6 - 2 @ case 3
_0225FFBE:
	add r1, sp, #0
	adds r0, r5, #0
	ldrsh r1, [r1, r0]
	movs r0, #0x1c
	subs r5, r0, r1
	b _0225FFE8
_0225FFCA:
	add r1, sp, #0
	movs r0, #2
	ldrsh r5, [r1, r0]
	subs r5, #0xcc
	b _0225FFE8
_0225FFD4:
	add r1, sp, #0
	adds r0, r5, #0
	ldrsh r5, [r1, r0]
	subs r5, #0xa4
	b _0225FFE8
_0225FFDE:
	add r1, sp, #0
	movs r0, #2
	ldrsh r1, [r1, r0]
	movs r0, #0x34
	subs r5, r0, r1
_0225FFE8:
	movs r1, #5
	lsls r0, r5, #0xc
	lsls r1, r1, #0xc
	blx FUN_020F2998
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225FFF4: .4byte 0x02263010
	thumb_func_end ov93_0225FF1C

	thumb_func_start ov93_0225FFF8
ov93_0225FFF8: @ 0x0225FFF8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _02260070 @ =0x00002FDC
	movs r6, #0
	adds r4, r5, r0
	adds r7, r6, #0
_02260004:
	ldr r0, [r4]
	cmp r0, #1
	bne _02260064
	movs r0, #0xc
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0226002C
	movs r0, #0xc
	ldrsh r0, [r4, r0]
	subs r0, r0, #1
	strh r0, [r4, #0xc]
	movs r0, #0xc
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _02260064
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0200DCE8
	b _02260064
_0226002C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov93_02260080
	cmp r0, #1
	bne _02260064
	ldr r0, _02260074 @ =0x00002FCC
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0226005C
	ldr r0, _02260078 @ =0x00002FBC
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0226005C
	ldrb r0, [r4, #0xe]
	ldr r1, _0226007C @ =0x00001428
	movs r3, #4
	str r0, [sp]
	ldrsh r3, [r4, r3]
	ldr r2, [r4, #8]
	adds r0, r5, #0
	adds r1, r5, r1
	bl ov93_0225FE08
_0226005C:
	ldr r0, [r4, #0x10]
	bl FUN_0200D9DC
	str r7, [r4]
_02260064:
	adds r6, r6, #1
	adds r4, #0x18
	cmp r6, #0x28
	blt _02260004
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260070: .4byte 0x00002FDC
_02260074: .4byte 0x00002FCC
_02260078: .4byte 0x00002FBC
_0226007C: .4byte 0x00001428
	thumb_func_end ov93_0225FFF8

	thumb_func_start ov93_02260080
ov93_02260080: @ 0x02260080
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	str r0, [sp]
	add r1, sp, #4
	movs r3, #0x16
	ldr r0, [r4, #0x10]
	adds r1, #2
	add r2, sp, #4
	lsls r3, r3, #0x10
	movs r7, #0
	bl FUN_0200DE94
	ldr r0, [r4, #0x14]
	ldrb r0, [r0, #7]
	cmp r0, #3
	bhi _02260188
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022600AE: @ jump table
	.2byte _022600B6 - _022600AE - 2 @ case 0
	.2byte _022600EC - _022600AE - 2 @ case 1
	.2byte _02260120 - _022600AE - 2 @ case 2
	.2byte _02260152 - _022600AE - 2 @ case 3
_022600B6:
	add r0, sp, #4
	adds r1, r7, #0
	ldrsh r2, [r0, r1]
	movs r0, #0x1c
	subs r6, r0, r2
	movs r2, #5
	ldr r0, [r4, #0x10]
	lsls r2, r2, #0xc
	bl FUN_0200DEDC
	add r1, sp, #8
	movs r3, #0x16
	ldr r0, [r4, #0x10]
	adds r1, #2
	add r2, sp, #8
	lsls r3, r3, #0x10
	bl FUN_0200DE94
	add r1, sp, #4
	movs r0, #4
	ldrsh r1, [r1, r0]
	movs r0, #0x1c
	subs r5, r0, r1
	cmp r1, #0x4a
	ble _02260188
	movs r7, #1
	b _02260188
_022600EC:
	add r1, sp, #4
	movs r0, #2
	ldrsh r6, [r1, r0]
	ldr r0, [r4, #0x10]
	ldr r1, _02260270 @ =0xFFFFB000
	adds r2, r7, #0
	subs r6, #0xcc
	bl FUN_0200DEDC
	add r1, sp, #8
	movs r3, #0x16
	ldr r0, [r4, #0x10]
	adds r1, #2
	add r2, sp, #8
	lsls r3, r3, #0x10
	bl FUN_0200DE94
	add r1, sp, #4
	movs r0, #6
	ldrsh r0, [r1, r0]
	adds r5, r0, #0
	subs r5, #0xcc
	cmp r0, #0x98
	bge _02260188
	movs r7, #1
	b _02260188
_02260120:
	add r0, sp, #4
	adds r1, r7, #0
	ldrsh r6, [r0, r1]
	ldr r0, [r4, #0x10]
	ldr r2, _02260270 @ =0xFFFFB000
	subs r6, #0xa4
	bl FUN_0200DEDC
	add r1, sp, #8
	movs r3, #0x16
	ldr r0, [r4, #0x10]
	adds r1, #2
	add r2, sp, #8
	lsls r3, r3, #0x10
	bl FUN_0200DE94
	add r1, sp, #4
	movs r0, #4
	ldrsh r0, [r1, r0]
	adds r5, r0, #0
	subs r5, #0xa4
	cmp r0, #0x72
	bge _02260188
	movs r7, #1
	b _02260188
_02260152:
	add r1, sp, #4
	movs r0, #2
	ldrsh r1, [r1, r0]
	movs r0, #0x34
	adds r2, r7, #0
	subs r6, r0, r1
	movs r1, #5
	ldr r0, [r4, #0x10]
	lsls r1, r1, #0xc
	bl FUN_0200DEDC
	add r1, sp, #8
	movs r3, #0x16
	ldr r0, [r4, #0x10]
	adds r1, #2
	add r2, sp, #8
	lsls r3, r3, #0x10
	bl FUN_0200DE94
	add r1, sp, #4
	movs r0, #6
	ldrsh r1, [r1, r0]
	movs r0, #0x34
	subs r5, r0, r1
	cmp r1, #0x68
	ble _02260188
	movs r7, #1
_02260188:
	cmp r5, #0
	blt _022601B8
	cmp r5, #0xe
	bge _022601F0
	lsls r0, r5, #0xc
	movs r1, #0xe
	blx FUN_020F2998
	movs r1, #1
	lsls r1, r1, #0xa
	cmp r0, r1
	bge _022601A2
	adds r0, r1, #0
_022601A2:
	blx FUN_020F2178
	ldr r1, _02260274 @ =0x45800000
	blx FUN_020F1CC8
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	bl FUN_0200E024
	b _022601F0
_022601B8:
	movs r0, #0xd
	mvns r0, r0
	cmp r5, r0
	ble _022601F0
	ldrb r0, [r4, #0xe]
	rsbs r1, r5, #0
	lsls r2, r0, #2
	ldr r0, _02260278 @ =0x02262CA4
	ldr r0, [r0, r2]
	muls r0, r1, r0
	movs r1, #0xe
	blx FUN_020F2998
	movs r1, #1
	lsls r1, r1, #0xa
	cmp r0, r1
	bge _022601DC
	adds r0, r1, #0
_022601DC:
	blx FUN_020F2178
	ldr r1, _02260274 @ =0x45800000
	blx FUN_020F1CC8
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	bl FUN_0200E024
_022601F0:
	bl FUN_0203769C
	movs r1, #4
	ldrsh r1, [r4, r1]
	cmp r1, r0
	bne _02260260
	cmp r6, #0
	blt _02260260
	cmp r5, #0
	bgt _02260260
	ldr r0, [sp]
	add r1, sp, #0xc
	bl ov93_022614F4
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #0xe]
	cmp r0, #1
	beq _0226021E
	cmp r0, #2
	beq _02260226
	cmp r0, #3
	beq _02260232
	b _0226023A
_0226021E:
	ldr r0, [r4, #8]
	lsls r0, r0, #1
	str r0, [r4, #8]
	b _0226023A
_02260226:
	ldr r1, [r4, #8]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [r4, #8]
	b _0226023A
_02260232:
	ldr r1, [r4, #8]
	lsls r0, r1, #1
	adds r0, r1, r0
	str r0, [r4, #8]
_0226023A:
	ldrb r1, [r4, #0xe]
	ldr r0, [sp]
	bl ov93_02260FB8
	ldrb r0, [r4, #0xe]
	cmp r0, #0
	beq _02260250
	ldr r0, [sp, #0xc]
	movs r1, #3
	bl ov93_02261528
_02260250:
	ldr r0, [sp]
	bl ov93_02260F84
	adds r1, r0, #0
	beq _02260260
	ldr r0, [sp]
	bl ov93_022627E8
_02260260:
	cmp r7, #1
	bne _0226026A
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0226026A:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02260270: .4byte 0xFFFFB000
_02260274: .4byte 0x45800000
_02260278: .4byte 0x02262CA4
	thumb_func_end ov93_02260080

	thumb_func_start ov93_0226027C
ov93_0226027C: @ 0x0226027C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	ldr r6, _022602E0 @ =0x02262DCC
	adds r2, r0, #0
	adds r5, r1, #0
	add r4, sp, #0
	movs r3, #6
_0226028A:
	ldm r6!, {r0, r1}
	stm r4!, {r0, r1}
	subs r3, r3, #1
	bne _0226028A
	ldr r0, [r6]
	add r1, sp, #0
	str r0, [r4]
	movs r0, #0
	ldrsh r0, [r5, r0]
	strh r0, [r1]
	movs r0, #2
	ldrsh r0, [r5, r0]
	strh r0, [r1, #2]
	ldrb r0, [r5, #6]
	str r0, [sp, #0xc]
	ldr r0, [r2, #0x24]
	ldr r1, [r2, #0x28]
	add r2, sp, #0
	bl FUN_0200D734
	movs r1, #0
	movs r2, #2
	movs r3, #0x16
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	lsls r3, r3, #0x10
	adds r4, r0, #0
	bl FUN_0200DDF4
	ldrh r1, [r5, #4]
	adds r0, r4, #0
	bl FUN_0200DC4C
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r4]
	bl FUN_0200DC0C
	adds r0, r4, #0
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_022602E0: .4byte 0x02262DCC
	thumb_func_end ov93_0226027C

	thumb_func_start ov93_022602E4
ov93_022602E4: @ 0x022602E4
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r7, _0226030C @ =0x00002FDC
	adds r5, r0, #0
	adds r6, r4, #0
_022602EE:
	ldr r0, [r5, r7]
	cmp r0, #1
	bne _02260300
	ldr r0, _02260310 @ =0x00002FEC
	ldr r0, [r5, r0]
	bl FUN_0200D9DC
	ldr r0, _0226030C @ =0x00002FDC
	str r6, [r5, r0]
_02260300:
	adds r4, r4, #1
	adds r5, #0x18
	cmp r4, #0x28
	blt _022602EE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226030C: .4byte 0x00002FDC
_02260310: .4byte 0x00002FEC
	thumb_func_end ov93_022602E4

	thumb_func_start ov93_02260314
ov93_02260314: @ 0x02260314
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	ldr r5, _022605F8 @ =0x02262E00
	str r2, [sp, #4]
	adds r7, r0, #0
	str r1, [sp]
	movs r4, #0
	add r3, sp, #0x34
	movs r2, #6
_02260326:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02260326
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x10]
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0xc]
	b _0226044C
_02260344:
	ldr r2, [r7]
	ldr r1, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r2, r1
	adds r1, #0x2c
	ldrb r1, [r1]
	bl ov93_0225E3C4
	adds r5, r0, #0
	ldr r0, [sp, #4]
	lsls r1, r5, #2
	adds r0, r0, r1
	ldr r1, [r0, #0x18]
	movs r0, #0x24
	muls r0, r1, r0
	ldr r2, [sp, #0x14]
	ldr r1, [sp, #0x18]
	adds r1, r2, r1
	blx FUN_020F2998
	ldr r1, [sp, #0xc]
	lsls r5, r5, #1
	lsls r2, r1, #2
	add r1, sp, #0x24
	str r0, [r1, r2]
	ldr r0, [r7]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r3, r0, #3
	ldr r0, _022605FC @ =0x02262D7C
	adds r0, r0, r3
	ldrh r0, [r5, r0]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp]
	adds r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [r1, r2]
	str r0, [sp, #0x20]
	b _0226043E
_02260396:
	movs r0, #0x18
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, [sp, #0x1c]
	add r2, sp, #0x34
	adds r5, r0, r1
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	bl FUN_0200D734
	adds r6, r0, #0
	beq _02260446
	movs r3, #0x16
	movs r1, #0x80
	movs r2, #0x60
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	ldr r1, [sp, #0x10]
	adds r0, r6, #0
	bl FUN_0200DC4C
	ldr r0, [r6]
	bl FUN_0200DC0C
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r2, r0, #0x13
	subs r2, r2, r1
	movs r0, #0x13
	rors r2, r0
	movs r0, #2
	adds r1, r1, r2
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [r5, #4]
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r2, r0, #0x12
	subs r2, r2, r1
	movs r0, #0x12
	rors r2, r0
	movs r0, #2
	adds r1, r1, r2
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [r5, #8]
	bl FUN_0201FD44
	movs r1, #0x5a
	lsls r1, r1, #2
	blx FUN_020F2998
	lsls r0, r1, #0xc
	str r0, [r5, #0xc]
	bl FUN_0201FD44
	movs r1, #5
	lsls r1, r1, #0xe
	blx FUN_020F2998
	movs r0, #0xa
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [r5, #0x10]
	bl FUN_0201FD44
	movs r1, #0xf
	blx FUN_020F2998
	adds r1, #0x14
	strh r1, [r5, #0x14]
	adds r1, r4, #0
	movs r0, #0x18
	muls r1, r0, r1
	ldr r0, [sp]
	adds r4, r4, #1
	adds r0, r0, r1
	str r6, [r0, #4]
	ldr r0, [sp, #8]
	adds r0, r0, #1
	str r0, [sp, #8]
_0226043E:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x20]
	cmp r1, r0
	blt _02260396
_02260446:
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
_0226044C:
	ldr r0, [r7]
	adds r0, #0x30
	ldrb r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	bge _0226045A
	b _02260344
_0226045A:
	movs r0, #0xe
	str r0, [sp, #0x3c]
	movs r0, #0
	movs r1, #0xd9
	str r0, [sp, #0xc]
	str r0, [sp, #0x40]
	ldr r0, [sp]
	lsls r1, r1, #2
	adds r6, r0, r1
	b _02260522
_0226046E:
	ldr r1, [sp, #0xc]
	movs r0, #0x18
	muls r0, r1, r0
	adds r4, r6, r0
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	add r2, sp, #0x34
	bl FUN_0200D734
	adds r5, r0, #0
	beq _02260528
	movs r3, #0x16
	movs r1, #0x80
	movs r2, #0x60
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	bl FUN_0201FD44
	movs r1, #3
	blx FUN_020F2998
	adds r0, r5, #0
	adds r1, #0x1c
	bl FUN_0200DC4C
	ldr r0, [r5]
	bl FUN_0200DC0C
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r2, r0, #0x13
	subs r2, r2, r1
	movs r0, #0x13
	rors r2, r0
	movs r0, #2
	adds r1, r1, r2
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [r4, #4]
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r2, r0, #0x12
	subs r2, r2, r1
	movs r0, #0x12
	rors r2, r0
	movs r0, #2
	adds r1, r1, r2
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [r4, #8]
	bl FUN_0201FD44
	movs r1, #0x5a
	lsls r1, r1, #2
	blx FUN_020F2998
	lsls r0, r1, #0xc
	str r0, [r4, #0xc]
	bl FUN_0201FD44
	movs r1, #5
	lsls r1, r1, #0xe
	blx FUN_020F2998
	movs r0, #1
	lsls r0, r0, #0x10
	adds r0, r1, r0
	str r0, [r4, #0x10]
	bl FUN_0201FD44
	movs r1, #0xf
	blx FUN_020F2998
	adds r1, #0x14
	strh r1, [r4, #0x14]
	ldr r1, [sp, #0xc]
	movs r0, #0x18
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp]
	adds r1, r0, r2
	movs r0, #0xd9
	lsls r0, r0, #2
	str r5, [r1, r0]
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
_02260522:
	ldr r0, [sp, #0xc]
	cmp r0, #8
	blt _0226046E
_02260528:
	movs r0, #0xd
	str r0, [sp, #0x3c]
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	lsls r1, r0, #1
	ldr r0, _02260600 @ =0x02262C6C
	ldrh r0, [r0, r1]
	ldr r1, _02260604 @ =0x00000424
	str r0, [sp, #0x40]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	adds r6, r0, r1
	b _022605EC
_02260544:
	ldr r1, [sp, #0xc]
	movs r0, #0x18
	muls r0, r1, r0
	adds r4, r6, r0
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	add r2, sp, #0x34
	bl FUN_0200D734
	adds r5, r0, #0
	beq _022605F2
	movs r3, #0x16
	movs r1, #0x80
	movs r2, #0x60
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	adds r0, r5, #0
	movs r1, #0xb
	bl FUN_0200DC4C
	ldr r0, [r5]
	bl FUN_0200DC0C
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r2, r0, #0x13
	subs r2, r2, r1
	movs r0, #0x13
	rors r2, r0
	movs r0, #2
	adds r1, r1, r2
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [r4, #4]
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r2, r0, #0x12
	subs r2, r2, r1
	movs r0, #0x12
	rors r2, r0
	movs r0, #2
	adds r1, r1, r2
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [r4, #8]
	bl FUN_0201FD44
	movs r1, #0x5a
	lsls r1, r1, #2
	blx FUN_020F2998
	lsls r0, r1, #0xc
	str r0, [r4, #0xc]
	bl FUN_0201FD44
	movs r1, #5
	lsls r1, r1, #0xe
	blx FUN_020F2998
	movs r0, #1
	lsls r0, r0, #0x10
	adds r0, r1, r0
	str r0, [r4, #0x10]
	bl FUN_0201FD44
	movs r1, #0xf
	blx FUN_020F2998
	adds r1, #0x14
	strh r1, [r4, #0x14]
	ldr r1, [sp, #0xc]
	movs r0, #0x18
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp]
	adds r1, r0, r2
	ldr r0, _02260604 @ =0x00000424
	str r5, [r1, r0]
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
_022605EC:
	ldr r0, [sp, #0xc]
	cmp r0, #3
	blt _02260544
_022605F2:
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022605F8: .4byte 0x02262E00
_022605FC: .4byte 0x02262D7C
_02260600: .4byte 0x02262C6C
_02260604: .4byte 0x00000424
	thumb_func_end ov93_02260314

	thumb_func_start ov93_02260608
ov93_02260608: @ 0x02260608
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0226065C @ =0x000033A0
	movs r4, #0
	adds r5, r6, r0
_02260612:
	ldr r0, [r5]
	cmp r0, #0
	beq _0226061C
	bl FUN_0200D9DC
_0226061C:
	adds r4, r4, #1
	adds r5, #0x18
	cmp r4, #0x24
	blt _02260612
	movs r0, #0x37
	lsls r0, r0, #8
	movs r5, #0
	adds r4, r6, r0
_0226062C:
	ldr r0, [r4]
	cmp r0, #0
	beq _02260636
	bl FUN_0200D9DC
_02260636:
	adds r5, r5, #1
	adds r4, #0x18
	cmp r5, #8
	blt _0226062C
	movs r0, #0xdf
	lsls r0, r0, #6
	movs r4, #0
	adds r5, r6, r0
_02260646:
	ldr r0, [r5]
	cmp r0, #0
	beq _02260650
	bl FUN_0200D9DC
_02260650:
	adds r4, r4, #1
	adds r5, #0x18
	cmp r4, #3
	blt _02260646
	pop {r4, r5, r6, pc}
	nop
_0226065C: .4byte 0x000033A0
	thumb_func_end ov93_02260608

	thumb_func_start ov93_02260660
ov93_02260660: @ 0x02260660
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r1, _022608FC @ =0x0000339C
	movs r4, #0
	adds r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [r0]
	cmp r0, #0
	bne _02260678
	add sp, #0x34
	adds r0, r4, #0
	pop {r4, r5, r6, r7, pc}
_02260678:
	ldr r0, [sp, #0x18]
	str r4, [sp, #0x14]
	adds r5, r0, #4
_0226067E:
	ldr r0, [r5]
	cmp r0, #0
	beq _0226073A
	movs r1, #0x14
	ldrsh r1, [r5, r1]
	cmp r1, #0
	bne _02260696
	bl FUN_0200D9DC
	movs r0, #0
	str r0, [r5]
	b _0226073A
_02260696:
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x10]
	adds r0, r1, r0
	str r0, [r5, #0xc]
	ldr r1, [r5, #4]
	ldr r0, [r5, #8]
	adds r1, r1, r0
	movs r0, #0xa
	lsls r0, r0, #0x10
	str r1, [r5, #4]
	cmp r1, r0
	blt _022606B0
	str r0, [r5, #4]
_022606B0:
	ldr r0, [r5, #0xc]
	ldr r6, [r5, #4]
	bl FUN_0201FD14
	adds r7, r0, #0
	ldr r0, [r5, #4]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	bl FUN_0201FD20
	str r0, [sp, #0x1c]
	asrs r1, r7, #0x1f
	adds r0, r7, #0
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	str r0, [sp, #0x28]
	ldr r2, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	adds r6, r1, #0
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	adds r2, r1, #0
	movs r3, #2
	adds r7, r0, #0
	ldr r1, [sp, #0x28]
	lsls r3, r3, #0xa
	adds r3, r1, r3
	ldr r1, _02260900 @ =0x00000000
	ldr r0, [r5]
	adcs r6, r1
	lsls r1, r6, #0x14
	lsrs r3, r3, #0xc
	orrs r3, r1
	asrs r1, r3, #0xb
	lsrs r1, r1, #0x14
	adds r1, r3, r1
	asrs r1, r1, #0xc
	adds r1, #0x80
	movs r3, #2
	lsls r1, r1, #0x10
	ldr r6, _02260900 @ =0x00000000
	lsls r3, r3, #0xa
	asrs r1, r1, #0x10
	adds r3, r7, r3
	adcs r2, r6
	lsls r2, r2, #0x14
	lsrs r3, r3, #0xc
	orrs r3, r2
	rsbs r3, r3, #0
	asrs r2, r3, #0xb
	lsrs r2, r2, #0x14
	adds r2, r3, r2
	asrs r2, r2, #0xc
	adds r2, #0x60
	lsls r2, r2, #0x10
	movs r3, #0x16
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	movs r0, #0x14
	ldrsh r0, [r5, r0]
	adds r4, r4, #1
	subs r0, r0, #1
	strh r0, [r5, #0x14]
_0226073A:
	ldr r0, [sp, #0x14]
	adds r5, #0x18
	adds r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #0x24
	blt _0226067E
	movs r0, #0
	str r0, [sp]
	movs r1, #0xd9
	ldr r0, [sp, #0x18]
	lsls r1, r1, #2
	adds r5, r0, r1
_02260752:
	ldr r0, [r5]
	cmp r0, #0
	beq _0226080E
	movs r1, #0x14
	ldrsh r1, [r5, r1]
	cmp r1, #0
	bne _0226076A
	bl FUN_0200D9DC
	movs r0, #0
	str r0, [r5]
	b _0226080E
_0226076A:
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x10]
	adds r0, r1, r0
	str r0, [r5, #0xc]
	ldr r1, [r5, #4]
	ldr r0, [r5, #8]
	adds r1, r1, r0
	movs r0, #0xa
	lsls r0, r0, #0x10
	str r1, [r5, #4]
	cmp r1, r0
	blt _02260784
	str r0, [r5, #4]
_02260784:
	ldr r0, [r5, #0xc]
	ldr r6, [r5, #4]
	bl FUN_0201FD14
	adds r7, r0, #0
	ldr r0, [r5, #4]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	bl FUN_0201FD20
	str r0, [sp, #0x20]
	asrs r1, r7, #0x1f
	adds r0, r7, #0
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	str r0, [sp, #0x2c]
	ldr r2, [sp, #0xc]
	ldr r0, [sp, #0x20]
	adds r6, r1, #0
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	adds r2, r1, #0
	movs r3, #2
	adds r7, r0, #0
	ldr r1, [sp, #0x2c]
	lsls r3, r3, #0xa
	adds r3, r1, r3
	ldr r1, _02260900 @ =0x00000000
	ldr r0, [r5]
	adcs r6, r1
	lsls r1, r6, #0x14
	lsrs r3, r3, #0xc
	orrs r3, r1
	asrs r1, r3, #0xb
	lsrs r1, r1, #0x14
	adds r1, r3, r1
	asrs r1, r1, #0xc
	adds r1, #0x80
	movs r3, #2
	lsls r1, r1, #0x10
	ldr r6, _02260900 @ =0x00000000
	lsls r3, r3, #0xa
	asrs r1, r1, #0x10
	adds r3, r7, r3
	adcs r2, r6
	lsls r2, r2, #0x14
	lsrs r3, r3, #0xc
	orrs r3, r2
	rsbs r3, r3, #0
	asrs r2, r3, #0xb
	lsrs r2, r2, #0x14
	adds r2, r3, r2
	asrs r2, r2, #0xc
	adds r2, #0x60
	lsls r2, r2, #0x10
	movs r3, #0x16
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	movs r0, #0x14
	ldrsh r0, [r5, r0]
	adds r4, r4, #1
	subs r0, r0, #1
	strh r0, [r5, #0x14]
_0226080E:
	ldr r0, [sp]
	adds r5, #0x18
	adds r0, r0, #1
	str r0, [sp]
	cmp r0, #8
	blt _02260752
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _02260904 @ =0x00000424
	ldr r0, [sp, #0x18]
	adds r5, r0, r1
_02260824:
	ldr r0, [r5]
	cmp r0, #0
	beq _022608E0
	movs r1, #0x14
	ldrsh r1, [r5, r1]
	cmp r1, #0
	bne _0226083C
	bl FUN_0200D9DC
	movs r0, #0
	str r0, [r5]
	b _022608E0
_0226083C:
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x10]
	adds r0, r1, r0
	str r0, [r5, #0xc]
	ldr r1, [r5, #4]
	ldr r0, [r5, #8]
	adds r1, r1, r0
	movs r0, #0xa
	lsls r0, r0, #0x10
	str r1, [r5, #4]
	cmp r1, r0
	blt _02260856
	str r0, [r5, #4]
_02260856:
	ldr r0, [r5, #0xc]
	ldr r6, [r5, #4]
	bl FUN_0201FD14
	adds r7, r0, #0
	ldr r0, [r5, #4]
	str r0, [sp, #8]
	ldr r0, [r5, #0xc]
	bl FUN_0201FD20
	str r0, [sp, #0x24]
	asrs r1, r7, #0x1f
	adds r0, r7, #0
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	str r0, [sp, #0x30]
	ldr r2, [sp, #8]
	ldr r0, [sp, #0x24]
	adds r6, r1, #0
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	adds r2, r1, #0
	movs r3, #2
	adds r7, r0, #0
	ldr r1, [sp, #0x30]
	lsls r3, r3, #0xa
	adds r3, r1, r3
	ldr r1, _02260900 @ =0x00000000
	ldr r0, [r5]
	adcs r6, r1
	lsls r1, r6, #0x14
	lsrs r3, r3, #0xc
	orrs r3, r1
	asrs r1, r3, #0xb
	lsrs r1, r1, #0x14
	adds r1, r3, r1
	asrs r1, r1, #0xc
	adds r1, #0x80
	movs r3, #2
	lsls r1, r1, #0x10
	ldr r6, _02260900 @ =0x00000000
	lsls r3, r3, #0xa
	asrs r1, r1, #0x10
	adds r3, r7, r3
	adcs r2, r6
	lsls r2, r2, #0x14
	lsrs r3, r3, #0xc
	orrs r3, r2
	rsbs r3, r3, #0
	asrs r2, r3, #0xb
	lsrs r2, r2, #0x14
	adds r2, r3, r2
	asrs r2, r2, #0xc
	adds r2, #0x60
	lsls r2, r2, #0x10
	movs r3, #0x16
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	movs r0, #0x14
	ldrsh r0, [r5, r0]
	adds r4, r4, #1
	subs r0, r0, #1
	strh r0, [r5, #0x14]
_022608E0:
	ldr r0, [sp, #4]
	adds r5, #0x18
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #3
	blt _02260824
	cmp r4, #0
	bne _022608F6
	ldr r0, [sp, #0x18]
	movs r1, #0
	str r1, [r0]
_022608F6:
	movs r0, #1
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022608FC: .4byte 0x0000339C
_02260900: .4byte 0x00000000
_02260904: .4byte 0x00000424
	thumb_func_end ov93_02260660

	thumb_func_start ov93_02260908
ov93_02260908: @ 0x02260908
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02260970 @ =0x0000339C
	adds r4, r5, r0
	ldr r0, [r4]
	cmp r0, #1
	bne _0226091A
	movs r0, #0
	pop {r3, r4, r5, pc}
_0226091A:
	movs r2, #0x47
	adds r0, r4, #0
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020D4994
	ldr r1, _02260970 @ =0x0000339C
	ldr r2, _02260974 @ =0x00001428
	adds r0, r5, #0
	adds r1, r5, r1
	adds r2, r5, r2
	bl ov93_02260314
	ldr r1, _02260974 @ =0x00001428
	ldr r0, [r5, #0x2c]
	adds r1, r5, r1
	bl ov93_0225FC8C
	adds r0, r5, #0
	bl ov93_02260B84
	movs r2, #0
	ldr r0, _02260978 @ =0x00002FCC
	adds r1, r2, #0
	str r2, [r5, r0]
	ldr r0, _0226097C @ =0x00001430
	str r2, [r5, r0]
	adds r0, #8
	str r2, [r5, r0]
	movs r0, #0x51
	lsls r0, r0, #6
_02260958:
	adds r2, r2, #1
	str r1, [r5, r0]
	adds r5, r5, #4
	cmp r2, #4
	blt _02260958
	ldr r0, _02260980 @ =0x00000594
	bl FUN_0200604C
	movs r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_02260970: .4byte 0x0000339C
_02260974: .4byte 0x00001428
_02260978: .4byte 0x00002FCC
_0226097C: .4byte 0x00001430
_02260980: .4byte 0x00000594
	thumb_func_end ov93_02260908

	thumb_func_start ov93_02260984
ov93_02260984: @ 0x02260984
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r6, _022609DC @ =0x02262E34
	adds r4, r2, #0
	adds r3, r0, #0
	adds r7, r1, #0
	add r5, sp, #0
	movs r2, #6
_02260994:
	ldm r6!, {r0, r1}
	stm r5!, {r0, r1}
	subs r2, r2, #1
	bne _02260994
	ldr r0, [r6]
	add r2, sp, #0
	str r0, [r5]
	ldr r0, [r3, #0x24]
	ldr r1, [r3, #0x28]
	bl FUN_0200D734
	movs r3, #0x16
	lsls r2, r4, #4
	movs r1, #0x48
	subs r1, r1, r2
	lsls r1, r1, #0x10
	adds r5, r0, #0
	asrs r1, r1, #0x10
	movs r2, #0x20
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_0200DC4C
	ldr r0, [r5]
	bl FUN_0200DC0C
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200DC78
	adds r0, r5, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022609DC: .4byte 0x02262E34
	thumb_func_end ov93_02260984

	thumb_func_start ov93_022609E0
ov93_022609E0: @ 0x022609E0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _02260A10 @ =0x0000380C
	movs r4, #0
	adds r5, r7, r0
	adds r6, r4, #0
_022609EC:
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl ov93_02260A58
	ldr r0, [r5]
	adds r1, r6, #0
	bl FUN_0200DC34
	movs r0, #1
	lsls r0, r0, #0xe
	adds r4, r4, #1
	adds r5, #0xc
	adds r6, r6, r0
	cmp r4, #5
	blt _022609EC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02260A10: .4byte 0x0000380C
	thumb_func_end ov93_022609E0

	thumb_func_start ov93_02260A14
ov93_02260A14: @ 0x02260A14
	push {r4, r5, r6, lr}
	ldr r6, _02260A2C @ =0x0000380C
	adds r5, r0, #0
	movs r4, #0
_02260A1C:
	ldr r0, [r5, r6]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, #0xc
	cmp r4, #5
	blt _02260A1C
	pop {r4, r5, r6, pc}
	.align 2, 0
_02260A2C: .4byte 0x0000380C
	thumb_func_end ov93_02260A14

	thumb_func_start ov93_02260A30
ov93_02260A30: @ 0x02260A30
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _02260A54 @ =0x0000380C
	movs r4, #0
	adds r5, r6, r0
_02260A3A:
	adds r0, r5, #0
	bl ov93_02260A8C
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov93_02260AD8
	adds r4, r4, #1
	adds r5, #0xc
	cmp r4, #5
	blt _02260A3A
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_02260A54: .4byte 0x0000380C
	thumb_func_end ov93_02260A30

	thumb_func_start ov93_02260A58
ov93_02260A58: @ 0x02260A58
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	adds r4, r2, #0
	adds r6, r3, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	adds r0, r6, #0
	bl ov93_02260B70
	strb r0, [r5, #4]
	movs r0, #1
	strb r0, [r5, #5]
	ldrb r1, [r5, #4]
	adds r0, r7, #0
	adds r2, r4, #0
	bl ov93_02260984
	str r0, [r5]
	strb r4, [r5, #6]
	strh r6, [r5, #8]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov93_02260A58

	thumb_func_start ov93_02260A8C
ov93_02260A8C: @ 0x02260A8C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #6]
	movs r3, #0x16
	add r2, sp, #0
	lsls r1, r0, #4
	movs r0, #0x48
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	add r1, sp, #0
	ldr r0, [r5]
	adds r1, #2
	lsls r3, r3, #0x10
	bl FUN_0200DE94
	add r1, sp, #0
	movs r0, #2
	ldrsh r2, [r1, r0]
	cmp r4, r2
	ble _02260AD6
	adds r2, r2, #2
	strh r2, [r1, #2]
	ldrsh r0, [r1, r0]
	cmp r0, r4
	ble _02260AC2
	strh r4, [r1, #2]
_02260AC2:
	add r3, sp, #0
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	movs r3, #0x16
	ldr r0, [r5]
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
_02260AD6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov93_02260A8C

	thumb_func_start ov93_02260AD8
ov93_02260AD8: @ 0x02260AD8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldrb r1, [r4, #6]
	adds r5, r0, #0
	cmp r1, #0
	bne _02260B66
	ldrb r1, [r4, #5]
	cmp r1, #1
	beq _02260B44
	cmp r1, #3
	bne _02260B66
	ldr r0, [r4]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _02260B66
	movs r0, #8
	ldrsh r1, [r4, r0]
	adds r1, r1, #5
	strh r1, [r4, #8]
	ldrsh r0, [r4, r0]
	bl ov93_02260B70
	strb r0, [r4, #4]
	movs r0, #1
	strb r0, [r4, #5]
	ldrb r1, [r4, #4]
	ldr r0, [r4]
	bl FUN_0200DC4C
	movs r1, #7
	movs r3, #0x16
	ldr r0, [r4]
	mvns r1, r1
	movs r2, #0x20
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	ldr r0, _02260B68 @ =0x0000380C
	movs r2, #0
	adds r3, r5, r0
	movs r1, #4
_02260B2C:
	ldrb r0, [r3, #6]
	cmp r0, #0
	bne _02260B36
	strb r1, [r3, #6]
	b _02260B3A
_02260B36:
	subs r0, r0, #1
	strb r0, [r3, #6]
_02260B3A:
	adds r2, r2, #1
	adds r3, #0xc
	cmp r2, #5
	blt _02260B2C
	pop {r3, r4, r5, pc}
_02260B44:
	bl ov93_0225FEAC
	ldrb r1, [r4, #5]
	cmp r1, #1
	bne _02260B66
	cmp r0, #0x4b
	ble _02260B66
	movs r0, #2
	strb r0, [r4, #5]
	ldrb r1, [r4, #4]
	ldr r0, [r4]
	adds r1, r1, #3
	bl FUN_0200DC4C
	ldr r0, _02260B6C @ =0x00000596
	bl FUN_0200604C
_02260B66:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02260B68: .4byte 0x0000380C
_02260B6C: .4byte 0x00000596
	thumb_func_end ov93_02260AD8

	thumb_func_start ov93_02260B70
ov93_02260B70: @ 0x02260B70
	cmp r0, #0xa
	blt _02260B78
	movs r0, #2
	bx lr
_02260B78:
	cmp r0, #5
	blt _02260B80
	movs r0, #1
	bx lr
_02260B80:
	movs r0, #0
	bx lr
	thumb_func_end ov93_02260B70

	thumb_func_start ov93_02260B84
ov93_02260B84: @ 0x02260B84
	push {r3, lr}
	ldr r1, _02260BAC @ =0x0000380C
	movs r2, #0
	adds r1, r0, r1
_02260B8C:
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _02260BA0
	movs r0, #3
	strb r0, [r1, #5]
	ldr r0, [r1]
	movs r1, #6
	bl FUN_0200DC4C
	pop {r3, pc}
_02260BA0:
	adds r2, r2, #1
	adds r1, #0xc
	cmp r2, #5
	blt _02260B8C
	pop {r3, pc}
	nop
_02260BAC: .4byte 0x0000380C
	thumb_func_end ov93_02260B84

	thumb_func_start ov93_02260BB0
ov93_02260BB0: @ 0x02260BB0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #3
	bne _02260BEC
	movs r0, #0xc
	str r0, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	ldr r0, [r4, #0x2c]
	movs r2, #0
	movs r3, #0xd
	bl FUN_0201CA4C
	movs r0, #0xc
	str r0, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #0x2c]
	movs r2, #0x14
	movs r3, #0xd
	bl FUN_0201CA4C
_02260BEC:
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov93_02260BB0

	thumb_func_start ov93_02260BF0
ov93_02260BF0: @ 0x02260BF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r6]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	ble _02260C50
	ldr r0, _02260CF0 @ =0x02262C72
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp]
_02260C0C:
	ldr r0, [sp, #4]
	ldr r5, [sp]
	ldrh r7, [r0]
	movs r4, #0
_02260C14:
	adds r0, r6, #0
	adds r0, #0x8c
	adds r3, r7, r4
	movs r1, #1
	lsls r3, r3, #0x10
	ldr r0, [r0]
	adds r2, r1, #0
	lsrs r3, r3, #0x10
	bl FUN_02003DBC
	strh r0, [r5]
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #3
	blt _02260C14
	ldr r0, [sp, #4]
	adds r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r0, r0, #6
	str r0, [sp]
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [r6]
	adds r0, #0x30
	ldrb r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _02260C0C
_02260C50:
	bl FUN_0203769C
	ldr r3, [r6]
	movs r2, #0
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r4, [r1]
	cmp r4, #0
	ble _02260C74
_02260C62:
	adds r1, r3, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	cmp r0, r1
	beq _02260C74
	adds r2, r2, #1
	adds r3, r3, #1
	cmp r2, r4
	blt _02260C62
_02260C74:
	adds r0, r6, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200335C
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02003364
	ldr r1, [r6]
	adds r7, r0, #0
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r5, [r0]
	movs r4, #0
	cmp r5, #0
	ble _02260CEA
_02260C9E:
	adds r1, r1, r4
	adds r1, #0x2c
	ldrb r1, [r1]
	adds r0, r6, #0
	bl ov93_0225E3C4
	lsls r1, r0, #1
	ldr r0, _02260CF4 @ =0x02262DA4
	lsls r2, r5, #3
	adds r0, r0, r2
	ldrh r2, [r1, r0]
	movs r1, #6
	adds r3, r4, #0
	muls r3, r1, r3
	add r1, sp, #0x10
	adds r1, r1, r3
	lsls r3, r2, #1
	ldr r2, [sp, #8]
	movs r0, #0
	adds r2, r2, r3
	adds r3, r7, r3
_02260CC8:
	ldrh r5, [r1]
	adds r0, r0, #1
	strh r5, [r2]
	ldrh r5, [r1]
	adds r1, r1, #2
	adds r2, r2, #2
	strh r5, [r3]
	adds r3, r3, #2
	cmp r0, #3
	blt _02260CC8
	ldr r1, [r6]
	adds r4, r4, #1
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r5, [r0]
	cmp r4, r5
	blt _02260C9E
_02260CEA:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260CF0: .4byte 0x02262C72
_02260CF4: .4byte 0x02262DA4
	thumb_func_end ov93_02260BF0

	thumb_func_start ov93_02260CF8
ov93_02260CF8: @ 0x02260CF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x9c
	adds r7, r0, #0
	ldr r0, [r7, #0x28]
	ldr r1, _02260E10 @ =0x00002716
	movs r2, #2
	bl FUN_0200D944
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x18]
	ldr r0, [r7]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	ble _02260D6E
	ldr r0, _02260E14 @ =0x02262C8A
	str r0, [sp, #8]
	add r0, sp, #0x1c
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	lsls r0, r0, #4
	str r0, [sp]
_02260D26:
	ldr r0, [sp, #8]
	ldr r5, [sp, #4]
	ldrh r1, [r0]
	ldr r0, [sp]
	movs r6, #0
	adds r4, r1, r0
_02260D32:
	adds r0, r7, #0
	adds r0, #0x8c
	lsls r3, r4, #0x10
	ldr r0, [r0]
	movs r1, #3
	movs r2, #1
	lsrs r3, r3, #0x10
	bl FUN_02003DBC
	strh r0, [r5]
	adds r6, r6, #1
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r6, #0x10
	blt _02260D32
	ldr r0, [sp, #8]
	adds r0, r0, #2
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	adds r0, #0x20
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	ldr r0, [r7]
	adds r0, #0x30
	ldrb r1, [r0]
	ldr r0, [sp, #0x18]
	cmp r0, r1
	blt _02260D26
_02260D6E:
	bl FUN_0203769C
	ldr r3, [r7]
	movs r2, #0
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r4, [r1]
	cmp r4, #0
	ble _02260D92
_02260D80:
	adds r1, r3, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	cmp r0, r1
	beq _02260D92
	adds r2, r2, #1
	adds r3, r3, #1
	cmp r2, r4
	blt _02260D80
_02260D92:
	adds r0, r7, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200335C
	str r0, [sp, #0x14]
	adds r0, r7, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #3
	bl FUN_02003364
	ldr r1, [r7]
	str r0, [sp, #0x10]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r5, [r0]
	movs r4, #0
	cmp r5, #0
	ble _02260E0C
	ldr r0, [sp, #0xc]
	lsls r6, r0, #4
_02260DC0:
	adds r1, r1, r4
	adds r1, #0x2c
	ldrb r1, [r1]
	adds r0, r7, #0
	bl ov93_0225E3C4
	lsls r1, r0, #1
	ldr r0, _02260E18 @ =0x02262D04
	lsls r2, r5, #3
	adds r0, r0, r2
	ldrh r0, [r1, r0]
	lsls r3, r4, #5
	add r1, sp, #0x1c
	adds r2, r6, r0
	adds r1, r1, r3
	lsls r5, r2, #1
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x10]
	movs r0, #0
	adds r2, r2, r5
	adds r3, r3, r5
_02260DEA:
	ldrh r5, [r1]
	adds r0, r0, #1
	strh r5, [r2]
	ldrh r5, [r1]
	adds r1, r1, #2
	adds r2, r2, #2
	strh r5, [r3]
	adds r3, r3, #2
	cmp r0, #0x10
	blt _02260DEA
	ldr r1, [r7]
	adds r4, r4, #1
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r5, [r0]
	cmp r4, r5
	blt _02260DC0
_02260E0C:
	add sp, #0x9c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02260E10: .4byte 0x00002716
_02260E14: .4byte 0x02262C8A
_02260E18: .4byte 0x02262D04
	thumb_func_end ov93_02260CF8

	thumb_func_start ov93_02260E1C
ov93_02260E1C: @ 0x02260E1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r0, [r5, #0x28]
	ldr r1, _02260F08 @ =0x00002716
	movs r2, #2
	bl FUN_0200D944
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	ble _02260E76
	ldr r0, [sp, #4]
	ldr r7, _02260F0C @ =0x02262C82
	lsls r0, r0, #4
	add r4, sp, #0x14
	str r0, [sp]
_02260E46:
	ldrh r6, [r7]
	ldr r3, [sp]
	adds r0, r5, #0
	adds r0, #0x8c
	adds r3, r6, r3
	lsls r3, r3, #0x10
	ldr r0, [r0]
	movs r1, #3
	movs r2, #1
	lsrs r3, r3, #0x10
	bl FUN_02003DBC
	strh r0, [r4]
	ldr r0, [sp, #0x10]
	adds r7, r7, #2
	adds r0, r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5]
	adds r4, r4, #2
	adds r0, #0x30
	ldrb r1, [r0]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	blt _02260E46
_02260E76:
	bl FUN_0203769C
	ldr r3, [r5]
	movs r2, #0
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r4, [r1]
	cmp r4, #0
	ble _02260E9A
_02260E88:
	adds r1, r3, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	cmp r0, r1
	beq _02260E9A
	adds r2, r2, #1
	adds r3, r3, #1
	cmp r2, r4
	blt _02260E88
_02260E9A:
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200335C
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #3
	bl FUN_02003364
	ldr r1, [r5]
	str r0, [sp, #8]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r6, [r0]
	movs r4, #0
	cmp r6, #0
	ble _02260F02
	ldr r0, [sp, #4]
	lsls r7, r0, #4
_02260EC8:
	adds r1, r1, r4
	adds r1, #0x2c
	ldrb r1, [r1]
	adds r0, r5, #0
	bl ov93_0225E3C4
	lsls r1, r0, #1
	ldr r0, _02260F10 @ =0x02262D54
	lsls r2, r6, #3
	adds r0, r0, r2
	ldrh r0, [r1, r0]
	lsls r1, r4, #1
	add r2, sp, #0x14
	ldrh r3, [r2, r1]
	adds r0, r7, r0
	ldr r2, [sp, #0xc]
	lsls r0, r0, #1
	strh r3, [r2, r0]
	add r2, sp, #0x14
	ldrh r2, [r2, r1]
	ldr r1, [sp, #8]
	adds r4, r4, #1
	strh r2, [r1, r0]
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r6, [r0]
	cmp r4, r6
	blt _02260EC8
_02260F02:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02260F08: .4byte 0x00002716
_02260F0C: .4byte 0x02262C82
_02260F10: .4byte 0x02262D54
	thumb_func_end ov93_02260E1C

	thumb_func_start ov93_02260F14
ov93_02260F14: @ 0x02260F14
	push {r4, r5, r6, lr}
	adds r4, r3, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x10
	blx FUN_020D4994
	bl FUN_0203769C
	strb r0, [r4]
	strh r5, [r4, #2]
	str r6, [r4, #4]
	str r6, [r4, #8]
	movs r0, #0
	strb r0, [r4, #1]
	strb r0, [r4, #0xc]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov93_02260F14

	thumb_func_start ov93_02260F3C
ov93_02260F3C: @ 0x02260F3C
	push {r4, r5}
	ldr r2, _02260F80 @ =0x00002FB0
	adds r4, r0, #0
	subs r0, r2, #4
	adds r3, r1, #0
	ldr r1, [r4, r2]
	ldr r0, [r4, r0]
	subs r0, r1, r0
	cmp r0, #8
	blt _02260F56
	movs r0, #0
	pop {r4, r5}
	bx lr
_02260F56:
	lsrs r5, r1, #0x1f
	lsls r1, r1, #0x1d
	subs r1, r1, r5
	movs r0, #0x1d
	rors r1, r0
	adds r0, r5, r1
	lsls r0, r0, #4
	adds r1, r4, r0
	adds r0, r2, #0
	subs r0, #0x84
	adds r5, r1, r0
	ldm r3!, {r0, r1}
	stm r5!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r5!, {r0, r1}
	ldr r0, [r4, r2]
	adds r0, r0, #1
	str r0, [r4, r2]
	movs r0, #1
	pop {r4, r5}
	bx lr
	.align 2, 0
_02260F80: .4byte 0x00002FB0
	thumb_func_end ov93_02260F3C

	thumb_func_start ov93_02260F84
ov93_02260F84: @ 0x02260F84
	push {r3, r4}
	ldr r1, _02260FB4 @ =0x00002FAC
	adds r2, r1, #4
	ldr r4, [r0, r1]
	ldr r2, [r0, r2]
	cmp r4, r2
	blt _02260F98
	movs r0, #0
	pop {r3, r4}
	bx lr
_02260F98:
	adds r2, r4, #1
	str r2, [r0, r1]
	subs r1, #0x80
	adds r3, r0, r1
	lsrs r2, r4, #0x1f
	lsls r1, r4, #0x1d
	subs r1, r1, r2
	movs r0, #0x1d
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #4
	adds r0, r3, r0
	pop {r3, r4}
	bx lr
	.align 2, 0
_02260FB4: .4byte 0x00002FAC
	thumb_func_end ov93_02260F84

	thumb_func_start ov93_02260FB8
ov93_02260FB8: @ 0x02260FB8
	push {r3, r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r0, _022610A4 @ =0x00002FB0
	adds r7, r1, #0
	ldr r5, [r2, r0]
	subs r0, r0, #4
	ldr r0, [r2, r0]
	movs r4, #0
	cmp r0, r5
	beq _02260FD0
	cmp r7, #0
	bne _02260FD4
_02260FD0:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02260FD4:
	lsrs r3, r0, #0x1f
	lsls r1, r0, #0x1d
	subs r1, r1, r3
	movs r0, #0x1d
	rors r1, r0
	adds r1, r3, r1
	lsrs r3, r5, #0x1f
	lsls r5, r5, #0x1d
	subs r5, r5, r3
	rors r5, r0
	adds r0, r3, r5
	cmp r1, r0
	bge _02261012
	cmp r1, r0
	bge _0226105A
	lsls r3, r1, #4
	adds r6, r2, r3
	ldr r3, _022610A8 @ =0x00002F38
_02260FF8:
	ldrb r5, [r6, r3]
	cmp r5, #0
	bne _02261008
	ldr r0, _022610AC @ =0x00002F2C
	adds r2, r2, r0
	lsls r0, r1, #4
	adds r4, r2, r0
	b _0226105A
_02261008:
	adds r1, r1, #1
	adds r6, #0x10
	cmp r1, r0
	blt _02260FF8
	b _0226105A
_02261012:
	cmp r1, #8
	bge _02261034
	lsls r3, r1, #4
	adds r6, r2, r3
	ldr r3, _022610A8 @ =0x00002F38
_0226101C:
	ldrb r5, [r6, r3]
	cmp r5, #0
	bne _0226102C
	ldr r3, _022610AC @ =0x00002F2C
	lsls r1, r1, #4
	adds r3, r2, r3
	adds r4, r3, r1
	b _02261034
_0226102C:
	adds r1, r1, #1
	adds r6, #0x10
	cmp r1, #8
	blt _0226101C
_02261034:
	cmp r4, #0
	bne _0226105A
	movs r6, #0
	cmp r0, #0
	ble _0226105A
	ldr r1, _022610A8 @ =0x00002F38
	adds r5, r2, #0
_02261042:
	ldrb r3, [r5, r1]
	cmp r3, #0
	bne _02261052
	ldr r0, _022610AC @ =0x00002F2C
	adds r1, r2, r0
	lsls r0, r6, #4
	adds r4, r1, r0
	b _0226105A
_02261052:
	adds r6, r6, #1
	adds r5, #0x10
	cmp r6, r0
	blt _02261042
_0226105A:
	cmp r4, #0
	bne _02261066
	bl FUN_0202551C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02261066:
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _02261070
	bl FUN_0202551C
_02261070:
	movs r0, #1
	strb r7, [r4, #1]
	strb r0, [r4, #0xc]
	cmp r7, #1
	beq _02261084
	cmp r7, #2
	beq _0226108C
	cmp r7, #3
	beq _02261098
	b _022610A0
_02261084:
	ldr r0, [r4, #4]
	lsls r0, r0, #1
	str r0, [r4, #8]
	b _022610A0
_0226108C:
	ldr r1, [r4, #4]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [r4, #8]
	b _022610A0
_02261098:
	ldr r1, [r4, #4]
	lsls r0, r1, #1
	adds r0, r1, r0
	str r0, [r4, #8]
_022610A0:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022610A4: .4byte 0x00002FB0
_022610A8: .4byte 0x00002F38
_022610AC: .4byte 0x00002F2C
	thumb_func_end ov93_02260FB8

	thumb_func_start ov93_022610B0
ov93_022610B0: @ 0x022610B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	ldr r4, _02261144 @ =0x02262E68
	adds r7, r0, #0
	str r1, [sp]
	add r3, sp, #4
	movs r2, #6
_022610BE:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _022610BE
	ldr r0, [r4]
	ldr r4, [sp]
	ldr r5, _02261148 @ =0x02262CB4
	str r0, [r3]
	movs r6, #0
_022610D0:
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	add r2, sp, #4
	bl FUN_0200D734
	movs r3, #0x16
	str r0, [r4]
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	lsrs r1, r6, #0x1f
	adds r1, r6, r1
	asrs r1, r1, #1
	ldr r0, [r4]
	adds r1, #0x1f
	bl FUN_0200DC4C
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0200DC0C
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #4
	blt _022610D0
	ldr r0, [r7]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #2
	beq _0226111E
	cmp r0, #3
	beq _02261136
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
_0226111E:
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0, #8]
	bl FUN_0200DCE8
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0, #0xc]
	bl FUN_0200DCE8
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
_02261136:
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0, #4]
	bl FUN_0200DCE8
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02261144: .4byte 0x02262E68
_02261148: .4byte 0x02262CB4
	thumb_func_end ov93_022610B0

	thumb_func_start ov93_0226114C
ov93_0226114C: @ 0x0226114C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r4, #0
_02261152:
	ldr r0, [r5]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02261152
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov93_0226114C

	thumb_func_start ov93_02261164
ov93_02261164: @ 0x02261164
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	ldr r4, _022612CC @ =0x02262E9C
	adds r5, r0, #0
	str r1, [sp]
	add r3, sp, #0xc
	movs r2, #6
_02261172:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02261172
	ldr r0, [r4]
	ldr r4, [sp]
	str r0, [r3]
	movs r0, #0
	ldr r7, _022612D0 @ =0x02262C7A
	str r0, [sp, #8]
_02261186:
	ldr r0, [sp]
	adds r0, #0xe4
	ldr r1, [r0]
	ldr r0, [r4, #0xc]
	adds r0, r1, r0
	bl FUN_0201FD14
	asrs r1, r0, #0x1f
	movs r2, #0x4c
	movs r3, #0
	blx FUN_020F2948
	movs r2, #2
	lsls r2, r2, #0xa
	adds r2, r0, r2
	ldr r0, _022612D4 @ =0x00000000
	adcs r1, r0
	lsls r0, r1, #0x14
	lsrs r6, r2, #0xc
	orrs r6, r0
	ldr r0, [sp]
	adds r6, #0x80
	adds r0, #0xe4
	ldr r1, [r0]
	ldr r0, [r4, #0xc]
	adds r0, r1, r0
	bl FUN_0201FD20
	asrs r1, r0, #0x1f
	movs r2, #0x44
	movs r3, #0
	blx FUN_020F2948
	movs r2, #2
	lsls r2, r2, #0xa
	adds r0, r0, r2
	ldr r2, _022612D4 @ =0x00000000
	adcs r1, r2
	lsrs r2, r0, #0xc
	lsls r1, r1, #0x14
	orrs r2, r1
	movs r0, #0x62
	subs r0, r0, r2
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	add r2, sp, #0xc
	bl FUN_0200D734
	ldr r2, [sp, #4]
	lsls r1, r6, #0x10
	subs r2, #0x18
	lsls r2, r2, #0x10
	movs r3, #0x16
	str r0, [r4]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	ldrh r1, [r7, #2]
	ldr r0, [r4]
	bl FUN_0200DC4C
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0200DC0C
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, _022612D8 @ =0x02262ED0
	bl FUN_0200D734
	movs r1, #0
	movs r3, #0x16
	adds r2, r1, #0
	lsls r3, r3, #0x10
	str r0, [r4, #4]
	bl FUN_0200DDF4
	ldr r0, [r4, #4]
	movs r1, #0x21
	bl FUN_0200DC4C
	ldr r0, [r4, #4]
	ldr r0, [r0]
	bl FUN_0200DC0C
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, _022612DC @ =0x02262F04
	bl FUN_0200D734
	ldr r2, [sp, #4]
	lsls r1, r6, #0x10
	lsls r2, r2, #0x10
	movs r3, #0x16
	str r0, [r4, #8]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	ldr r0, [r4, #8]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #8]
	movs r1, #1
	bl FUN_0200DF98
	movs r1, #0xfe
	lsls r1, r1, #0x16
	ldr r0, [r4, #8]
	adds r2, r1, #0
	bl FUN_0200E024
	ldr r1, [sp, #8]
	ldr r0, [r4, #8]
	adds r1, #0x22
	bl FUN_0200DC4C
	ldr r0, [r4, #8]
	ldr r0, [r0]
	bl FUN_0200DC0C
	ldr r0, [r4, #8]
	movs r1, #0
	bl FUN_0200DCE8
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x30
	bl ov93_02262444
	ldr r0, [sp, #8]
	adds r4, #0x4c
	adds r0, r0, #1
	adds r7, r7, #2
	str r0, [sp, #8]
	cmp r0, #3
	bge _022612B4
	b _02261186
_022612B4:
	ldr r0, [sp]
	movs r1, #1
	ldr r0, [r0]
	bl FUN_0200DCE8
	ldr r0, [sp]
	movs r1, #1
	ldr r0, [r0, #8]
	bl FUN_0200DCE8
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022612CC: .4byte 0x02262E9C
_022612D0: .4byte 0x02262C7A
_022612D4: .4byte 0x00000000
_022612D8: .4byte 0x02262ED0
_022612DC: .4byte 0x02262F04
	thumb_func_end ov93_02261164

	thumb_func_start ov93_022612E0
ov93_022612E0: @ 0x022612E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r4, #0
_022612E8:
	ldr r0, [r5]
	bl FUN_0200D9DC
	ldr r0, [r5, #4]
	bl FUN_0200D9DC
	ldr r0, [r5, #8]
	bl FUN_0200D9DC
	adds r1, r5, #0
	adds r0, r6, #0
	adds r1, #0x30
	bl ov93_02262484
	adds r4, r4, #1
	adds r5, #0x4c
	cmp r4, #3
	blt _022612E8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov93_022612E0

	thumb_func_start ov93_02261310
ov93_02261310: @ 0x02261310
	push {r4, lr}
	adds r4, r1, #0
	adds r1, #0xf4
	ldrb r1, [r1]
	movs r0, #0x1e
	lsls r0, r0, #0xc
	lsls r2, r1, #2
	ldr r1, _02261350 @ =0x02262CC4
	ldrb r1, [r1, r2]
	blx FUN_020F2998
	adds r1, r4, #0
	adds r1, #0xe8
	str r0, [r1]
	movs r1, #0
	adds r2, r1, #0
	adds r3, r4, #0
_02261332:
	lsls r0, r2, #0xc
	str r0, [r3, #0xc]
	adds r1, r1, #1
	strb r1, [r3, #0x14]
	adds r2, #0x5a
	adds r3, #0x4c
	cmp r1, #3
	blt _02261332
	movs r0, #2
	strb r0, [r4, #0x10]
	movs r0, #1
	adds r4, #0xf1
	strb r0, [r4]
	pop {r4, pc}
	nop
_02261350: .4byte 0x02262CC4
	thumb_func_end ov93_02261310

	thumb_func_start ov93_02261354
ov93_02261354: @ 0x02261354
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0xf1
	ldrb r0, [r0]
	movs r5, #0
	cmp r0, #1
	bne _02261368
	b _022614E8
_02261368:
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xec
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf2
	ldrb r0, [r0]
	cmp r0, #0
	bne _022613F4
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0xe4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf3
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf3
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0xf4
	ldrb r1, [r1]
	adds r0, r4, #0
	adds r0, #0xf3
	lsls r2, r1, #2
	ldr r1, _022614EC @ =0x02262CC4
	ldrb r0, [r0]
	ldrb r1, [r1, r2]
	cmp r0, r1
	blo _02261456
	adds r0, r4, #0
	adds r0, #0xf3
	strb r5, [r0]
	adds r0, r4, #0
	adds r0, #0xf0
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf0
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf0
	ldrb r1, [r0]
	movs r0, #0x1e
	lsls r0, r0, #0xc
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r4, #0
	adds r0, #0xe4
	str r2, [r0]
	adds r0, r4, #0
	adds r0, #0xf4
	ldrb r0, [r0]
	lsls r1, r0, #2
	ldr r0, _022614F0 @ =0x02262CC5
	ldrb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0xf2
	strb r1, [r0]
	b _02261456
_022613F4:
	adds r0, r4, #0
	adds r0, #0xf2
	ldrb r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf2
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf2
	ldrb r0, [r0]
	cmp r0, #0
	bne _02261456
	adds r0, r4, #0
	adds r0, #0xf0
	ldrb r0, [r0]
	cmp r0, #0xc
	blo _02261456
	adds r0, r4, #0
	adds r0, #0xf0
	strb r5, [r0]
	adds r0, r4, #0
	adds r0, #0xf4
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf4
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf4
	ldrb r0, [r0]
	cmp r0, #5
	blo _0226143C
	adds r0, r4, #0
	movs r1, #4
	adds r0, #0xf4
	strb r1, [r0]
_0226143C:
	adds r1, r4, #0
	adds r1, #0xf4
	ldrb r1, [r1]
	movs r0, #0x1e
	lsls r0, r0, #0xc
	lsls r2, r1, #2
	ldr r1, _022614EC @ =0x02262CC4
	ldrb r1, [r1, r2]
	blx FUN_020F2998
	adds r1, r4, #0
	adds r1, #0xe8
	str r0, [r1]
_02261456:
	adds r0, r4, #0
	adds r0, #0xf4
	ldrb r0, [r0]
	cmp r0, #1
	bne _02261492
	ldr r1, _022614EC @ =0x02262CC4
	movs r0, #0
	movs r7, #0xc
_02261466:
	ldrb r3, [r1]
	ldrb r2, [r1, #1]
	adds r0, r0, #1
	adds r1, r1, #4
	adds r2, r3, r2
	adds r3, r2, #0
	muls r3, r7, r3
	adds r5, r5, r3
	cmp r0, #2
	blt _02261466
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	subs r5, #0xf
	cmp r5, r0
	bne _022614C6
	adds r0, r4, #0
	adds r0, #0x4c
	movs r1, #1
	bl ov93_02261528
	b _022614C6
_02261492:
	cmp r0, #2
	bne _022614C6
	ldr r0, _022614EC @ =0x02262CC4
	movs r1, #0
	movs r7, #0xc
_0226149C:
	ldrb r3, [r0]
	ldrb r2, [r0, #1]
	adds r1, r1, #1
	adds r0, r0, #4
	adds r2, r3, r2
	adds r3, r2, #0
	muls r3, r7, r3
	adds r5, r5, r3
	cmp r1, #3
	blt _0226149C
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	subs r5, #0xf
	cmp r5, r0
	bne _022614C6
	adds r0, r4, #0
	adds r0, #0x98
	movs r1, #1
	bl ov93_02261528
_022614C6:
	movs r7, #0
	adds r5, r4, #0
_022614CA:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl ov93_02261538
	adds r2, r5, #0
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, #0x30
	bl ov93_02262540
	adds r7, r7, #1
	adds r5, #0x4c
	cmp r7, #3
	blt _022614CA
_022614E8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022614EC: .4byte 0x02262CC4
_022614F0: .4byte 0x02262CC5
	thumb_func_end ov93_02261354

	thumb_func_start ov93_022614F4
ov93_022614F4: @ 0x022614F4
	push {r3, r4}
	ldr r2, _02261524 @ =0x00001468
	movs r3, #0
	adds r2, r0, r2
	adds r4, r2, #0
_022614FE:
	ldrb r0, [r4, #0x15]
	cmp r0, #1
	bne _02261512
	movs r0, #0x4c
	muls r0, r3, r0
	adds r0, r2, r0
	str r0, [r1]
	ldrb r0, [r0, #0x14]
	pop {r3, r4}
	bx lr
_02261512:
	adds r3, r3, #1
	adds r4, #0x4c
	cmp r3, #3
	blt _022614FE
	movs r0, #0
	str r0, [r1]
	pop {r3, r4}
	bx lr
	nop
_02261524: .4byte 0x00001468
	thumb_func_end ov93_022614F4

	thumb_func_start ov93_02261528
ov93_02261528: @ 0x02261528
	strb r1, [r0, #0x10]
	movs r1, #0
	strb r1, [r0, #0x11]
	strb r1, [r0, #0x12]
	str r1, [r0, #0x18]
	strb r1, [r0, #0x15]
	bx lr
	.align 2, 0
	thumb_func_end ov93_02261528

	thumb_func_start ov93_02261538
ov93_02261538: @ 0x02261538
	push {r4, lr}
	ldrb r3, [r2, #0x10]
	lsls r4, r3, #2
	ldr r3, _02261548 @ =0x02262C94
	ldr r3, [r3, r4]
	blx r3
	pop {r4, pc}
	nop
_02261548: .4byte 0x02262C94
	thumb_func_end ov93_02261538

	thumb_func_start ov93_0226154C
ov93_0226154C: @ 0x0226154C
	movs r0, #0
	strb r0, [r2, #0x15]
	movs r0, #1
	bx lr
	thumb_func_end ov93_0226154C

	thumb_func_start ov93_02261554
ov93_02261554: @ 0x02261554
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	movs r0, #0x1c
	ldrsh r0, [r5, r0]
	add r1, sp, #0
	strh r0, [r1, #2]
	movs r0, #0x1e
	ldrsh r0, [r5, r0]
	strh r0, [r1]
	ldrb r0, [r5, #0x11]
	cmp r0, #0
	beq _02261574
	cmp r0, #1
	beq _022615A8
	b _02261732
_02261574:
	ldr r0, [r5]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, [r5, #8]
	movs r1, #1
	bl FUN_0200DCE8
	add r1, sp, #0
	movs r3, #0x16
	ldr r0, [r5]
	adds r1, #2
	add r2, sp, #0
	lsls r3, r3, #0x10
	bl FUN_0200DE94
	add r1, sp, #0
	movs r0, #2
	ldrsh r0, [r1, r0]
	strh r0, [r5, #0x1c]
	movs r0, #0
	ldrsh r0, [r1, r0]
	strh r0, [r5, #0x1e]
	ldrb r0, [r5, #0x11]
	adds r0, r0, #1
	strb r0, [r5, #0x11]
_022615A8:
	movs r1, #0x5a
	ldr r2, [r5, #0xc]
	lsls r1, r1, #0xc
	cmp r2, r1
	bgt _022615BA
	bge _022615EC
	cmp r2, #0
	beq _022615CC
	b _02261654
_022615BA:
	lsls r0, r1, #1
	cmp r2, r0
	bgt _022615C4
	beq _02261614
	b _02261654
_022615C4:
	ldr r0, _0226173C @ =0x0010E000
	cmp r2, r0
	beq _02261634
	b _02261654
_022615CC:
	movs r0, #0x1e
	ldrsh r0, [r5, r0]
	ldrb r1, [r5, #0x12]
	adds r0, #0x20
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	movs r1, #0xf
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	subs r1, #0x20
	add r0, sp, #0
	strh r1, [r0]
	b _02261658
_022615EC:
	movs r0, #0x1c
	ldrsh r2, [r5, r0]
	movs r0, #0x12
	lsls r0, r0, #4
	subs r0, r2, r0
	lsls r0, r0, #0x10
	ldrb r1, [r5, #0x12]
	asrs r0, r0, #0x10
	muls r0, r1, r0
	movs r1, #0xf
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x12
	lsls r0, r0, #4
	adds r1, r1, r0
	add r0, sp, #0
	strh r1, [r0, #2]
	b _02261658
_02261614:
	movs r0, #0x1e
	ldrsh r0, [r5, r0]
	ldrb r1, [r5, #0x12]
	subs r0, #0xe4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	movs r1, #0xf
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	adds r1, #0xe4
	add r0, sp, #0
	strh r1, [r0]
	b _02261658
_02261634:
	movs r0, #0x1c
	ldrsh r0, [r5, r0]
	ldrb r1, [r5, #0x12]
	adds r0, #0x20
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	movs r1, #0xf
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	subs r1, #0x20
	add r0, sp, #0
	strh r1, [r0, #2]
	b _02261658
_02261654:
	bl FUN_0202551C
_02261658:
	ldrb r1, [r5, #0x12]
	cmp r1, #0xf
	blo _022616A0
	movs r1, #0x1c
	movs r2, #0x1e
	movs r3, #0x16
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	ldr r0, [r5]
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	movs r2, #0x1e
	ldrsh r2, [r5, r2]
	movs r1, #0x1c
	movs r3, #0x16
	adds r2, #0x18
	lsls r2, r2, #0x10
	ldrsh r1, [r5, r1]
	ldr r0, [r5, #8]
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	adds r0, r5, #0
	movs r1, #2
	bl ov93_02261528
	adds r1, r5, #0
	adds r5, #0x30
	adds r0, r4, #0
	adds r2, r5, #0
	bl ov93_0226249C
	movs r0, #1
	pop {r3, r4, r5, pc}
_022616A0:
	movs r0, #0xb4
	muls r0, r1, r0
	lsls r0, r0, #0xc
	movs r1, #0xf
	blx FUN_020F2998
	bl FUN_0201FD14
	movs r2, #6
	asrs r1, r0, #0x1f
	lsls r2, r2, #0xe
	movs r3, #0
	blx FUN_020F2948
	movs r3, #2
	movs r2, #0
	lsls r3, r3, #0xa
	adds r3, r0, r3
	adcs r1, r2
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	orrs r1, r0
	rsbs r1, r1, #0
	asrs r0, r1, #0xb
	add r3, sp, #0
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r4, r0, #0xc
	ldrsh r2, [r3, r2]
	movs r1, #2
	ldrsh r1, [r3, r1]
	adds r2, r2, r4
	lsls r2, r2, #0x10
	movs r3, #0x16
	ldr r0, [r5]
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	movs r1, #2
	ldrsh r1, [r3, r1]
	adds r2, #0x18
	lsls r2, r2, #0x10
	movs r3, #0x16
	ldr r0, [r5, #8]
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	rsbs r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r0, #0xc
	movs r1, #0x18
	blx FUN_020F2998
	movs r1, #1
	lsls r1, r1, #0xc
	subs r0, r1, r0
	blx FUN_020F2178
	ldr r1, _02261740 @ =0x45800000
	blx FUN_020F1CC8
	adds r1, r0, #0
	ldr r0, [r5, #8]
	adds r2, r1, #0
	bl FUN_0200E024
_02261732:
	ldrb r0, [r5, #0x12]
	adds r0, r0, #1
	strb r0, [r5, #0x12]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0226173C: .4byte 0x0010E000
_02261740: .4byte 0x45800000
	thumb_func_end ov93_02261554

	thumb_func_start ov93_02261744
ov93_02261744: @ 0x02261744
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r1, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0xf3
	ldrb r0, [r0]
	adds r4, r2, #0
	cmp r0, #0
	beq _02261774
	adds r1, #0xf4
	ldrb r1, [r1]
	movs r0, #0xb
	lsls r0, r0, #0xe
	lsls r2, r1, #2
	ldr r1, _022618BC @ =0x02262CC4
	ldrb r1, [r1, r2]
	blx FUN_020F2998
	adds r1, r0, #0
	ldr r0, [r4]
	bl FUN_0200DC34
	b _0226177C
_02261774:
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0200DCC0
_0226177C:
	adds r0, r5, #0
	adds r0, #0xf3
	ldrb r1, [r0]
	movs r0, #0xb4
	muls r0, r1, r0
	adds r1, r5, #0
	adds r1, #0xf4
	ldrb r1, [r1]
	lsls r0, r0, #0xc
	lsls r2, r1, #2
	ldr r1, _022618BC @ =0x02262CC4
	ldrb r1, [r1, r2]
	blx FUN_020F2998
	bl FUN_0201FD14
	movs r2, #3
	asrs r1, r0, #0x1f
	lsls r2, r2, #0xe
	movs r3, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	rsbs r1, r1, #0
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r7, r0, #0xc
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r1, [r0]
	ldr r0, [r4, #0xc]
	adds r0, r1, r0
	bl FUN_0201FD14
	asrs r1, r0, #0x1f
	movs r2, #0x4c
	movs r3, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r6, r2, #0xc
	orrs r6, r0
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r1, [r0]
	ldr r0, [r4, #0xc]
	adds r6, #0x80
	adds r0, r1, r0
	bl FUN_0201FD20
	asrs r1, r0, #0x1f
	movs r2, #0x44
	movs r3, #0
	blx FUN_020F2948
	adds r2, r0, #0
	movs r0, #2
	movs r3, #0
	lsls r0, r0, #0xa
	adds r0, r2, r0
	adcs r1, r3
	lsrs r2, r0, #0xc
	lsls r1, r1, #0x14
	orrs r2, r1
	movs r0, #0x62
	subs r0, r0, r2
	str r0, [sp, #4]
	ldr r2, [sp, #4]
	lsls r1, r6, #0x10
	subs r2, #0x18
	adds r2, r2, r7
	lsls r2, r2, #0x10
	movs r3, #0x16
	ldr r0, [r4]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	ldr r2, [sp, #4]
	lsls r1, r6, #0x10
	lsls r2, r2, #0x10
	movs r3, #0x16
	ldr r0, [r4, #8]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	rsbs r0, r7, #0
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r0, #0xc
	movs r1, #0xc
	blx FUN_020F2998
	movs r1, #1
	lsls r1, r1, #0xc
	subs r0, r1, r0
	blx FUN_020F2178
	ldr r1, _022618C0 @ =0x45800000
	blx FUN_020F1CC8
	adds r1, r0, #0
	ldr r0, [r4, #8]
	adds r2, r1, #0
	bl FUN_0200E024
	adds r1, r5, #0
	adds r1, #0xf4
	ldrb r1, [r1]
	adds r0, r5, #0
	adds r0, #0xf3
	lsls r2, r1, #2
	ldr r1, _022618BC @ =0x02262CC4
	ldrb r0, [r0]
	ldrb r1, [r1, r2]
	subs r1, r1, #1
	cmp r0, r1
	bne _02261896
	adds r2, r4, #0
	ldr r0, [sp]
	adds r1, r4, #0
	adds r2, #0x30
	bl ov93_0226249C
_02261896:
	adds r5, #0xe4
	ldr r1, [r5]
	ldr r0, [r4, #0xc]
	adds r0, r1, r0
	movs r1, #0x5a
	asrs r0, r0, #0xc
	lsls r1, r1, #2
	blx FUN_020F2998
	cmp r1, #0xb4
	bne _022618B0
	movs r0, #1
	b _022618B2
_022618B0:
	movs r0, #0
_022618B2:
	strb r0, [r4, #0x15]
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022618BC: .4byte 0x02262CC4
_022618C0: .4byte 0x45800000
	thumb_func_end ov93_02261744

	thumb_func_start ov93_022618C4
ov93_022618C4: @ 0x022618C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r2, #0
	ldrb r0, [r4, #0x11]
	adds r5, r1, #0
	cmp r0, #3
	bls _022618D4
	b _02261BA2
_022618D4:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022618E0: @ jump table
	.2byte _022618E8 - _022618E0 - 2 @ case 0
	.2byte _0226195A - _022618E0 - 2 @ case 1
	.2byte _022619AE - _022618E0 - 2 @ case 2
	.2byte _02261ACA - _022618E0 - 2 @ case 3
_022618E8:
	ldr r0, _02261BA8 @ =0x00000593
	bl FUN_0200604C
	add r1, sp, #8
	movs r3, #0x16
	ldr r0, [r4]
	adds r1, #2
	add r2, sp, #8
	lsls r3, r3, #0x10
	bl FUN_0200DE94
	add r3, sp, #4
	movs r2, #4
	ldrsh r2, [r3, r2]
	movs r1, #6
	ldrsh r1, [r3, r1]
	subs r2, #0x20
	lsls r2, r2, #0x10
	movs r3, #0x16
	ldr r0, [r4, #4]
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	ldr r0, [r4, #4]
	movs r1, #0x21
	bl FUN_0200DC4C
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_0200DCE8
	ldrb r1, [r4, #0x14]
	ldr r0, [r4]
	lsls r2, r1, #1
	ldr r1, _02261BAC @ =0x02262C7A
	ldrh r1, [r1, r2]
	adds r1, r1, #2
	bl FUN_0200DC4C
	adds r0, r5, #0
	adds r0, #0xf4
	ldrb r0, [r0]
	ldr r1, _02261BB0 @ =0x02262CC6
	adds r5, #0xf4
	lsls r0, r0, #2
	ldrb r0, [r1, r0]
	strb r0, [r4, #0x12]
	ldrb r0, [r5]
	lsls r0, r0, #2
	ldrb r0, [r1, r0]
	lsrs r0, r0, #1
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0x11]
	adds r0, r0, #1
	strb r0, [r4, #0x11]
	b _02261BA2
_0226195A:
	ldrb r1, [r4, #0x12]
	ldrb r0, [r4, #0x13]
	cmp r1, r0
	bne _02261984
	ldrb r1, [r4, #0x14]
	ldr r0, [r4]
	lsls r2, r1, #1
	ldr r1, _02261BAC @ =0x02262C7A
	ldrh r1, [r1, r2]
	adds r1, r1, #1
	bl FUN_0200DC4C
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0200DCE8
	movs r1, #1
	ldr r0, [r4, #4]
	lsls r1, r1, #0xe
	bl FUN_0200DC34
_02261984:
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _022619A8
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0200DCE8
	ldrb r1, [r4, #0x14]
	ldr r0, [r4]
	lsls r2, r1, #1
	ldr r1, _02261BAC @ =0x02262C7A
	ldrh r1, [r1, r2]
	bl FUN_0200DC4C
	ldrb r0, [r4, #0x11]
	adds r0, r0, #1
	strb r0, [r4, #0x11]
	b _02261BA2
_022619A8:
	subs r0, r0, #1
	strb r0, [r4, #0x12]
	b _02261BA2
_022619AE:
	adds r0, r5, #0
	adds r0, #0xf2
	ldrb r0, [r0]
	movs r2, #0
	cmp r0, #0
	bne _022619E0
	adds r0, r5, #0
	adds r0, #0xf4
	ldrb r0, [r0]
	adds r3, r5, #0
	adds r3, #0xf3
	lsls r1, r0, #2
	ldr r0, _02261BB4 @ =0x02262CC4
	ldrb r3, [r3]
	ldrb r0, [r0, r1]
	adds r5, #0xf0
	subs r3, r0, r3
	adds r3, r2, r3
	ldr r2, _02261BB8 @ =0x02262CC5
	ldrb r1, [r2, r1]
	adds r1, r3, r1
	adds r6, r1, r0
	ldrb r0, [r5]
	adds r5, r0, #2
	b _02261A0C
_022619E0:
	adds r1, r2, r0
	adds r0, r5, #0
	adds r0, #0xf0
	ldrb r0, [r0]
	cmp r0, #0xc
	blo _022619FE
	adds r5, #0xf4
	ldrb r0, [r5]
	movs r5, #1
	adds r0, r0, #1
	lsls r2, r0, #2
	ldr r0, _02261BB4 @ =0x02262CC4
	ldrb r0, [r0, r2]
	adds r6, r1, r0
	b _02261A0C
_022619FE:
	adds r5, #0xf4
	ldrb r2, [r5]
	adds r5, r0, #1
	lsls r3, r2, #2
	ldr r2, _02261BB4 @ =0x02262CC4
	ldrb r2, [r2, r3]
	adds r6, r1, r2
_02261A0C:
	movs r1, #0x1e
	ldr r0, [r4, #0xc]
	lsls r1, r1, #0xc
	blx FUN_020F2998
	adds r0, r5, r0
	movs r1, #0xc
	blx FUN_020F2998
	adds r5, r1, #0
	movs r0, #0x1e
	lsls r0, r0, #0xc
	adds r7, r5, #0
	muls r7, r0, r7
	adds r0, r7, #0
	bl FUN_0201FD14
	adds r5, r0, #0
	adds r0, r7, #0
	bl FUN_0201FD20
	str r0, [sp]
	add r1, sp, #4
	movs r3, #0x16
	ldr r0, [r4]
	adds r1, #2
	add r2, sp, #4
	lsls r3, r3, #0x10
	bl FUN_0200DE94
	add r1, sp, #4
	movs r3, #0
	ldrsh r0, [r1, r3]
	movs r2, #0x4c
	adds r0, #0x18
	strh r0, [r1]
	movs r0, #2
	ldrsh r7, [r1, r0]
	asrs r1, r5, #0x1f
	adds r0, r5, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	adds r1, #0x80
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #0xc
	adds r1, r6, #0
	blx FUN_020F2998
	str r0, [r4, #0x20]
	add r0, sp, #4
	movs r3, #0
	ldrsh r5, [r0, r3]
	ldr r0, [sp]
	movs r2, #0x44
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	adds r2, r0, #0
	movs r0, #2
	movs r3, #0
	lsls r0, r0, #0xa
	adds r0, r2, r0
	adcs r1, r3
	lsrs r2, r0, #0xc
	lsls r1, r1, #0x14
	orrs r2, r1
	movs r0, #0x62
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r5
	lsls r0, r0, #0xc
	adds r1, r6, #0
	blx FUN_020F2998
	str r0, [r4, #0x24]
	lsls r0, r7, #0xc
	str r0, [r4, #0x28]
	lsls r0, r5, #0xc
	str r0, [r4, #0x2c]
	strb r6, [r4, #0x12]
	str r6, [r4, #0x18]
	ldrb r0, [r4, #0x11]
	adds r0, r0, #1
	strb r0, [r4, #0x11]
_02261ACA:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x20]
	adds r0, r1, r0
	str r0, [r4, #0x28]
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x24]
	adds r0, r1, r0
	str r0, [r4, #0x2c]
	ldrb r1, [r4, #0x12]
	movs r0, #0xb4
	muls r0, r1, r0
	ldr r1, [r4, #0x18]
	lsls r0, r0, #0xc
	blx FUN_020F2998
	bl FUN_0201FD14
	movs r2, #3
	asrs r1, r0, #0x1f
	lsls r2, r2, #0xe
	movs r3, #0
	blx FUN_020F2948
	adds r5, r0, #0
	ldr r2, [r4, #0x28]
	adds r6, r1, #0
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	ldr r2, [r4, #0x2c]
	lsls r1, r1, #4
	asrs r3, r2, #0xb
	lsrs r3, r3, #0x14
	adds r3, r2, r3
	movs r2, #2
	asrs r3, r3, #0xc
	movs r7, #0
	lsls r2, r2, #0xa
	asrs r1, r1, #0x10
	subs r3, #0x18
	adds r2, r5, r2
	adcs r6, r7
	lsls r5, r6, #0x14
	lsrs r2, r2, #0xc
	orrs r2, r5
	rsbs r5, r2, #0
	asrs r2, r5, #0xb
	lsrs r2, r2, #0x14
	adds r2, r5, r2
	asrs r2, r2, #0xc
	adds r2, r3, r2
	lsls r2, r2, #0x10
	movs r3, #0x16
	ldr r0, [r4]
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	movs r0, #0xb
	ldr r1, [r4, #0x18]
	lsls r0, r0, #0xe
	blx FUN_020F2998
	adds r1, r0, #0
	ldr r0, [r4]
	bl FUN_0200DC34
	ldr r2, [r4, #0x28]
	ldr r3, [r4, #0x2c]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r2, r3, #0xb
	lsrs r2, r2, #0x14
	adds r2, r3, r2
	lsls r1, r1, #4
	lsls r2, r2, #4
	movs r3, #0x16
	ldr r0, [r4, #8]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	ldrb r0, [r4, #0x12]
	subs r0, r0, #1
	strb r0, [r4, #0x12]
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _02261BA2
	ldrb r1, [r4, #0x14]
	ldr r0, [r4]
	lsls r2, r1, #1
	ldr r1, _02261BAC @ =0x02262C7A
	ldrh r1, [r1, r2]
	bl FUN_0200DC4C
	ldr r0, [r4]
	adds r1, r7, #0
	bl FUN_0200DCC0
	adds r0, r4, #0
	movs r1, #2
	bl ov93_02261528
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02261BA2:
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02261BA8: .4byte 0x00000593
_02261BAC: .4byte 0x02262C7A
_02261BB0: .4byte 0x02262CC6
_02261BB4: .4byte 0x02262CC4
_02261BB8: .4byte 0x02262CC5
	thumb_func_end ov93_022618C4

	thumb_func_start ov93_02261BBC
ov93_02261BBC: @ 0x02261BBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r6, _02261C34 @ =0x02262E9C
	adds r5, r0, #0
	adds r4, r1, #0
	add r3, sp, #0
	movs r2, #6
_02261BCA:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02261BCA
	ldr r0, [r6]
	movs r7, #0x16
	str r0, [r3]
	movs r6, #0
	lsls r7, r7, #0x10
_02261BDC:
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	add r2, sp, #0
	bl FUN_0200D734
	movs r1, #0
	str r0, [r4]
	adds r2, r1, #0
	adds r3, r7, #0
	bl FUN_0200DDF4
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, _02261C38 @ =0x02262ED0
	bl FUN_0200D734
	movs r1, #0
	str r0, [r4, #4]
	adds r2, r1, #0
	adds r3, r7, #0
	bl FUN_0200DDF4
	ldr r0, [r4, #4]
	movs r1, #0x21
	bl FUN_0200DC4C
	ldr r0, [r4, #4]
	ldr r0, [r0]
	bl FUN_0200DC0C
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0200DCE8
	adds r6, r6, #1
	adds r4, #0x18
	cmp r6, #3
	blt _02261BDC
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02261C34: .4byte 0x02262E9C
_02261C38: .4byte 0x02262ED0
	thumb_func_end ov93_02261BBC

	thumb_func_start ov93_02261C3C
ov93_02261C3C: @ 0x02261C3C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r4, #0
_02261C42:
	ldr r0, [r5]
	bl FUN_0200D9DC
	ldr r0, [r5, #4]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, #0x18
	cmp r4, #3
	blt _02261C42
	pop {r3, r4, r5, pc}
	thumb_func_end ov93_02261C3C

	thumb_func_start ov93_02261C58
ov93_02261C58: @ 0x02261C58
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	str r3, [sp]
	ldr r4, _02261D04 @ =0x00000000
	beq _02261D02
	bl FUN_0203769C
	ldr r1, [sp]
	cmp r1, r0
	beq _02261D02
	adds r0, r4, #0
	adds r2, r7, #0
_02261C74:
	ldrb r1, [r2, #0x15]
	cmp r1, #0
	bne _02261C82
	movs r1, #0x18
	muls r1, r0, r1
	adds r4, r7, r1
	b _02261C8A
_02261C82:
	adds r0, r0, #1
	adds r2, #0x18
	cmp r0, #3
	blt _02261C74
_02261C8A:
	cmp r4, #0
	beq _02261D02
	ldr r1, [sp]
	adds r0, r6, #0
	bl ov93_0225E3C4
	ldr r1, [r6]
	ldr r2, _02261D08 @ =0x02262D2C
	adds r1, #0x30
	ldrb r1, [r1]
	adds r7, r0, #0
	ldr r0, [r4]
	lsls r3, r1, #3
	lsls r1, r7, #1
	adds r2, r2, r3
	ldrh r1, [r1, r2]
	bl FUN_0200DD10
	ldr r1, _02261D0C @ =0x02262C7A
	lsls r2, r5, #1
	ldrh r1, [r1, r2]
	ldr r0, [r4]
	bl FUN_0200DC4C
	ldr r0, [r6]
	movs r3, #0x16
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r3, r3, #0x10
	lsls r1, r0, #2
	ldr r0, _02261D10 @ =0x02262CD8
	adds r0, r0, r1
	ldrb r0, [r7, r0]
	ldr r1, _02261D14 @ =0x02262CB4
	lsls r2, r0, #2
	ldr r0, _02261D18 @ =0x02262CB6
	ldrsh r1, [r1, r2]
	ldrsh r0, [r0, r2]
	movs r2, #0x10
	subs r0, #0x18
	strh r0, [r4, #0x10]
	ldrsh r2, [r4, r2]
	ldr r0, [r4]
	subs r2, #0x60
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDF4
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0200DC0C
	ldr r0, [sp, #0x18]
	strb r5, [r4, #0x12]
	subs r0, #0xc
	strh r0, [r4, #0x16]
	movs r0, #0
	strb r0, [r4, #0x13]
	movs r0, #1
	strb r0, [r4, #0x15]
_02261D02:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02261D04: .4byte 0x00000000
_02261D08: .4byte 0x02262D2C
_02261D0C: .4byte 0x02262C7A
_02261D10: .4byte 0x02262CD8
_02261D14: .4byte 0x02262CB4
_02261D18: .4byte 0x02262CB6
	thumb_func_end ov93_02261C58

	thumb_func_start ov93_02261D1C
ov93_02261D1C: @ 0x02261D1C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	movs r4, #0
	adds r5, r6, #0
_02261D24:
	ldrb r0, [r5, #0x15]
	cmp r0, #1
	bne _02261D32
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov93_02261D3C
_02261D32:
	adds r4, r4, #1
	adds r5, #0x18
	cmp r4, #3
	blt _02261D24
	pop {r4, r5, r6, pc}
	thumb_func_end ov93_02261D1C

	thumb_func_start ov93_02261D3C
ov93_02261D3C: @ 0x02261D3C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r1, #0
	ldrb r0, [r4, #0x13]
	cmp r0, #4
	bls _02261D4A
	b _02261E88
_02261D4A:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02261D56: @ jump table
	.2byte _02261D60 - _02261D56 - 2 @ case 0
	.2byte _02261D88 - _02261D56 - 2 @ case 1
	.2byte _02261DC4 - _02261D56 - 2 @ case 2
	.2byte _02261E20 - _02261D56 - 2 @ case 3
	.2byte _02261E5A - _02261D56 - 2 @ case 4
_02261D60:
	add r1, sp, #0
	movs r3, #0x16
	ldr r0, [r4]
	adds r1, #2
	add r2, sp, #0
	lsls r3, r3, #0x10
	bl FUN_0200DE94
	add r1, sp, #0
	movs r0, #2
	ldrsh r0, [r1, r0]
	lsls r0, r0, #0xc
	str r0, [r4, #8]
	movs r0, #0
	ldrsh r0, [r1, r0]
	lsls r0, r0, #0xc
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0x13]
	adds r0, r0, #1
	strb r0, [r4, #0x13]
_02261D88:
	movs r0, #0x16
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02261D96
	subs r0, r0, #1
	strh r0, [r4, #0x16]
	b _02261E88
_02261D96:
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #2
	ldr r1, [r4, #0xc]
	lsls r0, r0, #0xe
	adds r2, r1, r0
	str r2, [r4, #0xc]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	asrs r0, r2, #0xb
	lsrs r0, r0, #0x14
	adds r0, r2, r0
	asrs r0, r0, #0xc
	cmp r0, r1
	blt _02261E88
	lsls r0, r1, #0xc
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0x13]
	adds r0, r0, #1
	strb r0, [r4, #0x13]
	b _02261E88
_02261DC4:
	add r1, sp, #0
	movs r3, #0x16
	ldr r0, [r4]
	adds r1, #2
	add r2, sp, #0
	lsls r3, r3, #0x10
	bl FUN_0200DE94
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	movs r1, #2
	ldrsh r1, [r3, r1]
	subs r2, #0x20
	lsls r2, r2, #0x10
	movs r3, #0x16
	ldr r0, [r4, #4]
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	ldr r0, [r4, #4]
	movs r1, #0x21
	bl FUN_0200DC4C
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, _02261EB0 @ =0x00000593
	bl FUN_0200604C
	ldrb r1, [r4, #0x12]
	ldr r0, [r4]
	lsls r2, r1, #1
	ldr r1, _02261EB4 @ =0x02262C7A
	ldrh r1, [r1, r2]
	adds r1, r1, #2
	bl FUN_0200DC4C
	movs r0, #8
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x13]
	adds r0, r0, #1
	strb r0, [r4, #0x13]
	b _02261E88
_02261E20:
	ldrb r0, [r4, #0x14]
	subs r0, r0, #1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x14]
	cmp r0, #3
	bne _02261E36
	movs r1, #1
	ldr r0, [r4, #4]
	lsls r1, r1, #0xe
	bl FUN_0200DC34
_02261E36:
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _02261E88
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0200DCE8
	ldrb r1, [r4, #0x12]
	ldr r0, [r4]
	lsls r2, r1, #1
	ldr r1, _02261EB4 @ =0x02262C7A
	ldrh r1, [r1, r2]
	bl FUN_0200DC4C
	ldrb r0, [r4, #0x13]
	adds r0, r0, #1
	strb r0, [r4, #0x13]
	b _02261E88
_02261E5A:
	movs r0, #2
	ldr r1, [r4, #0xc]
	lsls r0, r0, #0xe
	subs r1, r1, r0
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	str r1, [r4, #0xc]
	asrs r1, r0, #0xc
	movs r0, #0x10
	ldrsh r0, [r4, r0]
	subs r0, #0x60
	cmp r1, r0
	bgt _02261E88
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0
	strb r0, [r4, #0x13]
	add sp, #4
	strb r0, [r4, #0x15]
	pop {r3, r4, pc}
_02261E88:
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r2, r3, #0xb
	lsrs r2, r2, #0x14
	adds r2, r3, r2
	lsls r1, r1, #4
	lsls r2, r2, #4
	movs r3, #0x16
	ldr r0, [r4]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	movs r0, #1
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02261EB0: .4byte 0x00000593
_02261EB4: .4byte 0x02262C7A
	thumb_func_end ov93_02261D3C

	thumb_func_start ov93_02261EB8
ov93_02261EB8: @ 0x02261EB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	str r0, [sp, #0x18]
	str r1, [sp, #0x1c]
	str r2, [sp, #0x20]
	ldr r0, [sp, #0x8c]
	ldr r1, [sp, #0x88]
	movs r2, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x9c]
	bl FUN_02003068
	adds r7, r0, #0
	asrs r1, r7, #2
	lsrs r1, r1, #0x1d
	adds r1, r7, r1
	asrs r6, r1, #3
	movs r1, #8
	blx FUN_020CCD3C
	cmp r0, #0
	beq _02261EE6
	adds r6, r6, #1
_02261EE6:
	add r0, sp, #0x30
	bl FUN_0201D3C4
	movs r0, #0
	ldr r3, [sp, #0xb0]
	str r0, [sp]
	str r0, [sp, #4]
	lsls r2, r6, #0x18
	lsls r3, r3, #0x18
	ldr r0, [sp, #0x18]
	add r1, sp, #0x30
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D494
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x8c]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r2, [sp, #0x88]
	add r0, sp, #0x30
	str r3, [sp, #0x14]
	bl FUN_02020150
	add r0, sp, #0x30
	movs r1, #1
	movs r2, #0x75
	bl FUN_02013688
	movs r1, #1
	adds r2, r1, #0
	add r3, sp, #0x24
	bl FUN_02021AC8
	ldr r0, [sp, #0xa4]
	cmp r0, #1
	bne _02261F42
	lsrs r0, r7, #0x1f
	adds r0, r7, r0
	asrs r0, r0, #1
	subs r4, r4, r0
_02261F42:
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x40]
	add r0, sp, #0x30
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x1c]
	bl FUN_0200E2B0
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x98]
	bl FUN_0200D934
	str r0, [sp, #0x4c]
	movs r0, #0
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x28]
	str r4, [sp, #0x58]
	str r0, [sp, #0x54]
	ldr r0, [sp, #0xa0]
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0xa8]
	str r0, [sp, #0x60]
	ldr r0, [sp, #0xac]
	str r0, [sp, #0x64]
	movs r0, #1
	str r0, [sp, #0x68]
	movs r0, #0x75
	str r0, [sp, #0x6c]
	add r0, sp, #0x40
	bl FUN_020135D8
	ldr r1, [sp, #0x94]
	adds r6, r0, #0
	cmp r1, #0
	beq _02261F8C
	bl FUN_020138B0
_02261F8C:
	ldr r2, [sp, #0xa0]
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_020136B4
	add r0, sp, #0x30
	bl FUN_0201D520
	str r6, [r5]
	add r3, sp, #0x24
	ldm r3!, {r0, r1}
	adds r2, r5, #4
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	strh r7, [r5, #0x10]
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov93_02261EB8

	thumb_func_start ov93_02261FB0
ov93_02261FB0: @ 0x02261FB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_02013660
	adds r0, r4, #4
	bl FUN_02021B5C
	movs r0, #0
	str r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov93_02261FB0

	thumb_func_start ov93_02261FC8
ov93_02261FC8: @ 0x02261FC8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	movs r7, #0
	adds r5, r0, #0
_02261FD2:
	ldr r0, [sp]
	adds r1, r0, r7
	movs r0, #6
	lsls r0, r0, #6
	ldrb r1, [r1, r0]
	cmp r1, #0x40
	bge _02261FEA
	movs r0, #0x40
	subs r6, r0, r1
	adds r4, r6, #0
	subs r4, #0x50
	b _02262004
_02261FEA:
	cmp r1, #0x80
	bge _02261FFA
	movs r0, #0xa0
	subs r4, r0, r1
	subs r4, #0x10
	adds r6, r4, #0
	subs r6, #0x50
	b _02262004
_02261FFA:
	subs r1, #0xa0
	movs r0, #0x40
	subs r6, r0, r1
	adds r4, r6, #0
	subs r4, #0x50
_02262004:
	ldr r0, [r5, #4]
	add r1, sp, #8
	add r2, sp, #4
	bl FUN_02013794
	movs r2, #0xa8
	ldr r0, [r5, #4]
	ldr r1, [sp, #8]
	subs r2, r2, r6
	bl FUN_020136B4
	movs r2, #0xa8
	ldr r0, [r5, #0x18]
	ldr r1, [sp, #8]
	subs r2, r2, r4
	bl FUN_020136B4
	adds r7, r7, #1
	adds r5, #0x28
	cmp r7, #6
	blt _02261FD2
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov93_02261FC8

	thumb_func_start ov93_02262034
ov93_02262034: @ 0x02262034
	push {r3, r4, r5, lr}
	ldr r0, _02262094 @ =0x0000019E
	adds r4, r1, #0
	ldrsb r1, [r4, r0]
	cmp r1, #0
	ble _02262046
	subs r1, r1, #1
	strb r1, [r4, r0]
	pop {r3, r4, r5, pc}
_02262046:
	adds r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02262054
	cmp r0, #1
	beq _02262070
	pop {r3, r4, r5, pc}
_02262054:
	adds r0, r4, #0
	bl ov93_02262108
	cmp r0, #1
	bne _02262066
	adds r0, r4, #0
	bl ov93_022620D4
	pop {r3, r4, r5, pc}
_02262066:
	movs r0, #0x1a
	lsls r0, r0, #4
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
_02262070:
	adds r0, r4, #0
	bl ov93_02262130
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov93_02261FC8
	cmp r5, #1
	bne _02262092
	ldr r0, _02262094 @ =0x0000019E
	movs r1, #0xf
	strb r1, [r4, r0]
	adds r1, r0, #2
	ldrb r1, [r4, r1]
	adds r0, r0, #2
	subs r1, r1, #1
	strb r1, [r4, r0]
_02262092:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02262094: .4byte 0x0000019E
	thumb_func_end ov93_02262034

	thumb_func_start ov93_02262098
ov93_02262098: @ 0x02262098
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, _022620D0 @ =0x000186A0
	adds r7, r0, #0
	adds r6, r1, #0
	movs r4, #0
_022620A2:
	adds r0, r6, #0
	adds r1, r5, #0
	blx FUN_020F2998
	adds r3, r0, #0
	movs r0, #0x63
	lsls r2, r3, #4
	adds r1, r7, r4
	lsls r0, r0, #2
	strb r2, [r1, r0]
	adds r0, r3, #0
	muls r0, r5, r0
	subs r6, r6, r0
	adds r0, r5, #0
	movs r1, #0xa
	blx FUN_020F2998
	adds r4, r4, #1
	adds r5, r0, #0
	cmp r4, #6
	blt _022620A2
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022620D0: .4byte 0x000186A0
	thumb_func_end ov93_02262098

	thumb_func_start ov93_022620D4
ov93_022620D4: @ 0x022620D4
	push {r4, r5, r6, r7}
	movs r1, #0x66
	movs r5, #0
	lsls r1, r1, #2
	adds r3, r5, #0
	subs r2, r1, #6
_022620E0:
	movs r6, #0x63
	adds r4, r0, r5
	lsls r6, r6, #2
	ldrb r7, [r4, r6]
	subs r6, r6, #6
	strb r7, [r4, r6]
	movs r6, #5
	subs r6, r6, r5
	lsls r6, r6, #1
	strb r6, [r4, r1]
	adds r5, r5, #1
	strb r3, [r4, r2]
	cmp r5, #6
	blt _022620E0
	ldr r1, _02262104 @ =0x0000019F
	strb r3, [r0, r1]
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_02262104: .4byte 0x0000019F
	thumb_func_end ov93_022620D4

	thumb_func_start ov93_02262108
ov93_02262108: @ 0x02262108
	push {r4, r5}
	movs r1, #6
	lsls r1, r1, #6
	movs r5, #0
	adds r2, r1, #6
_02262112:
	adds r3, r0, r5
	ldrb r4, [r3, r1]
	ldrb r3, [r3, r2]
	cmp r4, r3
	beq _02262122
	movs r0, #0
	pop {r4, r5}
	bx lr
_02262122:
	adds r5, r5, #1
	cmp r5, #6
	blt _02262112
	movs r0, #1
	pop {r4, r5}
	bx lr
	.align 2, 0
	thumb_func_end ov93_02262108

	thumb_func_start ov93_02262130
ov93_02262130: @ 0x02262130
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _02262224 @ =0x0000019F
	movs r7, #5
	ldrb r0, [r6, r0]
	cmp r0, #6
	bls _02262142
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02262142:
	movs r4, #0
	str r4, [sp]
_02262146:
	ldr r0, [sp]
	adds r5, r6, r7
	mov ip, r0
	movs r0, #0x66
	lsls r0, r0, #2
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _0226216A
	movs r0, #0x66
	lsls r0, r0, #2
	ldrsb r0, [r5, r0]
	subs r1, r0, #1
	movs r0, #0x66
	lsls r0, r0, #2
	strb r1, [r5, r0]
	movs r0, #0
	str r0, [sp]
	b _02262216
_0226216A:
	ldr r0, _02262228 @ =0x00000192
	ldrb r0, [r5, r0]
	cmp r0, #1
	bls _02262186
	movs r0, #6
	ldr r1, _0226222C @ =0x00000186
	lsls r0, r0, #6
	ldrb r0, [r5, r0]
	ldrb r1, [r5, r1]
	cmp r0, r1
	bne _02262186
	movs r0, #1
	str r0, [sp]
	b _02262216
_02262186:
	movs r0, #0
	movs r1, #6
	str r0, [sp]
	movs r0, #6
	lsls r1, r1, #6
	lsls r0, r0, #6
	ldrb r2, [r5, r1]
	ldrb r0, [r5, r0]
	adds r2, #0x17
	strb r2, [r5, r1]
	adds r1, r1, #6
	ldrb r3, [r5, r1]
	adds r1, r3, #0
	adds r1, #0xa0
	cmp r0, r3
	bgt _022621B0
	movs r2, #6
	lsls r2, r2, #6
	ldrb r2, [r5, r2]
	cmp r2, r3
	bhs _022621BE
_022621B0:
	cmp r0, r1
	bgt _02262204
	movs r0, #6
	lsls r0, r0, #6
	ldrb r0, [r5, r0]
	cmp r0, r1
	blt _02262204
_022621BE:
	ldr r0, _02262228 @ =0x00000192
	ldrb r0, [r5, r0]
	cmp r0, #1
	bhs _022621D2
	ldr r0, _02262228 @ =0x00000192
	ldrb r0, [r5, r0]
	adds r1, r0, #1
	ldr r0, _02262228 @ =0x00000192
	strb r1, [r5, r0]
	b _02262204
_022621D2:
	cmp r7, #5
	beq _022621DC
	mov r0, ip
	cmp r0, #1
	bne _02262204
_022621DC:
	ldr r0, _02262228 @ =0x00000192
	ldrb r0, [r5, r0]
	adds r1, r0, #1
	ldr r0, _02262228 @ =0x00000192
	strb r1, [r5, r0]
	subs r0, #0xc
	ldrb r1, [r5, r0]
	movs r0, #6
	lsls r0, r0, #6
	strb r1, [r5, r0]
	adds r0, #0x1f
	ldrb r0, [r6, r0]
	adds r1, r0, #1
	ldr r0, _02262224 @ =0x0000019F
	strb r1, [r6, r0]
	ldrb r0, [r6, r0]
	cmp r0, #6
	blo _02262204
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02262204:
	movs r0, #6
	lsls r0, r0, #6
	ldrb r0, [r5, r0]
	movs r1, #0xa0
	blx FUN_020F2998
	movs r0, #6
	lsls r0, r0, #6
	strb r1, [r5, r0]
_02262216:
	adds r4, r4, #1
	subs r7, r7, #1
	cmp r4, #6
	blt _02262146
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02262224: .4byte 0x0000019F
_02262228: .4byte 0x00000192
_0226222C: .4byte 0x00000186
	thumb_func_end ov93_02262130

	thumb_func_start ov93_02262230
ov93_02262230: @ 0x02262230
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x24]
	ldr r1, [r1, #0x28]
	ldr r2, _0226224C @ =0x02262F6C
	bl FUN_0200D734
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0200DC0C
	adds r0, r4, #0
	pop {r4, pc}
	nop
_0226224C: .4byte 0x02262F6C
	thumb_func_end ov93_02262230

	thumb_func_start ov93_02262250
ov93_02262250: @ 0x02262250
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r7, r0, #0
	ldr r0, _022622FC @ =0x00003848
	adds r6, r7, #0
	ldr r0, [r7, r0]
	adds r4, r7, #0
	str r0, [sp, #0x2c]
	movs r0, #5
	str r0, [sp, #0x30]
	ldr r0, _02262300 @ =0x000016B0
	adds r6, #0x64
	adds r5, r7, r0
	adds r4, #0xc8
	adds r5, #0x64
_0226226E:
	ldr r0, _02262300 @ =0x000016B0
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0226227A
	bl FUN_0202551C
_0226227A:
	ldr r0, [sp, #0x2c]
	movs r1, #0xa
	blx FUN_020F2BA4
	adds r0, r7, #0
	adds r0, #0x80
	ldr r0, [r0]
	adds r1, r1, #4
	bl FUN_0200BBA0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x2c]
	movs r1, #0xa
	blx FUN_020F2BA4
	str r0, [sp, #0x2c]
	ldr r0, _02262304 @ =0x000015AC
	add r1, sp, #0x3c
	ldr r0, [r4, r0]
	add r2, sp, #0x38
	bl FUN_02013794
	ldr r0, [sp, #0x34]
	adds r2, r7, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _02262308 @ =0x000E0F00
	adds r2, #0x90
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0226230C @ =0x00002713
	adds r3, r5, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0x14]
	movs r0, #0xa8
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	movs r0, #1
	str r0, [sp, #0x20]
	movs r0, #0xc
	str r0, [sp, #0x24]
	movs r0, #2
	str r0, [sp, #0x28]
	ldr r0, [r7, #0x2c]
	ldr r1, [r7, #0x28]
	ldr r2, [r2]
	bl ov93_02261EB8
	ldr r0, [sp, #0x34]
	bl FUN_02026380
	ldr r0, [sp, #0x30]
	subs r6, #0x14
	subs r4, #0x28
	subs r5, #0x14
	subs r0, r0, #1
	str r0, [sp, #0x30]
	bpl _0226226E
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022622FC: .4byte 0x00003848
_02262300: .4byte 0x000016B0
_02262304: .4byte 0x000015AC
_02262308: .4byte 0x000E0F00
_0226230C: .4byte 0x00002713
	thumb_func_end ov93_02262250

	thumb_func_start ov93_02262310
ov93_02262310: @ 0x02262310
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _02262334 @ =0x000016B0
	movs r6, #0
	adds r4, r5, r0
	adds r7, r0, #0
_0226231C:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _02262328
	adds r0, r4, #0
	bl ov93_02261FB0
_02262328:
	adds r6, r6, #1
	adds r5, #0x14
	adds r4, #0x14
	cmp r6, #6
	blt _0226231C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02262334: .4byte 0x000016B0
	thumb_func_end ov93_02262310

	thumb_func_start ov93_02262338
ov93_02262338: @ 0x02262338
	ldr r3, _02262340 @ =FUN_0200D9DC
	adds r0, r1, #0
	bx r3
	nop
_02262340: .4byte FUN_0200D9DC
	thumb_func_end ov93_02262338

	thumb_func_start ov93_02262344
ov93_02262344: @ 0x02262344
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x24]
	ldr r1, [r1, #0x28]
	ldr r2, _02262364 @ =0x02262FA0
	bl FUN_0200D734
	adds r4, r0, #0
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4]
	bl FUN_0200DC0C
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
_02262364: .4byte 0x02262FA0
	thumb_func_end ov93_02262344

	thumb_func_start ov93_02262368
ov93_02262368: @ 0x02262368
	ldr r3, _02262370 @ =FUN_0200D9DC
	adds r0, r1, #0
	bx r3
	nop
_02262370: .4byte FUN_0200D9DC
	thumb_func_end ov93_02262368

	thumb_func_start ov93_02262374
ov93_02262374: @ 0x02262374
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #4
	ldrsh r1, [r4, r0]
	cmp r1, #0xa
	bhi _0226243E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0226238C: @ jump table
	.2byte _022623A2 - _0226238C - 2 @ case 0
	.2byte _022623C2 - _0226238C - 2 @ case 1
	.2byte _022623EA - _0226238C - 2 @ case 2
	.2byte _0226240C - _0226238C - 2 @ case 3
	.2byte _0226241E - _0226238C - 2 @ case 4
	.2byte _022623A2 - _0226238C - 2 @ case 5
	.2byte _022623C2 - _0226238C - 2 @ case 6
	.2byte _022623EA - _0226238C - 2 @ case 7
	.2byte _0226240C - _0226238C - 2 @ case 8
	.2byte _0226241E - _0226238C - 2 @ case 9
	.2byte _0226243A - _0226238C - 2 @ case 10
_022623A2:
	movs r3, #0x16
	ldr r0, [r4]
	movs r1, #0x80
	movs r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #4
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _0226243E
_022623C2:
	movs r1, #6
	ldrsh r2, [r4, r1]
	adds r2, r2, #1
	strh r2, [r4, #6]
	ldrsh r1, [r4, r1]
	cmp r1, #0xf
	ble _0226243E
	movs r1, #0
	strh r1, [r4, #6]
	movs r1, #1
	str r1, [r4, #0x14]
	str r1, [r4, #0x18]
	movs r1, #0x80
	str r1, [r4, #0xc]
	movs r1, #0x20
	str r1, [r4, #0x10]
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _0226243E
_022623EA:
	movs r1, #0
	str r1, [r4, #0x18]
	ldr r0, [r4, #0x10]
	movs r2, #6
	adds r0, r0, #6
	str r0, [r4, #0x10]
	ldr r0, [r4]
	bl FUN_0200DED0
	ldr r0, [r4, #0x10]
	cmp r0, #0x60
	ble _0226243E
	movs r0, #4
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _0226243E
_0226240C:
	movs r1, #0
	str r1, [r4, #0x14]
	ldr r0, [r4]
	bl FUN_0200DCE8
	movs r0, #4
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #4]
_0226241E:
	movs r0, #6
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r0, [r4, r0]
	cmp r0, #0x1e
	ble _0226243E
	movs r0, #0
	strh r0, [r4, #6]
	movs r0, #4
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _0226243E
_0226243A:
	movs r0, #1
	pop {r4, pc}
_0226243E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov93_02262374

	thumb_func_start ov93_02262444
ov93_02262444: @ 0x02262444
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	movs r6, #0
_0226244C:
	ldr r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	ldr r2, _02262480 @ =0x02262F38
	bl FUN_0200D734
	adds r4, r0, #0
	movs r1, #0x1b
	bl FUN_0200DC4C
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0200E0FC
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4]
	bl FUN_0200DC0C
	adds r6, r6, #1
	stm r5!, {r4}
	cmp r6, #2
	blt _0226244C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02262480: .4byte 0x02262F38
	thumb_func_end ov93_02262444

	thumb_func_start ov93_02262484
ov93_02262484: @ 0x02262484
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r4, #0
_0226248A:
	ldr r0, [r5]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _0226248A
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov93_02262484

	thumb_func_start ov93_0226249C
ov93_0226249C: @ 0x0226249C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, [r1]
	add r1, sp, #4
	movs r3, #0x16
	str r2, [sp]
	adds r1, #2
	add r2, sp, #4
	lsls r3, r3, #0x10
	bl FUN_0200DE94
	ldr r5, [sp]
	movs r4, #0
	add r6, sp, #4
	movs r7, #1
_022624BA:
	movs r2, #0
	ldrsh r2, [r6, r2]
	movs r1, #2
	movs r3, #0x16
	adds r2, #0x1c
	lsls r2, r2, #0x10
	ldrsh r1, [r6, r1]
	ldr r0, [r5]
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	ldr r0, [r5]
	movs r1, #0x1b
	bl FUN_0200DC4C
	ldr r0, [r5]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r5]
	movs r1, #1
	bl FUN_0200DCE8
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r2, r0, #0x14
	subs r2, r2, r1
	movs r0, #0x14
	rors r2, r0
	movs r0, #1
	adds r1, r1, r2
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [r5, #8]
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r2, r0, #0x16
	subs r2, r2, r1
	movs r0, #0x16
	rors r2, r0
	movs r0, #1
	adds r1, r1, r2
	lsls r0, r0, #0xa
	adds r0, r1, r0
	str r0, [r5, #0x10]
	adds r0, r4, #0
	tst r0, r7
	beq _0226252A
	movs r0, #0
	ldr r1, [r5, #8]
	mvns r0, r0
	muls r0, r1, r0
	str r0, [r5, #8]
_0226252A:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _022624BA
	ldr r0, [sp]
	movs r1, #0
	strb r1, [r0, #0x19]
	movs r1, #1
	strb r1, [r0, #0x18]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov93_0226249C

	thumb_func_start ov93_02262540
ov93_02262540: @ 0x02262540
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r2, #0
	ldrb r0, [r6, #0x18]
	cmp r0, #0
	beq _02262594
	cmp r0, #1
	bne _02262594
	movs r4, #0
	adds r5, r6, #0
_02262552:
	ldr r2, [r5, #0x10]
	ldr r0, [r5]
	ldr r1, [r5, #8]
	rsbs r2, r2, #0
	bl FUN_0200DEDC
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0200DC0C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _02262552
	ldrb r0, [r6, #0x19]
	adds r0, r0, #1
	strb r0, [r6, #0x19]
	ldrb r0, [r6, #0x19]
	cmp r0, #8
	bls _02262594
	movs r5, #0
	adds r4, r6, #0
	adds r7, r5, #0
_02262580:
	ldr r0, [r4]
	adds r1, r7, #0
	bl FUN_0200DCE8
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #2
	blt _02262580
	movs r0, #0
	strb r0, [r6, #0x18]
_02262594:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov93_02262540

	thumb_func_start ov93_02262598
ov93_02262598: @ 0x02262598
	push {r3, r4, r5, lr}
	movs r1, #0xc
	movs r2, #0x75
	adds r5, r0, #0
	bl FUN_02007280
	movs r1, #0
	movs r2, #0xc
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	bl FUN_020072A4
	str r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov93_02262598

	thumb_func_start ov93_022625BC
ov93_022625BC: @ 0x022625BC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	bne _02262642
	adds r1, r0, #0
	adds r1, #0x3e
	ldrb r1, [r1]
	cmp r1, #0
	beq _022625E4
	cmp r1, #1
	beq _02262606
	cmp r1, #2
	b _0226261E
_022625E4:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _022625F0
	bl FUN_0200FB70
_022625F0:
	movs r0, #0
	bl FUN_0200FC20
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	adds r1, #0x3e
	adds r0, r0, #1
	strb r0, [r1]
	b _0226263E
_02262606:
	bl FUN_02258B98
	cmp r0, #1
	bne _0226263E
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	adds r1, #0x3e
	adds r0, r0, #1
	strb r0, [r1]
	b _0226263E
_0226261E:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0226262C
	bl FUN_02258938
	movs r0, #0
	str r0, [r4, #4]
_0226262C:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0226263A
	bl FUN_02258A04
	movs r0, #0
	str r0, [r4, #8]
_0226263A:
	movs r0, #1
	pop {r3, r4, r5, pc}
_0226263E:
	movs r0, #0
	pop {r3, r4, r5, pc}
_02262642:
	ldr r1, [r5]
	cmp r1, #5
	bhi _022626E0
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02262654: @ jump table
	.2byte _02262660 - _02262654 - 2 @ case 0
	.2byte _02262674 - _02262654 - 2 @ case 1
	.2byte _02262684 - _02262654 - 2 @ case 2
	.2byte _022626A8 - _02262654 - 2 @ case 3
	.2byte _022626BC - _02262654 - 2 @ case 4
	.2byte _022626E0 - _02262654 - 2 @ case 5
_02262660:
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _0226266E
	movs r0, #1
	str r0, [r5]
	b _022626E4
_0226266E:
	movs r0, #3
	str r0, [r5]
	b _022626E4
_02262674:
	movs r1, #0x75
	bl FUN_0225892C
	str r0, [r4, #4]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022626E4
_02262684:
	ldr r0, [r4, #4]
	bl FUN_022589BC
	cmp r0, #1
	bne _022626E4
	ldr r0, [r4, #4]
	bl FUN_022589CC
	ldr r1, [r4]
	str r0, [r1, #0x34]
	ldr r0, [r4, #4]
	bl FUN_02258938
	movs r0, #0
	str r0, [r4, #4]
	movs r0, #5
	str r0, [r5]
	b _022626E4
_022626A8:
	adds r1, r0, #0
	adds r1, #0x10
	movs r2, #0x75
	bl FUN_022589F8
	str r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022626E4
_022626BC:
	ldr r0, [r4, #8]
	bl FUN_02258AA0
	cmp r0, #1
	bne _022626E4
	ldr r0, [r4, #8]
	bl FUN_02258AA4
	ldr r1, [r4]
	str r0, [r1, #0x38]
	ldr r0, [r4, #8]
	bl FUN_02258A04
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #5
	str r0, [r5]
	b _022626E4
_022626E0:
	movs r0, #1
	pop {r3, r4, r5, pc}
_022626E4:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov93_022625BC

	thumb_func_start ov93_022626E8
ov93_022626E8: @ 0x022626E8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02007290
	adds r0, r4, #0
	bl FUN_02007294
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov93_022626E8

	thumb_func_start ov93_022626FC
ov93_022626FC: @ 0x022626FC
	ldr r3, _02262708 @ =FUN_0203410C
	adds r2, r0, #0
	ldr r0, _0226270C @ =0x022630E4
	movs r1, #4
	bx r3
	nop
_02262708: .4byte FUN_0203410C
_0226270C: .4byte 0x022630E4
	thumb_func_end ov93_022626FC

	thumb_func_start ov93_02262710
ov93_02262710: @ 0x02262710
	movs r0, #0x14
	bx lr
	thumb_func_end ov93_02262710

	thumb_func_start ov93_02262714
ov93_02262714: @ 0x02262714
	movs r0, #4
	bx lr
	thumb_func_end ov93_02262714

	thumb_func_start ov93_02262718
ov93_02262718: @ 0x02262718
	adds r1, r0, #0
	adds r0, r3, #0
	ldr r3, _02262720 @ =ov93_0225E144
	bx r3
	.align 2, 0
_02262720: .4byte ov93_0225E144
	thumb_func_end ov93_02262718

	thumb_func_start ov93_02262724
ov93_02262724: @ 0x02262724
	push {r3, lr}
	movs r0, #0x18
	movs r2, #0x14
	bl FUN_02037030
	cmp r0, #1
	bne _02262736
	movs r0, #1
	pop {r3, pc}
_02262736:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov93_02262724

	thumb_func_start ov93_0226273C
ov93_0226273C: @ 0x0226273C
	movs r0, #0xbf
	movs r1, #1
	lsls r0, r0, #6
	str r1, [r3, r0]
	bx lr
	.align 2, 0
	thumb_func_end ov93_0226273C

	thumb_func_start ov93_02262748
ov93_02262748: @ 0x02262748
	push {r3, lr}
	movs r1, #0
	movs r0, #0x19
	adds r2, r1, #0
	bl FUN_02037030
	cmp r0, #1
	bne _0226275C
	movs r0, #1
	pop {r3, pc}
_0226275C:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov93_02262748

	thumb_func_start ov93_02262760
ov93_02262760: @ 0x02262760
	push {r4, r5, r6, lr}
	adds r4, r3, #0
	ldr r3, [r4]
	ldr r1, [r2]
	adds r5, r3, #0
	adds r5, #0x30
	ldrb r5, [r5]
	movs r2, #0
	cmp r5, #0
	ble _0226278E
_02262774:
	adds r6, r3, #0
	adds r6, #0x2c
	ldrb r6, [r6]
	cmp r0, r6
	bne _02262786
	lsls r0, r2, #2
	adds r0, r4, r0
	str r1, [r0, #0xc]
	b _0226278E
_02262786:
	adds r2, r2, #1
	adds r3, r3, #1
	cmp r2, r5
	blt _02262774
_0226278E:
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r2, r0
	blt _0226279C
	bl FUN_0202551C
_0226279C:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
	thumb_func_end ov93_02262760

	thumb_func_start ov93_022627A4
ov93_022627A4: @ 0x022627A4
	push {r3, lr}
	movs r0, #0x64
	str r0, [sp]
	movs r0, #0x17
	add r1, sp, #0
	movs r2, #4
	bl FUN_02037030
	cmp r0, #1
	bne _022627BC
	movs r0, #1
	pop {r3, pc}
_022627BC:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov93_022627A4

	thumb_func_start ov93_022627C0
ov93_022627C0: @ 0x022627C0
	push {r4, lr}
	adds r4, r1, #0
	ldr r2, [r4]
	lsls r3, r2, #2
	ldr r2, _022627E4 @ =0x02263114
	ldr r2, [r2, r3]
	cmp r2, #0
	beq _022627E0
	blx r2
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	movs r0, #1
	pop {r4, pc}
_022627E0:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_022627E4: .4byte 0x02263114
	thumb_func_end ov93_022627C0

	thumb_func_start ov93_022627E8
ov93_022627E8: @ 0x022627E8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r1, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	movs r0, #1
	str r0, [sp]
	add r2, sp, #4
	ldm r4!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r2!, {r0, r1}
	adds r0, r5, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov93_022627E8

	thumb_func_start ov93_02262814
ov93_02262814: @ 0x02262814
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	bl FUN_0203769C
	ldrb r1, [r4, #4]
	cmp r1, r0
	beq _0226282C
	adds r0, r5, #0
	adds r1, r4, #4
	bl ov93_0225FEC4
_0226282C:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov93_02262814

	thumb_func_start ov93_02262830
ov93_02262830: @ 0x02262830
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	movs r0, #2
	str r0, [sp]
	add r0, sp, #0
	strh r5, [r0, #4]
	movs r1, #5
	strb r1, [r0, #6]
	strb r4, [r0, #7]
	adds r0, r6, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov93_02262830

	thumb_func_start ov93_02262860
ov93_02262860: @ 0x02262860
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, _02262880 @ =0x00002FD0
	adds r5, r0, #0
	ldr r2, [r5, r1]
	adds r2, r2, #1
	str r2, [r5, r1]
	bl ov93_02260908
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	bl ov93_0225E48C
	pop {r3, r4, r5, pc}
	nop
_02262880: .4byte 0x00002FD0
	thumb_func_end ov93_02262860

	thumb_func_start ov93_02262884
ov93_02262884: @ 0x02262884
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	adds r6, r3, #0
	blx FUN_020D4994
	movs r0, #3
	str r0, [sp]
	add r0, sp, #0
	strh r5, [r0, #4]
	strb r4, [r0, #6]
	movs r1, #4
	strb r1, [r0, #7]
	strb r6, [r0, #8]
	adds r0, r7, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov93_02262884

	thumb_func_start ov93_022628B8
ov93_022628B8: @ 0x022628B8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldrh r1, [r4, #4]
	adds r5, r0, #0
	ldr r0, _022628E8 @ =0x00002FC8
	ldr r3, _022628EC @ =0x00001428
	str r1, [r5, r0]
	ldr r1, [r5]
	ldrb r2, [r4, #6]
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r0, [r5, #0x2c]
	adds r3, r5, r3
	bl ov93_0225FBF0
	ldr r0, _022628F0 @ =0x00002FCC
	movs r1, #1
	str r1, [r5, r0]
	ldrb r1, [r4, #7]
	ldrb r2, [r4, #8]
	adds r0, r5, #0
	bl ov93_0225E48C
	pop {r3, r4, r5, pc}
	.align 2, 0
_022628E8: .4byte 0x00002FC8
_022628EC: .4byte 0x00001428
_022628F0: .4byte 0x00002FCC
	thumb_func_end ov93_022628B8

	thumb_func_start ov93_022628F4
ov93_022628F4: @ 0x022628F4
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r1, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	movs r0, #4
	str r0, [sp]
	movs r1, #2
	add r0, sp, #0
	strb r1, [r0, #4]
	strb r4, [r0, #5]
	adds r0, r5, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov93_022628F4

	thumb_func_start ov93_02262920
ov93_02262920: @ 0x02262920
	adds r2, r1, #0
	movs r1, #3
	str r1, [r0, #0x20]
	ldrb r1, [r2, #4]
	ldr r3, _02262930 @ =ov93_0225E48C
	ldrb r2, [r2, #5]
	bx r3
	nop
_02262930: .4byte ov93_0225E48C
	thumb_func_end ov93_02262920

	thumb_func_start ov93_02262934
ov93_02262934: @ 0x02262934
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r1, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	movs r0, #5
	str r0, [sp]
	movs r1, #3
	add r0, sp, #0
	strb r1, [r0, #4]
	strb r4, [r0, #5]
	adds r0, r5, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov93_02262934

	thumb_func_start ov93_02262960
ov93_02262960: @ 0x02262960
	adds r3, r1, #0
	ldr r1, _02262974 @ =0x00002FBC
	movs r2, #1
	str r2, [r0, r1]
	movs r1, #6
	str r1, [r0, #0x20]
	ldrb r1, [r3, #4]
	ldrb r2, [r3, #5]
	ldr r3, _02262978 @ =ov93_0225E48C
	bx r3
	.align 2, 0
_02262974: .4byte 0x00002FBC
_02262978: .4byte ov93_0225E48C
	thumb_func_end ov93_02262960

	thumb_func_start ov93_0226297C
ov93_0226297C: @ 0x0226297C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	movs r0, #6
	str r0, [sp]
	add r0, sp, #0
	strb r5, [r0, #4]
	strb r4, [r0, #5]
	adds r0, r6, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov93_0226297C

	thumb_func_start ov93_022629A8
ov93_022629A8: @ 0x022629A8
	ldr r3, _022629B4 @ =ov93_0225E48C
	adds r2, r1, #0
	ldrb r1, [r2, #4]
	ldrb r2, [r2, #5]
	bx r3
	nop
_022629B4: .4byte ov93_0225E48C
	thumb_func_end ov93_022629A8

	thumb_func_start ov93_022629B8
ov93_022629B8: @ 0x022629B8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r1, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	movs r0, #7
	str r0, [sp]
	movs r1, #6
	add r0, sp, #0
	strb r1, [r0, #4]
	strb r4, [r0, #5]
	adds r0, r5, #0
	add r1, sp, #0
	bl ov93_0225E230
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov93_022629B8

	thumb_func_start ov93_022629E4
ov93_022629E4: @ 0x022629E4
	adds r2, r1, #0
	movs r1, #1
	str r1, [r0, #0x20]
	ldrb r1, [r2, #4]
	ldr r3, _022629F4 @ =ov93_0225E48C
	ldrb r2, [r2, #5]
	bx r3
	nop
_022629F4: .4byte ov93_0225E48C
	thumb_func_end ov93_022629E4

	.rodata

_022629F8:
	.byte 0x69, 0xC7, 0x25, 0x02, 0x8D, 0xCA, 0x25, 0x02
	.byte 0x11, 0xCD, 0x25, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0x99, 0x25, 0x26, 0x02, 0xBD, 0x25, 0x26, 0x02
	.byte 0xE9, 0x26, 0x26, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x85, 0xE5, 0x25, 0x02, 0x1D, 0xE6, 0x25, 0x02, 0xF9, 0xE6, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x1E, 0x88, 0x01, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x88, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x02, 0x01, 0x00, 0x00, 0x03, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x02, 0x00, 0x00, 0x03, 0x01, 0x02, 0x60, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x20, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00
	.byte 0x2A, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x02, 0x03
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x06, 0x04, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x04, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08, 0x05
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x0C, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x40, 0xC0, 0x10, 0xA8, 0x28, 0xD8, 0x00, 0xA8, 0x54, 0xAC, 0x08
	.byte 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x0F, 0x00, 0x00, 0xFF, 0x0F, 0x00, 0x00, 0xFF, 0x0F
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xF0, 0x00, 0x00, 0x01, 0xF0, 0x00, 0x00
	.byte 0x01, 0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x13, 0x27, 0x00, 0x00
	.byte 0x15, 0x27, 0x00, 0x00, 0x13, 0x27, 0x00, 0x00, 0x13, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x08, 0x00
	.byte 0x07, 0x00, 0x1D, 0x00, 0x0D, 0x00, 0x3D, 0x00, 0x2D, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0F, 0x00
	.byte 0x12, 0x00, 0x52, 0x00, 0x51, 0x00, 0x53, 0x00, 0x54, 0x00, 0x20, 0x00, 0x10, 0x00, 0x30, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x4D, 0x15, 0x26, 0x02, 0x55, 0x15, 0x26, 0x02, 0x45, 0x17, 0x26, 0x02
	.byte 0xC5, 0x18, 0x26, 0x02, 0x00, 0x10, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x80, 0x00, 0xA4, 0x00, 0x80, 0x00, 0x1C, 0x00, 0x34, 0x00, 0x60, 0x00
	.byte 0xCC, 0x00, 0x60, 0x00, 0x08, 0x14, 0x07, 0x00, 0x08, 0x11, 0x07, 0x00, 0x08, 0x0E, 0x06, 0x00
	.byte 0x08, 0x0A, 0x06, 0x00, 0x08, 0x06, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x03
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x03, 0x00, 0x00, 0x02, 0x01, 0x03, 0x0B, 0x00, 0x0C, 0x00
	.byte 0x00, 0x11, 0x00, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x00, 0x17, 0x00, 0x00, 0x07, 0x00, 0x08, 0x00
	.byte 0x00, 0x1D, 0x00, 0x00, 0x20, 0x00, 0x10, 0x00, 0x30, 0x00, 0x40, 0x00, 0x20, 0x00, 0x10, 0x00
	.byte 0x30, 0x00, 0x40, 0x00, 0x20, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x30, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x40, 0x00, 0x10, 0x00, 0x30, 0x00, 0x02, 0x00, 0x04, 0x00
	.byte 0x01, 0x00, 0x03, 0x00, 0x02, 0x00, 0x04, 0x00, 0x01, 0x00, 0x03, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x04, 0x00
	.byte 0x01, 0x00, 0x03, 0x00, 0x52, 0x00, 0x51, 0x00, 0x53, 0x00, 0x54, 0x00, 0x52, 0x00, 0x51, 0x00
	.byte 0x53, 0x00, 0x54, 0x00, 0x52, 0x00, 0x51, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x00, 0x53, 0x00
	.byte 0x51, 0x00, 0x00, 0x00, 0x52, 0x00, 0x54, 0x00, 0x51, 0x00, 0x53, 0x00, 0x16, 0x00, 0x15, 0x00
	.byte 0x17, 0x00, 0x18, 0x00, 0x16, 0x00, 0x15, 0x00, 0x17, 0x00, 0x18, 0x00, 0x16, 0x00, 0x17, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x18, 0x00, 0x17, 0x00, 0x00, 0x00, 0x16, 0x00, 0x15, 0x00
	.byte 0x17, 0x00, 0x18, 0x00, 0x1D, 0x00, 0x2D, 0x00, 0x0D, 0x00, 0x3D, 0x00, 0x1D, 0x00, 0x2D, 0x00
	.byte 0x0D, 0x00, 0x3D, 0x00, 0x1D, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x3D, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x2D, 0x00, 0x0D, 0x00, 0x3D, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x14, 0x27, 0x00, 0x00, 0x16, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x16, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0x14, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x16, 0x27, 0x00, 0x00
	.byte 0x14, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0x16, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x14, 0x27, 0x00, 0x00, 0x16, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x16, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0x14, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x16, 0x27, 0x00, 0x00
	.byte 0x14, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0x16, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x12, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x12, 0x27, 0x00, 0x00, 0x12, 0x27, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x11, 0x27, 0x00, 0x00, 0x12, 0x27, 0x00, 0x00, 0x11, 0x27, 0x00, 0x00
	.byte 0x11, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0x00, 0x00, 0x70, 0x17, 0x00, 0x00, 0x40, 0x1F, 0x00, 0x00
	.byte 0xE8, 0x03, 0x00, 0x00, 0xE8, 0x03, 0x00, 0x00, 0xE8, 0x03, 0x00, 0x00, 0xA6, 0x19, 0x00, 0x00
	.byte 0xFA, 0x20, 0x00, 0x00, 0x4E, 0x28, 0x00, 0x00, 0xEC, 0x20, 0x00, 0x00, 0x54, 0x2A, 0x00, 0x00
	.byte 0xBC, 0x33, 0x00, 0x00, 0x48, 0x26, 0x00, 0x00, 0x38, 0x31, 0x00, 0x00, 0x28, 0x3C, 0x00, 0x00
	.byte 0x80, 0x00, 0xD0, 0x00, 0x07, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xD0, 0x00, 0x07, 0x00, 0x02, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0xD0, 0x00, 0x07, 0x00, 0x02, 0x02, 0x00, 0x00, 0x80, 0x00, 0xF0, 0xFF, 0x0A, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xD0, 0x00, 0x07, 0x00, 0x02, 0x02
	.byte 0x00, 0x00, 0xF0, 0xFF, 0x60, 0x00, 0x09, 0x00, 0x03, 0x03, 0x00, 0x00, 0x10, 0x01, 0x60, 0x00
	.byte 0x08, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0xD0, 0x00, 0x07, 0x00, 0x02, 0x02, 0x00, 0x00, 0xF0, 0xFF, 0x60, 0x00, 0x09, 0x00
	.byte 0x04, 0x03, 0x00, 0x00, 0x80, 0x00, 0xF0, 0xFF, 0x0A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01
	.byte 0x60, 0x00, 0x08, 0x00, 0x03, 0x01, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x00, 0x00
	.byte 0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x42, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x61, 0x27, 0x26, 0x02, 0x15, 0x27, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0x19, 0x27, 0x26, 0x02
	.byte 0x11, 0x27, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0x3D, 0x27, 0x26, 0x02, 0xC1, 0x42, 0x03, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x15, 0x28, 0x26, 0x02, 0x61, 0x28, 0x26, 0x02
	.byte 0xB9, 0x28, 0x26, 0x02, 0x21, 0x29, 0x26, 0x02, 0x61, 0x29, 0x26, 0x02, 0xA9, 0x29, 0x26, 0x02
	.byte 0xE5, 0x29, 0x26, 0x02
	@ 0x02263134
