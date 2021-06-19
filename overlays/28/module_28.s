
	thumb_func_start MOD28_0225D520
MOD28_0225D520: @ 0x0225D520
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r7, r1, #0
	movs r0, #3
	str r2, [sp]
	movs r1, #8
	lsls r2, r0, #0xf
	str r3, [sp, #4]
	bl FUN_0201A910
	ldr r0, _0225D5E4 @ =0x04001050
	movs r1, #0
	strh r1, [r0]
	movs r1, #0xd
	ldr r0, _0225D5E8 @ =0x0225DC2D
	lsls r1, r1, #6
	movs r2, #0xa
	movs r3, #8
	bl FUN_02007200
	adds r6, r0, #0
	bl FUN_0201F988
	adds r4, r0, #0
	str r5, [r4, #0x10]
	ldr r0, [sp]
	str r7, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [sp, #4]
	movs r1, #0
	str r0, [r4, #0x1c]
	movs r0, #0xcf
	str r6, [r4, #0x20]
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4, #0x18]
	bl FUN_021E7F54
	movs r1, #0xcd
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _0225D5A6
	ldr r0, [r4, #0x18]
	add r1, sp, #8
	bl FUN_0203DBF8
	ldr r0, [sp, #8]
	bl FUN_0205F27C
	bl FUN_021F6BD0
	cmp r0, #1
	beq _0225D59E
	ldr r0, [sp, #8]
	bl FUN_0205F25C
	bl FUN_021F6BB0
	cmp r0, #1
	bne _0225D5A6
_0225D59E:
	movs r0, #0xcd
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_0225D5A6:
	movs r0, #0xfd
	movs r1, #8
	bl FUN_02007688
	adds r7, r0, #0
	bl FUN_0225D628
	adds r0, r5, #0
	bl FUN_0225D650
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_0225D6FC
	adds r0, r4, #0
	bl FUN_0225D764
	adds r0, r4, #0
	bl FUN_0225D7E0
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_0225D898
	adds r0, r7, #0
	bl FUN_0200770C
	adds r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225D5E4: .4byte 0x04001050
_0225D5E8: .4byte 0x0225DC2D
	thumb_func_end MOD28_0225D520
_0225D5EC:
	.byte 0x38, 0xB5, 0x0D, 0x1C
	.byte 0x28, 0x1C, 0xC2, 0xF5, 0xC9, 0xF9, 0x04, 0x1C, 0x00, 0xF0, 0xA0, 0xFB, 0x20, 0x1C, 0x00, 0xF0
	.byte 0x67, 0xF9, 0x20, 0x1C, 0x00, 0xF0, 0x38, 0xF9, 0x20, 0x1C, 0x00, 0xF0, 0xDB, 0xF8, 0x20, 0x69
	.byte 0x00, 0xF0, 0x66, 0xF8, 0x28, 0x1C, 0xA9, 0xF5, 0x0D, 0xFE, 0x08, 0x20, 0xBD, 0xF5, 0xD2, 0xF9
	.byte 0x38, 0xBD, 0x00, 0x00, 0x01, 0x20, 0x70, 0x47

	thumb_func_start FUN_0225D628
FUN_0225D628: @ 0x0225D628
	push {r3, lr}
	movs r0, #0x80
	blx FUN_020CE650
	movs r0, #1
	lsls r0, r0, #8
	blx FUN_020CE6F8
	ldr r2, _0225D648 @ =0x04001000
	ldr r0, _0225D64C @ =0xFFCFFFEF
	ldr r1, [r2]
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_0225D648: .4byte 0x04001000
_0225D64C: .4byte 0xFFCFFFEF
	thumb_func_end FUN_0225D628

	thumb_func_start FUN_0225D650
FUN_0225D650: @ 0x0225D650
	push {r4, r5, lr}
	sub sp, #0x54
	adds r4, r0, #0
	movs r0, #0
	blx FUN_020CDA64
	ldr r5, _0225D6D4 @ =0x0225EAC0
	add r3, sp, #0x38
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
	ldr r5, _0225D6D8 @ =0x0225EADC
	add r3, sp, #0x1c
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
	ldr r5, _0225D6DC @ =0x0225EAF8
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
	add sp, #0x54
	pop {r4, r5, pc}
	.align 2, 0
_0225D6D4: .4byte 0x0225EAC0
_0225D6D8: .4byte 0x0225EADC
_0225D6DC: .4byte 0x0225EAF8
	thumb_func_end FUN_0225D650
_0225D6E0:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x06, 0x21, 0xBE, 0xF5, 0x31, 0xFA, 0x20, 0x1C, 0x05, 0x21, 0xBE, 0xF5
	.byte 0x2D, 0xFA, 0x20, 0x1C, 0x04, 0x21, 0xBE, 0xF5, 0x29, 0xFA, 0x10, 0xBD

	thumb_func_start FUN_0225D6FC
FUN_0225D6FC: @ 0x0225D6FC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	adds r4, r1, #0
	ldr r2, [r5, #0x10]
	adds r0, r4, #0
	movs r1, #2
	movs r3, #5
	bl FUN_02007B44
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x10]
	adds r0, r4, #0
	movs r3, #5
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x10]
	adds r0, r4, #0
	movs r3, #6
	bl FUN_02007B68
	movs r3, #0
	str r3, [sp]
	movs r0, #8
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #3
	movs r2, #4
	bl FUN_02007B8C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_0225D6FC

	thumb_func_start FUN_0225D764
FUN_0225D764: @ 0x0225D764
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xc4
	movs r3, #8
	bl FUN_0200BAF8
	movs r1, #0x11
	adds r4, r0, #0
	bl FUN_0200BBA0
	movs r1, #0x69
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0x12
	bl FUN_0200BBA0
	movs r1, #0x1a
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0x16
	bl FUN_0200BBA0
	movs r1, #0x6a
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0x17
	bl FUN_0200BBA0
	movs r1, #0x6b
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0x15
	bl FUN_0200BBA0
	movs r1, #0x1b
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_0200BB44
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end FUN_0225D764
_0225D7C4:
	.byte 0x70, 0xB5, 0x1A, 0x26, 0x05, 0x1C, 0x00, 0x24, 0x36, 0x01, 0xA8, 0x59
	.byte 0xC8, 0xF5, 0xD6, 0xFD, 0x64, 0x1C, 0x2D, 0x1D, 0x05, 0x2C, 0xF8, 0xD3, 0x70, 0xBD, 0x00, 0x00

	thumb_func_start FUN_0225D7E0
FUN_0225D7E0: @ 0x0225D7E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	movs r0, #4
	movs r1, #8
	bl FUN_02002CEC
	movs r0, #0
	str r0, [sp, #0x10]
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r6, _0225D86C @ =0x0225EB52
	adds r4, r7, r0
	adds r5, r7, #0
_0225D7FC:
	ldr r0, [r7, #0x10]
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0201D4F8
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D870 @ =0x000F0100
	movs r2, #0x1a
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	lsls r2, r2, #4
	ldr r2, [r5, r2]
	adds r0, r4, #0
	movs r1, #4
	movs r3, #0
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_0201D8A0
	ldr r0, [sp, #0x10]
	adds r6, #8
	adds r0, r0, #1
	adds r4, #0x10
	adds r5, r5, #4
	str r0, [sp, #0x10]
	cmp r0, #5
	blo _0225D7FC
	movs r0, #0x6d
	lsls r0, r0, #2
	adds r2, r7, r0
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r1, [r7, r0]
	ldr r0, _0225D874 @ =0x0225EB7C
	ldrb r0, [r0, r1]
	lsls r0, r0, #4
	adds r0, r2, r0
	bl FUN_0201D5C8
	movs r0, #0x7d
	lsls r0, r0, #2
	adds r0, r7, r0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225D86C: .4byte 0x0225EB52
_0225D870: .4byte 0x000F0100
_0225D874: .4byte 0x0225EB7C
	thumb_func_end FUN_0225D7E0
_0225D878:
	.byte 0x38, 0xB5, 0x6D, 0x21, 0x89, 0x00, 0x00, 0x24
	.byte 0x45, 0x18, 0x28, 0x1C, 0xBF, 0xF5, 0x4C, 0xFE, 0x64, 0x1C, 0x10, 0x35, 0x05, 0x2C, 0xF8, 0xD3
	.byte 0x04, 0x20, 0xA5, 0xF5, 0x8F, 0xFA, 0x38, 0xBD

	thumb_func_start FUN_0225D898
FUN_0225D898: @ 0x0225D898
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #8
	adds r1, r5, #0
	adds r1, #0x28
	adds r2, r0, #0
	bl FUN_02009F40
	str r0, [r5, #0x24]
	adds r0, r5, #0
	movs r2, #1
	adds r0, #0x28
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	adds r0, r5, #0
	bl FUN_0225D8EC
	adds r0, r5, #0
	bl FUN_0225DA74
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225DB8C
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_0225D898
_0225D8D0:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x00, 0xF0, 0x92, 0xF9, 0x20, 0x1C, 0x00, 0xF0, 0x3B, 0xF9, 0x20, 0x1C
	.byte 0x00, 0xF0, 0x16, 0xF8, 0x60, 0x6A, 0xC6, 0xF5, 0x0D, 0xFE, 0x10, 0xBD

	thumb_func_start FUN_0225D8EC
FUN_0225D8EC: @ 0x0225D8EC
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0x15
	adds r5, r0, #0
	movs r4, #0
	movs r7, #2
	lsls r6, r6, #4
_0225D8F8:
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #8
	bl FUN_0200A090
	str r0, [r5, r6]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0225D8F8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end FUN_0225D8EC
_0225D910:
	.byte 0x70, 0xB5, 0x15, 0x26, 0x05, 0x1C, 0x00, 0x24, 0x36, 0x01, 0xA8, 0x59, 0xAC, 0xF5, 0xD8, 0xFB
	.byte 0x64, 0x1C, 0x2D, 0x1D, 0x04, 0x2C, 0xF8, 0xD3, 0x70, 0xBD, 0x00, 0x00

	thumb_func_start FUN_0225D92C
FUN_0225D92C: @ 0x0225D92C
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
	movs r3, #1
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
	movs r3, #1
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
	movs r3, #1
	bl FUN_0200A540
	str r0, [r5, #0xc]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end FUN_0225D92C

	thumb_func_start FUN_0225D9BC
FUN_0225D9BC: @ 0x0225D9BC
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
	thumb_func_end FUN_0225D9BC

	thumb_func_start FUN_0225DA1C
FUN_0225DA1C: @ 0x0225DA1C
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r5, r3, #0
	ldr r3, [r0, #0x24]
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
	movs r2, #6
	lsls r2, r2, #6
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
	thumb_func_end FUN_0225DA1C

	thumb_func_start FUN_0225DA74
FUN_0225DA74: @ 0x0225DA74
	push {r4, r5, lr}
	sub sp, #0x44
	adds r5, r0, #0
	movs r0, #0xe
	movs r1, #8
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #7
	str r0, [sp]
	movs r0, #0x44
	str r0, [sp, #4]
	movs r0, #0x45
	str r0, [sp, #8]
	movs r0, #4
	ldr r1, _0225DB40 @ =0x000001F2
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	adds r0, r1, #0
	str r1, [sp, #0x1c]
	subs r0, #0x92
	subs r1, #0xa2
	adds r0, r5, r0
	adds r1, r5, r1
	adds r2, r4, #0
	movs r3, #0x46
	bl FUN_0225D92C
	adds r0, r4, #0
	bl FUN_0200770C
	movs r1, #0x16
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0x10
	adds r1, r5, r1
	add r2, sp, #0x20
	movs r3, #1
	bl FUN_0225D9BC
	ldr r3, _0225DB44 @ =0x0225EA9A
	adds r0, r5, #0
	movs r1, #0
	add r2, sp, #0x20
	bl FUN_0225DA1C
	ldr r3, _0225DB48 @ =0x0225EA9E
	adds r0, r5, #0
	movs r1, #1
	add r2, sp, #0x20
	bl FUN_0225DA1C
	ldr r3, _0225DB4C @ =0x0225EAA2
	adds r0, r5, #0
	movs r1, #2
	add r2, sp, #0x20
	bl FUN_0225DA1C
	ldr r3, _0225DB50 @ =0x0225EAA6
	adds r0, r5, #0
	movs r1, #3
	add r2, sp, #0x20
	bl FUN_0225DA1C
	ldr r0, [r5, #0x18]
	bl FUN_0205CA1C
	bl FUN_0205CB38
	cmp r0, #0
	bne _0225DB22
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_020248F0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0xb
	bl FUN_020248F0
	add sp, #0x44
	pop {r4, r5, pc}
_0225DB22:
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #4
	bl FUN_020248F0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #7
	bl FUN_020248F0
	add sp, #0x44
	pop {r4, r5, pc}
	nop
_0225DB40: .4byte 0x000001F2
_0225DB44: .4byte 0x0225EA9A
_0225DB48: .4byte 0x0225EA9E
_0225DB4C: .4byte 0x0225EAA2
_0225DB50: .4byte 0x0225EAA6
	thumb_func_end FUN_0225DA74
_0225DB54:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x06, 0x20, 0x80, 0x01, 0x20, 0x58, 0xC6, 0xF5
	.byte 0xFB, 0xFD, 0x61, 0x20, 0x80, 0x00, 0x20, 0x58, 0xC6, 0xF5, 0xF6, 0xFD, 0x62, 0x20, 0x80, 0x00
	.byte 0x20, 0x58, 0xC6, 0xF5, 0xF1, 0xFD, 0x16, 0x20, 0x00, 0x01, 0x20, 0x58, 0xAD, 0xF5, 0x98, 0xF9
	.byte 0x59, 0x20, 0x80, 0x00, 0x20, 0x58, 0xAD, 0xF5, 0x8F, 0xFA, 0x10, 0xBD

	thumb_func_start FUN_0225DB8C
FUN_0225DB8C: @ 0x0225DB8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r5, r0, #0
	adds r2, r1, #0
	add r1, sp, #0x20
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	movs r0, #7
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #9
	ldr r1, _0225DBF8 @ =0x000001F3
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	adds r0, r1, #0
	str r1, [sp, #0x1c]
	subs r0, #0x83
	subs r1, #0xa3
	adds r0, r5, r0
	adds r1, r5, r1
	movs r3, #4
	bl FUN_0225D92C
	movs r1, #0x17
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0x20
	adds r1, r5, r1
	add r2, sp, #0x24
	movs r3, #2
	bl FUN_0225D9BC
	movs r4, #0
	add r6, sp, #0x24
	add r7, sp, #0x20
_0225DBE2:
	adds r0, r5, #0
	adds r1, r4, #4
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0225DA1C
	adds r4, r4, #1
	cmp r4, #4
	blo _0225DBE2
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225DBF8: .4byte 0x000001F3
	thumb_func_end FUN_0225DB8C
