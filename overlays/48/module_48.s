
	thumb_func_start ov48_02258800
ov48_02258800: @ 0x02258800
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	bl FUN_020072A4
	movs r2, #5
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x70
	lsls r2, r2, #0x10
	bl FUN_0201A910
	ldr r1, _0225890C @ =0x0000C724
	adds r0, r4, #0
	movs r2, #0x70
	bl FUN_02007280
	ldr r2, _0225890C @ =0x0000C724
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r0, [r5, #4]
	bl FUN_0202CA44
	str r0, [r4, #0xc]
	ldr r0, [r5, #4]
	bl FUN_02028EA8
	str r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	bl FUN_0202CA8C
	str r0, [r4, #0x14]
	ldr r0, [r4, #0xc]
	bl FUN_0202CA90
	str r0, [r4, #0x18]
	ldr r0, [r5, #8]
	adds r1, r5, #0
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov48_022593F4
	adds r0, r4, #0
	ldr r1, [r4, #0x10]
	adds r0, #0x20
	movs r2, #0x70
	bl ov48_02259464
	movs r0, #0x5e
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #0x20
	movs r2, #0x70
	bl ov48_02259824
	movs r0, #0x5a
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x70
	bl ov48_0225B068
	movs r0, #0x70
	str r0, [sp, #4]
	mov r2, sp
	ldr r1, [r4, #4]
	ldr r0, [r4, #8]
	subs r2, r2, #4
	str r1, [r2]
	str r0, [r2, #4]
	movs r0, #0x89
	ldr r3, [r2]
	lsls r0, r0, #2
	adds r2, r4, #0
	ldr r1, [r5]
	adds r0, r4, r0
	adds r2, #0x20
	bl ov48_022598EC
	adds r3, r4, #4
	ldr r0, _02258910 @ =0x0000C3CC
	ldm r3!, {r1, r2}
	adds r0, r4, r0
	movs r3, #0x70
	bl ov48_02259BC0
	ldr r0, _02258914 @ =0x0000C3E0
	movs r2, #0x5a
	adds r1, r4, #0
	lsls r2, r2, #2
	adds r0, r4, r0
	adds r1, #0x20
	adds r2, r4, r2
	movs r3, #0x70
	bl ov48_02259D00
	movs r2, #0x70
	str r2, [sp]
	movs r0, #0xc7
	lsls r0, r0, #8
	adds r1, r4, #0
	adds r2, #0xf8
	ldr r3, [r5, #4]
	adds r0, r4, r0
	adds r1, #0x20
	adds r2, r4, r2
	bl ov48_02259EAC
	ldr r0, _02258918 @ =0x0000C40C
	movs r2, #0x5a
	adds r1, r4, #0
	lsls r2, r2, #2
	adds r0, r4, r0
	adds r1, #0x20
	adds r2, r4, r2
	movs r3, #0x70
	bl ov48_0225A00C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov48_02259130
	ldr r0, _0225891C @ =ov48_02259090
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0225890C: .4byte 0x0000C724
_02258910: .4byte 0x0000C3CC
_02258914: .4byte 0x0000C3E0
_02258918: .4byte 0x0000C40C
_0225891C: .4byte ov48_02259090
	thumb_func_end ov48_02258800

	thumb_func_start ov48_02258920
ov48_02258920: @ 0x02258920
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02007290
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_020072A4
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #6
	bhi _022589EE
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02258948: @ jump table
	.2byte _02258956 - _02258948 - 2 @ case 0
	.2byte _0225897C - _02258948 - 2 @ case 1
	.2byte _0225898C - _02258948 - 2 @ case 2
	.2byte _022589EE - _02258948 - 2 @ case 3
	.2byte _022589EE - _02258948 - 2 @ case 4
	.2byte _022589C0 - _02258948 - 2 @ case 5
	.2byte _022589E0 - _02258948 - 2 @ case 6
_02258956:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5, #0xc]
	movs r1, #1
	bl FUN_0222A520
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _022589EE
_0225897C:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _022589EE
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _022589EE
_0225898C:
	adds r0, r7, #0
	bl ov48_02258F64
	adds r6, r0, #0
	adds r0, r7, #0
	bl ov48_02259030
	ldr r0, [r5, #0xc]
	bl FUN_0222A330
	cmp r0, #1
	bne _022589AC
	ldr r0, [r5, #0xc]
	bl FUN_0222A4A8
	movs r6, #1
_022589AC:
	bl FUN_0222D844
	cmp r0, #1
	bne _022589B6
	movs r6, #1
_022589B6:
	cmp r6, #1
	bne _022589EE
	movs r0, #5
	str r0, [r4]
	b _022589EE
_022589C0:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _022589EE
_022589E0:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _022589EE
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_022589EE:
	adds r0, r7, #0
	bl ov48_02259050
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov48_02258920

	thumb_func_start ov48_022589FC
ov48_022589FC: @ 0x022589FC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_020072A4
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	ldr r0, _02258A74 @ =0x0000C40C
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #0x20
	bl ov48_0225A108
	movs r0, #0xc7
	lsls r0, r0, #8
	adds r0, r4, r0
	bl ov48_02259F14
	ldr r0, _02258A78 @ =0x0000C3E0
	adds r0, r4, r0
	bl ov48_02259D94
	ldr r0, _02258A7C @ =0x0000C3CC
	adds r0, r4, r0
	bl ov48_02259C38
	movs r0, #0x5e
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov48_02259868
	movs r0, #0x89
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov48_02259984
	movs r0, #0x5a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov48_0225B0A4
	adds r4, #0x20
	adds r0, r4, #0
	bl ov48_022594A8
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x70
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_02258A74: .4byte 0x0000C40C
_02258A78: .4byte 0x0000C3E0
_02258A7C: .4byte 0x0000C3CC
	thumb_func_end ov48_022589FC

	thumb_func_start ov48_02258A80
ov48_02258A80: @ 0x02258A80
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r5, r0, #0
	str r1, [sp, #0xc]
	movs r0, #0x62
	adds r1, r2, #0
	str r2, [sp, #0x10]
	bl FUN_02007688
	movs r2, #0
	str r2, [r5]
	str r2, [sp]
	add r1, sp, #0x2c
	str r1, [sp, #4]
	ldr r3, [sp, #0x10]
	movs r1, #0x12
	str r0, [sp, #0x24]
	bl FUN_02007CAC
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x2c]
	movs r1, #6
	blx FUN_020F2BA4
	adds r7, r0, #0
	ldr r0, [sp, #0x20]
	movs r6, #1
	adds r4, r0, #6
	cmp r7, #1
	ble _02258AEE
_02258ABC:
	ldrh r0, [r4]
	cmp r0, #2
	beq _02258AE6
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	movs r2, #2
	str r0, [sp, #8]
	movs r3, #4
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r5]
	adds r0, r5, #0
	bl ov48_02258B7C
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
_02258AE6:
	adds r6, r6, #1
	adds r4, r4, #6
	cmp r6, r7
	blt _02258ABC
_02258AEE:
	ldr r0, [sp, #0x20]
	bl FUN_0201AB0C
	movs r7, #1
	bl FUN_02091664
	str r0, [sp, #0x18]
	cmp r0, #1
	ble _02258B72
_02258B00:
	adds r0, r7, #0
	bl FUN_020916F8
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	add r0, sp, #0x28
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x10]
	movs r2, #0
	bl FUN_02007CAC
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	movs r6, #1
	lsrs r0, r0, #2
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	adds r4, r0, #4
	ldr r0, [sp, #0x14]
	cmp r0, #1
	ble _02258B64
_02258B2E:
	adds r0, r7, #0
	bl FUN_020916DC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	movs r2, #0
	str r0, [sp, #8]
	movs r3, #2
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r5]
	adds r0, r5, #0
	bl ov48_02258B7C
	ldr r0, [r5]
	adds r6, r6, #1
	adds r0, r0, #1
	str r0, [r5]
	ldr r0, [sp, #0x14]
	adds r4, r4, #4
	cmp r6, r0
	blt _02258B2E
_02258B64:
	ldr r0, [sp, #0x1c]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x18]
	adds r7, r7, #1
	cmp r7, r0
	blt _02258B00
_02258B72:
	ldr r0, [sp, #0x24]
	bl FUN_0200770C
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov48_02258A80

	thumb_func_start ov48_02258B7C
ov48_02258B7C: @ 0x02258B7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r5, _02258BF0 @ =0x0225B1EC
	adds r7, r2, #0
	adds r6, r3, #0
	adds r4, r0, #0
	mov ip, r1
	add r3, sp, #0xc
	movs r2, #4
_02258B8E:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02258B8E
	ldr r0, [r5]
	movs r1, #0x30
	str r0, [r3]
	mov r0, ip
	adds r5, r0, #0
	muls r5, r1, r5
	adds r0, r4, r5
	strh r7, [r0, #4]
	strh r6, [r0, #6]
	movs r0, #0
	str r0, [sp, #8]
	add r0, sp, #0xc
	add r1, sp, #0
	str r7, [sp]
	str r6, [sp, #4]
	bl ov48_02258C6C
	adds r3, r4, r5
	add r6, sp, #0xc
	adds r3, #8
	movs r2, #4
_02258BC0:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02258BC0
	ldr r0, [r6]
	str r0, [r3]
	ldr r0, [sp, #0x50]
	cmp r0, #0
	beq _02258BE0
	add r2, sp, #0x38
	ldrh r1, [r2, #0x10]
	ldrh r2, [r2, #0x14]
	bl ov48_02259A68
	adds r1, r4, r5
	strh r0, [r1, #0x2c]
_02258BE0:
	add r0, sp, #0x38
	ldrh r2, [r0, #0x10]
	adds r1, r4, r5
	strh r2, [r1, #0x2e]
	ldrh r0, [r0, #0x14]
	strh r0, [r1, #0x30]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02258BF0: .4byte 0x0225B1EC
	thumb_func_end ov48_02258B7C

	thumb_func_start ov48_02258BF4
ov48_02258BF4: @ 0x02258BF4
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r1, #0
	ldr r1, [r4, #4]
	ldr r3, _02258C68 @ =0x021094DC
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r1, r1, #4
	lsls r2, r1, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	adds r5, r0, #0
	bl FUN_020CB0EC
	ldr r0, [r4]
	ldr r3, _02258C68 @ =0x021094DC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl FUN_020CB0D0
	adds r0, r5, #0
	add r1, sp, #0
	adds r2, r5, #0
	blx FUN_020CB410
	ldr r0, [r4, #8]
	ldr r3, _02258C68 @ =0x021094DC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl FUN_020CB108
	adds r0, r5, #0
	add r1, sp, #0
	adds r2, r5, #0
	blx FUN_020CB410
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_02258C68: .4byte 0x021094DC
	thumb_func_end ov48_02258BF4

	thumb_func_start ov48_02258C6C
ov48_02258C6C: @ 0x02258C6C
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r1, #0
	ldr r1, [r4]
	ldr r3, _02258CE0 @ =0x021094DC
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r1, r1, #4
	lsls r2, r1, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	adds r5, r0, #0
	bl FUN_020CB0EC
	ldr r0, [r4, #4]
	ldr r3, _02258CE0 @ =0x021094DC
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl FUN_020CB0D0
	adds r0, r5, #0
	add r1, sp, #0
	adds r2, r5, #0
	blx FUN_020CB410
	ldr r0, [r4, #8]
	ldr r3, _02258CE0 @ =0x021094DC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r2, r0, #1
	adds r1, r2, #1
	lsls r1, r1, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl FUN_020CB108
	adds r0, r5, #0
	add r1, sp, #0
	adds r2, r5, #0
	blx FUN_020CB410
	add sp, #0x24
	pop {r4, r5, pc}
	.align 2, 0
_02258CE0: .4byte 0x021094DC
	thumb_func_end ov48_02258C6C

	thumb_func_start ov48_02258CE4
ov48_02258CE4: @ 0x02258CE4
	push {r3, r4, r5, r6, r7, lr}
	mov lr, r0
	ldr r0, _02258D4C @ =0x021D114C
	mov ip, r1
	ldrh r5, [r0, #0x20]
	movs r1, #0
	adds r7, r2, #0
	adds r6, r3, #0
	ldr r0, _02258D50 @ =0x0000FFFF
	adds r2, r1, #0
	adds r3, r1, #0
	adds r4, r1, #0
	cmp r5, r0
	beq _02258D14
	mov r0, lr
	subs r3, r5, r0
	bpl _02258D0E
	subs r0, r1, #1
	eors r3, r0
	movs r1, #0x10
	b _02258D14
_02258D0E:
	cmp r3, #0
	ble _02258D14
	movs r1, #0x20
_02258D14:
	str r1, [r7]
	movs r1, #0x3f
	adds r0, r3, #0
	ands r0, r1
	str r0, [r6]
	ldr r0, _02258D4C @ =0x021D114C
	ldrh r3, [r0, #0x22]
	ldr r0, _02258D50 @ =0x0000FFFF
	cmp r3, r0
	beq _02258D3C
	mov r0, ip
	subs r4, r3, r0
	bpl _02258D36
	subs r1, #0x40
	eors r4, r1
	movs r2, #0x80
	b _02258D3C
_02258D36:
	cmp r4, #0
	ble _02258D3C
	movs r2, #0x40
_02258D3C:
	ldr r0, [sp, #0x18]
	adds r1, r4, #0
	str r2, [r0]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02258D4C: .4byte 0x021D114C
_02258D50: .4byte 0x0000FFFF
	thumb_func_end ov48_02258CE4

	thumb_func_start ov48_02258D54
ov48_02258D54: @ 0x02258D54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x5e
	lsls r0, r0, #2
	str r1, [sp]
	adds r0, r4, r0
	add r1, sp, #0xc
	adds r7, r2, #0
	bl ov48_022598CC
	ldr r0, _02258EF4 @ =0x0000C3E0
	movs r1, #0
	adds r0, r4, r0
	bl ov48_02259E5C
	adds r6, r0, #0
	ldr r0, _02258EF4 @ =0x0000C3E0
	movs r1, #1
	adds r0, r4, r0
	bl ov48_02259E5C
	str r0, [sp, #4]
	ldr r0, _02258EF4 @ =0x0000C3E0
	movs r1, #2
	adds r0, r4, r0
	bl ov48_02259E5C
	adds r5, r0, #0
	ldr r0, _02258EF8 @ =0x0000C3CC
	adds r0, r4, r0
	bl ov48_02259CFC
	ldr r2, [sp, #0x10]
	adds r1, r0, #0
	lsls r2, r2, #0x10
	ldr r0, [sp, #0xc]
	asrs r2, r2, #0x10
	mov ip, r2
	lsls r0, r0, #0x10
	ldr r2, [sp]
	movs r3, #1
	asrs r0, r0, #0x10
	tst r2, r3
	bne _02258DB8
	adds r2, r6, #0
	tst r2, r3
	beq _02258DCC
_02258DB8:
	ldr r0, [r4, #4]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _02258DC6
	movs r0, #1
	str r0, [sp, #8]
_02258DC6:
	ldr r0, [sp, #8]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_02258DCC:
	cmp r1, #0
	bne _02258DF4
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _02258DDA
	cmp r5, #0
	beq _02258DEE
_02258DDA:
	ldr r2, [sp, #4]
	movs r1, #0x55
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	movs r1, #0x55
	muls r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	b _02258E16
_02258DEE:
	lsls r3, r3, #9
	adds r5, r3, #0
	b _02258E16
_02258DF4:
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _02258DFE
	cmp r5, #0
	beq _02258E12
_02258DFE:
	ldr r2, [sp, #4]
	movs r1, #0xa
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	movs r1, #0xa
	muls r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	b _02258E16
_02258E12:
	movs r3, #0x20
	adds r5, r3, #0
_02258E16:
	movs r2, #0x20
	adds r1, r7, #0
	tst r1, r2
	bne _02258E24
	adds r1, r6, #0
	tst r1, r2
	beq _02258E44
_02258E24:
	ldr r1, [r4, #4]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	cmp r1, #1
	bne _02258E36
	ldr r1, [sp, #0x10]
	adds r1, r1, r3
	str r1, [sp, #0x10]
	b _02258E44
_02258E36:
	ldr r2, _02258EFC @ =0xFFFFD820
	mov r1, ip
	cmp r1, r2
	bge _02258E44
	ldr r1, [sp, #0x10]
	adds r1, r1, r3
	str r1, [sp, #0x10]
_02258E44:
	movs r2, #0x10
	adds r1, r7, #0
	tst r1, r2
	bne _02258E52
	adds r1, r6, #0
	tst r1, r2
	beq _02258E72
_02258E52:
	ldr r1, [r4, #4]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	cmp r1, #1
	bne _02258E64
	ldr r1, [sp, #0x10]
	subs r1, r1, r3
	str r1, [sp, #0x10]
	b _02258E72
_02258E64:
	ldr r2, _02258F00 @ =0xFFFFCC80
	mov r1, ip
	cmp r1, r2
	ble _02258E72
	ldr r1, [sp, #0x10]
	subs r1, r1, r3
	str r1, [sp, #0x10]
_02258E72:
	movs r1, #0x40
	adds r2, r7, #0
	tst r2, r1
	bne _02258E7E
	tst r1, r6
	beq _02258EAA
_02258E7E:
	ldr r1, [r4, #4]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	cmp r1, #1
	bne _02258E9E
	movs r1, #0x3e
	adds r2, r0, r5
	lsls r1, r1, #8
	cmp r2, r1
	bge _02258E9A
	ldr r1, [sp, #0xc]
	adds r1, r1, r5
	str r1, [sp, #0xc]
	b _02258EAA
_02258E9A:
	str r1, [sp, #0xc]
	b _02258EAA
_02258E9E:
	ldr r1, _02258F04 @ =0x00002020
	cmp r0, r1
	bge _02258EAA
	ldr r1, [sp, #0xc]
	adds r1, r1, r5
	str r1, [sp, #0xc]
_02258EAA:
	movs r1, #0x80
	adds r2, r7, #0
	tst r2, r1
	bne _02258EB6
	tst r1, r6
	beq _02258EE2
_02258EB6:
	ldr r1, [r4, #4]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	cmp r1, #1
	bne _02258ED4
	subs r1, r0, r5
	ldr r0, _02258F08 @ =0xFFFFC200
	cmp r1, r0
	ble _02258ED0
	ldr r0, [sp, #0xc]
	subs r0, r0, r5
	str r0, [sp, #0xc]
	b _02258EE2
_02258ED0:
	str r0, [sp, #0xc]
	b _02258EE2
_02258ED4:
	movs r1, #0x13
	lsls r1, r1, #8
	cmp r0, r1
	ble _02258EE2
	ldr r0, [sp, #0xc]
	subs r0, r0, r5
	str r0, [sp, #0xc]
_02258EE2:
	movs r0, #0x5e
	lsls r0, r0, #2
	adds r0, r4, r0
	add r1, sp, #0xc
	bl ov48_022598DC
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02258EF4: .4byte 0x0000C3E0
_02258EF8: .4byte 0x0000C3CC
_02258EFC: .4byte 0xFFFFD820
_02258F00: .4byte 0xFFFFCC80
_02258F04: .4byte 0x00002020
_02258F08: .4byte 0xFFFFC200
	thumb_func_end ov48_02258D54

	thumb_func_start ov48_02258F0C
ov48_02258F0C: @ 0x02258F0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	blt _02258F20
	ldr r1, _02258F60 @ =0x0000FFFF
	blx FUN_020F2998
	str r1, [r4]
	b _02258F36
_02258F20:
	bge _02258F24
	rsbs r0, r0, #0
_02258F24:
	ldr r1, _02258F60 @ =0x0000FFFF
	blx FUN_020F2998
	adds r1, r0, #1
	ldr r0, _02258F60 @ =0x0000FFFF
	ldr r2, [r4]
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [r4]
_02258F36:
	ldr r0, [r4, #4]
	cmp r0, #0
	blt _02258F46
	ldr r1, _02258F60 @ =0x0000FFFF
	blx FUN_020F2998
	str r1, [r4, #4]
	pop {r4, pc}
_02258F46:
	bge _02258F4A
	rsbs r0, r0, #0
_02258F4A:
	ldr r1, _02258F60 @ =0x0000FFFF
	blx FUN_020F2998
	adds r1, r0, #1
	ldr r0, _02258F60 @ =0x0000FFFF
	ldr r2, [r4, #4]
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [r4, #4]
	pop {r4, pc}
	nop
_02258F60: .4byte 0x0000FFFF
	thumb_func_end ov48_02258F0C

	thumb_func_start ov48_02258F64
ov48_02258F64: @ 0x02258F64
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4]
	cmp r1, #3
	bhi _0225901C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02258F7A: @ jump table
	.2byte _02258F82 - _02258F7A - 2 @ case 0
	.2byte _02258FA8 - _02258F7A - 2 @ case 1
	.2byte _02258FC0 - _02258F7A - 2 @ case 2
	.2byte _02258FE2 - _02258F7A - 2 @ case 3
_02258F82:
	bl ov48_0225909C
	cmp r0, #0
	beq _02259020
	cmp r0, #1
	beq _02258F94
	cmp r0, #2
	beq _02258FA2
	b _02259020
_02258F94:
	ldr r0, _02259024 @ =0x0000C3CC
	adds r0, r4, r0
	bl ov48_02259C4C
	movs r0, #1
	strh r0, [r4]
	b _02259020
_02258FA2:
	movs r0, #2
	strh r0, [r4]
	b _02259020
_02258FA8:
	ldr r0, _02259024 @ =0x0000C3CC
	movs r1, #0x89
	lsls r1, r1, #2
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov48_02259C78
	cmp r0, #1
	bne _02259020
	movs r0, #0
	strh r0, [r4]
	b _02259020
_02258FC0:
	movs r0, #0xc7
	lsls r0, r0, #8
	adds r0, r4, r0
	bl ov48_02259F48
	ldr r0, _02259028 @ =0x0000C40C
	adds r0, r4, r0
	bl ov48_0225A1D0
	ldr r0, _0225902C @ =0x0000C3E0
	adds r0, r4, r0
	bl ov48_02259E78
	ldrh r0, [r4]
	adds r0, r0, #1
	strh r0, [r4]
	b _02259020
_02258FE2:
	movs r0, #0xc7
	lsls r0, r0, #8
	adds r0, r4, r0
	bl ov48_02259F8C
	cmp r0, #0
	beq _02259020
	cmp r0, #1
	beq _02259018
	cmp r0, #2
	bne _02259018
	ldr r0, _02259028 @ =0x0000C40C
	adds r0, r4, r0
	bl ov48_0225A1EC
	movs r0, #0xc7
	lsls r0, r0, #8
	adds r0, r4, r0
	bl ov48_02259FEC
	ldr r0, _0225902C @ =0x0000C3E0
	adds r0, r4, r0
	bl ov48_02259E90
	movs r0, #0
	strh r0, [r4]
	b _02259020
_02259018:
	movs r0, #1
	pop {r4, pc}
_0225901C:
	bl FUN_0202551C
_02259020:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_02259024: .4byte 0x0000C3CC
_02259028: .4byte 0x0000C40C
_0225902C: .4byte 0x0000C3E0
	thumb_func_end ov48_02258F64

	thumb_func_start ov48_02259030
ov48_02259030: @ 0x02259030
	push {r3, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #2]
	cmp r0, #0
	bne _0225904A
	ldr r0, _0225904C @ =0x0000C40C
	movs r1, #0x5a
	lsls r1, r1, #2
	adds r0, r2, r0
	adds r1, r2, r1
	adds r2, #0x20
	bl ov48_0225A158
_0225904A:
	pop {r3, pc}
	.align 2, 0
_0225904C: .4byte 0x0000C40C
	thumb_func_end ov48_02259030

	thumb_func_start ov48_02259050
ov48_02259050: @ 0x02259050
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02026E48
	ldr r0, _0225908C @ =0x0000C3CC
	adds r0, r4, r0
	bl ov48_02259C44
	movs r0, #0x5e
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov48_02259874
	movs r1, #0x89
	lsls r1, r1, #2
	adds r0, r4, r1
	subs r1, #0xac
	adds r1, r4, r1
	bl ov48_022599A0
	adds r4, #0x20
	adds r0, r4, #0
	bl ov48_022594D0
	movs r0, #0
	movs r1, #1
	bl FUN_02026E50
	pop {r4, pc}
	nop
_0225908C: .4byte 0x0000C3CC
	thumb_func_end ov48_02259050

	thumb_func_start ov48_02259090
ov48_02259090: @ 0x02259090
	ldr r3, _02259098 @ =ov48_022594DC
	adds r0, #0x20
	bx r3
	nop
_02259098: .4byte ov48_022594DC
	thumb_func_end ov48_02259090

	thumb_func_start ov48_0225909C
ov48_0225909C: @ 0x0225909C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0225911C @ =0x0000C3E0
	adds r0, r5, r0
	bl ov48_02259DA0
	ldr r0, _0225911C @ =0x0000C3E0
	ldr r1, [r5, r0]
	movs r0, #2
	tst r1, r0
	beq _022590C0
	ldr r0, _02259120 @ =0x000005DD
	bl FUN_0200604C
	add sp, #0xc
	movs r0, #2
	pop {r4, r5, pc}
_022590C0:
	ldr r2, _02259124 @ =0x021D110C
	lsls r0, r0, #9
	ldr r1, [r2, #0x48]
	tst r0, r1
	beq _0225910C
	adds r0, r5, #0
	add r1, sp, #0
	bl ov48_02259188
	cmp r0, #1
	bne _02259116
	ldr r0, _02259128 @ =0x0000C40C
	add r1, sp, #0
	adds r0, r5, r0
	bl ov48_0225A244
	cmp r0, #0
	bne _02259116
	ldr r0, _02259128 @ =0x0000C40C
	add r1, sp, #0
	adds r0, r5, r0
	bl ov48_0225A20C
	cmp r0, #0
	beq _02259116
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl ov48_022593B4
	ldr r0, _0225912C @ =0x000005D6
	bl FUN_0200604C
	b _02259116
_0225910C:
	ldr r2, [r2, #0x44]
	adds r0, r5, #0
	bl ov48_02258D54
	adds r4, r0, #0
_02259116:
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0225911C: .4byte 0x0000C3E0
_02259120: .4byte 0x000005DD
_02259124: .4byte 0x021D110C
_02259128: .4byte 0x0000C40C
_0225912C: .4byte 0x000005D6
	thumb_func_end ov48_0225909C

	thumb_func_start ov48_02259130
ov48_02259130: @ 0x02259130
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0x14]
	ldr r2, [r5, #0x18]
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl ov48_022593B4
	cmp r0, #0
	bne _02259184
	ldr r0, [r4]
	bl ov48_0225B13C
	adds r6, r0, #0
	cmp r6, #0x32
	beq _02259184
	lsls r1, r6, #0x18
	ldr r0, [r4]
	lsrs r1, r1, #0x18
	bl FUN_0222D6B0
	adds r7, r0, #0
	lsls r1, r6, #0x18
	ldr r0, [r4]
	lsrs r1, r1, #0x18
	bl FUN_0222D6D4
	adds r2, r0, #0
	lsls r1, r7, #0x18
	lsls r2, r2, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl ov48_022593B4
	cmp r0, #1
	beq _02259184
	bl FUN_0202551C
_02259184:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov48_02259130

	thumb_func_start ov48_02259188
ov48_02259188: @ 0x02259188
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov48_022591D8
	adds r6, r0, #0
	movs r0, #0x89
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov48_02259BBC
	cmp r6, r0
	blo _022591A6
	movs r0, #0
	pop {r4, r5, r6, pc}
_022591A6:
	adds r2, r5, #0
	adds r2, #0x1c
	ldr r2, [r2]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov48_0225932C
	str r0, [r4]
	movs r0, #0x89
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r6, #0
	bl ov48_02259B84
	str r0, [r4, #4]
	movs r0, #0x89
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r6, #0
	bl ov48_02259BA0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov48_02259188

	thumb_func_start ov48_022591D8
ov48_022591D8: @ 0x022591D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	movs r0, #0x89
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov48_02259BBC
	str r0, [sp, #0xc]
	movs r0, #0x5e
	lsls r0, r0, #2
	adds r0, r5, r0
	add r1, sp, #0x28
	bl ov48_022598CC
	ldr r1, [sp, #0x28]
	adds r0, r1, #0
	subs r0, #0x80
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, #0x80
	str r0, [sp, #4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	adds r1, r0, #0
	subs r1, #0x80
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	adds r1, r0, #0
	adds r1, #0x80
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #0x18]
	subs r2, r1, r6
	bpl _02259224
	rsbs r2, r2, #0
_02259224:
	movs r1, #1
	lsls r1, r1, #8
	cmp r2, r1
	ble _0225925E
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	str r6, [sp, #0x18]
	cmp r6, #0
	ble _02259240
	lsls r0, r1, #8
	subs r0, r6, r0
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	b _02259248
_02259240:
	lsls r0, r1, #8
	adds r0, r6, r0
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
_02259248:
	ldr r0, [sp, #0x18]
	subs r6, #0x80
	adds r0, #0x80
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	subs r0, #0x80
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r0, #0x80
	str r0, [sp, #0x10]
	b _02259264
_0225925E:
	ldr r0, [sp, #0x18]
	str r6, [sp, #0x14]
	str r0, [sp, #0x10]
_02259264:
	ldr r0, [sp, #0xc]
	movs r7, #1
	lsls r7, r7, #8
	movs r4, #0
	str r0, [sp, #8]
	cmp r0, #0
	bls _022592DA
_02259272:
	movs r0, #0x89
	lsls r0, r0, #2
	adds r0, r5, r0
	add r1, sp, #0x1c
	adds r2, r4, #0
	bl ov48_02259B3C
	movs r0, #0x89
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r4, #0
	bl ov48_02259B68
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #4]
	cmp r1, r2
	ble _022592D2
	ldr r2, [sp]
	cmp r1, r2
	bge _022592D2
	ldr r1, [sp, #0x20]
	cmp r1, r6
	ble _022592A6
	ldr r2, [sp, #0x18]
	cmp r1, r2
	blt _022592B2
_022592A6:
	ldr r2, [sp, #0x14]
	cmp r1, r2
	ble _022592D2
	ldr r2, [sp, #0x10]
	cmp r1, r2
	bge _022592D2
_022592B2:
	cmp r0, #3
	beq _022592D2
	add r0, sp, #0x28
	bl ov48_02258F0C
	add r0, sp, #0x1c
	bl ov48_02258F0C
	add r0, sp, #0x28
	add r1, sp, #0x1c
	bl ov48_022592E0
	cmp r0, r7
	bhs _022592D2
	adds r7, r0, #0
	str r4, [sp, #8]
_022592D2:
	ldr r0, [sp, #0xc]
	adds r4, r4, #1
	cmp r4, r0
	blo _02259272
_022592DA:
	ldr r0, [sp, #8]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov48_022591D8

	thumb_func_start ov48_022592E0
ov48_022592E0: @ 0x022592E0
	push {r3, r4, r5, lr}
	ldr r3, [r0]
	ldr r2, [r1]
	subs r4, r3, r2
	bpl _022592EC
	rsbs r4, r4, #0
_022592EC:
	ldr r2, [r0, #4]
	ldr r0, [r1, #4]
	subs r5, r2, r0
	bpl _022592F6
	rsbs r5, r5, #0
_022592F6:
	movs r0, #0xb4
	bl FUN_0201FCD4
	cmp r4, r0
	ble _02259304
	ldr r0, _02259328 @ =0x0000FFFF
	subs r4, r0, r4
_02259304:
	movs r0, #0xb4
	bl FUN_0201FCD4
	cmp r5, r0
	ble _02259312
	ldr r0, _02259328 @ =0x0000FFFF
	subs r5, r0, r5
_02259312:
	adds r1, r4, #0
	adds r0, r5, #0
	muls r1, r4, r1
	muls r0, r5, r0
	adds r0, r1, r0
	lsls r0, r0, #0xc
	blx FUN_020CCBEC
	asrs r0, r0, #0xc
	pop {r3, r4, r5, pc}
	nop
_02259328: .4byte 0x0000FFFF
	thumb_func_end ov48_022592E0

	thumb_func_start ov48_0225932C
ov48_0225932C: @ 0x0225932C
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	add r0, sp, #0x30
	ldrb r0, [r0, #8]
	adds r7, r1, #0
	movs r1, #0xdb
	subs r4, r0, #4
	movs r0, #0x89
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r2, #3
	bl ov48_02259B10
	adds r6, r0, #0
	movs r0, #0x89
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov48_02259BBC
	cmp r6, r0
	blo _0225935E
	bl FUN_0202551C
_0225935E:
	movs r0, #0x89
	lsls r0, r0, #2
	adds r0, r5, r0
	add r1, sp, #0xc
	adds r2, r6, #0
	bl ov48_02259B3C
	movs r0, #0x89
	lsls r0, r0, #2
	adds r0, r5, r0
	add r1, sp, #0
	adds r2, r7, #0
	bl ov48_02259B3C
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #4]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x18
	muls r0, r1, r0
	ldr r1, _022593B0 @ =0x0000FFFF
	blx FUN_020F2998
	adds r4, r4, r0
	bpl _02259394
	adds r4, #0x18
_02259394:
	cmp r4, #0x18
	blt _022593A2
	adds r0, r4, #0
	movs r1, #0x18
	blx FUN_020F2998
	adds r4, r1, #0
_022593A2:
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_022593B0: .4byte 0x0000FFFF
	thumb_func_end ov48_0225932C

	thumb_func_start ov48_022593B4
ov48_022593B4: @ 0x022593B4
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	movs r0, #0x89
	lsls r0, r0, #2
	adds r0, r4, r0
	add r3, sp, #0xc
	bl ov48_02259AD0
	cmp r0, #3
	beq _022593EC
	movs r0, #0x5e
	lsls r0, r0, #2
	adds r0, r4, r0
	add r1, sp, #0
	bl ov48_022598CC
	ldr r0, [sp, #8]
	add r1, sp, #0xc
	str r0, [sp, #0x14]
	movs r0, #0x5e
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov48_022598DC
	add sp, #0x18
	movs r0, #1
	pop {r4, pc}
_022593EC:
	movs r0, #0
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov48_022593B4

	thumb_func_start ov48_022593F4
ov48_022593F4: @ 0x022593F4
	push {r4, r5, r6, r7}
	ldr r4, [r0, #4]
	movs r2, #2
	bics r4, r2
	movs r3, #1
	bics r4, r3
	ldr r3, _02259460 @ =0x020F5670
	str r4, [r0, #4]
	ldrb r3, [r3]
	cmp r3, #1
	ldr r3, [r0, #4]
	bne _02259414
	movs r2, #2
	orrs r2, r3
	str r2, [r0, #4]
	b _02259418
_02259414:
	bics r3, r2
	str r3, [r0, #4]
_02259418:
	ldr r2, [r0, #4]
	lsls r3, r2, #0x1e
	lsrs r3, r3, #0x1f
	cmp r3, #1
	bne _02259452
	movs r3, #0
	adds r4, r3, #0
	movs r5, #1
	movs r6, #1
_0225942A:
	ldr r2, [r1]
	adds r7, r2, r4
	ldrb r7, [r7, #3]
	lsls r7, r7, #0x18
	lsrs r7, r7, #0x1c
	cmp r7, #1
	bne _02259446
	ldrh r2, [r2, r4]
	cmp r2, #0x67
	beq _02259446
	ldr r2, [r0, #4]
	bics r2, r5
	orrs r2, r6
	str r2, [r0, #4]
_02259446:
	adds r3, r3, #1
	adds r4, r4, #4
	cmp r3, #0x32
	blt _0225942A
	pop {r4, r5, r6, r7}
	bx lr
_02259452:
	movs r1, #1
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	str r1, [r0, #4]
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_02259460: .4byte 0x020F5670
	thumb_func_end ov48_022593F4

	thumb_func_start ov48_02259464
ov48_02259464: @ 0x02259464
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0xc0
	adds r1, r4, #0
	bl FUN_02007688
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0x40
	adds r1, r4, #0
	bl FUN_0202055C
	ldr r0, _022594A4 @ =0x0225B210
	bl FUN_02022BE8
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov48_022594F0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov48_02259688
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov48_02259750
	pop {r4, r5, r6, pc}
	.align 2, 0
_022594A4: .4byte 0x0225B210
	thumb_func_end ov48_02259464

	thumb_func_start ov48_022594A8
ov48_022594A8: @ 0x022594A8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200770C
	bl FUN_020205AC
	adds r0, r4, #0
	bl ov48_02259650
	adds r0, r4, #0
	bl ov48_02259724
	adds r0, r4, #0
	bl ov48_02259788
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov48_022594A8

	thumb_func_start ov48_022594D0
ov48_022594D0: @ 0x022594D0
	ldr r3, _022594D8 @ =FUN_0202457C
	ldr r0, [r0, #4]
	bx r3
	nop
_022594D8: .4byte FUN_0202457C
	thumb_func_end ov48_022594D0

	thumb_func_start ov48_022594DC
ov48_022594DC: @ 0x022594DC
	push {r3, lr}
	ldr r0, [r0]
	bl FUN_0201EEB4
	bl FUN_0200B224
	bl FUN_0202061C
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov48_022594DC

	thumb_func_start ov48_022594F0
ov48_022594F0: @ 0x022594F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, _0225963C @ =0x0225B190
	adds r7, r2, #0
	str r1, [sp, #0x10]
	bl FUN_0201ACB0
	adds r0, r7, #0
	bl FUN_0201AC88
	str r0, [r5]
	ldr r0, _02259640 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #0
	ldr r6, _02259644 @ =0x0225B2A4
	ldr r4, _02259648 @ =0x0225B1B0
	str r0, [sp, #0x14]
_0225951A:
	ldr r1, [r4]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4]
	movs r1, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	adds r3, r7, #0
	bl FUN_0201C1C4
	ldr r1, [r4]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	ldr r0, [sp, #0x14]
	adds r6, #0x1c
	adds r0, r0, #1
	adds r4, r4, #4
	str r0, [sp, #0x14]
	cmp r0, #5
	blt _0225951A
	movs r3, #0
	str r3, [sp]
	movs r0, #0x51
	str r7, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #5
	movs r2, #4
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x51
	str r7, [sp, #0xc]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5]
	movs r1, #0xb
	movs r3, #4
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x51
	str r7, [sp, #0xc]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5]
	movs r1, #0xc
	movs r3, #4
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x51
	str r7, [sp, #0xc]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5]
	movs r1, #4
	movs r3, #6
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x51
	str r7, [sp, #0xc]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5]
	movs r1, #0x12
	movs r3, #7
	bl FUN_02007B68
	movs r0, #0
	movs r1, #0x20
	adds r2, r7, #0
	bl FUN_0200304C
	movs r1, #0x16
	movs r0, #4
	lsls r1, r1, #4
	adds r2, r7, #0
	bl FUN_0200304C
	movs r3, #0
	str r3, [sp]
	str r7, [sp, #4]
	ldr r0, [r5]
	movs r1, #1
	movs r2, #0x1f
	bl FUN_0200E3DC
	movs r3, #0
	str r3, [sp]
	str r7, [sp, #4]
	ldr r0, [r5]
	movs r1, #1
	movs r2, #0x1f
	bl FUN_0200E3DC
	ldr r0, [sp, #0x10]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	str r4, [sp]
	str r7, [sp, #4]
	movs r2, #0xa
	ldr r0, [r5]
	movs r1, #4
	adds r3, r2, #0
	bl FUN_0200E644
	str r4, [sp]
	str r7, [sp, #4]
	movs r1, #1
	ldr r0, [r5]
	adds r2, r1, #0
	movs r3, #2
	bl FUN_0200E644
	ldr r1, _0225964C @ =0x000072CA
	movs r0, #0
	bl FUN_0201C2D8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225963C: .4byte 0x0225B190
_02259640: .4byte 0x021D116C
_02259644: .4byte 0x0225B2A4
_02259648: .4byte 0x0225B1B0
_0225964C: .4byte 0x000072CA
	thumb_func_end ov48_022594F0

	thumb_func_start ov48_02259650
ov48_02259650: @ 0x02259650
	push {r4, r5, r6, lr}
	ldr r5, _02259680 @ =0x0225B1B0
	adds r6, r0, #0
	movs r4, #0
_02259658:
	ldr r1, [r5]
	ldr r0, [r6]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB4C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #5
	blt _02259658
	ldr r0, [r6]
	bl FUN_0201AB0C
	ldr r0, _02259684 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	pop {r4, r5, r6, pc}
	nop
_02259680: .4byte 0x0225B1B0
_02259684: .4byte 0x021D116C
	thumb_func_end ov48_02259650

	thumb_func_start ov48_02259688
ov48_02259688: @ 0x02259688
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r6, r1, #0
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x1f
	str r3, [sp, #0xc]
	adds r2, r0, #0
	str r6, [sp, #0x10]
	bl FUN_0200B150
	movs r1, #0x10
	ldr r0, _02259720 @ =0x0225B1A0
	adds r2, r1, #0
	bl FUN_020215C0
	movs r0, #0x20
	adds r1, r6, #0
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	movs r0, #1
	movs r1, #0x10
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	adds r1, r5, #0
	movs r0, #0x20
	adds r1, #8
	adds r2, r6, #0
	bl FUN_02009F40
	str r0, [r5, #4]
	adds r0, r5, #0
	movs r2, #1
	adds r0, #8
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r7, #0x13
	movs r4, #0
	lsls r7, r7, #4
_022596F4:
	movs r0, #0x20
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0200A090
	str r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _022596F4
	bl FUN_0203A880
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02259720: .4byte 0x0225B1A0
	thumb_func_end ov48_02259688

	thumb_func_start ov48_02259724
ov48_02259724: @ 0x02259724
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	bl FUN_02024504
	movs r6, #0x13
	movs r4, #0
	lsls r6, r6, #4
_02259734:
	ldr r0, [r5, r6]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02259734
	bl FUN_0202168C
	bl FUN_02022608
	bl FUN_0200B244
	pop {r4, r5, r6, pc}
	thumb_func_end ov48_02259724

	thumb_func_start ov48_02259750
ov48_02259750: @ 0x02259750
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #4
	str r0, [sp]
	ldr r0, _02259780 @ =ov48_02259798
	movs r2, #2
	str r0, [sp, #4]
	adds r0, r1, #0
	movs r1, #0
	adds r3, r1, #0
	bl FUN_02026EB4
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r4, r1]
	movs r0, #0
	ldr r3, _02259784 @ =0xFFFFF001
	adds r1, r0, #0
	adds r2, r0, #0
	blx FUN_020BF034
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_02259780: .4byte ov48_02259798
_02259784: .4byte 0xFFFFF001
	thumb_func_end ov48_02259750

	thumb_func_start ov48_02259788
ov48_02259788: @ 0x02259788
	movs r1, #5
	lsls r1, r1, #6
	ldr r3, _02259794 @ =FUN_02026F54
	ldr r0, [r0, r1]
	bx r3
	nop
_02259794: .4byte FUN_02026F54
	thumb_func_end ov48_02259788

	thumb_func_start ov48_02259798
ov48_02259798: @ 0x02259798
	push {r3, lr}
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r0, _02259808 @ =0x04000008
	movs r1, #3
	ldrh r2, [r0]
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	strh r1, [r0]
	adds r0, #0x58
	ldrh r2, [r0]
	ldr r1, _0225980C @ =0xFFFFCFFD
	ands r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	adds r2, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _02259810 @ =0x0000CFFB
	ands r2, r3
	strh r2, [r0]
	adds r2, r1, #2
	ldrh r3, [r0]
	adds r1, r1, #2
	ands r3, r2
	movs r2, #8
	orrs r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	ands r2, r1
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	blx FUN_020CF82C
	movs r1, #0
	ldr r0, _02259814 @ =0x00006B5A
	ldr r2, _02259818 @ =0x00007FFF
	movs r3, #0x3f
	str r1, [sp]
	blx FUN_020CF910
	ldr r1, _0225981C @ =0xBFFF0000
	ldr r0, _02259820 @ =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_02259808: .4byte 0x04000008
_0225980C: .4byte 0xFFFFCFFD
_02259810: .4byte 0x0000CFFB
_02259814: .4byte 0x00006B5A
_02259818: .4byte 0x00007FFF
_0225981C: .4byte 0xBFFF0000
_02259820: .4byte 0x04000580
	thumb_func_end ov48_02259798

	thumb_func_start ov48_02259824
ov48_02259824: @ 0x02259824
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	movs r2, #0
	str r2, [r4]
	str r2, [r4, #4]
	movs r0, #1
	str r2, [r4, #8]
	lsls r0, r0, #0xc
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	movs r0, #0x69
	lsls r0, r0, #6
	str r0, [r4, #0x18]
	movs r0, #0x1f
	lsls r0, r0, #0xa
	str r0, [r4, #0x1c]
	str r2, [r4, #0x20]
	movs r2, #0x51
	lsls r2, r2, #2
	adds r0, r4, #0
	ldr r1, [r1, r2]
	adds r0, #0x9c
	movs r2, #3
	bl FUN_02018030
	adds r0, r4, #0
	adds r4, #0x9c
	adds r0, #0x24
	adds r1, r4, #0
	bl FUN_020181B0
	pop {r4, pc}
	thumb_func_end ov48_02259824

	thumb_func_start ov48_02259868
ov48_02259868: @ 0x02259868
	ldr r3, _02259870 @ =FUN_02018068
	adds r0, #0x9c
	bx r3
	nop
_02259870: .4byte FUN_02018068
	thumb_func_end ov48_02259868

	thumb_func_start ov48_02259874
ov48_02259874: @ 0x02259874
	push {r3, r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	add r1, sp, #0
	bl ov48_022598BC
	adds r0, r4, #0
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldr r3, [r4, #8]
	adds r0, #0x24
	bl FUN_020182A8
	adds r0, r4, #0
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0x14]
	adds r0, #0x24
	bl FUN_020182C4
	adds r4, #0x24
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_02018288
	add sp, #0x24
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov48_02259874

	thumb_func_start ov48_022598AC
ov48_022598AC: @ 0x022598AC
	adds r3, r0, #0
	adds r2, r1, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	.align 2, 0
	thumb_func_end ov48_022598AC

	thumb_func_start ov48_022598BC
ov48_022598BC: @ 0x022598BC
	adds r2, r0, #0
	ldr r3, _022598C8 @ =ov48_02258BF4
	adds r2, #0x18
	adds r0, r1, #0
	adds r1, r2, #0
	bx r3
	.align 2, 0
_022598C8: .4byte ov48_02258BF4
	thumb_func_end ov48_022598BC

	thumb_func_start ov48_022598CC
ov48_022598CC: @ 0x022598CC
	adds r2, r0, #0
	adds r2, #0x18
	adds r3, r1, #0
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end ov48_022598CC

	thumb_func_start ov48_022598DC
ov48_022598DC: @ 0x022598DC
	adds r3, r1, #0
	adds r2, r0, #0
	ldm r3!, {r0, r1}
	adds r2, #0x18
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end ov48_022598DC

	thumb_func_start ov48_022598EC
ov48_022598EC: @ 0x022598EC
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r2, [sp, #4]
	ldr r2, [sp, #0x34]
	str r0, [sp]
	str r2, [sp, #0x34]
	bl ov48_02258A80
	ldr r1, _02259974 @ =0x0000C178
	ldr r0, [sp]
	ldr r4, _02259978 @ =0x0225B178
	adds r5, r0, r1
	ldr r1, _0225997C @ =0x0000C010
	movs r7, #0
	adds r6, r0, r1
_0225990C:
	movs r1, #0x51
	ldr r2, [sp, #4]
	lsls r1, r1, #2
	ldr r1, [r2, r1]
	ldr r2, [r4]
	ldr r3, [sp, #0x34]
	adds r0, r5, #0
	bl FUN_02018030
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_020181B0
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, #0x10
	adds r6, #0x78
	cmp r7, #3
	blt _0225990C
	ldr r0, [sp, #0x2c]
	ldr r2, _02259980 @ =0x0000C004
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _0225995A
	movs r3, #3
	ldr r0, [sp]
	lsls r3, r3, #8
	str r3, [r0, r2]
	adds r1, r2, #4
	str r3, [r0, r1]
	movs r1, #1
	lsls r1, r1, #0xc
	adds r2, #8
	str r1, [r0, r2]
	add sp, #8
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
_0225995A:
	movs r3, #1
	ldr r0, [sp]
	lsls r3, r3, #0xc
	str r3, [r0, r2]
	adds r1, r2, #4
	str r3, [r0, r1]
	adds r2, #8
	str r3, [r0, r2]
	add sp, #8
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.align 2, 0
_02259974: .4byte 0x0000C178
_02259978: .4byte 0x0225B178
_0225997C: .4byte 0x0000C010
_02259980: .4byte 0x0000C004
	thumb_func_end ov48_022598EC

	thumb_func_start ov48_02259984
ov48_02259984: @ 0x02259984
	push {r3, r4, r5, lr}
	ldr r1, _0225999C @ =0x0000C178
	movs r4, #0
	adds r5, r0, r1
_0225998C:
	adds r0, r5, #0
	bl FUN_02018068
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _0225998C
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225999C: .4byte 0x0000C178
	thumb_func_end ov48_02259984

	thumb_func_start ov48_022599A0
ov48_022599A0: @ 0x022599A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	add r1, sp, #4
	bl ov48_022598AC
	adds r0, r4, #0
	add r1, sp, #0x10
	bl ov48_022598BC
	ldr r0, _02259A54 @ =0x0000C010
	ldr r7, _02259A58 @ =0x0000019A
	movs r6, #0
	adds r4, r5, r0
_022599C0:
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r4, #0
	bl FUN_020182A8
	cmp r6, #2
	ldr r1, _02259A5C @ =0x0000C004
	bne _022599E6
	ldr r3, _02259A60 @ =0x0000C00C
	ldr r2, _02259A64 @ =0x0000C008
	ldr r3, [r5, r3]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	adds r0, r4, #0
	adds r3, r3, r7
	bl FUN_020182C4
	b _022599F6
_022599E6:
	ldr r2, _02259A64 @ =0x0000C008
	ldr r3, _02259A60 @ =0x0000C00C
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	adds r0, r4, #0
	bl FUN_020182C4
_022599F6:
	adds r6, r6, #1
	adds r4, #0x78
	cmp r6, #3
	blt _022599C0
	add r0, sp, #0x34
	blx FUN_020CAFEC
	movs r0, #0xc1
	lsls r0, r0, #8
	adds r0, r5, r0
	add r1, sp, #0x34
	bl FUN_02018288
	ldr r0, [r5]
	movs r7, #0
	cmp r0, #0
	bls _02259A50
	ldr r0, _02259A54 @ =0x0000C010
	adds r6, r5, #0
	adds r0, r5, r0
	adds r6, #8
	adds r4, r5, #0
	str r0, [sp]
_02259A24:
	adds r0, r6, #0
	add r1, sp, #0x10
	add r2, sp, #0x34
	blx FUN_020CB410
	ldrh r2, [r4, #0x2c]
	cmp r2, #3
	beq _02259A44
	movs r0, #0x78
	adds r1, r2, #0
	muls r1, r0, r1
	ldr r0, [sp]
	adds r0, r0, r1
	add r1, sp, #0x34
	bl FUN_02018288
_02259A44:
	ldr r0, [r5]
	adds r7, r7, #1
	adds r6, #0x30
	adds r4, #0x30
	cmp r7, r0
	blo _02259A24
_02259A50:
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02259A54: .4byte 0x0000C010
_02259A58: .4byte 0x0000019A
_02259A5C: .4byte 0x0000C004
_02259A60: .4byte 0x0000C00C
_02259A64: .4byte 0x0000C008
	thumb_func_end ov48_022599A0

	thumb_func_start ov48_02259A68
ov48_02259A68: @ 0x02259A68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r7, r1, #0
	str r2, [sp]
	movs r4, #0
_02259A74:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl FUN_0222D724
	cmp r0, #0
	beq _02259AC2
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl FUN_0222D6FC
	lsls r1, r4, #0x18
	str r0, [sp, #4]
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl FUN_0222D6B0
	lsls r0, r0, #0x18
	lsls r1, r4, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl FUN_0222D6D4
	cmp r6, r7
	bne _02259AC2
	ldr r1, [sp]
	cmp r0, r1
	bne _02259AC2
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _02259ABC
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02259ABC:
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02259AC2:
	adds r4, r4, #1
	cmp r4, #0x32
	blt _02259A74
	movs r0, #3
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov48_02259A68

	thumb_func_start ov48_02259AD0
ov48_02259AD0: @ 0x02259AD0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r2, [sp]
	adds r5, r0, #0
	adds r7, r1, #0
	str r3, [sp, #4]
	movs r4, #3
	bl ov48_02259BBC
	adds r6, r0, #0
	ldr r2, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov48_02259B10
	adds r7, r0, #0
	cmp r7, r6
	bge _02259B08
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov48_02259B68
	adds r4, r0, #0
	ldr r1, [sp, #4]
	adds r0, r5, #0
	adds r2, r7, #0
	bl ov48_02259B3C
_02259B08:
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov48_02259AD0

	thumb_func_start ov48_02259B10
ov48_02259B10: @ 0x02259B10
	push {r4, r5}
	ldr r5, [r0]
	movs r4, #0
	cmp r5, #0
	bls _02259B34
_02259B1A:
	ldrh r3, [r0, #0x2e]
	cmp r1, r3
	bne _02259B2C
	ldrh r3, [r0, #0x30]
	cmp r2, r3
	bne _02259B2C
	adds r0, r4, #0
	pop {r4, r5}
	bx lr
_02259B2C:
	adds r4, r4, #1
	adds r0, #0x30
	cmp r4, r5
	blo _02259B1A
_02259B34:
	adds r0, r5, #0
	pop {r4, r5}
	bx lr
	.align 2, 0
	thumb_func_end ov48_02259B10

	thumb_func_start ov48_02259B3C
ov48_02259B3C: @ 0x02259B3C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r6, r2, #0
	adds r4, r1, #0
	cmp r6, r0
	blo _02259B4E
	bl FUN_0202551C
_02259B4E:
	movs r0, #0x30
	muls r0, r6, r0
	adds r1, r5, r0
	movs r0, #4
	ldrsh r0, [r1, r0]
	str r0, [r4]
	movs r0, #6
	ldrsh r0, [r1, r0]
	str r0, [r4, #4]
	movs r0, #0
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov48_02259B3C

	thumb_func_start ov48_02259B68
ov48_02259B68: @ 0x02259B68
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	cmp r4, r0
	blo _02259B78
	bl FUN_0202551C
_02259B78:
	movs r0, #0x30
	muls r0, r4, r0
	adds r0, r5, r0
	ldrh r0, [r0, #0x2c]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov48_02259B68

	thumb_func_start ov48_02259B84
ov48_02259B84: @ 0x02259B84
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	cmp r4, r0
	blo _02259B94
	bl FUN_0202551C
_02259B94:
	movs r0, #0x30
	muls r0, r4, r0
	adds r0, r5, r0
	ldrh r0, [r0, #0x2e]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov48_02259B84

	thumb_func_start ov48_02259BA0
ov48_02259BA0: @ 0x02259BA0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	cmp r4, r0
	blo _02259BB0
	bl FUN_0202551C
_02259BB0:
	movs r0, #0x30
	muls r0, r4, r0
	adds r0, r5, r0
	ldrh r0, [r0, #0x30]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov48_02259BA0

	thumb_func_start ov48_02259BBC
ov48_02259BBC: @ 0x02259BBC
	ldr r0, [r0]
	bx lr
	thumb_func_end ov48_02259BBC

	thumb_func_start ov48_02259BC0
ov48_02259BC0: @ 0x02259BC0
	push {r0, r1, r2, r3}
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, r3, #0
	bl FUN_02023114
	str r0, [r4]
	movs r3, #0
	str r3, [sp]
	ldr r0, [r4]
	ldr r1, _02259C2C @ =0x0225B16C
	str r0, [sp, #4]
	ldr r0, _02259C30 @ =0x0225B184
	ldr r2, _02259C34 @ =0x000005C1
	bl FUN_02023308
	movs r1, #0x19
	ldr r2, [r4]
	movs r0, #0
	lsls r1, r1, #0xe
	bl FUN_02023240
	ldr r1, [r4]
	movs r0, #0
	bl FUN_020233D8
	ldr r0, [r4]
	bl FUN_0202313C
	ldr r0, [sp, #0x14]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _02259C0E
	movs r0, #1
	strh r0, [r4, #0x10]
	movs r0, #5
	lsls r0, r0, #0x10
	b _02259C16
_02259C0E:
	movs r0, #0
	strh r0, [r4, #0x10]
	movs r0, #0x4a
	lsls r0, r0, #0xe
_02259C16:
	str r0, [r4, #0xc]
	ldr r0, [r4, #0xc]
	ldr r1, [r4]
	bl FUN_020235D4
	add sp, #8
	pop {r4}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_02259C2C: .4byte 0x0225B16C
_02259C30: .4byte 0x0225B184
_02259C34: .4byte 0x000005C1
	thumb_func_end ov48_02259BC0

	thumb_func_start ov48_02259C38
ov48_02259C38: @ 0x02259C38
	ldr r3, _02259C40 @ =FUN_02023120
	ldr r0, [r0]
	bx r3
	nop
_02259C40: .4byte FUN_02023120
	thumb_func_end ov48_02259C38

	thumb_func_start ov48_02259C44
ov48_02259C44: @ 0x02259C44
	ldr r3, _02259C48 @ =FUN_02023154
	bx r3
	.align 2, 0
_02259C48: .4byte FUN_02023154
	thumb_func_end ov48_02259C44

	thumb_func_start ov48_02259C4C
ov48_02259C4C: @ 0x02259C4C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	bne _02259C62
	movs r0, #1
	strh r0, [r4, #0x10]
	ldr r0, _02259C74 @ =0x000005D5
	bl FUN_0200604C
	b _02259C6C
_02259C62:
	movs r0, #0
	strh r0, [r4, #0x10]
	ldr r0, _02259C74 @ =0x000005D5
	bl FUN_0200604C
_02259C6C:
	movs r0, #1
	strh r0, [r4, #0x12]
	pop {r4, pc}
	nop
_02259C74: .4byte 0x000005D5
	thumb_func_end ov48_02259C4C

	thumb_func_start ov48_02259C78
ov48_02259C78: @ 0x02259C78
	push {r3, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x12]
	cmp r0, #0
	bne _02259C86
	movs r0, #1
	pop {r3, pc}
_02259C86:
	ldrh r0, [r2, #0x10]
	cmp r0, #0
	beq _02259CBE
	cmp r0, #1
	bne _02259CEA
	movs r0, #0x16
	ldr r3, [r2, #0xc]
	lsls r0, r0, #0xe
	cmp r3, r0
	ble _02259CB2
	movs r0, #2
	lsls r0, r0, #0xe
	subs r0, r3, r0
	str r0, [r2, #0xc]
	ldr r0, _02259CF8 @ =0x0000C004
	ldr r3, [r1, r0]
	subs r3, #0x80
	str r3, [r1, r0]
	ldr r3, [r1, r0]
	adds r0, r0, #4
	str r3, [r1, r0]
	b _02259CEA
_02259CB2:
	movs r0, #5
	lsls r0, r0, #0x10
	str r0, [r2, #0xc]
	movs r0, #0
	strh r0, [r2, #0x12]
	b _02259CEA
_02259CBE:
	movs r0, #0x12
	ldr r3, [r2, #0xc]
	lsls r0, r0, #0x10
	cmp r3, r0
	bge _02259CE0
	movs r0, #2
	lsls r0, r0, #0xe
	adds r0, r3, r0
	str r0, [r2, #0xc]
	ldr r0, _02259CF8 @ =0x0000C004
	ldr r3, [r1, r0]
	adds r3, #0x80
	str r3, [r1, r0]
	ldr r3, [r1, r0]
	adds r0, r0, #4
	str r3, [r1, r0]
	b _02259CEA
_02259CE0:
	movs r0, #0x4a
	lsls r0, r0, #0xe
	str r0, [r2, #0xc]
	movs r0, #0
	strh r0, [r2, #0x12]
_02259CEA:
	ldr r0, [r2, #0xc]
	ldr r1, [r2]
	bl FUN_020235D4
	movs r0, #0
	pop {r3, pc}
	nop
_02259CF8: .4byte 0x0000C004
	thumb_func_end ov48_02259C78

	thumb_func_start ov48_02259CFC
ov48_02259CFC: @ 0x02259CFC
	ldrh r0, [r0, #0x10]
	bx lr
	thumb_func_end ov48_02259CFC

	thumb_func_start ov48_02259D00
ov48_02259D00: @ 0x02259D00
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r1, #0
	adds r6, r2, #0
	movs r1, #0
	movs r2, #0x2c
	adds r5, r0, #0
	adds r7, r3, #0
	blx FUN_020E5B44
	movs r0, #0x15
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r2, #1
	adds r1, r5, #0
	str r2, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r4]
	adds r1, #0x1c
	movs r3, #0x19
	bl FUN_0201D40C
	adds r0, r5, #0
	adds r0, #0x1c
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r6, #0
	movs r1, #1
	bl ov48_0225B0C4
	adds r4, r0, #0
	movs r0, #2
	adds r1, r7, #0
	bl FUN_02002CEC
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0x30
	bl FUN_020030A0
	movs r1, #0
	adds r3, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02259D90 @ =0x0002010F
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	str r1, [sp, #0xc]
	adds r0, #0x1c
	movs r1, #2
	bl FUN_020200FC
	movs r0, #2
	bl FUN_02002DB4
	adds r5, #0x1c
	movs r1, #0
	adds r0, r5, #0
	movs r2, #0x1f
	adds r3, r1, #0
	bl FUN_0200E580
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02259D90: .4byte 0x0002010F
	thumb_func_end ov48_02259D00

	thumb_func_start ov48_02259D94
ov48_02259D94: @ 0x02259D94
	ldr r3, _02259D9C @ =FUN_0201D520
	adds r0, #0x1c
	bx r3
	nop
_02259D9C: .4byte FUN_0201D520
	thumb_func_end ov48_02259D94

	thumb_func_start ov48_02259DA0
ov48_02259DA0: @ 0x02259DA0
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4]
	ldr r0, _02259E58 @ =0x021D114C
	ldrh r1, [r0, #0x24]
	cmp r1, #0
	beq _02259DE8
	ldrh r1, [r0, #0x20]
	cmp r1, #0xc8
	blo _02259DCE
	cmp r1, #0xf8
	bhi _02259DCE
	ldrh r0, [r0, #0x22]
	cmp r0, #0xa8
	blo _02259DCE
	cmp r0, #0xb8
	bhi _02259DCE
	movs r0, #2
	add sp, #0x18
	str r0, [r4]
	pop {r4, pc}
_02259DCE:
	movs r0, #0
	str r0, [r4, #4]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4]
	ldr r0, _02259E58 @ =0x021D114C
	ldrh r1, [r0, #0x20]
	str r1, [r4, #8]
	ldrh r0, [r0, #0x22]
	str r0, [r4, #0xc]
	movs r0, #4
	str r0, [r4, #0x18]
_02259DE8:
	ldr r0, _02259E58 @ =0x021D114C
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	beq _02259E40
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02259DFE
	cmp r1, #1
	beq _02259E0E
	add sp, #0x18
	pop {r4, pc}
_02259DFE:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _02259E0A
	adds r0, r1, #1
	str r0, [r4, #4]
	b _02259E0E
_02259E0A:
	subs r0, r0, #1
	str r0, [r4, #0x18]
_02259E0E:
	add r0, sp, #0xc
	str r0, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r2, sp, #0x14
	add r3, sp, #0x10
	bl ov48_02258CE4
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	orrs r0, r1
	str r0, [r4]
	ldr r0, [sp, #0x10]
	str r0, [r4, #0x10]
	ldr r0, [sp, #8]
	add sp, #0x18
	str r0, [r4, #0x14]
	ldr r0, _02259E58 @ =0x021D114C
	ldrh r1, [r0, #0x20]
	str r1, [r4, #8]
	ldrh r0, [r0, #0x22]
	str r0, [r4, #0xc]
	pop {r4, pc}
_02259E40:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _02259E4A
	movs r0, #1
	str r0, [r4]
_02259E4A:
	movs r0, #0
	str r0, [r4, #4]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
_02259E58: .4byte 0x021D114C
	thumb_func_end ov48_02259DA0

	thumb_func_start ov48_02259E5C
ov48_02259E5C: @ 0x02259E5C
	cmp r1, #0
	beq _02259E6A
	cmp r1, #1
	beq _02259E6E
	cmp r1, #2
	beq _02259E72
	bx lr
_02259E6A:
	ldr r0, [r0]
	bx lr
_02259E6E:
	ldr r0, [r0, #0x10]
	bx lr
_02259E72:
	ldr r0, [r0, #0x14]
	bx lr
	.align 2, 0
	thumb_func_end ov48_02259E5C

	thumb_func_start ov48_02259E78
ov48_02259E78: @ 0x02259E78
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x1c
	movs r1, #1
	bl FUN_0200E5D4
	adds r4, #0x1c
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov48_02259E78

	thumb_func_start ov48_02259E90
ov48_02259E90: @ 0x02259E90
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x1c
	bl FUN_0201D5C8
	adds r4, #0x1c
	movs r1, #0
	adds r0, r4, #0
	movs r2, #0x1f
	adds r3, r1, #0
	bl FUN_0200E580
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov48_02259E90

	thumb_func_start ov48_02259EAC
ov48_02259EAC: @ 0x02259EAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	movs r1, #0
	movs r2, #0x2c
	adds r5, r0, #0
	blx FUN_020E5B44
	adds r0, r7, #0
	bl FUN_02028EA8
	bl FUN_0202AD3C
	str r0, [r5, #8]
	ldr r1, [sp, #0x28]
	movs r0, #0x80
	bl FUN_02026354
	str r0, [r5, #0xc]
	movs r2, #1
	adds r1, r5, #0
	str r2, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x34
	str r0, [sp, #0x10]
	ldr r0, [r4]
	adds r1, #0x10
	movs r3, #2
	bl FUN_0201D40C
	adds r0, r5, #0
	adds r0, #0x10
	movs r1, #0xf
	bl FUN_0201D978
	ldr r2, [r5, #0xc]
	adds r0, r6, #0
	movs r1, #5
	bl ov48_0225B0D4
	ldr r0, [sp, #0x28]
	bl FUN_0201660C
	str r0, [r5, #0x20]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov48_02259EAC

	thumb_func_start ov48_02259F14
ov48_02259F14: @ 0x02259F14
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _02259F30
	ldr r0, [r4, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_02259F30:
	ldr r0, [r4, #0xc]
	bl FUN_02026380
	ldr r0, [r4, #0x20]
	bl FUN_02016624
	adds r4, #0x10
	adds r0, r4, #0
	bl FUN_0201D520
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov48_02259F14

	thumb_func_start ov48_02259F48
ov48_02259F48: @ 0x02259F48
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x10
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x10
	adds r2, r1, #0
	movs r3, #2
	bl FUN_0200E998
	adds r0, r4, #0
	adds r0, #0x10
	bl FUN_0201D5C8
	movs r3, #0
	str r3, [sp]
	ldr r0, [r4, #8]
	movs r1, #1
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r4, #0
	ldr r2, [r4, #0xc]
	adds r0, #0x10
	bl FUN_020200A8
	str r0, [r4, #4]
	movs r0, #0
	str r0, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov48_02259F48

	thumb_func_start ov48_02259F8C
ov48_02259F8C: @ 0x02259F8C
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02259F9E
	cmp r0, #1
	beq _02259FD8
	b _02259FE0
_02259F9E:
	ldr r0, [r5, #4]
	movs r4, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02259FE0
	ldr r3, _02259FE8 @ =0x0225B1C4
	add r2, sp, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	adds r0, r5, #0
	adds r0, #0x10
	bl FUN_0201EE88
	str r0, [sp]
	ldr r0, [r5, #0x20]
	add r1, sp, #0
	bl FUN_020166FC
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02259FE0
_02259FD8:
	ldr r0, [r5, #0x20]
	bl FUN_020168F4
	adds r4, r0, #0
_02259FE0:
	adds r0, r4, #0
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_02259FE8: .4byte 0x0225B1C4
	thumb_func_end ov48_02259F8C

	thumb_func_start ov48_02259FEC
ov48_02259FEC: @ 0x02259FEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	bl FUN_020169CC
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #1
	bl FUN_0200E9BC
	adds r4, #0x10
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov48_02259FEC

	thumb_func_start ov48_0225A00C
ov48_0225A00C: @ 0x0225A00C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r1, [sp, #0x18]
	str r2, [sp, #0x1c]
	movs r2, #0
	adds r1, r0, #0
	str r0, [sp, #0x14]
	str r3, [sp, #0x20]
	str r2, [r1]
	bl ov48_0225A288
	ldr r5, [sp, #0x14]
	ldr r4, _0225A100 @ =_0225B164
	ldr r6, _0225A104 @ =0x0225B268
	movs r7, #0
	adds r5, #0xa0
_0225A02C:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldrb r3, [r4]
	adds r0, r5, #0
	adds r2, r6, #0
	bl ov48_0225A894
	adds r7, r7, #1
	adds r4, r4, #1
	adds r6, #0xc
	adds r5, #0x28
	cmp r7, #5
	blt _0225A02C
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r2, #4
	str r2, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	movs r3, #0x6a
	ldr r1, [sp, #0x14]
	lsls r3, r3, #2
	adds r1, r1, r3
	ldr r0, [r0]
	movs r3, #2
	bl FUN_0201D40C
	movs r1, #0x6a
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [sp, #0x1c]
	movs r1, #0
	bl ov48_0225B0C4
	movs r3, #0
	adds r2, r0, #0
	str r3, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	ldr r0, [sp, #0x14]
	adds r1, #0xa9
	adds r0, r0, r1
	movs r1, #1
	str r3, [sp, #8]
	bl FUN_020200A8
	movs r1, #0x6a
	movs r2, #0xa
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	adds r3, r2, #0
	bl FUN_0200E998
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x20]
	bl ov48_0225A6DC
	ldr r0, [sp, #0x20]
	movs r1, #0x51
	str r0, [sp]
	ldr r3, [sp, #0x14]
	ldr r0, [sp, #0x18]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0x13
	movs r2, #0
	adds r3, #0x98
	bl FUN_02007C2C
	ldr r1, [sp, #0x14]
	movs r3, #0xb9
	adds r1, #0x94
	str r0, [r1]
	movs r1, #0x6e
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r2, [sp, #0x14]
	lsls r3, r3, #2
	adds r2, r2, r3
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x20]
	bl ov48_0225AAAC
	movs r1, #0xb9
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r0, r0, r1
	bl ov48_0225A5C4
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0225A100: .4byte _0225B164
_0225A104: .4byte 0x0225B268
	thumb_func_end ov48_0225A00C

	thumb_func_start ov48_0225A108
ov48_0225A108: @ 0x0225A108
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r4, r1, #0
	bl ov48_0225A634
	movs r0, #0x6e
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r4, #0
	bl ov48_0225AC34
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl ov48_0225A768
	movs r0, #0x6a
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D520
	adds r0, r5, #0
	bl ov48_0225A294
	movs r4, #0
	adds r5, #0xa0
_0225A148:
	adds r0, r5, #0
	bl ov48_0225A928
	adds r4, r4, #1
	adds r5, #0x28
	cmp r4, #5
	blt _0225A148
	pop {r3, r4, r5, pc}
	thumb_func_end ov48_0225A108

	thumb_func_start ov48_0225A158
ov48_0225A158: @ 0x0225A158
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4]
	adds r5, r2, #0
	cmp r3, #4
	bhi _0225A1CC
	adds r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_0225A170: @ jump table
	.2byte _0225A17A - _0225A170 - 2 @ case 0
	.2byte _0225A192 - _0225A170 - 2 @ case 1
	.2byte _0225A19C - _0225A170 - 2 @ case 2
	.2byte _0225A1AC - _0225A170 - 2 @ case 3
	.2byte _0225A1BE - _0225A170 - 2 @ case 4
_0225A17A:
	adds r1, r5, #0
	bl ov48_0225A338
	movs r0, #0x6e
	movs r1, #0xb9
	lsls r0, r0, #2
	lsls r1, r1, #2
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov48_0225AD54
	pop {r3, r4, r5, pc}
_0225A192:
	bl ov48_0225A354
	movs r0, #2
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225A19C:
	adds r1, r5, #0
	bl ov48_0225A41C
	cmp r0, #1
	bne _0225A1CC
	movs r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225A1AC:
	bl ov48_0225A428
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov48_0225A430
	movs r0, #4
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225A1BE:
	adds r1, r5, #0
	bl ov48_0225A430
	cmp r0, #1
	bne _0225A1CC
	movs r0, #0
	str r0, [r4]
_0225A1CC:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov48_0225A158

	thumb_func_start ov48_0225A1D0
ov48_0225A1D0: @ 0x0225A1D0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x6a
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #1
	bl FUN_0200E9BC
	movs r0, #0x6a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	pop {r4, pc}
	thumb_func_end ov48_0225A1D0

	thumb_func_start ov48_0225A1EC
ov48_0225A1EC: @ 0x0225A1EC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x6a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
	movs r0, #0x6a
	lsls r0, r0, #2
	movs r2, #0xa
	adds r0, r4, r0
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0200E998
	pop {r4, pc}
	thumb_func_end ov48_0225A1EC

	thumb_func_start ov48_0225A20C
ov48_0225A20C: @ 0x0225A20C
	push {r3, lr}
	ldr r2, [r0]
	cmp r2, #4
	bhi _0225A23C
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0225A220: @ jump table
	.2byte _0225A22A - _0225A220 - 2 @ case 0
	.2byte _0225A238 - _0225A220 - 2 @ case 1
	.2byte _0225A230 - _0225A220 - 2 @ case 2
	.2byte _0225A238 - _0225A220 - 2 @ case 3
	.2byte _0225A238 - _0225A220 - 2 @ case 4
_0225A22A:
	movs r2, #1
	str r2, [r0]
	b _0225A23C
_0225A230:
	movs r1, #3
	str r1, [r0]
	movs r0, #0
	pop {r3, pc}
_0225A238:
	movs r0, #0
	pop {r3, pc}
_0225A23C:
	bl ov48_0225A2A0
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov48_0225A20C

	thumb_func_start ov48_0225A244
ov48_0225A244: @ 0x0225A244
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r5, r1, #0
	movs r4, #0
	add r7, sp, #0
_0225A250:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl ov48_0225A30C
	cmp r0, #0
	bne _0225A264
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0225A264:
	ldr r1, [sp, #4]
	ldr r0, [r5, #4]
	cmp r1, r0
	bne _0225A27A
	ldr r1, [sp, #8]
	ldr r0, [r5, #8]
	cmp r1, r0
	bne _0225A27A
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0225A27A:
	adds r4, r4, #1
	cmp r4, #3
	blt _0225A250
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov48_0225A244

	thumb_func_start ov48_0225A288
ov48_0225A288: @ 0x0225A288
	movs r1, #0
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x36]
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0
	thumb_func_end ov48_0225A288

	thumb_func_start ov48_0225A294
ov48_0225A294: @ 0x0225A294
	movs r1, #0
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x36]
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0
	thumb_func_end ov48_0225A294

	thumb_func_start ov48_0225A2A0
ov48_0225A2A0: @ 0x0225A2A0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrh r1, [r5, #0x36]
	adds r1, r1, #1
	lsrs r3, r1, #0x1f
	lsls r2, r1, #0x1e
	subs r2, r2, r3
	movs r1, #0x1e
	rors r2, r1
	ldrh r1, [r5, #0x34]
	adds r2, r3, r2
	cmp r2, r1
	bne _0225A2C0
	bl ov48_0225A2EC
_0225A2C0:
	ldrh r1, [r5, #0x36]
	movs r0, #0xc
	muls r0, r1, r0
	adds r0, r5, r0
	adds r2, r0, #4
	ldm r4!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	ldrh r0, [r5, #0x36]
	adds r0, r0, #1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	strh r0, [r5, #0x36]
	ldr r0, [r5, #0x38]
	adds r0, r0, #1
	str r0, [r5, #0x38]
	pop {r3, r4, r5, pc}
	thumb_func_end ov48_0225A2A0

	thumb_func_start ov48_0225A2EC
ov48_0225A2EC: @ 0x0225A2EC
	ldrh r2, [r0, #0x34]
	ldrh r1, [r0, #0x36]
	cmp r1, r2
	beq _0225A30A
	adds r1, r2, #1
	lsrs r3, r1, #0x1f
	lsls r2, r1, #0x1e
	subs r2, r2, r3
	movs r1, #0x1e
	rors r2, r1
	adds r1, r3, r2
	strh r1, [r0, #0x34]
	ldr r1, [r0, #0x38]
	subs r1, r1, #1
	str r1, [r0, #0x38]
_0225A30A:
	bx lr
	thumb_func_end ov48_0225A2EC

	thumb_func_start ov48_0225A30C
ov48_0225A30C: @ 0x0225A30C
	adds r3, r1, #0
	ldr r1, [r0, #0x38]
	cmp r2, r1
	blo _0225A318
	movs r0, #0
	bx lr
_0225A318:
	ldrh r1, [r0, #0x36]
	subs r1, r1, #1
	subs r2, r1, r2
	bpl _0225A322
	adds r2, r2, #4
_0225A322:
	movs r1, #0xc
	muls r1, r2, r1
	adds r0, r0, r1
	adds r2, r0, #4
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	movs r0, #1
	bx lr
	.align 2, 0
	thumb_func_end ov48_0225A30C

	thumb_func_start ov48_0225A338
ov48_0225A338: @ 0x0225A338
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	adds r5, #0xa0
_0225A342:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov48_0225A95C
	adds r4, r4, #1
	adds r5, #0x28
	cmp r4, #5
	blt _0225A342
	pop {r4, r5, r6, pc}
	thumb_func_end ov48_0225A338

	thumb_func_start ov48_0225A354
ov48_0225A354: @ 0x0225A354
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	str r1, [sp]
	adds r0, #0x40
	movs r1, #0
	movs r2, #0x48
	blx FUN_020E5B44
	movs r6, #0
	strh r6, [r5, #0x3c]
	adds r4, r5, #0
	strh r6, [r5, #0x3e]
	adds r4, #0xa0
_0225A370:
	adds r0, r4, #0
	bl ov48_0225AA50
	adds r6, r6, #1
	adds r4, #0x28
	cmp r6, #5
	blt _0225A370
	movs r0, #0x6e
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov48_0225ACAC
	adds r0, r5, #0
	str r0, [sp, #8]
	adds r0, #0xa0
	movs r7, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	mvns r7, r7
	str r0, [sp, #0xc]
	adds r0, #0x3e
	movs r6, #0
	str r7, [sp, #0x10]
	str r0, [sp, #0xc]
_0225A3A0:
	movs r0, #2
	subs r4, r0, r6
	adds r0, r5, #0
	add r1, sp, #0x14
	adds r2, r6, #0
	bl ov48_0225A30C
	cmp r0, #1
	bne _0225A406
	ldr r0, [sp, #0x14]
	bl ov48_0225B038
	movs r1, #0x28
	str r0, [sp, #4]
	muls r1, r0, r1
	ldr r0, [sp, #8]
	movs r2, #1
	adds r0, r0, r1
	adds r1, r4, #0
	bl ov48_0225AA38
	ldr r3, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #0x14
	bl ov48_0225A790
	lsls r0, r4, #2
	adds r1, r5, r0
	lsls r3, r7, #0x18
	ldr r0, [sp, #4]
	adds r1, #0x88
	str r0, [r1]
	ldr r2, [sp, #0x14]
	movs r0, #0x6e
	lsls r0, r0, #2
	lsls r1, r4, #0x18
	lsls r2, r2, #0x18
	adds r0, r5, r0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov48_0225ACD8
	ldr r0, [sp, #0xc]
	ldrh r0, [r0]
	adds r1, r0, #6
	ldr r0, [sp, #0xc]
	strh r1, [r0]
	ldr r7, [sp, #0x14]
	b _0225A412
_0225A406:
	lsls r0, r4, #2
	adds r1, r5, r0
	adds r1, #0x88
	movs r0, #5
	ldr r7, [sp, #0x10]
	str r0, [r1]
_0225A412:
	adds r6, r6, #1
	cmp r6, #3
	blt _0225A3A0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov48_0225A354

	thumb_func_start ov48_0225A41C
ov48_0225A41C: @ 0x0225A41C
	ldr r3, _0225A424 @ =ov48_0225A43C
	movs r2, #2
	bx r3
	nop
_0225A424: .4byte ov48_0225A43C
	thumb_func_end ov48_0225A41C

	thumb_func_start ov48_0225A428
ov48_0225A428: @ 0x0225A428
	ldrh r1, [r0, #0x3c]
	lsrs r1, r1, #1
	strh r1, [r0, #0x3c]
	bx lr
	thumb_func_end ov48_0225A428

	thumb_func_start ov48_0225A430
ov48_0225A430: @ 0x0225A430
	ldr r3, _0225A438 @ =ov48_0225A43C
	movs r2, #1
	bx r3
	nop
_0225A438: .4byte ov48_0225A43C
	thumb_func_end ov48_0225A430

	thumb_func_start ov48_0225A43C
ov48_0225A43C: @ 0x0225A43C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x3c]
	adds r4, r2, #0
	adds r6, r1, #0
	adds r1, r4, #0
	movs r7, #1
	str r0, [sp]
	blx FUN_020F2998
	cmp r1, #0
	bne _0225A464
	ldr r0, [sp]
	adds r1, r4, #0
	blx FUN_020F2998
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov48_0225A4B4
_0225A464:
	ldrh r0, [r5, #0x3c]
	adds r1, r0, #1
	movs r0, #0x12
	muls r0, r4, r0
	cmp r1, r0
	bge _0225A472
	strh r1, [r5, #0x3c]
_0225A472:
	ldrh r0, [r5, #0x3e]
	movs r4, #0
	cmp r0, #0
	ble _0225A492
_0225A47A:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov48_0225A4C0
	cmp r0, #0
	bne _0225A48A
	movs r7, #0
_0225A48A:
	ldrh r0, [r5, #0x3e]
	adds r4, r4, #1
	cmp r4, r0
	blt _0225A47A
_0225A492:
	cmp r7, #1
	bne _0225A4AE
	movs r0, #0x6e
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov48_0225AD38
	movs r0, #0xb9
	lsls r0, r0, #2
	movs r1, #0
	adds r0, r5, r0
	adds r2, r1, #0
	bl ov48_0225A668
_0225A4AE:
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov48_0225A43C

	thumb_func_start ov48_0225A4B4
ov48_0225A4B4: @ 0x0225A4B4
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r2, #1
	adds r0, #0x40
	strb r2, [r0]
	bx lr
	thumb_func_end ov48_0225A4B4

	thumb_func_start ov48_0225A4C0
ov48_0225A4C0: @ 0x0225A4C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r2, [sp]
	adds r5, r0, #0
	lsls r2, r1, #2
	adds r0, r5, r2
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225A4DA
	add sp, #0x10
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225A4DA:
	adds r0, r5, #0
	adds r0, #0x41
	ldrsb r4, [r0, r2]
	adds r6, r0, r2
	cmp r4, #2
	blt _0225A4EC
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225A4EC:
	movs r0, #0x11
	subs r7, r0, r1
	adds r0, r7, #0
	movs r1, #6
	blx FUN_020F2BA4
	str r0, [sp, #0xc]
	adds r0, r7, #0
	movs r1, #6
	blx FUN_020F2BA4
	ldr r0, [sp, #0xc]
	str r1, [sp, #4]
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0x88
	ldr r0, [r0]
	cmp r4, #0
	str r0, [sp, #8]
	beq _0225A51A
	cmp r4, #1
	beq _0225A548
	b _0225A570
_0225A51A:
	adds r0, r5, #0
	bl ov48_0225A858
	adds r3, r0, #0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl ov48_0225A868
	ldr r2, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov48_0225A57C
	movs r0, #0xb9
	lsls r0, r0, #2
	lsls r1, r7, #0x13
	adds r0, r5, r0
	asrs r1, r1, #0x10
	movs r2, #0x90
	bl ov48_0225A668
	b _0225A570
_0225A548:
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl ov48_0225A834
	adds r3, r0, #0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl ov48_0225A868
	ldr r0, [sp, #8]
	movs r1, #0x28
	adds r5, #0xa0
	muls r1, r0, r1
	adds r0, r5, r1
	ldr r2, [sp]
	adds r1, r7, #0
	bl ov48_0225AA5C
_0225A570:
	movs r0, #0
	ldrsb r1, [r6, r0]
	adds r1, r1, #1
	strb r1, [r6]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov48_0225A4C0

	thumb_func_start ov48_0225A57C
ov48_0225A57C: @ 0x0225A57C
	push {r3, r4, lr}
	sub sp, #0x1c
	adds r0, #0x98
	ldr r0, [r0]
	adds r4, r2, #0
	movs r2, #0x20
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	adds r2, r0, #0
	adds r2, #0xc
	str r2, [sp, #8]
	movs r2, #0
	lsls r1, r1, #0x18
	str r2, [sp, #0xc]
	lsrs r3, r1, #0x18
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #6
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl FUN_0201C4EC
	ldr r0, [r4]
	movs r1, #6
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov48_0225A57C

	thumb_func_start ov48_0225A5C4
ov48_0225A5C4: @ 0x0225A5C4
	push {r4, r5, r6, lr}
	ldr r1, _0225A624 @ =0x04001000
	ldr r2, _0225A628 @ =0xFFFF1FFF
	ldr r3, [r1]
	adds r5, r1, #0
	ands r3, r2
	movs r2, #6
	lsls r2, r2, #0xc
	orrs r2, r3
	str r2, [r1]
	adds r5, #0x4a
	ldrh r6, [r5]
	movs r3, #0x3f
	movs r2, #0x1f
	bics r6, r3
	orrs r2, r6
	strh r2, [r5]
	adds r1, #0x48
	ldrh r5, [r1]
	movs r2, #0xf
	adds r4, r0, #0
	bics r5, r3
	adds r3, r5, #0
	orrs r3, r2
	strh r3, [r1]
	ldrh r5, [r1]
	ldr r3, _0225A62C @ =0xFFFFC0FF
	lsls r2, r2, #8
	ands r3, r5
	orrs r2, r3
	strh r2, [r1]
	movs r1, #0
	adds r2, r1, #0
	bl ov48_0225A650
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov48_0225A668
	ldr r0, _0225A630 @ =ov48_0225A680
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E374
	str r0, [r4, #0xc]
	pop {r4, r5, r6, pc}
	nop
_0225A624: .4byte 0x04001000
_0225A628: .4byte 0xFFFF1FFF
_0225A62C: .4byte 0xFFFFC0FF
_0225A630: .4byte ov48_0225A680
	thumb_func_end ov48_0225A5C4

	thumb_func_start ov48_0225A634
ov48_0225A634: @ 0x0225A634
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl FUN_0200E390
	ldr r2, _0225A648 @ =0x04001000
	ldr r0, _0225A64C @ =0xFFFF1FFF
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_0225A648: .4byte 0x04001000
_0225A64C: .4byte 0xFFFF1FFF
	thumb_func_end ov48_0225A634

	thumb_func_start ov48_0225A650
ov48_0225A650: @ 0x0225A650
	cmp r1, #0
	bge _0225A656
	movs r1, #0
_0225A656:
	cmp r2, #0
	bge _0225A65C
	movs r2, #0
_0225A65C:
	movs r3, #1
	strh r3, [r0]
	strh r1, [r0, #4]
	strh r2, [r0, #6]
	bx lr
	.align 2, 0
	thumb_func_end ov48_0225A650

	thumb_func_start ov48_0225A668
ov48_0225A668: @ 0x0225A668
	cmp r1, #0
	bge _0225A66E
	movs r1, #0
_0225A66E:
	cmp r2, #0
	bge _0225A674
	movs r2, #0
_0225A674:
	movs r3, #1
	strh r3, [r0, #2]
	strh r1, [r0, #8]
	strh r2, [r0, #0xa]
	bx lr
	.align 2, 0
	thumb_func_end ov48_0225A668

	thumb_func_start ov48_0225A680
ov48_0225A680: @ 0x0225A680
	push {r4, r5}
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	beq _0225A6A8
	movs r0, #6
	ldrsh r2, [r1, r0]
	movs r0, #4
	ldrsh r5, [r1, r0]
	ldr r0, _0225A6D4 @ =0x04001040
	movs r3, #0xff
	strh r3, [r0]
	lsls r2, r2, #0x18
	lsls r5, r5, #8
	lsls r3, r3, #8
	ands r3, r5
	lsrs r2, r2, #0x18
	orrs r2, r3
	strh r2, [r0, #4]
	strh r4, [r1]
_0225A6A8:
	movs r0, #2
	ldrsh r0, [r1, r0]
	cmp r0, #0
	beq _0225A6D0
	movs r0, #0xa
	ldrsh r2, [r1, r0]
	movs r0, #8
	ldrsh r4, [r1, r0]
	ldr r0, _0225A6D8 @ =0x04001042
	movs r3, #0xff
	strh r3, [r0]
	lsls r2, r2, #0x18
	lsls r4, r4, #8
	lsls r3, r3, #8
	ands r3, r4
	lsrs r2, r2, #0x18
	orrs r2, r3
	strh r2, [r0, #4]
	movs r0, #0
	strh r0, [r1, #2]
_0225A6D0:
	pop {r4, r5}
	bx lr
	.align 2, 0
_0225A6D4: .4byte 0x04001040
_0225A6D8: .4byte 0x04001042
	thumb_func_end ov48_0225A680

	thumb_func_start ov48_0225A6DC
ov48_0225A6DC: @ 0x0225A6DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	movs r6, #0x94
	str r1, [sp, #0x18]
	adds r1, r6, #0
	movs r7, #0
	adds r1, #0xd4
	str r0, [sp, #0x14]
	adds r4, r7, #0
	adds r5, r0, r1
_0225A6F0:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	adds r1, r5, #0
	ldr r0, [r0]
	movs r2, #5
	movs r3, #0
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	adds r6, #0xa2
	bl FUN_0201D978
	adds r0, r5, #0
	bl FUN_0201D578
	adds r7, r7, #1
	adds r4, r4, #6
	adds r5, #0x10
	cmp r7, #3
	blt _0225A6F0
	movs r3, #0
	str r3, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	movs r0, #0x94
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	movs r2, #0x66
	ldr r1, [sp, #0x14]
	lsls r2, r2, #2
	adds r1, r1, r2
	ldr r0, [r0]
	movs r2, #5
	bl FUN_0201D40C
	movs r1, #0x66
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	bl FUN_0201D978
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov48_0225A6DC

	thumb_func_start ov48_0225A768
ov48_0225A768: @ 0x0225A768
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	movs r4, #0
	adds r5, r6, r0
_0225A774:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _0225A774
	movs r0, #0x66
	lsls r0, r0, #2
	adds r0, r6, r0
	bl FUN_0201D520
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov48_0225A768

	thumb_func_start ov48_0225A790
ov48_0225A790: @ 0x0225A790
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r4, #3
	blo _0225A7A4
	bl FUN_0202551C
_0225A7A4:
	movs r0, #0x5a
	lsls r0, r0, #2
	adds r5, r5, r0
	lsls r4, r4, #4
	adds r0, r5, r4
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r6]
	bl ov48_0225B038
	str r0, [sp, #0x10]
	adds r0, r7, #0
	movs r1, #2
	bl ov48_0225B0C4
	movs r3, #0
	adds r2, r0, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	lsls r1, r0, #2
	ldr r0, _0225A82C @ =0x0225B1D8
	ldr r0, [r0, r1]
	movs r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, r4
	bl FUN_020200FC
	ldr r1, [r6, #4]
	adds r0, r7, #0
	bl ov48_0225B0E0
	adds r2, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225A830 @ =0x00010200
	movs r3, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, r4
	movs r1, #1
	bl FUN_020200FC
	ldr r1, [r6, #4]
	ldr r2, [r6, #8]
	adds r0, r7, #0
	bl ov48_0225B108
	adds r2, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225A830 @ =0x00010200
	movs r3, #0
	str r0, [sp, #8]
	adds r0, r5, r4
	movs r1, #1
	str r3, [sp, #0xc]
	bl FUN_020200FC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225A82C: .4byte 0x0225B1D8
_0225A830: .4byte 0x00010200
	thumb_func_end ov48_0225A790

	thumb_func_start ov48_0225A834
ov48_0225A834: @ 0x0225A834
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #3
	blo _0225A844
	bl FUN_0202551C
_0225A844:
	lsls r0, r4, #4
	adds r1, r5, r0
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	movs r0, #0x36
	lsls r0, r0, #4
	muls r0, r6, r0
	adds r0, r1, r0
	pop {r4, r5, r6, pc}
	thumb_func_end ov48_0225A834

	thumb_func_start ov48_0225A858
ov48_0225A858: @ 0x0225A858
	movs r2, #0x69
	lsls r2, r2, #2
	ldr r2, [r0, r2]
	movs r0, #0x36
	lsls r0, r0, #4
	muls r0, r1, r0
	adds r0, r2, r0
	bx lr
	thumb_func_end ov48_0225A858

	thumb_func_start ov48_0225A868
ov48_0225A868: @ 0x0225A868
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	movs r2, #0x5a
	lsls r2, r2, #2
	adds r2, r0, r2
	lsls r0, r1, #4
	adds r0, r2, r0
	adds r4, r3, #0
	bl FUN_0201EEA0
	movs r3, #0x1b
	adds r1, r5, #0
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r1, r0, #0x10
	movs r0, #0x15
	lsrs r1, r1, #0xb
	adds r2, r4, #0
	lsls r3, r3, #5
	bl FUN_020205D8
	pop {r3, r4, r5, pc}
	thumb_func_end ov48_0225A868

	thumb_func_start ov48_0225A894
ov48_0225A894: @ 0x0225A894
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	ldr r1, [sp, #0x28]
	str r2, [sp, #8]
	str r1, [sp, #0x28]
	movs r1, #0
	movs r2, #0x28
	adds r7, r0, #0
	adds r4, r3, #0
	blx FUN_020E5B44
	ldr r0, [sp, #8]
	strh r4, [r7, #2]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0225A8F4
	strh r0, [r7, #0x18]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrh r0, [r7, #0x18]
	cmp r0, #0
	ble _0225A8F4
	adds r6, r7, #0
	ldr r4, [sp, #8]
	adds r6, #0x10
	adds r5, r7, #0
_0225A8CA:
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #4]
	str r0, [sp]
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldrh r1, [r4]
	movs r2, #0
	adds r3, r6, #0
	bl FUN_02007C2C
	str r0, [r5, #8]
	ldr r0, [sp, #0xc]
	ldrh r1, [r7, #0x18]
	adds r0, r0, #1
	adds r6, r6, #4
	adds r4, r4, #2
	adds r5, r5, #4
	str r0, [sp, #0xc]
	cmp r0, r1
	blt _0225A8CA
_0225A8F4:
	ldr r0, [sp, #8]
	ldrh r1, [r0, #8]
	cmp r1, #0
	beq _0225A924
	adds r0, r7, #0
	adds r0, #0x24
	strb r1, [r0]
	ldr r0, [sp, #8]
	adds r2, r7, #0
	ldrh r1, [r0, #0xa]
	adds r0, r7, #0
	adds r0, #0x26
	strb r1, [r0]
	movs r1, #0x51
	ldr r0, [sp, #4]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	ldr r1, [sp, #8]
	ldr r3, [sp, #0x28]
	ldrh r1, [r1, #6]
	adds r2, #0x20
	bl FUN_02007C48
	str r0, [r7, #0x1c]
_0225A924:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov48_0225A894

	thumb_func_start ov48_0225A928
ov48_0225A928: @ 0x0225A928
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x18]
	cmp r0, #0
	beq _0225A94A
	movs r4, #0
	cmp r0, #0
	ble _0225A94A
	adds r5, r6, #0
_0225A93A:
	ldr r0, [r5, #8]
	bl FUN_0201AB0C
	ldrh r0, [r6, #0x18]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r0
	blt _0225A93A
_0225A94A:
	adds r0, r6, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225A95A
	ldr r0, [r6, #0x1c]
	bl FUN_0201AB0C
_0225A95A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov48_0225A928

	thumb_func_start ov48_0225A95C
ov48_0225A95C: @ 0x0225A95C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	ldrh r4, [r5]
	ldrh r0, [r5, #0x18]
	ldrh r6, [r5, #2]
	adds r7, r1, #0
	muls r0, r4, r0
	adds r1, r6, #0
	blx FUN_020F2998
	str r0, [sp, #0x20]
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r1, r6, #0
	muls r0, r4, r0
	blx FUN_020F2998
	str r0, [sp, #0x1c]
	adds r0, r4, #1
	adds r1, r6, #0
	blx FUN_020F2998
	strh r1, [r5]
	ldrh r0, [r5, #0x18]
	cmp r0, #0
	beq _0225A9F4
	ldrh r1, [r5, #0x1a]
	ldr r0, [sp, #0x20]
	cmp r0, r1
	beq _0225A9F4
	movs r6, #0
	strh r0, [r5, #0x1a]
	adds r4, r6, #0
_0225A9A2:
	adds r0, r5, r6
	ldrb r0, [r0, #4]
	cmp r0, #1
	bne _0225A9EC
	ldrh r0, [r5, #0x1a]
	movs r1, #0x20
	movs r2, #0
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x10]
	str r1, [sp]
	movs r1, #6
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	lsls r1, r4, #0x18
	lsrs r3, r1, #0x18
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #6
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r7]
	bl FUN_0201C4EC
	ldr r0, [r7]
	movs r1, #6
	bl FUN_0201EFBC
_0225A9EC:
	adds r6, r6, #1
	adds r4, r4, #6
	cmp r6, #3
	blt _0225A9A2
_0225A9F4:
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225AA34
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r1, [r0]
	ldr r0, [sp, #0x1c]
	cmp r0, r1
	beq _0225AA34
	adds r1, r5, #0
	adds r1, #0x25
	strb r0, [r1]
	ldr r2, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x26
	ldrb r1, [r1]
	adds r5, #0x25
	ldr r3, [r2, #0xc]
	ldrb r2, [r5]
	movs r0, #0x1f
	lsls r1, r1, #5
	lsls r2, r2, #5
	adds r2, r3, r2
	movs r3, #0x20
	bl FUN_020205D8
	cmp r0, #0
	bne _0225AA34
	bl FUN_0202551C
_0225AA34:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov48_0225A95C

	thumb_func_start ov48_0225AA38
ov48_0225AA38: @ 0x0225AA38
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #3
	blo _0225AA48
	bl FUN_0202551C
_0225AA48:
	adds r0, r5, r4
	strb r6, [r0, #4]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov48_0225AA38

	thumb_func_start ov48_0225AA50
ov48_0225AA50: @ 0x0225AA50
	movs r1, #0
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	bx lr
	thumb_func_end ov48_0225AA50

	thumb_func_start ov48_0225AA5C
ov48_0225AA5C: @ 0x0225AA5C
	push {r3, r4, lr}
	sub sp, #0x1c
	adds r4, r2, #0
	ldrh r2, [r0, #0x18]
	cmp r2, #0
	beq _0225AAA8
	ldrh r2, [r0, #0x1a]
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r0, [r0, #0x10]
	movs r2, #0x20
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	adds r2, r0, #0
	adds r2, #0xc
	str r2, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #6
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl FUN_0201C4EC
	ldr r0, [r4]
	movs r1, #6
	bl FUN_0201EFBC
_0225AAA8:
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end ov48_0225AA5C

	thumb_func_start ov48_0225AAAC
ov48_0225AAAC: @ 0x0225AAAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x88
	str r0, [sp, #0x2c]
	str r2, [sp, #0x30]
	movs r0, #0
	adds r5, r1, #0
	add r2, sp, #0x44
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	movs r2, #0x4b
	ldr r0, [sp, #0x2c]
	lsls r2, r2, #2
	str r3, [sp, #0x34]
	blx FUN_020E5B44
	ldr r0, [sp, #0x2c]
	movs r2, #2
	strh r2, [r0, #0x30]
	movs r1, #0x80
	strh r1, [r0, #0x32]
	ldr r0, [r5, #4]
	ldr r3, [sp, #0x34]
	str r0, [sp, #0x44]
	add r0, sp, #0x64
	str r0, [sp, #0x48]
	movs r0, #0x40
	str r0, [sp, #0x58]
	str r3, [sp, #0x60]
	str r2, [sp, #0x5c]
	movs r3, #0
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #0xc
	str r2, [sp, #8]
	ldr r2, [sp, #0x34]
	adds r0, #0xf4
	str r2, [sp, #0xc]
	adds r1, #0xc4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	movs r2, #0x14
	bl FUN_0200A480
	ldr r1, [sp, #0x2c]
	str r0, [r1, #0x70]
	bl FUN_0200B00C
	cmp r0, #0
	bne _0225AB18
	bl FUN_0202551C
_0225AB18:
	ldr r0, [sp, #0x2c]
	ldr r0, [r0, #0x70]
	bl FUN_0200A740
	movs r0, #0x15
	str r0, [sp, #0x40]
	ldr r4, [sp, #0x2c]
	movs r0, #0x16
	str r0, [sp, #0x3c]
	movs r0, #0x17
	movs r6, #0
	str r0, [sp, #0x38]
	adds r7, r4, #0
_0225AB32:
	str r6, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	movs r1, #0x51
	str r0, [sp, #8]
	movs r0, #0x13
	lsls r0, r0, #4
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x40]
	movs r3, #0
	bl FUN_0200A3C8
	str r0, [r4, #0x6c]
	movs r1, #0x51
	str r6, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	lsls r1, r1, #2
	str r0, [sp, #8]
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x3c]
	movs r3, #0
	bl FUN_0200A540
	str r0, [r4, #0x74]
	movs r1, #0x51
	str r6, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	lsls r1, r1, #2
	str r0, [sp, #8]
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x38]
	movs r3, #0
	bl FUN_0200A540
	str r0, [r4, #0x78]
	ldr r0, [r4, #0x6c]
	bl FUN_0200ADA4
	cmp r0, #0
	bne _0225ABA0
	bl FUN_0202551C
_0225ABA0:
	ldr r0, [r4, #0x6c]
	bl FUN_0200A740
	movs r0, #0
	str r6, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r6, #0
	str r0, [sp, #0x14]
	movs r0, #0x4d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r2, #0
	str r0, [sp, #0x18]
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r3, r6, #0
	str r0, [sp, #0x1c]
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	str r0, [sp, #0x20]
	movs r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x64
	bl FUN_02009D48
	add r0, sp, #0x44
	bl FUN_02024714
	str r0, [r7, #0x3c]
	movs r1, #1
	bl FUN_0202484C
	movs r1, #1
	ldr r0, [r7, #0x3c]
	lsls r1, r1, #0xc
	bl FUN_02024868
	ldr r0, [sp, #0x40]
	adds r6, r6, #1
	adds r0, r0, #3
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x3c]
	adds r4, #0x10
	adds r0, r0, #3
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x38]
	adds r7, r7, #4
	adds r0, r0, #3
	str r0, [sp, #0x38]
	cmp r6, #0xc
	blt _0225AB32
	ldr r0, [sp, #0x2c]
	bl ov48_0225AD38
	movs r1, #0
	ldr r0, [sp, #0x30]
	adds r2, r1, #0
	bl ov48_0225A668
	add sp, #0x88
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov48_0225AAAC

	thumb_func_start ov48_0225AC34
ov48_0225AC34: @ 0x0225AC34
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0225ACA8 @ =0x000005D8
	movs r1, #0
	bl FUN_02006154
	movs r0, #0
	ldr r7, [sp]
	str r0, [sp, #8]
_0225AC4A:
	ldr r0, [sp]
	ldr r0, [r0, #0x3c]
	bl FUN_02024758
	ldr r0, [r7, #0x6c]
	bl FUN_0200AEB0
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0225AC72
	ldr r0, [r7, #0x70]
	bl FUN_0200B0A8
	movs r0, #0x4d
	ldr r1, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, [r7, #0x70]
	bl FUN_0200A75C
_0225AC72:
	ldr r5, [sp, #4]
	movs r4, #0
	adds r6, r7, #0
_0225AC78:
	cmp r4, #1
	beq _0225AC88
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [r6, #0x6c]
	bl FUN_0200A75C
_0225AC88:
	adds r4, r4, #1
	adds r6, r6, #4
	adds r5, r5, #4
	cmp r4, #4
	blt _0225AC78
	ldr r0, [sp]
	adds r7, #0x10
	adds r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #8]
	adds r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #0xc
	blt _0225AC4A
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225ACA8: .4byte 0x000005D8
	thumb_func_end ov48_0225AC34

	thumb_func_start ov48_0225ACAC
ov48_0225ACAC: @ 0x0225ACAC
	adds r1, r0, #0
	adds r2, r0, #0
	movs r3, #0
	adds r1, #0x34
	strb r3, [r1]
	adds r2, #0x34
	strb r3, [r2, #1]
	strb r3, [r2, #2]
	adds r1, r0, #0
	strb r3, [r2, #3]
	adds r2, r0, #0
	adds r1, #0x38
	strb r3, [r1]
	adds r2, #0x38
	strb r3, [r2, #1]
	strb r3, [r2, #2]
	strb r3, [r2, #3]
	movs r1, #2
	strh r1, [r0, #0x30]
	movs r1, #0x80
	strh r1, [r0, #0x32]
	bx lr
	thumb_func_end ov48_0225ACAC

	thumb_func_start ov48_0225ACD8
ov48_0225ACD8: @ 0x0225ACD8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r5, r4
	adds r6, r5, #0
	str r3, [sp]
	movs r1, #1
	adds r0, #0x34
	strb r1, [r0]
	adds r6, #0x38
	adds r0, r2, #0
	bl ov48_0225B050
	strb r0, [r6, r4]
	lsls r7, r4, #4
	ldrb r2, [r6, r4]
	movs r1, #0x30
	ldr r3, _0225AD34 @ =0x0225B330
	muls r1, r2, r1
	adds r1, r3, r1
	adds r0, r5, r7
	adds r1, r1, r7
	bl ov48_0225AE3C
	ldr r0, [sp]
	cmp r0, #0x18
	bhs _0225AD30
	bl ov48_0225B050
	ldrb r1, [r6, r4]
	cmp r0, r1
	bne _0225AD30
	cmp r4, #2
	bhs _0225AD30
	adds r0, r4, #1
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #1
	bl ov48_0225AE5C
	adds r0, r5, r7
	movs r1, #1
	bl ov48_0225AE58
_0225AD30:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225AD34: .4byte 0x0225B330
	thumb_func_end ov48_0225ACD8

	thumb_func_start ov48_0225AD38
ov48_0225AD38: @ 0x0225AD38
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r5, r0, #0
	adds r6, r4, #0
_0225AD40:
	ldr r0, [r5, #0x3c]
	adds r1, r6, #0
	bl FUN_02024830
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xc
	blt _0225AD40
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov48_0225AD38

	thumb_func_start ov48_0225AD54
ov48_0225AD54: @ 0x0225AD54
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #0x32
	ldrsh r2, [r5, r1]
	cmp r2, #0
	ble _0225AD82
	subs r2, r2, #1
	strh r2, [r5, #0x32]
	ldrsh r1, [r5, r1]
	cmp r1, #0
	bne _0225ADB6
	movs r1, #0x30
	ldrsh r1, [r5, r1]
	adds r2, r4, #0
	bl ov48_0225ADBC
	cmp r0, #1
	bne _0225ADB6
	ldr r0, _0225ADB8 @ =0x000005D8
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
_0225AD82:
	movs r1, #0x30
	ldrsh r1, [r5, r1]
	adds r2, r4, #0
	bl ov48_0225ADF8
	cmp r0, #1
	bne _0225ADB6
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	subs r0, r0, #1
	bmi _0225ADA6
	strh r0, [r5, #0x30]
	ldrsh r1, [r5, r1]
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov48_0225ADBC
	pop {r3, r4, r5, pc}
_0225ADA6:
	ldr r0, _0225ADB8 @ =0x000005D8
	movs r1, #0
	bl FUN_02006154
	movs r0, #2
	strh r0, [r5, #0x30]
	movs r0, #0x80
	strh r0, [r5, #0x32]
_0225ADB6:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225ADB8: .4byte 0x000005D8
	thumb_func_end ov48_0225AD54

	thumb_func_start ov48_0225ADBC
ov48_0225ADBC: @ 0x0225ADBC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r5, r4
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225ADD0
	movs r0, #0
	pop {r3, r4, r5, pc}
_0225ADD0:
	lsls r0, r4, #4
	adds r0, r5, r0
	adds r1, r2, #0
	bl ov48_0225AEA8
	adds r0, r5, r4
	adds r0, #0x38
	ldrb r0, [r0]
	movs r1, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x3c]
	bl FUN_02024830
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov48_0225B010
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov48_0225ADBC

	thumb_func_start ov48_0225ADF8
ov48_0225ADF8: @ 0x0225ADF8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r5, r4
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225AE0C
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225AE0C:
	lsls r0, r4, #4
	adds r0, r5, r0
	adds r1, r2, #0
	bl ov48_0225AE60
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov48_0225B010
	cmp r6, #1
	bne _0225AE36
	adds r0, r5, r4
	adds r0, #0x38
	ldrb r0, [r0]
	movs r1, #0
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x3c]
	bl FUN_02024830
_0225AE36:
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov48_0225ADF8

	thumb_func_start ov48_0225AE3C
ov48_0225AE3C: @ 0x0225AE3C
	str r1, [r0, #0xc]
	movs r3, #0
	ldrsh r2, [r1, r3]
	strh r2, [r0]
	movs r2, #2
	ldrsh r1, [r1, r2]
	adds r1, #0x10
	strh r1, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	strh r3, [r0, #0xa]
	bx lr
	.align 2, 0
	thumb_func_end ov48_0225AE3C

	thumb_func_start ov48_0225AE58
ov48_0225AE58: @ 0x0225AE58
	strh r1, [r0, #8]
	bx lr
	thumb_func_end ov48_0225AE58

	thumb_func_start ov48_0225AE5C
ov48_0225AE5C: @ 0x0225AE5C
	strh r1, [r0, #0xa]
	bx lr
	thumb_func_end ov48_0225AE5C

	thumb_func_start ov48_0225AE60
ov48_0225AE60: @ 0x0225AE60
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #4
	ldrsh r3, [r5, r1]
	ldr r2, [r5, #0xc]
	movs r1, #8
	ldrsh r1, [r2, r1]
	cmp r3, r1
	ble _0225AE78
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225AE78:
	bl ov48_0225AEDC
	movs r0, #4
	ldrsh r0, [r5, r0]
	adds r0, r0, #1
	strh r0, [r5, #4]
	movs r0, #6
	ldrsh r0, [r5, r0]
	ldr r1, [r5, #0xc]
	adds r2, r0, #1
	movs r0, #0xc
	ldrsh r0, [r1, r0]
	cmp r2, r0
	ble _0225AE9A
	movs r0, #0
	strh r0, [r5, #6]
	b _0225AE9C
_0225AE9A:
	strh r2, [r5, #6]
_0225AE9C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov48_0225AFB4
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov48_0225AE60

	thumb_func_start ov48_0225AEA8
ov48_0225AEA8: @ 0x0225AEA8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #0
	strh r1, [r5, #4]
	strh r1, [r5, #6]
	bl ov48_0225AEDC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov48_0225AFB4
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov48_0225AEA8

	thumb_func_start ov48_0225AEC4
ov48_0225AEC4: @ 0x0225AEC4
	movs r2, #0
	ldrsh r2, [r0, r2]
	lsls r2, r2, #0xc
	str r2, [r1]
	movs r2, #2
	ldrsh r0, [r0, r2]
	lsls r3, r0, #0xc
	lsls r0, r2, #0x13
	adds r0, r3, r0
	str r0, [r1, #4]
	bx lr
	.align 2, 0
	thumb_func_end ov48_0225AEC4

	thumb_func_start ov48_0225AEDC
ov48_0225AEDC: @ 0x0225AEDC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0xa]
	ldr r2, [r5, #0xc]
	cmp r0, #0
	bne _0225AEF4
	movs r0, #6
	ldrsh r0, [r2, r0]
	subs r0, #0x10
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	b _0225AEF8
_0225AEF4:
	movs r0, #6
	ldrsh r7, [r2, r0]
_0225AEF8:
	ldrh r0, [r5, #8]
	cmp r0, #0
	bne _0225AF0A
	movs r0, #2
	ldrsh r0, [r2, r0]
	adds r0, #0x10
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	b _0225AF0E
_0225AF0A:
	movs r0, #2
	ldrsh r4, [r2, r0]
_0225AF0E:
	movs r0, #0
	ldrsh r6, [r2, r0]
	movs r0, #4
	ldrsh r1, [r5, r0]
	ldrsh r0, [r2, r0]
	subs r0, r0, r6
	muls r0, r1, r0
	movs r1, #8
	ldrsh r1, [r2, r1]
	blx FUN_020F2998
	adds r0, r6, r0
	strh r0, [r5]
	movs r0, #4
	ldrsh r1, [r5, r0]
	subs r0, r7, r4
	ldr r2, [r5, #0xc]
	muls r0, r1, r0
	movs r1, #8
	ldrsh r1, [r2, r1]
	blx FUN_020F2998
	adds r0, r4, r0
	strh r0, [r5, #2]
	movs r0, #6
	ldrsh r1, [r5, r0]
	ldr r0, _0225AFAC @ =0x0000FFFF
	ldr r4, [r5, #0xc]
	muls r0, r1, r0
	movs r1, #0xc
	ldrsh r1, [r4, r1]
	blx FUN_020F2998
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r1, r0, #2
	ldr r0, _0225AFB0 @ =0x021094DC
	ldrsh r6, [r0, r1]
	movs r0, #0xa
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0225AF76
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225AF84
_0225AF76:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225AF84:
	blx FUN_020F2104
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r3, #2
	movs r4, #0
	lsls r3, r3, #0xa
	adds r3, r0, r3
	adcs r1, r4
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	orrs r1, r0
	ldrsh r2, [r5, r4]
	asrs r0, r1, #0xc
	adds r0, r2, r0
	strh r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225AFAC: .4byte 0x0000FFFF
_0225AFB0: .4byte 0x021094DC
	thumb_func_end ov48_0225AEDC

	thumb_func_start ov48_0225AFB4
ov48_0225AFB4: @ 0x0225AFB4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov48_0225A650
	ldrh r0, [r5, #8]
	cmp r0, #0
	bne _0225AFE8
	ldr r1, [r5, #0xc]
	movs r0, #2
	ldrsh r1, [r1, r0]
	ldrsh r2, [r5, r0]
	adds r0, r1, #0
	subs r0, #0x10
	cmp r2, r0
	ble _0225AFE8
	adds r2, r1, #0
	adds r2, #0x20
	lsls r2, r2, #0x10
	adds r0, r4, #0
	asrs r2, r2, #0x10
	bl ov48_0225A650
_0225AFE8:
	ldrh r0, [r5, #0xa]
	cmp r0, #0
	bne _0225B00C
	ldr r1, [r5, #0xc]
	movs r0, #6
	ldrsh r2, [r1, r0]
	movs r0, #2
	ldrsh r0, [r5, r0]
	subs r0, #0x10
	cmp r0, r2
	bgt _0225B00C
	adds r1, r2, #0
	subs r1, #0x20
	lsls r1, r1, #0x10
	adds r0, r4, #0
	asrs r1, r1, #0x10
	bl ov48_0225A650
_0225B00C:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov48_0225AFB4

	thumb_func_start ov48_0225B010
ov48_0225B010: @ 0x0225B010
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	lsls r0, r4, #4
	adds r0, r5, r0
	add r1, sp, #0
	bl ov48_0225AEC4
	adds r0, r5, r4
	adds r0, #0x38
	ldrb r0, [r0]
	add r1, sp, #0
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x3c]
	bl FUN_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov48_0225B010

	thumb_func_start ov48_0225B038
ov48_0225B038: @ 0x0225B038
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0x18
	blo _0225B044
	bl FUN_0202551C
_0225B044:
	ldr r0, _0225B04C @ =0x0225B238
	lsls r1, r4, #1
	ldrb r0, [r0, r1]
	pop {r4, pc}
	.align 2, 0
_0225B04C: .4byte 0x0225B238
	thumb_func_end ov48_0225B038

	thumb_func_start ov48_0225B050
ov48_0225B050: @ 0x0225B050
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0x18
	blo _0225B05C
	bl FUN_0202551C
_0225B05C:
	ldr r0, _0225B064 @ =0x0225B239
	lsls r1, r4, #1
	ldrb r0, [r0, r1]
	pop {r4, pc}
	.align 2, 0
_0225B064: .4byte 0x0225B239
	thumb_func_end ov48_0225B050

	thumb_func_start ov48_0225B068
ov48_0225B068: @ 0x0225B068
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0225B0A0 @ =0x00000321
	movs r0, #0
	movs r1, #0x1b
	adds r3, r4, #0
	bl FUN_0200BAF8
	str r0, [r5]
	movs r0, #8
	movs r1, #0x40
	adds r2, r4, #0
	bl FUN_0200BD18
	str r0, [r5, #4]
	movs r0, #0x80
	adds r1, r4, #0
	bl FUN_02026354
	str r0, [r5, #8]
	movs r0, #0x80
	adds r1, r4, #0
	bl FUN_02026354
	str r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
	nop
_0225B0A0: .4byte 0x00000321
	thumb_func_end ov48_0225B068

	thumb_func_start ov48_0225B0A4
ov48_0225B0A4: @ 0x0225B0A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0200BB44
	ldr r0, [r4, #4]
	bl FUN_0200BDA0
	ldr r0, [r4, #8]
	bl FUN_02026380
	ldr r0, [r4, #0xc]
	bl FUN_02026380
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov48_0225B0A4

	thumb_func_start ov48_0225B0C4
ov48_0225B0C4: @ 0x0225B0C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r2, [r4, #8]
	bl FUN_0200BB6C
	ldr r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ov48_0225B0C4

	thumb_func_start ov48_0225B0D4
ov48_0225B0D4: @ 0x0225B0D4
	ldr r3, _0225B0DC @ =FUN_0200BB6C
	ldr r0, [r0]
	bx r3
	nop
_0225B0DC: .4byte FUN_0200BB6C
	thumb_func_end ov48_0225B0D4

	thumb_func_start ov48_0225B0E0
ov48_0225B0E0: @ 0x0225B0E0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	ldr r2, [r5, #0xc]
	movs r1, #3
	bl FUN_0200BB6C
	ldr r0, [r5, #4]
	movs r1, #0
	adds r2, r4, #0
	bl FUN_0200C4B0
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [r5, #0xc]
	bl FUN_0200CBBC
	ldr r0, [r5, #8]
	pop {r3, r4, r5, pc}
	thumb_func_end ov48_0225B0E0

	thumb_func_start ov48_0225B108
ov48_0225B108: @ 0x0225B108
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_0200CC50
	ldr r0, [r5]
	ldr r2, [r5, #0xc]
	movs r1, #3
	bl FUN_0200BB6C
	ldr r0, [r5, #4]
	movs r1, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl FUN_0200C4E8
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [r5, #0xc]
	bl FUN_0200CBBC
	ldr r0, [r5, #8]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov48_0225B108

	thumb_func_start ov48_0225B13C
ov48_0225B13C: @ 0x0225B13C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0225B142:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl FUN_0222D724
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0225B158
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0225B158:
	adds r4, r4, #1
	cmp r4, #0x32
	blt _0225B142
	movs r0, #0x32
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov48_0225B13C

	.rodata

_0225B164:
	.byte 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x19, 0x06, 0x00, 0x00, 0x00, 0x06, 0x05, 0x00, 0x00, 0x08, 0x07, 0x00
	.byte 0x00, 0x0A, 0x09, 0x00, 0x00, 0x0C, 0x0B, 0x00, 0x00, 0x0C, 0x0B, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01
	.byte 0x00, 0x02, 0x00, 0x02, 0x01, 0x03, 0x01, 0x03, 0x01, 0x04, 0x01, 0x04, 0x01, 0x05, 0x01, 0x05
	.byte 0x02, 0x06, 0x02, 0x06, 0x02, 0x07, 0x02, 0x07, 0x03, 0x08, 0x03, 0x08, 0x03, 0x09, 0x03, 0x09
	.byte 0x04, 0x0A, 0x04, 0x0A, 0x04, 0x0B, 0x04, 0x0B, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x10, 0x00, 0x11, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00, 0x04, 0x00, 0x02, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x03, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00
	.byte 0x10, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1A, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x30, 0x00, 0xBE, 0x00, 0x00, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xCE, 0x00, 0x60, 0x00, 0xA0, 0x00, 0x30, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0x96, 0x00, 0x90, 0x00, 0xCE, 0x00, 0x60, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xBE, 0x00, 0x30, 0x00, 0x8C, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x96, 0x00, 0x60, 0x00, 0xBE, 0x00, 0x30, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x90, 0x00, 0x96, 0x00, 0x60, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x30, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xD2, 0x00, 0x60, 0x00, 0x80, 0x00, 0x30, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x90, 0x00, 0xD2, 0x00, 0x60, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x30, 0x00, 0x8A, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x8A, 0x00, 0x60, 0x00, 0xB4, 0x00, 0x30, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x90, 0x00, 0x8A, 0x00, 0x60, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x30, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x82, 0x00, 0x60, 0x00, 0xB4, 0x00, 0x30, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x90, 0x00, 0x82, 0x00, 0x60, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x30, 0x00, 0x74, 0x00, 0x00, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0x74, 0x00, 0x60, 0x00, 0xB4, 0x00, 0x30, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x90, 0x00, 0x74, 0x00, 0x60, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x30, 0x00, 0xF0, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x60, 0x00, 0xB4, 0x00, 0x30, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x90, 0x00, 0xA0, 0x00, 0x60, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x30, 0x00, 0xDA, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xDA, 0x00, 0x60, 0x00, 0x90, 0x00, 0x30, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x90, 0x00, 0xDA, 0x00, 0x60, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x30, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x60, 0x00, 0xA0, 0x00, 0x30, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x90, 0x00, 0xC0, 0x00, 0x60, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x8C, 0x00, 0x30, 0x00, 0x60, 0x00, 0x00, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xBE, 0x00, 0x60, 0x00, 0x8C, 0x00, 0x30, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xF0, 0x00, 0x90, 0x00, 0xBE, 0x00, 0x60, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xD4, 0x00, 0x30, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0xD4, 0x00, 0x60, 0x00, 0xD4, 0x00, 0x30, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x90, 0x00, 0xD4, 0x00, 0x60, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x7B, 0x00, 0x30, 0x00, 0xAA, 0x00, 0x00, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xC6, 0x00, 0x60, 0x00, 0x7B, 0x00, 0x30, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0x85, 0x00, 0x90, 0x00, 0xC6, 0x00, 0x60, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	@ 0x0225B580
