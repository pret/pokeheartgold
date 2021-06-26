
	thumb_func_start ov113_021E5900
ov113_021E5900: @ 0x021E5900
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
	bl ov113_021E59F8
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
	bl ov113_021E5A7C
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _021E5964
_021E5954:
	bl FUN_02007290
	bl ov113_021E5B70
	cmp r0, #0
	beq _021E5964
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E5964:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov113_021E5900

	thumb_func_start ov113_021E5968
ov113_021E5968: @ 0x021E5968
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #4
	bhi _021E59B2
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5984: @ jump table
	.2byte _021E598E - _021E5984 - 2 @ case 0
	.2byte _021E5996 - _021E5984 - 2 @ case 1
	.2byte _021E599E - _021E5984 - 2 @ case 2
	.2byte _021E59A6 - _021E5984 - 2 @ case 3
	.2byte _021E59AE - _021E5984 - 2 @ case 4
_021E598E:
	bl ov113_021E5BC4
	str r0, [r4]
	b _021E59B2
_021E5996:
	bl ov113_021E5C0C
	str r0, [r4]
	b _021E59B2
_021E599E:
	bl ov113_021E5C60
	str r0, [r4]
	b _021E59B2
_021E59A6:
	bl ov113_021E5C68
	str r0, [r4]
	b _021E59B2
_021E59AE:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E59B2:
	adds r0, r5, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_0200D020
	adds r5, #0xb4
	ldr r0, [r5]
	bl FUN_0200D020
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov113_021E5968

	thumb_func_start ov113_021E59C8
ov113_021E59C8: @ 0x021E59C8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov113_021E5BB0
	cmp r0, #0
	bne _021E59DE
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E59DE:
	bl ov113_021E59F8
	adds r0, r4, #0
	bl ov113_021E5B60
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x98
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov113_021E59C8

	thumb_func_start ov113_021E59F8
ov113_021E59F8: @ 0x021E59F8
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
	thumb_func_end ov113_021E59F8

	thumb_func_start ov113_021E5A48
ov113_021E5A48: @ 0x021E5A48
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
	thumb_func_end ov113_021E5A48

	thumb_func_start ov113_021E5A7C
ov113_021E5A7C: @ 0x021E5A7C
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
	bl ov113_021E5D80
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
	bl ov113_021E5A48
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
	thumb_func_end ov113_021E5A7C

	thumb_func_start ov113_021E5B60
