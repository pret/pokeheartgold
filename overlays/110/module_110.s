
	thumb_func_start ov110_021E5900
ov110_021E5900: @ 0x021E5900
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r1, [r5]
	adds r6, r0, #0
	cmp r1, #0
	beq _021E5912
	cmp r1, #1
	beq _021E595E
	b _021E596E
_021E5912:
	bl ov110_021E5A24
	movs r2, #2
	movs r0, #3
	movs r1, #0x61
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r1, #0x16
	adds r0, r6, #0
	lsls r1, r1, #4
	movs r2, #0x61
	bl FUN_02007280
	movs r2, #0x16
	movs r1, #0
	lsls r2, r2, #4
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x61
	str r0, [r4]
	adds r0, r6, #0
	bl FUN_020072A4
	movs r1, #0
	str r0, [r4, #0x10]
	movs r0, #0x4a
	adds r2, r1, #0
	bl FUN_02004EC4
	adds r0, r4, #0
	bl ov110_021E5A74
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _021E596E
_021E595E:
	bl FUN_02007290
	bl ov110_021E5AD4
	cmp r0, #0
	beq _021E596E
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E596E:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov110_021E5900

	thumb_func_start ov110_021E5974
ov110_021E5974: @ 0x021E5974
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #8
	bhi _021E59E6
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5990: @ jump table
	.2byte _021E59A2 - _021E5990 - 2 @ case 0
	.2byte _021E59AA - _021E5990 - 2 @ case 1
	.2byte _021E59B2 - _021E5990 - 2 @ case 2
	.2byte _021E59BA - _021E5990 - 2 @ case 3
	.2byte _021E59C2 - _021E5990 - 2 @ case 4
	.2byte _021E59CA - _021E5990 - 2 @ case 5
	.2byte _021E59D2 - _021E5990 - 2 @ case 6
	.2byte _021E59DA - _021E5990 - 2 @ case 7
	.2byte _021E59E2 - _021E5990 - 2 @ case 8
_021E59A2:
	bl ov110_021E5B20
	str r0, [r4]
	b _021E59E6
_021E59AA:
	bl ov110_021E5BB4
	str r0, [r4]
	b _021E59E6
_021E59B2:
	bl ov110_021E5BBC
	str r0, [r4]
	b _021E59E6
_021E59BA:
	bl ov110_021E5BC4
	str r0, [r4]
	b _021E59E6
_021E59C2:
	bl ov110_021E5BCC
	str r0, [r4]
	b _021E59E6
_021E59CA:
	bl ov110_021E5BD4
	str r0, [r4]
	b _021E59E6
_021E59D2:
	bl ov110_021E5BDC
	str r0, [r4]
	b _021E59E6
_021E59DA:
	bl ov110_021E5B68
	str r0, [r4]
	b _021E59E6
_021E59E2:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E59E6:
	adds r5, #0x88
	ldr r0, [r5]
	bl FUN_0200D020
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov110_021E5974

	thumb_func_start ov110_021E59F4
ov110_021E59F4: @ 0x021E59F4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov110_021E5B0C
	cmp r0, #0
	bne _021E5A0A
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E5A0A:
	bl ov110_021E5A24
	adds r0, r4, #0
	bl ov110_021E5AAC
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x61
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov110_021E59F4

	thumb_func_start ov110_021E5A24
ov110_021E5A24: @ 0x021E5A24
	push {r3, lr}
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5A6C @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5A70 @ =0x04001000
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
	pop {r3, pc}
	.align 2, 0
_021E5A6C: .4byte 0xFFFFE0FF
_021E5A70: .4byte 0x04001000
	thumb_func_end ov110_021E5A24

	thumb_func_start ov110_021E5A74
ov110_021E5A74: @ 0x021E5A74
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #8]
	bl FUN_020183F0
	str r0, [r5, #4]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_02028EA8
	adds r4, r0, #0
	bl FUN_0202AD3C
	adds r1, r5, #0
	adds r1, #0x25
	strb r0, [r1]
	adds r0, r4, #0
	bl FUN_0202ADCC
	adds r1, r5, #0
	adds r1, #0x26
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	ldrb r0, [r0, #5]
	strb r0, [r5, #0x19]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov110_021E5A74

	thumb_func_start ov110_021E5AAC
ov110_021E5AAC: @ 0x021E5AAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #4]
	ldr r0, [r0, #8]
	bl FUN_02018410
	adds r0, r4, #0
	adds r0, #0x27
	ldrb r0, [r0]
	cmp r0, #0
	beq _021E5AD2
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_020503D0
	ldrb r1, [r4, #0x19]
	bl FUN_020666D8
_021E5AD2:
	pop {r4, pc}
	thumb_func_end ov110_021E5AAC

	thumb_func_start ov110_021E5AD4
ov110_021E5AD4: @ 0x021E5AD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021E5AE4
	cmp r1, #1
	beq _021E5AF0
	b _021E5B06
_021E5AE4:
	bl ov110_021E5BE4
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _021E5B06
_021E5AF0:
	bl ov110_021E5C3C
	bl FUN_020210BC
	movs r0, #1
	bl FUN_02021148
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021E5B06:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov110_021E5AD4

	thumb_func_start ov110_021E5B0C
ov110_021E5B0C: @ 0x021E5B0C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02021238
	adds r0, r4, #0
	bl ov110_021E5C18
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov110_021E5B0C

	thumb_func_start ov110_021E5B20
ov110_021E5B20: @ 0x021E5B20
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021E5B32
	cmp r0, #1
	beq _021E5B50
	b _021E5B62
_021E5B32:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _021E5B62
_021E5B50:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5B62
	movs r0, #0
	str r0, [r4, #8]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_021E5B62:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov110_021E5B20

	thumb_func_start ov110_021E5B68
ov110_021E5B68: @ 0x021E5B68
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021E5B7A
	cmp r0, #1
	beq _021E5B9A
	b _021E5BAC
_021E5B7A:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _021E5BAC
_021E5B9A:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5BAC
	movs r0, #0
	str r0, [r4, #8]
	add sp, #0xc
	movs r0, #8
	pop {r3, r4, pc}
_021E5BAC:
	movs r0, #7
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov110_021E5B68

	thumb_func_start ov110_021E5BB4
ov110_021E5BB4: @ 0x021E5BB4
	ldr r3, _021E5BB8 @ =ov110_021E5C60
	bx r3
	.align 2, 0
_021E5BB8: .4byte ov110_021E5C60
	thumb_func_end ov110_021E5BB4

	thumb_func_start ov110_021E5BBC
ov110_021E5BBC: @ 0x021E5BBC
	ldr r3, _021E5BC0 @ =ov110_021E5CCC
	bx r3
	.align 2, 0
_021E5BC0: .4byte ov110_021E5CCC
	thumb_func_end ov110_021E5BBC

	thumb_func_start ov110_021E5BC4
ov110_021E5BC4: @ 0x021E5BC4
	ldr r3, _021E5BC8 @ =ov110_021E5E1C
	bx r3
	.align 2, 0
_021E5BC8: .4byte ov110_021E5E1C
	thumb_func_end ov110_021E5BC4

	thumb_func_start ov110_021E5BCC
ov110_021E5BCC: @ 0x021E5BCC
	ldr r3, _021E5BD0 @ =ov110_021E5F84
	bx r3
	.align 2, 0
_021E5BD0: .4byte ov110_021E5F84
	thumb_func_end ov110_021E5BCC

	thumb_func_start ov110_021E5BD4
ov110_021E5BD4: @ 0x021E5BD4
	ldr r3, _021E5BD8 @ =ov110_021E6014
	bx r3
	.align 2, 0
_021E5BD8: .4byte ov110_021E6014
	thumb_func_end ov110_021E5BD4

	thumb_func_start ov110_021E5BDC
ov110_021E5BDC: @ 0x021E5BDC
	ldr r3, _021E5BE0 @ =ov110_021E6070
	bx r3
	.align 2, 0
_021E5BE0: .4byte ov110_021E6070
	thumb_func_end ov110_021E5BDC

	thumb_func_start ov110_021E5BE4
ov110_021E5BE4: @ 0x021E5BE4
	push {r4, lr}
	adds r4, r0, #0
	bl ov110_021E6150
	adds r0, r4, #0
	bl ov110_021E61D0
	adds r0, r4, #0
	bl ov110_021E6394
	adds r0, r4, #0
	bl ov110_021E6580
	adds r0, r4, #0
	bl ov110_021E6618
	adds r0, r4, #0
	bl ov110_021E6730
	ldr r0, _021E5C14 @ =ov110_021E6110
	adds r1, r4, #0
	bl FUN_0201A0FC
	pop {r4, pc}
	.align 2, 0
_021E5C14: .4byte ov110_021E6110
	thumb_func_end ov110_021E5BE4

	thumb_func_start ov110_021E5C18
ov110_021E5C18: @ 0x021E5C18
	push {r4, lr}
	adds r4, r0, #0
	bl ov110_021E6748
	adds r0, r4, #0
	bl ov110_021E6650
	adds r0, r4, #0
	bl ov110_021E65DC
	adds r0, r4, #0
	bl ov110_021E6544
	adds r0, r4, #0
	bl ov110_021E6348
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov110_021E5C18

	thumb_func_start ov110_021E5C3C
ov110_021E5C3C: @ 0x021E5C3C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl ov110_021E6904
	adds r0, r4, #0
	bl ov110_021E6A04
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl FUN_0201EFBC
	ldr r0, [r4, #0x14]
	movs r1, #4
	bl FUN_0201EFBC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov110_021E5C3C

	thumb_func_start ov110_021E5C60
ov110_021E5C60: @ 0x021E5C60
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02025358
	cmp r0, #0
	bne _021E5C70
	movs r0, #1
	pop {r4, pc}
_021E5C70:
	ldr r0, _021E5CBC @ =_021E6D8C
	bl FUN_02025224
	cmp r0, #0
	bne _021E5C8E
	movs r0, #1
	str r0, [r4, #4]
	adds r0, r4, #0
	bl ov110_021E6D20
	ldr r0, _021E5CC0 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #5
	pop {r4, pc}
_021E5C8E:
	ldr r2, _021E5CC4 @ =0x021D114C
	adds r0, r4, #0
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl ov110_021E5D30
	adds r1, r0, #0
	bpl _021E5CA2
	movs r0, #1
	pop {r4, pc}
_021E5CA2:
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov110_021E6C58
	ldr r0, _021E5CC8 @ =0x0000091B
	bl FUN_0200604C
	movs r0, #1
	str r0, [r4, #4]
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
_021E5CBC: .4byte _021E6D8C
_021E5CC0: .4byte 0x000005DC
_021E5CC4: .4byte 0x021D114C
_021E5CC8: .4byte 0x0000091B
	thumb_func_end ov110_021E5C60

	thumb_func_start ov110_021E5CCC
ov110_021E5CCC: @ 0x021E5CCC
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0202534C
	cmp r0, #0
	bne _021E5CE0
	movs r0, #0
	strh r0, [r4, #0xe]
	movs r0, #4
	pop {r4, pc}
_021E5CE0:
	ldrh r1, [r4, #0xe]
	adds r0, r1, #1
	strh r0, [r4, #0xe]
	cmp r1, #2
	blo _021E5D2C
	movs r1, #0x57
	movs r0, #0
	lsls r1, r1, #2
	strh r0, [r4, #0xe]
	ldr r0, [r4, r1]
	movs r3, #3
	ldrb r0, [r0]
	lsls r0, r0, #5
	adds r0, #0x40
	strh r0, [r4, #0x1c]
	ldr r0, [r4, r1]
	ldrb r0, [r0, #1]
	lsls r0, r0, #5
	adds r0, #0x20
	strh r0, [r4, #0x1e]
	ldr r0, [r4, r1]
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x22
	strb r2, [r0]
	ldr r0, [r4, r1]
	ldrb r2, [r0, #1]
	adds r0, r4, #0
	adds r0, #0x23
	strb r2, [r0]
	ldr r2, [r4, r1]
	adds r0, r4, #0
	ldrb r1, [r2]
	ldrb r2, [r2, #1]
	bl ov110_021E6A44
	movs r0, #3
	pop {r4, pc}
_021E5D2C:
	movs r0, #2
	pop {r4, pc}
	thumb_func_end ov110_021E5CCC

	thumb_func_start ov110_021E5D30
ov110_021E5D30: @ 0x021E5D30
	push {r4, r5}
	cmp r1, #0x20
	blo _021E5D3A
	cmp r1, #0xe0
	blo _021E5D42
_021E5D3A:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5}
	bx lr
_021E5D42:
	subs r1, #0x20
	asrs r5, r1, #4
	lsrs r5, r5, #0x1b
	adds r5, r1, r5
	lsls r1, r5, #0xb
	lsls r2, r2, #0xb
	movs r4, #0
	adds r3, r0, #0
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
_021E5D56:
	adds r5, r3, #0
	adds r5, #0xdc
	ldrb r5, [r5]
	cmp r1, r5
	bne _021E5D80
	adds r5, r3, #0
	adds r5, #0xdd
	ldrb r5, [r5]
	cmp r2, r5
	bne _021E5D80
	lsls r1, r4, #3
	adds r0, r0, r1
	adds r0, #0xdf
	ldrb r0, [r0]
	cmp r0, #0
	beq _021E5D7A
	movs r4, #0
	mvns r4, r4
_021E5D7A:
	adds r0, r4, #0
	pop {r4, r5}
	bx lr
_021E5D80:
	adds r4, r4, #1
	adds r3, #8
	cmp r4, #0x10
	blt _021E5D56
	movs r0, #0
	mvns r0, r0
	pop {r4, r5}
	bx lr
	thumb_func_end ov110_021E5D30

	thumb_func_start ov110_021E5D90
ov110_021E5D90: @ 0x021E5D90
	push {r4, r5, r6, r7}
	adds r3, r0, #0
	adds r0, r2, #0
	movs r2, #0
	strb r2, [r1]
	strb r2, [r0]
	movs r4, #0x1c
	ldrsh r5, [r3, r4]
	cmp r5, #0x20
	blt _021E5DA8
	cmp r5, #0xe0
	blt _021E5DAE
_021E5DA8:
	movs r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_021E5DAE:
	subs r5, #0x20
	asrs r4, r5, #4
	lsrs r4, r4, #0x1b
	adds r4, r5, r4
	lsls r4, r4, #0xb
	lsrs r5, r4, #0x10
	movs r4, #0x1e
	ldrsh r6, [r3, r4]
	asrs r4, r6, #4
	lsrs r4, r4, #0x1b
	adds r4, r6, r4
	lsls r4, r4, #0xb
	lsrs r6, r4, #0x10
	ldr r4, _021E5E18 @ =0x021E6D9C
_021E5DCA:
	ldrb r7, [r4]
	cmp r5, r7
	bne _021E5DDC
	ldrb r7, [r4, #1]
	cmp r6, r7
	bne _021E5DDC
	movs r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_021E5DDC:
	adds r2, r2, #1
	adds r4, r4, #2
	cmp r2, #4
	blt _021E5DCA
	ldrb r2, [r3, #0x1b]
	movs r4, #0
_021E5DE8:
	cmp r2, r4
	beq _021E5E06
	adds r7, r3, #0
	adds r7, #0xdc
	ldrb r7, [r7]
	cmp r5, r7
	bne _021E5E06
	adds r7, r3, #0
	adds r7, #0xdd
	ldrb r7, [r7]
	cmp r6, r7
	bne _021E5E06
	movs r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_021E5E06:
	adds r4, r4, #1
	adds r3, #8
	cmp r4, #0x10
	blt _021E5DE8
	strb r5, [r1]
	strb r6, [r0]
	movs r0, #1
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_021E5E18: .4byte 0x021E6D9C
	thumb_func_end ov110_021E5D90

	thumb_func_start ov110_021E5E1C
ov110_021E5E1C: @ 0x021E5E1C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	bl FUN_0202534C
	cmp r0, #0
	bne _021E5ECE
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r2, [r5, r0]
	adds r0, r5, #0
	ldrb r1, [r2]
	ldrb r2, [r2, #1]
	movs r3, #0
	bl ov110_021E6A44
	adds r1, r5, #0
	adds r2, r5, #0
	adds r1, #0x22
	adds r2, #0x23
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r0, r5, #0
	movs r3, #0
	bl ov110_021E6A44
	ldr r0, [r5, #0x14]
	movs r1, #2
	bl FUN_0201EFBC
	adds r0, r5, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E5E8A
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E5E8A
	ldr r0, _021E5F78 @ =0x000005EA
	bl FUN_0200604C
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r3, [r5, r0]
	ldrb r0, [r3, #2]
	str r0, [sp]
	ldrb r2, [r3]
	ldrb r1, [r5, #0x1b]
	ldrb r3, [r3, #1]
	adds r0, r5, #0
	bl ov110_021E6C18
	b _021E5EAE
_021E5E8A:
	ldr r0, _021E5F7C @ =0x0000091B
	bl FUN_0200604C
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r5, #0
	ldrb r0, [r0, #2]
	adds r3, r5, #0
	adds r2, #0x22
	str r0, [sp]
	adds r3, #0x23
	ldrb r1, [r5, #0x1b]
	ldrb r2, [r2]
	ldrb r3, [r3]
	adds r0, r5, #0
	bl ov110_021E6C18
_021E5EAE:
	adds r0, r5, #0
	movs r1, #0xff
	movs r2, #0
	bl ov110_021E6C58
	adds r0, r5, #0
	bl ov110_021E68B4
	cmp r0, #0
	beq _021E5EC8
	add sp, #8
	movs r0, #6
	pop {r4, r5, r6, pc}
_021E5EC8:
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E5ECE:
	ldr r1, _021E5F80 @ =0x021D114C
	movs r0, #0x20
	ldrsh r6, [r1, r0]
	movs r0, #0x22
	ldrsh r4, [r1, r0]
	movs r0, #0x1c
	ldrsh r1, [r5, r0]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x1e
	ldrsh r1, [r5, r0]
	adds r0, r5, #0
	adds r0, #0x21
	strb r1, [r0]
	cmp r4, #0x10
	bge _021E5EF4
	movs r4, #0x10
	b _021E5EFA
_021E5EF4:
	cmp r4, #0xb0
	ble _021E5EFA
	movs r4, #0xb0
_021E5EFA:
	cmp r6, #0x30
	bge _021E5F02
	movs r6, #0x30
	b _021E5F08
_021E5F02:
	cmp r6, #0xd0
	ble _021E5F08
	movs r6, #0xd0
_021E5F08:
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_0200DD88
	movs r0, #0x57
	lsls r0, r0, #2
	subs r1, r6, #2
	subs r2, r4, #2
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r5, r0]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov110_021E6BEC
	add r1, sp, #4
	strh r6, [r5, #0x1c]
	adds r0, r5, #0
	adds r1, #1
	add r2, sp, #4
	strh r4, [r5, #0x1e]
	bl ov110_021E5D90
	adds r0, r5, #0
	add r2, sp, #4
	adds r0, #0x22
	ldrb r1, [r2, #1]
	ldrb r0, [r0]
	cmp r0, r1
	bne _021E5F56
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrb r0, [r2]
	cmp r3, r0
	beq _021E5F70
_021E5F56:
	add r2, sp, #4
	ldrb r2, [r2]
	adds r0, r5, #0
	bl ov110_021E6ABC
	adds r0, r5, #0
	add r1, sp, #4
	ldrb r2, [r1, #1]
	adds r0, #0x22
	adds r5, #0x23
	strb r2, [r0]
	ldrb r0, [r1]
	strb r0, [r5]
_021E5F70:
	movs r0, #3
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E5F78: .4byte 0x000005EA
_021E5F7C: .4byte 0x0000091B
_021E5F80: .4byte 0x021D114C
	thumb_func_end ov110_021E5E1C

	thumb_func_start ov110_021E5F84
ov110_021E5F84: @ 0x021E5F84
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0xc]
	cmp r1, #0
	beq _021E5F98
	cmp r1, #1
	beq _021E5FA6
	cmp r1, #2
	beq _021E5FD4
	b _021E600C
_021E5F98:
	ldr r0, _021E6010 @ =0x0000091C
	bl FUN_0200604C
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E600C
_021E5FA6:
	ldrh r1, [r4, #0xe]
	adds r0, r1, #1
	strh r0, [r4, #0xe]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r3, [r4, r0]
	lsls r1, r1, #0x1b
	lsrs r2, r1, #0x10
	ldrb r1, [r3, #2]
	ldr r0, [r3, #4]
	lsls r1, r1, #0xe
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FUN_02024818
	ldrh r0, [r4, #0xe]
	cmp r0, #8
	blo _021E600C
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E600C
_021E5FD4:
	movs r1, #0x57
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	ldrb r2, [r1, #2]
	adds r2, r2, #1
	lsrs r5, r2, #0x1f
	lsls r3, r2, #0x1e
	subs r3, r3, r5
	movs r2, #0x1e
	rors r3, r2
	adds r2, r5, r3
	strb r2, [r1, #2]
	movs r1, #0xff
	movs r2, #0
	bl ov110_021E6C58
	movs r0, #0
	strh r0, [r4, #0xe]
	strh r0, [r4, #0xc]
	adds r0, r4, #0
	bl ov110_021E68B4
	cmp r0, #0
	beq _021E6008
	movs r0, #6
	pop {r3, r4, r5, pc}
_021E6008:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E600C:
	movs r0, #4
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6010: .4byte 0x0000091C
	thumb_func_end ov110_021E5F84

	thumb_func_start ov110_021E6014
ov110_021E6014: @ 0x021E6014
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0xc]
	cmp r1, #0
	beq _021E6028
	cmp r1, #1
	beq _021E6044
	cmp r1, #2
	beq _021E605E
	b _021E606C
_021E6028:
	ldrb r1, [r4, #0x1a]
	cmp r1, #0
	bne _021E606C
	adds r3, r4, #0
	adds r3, #0x25
	ldrb r3, [r3]
	movs r1, #0
	movs r2, #1
	bl ov110_021E6988
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E606C
_021E6044:
	adds r0, #0x24
	ldrb r0, [r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021E606C
	adds r0, r4, #0
	bl ov110_021E6B38
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E606C
_021E605E:
	bl ov110_021E6B94
	cmp r0, #5
	beq _021E606C
	movs r1, #0
	strh r1, [r4, #0xc]
	pop {r4, pc}
_021E606C:
	movs r0, #5
	pop {r4, pc}
	thumb_func_end ov110_021E6014

	thumb_func_start ov110_021E6070
ov110_021E6070: @ 0x021E6070
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	beq _021E6086
	cmp r0, #1
	beq _021E6094
	cmp r0, #2
	beq _021E60C2
	b _021E60F0
_021E6086:
	ldr r0, _021E6108 @ =0x0000091D
	bl FUN_0200604C
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E6102
_021E6094:
	ldrh r0, [r4, #0xe]
	movs r1, #2
	movs r2, #0x2b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, _021E610C @ =0x00007FFF
	movs r3, #5
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02003E5C
	ldrh r1, [r4, #0xe]
	adds r0, r1, #1
	strh r0, [r4, #0xe]
	cmp r1, #0xf
	blo _021E6102
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E6102
_021E60C2:
	ldrh r0, [r4, #0xe]
	movs r1, #2
	movs r2, #0x2b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, _021E610C @ =0x00007FFF
	movs r3, #5
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02003E5C
	ldrh r1, [r4, #0xe]
	subs r0, r1, #1
	strh r0, [r4, #0xe]
	cmp r1, #0
	bne _021E6102
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E6102
_021E60F0:
	movs r0, #0
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	movs r0, #1
	adds r4, #0x27
	strb r0, [r4]
	add sp, #8
	movs r0, #7
	pop {r4, pc}
_021E6102:
	movs r0, #6
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_021E6108: .4byte 0x0000091D
_021E610C: .4byte 0x00007FFF
	thumb_func_end ov110_021E6070

	thumb_func_start ov110_021E6110
ov110_021E6110: @ 0x021E6110
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _021E6120
	bl FUN_0200398C
_021E6120:
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	cmp r0, #0
	beq _021E612E
	bl FUN_0200D034
_021E612E:
	blx FUN_020B62EC
	ldr r0, [r4, #0x14]
	bl FUN_0201EEB4
	ldr r3, _021E6148 @ =0x027E0000
	ldr r1, _021E614C @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E6148: .4byte 0x027E0000
_021E614C: .4byte 0x00003FF8
	thumb_func_end ov110_021E6110

	thumb_func_start ov110_021E6150
ov110_021E6150: @ 0x021E6150
	push {r4, r5, r6, r7}
	ldrb r1, [r0, #0x19]
	movs r5, #0
	adds r7, r0, #0
	lsls r2, r1, #2
	ldr r1, _021E61AC @ =0x021E7000
	mov ip, r5
	ldr r4, [r1, r2]
	adds r7, #0xdc
_021E6162:
	mov r0, ip
	lsls r0, r0, #0x18
	movs r3, #0
	lsrs r0, r0, #0x18
_021E616A:
	adds r2, r3, r5
	ldrb r1, [r4, r2]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	beq _021E6196
	cmp r1, #0x10
	bhi _021E6196
	subs r1, r1, #1
	lsls r6, r1, #3
	adds r1, r7, r6
	strb r3, [r7, r6]
	strb r0, [r1, #1]
	ldrb r6, [r4, r2]
	lsls r6, r6, #0x19
	lsrs r6, r6, #0x1e
	strb r6, [r1, #2]
	ldrb r2, [r4, r2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1f
	strb r2, [r1, #3]
	movs r2, #0
	str r2, [r1, #4]
_021E6196:
	adds r3, r3, #1
	cmp r3, #6
	blt _021E616A
	mov r0, ip
	adds r0, r0, #1
	adds r5, r5, #6
	mov ip, r0
	cmp r0, #6
	blt _021E6162
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_021E61AC: .4byte 0x021E7000
	thumb_func_end ov110_021E6150

	thumb_func_start ov110_021E61B0
ov110_021E61B0: @ 0x021E61B0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E61CC @ =0x021E6F54
	add r3, sp, #0
	movs r2, #5
_021E61BA:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E61BA
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E61CC: .4byte 0x021E6F54
	thumb_func_end ov110_021E61B0

	thumb_func_start ov110_021E61D0
ov110_021E61D0: @ 0x021E61D0
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	adds r4, r0, #0
	bl ov110_021E61B0
	ldr r0, [r4]
	bl FUN_0201AC88
	add r3, sp, #0xa8
	ldr r5, _021E6324 @ =0x021E6DC0
	str r0, [r4, #0x14]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r2, _021E6328 @ =0x04000304
	ldr r0, _021E632C @ =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r5, _021E6330 @ =0x021E6E34
	add r3, sp, #0x8c
	ands r0, r1
	strh r0, [r2]
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #4
	str r0, [r3]
	ldr r0, [r4, #0x14]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _021E6334 @ =0x021E6E6C
	add r3, sp, #0x70
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
	ldr r0, [r4, #0x14]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #6
	bl FUN_0201CAE0
	ldr r5, _021E6338 @ =0x021E6E88
	add r3, sp, #0x54
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
	ldr r0, [r4, #0x14]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #7
	bl FUN_0201CAE0
	ldr r5, _021E633C @ =0x021E6DFC
	add r3, sp, #0x38
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	movs r1, #0
	ldr r0, [r4, #0x14]
	adds r3, r1, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _021E6340 @ =0x021E6E18
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
	ldr r0, [r4, #0x14]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _021E6344 @ =0x021E6E50
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
	ldr r0, [r4, #0x14]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #3
	bl FUN_0201CAE0
	ldr r3, [r4]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #7
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	movs r0, #0
	ldr r3, [r4]
	movs r1, #0x20
	adds r2, r0, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #3
	movs r1, #0x40
	movs r2, #0
	bl FUN_0201C1C4
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6324: .4byte 0x021E6DC0
_021E6328: .4byte 0x04000304
_021E632C: .4byte 0xFFFF7FFF
_021E6330: .4byte 0x021E6E34
_021E6334: .4byte 0x021E6E6C
_021E6338: .4byte 0x021E6E88
_021E633C: .4byte 0x021E6DFC
_021E6340: .4byte 0x021E6E18
_021E6344: .4byte 0x021E6E50
	thumb_func_end ov110_021E61D0

	thumb_func_start ov110_021E6348
ov110_021E6348: @ 0x021E6348
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #7
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	bl FUN_0201AB0C
	ldr r2, _021E6390 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_021E6390: .4byte 0x04000304
	thumb_func_end ov110_021E6348

	thumb_func_start ov110_021E6394
ov110_021E6394: @ 0x021E6394
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0xac
	bl FUN_02007688
	adds r4, r0, #0
	ldr r0, [r5]
	bl FUN_020030E8
	adds r1, r5, #0
	adds r1, #0x80
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #1
	ldr r0, [r0]
	ldr r3, [r5]
	movs r1, #0
	lsls r2, r2, #8
	bl FUN_02003120
	adds r0, r5, #0
	adds r0, #0x80
	movs r1, #1
	adds r2, r1, #0
	ldr r0, [r0]
	ldr r3, [r5]
	adds r2, #0xff
	bl FUN_02003120
	adds r0, r5, #0
	adds r0, #0x80
	movs r1, #2
	adds r2, r1, #0
	ldr r0, [r0]
	ldr r3, [r5]
	adds r2, #0xfe
	bl FUN_02003120
	movs r1, #0
	movs r0, #1
	str r1, [sp]
	lsls r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r3, [r5]
	adds r1, r4, #0
	movs r2, #0xa
	bl FUN_02003220
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r3, [r5]
	adds r1, r4, #0
	movs r2, #0xa
	bl FUN_02003220
	movs r0, #2
	str r0, [sp]
	adds r0, #0xfe
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	adds r0, r5, #0
	str r2, [sp, #0xc]
	adds r0, #0x80
	ldr r0, [r0]
	ldr r3, [r5]
	adds r1, r4, #0
	bl FUN_02003220
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	adds r0, r4, #0
	movs r3, #7
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0xe
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	adds r0, r4, #0
	movs r3, #7
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0xf
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	adds r0, r4, #0
	movs r3, #6
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	adds r0, r4, #0
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	adds r0, r4, #0
	movs r3, #3
	bl FUN_02007B68
	ldr r0, [r5]
	adds r3, r5, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0
	adds r3, #0xd4
	bl FUN_02007C2C
	adds r1, r5, #0
	adds r1, #0xd8
	str r0, [r1]
	adds r0, r4, #0
	bl FUN_0200770C
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x50
	str r0, [sp, #8]
	adds r2, r5, #0
	adds r2, #0x26
	adds r0, r5, #0
	ldrb r2, [r2]
	adds r0, #0x80
	ldr r0, [r0]
	ldr r3, [r5]
	movs r1, #0x26
	adds r2, #0x1a
	bl FUN_02003200
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r3, [r5]
	movs r1, #0x10
	movs r2, #8
	bl FUN_02003200
	adds r0, r5, #0
	adds r0, #0x26
	ldrb r0, [r0]
	movs r1, #0
	movs r2, #1
	str r0, [sp]
	ldr r0, [r5]
	movs r3, #5
	str r0, [sp, #4]
	ldr r0, [r5, #0x14]
	bl FUN_0200E644
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02003B50
	adds r5, #0x80
	ldr r0, [r5]
	bl FUN_0200398C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov110_021E6394

	thumb_func_start ov110_021E6544
ov110_021E6544: @ 0x021E6544
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xd8
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #2
	bl FUN_02003150
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02003150
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02003150
	adds r4, #0x80
	ldr r0, [r4]
	bl FUN_02003104
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov110_021E6544

	thumb_func_start ov110_021E6580
ov110_021E6580: @ 0x021E6580
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6]
	movs r0, #4
	bl FUN_02002CEC
	ldr r3, [r6]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #2
	bl FUN_0200BAF8
	str r0, [r6, #0x28]
	ldr r2, [r6]
	movs r0, #6
	movs r1, #0x10
	bl FUN_0200BD18
	str r0, [r6, #0x2c]
	ldr r1, [r6]
	movs r0, #0x80
	bl FUN_02026354
	str r0, [r6, #0x30]
	ldr r0, [r6, #0x28]
	movs r1, #0
	bl FUN_0200BBA0
	str r0, [r6, #0x34]
	movs r4, #0
	adds r5, r6, #0
_021E65BE:
	ldr r0, [r6, #0x28]
	adds r1, r4, #1
	bl FUN_0200BBA0
	str r0, [r5, #0x38]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E65BE
	ldr r0, [r6, #0x28]
	movs r1, #5
	bl FUN_0200BBA0
	str r0, [r6, #0x48]
	pop {r4, r5, r6, pc}
	thumb_func_end ov110_021E6580

	thumb_func_start ov110_021E65DC
ov110_021E65DC: @ 0x021E65DC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x48]
	bl FUN_02026380
	movs r4, #0
	adds r5, r6, #0
_021E65EA:
	ldr r0, [r5, #0x38]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E65EA
	ldr r0, [r6, #0x34]
	bl FUN_02026380
	ldr r0, [r6, #0x30]
	bl FUN_02026380
	ldr r0, [r6, #0x2c]
	bl FUN_0200BDA0
	ldr r0, [r6, #0x28]
	bl FUN_0200BB44
	movs r0, #4
	bl FUN_02002DB4
	pop {r4, r5, r6, pc}
	thumb_func_end ov110_021E65DC

	thumb_func_start ov110_021E6618
ov110_021E6618: @ 0x021E6618
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	ldr r4, _021E664C @ =0x021E6DE4
	movs r6, #0
	adds r5, #0x4c
_021E6624:
	ldr r0, [r7, #0x14]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #3
	blt _021E6624
	ldr r0, [r7]
	bl FUN_0201660C
	str r0, [r7, #0x7c]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E664C: .4byte 0x021E6DE4
	thumb_func_end ov110_021E6618

	thumb_func_start ov110_021E6650
ov110_021E6650: @ 0x021E6650
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	movs r4, #0
	adds r5, #0x4c
_021E665A:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _021E665A
	ldr r0, [r6, #0x7c]
	bl FUN_02016624
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov110_021E6650

	thumb_func_start ov110_021E6678
ov110_021E6678: @ 0x021E6678
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #0x20
	bl FUN_0202055C
	ldr r0, [r4]
	bl FUN_0200CF18
	adds r1, r4, #0
	adds r1, #0x84
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r1, _021E66EC @ =0x021E6EA4
	ldr r2, _021E66F0 @ =0x021E6DD0
	movs r3, #3
	bl FUN_0200CF70
	ldr r0, [r4]
	bl FUN_0200B2E0
	ldr r0, [r4]
	bl FUN_0200B2E8
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_0200CF38
	adds r1, r4, #0
	adds r1, #0x88
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x84
	adds r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	movs r2, #0x12
	bl FUN_0200CFF4
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x84
	adds r4, #0x88
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, _021E66F4 @ =0x021E6DB0
	movs r3, #2
	bl FUN_0200D2A4
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E66EC: .4byte 0x021E6EA4
_021E66F0: .4byte 0x021E6DD0
_021E66F4: .4byte 0x021E6DB0
	thumb_func_end ov110_021E6678

	thumb_func_start ov110_021E66F8
ov110_021E66F8: @ 0x021E66F8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, #0x84
	adds r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D0E4
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x88
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_0200D108
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x84
	str r1, [r0]
	bl FUN_020205AC
	ldr r0, [r4]
	bl FUN_0200B2E0
	pop {r4, pc}
	thumb_func_end ov110_021E66F8

	thumb_func_start ov110_021E6730
ov110_021E6730: @ 0x021E6730
	push {r4, lr}
	adds r4, r0, #0
	bl ov110_021E6678
	adds r0, r4, #0
	bl ov110_021E6764
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	pop {r4, pc}
	thumb_func_end ov110_021E6730

	thumb_func_start ov110_021E6748
ov110_021E6748: @ 0x021E6748
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	bl ov110_021E6898
	adds r0, r4, #0
	bl ov110_021E66F8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov110_021E6748

	thumb_func_start ov110_021E6764
ov110_021E6764: @ 0x021E6764
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r6, _021E6890 @ =0x021E6F7C
	movs r7, #0
	adds r4, r5, #0
_021E6770:
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x84
	adds r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r6, #0
	bl FUN_0200D2B4
	adds r1, r4, #0
	adds r1, #0x8c
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x8c
	movs r1, #1
	ldr r0, [r0]
	lsls r1, r1, #0xc
	bl FUN_02024868
	adds r7, r7, #1
	adds r6, #0x28
	adds r4, r4, #4
	cmp r7, #1
	ble _021E6770
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02024830
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0202484C
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024B78
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	movs r1, #2
	bl FUN_02024A04
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02024B78
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r5, #0
	ldrb r3, [r5, #0x19]
	adds r0, #0x84
	adds r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	movs r2, #0xac
	adds r3, r3, #4
	bl FUN_0200E248
	movs r7, #0
	adds r6, r5, #0
_021E680A:
	adds r0, r7, #2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x16
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x84
	adds r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _021E6894 @ =0x021E6FCC
	bl FUN_0200D2B4
	adds r1, r5, r4
	adds r1, #0x8c
	str r0, [r1]
	adds r0, r5, r4
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02024830
	adds r0, r5, r4
	adds r0, #0x8c
	ldr r0, [r0]
	adds r1, r7, #0
	bl FUN_020248F0
	adds r0, r5, r4
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024B78
	adds r0, r5, r4
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0202487C
	adds r0, r5, r4
	adds r0, #0x8c
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0xe0
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0xde
	ldrb r0, [r0]
	adds r2, r6, #0
	adds r3, r6, #0
	str r0, [sp]
	adds r2, #0xdc
	adds r3, #0xdd
	lsls r1, r7, #0x18
	ldrb r2, [r2]
	ldrb r3, [r3]
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov110_021E6C18
	adds r7, r7, #1
	adds r6, #8
	cmp r7, #0x10
	blt _021E680A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6890: .4byte 0x021E6F7C
_021E6894: .4byte 0x021E6FCC
	thumb_func_end ov110_021E6764

	thumb_func_start ov110_021E6898
ov110_021E6898: @ 0x021E6898
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021E689E:
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x12
	blt _021E689E
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov110_021E6898

	thumb_func_start ov110_021E68B4
ov110_021E68B4: @ 0x021E68B4
	push {r3, r4}
	movs r1, #0
	movs r3, #0x1e
_021E68BA:
	adds r2, r0, #0
	adds r2, #0xde
	ldrb r2, [r2]
	cmp r2, #0
	bne _021E68EE
	lsrs r4, r1, #0x1f
	lsls r2, r1, #0x1e
	subs r2, r2, r4
	rors r2, r3
	adds r2, r4, r2
	adds r4, r2, #1
	adds r2, r0, #0
	adds r2, #0xdc
	ldrb r2, [r2]
	cmp r4, r2
	bne _021E68EE
	asrs r2, r1, #1
	lsrs r2, r2, #0x1e
	adds r2, r1, r2
	asrs r2, r2, #2
	adds r4, r2, #1
	adds r2, r0, #0
	adds r2, #0xdd
	ldrb r2, [r2]
	cmp r4, r2
	beq _021E68F4
_021E68EE:
	movs r0, #0
	pop {r3, r4}
	bx lr
_021E68F4:
	adds r1, r1, #1
	adds r0, #8
	cmp r1, #0x10
	blt _021E68BA
	movs r0, #1
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov110_021E68B4

	thumb_func_start ov110_021E6904
ov110_021E6904: @ 0x021E6904
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #0x4c
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	adds r1, r4, #0
	bl FUN_020248F0
	cmp r4, #1
	bne _021E693C
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_02024964
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0202484C
	b _021E6948
_021E693C:
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0202484C
_021E6948:
	ldr r1, [r5, #0x34]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	movs r1, #4
	adds r3, r0, #0
	lsls r2, r4, #2
	movs r4, #0x30
	subs r3, r4, r3
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6984 @ =0x021E6DA4
	lsrs r3, r3, #1
	ldr r0, [r0, r2]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x34]
	adds r0, #0x4c
	bl FUN_020200FC
	adds r5, #0x4c
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6984: .4byte 0x021E6DA4
	thumb_func_end ov110_021E6904

	thumb_func_start ov110_021E6988
ov110_021E6988: @ 0x021E6988
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r3, #0
	cmp r2, #0
	beq _021E69A2
	movs r1, #1
	adds r0, #0x5c
	adds r2, r1, #0
	movs r3, #5
	bl FUN_0200E998
_021E69A2:
	adds r0, r5, #0
	adds r0, #0x5c
	movs r1, #0xf
	bl FUN_0201D978
	cmp r6, #0
	bne _021E69D0
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6A00 @ =0x0001020F
	lsls r2, r4, #2
	str r0, [sp, #8]
	adds r0, r5, #0
	str r3, [sp, #0xc]
	adds r2, r5, r2
	ldr r2, [r2, #0x48]
	adds r0, #0x5c
	movs r1, #1
	bl FUN_020200FC
	b _021E69F2
_021E69D0:
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6A00 @ =0x0001020F
	str r6, [sp, #4]
	str r0, [sp, #8]
	lsls r2, r4, #2
	adds r0, r5, #0
	str r3, [sp, #0xc]
	adds r2, r5, r2
	ldr r2, [r2, #0x48]
	adds r0, #0x5c
	movs r1, #1
	bl FUN_020200FC
	adds r1, r5, #0
	adds r1, #0x24
	strb r0, [r1]
_021E69F2:
	adds r5, #0x5c
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E6A00: .4byte 0x0001020F
	thumb_func_end ov110_021E6988

	thumb_func_start ov110_021E6A04
ov110_021E6A04: @ 0x021E6A04
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x6c
	movs r1, #0
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6A40 @ =0x00020100
	movs r1, #4
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldrb r2, [r4, #0x19]
	adds r0, r4, #0
	adds r0, #0x6c
	lsls r2, r2, #2
	adds r2, r4, r2
	ldr r2, [r2, #0x38]
	bl FUN_020200FC
	adds r4, #0x6c
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	nop
_021E6A40: .4byte 0x00020100
	thumb_func_end ov110_021E6A04

	thumb_func_start ov110_021E6A44
ov110_021E6A44: @ 0x021E6A44
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r1, #0
	adds r4, r2, #0
	cmp r3, #0
	bne _021E6A74
	lsls r1, r4, #0x1a
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r2, #0
	lsls r3, r5, #2
	str r2, [sp, #0xc]
	adds r3, r3, #4
	lsls r3, r3, #0x18
	ldr r0, [r0, #0x14]
	movs r1, #2
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	add sp, #0x1c
	pop {r4, r5, pc}
_021E6A74:
	adds r1, r0, #0
	adds r1, #0xd4
	ldr r1, [r1]
	movs r2, #4
	str r2, [sp]
	str r2, [sp, #4]
	adds r2, r1, #0
	adds r2, #0xc
	str r2, [sp, #8]
	subs r2, r3, #1
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	movs r2, #0
	str r2, [sp, #0x10]
	ldrh r2, [r1]
	lsls r3, r4, #0x1a
	lsrs r3, r3, #0x18
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r1, [r1, #2]
	lsls r2, r5, #2
	adds r2, r2, #4
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x18]
	lsls r2, r2, #0x18
	ldr r0, [r0, #0x14]
	movs r1, #2
	lsrs r2, r2, #0x18
	bl FUN_0201C4EC
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov110_021E6A44

	thumb_func_start ov110_021E6ABC
ov110_021E6ABC: @ 0x021E6ABC
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	movs r2, #0x57
	adds r5, r0, #0
	lsls r2, r2, #2
	adds r4, r1, #0
	adds r1, r5, #0
	ldr r3, [r5, r2]
	adds r1, #0x22
	ldrb r1, [r1]
	ldrb r2, [r3]
	cmp r2, r1
	bne _021E6AEA
	adds r2, r5, #0
	adds r2, #0x23
	ldrb r2, [r2]
	ldrb r3, [r3, #1]
	cmp r3, r2
	bne _021E6AEA
	movs r3, #2
	bl ov110_021E6A44
	b _021E6AF8
_021E6AEA:
	adds r2, r5, #0
	adds r2, #0x23
	ldrb r2, [r2]
	adds r0, r5, #0
	movs r3, #0
	bl ov110_021E6A44
_021E6AF8:
	ldr r0, [r5, #0x14]
	movs r1, #2
	bl FUN_0201EFBC
	cmp r4, #0
	bne _021E6B08
	cmp r6, #0
	beq _021E6B34
_021E6B08:
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	ldrb r0, [r1]
	cmp r0, r4
	bne _021E6B28
	ldrb r0, [r1, #1]
	cmp r0, r6
	bne _021E6B28
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #3
	bl ov110_021E6A44
	pop {r4, r5, r6, pc}
_021E6B28:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #1
	bl ov110_021E6A44
_021E6B34:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov110_021E6ABC

	thumb_func_start ov110_021E6B38
ov110_021E6B38: @ 0x021E6B38
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, [r4, #0x14]
	movs r2, #0
	str r0, [sp]
	movs r0, #0x1f
	str r0, [sp, #8]
	movs r0, #6
	str r0, [sp, #0xc]
	str r2, [sp, #4]
	movs r1, #0x19
	add r0, sp, #0
	strb r1, [r0, #0x10]
	movs r1, #0xa
	strb r1, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	movs r3, #0xf
	bics r1, r3
	ldr r3, [r4, #4]
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	movs r3, #0xf
	ands r3, r5
	orrs r1, r3
	strb r1, [r0, #0x12]
	ldrb r3, [r0, #0x12]
	movs r1, #0xf0
	bics r3, r1
	movs r1, #0x10
	orrs r1, r3
	strb r1, [r0, #0x12]
	strb r2, [r0, #0x13]
	ldr r0, [r4, #0x7c]
	adds r4, #0x80
	ldr r2, [r4]
	add r1, sp, #0
	bl FUN_02016704
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov110_021E6B38

	thumb_func_start ov110_021E6B94
ov110_021E6B94: @ 0x021E6B94
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x7c]
	bl FUN_020168F4
	cmp r0, #1
	beq _021E6BA8
	cmp r0, #2
	beq _021E6BAC
	b _021E6BB0
_021E6BA8:
	movs r4, #7
	b _021E6BB4
_021E6BAC:
	movs r4, #1
	b _021E6BB4
_021E6BB0:
	movs r0, #5
	pop {r3, r4, r5, pc}
_021E6BB4:
	ldr r0, [r5, #0x7c]
	bl FUN_020169C0
	str r0, [r5, #4]
	ldr r0, [r5, #0x7c]
	bl FUN_020169CC
	adds r0, r5, #0
	adds r0, #0x5c
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, #0
	adds r0, #0x5c
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x5c
	bl FUN_0201D5C8
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl FUN_0201EFBC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov110_021E6B94

	thumb_func_start ov110_021E6BEC
ov110_021E6BEC: @ 0x021E6BEC
	push {r4, lr}
	ldrb r3, [r0, #2]
	ldr r4, _021E6C10 @ =0x021E6D94
	ldr r0, [r0, #4]
	lsls r3, r3, #1
	ldrsb r4, [r4, r3]
	adds r1, r1, r4
	ldr r4, _021E6C14 @ =0x021E6D95
	lsls r1, r1, #0x10
	ldrsb r3, [r4, r3]
	asrs r1, r1, #0x10
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	pop {r4, pc}
	nop
_021E6C10: .4byte 0x021E6D94
_021E6C14: .4byte 0x021E6D95
	thumb_func_end ov110_021E6BEC

	thumb_func_start ov110_021E6C18
ov110_021E6C18: @ 0x021E6C18
	push {r4, lr}
	adds r0, #0xdc
	lsls r1, r1, #3
	adds r4, r0, r1
	strb r2, [r0, r1]
	lsls r1, r2, #5
	ldr r0, _021E6C54 @ =0xFFFFFFF8
	lsls r2, r3, #5
	adds r1, #0x30
	adds r2, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	strb r3, [r4, #1]
	add r0, sp
	ldrb r0, [r0, #0x10]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	strb r0, [r4, #2]
	adds r0, r4, #0
	bl ov110_021E6BEC
	ldr r1, _021E6C54 @ =0xFFFFFFF8
	ldr r0, [r4, #4]
	add r1, sp
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x10
	bl FUN_02024818
	pop {r4, pc}
	.align 2, 0
_021E6C54: .4byte 0xFFFFFFF8
	thumb_func_end ov110_021E6C18

	thumb_func_start ov110_021E6C58
ov110_021E6C58: @ 0x021E6C58
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	cmp r2, #0
	beq _021E6CCC
	strb r1, [r4, #0x1b]
	ldrb r0, [r4, #0x1b]
	adds r1, r4, #0
	adds r1, #0xdc
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0x57
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	movs r1, #0
	ldr r0, [r0, #4]
	bl FUN_02024ADC
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	mvns r1, r1
	ldr r0, [r0, #4]
	adds r2, r1, #0
	bl FUN_0200DEA0
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	adds r0, r4, #0
	ldrb r1, [r2]
	ldrb r2, [r2, #1]
	adds r0, #0x90
	lsls r1, r1, #5
	lsls r2, r2, #5
	adds r1, #0x30
	adds r2, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r0]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	adds r0, r4, #0
	movs r1, #2
	bl ov110_021E6904
	add sp, #4
	pop {r3, r4, pc}
_021E6CCC:
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	ldr r0, [r0, #4]
	bl FUN_02024ADC
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r3, [r4, r0]
	ldrb r0, [r3, #2]
	str r0, [sp]
	ldrb r2, [r3]
	ldrb r1, [r4, #0x1b]
	ldrb r3, [r3, #1]
	adds r0, r4, #0
	bl ov110_021E6C18
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #0
	bl ov110_021E6904
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x22
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x23
	strb r1, [r0]
	movs r0, #0x57
	lsls r0, r0, #2
	str r1, [r4, r0]
	strb r1, [r4, #0x1b]
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov110_021E6C58

	thumb_func_start ov110_021E6D20
ov110_021E6D20: @ 0x021E6D20
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	movs r1, #8
	bl FUN_0201AACC
	movs r1, #0
	movs r2, #8
	adds r5, r0, #0
	blx FUN_020D4994
	ldr r0, _021E6D50 @ =ov110_021E6D54
	adds r1, r5, #0
	movs r2, #0
	str r4, [r5]
	bl FUN_0200E320
	adds r0, r4, #0
	movs r1, #1
	bl ov110_021E6904
	movs r0, #1
	strb r0, [r4, #0x1a]
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6D50: .4byte ov110_021E6D54
	thumb_func_end ov110_021E6D20

	thumb_func_start ov110_021E6D54
ov110_021E6D54: @ 0x021E6D54
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_02024B68
	cmp r0, #0
	bne _021E6D8A
	ldr r0, [r4]
	movs r1, #0
	bl ov110_021E6904
	ldr r0, [r4]
	movs r1, #0
	strb r1, [r0, #0x1a]
	adds r0, r4, #0
	movs r2, #8
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
_021E6D8A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov110_021E6D54
_021E6D8C:
	.byte 0xA9, 0xBF, 0xD1, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x05, 0x00
	.byte 0x00, 0x05, 0x05, 0x05, 0x00, 0x02, 0x01, 0x00, 0x00, 0x04, 0x03, 0x00, 0x00, 0x06, 0x05, 0x00
	.byte 0x0A, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x08, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x4A, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x02, 0x1A, 0x15, 0x06, 0x03, 0x03, 0xEE, 0x03, 0x00, 0x02, 0x13, 0x1B
	.byte 0x04, 0x04, 0x5B, 0x00, 0x04, 0x04, 0x0F, 0x18, 0x06, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x26, 0x81, 0x00, 0x83, 0x84, 0x00
	.byte 0x00, 0x85, 0x00, 0x87, 0x88, 0x4B, 0x00, 0x00, 0x8A, 0x00, 0x8C, 0x00, 0x62, 0x8D, 0x8E, 0x8F
	.byte 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x6A, 0x00, 0x4E, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x83, 0x84, 0x00, 0x00, 0x00, 0x00, 0x87, 0x88, 0x70, 0x62, 0x89, 0x00, 0x8B, 0x8C, 0x00
	.byte 0x00, 0x8D, 0x00, 0x8F, 0x00, 0x46, 0x00, 0x00, 0x41, 0x00, 0x25, 0x00, 0x00, 0x00, 0x2B, 0x00
	.byte 0x0A, 0x00, 0x09, 0x00, 0x82, 0x83, 0x84, 0x00, 0x00, 0x85, 0x86, 0x00, 0x00, 0x4E, 0x08, 0x00
	.byte 0x00, 0x00, 0x00, 0x6D, 0x61, 0x00, 0x00, 0x8F, 0x90, 0x00, 0x00, 0x47, 0x2C, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x09, 0x6E, 0x61, 0x00, 0x4F, 0x00, 0x00, 0x83, 0x84, 0x00, 0x4D, 0x85, 0x86, 0x87
	.byte 0x00, 0x6A, 0x62, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x6B, 0x00, 0x45
	.byte 0x28, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.data

_021E7000:
	.byte 0xC4, 0x6E, 0x1E, 0x02, 0xE8, 0x6E, 0x1E, 0x02, 0x0C, 0x6F, 0x1E, 0x02, 0x30, 0x6F, 0x1E, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x021E7020
