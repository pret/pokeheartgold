
	thumb_func_start ov89_02258800
ov89_02258800: @ 0x02258800
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r1, #1
	lsls r1, r1, #0x1a
	ldr r0, [r1]
	ldr r2, _02258AC4 @ =0xFFFFE0FF
	ands r0, r2
	str r0, [r1]
	ldr r0, _02258AC8 @ =0x04001000
	ldr r3, [r0]
	ands r2, r3
	str r2, [r0]
	ldr r3, [r1]
	ldr r2, _02258ACC @ =0xFFFF1FFF
	ands r3, r2
	str r3, [r1]
	ldr r3, [r0]
	adds r1, #0x50
	ands r2, r3
	str r2, [r0]
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x50
	strh r2, [r0]
	movs r2, #5
	movs r0, #3
	movs r1, #0x7d
	lsls r2, r2, #0x10
	bl FUN_0201A910
	ldr r1, _02258AD0 @ =0x000019E4
	adds r0, r4, #0
	movs r2, #0x7d
	bl FUN_02007280
	ldr r2, _02258AD0 @ =0x000019E4
	movs r1, #0
	adds r5, r0, #0
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_020072A4
	str r0, [r5]
	ldr r0, [r0]
	bl FUN_0222A2C8
	str r0, [r5, #4]
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0222A2CC
	ldr r1, _02258AD4 @ =0x000019E0
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov89_02259E18
	ldr r0, [r5]
	ldr r2, _02258AD8 @ =0x000008D8
	ldrb r0, [r0, #4]
	ldr r1, [r5, #4]
	adds r2, r5, r2
	bl ov89_02259E50
	movs r1, #2
	ldr r0, _02258ADC @ =0x000019D4
	lsls r1, r1, #0xc
	str r1, [r5, r0]
	ldr r1, [r5, r0]
	adds r0, r0, #4
	str r1, [r5, r0]
	movs r0, #0x7d
	bl ov89_02259D70
	str r0, [r5, #0x14]
	movs r0, #0x7d
	bl FUN_020030E8
	str r0, [r5, #0xc]
	movs r1, #1
	bl FUN_02003B50
	movs r2, #2
	ldr r0, [r5, #0xc]
	movs r1, #0
	lsls r2, r2, #8
	movs r3, #0x7d
	bl FUN_02003120
	movs r1, #1
	ldr r0, [r5, #0xc]
	lsls r2, r1, #9
	movs r3, #0x7d
	bl FUN_02003120
	movs r2, #7
	ldr r0, [r5, #0xc]
	movs r1, #2
	lsls r2, r2, #6
	movs r3, #0x7d
	bl FUN_02003120
	movs r2, #2
	ldr r0, [r5, #0xc]
	movs r1, #3
	lsls r2, r2, #8
	movs r3, #0x7d
	bl FUN_02003120
	ldr r0, [r5, #0xc]
	movs r1, #1
	bl FUN_02003B50
	movs r0, #0x7d
	bl FUN_0201AC88
	str r0, [r5, #8]
	movs r0, #0x40
	movs r1, #0x7d
	bl FUN_0202055C
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	ldr r0, [r5, #8]
	bl ov89_0225905C
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	movs r0, #2
	movs r1, #0x7d
	bl FUN_02002CEC
	movs r0, #0x7d
	bl FUN_0200BD08
	str r0, [r5, #0x2c]
	ldr r2, _02258AE0 @ =0x000002F2
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x7d
	bl FUN_0200BAF8
	str r0, [r5, #0x30]
	movs r0, #4
	movs r1, #0x7d
	bl FUN_02013534
	str r0, [r5, #0x10]
	movs r0, #0xd2
	movs r1, #0x7d
	bl FUN_02007688
	movs r1, #0x16
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #0x45
	movs r1, #0x7d
	bl FUN_02007688
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov89_02259264
	movs r1, #0x16
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov89_02259BAC
	adds r0, r5, #0
	bl ov89_02259B00
	adds r0, r5, #0
	bl ov89_02259CD0
	movs r0, #1
	lsls r0, r0, #8
	movs r1, #0x7d
	bl FUN_02026354
	adds r1, r5, #0
	adds r1, #0xc4
	str r0, [r1]
	movs r0, #0x7d
	bl FUN_0200CF18
	ldr r1, _02258AE4 @ =0x0225CA58
	ldr r2, _02258AE8 @ =0x0225C9EC
	movs r3, #0x20
	str r0, [r5, #0x1c]
	bl FUN_0200CF70
	ldr r1, _02258AEC @ =0x00200010
	movs r0, #1
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	ldr r0, [r5, #0x1c]
	bl FUN_0200CF38
	str r0, [r5, #0x20]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r2, #0x80
	bl FUN_0200CFF4
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	ldr r2, _02258AF0 @ =0x0225CA00
	bl FUN_0200D3F8
	ldr r0, [r5, #0x1c]
	bl FUN_0200CF6C
	movs r2, #0x11
	movs r1, #0
	lsls r2, r2, #0x10
	bl FUN_02009FC8
	bl FUN_0203A880
	ldr r1, _02258AD4 @ =0x000019E0
	movs r0, #0x65
	lsls r0, r0, #2
	ldr r1, [r5, r1]
	adds r0, r5, r0
	bl ov89_0225A46C
	movs r1, #0x16
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov89_02259408
	movs r1, #0x16
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov89_02259734
	adds r0, r5, #0
	bl ov89_02259588
	adds r0, r5, #0
	bl ov89_022597FC
	adds r0, r5, #0
	bl ov89_022598D0
	movs r0, #0x7d
	bl FUN_0201660C
	str r0, [r5, #0x24]
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x7d
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	ldr r0, [r0]
	cmp r0, #0
	beq _02258A4A
	movs r1, #1
	bl FUN_0222A520
_02258A4A:
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, _02258AF4 @ =0x021D116C
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
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B50
	movs r0, #0
	bl FUN_02002B8C
	ldr r0, _02258AF8 @ =ov89_02258FF4
	ldr r2, _02258AFC @ =0x0000EA60
	adds r1, r5, #0
	bl FUN_0200E320
	str r0, [r5, #0x18]
	ldr r0, _02258B00 @ =ov89_0225901C
	adds r1, r5, #0
	bl FUN_0201A0FC
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_02258AC4: .4byte 0xFFFFE0FF
_02258AC8: .4byte 0x04001000
_02258ACC: .4byte 0xFFFF1FFF
_02258AD0: .4byte 0x000019E4
_02258AD4: .4byte 0x000019E0
_02258AD8: .4byte 0x000008D8
_02258ADC: .4byte 0x000019D4
_02258AE0: .4byte 0x000002F2
_02258AE4: .4byte 0x0225CA58
_02258AE8: .4byte 0x0225C9EC
_02258AEC: .4byte 0x00200010
_02258AF0: .4byte 0x0225CA00
_02258AF4: .4byte 0x021D116C
_02258AF8: .4byte ov89_02258FF4
_02258AFC: .4byte 0x0000EA60
_02258B00: .4byte ov89_0225901C
	thumb_func_end ov89_02258800

	thumb_func_start ov89_02258B04
ov89_02258B04: @ 0x02258B04
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r3, [r4]
	adds r1, r4, #0
	ldr r2, _02258E5C @ =0x000009BC
	movs r0, #0x65
	adds r1, #0xcc
	lsls r0, r0, #2
	ldrb r3, [r3, #4]
	ldr r1, [r1]
	ldr r2, [r4, r2]
	adds r0, r4, r0
	bl ov89_0225A4F4
	ldr r0, [r5]
	cmp r0, #0xa
	bls _02258B30
	b _02258E40
_02258B30:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02258B3C: @ jump table
	.2byte _02258B52 - _02258B3C - 2 @ case 0
	.2byte _02258B70 - _02258B3C - 2 @ case 1
	.2byte _02258B88 - _02258B3C - 2 @ case 2
	.2byte _02258C56 - _02258B3C - 2 @ case 3
	.2byte _02258CAC - _02258B3C - 2 @ case 4
	.2byte _02258CF0 - _02258B3C - 2 @ case 5
	.2byte _02258D7A - _02258B3C - 2 @ case 6
	.2byte _02258DD0 - _02258B3C - 2 @ case 7
	.2byte _02258DE6 - _02258B3C - 2 @ case 8
	.2byte _02258E04 - _02258B3C - 2 @ case 9
	.2byte _02258E30 - _02258B3C - 2 @ case 10
_02258B52:
	movs r0, #0x5a
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov89_0225C8DC
	adds r0, r4, #0
	add r1, sp, #0x20
	bl ov89_02259E28
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02258E4A
_02258B70:
	bl FUN_0200FB5C
	cmp r0, #1
	beq _02258B7A
	b _02258E4A
_02258B7A:
	ldr r0, _02258E5C @ =0x000009BC
	movs r1, #1
	str r1, [r4, r0]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02258E4A
_02258B88:
	ldr r0, _02258E60 @ =0x021D114C
	ldrh r1, [r0, #0x24]
	cmp r1, #0
	beq _02258BF4
	ldrh r0, [r0, #0x22]
	cmp r0, #0xa0
	bhs _02258BF4
	ldr r1, _02258E64 @ =0x00000555
	adds r0, r4, #0
	bl ov89_0225A41C
	cmp r0, #1
	bne _02258BF4
	movs r2, #0x92
	lsls r2, r2, #4
	ldrb r1, [r4, r2]
	ldr r7, _02258E60 @ =0x021D114C
	movs r3, #0xc
	adds r6, r1, #0
	muls r6, r3, r6
	adds r1, r2, #0
	ldrh r0, [r7, #0x20]
	adds r6, r4, r6
	subs r1, #0x3f
	strb r0, [r6, r1]
	ldrb r1, [r4, r2]
	ldrh r0, [r7, #0x22]
	adds r6, r1, #0
	muls r6, r3, r6
	adds r1, r2, #0
	adds r6, r4, r6
	subs r1, #0x3e
	strb r0, [r6, r1]
	adds r1, r2, #0
	ldrb r2, [r4, r2]
	subs r1, #0x48
	adds r1, r4, r1
	muls r3, r2, r3
	movs r2, #0x5b
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	adds r0, r4, #0
	adds r1, r1, r3
	bl ov89_02259EC4
	ldr r0, _02258E68 @ =0x000008D8
	adds r2, r4, r0
	adds r0, #0x48
	ldrb r1, [r4, r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r0, r2, r0
	bl ov89_0225C91C
_02258BF4:
	ldr r1, _02258E68 @ =0x000008D8
	adds r0, r4, r1
	adds r1, #0x48
	ldrb r1, [r4, r1]
	bl ov89_0225C84C
	adds r1, r0, #0
	cmp r1, #6
	bge _02258C14
	movs r0, #0x92
	lsls r0, r0, #4
	strb r1, [r4, r0]
	adds r0, r4, #0
	bl ov89_0225A16C
	b _02258E4A
_02258C14:
	ldr r0, [r5]
	cmp r0, #2
	bne _02258D0A
	cmp r1, #0xfe
	bne _02258D0A
	ldr r0, _02258E6C @ =0x000005E5
	bl FUN_0200604C
	movs r0, #8
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r0, [r4, #0xc]
	movs r2, #9
	movs r3, #1
	bl FUN_02003E5C
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, _02258E70 @ =0x00000921
	ldr r0, [r4, #0xc]
	ldrb r2, [r4, r2]
	movs r1, #2
	movs r3, #0x10
	lsls r2, r2, #0x14
	lsrs r2, r2, #0x10
	bl FUN_02003E5C
	movs r0, #3
	str r0, [r5]
	b _02258E4A
_02258C56:
	adds r0, r4, #0
	adds r0, #0xb4
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0xb4
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E998
	adds r2, r4, #0
	adds r2, #0xc4
	ldr r0, [r4, #0x30]
	ldr r2, [r2]
	movs r1, #2
	bl FUN_0200BB6C
	ldr r0, [r4, #4]
	bl FUN_02028EA8
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	adds r2, r4, #0
	adds r0, r4, #0
	str r3, [sp, #8]
	adds r2, #0xc4
	ldr r2, [r2]
	adds r0, #0xb4
	movs r1, #1
	bl FUN_020200A8
	adds r1, r4, #0
	adds r1, #0xc8
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02258E4A
_02258CAC:
	adds r0, r4, #0
	adds r0, #0xc8
	ldrb r0, [r0]
	bl FUN_02020094
	cmp r0, #0
	bne _02258D0A
	ldr r0, [r4, #8]
	movs r1, #0x19
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0x1f
	str r0, [sp, #0x14]
	movs r0, #0xb
	str r0, [sp, #0x18]
	add r0, sp, #0xc
	strb r1, [r0, #0x10]
	movs r1, #6
	strb r1, [r0, #0x11]
	movs r1, #0
	strb r1, [r0, #0x13]
	ldr r0, [r4, #0x24]
	add r1, sp, #0xc
	bl FUN_020166FC
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x28
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02258E4A
_02258CF0:
	ldr r0, [r4, #0xc]
	movs r1, #0
	movs r2, #0xb0
	movs r3, #0x40
	bl FUN_020032A4
	ldr r0, [r4, #0x24]
	bl FUN_020168F4
	cmp r0, #1
	beq _02258D0C
	cmp r0, #2
	beq _02258D36
_02258D0A:
	b _02258E4A
_02258D0C:
	ldr r0, [r4, #0x24]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x28
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xb4
	bl FUN_0200E9BC
	movs r0, #0x5a
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _02258E5C @ =0x000009BC
	movs r1, #3
	str r1, [r4, r0]
	movs r0, #9
	str r0, [r5]
	b _02258E4A
_02258D36:
	ldr r0, [r4, #0x24]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x28
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xb4
	bl FUN_0200E9BC
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0xc]
	movs r2, #9
	movs r3, #1
	bl FUN_02003E5C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, _02258E70 @ =0x00000921
	ldr r0, [r4, #0xc]
	ldrb r2, [r4, r2]
	movs r1, #2
	movs r3, #0x10
	lsls r2, r2, #0x14
	lsrs r2, r2, #0x10
	bl FUN_02003E5C
	movs r0, #2
	str r0, [r5]
	b _02258E4A
_02258D7A:
	adds r0, r4, #0
	adds r0, #0xb4
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0xb4
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E998
	adds r2, r4, #0
	adds r2, #0xc4
	ldr r0, [r4, #0x30]
	ldr r2, [r2]
	movs r1, #3
	bl FUN_0200BB6C
	ldr r0, [r4, #4]
	bl FUN_02028EA8
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	adds r2, r4, #0
	adds r0, r4, #0
	str r3, [sp, #8]
	adds r2, #0xc4
	ldr r2, [r2]
	adds r0, #0xb4
	movs r1, #1
	bl FUN_020200A8
	adds r1, r4, #0
	adds r1, #0xc8
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02258E4A
_02258DD0:
	adds r0, r4, #0
	adds r0, #0xc8
	ldrb r0, [r0]
	bl FUN_02020094
	cmp r0, #0
	bne _02258E4A
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02258E4A
_02258DE6:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x29
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0x5a
	bls _02258E4A
	movs r0, #9
	str r0, [r5]
	b _02258E4A
_02258E04:
	bl FUN_0200FB5C
	cmp r0, #0
	bne _02258E10
	bl FUN_0200FB70
_02258E10:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x7d
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02258E4A
_02258E30:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _02258E4A
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02258E4A
_02258E40:
	bl FUN_0222EEB8
	add sp, #0x2c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02258E4A:
	adds r0, r4, #0
	bl ov89_0225A21C
	adds r0, r4, #0
	bl ov89_0225A398
	ldr r0, _02258E5C @ =0x000009BC
	b _02258E74
	nop
_02258E5C: .4byte 0x000009BC
_02258E60: .4byte 0x021D114C
_02258E64: .4byte 0x00000555
_02258E68: .4byte 0x000008D8
_02258E6C: .4byte 0x000005E5
_02258E70: .4byte 0x00000921
_02258E74:
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02258EEC
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0x1e
	ble _02258E94
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov89_02259F9C
_02258E94:
	bl FUN_0222D844
	cmp r0, #1
	beq _02258EA8
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0222A330
	cmp r0, #1
	bne _02258EEC
_02258EA8:
	ldr r0, [r5]
	cmp r0, #4
	beq _02258EEC
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	bne _02258EBE
	ldr r0, [r4, #0x24]
	bl FUN_020169CC
_02258EBE:
	movs r0, #0x5a
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _02258EF8 @ =0x000009BC
	movs r1, #3
	str r1, [r4, r0]
	bl FUN_0222D844
	cmp r0, #1
	bne _02258EDA
	movs r0, #9
	str r0, [r5]
	b _02258EEC
_02258EDA:
	ldr r0, _02258EFC @ =0x000005F1
	bl FUN_0200604C
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0222A4A8
	movs r0, #6
	str r0, [r5]
_02258EEC:
	adds r0, r4, #0
	bl ov89_0225A468
	movs r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02258EF8: .4byte 0x000009BC
_02258EFC: .4byte 0x000005F1
	thumb_func_end ov89_02258B04

	thumb_func_start ov89_02258F00
ov89_02258F00: @ 0x02258F00
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	bl FUN_0200E390
	adds r0, r4, #0
	bl ov89_022596DC
	adds r0, r4, #0
	bl ov89_022598A8
	ldr r0, [r4, #0x24]
	bl FUN_02016624
	movs r0, #0x65
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov89_0225A47C
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	bl FUN_02026380
	movs r0, #2
	bl FUN_02002DB4
	ldr r0, [r4, #0x10]
	bl FUN_020135AC
	ldr r0, [r4, #0x30]
	bl FUN_0200BB44
	ldr r0, [r4, #0x2c]
	bl FUN_0200BDA0
	adds r0, r4, #0
	bl ov89_02259D50
	ldr r0, [r4, #8]
	bl ov89_02259230
	ldr r0, [r4, #8]
	bl FUN_0201AB0C
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x20]
	bl FUN_0200D998
	ldr r0, [r4, #0x1c]
	bl FUN_0200D108
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_02003150
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02003150
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_02003150
	ldr r0, [r4, #0xc]
	movs r1, #3
	bl FUN_02003150
	ldr r0, [r4, #0xc]
	bl FUN_02003104
	adds r0, r4, #0
	bl ov89_02259C00
	adds r0, r4, #0
	bl ov89_02259BA0
	ldr r0, [r4, #0x14]
	bl ov89_02259E10
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200770C
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200770C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_020205AC
	bl FUN_02021238
	movs r0, #0
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B50
	movs r0, #0
	bl FUN_02002B8C
	bl FUN_0203A914
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x7d
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov89_02258F00

	thumb_func_start ov89_02258FF4
ov89_02258FF4: @ 0x02258FF4
	push {r4, lr}
	movs r0, #0x65
	adds r4, r1, #0
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov89_0225A5EC
	adds r0, r4, #0
	bl ov89_02259C0C
	ldr r0, [r4, #0x20]
	bl FUN_0200D020
	bl FUN_0200D03C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
	pop {r4, pc}
	thumb_func_end ov89_02258FF4

	thumb_func_start ov89_0225901C
ov89_0225901C: @ 0x0225901C
	push {r4, lr}
	ldr r1, _02259050 @ =0x000009BC
	adds r4, r0, #0
	movs r0, #0x65
	lsls r0, r0, #2
	ldr r1, [r4, r1]
	adds r0, r4, r0
	bl ov89_0225A760
	bl FUN_0202061C
	bl FUN_0200D034
	ldr r0, [r4, #0xc]
	bl FUN_0200398C
	ldr r0, [r4, #8]
	bl FUN_0201EEB4
	ldr r3, _02259054 @ =0x027E0000
	ldr r1, _02259058 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_02259050: .4byte 0x000009BC
_02259054: .4byte 0x027E0000
_02259058: .4byte 0x00003FF8
	thumb_func_end ov89_0225901C

	thumb_func_start ov89_0225905C
ov89_0225905C: @ 0x0225905C
	push {r3, r4, r5, lr}
	sub sp, #0xe0
	adds r4, r0, #0
	bl FUN_02022C54
	bl FUN_02022CBC
	ldr r5, _0225921C @ =0x0225CA78
	add r3, sp, #0x10
	movs r2, #5
_02259070:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02259070
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
	ldr r5, _02259220 @ =0x0225C9DC
	add r3, sp, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _02259224 @ =0x0225CC18
	add r3, sp, #0x8c
	movs r2, #0xa
_022590D0:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _022590D0
	ldr r0, [r5]
	movs r1, #1
	str r0, [r3]
	adds r0, r4, #0
	add r2, sp, #0x8c
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r4, #0
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #2
	add r2, sp, #0xa8
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r4, #0
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #3
	add r2, sp, #0xc4
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
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
	ldr r1, _02259228 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	movs r0, #2
	orrs r0, r2
	strh r0, [r1]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r5, _0225922C @ =0x0225CC6C
	add r3, sp, #0x38
	movs r2, #0xa
_0225917C:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0225917C
	ldr r0, [r5]
	movs r1, #5
	str r0, [r3]
	adds r0, r4, #0
	add r2, sp, #0x38
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201CAE0
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
	adds r0, r4, #0
	movs r1, #6
	add r2, sp, #0x54
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r4, #0
	movs r1, #6
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #6
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #7
	add r2, sp, #0x70
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r4, #0
	movs r1, #7
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #7
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x7d
	bl FUN_0201C1C4
	add sp, #0xe0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225921C: .4byte 0x0225CA78
_02259220: .4byte 0x0225C9DC
_02259224: .4byte 0x0225CC18
_02259228: .4byte 0x04000008
_0225922C: .4byte 0x0225CC6C
	thumb_func_end ov89_0225905C

	thumb_func_start ov89_02259230
ov89_02259230: @ 0x02259230
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BB4C
	pop {r4, pc}
	thumb_func_end ov89_02259230

	thumb_func_start ov89_02259264
ov89_02259264: @ 0x02259264
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #0
	movs r0, #7
	str r1, [sp]
	lsls r0, r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0xd2
	movs r2, #0x13
	movs r3, #0x7d
	bl FUN_02003200
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7d
	str r0, [sp, #0xc]
	ldr r2, [r4, #8]
	adds r0, r5, #0
	movs r1, #0x12
	movs r3, #2
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7d
	str r0, [sp, #0xc]
	ldr r2, [r4, #8]
	adds r0, r5, #0
	movs r1, #0x11
	movs r3, #2
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7d
	str r0, [sp, #0xc]
	ldr r2, [r4, #8]
	adds r0, r5, #0
	movs r1, #0x14
	movs r3, #3
	bl FUN_02007B68
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0xd2
	movs r2, #0x17
	movs r3, #0x7d
	bl FUN_02003200
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022592FE
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r1, #1
	ldr r0, [r4, #0xc]
	movs r2, #0x10
	adds r3, r1, #0
	bl FUN_02003318
_022592FE:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7d
	str r0, [sp, #0xc]
	ldr r2, [r4, #8]
	adds r0, r5, #0
	movs r1, #0x16
	movs r3, #6
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7d
	str r0, [sp, #0xc]
	ldr r2, [r4, #8]
	adds r0, r5, #0
	movs r1, #0x15
	movs r3, #6
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7d
	str r0, [sp, #0xc]
	ldr r2, [r4, #8]
	adds r0, r5, #0
	movs r1, #0x18
	movs r3, #7
	bl FUN_02007B68
	ldr r0, [r4, #8]
	movs r1, #6
	bl FUN_0201CC08
	movs r1, #0x27
	lsls r1, r1, #6
	movs r2, #2
	adds r1, r4, r1
	lsls r2, r2, #0xa
	adds r5, r0, #0
	blx FUN_020D47B8
	movs r2, #2
	movs r0, #0
	adds r1, r5, #0
	lsls r2, r2, #0xa
	blx FUN_020D4790
	ldr r0, [r4, #4]
	bl FUN_02028EA8
	bl FUN_0202ADCC
	adds r5, r0, #0
	bl FUN_0200E640
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xe0
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x26
	movs r3, #0x7d
	bl FUN_02003200
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x7d
	str r0, [sp, #4]
	movs r1, #1
	ldr r0, [r4, #8]
	adds r2, r1, #0
	movs r3, #0xe
	bl FUN_0200E644
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xd0
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	movs r2, #7
	movs r3, #0x7d
	bl FUN_02003200
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _022593E2
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xd0
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	movs r2, #7
	movs r3, #0x7d
	bl FUN_02003200
	b _022593FA
_022593E2:
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xd0
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0xd2
	movs r2, #0x19
	movs r3, #0x7d
	bl FUN_02003200
_022593FA:
	ldr r0, [r4, #8]
	movs r1, #6
	bl FUN_0201EFBC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov89_02259264

	thumb_func_start ov89_02259408
ov89_02259408: @ 0x02259408
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r1, #0
	str r6, [sp]
	movs r1, #3
	adds r5, r0, #0
	str r1, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r0, _0225956C @ =0x00002711
	movs r1, #2
	str r0, [sp, #0x14]
	ldr r0, [r5, #0xc]
	ldr r2, [r5, #0x1c]
	ldr r3, [r5, #0x20]
	bl FUN_0200D68C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _02259570 @ =0x00002717
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #4
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _02259574 @ =0x00002712
	adds r2, r6, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #5
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _02259574 @ =0x00002712
	adds r2, r6, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #6
	bl FUN_0200D71C
	movs r4, #0
	adds r7, r4, #0
_02259474:
	str r7, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225956C @ =0x00002711
	adds r2, r6, #0
	adds r0, r4, r0
	str r0, [sp, #8]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #0x10
	bl FUN_0200D504
	adds r4, r4, #1
	cmp r4, #6
	blt _02259474
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225956C @ =0x00002711
	adds r2, r6, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #0xf
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225956C @ =0x00002711
	adds r2, r6, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #0xe
	bl FUN_0200D71C
	str r6, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _02259574 @ =0x00002712
	movs r1, #2
	str r0, [sp, #0x14]
	ldr r0, [r5, #0xc]
	ldr r2, [r5, #0x1c]
	ldr r3, [r5, #0x20]
	bl FUN_0200D68C
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	cmp r1, #0
	bne _022594E6
	movs r3, #0
	b _022594E8
_022594E6:
	ldr r3, _02259578 @ =0x00007FFF
_022594E8:
	lsls r1, r0, #4
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	adds r1, #0x10
	str r0, [sp]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r1, #2
	ldr r0, [r5, #0xc]
	adds r2, r1, #0
	bl FUN_02003D5C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225957C @ =0x00002718
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #2
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _02259580 @ =0x00002713
	adds r2, r6, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #1
	bl FUN_0200D6EC
	movs r3, #0
	ldr r0, _02259580 @ =0x00002713
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	adds r2, r6, #0
	bl FUN_0200D71C
	movs r0, #0xd2
	str r0, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _02259580 @ =0x00002713
	movs r1, #2
	str r0, [sp, #0x14]
	ldr r0, [r5, #0xc]
	ldr r2, [r5, #0x1c]
	ldr r3, [r5, #0x20]
	bl FUN_0200D644
	ldr r1, _02259584 @ =0x00000921
	strb r0, [r5, r1]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225956C: .4byte 0x00002711
_02259570: .4byte 0x00002717
_02259574: .4byte 0x00002712
_02259578: .4byte 0x00007FFF
_0225957C: .4byte 0x00002718
_02259580: .4byte 0x00002713
_02259584: .4byte 0x00000921
	thumb_func_end ov89_02259408

	thumb_func_start ov89_02259588
ov89_02259588: @ 0x02259588
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	ldr r4, _022596B8 @ =0x0225CB08
	adds r7, r0, #0
	add r3, sp, #0x18
	movs r2, #6
_02259594:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02259594
	ldr r0, [r4]
	movs r6, #0
	str r0, [r3]
	movs r4, #0x10
	adds r5, r7, #0
_022595A6:
	add r0, sp, #0x18
	strh r4, [r0]
	movs r1, #0xb0
	strh r1, [r0, #2]
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #0x20]
	add r2, sp, #0x18
	bl FUN_0200D734
	ldr r1, _022596BC @ =0x00000924
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_0200DC4C
	ldr r0, _022596BC @ =0x00000924
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl FUN_0200DC0C
	adds r6, r6, #1
	adds r4, #0x20
	adds r5, r5, #4
	cmp r6, #6
	blt _022595A6
	ldr r4, _022596C0 @ =0x0225CB3C
	add r3, sp, #0x18
	movs r2, #6
_022595E0:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _022595E0
	ldr r0, [r4]
	movs r6, #0
	str r0, [r3]
	movs r4, #0x10
	adds r5, r7, #0
_022595F2:
	add r0, sp, #0x18
	strh r4, [r0]
	movs r1, #0xb0
	strh r1, [r0, #2]
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #0x20]
	add r2, sp, #0x18
	bl FUN_0200D734
	ldr r1, _022596C4 @ =0x0000093C
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_0200DC4C
	ldr r0, _022596C4 @ =0x0000093C
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl FUN_0200DC0C
	adds r6, r6, #1
	adds r4, #0x20
	adds r5, r5, #4
	cmp r6, #6
	blt _022595F2
	ldr r4, _022596C8 @ =0x0225CB70
	add r3, sp, #0x18
	movs r2, #6
_0225962C:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0225962C
	ldr r0, [r4]
	movs r5, #0
	str r0, [r3]
	movs r6, #0x10
	adds r4, r7, #0
_0225963E:
	add r0, sp, #0x18
	strh r6, [r0]
	movs r1, #0xb0
	strh r1, [r0, #2]
	ldr r0, _022596CC @ =0x00002711
	add r2, sp, #0x18
	adds r0, r5, r0
	str r0, [sp, #0x2c]
	ldr r0, [r7, #0x1c]
	ldr r1, [r7, #0x20]
	bl FUN_0200D734
	ldr r1, _022596D0 @ =0x00000954
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl FUN_0200DC0C
	adds r5, r5, #1
	adds r6, #0x20
	adds r4, r4, #4
	cmp r5, #6
	blt _0225963E
	ldr r0, [r7, #0x30]
	movs r1, #1
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r0, _022596D4 @ =0x00010203
	movs r1, #0x67
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _022596D8 @ =0x00002713
	lsls r1, r1, #6
	str r0, [sp, #8]
	movs r0, #0xe0
	str r0, [sp, #0xc]
	movs r0, #0xb0
	str r0, [sp, #0x10]
	movs r0, #1
	str r0, [sp, #0x14]
	adds r0, r7, #0
	adds r1, r7, r1
	adds r2, r4, #0
	movs r3, #2
	bl ov89_0225A260
	movs r0, #0x67
	lsls r0, r0, #6
	ldr r0, [r7, r0]
	movs r1, #1
	bl FUN_020137C0
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_022596B8: .4byte 0x0225CB08
_022596BC: .4byte 0x00000924
_022596C0: .4byte 0x0225CB3C
_022596C4: .4byte 0x0000093C
_022596C8: .4byte 0x0225CB70
_022596CC: .4byte 0x00002711
_022596D0: .4byte 0x00000954
_022596D4: .4byte 0x00010203
_022596D8: .4byte 0x00002713
	thumb_func_end ov89_02259588

	thumb_func_start ov89_022596DC
ov89_022596DC: @ 0x022596DC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, _02259728 @ =0x00000924
	movs r4, #0
	adds r5, r7, #0
_022596E6:
	ldr r0, [r5, r6]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _022596E6
	ldr r6, _0225972C @ =0x0000093C
	movs r5, #0
	adds r4, r7, #0
_022596FA:
	ldr r0, [r4, r6]
	bl FUN_0200D9DC
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #6
	blt _022596FA
	ldr r6, _02259730 @ =0x00000954
	movs r5, #0
	adds r4, r7, #0
_0225970E:
	ldr r0, [r4, r6]
	bl FUN_0200D9DC
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #6
	blt _0225970E
	movs r0, #0x67
	lsls r0, r0, #6
	adds r0, r7, r0
	bl ov89_0225A354
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02259728: .4byte 0x00000924
_0225972C: .4byte 0x0000093C
_02259730: .4byte 0x00000954
	thumb_func_end ov89_022596DC

	thumb_func_start ov89_02259734
ov89_02259734: @ 0x02259734
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r1, #0
	adds r5, r0, #0
	str r6, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	ldr r0, _022597EC @ =0x00002714
	movs r1, #3
	str r0, [sp, #0x14]
	ldr r0, [r5, #0xc]
	ldr r2, [r5, #0x1c]
	ldr r3, [r5, #0x20]
	bl FUN_0200D68C
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _022597F0 @ =0x00002719
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #9
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _022597EC @ =0x00002714
	adds r2, r6, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #8
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _022597EC @ =0x00002714
	adds r2, r6, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #7
	bl FUN_0200D71C
	movs r4, #0
	adds r7, r4, #0
_022597A2:
	str r7, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _022597F4 @ =0x0000271A
	adds r2, r6, #0
	adds r0, r4, r0
	str r0, [sp, #8]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #0xd
	bl FUN_0200D504
	adds r4, r4, #1
	cmp r4, #8
	blt _022597A2
	movs r0, #0
	str r0, [sp]
	ldr r0, _022597F8 @ =0x00002715
	adds r2, r6, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #0xc
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _022597F8 @ =0x00002715
	adds r2, r6, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	movs r3, #0xb
	bl FUN_0200D71C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022597EC: .4byte 0x00002714
_022597F0: .4byte 0x00002719
_022597F4: .4byte 0x0000271A
_022597F8: .4byte 0x00002715
	thumb_func_end ov89_02259734

	thumb_func_start ov89_022597FC
ov89_022597FC: @ 0x022597FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	ldr r2, _02259894 @ =0x0225CAA0
	bl FUN_0200D734
	ldr r1, _02259898 @ =0x0000096C
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	ldr r0, [r0]
	bl FUN_0200DC0C
	ldr r0, _02259898 @ =0x0000096C
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200DCE8
	ldr r4, _0225989C @ =0x0225CAD4
	add r3, sp, #0
	movs r2, #6
_02259828:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02259828
	ldr r0, [r4]
	movs r7, #0x97
	str r0, [r3]
	movs r4, #0
	ldr r6, _022598A0 @ =0x0225CA38
	lsls r7, r7, #4
	b _0225988A
_0225983E:
	ldr r0, _022598A4 @ =0x0000271A
	add r2, sp, #0
	adds r0, r4, r0
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	bl FUN_0200D734
	adds r3, r0, #0
	lsls r2, r4, #2
	movs r0, #0x97
	adds r1, r5, r2
	lsls r0, r0, #4
	str r3, [r1, r0]
	ldr r0, [r1, r0]
	ldrsh r1, [r6, r2]
	adds r3, r6, r2
	movs r2, #2
	ldrsh r2, [r3, r2]
	movs r3, #0x11
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0x97
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	ldr r0, [r0]
	bl FUN_0200DC0C
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, r7]
	movs r1, #0
	bl FUN_0200DCE8
	adds r4, r4, #1
_0225988A:
	cmp r4, #8
	blt _0225983E
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_02259894: .4byte 0x0225CAA0
_02259898: .4byte 0x0000096C
_0225989C: .4byte 0x0225CAD4
_022598A0: .4byte 0x0225CA38
_022598A4: .4byte 0x0000271A
	thumb_func_end ov89_022597FC

	thumb_func_start ov89_022598A8
ov89_022598A8: @ 0x022598A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _022598CC @ =0x0000096C
	ldr r0, [r5, r0]
	bl FUN_0200D9DC
	movs r6, #0x97
	movs r4, #0
	lsls r6, r6, #4
_022598BA:
	ldr r0, [r5, r6]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blt _022598BA
	pop {r4, r5, r6, pc}
	nop
_022598CC: .4byte 0x0000096C
	thumb_func_end ov89_022598A8

	thumb_func_start ov89_022598D0
ov89_022598D0: @ 0x022598D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #0x24]
	ldr r0, [r6, #0xc]
	movs r1, #2
	bl FUN_0200335C
	str r0, [sp, #0x28]
	ldr r0, [r6, #0xc]
	movs r1, #2
	bl FUN_02003364
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x2c]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x28]
	str r6, [sp, #0x20]
	str r6, [sp, #0x1c]
	str r0, [sp, #0x14]
_022598FC:
	ldr r2, _02259A1C @ =0x000008DA
	ldr r0, [sp, #0x20]
	ldrh r0, [r0, r2]
	cmp r0, #0
	beq _0225990C
	ldr r3, _02259A20 @ =0x000001ED
	cmp r0, r3
	bls _02259966
_0225990C:
	ldr r1, _02259A24 @ =0x00000924
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r1, _02259A28 @ =0x0000093C
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r1, _02259A2C @ =0x00000954
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [sp, #0x18]
	ldr r5, _02259A30 @ =_0225C9B0
	lsls r0, r0, #0x18
	movs r4, #0
	lsrs r7, r0, #0x18
_0225993A:
	adds r0, r4, #0
	adds r0, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldrh r2, [r5]
	ldr r0, [r6, #8]
	movs r1, #2
	adds r3, r7, #0
	bl FUN_0201C8C4
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #4
	blt _0225993A
	b _022599DC
_02259966:
	adds r1, r3, #0
	subs r1, #0x89
	ldr r1, [r6, r1]
	adds r4, r2, #6
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r1, _02259A34 @ =0x000019E0
	adds r2, #0x7a
	ldr r1, [r6, r1]
	subs r3, #0x8d
	str r1, [sp, #8]
	ldr r1, [sp, #0x20]
	ldr r3, [r6, r3]
	ldrb r1, [r1, r4]
	ldr r4, [sp, #0x1c]
	ldr r2, [r4, r2]
	bl ov89_02259A3C
	ldr r1, _02259A38 @ =0x000008D8
	ldr r0, [sp, #0x20]
	movs r3, #0xc
	ldrh r2, [r0, r1]
	ldr r0, [sp, #0x14]
	strh r2, [r0, #0x22]
	ldr r0, [sp, #0x20]
	ldrh r1, [r0, r1]
	ldr r0, [sp, #0x10]
	strh r1, [r0, #0x22]
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	adds r0, #0x11
	lsls r1, r0, #1
	ldr r0, [sp, #0x28]
	adds r0, r0, r1
	ldr r1, [sp, #0x2c]
	adds r1, #0x21
	lsls r2, r1, #1
	ldr r1, [sp, #0x28]
	adds r1, r1, r2
	movs r2, #1
	bl FUN_02003DE8
	ldr r0, [sp, #0x14]
	adds r0, #0x42
	ldrh r1, [r0]
	ldr r0, [sp, #0x10]
	adds r0, #0x42
	strh r1, [r0]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _022599DC
	adds r0, r0, #1
	str r0, [sp, #0x24]
	movs r1, #0x92
	ldr r0, [sp, #0x2c]
	lsls r1, r1, #4
	strb r0, [r6, r1]
_022599DC:
	ldr r0, [sp, #0x20]
	adds r0, #0xc
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	adds r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	adds r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	adds r0, r0, #2
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	adds r0, r0, #1
	str r0, [sp, #0x2c]
	cmp r0, #6
	bge _02259A06
	b _022598FC
_02259A06:
	adds r0, r6, #0
	movs r1, #0
	bl ov89_0225A1D8
	ldr r0, [r6, #8]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02259A1C: .4byte 0x000008DA
_02259A20: .4byte 0x000001ED
_02259A24: .4byte 0x00000924
_02259A28: .4byte 0x0000093C
_02259A2C: .4byte 0x00000954
_02259A30: .4byte _0225C9B0
_02259A34: .4byte 0x000019E0
_02259A38: .4byte 0x000008D8
	thumb_func_end ov89_022598D0

	thumb_func_start ov89_02259A3C
ov89_02259A3C: @ 0x02259A3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r2, #0
	adds r5, r3, #0
	cmp r4, #0
	beq _02259A50
	ldr r2, _02259AFC @ =0x000001ED
	cmp r4, r2
	ble _02259A56
_02259A50:
	add sp, #0x10
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02259A56:
	ldr r2, [sp, #0x30]
	bl ov89_0225C88C
	cmp r0, #1
	bne _02259A90
	ldr r0, [sp, #0x28]
	movs r2, #1
	adds r1, r4, #3
	movs r3, #0x7d
	str r2, [sp]
	bl FUN_02007C98
	add r1, sp, #0xc
	str r0, [sp, #8]
	blx FUN_020B70A8
	ldr r0, [sp, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x14]
	lsls r1, r1, #8
	blx FUN_020D2894
	ldr r0, [sp, #0xc]
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	str r0, [sp, #4]
	adds r0, #0x80
	str r0, [sp, #4]
	b _02259ABA
_02259A90:
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0x7d
	bl FUN_02007C98
	add r1, sp, #0xc
	str r0, [sp, #8]
	blx FUN_020B70A8
	ldr r0, [sp, #0xc]
	movs r1, #0x80
	ldr r0, [r0, #0x14]
	blx FUN_020D2894
	ldr r0, [sp, #0xc]
	ldr r4, [r0, #0x14]
	str r4, [sp, #4]
	adds r4, #0x40
_02259ABA:
	ldr r0, [sp, #0x2c]
	cmp r0, #1
	bne _02259AC6
	movs r5, #0x19
	lsls r5, r5, #0x16
	b _02259ACA
_02259AC6:
	movs r5, #0x66
	lsls r5, r5, #0x14
_02259ACA:
	ldr r0, [r6]
	bl FUN_02024B1C
	adds r6, r0, #0
	ldr r0, [sp, #0x2c]
	movs r2, #0x40
	lsls r7, r0, #2
	ldr r1, [r6, r7]
	ldr r0, [sp, #4]
	adds r1, r5, r1
	blx FUN_020D47B8
	ldr r1, [r6, r7]
	adds r5, #0x40
	adds r0, r4, #0
	adds r1, r5, r1
	movs r2, #0x40
	blx FUN_020D47B8
	ldr r0, [sp, #8]
	bl FUN_0201AB0C
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02259AFC: .4byte 0x000001ED
	thumb_func_end ov89_02259A3C

	thumb_func_start ov89_02259B00
ov89_02259B00: @ 0x02259B00
	push {r3, r4, r5, lr}
	sub sp, #0x20
	ldr r3, _02259B90 @ =0x0225C9C0
	adds r5, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x14
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #0x7d
	bl FUN_02023114
	adds r1, r5, #0
	adds r1, #0xcc
	str r0, [r1]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xcc
	ldr r0, [r0]
	movs r1, #0x1f
	str r0, [sp, #8]
	ldr r2, _02259B94 @ =0x0225C9B8
	ldr r3, _02259B98 @ =0x00000FA4
	add r0, sp, #0x14
	lsls r1, r1, #0xe
	bl FUN_02023254
	adds r2, r5, #0
	adds r2, #0xcc
	movs r0, #1
	movs r1, #0xe1
	ldr r2, [r2]
	lsls r0, r0, #0xc
	lsls r1, r1, #0xe
	bl FUN_02023240
	adds r0, r5, #0
	adds r0, #0xcc
	ldr r0, [r0]
	bl FUN_0202313C
	adds r0, r5, #0
	adds r0, #0xcc
	ldr r0, [r0]
	bl FUN_0202360C
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0xcc
	ldr r0, [r0]
	bl FUN_02023614
	adds r1, r0, #0
	add r0, sp, #0xc
	str r0, [sp]
	ldr r2, _02259B9C @ =0x00001555
	adds r0, r4, #0
	add r3, sp, #0x10
	bl FUN_02020E10
	adds r0, r5, #0
	ldr r1, [sp, #0x10]
	adds r0, #0xd0
	str r1, [r0]
	ldr r0, [sp, #0xc]
	adds r5, #0xd4
	str r0, [r5]
	add sp, #0x20
	pop {r3, r4, r5, pc}
	nop
_02259B90: .4byte 0x0225C9C0
_02259B94: .4byte 0x0225C9B8
_02259B98: .4byte 0x00000FA4
_02259B9C: .4byte 0x00001555
	thumb_func_end ov89_02259B00

	thumb_func_start ov89_02259BA0
ov89_02259BA0: @ 0x02259BA0
	ldr r3, _02259BA8 @ =FUN_02023120
	adds r0, #0xcc
	ldr r0, [r0]
	bx r3
	.align 2, 0
_02259BA8: .4byte FUN_02023120
	thumb_func_end ov89_02259BA0

	thumb_func_start ov89_02259BAC
ov89_02259BAC: @ 0x02259BAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _02259BBC
	movs r2, #0x1c
	b _02259BBE
_02259BBC:
	movs r2, #0x1b
_02259BBE:
	adds r0, r4, #0
	adds r0, #0xd8
	movs r3, #0x7d
	bl FUN_02018030
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xe8
	adds r1, #0xd8
	bl FUN_020181B0
	movs r1, #0
	adds r0, r4, #0
	adds r0, #0xe8
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_020182A8
	movs r1, #1
	lsls r1, r1, #0xc
	adds r0, r4, #0
	adds r0, #0xe8
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_020182C4
	adds r4, #0xe8
	adds r0, r4, #0
	movs r1, #1
	bl FUN_020182A0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov89_02259BAC

	thumb_func_start ov89_02259C00
ov89_02259C00: @ 0x02259C00
	ldr r3, _02259C08 @ =FUN_02018068
	adds r0, #0xd8
	bx r3
	nop
_02259C08: .4byte FUN_02018068
	thumb_func_end ov89_02259C00

	thumb_func_start ov89_02259C0C
ov89_02259C0C: @ 0x02259C0C
	push {r4, lr}
	sub sp, #0x40
	adds r4, r0, #0
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
	blx FUN_020CAFEC
	bl FUN_02026E48
	adds r0, r4, #0
	adds r0, #0xcc
	ldr r0, [r0]
	bl FUN_0202313C
	adds r1, r4, #0
	adds r1, #0xcc
	ldr r1, [r1]
	movs r0, #0
	bl FUN_020233D8
	bl FUN_02023154
	movs r0, #0
	ldr r2, _02259CBC @ =0xFFFFF000
	adds r1, r0, #0
	adds r3, r0, #0
	blx FUN_020BF034
	ldr r1, _02259CC0 @ =0x0000739C
	movs r0, #0
	blx FUN_020BF070
	ldr r0, _02259CC4 @ =0x00007FFF
	movs r2, #0
	adds r1, r0, #0
	blx FUN_020BF084
	ldr r0, _02259CC4 @ =0x00007FFF
	movs r2, #0
	adds r1, r0, #0
	blx FUN_020BF0A8
	add r0, sp, #0x28
	blx FUN_020BEFD4
	ldr r1, _02259CC8 @ =0x021DA558
	add r0, sp, #4
	blx FUN_020D4928
	ldr r1, _02259CCC @ =0x021DA51C
	movs r0, #0xa4
	ldr r2, [r1, #0x7c]
	bics r2, r0
	add r0, sp, #0x34
	str r2, [r1, #0x7c]
	blx FUN_020BF004
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	adds r0, r4, #0
	adds r0, #0xe8
	bl FUN_020181EC
	movs r0, #0x65
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov89_0225A5A4
	movs r2, #1
	movs r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	blx FUN_020C2528
	add sp, #0x40
	pop {r4, pc}
	nop
_02259CBC: .4byte 0xFFFFF000
_02259CC0: .4byte 0x0000739C
_02259CC4: .4byte 0x00007FFF
_02259CC8: .4byte 0x021DA558
_02259CCC: .4byte 0x021DA51C
	thumb_func_end ov89_02259C0C

	thumb_func_start ov89_02259CD0
ov89_02259CD0: @ 0x02259CD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r2, #1
	adds r6, r0, #0
	str r2, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x5b
	str r0, [sp, #0x10]
	adds r1, r6, #0
	ldr r0, [r6, #8]
	adds r1, #0xb4
	movs r3, #2
	bl FUN_0201D40C
	adds r0, r6, #0
	adds r0, #0xb4
	movs r1, #0xf
	bl FUN_0201D978
	adds r4, r6, #0
	movs r5, #0
	ldr r7, _02259D4C @ =0x0225C9CC
	adds r4, #0x34
	b _02259D44
_02259D0A:
	lsls r3, r5, #1
	adds r0, r7, r3
	ldrb r0, [r0, #1]
	lsls r1, r5, #4
	movs r2, #5
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrb r3, [r7, r3]
	ldr r0, [r6, #8]
	adds r1, r4, r1
	bl FUN_0201D40C
	lsls r0, r5, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	adds r5, r5, #1
_02259D44:
	cmp r5, #8
	blt _02259D0A
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02259D4C: .4byte 0x0225C9CC
	thumb_func_end ov89_02259CD0

	thumb_func_start ov89_02259D50
ov89_02259D50: @ 0x02259D50
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0xb4
	bl FUN_0201D520
	movs r4, #0
	adds r5, #0x34
_02259D5E:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #8
	blt _02259D5E
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov89_02259D50

	thumb_func_start ov89_02259D70
ov89_02259D70: @ 0x02259D70
	push {r3, lr}
	sub sp, #8
	movs r2, #2
	ldr r1, _02259D88 @ =ov89_02259D8C
	str r2, [sp]
	str r1, [sp, #4]
	movs r1, #0
	adds r3, r1, #0
	bl FUN_02026EB4
	add sp, #8
	pop {r3, pc}
	.align 2, 0
_02259D88: .4byte ov89_02259D8C
	thumb_func_end ov89_02259D70

	thumb_func_start ov89_02259D8C
ov89_02259D8C: @ 0x02259D8C
	push {r3, lr}
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r0, _02259DF8 @ =0x04000008
	movs r1, #3
	ldrh r2, [r0]
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	strh r1, [r0]
	adds r0, #0x58
	ldrh r2, [r0]
	ldr r1, _02259DFC @ =0xFFFFCFFD
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
	ldr r2, _02259E00 @ =0x0000CFFB
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
	ldr r2, _02259E04 @ =0x00007FFF
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r1, _02259E08 @ =0xBFFF0000
	ldr r0, _02259E0C @ =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_02259DF8: .4byte 0x04000008
_02259DFC: .4byte 0xFFFFCFFD
_02259E00: .4byte 0x0000CFFB
_02259E04: .4byte 0x00007FFF
_02259E08: .4byte 0xBFFF0000
_02259E0C: .4byte 0x04000580
	thumb_func_end ov89_02259D8C

	thumb_func_start ov89_02259E10
ov89_02259E10: @ 0x02259E10
	ldr r3, _02259E14 @ =FUN_02026F54
	bx r3
	.align 2, 0
_02259E14: .4byte FUN_02026F54
	thumb_func_end ov89_02259E10

	thumb_func_start ov89_02259E18
ov89_02259E18: @ 0x02259E18
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0222E9E0
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov89_02259E18

	thumb_func_start ov89_02259E28
ov89_02259E28: @ 0x02259E28
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	movs r0, #0x96
	strh r0, [r4, #2]
	movs r0, #0x1f
	strh r0, [r4]
	adds r0, #0xe2
	str r0, [r4, #4]
	movs r0, #0
	strb r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ov89_02259E28

	thumb_func_start ov89_02259E48
ov89_02259E48: @ 0x02259E48
	movs r1, #0x5a
	lsls r1, r1, #2
	adds r0, r0, r1
	bx lr
	thumb_func_end ov89_02259E48

	thumb_func_start ov89_02259E50
ov89_02259E50: @ 0x02259E50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r2, #0
	str r0, [sp]
	adds r4, r1, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x48
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_02074904
	str r0, [sp, #4]
	bl FUN_02074640
	adds r7, r0, #0
	movs r6, #0
	cmp r7, #0
	ble _02259EC0
_02259E78:
	ldr r0, [sp, #4]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #0xae
	movs r2, #0
	adds r4, r0, #0
	bl FUN_0206E540
	movs r1, #0
	strh r0, [r5, #2]
	adds r0, r4, #0
	adds r2, r1, #0
	bl FUN_0206E540
	str r0, [r5, #4]
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r5, #8]
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #0
	ldr r0, [sp]
	bl ov89_0225C830
	strh r0, [r5]
	adds r6, r6, #1
	adds r5, #0xc
	cmp r6, r7
	blt _02259E78
_02259EC0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov89_02259E50

	thumb_func_start ov89_02259EC4
ov89_02259EC4: @ 0x02259EC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r3, #0x59
	adds r4, r0, #0
	lsls r3, r3, #2
	adds r5, r1, #0
	ldr r1, [r4, r3]
	adds r6, r2, #0
	str r1, [sp]
	ldr r1, _02259F8C @ =0x000019E0
	adds r2, r5, #0
	ldr r1, [r4, r1]
	str r1, [sp, #4]
	adds r1, r3, #0
	subs r3, r3, #4
	adds r1, #0x30
	ldr r3, [r4, r3]
	adds r1, r4, r1
	bl ov89_0225A49C
	str r0, [sp, #0xc]
	cmp r0, #1
	bne _02259F84
	adds r0, r6, #0
	bl FUN_0222EC7C
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _02259F7E
	ldr r3, _02259F90 @ =0x0000099C
	lsls r1, r6, #1
	adds r0, r4, r3
	mov ip, r0
	mov r2, ip
	ldrh r0, [r5, #2]
	ldrh r2, [r2, r1]
	cmp r0, r2
	bne _02259F20
	adds r2, r4, r1
	adds r3, #0x10
	ldrh r7, [r5]
	ldrh r2, [r2, r3]
	cmp r7, r2
	beq _02259F7E
_02259F20:
	mov r2, ip
	strh r0, [r2, r1]
	ldrh r2, [r5]
	ldr r0, _02259F94 @ =0x000009AC
	adds r1, r4, r1
	strh r2, [r1, r0]
	subs r0, #0x3c
	movs r3, #0x59
	adds r7, r4, r0
	lsls r0, r6, #2
	str r0, [sp, #0x10]
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	ldr r2, [sp, #0x10]
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _02259F8C @ =0x000019E0
	subs r3, r3, #4
	ldr r0, [r4, r0]
	str r0, [sp, #8]
	ldrh r0, [r5, #2]
	ldrb r1, [r5, #8]
	ldr r2, [r7, r2]
	ldr r3, [r4, r3]
	bl ov89_02259A3C
	ldr r0, [sp, #0x10]
	movs r1, #1
	ldr r0, [r7, r0]
	bl FUN_0200DCE8
	adds r0, r6, #0
	adds r0, #0x21
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, #0x22
	str r0, [sp]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldrh r3, [r5]
	ldr r0, [r4, #0xc]
	movs r1, #1
	movs r2, #2
	bl FUN_02003D5C
_02259F7E:
	ldr r0, _02259F98 @ =0x000005EB
	bl FUN_0200604C
_02259F84:
	ldr r0, [sp, #0xc]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02259F8C: .4byte 0x000019E0
_02259F90: .4byte 0x0000099C
_02259F94: .4byte 0x000009AC
_02259F98: .4byte 0x000005EB
	thumb_func_end ov89_02259EC4

	thumb_func_start ov89_02259F9C
ov89_02259F9C: @ 0x02259F9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x14]
	add r0, sp, #0x24
	bl FUN_0222EC3C
	movs r7, #0
	b _0225A0DC
_02259FB2:
	lsls r3, r7, #2
	movs r0, #0x17
	adds r1, r6, r3
	lsls r0, r0, #4
	ldr r2, [r1, r0]
	ldr r0, [sp, #0x28]
	ldr r1, [r0, r3]
	cmp r2, r1
	bne _02259FC6
	b _0225A0CC
_02259FC6:
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0225A036
	str r1, [sp]
	ldr r3, [r6]
	adds r2, r6, #0
	ldr r0, [r6, #0x30]
	ldr r1, [r6, #0x2c]
	ldr r3, [r3]
	adds r2, #0x34
	bl ov89_0225C724
	ldr r0, [r6, #8]
	movs r1, #6
	bl FUN_0201CC08
	str r0, [sp, #0x10]
	lsls r0, r7, #3
	ldr r1, _0225A130 @ =0x0225CBD8
	str r0, [sp, #0x1c]
	adds r4, r1, r0
	movs r0, #0x27
	lsls r0, r0, #6
	adds r0, r6, r0
	ldrh r5, [r4, #2]
	str r0, [sp, #0x20]
	b _0225A01C
_02259FFE:
	ldrh r0, [r4, #4]
	ldr r1, _0225A130 @ =0x0225CBD8
	lsls r3, r5, #5
	lsls r2, r0, #1
	ldr r0, [sp, #0x1c]
	ldrh r0, [r1, r0]
	ldr r1, [sp, #0x10]
	adds r0, r3, r0
	lsls r3, r0, #1
	ldr r0, [sp, #0x20]
	adds r1, r1, r3
	adds r0, r0, r3
	blx FUN_020D47B8
	adds r5, r5, #1
_0225A01C:
	ldrh r1, [r4, #2]
	ldrh r0, [r4, #6]
	adds r0, r1, r0
	cmp r5, r0
	blt _02259FFE
	ldr r0, [r6, #8]
	movs r1, #6
	bl FUN_0201EFBC
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	b _0225A09C
_0225A036:
	adds r0, r6, #0
	adds r0, #0x34
	adds r1, r7, #0
	bl ov89_0225C818
	lsls r0, r7, #1
	ldr r2, _0225A134 @ =0x0000099C
	adds r3, r6, r0
	movs r1, #0
	adds r0, r2, #0
	strh r1, [r3, r2]
	adds r0, #0x10
	strh r1, [r3, r0]
	lsls r0, r7, #2
	adds r0, r6, r0
	subs r2, #0x2c
	ldr r0, [r0, r2]
	bl FUN_0200DCE8
	ldr r3, _0225A130 @ =0x0225CBD8
	lsls r4, r7, #3
	adds r0, r3, r4
	ldrh r1, [r0, #2]
	movs r2, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	ldrh r1, [r0, #4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	ldrh r0, [r0, #6]
	movs r1, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldrh r3, [r3, r4]
	ldr r0, [r6, #8]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	ldr r0, [r6, #8]
	movs r1, #6
	bl FUN_0201EFBC
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	str r0, [sp, #0x14]
_0225A09C:
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	ldr r0, [sp, #0x28]
	lsls r2, r7, #2
	ldr r0, [r0, r2]
	cmp r1, r0
	bne _0225A0CC
	ldr r3, _0225A138 @ =0x0225CA18
	ldr r0, _0225A13C @ =0x0000096C
	ldrsh r1, [r3, r2]
	adds r3, r3, r2
	movs r2, #2
	ldrsh r2, [r3, r2]
	movs r3, #0x11
	ldr r0, [r6, r0]
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	ldr r0, _0225A13C @ =0x0000096C
	movs r1, #1
	ldr r0, [r6, r0]
	bl FUN_0200DCE8
_0225A0CC:
	ldr r1, [sp, #0x28]
	lsls r0, r7, #2
	ldr r2, [r1, r0]
	adds r1, r6, r0
	movs r0, #0x17
	lsls r0, r0, #4
	str r2, [r1, r0]
	adds r7, r7, #1
_0225A0DC:
	cmp r7, #8
	bge _0225A0E2
	b _02259FB2
_0225A0E2:
	movs r0, #0
	movs r1, #0x17
	adds r7, r0, #0
	lsls r1, r1, #4
	subs r2, r0, #1
	b _0225A0FC
_0225A0EE:
	lsls r3, r7, #2
	adds r3, r6, r3
	ldr r3, [r3, r1]
	cmp r3, r2
	beq _0225A0FA
	adds r0, r0, #1
_0225A0FA:
	adds r7, r7, #1
_0225A0FC:
	cmp r7, #8
	blt _0225A0EE
	ldr r1, _0225A140 @ =0x000008D3
	strb r0, [r6, r1]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ble _0225A116
	ldr r0, _0225A144 @ =0x000005E4
	bl FUN_0200604C
	add sp, #0x2c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0225A116:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	ble _0225A128
	ldr r0, _0225A144 @ =0x000005E4
	bl FUN_0200604C
	add sp, #0x2c
	movs r0, #2
	pop {r4, r5, r6, r7, pc}
_0225A128:
	movs r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_0225A130: .4byte 0x0225CBD8
_0225A134: .4byte 0x0000099C
_0225A138: .4byte 0x0225CA18
_0225A13C: .4byte 0x0000096C
_0225A140: .4byte 0x000008D3
_0225A144: .4byte 0x000005E4
	thumb_func_end ov89_02259F9C

	thumb_func_start ov89_0225A148
ov89_0225A148: @ 0x0225A148
	push {r3, lr}
	adds r3, r0, #0
	str r1, [sp]
	adds r2, r3, #0
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x2c]
	ldr r3, [r3]
	adds r2, #0x34
	ldr r3, [r3]
	bl ov89_0225C724
	pop {r3, pc}
	thumb_func_end ov89_0225A148

	thumb_func_start ov89_0225A160
ov89_0225A160: @ 0x0225A160
	ldr r3, _0225A168 @ =ov89_0225C818
	adds r0, #0x34
	bx r3
	nop
_0225A168: .4byte ov89_0225C818
	thumb_func_end ov89_0225A160

	thumb_func_start ov89_0225A16C
ov89_0225A16C: @ 0x0225A16C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	ldr r4, _0225A1D0 @ =0x0225CBA4
	adds r5, r0, #0
	adds r6, r1, #0
	add r3, sp, #0
	movs r2, #6
_0225A17A:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0225A17A
	ldr r0, [r4]
	movs r4, #0
	str r0, [r3]
	movs r0, #0x99
	adds r2, r5, #0
	lsls r0, r0, #4
_0225A18E:
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _0225A1B6
	lsls r1, r6, #5
	adds r1, #0x10
	add r0, sp, #0
	strh r1, [r0]
	movs r1, #0xb0
	strh r1, [r0, #2]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	add r2, sp, #0
	bl FUN_0200D734
	lsls r1, r4, #2
	adds r2, r5, r1
	movs r1, #0x99
	lsls r1, r1, #4
	str r0, [r2, r1]
	b _0225A1BE
_0225A1B6:
	adds r4, r4, #1
	adds r2, r2, #4
	cmp r4, #3
	blt _0225A18E
_0225A1BE:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov89_0225A1D8
	ldr r0, _0225A1D4 @ =0x000005E5
	bl FUN_0200604C
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0225A1D0: .4byte 0x0225CBA4
_0225A1D4: .4byte 0x000005E5
	thumb_func_end ov89_0225A16C

	thumb_func_start ov89_0225A1D8
ov89_0225A1D8: @ 0x0225A1D8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r4, r1, #0
	movs r1, #2
	bl FUN_0200335C
	adds r6, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #2
	bl FUN_02003364
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	adds r0, #0x22
	adds r1, #0x22
	movs r2, #0xc
	blx FUN_020D47B8
	adds r4, #0x11
	movs r0, #0
	lsls r1, r4, #1
	str r0, [sp]
	adds r0, r6, r1
	adds r1, r5, r1
	movs r2, #1
	movs r3, #6
	bl FUN_02003DE8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov89_0225A1D8

	thumb_func_start ov89_0225A21C
ov89_0225A21C: @ 0x0225A21C
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	movs r7, #0x99
	adds r5, r0, #0
	adds r6, r4, #0
	lsls r7, r7, #4
_0225A228:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0225A254
	bl FUN_0200DCA0
	cmp r0, #0
	bne _0225A248
	movs r0, #0x99
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200D9DC
	movs r0, #0x99
	lsls r0, r0, #4
	str r6, [r5, r0]
	b _0225A254
_0225A248:
	movs r0, #0x99
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl FUN_0200DC0C
_0225A254:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _0225A228
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov89_0225A21C

	thumb_func_start ov89_0225A260
ov89_0225A260: @ 0x0225A260
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x78
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	ldr r4, [sp, #0x9c]
	cmp r0, #0
	beq _0225A278
	bl GF_AssertFail
_0225A278:
	ldr r0, [r6, #8]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	add r2, sp, #0x28
	add r3, sp, #0x24
	ldr r7, [r6, #0x20]
	bl ov89_0225A368
	add r0, sp, #0x38
	bl FUN_0201D3C4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x24]
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x18
	add r1, sp, #0x38
	lsrs r2, r2, #0x18
	movs r3, #2
	bl FUN_0201D494
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r2, [sp, #0x18]
	add r0, sp, #0x38
	str r3, [sp, #0x14]
	bl FUN_02020150
	add r0, sp, #0x38
	movs r1, #1
	movs r2, #0x7d
	bl FUN_02013688
	movs r1, #1
	adds r2, r1, #0
	add r3, sp, #0x2c
	bl FUN_02021AC8
	ldr r0, [sp, #0xa4]
	cmp r0, #1
	bne _0225A2E6
	ldr r1, [sp, #0x28]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	subs r4, r4, r0
_0225A2E6:
	ldr r0, [r6, #0x10]
	str r0, [sp, #0x48]
	add r0, sp, #0x38
	str r0, [sp, #0x4c]
	adds r0, r7, #0
	bl FUN_0200E2B0
	str r0, [sp, #0x50]
	ldr r1, [sp, #0x98]
	adds r0, r7, #0
	bl FUN_0200D934
	movs r1, #0
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x30]
	str r1, [sp, #0x58]
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0xa0]
	str r4, [sp, #0x60]
	subs r0, #8
	str r0, [sp, #0x64]
	movs r0, #0x33
	str r0, [sp, #0x6c]
	movs r0, #1
	str r0, [sp, #0x70]
	movs r0, #0x7d
	str r0, [sp, #0x74]
	add r0, sp, #0x48
	str r1, [sp, #0x68]
	bl FUN_020135D8
	ldr r1, [sp, #0x94]
	adds r6, r0, #0
	bl FUN_020138E0
	ldr r2, [sp, #0xa0]
	adds r0, r6, #0
	adds r1, r4, #0
	subs r2, #8
	bl FUN_020136B4
	add r0, sp, #0x38
	bl FUN_0201D520
	str r6, [r5]
	add r3, sp, #0x2c
	ldm r3!, {r0, r1}
	adds r2, r5, #4
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #0x28]
	strh r0, [r5, #0x10]
	add sp, #0x78
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov89_0225A260

	thumb_func_start ov89_0225A354
ov89_0225A354: @ 0x0225A354
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_02013660
	adds r0, r4, #4
	bl FUN_02021B5C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov89_0225A354

	thumb_func_start ov89_0225A368
ov89_0225A368: @ 0x0225A368
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r2, #0
	adds r0, r1, #0
	adds r1, r4, #0
	movs r2, #0
	adds r7, r3, #0
	bl FUN_02002F30
	adds r4, r0, #0
	asrs r1, r4, #2
	lsrs r1, r1, #0x1d
	adds r1, r4, r1
	asrs r5, r1, #3
	movs r1, #8
	blx FUN_020CCD3C
	cmp r0, #0
	beq _0225A390
	adds r5, r5, #1
_0225A390:
	str r4, [r6]
	str r5, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov89_0225A368

	thumb_func_start ov89_0225A398
ov89_0225A398: @ 0x0225A398
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0225A410 @ =0x000019D4
	adds r5, r0, #0
	adds r0, r1, #4
	ldr r2, [r5, r1]
	ldr r0, [r5, r0]
	cmp r2, r0
	bne _0225A3C2
	adds r2, #0x88
	str r2, [r5, r1]
	movs r0, #2
	ldr r2, [r5, r1]
	lsls r0, r0, #0xc
	cmp r2, r0
	ble _0225A3B8
	str r0, [r5, r1]
_0225A3B8:
	ldr r0, _0225A410 @ =0x000019D4
	ldr r1, [r5, r0]
	adds r0, r0, #4
	str r1, [r5, r0]
	b _0225A3DE
_0225A3C2:
	adds r0, r1, #4
	ldr r2, [r5, r0]
	adds r0, r1, #0
	adds r0, #8
	ldr r0, [r5, r0]
	subs r2, r2, r0
	adds r0, r1, #4
	str r2, [r5, r0]
	ldr r2, [r5, r1]
	ldr r0, [r5, r0]
	cmp r0, r2
	bge _0225A3DE
	adds r0, r1, #4
	str r2, [r5, r0]
_0225A3DE:
	ldr r0, _0225A414 @ =0x000019D8
	movs r6, #0
	ldr r0, [r5, r0]
	movs r4, #0x10
	asrs r1, r0, #8
	movs r0, #0x20
	subs r0, r0, r1
	adds r0, #0xb0
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
_0225A3F2:
	ldr r0, _0225A418 @ =0x00000924
	lsls r1, r4, #0x10
	movs r3, #0x11
	ldr r0, [r5, r0]
	asrs r1, r1, #0x10
	adds r2, r7, #0
	lsls r3, r3, #0x10
	bl FUN_0200DDF4
	adds r6, r6, #1
	adds r4, #0x20
	adds r5, r5, #4
	cmp r6, #6
	blt _0225A3F2
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225A410: .4byte 0x000019D4
_0225A414: .4byte 0x000019D8
_0225A418: .4byte 0x00000924
	thumb_func_end ov89_0225A398

	thumb_func_start ov89_0225A41C
ov89_0225A41C: @ 0x0225A41C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0225A464 @ =0x000019D4
	adds r4, r1, #0
	ldr r1, [r5, r0]
	cmp r1, r4
	bge _0225A42E
	movs r0, #0
	pop {r3, r4, r5, pc}
_0225A42E:
	adds r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, r1
	bge _0225A442
	bl GF_AssertFail
	ldr r0, _0225A464 @ =0x000019D4
	ldr r1, [r5, r0]
	adds r0, r0, #4
	str r1, [r5, r0]
_0225A442:
	ldr r1, _0225A464 @ =0x000019D4
	ldr r0, [r5, r1]
	subs r0, r0, r4
	str r0, [r5, r1]
	adds r0, r1, #4
	ldr r2, [r5, r0]
	ldr r0, [r5, r1]
	adds r1, #8
	subs r2, r2, r0
	asrs r0, r2, #1
	lsrs r0, r0, #0x1e
	adds r0, r2, r0
	asrs r0, r0, #2
	str r0, [r5, r1]
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0225A464: .4byte 0x000019D4
	thumb_func_end ov89_0225A41C

	thumb_func_start ov89_0225A468
ov89_0225A468: @ 0x0225A468
	bx lr
	.align 2, 0
	thumb_func_end ov89_0225A468

	thumb_func_start ov89_0225A46C
ov89_0225A46C: @ 0x0225A46C
	ldr r3, _0225A474 @ =FUN_020D4994
	movs r1, #0
	ldr r2, _0225A478 @ =0x00000744
	bx r3
	.align 2, 0
_0225A474: .4byte FUN_020D4994
_0225A478: .4byte 0x00000744
	thumb_func_end ov89_0225A46C

	thumb_func_start ov89_0225A47C
ov89_0225A47C: @ 0x0225A47C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0225A482:
	adds r0, r5, #0
	adds r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	beq _0225A490
	bl ov89_0225AC10
_0225A490:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x80
	blt _0225A482
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov89_0225A47C

	thumb_func_start ov89_0225A49C
ov89_0225A49C: @ 0x0225A49C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _0225A4F0 @ =0x0000073C
	ldrb r4, [r1, r4]
	cmp r4, #0
	beq _0225A4AE
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_0225A4AE:
	movs r4, #0
	adds r5, r1, #0
_0225A4B2:
	adds r6, r5, #0
	adds r6, #0xb4
	ldr r6, [r6]
	cmp r6, #0
	bne _0225A4E2
	ldr r6, [sp, #0x18]
	adds r5, r1, #0
	str r6, [sp]
	ldr r6, [sp, #0x1c]
	adds r5, #0xb4
	lsls r4, r4, #2
	str r6, [sp, #4]
	bl ov89_0225A7BC
	str r0, [r5, r4]
	ldr r0, [r5, r4]
	cmp r0, #0
	beq _0225A4DC
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225A4DC:
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_0225A4E2:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x80
	blt _0225A4B2
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225A4F0: .4byte 0x0000073C
	thumb_func_end ov89_0225A49C

	thumb_func_start ov89_0225A4F4
ov89_0225A4F4: @ 0x0225A4F4
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	ldr r1, _0225A590 @ =0x0000073D
	adds r7, r0, #0
	ldrb r1, [r7, r1]
	cmp r1, #0
	beq _0225A50A
	adds r1, r7, #0
	adds r1, #0xb0
	bl ov89_0225BE84
_0225A50A:
	ldr r0, _0225A594 @ =0x0000073C
	ldrb r3, [r7, r0]
	cmp r3, #0
	beq _0225A52A
	adds r2, r4, #0
	lsls r4, r3, #2
	ldr r3, _0225A598 @ =0x0225CD10
	adds r0, r7, #0
	ldr r3, [r3, r4]
	adds r1, r7, #0
	blx r3
	cmp r0, #1
	bne _0225A52A
	ldr r0, _0225A594 @ =0x0000073C
	movs r1, #0
	strb r1, [r7, r0]
_0225A52A:
	movs r4, #0
	adds r6, r7, #0
_0225A52E:
	adds r0, r6, #0
	adds r0, #0xb4
	ldr r5, [r0]
	cmp r5, #0
	beq _0225A586
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x18
	bne _0225A560
	lsls r0, r0, #8
	lsrs r1, r0, #0x18
	beq _0225A560
	movs r0, #9
	lsls r0, r0, #6
	ldr r2, [r5, r0]
	ldr r0, _0225A59C @ =0xFFFF00FF
	lsls r1, r1, #0x18
	ands r0, r2
	lsrs r1, r1, #0x10
	orrs r1, r0
	movs r0, #9
	lsls r0, r0, #6
	str r1, [r5, r0]
_0225A560:
	movs r2, #9
	lsls r2, r2, #6
	ldr r2, [r5, r2]
	movs r3, #0xc
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x18
	muls r3, r2, r3
	ldr r2, _0225A5A0 @ =0x0225CDB0
	adds r0, r7, #0
	ldr r2, [r2, r3]
	adds r1, r5, #0
	blx r2
	cmp r0, #1
	bne _0225A586
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl ov89_0225AC24
_0225A586:
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #0x80
	blt _0225A52E
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225A590: .4byte 0x0000073D
_0225A594: .4byte 0x0000073C
_0225A598: .4byte 0x0225CD10
_0225A59C: .4byte 0xFFFF00FF
_0225A5A0: .4byte 0x0225CDB0
	thumb_func_end ov89_0225A4F4

	thumb_func_start ov89_0225A5A4
ov89_0225A5A4: @ 0x0225A5A4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _0225A5E8 @ =0x0225CDB0
	movs r4, #0
	adds r5, r6, #0
_0225A5AE:
	adds r0, r5, #0
	adds r0, #0xb4
	ldr r1, [r0]
	cmp r1, #0
	beq _0225A5DC
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x18
	movs r0, #0xc
	muls r0, r2, r0
	adds r0, r7, r0
	ldr r2, [r0, #4]
	cmp r2, #0
	beq _0225A5D4
	adds r0, r6, #0
	blx r2
	b _0225A5DC
_0225A5D4:
	adds r1, #0x1c
	adds r0, r1, #0
	bl FUN_020181EC
_0225A5DC:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x80
	blt _0225A5AE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225A5E8: .4byte 0x0225CDB0
	thumb_func_end ov89_0225A5A4

	thumb_func_start ov89_0225A5EC
ov89_0225A5EC: @ 0x0225A5EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	movs r0, #0
	movs r6, #9
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	adds r1, r0, #0
	adds r2, r7, #0
	adds r3, r7, #0
	lsls r6, r6, #6
_0225A602:
	adds r0, r2, #0
	adds r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	beq _0225A63A
	ldr r4, [r0, r6]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x18
	beq _0225A624
	movs r4, #0xad
	lsls r4, r4, #2
	str r0, [r3, r4]
	ldr r0, [sp, #0x10]
	adds r3, r3, #4
	adds r0, r0, #1
	str r0, [sp, #0x10]
	b _0225A63A
_0225A624:
	ldr r4, [sp, #0xc]
	movs r5, #0x7f
	subs r4, r5, r4
	lsls r4, r4, #2
	adds r5, r7, r4
	movs r4, #0xad
	lsls r4, r4, #2
	str r0, [r5, r4]
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
_0225A63A:
	adds r1, r1, #1
	adds r2, r2, #4
	cmp r1, #0x80
	blt _0225A602
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _0225A6F6
_0225A64C:
	ldr r0, [sp, #4]
	movs r1, #0x7f
	subs r0, r1, r0
	lsls r0, r0, #2
	adds r1, r7, r0
	movs r0, #0xad
	lsls r0, r0, #2
	ldr r4, [r1, r0]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ble _0225A6EA
	adds r5, r7, #0
_0225A668:
	movs r0, #0xad
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r3, #9
	str r0, [sp]
	ldr r1, [sp]
	lsls r3, r3, #6
	adds r6, r1, #0
	ldr r3, [r6, r3]
	movs r6, #0xc
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x18
	muls r6, r3, r6
	ldr r3, _0225A754 @ =0x0225CDB0
	adds r0, r7, #0
	adds r3, r3, r6
	ldr r3, [r3, #8]
	adds r2, r4, #0
	blx r3
	cmp r0, #1
	bne _0225A6DC
	movs r1, #9
	ldr r2, [sp]
	lsls r1, r1, #6
	ldr r1, [r2, r1]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x18
	bl ov89_0225AFC0
	cmp r0, #1
	bne _0225A6DC
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _0225A6DC
	movs r1, #9
	lsls r1, r1, #6
	ldr r2, [r4, r1]
	ldr r0, _0225A758 @ =0x00FFFFFF
	ands r0, r2
	ldr r2, [sp]
	ldr r2, [r2, r1]
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x18
	orrs r0, r2
	str r0, [r4, r1]
	ldr r2, [sp]
	adds r0, r7, #0
	ldr r2, [r2, r1]
	lsrs r1, r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x18
	bl ov89_0225AF10
	b _0225A6EA
_0225A6DC:
	ldr r0, [sp, #8]
	adds r5, r5, #4
	adds r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #8]
	cmp r1, r0
	blt _0225A668
_0225A6EA:
	ldr r0, [sp, #4]
	adds r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp, #4]
	cmp r1, r0
	blt _0225A64C
_0225A6F6:
	ldr r0, _0225A75C @ =0x0000073D
	ldrb r1, [r7, r0]
	cmp r1, #0
	beq _0225A750
	adds r0, r0, #1
	ldrb r0, [r7, r0]
	cmp r0, #1
	bne _0225A750
	movs r5, #0
	adds r6, r7, #0
_0225A70A:
	adds r0, r6, #0
	adds r0, #0xb4
	ldr r4, [r0]
	cmp r4, #0
	beq _0225A742
	ldr r0, _0225A75C @ =0x0000073D
	ldrb r1, [r7, r0]
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	lsls r2, r0, #0x10
	lsrs r2, r2, #0x18
	cmp r2, r1
	beq _0225A742
	lsls r0, r0, #8
	lsrs r0, r0, #0x18
	cmp r0, r1
	beq _0225A742
	adds r0, r4, #0
	bl ov89_0225AFC0
	cmp r0, #0
	bne _0225A742
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl ov89_0225AC24
_0225A742:
	adds r5, r5, #1
	adds r6, r6, #4
	cmp r5, #0x80
	blt _0225A70A
	adds r0, r7, #0
	bl ov89_0225AF9C
_0225A750:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225A754: .4byte 0x0225CDB0
_0225A758: .4byte 0x00FFFFFF
_0225A75C: .4byte 0x0000073D
	thumb_func_end ov89_0225A5EC

	thumb_func_start ov89_0225A760
ov89_0225A760: @ 0x0225A760
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _0225A7B8 @ =0x000004B4
	movs r4, #0
	str r1, [sp]
	adds r5, r6, r0
	adds r7, r4, #0
_0225A76E:
	ldr r0, [r5]
	cmp r0, #0
	beq _0225A78C
	ldr r1, [r0, #4]
	blx FUN_020D2894
	ldr r0, [r5]
	movs r1, #1
	blx FUN_020BE418
	ldr r0, [r5]
	movs r1, #1
	blx FUN_020BE538
	str r7, [r5]
_0225A78C:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x20
	blt _0225A76E
	movs r1, #0x1d
	lsls r1, r1, #6
	ldrb r0, [r6, r1]
	cmp r0, #0
	beq _0225A7B6
	ldr r0, [sp]
	cmp r0, #3
	beq _0225A7B6
	adds r1, r1, #2
	ldrsh r1, [r6, r1]
	movs r0, #0
	bl FUN_0200FCFC
	movs r0, #0x1d
	movs r1, #0
	lsls r0, r0, #6
	strb r1, [r6, r0]
_0225A7B6:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225A7B8: .4byte 0x000004B4
	thumb_func_end ov89_0225A760

	thumb_func_start ov89_0225A7BC
ov89_0225A7BC: @ 0x0225A7BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #8]
	movs r1, #0x91
	adds r7, r0, #0
	movs r0, #0x7d
	lsls r1, r1, #2
	adds r5, r2, #0
	str r3, [sp, #0xc]
	bl FUN_0201AA8C
	movs r2, #0x91
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	movs r2, #9
	lsls r2, r2, #6
	ldr r1, [r4, r2]
	ldr r0, _0225A874 @ =0x00FFFFFF
	adds r6, r5, #0
	ands r1, r0
	lsls r0, r0, #0x18
	orrs r0, r1
	str r0, [r4, r2]
	ldm r6!, {r0, r1}
	adds r3, r4, #0
	stm r3!, {r0, r1}
	ldr r0, [r6]
	subs r2, #0x53
	str r0, [r3]
	ldrh r0, [r4, #2]
	cmp r0, r2
	bls _0225A80A
	bl GF_AssertFail
	movs r0, #0x84
	strh r0, [r4, #2]
_0225A80A:
	ldr r0, [sp, #0x34]
	str r4, [sp]
	str r0, [sp, #4]
	adds r1, r4, #0
	ldr r0, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x30]
	adds r1, #0xc
	bl ov89_0225A878
	cmp r0, #0
	bne _0225A828
	add sp, #0x18
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225A828:
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x1c
	adds r1, #0xc
	bl FUN_020181B0
	add r0, sp, #0x10
	str r0, [sp]
	ldrb r1, [r5, #9]
	ldrb r2, [r5, #0xa]
	adds r0, r7, #0
	add r3, sp, #0x14
	bl ov89_0225AC68
	adds r0, r4, #0
	movs r3, #1
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	adds r0, #0x1c
	lsls r3, r3, #0x10
	bl FUN_020182A8
	movs r1, #1
	lsls r1, r1, #0xc
	adds r0, r4, #0
	adds r0, #0x1c
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_020182C4
	adds r0, r4, #0
	adds r0, #0x1c
	movs r1, #0
	bl FUN_020182A0
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225A874: .4byte 0x00FFFFFF
	thumb_func_end ov89_0225A7BC

	thumb_func_start ov89_0225A878
ov89_0225A878: @ 0x0225A878
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r2, #0
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r3, #0
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0x1d
	movs r3, #0x7d
	str r2, [sp]
	bl FUN_02007C98
	str r0, [r5]
	cmp r0, #0
	bne _0225A89C
	bl GF_AssertFail
_0225A89C:
	ldr r0, [r5]
	blx FUN_020C3B40
	str r0, [r5, #4]
	cmp r0, #0
	beq _0225A8C8
	adds r1, r0, #0
	adds r1, #8
	beq _0225A8BC
	ldrb r2, [r0, #9]
	cmp r2, #0
	bls _0225A8BC
	ldrh r2, [r0, #0xe]
	adds r1, r1, r2
	adds r1, r1, #4
	b _0225A8BE
_0225A8BC:
	movs r1, #0
_0225A8BE:
	cmp r1, #0
	beq _0225A8C8
	ldr r1, [r1]
	adds r0, r0, r1
	b _0225A8CA
_0225A8C8:
	movs r0, #0
_0225A8CA:
	str r0, [r5, #8]
	ldr r0, [r5]
	blx FUN_020C3B50
	str r0, [r5, #0xc]
	cmp r0, #0
	beq _0225A94A
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov89_0225AA24
	ldr r0, [r5, #0xc]
	bl ov89_0225A9B4
	adds r4, r0, #0
	beq _0225A8FC
	ldr r1, [r5, #0xc]
	adds r0, r7, #0
	bl ov89_0225A958
	cmp r0, #0
	bne _0225A942
_0225A8FC:
	cmp r4, #1
	bne _0225A926
	ldr r0, [r5, #0xc]
	add r1, sp, #8
	add r2, sp, #4
	blx FUN_020BE4D0
	ldr r1, _0225A950 @ =0x02110928
	ldr r0, [sp, #8]
	ldr r1, [r1]
	blx r1
	ldr r1, _0225A950 @ =0x02110928
	ldr r0, [sp, #4]
	ldr r1, [r1]
	blx r1
	ldr r0, [r5, #0xc]
	blx FUN_020BE588
	ldr r1, _0225A954 @ =0x02110930
	ldr r1, [r1]
	blx r1
_0225A926:
	ldr r0, [r5]
	cmp r0, #0
	beq _0225A930
	bl FUN_0201AB0C
_0225A930:
	movs r1, #0x10
	movs r0, #0
_0225A934:
	strb r0, [r5]
	adds r5, r5, #1
	subs r1, r1, #1
	bne _0225A934
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0225A942:
	ldr r0, [r5]
	ldr r1, [r5, #0xc]
	bl FUN_0201F64C
_0225A94A:
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225A950: .4byte 0x02110928
_0225A954: .4byte 0x02110930
	thumb_func_end ov89_0225A878

	thumb_func_start ov89_0225A958
ov89_0225A958: @ 0x0225A958
	push {r4, r5}
	ldr r2, _0225A984 @ =0x000004B4
	movs r4, #0
	adds r5, r0, #0
_0225A960:
	ldr r3, [r5, r2]
	cmp r3, #0
	bne _0225A974
	lsls r2, r4, #2
	adds r2, r0, r2
	ldr r0, _0225A984 @ =0x000004B4
	str r1, [r2, r0]
	movs r0, #1
	pop {r4, r5}
	bx lr
_0225A974:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x20
	blt _0225A960
	movs r0, #0
	pop {r4, r5}
	bx lr
	nop
_0225A984: .4byte 0x000004B4
	thumb_func_end ov89_0225A958

	thumb_func_start ov89_0225A988
ov89_0225A988: @ 0x0225A988
	push {r4, r5}
	ldr r2, _0225A9B0 @ =0x000004B4
	movs r4, #0
	adds r5, r0, #0
_0225A990:
	ldr r3, [r5, r2]
	cmp r3, r1
	bne _0225A9A4
	lsls r1, r4, #2
	adds r1, r0, r1
	ldr r0, _0225A9B0 @ =0x000004B4
	movs r2, #0
	str r2, [r1, r0]
	pop {r4, r5}
	bx lr
_0225A9A4:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x20
	blt _0225A990
	pop {r4, r5}
	bx lr
	.align 2, 0
_0225A9B0: .4byte 0x000004B4
	thumb_func_end ov89_0225A988

	thumb_func_start ov89_0225A9B4
ov89_0225A9B4: @ 0x0225A9B4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0
	str r1, [r5, #8]
	blx FUN_020BE3DC
	adds r4, r0, #0
	adds r0, r5, #0
	blx FUN_020BE51C
	ldr r3, _0225AA18 @ =0x02110924
	movs r1, #0
	adds r6, r0, #0
	ldr r3, [r3]
	adds r0, r4, #0
	adds r2, r1, #0
	blx r3
	adds r4, r0, #0
	bne _0225A9DE
	movs r0, #0
	pop {r4, r5, r6, pc}
_0225A9DE:
	ldr r3, _0225AA1C @ =0x0211092C
	movs r1, #2
	ldrh r2, [r5, #0x20]
	lsls r1, r1, #0xe
	ldr r3, [r3]
	ands r1, r2
	adds r0, r6, #0
	movs r2, #0
	blx r3
	adds r6, r0, #0
	bne _0225AA00
	ldr r1, _0225AA20 @ =0x02110928
	adds r0, r4, #0
	ldr r1, [r1]
	blx r1
	movs r0, #0
	pop {r4, r5, r6, pc}
_0225AA00:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	blx FUN_020BE404
	adds r0, r5, #0
	adds r1, r6, #0
	blx FUN_020BE530
	movs r0, #1
	pop {r4, r5, r6, pc}
	nop
_0225AA18: .4byte 0x02110924
_0225AA1C: .4byte 0x0211092C
_0225AA20: .4byte 0x02110928
	thumb_func_end ov89_0225A9B4

	thumb_func_start ov89_0225AA24
ov89_0225AA24: @ 0x0225AA24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r4, r1, #0
	adds r1, r3, #0
	str r0, [sp, #4]
	adds r5, r2, #0
	ldrh r0, [r3, #2]
	ldrb r1, [r1, #8]
	ldr r2, [sp, #0x38]
	str r3, [sp, #8]
	bl ov89_0225C88C
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	ldr r1, [r0, #0x14]
	adds r0, r0, r1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _0225AA68
	movs r2, #1
	ldr r1, [sp, #8]
	str r2, [sp]
	ldrh r1, [r1, #2]
	adds r0, r5, #0
	movs r3, #0x7d
	adds r1, r1, #3
	bl FUN_02007C98
	add r1, sp, #0x20
	str r0, [sp, #0x18]
	blx FUN_020B70A8
	b _0225AA80
_0225AA68:
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0x7d
	bl FUN_02007C98
	add r1, sp, #0x20
	str r0, [sp, #0x18]
	blx FUN_020B70A8
_0225AA80:
	ldr r1, [sp, #0x1c]
	movs r0, #0
	movs r2, #0x40
	blx FUN_020D4790
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	ldr r1, [r0, #0x14]
	movs r0, #0
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
_0225AA96:
	ldr r0, [sp, #0x10]
	cmp r0, #3
	bhi _0225AB00
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225AAA8: @ jump table
	.2byte _0225AAB0 - _0225AAA8 - 2 @ case 0
	.2byte _0225AAC2 - _0225AAA8 - 2 @ case 1
	.2byte _0225AAD8 - _0225AAA8 - 2 @ case 2
	.2byte _0225AAEC - _0225AAA8 - 2 @ case 3
_0225AAB0:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _0225AABC
	ldr r1, [sp, #0xc]
	adds r1, #0x80
	b _0225AABE
_0225AABC:
	ldr r1, [sp, #0xc]
_0225AABE:
	ldr r2, [sp, #0x1c]
	b _0225AB00
_0225AAC2:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _0225AACE
	ldr r1, [sp, #0xc]
	adds r1, #0xa0
	b _0225AAD2
_0225AACE:
	ldr r1, [sp, #0xc]
	adds r1, #0x20
_0225AAD2:
	ldr r0, [sp, #0x1c]
	adds r2, r0, #2
	b _0225AB00
_0225AAD8:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _0225AAE2
	ldr r1, [sp, #0xc]
	b _0225AAE6
_0225AAE2:
	ldr r1, [sp, #0xc]
	adds r1, #0x40
_0225AAE6:
	ldr r2, [sp, #0x1c]
	adds r2, #0x20
	b _0225AB00
_0225AAEC:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _0225AAF8
	ldr r1, [sp, #0xc]
	adds r1, #0x20
	b _0225AAFC
_0225AAF8:
	ldr r1, [sp, #0xc]
	adds r1, #0x60
_0225AAFC:
	ldr r2, [sp, #0x1c]
	adds r2, #0x22
_0225AB00:
	movs r5, #0
	mov ip, r5
_0225AB04:
	movs r0, #0
	adds r7, r0, #0
_0225AB08:
	ldrb r4, [r1, r5]
	movs r3, #0xf
	tst r3, r4
	beq _0225AB1A
	movs r3, #1
	ldrh r4, [r2]
	lsls r3, r0
	orrs r3, r4
	strh r3, [r2]
_0225AB1A:
	ldrb r4, [r1, r5]
	movs r3, #0xf0
	tst r3, r4
	beq _0225AB2E
	ldrh r6, [r2]
	adds r4, r0, #2
	movs r3, #1
	lsls r3, r4
	orrs r3, r6
	strh r3, [r2]
_0225AB2E:
	adds r7, r7, #1
	adds r0, r0, #4
	adds r5, r5, #1
	cmp r7, #4
	blt _0225AB08
	mov r0, ip
	adds r0, r0, #1
	adds r2, r2, #4
	mov ip, r0
	cmp r0, #8
	blt _0225AB04
	ldr r0, [sp, #0x10]
	adds r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _0225AA96
	ldr r0, [sp, #8]
	ldrh r2, [r0]
	ldr r0, [sp, #4]
	ldr r1, [r0, #0x38]
	adds r0, r0, r1
	strh r2, [r0, #2]
	ldr r0, [sp, #0x18]
	bl FUN_0201AB0C
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov89_0225AA24

	thumb_func_start ov89_0225AB64
ov89_0225AB64: @ 0x0225AB64
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	ldr r0, [r0, #0x14]
	adds r4, r1, #0
	str r0, [sp, #8]
	movs r0, #0x7d
	movs r1, #0x40
	bl FUN_0201AA8C
	str r0, [sp, #4]
	ldr r1, [sp]
	ldr r0, [sp, #8]
	movs r2, #0x40
	adds r0, r1, r0
	ldr r1, [sp, #4]
	blx FUN_020D47B8
	ldr r2, [sp]
	ldr r1, [sp, #8]
	movs r0, #0
	adds r1, r2, r1
	movs r2, #0x40
	blx FUN_020D4790
	cmp r4, #3
	beq _0225ABA0
	cmp r4, #4
	beq _0225ABD0
	b _0225AC06
_0225ABA0:
	ldr r3, [sp, #4]
	movs r2, #0x1e
	movs r7, #0
	movs r5, #3
_0225ABA8:
	ldr r4, [sp]
	ldr r0, [sp, #8]
	movs r1, #0
	adds r4, r4, r0
_0225ABB0:
	ldr r6, [r3]
	ldr r0, [r4]
	lsrs r6, r1
	ands r6, r5
	lsls r6, r2
	orrs r0, r6
	adds r1, r1, #2
	stm r4!, {r0}
	cmp r1, #0x20
	blt _0225ABB0
	adds r7, r7, #1
	subs r2, r2, #2
	adds r3, r3, #4
	cmp r7, #0x10
	blt _0225ABA8
	b _0225AC06
_0225ABD0:
	ldr r2, [sp]
	ldr r0, [sp, #8]
	movs r3, #0
	adds r0, r2, r0
	adds r0, #0x3c
	ldr r1, [sp, #4]
	adds r7, r3, #0
	mov ip, r0
	movs r6, #3
_0225ABE2:
	movs r4, #0
	mov r2, ip
_0225ABE6:
	ldr r5, [r1]
	ldr r0, [r2]
	lsrs r5, r4
	ands r5, r6
	lsls r5, r3
	orrs r0, r5
	str r0, [r2]
	adds r4, r4, #2
	subs r2, r2, #4
	cmp r4, #0x20
	blt _0225ABE6
	adds r7, r7, #1
	adds r3, r3, #2
	adds r1, r1, #4
	cmp r7, #0x10
	blt _0225ABE2
_0225AC06:
	ldr r0, [sp, #4]
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov89_0225AB64

	thumb_func_start ov89_0225AC10
ov89_0225AC10: @ 0x0225AC10
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xc
	bl FUN_02018068
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov89_0225AC10

	thumb_func_start ov89_0225AC24
ov89_0225AC24: @ 0x0225AC24
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #9
	adds r4, r1, #0
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	adds r6, r2, #0
	lsls r1, r0, #0x1c
	lsrs r1, r1, #0x1c
	beq _0225AC40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #1
	bne _0225AC48
_0225AC40:
	ldr r1, [r4, #0x18]
	adds r0, r5, #0
	bl ov89_0225A988
_0225AC48:
	movs r1, #9
	lsls r1, r1, #6
	ldr r1, [r4, r1]
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov89_0225AF7C
	adds r0, r4, #0
	bl ov89_0225AC10
	lsls r0, r6, #2
	adds r0, r5, r0
	movs r1, #0
	adds r0, #0xb4
	str r1, [r0]
	pop {r4, r5, r6, pc}
	thumb_func_end ov89_0225AC24

	thumb_func_start ov89_0225AC68
ov89_0225AC68: @ 0x0225AC68
	push {r4, r5, r6, r7}
	adds r0, r2, #0
	asrs r2, r1, #3
	lsrs r2, r2, #0x1c
	adds r2, r1, r2
	adds r5, r3, #0
	asrs r3, r2, #4
	ldr r4, [sp, #0x10]
	cmp r3, #0x11
	blo _0225AC7E
	movs r3, #0x10
_0225AC7E:
	ldr r2, _0225ACF8 @ =0x0225CD6C
	lsls r6, r3, #2
	ldr r7, [r2, r6]
	cmp r3, #0x10
	str r7, [r5]
	bhs _0225ACB4
	ldr r2, [r5]
	lsls r6, r1, #0x1c
	mov ip, r2
	lsrs r2, r1, #0x1f
	subs r6, r6, r2
	movs r1, #0x1c
	rors r6, r1
	adds r1, r2, r6
	adds r2, r3, #1
	lsls r3, r2, #2
	ldr r2, _0225ACF8 @ =0x0225CD6C
	ldr r2, [r2, r3]
	subs r3, r2, r7
	asrs r2, r3, #3
	lsrs r2, r2, #0x1c
	adds r2, r3, r2
	asrs r2, r2, #4
	muls r2, r1, r2
	mov r1, ip
	adds r1, r1, r2
	str r1, [r5]
_0225ACB4:
	asrs r1, r0, #3
	lsrs r1, r1, #0x1c
	adds r1, r0, r1
	asrs r6, r1, #4
	cmp r6, #0xb
	blo _0225ACC2
	movs r6, #0xa
_0225ACC2:
	ldr r5, _0225ACFC @ =0x0225CCE4
	lsls r1, r6, #2
	ldr r3, [r5, r1]
	cmp r6, #0xa
	str r3, [r4]
	bhs _0225ACF2
	lsrs r1, r0, #0x1f
	lsls r7, r0, #0x1c
	subs r7, r7, r1
	movs r0, #0x1c
	rors r7, r0
	adds r0, r1, r7
	adds r1, r6, #1
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, [r4]
	subs r3, r1, r3
	asrs r1, r3, #3
	lsrs r1, r1, #0x1c
	adds r1, r3, r1
	asrs r1, r1, #4
	muls r1, r0, r1
	adds r0, r2, r1
	str r0, [r4]
_0225ACF2:
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0225ACF8: .4byte 0x0225CD6C
_0225ACFC: .4byte 0x0225CCE4
	thumb_func_end ov89_0225AC68

	thumb_func_start ov89_0225AD00
ov89_0225AD00: @ 0x0225AD00
	push {r3, r4, r5, r6}
	ldr r2, _0225AD5C @ =0x00000534
	movs r1, #1
	ldr r5, [r0, r2]
	adds r3, r1, #0
_0225AD0A:
	adds r4, r3, #0
	lsls r4, r1
	adds r2, r5, #0
	tst r2, r4
	bne _0225AD22
	ldr r2, _0225AD5C @ =0x00000534
	ldr r3, [r0, r2]
	orrs r3, r4
	str r3, [r0, r2]
	adds r0, r1, #0
	pop {r3, r4, r5, r6}
	bx lr
_0225AD22:
	adds r1, r1, #1
	cmp r1, #0x20
	blt _0225AD0A
	movs r5, #0
	cmp r1, #0x3f
	bge _0225AD54
	ldr r2, _0225AD60 @ =0x00000538
	movs r3, #1
	ldr r6, [r0, r2]
_0225AD34:
	adds r4, r3, #0
	lsls r4, r5
	adds r2, r6, #0
	tst r2, r4
	bne _0225AD4C
	ldr r2, _0225AD60 @ =0x00000538
	ldr r3, [r0, r2]
	orrs r3, r4
	str r3, [r0, r2]
	adds r0, r1, #0
	pop {r3, r4, r5, r6}
	bx lr
_0225AD4C:
	adds r1, r1, #1
	adds r5, r5, #1
	cmp r1, #0x3f
	blt _0225AD34
_0225AD54:
	movs r0, #0xff
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0225AD5C: .4byte 0x00000534
_0225AD60: .4byte 0x00000538
	thumb_func_end ov89_0225AD00

	thumb_func_start ov89_0225AD64
ov89_0225AD64: @ 0x0225AD64
	push {r4, r5}
	cmp r1, #0xff
	beq _0225AD98
	cmp r1, #0x20
	bge _0225AD84
	movs r3, #1
	ldr r2, _0225AD9C @ =0x00000534
	adds r4, r3, #0
	lsls r4, r1
	subs r1, r3, #2
	ldr r5, [r0, r2]
	eors r1, r4
	ands r1, r5
	str r1, [r0, r2]
	pop {r4, r5}
	bx lr
_0225AD84:
	movs r3, #1
	ldr r2, _0225ADA0 @ =0x00000538
	subs r1, #0x20
	adds r4, r3, #0
	lsls r4, r1
	subs r1, r3, #2
	ldr r5, [r0, r2]
	eors r1, r4
	ands r1, r5
	str r1, [r0, r2]
_0225AD98:
	pop {r4, r5}
	bx lr
	.align 2, 0
_0225AD9C: .4byte 0x00000534
_0225ADA0: .4byte 0x00000538
	thumb_func_end ov89_0225AD64

	thumb_func_start ov89_0225ADA4
ov89_0225ADA4: @ 0x0225ADA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldrh r0, [r1, #2]
	ldrb r1, [r1, #8]
	adds r5, r2, #0
	adds r6, r3, #0
	bl ov89_0225C8BC
	adds r7, r0, #0
	cmp r7, #3
	blo _0225ADC0
	bl GF_AssertFail
_0225ADC0:
	adds r0, r4, #0
	add r1, sp, #0x14
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl FUN_020182B0
	ldr r1, _0225AE98 @ =0x0225CD3C
	lsls r0, r7, #4
	ldr r2, [sp, #0x14]
	ldr r1, [r1, r0]
	adds r1, r2, r1
	str r1, [r5]
	ldr r1, _0225AE9C @ =0x0225CD40
	ldr r2, [sp, #0x14]
	ldr r1, [r1, r0]
	adds r1, r2, r1
	str r1, [r5, #4]
	ldr r1, _0225AEA0 @ =0x0225CD44
	ldr r2, [sp, #0x10]
	ldr r1, [r1, r0]
	adds r1, r2, r1
	str r1, [r5, #8]
	ldr r1, _0225AEA4 @ =0x0225CD48
	ldr r2, [sp, #0x10]
	ldr r0, [r1, r0]
	adds r0, r2, r0
	str r0, [r5, #0xc]
	cmp r6, #1
	bne _0225AE92
	adds r0, r4, #0
	add r1, sp, #8
	add r2, sp, #4
	add r3, sp, #0
	bl FUN_020182CC
	ldr r1, [r5, #4]
	ldr r0, [r5]
	movs r2, #0x64
	subs r4, r1, r0
	ldr r0, [sp, #8]
	movs r3, #0
	asrs r1, r0, #0x1f
	asrs r6, r4, #0x1f
	blx FUN_020F2948
	movs r2, #1
	lsls r2, r2, #0xc
	movs r3, #0
	blx FUN_020F2750
	adds r2, r4, #0
	adds r3, r6, #0
	blx FUN_020F2948
	movs r2, #0x64
	movs r3, #0
	blx FUN_020F2750
	subs r0, r0, r4
	sbcs r1, r6
	movs r2, #2
	movs r3, #0
	blx FUN_020F2750
	ldr r1, [r5, #4]
	movs r2, #0x64
	adds r1, r1, r0
	str r1, [r5, #4]
	ldr r1, [r5]
	movs r3, #0
	subs r0, r1, r0
	str r0, [r5]
	ldr r1, [r5, #8]
	ldr r0, [r5, #0xc]
	subs r4, r1, r0
	ldr r0, [sp, #4]
	asrs r6, r4, #0x1f
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #1
	lsls r2, r2, #0xc
	movs r3, #0
	blx FUN_020F2750
	adds r2, r4, #0
	adds r3, r6, #0
	blx FUN_020F2948
	movs r2, #0x64
	movs r3, #0
	blx FUN_020F2750
	subs r0, r0, r4
	sbcs r1, r6
	movs r2, #2
	movs r3, #0
	blx FUN_020F2750
	ldr r1, [r5, #8]
	adds r1, r1, r0
	str r1, [r5, #8]
	ldr r1, [r5, #0xc]
	subs r0, r1, r0
	str r0, [r5, #0xc]
_0225AE92:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225AE98: .4byte 0x0225CD3C
_0225AE9C: .4byte 0x0225CD40
_0225AEA0: .4byte 0x0225CD44
_0225AEA4: .4byte 0x0225CD48
	thumb_func_end ov89_0225ADA4

	thumb_func_start ov89_0225AEA8
ov89_0225AEA8: @ 0x0225AEA8
	ldr r3, [r0]
	ldr r2, [r1, #4]
	cmp r3, r2
	bgt _0225AECC
	ldr r3, [r1]
	ldr r2, [r0, #4]
	cmp r3, r2
	bgt _0225AECC
	ldr r3, [r0, #8]
	ldr r2, [r1, #0xc]
	cmp r3, r2
	blt _0225AECC
	ldr r1, [r1, #8]
	ldr r0, [r0, #0xc]
	cmp r1, r0
	blt _0225AECC
	movs r0, #1
	bx lr
_0225AECC:
	movs r0, #0
	bx lr
	thumb_func_end ov89_0225AEA8

	thumb_func_start ov89_0225AED0
ov89_0225AED0: @ 0x0225AED0
	push {r3, r4, r5, lr}
	ldr r2, _0225AF08 @ =0x0000053C
	adds r2, r0, r2
	movs r0, #0
_0225AED8:
	ldrb r3, [r2, #1]
	cmp r3, #0
	bne _0225AEFA
	movs r4, #9
	lsls r4, r4, #6
	ldr r5, [r1, r4]
	ldr r3, _0225AF0C @ =0x00FFFFFF
	lsls r0, r0, #0x18
	ands r3, r5
	orrs r0, r3
	str r0, [r1, r4]
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r2, #1]
	adds r0, r0, #1
	strb r0, [r2, #1]
	pop {r3, r4, r5, pc}
_0225AEFA:
	adds r0, r0, #1
	adds r2, r2, #4
	cmp r0, #0x80
	blt _0225AED8
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225AF08: .4byte 0x0000053C
_0225AF0C: .4byte 0x00FFFFFF
	thumb_func_end ov89_0225AED0

	thumb_func_start ov89_0225AF10
ov89_0225AF10: @ 0x0225AF10
	push {r3, r4, r5, lr}
	adds r3, r0, #0
	adds r0, r2, #0
	cmp r1, #0xff
	bne _0225AF1E
	movs r0, #0
	pop {r3, r4, r5, pc}
_0225AF1E:
	ldr r2, _0225AF70 @ =0x0000053C
	lsls r4, r1, #2
	adds r5, r3, r2
	ldrb r1, [r5, r4]
	adds r1, r1, #1
	strb r1, [r5, r4]
	adds r1, r2, #1
	adds r5, r3, r1
	ldrb r1, [r5, r4]
	adds r1, r1, #1
	strb r1, [r5, r4]
	ldr r1, _0225AF74 @ =0x0000073C
	ldrb r5, [r3, r1]
	cmp r5, #0
	bne _0225AF6A
	adds r5, r1, #1
	ldrb r5, [r3, r5]
	cmp r5, #0
	bne _0225AF6A
	adds r4, r3, r4
	ldrb r2, [r4, r2]
	adds r4, r1, #3
	ldrb r4, [r3, r4]
	lsls r5, r4, #1
	ldr r4, _0225AF78 @ =0x0225CCD0
	ldrsh r4, [r4, r5]
	cmp r2, r4
	blt _0225AF6A
	adds r1, r1, #1
	strb r0, [r3, r1]
	adds r3, #0xb0
	adds r0, r3, #0
	movs r1, #0
	movs r2, #4
	blx FUN_020D4994
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225AF6A:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0225AF70: .4byte 0x0000053C
_0225AF74: .4byte 0x0000073C
_0225AF78: .4byte 0x0225CCD0
	thumb_func_end ov89_0225AF10

	thumb_func_start ov89_0225AF7C
ov89_0225AF7C: @ 0x0225AF7C
	push {r3, r4, r5, lr}
	cmp r1, #0xff
	beq _0225AF96
	ldr r2, _0225AF98 @ =0x0000053D
	lsls r4, r1, #2
	adds r5, r0, r2
	ldrb r0, [r5, r4]
	subs r0, r0, #1
	bpl _0225AF94
	bl GF_AssertFail
	movs r0, #0
_0225AF94:
	strb r0, [r5, r4]
_0225AF96:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225AF98: .4byte 0x0000053D
	thumb_func_end ov89_0225AF7C

	thumb_func_start ov89_0225AF9C
ov89_0225AF9C: @ 0x0225AF9C
	push {r4, lr}
	movs r1, #0
	movs r2, #0xb0
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r1, _0225AFBC @ =0x0000073D
	ldrb r2, [r4, r1]
	subs r0, r1, #1
	strb r2, [r4, r0]
	movs r2, #0
	strb r2, [r4, r1]
	adds r0, r1, #1
	strb r2, [r4, r0]
	pop {r4, pc}
	nop
_0225AFBC: .4byte 0x0000073D
	thumb_func_end ov89_0225AF9C

	thumb_func_start ov89_0225AFC0
ov89_0225AFC0: @ 0x0225AFC0
	push {r4, lr}
	movs r2, #9
	lsls r2, r2, #6
	ldr r3, [r0, r2]
	lsls r4, r3, #0x10
	lsrs r4, r4, #0x18
	bne _0225AFDA
	lsls r4, r3, #8
	lsrs r4, r4, #0x18
	bne _0225AFDA
	lsls r4, r3, #0x1c
	lsrs r4, r4, #0x1c
	bne _0225AFDE
_0225AFDA:
	movs r0, #0
	pop {r4, pc}
_0225AFDE:
	ldr r4, _0225AFF8 @ =0xFF00FFFF
	lsls r1, r1, #0x18
	ands r3, r4
	lsrs r1, r1, #8
	orrs r1, r3
	str r1, [r0, r2]
	adds r0, #0x94
	movs r1, #0
	subs r2, #0x94
	blx FUN_020D4994
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0225AFF8: .4byte 0xFF00FFFF
	thumb_func_end ov89_0225AFC0

	thumb_func_start ov89_0225AFFC
ov89_0225AFFC: @ 0x0225AFFC
	push {r3, lr}
	ldr r0, [r0, #4]
	bl FUN_0206FE2C
	ldr r1, _0225B00C @ =0x0225CE34
	ldrb r0, [r1, r0]
	pop {r3, pc}
	nop
_0225B00C: .4byte 0x0225CE34
	thumb_func_end ov89_0225AFFC

	thumb_func_start ov89_0225B010
ov89_0225B010: @ 0x0225B010
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, r5, #0
	adds r2, r0, #1
	adds r0, r5, #0
	adds r0, #0x94
	str r2, [r0]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	cmp r0, #2
	bne _0225B058
	adds r0, r5, #0
	adds r0, #0x1c
	adds r2, r4, #4
	movs r3, #0
	bl ov89_0225ADA4
	adds r0, r5, #0
	adds r0, #0x1c
	movs r1, #1
	bl FUN_020182A0
	movs r1, #9
	lsls r1, r1, #6
	ldr r2, [r5, r1]
	movs r0, #0xf
	bics r2, r0
	movs r0, #1
	orrs r0, r2
	str r0, [r5, r1]
_0225B058:
	ldr r0, [r4]
	cmp r0, #0x28
	ble _0225B074
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov89_0225AED0
	adds r0, r5, #0
	bl ov89_0225AFFC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov89_0225AFC0
_0225B074:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov89_0225B010

	thumb_func_start ov89_0225B078
ov89_0225B078: @ 0x0225B078
	movs r0, #0
	bx lr
	thumb_func_end ov89_0225B078

	thumb_func_start ov89_0225B07C
ov89_0225B07C: @ 0x0225B07C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r5, #0
	adds r4, #0x94
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _0225B090
	cmp r1, #1
	beq _0225B0A8
	b _0225B0E2
_0225B090:
	movs r1, #0x1f
	lsls r1, r1, #8
	str r1, [r4]
	bl ov89_0225AD00
	strb r0, [r4, #9]
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [r4, #4]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
_0225B0A8:
	ldr r0, [r4, #4]
	movs r3, #1
	adds r0, #0xc0
	str r0, [r4, #4]
	ldr r0, [r4]
	lsls r3, r3, #8
	adds r1, r0, #0
	subs r1, #0xc0
	cmp r1, r3
	bge _0225B0CE
	adds r0, r5, #0
	adds r0, #0x1c
	movs r1, #0
	bl FUN_020182A0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0225B0EC
_0225B0CE:
	subs r0, #0xc0
	str r0, [r4]
	ldr r1, [r4, #4]
	adds r0, r5, #0
	adds r0, #0x1c
	adds r2, r1, #0
	lsls r3, r3, #4
	bl FUN_020182C4
	b _0225B0EC
_0225B0E2:
	ldrb r1, [r4, #9]
	bl ov89_0225AD64
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225B0EC:
	adds r0, r5, #0
	adds r4, #0xc
	adds r0, #0x1c
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #1
	bl ov89_0225ADA4
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov89_0225B07C

	thumb_func_start ov89_0225B100
ov89_0225B100: @ 0x0225B100
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x94
	ldrb r3, [r0, #9]
	cmp r3, #0xff
	beq _0225B13A
	ldr r0, [r0]
	asrs r0, r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r1, r0, #0
	adds r2, r0, #0
	blx FUN_020BF0CC
	movs r2, #0x3f
	ldr r0, [r4, #0x14]
	movs r1, #0
	lsls r2, r2, #0x18
	blx FUN_020C2C54
	movs r2, #0x1f
	ldr r0, [r4, #0x14]
	movs r1, #0
	lsls r2, r2, #0x10
	blx FUN_020C2C54
_0225B13A:
	adds r4, #0x1c
	adds r0, r4, #0
	bl FUN_020181EC
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov89_0225B100

	thumb_func_start ov89_0225B148
ov89_0225B148: @ 0x0225B148
	push {r3, lr}
	adds r1, #0xa0
	adds r2, #0x98
	adds r0, r1, #0
	adds r1, r2, #0
	bl ov89_0225AEA8
	cmp r0, #1
	bne _0225B15E
	movs r0, #1
	pop {r3, pc}
_0225B15E:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov89_0225B148

	thumb_func_start ov89_0225B164
ov89_0225B164: @ 0x0225B164
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	ldr r0, _0225B294 @ =0x0000016A
	adds r4, #0x94
	ldrb r0, [r4, r0]
	str r1, [sp]
	cmp r0, #0
	beq _0225B17C
	cmp r0, #1
	beq _0225B1B6
	b _0225B258
_0225B17C:
	adds r0, r1, #0
	adds r0, #0x1c
	add r1, sp, #0xc
	add r2, sp, #8
	add r3, sp, #4
	bl FUN_020182B0
	ldr r7, [sp]
	movs r6, #0
	adds r5, r4, #0
	adds r7, #0xc
_0225B192:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_020181B0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r0, r5, #0
	bl FUN_020182A8
	adds r6, r6, #1
	adds r5, #0x78
	cmp r6, #3
	blt _0225B192
	ldr r0, _0225B294 @ =0x0000016A
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
_0225B1B6:
	ldr r0, [sp]
	add r1, sp, #0xc
	adds r0, #0x1c
	add r2, sp, #8
	add r3, sp, #4
	bl FUN_020182B0
	movs r2, #2
	ldr r0, [sp]
	ldr r1, [sp, #0xc]
	lsls r2, r2, #0xc
	ldr r3, [sp, #8]
	subs r1, r1, r2
	subs r2, r3, r2
	ldr r3, [sp, #4]
	adds r0, #0x1c
	bl FUN_020182A8
	adds r0, r4, #0
	add r1, sp, #0xc
	add r2, sp, #8
	add r3, sp, #4
	bl FUN_020182B0
	movs r2, #2
	ldr r1, [sp, #0xc]
	lsls r2, r2, #0xc
	ldr r3, [sp, #8]
	adds r1, r1, r2
	subs r2, r3, r2
	ldr r3, [sp, #4]
	adds r0, r4, #0
	bl FUN_020182A8
	adds r0, r4, #0
	adds r0, #0x78
	add r1, sp, #0xc
	add r2, sp, #8
	add r3, sp, #4
	bl FUN_020182B0
	movs r2, #2
	adds r0, r4, #0
	ldr r1, [sp, #0xc]
	lsls r2, r2, #0xc
	ldr r3, [sp, #8]
	subs r1, r1, r2
	adds r2, r3, r2
	ldr r3, [sp, #4]
	adds r0, #0x78
	bl FUN_020182A8
	adds r0, r4, #0
	adds r0, #0xf0
	add r1, sp, #0xc
	add r2, sp, #8
	add r3, sp, #4
	bl FUN_020182B0
	movs r2, #2
	adds r0, r4, #0
	ldr r1, [sp, #0xc]
	lsls r2, r2, #0xc
	ldr r3, [sp, #8]
	adds r1, r1, r2
	adds r2, r3, r2
	ldr r3, [sp, #4]
	adds r0, #0xf0
	bl FUN_020182A8
	movs r0, #0x5a
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	ldrh r0, [r4, r0]
	cmp r0, #0x1e
	bls _0225B258
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225B258:
	ldr r0, [sp]
	movs r2, #0x5b
	lsls r2, r2, #2
	ldr r1, [sp]
	adds r0, #0x1c
	adds r2, r4, r2
	movs r3, #0
	bl ov89_0225ADA4
	movs r0, #0x5b
	movs r5, #0
	lsls r0, r0, #2
	adds r6, r4, r0
	adds r7, r5, #0
_0225B274:
	adds r2, r5, #1
	lsls r2, r2, #4
	ldr r1, [sp]
	adds r0, r4, #0
	adds r2, r6, r2
	adds r3, r7, #0
	bl ov89_0225ADA4
	adds r5, r5, #1
	adds r4, #0x78
	cmp r5, #3
	blt _0225B274
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225B294: .4byte 0x0000016A
	thumb_func_end ov89_0225B164

	thumb_func_start ov89_0225B298
ov89_0225B298: @ 0x0225B298
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r6, #0
	movs r4, #0
	adds r5, #0x94
_0225B2A2:
	adds r0, r5, #0
	bl FUN_020181EC
	adds r4, r4, #1
	adds r5, #0x78
	cmp r4, #3
	blt _0225B2A2
	adds r6, #0x1c
	adds r0, r6, #0
	bl FUN_020181EC
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov89_0225B298

	thumb_func_start ov89_0225B2BC
ov89_0225B2BC: @ 0x0225B2BC
	push {r4, r5, r6, lr}
	movs r0, #2
	adds r6, r2, #0
	lsls r0, r0, #8
	adds r6, #0x94
	movs r4, #0
	adds r5, r1, r0
_0225B2CA:
	adds r0, r5, #0
	adds r1, r6, #4
	bl ov89_0225AEA8
	cmp r0, #1
	bne _0225B2DA
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B2DA:
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #4
	blt _0225B2CA
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov89_0225B2BC

	thumb_func_start ov89_0225B2E8
ov89_0225B2E8: @ 0x0225B2E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0x94
	adds r4, r5, #0
	ldr r0, [r0]
	adds r4, #0x94
	cmp r0, #3
	bls _0225B300
	b _0225B42E
_0225B300:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225B30C: @ jump table
	.2byte _0225B314 - _0225B30C - 2 @ case 0
	.2byte _0225B372 - _0225B30C - 2 @ case 1
	.2byte _0225B3AC - _0225B30C - 2 @ case 2
	.2byte _0225B3C0 - _0225B30C - 2 @ case 3
_0225B314:
	adds r0, r5, #0
	adds r0, #0x1c
	movs r1, #2
	bl FUN_020182EC
	ldr r1, _0225B444 @ =0x00000AAA
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0xe
	lsls r0, r0, #0xc
	cmp r6, r0
	bhi _0225B364
	movs r1, #9
	lsls r1, r1, #6
	ldr r1, [r5, r1]
	ldr r0, [r5, #0x18]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x18
	bl ov89_0225AB64
	ldr r1, [r5, #0x18]
	adds r0, r7, #0
	bl ov89_0225A958
	movs r1, #9
	lsls r1, r1, #6
	ldr r2, [r5, r1]
	movs r0, #0xf0
	bics r2, r0
	movs r0, #0x10
	orrs r2, r0
	lsls r0, r0, #0xa
	adds r0, r6, r0
	lsls r0, r0, #0x10
	str r2, [r5, r1]
	lsrs r6, r0, #0x10
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0225B364:
	adds r0, r5, #0
	adds r0, #0x1c
	adds r1, r6, #0
	movs r2, #2
	bl FUN_020182E0
	b _0225B42E
_0225B372:
	movs r1, #9
	lsls r1, r1, #6
	ldr r2, [r5, r1]
	movs r0, #0xf0
	bics r2, r0
	adds r0, r5, #0
	str r2, [r5, r1]
	adds r0, #0x1c
	movs r1, #2
	bl FUN_020182EC
	ldr r1, _0225B444 @ =0x00000AAA
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #3
	lsls r0, r0, #0xe
	cmp r1, r0
	blo _0225B3A0
	ldr r0, [r4]
	movs r1, #0
	adds r0, r0, #1
	str r0, [r4]
_0225B3A0:
	adds r0, r5, #0
	adds r0, #0x1c
	movs r2, #2
	bl FUN_020182E0
	b _0225B42E
_0225B3AC:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #4
	blt _0225B42E
	movs r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0225B3C0:
	adds r0, r5, #0
	adds r0, #0x1c
	add r1, sp, #8
	add r2, sp, #4
	add r3, sp, #0
	bl FUN_020182B0
	ldr r1, [sp, #8]
	ldr r0, _0225B448 @ =0xFFFB0000
	cmp r1, r0
	blt _0225B3EE
	movs r0, #5
	lsls r0, r0, #0x10
	cmp r1, r0
	bgt _0225B3EE
	movs r2, #3
	ldr r3, [sp, #4]
	lsls r2, r2, #0x10
	cmp r3, r2
	bgt _0225B3EE
	ldr r0, _0225B44C @ =0xFFFD0000
	cmp r3, r0
	bge _0225B3F4
_0225B3EE:
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0225B3F4:
	ldr r0, [r4, #8]
	cmp r0, #5
	bge _0225B40E
	lsrs r6, r2, #4
	lsrs r2, r2, #4
	adds r0, r5, #0
	subs r2, r3, r2
	ldr r3, [sp]
	adds r0, #0x1c
	adds r1, r1, r6
	bl FUN_020182A8
	b _0225B420
_0225B40E:
	lsrs r6, r2, #4
	lsrs r2, r2, #4
	adds r0, r5, #0
	adds r2, r3, r2
	ldr r3, [sp]
	adds r0, #0x1c
	adds r1, r1, r6
	bl FUN_020182A8
_0225B420:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	blt _0225B42E
	movs r0, #0
	str r0, [r4, #8]
_0225B42E:
	adds r0, r5, #0
	adds r4, #0xc
	adds r0, #0x1c
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov89_0225ADA4
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225B444: .4byte 0x00000AAA
_0225B448: .4byte 0xFFFB0000
_0225B44C: .4byte 0xFFFD0000
	thumb_func_end ov89_0225B2E8

	thumb_func_start ov89_0225B450
ov89_0225B450: @ 0x0225B450
	push {r3, lr}
	adds r1, #0xa0
	adds r2, #0x98
	adds r0, r1, #0
	adds r1, r2, #0
	bl ov89_0225AEA8
	cmp r0, #1
	bne _0225B466
	movs r0, #1
	pop {r3, pc}
_0225B466:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov89_0225B450

	thumb_func_start ov89_0225B46C
ov89_0225B46C: @ 0x0225B46C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0x94
	adds r4, r5, #0
	ldr r0, [r0]
	adds r4, #0x94
	cmp r0, #3
	bls _0225B484
	b _0225B5DE
_0225B484:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225B490: @ jump table
	.2byte _0225B498 - _0225B490 - 2 @ case 0
	.2byte _0225B4F8 - _0225B490 - 2 @ case 1
	.2byte _0225B532 - _0225B490 - 2 @ case 2
	.2byte _0225B558 - _0225B490 - 2 @ case 3
_0225B498:
	adds r0, r5, #0
	adds r0, #0x1c
	movs r1, #2
	bl FUN_020182EC
	ldr r1, _0225B5F4 @ =0x00000AAA
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #2
	lsls r0, r0, #0xc
	cmp r6, r0
	blo _0225B4EA
	movs r1, #9
	lsls r1, r1, #6
	ldr r1, [r5, r1]
	ldr r0, [r5, #0x18]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x18
	bl ov89_0225AB64
	movs r0, #1
	lsls r0, r0, #0xe
	subs r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, [r5, #0x18]
	adds r0, r7, #0
	bl ov89_0225A958
	movs r1, #9
	lsls r1, r1, #6
	ldr r2, [r5, r1]
	movs r0, #0xf0
	bics r2, r0
	movs r0, #0x10
	orrs r0, r2
	str r0, [r5, r1]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0225B4EA:
	adds r0, r5, #0
	adds r0, #0x1c
	adds r1, r6, #0
	movs r2, #2
	bl FUN_020182E0
	b _0225B5DE
_0225B4F8:
	movs r1, #9
	lsls r1, r1, #6
	ldr r2, [r5, r1]
	movs r0, #0xf0
	bics r2, r0
	adds r0, r5, #0
	str r2, [r5, r1]
	adds r0, #0x1c
	movs r1, #2
	bl FUN_020182EC
	ldr r1, _0225B5F4 @ =0x00000AAA
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #1
	lsls r0, r0, #0xe
	cmp r1, r0
	bhs _0225B526
	ldr r0, [r4]
	movs r1, #0
	adds r0, r0, #1
	str r0, [r4]
_0225B526:
	adds r0, r5, #0
	adds r0, #0x1c
	movs r2, #2
	bl FUN_020182E0
	b _0225B5DE
_0225B532:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #4
	blt _0225B5DE
	adds r0, r5, #0
	adds r0, #0x1c
	add r1, sp, #8
	add r2, sp, #4
	add r3, sp, #0
	bl FUN_020182B0
	ldr r0, [sp, #4]
	str r0, [r4, #0xc]
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0225B558:
	adds r0, r5, #0
	adds r0, #0x1c
	add r1, sp, #8
	add r2, sp, #4
	add r3, sp, #0
	bl FUN_020182B0
	ldr r1, [sp, #8]
	ldr r0, _0225B5F8 @ =0xFFFB0000
	cmp r1, r0
	blt _0225B586
	movs r0, #5
	lsls r0, r0, #0x10
	cmp r1, r0
	bgt _0225B586
	movs r0, #3
	ldr r1, [sp, #4]
	lsls r0, r0, #0x10
	cmp r1, r0
	bgt _0225B586
	ldr r0, _0225B5FC @ =0xFFFD0000
	cmp r1, r0
	bge _0225B58C
_0225B586:
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0225B58C:
	movs r0, #2
	ldr r1, [r4, #4]
	lsls r0, r0, #0xe
	adds r1, r1, r0
	movs r0, #0x5a
	lsls r0, r0, #0xe
	str r1, [r4, #4]
	cmp r1, r0
	blt _0225B5A4
	ldr r1, [r4, #4]
	subs r0, r1, r0
	str r0, [r4, #4]
_0225B5A4:
	ldr r0, [r4, #4]
	bl FUN_0201FD14
	adds r2, r0, #0
	movs r1, #1
	adds r0, r5, #0
	ldr r3, [sp, #8]
	lsls r1, r1, #0xc
	subs r1, r3, r1
	asrs r3, r2, #0x1f
	lsrs r6, r2, #0x11
	lsls r3, r3, #0xf
	orrs r3, r6
	movs r6, #1
	lsls r6, r6, #0xc
	lsls r2, r2, #0xf
	lsrs r6, r6, #1
	adds r0, #0x1c
	adds r6, r2, r6
	ldr r2, _0225B600 @ =0x00000000
	ldr r7, [r4, #0xc]
	adcs r3, r2
	lsls r2, r3, #0x14
	lsrs r3, r6, #0xc
	orrs r3, r2
	adds r2, r7, r3
	ldr r3, [sp]
	bl FUN_020182A8
_0225B5DE:
	adds r0, r5, #0
	adds r4, #0x10
	adds r0, #0x1c
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov89_0225ADA4
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225B5F4: .4byte 0x00000AAA
_0225B5F8: .4byte 0xFFFB0000
_0225B5FC: .4byte 0xFFFD0000
_0225B600: .4byte 0x00000000
	thumb_func_end ov89_0225B46C

	thumb_func_start ov89_0225B604
ov89_0225B604: @ 0x0225B604
	push {r3, lr}
	adds r1, #0xa4
	adds r2, #0x98
	adds r0, r1, #0
	adds r1, r2, #0
	bl ov89_0225AEA8
	cmp r0, #1
	bne _0225B61A
	movs r0, #1
	pop {r3, pc}
_0225B61A:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov89_0225B604

	thumb_func_start ov89_0225B620
ov89_0225B620: @ 0x0225B620
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	str r1, [sp]
	ldr r1, _0225B770 @ =0x0000016D
	adds r4, #0x94
	ldrb r2, [r4, r1]
	cmp r2, #0
	beq _0225B638
	cmp r2, #1
	beq _0225B684
	b _0225B74A
_0225B638:
	bl ov89_0225AD00
	movs r1, #0x5b
	lsls r1, r1, #2
	strb r0, [r4, r1]
	ldr r0, [sp]
	add r1, sp, #0xc
	adds r0, #0x1c
	add r2, sp, #8
	add r3, sp, #4
	bl FUN_020182B0
	ldr r7, [sp]
	movs r6, #0
	adds r5, r4, #0
	adds r7, #0xc
_0225B658:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_020181B0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r0, r5, #0
	bl FUN_020182A8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_020182A0
	adds r6, r6, #1
	adds r5, #0x78
	cmp r6, #3
	blt _0225B658
	ldr r0, _0225B770 @ =0x0000016D
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
_0225B684:
	ldr r0, [sp]
	add r1, sp, #0xc
	adds r0, #0x1c
	add r2, sp, #8
	add r3, sp, #4
	bl FUN_020182B0
	ldr r1, [sp, #0xc]
	ldr r0, _0225B774 @ =0xFFFB0000
	cmp r1, r0
	blt _0225B6BA
	movs r2, #5
	lsls r2, r2, #0x10
	cmp r1, r2
	bgt _0225B6BA
	movs r0, #3
	ldr r3, [sp, #8]
	lsls r0, r0, #0x10
	cmp r3, r0
	bgt _0225B6BA
	ldr r0, _0225B778 @ =0xFFFD0000
	cmp r3, r0
	blt _0225B6BA
	ldr r0, _0225B77C @ =0x0000016B
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _0225B6E4
_0225B6BA:
	movs r6, #0
	adds r5, r4, #0
	adds r7, r6, #0
_0225B6C0:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_020182A0
	adds r6, r6, #1
	adds r5, #0x78
	cmp r6, #3
	blt _0225B6C0
	ldr r0, [sp]
	movs r1, #0
	adds r0, #0x1c
	bl FUN_020182A0
	ldr r0, _0225B770 @ =0x0000016D
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _0225B758
_0225B6E4:
	ldr r0, [sp]
	lsrs r2, r2, #5
	adds r2, r3, r2
	ldr r3, [sp, #4]
	adds r0, #0x1c
	bl FUN_020182A8
	movs r0, #0x5a
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	movs r1, #3
	blx FUN_020F2998
	cmp r1, #0
	bne _0225B73E
	ldr r0, _0225B780 @ =0x0000016A
	movs r2, #0xa
	ldrb r1, [r4, r0]
	ldr r3, [sp, #8]
	movs r0, #0x78
	muls r0, r1, r0
	lsls r2, r2, #0xa
	adds r2, r3, r2
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #4]
	adds r0, r4, r0
	bl FUN_020182A8
	ldr r0, _0225B780 @ =0x0000016A
	ldrb r1, [r4, r0]
	movs r0, #0x78
	muls r0, r1, r0
	adds r0, r4, r0
	movs r1, #1
	bl FUN_020182A0
	ldr r0, _0225B780 @ =0x0000016A
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	ldrb r1, [r4, r0]
	cmp r1, #3
	blo _0225B73E
	movs r1, #0
	strb r1, [r4, r0]
_0225B73E:
	movs r0, #0x5a
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	b _0225B758
_0225B74A:
	subs r1, r1, #1
	ldrb r1, [r4, r1]
	bl ov89_0225AD64
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225B758:
	ldr r0, [sp]
	movs r2, #0x17
	lsls r2, r2, #4
	ldr r1, [sp]
	adds r0, #0x1c
	adds r2, r4, r2
	movs r3, #0
	bl ov89_0225ADA4
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225B770: .4byte 0x0000016D
_0225B774: .4byte 0xFFFB0000
_0225B778: .4byte 0xFFFD0000
_0225B77C: .4byte 0x0000016B
_0225B780: .4byte 0x0000016A
	thumb_func_end ov89_0225B620

	thumb_func_start ov89_0225B784
ov89_0225B784: @ 0x0225B784
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r1, #0
	adds r7, r6, #0
	movs r0, #0x5b
	adds r7, #0x94
	lsls r0, r0, #2
	ldrb r3, [r7, r0]
	cmp r3, #0xff
	beq _0225B7C0
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r1, r0, #0
	adds r2, r0, #0
	blx FUN_020BF0CC
	movs r2, #0x3f
	ldr r0, [r6, #0x14]
	movs r1, #0
	lsls r2, r2, #0x18
	blx FUN_020C2C54
	movs r2, #0x1f
	ldr r0, [r6, #0x14]
	movs r1, #0
	lsls r2, r2, #0x10
	blx FUN_020C2C54
_0225B7C0:
	movs r4, #0
	adds r5, r7, #0
_0225B7C4:
	adds r0, r5, #0
	bl FUN_020181EC
	adds r4, r4, #1
	adds r5, #0x78
	cmp r4, #3
	blt _0225B7C4
	movs r0, #0x5b
	lsls r0, r0, #2
	ldrb r3, [r7, r0]
	cmp r3, #0xff
	beq _0225B804
	movs r0, #0x1f
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r1, r0, #0
	adds r2, r0, #0
	blx FUN_020BF0CC
	movs r2, #0x3f
	ldr r0, [r6, #0x14]
	movs r1, #0
	lsls r2, r2, #0x18
	blx FUN_020C2C54
	movs r2, #0x1f
	ldr r0, [r6, #0x14]
	movs r1, #0
	lsls r2, r2, #0x10
	blx FUN_020C2C54
_0225B804:
	adds r6, #0x1c
	adds r0, r6, #0
	bl FUN_020181EC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov89_0225B784

	thumb_func_start ov89_0225B810
ov89_0225B810: @ 0x0225B810
	push {r3, lr}
	movs r0, #0x81
	lsls r0, r0, #2
	adds r2, #0x98
	adds r0, r1, r0
	adds r1, r2, #0
	bl ov89_0225AEA8
	cmp r0, #1
	bne _0225B828
	movs r0, #1
	pop {r3, pc}
_0225B828:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov89_0225B810

	thumb_func_start ov89_0225B82C
ov89_0225B82C: @ 0x0225B82C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, r5, #0
	adds r4, #0x94
	cmp r0, #0
	beq _0225B846
	cmp r0, #1
	beq _0225B85E
	b _0225B8E0
_0225B846:
	adds r0, r5, #0
	adds r0, #0x1c
	add r1, sp, #8
	add r2, sp, #4
	add r3, sp, #0
	bl FUN_020182B0
	ldr r0, [sp, #8]
	str r0, [r4, #8]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0225B85E:
	adds r0, r5, #0
	adds r0, #0x1c
	add r1, sp, #8
	add r2, sp, #4
	add r3, sp, #0
	bl FUN_020182B0
	ldr r1, [sp, #8]
	ldr r0, _0225B8F8 @ =0xFFFB0000
	cmp r1, r0
	blt _0225B88C
	movs r0, #5
	lsls r0, r0, #0x10
	cmp r1, r0
	bgt _0225B88C
	movs r0, #3
	ldr r1, [sp, #4]
	lsls r0, r0, #0x10
	cmp r1, r0
	bgt _0225B88C
	ldr r0, _0225B8FC @ =0xFFFD0000
	cmp r1, r0
	bge _0225B892
_0225B88C:
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0225B892:
	movs r0, #2
	ldr r1, [r4, #4]
	lsls r0, r0, #0xe
	adds r1, r1, r0
	movs r0, #0x5a
	lsls r0, r0, #0xe
	str r1, [r4, #4]
	cmp r1, r0
	blt _0225B8AA
	ldr r1, [r4, #4]
	subs r0, r1, r0
	str r0, [r4, #4]
_0225B8AA:
	ldr r0, [r4, #4]
	bl FUN_0201FD14
	adds r2, r0, #0
	asrs r6, r2, #0x1f
	movs r7, #2
	adds r0, r5, #0
	lsrs r3, r2, #0x11
	lsls r6, r6, #0xf
	orrs r6, r3
	lsls r3, r2, #0xf
	movs r2, #0
	lsls r7, r7, #0xa
	adds r0, #0x1c
	adds r3, r3, r7
	adcs r6, r2
	ldr r1, [r4, #8]
	lsls r2, r6, #0x14
	lsrs r3, r3, #0xc
	orrs r3, r2
	adds r1, r1, r3
	ldr r3, [sp, #4]
	lsls r2, r7, #1
	subs r2, r3, r2
	ldr r3, [sp]
	bl FUN_020182A8
_0225B8E0:
	adds r0, r5, #0
	adds r4, #0xc
	adds r0, #0x1c
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov89_0225ADA4
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225B8F8: .4byte 0xFFFB0000
_0225B8FC: .4byte 0xFFFD0000
	thumb_func_end ov89_0225B82C

	thumb_func_start ov89_0225B900
ov89_0225B900: @ 0x0225B900
	push {r3, lr}
	adds r1, #0xa0
	adds r2, #0x98
	adds r0, r1, #0
	adds r1, r2, #0
	bl ov89_0225AEA8
	cmp r0, #1
	bne _0225B916
	movs r0, #1
	pop {r3, pc}
_0225B916:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov89_0225B900

	thumb_func_start ov89_0225B91C
ov89_0225B91C: @ 0x0225B91C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r5, #0
	adds r4, #0x94
	ldrb r0, [r4, #6]
	cmp r0, #0
	beq _0225B930
	cmp r0, #1
	beq _0225B93C
	b _0225B964
_0225B930:
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [r4]
	ldrb r0, [r4, #6]
	adds r0, r0, #1
	strb r0, [r4, #6]
_0225B93C:
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	ldrh r0, [r4, #4]
	cmp r0, #8
	bls _0225B94C
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225B94C:
	movs r0, #3
	ldr r1, [r4]
	lsls r0, r0, #8
	adds r1, r1, r0
	adds r0, r5, #0
	movs r3, #1
	adds r0, #0x1c
	adds r2, r1, #0
	lsls r3, r3, #0xc
	str r1, [r4]
	bl FUN_020182C4
_0225B964:
	adds r0, r5, #0
	adds r4, #8
	adds r0, #0x1c
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #1
	bl ov89_0225ADA4
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov89_0225B91C

	thumb_func_start ov89_0225B978
ov89_0225B978: @ 0x0225B978
	push {r3, lr}
	adds r1, #0x9c
	adds r2, #0x98
	adds r0, r1, #0
	adds r1, r2, #0
	bl ov89_0225AEA8
	cmp r0, #1
	bne _0225B98E
	movs r0, #1
	pop {r3, pc}
_0225B98E:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov89_0225B978

	thumb_func_start ov89_0225B994
ov89_0225B994: @ 0x0225B994
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r4, #0x94
	str r1, [sp]
	adds r1, r4, #0
	adds r1, #0xf7
	ldrb r1, [r1]
	cmp r1, #0
	beq _0225B9AE
	cmp r1, #1
	beq _0225BA0A
	b _0225BAE4
_0225B9AE:
	bl ov89_0225AD00
	adds r1, r4, #0
	adds r1, #0xf6
	strb r0, [r1]
	ldr r0, [sp]
	add r1, sp, #0xc
	adds r0, #0x1c
	add r2, sp, #8
	add r3, sp, #4
	bl FUN_020182B0
	ldr r7, [sp]
	movs r6, #0
	adds r5, r4, #0
	adds r7, #0xc
_0225B9CE:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_020181B0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r0, r5, #0
	bl FUN_020182A8
	adds r0, r5, #0
	movs r1, #1
	bl FUN_020182A0
	adds r6, r6, #1
	adds r5, #0x78
	cmp r6, #2
	blt _0225B9CE
	movs r1, #0x1f
	adds r0, r4, #0
	lsls r1, r1, #8
	adds r0, #0xf4
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf7
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf7
	strb r1, [r0]
_0225BA0A:
	adds r0, r4, #0
	adds r0, #0xf4
	ldrh r0, [r0]
	movs r2, #1
	lsls r2, r2, #8
	subs r0, #0xa0
	cmp r0, r2
	bge _0225BA4A
	movs r6, #0
	adds r5, r4, #0
	adds r7, r6, #0
_0225BA20:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_020182A0
	adds r6, r6, #1
	adds r5, #0x78
	cmp r6, #2
	blt _0225BA20
	ldr r0, [sp]
	movs r1, #0
	adds r0, #0x1c
	bl FUN_020182A0
	adds r0, r4, #0
	adds r0, #0xf7
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf7
	strb r1, [r0]
	b _0225BAF2
_0225BA4A:
	adds r0, r4, #0
	adds r0, #0xf4
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf4
	subs r1, #0xa0
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xf0
	ldr r3, [r1]
	lsls r1, r2, #9
	adds r2, r3, r1
	adds r1, r4, #0
	adds r1, #0xf0
	str r2, [r1]
	adds r1, r4, #0
	adds r1, #0xf0
	ldr r2, [r1]
	movs r1, #0x5a
	adds r0, r4, #0
	lsls r1, r1, #0xe
	adds r0, #0xf0
	cmp r2, r1
	blt _0225BA80
	ldr r2, [r0]
	subs r1, r2, r1
	str r1, [r0]
_0225BA80:
	adds r0, r4, #0
	adds r0, #0xf0
	ldr r0, [r0]
	bl FUN_0201FD14
	asrs r2, r0, #0x1f
	lsls r3, r2, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r0, #0x10
	movs r0, #2
	orrs r3, r1
	movs r1, #0
	lsls r0, r0, #0xa
	adds r2, r2, r0
	adcs r3, r1
	lsls r0, r3, #0x14
	lsrs r7, r2, #0xc
	orrs r7, r0
	ldr r0, [sp]
	add r1, sp, #0xc
	adds r0, #0x1c
	add r2, sp, #8
	add r3, sp, #4
	bl FUN_020182B0
	movs r6, #0
	adds r5, r4, #0
_0225BAB6:
	movs r0, #1
	tst r0, r6
	beq _0225BACC
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r0, r5, #0
	adds r1, r1, r7
	bl FUN_020182A8
	b _0225BADA
_0225BACC:
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r0, r5, #0
	subs r1, r1, r7
	bl FUN_020182A8
_0225BADA:
	adds r6, r6, #1
	adds r5, #0x78
	cmp r6, #2
	blt _0225BAB6
	b _0225BAF2
_0225BAE4:
	adds r4, #0xf6
	ldrb r1, [r4]
	bl ov89_0225AD64
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225BAF2:
	ldr r0, [sp]
	adds r2, r4, #0
	ldr r1, [sp]
	adds r0, #0x1c
	adds r2, #0xf8
	movs r3, #0
	bl ov89_0225ADA4
	movs r5, #0
	adds r6, r4, #0
	adds r6, #0xf8
	adds r7, r5, #0
_0225BB0A:
	adds r2, r5, #1
	lsls r2, r2, #4
	ldr r1, [sp]
	adds r0, r4, #0
	adds r2, r6, r2
	adds r3, r7, #0
	bl ov89_0225ADA4
	adds r5, r5, #1
	adds r4, #0x78
	cmp r5, #2
	blt _0225BB0A
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov89_0225B994

	thumb_func_start ov89_0225BB28
ov89_0225BB28: @ 0x0225BB28
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r1, #0
	adds r5, r6, #0
	adds r5, #0x94
	adds r0, r5, #0
	adds r0, #0xf6
	ldrb r3, [r0]
	cmp r3, #0xff
	beq _0225BB6A
	adds r0, r5, #0
	adds r0, #0xf4
	ldrh r0, [r0]
	asrs r0, r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r1, r0, #0
	adds r2, r0, #0
	blx FUN_020BF0CC
	movs r2, #0x3f
	ldr r0, [r6, #0x14]
	movs r1, #0
	lsls r2, r2, #0x18
	blx FUN_020C2C54
	movs r2, #0x1f
	ldr r0, [r6, #0x14]
	movs r1, #0
	lsls r2, r2, #0x10
	blx FUN_020C2C54
_0225BB6A:
	movs r4, #0
_0225BB6C:
	adds r0, r5, #0
	bl FUN_020181EC
	adds r4, r4, #1
	adds r5, #0x78
	cmp r4, #2
	blt _0225BB6C
	adds r6, #0x1c
	adds r0, r6, #0
	bl FUN_020181EC
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov89_0225BB28

	thumb_func_start ov89_0225BB88
ov89_0225BB88: @ 0x0225BB88
	push {r4, r5, r6, lr}
	movs r0, #0x63
	adds r6, r2, #0
	lsls r0, r0, #2
	adds r6, #0x94
	movs r4, #0
	adds r5, r1, r0
_0225BB96:
	adds r0, r5, #0
	adds r1, r6, #4
	bl ov89_0225AEA8
	cmp r0, #1
	bne _0225BBA6
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225BBA6:
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _0225BB96
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov89_0225BB88

	thumb_func_start ov89_0225BBB4
ov89_0225BBB4: @ 0x0225BBB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r4, #0x94
	str r1, [sp]
	adds r1, r4, #0
	adds r1, #0xf7
	ldrb r1, [r1]
	cmp r1, #0
	beq _0225BBCE
	cmp r1, #1
	beq _0225BC2A
	b _0225BD04
_0225BBCE:
	bl ov89_0225AD00
	adds r1, r4, #0
	adds r1, #0xf6
	strb r0, [r1]
	ldr r0, [sp]
	add r1, sp, #0xc
	adds r0, #0x1c
	add r2, sp, #8
	add r3, sp, #4
	bl FUN_020182B0
	ldr r7, [sp]
	movs r6, #0
	adds r5, r4, #0
	adds r7, #0xc
_0225BBEE:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_020181B0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r0, r5, #0
	bl FUN_020182A8
	adds r0, r5, #0
	movs r1, #1
	bl FUN_020182A0
	adds r6, r6, #1
	adds r5, #0x78
	cmp r6, #2
	blt _0225BBEE
	movs r1, #0x1f
	adds r0, r4, #0
	lsls r1, r1, #8
	adds r0, #0xf4
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf7
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf7
	strb r1, [r0]
_0225BC2A:
	adds r0, r4, #0
	adds r0, #0xf4
	ldrh r0, [r0]
	movs r2, #1
	lsls r2, r2, #8
	subs r0, #0xa0
	cmp r0, r2
	bge _0225BC6A
	movs r6, #0
	adds r5, r4, #0
	adds r7, r6, #0
_0225BC40:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_020182A0
	adds r6, r6, #1
	adds r5, #0x78
	cmp r6, #2
	blt _0225BC40
	ldr r0, [sp]
	movs r1, #0
	adds r0, #0x1c
	bl FUN_020182A0
	adds r0, r4, #0
	adds r0, #0xf7
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf7
	strb r1, [r0]
	b _0225BD12
_0225BC6A:
	adds r0, r4, #0
	adds r0, #0xf4
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf4
	subs r1, #0xa0
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xf0
	ldr r3, [r1]
	lsls r1, r2, #9
	adds r2, r3, r1
	adds r1, r4, #0
	adds r1, #0xf0
	str r2, [r1]
	adds r1, r4, #0
	adds r1, #0xf0
	ldr r2, [r1]
	movs r1, #0x5a
	adds r0, r4, #0
	lsls r1, r1, #0xe
	adds r0, #0xf0
	cmp r2, r1
	blt _0225BCA0
	ldr r2, [r0]
	subs r1, r2, r1
	str r1, [r0]
_0225BCA0:
	adds r0, r4, #0
	adds r0, #0xf0
	ldr r0, [r0]
	bl FUN_0201FD14
	asrs r2, r0, #0x1f
	lsls r3, r2, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r0, #0x10
	movs r0, #2
	orrs r3, r1
	movs r1, #0
	lsls r0, r0, #0xa
	adds r2, r2, r0
	adcs r3, r1
	lsls r0, r3, #0x14
	lsrs r7, r2, #0xc
	orrs r7, r0
	ldr r0, [sp]
	add r1, sp, #0xc
	adds r0, #0x1c
	add r2, sp, #8
	add r3, sp, #4
	bl FUN_020182B0
	movs r6, #0
	adds r5, r4, #0
_0225BCD6:
	movs r0, #1
	tst r0, r6
	beq _0225BCEC
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #4]
	adds r0, r5, #0
	adds r2, r2, r7
	bl FUN_020182A8
	b _0225BCFA
_0225BCEC:
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #4]
	adds r0, r5, #0
	subs r2, r2, r7
	bl FUN_020182A8
_0225BCFA:
	adds r6, r6, #1
	adds r5, #0x78
	cmp r6, #2
	blt _0225BCD6
	b _0225BD12
_0225BD04:
	adds r4, #0xf6
	ldrb r1, [r4]
	bl ov89_0225AD64
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225BD12:
	ldr r0, [sp]
	adds r2, r4, #0
	ldr r1, [sp]
	adds r0, #0x1c
	adds r2, #0xf8
	movs r3, #0
	bl ov89_0225ADA4
	movs r5, #0
	adds r6, r4, #0
	adds r6, #0xf8
	adds r7, r5, #0
_0225BD2A:
	adds r2, r5, #1
	lsls r2, r2, #4
	ldr r1, [sp]
	adds r0, r4, #0
	adds r2, r6, r2
	adds r3, r7, #0
	bl ov89_0225ADA4
	adds r5, r5, #1
	adds r4, #0x78
	cmp r5, #2
	blt _0225BD2A
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov89_0225BBB4

	thumb_func_start ov89_0225BD48
ov89_0225BD48: @ 0x0225BD48
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r1, #0
	adds r5, r6, #0
	adds r5, #0x94
	adds r0, r5, #0
	adds r0, #0xf6
	ldrb r3, [r0]
	cmp r3, #0xff
	beq _0225BD8A
	adds r0, r5, #0
	adds r0, #0xf4
	ldrh r0, [r0]
	asrs r0, r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r1, r0, #0
	adds r2, r0, #0
	blx FUN_020BF0CC
	movs r2, #0x3f
	ldr r0, [r6, #0x14]
	movs r1, #0
	lsls r2, r2, #0x18
	blx FUN_020C2C54
	movs r2, #0x1f
	ldr r0, [r6, #0x14]
	movs r1, #0
	lsls r2, r2, #0x10
	blx FUN_020C2C54
_0225BD8A:
	movs r4, #0
_0225BD8C:
	adds r0, r5, #0
	bl FUN_020181EC
	adds r4, r4, #1
	adds r5, #0x78
	cmp r4, #2
	blt _0225BD8C
	adds r6, #0x1c
	adds r0, r6, #0
	bl FUN_020181EC
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov89_0225BD48

	thumb_func_start ov89_0225BDA8
ov89_0225BDA8: @ 0x0225BDA8
	push {r4, r5, r6, lr}
	movs r0, #0x63
	adds r6, r2, #0
	lsls r0, r0, #2
	adds r6, #0x94
	movs r4, #0
	adds r5, r1, r0
_0225BDB6:
	adds r0, r5, #0
	adds r1, r6, #4
	bl ov89_0225AEA8
	cmp r0, #1
	bne _0225BDC6
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225BDC6:
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _0225BDB6
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov89_0225BDA8

	thumb_func_start ov89_0225BDD4
ov89_0225BDD4: @ 0x0225BDD4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r1, #0
	adds r4, r6, #0
	adds r4, #0x94
	ldrb r0, [r4, #6]
	cmp r0, #0
	beq _0225BDEA
	cmp r0, #1
	beq _0225BDF6
	b _0225BE52
_0225BDEA:
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [r4]
	ldrb r0, [r4, #6]
	adds r0, r0, #1
	strb r0, [r4, #6]
_0225BDF6:
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	ldrh r0, [r4, #4]
	cmp r0, #0x1e
	bls _0225BE08
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0225BE08:
	movs r0, #6
	ldr r1, [r4]
	lsls r0, r0, #6
	adds r2, r1, r0
	movs r1, #1
	adds r0, r6, #0
	lsls r1, r1, #0xc
	str r2, [r4]
	adds r0, #0x1c
	adds r3, r1, #0
	bl FUN_020182C4
	movs r0, #1
	ldr r1, [r4]
	lsls r0, r0, #0xc
	subs r0, r1, r0
	lsls r1, r0, #0xc
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	rsbs r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x1c
	add r1, sp, #8
	add r2, sp, #4
	add r3, sp, #0
	bl FUN_020182B0
	ldr r2, [sp, #4]
	adds r0, r6, #0
	ldr r1, [sp, #8]
	ldr r3, [sp]
	adds r0, #0x1c
	adds r2, r2, r5
	bl FUN_020182A8
_0225BE52:
	adds r0, r6, #0
	adds r4, #8
	adds r0, #0x1c
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #1
	bl ov89_0225ADA4
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov89_0225BDD4

	thumb_func_start ov89_0225BE68
ov89_0225BE68: @ 0x0225BE68
	push {r3, lr}
	adds r1, #0x9c
	adds r2, #0x98
	adds r0, r1, #0
	adds r1, r2, #0
	bl ov89_0225AEA8
	cmp r0, #1
	bne _0225BE7E
	movs r0, #1
	pop {r3, pc}
_0225BE7E:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov89_0225BE68

	thumb_func_start ov89_0225BE84
ov89_0225BE84: @ 0x0225BE84
	push {r4, r5}
	adds r4, r0, #0
	cmp r2, #3
	bne _0225BE92
	movs r0, #0
	pop {r4, r5}
	bx lr
_0225BE92:
	cmp r3, #0
	bne _0225BE9C
	movs r0, #0
	mvns r0, r0
	b _0225BE9E
_0225BE9C:
	movs r0, #1
_0225BE9E:
	ldrb r2, [r1]
	cmp r2, #0
	beq _0225BEAA
	cmp r2, #1
	beq _0225BEDC
	b _0225BF1E
_0225BEAA:
	movs r3, #2
	ldrsh r5, [r1, r3]
	lsls r2, r3, #8
	adds r2, r5, r2
	strh r2, [r1, #2]
	ldrsh r5, [r1, r3]
	lsls r2, r3, #0xa
	cmp r5, r2
	blt _0225BEC4
	strh r2, [r1, #2]
	ldrb r2, [r1]
	adds r2, r2, #1
	strb r2, [r1]
_0225BEC4:
	movs r2, #0x1d
	movs r3, #1
	lsls r2, r2, #6
	strb r3, [r4, r2]
	movs r3, #2
	ldrsh r1, [r1, r3]
	asrs r1, r1, #8
	adds r3, r1, #0
	muls r3, r0, r3
	adds r0, r2, #2
	strh r3, [r4, r0]
	b _0225BF28
_0225BEDC:
	movs r3, #2
	ldrsh r5, [r1, r3]
	lsls r2, r3, #8
	subs r2, r5, r2
	strh r2, [r1, #2]
	ldrsh r2, [r1, r3]
	cmp r2, #0
	bgt _0225BF06
	movs r3, #0
	strh r3, [r1, #2]
	ldrb r2, [r1, #1]
	adds r2, r2, #1
	strb r2, [r1, #1]
	ldrb r2, [r1, #1]
	cmp r2, #2
	bhs _0225BF00
	strb r3, [r1]
	b _0225BF06
_0225BF00:
	ldrb r2, [r1]
	adds r2, r2, #1
	strb r2, [r1]
_0225BF06:
	movs r2, #0x1d
	movs r3, #1
	lsls r2, r2, #6
	strb r3, [r4, r2]
	movs r3, #2
	ldrsh r1, [r1, r3]
	asrs r1, r1, #8
	adds r3, r1, #0
	muls r3, r0, r3
	adds r0, r2, #2
	strh r3, [r4, r0]
	b _0225BF28
_0225BF1E:
	ldr r1, _0225BF30 @ =0x0000073E
	movs r0, #1
	strb r0, [r4, r1]
	pop {r4, r5}
	bx lr
_0225BF28:
	movs r0, #0
	pop {r4, r5}
	bx lr
	nop
_0225BF30: .4byte 0x0000073E
	thumb_func_end ov89_0225BE84

	thumb_func_start ov89_0225BF34
ov89_0225BF34: @ 0x0225BF34
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldrb r0, [r4, #6]
	adds r5, r2, #0
	cmp r0, #3
	bhi _0225BFD2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225BF4C: @ jump table
	.2byte _0225BF54 - _0225BF4C - 2 @ case 0
	.2byte _0225BF68 - _0225BF4C - 2 @ case 1
	.2byte _0225BF8A - _0225BF4C - 2 @ case 2
	.2byte _0225BFA4 - _0225BF4C - 2 @ case 3
_0225BF54:
	adds r0, r5, #0
	bl FUN_02023614
	str r0, [r4]
	ldrb r0, [r4, #6]
	adds r0, r0, #1
	strb r0, [r4, #6]
	ldr r0, _0225BFD8 @ =0x000005D5
	bl FUN_0200604C
_0225BF68:
	ldr r0, _0225BFDC @ =0xFFFFE556
	adds r1, r5, #0
	bl FUN_020235FC
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #4]
	ldrsh r0, [r4, r0]
	cmp r0, #0x1e
	blt _0225BFD2
	movs r0, #0
	strh r0, [r4, #4]
	ldrb r0, [r4, #6]
	adds r0, r0, #1
	strb r0, [r4, #6]
	b _0225BFD2
_0225BF8A:
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #4]
	ldrsh r0, [r4, r0]
	cmp r0, #4
	ble _0225BFD2
	movs r0, #0
	strh r0, [r4, #4]
	ldrb r0, [r4, #6]
	adds r0, r0, #1
	strb r0, [r4, #6]
	b _0225BFD2
_0225BFA4:
	ldr r0, _0225BFE0 @ =0x00008555
	adds r1, r5, #0
	bl FUN_020235FC
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #4]
	ldrsh r0, [r4, r0]
	cmp r0, #6
	bge _0225BFC6
	adds r0, r5, #0
	bl FUN_02023614
	ldr r1, [r4]
	cmp r0, r1
	blt _0225BFD2
_0225BFC6:
	ldr r0, [r4]
	adds r1, r5, #0
	bl FUN_020235D4
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225BFD2:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0225BFD8: .4byte 0x000005D5
_0225BFDC: .4byte 0xFFFFE556
_0225BFE0: .4byte 0x00008555
	thumb_func_end ov89_0225BF34

	thumb_func_start ov89_0225BFE4
ov89_0225BFE4: @ 0x0225BFE4
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r5, #8
	ldrb r0, [r5, #0xc]
	adds r4, r2, #0
	cmp r0, #0
	beq _0225BFF8
	cmp r0, #1
	beq _0225C004
	b _0225C082
_0225BFF8:
	ldr r0, _0225C08C @ =0x000005D5
	bl FUN_0200604C
	ldrb r0, [r5, #0xc]
	adds r0, r0, #1
	strb r0, [r5, #0xc]
_0225C004:
	ldrb r0, [r5, #0xd]
	movs r1, #2
	lsls r1, r1, #0xc
	adds r0, r0, #1
	strb r0, [r5, #0xd]
	ldrb r0, [r5, #0xd]
	lsls r0, r0, #0xa
	cmp r0, r1
	bge _0225C01C
	lsrs r1, r1, #1
	subs r1, r1, r0
	b _0225C022
_0225C01C:
	movs r1, #3
	lsls r1, r1, #0xc
	subs r1, r0, r1
_0225C022:
	movs r2, #1
	lsls r2, r2, #0xc
	str r1, [r5, #4]
	cmp r0, r2
	bge _0225C030
	str r0, [r5]
	b _0225C054
_0225C030:
	lsls r1, r2, #1
	cmp r0, r1
	bge _0225C03C
	subs r0, r1, r0
	str r0, [r5]
	b _0225C054
_0225C03C:
	movs r1, #3
	lsls r1, r1, #0xc
	cmp r0, r1
	bge _0225C04E
	lsls r1, r2, #1
	subs r0, r0, r1
	rsbs r0, r0, #0
	str r0, [r5]
	b _0225C054
_0225C04E:
	lsls r1, r2, #2
	subs r0, r0, r1
	str r0, [r5]
_0225C054:
	ldrb r0, [r5, #0xd]
	cmp r0, #0x10
	blo _0225C078
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [r5, #4]
	movs r0, #0
	str r0, [r5]
	strb r0, [r5, #0xd]
	ldrb r0, [r5, #0xe]
	adds r0, r0, #1
	strb r0, [r5, #0xe]
	ldrb r0, [r5, #0xe]
	cmp r0, #2
	blo _0225C078
	ldrb r0, [r5, #0xc]
	adds r0, r0, #1
	strb r0, [r5, #0xc]
_0225C078:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02023204
	b _0225C086
_0225C082:
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225C086:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0225C08C: .4byte 0x000005D5
	thumb_func_end ov89_0225BFE4

	thumb_func_start ov89_0225C090
ov89_0225C090: @ 0x0225C090
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	add r0, sp, #8
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	adds r4, #0x18
	strh r1, [r0, #6]
	ldrb r1, [r4, #0xe]
	adds r5, r2, #0
	cmp r1, #3
	bhi _0225C15E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225C0B8: @ jump table
	.2byte _0225C0C0 - _0225C0B8 - 2 @ case 0
	.2byte _0225C0EA - _0225C0B8 - 2 @ case 1
	.2byte _0225C11A - _0225C0B8 - 2 @ case 2
	.2byte _0225C130 - _0225C0B8 - 2 @ case 3
_0225C0C0:
	add r0, sp, #0
	adds r1, r5, #0
	bl FUN_02023618
	add r0, sp, #0
	ldrh r1, [r0]
	strh r1, [r4]
	ldrh r1, [r0, #2]
	strh r1, [r4, #2]
	ldrh r1, [r0, #4]
	strh r1, [r4, #4]
	ldrh r0, [r0, #6]
	strh r0, [r4, #6]
	ldrh r0, [r4, #2]
	str r0, [r4, #8]
	ldrb r0, [r4, #0xe]
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	ldr r0, _0225C164 @ =0x000005D5
	bl FUN_0200604C
_0225C0EA:
	add r1, sp, #0
	ldrh r2, [r1, #0xa]
	movs r0, #1
	lsls r0, r0, #0xc
	subs r2, r2, r0
	strh r2, [r1, #0xa]
	ldr r1, [r4, #8]
	subs r0, r1, r0
	str r0, [r4, #8]
	add r0, sp, #8
	adds r1, r5, #0
	bl FUN_020235A8
	movs r0, #2
	ldrh r1, [r4, #2]
	lsls r0, r0, #0xc
	ldr r2, [r4, #8]
	subs r0, r1, r0
	cmp r2, r0
	bgt _0225C15E
	ldrb r0, [r4, #0xe]
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	b _0225C15E
_0225C11A:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #0xc]
	ldrsh r0, [r4, r0]
	cmp r0, #0x10
	blt _0225C15E
	ldrb r0, [r4, #0xe]
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	b _0225C15E
_0225C130:
	add r2, sp, #0
	ldrh r3, [r2, #0xa]
	movs r1, #2
	lsls r1, r1, #8
	adds r3, r3, r1
	strh r3, [r2, #0xa]
	ldr r2, [r4, #8]
	adds r1, r2, r1
	str r1, [r4, #8]
	adds r1, r5, #0
	bl FUN_020235A8
	ldrh r0, [r4, #2]
	ldr r1, [r4, #8]
	cmp r1, r0
	blt _0225C15E
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_02023558
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225C15E:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225C164: .4byte 0x000005D5
	thumb_func_end ov89_0225C090

	thumb_func_start ov89_0225C168
ov89_0225C168: @ 0x0225C168
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	add r0, sp, #8
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	adds r4, #0x28
	strh r1, [r0, #6]
	ldrb r1, [r4, #0xe]
	adds r5, r2, #0
	cmp r1, #3
	bhi _0225C236
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225C190: @ jump table
	.2byte _0225C198 - _0225C190 - 2 @ case 0
	.2byte _0225C1C2 - _0225C190 - 2 @ case 1
	.2byte _0225C1F2 - _0225C190 - 2 @ case 2
	.2byte _0225C208 - _0225C190 - 2 @ case 3
_0225C198:
	add r0, sp, #0
	adds r1, r5, #0
	bl FUN_02023618
	add r0, sp, #0
	ldrh r1, [r0]
	strh r1, [r4]
	ldrh r1, [r0, #2]
	strh r1, [r4, #2]
	ldrh r1, [r0, #4]
	strh r1, [r4, #4]
	ldrh r0, [r0, #6]
	strh r0, [r4, #6]
	ldrh r0, [r4, #2]
	str r0, [r4, #8]
	ldrb r0, [r4, #0xe]
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	ldr r0, _0225C23C @ =0x000005D5
	bl FUN_0200604C
_0225C1C2:
	add r1, sp, #0
	ldrh r2, [r1, #0xa]
	movs r0, #1
	lsls r0, r0, #0xc
	adds r2, r2, r0
	strh r2, [r1, #0xa]
	ldr r1, [r4, #8]
	adds r0, r1, r0
	str r0, [r4, #8]
	add r0, sp, #8
	adds r1, r5, #0
	bl FUN_020235A8
	movs r0, #2
	ldrh r1, [r4, #2]
	lsls r0, r0, #0xc
	ldr r2, [r4, #8]
	adds r0, r1, r0
	cmp r2, r0
	blt _0225C236
	ldrb r0, [r4, #0xe]
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	b _0225C236
_0225C1F2:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #0xc]
	ldrsh r0, [r4, r0]
	cmp r0, #0x10
	blt _0225C236
	ldrb r0, [r4, #0xe]
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	b _0225C236
_0225C208:
	add r2, sp, #0
	ldrh r3, [r2, #0xa]
	movs r1, #2
	lsls r1, r1, #8
	subs r3, r3, r1
	strh r3, [r2, #0xa]
	ldr r2, [r4, #8]
	subs r1, r2, r1
	str r1, [r4, #8]
	adds r1, r5, #0
	bl FUN_020235A8
	ldrh r0, [r4, #2]
	ldr r1, [r4, #8]
	cmp r1, r0
	bgt _0225C236
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_02023558
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225C236:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225C23C: .4byte 0x000005D5
	thumb_func_end ov89_0225C168

	thumb_func_start ov89_0225C240
ov89_0225C240: @ 0x0225C240
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	add r0, sp, #8
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	adds r4, #0x38
	strh r1, [r0, #6]
	ldrb r1, [r4, #0xe]
	adds r5, r2, #0
	cmp r1, #3
	bhi _0225C30C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225C268: @ jump table
	.2byte _0225C270 - _0225C268 - 2 @ case 0
	.2byte _0225C29A - _0225C268 - 2 @ case 1
	.2byte _0225C2C8 - _0225C268 - 2 @ case 2
	.2byte _0225C2DE - _0225C268 - 2 @ case 3
_0225C270:
	add r0, sp, #0
	adds r1, r5, #0
	bl FUN_02023618
	add r0, sp, #0
	ldrh r1, [r0]
	strh r1, [r4]
	ldrh r1, [r0, #2]
	strh r1, [r4, #2]
	ldrh r1, [r0, #4]
	strh r1, [r4, #4]
	ldrh r0, [r0, #6]
	strh r0, [r4, #6]
	ldrh r0, [r4]
	str r0, [r4, #8]
	ldr r0, _0225C314 @ =0x000005D5
	bl FUN_0200604C
	ldrb r0, [r4, #0xe]
	adds r0, r0, #1
	strb r0, [r4, #0xe]
_0225C29A:
	add r1, sp, #0
	ldrh r2, [r1, #8]
	ldr r0, _0225C318 @ =0x00000AAA
	adds r2, r2, r0
	strh r2, [r1, #8]
	ldr r1, [r4, #8]
	adds r0, r1, r0
	str r0, [r4, #8]
	add r0, sp, #8
	adds r1, r5, #0
	bl FUN_020235A8
	movs r0, #2
	ldrh r1, [r4]
	lsls r0, r0, #0xc
	ldr r2, [r4, #8]
	adds r0, r1, r0
	cmp r2, r0
	blt _0225C30C
	ldrb r0, [r4, #0xe]
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	b _0225C30C
_0225C2C8:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #0xc]
	ldrsh r0, [r4, r0]
	cmp r0, #0x10
	blt _0225C30C
	ldrb r0, [r4, #0xe]
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	b _0225C30C
_0225C2DE:
	add r2, sp, #0
	ldrh r3, [r2, #8]
	movs r1, #2
	lsls r1, r1, #8
	subs r3, r3, r1
	strh r3, [r2, #8]
	ldr r2, [r4, #8]
	subs r1, r2, r1
	str r1, [r4, #8]
	adds r1, r5, #0
	bl FUN_020235A8
	ldrh r0, [r4]
	ldr r1, [r4, #8]
	cmp r1, r0
	bgt _0225C30C
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_02023558
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225C30C:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0225C314: .4byte 0x000005D5
_0225C318: .4byte 0x00000AAA
	thumb_func_end ov89_0225C240

	thumb_func_start ov89_0225C31C
ov89_0225C31C: @ 0x0225C31C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r1, #0
	add r1, sp, #8
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	adds r4, #0x48
	strh r0, [r1, #6]
	ldrb r0, [r4, #0xd]
	adds r5, r2, #0
	cmp r0, #0
	beq _0225C33E
	cmp r0, #1
	beq _0225C364
	b _0225C3D6
_0225C33E:
	add r0, sp, #0
	adds r1, r5, #0
	bl FUN_02023618
	add r0, sp, #0
	ldrh r1, [r0]
	strh r1, [r4]
	ldrh r1, [r0, #2]
	strh r1, [r4, #2]
	ldrh r1, [r0, #4]
	strh r1, [r4, #4]
	ldrh r0, [r0, #6]
	strh r0, [r4, #6]
	ldrb r0, [r4, #0xd]
	adds r0, r0, #1
	strb r0, [r4, #0xd]
	ldr r0, _0225C3E4 @ =0x000005D5
	bl FUN_0200604C
_0225C364:
	movs r1, #6
	ldr r2, [r4, #8]
	lsls r1, r1, #0xe
	adds r2, r2, r1
	movs r1, #0x5a
	adds r0, r4, #0
	lsls r1, r1, #0xe
	adds r0, #8
	str r2, [r4, #8]
	cmp r2, r1
	blt _0225C396
	ldr r2, [r0]
	subs r1, r2, r1
	str r1, [r0]
	ldrb r0, [r4, #0xc]
	adds r0, r0, #1
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0xc]
	cmp r0, #2
	blo _0225C396
	ldrb r0, [r4, #0xd]
	adds r0, r0, #1
	strb r0, [r4, #0xd]
	movs r0, #0
	str r0, [r4, #8]
_0225C396:
	ldr r0, [r4, #8]
	bl FUN_0201FD14
	ldrh r2, [r4]
	add r1, sp, #0
	lsls r6, r0, #0xc
	strh r2, [r1, #8]
	ldrh r2, [r4, #2]
	add r3, sp, #8
	strh r2, [r1, #0xa]
	ldrh r2, [r4, #4]
	strh r2, [r1, #0xc]
	ldrh r2, [r4, #6]
	lsrs r4, r0, #0x14
	strh r2, [r1, #0xe]
	asrs r2, r0, #0x1f
	lsls r2, r2, #0xc
	movs r0, #2
	orrs r2, r4
	movs r4, #0
	lsls r0, r0, #0xa
	adds r6, r6, r0
	adcs r2, r4
	lsls r0, r2, #0x14
	lsrs r2, r6, #0xc
	orrs r2, r0
	strh r2, [r1, #0xa]
	adds r0, r3, #0
	adds r1, r5, #0
	bl FUN_02023534
	b _0225C3DC
_0225C3D6:
	add sp, #0x10
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225C3DC:
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0225C3E4: .4byte 0x000005D5
	thumb_func_end ov89_0225C31C

	thumb_func_start ov89_0225C3E8
ov89_0225C3E8: @ 0x0225C3E8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r4, #0x58
	ldrb r0, [r4, #6]
	adds r5, r2, #0
	cmp r0, #3
	bhi _0225C488
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225C402: @ jump table
	.2byte _0225C40A - _0225C402 - 2 @ case 0
	.2byte _0225C41E - _0225C402 - 2 @ case 1
	.2byte _0225C440 - _0225C402 - 2 @ case 2
	.2byte _0225C45A - _0225C402 - 2 @ case 3
_0225C40A:
	adds r0, r5, #0
	bl FUN_02023614
	str r0, [r4]
	ldrb r0, [r4, #6]
	adds r0, r0, #1
	strb r0, [r4, #6]
	ldr r0, _0225C48C @ =0x000005D5
	bl FUN_0200604C
_0225C41E:
	ldr r0, _0225C490 @ =0x00001AAA
	adds r1, r5, #0
	bl FUN_020235FC
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #4]
	ldrsh r0, [r4, r0]
	cmp r0, #0x1e
	blt _0225C488
	movs r0, #0
	strh r0, [r4, #4]
	ldrb r0, [r4, #6]
	adds r0, r0, #1
	strb r0, [r4, #6]
	b _0225C488
_0225C440:
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #4]
	ldrsh r0, [r4, r0]
	cmp r0, #4
	ble _0225C488
	movs r0, #0
	strh r0, [r4, #4]
	ldrb r0, [r4, #6]
	adds r0, r0, #1
	strb r0, [r4, #6]
	b _0225C488
_0225C45A:
	ldr r0, _0225C494 @ =0xFFFF7AAB
	adds r1, r5, #0
	bl FUN_020235FC
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #4]
	ldrsh r0, [r4, r0]
	cmp r0, #6
	bge _0225C47C
	adds r0, r5, #0
	bl FUN_02023614
	ldr r1, [r4]
	cmp r0, r1
	bgt _0225C488
_0225C47C:
	ldr r0, [r4]
	adds r1, r5, #0
	bl FUN_020235D4
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225C488:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225C48C: .4byte 0x000005D5
_0225C490: .4byte 0x00001AAA
_0225C494: .4byte 0xFFFF7AAB
	thumb_func_end ov89_0225C3E8

	thumb_func_start ov89_0225C498
ov89_0225C498: @ 0x0225C498
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r1, #0
	add r1, sp, #0x18
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	adds r4, #0x60
	str r0, [r1, #8]
	ldrb r0, [r4, #0x1d]
	adds r5, r2, #0
	cmp r0, #0
	beq _0225C4B8
	cmp r0, #1
	beq _0225C4EE
	b _0225C55E
_0225C4B8:
	add r0, sp, #0xc
	adds r1, r5, #0
	bl FUN_02023640
	add r3, sp, #0xc
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	adds r2, #0xc
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r1, r5, #0
	str r0, [r2]
	add r0, sp, #0
	bl FUN_02023630
	add r3, sp, #0
	ldm r3!, {r0, r1}
	adds r2, r4, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldrb r0, [r4, #0x1d]
	adds r0, r0, #1
	strb r0, [r4, #0x1d]
	ldr r0, _0225C56C @ =0x000005D5
	bl FUN_0200604C
_0225C4EE:
	movs r1, #2
	ldr r2, [r4, #0x18]
	lsls r1, r1, #0x10
	adds r2, r2, r1
	movs r1, #0x5a
	adds r0, r4, #0
	lsls r1, r1, #0xe
	adds r0, #0x18
	str r2, [r4, #0x18]
	cmp r2, r1
	blt _0225C520
	ldr r2, [r0]
	subs r1, r2, r1
	str r1, [r0]
	ldrb r0, [r4, #0x1c]
	adds r0, r0, #1
	strb r0, [r4, #0x1c]
	ldrb r0, [r4, #0x1c]
	cmp r0, #4
	blo _0225C520
	ldrb r0, [r4, #0x1d]
	adds r0, r0, #1
	strb r0, [r4, #0x1d]
	movs r0, #0
	str r0, [r4, #0x18]
_0225C520:
	ldr r0, [r4, #0x18]
	bl FUN_0201FD14
	asrs r1, r0, #0x1f
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsls r3, r0, #0x10
	movs r0, #2
	orrs r1, r2
	movs r2, #0
	lsls r0, r0, #0xa
	adds r3, r3, r0
	adcs r1, r2
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	orrs r1, r0
	str r1, [sp, #0x18]
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_0202365C
	adds r4, #0xc
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_0202366C
	add r0, sp, #0x18
	adds r1, r5, #0
	bl FUN_02023514
	b _0225C564
_0225C55E:
	add sp, #0x24
	movs r0, #1
	pop {r4, r5, pc}
_0225C564:
	movs r0, #0
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_0225C56C: .4byte 0x000005D5
	thumb_func_end ov89_0225C498

	thumb_func_start ov89_0225C570
ov89_0225C570: @ 0x0225C570
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r1, #0
	add r1, sp, #0x18
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	adds r4, #0x80
	str r0, [r1, #8]
	ldrb r0, [r4, #0x1d]
	adds r5, r2, #0
	cmp r0, #0
	beq _0225C590
	cmp r0, #1
	beq _0225C5C6
	b _0225C636
_0225C590:
	add r0, sp, #0xc
	adds r1, r5, #0
	bl FUN_02023640
	add r3, sp, #0xc
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	adds r2, #0xc
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r1, r5, #0
	str r0, [r2]
	add r0, sp, #0
	bl FUN_02023630
	add r3, sp, #0
	ldm r3!, {r0, r1}
	adds r2, r4, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldrb r0, [r4, #0x1d]
	adds r0, r0, #1
	strb r0, [r4, #0x1d]
	ldr r0, _0225C644 @ =0x000005D5
	bl FUN_0200604C
_0225C5C6:
	movs r1, #2
	ldr r2, [r4, #0x18]
	lsls r1, r1, #0x10
	adds r2, r2, r1
	movs r1, #0x5a
	adds r0, r4, #0
	lsls r1, r1, #0xe
	adds r0, #0x18
	str r2, [r4, #0x18]
	cmp r2, r1
	blt _0225C5F8
	ldr r2, [r0]
	subs r1, r2, r1
	str r1, [r0]
	ldrb r0, [r4, #0x1c]
	adds r0, r0, #1
	strb r0, [r4, #0x1c]
	ldrb r0, [r4, #0x1c]
	cmp r0, #4
	blo _0225C5F8
	ldrb r0, [r4, #0x1d]
	adds r0, r0, #1
	strb r0, [r4, #0x1d]
	movs r0, #0
	str r0, [r4, #0x18]
_0225C5F8:
	ldr r0, [r4, #0x18]
	bl FUN_0201FD14
	asrs r1, r0, #0x1f
	lsrs r2, r0, #0x11
	lsls r1, r1, #0xf
	lsls r3, r0, #0xf
	movs r0, #2
	orrs r1, r2
	movs r2, #0
	lsls r0, r0, #0xa
	adds r3, r3, r0
	adcs r1, r2
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	orrs r1, r0
	str r1, [sp, #0x1c]
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_0202365C
	adds r4, #0xc
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_0202366C
	add r0, sp, #0x18
	adds r1, r5, #0
	bl FUN_02023514
	b _0225C63C
_0225C636:
	add sp, #0x24
	movs r0, #1
	pop {r4, r5, pc}
_0225C63C:
	movs r0, #0
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_0225C644: .4byte 0x000005D5
	thumb_func_end ov89_0225C570

	thumb_func_start ov89_0225C648
ov89_0225C648: @ 0x0225C648
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	add r0, sp, #8
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	adds r4, #0xa0
	strh r1, [r0, #6]
	ldrb r1, [r4, #0xe]
	adds r5, r2, #0
	cmp r1, #3
	bhi _0225C714
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225C670: @ jump table
	.2byte _0225C678 - _0225C670 - 2 @ case 0
	.2byte _0225C6A2 - _0225C670 - 2 @ case 1
	.2byte _0225C6D0 - _0225C670 - 2 @ case 2
	.2byte _0225C6E6 - _0225C670 - 2 @ case 3
_0225C678:
	add r0, sp, #0
	adds r1, r5, #0
	bl FUN_02023618
	add r0, sp, #0
	ldrh r1, [r0]
	strh r1, [r4]
	ldrh r1, [r0, #2]
	strh r1, [r4, #2]
	ldrh r1, [r0, #4]
	strh r1, [r4, #4]
	ldrh r0, [r0, #6]
	strh r0, [r4, #6]
	ldrh r0, [r4]
	str r0, [r4, #8]
	ldrb r0, [r4, #0xe]
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	ldr r0, _0225C71C @ =0x000005D5
	bl FUN_0200604C
_0225C6A2:
	add r1, sp, #0
	ldrh r2, [r1, #8]
	ldr r0, _0225C720 @ =0x00000AAA
	subs r2, r2, r0
	strh r2, [r1, #8]
	ldr r1, [r4, #8]
	subs r0, r1, r0
	str r0, [r4, #8]
	add r0, sp, #8
	adds r1, r5, #0
	bl FUN_020235A8
	movs r0, #2
	ldrh r1, [r4]
	lsls r0, r0, #0xc
	ldr r2, [r4, #8]
	subs r0, r1, r0
	cmp r2, r0
	bgt _0225C714
	ldrb r0, [r4, #0xe]
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	b _0225C714
_0225C6D0:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #0xc]
	ldrsh r0, [r4, r0]
	cmp r0, #0x10
	blt _0225C714
	ldrb r0, [r4, #0xe]
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	b _0225C714
_0225C6E6:
	add r2, sp, #0
	ldrh r3, [r2, #8]
	movs r1, #2
	lsls r1, r1, #8
	adds r3, r3, r1
	strh r3, [r2, #8]
	ldr r2, [r4, #8]
	adds r1, r2, r1
	str r1, [r4, #8]
	adds r1, r5, #0
	bl FUN_020235A8
	ldrh r0, [r4]
	ldr r1, [r4, #8]
	cmp r1, r0
	blt _0225C714
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_02023558
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225C714:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0225C71C: .4byte 0x000005D5
_0225C720: .4byte 0x00000AAA
	thumb_func_end ov89_0225C648

	thumb_func_start ov89_0225C724
ov89_0225C724: @ 0x0225C724
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x40]
	str r1, [sp, #0x14]
	adds r4, r2, #0
	str r3, [sp, #0x18]
	bl FUN_0222EC7C
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _0225C80A
	ldr r0, [sp, #0x40]
	bl FUN_0222EC68
	movs r1, #0
	mvns r1, r1
	str r0, [sp, #0x24]
	cmp r0, r1
	beq _0225C80A
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	bl FUN_0222A578
	adds r7, r0, #0
	beq _0225C80A
	cmp r5, #8
	blo _0225C768
	bl GF_AssertFail
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
_0225C768:
	movs r0, #0x7d
	bl FUN_02028ED0
	adds r6, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x7d
	bl FUN_0222A844
	adds r0, r6, #0
	movs r1, #0x7d
	bl FUN_02028F68
	str r0, [sp, #0x1c]
	adds r0, r6, #0
	bl FUN_02028F94
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x1c]
	movs r1, #0
	bl FUN_0200BE3C
	ldr r0, [sp, #0x10]
	movs r1, #0
	bl FUN_0200BBA0
	str r0, [sp, #0x20]
	movs r0, #0x40
	movs r1, #0x7d
	bl FUN_02026354
	adds r7, r0, #0
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x20]
	adds r1, r7, #0
	bl FUN_0200CBBC
	lsls r5, r5, #4
	adds r0, r4, r5
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	bl FUN_0222AB28
	cmp r0, #1
	bne _0225C7D6
	ldr r0, _0225C810 @ =0x00070800
	b _0225C7D8
_0225C7D6:
	ldr r0, _0225C814 @ =0x00010200
_0225C7D8:
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, r5
	adds r2, r7, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, r5
	bl FUN_0201D578
	ldr r0, [sp, #0x1c]
	bl FUN_02026380
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_0201AB0C
_0225C80A:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225C810: .4byte 0x00070800
_0225C814: .4byte 0x00010200
	thumb_func_end ov89_0225C724

	thumb_func_start ov89_0225C818
ov89_0225C818: @ 0x0225C818
	push {r3, lr}
	cmp r1, #8
	blo _0225C824
	bl GF_AssertFail
	pop {r3, pc}
_0225C824:
	lsls r1, r1, #4
	adds r0, r0, r1
	bl FUN_0201D8C8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov89_0225C818

	thumb_func_start ov89_0225C830
ov89_0225C830: @ 0x0225C830
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	movs r1, #9
	blx FUN_020F2BA4
	lsls r2, r1, #2
	ldr r0, _0225C848 @ =0x0225CE70
	lsls r1, r4, #1
	adds r0, r0, r2
	ldrh r0, [r1, r0]
	pop {r4, pc}
	.align 2, 0
_0225C848: .4byte 0x0225CE70
	thumb_func_end ov89_0225C830

	thumb_func_start ov89_0225C84C
ov89_0225C84C: @ 0x0225C84C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0225C888 @ =0x0225CE50
	adds r6, r1, #0
	movs r4, #0xff
	bl FUN_02025224
	cmp r0, #6
	bge _0225C87A
	cmp r6, r0
	beq _0225C884
	movs r1, #0xc
	muls r1, r0, r1
	adds r1, r5, r1
	ldrh r2, [r1, #2]
	cmp r2, #0
	beq _0225C884
	adds r1, r4, #0
	adds r1, #0xee
	cmp r2, r1
	bhi _0225C884
	adds r4, r0, #0
	b _0225C884
_0225C87A:
	bne _0225C880
	movs r4, #0xfe
	b _0225C884
_0225C880:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_0225C884:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225C888: .4byte 0x0225CE50
	thumb_func_end ov89_0225C84C

	thumb_func_start ov89_0225C88C
ov89_0225C88C: @ 0x0225C88C
	ldr r3, _0225C8B0 @ =0x000001E7
	cmp r0, r3
	bne _0225C89A
	cmp r1, #0
	ble _0225C89A
	movs r0, #0
	bx lr
_0225C89A:
	ldr r1, _0225C8B4 @ =0x000001ED
	cmp r0, r1
	bne _0225C8A8
	cmp r2, #0
	bne _0225C8A8
	movs r0, #0
	bx lr
_0225C8A8:
	lsls r1, r0, #2
	ldr r0, _0225C8B8 @ =0x0225CE94
	ldrb r0, [r0, r1]
	bx lr
	.align 2, 0
_0225C8B0: .4byte 0x000001E7
_0225C8B4: .4byte 0x000001ED
_0225C8B8: .4byte 0x0225CE94
	thumb_func_end ov89_0225C88C

	thumb_func_start ov89_0225C8BC
ov89_0225C8BC: @ 0x0225C8BC
	ldr r2, _0225C8D4 @ =0x000001E7
	cmp r0, r2
	bne _0225C8CA
	cmp r1, #0
	ble _0225C8CA
	movs r0, #2
	bx lr
_0225C8CA:
	lsls r1, r0, #2
	ldr r0, _0225C8D8 @ =0x0225CE95
	ldrb r0, [r0, r1]
	bx lr
	nop
_0225C8D4: .4byte 0x000001E7
_0225C8D8: .4byte 0x0225CE95
	thumb_func_end ov89_0225C8BC

	thumb_func_start ov89_0225C8DC
ov89_0225C8DC: @ 0x0225C8DC
	ldr r3, _0225C8E8 @ =FUN_0222EE50
	adds r2, r0, #0
	ldr r0, _0225C8EC @ =0x0225D64C
	movs r1, #3
	bx r3
	nop
_0225C8E8: .4byte FUN_0222EE50
_0225C8EC: .4byte 0x0225D64C
	thumb_func_end ov89_0225C8DC

	thumb_func_start ov89_0225C8F0
ov89_0225C8F0: @ 0x0225C8F0
	push {r3, lr}
	ldr r2, [r1, #4]
	cmp r2, r0
	bne _0225C8FC
	movs r0, #0
	pop {r3, pc}
_0225C8FC:
	ldr r1, [r1]
	cmp r1, #0
	bne _0225C906
	movs r0, #0
	pop {r3, pc}
_0225C906:
	bl FUN_0222EC7C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0225C916
	movs r0, #1
	pop {r3, pc}
_0225C916:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov89_0225C8F0

	thumb_func_start ov89_0225C91C
ov89_0225C91C: @ 0x0225C91C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0222D844
	cmp r0, #1
	bne _0225C92C
	movs r0, #0
	pop {r4, pc}
_0225C92C:
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0xc
	bl FUN_0222EFAC
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov89_0225C91C

	thumb_func_start ov89_0225C93C
ov89_0225C93C: @ 0x0225C93C
	push {r3, r4, r5, lr}
	adds r4, r3, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov89_02259E48
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov89_0225C8F0
	cmp r0, #0
	beq _0225C95C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov89_0225A148
_0225C95C:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov89_0225C93C

	thumb_func_start ov89_0225C960
ov89_0225C960: @ 0x0225C960
	push {r3, r4, r5, lr}
	adds r4, r3, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov89_02259E48
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov89_0225C8F0
	cmp r0, #0
	beq _0225C986
	adds r0, r5, #0
	bl FUN_0222EC7C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov89_0225A160
_0225C986:
	pop {r3, r4, r5, pc}
	thumb_func_end ov89_0225C960

	thumb_func_start ov89_0225C988
ov89_0225C988: @ 0x0225C988
	push {r4, r5, r6, lr}
	adds r6, r3, #0
	adds r5, r0, #0
	adds r0, r6, #0
	adds r4, r1, #0
	bl ov89_02259E48
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov89_0225C8F0
	cmp r0, #0
	beq _0225C9AC
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl ov89_02259EC4
_0225C9AC:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov89_0225C988

	.rodata

_0225C9B0:
	.byte 0x15, 0x00, 0x35, 0x00, 0x35, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x07, 0x05, 0x16, 0x05
	.byte 0x07, 0x0A, 0x16, 0x0A, 0x07, 0x0F, 0x16, 0x0F, 0x07, 0x14, 0x16, 0x14, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x20, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x48, 0x00, 0x30, 0x00, 0xC0, 0x00, 0x30, 0x00
	.byte 0x48, 0x00, 0x58, 0x00, 0xC0, 0x00, 0x58, 0x00, 0x48, 0x00, 0x80, 0x00, 0xC0, 0x00, 0x80, 0x00
	.byte 0x48, 0x00, 0xA8, 0x00, 0xC0, 0x00, 0xA8, 0x00, 0x20, 0x00, 0x30, 0x00, 0x98, 0x00, 0x30, 0x00
	.byte 0x20, 0x00, 0x58, 0x00, 0x98, 0x00, 0x58, 0x00, 0x20, 0x00, 0x80, 0x00, 0x98, 0x00, 0x80, 0x00
	.byte 0x20, 0x00, 0xA8, 0x00, 0x98, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x19, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0x14, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x1A, 0x27, 0x00, 0x00, 0x14, 0x27, 0x00, 0x00
	.byte 0x15, 0x27, 0x00, 0x00, 0x15, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x35, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x17, 0x27, 0x00, 0x00
	.byte 0x11, 0x27, 0x00, 0x00, 0x12, 0x27, 0x00, 0x00, 0x12, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x17, 0x27, 0x00, 0x00, 0x11, 0x27, 0x00, 0x00, 0x12, 0x27, 0x00, 0x00, 0x12, 0x27, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x11, 0x27, 0x00, 0x00, 0x12, 0x27, 0x00, 0x00, 0x11, 0x27, 0x00, 0x00
	.byte 0x11, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x18, 0x27, 0x00, 0x00, 0x11, 0x27, 0x00, 0x00
	.byte 0x13, 0x27, 0x00, 0x00, 0x13, 0x27, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x04, 0x00, 0x0E, 0x00, 0x04, 0x00
	.byte 0x11, 0x00, 0x04, 0x00, 0x0E, 0x00, 0x04, 0x00, 0x02, 0x00, 0x09, 0x00, 0x0E, 0x00, 0x04, 0x00
	.byte 0x11, 0x00, 0x09, 0x00, 0x0E, 0x00, 0x04, 0x00, 0x02, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x04, 0x00
	.byte 0x11, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x04, 0x00, 0x02, 0x00, 0x13, 0x00, 0x0E, 0x00, 0x04, 0x00
	.byte 0x11, 0x00, 0x13, 0x00, 0x0E, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xFB, 0xFF, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFD, 0xFF
	.byte 0xFF, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0F, 0x3B, 0x02, 0x00, 0x0F, 0xCB, 0x01, 0x00, 0x0F, 0x55, 0x01, 0x00
	.byte 0x0F, 0xE1, 0x00, 0x00, 0x0F, 0x6D, 0x00, 0x00, 0x0F, 0xF7, 0xFF, 0xFF, 0x0F, 0x83, 0xFF, 0xFF
	.byte 0x0F, 0x0F, 0xFF, 0xFF, 0x0F, 0x9B, 0xFE, 0xFF, 0x0F, 0x27, 0xFE, 0xFF, 0x0F, 0xB7, 0xFD, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x35, 0xBF, 0x25, 0x02, 0xE5, 0xBF, 0x25, 0x02, 0x91, 0xC0, 0x25, 0x02
	.byte 0x69, 0xC1, 0x25, 0x02, 0x41, 0xC2, 0x25, 0x02, 0x1D, 0xC3, 0x25, 0x02, 0xE9, 0xC3, 0x25, 0x02
	.byte 0x99, 0xC4, 0x25, 0x02, 0x71, 0xC5, 0x25, 0x02, 0x49, 0xC6, 0x25, 0x02, 0x56, 0xD5, 0xFF, 0xFF
	.byte 0xAA, 0x2A, 0x00, 0x00, 0xAA, 0x2A, 0x00, 0x00, 0x56, 0xD5, 0xFF, 0xFF, 0x00, 0xC0, 0xFF, 0xFF
	.byte 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xC0, 0xFF, 0xFF, 0xAC, 0xAA, 0xFF, 0xFF
	.byte 0x54, 0x55, 0x00, 0x00, 0x54, 0x55, 0x00, 0x00, 0xAC, 0xAA, 0xFF, 0xFF, 0x04, 0x5E, 0xFC, 0xFF
	.byte 0x04, 0xCE, 0xFC, 0xFF, 0x04, 0x3E, 0xFD, 0xFF, 0x04, 0xB6, 0xFD, 0xFF, 0x04, 0x26, 0xFE, 0xFF
	.byte 0x04, 0x9E, 0xFE, 0xFF, 0x04, 0x0E, 0xFF, 0xFF, 0x04, 0x86, 0xFF, 0xFF, 0x04, 0xFC, 0xFF, 0xFF
	.byte 0x04, 0x70, 0x00, 0x00, 0x04, 0xE0, 0x00, 0x00, 0x04, 0x58, 0x01, 0x00, 0x04, 0xC8, 0x01, 0x00
	.byte 0x04, 0x40, 0x02, 0x00, 0x04, 0xB0, 0x02, 0x00, 0x04, 0x28, 0x03, 0x00, 0x04, 0x98, 0x03, 0x00
	.byte 0x11, 0xB0, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x79, 0xB0, 0x25, 0x02, 0x7D, 0xB0, 0x25, 0x02
	.byte 0x01, 0xB1, 0x25, 0x02, 0x49, 0xB1, 0x25, 0x02, 0x65, 0xB1, 0x25, 0x02, 0x99, 0xB2, 0x25, 0x02
	.byte 0xBD, 0xB2, 0x25, 0x02, 0xE9, 0xB2, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x51, 0xB4, 0x25, 0x02
	.byte 0x6D, 0xB4, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x05, 0xB6, 0x25, 0x02, 0x21, 0xB6, 0x25, 0x02
	.byte 0x85, 0xB7, 0x25, 0x02, 0x11, 0xB8, 0x25, 0x02, 0x2D, 0xB8, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0xB9, 0x25, 0x02, 0x1D, 0xB9, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x79, 0xB9, 0x25, 0x02
	.byte 0x95, 0xB9, 0x25, 0x02, 0x29, 0xBB, 0x25, 0x02, 0x89, 0xBB, 0x25, 0x02, 0xB5, 0xBB, 0x25, 0x02
	.byte 0x49, 0xBD, 0x25, 0x02, 0xA9, 0xBD, 0x25, 0x02, 0xD5, 0xBD, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x69, 0xBE, 0x25, 0x02, 0x05, 0x01, 0x05, 0x06, 0x06, 0x04, 0x03, 0x09, 0x07, 0x08, 0x01, 0x05
	.byte 0x03, 0x08, 0x02, 0x0A, 0x04, 0x03, 0x09, 0x07, 0x0A, 0x04, 0x06, 0x01, 0x02, 0x00, 0x00, 0x00
	.byte 0xA0, 0xC0, 0x00, 0x20, 0xA0, 0xC0, 0x20, 0x40, 0xA0, 0xC0, 0x40, 0x60, 0xA0, 0xC0, 0x60, 0x80
	.byte 0xA0, 0xC0, 0x80, 0xA0, 0xA0, 0xC0, 0xA0, 0xC0, 0xA0, 0xC0, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00
	.byte 0x10, 0x42, 0x7B, 0x6F, 0x1A, 0x00, 0x3C, 0x48, 0x21, 0x02, 0x46, 0x17, 0xA0, 0x61, 0x25, 0x73
	.byte 0x7D, 0x01, 0xDE, 0x07, 0x70, 0x3C, 0xD9, 0x79, 0x0C, 0x00, 0x3D, 0x5F, 0x80, 0x3A, 0x00, 0x54
	.byte 0x4A, 0x2D, 0x51, 0x56, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x01, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3D, 0xC9, 0x25, 0x02
	.byte 0x0C, 0x00, 0x00, 0x00, 0x61, 0xC9, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x89, 0xC9, 0x25, 0x02
	.byte 0x0C, 0x00, 0x00, 0x00
	@ 0x0225D664
