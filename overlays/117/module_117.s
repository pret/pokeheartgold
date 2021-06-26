
	thumb_func_start ov117_0225F020
ov117_0225F020: @ 0x0225F020
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	str r0, [sp, #0x14]
	adds r0, r1, #0
	ldr r0, [r0]
	str r1, [sp, #0x18]
	ldr r4, [r1, #0xc]
	cmp r0, #7
	bls _0225F034
	b _0225F330
_0225F034:
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225F040: @ jump table
	.2byte _0225F050 - _0225F040 - 2 @ case 0
	.2byte _0225F0E0 - _0225F040 - 2 @ case 1
	.2byte _0225F100 - _0225F040 - 2 @ case 2
	.2byte _0225F124 - _0225F040 - 2 @ case 3
	.2byte _0225F262 - _0225F040 - 2 @ case 4
	.2byte _0225F274 - _0225F040 - 2 @ case 5
	.2byte _0225F2A4 - _0225F040 - 2 @ case 6
	.2byte _0225F2E0 - _0225F040 - 2 @ case 7
_0225F050:
	movs r1, #0x3d
	movs r0, #4
	lsls r1, r1, #4
	bl FUN_0201AA8C
	ldr r1, [sp, #0x18]
	movs r2, #0x3d
	str r0, [r1, #0xc]
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020E5B44
	ldr r0, [sp, #0x18]
	movs r1, #6
	ldr r4, [r0, #0xc]
	movs r2, #1
	adds r0, r4, #0
	bl FUN_021F05C4
	movs r0, #1
	str r0, [sp]
	movs r0, #0x9c
	str r0, [sp, #4]
	movs r0, #0x9e
	str r0, [sp, #8]
	movs r2, #0x9d
	str r2, [sp, #0xc]
	ldr r0, _0225F2B8 @ =0x000927C0
	adds r2, #0x9f
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	adds r1, r4, #0
	ldr r0, [r0, #0x20]
	adds r2, r4, r2
	movs r3, #3
	bl FUN_021F0614
	movs r7, #0x4f
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #2
_0225F0A2:
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r4, r7
	adds r3, r2, #0
	bl FUN_021F0718
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #6
	blt _0225F0A2
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _0225F330
_0225F0E0:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	adds r1, r0, #0
	ldr r3, [sp, #0x18]
	subs r1, #0x11
	adds r2, r1, #0
	adds r3, r3, #4
	bl FUN_021EFCF8
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _0225F330
_0225F100:
	ldr r1, [sp, #0x18]
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _0225F134
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	movs r0, #0xf2
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	adds r0, r0, #4
	lsls r2, r1, #5
	ldr r1, _0225F2BC @ =0x0225FB0C
	ldr r1, [r1, r2]
	str r1, [r4, r0]
	b _0225F330
_0225F124:
	movs r0, #0xf3
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0
	blt _0225F136
_0225F134:
	b _0225F330
_0225F136:
	subs r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #8
	str r1, [sp]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r2, r4, r1
	movs r1, #0x18
	muls r1, r0, r1
	lsls r3, r0, #5
	adds r0, r2, r1
	ldr r1, _0225F2C0 @ =0x0225FAF4
	ldr r2, _0225F2C4 @ =0x0225FAF8
	ldr r5, _0225F2C8 @ =0x0225FAFC
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	ldr r3, [r5, r3]
	bl FUN_021EFEC8
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #8
	str r1, [sp]
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r2, r4, r1
	movs r1, #0x18
	muls r1, r0, r1
	lsls r3, r0, #5
	adds r0, r2, r1
	ldr r1, _0225F2CC @ =0x0225FB00
	ldr r2, _0225F2D0 @ =0x0225FB04
	ldr r5, _0225F2D4 @ =0x0225FB08
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	ldr r3, [r5, r3]
	bl FUN_021EFEC8
	movs r0, #0x62
	lsls r0, r0, #2
	movs r1, #8
	adds r3, r4, r0
	movs r0, #0xf2
	str r1, [sp]
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	movs r0, #0x18
	muls r0, r2, r0
	adds r0, r3, r0
	ldr r3, _0225F2D8 @ =0xFFFFF99A
	lsls r1, r1, #0xa
	movs r2, #0x29
	bl FUN_021EFEC8
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	subs r0, #0x90
	adds r1, r4, r0
	movs r0, #0x14
	muls r0, r2, r0
	lsls r3, r2, #5
	ldr r2, _0225F2DC @ =0x0225FB10
	adds r0, r1, r0
	ldr r2, [r2, r3]
	movs r1, #0
	movs r3, #8
	bl FUN_021EFE34
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, _0225F2C0 @ =0x0225FAF4
	lsls r3, r0, #5
	ldr r2, _0225F2CC @ =0x0225FB00
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	add r0, sp, #0x40
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0x40
	bl FUN_020247D4
	movs r1, #2
	lsls r1, r1, #0xc
	add r0, sp, #0x34
	adds r2, r1, #0
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #2
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0x34
	bl FUN_02024804
	movs r1, #0xf2
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	movs r3, #1
	lsls r0, r0, #2
	adds r2, r4, r0
	adds r0, r1, #0
	subs r0, #0x18
	str r3, [r2, r0]
	ldr r0, [r4, r1]
	adds r0, r0, #1
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #6
	blt _0225F256
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _0225F330
_0225F256:
	lsls r2, r0, #5
	ldr r0, _0225F2BC @ =0x0225FB0C
	ldr r2, [r0, r2]
	adds r0, r1, #4
	str r2, [r4, r0]
	b _0225F330
_0225F262:
	movs r1, #0xf1
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _0225F330
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _0225F330
_0225F274:
	ldr r0, [sp, #0x18]
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl FUN_021FB514
	movs r0, #0xc
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	movs r2, #0
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #0x22
	adds r3, r2, #0
	bl FUN_0200FA24
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _0225F330
_0225F2A4:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225F330
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _0225F330
	.align 2, 0
_0225F2B8: .4byte 0x000927C0
_0225F2BC: .4byte 0x0225FB0C
_0225F2C0: .4byte 0x0225FAF4
_0225F2C4: .4byte 0x0225FAF8
_0225F2C8: .4byte 0x0225FAFC
_0225F2CC: .4byte 0x0225FB00
_0225F2D0: .4byte 0x0225FB04
_0225F2D4: .4byte 0x0225FB08
_0225F2D8: .4byte 0xFFFFF99A
_0225F2DC: .4byte 0x0225FB10
_0225F2E0:
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	ldr r0, [sp, #0x18]
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl FUN_021FB4F4
	ldr r0, [sp, #0x18]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0225F300
	movs r0, #1
	str r0, [r1]
_0225F300:
	movs r7, #0x17
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #4
_0225F308:
	ldr r0, [r5, r7]
	bl FUN_02024758
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #6
	blt _0225F308
	movs r1, #0x4f
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r1, r4, r1
	bl FUN_021F06EC
	adds r0, r4, #0
	bl FUN_021F05F4
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	bl FUN_021EFCDC
_0225F330:
	movs r1, #0x86
	movs r0, #0
	lsls r1, r1, #2
	str r0, [sp, #0x1c]
	adds r0, r4, r1
	str r0, [sp, #0x2c]
	adds r0, r1, #0
	adds r0, #0x90
	adds r0, r4, r0
	subs r1, #0x90
	str r0, [sp, #0x28]
	adds r0, r4, r1
	str r0, [sp, #0x24]
	movs r0, #0xce
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r5, r4, #0
	str r0, [sp, #0x20]
	adds r6, r4, #0
	adds r7, r4, #0
_0225F358:
	movs r0, #0x3b
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0225F3E4
	ldr r0, [sp, #0x2c]
	bl FUN_021EFF28
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x28]
	bl FUN_021EFF28
	ldr r0, [sp, #0x24]
	bl FUN_021EFF28
	ldr r0, [sp, #0x20]
	bl FUN_021EFE44
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _0225F394
	movs r0, #0x3b
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02024830
_0225F394:
	movs r1, #0x86
	movs r2, #0xaa
	lsls r1, r1, #2
	lsls r2, r2, #2
	ldr r1, [r6, r1]
	ldr r2, [r6, r2]
	add r0, sp, #0x40
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	add r1, sp, #0x40
	bl FUN_020247D4
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	add r0, sp, #0x34
	adds r2, r1, #0
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	add r1, sp, #0x34
	bl FUN_020247F4
	movs r1, #0xce
	lsls r1, r1, #2
	movs r0, #0x17
	ldr r1, [r7, r1]
	lsls r0, r0, #4
	lsls r1, r1, #0x10
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x10
	bl FUN_02024818
_0225F3E4:
	ldr r0, [sp, #0x2c]
	adds r5, r5, #4
	adds r0, #0x18
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	adds r6, #0x18
	adds r0, #0x18
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	adds r7, #0x14
	adds r0, #0x18
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	adds r0, #0x14
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #6
	blt _0225F358
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	cmp r0, #7
	beq _0225F41A
	ldr r0, [r4]
	bl FUN_0202457C
_0225F41A:
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov117_0225F020

	thumb_func_start ov117_0225F420
ov117_0225F420: @ 0x0225F420
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #4
	str r0, [sp]
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, [r5, #0x20]
	movs r2, #0
	add r3, sp, #0xc
	bl FUN_02007C2C
	ldr r2, [sp, #0xc]
	movs r3, #0
	str r3, [sp]
	adds r6, r0, #0
	ldrh r0, [r2]
	adds r1, r4, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	adds r2, #0xc
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #8]
	bl FUN_0201C4C4
	adds r0, r6, #0
	bl FUN_0201AB0C
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	ldr r0, [r0, #8]
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov117_0225F420

	thumb_func_start ov117_0225F470
ov117_0225F470: @ 0x0225F470
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
	thumb_func_end ov117_0225F470

	thumb_func_start ov117_0225F4D4
ov117_0225F4D4: @ 0x0225F4D4
	ldr r3, _0225F4DC @ =ov117_0225F524
	ldr r2, _0225F4E0 @ =_0225FACC
	bx r3
	nop
_0225F4DC: .4byte ov117_0225F524
_0225F4E0: .4byte _0225FACC
	thumb_func_end ov117_0225F4D4

	thumb_func_start ov117_0225F4E4
ov117_0225F4E4: @ 0x0225F4E4
	ldr r3, _0225F4EC @ =ov117_0225F524
	ldr r2, _0225F4F0 @ =0x0225FAD4
	bx r3
	nop
_0225F4EC: .4byte ov117_0225F524
_0225F4F0: .4byte 0x0225FAD4
	thumb_func_end ov117_0225F4E4

	thumb_func_start ov117_0225F4F4
ov117_0225F4F4: @ 0x0225F4F4
	ldr r3, _0225F4FC @ =ov117_0225F524
	ldr r2, _0225F500 @ =0x0225FADC
	bx r3
	nop
_0225F4FC: .4byte ov117_0225F524
_0225F500: .4byte 0x0225FADC
	thumb_func_end ov117_0225F4F4

	thumb_func_start ov117_0225F504
ov117_0225F504: @ 0x0225F504
	ldr r3, _0225F50C @ =ov117_0225F524
	ldr r2, _0225F510 @ =0x0225FAE4
	bx r3
	nop
_0225F50C: .4byte ov117_0225F524
_0225F510: .4byte 0x0225FAE4
	thumb_func_end ov117_0225F504

	thumb_func_start ov117_0225F514
ov117_0225F514: @ 0x0225F514
	ldr r3, _0225F51C @ =ov117_0225F524
	ldr r2, _0225F520 @ =0x0225FAEC
	bx r3
	nop
_0225F51C: .4byte ov117_0225F524
_0225F520: .4byte 0x0225FAEC
	thumb_func_end ov117_0225F514

	thumb_func_start ov117_0225F524
ov117_0225F524: @ 0x0225F524
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r1, #0
	str r0, [sp, #0x14]
	ldr r0, [r5]
	adds r6, r2, #0
	movs r7, #4
	ldr r4, [r5, #0xc]
	cmp r0, #0xc
	bls _0225F53A
	b _0225FA98
_0225F53A:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225F546: @ jump table
	.2byte _0225F560 - _0225F546 - 2 @ case 0
	.2byte _0225F72E - _0225F546 - 2 @ case 1
	.2byte _0225F744 - _0225F546 - 2 @ case 2
	.2byte _0225F76A - _0225F546 - 2 @ case 3
	.2byte _0225F79C - _0225F546 - 2 @ case 4
	.2byte _0225F806 - _0225F546 - 2 @ case 5
	.2byte _0225F820 - _0225F546 - 2 @ case 6
	.2byte _0225F860 - _0225F546 - 2 @ case 7
	.2byte _0225F944 - _0225F546 - 2 @ case 8
	.2byte _0225F95E - _0225F546 - 2 @ case 9
	.2byte _0225F99E - _0225F546 - 2 @ case 10
	.2byte _0225FA16 - _0225F546 - 2 @ case 11
	.2byte _0225FA26 - _0225F546 - 2 @ case 12
_0225F560:
	movs r1, #0x6f
	adds r0, r7, #0
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0x6f
	str r0, [r5, #0xc]
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	ldr r4, [r5, #0xc]
	movs r1, #1
	adds r0, r4, #4
	adds r2, r1, #0
	bl FUN_021F05C4
	movs r0, #1
	str r0, [sp]
	ldrb r0, [r6, #1]
	movs r2, #5
	lsls r2, r2, #6
	str r0, [sp, #4]
	ldrb r0, [r6, #2]
	adds r1, r4, #4
	adds r2, r4, r2
	str r0, [sp, #8]
	ldrb r0, [r6, #3]
	str r0, [sp, #0xc]
	ldr r0, _0225F8D8 @ =0x000927C0
	str r0, [sp, #0x10]
	ldrb r3, [r6]
	ldr r0, [r5, #0x20]
	bl FUN_021F0614
	movs r0, #0
	movs r2, #5
	str r0, [sp]
	lsls r2, r2, #6
	str r0, [sp, #4]
	adds r1, r4, r2
	adds r0, r4, #4
	lsls r2, r2, #0xc
	lsls r3, r7, #0x11
	bl FUN_021F0718
	str r0, [r4]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4]
	movs r1, #1
	bl FUN_02024B78
	ldr r0, [r4]
	movs r1, #0
	bl FUN_02024A04
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #5
	movs r1, #0x6a
	lsls r0, r0, #0x12
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #4
	lsls r2, r7, #0x11
	str r2, [r4, r0]
	movs r0, #0
	adds r1, #8
	str r0, [r4, r1]
	adds r0, r7, #0
	str r0, [sp]
	ldr r0, _0225F8DC @ =0x04000050
	movs r1, #2
	movs r2, #0x3d
	movs r3, #0xc
	blx FUN_020CF15C
	movs r0, #2
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #3
	movs r1, #1
	bl FUN_0201BB68
	movs r0, #1
	movs r1, #2
	bl FUN_0201BB68
	movs r0, #0
	movs r1, #3
	bl FUN_0201BB68
	movs r0, #1
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #2
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #3
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	movs r1, #0xd9
	ldr r0, [r0, #8]
	movs r2, #0xd8
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x20]
	movs r3, #0xd7
	bl FUN_021F0454
	movs r0, #0x20
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [r5, #0x20]
	movs r1, #0x10
	movs r2, #0
	movs r3, #0x40
	bl FUN_02007B8C
	movs r0, #0x14
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r2, #2
	str r2, [sp, #8]
	movs r1, #0x66
	lsls r1, r1, #2
	str r2, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	adds r1, r4, r1
	ldr r0, [r0, #8]
	movs r3, #0
	bl FUN_0201D40C
	movs r0, #0x66
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r6, #4]
	adds r1, r7, #0
	bl ov117_0225F470
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	ldr r0, _0225F8E0 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x66
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r2, r6, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	movs r1, #0xda
	ldr r0, [r0, #8]
	movs r2, #0xd8
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x20]
	movs r3, #0xd7
	bl FUN_021F0454
	ldr r0, _0225F8E4 @ =0x04000048
	movs r2, #0x3f
	ldrh r3, [r0]
	movs r1, #8
	bics r3, r2
	orrs r1, r3
	movs r3, #0x20
	orrs r1, r3
	strh r1, [r0]
	ldrh r6, [r0, #2]
	movs r1, #0x17
	bics r6, r2
	orrs r1, r6
	orrs r1, r3
	strh r1, [r0, #2]
	adds r1, r0, #0
	movs r2, #0xff
	subs r1, #8
	strh r2, [r1]
	ldr r1, _0225F8E8 @ =0x00006060
	subs r0, r0, #4
	strh r1, [r0]
	adds r2, #0x8d
	adds r0, r4, r2
	adds r1, r7, #0
	bl FUN_021F12B4
	movs r1, #0x10
	movs r0, #1
	adds r2, r1, #0
	str r0, [sp]
	subs r2, #0x20
	adds r3, r5, #4
	bl FUN_021EFCF8
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225F72E:
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BC28
	movs r0, #0x6d
	movs r1, #0xc
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
_0225F744:
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #8]
	adds r2, r1, #0
	movs r3, #0x18
	bl FUN_0201BC8C
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bgt _0225F816
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225F76A:
	lsls r2, r7, #0x18
	ldr r1, [r2]
	ldr r0, _0225F8EC @ =0xFFFF1FFF
	ands r1, r0
	lsls r0, r7, #0xb
	orrs r0, r1
	str r0, [r2]
	movs r0, #3
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #0x5d
	adds r3, r7, #0
	lsls r0, r0, #2
	movs r2, #6
	str r3, [sp]
	adds r0, r4, r0
	movs r1, #0
	lsls r2, r2, #0x10
	lsls r3, r3, #0xc
	bl FUN_021EFEC8
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
_0225F79C:
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #8]
	adds r2, r1, #0
	movs r3, #0x18
	bl FUN_0201BC8C
	movs r0, #0x5d
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_021EFF28
	cmp r0, #0
	bne _0225F7DC
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r3, #0x60
	asrs r2, r0, #0xc
	subs r3, r3, r2
	ldr r0, _0225F8F0 @ =0x04000040
	movs r1, #0xff
	strh r1, [r0]
	lsls r3, r3, #8
	lsls r1, r1, #8
	adds r2, #0x60
	ands r3, r1
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	orrs r1, r3
	strh r1, [r0, #4]
	b _0225FA98
_0225F7DC:
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0225F8EC @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	ldr r0, [r5, #0x10]
	movs r2, #0
	ldr r0, [r0, #8]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201BC8C
	movs r0, #0x6d
	movs r1, #0xd
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225F806:
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	ble _0225F818
_0225F816:
	b _0225FA98
_0225F818:
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225F820:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0xdd
	bl ov117_0225F420
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #3
	movs r1, #2
	bl FUN_0201BB68
	movs r0, #0x10
	str r0, [sp]
	ldr r0, _0225F8DC @ =0x04000050
	movs r1, #2
	movs r2, #0x3d
	movs r3, #0
	blx FUN_020CF15C
	ldr r0, [r4]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x6d
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
_0225F860:
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	movs r6, #0
	cmp r1, #0x10
	bgt _0225F892
	adds r1, r1, #4
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0x10
	ble _0225F87C
	movs r1, #0x10
	str r1, [r4, r0]
	movs r6, #1
_0225F87C:
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r3, [r4, r0]
	movs r0, #0x10
	subs r0, r0, r3
	str r0, [sp]
	ldr r0, _0225F8DC @ =0x04000050
	movs r1, #2
	movs r2, #0x3d
	blx FUN_020CF15C
_0225F892:
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	movs r0, #2
	lsls r0, r0, #0x12
	subs r0, r0, r1
	lsls r0, r0, #1
	movs r1, #3
	blx FUN_020F2998
	movs r1, #0x6a
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	adds r0, r2, r0
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	asrs r0, r0, #0xc
	cmp r0, #0x82
	bgt _0225F90C
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [r4, r1]
	cmp r6, #1
	bne _0225F90C
	movs r0, #1
	str r0, [sp]
	movs r0, #8
	movs r1, #0
	movs r2, #0x10
	movs r3, #0x1e
	bl FUN_0200B484
	ldr r1, _0225F8F4 @ =0x000014A5
	b _0225F8F8
	nop
_0225F8D8: .4byte 0x000927C0
_0225F8DC: .4byte 0x04000050
_0225F8E0: .4byte 0x00010200
_0225F8E4: .4byte 0x04000048
_0225F8E8: .4byte 0x00006060
_0225F8EC: .4byte 0xFFFF1FFF
_0225F8F0: .4byte 0x04000040
_0225F8F4: .4byte 0x000014A5
_0225F8F8:
	movs r0, #0
	bl FUN_0201C2D8
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201BC28
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
_0225F90C:
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #4
	ble _0225F91E
	movs r0, #2
	movs r1, #1
	bl FUN_0201BC28
_0225F91E:
	movs r3, #0x6a
	lsls r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [r5, #0x10]
	asrs r3, r3, #0xc
	adds r3, #8
	ldr r0, [r0, #8]
	movs r1, #2
	movs r2, #0
	rsbs r3, r3, #0
	bl FUN_0201F238
	movs r1, #0x6a
	lsls r1, r1, #2
	ldr r0, [r4]
	adds r1, r4, r1
	bl FUN_020247D4
	b _0225FA98
_0225F944:
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #0
	beq _0225F96E
	movs r0, #0x6d
	movs r1, #0x10
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225F95E:
	movs r1, #0x6d
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	subs r0, r0, #1
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	ble _0225F970
_0225F96E:
	b _0225FA98
_0225F970:
	movs r3, #8
	adds r0, r1, #0
	str r3, [sp]
	subs r1, #0xc
	subs r0, #0x40
	ldr r1, [r4, r1]
	ldr r2, _0225FABC @ =0xFFFA0000
	adds r0, r4, r0
	lsls r3, r3, #0xa
	bl FUN_021EFEC8
	movs r0, #0x6d
	movs r1, #8
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #3
	movs r1, #0
	bl FUN_0201BC28
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225F99E:
	movs r1, #0x5d
	lsls r1, r1, #2
	adds r0, r1, #0
	ldr r2, [r4, r1]
	adds r0, #0x34
	adds r1, #0x34
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	asrs r0, r0, #0xc
	adds r0, #8
	rsbs r3, r0, #0
	bpl _0225F9C4
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #8]
	movs r2, #0
	bl FUN_0201F238
	b _0225F9CC
_0225F9C4:
	movs r0, #2
	movs r1, #0
	bl FUN_0201BC28
_0225F9CC:
	movs r1, #0x6a
	lsls r1, r1, #2
	ldr r0, [r4]
	adds r1, r4, r1
	bl FUN_020247D4
	movs r0, #0x5d
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_021EFF28
	cmp r0, #0
	beq _0225FA98
	ldr r2, _0225FAC0 @ =0x04001000
	ldr r0, _0225FAC4 @ =0xFFFEFFFF
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #4
	movs r1, #0
	bl FUN_0201C2D8
	movs r1, #4
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	str r1, [sp, #8]
	ldr r3, _0225FAC8 @ =0x00007FFF
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225FA16:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225FA98
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225FA26:
	ldr r1, [r5, #0x14]
	cmp r1, #0
	beq _0225FA30
	movs r0, #1
	str r0, [r1]
_0225FA30:
	movs r0, #0x63
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_021F12D0
	movs r0, #0x6e
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4]
	bl FUN_02024758
	movs r1, #5
	lsls r1, r1, #6
	adds r0, r4, #4
	adds r1, r4, r1
	bl FUN_021F06EC
	adds r0, r4, #4
	bl FUN_021F05F4
	movs r0, #0x66
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	movs r3, #4
	bl FUN_0201C1C4
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #4
	bl FUN_0201C1C4
	ldr r0, [r5, #0x10]
	movs r1, #3
	ldr r0, [r0, #8]
	bl FUN_0201CAE0
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #8]
	bl FUN_0201CAE0
	ldr r1, [sp, #0x14]
	adds r0, r5, #0
	bl FUN_021EFCDC
_0225FA98:
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _0225FAAC
	subs r0, #0x2c
	adds r0, r4, r0
	movs r1, #2
	bl FUN_021F1310
_0225FAAC:
	ldr r0, [r5]
	cmp r0, #0xc
	beq _0225FAB8
	ldr r0, [r4, #4]
	bl FUN_0202457C
_0225FAB8:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225FABC: .4byte 0xFFFA0000
_0225FAC0: .4byte 0x04001000
_0225FAC4: .4byte 0xFFFEFFFF
_0225FAC8: .4byte 0x00007FFF
	thumb_func_end ov117_0225F524

	.rodata

_0225FACC:
	.byte 0xDE, 0xDF, 0xE0, 0xE1
	.byte 0xE8, 0x01, 0x00, 0x00, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0x01, 0x00, 0x00, 0xE6, 0xE7, 0xE8, 0xE9
	.byte 0xE5, 0x01, 0x00, 0x00, 0xEA, 0xEB, 0xEC, 0xED, 0xDF, 0x01, 0x00, 0x00, 0xEE, 0xEF, 0xF0, 0xF1
	.byte 0xBC, 0x02, 0x00, 0x00, 0x00, 0x40, 0x10, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x20, 0xFE, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0x40, 0x01, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0xFE, 0xFF, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x08, 0x00, 0x00, 0xE0, 0x01, 0x00
	.byte 0x00, 0x00, 0x0A, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0xC0, 0xFE, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0xE0, 0x01, 0x00
	.byte 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x40, 0x06, 0x00, 0x00, 0x40, 0x01, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0xFD, 0xFF, 0x00, 0xC0, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x60, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x0A, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0xC0, 0xFE, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0xFE, 0xFF, 0x00, 0x40, 0x10, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x20, 0xFE, 0xFF
	.byte 0x00, 0x00, 0x05, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0xFD, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0xE0, 0x01, 0x00
	.byte 0x00, 0x00, 0x0A, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0xC0, 0xFE, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00
	@ 0x0225FBB4
