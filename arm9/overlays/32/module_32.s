
	thumb_func_start MOD32_0225D520
MOD32_0225D520: @ 0x0225D520
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
	ldr r0, _0225D5C4 @ =0x0225DDC5
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
	bl FUN_0225D60C
	adds r0, r6, #0
	bl FUN_0225D634
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225D6E0
	adds r0, r5, #0
	bl FUN_0225D748
	adds r0, r5, #0
	bl FUN_0225D788
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225DA88
	adds r0, r5, #0
	bl FUN_0225DD74
	adds r0, r4, #0
	bl FUN_0200770C
	adds r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225D5C0: .4byte 0x04001050
_0225D5C4: .4byte 0x0225DDC5
_0225D5C8: .4byte 0x00000105
	thumb_func_end MOD32_0225D520
_0225D5CC:
	.byte 0x38, 0xB5, 0x0D, 0x1C
	.byte 0x28, 0x1C, 0xC2, 0xF5, 0xD9, 0xF9, 0x04, 0x1C, 0x00, 0xF0, 0xE8, 0xFB, 0x20, 0x1C, 0x00, 0xF0
	.byte 0x6F, 0xFA, 0x20, 0x1C, 0x00, 0xF0, 0x26, 0xF9, 0x20, 0x1C, 0x00, 0xF0, 0xBF, 0xF8, 0x20, 0x68
	.byte 0x00, 0xF0, 0x68, 0xF8, 0x04, 0x20, 0xA5, 0xF5, 0xDD, 0xFB, 0x28, 0x1C, 0xA9, 0xF5, 0x1A, 0xFE
	.byte 0x08, 0x20, 0xBD, 0xF5, 0xDF, 0xF9, 0x38, 0xBD, 0x01, 0x20, 0x70, 0x47

	thumb_func_start FUN_0225D60C
FUN_0225D60C: @ 0x0225D60C
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
	thumb_func_end FUN_0225D60C

	thumb_func_start FUN_0225D634
FUN_0225D634: @ 0x0225D634
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
	thumb_func_end FUN_0225D634
_0225D6C4:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x06, 0x21, 0xBE, 0xF5, 0x3F, 0xFA, 0x20, 0x1C
	.byte 0x05, 0x21, 0xBE, 0xF5, 0x3B, 0xFA, 0x20, 0x1C, 0x04, 0x21, 0xBE, 0xF5, 0x37, 0xFA, 0x10, 0xBD

	thumb_func_start FUN_0225D6E0
FUN_0225D6E0: @ 0x0225D6E0
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
	thumb_func_end FUN_0225D6E0

	thumb_func_start FUN_0225D748
FUN_0225D748: @ 0x0225D748
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
	thumb_func_end FUN_0225D748
_0225D76C:
	.byte 0x10, 0xB5, 0x04, 0x1C
	.byte 0x52, 0x20, 0x80, 0x00, 0x20, 0x58, 0xAE, 0xF5, 0x13, 0xFB, 0x51, 0x20, 0x80, 0x00, 0x20, 0x58
	.byte 0xAE, 0xF5, 0xE0, 0xF9, 0x10, 0xBD, 0x00, 0x00

	thumb_func_start FUN_0225D788
FUN_0225D788: @ 0x0225D788
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
	bl FUN_0225D84C
	adds r0, r5, #0
	bl FUN_0225D988
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D82C: .4byte 0x0225E24C
_0225D830: .4byte 0x00050600
	thumb_func_end FUN_0225D788
_0225D834:
	.byte 0x38, 0xB5, 0x05, 0x1C, 0x00, 0x24, 0x24, 0x35, 0x28, 0x1C, 0xBF, 0xF5
	.byte 0x6F, 0xFE, 0x64, 0x1C, 0x10, 0x35, 0x12, 0x2C, 0xF8, 0xD3, 0x38, 0xBD

	thumb_func_start FUN_0225D84C
FUN_0225D84C: @ 0x0225D84C
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
	thumb_func_end FUN_0225D84C

	thumb_func_start FUN_0225D988
