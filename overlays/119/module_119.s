
	thumb_func_start MOD119_0225F020
MOD119_0225F020: @ 0x0225F020
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
	thumb_func_end MOD119_0225F020
