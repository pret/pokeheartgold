
	thumb_func_start MOD113_021E5900
MOD113_021E5900: @ 0x021E5900
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r1, [r5]
	adds r6, r0, #0
	cmp r1, #0
	beq _021E5912
	cmp r1, #1
	beq _021E5954
	b _021E5964
_021E5912:
	bl FUN_021E59F8
	movs r2, #2
	movs r0, #3
	movs r1, #0x98
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r1, #0x16
	adds r0, r6, #0
	lsls r1, r1, #4
	movs r2, #0x98
	bl FUN_02007280
	movs r2, #0x16
	movs r1, #0
	lsls r2, r2, #4
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x98
	str r0, [r4]
	adds r0, r6, #0
	bl FUN_020072A4
	str r0, [r4, #4]
	adds r0, r4, #0
	bl FUN_021E5A7C
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _021E5964
_021E5954:
	bl FUN_02007290
	bl FUN_021E5B70
	cmp r0, #0
	beq _021E5964
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E5964:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end MOD113_021E5900
_021E5968:
	.byte 0x38, 0xB5, 0x0C, 0x1C, 0x21, 0xF6, 0x90, 0xFC
	.byte 0x21, 0x68, 0x05, 0x1C, 0x04, 0x29, 0x1C, 0xD8, 0x49, 0x18, 0x79, 0x44, 0xC9, 0x88, 0x09, 0x04
	.byte 0x09, 0x14, 0x8F, 0x44, 0x08, 0x00, 0x10, 0x00, 0x18, 0x00, 0x20, 0x00, 0x28, 0x00, 0x00, 0xF0
	.byte 0x19, 0xF9, 0x20, 0x60, 0x0D, 0xE0, 0x00, 0xF0, 0x39, 0xF9, 0x20, 0x60, 0x09, 0xE0, 0x00, 0xF0
	.byte 0x5F, 0xF9, 0x20, 0x60, 0x05, 0xE0, 0x00, 0xF0, 0x5F, 0xF9, 0x20, 0x60, 0x01, 0xE0, 0x01, 0x20
	.byte 0x38, 0xBD, 0x28, 0x1C, 0xB0, 0x30, 0x00, 0x68, 0x27, 0xF6, 0x32, 0xFB, 0xB4, 0x35, 0x28, 0x68
	.byte 0x27, 0xF6, 0x2E, 0xFB, 0x00, 0x20, 0x38, 0xBD, 0x38, 0xB5, 0x05, 0x1C, 0x21, 0xF6, 0x60, 0xFC
	.byte 0x04, 0x1C, 0x00, 0xF0, 0xED, 0xF8, 0x00, 0x28, 0x01, 0xD1, 0x00, 0x20, 0x38, 0xBD, 0x00, 0xF0
	.byte 0x0B, 0xF8, 0x20, 0x1C, 0x00, 0xF0, 0xBC, 0xF8, 0x28, 0x1C, 0x21, 0xF6, 0x53, 0xFC, 0x98, 0x20
	.byte 0x34, 0xF6, 0xE8, 0xFF, 0x01, 0x20, 0x38, 0xBD

	thumb_func_start FUN_021E59F8
FUN_021E59F8: @ 0x021E59F8
	push {r3, lr}
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5A40 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5A44 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	pop {r3, pc}
	.align 2, 0
_021E5A40: .4byte 0xFFFFE0FF
_021E5A44: .4byte 0x04001000
	thumb_func_end FUN_021E59F8

	thumb_func_start FUN_021E5A48
FUN_021E5A48: @ 0x021E5A48
	push {r3, r4, r5, r6, r7, lr}
	movs r5, #0
	adds r7, r0, #0
	adds r6, r1, #0
	adds r4, r5, #0
_021E5A52:
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #1
	bl FUN_0202A108
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	adds r1, #0xe6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _021E5A70
	strb r0, [r6, r5]
	adds r5, r5, #1
_021E5A70:
	adds r4, r4, #1
	cmp r4, #0x1c
	blt _021E5A52
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end FUN_021E5A48

	thumb_func_start FUN_021E5A7C
FUN_021E5A7C: @ 0x021E5A7C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldr r0, [r0]
	bl FUN_020183F0
	str r0, [r5, #0x14]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	bl FUN_02028EA8
	adds r4, r0, #0
	bl FUN_0202AD3C
	strb r0, [r5, #0x18]
	adds r0, r4, #0
	bl FUN_0202ADCC
	strb r0, [r5, #0x19]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	bl FUN_0202A634
	str r0, [r5, #0xc]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	bl FUN_020503D0
	bl FUN_02066B70
	adds r1, r5, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r5, #0
	bl FUN_021E5D80
	strb r0, [r5, #0x1d]
	ldr r0, [r5, #0xc]
	movs r1, #1
	bl FUN_0202A14C
	strb r0, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #4
	blo _021E5B10
	movs r1, #0
_021E5ADE:
	adds r0, r5, r1
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r1, #1
	cmp r1, #0x19
	ble _021E5ADE
	ldr r0, [r5, #0xc]
	add r1, sp, #0
	bl FUN_021E5A48
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r4, #0
	cmp r3, #0
	ble _021E5B32
	add r2, sp, #0
_021E5AFE:
	ldrb r1, [r2]
	adds r0, r5, r4
	adds r0, #0x3a
	adds r4, r4, #1
	strb r1, [r0]
	adds r2, r2, #1
	cmp r4, r3
	blt _021E5AFE
	b _021E5B32
_021E5B10:
	ldrb r0, [r5, #0x1f]
	movs r4, #0
	cmp r0, #0
	ble _021E5B32
	movs r6, #1
_021E5B1A:
	ldr r0, [r5, #0xc]
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0202A108
	adds r1, r5, r4
	adds r1, #0x20
	strb r0, [r1]
	ldrb r0, [r5, #0x1f]
	adds r4, r4, #1
	cmp r4, r0
	blt _021E5B1A
_021E5B32:
	ldrb r0, [r5, #0x1f]
	movs r1, #0xe
	blx FUN_020F2998
	strb r0, [r5, #0x1c]
	ldrb r0, [r5, #0x1f]
	cmp r0, #0
	beq _021E5B52
	movs r1, #0xe
	blx FUN_020F2998
	cmp r1, #0
	beq _021E5B52
	ldrb r0, [r5, #0x1c]
	adds r0, r0, #1
	strb r0, [r5, #0x1c]
_021E5B52:
	ldrb r1, [r5, #0x1c]
	ldrb r0, [r5, #0x1d]
	adds r0, r1, r0
	adds r0, r0, #1
	strb r0, [r5, #0x1b]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end FUN_021E5A7C
_021E5B60:
	.byte 0x01, 0x1C, 0x48, 0x68, 0x01, 0x4B, 0x00, 0x68, 0x49, 0x69, 0x18, 0x47, 0x11, 0x84, 0x01, 0x02

	thumb_func_start FUN_021E5B70
FUN_021E5B70: @ 0x021E5B70
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	beq _021E5B80
	cmp r1, #1
	beq _021E5B8C
	b _021E5BAC
_021E5B80:
	bl FUN_021E5CF8
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E5BAC
_021E5B8C:
	bl FUN_021E5D4C
	bl FUN_020210BC
	movs r0, #1
	bl FUN_02021148
	movs r1, #0
	movs r0, #0x45
	adds r2, r1, #0
	bl FUN_02004EC4
	movs r0, #0
	strh r0, [r4, #0x10]
	movs r0, #1
	pop {r4, pc}
_021E5BAC:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end FUN_021E5B70
_021E5BB0:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x3B, 0xF6, 0x40, 0xFB, 0x20, 0x1C, 0x00, 0xF0, 0xB5, 0xF8, 0x01, 0x20
	.byte 0x10, 0xBD, 0x00, 0x00, 0x18, 0xB5, 0x83, 0xB0, 0x04, 0x1C, 0x20, 0x8A, 0x00, 0x28, 0x02, 0xD0
	.byte 0x01, 0x28, 0x0F, 0xD0, 0x17, 0xE0, 0x06, 0x20, 0x01, 0x21, 0x00, 0x90, 0x01, 0x91, 0x20, 0x68
	.byte 0x0A, 0x1C, 0x02, 0x90, 0x00, 0x20, 0x03, 0x1C, 0x29, 0xF6, 0x1C, 0xFF, 0x20, 0x8A, 0x40, 0x1C
	.byte 0x20, 0x82, 0x08, 0xE0, 0x29, 0xF6, 0xB2, 0xFF, 0x00, 0x28, 0x04, 0xD0, 0x00, 0x20, 0x20, 0x82
	.byte 0x03, 0xB0, 0x02, 0x20, 0x18, 0xBD, 0x00, 0x20, 0x03, 0xB0, 0x18, 0xBD, 0x18, 0xB5, 0x83, 0xB0
	.byte 0x04, 0x1C, 0x21, 0x8A, 0x00, 0x29, 0x02, 0xD0, 0x01, 0x29, 0x14, 0xD0, 0x1C, 0xE0, 0x00, 0xF0
	.byte 0x51, 0xF9, 0x00, 0x28, 0x18, 0xD1, 0x06, 0x20, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0x20, 0x68
	.byte 0x02, 0x90, 0x00, 0x20, 0x01, 0x1C, 0x02, 0x1C, 0x03, 0x1C, 0x29, 0xF6, 0xF3, 0xFE, 0x20, 0x8A
	.byte 0x40, 0x1C, 0x20, 0x82, 0x08, 0xE0, 0x29, 0xF6, 0x89, 0xFF, 0x00, 0x28, 0x04, 0xD0, 0x00, 0x20
	.byte 0x20, 0x82, 0x03, 0xB0, 0x04, 0x20, 0x18, 0xBD, 0x01, 0x20, 0x03, 0xB0, 0x18, 0xBD, 0x00, 0x00
	.byte 0x00, 0x4B, 0x18, 0x47, 0x61, 0x5D, 0x1E, 0x02, 0x18, 0xB5, 0x83, 0xB0, 0x04, 0x1C, 0x20, 0x8A
	.byte 0x03, 0x28, 0x3E, 0xD8, 0x00, 0x18, 0x78, 0x44, 0xC0, 0x88, 0x00, 0x04, 0x00, 0x14, 0x87, 0x44
	.byte 0x06, 0x00, 0x26, 0x00, 0x3E, 0x00, 0x5E, 0x00, 0x06, 0x20, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90
	.byte 0x20, 0x68, 0x04, 0x21, 0x02, 0x90, 0x00, 0x20, 0x02, 0x22, 0x03, 0x1C, 0x29, 0xF6, 0xC2, 0xFE
	.byte 0x20, 0x8A, 0x40, 0x1C, 0x20, 0x82, 0x24, 0xE0, 0x29, 0xF6, 0x58, 0xFF, 0x00, 0x28, 0x20, 0xD0
	.byte 0xA1, 0x7E, 0x20, 0x1C, 0x00, 0xF0, 0x76, 0xF8, 0x20, 0x8A, 0x40, 0x1C, 0x20, 0x82, 0x18, 0xE0
	.byte 0x06, 0x20, 0x00, 0x90, 0x01, 0x20, 0x01, 0x90, 0x20, 0x68, 0x03, 0x21, 0x02, 0x90, 0x00, 0x20
	.byte 0x05, 0x22, 0x03, 0x1C, 0x29, 0xF6, 0xA6, 0xFE, 0x20, 0x8A, 0x40, 0x1C, 0x20, 0x82, 0x08, 0xE0
	.byte 0x29, 0xF6, 0x3C, 0xFF, 0x00, 0x28, 0x04, 0xD0, 0x00, 0x20, 0x20, 0x82, 0x03, 0xB0, 0x02, 0x20
	.byte 0x18, 0xBD, 0x03, 0x20, 0x03, 0xB0, 0x18, 0xBD

	thumb_func_start FUN_021E5CF8
FUN_021E5CF8: @ 0x021E5CF8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_021E6300
	adds r0, r4, #0
	bl FUN_021E650C
	adds r0, r4, #0
	bl FUN_021E6680
	adds r0, r4, #0
	bl FUN_021E671C
	adds r0, r4, #0
	bl FUN_021E6988
	ldr r0, _021E5D24 @ =0x021E62B1
	adds r1, r4, #0
	bl FUN_0201A0FC
	pop {r4, pc}
	nop
_021E5D24: .4byte 0x021E62B1
	thumb_func_end FUN_021E5CF8
_021E5D28:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x00, 0xF0, 0x3C, 0xFE
	.byte 0x20, 0x1C, 0x00, 0xF0, 0x0F, 0xFD, 0x20, 0x1C, 0x00, 0xF0, 0xD4, 0xFC, 0x20, 0x1C, 0x00, 0xF0
	.byte 0x7D, 0xFC, 0x20, 0x1C, 0x00, 0xF0, 0xA4, 0xFB, 0x10, 0xBD, 0x00, 0x00

	thumb_func_start FUN_021E5D4C
FUN_021E5D4C: @ 0x021E5D4C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl FUN_021E5E64
	ldrb r1, [r4, #0x1a]
	adds r0, r4, #0
	bl FUN_021E5DA4
	pop {r4, pc}
	thumb_func_end FUN_021E5D4C
_021E5D60:
	.byte 0x18, 0xB5, 0x81, 0xB0, 0x00, 0x21, 0x00, 0x91, 0x00, 0xA9, 0x04, 0x1C, 0x00, 0xF0, 0x12, 0xF9
	.byte 0x00, 0x99, 0x00, 0x29, 0x02, 0xD1, 0x20, 0x1C, 0x00, 0xF0, 0xE6, 0xF8, 0x01, 0xB0, 0x18, 0xBD

	thumb_func_start FUN_021E5D80
FUN_021E5D80: @ 0x021E5D80
	adds r0, #0x3c
	ldrb r3, [r0]
	ldr r2, _021E5DA0 @ =0x021E6BD0
	movs r1, #0
_021E5D88:
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r0, r3
	bgt _021E5D9A
	adds r1, r1, #1
	adds r2, r2, #4
	cmp r1, #6
	blt _021E5D88
_021E5D9A:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_021E5DA0: .4byte 0x021E6BD0
	thumb_func_end FUN_021E5D80

	thumb_func_start FUN_021E5DA4
FUN_021E5DA4: @ 0x021E5DA4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x78
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x88
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x98
	movs r1, #0
	bl FUN_0201D978
	ldrb r3, [r4, #0x1a]
	cmp r3, #0
	bne _021E5DD4
	adds r0, r4, #0
	bl FUN_021E5FC0
	b _021E5DF6
_021E5DD4:
	ldrb r2, [r4, #0x1c]
	subs r1, r3, #1
	cmp r1, r2
	bge _021E5DE8
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl FUN_021E6084
	b _021E5DF6
_021E5DE8:
	adds r1, r2, #1
	subs r1, r3, r1
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl FUN_021E613C
_021E5DF6:
	movs r1, #0
	str r1, [sp]
	movs r3, #1
	str r3, [sp, #4]
	ldrb r2, [r4, #0x1a]
	ldr r0, [r4, #0x48]
	adds r2, r2, #1
	bl FUN_0200BFCC
	movs r0, #0
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldrb r2, [r4, #0x1b]
	ldr r0, [r4, #0x48]
	adds r3, r1, #0
	bl FUN_0200BFCC
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	ldr r2, [r4, #0x58]
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E5E60 @ =0x000F0200
	adds r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	ldr r2, [r4, #0x50]
	adds r0, #0x98
	bl FUN_020200FC
	adds r0, r4, #0
	adds r0, #0x78
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x88
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x98
	bl FUN_0201D5C8
	adds r0, r4, #0
	bl FUN_021E6B1C
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E5E60: .4byte 0x000F0200
	thumb_func_end FUN_021E5DA4

	thumb_func_start FUN_021E5E64
FUN_021E5E64: @ 0x021E5E64
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0xb8
	ldr r0, [r0]
	bl FUN_020248F0
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	bl FUN_02024964
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #0
	bl FUN_0201D978
	ldr r1, [r4, #0x54]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	movs r1, #0
	adds r3, r0, #0
	movs r5, #0x30
	subs r3, r5, r3
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E5EC0 @ =0x00070F00
	lsrs r3, r3, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	ldr r2, [r4, #0x54]
	adds r0, #0x68
	movs r1, #4
	bl FUN_020200FC
	adds r4, #0x68
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E5EC0: .4byte 0x00070F00
	thumb_func_end FUN_021E5E64
_021E5EC4:
	.byte 0x01, 0x4B, 0xB8, 0x30, 0x00, 0x68, 0x18, 0x47, 0x69, 0x4B, 0x02, 0x02
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x00, 0x29, 0x04, 0xD0, 0x01, 0x29, 0x0B, 0xD0, 0x02, 0x29, 0x1A, 0xD0
	.byte 0x2C, 0xE0, 0x17, 0x48, 0x20, 0xF6, 0xB2, 0xF8, 0x20, 0x1C, 0x01, 0x21, 0xFF, 0xF7, 0xBA, 0xFF
	.byte 0x01, 0x20, 0x10, 0xBD, 0xA0, 0x7E, 0x00, 0x28, 0x01, 0xD1, 0x02, 0x20, 0x10, 0xBD, 0x40, 0x1E
	.byte 0xA0, 0x76, 0xBC, 0x34, 0x20, 0x68, 0x03, 0x21, 0x3E, 0xF6, 0xF2, 0xFC, 0x0D, 0x48, 0x20, 0xF6
	.byte 0x9D, 0xF8, 0x03, 0x20, 0x10, 0xBD, 0xE0, 0x7E, 0xA1, 0x7E, 0x40, 0x1E, 0x81, 0x42, 0x01, 0xDB
	.byte 0x02, 0x20, 0x10, 0xBD, 0x48, 0x1C, 0xA0, 0x76, 0xC0, 0x34, 0x20, 0x68, 0x06, 0x21, 0x3E, 0xF6
	.byte 0xDF, 0xFC, 0x04, 0x48, 0x20, 0xF6, 0x8A, 0xF8, 0x03, 0x20, 0x10, 0xBD, 0x02, 0x20, 0x10, 0xBD
	.byte 0xDD, 0x05, 0x00, 0x00, 0xDC, 0x05, 0x00, 0x00, 0x08, 0xB5, 0x10, 0x49, 0x8A, 0x6C, 0x10, 0x49
	.byte 0x11, 0x42, 0x01, 0xD0, 0x00, 0x21, 0x41, 0x61, 0x0C, 0x49, 0x8B, 0x6C, 0x02, 0x21, 0x1A, 0x1C
	.byte 0x0A, 0x42, 0x03, 0xD0, 0x00, 0x21, 0xFF, 0xF7, 0xB3, 0xFF, 0x08, 0xBD, 0x40, 0x22, 0x1A, 0x42
	.byte 0x03, 0xD0, 0x01, 0x21, 0xFF, 0xF7, 0xAC, 0xFF, 0x08, 0xBD, 0x80, 0x22, 0x1A, 0x42, 0x02, 0xD0
	.byte 0xFF, 0xF7, 0xA6, 0xFF, 0x08, 0xBD, 0x08, 0x1C, 0x08, 0xBD, 0xC0, 0x46, 0x0C, 0x11, 0x1D, 0x02
	.byte 0xF3, 0x0C, 0x00, 0x00, 0x38, 0xB5, 0x05, 0x1C, 0x08, 0x48, 0x0C, 0x1C, 0x3F, 0xF6, 0x7E, 0xF9
	.byte 0x01, 0x1C, 0x00, 0x20, 0xC0, 0x43, 0x81, 0x42, 0x01, 0xD1, 0x02, 0x20, 0x38, 0xBD, 0x01, 0x20
	.byte 0x20, 0x60, 0x68, 0x61, 0x28, 0x1C, 0xFF, 0xF7, 0x8B, 0xFF, 0x38, 0xBD, 0x82, 0x6B, 0x1E, 0x02

	thumb_func_start FUN_021E5FC0
FUN_021E5FC0: @ 0x021E5FC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r1, #0x13
	adds r6, r0, #0
	lsls r1, r1, #4
	adds r1, r6, r1
	movs r2, #6
	bl FUN_021E6238
	movs r1, #1
	lsls r1, r1, #8
	adds r0, r6, #0
	adds r1, r6, r1
	movs r2, #2
	bl FUN_021E6238
	movs r4, #0
	adds r5, r6, #0
	adds r7, r4, #0
_021E5FE6:
	adds r0, r5, #0
	adds r0, #0xc4
	ldr r0, [r0]
	adds r1, r7, #0
	bl FUN_0200DCE8
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xe
	blt _021E5FE6
	ldr r0, [r6, #0x44]
	ldr r2, [r6, #0x50]
	movs r1, #1
	bl FUN_0200BB6C
	adds r0, r6, #0
	ldr r1, [r6, #0x50]
	adds r0, #0x78
	movs r2, #0
	movs r3, #0x38
	bl FUN_021E629C
	movs r0, #0
	ldr r1, [r6, #0x5c]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r2, #0xb0
	subs r2, r2, r3
	adds r0, r6, #0
	lsls r2, r2, #0x10
	ldr r1, [r6, #0x5c]
	adds r0, #0x78
	lsrs r2, r2, #0x10
	movs r3, #0x48
	bl FUN_021E629C
	ldr r0, [r6, #0x44]
	ldr r2, [r6, #0x50]
	movs r1, #3
	bl FUN_0200BB6C
	adds r0, r6, #0
	ldr r1, [r6, #0x50]
	adds r0, #0x88
	movs r2, #4
	movs r3, #0x3c
	bl FUN_021E629C
	ldr r0, [r6, #0x44]
	ldr r2, [r6, #0x4c]
	movs r1, #4
	bl FUN_0200BB6C
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldrb r2, [r6, #0x1f]
	ldr r0, [r6, #0x48]
	movs r1, #0
	movs r3, #2
	bl FUN_0200BFCC
	ldr r0, [r6, #0x48]
	ldr r1, [r6, #0x50]
	ldr r2, [r6, #0x4c]
	bl FUN_0200CBBC
	adds r0, r6, #0
	ldr r1, [r6, #0x50]
	adds r0, #0x88
	movs r2, #4
	movs r3, #0x4c
	bl FUN_021E629C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end FUN_021E5FC0

	thumb_func_start FUN_021E6084
FUN_021E6084: @ 0x021E6084
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	movs r1, #5
	adds r5, r0, #0
	lsls r1, r1, #6
	adds r1, r5, r1
	movs r2, #6
	bl FUN_021E6238
	movs r1, #0x11
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r1, r5, r1
	movs r2, #2
	bl FUN_021E6238
	movs r0, #0xe
	muls r0, r4, r0
	str r0, [sp, #4]
	adds r0, r5, #0
	str r0, [sp, #0xc]
	adds r0, #0x88
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r4, #0
	str r0, [sp, #8]
	adds r0, #0x78
	str r5, [sp]
	adds r6, r4, #0
	str r0, [sp, #8]
_021E60C2:
	ldr r0, [sp, #4]
	adds r7, r0, r4
	ldrb r0, [r5, #0x1f]
	cmp r7, r0
	blt _021E60DA
	ldr r0, [sp]
	movs r1, #0
	adds r0, #0xc4
	ldr r0, [r0]
	bl FUN_0200DCE8
	b _021E612A
_021E60DA:
	ldr r0, [sp]
	movs r1, #1
	adds r0, #0xc4
	ldr r0, [r0]
	bl FUN_0200DCE8
	adds r2, r5, r7
	adds r2, #0x20
	ldrb r2, [r2]
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_021E6AE8
	adds r1, r5, r7
	adds r1, #0x20
	ldrb r1, [r1]
	ldr r0, [r5, #0x44]
	ldr r2, [r5, #0x50]
	adds r1, #0x14
	bl FUN_0200BB6C
	cmp r4, #7
	bge _021E6118
	lsls r3, r6, #0x10
	ldr r0, [sp, #8]
	ldr r1, [r5, #0x50]
	movs r2, #0x30
	lsrs r3, r3, #0x10
	bl FUN_021E629C
	b _021E612A
_021E6118:
	adds r3, r6, #0
	subs r3, #0xa8
	lsls r3, r3, #0x10
	ldr r0, [sp, #0xc]
	ldr r1, [r5, #0x50]
	movs r2, #0x30
	lsrs r3, r3, #0x10
	bl FUN_021E629C
_021E612A:
	ldr r0, [sp]
	adds r4, r4, #1
	adds r0, r0, #4
	adds r6, #0x18
	str r0, [sp]
	cmp r4, #0xe
	blt _021E60C2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end FUN_021E6084

	thumb_func_start FUN_021E613C
FUN_021E613C: @ 0x021E613C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	str r1, [sp, #4]
	cmp r1, #0
	bne _021E617C
	movs r1, #0x15
	lsls r1, r1, #4
	adds r1, r5, r1
	movs r2, #6
	bl FUN_021E6238
	movs r1, #0x12
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r1, r5, r1
	movs r2, #2
	bl FUN_021E6238
	movs r6, #0
	adds r4, r5, #0
	adds r7, r6, #0
_021E6168:
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	adds r1, r7, #0
	bl FUN_0200DCE8
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #0xe
	blt _021E6168
_021E617C:
	ldr r0, [sp, #4]
	ldr r1, _021E6234 @ =0x021E6BD0
	lsls r0, r0, #2
	adds r4, r1, r0
	ldrh r1, [r1, r0]
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x18
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r2, r0
	bgt _021E61E8
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x1e
	movs r6, #0
	cmp r0, #0
	ble _021E61E8
	adds r7, r5, #0
	adds r7, #0x78
_021E61A2:
	ldrh r1, [r4]
	ldr r0, [r5, #0x44]
	ldr r2, [r5, #0x50]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	adds r1, r1, r6
	bl FUN_0200BB6C
	ldrh r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	adds r0, r0, r6
	cmp r0, #0xf
	bne _021E61D0
	movs r0, #0
	str r0, [sp]
	ldr r1, [r5, #0x50]
	adds r0, r7, #0
	movs r2, #3
	movs r3, #4
	bl FUN_021E6274
	b _021E61DC
_021E61D0:
	ldr r1, [r5, #0x50]
	adds r0, r7, #0
	movs r2, #4
	movs r3, #0x18
	bl FUN_021E629C
_021E61DC:
	ldrh r0, [r4]
	adds r6, r6, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r6, r0
	blt _021E61A2
_021E61E8:
	ldrh r1, [r4, #2]
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x18
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r2, r0
	bgt _021E622E
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x1e
	movs r6, #0
	cmp r0, #0
	ble _021E622E
	adds r7, r5, #0
	adds r7, #0x88
_021E6206:
	ldrh r1, [r4, #2]
	ldr r0, [r5, #0x44]
	ldr r2, [r5, #0x50]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	adds r1, r1, r6
	bl FUN_0200BB6C
	ldr r1, [r5, #0x50]
	adds r0, r7, #0
	movs r2, #4
	movs r3, #0x18
	bl FUN_021E629C
	ldrh r0, [r4, #2]
	adds r6, r6, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r6, r0
	blt _021E6206
_021E622E:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6234: .4byte 0x021E6BD0
	thumb_func_end FUN_021E613C

	thumb_func_start FUN_021E6238
FUN_021E6238: @ 0x021E6238
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r1, #8]
	adds r4, r2, #0
	movs r2, #0
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrb r0, [r1, #0xc]
	adds r3, r2, #0
	str r0, [sp, #0x14]
	ldrb r0, [r1, #0xd]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x40]
	bl FUN_0201C4EC
	lsls r1, r4, #0x18
	ldr r0, [r5, #0x40]
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end FUN_021E6238

	thumb_func_start FUN_021E6274
FUN_021E6274: @ 0x021E6274
	push {r4, lr}
	sub sp, #0x10
	adds r4, r1, #0
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	ldr r1, _021E6298 @ =0x00010200
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	adds r1, r2, #0
	adds r2, r4, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E6298: .4byte 0x00010200
	thumb_func_end FUN_021E6274

	thumb_func_start FUN_021E629C
FUN_021E629C: @ 0x021E629C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r2, #0
	str r3, [sp]
	movs r2, #0
	adds r3, r4, #0
	bl FUN_021E6274
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end FUN_021E629C
_021E62B0:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0xAC, 0x30, 0x00, 0x68, 0x00, 0x28, 0x01, 0xD0, 0x26, 0xF6, 0xBA, 0xFE
	.byte 0x3A, 0xF6, 0xAC, 0xF9, 0x20, 0x6C, 0x38, 0xF6, 0xF5, 0xFD, 0x03, 0x4B, 0x03, 0x49, 0x01, 0x20
	.byte 0x5A, 0x58, 0x10, 0x43, 0x58, 0x50, 0x10, 0xBD, 0x00, 0x00, 0x7E, 0x02, 0xF8, 0x3F, 0x00, 0x00

	thumb_func_start FUN_021E62E0
FUN_021E62E0: @ 0x021E62E0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E62FC @ =0x021E6CD0
	add r3, sp, #0
	movs r2, #5
_021E62EA:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E62EA
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E62FC: .4byte 0x021E6CD0
	thumb_func_end FUN_021E62E0

	thumb_func_start FUN_021E6300
FUN_021E6300: @ 0x021E6300
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	adds r4, r0, #0
	bl FUN_021E62E0
	ldr r0, [r4]
	bl FUN_0201AC88
	add r3, sp, #0xa8
	ldr r5, _021E646C @ =0x021E6B94
	str r0, [r4, #0x40]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r2, _021E6470 @ =0x04000304
	ldr r0, _021E6474 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r5, _021E6478 @ =0x021E6C3C
	add r3, sp, #0x8c
	ands r0, r1
	strh r0, [r2]
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
	ldr r0, [r4, #0x40]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x40]
	movs r1, #5
	bl FUN_0201CAE0
	ldr r5, _021E647C @ =0x021E6C74
	add r3, sp, #0x70
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
	ldr r0, [r4, #0x40]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x40]
	movs r1, #6
	bl FUN_0201CAE0
	ldr r5, _021E6480 @ =0x021E6BE8
	add r3, sp, #0x54
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #7
	str r0, [r3]
	ldr r0, [r4, #0x40]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x40]
	movs r1, #7
	bl FUN_0201CAE0
	ldr r5, _021E6484 @ =0x021E6C04
	add r3, sp, #0x38
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4, #0x40]
	movs r1, #1
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x40]
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _021E6488 @ =0x021E6C20
	add r3, sp, #0x1c
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
	ldr r0, [r4, #0x40]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x40]
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _021E648C @ =0x021E6C58
	add r3, sp, #0
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #3
	str r0, [r3]
	ldr r0, [r4, #0x40]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x40]
	movs r1, #3
	bl FUN_0201CAE0
	ldr r3, [r4]
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #7
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E646C: .4byte 0x021E6B94
_021E6470: .4byte 0x04000304
_021E6474: .4byte 0xFFFF7FFF
_021E6478: .4byte 0x021E6C3C
_021E647C: .4byte 0x021E6C74
_021E6480: .4byte 0x021E6BE8
_021E6484: .4byte 0x021E6C04
_021E6488: .4byte 0x021E6C20
_021E648C: .4byte 0x021E6C58
	thumb_func_end FUN_021E6300
_021E6490:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x20, 0x6C, 0x03, 0x21, 0x35, 0xF6, 0x58, 0xFB, 0x20, 0x6C, 0x02, 0x21
	.byte 0x35, 0xF6, 0x54, 0xFB, 0x20, 0x6C, 0x01, 0x21, 0x35, 0xF6, 0x50, 0xFB, 0x20, 0x6C, 0x07, 0x21
	.byte 0x35, 0xF6, 0x4C, 0xFB, 0x20, 0x6C, 0x06, 0x21, 0x35, 0xF6, 0x48, 0xFB, 0x20, 0x6C, 0x05, 0x21
	.byte 0x35, 0xF6, 0x44, 0xFB, 0x20, 0x6C, 0x34, 0xF6, 0x21, 0xFB, 0x03, 0x4A, 0x11, 0x88, 0xD0, 0x0A
	.byte 0x08, 0x43, 0x10, 0x80, 0x10, 0xBD, 0xC0, 0x46, 0x04, 0x03, 0x00, 0x04

	thumb_func_start FUN_021E64DC
FUN_021E64DC: @ 0x021E64DC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	str r3, [sp]
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #1
	adds r3, r4, #4
	bl FUN_02007C2C
	str r0, [r4]
	ldr r0, [r4, #4]
	ldrh r0, [r0]
	lsrs r0, r0, #3
	strb r0, [r4, #0xc]
	ldr r0, [r4, #4]
	ldrh r0, [r0, #2]
	lsrs r0, r0, #3
	strb r0, [r4, #0xd]
	ldr r0, [r4, #4]
	adds r0, #0xc
	str r0, [r4, #8]
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end FUN_021E64DC

	thumb_func_start FUN_021E650C
FUN_021E650C: @ 0x021E650C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0xf1
	bl FUN_02007688
	movs r2, #0
	str r2, [sp]
	ldr r1, [r5]
	adds r3, r2, #0
	str r1, [sp, #4]
	movs r1, #5
	adds r4, r0, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #7
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x40]
	adds r0, r4, #0
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #9
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x40]
	adds r0, r4, #0
	movs r3, #3
	bl FUN_02007B68
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5]
	movs r1, #4
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r1, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #6
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x40]
	adds r0, r4, #0
	movs r3, #7
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #8
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x40]
	adds r0, r4, #0
	movs r3, #7
	bl FUN_02007B68
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r3, [r5]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0xa
	bl FUN_021E64DC
	movs r0, #5
	lsls r0, r0, #6
	ldr r3, [r5]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0xc
	bl FUN_021E64DC
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r3, [r5]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0xe
	bl FUN_021E64DC
	movs r0, #1
	lsls r0, r0, #8
	ldr r3, [r5]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0xb
	bl FUN_021E64DC
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r3, [r5]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0xd
	bl FUN_021E64DC
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r3, [r5]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0xf
	bl FUN_021E64DC
	adds r0, r4, #0
	bl FUN_0200770C
	ldrb r0, [r5, #0x19]
	movs r1, #1
	adds r2, r1, #0
	str r0, [sp]
	ldr r0, [r5]
	movs r3, #0xd
	str r0, [sp, #4]
	ldr r0, [r5, #0x40]
	bl FUN_0200E644
	movs r1, #6
	ldr r2, [r5]
	movs r0, #0
	lsls r1, r1, #6
	bl FUN_0200304C
	movs r1, #6
	ldr r2, [r5]
	movs r0, #4
	lsls r1, r1, #6
	bl FUN_0200304C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_021E650C
_021E663C:
	.byte 0x10, 0xB5, 0x04, 0x1C
	.byte 0x12, 0x20, 0x00, 0x01, 0x20, 0x58, 0x34, 0xF6, 0x61, 0xFA, 0x11, 0x20, 0x00, 0x01, 0x20, 0x58
	.byte 0x34, 0xF6, 0x5C, 0xFA, 0x01, 0x20, 0x00, 0x02, 0x20, 0x58, 0x34, 0xF6, 0x57, 0xFA, 0x15, 0x20
	.byte 0x00, 0x01, 0x20, 0x58, 0x34, 0xF6, 0x52, 0xFA, 0x05, 0x20, 0x80, 0x01, 0x20, 0x58, 0x34, 0xF6
	.byte 0x4D, 0xFA, 0x13, 0x20, 0x00, 0x01, 0x20, 0x58, 0x34, 0xF6, 0x48, 0xFA, 0x10, 0xBD, 0x00, 0x00

	thumb_func_start FUN_021E6680
FUN_021E6680: @ 0x021E6680
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #4
	bl FUN_02002CEC
	ldr r3, [r4]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #1
	bl FUN_0200BAF8
	str r0, [r4, #0x44]
	movs r0, #0x10
	ldr r2, [r4]
	adds r1, r0, #0
	bl FUN_0200BD18
	str r0, [r4, #0x48]
	movs r0, #2
	ldr r1, [r4]
	lsls r0, r0, #8
	bl FUN_02026354
	str r0, [r4, #0x4c]
	movs r0, #2
	ldr r1, [r4]
	lsls r0, r0, #8
	bl FUN_02026354
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x44]
	movs r1, #0
	bl FUN_0200BBA0
	str r0, [r4, #0x54]
	ldr r0, [r4, #0x44]
	movs r1, #5
	bl FUN_0200BBA0
	str r0, [r4, #0x58]
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl FUN_02028E9C
	ldr r1, [r4]
	bl FUN_02028F68
	str r0, [r4, #0x5c]
	pop {r4, pc}
	thumb_func_end FUN_021E6680
_021E66E4:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0xE0, 0x6D, 0x3F, 0xF6, 0x49, 0xFE, 0xA0, 0x6D
	.byte 0x3F, 0xF6, 0x46, 0xFE, 0x60, 0x6D, 0x3F, 0xF6, 0x43, 0xFE, 0x20, 0x6D, 0x3F, 0xF6, 0x40, 0xFE
	.byte 0xE0, 0x6C, 0x3F, 0xF6, 0x3D, 0xFE, 0xA0, 0x6C, 0x25, 0xF6, 0x4A, 0xFB, 0x60, 0x6C, 0x25, 0xF6
	.byte 0x19, 0xFA, 0x04, 0x20, 0x1C, 0xF6, 0x4E, 0xFB, 0x10, 0xBD, 0x00, 0x00

	thumb_func_start FUN_021E671C
FUN_021E671C: @ 0x021E671C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	ldr r4, _021E6750 @ =0x021E6C90
	movs r6, #0
	adds r5, #0x68
_021E6728:
	ldr r0, [r7, #0x40]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #4
	blt _021E6728
	ldr r0, [r7]
	bl FUN_0201660C
	adds r7, #0xa8
	str r0, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6750: .4byte 0x021E6C90
	thumb_func_end FUN_021E671C
_021E6754:
	.byte 0x70, 0xB5, 0x06, 0x1C, 0x35, 0x1C, 0x00, 0x24, 0x68, 0x35, 0x28, 0x1C
	.byte 0x37, 0xF6, 0xB2, 0xF8, 0x28, 0x1C, 0x36, 0xF6, 0xDB, 0xFE, 0x64, 0x1C, 0x10, 0x35, 0x04, 0x2C
	.byte 0xF5, 0xDB, 0xA8, 0x36, 0x30, 0x68, 0x2F, 0xF6, 0x55, 0xFF, 0x70, 0xBD

	thumb_func_start FUN_021E677C
FUN_021E677C: @ 0x021E677C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x20
	bl FUN_0202055C
	ldr r0, [r5]
	bl FUN_0200CF18
	adds r1, r5, #0
	adds r1, #0xac
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xac
	ldr r0, [r0]
	ldr r1, _021E6920 @ =0x021E6CB0
	ldr r2, _021E6924 @ =0x021E6BA4
	movs r3, #2
	bl FUN_0200CF70
	ldr r0, [r5]
	bl FUN_0200B2E0
	ldr r0, [r5]
	bl FUN_0200B2E8
	adds r0, r5, #0
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200CF38
	adds r1, r5, #0
	adds r1, #0xb0
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xac
	adds r1, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	movs r2, #0x11
	bl FUN_0200CFF4
	movs r3, #0
	adds r0, r5, #0
	adds r1, r5, #0
	str r3, [sp]
	adds r0, #0xac
	adds r1, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _021E6928 @ =0x021E6B74
	bl FUN_0200D2A4
	ldr r3, _021E692C @ =0x021E6BB8
	add r2, sp, #0x10
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	adds r0, r5, #0
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200CF38
	adds r1, r5, #0
	adds r1, #0xb4
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xac
	adds r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0x10
	bl FUN_0200D3F8
	adds r0, r5, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_0200E2B0
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0xb4
	ldr r0, [r0]
	bl FUN_0200E2B4
	ldr r1, [r5]
	movs r0, #0x14
	bl FUN_02007688
	adds r1, r5, #0
	adds r1, #0xfc
	str r0, [r1]
	bl FUN_02074490
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	adds r2, r5, #0
	str r1, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xac
	adds r1, #0xb4
	adds r2, #0xfc
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200D5D4
	bl FUN_02074494
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r5, #0
	adds r0, #0xac
	adds r1, #0xb4
	adds r2, #0xfc
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200D6EC
	bl FUN_020744A0
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xac
	adds r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	movs r2, #0x14
	bl FUN_0200D704
	movs r4, #0
	adds r6, r4, #0
	movs r7, #2
_021E68B4:
	movs r0, #0xc9
	movs r1, #0
	adds r2, r4, #0
	bl FUN_020741BC
	str r6, [sp]
	adds r3, r0, #0
	adds r1, r5, #0
	adds r2, r5, #0
	str r7, [sp, #4]
	adds r0, r4, #1
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xac
	adds r1, #0xb4
	adds r2, #0xfc
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200D504
	adds r4, r4, #1
	cmp r4, #7
	blt _021E68B4
	movs r4, #7
	movs r6, #0
	movs r7, #1
_021E68EA:
	movs r0, #0xc9
	movs r1, #0
	adds r2, r4, #0
	bl FUN_020741BC
	str r6, [sp]
	adds r3, r0, #0
	adds r1, r5, #0
	adds r2, r5, #0
	str r7, [sp, #4]
	adds r0, r4, #1
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xac
	adds r1, #0xb4
	adds r2, #0xfc
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200D504
	adds r4, r4, #1
	cmp r4, #0xe
	blt _021E68EA
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6920: .4byte 0x021E6CB0
_021E6924: .4byte 0x021E6BA4
_021E6928: .4byte 0x021E6B74
_021E692C: .4byte 0x021E6BB8
	thumb_func_end FUN_021E677C
_021E6930:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x21, 0x1C, 0xAC, 0x30, 0xB4, 0x31, 0x00, 0x68, 0x09, 0x68, 0x27, 0xF6
	.byte 0x2B, 0xF8, 0x20, 0x1C, 0x21, 0x1C, 0xAC, 0x30, 0xB0, 0x31, 0x00, 0x68, 0x09, 0x68, 0x26, 0xF6
	.byte 0xC9, 0xFB, 0x20, 0x1C, 0x00, 0x21, 0xB4, 0x30, 0x01, 0x60, 0x20, 0x1C, 0xB0, 0x30, 0x01, 0x60
	.byte 0x20, 0x1C, 0xFC, 0x30, 0x00, 0x68, 0x20, 0xF6, 0xD1, 0xFE, 0x20, 0x1C, 0xAC, 0x30, 0x00, 0x68
	.byte 0x26, 0xF6, 0xCA, 0xFB, 0x20, 0x1C, 0x00, 0x21, 0xAC, 0x30, 0x01, 0x60, 0x39, 0xF6, 0x16, 0xFE
	.byte 0x20, 0x68, 0x24, 0xF6, 0xAD, 0xFC, 0x10, 0xBD

	thumb_func_start FUN_021E6988
FUN_021E6988: @ 0x021E6988
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_021E677C
	adds r0, r4, #0
	bl FUN_021E69CC
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	pop {r4, pc}
	thumb_func_end FUN_021E6988
_021E69A8:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x10, 0x20, 0x00, 0x21
	.byte 0x3C, 0xF6, 0x8A, 0xF9, 0x10, 0x20, 0x00, 0x21, 0x3C, 0xF6, 0x52, 0xF9, 0x20, 0x1C, 0x00, 0xF0
	.byte 0x77, 0xF8, 0x20, 0x1C, 0xFF, 0xF7, 0xB4, 0xFF, 0x10, 0xBD, 0x00, 0x00

	thumb_func_start FUN_021E69CC
FUN_021E69CC: @ 0x021E69CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	ldr r6, _021E6AAC @ =0x021E6CF8
	movs r7, #0
	adds r4, r5, #0
_021E69D8:
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xac
	adds r1, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r6, #0
	bl FUN_0200D2B4
	adds r1, r4, #0
	adds r1, #0xb8
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02024830
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0202484C
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	movs r1, #2
	bl FUN_02024A04
	adds r7, r7, #1
	adds r6, #0x28
	adds r4, r4, #4
	cmp r7, #3
	blt _021E69D8
	add r0, sp, #4
	movs r1, #0
	movs r2, #0x34
	blx FUN_020D4994
	movs r0, #1
	movs r1, #0
	str r0, [sp, #0x30]
	movs r0, #0xc9
	adds r2, r1, #0
	bl FUN_02074364
	movs r4, #0
	str r0, [sp, #0x10]
	str r4, [sp, #0x34]
	movs r1, #0x28
	add r0, sp, #4
	strh r1, [r0]
	movs r0, #1
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	subs r0, r0, #2
	str r0, [sp, #0x28]
	str r0, [sp, #0x2c]
	movs r7, #0x1d
	str r4, [sp]
	adds r6, r5, #0
_021E6A56:
	cmp r4, #7
	add r0, sp, #4
	bge _021E6A64
	strh r7, [r0, #2]
	movs r0, #2
	str r0, [sp, #0x14]
	b _021E6A6E
_021E6A64:
	ldr r1, [sp]
	subs r1, #0x9b
	strh r1, [r0, #2]
	movs r0, #1
	str r0, [sp, #0x14]
_021E6A6E:
	adds r0, r4, #1
	str r0, [sp, #0x18]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xac
	adds r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #4
	bl FUN_0200D734
	adds r1, r6, #0
	adds r1, #0xc4
	str r0, [r1]
	adds r0, r6, #0
	adds r0, #0xc4
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [sp]
	adds r4, r4, #1
	adds r0, #0x18
	adds r7, #0x18
	adds r6, r6, #4
	str r0, [sp]
	cmp r4, #0xe
	blt _021E6A56
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6AAC: .4byte 0x021E6CF8
	thumb_func_end FUN_021E69CC
_021E6AB0:
	.byte 0x70, 0xB5, 0x05, 0x1C, 0x00, 0x26, 0x2C, 0x1C, 0x20, 0x1C, 0xC4, 0x30, 0x00, 0x68, 0x00, 0x28
	.byte 0x01, 0xD0, 0x26, 0xF6, 0x8B, 0xFF, 0x76, 0x1C, 0x24, 0x1D, 0x0E, 0x2E, 0xF4, 0xDB, 0x00, 0x24
	.byte 0x28, 0x1C, 0xB8, 0x30, 0x00, 0x68, 0x00, 0x28, 0x01, 0xD0, 0x3D, 0xF6, 0x3D, 0xFE, 0x64, 0x1C
	.byte 0x2D, 0x1D, 0x03, 0x2C, 0xF4, 0xDB, 0x70, 0xBD

	thumb_func_start FUN_021E6AE8
FUN_021E6AE8: @ 0x021E6AE8
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0xc9
	movs r1, #0
	bl FUN_020741BC
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xac
	adds r1, #0xb4
	adds r5, #0xfc
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r5]
	bl FUN_0200E2B8
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end FUN_021E6AE8

	thumb_func_start FUN_021E6B1C
FUN_021E6B1C: @ 0x021E6B1C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x1b]
	cmp r0, #1
	beq _021E6B2C
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _021E6B3A
_021E6B2C:
	adds r0, r4, #0
	adds r0, #0xbc
	ldr r0, [r0]
	movs r1, #4
	bl FUN_020248F0
	b _021E6B46
_021E6B3A:
	adds r0, r4, #0
	adds r0, #0xbc
	ldr r0, [r0]
	movs r1, #2
	bl FUN_020248F0
_021E6B46:
	ldrb r0, [r4, #0x1b]
	cmp r0, #1
	beq _021E6B54
	ldrb r1, [r4, #0x1a]
	subs r0, r0, #1
	cmp r1, r0
	bne _021E6B60
_021E6B54:
	adds r4, #0xc0
	ldr r0, [r4]
	movs r1, #7
	bl FUN_020248F0
	pop {r4, pc}
_021E6B60:
	adds r4, #0xc0
	ldr r0, [r4]
	movs r1, #5
	bl FUN_020248F0
	pop {r4, pc}
	thumb_func_end FUN_021E6B1C
