
	thumb_func_start MOD29_0225D520
MOD29_0225D520: @ 0x0225D520
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
	ldr r0, _0225D5E4 @ =0x0225DCD1
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
	bl FUN_0225D620
	ldr r0, [sp]
	bl FUN_0225D648
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_0225D6C8
	adds r0, r4, #0
	bl FUN_0225D714
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_0225D7F0
	adds r0, r4, #0
	bl FUN_0225DBF0
	adds r0, r5, #0
	bl FUN_0200770C
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D5E0: .4byte 0x04001050
_0225D5E4: .4byte 0x0225DCD1
_0225D5E8: .4byte 0x000186A0
	thumb_func_end MOD29_0225D520
_0225D5EC:
	.byte 0x38, 0xB5, 0x0D, 0x1C
	.byte 0x28, 0x1C, 0xC2, 0xF5, 0xC9, 0xF9, 0x04, 0x1C, 0x00, 0xF0, 0x1C, 0xFB, 0x20, 0x1C, 0x00, 0xF0
	.byte 0x13, 0xF9, 0x20, 0x1C, 0x00, 0xF0, 0xE6, 0xF8, 0x20, 0x68, 0x00, 0xF0, 0x53, 0xF8, 0x28, 0x1C
	.byte 0xA9, 0xF5, 0x10, 0xFE, 0x08, 0x20, 0xBD, 0xF5, 0xD5, 0xF9, 0x38, 0xBD, 0x01, 0x20, 0x70, 0x47

	thumb_func_start FUN_0225D620
FUN_0225D620: @ 0x0225D620
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
	thumb_func_end FUN_0225D620

	thumb_func_start FUN_0225D648
FUN_0225D648: @ 0x0225D648
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
	thumb_func_end FUN_0225D648
_0225D6B4:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x05, 0x21, 0xBE, 0xF5, 0x47, 0xFA, 0x20, 0x1C
	.byte 0x04, 0x21, 0xBE, 0xF5, 0x43, 0xFA, 0x10, 0xBD

	thumb_func_start FUN_0225D6C8
FUN_0225D6C8: @ 0x0225D6C8
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
	thumb_func_end FUN_0225D6C8

	thumb_func_start FUN_0225D714
FUN_0225D714: @ 0x0225D714
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
	thumb_func_end FUN_0225D714
_0225D7D4:
	.byte 0x38, 0xB5, 0x1A, 0x21, 0x09, 0x01, 0x00, 0x24, 0x45, 0x18, 0x28, 0x1C
	.byte 0xBF, 0xF5, 0x9E, 0xFE, 0x64, 0x1C, 0x10, 0x35, 0x03, 0x2C, 0xF8, 0xD3, 0x38, 0xBD, 0x00, 0x00

	thumb_func_start FUN_0225D7F0
FUN_0225D7F0: @ 0x0225D7F0
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
	bl FUN_0225D840
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225D9C8
	adds r0, r5, #0
	bl FUN_0225DC84
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_0225D7F0
_0225D828:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x00, 0xF0, 0x84, 0xF9
	.byte 0x20, 0x1C, 0x00, 0xF0, 0x17, 0xF8, 0xA0, 0x69, 0xC6, 0xF5, 0x64, 0xFE, 0x10, 0xBD, 0x00, 0x00

	thumb_func_start FUN_0225D840
FUN_0225D840: @ 0x0225D840
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
	thumb_func_end FUN_0225D840
_0225D864:
	.byte 0x70, 0xB5, 0x51, 0x26, 0x05, 0x1C, 0x00, 0x24, 0xB6, 0x00, 0xA8, 0x59
	.byte 0xAC, 0xF5, 0x2E, 0xFC, 0x64, 0x1C, 0x2D, 0x1D, 0x04, 0x2C, 0xF8, 0xD3, 0x70, 0xBD, 0x00, 0x00

	thumb_func_start FUN_0225D880
FUN_0225D880: @ 0x0225D880
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
	thumb_func_end FUN_0225D880

	thumb_func_start FUN_0225D910
FUN_0225D910: @ 0x0225D910
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
	thumb_func_end FUN_0225D910

	thumb_func_start FUN_0225D970
FUN_0225D970: @ 0x0225D970
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
	thumb_func_end FUN_0225D970

	thumb_func_start FUN_0225D9C8
