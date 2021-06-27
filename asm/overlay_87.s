
	thumb_func_start ov87_021E5900
ov87_021E5900: @ 0x021E5900
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	bl ov87_021E68A4
	movs r2, #0x12
	movs r0, #3
	movs r1, #0x7a
	lsls r2, r2, #0xe
	bl FUN_0201A910
	ldr r1, _021E59AC @ =0x000099FC
	adds r0, r5, #0
	movs r2, #0x7a
	bl FUN_02007280
	ldr r2, _021E59AC @ =0x000099FC
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x7a
	bl FUN_0201AC88
	str r0, [r4, #0x58]
	adds r0, r5, #0
	str r5, [r4]
	bl FUN_020072A4
	adds r5, r0, #0
	movs r1, #0x5a
	adds r2, r5, #0
	ldr r0, [r5]
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldrb r0, [r5, #4]
	adds r2, #0x14
	strb r0, [r4, #9]
	movs r0, #0xdd
	lsls r0, r0, #2
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	bl FUN_02028EA8
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r1, r5, #0
	movs r0, #0xde
	adds r1, #8
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r5, #0xe
	adds r0, r0, #4
	str r5, [r4, r0]
	adds r0, r4, #0
	bl ov87_021E7334
	movs r1, #0
	movs r3, #0xde
	lsls r3, r3, #2
	adds r2, r1, #0
	adds r0, r1, #0
	adds r5, r3, #4
_021E5980:
	ldr r6, [r4, r3]
	adds r1, r1, #1
	strh r0, [r6, r2]
	ldr r6, [r4, r5]
	strh r0, [r6, r2]
	adds r2, r2, #2
	cmp r1, #3
	blt _021E5980
	ldr r1, _021E59B0 @ =0x0000039D
	strb r0, [r4, r1]
	adds r0, r4, #0
	bl ov87_021E68DC
	movs r1, #0
	movs r0, #0x42
	adds r2, r1, #0
	str r1, [r7]
	bl FUN_02004EC4
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E59AC: .4byte 0x000099FC
_021E59B0: .4byte 0x0000039D
	thumb_func_end ov87_021E5900

	thumb_func_start ov87_021E59B4
ov87_021E59B4: @ 0x021E59B4
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #7
	bhi _021E5AB2
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E59D0: @ jump table
	.2byte _021E59E0 - _021E59D0 - 2 @ case 0
	.2byte _021E59F4 - _021E59D0 - 2 @ case 1
	.2byte _021E5A08 - _021E59D0 - 2 @ case 2
	.2byte _021E5A1C - _021E59D0 - 2 @ case 3
	.2byte _021E5A58 - _021E59D0 - 2 @ case 4
	.2byte _021E5A6C - _021E59D0 - 2 @ case 5
	.2byte _021E5A92 - _021E59D0 - 2 @ case 6
	.2byte _021E5AA6 - _021E59D0 - 2 @ case 7
_021E59E0:
	bl ov87_021E5AFC
	cmp r0, #1
	bne _021E5AB2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov87_021E725C
	b _021E5AB2
_021E59F4:
	bl ov87_021E5B48
	cmp r0, #1
	bne _021E5AB2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ov87_021E725C
	b _021E5AB2
_021E5A08:
	bl ov87_021E5C38
	cmp r0, #1
	bne _021E5AB2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl ov87_021E725C
	b _021E5AB2
_021E5A1C:
	bl ov87_021E5CEC
	cmp r0, #1
	bne _021E5AB2
	ldrb r0, [r4, #0xe]
	cmp r0, #3
	blo _021E5A4C
	movs r0, #0
	strb r0, [r4, #0xe]
	adds r0, r4, #0
	bl ov87_021E6760
	adds r0, r4, #0
	bl ov87_021E6668
	adds r0, r4, #0
	bl ov87_021E66B8
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl ov87_021E725C
	b _021E5AB2
_021E5A4C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov87_021E725C
	b _021E5AB2
_021E5A58:
	bl ov87_021E5E00
	cmp r0, #1
	bne _021E5AB2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl ov87_021E725C
	b _021E5AB2
_021E5A6C:
	bl ov87_021E6080
	cmp r0, #1
	bne _021E5AB2
	ldrb r0, [r4, #0xe]
	cmp r0, #3
	blo _021E5A86
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl ov87_021E725C
	b _021E5AB2
_021E5A86:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #6
	bl ov87_021E725C
	b _021E5AB2
_021E5A92:
	bl ov87_021E64F8
	cmp r0, #1
	bne _021E5AB2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl ov87_021E725C
	b _021E5AB2
_021E5AA6:
	bl ov87_021E65FC
	cmp r0, #1
	bne _021E5AB2
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5AB2:
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202457C
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E59B4

	thumb_func_start ov87_021E5AC0
ov87_021E5AC0: @ 0x021E5AC0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl FUN_02021238
	movs r0, #0xdd
	lsls r0, r0, #2
	ldrb r1, [r4, #0xc]
	ldr r0, [r4, r0]
	strh r1, [r0]
	bl FUN_020205AC
	adds r0, r4, #0
	bl ov87_021E6780
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x7a
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov87_021E5AC0

	thumb_func_start ov87_021E5AFC
ov87_021E5AFC: @ 0x021E5AFC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _021E5B0E
	cmp r0, #1
	beq _021E5B2E
	b _021E5B40
_021E5B0E:
	movs r0, #6
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _021E5B40
_021E5B2E:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E5B40
	movs r0, #0
	strb r0, [r4, #0xe]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_021E5B40:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov87_021E5AFC

	thumb_func_start ov87_021E5B48
ov87_021E5B48: @ 0x021E5B48
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrb r0, [r6, #8]
	cmp r0, #0
	beq _021E5B5C
	cmp r0, #1
	beq _021E5BCE
	cmp r0, #2
	beq _021E5C22
	b _021E5C2A
_021E5B5C:
	movs r0, #0xff
	mvns r0, r0
	ldr r4, _021E5C30 @ =0x021E81A0
	strh r0, [r6, #0x10]
	movs r7, #0
	adds r5, r6, #0
_021E5B68:
	movs r1, #0x10
	movs r2, #0
	ldrsh r1, [r6, r1]
	ldrsh r2, [r4, r2]
	movs r0, #0xcb
	lsls r0, r0, #2
	adds r1, r1, r2
	movs r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r5, r0]
	bl ov87_021E7FEC
	movs r0, #0xcb
	lsls r0, r0, #2
	adds r1, r7, #0
	ldr r0, [r5, r0]
	adds r1, #0x14
	bl ov87_021E7FE0
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #4
	blt _021E5B68
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	movs r0, #0x53
	lsls r0, r0, #2
	adds r0, r6, r0
	bl ov87_021E8134
	adds r0, r6, #0
	bl ov87_021E7048
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #3
	strh r0, [r6, #0x12]
	movs r0, #0x56
	lsls r0, r0, #4
	bl FUN_0200604C
	movs r0, #1
	strb r0, [r6, #8]
	b _021E5C2A
_021E5BCE:
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	adds r0, #0x20
	strh r0, [r6, #0x10]
	movs r0, #0x12
	ldrsh r0, [r6, r0]
	lsls r2, r0, #2
	movs r0, #0xcb
	adds r3, r6, r2
	lsls r0, r0, #2
	ldr r0, [r3, r0]
	ldrsh r3, [r6, r1]
	ldr r1, _021E5C30 @ =0x021E81A0
	ldrsh r1, [r1, r2]
	adds r1, r3, r1
	ldr r3, _021E5C34 @ =0x021E81A2
	ldrsh r2, [r3, r2]
	bl ov87_021E7FEC
	movs r0, #0x10
	ldrsh r0, [r6, r0]
	cmp r0, #0
	blt _021E5C2A
	movs r0, #0x12
	ldrsh r0, [r6, r0]
	cmp r0, #0
	bne _021E5C0A
	movs r0, #2
	strb r0, [r6, #8]
	b _021E5C2A
_021E5C0A:
	movs r0, #0x56
	lsls r0, r0, #4
	bl FUN_0200604C
	movs r0, #0x12
	ldrsh r0, [r6, r0]
	subs r0, r0, #1
	strh r0, [r6, #0x12]
	movs r0, #0xff
	mvns r0, r0
	strh r0, [r6, #0x10]
	b _021E5C2A
_021E5C22:
	movs r0, #0
	strh r0, [r6, #0x10]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E5C2A:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5C30: .4byte 0x021E81A0
_021E5C34: .4byte 0x021E81A2
	thumb_func_end ov87_021E5B48

	thumb_func_start ov87_021E5C38
ov87_021E5C38: @ 0x021E5C38
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrb r0, [r5, #8]
	cmp r0, #0
	beq _021E5C4E
	cmp r0, #1
	beq _021E5C60
	cmp r0, #2
	beq _021E5CD8
	b _021E5CDE
_021E5C4E:
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x1e
	strb r0, [r5, #0xf]
	movs r0, #1
	strb r0, [r5, #8]
	b _021E5CDE
_021E5C60:
	ldrb r0, [r5, #0xf]
	cmp r0, #0
	bne _021E5C7C
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov87_021E7FD4
	b _021E5C80
_021E5C7C:
	subs r0, r0, #1
	strb r0, [r5, #0xf]
_021E5C80:
	ldr r0, _021E5CE4 @ =0x021E81C0
	bl FUN_02025204
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _021E5CDE
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov87_021E7FD4
	ldr r0, _021E5CE8 @ =0x000005E4
	bl FUN_0200604C
	ldrb r0, [r5, #0xe]
	add r1, sp, #0
	adds r0, r5, r0
	strb r4, [r0, #0x15]
	ldrb r0, [r5, #0xe]
	adds r0, r0, #1
	strb r0, [r5, #0xe]
	add r0, sp, #4
	bl FUN_02025364
	movs r0, #0x53
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #2
	strb r0, [r5, #8]
	b _021E5CDE
_021E5CD8:
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5CDE:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5CE4: .4byte 0x021E81C0
_021E5CE8: .4byte 0x000005E4
	thumb_func_end ov87_021E5C38

	thumb_func_start ov87_021E5CEC
ov87_021E5CEC: @ 0x021E5CEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldrb r1, [r4, #0xe]
	subs r1, r1, #1
	adds r1, r4, r1
	ldrb r7, [r1, #0x15]
	ldrb r1, [r4, #8]
	cmp r1, #3
	bhi _021E5DFA
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5D0C: @ jump table
	.2byte _021E5D14 - _021E5D0C - 2 @ case 0
	.2byte _021E5D40 - _021E5D0C - 2 @ case 1
	.2byte _021E5D9E - _021E5D0C - 2 @ case 2
	.2byte _021E5DF0 - _021E5D0C - 2 @ case 3
_021E5D14:
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	movs r1, #0
	movs r2, #0x3a
	strh r1, [r4, #0x10]
	lsls r2, r2, #4
	ldrb r3, [r4, r2]
	movs r0, #0xfe
	bics r3, r0
	lsls r0, r7, #2
	strb r3, [r4, r2]
	adds r0, r4, r0
	subs r2, #0x74
	ldr r0, [r0, r2]
	bl ov87_021E7FE0
	movs r0, #1
	strb r0, [r4, #8]
	b _021E5DFA
_021E5D40:
	lsls r1, r7, #0x18
	lsrs r1, r1, #0x18
	bl ov87_021E73E0
	movs r0, #1
	ldr r2, [r4, #0x1c]
	lsls r0, r0, #8
	adds r2, r2, r0
	str r2, [r4, #0x1c]
	ldr r2, [r4, #0x20]
	adds r1, r4, #0
	adds r2, r2, r0
	str r2, [r4, #0x20]
	ldr r2, [r4, #0x24]
	adds r1, #0x1c
	adds r0, r2, r0
	str r0, [r4, #0x24]
	movs r0, #0x10
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	lsls r0, r7, #2
	adds r2, r4, r0
	movs r0, #0xcb
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	bl ov87_021E806C
	movs r0, #6
	ldr r1, [r4, #0x1c]
	lsls r0, r0, #0xa
	cmp r1, r0
	bne _021E5DFA
	movs r0, #0
	strh r0, [r4, #0x10]
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	movs r0, #0x56
	lsls r0, r0, #4
	bl FUN_0200604C
	movs r0, #2
	strb r0, [r4, #8]
	b _021E5DFA
_021E5D9E:
	movs r0, #0x10
	ldrsh r0, [r4, r0]
	movs r6, #0
	adds r5, r4, #0
	adds r0, #0x10
	strh r0, [r4, #0x10]
_021E5DAA:
	movs r0, #0xcb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #4
	add r2, sp, #0
	bl ov87_021E8014
	movs r0, #0xcb
	lsls r0, r0, #2
	ldr r1, [sp, #4]
	ldr r0, [r5, r0]
	ldr r2, [sp]
	adds r1, #0x10
	bl ov87_021E7FEC
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #4
	blt _021E5DAA
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	adds r0, #0xf0
	cmp r1, r0
	blt _021E5DFA
	lsls r0, r7, #2
	adds r1, r4, r0
	movs r0, #0xcb
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl ov87_021E8058
	movs r0, #3
	strb r0, [r4, #8]
	b _021E5DFA
_021E5DF0:
	movs r0, #0
	strh r0, [r4, #0x10]
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E5DFA:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E5CEC

	thumb_func_start ov87_021E5E00
ov87_021E5E00: @ 0x021E5E00
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #3
	bls _021E5E0C
	b _021E606C
_021E5E0C:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5E18: @ jump table
	.2byte _021E5E20 - _021E5E18 - 2 @ case 0
	.2byte _021E5EDE - _021E5E18 - 2 @ case 1
	.2byte _021E5FCE - _021E5E18 - 2 @ case 2
	.2byte _021E6062 - _021E5E18 - 2 @ case 3
_021E5E20:
	bl ov87_021E7A2C
	movs r1, #0
	movs r3, #0xe3
	str r1, [sp]
	lsls r3, r3, #2
	ldr r2, [r4, r3]
	subs r3, r3, #4
	ldr r3, [r4, r3]
	ldr r0, [r4, #0x58]
	ldr r3, [r3, #0x10]
	bl FUN_0201C0C0
	ldr r0, [r4, #0x58]
	movs r1, #0
	bl FUN_0201BF7C
	movs r0, #1
	lsls r0, r0, #8
	strh r0, [r4, #0x12]
	movs r3, #0x12
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x58]
	movs r1, #6
	movs r2, #0
	bl FUN_0201BC8C
	movs r3, #0x12
	movs r1, #0
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x58]
	adds r2, r1, #0
	bl FUN_0201BC8C
	movs r3, #0x12
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x58]
	movs r1, #1
	movs r2, #0
	bl FUN_0201BC8C
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0xff
	mvns r0, r0
	strh r0, [r4, #0x10]
	ldrb r1, [r4, #0xe]
	movs r0, #0
	movs r2, #0x96
	adds r1, r4, r1
	strb r0, [r1, #0x19]
	ldr r1, _021E6070 @ =0x000003FA
	adds r5, r0, #0
	lsls r2, r2, #8
_021E5EA0:
	adds r3, r4, r0
	adds r0, r0, #1
	strb r5, [r3, r1]
	cmp r0, r2
	blt _021E5EA0
	ldr r0, _021E6074 @ =0x000003A1
	strb r5, [r4, r0]
	adds r0, r4, #0
	bl ov87_021E7334
	ldrb r1, [r4, #0xe]
	adds r0, r4, #0
	adds r1, r4, r1
	ldrb r1, [r1, #0x19]
	bl ov87_021E7324
	ldrb r1, [r4, #0xe]
	adds r0, r4, #0
	adds r1, r4, r1
	ldrb r1, [r1, #0x19]
	bl ov87_021E734C
	adds r0, r4, #0
	bl ov87_021E74B8
	adds r0, r4, #0
	bl ov87_021E74D4
	movs r0, #1
	strb r0, [r4, #8]
	b _021E606C
_021E5EDE:
	movs r7, #0
	movs r6, #0x1a
	adds r5, r4, #0
_021E5EE4:
	movs r1, #0x10
	movs r0, #0xbe
	ldrsh r1, [r4, r1]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, #0x3c
	adds r2, r6, #0
	bl ov87_021E7FEC
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov87_021E7FD4
	adds r7, r7, #1
	adds r6, #0x2a
	adds r5, r5, #4
	cmp r7, #4
	blt _021E5EE4
	movs r7, #0xd1
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #2
_021E5F14:
	ldr r0, [r5, r7]
	movs r1, #1
	bl ov87_021E8078
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #3
	blt _021E5F14
	ldr r0, _021E6078 @ =0x0000039D
	movs r7, #0
	strb r7, [r4, r0]
	adds r1, r0, #3
	ldrb r2, [r4, r1]
	movs r1, #1
	ldr r6, _021E607C @ =0x021E82E4
	bics r2, r1
	adds r1, r0, #3
	strb r2, [r4, r1]
	movs r2, #0xb1
	adds r1, r0, #5
	strb r2, [r4, r1]
	adds r1, r0, #6
	movs r2, #0xb2
	strb r2, [r4, r1]
	movs r1, #0xb3
	adds r0, r0, #7
	strb r1, [r4, r0]
	adds r5, r4, #0
_021E5F4C:
	movs r1, #0x10
	movs r2, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r6, r2]
	movs r0, #0xc2
	lsls r0, r0, #2
	adds r1, r1, r2
	movs r2, #2
	ldrsh r2, [r6, r2]
	ldr r0, [r5, r0]
	bl ov87_021E7FEC
	movs r0, #0xc2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov87_021E7FD4
	movs r1, #0x36
	movs r0, #0xc2
	lsls r0, r0, #2
	adds r2, r4, r7
	lsls r1, r1, #4
	ldrb r1, [r2, r1]
	ldr r0, [r5, r0]
	bl ov87_021E803C
	adds r7, r7, #1
	adds r6, r6, #4
	adds r5, r5, #4
	cmp r7, #9
	blt _021E5F4C
	movs r0, #0x18
	str r0, [sp]
	ldrb r2, [r4, #0xe]
	adds r0, r4, #0
	movs r1, #1
	adds r2, r4, r2
	ldrb r2, [r2, #0x15]
	movs r3, #0x20
	adds r2, r2, #4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl ov87_021E7460
	movs r0, #0x18
	str r0, [sp]
	ldrb r2, [r4, #0xe]
	adds r0, r4, #0
	movs r1, #6
	adds r2, r4, r2
	ldrb r2, [r2, #0x15]
	movs r3, #0x20
	adds r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl ov87_021E7460
	movs r0, #0x56
	lsls r0, r0, #4
	bl FUN_0200604C
	movs r0, #2
	strb r0, [r4, #8]
	b _021E606C
_021E5FCE:
	movs r3, #0x12
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x58]
	movs r1, #6
	movs r2, #0
	bl FUN_0201BC8C
	movs r3, #0x12
	movs r1, #0
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x58]
	adds r2, r1, #0
	bl FUN_0201BC8C
	movs r3, #0x12
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x58]
	movs r1, #1
	movs r2, #0
	bl FUN_0201BC8C
	movs r0, #0x12
	ldrsh r0, [r4, r0]
	subs r0, #0x10
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r0, [r4, r0]
	cmp r0, #0
	blt _021E600E
	movs r0, #3
	strb r0, [r4, #8]
	b _021E6058
_021E600E:
	movs r7, #0
	movs r6, #0x1a
	adds r5, r4, #0
_021E6014:
	movs r1, #0x10
	movs r0, #0xbe
	ldrsh r1, [r4, r1]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, #0x3c
	adds r2, r6, #0
	bl ov87_021E7FEC
	adds r7, r7, #1
	adds r6, #0x2a
	adds r5, r5, #4
	cmp r7, #4
	blt _021E6014
	ldr r5, _021E607C @ =0x021E82E4
	movs r7, #0
	adds r6, r4, #0
_021E6036:
	movs r1, #0x10
	movs r2, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r5, r2]
	movs r0, #0xc2
	lsls r0, r0, #2
	adds r1, r1, r2
	movs r2, #2
	ldrsh r2, [r5, r2]
	ldr r0, [r6, r0]
	bl ov87_021E7FEC
	adds r7, r7, #1
	adds r5, r5, #4
	adds r6, r6, #4
	cmp r7, #9
	blt _021E6036
_021E6058:
	movs r0, #0x10
	ldrsh r0, [r4, r0]
	adds r0, #0x10
	strh r0, [r4, #0x10]
	b _021E606C
_021E6062:
	movs r0, #0
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E606C:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6070: .4byte 0x000003FA
_021E6074: .4byte 0x000003A1
_021E6078: .4byte 0x0000039D
_021E607C: .4byte 0x021E82E4
	thumb_func_end ov87_021E5E00

	thumb_func_start ov87_021E6080
ov87_021E6080: @ 0x021E6080
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0xb
	bls _021E608C
	b _021E64F4
_021E608C:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E6098: @ jump table
	.2byte _021E60B0 - _021E6098 - 2 @ case 0
	.2byte _021E613E - _021E6098 - 2 @ case 1
	.2byte _021E6154 - _021E6098 - 2 @ case 2
	.2byte _021E6184 - _021E6098 - 2 @ case 3
	.2byte _021E633A - _021E6098 - 2 @ case 4
	.2byte _021E6356 - _021E6098 - 2 @ case 5
	.2byte _021E636A - _021E6098 - 2 @ case 6
	.2byte _021E63BA - _021E6098 - 2 @ case 7
	.2byte _021E63E4 - _021E6098 - 2 @ case 8
	.2byte _021E6414 - _021E6098 - 2 @ case 9
	.2byte _021E647E - _021E6098 - 2 @ case 10
	.2byte _021E64E8 - _021E6098 - 2 @ case 11
_021E60B0:
	ldrb r0, [r4, #0xe]
	cmp r0, #2
	bne _021E60E2
	movs r0, #0x4b
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8C8
	adds r0, r4, #0
	bl ov87_021E71B4
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x58
	movs r2, #0xa0
	bl ov87_021E7FEC
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov87_021E803C
	b _021E60F2
_021E60E2:
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8C8
	adds r0, r4, #0
	bl ov87_021E717C
_021E60F2:
	movs r0, #0x1e
	strb r0, [r4, #0xf]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov87_021E7FD4
	adds r0, r4, #0
	bl ov87_021E708C
	movs r5, #0
_021E610A:
	lsls r1, r5, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov87_021E71EC
	adds r5, r5, #1
	cmp r5, #4
	blt _021E610A
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov87_021E7FD4
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov87_021E8084
	ldr r0, _021E63F4 @ =0x00000562
	bl FUN_0200604C
	movs r0, #1
	strb r0, [r4, #8]
	b _021E64F4
_021E613E:
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #2
	strb r0, [r4, #8]
	b _021E64F4
_021E6154:
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	bne _021E617E
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov87_021E7FD4
	adds r0, r4, #0
	adds r0, #0xfc
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0xfc
	bl FUN_0201D5C8
	movs r0, #3
	strb r0, [r4, #8]
	b _021E64F4
_021E617E:
	subs r0, r0, #1
	strb r0, [r4, #0xf]
	b _021E64F4
_021E6184:
	movs r0, #0xee
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #4
	movs r2, #2
	bl FUN_02021280
	ldr r0, _021E63F8 @ =0x021E8308
	bl FUN_02025204
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _021E6290
	adds r0, r4, #0
	bl ov87_021E7490
	cmp r0, #3
	bhs _021E61B6
	movs r0, #0xe5
	movs r2, #1
	adds r1, r4, r5
	lsls r0, r0, #2
	strb r2, [r1, r0]
_021E61B6:
	movs r0, #0xe5
	adds r1, r4, r5
	lsls r0, r0, #2
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _021E61EA
	adds r0, r4, #0
	bl ov87_021E7550
	lsls r1, r5, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov87_021E75E0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov87_021E74F4
	ldr r0, _021E63FC @ =0x0000055F
	bl FUN_02006184
	cmp r0, #0
	bne _021E61EA
	ldr r0, _021E63FC @ =0x0000055F
	bl FUN_0200604C
_021E61EA:
	adds r0, r4, #0
	bl ov87_021E7734
	cmp r0, #1
	bne _021E6262
	ldr r0, _021E63FC @ =0x0000055F
	movs r1, #0
	bl FUN_02006154
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov87_021E7FD4
	ldr r1, _021E6400 @ =0x0000039F
	ldrb r0, [r4, r1]
	lsls r0, r0, #1
	adds r2, r4, r0
	adds r0, r1, #0
	subs r0, #0x35
	ldrh r3, [r2, r0]
	adds r0, r1, #0
	subs r0, #0x27
	ldr r2, [r4, r0]
	ldrb r0, [r4, #0xe]
	lsls r0, r0, #1
	strh r3, [r2, r0]
	ldrb r0, [r4, r1]
	lsls r0, r0, #1
	adds r2, r4, r0
	adds r0, r1, #0
	subs r0, #0x35
	ldrh r0, [r2, r0]
	cmp r0, #0x5c
	bne _021E6236
	movs r2, #1
	b _021E6238
_021E6236:
	movs r2, #3
_021E6238:
	ldrb r0, [r4, #0xe]
	subs r1, #0x23
	ldr r1, [r4, r1]
	lsls r0, r0, #1
	strh r2, [r1, r0]
	adds r0, r4, #0
	bl ov87_021E788C
	cmp r0, #1
	bne _021E6250
	movs r0, #0x1e
	b _021E6252
_021E6250:
	movs r0, #0
_021E6252:
	strb r0, [r4, #0xf]
	adds r0, r4, #0
	bl ov87_021E70D0
	movs r0, #4
	strb r0, [r4, #8]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6262:
	ldr r0, _021E6404 @ =0x000003A1
	ldrb r0, [r4, r0]
	cmp r0, #3
	blo _021E6298
	ldr r0, _021E63FC @ =0x0000055F
	movs r1, #0
	bl FUN_02006154
	movs r0, #0x3c
	strb r0, [r4, #0xf]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov87_021E7FD4
	adds r0, r4, #0
	bl ov87_021E7134
	movs r0, #7
	strb r0, [r4, #8]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6290:
	ldr r0, _021E63FC @ =0x0000055F
	movs r1, #0
	bl FUN_02006154
_021E6298:
	movs r0, #0x3a
	lsls r0, r0, #4
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _021E62AC
	adds r0, r4, #0
	bl ov87_021E7698
_021E62AC:
	ldrb r0, [r4, #0xe]
	cmp r0, #2
	bne _021E62F6
	ldr r0, _021E6408 @ =0x021E8184
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021E6378
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov87_021E8084
	adds r0, r4, #0
	bl ov87_021E7008
	ldr r0, _021E640C @ =0x000005E4
	bl FUN_0200604C
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov87_021E803C
	adds r0, r4, #0
	bl ov87_021E6AE0
	adds r0, r4, #0
	bl ov87_021E6AF4
	movs r0, #0xa
	strb r0, [r4, #8]
	b _021E64F4
_021E62F6:
	ldr r0, _021E6410 @ =0x021E818C
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021E6378
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov87_021E8084
	adds r0, r4, #0
	bl ov87_021E7008
	ldr r0, _021E640C @ =0x000005E4
	bl FUN_0200604C
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov87_021E803C
	adds r0, r4, #0
	bl ov87_021E6AE0
	adds r0, r4, #0
	bl ov87_021E6AF4
	movs r0, #9
	strb r0, [r4, #8]
	b _021E64F4
_021E633A:
	ldrb r1, [r4, #0xf]
	cmp r1, #0
	bne _021E6350
	movs r1, #0
	bl ov87_021E78D8
	cmp r0, #0
	bne _021E6378
	movs r0, #5
	strb r0, [r4, #8]
	b _021E64F4
_021E6350:
	subs r0, r1, #1
	strb r0, [r4, #0xf]
	b _021E64F4
_021E6356:
	movs r1, #1
	bl ov87_021E78D8
	cmp r0, #0
	bne _021E6378
	movs r0, #0
	strb r0, [r4, #0xf]
	movs r0, #6
	strb r0, [r4, #8]
	b _021E64F4
_021E636A:
	movs r0, #0xd7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov87_021E80B4
	cmp r0, #1
	bne _021E637A
_021E6378:
	b _021E64F4
_021E637A:
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	bne _021E63B4
	movs r7, #0x35
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #4
_021E6388:
	ldr r0, [r5, r7]
	movs r1, #0
	bl ov87_021E7FD4
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #3
	blt _021E6388
	movs r0, #0xd7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov87_021E7FD4
	adds r0, r4, #0
	bl ov87_021E7998
	adds r0, r4, #0
	bl ov87_021E79A0
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E63B4:
	subs r0, r0, #1
	strb r0, [r4, #0xf]
	b _021E64F4
_021E63BA:
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	bne _021E63DE
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	bl ov87_021E7998
	adds r0, r4, #0
	bl ov87_021E79A0
	movs r0, #0x1e
	strb r0, [r4, #0xf]
	movs r0, #8
	strb r0, [r4, #8]
	b _021E64F4
_021E63DE:
	subs r0, r0, #1
	strb r0, [r4, #0xf]
	b _021E64F4
_021E63E4:
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	bne _021E63EE
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E63EE:
	subs r0, r0, #1
	strb r0, [r4, #0xf]
	b _021E64F4
	.align 2, 0
_021E63F4: .4byte 0x00000562
_021E63F8: .4byte 0x021E8308
_021E63FC: .4byte 0x0000055F
_021E6400: .4byte 0x0000039F
_021E6404: .4byte 0x000003A1
_021E6408: .4byte 0x021E8184
_021E640C: .4byte 0x000005E4
_021E6410: .4byte 0x021E818C
_021E6414:
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02016748
	cmp r0, #1
	bne _021E6450
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov87_021E8084
	adds r0, r4, #0
	adds r0, #0x5c
	movs r1, #0
	bl FUN_0200E5D4
	adds r0, r4, #0
	adds r0, #0x5c
	bl FUN_0201D8C8
	adds r0, r4, #0
	bl ov87_021E7998
	adds r0, r4, #0
	bl ov87_021E6B28
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6450:
	cmp r0, #2
	bne _021E64F4
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov87_021E8084
	adds r0, r4, #0
	adds r0, #0x5c
	movs r1, #0
	bl FUN_0200E5D4
	adds r0, r4, #0
	adds r0, #0x5c
	bl FUN_0201D8C8
	adds r0, r4, #0
	bl ov87_021E6B28
	movs r0, #0xb
	strb r0, [r4, #8]
	b _021E64F4
_021E647E:
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02016748
	cmp r0, #1
	bne _021E64BA
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov87_021E8084
	adds r0, r4, #0
	adds r0, #0x5c
	movs r1, #0
	bl FUN_0200E5D4
	adds r0, r4, #0
	adds r0, #0x5c
	bl FUN_0201D8C8
	adds r0, r4, #0
	bl ov87_021E7990
	adds r0, r4, #0
	bl ov87_021E6B28
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E64BA:
	cmp r0, #2
	bne _021E64F4
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov87_021E8084
	adds r0, r4, #0
	adds r0, #0x5c
	movs r1, #0
	bl FUN_0200E5D4
	adds r0, r4, #0
	adds r0, #0x5c
	bl FUN_0201D8C8
	adds r0, r4, #0
	bl ov87_021E6B28
	movs r0, #0xb
	strb r0, [r4, #8]
	b _021E64F4
_021E64E8:
	bl FUN_0202534C
	cmp r0, #0
	bne _021E64F4
	movs r0, #3
	strb r0, [r4, #8]
_021E64F4:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E6080

	thumb_func_start ov87_021E64F8
ov87_021E64F8: @ 0x021E64F8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #8]
	cmp r0, #0
	beq _021E650C
	cmp r0, #1
	beq _021E653C
	cmp r0, #2
	beq _021E65EA
	b _021E65F4
_021E650C:
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov87_021E7FD4
	movs r0, #0
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	movs r0, #0x56
	lsls r0, r0, #4
	bl FUN_0200604C
	movs r0, #1
	strb r0, [r5, #8]
	b _021E65F4
_021E653C:
	movs r3, #0x12
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x58]
	movs r1, #6
	movs r2, #0
	bl FUN_0201BC8C
	movs r3, #0x12
	movs r1, #0
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x58]
	adds r2, r1, #0
	bl FUN_0201BC8C
	movs r3, #0x12
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x58]
	movs r1, #1
	movs r2, #0
	bl FUN_0201BC8C
	movs r0, #0x12
	ldrsh r0, [r5, r0]
	subs r0, #0x10
	strh r0, [r5, #0x12]
	movs r0, #0x10
	ldrsh r1, [r5, r0]
	adds r0, #0xf0
	cmp r1, r0
	blt _021E657E
	movs r0, #2
	strb r0, [r5, #8]
	b _021E65E0
_021E657E:
	movs r7, #0
	movs r6, #0x1a
	adds r4, r5, #0
_021E6584:
	movs r1, #0x10
	movs r0, #0xbe
	ldrsh r1, [r5, r1]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, #0x3c
	adds r2, r6, #0
	bl ov87_021E7FEC
	adds r7, r7, #1
	adds r6, #0x2a
	adds r4, r4, #4
	cmp r7, #4
	blt _021E6584
	movs r7, #0xd1
	movs r6, #0
	adds r4, r5, #0
	lsls r7, r7, #2
_021E65A8:
	ldr r0, [r4, r7]
	movs r1, #0
	bl ov87_021E7FD4
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #3
	blt _021E65A8
	ldr r4, _021E65F8 @ =0x021E82E4
	movs r7, #0
	adds r6, r5, #0
_021E65BE:
	movs r1, #0x10
	movs r2, #0
	ldrsh r1, [r5, r1]
	ldrsh r2, [r4, r2]
	movs r0, #0xc2
	lsls r0, r0, #2
	adds r1, r1, r2
	movs r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r6, r0]
	bl ov87_021E7FEC
	adds r7, r7, #1
	adds r4, r4, #4
	adds r6, r6, #4
	cmp r7, #9
	blt _021E65BE
_021E65E0:
	movs r0, #0x10
	ldrsh r0, [r5, r0]
	adds r0, #0x10
	strh r0, [r5, #0x10]
	b _021E65F4
_021E65EA:
	movs r0, #0
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E65F4:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E65F8: .4byte 0x021E82E4
	thumb_func_end ov87_021E64F8

	thumb_func_start ov87_021E65FC
ov87_021E65FC: @ 0x021E65FC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _021E6612
	cmp r0, #1
	beq _021E661E
	cmp r0, #2
	beq _021E6654
	b _021E6662
_021E6612:
	movs r0, #0xa
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _021E6662
_021E661E:
	ldrb r0, [r4, #0xd]
	subs r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	bne _021E6662
	adds r0, r4, #0
	adds r0, #0x5c
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _021E6662
_021E6654:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E6662
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_021E6662:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov87_021E65FC

	thumb_func_start ov87_021E6668
ov87_021E6668: @ 0x021E6668
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r4, _021E66B4 @ =0x021E82E4
	movs r6, #0
	adds r7, r5, r0
_021E6678:
	ldrh r0, [r4, #2]
	movs r1, #3
	movs r2, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	ldrh r3, [r4]
	adds r0, r7, #0
	bl ov87_021E7F6C
	movs r1, #0xd1
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov87_021E7FD4
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #3
	blt _021E6678
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E66B4: .4byte 0x021E82E4
	thumb_func_end ov87_021E6668

	thumb_func_start ov87_021E66B8
ov87_021E66B8: @ 0x021E66B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r4, _021E6700 @ =0x021E8194
	movs r6, #0
	adds r7, r5, r0
_021E66C8:
	ldrh r0, [r4, #2]
	movs r1, #1
	movs r2, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldrh r3, [r4]
	adds r0, r7, #0
	bl ov87_021E7F6C
	movs r1, #0x35
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov87_021E7FD4
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #3
	blt _021E66C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6700: .4byte 0x021E8194
	thumb_func_end ov87_021E66B8

	thumb_func_start ov87_021E6704
ov87_021E6704: @ 0x021E6704
	push {r4, lr}
	sub sp, #0x10
	movs r1, #0xa0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	adds r1, #0xcc
	str r0, [sp, #0xc]
	adds r0, r4, r1
	movs r1, #3
	movs r3, #0x44
	bl ov87_021E7F6C
	movs r1, #0xcf
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0
	bl ov87_021E7FD4
	movs r3, #0x44
	str r3, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x5b
	str r1, [sp, #0xc]
	lsls r0, r0, #2
	movs r1, #3
	adds r0, r4, r0
	adds r2, r1, #0
	bl ov87_021E7F6C
	movs r1, #0xd
	lsls r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0
	bl ov87_021E7FD4
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov87_021E6704

	thumb_func_start ov87_021E6760
ov87_021E6760: @ 0x021E6760
	push {r4, r5, r6, lr}
	movs r6, #0xcb
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_021E676A:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _021E6774
	bl ov87_021E7FC0
_021E6774:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E676A
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov87_021E6760

	thumb_func_start ov87_021E6780
ov87_021E6780: @ 0x021E6780
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0xbe
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_021E678C:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _021E6796
	bl ov87_021E7FC0
_021E6796:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E678C
	movs r7, #0xc2
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_021E67A6:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _021E67B0
	bl ov87_021E7FC0
_021E67B0:
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #9
	blt _021E67A6
	movs r0, #0xcf
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021E67C6
	bl ov87_021E7FC0
_021E67C6:
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021E67D4
	bl ov87_021E7FC0
_021E67D4:
	movs r7, #0xd1
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_021E67DC:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _021E67E6
	bl ov87_021E7FC0
_021E67E6:
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #3
	blt _021E67DC
	movs r7, #0x35
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #4
_021E67F6:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _021E6800
	bl ov87_021E7FC0
_021E6800:
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #3
	blt _021E67F6
	movs r0, #0xd7
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021E6816
	bl ov87_021E7FC0
_021E6816:
	movs r0, #2
	bl FUN_02002DB4
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #2
	bl FUN_02003150
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_02003150
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02003104
	movs r0, #0x57
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r6, r0]
	adds r0, #0x10
	adds r0, r6, r0
	bl ov87_021E7E98
	ldr r0, [r6, #0x34]
	bl FUN_020164C4
	ldr r0, [r6, #0x38]
	bl FUN_0200BB44
	ldr r0, [r6, #0x3c]
	bl FUN_0200BDA0
	ldr r0, [r6, #0x40]
	bl FUN_02026380
	ldr r0, [r6, #0x44]
	bl FUN_02026380
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_0200CD94
	movs r0, #0xe1
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0201AB0C
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0201AB0C
	adds r0, r6, #0
	adds r0, #0x5c
	bl ov87_021E80F0
	ldr r0, [r6, #0x58]
	bl ov87_021E6BB8
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	bl FUN_0200770C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E6780

	thumb_func_start ov87_021E68A4
ov87_021E68A4: @ 0x021E68A4
	push {r3, lr}
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A120
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E68D4 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E68D8 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_021E68D4: .4byte 0xFFFFE0FF
_021E68D8: .4byte 0x04001000
	thumb_func_end ov87_021E68A4

	thumb_func_start ov87_021E68DC
ov87_021E68DC: @ 0x021E68DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0xcf
	movs r1, #0x7a
	bl FUN_02007688
	movs r1, #0xe
	lsls r1, r1, #6
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov87_021E6B38
	adds r0, r5, #0
	bl ov87_021E6BA8
	movs r1, #0x1b
	movs r0, #1
	lsls r2, r1, #4
	movs r3, #0x7a
	bl FUN_0200BAF8
	str r0, [r5, #0x38]
	movs r0, #0x7a
	bl FUN_0200BD08
	str r0, [r5, #0x3c]
	movs r0, #0x96
	lsls r0, r0, #2
	movs r1, #0x7a
	bl FUN_02026354
	str r0, [r5, #0x40]
	movs r0, #0x96
	lsls r0, r0, #2
	movs r1, #0x7a
	bl FUN_02026354
	movs r1, #0x1a
	str r0, [r5, #0x44]
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x7a
	bl FUN_02003030
	movs r1, #0x1a
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #0x7a
	bl FUN_02003030
	movs r1, #6
	movs r0, #0
	lsls r1, r1, #6
	movs r2, #0x7a
	bl FUN_0200304C
	movs r1, #6
	movs r0, #4
	lsls r1, r1, #6
	movs r2, #0x7a
	bl FUN_0200304C
	movs r0, #2
	movs r1, #0x7a
	bl FUN_02002CEC
	movs r0, #0xf
	movs r1, #0xe
	movs r2, #0
	movs r3, #0x7a
	bl FUN_0200CC74
	movs r1, #0x16
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r1, r5, #0
	ldr r0, [r5, #0x58]
	adds r1, #0x5c
	bl ov87_021E80C0
	movs r0, #0
	movs r1, #1
	movs r2, #0xc
	movs r3, #0x7a
	bl FUN_020163E0
	str r0, [r5, #0x34]
	adds r0, r5, #0
	bl ov87_021E79C4
	adds r0, r5, #0
	bl ov87_021E7A04
	adds r0, r5, #0
	bl ov87_021E7A2C
	bl FUN_02022D24
	movs r7, #0
	movs r6, #0x1a
	adds r4, r5, #0
_021E69A8:
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0x5b
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	adds r2, r7, #0
	movs r3, #0x3c
	bl ov87_021E7F6C
	movs r1, #0xbe
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov87_021E7FD4
	adds r7, r7, #1
	adds r6, #0x2a
	adds r4, r4, #4
	cmp r7, #4
	blt _021E69A8
	ldr r4, _021E6ACC @ =0x021E82E4
	movs r7, #0
	adds r6, r5, #0
_021E69E8:
	ldrh r0, [r4, #2]
	movs r1, #1
	movs r2, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	movs r0, #0x5b
	lsls r0, r0, #2
	ldrh r3, [r4]
	adds r0, r5, r0
	bl ov87_021E7F6C
	movs r1, #0xc2
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r0, r1, #0
	ldr r0, [r6, r0]
	movs r1, #0
	bl ov87_021E7FD4
	adds r7, r7, #1
	adds r4, r4, #4
	adds r6, r6, #4
	cmp r7, #9
	blt _021E69E8
	adds r0, r5, #0
	bl ov87_021E6704
	ldr r4, _021E6AD0 @ =0x021E81A0
	movs r7, #0
	adds r6, r5, #0
_021E6A2E:
	ldrh r0, [r4, #2]
	movs r1, #2
	adds r2, r7, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x5b
	lsls r0, r0, #2
	ldrh r3, [r4]
	adds r0, r5, r0
	bl ov87_021E7F6C
	movs r1, #0xcb
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r0, r1, #0
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r1, #1
	lsls r1, r1, #8
	subs r1, r2, r1
	movs r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r6, r0]
	bl ov87_021E7FEC
	movs r0, #0xcb
	lsls r0, r0, #2
	adds r1, r7, #0
	ldr r0, [r6, r0]
	adds r1, #0x14
	bl ov87_021E7FE0
	adds r7, r7, #1
	adds r4, r4, #4
	adds r6, r6, #4
	cmp r7, #4
	blt _021E6A2E
	movs r0, #0x38
	str r0, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	movs r0, #0x5b
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #4
	movs r3, #0x26
	bl ov87_021E7F6C
	movs r1, #0xd7
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #0
	bl ov87_021E7FD4
	ldr r2, _021E6AD4 @ =0x04000304
	ldr r0, _021E6AD8 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	bl FUN_020210BC
	movs r0, #1
	bl FUN_02021148
	ldr r0, _021E6ADC @ =ov87_021E6C04
	adds r1, r5, #0
	bl FUN_0201A0FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6ACC: .4byte 0x021E82E4
_021E6AD0: .4byte 0x021E81A0
_021E6AD4: .4byte 0x04000304
_021E6AD8: .4byte 0xFFFF7FFF
_021E6ADC: .4byte ov87_021E6C04
	thumb_func_end ov87_021E68DC

	thumb_func_start ov87_021E6AE0
ov87_021E6AE0: @ 0x021E6AE0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x7a
	bl FUN_0201660C
	movs r1, #0x39
	lsls r1, r1, #4
	str r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov87_021E6AE0

	thumb_func_start ov87_021E6AF4
ov87_021E6AF4: @ 0x021E6AF4
	push {lr}
	sub sp, #0x14
	ldr r1, [r0, #0x58]
	movs r3, #0xe
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	lsls r3, r3, #6
	movs r1, #9
	str r3, [sp, #8]
	str r1, [sp, #0xc]
	movs r2, #0x18
	add r1, sp, #0
	strb r2, [r1, #0x10]
	movs r2, #8
	strb r2, [r1, #0x11]
	movs r2, #0
	strb r2, [r1, #0x13]
	adds r3, #0x10
	ldr r0, [r0, r3]
	add r1, sp, #0
	bl FUN_020166FC
	add sp, #0x14
	pop {pc}
	.align 2, 0
	thumb_func_end ov87_021E6AF4

	thumb_func_start ov87_021E6B28
ov87_021E6B28: @ 0x021E6B28
	movs r1, #0x39
	lsls r1, r1, #4
	ldr r3, _021E6B34 @ =FUN_02016624
	ldr r0, [r0, r1]
	bx r3
	nop
_021E6B34: .4byte FUN_02016624
	thumb_func_end ov87_021E6B28

	thumb_func_start ov87_021E6B38
ov87_021E6B38: @ 0x021E6B38
	push {r4, lr}
	adds r4, r0, #0
	bl ov87_021E6C40
	ldr r0, [r4, #0x58]
	bl ov87_021E6C60
	movs r0, #0x7a
	bl FUN_020030E8
	movs r1, #0x57
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #2
	lsls r2, r1, #8
	movs r3, #0x7a
	bl FUN_02003120
	movs r2, #0x57
	lsls r2, r2, #2
	ldr r0, [r4, r2]
	movs r1, #0
	adds r2, #0xa4
	movs r3, #0x7a
	bl FUN_02003120
	adds r0, r4, #0
	movs r1, #7
	bl ov87_021E6DBC
	bl ov87_021E6E44
	adds r0, r4, #0
	movs r1, #6
	bl ov87_021E6E00
	adds r0, r4, #0
	movs r1, #1
	bl ov87_021E6EB0
	bl ov87_021E6E78
	adds r0, r4, #0
	movs r1, #0
	bl ov87_021E6EF4
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	pop {r4, pc}
	thumb_func_end ov87_021E6B38

	thumb_func_start ov87_021E6BA8
ov87_021E6BA8: @ 0x021E6BA8
	movs r1, #0x5b
	lsls r1, r1, #2
	ldr r3, _021E6BB4 @ =ov87_021E7AF8
	adds r0, r0, r1
	bx r3
	nop
_021E6BB4: .4byte ov87_021E7AF8
	thumb_func_end ov87_021E6BA8

	thumb_func_start ov87_021E6BB8
ov87_021E6BB8: @ 0x021E6BB8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x1f
	movs r1, #0
	bl FUN_02022CC8
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201BB4C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov87_021E6BB8

	thumb_func_start ov87_021E6C04
ov87_021E6C04: @ 0x021E6C04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _021E6C36
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E6C1C
	bl FUN_0200398C
_021E6C1C:
	ldr r0, [r4, #0x58]
	bl FUN_0201EEB4
	bl FUN_0202061C
	bl FUN_0200B224
	ldr r3, _021E6C38 @ =0x027E0000
	ldr r1, _021E6C3C @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
_021E6C36:
	pop {r4, pc}
	.align 2, 0
_021E6C38: .4byte 0x027E0000
_021E6C3C: .4byte 0x00003FF8
	thumb_func_end ov87_021E6C04

	thumb_func_start ov87_021E6C40
ov87_021E6C40: @ 0x021E6C40
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E6C5C @ =0x021E8330
	add r3, sp, #0
	movs r2, #5
_021E6C4A:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6C4A
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E6C5C: .4byte 0x021E8330
	thumb_func_end ov87_021E6C40

	thumb_func_start ov87_021E6C60
ov87_021E6C60: @ 0x021E6C60
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	ldr r5, _021E6DA0 @ =0x021E81B0
	add r3, sp, #0xa8
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E6DA4 @ =0x021E8228
	add r3, sp, #0x8c
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
	movs r3, #0x7a
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _021E6DA8 @ =0x021E8260
	add r3, sp, #0x70
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201CAE0
	ldr r5, _021E6DAC @ =0x021E81D4
	add r3, sp, #0x54
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
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201CAE0
	ldr r5, _021E6DB0 @ =0x021E81F0
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _021E6DB4 @ =0x021E820C
	add r3, sp, #0x1c
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #0
	str r0, [r3]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _021E6DB8 @ =0x021E8244
	add r3, sp, #0
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x7a
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201CAE0
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	nop
_021E6DA0: .4byte 0x021E81B0
_021E6DA4: .4byte 0x021E8228
_021E6DA8: .4byte 0x021E8260
_021E6DAC: .4byte 0x021E81D4
_021E6DB0: .4byte 0x021E81F0
_021E6DB4: .4byte 0x021E820C
_021E6DB8: .4byte 0x021E8244
	thumb_func_end ov87_021E6C60

	thumb_func_start ov87_021E6DBC
ov87_021E6DBC: @ 0x021E6DBC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7a
	str r0, [sp, #0xc]
	adds r4, r1, #0
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	movs r1, #0x23
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7a
	str r0, [sp, #0xc]
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	movs r1, #0x25
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E6DBC

	thumb_func_start ov87_021E6E00
ov87_021E6E00: @ 0x021E6E00
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7a
	str r0, [sp, #0xc]
	adds r4, r1, #0
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	movs r1, #0x26
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7a
	str r0, [sp, #0xc]
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	movs r1, #0x28
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E6E00

	thumb_func_start ov87_021E6E44
ov87_021E6E44: @ 0x021E6E44
	push {r3, r4, lr}
	sub sp, #4
	movs r0, #0xcf
	movs r1, #0x22
	add r2, sp, #0
	movs r3, #0x7a
	bl FUN_020079F4
	adds r4, r0, #0
	ldr r0, [sp]
	movs r1, #0xa0
	ldr r0, [r0, #0xc]
	blx FUN_020D2894
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0, #0xc]
	movs r2, #0xa0
	blx FUN_020CFCC0
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov87_021E6E44

	thumb_func_start ov87_021E6E78
ov87_021E6E78: @ 0x021E6E78
	push {r3, r4, lr}
	sub sp, #4
	movs r0, #0xcf
	movs r1, #0
	add r2, sp, #0
	movs r3, #0x7a
	bl FUN_020079F4
	adds r4, r0, #0
	ldr r0, [sp]
	movs r1, #6
	ldr r0, [r0, #0xc]
	lsls r1, r1, #6
	blx FUN_020D2894
	ldr r0, [sp]
	movs r2, #6
	ldr r0, [r0, #0xc]
	movs r1, #0
	lsls r2, r2, #6
	blx FUN_020CFC6C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov87_021E6E78

	thumb_func_start ov87_021E6EB0
ov87_021E6EB0: @ 0x021E6EB0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7a
	str r0, [sp, #0xc]
	adds r4, r1, #0
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	movs r1, #4
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7a
	str r0, [sp, #0xc]
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	movs r1, #6
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E6EB0

	thumb_func_start ov87_021E6EF4
ov87_021E6EF4: @ 0x021E6EF4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7a
	str r0, [sp, #0xc]
	adds r4, r1, #0
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	movs r1, #7
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7a
	str r0, [sp, #0xc]
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	movs r1, #9
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E6EF4

	thumb_func_start ov87_021E6F38
ov87_021E6F38: @ 0x021E6F38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	add r1, sp, #0x38
	ldrb r1, [r1]
	adds r5, r0, #0
	adds r0, r4, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0201D978
	ldr r0, [r5, #0x38]
	ldr r2, [r5, #0x44]
	adds r1, r6, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x40]
	ldr r2, [r5, #0x44]
	bl FUN_0200CBBC
	ldr r0, [sp, #0x28]
	add r2, sp, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	adds r3, r7, #0
	str r0, [sp, #4]
	add r0, sp, #0x38
	ldrb r1, [r0]
	ldrb r0, [r2, #0x18]
	ldrb r2, [r2, #0x1c]
	lsls r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r0, r0, #8
	lsrs r2, r2, #0x10
	orrs r0, r2
	orrs r0, r1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x3c
	ldrb r1, [r1]
	ldr r2, [r5, #0x40]
	adds r0, r4, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E6F38

	thumb_func_start ov87_021E6F98
ov87_021E6F98: @ 0x021E6F98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	add r1, sp, #0x38
	ldrb r1, [r1]
	adds r5, r0, #0
	adds r0, r4, #0
	adds r7, r2, #0
	adds r6, r3, #0
	bl FUN_0201D978
	ldr r0, [r5, #0x38]
	ldr r2, [r5, #0x44]
	adds r1, r7, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x40]
	ldr r2, [r5, #0x44]
	bl FUN_0200CBBC
	add r0, sp, #0x3c
	ldrb r0, [r0]
	ldr r1, [r5, #0x40]
	movs r2, #0
	bl FUN_02002F30
	adds r0, r0, #1
	lsrs r0, r0, #1
	subs r3, r6, r0
	ldr r0, [sp, #0x28]
	add r2, sp, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #0x38
	ldrb r1, [r0]
	ldrb r0, [r2, #0x18]
	ldrb r2, [r2, #0x1c]
	lsls r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r0, r0, #8
	lsrs r2, r2, #0x10
	orrs r0, r2
	orrs r0, r1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x3c
	ldrb r1, [r1]
	ldr r2, [r5, #0x40]
	adds r0, r4, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E6F98

	thumb_func_start ov87_021E7008
ov87_021E7008: @ 0x021E7008
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	adds r1, r4, #0
	ldr r0, [r4, #0x58]
	adds r1, #0x5c
	bl ov87_021E810C
	movs r3, #1
	str r3, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r3, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r1, r4, #0
	adds r0, r4, #0
	adds r1, #0x5c
	movs r2, #6
	bl ov87_021E6F38
	adds r4, #0x5c
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E7008

	thumb_func_start ov87_021E7048
ov87_021E7048: @ 0x021E7048
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldrb r2, [r5, #0xe]
	movs r1, #0
	adds r2, r2, #1
	bl ov87_021E7244
	movs r3, #1
	movs r1, #0x53
	lsls r1, r1, #2
	str r3, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r2, #0xc
	str r3, [sp, #0x14]
	bl ov87_021E6F38
	adds r4, r0, #0
	movs r0, #0x53
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E7048

	thumb_func_start ov87_021E708C
ov87_021E708C: @ 0x021E708C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldrb r2, [r4, #0xe]
	movs r1, #0
	adds r2, r2, #1
	bl ov87_021E7244
	movs r0, #5
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r1, r4, #0
	adds r0, r4, #0
	adds r1, #0xfc
	movs r2, #9
	movs r3, #0x30
	bl ov87_021E6F98
	adds r4, #0xfc
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov87_021E708C

	thumb_func_start ov87_021E70D0
ov87_021E70D0: @ 0x021E70D0
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0x35
	adds r5, r0, #0
	movs r4, #0
	lsls r7, r7, #4
_021E70DA:
	ldr r1, _021E712C @ =0x000003A2
	adds r2, r5, r4
	ldrb r1, [r2, r1]
	lsls r0, r4, #2
	adds r6, r5, r0
	adds r2, r5, r1
	movs r1, #0x36
	movs r0, #0x35
	lsls r1, r1, #4
	lsls r0, r0, #4
	ldrb r1, [r2, r1]
	ldr r0, [r6, r0]
	bl ov87_021E803C
	ldr r0, [r6, r7]
	movs r1, #1
	bl ov87_021E7FD4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _021E70DA
	movs r0, #0xd7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov87_021E7FD4
	movs r0, #0xd7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov87_021E8084
	ldr r0, _021E7130 @ =0x00000561
	bl FUN_0200604C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E712C: .4byte 0x000003A2
_021E7130: .4byte 0x00000561
	thumb_func_end ov87_021E70D0

	thumb_func_start ov87_021E7134
ov87_021E7134: @ 0x021E7134
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, _021E7178 @ =0x000005F3
	bl FUN_0200604C
	movs r0, #5
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	movs r1, #0x47
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r1, r5, r1
	movs r2, #0xb
	movs r3, #0x30
	bl ov87_021E6F98
	adds r4, r0, #0
	movs r0, #0x47
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_021E7178: .4byte 0x000005F3
	thumb_func_end ov87_021E7134

	thumb_func_start ov87_021E717C
ov87_021E717C: @ 0x021E717C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	movs r2, #1
	str r2, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #2
	str r1, [sp, #0x14]
	movs r1, #0x4b
	adds r5, r0, #0
	lsls r1, r1, #2
	adds r1, r5, r1
	movs r2, #4
	movs r3, #0x30
	bl ov87_021E6F98
	adds r4, r0, #0
	movs r0, #0x4b
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E717C

	thumb_func_start ov87_021E71B4
ov87_021E71B4: @ 0x021E71B4
	push {r3, r4, r5, lr}
	sub sp, #0x18
	movs r2, #1
	str r2, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #2
	str r1, [sp, #0x14]
	movs r1, #0x4f
	adds r5, r0, #0
	lsls r1, r1, #2
	adds r1, r5, r1
	movs r2, #5
	movs r3, #0x18
	bl ov87_021E6F98
	adds r4, r0, #0
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E71B4

	thumb_func_start ov87_021E71EC
ov87_021E71EC: @ 0x021E71EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r1, #0
	adds r6, r0, #0
	lsls r2, r7, #1
	adds r3, r6, r2
	ldr r2, _021E723C @ =0x0000036A
	ldr r0, [r6, #0x3c]
	ldrh r2, [r3, r2]
	movs r1, #0
	bl FUN_0200C0CC
	adds r0, r7, #2
	lsls r4, r0, #4
	ldr r0, _021E7240 @ =0x021E8388
	adds r5, r6, #0
	ldrb r0, [r0, r7]
	movs r1, #0
	movs r2, #1
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r5, #0x5c
	str r1, [sp, #0x14]
	adds r0, r6, #0
	adds r1, r5, r4
	movs r3, #0x2c
	bl ov87_021E6F98
	adds r6, r0, #0
	adds r0, r5, r4
	bl FUN_0201D5C8
	adds r0, r6, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E723C: .4byte 0x0000036A
_021E7240: .4byte 0x021E8388
	thumb_func_end ov87_021E71EC

	thumb_func_start ov87_021E7244
ov87_021E7244: @ 0x021E7244
	push {r3, lr}
	sub sp, #8
	movs r3, #0
	str r3, [sp]
	movs r3, #1
	str r3, [sp, #4]
	ldr r0, [r0, #0x3c]
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov87_021E7244

	thumb_func_start ov87_021E725C
ov87_021E725C: @ 0x021E725C
	movs r3, #0
	strb r3, [r0, #8]
	str r2, [r1]
	bx lr
	thumb_func_end ov87_021E725C

	thumb_func_start ov87_021E7264
ov87_021E7264: @ 0x021E7264
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0x36
	adds r5, r0, #0
	movs r4, #0
	movs r6, #4
	lsls r7, r7, #4
_021E7270:
	bl FUN_0201FD44
	movs r1, #9
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, r0
	ldrb r0, [r1, r7]
	cmp r0, #0xb0
	bne _021E7270
	movs r0, #0x36
	lsls r0, r0, #4
	adds r4, r4, #1
	strb r6, [r1, r0]
	cmp r4, #2
	blt _021E7270
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E7264

	thumb_func_start ov87_021E7294
ov87_021E7294: @ 0x021E7294
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl FUN_0201FD44
	movs r7, #0
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r4, r7, #0
_021E72B0:
	bl FUN_0201FD44
	movs r1, #9
	blx FUN_020F2998
	movs r0, #0x36
	adds r2, r5, r1
	lsls r0, r0, #4
	ldrb r1, [r2, r0]
	cmp r1, #0xb0
	bne _021E72E4
	movs r7, #0
	strb r6, [r2, r0]
	cmp r4, #2
	beq _021E72D6
	cmp r4, #4
	beq _021E72D6
	cmp r4, #6
	bne _021E731C
_021E72D6:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #4
	bne _021E731C
	movs r6, #0
	b _021E731C
_021E72E4:
	adds r7, r7, #1
	cmp r7, #0x1e
	blt _021E72B0
	movs r7, #0
	adds r3, r7, #0
_021E72EE:
	adds r2, r5, r3
	ldrb r1, [r2, r0]
	cmp r1, #0xb0
	bne _021E7316
	movs r0, #0x36
	lsls r0, r0, #4
	strb r6, [r2, r0]
	cmp r4, #2
	beq _021E7308
	cmp r4, #4
	beq _021E7308
	cmp r4, #6
	bne _021E731C
_021E7308:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #4
	bne _021E731C
	movs r6, #0
	b _021E731C
_021E7316:
	adds r3, r3, #1
	cmp r3, #9
	blt _021E72EE
_021E731C:
	adds r4, r4, #1
	cmp r4, #9
	blt _021E72B0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E7294

	thumb_func_start ov87_021E7324
ov87_021E7324: @ 0x021E7324
	push {r4, lr}
	adds r4, r0, #0
	bl ov87_021E7264
	adds r0, r4, #0
	bl ov87_021E7294
	pop {r4, pc}
	thumb_func_end ov87_021E7324

	thumb_func_start ov87_021E7334
ov87_021E7334: @ 0x021E7334
	push {r3, r4}
	movs r1, #0x36
	movs r4, #0
	movs r3, #0xb0
	lsls r1, r1, #4
_021E733E:
	adds r2, r0, r4
	adds r4, r4, #1
	strb r3, [r2, r1]
	cmp r4, #9
	blt _021E733E
	pop {r3, r4}
	bx lr
	thumb_func_end ov87_021E7334

	thumb_func_start ov87_021E734C
ov87_021E734C: @ 0x021E734C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	movs r1, #0
	add r2, sp, #8
	movs r0, #0xff
_021E7358:
	adds r1, r1, #1
	strh r0, [r2]
	adds r2, r2, #2
	cmp r1, #4
	blt _021E7358
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	add r4, sp, #8
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r5, #0
	adds r6, r4, #0
	movs r7, #0x17
_021E7380:
	ldr r0, [sp, #4]
	cmp r5, r0
	bne _021E7390
	ldr r1, [sp]
	ldr r0, _021E73D8 @ =0x0000036A
	movs r2, #0x5c
	strh r2, [r1, r0]
	b _021E73C6
_021E7390:
	bl FUN_0201FD44
	adds r1, r7, #0
	blx FUN_020F2BA4
	strh r1, [r4]
	movs r1, #0
	cmp r5, #0
	ble _021E73B4
	ldrh r3, [r4]
	adds r2, r6, #0
_021E73A6:
	ldrh r0, [r2]
	cmp r0, r3
	beq _021E73B4
	adds r1, r1, #1
	adds r2, r2, #2
	cmp r1, r5
	blt _021E73A6
_021E73B4:
	cmp r1, r5
	bne _021E7390
	ldrh r0, [r4]
	lsls r1, r0, #1
	ldr r0, _021E73DC @ =0x021E8358
	ldrh r2, [r0, r1]
	ldr r1, [sp]
	ldr r0, _021E73D8 @ =0x0000036A
	strh r2, [r1, r0]
_021E73C6:
	ldr r0, [sp]
	adds r5, r5, #1
	adds r0, r0, #2
	adds r4, r4, #2
	str r0, [sp]
	cmp r5, #4
	blt _021E7380
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E73D8: .4byte 0x0000036A
_021E73DC: .4byte 0x021E8358
	thumb_func_end ov87_021E734C

	thumb_func_start ov87_021E73E0
ov87_021E73E0: @ 0x021E73E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x3a
	lsls r0, r0, #4
	adds r4, r1, #0
	ldrb r1, [r5, r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	cmp r1, #8
	blo _021E73FC
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E73FC:
	subs r0, #0x74
	adds r0, r5, r0
	str r0, [sp]
	ldr r1, [sp]
	lsls r0, r4, #2
	str r0, [sp, #4]
	ldr r0, [r1, r0]
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov87_021E8014
	movs r0, #0x3a
	lsls r0, r0, #4
	ldrb r0, [r5, r0]
	lsls r2, r4, #3
	ldr r4, _021E7458 @ =0x021E838C
	lsls r1, r0, #0x18
	lsrs r6, r1, #0x19
	ldrsb r7, [r4, r6]
	movs r4, #0xfe
	bics r0, r4
	adds r4, r6, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _021E745C @ =0x021E827C
	lsls r4, r4, #0x19
	adds r1, r1, r2
	lsrs r4, r4, #0x18
	ldr r2, [sp, #8]
	orrs r4, r0
	movs r0, #0x3a
	ldr r3, [sp, #0xc]
	lsls r0, r0, #4
	strb r4, [r5, r0]
	ldrsb r1, [r6, r1]
	ldr r4, [sp]
	ldr r0, [sp, #4]
	adds r1, r3, r1
	ldr r0, [r4, r0]
	adds r2, r2, r7
	bl ov87_021E7FEC
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7458: .4byte 0x021E838C
_021E745C: .4byte 0x021E827C
	thumb_func_end ov87_021E73E0

	thumb_func_start ov87_021E7460
ov87_021E7460: @ 0x021E7460
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	str r3, [sp]
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	adds r4, r1, #0
	lsls r1, r4, #0x18
	str r0, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0
	ldr r0, [r5, #0x58]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201CA4C
	lsls r1, r4, #0x18
	ldr r0, [r5, #0x58]
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov87_021E7460

	thumb_func_start ov87_021E7490
ov87_021E7490: @ 0x021E7490
	push {r3, r4}
	movs r4, #0
	movs r2, #0xe5
	adds r3, r4, #0
	lsls r2, r2, #2
_021E749A:
	adds r1, r0, r3
	ldrb r1, [r1, r2]
	cmp r1, #1
	bne _021E74A8
	adds r1, r4, #1
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
_021E74A8:
	adds r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #9
	blo _021E749A
	adds r0, r4, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov87_021E7490

	thumb_func_start ov87_021E74B8
ov87_021E74B8: @ 0x021E74B8
	push {r3, r4}
	movs r4, #0
	movs r1, #0xe5
	adds r3, r4, #0
	lsls r1, r1, #2
_021E74C2:
	adds r2, r0, r4
	strb r3, [r2, r1]
	adds r2, r4, #1
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #9
	blo _021E74C2
	pop {r3, r4}
	bx lr
	thumb_func_end ov87_021E74B8

	thumb_func_start ov87_021E74D4
ov87_021E74D4: @ 0x021E74D4
	push {r3, r4}
	movs r4, #0
	ldr r1, _021E74F0 @ =0x000003A5
	adds r3, r4, #0
_021E74DC:
	adds r2, r0, r4
	strb r3, [r2, r1]
	adds r2, r4, #1
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #9
	blo _021E74DC
	pop {r3, r4}
	bx lr
	nop
_021E74F0: .4byte 0x000003A5
	thumb_func_end ov87_021E74D4

	thumb_func_start ov87_021E74F4
ov87_021E74F4: @ 0x021E74F4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xee
	lsls r0, r0, #2
	ldrh r0, [r7, r0]
	movs r6, #0
	cmp r0, #0
	ble _021E7544
	ldr r2, _021E7548 @ =0x021E829C
	lsls r0, r1, #2
	adds r5, r2, r0
	ldrb r0, [r5, #2]
	adds r4, r7, #0
	str r0, [sp]
_021E7510:
	ldr r0, _021E754C @ =0x000003BA
	ldrh r1, [r4, r0]
	adds r0, r0, #2
	ldrh r2, [r4, r0]
	ldr r0, [sp]
	cmp r0, r1
	bgt _021E7536
	ldrb r0, [r5, #3]
	cmp r1, r0
	bgt _021E7536
	ldrb r0, [r5]
	cmp r0, r2
	bgt _021E7536
	ldrb r0, [r5, #1]
	cmp r2, r0
	bgt _021E7536
	adds r0, r7, #0
	bl ov87_021E7A44
_021E7536:
	movs r0, #0xee
	lsls r0, r0, #2
	ldrh r0, [r7, r0]
	adds r6, r6, #1
	adds r4, #8
	cmp r6, r0
	blt _021E7510
_021E7544:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7548: .4byte 0x021E829C
_021E754C: .4byte 0x000003BA
	thumb_func_end ov87_021E74F4

	thumb_func_start ov87_021E7550
ov87_021E7550: @ 0x021E7550
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0xee
	lsls r0, r0, #2
	ldrh r0, [r5, r0]
	movs r6, #0
	cmp r0, #0
	ble _021E7588
	movs r7, #0xee
	adds r4, r5, #0
	lsls r7, r7, #2
_021E7566:
	ldr r1, _021E758C @ =0x000003BA
	movs r2, #0xef
	lsls r2, r2, #2
	ldrh r1, [r4, r1]
	ldrh r2, [r4, r2]
	adds r0, r5, #0
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl ov87_021E7590
	ldrh r0, [r5, r7]
	adds r6, r6, #1
	adds r4, #8
	cmp r6, r0
	blt _021E7566
_021E7588:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E758C: .4byte 0x000003BA
	thumb_func_end ov87_021E7550

	thumb_func_start ov87_021E7590
ov87_021E7590: @ 0x021E7590
	push {r3, r4, r5, r6, r7, lr}
	adds r3, r1, #0
	movs r7, #2
	mvns r7, r7
	adds r0, r0, r3
	ldr r6, _021E75DC @ =0x000003FA
	str r2, [sp]
	mov lr, r0
	movs r5, #1
	mov ip, r7
_021E75A4:
	ldr r1, [sp]
	movs r2, #0xf0
	adds r1, r1, r7
	adds r4, r1, #0
	muls r4, r2, r4
	mov r2, lr
	adds r2, r2, r4
	mov r0, ip
	subs r4, r2, #3
_021E75B6:
	adds r2, r3, r0
	cmp r2, #0
	ble _021E75CA
	cmp r2, #0xf0
	bge _021E75CA
	cmp r1, #0
	ble _021E75CA
	cmp r1, #0xa0
	bge _021E75CA
	strb r5, [r4, r6]
_021E75CA:
	adds r0, r0, #1
	adds r4, r4, #1
	cmp r0, #3
	blt _021E75B6
	adds r7, r7, #1
	cmp r7, #3
	blt _021E75A4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E75DC: .4byte 0x000003FA
	thumb_func_end ov87_021E7590

	thumb_func_start ov87_021E75E0
ov87_021E75E0: @ 0x021E75E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #4]
	str r0, [sp]
	ldr r0, [sp, #4]
	movs r4, #0
	lsls r1, r0, #2
	ldr r0, _021E7680 @ =0x021E82C0
	ldrsh r7, [r0, r1]
	ldr r0, _021E7684 @ =0x021E82C2
	ldrsh r0, [r0, r1]
	str r0, [sp, #8]
	adds r0, #0x14
	ldr r1, [sp, #8]
	mov ip, r0
	cmp r1, r0
	bge _021E763A
	ldr r0, [sp, #8]
	adds r2, r7, #0
	adds r6, r0, #0
	movs r1, #0xf0
	ldr r0, _021E7688 @ =0x000003FA
	muls r6, r1, r6
	adds r2, #0x19
_021E7610:
	adds r3, r7, #0
	cmp r7, r2
	bge _021E762C
	ldr r1, [sp]
	adds r1, r1, r6
	adds r5, r1, r7
_021E761C:
	ldrb r1, [r5, r0]
	cmp r1, #1
	bne _021E7624
	adds r4, r4, #1
_021E7624:
	adds r3, r3, #1
	adds r5, r5, #1
	cmp r3, r2
	blt _021E761C
_021E762C:
	ldr r1, [sp, #8]
	adds r6, #0xf0
	adds r3, r1, #1
	mov r1, ip
	str r3, [sp, #8]
	cmp r3, r1
	blt _021E7610
_021E763A:
	movs r0, #0x5f
	lsls r0, r0, #2
	cmp r4, r0
	blt _021E7678
	ldr r1, _021E768C @ =0x000003A5
	ldr r0, [sp]
	adds r4, r0, r1
	ldr r0, [sp, #4]
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021E766E
	ldr r0, _021E7690 @ =0x000005E2
	bl FUN_0200604C
	ldr r0, _021E7694 @ =0x000003A1
	ldr r1, [sp]
	ldrb r2, [r1, r0]
	adds r3, r1, r2
	ldr r1, [sp, #4]
	adds r2, r0, #1
	strb r1, [r3, r2]
	ldr r1, [sp]
	ldrb r1, [r1, r0]
	adds r2, r1, #1
	ldr r1, [sp]
	strb r2, [r1, r0]
_021E766E:
	ldr r1, [sp, #4]
	movs r0, #1
	add sp, #0xc
	strb r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_021E7678:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E7680: .4byte 0x021E82C0
_021E7684: .4byte 0x021E82C2
_021E7688: .4byte 0x000003FA
_021E768C: .4byte 0x000003A5
_021E7690: .4byte 0x000005E2
_021E7694: .4byte 0x000003A1
	thumb_func_end ov87_021E75E0

	thumb_func_start ov87_021E7698
ov87_021E7698: @ 0x021E7698
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _021E7720 @ =0x0000039E
	adds r6, r0, #0
	ldrb r0, [r6, r2]
	adds r0, r0, #1
	strb r0, [r6, r2]
	ldrb r0, [r6, r2]
	cmp r0, #1
	blo _021E771C
	movs r0, #0
	strb r0, [r6, r2]
	subs r1, r2, #1
	ldrb r1, [r6, r1]
	adds r3, r1, #1
	subs r1, r2, #1
	strb r3, [r6, r1]
	ldrb r1, [r6, r1]
	cmp r1, #8
	blo _021E76C2
	subs r1, r2, #1
	strb r0, [r6, r1]
_021E76C2:
	ldr r0, _021E7724 @ =0x000003A1
	ldrb r0, [r6, r0]
	cmp r0, #2
	bne _021E770E
	ldr r7, _021E7728 @ =0x021E82E4
	movs r4, #0
	adds r5, r6, #0
_021E76D0:
	movs r0, #0xd1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl ov87_021E8078
	movs r0, #0xd1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov87_021E7FD4
	ldr r0, _021E772C @ =0x000003A2
	adds r1, r6, r4
	ldrb r0, [r1, r0]
	movs r2, #2
	lsls r1, r0, #2
	adds r3, r7, r1
	movs r0, #0xd1
	ldrsh r1, [r7, r1]
	ldrsh r2, [r3, r2]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	subs r1, #0x24
	subs r2, #0xa
	bl ov87_021E7FEC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _021E76D0
_021E770E:
	ldr r1, _021E7730 @ =0x0000039D
	movs r0, #0x5b
	ldrb r1, [r6, r1]
	lsls r0, r0, #2
	adds r0, r6, r0
	bl ov87_021E7F28
_021E771C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7720: .4byte 0x0000039E
_021E7724: .4byte 0x000003A1
_021E7728: .4byte 0x021E82E4
_021E772C: .4byte 0x000003A2
_021E7730: .4byte 0x0000039D
	thumb_func_end ov87_021E7698

	thumb_func_start ov87_021E7734
ov87_021E7734: @ 0x021E7734
	push {r4, r5}
	ldr r1, _021E7880 @ =0x000003A1
	movs r3, #0
	ldrb r2, [r0, r1]
	cmp r2, #1
	bhi _021E7746
	adds r0, r3, #0
	pop {r4, r5}
	bx lr
_021E7746:
	adds r2, r1, #2
	ldrb r2, [r0, r2]
	adds r4, r0, r2
	adds r2, r1, #0
	subs r2, #0x41
	ldrb r2, [r4, r2]
	adds r4, r1, #1
	ldrb r4, [r0, r4]
	adds r5, r0, r4
	adds r4, r1, #0
	subs r4, #0x41
	ldrb r4, [r5, r4]
	cmp r4, r2
	bne _021E7774
	subs r2, r1, #1
	ldrb r4, [r0, r2]
	movs r2, #1
	subs r1, r1, #1
	bics r4, r2
	movs r2, #1
	orrs r2, r4
	strb r2, [r0, r1]
	b _021E779E
_021E7774:
	cmp r4, #4
	bne _021E778A
	subs r2, r1, #1
	ldrb r4, [r0, r2]
	movs r2, #1
	subs r1, r1, #1
	bics r4, r2
	movs r2, #1
	orrs r2, r4
	strb r2, [r0, r1]
	b _021E779E
_021E778A:
	cmp r2, #4
	bne _021E779E
	subs r2, r1, #1
	ldrb r4, [r0, r2]
	movs r2, #1
	subs r1, r1, #1
	bics r4, r2
	movs r2, #1
	orrs r2, r4
	strb r2, [r0, r1]
_021E779E:
	ldr r1, _021E7880 @ =0x000003A1
	ldrb r2, [r0, r1]
	cmp r2, #2
	bhi _021E77AC
	movs r0, #0
	pop {r4, r5}
	bx lr
_021E77AC:
	adds r2, r1, #2
	ldrb r2, [r0, r2]
	adds r4, r0, r2
	adds r2, r1, #0
	subs r2, #0x41
	ldrb r4, [r4, r2]
	adds r2, r1, #1
	ldrb r2, [r0, r2]
	adds r5, r0, r2
	adds r2, r1, #0
	subs r2, #0x41
	ldrb r2, [r5, r2]
	cmp r2, r4
	bne _021E77D8
	adds r5, r1, #3
	ldrb r5, [r0, r5]
	subs r1, #0x41
	adds r5, r0, r5
	ldrb r1, [r5, r1]
	cmp r2, r1
	bne _021E77D8
	movs r3, #1
_021E77D8:
	cmp r2, #4
	bne _021E77E2
	cmp r4, #4
	bne _021E77E2
	movs r3, #1
_021E77E2:
	cmp r2, #4
	bne _021E77F8
	movs r1, #0xe9
	lsls r1, r1, #2
	ldrb r5, [r0, r1]
	subs r1, #0x44
	adds r5, r0, r5
	ldrb r1, [r5, r1]
	cmp r1, #4
	bne _021E77F8
	movs r3, #1
_021E77F8:
	cmp r4, #4
	bne _021E780E
	movs r1, #0xe9
	lsls r1, r1, #2
	ldrb r5, [r0, r1]
	subs r1, #0x44
	adds r5, r0, r5
	ldrb r1, [r5, r1]
	cmp r1, #4
	bne _021E780E
	movs r3, #1
_021E780E:
	cmp r2, #4
	bne _021E7824
	movs r1, #0xe9
	lsls r1, r1, #2
	ldrb r5, [r0, r1]
	subs r1, #0x44
	adds r5, r0, r5
	ldrb r1, [r5, r1]
	cmp r4, r1
	bne _021E7824
	movs r3, #1
_021E7824:
	cmp r4, #4
	bne _021E783A
	movs r1, #0xe9
	lsls r1, r1, #2
	ldrb r5, [r0, r1]
	subs r1, #0x44
	adds r5, r0, r5
	ldrb r1, [r5, r1]
	cmp r2, r1
	bne _021E783A
	movs r3, #1
_021E783A:
	movs r1, #0xe9
	lsls r1, r1, #2
	ldrb r5, [r0, r1]
	subs r1, #0x44
	adds r5, r0, r5
	ldrb r1, [r5, r1]
	cmp r1, #4
	bne _021E7850
	cmp r2, r4
	bne _021E7850
	movs r3, #1
_021E7850:
	cmp r3, #1
	bne _021E787A
	ldr r1, _021E7884 @ =0x000003A2
	movs r4, #0
	adds r2, r1, #0
	subs r2, #0x42
_021E785C:
	adds r3, r0, r4
	ldrb r3, [r3, r1]
	adds r3, r0, r3
	ldrb r3, [r3, r2]
	cmp r3, #4
	beq _021E786E
	ldr r1, _021E7888 @ =0x0000039F
	strb r3, [r0, r1]
	b _021E7874
_021E786E:
	adds r4, r4, #1
	cmp r4, #3
	blt _021E785C
_021E7874:
	movs r0, #1
	pop {r4, r5}
	bx lr
_021E787A:
	movs r0, #0
	pop {r4, r5}
	bx lr
	.align 2, 0
_021E7880: .4byte 0x000003A1
_021E7884: .4byte 0x000003A2
_021E7888: .4byte 0x0000039F
	thumb_func_end ov87_021E7734

	thumb_func_start ov87_021E788C
ov87_021E788C: @ 0x021E788C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0
	movs r7, #0x36
	adds r4, r0, #0
	adds r5, r6, #0
	lsls r7, r7, #4
_021E789A:
	ldr r1, _021E78D0 @ =0x000003A2
	adds r2, r6, r4
	ldrb r1, [r2, r1]
	adds r1, r6, r1
	ldrb r1, [r1, r7]
	cmp r1, #4
	bne _021E78B6
	movs r0, #0x35
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov87_021E80A8
	movs r0, #1
_021E78B6:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _021E789A
	movs r1, #0
	strb r1, [r6, #0x14]
	ldrb r2, [r6, #0x14]
	lsls r1, r2, #4
	orrs r2, r1
	ldr r1, _021E78D4 @ =0x0400004D
	strb r2, [r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E78D0: .4byte 0x000003A2
_021E78D4: .4byte 0x0400004D
	thumb_func_end ov87_021E788C

	thumb_func_start ov87_021E78D8
ov87_021E78D8: @ 0x021E78D8
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _021E7980 @ =0x000003A2
	adds r5, r0, #0
	adds r3, r2, #0
	movs r0, #0
	subs r3, #0x42
_021E78E4:
	adds r4, r5, r0
	ldrb r4, [r4, r2]
	adds r4, r5, r4
	ldrb r4, [r4, r3]
	cmp r4, #4
	beq _021E78F6
	adds r0, r0, #1
	cmp r0, #3
	blt _021E78E4
_021E78F6:
	cmp r0, #3
	bne _021E78FE
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E78FE:
	cmp r1, #0
	ldrb r0, [r5, #0x14]
	bne _021E794A
	cmp r0, #0
	bne _021E790E
	ldr r0, _021E7984 @ =0x00000563
	bl FUN_0200604C
_021E790E:
	ldrb r0, [r5, #0x14]
	cmp r0, #4
	bhs _021E791A
	adds r0, r0, #1
	strb r0, [r5, #0x14]
	b _021E7970
_021E791A:
	movs r7, #0x36
	movs r4, #0
	adds r6, r5, #0
	lsls r7, r7, #4
_021E7922:
	ldr r0, _021E7980 @ =0x000003A2
	adds r1, r5, r4
	ldrb r0, [r1, r0]
	adds r0, r5, r0
	ldrb r0, [r0, r7]
	cmp r0, #4
	bne _021E793E
	ldr r1, _021E7988 @ =0x0000039F
	movs r0, #0x35
	lsls r0, r0, #4
	ldrb r1, [r5, r1]
	ldr r0, [r6, r0]
	bl ov87_021E803C
_021E793E:
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #3
	blt _021E7922
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E794A:
	cmp r0, #0
	beq _021E7954
	subs r0, r0, #1
	strb r0, [r5, #0x14]
	b _021E7970
_021E7954:
	movs r4, #0
	movs r6, #0x35
	adds r7, r4, #0
	lsls r6, r6, #4
_021E795C:
	ldr r0, [r5, r6]
	adds r1, r7, #0
	bl ov87_021E80A8
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _021E795C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E7970:
	ldrb r1, [r5, #0x14]
	lsls r0, r1, #4
	orrs r1, r0
	ldr r0, _021E798C @ =0x0400004D
	strb r1, [r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7980: .4byte 0x000003A2
_021E7984: .4byte 0x00000563
_021E7988: .4byte 0x0000039F
_021E798C: .4byte 0x0400004D
	thumb_func_end ov87_021E78D8

	thumb_func_start ov87_021E7990
ov87_021E7990: @ 0x021E7990
	ldrb r1, [r0, #0xe]
	adds r1, r1, #1
	strb r1, [r0, #0xe]
	bx lr
	thumb_func_end ov87_021E7990

	thumb_func_start ov87_021E7998
ov87_021E7998: @ 0x021E7998
	ldrb r1, [r0, #0xe]
	adds r1, r1, #1
	strb r1, [r0, #0xe]
	bx lr
	thumb_func_end ov87_021E7998

	thumb_func_start ov87_021E79A0
ov87_021E79A0: @ 0x021E79A0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov87_021E7FD4
	adds r0, r4, #0
	adds r0, #0xfc
	movs r1, #0
	bl FUN_0201D978
	adds r4, #0xfc
	adds r0, r4, #0
	bl FUN_0201D5C8
	pop {r4, pc}
	thumb_func_end ov87_021E79A0

	thumb_func_start ov87_021E79C4
ov87_021E79C4: @ 0x021E79C4
	push {r3, r4, lr}
	sub sp, #4
	movs r3, #0xe2
	adds r4, r0, #0
	movs r0, #0x7a
	lsls r3, r3, #2
	str r0, [sp]
	movs r0, #0xcf
	movs r1, #7
	movs r2, #0
	adds r3, r4, r3
	bl FUN_020079BC
	movs r1, #0xe1
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #4
	ldr r3, [r4, r0]
	movs r1, #0
	str r1, [sp]
	ldr r2, [r3, #0x14]
	ldr r0, [r4, #0x58]
	ldr r3, [r3, #0x10]
	bl FUN_0201C0C0
	ldr r0, [r4, #0x58]
	movs r1, #0
	bl FUN_0201BF7C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov87_021E79C4

	thumb_func_start ov87_021E7A04
ov87_021E7A04: @ 0x021E7A04
	push {r4, lr}
	movs r1, #0xe2
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	movs r0, #0x7a
	ldr r1, [r1, #0x10]
	bl FUN_0201AA8C
	movs r1, #0xe3
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E7A28
	bne _021E7A28
	bl GF_AssertFail
_021E7A28:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov87_021E7A04

	thumb_func_start ov87_021E7A2C
ov87_021E7A2C: @ 0x021E7A2C
	movs r1, #0xe2
	lsls r1, r1, #2
	ldr r2, [r0, r1]
	adds r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [r2, #0x14]
	ldr r3, _021E7A40 @ =FUN_020E5AD8
	ldr r2, [r2, #0x10]
	bx r3
	nop
_021E7A40: .4byte FUN_020E5AD8
	thumb_func_end ov87_021E7A2C

	thumb_func_start ov87_021E7A44
ov87_021E7A44: @ 0x021E7A44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r0, #2
	mvns r0, r0
	adds r7, r1, #0
	str r2, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
_021E7A56:
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	ldr r4, [sp, #0xc]
	adds r5, r1, r0
_021E7A5E:
	adds r1, r7, r4
	cmp r1, #0
	ble _021E7A7C
	movs r0, #1
	lsls r0, r0, #8
	cmp r1, r0
	bge _021E7A7C
	cmp r5, #0
	ble _021E7A7C
	cmp r5, #0xc0
	bge _021E7A7C
	adds r0, r6, #0
	adds r2, r5, #0
	bl ov87_021E7AB0
_021E7A7C:
	adds r4, r4, #1
	cmp r4, #3
	blt _021E7A5E
	ldr r0, [sp, #8]
	adds r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #3
	blt _021E7A56
	movs r1, #0
	movs r3, #0xe3
	str r1, [sp]
	lsls r3, r3, #2
	ldr r2, [r6, r3]
	subs r3, r3, #4
	ldr r3, [r6, r3]
	ldr r0, [r6, #0x58]
	ldr r3, [r3, #0x10]
	bl FUN_0201C0C0
	ldr r0, [r6, #0x58]
	movs r1, #0
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov87_021E7A44

	thumb_func_start ov87_021E7AB0
ov87_021E7AB0: @ 0x021E7AB0
	push {r3, r4, r5, r6}
	movs r3, #1
	movs r4, #0xff
	tst r3, r1
	bne _021E7ABE
	movs r3, #0xf
	b _021E7AC0
_021E7ABE:
	movs r3, #0xf0
_021E7AC0:
	eors r3, r4
	lsls r3, r3, #0x18
	lsrs r4, r1, #3
	movs r6, #7
	lsrs r5, r2, #3
	ands r1, r6
	lsrs r3, r3, #0x18
	lsls r4, r4, #5
	lsls r5, r5, #0xa
	lsrs r1, r1, #1
	cmp r2, #8
	bhs _021E7ADC
	lsls r2, r2, #2
	b _021E7AE0
_021E7ADC:
	lsls r2, r2, #0x1d
	lsrs r2, r2, #0x1b
_021E7AE0:
	movs r6, #0xe3
	lsls r6, r6, #2
	adds r4, r5, r4
	adds r1, r1, r4
	ldr r0, [r0, r6]
	adds r2, r2, r1
	ldrb r1, [r0, r2]
	ands r1, r3
	strb r1, [r0, r2]
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
	thumb_func_end ov87_021E7AB0

	thumb_func_start ov87_021E7AF8
ov87_021E7AF8: @ 0x021E7AF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0x20
	movs r1, #0x7a
	bl FUN_0202055C
	bl ov87_021E7EF0
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x7a
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	movs r0, #0x28
	adds r1, r5, #4
	movs r2, #0x7a
	bl FUN_02009F40
	movs r2, #2
	str r0, [r5]
	adds r0, r5, #4
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	ldr r4, _021E7BC0 @ =0x021E8394
	movs r7, #0
	adds r6, r5, #0
_021E7B44:
	ldrb r0, [r4]
	adds r1, r7, #0
	movs r2, #0x7a
	bl FUN_0200A090
	movs r1, #0x4b
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r7, r7, #1
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r7, #4
	blt _021E7B44
	adds r0, r5, #0
	movs r1, #1
	bl ov87_021E7BC4
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov87_021E7C50
	adds r0, r5, #0
	movs r1, #1
	bl ov87_021E7CE0
	adds r0, r5, #0
	movs r1, #1
	bl ov87_021E7D6C
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #2
	bl ov87_021E7C50
	movs r7, #0x4f
	lsls r7, r7, #2
	movs r4, #0
	adds r6, r7, #4
_021E7B96:
	ldr r0, [r5, r7]
	bl FUN_0200ACF0
	ldr r0, [r5, r6]
	bl FUN_0200AF94
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #5
	blt _021E7B96
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021E7BC0: .4byte 0x021E8394
	thumb_func_end ov87_021E7AF8

	thumb_func_start ov87_021E7BC4
ov87_021E7BC4: @ 0x021E7BC4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	adds r0, #0xb2
	ldr r0, [r4, r0]
	movs r1, #0xcf
	movs r2, #0xc
	movs r3, #0
	bl FUN_0200A1D8
	movs r1, #0x57
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x7a
	str r0, [sp, #0xc]
	adds r0, #0xb6
	ldr r0, [r4, r0]
	movs r1, #0xcf
	movs r2, #0xd
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x16
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	adds r0, #0xba
	ldr r0, [r4, r0]
	movs r1, #0xcf
	movs r2, #0xb
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	adds r0, #0xbe
	ldr r0, [r4, r0]
	movs r1, #0xcf
	movs r2, #0xa
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x5a
	lsls r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov87_021E7BC4

	thumb_func_start ov87_021E7C50
ov87_021E7C50: @ 0x021E7C50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r2, #0
	adds r7, r3, #0
	str r6, [sp]
	adds r5, r0, #0
	str r7, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	adds r0, #0xb2
	lsls r4, r1, #4
	ldr r0, [r5, r0]
	movs r1, #0xcf
	movs r2, #0x20
	movs r3, #0
	bl FUN_0200A1D8
	movs r1, #0x4f
	adds r2, r5, r4
	lsls r1, r1, #2
	str r0, [r2, r1]
	str r6, [sp]
	str r7, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	movs r0, #0x7a
	str r0, [sp, #0xc]
	adds r0, #0xb6
	ldr r0, [r5, r0]
	movs r1, #0xcf
	movs r2, #0x21
	movs r3, #0
	bl FUN_0200A234
	movs r1, #5
	adds r2, r5, r4
	lsls r1, r1, #6
	str r0, [r2, r1]
	str r6, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	adds r0, #0xba
	ldr r0, [r5, r0]
	movs r1, #0xcf
	movs r2, #0x1f
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x51
	adds r2, r5, r4
	lsls r1, r1, #2
	str r0, [r2, r1]
	str r6, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	adds r0, #0xbe
	ldr r0, [r5, r0]
	movs r1, #0xcf
	movs r2, #0x1e
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x52
	adds r2, r5, r4
	lsls r1, r1, #2
	str r0, [r2, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E7C50

	thumb_func_start ov87_021E7CE0
ov87_021E7CE0: @ 0x021E7CE0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	adds r0, #0xb2
	ldr r0, [r4, r0]
	movs r1, #0xcf
	movs r2, #0x10
	movs r3, #0
	bl FUN_0200A1D8
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #3
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x7a
	str r0, [sp, #0xc]
	adds r0, #0xb6
	ldr r0, [r4, r0]
	movs r1, #0xcf
	movs r2, #0x11
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	adds r0, #0xba
	ldr r0, [r4, r0]
	movs r1, #0xcf
	movs r2, #0xf
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x5d
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	adds r0, #0xbe
	ldr r0, [r4, r0]
	movs r1, #0xcf
	movs r2, #0xe
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov87_021E7CE0

	thumb_func_start ov87_021E7D6C
ov87_021E7D6C: @ 0x021E7D6C
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	adds r0, #0xb2
	ldr r0, [r4, r0]
	movs r1, #0xcf
	movs r2, #0x14
	movs r3, #0
	bl FUN_0200A1D8
	movs r1, #0x5f
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7a
	str r0, [sp, #0xc]
	adds r0, #0xb6
	ldr r0, [r4, r0]
	movs r1, #0xcf
	movs r2, #0x15
	movs r3, #0
	bl FUN_0200A234
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r4, r1]
	movs r0, #4
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	adds r0, #0xba
	ldr r0, [r4, r0]
	movs r1, #0xcf
	movs r2, #0x13
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x61
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #4
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x7a
	str r0, [sp, #8]
	adds r0, #0xbe
	ldr r0, [r4, r0]
	movs r1, #0xcf
	movs r2, #0x12
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov87_021E7D6C

	thumb_func_start ov87_021E7DF8
ov87_021E7DF8: @ 0x021E7DF8
	push {r3, r4, r5, lr}
	sub sp, #0x80
	adds r4, r0, #0
	movs r0, #0
	str r1, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	adds r5, r2, #0
	str r0, [sp, #8]
	movs r2, #0
	movs r0, #0x4b
	str r2, [sp, #0xc]
	lsls r0, r0, #2
	str r3, [sp, #0x10]
	ldr r3, [r4, r0]
	str r3, [sp, #0x14]
	adds r3, r0, #4
	ldr r3, [r4, r3]
	str r3, [sp, #0x18]
	adds r3, r0, #0
	adds r3, #8
	ldr r3, [r4, r3]
	adds r0, #0xc
	str r3, [sp, #0x1c]
	ldr r0, [r4, r0]
	adds r3, r1, #0
	str r0, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	add r0, sp, #0x5c
	adds r2, r1, #0
	bl FUN_02009D48
	ldr r0, [r4]
	movs r1, #0
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r1, [r0, #0x20]
	ldr r0, [sp, #0x90]
	str r0, [sp, #0x50]
	movs r0, #0x7a
	str r0, [sp, #0x58]
	add r0, sp, #0x80
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _021E7E6E
	movs r0, #1
	str r0, [sp, #0x54]
	b _021E7E72
_021E7E6E:
	movs r0, #2
	str r0, [sp, #0x54]
_021E7E72:
	add r0, sp, #0x2c
	bl FUN_02024624
	movs r1, #0
	adds r4, r0, #0
	bl FUN_0202484C
	movs r1, #1
	adds r0, r4, #0
	lsls r1, r1, #0xc
	bl FUN_02024868
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_020248F0
	adds r0, r4, #0
	add sp, #0x80
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E7DF8

	thumb_func_start ov87_021E7E98
ov87_021E7E98: @ 0x021E7E98
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #5
	adds r5, r0, #0
	movs r4, #0
	lsls r7, r7, #6
_021E7EA2:
	lsls r0, r4, #4
	adds r6, r5, r0
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	ldr r0, [r6, r7]
	bl FUN_0200B0A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	blo _021E7EA2
	movs r6, #0x4b
	movs r4, #0
	lsls r6, r6, #2
_021E7EC6:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_0200A0D0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _021E7EC6
	ldr r0, [r5]
	bl FUN_02024504
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov87_021E7E98

	thumb_func_start ov87_021E7EF0
ov87_021E7EF0: @ 0x021E7EF0
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E7F20 @ =0x021E8398
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r1, _021E7F24 @ =0x00200010
	adds r0, r2, #0
	adds r2, r1, #0
	bl FUN_020215C0
	movs r0, #0xe
	movs r1, #0x7a
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E7F20: .4byte 0x021E8398
_021E7F24: .4byte 0x00200010
	thumb_func_end ov87_021E7EF0

	thumb_func_start ov87_021E7F28
ov87_021E7F28: @ 0x021E7F28
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #8
	blt _021E7F38
	bl GF_AssertFail
_021E7F38:
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0200A7BC
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x7a
	str r0, [sp, #4]
	ldr r3, _021E7F68 @ =0x021E84C0
	adds r0, #0xb6
	ldrb r3, [r3, r4]
	ldr r0, [r5, r0]
	adds r1, r6, #0
	movs r2, #0xcf
	bl FUN_0200A350
	adds r0, r6, #0
	bl FUN_0200B084
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E7F68: .4byte 0x021E84C0
	thumb_func_end ov87_021E7F28

	thumb_func_start ov87_021E7F6C
ov87_021E7F6C: @ 0x021E7F6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x7a
	movs r1, #0x10
	adds r7, r2, #0
	str r3, [sp, #8]
	bl FUN_0201AA8C
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #0x10
	movs r0, #0
_021E7F88:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _021E7F88
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x28]
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x14]
	adds r1, r6, #0
	adds r2, r7, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	bl ov87_021E7DF8
	add r2, sp, #0x10
	str r0, [r4, #0xc]
	ldrb r0, [r2, #0x14]
	strb r0, [r4, #2]
	ldrh r2, [r2, #0x10]
	ldr r1, [sp, #8]
	adds r0, r4, #0
	bl ov87_021E7FEC
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov87_021E7F6C

	thumb_func_start ov87_021E7FC0
ov87_021E7FC0: @ 0x021E7FC0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_02024758
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov87_021E7FC0

	thumb_func_start ov87_021E7FD4
ov87_021E7FD4: @ 0x021E7FD4
	ldr r3, _021E7FDC @ =FUN_02024830
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021E7FDC: .4byte FUN_02024830
	thumb_func_end ov87_021E7FD4

	thumb_func_start ov87_021E7FE0
ov87_021E7FE0: @ 0x021E7FE0
	ldr r3, _021E7FE8 @ =FUN_02024ADC
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021E7FE8: .4byte FUN_02024ADC
	thumb_func_end ov87_021E7FE0

	thumb_func_start ov87_021E7FEC
ov87_021E7FEC: @ 0x021E7FEC
	push {lr}
	sub sp, #0xc
	lsls r2, r2, #0xc
	lsls r1, r1, #0xc
	str r2, [sp, #4]
	str r1, [sp]
	ldrb r1, [r0, #2]
	cmp r1, #1
	bne _021E8006
	movs r1, #2
	lsls r1, r1, #0x14
	adds r1, r2, r1
	str r1, [sp, #4]
_021E8006:
	ldr r0, [r0, #0xc]
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov87_021E7FEC

	thumb_func_start ov87_021E8014
ov87_021E8014: @ 0x021E8014
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0xc]
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_020248AC
	ldr r2, [r0]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	str r1, [r5]
	ldr r1, [r0, #4]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov87_021E8014

	thumb_func_start ov87_021E803C
ov87_021E803C: @ 0x021E803C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #1
	ldr r0, [r5, #0xc]
	lsls r1, r1, #0xc
	bl FUN_02024868
	ldr r0, [r5, #0xc]
	adds r1, r4, #0
	bl FUN_02024950
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov87_021E803C

	thumb_func_start ov87_021E8058
ov87_021E8058: @ 0x021E8058
	ldr r3, _021E8064 @ =FUN_02024804
	ldr r0, [r0, #0xc]
	ldr r1, _021E8068 @ =0x021E83A8
	movs r2, #1
	bx r3
	nop
_021E8064: .4byte FUN_02024804
_021E8068: .4byte 0x021E83A8
	thumb_func_end ov87_021E8058

	thumb_func_start ov87_021E806C
ov87_021E806C: @ 0x021E806C
	ldr r3, _021E8074 @ =FUN_02024804
	ldr r0, [r0, #0xc]
	movs r2, #2
	bx r3
	.align 2, 0
_021E8074: .4byte FUN_02024804
	thumb_func_end ov87_021E806C

	thumb_func_start ov87_021E8078
ov87_021E8078: @ 0x021E8078
	ldr r3, _021E8080 @ =FUN_02024A48
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021E8080: .4byte FUN_02024A48
	thumb_func_end ov87_021E8078

	thumb_func_start ov87_021E8084
ov87_021E8084: @ 0x021E8084
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_0202484C
	movs r1, #1
	ldr r0, [r4, #0xc]
	lsls r1, r1, #0xc
	bl FUN_02024868
	ldr r0, [r4, #0xc]
	bl FUN_020249A8
	adds r1, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_020248F0
	pop {r4, pc}
	thumb_func_end ov87_021E8084

	thumb_func_start ov87_021E80A8
ov87_021E80A8: @ 0x021E80A8
	ldr r3, _021E80B0 @ =FUN_02024B38
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021E80B0: .4byte FUN_02024B38
	thumb_func_end ov87_021E80A8

	thumb_func_start ov87_021E80B4
ov87_021E80B4: @ 0x021E80B4
	ldr r3, _021E80BC @ =FUN_02024B68
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021E80BC: .4byte FUN_02024B68
	thumb_func_end ov87_021E80B4

	thumb_func_start ov87_021E80C0
ov87_021E80C0: @ 0x021E80C0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	movs r4, #0
_021E80C8:
	ldr r2, _021E80EC @ =0x021E842C
	lsls r6, r4, #4
	lsls r3, r4, #3
	adds r0, r7, #0
	adds r1, r5, r6
	adds r2, r2, r3
	bl FUN_0201D4F8
	adds r0, r5, r6
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x10
	blo _021E80C8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E80EC: .4byte 0x021E842C
	thumb_func_end ov87_021E80C0

	thumb_func_start ov87_021E80F0
ov87_021E80F0: @ 0x021E80F0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021E80F6:
	lsls r0, r4, #4
	adds r0, r5, r0
	bl FUN_0201D520
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x10
	blo _021E80F6
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov87_021E80F0

	thumb_func_start ov87_021E810C
ov87_021E810C: @ 0x021E810C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r1, #0
	movs r1, #0x7a
	str r1, [sp]
	ldr r2, _021E8130 @ =0x000003F7
	movs r1, #2
	movs r3, #0
	bl FUN_0200E398
	ldr r2, _021E8130 @ =0x000003F7
	adds r0, r4, #0
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E580
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021E8130: .4byte 0x000003F7
	thumb_func_end ov87_021E810C

	thumb_func_start ov87_021E8134
ov87_021E8134: @ 0x021E8134
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r4, r0, #0
	bl FUN_0201EE8C
	adds r1, r0, #0
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x7a
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _021E8170 @ =0x000003D9
	movs r3, #0xa
	bl FUN_0200E644
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	ldr r2, _021E8170 @ =0x000003D9
	adds r0, r4, #0
	movs r1, #0
	movs r3, #0xa
	bl FUN_0200E998
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021E8170: .4byte 0x000003D9
	thumb_func_end ov87_021E8134

	.rodata

_021E8174:
	.byte 0x58, 0x00, 0xA0, 0x00, 0x44, 0x00, 0xA0, 0x00, 0x26, 0x00, 0x38, 0x00
	.byte 0x44, 0x00, 0x44, 0x00, 0xA4, 0xBF, 0x5E, 0xA4, 0xFF, 0x00, 0x00, 0x00, 0xA4, 0xBF, 0x4C, 0xB4
	.byte 0xFF, 0x00, 0x00, 0x00, 0x34, 0x00, 0x44, 0x00, 0x6C, 0x00, 0x44, 0x00, 0xA4, 0x00, 0x44, 0x00
	.byte 0x00, 0x00, 0x24, 0x00, 0x38, 0x00, 0x24, 0x00, 0x70, 0x00, 0x24, 0x00, 0xA8, 0x00, 0x24, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2A, 0x9A, 0x00, 0x50, 0x2A, 0x9A, 0x58, 0x8A, 0x2A, 0x9A, 0x90, 0xC3, 0x2A, 0x9A, 0xCC, 0xFE
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x06, 0x05, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x03
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x09, 0x08
	.byte 0x07, 0x06, 0x05, 0x04, 0x02, 0x02, 0x02, 0x01, 0x01, 0x01, 0x01, 0x01, 0xF8, 0xF8, 0xF8, 0xF9
	.byte 0xF9, 0xFA, 0xFB, 0xFC, 0xEE, 0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF6, 0xF8, 0x15, 0x36, 0x20, 0x59
	.byte 0x15, 0x36, 0x66, 0x9D, 0x15, 0x36, 0xAA, 0xE3, 0x44, 0x64, 0x20, 0x59, 0x44, 0x64, 0x66, 0x9D
	.byte 0x44, 0x64, 0xAA, 0xE3, 0x72, 0x94, 0x20, 0x59, 0x72, 0x94, 0x66, 0x9D, 0x72, 0x94, 0xAA, 0xE3
	.byte 0x2A, 0x00, 0x1B, 0x00, 0x75, 0x00, 0x1B, 0x00, 0xBD, 0x00, 0x1B, 0x00, 0x2A, 0x00, 0x4A, 0x00
	.byte 0x75, 0x00, 0x4A, 0x00, 0xBD, 0x00, 0x4A, 0x00, 0x2A, 0x00, 0x78, 0x00, 0x75, 0x00, 0x78, 0x00
	.byte 0xBD, 0x00, 0x78, 0x00, 0x39, 0x00, 0x12, 0x00, 0x7C, 0x00, 0x12, 0x00, 0xBF, 0x00, 0x12, 0x00
	.byte 0x39, 0x00, 0x42, 0x00, 0x7C, 0x00, 0x42, 0x00, 0xBF, 0x00, 0x42, 0x00, 0x39, 0x00, 0x72, 0x00
	.byte 0x7C, 0x00, 0x72, 0x00, 0xBF, 0x00, 0x72, 0x00, 0x15, 0x36, 0x20, 0x59, 0x15, 0x36, 0x66, 0x9D
	.byte 0x15, 0x36, 0xAA, 0xE3, 0x44, 0x64, 0x20, 0x59, 0x44, 0x64, 0x66, 0x9D, 0x44, 0x64, 0xAA, 0xE3
	.byte 0x72, 0x94, 0x20, 0x59, 0x72, 0x94, 0x66, 0x9D, 0x72, 0x94, 0xAA, 0xE3, 0xFF, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA9, 0x00, 0xAA, 0x00, 0xAB, 0x00, 0xAC, 0x00
	.byte 0xAD, 0x00, 0xAE, 0x00, 0xB8, 0x00, 0xB9, 0x00, 0xBA, 0x00, 0xBB, 0x00, 0xBC, 0x00, 0xBD, 0x00
	.byte 0xBE, 0x00, 0xBF, 0x00, 0xC0, 0x00, 0xC1, 0x00, 0xC2, 0x00, 0xC3, 0x00, 0xC4, 0x00, 0xC5, 0x00
	.byte 0xC6, 0x00, 0xC7, 0x00, 0xC8, 0x00, 0x00, 0x00, 0x0A, 0x0C, 0x06, 0x08, 0xFC, 0xFC, 0xFC, 0xFC
	.byte 0xFC, 0xFC, 0xFC, 0xFC, 0x05, 0x05, 0x05, 0x05, 0x05, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0x00, 0x00
	.byte 0x00, 0x14, 0x00, 0x00, 0x7A, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x33, 0x13, 0x00, 0x00, 0x33, 0x13, 0x00, 0x00, 0x33, 0x13, 0x00, 0x00
	.byte 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x55, 0x15, 0x00, 0x00
	.byte 0x55, 0x15, 0x00, 0x00, 0x55, 0x15, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00
	.byte 0x00, 0x18, 0x00, 0x00, 0xCD, 0x1C, 0x00, 0x00, 0xCD, 0x1C, 0x00, 0x00, 0xCD, 0x1C, 0x00, 0x00
	.byte 0x49, 0x12, 0x00, 0x00, 0x49, 0x12, 0x00, 0x00, 0x49, 0x12, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00
	.byte 0x00, 0x0C, 0x00, 0x00, 0xCD, 0x0C, 0x00, 0x00, 0xCD, 0x0C, 0x00, 0x00, 0xCD, 0x0C, 0x00, 0x00
	.byte 0xB7, 0x0D, 0x00, 0x00, 0xB7, 0x0D, 0x00, 0x00, 0xB7, 0x0D, 0x00, 0x00, 0x02, 0x02, 0x01, 0x1B
	.byte 0x04, 0x0C, 0x01, 0x00, 0x04, 0x18, 0x0D, 0x07, 0x04, 0x0D, 0x6D, 0x00, 0x04, 0x11, 0x03, 0x0B
	.byte 0x05, 0x0D, 0x89, 0x00, 0x04, 0x11, 0x08, 0x0B, 0x05, 0x0D, 0xC0, 0x00, 0x04, 0x11, 0x0E, 0x0B
	.byte 0x05, 0x0D, 0xF7, 0x00, 0x04, 0x11, 0x13, 0x0B, 0x05, 0x0D, 0x2E, 0x01, 0x04, 0x0A, 0x03, 0x05
	.byte 0x03, 0x0D, 0x65, 0x01, 0x04, 0x0A, 0x08, 0x05, 0x03, 0x0D, 0x74, 0x01, 0x04, 0x0A, 0x0E, 0x05
	.byte 0x03, 0x0D, 0x83, 0x01, 0x04, 0x0A, 0x13, 0x05, 0x03, 0x0D, 0x92, 0x01, 0x02, 0x0A, 0x09, 0x0C
	.byte 0x04, 0x0D, 0xA1, 0x01, 0x02, 0x0A, 0x09, 0x0C, 0x04, 0x0D, 0xA1, 0x01, 0x02, 0x0A, 0x09, 0x0C
	.byte 0x04, 0x0D, 0xA1, 0x01, 0x02, 0x0A, 0x15, 0x0D, 0x03, 0x0D, 0xD1, 0x01, 0x02, 0x0D, 0x15, 0x0D
	.byte 0x03, 0x0D, 0xD1, 0x01, 0x04, 0x02, 0x13, 0x1B, 0x04, 0x0C, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x00, 0x00, 0x00, 0x00
	@ 0x021E84AC
