
	thumb_func_start ov121_021E5900
ov121_021E5900: @ 0x021E5900
	push {r3, lr}
	bl ov121_021E5AEC
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov121_021E5900

	thumb_func_start ov121_021E590C
ov121_021E590C: @ 0x021E590C
	push {r3, r4, lr}
	sub sp, #0xc
	bl FUN_02007290
	movs r1, #0x23
	adds r4, r0, #0
	lsls r1, r1, #4
	ldrb r1, [r4, r1]
	cmp r1, #4
	bhi _021E59B0
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E592C: @ jump table
	.2byte _021E5936 - _021E592C - 2 @ case 0
	.2byte _021E5956 - _021E592C - 2 @ case 1
	.2byte _021E5968 - _021E592C - 2 @ case 2
	.2byte _021E597A - _021E592C - 2 @ case 3
	.2byte _021E599C - _021E592C - 2 @ case 4
_021E5936:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x9e
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0x23
	movs r1, #1
	lsls r0, r0, #4
	strb r1, [r4, r0]
	b _021E59B0
_021E5956:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E59B0
	movs r0, #0x23
	movs r1, #2
	lsls r0, r0, #4
	strb r1, [r4, r0]
	b _021E59B0
_021E5968:
	bl ov121_021E5C50
	cmp r0, #0
	beq _021E59B0
	movs r0, #0x23
	movs r1, #3
	lsls r0, r0, #4
	strb r1, [r4, r0]
	b _021E59B0
_021E597A:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x9e
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0x23
	movs r1, #4
	lsls r0, r0, #4
	strb r1, [r4, r0]
	b _021E59B0
_021E599C:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E59B0
	adds r0, r4, #0
	bl ov121_021E6F78
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_021E59B0:
	adds r0, r4, #0
	bl ov121_021E5CB4
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov121_021E590C

	thumb_func_start ov121_021E59BC
ov121_021E59BC: @ 0x021E59BC
	push {r3, r4, r5, r6, r7, lr}
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, _021E5AE0 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	ldr r0, _021E5AE4 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	adds r0, r4, #0
	bl ov121_021E6A4C
	adds r0, r4, #4
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x14
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x24
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x34
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x44
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x54
	bl FUN_0201D520
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4]
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	bl ov121_021E611C
	movs r0, #0x77
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200AEB0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200B0A8
	movs r7, #0x71
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #2
_021E5A5A:
	ldr r0, [r5, r7]
	bl FUN_0200A0D0
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #6
	blt _021E5A5A
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	bl FUN_02024504
	movs r0, #4
	bl FUN_02002DB4
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl FUN_02016624
	movs r0, #0x8b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, [r4]
	bl FUN_0201AB0C
	ldr r0, _021E5AE8 @ =0x0000025E
	movs r5, #0
	ldrb r0, [r4, r0]
	adds r0, r0, #1
	cmp r0, #0
	ble _021E5AC4
	ldr r7, _021E5AE8 @ =0x0000025E
	adds r6, r4, #0
_021E5AAE:
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0202EAFC
	ldrb r0, [r4, r7]
	adds r5, r5, #1
	adds r6, r6, #4
	adds r0, r0, #1
	cmp r5, r0
	blt _021E5AAE
_021E5AC4:
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0x9e
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5AE0: .4byte 0x021D116C
_021E5AE4: .4byte 0x04000050
_021E5AE8: .4byte 0x0000025E
	thumb_func_end ov121_021E59BC

	thumb_func_start ov121_021E5AEC