ov113_021E5B60: @ 0x021E5B60
	adds r1, r0, #0
	ldr r0, [r1, #4]
	ldr r3, _021E5B6C @ =FUN_02018410
	ldr r0, [r0]
	ldr r1, [r1, #0x14]
	bx r3
	.align 2, 0
_021E5B6C: .4byte FUN_02018410
	thumb_func_end ov113_021E5B60

	thumb_func_start ov113_021E5B70
ov113_021E5B70: @ 0x021E5B70
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	beq _021E5B80
	cmp r1, #1
	beq _021E5B8C
	b _021E5BAC
_021E5B80:
	bl ov113_021E5CF8
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E5BAC
_021E5B8C:
	bl ov113_021E5D4C
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
	thumb_func_end ov113_021E5B70

	thumb_func_start ov113_021E5BB0
ov113_021E5BB0: @ 0x021E5BB0
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02021238
	adds r0, r4, #0
	bl ov113_021E5D28
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov113_021E5BB0

	thumb_func_start ov113_021E5BC4
ov113_021E5BC4: @ 0x021E5BC4
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _021E5BD6
	cmp r0, #1
	beq _021E5BF4
	b _021E5C06
_021E5BD6:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E5C06
_021E5BF4:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5C06
	movs r0, #0
	strh r0, [r4, #0x10]
	add sp, #0xc
	movs r0, #2
	pop {r3, r4, pc}
_021E5C06:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov113_021E5BC4

	thumb_func_start ov113_021E5C0C
ov113_021E5C0C: @ 0x021E5C0C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	beq _021E5C1E
	cmp r1, #1
	beq _021E5C46
	b _021E5C58
_021E5C1E:
	bl ov113_021E5EC4
	cmp r0, #0
	bne _021E5C58
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E5C58
_021E5C46:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5C58
	movs r0, #0
	strh r0, [r4, #0x10]
	add sp, #0xc
	movs r0, #4
	pop {r3, r4, pc}
_021E5C58:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov113_021E5C0C

	thumb_func_start ov113_021E5C60
ov113_021E5C60: @ 0x021E5C60
	ldr r3, _021E5C64 @ =ov113_021E5D60
	bx r3
	.align 2, 0
_021E5C64: .4byte ov113_021E5D60
	thumb_func_end ov113_021E5C60

	thumb_func_start ov113_021E5C68
ov113_021E5C68: @ 0x021E5C68
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrh r0, [r4, #0x10]
	cmp r0, #3
	bhi _021E5CF2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5C80: @ jump table
	.2byte _021E5C88 - _021E5C80 - 2 @ case 0
	.2byte _021E5CA8 - _021E5C80 - 2 @ case 1
	.2byte _021E5CC0 - _021E5C80 - 2 @ case 2
	.2byte _021E5CE0 - _021E5C80 - 2 @ case 3
_021E5C88:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #0
	movs r2, #2
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E5CF2
_021E5CA8:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5CF2
	ldrb r1, [r4, #0x1a]
	adds r0, r4, #0
	bl ov113_021E5DA4
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E5CF2
_021E5CC0:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r1, #3
	str r0, [sp, #8]
	movs r0, #0
	movs r2, #5
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E5CF2
_021E5CE0:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5CF2
	movs r0, #0
	strh r0, [r4, #0x10]
	add sp, #0xc
	movs r0, #2
	pop {r3, r4, pc}
_021E5CF2:
	movs r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov113_021E5C68

	thumb_func_start ov113_021E5CF8
ov113_021E5CF8: @ 0x021E5CF8
	push {r4, lr}
	adds r4, r0, #0
	bl ov113_021E6300
	adds r0, r4, #0
	bl ov113_021E650C
	adds r0, r4, #0
	bl ov113_021E6680
	adds r0, r4, #0
	bl ov113_021E671C
	adds r0, r4, #0
	bl ov113_021E6988
	ldr r0, _021E5D24 @ =ov113_021E62B0
	adds r1, r4, #0
	bl FUN_0201A0FC
	pop {r4, pc}
	nop
_021E5D24: .4byte ov113_021E62B0
	thumb_func_end ov113_021E5CF8

	thumb_func_start ov113_021E5D28
ov113_021E5D28: @ 0x021E5D28
	push {r4, lr}
	adds r4, r0, #0
	bl ov113_021E69A8
	adds r0, r4, #0
	bl ov113_021E6754
	adds r0, r4, #0
	bl ov113_021E66E4
	adds r0, r4, #0
	bl ov113_021E663C
	adds r0, r4, #0
	bl ov113_021E6490
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov113_021E5D28

	thumb_func_start ov113_021E5D4C
ov113_021E5D4C: @ 0x021E5D4C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl ov113_021E5E64
	ldrb r1, [r4, #0x1a]
	adds r0, r4, #0
	bl ov113_021E5DA4
	pop {r4, pc}
	thumb_func_end ov113_021E5D4C

	thumb_func_start ov113_021E5D60
ov113_021E5D60: @ 0x021E5D60
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	add r1, sp, #0
	adds r4, r0, #0
	bl ov113_021E5F94
	ldr r1, [sp]
	cmp r1, #0
	bne _021E5D7C
	adds r0, r4, #0
	bl ov113_021E5F48
_021E5D7C:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov113_021E5D60

	thumb_func_start ov113_021E5D80
ov113_021E5D80: @ 0x021E5D80
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
	thumb_func_end ov113_021E5D80

	thumb_func_start ov113_021E5DA4
ov113_021E5DA4: @ 0x021E5DA4
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
	bl ov113_021E5FC0
	b _021E5DF6
_021E5DD4:
	ldrb r2, [r4, #0x1c]
	subs r1, r3, #1
	cmp r1, r2
	bge _021E5DE8
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov113_021E6084
	b _021E5DF6
_021E5DE8:
	adds r1, r2, #1
	subs r1, r3, r1
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov113_021E613C
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
	bl ov113_021E6B1C
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E5E60: .4byte 0x000F0200
	thumb_func_end ov113_021E5DA4

	thumb_func_start ov113_021E5E64
ov113_021E5E64: @ 0x021E5E64
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
	thumb_func_end ov113_021E5E64

	thumb_func_start ov113_021E5EC4
ov113_021E5EC4: @ 0x021E5EC4
	ldr r3, _021E5ECC @ =FUN_02024B68
	adds r0, #0xb8
	ldr r0, [r0]
	bx r3
	.align 2, 0
_021E5ECC: .4byte FUN_02024B68
	thumb_func_end ov113_021E5EC4

	thumb_func_start ov113_021E5ED0
ov113_021E5ED0: @ 0x021E5ED0
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _021E5EE2
	cmp r1, #1
	beq _021E5EF4
	cmp r1, #2
	beq _021E5F16
	b _021E5F3C
_021E5EE2:
	ldr r0, _021E5F40 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	bl ov113_021E5E64
	movs r0, #1
	pop {r4, pc}
_021E5EF4:
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _021E5EFE
	movs r0, #2
	pop {r4, pc}
_021E5EFE:
	subs r0, r0, #1
	strb r0, [r4, #0x1a]
	adds r4, #0xbc
	ldr r0, [r4]
	movs r1, #3
	bl FUN_020248F0
	ldr r0, _021E5F44 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #3
	pop {r4, pc}
_021E5F16:
	ldrb r0, [r4, #0x1b]
	ldrb r1, [r4, #0x1a]
	subs r0, r0, #1
	cmp r1, r0
	blt _021E5F24
	movs r0, #2
	pop {r4, pc}
_021E5F24:
	adds r0, r1, #1
	strb r0, [r4, #0x1a]
	adds r4, #0xc0
	ldr r0, [r4]
	movs r1, #6
	bl FUN_020248F0
	ldr r0, _021E5F44 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #3
	pop {r4, pc}
_021E5F3C:
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
_021E5F40: .4byte 0x000005DD
_021E5F44: .4byte 0x000005DC
	thumb_func_end ov113_021E5ED0

	thumb_func_start ov113_021E5F48
ov113_021E5F48: @ 0x021E5F48
	push {r3, lr}
	ldr r1, _021E5F8C @ =0x021D110C
	ldr r2, [r1, #0x48]
	ldr r1, _021E5F90 @ =0x00000CF3
	tst r1, r2
	beq _021E5F58
	movs r1, #0
	str r1, [r0, #0x14]
_021E5F58:
	ldr r1, _021E5F8C @ =0x021D110C
	ldr r3, [r1, #0x48]
	movs r1, #2
	adds r2, r3, #0
	tst r2, r1
	beq _021E5F6C
	movs r1, #0
	bl ov113_021E5ED0
	pop {r3, pc}
_021E5F6C:
	movs r2, #0x40
	tst r2, r3
	beq _021E5F7A
	movs r1, #1
	bl ov113_021E5ED0
	pop {r3, pc}
_021E5F7A:
	movs r2, #0x80
	tst r2, r3
	beq _021E5F86
	bl ov113_021E5ED0
	pop {r3, pc}
_021E5F86:
	adds r0, r1, #0
	pop {r3, pc}
	nop
_021E5F8C: .4byte 0x021D110C
_021E5F90: .4byte 0x00000CF3
	thumb_func_end ov113_021E5F48

	thumb_func_start ov113_021E5F94
ov113_021E5F94: @ 0x021E5F94
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021E5FBC @ =0x021E6B82
	adds r4, r1, #0
	bl FUN_0202529C
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	bne _021E5FAE
	movs r0, #2
	pop {r3, r4, r5, pc}
_021E5FAE:
	movs r0, #1
	str r0, [r4]
	str r0, [r5, #0x14]
	adds r0, r5, #0
	bl ov113_021E5ED0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5FBC: .4byte 0x021E6B82
	thumb_func_end ov113_021E5F94

	thumb_func_start ov113_021E5FC0
ov113_021E5FC0: @ 0x021E5FC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r1, #0x13
	adds r6, r0, #0
	lsls r1, r1, #4
	adds r1, r6, r1
	movs r2, #6
	bl ov113_021E6238
	movs r1, #1
	lsls r1, r1, #8
	adds r0, r6, #0
	adds r1, r6, r1
	movs r2, #2
	bl ov113_021E6238
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
	bl ov113_021E629C
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
	bl ov113_021E629C
	ldr r0, [r6, #0x44]
	ldr r2, [r6, #0x50]
	movs r1, #3
	bl FUN_0200BB6C
	adds r0, r6, #0
	ldr r1, [r6, #0x50]
	adds r0, #0x88
	movs r2, #4
	movs r3, #0x3c
	bl ov113_021E629C
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
	bl ov113_021E629C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov113_021E5FC0

	thumb_func_start ov113_021E6084
ov113_021E6084: @ 0x021E6084
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	movs r1, #5
	adds r5, r0, #0
	lsls r1, r1, #6
	adds r1, r5, r1
	movs r2, #6
	bl ov113_021E6238
	movs r1, #0x11
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r1, r5, r1
	movs r2, #2
	bl ov113_021E6238
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
	bl ov113_021E6AE8
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
	bl ov113_021E629C
	b _021E612A
_021E6118:
	adds r3, r6, #0
	subs r3, #0xa8
	lsls r3, r3, #0x10
	ldr r0, [sp, #0xc]
	ldr r1, [r5, #0x50]
	movs r2, #0x30
	lsrs r3, r3, #0x10
	bl ov113_021E629C
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
	thumb_func_end ov113_021E6084

	thumb_func_start ov113_021E613C
ov113_021E613C: @ 0x021E613C
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
	bl ov113_021E6238
	movs r1, #0x12
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r1, r5, r1
	movs r2, #2
	bl ov113_021E6238
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
	bl ov113_021E6274
	b _021E61DC
_021E61D0:
	ldr r1, [r5, #0x50]
	adds r0, r7, #0
	movs r2, #4
	movs r3, #0x18
	bl ov113_021E629C
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
	bl ov113_021E629C
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
	thumb_func_end ov113_021E613C

	thumb_func_start ov113_021E6238
ov113_021E6238: @ 0x021E6238
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
	thumb_func_end ov113_021E6238

	thumb_func_start ov113_021E6274
ov113_021E6274: @ 0x021E6274
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
	thumb_func_end ov113_021E6274

	thumb_func_start ov113_021E629C
ov113_021E629C: @ 0x021E629C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r2, #0
	str r3, [sp]
	movs r2, #0
	adds r3, r4, #0
	bl ov113_021E6274
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov113_021E629C

	thumb_func_start ov113_021E62B0
ov113_021E62B0: @ 0x021E62B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	beq _021E62C0
	bl FUN_0200D034
_021E62C0:
	bl FUN_0202061C
	ldr r0, [r4, #0x40]
	bl FUN_0201EEB4
	ldr r3, _021E62D8 @ =0x027E0000
	ldr r1, _021E62DC @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E62D8: .4byte 0x027E0000
_021E62DC: .4byte 0x00003FF8
	thumb_func_end ov113_021E62B0

	thumb_func_start ov113_021E62E0
ov113_021E62E0: @ 0x021E62E0
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
	thumb_func_end ov113_021E62E0

	thumb_func_start ov113_021E6300
ov113_021E6300: @ 0x021E6300
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	adds r4, r0, #0
	bl ov113_021E62E0
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
	thumb_func_end ov113_021E6300

	thumb_func_start ov113_021E6490
ov113_021E6490: @ 0x021E6490
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x40]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x40]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0x40]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x40]
	movs r1, #7
	bl FUN_0201BB4C
	ldr r0, [r4, #0x40]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [r4, #0x40]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [r4, #0x40]
	bl FUN_0201AB0C
	ldr r2, _021E64D8 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_021E64D8: .4byte 0x04000304
	thumb_func_end ov113_021E6490

	thumb_func_start ov113_021E64DC
ov113_021E64DC: @ 0x021E64DC
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
	thumb_func_end ov113_021E64DC

	thumb_func_start ov113_021E650C
ov113_021E650C: @ 0x021E650C
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
	bl ov113_021E64DC
	movs r0, #5
	lsls r0, r0, #6
	ldr r3, [r5]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0xc
	bl ov113_021E64DC
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r3, [r5]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0xe
	bl ov113_021E64DC
	movs r0, #1
	lsls r0, r0, #8
	ldr r3, [r5]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0xb
	bl ov113_021E64DC
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r3, [r5]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0xd
	bl ov113_021E64DC
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r3, [r5]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0xf
	bl ov113_021E64DC
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
	thumb_func_end ov113_021E650C

	thumb_func_start ov113_021E663C
ov113_021E663C: @ 0x021E663C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #1
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov113_021E663C

	thumb_func_start ov113_021E6680
ov113_021E6680: @ 0x021E6680
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
	thumb_func_end ov113_021E6680

	thumb_func_start ov113_021E66E4
ov113_021E66E4: @ 0x021E66E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl FUN_02026380
	ldr r0, [r4, #0x58]
	bl FUN_02026380
	ldr r0, [r4, #0x54]
	bl FUN_02026380
	ldr r0, [r4, #0x50]
	bl FUN_02026380
	ldr r0, [r4, #0x4c]
	bl FUN_02026380
	ldr r0, [r4, #0x48]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x44]
	bl FUN_0200BB44
	movs r0, #4
	bl FUN_02002DB4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov113_021E66E4

	thumb_func_start ov113_021E671C
ov113_021E671C: @ 0x021E671C
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
	thumb_func_end ov113_021E671C

	thumb_func_start ov113_021E6754
ov113_021E6754: @ 0x021E6754
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	movs r4, #0
	adds r5, #0x68
_021E675E:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #4
	blt _021E675E
	adds r6, #0xa8
	ldr r0, [r6]
	bl FUN_02016624
	pop {r4, r5, r6, pc}
	thumb_func_end ov113_021E6754

	thumb_func_start ov113_021E677C
ov113_021E677C: @ 0x021E677C
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
	thumb_func_end ov113_021E677C

	thumb_func_start ov113_021E6930
ov113_021E6930: @ 0x021E6930
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, #0xac
	adds r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D998
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xac
	adds r1, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D0E4
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xb4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xb0
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	bl FUN_0200770C
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200D108
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xac
	str r1, [r0]
	bl FUN_020205AC
	ldr r0, [r4]
	bl FUN_0200B2E0
	pop {r4, pc}
	thumb_func_end ov113_021E6930

	thumb_func_start ov113_021E6988
ov113_021E6988: @ 0x021E6988
	push {r4, lr}
	adds r4, r0, #0
	bl ov113_021E677C
	adds r0, r4, #0
	bl ov113_021E69CC
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	pop {r4, pc}
	thumb_func_end ov113_021E6988

	thumb_func_start ov113_021E69A8
ov113_021E69A8: @ 0x021E69A8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	bl ov113_021E6AB0
	adds r0, r4, #0
	bl ov113_021E6930
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov113_021E69A8

	thumb_func_start ov113_021E69CC
ov113_021E69CC: @ 0x021E69CC
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
	thumb_func_end ov113_021E69CC

	thumb_func_start ov113_021E6AB0
ov113_021E6AB0: @ 0x021E6AB0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #0
_021E6AB8:
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0
	beq _021E6AC6
	bl FUN_0200D9DC
_021E6AC6:
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #0xe
	blt _021E6AB8
	movs r4, #0
_021E6AD0:
	adds r0, r5, #0
	adds r0, #0xb8
	ldr r0, [r0]
	cmp r0, #0
	beq _021E6ADE
	bl FUN_02024758
_021E6ADE:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _021E6AD0
	pop {r4, r5, r6, pc}
	thumb_func_end ov113_021E6AB0

	thumb_func_start ov113_021E6AE8
ov113_021E6AE8: @ 0x021E6AE8
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
	thumb_func_end ov113_021E6AE8

	thumb_func_start ov113_021E6B1C
ov113_021E6B1C: @ 0x021E6B1C
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
	thumb_func_end ov113_021E6B1C

	.rodata

_021E6B6C:
	.byte 0x00, 0x0F, 0x07, 0x00
	.byte 0x00, 0x0F, 0x01, 0x00, 0x06, 0x00, 0x07, 0x00, 0x05, 0x00, 0x04, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x49, 0x00, 0xA0, 0xC0, 0xC0, 0x00, 0x10, 0x25, 0xDC, 0xF4, 0x78, 0x8D, 0xDC, 0xF4, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x46, 0x01, 0x47, 0x01, 0x48, 0x02, 0x49, 0x03, 0x4A, 0x04, 0x4B, 0x04, 0x4C, 0x05, 0x4D, 0x06
	.byte 0xCE, 0x07, 0x51, 0x07, 0x52, 0x08, 0x53, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x19, 0x15, 0x06, 0x02, 0x0C, 0xE1, 0x01, 0x05, 0x02, 0x03, 0x18, 0x14, 0x0C, 0x01, 0x00
	.byte 0x01, 0x02, 0x01, 0x18, 0x14, 0x0C, 0x01, 0x00, 0x01, 0x1C, 0x09, 0x03, 0x02, 0x0C, 0xED, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xEC, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEC, 0x00, 0x84, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x021E6D70
