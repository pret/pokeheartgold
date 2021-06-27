
	thumb_func_start ov52_021E80C0
ov52_021E80C0: @ 0x021E80C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	ldr r1, [r5]
	adds r6, r0, #0
	cmp r1, #0
	beq _021E80D6
	cmp r1, #1
	bne _021E80D4
	b _021E8216
_021E80D4:
	b _021E8224
_021E80D6:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E822C @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E8230 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #3
	movs r1, #0x27
	lsls r2, r2, #6
	bl FUN_0201A910
	ldr r1, _021E8234 @ =0x00005CB0
	adds r0, r6, #0
	movs r2, #0x27
	bl FUN_02007280
	ldr r2, _021E8234 @ =0x00005CB0
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x27
	bl FUN_0201AC88
	str r0, [r4]
	movs r0, #0x5b
	movs r1, #0x27
	bl FUN_02007688
	adds r7, r0, #0
	movs r0, #0x27
	bl FUN_0200BD08
	str r0, [r4, #0x10]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xfc
	movs r3, #0x27
	bl FUN_0200BAF8
	str r0, [r4, #0x14]
	movs r0, #1
	bl FUN_02002B8C
	movs r0, #1
	bl FUN_02002B34
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	bl ov52_021E83A4
	ldr r0, [r4]
	bl ov52_021E83C4
	movs r0, #0x10
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x27
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	adds r0, r6, #0
	bl FUN_020072A4
	bl FUN_0202C9D8
	bl FUN_0202C9E4
	ldr r1, _021E8238 @ =0x00005B98
	str r0, [r4, r1]
	adds r0, r6, #0
	bl FUN_020072A4
	bl FUN_0202CF54
	str r0, [r4, #8]
	adds r0, r6, #0
	bl FUN_020072A4
	bl FUN_02028EA8
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov52_021E85DC
	bl FUN_020210BC
	movs r0, #1
	bl FUN_02021148
	ldr r0, _021E823C @ =ov52_021E837C
	ldr r1, [r4]
	bl FUN_0201A0FC
	movs r0, #2
	movs r1, #0x27
	bl FUN_02002CEC
	adds r0, r4, #0
	bl ov52_021E84CC
	bl ov52_021E86DC
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov52_021E870C
	adds r0, r4, #0
	bl ov52_021E888C
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov52_021E89D4
	movs r1, #0
	movs r0, #0x38
	adds r2, r1, #0
	bl FUN_02004EC4
	ldr r2, _021E8240 @ =0x04000304
	ldr r0, _021E8244 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	adds r0, r7, #0
	bl FUN_0200770C
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _021E8224
_021E8216:
	bl FUN_02007290
	movs r0, #0
	str r0, [r5]
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_021E8224:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E822C: .4byte 0xFFFFE0FF
_021E8230: .4byte 0x04001000
_021E8234: .4byte 0x00005CB0
_021E8238: .4byte 0x00005B98
_021E823C: .4byte ov52_021E837C
_021E8240: .4byte 0x04000304
_021E8244: .4byte 0xFFFF7FFF
	thumb_func_end ov52_021E80C0

	thumb_func_start ov52_021E8248
ov52_021E8248: @ 0x021E8248
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #0
	beq _021E8262
	cmp r1, #1
	beq _021E8270
	cmp r1, #2
	beq _021E828E
	b _021E829A
_021E8262:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E829A
	movs r0, #1
	str r0, [r5]
	b _021E829A
_021E8270:
	movs r2, #0xc3
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	lsls r3, r2, #2
	ldr r2, _021E82A4 @ =0x021E96C0
	ldr r2, [r2, r3]
	cmp r2, #0
	beq _021E8284
	blx r2
	str r0, [r5]
_021E8284:
	ldr r0, _021E82A8 @ =0x00004318
	adds r0, r4, r0
	bl ov52_021E921C
	b _021E829A
_021E828E:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E829A
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E829A:
	ldr r0, [r4, #0x3c]
	bl FUN_0202457C
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E82A4: .4byte 0x021E96C0
_021E82A8: .4byte 0x00004318
	thumb_func_end ov52_021E8248

	thumb_func_start ov52_021E82AC
ov52_021E82AC: @ 0x021E82AC
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl FUN_02007290
	adds r6, r0, #0
	ldr r0, _021E8374 @ =0x00005B98
	movs r1, #0x2d
	lsls r1, r1, #4
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	bl ov52_021E9300
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	movs r7, #0x5a
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_021E82FC:
	ldr r0, [r5, r7]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E82FC
	ldr r0, [r6, #0x3c]
	bl FUN_02024504
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	adds r0, r6, #0
	bl ov52_021E8B94
	movs r0, #2
	bl FUN_02002DB4
	ldr r0, [r6]
	bl ov52_021E85A0
	bl FUN_02021238
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #0
	bl FUN_02002B34
	ldr r0, [r6, #0x14]
	bl FUN_0200BB44
	ldr r0, [r6, #0x10]
	bl FUN_0200BDA0
	adds r0, r6, #0
	bl ov52_021E8568
	ldr r0, [sp]
	bl FUN_02007294
	ldr r2, _021E8378 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x27
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8374: .4byte 0x00005B98
_021E8378: .4byte 0x04000304
	thumb_func_end ov52_021E82AC

	thumb_func_start ov52_021E837C
ov52_021E837C: @ 0x021E837C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0202061C
	bl FUN_0200B224
	adds r0, r4, #0
	bl FUN_0201EEB4
	ldr r3, _021E839C @ =0x027E0000
	ldr r1, _021E83A0 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E839C: .4byte 0x027E0000
_021E83A0: .4byte 0x00003FF8
	thumb_func_end ov52_021E837C

	thumb_func_start ov52_021E83A4
ov52_021E83A4: @ 0x021E83A4
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E83C0 @ =0x021E9578
	add r3, sp, #0
	movs r2, #5
_021E83AE:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E83AE
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E83C0: .4byte 0x021E9578
	thumb_func_end ov52_021E83A4

	thumb_func_start ov52_021E83C4
ov52_021E83C4: @ 0x021E83C4
	push {r4, r5, lr}
	sub sp, #0x9c
	ldr r5, _021E84B4 @ =0x021E94CC
	add r3, sp, #0x8c
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E84B8 @ =0x021E9524
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
	ldr r5, _021E84BC @ =0x021E9540
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
	ldr r5, _021E84C0 @ =0x021E955C
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
	ldr r5, _021E84C4 @ =0x021E94EC
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
	ldr r5, _021E84C8 @ =0x021E9508
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
	add sp, #0x9c
	pop {r4, r5, pc}
	nop
_021E84B4: .4byte 0x021E94CC
_021E84B8: .4byte 0x021E9524
_021E84BC: .4byte 0x021E9540
_021E84C0: .4byte 0x021E955C
_021E84C4: .4byte 0x021E94EC
_021E84C8: .4byte 0x021E9508
	thumb_func_end ov52_021E83C4

	thumb_func_start ov52_021E84CC
ov52_021E84CC: @ 0x021E84CC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _021E8558 @ =0x0000433D
	movs r6, #0
	adds r5, r7, r0
	movs r0, #0xf0
	adds r4, r7, #0
	str r0, [sp]
_021E84DC:
	movs r0, #8
	movs r1, #0x27
	bl FUN_02026354
	str r0, [r4, #0x18]
	ldrb r1, [r5]
	ldr r0, [sp]
	adds r6, r6, #1
	bics r1, r0
	strb r1, [r5]
	ldr r0, _021E855C @ =0x00004384
	movs r1, #0
	strh r1, [r4, r0]
	adds r4, r4, #4
	adds r5, #0x11
	cmp r6, #5
	blt _021E84DC
	movs r0, #0x14
	movs r1, #0x27
	bl FUN_02026354
	str r0, [r7, #0x2c]
	movs r0, #0x28
	movs r1, #0x27
	bl FUN_02026354
	str r0, [r7, #0x30]
	movs r0, #0x50
	movs r1, #0x27
	bl FUN_02026354
	str r0, [r7, #0x34]
	ldr r0, _021E8560 @ =0x0000431A
	movs r1, #0
	strb r1, [r7, r0]
	movs r0, #0xc3
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r7, r0]
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x2c]
	movs r1, #0xc
	bl FUN_0200BB6C
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x30]
	movs r1, #9
	bl FUN_0200BB6C
	movs r0, #0x27
	bl FUN_0201660C
	ldr r1, _021E8564 @ =0x00005C9C
	movs r2, #5
	str r0, [r7, r1]
	adds r1, r1, #4
	movs r0, #0
	adds r1, r7, r1
	blx FUN_020D4858
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8558: .4byte 0x0000433D
_021E855C: .4byte 0x00004384
_021E8560: .4byte 0x0000431A
_021E8564: .4byte 0x00005C9C
	thumb_func_end ov52_021E84CC

	thumb_func_start ov52_021E8568
ov52_021E8568: @ 0x021E8568
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _021E859C @ =0x00005C9C
	ldr r0, [r6, r0]
	bl FUN_02016624
	movs r4, #0
	adds r5, r6, #0
_021E8578:
	ldr r0, [r5, #0x18]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #5
	blt _021E8578
	ldr r0, [r6, #0x34]
	bl FUN_02026380
	ldr r0, [r6, #0x30]
	bl FUN_02026380
	ldr r0, [r6, #0x2c]
	bl FUN_02026380
	pop {r4, r5, r6, pc}
	nop
_021E859C: .4byte 0x00005C9C
	thumb_func_end ov52_021E8568

	thumb_func_start ov52_021E85A0
ov52_021E85A0: @ 0x021E85A0
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
	thumb_func_end ov52_021E85A0

	thumb_func_start ov52_021E85DC
ov52_021E85DC: @ 0x021E85DC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r4, [r6]
	movs r0, #0x60
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
	movs r1, #2
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
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x27
	bl FUN_0201C1C4
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
	movs r3, #2
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
	movs r1, #5
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
	movs r1, #4
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
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007B68
	ldr r0, [r6, #0xc]
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
	thumb_func_end ov52_021E85DC

	thumb_func_start ov52_021E86DC
ov52_021E86DC: @ 0x021E86DC
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E8708 @ =0x021E94DC
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
_021E8708: .4byte 0x021E94DC
	thumb_func_end ov52_021E86DC

	thumb_func_start ov52_021E870C
ov52_021E870C: @ 0x021E870C
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
	movs r0, #0x32
	adds r1, #0x40
	movs r2, #0x27
	bl FUN_02009F40
	str r0, [r5, #0x3c]
	adds r0, r5, #0
	movs r2, #1
	adds r0, #0x40
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r6, #0
	adds r4, r5, #0
_021E8750:
	movs r0, #2
	adds r1, r6, #0
	movs r2, #0x27
	bl FUN_0200A090
	movs r1, #0x5a
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _021E8750
	movs r0, #0
	str r0, [sp]
	movs r3, #1
	str r3, [sp, #4]
	movs r0, #0x27
	str r0, [sp, #8]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	adds r1, r7, #0
	movs r2, #7
	bl FUN_0200A3C8
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r3, #0
	str r3, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0x27
	subs r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	bl FUN_0200A480
	movs r1, #0x5f
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
	movs r2, #8
	movs r3, #1
	bl FUN_0200A540
	movs r1, #6
	lsls r1, r1, #6
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
	movs r2, #9
	movs r3, #1
	bl FUN_0200A540
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
	bl FUN_0200A3C8
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r2, #1
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0x27
	subs r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r3, #0
	bl FUN_0200A480
	movs r1, #0x63
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
	movs r2, #8
	bl FUN_0200A540
	movs r1, #0x19
	lsls r1, r1, #4
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
	movs r2, #9
	bl FUN_0200A540
	movs r1, #0x65
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0x1c
	ldr r0, [r5, r1]
	bl FUN_0200ACF0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200ACF0
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov52_021E870C

	thumb_func_start ov52_021E888C
ov52_021E888C: @ 0x021E888C
	push {r3, r4, lr}
	sub sp, #0x5c
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	subs r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r2, #0x5a
	str r1, [sp, #0x10]
	lsls r2, r2, #2
	ldr r0, [r4, r2]
	adds r3, r1, #0
	str r0, [sp, #0x14]
	adds r0, r2, #4
	ldr r0, [r4, r0]
	str r0, [sp, #0x18]
	adds r0, r2, #0
	adds r0, #8
	ldr r0, [r4, r0]
	str r0, [sp, #0x1c]
	adds r0, r2, #0
	adds r0, #0xc
	ldr r0, [r4, r0]
	adds r2, #0x30
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	adds r0, r4, r2
	adds r2, r1, #0
	str r1, [sp, #0x28]
	bl FUN_02009D48
	movs r1, #1
	movs r3, #0x5a
	str r1, [sp]
	subs r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsls r3, r3, #2
	ldr r2, [r4, r3]
	str r2, [sp, #0x14]
	adds r2, r3, #4
	ldr r2, [r4, r2]
	str r2, [sp, #0x18]
	adds r2, r3, #0
	adds r2, #8
	ldr r2, [r4, r2]
	str r2, [sp, #0x1c]
	adds r2, r3, #0
	adds r2, #0xc
	ldr r2, [r4, r2]
	adds r3, #0x54
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r4, r3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02009D48
	ldr r0, [r4, #0x3c]
	movs r2, #0
	str r0, [sp, #0x2c]
	movs r0, #0x66
	lsls r0, r0, #2
	adds r1, r4, r0
	str r1, [sp, #0x30]
	movs r1, #1
	lsls r1, r1, #0xc
	adds r0, #0x24
	str r2, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r1, [sp, #0x44]
	str r1, [sp, #0x48]
	add r1, sp, #0x2c
	strh r2, [r1, #0x20]
	movs r1, #1
	adds r0, r4, r0
	str r0, [sp, #0x30]
	movs r0, #0xe
	lsls r0, r0, #0x10
	str r0, [sp, #0x34]
	movs r0, #0xaf
	lsls r0, r0, #0xc
	str r0, [sp, #0x38]
	str r1, [sp, #0x50]
	str r1, [sp, #0x54]
	movs r1, #0x27
	add r0, sp, #0x2c
	str r1, [sp, #0x58]
	bl FUN_02024624
	movs r1, #0x25
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_020248F0
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024A14
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_02024A04
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x5c
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov52_021E888C

	thumb_func_start ov52_021E8994
ov52_021E8994: @ 0x021E8994
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r2, #0
	movs r0, #2
	movs r2, #0
	adds r6, r1, #0
	adds r7, r3, #0
	bl FUN_02002F30
	adds r3, r0, #0
	str r4, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	adds r1, r7, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrb r4, [r5, #7]
	adds r0, r5, #0
	adds r2, r6, #0
	lsls r4, r4, #3
	subs r4, r4, r3
	lsrs r3, r4, #0x1f
	adds r3, r4, r3
	asrs r3, r3, #1
	bl FUN_020200FC
	ldr r0, [r5, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov52_021E8994

	thumb_func_start ov52_021E89D4
ov52_021E89D4: @ 0x021E89D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x28
	movs r1, #0xb5
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r0, [r5]
	adds r1, r5, r1
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0xb5
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #9
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #8
	movs r1, #0xb1
	lsls r1, r1, #2
	str r0, [sp, #8]
	movs r2, #1
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, [r5]
	adds r1, r5, r1
	movs r3, #4
	bl FUN_0201D40C
	movs r0, #0xb1
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #2
	bl FUN_0201D978
	movs r0, #0x15
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0xc1
	movs r1, #0xb9
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r0, [r5]
	adds r1, r5, r1
	movs r2, #1
	movs r3, #0x1a
	bl FUN_0201D40C
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _021E8B84 @ =0x000E0702
	movs r2, #1
	str r0, [sp]
	movs r0, #0xb9
	lsls r0, r0, #2
	ldr r1, [r5, #0x2c]
	adds r0, r5, r0
	movs r3, #2
	bl ov52_021E8994
	movs r1, #2
	lsls r1, r1, #8
	blx FUN_020D2894
	movs r4, #0
	ldr r0, _021E8B88 @ =0x00005B9C
	str r4, [sp, #0x18]
	adds r7, r4, #0
	adds r6, r5, r0
_021E8A8A:
	movs r0, #0
	str r0, [sp]
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #4
	movs r2, #2
	adds r3, r4, #0
	str r6, [sp, #4]
	bl FUN_02013A50
	movs r1, #1
	adds r0, r6, #0
	lsls r1, r1, #8
	blx FUN_020D2894
	movs r2, #1
	adds r0, r6, #0
	adds r1, r7, #0
	lsls r2, r2, #8
	blx FUN_020CFE74
	movs r0, #1
	lsls r0, r0, #8
	adds r7, r7, r0
	ldr r0, [sp, #0x18]
	adds r4, r4, #4
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #2
	blt _021E8A8A
	movs r3, #2
	str r3, [sp]
	movs r0, #0x1c
	str r0, [sp, #4]
	movs r1, #0xbd
	lsls r1, r1, #2
	str r3, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0xd1
	str r0, [sp, #0x10]
	ldr r0, [r5]
	adds r1, r5, r1
	movs r2, #1
	bl FUN_0201D40C
	ldr r1, [r5, #0x30]
	movs r0, #1
	movs r2, #0
	bl FUN_02002F30
	adds r4, r0, #0
	movs r0, #0xbd
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r3, #0xe0
	subs r4, r3, r4
	lsrs r3, r4, #0x1f
	adds r3, r4, r3
	ldr r0, _021E8B8C @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r2, [r5, #0x30]
	adds r0, r5, r0
	movs r1, #1
	asrs r3, r3, #1
	bl FUN_020200FC
	movs r0, #0
	str r0, [sp, #0x14]
	movs r0, #0x9d
	lsls r0, r0, #2
	movs r7, #1
	movs r6, #3
	adds r4, r5, r0
_021E8B32:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [r5]
	adds r1, r4, #0
	movs r2, #4
	movs r3, #5
	bl FUN_0201D40C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x14]
	adds r7, #0x14
	adds r0, r0, #1
	adds r6, r6, #4
	adds r4, #0x10
	str r0, [sp, #0x14]
	cmp r0, #5
	blt _021E8B32
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r2, _021E8B90 @ =0x000E0D0F
	adds r0, r5, r0
	movs r1, #0
	adds r3, r5, #0
	bl ov52_021E925C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021E8B84: .4byte 0x000E0702
_021E8B88: .4byte 0x00005B9C
_021E8B8C: .4byte 0x00010200
_021E8B90: .4byte 0x000E0D0F
	thumb_func_end ov52_021E89D4

	thumb_func_start ov52_021E8B94
ov52_021E8B94: @ 0x021E8B94
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x9d
	lsls r0, r0, #2
	movs r4, #0
	adds r5, r6, r0
_021E8BA0:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #5
	blt _021E8BA0
	movs r0, #0xbd
	lsls r0, r0, #2
	adds r0, r6, r0
	bl FUN_0201D520
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r0, r6, r0
	bl FUN_0201D520
	movs r0, #0xb1
	lsls r0, r0, #2
	adds r0, r6, r0
	bl FUN_0201D520
	movs r0, #0xb5
	lsls r0, r0, #2
	adds r0, r6, r0
	bl FUN_0201D520
	pop {r4, r5, r6, pc}
	thumb_func_end ov52_021E8B94

	thumb_func_start ov52_021E8BD8
ov52_021E8BD8: @ 0x021E8BD8
	bx lr
	.align 2, 0
	thumb_func_end ov52_021E8BD8

	thumb_func_start ov52_021E8BDC
ov52_021E8BDC: @ 0x021E8BDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r4, r0, #0
	ldr r0, _021E8CA4 @ =0x021E94BA
	bl FUN_02025224
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _021E8C30
	cmp r1, #0
	bne _021E8C22
	movs r0, #0xc3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021E8C30
	adds r0, r4, #0
	movs r1, #0xa
	bl ov52_021E927C
	movs r0, #0xc3
	movs r1, #2
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, #0xbc
	adds r0, r4, r0
	movs r1, #1
	bl ov52_021E8CDC
	ldr r0, _021E8CA8 @ =0x000005DD
	bl FUN_0200604C
	b _021E8C30
_021E8C22:
	ldr r0, _021E8CAC @ =0x0000431A
	strb r1, [r4, r0]
	movs r0, #0x25
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov52_021E8CBC
_021E8C30:
	ldr r0, _021E8CB0 @ =0x021E94B2
	bl FUN_02025204
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021E8C44
	adds r0, r4, #0
	bl ov52_021E9364
_021E8C44:
	add r0, sp, #0
	movs r1, #4
	movs r2, #1
	bl FUN_02021280
	cmp r0, #1
	bne _021E8CA0
	add r7, sp, #0
	ldrh r3, [r7]
	movs r1, #0
	cmp r3, #0
	ble _021E8C78
	ldr r5, _021E8CB4 @ =0x0000431C
	add r2, sp, #0
	adds r6, r5, #0
	adds r6, #8
_021E8C64:
	ldrh r3, [r2, #2]
	adds r0, r4, r1
	adds r1, r1, #1
	strb r3, [r0, r5]
	ldrh r3, [r2, #4]
	adds r2, #8
	strb r3, [r0, r6]
	ldrh r3, [r7]
	cmp r1, r3
	blt _021E8C64
_021E8C78:
	ldr r0, _021E8CB8 @ =0x0000432C
	movs r2, #0xf0
	ldrb r1, [r4, r0]
	bics r1, r2
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x18
	orrs r1, r2
	strb r1, [r4, r0]
	ldrb r3, [r4, r0]
	movs r1, #0xf
	bics r3, r1
	adds r1, r0, #0
	subs r1, #0x12
	ldrb r2, [r4, r1]
	movs r1, #0xf
	ands r1, r2
	orrs r1, r3
	strb r1, [r4, r0]
_021E8CA0:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E8CA4: .4byte 0x021E94BA
_021E8CA8: .4byte 0x000005DD
_021E8CAC: .4byte 0x0000431A
_021E8CB0: .4byte 0x021E94B2
_021E8CB4: .4byte 0x0000431C
_021E8CB8: .4byte 0x0000432C
	thumb_func_end ov52_021E8BDC

	thumb_func_start ov52_021E8CBC
ov52_021E8CBC: @ 0x021E8CBC
	push {r3, lr}
	ldr r2, _021E8CD8 @ =_021E94AC
	cmp r1, #0
	ldr r0, [r0]
	bne _021E8CD0
	ldrh r1, [r2, #4]
	adds r1, r1, #1
	bl FUN_020248F0
	pop {r3, pc}
_021E8CD0:
	ldrh r1, [r2, #4]
	bl FUN_020248F0
	pop {r3, pc}
	.align 2, 0
_021E8CD8: .4byte _021E94AC
	thumb_func_end ov52_021E8CBC

	thumb_func_start ov52_021E8CDC
ov52_021E8CDC: @ 0x021E8CDC
	push {r3, lr}
	cmp r1, #1
	ldr r0, [r0]
	bne _021E8CEC
	movs r1, #1
	bl FUN_020248F0
	pop {r3, pc}
_021E8CEC:
	movs r1, #0
	bl FUN_020248F0
	pop {r3, pc}
	thumb_func_end ov52_021E8CDC

	thumb_func_start ov52_021E8CF4
ov52_021E8CF4: @ 0x021E8CF4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov52_021E8BDC
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r2, _021E8D34 @ =0x000E0C0F
	adds r0, r5, r0
	movs r1, #0
	adds r3, r5, #0
	bl ov52_021E925C
	adds r0, r5, #0
	bl ov52_021E9260
	adds r0, r5, #0
	bl ov52_021E9218
	ldr r2, _021E8D38 @ =0x0000432D
	movs r0, #0xb1
	lsls r0, r0, #2
	adds r1, r5, r2
	adds r2, #0x55
	adds r0, r5, r0
	adds r2, r5, r2
	movs r3, #1
	bl ov52_021E9158
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E8D34: .4byte 0x000E0C0F
_021E8D38: .4byte 0x0000432D
	thumb_func_end ov52_021E8CF4

	thumb_func_start ov52_021E8D3C
ov52_021E8D3C: @ 0x021E8D3C
	push {r4, lr}
	adds r4, r0, #0
	bl ov52_021E8BD8
	adds r0, r4, #0
	bl ov52_021E9218
	ldr r2, _021E8D60 @ =0x0000432D
	movs r0, #0xb1
	lsls r0, r0, #2
	adds r1, r4, r2
	adds r2, #0x55
	adds r0, r4, r0
	adds r2, r4, r2
	movs r3, #0
	bl ov52_021E9158
	pop {r4, pc}
	.align 2, 0
_021E8D60: .4byte 0x0000432D
	thumb_func_end ov52_021E8D3C

	thumb_func_start ov52_021E8D64
ov52_021E8D64: @ 0x021E8D64
	push {lr}
	sub sp, #0x14
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0xb4
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	movs r2, #0x19
	add r0, sp, #0
	strb r2, [r0, #0x10]
	movs r2, #6
	strb r2, [r0, #0x11]
	adds r0, r1, #0
	add r1, sp, #0
	bl FUN_020166FC
	add sp, #0x14
	pop {pc}
	thumb_func_end ov52_021E8D64

	thumb_func_start ov52_021E8D8C
ov52_021E8D8C: @ 0x021E8D8C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	adds r4, r1, #0
	bl ov52_021E92E8
	cmp r0, #0
	beq _021E8DB6
	ldr r1, _021E8DC0 @ =0x00005C9C
	ldr r0, [r5]
	ldr r1, [r5, r1]
	bl ov52_021E8D64
	adds r0, r5, #0
	movs r1, #1
	bl ov52_021E9488
	movs r0, #0xc3
	movs r1, #3
	lsls r0, r0, #2
	str r1, [r5, r0]
_021E8DB6:
	adds r0, r5, #0
	bl ov52_021E8D3C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E8DC0: .4byte 0x00005C9C
	thumb_func_end ov52_021E8D8C

	thumb_func_start ov52_021E8DC4
ov52_021E8DC4: @ 0x021E8DC4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _021E8E5C @ =0x00005C9C
	adds r4, r1, #0
	ldr r0, [r5, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021E8DDE
	cmp r0, #2
	beq _021E8E20
	b _021E8E46
_021E8DDE:
	ldr r0, [r5, #8]
	movs r1, #4
	bl FUN_0202D1C0
	ldr r0, [r5, #8]
	movs r1, #0x73
	bl FUN_0202D0FC
	movs r0, #0xb5
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #1
	bl FUN_0200E9BC
	ldr r0, _021E8E5C @ =0x00005C9C
	ldr r0, [r5, r0]
	bl FUN_020169CC
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x27
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	add sp, #0xc
	movs r0, #2
	pop {r4, r5, pc}
_021E8E20:
	movs r0, #0xc3
	movs r1, #4
	lsls r0, r0, #2
	str r1, [r5, r0]
	subs r0, #0xbc
	adds r0, r5, r0
	movs r1, #0
	bl ov52_021E8CDC
	movs r0, #0xb5
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #1
	bl FUN_0200E9BC
	ldr r0, _021E8E5C @ =0x00005C9C
	ldr r0, [r5, r0]
	bl FUN_020169CC
_021E8E46:
	ldr r1, _021E8E60 @ =0x0000432C
	movs r0, #0xf0
	ldrb r2, [r5, r1]
	bics r2, r0
	adds r0, r5, #0
	strb r2, [r5, r1]
	bl ov52_021E8D3C
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_021E8E5C: .4byte 0x00005C9C
_021E8E60: .4byte 0x0000432C
	thumb_func_end ov52_021E8DC4

	thumb_func_start ov52_021E8E64
ov52_021E8E64: @ 0x021E8E64
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021E8ED8 @ =0x00005C9C
	adds r4, r1, #0
	ldr r0, [r5, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021E8E7C
	cmp r0, #2
	beq _021E8EB4
	b _021E8ED4
_021E8E7C:
	movs r0, #0xc3
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r5, r0]
	subs r0, #0x38
	adds r0, r5, r0
	bl FUN_0200E9BC
	ldr r0, _021E8ED8 @ =0x00005C9C
	ldr r0, [r5, r0]
	bl FUN_020169CC
	adds r0, r5, #0
	movs r1, #0
	bl ov52_021E9488
	movs r0, #0xb1
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #2
	bl FUN_0201D978
	movs r0, #0xb1
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D578
	b _021E8ED4
_021E8EB4:
	movs r0, #0xc3
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r5, r0]
	subs r0, #0x38
	adds r0, r5, r0
	bl FUN_0200E9BC
	ldr r0, _021E8ED8 @ =0x00005C9C
	ldr r0, [r5, r0]
	bl FUN_020169CC
	adds r0, r5, #0
	movs r1, #0
	bl ov52_021E9488
_021E8ED4:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E8ED8: .4byte 0x00005C9C
	thumb_func_end ov52_021E8E64

	thumb_func_start ov52_021E8EDC
ov52_021E8EDC: @ 0x021E8EDC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0xb
	adds r5, r0, #0
	bl ov52_021E927C
	movs r0, #0xc3
	movs r1, #5
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov52_021E8D3C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov52_021E8EDC

	thumb_func_start ov52_021E8EFC
ov52_021E8EFC: @ 0x021E8EFC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	adds r4, r1, #0
	bl ov52_021E92E8
	cmp r0, #0
	beq _021E8F1E
	movs r0, #0xc3
	movs r1, #6
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r1, _021E8F28 @ =0x00005C9C
	ldr r0, [r5]
	ldr r1, [r5, r1]
	bl ov52_021E8D64
_021E8F1E:
	adds r0, r5, #0
	bl ov52_021E8D3C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E8F28: .4byte 0x00005C9C
	thumb_func_end ov52_021E8EFC

	thumb_func_start ov52_021E8F2C
ov52_021E8F2C: @ 0x021E8F2C
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
	bge _021E8F58
	rsbs r0, r4, #0
	cmp r0, r2
	ble _021E8F4C
	adds r0, r2, #0
_021E8F4C:
	ldr r5, [sp, #0x30]
	movs r4, #0
	subs r5, r5, r0
	adds r6, r6, r0
	str r5, [sp, #0x30]
	subs r2, r2, r0
_021E8F58:
	cmp r3, #0
	bge _021E8F70
	rsbs r0, r3, #0
	cmp r0, r1
	ble _021E8F64
	adds r0, r1, #0
_021E8F64:
	ldr r5, [sp, #0x34]
	movs r3, #0
	subs r5, r5, r0
	adds r7, r7, r0
	str r5, [sp, #0x34]
	subs r1, r1, r0
_021E8F70:
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
	thumb_func_end ov52_021E8F2C

	thumb_func_start ov52_021E8FAC
ov52_021E8FAC: @ 0x021E8FAC
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
	bne _021E8FEC
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	bne _021E8FEC
	ldr r0, [sp, #0x50]
	adds r1, r2, #0
	str r1, [r0]
	ldr r0, [sp, #0x54]
	adds r1, r3, #0
	str r1, [r0]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
_021E8FEC:
	ldr r0, [sp, #0x20]
	subs r0, r0, r4
	str r0, [sp, #0x34]
	bpl _021E8FF8
	rsbs r0, r0, #0
	str r0, [sp, #0x34]
_021E8FF8:
	ldr r0, [sp, #0x24]
	subs r7, r0, r5
	bpl _021E9000
	rsbs r7, r7, #0
_021E9000:
	ldr r0, [sp, #0x34]
	cmp r0, r7
	ble _021E908E
	ldr r0, [sp, #0x20]
	cmp r4, r0
	ble _021E9026
	ldr r0, [sp, #0x24]
	cmp r5, r0
	ble _021E9018
	movs r0, #1
	str r0, [sp, #0x2c]
	b _021E901E
_021E9018:
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x2c]
_021E901E:
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	b _021E9038
_021E9026:
	ldr r0, [sp, #0x24]
	cmp r5, r0
	bge _021E9032
	movs r0, #1
	str r0, [sp, #0x2c]
	b _021E9038
_021E9032:
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x2c]
_021E9038:
	movs r0, #4
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
	bl ov52_021E8F2C
	ldr r0, [sp, #0x34]
	adds r4, r4, #1
	asrs r6, r0, #1
	ldr r0, [sp, #0x38]
	cmp r4, r0
	bgt _021E9112
_021E905E:
	subs r6, r6, r7
	bpl _021E906A
	ldr r0, [sp, #0x34]
	adds r6, r6, r0
	ldr r0, [sp, #0x2c]
	adds r5, r5, r0
_021E906A:
	movs r0, #4
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
	bl ov52_021E8F2C
	ldr r0, [sp, #0x38]
	adds r4, r4, #1
	cmp r4, r0
	ble _021E905E
	b _021E9112
_021E908E:
	ldr r0, [sp, #0x24]
	cmp r5, r0
	ble _021E90AE
	ldr r0, [sp, #0x20]
	cmp r4, r0
	ble _021E90A0
	movs r0, #1
	str r0, [sp, #0x28]
	b _021E90A6
_021E90A0:
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x28]
_021E90A6:
	str r5, [sp, #0x30]
	ldr r5, [sp, #0x24]
	ldr r4, [sp, #0x20]
	b _021E90C0
_021E90AE:
	ldr r0, [sp, #0x20]
	cmp r4, r0
	bge _021E90BA
	movs r0, #1
	str r0, [sp, #0x28]
	b _021E90C0
_021E90BA:
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x28]
_021E90C0:
	movs r0, #4
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
	bl ov52_021E8F2C
	ldr r0, [sp, #0x30]
	adds r5, r5, #1
	asrs r6, r7, #1
	cmp r5, r0
	bgt _021E9112
_021E90E4:
	ldr r0, [sp, #0x34]
	subs r6, r6, r0
	bpl _021E90F0
	ldr r0, [sp, #0x28]
	adds r6, r6, r7
	adds r4, r4, r0
_021E90F0:
	movs r0, #4
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
	bl ov52_021E8F2C
	ldr r0, [sp, #0x30]
	adds r5, r5, #1
	cmp r5, r0
	ble _021E90E4
_021E9112:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x50]
	str r1, [r0]
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x54]
	str r1, [r0]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov52_021E8FAC

	thumb_func_start ov52_021E9124
ov52_021E9124: @ 0x021E9124
	movs r2, #0
_021E9126:
	ldrb r3, [r0, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x1c
	strh r3, [r1, #2]
	ldrb r3, [r0, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x1c
	beq _021E914A
	adds r3, r0, r3
	subs r3, r3, #1
	ldrb r3, [r3]
	strb r3, [r1]
	ldrb r3, [r0, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x1c
	adds r3, r0, r3
	ldrb r3, [r3, #7]
	strb r3, [r1, #1]
_021E914A:
	adds r2, r2, #1
	adds r0, #0x11
	adds r1, r1, #4
	cmp r2, #5
	blt _021E9126
	bx lr
	.align 2, 0
	thumb_func_end ov52_021E9124

	thumb_func_start ov52_021E9158
ov52_021E9158: @ 0x021E9158
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r7, r0, #0
	movs r0, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	adds r5, r1, #0
	adds r6, r2, #0
_021E916E:
	ldrb r0, [r5, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	beq _021E91D2
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _021E9188
	ldrb r0, [r6]
	subs r0, #0x20
	str r0, [sp, #0x28]
	ldrb r0, [r6, #1]
	subs r0, #0x48
	str r0, [sp, #0x24]
_021E9188:
	ldrb r0, [r5, #0x10]
	movs r4, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x1c
	cmp r1, #0
	ble _021E91D2
	movs r0, #1
	str r0, [sp, #0x1c]
	cmp r1, #0
	ble _021E91D2
_021E919C:
	add r0, sp, #0x28
	str r0, [sp]
	add r0, sp, #0x24
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldrh r0, [r6, #2]
	adds r3, r5, r4
	str r0, [sp, #0xc]
	ldrb r1, [r5, #0x10]
	ldrb r3, [r3, #8]
	adds r0, r7, #0
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	lsls r2, r1, #4
	ldr r1, _021E9214 @ =0x021E95A0
	subs r3, #0x48
	adds r1, r1, r2
	ldrb r2, [r5, r4]
	subs r2, #0x20
	bl ov52_021E8FAC
	ldrb r0, [r5, #0x10]
	adds r4, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r4, r0
	blt _021E919C
_021E91D2:
	ldr r0, [sp, #0x20]
	adds r5, #0x11
	adds r0, r0, #1
	adds r6, r6, #4
	str r0, [sp, #0x20]
	cmp r0, #5
	blt _021E916E
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _021E91F2
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _021E91F2
	adds r0, r7, #0
	bl FUN_0201D578
_021E91F2:
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl ov52_021E9124
	movs r3, #0
	movs r1, #0xf0
_021E91FE:
	ldr r0, [sp, #0x10]
	adds r3, r3, #1
	ldrb r2, [r0, #0x10]
	bics r2, r1
	strb r2, [r0, #0x10]
	adds r0, #0x11
	str r0, [sp, #0x10]
	cmp r3, #5
	blt _021E91FE
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E9214: .4byte 0x021E95A0
	thumb_func_end ov52_021E9158

	thumb_func_start ov52_021E9218
ov52_021E9218: @ 0x021E9218
	bx lr
	.align 2, 0
	thumb_func_end ov52_021E9218

	thumb_func_start ov52_021E921C
ov52_021E921C: @ 0x021E921C
	push {r3, lr}
	ldrh r1, [r0]
	adds r1, #0x14
	strh r1, [r0]
	ldrh r2, [r0]
	movs r1, #0x5a
	lsls r1, r1, #2
	cmp r2, r1
	bls _021E9232
	movs r1, #0
	strh r1, [r0]
_021E9232:
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
	thumb_func_end ov52_021E921C

	thumb_func_start ov52_021E925C
ov52_021E925C: @ 0x021E925C
	bx lr
	.align 2, 0
	thumb_func_end ov52_021E925C

	thumb_func_start ov52_021E9260
ov52_021E9260: @ 0x021E9260
	ldr r1, _021E9278 @ =0x0000431C
	adds r3, r0, r1
	adds r1, #0x11
	adds r2, r0, r1
	movs r1, #0x11
_021E926A:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _021E926A
	bx lr
	.align 2, 0
_021E9278: .4byte 0x0000431C
	thumb_func_end ov52_021E9260

	thumb_func_start ov52_021E927C
ov52_021E927C: @ 0x021E927C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x50
	movs r1, #0x27
	bl FUN_02026354
	adds r4, r0, #0
	ldr r0, [r5, #0x14]
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x34]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #0xb5
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0xb5
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	movs r2, #1
	movs r3, #0xa
	bl FUN_0200E998
	ldr r0, [r5, #0xc]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r2, [r5, #0x34]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	str r0, [r5, #0x38]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov52_021E927C

	thumb_func_start ov52_021E92E8
ov52_021E92E8: @ 0x021E92E8
	push {r3, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _021E92FA
	movs r0, #1
	pop {r3, pc}
_021E92FA:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov52_021E92E8

	thumb_func_start ov52_021E9300
ov52_021E9300: @ 0x021E9300
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0
	adds r5, r0, #0
	str r1, [sp]
	adds r4, r7, #0
	strb r7, [r5]
	adds r6, r7, #0
_021E930E:
	ldr r0, [sp]
	ldrb r1, [r0, r6]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _021E9324
	movs r0, #1
	ldrb r1, [r5]
	lsls r0, r4
	orrs r0, r1
	strb r0, [r5]
_021E9324:
	ldr r0, [sp]
	ldrb r0, [r0, r6]
	asrs r0, r0, #4
	cmp r0, #1
	bne _021E933A
	ldrb r0, [r5]
	adds r2, r4, #1
	movs r1, #1
	lsls r1, r2
	orrs r0, r1
	strb r0, [r5]
_021E933A:
	adds r4, r4, #2
	cmp r4, #8
	bne _021E934A
	movs r0, #0
	adds r5, r5, #1
	adds r7, r7, #1
	strb r0, [r5]
	adds r4, r0, #0
_021E934A:
	movs r0, #6
	lsls r0, r0, #0xa
	cmp r7, r0
	blt _021E9356
	bl GF_AssertFail
_021E9356:
	movs r0, #6
	adds r6, r6, #1
	lsls r0, r0, #0xa
	cmp r6, r0
	blt _021E930E
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov52_021E9300

	thumb_func_start ov52_021E9364
ov52_021E9364: @ 0x021E9364
	push {r3, r4, r5, lr}
	ldr r1, _021E9410 @ =0x021D114C
	adds r4, r0, #0
	ldrh r0, [r1, #0x20]
	ldr r3, _021E9414 @ =0x0000FFFF
	cmp r0, r3
	beq _021E93FE
	ldrh r1, [r1, #0x22]
	cmp r1, r3
	beq _021E93FE
	ldr r2, _021E9418 @ =0x00005CA8
	ldr r5, [r4, r2]
	cmp r5, r3
	beq _021E93FE
	adds r1, r2, #4
	ldr r1, [r4, r1]
	cmp r1, r3
	beq _021E93FE
	cmp r5, r0
	ble _021E9394
	movs r1, #0
	subs r3, r5, r0
	mvns r1, r1
	b _021E9398
_021E9394:
	subs r3, r0, r5
	movs r1, #1
_021E9398:
	subs r0, r2, #6
	strb r1, [r4, r0]
	cmp r3, #3
	blt _021E93CE
	cmp r3, #0x28
	bgt _021E93CE
	ldr r0, _021E9410 @ =0x021D114C
	ldrh r2, [r0, #0x22]
	ldr r0, _021E941C @ =0x00005CAC
	ldr r1, [r4, r0]
	cmp r1, r2
	ble _021E93B8
	subs r2, r1, r2
	movs r1, #0
	mvns r1, r1
	b _021E93BC
_021E93B8:
	subs r2, r2, r1
	movs r1, #1
_021E93BC:
	subs r0, #9
	strb r1, [r4, r0]
	cmp r2, #0x28
	bgt _021E93FE
	ldr r0, _021E9420 @ =0x00005CA0
	adds r0, r4, r0
	bl ov52_021E9424
	b _021E93FE
_021E93CE:
	cmp r3, #0x28
	bgt _021E93FE
	ldr r0, _021E9410 @ =0x021D114C
	ldrh r2, [r0, #0x22]
	ldr r0, _021E941C @ =0x00005CAC
	ldr r1, [r4, r0]
	cmp r1, r2
	ble _021E93E6
	subs r2, r1, r2
	movs r1, #0
	mvns r1, r1
	b _021E93EA
_021E93E6:
	subs r2, r2, r1
	movs r1, #1
_021E93EA:
	subs r0, #9
	strb r1, [r4, r0]
	cmp r2, #3
	blt _021E93FE
	cmp r2, #0x28
	bgt _021E93FE
	ldr r0, _021E9420 @ =0x00005CA0
	adds r0, r4, r0
	bl ov52_021E9424
_021E93FE:
	ldr r1, _021E9410 @ =0x021D114C
	ldr r0, _021E9418 @ =0x00005CA8
	ldrh r2, [r1, #0x20]
	str r2, [r4, r0]
	ldrh r1, [r1, #0x22]
	adds r0, r0, #4
	str r1, [r4, r0]
	pop {r3, r4, r5, pc}
	nop
_021E9410: .4byte 0x021D114C
_021E9414: .4byte 0x0000FFFF
_021E9418: .4byte 0x00005CA8
_021E941C: .4byte 0x00005CAC
_021E9420: .4byte 0x00005CA0
	thumb_func_end ov52_021E9364

	thumb_func_start ov52_021E9424
ov52_021E9424: @ 0x021E9424
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _021E9448
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _021E9448
	ldr r0, _021E9484 @ =0x00000699
	bl FUN_02006184
	cmp r0, #0
	bne _021E9448
	ldr r0, _021E9484 @ =0x00000699
	bl FUN_0200604C
_021E9448:
	movs r0, #0
	ldrsb r1, [r4, r0]
	movs r0, #2
	ldrsb r0, [r4, r0]
	muls r0, r1, r0
	bmi _021E9460
	movs r0, #1
	ldrsb r1, [r4, r0]
	movs r0, #3
	ldrsb r0, [r4, r0]
	muls r0, r1, r0
	bpl _021E9470
_021E9460:
	ldr r0, _021E9484 @ =0x00000699
	bl FUN_02006184
	cmp r0, #0
	bne _021E9470
	ldr r0, _021E9484 @ =0x00000699
	bl FUN_0200604C
_021E9470:
	movs r0, #2
	ldrsb r0, [r4, r0]
	strb r0, [r4]
	movs r0, #3
	ldrsb r0, [r4, r0]
	strb r0, [r4, #1]
	movs r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	pop {r4, pc}
	.align 2, 0
_021E9484: .4byte 0x00000699
	thumb_func_end ov52_021E9424

	thumb_func_start ov52_021E9488
ov52_021E9488: @ 0x021E9488
	push {r3, lr}
	cmp r1, #1
	bne _021E949C
	movs r1, #0x25
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_02024830
	pop {r3, pc}
_021E949C:
	movs r1, #0x25
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	movs r1, #1
	bl FUN_02024830
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov52_021E9488

	.rodata

_021E94AC:
	.byte 0xE0, 0x00, 0xAF, 0x00
	.byte 0x00, 0x00, 0x48, 0x88, 0x20, 0xE0, 0xFF, 0x00, 0x00, 0x00, 0xA6, 0xC0, 0xCB, 0xFF, 0xFF, 0x00
	.byte 0x00, 0x00, 0xA6, 0xC0, 0x00, 0x5F, 0xA6, 0xC0, 0x60, 0xBF, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x01, 0x00, 0x00, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x11, 0x11, 0x10, 0x01, 0x10, 0x11, 0x10, 0x01, 0x11, 0x11, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x22, 0x22, 0x20, 0x02, 0x22, 0x22, 0x20, 0x02, 0x22, 0x22, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_021E96C0:
	.byte 0x00, 0x00, 0x00, 0x00, 0xF5, 0x8C, 0x1E, 0x02, 0x8D, 0x8D, 0x1E, 0x02, 0xC5, 0x8D, 0x1E, 0x02
	.byte 0xDD, 0x8E, 0x1E, 0x02, 0xFD, 0x8E, 0x1E, 0x02, 0x65, 0x8E, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00
	@ 0x021E96E0
