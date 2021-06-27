
	thumb_func_start ov29_0225D520
ov29_0225D520: @ 0x0225D520
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	adds r6, r1, #0
	movs r0, #3
	adds r7, r2, #0
	movs r1, #8
	lsls r2, r0, #0xf
	adds r5, r3, #0
	bl FUN_0201A910
	ldr r0, _0225D5E0 @ =0x04001050
	movs r1, #0
	strh r1, [r0]
	movs r1, #0x81
	ldr r0, _0225D5E4 @ =ov29_0225DCD0
	lsls r1, r1, #2
	movs r2, #0xa
	movs r3, #8
	bl FUN_02007200
	str r0, [sp, #4]
	bl FUN_0201F988
	adds r4, r0, #0
	ldr r0, [sp]
	movs r1, #0x7f
	str r0, [r4]
	str r6, [r4, #4]
	str r7, [r4, #8]
	ldr r0, [sp, #4]
	str r5, [r4, #0xc]
	str r0, [r4, #0x14]
	movs r0, #0
	str r5, [r4, #0x10]
	mvns r0, r0
	str r0, [r5, #4]
	movs r5, #0
	lsls r1, r1, #2
	str r5, [r4, r1]
	ldr r1, [r4, #0x10]
	ldr r0, _0225D5E8 @ =0x000186A0
	ldr r6, [r1]
	movs r7, #0xa
_0225D578:
	cmp r6, r0
	blo _0225D588
	movs r0, #6
	subs r1, r0, r5
	movs r0, #0x7f
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0225D594
_0225D588:
	adds r1, r7, #0
	blx FUN_020F2BA4
	adds r5, r5, #1
	cmp r5, #6
	blo _0225D578
_0225D594:
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _0225D5A2
	movs r1, #1
	str r1, [r4, r0]
_0225D5A2:
	movs r0, #0xee
	movs r1, #8
	bl FUN_02007688
	adds r5, r0, #0
	bl ov29_0225D620
	ldr r0, [sp]
	bl ov29_0225D648
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov29_0225D6C8
	adds r0, r4, #0
	bl ov29_0225D714
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov29_0225D7F0
	adds r0, r4, #0
	bl ov29_0225DBF0
	adds r0, r5, #0
	bl FUN_0200770C
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D5E0: .4byte 0x04001050
_0225D5E4: .4byte ov29_0225DCD0
_0225D5E8: .4byte 0x000186A0
	thumb_func_end ov29_0225D520

	thumb_func_start ov29_0225D5EC
ov29_0225D5EC: @ 0x0225D5EC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r0, r5, #0
	bl FUN_0201F988
	adds r4, r0, #0
	bl ov29_0225DC34
	adds r0, r4, #0
	bl ov29_0225D828
	adds r0, r4, #0
	bl ov29_0225D7D4
	ldr r0, [r4]
	bl ov29_0225D6B4
	adds r0, r5, #0
	bl FUN_02007234
	movs r0, #8
	bl FUN_0201A9C4
	pop {r3, r4, r5, pc}
	thumb_func_end ov29_0225D5EC

	thumb_func_start ov29_0225D61C
ov29_0225D61C: @ 0x0225D61C
	movs r0, #1
	bx lr
	thumb_func_end ov29_0225D61C

	thumb_func_start ov29_0225D620
ov29_0225D620: @ 0x0225D620
	push {r3, lr}
	movs r0, #0x80
	blx FUN_020CE650
	movs r0, #1
	lsls r0, r0, #8
	blx FUN_020CE6F8
	ldr r2, _0225D640 @ =0x04001000
	ldr r0, _0225D644 @ =0xFFCFFFEF
	ldr r1, [r2]
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_0225D640: .4byte 0x04001000
_0225D644: .4byte 0xFFCFFFEF
	thumb_func_end ov29_0225D620

	thumb_func_start ov29_0225D648
ov29_0225D648: @ 0x0225D648
	push {r3, r4, r5, lr}
	sub sp, #0x38
	adds r4, r0, #0
	movs r0, #0
	blx FUN_020CDA64
	ldr r5, _0225D6AC @ =0x0225E1C8
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
	movs r3, #8
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _0225D6B0 @ =0x0225E200
	add r3, sp, #0
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #5
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	add sp, #0x38
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225D6AC: .4byte 0x0225E1C8
_0225D6B0: .4byte 0x0225E200
	thumb_func_end ov29_0225D648

	thumb_func_start ov29_0225D6B4
ov29_0225D6B4: @ 0x0225D6B4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	pop {r4, pc}
	thumb_func_end ov29_0225D6B4

	thumb_func_start ov29_0225D6C8
ov29_0225D6C8: @ 0x0225D6C8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	adds r4, r1, #0
	ldr r2, [r5]
	adds r0, r4, #0
	movs r1, #9
	movs r3, #5
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r4, #0
	movs r1, #0xa
	movs r3, #5
	bl FUN_02007B68
	movs r3, #0
	str r3, [sp]
	movs r1, #8
	adds r0, r4, #0
	movs r2, #4
	str r1, [sp, #4]
	bl FUN_02007B8C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov29_0225D6C8

	thumb_func_start ov29_0225D714
ov29_0225D714: @ 0x0225D714
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xc4
	movs r3, #8
	bl FUN_0200BAF8
	str r0, [sp, #0x18]
	movs r0, #4
	movs r1, #8
	bl FUN_02002CEC
	movs r1, #0x1a
	ldr r0, [sp, #0x10]
	lsls r1, r1, #4
	movs r6, #0
	adds r5, r0, r1
_0225D73A:
	ldr r0, [sp, #0x10]
	ldr r2, _0225D7CC @ =0x0225E178
	lsls r4, r6, #4
	lsls r3, r6, #3
	ldr r0, [r0]
	adds r1, r5, r4
	adds r2, r2, r3
	bl FUN_0201D4F8
	adds r0, r5, r4
	movs r1, #0
	bl FUN_0201D978
	adds r1, r6, #0
	ldr r0, [sp, #0x18]
	adds r1, #0x18
	bl FUN_0200BBA0
	adds r7, r0, #0
	adds r0, r5, r4
	bl FUN_0201EE90
	lsls r1, r0, #3
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	movs r0, #4
	adds r1, r7, #0
	movs r2, #0
	bl FUN_02002F30
	lsrs r1, r0, #1
	ldr r0, [sp, #0x14]
	adds r2, r7, #0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D7D0 @ =0x000F0E00
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r5, r4
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r5, r4
	bl FUN_0201D8A0
	adds r0, r5, r4
	bl FUN_0201D5C8
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #3
	blo _0225D73A
	movs r0, #4
	bl FUN_02002DB4
	ldr r0, [sp, #0x18]
	bl FUN_0200BB44
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225D7CC: .4byte 0x0225E178
_0225D7D0: .4byte 0x000F0E00
	thumb_func_end ov29_0225D714

	thumb_func_start ov29_0225D7D4
ov29_0225D7D4: @ 0x0225D7D4
	push {r3, r4, r5, lr}
	movs r1, #0x1a
	lsls r1, r1, #4
	movs r4, #0
	adds r5, r0, r1
_0225D7DE:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blo _0225D7DE
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov29_0225D7D4

	thumb_func_start ov29_0225D7F0
ov29_0225D7F0: @ 0x0225D7F0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r5, #0
	movs r0, #0xb
	adds r1, #0x1c
	movs r2, #8
	bl FUN_02009F40
	str r0, [r5, #0x18]
	adds r0, r5, #0
	movs r2, #1
	adds r0, #0x1c
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	adds r0, r5, #0
	bl ov29_0225D840
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov29_0225D9C8
	adds r0, r5, #0
	bl ov29_0225DC84
	pop {r3, r4, r5, pc}
	thumb_func_end ov29_0225D7F0

	thumb_func_start ov29_0225D828
ov29_0225D828: @ 0x0225D828
	push {r4, lr}
	adds r4, r0, #0
	bl ov29_0225DB38
	adds r0, r4, #0
	bl ov29_0225D864
	ldr r0, [r4, #0x18]
	bl FUN_02024504
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov29_0225D828

	thumb_func_start ov29_0225D840
ov29_0225D840: @ 0x0225D840
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0x51
	adds r5, r0, #0
	movs r4, #0
	movs r7, #2
	lsls r6, r6, #2
_0225D84C:
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #8
	bl FUN_0200A090
	str r0, [r5, r6]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0225D84C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov29_0225D840

	thumb_func_start ov29_0225D864
ov29_0225D864: @ 0x0225D864
	push {r4, r5, r6, lr}
	movs r6, #0x51
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_0225D86E:
	ldr r0, [r5, r6]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0225D86E
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov29_0225D864

	thumb_func_start ov29_0225D880
ov29_0225D880: @ 0x0225D880
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [sp, #0x30]
	adds r6, r2, #0
	str r0, [sp]
	movs r0, #2
	adds r4, r1, #0
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	adds r2, r3, #0
	ldr r0, [r4]
	adds r1, r6, #0
	movs r3, #0
	bl FUN_0200A3C8
	str r0, [r5]
	bl FUN_0200ADA4
	ldr r0, [r5]
	bl FUN_0200A740
	ldr r0, [sp, #0x34]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	adds r1, r6, #0
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	movs r3, #0
	bl FUN_0200A480
	str r0, [r5, #4]
	bl FUN_0200B00C
	ldr r0, [r5, #4]
	bl FUN_0200A740
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x24]
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	adds r1, r6, #0
	movs r3, #0
	bl FUN_0200A540
	str r0, [r5, #8]
	ldr r0, [sp, #0x3c]
	ldr r2, [sp, #0x28]
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	adds r1, r6, #0
	movs r3, #0
	bl FUN_0200A540
	str r0, [r5, #0xc]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov29_0225D880

	thumb_func_start ov29_0225D910
ov29_0225D910: @ 0x0225D910
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	adds r7, r2, #0
	adds r6, r3, #0
	bl FUN_0200A7FC
	str r0, [sp, #0x2c]
	ldr r0, [r5, #4]
	bl FUN_0200A7FC
	str r0, [sp, #0x30]
	ldr r0, [r5, #8]
	bl FUN_0200A7FC
	str r0, [sp, #0x34]
	ldr r0, [r5, #0xc]
	bl FUN_0200A7FC
	str r0, [sp]
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	ldr r1, [r4]
	ldr r2, [sp, #0x30]
	str r1, [sp, #0x14]
	ldr r1, [r4, #4]
	ldr r3, [sp, #0x34]
	str r1, [sp, #0x18]
	ldr r1, [r4, #8]
	str r1, [sp, #0x1c]
	ldr r1, [r4, #0xc]
	str r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	adds r0, r7, #0
	bl FUN_02009D48
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov29_0225D910

	thumb_func_start ov29_0225D970
ov29_0225D970: @ 0x0225D970
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r5, r3, #0
	ldr r3, [r0, #0x18]
	lsls r6, r1, #2
	str r3, [sp]
	str r2, [sp, #4]
	ldrb r2, [r5]
	lsls r2, r2, #0xc
	str r2, [sp, #8]
	ldrb r2, [r5, #1]
	lsls r3, r2, #0xc
	movs r2, #1
	lsls r2, r2, #0x14
	adds r3, r3, r2
	lsrs r2, r2, #8
	str r3, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	str r2, [sp, #0x14]
	str r2, [sp, #0x18]
	str r2, [sp, #0x1c]
	add r2, sp, #0
	strh r3, [r2, #0x20]
	ldrb r2, [r5, #2]
	str r2, [sp, #0x24]
	movs r2, #2
	str r2, [sp, #0x28]
	movs r2, #8
	str r2, [sp, #0x2c]
	movs r2, #0x5d
	lsls r2, r2, #2
	adds r4, r0, r2
	add r0, sp, #0
	bl FUN_02024624
	str r0, [r4, r6]
	ldrb r1, [r5, #3]
	ldr r0, [r4, r6]
	bl FUN_020248F0
	add sp, #0x30
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov29_0225D970

	thumb_func_start ov29_0225D9C8
ov29_0225D9C8: @ 0x0225D9C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r6, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #7
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #2
	str r0, [sp, #0xc]
	ldr r0, _0225DB04 @ =0x00000399
	movs r1, #0x55
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	lsls r1, r1, #2
	str r0, [sp, #0x1c]
	adds r0, r6, r1
	subs r1, #0x10
	adds r1, r6, r1
	adds r2, r4, #0
	movs r3, #5
	bl ov29_0225D880
	movs r1, #0x55
	lsls r1, r1, #2
	adds r0, r6, r1
	subs r1, #0x10
	adds r1, r6, r1
	add r2, sp, #0x20
	movs r3, #1
	bl ov29_0225D910
	ldr r3, _0225DB08 @ =0x0225E21C
	adds r0, r6, #0
	movs r1, #0
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB0C @ =0x0225E220
	adds r0, r6, #0
	movs r1, #1
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB10 @ =0x0225E224
	adds r0, r6, #0
	movs r1, #2
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB14 @ =0x0225E228
	adds r0, r6, #0
	movs r1, #3
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB18 @ =0x0225E22C
	adds r0, r6, #0
	movs r1, #4
	add r2, sp, #0x20
	bl ov29_0225D970
	movs r0, #0
	str r0, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0225DB1C @ =0x0000039A
	movs r1, #0x59
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	lsls r1, r1, #2
	str r0, [sp, #0x1c]
	adds r0, r6, r1
	subs r1, #0x20
	adds r1, r6, r1
	adds r2, r4, #0
	movs r3, #1
	bl ov29_0225D880
	movs r1, #0x59
	lsls r1, r1, #2
	adds r0, r6, r1
	subs r1, #0x20
	adds r1, r6, r1
	add r2, sp, #0x20
	movs r3, #1
	bl ov29_0225D910
	ldr r3, _0225DB20 @ =0x0225E230
	adds r0, r6, #0
	movs r1, #5
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB24 @ =0x0225E234
	adds r0, r6, #0
	movs r1, #6
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB28 @ =0x0225E238
	adds r0, r6, #0
	movs r1, #7
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB2C @ =0x0225E23C
	adds r0, r6, #0
	movs r1, #8
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB30 @ =0x0225E240
	adds r0, r6, #0
	movs r1, #9
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB34 @ =0x0225E244
	adds r0, r6, #0
	movs r1, #0xa
	add r2, sp, #0x20
	bl ov29_0225D970
	movs r7, #0x7f
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_0225DAD6:
	ldr r0, [r6, r7]
	cmp r4, r0
	bhs _0225DAEA
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	b _0225DAF6
_0225DAEA:
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
_0225DAF6:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blo _0225DAD6
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0225DB04: .4byte 0x00000399
_0225DB08: .4byte 0x0225E21C
_0225DB0C: .4byte 0x0225E220
_0225DB10: .4byte 0x0225E224
_0225DB14: .4byte 0x0225E228
_0225DB18: .4byte 0x0225E22C
_0225DB1C: .4byte 0x0000039A
_0225DB20: .4byte 0x0225E230
_0225DB24: .4byte 0x0225E234
_0225DB28: .4byte 0x0225E238
_0225DB2C: .4byte 0x0225E23C
_0225DB30: .4byte 0x0225E240
_0225DB34: .4byte 0x0225E244
	thumb_func_end ov29_0225D9C8

	thumb_func_start ov29_0225DB38
ov29_0225DB38: @ 0x0225DB38
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0x5d
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_0225DB44:
	ldr r0, [r5, r7]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xb
	blo _0225DB44
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov29_0225DB38

	thumb_func_start ov29_0225DB7C
ov29_0225DB7C: @ 0x0225DB7C
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #1
	movs r6, #0x5d
	adds r5, r0, #0
	movs r4, #0
	lsls r7, r7, #0xc
	lsls r6, r6, #2
_0225DB8A:
	ldr r0, [r5, r6]
	adds r1, r7, #0
	bl FUN_020249B0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xb
	blo _0225DB8A
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov29_0225DB7C

	thumb_func_start ov29_0225DB9C
ov29_0225DB9C: @ 0x0225DB9C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x1d
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_0201A018
	ldrb r1, [r0]
	lsls r1, r1, #0xc
	str r1, [sp]
	ldrb r0, [r0, #1]
	lsls r1, r0, #0xc
	movs r0, #1
	lsls r0, r0, #0x14
	adds r0, r1, r0
	str r0, [sp, #4]
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl FUN_020247D4
	cmp r4, #9
	bhi _0225DBE0
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_020248F0
	add sp, #0xc
	pop {r4, r5, pc}
_0225DBE0:
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_020248F0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov29_0225DB9C

	thumb_func_start ov29_0225DBF0
ov29_0225DBF0: @ 0x0225DBF0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	ldr r0, _0225DC28 @ =0x0225E248
	ldr r1, _0225DC2C @ =0x0225E280
	ldr r2, _0225DC30 @ =0x0225E13C
	adds r3, r4, #0
	bl FUN_02019BA4
	movs r1, #0x1d
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r4, #0
	movs r1, #0
	bl ov29_0225DB9C
	adds r0, r4, #0
	bl ov29_0225DC50
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0225DC28: .4byte 0x0225E248
_0225DC2C: .4byte 0x0225E280
_0225DC30: .4byte 0x0225E13C
	thumb_func_end ov29_0225DBF0

	thumb_func_start ov29_0225DC34
ov29_0225DC34: @ 0x0225DC34
	movs r1, #0x1d
	lsls r1, r1, #4
	ldr r3, _0225DC40 @ =FUN_02019BDC
	ldr r0, [r0, r1]
	bx r3
	nop
_0225DC40: .4byte FUN_02019BDC
	thumb_func_end ov29_0225DC34

	thumb_func_start ov29_0225DC44
ov29_0225DC44: @ 0x0225DC44
	bx lr
	.align 2, 0
	thumb_func_end ov29_0225DC44

	thumb_func_start ov29_0225DC48
ov29_0225DC48: @ 0x0225DC48
	ldr r3, _0225DC4C @ =ov29_0225DB9C
	bx r3
	.align 2, 0
_0225DC4C: .4byte ov29_0225DB9C
	thumb_func_end ov29_0225DC48

	thumb_func_start ov29_0225DC50
ov29_0225DC50: @ 0x0225DC50
	push {lr}
	sub sp, #0xc
	movs r2, #0x7f
	lsls r2, r2, #2
	ldr r1, [r0, r2]
	lsls r3, r1, #2
	ldr r1, _0225DC80 @ =0x0225E1E4
	ldr r3, [r1, r3]
	adds r1, r2, #0
	subs r1, #8
	ldr r1, [r0, r1]
	subs r2, #0x84
	ldrb r1, [r3, r1]
	lsls r1, r1, #0xc
	str r1, [sp]
	movs r1, #0x49
	lsls r1, r1, #0xe
	str r1, [sp, #4]
	ldr r0, [r0, r2]
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {pc}
	.align 2, 0
_0225DC80: .4byte 0x0225E1E4
	thumb_func_end ov29_0225DC50

	thumb_func_start ov29_0225DC84
ov29_0225DC84: @ 0x0225DC84
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	movs r4, #0
	lsls r2, r1, #2
	ldr r1, _0225DCCC @ =0x0225E1E4
	ldr r7, [r1, r2]
	movs r1, #0x46
	lsls r1, r1, #0xe
	str r1, [sp, #4]
	ldr r0, [r6, r0]
	cmp r0, #0
	bls _0225DCC6
	adds r5, r6, #0
_0225DCA6:
	ldrb r0, [r7, r4]
	add r1, sp, #0
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020247D4
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r0
	blo _0225DCA6
_0225DCC6:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225DCCC: .4byte 0x0225E1E4
	thumb_func_end ov29_0225DC84

	thumb_func_start ov29_0225DCD0
ov29_0225DCD0: @ 0x0225DCD0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	movs r0, #0x7e
	adds r4, r1, #0
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #0
	beq _0225DCEA
	cmp r1, #1
	bne _0225DCE6
	b _0225DE86
_0225DCE6:
	cmp r1, #2
	b _0225DE98
_0225DCEA:
	adds r0, r0, #4
	ldr r0, [r4, r0]
	lsls r1, r0, #2
	ldr r0, _0225DEA8 @ =0x0225E1AC
	ldr r0, [r0, r1]
	bl FUN_02025224
	movs r1, #0
	adds r5, r0, #0
	mvns r1, r1
	cmp r5, r1
	beq _0225DD42
	movs r0, #0x7d
	lsls r0, r0, #2
	str r5, [r4, r0]
	adds r0, r4, #0
	bl ov29_0225DC50
	movs r0, #0x7d
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, #0x18
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r3, [r1, r0]
	adds r1, r5, #5
	adds r2, r3, #0
	adds r2, #0xc
	adds r3, r3, #1
	movs r0, #0
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	str r0, [sp]
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov29_0225E028
	ldr r0, _0225DEAC @ =0x000005DD
	bl FUN_0200604C
	b _0225DE98
_0225DD42:
	ldr r0, _0225DEB0 @ =0x021D110C
	ldr r2, [r0, #0x48]
	movs r0, #8
	tst r0, r2
	beq _0225DD68
	movs r0, #0x1d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0xb
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #0xb
	bl ov29_0225DB9C
	ldr r0, _0225DEAC @ =0x000005DD
	bl FUN_0200604C
	b _0225DE98
_0225DD68:
	movs r0, #2
	tst r0, r2
	beq _0225DD80
	adds r0, r4, #0
	bl ov29_0225DEB8
	cmp r0, #1
	bne _0225DD90
	ldr r0, _0225DEAC @ =0x000005DD
	bl FUN_0200604C
	b _0225DE98
_0225DD80:
	movs r0, #0x1d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02019D18
	adds r5, r0, #0
	cmp r5, #0xc
	bls _0225DD92
_0225DD90:
	b _0225DE98
_0225DD92:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225DD9E: @ jump table
	.2byte _0225DDB8 - _0225DD9E - 2 @ case 0
	.2byte _0225DDB8 - _0225DD9E - 2 @ case 1
	.2byte _0225DDB8 - _0225DD9E - 2 @ case 2
	.2byte _0225DDB8 - _0225DD9E - 2 @ case 3
	.2byte _0225DDB8 - _0225DD9E - 2 @ case 4
	.2byte _0225DDB8 - _0225DD9E - 2 @ case 5
	.2byte _0225DDB8 - _0225DD9E - 2 @ case 6
	.2byte _0225DDB8 - _0225DD9E - 2 @ case 7
	.2byte _0225DDB8 - _0225DD9E - 2 @ case 8
	.2byte _0225DDB8 - _0225DD9E - 2 @ case 9
	.2byte _0225DE00 - _0225DD9E - 2 @ case 10
	.2byte _0225DE22 - _0225DD9E - 2 @ case 11
	.2byte _0225DE68 - _0225DD9E - 2 @ case 12
_0225DDB8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov29_0225DEF4
	adds r0, r4, #0
	movs r1, #1
	bl ov29_0225DEB8
	adds r0, r5, #0
	movs r1, #5
	blx FUN_020F2BA4
	adds r6, r1, #0
	adds r0, r5, #0
	movs r1, #5
	blx FUN_020F2BA4
	adds r2, r0, #0
	movs r3, #6
	adds r1, r6, #0
	muls r1, r3, r1
	muls r3, r2, r3
	adds r2, r3, #7
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	movs r3, #0
	bl ov29_0225E078
	ldr r0, _0225DEAC @ =0x000005DD
	bl FUN_0200604C
	b _0225DE98
_0225DE00:
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	movs r3, #3
	bl ov29_0225E028
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov29_0225DEB8
	ldr r0, _0225DEAC @ =0x000005DD
	bl FUN_0200604C
	b _0225DE98
_0225DE22:
	adds r0, r4, #0
	bl ov29_0225E0E0
	movs r0, #2
	lsls r0, r0, #8
	ldr r2, [r4, #0x10]
	ldr r1, [r4, r0]
	ldr r0, [r2]
	cmp r1, r0
	bls _0225DE4E
	movs r0, #0
	movs r1, #3
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #4
	adds r3, r1, #0
	bl ov29_0225E028
	ldr r0, _0225DEAC @ =0x000005DD
	bl FUN_0200604C
	b _0225DE98
_0225DE4E:
	str r1, [r2, #4]
	movs r0, #2
	movs r1, #3
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #4
	adds r3, r1, #0
	bl ov29_0225E028
	ldr r0, _0225DEAC @ =0x000005DD
	bl FUN_0200604C
	b _0225DE98
_0225DE68:
	ldr r0, [r4, #0x10]
	movs r1, #0
	str r1, [r0, #4]
	movs r0, #2
	movs r1, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #3
	bl ov29_0225E028
	ldr r0, _0225DEAC @ =0x000005DD
	bl FUN_0200604C
	b _0225DE98
_0225DE86:
	adds r0, r4, #0
	bl ov29_0225DF74
	cmp r0, #0
	bne _0225DE98
	ldr r0, _0225DEB4 @ =0x000001FA
	ldrh r1, [r4, r0]
	subs r0, r0, #2
	strh r1, [r4, r0]
_0225DE98:
	adds r0, r4, #0
	bl ov29_0225DB7C
	ldr r0, [r4, #0x18]
	bl FUN_0202457C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0225DEA8: .4byte 0x0225E1AC
_0225DEAC: .4byte 0x000005DD
_0225DEB0: .4byte 0x021D110C
_0225DEB4: .4byte 0x000001FA
	thumb_func_end ov29_0225DCD0

	thumb_func_start ov29_0225DEB8
ov29_0225DEB8: @ 0x0225DEB8
	push {r4, lr}
	movs r3, #0x7d
	lsls r3, r3, #2
	ldr r2, [r0, r3]
	adds r1, r2, r1
	str r1, [r0, r3]
	ldr r4, [r0, r3]
	cmp r4, #0
	bge _0225DED0
	movs r1, #0
	str r1, [r0, r3]
	b _0225DEDE
_0225DED0:
	adds r1, r3, #0
	adds r1, #8
	ldr r1, [r0, r1]
	cmp r4, r1
	blo _0225DEDE
	subs r1, r1, #1
	str r1, [r0, r3]
_0225DEDE:
	movs r1, #0x7d
	lsls r1, r1, #2
	ldr r1, [r0, r1]
	cmp r1, r2
	bne _0225DEEC
	movs r0, #0
	pop {r4, pc}
_0225DEEC:
	bl ov29_0225DC50
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov29_0225DEB8

	thumb_func_start ov29_0225DEF4
ov29_0225DEF4: @ 0x0225DEF4
	push {r4, lr}
	movs r3, #0x7d
	lsls r3, r3, #2
	ldr r2, [r0, r3]
	lsls r2, r2, #2
	adds r4, r0, r2
	adds r2, r3, #0
	subs r2, #0x18
	str r1, [r4, r2]
	ldr r2, [r0, r3]
	subs r3, #0x6c
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r0, [r0, r3]
	adds r1, r1, #1
	bl FUN_020248F0
	pop {r4, pc}
	thumb_func_end ov29_0225DEF4

	thumb_func_start ov29_0225DF18
ov29_0225DF18: @ 0x0225DF18
	push {r3, r4, lr}
	sub sp, #0xc
	movs r3, #0x75
	adds r4, r0, #0
	lsls r3, r3, #2
	ldrb r0, [r4, r3]
	lsls r2, r0, #0x1f
	lsrs r2, r2, #0x1f
	bne _0225DF3E
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	lsls r0, r0, #2
	adds r0, r4, r0
	subs r3, #0x60
	ldr r0, [r0, r3]
	bl FUN_020248F0
	add sp, #0xc
	pop {r3, r4, pc}
_0225DF3E:
	adds r0, r3, #6
	ldrb r0, [r4, r0]
	adds r2, r3, #4
	str r0, [sp]
	adds r0, r3, #7
	ldrb r0, [r4, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldrb r1, [r4, r3]
	adds r3, r3, #5
	ldrb r2, [r4, r2]
	lsls r1, r1, #0x18
	ldrb r3, [r4, r3]
	ldr r0, [r4]
	lsrs r1, r1, #0x19
	bl FUN_0201CA4C
	movs r1, #0x75
	lsls r1, r1, #2
	ldrb r1, [r4, r1]
	ldr r0, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	bl FUN_0201EFBC
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov29_0225DF18

	thumb_func_start ov29_0225DF74
ov29_0225DF74: @ 0x0225DF74
	push {r4, lr}
	movs r1, #0x75
	lsls r1, r1, #2
	adds r4, r0, r1
	ldrb r3, [r4, #3]
	lsls r1, r3, #0x1d
	lsrs r1, r1, #0x1d
	beq _0225DF8E
	cmp r1, #1
	beq _0225DFB0
	cmp r1, #2
	beq _0225DFFC
	b _0225E022
_0225DF8E:
	ldrb r1, [r4, #1]
	bl ov29_0225DF18
	ldrb r2, [r4, #3]
	movs r1, #7
	adds r0, r2, #0
	bics r0, r1
	lsls r1, r2, #0x1d
	lsrs r1, r1, #0x1d
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #7
	ands r1, r2
	orrs r0, r1
	strb r0, [r4, #3]
	b _0225E022
_0225DFB0:
	movs r2, #0xf8
	adds r1, r3, #0
	bics r1, r2
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x1b
	adds r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	orrs r1, r2
	strb r1, [r4, #3]
	ldrb r1, [r4, #3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1b
	cmp r1, #4
	bne _0225E022
	ldrb r1, [r4, #2]
	bl ov29_0225DF18
	ldrb r1, [r4, #3]
	movs r0, #0xf8
	bics r1, r0
	strb r1, [r4, #3]
	ldrb r2, [r4, #3]
	movs r1, #7
	adds r0, r2, #0
	bics r0, r1
	lsls r1, r2, #0x1d
	lsrs r1, r1, #0x1d
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #7
	ands r1, r2
	orrs r0, r1
	strb r0, [r4, #3]
	b _0225E022
_0225DFFC:
	movs r1, #0xf8
	adds r0, r3, #0
	bics r0, r1
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x1b
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x18
	orrs r0, r1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	cmp r0, #2
	bne _0225E022
	movs r0, #0
	pop {r4, pc}
_0225E022:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov29_0225DF74

	thumb_func_start ov29_0225E028
ov29_0225E028: @ 0x0225E028
	push {r3, r4, r5, r6}
	movs r4, #0x75
	lsls r4, r4, #2
	ldrb r6, [r0, r4]
	movs r5, #1
	lsls r1, r1, #0x19
	bics r6, r5
	adds r5, r4, #3
	strb r6, [r0, r4]
	ldrb r6, [r0, r5]
	movs r5, #0xf8
	lsrs r1, r1, #0x18
	bics r6, r5
	adds r5, r4, #3
	strb r6, [r0, r5]
	ldrb r6, [r0, r5]
	movs r5, #7
	bics r6, r5
	adds r5, r4, #3
	strb r6, [r0, r5]
	ldrb r5, [r0, r4]
	movs r6, #0xfe
	bics r5, r6
	orrs r1, r5
	strb r1, [r0, r4]
	adds r1, r4, #1
	strb r2, [r0, r1]
	adds r1, r4, #2
	strb r3, [r0, r1]
	add r1, sp, #0
	ldrh r2, [r1, #0x10]
	adds r1, r4, #0
	adds r1, #0x26
	strh r2, [r0, r1]
	movs r1, #1
	adds r4, #0x24
	strh r1, [r0, r4]
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
	thumb_func_end ov29_0225E028

	thumb_func_start ov29_0225E078
ov29_0225E078: @ 0x0225E078
	push {r4, r5, r6, r7}
	adds r4, r1, #0
	adds r1, r2, #0
	movs r2, #0x75
	adds r5, r0, #0
	lsls r2, r2, #2
	adds r0, r3, #0
	ldrb r6, [r5, r2]
	movs r3, #1
	movs r7, #0xf8
	bics r6, r3
	movs r3, #1
	orrs r6, r3
	strb r6, [r5, r2]
	adds r6, r2, #3
	ldrb r6, [r5, r6]
	bics r6, r7
	adds r7, r2, #3
	strb r6, [r5, r7]
	adds r6, r7, #0
	ldrb r6, [r5, r6]
	movs r7, #7
	bics r6, r7
	adds r7, r2, #3
	strb r6, [r5, r7]
	ldrb r6, [r5, r2]
	movs r7, #0xfe
	bics r6, r7
	movs r7, #0xa
	orrs r6, r7
	strb r6, [r5, r2]
	adds r6, r2, #1
	strb r3, [r5, r6]
	movs r7, #0
	adds r6, r2, #2
	strb r7, [r5, r6]
	adds r6, r2, #4
	strb r4, [r5, r6]
	adds r4, r2, #5
	strb r1, [r5, r4]
	movs r4, #6
	adds r1, r2, #6
	strb r4, [r5, r1]
	adds r1, r2, #7
	strb r4, [r5, r1]
	adds r1, r2, #0
	adds r1, #0x26
	strh r0, [r5, r1]
	adds r2, #0x24
	strh r3, [r5, r2]
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov29_0225E078

	thumb_func_start ov29_0225E0E0
ov29_0225E0E0: @ 0x0225E0E0
	push {r4, r5, r6, r7}
	movs r1, #0x7f
	lsls r1, r1, #2
	ldr r5, [r0, r1]
	movs r2, #0
	adds r3, r2, #0
	cmp r5, #0
	bls _0225E108
	adds r7, r1, #0
	adds r4, r0, #0
	movs r6, #0xa
	subs r7, #0x20
_0225E0F8:
	adds r1, r2, #0
	ldr r2, [r4, r7]
	muls r1, r6, r1
	adds r3, r3, #1
	adds r2, r1, r2
	adds r4, r4, #4
	cmp r3, r5
	blo _0225E0F8
_0225E108:
	movs r1, #2
	lsls r1, r1, #8
	str r2, [r0, r1]
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
	thumb_func_end ov29_0225E0E0

	.rodata

_0225E114:
	.byte 0x80, 0x08, 0x27, 0x70, 0x8F, 0xFF, 0x00, 0x00, 0x00, 0x08, 0x27, 0x60
	.byte 0x7F, 0x08, 0x27, 0x80, 0x9F, 0xFF, 0x00, 0x00, 0x00, 0x08, 0x27, 0x50, 0x6F, 0x08, 0x27, 0x70
	.byte 0x8F, 0x08, 0x27, 0x90, 0xAF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x45, 0xDC, 0x25, 0x02
	.byte 0x45, 0xDC, 0x25, 0x02, 0x49, 0xDC, 0x25, 0x02, 0x49, 0xDC, 0x25, 0x02, 0x08, 0x27, 0x40, 0x5F
	.byte 0x08, 0x27, 0x60, 0x7F, 0x08, 0x27, 0x80, 0x9F, 0x08, 0x27, 0xA0, 0xBF, 0xFF, 0x00, 0x00, 0x00
	.byte 0x08, 0x27, 0x30, 0x4F, 0x08, 0x27, 0x50, 0x6F, 0x08, 0x27, 0x70, 0x8F, 0x08, 0x27, 0x90, 0xAF
	.byte 0x08, 0x27, 0xB0, 0xCF, 0xFF, 0x00, 0x00, 0x00, 0x04, 0x01, 0x15, 0x08, 0x02, 0x00, 0x01, 0x00
	.byte 0x04, 0x0C, 0x15, 0x08, 0x02, 0x00, 0x11, 0x00, 0x04, 0x17, 0x15, 0x08, 0x02, 0x00, 0x21, 0x00
	.byte 0x08, 0x27, 0x20, 0x3F, 0x08, 0x27, 0x40, 0x5F, 0x08, 0x27, 0x60, 0x7F, 0x08, 0x27, 0x80, 0x9F
	.byte 0x08, 0x27, 0xA0, 0xBF, 0x08, 0x27, 0xC0, 0xE0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x15, 0xE1, 0x25, 0x02, 0x1D, 0xE1, 0x25, 0x02, 0x29, 0xE1, 0x25, 0x02, 0x4C, 0xE1, 0x25, 0x02
	.byte 0x60, 0xE1, 0x25, 0x02, 0x90, 0xE1, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0xE1, 0x25, 0x02, 0xE8, 0xE2, 0x25, 0x02
	.byte 0xEC, 0xE2, 0x25, 0x02, 0xF0, 0xE2, 0x25, 0x02, 0xF4, 0xE2, 0x25, 0x02, 0xFC, 0xE2, 0x25, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0E, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x20, 0x00, 0x01
	.byte 0x30, 0x24, 0x00, 0x00, 0x28, 0xB0, 0x01, 0x03, 0x80, 0xB0, 0x01, 0x03, 0xD8, 0xB0, 0x01, 0x03
	.byte 0x30, 0x18, 0x01, 0x01, 0x50, 0x18, 0x01, 0x01, 0x70, 0x18, 0x01, 0x01, 0x90, 0x18, 0x01, 0x01
	.byte 0xB0, 0x18, 0x01, 0x01, 0xD0, 0x18, 0x01, 0x01, 0x38, 0x67, 0x08, 0x37, 0x38, 0x67, 0x38, 0x67
	.byte 0x38, 0x67, 0x68, 0x97, 0x38, 0x67, 0x98, 0xC7, 0x38, 0x67, 0xC8, 0xF7, 0x68, 0x97, 0x08, 0x37
	.byte 0x68, 0x97, 0x38, 0x67, 0x68, 0x97, 0x68, 0x97, 0x68, 0x97, 0x98, 0xC7, 0x68, 0x97, 0xC8, 0xF7
	.byte 0xA0, 0xBF, 0x00, 0x4F, 0xA0, 0xBF, 0x58, 0xA7, 0xA0, 0xBF, 0xB0, 0xFF, 0xFF, 0x00, 0x00, 0x00
	.byte 0x20, 0x50, 0x00, 0x00, 0x00, 0x05, 0x04, 0x01, 0x50, 0x50, 0x00, 0x00, 0x01, 0x06, 0x00, 0x02
	.byte 0x80, 0x50, 0x00, 0x00, 0x02, 0x07, 0x01, 0x03, 0xB0, 0x50, 0x00, 0x00, 0x03, 0x08, 0x02, 0x04
	.byte 0xE0, 0x50, 0x00, 0x00, 0x04, 0x09, 0x03, 0x00, 0x20, 0x80, 0x00, 0x00, 0x00, 0x8A, 0x09, 0x06
	.byte 0x50, 0x80, 0x00, 0x00, 0x01, 0x8A, 0x05, 0x07, 0x80, 0x80, 0x00, 0x00, 0x02, 0x8B, 0x06, 0x08
	.byte 0xB0, 0x80, 0x00, 0x00, 0x03, 0x8C, 0x07, 0x09, 0xE0, 0x80, 0x00, 0x00, 0x04, 0x8C, 0x08, 0x05
	.byte 0x28, 0xB0, 0x00, 0x00, 0x85, 0x0A, 0x0C, 0x0B, 0x80, 0xB0, 0x00, 0x00, 0x87, 0x0B, 0x0A, 0x0C
	.byte 0xD8, 0xB0, 0x00, 0x00, 0x89, 0x0C, 0x0B, 0x0A, 0x70, 0x90, 0x00, 0x00, 0x60, 0x80, 0xA0, 0x00
	.byte 0x50, 0x70, 0x90, 0xB0, 0x40, 0x60, 0x80, 0xA0, 0xC0, 0x00, 0x00, 0x00, 0x30, 0x50, 0x70, 0x90
	.byte 0xB0, 0xD0, 0x00, 0x00
