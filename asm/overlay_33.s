
	thumb_func_start ov33_0225D520
ov33_0225D520: @ 0x0225D520
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #3
	str r2, [sp, #4]
	movs r1, #8
	lsls r2, r0, #0xf
	adds r5, r3, #0
	bl FUN_0201A910
	ldr r0, _0225D598 @ =0x04001050
	movs r1, #0
	strh r1, [r0]
	movs r1, #7
	ldr r0, _0225D59C @ =ov33_0225D5D0
	lsls r1, r1, #6
	movs r2, #0xa
	movs r3, #8
	bl FUN_02007200
	adds r7, r0, #0
	bl FUN_0201F988
	adds r4, r0, #0
	ldr r0, [sp]
	str r6, [r4]
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	str r0, [r4, #8]
	str r5, [r4, #0xc]
	str r7, [r4, #0x14]
	str r5, [r4, #0x10]
	ldrb r1, [r5, #4]
	ldr r0, _0225D5A0 @ =0x000001BA
	strh r1, [r4, r0]
	ldr r1, _0225D5A4 @ =0x0000FFFF
	ldr r0, [r4, #0x10]
	strh r1, [r0, #6]
	ldr r0, [r4, #0x10]
	movs r1, #0
	strb r1, [r0, #5]
	bl ov33_0225D6F8
	adds r0, r6, #0
	bl ov33_0225D720
	adds r0, r4, #0
	bl ov33_0225D7D4
	adds r0, r4, #0
	bl ov33_0225D84C
	adds r0, r4, #0
	bl ov33_0225D8D4
	adds r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D598: .4byte 0x04001050
_0225D59C: .4byte ov33_0225D5D0
_0225D5A0: .4byte 0x000001BA
_0225D5A4: .4byte 0x0000FFFF
	thumb_func_end ov33_0225D520

	thumb_func_start ov33_0225D5A8
ov33_0225D5A8: @ 0x0225D5A8
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r0, r5, #0
	bl FUN_0201F988
	adds r4, r0, #0
	bl ov33_0225D820
	ldr r0, [r4]
	bl ov33_0225D7B8
	adds r0, r5, #0
	bl FUN_02007234
	movs r0, #8
	bl FUN_0201A9C4
	pop {r3, r4, r5, pc}
	thumb_func_end ov33_0225D5A8

	thumb_func_start ov33_0225D5CC
ov33_0225D5CC: @ 0x0225D5CC
	movs r0, #1
	bx lr
	thumb_func_end ov33_0225D5CC

	thumb_func_start ov33_0225D5D0
ov33_0225D5D0: @ 0x0225D5D0
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _0225D6E4 @ =0x000001BA
	ldr r0, _0225D6E8 @ =0x0225DA50
	ldrh r2, [r4, r1]
	subs r3, r2, #1
	movs r2, #0xc
	muls r2, r3, r2
	adds r0, r0, r2
	subs r2, r1, #2
	ldrh r2, [r4, r2]
	cmp r2, #2
	bhs _0225D604
	ldr r2, [r4, #0x10]
	ldrb r2, [r2, #5]
	cmp r2, #1
	bne _0225D5FA
	movs r2, #2
	subs r1, r1, #2
	strh r2, [r4, r1]
	b _0225D604
_0225D5FA:
	cmp r2, #2
	bne _0225D604
	movs r2, #4
	subs r1, r1, #2
	strh r2, [r4, r1]
_0225D604:
	movs r1, #0x6e
	lsls r1, r1, #2
	ldrh r1, [r4, r1]
	cmp r1, #5
	bhi _0225D6E0
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225D61A: @ jump table
	.2byte _0225D626 - _0225D61A - 2 @ case 0
	.2byte _0225D656 - _0225D61A - 2 @ case 1
	.2byte _0225D67E - _0225D61A - 2 @ case 2
	.2byte _0225D6E0 - _0225D61A - 2 @ case 3
	.2byte _0225D6A8 - _0225D61A - 2 @ case 4
	.2byte _0225D6D2 - _0225D61A - 2 @ case 5
_0225D626:
	ldr r0, [r0, #4]
	bl FUN_02025224
	movs r1, #0x6f
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	ldr r1, [r4, r1]
	mvns r0, r0
	cmp r1, r0
	beq _0225D6E0
	adds r0, r4, #0
	movs r1, #1
	bl ov33_0225D9D4
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	ldr r1, [r4, #0x10]
	subs r0, r0, #4
	strh r2, [r1, #6]
	movs r1, #1
	strh r1, [r4, r0]
	pop {r4, pc}
_0225D656:
	ldr r0, [r0, #4]
	bl FUN_02025204
	ldr r2, _0225D6EC @ =0x0000FFFF
	ldr r1, [r4, #0x10]
	strh r2, [r1, #6]
	movs r1, #0x6f
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	cmp r0, r1
	beq _0225D6E0
	adds r0, r4, #0
	movs r1, #0
	bl ov33_0225D9D4
	movs r0, #0x6e
	movs r1, #0
	lsls r0, r0, #2
	strh r1, [r4, r0]
	pop {r4, pc}
_0225D67E:
	ldr r0, [r4]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201CAE0
	ldr r0, [r4]
	movs r1, #4
	bl FUN_0201EFBC
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201EFBC
	movs r0, #0x6e
	movs r1, #3
	lsls r0, r0, #2
	strh r1, [r4, r0]
	pop {r4, pc}
_0225D6A8:
	ldr r0, [r4]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201CAE0
	ldr r0, [r4]
	movs r1, #4
	bl FUN_0201EFBC
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201EFBC
	movs r0, #0x6e
	movs r1, #5
	lsls r0, r0, #2
	strh r1, [r4, r0]
	pop {r4, pc}
_0225D6D2:
	ldr r0, _0225D6F0 @ =0x021D114C
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	beq _0225D6E0
	ldr r0, _0225D6F4 @ =0x021D110C
	movs r1, #1
	str r1, [r0, #0x5c]
_0225D6E0:
	pop {r4, pc}
	nop
_0225D6E4: .4byte 0x000001BA
_0225D6E8: .4byte 0x0225DA50
_0225D6EC: .4byte 0x0000FFFF
_0225D6F0: .4byte 0x021D114C
_0225D6F4: .4byte 0x021D110C
	thumb_func_end ov33_0225D5D0

	thumb_func_start ov33_0225D6F8
ov33_0225D6F8: @ 0x0225D6F8
	push {r3, lr}
	movs r0, #0x80
	blx FUN_020CE650
	movs r0, #1
	lsls r0, r0, #8
	blx FUN_020CE6F8
	ldr r2, _0225D718 @ =0x04001000
	ldr r0, _0225D71C @ =0xFFCFFFEF
	ldr r1, [r2]
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_0225D718: .4byte 0x04001000
_0225D71C: .4byte 0xFFCFFFEF
	thumb_func_end ov33_0225D6F8

	thumb_func_start ov33_0225D720
ov33_0225D720: @ 0x0225D720
	push {r4, r5, lr}
	sub sp, #0x54
	adds r4, r0, #0
	movs r0, #0
	blx FUN_020CDA64
	ldr r5, _0225D7AC @ =0x0225DA68
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
	ldr r5, _0225D7B0 @ =0x0225DA84
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
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201CAE0
	ldr r5, _0225D7B4 @ =0x0225DAA0
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
_0225D7AC: .4byte 0x0225DA68
_0225D7B0: .4byte 0x0225DA84
_0225D7B4: .4byte 0x0225DAA0
	thumb_func_end ov33_0225D720

	thumb_func_start ov33_0225D7B8
ov33_0225D7B8: @ 0x0225D7B8
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
	thumb_func_end ov33_0225D7B8

	thumb_func_start ov33_0225D7D4
ov33_0225D7D4: @ 0x0225D7D4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _0225D818 @ =0x000001BA
	movs r4, #0
	ldrh r2, [r7, r0]
	movs r0, #0xc
	subs r1, r2, #1
	muls r0, r1, r0
	str r0, [sp]
	cmp r2, #0
	bls _0225D816
	adds r5, r7, #0
	adds r6, r4, #0
	adds r5, #0x18
_0225D7F0:
	ldr r3, _0225D81C @ =0x0225DA50
	ldr r2, [sp]
	ldr r0, [r7]
	ldr r2, [r3, r2]
	adds r1, r5, #0
	adds r2, r2, r6
	bl FUN_0201D4F8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0225D818 @ =0x000001BA
	adds r4, r4, #1
	ldrh r0, [r7, r0]
	adds r6, #8
	adds r5, #0x10
	cmp r4, r0
	blo _0225D7F0
_0225D816:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225D818: .4byte 0x000001BA
_0225D81C: .4byte 0x0225DA50
	thumb_func_end ov33_0225D7D4

	thumb_func_start ov33_0225D820
ov33_0225D820: @ 0x0225D820
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _0225D848 @ =0x000001BA
	movs r4, #0
	ldrh r0, [r6, r0]
	cmp r0, #0
	bls _0225D844
	adds r5, r6, #0
	ldr r7, _0225D848 @ =0x000001BA
	adds r5, #0x18
_0225D834:
	adds r0, r5, #0
	bl FUN_0201D520
	ldrh r0, [r6, r7]
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, r0
	blo _0225D834
_0225D844:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D848: .4byte 0x000001BA
	thumb_func_end ov33_0225D820

	thumb_func_start ov33_0225D84C
ov33_0225D84C: @ 0x0225D84C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0xef
	movs r1, #8
	bl FUN_02007688
	movs r1, #0xa0
	str r1, [sp]
	movs r1, #8
	str r1, [sp, #4]
	movs r1, #0
	movs r2, #4
	adds r3, r1, #0
	adds r4, r0, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r4, #0
	movs r1, #1
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
	movs r1, #9
	movs r3, #6
	bl FUN_02007B68
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0
	add r3, sp, #0x10
	bl FUN_02007C2C
	adds r6, r0, #0
	ldr r0, [sp, #0x10]
	movs r2, #6
	adds r5, #0x38
	adds r0, #0xc
	lsls r2, r2, #6
	adds r0, r0, r2
	adds r1, r5, #0
	blx FUN_020D47B8
	adds r0, r6, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov33_0225D84C

	thumb_func_start ov33_0225D8D4
ov33_0225D8D4: @ 0x0225D8D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r7, r0, #0
	movs r0, #4
	movs r1, #8
	bl FUN_02002CEC
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xbf
	movs r3, #8
	bl FUN_0200BAF8
	str r0, [sp, #0x14]
	ldr r0, _0225D9C8 @ =0x000001BA
	ldr r3, _0225D9CC @ =0x0225DA50
	ldrh r0, [r7, r0]
	movs r1, #0xc
	movs r5, #0
	subs r2, r0, #1
	muls r1, r2, r1
	adds r1, r3, r1
	str r1, [sp, #0x18]
	cmp r0, #0
	bls _0225D9B0
	adds r0, r7, #0
	str r0, [sp, #0x1c]
	adds r0, #0x38
	adds r4, r7, #0
	str r0, [sp, #0x1c]
	adds r4, #0x18
_0225D912:
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x18]
	ldrh r1, [r1, #0xa]
	ldrb r0, [r0, #9]
	ldr r3, [sp, #0x18]
	adds r1, r1, #6
	adds r2, r1, #0
	muls r2, r5, r2
	adds r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	ldrb r3, [r3, #8]
	ldr r0, [r7]
	ldr r2, [sp, #0x1c]
	movs r1, #5
	bl FUN_0201C4C4
	ldr r1, [r7, #0x10]
	ldr r0, [sp, #0x14]
	ldr r2, [r1]
	lsls r1, r5, #2
	ldr r1, [r2, r1]
	bl FUN_0200BBA0
	lsls r6, r5, #4
	str r0, [sp, #0x20]
	adds r0, r4, r6
	bl FUN_0201EE90
	lsls r1, r0, #3
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x20]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	lsrs r1, r0, #1
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x20]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D9D0 @ =0x00020100
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r4, r6
	bl FUN_020200FC
	adds r0, r4, r6
	bl FUN_0201D8A0
	adds r0, r4, r6
	bl FUN_0201D5C8
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0225D9C8 @ =0x000001BA
	ldrh r0, [r7, r0]
	cmp r5, r0
	blo _0225D912
_0225D9B0:
	ldr r0, [sp, #0x14]
	bl FUN_0200BB44
	movs r0, #4
	bl FUN_02002DB4
	ldr r0, [r7]
	movs r1, #5
	bl FUN_0201EFBC
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225D9C8: .4byte 0x000001BA
_0225D9CC: .4byte 0x0225DA50
_0225D9D0: .4byte 0x00020100
	thumb_func_end ov33_0225D8D4

	thumb_func_start ov33_0225D9D4
ov33_0225D9D4: @ 0x0225D9D4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	ldr r3, _0225DA1C @ =0x000001BA
	adds r4, r0, #0
	ldrh r2, [r4, r3]
	ldr r0, _0225DA20 @ =0x0225DA50
	adds r3, r3, #2
	subs r5, r2, #1
	movs r2, #0xc
	muls r2, r5, r2
	adds r5, r0, r2
	movs r0, #0x20
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldrb r2, [r5, #8]
	ldrb r6, [r5, #9]
	ldrh r5, [r5, #0xa]
	ldr r3, [r4, r3]
	ldr r0, [r4]
	adds r5, r5, #6
	muls r3, r5, r3
	adds r3, r6, r3
	lsls r3, r3, #0x18
	movs r1, #5
	lsrs r3, r3, #0x18
	bl FUN_0201CA4C
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201EFBC
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0225DA1C: .4byte 0x000001BA
_0225DA20: .4byte 0x0225DA50
	thumb_func_end ov33_0225D9D4

	.rodata

_0225DA24:
	.byte 0x04, 0x01, 0x0C, 0x1E, 0x02, 0x04, 0x01, 0x00, 0x50, 0x7F, 0x00, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00, 0x28, 0x57, 0x00, 0xFF, 0x60, 0x8F, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
	.byte 0x04, 0x01, 0x07, 0x1E, 0x02, 0x04, 0x01, 0x00, 0x04, 0x01, 0x0E, 0x1E, 0x02, 0x04, 0x3D, 0x00
	.byte 0x24, 0xDA, 0x25, 0x02, 0x2C, 0xDA, 0x25, 0x02, 0x00, 0x0A, 0x00, 0x00, 0x40, 0xDA, 0x25, 0x02
	.byte 0x34, 0xDA, 0x25, 0x02, 0x00, 0x05, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0D, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
