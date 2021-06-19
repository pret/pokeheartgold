
	thumb_func_start MOD114_0225F020
MOD114_0225F020: @ 0x0225F020
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
	thumb_func_end MOD114_0225F020
