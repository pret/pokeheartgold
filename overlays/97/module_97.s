
	thumb_func_start ov97_0221E5C0
ov97_0221E5C0: @ 0x0221E5C0
	push {r3, lr}
	bl ov97_0221E6DC
	cmp r0, #0
	beq _0221E5CE
	movs r0, #1
	pop {r3, pc}
_0221E5CE:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov97_0221E5C0

	thumb_func_start ov97_0221E5D4
ov97_0221E5D4: @ 0x0221E5D4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #5
	bhi _0221E68A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221E5F2: @ jump table
	.2byte _0221E5FE - _0221E5F2 - 2 @ case 0
	.2byte _0221E604 - _0221E5F2 - 2 @ case 1
	.2byte _0221E620 - _0221E5F2 - 2 @ case 2
	.2byte _0221E62E - _0221E5F2 - 2 @ case 3
	.2byte _0221E650 - _0221E5F2 - 2 @ case 4
	.2byte _0221E66E - _0221E5F2 - 2 @ case 5
_0221E5FE:
	movs r0, #1
	str r0, [r4, #4]
	b _0221E68A
_0221E604:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x5c
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #2
	str r0, [r4, #4]
	b _0221E68A
_0221E620:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0221E68A
	movs r0, #3
	str r0, [r4, #4]
	b _0221E68A
_0221E62E:
	ldr r0, [r4, #8]
	bl FUN_020935E0
	cmp r0, #2
	bne _0221E642
	movs r0, #0
	str r0, [r4, #0x28]
	movs r0, #4
	str r0, [r4, #4]
	b _0221E68A
_0221E642:
	cmp r0, #3
	bne _0221E68A
	movs r0, #1
	str r0, [r4, #0x28]
	movs r0, #4
	str r0, [r4, #4]
	b _0221E68A
_0221E650:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x5c
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #5
	str r0, [r4, #4]
	b _0221E68A
_0221E66E:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0221E68A
	adds r0, r5, #0
	bl FUN_020072A4
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov97_0221E98C
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0221E68A:
	ldr r0, [r4, #8]
	bl FUN_02093A40
	ldr r0, [r4, #0xc]
	bl ov97_0221F010
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov97_0221E5D4

	thumb_func_start ov97_0221E69C
ov97_0221E69C: @ 0x0221E69C
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	ldr r0, [r4, #0xc]
	bl ov97_0221F020
	ldr r0, [r4, #8]
	bl FUN_02093354
	movs r0, #2
	bl FUN_02002DB4
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	ldr r0, [r4]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov97_0221E69C

	thumb_func_start ov97_0221E6DC
ov97_0221E6DC: @ 0x0221E6DC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_020072A4
	adds r4, r0, #0
_0221E6E6:
	adds r0, r5, #0
	bl ov97_0221E700
	cmp r0, #0
	beq _0221E6F4
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221E6F4:
	ldr r0, [r4]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0221E6E6
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov97_0221E6DC

	thumb_func_start ov97_0221E700
ov97_0221E700: @ 0x0221E700
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r4, r0, #0
	bl FUN_020072A4
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #0x34
	movs r2, #0x5c
	ldr r5, [r7]
	bl FUN_02007280
	movs r1, #0
	movs r2, #0x34
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x5c
	bl FUN_0201AC88
	str r0, [r4]
	ldr r0, [r5]
	str r0, [r4, #0x2c]
	adds r0, r7, #0
	adds r0, #0x84
	ldr r0, [r0]
	str r0, [r4, #0x30]
	bl ov97_0221E7F4
	movs r0, #0x5c
	movs r1, #3
	movs r2, #0x13
	bl FUN_020932E0
	str r0, [r4, #8]
	movs r0, #0x5c
	bl ov97_0221EE84
	str r0, [r4, #0xc]
	ldr r0, [r4]
	bl ov97_0221E814
	bl ov97_0221E834
	adds r0, r4, #0
	bl ov97_0221E864
	ldr r0, [r7]
	movs r6, #0
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0221E76A
	movs r6, #1
_0221E76A:
	ldr r0, [r5]
	bl FUN_020270D8
	adds r7, r0, #0
	ldr r0, [r5]
	bl FUN_02074904
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x12
	str r0, [sp, #0xc]
	ldr r0, _0221E7E4 @ =ov97_0221E91C
	adds r2, r7, #0
	str r0, [sp, #0x10]
	ldr r0, _0221E7E8 @ =ov97_0221E97C
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r0, #0x10
	str r0, [sp, #0x18]
	ldr r0, _0221E7EC @ =ov97_0221EC14
	str r0, [sp, #0x1c]
	str r4, [sp, #0x20]
	ldr r0, [r4, #8]
	ldr r1, [r4]
	bl FUN_02093440
	movs r0, #2
	bl FUN_0203A994
	ldr r2, [r4, #0x30]
	ldrb r3, [r5, #0xf]
	lsls r2, r2, #0x18
	ldr r0, [r4, #0xc]
	ldr r1, [r4]
	lsrs r2, r2, #0x18
	bl ov97_0221EEA4
	ldr r0, _0221E7F0 @ =ov97_0221E88C
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #0
	str r0, [r4, #4]
	bl FUN_02020080
	movs r1, #0x1e
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x5c
	bl FUN_02003030
	movs r0, #2
	movs r1, #0x5c
	bl FUN_02002CEC
	movs r0, #1
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221E7E4: .4byte ov97_0221E91C
_0221E7E8: .4byte ov97_0221E97C
_0221E7EC: .4byte ov97_0221EC14
_0221E7F0: .4byte ov97_0221E88C
	thumb_func_end ov97_0221E700

	thumb_func_start ov97_0221E7F4
ov97_0221E7F4: @ 0x0221E7F4
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0221E810 @ =0x0221FCCC
	add r3, sp, #0
	movs r2, #5
_0221E7FE:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0221E7FE
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_0221E810: .4byte 0x0221FCCC
	thumb_func_end ov97_0221E7F4

	thumb_func_start ov97_0221E814
ov97_0221E814: @ 0x0221E814
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0221E830 @ =0x0221FCA8
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0221E830: .4byte 0x0221FCA8
	thumb_func_end ov97_0221E814

	thumb_func_start ov97_0221E834
ov97_0221E834: @ 0x0221E834
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0221E860 @ =_0221FC98
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_020215A0
	movs r0, #0x14
	movs r1, #0x5c
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0221E860: .4byte _0221FC98
	thumb_func_end ov97_0221E834

	thumb_func_start ov97_0221E864
ov97_0221E864: @ 0x0221E864
	push {lr}
	sub sp, #0x14
	blx FUN_020B78D4
	movs r0, #1
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x5c
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	add sp, #0x14
	pop {pc}
	.align 2, 0
	thumb_func_end ov97_0221E864

	thumb_func_start ov97_0221E88C
ov97_0221E88C: @ 0x0221E88C
	ldr r3, _0221E894 @ =FUN_02093594
	ldr r0, [r0, #8]
	bx r3
	nop
_0221E894: .4byte FUN_02093594
	thumb_func_end ov97_0221E88C

	thumb_func_start ov97_0221E898
ov97_0221E898: @ 0x0221E898
	push {r3, r4, r5, lr}
	adds r5, r3, #0
	bl FUN_02074058
	movs r1, #0xac
	movs r2, #0
	adds r4, r0, #0
	bl FUN_0206E640
	cmp r0, #0
	beq _0221E908
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	movs r1, #0
	str r0, [r5]
	adds r0, r4, #0
	adds r2, r1, #0
	bl FUN_0206E640
	str r0, [r5, #4]
	adds r0, r4, #0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E640
	strh r0, [r5, #8]
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E640
	strh r0, [r5, #0xa]
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r2, r5, #0
	strh r0, [r5, #0xe]
	adds r0, r4, #0
	movs r1, #0x75
	adds r2, #0x18
	bl FUN_0206E640
	adds r0, r4, #0
	bl FUN_02070044
	strh r0, [r5, #0x10]
	adds r0, r4, #0
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E640
	strh r0, [r5, #0x12]
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221E908:
	movs r0, #0
	str r0, [r5]
	str r0, [r5, #4]
	strh r0, [r5, #8]
	strh r0, [r5, #0xa]
	strh r0, [r5, #0xc]
	strh r0, [r5, #0xe]
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	pop {r3, r4, r5, pc}
	thumb_func_end ov97_0221E898

	thumb_func_start ov97_0221E91C
ov97_0221E91C: @ 0x0221E91C
	push {r3, r4, r5, lr}
	adds r4, r3, #0
	bl FUN_02074058
	movs r1, #0xac
	movs r2, #0
	adds r5, r0, #0
	bl FUN_0206E640
	cmp r0, #0
	beq _0221E966
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	str r0, [r4]
	movs r2, #0
	str r2, [r4, #4]
	adds r0, r5, #0
	movs r1, #0x4c
	bl FUN_0206E640
	strh r0, [r4, #8]
	adds r0, r5, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E640
	strh r0, [r4, #0xa]
	movs r0, #0
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221E966:
	movs r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov97_0221E91C

	thumb_func_start ov97_0221E97C
ov97_0221E97C: @ 0x0221E97C
	adds r3, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _0221E988 @ =FUN_02073F00
	bx r3
	.align 2, 0
_0221E988: .4byte FUN_02073F00
	thumb_func_end ov97_0221E97C

	thumb_func_start ov97_0221E98C
ov97_0221E98C: @ 0x0221E98C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r5, r0, #0
	ldr r0, [r5, #0x28]
	adds r7, r1, #0
	str r0, [r7, #4]
	ldr r0, [r5, #0x28]
	cmp r0, #0
	bne _0221EA84
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r7, #0
	str r0, [sp, #4]
	adds r0, #0x1e
	str r0, [sp, #4]
	adds r0, r7, #0
	str r0, [sp]
	adds r0, #0x14
	adds r4, r7, #0
	str r0, [sp]
_0221E9B4:
	ldr r6, [r5, #0x10]
	ldr r0, [r7]
	cmp r6, #0x12
	bne _0221EA20
	ldr r0, [r0]
	bl FUN_02074904
	ldr r1, [r5, #0x14]
	bl FUN_02074644
	movs r1, #5
	movs r2, #0
	adds r6, r0, #0
	bl FUN_0206E540
	movs r1, #0
	strh r0, [r4, #0xc]
	adds r0, r6, #0
	adds r2, r1, #0
	bl FUN_0206E540
	str r0, [r4, #0x10]
	adds r0, r6, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4, #0xe]
	ldr r2, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x75
	bl FUN_0206E540
	adds r0, r6, #0
	bl FUN_0207003C
	strb r0, [r4, #0x1c]
	adds r0, r6, #0
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r4, #0x1d]
	ldr r0, [r7]
	ldr r0, [r0]
	bl FUN_02074904
	ldr r1, [r5, #0x14]
	ldr r2, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov97_0221EA88
	b _0221EA6A
_0221EA20:
	ldr r0, [r0]
	bl FUN_020270D8
	ldr r2, [r5, #0x14]
	adds r1, r6, #0
	add r3, sp, #0xc
	bl ov97_0221E898
	ldr r0, [sp, #0xc]
	add r1, sp, #0x24
	strh r0, [r4, #0xc]
	ldr r0, [sp, #0x10]
	movs r2, #0xb
	str r0, [r4, #0x10]
	add r0, sp, #0xc
	ldrh r0, [r0, #0xa]
	strh r0, [r4, #0xe]
	ldr r0, [sp, #4]
	bl FUN_02002048
	add r0, sp, #0xc
	ldrh r0, [r0, #0x10]
	strb r0, [r4, #0x1c]
	add r0, sp, #0xc
	ldrh r0, [r0, #0x12]
	strb r0, [r4, #0x1d]
	ldr r0, [r7]
	ldr r0, [r0]
	bl FUN_020270D8
	ldr r1, [r5, #0x10]
	ldr r2, [r5, #0x14]
	bl FUN_02074058
	ldr r1, [sp]
	bl ov97_0221EB38
_0221EA6A:
	ldr r0, [sp, #4]
	adds r5, #8
	adds r0, #0x28
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r4, #0x28
	adds r0, #0x28
	str r0, [sp]
	ldr r0, [sp, #8]
	adds r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #3
	blt _0221E9B4
_0221EA84:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov97_0221E98C

	thumb_func_start ov97_0221EA88
ov97_0221EA88: @ 0x0221EA88
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r0, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl FUN_02074670
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_02074644
	adds r1, r0, #0
	add r0, sp, #0
	add r2, sp, #8
	movs r3, #0x5c
	bl FUN_020732E4
	add r1, sp, #0
	ldrh r0, [r1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	strb r0, [r4]
	ldrh r0, [r1]
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x1d
	strb r0, [r4, #1]
	ldrh r0, [r1]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1d
	strb r0, [r4, #2]
	ldrh r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	strb r0, [r4, #3]
	ldrh r0, [r1]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1d
	strb r0, [r4, #4]
	ldrh r3, [r4, #6]
	movs r0, #7
	ldrb r2, [r1, #2]
	bics r3, r0
	movs r0, #7
	ands r0, r2
	orrs r0, r3
	strh r0, [r4, #6]
	ldrh r2, [r4, #6]
	movs r0, #0x38
	bics r2, r0
	ldrb r0, [r1, #6]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1a
	orrs r0, r2
	strh r0, [r4, #6]
	ldrh r2, [r4, #6]
	ldr r0, _0221EB2C @ =0xFFFFFE3F
	ands r2, r0
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x17
	orrs r0, r2
	strh r0, [r4, #6]
	ldrh r2, [r4, #6]
	ldr r0, _0221EB30 @ =0xFFFFF1FF
	ands r2, r0
	ldrb r0, [r1, #3]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x14
	orrs r0, r2
	strh r0, [r4, #6]
	ldrh r2, [r4, #6]
	ldr r0, _0221EB34 @ =0xFFFF8FFF
	ands r2, r0
	ldrb r0, [r1, #4]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x11
	orrs r0, r2
	strh r0, [r4, #6]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221EB2C: .4byte 0xFFFFFE3F
_0221EB30: .4byte 0xFFFFF1FF
_0221EB34: .4byte 0xFFFF8FFF
	thumb_func_end ov97_0221EA88

	thumb_func_start ov97_0221EB38
ov97_0221EB38: @ 0x0221EB38
	push {r4, lr}
	sub sp, #8
	adds r2, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	add r0, sp, #0
	movs r2, #0
	movs r3, #0x5c
	bl FUN_02073248
	add r1, sp, #0
	ldrh r0, [r1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	strb r0, [r4]
	ldrh r0, [r1]
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x1d
	strb r0, [r4, #1]
	ldrh r0, [r1]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1d
	strb r0, [r4, #2]
	ldrh r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	strb r0, [r4, #3]
	ldrh r0, [r1]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1d
	strb r0, [r4, #4]
	ldrh r3, [r4, #6]
	movs r0, #7
	ldrb r2, [r1, #2]
	bics r3, r0
	movs r0, #7
	ands r0, r2
	orrs r0, r3
	strh r0, [r4, #6]
	ldrh r2, [r4, #6]
	movs r0, #0x38
	bics r2, r0
	ldrb r0, [r1, #6]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1a
	orrs r0, r2
	strh r0, [r4, #6]
	ldrh r2, [r4, #6]
	ldr r0, _0221EBCC @ =0xFFFFFE3F
	ands r2, r0
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x17
	orrs r0, r2
	strh r0, [r4, #6]
	ldrh r2, [r4, #6]
	ldr r0, _0221EBD0 @ =0xFFFFF1FF
	ands r2, r0
	ldrb r0, [r1, #3]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x14
	orrs r0, r2
	strh r0, [r4, #6]
	ldrh r2, [r4, #6]
	ldr r0, _0221EBD4 @ =0xFFFF8FFF
	ands r2, r0
	ldrb r0, [r1, #4]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x11
	orrs r0, r2
	strh r0, [r4, #6]
	add sp, #8
	pop {r4, pc}
	nop
_0221EBCC: .4byte 0xFFFFFE3F
_0221EBD0: .4byte 0xFFFFF1FF
_0221EBD4: .4byte 0xFFFF8FFF
	thumb_func_end ov97_0221EB38

	thumb_func_start ov97_0221EBD8
ov97_0221EBD8: @ 0x0221EBD8
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r1, #0
	add r1, sp, #0
	bl FUN_020730B4
	add r0, sp, #0
	ldrh r1, [r0]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1d
	strb r1, [r4]
	ldrh r1, [r0, #0x10]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1d
	strb r1, [r4, #1]
	ldrh r1, [r0, #0xc]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1d
	strb r1, [r4, #2]
	ldrh r1, [r0, #4]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1d
	strb r1, [r4, #3]
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	strb r0, [r4, #4]
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov97_0221EBD8

	thumb_func_start ov97_0221EC14
ov97_0221EC14: @ 0x0221EC14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xc0
	ldr r3, _0221EDE0 @ =0x0221FCB8
	adds r5, r2, #0
	adds r6, r0, #0
	adds r4, r1, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x5c
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _0221EC3A
	cmp r4, r0
	bne _0221EC3C
_0221EC3A:
	b _0221EDCE
_0221EC3C:
	movs r1, #2
	add r0, sp, #0x70
	strb r1, [r0, #9]
	cmp r6, #0x12
	ldr r0, [r5, #0x2c]
	bne _0221ED1C
	bl FUN_02074904
	adds r1, r4, #0
	adds r7, r0, #0
	bl FUN_02074644
	movs r1, #0
	adds r6, r0, #0
	adds r2, r1, #0
	bl FUN_0206E540
	str r0, [sp, #0x70]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	add r1, sp, #0x70
	strh r0, [r1, #4]
	adds r0, r6, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	add r1, sp, #0x70
	strb r0, [r1, #7]
	add r2, sp, #0x78
	adds r0, r6, #0
	movs r1, #0x75
	adds r2, #2
	bl FUN_0206E540
	adds r0, r6, #0
	bl FUN_0207003C
	add r1, sp, #0x70
	strb r0, [r1, #6]
	adds r0, r6, #0
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E540
	add r1, sp, #0x70
	strb r0, [r1, #8]
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_02074644
	bl FUN_02070DB0
	lsls r1, r4, #0x18
	adds r6, r0, #0
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	add r2, sp, #0x24
	bl ov97_0221EA88
	adds r0, r6, #0
	add r1, sp, #0x1c
	bl ov97_0221EBD8
	add r1, sp, #0x14
	adds r0, r7, #0
	adds r1, #2
	adds r2, r4, #0
	bl FUN_02074670
	add r2, sp, #0x14
	add r0, sp, #0x1c
	add r1, sp, #0x24
	adds r2, #2
	add r3, sp, #0x70
	bl ov97_0221EDE4
	movs r4, #0
	add r6, sp, #0x70
	add r7, sp, #0x5c
_0221ECE2:
	ldr r0, [r5, #0x2c]
	bl FUN_02031968
	lsls r1, r4, #2
	ldrh r2, [r6, #4]
	ldr r1, [r7, r1]
	bl FUN_020319A8
	cmp r0, #0
	beq _0221ECFE
	adds r1, r6, r4
	adds r1, #0x20
	movs r0, #1
	b _0221ED04
_0221ECFE:
	adds r1, r6, r4
	adds r1, #0x20
	movs r0, #0
_0221ED04:
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	blo _0221ECE2
	ldr r0, [r5, #0xc]
	add r1, sp, #0x70
	bl ov97_0221EFD0
	add sp, #0xc0
	pop {r3, r4, r5, r6, r7, pc}
_0221ED1C:
	bl FUN_020270D8
	adds r1, r6, #0
	adds r2, r4, #0
	add r3, sp, #0x2c
	bl ov97_0221E898
	ldr r0, [sp, #0x30]
	add r1, sp, #0x70
	str r0, [sp, #0x70]
	ldr r0, [sp, #0x2c]
	movs r2, #0xb
	strh r0, [r1, #4]
	add r0, sp, #0
	ldrh r0, [r0, #0x36]
	strb r0, [r1, #7]
	add r0, sp, #0x78
	adds r0, #2
	add r1, sp, #0x44
	bl FUN_02002048
	add r1, sp, #0
	ldrh r2, [r1, #0x3c]
	add r0, sp, #0x70
	strb r2, [r0, #6]
	ldrh r1, [r1, #0x3e]
	strb r1, [r0, #8]
	ldr r0, [r5, #0x2c]
	bl FUN_020270D8
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_02074058
	add r1, sp, #0xc
	adds r1, #2
	adds r4, r0, #0
	bl ov97_0221EB38
	add r1, sp, #4
	adds r0, r4, #0
	adds r1, #2
	bl ov97_0221EBD8
	add r0, sp, #0
	movs r1, #0
	movs r2, #5
	blx FUN_020D4994
	add r0, sp, #4
	add r1, sp, #0xc
	adds r0, #2
	adds r1, #2
	add r2, sp, #0
	add r3, sp, #0x70
	bl ov97_0221EDE4
	movs r4, #0
	add r6, sp, #0x70
	add r7, sp, #0x5c
_0221ED94:
	ldr r0, [r5, #0x2c]
	bl FUN_02031968
	lsls r1, r4, #2
	ldrh r2, [r6, #4]
	ldr r1, [r7, r1]
	bl FUN_020319A8
	cmp r0, #0
	beq _0221EDB0
	adds r1, r6, r4
	adds r1, #0x20
	movs r0, #1
	b _0221EDB6
_0221EDB0:
	adds r1, r6, r4
	adds r1, #0x20
	movs r0, #0
_0221EDB6:
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	blo _0221ED94
	ldr r0, [r5, #0xc]
	add r1, sp, #0x70
	bl ov97_0221EFD0
	add sp, #0xc0
	pop {r3, r4, r5, r6, r7, pc}
_0221EDCE:
	movs r0, #0
	add r1, sp, #0x70
	strb r0, [r1, #9]
	ldr r0, [r5, #0xc]
	bl ov97_0221EFD0
	add sp, #0xc0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221EDE0: .4byte 0x0221FCB8
	thumb_func_end ov97_0221EC14

	thumb_func_start ov97_0221EDE4
ov97_0221EDE4: @ 0x0221EDE4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r2, #0
	movs r0, #0
	ldrsb r0, [r7, r0]
	adds r6, r1, #0
	adds r4, r3, #0
	str r0, [sp]
	ldrh r3, [r6, #6]
	adds r0, r4, #0
	ldrb r1, [r5]
	lsls r3, r3, #0x1d
	ldrb r2, [r6]
	adds r0, #0x29
	lsrs r3, r3, #0x1d
	bl FUN_0208B85C
	adds r1, r4, #0
	adds r1, #0x28
	strb r0, [r1]
	movs r0, #1
	ldrsb r0, [r7, r0]
	str r0, [sp]
	ldrh r3, [r6, #6]
	adds r0, r4, #0
	ldrb r1, [r5, #3]
	lsls r3, r3, #0x14
	ldrb r2, [r6, #3]
	adds r0, #0x31
	lsrs r3, r3, #0x1d
	bl FUN_0208B85C
	adds r1, r4, #0
	adds r1, #0x30
	strb r0, [r1]
	movs r0, #2
	ldrsb r0, [r7, r0]
	str r0, [sp]
	ldrh r3, [r6, #6]
	adds r0, r4, #0
	ldrb r1, [r5, #4]
	lsls r3, r3, #0x11
	ldrb r2, [r6, #4]
	adds r0, #0x39
	lsrs r3, r3, #0x1d
	bl FUN_0208B85C
	adds r1, r4, #0
	adds r1, #0x38
	strb r0, [r1]
	movs r0, #3
	ldrsb r0, [r7, r0]
	str r0, [sp]
	ldrh r3, [r6, #6]
	adds r0, r4, #0
	ldrb r1, [r5, #2]
	lsls r3, r3, #0x17
	ldrb r2, [r6, #2]
	adds r0, #0x41
	lsrs r3, r3, #0x1d
	bl FUN_0208B85C
	adds r1, r4, #0
	adds r1, #0x40
	strb r0, [r1]
	movs r0, #4
	ldrsb r0, [r7, r0]
	str r0, [sp]
	ldrh r3, [r6, #6]
	adds r0, r4, #0
	ldrb r1, [r5, #1]
	lsls r3, r3, #0x1a
	ldrb r2, [r6, #1]
	adds r0, #0x49
	lsrs r3, r3, #0x1d
	bl FUN_0208B85C
	adds r4, #0x48
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov97_0221EDE4

	thumb_func_start ov97_0221EE84
ov97_0221EE84: @ 0x0221EE84
	push {r3, r4, r5, lr}
	movs r1, #0xbf
	lsls r1, r1, #2
	adds r5, r0, #0
	bl FUN_0201AA8C
	movs r2, #0xbf
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	str r5, [r4]
	str r5, [r4, #0x78]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov97_0221EE84

	thumb_func_start ov97_0221EEA4
ov97_0221EEA4: @ 0x0221EEA4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	str r1, [r5, #4]
	adds r0, r1, #0
	ldr r1, [r5]
	adds r4, r2, #0
	adds r6, r3, #0
	bl ov97_0221F14C
	movs r3, #1
	adds r1, r5, #0
	str r3, [sp]
	movs r0, #0x11
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r5, #4]
	adds r1, #8
	movs r2, #4
	bl FUN_0201D40C
	movs r0, #1
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	movs r0, #0x23
	str r0, [sp, #0x10]
	adds r1, r5, #0
	ldr r0, [r5, #4]
	adds r1, #0x18
	movs r2, #4
	movs r3, #0x16
	bl FUN_0201D40C
	movs r1, #0xf
	str r1, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0x35
	str r0, [sp, #0x10]
	adds r1, r5, #0
	ldr r0, [r5, #4]
	adds r1, #0x28
	movs r2, #5
	movs r3, #1
	bl FUN_0201D40C
	movs r1, #0xf
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0x45
	str r0, [sp, #0x10]
	adds r1, r5, #0
	ldr r0, [r5, #4]
	adds r1, #0x38
	movs r2, #5
	movs r3, #9
	bl FUN_0201D40C
	movs r2, #5
	adds r1, r5, #0
	str r2, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	movs r0, #0x4b
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	adds r1, #0x48
	movs r3, #0xd
	bl FUN_0201D40C
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	movs r0, #0xaf
	str r0, [sp, #0x10]
	adds r1, r5, #0
	ldr r0, [r5, #4]
	adds r1, #0x58
	movs r2, #5
	movs r3, #1
	bl FUN_0201D40C
	movs r1, #0x1b
	adds r2, r1, #0
	ldr r3, [r5]
	movs r0, #1
	adds r2, #0xfb
	bl FUN_0200BAF8
	str r0, [r5, #0x6c]
	ldr r0, [r5]
	bl FUN_0200BD08
	str r0, [r5, #0x70]
	ldr r1, [r5]
	movs r0, #0xb
	bl FUN_02026354
	str r0, [r5, #0x74]
	adds r0, r5, #0
	adds r0, #0x68
	strh r4, [r0]
	adds r0, r5, #0
	adds r0, #0x6a
	strh r6, [r0]
	adds r0, r5, #0
	adds r0, #0x78
	bl ov97_0221F7DC
	adds r0, r5, #0
	adds r0, #0x78
	bl ov97_0221F9E0
	adds r0, r5, #0
	bl ov97_0221F294
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov97_0221EEA4

	thumb_func_start ov97_0221EFD0
ov97_0221EFD0: @ 0x0221EFD0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldrb r2, [r4, #9]
	adds r5, r0, #0
	cmp r2, #2
	bne _0221EFFA
	bl ov97_0221F56C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov97_0221F428
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	pop {r3, r4, r5, pc}
_0221EFFA:
	bl ov97_0221F74C
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	pop {r3, r4, r5, pc}
	thumb_func_end ov97_0221EFD0

	thumb_func_start ov97_0221F010
ov97_0221F010: @ 0x0221F010
	push {r3, lr}
	ldr r0, [r0, #0x7c]
	cmp r0, #0
	beq _0221F01C
	bl FUN_0202457C
_0221F01C:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov97_0221F010

	thumb_func_start ov97_0221F020
ov97_0221F020: @ 0x0221F020
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7, #0x6c]
	bl FUN_0200BB44
	ldr r0, [r7, #0x70]
	bl FUN_0200BDA0
	ldr r0, [r7, #0x74]
	bl FUN_02026380
	adds r0, r7, #0
	adds r0, #8
	bl FUN_0201D520
	adds r0, r7, #0
	adds r0, #0x18
	bl FUN_0201D520
	adds r0, r7, #0
	adds r0, #0x28
	bl FUN_0201D520
	adds r0, r7, #0
	adds r0, #0x38
	bl FUN_0201D520
	adds r0, r7, #0
	adds r0, #0x48
	bl FUN_0201D520
	adds r0, r7, #0
	adds r0, #0x58
	bl FUN_0201D520
	ldr r0, [r7, #4]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r7, #4]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [r7, #4]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [r7, #4]
	movs r1, #7
	bl FUN_0201BB4C
	adds r5, r7, #0
	adds r5, #0x78
	adds r0, r5, #0
	bl ov97_0221F0E0
	movs r4, #0
_0221F092:
	movs r0, #0x18
	muls r0, r4, r0
	adds r6, r5, r0
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _0221F092
	movs r6, #0x13
	movs r4, #0
	lsls r6, r6, #4
_0221F0BC:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_0200A0D0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	blo _0221F0BC
	ldr r0, [r5, #4]
	bl FUN_02024504
	adds r0, r7, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov97_0221F020

	thumb_func_start ov97_0221F0E0
ov97_0221F0E0: @ 0x0221F0E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r6, #0x6d
	str r0, [sp]
	movs r4, #0
	adds r5, r0, #0
	lsls r6, r6, #2
_0221F0EE:
	ldr r0, [r5, r6]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #5
	blt _0221F0EE
	movs r0, #0
	movs r6, #0x1e
	ldr r7, [sp]
	str r0, [sp, #4]
	lsls r6, r6, #4
_0221F106:
	movs r0, #0x77
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_02024758
	movs r4, #0
	adds r5, r7, #0
_0221F114:
	ldr r0, [r5, r6]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #5
	blt _0221F114
	ldr r0, [sp, #4]
	adds r7, #0x18
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #5
	blt _0221F106
	movs r1, #0x95
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_02024758
	movs r1, #0x96
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov97_0221F0E0

	thumb_func_start ov97_0221F14C
ov97_0221F14C: @ 0x0221F14C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov97_0221F1D8
	movs r1, #0
	str r1, [sp]
	movs r0, #0xf3
	movs r2, #4
	adds r3, r1, #0
	str r4, [sp, #4]
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #0xf3
	adds r2, r5, #0
	movs r3, #7
	str r4, [sp, #0xc]
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xf3
	movs r1, #2
	adds r2, r5, #0
	movs r3, #7
	str r4, [sp, #0xc]
	bl FUN_02007914
	adds r0, r5, #0
	movs r1, #7
	bl FUN_0201BF7C
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xf3
	movs r1, #3
	adds r2, r5, #0
	movs r3, #6
	str r4, [sp, #0xc]
	bl FUN_02007914
	adds r0, r5, #0
	movs r1, #6
	bl FUN_0201BF7C
	movs r1, #0x1e
	movs r0, #4
	lsls r1, r1, #4
	adds r2, r4, #0
	bl FUN_02003030
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov97_0221F14C

	thumb_func_start ov97_0221F1D8
ov97_0221F1D8: @ 0x0221F1D8
	push {r3, r4, r5, lr}
	sub sp, #0x70
	ldr r5, _0221F284 @ =0x0221FD20
	adds r4, r0, #0
	ldm r5!, {r0, r1}
	add r3, sp, #0x54
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
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _0221F288 @ =0x0221FD3C
	add r3, sp, #0x38
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
	ldr r5, _0221F28C @ =0x0221FD04
	add r3, sp, #0x1c
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
	ldr r5, _0221F290 @ =0x0221FD58
	add r3, sp, #0
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
	add sp, #0x70
	pop {r3, r4, r5, pc}
	nop
_0221F284: .4byte 0x0221FD20
_0221F288: .4byte 0x0221FD3C
_0221F28C: .4byte 0x0221FD04
_0221F290: .4byte 0x0221FD58
	thumb_func_end ov97_0221F1D8

	thumb_func_start ov97_0221F294
ov97_0221F294: @ 0x0221F294
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x68
	ldrh r2, [r2]
	ldr r0, [r4, #0x70]
	movs r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl FUN_0200C944
	ldr r0, [r4, #0x70]
	ldr r1, [r4, #0x6c]
	ldr r3, [r4]
	movs r2, #0
	bl FUN_0200BC4C
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 @ =0x00010200
	adds r2, r5, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #8
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	adds r0, #8
	bl FUN_0201D578
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0221F32A
	ldr r0, [r4, #0x6c]
	movs r1, #1
	bl FUN_0200BBA0
	movs r1, #0
	adds r5, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 @ =0x00010200
	adds r2, r5, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x18
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_02026380
_0221F32A:
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_0201D578
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r4, #0x6c]
	movs r1, #8
	bl FUN_0200BBA0
	movs r1, #0
	adds r5, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 @ =0x00010200
	adds r2, r5, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x48
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_02026380
	ldr r0, [r4, #0x6c]
	movs r1, #4
	bl FUN_0200BBA0
	adds r5, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x48
	adds r2, r5, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_02026380
	ldr r0, [r4, #0x6c]
	movs r1, #6
	bl FUN_0200BBA0
	adds r5, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x48
	adds r2, r5, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_02026380
	ldr r0, [r4, #0x6c]
	movs r1, #5
	bl FUN_0200BBA0
	adds r5, r0, #0
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x48
	adds r2, r5, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_02026380
	ldr r0, [r4, #0x6c]
	movs r1, #7
	bl FUN_0200BBA0
	adds r5, r0, #0
	movs r0, #0x40
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x48
	adds r2, r5, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_02026380
	adds r4, #0x48
	adds r0, r4, #0
	bl FUN_0201D578
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0221F424: .4byte 0x00010200
	thumb_func_end ov97_0221F294

	thumb_func_start ov97_0221F428
ov97_0221F428: @ 0x0221F428
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x74]
	adds r4, r1, #0
	adds r1, #0xa
	bl FUN_020269A0
	adds r0, r5, #0
	adds r0, #0x28
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F564 @ =0x00010200
	adds r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x74]
	adds r0, #0x28
	bl FUN_020200FC
	adds r0, r5, #0
	adds r0, #0x28
	bl FUN_0201D578
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _0221F4A8
	ldr r0, [r5, #0x6c]
	movs r1, #2
	bl FUN_0200BBA0
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x38
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F568 @ =0x00070800
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x38
	movs r3, #4
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	adds r0, #0x38
	bl FUN_0201D578
	adds r0, r6, #0
	bl FUN_02026380
	b _0221F4FE
_0221F4A8:
	cmp r0, #1
	bne _0221F4EC
	ldr r0, [r5, #0x6c]
	movs r1, #3
	bl FUN_0200BBA0
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x38
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0xc1
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x38
	adds r2, r6, #0
	movs r3, #4
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	adds r0, #0x38
	bl FUN_0201D578
	adds r0, r6, #0
	bl FUN_02026380
	b _0221F4FE
_0221F4EC:
	adds r0, r5, #0
	adds r0, #0x38
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x38
	bl FUN_0201D578
_0221F4FE:
	ldrh r0, [r4, #4]
	ldr r1, [r5]
	bl FUN_0200BCDC
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r3, #2
	str r3, [sp, #4]
	ldr r0, [r5, #0x70]
	movs r1, #0
	adds r2, r4, #0
	bl FUN_0200BE3C
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, [r5, #0x70]
	ldr r1, [r5, #0x6c]
	ldr r3, [r5]
	movs r2, #9
	bl FUN_0200BC4C
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x58
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F564 @ =0x00010200
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x58
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r5, #0x58
	adds r0, r5, #0
	bl FUN_0201D578
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221F564: .4byte 0x00010200
_0221F568: .4byte 0x00070800
	thumb_func_end ov97_0221F428

	thumb_func_start ov97_0221F56C
ov97_0221F56C: @ 0x0221F56C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x78
	adds r0, r5, #0
	adds r6, r1, #0
	bl ov97_0221FBDC
	adds r0, r4, #0
	adds r0, #0x78
	bl ov97_0221FC54
	movs r0, #0xb3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	adds r4, #0x78
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov97_0221F5F8
	ldr r1, _0221F5F4 @ =0x0221FCFC
	add r0, sp, #0
	ldrb r2, [r1]
	add r7, sp, #0
	movs r4, #0
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	strb r2, [r0, #2]
	ldrb r2, [r1, #3]
	ldrb r1, [r1, #4]
	strb r2, [r0, #3]
	strb r1, [r0, #4]
_0221F5B8:
	ldrb r1, [r7, r4]
	adds r0, r6, r1
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221F5D6
	lsls r0, r1, #2
	adds r1, r5, r0
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	b _0221F5E6
_0221F5D6:
	lsls r0, r1, #2
	adds r1, r5, r0
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
_0221F5E6:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	blo _0221F5B8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221F5F4: .4byte 0x0221FCFC
	thumb_func_end ov97_0221F56C

	thumb_func_start ov97_0221F5F8
ov97_0221F5F8: @ 0x0221F5F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	movs r0, #0
	str r1, [sp, #4]
	str r0, [sp, #8]
_0221F604:
	ldr r0, [sp, #8]
	lsls r1, r0, #3
	ldr r0, [sp, #4]
	adds r7, r0, r1
	movs r0, #0x28
	ldrsb r0, [r7, r0]
	cmp r0, #0
	ble _0221F638
	ldr r0, [sp, #8]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r0, [sp]
	adds r4, r0, r1
	movs r0, #0x77
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x77
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #4
	bl FUN_020248F0
	b _0221F674
_0221F638:
	bge _0221F65E
	ldr r0, [sp, #8]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r0, [sp]
	adds r4, r0, r1
	movs r0, #0x77
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x77
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #5
	bl FUN_020248F0
	b _0221F674
_0221F65E:
	ldr r0, [sp, #8]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r0, [sp]
	adds r1, r0, r1
	movs r0, #0x77
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
_0221F674:
	ldr r0, [sp, #8]
	movs r1, #0x18
	muls r1, r0, r1
	ldr r0, [sp]
	movs r4, #0
	adds r5, r0, r1
_0221F680:
	adds r0, r7, r4
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #4
	bhi _0221F72A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221F696: @ jump table
	.2byte _0221F6A0 - _0221F696 - 2 @ case 0
	.2byte _0221F6B2 - _0221F696 - 2 @ case 1
	.2byte _0221F6D0 - _0221F696 - 2 @ case 2
	.2byte _0221F6EE - _0221F696 - 2 @ case 3
	.2byte _0221F70C - _0221F696 - 2 @ case 4
_0221F6A0:
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	b _0221F72E
_0221F6B2:
	lsls r0, r4, #2
	adds r6, r5, r0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #3
	bl FUN_020248F0
	b _0221F72E
_0221F6D0:
	lsls r0, r4, #2
	adds r6, r5, r0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_020248F0
	b _0221F72E
_0221F6EE:
	lsls r0, r4, #2
	adds r6, r5, r0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_020248F0
	b _0221F72E
_0221F70C:
	lsls r0, r4, #2
	adds r6, r5, r0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #2
	bl FUN_020248F0
	b _0221F72E
_0221F72A:
	bl FUN_0202551C
_0221F72E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	blo _0221F680
	ldr r0, [sp, #8]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #5
	bhs _0221F748
	b _0221F604
_0221F748:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov97_0221F5F8

	thumb_func_start ov97_0221F74C
ov97_0221F74C: @ 0x0221F74C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r7, #0x6d
	lsls r7, r7, #2
	str r0, [sp, #4]
	adds r0, #0x78
	adds r6, r7, #0
	str r0, [sp, #4]
	movs r4, #0
	adds r6, #0x14
_0221F760:
	ldr r0, [sp, #4]
	lsls r1, r4, #2
	adds r5, r0, r1
	ldr r0, [r5, r7]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, r6]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	blo _0221F760
	movs r0, #0
	movs r6, #0x1e
	str r0, [sp]
	adds r7, r0, #0
	lsls r6, r6, #4
_0221F78A:
	ldr r1, [sp]
	movs r0, #0x18
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #4]
	movs r1, #0
	adds r5, r0, r2
	movs r0, #0x77
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02024830
	movs r4, #0
_0221F7A4:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, r6]
	adds r1, r7, #0
	bl FUN_02024830
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	blo _0221F7A4
	ldr r0, [sp]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	cmp r0, #5
	blo _0221F78A
	movs r1, #0x95
	ldr r0, [sp, #4]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_02024830
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov97_0221F74C

	thumb_func_start ov97_0221F7DC
ov97_0221F7DC: @ 0x0221F7DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r1, r5, #0
	ldr r2, [r5]
	movs r0, #0x42
	adds r1, #8
	bl FUN_02009F40
	str r0, [r5, #4]
	adds r0, r5, #0
	movs r2, #1
	adds r0, #8
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r7, #0x13
	movs r6, #0
	adds r4, r5, #0
	lsls r7, r7, #4
_0221F80E:
	ldr r2, [r5]
	movs r0, #3
	adds r1, r6, #0
	bl FUN_0200A090
	str r0, [r4, r7]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #6
	blt _0221F80E
	movs r3, #1
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [r5]
	movs r1, #0xf3
	str r0, [sp, #8]
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r2, #7
	bl FUN_0200A1D8
	movs r1, #0x52
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r2, #4
	str r2, [sp, #8]
	ldr r0, [r5]
	subs r1, #0x14
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	movs r1, #0xf3
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x53
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r3, #1
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [r5]
	subs r1, #0x14
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xf3
	movs r2, #6
	bl FUN_0200A294
	movs r1, #0x15
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r3, #1
	str r3, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r0, [r5]
	subs r1, #0x14
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xf3
	movs r2, #5
	bl FUN_0200A294
	movs r1, #0x55
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0xc
	ldr r0, [r5, r1]
	bl FUN_0200ADA4
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5]
	movs r1, #0xa2
	str r0, [sp, #8]
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r2, #0x42
	movs r3, #0
	bl FUN_0200A1D8
	movs r1, #0x16
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldr r0, [r5]
	subs r1, #0x2c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	movs r1, #0xa2
	movs r2, #0x41
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5]
	subs r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xa2
	movs r2, #0x43
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x5a
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r0, [r5]
	subs r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xa2
	movs r2, #0x44
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0xc
	ldr r0, [r5, r1]
	bl FUN_0200ADA4
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [r5]
	movs r1, #0x5d
	str r0, [sp, #8]
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r2, #9
	movs r3, #0
	bl FUN_0200A1D8
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldr r0, [r5]
	subs r1, #0x44
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	movs r1, #0x5d
	movs r2, #6
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x5f
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [r5]
	subs r1, #0x44
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0x5d
	movs r2, #0xa
	movs r3, #0
	bl FUN_0200A294
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5]
	subs r1, #0x44
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0x5d
	movs r2, #0xa
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x61
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0xc
	ldr r0, [r5, r1]
	bl FUN_0200ADA4
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov97_0221F7DC

	thumb_func_start ov97_0221F9E0
ov97_0221F9E0: @ 0x0221F9E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r4, #0
_0221F9E8:
	lsls r6, r4, #5
	adds r6, #0x68
	lsls r0, r4, #2
	adds r7, r5, r0
	str r6, [sp]
	movs r0, #0xa8
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #2
	movs r3, #0
	bl ov97_0221FAEC
	movs r1, #0x6d
	lsls r1, r1, #2
	str r0, [r7, r1]
	movs r1, #1
	str r6, [sp]
	movs r0, #0xa8
	str r0, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #0
	bl ov97_0221FAEC
	movs r1, #0x72
	lsls r1, r1, #2
	str r0, [r7, r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	blo _0221F9E8
	movs r0, #0
	str r0, [sp, #0x10]
_0221FA3C:
	ldr r1, _0221FAE8 @ =0x0221FCF4
	ldr r0, [sp, #0x10]
	movs r2, #1
	ldrb r0, [r1, r0]
	movs r1, #0x18
	movs r3, #0
	lsls r6, r0, #4
	ldr r0, [sp, #0x10]
	adds r6, #0x30
	muls r1, r0, r1
	movs r0, #0x60
	str r0, [sp]
	adds r7, r5, r1
	str r6, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #2
	bl ov97_0221FAEC
	movs r1, #0x77
	lsls r1, r1, #2
	str r0, [r7, r1]
	movs r4, #0
_0221FA70:
	lsls r0, r4, #4
	adds r0, #0xa8
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #2
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #0
	bl ov97_0221FAEC
	lsls r1, r4, #2
	adds r2, r7, r1
	movs r1, #0x1e
	lsls r1, r1, #4
	str r0, [r2, r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	blo _0221FA70
	ldr r0, [sp, #0x10]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	cmp r0, #5
	blo _0221FA3C
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0x48
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	adds r0, r5, #0
	movs r1, #3
	adds r3, r2, #0
	str r2, [sp, #0xc]
	bl ov97_0221FAEC
	movs r1, #0x95
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r1, #0x32
	ldr r0, [r5]
	lsls r1, r1, #6
	bl FUN_0201AA8C
	movs r1, #0x96
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov97_0221FBA0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0221FAE8: .4byte 0x0221FCF4
	thumb_func_end ov97_0221F9E0

	thumb_func_start ov97_0221FAEC
ov97_0221FAEC: @ 0x0221FAEC
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
	movs r0, #0x13
	str r2, [sp, #0xc]
	lsls r0, r0, #4
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
	add r0, sp, #0x2c
	adds r2, r1, #0
	bl FUN_02009D48
	ldr r0, [r4]
	add r2, sp, #0x2c
	str r0, [sp]
	ldr r1, [r4, #4]
	add r0, sp, #0x50
	movs r3, #2
	bl ov97_0221FB80
	ldr r0, [sp, #0x90]
	str r5, [sp, #0x74]
	lsls r0, r0, #0xc
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x94]
	lsls r1, r0, #0xc
	movs r0, #1
	lsls r0, r0, #0x14
	adds r0, r1, r0
	str r0, [sp, #0x5c]
	add r0, sp, #0x50
	bl FUN_02024624
	movs r1, #1
	adds r4, r0, #0
	bl FUN_0202484C
	ldr r1, [sp, #0x98]
	adds r0, r4, #0
	bl FUN_020248F0
	adds r0, r4, #0
	movs r1, #1
	bl FUN_02024A04
	ldr r1, [sp, #0x9c]
	adds r0, r4, #0
	bl FUN_02024830
	adds r0, r4, #0
	add sp, #0x80
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov97_0221FAEC

	thumb_func_start ov97_0221FB80
ov97_0221FB80: @ 0x0221FB80
	str r1, [r0]
	str r2, [r0, #4]
	movs r2, #0
	movs r1, #1
	str r2, [r0, #0x10]
	lsls r1, r1, #0xc
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	strh r2, [r0, #0x20]
	str r2, [r0, #0x24]
	ldr r1, [sp]
	str r3, [r0, #0x28]
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0
	thumb_func_end ov97_0221FB80

	thumb_func_start ov97_0221FBA0
ov97_0221FBA0: @ 0x0221FBA0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r4, [r5, r0]
	subs r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200AF00
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200B0F8
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #2
	blx FUN_020B802C
	movs r1, #0x9f
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #2
	blx FUN_020B8078
	movs r1, #0xa
	lsls r1, r1, #6
	str r0, [r5, r1]
	pop {r4, r5, r6, pc}
	thumb_func_end ov97_0221FBA0

	thumb_func_start ov97_0221FBDC
ov97_0221FBDC: @ 0x0221FBDC
	push {r4, r5, lr}
	sub sp, #0x24
	adds r5, r1, #0
	adds r4, r0, #0
	ldrb r0, [r5, #6]
	movs r3, #2
	str r0, [sp]
	ldrb r0, [r5, #7]
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	ldrh r1, [r5, #4]
	ldrb r2, [r5, #8]
	add r0, sp, #0x14
	bl FUN_020701E4
	ldr r0, [r5]
	movs r3, #0x96
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldrh r0, [r5, #4]
	add r1, sp, #0x10
	lsls r3, r3, #2
	str r0, [sp, #0xc]
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	ldr r2, [r4]
	ldr r3, [r4, r3]
	bl FUN_02014540
	add r1, sp, #0x10
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #8]
	ldr r2, [r4]
	bl FUN_02007524
	add r1, sp, #0x10
	adds r5, r0, #0
	blx FUN_020B7140
	cmp r0, #1
	beq _0221FC3A
	bl FUN_0202551C
_0221FC3A:
	ldr r0, [sp, #0x10]
	movs r1, #0x97
	lsls r1, r1, #2
	ldr r0, [r0, #0xc]
	adds r1, r4, r1
	movs r2, #0x20
	blx FUN_020D47B8
	adds r0, r5, #0
	bl FUN_0201AB0C
	add sp, #0x24
	pop {r4, r5, pc}
	thumb_func_end ov97_0221FBDC

	thumb_func_start ov97_0221FC54
ov97_0221FC54: @ 0x0221FC54
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x96
	lsls r0, r0, #2
	movs r1, #0x32
	ldr r0, [r4, r0]
	lsls r1, r1, #6
	blx FUN_020D2894
	movs r1, #0x96
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x24
	movs r2, #0x32
	ldr r1, [r4, r1]
	lsls r2, r2, #6
	blx FUN_020CFECC
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x20
	blx FUN_020D2894
	movs r1, #0x97
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, #0x24
	ldr r1, [r4, r1]
	movs r2, #0x20
	blx FUN_020CFD70
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov97_0221FC54

	.rodata

_0221FC98:
	.byte 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x01, 0x03, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03, 0x02, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02, 0x01, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	@ 0x0221FD74
