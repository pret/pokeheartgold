	.include "asm/macros.inc"
	.include "global.inc"

	.text

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
	bl GF_AssertFail
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
	bl GF_AssertFail
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
	bl GF_AssertFail
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
	bl GF_AssertFail
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
	bl GF_AssertFail
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
	bl GF_AssertFail
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
	bl GF_AssertFail
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
	bl GF_AssertFail
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
	bl GF_AssertFail
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
	bl GF_AssertFail
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
	blx ov93_0225EF0C
	adds r0, r4, #0
	blx ov93_0225EF5C
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
	blx ov93_0225F9D8
	adds r0, r5, #0
	blx ov93_0225FB00
	movs r1, #0x8d
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	blx ov93_0225FB6C
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
	blx ov93_0225FBE4
	adds r0, r5, #0
	blx ov93_0225FABC
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
	blx ov93_0225F370
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
	blx ov93_0225F44C
	adds r0, r4, #0
	bl ov93_0225EB70
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	blx ov93_0225FB6C
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
	blx ov93_0225F9AC
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
	blx ov93_0225EE98
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
	blx ov93_0225EFAC
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
	bl GF_AssertFail
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
	blx DC_FlushRange
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
	bl GF_AssertFail
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
	blx DC_FlushRange
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
	.byte 0x00, 0x00, 0x00, 0x00
