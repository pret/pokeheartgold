
	thumb_func_start ov109_021E5900
ov109_021E5900: @ 0x021E5900
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
	bl ov109_021E5A20
	movs r2, #2
	movs r0, #3
	movs r1, #0x60
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r1, #0x7d
	adds r0, r6, #0
	lsls r1, r1, #2
	movs r2, #0x60
	bl FUN_02007280
	movs r2, #0x7d
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x60
	str r0, [r4]
	adds r0, r6, #0
	bl FUN_020072A4
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl ov109_021E5A70
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _021E5964
_021E5954:
	bl FUN_02007290
	bl ov109_021E5B60
	cmp r0, #0
	beq _021E5964
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E5964:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov109_021E5900

	thumb_func_start ov109_021E5968
ov109_021E5968: @ 0x021E5968
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #9
	bhi _021E59E4
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5984: @ jump table
	.2byte _021E5998 - _021E5984 - 2 @ case 0
	.2byte _021E59A0 - _021E5984 - 2 @ case 1
	.2byte _021E59A8 - _021E5984 - 2 @ case 2
	.2byte _021E59B0 - _021E5984 - 2 @ case 3
	.2byte _021E59B8 - _021E5984 - 2 @ case 4
	.2byte _021E59C0 - _021E5984 - 2 @ case 5
	.2byte _021E59C8 - _021E5984 - 2 @ case 6
	.2byte _021E59D0 - _021E5984 - 2 @ case 7
	.2byte _021E59D8 - _021E5984 - 2 @ case 8
	.2byte _021E59E0 - _021E5984 - 2 @ case 9
_021E5998:
	bl ov109_021E5BAC
	str r0, [r4]
	b _021E59E4
_021E59A0:
	bl ov109_021E5C40
	str r0, [r4]
	b _021E59E4
_021E59A8:
	bl ov109_021E5C48
	str r0, [r4]
	b _021E59E4
_021E59B0:
	bl ov109_021E5C68
	str r0, [r4]
	b _021E59E4
_021E59B8:
	bl ov109_021E5C88
	str r0, [r4]
	b _021E59E4
_021E59C0:
	bl ov109_021E5C90
	str r0, [r4]
	b _021E59E4
_021E59C8:
	bl ov109_021E5C98
	str r0, [r4]
	b _021E59E4
_021E59D0:
	bl ov109_021E5CAC
	str r0, [r4]
	b _021E59E4
_021E59D8:
	bl ov109_021E5BF4
	str r0, [r4]
	b _021E59E4
_021E59E0:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E59E4:
	adds r5, #0x94
	ldr r0, [r5]
	bl FUN_0200D020
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov109_021E5968

	thumb_func_start ov109_021E59F0
ov109_021E59F0: @ 0x021E59F0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov109_021E5B98
	cmp r0, #0
	bne _021E5A06
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E5A06:
	bl ov109_021E5A20
	adds r0, r4, #0
	bl ov109_021E5B40
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x60
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov109_021E59F0

	thumb_func_start ov109_021E5A20
ov109_021E5A20: @ 0x021E5A20
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
	ldr r0, _021E5A68 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5A6C @ =0x04001000
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
_021E5A68: .4byte 0xFFFFE0FF
_021E5A6C: .4byte 0x04001000
	thumb_func_end ov109_021E5A20

	thumb_func_start ov109_021E5A70
