
	thumb_func_start ov32_0225D520
ov32_0225D520: @ 0x0225D520
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #3
	str r2, [sp, #4]
	movs r1, #8
	lsls r2, r0, #0xf
	adds r4, r3, #0
	bl FUN_0201A910
	ldr r0, _0225D5C0 @ =0x04001050
	movs r1, #0
	strh r1, [r0]
	movs r1, #0xad
	ldr r0, _0225D5C4 @ =ov32_0225DDC4
	lsls r1, r1, #2
	movs r2, #0xa
	movs r3, #8
	bl FUN_02007200
	adds r7, r0, #0
	bl FUN_0201F988
	adds r5, r0, #0
	ldr r0, [sp]
	str r6, [r5]
	str r0, [r5, #4]
	ldr r0, [sp, #4]
	str r0, [r5, #8]
	str r4, [r5, #0xc]
	str r7, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_0202C6F4
	str r0, [r5, #0x14]
	movs r0, #0x2b
	lsls r0, r0, #4
	str r4, [r5, r0]
	movs r1, #0
	ldr r0, [r5, r0]
	mvns r1, r1
	str r1, [r0]
	movs r0, #4
	movs r1, #8
	bl FUN_02002CEC
	ldr r0, _0225D5C8 @ =0x00000105
	movs r1, #8
	bl FUN_02007688
	adds r4, r0, #0
	bl ov32_0225D60C
	adds r0, r6, #0
	bl ov32_0225D634
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov32_0225D6E0
	adds r0, r5, #0
	bl ov32_0225D748
	adds r0, r5, #0
	bl ov32_0225D788
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov32_0225DA88
	adds r0, r5, #0
	bl ov32_0225DD74
	adds r0, r4, #0
	bl FUN_0200770C
	adds r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225D5C0: .4byte 0x04001050
_0225D5C4: .4byte ov32_0225DDC4
_0225D5C8: .4byte 0x00000105
	thumb_func_end ov32_0225D520

	thumb_func_start ov32_0225D5CC
ov32_0225D5CC: @ 0x0225D5CC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r0, r5, #0
	bl FUN_0201F988
	adds r4, r0, #0
	bl ov32_0225DDAC
	adds r0, r4, #0
	bl ov32_0225DAC0
	adds r0, r4, #0
	bl ov32_0225D834
	adds r0, r4, #0
	bl ov32_0225D76C
	ldr r0, [r4]
	bl ov32_0225D6C4
	movs r0, #4
	bl FUN_02002DB4
	adds r0, r5, #0
	bl FUN_02007234
	movs r0, #8
	bl FUN_0201A9C4
	pop {r3, r4, r5, pc}
	thumb_func_end ov32_0225D5CC

	thumb_func_start ov32_0225D608
ov32_0225D608: @ 0x0225D608
	movs r0, #1
	bx lr
	thumb_func_end ov32_0225D608

	thumb_func_start ov32_0225D60C
ov32_0225D60C: @ 0x0225D60C
	push {r3, lr}
	movs r0, #0x80
	blx FUN_020CE650
	movs r0, #1
	lsls r0, r0, #8
	blx FUN_020CE6F8
	ldr r2, _0225D62C @ =0x04001000
	ldr r0, _0225D630 @ =0xFFCFFFEF
	ldr r1, [r2]
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_0225D62C: .4byte 0x04001000
_0225D630: .4byte 0xFFCFFFEF
	thumb_func_end ov32_0225D60C

	thumb_func_start ov32_0225D634
ov32_0225D634: @ 0x0225D634
	push {r4, r5, lr}
	sub sp, #0x54
	adds r4, r0, #0
	movs r0, #0
	blx FUN_020CDA64
	ldr r5, _0225D6B8 @ =0x0225E1A4
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
	ldr r5, _0225D6BC @ =0x0225E1C0
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
	ldr r5, _0225D6C0 @ =0x0225E188
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
_0225D6B8: .4byte 0x0225E1A4
_0225D6BC: .4byte 0x0225E1C0
_0225D6C0: .4byte 0x0225E188
	thumb_func_end ov32_0225D634

	thumb_func_start ov32_0225D6C4
ov32_0225D6C4: @ 0x0225D6C4
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
	thumb_func_end ov32_0225D6C4

	thumb_func_start ov32_0225D6E0
ov32_0225D6E0: @ 0x0225D6E0
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
	ldr r2, [r5]
	adds r0, r4, #0
	movs r1, #2
	movs r3, #5
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r4, #0
	movs r3, #5
	bl FUN_02007B68
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5]
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
	thumb_func_end ov32_0225D6E0

	thumb_func_start ov32_0225D748
ov32_0225D748: @ 0x0225D748
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xc4
	movs r3, #8
	bl FUN_0200BAF8
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #8
	bl FUN_0200BD08
	movs r1, #0x52
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov32_0225D748

	thumb_func_start ov32_0225D76C
ov32_0225D76C: @ 0x0225D76C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov32_0225D76C

	thumb_func_start ov32_0225D788
ov32_0225D788: @ 0x0225D788
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r5, #0
	ldr r7, _0225D82C @ =0x0225E24C
	movs r4, #0
	adds r6, #0x24
_0225D796:
	lsls r1, r4, #4
	lsls r2, r4, #3
	ldr r0, [r5]
	adds r1, r6, r1
	adds r2, r7, r2
	bl FUN_0201D4F8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x12
	blo _0225D796
	adds r0, r5, #0
	adds r0, #0x24
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x1d
	bl FUN_0200BBA0
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x24
	bl FUN_0201EE90
	lsls r1, r0, #3
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0xf
	lsrs r4, r0, #0x10
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0
	bl FUN_02002F30
	lsrs r0, r0, #1
	subs r0, r4, r0
	lsls r0, r0, #0x10
	movs r1, #0
	lsrs r3, r0, #0x10
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D830 @ =0x00050600
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	str r1, [sp, #0xc]
	adds r0, #0x24
	movs r1, #4
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #0x24
	bl FUN_0201D8A0
	adds r0, r5, #0
	adds r0, #0x24
	bl FUN_0201D5C8
	adds r0, r5, #0
	bl ov32_0225D84C
	adds r0, r5, #0
	bl ov32_0225D988
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D82C: .4byte 0x0225E24C
_0225D830: .4byte 0x00050600
	thumb_func_end ov32_0225D788

	thumb_func_start ov32_0225D834
ov32_0225D834: @ 0x0225D834
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r5, #0x24
_0225D83C:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0x12
	blo _0225D83C
	pop {r3, r4, r5, pc}
	thumb_func_end ov32_0225D834

	thumb_func_start ov32_0225D84C
ov32_0225D84C: @ 0x0225D84C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r0, #0x34
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x1c
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x34
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r1, r0, r7
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0xf
	lsrs r4, r0, #0x10
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D980 @ =0x00050600
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x34
	adds r3, r4, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #4
	movs r1, #8
	bl FUN_02026354
	adds r6, r0, #0
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x1b
	bl FUN_0200BBA0
	movs r1, #0
	str r0, [sp, #0x10]
	movs r0, #0x52
	str r1, [sp]
	movs r3, #1
	str r3, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r2, #4
	bl FUN_0200BFCC
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x10]
	adds r1, r6, #0
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D980 @ =0x00050600
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x34
	adds r3, r4, r7
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x1b
	bl FUN_0200BBA0
	movs r1, #0
	adds r7, r0, #0
	movs r0, #0x52
	str r1, [sp]
	movs r3, #1
	ldr r2, _0225D984 @ =0x000002AA
	str r3, [sp, #4]
	ldrsb r2, [r5, r2]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r2, #1
	bl FUN_0200BFCC
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	subs r0, r4, r0
	lsls r0, r0, #0x10
	movs r1, #0
	lsrs r3, r0, #0x10
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D980 @ =0x00050600
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x34
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #0x34
	bl FUN_0201D8A0
	adds r5, #0x34
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225D980: .4byte 0x00050600
_0225D984: .4byte 0x000002AA
	thumb_func_end ov32_0225D84C

	thumb_func_start ov32_0225D988
ov32_0225D988: @ 0x0225D988
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r7, r0, #0
	ldr r0, _0225DA7C @ =0x000002AB
	ldrb r0, [r7, r0]
	cmp r0, #0
	bne _0225D99C
	adds r5, r7, #0
	adds r5, #0x44
	b _0225D9A0
_0225D99C:
	adds r5, r7, #0
	adds r5, #0xc4
_0225D9A0:
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r1, #0x1e
	bl FUN_0200BBA0
	str r0, [sp, #0x18]
	movs r0, #0x40
	movs r1, #8
	bl FUN_02026354
	str r0, [sp, #0x14]
	movs r0, #8
	bl FUN_02028ED0
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl FUN_0201EE90
	lsls r1, r0, #3
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	movs r4, #0
_0225D9D4:
	ldr r1, _0225DA80 @ =0x000002AA
	ldr r0, [r7, #0x14]
	ldrsb r1, [r7, r1]
	lsls r1, r1, #3
	adds r1, r4, r1
	bl FUN_0202C254
	adds r1, r0, #0
	ldr r0, [sp, #0x1c]
	bl FUN_02028F24
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	ldr r2, [sp, #0x1c]
	movs r1, #0
	bl FUN_0200BE48
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	bl FUN_0200CBBC
	lsls r0, r4, #4
	str r0, [sp, #0x20]
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0
	ldr r1, [sp, #0x14]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DA84 @ =0x00050600
	lsrs r6, r3, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #0x14]
	adds r0, r5, r0
	movs r1, #4
	subs r3, r3, r6
	bl FUN_020200FC
	ldr r0, [sp, #0x20]
	adds r0, r5, r0
	bl FUN_0201D8A0
	ldr r0, [sp, #0x20]
	adds r0, r5, r0
	bl FUN_0201D5C8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #8
	blo _0225D9D4
	ldr r0, [sp, #0x1c]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	ldr r1, _0225DA7C @ =0x000002AB
	movs r0, #1
	ldrb r2, [r7, r1]
	eors r0, r2
	strb r0, [r7, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0225DA7C: .4byte 0x000002AB
_0225DA80: .4byte 0x000002AA
_0225DA84: .4byte 0x00050600
	thumb_func_end ov32_0225D988

	thumb_func_start ov32_0225DA88
ov32_0225DA88: @ 0x0225DA88
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0x15
	adds r5, r0, #0
	lsls r1, r1, #4
	movs r0, #4
	adds r1, r5, r1
	movs r2, #8
	bl FUN_02009F40
	movs r1, #0x53
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #4
	movs r2, #1
	adds r0, r5, r0
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	adds r0, r5, #0
	bl ov32_0225DADC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov32_0225DC68
	pop {r3, r4, r5, pc}
	thumb_func_end ov32_0225DA88

	thumb_func_start ov32_0225DAC0
ov32_0225DAC0: @ 0x0225DAC0
	push {r4, lr}
	adds r4, r0, #0
	bl ov32_0225DCD4
	adds r0, r4, #0
	bl ov32_0225DB00
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024504
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov32_0225DAC0

	thumb_func_start ov32_0225DADC
ov32_0225DADC: @ 0x0225DADC
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0x9e
	adds r5, r0, #0
	movs r4, #0
	movs r7, #1
	lsls r6, r6, #2
_0225DAE8:
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #8
	bl FUN_0200A090
	str r0, [r5, r6]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0225DAE8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov32_0225DADC

	thumb_func_start ov32_0225DB00
ov32_0225DB00: @ 0x0225DB00
	push {r4, r5, r6, lr}
	movs r6, #0x9e
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_0225DB0A:
	ldr r0, [r5, r6]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0225DB0A
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov32_0225DB00

	thumb_func_start ov32_0225DB1C
ov32_0225DB1C: @ 0x0225DB1C
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
	thumb_func_end ov32_0225DB1C

	thumb_func_start ov32_0225DBAC
ov32_0225DBAC: @ 0x0225DBAC
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
	thumb_func_end ov32_0225DBAC

	thumb_func_start ov32_0225DC0C
ov32_0225DC0C: @ 0x0225DC0C
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r5, r3, #0
	movs r3, #0x53
	adds r4, r0, #0
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	lsls r6, r1, #2
	str r2, [sp, #4]
	str r0, [sp]
	ldrb r0, [r5]
	movs r2, #1
	lsls r2, r2, #0x14
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	ldrb r0, [r5, #1]
	lsls r0, r0, #0xc
	adds r0, r0, r2
	lsrs r2, r2, #8
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	str r2, [sp, #0x18]
	str r2, [sp, #0x1c]
	add r2, sp, #0
	strh r0, [r2, #0x20]
	ldrb r0, [r5, #2]
	str r0, [sp, #0x24]
	movs r0, #2
	str r0, [sp, #0x28]
	movs r0, #8
	str r0, [sp, #0x2c]
	lsls r0, r3, #1
	adds r4, r4, r0
	add r0, sp, #0
	bl FUN_02024624
	str r0, [r4, r6]
	ldrb r1, [r5, #3]
	ldr r0, [r4, r6]
	bl FUN_020248F0
	add sp, #0x30
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov32_0225DC0C

	thumb_func_start ov32_0225DC68
ov32_0225DC68: @ 0x0225DC68
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r6, r0, #0
	movs r0, #7
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, _0225DCCC @ =0x00000781
	adds r2, r1, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r1, #0xa2
	str r0, [sp, #0x18]
	lsls r1, r1, #2
	str r0, [sp, #0x1c]
	adds r0, r6, r1
	subs r1, #0x10
	adds r1, r6, r1
	movs r3, #4
	bl ov32_0225DB1C
	movs r1, #0xa2
	lsls r1, r1, #2
	adds r0, r6, r1
	subs r1, #0x10
	adds r1, r6, r1
	add r2, sp, #0x20
	movs r3, #1
	bl ov32_0225DBAC
	ldr r5, _0225DCD0 @ =0x0225E178
	movs r4, #0
	add r7, sp, #0x20
_0225DCB2:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl ov32_0225DC0C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0225DCB2
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0225DCCC: .4byte 0x00000781
_0225DCD0: .4byte 0x0225E178
	thumb_func_end ov32_0225DC68

	thumb_func_start ov32_0225DCD4
ov32_0225DCD4: @ 0x0225DCD4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0xa6
	movs r4, #0
	adds r5, r7, #0
	lsls r6, r6, #2
_0225DCE0:
	ldr r0, [r5, r6]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0225DCE0
	movs r0, #0xa2
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_0200AEB0
	movs r0, #0xa3
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_0200B0A8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov32_0225DCD4

	thumb_func_start ov32_0225DD04
ov32_0225DD04: @ 0x0225DD04
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #1
	movs r6, #0xa6
	adds r5, r0, #0
	movs r4, #0
	lsls r7, r7, #0xc
	lsls r6, r6, #2
_0225DD12:
	ldr r0, [r5, r6]
	adds r1, r7, #0
	bl FUN_020249B0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0225DD12
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov32_0225DD04

	thumb_func_start ov32_0225DD24
ov32_0225DD24: @ 0x0225DD24
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
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
	movs r0, #0xa6
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl FUN_020247D4
	cmp r4, #8
	bne _0225DD64
	movs r0, #0xa6
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_020248F0
	add sp, #0xc
	pop {r4, r5, pc}
_0225DD64:
	movs r0, #0xa6
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_020248F0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov32_0225DD24

	thumb_func_start ov32_0225DD74
ov32_0225DD74: @ 0x0225DD74
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	ldr r0, _0225DDA0 @ =0x0225E1DC
	ldr r1, _0225DDA4 @ =0x0225E204
	ldr r2, _0225DDA8 @ =0x0225E168
	adds r3, r4, #0
	bl FUN_02019BA4
	str r0, [r4, #0x18]
	adds r0, r4, #0
	movs r1, #0
	bl ov32_0225DD24
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0225DDA0: .4byte 0x0225E1DC
_0225DDA4: .4byte 0x0225E204
_0225DDA8: .4byte 0x0225E168
	thumb_func_end ov32_0225DD74

	thumb_func_start ov32_0225DDAC
ov32_0225DDAC: @ 0x0225DDAC
	ldr r3, _0225DDB4 @ =FUN_02019BDC
	ldr r0, [r0, #0x18]
	bx r3
	nop
_0225DDB4: .4byte FUN_02019BDC
	thumb_func_end ov32_0225DDAC

	thumb_func_start ov32_0225DDB8
ov32_0225DDB8: @ 0x0225DDB8
	bx lr
	.align 2, 0
	thumb_func_end ov32_0225DDB8

	thumb_func_start ov32_0225DDBC
ov32_0225DDBC: @ 0x0225DDBC
	ldr r3, _0225DDC0 @ =ov32_0225DD24
	bx r3
	.align 2, 0
_0225DDC0: .4byte ov32_0225DD24
	thumb_func_end ov32_0225DDBC

	thumb_func_start ov32_0225DDC4
ov32_0225DDC4: @ 0x0225DDC4
	push {r4, lr}
	movs r0, #0xaa
	adds r4, r1, #0
	lsls r0, r0, #2
	ldrb r1, [r4, r0]
	cmp r1, #3
	bhi _0225DE22
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225DDDE: @ jump table
	.2byte _0225DDE6 - _0225DDDE - 2 @ case 0
	.2byte _0225DDF4 - _0225DDDE - 2 @ case 1
	.2byte _0225DE02 - _0225DDDE - 2 @ case 2
	.2byte _0225DE18 - _0225DDDE - 2 @ case 3
_0225DDE6:
	adds r0, r4, #0
	bl ov32_0225DE34
	movs r1, #0xaa
	lsls r1, r1, #2
	strb r0, [r4, r1]
	b _0225DE22
_0225DDF4:
	adds r0, r4, #0
	bl ov32_0225DF80
	movs r1, #0xaa
	lsls r1, r1, #2
	strb r0, [r4, r1]
	b _0225DE22
_0225DE02:
	adds r0, r4, #0
	bl ov32_0225D84C
	adds r0, r4, #0
	bl ov32_0225D988
	movs r0, #0xaa
	movs r1, #0
	lsls r0, r0, #2
	strb r1, [r4, r0]
	b _0225DE22
_0225DE18:
	adds r1, r0, #4
	adds r0, #8
	ldr r1, [r4, r1]
	ldr r0, [r4, r0]
	str r1, [r0]
_0225DE22:
	adds r0, r4, #0
	bl ov32_0225DD04
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202457C
	pop {r4, pc}
	thumb_func_end ov32_0225DDC4

	thumb_func_start ov32_0225DE34
ov32_0225DE34: @ 0x0225DE34
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0225DF6C @ =_0225E15C
	bl FUN_02025224
	cmp r0, #0
	bne _0225DE56
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	movs r1, #0
	adds r0, r5, #0
	mvns r1, r1
	bl ov32_0225DF9C
	pop {r3, r4, r5, pc}
_0225DE56:
	cmp r0, #1
	bne _0225DE6C
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #1
	bl ov32_0225DF9C
	pop {r3, r4, r5, pc}
_0225DE6C:
	ldr r0, [r5, #0x18]
	bl FUN_02019D18
	movs r1, #2
	adds r4, r0, #0
	mvns r1, r1
	cmp r4, r1
	bhi _0225DEA8
	bhs _0225DF62
	cmp r4, #8
	bhi _0225DEA0
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225DE8E: @ jump table
	.2byte _0225DEBA - _0225DE8E - 2 @ case 0
	.2byte _0225DEBA - _0225DE8E - 2 @ case 1
	.2byte _0225DEBA - _0225DE8E - 2 @ case 2
	.2byte _0225DEBA - _0225DE8E - 2 @ case 3
	.2byte _0225DEBA - _0225DE8E - 2 @ case 4
	.2byte _0225DEBA - _0225DE8E - 2 @ case 5
	.2byte _0225DEBA - _0225DE8E - 2 @ case 6
	.2byte _0225DEBA - _0225DE8E - 2 @ case 7
	.2byte _0225DEEA - _0225DE8E - 2 @ case 8
_0225DEA0:
	movs r0, #3
	mvns r0, r0
	cmp r4, r0
	b _0225DF68
_0225DEA8:
	adds r0, r1, #1
	cmp r4, r0
	bhi _0225DEB2
	beq _0225DEEA
	b _0225DF68
_0225DEB2:
	adds r0, r1, #2
	cmp r4, r0
	beq _0225DF0A
	b _0225DF68
_0225DEBA:
	ldr r0, _0225DF70 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, _0225DF74 @ =0x000002AA
	lsrs r3, r4, #1
	ldrsb r1, [r5, r0]
	adds r0, r0, #2
	lsls r2, r3, #2
	adds r2, r3, r2
	lsls r1, r1, #3
	adds r1, r4, r1
	str r1, [r5, r0]
	lsls r1, r4, #0x1f
	lsrs r1, r1, #0x1b
	adds r1, r1, #2
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	movs r3, #3
	bl ov32_0225E0FC
	pop {r3, r4, r5, pc}
_0225DEEA:
	ldr r0, _0225DF70 @ =0x000005DD
	bl FUN_0200604C
	movs r1, #1
	movs r0, #0xab
	mvns r1, r1
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r2, #3
	str r2, [sp]
	adds r0, r5, #0
	movs r1, #1
	movs r3, #2
	bl ov32_0225E0A8
	pop {r3, r4, r5, pc}
_0225DF0A:
	ldr r0, [r5, #0x18]
	bl FUN_02019F74
	ldr r1, _0225DF78 @ =0x021D110C
	ldr r2, [r1, #0x4c]
	movs r1, #0x10
	tst r1, r2
	beq _0225DF3A
	cmp r0, #1
	beq _0225DF2A
	cmp r0, #3
	beq _0225DF2A
	cmp r0, #5
	beq _0225DF2A
	cmp r0, #7
	bne _0225DF3A
_0225DF2A:
	ldr r0, _0225DF7C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #1
	bl ov32_0225DF9C
	pop {r3, r4, r5, pc}
_0225DF3A:
	movs r1, #0x20
	tst r1, r2
	beq _0225DF68
	cmp r0, #0
	beq _0225DF50
	cmp r0, #2
	beq _0225DF50
	cmp r0, #4
	beq _0225DF50
	cmp r0, #6
	bne _0225DF68
_0225DF50:
	ldr r0, _0225DF7C @ =0x000005DC
	bl FUN_0200604C
	movs r1, #0
	adds r0, r5, #0
	mvns r1, r1
	bl ov32_0225DF9C
	pop {r3, r4, r5, pc}
_0225DF62:
	ldr r0, _0225DF7C @ =0x000005DC
	bl FUN_0200604C
_0225DF68:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225DF6C: .4byte _0225E15C
_0225DF70: .4byte 0x000005DD
_0225DF74: .4byte 0x000002AA
_0225DF78: .4byte 0x021D110C
_0225DF7C: .4byte 0x000005DC
	thumb_func_end ov32_0225DE34

	thumb_func_start ov32_0225DF80
ov32_0225DF80: @ 0x0225DF80
	push {r4, lr}
	adds r4, r0, #0
	bl ov32_0225E048
	cmp r0, #0
	bne _0225DF92
	ldr r0, _0225DF98 @ =0x000002A9
	ldrb r0, [r4, r0]
	pop {r4, pc}
_0225DF92:
	movs r0, #1
	pop {r4, pc}
	nop
_0225DF98: .4byte 0x000002A9
	thumb_func_end ov32_0225DF80

	thumb_func_start ov32_0225DF9C
ov32_0225DF9C: @ 0x0225DF9C
	push {r3, lr}
	ldr r2, _0225DFE4 @ =0x000002AA
	ldrsb r3, [r0, r2]
	adds r3, r3, r1
	strb r3, [r0, r2]
	ldrsb r3, [r0, r2]
	cmp r3, #0
	bge _0225DFB0
	movs r3, #3
	strb r3, [r0, r2]
_0225DFB0:
	ldr r2, _0225DFE4 @ =0x000002AA
	ldrsb r3, [r0, r2]
	cmp r3, #3
	ble _0225DFBC
	movs r3, #0
	strb r3, [r0, r2]
_0225DFBC:
	cmp r1, #0
	ble _0225DFC6
	movs r2, #3
	movs r3, #6
	b _0225DFCA
_0225DFC6:
	movs r2, #2
	movs r3, #4
_0225DFCA:
	movs r1, #2
	str r1, [sp]
	lsls r1, r2, #0x18
	adds r2, r3, #1
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov32_0225E0A8
	pop {r3, pc}
	nop
_0225DFE4: .4byte 0x000002AA
	thumb_func_end ov32_0225DF9C

	thumb_func_start ov32_0225DFE8
ov32_0225DFE8: @ 0x0225DFE8
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r0, [r4, #0x1c]
	lsls r2, r0, #0x1f
	lsrs r2, r2, #0x1f
	bne _0225E00C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	lsls r0, r0, #2
	adds r2, r4, r0
	movs r0, #0xa6
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	bl FUN_020248F0
	add sp, #0xc
	pop {r3, r4, pc}
_0225E00C:
	adds r0, r4, #0
	adds r0, #0x22
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r3, r4, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	adds r2, #0x20
	adds r3, #0x21
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldrb r1, [r4, #0x1c]
	ldrb r2, [r2]
	ldrb r3, [r3]
	lsls r1, r1, #0x18
	ldr r0, [r4]
	lsrs r1, r1, #0x19
	bl FUN_0201CA4C
	ldrb r1, [r4, #0x1c]
	ldr r0, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	bl FUN_0201EFBC
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov32_0225DFE8

	thumb_func_start ov32_0225E048
ov32_0225E048: @ 0x0225E048
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x1c
	ldrb r1, [r4, #2]
	cmp r1, #0
	beq _0225E05E
	cmp r1, #1
	beq _0225E070
	cmp r1, #2
	beq _0225E092
	b _0225E0A2
_0225E05E:
	ldrb r1, [r4, #1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bl ov32_0225DFE8
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	b _0225E0A2
_0225E070:
	ldrb r1, [r4, #3]
	adds r1, r1, #1
	strb r1, [r4, #3]
	ldrb r1, [r4, #3]
	cmp r1, #4
	bne _0225E0A2
	ldrb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	bl ov32_0225DFE8
	movs r0, #0
	strb r0, [r4, #3]
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	b _0225E0A2
_0225E092:
	ldrb r0, [r4, #3]
	adds r0, r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	cmp r0, #2
	bne _0225E0A2
	movs r0, #0
	pop {r4, pc}
_0225E0A2:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov32_0225E048

	thumb_func_start ov32_0225E0A8
ov32_0225E0A8: @ 0x0225E0A8
	push {r4, r5}
	ldrb r5, [r0, #0x1c]
	movs r4, #1
	lsls r1, r1, #0x19
	bics r5, r4
	strb r5, [r0, #0x1c]
	movs r4, #0
	strb r4, [r0, #0x1f]
	strb r4, [r0, #0x1e]
	ldrb r5, [r0, #0x1c]
	movs r4, #0xfe
	lsrs r1, r1, #0x18
	bics r5, r4
	orrs r1, r5
	strb r1, [r0, #0x1c]
	ldrb r4, [r0, #0x1d]
	movs r1, #0xf
	bics r4, r1
	movs r1, #0xf
	ands r1, r2
	orrs r1, r4
	strb r1, [r0, #0x1d]
	ldrb r2, [r0, #0x1d]
	movs r1, #0xf0
	bics r2, r1
	lsls r1, r3, #0x1c
	lsrs r1, r1, #0x18
	orrs r1, r2
	strb r1, [r0, #0x1d]
	ldr r1, _0225E0F4 @ =0xFFFFFFF8
	add r1, sp
	ldrb r2, [r1, #0x10]
	ldr r1, _0225E0F8 @ =0x000002A9
	strb r2, [r0, r1]
	movs r0, #1
	pop {r4, r5}
	bx lr
	nop
_0225E0F4: .4byte 0xFFFFFFF8
_0225E0F8: .4byte 0x000002A9
	thumb_func_end ov32_0225E0A8

	thumb_func_start ov32_0225E0FC
ov32_0225E0FC: @ 0x0225E0FC
	push {r3, r4, r5, r6}
	ldrb r5, [r0, #0x1c]
	movs r4, #1
	bics r5, r4
	movs r4, #1
	orrs r5, r4
	strb r5, [r0, #0x1c]
	movs r5, #0
	strb r5, [r0, #0x1f]
	strb r5, [r0, #0x1e]
	ldrb r6, [r0, #0x1c]
	movs r5, #0xfe
	bics r6, r5
	movs r5, #0xa
	orrs r5, r6
	strb r5, [r0, #0x1c]
	ldrb r6, [r0, #0x1d]
	movs r5, #0xf
	bics r6, r5
	adds r5, r6, #0
	orrs r5, r4
	strb r5, [r0, #0x1d]
	ldrb r6, [r0, #0x1d]
	movs r5, #0xf0
	bics r6, r5
	adds r5, r0, #0
	strb r6, [r0, #0x1d]
	adds r5, #0x20
	strb r1, [r5]
	adds r1, r0, #0
	adds r1, #0x21
	strb r2, [r1]
	adds r1, r0, #0
	movs r2, #0xc
	adds r1, #0x22
	strb r2, [r1]
	adds r1, r0, #0
	movs r2, #4
	adds r1, #0x23
	strb r2, [r1]
	ldr r1, _0225E158 @ =0x000002A9
	strb r3, [r0, r1]
	adds r0, r4, #0
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0225E158: .4byte 0x000002A9
	thumb_func_end ov32_0225E0FC

	.rodata

_0225E15C:
	.byte 0xA0, 0xBF, 0x08, 0x27
	.byte 0xA0, 0xBF, 0x28, 0x47, 0xFF, 0x00, 0x00, 0x00, 0xB9, 0xDD, 0x25, 0x02, 0xB9, 0xDD, 0x25, 0x02
	.byte 0xBD, 0xDD, 0x25, 0x02, 0xBD, 0xDD, 0x25, 0x02, 0x20, 0x20, 0x00, 0x00, 0xD8, 0xB0, 0x01, 0x02
	.byte 0x18, 0xB0, 0x01, 0x04, 0x38, 0xB0, 0x01, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0E, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x17, 0x18, 0x67
	.byte 0x08, 0x17, 0x98, 0xE7, 0x30, 0x3F, 0x18, 0x67, 0x30, 0x3F, 0x98, 0xE7, 0x58, 0x67, 0x18, 0x67
	.byte 0x58, 0x67, 0x98, 0xE7, 0x80, 0x8F, 0x18, 0x67, 0x80, 0x8F, 0x98, 0xE7, 0xA0, 0xBF, 0xB0, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00, 0x40, 0x10, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0xC0, 0x10, 0x00, 0x00
	.byte 0x01, 0x03, 0x00, 0x01, 0x40, 0x38, 0x00, 0x00, 0x00, 0x04, 0x02, 0x03, 0xC0, 0x38, 0x00, 0x00
	.byte 0x01, 0x05, 0x02, 0x03, 0x40, 0x60, 0x00, 0x00, 0x02, 0x06, 0x04, 0x05, 0xC0, 0x60, 0x00, 0x00
	.byte 0x03, 0x07, 0x04, 0x05, 0x40, 0x88, 0x00, 0x00, 0x04, 0x08, 0x06, 0x07, 0xC0, 0x88, 0x00, 0x00
	.byte 0x05, 0x08, 0x06, 0x07, 0xD8, 0xB0, 0x00, 0x00, 0x87, 0x08, 0x08, 0x08, 0x04, 0x17, 0x15, 0x08
	.byte 0x02, 0x02, 0x01, 0x00, 0x04, 0x0E, 0x15, 0x04, 0x02, 0x02, 0x11, 0x00, 0x04, 0x03, 0x01, 0x0A
	.byte 0x02, 0x02, 0x19, 0x00, 0x04, 0x13, 0x01, 0x0A, 0x02, 0x02, 0x2D, 0x00, 0x04, 0x03, 0x06, 0x0A
	.byte 0x02, 0x02, 0x41, 0x00, 0x04, 0x13, 0x06, 0x0A, 0x02, 0x02, 0x55, 0x00, 0x04, 0x03, 0x0B, 0x0A
	.byte 0x02, 0x02, 0x69, 0x00, 0x04, 0x13, 0x0B, 0x0A, 0x02, 0x02, 0x7D, 0x00, 0x04, 0x03, 0x10, 0x0A
	.byte 0x02, 0x02, 0x91, 0x00, 0x04, 0x13, 0x10, 0x0A, 0x02, 0x02, 0xA5, 0x00, 0x04, 0x03, 0x01, 0x0A
	.byte 0x02, 0x02, 0xB9, 0x00, 0x04, 0x13, 0x01, 0x0A, 0x02, 0x02, 0xCD, 0x00, 0x04, 0x03, 0x06, 0x0A
	.byte 0x02, 0x02, 0xE1, 0x00, 0x04, 0x13, 0x06, 0x0A, 0x02, 0x02, 0xF5, 0x00, 0x04, 0x03, 0x0B, 0x0A
	.byte 0x02, 0x02, 0x09, 0x01, 0x04, 0x13, 0x0B, 0x0A, 0x02, 0x02, 0x1D, 0x01, 0x04, 0x03, 0x10, 0x0A
	.byte 0x02, 0x02, 0x31, 0x01, 0x04, 0x13, 0x10, 0x0A, 0x02, 0x02, 0x45, 0x01
