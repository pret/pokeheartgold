
	thumb_func_start ov86_021E5900
ov86_021E5900: @ 0x021E5900
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r6, r1, #0
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
	ldr r0, _021E5A2C @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5A30 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	ldr r2, _021E5A34 @ =0x04000304
	ldr r0, _021E5A38 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	movs r0, #3
	movs r1, #0x79
	lsls r2, r0, #0x10
	bl FUN_0201A910
	movs r1, #0xe5
	adds r0, r4, #0
	lsls r1, r1, #2
	movs r2, #0x79
	bl FUN_02007280
	movs r2, #0xe5
	adds r5, r0, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	str r4, [r5]
	movs r0, #0x79
	bl FUN_0201AC88
	str r0, [r5, #0xc]
	adds r0, r4, #0
	bl FUN_020072A4
	adds r4, r0, #0
	movs r0, #0x89
	ldr r1, [r4]
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	bl FUN_0203107C
	movs r1, #0x8a
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldrb r0, [r4, #4]
	strb r0, [r5, #6]
	ldrb r0, [r4, #5]
	strb r0, [r5, #7]
	ldrh r0, [r4, #6]
	strh r0, [r5, #8]
	subs r0, r1, #4
	ldr r0, [r5, r0]
	bl FUN_02028EA8
	movs r1, #0x22
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #4
	movs r1, #0x79
	bl FUN_02002CEC
	adds r0, r5, #0
	bl ov86_021E5E0C
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0x13
	movs r3, #0x79
	bl FUN_0200BAF8
	movs r1, #0x21
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #0x79
	bl FUN_0200BD08
	movs r1, #0x85
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0x32
	lsls r0, r0, #4
	movs r1, #0x79
	bl FUN_02026354
	movs r1, #0x86
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	subs r1, #0x78
	movs r2, #0x79
	bl FUN_02003030
	movs r1, #6
	movs r0, #0
	lsls r1, r1, #6
	movs r2, #0x79
	bl FUN_0200304C
	ldrb r0, [r5, #7]
	bl ov86_021E5E98
	adds r2, r0, #0
	adds r1, r5, #0
	ldr r0, [r5, #0xc]
	adds r1, #0x10
	bl ov86_021E7DF8
	movs r1, #0x8f
	lsls r1, r1, #2
	ldr r0, [r5, #0xc]
	adds r1, r5, r1
	bl ov86_021E7E68
	adds r0, r5, #0
	bl ov86_021E6E30
	adds r0, r5, #0
	bl ov86_021E6E98
	ldr r0, _021E5A3C @ =ov86_021E5CDC
	adds r1, r5, #0
	bl FUN_0201A0FC
	movs r0, #0
	str r0, [r6]
	movs r0, #1
	pop {r4, r5, r6, pc}
	nop
_021E5A2C: .4byte 0xFFFFE0FF
_021E5A30: .4byte 0x04001000
_021E5A34: .4byte 0x04000304
_021E5A38: .4byte 0xFFFF7FFF
_021E5A3C: .4byte ov86_021E5CDC
	thumb_func_end ov86_021E5900

	thumb_func_start ov86_021E5A40
ov86_021E5A40: @ 0x021E5A40
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #0
	beq _021E5A5A
	cmp r1, #1
	beq _021E5A6E
	cmp r1, #2
	beq _021E5A82
	b _021E5A8E
_021E5A5A:
	bl ov86_021E5B38
	cmp r0, #1
	bne _021E5A8E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov86_021E5E90
	b _021E5A8E
_021E5A6E:
	bl ov86_021E5BA0
	cmp r0, #1
	bne _021E5A8E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ov86_021E5E90
	b _021E5A8E
_021E5A82:
	bl ov86_021E5C94
	cmp r0, #1
	bne _021E5A8E
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5A8E:
	adds r0, r4, #0
	bl ov86_021E703C
	movs r0, #0x23
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200D020
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov86_021E5A40

	thumb_func_start ov86_021E5AA4
ov86_021E5AA4: @ 0x021E5AA4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov86_021E6FF4
	movs r0, #0x87
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_02003150
	movs r0, #0x87
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02003150
	movs r0, #0x87
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02003104
	movs r0, #0x87
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, #0xc
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	movs r0, #0x85
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	movs r0, #0x86
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov86_021E7E90
	ldrb r0, [r4, #7]
	bl ov86_021E5E98
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x10
	bl ov86_021E7E40
	ldr r0, [r4, #0xc]
	bl ov86_021E5E54
	movs r0, #4
	bl FUN_02002DB4
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x79
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov86_021E5AA4

	thumb_func_start ov86_021E5B38
ov86_021E5B38: @ 0x021E5B38
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r1, [r4, #4]
	cmp r1, #0
	beq _021E5B4E
	cmp r1, #1
	beq _021E5B6C
	cmp r1, #2
	beq _021E5B8C
	b _021E5B9A
_021E5B4E:
	bl ov86_021E71FC
	cmp r0, #1
	bne _021E5B5E
	adds r0, r4, #0
	bl ov86_021E720C
	b _021E5B64
_021E5B5E:
	adds r0, r4, #0
	bl ov86_021E60B8
_021E5B64:
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _021E5B9A
_021E5B6C:
	movs r0, #6
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x79
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _021E5B9A
_021E5B8C:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E5B9A
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_021E5B9A:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov86_021E5B38

	thumb_func_start ov86_021E5BA0
ov86_021E5BA0: @ 0x021E5BA0
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #4]
	cmp r1, #0xa
	bhi _021E5C82
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5BB6: @ jump table
	.2byte _021E5BCC - _021E5BB6 - 2 @ case 0
	.2byte _021E5BE0 - _021E5BB6 - 2 @ case 1
	.2byte _021E5C0A - _021E5BB6 - 2 @ case 2
	.2byte _021E5C16 - _021E5BB6 - 2 @ case 3
	.2byte _021E5C1E - _021E5BB6 - 2 @ case 4
	.2byte _021E5C2A - _021E5BB6 - 2 @ case 5
	.2byte _021E5C32 - _021E5BB6 - 2 @ case 6
	.2byte _021E5C3A - _021E5BB6 - 2 @ case 7
	.2byte _021E5C46 - _021E5BB6 - 2 @ case 8
	.2byte _021E5C70 - _021E5BB6 - 2 @ case 9
	.2byte _021E5C7E - _021E5BB6 - 2 @ case 10
_021E5BCC:
	bl ov86_021E71FC
	cmp r0, #1
	bne _021E5BDA
	movs r0, #3
	strb r0, [r4, #4]
	b _021E5C82
_021E5BDA:
	movs r0, #1
	strb r0, [r4, #4]
	b _021E5C82
_021E5BE0:
	ldr r0, _021E5C88 @ =_021E7E98
	bl FUN_02025320
	cmp r0, #1
	beq _021E5BF4
	ldr r0, _021E5C8C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _021E5C82
_021E5BF4:
	ldr r0, _021E5C90 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov86_021E71C0
	movs r0, #0xa
	strb r0, [r4, #5]
	movs r0, #9
	strb r0, [r4, #4]
	b _021E5C82
_021E5C0A:
	movs r1, #1
	bl ov86_021E7258
	movs r0, #3
	strb r0, [r4, #4]
	b _021E5C82
_021E5C16:
	bl ov86_021E7710
	strb r0, [r4, #4]
	b _021E5C82
_021E5C1E:
	movs r1, #2
	bl ov86_021E7258
	movs r0, #5
	strb r0, [r4, #4]
	b _021E5C82
_021E5C2A:
	bl ov86_021E7984
	strb r0, [r4, #4]
	b _021E5C82
_021E5C32:
	bl ov86_021E7B54
	strb r0, [r4, #4]
	b _021E5C82
_021E5C3A:
	movs r1, #0
	bl ov86_021E7258
	movs r0, #8
	strb r0, [r4, #4]
	b _021E5C82
_021E5C46:
	ldr r0, _021E5C88 @ =_021E7E98
	bl FUN_02025320
	cmp r0, #1
	beq _021E5C5A
	ldr r0, _021E5C8C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _021E5C82
_021E5C5A:
	ldr r0, _021E5C90 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov86_021E71C0
	movs r0, #4
	strb r0, [r4, #5]
	movs r0, #9
	strb r0, [r4, #4]
	b _021E5C82
_021E5C70:
	bl ov86_021E7094
	cmp r0, #0
	bne _021E5C82
	ldrb r0, [r4, #5]
	strb r0, [r4, #4]
	b _021E5C82
_021E5C7E:
	movs r0, #1
	pop {r4, pc}
_021E5C82:
	movs r0, #0
	pop {r4, pc}
	nop
_021E5C88: .4byte _021E7E98
_021E5C8C: .4byte 0x021D110C
_021E5C90: .4byte 0x000005DD
	thumb_func_end ov86_021E5BA0

	thumb_func_start ov86_021E5C94
ov86_021E5C94: @ 0x021E5C94
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r0, [r4, #4]
	cmp r0, #0
	beq _021E5CA6
	cmp r0, #1
	beq _021E5CC6
	b _021E5CD4
_021E5CA6:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x79
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _021E5CD4
_021E5CC6:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E5CD4
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_021E5CD4:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov86_021E5C94

	thumb_func_start ov86_021E5CDC
ov86_021E5CDC: @ 0x021E5CDC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x87
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5CEE
	bl FUN_0200398C
_021E5CEE:
	ldr r0, [r4, #0xc]
	bl FUN_0201EEB4
	bl FUN_0200D034
	ldr r3, _021E5D08 @ =0x027E0000
	ldr r1, _021E5D0C @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E5D08: .4byte 0x027E0000
_021E5D0C: .4byte 0x00003FF8
	thumb_func_end ov86_021E5CDC

	thumb_func_start ov86_021E5D10
ov86_021E5D10: @ 0x021E5D10
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5D2C @ =0x021E7FBC
	add r3, sp, #0
	movs r2, #5
_021E5D1A:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5D1A
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E5D2C: .4byte 0x021E7FBC
	thumb_func_end ov86_021E5D10

	thumb_func_start ov86_021E5D30
ov86_021E5D30: @ 0x021E5D30
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _021E5DF8 @ =0x021E7EC8
	add r3, sp, #0x70
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E5DFC @ =0x021E7F04
	add r3, sp, #0x54
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #0
	str r0, [r3]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_0201B1E4
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x79
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _021E5E00 @ =0x021E7F20
	add r3, sp, #0x38
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
	ldr r5, _021E5E04 @ =0x021E7F3C
	add r3, sp, #0x1c
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x79
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _021E5E08 @ =0x021E7F58
	add r3, sp, #0
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
	movs r3, #0
	bl FUN_0201B1E4
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021E5DF8: .4byte 0x021E7EC8
_021E5DFC: .4byte 0x021E7F04
_021E5E00: .4byte 0x021E7F20
_021E5E04: .4byte 0x021E7F3C
_021E5E08: .4byte 0x021E7F58
	thumb_func_end ov86_021E5D30

	thumb_func_start ov86_021E5E0C
ov86_021E5E0C: @ 0x021E5E0C
	push {r4, lr}
	adds r4, r0, #0
	bl ov86_021E5D10
	ldr r0, [r4, #0xc]
	bl ov86_021E5D30
	movs r0, #0x79
	bl FUN_020030E8
	movs r1, #0x87
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #2
	lsls r2, r1, #8
	movs r3, #0x79
	bl FUN_02003120
	movs r2, #0x87
	lsls r2, r2, #2
	ldr r0, [r4, r2]
	movs r1, #0
	subs r2, #0x1c
	movs r3, #0x79
	bl FUN_02003120
	adds r0, r4, #0
	movs r1, #2
	bl ov86_021E5ECC
	adds r0, r4, #0
	movs r1, #6
	bl ov86_021E5F58
	pop {r4, pc}
	thumb_func_end ov86_021E5E0C

	thumb_func_start ov86_021E5E54
ov86_021E5E54: @ 0x021E5E54
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x1f
	movs r1, #0
	bl FUN_02022CC8
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov86_021E5E54

	thumb_func_start ov86_021E5E90
ov86_021E5E90: @ 0x021E5E90
	movs r3, #0
	strb r3, [r0, #4]
	str r2, [r1]
	bx lr
	thumb_func_end ov86_021E5E90

	thumb_func_start ov86_021E5E98
ov86_021E5E98: @ 0x021E5E98
	movs r1, #0
	cmp r0, #6
	bhi _021E5EC8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5EAA: @ jump table
	.2byte _021E5EC8 - _021E5EAA - 2 @ case 0
	.2byte _021E5EC6 - _021E5EAA - 2 @ case 1
	.2byte _021E5EB8 - _021E5EAA - 2 @ case 2
	.2byte _021E5EB8 - _021E5EAA - 2 @ case 3
	.2byte _021E5EBE - _021E5EAA - 2 @ case 4
	.2byte _021E5EBA - _021E5EAA - 2 @ case 5
	.2byte _021E5EC2 - _021E5EAA - 2 @ case 6
_021E5EB8:
	b _021E5EC8
_021E5EBA:
	movs r1, #1
	b _021E5EC8
_021E5EBE:
	movs r1, #2
	b _021E5EC8
_021E5EC2:
	movs r1, #3
	b _021E5EC8
_021E5EC6:
	movs r1, #4
_021E5EC8:
	adds r0, r1, #0
	bx lr
	thumb_func_end ov86_021E5E98

	thumb_func_start ov86_021E5ECC
ov86_021E5ECC: @ 0x021E5ECC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0xb7
	movs r1, #0x79
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0x79
	str r1, [sp, #0xc]
	ldr r2, [r5, #0xc]
	movs r1, #0x8c
	adds r3, r6, #0
	adds r4, r0, #0
	bl FUN_02007B44
	movs r0, #0x60
	str r0, [sp]
	movs r0, #0x79
	movs r2, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0xc3
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x79
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	adds r0, r4, #0
	movs r1, #0x8b
	adds r3, r6, #0
	bl FUN_02007B68
	movs r0, #0x79
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x8f
	movs r2, #1
	add r3, sp, #0x10
	bl FUN_02007C2C
	adds r6, r0, #0
	ldr r0, [sp, #0x10]
	movs r1, #0xcd
	lsls r1, r1, #2
	adds r0, #0xc
	adds r1, r5, r1
	movs r2, #0x60
	blx FUN_020D47B8
	adds r0, r6, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov86_021E5ECC

	thumb_func_start ov86_021E5F58
ov86_021E5F58: @ 0x021E5F58
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0xb7
	movs r1, #0x79
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0x79
	str r1, [sp, #0xc]
	ldr r2, [r5, #0xc]
	movs r1, #0x8e
	adds r3, r6, #0
	adds r4, r0, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x79
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	adds r0, r4, #0
	movs r1, #0x8d
	adds r3, r6, #0
	bl FUN_02007B68
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x79
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0xc4
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov86_021E5F58

	thumb_func_start ov86_021E5FBC
ov86_021E5FBC: @ 0x021E5FBC
	push {r3, lr}
	sub sp, #8
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r3, #0x85
	lsls r3, r3, #2
	ldr r0, [r0, r3]
	movs r3, #4
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov86_021E5FBC

	thumb_func_start ov86_021E5FD8
ov86_021E5FD8: @ 0x021E5FD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, [sp, #0x30]
	adds r7, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	cmp r0, #1
	bne _021E5FF6
	ldr r0, [sp, #0x28]
	movs r2, #0
	bl FUN_02002F30
	subs r5, r5, r0
	b _021E6006
_021E5FF6:
	cmp r0, #2
	bne _021E6006
	ldr r0, [sp, #0x28]
	movs r2, #0
	bl FUN_02002F30
	lsrs r0, r0, #1
	subs r5, r5, r0
_021E6006:
	str r4, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x28]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r6, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov86_021E5FD8

	thumb_func_start ov86_021E6024
ov86_021E6024: @ 0x021E6024
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x21
	lsls r0, r0, #4
	adds r4, r1, #0
	ldr r0, [r5, r0]
	adds r1, r2, #0
	adds r7, r3, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [sp, #0x24]
	adds r5, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x20]
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	adds r1, r6, #0
	str r0, [sp, #8]
	lsls r0, r4, #4
	adds r0, r5, r0
	adds r2, r7, #0
	bl ov86_021E5FD8
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov86_021E6024

	thumb_func_start ov86_021E6064
ov86_021E6064: @ 0x021E6064
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x21
	lsls r0, r0, #4
	adds r4, r1, #0
	ldr r0, [r5, r0]
	adds r1, r2, #0
	adds r7, r3, #0
	bl FUN_0200BBA0
	movs r1, #0x85
	adds r6, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl FUN_0200CBBC
	ldr r0, [sp, #0x24]
	adds r1, r5, #0
	str r0, [sp]
	ldr r0, [sp, #0x28]
	adds r1, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x20]
	str r0, [sp, #8]
	lsls r0, r4, #4
	adds r0, r1, r0
	movs r1, #0x86
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r2, r7, #0
	bl ov86_021E5FD8
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov86_021E6064

	thumb_func_start ov86_021E60B8
ov86_021E60B8: @ 0x021E60B8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #7]
	cmp r1, #6
	bhi _021E610C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E60CE: @ jump table
	.2byte _021E610C - _021E60CE - 2 @ case 0
	.2byte _021E60FA - _021E60CE - 2 @ case 1
	.2byte _021E60DC - _021E60CE - 2 @ case 2
	.2byte _021E60DC - _021E60CE - 2 @ case 3
	.2byte _021E60EE - _021E60CE - 2 @ case 4
	.2byte _021E60E8 - _021E60CE - 2 @ case 5
	.2byte _021E60F4 - _021E60CE - 2 @ case 6
_021E60DC:
	bl ov86_021E6114
	adds r0, r4, #0
	bl ov86_021E62F4
	pop {r4, pc}
_021E60E8:
	bl ov86_021E64E0
	pop {r4, pc}
_021E60EE:
	bl ov86_021E66D0
	pop {r4, pc}
_021E60F4:
	bl ov86_021E690C
	pop {r4, pc}
_021E60FA:
	ldrb r1, [r4, #6]
	cmp r1, #1
	bhi _021E6106
	bl ov86_021E6A88
	pop {r4, pc}
_021E6106:
	bl ov86_021E6BA8
	pop {r4, pc}
_021E610C:
	adds r0, r4, #0
	bl ov86_021E690C
	pop {r4, pc}
	thumb_func_end ov86_021E60B8

	thumb_func_start ov86_021E6114
ov86_021E6114: @ 0x021E6114
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x40
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E62EC @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x16
	adds r3, r1, #0
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _021E6160
	movs r2, #0x1a
	b _021E616A
_021E6160:
	cmp r0, #1
	bne _021E6168
	movs r2, #0x1b
	b _021E616A
_021E6168:
	movs r2, #0x1c
_021E616A:
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E62EC @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r3, #0xe0
	bl ov86_021E6024
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E62F0 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x2e
	str r3, [sp, #0xc]
	bl ov86_021E6024
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E62F0 @ =0x00010200
	movs r1, #1
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r2, #0x30
	movs r3, #0xe0
	str r1, [sp, #0xc]
	bl ov86_021E6024
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E6484
	movs r3, #0
	adds r2, r0, #0
	str r3, [sp]
	ldr r0, _021E62F0 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #2
	bl ov86_021E6024
	ldrb r1, [r4, #6]
	movs r0, #0
	bl FUN_0205BFF0
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E62F0 @ =0x00010200
	movs r1, #2
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r2, #0x32
	movs r3, #0x70
	str r1, [sp, #0xc]
	bl ov86_021E6064
	ldrb r1, [r4, #6]
	movs r0, #0
	bl FUN_0205C048
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E62F0 @ =0x00010200
	movs r1, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x34
	movs r3, #0xe0
	bl ov86_021E6064
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E62F0 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x2b
	bl ov86_021E6024
	ldrb r1, [r4, #6]
	movs r0, #0
	bl FUN_0205C01C
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E62F0 @ =0x00010200
	movs r1, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x32
	movs r3, #0x70
	bl ov86_021E6064
	ldrb r1, [r4, #6]
	movs r0, #0
	bl FUN_0205C074
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E62F0 @ =0x00010200
	movs r1, #3
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x34
	movs r3, #0xe0
	bl ov86_021E6064
	adds r0, r4, #0
	adds r0, #0x10
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x20
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x30
	bl FUN_0201D5C8
	adds r4, #0x40
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E62EC: .4byte 0x000F0200
_021E62F0: .4byte 0x00010200
	thumb_func_end ov86_021E6114

	thumb_func_start ov86_021E62F4
ov86_021E62F4: @ 0x021E62F4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x50
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x60
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x70
	movs r1, #0
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6480 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x2f
	str r3, [sp, #0xc]
	bl ov86_021E6024
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6480 @ =0x00010200
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x30
	movs r3, #0xe0
	bl ov86_021E6024
	adds r0, r4, #0
	movs r1, #1
	bl ov86_021E6484
	movs r3, #0
	adds r2, r0, #0
	str r3, [sp]
	ldr r0, _021E6480 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #5
	bl ov86_021E6024
	ldrb r1, [r4, #6]
	movs r0, #1
	bl FUN_0205BFF0
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6480 @ =0x00010200
	movs r1, #5
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x32
	movs r3, #0x70
	bl ov86_021E6064
	ldrb r1, [r4, #6]
	movs r0, #1
	bl FUN_0205C048
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6480 @ =0x00010200
	movs r1, #5
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x34
	movs r3, #0xe0
	bl ov86_021E6064
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6480 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0x2b
	bl ov86_021E6024
	ldrb r1, [r4, #6]
	movs r0, #1
	bl FUN_0205C01C
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6480 @ =0x00010200
	movs r1, #6
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x32
	movs r3, #0x70
	bl ov86_021E6064
	ldrb r1, [r4, #6]
	movs r0, #1
	bl FUN_0205C074
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6480 @ =0x00010200
	movs r1, #6
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x34
	movs r3, #0xe0
	bl ov86_021E6064
	adds r0, r4, #0
	adds r0, #0x50
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x60
	bl FUN_0201D5C8
	adds r4, #0x70
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	nop
_021E6480: .4byte 0x00010200
	thumb_func_end ov86_021E62F4

	thumb_func_start ov86_021E6484
ov86_021E6484: @ 0x021E6484
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bne _021E648E
	movs r5, #0x66
	b _021E6490
_021E648E:
	movs r5, #0x68
_021E6490:
	ldrb r4, [r0, #6]
	cmp r4, #3
	bne _021E64B4
	movs r1, #0x89
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_0203107C
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_020310BC
	b _021E64CE
_021E64B4:
	movs r1, #0x89
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_02030AE8
	lsls r2, r6, #2
	adds r2, r4, r2
	lsls r2, r2, #0x18
	movs r1, #0xa
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030AD4
_021E64CE:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _021E64DA
	movs r0, #0x1e
	pop {r4, r5, r6, pc}
_021E64DA:
	movs r0, #0x1d
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov86_021E6484

	thumb_func_start ov86_021E64E0
ov86_021E64E0: @ 0x021E64E0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E6684 @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #0x18
	adds r3, r1, #0
	bl ov86_021E6024
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _021E652C
	movs r2, #0x1a
	b _021E6536
_021E652C:
	cmp r0, #1
	bne _021E6534
	movs r2, #0x1b
	b _021E6536
_021E6534:
	movs r2, #0x1c
_021E6536:
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E6684 @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r3, #0xe0
	bl ov86_021E6024
	ldrh r1, [r5, #8]
	adds r0, r5, #0
	bl ov86_021E668C
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6688 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0x33
	str r3, [sp, #0xc]
	bl ov86_021E6064
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6688 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #2
	movs r2, #0x1d
	str r3, [sp, #0xc]
	bl ov86_021E6024
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0203107C
	adds r4, r0, #0
	ldrb r0, [r5, #6]
	bl FUN_0205C11C
	adds r6, r0, #0
	ldrb r0, [r5, #6]
	bl FUN_0205C11C
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020310BC
	ldrh r1, [r5, #8]
	cmp r1, r0
	beq _021E65B2
	movs r2, #0
	b _021E65C8
_021E65B2:
	ldrb r0, [r5, #6]
	bl FUN_0205C0CC
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
_021E65C8:
	adds r0, r5, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6688 @ =0x00010200
	movs r1, #2
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r2, #0x32
	movs r3, #0x70
	str r1, [sp, #0xc]
	bl ov86_021E6064
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6688 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0x2b
	str r3, [sp, #0xc]
	bl ov86_021E6024
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0xb
	add r2, sp, #0x10
	bl FUN_020312C4
	adds r4, r0, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	beq _021E6618
	movs r6, #0
	b _021E6630
_021E6618:
	ldrb r0, [r5, #6]
	bl FUN_0205C144
	adds r2, r0, #0
	movs r0, #0x89
	lsls r0, r0, #2
	ldrh r3, [r5, #8]
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_020312E0
	adds r6, r0, #0
_021E6630:
	cmp r4, #0
	beq _021E663A
	adds r0, r4, #0
	bl FUN_0201AB0C
_021E663A:
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6688 @ =0x00010200
	movs r1, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #0x32
	movs r3, #0x70
	bl ov86_021E6064
	adds r0, r5, #0
	adds r0, #0x10
	bl FUN_0201D5C8
	adds r0, r5, #0
	adds r0, #0x20
	bl FUN_0201D5C8
	adds r0, r5, #0
	adds r0, #0x30
	bl FUN_0201D5C8
	adds r5, #0x40
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_021E6684: .4byte 0x000F0200
_021E6688: .4byte 0x00010200
	thumb_func_end ov86_021E64E0

	thumb_func_start ov86_021E668C
ov86_021E668C: @ 0x021E668C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xed
	movs r3, #0x79
	bl FUN_0200BAF8
	adds r6, r0, #0
	adds r1, r5, #0
	bl FUN_0200BBA0
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_0200BB44
	movs r1, #0
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x85
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r2, r5, #0
	adds r3, r1, #0
	bl FUN_0200BE3C
	adds r0, r5, #0
	bl FUN_02026380
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov86_021E668C

	thumb_func_start ov86_021E66D0
ov86_021E66D0: @ 0x021E66D0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E68B0 @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #0x17
	adds r3, r1, #0
	bl ov86_021E6024
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _021E671C
	movs r2, #0x1a
	b _021E6726
_021E671C:
	cmp r0, #1
	bne _021E6724
	movs r2, #0x1b
	b _021E6726
_021E6724:
	movs r2, #0x1c
_021E6726:
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E68B0 @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r3, #0xe0
	bl ov86_021E6024
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E68B4 @ =0x00010200
	movs r1, #1
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r2, #0x31
	movs r3, #0x70
	str r1, [sp, #0xc]
	bl ov86_021E6024
	adds r0, r5, #0
	bl ov86_021E68B8
	movs r3, #0
	adds r2, r0, #0
	str r3, [sp]
	ldr r0, _021E68B4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #2
	bl ov86_021E6024
	ldrb r0, [r5, #6]
	bl FUN_0205C1A0
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E68B4 @ =0x00010200
	movs r1, #2
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r2, #0x36
	movs r3, #0x70
	str r1, [sp, #0xc]
	bl ov86_021E6064
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0203107C
	adds r4, r0, #0
	ldrb r0, [r5, #6]
	bl FUN_0205C1F0
	adds r6, r0, #0
	ldrb r0, [r5, #6]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E68B4 @ =0x00010200
	movs r1, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #0x35
	movs r3, #0xe0
	bl ov86_021E6064
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E68B4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0x2b
	bl ov86_021E6024
	ldrb r0, [r5, #6]
	bl FUN_0205C1C8
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E68B4 @ =0x00010200
	movs r1, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #0x36
	movs r3, #0x70
	bl ov86_021E6064
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0203107C
	adds r4, r0, #0
	ldrb r0, [r5, #6]
	bl FUN_0205C240
	adds r6, r0, #0
	ldrb r0, [r5, #6]
	bl FUN_0205C240
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E68B4 @ =0x00010200
	movs r1, #3
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #0x35
	movs r3, #0xe0
	bl ov86_021E6064
	adds r0, r5, #0
	adds r0, #0x10
	bl FUN_0201D5C8
	adds r0, r5, #0
	adds r0, #0x20
	bl FUN_0201D5C8
	adds r0, r5, #0
	adds r0, #0x30
	bl FUN_0201D5C8
	adds r5, #0x40
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E68B0: .4byte 0x000F0200
_021E68B4: .4byte 0x00010200
	thumb_func_end ov86_021E66D0

	thumb_func_start ov86_021E68B8
ov86_021E68B8: @ 0x021E68B8
	push {r3, r4, lr}
	sub sp, #4
	ldrb r4, [r0, #6]
	cmp r4, #3
	bne _021E68E0
	movs r1, #0x89
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_0203107C
	adds r4, r0, #0
	movs r0, #0x6c
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0x6c
	bl FUN_020310BC
	b _021E68F6
_021E68E0:
	movs r1, #0x89
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_02030E08
	movs r3, #0
	movs r1, #9
	adds r2, r4, #0
	str r3, [sp]
	bl FUN_02030E58
_021E68F6:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _021E6904
	add sp, #4
	movs r0, #0x1e
	pop {r3, r4, pc}
_021E6904:
	movs r0, #0x1d
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov86_021E68B8

	thumb_func_start ov86_021E690C
ov86_021E690C: @ 0x021E690C
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E6A2C @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x19
	adds r3, r1, #0
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _021E694E
	movs r2, #0x1a
	b _021E6958
_021E694E:
	cmp r0, #1
	bne _021E6956
	movs r2, #0x1b
	b _021E6958
_021E6956:
	movs r2, #0x1c
_021E6958:
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E6A2C @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r3, #0xe0
	bl ov86_021E6024
	adds r0, r4, #0
	bl ov86_021E6A34
	movs r3, #0
	adds r2, r0, #0
	str r3, [sp]
	ldr r0, _021E6A30 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #1
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	bl FUN_0205C2C0
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6A30 @ =0x00010200
	movs r1, #1
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x37
	movs r3, #0x70
	bl ov86_021E6064
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6A30 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0x2b
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	bl FUN_0205C2E8
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6A30 @ =0x00010200
	movs r1, #2
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r2, #0x37
	movs r3, #0x70
	str r1, [sp, #0xc]
	bl ov86_021E6064
	adds r0, r4, #0
	adds r0, #0x10
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x20
	bl FUN_0201D5C8
	adds r4, #0x30
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	nop
_021E6A2C: .4byte 0x000F0200
_021E6A30: .4byte 0x00010200
	thumb_func_end ov86_021E690C

	thumb_func_start ov86_021E6A34
ov86_021E6A34: @ 0x021E6A34
	push {r3, r4, lr}
	sub sp, #4
	ldrb r4, [r0, #6]
	cmp r4, #3
	bne _021E6A5C
	movs r1, #0x89
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_0203107C
	adds r4, r0, #0
	movs r0, #0x6e
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0x6e
	bl FUN_020310BC
	b _021E6A72
_021E6A5C:
	movs r1, #0x89
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_02030FA0
	movs r3, #0
	movs r1, #8
	adds r2, r4, #0
	str r3, [sp]
	bl FUN_02030FE4
_021E6A72:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _021E6A80
	add sp, #4
	movs r0, #0x1e
	pop {r3, r4, pc}
_021E6A80:
	movs r0, #0x1d
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov86_021E6A34

	thumb_func_start ov86_021E6A88
ov86_021E6A88: @ 0x021E6A88
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x40
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E6BA0 @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x15
	adds r3, r1, #0
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _021E6ACA
	movs r2, #0x1a
	b _021E6ACC
_021E6ACA:
	movs r2, #0x1b
_021E6ACC:
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E6BA0 @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r3, #0xe0
	bl ov86_021E6024
	ldrb r1, [r4, #6]
	adds r0, r4, #0
	bl ov86_021E6DD8
	movs r3, #0
	adds r2, r0, #0
	str r3, [sp]
	ldr r0, _021E6BA4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #2
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	bl FUN_0205C310
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6BA4 @ =0x00010200
	movs r1, #2
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r2, #0x32
	movs r3, #0x70
	str r1, [sp, #0xc]
	bl ov86_021E6064
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6BA4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x2b
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	bl FUN_0205C350
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6BA4 @ =0x00010200
	movs r1, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x32
	movs r3, #0x70
	bl ov86_021E6064
	adds r0, r4, #0
	adds r0, #0x10
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x30
	bl FUN_0201D5C8
	adds r4, #0x40
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E6BA0: .4byte 0x000F0200
_021E6BA4: .4byte 0x00010200
	thumb_func_end ov86_021E6A88

	thumb_func_start ov86_021E6BA8
ov86_021E6BA8: @ 0x021E6BA8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x50
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x60
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x70
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x90
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E6DD0 @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r2, #0x15
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl ov86_021E6024
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E6DD0 @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x1c
	movs r3, #0xe0
	bl ov86_021E6024
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6DD4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x2c
	bl ov86_021E6024
	ldrb r1, [r4, #6]
	adds r0, r4, #0
	bl ov86_021E6DD8
	movs r3, #0
	adds r2, r0, #0
	str r3, [sp]
	ldr r0, _021E6DD4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #4
	str r3, [sp, #0xc]
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	bl FUN_0205C310
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6DD4 @ =0x00010200
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x32
	movs r3, #0x70
	bl ov86_021E6064
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6DD4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0x2b
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	bl FUN_0205C350
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6DD4 @ =0x00010200
	movs r1, #5
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x32
	movs r3, #0x70
	bl ov86_021E6064
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6DD4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0x2d
	str r3, [sp, #0xc]
	bl ov86_021E6024
	adds r0, r4, #0
	movs r1, #3
	bl ov86_021E6DD8
	movs r3, #0
	adds r2, r0, #0
	str r3, [sp]
	ldr r0, _021E6DD4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #7
	str r3, [sp, #0xc]
	bl ov86_021E6024
	movs r0, #3
	bl FUN_0205C310
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6DD4 @ =0x00010200
	movs r1, #7
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x32
	movs r3, #0x70
	bl ov86_021E6064
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6DD4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0x2b
	str r3, [sp, #0xc]
	bl ov86_021E6024
	movs r0, #3
	bl FUN_0205C350
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6DD4 @ =0x00010200
	movs r1, #8
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x32
	movs r3, #0x70
	bl ov86_021E6064
	adds r0, r4, #0
	adds r0, #0x10
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x20
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x50
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x60
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x70
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x80
	bl FUN_0201D5C8
	adds r4, #0x90
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E6DD0: .4byte 0x000F0200
_021E6DD4: .4byte 0x00010200
	thumb_func_end ov86_021E6BA8

	thumb_func_start ov86_021E6DD8
ov86_021E6DD8: @ 0x021E6DD8
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #0x89
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_0202D918
	cmp r4, #6
	bhi _021E6E1C
	adds r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E6DF6: @ jump table
	.2byte _021E6E04 - _021E6DF6 - 2 @ case 0
	.2byte _021E6E08 - _021E6DF6 - 2 @ case 1
	.2byte _021E6E0C - _021E6DF6 - 2 @ case 2
	.2byte _021E6E10 - _021E6DF6 - 2 @ case 3
	.2byte _021E6E14 - _021E6DF6 - 2 @ case 4
	.2byte _021E6E1C - _021E6DF6 - 2 @ case 5
	.2byte _021E6E18 - _021E6DF6 - 2 @ case 6
_021E6E04:
	movs r1, #8
	b _021E6E1E
_021E6E08:
	movs r1, #9
	b _021E6E1E
_021E6E0C:
	movs r1, #0xa
	b _021E6E1E
_021E6E10:
	movs r1, #0xb
	b _021E6E1E
_021E6E14:
	movs r1, #0xc
	b _021E6E1E
_021E6E18:
	movs r1, #0xf
	b _021E6E1E
_021E6E1C:
	movs r1, #8
_021E6E1E:
	movs r2, #0
	bl FUN_0202D5DC
	cmp r0, #1
	bne _021E6E2C
	movs r0, #0x1e
	pop {r4, pc}
_021E6E2C:
	movs r0, #0x1d
	pop {r4, pc}
	thumb_func_end ov86_021E6DD8

	thumb_func_start ov86_021E6E30
ov86_021E6E30: @ 0x021E6E30
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x21
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x27
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201EE90
	adds r2, r0, #0
	movs r0, #4
	str r0, [sp]
	ldr r0, _021E6E94 @ =0x000F0100
	lsls r3, r2, #3
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0x8f
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r4, #0
	asrs r2, r2, #1
	movs r3, #0
	bl ov86_021E5FD8
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E6E94: .4byte 0x000F0100
	thumb_func_end ov86_021E6E30

	thumb_func_start ov86_021E6E98
ov86_021E6E98: @ 0x021E6E98
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	adds r5, r0, #0
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x79
	bl FUN_0200CF18
	movs r1, #0x8b
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl FUN_0200CF38
	movs r7, #0x23
	lsls r7, r7, #4
	add r2, sp, #0x3c
	ldr r3, _021E6FE0 @ =0x021E7F74
	str r0, [r5, r7]
	ldm r3!, {r0, r1}
	adds r6, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	ldr r4, _021E6FE4 @ =0x021E7ED8
	stm r2!, {r0, r1}
	add r3, sp, #0x28
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	adds r1, r6, #0
	str r0, [r3]
	subs r0, r7, #4
	ldr r0, [r5, r0]
	movs r3, #0x20
	bl FUN_0200CF70
	ldr r3, _021E6FE8 @ =0x021E7EEC
	add r2, sp, #0x10
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r1, r7, #4
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #2
	bl FUN_0200CFF4
	subs r1, r7, #4
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	add r2, sp, #0x10
	bl FUN_0200D3F8
	subs r0, r7, #4
	ldr r0, [r5, r0]
	bl FUN_0200CF6C
	movs r2, #2
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r0, #0xb8
	movs r1, #0x79
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6FEC @ =0x0000D8CC
	subs r1, r7, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x33
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _021E6FEC @ =0x0000D8CC
	subs r1, r7, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x40
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	ldr r0, _021E6FEC @ =0x0000D8CC
	subs r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x31
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _021E6FEC @ =0x0000D8CC
	subs r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x32
	bl FUN_0200D71C
	adds r0, r4, #0
	bl FUN_0200770C
	ldr r6, _021E6FF0 @ =0x021E802C
	movs r7, #0
	adds r4, r5, #0
_021E6FB8:
	movs r0, #0x8b
	movs r1, #0x23
	lsls r0, r0, #2
	lsls r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl FUN_0200D734
	movs r1, #0x8d
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r7, r7, #1
	adds r6, #0x34
	adds r4, r4, #4
	cmp r7, #2
	blo _021E6FB8
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_021E6FE0: .4byte 0x021E7F74
_021E6FE4: .4byte 0x021E7ED8
_021E6FE8: .4byte 0x021E7EEC
_021E6FEC: .4byte 0x0000D8CC
_021E6FF0: .4byte 0x021E802C
	thumb_func_end ov86_021E6E98

	thumb_func_start ov86_021E6FF4
ov86_021E6FF4: @ 0x021E6FF4
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	movs r7, #0x8d
	str r0, [sp]
	adds r5, r0, #0
	adds r6, r4, #0
	lsls r7, r7, #2
_021E7002:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _021E7012
	bl FUN_0200D9DC
	movs r0, #0x8d
	lsls r0, r0, #2
	str r6, [r5, r0]
_021E7012:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blo _021E7002
	movs r1, #0x8b
	lsls r1, r1, #2
	ldr r0, [sp]
	adds r2, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [sp]
	ldr r1, [r1, r2]
	bl FUN_0200D998
	movs r1, #0x8b
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_0200D108
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov86_021E6FF4

	thumb_func_start ov86_021E703C
ov86_021E703C: @ 0x021E703C
	push {r4, r5, r6, lr}
	movs r6, #0x8d
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_021E7046:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _021E7050
	bl FUN_0200DC18
_021E7050:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blo _021E7046
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov86_021E703C

	thumb_func_start ov86_021E705C
ov86_021E705C: @ 0x021E705C
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	movs r2, #0x8d
	lsls r2, r2, #2
	lsls r4, r1, #2
	adds r5, r0, r2
	ldr r0, [r5, r4]
	movs r1, #0
	bl FUN_0200DCC0
	ldr r0, [r5, r4]
	adds r1, r6, #0
	bl FUN_0200DC4C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov86_021E705C

	thumb_func_start ov86_021E707C
ov86_021E707C: @ 0x021E707C
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _021E7090 @ =FUN_0200DDB8
	bx r3
	nop
_021E7090: .4byte FUN_0200DDB8
	thumb_func_end ov86_021E707C

	thumb_func_start ov86_021E7094
ov86_021E7094: @ 0x021E7094
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r3, _021E71B8 @ =0x0000024E
	adds r4, r0, #0
	ldrb r0, [r4, r3]
	cmp r0, #0
	beq _021E70AC
	cmp r0, #1
	beq _021E7118
	cmp r0, #2
	beq _021E719C
	b _021E71B2
_021E70AC:
	subs r0, r3, #2
	ldrb r0, [r4, r0]
	lsls r1, r0, #0x1f
	lsrs r1, r1, #0x1f
	bne _021E70D2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r3, #0
	subs r0, #0x1a
	ldr r0, [r1, r0]
	subs r1, r3, #1
	ldrb r1, [r4, r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bl FUN_0200DD10
	b _021E710E
_021E70D2:
	adds r0, r3, #4
	ldrb r0, [r4, r0]
	subs r1, r3, #2
	adds r2, r3, #2
	str r0, [sp]
	adds r0, r3, #5
	ldrb r0, [r4, r0]
	str r0, [sp, #4]
	subs r0, r3, #1
	ldrb r0, [r4, r0]
	adds r3, r3, #3
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	lsls r1, r1, #0x18
	ldr r0, [r4, #0xc]
	lsrs r1, r1, #0x19
	bl FUN_0201CA4C
	movs r1, #0x93
	lsls r1, r1, #2
	ldrb r1, [r4, r1]
	ldr r0, [r4, #0xc]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	bl FUN_0201EFBC
_021E710E:
	ldr r0, _021E71B8 @ =0x0000024E
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _021E71B2
_021E7118:
	adds r0, r3, #1
	ldrb r0, [r4, r0]
	adds r1, r0, #1
	adds r0, r3, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #4
	bne _021E71B2
	subs r0, r3, #2
	ldrb r0, [r4, r0]
	lsls r1, r0, #0x1f
	lsrs r1, r1, #0x1f
	bne _021E714E
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r3, #0
	subs r0, #0x1a
	ldr r0, [r1, r0]
	subs r1, r3, #1
	ldrb r1, [r4, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	bl FUN_0200DD10
	b _021E718A
_021E714E:
	adds r0, r3, #4
	ldrb r0, [r4, r0]
	subs r1, r3, #2
	adds r2, r3, #2
	str r0, [sp]
	adds r0, r3, #5
	ldrb r0, [r4, r0]
	str r0, [sp, #4]
	subs r0, r3, #1
	ldrb r0, [r4, r0]
	adds r3, r3, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	lsls r1, r1, #0x18
	ldr r0, [r4, #0xc]
	lsrs r1, r1, #0x19
	bl FUN_0201CA4C
	movs r1, #0x93
	lsls r1, r1, #2
	ldrb r1, [r4, r1]
	ldr r0, [r4, #0xc]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	bl FUN_0201EFBC
_021E718A:
	ldr r0, _021E71BC @ =0x0000024F
	movs r1, #0
	strb r1, [r4, r0]
	subs r1, r0, #1
	ldrb r1, [r4, r1]
	subs r0, r0, #1
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _021E71B2
_021E719C:
	adds r0, r3, #1
	ldrb r0, [r4, r0]
	adds r1, r0, #1
	adds r0, r3, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #2
	bne _021E71B2
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_021E71B2:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_021E71B8: .4byte 0x0000024E
_021E71BC: .4byte 0x0000024F
	thumb_func_end ov86_021E7094

	thumb_func_start ov86_021E71C0
ov86_021E71C0: @ 0x021E71C0
	movs r2, #0x93
	lsls r2, r2, #2
	ldrb r3, [r0, r2]
	movs r1, #1
	bics r3, r1
	strb r3, [r0, r2]
	ldrb r3, [r0, r2]
	movs r1, #0xfe
	bics r3, r1
	adds r1, r2, #1
	strb r3, [r0, r2]
	ldrb r3, [r0, r1]
	movs r1, #0xf
	bics r3, r1
	movs r1, #1
	orrs r3, r1
	adds r1, r2, #1
	strb r3, [r0, r1]
	ldrb r3, [r0, r1]
	movs r1, #0xf0
	bics r3, r1
	adds r1, r2, #1
	strb r3, [r0, r1]
	movs r3, #0
	adds r1, r2, #2
	strb r3, [r0, r1]
	adds r1, r2, #3
	strb r3, [r0, r1]
	bx lr
	.align 2, 0
	thumb_func_end ov86_021E71C0

	thumb_func_start ov86_021E71FC
ov86_021E71FC: @ 0x021E71FC
	ldrb r0, [r0, #7]
	cmp r0, #5
	bne _021E7206
	movs r0, #1
	bx lr
_021E7206:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov86_021E71FC

	thumb_func_start ov86_021E720C
ov86_021E720C: @ 0x021E720C
	push {r4, lr}
	adds r4, r0, #0
	bl ov86_021E74F0
	adds r0, r4, #0
	bl ov86_021E7418
	adds r0, r4, #0
	bl ov86_021E7598
	adds r0, r4, #0
	movs r1, #1
	bl ov86_021E7258
	movs r0, #0
	movs r1, #1
	movs r2, #0xd
	movs r3, #0x79
	bl FUN_020163E0
	movs r1, #0x33
	lsls r1, r1, #4
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov86_021E720C

	thumb_func_start ov86_021E723C
ov86_021E723C: @ 0x021E723C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x33
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_020164C4
	adds r0, r4, #0
	bl ov86_021E74D0
	adds r0, r4, #0
	bl ov86_021E73CC
	pop {r4, pc}
	thumb_func_end ov86_021E723C

	thumb_func_start ov86_021E7258
ov86_021E7258: @ 0x021E7258
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _021E726A
	cmp r1, #1
	beq _021E72A2
	cmp r1, #2
	beq _021E72E4
	b _021E7338
_021E726A:
	movs r2, #0
	ldr r0, [r4, #0xc]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201F238
	ldr r0, [r4, #0xc]
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	adds r0, r4, #0
	bl ov86_021E7C70
	adds r0, r4, #0
	bl ov86_021E73CC
	adds r0, r4, #0
	bl ov86_021E7D8C
	adds r0, r4, #0
	bl ov86_021E7DA8
	adds r0, r4, #0
	bl ov86_021E757C
	b _021E7338
_021E72A2:
	movs r2, #0
	ldr r0, [r4, #0xc]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201F238
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r4, #0xc]
	movs r1, #2
	adds r3, #0xfd
	bl FUN_0201F238
	adds r0, r4, #0
	bl ov86_021E7C70
	adds r0, r4, #0
	adds r0, #0x50
	bl FUN_0201D5C8
	adds r0, r4, #0
	bl ov86_021E73CC
	adds r0, r4, #0
	bl ov86_021E7630
	adds r0, r4, #0
	bl ov86_021E77BC
	adds r0, r4, #0
	bl ov86_021E752C
	b _021E7338
_021E72E4:
	movs r1, #2
	adds r3, r1, #0
	ldr r0, [r4, #0xc]
	movs r2, #0
	adds r3, #0xfe
	bl FUN_0201F238
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r4, #0xc]
	movs r1, #2
	adds r3, #0xfd
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0x50
	bl FUN_0201D8E4
	adds r0, r4, #0
	bl ov86_021E7DD4
	adds r0, r4, #0
	bl ov86_021E7B68
	adds r0, r4, #0
	bl ov86_021E7CF8
	adds r0, r4, #0
	bl ov86_021E7344
	adds r0, r4, #0
	bl ov86_021E7CA0
	adds r0, r4, #0
	bl ov86_021E73CC
	adds r0, r4, #0
	bl ov86_021E7860
	adds r0, r4, #0
	bl ov86_021E752C
_021E7338:
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_0201EFBC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov86_021E7258

	thumb_func_start ov86_021E7344
ov86_021E7344: @ 0x021E7344
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r2, _021E73C8 @ =0x0000025D
	adds r4, r0, #0
	ldrsb r0, [r4, r2]
	cmp r0, #0
	bne _021E7388
	movs r0, #0x34
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r2, #0xdd
	str r0, [sp, #8]
	lsls r2, r2, #2
	ldr r0, [r4, #0xc]
	movs r1, #2
	adds r2, r4, r2
	movs r3, #0x22
	bl FUN_0201C4C4
	movs r0, #0x34
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r2, #0xdd
	str r0, [sp, #8]
	lsls r2, r2, #2
	ldr r0, [r4, #0xc]
	movs r1, #2
	adds r2, r4, r2
	movs r3, #0x26
	bl FUN_0201C4C4
	b _021E73BA
_021E7388:
	movs r0, #0x34
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r2, #0xd7
	ldr r0, [r4, #0xc]
	movs r1, #2
	adds r2, r4, r2
	movs r3, #0x22
	bl FUN_0201C4C4
	movs r0, #0x34
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r2, #0xd5
	str r0, [sp, #8]
	lsls r2, r2, #2
	ldr r0, [r4, #0xc]
	movs r1, #2
	adds r2, r4, r2
	movs r3, #0x26
	bl FUN_0201C4C4
_021E73BA:
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E73C8: .4byte 0x0000025D
	thumb_func_end ov86_021E7344

	thumb_func_start ov86_021E73CC
ov86_021E73CC: @ 0x021E73CC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E73E6
	bl FUN_02019BDC
	movs r0, #0x95
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_021E73E6:
	pop {r4, pc}
	thumb_func_end ov86_021E73CC

	thumb_func_start ov86_021E73E8
ov86_021E73E8: @ 0x021E73E8
	bx lr
	.align 2, 0
	thumb_func_end ov86_021E73E8

	thumb_func_start ov86_021E73EC
ov86_021E73EC: @ 0x021E73EC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02091540
	movs r1, #1
	str r1, [sp]
	add r1, sp, #8
	adds r5, #0x12
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x79
	bl FUN_02007AC4
	ldr r1, [sp, #8]
	lsrs r1, r1, #1
	str r1, [r4]
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov86_021E73EC

	thumb_func_start ov86_021E7418
ov86_021E7418: @ 0x021E7418
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r1, #0x89
	lsls r1, r1, #2
	str r0, [sp]
	ldr r0, [r0, r1]
	movs r1, #0xb
	add r2, sp, #0x10
	bl FUN_020312C4
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _021E74C2
	movs r0, #0
	str r0, [sp, #4]
_021E7438:
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	bl ov86_021E73EC
	adds r7, r0, #0
	ldr r0, [sp, #4]
	lsls r1, r0, #3
	ldr r0, [sp]
	adds r5, r0, r1
	ldr r1, [sp, #0xc]
	movs r0, #0x79
	lsls r1, r1, #1
	bl FUN_0201AA8C
	movs r1, #0x26
	lsls r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [sp, #0xc]
	movs r4, #0
	cmp r0, #0
	bls _021E74AE
_021E7462:
	ldr r0, [sp]
	lsls r6, r4, #1
	ldrb r0, [r0, #6]
	bl FUN_0205C144
	adds r2, r0, #0
	movs r0, #0x89
	ldr r1, [sp]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldrh r3, [r7, r6]
	ldr r1, [sp, #8]
	bl FUN_020312E0
	cmp r0, #0
	beq _021E74A2
	movs r2, #0x99
	movs r0, #0x26
	lsls r2, r2, #2
	lsls r0, r0, #4
	ldr r2, [r5, r2]
	ldrh r1, [r7, r6]
	ldr r0, [r5, r0]
	lsls r2, r2, #1
	strh r1, [r0, r2]
	movs r0, #0x99
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r0, #1
	movs r0, #0x99
	lsls r0, r0, #2
	str r1, [r5, r0]
_021E74A2:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [sp, #0xc]
	cmp r4, r0
	blo _021E7462
_021E74AE:
	adds r0, r7, #0
	bl FUN_0201AB0C
	ldr r0, [sp, #4]
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	cmp r0, #0x1a
	blo _021E7438
_021E74C2:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _021E74CC
	bl FUN_0201AB0C
_021E74CC:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov86_021E7418

	thumb_func_start ov86_021E74D0
ov86_021E74D0: @ 0x021E74D0
	push {r4, r5, r6, lr}
	movs r6, #0x26
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #4
_021E74DA:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _021E74E4
	bl FUN_0201AB0C
_021E74E4:
	adds r4, r4, #1
	adds r5, #8
	cmp r4, #0x1a
	blo _021E74DA
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov86_021E74D0

	thumb_func_start ov86_021E74F0
ov86_021E74F0: @ 0x021E74F0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x79
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	ldr r2, _021E7528 @ =0x000003E2
	movs r1, #4
	movs r3, #0xe
	bl FUN_0200E644
	movs r1, #0x1a
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #0x79
	bl FUN_0200304C
	add sp, #8
	pop {r4, pc}
	nop
_021E7528: .4byte 0x000003E2
	thumb_func_end ov86_021E74F0

	thumb_func_start ov86_021E752C
ov86_021E752C: @ 0x021E752C
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r2, _021E7574 @ =0x000003E2
	adds r0, r4, r0
	movs r1, #1
	movs r3, #0xe
	bl FUN_0200E998
	movs r0, #6
	lsls r0, r0, #6
	adds r0, r4, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _021E7578 @ =0x0001020F
	movs r1, #0x17
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r2, #0x2a
	str r3, [sp, #0xc]
	bl ov86_021E6024
	movs r0, #6
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E7574: .4byte 0x000003E2
_021E7578: .4byte 0x0001020F
	thumb_func_end ov86_021E752C

	thumb_func_start ov86_021E757C
ov86_021E757C: @ 0x021E757C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	adds r0, r4, r0
	movs r1, #1
	bl FUN_0200E9BC
	ldr r0, [r4, #0xc]
	movs r1, #4
	bl FUN_0201EFBC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov86_021E757C

	thumb_func_start ov86_021E7598
ov86_021E7598: @ 0x021E7598
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	movs r4, #0
_021E75A0:
	ldr r0, _021E75E4 @ =0x021E81DC
	movs r1, #7
	ldrb r6, [r0, r4]
	adds r0, r6, #0
	blx FUN_020F2998
	adds r5, r1, #0
	adds r0, r6, #0
	movs r1, #7
	blx FUN_020F2998
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _021E75E8 @ =0x000F0100
	adds r2, r4, #0
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r5, #5
	str r0, [sp, #0xc]
	adds r0, r7, #0
	movs r1, #4
	adds r2, #0x38
	adds r3, #0x18
	bl ov86_021E6024
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1a
	blo _021E75A0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E75E4: .4byte 0x021E81DC
_021E75E8: .4byte 0x000F0100
	thumb_func_end ov86_021E7598

	thumb_func_start ov86_021E75EC
ov86_021E75EC: @ 0x021E75EC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	add r3, sp, #0
	ldrb r2, [r3, #1]
	ldrb r3, [r3]
	adds r0, r5, #0
	movs r1, #1
	bl ov86_021E707C
	cmp r4, #0x1a
	bne _021E7624
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov86_021E705C
	pop {r3, r4, r5, pc}
_021E7624:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #2
	bl ov86_021E705C
	pop {r3, r4, r5, pc}
	thumb_func_end ov86_021E75EC

	thumb_func_start ov86_021E7630
ov86_021E7630: @ 0x021E7630
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x96
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	ldr r1, _021E766C @ =0x021E8104
	ldr r2, _021E7670 @ =0x021E7EB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x79
	str r0, [sp, #8]
	ldr r0, _021E7674 @ =0x021E8094
	adds r3, r4, #0
	bl FUN_02019BA4
	movs r1, #0x95
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r1, r1, #4
	ldrh r1, [r4, r1]
	adds r0, r4, #0
	bl ov86_021E75EC
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E766C: .4byte 0x021E8104
_021E7670: .4byte 0x021E7EB8
_021E7674: .4byte 0x021E8094
	thumb_func_end ov86_021E7630

	thumb_func_start ov86_021E7678
ov86_021E7678: @ 0x021E7678
	ldr r3, _021E767C @ =ov86_021E75EC
	bx r3
	.align 2, 0
_021E767C: .4byte ov86_021E75EC
	thumb_func_end ov86_021E7678

	thumb_func_start ov86_021E7680
ov86_021E7680: @ 0x021E7680
	ldr r3, _021E7684 @ =ov86_021E75EC
	bx r3
	.align 2, 0
_021E7684: .4byte ov86_021E75EC
	thumb_func_end ov86_021E7680

	thumb_func_start ov86_021E7688
ov86_021E7688: @ 0x021E7688
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0x93
	adds r5, r0, #0
	lsls r1, r1, #2
	ldrb r2, [r5, r1]
	movs r0, #1
	bics r2, r0
	movs r0, #1
	orrs r0, r2
	strb r0, [r5, r1]
	ldrb r2, [r5, r1]
	movs r0, #0xfe
	bics r2, r0
	movs r0, #4
	orrs r0, r2
	strb r0, [r5, r1]
	adds r0, r1, #1
	ldrb r2, [r5, r0]
	movs r0, #0xf
	bics r2, r0
	movs r0, #2
	orrs r2, r0
	adds r0, r1, #1
	strb r2, [r5, r0]
	ldrb r2, [r5, r0]
	movs r0, #0xf0
	bics r2, r0
	adds r0, r1, #1
	strb r2, [r5, r0]
	ldr r0, _021E7708 @ =0x021E81DC
	movs r1, #7
	ldrb r4, [r0, r4]
	adds r0, r4, #0
	blx FUN_020F2BA4
	lsls r0, r1, #5
	adds r0, #0x18
	lsrs r1, r0, #3
	movs r0, #0x25
	lsls r0, r0, #4
	strb r1, [r5, r0]
	adds r0, r4, #0
	movs r1, #7
	blx FUN_020F2BA4
	lsls r0, r0, #5
	adds r0, #0x28
	lsrs r1, r0, #3
	ldr r0, _021E770C @ =0x00000251
	adds r1, #0x20
	strb r1, [r5, r0]
	movs r2, #2
	adds r1, r0, #1
	strb r2, [r5, r1]
	adds r1, r0, #2
	strb r2, [r5, r1]
	subs r1, r0, #3
	movs r2, #0
	strb r2, [r5, r1]
	subs r0, r0, #2
	strb r2, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_021E7708: .4byte 0x021E81DC
_021E770C: .4byte 0x00000251
	thumb_func_end ov86_021E7688

	thumb_func_start ov86_021E7710
ov86_021E7710: @ 0x021E7710
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02019BE4
	adds r5, r0, #0
	cmp r5, #0x1a
	bhi _021E7728
	beq _021E7742
	b _021E7764
_021E7728:
	adds r0, r5, #4
	cmp r0, #3
	bhi _021E7764
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E773A: @ jump table
	.2byte _021E77AA - _021E773A - 2 @ case 0
	.2byte _021E775C - _021E773A - 2 @ case 1
	.2byte _021E7742 - _021E773A - 2 @ case 2
	.2byte _021E77AA - _021E773A - 2 @ case 3
_021E7742:
	ldr r0, _021E77B0 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov86_021E71C0
	adds r0, r4, #0
	bl ov86_021E723C
	movs r0, #0xa
	strb r0, [r4, #5]
	movs r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_021E775C:
	ldr r0, _021E77B4 @ =0x000005DC
	bl FUN_0200604C
	b _021E77AA
_021E7764:
	movs r0, #0x99
	lsls r0, r0, #2
	adds r6, r4, r0
	lsls r7, r5, #3
	ldr r0, [r6, r7]
	cmp r0, #0
	bne _021E777A
	ldr r0, _021E77B8 @ =0x000005F2
	bl FUN_0200604C
	b _021E77AA
_021E777A:
	ldr r0, _021E77B0 @ =0x000005DD
	bl FUN_0200604C
	movs r1, #0x96
	lsls r1, r1, #2
	strh r5, [r4, r1]
	movs r2, #0
	adds r0, r1, #2
	strh r2, [r4, r0]
	adds r0, r1, #4
	strb r2, [r4, r0]
	ldr r0, [r6, r7]
	subs r0, r0, #1
	lsrs r2, r0, #3
	adds r0, r1, #5
	strb r2, [r4, r0]
	ldrh r1, [r4, r1]
	adds r0, r4, #0
	bl ov86_021E7688
	movs r0, #4
	strb r0, [r4, #5]
	movs r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_021E77AA:
	movs r0, #3
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E77B0: .4byte 0x000005DD
_021E77B4: .4byte 0x000005DC
_021E77B8: .4byte 0x000005F2
	thumb_func_end ov86_021E7710

	thumb_func_start ov86_021E77BC
ov86_021E77BC: @ 0x021E77BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #0
	movs r7, #1
_021E77C8:
	movs r0, #0x99
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E77FA
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov86_021E7688
	ldr r0, _021E7810 @ =0x00000252
	movs r2, #0x25
	ldrb r0, [r5, r0]
	ldr r3, _021E7814 @ =0x00000251
	lsls r2, r2, #4
	str r0, [sp]
	ldr r0, _021E7818 @ =0x00000253
	movs r1, #2
	ldrb r0, [r5, r0]
	str r0, [sp, #4]
	str r7, [sp, #8]
	ldrb r2, [r5, r2]
	ldrb r3, [r5, r3]
	ldr r0, [r5, #0xc]
	bl FUN_0201CA4C
_021E77FA:
	adds r6, r6, #1
	adds r4, #8
	cmp r6, #0x1a
	blo _021E77C8
	ldr r0, [r5, #0xc]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E7810: .4byte 0x00000252
_021E7814: .4byte 0x00000251
_021E7818: .4byte 0x00000253
	thumb_func_end ov86_021E77BC

	thumb_func_start ov86_021E781C
ov86_021E781C: @ 0x021E781C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	add r3, sp, #0
	ldrb r2, [r3, #1]
	ldrb r3, [r3]
	adds r0, r5, #0
	movs r1, #1
	bl ov86_021E707C
	cmp r4, #8
	bne _021E7854
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov86_021E705C
	pop {r3, r4, r5, pc}
_021E7854:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #3
	bl ov86_021E705C
	pop {r3, r4, r5, pc}
	thumb_func_end ov86_021E781C

	thumb_func_start ov86_021E7860
ov86_021E7860: @ 0x021E7860
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _021E7898 @ =0x0000025A
	ldr r1, _021E789C @ =0x021E7FE4
	ldrh r4, [r5, r0]
	movs r0, #1
	ldr r2, _021E78A0 @ =0x021E7EA8
	str r0, [sp]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x79
	str r0, [sp, #8]
	ldr r0, _021E78A4 @ =0x021E7F94
	adds r3, r5, #0
	bl FUN_02019BA4
	movs r1, #0x95
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov86_021E781C
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E7898: .4byte 0x0000025A
_021E789C: .4byte 0x021E7FE4
_021E78A0: .4byte 0x021E7EA8
_021E78A4: .4byte 0x021E7F94
	thumb_func_end ov86_021E7860

	thumb_func_start ov86_021E78A8
ov86_021E78A8: @ 0x021E78A8
	ldr r3, _021E78AC @ =ov86_021E781C
	bx r3
	.align 2, 0
_021E78AC: .4byte ov86_021E781C
	thumb_func_end ov86_021E78A8

	thumb_func_start ov86_021E78B0
ov86_021E78B0: @ 0x021E78B0
	ldr r3, _021E78B4 @ =ov86_021E781C
	bx r3
	.align 2, 0
_021E78B4: .4byte ov86_021E781C
	thumb_func_end ov86_021E78B0

	thumb_func_start ov86_021E78B8
ov86_021E78B8: @ 0x021E78B8
	push {r3, r4, r5, r6}
	movs r2, #0x93
	lsls r2, r2, #2
	ldrb r4, [r0, r2]
	movs r3, #1
	bics r4, r3
	movs r3, #1
	orrs r4, r3
	strb r4, [r0, r2]
	ldrb r5, [r0, r2]
	movs r4, #0xfe
	bics r5, r4
	movs r4, #4
	orrs r4, r5
	strb r4, [r0, r2]
	adds r4, r2, #1
	ldrb r5, [r0, r4]
	movs r4, #0xf
	bics r5, r4
	adds r6, r5, #0
	movs r4, #2
	orrs r6, r4
	adds r5, r2, #1
	strb r6, [r0, r5]
	ldrb r6, [r0, r5]
	movs r5, #0xf0
	bics r6, r5
	adds r5, r2, #1
	strb r6, [r0, r5]
	ldr r5, _021E7928 @ =0x021E81DC
	ldrb r1, [r5, r1]
	adds r5, r1, #0
	ands r5, r3
	movs r3, #0xd
	adds r6, r5, #0
	muls r6, r3, r6
	adds r6, #0x26
	adds r3, r2, #4
	lsrs r1, r1, #1
	strb r6, [r0, r3]
	lsls r3, r1, #2
	adds r3, #0x25
	adds r1, r2, #5
	strb r3, [r0, r1]
	movs r3, #9
	adds r1, r2, #6
	strb r3, [r0, r1]
	adds r1, r2, #7
	strb r4, [r0, r1]
	movs r3, #0
	adds r1, r2, #2
	strb r3, [r0, r1]
	adds r1, r2, #3
	strb r3, [r0, r1]
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
_021E7928: .4byte 0x021E81DC
	thumb_func_end ov86_021E78B8

	thumb_func_start ov86_021E792C
ov86_021E792C: @ 0x021E792C
	push {r3, r4, r5, r6}
	movs r4, #0x93
	lsls r4, r4, #2
	ldrb r5, [r0, r4]
	movs r3, #1
	bics r5, r3
	movs r3, #1
	orrs r3, r5
	strb r3, [r0, r4]
	ldrb r5, [r0, r4]
	movs r3, #0xfe
	bics r5, r3
	movs r3, #4
	orrs r5, r3
	strb r5, [r0, r4]
	adds r5, r4, #1
	ldrb r6, [r0, r5]
	movs r5, #0xf
	bics r6, r5
	movs r5, #2
	orrs r6, r5
	adds r5, r4, #1
	strb r6, [r0, r5]
	ldrb r6, [r0, r5]
	movs r5, #0xf0
	bics r6, r5
	adds r5, r4, #1
	strb r6, [r0, r5]
	adds r5, r4, #4
	strb r1, [r0, r5]
	adds r1, r4, #5
	strb r2, [r0, r1]
	adds r1, r4, #6
	strb r3, [r0, r1]
	adds r1, r4, #7
	strb r3, [r0, r1]
	movs r2, #0
	adds r1, r4, #2
	strb r2, [r0, r1]
	adds r1, r4, #3
	strb r2, [r0, r1]
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
	thumb_func_end ov86_021E792C

	thumb_func_start ov86_021E7984
ov86_021E7984: @ 0x021E7984
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02019BE4
	adds r5, r0, #0
	cmp r5, #8
	bhi _021E799C
	beq _021E79B6
	b _021E7A76
_021E799C:
	adds r0, r5, #4
	cmp r0, #3
	bhi _021E7A76
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E79AE: @ jump table
	.2byte _021E7AB4 - _021E79AE - 2 @ case 0
	.2byte _021E79CA - _021E79AE - 2 @ case 1
	.2byte _021E79B6 - _021E79AE - 2 @ case 2
	.2byte _021E79D2 - _021E79AE - 2 @ case 3
_021E79B6:
	ldr r0, _021E7B3C @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov86_021E71C0
	movs r0, #2
	strb r0, [r4, #5]
	movs r0, #9
	pop {r3, r4, r5, pc}
_021E79CA:
	ldr r0, _021E7B40 @ =0x000005DC
	bl FUN_0200604C
	b _021E7AB4
_021E79D2:
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02019F74
	cmp r0, #7
	bhi _021E7AB4
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E79EC: @ jump table
	.2byte _021E79FC - _021E79EC - 2 @ case 0
	.2byte _021E7A38 - _021E79EC - 2 @ case 1
	.2byte _021E79FC - _021E79EC - 2 @ case 2
	.2byte _021E7A38 - _021E79EC - 2 @ case 3
	.2byte _021E79FC - _021E79EC - 2 @ case 4
	.2byte _021E7A38 - _021E79EC - 2 @ case 5
	.2byte _021E79FC - _021E79EC - 2 @ case 6
	.2byte _021E7A38 - _021E79EC - 2 @ case 7
_021E79FC:
	ldr r0, _021E7B44 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0x20
	tst r0, r1
	beq _021E7AB4
	ldr r1, _021E7B48 @ =0x0000025D
	ldrsb r0, [r4, r1]
	cmp r0, #0
	beq _021E7AB4
	subs r0, r1, #1
	ldrsb r0, [r4, r0]
	subs r2, r0, #1
	subs r0, r1, #1
	strb r2, [r4, r0]
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _021E7A24
	ldrsb r2, [r4, r1]
	subs r0, r1, #1
	strb r2, [r4, r0]
_021E7A24:
	ldr r0, _021E7B40 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov86_021E7B68
	adds r0, r4, #0
	bl ov86_021E7CF8
	b _021E7AB4
_021E7A38:
	ldr r0, _021E7B44 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0x10
	tst r0, r1
	beq _021E7AB4
	ldr r1, _021E7B48 @ =0x0000025D
	ldrsb r0, [r4, r1]
	cmp r0, #0
	beq _021E7AB4
	subs r0, r1, #1
	ldrsb r0, [r4, r0]
	adds r2, r0, #1
	subs r0, r1, #1
	strb r2, [r4, r0]
	ldrsb r2, [r4, r0]
	ldrsb r0, [r4, r1]
	cmp r2, r0
	ble _021E7A62
	movs r2, #0
	subs r0, r1, #1
	strb r2, [r4, r0]
_021E7A62:
	ldr r0, _021E7B40 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov86_021E7B68
	adds r0, r4, #0
	bl ov86_021E7CF8
	b _021E7AB4
_021E7A76:
	movs r1, #0x97
	lsls r1, r1, #2
	subs r2, r1, #4
	ldrh r2, [r4, r2]
	ldrsb r0, [r4, r1]
	lsls r2, r2, #3
	adds r3, r4, r2
	adds r2, r1, #0
	adds r2, #8
	lsls r0, r0, #3
	ldr r2, [r3, r2]
	adds r0, r5, r0
	cmp r0, r2
	blo _021E7A9A
	ldr r0, _021E7B4C @ =0x000005F2
	bl FUN_0200604C
	b _021E7AB4
_021E7A9A:
	subs r0, r1, #2
	strh r5, [r4, r0]
	ldr r0, _021E7B3C @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov86_021E78B8
	movs r0, #7
	strb r0, [r4, #5]
	movs r0, #9
	pop {r3, r4, r5, pc}
_021E7AB4:
	ldr r0, _021E7B50 @ =0x021E7E9C
	bl FUN_02025224
	cmp r0, #0
	beq _021E7AC4
	cmp r0, #1
	beq _021E7AFC
	b _021E7B36
_021E7AC4:
	ldr r1, _021E7B48 @ =0x0000025D
	ldrsb r0, [r4, r1]
	cmp r0, #0
	beq _021E7B36
	subs r0, r1, #1
	ldrsb r0, [r4, r0]
	subs r2, r0, #1
	subs r0, r1, #1
	strb r2, [r4, r0]
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _021E7AE2
	ldrsb r2, [r4, r1]
	subs r0, r1, #1
	strb r2, [r4, r0]
_021E7AE2:
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #0x34
	bl ov86_021E792C
	movs r0, #6
	strb r0, [r4, #5]
	movs r0, #9
	pop {r3, r4, r5, pc}
_021E7AFC:
	ldr r1, _021E7B48 @ =0x0000025D
	ldrsb r0, [r4, r1]
	cmp r0, #0
	beq _021E7B36
	subs r0, r1, #1
	ldrsb r0, [r4, r0]
	adds r2, r0, #1
	subs r0, r1, #1
	strb r2, [r4, r0]
	ldrsb r2, [r4, r0]
	ldrsb r0, [r4, r1]
	cmp r2, r0
	ble _021E7B1C
	movs r2, #0
	subs r0, r1, #1
	strb r2, [r4, r0]
_021E7B1C:
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x26
	movs r2, #0x34
	bl ov86_021E792C
	movs r0, #6
	strb r0, [r4, #5]
	movs r0, #9
	pop {r3, r4, r5, pc}
_021E7B36:
	movs r0, #5
	pop {r3, r4, r5, pc}
	nop
_021E7B3C: .4byte 0x000005DD
_021E7B40: .4byte 0x000005DC
_021E7B44: .4byte 0x021D110C
_021E7B48: .4byte 0x0000025D
_021E7B4C: .4byte 0x000005F2
_021E7B50: .4byte 0x021E7E9C
	thumb_func_end ov86_021E7984

	thumb_func_start ov86_021E7B54
ov86_021E7B54: @ 0x021E7B54
	push {r4, lr}
	adds r4, r0, #0
	bl ov86_021E7B68
	adds r0, r4, #0
	bl ov86_021E7CF8
	movs r0, #5
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov86_021E7B54

	thumb_func_start ov86_021E7B68
ov86_021E7B68: @ 0x021E7B68
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r4, r0, #0
	ldr r0, _021E7C5C @ =0x0000025E
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _021E7B7C
	movs r0, #5
	str r0, [sp, #0x10]
	b _021E7B80
_021E7B7C:
	movs r0, #0xd
	str r0, [sp, #0x10]
_021E7B80:
	movs r0, #0x97
	lsls r0, r0, #2
	ldrsb r0, [r4, r0]
	adds r7, r4, #0
	movs r6, #0
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	lsls r0, r0, #1
	str r0, [sp, #0x14]
	adds r7, #0x10
_021E7B96:
	ldr r0, [sp, #0x10]
	movs r1, #0
	adds r0, r0, r6
	lsls r0, r0, #4
	str r0, [sp, #0x20]
	adds r0, r7, r0
	bl FUN_0201D978
	movs r0, #0x96
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	lsls r0, r0, #3
	adds r1, r4, r0
	movs r0, #0x99
	lsls r0, r0, #2
	ldr r2, [r1, r0]
	ldr r0, [sp, #0x18]
	adds r0, r0, r6
	cmp r2, r0
	bls _021E7C06
	movs r2, #0x26
	lsls r2, r2, #4
	ldr r3, [r1, r2]
	ldr r1, [sp, #0x14]
	lsls r2, r6, #1
	adds r1, r1, r3
	ldrh r1, [r2, r1]
	adds r0, r4, #0
	bl ov86_021E668C
	ldr r0, [sp, #0x20]
	adds r0, r7, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _021E7C60 @ =0x000F0100
	lsls r5, r3, #3
	ldr r1, [sp, #0x10]
	lsrs r3, r5, #0x1f
	str r0, [sp, #8]
	movs r0, #2
	adds r3, r5, r3
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r1, r6
	movs r2, #0x13
	asrs r3, r3, #1
	bl ov86_021E6064
	movs r0, #0
	str r0, [sp, #0x1c]
	b _021E7C0A
_021E7C06:
	movs r0, #1
	str r0, [sp, #0x1c]
_021E7C0A:
	ldr r0, [sp, #0x20]
	adds r0, r7, r0
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov86_021E78B8
	ldr r0, _021E7C64 @ =0x00000252
	movs r2, #0x25
	ldrb r0, [r4, r0]
	ldr r3, _021E7C68 @ =0x00000251
	lsls r2, r2, #4
	str r0, [sp]
	ldr r0, _021E7C6C @ =0x00000253
	movs r1, #2
	ldrb r0, [r4, r0]
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #8]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	ldr r0, [r4, #0xc]
	bl FUN_0201CA4C
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #8
	blo _021E7B96
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_0201EFBC
	ldr r1, _021E7C5C @ =0x0000025E
	movs r0, #1
	ldrh r2, [r4, r1]
	eors r0, r2
	strh r0, [r4, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E7C5C: .4byte 0x0000025E
_021E7C60: .4byte 0x000F0100
_021E7C64: .4byte 0x00000252
_021E7C68: .4byte 0x00000251
_021E7C6C: .4byte 0x00000253
	thumb_func_end ov86_021E7B68

	thumb_func_start ov86_021E7C70
ov86_021E7C70: @ 0x021E7C70
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	movs r4, #5
	adds r5, #0x60
_021E7C7A:
	adds r0, r5, #0
	bl FUN_0201D8E4
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0xd
	bls _021E7C7A
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r6, r0
	bl FUN_0201D8E4
	movs r0, #0x17
	lsls r0, r0, #4
	adds r0, r6, r0
	bl FUN_0201D8E4
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov86_021E7C70

	thumb_func_start ov86_021E7CA0
ov86_021E7CA0: @ 0x021E7CA0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _021E7CF4 @ =0x000F0100
	movs r2, #0x96
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	lsls r2, r2, #2
	ldrh r2, [r4, r2]
	lsls r5, r3, #3
	lsrs r3, r5, #0x1f
	adds r3, r5, r3
	adds r0, r4, #0
	movs r1, #0x15
	adds r2, #0x38
	asrs r3, r3, #1
	bl ov86_021E6024
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7CF4: .4byte 0x000F0100
	thumb_func_end ov86_021E7CA0

	thumb_func_start ov86_021E7CF8
ov86_021E7CF8: @ 0x021E7CF8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x17
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r2, #0x97
	lsls r2, r2, #2
	ldrsb r2, [r4, r2]
	adds r0, r4, #0
	movs r1, #0
	adds r2, r2, #1
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E7D84 @ =0x00010200
	movs r1, #0x16
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x28
	movs r3, #8
	bl ov86_021E6064
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E7D84 @ =0x00010200
	movs r1, #0x16
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x29
	movs r3, #0x10
	bl ov86_021E6024
	ldr r2, _021E7D88 @ =0x0000025D
	adds r0, r4, #0
	ldrsb r2, [r4, r2]
	movs r1, #0
	adds r2, r2, #1
	bl ov86_021E5FBC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E7D84 @ =0x00010200
	movs r1, #0x16
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x28
	movs r3, #0x20
	bl ov86_021E6064
	movs r0, #0x17
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E7D84: .4byte 0x00010200
_021E7D88: .4byte 0x0000025D
	thumb_func_end ov86_021E7CF8

	thumb_func_start ov86_021E7D8C
ov86_021E7D8C: @ 0x021E7D8C
	push {r4, lr}
	movs r1, #1
	movs r2, #0xe0
	movs r3, #0xb0
	adds r4, r0, #0
	bl ov86_021E707C
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov86_021E705C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov86_021E7D8C

	thumb_func_start ov86_021E7DA8
ov86_021E7DA8: @ 0x021E7DA8
	movs r2, #0x96
	lsls r2, r2, #2
	ldrh r1, [r0, r2]
	lsls r1, r1, #3
	adds r3, r0, r1
	adds r1, r2, #0
	adds r1, #8
	ldr r1, [r3, r1]
	adds r3, r2, #2
	adds r2, r2, #4
	ldrsb r2, [r0, r2]
	ldrh r3, [r0, r3]
	lsls r2, r2, #3
	adds r2, r3, r2
	lsls r2, r2, #1
	ldrh r1, [r1, r2]
	ldr r3, _021E7DD0 @ =ov86_021E64E0
	strh r1, [r0, #8]
	bx r3
	nop
_021E7DD0: .4byte ov86_021E64E0
	thumb_func_end ov86_021E7DA8

	thumb_func_start ov86_021E7DD4
ov86_021E7DD4: @ 0x021E7DD4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x10
	bl FUN_0201D8E4
	adds r0, r4, #0
	adds r0, #0x20
	bl FUN_0201D8E4
	adds r0, r4, #0
	adds r0, #0x30
	bl FUN_0201D8E4
	adds r4, #0x40
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	thumb_func_end ov86_021E7DD4

	thumb_func_start ov86_021E7DF8
ov86_021E7DF8: @ 0x021E7DF8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	adds r5, r1, #0
	ldr r0, _021E7E38 @ =0x021E8230
	lsls r1, r2, #3
	ldr r0, [r0, r1]
	movs r4, #0
	str r0, [sp, #4]
	ldr r0, _021E7E3C @ =0x021E8234
	ldr r7, [r0, r1]
	cmp r7, #0
	bls _021E7E34
_021E7E12:
	ldr r2, [sp, #4]
	lsls r6, r4, #4
	lsls r3, r4, #3
	ldr r0, [sp]
	adds r1, r5, r6
	adds r2, r2, r3
	bl FUN_0201D4F8
	adds r0, r5, r6
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	blo _021E7E12
_021E7E34:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E7E38: .4byte 0x021E8230
_021E7E3C: .4byte 0x021E8234
	thumb_func_end ov86_021E7DF8

	thumb_func_start ov86_021E7E40
ov86_021E7E40: @ 0x021E7E40
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _021E7E64 @ =0x021E8234
	lsls r1, r1, #3
	ldr r5, [r0, r1]
	movs r4, #0
	cmp r5, #0
	bls _021E7E62
_021E7E50:
	lsls r0, r4, #4
	adds r0, r6, r0
	bl FUN_0201D520
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r5
	blo _021E7E50
_021E7E62:
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E7E64: .4byte 0x021E8234
	thumb_func_end ov86_021E7E40

	thumb_func_start ov86_021E7E68
ov86_021E7E68: @ 0x021E7E68
	push {lr}
	sub sp, #0x14
	movs r2, #0x15
	str r2, [sp]
	movs r2, #6
	str r2, [sp, #4]
	movs r2, #2
	str r2, [sp, #8]
	movs r2, #0xd
	str r2, [sp, #0xc]
	movs r2, #0xfd
	lsls r2, r2, #2
	str r2, [sp, #0x10]
	movs r2, #0
	movs r3, #0x19
	bl FUN_0201D40C
	add sp, #0x14
	pop {pc}
	.align 2, 0
	thumb_func_end ov86_021E7E68

	thumb_func_start ov86_021E7E90
ov86_021E7E90: @ 0x021E7E90
	ldr r3, _021E7E94 @ =FUN_0201D520
	bx r3
	.align 2, 0
_021E7E94: .4byte FUN_0201D520
	thumb_func_end ov86_021E7E90

	.rodata

_021E7E98:
	.byte 0xA4, 0xBB, 0xC1, 0xFE, 0xA2, 0xBD, 0x12, 0x2D
	.byte 0xA2, 0xBD, 0x32, 0x4D, 0xFF, 0x00, 0x00, 0x00, 0xE9, 0x73, 0x1E, 0x02, 0xE9, 0x73, 0x1E, 0x02
	.byte 0xA9, 0x78, 0x1E, 0x02, 0xB1, 0x78, 0x1E, 0x02, 0xE9, 0x73, 0x1E, 0x02, 0xE9, 0x73, 0x1E, 0x02
	.byte 0x79, 0x76, 0x1E, 0x02, 0x81, 0x76, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x1B, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x20, 0x3F, 0x28, 0x7F, 0x20, 0x3F, 0x90, 0xE7, 0x40, 0x5F, 0x28, 0x7F
	.byte 0x40, 0x5F, 0x90, 0xE7, 0x60, 0x7F, 0x28, 0x7F, 0x60, 0x7F, 0x90, 0xE7, 0x80, 0x9F, 0x28, 0x7F
	.byte 0x80, 0x9F, 0x90, 0xE7, 0xA4, 0xBB, 0xC1, 0xFE, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x54, 0x30, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0xBC, 0x30, 0x00, 0x00
	.byte 0x01, 0x03, 0x00, 0x01, 0x54, 0x50, 0x00, 0x00, 0x00, 0x04, 0x02, 0x03, 0xBC, 0x50, 0x00, 0x00
	.byte 0x01, 0x05, 0x02, 0x03, 0x54, 0x70, 0x00, 0x00, 0x02, 0x06, 0x04, 0x05, 0xBC, 0x70, 0x00, 0x00
	.byte 0x03, 0x07, 0x04, 0x05, 0x54, 0x90, 0x00, 0x00, 0x04, 0x08, 0x06, 0x07, 0xBC, 0x90, 0x00, 0x00
	.byte 0x05, 0x08, 0x06, 0x07, 0xE0, 0xB0, 0x00, 0x00, 0x87, 0x08, 0x08, 0x08, 0xE0, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xCC, 0xD8, 0x00, 0x00, 0xCC, 0xD8, 0x00, 0x00, 0xCC, 0xD8, 0x00, 0x00, 0xCC, 0xD8, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xCC, 0xD8, 0x00, 0x00, 0xCC, 0xD8, 0x00, 0x00, 0xCC, 0xD8, 0x00, 0x00
	.byte 0xCC, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x28, 0x37, 0x18, 0x27, 0x28, 0x37, 0x38, 0x47, 0x28, 0x37, 0x58, 0x67
	.byte 0x28, 0x37, 0x78, 0x87, 0x28, 0x37, 0x98, 0xA7, 0x28, 0x37, 0xB8, 0xC7, 0x28, 0x37, 0xD8, 0xE7
	.byte 0x48, 0x57, 0x18, 0x27, 0x48, 0x57, 0x38, 0x47, 0x48, 0x57, 0x58, 0x67, 0x48, 0x57, 0x78, 0x87
	.byte 0x48, 0x57, 0x98, 0xA7, 0x48, 0x57, 0xB8, 0xC7, 0x48, 0x57, 0xD8, 0xE7, 0x68, 0x77, 0x18, 0x27
	.byte 0x68, 0x77, 0x38, 0x47, 0x68, 0x77, 0x58, 0x67, 0x68, 0x77, 0x78, 0x87, 0x68, 0x77, 0x98, 0xA7
	.byte 0x68, 0x77, 0xB8, 0xC7, 0x68, 0x77, 0xD8, 0xE7, 0x88, 0x97, 0x18, 0x27, 0x88, 0x97, 0x38, 0x47
	.byte 0x88, 0x97, 0x58, 0x67, 0x88, 0x97, 0x78, 0x87, 0x88, 0x97, 0x98, 0xA7, 0xA4, 0xBB, 0xC1, 0xFE
	.byte 0xFF, 0x00, 0x00, 0x00, 0x20, 0x30, 0x00, 0x00, 0x00, 0x07, 0x00, 0x01, 0x40, 0x30, 0x00, 0x00
	.byte 0x01, 0x08, 0x00, 0x02, 0x60, 0x30, 0x00, 0x00, 0x02, 0x09, 0x01, 0x03, 0x80, 0x30, 0x00, 0x00
	.byte 0x03, 0x0A, 0x02, 0x04, 0xA0, 0x30, 0x00, 0x00, 0x04, 0x0B, 0x03, 0x05, 0xC0, 0x30, 0x00, 0x00
	.byte 0x05, 0x0C, 0x04, 0x06, 0xE0, 0x30, 0x00, 0x00, 0x06, 0x0D, 0x05, 0x06, 0x20, 0x50, 0x00, 0x00
	.byte 0x00, 0x0E, 0x07, 0x08, 0x40, 0x50, 0x00, 0x00, 0x01, 0x0F, 0x07, 0x09, 0x60, 0x50, 0x00, 0x00
	.byte 0x02, 0x10, 0x08, 0x0A, 0x80, 0x50, 0x00, 0x00, 0x03, 0x11, 0x09, 0x0B, 0xA0, 0x50, 0x00, 0x00
	.byte 0x04, 0x12, 0x0A, 0x0C, 0xC0, 0x50, 0x00, 0x00, 0x05, 0x13, 0x0B, 0x0D, 0xE0, 0x50, 0x00, 0x00
	.byte 0x06, 0x14, 0x0C, 0x0D, 0x20, 0x70, 0x00, 0x00, 0x07, 0x15, 0x0E, 0x0F, 0x40, 0x70, 0x00, 0x00
	.byte 0x08, 0x16, 0x0E, 0x10, 0x60, 0x70, 0x00, 0x00, 0x09, 0x17, 0x0F, 0x11, 0x80, 0x70, 0x00, 0x00
	.byte 0x0A, 0x18, 0x10, 0x12, 0xA0, 0x70, 0x00, 0x00, 0x0B, 0x19, 0x11, 0x13, 0xC0, 0x70, 0x00, 0x00
	.byte 0x0C, 0x1A, 0x12, 0x14, 0xE0, 0x70, 0x00, 0x00, 0x0D, 0x1A, 0x13, 0x14, 0x20, 0x90, 0x00, 0x00
	.byte 0x0E, 0x1A, 0x15, 0x16, 0x40, 0x90, 0x00, 0x00, 0x0F, 0x1A, 0x15, 0x17, 0x60, 0x90, 0x00, 0x00
	.byte 0x10, 0x1A, 0x16, 0x18, 0x80, 0x90, 0x00, 0x00, 0x11, 0x1A, 0x17, 0x19, 0xA0, 0x90, 0x00, 0x00
	.byte 0x12, 0x1A, 0x18, 0x19, 0xE0, 0xB0, 0x00, 0x00, 0x84, 0x1A, 0x1A, 0x1A, 0x00, 0x01, 0x02, 0x03
	.byte 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13
	.byte 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x00, 0x00, 0x00, 0x02, 0x01, 0x1C, 0x02, 0x0D, 0x01, 0x00
	.byte 0x00, 0x02, 0x07, 0x17, 0x02, 0x0D, 0x39, 0x00, 0x00, 0x02, 0x0A, 0x17, 0x02, 0x0D, 0x67, 0x00
	.byte 0x00, 0x02, 0x01, 0x1C, 0x02, 0x0D, 0x01, 0x00, 0x00, 0x10, 0x07, 0x0E, 0x02, 0x0D, 0x39, 0x00
	.byte 0x00, 0x02, 0x0B, 0x1C, 0x02, 0x0D, 0x55, 0x00, 0x00, 0x02, 0x0E, 0x1C, 0x02, 0x0D, 0x8D, 0x00
	.byte 0x58, 0x82, 0x1E, 0x02, 0x07, 0x00, 0x00, 0x00, 0xD8, 0x82, 0x1E, 0x02, 0x18, 0x00, 0x00, 0x00
	.byte 0x10, 0x82, 0x1E, 0x02, 0x04, 0x00, 0x00, 0x00, 0xF8, 0x81, 0x1E, 0x02, 0x03, 0x00, 0x00, 0x00
	.byte 0x90, 0x82, 0x1E, 0x02, 0x09, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x1C, 0x02, 0x0D, 0x01, 0x00
	.byte 0x00, 0x02, 0x04, 0x1C, 0x02, 0x0D, 0x39, 0x00, 0x00, 0x02, 0x07, 0x1C, 0x02, 0x0D, 0x71, 0x00
	.byte 0x00, 0x02, 0x09, 0x1C, 0x02, 0x0D, 0xA9, 0x00, 0x00, 0x02, 0x0C, 0x1C, 0x02, 0x0D, 0xE1, 0x00
	.byte 0x00, 0x02, 0x0F, 0x1C, 0x02, 0x0D, 0x19, 0x01, 0x00, 0x02, 0x11, 0x1C, 0x02, 0x0D, 0x51, 0x01
	.byte 0x00, 0x02, 0x01, 0x1C, 0x02, 0x0D, 0x01, 0x00, 0x00, 0x02, 0x04, 0x10, 0x02, 0x0D, 0x39, 0x00
	.byte 0x00, 0x02, 0x07, 0x17, 0x02, 0x0D, 0x59, 0x00, 0x00, 0x02, 0x0A, 0x17, 0x02, 0x0D, 0x87, 0x00
	.byte 0x00, 0x02, 0x07, 0x17, 0x02, 0x0D, 0x59, 0x00, 0x00, 0x02, 0x09, 0x17, 0x02, 0x0D, 0x87, 0x00
	.byte 0x00, 0x02, 0x0C, 0x10, 0x02, 0x0D, 0xB5, 0x00, 0x00, 0x02, 0x0F, 0x17, 0x02, 0x0D, 0xD5, 0x00
	.byte 0x00, 0x02, 0x11, 0x17, 0x02, 0x0D, 0x03, 0x01, 0x00, 0x02, 0x01, 0x1C, 0x02, 0x0D, 0x01, 0x00
	.byte 0x00, 0x02, 0x07, 0x12, 0x02, 0x0D, 0x39, 0x00, 0x00, 0x02, 0x0A, 0x17, 0x02, 0x0D, 0x5D, 0x00
	.byte 0x00, 0x02, 0x0D, 0x17, 0x02, 0x0D, 0x8B, 0x00, 0x00, 0x01, 0x05, 0x1D, 0x0E, 0x0D, 0xB9, 0x00
	.byte 0x00, 0x06, 0x05, 0x09, 0x02, 0x0D, 0x4F, 0x02, 0x00, 0x13, 0x05, 0x09, 0x02, 0x0D, 0x61, 0x02
	.byte 0x00, 0x06, 0x09, 0x09, 0x02, 0x0D, 0x73, 0x02, 0x00, 0x13, 0x09, 0x09, 0x02, 0x0D, 0x85, 0x02
	.byte 0x00, 0x06, 0x0D, 0x09, 0x02, 0x0D, 0x97, 0x02, 0x00, 0x13, 0x0D, 0x09, 0x02, 0x0D, 0xA9, 0x02
	.byte 0x00, 0x06, 0x11, 0x09, 0x02, 0x0D, 0xBB, 0x02, 0x00, 0x13, 0x11, 0x09, 0x02, 0x0D, 0xCD, 0x02
	.byte 0x00, 0x06, 0x05, 0x09, 0x02, 0x0D, 0xDF, 0x02, 0x00, 0x13, 0x05, 0x09, 0x02, 0x0D, 0xF1, 0x02
	.byte 0x00, 0x06, 0x09, 0x09, 0x02, 0x0D, 0x03, 0x03, 0x00, 0x13, 0x09, 0x09, 0x02, 0x0D, 0x15, 0x03
	.byte 0x00, 0x06, 0x0D, 0x09, 0x02, 0x0D, 0x27, 0x03, 0x00, 0x13, 0x0D, 0x09, 0x02, 0x0D, 0x39, 0x03
	.byte 0x00, 0x06, 0x11, 0x09, 0x02, 0x0D, 0x4B, 0x03, 0x00, 0x13, 0x11, 0x09, 0x02, 0x0D, 0x5D, 0x03
	.byte 0x00, 0x02, 0x02, 0x02, 0x02, 0x0D, 0x6F, 0x03, 0x00, 0x0F, 0x15, 0x04, 0x02, 0x0D, 0x73, 0x03
	.byte 0x04, 0x02, 0x13, 0x1B, 0x04, 0x0D, 0x01, 0x00

	@ 0x021E8398