ov109_021E5A70: @ 0x021E5A70
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #8]
	bl FUN_020183F0
	str r0, [r5, #0xc]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_02028EA8
	adds r4, r0, #0
	bl FUN_0202AD3C
	adds r1, r5, #0
	adds r1, #0x22
	strb r0, [r1]
	adds r0, r4, #0
	bl FUN_0202ADCC
	adds r1, r5, #0
	adds r1, #0x23
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	movs r1, #0xc
	ldrb r6, [r0, #2]
	adds r0, r6, #0
	blx FUN_020F2998
	ldr r0, _021E5B3C @ =0x021E7890
	ldrb r4, [r0, r1]
	adds r0, r6, #0
	movs r1, #0xc
	blx FUN_020F2998
	strb r0, [r5, #0x19]
	lsrs r2, r4, #0x1f
	lsls r1, r4, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	strb r0, [r5, #0x1b]
	lsrs r0, r4, #2
	strb r0, [r5, #0x1c]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_0202FA64
	movs r1, #0x7b
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	ldr r1, [r5]
	bl FUN_0202FB38
	adds r1, r5, #0
	adds r1, #0xc8
	str r0, [r1]
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202FAB0
	adds r1, r5, #0
	adds r1, #0xc4
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xc4
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc5
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	movs r1, #0xc
	blx FUN_020F2998
	strb r0, [r5, #0x1a]
	adds r0, r5, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	movs r1, #0xc
	blx FUN_020F2998
	cmp r1, #0
	beq _021E5B26
	ldrb r0, [r5, #0x1a]
	adds r0, r0, #1
	strb r0, [r5, #0x1a]
_021E5B26:
	adds r0, r5, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E5B34
	movs r0, #1
	strb r0, [r5, #0x1a]
_021E5B34:
	adds r0, r5, #0
	bl ov109_021E5D08
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E5B3C: .4byte 0x021E7890
	thumb_func_end ov109_021E5A70

	thumb_func_start ov109_021E5B40
ov109_021E5B40: @ 0x021E5B40
	push {r4, lr}
	adds r4, r0, #0
	bl ov109_021E5D5C
	adds r0, r4, #0
	adds r0, #0xc8
	ldr r0, [r0]
	bl FUN_0201AB0C
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0xc]
	ldr r0, [r0, #8]
	bl FUN_02018410
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov109_021E5B40

	thumb_func_start ov109_021E5B60
ov109_021E5B60: @ 0x021E5B60
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021E5B70
	cmp r1, #1
	beq _021E5B7C
	b _021E5B92
_021E5B70:
	bl ov109_021E5CB4
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021E5B92
_021E5B7C:
	bl ov109_021E5EC8
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	movs r0, #0
	str r0, [r4, #4]
	movs r0, #1
	pop {r4, pc}
_021E5B92:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov109_021E5B60

	thumb_func_start ov109_021E5B98
ov109_021E5B98: @ 0x021E5B98
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02021238
	adds r0, r4, #0
	bl ov109_021E5CE4
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov109_021E5B98

	thumb_func_start ov109_021E5BAC
ov109_021E5BAC: @ 0x021E5BAC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E5BBE
	cmp r0, #1
	beq _021E5BDC
	b _021E5BEE
_021E5BBE:
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
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021E5BEE
_021E5BDC:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5BEE
	movs r0, #0
	str r0, [r4, #4]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_021E5BEE:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov109_021E5BAC

	thumb_func_start ov109_021E5BF4
ov109_021E5BF4: @ 0x021E5BF4
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E5C06
	cmp r0, #1
	beq _021E5C26
	b _021E5C38
_021E5C06:
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
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021E5C38
_021E5C26:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5C38
	movs r0, #0
	str r0, [r4, #4]
	add sp, #0xc
	movs r0, #9
	pop {r3, r4, pc}
_021E5C38:
	movs r0, #8
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov109_021E5BF4

	thumb_func_start ov109_021E5C40
ov109_021E5C40: @ 0x021E5C40
	ldr r3, _021E5C44 @ =ov109_021E5F10
	bx r3
	.align 2, 0
_021E5C44: .4byte ov109_021E5F10
	thumb_func_end ov109_021E5C40

	thumb_func_start ov109_021E5C48
ov109_021E5C48: @ 0x021E5C48
	push {r4, lr}
	adds r4, r0, #0
	bl ov109_021E656C
	cmp r0, #0
	bne _021E5C58
	movs r0, #2
	pop {r4, pc}
_021E5C58:
	adds r4, #0x20
	ldrb r0, [r4]
	cmp r0, #1
	bne _021E5C64
	movs r0, #5
	pop {r4, pc}
_021E5C64:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov109_021E5C48

	thumb_func_start ov109_021E5C68
ov109_021E5C68: @ 0x021E5C68
	push {r4, lr}
	adds r4, r0, #0
	bl ov109_021E66C4
	cmp r0, #0
	bne _021E5C78
	movs r0, #3
	pop {r4, pc}
_021E5C78:
	adds r4, #0x20
	ldrb r0, [r4]
	cmp r0, #1
	bne _021E5C84
	movs r0, #5
	pop {r4, pc}
_021E5C84:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov109_021E5C68

	thumb_func_start ov109_021E5C88
ov109_021E5C88: @ 0x021E5C88
	ldr r3, _021E5C8C @ =ov109_021E681C
	bx r3
	.align 2, 0
_021E5C8C: .4byte ov109_021E681C
	thumb_func_end ov109_021E5C88

	thumb_func_start ov109_021E5C90
ov109_021E5C90: @ 0x021E5C90
	ldr r3, _021E5C94 @ =ov109_021E61BC
	bx r3
	.align 2, 0
_021E5C94: .4byte ov109_021E61BC
	thumb_func_end ov109_021E5C90

	thumb_func_start ov109_021E5C98
ov109_021E5C98: @ 0x021E5C98
	push {r3, lr}
	bl ov109_021E61DC
	cmp r0, #0
	beq _021E5CA6
	movs r0, #1
	pop {r3, pc}
_021E5CA6:
	movs r0, #6
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov109_021E5C98

	thumb_func_start ov109_021E5CAC
ov109_021E5CAC: @ 0x021E5CAC
	ldr r3, _021E5CB0 @ =ov109_021E682C
	bx r3
	.align 2, 0
_021E5CB0: .4byte ov109_021E682C
	thumb_func_end ov109_021E5CAC

	thumb_func_start ov109_021E5CB4
ov109_021E5CB4: @ 0x021E5CB4
	push {r4, lr}
	adds r4, r0, #0
	bl ov109_021E694C
	adds r0, r4, #0
	bl ov109_021E6B5C
	adds r0, r4, #0
	bl ov109_021E6C9C
	adds r0, r4, #0
	bl ov109_021E6D84
	adds r0, r4, #0
	bl ov109_021E6E9C
	ldr r0, _021E5CE0 @ =ov109_021E685C
	adds r1, r4, #0
	bl FUN_0201A0FC
	pop {r4, pc}
	nop
_021E5CE0: .4byte ov109_021E685C
	thumb_func_end ov109_021E5CB4

	thumb_func_start ov109_021E5CE4
ov109_021E5CE4: @ 0x021E5CE4
	push {r4, lr}
	adds r4, r0, #0
	bl ov109_021E6EC0
	adds r0, r4, #0
	bl ov109_021E6DBC
	adds r0, r4, #0
	bl ov109_021E6D2C
	adds r0, r4, #0
	bl ov109_021E6C7C
	adds r0, r4, #0
	bl ov109_021E6AFC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov109_021E5CE4

	thumb_func_start ov109_021E5D08
ov109_021E5D08: @ 0x021E5D08
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0xc4
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc5
	strb r1, [r0]
	adds r0, r4, #0
	movs r2, #0x12
	adds r0, #0xcc
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020D4994
	adds r0, r4, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	movs r2, #0
	cmp r0, #0
	bls _021E5D5A
	adds r0, r4, #0
	adds r0, #0xcc
	movs r5, #0x84
_021E5D36:
	lsls r3, r2, #3
	adds r1, r0, r3
	strb r2, [r0, r3]
	adds r3, r4, #0
	adds r3, #0xc8
	ldr r6, [r3]
	adds r3, r2, #0
	muls r3, r5, r3
	adds r3, r6, r3
	str r3, [r1, #4]
	adds r1, r2, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	adds r1, r4, #0
	adds r1, #0xc5
	ldrb r1, [r1]
	cmp r2, r1
	blo _021E5D36
_021E5D5A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov109_021E5D08

	thumb_func_start ov109_021E5D5C
ov109_021E5D5C: @ 0x021E5D5C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	movs r4, #0
	cmp r0, #0
	bls _021E5D8E
	movs r6, #0x7b
	lsls r6, r6, #2
_021E5D6E:
	lsls r1, r4, #3
	adds r1, r5, r1
	adds r1, #0xd0
	ldr r0, [r5, r6]
	ldr r1, [r1]
	adds r2, r4, #0
	bl FUN_0202FAF0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	cmp r4, r0
	blo _021E5D6E
_021E5D8E:
	adds r0, r5, #0
	adds r0, #0xc4
	ldrb r0, [r0]
	cmp r4, r0
	bhs _021E5DB4
	movs r6, #0x7b
	lsls r6, r6, #2
_021E5D9C:
	ldr r0, [r5, r6]
	adds r1, r4, #0
	bl FUN_0202FADC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xc4
	ldrb r0, [r0]
	cmp r4, r0
	blo _021E5D9C
_021E5DB4:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov109_021E5D5C

	thumb_func_start ov109_021E5DB8
ov109_021E5DB8: @ 0x021E5DB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r5, #0
	lsls r6, r1, #3
	adds r4, #0xcc
	adds r7, r2, #0
	adds r0, r4, r6
	add r1, sp, #0
	movs r2, #8
	blx FUN_020D4A50
	adds r5, #0xcc
	lsls r7, r7, #3
	adds r0, r5, r7
	adds r1, r4, r6
	movs r2, #8
	blx FUN_020D4A50
	add r0, sp, #0
	adds r1, r5, r7
	movs r2, #8
	blx FUN_020D4A50
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov109_021E5DB8

	thumb_func_start ov109_021E5DEC
ov109_021E5DEC: @ 0x021E5DEC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	adds r7, r1, #0
	subs r1, r0, #1
	adds r0, r5, #0
	adds r0, #0xc5
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	cmp r7, r0
	bhs _021E5E32
	adds r4, r7, #0
	cmp r7, r0
	bhs _021E5E32
	adds r6, r5, #0
	adds r6, #0xcc
_021E5E12:
	adds r0, r4, #1
	lsls r0, r0, #3
	lsls r1, r4, #3
	adds r0, r6, r0
	adds r1, r6, r1
	movs r2, #8
	blx FUN_020D4A50
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	cmp r4, r0
	blo _021E5E12
_021E5E32:
	adds r1, r5, #0
	adds r1, #0xcc
	lsls r0, r0, #3
	adds r0, r1, r0
	movs r1, #0
	movs r2, #8
	blx FUN_020D4994
	adds r0, r5, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	movs r1, #0xc
	blx FUN_020F2998
	strb r0, [r5, #0x1a]
	adds r0, r5, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	movs r1, #0xc
	blx FUN_020F2998
	cmp r1, #0
	beq _021E5E66
	ldrb r0, [r5, #0x1a]
	adds r0, r0, #1
	strb r0, [r5, #0x1a]
_021E5E66:
	adds r0, r5, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E5E74
	movs r0, #1
	strb r0, [r5, #0x1a]
_021E5E74:
	adds r0, r5, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	cmp r7, r0
	blo _021E5EC0
	cmp r0, #0
	bne _021E5E8E
	movs r0, #3
	strb r0, [r5, #0x1b]
	strb r0, [r5, #0x1c]
	movs r0, #0
	strb r0, [r5, #0x19]
	pop {r3, r4, r5, r6, r7, pc}
_021E5E8E:
	cmp r7, #0
	beq _021E5E98
	subs r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_021E5E98:
	adds r0, r7, #0
	movs r1, #0xc
	blx FUN_020F2998
	strb r0, [r5, #0x19]
	adds r0, r7, #0
	movs r1, #0xc
	blx FUN_020F2998
	ldr r0, _021E5EC4 @ =0x021E7890
	ldrb r3, [r0, r1]
	movs r0, #0x1e
	lsrs r2, r3, #0x1f
	lsls r1, r3, #0x1e
	subs r1, r1, r2
	rors r1, r0
	adds r0, r2, r1
	strb r0, [r5, #0x1b]
	lsrs r0, r3, #2
	strb r0, [r5, #0x1c]
_021E5EC0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5EC4: .4byte 0x021E7890
	thumb_func_end ov109_021E5DEC

	thumb_func_start ov109_021E5EC8
ov109_021E5EC8: @ 0x021E5EC8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r3, [r4, #0x19]
	movs r1, #3
	adds r2, r1, #0
	bl ov109_021E70C4
	adds r0, r4, #0
	bl ov109_021E7524
	adds r0, r4, #0
	movs r1, #0
	bl ov109_021E7388
	movs r1, #0
	adds r0, r4, #0
	movs r2, #1
	adds r3, r1, #0
	bl ov109_021E73F8
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	adds r0, r4, #0
	movs r3, #1
	bl ov109_021E7474
	ldr r0, [r4, #0x14]
	movs r1, #3
	bl FUN_0201EFBC
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl FUN_0201EFBC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov109_021E5EC8

	thumb_func_start ov109_021E5F10
ov109_021E5F10: @ 0x021E5F10
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	ldrb r1, [r4, #0x18]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	beq _021E5F28
	add sp, #4
	movs r0, #1
	pop {r3, r4, pc}
_021E5F28:
	add r1, sp, #0
	bl ov109_021E5FFC
	ldr r1, [sp]
	cmp r1, #0
	bne _021E5F3A
	adds r0, r4, #0
	bl ov109_021E6058
_021E5F3A:
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov109_021E5F10

	thumb_func_start ov109_021E5F40
ov109_021E5F40: @ 0x021E5F40
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	cmp r1, #0xc
	beq _021E5F52
	cmp r1, #0xd
	beq _021E5F6A
	cmp r1, #0xe
	beq _021E5F86
	b _021E5FA6
_021E5F52:
	ldr r0, [r5, #0x10]
	movs r1, #0
	strb r1, [r0, #1]
	ldr r0, _021E5FF4 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #1
	bl ov109_021E7388
	movs r0, #8
	pop {r3, r4, r5, pc}
_021E5F6A:
	ldrb r1, [r5, #0x19]
	cmp r1, #0
	bne _021E5F74
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5F74:
	movs r1, #2
	bl ov109_021E7584
	movs r0, #0x92
	lsls r0, r0, #4
	bl FUN_0200604C
	movs r0, #2
	pop {r3, r4, r5, pc}
_021E5F86:
	ldrb r1, [r5, #0x1a]
	ldrb r2, [r5, #0x19]
	subs r1, r1, #1
	cmp r2, r1
	bne _021E5F94
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5F94:
	movs r1, #3
	bl ov109_021E7584
	movs r0, #0x92
	lsls r0, r0, #4
	bl FUN_0200604C
	movs r0, #3
	pop {r3, r4, r5, pc}
_021E5FA6:
	ldr r0, _021E5FF8 @ =_021E7884
	ldrb r2, [r0, r1]
	ldrb r1, [r5, #0x19]
	movs r0, #0xc
	muls r0, r1, r0
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	cmp r4, r0
	blo _021E5FC4
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5FC4:
	strb r4, [r5, #0x1f]
	ldrb r0, [r5, #0x1b]
	strb r0, [r5, #0x1d]
	ldrb r0, [r5, #0x1c]
	strb r0, [r5, #0x1e]
	ldr r0, _021E5FF4 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov109_021E75C8
	lsls r1, r4, #3
	adds r1, r5, r1
	adds r1, #0xd0
	ldr r1, [r1]
	adds r0, r5, #0
	bl ov109_021E7248
	adds r0, r5, #0
	movs r1, #1
	bl ov109_021E74D4
	movs r0, #4
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5FF4: .4byte 0x000005DC
_021E5FF8: .4byte _021E7884
	thumb_func_end ov109_021E5F40

	thumb_func_start ov109_021E5FFC
ov109_021E5FFC: @ 0x021E5FFC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _021E6050 @ =0x021E7A18
	adds r6, r1, #0
	bl FUN_02025224
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _021E6016
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E6016:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _021E6022
	adds r0, r5, #0
	bl ov109_021E75B4
_021E6022:
	movs r3, #1
	str r3, [r6]
	cmp r4, #0xc
	bhs _021E6044
	movs r0, #3
	ands r0, r4
	strb r0, [r5, #0x1b]
	lsrs r0, r4, #2
	strb r0, [r5, #0x1c]
	ldrb r1, [r5, #0x1b]
	ldrb r2, [r5, #0x1c]
	adds r0, r5, #0
	bl ov109_021E7474
	ldr r0, _021E6054 @ =0x000005DC
	bl FUN_0200604C
_021E6044:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov109_021E5F40
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E6050: .4byte 0x021E7A18
_021E6054: .4byte 0x000005DC
	thumb_func_end ov109_021E5FFC

	thumb_func_start ov109_021E6058
ov109_021E6058: @ 0x021E6058
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #1
	bne _021E6070
	ldr r1, _021E61B4 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #0xf3
	tst r1, r2
	beq _021E6070
	bl ov109_021E75B4
_021E6070:
	ldr r0, _021E61B4 @ =0x021D110C
	movs r1, #1
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021E6096
	ldrb r0, [r4, #0x1c]
	ldrb r1, [r4, #0x1b]
	cmp r0, #3
	blo _021E6086
	movs r1, #0xc
	b _021E608E
_021E6086:
	lsls r0, r0, #2
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_021E608E:
	adds r0, r4, #0
	bl ov109_021E5F40
	pop {r4, pc}
_021E6096:
	movs r1, #2
	tst r1, r0
	beq _021E60A6
	adds r0, r4, #0
	movs r1, #0xc
	bl ov109_021E5F40
	pop {r4, pc}
_021E60A6:
	movs r1, #0x20
	tst r1, r0
	beq _021E60F6
	ldrb r0, [r4, #0x1c]
	ldrb r1, [r4, #0x1b]
	cmp r0, #3
	blo _021E60B8
	movs r0, #0xc
	b _021E60C0
_021E60B8:
	lsls r0, r0, #2
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_021E60C0:
	cmp r0, #0xc
	bne _021E60C8
	movs r0, #1
	pop {r4, pc}
_021E60C8:
	cmp r1, #0
	beq _021E60E6
	ldr r0, _021E61B8 @ =0x000005DC
	bl FUN_0200604C
	ldrb r0, [r4, #0x1b]
	movs r3, #1
	subs r0, r0, #1
	strb r0, [r4, #0x1b]
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	adds r0, r4, #0
	bl ov109_021E7474
	b _021E61B0
_021E60E6:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021E61B0
	adds r0, r4, #0
	movs r1, #0xd
	bl ov109_021E5F40
	pop {r4, pc}
_021E60F6:
	movs r1, #0x10
	tst r1, r0
	beq _021E614A
	ldrb r0, [r4, #0x1c]
	ldrb r1, [r4, #0x1b]
	cmp r0, #3
	blo _021E6108
	movs r0, #0xc
	b _021E6110
_021E6108:
	lsls r0, r0, #2
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_021E6110:
	cmp r0, #0xc
	bne _021E6118
	movs r0, #1
	pop {r4, pc}
_021E6118:
	cmp r1, #3
	bhs _021E6136
	ldr r0, _021E61B8 @ =0x000005DC
	bl FUN_0200604C
	ldrb r0, [r4, #0x1b]
	movs r3, #1
	adds r0, r0, #1
	strb r0, [r4, #0x1b]
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	adds r0, r4, #0
	bl ov109_021E7474
	b _021E61B0
_021E6136:
	ldrb r0, [r4, #0x1a]
	ldrb r1, [r4, #0x19]
	subs r0, r0, #1
	cmp r1, r0
	bge _021E61B0
	adds r0, r4, #0
	movs r1, #0xe
	bl ov109_021E5F40
	pop {r4, pc}
_021E614A:
	movs r1, #0x40
	tst r1, r0
	beq _021E6186
	ldrb r0, [r4, #0x1c]
	cmp r0, #4
	bne _021E6160
	ldrb r0, [r4, #0x1b]
	cmp r0, #3
	bhs _021E6160
	movs r0, #3
	strb r0, [r4, #0x1b]
_021E6160:
	ldr r0, _021E61B8 @ =0x000005DC
	bl FUN_0200604C
	ldrb r0, [r4, #0x1c]
	movs r3, #1
	adds r0, r0, #3
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	strb r0, [r4, #0x1c]
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	adds r0, r4, #0
	bl ov109_021E7474
	b _021E61B0
_021E6186:
	movs r1, #0x80
	tst r0, r1
	beq _021E61B0
	ldr r0, _021E61B8 @ =0x000005DC
	bl FUN_0200604C
	ldrb r0, [r4, #0x1c]
	movs r3, #1
	adds r0, r0, #1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	strb r0, [r4, #0x1c]
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	adds r0, r4, #0
	bl ov109_021E7474
_021E61B0:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_021E61B4: .4byte 0x021D110C
_021E61B8: .4byte 0x000005DC
	thumb_func_end ov109_021E6058

	thumb_func_start ov109_021E61BC
ov109_021E61BC: @ 0x021E61BC
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	add r1, sp, #0
	adds r4, r0, #0
	bl ov109_021E638C
	ldr r1, [sp]
	cmp r1, #0
	bne _021E61D8
	adds r0, r4, #0
	bl ov109_021E63E8
_021E61D8:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov109_021E61BC

	thumb_func_start ov109_021E61DC
ov109_021E61DC: @ 0x021E61DC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #8]
	cmp r1, #0
	beq _021E61EC
	cmp r1, #1
	beq _021E6220
	b _021E624C
_021E61EC:
	ldrh r2, [r4, #0xa]
	adds r1, r2, #1
	strh r1, [r4, #0xa]
	cmp r2, #0xf
	bhs _021E61FA
	movs r0, #0
	pop {r4, pc}
_021E61FA:
	ldrb r3, [r4, #0x19]
	movs r1, #3
	adds r2, r1, #0
	bl ov109_021E70C4
	adds r3, r4, #0
	adds r3, #0x22
	ldrb r3, [r3]
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0
	bl ov109_021E73F8
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	b _021E6282
_021E6220:
	ldrh r1, [r4, #0xa]
	adds r0, r1, #1
	strh r0, [r4, #0xa]
	cmp r1, #0x1e
	bhs _021E622E
	movs r0, #0
	pop {r4, pc}
_021E622E:
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	bl FUN_02020094
	cmp r0, #0
	beq _021E6240
	movs r0, #0
	pop {r4, pc}
_021E6240:
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	b _021E6282
_021E624C:
	movs r1, #0
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, _021E6288 @ =0x000005DC
	bl FUN_0200604C
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	adds r0, r4, #0
	movs r3, #1
	bl ov109_021E7474
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov109_021E73F8
	ldr r0, [r4, #0x14]
	movs r1, #3
	bl FUN_0201EFBC
	movs r0, #0
	strh r0, [r4, #0xa]
	strh r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021E6282:
	movs r0, #0
	pop {r4, pc}
	nop
_021E6288: .4byte 0x000005DC
	thumb_func_end ov109_021E61DC

	thumb_func_start ov109_021E628C
ov109_021E628C: @ 0x021E628C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	cmp r1, #0xc
	beq _021E629E
	cmp r1, #0xd
	beq _021E62D0
	cmp r1, #0xe
	beq _021E62EC
	b _021E630C
_021E629E:
	ldr r0, _021E6384 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0
	bl ov109_021E7248
	adds r0, r5, #0
	movs r1, #0
	bl ov109_021E74D4
	adds r0, r5, #0
	bl ov109_021E77D4
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov109_021E73F8
	movs r0, #0
	adds r5, #0x20
	strb r0, [r5]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E62D0:
	ldrb r1, [r5, #0x19]
	cmp r1, #0
	bne _021E62DA
	movs r0, #5
	pop {r3, r4, r5, pc}
_021E62DA:
	movs r1, #2
	bl ov109_021E7584
	movs r0, #0x92
	lsls r0, r0, #4
	bl FUN_0200604C
	movs r0, #2
	pop {r3, r4, r5, pc}
_021E62EC:
	ldrb r1, [r5, #0x1a]
	ldrb r2, [r5, #0x19]
	subs r1, r1, #1
	cmp r2, r1
	bne _021E62FA
	movs r0, #5
	pop {r3, r4, r5, pc}
_021E62FA:
	movs r1, #3
	bl ov109_021E7584
	movs r0, #0x92
	lsls r0, r0, #4
	bl FUN_0200604C
	movs r0, #3
	pop {r3, r4, r5, pc}
_021E630C:
	ldr r0, _021E6388 @ =_021E7884
	ldrb r2, [r0, r1]
	ldrb r1, [r5, #0x19]
	movs r0, #0xc
	muls r0, r1, r0
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	cmp r4, r0
	blo _021E632A
	movs r0, #5
	pop {r3, r4, r5, pc}
_021E632A:
	ldr r0, _021E6384 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0
	bl ov109_021E74D4
	adds r0, r5, #0
	movs r1, #0
	bl ov109_021E7248
	ldrb r1, [r5, #0x1f]
	cmp r4, r1
	beq _021E636C
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov109_021E5DB8
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov109_021E71BC
	ldrb r1, [r5, #0x1b]
	ldrb r2, [r5, #0x1c]
	adds r0, r5, #0
	movs r3, #0
	bl ov109_021E7474
	movs r0, #0
	strh r0, [r5, #0xa]
	movs r0, #6
	pop {r3, r4, r5, pc}
_021E636C:
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov109_021E73F8
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E6384: .4byte 0x000005DC
_021E6388: .4byte _021E7884
	thumb_func_end ov109_021E628C

	thumb_func_start ov109_021E638C
ov109_021E638C: @ 0x021E638C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _021E63E0 @ =0x021E7A18
	adds r6, r1, #0
	bl FUN_02025224
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _021E63A6
	movs r0, #5
	pop {r4, r5, r6, pc}
_021E63A6:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _021E63B2
	adds r0, r5, #0
	bl ov109_021E75B4
_021E63B2:
	movs r3, #1
	str r3, [r6]
	cmp r4, #0xc
	bhs _021E63D4
	movs r0, #3
	ands r0, r4
	strb r0, [r5, #0x1b]
	lsrs r0, r4, #2
	strb r0, [r5, #0x1c]
	ldrb r1, [r5, #0x1b]
	ldrb r2, [r5, #0x1c]
	adds r0, r5, #0
	bl ov109_021E7474
	ldr r0, _021E63E4 @ =0x000005DC
	bl FUN_0200604C
_021E63D4:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov109_021E628C
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E63E0: .4byte 0x021E7A18
_021E63E4: .4byte 0x000005DC
	thumb_func_end ov109_021E638C

	thumb_func_start ov109_021E63E8
ov109_021E63E8: @ 0x021E63E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #1
	bne _021E6400
	ldr r1, _021E6564 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #0xf3
	tst r1, r2
	beq _021E6400
	bl ov109_021E75B4
_021E6400:
	ldr r0, _021E6564 @ =0x021D110C
	movs r1, #1
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021E6426
	ldrb r0, [r4, #0x1c]
	ldrb r1, [r4, #0x1b]
	cmp r0, #3
	blo _021E6416
	movs r1, #0xc
	b _021E641E
_021E6416:
	lsls r0, r0, #2
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_021E641E:
	adds r0, r4, #0
	bl ov109_021E628C
	pop {r4, pc}
_021E6426:
	movs r1, #2
	tst r1, r0
	beq _021E6436
	adds r0, r4, #0
	movs r1, #0xc
	bl ov109_021E628C
	pop {r4, pc}
_021E6436:
	movs r1, #0x20
	tst r1, r0
	beq _021E6496
	ldrb r0, [r4, #0x1c]
	ldrb r1, [r4, #0x1b]
	cmp r0, #3
	blo _021E6448
	movs r0, #0xc
	b _021E6450
_021E6448:
	lsls r0, r0, #2
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_021E6450:
	cmp r0, #0xc
	bne _021E6458
	movs r0, #1
	pop {r4, pc}
_021E6458:
	cmp r1, #0
	beq _021E6476
	ldr r0, _021E6568 @ =0x000005DC
	bl FUN_0200604C
	ldrb r0, [r4, #0x1b]
	movs r3, #1
	subs r0, r0, #1
	strb r0, [r4, #0x1b]
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	adds r0, r4, #0
	bl ov109_021E7474
	b _021E6560
_021E6476:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021E6560
	adds r0, r1, #3
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	strb r0, [r4, #0x1b]
	adds r0, r4, #0
	movs r1, #0xd
	bl ov109_021E628C
	pop {r4, pc}
_021E6496:
	movs r1, #0x10
	tst r1, r0
	beq _021E64FA
	ldrb r1, [r4, #0x1c]
	ldrb r0, [r4, #0x1b]
	cmp r1, #3
	blo _021E64A8
	movs r1, #0xc
	b _021E64B0
_021E64A8:
	lsls r1, r1, #2
	adds r1, r0, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
_021E64B0:
	cmp r1, #0xc
	bne _021E64B8
	movs r0, #1
	pop {r4, pc}
_021E64B8:
	cmp r0, #3
	bhs _021E64D6
	ldr r0, _021E6568 @ =0x000005DC
	bl FUN_0200604C
	ldrb r0, [r4, #0x1b]
	movs r3, #1
	adds r0, r0, #1
	strb r0, [r4, #0x1b]
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	adds r0, r4, #0
	bl ov109_021E7474
	b _021E6560
_021E64D6:
	ldrb r1, [r4, #0x1a]
	ldrb r2, [r4, #0x19]
	subs r1, r1, #1
	cmp r2, r1
	bge _021E6560
	adds r0, r0, #1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	strb r0, [r4, #0x1b]
	adds r0, r4, #0
	movs r1, #0xe
	bl ov109_021E628C
	pop {r4, pc}
_021E64FA:
	movs r1, #0x40
	tst r1, r0
	beq _021E6536
	ldrb r0, [r4, #0x1c]
	cmp r0, #4
	bne _021E6510
	ldrb r0, [r4, #0x1b]
	cmp r0, #3
	bhs _021E6510
	movs r0, #3
	strb r0, [r4, #0x1b]
_021E6510:
	ldr r0, _021E6568 @ =0x000005DC
	bl FUN_0200604C
	ldrb r0, [r4, #0x1c]
	movs r3, #1
	adds r0, r0, #3
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	strb r0, [r4, #0x1c]
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	adds r0, r4, #0
	bl ov109_021E7474
	b _021E6560
_021E6536:
	movs r1, #0x80
	tst r0, r1
	beq _021E6560
	ldr r0, _021E6568 @ =0x000005DC
	bl FUN_0200604C
	ldrb r0, [r4, #0x1c]
	movs r3, #1
	adds r0, r0, #1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	strb r0, [r4, #0x1c]
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	adds r0, r4, #0
	bl ov109_021E7474
_021E6560:
	movs r0, #5
	pop {r4, pc}
	.align 2, 0
_021E6564: .4byte 0x021D110C
_021E6568: .4byte 0x000005DC
	thumb_func_end ov109_021E63E8

	thumb_func_start ov109_021E656C
ov109_021E656C: @ 0x021E656C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #8]
	cmp r1, #0
	beq _021E6580
	cmp r1, #1
	beq _021E65DC
	cmp r1, #2
	beq _021E6634
	b _021E66BC
_021E6580:
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	movs r3, #0
	bl ov109_021E7474
	adds r0, r4, #0
	movs r1, #0
	bl ov109_021E74D4
	adds r0, r4, #0
	movs r1, #1
	bl ov109_021E68B8
	movs r1, #1
	adds r0, r4, #0
	lsls r1, r1, #0xc
	bl ov109_021E691C
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov109_021E6F7C
	ldrb r3, [r4, #0x19]
	adds r0, r4, #0
	movs r1, #2
	movs r2, #1
	bl ov109_021E70C4
	ldrb r3, [r4, #0x19]
	adds r0, r4, #0
	movs r1, #3
	subs r3, r3, #1
	lsls r3, r3, #0x18
	movs r2, #1
	lsrs r3, r3, #0x18
	bl ov109_021E70C4
	ldrb r1, [r4, #0x18]
	movs r0, #0xf0
	bics r1, r0
	strb r1, [r4, #0x18]
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	b _021E66BC
_021E65DC:
	ldrb r3, [r4, #0x18]
	movs r2, #0xf0
	adds r1, r3, #0
	bics r1, r2
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x1c
	adds r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x18
	orrs r1, r2
	strb r1, [r4, #0x18]
	ldrb r1, [r4, #0x18]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	lsls r2, r1, #2
	ldr r1, _021E66C0 @ =0x021E78DC
	ldr r1, [r1, r2]
	bl ov109_021E691C
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #4
	blo _021E66BC
	adds r0, r4, #0
	movs r1, #2
	movs r2, #1
	bl ov109_021E6F7C
	ldrb r3, [r4, #0x19]
	movs r1, #2
	adds r0, r4, #0
	subs r3, r3, #1
	lsls r3, r3, #0x18
	adds r2, r1, #0
	lsrs r3, r3, #0x18
	bl ov109_021E70C4
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	b _021E66BC
_021E6634:
	ldrb r3, [r4, #0x18]
	movs r2, #0xf0
	adds r1, r3, #0
	bics r1, r2
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x1c
	subs r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x18
	orrs r1, r2
	strb r1, [r4, #0x18]
	ldrb r1, [r4, #0x18]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	lsls r2, r1, #2
	ldr r1, _021E66C0 @ =0x021E78DC
	ldr r1, [r1, r2]
	bl ov109_021E691C
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	bne _021E66BC
	ldrb r3, [r4, #0x19]
	adds r0, r4, #0
	movs r1, #3
	subs r3, r3, #1
	lsls r3, r3, #0x18
	movs r2, #2
	lsrs r3, r3, #0x18
	bl ov109_021E70C4
	adds r0, r4, #0
	movs r1, #0
	bl ov109_021E68B8
	movs r1, #1
	adds r0, r4, #0
	lsls r1, r1, #0xc
	bl ov109_021E691C
	ldrb r0, [r4, #0x19]
	movs r3, #1
	subs r0, r0, #1
	strb r0, [r4, #0x19]
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	adds r0, r4, #0
	bl ov109_021E7474
	adds r0, r4, #0
	bl ov109_021E7524
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _021E66B4
	adds r0, r4, #0
	movs r1, #1
	bl ov109_021E74D4
_021E66B4:
	movs r0, #0
	strh r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021E66BC:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E66C0: .4byte 0x021E78DC
	thumb_func_end ov109_021E656C

	thumb_func_start ov109_021E66C4
ov109_021E66C4: @ 0x021E66C4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #8]
	cmp r1, #0
	beq _021E66D8
	cmp r1, #1
	beq _021E6734
	cmp r1, #2
	beq _021E678C
	b _021E6814
_021E66D8:
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	movs r3, #0
	bl ov109_021E7474
	adds r0, r4, #0
	movs r1, #0
	bl ov109_021E74D4
	adds r0, r4, #0
	movs r1, #1
	bl ov109_021E68B8
	movs r1, #1
	adds r0, r4, #0
	lsls r1, r1, #0xc
	bl ov109_021E691C
	adds r0, r4, #0
	movs r1, #2
	movs r2, #1
	bl ov109_021E6F7C
	movs r1, #2
	ldrb r3, [r4, #0x19]
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov109_021E70C4
	ldrb r3, [r4, #0x19]
	adds r0, r4, #0
	movs r1, #3
	adds r3, r3, #1
	lsls r3, r3, #0x18
	movs r2, #2
	lsrs r3, r3, #0x18
	bl ov109_021E70C4
	ldrb r1, [r4, #0x18]
	movs r0, #0xf0
	bics r1, r0
	strb r1, [r4, #0x18]
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	b _021E6814
_021E6734:
	ldrb r3, [r4, #0x18]
	movs r2, #0xf0
	adds r1, r3, #0
	bics r1, r2
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x1c
	adds r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x18
	orrs r1, r2
	strb r1, [r4, #0x18]
	ldrb r1, [r4, #0x18]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	lsls r2, r1, #2
	ldr r1, _021E6818 @ =0x021E78DC
	ldr r1, [r1, r2]
	bl ov109_021E691C
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #4
	blo _021E6814
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov109_021E6F7C
	ldrb r3, [r4, #0x19]
	adds r0, r4, #0
	movs r1, #2
	adds r3, r3, #1
	lsls r3, r3, #0x18
	movs r2, #1
	lsrs r3, r3, #0x18
	bl ov109_021E70C4
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	b _021E6814
_021E678C:
	ldrb r3, [r4, #0x18]
	movs r2, #0xf0
	adds r1, r3, #0
	bics r1, r2
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x1c
	subs r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x18
	orrs r1, r2
	strb r1, [r4, #0x18]
	ldrb r1, [r4, #0x18]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	lsls r2, r1, #2
	ldr r1, _021E6818 @ =0x021E78DC
	ldr r1, [r1, r2]
	bl ov109_021E691C
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	bne _021E6814
	ldrb r3, [r4, #0x19]
	adds r0, r4, #0
	movs r1, #3
	adds r3, r3, #1
	lsls r3, r3, #0x18
	movs r2, #1
	lsrs r3, r3, #0x18
	bl ov109_021E70C4
	adds r0, r4, #0
	movs r1, #0
	bl ov109_021E68B8
	movs r1, #1
	adds r0, r4, #0
	lsls r1, r1, #0xc
	bl ov109_021E691C
	ldrb r0, [r4, #0x19]
	movs r3, #1
	adds r0, r0, #1
	strb r0, [r4, #0x19]
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	adds r0, r4, #0
	bl ov109_021E7474
	adds r0, r4, #0
	bl ov109_021E7524
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _021E680C
	adds r0, r4, #0
	movs r1, #1
	bl ov109_021E74D4
_021E680C:
	movs r0, #0
	strh r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021E6814:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E6818: .4byte 0x021E78DC
	thumb_func_end ov109_021E66C4

	thumb_func_start ov109_021E681C
ov109_021E681C: @ 0x021E681C
	push {r3, lr}
	bl ov109_021E7640
	cmp r0, #0
	bge _021E6828
	movs r0, #4
_021E6828:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov109_021E681C

	thumb_func_start ov109_021E682C
ov109_021E682C: @ 0x021E682C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #8]
	cmp r1, #0
	beq _021E683C
	cmp r1, #1
	beq _021E6848
	b _021E6858
_021E683C:
	bl ov109_021E76F0
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	b _021E6858
_021E6848:
	bl ov109_021E7748
	cmp r0, #7
	beq _021E6858
	movs r0, #0
	strh r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021E6858:
	movs r0, #7
	pop {r4, pc}
	thumb_func_end ov109_021E682C

	thumb_func_start ov109_021E685C
ov109_021E685C: @ 0x021E685C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #0
	beq _021E686C
	bl FUN_0200D034
_021E686C:
	adds r0, r4, #0
	bl ov109_021E6898
	adds r0, r4, #0
	bl ov109_021E68D4
	blx FUN_020B62EC
	ldr r0, [r4, #0x14]
	bl FUN_0201EEB4
	ldr r3, _021E6890 @ =0x027E0000
	ldr r1, _021E6894 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E6890: .4byte 0x027E0000
_021E6894: .4byte 0x00003FF8
	thumb_func_end ov109_021E685C

	thumb_func_start ov109_021E6898
ov109_021E6898: @ 0x021E6898
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #0x18]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	beq _021E68AE
	lsls r1, r1, #0x1c
	movs r0, #2
	lsrs r1, r1, #0x1f
	bl FUN_0201BC28
_021E68AE:
	ldrb r1, [r4, #0x18]
	movs r0, #4
	bics r1, r0
	strb r1, [r4, #0x18]
	pop {r4, pc}
	thumb_func_end ov109_021E6898

	thumb_func_start ov109_021E68B8
ov109_021E68B8: @ 0x021E68B8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1f
	ldrb r3, [r0, #0x18]
	movs r2, #8
	lsrs r1, r1, #0x1c
	bics r3, r2
	orrs r1, r3
	strb r1, [r0, #0x18]
	ldrb r2, [r0, #0x18]
	movs r1, #4
	orrs r1, r2
	strb r1, [r0, #0x18]
	bx lr
	thumb_func_end ov109_021E68B8

	thumb_func_start ov109_021E68D4
ov109_021E68D4: @ 0x021E68D4
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _021E6916
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #1
	lsls r0, r0, #0xc
	blx FUN_020CCBB0
	str r0, [sp, #0x10]
	movs r0, #0x1f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	blx FUN_020CCBB0
	str r0, [sp, #4]
	movs r0, #0x78
	str r0, [sp]
	ldr r0, [r4, #0x14]
	movs r1, #2
	add r2, sp, #4
	movs r3, #0x80
	bl FUN_0201BE7C
	ldrb r1, [r4, #0x18]
	movs r0, #2
	bics r1, r0
	strb r1, [r4, #0x18]
_021E6916:
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov109_021E68D4

	thumb_func_start ov109_021E691C
ov109_021E691C: @ 0x021E691C
	movs r2, #0x1f
	lsls r2, r2, #4
	str r1, [r0, r2]
	ldrb r2, [r0, #0x18]
	movs r1, #2
	orrs r1, r2
	strb r1, [r0, #0x18]
	bx lr
	thumb_func_end ov109_021E691C

	thumb_func_start ov109_021E692C
ov109_021E692C: @ 0x021E692C
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E6948 @ =0x021E79F0
	add r3, sp, #0
	movs r2, #5
_021E6936:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6936
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E6948: .4byte 0x021E79F0
	thumb_func_end ov109_021E692C

	thumb_func_start ov109_021E694C
ov109_021E694C: @ 0x021E694C
	push {r4, r5, lr}
	sub sp, #0xd4
	adds r4, r0, #0
	bl ov109_021E692C
	ldr r0, [r4]
	bl FUN_0201AC88
	add r3, sp, #0xc4
	ldr r5, _021E6AD4 @ =0x021E78B8
	str r0, [r4, #0x14]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r2, _021E6AD8 @ =0x04000304
	ldr r0, _021E6ADC @ =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r5, _021E6AE0 @ =0x021E7944
	add r3, sp, #0xa8
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
	movs r1, #4
	str r0, [r3]
	ldr r0, [r4, #0x14]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _021E6AE4 @ =0x021E797C
	add r3, sp, #0x8c
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
	ldr r0, [r4, #0x14]
	movs r3, #2
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #7
	bl FUN_0201CAE0
	ldr r5, _021E6AE8 @ =0x021E7998
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
	ldr r0, [r4, #0x14]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #6
	bl FUN_0201CAE0
	ldr r5, _021E6AEC @ =0x021E790C
	add r3, sp, #0x54
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	movs r1, #0
	ldr r0, [r4, #0x14]
	adds r3, r1, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _021E6AF0 @ =0x021E7928
	add r3, sp, #0x38
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #1
	str r0, [r3]
	ldr r0, [r4, #0x14]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _021E6AF4 @ =0x021E7960
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
	ldr r0, [r4, #0x14]
	adds r3, r1, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _021E6AF8 @ =0x021E79B4
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
	ldr r0, [r4, #0x14]
	movs r3, #2
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #3
	bl FUN_0201CAE0
	ldr r3, [r4]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	movs r0, #0
	ldr r3, [r4]
	movs r1, #0x20
	adds r2, r0, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #3
	movs r1, #0x40
	movs r2, #0
	bl FUN_0201C1C4
	movs r2, #0
	ldr r0, [r4, #0x14]
	movs r1, #7
	subs r3, r2, #4
	bl FUN_0201BC8C
	add sp, #0xd4
	pop {r4, r5, pc}
	.align 2, 0
_021E6AD4: .4byte 0x021E78B8
_021E6AD8: .4byte 0x04000304
_021E6ADC: .4byte 0xFFFF7FFF
_021E6AE0: .4byte 0x021E7944
_021E6AE4: .4byte 0x021E797C
_021E6AE8: .4byte 0x021E7998
_021E6AEC: .4byte 0x021E790C
_021E6AF0: .4byte 0x021E7928
_021E6AF4: .4byte 0x021E7960
_021E6AF8: .4byte 0x021E79B4
	thumb_func_end ov109_021E694C

	thumb_func_start ov109_021E6AFC
ov109_021E6AFC: @ 0x021E6AFC
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, [r4, #0x14]
	movs r1, #7
	adds r3, r2, #0
	bl FUN_0201BC8C
	ldr r0, [r4, #0x14]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #7
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	bl FUN_0201AB0C
	ldr r2, _021E6B58 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_021E6B58: .4byte 0x04000304
	thumb_func_end ov109_021E6AFC

	thumb_func_start ov109_021E6B5C
ov109_021E6B5C: @ 0x021E6B5C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0xab
	bl FUN_02007688
	movs r2, #0
	str r2, [sp]
	ldr r1, [r5]
	adds r3, r2, #0
	str r1, [sp, #4]
	movs r1, #4
	adds r4, r0, #0
	bl FUN_02007B8C
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
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #9
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	adds r0, r4, #0
	movs r3, #6
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #5
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	adds r0, r4, #0
	movs r3, #7
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0xa
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	adds r0, r4, #0
	movs r3, #6
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #5
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	adds r0, r4, #0
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #6
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	adds r0, r4, #0
	movs r3, #3
	bl FUN_02007B68
	ldr r0, [r5]
	adds r3, r5, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	adds r3, #0xac
	bl FUN_02007C2C
	adds r1, r5, #0
	adds r1, #0xb0
	str r0, [r1]
	ldr r0, [r5]
	adds r3, r5, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	adds r3, #0xb4
	bl FUN_02007C2C
	adds r1, r5, #0
	adds r1, #0xb8
	str r0, [r1]
	ldr r0, [r5]
	adds r3, r5, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0
	adds r3, #0xbc
	bl FUN_02007C2C
	adds r1, r5, #0
	adds r1, #0xc0
	str r0, [r1]
	adds r0, r4, #0
	bl FUN_0200770C
	movs r1, #6
	ldr r2, [r5]
	movs r0, #0
	lsls r1, r1, #6
	bl FUN_0200304C
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r0, [r0]
	movs r1, #0
	movs r2, #1
	str r0, [sp]
	ldr r0, [r5]
	movs r3, #0xd
	str r0, [sp, #4]
	ldr r0, [r5, #0x14]
	bl FUN_0200E644
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov109_021E6B5C

	thumb_func_start ov109_021E6C7C
ov109_021E6C7C: @ 0x021E6C7C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xc0
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r4, #0xb0
	ldr r0, [r4]
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov109_021E6C7C

	thumb_func_start ov109_021E6C9C
ov109_021E6C9C: @ 0x021E6C9C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #4
	bl FUN_02002CEC
	movs r0, #0
	ldr r3, [r5]
	movs r1, #0x1b
	adds r2, r0, #0
	bl FUN_0200BAF8
	str r0, [r5, #0x24]
	ldr r2, [r5]
	movs r0, #6
	movs r1, #0x16
	bl FUN_0200BD18
	str r0, [r5, #0x28]
	ldr r1, [r5]
	movs r0, #0x80
	bl FUN_02026354
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x24]
	movs r1, #0
	bl FUN_0200BBA0
	str r0, [r5, #0x30]
	movs r4, #0
	adds r6, r5, #0
_021E6CDA:
	ldr r0, [r5, #0x24]
	adds r1, r4, #5
	bl FUN_0200BBA0
	str r0, [r6, #0x34]
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #5
	blt _021E6CDA
	movs r4, #0
	adds r6, r5, #0
_021E6CF0:
	adds r1, r4, #0
	ldr r0, [r5, #0x24]
	adds r1, #0xa
	bl FUN_0200BBA0
	str r0, [r6, #0x48]
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #2
	blt _021E6CF0
	ldr r1, [r5]
	movs r0, #4
	bl FUN_02014918
	adds r1, r5, #0
	adds r1, #0x88
	str r0, [r1]
	movs r4, #0
_021E6D14:
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	ldr r1, [r5, #0x24]
	adds r2, r4, #1
	adds r3, r4, #0
	bl FUN_02014960
	adds r4, r4, #1
	cmp r4, #4
	blt _021E6D14
	pop {r4, r5, r6, pc}
	thumb_func_end ov109_021E6C9C

	thumb_func_start ov109_021E6D2C
ov109_021E6D2C: @ 0x021E6D2C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x88
	ldr r0, [r0]
	bl FUN_02014950
	adds r0, r6, #0
	movs r4, #0
	adds r0, #0x88
	str r4, [r0]
	adds r5, r6, #0
_021E6D42:
	ldr r0, [r5, #0x48]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _021E6D42
	movs r5, #0
	adds r4, r6, #0
_021E6D54:
	ldr r0, [r4, #0x34]
	bl FUN_02026380
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #5
	blt _021E6D54
	ldr r0, [r6, #0x30]
	bl FUN_02026380
	ldr r0, [r6, #0x2c]
	bl FUN_02026380
	ldr r0, [r6, #0x28]
	bl FUN_0200BDA0
	ldr r0, [r6, #0x24]
	bl FUN_0200BB44
	movs r0, #4
	bl FUN_02002DB4
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov109_021E6D2C

	thumb_func_start ov109_021E6D84
ov109_021E6D84: @ 0x021E6D84
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	ldr r4, _021E6DB8 @ =0x021E78F4
	movs r6, #0
	adds r5, #0x50
_021E6D90:
	ldr r0, [r7, #0x14]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #3
	blt _021E6D90
	ldr r0, [r7]
	bl FUN_0201660C
	adds r7, #0x8c
	str r0, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6DB8: .4byte 0x021E78F4
	thumb_func_end ov109_021E6D84

	thumb_func_start ov109_021E6DBC
ov109_021E6DBC: @ 0x021E6DBC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	movs r4, #0
	adds r5, #0x50
_021E6DC6:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _021E6DC6
	adds r6, #0x8c
	ldr r0, [r6]
	bl FUN_02016624
	pop {r4, r5, r6, pc}
	thumb_func_end ov109_021E6DBC

	thumb_func_start ov109_021E6DE4
ov109_021E6DE4: @ 0x021E6DE4
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #0x20
	bl FUN_0202055C
	ldr r0, [r4]
	bl FUN_0200CF18
	adds r1, r4, #0
	adds r1, #0x90
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r1, _021E6E58 @ =0x021E79D0
	ldr r2, _021E6E5C @ =0x021E78C8
	movs r3, #3
	bl FUN_0200CF70
	ldr r0, [r4]
	bl FUN_0200B2E0
	ldr r0, [r4]
	bl FUN_0200B2E8
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl FUN_0200CF38
	adds r1, r4, #0
	adds r1, #0x94
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x90
	adds r1, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	movs r2, #5
	bl FUN_0200CFF4
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x90
	adds r4, #0x94
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, _021E6E60 @ =0x021E78A8
	movs r3, #2
	bl FUN_0200D2A4
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E6E58: .4byte 0x021E79D0
_021E6E5C: .4byte 0x021E78C8
_021E6E60: .4byte 0x021E78A8
	thumb_func_end ov109_021E6DE4

	thumb_func_start ov109_021E6E64
ov109_021E6E64: @ 0x021E6E64
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, #0x90
	adds r1, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D0E4
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x94
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl FUN_0200D108
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x90
	str r1, [r0]
	bl FUN_020205AC
	ldr r0, [r4]
	bl FUN_0200B2E0
	pop {r4, pc}
	thumb_func_end ov109_021E6E64

	thumb_func_start ov109_021E6E9C
ov109_021E6E9C: @ 0x021E6E9C
	push {r4, lr}
	adds r4, r0, #0
	bl ov109_021E6DE4
	adds r0, r4, #0
	bl ov109_021E6EE4
	ldr r0, [r4]
	movs r1, #0
	bl FUN_02018424
	adds r4, #0x80
	str r0, [r4]
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	pop {r4, pc}
	thumb_func_end ov109_021E6E9C

	thumb_func_start ov109_021E6EC0
ov109_021E6EC0: @ 0x021E6EC0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	bl ov109_021E6F60
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02018474
	adds r0, r4, #0
	bl ov109_021E6E64
	pop {r4, pc}
	thumb_func_end ov109_021E6EC0

	thumb_func_start ov109_021E6EE4
ov109_021E6EE4: @ 0x021E6EE4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r4, _021E6F5C @ =0x021E7A58
	movs r7, #0
	adds r5, r6, #0
_021E6EEE:
	adds r0, r6, #0
	adds r1, r6, #0
	adds r0, #0x90
	adds r1, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #0
	bl FUN_0200D2B4
	adds r1, r5, #0
	adds r1, #0x98
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02024830
	adds r0, r5, #0
	adds r0, #0x98
	movs r1, #1
	ldr r0, [r0]
	lsls r1, r1, #0xc
	bl FUN_02024868
	adds r7, r7, #1
	adds r4, #0x28
	adds r5, r5, #4
	cmp r7, #5
	blt _021E6EEE
	adds r0, r6, #0
	adds r0, #0x98
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0202484C
	adds r0, r6, #0
	adds r0, #0x9c
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r6, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #2
	bl FUN_02024A04
	adds r6, #0xa8
	ldr r0, [r6]
	movs r1, #1
	bl FUN_0202484C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6F5C: .4byte 0x021E7A58
	thumb_func_end ov109_021E6EE4

	thumb_func_start ov109_021E6F60
ov109_021E6F60: @ 0x021E6F60
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021E6F66:
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	bl FUN_0200D018
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #5
	blt _021E6F66
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov109_021E6F60

	thumb_func_start ov109_021E6F7C
ov109_021E6F7C: @ 0x021E6F7C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	adds r4, r1, #0
	movs r1, #2
	adds r6, r2, #0
	bl FUN_0201CAE0
	cmp r6, #0
	beq _021E6FCE
	adds r0, r5, #0
	adds r0, #0xbc
	lsrs r1, r4, #0x1f
	adds r1, r4, r1
	asrs r2, r1, #1
	ldr r0, [r0]
	movs r1, #0x10
	str r1, [sp]
	movs r1, #0x18
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	lsls r1, r2, #0x1c
	lsrs r2, r1, #0x18
	str r2, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x14]
	bl FUN_0201C4EC
_021E6FCE:
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov109_021E6F7C

	thumb_func_start ov109_021E6FD4
ov109_021E6FD4: @ 0x021E6FD4
	push {r4, r5, lr}
	sub sp, #0x1c
	cmp r2, #1
	bne _021E6FE4
	lsls r2, r3, #1
	movs r4, #3
	adds r2, r2, #1
	b _021E6FEA
_021E6FE4:
	lsls r2, r3, #1
	movs r4, #0x1c
	adds r2, r2, #2
_021E6FEA:
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	adds r2, r0, #0
	adds r2, #0xbc
	ldr r2, [r2]
	movs r5, #1
	str r5, [sp]
	movs r5, #2
	str r5, [sp, #4]
	adds r5, r2, #0
	adds r5, #0xc
	lsls r3, r3, #0x18
	str r5, [sp, #8]
	lsrs r3, r3, #0x18
	str r3, [sp, #0xc]
	movs r3, #0x18
	str r3, [sp, #0x10]
	ldrh r3, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x15
	lsrs r3, r3, #0x18
	str r3, [sp, #0x14]
	ldrh r2, [r2, #2]
	movs r3, #0xf
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x18]
	ldr r0, [r0, #0x14]
	adds r2, r4, #0
	bl FUN_0201C4EC
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov109_021E6FD4

	thumb_func_start ov109_021E7030
ov109_021E7030: @ 0x021E7030
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x14]
	movs r0, #0xc
	muls r0, r2, r0
	str r3, [sp, #8]
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	str r1, [sp, #4]
	adds r0, r0, #2
	str r0, [sp, #0xc]
_021E704C:
	ldr r4, [sp, #8]
	ldr r0, [sp, #0xc]
	adds r1, r4, #0
	cmp r1, r0
	bge _021E70AA
	ldr r1, _021E70C0 @ =_021E7884
	ldr r0, [sp, #0x14]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r6, r1, r0
	ldr r0, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_021E7066:
	ldrb r1, [r6]
	ldr r0, [sp, #0x10]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xc5
	ldrb r0, [r0]
	cmp r1, r0
	str r7, [sp]
	bhs _021E7092
	lsls r1, r1, #3
	adds r1, r5, r1
	adds r1, #0xd0
	lsls r3, r4, #0x18
	ldr r1, [r1]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	lsrs r3, r3, #0x18
	bl ov109_021E7178
	b _021E70A0
_021E7092:
	lsls r3, r4, #0x18
	ldr r2, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	lsrs r3, r3, #0x18
	bl ov109_021E7178
_021E70A0:
	ldr r0, [sp, #0xc]
	adds r4, r4, #1
	adds r6, r6, #1
	cmp r4, r0
	blt _021E7066
_021E70AA:
	ldr r0, [sp, #0x14]
	adds r0, r0, #4
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #3
	blt _021E704C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021E70C0: .4byte _021E7884
	thumb_func_end ov109_021E7030

	thumb_func_start ov109_021E70C4
ov109_021E70C4: @ 0x021E70C4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r2, #0
	movs r2, #1
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r3, #0
	tst r2, r6
	beq _021E70E8
	adds r2, r7, #0
	movs r3, #0
	bl ov109_021E7030
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	adds r3, r7, #0
	bl ov109_021E6FD4
_021E70E8:
	movs r3, #2
	adds r0, r6, #0
	tst r0, r3
	beq _021E7106
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov109_021E7030
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	adds r3, r7, #0
	bl ov109_021E6FD4
_021E7106:
	lsls r1, r4, #0x18
	ldr r0, [r5, #0x14]
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov109_021E70C4

	thumb_func_start ov109_021E7114
ov109_021E7114: @ 0x021E7114
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r2, [sp, #0x1c]
	adds r5, r0, #0
	adds r6, r1, #0
	str r3, [sp, #0x20]
	adds r0, #0xb4
	ldr r4, [r0]
	adds r0, r6, #0
	movs r1, #6
	blx FUN_020F2998
	adds r7, r1, #0
	adds r0, r6, #0
	movs r1, #6
	blx FUN_020F2998
	movs r1, #5
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r4, #0
	adds r1, #0xc
	str r1, [sp, #8]
	lsls r1, r7, #2
	adds r1, r7, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	lsls r1, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	ldrh r0, [r4]
	add r3, sp, #0x28
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r4, #2]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldrb r3, [r3, #0x10]
	ldr r0, [r5, #0x14]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	bl FUN_0201C4EC
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov109_021E7114

	thumb_func_start ov109_021E7178
ov109_021E7178: @ 0x021E7178
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, _021E71B8 @ =0x00000000
	beq _021E718C
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
_021E718C:
	add r4, sp, #0
	ldrb r5, [r4, #0x10]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r4, r5, #2
	adds r4, r5, r4
	adds r4, r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r5, #6
	str r4, [sp]
	lsls r4, r3, #0x17
	muls r5, r3, r5
	lsrs r4, r4, #0x18
	adds r3, r5, #4
	adds r3, r4, r3
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl ov109_021E7114
	pop {r3, r4, r5, pc}
	nop
_021E71B8: .4byte 0x00000000
	thumb_func_end ov109_021E7178

	thumb_func_start ov109_021E71BC
ov109_021E71BC: @ 0x021E71BC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0xc
	adds r7, r2, #0
	blx FUN_020F2998
	ldrb r1, [r4, #0x19]
	cmp r0, r1
	bne _021E71FE
	adds r0, r5, #0
	movs r1, #0xc
	blx FUN_020F2998
	ldr r0, _021E7244 @ =0x021E7890
	movs r2, #3
	ldrb r3, [r0, r1]
	movs r1, #0
	lsls r0, r3, #0x16
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsrs r6, r3, #0x1f
	lsls r5, r3, #0x1e
	subs r5, r5, r6
	movs r3, #0x1e
	rors r5, r3
	adds r3, r6, r5
	lsls r3, r3, #0x18
	adds r0, r4, #0
	lsrs r3, r3, #0x18
	bl ov109_021E7178
_021E71FE:
	adds r0, r7, #0
	movs r1, #0xc
	blx FUN_020F2998
	ldrb r1, [r4, #0x19]
	cmp r0, r1
	bne _021E7238
	adds r0, r7, #0
	movs r1, #0xc
	blx FUN_020F2998
	ldr r0, _021E7244 @ =0x021E7890
	movs r2, #3
	ldrb r5, [r0, r1]
	movs r1, #0
	lsls r0, r5, #0x16
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsrs r3, r5, #0x1f
	lsls r6, r5, #0x1e
	subs r6, r6, r3
	movs r5, #0x1e
	rors r6, r5
	adds r3, r3, r6
	lsls r3, r3, #0x18
	adds r0, r4, #0
	lsrs r3, r3, #0x18
	bl ov109_021E7178
_021E7238:
	ldr r0, [r4, #0x14]
	movs r1, #3
	bl FUN_0201EFBC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7244: .4byte 0x021E7890
	thumb_func_end ov109_021E71BC

	thumb_func_start ov109_021E7248
ov109_021E7248: @ 0x021E7248
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	adds r4, r1, #0
	movs r1, #6
	bl FUN_0201EFBC
	ldr r0, [r5, #0x14]
	movs r1, #7
	bl FUN_0201EFBC
	adds r0, r5, #0
	adds r0, #0x70
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r5, #0x14]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r0, [r5, #0x14]
	movs r1, #7
	bl FUN_0201CAE0
	cmp r4, #0
	bne _021E728A
	adds r5, #0x70
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E728A:
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_02028E9C
	adds r2, r0, #0
	ldr r0, [r5, #0x28]
	movs r1, #0
	bl FUN_0200BE48
	ldrh r0, [r4, #0x32]
	ldr r1, [r5]
	ldr r2, [r5, #0x2c]
	bl FUN_02068F98
	movs r0, #0
	str r0, [sp]
	movs r3, #2
	str r3, [sp, #4]
	ldr r0, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	movs r1, #1
	bl FUN_0200BE3C
	adds r1, r4, #0
	ldr r0, [r5, #0x2c]
	adds r1, #0x18
	bl FUN_020269A0
	movs r0, #0
	movs r1, #2
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	adds r3, r1, #0
	bl FUN_0200BE3C
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [r4, #0x38]
	ldr r0, [r5, #0x28]
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	movs r2, #0x7d
	lsls r2, r2, #4
	adds r2, r3, r2
	movs r1, #3
	movs r3, #4
	bl FUN_0200BFCC
	movs r3, #2
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [r4, #0x38]
	ldr r0, [r5, #0x28]
	lsrs r2, r2, #0x10
	lsls r2, r2, #0x18
	movs r1, #4
	lsrs r2, r2, #0x18
	bl FUN_0200BFCC
	movs r3, #2
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [r4, #0x38]
	ldr r0, [r5, #0x28]
	lsrs r2, r2, #8
	lsls r2, r2, #0x18
	movs r1, #5
	lsrs r2, r2, #0x18
	bl FUN_0200BFCC
	adds r0, r4, #0
	bl ov109_021E7850
	cmp r0, #1
	ldr r0, [r5, #0x28]
	bls _021E733A
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x4c]
	bl FUN_0200CBBC
	b _021E7342
_021E733A:
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x48]
	bl FUN_0200CBBC
_021E7342:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E7384 @ =0x00030200
	adds r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x2c]
	adds r0, #0x70
	bl FUN_020200FC
	adds r0, r5, #0
	adds r0, #0x70
	bl FUN_0201D5C8
	movs r0, #8
	str r0, [sp]
	ldrb r1, [r4, #4]
	adds r0, r5, #0
	movs r2, #7
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r3, #0xd
	bl ov109_021E7114
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E7384: .4byte 0x00030200
	thumb_func_end ov109_021E7248

	thumb_func_start ov109_021E7388
ov109_021E7388: @ 0x021E7388
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, #0x50
	movs r1, #0
	bl FUN_0201D978
	cmp r5, #0
	beq _021E73B2
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #9
	bl FUN_020248F0
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	bl FUN_02024964
_021E73B2:
	ldr r1, [r4, #0x30]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	movs r1, #0
	adds r3, r0, #0
	movs r5, #0x40
	subs r3, r5, r3
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E73F4 @ =0x00010500
	lsrs r3, r3, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	ldr r2, [r4, #0x30]
	adds r0, #0x50
	movs r1, #4
	bl FUN_020200FC
	adds r0, r4, #0
	adds r0, #0x50
	bl FUN_0201D5C8
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0201EFBC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E73F4: .4byte 0x00010500
	thumb_func_end ov109_021E7388

	thumb_func_start ov109_021E73F8
ov109_021E73F8: @ 0x021E73F8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r3, #0
	cmp r2, #0
	beq _021E7412
	movs r1, #1
	adds r0, #0x60
	adds r2, r1, #0
	movs r3, #0xd
	bl FUN_0200E998
_021E7412:
	adds r0, r5, #0
	adds r0, #0x60
	movs r1, #0xf
	bl FUN_0201D978
	cmp r6, #0
	bne _021E7440
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E7470 @ =0x0001020F
	lsls r2, r4, #2
	str r0, [sp, #8]
	adds r0, r5, #0
	str r1, [sp, #0xc]
	adds r2, r5, r2
	ldr r2, [r2, #0x34]
	adds r0, #0x60
	adds r3, r1, #0
	bl FUN_020200FC
	b _021E7462
_021E7440:
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E7470 @ =0x0001020F
	str r6, [sp, #4]
	str r0, [sp, #8]
	lsls r2, r4, #2
	adds r0, r5, #0
	str r1, [sp, #0xc]
	adds r2, r5, r2
	ldr r2, [r2, #0x34]
	adds r0, #0x60
	adds r3, r1, #0
	bl FUN_020200FC
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
_021E7462:
	adds r5, #0x60
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E7470: .4byte 0x0001020F
	thumb_func_end ov109_021E73F8

	thumb_func_start ov109_021E7474
ov109_021E7474: @ 0x021E7474
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x98
	adds r4, r1, #0
	ldr r0, [r0]
	adds r1, r3, #0
	adds r6, r2, #0
	bl FUN_02024830
	cmp r6, #3
	bne _021E749C
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	movs r1, #1
	movs r7, #0xc0
	movs r4, #0xa0
	bl FUN_020249D4
	b _021E74C4
_021E749C:
	movs r0, #0x30
	adds r1, r4, #0
	muls r1, r0, r1
	lsrs r0, r4, #1
	adds r1, #0x1c
	lsls r0, r0, #3
	adds r0, r1, r0
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	movs r0, #0x28
	muls r0, r6, r0
	adds r0, #8
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	movs r1, #0
	bl FUN_020249D4
_021E74C4:
	adds r5, #0x98
	ldr r0, [r5]
	adds r1, r7, #0
	adds r2, r4, #0
	bl FUN_0200DD88
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov109_021E7474

	thumb_func_start ov109_021E74D4
ov109_021E74D4: @ 0x021E74D4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x1f]
	adds r4, r1, #0
	movs r1, #0xc
	blx FUN_020F2998
	lsls r0, r0, #0x18
	ldrb r1, [r5, #0x19]
	lsrs r0, r0, #0x18
	cmp r1, r0
	beq _021E74EE
	movs r4, #0
_021E74EE:
	ldrb r3, [r5, #0x1d]
	adds r0, r5, #0
	adds r0, #0x9c
	movs r1, #0x30
	adds r2, r3, #0
	muls r2, r1, r2
	lsrs r1, r3, #1
	ldrb r3, [r5, #0x1e]
	adds r2, #0x1c
	lsls r1, r1, #3
	adds r1, r2, r1
	movs r2, #0x28
	muls r2, r3, r2
	adds r2, #8
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r0]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	adds r5, #0x9c
	ldr r0, [r5]
	adds r1, r4, #0
	bl FUN_02024830
	pop {r3, r4, r5, pc}
	thumb_func_end ov109_021E74D4

	thumb_func_start ov109_021E7524
ov109_021E7524: @ 0x021E7524
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0202484C
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0202484C
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	bne _021E7552
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #2
	bl FUN_020248F0
	b _021E755E
_021E7552:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #0
	bl FUN_020248F0
_021E755E:
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	beq _021E756C
	ldrb r1, [r4, #0x19]
	subs r0, r0, #1
	cmp r1, r0
	bne _021E7578
_021E756C:
	adds r4, #0xa4
	ldr r0, [r4]
	movs r1, #5
	bl FUN_020248F0
	pop {r4, pc}
_021E7578:
	adds r4, #0xa4
	ldr r0, [r4]
	movs r1, #3
	bl FUN_020248F0
	pop {r4, pc}
	thumb_func_end ov109_021E7524

	thumb_func_start ov109_021E7584
ov109_021E7584: @ 0x021E7584
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r5, #0x98
	lsls r4, r6, #2
	ldr r0, [r5, r4]
	bl FUN_02024964
	ldr r0, [r5, r4]
	movs r1, #1
	bl FUN_0202484C
	cmp r6, #2
	ldr r0, [r5, r4]
	bne _021E75AA
	movs r1, #1
	bl FUN_020248F0
	pop {r4, r5, r6, pc}
_021E75AA:
	movs r1, #4
	bl FUN_020248F0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov109_021E7584

	thumb_func_start ov109_021E75B4
ov109_021E75B4: @ 0x021E75B4
	ldr r1, [r0, #0xc]
	cmp r1, #0
	bne _021E75BE
	movs r1, #1
	b _021E75C0
_021E75BE:
	movs r1, #0
_021E75C0:
	str r1, [r0, #0xc]
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov109_021E75B4

	thumb_func_start ov109_021E75C8
ov109_021E75C8: @ 0x021E75C8
	push {r3, r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	add r0, sp, #0xc
	movs r1, #0
	movs r2, #0x18
	blx FUN_020D4994
	ldr r0, _021E763C @ =0x021E789C
	add r2, sp, #0xc
	ldrh r3, [r0]
	add r1, sp, #0xc
	strh r3, [r2]
	ldrh r3, [r0, #2]
	strh r3, [r2, #2]
	ldrh r3, [r0, #4]
	strh r3, [r2, #4]
	ldrh r3, [r0, #6]
	strh r3, [r2, #6]
	ldrh r3, [r0, #8]
	ldrh r0, [r0, #0xa]
	strh r3, [r2, #8]
	strh r0, [r2, #0xa]
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r3, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x14]
	str r0, [sp, #0x1c]
	movs r0, #4
	strb r0, [r2, #0x14]
	movs r0, #0xb
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r2, [r4, #0xc]
	adds r0, #0x80
	lsls r2, r2, #0x18
	ldr r0, [r0]
	lsrs r2, r2, #0x18
	bl FUN_020185FC
	adds r1, r4, #0
	adds r1, #0x84
	str r0, [r1]
	ldrb r1, [r4, #0x1b]
	ldrb r2, [r4, #0x1c]
	adds r0, r4, #0
	movs r3, #0
	bl ov109_021E7474
	add sp, #0x24
	pop {r3, r4, pc}
	nop
_021E763C: .4byte 0x021E789C
	thumb_func_end ov109_021E75C8

	thumb_func_start ov109_021E7640
ov109_021E7640: @ 0x021E7640
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_020186A4
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _021E76EC
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_02018674
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_02018680
	ldr r0, [r5, #0xc]
	cmp r0, r6
	beq _021E7678
	adds r0, r5, #0
	bl ov109_021E75B4
_021E7678:
	cmp r4, #0
	beq _021E7686
	cmp r4, #1
	beq _021E7696
	cmp r4, #2
	beq _021E76AC
	b _021E76CE
_021E7686:
	ldr r0, [r5, #0x10]
	movs r1, #1
	strb r1, [r0, #1]
	ldrb r1, [r5, #0x1f]
	ldr r0, [r5, #0x10]
	strb r1, [r0, #2]
	movs r0, #8
	pop {r4, r5, r6, pc}
_021E7696:
	movs r2, #0
	adds r0, r5, #0
	movs r1, #4
	adds r3, r2, #0
	bl ov109_021E73F8
	movs r0, #2
	adds r5, #0x20
	strb r0, [r5]
	movs r0, #7
	pop {r4, r5, r6, pc}
_021E76AC:
	ldrb r1, [r5, #0x1b]
	ldrb r2, [r5, #0x1c]
	adds r0, r5, #0
	movs r3, #1
	bl ov109_021E7474
	movs r2, #0
	adds r0, r5, #0
	movs r1, #2
	adds r3, r2, #0
	bl ov109_021E73F8
	movs r0, #1
	adds r5, #0x20
	strb r0, [r5]
	movs r0, #5
	pop {r4, r5, r6, pc}
_021E76CE:
	adds r0, r5, #0
	movs r1, #0
	bl ov109_021E7248
	adds r0, r5, #0
	movs r1, #0
	bl ov109_021E74D4
	ldrb r1, [r5, #0x1b]
	ldrb r2, [r5, #0x1c]
	adds r0, r5, #0
	movs r3, #1
	bl ov109_021E7474
	movs r0, #1
_021E76EC:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov109_021E7640

	thumb_func_start ov109_021E76F0
ov109_021E76F0: @ 0x021E76F0
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, [r4, #0x14]
	movs r1, #0x19
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r1, [r0, #0x10]
	movs r2, #0x10
	strb r2, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	movs r3, #0xf
	bics r1, r3
	ldr r3, [r4, #0xc]
	adds r4, #0x8c
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	movs r3, #0xf
	ands r3, r5
	orrs r1, r3
	strb r1, [r0, #0x12]
	ldrb r3, [r0, #0x12]
	movs r1, #0xf0
	bics r3, r1
	adds r1, r3, #0
	orrs r1, r2
	strb r1, [r0, #0x12]
	ldr r0, [r4]
	add r1, sp, #0
	bl FUN_020166FC
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov109_021E76F0

	thumb_func_start ov109_021E7748
ov109_021E7748: @ 0x021E7748
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_020168F4
	adds r4, r0, #0
	cmp r4, #1
	beq _021E7760
	cmp r4, #2
	beq _021E776E
	b _021E776A
_021E7760:
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov109_021E5DEC
	b _021E776E
_021E776A:
	movs r0, #7
	pop {r3, r4, r5, pc}
_021E776E:
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_020169C0
	ldr r1, [r5, #0xc]
	cmp r0, r1
	beq _021E7780
	str r0, [r5, #0xc]
_021E7780:
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_020169CC
	adds r0, r5, #0
	movs r1, #0
	bl ov109_021E74D4
	cmp r4, #1
	bne _021E77A8
	ldrb r3, [r5, #0x19]
	movs r1, #3
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov109_021E70C4
	adds r0, r5, #0
	bl ov109_021E7524
_021E77A8:
	ldrb r1, [r5, #0x1b]
	ldrb r2, [r5, #0x1c]
	adds r0, r5, #0
	movs r3, #1
	bl ov109_021E7474
	adds r0, r5, #0
	movs r1, #0
	bl ov109_021E7248
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov109_021E73F8
	movs r0, #0
	adds r5, #0x20
	strb r0, [r5]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov109_021E7748

	thumb_func_start ov109_021E77D4
ov109_021E77D4: @ 0x021E77D4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	movs r1, #8
	bl FUN_0201AACC
	movs r1, #0
	movs r2, #8
	adds r5, r0, #0
	blx FUN_020D4994
	ldr r0, _021E780C @ =ov109_021E7810
	adds r1, r5, #0
	movs r2, #0
	str r4, [r5]
	bl FUN_0200E320
	adds r0, r4, #0
	movs r1, #1
	bl ov109_021E7388
	ldrb r1, [r4, #0x18]
	movs r0, #1
	bics r1, r0
	movs r0, #1
	orrs r0, r1
	strb r0, [r4, #0x18]
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E780C: .4byte ov109_021E7810
	thumb_func_end ov109_021E77D4

	thumb_func_start ov109_021E7810
ov109_021E7810: @ 0x021E7810
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	adds r0, #0xa8
	ldr r0, [r0]
	bl FUN_02024B68
	cmp r0, #0
	bne _021E784C
	ldr r0, [r4]
	movs r1, #0
	bl ov109_021E7388
	ldr r2, [r4]
	movs r0, #1
	ldrb r1, [r2, #0x18]
	bics r1, r0
	strb r1, [r2, #0x18]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
_021E784C:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov109_021E7810

	thumb_func_start ov109_021E7850
ov109_021E7850: @ 0x021E7850
	push {r3, r4}
	movs r1, #0
	ldr r3, _021E7880 @ =0x000001ED
	adds r2, r1, #0
_021E7858:
	lsls r4, r2, #2
	adds r4, r0, r4
	adds r4, #0x6c
	ldrh r4, [r4]
	cmp r4, #0
	ble _021E786E
	cmp r4, r3
	bgt _021E786E
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
_021E786E:
	adds r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #6
	blo _021E7858
	adds r0, r1, #0
	pop {r3, r4}
	bx lr
	nop
_021E7880: .4byte 0x000001ED
	thumb_func_end ov109_021E7850

	.rodata

_021E7884:
	.byte 0x00, 0x01, 0x06, 0x07, 0x02, 0x03, 0x08, 0x09, 0x04, 0x05, 0x0A, 0x0B
	.byte 0x00, 0x01, 0x04, 0x05, 0x08, 0x09, 0x02, 0x03, 0x06, 0x07, 0x0A, 0x0B, 0x03, 0x00, 0x00, 0x0B
	.byte 0x00, 0x00, 0x3A, 0x00, 0x1F, 0x00, 0x40, 0x00, 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x48, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0xCD, 0x0C, 0x00, 0x00, 0x9A, 0x09, 0x00, 0x00, 0x66, 0x06, 0x00, 0x00, 0x33, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x18, 0x15, 0x08, 0x02, 0x01, 0x02, 0x01, 0x00, 0x02, 0x13, 0x13
	.byte 0x04, 0x0C, 0xB6, 0x00, 0x04, 0x01, 0x0F, 0x1C, 0x08, 0x0A, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x1E, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x1C, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x2C, 0x20, 0x48, 0x0C, 0x2C, 0x50, 0x78
	.byte 0x0C, 0x2C, 0x88, 0xB0, 0x0C, 0x2C, 0xB8, 0xE0, 0x34, 0x54, 0x20, 0x48, 0x34, 0x54, 0x50, 0x78
	.byte 0x34, 0x54, 0x88, 0xB0, 0x34, 0x54, 0xB8, 0xE0, 0x5C, 0x7C, 0x20, 0x48, 0x5C, 0x7C, 0x50, 0x78
	.byte 0x5C, 0x7C, 0x88, 0xB0, 0x5C, 0x7C, 0xB8, 0xE0, 0xA2, 0xBC, 0xC2, 0xFE, 0x30, 0x50, 0x08, 0x18
	.byte 0x30, 0x50, 0xE8, 0xF8, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x40, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x40, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x021E7B20
