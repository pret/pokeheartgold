
	thumb_func_start ov31_0225D520
ov31_0225D520: @ 0x0225D520
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	movs r0, #3
	str r2, [sp]
	movs r1, #8
	lsls r2, r0, #0xf
	str r3, [sp, #4]
	bl FUN_0201A910
	movs r1, #0x19
	ldr r0, _0225D5FC @ =ov31_0225D7A0
	lsls r1, r1, #4
	movs r2, #0xa
	movs r3, #8
	bl FUN_02007200
	adds r5, r0, #0
	bl FUN_0201F988
	adds r4, r0, #0
	str r5, [r4, #8]
	movs r1, #0
	str r1, [r4]
	str r6, [r4, #4]
	ldr r0, [sp]
	str r7, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r1, [r4, #0x30]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl FUN_02028EA8
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl FUN_02028E9C
	movs r1, #0x5a
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl FUN_02031968
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	str r0, [r4, #0xc]
	ldr r0, [sp, #4]
	str r0, [r4, #0x14]
	adds r0, r4, #0
	bl ov31_0225DAC4
	adds r0, r4, #0
	bl ov31_0225DB38
	adds r0, r4, #0
	bl ov31_0225D60C
	adds r0, r4, #0
	movs r1, #0
	bl ov31_0225D684
	adds r0, r4, #0
	bl ov31_0225DE84
	adds r0, r4, #0
	bl ov31_0225DF98
	adds r0, r4, #0
	bl ov31_0225DD14
	ldr r0, [r4, #0x14]
	bl FUN_022581BC
	ldr r2, _0225D600 @ =0x04001000
	ldr r0, _0225D604 @ =0xFFFF1FFF
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #1
	bl FUN_02002B8C
	ldr r0, _0225D608 @ =_0225EE40
	bl FUN_02002C20
	adds r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225D5FC: .4byte ov31_0225D7A0
_0225D600: .4byte 0x04001000
_0225D604: .4byte 0xFFFF1FFF
_0225D608: .4byte _0225EE40
	thumb_func_end ov31_0225D520

	thumb_func_start ov31_0225D60C
ov31_0225D60C: @ 0x0225D60C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	movs r1, #0x40
	adds r2, r0, #0
	bl FUN_0200BD18
	movs r2, #0x55
	lsls r2, r2, #2
	str r0, [r4, r2]
	movs r0, #0
	movs r1, #0x1b
	adds r2, #0x5f
	movs r3, #8
	bl FUN_0200BAF8
	movs r1, #0x56
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xde
	movs r3, #8
	bl FUN_0200BAF8
	movs r1, #0x57
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x90
	movs r1, #8
	bl FUN_02026354
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov31_0225D60C

	thumb_func_start ov31_0225D654
ov31_0225D654: @ 0x0225D654
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov31_0225D654

	thumb_func_start ov31_0225D684
ov31_0225D684: @ 0x0225D684
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	adds r6, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0x11
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x64
	bl FUN_0201D8C8
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0
	bl FUN_0201D978
	cmp r6, #0
	bne _0225D6DE
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0
	adds r3, r0, #0
	movs r6, #0x30
	subs r3, r6, r3
	lsrs r3, r3, #1
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D70C @ =0x000F0E00
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x64
	adds r3, #8
	str r1, [sp, #0xc]
	bl FUN_020200FC
	b _0225D6F8
_0225D6DE:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D70C @ =0x000F0E00
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x64
	movs r3, #5
	str r1, [sp, #0xc]
	bl FUN_020200FC
_0225D6F8:
	adds r5, #0x64
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0225D70C: .4byte 0x000F0E00
	thumb_func_end ov31_0225D684

	thumb_func_start ov31_0225D710
ov31_0225D710: @ 0x0225D710
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_0201F988
	adds r4, r0, #0
	movs r0, #0
	bl FUN_02002B8C
	adds r0, r4, #0
	bl ov31_0225DBA0
	adds r0, r4, #0
	bl ov31_0225D654
	adds r0, r6, #0
	bl FUN_02007234
	adds r0, r5, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r5, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r5, #0
	movs r1, #4
	bl FUN_0201BB4C
	movs r0, #8
	bl FUN_0201A9C4
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov31_0225D710

	thumb_func_start ov31_0225D758
ov31_0225D758: @ 0x0225D758
	movs r0, #1
	bx lr
	thumb_func_end ov31_0225D758

	thumb_func_start ov31_0225D75C
ov31_0225D75C: @ 0x0225D75C
	cmp r1, #8
	bhi _0225D796
	adds r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0225D76C: @ jump table
	.2byte _0225D77E - _0225D76C - 2 @ case 0
	.2byte _0225D77E - _0225D76C - 2 @ case 1
	.2byte _0225D77E - _0225D76C - 2 @ case 2
	.2byte _0225D77E - _0225D76C - 2 @ case 3
	.2byte _0225D77E - _0225D76C - 2 @ case 4
	.2byte _0225D77E - _0225D76C - 2 @ case 5
	.2byte _0225D792 - _0225D76C - 2 @ case 6
	.2byte _0225D792 - _0225D76C - 2 @ case 7
	.2byte _0225D792 - _0225D76C - 2 @ case 8
_0225D77E:
	ldr r3, [r0, #0x14]
	ldr r0, _0225D79C @ =0x00000271
	ldrb r2, [r3, r0]
	subs r0, r0, #1
	ldrb r0, [r3, r0]
	adds r1, r1, r2
	cmp r1, r0
	bhs _0225D796
	movs r0, #1
	bx lr
_0225D792:
	movs r0, #1
	bx lr
_0225D796:
	movs r0, #0
	bx lr
	nop
_0225D79C: .4byte 0x00000271
	thumb_func_end ov31_0225D75C

	thumb_func_start ov31_0225D7A0
ov31_0225D7A0: @ 0x0225D7A0
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0225D7B0
	cmp r0, #1
	beq _0225D7BE
	pop {r3, r4, r5, pc}
_0225D7B0:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0225D836
	movs r0, #1
	str r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
_0225D7BE:
	ldr r1, [r5, #0x14]
	ldr r0, _0225D838 @ =0x00000272
	ldrb r0, [r1, r0]
	cmp r0, #3
	beq _0225D7D2
	cmp r0, #7
	beq _0225D7FA
	cmp r0, #0xb
	beq _0225D814
	b _0225D81A
_0225D7D2:
	adds r0, r5, #0
	movs r1, #0
	bl ov31_0225DAA4
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _0225D81A
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov31_0225D75C
	cmp r0, #0
	beq _0225D81A
	movs r0, #0xa5
	ldr r1, [r5, #0x14]
	lsls r0, r0, #2
	str r4, [r1, r0]
	b _0225D81A
_0225D7FA:
	adds r0, r5, #0
	movs r1, #1
	bl ov31_0225DAA4
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0225D81A
	movs r1, #0xa5
	ldr r2, [r5, #0x14]
	lsls r1, r1, #2
	str r0, [r2, r1]
	b _0225D81A
_0225D814:
	adds r0, r5, #0
	bl ov31_0225E774
_0225D81A:
	movs r0, #0xa6
	ldr r1, [r5, #0x14]
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _0225D836
	adds r0, r5, #0
	bl ov31_0225D83C
	movs r0, #0xa6
	ldr r1, [r5, #0x14]
	movs r2, #0
	lsls r0, r0, #2
	str r2, [r1, r0]
_0225D836:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225D838: .4byte 0x00000272
	thumb_func_end ov31_0225D7A0

	thumb_func_start ov31_0225D83C
ov31_0225D83C: @ 0x0225D83C
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0xd
	bls _0225D846
	b _0225D9CC
_0225D846:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225D852: @ jump table
	.2byte _0225D9CC - _0225D852 - 2 @ case 0
	.2byte _0225D86E - _0225D852 - 2 @ case 1
	.2byte _0225D882 - _0225D852 - 2 @ case 2
	.2byte _0225D8D2 - _0225D852 - 2 @ case 3
	.2byte _0225D910 - _0225D852 - 2 @ case 4
	.2byte _0225D950 - _0225D852 - 2 @ case 5
	.2byte _0225D974 - _0225D852 - 2 @ case 6
	.2byte _0225D980 - _0225D852 - 2 @ case 7
	.2byte _0225D998 - _0225D852 - 2 @ case 8
	.2byte _0225D99E - _0225D852 - 2 @ case 9
	.2byte _0225D9A4 - _0225D852 - 2 @ case 10
	.2byte _0225D9AA - _0225D852 - 2 @ case 11
	.2byte _0225D9C2 - _0225D852 - 2 @ case 12
	.2byte _0225D9C8 - _0225D852 - 2 @ case 13
_0225D86E:
	bl ov31_0225DD14
	adds r0, r4, #0
	bl ov31_0225DF98
	adds r0, r4, #0
	movs r1, #0
	bl ov31_0225D684
	pop {r4, pc}
_0225D882:
	movs r1, #1
	bl ov31_0225D9D4
	adds r0, r4, #0
	bl ov31_0225DCF4
	adds r0, r4, #0
	adds r0, #0x54
	bl FUN_0201D8E4
	adds r0, r4, #0
	bl ov31_0225EC58
	adds r0, r4, #0
	bl ov31_0225E184
	movs r1, #0xa1
	ldr r2, [r4, #0x14]
	lsls r1, r1, #2
	ldrh r1, [r2, r1]
	adds r0, r4, #0
	bl ov31_0225E20C
	ldr r2, [r4, #0x14]
	ldr r1, _0225D9D0 @ =0x00000286
	adds r0, r4, #0
	ldrsh r1, [r2, r1]
	bl ov31_0225E2D4
	adds r0, r4, #0
	bl ov31_0225E474
	adds r0, r4, #0
	movs r1, #1
	bl ov31_0225D684
	adds r0, r4, #0
	bl ov31_0225E54C
	pop {r4, pc}
_0225D8D2:
	movs r1, #2
	bl ov31_0225D9D4
	adds r0, r4, #0
	bl ov31_0225DCF4
	adds r0, r4, #0
	bl ov31_0225EC58
	adds r0, r4, #0
	bl ov31_0225E184
	movs r1, #0xa1
	ldr r2, [r4, #0x14]
	lsls r1, r1, #2
	ldrh r1, [r2, r1]
	adds r0, r4, #0
	bl ov31_0225E20C
	adds r0, r4, #0
	bl ov31_0225E5FC
	adds r0, r4, #0
	adds r0, #0x54
	bl FUN_0201D8E4
	adds r4, #0x64
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
_0225D910:
	movs r1, #0
	bl ov31_0225D9D4
	adds r0, r4, #0
	bl ov31_0225EDA0
	adds r0, r4, #0
	bl ov31_0225DF98
	adds r0, r4, #0
	movs r1, #0
	bl ov31_0225D684
	adds r0, r4, #0
	bl ov31_0225DCA8
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r4, #0
	bl ov31_0225DD14
	adds r0, r4, #0
	bl ov31_0225DE84
	adds r4, #0x64
	adds r0, r4, #0
	bl FUN_0201D5C8
	pop {r4, pc}
_0225D950:
	movs r1, #0
	bl ov31_0225D9D4
	adds r0, r4, #0
	bl ov31_0225DF98
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0
	bl FUN_0200E9BC
	adds r0, r4, #0
	bl ov31_0225DD14
	adds r0, r4, #0
	bl ov31_0225DE84
	pop {r4, pc}
_0225D974:
	ldr r2, [r4, #0x14]
	ldr r1, _0225D9D0 @ =0x00000286
	ldrsh r1, [r2, r1]
	bl ov31_0225E2D4
	pop {r4, pc}
_0225D980:
	adds r0, #0x64
	bl FUN_0201D8E4
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	adds r0, r4, #0
	bl ov31_0225E5FC
	pop {r4, pc}
_0225D998:
	bl ov31_0225E700
	pop {r4, pc}
_0225D99E:
	bl ov31_0225E7D4
	pop {r4, pc}
_0225D9A4:
	bl ov31_0225EA08
	pop {r4, pc}
_0225D9AA:
	adds r0, #0x64
	bl FUN_0201D8E4
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	adds r0, r4, #0
	bl ov31_0225EA9C
	pop {r4, pc}
_0225D9C2:
	bl ov31_0225EB30
	pop {r4, pc}
_0225D9C8:
	bl ov31_0225EBC4
_0225D9CC:
	pop {r4, pc}
	nop
_0225D9D0: .4byte 0x00000286
	thumb_func_end ov31_0225D83C

	thumb_func_start ov31_0225D9D4
ov31_0225D9D4: @ 0x0225D9D4
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	cmp r1, #0
	beq _0225D9EA
	cmp r1, #1
	beq _0225DA26
	cmp r1, #2
	beq _0225DA64
	add sp, #8
	pop {r3, r4, r5, pc}
_0225D9EA:
	movs r0, #8
	str r0, [sp]
	movs r0, #0x3c
	movs r1, #0x11
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r5, r0, #0
	adds r2, r3, #0
	ldr r0, [r4, #4]
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201AB0C
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	add sp, #8
	pop {r3, r4, r5, pc}
_0225DA26:
	ldr r0, [r4, #4]
	movs r1, #5
	movs r2, #0
	bl FUN_0201CB28
	movs r0, #8
	str r0, [sp]
	movs r0, #0x3c
	movs r1, #0x13
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r5, r0, #0
	adds r2, r3, #0
	ldr r0, [r4, #4]
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, pc}
_0225DA64:
	ldr r0, [r4, #4]
	movs r1, #5
	movs r2, #0
	bl FUN_0201CB28
	movs r0, #8
	str r0, [sp]
	movs r0, #0x3c
	movs r1, #0x14
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r5, r0, #0
	adds r2, r3, #0
	ldr r0, [r4, #4]
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov31_0225D9D4

	thumb_func_start ov31_0225DAA4
ov31_0225DAA4: @ 0x0225DAA4
	push {r4, lr}
	adds r4, r1, #0
	beq _0225DAB2
	cmp r4, #1
	beq _0225DAB2
	bl FUN_0202551C
_0225DAB2:
	ldr r0, _0225DAC0 @ =0x0225EF40
	lsls r1, r4, #2
	ldr r0, [r0, r1]
	bl FUN_02025224
	pop {r4, pc}
	nop
_0225DAC0: .4byte 0x0225EF40
	thumb_func_end ov31_0225DAA4

	thumb_func_start ov31_0225DAC4
ov31_0225DAC4: @ 0x0225DAC4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	blx FUN_020CDA64
	movs r0, #0x80
	blx FUN_020CE650
	movs r0, #1
	lsls r0, r0, #8
	blx FUN_020CE6F8
	ldr r2, _0225DB24 @ =0x04001000
	ldr r0, _0225DB28 @ =0xFFCFFFEF
	ldr r1, [r2]
	movs r3, #0
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r4, #4]
	ldr r2, _0225DB2C @ =0x0225EED0
	movs r1, #4
	bl FUN_0201B1E4
	ldr r0, [r4, #4]
	ldr r2, _0225DB30 @ =0x0225EEEC
	movs r1, #5
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #4]
	ldr r2, _0225DB34 @ =0x0225EF08
	movs r1, #6
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	movs r3, #4
	bl FUN_0201C1C4
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_0201CAE0
	pop {r4, pc}
	.align 2, 0
_0225DB24: .4byte 0x04001000
_0225DB28: .4byte 0xFFCFFFEF
_0225DB2C: .4byte 0x0225EED0
_0225DB30: .4byte 0x0225EEEC
_0225DB34: .4byte 0x0225EF08
	thumb_func_end ov31_0225DAC4

	thumb_func_start ov31_0225DB38
ov31_0225DB38: @ 0x0225DB38
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, _0225DB9C @ =0x04001050
	movs r3, #0
	strh r3, [r0]
	str r3, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #0x3c
	movs r1, #0xf
	movs r2, #4
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	movs r0, #0x3c
	movs r1, #0x10
	movs r3, #5
	bl FUN_020078F0
	adds r0, r4, #0
	movs r1, #0
	bl ov31_0225D9D4
	movs r1, #0x16
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #8
	bl FUN_0200304C
	movs r1, #6
	movs r0, #4
	lsls r1, r1, #6
	movs r2, #8
	bl FUN_02003030
	adds r0, r4, #0
	bl ov31_0225DBD4
	adds r0, r4, #0
	bl ov31_0225DCA8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0225DB9C: .4byte 0x04001050
	thumb_func_end ov31_0225DB38

	thumb_func_start ov31_0225DBA0
ov31_0225DBA0: @ 0x0225DBA0
	push {r4, lr}
	adds r4, r0, #0
	bl ov31_0225DCF4
	adds r0, r4, #0
	adds r0, #0x34
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x44
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x74
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x54
	bl FUN_0201D520
	adds r4, #0x64
	adds r0, r4, #0
	bl FUN_0201D520
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov31_0225DBA0

	thumb_func_start ov31_0225DBD4
ov31_0225DBD4: @ 0x0225DBD4
	push {r3, r4, lr}
	sub sp, #0x14
	movs r1, #1
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x34
	movs r2, #4
	bl FUN_0201D40C
	movs r0, #1
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r2, #4
	adds r1, r4, #0
	str r2, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0x1d
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, #0x44
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r2, #4
	adds r1, r4, #0
	str r2, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0x89
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, #0x74
	movs r3, #1
	bl FUN_0201D40C
	movs r0, #0x15
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x54
	movs r2, #4
	movs r3, #0xa
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0x54
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x15
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x64
	movs r2, #4
	movs r3, #0x18
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	bl FUN_0201D978
	movs r2, #0
	adds r1, r2, #0
_0225DC94:
	adds r0, r4, #0
	adds r0, #0x84
	adds r2, r2, #1
	adds r4, #0x10
	str r1, [r0]
	cmp r2, #0xd
	blt _0225DC94
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov31_0225DBD4

	thumb_func_start ov31_0225DCA8
ov31_0225DCA8: @ 0x0225DCA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	adds r5, r7, #0
	ldr r4, _0225DCF0 @ =0x0225EE88
	movs r6, #0
	adds r5, #0x84
_0225DCB6:
	ldr r0, [r4, #4]
	adds r1, r5, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	movs r2, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [r7, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r6, r6, #1
	adds r4, #0xc
	adds r5, #0x10
	cmp r6, #6
	blt _0225DCB6
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225DCF0: .4byte 0x0225EE88
	thumb_func_end ov31_0225DCA8

	thumb_func_start ov31_0225DCF4
ov31_0225DCF4: @ 0x0225DCF4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r5, #0x84
_0225DCFC:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #6
	blt _0225DCFC
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov31_0225DCF4

	thumb_func_start ov31_0225DD14
ov31_0225DD14: @ 0x0225DD14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #0
	adds r4, #0x84
	adds r7, r6, #0
_0225DD22:
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #6
	blt _0225DD22
	movs r0, #0x27
	ldr r2, [r5, #0x14]
	lsls r0, r0, #4
	ldrb r1, [r2, r0]
	adds r0, r0, #1
	ldrb r0, [r2, r0]
	subs r0, r1, r0
	str r0, [sp, #4]
	cmp r0, #6
	ble _0225DD4C
	movs r0, #6
	str r0, [sp, #4]
	b _0225DD54
_0225DD4C:
	cmp r0, #0
	bge _0225DD54
	movs r0, #0
	str r0, [sp, #4]
_0225DD54:
	ldr r0, [sp, #4]
	movs r4, #0
	cmp r0, #0
	ble _0225DDD6
	adds r6, r5, #0
	adds r6, #0x84
_0225DD60:
	ldr r0, [r5, #0x14]
	ldr r1, _0225DDF8 @ =0x00000271
	ldrb r1, [r0, r1]
	adds r1, r4, r1
	str r1, [sp, #0xc]
	movs r1, #0x9a
	lsls r1, r1, #2
	ldr r1, [r0, r1]
	ldr r0, [sp, #0xc]
	lsls r0, r0, #1
	ldrh r7, [r1, r0]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_0200BBA0
	str r0, [sp, #0x10]
	ldr r2, [sp, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r4, #0
	bl ov31_0225DE00
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	ldr r0, [r5, #0x14]
	ldr r1, [sp, #0xc]
	adds r2, r7, #0
	bl ov31_0225E12C
	cmp r0, #0
	beq _0225DDCC
	ldr r0, [r5, #0x14]
	lsls r1, r7, #0x10
	str r0, [sp, #8]
	lsrs r1, r1, #0x10
	bl FUN_02258120
	adds r3, r0, #0
	ldr r1, [sp, #8]
	ldr r0, _0225DDFC @ =0x00000283
	adds r2, r6, #0
	ldrb r0, [r1, r0]
	movs r1, #0x56
	lsls r1, r1, #2
	str r0, [sp]
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl ov31_0225DE24
_0225DDCC:
	ldr r0, [sp, #4]
	adds r4, r4, #1
	adds r6, #0x10
	cmp r4, r0
	blt _0225DD60
_0225DDD6:
	adds r4, r5, #0
	movs r6, #0
	adds r4, #0x84
_0225DDDC:
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #6
	blt _0225DDDC
	ldr r1, [sp, #4]
	adds r0, r5, #0
	bl ov31_0225E0E4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225DDF8: .4byte 0x00000271
_0225DDFC: .4byte 0x00000283
	thumb_func_end ov31_0225DD14

	thumb_func_start ov31_0225DE00
ov31_0225DE00: @ 0x0225DE00
	push {r3, lr}
	sub sp, #0x10
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DE20 @ =0x00010200
	str r0, [sp, #8]
	adds r0, r1, #0
	adds r1, r3, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, pc}
	nop
_0225DE20: .4byte 0x00010200
	thumb_func_end ov31_0225DE00

	thumb_func_start ov31_0225DE24
ov31_0225DE24: @ 0x0225DE24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [sp, #0x28]
	adds r6, r1, #0
	subs r0, r0, #3
	adds r7, r2, #0
	movs r4, #0x12
	cmp r0, #1
	bhi _0225DE3A
	movs r4, #0x13
_0225DE3A:
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r2, r3, #0
	adds r0, r5, #0
	movs r3, #4
	bl FUN_0200BFCC
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #8
	bl FUN_0200BC4C
	adds r4, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DE80 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r2, r4, #0
	movs r3, #0x24
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225DE80: .4byte 0x00010200
	thumb_func_end ov31_0225DE24

	thumb_func_start ov31_0225DE84
ov31_0225DE84: @ 0x0225DE84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x74
	movs r1, #0
	bl FUN_0201D978
	ldr r1, [r5, #0x14]
	ldr r0, _0225DF90 @ =0x00000283
	ldrb r0, [r1, r0]
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0225DEB0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x21
	bl FUN_0200BBA0
	b _0225DEBC
_0225DEB0:
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x1e
	bl FUN_0200BBA0
_0225DEBC:
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DF94 @ =0x000F0E00
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x74
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #0x10
	movs r1, #0xb
	bl FUN_02026354
	adds r4, r0, #0
	ldr r1, [r5, #0x14]
	ldr r0, _0225DF90 @ =0x00000283
	ldrb r0, [r1, r0]
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0225DF12
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x20
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02031A6C
	b _0225DF2A
_0225DF12:
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x1f
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02029024
_0225DF2A:
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	movs r3, #6
	bl FUN_0200BFCC
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	adds r6, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DF94 @ =0x000F0E00
	movs r3, #0x48
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x74
	adds r2, r4, #0
	subs r3, r3, r6
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_02026380
	adds r5, #0x74
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225DF90: .4byte 0x00000283
_0225DF94: .4byte 0x000F0E00
	thumb_func_end ov31_0225DE84

	thumb_func_start ov31_0225DF98
ov31_0225DF98: @ 0x0225DF98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r0, #0
	adds r0, #0x54
	movs r1, #0
	bl FUN_0201D978
	movs r0, #6
	movs r1, #0xb
	bl FUN_02026354
	adds r6, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x2b
	bl FUN_0200BBA0
	adds r7, r0, #0
	ldr r5, [r4, #0x14]
	ldr r0, _0225E058 @ =0x00000271
	movs r1, #6
	ldrb r0, [r5, r0]
	adds r0, r0, #6
	blx FUN_020F2998
	str r0, [sp, #0x14]
	movs r0, #0x27
	lsls r0, r0, #4
	ldrb r0, [r5, r0]
	movs r1, #6
	str r0, [sp, #0x10]
	blx FUN_020F2998
	adds r5, r0, #0
	ldr r0, [sp, #0x10]
	movs r1, #6
	blx FUN_020F2998
	cmp r1, #0
	beq _0225DFEC
	adds r5, r5, #1
_0225DFEC:
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [sp, #0x14]
	movs r1, #0
	movs r3, #2
	bl FUN_0200BFCC
	movs r1, #1
	str r1, [sp]
	movs r0, #0x55
	str r1, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r2, r5, #0
	movs r3, #2
	bl FUN_0200BFCC
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225E05C @ =0x000F0E00
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x54
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	adds r4, #0x54
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E058: .4byte 0x00000271
_0225E05C: .4byte 0x000F0E00
	thumb_func_end ov31_0225DF98

	thumb_func_start ov31_0225E060
ov31_0225E060: @ 0x0225E060
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r6, r0, #0
	adds r4, r2, #0
	bl FUN_0201CC08
	str r0, [sp, #0x14]
	cmp r4, #6
	beq _0225E0DA
	ldr r1, _0225E0E0 @ =0x0225EF48
	lsls r0, r4, #5
	adds r5, r1, r0
	ldr r0, [sp, #0x10]
	movs r7, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0225E086:
	ldrb r0, [r5]
	cmp r0, #1
	bne _0225E0B2
	ldrb r0, [r5, #4]
	adds r1, r4, #0
	str r0, [sp]
	ldrb r0, [r5, #5]
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	str r0, [sp, #8]
	ldrb r3, [r5, #2]
	ldrb r2, [r5, #1]
	adds r0, r6, #0
	lsls r3, r3, #5
	adds r2, r2, r3
	lsls r3, r2, #1
	ldr r2, [sp, #0x14]
	adds r2, r2, r3
	ldrb r3, [r5, #3]
	bl FUN_0201C4C4
	b _0225E0D2
_0225E0B2:
	cmp r0, #2
	bne _0225E0D2
	ldrb r0, [r5, #4]
	adds r1, r4, #0
	movs r2, #0
	str r0, [sp]
	ldrb r0, [r5, #5]
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r5, #3]
	adds r0, r6, #0
	bl FUN_0201C8C4
_0225E0D2:
	adds r7, r7, #1
	adds r5, #8
	cmp r7, #4
	blt _0225E086
_0225E0DA:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E0E0: .4byte 0x0225EF48
	thumb_func_end ov31_0225E060

	thumb_func_start ov31_0225E0E4
ov31_0225E0E4: @ 0x0225E0E4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #8
	adds r4, r1, #0
	str r0, [sp]
	movs r0, #0x3c
	movs r1, #0x12
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r6, r0, #0
	adds r2, r3, #0
	ldr r0, [r5, #4]
	ldr r3, [r3, #8]
	movs r1, #5
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r5, #4]
	movs r1, #5
	adds r2, r4, #0
	bl ov31_0225E060
	ldr r0, [r5, #4]
	movs r1, #5
	bl FUN_0201EFBC
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov31_0225E0E4

	thumb_func_start ov31_0225E12C
ov31_0225E12C: @ 0x0225E12C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0225E180 @ =0x00000283
	adds r4, r1, #0
	ldrb r3, [r5, r0]
	cmp r3, #3
	bne _0225E14E
	subs r0, #0x2f
	ldr r0, [r5, r0]
	bl FUN_02031AB8
	cmp r0, #0
	bne _0225E14A
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225E14A:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0225E14E:
	cmp r3, #4
	bne _0225E17A
	subs r0, #0x8a
	subs r0, r2, r0
	movs r1, #6
	blx FUN_020F2998
	adds r2, r0, #0
	movs r0, #0x95
	lsls r0, r0, #2
	movs r1, #6
	muls r1, r2, r1
	ldr r0, [r5, r0]
	adds r1, r4, r1
	bl FUN_02031A78
	cmp r0, #0
	bne _0225E176
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225E176:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0225E17A:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0225E180: .4byte 0x00000283
	thumb_func_end ov31_0225E12C

	thumb_func_start ov31_0225E184
ov31_0225E184: @ 0x0225E184
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x29
	adds r5, r0, #0
	lsls r1, r1, #4
	ldr r2, [r5, #0x14]
	adds r0, r1, #0
	subs r0, #0x1f
	ldr r3, [r2, r1]
	ldrb r0, [r2, r0]
	subs r1, #0x28
	ldr r1, [r2, r1]
	adds r6, r3, r0
	lsls r4, r6, #1
	movs r0, #0x57
	lsls r0, r0, #2
	ldrh r1, [r1, r4]
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	adds r7, r0, #0
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0xe4
	adds r2, r7, #0
	adds r3, r6, #0
	bl ov31_0225DE00
	adds r0, r7, #0
	bl FUN_02026380
	movs r2, #0x9a
	ldr r0, [r5, #0x14]
	lsls r2, r2, #2
	ldr r2, [r0, r2]
	adds r1, r6, #0
	ldrh r2, [r2, r4]
	bl ov31_0225E12C
	cmp r0, #0
	beq _0225E1FE
	ldr r6, [r5, #0x14]
	movs r1, #0x9a
	lsls r1, r1, #2
	ldr r1, [r6, r1]
	adds r0, r6, #0
	ldrh r1, [r1, r4]
	bl FUN_02258120
	adds r3, r0, #0
	ldr r0, _0225E208 @ =0x00000283
	movs r1, #0x55
	ldrb r0, [r6, r0]
	adds r2, r5, #0
	lsls r1, r1, #2
	str r0, [sp]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, #0xe4
	bl ov31_0225DE24
_0225E1FE:
	adds r5, #0xe4
	adds r0, r5, #0
	bl FUN_0201D5C8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E208: .4byte 0x00000283
	thumb_func_end ov31_0225E184

	thumb_func_start ov31_0225E20C
ov31_0225E20C: @ 0x0225E20C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x23
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0225E2D0 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r2, #0x25
	adds r0, r5, r2
	adds r2, r4, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #5
	movs r1, #0xb
	bl FUN_02026354
	adds r4, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x24
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r1, #0xa1
	ldr r0, [r5, #0x14]
	lsls r1, r1, #2
	ldrh r1, [r0, r1]
	bl FUN_02257978
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	adds r6, r0, #0
	movs r0, #0x14
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0225E2D0 @ =0x00010200
	movs r3, #0x40
	adds r2, #0x25
	str r0, [sp, #8]
	movs r1, #0
	adds r0, r5, r2
	adds r2, r4, #0
	subs r3, r3, r6
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
	movs r0, #0x49
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E2D0: .4byte 0x00010200
	thumb_func_end ov31_0225E20C

	thumb_func_start ov31_0225E2D4
ov31_0225E2D4: @ 0x0225E2D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #2
	movs r1, #0xb
	bl FUN_02026354
	adds r6, r0, #0
	movs r0, #2
	movs r1, #0xb
	bl FUN_02026354
	adds r7, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x2c
	bl FUN_0200BBA0
	str r0, [sp, #0x10]
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x2d
	bl FUN_0200BBA0
	str r0, [sp, #0x14]
	adds r0, r4, #0
	movs r1, #0xa
	blx FUN_020F2998
	movs r3, #1
	adds r2, r0, #0
	str r3, [sp]
	movs r0, #0x55
	str r3, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200BFCC
	adds r0, r4, #0
	movs r1, #0xa
	blx FUN_020F2998
	adds r2, r1, #0
	movs r1, #1
	str r1, [sp]
	movs r0, #0x55
	str r1, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r3, r1, #0
	bl FUN_0200BFCC
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x10]
	adds r1, r6, #0
	bl FUN_0200CBBC
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x14]
	adds r1, r7, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	adds r0, #0xf4
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x41
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225E470 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xf4
	adds r2, r6, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	movs r0, #4
	str r0, [sp]
	movs r2, #0xff
	movs r1, #0
	ldr r0, _0225E470 @ =0x00010200
	str r2, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #5
	adds r0, r5, r0
	adds r2, r7, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #0xf4
	bl FUN_0201D5C8
	movs r0, #0x41
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	movs r0, #0x4d
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #9
	movs r1, #0xb
	bl FUN_02026354
	adds r6, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x26
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r2, #0xa3
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r3, [r5, #0x14]
	lsls r2, r2, #2
	ldr r3, [r3, r2]
	ldr r0, [r5, r0]
	adds r2, r3, #0
	movs r1, #0
	muls r2, r4, r2
	movs r3, #6
	bl FUN_0200BFCC
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	adds r4, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0225E470 @ =0x00010200
	movs r3, #0x40
	adds r2, #0x35
	str r0, [sp, #8]
	movs r1, #0
	adds r0, r5, r2
	adds r2, r6, #0
	subs r3, r3, r4
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
	movs r0, #0x4d
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E470: .4byte 0x00010200
	thumb_func_end ov31_0225E2D4

	thumb_func_start ov31_0225E474
ov31_0225E474: @ 0x0225E474
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x2a
	bl FUN_0200BBA0
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0225E4B8 @ =0x000F0E00
	adds r2, #0x15
	str r0, [sp, #8]
	adds r0, r5, r2
	adds r2, r4, #0
	movs r3, #4
	str r1, [sp, #0xc]
	bl FUN_020200FC
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0225E4B8: .4byte 0x000F0E00
	thumb_func_end ov31_0225E474

	thumb_func_start ov31_0225E4BC
ov31_0225E4BC: @ 0x0225E4BC
	push {r3, lr}
	cmp r0, #4
	bhi _0225E4EA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225E4CE: @ jump table
	.2byte _0225E4D8 - _0225E4CE - 2 @ case 0
	.2byte _0225E4E2 - _0225E4CE - 2 @ case 1
	.2byte _0225E4EA - _0225E4CE - 2 @ case 2
	.2byte _0225E4D8 - _0225E4CE - 2 @ case 3
	.2byte _0225E4D8 - _0225E4CE - 2 @ case 4
_0225E4D8:
	adds r0, r1, #0
	adds r1, r3, #0
	bl FUN_0200C0CC
	pop {r3, pc}
_0225E4E2:
	adds r0, r1, #0
	adds r1, r3, #0
	bl FUN_0200C408
_0225E4EA:
	pop {r3, pc}
	thumb_func_end ov31_0225E4BC

	thumb_func_start ov31_0225E4EC
ov31_0225E4EC: @ 0x0225E4EC
	push {r3, lr}
	cmp r0, #4
	bhi _0225E51A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225E4FE: @ jump table
	.2byte _0225E508 - _0225E4FE - 2 @ case 0
	.2byte _0225E512 - _0225E4FE - 2 @ case 1
	.2byte _0225E51A - _0225E4FE - 2 @ case 2
	.2byte _0225E508 - _0225E4FE - 2 @ case 3
	.2byte _0225E508 - _0225E4FE - 2 @ case 4
_0225E508:
	adds r0, r1, #0
	adds r1, r3, #0
	bl FUN_0200C134
	pop {r3, pc}
_0225E512:
	adds r0, r1, #0
	adds r1, r3, #0
	bl FUN_0200C408
_0225E51A:
	pop {r3, pc}
	thumb_func_end ov31_0225E4EC

	thumb_func_start ov31_0225E51C
ov31_0225E51C: @ 0x0225E51C
	push {r3, lr}
	cmp r0, #4
	bhi _0225E54A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225E52E: @ jump table
	.2byte _0225E538 - _0225E52E - 2 @ case 0
	.2byte _0225E542 - _0225E52E - 2 @ case 1
	.2byte _0225E54A - _0225E52E - 2 @ case 2
	.2byte _0225E538 - _0225E52E - 2 @ case 3
	.2byte _0225E538 - _0225E52E - 2 @ case 4
_0225E538:
	adds r0, r1, #0
	adds r1, r3, #0
	bl FUN_0200C100
	pop {r3, pc}
_0225E542:
	adds r0, r1, #0
	adds r1, r3, #0
	bl FUN_0200C408
_0225E54A:
	pop {r3, pc}
	thumb_func_end ov31_0225E51C

	thumb_func_start ov31_0225E54C
ov31_0225E54C: @ 0x0225E54C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x51
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r1, #0x55
	lsls r1, r1, #2
	ldr r3, [r5, #0x14]
	ldr r2, _0225E5F4 @ =0x00000283
	ldr r1, [r5, r1]
	ldrb r0, [r3, r2]
	adds r2, r2, #1
	ldrh r2, [r3, r2]
	movs r3, #0
	bl ov31_0225E4BC
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0xc
	bl FUN_0200BBA0
	movs r1, #0x55
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, #0x34
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r1, #4
	str r1, [sp, #4]
	ldr r0, [r5, #4]
	ldr r2, _0225E5F8 @ =0x000001B5
	movs r3, #5
	bl FUN_0200E644
	movs r2, #0x51
	lsls r2, r2, #2
	adds r0, r5, r2
	movs r1, #1
	adds r2, #0x71
	movs r3, #5
	bl FUN_0200E998
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	movs r2, #0x51
	str r0, [sp, #4]
	lsls r2, r2, #2
	adds r0, r5, r2
	str r3, [sp, #8]
	adds r2, #0x44
	ldr r2, [r5, r2]
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xa
	ldr r2, [r5, #0x14]
	lsls r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0225E5F4: .4byte 0x00000283
_0225E5F8: .4byte 0x000001B5
	thumb_func_end ov31_0225E54C

	thumb_func_start ov31_0225E5FC
ov31_0225E5FC: @ 0x0225E5FC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0x51
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0xf
	bl FUN_0201D978
	ldr r2, [r4, #0x14]
	ldr r3, _0225E6F8 @ =0x00000283
	ldrb r0, [r2, r3]
	adds r1, r0, #0
	adds r1, #0xfd
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _0225E63E
	movs r1, #0x55
	adds r3, r3, #1
	lsls r1, r1, #2
	ldrh r2, [r2, r3]
	ldr r1, [r4, r1]
	movs r3, #0
	bl ov31_0225E51C
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x2e
	bl FUN_0200BBA0
	b _0225E684
_0225E63E:
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x55
	adds r3, r3, #3
	lsls r0, r0, #2
	ldrsh r2, [r2, r3]
	ldr r0, [r4, r0]
	movs r3, #2
	bl FUN_0200BFCC
	movs r5, #0xa3
	ldr r2, [r4, #0x14]
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r0, #0x55
	str r1, [sp, #4]
	lsls r5, r5, #2
	ldr r3, [r2, r5]
	subs r5, r5, #6
	ldrsh r2, [r2, r5]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	muls r2, r3, r2
	movs r3, #6
	bl FUN_0200BFCC
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xe
	bl FUN_0200BBA0
_0225E684:
	movs r1, #0x55
	lsls r1, r1, #2
	adds r5, r0, #0
	ldr r0, [r4, r1]
	adds r1, #0x34
	ldr r1, [r4, r1]
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r1, #4
	str r1, [sp, #4]
	ldr r0, [r4, #4]
	ldr r2, _0225E6FC @ =0x000001B5
	movs r3, #5
	bl FUN_0200E644
	movs r2, #0x51
	lsls r2, r2, #2
	adds r0, r4, r2
	movs r1, #1
	adds r2, #0x71
	movs r3, #5
	bl FUN_0200E998
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	movs r2, #0x51
	str r0, [sp, #4]
	lsls r2, r2, #2
	adds r0, r4, r2
	str r3, [sp, #8]
	adds r2, #0x44
	ldr r2, [r4, r2]
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0x61
	lsls r1, r1, #2
	str r0, [r4, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0225E6F8: .4byte 0x00000283
_0225E6FC: .4byte 0x000001B5
	thumb_func_end ov31_0225E5FC

	thumb_func_start ov31_0225E700
ov31_0225E700: @ 0x0225E700
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, [r4, #4]
	movs r2, #0x1a
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #0x60
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r2, [r0, #0x10]
	movs r1, #6
	strb r1, [r0, #0x11]
	ldr r0, [r4, #0x1c]
	adds r2, #0xf2
	adds r0, r0, r2
	bl FUN_020183F0
	add r1, sp, #0
	ldrb r2, [r1, #0x12]
	movs r3, #0xf
	lsls r0, r0, #0x18
	bics r2, r3
	lsrs r3, r0, #0x18
	movs r0, #0xf
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #0x12]
	ldrb r2, [r1, #0x12]
	movs r0, #0xf0
	bics r2, r0
	strb r2, [r1, #0x12]
	movs r0, #0
	strb r0, [r1, #0x13]
	ldr r0, [r4, #4]
	movs r1, #5
	bl FUN_0201CAE0
	movs r0, #8
	bl FUN_0201660C
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, sp, #0
	bl FUN_020166FC
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov31_0225E700

	thumb_func_start ov31_0225E774
ov31_0225E774: @ 0x0225E774
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225E786
	movs r0, #0
	pop {r4, pc}
_0225E786:
	bl FUN_02016748
	cmp r0, #1
	beq _0225E794
	cmp r0, #2
	beq _0225E7B2
	b _0225E7D0
_0225E794:
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r0, #0x17
	movs r2, #0
	lsls r0, r0, #4
	str r2, [r4, r0]
	movs r0, #0xa5
	ldr r1, [r4, #0x14]
	lsls r0, r0, #2
	str r2, [r1, r0]
	movs r0, #1
	pop {r4, pc}
_0225E7B2:
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r0, #0x17
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r1, #0xa5
	ldr r2, [r4, #0x14]
	movs r0, #1
	lsls r1, r1, #2
	str r0, [r2, r1]
	pop {r4, pc}
_0225E7D0:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov31_0225E774

	thumb_func_start ov31_0225E7D4
ov31_0225E7D4: @ 0x0225E7D4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r3, [r4, #0x14]
	ldr r2, _0225E938 @ =0x00000286
	ldrsh r0, [r3, r2]
	cmp r0, #1
	ble _0225E7FA
	subs r0, r2, #3
	movs r1, #0x55
	subs r2, r2, #2
	lsls r1, r1, #2
	ldrb r0, [r3, r0]
	ldrh r2, [r3, r2]
	ldr r1, [r4, r1]
	movs r3, #0
	bl ov31_0225E4EC
	b _0225E80E
_0225E7FA:
	subs r0, r2, #3
	movs r1, #0x55
	subs r2, r2, #2
	lsls r1, r1, #2
	ldrb r0, [r3, r0]
	ldrh r2, [r3, r2]
	ldr r1, [r4, r1]
	movs r3, #0
	bl ov31_0225E4BC
_0225E80E:
	ldr r1, [r4, #0x14]
	ldr r0, _0225E93C @ =0x00000283
	ldrb r2, [r1, r0]
	cmp r2, #4
	bhi _0225E8CC
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0225E824: @ jump table
	.2byte _0225E82E - _0225E824 - 2 @ case 0
	.2byte _0225E8BC - _0225E824 - 2 @ case 1
	.2byte _0225E8CC - _0225E824 - 2 @ case 2
	.2byte _0225E85C - _0225E824 - 2 @ case 3
	.2byte _0225E8AC - _0225E824 - 2 @ case 4
_0225E82E:
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xf
	bl FUN_0200BBA0
	adds r5, r0, #0
	movs r0, #0xa1
	ldr r1, [r4, #0x14]
	lsls r0, r0, #2
	ldrh r0, [r1, r0]
	movs r1, #5
	movs r2, #0xb
	bl FUN_02077D88
	adds r2, r0, #0
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200C168
	b _0225E8DA
_0225E85C:
	adds r2, r0, #1
	ldrh r2, [r1, r2]
	adds r1, r0, #0
	subs r1, #0x9e
	cmp r2, r1
	blo _0225E87E
	subs r0, #0x98
	cmp r2, r0
	bhi _0225E87E
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x31
	bl FUN_0200BBA0
	adds r5, r0, #0
	b _0225E8DA
_0225E87E:
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xf
	bl FUN_0200BBA0
	adds r5, r0, #0
	movs r0, #0xa1
	ldr r1, [r4, #0x14]
	lsls r0, r0, #2
	ldrh r0, [r1, r0]
	movs r1, #5
	movs r2, #0xb
	bl FUN_02077D88
	adds r2, r0, #0
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200C168
	b _0225E8DA
_0225E8AC:
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x31
	bl FUN_0200BBA0
	adds r5, r0, #0
	b _0225E8DA
_0225E8BC:
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x15
	bl FUN_0200BBA0
	adds r5, r0, #0
	b _0225E8DA
_0225E8CC:
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x17
	bl FUN_0200BBA0
	adds r5, r0, #0
_0225E8DA:
	movs r1, #0x55
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x34
	ldr r1, [r4, r1]
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	ldr r2, _0225E940 @ =0x000001B5
	adds r0, #0x44
	movs r1, #1
	movs r3, #5
	bl FUN_0200E998
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0225E944 @ =ov31_0225E948
	movs r2, #0x62
	str r0, [sp, #8]
	lsls r2, r2, #2
	adds r0, r4, #0
	ldr r2, [r4, r2]
	adds r0, #0x44
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xa
	ldr r2, [r4, #0x14]
	lsls r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0225E938: .4byte 0x00000286
_0225E93C: .4byte 0x00000283
_0225E940: .4byte 0x000001B5
_0225E944: .4byte ov31_0225E948
	thumb_func_end ov31_0225E7D4

	thumb_func_start ov31_0225E948
ov31_0225E948: @ 0x0225E948
	push {r3, lr}
	cmp r1, #1
	bne _0225E954
	ldr r0, _0225E958 @ =0x00000643
	bl FUN_0200604C
_0225E954:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_0225E958: .4byte 0x00000643
	thumb_func_end ov31_0225E948

	thumb_func_start ov31_0225E95C
ov31_0225E95C: @ 0x0225E95C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0225E9C8 @ =0x00000283
	adds r4, r1, #0
	ldrb r1, [r5, r0]
	adds r1, #0xfd
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _0225E97A
	subs r0, #0x2f
	ldr r0, [r5, r0]
	bl FUN_02031A6C
	b _0225E982
_0225E97A:
	subs r0, #0x3b
	ldr r0, [r5, r0]
	bl FUN_02029024
_0225E982:
	adds r1, r0, #0
	adds r0, r5, #0
	bl FUN_02257814
	cmp r0, #2
	bne _0225E998
	adds r0, r4, #0
	movs r1, #0x19
	bl FUN_0200BBA0
	pop {r3, r4, r5, pc}
_0225E998:
	cmp r0, #3
	bne _0225E9A6
	adds r0, r4, #0
	movs r1, #0x1a
	bl FUN_0200BBA0
	pop {r3, r4, r5, pc}
_0225E9A6:
	ldr r0, _0225E9C8 @ =0x00000283
	ldrb r0, [r5, r0]
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0225E9BE
	adds r0, r4, #0
	movs r1, #0x30
	bl FUN_0200BBA0
	pop {r3, r4, r5, pc}
_0225E9BE:
	adds r0, r4, #0
	movs r1, #0xb
	bl FUN_0200BBA0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225E9C8: .4byte 0x00000283
	thumb_func_end ov31_0225E95C

	thumb_func_start ov31_0225E9CC
ov31_0225E9CC: @ 0x0225E9CC
	ldr r2, _0225EA00 @ =0x00000283
	ldrb r0, [r0, r2]
	cmp r0, #0
	bne _0225E9D8
	movs r3, #0x10
	b _0225E9F6
_0225E9D8:
	cmp r0, #1
	bne _0225E9E0
	movs r3, #0x16
	b _0225E9F6
_0225E9E0:
	cmp r0, #2
	bne _0225E9E8
	movs r3, #0x18
	b _0225E9F6
_0225E9E8:
	cmp r0, #3
	bne _0225E9F0
	movs r3, #0x19
	b _0225E9F6
_0225E9F0:
	cmp r0, #4
	bne _0225E9F6
	movs r3, #0x1a
_0225E9F6:
	adds r0, r1, #0
	adds r1, r3, #0
	ldr r3, _0225EA04 @ =FUN_0200BBA0
	bx r3
	nop
_0225EA00: .4byte 0x00000283
_0225EA04: .4byte FUN_0200BBA0
	thumb_func_end ov31_0225E9CC

	thumb_func_start ov31_0225EA08
ov31_0225EA08: @ 0x0225EA08
	push {r4, r5, lr}
	sub sp, #0xc
	movs r1, #0x56
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, #0x14]
	ldr r1, [r5, r1]
	bl ov31_0225E95C
	movs r1, #0x55
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, #0x34
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r1, #4
	str r1, [sp, #4]
	ldr r0, [r5, #4]
	ldr r2, _0225EA98 @ =0x000001B5
	movs r3, #5
	bl FUN_0200E644
	adds r0, r5, #0
	ldr r2, _0225EA98 @ =0x000001B5
	adds r0, #0x44
	movs r1, #1
	movs r3, #5
	bl FUN_0200E998
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	movs r2, #0x62
	adds r0, r5, #0
	str r3, [sp, #8]
	lsls r2, r2, #2
	ldr r2, [r5, r2]
	adds r0, #0x44
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xa
	ldr r2, [r5, #0x14]
	lsls r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0225EA98: .4byte 0x000001B5
	thumb_func_end ov31_0225EA08

	thumb_func_start ov31_0225EA9C
ov31_0225EA9C: @ 0x0225EA9C
	push {r4, r5, lr}
	sub sp, #0xc
	movs r1, #0x56
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, #0x14]
	ldr r1, [r5, r1]
	bl ov31_0225E9CC
	movs r1, #0x55
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, #0x34
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r1, #4
	str r1, [sp, #4]
	ldr r0, [r5, #4]
	ldr r2, _0225EB2C @ =0x000001B5
	movs r3, #5
	bl FUN_0200E644
	adds r0, r5, #0
	ldr r2, _0225EB2C @ =0x000001B5
	adds r0, #0x44
	movs r1, #1
	movs r3, #5
	bl FUN_0200E998
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	movs r2, #0x62
	adds r0, r5, #0
	str r3, [sp, #8]
	lsls r2, r2, #2
	ldr r2, [r5, r2]
	adds r0, #0x44
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xa
	ldr r2, [r5, #0x14]
	lsls r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0225EB2C: .4byte 0x000001B5
	thumb_func_end ov31_0225EA9C

	thumb_func_start ov31_0225EB30
ov31_0225EB30: @ 0x0225EB30
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x10
	bl FUN_0200BBA0
	movs r1, #0x55
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, #0x34
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r1, #4
	str r1, [sp, #4]
	ldr r0, [r5, #4]
	ldr r2, _0225EBC0 @ =0x000001B5
	movs r3, #5
	bl FUN_0200E644
	adds r0, r5, #0
	ldr r2, _0225EBC0 @ =0x000001B5
	adds r0, #0x44
	movs r1, #1
	movs r3, #5
	bl FUN_0200E998
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	movs r2, #0x62
	adds r0, r5, #0
	str r3, [sp, #8]
	lsls r2, r2, #2
	ldr r2, [r5, r2]
	adds r0, #0x44
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xa
	ldr r2, [r5, #0x14]
	lsls r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0225EBC0: .4byte 0x000001B5
	thumb_func_end ov31_0225EB30

	thumb_func_start ov31_0225EBC4
ov31_0225EBC4: @ 0x0225EBC4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x14
	bl FUN_0200BBA0
	movs r1, #0x55
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, #0x34
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r1, #4
	str r1, [sp, #4]
	ldr r0, [r5, #4]
	ldr r2, _0225EC54 @ =0x000001B5
	movs r3, #5
	bl FUN_0200E644
	adds r0, r5, #0
	ldr r2, _0225EC54 @ =0x000001B5
	adds r0, #0x44
	movs r1, #1
	movs r3, #5
	bl FUN_0200E998
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	movs r2, #0x62
	adds r0, r5, #0
	str r3, [sp, #8]
	lsls r2, r2, #2
	ldr r2, [r5, r2]
	adds r0, #0x44
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xa
	ldr r2, [r5, #0x14]
	lsls r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0225EC54: .4byte 0x000001B5
	thumb_func_end ov31_0225EBC4

	thumb_func_start ov31_0225EC58
ov31_0225EC58: @ 0x0225EC58
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #7
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r2, #4
	adds r1, r4, #0
	str r2, [sp, #8]
	movs r3, #0xc
	str r3, [sp, #0xc]
	movs r0, #0xad
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, #0xe4
	bl FUN_0201D40C
	movs r0, #0xe
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	movs r0, #0xd9
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0xf4
	movs r2, #4
	movs r3, #0x10
	bl FUN_0201D40C
	movs r0, #0xe
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	movs r1, #0xdf
	str r1, [sp, #0x10]
	adds r1, #0x25
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #4
	movs r3, #0x14
	bl FUN_0201D40C
	movs r0, #0x15
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	movs r1, #0xe5
	str r1, [sp, #0x10]
	adds r1, #0x2f
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #4
	movs r3, #0xe
	bl FUN_0201D40C
	movs r0, #0xd
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r1, #0xf3
	str r1, [sp, #0x10]
	adds r1, #0x31
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #4
	movs r3, #1
	bl FUN_0201D40C
	movs r0, #0xe
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0xc
	ldr r1, _0225ED98 @ =0x0000011B
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r1, #0x19
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #4
	movs r3, #0x17
	bl FUN_0201D40C
	movs r0, #1
	str r0, [sp]
	movs r0, #0x11
	str r0, [sp, #4]
	movs r2, #4
	str r2, [sp, #8]
	movs r3, #0xc
	ldr r1, _0225ED9C @ =0x00000133
	str r3, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r1, #0x11
	ldr r0, [r4, #4]
	adds r1, r4, r1
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0xe4
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0xf4
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x41
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x49
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x4d
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x51
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0xf
	bl FUN_0201D978
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_0225ED98: .4byte 0x0000011B
_0225ED9C: .4byte 0x00000133
	thumb_func_end ov31_0225EC58

	thumb_func_start ov31_0225EDA0
ov31_0225EDA0: @ 0x0225EDA0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xe4
	bl FUN_0201D8E4
	adds r0, r4, #0
	adds r0, #0xf4
	bl FUN_0201D8E4
	movs r0, #0x41
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	movs r0, #0x49
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	movs r0, #0x4d
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	movs r0, #0x51
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	movs r0, #0x51
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0
	bl FUN_0200E9BC
	adds r0, r4, #0
	adds r0, #0xe4
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0xf4
	bl FUN_0201D520
	movs r0, #0x41
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0x49
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0x4d
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0x51
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov31_0225EDA0

	.rodata

_0225EE40:
	.byte 0x00, 0xBF, 0x00, 0xFF, 0x58, 0x6F, 0x78, 0x97, 0x58, 0x6F, 0x98, 0xB7, 0x88, 0x9F, 0x78, 0x97
	.byte 0x88, 0x9F, 0x98, 0xB7, 0xA8, 0xBF, 0x60, 0xAD, 0xA8, 0xBF, 0xB2, 0xFF, 0xFF, 0x00, 0x00, 0x00
	.byte 0x20, 0x49, 0x00, 0x7F, 0x20, 0x49, 0x80, 0xFF, 0x4A, 0x75, 0x00, 0x7F, 0x4A, 0x75, 0x80, 0xFF
	.byte 0x76, 0x99, 0x00, 0x7F, 0x76, 0x99, 0x80, 0xFF, 0xA8, 0xBF, 0x00, 0x27, 0xA8, 0xBF, 0x28, 0x4F
	.byte 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0xAD, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0xD9, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x05, 0x01, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x31, 0x01, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x5D, 0x01, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x89, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x01
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.data

_0225EF40:
	.byte 0x60, 0xEE, 0x25, 0x02, 0x44, 0xEE, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x20, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x10, 0x04, 0x10, 0x10, 0x00, 0x01, 0x00, 0x13, 0x00, 0x09, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0A, 0x10, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x10, 0x04, 0x10, 0x10, 0x00, 0x01, 0x00, 0x13, 0x00, 0x09, 0x10, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10, 0x13, 0x10, 0x09, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0A, 0x20, 0x0A, 0x00, 0x01, 0x00, 0x13, 0x00, 0x0E, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0F, 0x10, 0x05, 0x00, 0x01, 0x10, 0x13, 0x10, 0x09, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x10, 0x0A, 0x10, 0x0A, 0x00, 0x01, 0x00, 0x13, 0x00, 0x0E, 0x10, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10, 0x13, 0x10, 0x0E, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0F, 0x20, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10, 0x13, 0x10, 0x0E, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x10, 0x0F, 0x10, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x0225F020
