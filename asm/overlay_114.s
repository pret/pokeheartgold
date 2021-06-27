
	thumb_func_start ov114_0225F020
ov114_0225F020: @ 0x0225F020
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r4, r1, #0
	adds r6, r0, #0
	ldr r0, [r4]
	ldr r5, [r4, #0xc]
	cmp r0, #7
	bls _0225F032
	b _0225F260
_0225F032:
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225F03E: @ jump table
	.2byte _0225F04E - _0225F03E - 2 @ case 0
	.2byte _0225F0DE - _0225F03E - 2 @ case 1
	.2byte _0225F0F8 - _0225F03E - 2 @ case 2
	.2byte _0225F104 - _0225F03E - 2 @ case 3
	.2byte _0225F136 - _0225F03E - 2 @ case 4
	.2byte _0225F168 - _0225F03E - 2 @ case 5
	.2byte _0225F1D8 - _0225F03E - 2 @ case 6
	.2byte _0225F21C - _0225F03E - 2 @ case 7
_0225F04E:
	movs r1, #0x69
	movs r0, #4
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0x69
	str r0, [r4, #0xc]
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	ldr r5, [r4, #0xc]
	movs r1, #1
	adds r0, r5, #0
	adds r0, #0x2c
	adds r2, r1, #0
	bl FUN_021F05C4
	movs r0, #1
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #9
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r0, _0225F270 @ =0x000927C0
	movs r2, #0x5a
	str r0, [sp, #0x10]
	adds r1, r5, #0
	lsls r2, r2, #2
	ldr r0, [r4, #0x20]
	adds r1, #0x2c
	adds r2, r5, r2
	movs r3, #0
	bl FUN_021F0614
	movs r0, #0
	str r0, [sp]
	movs r1, #0x5a
	str r0, [sp, #4]
	adds r0, r5, #0
	lsls r1, r1, #2
	movs r2, #2
	movs r3, #6
	adds r0, #0x2c
	adds r1, r5, r1
	lsls r2, r2, #0x12
	lsls r3, r3, #0x10
	bl FUN_021F0718
	movs r1, #0x67
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024B78
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F0DE:
	movs r1, #0x10
	movs r0, #2
	adds r2, r1, #0
	str r0, [sp]
	movs r0, #1
	subs r2, #0x20
	adds r3, r4, #4
	bl FUN_021EFCF8
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F0F8:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _0225F14E
	adds r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F104:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0xc
	bl FUN_021EFE34
	ldr r3, [r5]
	movs r0, #0x10
	subs r0, r0, r3
	str r0, [sp]
	ldr r0, _0225F274 @ =0x04000050
	movs r1, #0
	movs r2, #0xf
	blx FUN_020CF15C
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F136:
	adds r0, r5, #0
	bl FUN_021EFE44
	ldr r2, [r5]
	movs r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #8
	orrs r1, r2
	ldr r2, _0225F278 @ =0x04000052
	cmp r0, #1
	strh r1, [r2]
	beq _0225F150
_0225F14E:
	b _0225F260
_0225F150:
	movs r1, #0
	subs r0, r2, #2
	strh r1, [r0]
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02024B78
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F168:
	movs r0, #6
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #1
	ldr r2, _0225F27C @ =0x0000019A
	adds r0, #0x14
	lsls r1, r1, #0xc
	movs r3, #1
	bl FUN_021EFEC8
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_0202487C
	ldr r1, [r5, #0x14]
	add r0, sp, #0x20
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_021F074C
	add r6, sp, #0x20
	add r3, sp, #0x38
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r6]
	adds r1, r2, #0
	str r0, [r3]
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020247F4
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl FUN_021FB514
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	movs r2, #0
	str r0, [sp, #8]
	movs r0, #3
	movs r1, #0x10
	adds r3, r2, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F1D8:
	adds r0, r5, #0
	adds r0, #0x14
	bl FUN_021EFF28
	ldr r1, [r5, #0x14]
	adds r6, r0, #0
	add r0, sp, #0x14
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_021F074C
	add r3, sp, #0x14
	add r2, sp, #0x2c
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r1, r7, #0
	str r0, [r2]
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020247F4
	cmp r6, #1
	bne _0225F260
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0225F260
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F21C:
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl FUN_021FB4F4
	ldr r1, [r4, #0x14]
	cmp r1, #0
	beq _0225F238
	movs r0, #1
	str r0, [r1]
_0225F238:
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02024758
	movs r1, #0x5a
	adds r0, r5, #0
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r1, r5, r1
	bl FUN_021F06EC
	adds r0, r5, #0
	adds r0, #0x2c
	bl FUN_021F05F4
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_021EFCDC
_0225F260:
	ldr r0, [r4]
	cmp r0, #7
	beq _0225F26C
	ldr r0, [r5, #0x2c]
	bl FUN_0202457C
_0225F26C:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225F270: .4byte 0x000927C0
_0225F274: .4byte 0x04000050
_0225F278: .4byte 0x04000052
_0225F27C: .4byte 0x0000019A
	thumb_func_end ov114_0225F020

	thumb_func_start ov114_0225F280
ov114_0225F280: @ 0x0225F280
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r1, #0
	str r0, [sp, #0x14]
	ldr r0, [r6]
	ldr r4, [r6, #0xc]
	cmp r0, #7
	bhi _0225F358
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225F29C: @ jump table
	.2byte _0225F2AC - _0225F29C - 2 @ case 0
	.2byte _0225F338 - _0225F29C - 2 @ case 1
	.2byte _0225F352 - _0225F29C - 2 @ case 2
	.2byte _0225F360 - _0225F29C - 2 @ case 3
	.2byte _0225F3AA - _0225F29C - 2 @ case 4
	.2byte _0225F45C - _0225F29C - 2 @ case 5
	.2byte _0225F486 - _0225F29C - 2 @ case 6
	.2byte _0225F496 - _0225F29C - 2 @ case 7
_0225F2AC:
	movs r1, #0x1b
	movs r0, #4
	lsls r1, r1, #4
	bl FUN_0201AA8C
	movs r2, #0x1b
	str r0, [r6, #0xc]
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020E5B44
	ldr r4, [r6, #0xc]
	movs r1, #4
	adds r0, r4, #0
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
	ldr r0, _0225F4F4 @ =0x000927C0
	movs r2, #0x4f
	str r0, [sp, #0x10]
	lsls r2, r2, #2
	ldr r0, [r6, #0x20]
	adds r1, r4, #0
	adds r2, r4, r2
	movs r3, #0
	bl FUN_021F0614
	movs r7, #0
	adds r5, r4, #0
_0225F2F6:
	movs r0, #0
	movs r1, #0x4f
	str r0, [sp]
	lsls r1, r1, #2
	movs r2, #2
	movs r3, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r4, r1
	lsls r2, r2, #0x12
	lsls r3, r3, #0x10
	bl FUN_021F0718
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	adds r7, r7, #1
	adds r5, r5, #4
	cmp r7, #4
	blt _0225F2F6
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0225F4E2
_0225F338:
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
	b _0225F4E2
_0225F352:
	ldr r1, [r6, #4]
	cmp r1, #0
	bne _0225F35A
_0225F358:
	b _0225F4E2
_0225F35A:
	adds r0, r0, #1
	str r0, [r6]
	b _0225F4E2
_0225F360:
	movs r3, #6
	movs r2, #4
	lsls r3, r3, #6
	str r2, [sp]
	adds r0, r4, r3
	movs r1, #0
	lsls r2, r2, #0x11
	adds r3, #0x1a
	bl FUN_021EFEC8
	movs r3, #0x66
	movs r0, #4
	movs r2, #0xa
	lsls r3, r3, #2
	str r0, [sp]
	adds r0, r4, r3
	movs r1, #0
	lsls r2, r2, #0x10
	adds r3, r3, #2
	bl FUN_021EFEC8
	movs r7, #0
	adds r5, r4, #0
_0225F38E:
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	adds r7, r7, #1
	adds r5, r5, #4
	cmp r7, #4
	blt _0225F38E
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0225F4E2
_0225F3AA:
	movs r0, #6
	lsls r0, r0, #6
	movs r7, #0
	adds r5, r4, r0
_0225F3B2:
	adds r0, r5, #0
	bl FUN_021EFF28
	adds r7, r7, #1
	adds r5, #0x18
	str r0, [sp, #0x18]
	cmp r7, #2
	blt _0225F3B2
	movs r2, #6
	lsls r2, r2, #6
	ldr r3, [r4, r2]
	movs r1, #2
	lsls r2, r2, #0xa
	subs r2, r2, r3
	add r0, sp, #0x1c
	lsls r1, r1, #0x12
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x1c
	bl FUN_020247D4
	movs r2, #6
	lsls r2, r2, #6
	ldr r3, [r4, r2]
	movs r1, #2
	lsls r2, r2, #0xa
	adds r2, r3, r2
	add r0, sp, #0x1c
	lsls r1, r1, #0x12
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x1c
	bl FUN_020247D4
	movs r1, #0x66
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	movs r1, #2
	lsls r1, r1, #0x12
	subs r1, r1, r2
	movs r2, #6
	add r0, sp, #0x1c
	lsls r2, r2, #0x10
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x1c
	bl FUN_020247D4
	movs r1, #0x66
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	movs r1, #2
	lsls r1, r1, #0x12
	adds r1, r2, r1
	movs r2, #6
	add r0, sp, #0x1c
	lsls r2, r2, #0x10
	movs r3, #0
	bl FUN_021F074C
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x1c
	bl FUN_020247D4
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0225F4E2
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0225F4E2
_0225F45C:
	ldr r0, [r6, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl FUN_021FB514
	movs r0, #8
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
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0225F4E2
_0225F486:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0225F4E2
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0225F4E2
_0225F496:
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	ldr r0, [r6, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl FUN_021FB4F4
	ldr r1, [r6, #0x14]
	cmp r1, #0
	beq _0225F4B2
	movs r0, #1
	str r0, [r1]
_0225F4B2:
	movs r7, #0
	adds r5, r4, #0
_0225F4B6:
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02024758
	adds r7, r7, #1
	adds r5, r5, #4
	cmp r7, #4
	blt _0225F4B6
	movs r1, #0x4f
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r1, r4, r1
	bl FUN_021F06EC
	adds r0, r4, #0
	bl FUN_021F05F4
	ldr r1, [sp, #0x14]
	adds r0, r6, #0
	bl FUN_021EFCDC
_0225F4E2:
	ldr r0, [r6]
	cmp r0, #7
	beq _0225F4EE
	ldr r0, [r4]
	bl FUN_0202457C
_0225F4EE:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225F4F4: .4byte 0x000927C0
	thumb_func_end ov114_0225F280
