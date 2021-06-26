
	thumb_func_start ov98_0221E5C0
ov98_0221E5C0: @ 0x0221E5C0
	push {r4, lr}
	adds r4, r0, #0
	bne _0221E5CA
	bl FUN_0202551C
_0221E5CA:
	ldr r0, [r4, #4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov98_0221E5C0

	thumb_func_start ov98_0221E5D0
ov98_0221E5D0: @ 0x0221E5D0
	push {r4, lr}
	adds r4, r0, #0
	bne _0221E5DA
	bl FUN_0202551C
_0221E5DA:
	ldr r0, [r4, #8]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov98_0221E5D0

	thumb_func_start ov98_0221E5E0
ov98_0221E5E0: @ 0x0221E5E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r1, [sp]
	movs r1, #0x18
	adds r6, r0, #0
	adds r5, r2, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	str r6, [r4]
	adds r0, r6, #0
	bl FUN_0200CF18
	str r0, [r4, #4]
	bl FUN_0200CF38
	str r0, [r4, #8]
	ldr r1, [r4]
	movs r0, #0x14
	bl FUN_02007688
	str r0, [r4, #0x10]
	movs r0, #0
	mvns r0, r0
	add r2, sp, #0x18
	ldr r3, _0221E67C @ =0x0221F1C0
	strb r0, [r4, #0x14]
	ldm r3!, {r0, r1}
	adds r6, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r3, _0221E680 @ =0x0221F1AC
	add r2, sp, #4
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r1, r6, #0
	str r0, [r2]
	str r5, [sp, #4]
	ldr r0, [r4, #4]
	adds r2, r7, #0
	movs r3, #0x20
	bl FUN_0200CF70
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	adds r2, r5, #0
	bl FUN_0200CFF4
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	ldr r2, [sp]
	bl FUN_0200D3F8
	ldr r0, [r4]
	bl FUN_020030E8
	str r0, [r4, #0xc]
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	adds r0, r4, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E67C: .4byte 0x0221F1C0
_0221E680: .4byte 0x0221F1AC
	thumb_func_end ov98_0221E5E0

	thumb_func_start ov98_0221E684
ov98_0221E684: @ 0x0221E684
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7, #0x10]
	adds r5, r1, #0
	adds r6, r2, #0
	bl FUN_0200770C
	ldr r0, [r7, #0xc]
	bl FUN_02003104
	movs r4, #0
	cmp r6, #0
	bls _0221E6B4
_0221E69E:
	ldr r0, [r5]
	cmp r0, #0
	beq _0221E6AC
	bl FUN_0200D9DC
	movs r0, #0
	str r0, [r5]
_0221E6AC:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r6
	blo _0221E69E
_0221E6B4:
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl FUN_0200D998
	ldr r0, [r7, #4]
	bl FUN_0200D108
	adds r0, r7, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov98_0221E684

	thumb_func_start ov98_0221E6CC
ov98_0221E6CC: @ 0x0221E6CC
	push {r4, lr}
	adds r4, r0, #0
	bne _0221E6D6
	bl FUN_0202551C
_0221E6D6:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov98_0221E6CC

	thumb_func_start ov98_0221E6E0
ov98_0221E6E0: @ 0x0221E6E0
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, [r3, #4]
	ldr r1, [r3, #8]
	ldr r3, _0221E6EC @ =FUN_0200D734
	bx r3
	.align 2, 0
_0221E6EC: .4byte FUN_0200D734
	thumb_func_end ov98_0221E6E0

	thumb_func_start ov98_0221E6F0
ov98_0221E6F0: @ 0x0221E6F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp]
	ldr r0, [sp, #0x58]
	adds r5, r2, #0
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x5c]
	adds r4, r1, #0
	str r0, [sp, #0x5c]
	movs r0, #0
	add r2, sp, #8
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	str r0, [r2]
	adds r0, r3, #0
	str r3, [sp, #4]
	cmp r0, #0xa
	bls _0221E722
	bl FUN_0202551C
_0221E722:
	add r1, sp, #0x40
	movs r0, #0x14
	ldrsh r6, [r1, r0]
	ldr r0, [sp, #0x50]
	movs r7, #0
	lsls r0, r0, #2
	adds r4, r4, r0
_0221E730:
	ldr r0, [sp, #4]
	cmp r7, r0
	bhs _0221E73A
	movs r1, #1
	b _0221E73C
_0221E73A:
	movs r1, #0
_0221E73C:
	add r0, sp, #8
	strh r1, [r0, #6]
	ldr r0, [r5]
	str r0, [sp, #0x1c]
	ldr r0, [r5, #4]
	str r0, [sp, #0x20]
	ldr r0, [r5, #8]
	str r0, [sp, #0x24]
	ldr r0, [r5, #0xc]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	beq _0221E75A
	movs r0, #1
	b _0221E75C
_0221E75A:
	movs r0, #2
_0221E75C:
	str r0, [sp, #0x18]
	add r0, sp, #8
	strh r6, [r0]
	ldr r1, [sp, #0x58]
	strh r1, [r0, #2]
	ldr r0, [sp]
	add r1, sp, #8
	bl ov98_0221E6E0
	movs r1, #1
	stm r4!, {r0}
	bl FUN_0200DC78
	adds r7, r7, #1
	adds r6, #0x10
	cmp r7, #0xa
	blo _0221E730
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov98_0221E6F0

	thumb_func_start ov98_0221E784
ov98_0221E784: @ 0x0221E784
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r2, #0
	movs r2, #0
	adds r4, r3, #0
	str r2, [sp]
	str r4, [sp, #4]
	ldr r2, [r5]
	movs r3, #0x4c
	str r2, [sp, #8]
	movs r2, #8
	adds r6, r0, #0
	adds r7, r1, #0
	bl FUN_0200D4A4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [r5, #4]
	adds r1, r7, #0
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r2, #8
	movs r3, #0x4b
	bl FUN_0200D564
	movs r0, #0
	str r0, [sp]
	ldr r0, [r5, #8]
	adds r1, r7, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #8
	movs r3, #0x4d
	bl FUN_0200D6D4
	movs r0, #0
	str r0, [sp]
	ldr r0, [r5, #0xc]
	adds r1, r7, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #8
	movs r3, #0x4e
	bl FUN_0200D704
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov98_0221E784

	thumb_func_start ov98_0221E7E8
ov98_0221E7E8: @ 0x0221E7E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r4, r1, #0
	str r2, [sp, #0x14]
	ldr r2, [r4]
	adds r5, r0, #0
	lsls r1, r2, #0x17
	adds r6, r3, #0
	lsrs r1, r1, #0x17
	bne _0221E806
	movs r1, #0
	bl FUN_0200DCE8
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
_0221E806:
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x1f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4]
	lsls r1, r1, #0x10
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x1b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	lsrs r1, r1, #0x10
	str r0, [sp, #8]
	ldr r2, [r4]
	add r0, sp, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x1e
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r3, #2
	bl FUN_020701E4
	ldr r3, _0221E8A4 @ =0x0221F19C
	add r2, sp, #0x18
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r1, #0x32
	ldr r0, [sp, #0x50]
	lsls r1, r1, #6
	bl FUN_0201AACC
	adds r7, r0, #0
	str r7, [sp]
	ldr r0, [r4, #4]
	add r1, sp, #0x18
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	ldr r0, [r4]
	ldr r2, [sp, #0x50]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x17
	str r0, [sp, #0x10]
	ldrh r0, [r1, #0x10]
	ldrh r1, [r1, #0x12]
	add r3, sp, #0x18
	bl FUN_02014510
	movs r2, #0x32
	adds r0, r5, #0
	adds r1, r7, #0
	lsls r2, r2, #6
	bl ov98_0221E9FC
	ldr r0, [sp, #0x50]
	str r6, [sp]
	str r0, [sp, #4]
	add r2, sp, #0x18
	ldrh r1, [r2, #0x10]
	ldrh r2, [r2, #0x14]
	ldr r3, [sp, #0x14]
	adds r0, r5, #0
	bl ov98_0221EA4C
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200DCE8
	adds r0, r7, #0
	bl FUN_0201AB0C
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221E8A4: .4byte 0x0221F19C
	thumb_func_end ov98_0221E7E8

	thumb_func_start ov98_0221E8A8
ov98_0221E8A8: @ 0x0221E8A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r0, [sp, #0x10]
	ldr r7, [r0, #4]
	ldr r6, [r0, #8]
	ldr r0, [sp, #0x40]
	adds r5, r1, #0
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	cmp r0, #0
	beq _0221E8C4
	movs r0, #0x1c
	str r0, [sp, #0x1c]
	b _0221E8C8
_0221E8C4:
	movs r0, #0x1d
	str r0, [sp, #0x1c]
_0221E8C8:
	bl FUN_0207449C
	str r0, [sp, #0x28]
	bl FUN_020744A8
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x14]
	movs r4, #0
	cmp r0, #0
	ble _0221E908
	ldr r0, [sp, #0x18]
	lsls r1, r0, #2
	ldr r0, _0221E96C @ =_0221F194
	ldr r0, [r0, r1]
	str r0, [sp, #0x20]
_0221E8E6:
	movs r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #0x1c]
	str r0, [sp, #4]
	ldr r0, [r5]
	adds r1, r6, #0
	adds r0, r0, r4
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r2, #0xb1
	bl FUN_0200D4A4
	ldr r0, [sp, #0x14]
	adds r4, r4, #1
	cmp r4, r0
	blt _0221E8E6
_0221E908:
	movs r0, #0
	str r0, [sp]
	ldr r0, [r5, #8]
	ldr r3, [sp, #0x28]
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x14
	bl FUN_0200D6D4
	movs r0, #0
	str r0, [sp]
	ldr r0, [r5, #0xc]
	ldr r3, [sp, #0x24]
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x14
	bl FUN_0200D704
	ldr r0, [sp, #0x10]
	movs r1, #0x14
	ldrsb r0, [r0, r1]
	subs r1, #0x15
	cmp r0, r1
	bne _0221E966
	bl FUN_02074490
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	movs r2, #0x14
	lsls r1, r0, #2
	ldr r0, _0221E96C @ =_0221F194
	ldr r0, [r0, r1]
	adds r1, r6, #0
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	str r0, [sp, #0xc]
	adds r0, r7, #0
	bl FUN_0200D564
	ldr r1, [sp, #0x10]
	strb r0, [r1, #0x14]
_0221E966:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_0221E96C: .4byte _0221F194
	thumb_func_end ov98_0221E8A8

	thumb_func_start ov98_0221E970
ov98_0221E970: @ 0x0221E970
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	movs r4, #2
	ldr r0, [sp, #0x20]
	adds r5, r1, #0
	lsls r4, r4, #8
	cmp r0, #0
	beq _0221E984
	lsls r4, r4, #1
_0221E984:
	ldr r0, [r2]
	lsls r1, r0, #0x17
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x1b
	str r0, [sp]
	lsrs r7, r1, #0x17
	ldr r2, [sp]
	adds r0, r7, #0
	movs r1, #0
	bl FUN_020741BC
	adds r1, r0, #0
	adds r0, r6, #0
	add r2, sp, #8
	bl ov98_0221EAA8
	ldr r1, [sp, #8]
	str r0, [sp, #4]
	ldr r1, [r1, #0x14]
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov98_0221E9FC
	ldr r0, [sp, #4]
	bl FUN_0201AB0C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0200DCE8
	ldr r1, [sp]
	adds r0, r7, #0
	movs r2, #0
	bl FUN_02074364
	movs r1, #0x14
	adds r2, r0, #0
	ldrsb r1, [r6, r1]
	adds r0, r5, #0
	adds r1, r2, r1
	bl FUN_0200DD10
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0221E9F8
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200DC4C
	movs r1, #1
	adds r0, r5, #0
	lsls r1, r1, #0xc
	bl FUN_0200DC8C
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200DC78
_0221E9F8:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov98_0221E970

	thumb_func_start ov98_0221E9FC
ov98_0221E9FC: @ 0x0221E9FC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r6, r1, #0
	adds r7, r2, #0
	bl FUN_02024B60
	adds r4, r0, #0
	ldr r0, [r5]
	bl FUN_02024B1C
	adds r1, r4, #0
	blx FUN_020B802C
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	blx FUN_020D2894
	cmp r4, #1
	beq _0221EA2C
	cmp r4, #2
	beq _0221EA38
	b _0221EA44
_0221EA2C:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	blx FUN_020CFE74
	pop {r3, r4, r5, r6, r7, pc}
_0221EA38:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	blx FUN_020CFECC
	pop {r3, r4, r5, r6, r7, pc}
_0221EA44:
	bl FUN_0202551C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov98_0221E9FC

	thumb_func_start ov98_0221EA4C
ov98_0221EA4C: @ 0x0221EA4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r1, #0
	str r2, [sp, #8]
	adds r4, r3, #0
	beq _0221EA5E
	movs r5, #1
	adds r6, r5, #0
	b _0221EA62
_0221EA5E:
	movs r5, #2
	movs r6, #5
_0221EA62:
	ldr r0, [r0]
	bl FUN_02024B34
	adds r1, r5, #0
	blx FUN_020B8078
	adds r5, r0, #0
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #8]
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl FUN_02007938
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0221EA9C
	cmp r4, #0
	beq _0221EA92
	ldr r0, _0221EAA0 @ =0x05000200
	b _0221EA94
_0221EA92:
	ldr r0, _0221EAA4 @ =0x05000600
_0221EA94:
	adds r0, r5, r0
	movs r1, #0x20
	bl FUN_02003F04
_0221EA9C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221EAA0: .4byte 0x05000200
_0221EAA4: .4byte 0x05000600
	thumb_func_end ov98_0221EA4C

	thumb_func_start ov98_0221EAA8
ov98_0221EAA8: @ 0x0221EAA8
	push {r3, lr}
	adds r3, r2, #0
	ldr r2, [r0]
	str r2, [sp]
	ldr r0, [r0, #0x10]
	movs r2, #0
	bl FUN_02007C10
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov98_0221EAA8

	thumb_func_start ov98_0221EABC
ov98_0221EABC: @ 0x0221EABC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	ldr r1, [sp]
	movs r0, #4
	str r2, [sp, #8]
	adds r6, r3, #0
	bl FUN_02002CEC
	ldr r0, [sp]
	movs r1, #0x1c
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x1c
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [sp, #8]
	lsls r5, r0, #4
	ldr r0, [sp]
	adds r1, r5, #0
	bl FUN_0201AA8C
	movs r1, #0
	adds r2, r5, #0
	str r0, [r4, #4]
	blx FUN_020D4994
	movs r1, #6
	ldr r2, [sp]
	movs r0, #0
	lsls r1, r1, #6
	bl FUN_02003030
	movs r1, #6
	ldr r2, [sp]
	movs r0, #4
	lsls r1, r1, #6
	bl FUN_02003030
	ldr r0, [sp, #8]
	movs r7, #0
	cmp r0, #0
	ble _0221EB44
	adds r5, r7, #0
_0221EB1A:
	ldr r1, [r4, #4]
	ldr r0, [sp, #4]
	adds r1, r1, r5
	adds r2, r6, #0
	bl FUN_0201D4F8
	ldr r0, [r4, #4]
	movs r1, #0
	adds r0, r0, r5
	bl FUN_0201D978
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D634
	ldr r0, [sp, #8]
	adds r7, r7, #1
	adds r6, #8
	adds r5, #0x10
	cmp r7, r0
	blt _0221EB1A
_0221EB44:
	ldr r3, [sp]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xed
	bl FUN_0200BAF8
	str r0, [r4, #0xc]
	ldr r2, [sp, #0x20]
	ldr r3, [sp]
	movs r0, #1
	movs r1, #0x1b
	bl FUN_0200BAF8
	str r0, [r4, #8]
	ldr r0, [sp]
	bl FUN_0200BD08
	str r0, [r4, #0x10]
	movs r0, #1
	ldr r1, [sp]
	lsls r0, r0, #0xa
	bl FUN_02026354
	str r0, [r4, #0x14]
	ldr r0, [sp]
	str r0, [r4]
	ldr r0, [sp, #8]
	str r0, [r4, #0x18]
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov98_0221EABC

	thumb_func_start ov98_0221EB84
ov98_0221EB84: @ 0x0221EB84
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #4
	adds r7, r1, #0
	bl FUN_02002DB4
	ldr r0, [r5, #0x14]
	bl FUN_02026380
	ldr r0, [r5, #0x10]
	bl FUN_0200BDA0
	ldr r0, [r5, #0xc]
	bl FUN_0200BB44
	ldr r0, [r5, #8]
	bl FUN_0200BB44
	movs r6, #0
	cmp r7, #0
	ble _0221EBC8
	adds r4, r6, #0
_0221EBB0:
	ldr r0, [r5, #4]
	adds r0, r0, r4
	bl FUN_0201D8C8
	ldr r0, [r5, #4]
	adds r0, r0, r4
	bl FUN_0201D520
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, r7
	blt _0221EBB0
_0221EBC8:
	ldr r0, [r5, #4]
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov98_0221EB84

	thumb_func_start ov98_0221EBD8
ov98_0221EBD8: @ 0x0221EBD8
	push {r4, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	bl ov98_0221EBEC
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov98_0221EBD8

	thumb_func_start ov98_0221EBEC
ov98_0221EBEC: @ 0x0221EBEC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	movs r4, #0
	str r4, [sp]
	add r5, sp, #0x10
	ldrb r5, [r5, #0x10]
	str r5, [sp, #4]
	ldr r5, [sp, #0x24]
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	bl ov98_0221EC3C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov98_0221EBEC

	thumb_func_start ov98_0221EC08
ov98_0221EC08: @ 0x0221EC08
	push {r3, lr}
	sub sp, #0x10
	str r3, [sp]
	add r3, sp, #8
	ldrb r3, [r3, #0x10]
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	bl ov98_0221EC3C
	add sp, #0x10
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov98_0221EC08

	thumb_func_start ov98_0221EC24
ov98_0221EC24: @ 0x0221EC24
	push {r4, lr}
	sub sp, #0x10
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r3, [sp, #0xc]
	movs r3, #1
	bl ov98_0221EC3C
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov98_0221EC24

	thumb_func_start ov98_0221EC3C
ov98_0221EC3C: @ 0x0221EC3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp, #0x10]
	movs r4, #0
	cmp r6, r0
	blo _0221EC54
	bl FUN_0202551C
_0221EC54:
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #8]
	ldr r3, [r5]
	adds r2, r7, #0
	bl FUN_0200BC4C
	adds r7, r0, #0
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0221EC8A
	ldr r1, [r5, #4]
	lsls r0, r6, #4
	adds r0, r1, r0
	bl FUN_0201EE90
	lsls r0, r0, #0x1b
	lsrs r4, r0, #0x18
	ldr r0, [sp, #0x30]
	adds r1, r7, #0
	movs r2, #0
	bl FUN_02003068
	subs r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x17
	lsrs r4, r0, #0x18
_0221EC8A:
	add r1, sp, #0x18
	ldr r0, [r5, #4]
	lsls r6, r6, #4
	ldrb r1, [r1, #0x1c]
	adds r0, r0, r6
	bl FUN_0201D978
	add r3, sp, #0x18
	ldrb r0, [r3, #0x14]
	ldr r1, [sp, #0x30]
	adds r2, r7, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221ECCC @ =0x00010200
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r3, #0x10]
	ldr r0, [r5, #4]
	adds r0, r0, r6
	adds r3, r4, r3
	bl FUN_020200FC
	ldr r0, [r5, #4]
	adds r0, r0, r6
	bl FUN_0201D5C8
	adds r0, r7, #0
	bl FUN_02026380
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221ECCC: .4byte 0x00010200
	thumb_func_end ov98_0221EC3C

	thumb_func_start ov98_0221ECD0
ov98_0221ECD0: @ 0x0221ECD0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r4, r1, #0
	adds r6, r2, #0
	str r0, [sp, #4]
	adds r2, r3, #0
	ldr r0, [r5, #0x10]
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x20]
	bl FUN_0200BFCC
	ldr r0, [r5, #8]
	adds r1, r6, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov98_0221EF14
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221ED38 @ =0x00010200
	lsls r4, r4, #4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x14]
	adds r0, r0, r4
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, [r5, #4]
	adds r0, r0, r4
	bl FUN_0201D5C8
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0221ED38: .4byte 0x00010200
	thumb_func_end ov98_0221ECD0

	thumb_func_start ov98_0221ED3C
ov98_0221ED3C: @ 0x0221ED3C
	push {r3, lr}
	movs r3, #0
	str r3, [sp]
	bl ov98_0221ED48
	pop {r3, pc}
	thumb_func_end ov98_0221ED3C

	thumb_func_start ov98_0221ED48
ov98_0221ED48: @ 0x0221ED48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #8]
	adds r5, r1, #0
	adds r1, r2, #0
	adds r6, r3, #0
	bl FUN_0200BBA0
	adds r7, r0, #0
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	adds r2, r7, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov98_0221EF14
	add r0, sp, #0x18
	ldrb r0, [r0, #0x10]
	movs r1, #0
	lsls r5, r5, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EDA0 @ =0x00010200
	adds r3, r6, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x14]
	adds r0, r0, r5
	bl FUN_020200FC
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D5C8
	adds r0, r7, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221EDA0: .4byte 0x00010200
	thumb_func_end ov98_0221ED48

	thumb_func_start ov98_0221EDA4
ov98_0221EDA4: @ 0x0221EDA4
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	movs r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, [r0, #0x10]
	adds r2, r5, #0
	adds r3, r4, #0
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov98_0221EDA4

	thumb_func_start ov98_0221EDC4
ov98_0221EDC4: @ 0x0221EDC4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r2, #0
	adds r4, r1, #0
	ldr r0, [r5, #0x10]
	ldr r2, [sp, #0x20]
	adds r1, r3, #0
	bl FUN_0200BE48
	ldr r0, [r5, #8]
	adds r1, r6, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov98_0221EF14
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EE24 @ =0x00010200
	lsls r4, r4, #4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x14]
	adds r0, r0, r4
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, [r5, #4]
	adds r0, r0, r4
	bl FUN_0201D5C8
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0221EE24: .4byte 0x00010200
	thumb_func_end ov98_0221EDC4

	thumb_func_start ov98_0221EE28
ov98_0221EE28: @ 0x0221EE28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0221EE7C @ =0x000001ED
	adds r7, r2, #0
	adds r4, r1, #0
	ldr r6, [r5, #0xc]
	cmp r7, r0
	bls _0221EE3E
	bl FUN_0202551C
_0221EE3E:
	ldr r2, [r5, #0x14]
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #4]
	lsls r4, r4, #4
	adds r0, r0, r4
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EE80 @ =0x00010200
	adds r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x14]
	adds r0, r0, r4
	bl FUN_020200FC
	ldr r0, [r5, #4]
	adds r0, r0, r4
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221EE7C: .4byte 0x000001ED
_0221EE80: .4byte 0x00010200
	thumb_func_end ov98_0221EE28

	thumb_func_start ov98_0221EE84
ov98_0221EE84: @ 0x0221EE84
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov98_0221EF14
	ldr r1, [r5, #4]
	lsls r0, r4, #4
	adds r0, r1, r0
	bl FUN_0201D5C8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov98_0221EE84

	thumb_func_start ov98_0221EE9C
ov98_0221EE9C: @ 0x0221EE9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov98_0221EF14
	add r0, sp, #0x18
	ldrb r0, [r0, #0x10]
	movs r1, #0
	lsls r5, r5, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EED8 @ =0x00010200
	adds r2, r6, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	adds r3, r7, #0
	adds r0, r0, r5
	bl FUN_020200FC
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221EED8: .4byte 0x00010200
	thumb_func_end ov98_0221EE9C

	thumb_func_start ov98_0221EEDC
ov98_0221EEDC: @ 0x0221EEDC
	ldr r2, [r0, #4]
	lsls r0, r1, #4
	ldr r3, _0221EEE8 @ =FUN_0201D8E4
	adds r0, r2, r0
	bx r3
	nop
_0221EEE8: .4byte FUN_0201D8E4
	thumb_func_end ov98_0221EEDC

	thumb_func_start ov98_0221EEEC
ov98_0221EEEC: @ 0x0221EEEC
	ldr r3, [r0, #4]
	lsls r0, r1, #4
	adds r0, r3, r0
	ldr r3, _0221EEF8 @ =FUN_0201EEAC
	adds r1, r2, #0
	bx r3
	.align 2, 0
_0221EEF8: .4byte FUN_0201EEAC
	thumb_func_end ov98_0221EEEC

	thumb_func_start ov98_0221EEFC
ov98_0221EEFC: @ 0x0221EEFC
	push {r4, lr}
	adds r4, r0, #0
	bne _0221EF06
	bl FUN_0202551C
_0221EF06:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0221EF10
	bl FUN_0202551C
_0221EF10:
	ldr r0, [r4, #0x10]
	pop {r4, pc}
	thumb_func_end ov98_0221EEFC

	thumb_func_start ov98_0221EF14
ov98_0221EF14: @ 0x0221EF14
	ldr r2, [r0, #4]
	lsls r0, r1, #4
	ldr r3, _0221EF20 @ =FUN_0201D978
	adds r0, r2, r0
	movs r1, #0
	bx r3
	.align 2, 0
_0221EF20: .4byte FUN_0201D978
	thumb_func_end ov98_0221EF14

	thumb_func_start ov98_0221EF24
ov98_0221EF24: @ 0x0221EF24
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, _0221EF5C @ =0x0221F1E0
	add r1, sp, #0
	ldrb r3, [r2]
	add r0, sp, #0
	movs r4, #0
	strb r3, [r1]
	ldrb r3, [r2, #1]
	strb r3, [r1, #1]
	ldrb r3, [r2, #2]
	ldrb r2, [r2, #3]
	strb r3, [r1, #2]
	strb r2, [r1, #3]
	bl FUN_02025320
	cmp r0, #0
	bne _0221EF52
	ldr r0, _0221EF60 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _0221EF54
_0221EF52:
	movs r4, #1
_0221EF54:
	adds r0, r4, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_0221EF5C: .4byte 0x0221F1E0
_0221EF60: .4byte 0x021D110C
	thumb_func_end ov98_0221EF24

	thumb_func_start ov98_0221EF64
ov98_0221EF64: @ 0x0221EF64
	ldr r1, _0221EF7C @ =0x000001C2
	cmp r0, r1
	blo _0221EF6E
	movs r0, #2
	bx lr
_0221EF6E:
	subs r1, #0x1e
	cmp r0, r1
	blo _0221EF78
	movs r0, #1
	bx lr
_0221EF78:
	movs r0, #0
	bx lr
	.align 2, 0
_0221EF7C: .4byte 0x000001C2
	thumb_func_end ov98_0221EF64

	thumb_func_start ov98_0221EF80
ov98_0221EF80: @ 0x0221EF80
	ldr r2, _0221EFA0 @ =0x0221F220
	movs r3, #0
_0221EF84:
	lsls r1, r3, #2
	ldr r1, [r2, r1]
	cmp r1, r0
	ble _0221EF96
	adds r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #0xa
	blo _0221EF84
_0221EF96:
	movs r0, #0xa
	subs r0, r0, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0221EFA0: .4byte 0x0221F220
	thumb_func_end ov98_0221EF80

	thumb_func_start ov98_0221EFA4
ov98_0221EFA4: @ 0x0221EFA4
	lsls r2, r0, #2
	ldr r0, _0221EFB0 @ =0x0221F1F8
	lsls r1, r1, #1
	adds r0, r0, r2
	ldrh r0, [r1, r0]
	bx lr
	.align 2, 0
_0221EFB0: .4byte 0x0221F1F8
	thumb_func_end ov98_0221EFA4

	thumb_func_start ov98_0221EFB4
ov98_0221EFB4: @ 0x0221EFB4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	bl ov98_0221EFA4
	ldr r1, _0221EFE4 @ =0x0000FFFF
	cmp r4, r1
	bne _0221EFC8
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221EFC8:
	cmp r5, #0
	bne _0221EFD8
	cmp r4, r0
	bhs _0221EFD4
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221EFD4:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221EFD8:
	cmp r4, r0
	bls _0221EFE0
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221EFE0:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221EFE4: .4byte 0x0000FFFF
	thumb_func_end ov98_0221EFB4

	thumb_func_start ov98_0221EFE8
ov98_0221EFE8: @ 0x0221EFE8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	bl ov98_0221EFA4
	ldr r1, _0221F018 @ =0x0000FFFF
	cmp r4, r1
	bne _0221EFFC
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221EFFC:
	cmp r5, #0
	bne _0221F00C
	cmp r4, r0
	bhi _0221F008
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221F008:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221F00C:
	cmp r4, r0
	blo _0221F014
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221F014:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221F018: .4byte 0x0000FFFF
	thumb_func_end ov98_0221EFE8

	thumb_func_start ov98_0221F01C
ov98_0221F01C: @ 0x0221F01C
	lsls r1, r1, #3
	ldrh r0, [r0, r1]
	bx lr
	.align 2, 0
	thumb_func_end ov98_0221F01C

	thumb_func_start ov98_0221F024
ov98_0221F024: @ 0x0221F024
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r5, _0221F050 @ =0x00000000
	bne _0221F030
	bl FUN_0202551C
_0221F030:
	ldr r7, _0221F054 @ =0x000001ED
	movs r4, #0
_0221F034:
	ldrb r0, [r6, r4]
	blx FUN_020E3714
	cmp r0, #5
	bne _0221F044
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0221F044:
	adds r4, r4, #1
	cmp r4, r7
	blt _0221F034
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221F050: .4byte 0x00000000
_0221F054: .4byte 0x000001ED
	thumb_func_end ov98_0221F024

	thumb_func_start ov98_0221F058
ov98_0221F058: @ 0x0221F058
	push {r3, r4, r5, r6, r7, lr}
	movs r5, #0
	adds r6, r0, #0
	adds r4, r5, #0
	movs r7, #0x2c
_0221F062:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r6, r0
	movs r1, #0
	bl ov98_0221F01C
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #1
	bl ov98_0221EFE8
	cmp r0, #0
	beq _0221F082
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0221F082:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xa
	blo _0221F062
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov98_0221F058

	thumb_func_start ov98_0221F090
ov98_0221F090: @ 0x0221F090
	push {r3, lr}
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0221F0DC @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _0221F0E0 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	ldr r2, _0221F0E4 @ =0x04000304
	ldr r0, _0221F0E8 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	bl ov98_0221F174
	pop {r3, pc}
	nop
_0221F0DC: .4byte 0xFFFFE0FF
_0221F0E0: .4byte 0x04001000
_0221F0E4: .4byte 0x04000304
_0221F0E8: .4byte 0xFFFF7FFF
	thumb_func_end ov98_0221F090

	thumb_func_start ov98_0221F0EC
ov98_0221F0EC: @ 0x0221F0EC
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
	ldr r0, _0221F118 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _0221F11C @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_0221F118: .4byte 0xFFFFE0FF
_0221F11C: .4byte 0x04001000
	thumb_func_end ov98_0221F0EC

	thumb_func_start ov98_0221F120
ov98_0221F120: @ 0x0221F120
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	beq _0221F12C
	cmp r4, #5
	blo _0221F130
_0221F12C:
	bl FUN_0202551C
_0221F130:
	ldr r1, _0221F14C @ =0x0221F1E4
	lsls r2, r4, #2
	ldr r1, [r1, r2]
	adds r0, r5, #0
	blx FUN_020F2BA4
	adds r0, r1, #0
	subs r1, r4, #1
	lsls r2, r1, #2
	ldr r1, _0221F14C @ =0x0221F1E4
	ldr r1, [r1, r2]
	blx FUN_020F2BA4
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221F14C: .4byte 0x0221F1E4
	thumb_func_end ov98_0221F120

	thumb_func_start ov98_0221F150
ov98_0221F150: @ 0x0221F150
	push {r3, r4, r5, lr}
	movs r5, #0
	cmp r0, #0
	bne _0221F15C
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221F15C:
	movs r4, #0xa
_0221F15E:
	cmp r0, #0
	beq _0221F170
	adds r1, r4, #0
	blx FUN_020F2998
	adds r1, r5, #1
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	b _0221F15E
_0221F170:
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov98_0221F150

	thumb_func_start ov98_0221F174
ov98_0221F174: @ 0x0221F174
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0221F190 @ =0x0221F248
	add r3, sp, #0
	movs r2, #5
_0221F17E:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0221F17E
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_0221F190: .4byte 0x0221F248
	thumb_func_end ov98_0221F174

	.rodata

_0221F194:
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0xA0, 0xC0, 0xC0, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0xE8, 0x03, 0x00, 0x00, 0x10, 0x27, 0x00, 0x00, 0xB8, 0x0B, 0x60, 0x09, 0x23, 0x00, 0x32, 0x00
	.byte 0x28, 0x00, 0x3C, 0x00, 0x50, 0x00, 0x82, 0x00, 0x28, 0x00, 0x46, 0x00, 0x5E, 0x01, 0xF4, 0x01
	.byte 0x00, 0x30, 0x00, 0x40, 0x46, 0x00, 0x64, 0x00, 0x1E, 0x00, 0x37, 0x00, 0x03, 0x00, 0x09, 0x00
	.byte 0xC8, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x4B, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x0221F270