FUN_0225D988: @ 0x0225D988
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
	thumb_func_end FUN_0225D988

	thumb_func_start FUN_0225DA88
FUN_0225DA88: @ 0x0225DA88
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
	bl FUN_0225DADC
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225DC68
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_0225DA88
_0225DAC0:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x00, 0xF0, 0x06, 0xF9, 0x20, 0x1C, 0x00, 0xF0, 0x19, 0xF8, 0x53, 0x20
	.byte 0x80, 0x00, 0x20, 0x58, 0xC6, 0xF5, 0x16, 0xFD, 0x10, 0xBD, 0x00, 0x00

	thumb_func_start FUN_0225DADC
FUN_0225DADC: @ 0x0225DADC
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
	thumb_func_end FUN_0225DADC
_0225DB00:
	.byte 0x70, 0xB5, 0x9E, 0x26, 0x05, 0x1C, 0x00, 0x24, 0xB6, 0x00, 0xA8, 0x59, 0xAC, 0xF5, 0xE0, 0xFA
	.byte 0x64, 0x1C, 0x2D, 0x1D, 0x04, 0x2C, 0xF8, 0xD3, 0x70, 0xBD, 0x00, 0x00

	thumb_func_start FUN_0225DB1C
FUN_0225DB1C: @ 0x0225DB1C
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
	thumb_func_end FUN_0225DB1C

	thumb_func_start FUN_0225DBAC
FUN_0225DBAC: @ 0x0225DBAC
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
	thumb_func_end FUN_0225DBAC

	thumb_func_start FUN_0225DC0C
FUN_0225DC0C: @ 0x0225DC0C
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
	thumb_func_end FUN_0225DC0C

	thumb_func_start FUN_0225DC68
FUN_0225DC68: @ 0x0225DC68
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
	bl FUN_0225DB1C
	movs r1, #0xa2
	lsls r1, r1, #2
	adds r0, r6, r1
	subs r1, #0x10
	adds r1, r6, r1
	add r2, sp, #0x20
	movs r3, #1
	bl FUN_0225DBAC
	ldr r5, _0225DCD0 @ =0x0225E178
	movs r4, #0
	add r7, sp, #0x20
_0225DCB2:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl FUN_0225DC0C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0225DCB2
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0225DCCC: .4byte 0x00000781
_0225DCD0: .4byte 0x0225E178
	thumb_func_end FUN_0225DC68
_0225DCD4:
	.byte 0xF8, 0xB5, 0x07, 0x1C, 0xA6, 0x26, 0x00, 0x24, 0x3D, 0x1C, 0xB6, 0x00
	.byte 0xA8, 0x59, 0xC6, 0xF5, 0x39, 0xFD, 0x64, 0x1C, 0x2D, 0x1D, 0x04, 0x2C, 0xF8, 0xD3, 0xA2, 0x20
	.byte 0x80, 0x00, 0x38, 0x58, 0xAD, 0xF5, 0xDC, 0xF8, 0xA3, 0x20, 0x80, 0x00, 0x38, 0x58, 0xAD, 0xF5
	.byte 0xD3, 0xF9, 0xF8, 0xBD, 0xF8, 0xB5, 0x01, 0x27, 0xA6, 0x26, 0x05, 0x1C, 0x00, 0x24, 0x3F, 0x03
	.byte 0xB6, 0x00, 0xA8, 0x59, 0x39, 0x1C, 0xC6, 0xF5, 0x4B, 0xFE, 0x64, 0x1C, 0x2D, 0x1D, 0x04, 0x2C
	.byte 0xF7, 0xD3, 0xF8, 0xBD

	thumb_func_start FUN_0225DD24
FUN_0225DD24: @ 0x0225DD24
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
	thumb_func_end FUN_0225DD24

	thumb_func_start FUN_0225DD74
FUN_0225DD74: @ 0x0225DD74
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
	bl FUN_0225DD24
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0225DDA0: .4byte 0x0225E1DC
_0225DDA4: .4byte 0x0225E204
_0225DDA8: .4byte 0x0225E168
	thumb_func_end FUN_0225DD74
