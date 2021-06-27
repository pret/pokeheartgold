
	thumb_func_start ov37_021E5900
ov37_021E5900: @ 0x021E5900
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	ldr r1, [r5]
	adds r6, r0, #0
	cmp r1, #0
	beq _021E5916
	cmp r1, #1
	bne _021E5914
	b _021E5A56
_021E5914:
	b _021E5A64
_021E5916:
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
	movs r0, #3
	movs r1, #0x27
	lsls r2, r2, #6
	bl FUN_0201A910
	ldr r1, _021E5A74 @ =0x0000940C
	adds r0, r6, #0
	movs r2, #0x27
	bl FUN_02007280
	ldr r2, _021E5A74 @ =0x0000940C
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x27
	bl FUN_0201AC88
	str r0, [r4]
	movs r0, #0x27
	bl FUN_0200BD08
	str r0, [r4, #0xc]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xfc
	movs r3, #0x27
	bl FUN_0200BAF8
	str r0, [r4, #0x10]
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	bl ov37_021E5CF0
	ldr r0, [r4]
	bl ov37_021E5D10
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x27
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0x11
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	adds r0, r6, #0
	bl FUN_020072A4
	str r0, [r4, #8]
	movs r0, #0x4e
	movs r1, #0x27
	bl FUN_02007688
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov37_021E5F98
	bl FUN_020210BC
	movs r0, #2
	bl FUN_02021148
	ldr r0, _021E5A78 @ =ov37_021E5CC8
	ldr r1, [r4]
	bl FUN_0201A0FC
	adds r0, r4, #0
	bl ov37_021E5E30
	bl ov37_021E6090
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov37_021E60C0
	adds r0, r4, #0
	bl ov37_021E6244
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov37_021E6418
	movs r1, #0
	movs r0, #0x34
	adds r2, r1, #0
	bl FUN_02004EC4
	ldr r2, _021E5A7C @ =0x04000304
	ldr r0, _021E5A80 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	bl FUN_0208F814
	movs r0, #0
	movs r1, #1
	bl FUN_020398D4
	bl FUN_0203769C
	cmp r0, #0
	bne _021E5A30
	movs r0, #3
	bl FUN_02038C1C
_021E5A30:
	bl FUN_0203A880
	bl FUN_0203769C
	cmp r0, #0
	bne _021E5A48
	movs r0, #1
	bl FUN_0205A904
	movs r0, #1
	bl FUN_020356EC
_021E5A48:
	adds r0, r7, #0
	bl FUN_0200770C
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _021E5A64
_021E5A56:
	bl FUN_02007290
	movs r0, #0
	str r0, [r5]
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_021E5A64:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E5A6C: .4byte 0xFFFFE0FF
_021E5A70: .4byte 0x04001000
_021E5A74: .4byte 0x0000940C
_021E5A78: .4byte ov37_021E5CC8
_021E5A7C: .4byte 0x04000304
_021E5A80: .4byte 0xFFFF7FFF
	thumb_func_end ov37_021E5900

	thumb_func_start ov37_021E5A84
ov37_021E5A84: @ 0x021E5A84
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl FUN_0203769C
	cmp r0, #0
	bne _021E5AAA
	ldr r0, _021E5B80 @ =0x000093B4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5AAA
	bl FUN_02033250
	ldr r1, _021E5B80 @ =0x000093B4
	ldr r2, [r4, r1]
	ands r0, r2
	str r0, [r4, r1]
_021E5AAA:
	movs r0, #3
	ldr r1, [r5]
	lsls r0, r0, #8
	str r1, [r4, r0]
	ldr r1, [r5]
	adds r0, r4, #0
	bl ov37_021E784C
	ldr r1, [r5]
	cmp r1, #3
	bhi _021E5B74
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5ACC: @ jump table
	.2byte _021E5AD4 - _021E5ACC - 2 @ case 0
	.2byte _021E5B02 - _021E5ACC - 2 @ case 1
	.2byte _021E5B48 - _021E5ACC - 2 @ case 2
	.2byte _021E5B68 - _021E5ACC - 2 @ case 3
_021E5AD4:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5B74
	bl FUN_0203769C
	cmp r0, #0
	beq _021E5AFC
	bl ov37_021E75C4
	cmp r0, #2
	blt _021E5B74
	movs r1, #0
	movs r0, #0x80
	adds r2, r1, #0
	bl FUN_02037030
	movs r0, #1
	str r0, [r5]
	b _021E5B74
_021E5AFC:
	movs r0, #1
	str r0, [r5]
	b _021E5B74
_021E5B02:
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	lsls r2, r0, #3
	ldr r0, _021E5B84 @ =0x021E7D20
	ldr r2, [r0, r2]
	cmp r2, #0
	beq _021E5B18
	adds r0, r4, #0
	blx r2
	str r0, [r5]
_021E5B18:
	movs r0, #0x9e
	lsls r0, r0, #2
	ldr r2, _021E5B88 @ =0x000E0D0F
	adds r0, r4, r0
	movs r1, #0
	adds r3, r4, #0
	bl ov37_021E7478
	bl FUN_0203769C
	cmp r0, #0
	bne _021E5B3E
	adds r0, r4, #0
	bl ov37_021E76F0
	ldr r1, [r5]
	cmp r1, #1
	bne _021E5B3E
	str r0, [r5]
_021E5B3E:
	ldr r0, _021E5B8C @ =0x00004374
	adds r0, r4, r0
	bl ov37_021E741C
	b _021E5B74
_021E5B48:
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	lsls r3, r0, #3
	ldr r0, _021E5B84 @ =0x021E7D20
	ldr r2, [r0, r3]
	cmp r2, #0
	beq _021E5B74
	ldr r0, _021E5B90 @ =0x021E7D24
	ldr r0, [r0, r3]
	cmp r0, #0
	beq _021E5B74
	adds r0, r4, #0
	blx r2
	str r0, [r5]
	b _021E5B74
_021E5B68:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5B74
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5B74:
	ldr r0, [r4, #0x34]
	bl FUN_0202457C
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E5B80: .4byte 0x000093B4
_021E5B84: .4byte 0x021E7D20
_021E5B88: .4byte 0x000E0D0F
_021E5B8C: .4byte 0x00004374
_021E5B90: .4byte 0x021E7D24
	thumb_func_end ov37_021E5A84

	thumb_func_start ov37_021E5B94
ov37_021E5B94: @ 0x021E5B94
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	bl FUN_02007290
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_020072A4
	adds r5, r0, #0
	ldr r0, [r7]
	cmp r0, #3
	bls _021E5BB0
	b _021E5CBE
_021E5BB0:
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5BBC: @ jump table
	.2byte _021E5BC4 - _021E5BBC - 2 @ case 0
	.2byte _021E5C40 - _021E5BBC - 2 @ case 1
	.2byte _021E5C6E - _021E5BBC - 2 @ case 2
	.2byte _021E5C8E - _021E5BBC - 2 @ case 3
_021E5BC4:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	movs r4, #0
	adds r5, r6, #0
_021E5BF8:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E5BF8
	ldr r0, [r6, #0x34]
	bl FUN_02024504
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	adds r0, r6, #0
	bl ov37_021E6540
	ldr r0, [r6]
	bl ov37_021E5F5C
	bl FUN_02021238
	ldr r0, [r6, #0x10]
	bl FUN_0200BB44
	ldr r0, [r6, #0xc]
	bl FUN_0200BDA0
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _021E5CBE
_021E5C40:
	movs r0, #1
	bl FUN_02038C1C
	bl FUN_02037FF0
	ldr r0, [r5]
	bl FUN_0205AD24
	ldr r2, _021E5CC4 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	bl FUN_0205A904
	movs r0, #0
	bl FUN_020356EC
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _021E5CBE
_021E5C6E:
	movs r1, #0x25
	lsls r1, r1, #0xa
	ldr r1, [r6, r1]
	cmp r1, #0
	beq _021E5C88
	bl FUN_02033250
	cmp r0, #1
	bne _021E5CBE
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _021E5CBE
_021E5C88:
	adds r0, r0, #1
	str r0, [r7]
	b _021E5CBE
_021E5C8E:
	movs r0, #2
	bl FUN_02038C1C
	adds r0, r6, #0
	bl ov37_021E5F20
	ldr r0, [r6, #8]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_02007294
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x27
	bl FUN_0201A9C4
	movs r0, #2
	bl FUN_02038C1C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E5CBE:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5CC4: .4byte 0x04000304
	thumb_func_end ov37_021E5B94

	thumb_func_start ov37_021E5CC8
ov37_021E5CC8: @ 0x021E5CC8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0202061C
	bl FUN_0200B224
	adds r0, r4, #0
	bl FUN_0201EEB4
	ldr r3, _021E5CE8 @ =0x027E0000
	ldr r1, _021E5CEC @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E5CE8: .4byte 0x027E0000
_021E5CEC: .4byte 0x00003FF8
	thumb_func_end ov37_021E5CC8

	thumb_func_start ov37_021E5CF0
ov37_021E5CF0: @ 0x021E5CF0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5D0C @ =0x021E7A24
	add r3, sp, #0
	movs r2, #5
_021E5CFA:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5CFA
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E5D0C: .4byte 0x021E7A24
	thumb_func_end ov37_021E5CF0

	thumb_func_start ov37_021E5D10
ov37_021E5D10: @ 0x021E5D10
	push {r4, r5, lr}
	sub sp, #0x9c
	ldr r5, _021E5E18 @ =0x021E7978
	add r3, sp, #0x8c
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E5E1C @ =0x021E7998
	add r3, sp, #0x70
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
	ldr r5, _021E5E20 @ =0x021E79D0
	add r3, sp, #0x54
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
	ldr r5, _021E5E24 @ =0x021E79EC
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
	ldr r5, _021E5E28 @ =0x021E7A08
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
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _021E5E2C @ =0x021E79B4
	add r3, sp, #0
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	adds r0, r4, #0
	movs r1, #5
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x27
	bl FUN_0201C1C4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x27
	bl FUN_0201C1C4
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x27
	bl FUN_0201C1C4
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x27
	bl FUN_0201C1C4
	add sp, #0x9c
	pop {r4, r5, pc}
	nop
_021E5E18: .4byte 0x021E7978
_021E5E1C: .4byte 0x021E7998
_021E5E20: .4byte 0x021E79D0
_021E5E24: .4byte 0x021E79EC
_021E5E28: .4byte 0x021E7A08
_021E5E2C: .4byte 0x021E79B4
	thumb_func_end ov37_021E5D10

	thumb_func_start ov37_021E5E30
ov37_021E5E30: @ 0x021E5E30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E5F04 @ =0x0000438A
	adds r6, r7, #0
	adds r4, r7, r0
	movs r0, #0x38
	adds r5, r7, #0
	str r0, [sp, #4]
_021E5E46:
	movs r0, #8
	movs r1, #0x27
	bl FUN_02026354
	str r0, [r6, #0x14]
	ldrb r1, [r4]
	ldr r0, [sp, #4]
	bics r1, r0
	strb r1, [r4]
	ldr r0, _021E5F08 @ =0x000043B6
	movs r1, #0
	strh r1, [r6, r0]
	movs r0, #0xcd
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r0, #4
	str r1, [r5, r0]
	ldr r0, [sp]
	adds r6, r6, #4
	adds r0, r0, #1
	adds r4, #0xa
	adds r5, #8
	str r0, [sp]
	cmp r0, #5
	blt _021E5E46
	movs r0, #0xa
	movs r1, #0x27
	bl FUN_02026354
	str r0, [r7, #0x28]
	movs r0, #0x50
	movs r1, #0x27
	bl FUN_02026354
	str r0, [r7, #0x2c]
	ldr r0, _021E5F0C @ =0x00004376
	movs r2, #0
	strb r2, [r7, r0]
	movs r1, #1
	adds r0, r0, #1
	strb r1, [r7, r0]
	ldr r0, _021E5F10 @ =0x000093F4
	str r1, [r7, r0]
	adds r0, r0, #4
	str r2, [r7, r0]
	movs r0, #0xc6
	movs r1, #2
	lsls r0, r0, #2
	str r1, [r7, r0]
	bl FUN_02033250
	movs r1, #0xc7
	lsls r1, r1, #2
	str r0, [r7, r1]
	ldr r2, _021E5F14 @ =0x000093FC
	movs r3, #0
	str r3, [r7, r2]
	adds r0, r2, #4
	str r3, [r7, r0]
	adds r0, r2, #0
	subs r1, #0x18
	str r3, [r7, r1]
	adds r0, #8
	str r3, [r7, r0]
	adds r2, #0xc
	str r3, [r7, r2]
	bl FUN_0203769C
	adds r0, r7, #0
	movs r1, #4
	bl ov37_021E7844
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x28]
	movs r1, #7
	bl FUN_0200BB6C
	movs r1, #0xf
	movs r0, #0x27
	lsls r1, r1, #0xa
	bl FUN_0201AA8C
	ldr r1, _021E5F18 @ =0x000043C8
	str r0, [r7, r1]
	movs r0, #0x27
	bl FUN_0201660C
	ldr r1, _021E5F1C @ =0x000093F0
	str r0, [r7, r1]
	movs r0, #0xc5
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r7, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E5F04: .4byte 0x0000438A
_021E5F08: .4byte 0x000043B6
_021E5F0C: .4byte 0x00004376
_021E5F10: .4byte 0x000093F4
_021E5F14: .4byte 0x000093FC
_021E5F18: .4byte 0x000043C8
_021E5F1C: .4byte 0x000093F0
	thumb_func_end ov37_021E5E30

	thumb_func_start ov37_021E5F20
ov37_021E5F20: @ 0x021E5F20
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _021E5F54 @ =0x000043C8
	ldr r0, [r6, r0]
	bl FUN_0201AB0C
	ldr r0, _021E5F58 @ =0x000093F0
	ldr r0, [r6, r0]
	bl FUN_02016624
	movs r4, #0
	adds r5, r6, #0
_021E5F38:
	ldr r0, [r5, #0x14]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #5
	blt _021E5F38
	ldr r0, [r6, #0x2c]
	bl FUN_02026380
	ldr r0, [r6, #0x28]
	bl FUN_02026380
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E5F54: .4byte 0x000043C8
_021E5F58: .4byte 0x000093F0
	thumb_func_end ov37_021E5F20

	thumb_func_start ov37_021E5F5C
ov37_021E5F5C: @ 0x021E5F5C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
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
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201BB4C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov37_021E5F5C

	thumb_func_start ov37_021E5F98
ov37_021E5F98: @ 0x021E5F98
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r4, [r6]
	movs r0, #0x40
	adds r5, r1, #0
	movs r1, #0
	str r0, [sp]
	movs r0, #0x27
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02007B8C
	movs r0, #0x40
	str r0, [sp]
	movs r0, #0x27
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x27
	bl FUN_0200304C
	movs r1, #0x1a
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #0x27
	bl FUN_0200304C
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x27
	movs r1, #2
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r1, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x27
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #4
	adds r2, r4, #0
	movs r3, #2
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x27
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #3
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x27
	movs r1, #5
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r1, #0
	bl FUN_02007B68
	ldr r0, [r6, #8]
	ldr r0, [r0, #4]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x27
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0xa
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	movs r0, #0x27
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E3DC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov37_021E5F98

	thumb_func_start ov37_021E6090
ov37_021E6090: @ 0x021E6090
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E60BC @ =0x021E7988
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_020215A0
	movs r0, #0x14
	movs r1, #0x27
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E60BC: .4byte 0x021E7988
	thumb_func_end ov37_021E6090

	thumb_func_start ov37_021E60C0
ov37_021E60C0: @ 0x021E60C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r7, r1, #0
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x27
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	adds r1, r5, #0
	movs r0, #0x35
	adds r1, #0x38
	movs r2, #0x27
	bl FUN_02009F40
	str r0, [r5, #0x34]
	adds r0, r5, #0
	movs r2, #1
	adds r0, #0x38
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r6, #0
	adds r4, r5, #0
_021E6104:
	movs r0, #2
	adds r1, r6, #0
	movs r2, #0x27
	bl FUN_0200A090
	movs r1, #0x16
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _021E6104
	movs r0, #0
	str r0, [sp]
	movs r3, #1
	str r3, [sp, #4]
	movs r0, #0x27
	str r0, [sp, #8]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	adds r1, r7, #0
	movs r2, #6
	bl FUN_0200A3C8
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r2, #0
	str r2, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #7
	str r0, [sp, #8]
	movs r0, #0x27
	subs r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	adds r3, r2, #0
	bl FUN_0200A480
	movs r1, #0x5d
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x27
	subs r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r2, #7
	movs r3, #1
	bl FUN_0200A540
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x27
	subs r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r2, #8
	movs r3, #1
	bl FUN_0200A540
	movs r1, #0x5f
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r3, #1
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x27
	subs r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r2, #6
	bl FUN_0200A3C8
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0x27
	movs r2, #0
	subs r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	adds r3, r2, #0
	bl FUN_0200A480
	movs r1, #0x61
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r3, #1
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x27
	subs r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r2, #7
	bl FUN_0200A540
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r3, #1
	str r3, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x27
	subs r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r2, #8
	bl FUN_0200A540
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0x1c
	ldr r0, [r5, r1]
	bl FUN_0200ACF0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0200ACF0
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov37_021E60C0

	thumb_func_start ov37_021E6244
ov37_021E6244: @ 0x021E6244
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	movs r1, #0
	adds r5, r0, #0
	str r1, [sp]
	subs r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r2, #0x16
	str r1, [sp, #0x10]
	lsls r2, r2, #4
	ldr r0, [r5, r2]
	adds r3, r1, #0
	str r0, [sp, #0x14]
	adds r0, r2, #4
	ldr r0, [r5, r0]
	str r0, [sp, #0x18]
	adds r0, r2, #0
	adds r0, #8
	ldr r0, [r5, r0]
	str r0, [sp, #0x1c]
	adds r0, r2, #0
	adds r0, #0xc
	ldr r0, [r5, r0]
	adds r2, #0x30
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	adds r0, r5, r2
	adds r2, r1, #0
	str r1, [sp, #0x28]
	bl FUN_02009D48
	movs r1, #1
	movs r3, #0x16
	str r1, [sp]
	subs r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsls r3, r3, #4
	ldr r2, [r5, r3]
	str r2, [sp, #0x14]
	adds r2, r3, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	adds r2, r3, #0
	adds r2, #8
	ldr r2, [r5, r2]
	str r2, [sp, #0x1c]
	adds r2, r3, #0
	adds r2, #0xc
	ldr r2, [r5, r2]
	adds r3, #0x54
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r5, r3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02009D48
	ldr r0, [r5, #0x34]
	movs r6, #0
	str r0, [sp, #0x34]
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r5, r0
	str r0, [sp, #0x38]
	movs r0, #1
	lsls r0, r0, #0xc
	str r6, [sp, #0x44]
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	str r0, [sp, #0x50]
	add r0, sp, #0x34
	strh r6, [r0, #0x20]
	movs r0, #1
	str r0, [sp, #0x58]
	str r0, [sp, #0x5c]
	movs r0, #0x27
	str r0, [sp, #0x60]
	movs r0, #0x6d
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r7, #0x18
	adds r4, r5, #0
	str r0, [sp, #0x2c]
_021E62F8:
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x38]
	lsls r0, r7, #0xc
	str r0, [sp, #0x3c]
	movs r0, #1
	lsls r0, r0, #0x12
	str r0, [sp, #0x40]
	movs r0, #2
	str r0, [sp, #0x5c]
	add r0, sp, #0x34
	bl FUN_02024624
	movs r1, #0x76
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x76
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r6, #0
	bl FUN_020248F0
	movs r0, #0x76
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r6, r6, #1
	adds r7, #0x28
	adds r4, r4, #4
	cmp r6, #5
	blt _021E62F8
	movs r0, #0x6d
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r6, _021E6414 @ =0x021E7A80
	movs r7, #0
	adds r4, r5, #0
	str r0, [sp, #0x30]
_021E6350:
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x38]
	ldrh r0, [r6]
	lsls r0, r0, #0xc
	str r0, [sp, #0x3c]
	ldrh r0, [r6, #2]
	lsls r0, r0, #0xc
	str r0, [sp, #0x40]
	add r0, sp, #0x34
	bl FUN_02024624
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x92
	lsls r0, r0, #2
	ldrh r1, [r6, #4]
	ldr r0, [r4, r0]
	bl FUN_020248F0
	cmp r7, #8
	blt _021E6392
	movs r0, #0x92
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_02024A04
_021E6392:
	adds r7, r7, #1
	adds r6, r6, #6
	adds r4, r4, #4
	cmp r7, #0xc
	blt _021E6350
	movs r0, #0x92
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	bl FUN_020248F0
	movs r7, #6
	movs r6, #0
	movs r4, #0x20
	lsls r7, r7, #0xe
_021E63B0:
	movs r0, #1
	lsls r1, r4, #0xc
	lsls r0, r0, #0x14
	adds r0, r1, r0
	str r0, [sp, #0x40]
	add r0, sp, #0x34
	str r7, [sp, #0x3c]
	bl FUN_02024624
	movs r1, #0x21
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x21
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_020248F0
	movs r0, #0x21
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024ADC
	movs r0, #0x21
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	adds r6, r6, #1
	adds r4, #0x20
	adds r5, r5, #4
	cmp r6, #5
	blt _021E63B0
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E6414: .4byte 0x021E7A80
	thumb_func_end ov37_021E6244

	thumb_func_start ov37_021E6418
ov37_021E6418: @ 0x021E6418
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x28
	movs r1, #0xb6
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r0, [r7]
	adds r1, r7, r1
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r0, r7, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #2
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0
	movs r2, #1
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	movs r1, #0xb2
	lsls r1, r1, #2
	ldr r0, [r7]
	adds r1, r7, r1
	adds r3, r2, #0
	bl FUN_0201D40C
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r0, r7, r0
	movs r1, #2
	bl FUN_0201D978
	movs r0, #0x15
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _021E6534 @ =0x000001C3
	movs r1, #0xba
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r0, [r7]
	adds r1, r7, r1
	movs r2, #1
	movs r3, #0x19
	bl FUN_0201D40C
	movs r0, #0xba
	lsls r0, r0, #2
	adds r0, r7, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r1, [r7, #0x28]
	movs r0, #1
	movs r2, #0
	movs r3, #0x30
	bl FUN_020030A0
	adds r3, r0, #0
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E6538 @ =0x00070100
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0xba
	lsls r0, r0, #2
	ldr r2, [r7, #0x28]
	adds r0, r7, r0
	movs r1, #1
	adds r3, r3, #2
	bl FUN_020200FC
	movs r0, #0
	str r0, [sp, #0x14]
	movs r0, #0x9e
	lsls r0, r0, #2
	movs r6, #1
	movs r4, #3
	adds r5, r7, r0
_021E64E4:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [r7]
	adds r1, r5, #0
	movs r2, #4
	movs r3, #5
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x14]
	adds r6, #0x14
	adds r0, r0, #1
	adds r4, r4, #4
	adds r5, #0x10
	str r0, [sp, #0x14]
	cmp r0, #5
	blt _021E64E4
	movs r0, #0x9e
	lsls r0, r0, #2
	ldr r2, _021E653C @ =0x000E0D0F
	adds r0, r7, r0
	movs r1, #0
	adds r3, r7, #0
	bl ov37_021E7478
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6534: .4byte 0x000001C3
_021E6538: .4byte 0x00070100
_021E653C: .4byte 0x000E0D0F
	thumb_func_end ov37_021E6418

	thumb_func_start ov37_021E6540
ov37_021E6540: @ 0x021E6540
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x9e
	lsls r0, r0, #2
	movs r4, #0
	adds r5, r6, r0
_021E654C:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #5
	blt _021E654C
	movs r0, #0xba
	lsls r0, r0, #2
	adds r0, r6, r0
	bl FUN_0201D520
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r0, r6, r0
	bl FUN_0201D520
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r0, r6, r0
	bl FUN_0201D520
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov37_021E6540

	thumb_func_start ov37_021E657C
ov37_021E657C: @ 0x021E657C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	ble _021E659A
	lsls r0, r1, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E65A8
_021E659A:
	lsls r0, r1, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E65A8:
	blx FUN_020F2104
	subs r5, #8
	str r0, [sp]
	cmp r5, #0
	ble _021E65C6
	lsls r0, r5, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E65D4
_021E65C6:
	lsls r0, r5, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E65D4:
	blx FUN_020F2104
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov37_021E657C

	thumb_func_start ov37_021E65EC
ov37_021E65EC: @ 0x021E65EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _021E67E8 @ =0x021E7A4C
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	str r0, [sp, #8]
	cmp r0, r1
	beq _021E663A
	cmp r0, #0xb
	bhi _021E663A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E6616: @ jump table
	.2byte _021E662E - _021E6616 - 2 @ case 0
	.2byte _021E662E - _021E6616 - 2 @ case 1
	.2byte _021E662E - _021E6616 - 2 @ case 2
	.2byte _021E662E - _021E6616 - 2 @ case 3
	.2byte _021E662E - _021E6616 - 2 @ case 4
	.2byte _021E662E - _021E6616 - 2 @ case 5
	.2byte _021E662E - _021E6616 - 2 @ case 6
	.2byte _021E662E - _021E6616 - 2 @ case 7
	.2byte _021E6656 - _021E6616 - 2 @ case 8
	.2byte _021E66FA - _021E6616 - 2 @ case 9
	.2byte _021E66FA - _021E6616 - 2 @ case 10
	.2byte _021E66FA - _021E6616 - 2 @ case 11
_021E662E:
	ldr r2, _021E67EC @ =0x00004376
	ldr r0, [sp]
	ldrb r1, [r0, r2]
	ldr r0, [sp, #8]
	cmp r1, r0
	bne _021E663C
_021E663A:
	b _021E6752
_021E663C:
	adds r1, r0, #0
	ldr r0, [sp]
	strb r1, [r0, r2]
	movs r1, #0x92
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [sp, #8]
	bl ov37_021E6818
	ldr r0, _021E67F0 @ =0x000005DC
	bl FUN_0200604C
	b _021E6752
_021E6656:
	movs r1, #0xc1
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	cmp r0, #4
	bne _021E6752
	bl FUN_0203769C
	cmp r0, #0
	bne _021E66BC
	bl FUN_02033250
	movs r2, #0xc7
	ldr r1, [sp]
	lsls r2, r2, #2
	ldr r1, [r1, r2]
	cmp r1, r0
	beq _021E6682
	ldr r0, _021E67F4 @ =0x000005F2
	bl FUN_0200604C
	b _021E6752
_021E6682:
	bl FUN_02037454
	bl FUN_02038C1C
	ldr r1, _021E67F8 @ =0x000093F4
	ldr r0, [sp]
	movs r2, #2
	str r2, [r0, r1]
	movs r1, #1
	adds r2, r1, #0
	bl ov37_021E762C
	ldr r0, [sp]
	movs r1, #5
	bl ov37_021E7844
	movs r1, #0x92
	ldr r0, [sp]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #1
	bl ov37_021E6848
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _021E67F0 @ =0x000005DC
	bl FUN_0200604C
	b _021E6752
_021E66BC:
	ldr r1, _021E67FC @ =0x0000438B
	ldr r0, [sp]
	ldrb r0, [r0, r1]
	cmp r0, #2
	bne _021E66CE
	ldr r0, _021E67F4 @ =0x000005F2
	bl FUN_0200604C
	b _021E6752
_021E66CE:
	movs r1, #1
	ldr r0, [sp]
	adds r2, r1, #0
	bl ov37_021E762C
	ldr r0, [sp]
	movs r1, #5
	bl ov37_021E7844
	movs r1, #0x92
	ldr r0, [sp]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #1
	bl ov37_021E6848
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _021E67F0 @ =0x000005DC
	bl FUN_0200604C
	b _021E6752
_021E66FA:
	ldr r0, [sp, #8]
	ldr r5, [sp]
	str r0, [sp, #0xc]
	subs r0, #9
	movs r4, #0
	movs r7, #0x1e
	movs r6, #0x1d
	str r0, [sp, #0xc]
_021E670A:
	ldr r0, [sp, #0xc]
	cmp r0, r4
	bne _021E671E
	movs r0, #0x9b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_020248F0
	b _021E672A
_021E671E:
	movs r0, #0x9b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_020248F0
_021E672A:
	adds r4, r4, #1
	adds r7, r7, #2
	adds r5, r5, #4
	adds r6, r6, #2
	cmp r4, #3
	blt _021E670A
	ldr r2, _021E6800 @ =0x00004377
	ldr r0, [sp]
	ldrb r1, [r0, r2]
	ldr r0, [sp, #8]
	subs r0, #9
	str r0, [sp, #8]
	cmp r1, r0
	beq _021E6752
	adds r1, r0, #0
	ldr r0, [sp]
	strb r1, [r0, r2]
	ldr r0, _021E6804 @ =0x000005E5
	bl FUN_0200604C
_021E6752:
	ldr r0, _021E6808 @ =0x021E7970
	bl FUN_02025204
	adds r4, r0, #0
	bl FUN_0203769C
	lsls r1, r0, #2
	ldr r0, [sp]
	adds r1, r0, r1
	movs r0, #0x76
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _021E67A8
	bl FUN_0203769C
	lsls r1, r0, #2
	ldr r0, [sp]
	ldr r2, _021E680C @ =0x021D114C
	adds r1, r0, r1
	movs r0, #0x76
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl ov37_021E657C
	bl FUN_0203769C
	lsls r1, r0, #2
	ldr r0, [sp]
	adds r1, r0, r1
	movs r0, #0x76
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
_021E67A8:
	add r0, sp, #0x10
	movs r1, #4
	movs r2, #0x40
	bl FUN_02021280
	cmp r0, #1
	bne _021E67E2
	ldr r3, _021E6810 @ =0x00004378
	ldr r0, [sp]
	ldr r2, [sp]
	subs r4, r3, #2
	ldrb r2, [r2, r4]
	adds r0, r0, r3
	subs r4, r3, #1
	ldr r3, [sp]
	add r1, sp, #0x10
	ldrb r3, [r3, r4]
	bl ov37_021E78E0
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _021E67E2
	ldr r1, _021E6814 @ =0x00004380
	ldr r0, [sp]
	ldrb r2, [r0, r1]
	movs r0, #0x38
	bics r2, r0
	ldr r0, [sp]
	strb r2, [r0, r1]
_021E67E2:
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	nop
_021E67E8: .4byte 0x021E7A4C
_021E67EC: .4byte 0x00004376
_021E67F0: .4byte 0x000005DC
_021E67F4: .4byte 0x000005F2
_021E67F8: .4byte 0x000093F4
_021E67FC: .4byte 0x0000438B
_021E6800: .4byte 0x00004377
_021E6804: .4byte 0x000005E5
_021E6808: .4byte 0x021E7970
_021E680C: .4byte 0x021D114C
_021E6810: .4byte 0x00004378
_021E6814: .4byte 0x00004380
	thumb_func_end ov37_021E65EC

	thumb_func_start ov37_021E6818
ov37_021E6818: @ 0x021E6818
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _021E6844 @ =0x021E7A80
	adds r5, r0, #0
	adds r7, r1, #0
	movs r6, #0
_021E6822:
	cmp r6, r7
	ldr r0, [r5]
	bne _021E6832
	ldrh r1, [r4, #4]
	adds r1, r1, #1
	bl FUN_020248F0
	b _021E6838
_021E6832:
	ldrh r1, [r4, #4]
	bl FUN_020248F0
_021E6838:
	adds r6, r6, #1
	adds r4, r4, #6
	adds r5, r5, #4
	cmp r6, #8
	blt _021E6822
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6844: .4byte 0x021E7A80
	thumb_func_end ov37_021E6818

	thumb_func_start ov37_021E6848
ov37_021E6848: @ 0x021E6848
	push {r3, lr}
	cmp r1, #1
	ldr r0, [r0, #0x20]
	bne _021E6858
	movs r1, #0x16
	bl FUN_020248F0
	pop {r3, pc}
_021E6858:
	movs r1, #0x15
	bl FUN_020248F0
	pop {r3, pc}
	thumb_func_end ov37_021E6848

	thumb_func_start ov37_021E6860
ov37_021E6860: @ 0x021E6860
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov37_021E65EC
	bl FUN_0203769C
	cmp r0, #0
	bne _021E6882
	bl ov37_021E745C
	cmp r0, #1
	beq _021E6888
	adds r0, r5, #0
	bl ov37_021E755C
	b _021E6888
_021E6882:
	adds r0, r5, #0
	bl ov37_021E755C
_021E6888:
	adds r0, r5, #0
	bl ov37_021E73B4
	ldr r2, _021E68A8 @ =0x00004382
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r5, r2
	adds r2, #0x32
	adds r0, r5, r0
	adds r2, r5, r2
	movs r3, #1
	bl ov37_021E72E8
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E68A8: .4byte 0x00004382
	thumb_func_end ov37_021E6860

	thumb_func_start ov37_021E68AC
ov37_021E68AC: @ 0x021E68AC
	push {r4, lr}
	adds r4, r0, #0
	bl ov37_021E73B4
	ldr r2, _021E68CC @ =0x00004382
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r4, r2
	adds r2, #0x32
	adds r0, r4, r0
	adds r2, r4, r2
	movs r3, #0
	bl ov37_021E72E8
	pop {r4, pc}
	nop
_021E68CC: .4byte 0x00004382
	thumb_func_end ov37_021E68AC

	thumb_func_start ov37_021E68D0
ov37_021E68D0: @ 0x021E68D0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0203769C
	movs r1, #0x32
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	cmp r1, r0
	bne _021E68F0
	adds r0, r5, #0
	movs r1, #0xd
	movs r2, #0
	bl ov37_021E762C
	b _021E68FA
_021E68F0:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov37_021E762C
_021E68FA:
	adds r0, r5, #0
	movs r1, #2
	bl ov37_021E7844
	ldr r0, _021E6920 @ =0x000005E4
	bl FUN_0200604C
	movs r1, #0xe
	adds r2, r1, #0
	ldr r0, _021E6924 @ =0x04000050
	subs r2, #0x14
	blx FUN_020CF178
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6920: .4byte 0x000005E4
_021E6924: .4byte 0x04000050
	thumb_func_end ov37_021E68D0

	thumb_func_start ov37_021E6928
ov37_021E6928: @ 0x021E6928
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	movs r6, #0x76
	adds r5, r0, #0
	str r1, [sp]
	adds r7, r4, #0
	lsls r6, r6, #2
_021E6936:
	ldr r0, [r5, r6]
	adds r1, r7, #0
	bl FUN_02024830
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #5
	blt _021E6936
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov37_021E6928

	thumb_func_start ov37_021E694C
ov37_021E694C: @ 0x021E694C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, _021E6978 @ =0x04000050
	movs r2, #0
	strh r2, [r1]
	adds r5, r0, #0
	movs r1, #1
	bl ov37_021E76D0
	adds r0, r5, #0
	movs r1, #4
	bl ov37_021E7844
	adds r0, r5, #0
	bl ov37_021E68AC
	ldr r0, _021E697C @ =0x00009404
	movs r1, #0
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6978: .4byte 0x04000050
_021E697C: .4byte 0x00009404
	thumb_func_end ov37_021E694C

	thumb_func_start ov37_021E6980
ov37_021E6980: @ 0x021E6980
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r4, r1, #0
	bl ov37_021E76A0
	cmp r0, #0
	beq _021E69D0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, [r5]
	movs r1, #0xb4
	str r0, [sp]
	movs r0, #0
	str r1, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	str r0, [sp, #4]
	movs r2, #0x19
	add r1, sp, #0
	strb r2, [r1, #0x10]
	movs r2, #6
	strb r2, [r1, #0x11]
	strb r0, [r1, #0x13]
	adds r0, r5, #0
	add r1, sp, #0
	bl ov37_021E7880
	cmp r0, #0
	bne _021E69C8
	bl GF_AssertFail
_021E69C8:
	adds r0, r5, #0
	movs r1, #6
	bl ov37_021E7844
_021E69D0:
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov37_021E6980

	thumb_func_start ov37_021E69DC
ov37_021E69DC: @ 0x021E69DC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r1, _021E6B28 @ =0x00004380
	movs r0, #0x38
	ldrb r2, [r5, r1]
	bics r2, r0
	strb r2, [r5, r1]
	adds r1, #0xb
	ldrb r0, [r5, r1]
	cmp r0, #2
	bne _021E6A1A
	bl FUN_0203769C
	cmp r0, #0
	beq _021E6A1A
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r5, #0
	bl ov37_021E78C4
	cmp r0, #0
	beq _021E6A14
	ldr r0, _021E6B2C @ =0x000005F2
	bl FUN_0200604C
_021E6A14:
	add sp, #4
	adds r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_021E6A1A:
	bl FUN_0203769C
	cmp r0, #0
	bne _021E6A36
	ldr r0, _021E6B30 @ =0x000093B4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6A36
	adds r0, r5, #0
	bl ov37_021E68AC
	add sp, #4
	adds r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_021E6A36:
	bl ov37_021E75C4
	adds r4, r0, #0
	bl FUN_02037454
	cmp r4, r0
	beq _021E6A50
	adds r0, r5, #0
	bl ov37_021E68AC
	add sp, #4
	adds r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_021E6A50:
	ldr r0, _021E6B34 @ =0x000093F0
	ldr r0, [r5, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021E6A62
	cmp r0, #2
	beq _021E6AD2
	b _021E6B1A
_021E6A62:
	bl FUN_0203769C
	cmp r0, #0
	bne _021E6A7E
	adds r0, r5, #0
	movs r1, #0xd
	bl ov37_021E7844
	adds r0, r5, #0
	movs r1, #4
	movs r2, #1
	bl ov37_021E762C
	b _021E6AC0
_021E6A7E:
	add r0, sp, #0
	movs r1, #0
	movs r2, #4
	blx FUN_020D4994
	movs r1, #0
	add r0, sp, #0
	strb r1, [r0, #2]
	bl FUN_0203769C
	add r1, sp, #0
	strb r0, [r1]
	ldr r0, _021E6B38 @ =0x000093BC
	movs r1, #1
	strb r1, [r5, r0]
	movs r1, #0
	subs r0, r0, #2
	strh r1, [r5, r0]
	adds r0, r5, #0
	movs r1, #7
	bl ov37_021E7844
	movs r0, #0x7e
	add r1, sp, #0
	movs r2, #4
	bl FUN_02037030
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #1
	bl FUN_0200E9BC
_021E6AC0:
	adds r0, r5, #0
	bl ov37_021E78A4
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D578
	b _021E6B1A
_021E6AD2:
	adds r0, r5, #0
	movs r1, #4
	bl ov37_021E7844
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl ov37_021E6848
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, #0
	bl ov37_021E78A4
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D578
	bl FUN_0203769C
	cmp r0, #0
	bne _021E6B1A
	bl FUN_02037454
	adds r0, r0, #1
	bl FUN_02038C1C
	ldr r0, _021E6B3C @ =0x000093F4
	movs r1, #1
	str r1, [r5, r0]
_021E6B1A:
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r6, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E6B28: .4byte 0x00004380
_021E6B2C: .4byte 0x000005F2
_021E6B30: .4byte 0x000093B4
_021E6B34: .4byte 0x000093F0
_021E6B38: .4byte 0x000093BC
_021E6B3C: .4byte 0x000093F4
	thumb_func_end ov37_021E69DC

	thumb_func_start ov37_021E6B40
ov37_021E6B40: @ 0x021E6B40
	push {r4, lr}
	ldr r2, _021E6B5C @ =0x00004380
	adds r4, r1, #0
	ldrb r3, [r0, r2]
	movs r1, #0x38
	bics r3, r1
	strb r3, [r0, r2]
	ldr r1, _021E6B60 @ =0x000093BA
	movs r2, #0
	strh r2, [r0, r1]
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
_021E6B5C: .4byte 0x00004380
_021E6B60: .4byte 0x000093BA
	thumb_func_end ov37_021E6B40

	thumb_func_start ov37_021E6B64
ov37_021E6B64: @ 0x021E6B64
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r1, _021E6BF0 @ =0x00004380
	movs r0, #0x38
	ldrb r2, [r5, r1]
	bics r2, r0
	strb r2, [r5, r1]
	bl FUN_02037454
	ldr r1, _021E6BF4 @ =0x000093B8
	ldrh r1, [r5, r1]
	cmp r1, r0
	bne _021E6B8C
	bl ov37_021E75C4
	ldr r1, _021E6BF4 @ =0x000093B8
	ldrh r2, [r5, r1]
	cmp r2, r0
	beq _021E6BA4
_021E6B8C:
	ldr r0, _021E6BF8 @ =0x000093BA
	movs r1, #0
	strh r1, [r5, r0]
	adds r0, r5, #0
	movs r1, #9
	bl ov37_021E7844
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_021E6BA4:
	adds r0, r1, #2
	ldrsh r0, [r5, r0]
	adds r2, r0, #1
	adds r0, r1, #2
	strh r2, [r5, r0]
	ldrsh r0, [r5, r0]
	cmp r0, #0x1e
	ble _021E6BE4
	add r0, sp, #0
	movs r1, #0
	movs r2, #4
	blx FUN_020D4994
	movs r1, #1
	add r0, sp, #0
	strb r1, [r0, #2]
	bl FUN_0203769C
	add r1, sp, #0
	strb r0, [r1]
	movs r0, #0x7e
	add r1, sp, #0
	movs r2, #4
	bl FUN_02037030
	ldr r0, _021E6BF8 @ =0x000093BA
	movs r1, #0
	strh r1, [r5, r0]
	adds r0, r5, #0
	movs r1, #0xa
	bl ov37_021E7844
_021E6BE4:
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6BF0: .4byte 0x00004380
_021E6BF4: .4byte 0x000093B8
_021E6BF8: .4byte 0x000093BA
	thumb_func_end ov37_021E6B64

	thumb_func_start ov37_021E6BFC
ov37_021E6BFC: @ 0x021E6BFC
	push {r3, r4, r5, lr}
	ldr r2, _021E6C30 @ =0x00004380
	adds r5, r0, #0
	ldrb r3, [r5, r2]
	adds r4, r1, #0
	movs r1, #0x38
	bics r3, r1
	strb r3, [r5, r2]
	ldr r1, _021E6C34 @ =0x000093BC
	movs r2, #0
	strb r2, [r5, r1]
	movs r1, #4
	bl ov37_021E7844
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl ov37_021E6848
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6C30: .4byte 0x00004380
_021E6C34: .4byte 0x000093BC
	thumb_func_end ov37_021E6BFC

	thumb_func_start ov37_021E6C38
ov37_021E6C38: @ 0x021E6C38
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #6
	movs r2, #1
	bl ov37_021E762C
	adds r0, r5, #0
	movs r1, #0xb
	bl ov37_021E7844
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov37_021E6C38

	thumb_func_start ov37_021E6C58
ov37_021E6C58: @ 0x021E6C58
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r4, r1, #0
	bl ov37_021E76A0
	cmp r0, #0
	beq _021E6C78
	movs r0, #0x31
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
	adds r0, r5, #0
	movs r1, #0xc
	bl ov37_021E7844
_021E6C78:
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov37_021E6C58

	thumb_func_start ov37_021E6C84
ov37_021E6C84: @ 0x021E6C84
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x31
	lsls r0, r0, #4
	adds r4, r1, #0
	ldr r1, [r5, r0]
	adds r1, r1, #1
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	cmp r0, #0x3c
	ble _021E6CB4
	movs r1, #0x10
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x27
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r4, #3
_021E6CB4:
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov37_021E6C84

	thumb_func_start ov37_021E6CC0
ov37_021E6CC0: @ 0x021E6CC0
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r4, r1, #0
	bl ov37_021E76A0
	cmp r0, #0
	beq _021E6D06
	ldr r0, [r5]
	movs r1, #0xb4
	str r0, [sp]
	movs r0, #0
	str r1, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	str r0, [sp, #4]
	movs r2, #0x19
	add r1, sp, #0
	strb r2, [r1, #0x10]
	movs r2, #6
	strb r2, [r1, #0x11]
	strb r0, [r1, #0x13]
	adds r0, r5, #0
	add r1, sp, #0
	bl ov37_021E7880
	cmp r0, #0
	bne _021E6CFE
	bl GF_AssertFail
_021E6CFE:
	adds r0, r5, #0
	movs r1, #0xe
	bl ov37_021E7844
_021E6D06:
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov37_021E6CC0

	thumb_func_start ov37_021E6D14
ov37_021E6D14: @ 0x021E6D14
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _021E6DC4 @ =0x000093F0
	adds r6, r1, #0
	ldr r0, [r5, r0]
	bl FUN_020168F4
	adds r4, r0, #0
	bl ov37_021E75C4
	movs r1, #0xc6
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	cmp r1, r0
	bne _021E6D3A
	ldr r0, _021E6DC8 @ =0x000093B4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6D44
_021E6D3A:
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_021E6D44:
	cmp r4, #1
	beq _021E6D4E
	cmp r4, #2
	beq _021E6D7A
	b _021E6DB8
_021E6D4E:
	adds r0, r5, #0
	movs r1, #0xf
	bl ov37_021E7844
	movs r1, #0
	movs r0, #0x7f
	adds r2, r1, #0
	bl FUN_02037108
	movs r0, #0
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_0200BE48
	adds r0, r5, #0
	movs r6, #2
	bl ov37_021E78A4
	b _021E6DB8
_021E6D7A:
	adds r0, r5, #0
	movs r1, #4
	bl ov37_021E7844
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl ov37_021E6848
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, #0
	bl ov37_021E78A4
	bl FUN_0203769C
	cmp r0, #0
	bne _021E6DB8
	bl FUN_02037454
	adds r0, r0, #1
	bl FUN_02038C1C
	ldr r0, _021E6DCC @ =0x000093F4
	movs r1, #1
	str r1, [r5, r0]
_021E6DB8:
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_021E6DC4: .4byte 0x000093F0
_021E6DC8: .4byte 0x000093B4
_021E6DCC: .4byte 0x000093F4
	thumb_func_end ov37_021E6D14

	thumb_func_start ov37_021E6DD0
ov37_021E6DD0: @ 0x021E6DD0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	adds r4, r1, #0
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_0200BE48
	adds r0, r5, #0
	movs r1, #3
	movs r2, #1
	bl ov37_021E762C
	adds r0, r5, #0
	movs r1, #0x10
	bl ov37_021E7844
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov37_021E6DD0

	thumb_func_start ov37_021E6E04
ov37_021E6E04: @ 0x021E6E04
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r4, r1, #0
	bl ov37_021E76A0
	cmp r0, #0
	beq _021E6E22
	adds r0, r5, #0
	movs r1, #0x11
	bl ov37_021E7844
	movs r0, #0xc8
	bl FUN_02037AC0
_021E6E22:
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov37_021E6E04

	thumb_func_start ov37_021E6E2C
ov37_021E6E2C: @ 0x021E6E2C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0xc8
	adds r5, r1, #0
	bl FUN_02037B38
	cmp r0, #0
	bne _021E6E46
	bl FUN_02037454
	cmp r0, #1
	bne _021E6E5E
_021E6E46:
	movs r1, #0x10
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x27
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r5, #3
_021E6E5E:
	adds r0, r4, #0
	bl ov37_021E68AC
	adds r0, r5, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov37_021E6E2C

	thumb_func_start ov37_021E6E6C
ov37_021E6E6C: @ 0x021E6E6C
	adds r0, r1, #0
	bx lr
	thumb_func_end ov37_021E6E6C

	thumb_func_start ov37_021E6E70
ov37_021E6E70: @ 0x021E6E70
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #5
	movs r2, #1
	bl ov37_021E762C
	adds r0, r5, #0
	movs r1, #0x14
	bl ov37_021E7844
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov37_021E6E70

	thumb_func_start ov37_021E6E90
ov37_021E6E90: @ 0x021E6E90
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r4, r1, #0
	bl ov37_021E76A0
	cmp r0, #0
	beq _021E6EA8
	adds r0, r5, #0
	movs r1, #0xc
	bl ov37_021E7844
_021E6EA8:
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov37_021E6E90

	thumb_func_start ov37_021E6EB4
ov37_021E6EB4: @ 0x021E6EB4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r4, r1, #0
	cmp r0, #0xff
	beq _021E6ED2
	bl ov37_021E76A0
	cmp r0, #0
	bne _021E6ED2
	ldr r0, [r5, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_021E6ED2:
	adds r0, r5, #0
	movs r1, #2
	movs r2, #1
	bl ov37_021E762C
	adds r0, r5, #0
	movs r1, #0x16
	bl ov37_021E7844
	ldr r0, _021E6F0C @ =0x000005E4
	bl FUN_0200604C
	bl FUN_0203769C
	cmp r0, #0
	bne _021E6EFA
	adds r0, r5, #0
	movs r1, #0
	bl ov37_021E76D0
_021E6EFA:
	bl FUN_02037454
	ldr r1, _021E6F10 @ =0x000093B0
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6F0C: .4byte 0x000005E4
_021E6F10: .4byte 0x000093B0
	thumb_func_end ov37_021E6EB4

	thumb_func_start ov37_021E6F14
ov37_021E6F14: @ 0x021E6F14
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021E6F58 @ =0x000093B0
	adds r4, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6F32
	bl FUN_02037454
	ldr r1, _021E6F58 @ =0x000093B0
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021E6F32
	movs r0, #0
	str r0, [r5, r1]
_021E6F32:
	ldr r0, [r5, #0x30]
	bl ov37_021E76A0
	cmp r0, #0
	beq _021E6F4C
	adds r0, r5, #0
	movs r1, #0x17
	bl ov37_021E7844
	movs r0, #0x31
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
_021E6F4C:
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6F58: .4byte 0x000093B0
	thumb_func_end ov37_021E6F14

	thumb_func_start ov37_021E6F5C
ov37_021E6F5C: @ 0x021E6F5C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021E6FC0 @ =0x000093B0
	adds r4, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6F7A
	bl FUN_02037454
	ldr r1, _021E6FC0 @ =0x000093B0
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021E6F7A
	movs r0, #0
	str r0, [r5, r1]
_021E6F7A:
	movs r0, #0x31
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	adds r1, r1, #1
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	cmp r0, #0x3c
	ble _021E6FB4
	ldr r0, _021E6FC0 @ =0x000093B0
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021E6FB4
	adds r0, r5, #0
	bl ov37_021E76C0
	adds r0, r5, #0
	movs r1, #4
	bl ov37_021E7844
	bl FUN_0203769C
	cmp r0, #0
	bne _021E6FB4
	ldr r0, _021E6FC4 @ =0x000093F4
	movs r1, #1
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov37_021E76D0
_021E6FB4:
	adds r0, r5, #0
	bl ov37_021E68AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6FC0: .4byte 0x000093B0
_021E6FC4: .4byte 0x000093F4
	thumb_func_end ov37_021E6F5C

	thumb_func_start ov37_021E6FC8
ov37_021E6FC8: @ 0x021E6FC8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	adds r6, r2, #0
	cmp r5, #0xf
	bgt _021E6FFA
	bge _021E70A6
	cmp r5, #9
	bhi _021E70AE
	adds r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E6FE6: @ jump table
	.2byte _021E70A4 - _021E6FE6 - 2 @ case 0
	.2byte _021E7000 - _021E6FE6 - 2 @ case 1
	.2byte _021E70A4 - _021E6FE6 - 2 @ case 2
	.2byte _021E703E - _021E6FE6 - 2 @ case 3
	.2byte _021E70A4 - _021E6FE6 - 2 @ case 4
	.2byte _021E70A4 - _021E6FE6 - 2 @ case 5
	.2byte _021E70A4 - _021E6FE6 - 2 @ case 6
	.2byte _021E70A4 - _021E6FE6 - 2 @ case 7
	.2byte _021E70A6 - _021E6FE6 - 2 @ case 8
	.2byte _021E70A6 - _021E6FE6 - 2 @ case 9
_021E6FFA:
	cmp r5, #0x15
	beq _021E7044
	pop {r4, r5, r6, pc}
_021E7000:
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #6
	beq _021E700E
	cmp r0, #0xe
	bne _021E7014
_021E700E:
	adds r0, r4, #0
	bl ov37_021E78A4
_021E7014:
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl ov37_021E6848
	adds r0, r6, #0
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0200BE48
	movs r0, #0x32
	lsls r0, r0, #4
	str r6, [r4, r0]
	ldr r0, _021E70B0 @ =0x000093B4
	movs r1, #0
	str r1, [r4, r0]
	b _021E70A6
_021E703E:
	bl ov37_021E76C0
	b _021E70A6
_021E7044:
	ldr r0, _021E70B4 @ =0x000093BC
	ldrb r0, [r4, r0]
	cmp r0, #1
	beq _021E70AE
	adds r0, r6, #0
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0200BE48
	bl FUN_0203769C
	cmp r6, r0
	beq _021E70AE
	bl FUN_0203769C
	cmp r0, #0
	bne _021E7078
	ldr r1, _021E70B0 @ =0x000093B4
	ldr r0, _021E70B8 @ =0x0000FFFF
	ldr r2, [r4, r1]
	eors r0, r6
	ands r0, r2
	str r0, [r4, r1]
_021E7078:
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #6
	beq _021E7086
	cmp r0, #0xe
	bne _021E7096
_021E7086:
	adds r0, r4, #0
	bl ov37_021E78A4
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D578
_021E7096:
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl ov37_021E6848
	b _021E70A6
_021E70A4:
	pop {r4, r5, r6, pc}
_021E70A6:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov37_021E7844
_021E70AE:
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E70B0: .4byte 0x000093B4
_021E70B4: .4byte 0x000093BC
_021E70B8: .4byte 0x0000FFFF
	thumb_func_end ov37_021E6FC8

	thumb_func_start ov37_021E70BC
ov37_021E70BC: @ 0x021E70BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r4, [sp, #0x38]
	mov ip, r1
	adds r6, r2, #0
	adds r7, r3, #0
	str r0, [sp, #0x18]
	ldr r3, [sp, #0x3c]
	ldr r2, [sp, #0x40]
	ldr r1, [sp, #0x44]
	cmp r4, #0
	bge _021E70E8
	rsbs r0, r4, #0
	cmp r0, r2
	ble _021E70DC
	adds r0, r2, #0
_021E70DC:
	ldr r5, [sp, #0x30]
	movs r4, #0
	subs r5, r5, r0
	adds r6, r6, r0
	str r5, [sp, #0x30]
	subs r2, r2, r0
_021E70E8:
	cmp r3, #0
	bge _021E7100
	rsbs r0, r3, #0
	cmp r0, r1
	ble _021E70F4
	adds r0, r1, #0
_021E70F4:
	ldr r5, [sp, #0x34]
	movs r3, #0
	subs r5, r5, r0
	adds r7, r7, r0
	str r5, [sp, #0x34]
	subs r1, r1, r0
_021E7100:
	ldr r0, [sp, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x34]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	lsls r2, r6, #0x10
	lsls r3, r7, #0x10
	ldr r0, [sp, #0x18]
	mov r1, ip
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x10
	bl FUN_0201D9D8
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov37_021E70BC

	thumb_func_start ov37_021E713C
ov37_021E713C: @ 0x021E713C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x50]
	str r1, [sp, #0x1c]
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x54]
	str r2, [sp, #0x20]
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x50]
	str r3, [sp, #0x24]
	ldr r4, [r0]
	ldr r0, [sp, #0x54]
	ldr r5, [r0]
	adds r0, r2, #0
	str r0, [sp, #0x38]
	adds r0, r3, #0
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x58]
	cmp r0, #0
	bne _021E717C
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	bne _021E717C
	ldr r0, [sp, #0x50]
	adds r1, r2, #0
	str r1, [r0]
	ldr r0, [sp, #0x54]
	adds r1, r3, #0
	str r1, [r0]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
_021E717C:
	ldr r0, [sp, #0x20]
	subs r0, r0, r4
	str r0, [sp, #0x34]
	bpl _021E7188
	rsbs r0, r0, #0
	str r0, [sp, #0x34]
_021E7188:
	ldr r0, [sp, #0x24]
	subs r7, r0, r5
	bpl _021E7190
	rsbs r7, r7, #0
_021E7190:
	ldr r0, [sp, #0x34]
	cmp r0, r7
	ble _021E721E
	ldr r0, [sp, #0x20]
	cmp r4, r0
	ble _021E71B6
	ldr r0, [sp, #0x24]
	cmp r5, r0
	ble _021E71A8
	movs r0, #1
	str r0, [sp, #0x2c]
	b _021E71AE
_021E71A8:
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x2c]
_021E71AE:
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	b _021E71C8
_021E71B6:
	ldr r0, [sp, #0x24]
	cmp r5, r0
	bge _021E71C2
	movs r0, #1
	str r0, [sp, #0x2c]
	b _021E71C8
_021E71C2:
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x2c]
_021E71C8:
	movs r0, #6
	str r0, [sp]
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r2, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	adds r3, r2, #0
	bl ov37_021E70BC
	ldr r0, [sp, #0x34]
	adds r4, r4, #1
	asrs r6, r0, #1
	ldr r0, [sp, #0x38]
	cmp r4, r0
	bgt _021E72A2
_021E71EE:
	subs r6, r6, r7
	bpl _021E71FA
	ldr r0, [sp, #0x34]
	adds r6, r6, r0
	ldr r0, [sp, #0x2c]
	adds r5, r5, r0
_021E71FA:
	movs r0, #6
	str r0, [sp]
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r2, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	adds r3, r2, #0
	bl ov37_021E70BC
	ldr r0, [sp, #0x38]
	adds r4, r4, #1
	cmp r4, r0
	ble _021E71EE
	b _021E72A2
_021E721E:
	ldr r0, [sp, #0x24]
	cmp r5, r0
	ble _021E723E
	ldr r0, [sp, #0x20]
	cmp r4, r0
	ble _021E7230
	movs r0, #1
	str r0, [sp, #0x28]
	b _021E7236
_021E7230:
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x28]
_021E7236:
	str r5, [sp, #0x30]
	ldr r5, [sp, #0x24]
	ldr r4, [sp, #0x20]
	b _021E7250
_021E723E:
	ldr r0, [sp, #0x20]
	cmp r4, r0
	bge _021E724A
	movs r0, #1
	str r0, [sp, #0x28]
	b _021E7250
_021E724A:
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x28]
_021E7250:
	movs r0, #6
	str r0, [sp]
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r2, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	adds r3, r2, #0
	bl ov37_021E70BC
	ldr r0, [sp, #0x30]
	adds r5, r5, #1
	asrs r6, r7, #1
	cmp r5, r0
	bgt _021E72A2
_021E7274:
	ldr r0, [sp, #0x34]
	subs r6, r6, r0
	bpl _021E7280
	ldr r0, [sp, #0x28]
	adds r6, r6, r7
	adds r4, r4, r0
_021E7280:
	movs r0, #6
	str r0, [sp]
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r2, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	adds r3, r2, #0
	bl ov37_021E70BC
	ldr r0, [sp, #0x30]
	adds r5, r5, #1
	cmp r5, r0
	ble _021E7274
_021E72A2:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x50]
	str r1, [r0]
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x54]
	str r1, [r0]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov37_021E713C

	thumb_func_start ov37_021E72B4
ov37_021E72B4: @ 0x021E72B4
	movs r2, #0
_021E72B6:
	ldrb r3, [r0, #8]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1d
	strh r3, [r1, #2]
	ldrb r3, [r0, #8]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1d
	beq _021E72DA
	adds r3, r0, r3
	subs r3, r3, #1
	ldrb r3, [r3]
	strb r3, [r1]
	ldrb r3, [r0, #8]
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1d
	adds r3, r0, r3
	ldrb r3, [r3, #3]
	strb r3, [r1, #1]
_021E72DA:
	adds r2, r2, #1
	adds r0, #0xa
	adds r1, r1, #4
	cmp r2, #5
	blt _021E72B6
	bx lr
	.align 2, 0
	thumb_func_end ov37_021E72B4

	thumb_func_start ov37_021E72E8
ov37_021E72E8: @ 0x021E72E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp, #0x10]
	movs r0, #0
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	adds r5, r1, #0
	adds r7, r2, #0
_021E72FE:
	ldrb r0, [r5, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	beq _021E736E
	ldrh r0, [r7, #2]
	cmp r0, #0
	beq _021E7318
	ldrb r0, [r7]
	subs r0, #9
	str r0, [sp, #0x2c]
	ldrb r0, [r7, #1]
	subs r0, #0x11
	str r0, [sp, #0x28]
_021E7318:
	ldrb r0, [r5, #8]
	movs r4, #0
	lsls r0, r0, #0x1a
	lsrs r1, r0, #0x1d
	cmp r1, #0
	ble _021E736E
	movs r0, #1
	str r0, [sp, #0x20]
	cmp r1, #0
	ble _021E736E
_021E732C:
	add r0, sp, #0x2c
	str r0, [sp]
	add r0, sp, #0x28
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldrh r0, [r7, #2]
	movs r6, #0xc0
	adds r3, r5, r4
	str r0, [sp, #0xc]
	ldrb r1, [r5, #8]
	ldrb r3, [r3, #4]
	ldr r0, [sp, #0x10]
	lsls r2, r1, #0x18
	lsrs r2, r2, #0x1e
	muls r6, r2, r6
	ldr r2, _021E73B0 @ =0x021E7AC8
	lsls r1, r1, #0x1d
	adds r2, r2, r6
	lsrs r6, r1, #0x1d
	movs r1, #0x18
	muls r1, r6, r1
	adds r1, r2, r1
	ldrb r2, [r5, r4]
	subs r3, #0x11
	subs r2, #9
	bl ov37_021E713C
	ldrb r0, [r5, #8]
	adds r4, r4, #1
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	cmp r4, r0
	blt _021E732C
_021E736E:
	ldr r0, [sp, #0x24]
	adds r5, #0xa
	adds r0, r0, #1
	adds r7, r7, #4
	str r0, [sp, #0x24]
	cmp r0, #5
	blt _021E72FE
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _021E738E
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _021E738E
	ldr r0, [sp, #0x10]
	bl FUN_0201D578
_021E738E:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl ov37_021E72B4
	movs r3, #0
	movs r1, #0x38
_021E739A:
	ldr r0, [sp, #0x14]
	adds r3, r3, #1
	ldrb r2, [r0, #8]
	bics r2, r1
	strb r2, [r0, #8]
	adds r0, #0xa
	str r0, [sp, #0x14]
	cmp r3, #5
	blt _021E739A
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E73B0: .4byte 0x021E7AC8
	thumb_func_end ov37_021E72E8

	thumb_func_start ov37_021E73B4
ov37_021E73B4: @ 0x021E73B4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _021E7418 @ =0x00004382
	movs r7, #0x76
	movs r6, #0
	adds r4, r5, r0
	lsls r7, r7, #2
_021E73C2:
	bl FUN_0203769C
	cmp r6, r0
	beq _021E740A
	ldrb r0, [r4, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	beq _021E73FE
	adds r0, r6, #0
	bl FUN_02034818
	cmp r0, #0
	beq _021E73FE
	movs r0, #0x76
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	ldrb r0, [r4, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	adds r2, r4, r0
	subs r1, r2, #1
	ldrb r1, [r1]
	ldrb r2, [r2, #3]
	ldr r0, [r5, r7]
	bl ov37_021E657C
	b _021E740A
_021E73FE:
	movs r0, #0x76
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
_021E740A:
	adds r6, r6, #1
	adds r4, #0xa
	adds r5, r5, #4
	cmp r6, #5
	blt _021E73C2
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7418: .4byte 0x00004382
	thumb_func_end ov37_021E73B4

	thumb_func_start ov37_021E741C
ov37_021E741C: @ 0x021E741C
	push {r3, lr}
	ldrh r1, [r0]
	adds r1, #0x14
	strh r1, [r0]
	ldrh r2, [r0]
	movs r1, #0x5a
	lsls r1, r1, #2
	cmp r2, r1
	bls _021E7432
	movs r1, #0
	strh r1, [r0]
_021E7432:
	ldrh r0, [r0]
	bl FUN_0201FCAC
	movs r1, #0xa
	muls r1, r0, r1
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	adds r0, #0xf
	lsls r1, r0, #5
	movs r0, #0x1d
	orrs r1, r0
	add r0, sp, #0
	strh r1, [r0]
	add r0, sp, #0
	movs r1, #0x18
	movs r2, #2
	blx FUN_020CFD18
	pop {r3, pc}
	thumb_func_end ov37_021E741C

	thumb_func_start ov37_021E745C
ov37_021E745C: @ 0x021E745C
	push {r3, r4, r5, lr}
	movs r5, #0
	adds r4, r5, #0
_021E7462:
	adds r0, r4, #0
	bl FUN_02034818
	cmp r0, #0
	beq _021E746E
	adds r5, r5, #1
_021E746E:
	adds r4, r4, #1
	cmp r4, #5
	blt _021E7462
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov37_021E745C

	thumb_func_start ov37_021E7478
ov37_021E7478: @ 0x021E7478
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r7, r3, #0
	adds r5, r0, #0
	str r2, [sp, #0x10]
	bl FUN_0203769C
	str r0, [sp, #0x14]
	adds r0, r7, #0
	bl ov37_021E75E8
	cmp r0, #0
	beq _021E7552
	movs r0, #0
	str r0, [sp, #0x18]
	adds r6, r7, #0
	adds r4, r7, #0
_021E749A:
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _021E74B2
	movs r0, #0x21
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	b _021E74BE
_021E74B2:
	movs r0, #0x21
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
_021E74BE:
	ldr r0, [sp, #0x18]
	adds r6, #8
	adds r0, r0, #1
	adds r4, r4, #4
	str r0, [sp, #0x18]
	cmp r0, #5
	blt _021E749A
	movs r6, #0
	adds r4, r5, #0
_021E74D0:
	movs r0, #0x50
	movs r1, #0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201DA74
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #5
	blt _021E74D0
	movs r6, #0
	adds r4, r7, #0
_021E74F0:
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _021E7540
	ldr r1, [r4, #0x14]
	bl FUN_02028F58
	ldr r0, [sp, #0x14]
	cmp r0, r6
	bne _021E7524
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E7558 @ =0x0003040F
	movs r1, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_020200FC
	b _021E7540
_021E7524:
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	movs r1, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_020200FC
_021E7540:
	adds r0, r5, #0
	bl FUN_0201D578
	adds r6, r6, #1
	adds r7, #8
	adds r4, r4, #4
	adds r5, #0x10
	cmp r6, #5
	blt _021E74F0
_021E7552:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021E7558: .4byte 0x0003040F
	thumb_func_end ov37_021E7478

	thumb_func_start ov37_021E755C
ov37_021E755C: @ 0x021E755C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0203769C
	cmp r0, #0
	bne _021E759C
	bl FUN_0203783C
	cmp r0, #0
	beq _021E75B0
	ldr r1, _021E75B4 @ =0x000093F4
	ldr r0, _021E75B8 @ =0x00004381
	ldr r2, [r4, r1]
	subs r1, #0x37
	strb r2, [r4, r0]
	subs r0, #9
	adds r2, r4, r1
	adds r3, r4, r0
	movs r1, #0xa
_021E7582:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _021E7582
	ldr r1, _021E75BC @ =0x000093BD
	movs r0, #0x78
	adds r1, r4, r1
	movs r2, #0x32
	bl FUN_02037108
	pop {r4, pc}
_021E759C:
	bl FUN_02037854
	cmp r0, #0
	beq _021E75B0
	ldr r1, _021E75C0 @ =0x00004378
	movs r0, #0x77
	adds r1, r4, r1
	movs r2, #0xa
	bl FUN_02037030
_021E75B0:
	pop {r4, pc}
	nop
_021E75B4: .4byte 0x000093F4
_021E75B8: .4byte 0x00004381
_021E75BC: .4byte 0x000093BD
_021E75C0: .4byte 0x00004378
	thumb_func_end ov37_021E755C

	thumb_func_start ov37_021E75C4
ov37_021E75C4: @ 0x021E75C4
	push {r3, r4, r5, lr}
	movs r5, #0
	adds r4, r5, #0
_021E75CA:
	adds r0, r4, #0
	bl FUN_02034818
	cmp r0, #0
	beq _021E75D6
	adds r5, r5, #1
_021E75D6:
	adds r4, r4, #1
	cmp r4, #5
	blt _021E75CA
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov37_021E75C4

	thumb_func_start ov37_021E75E0
ov37_021E75E0: @ 0x021E75E0
	ldr r3, _021E75E4 @ =ov37_021E75C4
	bx r3
	.align 2, 0
_021E75E4: .4byte ov37_021E75C4
	thumb_func_end ov37_021E75E0

	thumb_func_start ov37_021E75E8
ov37_021E75E8: @ 0x021E75E8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
	adds r6, r7, #0
	adds r4, r5, #0
_021E75F2:
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	adds r0, r6, #0
	bl FUN_02034818
	movs r1, #0xcd
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r6, r6, #1
	adds r4, #8
	cmp r6, #5
	blt _021E75F2
	movs r6, #0
	movs r2, #1
	adds r0, r1, #4
_021E7616:
	ldr r4, [r5, r0]
	ldr r3, [r5, r1]
	cmp r4, r3
	beq _021E7620
	adds r7, r2, #0
_021E7620:
	adds r6, r6, #1
	adds r5, #8
	cmp r6, #5
	blt _021E7616
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov37_021E75E8

	thumb_func_start ov37_021E762C
ov37_021E762C: @ 0x021E762C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r7, r1, #0
	movs r0, #0x50
	movs r1, #0x27
	adds r4, r2, #0
	bl FUN_02026354
	adds r6, r0, #0
	ldr r0, [r5, #0x10]
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x2c]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	movs r2, #1
	movs r3, #0xa
	bl FUN_0200E998
	cmp r4, #0
	bne _021E767C
	movs r4, #0
_021E767C:
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0xb6
	lsls r0, r0, #2
	ldr r2, [r5, #0x2c]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	str r0, [r5, #0x30]
	cmp r4, #0
	bne _021E769C
	movs r0, #0xff
	str r0, [r5, #0x30]
_021E769C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov37_021E762C

	thumb_func_start ov37_021E76A0
ov37_021E76A0: @ 0x021E76A0
	push {r3, lr}
	cmp r0, #0xff
	bne _021E76AA
	movs r0, #1
	pop {r3, pc}
_021E76AA:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _021E76BA
	movs r0, #1
	pop {r3, pc}
_021E76BA:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov37_021E76A0

	thumb_func_start ov37_021E76C0
ov37_021E76C0: @ 0x021E76C0
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r3, _021E76CC @ =FUN_0200E9BC
	movs r1, #0
	bx r3
	.align 2, 0
_021E76CC: .4byte FUN_0200E9BC
	thumb_func_end ov37_021E76C0

	thumb_func_start ov37_021E76D0
ov37_021E76D0: @ 0x021E76D0
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_0203769C
	cmp r0, #0
	bne _021E76EC
	bl FUN_02037454
	adds r0, r4, r0
	cmp r0, #5
	ble _021E76E8
	movs r0, #5
_021E76E8:
	bl FUN_02038C1C
_021E76EC:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov37_021E76D0

	thumb_func_start ov37_021E76F0
ov37_021E76F0: @ 0x021E76F0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov37_021E75C4
	adds r5, r0, #0
	cmp r5, #5
	bhi _021E778E
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E770A: @ jump table
	.2byte _021E778E - _021E770A - 2 @ case 0
	.2byte _021E7716 - _021E770A - 2 @ case 1
	.2byte _021E775C - _021E770A - 2 @ case 2
	.2byte _021E775C - _021E770A - 2 @ case 3
	.2byte _021E775C - _021E770A - 2 @ case 4
	.2byte _021E7788 - _021E770A - 2 @ case 5
_021E7716:
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0xe
	bgt _021E778E
	bl FUN_02033250
	cmp r0, #1
	beq _021E7730
	movs r0, #0x25
	movs r1, #1
	lsls r0, r0, #0xa
	str r1, [r4, r0]
_021E7730:
	movs r0, #0xc2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #1
	bl FUN_02038C1C
	ldr r0, _021E7830 @ =0x000093F8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E7758
	adds r0, r4, #0
	bl ov37_021E78A4
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x15
	bl FUN_020248F0
_021E7758:
	movs r0, #2
	pop {r3, r4, r5, pc}
_021E775C:
	movs r0, #1
	bl FUN_0205A904
	movs r0, #0xc5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r5, r0
	bge _021E778E
	ldr r0, _021E7834 @ =0x000093F4
	ldr r0, [r4, r0]
	cmp r0, #2
	bne _021E777E
	adds r0, r4, #0
	movs r1, #0
	bl ov37_021E76D0
	b _021E778E
_021E777E:
	adds r0, r4, #0
	movs r1, #1
	bl ov37_021E76D0
	b _021E778E
_021E7788:
	movs r0, #8
	bl FUN_0205A904
_021E778E:
	movs r0, #0xc5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r5, r0
	bge _021E77D8
	bl FUN_02037454
	movs r1, #0xc6
	lsls r1, r1, #2
	str r0, [r4, r1]
	bl FUN_02033250
	movs r1, #0xc7
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _021E7838 @ =0x00009404
	ldr r2, [r4, r0]
	cmp r2, #0
	beq _021E77D8
	adds r0, r0, #4
	ldr r1, [r4, r1]
	ldr r0, [r4, r0]
	tst r0, r1
	bne _021E77D8
	adds r0, r4, #0
	movs r1, #1
	bl ov37_021E76D0
	ldr r1, _021E7834 @ =0x000093F4
	movs r0, #1
	str r0, [r4, r1]
	adds r0, r1, #0
	movs r2, #0
	adds r0, #0x10
	str r2, [r4, r0]
	adds r1, #0x14
	str r2, [r4, r1]
_021E77D8:
	bl ov37_021E75C4
	movs r1, #0xc5
	lsls r1, r1, #2
	str r0, [r4, r1]
	bl FUN_02037454
	movs r1, #0xc6
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, r0
	bge _021E782C
	ldr r0, _021E7834 @ =0x000093F4
	movs r1, #2
	str r1, [r4, r0]
	movs r1, #1
	adds r0, #0x10
	str r1, [r4, r0]
	bl FUN_02033250
	movs r1, #0xc7
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	eors r0, r1
	ldr r1, _021E783C @ =0x00009408
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	movs r0, #0
	subs r1, r1, #2
	cmp r1, #0xe
	bhi _021E7824
	movs r2, #1
	adds r3, r2, #0
	lsls r3, r1
	ldr r1, _021E7840 @ =0x00004045
	tst r1, r3
	beq _021E7824
	adds r0, r2, #0
_021E7824:
	cmp r0, #0
	bne _021E782C
	bl GF_AssertFail
_021E782C:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7830: .4byte 0x000093F8
_021E7834: .4byte 0x000093F4
_021E7838: .4byte 0x00009404
_021E783C: .4byte 0x00009408
_021E7840: .4byte 0x00004045
	thumb_func_end ov37_021E76F0

	thumb_func_start ov37_021E7844
ov37_021E7844: @ 0x021E7844
	movs r2, #0xc2
	lsls r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov37_021E7844

	thumb_func_start ov37_021E784C
ov37_021E784C: @ 0x021E784C
	push {r3, r4}
	movs r3, #0xc2
	lsls r3, r3, #2
	subs r4, r3, #4
	ldr r2, [r0, r3]
	ldr r4, [r0, r4]
	cmp r4, r2
	beq _021E7876
	cmp r1, #2
	beq _021E7868
	subs r1, r3, #4
	str r2, [r0, r1]
	pop {r3, r4}
	bx lr
_021E7868:
	ldr r1, _021E787C @ =0x021E7D24
	lsls r4, r2, #3
	ldr r1, [r1, r4]
	cmp r1, #0
	beq _021E7876
	subs r1, r3, #4
	str r2, [r0, r1]
_021E7876:
	pop {r3, r4}
	bx lr
	nop
_021E787C: .4byte 0x021E7D24
	thumb_func_end ov37_021E784C

	thumb_func_start ov37_021E7880
ov37_021E7880: @ 0x021E7880
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E78A0 @ =0x000093F8
	ldr r2, [r4, r0]
	cmp r2, #0
	bne _021E789C
	subs r0, #8
	ldr r0, [r4, r0]
	bl FUN_020166FC
	ldr r1, _021E78A0 @ =0x000093F8
	movs r0, #1
	str r0, [r4, r1]
	pop {r4, pc}
_021E789C:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E78A0: .4byte 0x000093F8
	thumb_func_end ov37_021E7880

	thumb_func_start ov37_021E78A4
ov37_021E78A4: @ 0x021E78A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E78C0 @ =0x000093F8
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021E78BE
	subs r0, #8
	ldr r0, [r4, r0]
	bl FUN_020169CC
	ldr r0, _021E78C0 @ =0x000093F8
	movs r1, #0
	str r1, [r4, r0]
_021E78BE:
	pop {r4, pc}
	.align 2, 0
_021E78C0: .4byte 0x000093F8
	thumb_func_end ov37_021E78A4

	thumb_func_start ov37_021E78C4
ov37_021E78C4: @ 0x021E78C4
	push {r3, lr}
	ldr r0, _021E78DC @ =_021E7968
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021E78D8
	movs r0, #1
	pop {r3, pc}
_021E78D8:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_021E78DC: .4byte _021E7968
	thumb_func_end ov37_021E78C4

	thumb_func_start ov37_021E78E0
ov37_021E78E0: @ 0x021E78E0
	push {r4, r5, r6, r7}
	adds r5, r1, #0
	ldrh r1, [r5]
	adds r4, r2, #0
	adds r2, r3, #0
	cmp r1, #0
	beq _021E791C
	ldrh r1, [r5, #2]
	strb r1, [r0]
	ldrh r1, [r5, #4]
	strb r1, [r0, #4]
	ldrh r1, [r5]
	subs r1, r1, #1
	lsls r1, r1, #3
	adds r3, r5, r1
	ldrh r1, [r3, #2]
	strb r1, [r0, #1]
	ldrh r1, [r3, #4]
	strb r1, [r0, #5]
	movs r1, #0
	adds r3, r1, #0
_021E790A:
	adds r6, r0, r1
	ldrb r7, [r0, r1]
	ldrb r6, [r6, #4]
	adds r6, r7, r6
	bne _021E7916
	strh r3, [r5]
_021E7916:
	adds r1, r1, #1
	cmp r1, #2
	blt _021E790A
_021E791C:
	ldrh r5, [r5]
	cmp r5, #2
	blo _021E792C
	ldrb r3, [r0, #8]
	movs r1, #0x38
	bics r3, r1
	movs r1, #0x10
	b _021E793A
_021E792C:
	ldrb r1, [r0, #8]
	movs r3, #0x38
	bics r1, r3
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	lsls r3, r3, #0x1d
	lsrs r3, r3, #0x1a
_021E793A:
	orrs r1, r3
	strb r1, [r0, #8]
	ldrb r1, [r0, #8]
	movs r3, #7
	bics r1, r3
	lsls r3, r4, #0x18
	lsrs r4, r3, #0x18
	movs r3, #7
	ands r3, r4
	orrs r1, r3
	strb r1, [r0, #8]
	ldrb r3, [r0, #8]
	movs r1, #0xc0
	bics r3, r1
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x18
	orrs r1, r3
	strb r1, [r0, #8]
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
	thumb_func_end ov37_021E78E0

	.rodata

_021E7968:
	.byte 0x30, 0x70, 0xC8, 0xF8, 0xFF, 0x00, 0x00, 0x00
	.byte 0x10, 0x88, 0x08, 0xF8, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x96, 0xBD, 0x00, 0x17
	.byte 0x96, 0xBD, 0x18, 0x2F, 0x96, 0xBD, 0x30, 0x47, 0x96, 0xBD, 0x48, 0x5F, 0x96, 0xBD, 0x60, 0x77
	.byte 0x96, 0xBD, 0x78, 0x8F, 0x96, 0xBD, 0x90, 0xA7, 0x96, 0xBD, 0xA8, 0xBF, 0x96, 0xBD, 0xC0, 0xFF
	.byte 0x01, 0x0D, 0x0E, 0x1A, 0x01, 0x0D, 0x1E, 0x2A, 0x01, 0x0D, 0x2E, 0x3A, 0xFF, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0xAB, 0x00, 0x05, 0x00, 0x25, 0x00, 0xAB, 0x00, 0x07, 0x00, 0x3D, 0x00, 0xAB, 0x00
	.byte 0x09, 0x00, 0x55, 0x00, 0xAB, 0x00, 0x0B, 0x00, 0x6D, 0x00, 0xAB, 0x00, 0x0D, 0x00, 0x85, 0x00
	.byte 0xAB, 0x00, 0x0F, 0x00, 0x9D, 0x00, 0xAB, 0x00, 0x11, 0x00, 0xB5, 0x00, 0xAB, 0x00, 0x13, 0x00
	.byte 0xE1, 0x00, 0xAB, 0x00, 0x15, 0x00, 0x14, 0x00, 0x09, 0x00, 0x1D, 0x00, 0x24, 0x00, 0x09, 0x00
	.byte 0x20, 0x00, 0x34, 0x00, 0x09, 0x00, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x11, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x33, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x55, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x77, 0x00, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00
	.byte 0x10, 0x11, 0x01, 0x00, 0x10, 0x11, 0x01, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x20, 0x22, 0x02, 0x00, 0x20, 0x22, 0x02, 0x00
	.byte 0x00, 0x22, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00
	.byte 0x30, 0x33, 0x03, 0x00, 0x30, 0x33, 0x03, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x40, 0x44, 0x04, 0x00, 0x40, 0x44, 0x04, 0x00
	.byte 0x00, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00
	.byte 0x50, 0x55, 0x05, 0x00, 0x50, 0x55, 0x05, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x60, 0x66, 0x06, 0x00, 0x60, 0x66, 0x06, 0x00
	.byte 0x00, 0x66, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x77, 0x00, 0x00
	.byte 0x70, 0x77, 0x07, 0x00, 0x70, 0x77, 0x07, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x80, 0x88, 0x08, 0x00, 0x80, 0x88, 0x08, 0x00
	.byte 0x00, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x11, 0x01, 0x00, 0x11, 0x11, 0x11, 0x00
	.byte 0x11, 0x11, 0x11, 0x00, 0x11, 0x11, 0x11, 0x00, 0x11, 0x11, 0x11, 0x00, 0x10, 0x11, 0x01, 0x00
	.byte 0x20, 0x22, 0x02, 0x00, 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00
	.byte 0x22, 0x22, 0x22, 0x00, 0x20, 0x22, 0x02, 0x00, 0x30, 0x33, 0x03, 0x00, 0x33, 0x33, 0x33, 0x00
	.byte 0x33, 0x33, 0x33, 0x00, 0x33, 0x33, 0x33, 0x00, 0x33, 0x33, 0x33, 0x00, 0x30, 0x33, 0x03, 0x00
	.byte 0x40, 0x44, 0x04, 0x00, 0x44, 0x44, 0x44, 0x00, 0x44, 0x44, 0x44, 0x00, 0x44, 0x44, 0x44, 0x00
	.byte 0x44, 0x44, 0x44, 0x00, 0x40, 0x44, 0x04, 0x00, 0x50, 0x55, 0x05, 0x00, 0x55, 0x55, 0x55, 0x00
	.byte 0x55, 0x55, 0x55, 0x00, 0x55, 0x55, 0x55, 0x00, 0x55, 0x55, 0x55, 0x00, 0x50, 0x55, 0x05, 0x00
	.byte 0x60, 0x66, 0x06, 0x00, 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00
	.byte 0x66, 0x66, 0x66, 0x00, 0x60, 0x66, 0x06, 0x00, 0x70, 0x77, 0x07, 0x00, 0x77, 0x77, 0x77, 0x00
	.byte 0x77, 0x77, 0x77, 0x00, 0x77, 0x77, 0x77, 0x00, 0x77, 0x77, 0x77, 0x00, 0x70, 0x77, 0x07, 0x00
	.byte 0x80, 0x88, 0x08, 0x00, 0x88, 0x88, 0x88, 0x00, 0x88, 0x88, 0x88, 0x00, 0x88, 0x88, 0x88, 0x00
	.byte 0x88, 0x88, 0x88, 0x00, 0x80, 0x88, 0x08, 0x00

	.data

_021E7D20:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD1, 0x68, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x29, 0x69, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x4D, 0x69, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x61, 0x68, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x81, 0x69, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0xDD, 0x69, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00, 0x41, 0x6B, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x65, 0x6B, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00, 0xFD, 0x6B, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x39, 0x6C, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00, 0x59, 0x6C, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x85, 0x6C, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00, 0xC1, 0x6C, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x15, 0x6D, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00, 0xD1, 0x6D, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x05, 0x6E, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00, 0x2D, 0x6E, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x6D, 0x6E, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00, 0x71, 0x6E, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x91, 0x6E, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00, 0xB5, 0x6E, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x15, 0x6F, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00, 0x5D, 0x6F, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00
	@ 0x021E7DE0
