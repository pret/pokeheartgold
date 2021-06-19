
	thumb_func_start MOD31_0225D520
MOD31_0225D520: @ 0x0225D520
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	movs r0, #3
	str r2, [sp]
	movs r1, #8
	lsls r2, r0, #0xf
	str r3, [sp, #4]
	bl FUN_0201A910
	movs r1, #0x19
	ldr r0, _0225D5FC @ =0x0225D7A1
	lsls r1, r1, #4
	movs r2, #0xa
	movs r3, #8
	bl FUN_02007200
	adds r5, r0, #0
	bl FUN_0201F988
	adds r4, r0, #0
	str r5, [r4, #8]
	movs r1, #0
	str r1, [r4]
	str r6, [r4, #4]
	ldr r0, [sp]
	str r7, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r1, [r4, #0x30]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl FUN_02028EA8
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl FUN_02028E9C
	movs r1, #0x5a
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl FUN_02031968
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	str r0, [r4, #0xc]
	ldr r0, [sp, #4]
	str r0, [r4, #0x14]
	adds r0, r4, #0
	bl FUN_0225DAC4
	adds r0, r4, #0
	bl FUN_0225DB38
	adds r0, r4, #0
	bl FUN_0225D60C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0225D684
	adds r0, r4, #0
	bl FUN_0225DE84
	adds r0, r4, #0
	bl FUN_0225DF98
	adds r0, r4, #0
	bl FUN_0225DD14
	ldr r0, [r4, #0x14]
	bl FUN_022581BC
	ldr r2, _0225D600 @ =0x04001000
	ldr r0, _0225D604 @ =0xFFFF1FFF
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
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #1
	bl FUN_02002B8C
	ldr r0, _0225D608 @ =0x0225EE40
	bl FUN_02002C20
	adds r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225D5FC: .4byte 0x0225D7A1
_0225D600: .4byte 0x04001000
_0225D604: .4byte 0xFFFF1FFF
_0225D608: .4byte 0x0225EE40
	thumb_func_end MOD31_0225D520

	thumb_func_start FUN_0225D60C
FUN_0225D60C: @ 0x0225D60C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	movs r1, #0x40
	adds r2, r0, #0
	bl FUN_0200BD18
	movs r2, #0x55
	lsls r2, r2, #2
	str r0, [r4, r2]
	movs r0, #0
	movs r1, #0x1b
	adds r2, #0x5f
	movs r3, #8
	bl FUN_0200BAF8
	movs r1, #0x56
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xde
	movs r3, #8
	bl FUN_0200BAF8
	movs r1, #0x57
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x90
	movs r1, #8
	bl FUN_02026354
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end FUN_0225D60C
_0225D654:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x62, 0x20, 0x80, 0x00, 0x20, 0x58, 0xC8, 0xF5
	.byte 0x8F, 0xFE, 0x57, 0x20, 0x80, 0x00, 0x20, 0x58, 0xAE, 0xF5, 0x6C, 0xFA, 0x56, 0x20, 0x80, 0x00
	.byte 0x20, 0x58, 0xAE, 0xF5, 0x67, 0xFA, 0x55, 0x20, 0x80, 0x00, 0x20, 0x58, 0xAE, 0xF5, 0x90, 0xFB
	.byte 0x10, 0xBD, 0x00, 0x00

	thumb_func_start FUN_0225D684
FUN_0225D684: @ 0x0225D684
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	adds r6, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0x11
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x64
	bl FUN_0201D8C8
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0
	bl FUN_0201D978
	cmp r6, #0
	bne _0225D6DE
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0
	adds r3, r0, #0
	movs r6, #0x30
	subs r3, r6, r3
	lsrs r3, r3, #1
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D70C @ =0x000F0E00
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x64
	adds r3, #8
	str r1, [sp, #0xc]
	bl FUN_020200FC
	b _0225D6F8
_0225D6DE:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D70C @ =0x000F0E00
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x64
	movs r3, #5
	str r1, [sp, #0xc]
	bl FUN_020200FC
_0225D6F8:
	adds r5, #0x64
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0225D70C: .4byte 0x000F0E00
	thumb_func_end FUN_0225D684
_0225D710:
	.byte 0x70, 0xB5, 0x0E, 0x1C, 0x05, 0x1C, 0x30, 0x1C, 0xC2, 0xF5, 0x36, 0xF9, 0x04, 0x1C, 0x00, 0x20
	.byte 0xA5, 0xF5, 0x34, 0xFA, 0x20, 0x1C, 0x00, 0xF0, 0x3B, 0xFA, 0x20, 0x1C, 0xFF, 0xF7, 0x92, 0xFF
	.byte 0x30, 0x1C, 0xA9, 0xF5, 0x7F, 0xFD, 0x28, 0x1C, 0x06, 0x21, 0xBE, 0xF5, 0x07, 0xFA, 0x28, 0x1C
	.byte 0x05, 0x21, 0xBE, 0xF5, 0x03, 0xFA, 0x28, 0x1C, 0x04, 0x21, 0xBE, 0xF5, 0xFF, 0xF9, 0x08, 0x20
	.byte 0xBD, 0xF5, 0x38, 0xF9, 0x70, 0xBD, 0x00, 0x00, 0x01, 0x20, 0x70, 0x47, 0x08, 0x29, 0x1A, 0xD8
	.byte 0x4A, 0x18, 0x7A, 0x44, 0xD2, 0x88, 0x12, 0x04, 0x12, 0x14, 0x97, 0x44, 0x10, 0x00, 0x10, 0x00
	.byte 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x24, 0x00, 0x24, 0x00, 0x24, 0x00, 0x43, 0x69
	.byte 0x06, 0x48, 0x1A, 0x5C, 0x40, 0x1E, 0x18, 0x5C, 0x89, 0x18, 0x81, 0x42, 0x03, 0xD2, 0x01, 0x20
	.byte 0x70, 0x47, 0x01, 0x20, 0x70, 0x47, 0x00, 0x20, 0x70, 0x47, 0xC0, 0x46, 0x71, 0x02, 0x00, 0x00
	.byte 0x38, 0xB5, 0x0D, 0x1C, 0xE8, 0x68, 0x00, 0x28, 0x02, 0xD0, 0x01, 0x28, 0x07, 0xD0, 0x38, 0xBD
	.byte 0xB2, 0xF5, 0xD4, 0xF9, 0x01, 0x28, 0x3E, 0xD1, 0x01, 0x20, 0xE8, 0x60, 0x38, 0xBD, 0x69, 0x69
	.byte 0x1D, 0x48, 0x08, 0x5C, 0x03, 0x28, 0x04, 0xD0, 0x07, 0x28, 0x16, 0xD0, 0x0B, 0x28, 0x21, 0xD0
	.byte 0x23, 0xE0, 0x28, 0x1C, 0x00, 0x21, 0x00, 0xF0, 0x65, 0xF9, 0x04, 0x1C, 0x00, 0x20, 0xC0, 0x43
	.byte 0x84, 0x42, 0x1A, 0xD0, 0x28, 0x1C, 0x21, 0x1C, 0xFF, 0xF7, 0xB8, 0xFF, 0x00, 0x28, 0x14, 0xD0
	.byte 0xA5, 0x20, 0x69, 0x69, 0x80, 0x00, 0x0C, 0x50, 0x0F, 0xE0, 0x28, 0x1C, 0x01, 0x21, 0x00, 0xF0
	.byte 0x51, 0xF9, 0x00, 0x21, 0xC9, 0x43, 0x88, 0x42, 0x07, 0xD0, 0xA5, 0x21, 0x6A, 0x69, 0x89, 0x00
	.byte 0x50, 0x50, 0x02, 0xE0, 0x28, 0x1C, 0x00, 0xF0, 0xAD, 0xFF, 0xA6, 0x20, 0x69, 0x69, 0x80, 0x00
	.byte 0x09, 0x58, 0x00, 0x29, 0x07, 0xD0, 0x28, 0x1C, 0x00, 0xF0, 0x08, 0xF8, 0xA6, 0x20, 0x69, 0x69
	.byte 0x00, 0x22, 0x80, 0x00, 0x0A, 0x50, 0x38, 0xBD, 0x72, 0x02, 0x00, 0x00, 0x10, 0xB5, 0x04, 0x1C
	.byte 0x0D, 0x29, 0x00, 0xD9, 0xC2, 0xE0, 0x49, 0x18, 0x79, 0x44, 0xC9, 0x88, 0x09, 0x04, 0x09, 0x14
	.byte 0x8F, 0x44, 0x78, 0x01, 0x1A, 0x00, 0x2E, 0x00, 0x7E, 0x00, 0xBC, 0x00, 0xFC, 0x00, 0x20, 0x01
	.byte 0x2C, 0x01, 0x44, 0x01, 0x4A, 0x01, 0x50, 0x01, 0x56, 0x01, 0x6E, 0x01, 0x74, 0x01, 0x00, 0xF0
	.byte 0x51, 0xFA, 0x20, 0x1C, 0x00, 0xF0, 0x90, 0xFB, 0x20, 0x1C, 0x00, 0x21, 0xFF, 0xF7, 0x02, 0xFF
	.byte 0x10, 0xBD, 0x01, 0x21, 0x00, 0xF0, 0xA6, 0xF8, 0x20, 0x1C, 0x00, 0xF0, 0x33, 0xFA, 0x20, 0x1C
	.byte 0x54, 0x30, 0xC0, 0xF5, 0x27, 0xF8, 0x20, 0x1C, 0x01, 0xF0, 0xDE, 0xF9, 0x20, 0x1C, 0x00, 0xF0
	.byte 0x71, 0xFC, 0xA1, 0x21, 0x62, 0x69, 0x89, 0x00, 0x51, 0x5A, 0x20, 0x1C, 0x00, 0xF0, 0xAE, 0xFC
	.byte 0x62, 0x69, 0x47, 0x49, 0x20, 0x1C, 0x51, 0x5E, 0x00, 0xF0, 0x0C, 0xFD, 0x20, 0x1C, 0x00, 0xF0
	.byte 0xD9, 0xFD, 0x20, 0x1C, 0x01, 0x21, 0xFF, 0xF7, 0xDD, 0xFE, 0x20, 0x1C, 0x00, 0xF0, 0x3E, 0xFE
	.byte 0x10, 0xBD, 0x02, 0x21, 0x00, 0xF0, 0x7E, 0xF8, 0x20, 0x1C, 0x00, 0xF0, 0x0B, 0xFA, 0x20, 0x1C
	.byte 0x01, 0xF0, 0xBA, 0xF9, 0x20, 0x1C, 0x00, 0xF0, 0x4D, 0xFC, 0xA1, 0x21, 0x62, 0x69, 0x89, 0x00
	.byte 0x51, 0x5A, 0x20, 0x1C, 0x00, 0xF0, 0x8A, 0xFC, 0x20, 0x1C, 0x00, 0xF0, 0x7F, 0xFE, 0x20, 0x1C
	.byte 0x54, 0x30, 0xBF, 0xF5, 0xEF, 0xFF, 0x64, 0x34, 0x20, 0x1C, 0xBF, 0xF5, 0xEB, 0xFF, 0x10, 0xBD
	.byte 0x00, 0x21, 0x00, 0xF0, 0x5F, 0xF8, 0x20, 0x1C, 0x01, 0xF0, 0x42, 0xFA, 0x20, 0x1C, 0x00, 0xF0
	.byte 0x3B, 0xFB, 0x20, 0x1C, 0x00, 0x21, 0xFF, 0xF7, 0xAD, 0xFE, 0x20, 0x1C, 0x00, 0xF0, 0xBC, 0xF9
	.byte 0x20, 0x1C, 0x44, 0x30, 0x01, 0x21, 0xB1, 0xF5, 0x41, 0xF8, 0x20, 0x1C, 0x00, 0xF0, 0xEA, 0xF9
	.byte 0x20, 0x1C, 0x00, 0xF0, 0x9F, 0xFA, 0x64, 0x34, 0x20, 0x1C, 0xBF, 0xF5, 0x3D, 0xFE, 0x10, 0xBD
	.byte 0x00, 0x21, 0x00, 0xF0, 0x3F, 0xF8, 0x20, 0x1C, 0x00, 0xF0, 0x1E, 0xFB, 0x20, 0x1C, 0x44, 0x30
	.byte 0x00, 0x21, 0xB1, 0xF5, 0x2B, 0xF8, 0x20, 0x1C, 0x00, 0xF0, 0xD4, 0xF9, 0x20, 0x1C, 0x00, 0xF0
	.byte 0x89, 0xFA, 0x10, 0xBD, 0x62, 0x69, 0x16, 0x49, 0x51, 0x5E, 0x00, 0xF0, 0xAB, 0xFC, 0x10, 0xBD
	.byte 0x64, 0x30, 0xBF, 0xF5, 0xAF, 0xFF, 0x45, 0x20, 0x80, 0x00, 0x20, 0x18, 0xBF, 0xF5, 0xAA, 0xFF
	.byte 0x20, 0x1C, 0x00, 0xF0, 0x33, 0xFE, 0x10, 0xBD, 0x00, 0xF0, 0xB2, 0xFE, 0x10, 0xBD, 0x00, 0xF0
	.byte 0x19, 0xFF, 0x10, 0xBD, 0x01, 0xF0, 0x30, 0xF8, 0x10, 0xBD, 0x64, 0x30, 0xBF, 0xF5, 0x9A, 0xFF
	.byte 0x45, 0x20, 0x80, 0x00, 0x20, 0x18, 0xBF, 0xF5, 0x95, 0xFF, 0x20, 0x1C, 0x01, 0xF0, 0x6E, 0xF8
	.byte 0x10, 0xBD, 0x01, 0xF0, 0xB5, 0xF8, 0x10, 0xBD, 0x01, 0xF0, 0xFC, 0xF8, 0x10, 0xBD, 0xC0, 0x46
	.byte 0x86, 0x02, 0x00, 0x00

	thumb_func_start FUN_0225D9D4
FUN_0225D9D4: @ 0x0225D9D4
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	cmp r1, #0
	beq _0225D9EA
	cmp r1, #1
	beq _0225DA26
	cmp r1, #2
	beq _0225DA64
	add sp, #8
	pop {r3, r4, r5, pc}
_0225D9EA:
	movs r0, #8
	str r0, [sp]
	movs r0, #0x3c
	movs r1, #0x11
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r5, r0, #0
	adds r2, r3, #0
	ldr r0, [r4, #4]
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201AB0C
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	add sp, #8
	pop {r3, r4, r5, pc}
_0225DA26:
	ldr r0, [r4, #4]
	movs r1, #5
	movs r2, #0
	bl FUN_0201CB28
	movs r0, #8
	str r0, [sp]
	movs r0, #0x3c
	movs r1, #0x13
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r5, r0, #0
	adds r2, r3, #0
	ldr r0, [r4, #4]
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, pc}
_0225DA64:
	ldr r0, [r4, #4]
	movs r1, #5
	movs r2, #0
	bl FUN_0201CB28
	movs r0, #8
	str r0, [sp]
	movs r0, #0x3c
	movs r1, #0x14
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r5, r0, #0
	adds r2, r3, #0
	ldr r0, [r4, #4]
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end FUN_0225D9D4
_0225DAA4:
	.byte 0x10, 0xB5, 0x0C, 0x1C, 0x03, 0xD0, 0x01, 0x2C, 0x01, 0xD0, 0xC7, 0xF5
	.byte 0x35, 0xFD, 0x03, 0x48, 0xA1, 0x00, 0x40, 0x58, 0xC7, 0xF5, 0xB4, 0xFB, 0x10, 0xBD, 0xC0, 0x46
	.byte 0x40, 0xEF, 0x25, 0x02

	thumb_func_start FUN_0225DAC4
FUN_0225DAC4: @ 0x0225DAC4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	blx FUN_020CDA64
	movs r0, #0x80
	blx FUN_020CE650
	movs r0, #1
	lsls r0, r0, #8
	blx FUN_020CE6F8
	ldr r2, _0225DB24 @ =0x04001000
	ldr r0, _0225DB28 @ =0xFFCFFFEF
	ldr r1, [r2]
	movs r3, #0
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r4, #4]
	ldr r2, _0225DB2C @ =0x0225EED0
	movs r1, #4
	bl FUN_0201B1E4
	ldr r0, [r4, #4]
	ldr r2, _0225DB30 @ =0x0225EEEC
	movs r1, #5
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #4]
	ldr r2, _0225DB34 @ =0x0225EF08
	movs r1, #6
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	movs r3, #4
	bl FUN_0201C1C4
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_0201CAE0
	pop {r4, pc}
	.align 2, 0
_0225DB24: .4byte 0x04001000
_0225DB28: .4byte 0xFFCFFFEF
_0225DB2C: .4byte 0x0225EED0
_0225DB30: .4byte 0x0225EEEC
_0225DB34: .4byte 0x0225EF08
	thumb_func_end FUN_0225DAC4

	thumb_func_start FUN_0225DB38
FUN_0225DB38: @ 0x0225DB38
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, _0225DB9C @ =0x04001050
	movs r3, #0
	strh r3, [r0]
	str r3, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #0x3c
	movs r1, #0xf
	movs r2, #4
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	movs r0, #0x3c
	movs r1, #0x10
	movs r3, #5
	bl FUN_020078F0
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0225D9D4
	movs r1, #0x16
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #8
	bl FUN_0200304C
	movs r1, #6
	movs r0, #4
	lsls r1, r1, #6
	movs r2, #8
	bl FUN_02003030
	adds r0, r4, #0
	bl FUN_0225DBD4
	adds r0, r4, #0
	bl FUN_0225DCA8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0225DB9C: .4byte 0x04001050
	thumb_func_end FUN_0225DB38
_0225DBA0:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x00, 0xF0, 0xA6, 0xF8, 0x20, 0x1C, 0x34, 0x30, 0xBF, 0xF5, 0xB8, 0xFC
	.byte 0x20, 0x1C, 0x44, 0x30, 0xBF, 0xF5, 0xB4, 0xFC, 0x20, 0x1C, 0x74, 0x30, 0xBF, 0xF5, 0xB0, 0xFC
	.byte 0x20, 0x1C, 0x54, 0x30, 0xBF, 0xF5, 0xAC, 0xFC, 0x64, 0x34, 0x20, 0x1C, 0xBF, 0xF5, 0xA8, 0xFC
	.byte 0x10, 0xBD, 0x00, 0x00

	thumb_func_start FUN_0225DBD4
FUN_0225DBD4: @ 0x0225DBD4
	push {r3, r4, lr}
	sub sp, #0x14
	movs r1, #1
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x34
	movs r2, #4
	bl FUN_0201D40C
	movs r0, #1
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r2, #4
	adds r1, r4, #0
	str r2, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0x1d
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, #0x44
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r2, #4
	adds r1, r4, #0
	str r2, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0x89
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, #0x74
	movs r3, #1
	bl FUN_0201D40C
	movs r0, #0x15
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x54
	movs r2, #4
	movs r3, #0xa
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0x54
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x15
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x64
	movs r2, #4
	movs r3, #0x18
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	bl FUN_0201D978
	movs r2, #0
	adds r1, r2, #0
_0225DC94:
	adds r0, r4, #0
	adds r0, #0x84
	adds r2, r2, #1
	adds r4, #0x10
	str r1, [r0]
	cmp r2, #0xd
	blt _0225DC94
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end FUN_0225DBD4

	thumb_func_start FUN_0225DCA8
FUN_0225DCA8: @ 0x0225DCA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	adds r5, r7, #0
	ldr r4, _0225DCF0 @ =0x0225EE88
	movs r6, #0
	adds r5, #0x84
_0225DCB6:
	ldr r0, [r4, #4]
	adds r1, r5, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	movs r2, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [r7, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r6, r6, #1
	adds r4, #0xc
	adds r5, #0x10
	cmp r6, #6
	blt _0225DCB6
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225DCF0: .4byte 0x0225EE88
	thumb_func_end FUN_0225DCA8
_0225DCF4:
	.byte 0x38, 0xB5, 0x05, 0x1C, 0x00, 0x24, 0x84, 0x35, 0x28, 0x1C, 0xBF, 0xF5
	.byte 0xE3, 0xFD, 0x28, 0x1C, 0xBF, 0xF5, 0x0C, 0xFC, 0x64, 0x1C, 0x10, 0x35, 0x06, 0x2C, 0xF5, 0xDB
	.byte 0x38, 0xBD, 0x00, 0x00

	thumb_func_start FUN_0225DD14
FUN_0225DD14: @ 0x0225DD14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #0
	adds r4, #0x84
	adds r7, r6, #0
_0225DD22:
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #6
	blt _0225DD22
	movs r0, #0x27
	ldr r2, [r5, #0x14]
	lsls r0, r0, #4
	ldrb r1, [r2, r0]
	adds r0, r0, #1
	ldrb r0, [r2, r0]
	subs r0, r1, r0
	str r0, [sp, #4]
	cmp r0, #6
	ble _0225DD4C
	movs r0, #6
	str r0, [sp, #4]
	b _0225DD54
_0225DD4C:
	cmp r0, #0
	bge _0225DD54
	movs r0, #0
	str r0, [sp, #4]
_0225DD54:
	ldr r0, [sp, #4]
	movs r4, #0
	cmp r0, #0
	ble _0225DDD6
	adds r6, r5, #0
	adds r6, #0x84
_0225DD60:
	ldr r0, [r5, #0x14]
	ldr r1, _0225DDF8 @ =0x00000271
	ldrb r1, [r0, r1]
	adds r1, r4, r1
	str r1, [sp, #0xc]
	movs r1, #0x9a
	lsls r1, r1, #2
	ldr r1, [r0, r1]
	ldr r0, [sp, #0xc]
	lsls r0, r0, #1
	ldrh r7, [r1, r0]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_0200BBA0
	str r0, [sp, #0x10]
	ldr r2, [sp, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r4, #0
	bl FUN_0225DE00
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	ldr r0, [r5, #0x14]
	ldr r1, [sp, #0xc]
	adds r2, r7, #0
	bl FUN_0225E12C
	cmp r0, #0
	beq _0225DDCC
	ldr r0, [r5, #0x14]
	lsls r1, r7, #0x10
	str r0, [sp, #8]
	lsrs r1, r1, #0x10
	bl FUN_02258120
	adds r3, r0, #0
	ldr r1, [sp, #8]
	ldr r0, _0225DDFC @ =0x00000283
	adds r2, r6, #0
	ldrb r0, [r1, r0]
	movs r1, #0x56
	lsls r1, r1, #2
	str r0, [sp]
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl FUN_0225DE24
_0225DDCC:
	ldr r0, [sp, #4]
	adds r4, r4, #1
	adds r6, #0x10
	cmp r4, r0
	blt _0225DD60
_0225DDD6:
	adds r4, r5, #0
	movs r6, #0
	adds r4, #0x84
_0225DDDC:
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #6
	blt _0225DDDC
	ldr r1, [sp, #4]
	adds r0, r5, #0
	bl FUN_0225E0E4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225DDF8: .4byte 0x00000271
_0225DDFC: .4byte 0x00000283
	thumb_func_end FUN_0225DD14

	thumb_func_start FUN_0225DE00
FUN_0225DE00: @ 0x0225DE00
	push {r3, lr}
	sub sp, #0x10
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DE20 @ =0x00010200
	str r0, [sp, #8]
	adds r0, r1, #0
	adds r1, r3, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, pc}
	nop
_0225DE20: .4byte 0x00010200
	thumb_func_end FUN_0225DE00

	thumb_func_start FUN_0225DE24
FUN_0225DE24: @ 0x0225DE24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [sp, #0x28]
	adds r6, r1, #0
	subs r0, r0, #3
	adds r7, r2, #0
	movs r4, #0x12
	cmp r0, #1
	bhi _0225DE3A
	movs r4, #0x13
_0225DE3A:
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r2, r3, #0
	adds r0, r5, #0
	movs r3, #4
	bl FUN_0200BFCC
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #8
	bl FUN_0200BC4C
	adds r4, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DE80 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r2, r4, #0
	movs r3, #0x24
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225DE80: .4byte 0x00010200
	thumb_func_end FUN_0225DE24

	thumb_func_start FUN_0225DE84
FUN_0225DE84: @ 0x0225DE84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x74
	movs r1, #0
	bl FUN_0201D978
	ldr r1, [r5, #0x14]
	ldr r0, _0225DF90 @ =0x00000283
	ldrb r0, [r1, r0]
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0225DEB0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x21
	bl FUN_0200BBA0
	b _0225DEBC
_0225DEB0:
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x1e
	bl FUN_0200BBA0
_0225DEBC:
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DF94 @ =0x000F0E00
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x74
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #0x10
	movs r1, #0xb
	bl FUN_02026354
	adds r4, r0, #0
	ldr r1, [r5, #0x14]
	ldr r0, _0225DF90 @ =0x00000283
	ldrb r0, [r1, r0]
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0225DF12
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x20
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02031A6C
	b _0225DF2A
_0225DF12:
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x1f
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02029024
_0225DF2A:
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	movs r3, #6
	bl FUN_0200BFCC
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	adds r6, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DF94 @ =0x000F0E00
	movs r3, #0x48
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x74
	adds r2, r4, #0
	subs r3, r3, r6
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_02026380
	adds r5, #0x74
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225DF90: .4byte 0x00000283
_0225DF94: .4byte 0x000F0E00
	thumb_func_end FUN_0225DE84

	thumb_func_start FUN_0225DF98
FUN_0225DF98: @ 0x0225DF98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r0, #0
	adds r0, #0x54
	movs r1, #0
	bl FUN_0201D978
	movs r0, #6
	movs r1, #0xb
	bl FUN_02026354
	adds r6, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x2b
	bl FUN_0200BBA0
	adds r7, r0, #0
	ldr r5, [r4, #0x14]
	ldr r0, _0225E058 @ =0x00000271
	movs r1, #6
	ldrb r0, [r5, r0]
	adds r0, r0, #6
	blx FUN_020F2998
	str r0, [sp, #0x14]
	movs r0, #0x27
	lsls r0, r0, #4
	ldrb r0, [r5, r0]
	movs r1, #6
	str r0, [sp, #0x10]
	blx FUN_020F2998
	adds r5, r0, #0
	ldr r0, [sp, #0x10]
	movs r1, #6
	blx FUN_020F2998
	cmp r1, #0
	beq _0225DFEC
	adds r5, r5, #1
_0225DFEC:
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [sp, #0x14]
	movs r1, #0
	movs r3, #2
	bl FUN_0200BFCC
	movs r1, #1
	str r1, [sp]
	movs r0, #0x55
	str r1, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r2, r5, #0
	movs r3, #2
	bl FUN_0200BFCC
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225E05C @ =0x000F0E00
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x54
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	adds r4, #0x54
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E058: .4byte 0x00000271
_0225E05C: .4byte 0x000F0E00
	thumb_func_end FUN_0225DF98

	thumb_func_start FUN_0225E060
FUN_0225E060: @ 0x0225E060
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r6, r0, #0
	adds r4, r2, #0
	bl FUN_0201CC08
	str r0, [sp, #0x14]
	cmp r4, #6
	beq _0225E0DA
	ldr r1, _0225E0E0 @ =0x0225EF48
	lsls r0, r4, #5
	adds r5, r1, r0
	ldr r0, [sp, #0x10]
	movs r7, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0225E086:
	ldrb r0, [r5]
	cmp r0, #1
	bne _0225E0B2
	ldrb r0, [r5, #4]
	adds r1, r4, #0
	str r0, [sp]
	ldrb r0, [r5, #5]
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	str r0, [sp, #8]
	ldrb r3, [r5, #2]
	ldrb r2, [r5, #1]
	adds r0, r6, #0
	lsls r3, r3, #5
	adds r2, r2, r3
	lsls r3, r2, #1
	ldr r2, [sp, #0x14]
	adds r2, r2, r3
	ldrb r3, [r5, #3]
	bl FUN_0201C4C4
	b _0225E0D2
_0225E0B2:
	cmp r0, #2
	bne _0225E0D2
	ldrb r0, [r5, #4]
	adds r1, r4, #0
	movs r2, #0
	str r0, [sp]
	ldrb r0, [r5, #5]
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r5, #3]
	adds r0, r6, #0
	bl FUN_0201C8C4
_0225E0D2:
	adds r7, r7, #1
	adds r5, #8
	cmp r7, #4
	blt _0225E086
_0225E0DA:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E0E0: .4byte 0x0225EF48
	thumb_func_end FUN_0225E060

	thumb_func_start FUN_0225E0E4
FUN_0225E0E4: @ 0x0225E0E4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #8
	adds r4, r1, #0
	str r0, [sp]
	movs r0, #0x3c
	movs r1, #0x12
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r6, r0, #0
	adds r2, r3, #0
	ldr r0, [r5, #4]
	ldr r3, [r3, #8]
	movs r1, #5
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r5, #4]
	movs r1, #5
	adds r2, r4, #0
	bl FUN_0225E060
	ldr r0, [r5, #4]
	movs r1, #5
	bl FUN_0201EFBC
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end FUN_0225E0E4

	thumb_func_start FUN_0225E12C
FUN_0225E12C: @ 0x0225E12C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0225E180 @ =0x00000283
	adds r4, r1, #0
	ldrb r3, [r5, r0]
	cmp r3, #3
	bne _0225E14E
	subs r0, #0x2f
	ldr r0, [r5, r0]
	bl FUN_02031AB8
	cmp r0, #0
	bne _0225E14A
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225E14A:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0225E14E:
	cmp r3, #4
	bne _0225E17A
	subs r0, #0x8a
	subs r0, r2, r0
	movs r1, #6
	blx FUN_020F2998
	adds r2, r0, #0
	movs r0, #0x95
	lsls r0, r0, #2
	movs r1, #6
	muls r1, r2, r1
	ldr r0, [r5, r0]
	adds r1, r4, r1
	bl FUN_02031A78
	cmp r0, #0
	bne _0225E176
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225E176:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0225E17A:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0225E180: .4byte 0x00000283
	thumb_func_end FUN_0225E12C
