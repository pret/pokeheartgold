
	thumb_func_start MOD27_02259F80
MOD27_02259F80: @ 0x02259F80
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r2, #0
	adds r6, r0, #0
	str r1, [sp, #0x10]
	ldr r2, _0225A170 @ =0x00018D00
	movs r0, #3
	movs r1, #8
	bl FUN_0201A910
	movs r0, #0
	blx FUN_020CDA64
	movs r0, #0x80
	blx FUN_020CE650
	movs r0, #1
	lsls r0, r0, #8
	blx FUN_020CE6F8
	ldr r2, _0225A174 @ =0x04001000
	ldr r0, _0225A178 @ =0xFFCFFFEF
	ldr r1, [r2]
	movs r3, #0
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r2]
	ldr r2, _0225A17C @ =0x0225D000
	adds r0, r6, #0
	movs r1, #4
	bl FUN_0201B1E4
	ldr r2, _0225A180 @ =0x0225D01C
	adds r0, r6, #0
	movs r1, #5
	movs r3, #0
	bl FUN_0201B1E4
	movs r1, #0x15
	ldr r0, _0225A184 @ =0x0225A321
	lsls r1, r1, #6
	movs r2, #0xa
	movs r3, #8
	bl FUN_02007200
	adds r7, r0, #0
	bl FUN_0201F988
	adds r4, r0, #0
	str r7, [r4, #8]
	movs r0, #0
	str r0, [r4]
	ldr r0, [sp, #0x10]
	str r6, [r4, #4]
	str r0, [r4, #0xc]
	adds r0, r5, #0
	str r5, [r4, #0x10]
	bl FUN_0225BD50
	ldr r3, _0225A188 @ =0x0000051C
	adds r2, r0, #0
	ldr r1, [r4, r3]
	movs r0, #0x1e
	bics r1, r0
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1b
	orrs r0, r1
	str r0, [r4, r3]
	ldr r1, [r4, r3]
	movs r0, #0x20
	bics r1, r0
	str r1, [r4, r3]
	movs r3, #0x3f
	lsls r3, r3, #4
	adds r0, r4, r3
	str r0, [sp]
	adds r2, r3, #0
	subs r2, #0x20
	subs r3, #0x10
	ldr r1, [r4]
	adds r0, r6, #0
	adds r2, r4, r2
	adds r3, r4, r3
	bl FUN_0225AC00
	movs r0, #4
	movs r1, #8
	bl FUN_02002CEC
	movs r0, #8
	bl FUN_0200BD08
	ldr r1, _0225A18C @ =0x000004AC
	movs r2, #0xc4
	str r0, [r4, r1]
	movs r0, #0
	movs r1, #0x1b
	movs r3, #8
	bl FUN_0200BAF8
	ldr r1, _0225A190 @ =0x000004A8
	str r0, [r4, r1]
	adds r0, r4, #0
	bl FUN_0225C10C
	adds r1, r5, #0
	adds r1, #0xd3
	ldrb r1, [r1]
	adds r0, r4, #0
	bl FUN_0225C1AC
	str r0, [r4, #0x14]
	adds r0, r4, #0
	bl FUN_0225C1EC
	adds r0, r4, #0
	bl FUN_0225AD0C
	adds r0, r4, #0
	bl FUN_0225B010
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	adds r1, #0xd2
	ldrb r1, [r1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	bl FUN_0225BB6C
	movs r3, #0
	str r3, [sp]
	movs r2, #0x3d
	ldr r0, _0225A194 @ =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	lsls r2, r2, #4
	adds r0, r4, r2
	str r3, [sp, #0xc]
	adds r2, #0xe4
	ldr r2, [r4, r2]
	movs r1, #4
	bl FUN_020200FC
	movs r1, #0
	movs r2, #0x3e
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225A194 @ =0x000F0100
	lsls r2, r2, #4
	str r0, [sp, #8]
	adds r0, r4, r2
	str r1, [sp, #0xc]
	adds r2, #0xe4
	ldr r2, [r4, r2]
	adds r3, r1, #0
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_0225BCE8
	adds r0, r4, #0
	bl FUN_0225BC84
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0225A690
	adds r0, r4, #0
	bl FUN_0225C0E0
	movs r0, #0x52
	lsls r0, r0, #4
	adds r0, r4, r0
	adds r1, r4, #0
	bl FUN_0225BDDC
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_020183F0
	cmp r0, #0
	bne _0225A102
	adds r0, r5, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x80
	adds r5, #0xd2
	bics r1, r0
	strb r1, [r5]
	b _0225A11A
_0225A102:
	adds r0, r5, #0
	bl FUN_02050590
	cmp r0, #0
	bne _0225A11A
	adds r0, r5, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x80
	adds r5, #0xd2
	orrs r0, r1
	strb r0, [r5]
_0225A11A:
	adds r0, r4, #0
	bl FUN_0225A714
	cmp r0, #0
	bne _0225A12A
	add sp, #0x14
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_0225A12A:
	adds r0, r4, #0
	bl FUN_0225A7FC
	ldr r0, [r4, #0x18]
	bl FUN_0202457C
	ldr r2, _0225A174 @ =0x04001000
	ldr r0, _0225A198 @ =0xFFFF1FFF
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	adds r0, r7, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225A170: .4byte 0x00018D00
_0225A174: .4byte 0x04001000
_0225A178: .4byte 0xFFCFFFEF
_0225A17C: .4byte 0x0225D000
_0225A180: .4byte 0x0225D01C
_0225A184: .4byte 0x0225A321
_0225A188: .4byte 0x0000051C
_0225A18C: .4byte 0x000004AC
_0225A190: .4byte 0x000004A8
_0225A194: .4byte 0x000F0100
_0225A198: .4byte 0xFFFF1FFF
	thumb_func_end MOD27_02259F80
_0225A19C:
	.byte 0xF8, 0xB5, 0x82, 0xB0
	.byte 0x00, 0x90, 0x08, 0x1C, 0x01, 0x91, 0xC5, 0xF5, 0xEF, 0xFB, 0x06, 0x1C, 0x40, 0x49, 0x00, 0x20
	.byte 0x7E, 0xF6, 0xD6, 0xED, 0x3F, 0x48, 0x05, 0xF0, 0x3C, 0xE9, 0x00, 0x28, 0x04, 0xD0, 0xFA, 0x21
	.byte 0x03, 0x20, 0x89, 0x00, 0xC0, 0xF5, 0x82, 0xFC, 0x52, 0x20, 0x00, 0x01, 0x30, 0x18, 0x01, 0xF0
	.byte 0x6F, 0xFE, 0x39, 0x48, 0x30, 0x58, 0xB1, 0xF5, 0xB5, 0xFC, 0x38, 0x48, 0x30, 0x58, 0xB1, 0xF5
	.byte 0xDF, 0xFD, 0x55, 0x27, 0x00, 0x24, 0x35, 0x1C, 0xBF, 0x00, 0xE8, 0x59, 0xB0, 0xF5, 0x60, 0xFE
	.byte 0x64, 0x1C, 0x10, 0x35, 0x0B, 0x2C, 0xF8, 0xDB, 0x56, 0x27, 0x00, 0x25, 0x34, 0x1C, 0xBF, 0x00
	.byte 0xE0, 0x59, 0xB0, 0xF5, 0x51, 0xFF, 0x6D, 0x1C, 0x10, 0x34, 0x0B, 0x2D, 0xF8, 0xDB, 0x51, 0x27
	.byte 0x00, 0x25, 0x34, 0x1C, 0xBF, 0x00, 0xE0, 0x59, 0xAF, 0xF5, 0x5A, 0xFF, 0x6D, 0x1C, 0x24, 0x1D
	.byte 0x04, 0x2D, 0xF8, 0xDB, 0x26, 0x48, 0x05, 0xF0, 0xB8, 0xE9, 0x00, 0x28, 0x04, 0xD1, 0xFA, 0x21
	.byte 0x03, 0x20, 0x89, 0x00, 0xC0, 0xF5, 0x4A, 0xFC, 0xB0, 0x69, 0xCA, 0xF5, 0x63, 0xF9, 0x3F, 0x20
	.byte 0x00, 0x01, 0x00, 0x25, 0x34, 0x18, 0x20, 0x1C, 0xC3, 0xF5, 0x6A, 0xF9, 0x6D, 0x1C, 0x10, 0x34
	.byte 0x08, 0x2D, 0xF8, 0xDB, 0x3E, 0x20, 0x00, 0x01, 0x30, 0x18, 0xC3, 0xF5, 0x61, 0xF9, 0x3D, 0x20
	.byte 0x00, 0x01, 0x30, 0x18, 0xC3, 0xF5, 0x5C, 0xF9, 0x30, 0x1C, 0x01, 0xF0, 0xE3, 0xFC, 0x04, 0x20
	.byte 0xA8, 0xF5, 0xA0, 0xFD, 0x01, 0x98, 0xAC, 0xF5, 0xDD, 0xFF, 0x00, 0x98, 0x05, 0x21, 0xC1, 0xF5
	.byte 0x65, 0xFC, 0x00, 0x98, 0x04, 0x21, 0xC1, 0xF5, 0x61, 0xFC, 0x08, 0x20, 0xC0, 0xF5, 0x9A, 0xFB
	.byte 0x0C, 0x48, 0x05, 0xF0, 0xFA, 0xE9, 0x00, 0x28, 0x04, 0xD1, 0xFA, 0x21, 0x03, 0x20, 0x89, 0x00
	.byte 0xC0, 0xF5, 0x14, 0xFC, 0x02, 0x49, 0x00, 0x20, 0x7E, 0xF6, 0x84, 0xED, 0x02, 0xB0, 0xF8, 0xBD
	.byte 0x7B, 0x00, 0x00, 0x00, 0x39, 0xC2, 0x25, 0x02, 0xA8, 0x04, 0x00, 0x00, 0xAC, 0x04, 0x00, 0x00
	.byte 0x49, 0xC2, 0x25, 0x02, 0x4D, 0xC2, 0x25, 0x02, 0x01, 0x20, 0x70, 0x47, 0x10, 0xB5, 0xC5, 0xF5
	.byte 0x5B, 0xFB, 0x04, 0x1C, 0x01, 0xD1, 0xCB, 0xF5, 0x21, 0xF9, 0x03, 0x49, 0x20, 0x20, 0x62, 0x58
	.byte 0x10, 0x43, 0x60, 0x50, 0x10, 0xBD, 0xC0, 0x46, 0x1C, 0x05, 0x00, 0x00, 0x38, 0xB5, 0x0D, 0x1C
	.byte 0xC5, 0xF5, 0x4A, 0xFB, 0x04, 0x1C, 0x01, 0xD1, 0xCB, 0xF5, 0x10, 0xF9, 0x01, 0x2D, 0x03, 0xD0
	.byte 0x02, 0x2D, 0x01, 0xD0, 0xCB, 0xF5, 0x0A, 0xF9, 0x04, 0x49, 0xC0, 0x20, 0x62, 0x58, 0x82, 0x43
	.byte 0xA8, 0x07, 0x00, 0x0E, 0x10, 0x43, 0x60, 0x50, 0x38, 0xBD, 0xC0, 0x46, 0x1C, 0x05, 0x00, 0x00
	.byte 0xF8, 0xB5, 0x0D, 0x1C, 0x28, 0x69, 0x00, 0xF0, 0xB9, 0xFA, 0x04, 0x1C, 0x28, 0x69, 0xE3, 0xF5
	.byte 0x05, 0xFF, 0x06, 0x1C, 0x28, 0x69, 0xD2, 0x30, 0x00, 0x78, 0x00, 0x06, 0xC0, 0x0F, 0x12, 0xD0
	.byte 0x00, 0x2E, 0x0C, 0xD0, 0xB5, 0xF5, 0x0A, 0xFC, 0x00, 0x28, 0x08, 0xD0, 0x2A, 0x69, 0x10, 0x1C
	.byte 0xD2, 0x30, 0x01, 0x78, 0x80, 0x20, 0xD2, 0x32, 0x81, 0x43, 0x11, 0x70, 0x07, 0xE0, 0x3F, 0x48
	.byte 0x00, 0x21, 0x01, 0x80, 0x03, 0xE0, 0x28, 0x1C, 0x21, 0x1C, 0x00, 0xF0, 0xBD, 0xFA, 0x3C, 0x48
	.byte 0x28, 0x58, 0x80, 0x06, 0xC0, 0x0F, 0x08, 0xD0, 0x68, 0x69, 0x80, 0x00, 0x29, 0x18, 0x39, 0x20
	.byte 0x00, 0x01, 0x08, 0x58, 0x02, 0x21, 0xCA, 0xF5, 0xE3, 0xFA, 0x35, 0x48, 0x28, 0x58, 0x00, 0x06
	.byte 0x80, 0x0F, 0x01, 0x28, 0x0B, 0xD1, 0xEB, 0x20, 0x80, 0x00, 0x28, 0x58, 0x02, 0x21, 0xCA, 0xF5
	.byte 0xA7, 0xFA, 0x2F, 0x49, 0xC0, 0x20, 0x6A, 0x58, 0x82, 0x43, 0x6A, 0x50, 0x0C, 0xE0, 0x02, 0x28
	.byte 0x0A, 0xD1, 0x3B, 0x20, 0x00, 0x01, 0x28, 0x58, 0x02, 0x21, 0xCA, 0xF5, 0x99, 0xFA, 0x28, 0x49
	.byte 0xC0, 0x20, 0x6A, 0x58, 0x82, 0x43, 0x6A, 0x50, 0x28, 0x69, 0xF6, 0xF5, 0xE1, 0xF8, 0x00, 0x28
	.byte 0x03, 0xD0, 0x28, 0x1C, 0x00, 0xF0, 0x12, 0xFA, 0x1B, 0xE0, 0x28, 0x69, 0xD2, 0x30, 0x00, 0x78
	.byte 0x80, 0x06, 0x80, 0x0E, 0x02, 0x28, 0x0A, 0xD1, 0x28, 0x1C, 0x00, 0xF0, 0x3F, 0xFA, 0x2A, 0x69
	.byte 0x10, 0x1C, 0xD2, 0x30, 0x01, 0x78, 0x3F, 0x20, 0xD2, 0x32, 0x81, 0x43, 0x11, 0x70, 0x00, 0x2E
	.byte 0x02, 0xD0, 0x28, 0x1C, 0x00, 0xF0, 0x32, 0xF9, 0x00, 0x2C, 0x02, 0xD1, 0x28, 0x1C, 0x01, 0xF0
	.byte 0x63, 0xF8, 0x14, 0x48, 0xCA, 0xF5, 0xF6, 0xFE, 0x06, 0x1C, 0x12, 0x48, 0xCA, 0xF5, 0x02, 0xFF
	.byte 0x07, 0x1C, 0x28, 0x1C, 0x31, 0x1C, 0x00, 0xF0, 0x83, 0xF8, 0x0D, 0x48, 0x28, 0x58, 0xC0, 0x07
	.byte 0xC0, 0x0F, 0x0A, 0xD0, 0x28, 0x1C, 0x00, 0xF0, 0x4B, 0xF8, 0x00, 0x28, 0x05, 0xD0, 0x00, 0x2C
	.byte 0x03, 0xD1, 0x28, 0x1C, 0x39, 0x1C, 0x00, 0xF0, 0x21, 0xF8, 0x52, 0x20, 0x00, 0x01, 0x28, 0x18
	.byte 0x01, 0xF0, 0xD4, 0xFC, 0xA8, 0x69, 0xCA, 0xF5, 0x91, 0xF8, 0xF8, 0xBD, 0x50, 0x10, 0x00, 0x04
	.byte 0x1C, 0x05, 0x00, 0x00, 0xCC, 0xCE, 0x25, 0x02

	thumb_func_start FUN_0225A468
FUN_0225A468: @ 0x0225A468
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	lsls r2, r4, #2
	movs r1, #0xb
	subs r1, r1, r2
	bl FUN_020248F0
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #3
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_0225A468
_0225A48C:
	.byte 0x70, 0xB5, 0x05, 0x1C
	.byte 0x00, 0x29, 0x10, 0xD1, 0x28, 0x69, 0x02, 0xF6, 0xC1, 0xFA, 0x06, 0x1C, 0x02, 0xF6, 0x4C, 0xFB
	.byte 0x04, 0x1C, 0x01, 0x21, 0x4C, 0x40, 0x28, 0x1C, 0x21, 0x1C, 0xFF, 0xF7, 0xDD, 0xFF, 0x30, 0x1C
	.byte 0x21, 0x1C, 0x02, 0xF6, 0x45, 0xFB, 0x70, 0xBD

	thumb_func_start FUN_0225A4B8
FUN_0225A4B8: @ 0x0225A4B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_0205CA1C
	bl FUN_0205CB38
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_0225A468
	pop {r4, pc}
	thumb_func_end FUN_0225A4B8

	thumb_func_start FUN_0225A4D0
FUN_0225A4D0: @ 0x0225A4D0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_0225BDC8
	adds r4, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x40]
	bl FUN_0205C700
	cmp r0, #1
	beq _0225A4F2
	ldr r0, [r5, #0x10]
	adds r0, #0xd2
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	beq _0225A4F4
_0225A4F2:
	movs r4, #0
_0225A4F4:
	cmp r4, #0
	beq _0225A512
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	b _0225A52A
_0225A512:
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
_0225A52A:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end FUN_0225A4D0
_0225A530:
	.byte 0x70, 0xB5, 0x05, 0x1C, 0x0F, 0x20, 0x80, 0x01, 0x28, 0x58, 0x0C, 0x1C, 0xCA, 0xF5, 0x34, 0xFA
	.byte 0x06, 0x1C, 0x0F, 0x20, 0x80, 0x01, 0x28, 0x58, 0xCA, 0xF5, 0xB6, 0xF9, 0x00, 0x28, 0x1D, 0xD0
	.byte 0x01, 0x2C, 0x0D, 0xD1, 0xCA, 0xF5, 0x00, 0xFF, 0x00, 0x28, 0x09, 0xD0, 0x0C, 0x48, 0x01, 0x21
	.byte 0xC1, 0x65, 0x0F, 0x20, 0x80, 0x01, 0x28, 0x58, 0x06, 0x21, 0xCA, 0xF5, 0xC1, 0xF9, 0x70, 0xBD
	.byte 0x01, 0x2C, 0x05, 0xD1, 0x06, 0x2E, 0x03, 0xD1, 0x05, 0x48, 0x01, 0x21, 0xC1, 0x65, 0x70, 0xBD
	.byte 0x0F, 0x20, 0x80, 0x01, 0x28, 0x58, 0x05, 0x21, 0xCA, 0xF5, 0xB2, 0xF9, 0x70, 0xBD, 0xC0, 0x46
	.byte 0x0C, 0x11, 0x1D, 0x02

	thumb_func_start FUN_0225A594
FUN_0225A594: @ 0x0225A594
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x10]
	adds r0, r4, #0
	bl FUN_0225BD44
	cmp r0, #0
	beq _0225A5A8
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0225A5A8:
	adds r0, r4, #0
	bl FUN_0203E13C
	cmp r0, #0
	bne _0225A5E6
	adds r0, r4, #0
	bl FUN_0205CA1C
	bl FUN_0205C6DC
	adds r7, r0, #0
	bl FUN_0205F330
	adds r6, r0, #0
	adds r0, r7, #0
	bl FUN_0205F25C
	subs r0, #0xbc
	cmp r0, #1
	bhi _0225A5DC
	cmp r6, #1
	bne _0225A5D8
	movs r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0225A5D8:
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0225A5DC:
	movs r0, #0x51
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #4
	bne _0225A61A
_0225A5E6:
	adds r0, r4, #0
	bl FUN_021E7F54
	adds r5, r0, #0
	cmp r5, #1
	bne _0225A618
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_0203DBF8
	ldr r0, [sp]
	bl FUN_0205F27C
	bl FUN_021F6BD0
	cmp r0, #0
	bne _0225A616
	ldr r0, [sp]
	bl FUN_0205F25C
	bl FUN_021F6BB0
	cmp r0, #0
	beq _0225A618
_0225A616:
	movs r5, #0
_0225A618:
	adds r0, r5, #0
_0225A61A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end FUN_0225A594

	thumb_func_start FUN_0225A61C
FUN_0225A61C: @ 0x0225A61C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x3d
	lsls r0, r0, #4
	adds r4, r1, #0
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r6, _0225A664 @ =0x0225D108
	movs r3, #0
	ldrb r4, [r6, r4]
	str r3, [sp]
	movs r2, #0x3d
	lsls r4, r4, #2
	ldr r0, _0225A668 @ =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	lsls r2, r2, #4
	adds r0, r5, r2
	str r3, [sp, #0xc]
	adds r4, r5, r4
	adds r2, #0xe0
	ldr r2, [r4, r2]
	movs r1, #4
	bl FUN_020200FC
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225A664: .4byte 0x0225D108
_0225A668: .4byte 0x000F0100
	thumb_func_end FUN_0225A61C

	thumb_func_start FUN_0225A66C
FUN_0225A66C: @ 0x0225A66C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_0225A594
	adds r4, r0, #0
	movs r0, #0x51
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, r4
	beq _0225A68E
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225A61C
	movs r0, #0x51
	lsls r0, r0, #4
	str r4, [r5, r0]
_0225A68E:
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_0225A66C

	thumb_func_start FUN_0225A690
FUN_0225A690: @ 0x0225A690
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _0225A6C0
	ldr r2, _0225A710 @ =0x0000051C
	movs r1, #1
	ldr r3, [r4, r2]
	bics r3, r1
	movs r1, #1
	orrs r1, r3
	str r1, [r4, r2]
	bl FUN_0225A4D0
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0225A9C0
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	pop {r4, pc}
_0225A6C0:
	ldr r1, _0225A710 @ =0x0000051C
	movs r0, #1
	ldr r2, [r4, r1]
	bics r2, r0
	movs r0, #0x3d
	lsls r0, r0, #4
	str r2, [r4, r1]
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x3d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D578
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0225A9C0
	pop {r4, pc}
	nop
_0225A710: .4byte 0x0000051C
	thumb_func_end FUN_0225A690

	thumb_func_start FUN_0225A714
FUN_0225A714: @ 0x0225A714
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _0225A722
	bl FUN_0202551C
_0225A722:
	ldr r4, [r5, #0x10]
	ldr r6, [r5, #0xc]
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	cmp r0, #4
	bne _0225A75C
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_020183F0
	cmp r0, #0
	bne _0225A74C
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0225A8E8
	b _0225A7AC
_0225A74C:
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x3f
	adds r4, #0xd2
	bics r1, r0
	strb r1, [r4]
	b _0225A7AC
_0225A75C:
	cmp r0, #3
	bne _0225A7AC
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_020183F0
	cmp r0, #1
	bne _0225A792
	movs r0, #1
	strh r0, [r6]
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x3f
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0xd2
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x80
	adds r4, #0xd2
	orrs r0, r1
	strb r0, [r4]
	b _0225A7AC
_0225A792:
	ldr r1, [r5, #0x14]
	adds r0, r5, #0
	bl FUN_0225B398
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x3f
	adds r4, #0xd2
	bics r1, r0
	movs r0, #1
	orrs r0, r1
	strb r0, [r4]
_0225A7AC:
	movs r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end FUN_0225A714

	thumb_func_start FUN_0225A7B0
FUN_0225A7B0: @ 0x0225A7B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_0203DF8C
	cmp r0, #1
	bne _0225A7C4
	adds r0, r4, #0
	bl FUN_0225A66C
_0225A7C4:
	ldr r0, _0225A7D8 @ =0x0000051C
	ldr r0, [r4, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	bne _0225A7D4
	adds r0, r4, #0
	bl FUN_0225AAD4
_0225A7D4:
	pop {r4, pc}
	nop
_0225A7D8: .4byte 0x0000051C
	thumb_func_end FUN_0225A7B0

	thumb_func_start FUN_0225A7DC
FUN_0225A7DC: @ 0x0225A7DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #7
	blt _0225A7EA
	bl FUN_0202551C
_0225A7EA:
	ldr r1, [r4, #0x14]
	adds r0, r4, #0
	bl FUN_0225B398
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0225A690
	pop {r4, pc}
	thumb_func_end FUN_0225A7DC

	thumb_func_start FUN_0225A7FC
FUN_0225A7FC: @ 0x0225A7FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x10]
	adds r2, r1, #0
	adds r2, #0xd2
	ldrb r2, [r2]
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x1a
	cmp r2, #4
	bhi _0225A866
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0225A81C: @ jump table
	.2byte _0225A826 - _0225A81C - 2 @ case 0
	.2byte _0225A82C - _0225A81C - 2 @ case 1
	.2byte _0225A846 - _0225A81C - 2 @ case 2
	.2byte _0225A866 - _0225A81C - 2 @ case 3
	.2byte _0225A866 - _0225A81C - 2 @ case 4
_0225A826:
	bl FUN_0225A7B0
	pop {r4, pc}
_0225A82C:
	bl FUN_0225A7DC
	ldr r2, [r4, #0x10]
	adds r0, r2, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x3f
	adds r2, #0xd2
	bics r1, r0
	movs r0, #2
	orrs r0, r1
	strb r0, [r2]
	pop {r4, pc}
_0225A846:
	ldr r0, [r1, #0x6c]
	cmp r0, #0
	beq _0225A86A
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225A86A
	adds r0, r4, #0
	bl FUN_0225B4D8
	cmp r0, #0
	beq _0225A86A
	adds r0, r4, #0
	bl FUN_0225B404
	pop {r4, pc}
_0225A866:
	bl FUN_0202551C
_0225A86A:
	pop {r4, pc}
	thumb_func_end FUN_0225A7FC
_0225A86C:
	.byte 0x10, 0xB5, 0x04, 0x1C
	.byte 0xFF, 0xF7, 0x90, 0xFE, 0x01, 0x1C, 0x20, 0x1C, 0xFF, 0xF7, 0xD0, 0xFE, 0x00, 0x21, 0x20, 0x1C
	.byte 0xC9, 0x43, 0x00, 0xF0, 0x89, 0xFD, 0x3D, 0x20, 0x00, 0x01, 0x20, 0x18, 0xC2, 0xF5, 0x74, 0xFE
	.byte 0x20, 0x1C, 0x01, 0x21, 0xFF, 0xF7, 0xFC, 0xFE, 0x10, 0xBD, 0x00, 0x00, 0x10, 0xB5, 0x04, 0x1C
	.byte 0xB5, 0xF5, 0x5C, 0xF9, 0x00, 0x28, 0x1B, 0xD0, 0xE0, 0x6E, 0x00, 0x28, 0x18, 0xD0, 0x20, 0x1C
	.byte 0xD2, 0x30, 0x00, 0x78, 0x80, 0x06, 0x80, 0x0E, 0x12, 0xD1, 0x20, 0x1C, 0xE3, 0xF5, 0x3E, 0xFC
	.byte 0x00, 0x28, 0x0D, 0xD0, 0x20, 0x1C, 0x01, 0xF0, 0x3D, 0xFA, 0x00, 0x28, 0x08, 0xD1, 0x20, 0x1C
	.byte 0xE5, 0xF5, 0x6C, 0xFF, 0x00, 0x28, 0x03, 0xD1, 0xFE, 0xF5, 0xE2, 0xF8, 0x00, 0x28, 0x01, 0xD0
	.byte 0x01, 0x20, 0x10, 0xBD, 0x00, 0x20, 0x10, 0xBD

	thumb_func_start FUN_0225A8E8
FUN_0225A8E8: @ 0x0225A8E8
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	cmp r1, #0
	beq _0225A9AE
	ldr r1, _0225A9B8 @ =0x0000051C
	ldr r1, [r4, r1]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1c
	cmp r1, #5
	bne _0225A912
	ldr r1, [r4, #0x10]
	adds r1, #0xd2
	ldrb r1, [r1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	bne _0225A912
	movs r1, #0
	mvns r1, r1
	bl FUN_0225B398
_0225A912:
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	movs r0, #0xed
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	movs r0, #0x3b
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	movs r0, #0xee
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	ldr r0, [r4, #0x10]
	adds r0, #0xd2
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	beq _0225A974
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r1, [r4, #0x14]
	adds r0, r4, r0
	bl FUN_0225B4AC
	b _0225A982
_0225A974:
	movs r0, #0x39
	lsls r0, r0, #4
	movs r1, #0
	adds r0, r4, r0
	mvns r1, r1
	bl FUN_0225B4AC
_0225A982:
	ldr r0, _0225A9B8 @ =0x0000051C
	ldr r0, [r4, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	cmp r0, #2
	bne _0225A99A
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024B78
_0225A99A:
	movs r0, #9
	str r0, [sp]
	ldr r0, _0225A9BC @ =0x04001050
	movs r1, #0
	movs r2, #0x23
	movs r3, #6
	blx FUN_020CF15C
	add sp, #4
	pop {r3, r4, pc}
_0225A9AE:
	ldr r0, _0225A9BC @ =0x04001050
	movs r1, #0
	strh r1, [r0]
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0225A9B8: .4byte 0x0000051C
_0225A9BC: .4byte 0x04001050
	thumb_func_end FUN_0225A8E8

	thumb_func_start FUN_0225A9C0
FUN_0225A9C0: @ 0x0225A9C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0225BDAC
	cmp r0, #0
	bne _0225A9D0
	movs r4, #0
_0225A9D0:
	cmp r4, #0
	beq _0225AA2E
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_0207879C
	adds r4, r0, #0
	bl FUN_020781C4
	cmp r0, #0
	beq _0225A9EA
	movs r6, #1
	b _0225A9EC
_0225A9EA:
	movs r6, #0
_0225A9EC:
	adds r0, r4, #0
	bl FUN_020781D0
	cmp r0, #0
	beq _0225A9FA
	movs r4, #1
	b _0225A9FC
_0225A9FA:
	movs r4, #0
_0225A9FC:
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_02024830
	movs r0, #0xed
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_02024830
	movs r0, #0x3b
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02024830
	movs r0, #0xee
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02024830
	pop {r4, r5, r6, pc}
_0225AA2E:
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xed
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x3b
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xee
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	pop {r4, r5, r6, pc}
	thumb_func_end FUN_0225A9C0

	thumb_func_start FUN_0225AA60
FUN_0225AA60: @ 0x0225AA60
	push {r3, r4}
	movs r4, #0
	adds r3, r4, #0
	cmp r1, #0
	ble _0225AA74
_0225AA6A:
	ldrb r2, [r0, r3]
	adds r3, r3, #1
	adds r4, r4, r2
	cmp r3, r1
	blt _0225AA6A
_0225AA74:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4}
	bx lr
	thumb_func_end FUN_0225AA60

	thumb_func_start FUN_0225AA7C
FUN_0225AA7C: @ 0x0225AA7C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _0225AACC @ =0x00000514
	movs r4, #0
	adds r5, r6, #0
_0225AA86:
	movs r0, #0x39
	adds r1, r6, r4
	lsls r0, r0, #4
	ldrb r1, [r1, r7]
	ldr r0, [r5, r0]
	bl FUN_02024830
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #7
	blt _0225AA86
	ldr r0, _0225AAD0 @ =0x0000050C
	movs r1, #1
	strb r1, [r6, r0]
	adds r0, r6, #0
	bl FUN_0225BDC8
	cmp r0, #0
	bne _0225AACA
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_02024830
	ldr r0, _0225AAD0 @ =0x0000050C
	movs r1, #0
	strb r1, [r6, r0]
_0225AACA:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225AACC: .4byte 0x00000514
_0225AAD0: .4byte 0x0000050C
	thumb_func_end FUN_0225AA7C

	thumb_func_start FUN_0225AAD4
FUN_0225AAD4: @ 0x0225AAD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0225ABF4 @ =0x00000514
	movs r1, #7
	adds r0, r5, r0
	bl FUN_0225AA60
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x3f
	lsls r0, r0, #4
	adds r0, r5, r0
	ldr r4, _0225ABF8 @ =0x0225CF10
	movs r6, #0
	adds r7, r5, #0
	str r0, [sp, #0xc]
_0225AAF6:
	ldr r0, [r5, #0x10]
	adds r1, r6, #0
	bl FUN_0203C3CC
	cmp r0, #1
	bne _0225AB62
	ldr r0, _0225ABF4 @ =0x00000514
	adds r1, r5, r6
	ldrb r0, [r1, r0]
	str r1, [sp]
	cmp r0, #0
	bne _0225AB62
	ldrh r0, [r4]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	ldrh r0, [r4]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	ldrh r1, [r4, #2]
	bl FUN_020248F0
	ldrb r0, [r4, #4]
	lsls r1, r0, #4
	ldr r0, [sp, #0xc]
	adds r0, r0, r1
	bl FUN_0201D578
	ldr r1, [sp]
	ldr r0, _0225ABF4 @ =0x00000514
	movs r2, #1
	strb r2, [r1, r0]
	adds r1, r2, #0
	subs r0, #0xa4
	strb r1, [r7, r0]
	ldr r0, [r5, #0x10]
	adds r1, r0, #0
	adds r1, #0xd2
	ldrb r2, [r1]
	movs r1, #0x80
	adds r0, #0xd2
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [sp, #8]
	adds r0, r0, #1
	str r0, [sp, #8]
_0225AB62:
	adds r6, r6, #1
	adds r4, r4, #6
	adds r7, #8
	cmp r6, #7
	blt _0225AAF6
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0225AB8E
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0225AB8E
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x3e
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D578
_0225AB8E:
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	cmp r1, r0
	beq _0225ABB2
	ldr r0, [r5, #0x10]
	movs r1, #0
	adds r0, #0xd3
	strb r1, [r0]
	ldr r1, [r5, #0x10]
	adds r0, r5, #0
	adds r1, #0xd3
	ldrb r1, [r1]
	bl FUN_0225C1AC
	str r0, [r5, #0x14]
	adds r0, r5, #0
	bl FUN_0225C1EC
_0225ABB2:
	adds r0, r5, #0
	bl FUN_0225BDC8
	cmp r0, #1
	bne _0225ABEE
	ldr r0, _0225ABFC @ =0x0000050C
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _0225ABEE
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0xa
	bl FUN_020248F0
	ldr r0, _0225ABFC @ =0x0000050C
	movs r1, #1
	strb r1, [r5, r0]
_0225ABEE:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225ABF4: .4byte 0x00000514
_0225ABF8: .4byte 0x0225CF10
_0225ABFC: .4byte 0x0000050C
	thumb_func_end FUN_0225AAD4

	thumb_func_start FUN_0225AC00
FUN_0225AC00: @ 0x0225AC00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #0x14]
	adds r4, r1, #0
	movs r0, #0xc
	muls r4, r0, r4
	movs r0, #0
	str r0, [sp]
	ldr r1, _0225ACFC @ =0x0225CEF0
	str r0, [sp, #4]
	movs r0, #1
	adds r5, r2, #0
	str r0, [sp, #8]
	movs r0, #8
	adds r6, r3, #0
	str r0, [sp, #0xc]
	ldr r1, [r1, r4]
	ldr r2, [sp, #0x14]
	movs r0, #0xe
	movs r3, #4
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	ldr r1, _0225AD00 @ =0x0225CEF4
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r1, [r1, r4]
	ldr r2, [sp, #0x14]
	movs r0, #0xe
	movs r3, #4
	bl FUN_02007914
	movs r0, #2
	ldr r1, _0225AD04 @ =0x0225CEEC
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	ldr r1, [r1, r4]
	movs r0, #0xe
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	movs r0, #0x14
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r0, #0xd2
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	adds r1, r5, #0
	movs r2, #5
	movs r3, #0x18
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r0, #0xe2
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	adds r1, r6, #0
	movs r2, #5
	movs r3, #9
	bl FUN_0201D40C
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r4, _0225AD08 @ =0x0225D074
	ldr r5, [sp, #0x30]
	movs r7, #0
	movs r6, #0xf6
_0225ACB8:
	ldr r0, [r4, #4]
	adds r1, r5, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	movs r2, #5
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r7, r7, #1
	adds r6, #0x12
	adds r4, #8
	adds r5, #0x10
	cmp r7, #8
	blt _0225ACB8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225ACFC: .4byte 0x0225CEF0
_0225AD00: .4byte 0x0225CEF4
_0225AD04: .4byte 0x0225CEEC
_0225AD08: .4byte 0x0225D074
	thumb_func_end FUN_0225AC00

	thumb_func_start FUN_0225AD0C
FUN_0225AD0C: @ 0x0225AD0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r1, r5, #0
	movs r0, #0x10
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
	movs r7, #0x51
	movs r6, #0
	adds r4, r5, #0
	lsls r7, r7, #2
_0225AD36:
	movs r0, #0xb
	adds r1, r6, #0
	movs r2, #8
	bl FUN_0200A090
	str r0, [r4, r7]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _0225AD36
	movs r0, #0x55
	lsls r0, r0, #2
	movs r4, #0
	adds r6, r5, r0
_0225AD52:
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_02028E9C
	bl FUN_02028F94
	adds r7, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_0207879C
	adds r1, r4, #0
	adds r1, #0x64
	str r1, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0225AE84 @ =0x0000051C
	movs r1, #0x51
	ldr r0, [r5, r0]
	lsls r1, r1, #2
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	adds r1, r5, r1
	adds r2, r6, #0
	adds r3, r4, #0
	bl FUN_0225AEA8
	adds r4, r4, #1
	adds r6, #0x10
	cmp r4, #0xb
	blt _0225AD52
	movs r1, #0x64
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #8
	adds r1, #0xe8
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xe
	movs r2, #0x10
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x57
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r1, #0x64
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #8
	adds r1, #0xec
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xe
	movs r2, #0x11
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x16
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r1, #0x65
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #8
	adds r1, #0xe7
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xe
	movs r2, #0x44
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r1, #0x65
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #8
	adds r1, #0xeb
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xe
	movs r2, #0x45
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r1, #0x66
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #8
	adds r1, #0xe6
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xe
	movs r2, #0x36
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x5f
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r1, #0x66
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #8
	adds r1, #0xea
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xe
	movs r2, #0x37
	movs r3, #1
	bl FUN_0200A294
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #0xe
	adds r1, r0, #0
	add r2, sp, #0x10
	movs r3, #8
	bl FUN_020079F4
	adds r4, r0, #0
	ldr r0, [sp, #0x10]
	movs r1, #0x40
	ldr r0, [r0, #0xc]
	blx FUN_020D2894
	ldr r0, [sp, #0x10]
	ldr r1, _0225AE88 @ =0x000004CC
	ldr r0, [r0, #0xc]
	adds r1, r5, r1
	movs r2, #0x40
	blx FUN_020D48B4
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225AE84: .4byte 0x0000051C
_0225AE88: .4byte 0x000004CC
	thumb_func_end FUN_0225AD0C

	thumb_func_start FUN_0225AE8C
FUN_0225AE8C: @ 0x0225AE8C
	cmp r0, #1
	bne _0225AE94
	movs r0, #5
	bx lr
_0225AE94:
	cmp r0, #3
	bne _0225AE9E
	movs r0, #0x7d
	lsls r0, r0, #2
	bx lr
_0225AE9E:
	ldr r0, _0225AEA4 @ =0x000001F3
	bx lr
	nop
_0225AEA4: .4byte 0x000001F3
	thumb_func_end FUN_0225AE8C

	thumb_func_start FUN_0225AEA8
FUN_0225AEA8: @ 0x0225AEA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	mov ip, r0
	ldr r0, [sp, #0x44]
	str r1, [sp, #0x10]
	lsls r1, r0, #3
	ldr r0, _0225B004 @ =0x0225CFC8
	adds r5, r3, #0
	adds r0, r0, r1
	ldrb r1, [r5, r0]
	movs r0, #1
	movs r6, #0xe
	adds r4, r2, #0
	movs r2, #0x12
	ldr r7, [sp, #0x40]
	str r6, [sp, #0x20]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x18]
	cmp r1, #0xd
	beq _0225AF22
	cmp r1, #2
	bne _0225AEDE
	ldr r0, [sp, #0x3c]
	cmp r0, #1
	bne _0225AEDE
	movs r2, #0x1b
	b _0225AF22
_0225AEDE:
	ldr r0, _0225B008 @ =0x0225CF94
	lsls r1, r1, #2
	ldrh r2, [r0, r1]
	ldr r0, _0225B00C @ =0x0000FFFF
	cmp r2, r0
	bne _0225AF22
	mov r0, ip
	bl FUN_0206DB28
	str r0, [sp, #0x14]
	cmp r0, #0
	bne _0225AEFA
	bl FUN_0202551C
_0225AEFA:
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, #0x17]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _0225AF20
	movs r0, #0
	str r0, [sp, #0x1c]
	movs r0, #3
	movs r6, #0x14
	str r0, [sp, #0x18]
	bl FUN_02074490
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	ldr r0, [r0, #0x10]
	bl FUN_020741B0
	adds r2, r0, #0
	b _0225AF22
_0225AF20:
	movs r2, #0x12
_0225AF22:
	cmp r5, #7
	bne _0225AF4A
	movs r0, #0
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	movs r6, #0x12
	bl FUN_020781C4
	movs r1, #2
	bl FUN_02077C18
	str r0, [sp, #0x20]
	adds r0, r7, #0
	bl FUN_020781C4
	movs r1, #1
	bl FUN_02077C18
	adds r2, r0, #0
	b _0225AFAC
_0225AF4A:
	cmp r5, #8
	bne _0225AF72
	movs r0, #0
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	movs r6, #0x12
	bl FUN_020781D0
	movs r1, #2
	bl FUN_02077C18
	str r0, [sp, #0x20]
	adds r0, r7, #0
	bl FUN_020781D0
	movs r1, #1
	bl FUN_02077C18
	adds r2, r0, #0
	b _0225AFAC
_0225AF72:
	cmp r5, #9
	bne _0225AF82
	movs r0, #7
	str r0, [sp, #0x20]
	movs r0, #4
	movs r2, #0x46
	str r0, [sp, #0x18]
	b _0225AFAC
_0225AF82:
	cmp r5, #0xa
	bne _0225AFAC
	ldr r0, [sp, #0x44]
	bl FUN_0225AE8C
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	movs r1, #2
	movs r6, #0x12
	bl FUN_02077C18
	str r0, [sp, #0x20]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl FUN_02077C18
	adds r2, r0, #0
_0225AFAC:
	ldr r0, [sp, #0x38]
	ldr r3, [sp, #0x1c]
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	adds r1, r6, #0
	ldr r0, [r0]
	bl FUN_0200A1D8
	str r0, [r4]
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	adds r1, r6, #0
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	movs r3, #0
	ldr r0, [r0, #4]
	bl FUN_0200A234
	str r0, [r4, #4]
	ldr r0, [r4]
	bl FUN_0200ADA4
	ldr r0, [r4]
	bl FUN_0200A740
	ldr r0, [r4, #4]
	bl FUN_0200B00C
	ldr r0, [r4, #4]
	bl FUN_0200A740
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0225B004: .4byte 0x0225CFC8
_0225B008: .4byte 0x0225CF94
_0225B00C: .4byte 0x0000FFFF
	thumb_func_end FUN_0225AEA8

	thumb_func_start FUN_0225B010
FUN_0225B010: @ 0x0225B010
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	adds r5, r0, #0
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r4, _0225B350 @ =0x0225CF3C
	movs r7, #0
	adds r6, r5, r0
_0225B020:
	ldr r3, [r4]
	movs r0, #0
	str r3, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r7, #0
	str r0, [sp, #0x14]
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, #0x64
	str r0, [sp, #0x18]
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r1, #0
	str r0, [sp, #0x1c]
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	str r0, [sp, #0x20]
	movs r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r6, #0
	bl FUN_02009D48
	adds r7, r7, #1
	adds r4, r4, #4
	adds r6, #0x24
	cmp r7, #0xb
	blt _0225B020
	ldr r0, [r5, #0x18]
	add r1, sp, #0x3c
	str r0, [sp, #0x3c]
	movs r0, #0x81
	lsls r0, r0, #2
	adds r7, r5, r0
	movs r0, #0
	str r0, [sp, #0x2c]
	str r0, [sp, #0x4c]
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x2c]
	str r7, [sp, #0x40]
	strh r0, [r1, #0x20]
	movs r0, #1
	str r0, [sp, #0x60]
	movs r0, #2
	str r0, [sp, #0x64]
	movs r0, #8
	ldr r6, _0225B354 @ =0x0225D038
	str r0, [sp, #0x68]
	adds r4, r5, #0
_0225B0A0:
	ldrh r0, [r6]
	str r7, [sp, #0x40]
	cmp r0, #0
	beq _0225B0BA
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225B0C8
_0225B0BA:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225B0C8:
	blx FUN_020F2104
	str r0, [sp, #0x44]
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _0225B0E6
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225B0F4
_0225B0E6:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225B0F4:
	blx FUN_020F2104
	movs r1, #1
	lsls r1, r1, #0x14
	adds r0, r0, r1
	str r0, [sp, #0x48]
	add r0, sp, #0x3c
	bl FUN_02024624
	movs r1, #0x39
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024A04
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202487C
	ldr r0, [sp, #0x2c]
	adds r7, #0x24
	adds r0, r0, #1
	adds r6, r6, #4
	adds r4, r4, #4
	str r0, [sp, #0x2c]
	cmp r0, #9
	blt _0225B0A0
	movs r0, #9
	str r0, [sp, #0x30]
	movs r0, #0xd2
	lsls r0, r0, #2
	adds r4, r5, #0
	movs r7, #0x3f
	adds r0, r5, r0
	ldr r6, _0225B358 @ =0x0225D05C
	adds r4, #0x24
	lsls r7, r7, #0x18
	str r0, [sp, #0x38]
_0225B154:
	ldr r0, [sp, #0x38]
	str r0, [sp, #0x40]
	ldrh r0, [r6]
	cmp r0, #0
	beq _0225B16E
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F1520
	b _0225B17A
_0225B16E:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r7, #0
	blx FUN_020F24C8
_0225B17A:
	blx FUN_020F2104
	str r0, [sp, #0x44]
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _0225B196
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F1520
	b _0225B1A2
_0225B196:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r7, #0
	blx FUN_020F24C8
_0225B1A2:
	blx FUN_020F2104
	movs r1, #1
	lsls r1, r1, #0x14
	adds r0, r0, r1
	str r0, [sp, #0x48]
	add r0, sp, #0x3c
	bl FUN_02024624
	movs r1, #0x39
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_02024A04
	ldr r0, [sp, #0x30]
	adds r6, r6, #4
	adds r0, r0, #1
	adds r4, r4, #4
	str r0, [sp, #0x30]
	cmp r0, #0xf
	blt _0225B154
	ldr r0, _0225B35C @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1b
	lsrs r1, r0, #0x1c
	subs r0, r1, #1
	cmp r0, #2
	bhi _0225B27E
	cmp r1, #1
	bne _0225B1F6
	movs r0, #0x90
	str r0, [sp, #0x34]
	b _0225B200
_0225B1F6:
	subs r0, r1, #2
	cmp r0, #1
	bhi _0225B200
	movs r0, #0x68
	str r0, [sp, #0x34]
_0225B200:
	movs r0, #0xdb
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp, #0x40]
	movs r0, #0x19
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x34]
	cmp r0, #0
	ble _0225B238
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225B246
_0225B238:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225B246:
	blx FUN_020F2104
	movs r1, #1
	lsls r1, r1, #0x14
	adds r0, r0, r1
	str r0, [sp, #0x48]
	add r0, sp, #0x3c
	bl FUN_02024624
	movs r1, #0xf3
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0xf3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024A04
	movs r0, #0xf3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	bl FUN_020248F0
_0225B27E:
	ldr r0, _0225B35C @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	cmp r0, #2
	bne _0225B2D2
	ldr r0, [r5, #0x10]
	bl FUN_0206DB28
	adds r4, r0, #0
	bne _0225B298
	bl FUN_0202551C
_0225B298:
	ldrb r0, [r4, #0x17]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _0225B2E2
	movs r0, #0xea
	lsls r0, r0, #2
	movs r3, #1
	ldr r0, [r5, r0]
	movs r1, #0x68
	movs r2, #0x88
	lsls r3, r3, #0x14
	bl FUN_0200DDC4
	ldr r0, [r4, #0x10]
	bl FUN_02074484
	adds r1, r0, #0
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02024AA8
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	bl FUN_020248F0
	b _0225B2E2
_0225B2D2:
	cmp r0, #3
	bne _0225B2E2
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
_0225B2E2:
	movs r0, #0xed
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_020248F0
	movs r0, #0xee
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #8
	bl FUN_020248F0
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_020248F0
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #5
	bl FUN_020248F0
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0xc
	bl FUN_020248F0
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024A04
	adds r0, r5, #0
	bl FUN_0225A4B8
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0225A9C0
	adds r0, r5, #0
	bl FUN_0225AA7C
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	nop
_0225B350: .4byte 0x0225CF3C
_0225B354: .4byte 0x0225D038
_0225B358: .4byte 0x0225D05C
_0225B35C: .4byte 0x0000051C
	thumb_func_end FUN_0225B010

	thumb_func_start FUN_0225B360
FUN_0225B360: @ 0x0225B360
	push {r3, r4, r5, r6}
	movs r5, #0xc
	muls r5, r0, r5
	ldr r6, _0225B394 @ =0x0225D0B4
	lsls r0, r1, #1
	movs r4, #0
	adds r5, r6, r5
	adds r0, r1, r0
	mvns r4, r4
	movs r3, #0
	adds r5, r5, r0
_0225B376:
	ldrb r1, [r5]
	lsls r0, r1, #3
	ldrb r0, [r2, r0]
	cmp r0, #0
	beq _0225B384
	adds r4, r1, #0
	b _0225B38C
_0225B384:
	adds r3, r3, #1
	adds r5, r5, #1
	cmp r3, #3
	blt _0225B376
_0225B38C:
	adds r0, r4, #0
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0225B394: .4byte 0x0225D0B4
	thumb_func_end FUN_0225B360

	thumb_func_start FUN_0225B398
FUN_0225B398: @ 0x0225B398
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	str r1, [sp]
	cmp r1, #7
	blt _0225B3A6
	bl FUN_0202551C
_0225B3A6:
	ldr r0, _0225B3F0 @ =0x000004CC
	movs r4, #0
	adds r5, r4, #0
	adds r7, r6, r0
_0225B3AE:
	ldr r0, _0225B3F4 @ =0x0000051C
	ldr r0, [r6, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	lsls r1, r0, #3
	ldr r0, _0225B3F8 @ =0x0225CFC8
	adds r0, r0, r1
	ldrb r1, [r4, r0]
	ldr r0, _0225B3FC @ =0x0225CF94
	lsls r2, r1, #2
	ldrh r0, [r0, r2]
	movs r2, #0
	cmp r1, #0xd
	beq _0225B3E4
	ldr r1, _0225B400 @ =0x0000FFFF
	cmp r0, r1
	beq _0225B3E4
	ldr r0, [sp]
	cmp r4, r0
	bne _0225B3D8
	movs r2, #0x10
_0225B3D8:
	lsls r0, r2, #1
	adds r0, r7, r0
	adds r1, r5, #0
	movs r2, #0x20
	blx FUN_020CFD70
_0225B3E4:
	adds r4, r4, #1
	adds r5, #0x20
	cmp r4, #7
	blt _0225B3AE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225B3F0: .4byte 0x000004CC
_0225B3F4: .4byte 0x0000051C
_0225B3F8: .4byte 0x0225CFC8
_0225B3FC: .4byte 0x0225CF94
_0225B400: .4byte 0x0000FFFF
	thumb_func_end FUN_0225B398

	thumb_func_start FUN_0225B404
FUN_0225B404: @ 0x0225B404
	push {r3, r4, r5, lr}
	ldr r1, _0225B4A8 @ =0x021D110C
	adds r5, r0, #0
	ldr r1, [r1, #0x48]
	movs r4, #0
	movs r2, #0x40
	mvns r4, r4
	ldr r0, [r5, #0x14]
	tst r2, r1
	beq _0225B41C
	movs r4, #0
	b _0225B438
_0225B41C:
	movs r2, #0x80
	tst r2, r1
	beq _0225B426
	movs r4, #1
	b _0225B438
_0225B426:
	movs r2, #0x20
	tst r2, r1
	beq _0225B430
	movs r4, #2
	b _0225B438
_0225B430:
	movs r2, #0x10
	tst r1, r2
	beq _0225B438
	movs r4, #3
_0225B438:
	cmp r4, #0
	blt _0225B448
	movs r2, #0x47
	lsls r2, r2, #4
	adds r1, r4, #0
	adds r2, r5, r2
	bl FUN_0225B360
_0225B448:
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0225B4A6
	ldr r1, [r5, #0x14]
	cmp r1, r0
	beq _0225B4A6
	str r0, [r5, #0x14]
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	cmp r4, #1
	bhi _0225B478
	ldr r0, [r5, #0x14]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #3
	bl FUN_020248F0
	b _0225B490
_0225B478:
	subs r0, r4, #2
	cmp r0, #1
	bhi _0225B490
	ldr r0, [r5, #0x14]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_020248F0
_0225B490:
	ldr r1, [r5, #0x14]
	adds r0, r5, #0
	bl FUN_0225B398
	ldr r1, [r5, #0x14]
	adds r0, r5, #0
	bl FUN_0225C170
	ldr r1, [r5, #0x10]
	adds r1, #0xd3
	strb r0, [r1]
_0225B4A6:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225B4A8: .4byte 0x021D110C
	thumb_func_end FUN_0225B404

	thumb_func_start FUN_0225B4AC
FUN_0225B4AC: @ 0x0225B4AC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	movs r7, #1
_0225B4B6:
	ldr r0, [r5]
	cmp r0, #0
	beq _0225B4CE
	cmp r6, r4
	beq _0225B4C8
	adds r1, r7, #0
	bl FUN_02024B78
	b _0225B4CE
_0225B4C8:
	movs r1, #0
	bl FUN_02024B78
_0225B4CE:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #9
	blt _0225B4B6
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end FUN_0225B4AC

	thumb_func_start FUN_0225B4D8
FUN_0225B4D8: @ 0x0225B4D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x40]
	bl FUN_0205C6D4
	cmp r0, #0
	bne _0225B4F2
	ldr r0, _0225B624 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0xf0
	tst r0, r1
	beq _0225B4F6
_0225B4F2:
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B4F6:
	ldr r0, _0225B628 @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	cmp r0, #5
	bne _0225B53E
	bl FUN_0203769C
	adds r4, r0, #0
	bl FUN_02058740
	cmp r0, #0
	beq _0225B53A
	bl FUN_02058258
	cmp r0, #0
	beq _0225B53A
	bl FUN_02056EE0
	cmp r0, #0
	beq _0225B53A
	bl FUN_02057A0C
	cmp r0, #0
	beq _0225B53A
	adds r0, r4, #0
	bl FUN_02057F18
	cmp r0, #0
	bne _0225B53A
	bl FUN_02037958
	cmp r0, #0
	beq _0225B53E
_0225B53A:
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B53E:
	bl FUN_0200FB5C
	cmp r0, #0
	bne _0225B54A
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B54A:
	ldr r0, _0225B628 @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0225B55A
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B55A:
	ldr r0, _0225B62C @ =0x0225CF68
	bl FUN_02025224
	adds r4, r0, #0
	cmp r4, #0
	ble _0225B57E
	cmp r4, #8
	bge _0225B57E
	subs r0, r4, #1
	lsls r0, r0, #3
	adds r1, r5, r0
	movs r0, #0x47
	lsls r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0225B57E
	movs r0, #0
	pop {r4, r5, r6, pc}
_0225B57E:
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_0207879C
	adds r6, r0, #0
	adds r0, r4, #0
	subs r0, #8
	cmp r0, #1
	bhi _0225B5AC
	ldr r0, _0225B628 @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _0225B59E
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B59E:
	adds r0, r5, #0
	bl FUN_0225BDAC
	cmp r0, #0
	bne _0225B5AC
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B5AC:
	cmp r4, #8
	bne _0225B5BE
	adds r0, r6, #0
	bl FUN_020781C4
	cmp r0, #0
	bne _0225B5D0
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B5BE:
	cmp r4, #9
	bne _0225B5D0
	adds r0, r6, #0
	bl FUN_020781D0
	cmp r0, #0
	bne _0225B5D0
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B5D0:
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _0225B620
	cmp r4, #0
	bne _0225B5E4
	ldr r0, [r5, #0xc]
	movs r1, #1
	strh r1, [r0]
	b _0225B61C
_0225B5E4:
	subs r1, r4, #1
	lsls r0, r1, #2
	adds r2, r5, r0
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225B61C
	cmp r4, #8
	bge _0225B60E
	str r1, [r5, #0x14]
	adds r0, r5, #0
	bl FUN_0225C170
	ldr r1, [r5, #0x10]
	adds r1, #0xd3
	strb r0, [r1]
	ldr r1, [r5, #0x14]
	adds r0, r5, #0
	bl FUN_0225B398
_0225B60E:
	adds r0, r5, #0
	subs r1, r4, #1
	bl FUN_0225C170
	adds r1, r0, #2
	ldr r0, [r5, #0xc]
	strh r1, [r0]
_0225B61C:
	movs r0, #0
	pop {r4, r5, r6, pc}
_0225B620:
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225B624: .4byte 0x021D110C
_0225B628: .4byte 0x0000051C
_0225B62C: .4byte 0x0225CF68
	thumb_func_end FUN_0225B4D8
_0225B630:
	.byte 0xF0, 0xB5, 0x87, 0xB0, 0x07, 0x1C, 0x04, 0x91, 0x3E, 0x68, 0xC3, 0xF5, 0x2D, 0xFC, 0x05, 0x1C
	.byte 0x38, 0x1C, 0xC3, 0xF5, 0x2B, 0xFC, 0x04, 0x1C, 0x38, 0x1C, 0xC3, 0xF5, 0x21, 0xFC, 0x05, 0x90
	.byte 0x38, 0x1C, 0xC3, 0xF5, 0x1F, 0xFC, 0x06, 0x90, 0x04, 0x98, 0x01, 0x28, 0x03, 0xD0, 0x02, 0x28
	.byte 0x00, 0xD1, 0x2E, 0xE1, 0x5B, 0xE2, 0x60, 0x1E, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20
	.byte 0x01, 0x90, 0xEB, 0x1E, 0x02, 0x90, 0x02, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21
	.byte 0xA9, 0x22, 0x1B, 0x0E, 0xC1, 0xF5, 0x1E, 0xF9, 0x60, 0x1E, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90
	.byte 0x01, 0x20, 0x01, 0x90, 0xAB, 0x1E, 0x02, 0x90, 0x02, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C
	.byte 0x04, 0x21, 0xAA, 0x22, 0x1B, 0x0E, 0xC1, 0xF5, 0x0D, 0xF9, 0x60, 0x1E, 0x00, 0x06, 0x00, 0x0E
	.byte 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0x6B, 0x1E, 0x02, 0x90, 0x02, 0x20, 0x1B, 0x06, 0x03, 0x90
	.byte 0x30, 0x1C, 0x04, 0x21, 0xAB, 0x22, 0x1B, 0x0E, 0xC1, 0xF5, 0xFC, 0xF8, 0x60, 0x1E, 0x00, 0x06
	.byte 0x00, 0x0E, 0x00, 0x90, 0x05, 0x98, 0x2B, 0x06, 0x00, 0x06, 0x00, 0x0E, 0x01, 0x90, 0x01, 0x20
	.byte 0x02, 0x90, 0x02, 0x20, 0x03, 0x90, 0x30, 0x1C, 0x05, 0x21, 0xAC, 0x22, 0x1B, 0x0E, 0xC1, 0xF5
	.byte 0xE9, 0xF8, 0x05, 0x98, 0x05, 0x21, 0x2F, 0x18, 0x60, 0x1E, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90
	.byte 0x01, 0x20, 0x01, 0x90, 0x02, 0x90, 0x02, 0x20, 0x3B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0xAD, 0x22
	.byte 0x1B, 0x0E, 0xC1, 0xF5, 0xD7, 0xF8, 0x20, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90
	.byte 0xEB, 0x1E, 0x02, 0x90, 0x02, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0x64, 0x22
	.byte 0x1B, 0x0E, 0xC1, 0xF5, 0xC7, 0xF8, 0x20, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90
	.byte 0xAB, 0x1E, 0x02, 0x90, 0x02, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0x65, 0x22
	.byte 0x1B, 0x0E, 0xC1, 0xF5, 0xB7, 0xF8, 0x20, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90
	.byte 0x6B, 0x1E, 0x02, 0x90, 0x02, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0x66, 0x22
	.byte 0x1B, 0x0E, 0xC1, 0xF5, 0xA7, 0xF8, 0x20, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90
	.byte 0x02, 0x90, 0x02, 0x20, 0x3B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x05, 0x21, 0x68, 0x22, 0x1B, 0x0E
	.byte 0xC1, 0xF5, 0x98, 0xF8, 0x60, 0x1C, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90
	.byte 0xEB, 0x1E, 0x02, 0x90, 0x02, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0x84, 0x22
	.byte 0x1B, 0x0E, 0xC1, 0xF5, 0x87, 0xF8, 0x60, 0x1C, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20
	.byte 0x01, 0x90, 0xAB, 0x1E, 0x02, 0x90, 0x02, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21
	.byte 0x85, 0x22, 0x1B, 0x0E, 0xC1, 0xF5, 0x76, 0xF8, 0x60, 0x1C, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90
	.byte 0x01, 0x20, 0x01, 0x90, 0x6B, 0x1E, 0x02, 0x90, 0x02, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C
	.byte 0x04, 0x21, 0x86, 0x22, 0x1B, 0x0E, 0xC1, 0xF5, 0x65, 0xF8, 0x60, 0x1C, 0x00, 0x06, 0x00, 0x0E
	.byte 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0x02, 0x90, 0x02, 0x20, 0x3B, 0x06, 0x03, 0x90, 0x30, 0x1C
	.byte 0x05, 0x21, 0x88, 0x22, 0x1B, 0x0E, 0xC1, 0xF5, 0x55, 0xF8, 0x06, 0x98, 0xEB, 0x1E, 0x24, 0x18
	.byte 0x20, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0x02, 0x90, 0x02, 0x20, 0x1B, 0x06
	.byte 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0xA4, 0x22, 0x1B, 0x0E, 0xC1, 0xF5, 0x43, 0xF8, 0x20, 0x06
	.byte 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0xAB, 0x1E, 0x02, 0x90, 0x02, 0x20, 0x1B, 0x06
	.byte 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0xA5, 0x22, 0x1B, 0x0E, 0xC1, 0xF5, 0x33, 0xF8, 0x20, 0x06
	.byte 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0x6B, 0x1E, 0x02, 0x90, 0x02, 0x20, 0x1B, 0x06
	.byte 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0xA6, 0x22, 0x1B, 0x0E, 0xC1, 0xF5, 0x23, 0xF8, 0x20, 0x06
	.byte 0x00, 0x0E, 0x00, 0x90, 0x05, 0x98, 0x2B, 0x06, 0x00, 0x06, 0x00, 0x0E, 0x01, 0x90, 0x01, 0x20
	.byte 0x02, 0x90, 0x02, 0x20, 0x03, 0x90, 0x30, 0x1C, 0x05, 0x21, 0xA7, 0x22, 0x1B, 0x0E, 0xC1, 0xF5
	.byte 0x11, 0xF8, 0x20, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0x02, 0x90, 0x02, 0x20
	.byte 0x3B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x05, 0x21, 0xA8, 0x22, 0x1B, 0x0E, 0xC1, 0xF5, 0x02, 0xF8
	.byte 0x2F, 0xE1, 0x60, 0x1E, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0xEB, 0x1E
	.byte 0x02, 0x90, 0x00, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0x07, 0x22, 0x1B, 0x0E
	.byte 0xC0, 0xF5, 0xF0, 0xFF, 0x60, 0x1E, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90
	.byte 0xAB, 0x1E, 0x02, 0x90, 0x00, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0x07, 0x22
	.byte 0x1B, 0x0E, 0xC0, 0xF5, 0xDF, 0xFF, 0x60, 0x1E, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20
	.byte 0x01, 0x90, 0x6B, 0x1E, 0x02, 0x90, 0x00, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21
	.byte 0x07, 0x22, 0x1B, 0x0E, 0xC0, 0xF5, 0xCE, 0xFF, 0x60, 0x1E, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90
	.byte 0x05, 0x98, 0x2B, 0x06, 0x00, 0x06, 0x00, 0x0E, 0x01, 0x90, 0x01, 0x20, 0x02, 0x90, 0x02, 0x20
	.byte 0x03, 0x90, 0x30, 0x1C, 0x05, 0x21, 0x00, 0x22, 0x1B, 0x0E, 0xC0, 0xF5, 0xBB, 0xFF, 0x05, 0x98
	.byte 0x05, 0x21, 0x2F, 0x18, 0x60, 0x1E, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90
	.byte 0x02, 0x90, 0x02, 0x20, 0x3B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x00, 0x22, 0x1B, 0x0E, 0xC0, 0xF5
	.byte 0xA9, 0xFF, 0x20, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0xEB, 0x1E, 0x02, 0x90
	.byte 0x00, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0x07, 0x22, 0x1B, 0x0E, 0xC0, 0xF5
	.byte 0x99, 0xFF, 0x20, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0xAB, 0x1E, 0x02, 0x90
	.byte 0x00, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0x07, 0x22, 0x1B, 0x0E, 0xC0, 0xF5
	.byte 0x89, 0xFF, 0x20, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0x6B, 0x1E, 0x02, 0x90
	.byte 0x00, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0x07, 0x22, 0x1B, 0x0E, 0xC0, 0xF5
	.byte 0x79, 0xFF, 0x20, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0x02, 0x90, 0x02, 0x20
	.byte 0x3B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x05, 0x21, 0x00, 0x22, 0x1B, 0x0E, 0xC0, 0xF5, 0x6A, 0xFF
	.byte 0x60, 0x1C, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0xEB, 0x1E, 0x02, 0x90
	.byte 0x00, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0x07, 0x22, 0x1B, 0x0E, 0xC0, 0xF5
	.byte 0x59, 0xFF, 0x60, 0x1C, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0xAB, 0x1E
	.byte 0x02, 0x90, 0x00, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0x07, 0x22, 0x1B, 0x0E
	.byte 0xC0, 0xF5, 0x48, 0xFF, 0x60, 0x1C, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90
	.byte 0x6B, 0x1E, 0x02, 0x90, 0x00, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x04, 0x21, 0x07, 0x22
	.byte 0x1B, 0x0E, 0xC0, 0xF5, 0x37, 0xFF, 0x60, 0x1C, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20
	.byte 0x01, 0x90, 0x02, 0x90, 0x02, 0x20, 0x3B, 0x06, 0x03, 0x90, 0x30, 0x1C, 0x05, 0x21, 0x00, 0x22
	.byte 0x1B, 0x0E, 0xC0, 0xF5, 0x27, 0xFF, 0x06, 0x98, 0xEB, 0x1E, 0x24, 0x18, 0x20, 0x06, 0x00, 0x0E
	.byte 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0x02, 0x90, 0x00, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C
	.byte 0x04, 0x21, 0x07, 0x22, 0x1B, 0x0E, 0xC0, 0xF5, 0x15, 0xFF, 0x20, 0x06, 0x00, 0x0E, 0x00, 0x90
	.byte 0x01, 0x20, 0x01, 0x90, 0xAB, 0x1E, 0x02, 0x90, 0x00, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C
	.byte 0x04, 0x21, 0x07, 0x22, 0x1B, 0x0E, 0xC0, 0xF5, 0x05, 0xFF, 0x20, 0x06, 0x00, 0x0E, 0x00, 0x90
	.byte 0x01, 0x20, 0x01, 0x90, 0x6B, 0x1E, 0x02, 0x90, 0x00, 0x20, 0x1B, 0x06, 0x03, 0x90, 0x30, 0x1C
	.byte 0x04, 0x21, 0x07, 0x22, 0x1B, 0x0E, 0xC0, 0xF5, 0xF5, 0xFE, 0x20, 0x06, 0x00, 0x0E, 0x00, 0x90
	.byte 0x05, 0x98, 0x2B, 0x06, 0x00, 0x06, 0x00, 0x0E, 0x01, 0x90, 0x01, 0x20, 0x02, 0x90, 0x02, 0x20
	.byte 0x03, 0x90, 0x30, 0x1C, 0x05, 0x21, 0x00, 0x22, 0x1B, 0x0E, 0xC0, 0xF5, 0xE3, 0xFE, 0x20, 0x06
	.byte 0x00, 0x0E, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0x02, 0x90, 0x02, 0x20, 0x3B, 0x06, 0x03, 0x90
	.byte 0x30, 0x1C, 0x05, 0x21, 0x00, 0x22, 0x1B, 0x0E, 0xC0, 0xF5, 0xD4, 0xFE, 0x01, 0xE0, 0xC9, 0xF5
	.byte 0xFD, 0xFC, 0x30, 0x1C, 0x04, 0x21, 0xC3, 0xF5, 0x49, 0xFA, 0x30, 0x1C, 0x05, 0x21, 0xC3, 0xF5
	.byte 0x45, 0xFA, 0x07, 0xB0, 0xF0, 0xBD, 0x00, 0x00, 0x70, 0xB5, 0x84, 0xB0, 0x0E, 0x1C, 0x0A, 0x49
	.byte 0x92, 0x00, 0x8C, 0x58, 0x05, 0x1C, 0x21, 0x06, 0x09, 0x0E, 0xC1, 0xF5, 0x15, 0xFF, 0x00, 0x21
	.byte 0x00, 0x91, 0x01, 0x91, 0x02, 0x94, 0x28, 0x1C, 0x32, 0x1C, 0x03, 0x23, 0x03, 0x91, 0xC4, 0xF5
	.byte 0xCD, 0xFA, 0x04, 0xB0, 0x70, 0xBD, 0xC0, 0x46, 0xC4, 0xCE, 0x25, 0x02

	thumb_func_start FUN_0225BB6C
FUN_0225BB6C: @ 0x0225BB6C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_02028E9C
	adds r2, r0, #0
	ldr r0, _0225BC10 @ =0x000004AC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BE48
	ldr r7, _0225BC14 @ =0x0225CFC8
	movs r4, #0
	adds r6, r5, #0
_0225BB8A:
	ldr r0, _0225BC18 @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	lsls r0, r0, #3
	adds r0, r7, r0
	ldrb r2, [r4, r0]
	cmp r2, #0xd
	beq _0225BBBA
	lsls r3, r2, #2
	ldr r2, _0225BC1C @ =0x0225CF94
	ldr r0, _0225BC10 @ =0x000004AC
	adds r2, r2, r3
	ldrh r2, [r2, #2]
	ldr r1, _0225BC20 @ =0x000004A8
	ldr r0, [r5, r0]
	lsls r2, r2, #0x11
	ldr r1, [r5, r1]
	lsrs r2, r2, #0x11
	movs r3, #8
	bl FUN_0200BC4C
	ldr r1, _0225BC24 @ =0x00000474
	str r0, [r6, r1]
_0225BBBA:
	adds r4, r4, #1
	adds r6, #8
	cmp r4, #7
	blt _0225BB8A
	ldr r4, _0225BC28 @ =0x0225CED8
	movs r7, #0
	adds r6, r5, #0
_0225BBC8:
	ldr r0, _0225BC20 @ =0x000004A8
	ldr r1, [r4]
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	movs r1, #0x4b
	lsls r1, r1, #4
	str r0, [r6, r1]
	adds r7, r7, #1
	adds r4, r4, #4
	adds r6, r6, #4
	cmp r7, #5
	blt _0225BBC8
	subs r1, r1, #4
	ldr r0, [r5, r1]
	subs r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0xc
	movs r3, #8
	bl FUN_0200BC4C
	ldr r1, _0225BC2C @ =0x000004C4
	movs r2, #0xd
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #0x18
	subs r1, #0x1c
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	movs r3, #8
	bl FUN_0200BC4C
	ldr r1, _0225BC30 @ =0x000004C8
	str r0, [r5, r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225BC10: .4byte 0x000004AC
_0225BC14: .4byte 0x0225CFC8
_0225BC18: .4byte 0x0000051C
_0225BC1C: .4byte 0x0225CF94
_0225BC20: .4byte 0x000004A8
_0225BC24: .4byte 0x00000474
_0225BC28: .4byte 0x0225CED8
_0225BC2C: .4byte 0x000004C4
_0225BC30: .4byte 0x000004C8
	thumb_func_end FUN_0225BB6C
_0225BC34:
	.byte 0xF8, 0xB5, 0x05, 0x1C, 0x0F, 0x48, 0x28, 0x58, 0xCA, 0xF5, 0xA0, 0xFB
	.byte 0x0E, 0x48, 0x28, 0x58, 0xCA, 0xF5, 0x9C, 0xFB, 0x4B, 0x27, 0x00, 0x26, 0x2C, 0x1C, 0x3F, 0x01
	.byte 0xE0, 0x59, 0xCA, 0xF5, 0x95, 0xFB, 0x76, 0x1C, 0x24, 0x1D, 0x05, 0x2E, 0xF8, 0xDB, 0x08, 0x4E
	.byte 0x00, 0x24, 0xA8, 0x59, 0x00, 0x28, 0x01, 0xD0, 0xCA, 0xF5, 0x8A, 0xFB, 0x64, 0x1C, 0x08, 0x35
	.byte 0x07, 0x2C, 0xF6, 0xDB, 0xF8, 0xBD, 0xC0, 0x46, 0xC8, 0x04, 0x00, 0x00, 0xC4, 0x04, 0x00, 0x00
	.byte 0x74, 0x04, 0x00, 0x00

	thumb_func_start FUN_0225BC84
FUN_0225BC84: @ 0x0225BC84
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	movs r7, #0
	str r0, [sp]
	adds r4, r7, #0
	add r5, sp, #4
_0225BC90:
	ldr r0, [sp]
	adds r1, r4, #0
	ldr r0, [r0, #0x10]
	bl FUN_0203C3CC
	adds r4, r4, #1
	stm r5!, {r0}
	cmp r4, #8
	blt _0225BC90
	movs r1, #0x3f
	ldr r0, [sp]
	lsls r1, r1, #4
	movs r6, #0
	add r4, sp, #4
	adds r5, r0, r1
_0225BCAE:
	ldr r0, [r4]
	cmp r0, #0
	beq _0225BCBC
	adds r0, r5, #0
	bl FUN_0201D578
	adds r7, r7, #1
_0225BCBC:
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, #0x10
	cmp r6, #8
	blt _0225BCAE
	cmp r7, #0
	beq _0225BCE4
	movs r1, #0xf2
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #1
	bl FUN_02024830
	movs r1, #0x3e
	ldr r0, [sp]
	lsls r1, r1, #4
	adds r0, r0, r1
	bl FUN_0201D578
_0225BCE4:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end FUN_0225BC84

	thumb_func_start FUN_0225BCE8
FUN_0225BCE8: @ 0x0225BCE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #4
	movs r6, #0
	adds r4, r5, r0
_0225BCF6:
	ldr r0, _0225BD3C @ =0x00000474
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0225BD2C
	movs r0, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0x48
	subs r3, r1, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225BD40 @ =0x000E0200
	lsrs r7, r3, #0x1f
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r2, _0225BD3C @ =0x00000474
	adds r7, r3, r7
	ldr r2, [r5, r2]
	adds r0, r4, #0
	movs r1, #0
	asrs r3, r7, #1
	bl FUN_020200FC
_0225BD2C:
	adds r6, r6, #1
	adds r5, #8
	adds r4, #0x10
	cmp r6, #7
	blt _0225BCF6
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225BD3C: .4byte 0x00000474
_0225BD40: .4byte 0x000E0200
	thumb_func_end FUN_0225BCE8

	thumb_func_start FUN_0225BD44
FUN_0225BD44: @ 0x0225BD44
	adds r0, #0xd2
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
	thumb_func_end FUN_0225BD44

	thumb_func_start FUN_0225BD50
FUN_0225BD50: @ 0x0225BD50
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_020503D0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02067584
	cmp r0, #0
	beq _0225BD6A
	movs r0, #6
	pop {r3, r4, r5, pc}
_0225BD6A:
	adds r0, r5, #0
	bl FUN_02066860
	cmp r0, #0
	beq _0225BD78
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225BD78:
	adds r0, r5, #0
	bl FUN_02066870
	cmp r0, #0
	beq _0225BD86
	movs r0, #2
	pop {r3, r4, r5, pc}
_0225BD86:
	adds r0, r5, #0
	bl FUN_020668A0
	cmp r0, #0
	beq _0225BD94
	movs r0, #3
	pop {r3, r4, r5, pc}
_0225BD94:
	ldr r0, [r4, #0x18]
	cmp r0, #3
	bne _0225BD9E
	movs r0, #4
	pop {r3, r4, r5, pc}
_0225BD9E:
	ldr r0, [r4, #0x70]
	cmp r0, #3
	bne _0225BDA8
	movs r0, #5
	pop {r3, r4, r5, pc}
_0225BDA8:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_0225BD50

	thumb_func_start FUN_0225BDAC
FUN_0225BDAC: @ 0x0225BDAC
	ldr r1, _0225BDC4 @ =0x0000051C
	ldr r0, [r0, r1]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	subs r0, r0, #2
	cmp r0, #4
	bls _0225BDBE
	movs r0, #1
	bx lr
_0225BDBE:
	movs r0, #0
	bx lr
	nop
_0225BDC4: .4byte 0x0000051C
	thumb_func_end FUN_0225BDAC

	thumb_func_start FUN_0225BDC8
FUN_0225BDC8: @ 0x0225BDC8
	push {r3, lr}
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_0203B9C4
	bl FUN_0203B9B4
	bl FUN_0205C7C8
	pop {r3, pc}
	thumb_func_end FUN_0225BDC8

	thumb_func_start FUN_0225BDDC
FUN_0225BDDC: @ 0x0225BDDC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_02092DEC
	str r0, [r5, #4]
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [r5, #8]
	ldr r0, [r4, #4]
	str r0, [r5]
	movs r0, #0
	str r0, [r5, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_0225BDDC
_0225BDFC:
	.byte 0x30, 0xB5, 0x85, 0xB0
	.byte 0x05, 0x1C, 0x68, 0x68, 0x37, 0xF6, 0x00, 0xF8, 0xE9, 0x69, 0x00, 0x29, 0x3D, 0xD1, 0x01, 0x28
	.byte 0x4B, 0xD1, 0x00, 0x29, 0x49, 0xD1, 0x68, 0x68, 0x08, 0x21, 0xF6, 0xF7, 0x2B, 0xF8, 0x04, 0x1C
	.byte 0x00, 0x20, 0x21, 0x1C, 0x02, 0x1C, 0xA7, 0xF5, 0x83, 0xF8, 0x81, 0x10, 0x49, 0x0F, 0x41, 0x18
	.byte 0xC8, 0x10, 0x81, 0x1C, 0x09, 0x29, 0x00, 0xDD, 0x09, 0x21, 0x13, 0x20, 0x00, 0x90, 0x08, 0x06
	.byte 0x00, 0x0E, 0x01, 0x90, 0x02, 0x20, 0x02, 0x90, 0x04, 0x20, 0x03, 0x90, 0xC0, 0x20, 0x04, 0x90
	.byte 0x29, 0x1C, 0x28, 0x68, 0x0C, 0x31, 0x05, 0x22, 0x0B, 0x23, 0xC1, 0xF5, 0xD7, 0xFA, 0x28, 0x1C
	.byte 0x0C, 0x30, 0x01, 0x21, 0xFF, 0xF7, 0xE4, 0xFB, 0x28, 0x1C, 0x0C, 0x30, 0x21, 0x1C, 0x01, 0x22
	.byte 0xFF, 0xF7, 0x62, 0xFE, 0x20, 0x1C, 0xCA, 0xF5, 0x83, 0xFA, 0xA8, 0x68, 0x05, 0x21, 0xC8, 0xF5
	.byte 0x67, 0xFD, 0x01, 0x20, 0x05, 0xB0, 0xE8, 0x61, 0x30, 0xBD, 0x00, 0x28, 0xA8, 0x68, 0x04, 0xD0
	.byte 0x05, 0x21, 0xC8, 0xF5, 0x5D, 0xFD, 0x05, 0xB0, 0x30, 0xBD, 0x00, 0x21, 0xC8, 0xF5, 0x58, 0xFD
	.byte 0x28, 0x1C, 0x00, 0xF0, 0x05, 0xF8, 0x00, 0x20, 0xE8, 0x61, 0x05, 0xB0, 0x30, 0xBD, 0x00, 0x00
	.byte 0x10, 0xB5, 0x04, 0x1C, 0xE0, 0x69, 0x00, 0x28, 0x0C, 0xD0, 0x20, 0x1C, 0x0C, 0x30, 0x02, 0x21
	.byte 0xFF, 0xF7, 0xB6, 0xFB, 0x20, 0x1C, 0x0C, 0x30, 0xC1, 0xF5, 0xFE, 0xFC, 0x0C, 0x34, 0x20, 0x1C
	.byte 0xC1, 0xF5, 0x26, 0xFB, 0x10, 0xBD, 0x00, 0x00

	thumb_func_start FUN_0225BED8
FUN_0225BED8: @ 0x0225BED8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r5, [sp, #0x44]
	adds r4, r0, #0
	str r3, [sp]
	add r0, sp, #0x28
	adds r7, r1, #0
	ldrb r1, [r0, #0x10]
	adds r6, r2, #0
	movs r2, #5
	str r1, [sp, #4]
	ldrb r0, [r0, #0x14]
	add r1, sp, #0x14
	adds r3, r6, #0
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x40]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	bl FUN_0201D40C
	add r0, sp, #0x14
	movs r1, #0
	bl FUN_0201D978
	ldr r1, _0225BF7C @ =0x000004AC
	adds r2, r7, #0
	ldr r0, [r4, r1]
	subs r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #8
	bl FUN_0200BC4C
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _0225BF48
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	add r1, sp, #0x28
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #3
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0xf
	asrs r5, r0, #0x10
_0225BF48:
	add r1, sp, #0x28
	movs r0, #0x20
	ldrsh r0, [r1, r0]
	movs r1, #0
	adds r2, r4, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225BF80 @ =0x000E0200
	adds r3, r5, #0
	str r0, [sp, #8]
	add r0, sp, #0x14
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	add r0, sp, #0x14
	bl FUN_0201D578
	add r0, sp, #0x14
	bl FUN_0201D520
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225BF7C: .4byte 0x000004AC
_0225BF80: .4byte 0x000E0200
	thumb_func_end FUN_0225BED8

	thumb_func_start FUN_0225BF84
FUN_0225BF84: @ 0x0225BF84
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r4, r1, #0
	movs r1, #0
	adds r5, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225BFC4 @ =0x000004AC
	adds r6, r2, #0
	adds r2, r3, #0
	ldr r0, [r5, r0]
	movs r3, #2
	bl FUN_0200BFCC
	movs r0, #6
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _0225BFC8 @ =0x00000186
	movs r1, #0x1f
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl FUN_0225BED8
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0225BFC4: .4byte 0x000004AC
_0225BFC8: .4byte 0x00000186
	thumb_func_end FUN_0225BF84

	thumb_func_start FUN_0225BFCC
FUN_0225BFCC: @ 0x0225BFCC
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r1, #0x10]
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0
	adds r2, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225C014 @ =0x000004AC
	movs r3, #3
	ldr r0, [r4, r0]
	bl FUN_0200BFCC
	movs r0, #6
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _0225C018 @ =0x00000192
	movs r1, #0x21
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r2, #0xc
	movs r3, #0x15
	bl FUN_0225BED8
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_0225C014: .4byte 0x000004AC
_0225C018: .4byte 0x00000192
	thumb_func_end FUN_0225BFCC

	thumb_func_start FUN_0225C01C
FUN_0225C01C: @ 0x0225C01C
	push {lr}
	sub sp, #0x14
	movs r1, #9
	str r1, [sp]
	movs r2, #2
	movs r1, #0x5d
	str r2, [sp, #4]
	lsls r1, r1, #2
	str r1, [sp, #8]
	subs r1, r2, #3
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	movs r1, #0x20
	movs r2, #0xb
	movs r3, #0x15
	bl FUN_0225BED8
	add sp, #0x14
	pop {pc}
	thumb_func_end FUN_0225C01C

	thumb_func_start FUN_0225C044
FUN_0225C044: @ 0x0225C044
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_0203B9C4
	bl FUN_0203B9B8
	adds r3, r0, #0
	ldrh r3, [r3]
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0x13
	bl FUN_0225BF84
	adds r0, r4, #0
	bl FUN_0225C01C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end FUN_0225C044

	thumb_func_start FUN_0225C06C
FUN_0225C06C: @ 0x0225C06C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_020558BC
	adds r3, r0, #0
	movs r1, #0xe
	lsls r3, r3, #0x10
	adds r0, r4, #0
	adds r2, r1, #0
	lsrs r3, r3, #0x10
	bl FUN_0225BF84
	pop {r4, pc}
	thumb_func_end FUN_0225C06C

	thumb_func_start FUN_0225C088
FUN_0225C088: @ 0x0225C088
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	bl FUN_0206DB28
	adds r4, r0, #0
	bne _0225C09A
	bl FUN_0202551C
_0225C09A:
	adds r0, r4, #0
	bl FUN_0206DB30
	adds r3, r0, #0
	movs r1, #0xe
	ldrh r3, [r3]
	adds r0, r5, #0
	adds r2, r1, #0
	bl FUN_0225BF84
	ldrb r0, [r4, #0x17]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _0225C0BE
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225BFCC
_0225C0BE:
	ldrb r1, [r4, #0x17]
	movs r0, #0xea
	lsls r0, r0, #2
	lsls r1, r1, #0x1f
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x1f
	bl FUN_02024830
	ldr r0, _0225C0DC @ =0x0000051A
	movs r1, #0
	strb r1, [r5, r0]
	subs r0, #0x7a
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_0225C0DC: .4byte 0x0000051A
	thumb_func_end FUN_0225C088

	thumb_func_start FUN_0225C0E0
FUN_0225C0E0: @ 0x0225C0E0
	push {r3, lr}
	ldr r1, _0225C108 @ =0x0000051C
	ldr r1, [r0, r1]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1c
	cmp r1, #1
	bne _0225C0F4
	bl FUN_0225C044
	pop {r3, pc}
_0225C0F4:
	cmp r1, #2
	bne _0225C0FE
	bl FUN_0225C088
	pop {r3, pc}
_0225C0FE:
	cmp r1, #3
	bne _0225C106
	bl FUN_0225C06C
_0225C106:
	pop {r3, pc}
	.align 2, 0
_0225C108: .4byte 0x0000051C
	thumb_func_end FUN_0225C0E0

	thumb_func_start FUN_0225C10C
FUN_0225C10C: @ 0x0225C10C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, _0225C160 @ =0x0225CFC8
	movs r4, #0
	adds r6, r5, #0
_0225C116:
	ldr r0, _0225C164 @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	lsls r0, r0, #3
	adds r0, r7, r0
	ldrb r1, [r4, r0]
	cmp r1, #0xd
	beq _0225C14C
	cmp r1, #7
	bge _0225C13A
	ldr r0, [r5, #0x10]
	bl FUN_0203C3CC
	ldr r1, _0225C168 @ =0x00000514
	adds r2, r5, r4
	strb r0, [r2, r1]
	b _0225C14C
_0225C13A:
	ldr r0, _0225C16C @ =0x0225CF94
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	adds r1, r5, r4
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x1f
	ldr r0, _0225C168 @ =0x00000514
	strb r2, [r1, r0]
_0225C14C:
	ldr r0, _0225C168 @ =0x00000514
	adds r1, r5, r4
	ldrb r1, [r1, r0]
	subs r0, #0xa4
	adds r4, r4, #1
	strb r1, [r6, r0]
	adds r6, #8
	cmp r4, #7
	blt _0225C116
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225C160: .4byte 0x0225CFC8
_0225C164: .4byte 0x0000051C
_0225C168: .4byte 0x00000514
_0225C16C: .4byte 0x0225CF94
	thumb_func_end FUN_0225C10C

	thumb_func_start FUN_0225C170
FUN_0225C170: @ 0x0225C170
	push {r3, r4, r5, lr}
	movs r4, #0
	subs r2, r1, #7
	mvns r4, r4
	cmp r2, #1
	bhi _0225C180
	adds r0, r1, #0
	pop {r3, r4, r5, pc}
_0225C180:
	adds r3, r1, #1
	movs r5, #0
	cmp r3, #0
	ble _0225C19C
	movs r1, #0x47
	lsls r1, r1, #4
_0225C18C:
	ldrb r2, [r0, r1]
	cmp r2, #0
	beq _0225C194
	adds r4, r4, #1
_0225C194:
	adds r5, r5, #1
	adds r0, #8
	cmp r5, r3
	blt _0225C18C
_0225C19C:
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0225C1A8
	bl FUN_0202551C
_0225C1A8:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_0225C170

	thumb_func_start FUN_0225C1AC
FUN_0225C1AC: @ 0x0225C1AC
	push {r4, r5, r6, r7}
	movs r5, #0
	movs r6, #0
	movs r2, #0x47
	mvns r5, r5
	adds r4, r6, #0
	adds r7, r0, #0
	lsls r2, r2, #4
_0225C1BC:
	ldrb r3, [r7, r2]
	cmp r3, #0
	beq _0225C1CC
	cmp r1, r6
	bne _0225C1CA
	adds r5, r4, #0
	b _0225C1D4
_0225C1CA:
	adds r6, r6, #1
_0225C1CC:
	adds r4, r4, #1
	adds r7, #8
	cmp r4, #7
	blt _0225C1BC
_0225C1D4:
	movs r1, #0
	mvns r1, r1
	cmp r5, r1
	bne _0225C1E4
	ldr r0, [r0, #0x10]
	movs r5, #0
	adds r0, #0xd3
	strb r5, [r0]
_0225C1E4:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
	thumb_func_end FUN_0225C1AC

	thumb_func_start FUN_0225C1EC
FUN_0225C1EC: @ 0x0225C1EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0225C1FA
	bl FUN_0202551C
_0225C1FA:
	ldr r0, [r4, #0x14]
	lsls r0, r0, #3
	adds r1, r4, r0
	movs r0, #0x47
	lsls r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0225C236
	movs r0, #0x47
	movs r2, #0
	adds r3, r4, #0
	lsls r0, r0, #4
_0225C212:
	ldrb r1, [r3, r0]
	cmp r1, #0
	beq _0225C22E
	ldr r0, [r4, #0x10]
	adds r0, #0xd3
	strb r2, [r0]
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	adds r1, #0xd3
	ldrb r1, [r1]
	bl FUN_0225C1AC
	str r0, [r4, #0x14]
	pop {r4, pc}
_0225C22E:
	adds r2, r2, #1
	adds r3, #8
	cmp r2, #7
	blt _0225C212
_0225C236:
	pop {r4, pc}
	thumb_func_end FUN_0225C1EC
