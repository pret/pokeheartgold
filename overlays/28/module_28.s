
	thumb_func_start ov28_0225D520
ov28_0225D520: @ 0x0225D520
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
	ldr r0, _0225D5E8 @ =ov28_0225DC2C
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
	bl ov28_0225D628
	adds r0, r5, #0
	bl ov28_0225D650
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov28_0225D6FC
	adds r0, r4, #0
	bl ov28_0225D764
	adds r0, r4, #0
	bl ov28_0225D7E0
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov28_0225D898
	adds r0, r7, #0
	bl FUN_0200770C
	adds r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225D5E4: .4byte 0x04001050
_0225D5E8: .4byte ov28_0225DC2C
	thumb_func_end ov28_0225D520

	thumb_func_start ov28_0225D5EC
ov28_0225D5EC: @ 0x0225D5EC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r0, r5, #0
	bl FUN_0201F988
	adds r4, r0, #0
	bl ov28_0225DD3C
	adds r0, r4, #0
	bl ov28_0225D8D0
	adds r0, r4, #0
	bl ov28_0225D878
	adds r0, r4, #0
	bl ov28_0225D7C4
	ldr r0, [r4, #0x10]
	bl ov28_0225D6E0
	adds r0, r5, #0
	bl FUN_02007234
	movs r0, #8
	bl FUN_0201A9C4
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov28_0225D5EC

	thumb_func_start ov28_0225D624
ov28_0225D624: @ 0x0225D624
	movs r0, #1
	bx lr
	thumb_func_end ov28_0225D624

	thumb_func_start ov28_0225D628
ov28_0225D628: @ 0x0225D628
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
	thumb_func_end ov28_0225D628

	thumb_func_start ov28_0225D650
ov28_0225D650: @ 0x0225D650
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
	thumb_func_end ov28_0225D650

	thumb_func_start ov28_0225D6E0
ov28_0225D6E0: @ 0x0225D6E0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	pop {r4, pc}
	thumb_func_end ov28_0225D6E0

	thumb_func_start ov28_0225D6FC
ov28_0225D6FC: @ 0x0225D6FC
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
	thumb_func_end ov28_0225D6FC

	thumb_func_start ov28_0225D764
ov28_0225D764: @ 0x0225D764
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
	thumb_func_end ov28_0225D764

	thumb_func_start ov28_0225D7C4
ov28_0225D7C4: @ 0x0225D7C4
	push {r4, r5, r6, lr}
	movs r6, #0x1a
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #4
_0225D7CE:
	ldr r0, [r5, r6]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #5
	blo _0225D7CE
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov28_0225D7C4

	thumb_func_start ov28_0225D7E0
ov28_0225D7E0: @ 0x0225D7E0
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
	thumb_func_end ov28_0225D7E0

	thumb_func_start ov28_0225D878
ov28_0225D878: @ 0x0225D878
	push {r3, r4, r5, lr}
	movs r1, #0x6d
	lsls r1, r1, #2
	movs r4, #0
	adds r5, r0, r1
_0225D882:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #5
	blo _0225D882
	movs r0, #4
	bl FUN_02002DB4
	pop {r3, r4, r5, pc}
	thumb_func_end ov28_0225D878

	thumb_func_start ov28_0225D898
ov28_0225D898: @ 0x0225D898
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
	bl ov28_0225D8EC
	adds r0, r5, #0
	bl ov28_0225DA74
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov28_0225DB8C
	pop {r3, r4, r5, pc}
	thumb_func_end ov28_0225D898

	thumb_func_start ov28_0225D8D0
ov28_0225D8D0: @ 0x0225D8D0
	push {r4, lr}
	adds r4, r0, #0
	bl ov28_0225DBFC
	adds r0, r4, #0
	bl ov28_0225DB54
	adds r0, r4, #0
	bl ov28_0225D910
	ldr r0, [r4, #0x24]
	bl FUN_02024504
	pop {r4, pc}
	thumb_func_end ov28_0225D8D0

	thumb_func_start ov28_0225D8EC
ov28_0225D8EC: @ 0x0225D8EC
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
	thumb_func_end ov28_0225D8EC

	thumb_func_start ov28_0225D910
ov28_0225D910: @ 0x0225D910
	push {r4, r5, r6, lr}
	movs r6, #0x15
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #4
_0225D91A:
	ldr r0, [r5, r6]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0225D91A
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov28_0225D910

	thumb_func_start ov28_0225D92C
ov28_0225D92C: @ 0x0225D92C
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
	thumb_func_end ov28_0225D92C

	thumb_func_start ov28_0225D9BC
ov28_0225D9BC: @ 0x0225D9BC
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
	thumb_func_end ov28_0225D9BC

	thumb_func_start ov28_0225DA1C
ov28_0225DA1C: @ 0x0225DA1C
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
	thumb_func_end ov28_0225DA1C

	thumb_func_start ov28_0225DA74
ov28_0225DA74: @ 0x0225DA74
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
	bl ov28_0225D92C
	adds r0, r4, #0
	bl FUN_0200770C
	movs r1, #0x16
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0x10
	adds r1, r5, r1
	add r2, sp, #0x20
	movs r3, #1
	bl ov28_0225D9BC
	ldr r3, _0225DB44 @ =0x0225EA9A
	adds r0, r5, #0
	movs r1, #0
	add r2, sp, #0x20
	bl ov28_0225DA1C
	ldr r3, _0225DB48 @ =0x0225EA9E
	adds r0, r5, #0
	movs r1, #1
	add r2, sp, #0x20
	bl ov28_0225DA1C
	ldr r3, _0225DB4C @ =0x0225EAA2
	adds r0, r5, #0
	movs r1, #2
	add r2, sp, #0x20
	bl ov28_0225DA1C
	ldr r3, _0225DB50 @ =0x0225EAA6
	adds r0, r5, #0
	movs r1, #3
	add r2, sp, #0x20
	bl ov28_0225DA1C
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
	thumb_func_end ov28_0225DA74

	thumb_func_start ov28_0225DB54
ov28_0225DB54: @ 0x0225DB54
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_02024758
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024758
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024758
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200AEB0
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200B0A8
	pop {r4, pc}
	thumb_func_end ov28_0225DB54

	thumb_func_start ov28_0225DB8C
ov28_0225DB8C: @ 0x0225DB8C
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
	bl ov28_0225D92C
	movs r1, #0x17
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0x20
	adds r1, r5, r1
	add r2, sp, #0x24
	movs r3, #2
	bl ov28_0225D9BC
	movs r4, #0
	add r6, sp, #0x24
	add r7, sp, #0x20
_0225DBE2:
	adds r0, r5, #0
	adds r1, r4, #4
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov28_0225DA1C
	adds r4, r4, #1
	cmp r4, #4
	blo _0225DBE2
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225DBF8: .4byte 0x000001F3
	thumb_func_end ov28_0225DB8C

	thumb_func_start ov28_0225DBFC
ov28_0225DBFC: @ 0x0225DBFC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0x19
	movs r4, #0
	adds r5, r7, #0
	lsls r6, r6, #4
_0225DC08:
	ldr r0, [r5, r6]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0225DC08
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r7, r0]
	bl FUN_0200AEB0
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_0200B0A8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov28_0225DBFC

	thumb_func_start ov28_0225DC2C
ov28_0225DC2C: @ 0x0225DC2C
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x18]
	adds r1, r0, #0
	adds r1, #0xd2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	beq _0225DC56
	bl FUN_0203E13C
	cmp r0, #0
	beq _0225DC56
	ldr r2, [r4, #0x18]
	adds r0, r2, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x80
	adds r2, #0xd2
	bics r1, r0
	strb r1, [r2]
_0225DC56:
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225DC76
	ldr r0, _0225DD1C @ =0x0225EA88
	bl FUN_0202529C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0225DC76
	movs r0, #0xcf
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
_0225DC76:
	ldr r0, [r4, #0x18]
	bl FUN_02050590
	cmp r0, #1
	beq _0225DC98
	ldr r0, _0225DD1C @ =0x0225EA88
	bl FUN_02025244
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0225DC98
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225DCD0
_0225DC98:
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov28_0225E31C
	adds r0, r4, #0
	movs r1, #0
	bl ov28_0225E578
	movs r2, #0x93
	lsls r2, r2, #2
	ldrh r1, [r4, r2]
	ldr r0, _0225DD20 @ =0xFFFF7FFF
	ands r0, r1
	strh r0, [r4, r2]
	adds r0, r2, #0
	movs r1, #0
	adds r0, #0xec
	strh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xee
	strh r1, [r4, r0]
	adds r2, #0xf0
	ldr r0, _0225DD24 @ =0x0000093D
	str r1, [r4, r2]
	bl FUN_02006154
	b _0225DCF6
_0225DCD0:
	cmp r0, #1
	bne _0225DCF6
	adds r0, r4, #0
	bl ov28_0225E7D4
	adds r0, r4, #0
	bl ov28_0225E1A4
	adds r0, r4, #0
	movs r1, #1
	bl ov28_0225E31C
	adds r0, r4, #0
	movs r1, #1
	bl ov28_0225E578
	adds r0, r4, #0
	bl ov28_0225E730
_0225DCF6:
	adds r0, r4, #0
	bl ov28_0225E3BC
	adds r0, r4, #0
	bl ov28_0225E43C
	adds r0, r4, #0
	bl ov28_0225E900
	adds r0, r4, #0
	bl ov28_0225E938
	adds r0, r4, #0
	bl ov28_0225E9E0
	ldr r0, [r4, #0x24]
	bl FUN_0202457C
	pop {r4, pc}
	.align 2, 0
_0225DD1C: .4byte 0x0225EA88
_0225DD20: .4byte 0xFFFF7FFF
_0225DD24: .4byte 0x0000093D
	thumb_func_end ov28_0225DC2C

	thumb_func_start ov28_0225DD28
ov28_0225DD28: @ 0x0225DD28
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	movs r1, #8
	bl FUN_02040614
	movs r1, #0x81
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov28_0225DD28

	thumb_func_start ov28_0225DD3C
ov28_0225DD3C: @ 0x0225DD3C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0225DD56
	bl FUN_0201AB0C
	movs r0, #0x81
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_0225DD56:
	pop {r4, pc}
	thumb_func_end ov28_0225DD3C

	thumb_func_start ov28_0225DD58
ov28_0225DD58: @ 0x0225DD58
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl ov28_0225DD28
	movs r0, #0x83
	movs r4, #0
	lsls r0, r0, #2
	str r4, [r5, r0]
_0225DD6A:
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r6, r0, r4
	ldrb r0, [r6, #4]
	cmp r0, #0xff
	beq _0225DDF6
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225DDBA
	movs r0, #0
	ldrsh r0, [r6, r0]
	str r0, [sp, #4]
	blx FUN_020E4A90
	adds r7, r0, #0
	movs r0, #2
	ldrsh r0, [r6, r0]
	blx FUN_020E4A90
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0x82
	ldr r1, [sp, #4]
	lsls r0, r0, #2
	strh r1, [r5, r0]
	subs r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r0, r4
	movs r0, #2
	ldrsh r1, [r1, r0]
	ldr r0, _0225DE00 @ =0x0000020A
	strh r1, [r5, r0]
	movs r1, #1
	adds r0, r0, #2
	str r1, [r5, r0]
	b _0225DDF2
_0225DDBA:
	movs r0, #0
	ldrsh r0, [r6, r0]
	str r0, [sp]
	blx FUN_020E4A90
	str r0, [sp, #8]
	movs r0, #2
	ldrsh r0, [r6, r0]
	blx FUN_020E4A90
	ldr r1, [sp, #8]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r7, r0
	bls _0225DDF2
	adds r7, r0, #0
	movs r0, #0x82
	ldr r1, [sp]
	lsls r0, r0, #2
	strh r1, [r5, r0]
	subs r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r0, r4
	movs r0, #2
	ldrsh r1, [r1, r0]
	ldr r0, _0225DE00 @ =0x0000020A
	strh r1, [r5, r0]
_0225DDF2:
	adds r4, r4, #6
	b _0225DD6A
_0225DDF6:
	adds r0, r5, #0
	bl ov28_0225DD3C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225DE00: .4byte 0x0000020A
	thumb_func_end ov28_0225DD58

	thumb_func_start ov28_0225DE04
ov28_0225DE04: @ 0x0225DE04
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	movs r2, #0x11
	asrs r1, r0, #0x1f
	lsls r2, r2, #0xe
	movs r3, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	movs r0, #0x15
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [r5]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	movs r2, #0x11
	asrs r1, r0, #0x1f
	lsls r2, r2, #0xe
	movs r3, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	movs r0, #0x59
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [r5, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov28_0225DE04

	thumb_func_start ov28_0225DE64
ov28_0225DE64: @ 0x0225DE64
	adds r2, r0, #0
	subs r1, #0x64
	ldr r3, _0225DE74 @ =FUN_020CD5DC
	subs r2, #0x54
	lsls r0, r1, #0xc
	lsls r1, r2, #0xc
	bx r3
	nop
_0225DE74: .4byte FUN_020CD5DC
	thumb_func_end ov28_0225DE64

	thumb_func_start ov28_0225DE78
ov28_0225DE78: @ 0x0225DE78
	ldr r3, _0225DE84 @ =FUN_020CD5DC
	adds r2, r0, #0
	lsls r0, r1, #0xc
	lsls r1, r2, #0xc
	bx r3
	nop
_0225DE84: .4byte FUN_020CD5DC
	thumb_func_end ov28_0225DE78

	thumb_func_start ov28_0225DE88
ov28_0225DE88: @ 0x0225DE88
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x5a
	lsls r0, r0, #2
	muls r0, r1, r0
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
	thumb_func_end ov28_0225DE88

	thumb_func_start ov28_0225DE98
ov28_0225DE98: @ 0x0225DE98
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	ldr r2, [r4, #4]
	lsls r0, r1, #2
	adds r0, r1, r0
	adds r0, r2, r0
	movs r1, #6
	blx FUN_020F2BA4
	str r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ov28_0225DE98

	thumb_func_start ov28_0225DEB0
ov28_0225DEB0: @ 0x0225DEB0
	push {r4, lr}
	movs r1, #0x85
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	bl ov28_0225DE64
	bl ov28_0225DE88
	movs r1, #0x22
	lsls r1, r1, #4
	adds r2, r1, #0
	subs r2, #0xf4
	adds r3, r0, r2
	adds r2, r1, #0
	str r0, [r4, r1]
	adds r2, #0xc
	str r3, [r4, r2]
	adds r3, r0, #0
	adds r2, r1, #0
	adds r3, #0x78
	adds r2, #0x18
	str r3, [r4, r2]
	adds r2, r1, #0
	adds r0, #0xd8
	adds r2, #0x24
	str r0, [r4, r2]
	adds r0, r1, #0
	adds r0, #0x2c
	ldrh r2, [r4, r0]
	ldr r0, _0225DF00 @ =0xFFFF8000
	adds r1, #0x2c
	ands r2, r0
	movs r0, #6
	orrs r0, r2
	strh r0, [r4, r1]
	pop {r4, pc}
	nop
_0225DF00: .4byte 0xFFFF8000
	thumb_func_end ov28_0225DEB0

	thumb_func_start ov28_0225DF04
ov28_0225DF04: @ 0x0225DF04
	ldr r2, [r0]
	ldr r3, [r0, #4]
	lsls r1, r2, #1
	adds r1, r2, r1
	adds r1, r3, r1
	lsrs r1, r1, #2
	str r1, [r0, #8]
	bx lr
	thumb_func_end ov28_0225DF04

	thumb_func_start ov28_0225DF14
ov28_0225DF14: @ 0x0225DF14
	push {r4, r5, r6, lr}
	movs r1, #0x85
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl ov28_0225DE64
	bl ov28_0225DE88
	movs r1, #0x82
	lsls r1, r1, #2
	adds r4, r0, #0
	ldrsh r0, [r5, r1]
	adds r1, r1, #2
	ldrsh r1, [r5, r1]
	bl ov28_0225DE78
	bl ov28_0225DE88
	lsls r1, r4, #1
	adds r1, r4, r1
	adds r1, r0, r1
	lsrs r2, r1, #2
	movs r1, #0x22
	adds r3, r4, #0
	lsls r1, r1, #4
	adds r6, r0, #0
	adds r3, #0x1e
	str r2, [r5, r1]
	lsls r2, r3, #1
	adds r6, #0x78
	adds r2, r3, r2
	adds r2, r6, r2
	adds r6, r0, #0
	lsrs r3, r2, #2
	adds r2, r1, #0
	adds r2, #0xc
	str r3, [r5, r2]
	adds r3, r4, #0
	subs r3, #0x24
	lsls r2, r3, #1
	subs r6, #0x87
	adds r2, r3, r2
	adds r2, r6, r2
	lsrs r3, r2, #2
	adds r2, r1, #0
	adds r2, #0x18
	adds r4, #0x5a
	str r3, [r5, r2]
	lsls r2, r4, #1
	adds r0, #0x5a
	adds r2, r4, r2
	adds r0, r0, r2
	lsrs r2, r0, #2
	adds r0, r1, #0
	adds r0, #0x24
	str r2, [r5, r0]
	adds r0, r1, #0
	adds r0, #0x2c
	ldrh r2, [r5, r0]
	ldr r0, _0225DFA0 @ =0xFFFF8000
	adds r1, #0x2c
	ands r2, r0
	movs r0, #4
	orrs r0, r2
	strh r0, [r5, r1]
	pop {r4, r5, r6, pc}
	nop
_0225DFA0: .4byte 0xFFFF8000
	thumb_func_end ov28_0225DF14

	thumb_func_start ov28_0225DFA4
ov28_0225DFA4: @ 0x0225DFA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	lsls r0, r0, #1
	adds r0, r1, r0
	movs r1, #3
	blx FUN_020F2BA4
	str r0, [r4, #8]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov28_0225DFA4

	thumb_func_start ov28_0225DFBC
ov28_0225DFBC: @ 0x0225DFBC
	push {r4, r5, r6, lr}
	movs r1, #0x85
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl ov28_0225DE64
	bl ov28_0225DE88
	movs r1, #0x82
	lsls r1, r1, #2
	adds r4, r0, #0
	ldrsh r0, [r5, r1]
	adds r1, r1, #2
	ldrsh r1, [r5, r1]
	bl ov28_0225DE78
	bl ov28_0225DE88
	adds r6, r0, #0
	lsls r0, r4, #1
	adds r0, r6, r0
	movs r1, #3
	blx FUN_020F2BA4
	movs r1, #0x22
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r0, #0x1e
	adds r1, #0x87
	lsls r0, r0, #1
	adds r0, r1, r0
	movs r1, #3
	blx FUN_020F2BA4
	movs r1, #0x8b
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r4, #0
	adds r1, r6, #0
	subs r0, #0x24
	subs r1, #0x78
	lsls r0, r0, #1
	adds r0, r1, r0
	movs r1, #3
	blx FUN_020F2BA4
	movs r1, #0x8e
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r4, #0x5a
	adds r6, #0x3c
	lsls r0, r4, #1
	adds r0, r6, r0
	movs r1, #3
	blx FUN_020F2BA4
	movs r1, #0x91
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	adds r0, #8
	ldrh r2, [r5, r0]
	ldr r0, _0225E050 @ =0xFFFF8000
	adds r1, #8
	ands r2, r0
	movs r0, #3
	orrs r0, r2
	strh r0, [r5, r1]
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225E050: .4byte 0xFFFF8000
	thumb_func_end ov28_0225DFBC

	thumb_func_start ov28_0225E054
ov28_0225E054: @ 0x0225E054
	ldr r2, [r0, #4]
	ldr r1, [r0]
	adds r1, r2, r1
	lsrs r1, r1, #1
	str r1, [r0, #8]
	bx lr
	thumb_func_end ov28_0225E054

	thumb_func_start ov28_0225E060
ov28_0225E060: @ 0x0225E060
	push {r4, r5, r6, lr}
	movs r1, #0x85
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl ov28_0225DE64
	bl ov28_0225DE88
	movs r1, #0x82
	lsls r1, r1, #2
	adds r4, r0, #0
	ldrsh r0, [r5, r1]
	adds r1, r1, #2
	ldrsh r1, [r5, r1]
	bl ov28_0225DE78
	bl ov28_0225DE88
	adds r6, r0, #0
	adds r0, r4, r6
	movs r1, #3
	blx FUN_020F2BA4
	movs r1, #0x22
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r4
	lsrs r2, r0, #1
	adds r0, r1, #0
	adds r0, #0xc
	str r2, [r5, r0]
	adds r0, r6, #0
	subs r0, #0x48
	adds r0, r0, r4
	lsrs r2, r0, #1
	adds r0, r1, #0
	adds r0, #0x18
	adds r4, #0x5a
	adds r6, #0x2d
	str r2, [r5, r0]
	adds r0, r4, r6
	lsrs r2, r0, #1
	adds r0, r1, #0
	adds r0, #0x24
	str r2, [r5, r0]
	adds r0, r1, #0
	adds r0, #0x2c
	ldrh r2, [r5, r0]
	ldr r0, _0225E0D8 @ =0xFFFF8000
	adds r1, #0x2c
	ands r2, r0
	movs r0, #2
	orrs r0, r2
	strh r0, [r5, r1]
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225E0D8: .4byte 0xFFFF8000
	thumb_func_end ov28_0225E060

	thumb_func_start ov28_0225E0DC
ov28_0225E0DC: @ 0x0225E0DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #1
	adds r0, r1, r0
	movs r1, #3
	blx FUN_020F2BA4
	str r0, [r4, #8]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov28_0225E0DC

	thumb_func_start ov28_0225E0F4
ov28_0225E0F4: @ 0x0225E0F4
	push {r4, r5, r6, lr}
	movs r1, #0x82
	adds r5, r0, #0
	lsls r1, r1, #2
	ldrsh r0, [r5, r1]
	lsls r6, r0, #3
	adds r0, r1, #2
	ldrsh r0, [r5, r0]
	adds r6, #0x54
	lsls r4, r0, #3
	adds r0, r1, #0
	adds r0, #0xc
	adds r1, #0x10
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r4, #0x64
	subs r0, r6, r0
	subs r1, r4, r1
	bl ov28_0225DE78
	bl ov28_0225DE88
	movs r1, #0x22
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #0xc
	adds r2, r6, #0
	subs r1, #8
	ldr r0, [r5, r0]
	adds r2, #0xa
	subs r0, r2, r0
	adds r2, r4, #0
	ldr r1, [r5, r1]
	adds r2, #0xc
	subs r1, r2, r1
	bl ov28_0225DE78
	bl ov28_0225DE88
	movs r1, #0x8b
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #0x18
	adds r2, r6, #0
	subs r1, #0x14
	ldr r0, [r5, r0]
	subs r2, #0xc
	subs r0, r2, r0
	ldr r1, [r5, r1]
	subs r2, r4, #4
	subs r1, r2, r1
	bl ov28_0225DE78
	bl ov28_0225DE88
	movs r1, #0x8e
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #0x24
	subs r1, #0x20
	ldr r0, [r5, r0]
	subs r6, #8
	ldr r1, [r5, r1]
	subs r4, #8
	subs r0, r6, r0
	subs r1, r4, r1
	bl ov28_0225DE78
	bl ov28_0225DE88
	movs r1, #0x91
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	adds r0, #8
	ldrh r2, [r5, r0]
	ldr r0, _0225E1A0 @ =0xFFFF8000
	adds r1, #8
	ands r2, r0
	movs r0, #3
	orrs r0, r2
	strh r0, [r5, r1]
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225E1A0: .4byte 0xFFFF8000
	thumb_func_end ov28_0225E0F4

	thumb_func_start ov28_0225E1A4
ov28_0225E1A4: @ 0x0225E1A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	bl ov28_0225DD58
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	cmp r1, #0
	bne _0225E1C8
	adds r0, r6, #0
	bl ov28_0225DEB0
	movs r0, #0x21
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r6, r0]
	b _0225E236
_0225E1C8:
	subs r0, r0, #4
	ldrsh r0, [r6, r0]
	blx FUN_020E4A90
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r0, _0225E310 @ =0x0000020A
	ldrsh r0, [r6, r0]
	blx FUN_020E4A90
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r4, #8
	bgt _0225E1F8
	cmp r0, #8
	bgt _0225E1F8
	adds r0, r6, #0
	bl ov28_0225E0F4
	movs r0, #0x21
	movs r1, #4
	lsls r0, r0, #4
	str r1, [r6, r0]
	b _0225E236
_0225E1F8:
	cmp r4, #0xc
	bgt _0225E210
	cmp r0, #0xc
	bgt _0225E210
	adds r0, r6, #0
	bl ov28_0225E060
	movs r0, #0x21
	movs r1, #3
	lsls r0, r0, #4
	str r1, [r6, r0]
	b _0225E236
_0225E210:
	cmp r4, #0x11
	bgt _0225E228
	cmp r0, #0x11
	bgt _0225E228
	adds r0, r6, #0
	bl ov28_0225DFBC
	movs r0, #0x21
	movs r1, #2
	lsls r0, r0, #4
	str r1, [r6, r0]
	b _0225E236
_0225E228:
	adds r0, r6, #0
	bl ov28_0225DF14
	movs r0, #0x21
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r6, r0]
_0225E236:
	movs r1, #0x93
	lsls r1, r1, #2
	ldrh r0, [r6, r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1f
	bne _0225E27E
	movs r2, #0x22
	lsls r2, r2, #4
	movs r0, #0
	adds r1, r6, #0
	subs r3, r2, #4
	adds r4, r2, #0
	adds r5, r2, #4
_0225E250:
	ldr r7, [r1, r2]
	adds r0, r0, #1
	str r7, [r1, r3]
	ldr r7, [r1, r4]
	str r7, [r1, r5]
	adds r1, #0xc
	cmp r0, #4
	blo _0225E250
	movs r1, #0x93
	lsls r1, r1, #2
	ldrh r2, [r6, r1]
	movs r0, #2
	lsls r0, r0, #0xe
	orrs r0, r2
	strh r0, [r6, r1]
	ldrh r2, [r6, r1]
	ldr r0, _0225E314 @ =0xFFFF8000
	add sp, #8
	ands r2, r0
	movs r0, #1
	orrs r0, r2
	strh r0, [r6, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0225E27E:
	movs r0, #0
	subs r1, #0x30
	str r0, [sp]
	adds r0, r6, r1
	adds r4, r6, #0
	str r0, [sp, #4]
_0225E28A:
	movs r0, #0x22
	lsls r0, r0, #4
	movs r1, #0x5a
	ldr r0, [r4, r0]
	lsls r1, r1, #2
	blx FUN_020F2BA4
	movs r0, #0x22
	lsls r0, r0, #4
	str r1, [r4, r0]
	subs r0, r0, #4
	movs r1, #0x5a
	ldr r0, [r4, r0]
	lsls r1, r1, #2
	blx FUN_020F2BA4
	movs r0, #0x87
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r5, [r4, r0]
	adds r0, r0, #4
	ldr r7, [r4, r0]
	subs r0, r7, r5
	blx FUN_020E4A90
	cmp r0, #0xb4
	blt _0225E2EA
	cmp r7, r5
	bls _0225E2D6
	movs r0, #0x87
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, #0xb4
	adds r1, r1, r0
	movs r0, #0x87
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0225E2EA
_0225E2D6:
	cmp r7, r5
	bhs _0225E2EA
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	subs r0, #0xb8
	adds r1, r1, r0
	movs r0, #0x22
	lsls r0, r0, #4
	str r1, [r4, r0]
_0225E2EA:
	movs r1, #0x21
	lsls r1, r1, #4
	ldr r1, [r6, r1]
	ldr r0, [sp, #4]
	lsls r2, r1, #2
	ldr r1, _0225E318 @ =0x0225EAAC
	ldr r1, [r1, r2]
	blx r1
	ldr r0, [sp, #4]
	adds r4, #0xc
	adds r0, #0xc
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r0, r0, #1
	str r0, [sp]
	cmp r0, #4
	blo _0225E28A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E310: .4byte 0x0000020A
_0225E314: .4byte 0xFFFF8000
_0225E318: .4byte 0x0225EAAC
	thumb_func_end ov28_0225E1A4

	thumb_func_start ov28_0225E31C
ov28_0225E31C: @ 0x0225E31C
	push {r3, r4}
	cmp r1, #0
	blt _0225E356
	movs r2, #0x21
	lsls r2, r2, #4
	ldr r4, [r0, r2]
	ldr r3, _0225E368 @ =0x0225EB84
	ldrb r3, [r3, r4]
	muls r3, r1, r3
	adds r1, r2, #0
	adds r1, #0x3e
	ldrsh r1, [r0, r1]
	adds r3, r1, r3
	adds r1, r2, #0
	adds r1, #0x3e
	strh r3, [r0, r1]
	ldr r1, [r0, r2]
	lsls r3, r1, #1
	ldr r1, _0225E36C @ =0x0225EA90
	ldrb r3, [r1, r3]
	adds r1, r2, #0
	adds r1, #0x3e
	ldrsh r1, [r0, r1]
	cmp r1, r3
	ble _0225E362
	adds r2, #0x3e
	strh r3, [r0, r2]
	pop {r3, r4}
	bx lr
_0225E356:
	ldr r1, _0225E370 @ =0x0000024E
	ldrsh r2, [r0, r1]
	cmp r2, #0
	ble _0225E362
	subs r2, r2, #1
	strh r2, [r0, r1]
_0225E362:
	pop {r3, r4}
	bx lr
	nop
_0225E368: .4byte 0x0225EB84
_0225E36C: .4byte 0x0225EA90
_0225E370: .4byte 0x0000024E
	thumb_func_end ov28_0225E31C

	thumb_func_start ov28_0225E374
ov28_0225E374: @ 0x0225E374
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x21
	lsls r0, r0, #4
	adds r4, r1, #0
	ldr r1, [r5, r0]
	adds r6, r2, #0
	lsls r2, r1, #1
	ldr r1, _0225E3B4 @ =0x0225EA90
	ldrb r2, [r1, r2]
	adds r1, r0, #0
	adds r1, #0x3e
	ldrsh r1, [r5, r1]
	cmp r1, r2
	ble _0225E396
	adds r0, #0x3e
	strh r2, [r5, r0]
_0225E396:
	ldr r0, _0225E3B8 @ =0x0000024E
	movs r1, #0xa
	ldrsh r0, [r5, r0]
	blx FUN_020F2998
	movs r1, #1
	ands r0, r1
	strh r0, [r4]
	ldr r0, _0225E3B8 @ =0x0000024E
	movs r1, #0x14
	ldrsh r0, [r5, r0]
	blx FUN_020F2998
	strh r0, [r6]
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225E3B4: .4byte 0x0225EA90
_0225E3B8: .4byte 0x0000024E
	thumb_func_end ov28_0225E374

	thumb_func_start ov28_0225E3BC
ov28_0225E3BC: @ 0x0225E3BC
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0225E420 @ =0x0000024E
	adds r5, r0, #0
	ldrsh r1, [r5, r1]
	cmp r1, #0
	bne _0225E3E2
	movs r4, #0
	movs r6, #0x19
	adds r7, r4, #0
	lsls r6, r6, #4
_0225E3D0:
	ldr r0, [r5, r6]
	adds r1, r7, #0
	bl FUN_02024830
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0225E3D0
	pop {r3, r4, r5, r6, r7, pc}
_0225E3E2:
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl ov28_0225E374
	movs r7, #0x19
	movs r4, #0
	add r6, sp, #0
	lsls r7, r7, #4
_0225E3F4:
	movs r0, #0x19
	ldrh r1, [r6]
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r1, #1
	bl FUN_02024A48
	movs r0, #0x19
	lsls r0, r0, #4
	ldrh r1, [r6, #2]
	ldr r0, [r5, r0]
	bl FUN_020248F0
	ldr r0, [r5, r7]
	movs r1, #1
	bl FUN_02024830
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0225E3F4
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E420: .4byte 0x0000024E
	thumb_func_end ov28_0225E3BC

	thumb_func_start ov28_0225E424
ov28_0225E424: @ 0x0225E424
	push {r4, lr}
	adds r4, r0, #0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FD00
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #2
	bl FUN_0202481C
	pop {r4, pc}
	thumb_func_end ov28_0225E424

	thumb_func_start ov28_0225E43C
ov28_0225E43C: @ 0x0225E43C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x93
	lsls r0, r0, #2
	ldrh r1, [r5, r0]
	lsls r2, r1, #0x11
	lsrs r4, r2, #0x11
	beq _0225E50E
	ldr r2, _0225E514 @ =0xFFFF8000
	lsrs r3, r2, #0x10
	adds r3, r4, r3
	lsls r3, r3, #0x10
	ands r1, r2
	lsrs r3, r3, #0x10
	lsrs r2, r2, #0x11
	ands r2, r3
	orrs r1, r2
	strh r1, [r5, r0]
	ldrh r1, [r5, r0]
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x11
	bne _0225E4B0
	movs r6, #0
	adds r4, r5, #0
	add r7, sp, #4
_0225E470:
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	subs r0, r0, #4
	str r1, [r5, r0]
	movs r1, #0x87
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r7, #0
	bl ov28_0225DE04
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r1, r7, #0
	bl FUN_020247D4
	movs r0, #0x19
	movs r1, #0x87
	lsls r0, r0, #4
	lsls r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r5, r1]
	bl ov28_0225E424
	adds r6, r6, #1
	adds r5, #0xc
	adds r4, r4, #4
	cmp r6, #4
	blo _0225E470
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0225E4B0:
	movs r1, #0
	subs r0, #0x30
	str r1, [sp]
	adds r4, r5, #0
	adds r6, r5, #0
	adds r7, r5, r0
_0225E4BC:
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, #8
	str r1, [r4, r0]
	movs r1, #0x87
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	add r0, sp, #4
	bl ov28_0225DE04
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	add r1, sp, #4
	bl FUN_020247D4
	movs r0, #0x19
	movs r1, #0x87
	lsls r0, r0, #4
	lsls r1, r1, #2
	ldr r0, [r6, r0]
	ldr r1, [r4, r1]
	bl ov28_0225E424
	movs r1, #0x21
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r7, #0
	lsls r2, r1, #2
	ldr r1, _0225E518 @ =0x0225EAAC
	ldr r1, [r1, r2]
	blx r1
	ldr r0, [sp]
	adds r4, #0xc
	adds r0, r0, #1
	adds r6, r6, #4
	adds r7, #0xc
	str r0, [sp]
	cmp r0, #4
	blo _0225E4BC
_0225E50E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E514: .4byte 0xFFFF8000
_0225E518: .4byte 0x0225EAAC
	thumb_func_end ov28_0225E43C

	thumb_func_start ov28_0225E51C
ov28_0225E51C: @ 0x0225E51C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x21
	lsls r0, r0, #4
	adds r4, r2, #0
	ldr r2, [r5, r0]
	cmp r2, #4
	bne _0225E566
	subs r0, #8
	ldrsh r0, [r5, r0]
	adds r0, r0, #7
	subs r0, r0, r1
	blx FUN_020E4A90
	adds r6, r0, #0
	ldr r0, _0225E570 @ =0x0000020A
	ldrsh r0, [r5, r0]
	adds r0, r0, #7
	subs r0, r0, r4
	blx FUN_020E4A90
	adds r1, r6, r0
	movs r0, #0x10
	subs r1, r0, r1
	cmp r1, #5
	bge _0225E554
	movs r1, #5
	b _0225E55A
_0225E554:
	cmp r1, #0x10
	ble _0225E55A
	adds r1, r0, #0
_0225E55A:
	movs r0, #0xa
	muls r0, r1, r0
	subs r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6, pc}
_0225E566:
	ldr r0, _0225E574 @ =0x0225EA91
	lsls r1, r2, #1
	ldrb r0, [r0, r1]
	pop {r4, r5, r6, pc}
	nop
_0225E570: .4byte 0x0000020A
_0225E574: .4byte 0x0225EA91
	thumb_func_end ov28_0225E51C

	thumb_func_start ov28_0225E578
ov28_0225E578: @ 0x0225E578
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r6, r0, #0
	str r1, [sp, #0x10]
	cmp r1, #1
	bne _0225E5A2
	movs r1, #0x85
	lsls r1, r1, #2
	ldr r0, [r6, r1]
	lsrs r0, r0, #3
	subs r0, r0, #3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x30]
	adds r0, r1, #4
	ldr r0, [r6, r0]
	lsrs r0, r0, #3
	subs r0, r0, #5
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x24]
_0225E5A2:
	ldr r0, _0225E724 @ =0x0225EB14
	movs r7, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x30]
	adds r4, r6, #0
	subs r0, r0, #3
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	adds r0, r0, #3
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	subs r0, r0, #3
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	adds r0, r0, #3
	str r0, [sp, #0x1c]
_0225E5C2:
	ldr r0, [sp, #0x24]
	movs r5, #0
	subs r0, r0, r7
	str r0, [sp, #0x18]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	adds r0, r7, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x3c]
_0225E5D8:
	movs r0, #1
	adds r1, r0, #0
	ldr r0, [sp, #0x34]
	lsls r1, r5
	ldrh r0, [r0]
	tst r0, r1
	beq _0225E5E8
	b _0225E6F6
_0225E5E8:
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _0225E67E
	ldr r0, [sp, #0x2c]
	cmp r5, r0
	blt _0225E658
	ldr r0, [sp, #0x28]
	cmp r5, r0
	bgt _0225E658
	ldr r0, [sp, #0x20]
	cmp r7, r0
	blt _0225E658
	ldr r0, [sp, #0x1c]
	cmp r7, r0
	bgt _0225E658
	ldr r0, [sp, #0x30]
	subs r0, r0, r5
	blx FUN_020E4A90
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x18]
	blx FUN_020E4A90
	ldr r1, [sp, #0x38]
	adds r0, r1, r0
	cmp r0, #4
	bgt _0225E658
	lsls r1, r5, #0x10
	ldr r2, [sp, #0x14]
	adds r0, r6, #0
	lsrs r1, r1, #0x10
	bl ov28_0225E51C
	adds r2, r0, #0
	movs r0, #0x25
	adds r3, r4, r5
	lsls r0, r0, #4
	ldrb r0, [r3, r0]
	cmp r0, r2
	bhs _0225E650
	movs r0, #0x25
	lsls r0, r0, #4
	ldrb r1, [r3, r0]
	adds r1, #0xa
	strb r1, [r3, r0]
	ldrb r0, [r3, r0]
	cmp r0, r2
	bls _0225E6A2
	movs r0, #0x25
	lsls r0, r0, #4
	strb r2, [r3, r0]
	b _0225E6A2
_0225E650:
	movs r0, #0x25
	lsls r0, r0, #4
	strb r2, [r3, r0]
	b _0225E6A2
_0225E658:
	movs r0, #0x25
	adds r3, r4, r5
	lsls r0, r0, #4
	ldrb r0, [r3, r0]
	cmp r0, #2
	blo _0225E674
	movs r0, #0x25
	lsls r0, r0, #4
	ldrb r0, [r3, r0]
	subs r1, r0, #2
	movs r0, #0x25
	lsls r0, r0, #4
	strb r1, [r3, r0]
	b _0225E6A2
_0225E674:
	movs r0, #0x25
	movs r1, #0
	lsls r0, r0, #4
	strb r1, [r3, r0]
	b _0225E6A2
_0225E67E:
	movs r0, #0x25
	adds r3, r4, r5
	lsls r0, r0, #4
	ldrb r0, [r3, r0]
	cmp r0, #2
	blo _0225E69A
	movs r0, #0x25
	lsls r0, r0, #4
	ldrb r0, [r3, r0]
	subs r1, r0, #2
	movs r0, #0x25
	lsls r0, r0, #4
	strb r1, [r3, r0]
	b _0225E6A2
_0225E69A:
	movs r0, #0x25
	movs r1, #0
	lsls r0, r0, #4
	strb r1, [r3, r0]
_0225E6A2:
	movs r0, #0x25
	lsls r0, r0, #4
	ldrb r0, [r3, r0]
	cmp r0, #0
	bne _0225E6CC
	ldr r0, [sp, #0x3c]
	adds r3, r5, #3
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	lsls r3, r3, #0x18
	ldr r0, [r6, #0x10]
	ldr r2, _0225E728 @ =0x00001001
	movs r1, #6
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	b _0225E6F6
_0225E6CC:
	movs r1, #0xa
	blx FUN_020F2998
	adds r2, r0, #0
	ldr r0, [sp, #0x3c]
	lsls r3, r2, #1
	str r0, [sp]
	movs r0, #1
	ldr r2, _0225E72C @ =0x0225EB32
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x11
	ldrh r2, [r2, r3]
	adds r3, r5, #3
	str r0, [sp, #0xc]
	lsls r3, r3, #0x18
	ldr r0, [r6, #0x10]
	movs r1, #6
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
_0225E6F6:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0xf
	bge _0225E702
	b _0225E5D8
_0225E702:
	ldr r0, [sp, #0x34]
	adds r4, #0xf
	adds r0, r0, #2
	str r0, [sp, #0x34]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	cmp r7, #0xf
	bge _0225E716
	b _0225E5C2
_0225E716:
	ldr r0, [r6, #0x10]
	movs r1, #6
	bl FUN_0201EFBC
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E724: .4byte 0x0225EB14
_0225E728: .4byte 0x00001001
_0225E72C: .4byte 0x0225EB32
	thumb_func_end ov28_0225E578

	thumb_func_start ov28_0225E730
ov28_0225E730: @ 0x0225E730
	push {r3, r4, r5, r6, r7, lr}
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	adds r5, r0, #0
	bl ov28_0225E374
	add r0, sp, #0
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	movs r2, #0x21
	lsls r2, r2, #4
	lsls r0, r0, #1
	adds r0, r1, r0
	lsls r1, r0, #6
	movs r0, #0xf
	lsls r0, r0, #6
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r0, [r5, r2]
	cmp r0, #4
	bne _0225E798
	adds r1, r2, #0
	adds r1, #8
	ldr r1, [r5, r1]
	adds r0, r2, #4
	lsrs r1, r1, #3
	ldr r0, [r5, r0]
	subs r2, #8
	subs r6, r1, #5
	ldrsh r1, [r5, r2]
	lsrs r0, r0, #3
	subs r0, r0, #3
	adds r1, r1, #7
	subs r0, r1, r0
	blx FUN_020E4A90
	adds r7, r0, #0
	ldr r0, _0225E7C8 @ =0x0000020A
	ldrsh r0, [r5, r0]
	adds r0, r0, #7
	subs r0, r0, r6
	blx FUN_020E4A90
	adds r1, r7, r0
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #6
	adds r0, r4, r0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
_0225E798:
	movs r0, #0xce
	lsls r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _0225E7AA
	ldr r0, _0225E7CC @ =0x0000093D
	adds r1, r4, #0
	bl FUN_02006134
_0225E7AA:
	movs r0, #0xce
	lsls r0, r0, #2
	ldrh r1, [r5, r0]
	cmp r1, #0xa
	bne _0225E7B8
	movs r1, #0
	b _0225E7BA
_0225E7B8:
	adds r1, r1, #1
_0225E7BA:
	strh r1, [r5, r0]
	ldr r0, _0225E7D0 @ =0x0000033A
	ldrsh r1, [r5, r0]
	cmp r1, r4
	beq _0225E7C6
	strh r4, [r5, r0]
_0225E7C6:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E7C8: .4byte 0x0000020A
_0225E7CC: .4byte 0x0000093D
_0225E7D0: .4byte 0x0000033A
	thumb_func_end ov28_0225E730

	thumb_func_start ov28_0225E7D4
ov28_0225E7D4: @ 0x0225E7D4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r0, sp, #4
	add r1, sp, #0
	bl FUN_02025364
	movs r1, #0x85
	lsls r1, r1, #2
	ldr r0, [sp, #4]
	ldr r2, [r4, r1]
	cmp r2, r0
	bne _0225E7F8
	adds r1, r1, #4
	ldr r2, [r4, r1]
	ldr r1, [sp]
	cmp r2, r1
	beq _0225E80A
_0225E7F8:
	movs r1, #0x85
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r2, [sp]
	adds r0, r1, #4
	str r2, [r4, r0]
	add sp, #8
	movs r0, #0
	pop {r4, pc}
_0225E80A:
	movs r0, #1
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov28_0225E7D4

	thumb_func_start ov28_0225E810
ov28_0225E810: @ 0x0225E810
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	adds r1, r0, #0
	adds r1, #0xd2
	ldrb r1, [r1]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	cmp r1, #1
	bne _0225E828
	movs r4, #4
	b _0225E890
_0225E828:
	bl FUN_0203E13C
	cmp r0, #0
	ldr r0, [r5, #0x18]
	bne _0225E860
	bl FUN_0205CA1C
	bl FUN_0205C6DC
	adds r4, r0, #0
	bl FUN_0205F25C
	subs r0, #0xbc
	cmp r0, #1
	bhi _0225E858
	adds r0, r4, #0
	bl FUN_0205F330
	cmp r0, #1
	bne _0225E854
	movs r4, #3
	b _0225E890
_0225E854:
	movs r4, #4
	b _0225E890
_0225E858:
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r4, [r5, r0]
	b _0225E890
_0225E860:
	bl FUN_021E7F54
	adds r4, r0, #0
	cmp r4, #1
	bne _0225E890
	ldr r0, [r5, #0x18]
	add r1, sp, #0
	bl FUN_0203DBF8
	ldr r0, [sp]
	bl FUN_0205F27C
	bl FUN_021F6BD0
	cmp r0, #1
	beq _0225E88E
	ldr r0, [sp]
	bl FUN_0205F25C
	bl FUN_021F6BB0
	cmp r0, #1
	bne _0225E890
_0225E88E:
	movs r4, #0
_0225E890:
	movs r1, #0xcd
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	cmp r4, r0
	beq _0225E8B0
	movs r0, #0x6d
	lsls r0, r0, #2
	str r4, [r5, r1]
	adds r2, r5, r0
	ldr r1, [r5, r1]
	ldr r0, _0225E8B4 @ =0x0225EB7C
	ldrb r0, [r0, r1]
	lsls r0, r0, #4
	adds r0, r2, r0
	bl FUN_0201D5C8
_0225E8B0:
	pop {r3, r4, r5, pc}
	nop
_0225E8B4: .4byte 0x0225EB7C
	thumb_func_end ov28_0225E810

	thumb_func_start ov28_0225E8B8
ov28_0225E8B8: @ 0x0225E8B8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	str r2, [sp]
	adds r6, r3, #0
	bl FUN_020252F4
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_020249A8
	adds r7, r0, #0
	cmp r4, #1
	bne _0225E8E6
	bl FUN_02025358
	cmp r0, #0
	beq _0225E8E6
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_020248F0
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225E8E6:
	cmp r4, #1
	bne _0225E8F2
	cmp r7, r6
	bne _0225E8F2
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225E8F2:
	ldr r1, [sp]
	adds r0, r5, #0
	bl FUN_020248F0
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov28_0225E8B8

	thumb_func_start ov28_0225E900
ov28_0225E900: @ 0x0225E900
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	bl FUN_0203DF8C
	cmp r0, #1
	bne _0225E914
	adds r0, r4, #0
	bl ov28_0225E810
_0225E914:
	movs r1, #6
	lsls r1, r1, #6
	ldr r0, _0225E930 @ =_0225EA7C
	ldr r1, [r4, r1]
	movs r2, #5
	movs r3, #6
	bl ov28_0225E8B8
	cmp r0, #0
	beq _0225E92E
	ldr r0, _0225E934 @ =0x021D110C
	movs r1, #1
	str r1, [r0, #0x5c]
_0225E92E:
	pop {r4, pc}
	.align 2, 0
_0225E930: .4byte _0225EA7C
_0225E934: .4byte 0x021D110C
	thumb_func_end ov28_0225E900

	thumb_func_start ov28_0225E938
ov28_0225E938: @ 0x0225E938
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	ldr r0, [r0, #0x40]
	bl FUN_0205C700
	cmp r0, #1
	beq _0225E952
	adds r0, r5, #0
	bl ov28_0225EA58
	cmp r0, #1
	bne _0225E96C
_0225E952:
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	pop {r4, r5, r6, pc}
_0225E96C:
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	ldr r0, _0225E9DC @ =0x0225EA84
	bl FUN_02025320
	cmp r0, #1
	bne _0225E9DA
	ldr r0, [r5, #0x18]
	bl FUN_0205CA1C
	adds r6, r0, #0
	bl FUN_0205CB38
	adds r4, r0, #0
	bne _0225E9B8
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
	b _0225E9D0
_0225E9B8:
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
_0225E9D0:
	movs r1, #1
	adds r0, r6, #0
	eors r1, r4
	bl FUN_0205CB40
_0225E9DA:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225E9DC: .4byte 0x0225EA84
	thumb_func_end ov28_0225E938

	thumb_func_start ov28_0225E9E0
ov28_0225E9E0: @ 0x0225E9E0
	push {r4, lr}
	adds r4, r0, #0
	bl ov28_0225EA58
	cmp r0, #1
	bne _0225EA10
	movs r0, #0x7d
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #8
	bl FUN_020248F0
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	pop {r4, pc}
_0225EA10:
	movs r0, #0x7d
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r1, #0x63
	lsls r1, r1, #2
	ldr r0, _0225EA54 @ =0x0225EA80
	ldr r1, [r4, r1]
	movs r2, #8
	movs r3, #9
	bl ov28_0225E8B8
	cmp r0, #0
	beq _0225EA50
	ldr r0, [r4, #0x18]
	movs r1, #0xb
	adds r0, #0xd0
	strh r1, [r0]
	movs r0, #0x43
	ldr r1, [r4, #0x18]
	lsls r0, r0, #2
	adds r0, r1, r0
	movs r1, #1
	bl FUN_02018410
_0225EA50:
	pop {r4, pc}
	nop
_0225EA54: .4byte 0x0225EA80
	thumb_func_end ov28_0225E9E0

	thumb_func_start ov28_0225EA58
ov28_0225EA58: @ 0x0225EA58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	bl FUN_02050590
	cmp r0, #1
	bne _0225EA76
	ldr r0, [r4, #0x18]
	adds r0, #0xd2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _0225EA76
	movs r0, #1
	pop {r4, pc}
_0225EA76:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov28_0225EA58

	.rodata

_0225EA7C:
	.byte 0x90, 0xBC, 0x9D, 0xFF
	.byte 0x08, 0x27, 0xC0, 0xFF, 0x56, 0x86, 0xB2, 0xFC, 0xFE, 0x54, 0x64, 0x48, 0xFF, 0x00, 0x00, 0x00
	.byte 0x31, 0x1D, 0x4F, 0x27, 0x6D, 0x31, 0x81, 0x31, 0x9F, 0x9F, 0xA8, 0x90, 0x00, 0x05, 0xB8, 0x56
	.byte 0x01, 0x03, 0xD2, 0x5E, 0x00, 0x07, 0xC8, 0x08, 0x00, 0x08, 0x00, 0x00, 0x99, 0xDE, 0x25, 0x02
	.byte 0x05, 0xDF, 0x25, 0x02, 0xA5, 0xDF, 0x25, 0x02, 0x55, 0xE0, 0x25, 0x02, 0xDD, 0xE0, 0x25, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1F, 0x7C, 0x07, 0x70, 0x03, 0x60, 0x01, 0x40, 0x01, 0x40, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x40, 0x01, 0x40, 0x03, 0x60, 0x07, 0x70
	.byte 0x1F, 0x7C, 0x6D, 0x30, 0x6E, 0x20, 0x6F, 0x20, 0x70, 0x20, 0x71, 0x20, 0x72, 0x20, 0x73, 0x20
	.byte 0x74, 0x20, 0x75, 0x20, 0x76, 0x20, 0x77, 0x20, 0x78, 0x20, 0x79, 0x20, 0x7A, 0x20, 0x7B, 0x20
	.byte 0x7C, 0x20, 0x04, 0x18, 0x14, 0x08, 0x02, 0x04, 0x11, 0x00, 0x04, 0x18, 0x14, 0x08, 0x02, 0x04
	.byte 0x01, 0x00, 0x04, 0x18, 0x14, 0x08, 0x02, 0x04, 0x21, 0x00, 0x04, 0x18, 0x14, 0x08, 0x02, 0x04
	.byte 0x31, 0x00, 0x04, 0x1A, 0x02, 0x06, 0x02, 0x04, 0x41, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x02, 0x02, 0x02, 0x04, 0x00, 0x00, 0x00
