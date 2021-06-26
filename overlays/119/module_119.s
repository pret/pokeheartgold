
	thumb_func_start ov119_0225F020
ov119_0225F020: @ 0x0225F020
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	adds r7, r1, #0
	str r0, [sp, #0x14]
	ldr r0, [r7]
	ldr r4, [r7, #0xc]
	cmp r0, #7
	bls _0225F032
	b _0225F35E
_0225F032:
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225F03E: @ jump table
	.2byte _0225F04E - _0225F03E - 2 @ case 0
	.2byte _0225F10C - _0225F03E - 2 @ case 1
	.2byte _0225F126 - _0225F03E - 2 @ case 2
	.2byte _0225F132 - _0225F03E - 2 @ case 3
	.2byte _0225F196 - _0225F03E - 2 @ case 4
	.2byte _0225F1FE - _0225F03E - 2 @ case 5
	.2byte _0225F28A - _0225F03E - 2 @ case 6
	.2byte _0225F314 - _0225F03E - 2 @ case 7
_0225F04E:
	movs r1, #0x1e
	movs r0, #4
	lsls r1, r1, #4
	bl FUN_0201AA8C
	movs r2, #0x1e
	str r0, [r7, #0xc]
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020E5B44
	ldr r0, [r7, #0x10]
	ldr r4, [r7, #0xc]
	ldr r1, [r0, #0x24]
	movs r0, #7
	lsls r0, r0, #6
	str r1, [r4, r0]
	bl FUN_021EFFEC
	str r0, [r4, #0x44]
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #2
	movs r2, #1
	bl FUN_021F05C4
	movs r0, #1
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #9
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r0, _0225F370 @ =0x000927C0
	movs r2, #0x61
	str r0, [sp, #0x10]
	adds r1, r4, #0
	lsls r2, r2, #2
	ldr r0, [r7, #0x20]
	adds r1, #0x48
	adds r2, r4, r2
	movs r3, #0
	bl FUN_021F0614
	movs r0, #0
	str r0, [sp, #0x18]
	adds r6, r0, #0
	adds r0, r4, #0
	str r0, [sp, #0x20]
	adds r0, #0x48
	adds r5, r4, #0
	str r0, [sp, #0x20]
_0225F0B8:
	movs r0, #0
	str r0, [sp]
	movs r1, #0x61
	str r0, [sp, #4]
	lsls r1, r1, #2
	movs r2, #2
	movs r3, #6
	ldr r0, [sp, #0x20]
	adds r1, r4, r1
	lsls r2, r2, #0x12
	lsls r3, r3, #0x10
	bl FUN_021F0718
	movs r1, #0x6e
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_02024ADC
	ldr r0, [sp, #0x18]
	adds r5, r5, #4
	adds r0, r0, #1
	adds r6, r6, #2
	str r0, [sp, #0x18]
	cmp r0, #2
	blt _0225F0B8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F10C:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	adds r1, r0, #0
	subs r1, #0x11
	adds r2, r1, #0
	adds r3, r7, #4
	bl FUN_021EFCF8
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F126:
	ldr r1, [r7, #4]
	cmp r1, #0
	beq _0225F1F4
	adds r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F132:
	movs r0, #0xa
	movs r2, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x29
	lsls r2, r2, #0xc
	movs r3, #2
	bl FUN_021EFEC8
	ldr r1, [r4]
	add r0, sp, #0x54
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_021F074C
	movs r6, #0
	adds r5, r4, #0
_0225F154:
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_0202487C
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0x54
	bl FUN_020247F4
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #2
	blt _0225F154
	adds r0, r4, #0
	ldr r2, _0225F374 @ =0x0000FFFF
	adds r0, #0x18
	movs r1, #0
	movs r3, #0xa
	bl FUN_021EFE34
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F196:
	adds r0, r4, #0
	bl FUN_021EFF28
	ldr r1, [r4]
	str r0, [sp, #0x1c]
	add r0, sp, #0x54
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_021F074C
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_021EFE44
	movs r6, #0
	adds r5, r4, #0
_0225F1B6:
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0x54
	bl FUN_020247F4
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #2
	blt _0225F1B6
	movs r0, #0x6e
	ldr r1, [r4, #0x18]
	lsls r0, r0, #2
	lsls r1, r1, #0x10
	ldr r0, [r4, r0]
	lsrs r1, r1, #0x10
	bl FUN_02024818
	movs r1, #0x6f
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	ldr r2, [r4, #0x18]
	subs r1, #0xbc
	subs r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FUN_02024818
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	beq _0225F1F6
_0225F1F4:
	b _0225F35E
_0225F1F6:
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F1FE:
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r0, #0xa
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	ldr r1, [r4, #0x44]
	adds r0, r7, #0
	movs r2, #0x60
	movs r3, #6
	bl FUN_021F0050
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_020248F0
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_020248F0
	movs r0, #6
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0xff
	movs r3, #0xa
	adds r0, #0x2c
	movs r1, #0
	lsls r2, r2, #0xc
	lsls r3, r3, #0xc
	bl FUN_021EFEC8
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_02023614
	adds r1, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #0x71
	movs r2, #0x7d
	lsls r0, r0, #2
	lsls r2, r2, #0xe
	ldr r3, _0225F378 @ =0xFFFF6000
	adds r0, r4, r0
	subs r2, r1, r2
	bl FUN_021EFEC8
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024818
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024818
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F28A:
	adds r0, r4, #0
	adds r0, #0x2c
	bl FUN_021EFF28
	movs r1, #2
	ldr r2, [r4, #0x2c]
	lsls r1, r1, #0x12
	subs r1, r1, r2
	movs r2, #6
	add r0, sp, #0x30
	lsls r2, r2, #0x10
	movs r3, #0
	bl FUN_021F074C
	add r3, sp, #0x30
	ldm r3!, {r0, r1}
	add r2, sp, #0x48
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #2
	str r0, [r2]
	ldr r2, [r4, #0x2c]
	lsls r1, r1, #0x12
	adds r1, r2, r1
	movs r2, #6
	add r0, sp, #0x24
	lsls r2, r2, #0x10
	movs r3, #0
	bl FUN_021F074C
	add r3, sp, #0x24
	ldm r3!, {r0, r1}
	add r2, sp, #0x3c
	stm r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0x48
	str r0, [r2]
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020247D4
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x3c
	bl FUN_020247D4
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_021EFF28
	movs r1, #0x71
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	subs r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_020235D4
	adds r0, r7, #0
	bl FUN_021EFE30
	cmp r0, #0
	beq _0225F35E
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F314:
	movs r0, #0
	bl FUN_0200FC20
	ldr r1, [r7, #0x14]
	cmp r1, #0
	beq _0225F324
	movs r0, #1
	str r0, [r1]
_0225F324:
	movs r6, #0
	adds r5, r4, #0
_0225F328:
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02024758
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #2
	blt _0225F328
	movs r1, #0x61
	adds r0, r4, #0
	lsls r1, r1, #2
	adds r0, #0x48
	adds r1, r4, r1
	bl FUN_021F06EC
	adds r0, r4, #0
	adds r0, #0x48
	bl FUN_021F05F4
	ldr r0, [r4, #0x44]
	bl FUN_021F0028
	ldr r1, [sp, #0x14]
	adds r0, r7, #0
	bl FUN_021EFCDC
_0225F35E:
	ldr r0, [r7]
	cmp r0, #7
	beq _0225F36A
	ldr r0, [r4, #0x48]
	bl FUN_0202457C
_0225F36A:
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225F370: .4byte 0x000927C0
_0225F374: .4byte 0x0000FFFF
_0225F378: .4byte 0xFFFF6000
	thumb_func_end ov119_0225F020

	thumb_func_start ov119_0225F37C
ov119_0225F37C: @ 0x0225F37C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	adds r6, r1, #0
	str r0, [sp, #0x14]
	ldr r0, [r6]
	ldr r4, [r6, #0xc]
	cmp r0, #7
	bhi _0225F47A
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225F398: @ jump table
	.2byte _0225F3A8 - _0225F398 - 2 @ case 0
	.2byte _0225F45A - _0225F398 - 2 @ case 1
	.2byte _0225F474 - _0225F398 - 2 @ case 2
	.2byte _0225F482 - _0225F398 - 2 @ case 3
	.2byte _0225F510 - _0225F398 - 2 @ case 4
	.2byte _0225F5A0 - _0225F398 - 2 @ case 5
	.2byte _0225F5DA - _0225F398 - 2 @ case 6
	.2byte _0225F604 - _0225F398 - 2 @ case 7
_0225F3A8:
	movs r1, #0x71
	movs r0, #4
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0x71
	str r0, [r6, #0xc]
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	ldr r0, [r6, #0x10]
	ldr r4, [r6, #0xc]
	ldr r1, [r0, #0x24]
	movs r0, #0x69
	lsls r0, r0, #2
	str r1, [r4, r0]
	bl FUN_021F0250
	str r0, [r4, #0x28]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #2
	movs r2, #1
	bl FUN_021F05C4
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	ldr r0, _0225F660 @ =0x000927C0
	movs r2, #0x5a
	str r0, [sp, #0x10]
	adds r1, r4, #0
	lsls r2, r2, #2
	ldr r0, [r6, #0x20]
	adds r1, #0x2c
	adds r2, r4, r2
	movs r3, #0
	bl FUN_021F0614
	adds r0, r4, #0
	str r0, [sp, #0x18]
	adds r0, #0x2c
	movs r7, #0
	adds r5, r4, #0
	str r0, [sp, #0x18]
_0225F40E:
	movs r0, #0
	str r0, [sp]
	movs r1, #0x5a
	str r0, [sp, #4]
	lsls r1, r1, #2
	movs r2, #2
	ldr r0, [sp, #0x18]
	adds r1, r4, r1
	lsls r2, r2, #0x12
	movs r3, #0
	bl FUN_021F0718
	movs r1, #0x67
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_0202487C
	adds r7, r7, #1
	adds r5, r5, #4
	cmp r7, #2
	blt _0225F40E
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F45A:
	movs r1, #0x10
	movs r0, #2
	adds r2, r1, #0
	str r0, [sp]
	movs r0, #1
	subs r2, #0x20
	adds r3, r6, #4
	bl FUN_021EFCF8
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F474:
	ldr r1, [r6, #4]
	cmp r1, #0
	bne _0225F47C
_0225F47A:
	b _0225F64E
_0225F47C:
	adds r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F482:
	movs r2, #3
	ldr r1, _0225F664 @ =0xFFF40000
	adds r0, r4, #0
	lsls r2, r2, #0x12
	movs r3, #8
	bl FUN_021EFE70
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r2, #2
	ldr r1, [r4]
	lsls r2, r2, #0x12
	subs r1, r2, r1
	add r0, sp, #0x40
	lsrs r2, r2, #1
	movs r3, #0
	bl FUN_021F074C
	add r3, sp, #0x40
	ldm r3!, {r0, r1}
	add r2, sp, #0x70
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r3, #0
	str r0, [r2]
	movs r2, #2
	ldr r1, [r4]
	lsls r2, r2, #0x12
	add r0, sp, #0x34
	adds r1, r1, r2
	bl FUN_021F074C
	add r3, sp, #0x34
	ldm r3!, {r0, r1}
	add r2, sp, #0x64
	stm r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0x70
	str r0, [r2]
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020247D4
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x64
	bl FUN_020247D4
	adds r0, r4, #0
	ldr r2, _0225F668 @ =0x0001FFFE
	adds r0, #0x14
	movs r1, #0
	movs r3, #8
	bl FUN_021EFE34
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F510:
	adds r0, r4, #0
	bl FUN_021EFE80
	movs r2, #2
	adds r5, r0, #0
	ldr r1, [r4]
	lsls r2, r2, #0x12
	subs r1, r2, r1
	add r0, sp, #0x28
	lsrs r2, r2, #1
	movs r3, #0
	bl FUN_021F074C
	add r3, sp, #0x28
	ldm r3!, {r0, r1}
	add r2, sp, #0x58
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r3, #0
	str r0, [r2]
	movs r2, #2
	ldr r1, [r4]
	lsls r2, r2, #0x12
	add r0, sp, #0x1c
	adds r1, r1, r2
	bl FUN_021F074C
	add r3, sp, #0x1c
	ldm r3!, {r0, r1}
	add r2, sp, #0x4c
	stm r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0x58
	str r0, [r2]
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020247D4
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x4c
	bl FUN_020247D4
	adds r0, r4, #0
	adds r0, #0x14
	bl FUN_021EFE44
	movs r0, #0x67
	ldr r1, [r4, #0x14]
	lsls r0, r0, #2
	lsls r1, r1, #0x10
	ldr r0, [r4, r0]
	lsrs r1, r1, #0x10
	bl FUN_02024818
	ldr r1, [r4, #0x14]
	movs r0, #0x1a
	lsls r0, r0, #4
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	ldr r0, [r4, r0]
	lsrs r1, r1, #0x10
	bl FUN_02024818
	cmp r5, #1
	bne _0225F64E
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F5A0:
	movs r3, #1
	lsls r3, r3, #0xc
	str r3, [sp]
	ldr r1, [r4, #0x28]
	adds r0, r6, #0
	movs r2, #8
	bl FUN_021F02C4
	movs r0, #0x69
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02023614
	adds r1, r0, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #0x6a
	movs r2, #0x7d
	lsls r0, r0, #2
	lsls r2, r2, #0xe
	ldr r3, _0225F66C @ =0xFFFF6000
	adds r0, r4, r0
	subs r2, r1, r2
	bl FUN_021EFEC8
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F5DA:
	movs r0, #0x6a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_021EFF28
	movs r1, #0x6a
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	subs r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_020235D4
	adds r0, r6, #0
	bl FUN_021EFE30
	cmp r0, #1
	bne _0225F64E
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F604:
	movs r0, #0
	bl FUN_0200FC20
	ldr r1, [r6, #0x14]
	cmp r1, #0
	beq _0225F614
	movs r0, #1
	str r0, [r1]
_0225F614:
	movs r7, #0
	adds r5, r4, #0
_0225F618:
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02024758
	adds r7, r7, #1
	adds r5, r5, #4
	cmp r7, #2
	blt _0225F618
	movs r1, #0x5a
	adds r0, r4, #0
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r1, r4, r1
	bl FUN_021F06EC
	adds r0, r4, #0
	adds r0, #0x2c
	bl FUN_021F05F4
	ldr r0, [r4, #0x28]
	bl FUN_021F029C
	ldr r1, [sp, #0x14]
	adds r0, r6, #0
	bl FUN_021EFCDC
_0225F64E:
	ldr r0, [r6]
	cmp r0, #7
	beq _0225F65A
	ldr r0, [r4, #0x2c]
	bl FUN_0202457C
_0225F65A:
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	nop
_0225F660: .4byte 0x000927C0
_0225F664: .4byte 0xFFF40000
_0225F668: .4byte 0x0001FFFE
_0225F66C: .4byte 0xFFFF6000
	thumb_func_end ov119_0225F37C

	thumb_func_start ov119_0225F670
ov119_0225F670: @ 0x0225F670
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	adds r7, r1, #0
	str r0, [sp, #0x14]
	ldr r0, [r7]
	ldr r4, [r7, #0xc]
	cmp r0, #7
	bls _0225F682
	b _0225F9F0
_0225F682:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225F68E: @ jump table
	.2byte _0225F69E - _0225F68E - 2 @ case 0
	.2byte _0225F75E - _0225F68E - 2 @ case 1
	.2byte _0225F778 - _0225F68E - 2 @ case 2
	.2byte _0225F7BE - _0225F68E - 2 @ case 3
	.2byte _0225F824 - _0225F68E - 2 @ case 4
	.2byte _0225F8B0 - _0225F68E - 2 @ case 5
	.2byte _0225F934 - _0225F68E - 2 @ case 6
	.2byte _0225F99C - _0225F68E - 2 @ case 7
_0225F69E:
	movs r1, #0x7a
	movs r0, #4
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0x7a
	str r0, [r7, #0xc]
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	ldr r0, [r7, #0x10]
	ldr r4, [r7, #0xc]
	ldr r1, [r0, #0x24]
	movs r0, #0x72
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x40
	movs r1, #4
	bl FUN_021F12B4
	movs r0, #0x79
	movs r1, #0xc
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x50
	movs r1, #2
	movs r2, #1
	bl FUN_021F05C4
	movs r0, #1
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #9
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r0, _0225FA10 @ =0x000927C0
	movs r2, #0x63
	str r0, [sp, #0x10]
	adds r1, r4, #0
	lsls r2, r2, #2
	ldr r0, [r7, #0x20]
	adds r1, #0x50
	adds r2, r4, r2
	movs r3, #0
	bl FUN_021F0614
	adds r0, r4, #0
	str r0, [sp, #0x1c]
	adds r0, #0x50
	movs r6, #0
	adds r5, r4, #0
	str r0, [sp, #0x1c]
_0225F710:
	movs r0, #0
	str r0, [sp]
	movs r1, #0x63
	str r0, [sp, #4]
	lsls r1, r1, #2
	movs r2, #2
	movs r3, #6
	ldr r0, [sp, #0x1c]
	adds r1, r4, r1
	lsls r2, r2, #0x12
	lsls r3, r3, #0x10
	bl FUN_021F0718
	movs r1, #7
	lsls r1, r1, #6
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_02024ADC
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #2
	blt _0225F710
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F75E:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	adds r1, r0, #0
	subs r1, #0x11
	adds r2, r1, #0
	adds r3, r7, #4
	bl FUN_021EFCF8
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F778:
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225F7B0
	movs r0, #3
	lsls r0, r0, #0xe
	movs r3, #0x32
	str r0, [sp]
	lsls r3, r3, #4
	str r3, [sp, #4]
	ldr r0, _0225FA14 @ =0x04000010
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #4
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r0, #0x40
	movs r2, #0xbf
	subs r3, #0x76
	bl FUN_021F12E8
	movs r0, #1
	str r0, [r4, #0x4c]
_0225F7B0:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0225F88A
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F7BE:
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #0
	movs r2, #0x10
	movs r3, #8
	bl FUN_021EFE34
	ldr r3, [r4, #0x18]
	movs r0, #0x10
	subs r0, r0, r3
	str r0, [sp]
	ldr r0, _0225FA18 @ =0x04000050
	movs r1, #0
	movs r2, #0xf
	blx FUN_020CF15C
	movs r6, #0
	adds r5, r4, #0
_0225F7E2:
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_0202487C
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024B78
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #2
	blt _0225F7E2
	adds r0, r4, #0
	ldr r2, _0225FA1C @ =0x0000FFFF
	adds r0, #0x2c
	movs r1, #0
	movs r3, #8
	bl FUN_021EFE34
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F824:
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_021EFE44
	adds r6, r0, #0
	ldr r1, [r4, #0x18]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0225FA20 @ =0x04000052
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	adds r0, #0x2c
	bl FUN_021EFE44
	cmp r0, #0
	bne _0225F86E
	movs r0, #7
	ldr r1, [r4, #0x2c]
	lsls r0, r0, #6
	lsls r1, r1, #0x10
	ldr r0, [r4, r0]
	lsrs r1, r1, #0x10
	bl FUN_02024818
	movs r0, #0x71
	lsls r0, r0, #2
	lsls r1, r5, #0x10
	ldr r0, [r4, r0]
	lsrs r1, r1, #0x10
	bl FUN_02024818
	b _0225F886
_0225F86E:
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024818
	movs r0, #0x71
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024818
_0225F886:
	cmp r6, #1
	beq _0225F88C
_0225F88A:
	b _0225F9F0
_0225F88C:
	ldr r0, _0225FA18 @ =0x04000050
	movs r6, #0
	strh r6, [r0]
	adds r5, r4, #0
_0225F894:
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024B78
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #2
	blt _0225F894
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F8B0:
	movs r1, #8
	str r1, [sp]
	ldr r3, _0225FA24 @ =0x0000019A
	adds r0, r4, #0
	lsls r1, r1, #9
	movs r2, #0x29
	bl FUN_021EFEC8
	ldr r1, [r4]
	add r0, sp, #0x34
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_021F074C
	add r3, sp, #0x34
	add r2, sp, #0x4c
	ldm r3!, {r0, r1}
	str r2, [sp, #0x20]
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r6, #0
	str r0, [r2]
	adds r5, r4, #0
_0225F8DE:
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x20]
	bl FUN_020247F4
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #2
	blt _0225F8DE
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02023614
	adds r1, r0, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #0x73
	movs r2, #0x7d
	lsls r0, r0, #2
	lsls r2, r2, #0xe
	ldr r3, _0225FA28 @ =0xFFFF6000
	adds r0, r4, r0
	subs r2, r1, r2
	bl FUN_021EFEC8
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	movs r2, #0
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #0x18
	adds r3, r2, #0
	bl FUN_0200FA24
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F934:
	adds r0, r4, #0
	bl FUN_021EFF28
	ldr r1, [r4]
	str r0, [sp, #0x18]
	add r0, sp, #0x28
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_021F074C
	add r3, sp, #0x28
	add r2, sp, #0x40
	ldm r3!, {r0, r1}
	str r2, [sp, #0x24]
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r6, #0
	str r0, [r2]
	adds r5, r4, #0
_0225F95A:
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x24]
	bl FUN_020247F4
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #2
	blt _0225F95A
	movs r0, #0x73
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_021EFF28
	movs r1, #0x73
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	subs r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_020235D4
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0225F9F0
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0225F9F0
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F99C:
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	ldr r1, [r7, #0x14]
	cmp r1, #0
	beq _0225F9AE
	movs r0, #1
	str r0, [r1]
_0225F9AE:
	adds r0, r4, #0
	adds r0, #0x40
	bl FUN_021F12D0
	movs r6, #0
	str r6, [r4, #0x4c]
	adds r5, r4, #0
_0225F9BC:
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_02024758
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #2
	blt _0225F9BC
	movs r1, #0x63
	adds r0, r4, #0
	lsls r1, r1, #2
	adds r0, #0x50
	adds r1, r4, r1
	bl FUN_021F06EC
	adds r4, #0x50
	adds r0, r4, #0
	bl FUN_021F05F4
	ldr r1, [sp, #0x14]
	adds r0, r7, #0
	bl FUN_021EFCDC
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
_0225F9F0:
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	bne _0225FA00
	adds r0, r4, #0
	adds r0, #0x40
	movs r1, #2
	bl FUN_021F1310
_0225FA00:
	ldr r0, [r7]
	cmp r0, #7
	beq _0225FA0C
	ldr r0, [r4, #0x50]
	bl FUN_0202457C
_0225FA0C:
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225FA10: .4byte 0x000927C0
_0225FA14: .4byte 0x04000010
_0225FA18: .4byte 0x04000050
_0225FA1C: .4byte 0x0000FFFF
_0225FA20: .4byte 0x04000052
_0225FA24: .4byte 0x0000019A
_0225FA28: .4byte 0xFFFF6000
	thumb_func_end ov119_0225F670

	thumb_func_start ov119_0225FA2C
ov119_0225FA2C: @ 0x0225FA2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp, #0x18]
	adds r0, r1, #0
	ldr r0, [r0]
	str r1, [sp, #0x1c]
	ldr r4, [r1, #0xc]
	cmp r0, #7
	bls _0225FA40
	b _0225FED2
_0225FA40:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225FA4C: @ jump table
	.2byte _0225FA5C - _0225FA4C - 2 @ case 0
	.2byte _0225FB74 - _0225FA4C - 2 @ case 1
	.2byte _0225FB94 - _0225FA4C - 2 @ case 2
	.2byte _0225FBEE - _0225FA4C - 2 @ case 3
	.2byte _0225FCAE - _0225FA4C - 2 @ case 4
	.2byte _0225FD4C - _0225FA4C - 2 @ case 5
	.2byte _0225FDFC - _0225FA4C - 2 @ case 6
	.2byte _0225FE3A - _0225FA4C - 2 @ case 7
_0225FA5C:
	movs r1, #9
	movs r0, #4
	lsls r1, r1, #6
	bl FUN_0201AA8C
	ldr r1, [sp, #0x1c]
	movs r2, #9
	str r0, [r1, #0xc]
	movs r1, #0
	lsls r2, r2, #6
	blx FUN_020E5B44
	ldr r0, [sp, #0x1c]
	ldr r4, [r0, #0xc]
	ldr r0, [r0, #0x10]
	ldr r1, [r0, #0x24]
	movs r0, #0x22
	lsls r0, r0, #4
	str r1, [r4, r0]
	subs r0, #0x10
	adds r0, r4, r0
	movs r1, #4
	bl FUN_021F12B4
	movs r0, #0x8f
	movs r1, #0xe
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #3
	movs r2, #1
	bl FUN_021F05C4
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	ldr r0, _0225FDE8 @ =0x000927C0
	movs r2, #0x4f
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	lsls r2, r2, #2
	ldr r0, [r0, #0x20]
	adds r1, r4, #0
	adds r2, r4, r2
	movs r3, #0
	bl FUN_021F0614
	movs r7, #0x4f
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #2
_0225FACC:
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
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_0202487C
	movs r0, #4
	bl FUN_021F0768
	movs r1, #0x7d
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #3
	blt _0225FACC
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_0201D39C
	movs r1, #0x83
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r3, #0
	str r3, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	ldr r1, [r4, r1]
	ldr r0, [r0, #0x10]
	movs r2, #3
	ldr r0, [r0, #8]
	bl FUN_0201D40C
	movs r1, #0
	add r0, sp, #0x28
	strh r1, [r0]
	movs r0, #3
	add r1, sp, #0x28
	movs r2, #2
	movs r3, #0x1e
	bl FUN_0201C260
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201D5C8
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	b _0225FED2
_0225FB74:
	movs r1, #0x10
	ldr r3, [sp, #0x1c]
	movs r0, #2
	adds r2, r1, #0
	str r0, [sp]
	movs r0, #1
	subs r2, #0x20
	adds r3, r3, #4
	bl FUN_021EFCF8
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	b _0225FED2
_0225FB94:
	movs r3, #0x8f
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	subs r0, r0, #1
	str r0, [r4, r3]
	ldr r0, [r4, r3]
	cmp r0, #0
	bne _0225FBD2
	movs r0, #3
	lsls r0, r0, #0xe
	str r0, [sp]
	adds r0, r3, #0
	adds r0, #0xe4
	str r0, [sp, #4]
	ldr r0, _0225FDEC @ =0x04000010
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #4
	str r0, [sp, #0x10]
	adds r0, r3, #0
	subs r0, #0x2c
	adds r0, r4, r0
	movs r2, #0xbf
	adds r3, #0x6e
	bl FUN_021F12E8
	movs r0, #0x87
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
_0225FBD2:
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0225FBFE
	movs r0, #0x8f
	movs r1, #6
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	b _0225FED2
_0225FBEE:
	movs r0, #0x8f
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0
	blt _0225FC00
_0225FBFE:
	b _0225FED2
_0225FC00:
	subs r0, #0x1c
	ldr r0, [r4, r0]
	bl FUN_02023614
	adds r1, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0x89
	movs r2, #0x7d
	lsls r0, r0, #2
	lsls r2, r2, #0xe
	ldr r3, _0225FDF0 @ =0xFFFF6000
	adds r0, r4, r0
	subs r2, r1, r2
	bl FUN_021EFEC8
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r2, _0225FDF4 @ =0x0000FFFF
	adds r0, r4, r0
	movs r1, #0
	movs r3, #6
	bl FUN_021EFE34
	movs r0, #0x5f
	lsls r0, r0, #2
	movs r2, #0x1f
	adds r0, r4, r0
	movs r1, #0xe7
	mvns r2, r2
	movs r3, #6
	bl FUN_021EFE34
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	movs r3, #0x40
	str r1, [sp, #8]
	movs r1, #0x56
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	movs r1, #0xf
	str r1, [sp, #0x14]
	subs r0, #0x18
	movs r1, #0x2b
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, #0xf8
	bl FUN_021F0788
	movs r1, #0x2b
	movs r2, #0xe7
	add r0, sp, #0x38
	lsls r1, r1, #0xc
	lsls r2, r2, #0xc
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r1, #1
	lsls r0, r1, #9
	str r1, [r4, r0]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	movs r0, #0x8f
	movs r1, #4
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0225FED2
_0225FCAE:
	movs r0, #0x8f
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0
	bge _0225FD5C
	subs r0, #0xac
	movs r2, #0x1f
	adds r0, r4, r0
	movs r1, #0xe7
	mvns r2, r2
	movs r3, #6
	bl FUN_021EFE34
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r2, _0225FDF8 @ =0xFFFF0001
	adds r0, r4, r0
	movs r1, #0
	movs r3, #6
	bl FUN_021EFE34
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, #0x14
	str r1, [sp, #8]
	movs r1, #0x56
	str r1, [sp, #0xc]
	movs r1, #0x40
	str r1, [sp, #0x10]
	movs r1, #0xf
	str r1, [sp, #0x14]
	movs r1, #0xd7
	adds r3, r1, #0
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, #0x61
	bl FUN_021F0788
	movs r1, #0xd7
	movs r2, #0xe7
	add r0, sp, #0x38
	lsls r1, r1, #0xc
	lsls r2, r2, #0xc
	movs r3, #1
	bl FUN_021F074C
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r1, #0x81
	movs r0, #1
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [sp, #0x1c]
	adds r1, #0x38
	ldr r0, [r0]
	adds r2, r0, #1
	ldr r0, [sp, #0x1c]
	str r2, [r0]
	movs r0, #2
	str r0, [r4, r1]
	b _0225FED2
_0225FD4C:
	movs r0, #0x8f
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0
	blt _0225FD5E
_0225FD5C:
	b _0225FED2
_0225FD5E:
	subs r0, #0x98
	movs r2, #0x1f
	adds r0, r4, r0
	movs r1, #0xe7
	mvns r2, r2
	movs r3, #6
	bl FUN_021EFE34
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r2, _0225FDF4 @ =0x0000FFFF
	adds r0, r4, r0
	movs r1, #0
	movs r3, #6
	bl FUN_021EFE34
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, #0x10
	str r1, [sp, #8]
	movs r1, #0x56
	str r1, [sp, #0xc]
	movs r1, #0x40
	str r1, [sp, #0x10]
	movs r1, #0xf
	str r1, [sp, #0x14]
	movs r1, #0x81
	adds r3, r1, #0
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, #0xb7
	bl FUN_021F0788
	movs r1, #0x81
	movs r2, #0xe7
	add r0, sp, #0x38
	lsls r1, r1, #0xc
	lsls r2, r2, #0xc
	movs r3, #2
	bl FUN_021F074C
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x82
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	b _0225FED2
	nop
_0225FDE8: .4byte 0x000927C0
_0225FDEC: .4byte 0x04000010
_0225FDF0: .4byte 0xFFFF6000
_0225FDF4: .4byte 0x0000FFFF
_0225FDF8: .4byte 0xFFFF0001
_0225FDFC:
	movs r0, #0x89
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_021EFF28
	movs r1, #0x89
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	subs r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_020235D4
	movs r1, #2
	lsls r1, r1, #8
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _0225FED2
	adds r0, r1, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225FED2
	adds r1, #8
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _0225FED2
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	b _0225FED2
_0225FE3A:
	movs r0, #0
	bl FUN_0200FC20
	ldr r0, [sp, #0x1c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0225FE4C
	movs r0, #1
	str r0, [r1]
_0225FE4C:
	movs r0, #0x21
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_021F12D0
	movs r0, #0x87
	lsls r0, r0, #2
	movs r6, #0
	adds r7, r0, #0
	str r6, [r4, r0]
	adds r5, r4, #0
	subs r7, #0x28
_0225FE64:
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02024758
	ldr r0, [r5, r7]
	bl FUN_021F0780
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #3
	blt _0225FE64
	movs r1, #0x4f
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r1, r4, r1
	bl FUN_021F06EC
	adds r0, r4, #0
	bl FUN_021F05F4
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201D8C8
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201D520
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0201D54C
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	movs r3, #4
	bl FUN_0201C1C4
	ldr r0, [sp, #0x1c]
	movs r1, #3
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #8]
	bl FUN_0201CAE0
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	bl FUN_021EFCDC
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0225FED2:
	movs r0, #0x87
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _0225FEE6
	subs r0, #0xc
	adds r0, r4, r0
	movs r1, #2
	bl FUN_021F1310
_0225FEE6:
	movs r1, #0x5f
	movs r0, #0
	lsls r1, r1, #2
	str r0, [sp, #0x20]
	adds r0, r4, r1
	adds r1, #0x3c
	adds r5, r4, #0
	str r0, [sp, #0x24]
	adds r7, r4, r1
	adds r6, r4, #0
_0225FEFA:
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0225FF68
	movs r0, #0x7d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_021F07E0
	cmp r0, #0
	beq _0225FF1A
	movs r0, #2
	movs r1, #0
	lsls r0, r0, #8
	str r1, [r5, r0]
_0225FF1A:
	ldr r0, [sp, #0x24]
	bl FUN_021EFE44
	adds r0, r7, #0
	bl FUN_021EFE44
	movs r1, #0x6e
	lsls r1, r1, #2
	movs r0, #0x17
	ldr r1, [r6, r1]
	lsls r0, r0, #4
	lsls r1, r1, #0x10
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x10
	bl FUN_02024818
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_020248AC
	adds r3, r0, #0
	add r2, sp, #0x2c
	ldm r3!, {r0, r1}
	mov ip, r2
	stm r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, ip
	str r0, [r2]
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	lsls r0, r0, #0xc
	str r0, [sp, #0x30]
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_020247D4
_0225FF68:
	ldr r0, [sp, #0x24]
	adds r5, r5, #4
	adds r0, #0x14
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	adds r7, #0x14
	adds r0, r0, #1
	adds r6, #0x14
	str r0, [sp, #0x20]
	cmp r0, #3
	blt _0225FEFA
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201D5C8
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	cmp r0, #7
	beq _0225FF96
	ldr r0, [r4]
	bl FUN_0202457C
_0225FF96:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov119_0225FA2C

	thumb_func_start ov119_0225FF9C
ov119_0225FF9C: @ 0x0225FF9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r4, [r5, #0xc]
	cmp r0, #7
	bhi _02260074
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225FFB8: @ jump table
	.2byte _0225FFC8 - _0225FFB8 - 2 @ case 0
	.2byte _02260054 - _0225FFB8 - 2 @ case 1
	.2byte _0226006E - _0225FFB8 - 2 @ case 2
	.2byte _0226007C - _0225FFB8 - 2 @ case 3
	.2byte _022600F2 - _0225FFB8 - 2 @ case 4
	.2byte _0226017E - _0225FFB8 - 2 @ case 5
	.2byte _022601CC - _0225FFB8 - 2 @ case 6
	.2byte _022601F4 - _0225FFB8 - 2 @ case 7
_0225FFC8:
	movs r1, #0x1f
	movs r0, #4
	lsls r1, r1, #4
	bl FUN_0201AA8C
	movs r2, #0x1f
	str r0, [r5, #0xc]
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020E5B44
	ldr r0, [r5, #0x10]
	ldr r4, [r5, #0xc]
	ldr r1, [r0, #0x24]
	movs r0, #0x1d
	lsls r0, r0, #4
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x5c
	adds r2, r1, #0
	bl FUN_021F05C4
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	ldr r0, _02260248 @ =0x000927C0
	movs r2, #0x66
	str r0, [sp, #0x10]
	adds r1, r4, #0
	lsls r2, r2, #2
	ldr r0, [r5, #0x20]
	adds r1, #0x5c
	adds r2, r4, r2
	movs r3, #0
	bl FUN_021F0614
	movs r0, #0
	str r0, [sp]
	movs r1, #0x66
	str r0, [sp, #4]
	adds r0, r4, #0
	lsls r1, r1, #2
	movs r2, #2
	ldr r3, _0226024C @ =0xFFFE0000
	adds r0, #0x5c
	adds r1, r4, r1
	lsls r2, r2, #0x12
	bl FUN_021F0718
	movs r1, #0x73
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02260238
_02260054:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	adds r1, r0, #0
	subs r1, #0x11
	adds r2, r1, #0
	adds r3, r5, #4
	bl FUN_021EFCF8
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02260238
_0226006E:
	ldr r1, [r5, #4]
	cmp r1, #0
	bne _02260076
_02260074:
	b _02260238
_02260076:
	adds r0, r0, #1
	str r0, [r5]
	b _02260238
_0226007C:
	movs r2, #1
	movs r0, #0xc
	lsls r2, r2, #0x14
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0
	lsrs r3, r2, #7
	bl FUN_021EFEC8
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xc
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #2
	ldr r1, _02260250 @ =0x0000019A
	adds r0, #0x18
	lsls r2, r2, #0xc
	movs r3, #0
	bl FUN_021EFEC8
	movs r0, #0xc
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #2
	ldr r1, _02260250 @ =0x0000019A
	adds r0, #0x30
	lsls r2, r2, #0xc
	movs r3, #0
	bl FUN_021EFEC8
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x30]
	add r0, sp, #0x2c
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x2c
	movs r2, #2
	bl FUN_02024804
	adds r0, r4, #0
	ldr r2, _02260254 @ =0x0000FFFF
	adds r0, #0x48
	movs r1, #0
	movs r3, #0xc
	bl FUN_021EFE34
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02260238
_022600F2:
	adds r0, r4, #0
	bl FUN_021EFF28
	movs r1, #2
	lsls r1, r1, #0x12
	adds r6, r0, #0
	ldr r3, [r4]
	lsrs r2, r1, #2
	subs r2, r3, r2
	add r0, sp, #0x14
	movs r3, #0
	bl FUN_021F074C
	add r3, sp, #0x14
	add r2, sp, #0x20
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r1, r7, #0
	str r0, [r2]
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020247D4
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_021EFF28
	adds r0, r4, #0
	adds r0, #0x30
	bl FUN_021EFF28
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x30]
	add r0, sp, #0x2c
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x2c
	bl FUN_020247F4
	adds r0, r4, #0
	adds r0, #0x48
	bl FUN_021EFE44
	movs r0, #0x73
	ldr r1, [r4, #0x48]
	lsls r0, r0, #2
	lsls r1, r1, #0x10
	ldr r0, [r4, r0]
	lsrs r1, r1, #0x10
	bl FUN_02024818
	cmp r6, #1
	bne _02260238
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02260238
_0226017E:
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl FUN_021FB514
	movs r0, #0x1d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02023614
	adds r1, r0, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #0x75
	movs r2, #0xfa
	lsls r0, r0, #2
	lsls r2, r2, #0xe
	movs r3, #0xa
	adds r0, r4, r0
	subs r2, r1, r2
	lsls r3, r3, #0xc
	bl FUN_021EFEC8
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	movs r2, #0
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #0x12
	adds r3, r2, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02260238
_022601CC:
	movs r0, #0x75
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_021EFF28
	movs r1, #0x75
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	subs r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_020235D4
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02260238
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02260238
_022601F4:
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl FUN_021FB4F4
	ldr r1, [r5, #0x14]
	cmp r1, #0
	beq _02260210
	movs r0, #1
	str r0, [r1]
_02260210:
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024758
	movs r1, #0x66
	adds r0, r4, #0
	lsls r1, r1, #2
	adds r0, #0x5c
	adds r1, r4, r1
	bl FUN_021F06EC
	adds r0, r4, #0
	adds r0, #0x5c
	bl FUN_021F05F4
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_021EFCDC
_02260238:
	ldr r0, [r5]
	cmp r0, #7
	beq _02260244
	ldr r0, [r4, #0x5c]
	bl FUN_0202457C
_02260244:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02260248: .4byte 0x000927C0
_0226024C: .4byte 0xFFFE0000
_02260250: .4byte 0x0000019A
_02260254: .4byte 0x0000FFFF
	thumb_func_end ov119_0225FF9C

	thumb_func_start ov119_02260258
ov119_02260258: @ 0x02260258
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp, #0x14]
	adds r0, r1, #0
	ldr r0, [r0]
	str r1, [sp, #0x18]
	ldr r4, [r1, #0xc]
	cmp r0, #9
	bls _0226026C
	b _02260688
_0226026C:
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02260278: @ jump table
	.2byte _0226028C - _02260278 - 2 @ case 0
	.2byte _02260388 - _02260278 - 2 @ case 1
	.2byte _022603A8 - _02260278 - 2 @ case 2
	.2byte _022603C0 - _02260278 - 2 @ case 3
	.2byte _0226043C - _02260278 - 2 @ case 4
	.2byte _022604B8 - _02260278 - 2 @ case 5
	.2byte _0226052E - _02260278 - 2 @ case 6
	.2byte _0226056E - _02260278 - 2 @ case 7
	.2byte _022605B4 - _02260278 - 2 @ case 8
	.2byte _02260604 - _02260278 - 2 @ case 9
_0226028C:
	movs r1, #0x8a
	movs r0, #4
	lsls r1, r1, #2
	bl FUN_0201AA8C
	ldr r1, [sp, #0x18]
	movs r2, #0x8a
	str r0, [r1, #0xc]
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	ldr r0, [sp, #0x18]
	movs r2, #1
	ldr r4, [r0, #0xc]
	ldr r0, [r0, #0x10]
	ldr r1, [r0, #0x24]
	movs r0, #0x82
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #3
	bl FUN_021F05C4
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	ldr r0, _022605F4 @ =0x000927C0
	movs r2, #0x4f
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	lsls r2, r2, #2
	ldr r0, [r0, #0x20]
	adds r1, r4, #0
	adds r2, r4, r2
	movs r3, #0
	bl FUN_021F0614
	movs r7, #0x4f
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #2
_022602EA:
	movs r0, #0
	movs r2, #0
	str r0, [sp]
	adds r3, r2, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r4, r7
	subs r3, #0x20
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
	cmp r6, #3
	blt _022602EA
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_0201D39C
	movs r1, #2
	lsls r1, r1, #8
	str r0, [r4, r1]
	movs r3, #0
	str r3, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [sp, #0x18]
	ldr r1, [r4, r1]
	ldr r0, [r0, #0x10]
	movs r2, #3
	ldr r0, [r0, #8]
	bl FUN_0201D40C
	movs r1, #0
	add r0, sp, #0x28
	strh r1, [r0]
	movs r0, #3
	add r1, sp, #0x28
	movs r2, #2
	movs r3, #0x1e
	bl FUN_0201C260
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0201D978
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	bl FUN_0201D5C8
	movs r0, #4
	bl FUN_021F09BC
	movs r1, #0x81
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _02260688
_02260388:
	movs r1, #0x10
	ldr r3, [sp, #0x18]
	movs r0, #2
	adds r2, r1, #0
	str r0, [sp]
	movs r0, #1
	subs r2, #0x20
	adds r3, r3, #4
	bl FUN_021EFCF8
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _02260688
_022603A8:
	ldr r1, [sp, #0x18]
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _022603D0
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	movs r0, #0x89
	movs r1, #0
	lsls r0, r0, #2
	strh r1, [r4, r0]
	b _02260688
_022603C0:
	movs r0, #0x89
	lsls r0, r0, #2
	ldrsh r1, [r4, r0]
	subs r1, r1, #1
	strh r1, [r4, r0]
	ldrsh r1, [r4, r0]
	cmp r1, #0
	ble _022603D2
_022603D0:
	b _02260688
_022603D2:
	subs r0, #0xa8
	movs r1, #0x1f
	adds r0, r4, r0
	mvns r1, r1
	movs r2, #0xe0
	movs r3, #5
	bl FUN_021EFE34
	movs r1, #2
	ldr r2, _022605F8 @ =0xFFFE0000
	add r0, sp, #0x38
	lsls r1, r1, #0x12
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r2, _022605FC @ =0x0000FFFF
	adds r0, r4, r0
	movs r1, #0
	movs r3, #5
	bl FUN_021EFE34
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_0202487C
	movs r1, #0x7d
	movs r3, #1
	lsls r1, r1, #2
	str r3, [r4, r1]
	ldr r0, [sp, #0x18]
	adds r1, #0x30
	ldr r0, [r0]
	adds r2, r0, #1
	ldr r0, [sp, #0x18]
	str r2, [r0]
	strh r3, [r4, r1]
	b _02260688
_0226043C:
	movs r0, #0x89
	lsls r0, r0, #2
	ldrsh r1, [r4, r0]
	subs r1, r1, #1
	strh r1, [r4, r0]
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bgt _02260548
	subs r0, #0x94
	movs r1, #0x1f
	adds r0, r4, r0
	mvns r1, r1
	movs r2, #0xe0
	movs r3, #5
	bl FUN_021EFE34
	movs r1, #0xd
	ldr r2, _022605F8 @ =0xFFFE0000
	add r0, sp, #0x38
	lsls r1, r1, #0x10
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r2, _02260600 @ =0xFFFF0001
	adds r0, r4, r0
	movs r1, #0
	movs r3, #5
	bl FUN_021EFE34
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_0202487C
	movs r1, #0x7e
	movs r0, #1
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [sp, #0x18]
	adds r1, #0x2c
	ldr r0, [r0]
	adds r2, r0, #1
	ldr r0, [sp, #0x18]
	str r2, [r0]
	movs r0, #3
	strh r0, [r4, r1]
	b _02260688
_022604B8:
	movs r0, #0x89
	lsls r0, r0, #2
	ldrsh r1, [r4, r0]
	subs r1, r1, #1
	strh r1, [r4, r0]
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bgt _02260548
	subs r0, #0x80
	movs r1, #0x1f
	adds r0, r4, r0
	mvns r1, r1
	movs r2, #0xe0
	movs r3, #5
	bl FUN_021EFE34
	movs r1, #3
	ldr r2, _022605F8 @ =0xFFFE0000
	add r0, sp, #0x38
	lsls r1, r1, #0x10
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl FUN_020247D4
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r2, _022605FC @ =0x0000FFFF
	adds r0, r4, r0
	movs r1, #0
	movs r3, #5
	bl FUN_021EFE34
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_0202487C
	movs r0, #0x7f
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _02260688
_0226052E:
	movs r1, #0x7d
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _02260548
	adds r0, r1, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02260548
	adds r1, #8
	ldr r0, [r4, r1]
	cmp r0, #0
	beq _0226054A
_02260548:
	b _02260688
_0226054A:
	movs r7, #0x17
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #4
_02260552:
	ldr r0, [r5, r7]
	movs r1, #0
	bl FUN_02024830
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #3
	blt _02260552
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _02260688
_0226056E:
	movs r0, #0xf
	movs r1, #1
	str r0, [sp]
	movs r0, #0x81
	lsls r0, r0, #2
	lsls r3, r1, #9
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	adds r2, r1, #0
	bl FUN_021F0A0C
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02023614
	adds r1, r0, #0
	movs r0, #0x40
	str r0, [sp]
	movs r0, #0x83
	movs r2, #0xfa
	lsls r0, r0, #2
	lsls r2, r2, #0xe
	movs r3, #0xa
	adds r0, r4, r0
	subs r2, r1, r2
	lsls r3, r3, #0xc
	bl FUN_021EFEC8
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _02260688
_022605B4:
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_021F0A4C
	adds r5, r0, #0
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	bl FUN_0201D5C8
	movs r0, #0x83
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_021EFF28
	movs r1, #0x83
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	subs r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_020235D4
	cmp r5, #1
	bne _02260688
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _02260688
	nop
_022605F4: .4byte 0x000927C0
_022605F8: .4byte 0xFFFE0000
_022605FC: .4byte 0x0000FFFF
_02260600: .4byte 0xFFFF0001
_02260604:
	movs r0, #0
	bl FUN_0200FC20
	ldr r0, [sp, #0x18]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _02260616
	movs r0, #1
	str r0, [r1]
_02260616:
	movs r7, #0x17
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #4
_0226061E:
	ldr r0, [r5, r7]
	bl FUN_02024758
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #3
	blt _0226061E
	movs r1, #0x4f
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r1, r4, r1
	bl FUN_021F06EC
	adds r0, r4, #0
	bl FUN_021F05F4
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_021F09EC
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	bl FUN_0201D8C8
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	bl FUN_0201D520
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0201D54C
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	movs r3, #4
	bl FUN_0201C1C4
	ldr r0, [sp, #0x18]
	movs r1, #3
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #8]
	bl FUN_0201CAE0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	bl FUN_021EFCDC
_02260688:
	movs r1, #0x5f
	movs r0, #0
	lsls r1, r1, #2
	str r0, [sp, #0x1c]
	adds r0, r4, r1
	adds r1, #0x3c
	adds r5, r4, #0
	str r0, [sp, #0x20]
	adds r7, r4, r1
	adds r6, r4, #0
_0226069C:
	movs r0, #0x7d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _02260704
	ldr r0, [sp, #0x20]
	bl FUN_021EFE44
	str r0, [sp, #0x24]
	adds r0, r7, #0
	bl FUN_021EFE44
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _022606C2
	movs r0, #0x7d
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_022606C2:
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_020248AC
	adds r3, r0, #0
	add r2, sp, #0x2c
	ldm r3!, {r0, r1}
	mov ip, r2
	stm r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, ip
	str r0, [r2]
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	lsls r0, r0, #0xc
	str r0, [sp, #0x30]
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_020247D4
	movs r1, #0x6e
	lsls r1, r1, #2
	movs r0, #0x17
	ldr r1, [r6, r1]
	lsls r0, r0, #4
	lsls r1, r1, #0x10
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x10
	bl FUN_02024818
_02260704:
	ldr r0, [sp, #0x20]
	adds r5, r5, #4
	adds r0, #0x14
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	adds r7, #0x14
	adds r0, r0, #1
	adds r6, #0x14
	str r0, [sp, #0x1c]
	cmp r0, #3
	blt _0226069C
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	cmp r0, #9
	beq _02260728
	ldr r0, [r4]
	bl FUN_0202457C
_02260728:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov119_02260258