ov121_021E5AEC: @ 0x021E5AEC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_020072A4
	movs r2, #1
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0x9e
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r1, #0x9b
	adds r0, r5, #0
	lsls r1, r1, #2
	movs r2, #0x9e
	bl FUN_02007280
	movs r2, #0x9b
	movs r1, #0
	lsls r2, r2, #2
	adds r5, r0, #0
	blx FUN_020E5B44
	movs r0, #0x9e
	bl FUN_0201AC88
	str r0, [r5]
	bl ov121_021E5D84
	ldr r0, [r5]
	bl ov121_021E5DA4
	bl ov121_021E5EDC
	bl ov121_021E5F0C
	adds r0, r5, #0
	movs r1, #0x9e
	bl ov121_021E600C
	adds r0, r5, #0
	bl ov121_021E60D4
	movs r0, #0x9e
	bl FUN_0201660C
	adds r1, r5, #0
	adds r1, #0x94
	str r0, [r1]
	ldr r0, [r4, #4]
	bl FUN_02028EA8
	bl FUN_0202ADCC
	movs r1, #0x9a
	lsls r1, r1, #2
	strb r0, [r5, r1]
	ldr r0, _021E5C3C @ =ov121_021E5F30
	ldr r1, [r5]
	bl FUN_0201A0FC
	movs r0, #0x23
	movs r1, #0
	lsls r0, r0, #4
	strb r1, [r5, r0]
	bl FUN_02020080
	movs r0, #4
	movs r1, #0x9e
	bl FUN_02002CEC
	ldr r0, [r5]
	movs r1, #0x9e
	bl ov121_021E5F58
	movs r1, #0x1e
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x9e
	bl FUN_02003030
	adds r0, r5, #0
	bl ov121_021E66EC
	adds r0, r5, #0
	bl ov121_021E6194
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	adds r0, r5, #0
	movs r1, #0x9e
	bl ov121_021E62A0
	ldr r0, _021E5C40 @ =0x00000233
	movs r1, #1
	strb r1, [r5, r0]
	ldr r0, [r4, #4]
	bl FUN_0202E530
	movs r1, #0x8d
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldrh r0, [r4]
	movs r1, #3
	blx FUN_020F2998
	movs r0, #0x97
	lsls r0, r0, #2
	strb r1, [r5, r0]
	ldrh r0, [r4]
	movs r1, #3
	blx FUN_020F2998
	ldr r1, _021E5C44 @ =0x0000025D
	strb r0, [r5, r1]
	subs r0, r1, #1
	ldrb r0, [r5, r0]
	bl FUN_0202E4B0
	ldr r1, _021E5C48 @ =0x0000025E
	strb r0, [r5, r1]
	subs r0, r1, #2
	ldrb r0, [r5, r0]
	bl FUN_0202E4BC
	ldr r1, _021E5C4C @ =0x0000025F
	strb r0, [r5, r1]
	ldr r1, [r4, #4]
	adds r0, r5, #0
	bl ov121_021E67FC
	movs r0, #0x26
	ldrh r1, [r4, #2]
	lsls r0, r0, #4
	strb r1, [r5, r0]
	ldrb r1, [r5, r0]
	subs r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r1, r0
	blo _021E5C14
	bl FUN_0202551C
	movs r0, #0x26
	movs r1, #0
	lsls r0, r0, #4
	strb r1, [r5, r0]
_021E5C14:
	adds r0, r5, #0
	bl ov121_021E69F0
	adds r0, r5, #0
	movs r1, #0
	bl ov121_021E6690
	adds r0, r5, #0
	bl ov121_021E6A84
	adds r0, r5, #0
	bl ov121_021E6C5C
	adds r0, r5, #0
	bl ov121_021E6CA4
	adds r0, r5, #0
	bl ov121_021E6DD8
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5C3C: .4byte ov121_021E5F30
_021E5C40: .4byte 0x00000233
_021E5C44: .4byte 0x0000025D
_021E5C48: .4byte 0x0000025E
_021E5C4C: .4byte 0x0000025F
	thumb_func_end ov121_021E5AEC

	thumb_func_start ov121_021E5C50
ov121_021E5C50: @ 0x021E5C50
	push {r4, lr}
	ldr r1, _021E5CB0 @ =0x00000233
	adds r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #4
	bhi _021E5CAC
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_021E5C68: @ jump table
	.2byte _021E5C72 - _021E5C68 - 2 @ case 0
	.2byte _021E5C7E - _021E5C68 - 2 @ case 1
	.2byte _021E5C8A - _021E5C68 - 2 @ case 2
	.2byte _021E5C90 - _021E5C68 - 2 @ case 3
	.2byte _021E5CA0 - _021E5C68 - 2 @ case 4
_021E5C72:
	bl ov121_021E6A84
	ldr r0, _021E5CB0 @ =0x00000233
	movs r1, #1
	strb r1, [r4, r0]
	b _021E5CAC
_021E5C7E:
	bl ov121_021E5CC4
	cmp r0, #0
	beq _021E5CAC
	movs r0, #1
	pop {r4, pc}
_021E5C8A:
	bl ov121_021E5D08
	b _021E5CAC
_021E5C90:
	bl ov121_021E5D5C
	cmp r0, #0
	beq _021E5CAC
	ldr r0, _021E5CB0 @ =0x00000233
	movs r1, #1
	strb r1, [r4, r0]
	b _021E5CAC
_021E5CA0:
	adds r0, r1, #0
	adds r0, #0x25
	ldr r0, [r4, r0]
	movs r2, #0
	strh r2, [r0, #4]
	strb r2, [r4, r1]
_021E5CAC:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E5CB0: .4byte 0x00000233
	thumb_func_end ov121_021E5C50

	thumb_func_start ov121_021E5CB4
ov121_021E5CB4: @ 0x021E5CB4
	push {r3, lr}
	adds r0, #0x98
	ldr r0, [r0]
	cmp r0, #0
	beq _021E5CC2
	bl FUN_0202457C
_021E5CC2:
	pop {r3, pc}
	thumb_func_end ov121_021E5CB4

	thumb_func_start ov121_021E5CC4
ov121_021E5CC4: @ 0x021E5CC4
	push {r3, r4, lr}
	sub sp, #4
	add r1, sp, #0
	adds r4, r0, #0
	bl ov121_021E633C
	adds r1, r0, #0
	bne _021E5CDA
	add sp, #4
	movs r0, #0
	pop {r3, r4, pc}
_021E5CDA:
	ldr r0, _021E5D04 @ =0x00000231
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021E5CF4
	ldr r2, [sp]
	adds r0, r4, #0
	bl ov121_021E6404
	cmp r0, #0
	beq _021E5CFC
	add sp, #4
	movs r0, #1
	pop {r3, r4, pc}
_021E5CF4:
	ldr r2, [sp]
	adds r0, r4, #0
	bl ov121_021E6478
_021E5CFC:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E5D04: .4byte 0x00000231
	thumb_func_end ov121_021E5CC4

	thumb_func_start ov121_021E5D08
ov121_021E5D08: @ 0x021E5D08
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021E5D1E
	cmp r0, #2
	beq _021E5D3A
	pop {r4, pc}
_021E5D1E:
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl FUN_020169CC
	bl ov121_021E6F6C
	ldr r0, _021E5D58 @ =0x00000233
	movs r1, #4
	strb r1, [r4, r0]
	adds r0, r4, #0
	bl ov121_021E6E68
	pop {r4, pc}
_021E5D3A:
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl FUN_020169CC
	bl ov121_021E6F6C
	ldr r0, _021E5D58 @ =0x00000233
	movs r1, #1
	strb r1, [r4, r0]
	adds r0, r4, #0
	bl ov121_021E6E68
	pop {r4, pc}
	nop
_021E5D58: .4byte 0x00000233
	thumb_func_end ov121_021E5D08

	thumb_func_start ov121_021E5D5C
ov121_021E5D5C: @ 0x021E5D5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E5D80 @ =0x021D110C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	bne _021E5D70
	bl FUN_02025358
	cmp r0, #0
	beq _021E5D7A
_021E5D70:
	adds r0, r4, #0
	bl ov121_021E6E68
	movs r0, #1
	pop {r4, pc}
_021E5D7A:
	movs r0, #0
	pop {r4, pc}
	nop
_021E5D80: .4byte 0x021D110C
	thumb_func_end ov121_021E5D5C

	thumb_func_start ov121_021E5D84
ov121_021E5D84: @ 0x021E5D84
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5DA0 @ =0x021E70E8
	add r3, sp, #0
	movs r2, #5
_021E5D8E:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5D8E
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E5DA0: .4byte 0x021E70E8
	thumb_func_end ov121_021E5D84

	thumb_func_start ov121_021E5DA4
ov121_021E5DA4: @ 0x021E5DA4
	push {r3, r4, r5, lr}
	sub sp, #0xa0
	adds r4, r0, #0
	ldr r0, _021E5EC0 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	ldr r5, _021E5EC4 @ =0x021E701C
	add r3, sp, #0x90
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E5EC8 @ =0x021E7058
	add r3, sp, #0x74
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
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _021E5ECC @ =0x021E7074
	add r3, sp, #0x58
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #1
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _021E5ED0 @ =0x021E7090
	add r3, sp, #0x3c
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
	ldr r5, _021E5ED4 @ =0x021E703C
	add r3, sp, #0x20
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
	ldr r5, _021E5ED8 @ =0x021E70AC
	add r3, sp, #4
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
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #1
	str r1, [sp]
	bl FUN_0201C1F4
	movs r1, #1
	movs r2, #0
	adds r0, r4, #0
	adds r3, r1, #0
	str r2, [sp]
	bl FUN_0201C1F4
	movs r2, #0
	adds r0, r4, #0
	movs r1, #2
	movs r3, #1
	str r2, [sp]
	bl FUN_0201C1F4
	add sp, #0xa0
	pop {r3, r4, r5, pc}
	nop
_021E5EC0: .4byte 0x021D116C
_021E5EC4: .4byte 0x021E701C
_021E5EC8: .4byte 0x021E7058
_021E5ECC: .4byte 0x021E7074
_021E5ED0: .4byte 0x021E7090
_021E5ED4: .4byte 0x021E703C
_021E5ED8: .4byte 0x021E70AC
	thumb_func_end ov121_021E5DA4

	thumb_func_start ov121_021E5EDC
ov121_021E5EDC: @ 0x021E5EDC
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E5F08 @ =0x021E702C
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_020215A0
	movs r0, #1
	movs r1, #0x9e
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E5F08: .4byte 0x021E702C
	thumb_func_end ov121_021E5EDC

	thumb_func_start ov121_021E5F0C
ov121_021E5F0C: @ 0x021E5F0C
	push {lr}
	sub sp, #0x14
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x9e
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	add sp, #0x14
	pop {pc}
	thumb_func_end ov121_021E5F0C

	thumb_func_start ov121_021E5F30
ov121_021E5F30: @ 0x021E5F30
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200B224
	adds r0, r4, #0
	bl FUN_0201EEB4
	bl FUN_0202061C
	ldr r3, _021E5F50 @ =0x027E0000
	ldr r1, _021E5F54 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E5F50: .4byte 0x027E0000
_021E5F54: .4byte 0x00003FF8
	thumb_func_end ov121_021E5F30

	thumb_func_start ov121_021E5F58
ov121_021E5F58: @ 0x021E5F58
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x40
	movs r2, #0
	adds r4, r1, #0
	str r0, [sp]
	adds r0, #0xc6
	movs r1, #1
	adds r3, r2, #0
	str r4, [sp, #4]
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r1, #3
	ldr r0, _021E6008 @ =0x00000106
	adds r2, r5, #0
	adds r3, r1, #0
	str r4, [sp, #0xc]
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _021E6008 @ =0x00000106
	movs r1, #5
	adds r2, r5, #0
	movs r3, #3
	str r4, [sp, #0xc]
	bl FUN_02007914
	adds r0, r5, #0
	movs r1, #3
	bl FUN_0201BF7C
	movs r0, #0x20
	str r0, [sp]
	movs r1, #0
	adds r0, #0xe6
	movs r2, #4
	adds r3, r1, #0
	str r4, [sp, #4]
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _021E6008 @ =0x00000106
	movs r1, #2
	adds r2, r5, #0
	movs r3, #4
	str r4, [sp, #0xc]
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r1, #4
	ldr r0, _021E6008 @ =0x00000106
	adds r2, r5, #0
	adds r3, r1, #0
	str r4, [sp, #0xc]
	bl FUN_02007914
	adds r0, r5, #0
	movs r1, #4
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6008: .4byte 0x00000106
	thumb_func_end ov121_021E5F58

	thumb_func_start ov121_021E600C
ov121_021E600C: @ 0x021E600C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r7, r1, #0
	adds r1, r6, #0
	movs r0, #5
	adds r1, #0x9c
	adds r2, r7, #0
	bl FUN_02009F40
	adds r1, r6, #0
	adds r1, #0x98
	str r0, [r1]
	movs r4, #0
	adds r5, r6, #0
_021E602A:
	movs r0, #1
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0200A090
	movs r1, #0x71
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _021E602A
	movs r0, #0
	str r0, [sp]
	movs r3, #1
	str r3, [sp, #4]
	str r7, [sp, #8]
	ldr r0, [r6, r1]
	subs r1, #0xbe
	movs r2, #9
	bl FUN_0200A1D8
	movs r1, #0x77
	lsls r1, r1, #2
	str r0, [r6, r1]
	movs r3, #0
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	adds r0, r1, #0
	str r7, [sp, #0xc]
	subs r0, #0x14
	ldr r0, [r6, r0]
	subs r1, #0xd6
	movs r2, #6
	bl FUN_0200A234
	movs r1, #0x1e
	lsls r1, r1, #4
	str r0, [r6, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r1, #0
	str r7, [sp, #8]
	subs r0, #0x14
	ldr r0, [r6, r0]
	subs r1, #0xda
	movs r2, #8
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x79
	lsls r1, r1, #2
	str r0, [r6, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	adds r0, r1, #0
	str r7, [sp, #8]
	subs r0, #0x14
	ldr r0, [r6, r0]
	subs r1, #0xde
	movs r2, #7
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x7a
	lsls r1, r1, #2
	str r0, [r6, r1]
	subs r1, #0xc
	ldr r0, [r6, r1]
	bl FUN_0200ADA4
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_0200AF94
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov121_021E600C

	thumb_func_start ov121_021E60D4
ov121_021E60D4: @ 0x021E60D4
	push {lr}
	sub sp, #0x2c
	movs r1, #0
	str r1, [sp]
	subs r2, r1, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r3, #0x71
	str r1, [sp, #0xc]
	movs r2, #3
	lsls r3, r3, #2
	str r2, [sp, #0x10]
	ldr r2, [r0, r3]
	str r2, [sp, #0x14]
	adds r2, r3, #4
	ldr r2, [r0, r2]
	str r2, [sp, #0x18]
	adds r2, r3, #0
	adds r2, #8
	ldr r2, [r0, r2]
	str r2, [sp, #0x1c]
	adds r2, r3, #0
	adds r2, #0xc
	ldr r2, [r0, r2]
	adds r3, #0x30
	str r2, [sp, #0x20]
	str r1, [sp, #0x24]
	adds r0, r0, r3
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp, #0x28]
	bl FUN_02009D48
	add sp, #0x2c
	pop {pc}
	.align 2, 0
	thumb_func_end ov121_021E60D4

	thumb_func_start ov121_021E611C
ov121_021E611C: @ 0x021E611C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x86
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E612E
	bl FUN_02024758
_021E612E:
	movs r0, #0x87
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E613C
	bl FUN_02024758
_021E613C:
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E614A
	bl FUN_02024758
_021E614A:
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E6158
	bl FUN_02024758
_021E6158:
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E6166
	bl FUN_02024758
_021E6166:
	pop {r4, pc}
	thumb_func_end ov121_021E611C

	thumb_func_start ov121_021E6168
ov121_021E6168: @ 0x021E6168
	adds r2, r1, #0
	adds r2, #0x98
	ldr r2, [r2]
	str r2, [r0]
	movs r2, #0x7d
	lsls r2, r2, #2
	adds r1, r1, r2
	str r1, [r0, #4]
	movs r2, #0
	movs r1, #1
	str r2, [r0, #0x10]
	lsls r1, r1, #0xc
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	strh r2, [r0, #0x20]
	str r2, [r0, #0x24]
	movs r1, #1
	str r1, [r0, #0x28]
	movs r1, #0x9e
	str r1, [r0, #0x2c]
	bx lr
	thumb_func_end ov121_021E6168

	thumb_func_start ov121_021E6194
ov121_021E6194: @ 0x021E6194
	push {r3, r4, r5, lr}
	sub sp, #0x30
	adds r4, r0, #0
	add r0, sp, #0
	adds r1, r4, #0
	bl ov121_021E6168
	movs r0, #0xe
	lsls r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xb
	lsls r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl FUN_02024624
	adds r5, r0, #0
	movs r1, #1
	bl FUN_0202484C
	adds r0, r5, #0
	movs r1, #2
	bl FUN_020248F0
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02024A04
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x86
	lsls r0, r0, #2
	str r5, [r4, r0]
	movs r0, #1
	lsls r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #6
	lsls r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl FUN_02024624
	adds r5, r0, #0
	movs r1, #1
	bl FUN_0202484C
	adds r0, r5, #0
	movs r1, #3
	bl FUN_020248F0
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x22
	lsls r0, r0, #4
	str r5, [r4, r0]
	movs r0, #0xf
	lsls r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #6
	lsls r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl FUN_02024624
	adds r5, r0, #0
	movs r1, #1
	bl FUN_0202484C
	adds r0, r5, #0
	movs r1, #5
	bl FUN_020248F0
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x87
	lsls r0, r0, #2
	str r5, [r4, r0]
	movs r0, #0xe
	lsls r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xb
	lsls r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl FUN_02024624
	adds r5, r0, #0
	movs r1, #1
	bl FUN_0202484C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_020248F0
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x89
	lsls r0, r0, #2
	str r5, [r4, r0]
	movs r0, #1
	lsls r0, r0, #0x12
	str r0, [sp, #8]
	movs r0, #0xb
	lsls r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl FUN_02024624
	adds r5, r0, #0
	movs r1, #1
	bl FUN_0202484C
	adds r0, r5, #0
	movs r1, #8
	bl FUN_020248F0
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x8a
	lsls r0, r0, #2
	str r5, [r4, r0]
	add sp, #0x30
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov121_021E6194

	thumb_func_start ov121_021E62A0
ov121_021E62A0: @ 0x021E62A0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	movs r1, #0x28
	bl FUN_0201AA8C
	movs r1, #0x8b
	lsls r1, r1, #2
	movs r2, #0
	str r0, [r4, r1]
	adds r3, r2, #0
	movs r5, #0x38
	movs r0, #0x28
	adds r6, r1, #0
_021E62BC:
	ldr r7, [r4, r6]
	adds r2, r2, #1
	strb r5, [r7, r3]
	adds r1, r7, r3
	strb r0, [r1, #2]
	ldrb r7, [r7, r3]
	adds r3, r3, #4
	adds r5, #0x10
	adds r7, #0x10
	strb r7, [r1, #1]
	ldrb r7, [r1, #2]
	adds r7, #0xb0
	strb r7, [r1, #3]
	cmp r2, #6
	blt _021E62BC
	movs r0, #0x8b
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	movs r5, #0xa8
	adds r3, r2, #0
	adds r3, #0x18
	strb r5, [r2, #0x18]
	movs r1, #8
	strb r1, [r3, #2]
	ldrb r1, [r2, #0x18]
	adds r1, #0x10
	strb r1, [r3, #1]
	ldrb r1, [r3, #2]
	adds r1, #0x80
	strb r1, [r3, #3]
	ldr r2, [r4, r0]
	movs r1, #0xc0
	adds r3, r2, #0
	strb r5, [r2, #0x1c]
	adds r3, #0x1c
	strb r1, [r3, #2]
	ldrb r1, [r2, #0x1c]
	movs r5, #0xfe
	movs r2, #0x60
	adds r1, #0x10
	strb r1, [r3, #1]
	ldrb r1, [r3, #2]
	adds r1, #0x40
	strb r1, [r3, #3]
	ldr r1, [r4, r0]
	movs r3, #0x10
	adds r6, r1, #0
	adds r1, #0x20
	adds r6, #0x20
	strb r5, [r1]
	strb r3, [r6, #1]
	strb r2, [r6, #2]
	strb r3, [r6, #3]
	ldr r0, [r4, r0]
	adds r1, r0, #0
	adds r0, #0x24
	strb r5, [r0]
	adds r1, #0x24
	movs r0, #0xf0
	strb r0, [r1, #1]
	strb r2, [r1, #2]
	strb r3, [r1, #3]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov121_021E62A0

	thumb_func_start ov121_021E633C
ov121_021E633C: @ 0x021E633C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r4, #0
	bl FUN_0202534C
	cmp r0, #0
	bne _021E63A2
	ldr r0, _021E6400 @ =0x021D110C
	ldr r4, [r0, #0x48]
	cmp r4, #0
	beq _021E63A2
	cmp r4, #0x20
	bgt _021E6370
	bge _021E6386
	cmp r4, #2
	bgt _021E636A
	cmp r4, #1
	blt _021E63A2
	beq _021E639A
	cmp r4, #2
	beq _021E639E
	b _021E63A2
_021E636A:
	cmp r4, #0x10
	beq _021E638A
	b _021E63A2
_021E6370:
	cmp r4, #0x80
	bgt _021E637C
	bge _021E6392
	cmp r4, #0x40
	beq _021E638E
	b _021E63A2
_021E637C:
	movs r0, #1
	lsls r0, r0, #0xa
	cmp r4, r0
	beq _021E6396
	b _021E63A2
_021E6386:
	movs r0, #6
	pop {r4, r5, r6, pc}
_021E638A:
	movs r0, #7
	pop {r4, r5, r6, pc}
_021E638E:
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E6392:
	movs r0, #2
	pop {r4, r5, r6, pc}
_021E6396:
	movs r0, #5
	pop {r4, r5, r6, pc}
_021E639A:
	movs r0, #8
	pop {r4, r5, r6, pc}
_021E639E:
	movs r0, #4
	pop {r4, r5, r6, pc}
_021E63A2:
	cmp r4, #0
	bne _021E63FC
	bl FUN_02025358
	cmp r0, #0
	beq _021E63FC
	movs r0, #0x8b
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0202529C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021E63FC
	cmp r0, #9
	bhi _021E63FC
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E63D0: @ jump table
	.2byte _021E63E4 - _021E63D0 - 2 @ case 0
	.2byte _021E63E4 - _021E63D0 - 2 @ case 1
	.2byte _021E63E4 - _021E63D0 - 2 @ case 2
	.2byte _021E63E4 - _021E63D0 - 2 @ case 3
	.2byte _021E63E4 - _021E63D0 - 2 @ case 4
	.2byte _021E63E4 - _021E63D0 - 2 @ case 5
	.2byte _021E63EA - _021E63D0 - 2 @ case 6
	.2byte _021E63EE - _021E63D0 - 2 @ case 7
	.2byte _021E63F4 - _021E63D0 - 2 @ case 8
	.2byte _021E63F8 - _021E63D0 - 2 @ case 9
_021E63E4:
	str r0, [r5]
	movs r0, #3
	pop {r4, r5, r6, pc}
_021E63EA:
	movs r0, #5
	pop {r4, r5, r6, pc}
_021E63EE:
	str r0, [r5]
	movs r0, #4
	pop {r4, r5, r6, pc}
_021E63F4:
	movs r0, #6
	pop {r4, r5, r6, pc}
_021E63F8:
	movs r0, #7
	pop {r4, r5, r6, pc}
_021E63FC:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E6400: .4byte 0x021D110C
	thumb_func_end ov121_021E633C

	thumb_func_start ov121_021E6404
ov121_021E6404: @ 0x021E6404
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #8
	bhi _021E646E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E6418: @ jump table
	.2byte _021E646E - _021E6418 - 2 @ case 0
	.2byte _021E646E - _021E6418 - 2 @ case 1
	.2byte _021E646E - _021E6418 - 2 @ case 2
	.2byte _021E646E - _021E6418 - 2 @ case 3
	.2byte _021E6458 - _021E6418 - 2 @ case 4
	.2byte _021E643C - _021E6418 - 2 @ case 5
	.2byte _021E642A - _021E6418 - 2 @ case 6
	.2byte _021E6434 - _021E6418 - 2 @ case 7
	.2byte _021E6458 - _021E6418 - 2 @ case 8
_021E642A:
	movs r1, #0
	mvns r1, r1
	bl ov121_021E662C
	b _021E646E
_021E6434:
	movs r1, #1
	bl ov121_021E662C
	b _021E646E
_021E643C:
	ldr r0, _021E6474 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #9
	bl FUN_020248F0
	adds r0, r4, #0
	movs r1, #1
	bl ov121_021E6690
	b _021E646E
_021E6458:
	ldr r0, _021E6474 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_020248F0
	movs r0, #1
	pop {r4, pc}
_021E646E:
	movs r0, #0
	pop {r4, pc}
	nop
_021E6474: .4byte 0x000005DD
	thumb_func_end ov121_021E6404

	thumb_func_start ov121_021E6478
ov121_021E6478: @ 0x021E6478
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #8
	bhi _021E653A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E648C: @ jump table
	.2byte _021E653A - _021E648C - 2 @ case 0
	.2byte _021E649E - _021E648C - 2 @ case 1
	.2byte _021E64A8 - _021E648C - 2 @ case 2
	.2byte _021E64B0 - _021E648C - 2 @ case 3
	.2byte _021E64EC - _021E648C - 2 @ case 4
	.2byte _021E64B8 - _021E648C - 2 @ case 5
	.2byte _021E653A - _021E648C - 2 @ case 6
	.2byte _021E653A - _021E648C - 2 @ case 7
	.2byte _021E6508 - _021E648C - 2 @ case 8
_021E649E:
	movs r1, #0
	mvns r1, r1
	bl ov121_021E6544
	pop {r4, pc}
_021E64A8:
	movs r1, #1
	bl ov121_021E6544
	pop {r4, pc}
_021E64B0:
	adds r1, r2, #0
	bl ov121_021E65A8
	pop {r4, pc}
_021E64B8:
	ldr r0, _021E653C @ =0x00000232
	ldrsb r1, [r4, r0]
	adds r0, #0x2f
	ldrb r0, [r4, r0]
	cmp r1, r0
	ldr r0, _021E6540 @ =0x000005DD
	bge _021E64D2
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov121_021E6EC0
	pop {r4, pc}
_021E64D2:
	bl FUN_0200604C
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_020248F0
	adds r0, r4, #0
	movs r1, #0
	bl ov121_021E6690
	pop {r4, pc}
_021E64EC:
	ldr r0, _021E6540 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_020248F0
	adds r0, r4, #0
	movs r1, #0
	bl ov121_021E6690
	pop {r4, pc}
_021E6508:
	ldr r0, _021E653C @ =0x00000232
	ldrsb r1, [r4, r0]
	adds r0, #0x2f
	ldrb r0, [r4, r0]
	cmp r1, r0
	ldr r0, _021E6540 @ =0x000005DD
	bge _021E6522
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov121_021E6EC0
	pop {r4, pc}
_021E6522:
	bl FUN_0200604C
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_020248F0
	adds r0, r4, #0
	movs r1, #0
	bl ov121_021E6690
_021E653A:
	pop {r4, pc}
	.align 2, 0
_021E653C: .4byte 0x00000232
_021E6540: .4byte 0x000005DD
	thumb_func_end ov121_021E6478

	thumb_func_start ov121_021E6544
ov121_021E6544: @ 0x021E6544
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	ble _021E6570
	ldr r2, _021E65A0 @ =0x00000232
	ldrsb r0, [r4, r2]
	cmp r0, #6
	bne _021E655A
	movs r0, #0
	strb r0, [r4, r2]
	b _021E6592
_021E655A:
	adds r1, r0, r1
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r4, r0]
	cmp r1, r0
	blt _021E656C
	movs r0, #6
	strb r0, [r4, r2]
	b _021E6592
_021E656C:
	strb r1, [r4, r2]
	b _021E6592
_021E6570:
	bge _021E6592
	ldr r2, _021E65A0 @ =0x00000232
	ldrsb r0, [r4, r2]
	cmp r0, #6
	bne _021E6586
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r4, r0]
	subs r0, r0, #1
	strb r0, [r4, r2]
	b _021E6592
_021E6586:
	adds r0, r0, r1
	bpl _021E6590
	movs r0, #6
	strb r0, [r4, r2]
	b _021E6592
_021E6590:
	strb r0, [r4, r2]
_021E6592:
	ldr r0, _021E65A4 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov121_021E65D8
	pop {r4, pc}
	.align 2, 0
_021E65A0: .4byte 0x00000232
_021E65A4: .4byte 0x000005DC
	thumb_func_end ov121_021E6544

	thumb_func_start ov121_021E65A8
ov121_021E65A8: @ 0x021E65A8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #6
	beq _021E65BA
	ldr r0, _021E65CC @ =0x00000261
	ldrb r0, [r5, r0]
	cmp r4, r0
	bge _021E65CA
_021E65BA:
	ldr r0, _021E65D0 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _021E65D4 @ =0x00000232
	strb r4, [r5, r0]
	adds r0, r5, #0
	bl ov121_021E65D8
_021E65CA:
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E65CC: .4byte 0x00000261
_021E65D0: .4byte 0x000005DC
_021E65D4: .4byte 0x00000232
	thumb_func_end ov121_021E65A8

	thumb_func_start ov121_021E65D8
ov121_021E65D8: @ 0x021E65D8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	add r1, sp, #0
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r2, _021E661C @ =0x00000232
	movs r0, #0xc
	ldrb r3, [r5, r2]
	subs r2, #0x1a
	adds r4, r3, #0
	muls r4, r0, r4
	ldr r0, _021E6620 @ =0x021E7140
	ldr r0, [r0, r4]
	lsls r0, r0, #0xc
	str r0, [sp]
	ldr r0, _021E6624 @ =0x021E7144
	ldr r0, [r0, r4]
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	bl FUN_020247D4
	movs r0, #0x86
	ldr r1, _021E6628 @ =0x021E7148
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r1, r4]
	bl FUN_020248F0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_021E661C: .4byte 0x00000232
_021E6620: .4byte 0x021E7140
_021E6624: .4byte 0x021E7144
_021E6628: .4byte 0x021E7148
	thumb_func_end ov121_021E65D8

	thumb_func_start ov121_021E662C
ov121_021E662C: @ 0x021E662C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x26
	lsls r0, r0, #4
	adds r4, r1, #0
	ldrb r1, [r5, r0]
	adds r1, r1, r4
	bpl _021E6644
	subs r0, r0, #2
	ldrb r0, [r5, r0]
	subs r1, r0, #1
	b _021E664E
_021E6644:
	subs r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r1, r0
	blt _021E664E
	movs r1, #0
_021E664E:
	movs r0, #0x26
	lsls r0, r0, #4
	strb r1, [r5, r0]
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	cmp r4, #0
	ble _021E666E
	movs r0, #0x87
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	bl FUN_020248F0
	b _021E667C
_021E666E:
	bge _021E667C
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #4
	bl FUN_020248F0
_021E667C:
	adds r0, r5, #0
	bl ov121_021E6DD8
	ldr r0, _021E668C @ =0x00000233
	movs r1, #0
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_021E668C: .4byte 0x00000233
	thumb_func_end ov121_021E662C

	thumb_func_start ov121_021E6690
ov121_021E6690: @ 0x021E6690
	push {r4, lr}
	ldr r2, _021E66E8 @ =0x00000231
	adds r4, r0, #0
	strb r1, [r4, r2]
	cmp r1, #0
	bne _021E66C0
	adds r0, r2, #1
	movs r1, #6
	strb r1, [r4, r0]
	subs r2, #0x15
	ldr r0, [r4, r2]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	adds r0, r4, #0
	bl ov121_021E67E4
	b _021E66E0
_021E66C0:
	adds r0, r2, #1
	movs r1, #0
	subs r2, #0x15
	strb r1, [r4, r0]
	ldr r0, [r4, r2]
	bl FUN_02024830
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	bl ov121_021E6E68
_021E66E0:
	adds r0, r4, #0
	bl ov121_021E65D8
	pop {r4, pc}
	.align 2, 0
_021E66E8: .4byte 0x00000231
	thumb_func_end ov121_021E6690

	thumb_func_start ov121_021E66EC
ov121_021E66EC: @ 0x021E66EC
	push {r3, r4, lr}
	sub sp, #0x14
	movs r1, #0x1e
	adds r4, r0, #0
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x9e
	bl FUN_02003030
	movs r0, #7
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	movs r2, #1
	str r2, [sp, #0x10]
	ldr r0, [r4]
	adds r1, r4, #4
	movs r3, #5
	bl FUN_0201D40C
	movs r3, #7
	adds r1, r4, #0
	str r3, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	movs r0, #0x19
	str r0, [sp, #0x10]
	ldr r0, [r4]
	adds r1, #0x14
	movs r2, #1
	bl FUN_0201D40C
	movs r0, #1
	str r0, [sp]
	movs r0, #0x1c
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	adds r0, #0xfa
	str r0, [sp, #0x10]
	adds r1, r4, #0
	movs r2, #2
	ldr r0, [r4]
	adds r1, #0x24
	adds r3, r2, #0
	bl FUN_0201D40C
	movs r0, #0x15
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r2, #2
	adds r1, r4, #0
	str r2, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, _021E67DC @ =0x00000179
	adds r1, #0x34
	str r0, [sp, #0x10]
	ldr r0, [r4]
	movs r3, #0x19
	bl FUN_0201D40C
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r2, #2
	adds r1, r4, #0
	str r2, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, _021E67E0 @ =0x00000185
	adds r1, #0x44
	str r0, [sp, #0x10]
	ldr r0, [r4]
	movs r3, #4
	bl FUN_0201D40C
	movs r0, #1
	str r0, [sp]
	movs r0, #0x1c
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	movs r0, #0x1f
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x54
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0x9a
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	movs r1, #0
	movs r2, #1
	str r0, [sp]
	movs r0, #0x9e
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r3, #0xc
	bl FUN_0200E644
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_021E67DC: .4byte 0x00000179
_021E67E0: .4byte 0x00000185
	thumb_func_end ov121_021E66EC

	thumb_func_start ov121_021E67E4
ov121_021E67E4: @ 0x021E67E4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x54
	movs r1, #1
	bl FUN_0200E9BC
	adds r4, #0x54
	adds r0, r4, #0
	bl FUN_0201D8C8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov121_021E67E4

	thumb_func_start ov121_021E67FC
ov121_021E67FC: @ 0x021E67FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r1, _021E69EC @ =0x0000025E
	movs r0, #0x9e
	ldrb r2, [r4, r1]
	movs r1, #0x3c
	muls r1, r2, r1
	bl FUN_0201AA8C
	movs r2, #0x95
	lsls r2, r2, #2
	str r0, [r4, r2]
	ldr r0, [r4, r2]
	adds r2, #0xa
	ldrb r3, [r4, r2]
	movs r2, #0x3c
	movs r1, #0
	muls r2, r3, r2
	blx FUN_020D4994
	movs r1, #0x97
	lsls r1, r1, #2
	ldrb r1, [r4, r1]
	adds r0, r5, #0
	movs r2, #0x9e
	bl FUN_0202E9FC
	movs r1, #0x8e
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	adds r1, #0x26
	str r0, [sp, #0x10]
	ldrb r0, [r4, r1]
	cmp r0, #0
	bgt _021E684A
	b _021E69E8
_021E684A:
	ldr r0, [sp, #0x10]
	str r4, [sp, #8]
	str r0, [sp, #4]
	adds r5, r0, #0
_021E6852:
	movs r2, #0x8d
	lsls r2, r2, #2
	adds r1, r2, #0
	ldr r0, [r4, r2]
	adds r2, #0x29
	adds r1, #0x2b
	ldrb r3, [r4, r2]
	movs r2, #0xd
	ldrb r1, [r4, r1]
	muls r2, r3, r2
	adds r2, r1, r2
	ldr r1, [sp, #0x10]
	adds r1, r1, r2
	movs r2, #0x9e
	bl FUN_0202EA80
	movs r1, #0x8f
	movs r3, #0
	ldr r2, [sp, #8]
	lsls r1, r1, #2
	str r0, [r2, r1]
	adds r0, r2, #0
	ldr r0, [r0, r1]
	mov ip, r3
	str r0, [sp, #0xc]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E68BE
	subs r0, r1, #4
	ldr r0, [r4, r0]
	adds r3, r1, #0
	adds r2, r0, #4
	ldr r0, [sp, #4]
	adds r3, #0x18
	adds r2, r2, r0
	adds r0, r1, #0
	adds r0, #0x18
	ldr r0, [r4, r0]
	adds r0, r0, r5
	str r2, [r0, #4]
	adds r0, r1, #0
	adds r0, #0x18
	ldr r0, [r4, r0]
	movs r2, #1
	adds r0, r0, r5
	strh r2, [r0, #8]
	ldr r3, [r4, r3]
	movs r0, #0xff
	adds r3, r3, r5
	adds r1, #0x18
	strb r0, [r3, #0xa]
	ldr r0, [r4, r1]
	str r2, [r0, r5]
	b _021E69C8
_021E68BE:
	adds r2, r3, #0
	cmp r0, #0
	ble _021E6980
	ldr r0, [sp, #0xc]
	str r0, [sp]
	adds r7, r0, #4
_021E68CA:
	mov r0, ip
	cmp r0, #0
	bne _021E6944
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [sp, #4]
	adds r1, r1, r0
	ldr r6, [r1, #8]
	ldr r1, [sp]
	ldr r1, [r1, #8]
	cmp r6, r1
	blo _021E6944
	adds r6, r0, #4
	ldr r0, [sp, #4]
	lsls r1, r3, #3
	adds r0, r6, r0
	movs r6, #0x95
	lsls r6, r6, #2
	ldr r6, [r4, r6]
	adds r3, r3, #1
	adds r6, r5, r6
	adds r6, r1, r6
	str r0, [r6, #4]
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r0, r5, r0
	adds r6, r1, r0
	movs r0, #1
	strh r0, [r6, #8]
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	lsls r6, r3, #3
	adds r0, r5, r0
	adds r1, r1, r0
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r0, r5, r0
	adds r0, r6, r0
	str r7, [r0, #4]
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r0, r5, r0
	adds r1, r6, r0
	movs r0, #1
	strh r0, [r1, #8]
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r0, r5, r0
	adds r0, r6, r0
	strb r2, [r0, #0xa]
	movs r0, #1
	mov ip, r0
	b _021E696C
_021E6944:
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	lsls r6, r3, #3
	adds r0, r5, r0
	adds r0, r6, r0
	str r7, [r0, #4]
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r0, r5, r0
	adds r1, r6, r0
	movs r0, #1
	strh r0, [r1, #8]
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r0, r5, r0
	adds r0, r6, r0
	strb r2, [r0, #0xa]
_021E696C:
	ldr r0, [sp]
	adds r2, r2, #1
	adds r0, #0xc
	str r0, [sp]
	ldr r0, [sp, #0xc]
	adds r3, r3, #1
	ldr r0, [r0]
	adds r7, #0xc
	cmp r2, r0
	blt _021E68CA
_021E6980:
	mov r0, ip
	cmp r0, #0
	bne _021E69BA
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	lsls r2, r3, #3
	adds r3, r1, #4
	ldr r1, [sp, #4]
	adds r1, r3, r1
	adds r3, r0, #0
	adds r3, #0x1c
	ldr r3, [r4, r3]
	adds r3, r3, r5
	adds r3, r2, r3
	str r1, [r3, #4]
	adds r3, r0, #0
	adds r3, #0x1c
	ldr r3, [r4, r3]
	movs r1, #1
	adds r3, r3, r5
	adds r3, r2, r3
	strh r1, [r3, #8]
	adds r0, #0x1c
	ldr r0, [r4, r0]
	movs r1, #0xff
	adds r0, r0, r5
	adds r0, r2, r0
	strb r1, [r0, #0xa]
_021E69BA:
	ldr r0, [sp, #0xc]
	ldr r0, [r0]
	adds r1, r0, #1
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	str r1, [r0, r5]
_021E69C8:
	ldr r0, [sp, #8]
	adds r5, #0x3c
	adds r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	adds r0, #0xc
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	adds r0, r0, #1
	str r0, [sp, #0x10]
	ldr r0, _021E69EC @ =0x0000025E
	ldrb r1, [r4, r0]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	bge _021E69E8
	b _021E6852
_021E69E8:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E69EC: .4byte 0x0000025E
	thumb_func_end ov121_021E67FC

	thumb_func_start ov121_021E69F0
ov121_021E69F0: @ 0x021E69F0
	push {r4, r5, r6, lr}
	ldr r2, _021E6A48 @ =0x000001A5
	adds r6, r0, #0
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x9e
	bl FUN_0200BAF8
	str r0, [r6, #0x64]
	movs r0, #2
	movs r1, #0x4c
	movs r2, #0x9e
	bl FUN_0200BD18
	str r0, [r6, #0x68]
	movs r0, #0x4c
	movs r1, #0x9e
	bl FUN_02026354
	str r0, [r6, #0x6c]
	ldr r0, [r6, #0x64]
	movs r1, #0x2b
	bl FUN_0200BBA0
	str r0, [r6, #0x70]
	ldr r0, [r6, #0x64]
	movs r1, #0x2a
	bl FUN_0200BBA0
	str r0, [r6, #0x74]
	movs r4, #0
	adds r5, r6, #0
_021E6A30:
	adds r1, r4, #0
	ldr r0, [r6, #0x64]
	adds r1, #0x2c
	bl FUN_0200BBA0
	str r0, [r5, #0x78]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #7
	blt _021E6A30
	pop {r4, r5, r6, pc}
	nop
_021E6A48: .4byte 0x000001A5
	thumb_func_end ov121_021E69F0

	thumb_func_start ov121_021E6A4C
ov121_021E6A4C: @ 0x021E6A4C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_021E6A54:
	ldr r0, [r5, #0x78]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #7
	blt _021E6A54
	ldr r0, [r6, #0x70]
	bl FUN_02026380
	ldr r0, [r6, #0x74]
	bl FUN_02026380
	ldr r0, [r6, #0x6c]
	bl FUN_02026380
	ldr r0, [r6, #0x68]
	bl FUN_0200BDA0
	ldr r0, [r6, #0x64]
	bl FUN_0200BB44
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov121_021E6A4C

	thumb_func_start ov121_021E6A84
ov121_021E6A84: @ 0x021E6A84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	movs r2, #0x26
	lsls r2, r2, #4
	adds r1, r2, #0
	adds r4, r0, #0
	subs r1, #0xc
	ldr r1, [r4, r1]
	ldrb r0, [r4, r2]
	str r1, [sp, #0x20]
	movs r1, #0x3c
	muls r1, r0, r1
	str r1, [sp, #0x24]
	subs r1, r2, #4
	ldrb r1, [r4, r1]
	lsls r0, r0, #3
	lsls r2, r1, #2
	ldr r1, _021E6C4C @ =_021E7014
	ldr r1, [r1, r2]
	adds r0, r1, r0
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r0, #0x14
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #4
	movs r1, #0
	bl FUN_0201D978
	movs r0, #1
	str r0, [sp, #0x18]
	movs r0, #0
	adds r1, r0, #0
	ldr r2, _021E6C50 @ =0x00000261
	str r1, [sp, #0x1c]
	strb r1, [r4, r2]
	ldr r2, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x14]
	ldr r1, [r2, r1]
	cmp r1, #0
	bgt _021E6ADC
	b _021E6C04
_021E6ADC:
	ldr r1, [sp, #0x24]
	adds r7, r0, #0
	adds r1, r2, r1
	str r1, [sp, #0x2c]
	adds r1, r4, #0
	str r1, [sp, #0x28]
	adds r1, #0x14
	str r1, [sp, #0x28]
_021E6AEC:
	ldr r1, [sp, #0x2c]
	ldrh r1, [r1, #8]
	cmp r1, #0
	beq _021E6BEA
	ldr r1, [sp, #0x2c]
	ldr r1, [r1, #4]
	ldr r5, [r1, #4]
	ldr r1, [sp, #0x10]
	ldr r1, [r1]
	cmp r5, r1
	bls _021E6B04
	adds r5, r1, #0
_021E6B04:
	cmp r5, r0
	bge _021E6B0E
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
_021E6B0E:
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x68]
	ldr r2, [sp, #0x18]
	movs r1, #0
	movs r3, #1
	bl FUN_0200BFCC
	ldr r0, [r4, #0x68]
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x74]
	bl FUN_0200CBBC
	movs r1, #0
	str r7, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6C54 @ =0x00010200
	adds r3, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x6c]
	adds r0, r4, #4
	bl FUN_020200FC
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x2c]
	ldr r0, [r4, #0x68]
	ldr r2, [r2, #4]
	movs r1, #1
	ldr r2, [r2, #8]
	movs r3, #2
	bl FUN_0200BE3C
	ldr r0, [r4, #0x68]
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x70]
	bl FUN_0200CBBC
	movs r1, #0
	str r7, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6C54 @ =0x00010200
	adds r3, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	ldr r2, [r4, #0x6c]
	bl FUN_020200FC
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r3, [sp, #0x10]
	ldr r0, [r4, #0x68]
	ldrh r3, [r3, #4]
	movs r1, #0
	adds r2, r5, #0
	bl FUN_0200BFCC
	ldr r2, [sp, #0x10]
	ldr r0, [r4, #0x68]
	ldrh r2, [r2, #6]
	ldr r1, [r4, #0x6c]
	lsls r2, r2, #2
	adds r2, r4, r2
	subs r2, #0x38
	ldr r2, [r2]
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [r4, #0x6c]
	adds r2, r0, #0
	bl FUN_02002F30
	mov ip, r0
	str r7, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6C54 @ =0x00010200
	movs r3, #0xa0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	mov r6, ip
	ldr r0, [sp, #0x28]
	ldr r2, [r4, #0x6c]
	movs r1, #0
	subs r3, r3, r6
	bl FUN_020200FC
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	adds r2, r4, r0
	ldr r0, _021E6C58 @ =0x00000262
	adds r7, #0x10
	strb r1, [r2, r0]
	ldr r1, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r1, #1
	str r1, [sp, #0x14]
	cmp r1, #6
	bge _021E6C04
_021E6BEA:
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x20]
	adds r1, #8
	str r1, [sp, #0x2c]
	ldr r1, [sp, #0x1c]
	adds r1, r1, #1
	str r1, [sp, #0x1c]
	ldr r1, [sp, #0x24]
	ldr r2, [r2, r1]
	ldr r1, [sp, #0x1c]
	cmp r1, r2
	bge _021E6C04
	b _021E6AEC
_021E6C04:
	adds r0, r4, #0
	adds r0, #0x14
	bl FUN_0201D578
	adds r0, r4, #4
	bl FUN_0201D578
	ldr r1, _021E6C50 @ =0x00000261
	ldr r0, [sp, #0x14]
	strb r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0x30
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _021E6C46
	adds r0, r1, #0
	subs r0, #0x2f
	ldrsb r2, [r4, r0]
	ldrb r0, [r4, r1]
	cmp r2, r0
	blt _021E6C46
	cmp r2, #7
	bne _021E6C36
	bl FUN_0202551C
_021E6C36:
	ldr r0, _021E6C50 @ =0x00000261
	ldrb r1, [r4, r0]
	subs r0, #0x2f
	subs r1, r1, #1
	strb r1, [r4, r0]
	adds r0, r4, #0
	bl ov121_021E65D8
_021E6C46:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6C4C: .4byte _021E7014
_021E6C50: .4byte 0x00000261
_021E6C54: .4byte 0x00010200
_021E6C58: .4byte 0x00000262
	thumb_func_end ov121_021E6A84

	thumb_func_start ov121_021E6C5C
ov121_021E6C5C: @ 0x021E6C5C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x44
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r5, #0x64]
	movs r1, #0x28
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6CA0 @ =0x00030100
	movs r1, #4
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x44
	adds r2, r4, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r5, #0x44
	adds r0, r5, #0
	bl FUN_0201D578
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6CA0: .4byte 0x00030100
	thumb_func_end ov121_021E6C5C

	thumb_func_start ov121_021E6CA4
ov121_021E6CA4: @ 0x021E6CA4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x34
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r5, #0x64]
	movs r1, #0x29
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6CE8 @ =0x00030100
	movs r1, #4
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x34
	adds r2, r4, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r5, #0x34
	adds r0, r5, #0
	bl FUN_0201D578
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6CE8: .4byte 0x00030100
	thumb_func_end ov121_021E6CA4

	thumb_func_start ov121_021E6CEC
ov121_021E6CEC: @ 0x021E6CEC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _021E6D78 @ =0x00000232
	adds r5, r0, #0
	ldrsb r0, [r5, r1]
	movs r3, #0xc
	adds r2, r5, r0
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r4, [r2, r0]
	adds r0, r1, #0
	adds r1, #0x2e
	adds r0, #0x22
	ldr r2, [r5, r0]
	ldrb r1, [r5, r1]
	movs r0, #0x3c
	muls r0, r1, r0
	adds r6, r2, r0
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0x54
	adds r2, r1, #0
	bl FUN_0200E998
	adds r0, r5, #0
	adds r0, #0x54
	movs r1, #0xff
	bl FUN_0201D978
	movs r0, #1
	lsls r2, r4, #3
	str r0, [sp]
	movs r3, #2
	str r3, [sp, #4]
	adds r2, r6, r2
	ldr r2, [r2, #4]
	ldr r0, [r5, #0x68]
	ldr r2, [r2, #8]
	movs r1, #0
	bl FUN_0200BE3C
	ldr r0, [r5, #0x68]
	ldr r1, [r5, #0x64]
	movs r2, #0x31
	movs r3, #0x9e
	bl FUN_0200BC4C
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6D7C @ =0x00010200
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x54
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r5, #0x54
	adds r0, r5, #0
	bl FUN_0201D578
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E6D78: .4byte 0x00000232
_021E6D7C: .4byte 0x00010200
	thumb_func_end ov121_021E6CEC

	thumb_func_start ov121_021E6D80
ov121_021E6D80: @ 0x021E6D80
	push {r3, r4, r5, lr}
	sub sp, #0x10
	movs r1, #1
	adds r5, r0, #0
	adds r0, #0x54
	adds r2, r1, #0
	movs r3, #0xc
	bl FUN_0200E998
	adds r0, r5, #0
	adds r0, #0x54
	movs r1, #0xff
	bl FUN_0201D978
	ldr r0, [r5, #0x64]
	movs r1, #0x34
	bl FUN_0200BBA0
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6DD4 @ =0x00010200
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x54
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r5, #0x54
	adds r0, r5, #0
	bl FUN_0201D578
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E6DD4: .4byte 0x00010200
	thumb_func_end ov121_021E6D80

	thumb_func_start ov121_021E6DD8
ov121_021E6DD8: @ 0x021E6DD8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x24
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x97
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021E6DF4
	movs r1, #0x35
	b _021E6DF6
_021E6DF4:
	movs r1, #0x41
_021E6DF6:
	movs r0, #0x26
	lsls r0, r0, #4
	ldrb r0, [r4, r0]
	lsls r0, r0, #1
	adds r5, r1, r0
	ldr r0, [r4, #0x64]
	adds r1, r5, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [r4, #0x64]
	adds r1, r5, #1
	bl FUN_0200BBA0
	movs r1, #0
	adds r5, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6E64 @ =0x00010200
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x24
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6E64 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x24
	adds r2, r5, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, #0
	bl FUN_02026380
	adds r4, #0x24
	adds r0, r4, #0
	bl FUN_0201D578
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E6E64: .4byte 0x00010200
	thumb_func_end ov121_021E6DD8

	thumb_func_start ov121_021E6E68
ov121_021E6E68: @ 0x021E6E68
	push {r3, r4, r5, lr}
	sub sp, #0x10
	movs r1, #1
	adds r5, r0, #0
	adds r0, #0x54
	adds r2, r1, #0
	movs r3, #0xc
	bl FUN_0200E998
	adds r0, r5, #0
	adds r0, #0x54
	movs r1, #0xff
	bl FUN_0201D978
	ldr r0, [r5, #0x64]
	movs r1, #0x30
	bl FUN_0200BBA0
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6EBC @ =0x00010200
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x54
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r5, #0x54
	adds r0, r5, #0
	bl FUN_0201D578
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E6EBC: .4byte 0x00010200
	thumb_func_end ov121_021E6E68

	thumb_func_start ov121_021E6EC0
ov121_021E6EC0: @ 0x021E6EC0
	push {r4, r5, lr}
	sub sp, #0x14
	movs r2, #0x95
	lsls r2, r2, #2
	adds r3, r2, #0
	adds r4, r0, #0
	adds r3, #0xc
	ldrb r5, [r4, r3]
	movs r3, #0x3c
	ldr r1, [r4, r2]
	muls r3, r5, r3
	adds r1, r1, r3
	adds r3, r2, #0
	subs r3, #0x22
	ldrsb r3, [r4, r3]
	adds r1, r1, #4
	adds r5, r4, r3
	adds r3, r2, #0
	adds r3, #0xe
	ldrb r3, [r5, r3]
	lsls r3, r3, #3
	adds r3, r1, r3
	adds r1, r2, #4
	str r3, [r4, r1]
	ldr r1, [r4, r1]
	ldrb r1, [r1, #6]
	cmp r1, #0xff
	bne _021E6F0C
	movs r1, #3
	subs r2, #0x21
	strb r1, [r4, r2]
	bl ov121_021E6D80
	ldr r0, _021E6F50 @ =0x000005F2
	bl FUN_0200604C
	add sp, #0x14
	pop {r4, r5, pc}
_021E6F0C:
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, [r4]
	movs r1, #0x19
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x8f
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r1, [r0, #0x10]
	movs r1, #6
	strb r1, [r0, #0x11]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	add r1, sp, #0
	bl FUN_020166FC
	adds r0, r4, #0
	bl ov121_021E6CEC
	bl ov121_021E6F58
	ldr r0, _021E6F54 @ =0x00000233
	movs r1, #2
	strb r1, [r4, r0]
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_021E6F50: .4byte 0x000005F2
_021E6F54: .4byte 0x00000233
	thumb_func_end ov121_021E6EC0

	thumb_func_start ov121_021E6F58
ov121_021E6F58: @ 0x021E6F58
	movs r1, #0x1e
	adds r2, r1, #0
	ldr r3, _021E6F64 @ =FUN_020CF178
	ldr r0, _021E6F68 @ =0x04000050
	subs r2, #0x25
	bx r3
	.align 2, 0
_021E6F64: .4byte FUN_020CF178
_021E6F68: .4byte 0x04000050
	thumb_func_end ov121_021E6F58

	thumb_func_start ov121_021E6F6C
ov121_021E6F6C: @ 0x021E6F6C
	ldr r0, _021E6F74 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
_021E6F74: .4byte 0x04000050
	thumb_func_end ov121_021E6F6C

	thumb_func_start ov121_021E6F78
ov121_021E6F78: @ 0x021E6F78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _021E700C @ =0x0000025E
	ldrb r0, [r4, r0]
	cmp r0, #0
	ble _021E7008
	ldr r0, [sp, #4]
	str r0, [sp]
_021E6F8E:
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	ldr r0, [sp]
	movs r6, #0
	adds r1, r2, r0
	ldr r0, [r2, r0]
	adds r7, r6, #0
	cmp r0, #0
	ble _021E6FF2
	adds r5, r6, #0
_021E6FA4:
	adds r0, r1, #4
	adds r1, r0, r5
	ldrb r0, [r1, #6]
	mov ip, r0
	cmp r0, #0xff
	beq _021E6FDC
	ldrh r0, [r1, #4]
	cmp r0, #0
	bne _021E6FDC
	ldr r1, _021E7010 @ =0x0000025F
	movs r0, #0x8d
	ldrb r3, [r4, r1]
	subs r1, r1, #2
	ldrb r2, [r4, r1]
	movs r1, #0xd
	lsls r0, r0, #2
	muls r1, r2, r1
	adds r2, r3, r1
	ldr r1, [sp, #4]
	ldr r0, [r4, r0]
	adds r1, r1, r2
	mov r2, ip
	subs r2, r2, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl FUN_0202E544
	adds r6, r6, #1
_021E6FDC:
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [sp]
	ldr r2, [sp]
	adds r1, r1, r0
	ldr r0, [r2, r0]
	adds r7, r7, #1
	adds r5, #8
	cmp r7, r0
	blt _021E6FA4
_021E6FF2:
	ldr r0, [sp]
	adds r0, #0x3c
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r0, r0, #1
	str r0, [sp, #4]
	ldr r0, _021E700C @ =0x0000025E
	ldrb r1, [r4, r0]
	ldr r0, [sp, #4]
	cmp r0, r1
	blt _021E6F8E
_021E7008:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E700C: .4byte 0x0000025E
_021E7010: .4byte 0x0000025F
	thumb_func_end ov121_021E6F78

	.rodata

_021E7014:
	.byte 0x10, 0x71, 0x1E, 0x02, 0xC8, 0x70, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x04
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2F, 0x00
	.byte 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2F, 0x00, 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2E, 0x00
	.byte 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2F, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00, 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00, 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x2D, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00
	@ 0x021E7194
