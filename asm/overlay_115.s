
	thumb_func_start ov115_0225F020
ov115_0225F020: @ 0x0225F020
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r6, #0
	strh r6, [r5]
	adds r4, r5, #0
	ldr r7, [sp, #0x28]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	strh r6, [r5, #2]
	adds r4, #0x14
_0225F038:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r3, r7, #0
	bl FUN_021F0718
	str r0, [r5, #4]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #4]
	movs r1, #1
	bl FUN_0202484C
	cmp r6, #3
	beq _0225F07E
	ldr r0, [r5, #4]
	movs r1, #2
	bl FUN_0202487C
	ldr r0, [r5, #4]
	movs r1, #1
	bl FUN_020248F0
	movs r1, #2
	lsls r1, r1, #0xc
	adds r0, r4, #0
	lsrs r2, r1, #1
	movs r3, #6
	bl FUN_021EFE70
	b _0225F08C
_0225F07E:
	movs r1, #1
	lsls r1, r1, #0xc
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #6
	bl FUN_021EFE70
_0225F08C:
	adds r6, r6, #1
	adds r5, r5, #4
	adds r4, #0x14
	cmp r6, #4
	blt _0225F038
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov115_0225F020

	thumb_func_start ov115_0225F09C
ov115_0225F09C: @ 0x0225F09C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0225F0A2:
	ldr r0, [r5, #4]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0225F0A2
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov115_0225F09C

	thumb_func_start ov115_0225F0B4
ov115_0225F0B4: @ 0x0225F0B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r1, [sp]
	movs r0, #2
	ldrsh r1, [r1, r0]
	cmp r1, #4
	bge _0225F0EE
	ldr r2, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldrsh r1, [r2, r1]
	subs r2, r1, #1
	ldr r1, [sp]
	strh r2, [r1]
	adds r2, r1, #0
	ldr r1, [sp, #4]
	ldrsh r1, [r2, r1]
	cmp r1, #0
	bgt _0225F0EE
	ldr r1, [sp]
	movs r2, #3
	strh r2, [r1]
	ldrsh r0, [r1, r0]
	adds r1, r0, #1
	ldr r0, [sp]
	strh r1, [r0, #2]
_0225F0EE:
	ldr r0, [sp]
	movs r1, #2
	ldrsh r0, [r0, r1]
	movs r4, #0
	cmp r0, #0
	ble _0225F150
	ldr r7, [sp]
	ldr r6, [sp]
	adds r7, #0x14
	adds r5, r6, #0
_0225F102:
	adds r0, r7, #0
	bl FUN_021EFE80
	ldr r1, [r6, #0x14]
	str r0, [sp, #8]
	add r0, sp, #0xc
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_021F074C
	ldr r0, [r5, #4]
	add r1, sp, #0xc
	bl FUN_020247F4
	ldr r0, [r5, #4]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0225F132
	movs r0, #0
	str r0, [sp, #4]
	b _0225F13E
_0225F132:
	cmp r4, #3
	beq _0225F13E
	ldr r0, [r5, #4]
	movs r1, #0
	bl FUN_02024830
_0225F13E:
	ldr r1, [sp]
	movs r0, #2
	ldrsh r0, [r1, r0]
	adds r4, r4, #1
	adds r7, #0x14
	adds r6, #0x14
	adds r5, r5, #4
	cmp r4, r0
	blt _0225F102
_0225F150:
	ldr r0, [sp, #4]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov115_0225F0B4

	thumb_func_start ov115_0225F158
ov115_0225F158: @ 0x0225F158
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xbd
	adds r3, r5, #0
	bl FUN_0200BAF8
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_0200BD08
	adds r4, r0, #0
	movs r0, #0x80
	adds r1, r5, #0
	bl FUN_02026354
	adds r7, r0, #0
	movs r0, #0x80
	adds r1, r5, #0
	bl FUN_02026354
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #0
	adds r2, r5, #0
	bl FUN_0200BB6C
	ldr r2, [sp]
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0200C37C
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_0200BB44
	adds r0, r4, #0
	bl FUN_0200BDA0
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov115_0225F158

	thumb_func_start ov115_0225F1BC
ov115_0225F1BC: @ 0x0225F1BC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xbd
	adds r3, r5, #0
	bl FUN_0200BAF8
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_0200BD08
	adds r4, r0, #0
	movs r0, #0x80
	adds r1, r5, #0
	bl FUN_02026354
	adds r7, r0, #0
	movs r0, #0x80
	adds r1, r5, #0
	bl FUN_02026354
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #0
	adds r2, r5, #0
	bl FUN_0200BB6C
	ldr r2, [sp]
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0200BE6C
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_0200BB44
	adds r0, r4, #0
	bl FUN_0200BDA0
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov115_0225F1BC

	thumb_func_start ov115_0225F220
ov115_0225F220: @ 0x0225F220
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, [r5]
	adds r6, r2, #0
	ldr r4, [r5, #0xc]
	cmp r1, #0xf
	bls _0225F234
	b _0225F6BC
_0225F234:
	adds r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0225F240: @ jump table
	.2byte _0225F260 - _0225F240 - 2 @ case 0
	.2byte _0225F3C0 - _0225F240 - 2 @ case 1
	.2byte _0225F3D6 - _0225F240 - 2 @ case 2
	.2byte _0225F3E2 - _0225F240 - 2 @ case 3
	.2byte _0225F450 - _0225F240 - 2 @ case 4
	.2byte _0225F470 - _0225F240 - 2 @ case 5
	.2byte _0225F49E - _0225F240 - 2 @ case 6
	.2byte _0225F4EA - _0225F240 - 2 @ case 7
	.2byte _0225F518 - _0225F240 - 2 @ case 8
	.2byte _0225F536 - _0225F240 - 2 @ case 9
	.2byte _0225F5A2 - _0225F240 - 2 @ case 10
	.2byte _0225F5B8 - _0225F240 - 2 @ case 11
	.2byte _0225F5DE - _0225F240 - 2 @ case 12
	.2byte _0225F5F6 - _0225F240 - 2 @ case 13
	.2byte _0225F616 - _0225F240 - 2 @ case 14
	.2byte _0225F626 - _0225F240 - 2 @ case 15
_0225F260:
	movs r1, #0xa6
	adds r0, r7, #0
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0xa6
	str r0, [r5, #0xc]
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	ldr r4, [r5, #0xc]
	movs r0, #0x20
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [r5, #0x20]
	movs r1, #0x10
	movs r2, #0
	movs r3, #0x40
	bl FUN_02007B8C
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r2, #2
	str r2, [sp, #8]
	movs r1, #0x9f
	lsls r1, r1, #2
	str r2, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	adds r1, r4, r1
	ldr r0, [r0, #8]
	movs r3, #0
	bl FUN_0201D40C
	movs r0, #0x9f
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	ldrh r0, [r6, #8]
	cmp r0, #0x17
	bne _0225F2D4
	ldr r0, [r5, #0x10]
	adds r1, r7, #0
	ldr r0, [r0, #0xc]
	bl ov115_0225F1BC
	str r0, [sp, #0x14]
	b _0225F2DE
_0225F2D4:
	ldr r0, [r6, #4]
	adds r1, r7, #0
	bl ov115_0225F158
	str r0, [sp, #0x14]
_0225F2DE:
	movs r1, #0
	str r1, [sp]
	ldr r0, _0225F62C @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r2, [sp, #0x14]
	adds r0, r4, r0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #8
	movs r2, #3
	bl FUN_021F05C4
	movs r0, #1
	str r0, [sp]
	ldrb r0, [r6, #0xd]
	movs r2, #6
	adds r1, r4, #0
	str r0, [sp, #4]
	ldrb r0, [r6, #0xe]
	lsls r2, r2, #6
	adds r1, #0x44
	str r0, [sp, #8]
	ldrb r0, [r6, #0xf]
	adds r2, r4, r2
	str r0, [sp, #0xc]
	ldr r0, _0225F630 @ =0x000927C0
	str r0, [sp, #0x10]
	ldrb r3, [r6, #0xc]
	ldr r0, [r5, #0x20]
	bl FUN_021F0614
	movs r0, #1
	str r0, [sp]
	movs r0, #0x3c
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0x3e
	str r0, [sp, #0xc]
	ldr r0, _0225F634 @ =0x000927C1
	movs r2, #0x6d
	str r0, [sp, #0x10]
	adds r1, r4, #0
	lsls r2, r2, #2
	ldr r0, [r5, #0x20]
	adds r1, #0x44
	adds r2, r4, r2
	movs r3, #0x3b
	bl FUN_021F0614
	movs r0, #0
	str r0, [sp]
	movs r1, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	lsls r1, r1, #6
	movs r2, #0x11
	movs r3, #0x42
	adds r0, #0x44
	adds r1, r4, r1
	lsls r2, r2, #0x10
	lsls r3, r3, #0xc
	bl FUN_021F0718
	movs r1, #0x7a
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x4a
	movs r2, #0x7b
	lsls r0, r0, #0xc
	str r0, [sp]
	lsls r2, r2, #2
	adds r0, r4, r2
	adds r1, r4, #0
	subs r2, #0x38
	movs r3, #0x12
	adds r1, #0x44
	adds r2, r4, r2
	lsls r3, r3, #0xe
	str r7, [sp, #4]
	bl ov115_0225F020
	movs r0, #0
	str r0, [sp]
	movs r0, #0x7a
	lsls r0, r0, #2
	ldrb r2, [r6, #0xc]
	ldr r0, [r4, r0]
	adds r1, r7, #0
	movs r3, #0xe
	bl ov115_02260254
	bl FUN_021F0B44
	str r0, [r4, #0x40]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F3C0:
	movs r0, #1
	movs r1, #0x10
	str r0, [sp]
	adds r2, r1, #0
	adds r3, r5, #4
	bl FUN_021EFCF8
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F3D6:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0225F458
	adds r0, r1, #1
	str r0, [r5]
	b _0225F6BC
_0225F3E2:
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #8]
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	ldrb r1, [r6, #0x12]
	ldrb r2, [r6, #0x11]
	ldrb r3, [r6, #0x10]
	ldr r0, [r5, #0x20]
	bl FUN_021F0454
	movs r0, #0xa3
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0x1f
	str r0, [sp, #4]
	movs r0, #0x17
	str r0, [sp, #8]
	ldr r1, [r4, #0x40]
	adds r0, r5, #0
	movs r2, #6
	movs r3, #8
	bl FUN_021F0B78
	movs r0, #2
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #3
	movs r1, #1
	bl FUN_0201BB68
	movs r0, #0
	movs r1, #2
	bl FUN_0201BB68
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F450:
	bl FUN_021EFE30
	cmp r0, #0
	bne _0225F45A
_0225F458:
	b _0225F6BC
_0225F45A:
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	ldr r0, [r4, #0x40]
	bl FUN_021F0B5C
	movs r0, #0xa5
	movs r1, #0xa
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0225F6BC
_0225F470:
	movs r0, #0xa5
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bge _0225F55E
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x7b
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov115_0225F0B4
	cmp r0, #1
	bne _0225F55E
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F49E:
	movs r0, #4
	str r0, [sp]
	movs r1, #0x11
	ldr r2, [r6]
	ldr r3, _0225F638 @ =0xFFFC0000
	adds r0, r4, #0
	lsls r1, r1, #0x10
	bl FUN_021EFEC8
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024A04
	movs r2, #0x42
	ldr r1, [r4]
	add r0, sp, #0x1c
	lsls r2, r2, #0xc
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x1c
	bl FUN_020247D4
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F4EA:
	adds r0, r4, #0
	bl FUN_021EFF28
	movs r2, #0x42
	adds r6, r0, #0
	ldr r1, [r4]
	add r0, sp, #0x1c
	lsls r2, r2, #0xc
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x1c
	bl FUN_020247D4
	cmp r6, #1
	bne _0225F55E
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F518:
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #0
	movs r2, #0x10
	movs r3, #3
	bl FUN_021EFE34
	movs r0, #0xa5
	movs r1, #0xa
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F536:
	movs r0, #0xa5
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bge _0225F55E
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_021EFE44
	str r0, [sp, #0x18]
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_021F0DC8
	ldr r0, [sp, #0x18]
	cmp r0, #1
	beq _0225F560
_0225F55E:
	b _0225F6BC
_0225F560:
	movs r3, #0
	str r3, [sp]
	movs r0, #0x7a
	lsls r0, r0, #2
	ldrb r2, [r6, #0xc]
	ldr r0, [r4, r0]
	adds r1, r7, #0
	bl ov115_02260254
	movs r0, #0xd
	mvns r0, r0
	movs r1, #0x21
	movs r2, #1
	bl FUN_0200B4F0
	ldr r3, [r4]
	ldr r0, [r5, #0x10]
	asrs r3, r3, #0xc
	subs r3, #0x5c
	ldr r0, [r0, #8]
	movs r1, #2
	movs r2, #0
	rsbs r3, r3, #0
	bl FUN_0201F238
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F5A2:
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #0x10
	movs r2, #0
	movs r3, #3
	bl FUN_021EFE34
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F5B8:
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_021EFE44
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_021F0DC8
	cmp r6, #1
	bne _0225F6BC
	ldr r0, [r5]
	movs r1, #0x1a
	adds r0, r0, #1
	str r0, [r5]
	movs r0, #0xa5
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0225F6BC
_0225F5DE:
	movs r0, #0xa5
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bge _0225F6BC
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F5F6:
	movs r0, #0xf
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	movs r1, #0
	str r0, [sp, #8]
	ldr r3, _0225F63C @ =0x00007FFF
	movs r0, #3
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F616:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225F6BC
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F626:
	ldr r1, _0225F63C @ =0x00007FFF
	b _0225F640
	nop
_0225F62C: .4byte 0x00010200
_0225F630: .4byte 0x000927C0
_0225F634: .4byte 0x000927C1
_0225F638: .4byte 0xFFFC0000
_0225F63C: .4byte 0x00007FFF
_0225F640:
	movs r0, #1
	bl FUN_0200FBF4
	ldr r1, [r5, #0x14]
	cmp r1, #0
	beq _0225F650
	movs r0, #1
	str r0, [r1]
_0225F650:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024758
	movs r0, #0x7b
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov115_0225F09C
	movs r1, #6
	adds r0, r4, #0
	lsls r1, r1, #6
	adds r0, #0x44
	adds r1, r4, r1
	bl FUN_021F06EC
	movs r1, #0x6d
	adds r0, r4, #0
	lsls r1, r1, #2
	adds r0, #0x44
	adds r1, r4, r1
	bl FUN_021F06EC
	adds r0, r4, #0
	adds r0, #0x44
	bl FUN_021F05F4
	movs r0, #0x9f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0225F700 @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	movs r2, #1
	bl FUN_0200B4F0
	ldr r0, [r5, #0x10]
	movs r2, #0
	ldr r0, [r0, #8]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201BC8C
	add sp, #0x28
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225F6BC:
	movs r3, #0xa3
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	cmp r0, #1
	bne _0225F6EC
	ldr r0, [r5, #0x10]
	adds r3, r3, #4
	ldr r0, [r0, #8]
	ldr r3, [r4, r3]
	movs r1, #3
	movs r2, #0
	bl FUN_0201F238
	movs r3, #0x29
	lsls r3, r3, #4
	ldr r0, [r4, r3]
	adds r0, #0x1e
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x17
	subs r1, r1, r2
	movs r0, #0x17
	rors r1, r0
	adds r0, r2, r1
	str r0, [r4, r3]
_0225F6EC:
	ldr r0, [r5]
	cmp r0, #0xf
	beq _0225F6F8
	ldr r0, [r4, #0x44]
	bl FUN_0202457C
_0225F6F8:
	movs r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225F700: .4byte 0xFFFF1FFF
	thumb_func_end ov115_0225F220

	thumb_func_start ov115_0225F704
ov115_0225F704: @ 0x0225F704
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F724 @ =0x022603B0
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F720
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F720:
	pop {r3, r4, r5, pc}
	nop
_0225F724: .4byte 0x022603B0
	thumb_func_end ov115_0225F704

	thumb_func_start ov115_0225F728
ov115_0225F728: @ 0x0225F728
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F748 @ =0x022603C4
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F744
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F744:
	pop {r3, r4, r5, pc}
	nop
_0225F748: .4byte 0x022603C4
	thumb_func_end ov115_0225F728

	thumb_func_start ov115_0225F74C
ov115_0225F74C: @ 0x0225F74C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F76C @ =0x022603D8
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F768
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F768:
	pop {r3, r4, r5, pc}
	nop
_0225F76C: .4byte 0x022603D8
	thumb_func_end ov115_0225F74C

	thumb_func_start ov115_0225F770
ov115_0225F770: @ 0x0225F770
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F790 @ =0x022603EC
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F78C
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F78C:
	pop {r3, r4, r5, pc}
	nop
_0225F790: .4byte 0x022603EC
	thumb_func_end ov115_0225F770

	thumb_func_start ov115_0225F794
ov115_0225F794: @ 0x0225F794
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F7B4 @ =0x02260400
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F7B0
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F7B0:
	pop {r3, r4, r5, pc}
	nop
_0225F7B4: .4byte 0x02260400
	thumb_func_end ov115_0225F794

	thumb_func_start ov115_0225F7B8
ov115_0225F7B8: @ 0x0225F7B8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F7D8 @ =0x02260414
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F7D4
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F7D4:
	pop {r3, r4, r5, pc}
	nop
_0225F7D8: .4byte 0x02260414
	thumb_func_end ov115_0225F7B8

	thumb_func_start ov115_0225F7DC
ov115_0225F7DC: @ 0x0225F7DC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F7FC @ =0x02260428
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F7F8
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F7F8:
	pop {r3, r4, r5, pc}
	nop
_0225F7FC: .4byte 0x02260428
	thumb_func_end ov115_0225F7DC

	thumb_func_start ov115_0225F800
ov115_0225F800: @ 0x0225F800
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F820 @ =0x0226043C
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F81C
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F81C:
	pop {r3, r4, r5, pc}
	nop
_0225F820: .4byte 0x0226043C
	thumb_func_end ov115_0225F800

	thumb_func_start ov115_0225F824
ov115_0225F824: @ 0x0225F824
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F844 @ =0x02260450
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F840
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F840:
	pop {r3, r4, r5, pc}
	nop
_0225F844: .4byte 0x02260450
	thumb_func_end ov115_0225F824

	thumb_func_start ov115_0225F848
ov115_0225F848: @ 0x0225F848
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F868 @ =0x02260464
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F864
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F864:
	pop {r3, r4, r5, pc}
	nop
_0225F868: .4byte 0x02260464
	thumb_func_end ov115_0225F848

	thumb_func_start ov115_0225F86C
ov115_0225F86C: @ 0x0225F86C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F88C @ =0x02260478
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F888
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F888:
	pop {r3, r4, r5, pc}
	nop
_0225F88C: .4byte 0x02260478
	thumb_func_end ov115_0225F86C

	thumb_func_start ov115_0225F890
ov115_0225F890: @ 0x0225F890
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F8B0 @ =0x0226048C
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F8AC
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F8AC:
	pop {r3, r4, r5, pc}
	nop
_0225F8B0: .4byte 0x0226048C
	thumb_func_end ov115_0225F890

	thumb_func_start ov115_0225F8B4
ov115_0225F8B4: @ 0x0225F8B4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F8D4 @ =0x022604A0
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F8D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F8D0:
	pop {r3, r4, r5, pc}
	nop
_0225F8D4: .4byte 0x022604A0
	thumb_func_end ov115_0225F8B4

	thumb_func_start ov115_0225F8D8
ov115_0225F8D8: @ 0x0225F8D8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F8F8 @ =0x022604B4
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F8F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F8F4:
	pop {r3, r4, r5, pc}
	nop
_0225F8F8: .4byte 0x022604B4
	thumb_func_end ov115_0225F8D8

	thumb_func_start ov115_0225F8FC
ov115_0225F8FC: @ 0x0225F8FC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F91C @ =0x022604C8
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F918
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F918:
	pop {r3, r4, r5, pc}
	nop
_0225F91C: .4byte 0x022604C8
	thumb_func_end ov115_0225F8FC

	thumb_func_start ov115_0225F920
ov115_0225F920: @ 0x0225F920
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F940 @ =0x022604DC
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F93C
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F93C:
	pop {r3, r4, r5, pc}
	nop
_0225F940: .4byte 0x022604DC
	thumb_func_end ov115_0225F920

	thumb_func_start ov115_0225F944
ov115_0225F944: @ 0x0225F944
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225F964 @ =_02260374
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F960
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0225F960:
	pop {r3, r4, r5, pc}
	nop
_0225F964: .4byte _02260374
	thumb_func_end ov115_0225F944

	thumb_func_start ov115_0225F968
ov115_0225F968: @ 0x0225F968
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl FUN_02028E9C
	bl FUN_02028F94
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov115_0225F968

	thumb_func_start ov115_0225F978
ov115_0225F978: @ 0x0225F978
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r6, r0, #0
	ldr r0, [r6]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r4, [r6, #0xc]
	cmp r0, #0xe
	bls _0225F98E
	bl _0226021C
_0225F98E:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225F99A: @ jump table
	.2byte _0225F9B8 - _0225F99A - 2 @ case 0
	.2byte _0225FAC6 - _0225F99A - 2 @ case 1
	.2byte _0225FBAE - _0225F99A - 2 @ case 2
	.2byte _0225FBC8 - _0225F99A - 2 @ case 3
	.2byte _0225FBE4 - _0225F99A - 2 @ case 4
	.2byte _0225FC0E - _0225F99A - 2 @ case 5
	.2byte _0225FD78 - _0225F99A - 2 @ case 6
	.2byte _0225FE4E - _0225F99A - 2 @ case 7
	.2byte _0225FE80 - _0225F99A - 2 @ case 8
	.2byte _0225FF02 - _0225F99A - 2 @ case 9
	.2byte _0225FF26 - _0225F99A - 2 @ case 10
	.2byte _0225FF4A - _0225F99A - 2 @ case 11
	.2byte _0225FF88 - _0225F99A - 2 @ case 12
	.2byte _02260102 - _0225F99A - 2 @ case 13
	.2byte _022601A8 - _0225F99A - 2 @ case 14
_0225F9B8:
	adds r0, r1, #0
	movs r1, #0xc5
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0xc5
	str r0, [r6, #0xc]
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	ldr r4, [r6, #0xc]
	movs r1, #0xa
	adds r0, r4, #0
	adds r0, #0x5c
	movs r2, #4
	bl FUN_021F05C4
	ldr r0, [r6, #0x10]
	bl ov115_0225F968
	cmp r0, #0
	bne _0225FA16
	movs r0, #1
	str r0, [sp]
	movs r0, #0xd0
	str r0, [sp, #4]
	movs r0, #0xd1
	str r0, [sp, #8]
	movs r2, #0xd2
	str r2, [sp, #0xc]
	ldr r0, _0225FD58 @ =0x000927C0
	adds r1, r4, #0
	str r0, [sp, #0x10]
	adds r2, #0xc6
	ldr r0, [r6, #0x20]
	adds r1, #0x5c
	adds r2, r4, r2
	movs r3, #0xcf
	bl FUN_021F0614
	movs r0, #0xc1
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r1, #0xcf
	b _0225FA44
_0225FA16:
	movs r0, #1
	str r0, [sp]
	movs r0, #0xd4
	str r0, [sp, #4]
	movs r0, #0xd5
	str r0, [sp, #8]
	movs r2, #0xd6
	str r2, [sp, #0xc]
	ldr r0, _0225FD58 @ =0x000927C0
	adds r1, r4, #0
	str r0, [sp, #0x10]
	adds r2, #0xc2
	ldr r0, [r6, #0x20]
	adds r1, #0x5c
	adds r2, r4, r2
	movs r3, #0xd3
	bl FUN_021F0614
	movs r0, #0xc1
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r1, #0xd3
_0225FA44:
	adds r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [sp, #0x18]
	movs r2, #0x73
	ldrh r3, [r0]
	movs r0, #1
	adds r1, r4, #0
	str r0, [sp]
	adds r0, r3, #1
	str r0, [sp, #4]
	adds r0, r3, #2
	str r0, [sp, #8]
	adds r0, r3, #3
	str r0, [sp, #0xc]
	ldr r0, _0225FD5C @ =0x000927C1
	lsls r2, r2, #2
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x20]
	adds r1, #0x5c
	adds r2, r4, r2
	bl FUN_021F0614
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	movs r0, #0x31
	str r0, [sp, #8]
	movs r0, #0x32
	str r0, [sp, #0xc]
	ldr r0, _0225FD60 @ =0x000927C2
	movs r2, #2
	str r0, [sp, #0x10]
	ldr r3, [sp, #0x18]
	adds r1, r4, #0
	lsls r2, r2, #8
	ldrb r3, [r3, #2]
	ldr r0, [r6, #0x20]
	adds r1, #0x5c
	adds r2, r4, r2
	bl FUN_021F0614
	movs r0, #1
	str r0, [sp]
	movs r0, #0x3c
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0x3e
	str r0, [sp, #0xc]
	ldr r0, _0225FD64 @ =0x000927C3
	movs r2, #0x8d
	str r0, [sp, #0x10]
	adds r1, r4, #0
	lsls r2, r2, #2
	ldr r0, [r6, #0x20]
	adds r1, #0x5c
	adds r2, r4, r2
	movs r3, #0x3b
	bl FUN_021F0614
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FAC6:
	movs r1, #2
	lsls r1, r1, #0xc
	add r0, sp, #0x2c
	adds r2, r1, #0
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x66
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x24]
	adds r0, r4, #0
	str r0, [sp, #0x28]
	adds r0, #0x5c
	movs r7, #0
	adds r5, r4, #0
	str r0, [sp, #0x28]
_0225FAEA:
	cmp r7, #3
	bge _0225FAF6
	movs r0, #0
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0x20]
	b _0225FB06
_0225FAF6:
	subs r1, r7, #1
	movs r0, #0x34
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x24]
	adds r1, r0, r2
	movs r0, #1
	str r0, [sp, #0x20]
_0225FB06:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r2, #0
	ldr r0, [sp, #0x28]
	adds r3, r2, #0
	bl FUN_021F0718
	movs r1, #0x9a
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x20]
	bl FUN_020248F0
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024A04
	ldr r0, [sp, #0x1c]
	adds r7, r7, #1
	adds r0, #0x34
	adds r5, r5, #4
	str r0, [sp, #0x1c]
	cmp r7, #4
	blt _0225FAEA
	movs r2, #0x9a
	movs r0, #0
	lsls r2, r2, #2
	str r0, [sp]
	ldr r0, [r4, r2]
	adds r2, #0xa0
	ldr r1, [sp, #0x14]
	ldr r2, [r4, r2]
	movs r3, #0xe
	bl ov115_02260254
	movs r0, #0
	str r0, [sp]
	ldr r2, [sp, #0x18]
	movs r0, #0x9b
	lsls r0, r0, #2
	ldrh r2, [r2]
	ldr r0, [r4, r0]
	ldr r1, [sp, #0x14]
	movs r3, #0xe
	bl ov115_02260254
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #6
	lsls r0, r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x14]
	movs r2, #0x29
	adds r1, r4, #0
	movs r3, #2
	lsls r2, r2, #4
	str r0, [sp, #4]
	adds r0, r4, r2
	subs r2, #0x5c
	adds r1, #0x5c
	adds r2, r4, r2
	lsls r3, r3, #0x12
	bl ov115_0225F020
	ldr r0, [r6, #0x10]
	bl FUN_021F0DDC
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FBAE:
	movs r1, #0x10
	movs r0, #1
	adds r2, r1, #0
	adds r3, r6, #4
	str r0, [sp]
	bl FUN_021EFCF8
	movs r0, #0
	str r0, [r6, #8]
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FBC8:
	ldr r0, [r6, #8]
	adds r0, r0, #1
	str r0, [r6, #8]
	cmp r0, #8
	bne _0225FBD6
	bl FUN_021F0E74
_0225FBD6:
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _0225FBEC
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FBE4:
	bl FUN_021F0E90
	cmp r0, #1
	beq _0225FBEE
_0225FBEC:
	b _0226021C
_0225FBEE:
	ldr r0, [r6, #0x20]
	movs r1, #0x97
	bl FUN_021F0F08
	movs r0, #8
	str r0, [sp]
	ldr r0, _0225FD68 @ =0x04000050
	movs r1, #1
	movs r2, #0x1e
	movs r3, #0
	blx FUN_020CF15C
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FC0E:
	movs r0, #6
	movs r2, #0xe
	movs r3, #5
	str r0, [sp]
	ldr r1, _0225FD6C @ =0xFFF80000
	adds r0, r4, #0
	lsls r2, r2, #0xe
	lsls r3, r3, #0x10
	bl FUN_021EFEC8
	movs r2, #0x17
	ldr r1, [r4]
	add r0, sp, #0x38
	lsls r2, r2, #0xe
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #1
	ldr r1, [sp, #0x3c]
	lsls r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsls r0, r0, #2
	adds r0, r1, r0
	str r0, [sp, #0x38]
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r1, #6
	adds r0, r4, #0
	movs r2, #0x32
	str r1, [sp]
	ldr r3, _0225FD70 @ =0xFFFB0000
	adds r0, #0x30
	lsls r1, r1, #0x12
	lsls r2, r2, #0xe
	bl FUN_021EFEC8
	movs r2, #0x17
	ldr r1, [r4, #0x30]
	add r0, sp, #0x38
	lsls r2, r2, #0xe
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x9b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #1
	ldr r1, [sp, #0x3c]
	lsls r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsls r0, r0, #2
	subs r0, r1, r0
	str r0, [sp, #0x38]
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #0x9b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x14]
	movs r1, #0x10
	str r0, [sp, #4]
	ldr r0, [r6, #0x20]
	movs r2, #0
	movs r3, #0x40
	bl FUN_02007B8C
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0xd
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r2, #2
	str r2, [sp, #8]
	movs r1, #0xbd
	lsls r1, r1, #2
	str r2, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x10]
	adds r1, r4, r1
	ldr r0, [r0, #8]
	movs r3, #0x15
	bl FUN_0201D40C
	movs r0, #0xbd
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	ldrh r0, [r0, #6]
	bl ov115_0225F158
	movs r1, #0
	adds r5, r0, #0
	str r1, [sp]
	ldr r0, _0225FD74 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0xbd
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r2, r5, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_02026380
	movs r0, #3
	str r0, [r6, #4]
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0226021C
	.align 2, 0
_0225FD58: .4byte 0x000927C0
_0225FD5C: .4byte 0x000927C1
_0225FD60: .4byte 0x000927C2
_0225FD64: .4byte 0x000927C3
_0225FD68: .4byte 0x04000050
_0225FD6C: .4byte 0xFFF80000
_0225FD70: .4byte 0xFFFB0000
_0225FD74: .4byte 0x00010200
_0225FD78:
	ldr r0, [r6, #4]
	cmp r0, #0
	ble _0225FD9C
	subs r0, r0, #1
	str r0, [r6, #4]
	bne _0225FDA6
	movs r0, #3
	bl FUN_021F0FB8
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	b _0225FDA6
_0225FD9C:
	movs r0, #0x29
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov115_0225F0B4
_0225FDA6:
	adds r0, r4, #0
	bl FUN_021EFF28
	movs r2, #0x17
	ldr r1, [r4]
	add r0, sp, #0x38
	lsls r2, r2, #0xe
	movs r3, #0
	bl FUN_021F074C
	add r5, sp, #0x38
	movs r2, #0x9e
	lsls r2, r2, #2
	adds r3, r4, r2
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	subs r2, #0x10
	str r0, [r3]
	ldr r0, [r4, r2]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #1
	ldr r1, [sp, #0x3c]
	lsls r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsls r0, r0, #2
	adds r0, r1, r0
	str r0, [sp, #0x38]
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	adds r0, r4, #0
	adds r0, #0x30
	bl FUN_021EFF28
	movs r2, #0x17
	adds r7, r0, #0
	ldr r1, [r4, #0x30]
	add r0, sp, #0x38
	lsls r2, r2, #0xe
	movs r3, #0
	bl FUN_021F074C
	add r5, sp, #0x38
	movs r2, #0xa1
	lsls r2, r2, #2
	adds r3, r4, r2
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	subs r2, #0x18
	str r0, [r3]
	ldr r0, [r4, r2]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #1
	ldr r1, [sp, #0x3c]
	lsls r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsls r0, r0, #2
	subs r0, r1, r0
	str r0, [sp, #0x38]
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	cmp r7, #1
	bne _0225FF3C
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FE4E:
	movs r0, #0x29
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov115_0225F0B4
	adds r5, r0, #0
	bl FUN_021F1044
	cmp r5, #0
	beq _0225FF3C
	cmp r0, #0
	beq _0225FF3C
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	movs r2, #0x10
	movs r3, #3
	bl FUN_021EFE34
	bl FUN_021F1060
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FE80:
	adds r0, r4, #0
	adds r0, #0x48
	bl FUN_021EFE44
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x48
	bl FUN_021F0DC8
	cmp r5, #1
	bne _0225FF3C
	movs r3, #0
	movs r2, #0x9a
	str r3, [sp]
	lsls r2, r2, #2
	ldr r0, [r4, r2]
	adds r2, #0xa0
	ldr r1, [sp, #0x14]
	ldr r2, [r4, r2]
	bl ov115_02260254
	movs r3, #0
	movs r0, #0x9b
	ldr r2, [sp, #0x18]
	str r3, [sp]
	lsls r0, r0, #2
	ldrh r2, [r2]
	ldr r0, [r4, r0]
	ldr r1, [sp, #0x14]
	bl ov115_02260254
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x27
	lsls r0, r0, #4
	movs r1, #2
	ldr r0, [r4, r0]
	lsls r1, r1, #0xc
	bl FUN_02024868
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x9d
	lsls r0, r0, #2
	movs r1, #2
	ldr r0, [r4, r0]
	lsls r1, r1, #0xc
	bl FUN_02024868
	ldr r0, [r6, #0x20]
	movs r1, #0x98
	bl FUN_021F0F08
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FF02:
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0x10
	movs r2, #0
	movs r3, #6
	bl FUN_021EFE34
	movs r0, #4
	bl FUN_021F0FB8
	movs r0, #0
	movs r1, #1
	bl FUN_0201BB68
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FF26:
	adds r0, r4, #0
	adds r0, #0x48
	bl FUN_021EFE44
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x48
	bl FUN_021F0DC8
	cmp r5, #1
	beq _0225FF3E
_0225FF3C:
	b _0226021C
_0225FF3E:
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	movs r0, #8
	str r0, [r6, #4]
	b _0226021C
_0225FF4A:
	ldr r0, [r6, #4]
	cmp r0, #0
	ble _0225FF56
	subs r0, r0, #1
	str r0, [r6, #4]
	b _0226021C
_0225FF56:
	adds r0, r2, #0
	ldrb r0, [r0, #3]
	movs r1, #0
	ldr r2, _02260248 @ =0xFFFFE000
	str r0, [sp]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_021EFEC8
	ldr r0, [sp, #0x18]
	movs r1, #0
	ldrb r0, [r0, #3]
	ldr r2, _02260248 @ =0xFFFFE000
	adds r3, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_021EFEC8
	movs r0, #0
	str r0, [r6, #4]
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FF88:
	ldr r0, [r6, #4]
	adds r0, r0, #1
	str r0, [r6, #4]
	adds r0, r4, #0
	bl FUN_021EFF28
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_021EFF28
	ldr r1, [r6, #4]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	add r0, sp, #0x38
	bne _0225FFD0
	movs r2, #0x9e
	lsls r2, r2, #2
	ldr r3, [r4, r2]
	ldr r1, [r4]
	adds r2, r2, #4
	adds r1, r3, r1
	ldr r3, [r4, r2]
	ldr r2, [r4, #0x18]
	adds r2, r3, r2
	movs r3, #0
	bl FUN_021F074C
	b _0225FFE8
_0225FFD0:
	movs r2, #0x9e
	lsls r2, r2, #2
	ldr r3, [r4, r2]
	ldr r1, [r4]
	adds r2, r2, #4
	subs r1, r3, r1
	ldr r3, [r4, r2]
	ldr r2, [r4, #0x18]
	subs r2, r3, r2
	movs r3, #0
	bl FUN_021F074C
_0225FFE8:
	cmp r5, #0
	beq _0225FFFC
	movs r0, #0x9e
	lsls r0, r0, #2
	add r3, sp, #0x38
	adds r2, r4, r0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
_0225FFFC:
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #1
	ldr r1, [sp, #0x3c]
	lsls r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsls r0, r0, #2
	adds r0, r1, r0
	str r0, [sp, #0x38]
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	ldr r1, [r6, #4]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	add r0, sp, #0x38
	bne _02260058
	movs r2, #0xa1
	lsls r2, r2, #2
	ldr r3, [r4, r2]
	ldr r1, [r4]
	adds r2, r2, #4
	subs r1, r3, r1
	ldr r3, [r4, r2]
	ldr r2, [r4, #0x18]
	subs r2, r3, r2
	movs r3, #0
	bl FUN_021F074C
	b _02260070
_02260058:
	movs r2, #0xa1
	lsls r2, r2, #2
	ldr r3, [r4, r2]
	ldr r1, [r4]
	adds r2, r2, #4
	adds r1, r3, r1
	ldr r3, [r4, r2]
	ldr r2, [r4, #0x18]
	adds r2, r3, r2
	movs r3, #0
	bl FUN_021F074C
_02260070:
	cmp r5, #0
	beq _02260084
	movs r0, #0xa1
	lsls r0, r0, #2
	add r3, sp, #0x38
	adds r2, r4, r0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
_02260084:
	movs r0, #0x9b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #1
	ldr r1, [sp, #0x3c]
	lsls r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsls r0, r0, #2
	subs r0, r1, r0
	str r0, [sp, #0x38]
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	cmp r5, #0
	bne _022600B4
	b _0226021C
_022600B4:
	ldr r0, [r6]
	movs r1, #0
	adds r0, r0, #1
	str r0, [r6]
	movs r0, #4
	bl FUN_02022C60
	movs r2, #3
	movs r0, #0x10
	lsls r2, r2, #0x12
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0
	lsrs r3, r2, #3
	bl FUN_021EFEC8
	movs r0, #0x10
	movs r2, #3
	str r0, [sp]
	adds r0, r4, #0
	lsls r2, r2, #0x12
	adds r0, #0x18
	movs r1, #0
	lsrs r3, r2, #3
	bl FUN_021EFEC8
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	movs r1, #0
	str r0, [sp, #8]
	ldr r3, _0226024C @ =0x00007FFF
	movs r0, #3
	adds r2, r1, #0
	bl FUN_0200FA24
	b _0226021C
_02260102:
	adds r0, r4, #0
	bl FUN_021EFF28
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_021EFF28
	movs r2, #0x9e
	lsls r2, r2, #2
	ldr r3, [r4, r2]
	ldr r1, [r4]
	adds r2, r2, #4
	subs r1, r3, r1
	ldr r3, [r4, r2]
	ldr r2, [r4, #0x18]
	add r0, sp, #0x38
	subs r2, r3, r2
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #1
	ldr r1, [sp, #0x3c]
	lsls r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsls r0, r0, #2
	adds r0, r1, r0
	str r0, [sp, #0x38]
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r2, #0xa1
	lsls r2, r2, #2
	ldr r3, [r4, r2]
	ldr r1, [r4]
	adds r2, r2, #4
	adds r1, r3, r1
	ldr r3, [r4, r2]
	ldr r2, [r4, #0x18]
	add r0, sp, #0x38
	adds r2, r3, r2
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x9b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #1
	ldr r1, [sp, #0x3c]
	lsls r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsls r0, r0, #2
	subs r0, r1, r0
	str r0, [sp, #0x38]
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0226021C
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0226021C
_022601A8:
	ldr r1, _0226024C @ =0x00007FFF
	movs r0, #1
	bl FUN_0200FBF4
	ldr r1, [r6, #0x14]
	cmp r1, #0
	beq _022601BA
	movs r0, #1
	str r0, [r1]
_022601BA:
	movs r0, #0x29
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov115_0225F09C
	movs r0, #0xbd
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r7, #0x9a
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #2
_022601D6:
	ldr r0, [r5, r7]
	bl FUN_02024758
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #4
	blt _022601D6
	movs r0, #0x66
	lsls r0, r0, #2
	adds r7, r4, #0
	movs r6, #0
	adds r5, r4, r0
	adds r7, #0x5c
_022601F0:
	adds r0, r7, #0
	adds r1, r5, #0
	bl FUN_021F06EC
	adds r6, r6, #1
	adds r5, #0x34
	cmp r6, #4
	blt _022601F0
	adds r4, #0x5c
	adds r0, r4, #0
	bl FUN_021F05F4
	bl FUN_021F1060
	bl FUN_021F0EC0
	ldr r0, _02260250 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	add sp, #0x44
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0226021C:
	ldr r0, [r6]
	cmp r0, #0xe
	beq _02260242
	ldr r0, [r4, #0x5c]
	bl FUN_0202457C
	ldr r0, [r6]
	cmp r0, #4
	ble _02260242
	bl FUN_02026E48
	bl FUN_021F1008
	bl FUN_021F0EAC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
_02260242:
	movs r0, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02260248: .4byte 0xFFFFE000
_0226024C: .4byte 0x00007FFF
_02260250: .4byte 0x04000050
	thumb_func_end ov115_0225F978

	thumb_func_start ov115_02260254
ov115_02260254: @ 0x02260254
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r7, r0, #0
	adds r6, r2, #0
	adds r0, r5, #0
	movs r1, #0x20
	str r3, [sp, #4]
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r0, #0x6d
	adds r1, r6, #0
	add r2, sp, #8
	adds r3, r5, #0
	bl FUN_020079F4
	adds r5, r0, #0
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	adds r1, r4, #0
	movs r2, #0x10
	str r0, [sp]
	ldr r0, [sp, #8]
	ldr r3, [sp, #4]
	ldr r0, [r0, #0xc]
	bl FUN_02003DE8
	adds r0, r7, #0
	bl FUN_02024B34
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	blx DC_FlushRange
	adds r0, r6, #0
	movs r1, #1
	blx FUN_020B8078
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x20
	blx FUN_020CFD18
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov115_02260254

	thumb_func_start ov115_022602C0
ov115_022602C0: @ 0x022602C0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _022602E0 @ =0x02260388
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F978
	cmp r0, #1
	bne _022602DC
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_022602DC:
	pop {r3, r4, r5, pc}
	nop
_022602E0: .4byte 0x02260388
	thumb_func_end ov115_022602C0

	thumb_func_start ov115_022602E4
ov115_022602E4: @ 0x022602E4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _02260304 @ =0x02260390
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F978
	cmp r0, #1
	bne _02260300
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_02260300:
	pop {r3, r4, r5, pc}
	nop
_02260304: .4byte 0x02260390
	thumb_func_end ov115_022602E4

	thumb_func_start ov115_02260308
ov115_02260308: @ 0x02260308
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _02260328 @ =0x02260398
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F978
	cmp r0, #1
	bne _02260324
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_02260324:
	pop {r3, r4, r5, pc}
	nop
_02260328: .4byte 0x02260398
	thumb_func_end ov115_02260308

	thumb_func_start ov115_0226032C
ov115_0226032C: @ 0x0226032C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0226034C @ =0x022603A0
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F978
	cmp r0, #1
	bne _02260348
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_02260348:
	pop {r3, r4, r5, pc}
	nop
_0226034C: .4byte 0x022603A0
	thumb_func_end ov115_0226032C

	thumb_func_start ov115_02260350
ov115_02260350: @ 0x02260350
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _02260370 @ =0x022603A8
	adds r0, r4, #0
	movs r1, #4
	bl ov115_0225F978
	cmp r0, #1
	bne _0226036C
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_021EFCDC
_0226036C:
	pop {r3, r4, r5, pc}
	nop
_02260370: .4byte 0x022603A8
	thumb_func_end ov115_02260350

	.rodata

_02260374:
	.byte 0x00, 0x60, 0x0D, 0x00, 0x09, 0x01, 0x00, 0x00, 0x17, 0x00, 0x01, 0x00
	.byte 0x7F, 0x80, 0x81, 0x82, 0x2D, 0x2C, 0x2E, 0x00, 0x83, 0x00, 0x2F, 0x20, 0x57, 0x00, 0xF5, 0x00
	.byte 0x87, 0x00, 0x33, 0x20, 0x59, 0x00, 0xF7, 0x00, 0x8B, 0x00, 0x34, 0x20, 0x70, 0x00, 0xA2, 0x01
	.byte 0x8F, 0x00, 0x35, 0x20, 0x58, 0x00, 0xF6, 0x00, 0x93, 0x00, 0x36, 0x09, 0x56, 0x00, 0xF4, 0x00
	.byte 0x00, 0x60, 0x0D, 0x00, 0x14, 0x00, 0x00, 0x00, 0x42, 0x00, 0x01, 0x00, 0x3F, 0x40, 0x41, 0x42
	.byte 0x15, 0x14, 0x16, 0x00, 0x00, 0x60, 0x0D, 0x00, 0x15, 0x00, 0x00, 0x00, 0x43, 0x00, 0x01, 0x00
	.byte 0x43, 0x44, 0x45, 0x46, 0x18, 0x17, 0x19, 0x00, 0x00, 0x60, 0x0D, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x47, 0x48, 0x49, 0x4A, 0x1B, 0x1A, 0x1C, 0x00, 0x00, 0x60, 0x0D, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x48, 0x00, 0x01, 0x00, 0x4B, 0x4C, 0x4D, 0x4E, 0x1E, 0x1D, 0x1F, 0x00
	.byte 0x00, 0x60, 0x0D, 0x00, 0x21, 0x00, 0x00, 0x00, 0x4A, 0x00, 0x01, 0x00, 0x4F, 0x50, 0x51, 0x52
	.byte 0x21, 0x20, 0x22, 0x00, 0x00, 0x60, 0x0D, 0x00, 0x22, 0x00, 0x00, 0x00, 0x4B, 0x00, 0x01, 0x00
	.byte 0x53, 0x54, 0x55, 0x56, 0x24, 0x23, 0x25, 0x00, 0x00, 0x60, 0x0D, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x49, 0x00, 0x01, 0x00, 0x57, 0x58, 0x59, 0x5A, 0x27, 0x26, 0x28, 0x00, 0x00, 0x60, 0x0D, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x4C, 0x00, 0x01, 0x00, 0x5B, 0x5C, 0x5D, 0x5E, 0x2A, 0x29, 0x2B, 0x00
	.byte 0x00, 0x60, 0x0D, 0x00, 0xFD, 0x00, 0x00, 0x00, 0x62, 0x00, 0x01, 0x00, 0x5F, 0x60, 0x61, 0x62
	.byte 0x15, 0x14, 0x16, 0x00, 0x00, 0x60, 0x0D, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x67, 0x00, 0x01, 0x00
	.byte 0x63, 0x64, 0x65, 0x66, 0x18, 0x17, 0x19, 0x00, 0x00, 0x60, 0x0D, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x68, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x6A, 0x1B, 0x1A, 0x1C, 0x00, 0x00, 0x60, 0x0D, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x69, 0x00, 0x01, 0x00, 0x6B, 0x6C, 0x6D, 0x6E, 0x1E, 0x1D, 0x1F, 0x00
	.byte 0x00, 0x60, 0x0D, 0x00, 0x01, 0x01, 0x00, 0x00, 0x6A, 0x00, 0x01, 0x00, 0x6F, 0x70, 0x71, 0x72
	.byte 0x21, 0x20, 0x22, 0x00, 0x00, 0x60, 0x0D, 0x00, 0x02, 0x01, 0x00, 0x00, 0x6B, 0x00, 0x01, 0x00
	.byte 0x73, 0x74, 0x75, 0x76, 0x24, 0x23, 0x25, 0x00, 0x00, 0x60, 0x0D, 0x00, 0x03, 0x01, 0x00, 0x00
	.byte 0x6C, 0x00, 0x01, 0x00, 0x77, 0x78, 0x79, 0x7A, 0x27, 0x26, 0x28, 0x00, 0x00, 0x60, 0x0D, 0x00
	.byte 0x05, 0x01, 0x00, 0x00, 0x6E, 0x00, 0x01, 0x00, 0x7B, 0x7C, 0x7D, 0x7E, 0x2A, 0x29, 0x2B, 0x00
	@ 0x022604F0
