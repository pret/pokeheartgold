
	thumb_func_start ov100_021E5900
ov100_021E5900: @ 0x021E5900
	ldr r1, [r0, #0xc]
	str r1, [r0, #0x10]
	ldr r1, _021E591C @ =0x021D110C
	ldr r2, [r1, #0x48]
	ldr r1, _021E5920 @ =0x00000CF3
	tst r1, r2
	beq _021E5916
	movs r1, #0
	str r1, [r0, #0xc]
	movs r0, #1
	bx lr
_021E5916:
	movs r0, #0
	bx lr
	nop
_021E591C: .4byte 0x021D110C
_021E5920: .4byte 0x00000CF3
	thumb_func_end ov100_021E5900

	thumb_func_start ov100_021E5924
ov100_021E5924: @ 0x021E5924
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _021E59C0 @ =0x021E74C4
	bl FUN_02025224
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _021E59BC
	movs r1, #0
	add r0, sp, #4
	strh r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r3, _021E59C4 @ =0x021D114C
	ldr r0, [r5, #0x74]
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	bl FUN_0201F2CC
	cmp r0, #1
	bne _021E595C
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021E595C:
	ldrb r0, [r5, #4]
	cmp r4, r0
	bne _021E596A
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021E596A:
	cmp r4, #1
	bne _021E597A
	ldrb r0, [r5, #5]
	lsls r0, r0, #0x19
	lsrs r1, r0, #0x19
	movs r0, #2
	tst r0, r1
	beq _021E598A
_021E597A:
	cmp r4, #2
	bne _021E5992
	ldrb r0, [r5, #5]
	lsls r0, r0, #0x19
	lsrs r1, r0, #0x19
	movs r0, #1
	tst r0, r1
	bne _021E5992
_021E598A:
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021E5992:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov100_021E5B4C
	cmp r4, #4
	beq _021E59A6
	ldr r0, _021E59C8 @ =0x00000942
	b _021E59AA
_021E59A6:
	movs r0, #0x25
	lsls r0, r0, #6
_021E59AA:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0200604C
	movs r0, #0
	strb r0, [r5, #6]
	movs r0, #1
	str r0, [r5, #0xc]
	adds r0, r4, #0
_021E59BC:
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E59C0: .4byte 0x021E74C4
_021E59C4: .4byte 0x021D114C
_021E59C8: .4byte 0x00000942
	thumb_func_end ov100_021E5924

	thumb_func_start ov100_021E59CC
ov100_021E59CC: @ 0x021E59CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _021E5A7C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _021E59E6
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #4
	pop {r4, r5, r6, pc}
_021E59E6:
	movs r0, #1
	tst r0, r1
	beq _021E5A44
	ldr r0, [r5, #0x7c]
	ldr r1, [r0, #8]
	ldrb r2, [r1, #1]
	ldr r4, [r1, #4]
	movs r1, #0xc
	adds r6, r2, #0
	muls r6, r1, r6
	movs r1, #0
	adds r2, r1, #0
	bl ov100_021E7128
	movs r0, #0
	strb r0, [r5, #6]
	ldrh r0, [r4, r6]
	cmp r0, #4
	beq _021E5A10
	ldr r0, _021E5A80 @ =0x00000942
	b _021E5A14
_021E5A10:
	movs r0, #0x25
	lsls r0, r0, #6
_021E5A14:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0200604C
	ldrh r1, [r4, r6]
	ldrb r0, [r5, #4]
	cmp r1, r0
	bne _021E5A34
	ldr r1, [r5, #0x5c]
	cmp r1, #0
	beq _021E5A2E
	ldr r0, [r5, #0x64]
	blx r1
_021E5A2E:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021E5A34:
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov100_021E5B4C
	ldrh r0, [r4, r6]
	pop {r4, r5, r6, pc}
_021E5A44:
	movs r0, #0x20
	tst r0, r1
	beq _021E5A5E
	ldr r0, _021E5A84 @ =0x0000093F
	bl FUN_0200604C
	ldr r0, [r5, #0x7c]
	movs r1, #0
	bl ov100_021E73AC
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021E5A5E:
	movs r0, #0x10
	tst r1, r0
	beq _021E5A78
	ldr r0, _021E5A84 @ =0x0000093F
	bl FUN_0200604C
	ldr r0, [r5, #0x7c]
	movs r1, #1
	bl ov100_021E73AC
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021E5A78:
	subs r0, #0x11
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E5A7C: .4byte 0x021D110C
_021E5A80: .4byte 0x00000942
_021E5A84: .4byte 0x0000093F
	thumb_func_end ov100_021E59CC

	thumb_func_start ov100_021E5A88
ov100_021E5A88: @ 0x021E5A88
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldrb r0, [r5, #5]
	movs r1, #0x20
	movs r3, #0x14
	lsls r0, r0, #0x19
	lsrs r4, r0, #0x19
	adds r0, r5, #0
	adds r0, #0xc8
	ldr r0, [r0]
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldrh r2, [r0]
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	adds r2, r1, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x74]
	bl FUN_0201C4EC
	movs r0, #1
	tst r0, r4
	bne _021E5B04
	adds r0, r5, #0
	adds r0, #0xc8
	ldr r0, [r0]
	movs r1, #6
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r2, #8
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	movs r3, #0x14
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r2, #0xd
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x74]
	bl FUN_0201C4EC
_021E5B04:
	movs r0, #2
	tst r0, r4
	bne _021E5B40
	adds r0, r5, #0
	adds r0, #0xc8
	ldr r0, [r0]
	movs r1, #6
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r2, #8
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	movs r3, #0x14
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r2, #7
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x74]
	bl FUN_0201C4EC
_021E5B40:
	ldr r0, [r5, #0x74]
	movs r1, #0
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov100_021E5A88

	thumb_func_start ov100_021E5B4C
ov100_021E5B4C: @ 0x021E5B4C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov100_021E5A88
	cmp r4, #4
	bne _021E5B62
	movs r2, #0x1a
	b _021E5B6C
_021E5B62:
	movs r0, #6
	muls r0, r4, r0
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_021E5B6C:
	adds r0, r5, #0
	adds r0, #0xc8
	ldr r0, [r0]
	movs r1, #6
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	lsls r1, r6, #0x1a
	str r2, [sp, #0xc]
	lsrs r1, r1, #0x18
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r3, #0x14
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x74]
	bl FUN_0201C4EC
	ldr r0, [r5, #0x74]
	movs r1, #0
	bl FUN_0201EFBC
	movs r0, #0
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov100_021E5B4C

	thumb_func_start ov100_021E5BB0
ov100_021E5BB0: @ 0x021E5BB0
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r4, r1, #0
	add r0, sp, #0x10
	add r1, sp, #4
	bl FUN_02014708
	cmp r4, #0
	bne _021E5BD6
	adds r0, r5, #0
	adds r0, #0x88
	ldr r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bne _021E5BD6
	add sp, #0x20
	movs r0, #0
	pop {r4, r5, r6, pc}
_021E5BD6:
	ldr r4, [sp, #4]
	movs r1, #0xa
	adds r0, r4, #0
	blx FUN_020F2BA4
	add r1, sp, #0
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	blx FUN_020F2BA4
	add r0, sp, #0
	strb r1, [r0, #1]
	ldr r4, [sp, #8]
	movs r1, #0xa
	adds r0, r4, #0
	blx FUN_020F2BA4
	add r1, sp, #0
	strb r0, [r1, #2]
	adds r0, r4, #0
	movs r1, #0xa
	blx FUN_020F2BA4
	add r0, sp, #0
	strb r1, [r0, #3]
	movs r4, #0
	add r6, sp, #0
_021E5C0E:
	lsls r0, r4, #2
	adds r0, r5, r0
	adds r0, #0xac
	ldrb r1, [r6, r4]
	ldr r0, [r0]
	bl FUN_0200DCC0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _021E5C0E
	adds r0, r5, #0
	ldr r1, [sp, #0x1c]
	adds r0, #0xa8
	lsls r1, r1, #0x10
	ldr r0, [r0]
	lsrs r1, r1, #0x10
	bl FUN_0200DCC0
	add r3, sp, #4
	adds r2, r5, #0
	ldm r3!, {r0, r1}
	adds r2, #0x80
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #0
	strb r0, [r5, #7]
	movs r0, #1
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov100_021E5BB0

	thumb_func_start ov100_021E5C50
ov100_021E5C50: @ 0x021E5C50
	cmp r0, #0x15
	bls _021E5C7C
	cmp r0, #0x19
	bne _021E5C60
	cmp r1, #8
	bne _021E5C60
	movs r0, #2
	bx lr
_021E5C60:
	cmp r0, #0x1c
	bne _021E5C68
	cmp r1, #6
	beq _021E5C74
_021E5C68:
	cmp r0, #0x1c
	bne _021E5C78
	cmp r1, #8
	bls _021E5C78
	cmp r1, #0xd
	bhs _021E5C78
_021E5C74:
	movs r0, #1
	bx lr
_021E5C78:
	movs r0, #0
	bx lr
_021E5C7C:
	movs r0, #2
	bx lr
	thumb_func_end ov100_021E5C50

	thumb_func_start ov100_021E5C80
ov100_021E5C80: @ 0x021E5C80
	ldr r2, [r0, #0x20]
	ldr r3, _021E5CA0 @ =ov100_021E5C50
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	asrs r0, r1, #4
	lsrs r0, r0, #0x1b
	adds r0, r1, r0
	asrs r1, r2, #4
	lsrs r1, r1, #0x1b
	adds r1, r2, r1
	lsls r0, r0, #0xb
	lsls r1, r1, #0xb
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	bx r3
	nop
_021E5CA0: .4byte ov100_021E5C50
	thumb_func_end ov100_021E5C80

	thumb_func_start ov100_021E5CA4
ov100_021E5CA4: @ 0x021E5CA4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #7
	ldr r3, [r5]
	movs r0, #3
	lsls r1, r1, #6
	movs r2, #0
	bl FUN_0201C290
	movs r1, #6
	ldr r3, [r5]
	movs r0, #7
	lsls r1, r1, #6
	movs r2, #0
	bl FUN_0201C290
	movs r4, #0
	movs r6, #0x40
	adds r7, r4, #0
_021E5CCA:
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	ldr r3, [r5]
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0201C1C4
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201BF7C
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201BB4C
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r4, #5
	lsls r0, r0, #0x18
	ldr r3, [r5]
	lsrs r0, r0, #0x18
	movs r1, #0x40
	movs r2, #0
	bl FUN_0201C1C4
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201BF7C
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201BB4C
	adds r4, r4, #1
	cmp r4, #3
	blt _021E5CCA
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov100_021E5CA4

	thumb_func_start ov100_021E5D3C
ov100_021E5D3C: @ 0x021E5D3C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldrb r2, [r4, #9]
	cmp r2, #0x10
	bls _021E5D4E
	add sp, #8
	movs r0, #1
	pop {r4, pc}
_021E5D4E:
	cmp r1, #0
	bne _021E5D88
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0x78]
	adds r2, r1, #0
	movs r3, #0xe0
	bl FUN_02003E5C
	ldrb r1, [r4, #9]
	movs r0, #0x10
	movs r2, #0x40
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x78]
	movs r1, #2
	movs r3, #0xc0
	bl FUN_02003E5C
	b _021E5DAC
_021E5D88:
	str r2, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r0, [r4, #0x78]
	adds r2, r1, #0
	movs r3, #0xe0
	bl FUN_02003E5C
	ldrb r0, [r4, #9]
	movs r1, #2
	movs r2, #0x40
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x78]
	movs r3, #0xc0
	bl FUN_02003E5C
_021E5DAC:
	ldrb r0, [r4, #9]
	cmp r0, #0x10
	blo _021E5DBC
	adds r0, r0, #2
	strb r0, [r4, #9]
	add sp, #8
	movs r0, #1
	pop {r4, pc}
_021E5DBC:
	adds r0, r0, #2
	strb r0, [r4, #9]
	movs r0, #0
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov100_021E5D3C

	thumb_func_start ov100_021E5DC8
ov100_021E5DC8: @ 0x021E5DC8
	ldrb r1, [r0, #5]
	ldr r2, _021E5DD8 @ =0x021E74B4
	lsls r1, r1, #0x19
	lsrs r3, r1, #0x17
	ldrb r1, [r0, #4]
	adds r0, r2, r3
	ldrb r0, [r1, r0]
	bx lr
	.align 2, 0
_021E5DD8: .4byte 0x021E74B4
	thumb_func_end ov100_021E5DC8

	thumb_func_start ov100_021E5DDC
ov100_021E5DDC: @ 0x021E5DDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x18]
	cmp r1, #3
	bhi _021E5E72
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5DF2: @ jump table
	.2byte _021E5DFA - _021E5DF2 - 2 @ case 0
	.2byte _021E5E4A - _021E5DF2 - 2 @ case 1
	.2byte _021E5E56 - _021E5DF2 - 2 @ case 2
	.2byte _021E5E62 - _021E5DF2 - 2 @ case 3
_021E5DFA:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5E7C @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5E80 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	bl FUN_020210BC
	movs r0, #2
	bl FUN_02021148
	b _021E5E72
_021E5E4A:
	bl ov100_021E5FFC
	adds r0, r4, #0
	bl ov100_021E60C4
	b _021E5E72
_021E5E56:
	bl ov100_021E616C
	adds r0, r4, #0
	bl ov100_021E6374
	b _021E5E72
_021E5E62:
	ldr r0, _021E5E84 @ =ov100_021E65F4
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #0
	str r0, [r4, #0x18]
	movs r0, #1
	pop {r4, pc}
_021E5E72:
	ldr r0, [r4, #0x18]
	adds r0, r0, #1
	str r0, [r4, #0x18]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E5E7C: .4byte 0xFFFFE0FF
_021E5E80: .4byte 0x04001000
_021E5E84: .4byte ov100_021E65F4
	thumb_func_end ov100_021E5DDC

	thumb_func_start ov100_021E5E88
ov100_021E5E88: @ 0x021E5E88
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02021238
	movs r0, #0
	adds r1, r4, #0
	bl FUN_0201A0FC
	adds r0, r4, #0
	bl ov100_021E63F4
	adds r0, r4, #0
	bl ov100_021E6338
	adds r0, r4, #0
	bl ov100_021E6134
	adds r0, r4, #0
	bl ov100_021E6094
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov100_021E5E88

	thumb_func_start ov100_021E5EB4
ov100_021E5EB4: @ 0x021E5EB4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5]
	movs r0, #0x8f
	bl FUN_02007688
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x30
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x74]
	ldr r1, [r5]
	adds r2, r6, #0
	movs r3, #0x8f
	bl FUN_0208820C
	adds r0, r4, #0
	adds r0, #0x24
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x74]
	ldr r1, [r5]
	adds r2, r6, #0
	movs r3, #0x8f
	bl FUN_0208820C
	movs r0, #0
	str r0, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	movs r0, #0xe0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r2, r4, #0
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	adds r1, r6, #0
	adds r2, #0x1e
	bl FUN_02003220
	movs r0, #1
	str r0, [sp]
	movs r0, #0x80
	str r0, [sp, #4]
	movs r0, #0xc0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r2, r4, #0
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	adds r1, r6, #0
	adds r2, #0x18
	bl FUN_02003220
	movs r0, #2
	str r0, [sp]
	movs r0, #0x80
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_02003220
	movs r0, #3
	str r0, [sp]
	movs r0, #0x80
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_02003220
	adds r2, r5, #0
	adds r2, #0xc4
	adds r1, r4, #0
	ldr r2, [r2]
	adds r0, r6, #0
	adds r1, #0x36
	bl FUN_0200778C
	adds r0, r5, #0
	adds r0, #0xc4
	adds r1, r5, #0
	ldr r0, [r0]
	adds r1, #0xc8
	blx FUN_020B71D8
	ldrb r1, [r5, #4]
	cmp r1, #4
	bne _021E5F9C
	adds r0, r5, #0
	movs r1, #2
	movs r2, #1
	bl ov100_021E5B4C
	b _021E5FA4
_021E5F9C:
	adds r0, r5, #0
	movs r2, #1
	bl ov100_021E5B4C
_021E5FA4:
	adds r4, #0x2a
	str r4, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x74]
	ldr r1, [r5]
	adds r2, r6, #0
	movs r3, #0x8f
	bl FUN_0208820C
	adds r0, r6, #0
	bl FUN_0200770C
	ldr r0, [r5, #0x74]
	movs r1, #0
	bl FUN_0201EFBC
	ldr r0, [r5, #0x74]
	movs r1, #4
	bl FUN_0201EFBC
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov100_021E5EB4

	thumb_func_start ov100_021E5FDC
ov100_021E5FDC: @ 0x021E5FDC
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5FF8 @ =0x021E7500
	add r3, sp, #0
	movs r2, #5
_021E5FE6:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5FE6
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E5FF8: .4byte 0x021E7500
	thumb_func_end ov100_021E5FDC

	thumb_func_start ov100_021E5FFC
ov100_021E5FFC: @ 0x021E5FFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r5, r0, #0
	bl ov100_021E5FDC
	ldr r0, [r5]
	bl FUN_0201AC88
	str r0, [r5, #0x74]
	ldr r2, _021E6084 @ =0x04000304
	ldr r0, _021E6088 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r4, _021E608C @ =0x021E74A4
	add r3, sp, #0x38
	ands r0, r1
	strh r0, [r2]
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r4, _021E6090 @ =0x021E7588
	add r3, sp, #0
	movs r2, #7
_021E6032:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6032
	movs r7, #0
	add r6, sp, #0
	adds r4, r7, #0
_021E6040:
	lsls r1, r4, #0x18
	ldr r0, [r5, #0x74]
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	movs r3, #0
	bl FUN_0201B1E4
	lsls r1, r4, #0x18
	ldr r0, [r5, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	lsls r0, r4, #0x18
	ldr r3, [r5]
	lsrs r0, r0, #0x18
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	adds r7, r7, #1
	adds r6, #0x1c
	adds r4, r4, #4
	cmp r7, #2
	blt _021E6040
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201BC28
	movs r0, #4
	movs r1, #0
	bl FUN_0201BC28
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6084: .4byte 0x04000304
_021E6088: .4byte 0xFFFF7FFF
_021E608C: .4byte 0x021E74A4
_021E6090: .4byte 0x021E7588
	thumb_func_end ov100_021E5FFC

	thumb_func_start ov100_021E6094
ov100_021E6094: @ 0x021E6094
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x74]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4, #0x74]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r4, #0x74]
	bl FUN_0201AB0C
	ldr r2, _021E60BC @ =0x04000304
	ldr r0, _021E60C0 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_021E60BC: .4byte 0x04000304
_021E60C0: .4byte 0xFFFF7FFF
	thumb_func_end ov100_021E6094

	thumb_func_start ov100_021E60C4
ov100_021E60C4: @ 0x021E60C4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x8f
	bl FUN_02007688
	adds r4, r0, #0
	ldr r0, [r5]
	bl FUN_020030E8
	str r0, [r5, #0x78]
	movs r2, #2
	ldr r3, [r5]
	movs r1, #0
	lsls r2, r2, #8
	bl FUN_02003120
	movs r1, #2
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	lsls r2, r1, #8
	bl FUN_02003120
	movs r1, #1
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	lsls r2, r1, #9
	bl FUN_02003120
	movs r2, #2
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	movs r1, #3
	lsls r2, r2, #8
	bl FUN_02003120
	movs r0, #0x8f
	movs r1, #0x36
	bl FUN_020075BC
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_0201AA8C
	adds r1, r5, #0
	adds r1, #0xc4
	str r0, [r1]
	ldrb r1, [r5, #8]
	adds r0, r5, #0
	bl ov100_021E5EB4
	adds r0, r4, #0
	bl FUN_0200770C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov100_021E60C4

	thumb_func_start ov100_021E6134
ov100_021E6134: @ 0x021E6134
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xc4
	ldr r0, [r0]
	bl FUN_0201AB0C
	ldr r0, [r4, #0x78]
	movs r1, #3
	bl FUN_02003150
	ldr r0, [r4, #0x78]
	movs r1, #1
	bl FUN_02003150
	ldr r0, [r4, #0x78]
	movs r1, #2
	bl FUN_02003150
	ldr r0, [r4, #0x78]
	movs r1, #0
	bl FUN_02003150
	ldr r0, [r4, #0x78]
	bl FUN_02003104
	movs r0, #0
	str r0, [r4, #0x78]
	pop {r4, pc}
	thumb_func_end ov100_021E6134

	thumb_func_start ov100_021E616C
ov100_021E616C: @ 0x021E616C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl ov100_021E6914
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldrb r3, [r5, #8]
	ldr r0, [r5]
	movs r1, #0xb
	movs r2, #1
	bl ov100_021E69F8
	adds r1, r5, #0
	adds r1, #0x94
	movs r4, #0
	str r0, [r1]
	adds r6, r5, #0
	adds r7, r4, #0
_021E6196:
	str r7, [sp]
	lsls r0, r4, #0x18
	str r7, [sp, #4]
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	adds r0, r4, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #0x40
	str r7, [sp, #0x10]
	adds r0, #0x94
	ldr r0, [r0]
	adds r2, r1, #0
	adds r3, r7, #0
	bl ov100_021E6AC0
	adds r1, r6, #0
	adds r1, #0x98
	adds r4, r4, #1
	adds r6, r6, #4
	str r0, [r1]
	cmp r4, #4
	blt _021E6196
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #0xad
	movs r2, #0x30
	bl ov100_021E6AC0
	adds r1, r5, #0
	adds r1, #0xa8
	str r0, [r1]
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #0x46
	movs r2, #0x2e
	bl ov100_021E6AC0
	adds r1, r5, #0
	adds r1, #0xac
	str r0, [r1]
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #0x56
	movs r2, #0x2e
	bl ov100_021E6AC0
	adds r1, r5, #0
	adds r1, #0xb0
	str r0, [r1]
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #7
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #0x6e
	movs r2, #0x2e
	bl ov100_021E6AC0
	adds r1, r5, #0
	adds r1, #0xb4
	str r0, [r1]
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #0x7e
	movs r2, #0x2e
	bl ov100_021E6AC0
	adds r1, r5, #0
	adds r1, #0xb8
	str r0, [r1]
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #9
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #0x62
	movs r2, #0x2e
	bl ov100_021E6AC0
	adds r1, r5, #0
	adds r1, #0xbc
	str r0, [r1]
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #0xc5
	movs r2, #0x30
	bl ov100_021E6AC0
	adds r1, r5, #0
	adds r1, #0xc0
	str r0, [r1]
	adds r0, r5, #0
	movs r1, #1
	bl ov100_021E5BB0
	adds r0, r5, #0
	adds r0, #0xbc
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DC78
	ldr r0, [r5, #0x20]
	ldrh r0, [r0, #0x10]
	bl FUN_0203B48C
	cmp r0, #0
	bne _021E62F4
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DCC0
_021E62F4:
	movs r6, #0
	adds r4, r5, #0
	adds r7, r6, #0
_021E62FA:
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	adds r1, r7, #0
	bl FUN_0200DCE8
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DC78
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #3
	ble _021E62FA
	movs r4, #4
	adds r5, #0x10
	movs r6, #1
_021E6320:
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	adds r1, r6, #0
	bl FUN_0200DCE8
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xb
	blt _021E6320
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov100_021E616C

	thumb_func_start ov100_021E6338
ov100_021E6338: @ 0x021E6338
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r4, #0
	adds r5, r7, #0
	adds r6, r4, #0
_021E6342:
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	adds r1, r6, #0
	bl FUN_0200DCE8
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	bl ov100_021E6C44
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xb
	blt _021E6342
	adds r0, r7, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl ov100_021E6A3C
	adds r0, r7, #0
	bl ov100_021E6950
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov100_021E6338

	thumb_func_start ov100_021E6374
ov100_021E6374: @ 0x021E6374
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #4
	bl ov100_021E6F88
	str r0, [r4, #0x7c]
	ldrb r0, [r4, #5]
	ldr r1, _021E63EC @ =0x021E7720
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x19
	movs r0, #1
	str r0, [sp]
	ldr r0, [r4]
	lsls r3, r2, #2
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	ldr r1, [r1, r3]
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	ldr r3, _021E63F0 @ =_021E74A0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldrb r2, [r3, r2]
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r3, #0
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x7c]
	bl ov100_021E7014
	ldrb r0, [r4, #4]
	cmp r0, #4
	bne _021E63D8
	ldr r0, [r4, #0x7c]
	movs r1, #0
	movs r2, #2
	bl ov100_021E72F8
	add sp, #0x18
	pop {r4, pc}
_021E63D8:
	adds r0, r4, #0
	bl ov100_021E5DC8
	adds r2, r0, #0
	ldr r0, [r4, #0x7c]
	movs r1, #0
	bl ov100_021E72F8
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
_021E63EC: .4byte 0x021E7720
_021E63F0: .4byte _021E74A0
	thumb_func_end ov100_021E6374

	thumb_func_start ov100_021E63F4
ov100_021E63F4: @ 0x021E63F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x7c]
	movs r1, #0
	bl ov100_021E70A4
	ldr r0, [r4, #0x7c]
	bl ov100_021E6FBC
	pop {r4, pc}
	thumb_func_end ov100_021E63F4

	thumb_func_start ov100_021E6408
ov100_021E6408: @ 0x021E6408
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E6428
	bl FUN_020072A8
	cmp r0, #0
	beq _021E6428
	ldr r0, [r4]
	bl FUN_02007278
	movs r0, #0
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E6428:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov100_021E6408

	thumb_func_start ov100_021E642C
ov100_021E642C: @ 0x021E642C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	adds r5, r0, #0
	movs r0, #0
	bl FUN_0200616C
	movs r2, #0x32
	movs r0, #3
	movs r1, #0x5a
	lsls r2, r2, #0xc
	bl FUN_0201A910
	adds r0, r4, #0
	movs r1, #0xcc
	movs r2, #0x5a
	bl FUN_02007280
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0xcc
	blx FUN_020E5B44
	str r5, [r4, #0x20]
	movs r0, #0x5a
	str r0, [r4]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	bl FUN_0202ED7C
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	bl FUN_020503D0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	bl FUN_02028EA8
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	bl FUN_02028E9C
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x28]
	bl FUN_0202EE4C
	ldrb r2, [r4, #5]
	movs r1, #0x7f
	bics r2, r1
	movs r1, #0x7f
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #5]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x28]
	bl FUN_020183F0
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x28]
	bl FUN_0202EE7C
	strb r0, [r4, #8]
	ldr r0, [r4, #0x20]
	ldrb r0, [r0]
	cmp r0, #0
	beq _021E64C8
	cmp r0, #1
	bne _021E64C8
	movs r0, #3
	strb r0, [r4, #4]
	b _021E64FC
_021E64C8:
	ldr r0, [r4, #0x28]
	bl FUN_0202EDF8
	strb r0, [r4, #4]
	ldrb r0, [r4, #4]
	cmp r0, #2
	bne _021E64E8
	ldrb r0, [r4, #5]
	lsls r0, r0, #0x19
	lsrs r1, r0, #0x19
	movs r0, #1
	tst r0, r1
	bne _021E64FC
	movs r0, #0
	strb r0, [r4, #4]
	b _021E64FC
_021E64E8:
	cmp r0, #1
	bne _021E64FC
	ldrb r0, [r4, #5]
	lsls r0, r0, #0x19
	lsrs r1, r0, #0x19
	movs r0, #2
	tst r0, r1
	bne _021E64FC
	movs r0, #0
	strb r0, [r4, #4]
_021E64FC:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x38
	strb r1, [r0]
	adds r0, r4, #0
	ldr r2, _021E651C @ =0x0000FFFF
	adds r0, #0x56
	strh r2, [r0]
	movs r0, #1
	strb r0, [r4, #6]
	movs r0, #0x37
	adds r2, r1, #0
	bl FUN_02004EC4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E651C: .4byte 0x0000FFFF
	thumb_func_end ov100_021E642C

	thumb_func_start ov100_021E6520
ov100_021E6520: @ 0x021E6520
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	cmp r1, #0xc
	bhi _021E65B8
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E653A: @ jump table
	.2byte _021E6554 - _021E653A - 2 @ case 0
	.2byte _021E655C - _021E653A - 2 @ case 1
	.2byte _021E6564 - _021E653A - 2 @ case 2
	.2byte _021E656C - _021E653A - 2 @ case 3
	.2byte _021E6574 - _021E653A - 2 @ case 4
	.2byte _021E657C - _021E653A - 2 @ case 5
	.2byte _021E6584 - _021E653A - 2 @ case 6
	.2byte _021E658C - _021E653A - 2 @ case 7
	.2byte _021E6594 - _021E653A - 2 @ case 8
	.2byte _021E659C - _021E653A - 2 @ case 9
	.2byte _021E65A4 - _021E653A - 2 @ case 10
	.2byte _021E65AC - _021E653A - 2 @ case 11
	.2byte _021E65B4 - _021E653A - 2 @ case 12
_021E6554:
	bl ov100_021E665C
	str r0, [r4]
	b _021E65B8
_021E655C:
	bl ov100_021E669C
	str r0, [r4]
	b _021E65B8
_021E6564:
	bl ov100_021E67D4
	str r0, [r4]
	b _021E65B8
_021E656C:
	bl ov100_021E67EC
	str r0, [r4]
	b _021E65B8
_021E6574:
	bl ov100_021E68A8
	str r0, [r4]
	b _021E65B8
_021E657C:
	bl ov100_021E68C0
	str r0, [r4]
	b _021E65B8
_021E6584:
	bl ov100_021E66B0
	str r0, [r4]
	b _021E65B8
_021E658C:
	bl ov100_021E66C8
	str r0, [r4]
	b _021E65B8
_021E6594:
	bl ov100_021E673C
	str r0, [r4]
	b _021E65B8
_021E659C:
	bl ov100_021E6794
	str r0, [r4]
	b _021E65B8
_021E65A4:
	bl ov100_021E6840
	str r0, [r4]
	b _021E65B8
_021E65AC:
	bl ov100_021E6858
	str r0, [r4]
	b _021E65B8
_021E65B4:
	movs r0, #1
	pop {r4, pc}
_021E65B8:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov100_021E6520

	thumb_func_start ov100_021E65BC
ov100_021E65BC: @ 0x021E65BC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldrb r1, [r4, #4]
	ldr r0, [r4, #0x28]
	bl FUN_0202EDFC
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl FUN_02018410
	ldr r4, [r4]
	adds r0, r5, #0
	bl FUN_02007294
	bl FUN_02004B10
	bl FUN_0203E354
	adds r0, r4, #0
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov100_021E65BC

	thumb_func_start ov100_021E65F4
ov100_021E65F4: @ 0x021E65F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	cmp r2, #0
	beq _021E6602
	ldr r1, [r4, #0x64]
	blx r2
_021E6602:
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _021E660C
	bl FUN_0200398C
_021E660C:
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _021E663C
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	beq _021E6632
	adds r0, r4, #0
	movs r1, #0
	bl ov100_021E5BB0
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl ov100_021E6AB0
_021E6632:
	adds r0, r4, #0
	bl ov100_021E69E8
	bl FUN_0200D034
_021E663C:
	bl FUN_0202061C
	ldr r0, [r4, #0x74]
	bl FUN_0201EEB4
	ldr r3, _021E6654 @ =0x027E0000
	ldr r1, _021E6658 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E6654: .4byte 0x027E0000
_021E6658: .4byte 0x00003FF8
	thumb_func_end ov100_021E65F4

	thumb_func_start ov100_021E665C
ov100_021E665C: @ 0x021E665C
	push {r4, lr}
	adds r4, r0, #0
	bl ov100_021E5DDC
	cmp r0, #0
	bne _021E666C
	movs r0, #0
	pop {r4, pc}
_021E666C:
	ldrb r0, [r4, #4]
	cmp r0, #4
	bhi _021E6698
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E667E: @ jump table
	.2byte _021E6694 - _021E667E - 2 @ case 0
	.2byte _021E668C - _021E667E - 2 @ case 1
	.2byte _021E6688 - _021E667E - 2 @ case 2
	.2byte _021E6690 - _021E667E - 2 @ case 3
	.2byte _021E6688 - _021E667E - 2 @ case 4
_021E6688:
	movs r0, #6
	pop {r4, pc}
_021E668C:
	movs r0, #4
	pop {r4, pc}
_021E6690:
	movs r0, #0xa
	pop {r4, pc}
_021E6694:
	movs r0, #2
	pop {r4, pc}
_021E6698:
	movs r0, #2
	pop {r4, pc}
	thumb_func_end ov100_021E665C

	thumb_func_start ov100_021E669C
ov100_021E669C: @ 0x021E669C
	push {r3, lr}
	bl ov100_021E5E88
	cmp r0, #0
	beq _021E66AA
	movs r0, #0xc
	pop {r3, pc}
_021E66AA:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov100_021E669C

	thumb_func_start ov100_021E66B0
ov100_021E66B0: @ 0x021E66B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E66C4 @ =0x021E762C
	ldr r2, [r4]
	adds r1, r4, #0
	bl FUN_0200724C
	str r0, [r4, #0x70]
	movs r0, #7
	pop {r4, pc}
	.align 2, 0
_021E66C4: .4byte 0x021E762C
	thumb_func_end ov100_021E66B0

	thumb_func_start ov100_021E66C8
ov100_021E66C8: @ 0x021E66C8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E66DA
	movs r0, #7
	pop {r4, pc}
_021E66DA:
	ldr r0, [r4, #0x1c]
	movs r1, #0
	str r1, [r4, #0x1c]
	cmp r0, #6
	bhi _021E6736
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E66F0: @ jump table
	.2byte _021E670E - _021E66F0 - 2 @ case 0
	.2byte _021E671A - _021E66F0 - 2 @ case 1
	.2byte _021E66FE - _021E66F0 - 2 @ case 2
	.2byte _021E6728 - _021E66F0 - 2 @ case 3
	.2byte _021E6736 - _021E66F0 - 2 @ case 4
	.2byte _021E6736 - _021E66F0 - 2 @ case 5
	.2byte _021E6706 - _021E66F0 - 2 @ case 6
_021E66FE:
	movs r0, #2
	strb r0, [r4, #4]
	movs r0, #6
	pop {r4, pc}
_021E6706:
	movs r0, #4
	strb r0, [r4, #4]
	movs r0, #8
	pop {r4, pc}
_021E670E:
	strb r1, [r4, #4]
	ldr r0, [r4, #0x74]
	bl FUN_0201EEB4
	movs r0, #2
	pop {r4, pc}
_021E671A:
	movs r0, #1
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl FUN_0201EEB4
	movs r0, #4
	pop {r4, pc}
_021E6728:
	movs r0, #3
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl FUN_0201EEB4
	movs r0, #0xa
	pop {r4, pc}
_021E6736:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov100_021E66C8

	thumb_func_start ov100_021E673C
ov100_021E673C: @ 0x021E673C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ov100_021E5E88
	cmp r0, #0
	bne _021E6750
	add sp, #4
	movs r0, #8
	pop {r3, r4, pc}
_021E6750:
	ldr r3, [r4, #0x20]
	ldr r0, [r4]
	str r0, [sp]
	movs r0, #0
	ldr r2, [r3, #0x24]
	ldr r3, [r3, #0x28]
	adds r1, r0, #0
	bl FUN_02090C94
	str r0, [r4, #0x6c]
	adds r0, r4, #0
	ldr r1, _021E678C @ =0x0000FFFF
	adds r0, #0x56
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x56
	ldrh r1, [r1]
	ldr r0, [r4, #0x6c]
	bl FUN_02090D14
	ldr r0, _021E6790 @ =0x021E761C
	ldr r1, [r4, #0x6c]
	ldr r2, [r4]
	bl FUN_0200724C
	str r0, [r4, #0x70]
	movs r0, #9
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E678C: .4byte 0x0000FFFF
_021E6790: .4byte 0x021E761C
	thumb_func_end ov100_021E673C

	thumb_func_start ov100_021E6794
ov100_021E6794: @ 0x021E6794
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E67A6
	movs r0, #9
	pop {r4, pc}
_021E67A6:
	ldr r0, [r4, #0x6c]
	bl FUN_02090D48
	cmp r0, #0
	bne _021E67BC
	ldr r0, [r4, #0x6c]
	bl FUN_02090D50
	adds r1, r4, #0
	adds r1, #0x56
	strh r0, [r1]
_021E67BC:
	ldr r0, [r4, #0x6c]
	bl FUN_02090D0C
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x38
	strb r1, [r0]
	movs r0, #4
	strb r0, [r4, #4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov100_021E6794

	thumb_func_start ov100_021E67D4
ov100_021E67D4: @ 0x021E67D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E67E8 @ =0x021E760C
	ldr r2, [r4]
	adds r1, r4, #0
	bl FUN_0200724C
	str r0, [r4, #0x70]
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_021E67E8: .4byte 0x021E760C
	thumb_func_end ov100_021E67D4

	thumb_func_start ov100_021E67EC
ov100_021E67EC: @ 0x021E67EC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E67FE
	movs r0, #3
	pop {r4, pc}
_021E67FE:
	ldr r1, [r4, #0x1c]
	movs r0, #0
	str r0, [r4, #0x1c]
	cmp r1, #1
	beq _021E6820
	cmp r1, #2
	beq _021E6812
	cmp r1, #3
	beq _021E682E
	b _021E683C
_021E6812:
	movs r0, #2
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl FUN_0201EEB4
	movs r0, #6
	pop {r4, pc}
_021E6820:
	movs r0, #1
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl FUN_0201EEB4
	movs r0, #4
	pop {r4, pc}
_021E682E:
	movs r0, #3
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl FUN_0201EEB4
	movs r0, #0xa
	pop {r4, pc}
_021E683C:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov100_021E67EC

	thumb_func_start ov100_021E6840
ov100_021E6840: @ 0x021E6840
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E6854 @ =0x021E75FC
	ldr r2, [r4]
	adds r1, r4, #0
	bl FUN_0200724C
	str r0, [r4, #0x70]
	movs r0, #0xb
	pop {r4, pc}
	.align 2, 0
_021E6854: .4byte 0x021E75FC
	thumb_func_end ov100_021E6840

	thumb_func_start ov100_021E6858
ov100_021E6858: @ 0x021E6858
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E686A
	movs r0, #0xb
	pop {r4, pc}
_021E686A:
	ldr r1, [r4, #0x1c]
	movs r0, #0
	str r0, [r4, #0x1c]
	cmp r1, #0
	beq _021E688A
	cmp r1, #1
	beq _021E6896
	cmp r1, #2
	bne _021E68A4
	movs r0, #2
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl FUN_0201EEB4
	movs r0, #6
	pop {r4, pc}
_021E688A:
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl FUN_0201EEB4
	movs r0, #2
	pop {r4, pc}
_021E6896:
	movs r0, #1
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl FUN_0201EEB4
	movs r0, #4
	pop {r4, pc}
_021E68A4:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov100_021E6858

	thumb_func_start ov100_021E68A8
ov100_021E68A8: @ 0x021E68A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E68BC @ =0x021E763C
	ldr r2, [r4]
	adds r1, r4, #0
	bl FUN_0200724C
	str r0, [r4, #0x70]
	movs r0, #5
	pop {r4, pc}
	.align 2, 0
_021E68BC: .4byte 0x021E763C
	thumb_func_end ov100_021E68A8

	thumb_func_start ov100_021E68C0
ov100_021E68C0: @ 0x021E68C0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E68D2
	movs r0, #5
	pop {r4, pc}
_021E68D2:
	ldr r1, [r4, #0x1c]
	movs r0, #0
	str r0, [r4, #0x1c]
	cmp r1, #0
	beq _021E68F4
	cmp r1, #2
	beq _021E68E6
	cmp r1, #3
	beq _021E6900
	b _021E690E
_021E68E6:
	movs r0, #2
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl FUN_0201EEB4
	movs r0, #6
	pop {r4, pc}
_021E68F4:
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl FUN_0201EEB4
	movs r0, #2
	pop {r4, pc}
_021E6900:
	movs r0, #3
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl FUN_0201EEB4
	movs r0, #0xa
	pop {r4, pc}
_021E690E:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov100_021E68C0

	thumb_func_start ov100_021E6914
ov100_021E6914: @ 0x021E6914
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #0x20
	bl FUN_0202055C
	ldr r0, [r4]
	bl FUN_0200CF18
	adds r1, r4, #0
	adds r1, #0x8c
	str r0, [r1]
	adds r0, r4, #0
	ldr r2, _021E694C @ =0x021E764C
	adds r0, #0x8c
	ldr r1, [r2, #0x74]
	ldr r0, [r0]
	ldr r2, [r2, #0x78]
	movs r3, #0x20
	bl FUN_0200CF70
	ldr r0, [r4]
	bl FUN_0200B2E0
	ldr r0, [r4]
	bl FUN_0200B2E8
	pop {r4, pc}
	.align 2, 0
_021E694C: .4byte 0x021E764C
	thumb_func_end ov100_021E6914

	thumb_func_start ov100_021E6950
ov100_021E6950: @ 0x021E6950
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_0200D108
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x8c
	str r1, [r0]
	bl FUN_020205AC
	ldr r0, [r4]
	bl FUN_0200B2E0
	ldr r0, [r4]
	bl FUN_0200B2E8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov100_021E6950

	thumb_func_start ov100_021E6978
ov100_021E6978: @ 0x021E6978
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x8c
	ldr r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	beq _021E69BE
	bl FUN_0200CF38
	adds r1, r4, #0
	adds r1, #0x90
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r2, _021E69C0 @ =0x021E76BC
	lsls r5, r5, #4
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2, r5]
	bl FUN_0200CFF4
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	ldr r2, _021E69C4 @ =0x021E76C8
	adds r0, #0x8c
	adds r4, #0x90
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [r2, r5]
	movs r3, #1
	bl FUN_0200D2A4
_021E69BE:
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E69C0: .4byte 0x021E76BC
_021E69C4: .4byte 0x021E76C8
	thumb_func_end ov100_021E6978

	thumb_func_start ov100_021E69C8
ov100_021E69C8: @ 0x021E69C8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldr r1, [r0]
	cmp r1, #0
	beq _021E69E4
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_0200D0E4
	movs r0, #0
	adds r4, #0x90
	str r0, [r4]
_021E69E4:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov100_021E69C8

	thumb_func_start ov100_021E69E8
ov100_021E69E8: @ 0x021E69E8
	push {r3, lr}
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #0
	beq _021E69F6
	bl FUN_0200D020
_021E69F6:
	pop {r3, pc}
	thumb_func_end ov100_021E69E8

	thumb_func_start ov100_021E69F8
ov100_021E69F8: @ 0x021E69F8
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	movs r1, #0x16
	lsls r1, r1, #4
	adds r6, r0, #0
	adds r5, r2, #0
	str r3, [sp]
	bl FUN_0201AA8C
	movs r2, #0x16
	movs r1, #0
	lsls r2, r2, #4
	adds r4, r0, #0
	blx FUN_020D4994
	str r6, [r4]
	cmp r5, #4
	bls _021E6A22
	movs r0, #4
	strh r0, [r4, #0xa]
	b _021E6A24
_021E6A22:
	strh r5, [r4, #0xa]
_021E6A24:
	strh r7, [r4, #0xc]
	add r0, sp, #8
	ldrh r0, [r0, #0x10]
	strh r0, [r4, #0xe]
	ldr r0, [sp, #0x1c]
	str r0, [r4, #4]
	ldr r1, [sp]
	adds r0, r4, #0
	bl ov100_021E6C4C
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov100_021E69F8

	thumb_func_start ov100_021E6A3C
ov100_021E6A3C: @ 0x021E6A3C
	push {r4, lr}
	adds r4, r0, #0
	bl ov100_021E6CF4
	movs r2, #0x16
	adds r0, r4, #0
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov100_021E6A3C

	thumb_func_start ov100_021E6A58
ov100_021E6A58: @ 0x021E6A58
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x15
	adds r6, r1, #0
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	subs r0, #0x10
	ldr r1, [r1]
	movs r2, #0x8f
	ldr r5, [r1]
	movs r1, #0
	str r1, [sp]
	ldr r1, [r4]
	adds r3, r6, #6
	str r1, [sp, #4]
	ldr r0, [r4, r0]
	adds r1, r5, #0
	bl FUN_0200A2E4
	adds r0, r5, #0
	bl FUN_0200AE8C
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, #0x10
	ldr r1, [r1]
	movs r2, #0x8f
	ldr r5, [r1]
	movs r1, #0
	str r1, [sp]
	ldr r1, [r4]
	adds r3, r6, #0
	str r1, [sp, #4]
	ldr r0, [r4, r0]
	adds r1, r5, #0
	bl FUN_0200A350
	adds r0, r5, #0
	bl FUN_0200B084
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov100_021E6A58

	thumb_func_start ov100_021E6AB0
ov100_021E6AB0: @ 0x021E6AB0
	push {r3, lr}
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _021E6ABC
	bl FUN_0202457C
_021E6ABC:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov100_021E6AB0

	thumb_func_start ov100_021E6AC0
ov100_021E6AC0: @ 0x021E6AC0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	str r2, [sp, #0x2c]
	adds r5, r0, #0
	str r3, [sp, #0x30]
	adds r7, r1, #0
	ldr r0, [r5]
	movs r1, #0x10
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x10
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [r5]
	movs r1, #8
	bl FUN_0201AA8C
	str r0, [r4, #8]
	ldr r0, [r5]
	movs r1, #0x24
	bl FUN_0201AA8C
	ldr r1, [r4, #8]
	str r0, [r1]
	ldr r0, [r4, #8]
	ldr r0, [r0]
	str r0, [r4, #4]
	ldr r0, [sp, #0x88]
	cmp r0, #0
	bne _021E6B04
	movs r6, #1
	b _021E6B06
_021E6B04:
	movs r6, #2
_021E6B06:
	movs r3, #0xe
	lsls r3, r3, #0xc
	movs r0, #0
	str r3, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	add r0, sp, #0x68
	ldrb r0, [r0, #0x10]
	str r0, [sp, #0x10]
	movs r0, #5
	lsls r0, r0, #6
	ldr r2, [r5, r0]
	str r2, [sp, #0x14]
	adds r2, r0, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	adds r2, r0, #0
	adds r2, #8
	ldr r2, [r5, r2]
	adds r0, #0xc
	str r2, [sp, #0x1c]
	ldr r0, [r5, r0]
	adds r2, r3, #0
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, [r4, #4]
	adds r1, r3, #0
	bl FUN_02009D48
	ldr r0, [r5, #0x10]
	cmp r7, #0
	str r0, [sp, #0x34]
	ldr r0, [r4, #4]
	str r0, [sp, #0x38]
	beq _021E6B66
	lsls r0, r7, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E6B74
_021E6B66:
	lsls r0, r7, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E6B74:
	blx FUN_020F2104
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _021E6B92
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E6BA0
_021E6B92:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E6BA0:
	blx FUN_020F2104
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _021E6BBE
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E6BCC
_021E6BBE:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E6BCC:
	blx FUN_020F2104
	str r0, [sp, #0x44]
	cmp r6, #2
	bne _021E6BE0
	movs r0, #3
	ldr r1, [sp, #0x40]
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #0x40]
_021E6BE0:
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	str r0, [sp, #0x50]
	movs r1, #0
	add r0, sp, #0x34
	strh r1, [r0, #0x20]
	add r0, sp, #0x68
	ldrb r0, [r0, #0x14]
	str r6, [sp, #0x5c]
	str r0, [sp, #0x58]
	ldr r0, [r5]
	str r0, [sp, #0x60]
	add r0, sp, #0x34
	bl FUN_02024624
	movs r1, #0x55
	lsls r1, r1, #2
	str r0, [r4]
	ldr r1, [r5, r1]
	cmp r0, #0
	ldr r1, [r1]
	ldr r7, [r1]
	beq _021E6C34
	add r1, sp, #0x68
	ldrb r5, [r1, #0x1c]
	adds r1, r5, #0
	bl FUN_020248F0
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_0200B12C
	ldr r1, _021E6C40 @ =0x021E770C
	adds r2, r0, #0
	ldrb r1, [r1, r5]
	ldr r0, [r4]
	adds r1, r1, r2
	bl FUN_02024A14
	b _021E6C38
_021E6C34:
	bl GF_AssertFail
_021E6C38:
	adds r0, r4, #0
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	nop
_021E6C40: .4byte 0x021E770C
	thumb_func_end ov100_021E6AC0

	thumb_func_start ov100_021E6C44
ov100_021E6C44: @ 0x021E6C44
	ldr r3, _021E6C48 @ =FUN_0200D9DC
	bx r3
	.align 2, 0
_021E6C48: .4byte FUN_0200D9DC
	thumb_func_end ov100_021E6C44

	thumb_func_start ov100_021E6C4C
ov100_021E6C4C: @ 0x021E6C4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	ldr r1, _021E6CF0 @ =0x021E764C
	str r0, [sp]
	ldrb r2, [r1]
	add r0, sp, #0xc
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	ldrb r1, [r1, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldr r0, [sp]
	ldr r2, [sp]
	ldr r1, [sp]
	ldrh r0, [r0, #0xc]
	ldr r2, [r2]
	adds r1, #0x14
	bl FUN_02009F40
	ldr r1, [sp]
	movs r6, #0x15
	str r0, [r1, #0x10]
	adds r0, r1, #0
	ldrh r1, [r0, #0xa]
	add r0, sp, #0xc
	ldr r5, [sp]
	strb r1, [r0, #1]
	movs r0, #0
	str r0, [sp, #8]
	add r7, sp, #0xc
	adds r4, r0, #0
	lsls r6, r6, #4
_021E6C92:
	ldr r2, [sp]
	ldrb r0, [r7]
	ldr r1, [sp, #8]
	ldr r2, [r2]
	bl FUN_0200A090
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r5, r1]
	ldr r1, [sp]
	ldrb r0, [r7]
	ldr r1, [r1]
	bl FUN_0200A6F0
	movs r1, #0x15
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r3, [r5, r0]
	movs r1, #0
	ldr r0, [r3, #4]
	cmp r0, #0
	bls _021E6CD4
	adds r2, r1, #0
_021E6CC4:
	ldr r0, [r3]
	adds r1, r1, #1
	str r4, [r0, r2]
	ldr r3, [r5, r6]
	adds r2, r2, #4
	ldr r0, [r3, #4]
	cmp r1, r0
	blo _021E6CC4
_021E6CD4:
	ldr r0, [sp, #8]
	adds r7, r7, #1
	adds r0, r0, #1
	adds r5, r5, #4
	str r0, [sp, #8]
	cmp r0, #4
	blo _021E6C92
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov100_021E6D34
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6CF0: .4byte 0x021E764C
	thumb_func_end ov100_021E6C4C

	thumb_func_start ov100_021E6CF4
ov100_021E6CF4: @ 0x021E6CF4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	bl FUN_02024504
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200AED4
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200B0CC
	movs r7, #0x15
	lsls r7, r7, #4
	adds r6, r7, #0
	movs r4, #0
	subs r6, #0x10
_021E6D1C:
	ldr r0, [r5, r7]
	bl FUN_0200A714
	ldr r0, [r5, r6]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _021E6D1C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov100_021E6CF4

	thumb_func_start ov100_021E6D34
ov100_021E6D34: @ 0x021E6D34
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	movs r0, #0x15
	str r1, [sp, #0x10]
	lsls r0, r0, #4
	ldr r4, [r7, r0]
	movs r1, #0xe
	lsls r1, r1, #0xc
	str r1, [sp]
	ldrh r1, [r7, #0xe]
	subs r0, #0x10
	movs r3, #0
	str r1, [sp, #4]
	ldr r1, [r7]
	str r1, [sp, #8]
	ldr r2, [sp, #0x10]
	ldr r0, [r7, r0]
	movs r1, #0x8f
	adds r2, r2, #6
	bl FUN_0200A1D8
	ldr r1, [r4]
	str r0, [r1]
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E6D70
	bl GF_AssertFail
_021E6D70:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _021E6D94
	cmp r0, #1
	beq _021E6D80
	cmp r0, #2
	beq _021E6D8A
	b _021E6D94
_021E6D80:
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0200ADA4
	b _021E6D9C
_021E6D8A:
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0200AE18
	b _021E6D9C
_021E6D94:
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0200ACF0
_021E6D9C:
	movs r4, #0
	adds r5, r7, #0
_021E6DA0:
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r6, [r5, r0]
	movs r0, #0xe
	lsls r0, r0, #0xc
	str r0, [sp]
	adds r0, r4, #2
	str r0, [sp, #4]
	ldr r0, [r7]
	adds r2, r4, #0
	str r0, [sp, #8]
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x8f
	adds r2, #0xc
	movs r3, #0
	bl FUN_0200A294
	ldr r1, [r6]
	str r0, [r1]
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E6DD6
	bl GF_AssertFail
_021E6DD6:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _021E6DA0
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r4, [r7, r0]
	movs r1, #0xe
	lsls r1, r1, #0xc
	str r1, [sp]
	ldrh r1, [r7, #0xe]
	subs r0, #0x10
	movs r3, #0
	str r1, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	ldr r1, [r7]
	str r1, [sp, #0xc]
	ldr r0, [r7, r0]
	ldr r2, [sp, #0x10]
	movs r1, #0x8f
	bl FUN_0200A234
	ldr r1, [r4]
	str r0, [r1]
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E6E14
	bl GF_AssertFail
_021E6E14:
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0200B00C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov100_021E6D34

	thumb_func_start ov100_021E6E20
ov100_021E6E20: @ 0x021E6E20
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	adds r6, r0, #0
	adds r0, r7, #0
	movs r1, #0xc
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0xc
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x28
	adds r5, r6, #0
	muls r5, r0, r5
	adds r0, r7, #0
	adds r1, r5, #0
	strh r6, [r4]
	bl FUN_0201AA8C
	movs r1, #0
	adds r2, r5, #0
	str r0, [r4, #8]
	blx FUN_020D4994
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov100_021E6E20

	thumb_func_start ov100_021E6E58
ov100_021E6E58: @ 0x021E6E58
	push {r4, lr}
	adds r4, r0, #0
	ldrh r3, [r4]
	movs r2, #0x28
	ldr r0, [r4, #8]
	movs r1, #0
	muls r2, r3, r2
	blx FUN_020D4994
	ldr r0, [r4, #8]
	bl FUN_0201AB0C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov100_021E6E58

	thumb_func_start ov100_021E6E84
ov100_021E6E84: @ 0x021E6E84
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #2]
	movs r4, #0
	cmp r0, #0
	bls _021E6EC0
	movs r7, #6
	movs r6, #0x28
_021E6E94:
	adds r0, r4, #0
	ldr r1, [r5, #8]
	muls r0, r6, r0
	adds r2, r1, r0
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _021E6EB4
	ldrh r0, [r2, #2]
	cmp r0, #0
	bne _021E6EB4
	movs r1, #4
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r7]
	bl FUN_0200DD88
_021E6EB4:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r0, [r5, #2]
	cmp r4, r0
	blo _021E6E94
_021E6EC0:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov100_021E6E84

	thumb_func_start ov100_021E6EC4
ov100_021E6EC4: @ 0x021E6EC4
	push {r3, r4}
	ldrh r4, [r0, #2]
	ldrh r2, [r0]
	cmp r4, r2
	blo _021E6ED4
	ldr r0, _021E6EF0 @ =0x0000FFFF
	pop {r3, r4}
	bx lr
_021E6ED4:
	movs r2, #0x28
	ldr r3, [r0, #8]
	muls r2, r4, r2
	adds r4, r3, r2
	str r1, [r4, #0x20]
	movs r1, #1
	strb r1, [r3, r2]
	strb r1, [r4, #1]
	ldrh r2, [r0, #2]
	adds r1, r2, #1
	strh r1, [r0, #2]
	adds r0, r2, #0
	pop {r3, r4}
	bx lr
	.align 2, 0
_021E6EF0: .4byte 0x0000FFFF
	thumb_func_end ov100_021E6EC4

	thumb_func_start ov100_021E6EF4
ov100_021E6EF4: @ 0x021E6EF4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r3, [r5, #2]
	movs r4, #0
	cmp r3, #0
	bls _021E6F20
	movs r6, #0x28
_021E6F02:
	adds r0, r4, #0
	ldr r1, [r5, #8]
	muls r0, r6, r0
	adds r0, r1, r0
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _021E6F14
	bl FUN_0200D018
_021E6F14:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	ldrh r3, [r5, #2]
	lsrs r4, r0, #0x10
	cmp r4, r3
	blo _021E6F02
_021E6F20:
	movs r2, #0x28
	ldr r0, [r5, #8]
	movs r1, #0
	muls r2, r3, r2
	blx FUN_020D4994
	movs r0, #0
	strh r0, [r5, #2]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov100_021E6EF4

	thumb_func_start ov100_021E6F34
ov100_021E6F34: @ 0x021E6F34
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	str r1, [sp]
	ldrh r1, [r5, #2]
	ldr r0, [sp]
	ldr r4, [sp]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r4, r1
	bhs _021E6F6A
	movs r6, #0x28
_021E6F4C:
	adds r0, r4, #0
	ldr r1, [r5, #8]
	muls r0, r6, r0
	adds r0, r1, r0
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _021E6F5E
	bl FUN_0200D018
_021E6F5E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r0, [r5, #2]
	cmp r4, r0
	blo _021E6F4C
_021E6F6A:
	ldr r0, [sp]
	ldr r3, [r5, #8]
	movs r2, #0x28
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r3, r1
	movs r1, #0
	muls r2, r7, r2
	blx FUN_020D4994
	ldrh r0, [r5, #2]
	subs r0, r0, r7
	strh r0, [r5, #2]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov100_021E6F34

	thumb_func_start ov100_021E6F88
ov100_021E6F88: @ 0x021E6F88
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #0xc
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	strh r5, [r4]
	lsls r5, r5, #5
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0201AA8C
	movs r1, #0
	adds r2, r5, #0
	str r0, [r4, #4]
	blx FUN_020D4994
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov100_021E6F88

	thumb_func_start ov100_021E6FBC
ov100_021E6FBC: @ 0x021E6FBC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r2, [r5]
	movs r4, #0
	cmp r2, #0
	ble _021E6FF0
	adds r6, r4, #0
_021E6FCA:
	ldr r1, [r5, #4]
	adds r0, r1, r6
	ldrb r1, [r1, r6]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	beq _021E6FE6
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _021E6FE6
	lsls r1, r4, #0x10
	adds r0, r5, #0
	lsrs r1, r1, #0x10
	bl ov100_021E70A4
_021E6FE6:
	ldrh r2, [r5]
	adds r4, r4, #1
	adds r6, #0x20
	cmp r4, r2
	blt _021E6FCA
_021E6FF0:
	ldr r0, [r5, #4]
	movs r1, #0
	lsls r2, r2, #5
	blx FUN_020D4994
	ldr r0, [r5, #4]
	bl FUN_0201AB0C
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov100_021E6FBC

	thumb_func_start ov100_021E7014
ov100_021E7014: @ 0x021E7014
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	str r1, [sp]
	adds r7, r2, #0
	adds r5, r3, #0
	bl ov100_021E70FC
	adds r6, r0, #0
	ldr r0, _021E70A0 @ =0x0000FFFF
	cmp r6, r0
	beq _021E709C
	ldr r2, [r4, #4]
	lsls r1, r6, #5
	ldrb r0, [r2, r1]
	movs r3, #1
	adds r4, r2, r1
	bics r0, r3
	movs r3, #1
	orrs r0, r3
	strb r0, [r2, r1]
	ldrb r3, [r2, r1]
	movs r0, #4
	orrs r0, r3
	strb r0, [r2, r1]
	strb r7, [r4, #2]
	ldrb r0, [r4, #2]
	movs r1, #0xc
	subs r0, r0, #1
	strb r0, [r4, #3]
	ldrb r2, [r4, #2]
	ldr r0, [sp, #0x1c]
	muls r1, r2, r1
	bl FUN_0201AA8C
	str r0, [r4, #4]
	ldrb r3, [r4, #2]
	movs r2, #0xc
	ldr r0, [sp]
	ldr r1, [r4, #4]
	muls r2, r3, r2
	blx FUN_020D4A50
	ldrb r0, [r4, #2]
	cmp r5, r0
	blo _021E7074
	movs r0, #0
	strb r0, [r4, #1]
	b _021E7076
_021E7074:
	strb r5, [r4, #1]
_021E7076:
	ldrb r0, [r4]
	movs r1, #2
	bics r0, r1
	ldr r1, [sp, #0x18]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1e
	orrs r0, r1
	strb r0, [r4]
	ldr r0, [sp, #0x20]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x28]
	str r0, [r4, #0x18]
	ldr r0, [sp, #0x2c]
	str r0, [r4, #0x1c]
	adds r0, r6, #0
_021E709C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E70A0: .4byte 0x0000FFFF
	thumb_func_end ov100_021E7014

	thumb_func_start ov100_021E70A4
ov100_021E70A4: @ 0x021E70A4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5]
	cmp r1, r0
	bhs _021E70BA
	ldr r0, [r5, #4]
	lsls r4, r1, #5
	ldrb r0, [r0, r4]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _021E70BE
_021E70BA:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E70BE:
	ldrh r0, [r5, #2]
	cmp r0, r1
	bne _021E70CC
	ldr r0, _021E70F8 @ =0x0000FFFF
	strh r0, [r5, #2]
	movs r0, #0
	str r0, [r5, #8]
_021E70CC:
	ldr r0, [r5, #4]
	movs r1, #0
	adds r2, r0, r4
	ldrb r3, [r2, #2]
	ldr r0, [r2, #4]
	movs r2, #0xc
	muls r2, r3, r2
	blx FUN_020D4994
	ldr r0, [r5, #4]
	adds r0, r0, r4
	ldr r0, [r0, #4]
	bl FUN_0201AB0C
	ldr r0, [r5, #4]
	movs r1, #0
	adds r0, r0, r4
	movs r2, #0x20
	blx FUN_020D4994
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E70F8: .4byte 0x0000FFFF
	thumb_func_end ov100_021E70A4

	thumb_func_start ov100_021E70FC
ov100_021E70FC: @ 0x021E70FC
	ldrh r1, [r0]
	movs r3, #0
	cmp r1, #0
	bls _021E711E
	ldr r0, [r0, #4]
_021E7106:
	lsls r2, r3, #5
	ldrb r2, [r0, r2]
	lsls r2, r2, #0x1f
	lsrs r2, r2, #0x1f
	bne _021E7114
	adds r0, r3, #0
	bx lr
_021E7114:
	adds r2, r3, #1
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	cmp r3, r1
	blo _021E7106
_021E711E:
	ldr r0, _021E7124 @ =0x0000FFFF
	bx lr
	nop
_021E7124: .4byte 0x0000FFFF
	thumb_func_end ov100_021E70FC

	thumb_func_start ov100_021E7128
ov100_021E7128: @ 0x021E7128
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r1, _021E71B0 @ =0x0000FFFF
	adds r5, r2, #0
	cmp r6, r1
	bne _021E7138
	ldr r4, [r0, #8]
	b _021E7150
_021E7138:
	ldrh r1, [r0]
	cmp r6, r1
	bhs _021E714C
	ldr r1, [r0, #4]
	lsls r0, r6, #5
	adds r4, r1, r0
	ldrb r0, [r1, r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _021E7150
_021E714C:
	ldr r0, _021E71B0 @ =0x0000FFFF
	pop {r4, r5, r6, pc}
_021E7150:
	ldrb r0, [r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	ldr r0, [r4, #0x10]
	bne _021E7184
	adds r1, r5, #0
	bl FUN_0200DCE0
	ldrb r0, [r4]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _021E71AC
	ldr r0, [r4, #0x14]
	adds r1, r5, #0
	bl FUN_0200DCE0
	ldr r0, [r4, #0x18]
	adds r1, r5, #0
	bl FUN_0200DCE0
	ldr r0, [r4, #0x1c]
	adds r1, r5, #0
	bl FUN_0200DCE0
	b _021E71AC
_021E7184:
	adds r1, r5, #0
	bl FUN_0200DCE8
	ldrb r0, [r4]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _021E71AC
	ldr r0, [r4, #0x14]
	adds r1, r5, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x18]
	adds r1, r5, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x1c]
	adds r1, r5, #0
	bl FUN_0200DCE8
_021E71AC:
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E71B0: .4byte 0x0000FFFF
	thumb_func_end ov100_021E7128

	thumb_func_start ov100_021E71B4
ov100_021E71B4: @ 0x021E71B4
	push {r3, r4, r5, lr}
	ldr r2, _021E72F4 @ =0x0000FFFF
	cmp r1, r2
	bne _021E71C0
	ldr r4, [r0, #8]
	b _021E71CE
_021E71C0:
	ldrh r2, [r0]
	cmp r1, r2
	blo _021E71C8
	b _021E72F2
_021E71C8:
	ldr r2, [r0, #4]
	lsls r0, r1, #5
	adds r4, r2, r0
_021E71CE:
	ldrb r1, [r4, #1]
	movs r0, #0xc
	ldr r2, [r4, #4]
	muls r0, r1, r0
	adds r5, r2, r0
	ldrb r0, [r4]
	lsls r1, r0, #0x1e
	lsrs r1, r1, #0x1f
	bne _021E726A
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	ldr r0, [r4, #0x10]
	bne _021E71F2
	ldrb r1, [r5, #6]
	ldrb r2, [r5, #7]
	bl FUN_0200DD88
	pop {r3, r4, r5, pc}
_021E71F2:
	movs r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	adds r1, r2, r1
	movs r2, #0xa
	ldrsb r2, [r5, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	movs r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x14]
	adds r1, r2, r1
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	movs r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x18]
	adds r1, r2, r1
	movs r2, #0xa
	ldrsb r2, [r5, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	movs r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x1c]
	adds r1, r2, r1
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	pop {r3, r4, r5, pc}
_021E726A:
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	ldr r0, [r4, #0x10]
	bne _021E727C
	ldrb r1, [r5, #6]
	ldrb r2, [r5, #7]
	bl FUN_0200DDB8
	pop {r3, r4, r5, pc}
_021E727C:
	movs r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	adds r1, r2, r1
	movs r2, #0xa
	ldrsb r2, [r5, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	movs r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x14]
	adds r1, r2, r1
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	movs r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x18]
	adds r1, r2, r1
	movs r2, #0xa
	ldrsb r2, [r5, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	movs r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x1c]
	adds r1, r2, r1
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
_021E72F2:
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E72F4: .4byte 0x0000FFFF
	thumb_func_end ov100_021E71B4

	thumb_func_start ov100_021E72F8
ov100_021E72F8: @ 0x021E72F8
	push {r4, lr}
	adds r4, r1, #0
	ldrh r1, [r0]
	cmp r4, r1
	blo _021E7306
	ldr r0, _021E7330 @ =0x0000FFFF
	pop {r4, pc}
_021E7306:
	ldr r1, [r0, #4]
	lsls r3, r4, #5
	adds r1, r1, r3
	str r1, [r0, #8]
	strh r4, [r0, #2]
	cmp r2, #0xff
	beq _021E7326
	ldr r1, [r0, #4]
	adds r3, r1, r3
	ldrb r1, [r3, #2]
	cmp r2, r1
	blo _021E7324
	movs r1, #0
	strb r1, [r3, #1]
	b _021E7326
_021E7324:
	strb r2, [r3, #1]
_021E7326:
	ldr r1, _021E7330 @ =0x0000FFFF
	bl ov100_021E71B4
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
_021E7330: .4byte 0x0000FFFF
	thumb_func_end ov100_021E72F8

	thumb_func_start ov100_021E7334
ov100_021E7334: @ 0x021E7334
	ldr r0, [r0, #8]
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
	thumb_func_end ov100_021E7334

	thumb_func_start ov100_021E733C
ov100_021E733C: @ 0x021E733C
	ldr r2, _021E7364 @ =0x0000FFFF
	cmp r1, r2
	bne _021E7348
	ldr r0, [r0, #8]
	ldrb r0, [r0, #1]
	bx lr
_021E7348:
	ldrh r2, [r0]
	cmp r1, r2
	bhs _021E735A
	lsls r2, r1, #5
	ldr r1, [r0, #4]
	ldrb r0, [r1, r2]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _021E735E
_021E735A:
	movs r0, #0
	bx lr
_021E735E:
	adds r0, r1, r2
	ldrb r0, [r0, #1]
	bx lr
	.align 2, 0
_021E7364: .4byte 0x0000FFFF
	thumb_func_end ov100_021E733C

	thumb_func_start ov100_021E7368
ov100_021E7368: @ 0x021E7368
	push {r3, r4}
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021E73A8
	ldrb r3, [r0, #1]
	movs r2, #0xc
	ldr r4, [r0, #4]
	muls r2, r3, r2
	adds r2, r4, r2
	cmp r1, #3
	bhi _021E739E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E738A: @ jump table
	.2byte _021E739E - _021E738A - 2 @ case 0
	.2byte _021E7392 - _021E738A - 2 @ case 1
	.2byte _021E7396 - _021E738A - 2 @ case 2
	.2byte _021E739A - _021E738A - 2 @ case 3
_021E7392:
	ldrb r2, [r2, #3]
	b _021E73A0
_021E7396:
	ldrb r2, [r2, #4]
	b _021E73A0
_021E739A:
	ldrb r2, [r2, #5]
	b _021E73A0
_021E739E:
	ldrb r2, [r2, #2]
_021E73A0:
	ldrb r1, [r0, #3]
	cmp r2, r1
	bhi _021E73A8
	strb r2, [r0, #1]
_021E73A8:
	pop {r3, r4}
	bx lr
	thumb_func_end ov100_021E7368

	thumb_func_start ov100_021E73AC
ov100_021E73AC: @ 0x021E73AC
	push {r4, lr}
	adds r4, r0, #0
	bl ov100_021E7368
	ldr r1, _021E73C4 @ =0x0000FFFF
	adds r0, r4, #0
	bl ov100_021E71B4
	ldr r0, [r4, #8]
	ldrb r0, [r0, #1]
	pop {r4, pc}
	nop
_021E73C4: .4byte 0x0000FFFF
	thumb_func_end ov100_021E73AC

	thumb_func_start ov100_021E73C8
ov100_021E73C8: @ 0x021E73C8
	ldr r3, _021E73D0 @ =ov100_021E73D4
	adds r2, r1, #0
	ldrh r1, [r0, #2]
	bx r3
	.align 2, 0
_021E73D0: .4byte ov100_021E73D4
	thumb_func_end ov100_021E73C8

	thumb_func_start ov100_021E73D4
ov100_021E73D4: @ 0x021E73D4
	push {r3, r4, r5, lr}
	ldr r3, _021E7410 @ =0x0000FFFF
	cmp r1, r3
	bne _021E73E2
	ldr r4, [r0, #8]
	ldrh r1, [r0, #2]
	b _021E73FA
_021E73E2:
	ldrh r3, [r0]
	cmp r1, r3
	bhs _021E73F6
	ldr r5, [r0, #4]
	lsls r3, r1, #5
	adds r4, r5, r3
	ldrb r3, [r5, r3]
	lsls r3, r3, #0x1f
	lsrs r3, r3, #0x1f
	bne _021E73FA
_021E73F6:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E73FA:
	ldrb r3, [r4, #3]
	cmp r3, r2
	bhs _021E7404
	movs r2, #0
	b _021E7404
_021E7404:
	strb r2, [r4, #1]
	bl ov100_021E71B4
	ldrb r0, [r4, #1]
	pop {r3, r4, r5, pc}
	nop
_021E7410: .4byte 0x0000FFFF
	thumb_func_end ov100_021E73D4

	thumb_func_start ov100_021E7414
ov100_021E7414: @ 0x021E7414
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	ldr r2, _021E749C @ =0x0000FFFF
	cmp r1, r2
	bne _021E7420
	ldrh r1, [r0, #2]
_021E7420:
	ldrh r2, [r0]
	cmp r1, r2
	bhs _021E7498
	ldr r2, [r0, #4]
	lsls r0, r1, #5
	ldrb r1, [r2, r0]
	adds r4, r2, r0
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	beq _021E7498
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	bne _021E746A
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	bne _021E7450
	ldr r0, [r4, #0x10]
	bl FUN_02024964
	ldr r0, [r4, #0x10]
	adds r1, r5, #0
	bl FUN_0200DC70
	pop {r4, r5, r6, pc}
_021E7450:
	movs r6, #0
_021E7452:
	ldr r0, [r4, #0x10]
	bl FUN_02024964
	ldr r0, [r4, #0x10]
	adds r1, r5, #0
	bl FUN_0200DC70
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _021E7452
	pop {r4, r5, r6, pc}
_021E746A:
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	bne _021E7480
	ldr r0, [r4, #0x10]
	bl FUN_0200DCAC
	ldr r0, [r4, #0x10]
	adds r1, r5, #0
	bl FUN_0200DC78
	pop {r4, r5, r6, pc}
_021E7480:
	movs r6, #0
_021E7482:
	ldr r0, [r4, #0x10]
	bl FUN_0200DCAC
	ldr r0, [r4, #0x10]
	adds r1, r5, #0
	bl FUN_0200DC78
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _021E7482
_021E7498:
	pop {r4, r5, r6, pc}
	nop
_021E749C: .4byte 0x0000FFFF
	thumb_func_end ov100_021E7414

	.rodata

_021E74A0:
	.byte 0x03, 0x04, 0x04, 0x05, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x01, 0x00, 0xFF, 0x01, 0x02, 0x00, 0x01, 0xFF, 0x02
	.byte 0x00, 0x01, 0x02, 0x03, 0xA0, 0xC0, 0x08, 0x38, 0xA0, 0xC0, 0x38, 0x68, 0xA0, 0xC0, 0x68, 0x98
	.byte 0xA0, 0xC0, 0x98, 0xC8, 0xA0, 0xC0, 0xCE, 0xFE, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01
	.byte 0xFF, 0xFF, 0x20, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x03, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0xB0, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x04, 0x00, 0x01, 0x00, 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x01, 0xFF, 0xFF, 0x20, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x02, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0x80, 0xB0, 0xF0, 0x10, 0xF6, 0x0A
	.byte 0x03, 0x00, 0x01, 0x03, 0xFF, 0xFF, 0xB0, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x04, 0x00, 0x02, 0x00
	.byte 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x00, 0x00, 0x03, 0x01, 0xFF, 0xFF, 0x20, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x01, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0x50, 0xB0, 0xF0, 0x10, 0xF6, 0x0A
	.byte 0x03, 0x00, 0x01, 0x03, 0xFF, 0xFF, 0xB0, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x04, 0x00, 0x02, 0x00
	.byte 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x01, 0xFF, 0xFF, 0x20, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x01, 0x00, 0x00, 0x02
	.byte 0xFF, 0xFF, 0x50, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x02, 0x00, 0x01, 0x03, 0xFF, 0xFF, 0x80, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x03, 0x00, 0x02, 0x04, 0xFF, 0xFF, 0xB0, 0xB0, 0xF0, 0x10, 0xF6, 0x0A
	.byte 0x04, 0x00, 0x03, 0x00, 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x49, 0xF8, 0x1E, 0x02
	.byte 0x91, 0xF8, 0x1E, 0x02, 0x41, 0xF9, 0x1E, 0x02, 0x65, 0x00, 0x00, 0x00, 0xE9, 0xE8, 0x1E, 0x02
	.byte 0x25, 0xE9, 0x1E, 0x02, 0xA5, 0xE9, 0x1E, 0x02, 0x65, 0x00, 0x00, 0x00, 0x41, 0x77, 0x1E, 0x02
	.byte 0xB9, 0x77, 0x1E, 0x02, 0x69, 0x78, 0x1E, 0x02, 0x66, 0x00, 0x00, 0x00, 0x41, 0x77, 0x1E, 0x02
	.byte 0x9D, 0x77, 0x1E, 0x02, 0x35, 0x78, 0x1E, 0x02, 0x65, 0x00, 0x00, 0x00, 0x81, 0x44, 0x1F, 0x02
	.byte 0xBD, 0x44, 0x1F, 0x02, 0x2D, 0x45, 0x1F, 0x02, 0x65, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01
	.byte 0x2A, 0x00, 0x2B, 0x00, 0x29, 0x00, 0x28, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x52, 0x00, 0x2E, 0x00
	.byte 0x2F, 0x00, 0x2D, 0x00, 0x2C, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x53, 0x00, 0x26, 0x00, 0x27, 0x00
	.byte 0x25, 0x00, 0x24, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x51, 0x00, 0x22, 0x00, 0x23, 0x00, 0x21, 0x00
	.byte 0x20, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x50, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x9C, 0x76, 0x1E, 0x02, 0x88, 0x76, 0x1E, 0x02, 0x50, 0x76, 0x1E, 0x02, 0x80, 0x00, 0x00, 0x00
	.byte 0x9C, 0x76, 0x1E, 0x02, 0x88, 0x76, 0x1E, 0x02, 0x6C, 0x76, 0x1E, 0x02, 0xC0, 0x00, 0x00, 0x00
	.byte 0x9C, 0x76, 0x1E, 0x02, 0x88, 0x76, 0x1E, 0x02, 0x7A, 0x76, 0x1E, 0x02, 0x80, 0x00, 0x00, 0x00
	.byte 0x9C, 0x76, 0x1E, 0x02, 0x88, 0x76, 0x1E, 0x02, 0x5E, 0x76, 0x1E, 0x02, 0x80, 0x00, 0x00, 0x00
	.byte 0x9C, 0x76, 0x1E, 0x02, 0x88, 0x76, 0x1E, 0x02, 0x7A, 0x76, 0x1E, 0x02, 0x02, 0x02, 0x02, 0x03
	.byte 0x01, 0x01, 0x01, 0x01

	.data

_021E7720:
	.byte 0xDC, 0x74, 0x1E, 0x02, 0x28, 0x75, 0x1E, 0x02, 0x58, 0x75, 0x1E, 0x02, 0xC0, 0x75, 0x1E, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x021E7740
