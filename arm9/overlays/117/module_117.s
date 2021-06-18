
	thumb_func_start MOD117_0225F020
MOD117_0225F020: @ 0x0225F020
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
	thumb_func_end MOD117_0225F020