FUN_0225D9C8: @ 0x0225D9C8
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
	bl FUN_0225D880
	movs r1, #0x55
	lsls r1, r1, #2
	adds r0, r6, r1
	subs r1, #0x10
	adds r1, r6, r1
	add r2, sp, #0x20
	movs r3, #1
	bl FUN_0225D910
	ldr r3, _0225DB08 @ =0x0225E21C
	adds r0, r6, #0
	movs r1, #0
	add r2, sp, #0x20
	bl FUN_0225D970
	ldr r3, _0225DB0C @ =0x0225E220
	adds r0, r6, #0
	movs r1, #1
	add r2, sp, #0x20
	bl FUN_0225D970
	ldr r3, _0225DB10 @ =0x0225E224
	adds r0, r6, #0
	movs r1, #2
	add r2, sp, #0x20
	bl FUN_0225D970
	ldr r3, _0225DB14 @ =0x0225E228
	adds r0, r6, #0
	movs r1, #3
	add r2, sp, #0x20
	bl FUN_0225D970
	ldr r3, _0225DB18 @ =0x0225E22C
	adds r0, r6, #0
	movs r1, #4
	add r2, sp, #0x20
	bl FUN_0225D970
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
	bl FUN_0225D880
	movs r1, #0x59
	lsls r1, r1, #2
	adds r0, r6, r1
	subs r1, #0x20
	adds r1, r6, r1
	add r2, sp, #0x20
	movs r3, #1
	bl FUN_0225D910
	ldr r3, _0225DB20 @ =0x0225E230
	adds r0, r6, #0
	movs r1, #5
	add r2, sp, #0x20
	bl FUN_0225D970
	ldr r3, _0225DB24 @ =0x0225E234
	adds r0, r6, #0
	movs r1, #6
	add r2, sp, #0x20
	bl FUN_0225D970
	ldr r3, _0225DB28 @ =0x0225E238
	adds r0, r6, #0
	movs r1, #7
	add r2, sp, #0x20
	bl FUN_0225D970
	ldr r3, _0225DB2C @ =0x0225E23C
	adds r0, r6, #0
	movs r1, #8
	add r2, sp, #0x20
	bl FUN_0225D970
	ldr r3, _0225DB30 @ =0x0225E240
	adds r0, r6, #0
	movs r1, #9
	add r2, sp, #0x20
	bl FUN_0225D970
	ldr r3, _0225DB34 @ =0x0225E244
	adds r0, r6, #0
	movs r1, #0xa
	add r2, sp, #0x20
	bl FUN_0225D970
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
	thumb_func_end FUN_0225D9C8
_0225DB38:
	.byte 0xF8, 0xB5, 0x06, 0x1C, 0x5D, 0x27, 0x00, 0x24
	.byte 0x35, 0x1C, 0xBF, 0x00, 0xE8, 0x59, 0xC6, 0xF5, 0x07, 0xFE, 0x64, 0x1C, 0x2D, 0x1D, 0x0B, 0x2C
	.byte 0xF8, 0xD3, 0x59, 0x20, 0x80, 0x00, 0x30, 0x58, 0xAD, 0xF5, 0xAA, 0xF9, 0x5A, 0x20, 0x80, 0x00
	.byte 0x30, 0x58, 0xAD, 0xF5, 0xA1, 0xFA, 0x55, 0x20, 0x80, 0x00, 0x30, 0x58, 0xAD, 0xF5, 0xA0, 0xF9
	.byte 0x56, 0x20, 0x80, 0x00, 0x30, 0x58, 0xAD, 0xF5, 0x97, 0xFA, 0xF8, 0xBD, 0xF8, 0xB5, 0x01, 0x27
	.byte 0x5D, 0x26, 0x05, 0x1C, 0x00, 0x24, 0x3F, 0x03, 0xB6, 0x00, 0xA8, 0x59, 0x39, 0x1C, 0xC6, 0xF5
	.byte 0x0F, 0xFF, 0x64, 0x1C, 0x2D, 0x1D, 0x0B, 0x2C, 0xF7, 0xD3, 0xF8, 0xBD

	thumb_func_start FUN_0225DB9C
FUN_0225DB9C: @ 0x0225DB9C
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
	thumb_func_end FUN_0225DB9C

	thumb_func_start FUN_0225DBF0
FUN_0225DBF0: @ 0x0225DBF0
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
	bl FUN_0225DB9C
	adds r0, r4, #0
	bl FUN_0225DC50
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0225DC28: .4byte 0x0225E248
_0225DC2C: .4byte 0x0225E280
_0225DC30: .4byte 0x0225E13C
	thumb_func_end FUN_0225DBF0
_0225DC34:
	.byte 0x1D, 0x21, 0x09, 0x01, 0x01, 0x4B, 0x40, 0x58, 0x18, 0x47, 0xC0, 0x46
	.byte 0xDD, 0x9B, 0x01, 0x02, 0x70, 0x47, 0x00, 0x00, 0x00, 0x4B, 0x18, 0x47, 0x9D, 0xDB, 0x25, 0x02

	thumb_func_start FUN_0225DC50
FUN_0225DC50: @ 0x0225DC50
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
	thumb_func_end FUN_0225DC50

	thumb_func_start FUN_0225DC84
FUN_0225DC84: @ 0x0225DC84
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
	thumb_func_end FUN_0225DC84
