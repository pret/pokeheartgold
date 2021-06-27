
	thumb_func_start ov43_02229EE0
ov43_02229EE0: @ 0x02229EE0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02229FA4 @ =0x0000002A
	movs r1, #2
	bl FUN_02006FF8
	movs r2, #7
	movs r0, #3
	movs r1, #0x33
	lsls r2, r2, #0x10
	bl FUN_0201A910
	ldr r1, _02229FA8 @ =0x000005A4
	adds r0, r5, #0
	movs r2, #0x33
	bl FUN_02007280
	ldr r2, _02229FA8 @ =0x000005A4
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r0, r5, #0
	bl FUN_020072A4
	movs r1, #0x9f
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0x68
	ldr r1, [r4, r1]
	adds r0, r4, r0
	movs r2, #0x33
	bl ov43_0222A290
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, #4
	adds r1, r4, r1
	movs r2, #0x33
	bl ov43_0222A48C
	movs r1, #0xa
	lsls r1, r1, #6
	adds r0, r4, r1
	subs r1, #0x6c
	adds r1, r4, r1
	adds r2, r4, #4
	movs r3, #0x33
	bl ov43_0222AE5C
	movs r1, #0xb
	lsls r1, r1, #6
	adds r0, r4, r1
	subs r1, #0xac
	adds r1, r4, r1
	adds r2, r4, #4
	movs r3, #0x33
	bl ov43_0222B5A8
	movs r0, #0xf
	movs r1, #0x85
	lsls r0, r0, #6
	lsls r1, r1, #2
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, #4
	movs r3, #0x33
	bl ov43_0222CBAC
	movs r0, #0xf3
	movs r1, #0x85
	lsls r0, r0, #2
	lsls r1, r1, #2
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, #4
	movs r3, #0x33
	bl ov43_0222CD90
	ldr r0, _02229FAC @ =0x00000408
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, #4
	movs r3, #0x33
	bl ov43_0222D134
	ldr r0, _02229FB0 @ =ov43_0222A148
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_02229FA4: .4byte 0x0000002A
_02229FA8: .4byte 0x000005A4
_02229FAC: .4byte 0x00000408
_02229FB0: .4byte ov43_0222A148
	thumb_func_end ov43_02229EE0

	thumb_func_start ov43_02229FB4
ov43_02229FB4: @ 0x02229FB4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02229FCC
	cmp r0, #1
	beq _0222A084
	b _0222A098
_02229FCC:
	ldr r0, [r4]
	cmp r0, #5
	bhi _0222A064
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02229FDE: @ jump table
	.2byte _02229FEA - _02229FDE - 2 @ case 0
	.2byte _0222A000 - _02229FDE - 2 @ case 1
	.2byte _0222A016 - _02229FDE - 2 @ case 2
	.2byte _0222A032 - _02229FDE - 2 @ case 3
	.2byte _0222A048 - _02229FDE - 2 @ case 4
	.2byte _0222A05E - _02229FDE - 2 @ case 5
_02229FEA:
	movs r1, #0xa
	lsls r1, r1, #6
	adds r0, r4, r1
	subs r1, #0x6c
	adds r1, r4, r1
	adds r2, r4, #4
	movs r3, #0x33
	bl ov43_0222AE64
	adds r6, r0, #0
	b _0222A064
_0222A000:
	movs r1, #0xb
	lsls r1, r1, #6
	adds r0, r4, r1
	subs r1, #0xac
	adds r1, r4, r1
	adds r2, r4, #4
	movs r3, #0x33
	bl ov43_0222B5D0
	adds r6, r0, #0
	b _0222A064
_0222A016:
	movs r0, #0x33
	str r0, [sp]
	movs r0, #0xf
	movs r2, #0x85
	lsls r0, r0, #6
	lsls r2, r2, #2
	adds r0, r4, r0
	adds r1, r4, #0
	adds r2, r4, r2
	adds r3, r4, #4
	bl ov43_0222CBB4
	adds r6, r0, #0
	b _0222A064
_0222A032:
	movs r0, #0xf3
	movs r1, #0x85
	lsls r0, r0, #2
	lsls r1, r1, #2
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, #4
	bl ov43_0222CD98
	adds r6, r0, #0
	b _0222A064
_0222A048:
	ldr r0, _0222A0A4 @ =0x00000408
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, #4
	movs r3, #0x33
	bl ov43_0222D15C
	adds r6, r0, #0
	b _0222A064
_0222A05E:
	add sp, #4
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0222A064:
	cmp r6, #1
	bne _0222A098
	ldr r0, _0222A0A8 @ =0x0000021D
	ldrb r1, [r4, r0]
	str r1, [r4]
	adds r1, r0, #1
	ldrb r1, [r4, r1]
	subs r0, r0, #1
	strb r1, [r4, r0]
	movs r0, #0x5a
	movs r1, #4
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r0, #1
	str r0, [r5]
	b _0222A098
_0222A084:
	movs r0, #0x5a
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bgt _0222A098
	movs r0, #0
	str r0, [r5]
_0222A098:
	adds r0, r4, #4
	bl ov43_0222A500
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222A0A4: .4byte 0x00000408
_0222A0A8: .4byte 0x0000021D
	thumb_func_end ov43_02229FB4

	thumb_func_start ov43_0222A0AC
ov43_0222A0AC: @ 0x0222A0AC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r1, #0xa
	lsls r1, r1, #6
	adds r0, r4, r1
	subs r1, #0x6c
	adds r1, r4, r1
	adds r2, r4, #4
	bl ov43_0222B098
	movs r1, #0xb
	lsls r1, r1, #6
	adds r0, r4, r1
	subs r1, #0xac
	adds r1, r4, r1
	adds r2, r4, #4
	bl ov43_0222B93C
	movs r0, #0xf
	movs r1, #0x85
	lsls r0, r0, #6
	lsls r1, r1, #2
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, #4
	bl ov43_0222CD34
	movs r0, #0xf3
	movs r1, #0x85
	lsls r0, r0, #2
	lsls r1, r1, #2
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, #4
	bl ov43_0222CE0C
	ldr r0, _0222A140 @ =0x00000408
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, #4
	bl ov43_0222D228
	adds r0, r4, #4
	bl ov43_0222A520
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, #0x68
	ldr r1, [r4, r1]
	bl ov43_0222A2F0
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x33
	bl FUN_0201A9C4
	ldr r0, _0222A144 @ =0x0000002A
	bl FUN_02006F7C
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222A140: .4byte 0x00000408
_0222A144: .4byte 0x0000002A
	thumb_func_end ov43_0222A0AC

	thumb_func_start ov43_0222A148
ov43_0222A148: @ 0x0222A148
	ldr r3, _0222A150 @ =ov43_0222A50C
	adds r0, r0, #4
	bx r3
	nop
_0222A150: .4byte ov43_0222A50C
	thumb_func_end ov43_0222A148

	thumb_func_start ov43_0222A154
ov43_0222A154: @ 0x0222A154
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0x85
	adds r5, r0, #0
	lsls r1, r1, #2
	adds r0, r5, #4
	adds r1, r5, r1
	adds r2, r4, #0
	bl ov43_0222A48C
	movs r1, #0xa
	lsls r1, r1, #6
	adds r0, r5, r1
	subs r1, #0x6c
	adds r1, r5, r1
	adds r2, r5, #4
	adds r3, r4, #0
	bl ov43_0222B0A0
	movs r1, #0xb
	lsls r1, r1, #6
	adds r0, r5, r1
	subs r1, #0xac
	adds r1, r5, r1
	adds r2, r5, #4
	adds r3, r4, #0
	bl ov43_0222B944
	movs r0, #0xf
	movs r1, #0x85
	lsls r0, r0, #6
	lsls r1, r1, #2
	adds r0, r5, r0
	adds r1, r5, r1
	adds r2, r5, #4
	adds r3, r4, #0
	bl ov43_0222CD3C
	movs r0, #0xf3
	movs r1, #0x85
	lsls r0, r0, #2
	lsls r1, r1, #2
	adds r0, r5, r0
	adds r1, r5, r1
	adds r2, r5, #4
	adds r3, r4, #0
	bl ov43_0222CE48
	ldr r0, _0222A1D4 @ =0x00000408
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r5, r0
	adds r1, r5, r1
	adds r2, r5, #4
	adds r3, r4, #0
	bl ov43_0222D584
	ldr r0, _0222A1D8 @ =ov43_0222A148
	adds r1, r5, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222A1D4: .4byte 0x00000408
_0222A1D8: .4byte ov43_0222A148
	thumb_func_end ov43_0222A154

	thumb_func_start ov43_0222A1DC
ov43_0222A1DC: @ 0x0222A1DC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r1, #0xa
	lsls r1, r1, #6
	adds r0, r4, r1
	subs r1, #0x6c
	adds r1, r4, r1
	adds r2, r4, #4
	bl ov43_0222B1D8
	movs r1, #0xb
	lsls r1, r1, #6
	adds r0, r4, r1
	subs r1, #0xac
	adds r1, r4, r1
	adds r2, r4, #4
	bl ov43_0222BAB8
	movs r0, #0xf
	movs r1, #0x85
	lsls r0, r0, #6
	lsls r1, r1, #2
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, #4
	bl ov43_0222CD40
	movs r0, #0xf3
	movs r1, #0x85
	lsls r0, r0, #2
	lsls r1, r1, #2
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, #4
	bl ov43_0222D008
	ldr r0, _0222A248 @ =0x00000408
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, #4
	bl ov43_0222D610
	adds r0, r4, #4
	bl ov43_0222A520
	pop {r4, pc}
	.align 2, 0
_0222A248: .4byte 0x00000408
	thumb_func_end ov43_0222A1DC

	thumb_func_start ov43_0222A24C
ov43_0222A24C: @ 0x0222A24C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0201D3C4
	add r0, sp, #0x18
	ldrb r1, [r0, #0x10]
	adds r2, r6, #0
	adds r3, r7, #0
	str r1, [sp]
	ldrb r1, [r0, #0x14]
	str r1, [sp, #4]
	ldrb r1, [r0, #0x18]
	str r1, [sp, #8]
	ldrb r1, [r0, #0x1c]
	str r1, [sp, #0xc]
	ldrh r0, [r0, #0x20]
	adds r1, r4, #0
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl FUN_0201D40C
	add r1, sp, #0x3c
	ldrb r1, [r1]
	adds r0, r4, #0
	bl FUN_0201D978
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222A24C

	thumb_func_start ov43_0222A290
ov43_0222A290: @ 0x0222A290
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	adds r6, r2, #0
	str r0, [r5, #4]
	movs r0, #0x80
	adds r1, r6, #0
	bl FUN_02026354
	str r0, [r5, #0x58]
	movs r0, #0x80
	adds r1, r6, #0
	bl FUN_02026354
	str r0, [r5, #0x5c]
	ldr r0, [r4, #4]
	bl FUN_020183F0
	str r0, [r5]
	ldr r0, [r5, #4]
	bl FUN_02028EA8
	adds r4, r0, #0
	bl FUN_0202AD3C
	strb r0, [r5, #0xc]
	adds r0, r4, #0
	bl FUN_0202ADCC
	strb r0, [r5, #0xd]
	adds r0, r4, #0
	bl FUN_0202ADAC
	cmp r0, #1
	beq _0222A2DC
	movs r0, #1
	b _0222A2DE
_0222A2DC:
	movs r0, #0
_0222A2DE:
	strb r0, [r5, #0xe]
	movs r0, #1
	bl FUN_02002B34
	movs r0, #1
	bl FUN_02002B8C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov43_0222A290

	thumb_func_start ov43_0222A2F0
ov43_0222A2F0: @ 0x0222A2F0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	adds r4, r1, #0
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B8C
	ldr r0, [r4, #4]
	ldr r1, [r5]
	bl FUN_02018410
	ldr r0, [r5, #0x58]
	bl FUN_02026380
	ldr r0, [r5, #0x5c]
	bl FUN_02026380
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222A2F0

	thumb_func_start ov43_0222A318
ov43_0222A318: @ 0x0222A318
	strb r1, [r0, #9]
	strb r2, [r0, #0xa]
	bx lr
	.align 2, 0
	thumb_func_end ov43_0222A318

	thumb_func_start ov43_0222A320
ov43_0222A320: @ 0x0222A320
	ldr r1, _0222A330 @ =0x021D110C
	ldr r2, [r1, #0x48]
	ldr r1, _0222A334 @ =0x00000CF3
	tst r1, r2
	beq _0222A32E
	movs r1, #0
	str r1, [r0]
_0222A32E:
	bx lr
	.align 2, 0
_0222A330: .4byte 0x021D110C
_0222A334: .4byte 0x00000CF3
	thumb_func_end ov43_0222A320

	thumb_func_start ov43_0222A338
ov43_0222A338: @ 0x0222A338
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r1, #0
	beq _0222A348
	ldr r0, [r5, #0x58]
	bl FUN_020263D4
_0222A348:
	cmp r4, #0
	beq _0222A354
	ldr r0, [r5, #0x5c]
	adds r1, r4, #0
	bl FUN_020263D4
_0222A354:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov43_0222A338

	thumb_func_start ov43_0222A358
ov43_0222A358: @ 0x0222A358
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp]
	ldr r0, [r0, #4]
	adds r6, r1, #0
	str r2, [sp, #4]
	bl FUN_0202C6F4
	adds r5, r0, #0
	bl FUN_0202C08C
	blx FUN_020A0310
	str r0, [sp, #0x10]
	str r1, [sp, #0xc]
	movs r4, #0
_0222A378:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0202C2DC
	cmp r0, #0
	bne _0222A404
	adds r0, r6, #0
	add r1, sp, #0x1c
	bl FUN_020266FC
	adds r7, r0, #0
	ldr r0, [sp, #0x1c]
	adds r6, r1, #0
	cmp r0, #1
	bne _0222A3FE
	ldr r0, [sp, #0xc]
	eors r1, r0
	ldr r0, [sp, #0x10]
	eors r0, r7
	orrs r0, r1
	beq _0222A3FE
	adds r0, r5, #0
	bl FUN_0202C08C
	adds r1, r7, #0
	adds r2, r6, #0
	blx FUN_0209FD0C
	cmp r0, #0
	bne _0222A3BA
	add sp, #0x20
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222A3BA:
	ldr r0, [sp]
	adds r1, r7, #0
	ldr r0, [r0, #4]
	adds r2, r6, #0
	add r3, sp, #0x18
	bl FUN_0203A128
	cmp r0, #0
	bne _0222A3D2
	add sp, #0x20
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0222A3D2:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0202C23C
	adds r1, r7, #0
	adds r2, r6, #0
	blx FUN_020A0340
	ldr r2, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0202C270
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #8
	movs r3, #2
	bl FUN_0202C190
	add sp, #0x20
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222A3FE:
	add sp, #0x20
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222A404:
	adds r4, r4, #1
	cmp r4, #0x20
	blt _0222A378
	bl FUN_0202551C
	movs r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222A358

	thumb_func_start ov43_0222A414
ov43_0222A414: @ 0x0222A414
	str r1, [r0, #0x60]
	movs r1, #1
	str r1, [r0, #0x64]
	bx lr
	thumb_func_end ov43_0222A414

	thumb_func_start ov43_0222A41C
ov43_0222A41C: @ 0x0222A41C
	strb r1, [r0, #0xb]
	bx lr
	thumb_func_end ov43_0222A41C

	thumb_func_start ov43_0222A420
ov43_0222A420: @ 0x0222A420
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x10
	movs r1, #0
	movs r2, #0x48
	blx FUN_020E5B44
	ldr r0, [r5, #4]
	bl FUN_0202C6F4
	movs r4, #0
	adds r6, r5, #0
	adds r7, r5, #0
	str r0, [sp]
	str r4, [r5, #0x10]
	adds r6, #0x14
	adds r7, #0x10
_0222A442:
	ldr r0, [sp]
	adds r1, r4, #0
	bl FUN_0202C2DC
	cmp r0, #1
	bne _0222A482
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	adds r0, r5, r0
	strb r4, [r0, #0x18]
	ldr r0, [sp]
	movs r2, #8
	bl FUN_0202C090
	cmp r0, #2
	bne _0222A46C
	ldr r0, [r5, #0x10]
	adds r1, r5, r0
	adds r1, #0x38
	movs r0, #0xff
	b _0222A47A
_0222A46C:
	ldr r1, [r6]
	ldr r0, [r5, #0x14]
	adds r1, r1, #1
	str r1, [r6]
	ldr r1, [r5, #0x10]
	adds r1, r5, r1
	adds r1, #0x38
_0222A47A:
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, r0, #1
	str r0, [r7]
_0222A482:
	adds r4, r4, #1
	cmp r4, #0x20
	blt _0222A442
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222A420

	thumb_func_start ov43_0222A48C
ov43_0222A48C: @ 0x0222A48C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _0222A4FC @ =0x021D116C
	movs r1, #1
	adds r4, r2, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #0x55
	adds r1, r4, #0
	bl FUN_02007688
	str r0, [r5, #0x58]
	bl ov43_0222A550
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222A570
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222A690
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222A87C
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov43_0222A8C0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222AC28
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222A998
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #1
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B50
	movs r0, #0
	bl FUN_02002B8C
	pop {r4, r5, r6, pc}
	nop
_0222A4FC: .4byte 0x021D116C
	thumb_func_end ov43_0222A48C

	thumb_func_start ov43_0222A500
ov43_0222A500: @ 0x0222A500
	ldr r3, _0222A508 @ =FUN_0202457C
	ldr r0, [r0, #4]
	bx r3
	nop
_0222A508: .4byte FUN_0202457C
	thumb_func_end ov43_0222A500

	thumb_func_start ov43_0222A50C
ov43_0222A50C: @ 0x0222A50C
	push {r3, lr}
	ldr r0, [r0]
	bl FUN_0201EEB4
	bl FUN_0202061C
	bl FUN_0200B224
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov43_0222A50C

	thumb_func_start ov43_0222A520
ov43_0222A520: @ 0x0222A520
	push {r4, lr}
	adds r4, r0, #0
	bl ov43_0222ACDC
	adds r0, r4, #0
	bl ov43_0222A9D8
	adds r0, r4, #0
	bl ov43_0222A960
	adds r0, r4, #0
	bl ov43_0222A8A8
	adds r0, r4, #0
	bl ov43_0222A81C
	adds r0, r4, #0
	bl ov43_0222A66C
	ldr r0, [r4, #0x58]
	bl FUN_0200770C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov43_0222A520

	thumb_func_start ov43_0222A550
ov43_0222A550: @ 0x0222A550
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0222A56C @ =0x0222EE5C
	add r3, sp, #0
	movs r2, #5
_0222A55A:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0222A55A
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_0222A56C: .4byte 0x0222EE5C
	thumb_func_end ov43_0222A550

	thumb_func_start ov43_0222A570
ov43_0222A570: @ 0x0222A570
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r7, r1, #0
	adds r5, r0, #0
	adds r0, r7, #0
	bl FUN_0201AC88
	add r3, sp, #0x10
	ldr r4, _0222A664 @ =0x0222EDC8
	str r0, [r5]
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r6, _0222A668 @ =0x0222EFFC
	movs r4, #0
_0222A598:
	lsls r1, r4, #0x18
	ldr r0, [r5]
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	movs r3, #0
	bl FUN_0201B1E4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x20
	movs r2, #0
	adds r3, r7, #0
	bl FUN_0201C1C4
	lsls r1, r4, #0x18
	ldr r0, [r5]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r4, r4, #1
	adds r6, #0x1c
	cmp r4, #7
	blt _0222A598
	movs r0, #0x16
	lsls r0, r0, #4
	str r0, [sp]
	str r7, [sp, #4]
	movs r2, #0
	ldr r0, [r5, #0x58]
	movs r1, #5
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r0, #0xa0
	str r0, [sp]
	str r7, [sp, #4]
	movs r1, #4
	ldr r0, [r5, #0x58]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_02007B8C
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [r5, #0x58]
	ldr r2, [r5]
	movs r1, #7
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [r5, #0x58]
	ldr r2, [r5]
	movs r1, #7
	movs r3, #2
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	movs r1, #6
	ldr r0, [r5, #0x58]
	ldr r2, [r5]
	adds r3, r1, #0
	bl FUN_02007B44
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [r5, #0x58]
	ldr r2, [r5]
	movs r1, #0xa
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [r5, #0x58]
	ldr r2, [r5]
	movs r1, #8
	movs r3, #6
	bl FUN_02007B68
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222A664: .4byte 0x0222EDC8
_0222A668: .4byte 0x0222EFFC
	thumb_func_end ov43_0222A570

	thumb_func_start ov43_0222A66C
ov43_0222A66C: @ 0x0222A66C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0222A672:
	lsls r1, r4, #0x18
	ldr r0, [r5]
	lsrs r1, r1, #0x18
	bl FUN_0201BB4C
	adds r4, r4, #1
	cmp r4, #7
	blt _0222A672
	ldr r0, [r5]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r5]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov43_0222A66C

	thumb_func_start ov43_0222A690
ov43_0222A690: @ 0x0222A690
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r7, r1, #0
	adds r6, r0, #0
	blx FUN_020B78D4
	movs r0, #0x10
	adds r1, r7, #0
	bl FUN_0202055C
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x1e
	str r3, [sp, #0xc]
	adds r2, r0, #0
	str r7, [sp, #0x10]
	bl FUN_0200B150
	ldr r4, _0222A814 @ =0x0222EDD8
	add r3, sp, #0x2c
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	movs r1, #0x10
	adds r0, r2, #0
	adds r2, r1, #0
	str r7, [sp, #0x38]
	bl FUN_020215C0
	movs r0, #0x40
	adds r1, r7, #0
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	adds r1, r6, #0
	movs r0, #0x40
	adds r1, #0xbc
	adds r2, r7, #0
	bl FUN_02009F40
	str r0, [r6, #4]
	adds r0, r6, #0
	adds r3, r6, #0
	ldr r1, _0222A818 @ =0x0222F0FC
	adds r0, #8
	movs r2, #1
	adds r3, #0xbc
	bl FUN_0200B27C
	movs r4, #0
	adds r5, r6, #0
_0222A706:
	movs r0, #0x40
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0200A090
	movs r1, #0x79
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0222A706
	movs r0, #0x64
	str r0, [sp]
	movs r2, #1
	str r2, [sp, #4]
	str r7, [sp, #8]
	adds r0, r1, #0
	ldr r0, [r6, r0]
	ldr r1, [r6, #0x58]
	adds r3, r2, #0
	bl FUN_0200A3C8
	adds r1, r6, #0
	adds r1, #0xac
	str r0, [r1]
	movs r0, #0x64
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	movs r0, #0x7a
	str r7, [sp, #0xc]
	lsls r0, r0, #2
	movs r2, #0
	ldr r0, [r6, r0]
	ldr r1, [r6, #0x58]
	adds r3, r2, #0
	bl FUN_0200A480
	adds r1, r6, #0
	adds r1, #0xb0
	str r0, [r1]
	movs r0, #0x64
	str r0, [sp]
	movs r2, #2
	str r2, [sp, #4]
	movs r0, #0x7b
	str r7, [sp, #8]
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	ldr r1, [r6, #0x58]
	movs r3, #1
	bl FUN_0200A540
	adds r1, r6, #0
	adds r1, #0xb4
	str r0, [r1]
	movs r0, #0x64
	str r0, [sp]
	movs r2, #3
	str r2, [sp, #4]
	movs r0, #0x1f
	str r7, [sp, #8]
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	ldr r1, [r6, #0x58]
	movs r3, #1
	bl FUN_0200A540
	adds r1, r6, #0
	adds r1, #0xb8
	str r0, [r1]
	adds r0, r6, #0
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200ADA4
	cmp r0, #0
	bne _0222A7AC
	bl FUN_0202551C
_0222A7AC:
	adds r0, r6, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_0200B00C
	cmp r0, #0
	bne _0222A7BE
	bl FUN_0202551C
_0222A7BE:
	adds r0, r6, #0
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200A740
	adds r0, r6, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_0200A740
	movs r1, #0x64
	adds r0, r1, #0
	movs r3, #0x79
	str r1, [sp]
	subs r0, #0x65
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsls r3, r3, #2
	ldr r2, [r6, r3]
	str r2, [sp, #0x14]
	adds r2, r3, #4
	ldr r2, [r6, r2]
	str r2, [sp, #0x18]
	adds r2, r3, #0
	adds r2, #8
	ldr r2, [r6, r2]
	adds r3, #0xc
	str r2, [sp, #0x1c]
	ldr r2, [r6, r3]
	adds r6, #0x88
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r6, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02009D48
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222A814: .4byte 0x0222EDD8
_0222A818: .4byte 0x0222F0FC
	thumb_func_end ov43_0222A690

	thumb_func_start ov43_0222A81C
ov43_0222A81C: @ 0x0222A81C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200AEB0
	adds r0, r7, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_0200B0A8
	movs r6, #0x79
	movs r4, #0
	adds r5, r7, #0
	lsls r6, r6, #2
_0222A83A:
	adds r1, r5, #0
	adds r1, #0xac
	ldr r0, [r5, r6]
	ldr r1, [r1]
	bl FUN_0200A75C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0222A83A
	movs r6, #0x79
	movs r5, #0
	adds r4, r7, #0
	lsls r6, r6, #2
_0222A856:
	ldr r0, [r4, r6]
	bl FUN_0200A0D0
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #4
	blt _0222A856
	ldr r0, [r7, #4]
	bl FUN_02024504
	bl FUN_0202168C
	bl FUN_02022608
	bl FUN_0200B244
	bl FUN_020205AC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222A81C

	thumb_func_start ov43_0222A87C
ov43_0222A87C: @ 0x0222A87C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0200BD08
	str r0, [r5, #0x50]
	ldr r2, _0222A8A4 @ =0x0000030B
	movs r0, #0
	movs r1, #0x1b
	adds r3, r4, #0
	bl FUN_0200BAF8
	str r0, [r5, #0x54]
	movs r0, #4
	adds r1, r4, #0
	bl FUN_02002CEC
	pop {r3, r4, r5, pc}
	nop
_0222A8A4: .4byte 0x0000030B
	thumb_func_end ov43_0222A87C

	thumb_func_start ov43_0222A8A8
ov43_0222A8A8: @ 0x0222A8A8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #4
	bl FUN_02002DB4
	ldr r0, [r4, #0x54]
	bl FUN_0200BB44
	ldr r0, [r4, #0x50]
	bl FUN_0200BDA0
	pop {r4, pc}
	thumb_func_end ov43_0222A8A8

	thumb_func_start ov43_0222A8C0
ov43_0222A8C0: @ 0x0222A8C0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r1, #0
	movs r1, #0x16
	adds r5, r0, #0
	movs r0, #0
	lsls r1, r1, #4
	adds r4, r2, #0
	bl FUN_0200304C
	movs r1, #7
	movs r0, #4
	lsls r1, r1, #6
	adds r2, r4, #0
	bl FUN_0200304C
	ldrb r0, [r6, #0xd]
	movs r1, #1
	movs r2, #0x46
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r5]
	movs r3, #0xc
	bl FUN_0200E644
	adds r0, r5, #0
	adds r0, #0x64
	bl FUN_0201D3C4
	movs r0, #0
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0x64
	str r0, [sp, #0x10]
	adds r1, r5, #0
	movs r2, #1
	ldr r0, [r5]
	adds r1, #0x64
	adds r3, r2, #0
	bl FUN_0201D40C
	movs r0, #0x80
	adds r1, r4, #0
	bl FUN_02026354
	str r0, [r5, #0x74]
	movs r0, #0x80
	adds r1, r4, #0
	bl FUN_02026354
	str r0, [r5, #0x78]
	movs r0, #0x80
	adds r1, r4, #0
	bl FUN_02026354
	str r0, [r5, #0x7c]
	movs r0, #0x80
	adds r1, r4, #0
	bl FUN_02026354
	adds r1, r5, #0
	adds r1, #0x80
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl FUN_02018424
	str r0, [r5, #0x5c]
	adds r0, r4, #0
	bl FUN_0201660C
	str r0, [r5, #0x60]
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov43_0222A8C0

	thumb_func_start ov43_0222A960
ov43_0222A960: @ 0x0222A960
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl FUN_02016624
	ldr r0, [r4, #0x5c]
	bl FUN_02018474
	ldr r0, [r4, #0x7c]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02026380
	ldr r0, [r4, #0x74]
	bl FUN_02026380
	ldr r0, [r4, #0x78]
	bl FUN_02026380
	adds r4, #0x64
	adds r0, r4, #0
	bl FUN_0201D520
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov43_0222A960

	thumb_func_start ov43_0222A998
ov43_0222A998: @ 0x0222A998
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #8]
	movs r1, #0x82
	lsls r1, r1, #2
	ldr r4, _0222A9D4 @ =0x0222F0C0
	str r0, [sp, #4]
	movs r7, #0
	adds r6, r0, r1
	adds r5, r0, #0
_0222A9AC:
	ldr r0, [sp, #8]
	movs r2, #1
	str r0, [sp]
	ldr r0, [sp, #4]
	ldrb r1, [r4]
	ldr r0, [r0, #0x58]
	adds r3, r6, #0
	bl FUN_02007C2C
	movs r1, #2
	lsls r1, r1, #8
	str r0, [r5, r1]
	adds r7, r7, #1
	adds r6, r6, #4
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r7, #2
	blt _0222A9AC
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222A9D4: .4byte 0x0222F0C0
	thumb_func_end ov43_0222A998

	thumb_func_start ov43_0222A9D8
ov43_0222A9D8: @ 0x0222A9D8
	push {r4, r5, r6, lr}
	movs r6, #2
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #8
_0222A9E2:
	ldr r0, [r5, r6]
	bl FUN_0201AB0C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _0222A9E2
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov43_0222A9D8

	thumb_func_start ov43_0222A9F4
ov43_0222A9F4: @ 0x0222A9F4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r2, #0
	bl FUN_02020094
	cmp r0, #1
	bne _0222AA22
	movs r0, #0
	bl FUN_02002B8C
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_0222AA22:
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r5, #0x54]
	ldr r2, [r5, #0x78]
	adds r1, r6, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x50]
	ldr r1, [r5, #0x74]
	ldr r2, [r5, #0x78]
	bl FUN_0200CBBC
	movs r0, #1
	bl FUN_02002B8C
	movs r0, #4
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _0222AA6C @ =0x000F0200
	movs r3, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r5, #0x74]
	adds r0, r4, #0
	movs r1, #1
	bl FUN_020200FC
	adds r5, #0x84
	str r0, [r5]
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222AA6C: .4byte 0x000F0200
	thumb_func_end ov43_0222A9F4

	thumb_func_start ov43_0222AA70
ov43_0222AA70: @ 0x0222AA70
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #1
	bne _0222AA98
	movs r0, #0
	bl FUN_02002B8C
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_0222AA98:
	adds r4, #0x64
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov43_0222AA70

	thumb_func_start ov43_0222AAA4
ov43_0222AAA4: @ 0x0222AAA4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r2, _0222AB18 @ =0x05F5E100
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0
	blx FUN_020F2900
	adds r2, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r0, [r5, #0x50]
	movs r3, #4
	bl FUN_0200BFCC
	ldr r2, _0222AB1C @ =0x00002710
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0
	blx FUN_020F2900
	ldr r2, _0222AB1C @ =0x00002710
	movs r3, #0
	blx FUN_020F290C
	movs r1, #2
	adds r2, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	movs r3, #4
	bl FUN_0200BFCC
	ldr r2, _0222AB1C @ =0x00002710
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0
	blx FUN_020F290C
	adds r2, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	movs r1, #3
	movs r3, #4
	bl FUN_0200BFCC
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0222AB18: .4byte 0x05F5E100
_0222AB1C: .4byte 0x00002710
	thumb_func_end ov43_0222AAA4

	thumb_func_start ov43_0222AB20
ov43_0222AB20: @ 0x0222AB20
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	adds r0, r1, #0
	adds r6, r2, #0
	bl FUN_0202C6F4
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_02028ED0
	adds r5, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_0202C254
	adds r1, r0, #0
	adds r0, r5, #0
	bl FUN_02028F24
	ldr r0, [r4, #0x50]
	movs r1, #0
	adds r2, r5, #0
	bl FUN_0200BE48
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222AB20

	thumb_func_start ov43_0222AB5C
ov43_0222AB5C: @ 0x0222AB5C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r3, #0
	adds r7, r2, #0
	bl FUN_02028ED0
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_0202C6F4
	adds r1, r7, #0
	bl FUN_0202C298
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02028F24
	ldr r0, [r5, #0x50]
	movs r1, #0
	adds r2, r4, #0
	bl FUN_0200BE48
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222AB5C

	thumb_func_start ov43_0222AB94
ov43_0222AB94: @ 0x0222AB94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	adds r0, r1, #0
	bl FUN_0202C6F4
	adds r1, r4, #0
	movs r2, #6
	adds r7, r0, #0
	movs r6, #1
	bl FUN_0202C090
	adds r2, r0, #0
	bne _0222ABB4
	movs r6, #0
_0222ABB4:
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #2
	ldr r0, [r5, #0x50]
	adds r3, r1, #0
	bl FUN_0200BFCC
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #4
	bl FUN_0202C090
	movs r1, #0
	adds r2, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	movs r3, #4
	bl FUN_0200BFCC
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #5
	bl FUN_0202C090
	adds r2, r0, #0
	ldr r0, [r5, #0x50]
	movs r1, #1
	bl FUN_0200CB1C
	adds r0, r6, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222AB94

	thumb_func_start ov43_0222ABFC
ov43_0222ABFC: @ 0x0222ABFC
	push {r3, lr}
	sub sp, #8
	adds r2, r1, #0
	movs r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r0, #0x50]
	movs r1, #0
	movs r3, #4
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov43_0222ABFC

	thumb_func_start ov43_0222AC18
ov43_0222AC18: @ 0x0222AC18
	ldr r3, _0222AC24 @ =FUN_0200C74C
	adds r2, r1, #0
	ldr r0, [r0, #0x50]
	movs r1, #0
	bx r3
	nop
_0222AC24: .4byte FUN_0200C74C
	thumb_func_end ov43_0222AC18

	thumb_func_start ov43_0222AC28
ov43_0222AC28: @ 0x0222AC28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r5, [sp]
	movs r0, #0
	str r0, [sp, #8]
	ldr r4, _0222ACD0 @ =0x0222F14C
	adds r0, r5, #0
	str r0, [sp, #0xc]
	adds r0, #0x88
	str r1, [sp, #4]
	adds r7, r4, #0
	movs r6, #5
	str r0, [sp, #0xc]
_0222AC44:
	ldr r0, [sp]
	ldr r0, [r0, #4]
	str r0, [r4]
	ldr r0, [sp, #0xc]
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	str r0, [r4, #0x2c]
	adds r0, r7, #0
	bl FUN_02024624
	movs r1, #0x7d
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x7d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x7d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_020248F0
	ldr r0, [sp, #8]
	adds r4, #0x30
	adds r0, r0, #1
	adds r7, #0x30
	adds r5, r5, #4
	adds r6, r6, #2
	str r0, [sp, #8]
	cmp r0, #2
	blt _0222AC44
	ldr r0, [sp]
	ldr r1, _0222ACD4 @ =0x0222F160
	ldr r0, [r0, #4]
	str r0, [r1, #0x4c]
	ldr r0, [sp]
	adds r0, #0x88
	str r0, [r1, #0x50]
	ldr r0, [sp, #4]
	str r0, [r1, #0x78]
	ldr r0, _0222ACD8 @ =0x0222F1AC
	bl FUN_02024624
	movs r2, #0x7f
	ldr r1, [sp]
	lsls r2, r2, #2
	str r0, [r1, r2]
	adds r0, r1, #0
	ldr r0, [r0, r2]
	movs r1, #0
	bl FUN_02024830
	movs r1, #0x7f
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #1
	bl FUN_020248F0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222ACD0: .4byte 0x0222F14C
_0222ACD4: .4byte 0x0222F160
_0222ACD8: .4byte 0x0222F1AC
	thumb_func_end ov43_0222AC28

	thumb_func_start ov43_0222ACDC
ov43_0222ACDC: @ 0x0222ACDC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02024758
	movs r6, #0x7d
	movs r4, #0
	lsls r6, r6, #2
_0222ACF0:
	ldr r0, [r5, r6]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _0222ACF0
	pop {r4, r5, r6, pc}
	thumb_func_end ov43_0222ACDC

	thumb_func_start ov43_0222AD00
ov43_0222AD00: @ 0x0222AD00
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0x7d
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	lsls r7, r7, #2
_0222AD0C:
	ldr r0, [r5, r7]
	adds r1, r6, #0
	bl FUN_02024830
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _0222AD0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222AD00

	thumb_func_start ov43_0222AD20
ov43_0222AD20: @ 0x0222AD20
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0x7d
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	lsls r7, r7, #2
_0222AD2C:
	ldr r0, [r5, r7]
	adds r1, r6, #0
	bl FUN_0202484C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _0222AD2C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222AD20

	thumb_func_start ov43_0222AD40
ov43_0222AD40: @ 0x0222AD40
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r2, #0
	lsls r2, r1, #0x19
	lsrs r6, r2, #0x18
	cmp r1, #2
	blo _0222AD52
	subs r1, r1, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
_0222AD52:
	movs r2, #0x7d
	lsls r2, r2, #2
	lsls r4, r1, #2
	adds r5, r0, r2
	ldr r0, [r5, r4]
	movs r1, #1
	bl FUN_0202484C
	adds r1, r6, #5
	ldr r0, [r5, r4]
	adds r1, r1, r7
	bl FUN_020248F0
	ldr r0, [r5, r4]
	bl FUN_02024964
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222AD40

	thumb_func_start ov43_0222AD74
ov43_0222AD74: @ 0x0222AD74
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r2, #0xff
	beq _0222AD8A
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r2, #0
	bl FUN_020248F0
_0222AD8A:
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02024830
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222AD74

	thumb_func_start ov43_0222AD98
ov43_0222AD98: @ 0x0222AD98
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r2, #0
	bl FUN_02024A04
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02024ADC
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov43_0222AD98

	thumb_func_start ov43_0222ADB8
ov43_0222ADB8: @ 0x0222ADB8
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	add r0, sp, #4
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, [r4]
	movs r1, #0x19
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	movs r0, #0xd
	str r0, [sp, #0x10]
	add r0, sp, #4
	strb r1, [r0, #0x10]
	movs r1, #9
	strb r1, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	movs r2, #0xf
	bics r1, r2
	ldr r2, [r5]
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	movs r2, #0xf
	ands r2, r3
	orrs r1, r2
	strb r1, [r0, #0x12]
	ldrb r1, [r0, #0x12]
	movs r2, #0xf0
	bics r1, r2
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x18
	orrs r1, r2
	strb r1, [r0, #0x12]
	movs r1, #0
	strb r1, [r0, #0x13]
	ldr r0, [r4, #0x60]
	add r1, sp, #4
	bl FUN_020166FC
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0
	movs r3, #0x3d
	bl FUN_0200B484
	add sp, #0x18
	pop {r4, r5, r6, pc}
	thumb_func_end ov43_0222ADB8

	thumb_func_start ov43_0222AE2C
ov43_0222AE2C: @ 0x0222AE2C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x60]
	bl FUN_020168F4
	adds r6, r0, #0
	subs r0, r6, #1
	cmp r0, #1
	bhi _0222AE58
	ldr r0, [r4, #0x60]
	bl FUN_020169C0
	str r0, [r5]
	ldr r0, [r4, #0x60]
	bl FUN_020169CC
	movs r0, #0
	movs r1, #0x3d
	movs r2, #1
	bl FUN_0200B4F0
_0222AE58:
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov43_0222AE2C

	thumb_func_start ov43_0222AE5C
ov43_0222AE5C: @ 0x0222AE5C
	push {r3, lr}
	bl ov43_0222B0A0
	pop {r3, pc}
	thumb_func_end ov43_0222AE5C

	thumb_func_start ov43_0222AE64
ov43_0222AE64: @ 0x0222AE64
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r1, #0
	adds r7, r3, #0
	ldrb r3, [r4, #8]
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r3, #0xb
	bhi _0222AEF0
	adds r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_0222AE82: @ jump table
	.2byte _0222AE9A - _0222AE82 - 2 @ case 0
	.2byte _0222AEBA - _0222AE82 - 2 @ case 1
	.2byte _0222AEC8 - _0222AE82 - 2 @ case 2
	.2byte _0222AED2 - _0222AE82 - 2 @ case 3
	.2byte _0222AEE6 - _0222AE82 - 2 @ case 4
	.2byte _0222AF3C - _0222AE82 - 2 @ case 5
	.2byte _0222AF5A - _0222AE82 - 2 @ case 6
	.2byte _0222AF68 - _0222AE82 - 2 @ case 7
	.2byte _0222AF88 - _0222AE82 - 2 @ case 8
	.2byte _0222AFF4 - _0222AE82 - 2 @ case 9
	.2byte _0222B00C - _0222AE82 - 2 @ case 10
	.2byte _0222B058 - _0222AE82 - 2 @ case 11
_0222AE9A:
	bl ov43_0222B1FC
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0x11
	adds r2, r1, #0
	adds r3, r0, #0
	str r7, [sp, #8]
	bl FUN_0200FA24
	movs r0, #1
	strb r0, [r4, #8]
	b _0222B08A
_0222AEBA:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0222AEF0
	movs r0, #3
	strb r0, [r4, #8]
	b _0222B08A
_0222AEC8:
	bl ov43_0222B1FC
	movs r0, #3
	strb r0, [r4, #8]
	b _0222B08A
_0222AED2:
	bl ov43_0222B374
	str r0, [sp, #0x10]
	cmp r0, #0
	beq _0222AEF0
	movs r0, #2
	str r0, [r5, #4]
	movs r0, #4
	strb r0, [r4, #8]
	b _0222B08A
_0222AEE6:
	ldr r3, [r5, #4]
	subs r2, r3, #1
	str r2, [r5, #4]
	cmp r3, #0
	beq _0222AEF2
_0222AEF0:
	b _0222B08A
_0222AEF2:
	movs r2, #0
	str r2, [r5, #4]
	bl ov43_0222B574
	cmp r0, #1
	bne _0222AF24
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222B440
	ldr r0, [r5]
	cmp r0, #3
	beq _0222AF10
	cmp r0, #1
	bne _0222AF16
_0222AF10:
	movs r0, #5
	strb r0, [r4, #8]
	b _0222B08A
_0222AF16:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov43_0222B458
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0222AF24:
	ldr r0, [r5]
	cmp r0, #1
	bne _0222B01C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x3a
	adds r3, r7, #0
	bl ov43_0222B4BC
	movs r0, #0xb
	strb r0, [r4, #8]
	b _0222B08A
_0222AF3C:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0x10
	str r7, [sp, #8]
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0222B08A
_0222AF5A:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0222B01C
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0222AF68:
	bl ov43_0222B1FC
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0x11
	adds r2, r1, #0
	adds r3, r0, #0
	str r7, [sp, #8]
	bl FUN_0200FA24
	movs r0, #8
	strb r0, [r4, #8]
	b _0222B08A
_0222AF88:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0222B08A
	adds r0, r7, #0
	bl FUN_02028ED0
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x58]
	bl FUN_02026AA4
	adds r1, r0, #0
	ldr r0, [sp, #0xc]
	bl FUN_02028F24
	ldr r0, [r6, #0x50]
	ldr r2, [sp, #0xc]
	movs r1, #0
	bl FUN_0200BE48
	ldr r0, [sp, #0xc]
	bl FUN_0201AB0C
	ldr r0, [r4, #0x5c]
	add r1, sp, #0x10
	bl FUN_020266FC
	adds r3, r0, #0
	ldr r0, [sp, #0x10]
	adds r2, r1, #0
	cmp r0, #0
	beq _0222AFE2
	adds r0, r6, #0
	adds r1, r3, #0
	bl ov43_0222AAA4
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x37
	adds r3, r7, #0
	bl ov43_0222B4BC
	movs r0, #9
	strb r0, [r4, #8]
	b _0222B08A
_0222AFE2:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x38
	adds r3, r7, #0
	bl ov43_0222B4BC
	movs r0, #0xb
	strb r0, [r4, #8]
	b _0222B08A
_0222AFF4:
	bl ov43_0222B534
	cmp r0, #0
	beq _0222B08A
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl ov43_0222ADB8
	movs r0, #0xa
	strb r0, [r4, #8]
	b _0222B08A
_0222B00C:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov43_0222AE2C
	cmp r0, #1
	beq _0222B01E
	cmp r0, #2
	beq _0222B04C
_0222B01C:
	b _0222B08A
_0222B01E:
	ldr r1, [r4, #0x5c]
	ldr r2, [r4, #0x58]
	adds r0, r4, #0
	bl ov43_0222A358
	adds r2, r0, #0
	bne _0222B038
	adds r0, r5, #0
	bl ov43_0222B55C
	movs r0, #3
	strb r0, [r4, #8]
	b _0222B08A
_0222B038:
	ldr r3, _0222B090 @ =0x0222F0C8
	adds r0, r5, #0
	ldrb r2, [r3, r2]
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov43_0222B4BC
	movs r0, #0xb
	strb r0, [r4, #8]
	b _0222B08A
_0222B04C:
	adds r0, r5, #0
	bl ov43_0222B55C
	movs r0, #3
	strb r0, [r4, #8]
	b _0222B08A
_0222B058:
	bl ov43_0222B534
	cmp r0, #0
	beq _0222B08A
	ldr r0, _0222B094 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	bne _0222B078
	movs r0, #2
	tst r0, r1
	bne _0222B078
	bl FUN_02025358
	cmp r0, #0
	beq _0222B08A
_0222B078:
	adds r0, r5, #0
	bl ov43_0222B55C
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov43_0222B408
	movs r0, #3
	strb r0, [r4, #8]
_0222B08A:
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222B090: .4byte 0x0222F0C8
_0222B094: .4byte 0x021D110C
	thumb_func_end ov43_0222AE64

	thumb_func_start ov43_0222B098
ov43_0222B098: @ 0x0222B098
	ldr r3, _0222B09C @ =ov43_0222B1D8
	bx r3
	.align 2, 0
_0222B09C: .4byte ov43_0222B1D8
	thumb_func_end ov43_0222B098

	thumb_func_start ov43_0222B0A0
ov43_0222B0A0: @ 0x0222B0A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #0x14]
	adds r0, #8
	adds r5, r1, #0
	str r2, [sp, #0x24]
	str r3, [sp, #0x18]
	bl FUN_0201D3C4
	movs r3, #4
	ldr r1, [sp, #0x14]
	str r3, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x14
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x24]
	adds r1, #8
	ldr r0, [r0]
	movs r2, #3
	bl FUN_0201D40C
	ldr r0, [sp, #0x14]
	adds r0, #0x20
	bl FUN_0201D3C4
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0xac
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x14]
	ldr r0, [r0]
	adds r1, #0x20
	movs r2, #1
	movs r3, #2
	bl FUN_0201D40C
	ldr r0, [sp, #0x14]
	movs r1, #0
	adds r0, #8
	bl FUN_0201D978
	ldr r0, [sp, #0x14]
	movs r1, #0
	adds r0, #0x20
	bl FUN_0201D978
	ldr r1, [sp, #0x18]
	movs r0, #0x80
	bl FUN_02026354
	ldr r1, [sp, #0x14]
	str r0, [r1, #0x3c]
	ldr r0, [r5, #4]
	bl FUN_02028EA8
	bl FUN_0202AD3C
	ldr r1, [sp, #0x14]
	str r0, [r1, #0x38]
	ldr r1, [sp, #0x18]
	movs r0, #0x80
	bl FUN_02026354
	adds r4, r0, #0
	ldr r1, [sp, #0x18]
	movs r0, #0x80
	bl FUN_02026354
	str r0, [sp, #0x1c]
	ldr r0, [r5, #4]
	bl FUN_02028E9C
	adds r2, r0, #0
	ldr r0, [sp, #0x24]
	movs r1, #0
	ldr r0, [r0, #0x50]
	bl FUN_0200BE48
	ldr r0, [sp, #0x14]
	movs r7, #0
	str r0, [sp, #0x20]
	adds r0, #8
	movs r5, #8
	str r0, [sp, #0x20]
_0222B160:
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x1c]
	ldr r0, [r0, #0x54]
	adds r1, r7, #1
	bl FUN_0200BB6C
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x1c]
	ldr r0, [r0, #0x50]
	adds r1, r4, #0
	bl FUN_0200CBBC
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0
	bl FUN_02002F30
	mov ip, r0
	str r5, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222B1D4 @ =0x00010F00
	movs r3, #0xc0
	str r0, [sp, #8]
	movs r0, #0
	mov r6, ip
	str r0, [sp, #0xc]
	subs r3, r3, r6
	ldr r0, [sp, #0x20]
	movs r1, #4
	adds r2, r4, #0
	lsrs r3, r3, #1
	bl FUN_020200FC
	adds r7, r7, #1
	adds r5, #0x28
	cmp r7, #4
	blt _0222B160
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, [sp, #0x1c]
	bl FUN_02026380
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x14]
	str r0, [sp]
	ldr r0, [sp, #0x24]
	movs r1, #0xb
	ldr r0, [r0, #0x58]
	movs r2, #1
	adds r3, #0x1c
	bl FUN_02007C2C
	ldr r1, [sp, #0x14]
	str r0, [r1, #0x18]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222B1D4: .4byte 0x00010F00
	thumb_func_end ov43_0222B0A0

	thumb_func_start ov43_0222B1D8
ov43_0222B1D8: @ 0x0222B1D8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #8
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x20
	bl FUN_0201D520
	ldr r0, [r4, #0x18]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov43_0222B1D8

	thumb_func_start ov43_0222B1FC
ov43_0222B1FC: @ 0x0222B1FC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r2, #0
	adds r1, r4, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, #0x64
	movs r2, #0
	bl ov43_0222A9F4
	adds r0, r5, #0
	adds r0, #8
	bl FUN_0201D5C8
	ldr r2, [r5, #0x1c]
	movs r3, #0
	str r3, [sp]
	ldrh r0, [r2]
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	adds r2, #0xc
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4]
	bl FUN_0201C4C4
	movs r2, #0
	ldr r0, [r4]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201F238
	ldr r0, [r4]
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov43_0222AD74
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov43_0222AD98
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222B3A4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov43_0222B1FC

	thumb_func_start ov43_0222B278
ov43_0222B278: @ 0x0222B278
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0222B314 @ =0x021D110C
	adds r4, r2, #0
	ldr r3, [r0, #0x48]
	ldr r0, _0222B318 @ =0x00000CF3
	movs r2, #0
	tst r0, r3
	beq _0222B28C
	str r2, [r1]
_0222B28C:
	ldr r6, _0222B314 @ =0x021D110C
	movs r0, #1
	ldr r1, [r6, #0x48]
	adds r3, r1, #0
	tst r3, r0
	beq _0222B2AA
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222B3C4
	ldr r0, _0222B31C @ =0x000005DD
	bl FUN_0200604C
	movs r0, #1
	pop {r4, r5, r6, pc}
_0222B2AA:
	movs r3, #2
	tst r1, r3
	beq _0222B2BE
	ldr r0, _0222B31C @ =0x000005DD
	bl FUN_0200604C
	movs r0, #3
	str r0, [r5]
	movs r0, #1
	pop {r4, r5, r6, pc}
_0222B2BE:
	ldr r1, [r6, #0x4c]
	movs r3, #0x40
	tst r3, r1
	beq _0222B2DC
	ldr r1, [r5]
	cmp r1, #0
	beq _0222B2D4
	subs r1, r1, #1
	str r1, [r5]
	adds r2, r0, #0
	b _0222B2F6
_0222B2D4:
	movs r1, #3
	str r1, [r5]
	adds r2, r0, #0
	b _0222B2F6
_0222B2DC:
	movs r3, #0x80
	tst r1, r3
	beq _0222B2F6
	ldr r1, [r5]
	cmp r1, #3
	bhs _0222B2F0
	adds r1, r1, #1
	str r1, [r5]
	adds r2, r0, #0
	b _0222B2F6
_0222B2F0:
	movs r1, #0
	str r1, [r5]
	adds r2, r0, #0
_0222B2F6:
	cmp r2, #1
	bne _0222B310
	ldr r0, _0222B320 @ =0x000005E5
	bl FUN_0200604C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222B3A4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201EFBC
_0222B310:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222B314: .4byte 0x021D110C
_0222B318: .4byte 0x00000CF3
_0222B31C: .4byte 0x000005DD
_0222B320: .4byte 0x000005E5
	thumb_func_end ov43_0222B278

	thumb_func_start ov43_0222B324
ov43_0222B324: @ 0x0222B324
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0222B36C @ =0x0222EE1A
	adds r6, r1, #0
	adds r4, r2, #0
	adds r7, r3, #0
	bl FUN_0202529C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0222B340
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222B340:
	movs r1, #1
	str r1, [r7]
	str r1, [r6]
	str r0, [r5]
	ldr r0, _0222B370 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222B3C4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222B3A4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201EFBC
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222B36C: .4byte 0x0222EE1A
_0222B370: .4byte 0x000005DD
	thumb_func_end ov43_0222B324

	thumb_func_start ov43_0222B374
ov43_0222B374: @ 0x0222B374
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	movs r3, #0
	str r3, [sp]
	add r3, sp, #0
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov43_0222B324
	ldr r1, [sp]
	cmp r1, #0
	beq _0222B396
	movs r1, #1
	add sp, #4
	str r1, [r4]
	pop {r3, r4, r5, r6, pc}
_0222B396:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov43_0222B278
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov43_0222B374

	thumb_func_start ov43_0222B3A4
ov43_0222B3A4: @ 0x0222B3A4
	adds r2, r0, #0
	ldr r3, [r2]
	movs r2, #0x28
	muls r2, r3, r2
	movs r0, #0x7f
	adds r2, #0x30
	lsls r0, r0, #2
	lsls r2, r2, #0x10
	ldr r0, [r1, r0]
	ldr r3, _0222B3C0 @ =FUN_0200DD88
	movs r1, #0x80
	asrs r2, r2, #0x10
	bx r3
	nop
_0222B3C0: .4byte FUN_0200DD88
	thumb_func_end ov43_0222B3A4

	thumb_func_start ov43_0222B3C4
ov43_0222B3C4: @ 0x0222B3C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	adds r6, r1, #0
	movs r4, #0
	movs r5, #4
_0222B3D0:
	ldr r0, [r7]
	cmp r0, r4
	bne _0222B3DA
	movs r1, #9
	b _0222B3DC
_0222B3DA:
	movs r1, #2
_0222B3DC:
	movs r0, #0x1c
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r1, #2
	lsls r3, r5, #0x18
	ldr r0, [r6]
	adds r2, r1, #0
	lsrs r3, r3, #0x18
	bl FUN_0201CA4C
	adds r4, r4, #1
	adds r5, r5, #5
	cmp r4, #4
	blt _0222B3D0
	ldr r0, [r6]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222B3C4

	thumb_func_start ov43_0222B408
ov43_0222B408: @ 0x0222B408
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	movs r6, #0
	movs r4, #4
	movs r7, #2
_0222B414:
	movs r0, #0x1c
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	str r7, [sp, #8]
	lsls r3, r4, #0x18
	ldr r0, [r5]
	adds r1, r7, #0
	adds r2, r7, #0
	lsrs r3, r3, #0x18
	bl FUN_0201CA4C
	ldr r0, [r5]
	movs r1, #2
	bl FUN_0201EFBC
	adds r6, r6, #1
	adds r4, r4, #5
	cmp r6, #4
	blt _0222B414
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222B408

	thumb_func_start ov43_0222B440
ov43_0222B440: @ 0x0222B440
	adds r2, r0, #0
	adds r0, r1, #0
	ldr r2, [r2]
	ldr r1, _0222B450 @ =0x0222F0CC
	ldr r3, _0222B454 @ =ov43_0222A318
	ldrb r1, [r1, r2]
	movs r2, #0
	bx r3
	.align 2, 0
_0222B450: .4byte 0x0222F0CC
_0222B454: .4byte ov43_0222A318
	thumb_func_end ov43_0222B440

	thumb_func_start ov43_0222B458
ov43_0222B458: @ 0x0222B458
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov43_0222AA70
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201C8C4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201EFBC
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201C8C4
	ldr r0, [r4]
	movs r1, #3
	bl FUN_0201EFBC
	adds r5, #8
	adds r0, r5, #0
	bl FUN_0201D8E4
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xff
	bl ov43_0222AD74
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222B458

	thumb_func_start ov43_0222B4BC
ov43_0222B4BC: @ 0x0222B4BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x80
	adds r1, r3, #0
	adds r7, r2, #0
	bl FUN_02026354
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [r4, #0x54]
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_0200BB6C
	ldr r0, [r4, #0x50]
	ldr r1, [r5, #0x3c]
	adds r2, r6, #0
	bl FUN_0200CBBC
	movs r0, #1
	bl FUN_02002B8C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x38]
	movs r1, #1
	str r0, [sp, #4]
	ldr r0, _0222B530 @ =0x00010200
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x3c]
	adds r0, #0x20
	bl FUN_020200FC
	str r0, [r5, #0x34]
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #1
	movs r2, #0x46
	movs r3, #0xc
	bl FUN_0200E998
	adds r5, #0x20
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222B530: .4byte 0x00010200
	thumb_func_end ov43_0222B4BC

	thumb_func_start ov43_0222B534
ov43_0222B534: @ 0x0222B534
	push {r4, lr}
	ldr r0, [r0, #0x34]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0222B556
	movs r0, #0
	bl FUN_02002B8C
	bl FUN_02002C04
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
_0222B556:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov43_0222B534

	thumb_func_start ov43_0222B55C
ov43_0222B55C: @ 0x0222B55C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x20
	movs r1, #1
	bl FUN_0200E9BC
	adds r4, #0x20
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov43_0222B55C

	thumb_func_start ov43_0222B574
ov43_0222B574: @ 0x0222B574
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	cmp r0, #1
	bne _0222B59E
	ldr r0, [r1, #4]
	bl FUN_0202C6F4
	adds r5, r0, #0
	movs r4, #0
_0222B586:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0202C2DC
	cmp r0, #0
	bne _0222B596
	movs r0, #1
	pop {r3, r4, r5, pc}
_0222B596:
	adds r4, r4, #1
	cmp r4, #0x20
	blt _0222B586
	b _0222B5A2
_0222B59E:
	movs r0, #1
	pop {r3, r4, r5, pc}
_0222B5A2:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov43_0222B574

	thumb_func_start ov43_0222B5A8
ov43_0222B5A8: @ 0x0222B5A8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_02028EA8
	bl FUN_0202AD3C
	adds r1, r5, #0
	adds r1, #0xe0
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov43_0222B944
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222B5A8

	thumb_func_start ov43_0222B5D0
ov43_0222B5D0: @ 0x0222B5D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r1, #0
	ldrb r5, [r4, #8]
	adds r6, r0, #0
	adds r7, r2, #0
	str r3, [sp, #0xc]
	cmp r5, #0x17
	bls _0222B5E4
	b _0222B932
_0222B5E4:
	adds r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	add pc, r5
_0222B5F0: @ jump table
	.2byte _0222B620 - _0222B5F0 - 2 @ case 0
	.2byte _0222B62A - _0222B5F0 - 2 @ case 1
	.2byte _0222B642 - _0222B5F0 - 2 @ case 2
	.2byte _0222B68A - _0222B5F0 - 2 @ case 3
	.2byte _0222B694 - _0222B5F0 - 2 @ case 4
	.2byte _0222B6A2 - _0222B5F0 - 2 @ case 5
	.2byte _0222B6E0 - _0222B5F0 - 2 @ case 6
	.2byte _0222B6E8 - _0222B5F0 - 2 @ case 7
	.2byte _0222B6F4 - _0222B5F0 - 2 @ case 8
	.2byte _0222B720 - _0222B5F0 - 2 @ case 9
	.2byte _0222B744 - _0222B5F0 - 2 @ case 10
	.2byte _0222B780 - _0222B5F0 - 2 @ case 11
	.2byte _0222B7A2 - _0222B5F0 - 2 @ case 12
	.2byte _0222B7B8 - _0222B5F0 - 2 @ case 13
	.2byte _0222B7E2 - _0222B5F0 - 2 @ case 14
	.2byte _0222B7F0 - _0222B5F0 - 2 @ case 15
	.2byte _0222B7FA - _0222B5F0 - 2 @ case 16
	.2byte _0222B808 - _0222B5F0 - 2 @ case 17
	.2byte _0222B84A - _0222B5F0 - 2 @ case 18
	.2byte _0222B856 - _0222B5F0 - 2 @ case 19
	.2byte _0222B8BA - _0222B5F0 - 2 @ case 20
	.2byte _0222B8C6 - _0222B5F0 - 2 @ case 21
	.2byte _0222B8E2 - _0222B5F0 - 2 @ case 22
	.2byte _0222B91E - _0222B5F0 - 2 @ case 23
_0222B620:
	movs r0, #0
	strh r0, [r6]
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	strh r0, [r6, #6]
_0222B62A:
	adds r0, r4, #0
	bl ov43_0222A420
	ldr r3, [sp, #0xc]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov43_0222BB20
	movs r0, #2
	strb r0, [r4, #8]
	b _0222B932
_0222B642:
	bl ov43_0222BFA4
	cmp r0, #4
	bhi _0222B70A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222B656: @ jump table
	.2byte _0222B932 - _0222B656 - 2 @ case 0
	.2byte _0222B660 - _0222B656 - 2 @ case 1
	.2byte _0222B66C - _0222B656 - 2 @ case 2
	.2byte _0222B678 - _0222B656 - 2 @ case 3
	.2byte _0222B67E - _0222B656 - 2 @ case 4
_0222B660:
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #2
	bl ov43_0222C53C
	b _0222B932
_0222B66C:
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #3
	bl ov43_0222C53C
	b _0222B932
_0222B678:
	movs r0, #0x17
	strb r0, [r4, #8]
	b _0222B932
_0222B67E:
	movs r0, #4
	adds r6, #0xf4
	str r0, [r6]
	movs r0, #5
	strb r0, [r4, #8]
	b _0222B932
_0222B68A:
	bl ov43_0222BFD4
	movs r0, #4
	strb r0, [r4, #8]
	b _0222B932
_0222B694:
	bl ov43_0222C024
	cmp r0, #1
	bne _0222B70A
	movs r0, #2
	strb r0, [r4, #8]
	b _0222B932
_0222B6A2:
	adds r2, r6, #0
	adds r2, #0xf4
	adds r1, r6, #0
	ldr r2, [r2]
	adds r1, #0xf4
	subs r3, r2, #1
	adds r2, r6, #0
	ldr r1, [r1]
	adds r2, #0xf4
	str r3, [r2]
	cmp r1, #0
	bgt _0222B70A
	adds r1, r6, #0
	movs r2, #0
	adds r1, #0xf4
	str r2, [r1]
	bl ov43_0222C620
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222A41C
	ldr r3, [sp, #0xc]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov43_0222C148
	movs r0, #6
	strb r0, [r4, #8]
	b _0222B932
_0222B6E0:
	bl ov43_0222C228
	strb r0, [r4, #8]
	b _0222B932
_0222B6E8:
	movs r0, #4
	adds r6, #0xf4
	str r0, [r6]
	movs r0, #8
	strb r0, [r4, #8]
	b _0222B932
_0222B6F4:
	adds r3, r6, #0
	adds r3, #0xf4
	ldr r3, [r3]
	subs r5, r3, #1
	adds r3, r6, #0
	adds r3, #0xf4
	adds r6, #0xf4
	str r5, [r3]
	ldr r3, [r6]
	cmp r3, #0
	ble _0222B70C
_0222B70A:
	b _0222B932
_0222B70C:
	bl ov43_0222BBB8
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	bl ov43_0222A318
	add sp, #0x18
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222B720:
	movs r1, #0xb
	ldrsb r2, [r4, r1]
	asrs r0, r2, #2
	lsrs r0, r0, #0x1d
	adds r0, r2, r0
	asrs r0, r0, #3
	strh r0, [r6]
	ldrsb r0, [r4, r1]
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1d
	subs r1, r1, r2
	movs r0, #0x1d
	rors r1, r0
	adds r0, r2, r1
	strh r0, [r6, #4]
	movs r0, #1
	strb r0, [r4, #8]
	b _0222B932
_0222B744:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r3, #0
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0x10
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	adds r0, r6, #0
	bl ov43_0222C620
	adds r5, r0, #0
	ldr r0, [r4, #4]
	bl FUN_0202C6F4
	adds r1, r4, r5
	ldrb r1, [r1, #0x18]
	bl FUN_0202C254
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222A414
	movs r0, #0xb
	strb r0, [r4, #8]
	b _0222B932
_0222B780:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0222B818
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov43_0222BBB8
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	bl ov43_0222A318
	add sp, #0x18
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222B7A2:
	bl ov43_0222C620
	adds r5, r0, #0
	ldr r0, [r4, #4]
	bl FUN_0202C6F4
	adds r1, r4, r5
	ldrb r1, [r1, #0x18]
	ldr r2, [r4, #0x58]
	bl FUN_0202C270
_0222B7B8:
	ldr r3, [sp, #0xc]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov43_0222BB20
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	movs r1, #0x11
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0xe
	strb r0, [r4, #8]
	b _0222B932
_0222B7E2:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0222B818
	movs r0, #2
	strb r0, [r4, #8]
	b _0222B932
_0222B7F0:
	bl ov43_0222C32C
	movs r0, #0x10
	strb r0, [r4, #8]
	b _0222B932
_0222B7FA:
	bl ov43_0222C358
	cmp r0, #1
	bne _0222B818
	movs r0, #0x11
	strb r0, [r4, #8]
	b _0222B932
_0222B808:
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov43_0222AE2C
	cmp r0, #1
	beq _0222B81A
	cmp r0, #2
	beq _0222B826
_0222B818:
	b _0222B932
_0222B81A:
	adds r0, r6, #0
	bl ov43_0222C600
	movs r0, #0x12
	strb r0, [r4, #8]
	b _0222B932
_0222B826:
	adds r0, r6, #0
	bl ov43_0222C600
	adds r0, r7, #0
	movs r1, #1
	bl ov43_0222AD00
	movs r2, #4
	adds r0, r6, #0
	ldrsh r2, [r6, r2]
	adds r0, #8
	adds r1, r7, #0
	movs r3, #0
	bl ov43_0222C890
	movs r0, #2
	strb r0, [r4, #8]
	b _0222B932
_0222B84A:
	adds r1, r7, #0
	bl ov43_0222C65C
	movs r0, #0x13
	strb r0, [r4, #8]
	b _0222B932
_0222B856:
	adds r1, r7, #0
	bl ov43_0222C714
	cmp r0, #1
	bne _0222B932
	ldr r0, [r4, #4]
	bl FUN_0202C6F4
	str r0, [sp, #0x10]
	adds r0, r6, #0
	bl ov43_0222C620
	str r0, [sp, #0x14]
	adds r5, r4, #0
	ldr r1, [sp, #0x14]
	adds r5, #0x18
	ldrb r1, [r5, r1]
	ldr r0, [sp, #0x10]
	bl FUN_0202C338
	ldr r0, [r4, #4]
	bl FUN_0203107C
	ldr r1, [sp, #0x14]
	ldrb r1, [r5, r1]
	bl FUN_020311AC
	adds r0, r4, #0
	bl ov43_0222A420
	movs r0, #4
	ldrsh r0, [r6, r0]
	movs r3, #0
	adds r1, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0xc]
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldrsh r3, [r6, r3]
	adds r0, r6, #0
	adds r2, r7, #0
	bl ov43_0222C378
	adds r0, r7, #0
	movs r1, #1
	bl ov43_0222AD00
	movs r0, #0x14
	strb r0, [r4, #8]
	b _0222B932
_0222B8BA:
	adds r1, r7, #0
	bl ov43_0222C750
	movs r0, #2
	strb r0, [r4, #8]
	b _0222B932
_0222B8C6:
	bl ov43_0222C2B0
	cmp r0, #1
	bne _0222B8D4
	movs r0, #0x16
	strb r0, [r4, #8]
	b _0222B932
_0222B8D4:
	adds r0, r7, #0
	movs r1, #1
	bl ov43_0222AD00
	movs r0, #2
	strb r0, [r4, #8]
	b _0222B932
_0222B8E2:
	bl ov43_0222C5D8
	cmp r0, #0
	beq _0222B932
	ldr r0, _0222B938 @ =0x021D110C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	bne _0222B8FA
	bl FUN_02025358
	cmp r0, #0
	beq _0222B932
_0222B8FA:
	adds r0, r7, #0
	movs r1, #1
	bl ov43_0222AD00
	movs r2, #4
	adds r0, r6, #0
	ldrsh r2, [r6, r2]
	adds r0, #8
	adds r1, r7, #0
	movs r3, #0
	bl ov43_0222C890
	movs r0, #2
	strb r0, [r4, #8]
	adds r0, r6, #0
	bl ov43_0222C600
	b _0222B932
_0222B91E:
	bl ov43_0222BBB8
	adds r0, r4, #0
	movs r1, #0
	movs r2, #2
	bl ov43_0222A318
	add sp, #0x18
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222B932:
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222B938: .4byte 0x021D110C
	thumb_func_end ov43_0222B5D0

	thumb_func_start ov43_0222B93C
ov43_0222B93C: @ 0x0222B93C
	ldr r3, _0222B940 @ =ov43_0222BAB8
	bx r3
	.align 2, 0
_0222B940: .4byte ov43_0222BAB8
	thumb_func_end ov43_0222B93C

	thumb_func_start ov43_0222B944
ov43_0222B944: @ 0x0222B944
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	str r0, [sp, #0x18]
	ldr r4, [sp, #0x18]
	movs r0, #0
	ldr r5, _0222BA9C @ =0x0222ED74
	ldr r6, _0222BAA0 @ =0x0222EE08
	adds r7, r2, #0
	str r3, [sp, #0x1c]
	str r0, [sp, #0x28]
	adds r4, #8
_0222B95A:
	ldr r0, [sp, #0x1c]
	adds r1, r7, #0
	str r0, [sp]
	ldrh r3, [r5]
	adds r0, r4, #0
	adds r2, r6, #0
	bl ov43_0222C788
	ldr r0, [sp, #0x28]
	adds r5, r5, #2
	adds r0, r0, #1
	adds r6, r6, #6
	adds r4, #0x38
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _0222B95A
	ldr r0, [r7, #4]
	ldr r3, [sp, #0x1c]
	movs r1, #0
	movs r2, #0x10
	bl FUN_02227060
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r1, #0xb4
	str r0, [r1]
	ldr r0, [sp, #0x18]
	movs r1, #1
	adds r0, #0xb4
	ldr r0, [r0]
	movs r2, #2
	bl FUN_02227228
	movs r3, #0x15
	ldr r1, [sp, #0x18]
	str r3, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _0222BAA4 @ =0x0000014F
	adds r1, #0xb8
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r7]
	movs r2, #1
	bl ov43_0222A24C
	ldr r0, [r7, #0x54]
	movs r1, #7
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222BAA8 @ =0x00010F00
	movs r1, #4
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	adds r2, r4, #0
	adds r0, #0xb8
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #0
	str r0, [sp, #0x20]
	ldr r0, _0222BAAC @ =0x0222EEE0
	ldr r6, [sp, #0x18]
	str r0, [sp, #0x24]
_0222B9F4:
	ldr r1, [sp, #0x1c]
	movs r0, #4
	bl FUN_02014918
	adds r1, r6, #0
	adds r1, #0xe4
	ldr r5, [sp, #0x24]
	str r0, [r1]
	movs r4, #0
_0222BA06:
	adds r0, r6, #0
	adds r0, #0xe4
	ldr r0, [r0]
	ldr r1, [r7, #0x54]
	ldr r2, [r5]
	ldr r3, [r5, #4]
	bl FUN_02014960
	adds r4, r4, #1
	adds r5, #8
	cmp r4, #4
	blt _0222BA06
	ldr r0, [sp, #0x24]
	adds r6, r6, #4
	adds r0, #0x20
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	adds r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #2
	blt _0222B9F4
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _0222BAB0 @ =0x00000161
	ldr r1, [sp, #0x18]
	str r0, [sp, #0x10]
	movs r0, #0xf
	str r0, [sp, #0x14]
	ldr r0, [r7]
	adds r1, #0xc8
	movs r2, #1
	movs r3, #2
	bl ov43_0222A24C
	ldr r1, [sp, #0x1c]
	movs r0, #0x80
	bl FUN_02026354
	ldr r1, [sp, #0x18]
	ldr r4, _0222BAB4 @ =0x0222EEB0
	adds r1, #0xd8
	str r0, [r1]
	add r3, sp, #0x2c
	movs r2, #6
_0222BA6A:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0222BA6A
	ldr r0, [r7, #4]
	adds r7, #0x88
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x1c]
	str r7, [sp, #0x30]
	str r0, [sp, #0x58]
	add r0, sp, #0x2c
	bl FUN_02024624
	ldr r1, [sp, #0x18]
	adds r1, #0xf8
	str r0, [r1]
	ldr r0, [sp, #0x18]
	movs r1, #0
	adds r0, #0xf8
	str r0, [sp, #0x18]
	ldr r0, [r0]
	bl FUN_02024830
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222BA9C: .4byte 0x0222ED74
_0222BAA0: .4byte 0x0222EE08
_0222BAA4: .4byte 0x0000014F
_0222BAA8: .4byte 0x00010F00
_0222BAAC: .4byte 0x0222EEE0
_0222BAB0: .4byte 0x00000161
_0222BAB4: .4byte 0x0222EEB0
	thumb_func_end ov43_0222B944

	thumb_func_start ov43_0222BAB8
ov43_0222BAB8: @ 0x0222BAB8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0xf8
	ldr r0, [r0]
	adds r7, r2, #0
	bl FUN_02024758
	adds r0, r5, #0
	adds r0, #0xc8
	bl FUN_0201D520
	adds r0, r5, #0
	adds r0, #0xd8
	ldr r0, [r0]
	bl FUN_02026380
	movs r6, #0
	adds r4, r5, #0
_0222BADC:
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	bl FUN_02014950
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #2
	blt _0222BADC
	adds r0, r5, #0
	adds r0, #0xb8
	bl FUN_0201D520
	adds r0, r5, #0
	adds r0, #0xb4
	ldr r0, [r0]
	bl FUN_02227274
	adds r0, r5, #0
	adds r0, #0xb4
	ldr r0, [r0]
	bl FUN_02227114
	movs r4, #0
	adds r5, #8
_0222BB0E:
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov43_0222C7EC
	adds r4, r4, #1
	adds r5, #0x38
	cmp r4, #3
	blt _0222BB0E
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222BAB8

	thumb_func_start ov43_0222BB20
ov43_0222BB20: @ 0x0222BB20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r2, #0
	adds r7, r1, #0
	adds r1, r4, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, #0x64
	movs r2, #5
	adds r6, r3, #0
	bl ov43_0222A9F4
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xe
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #3
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	ldrh r2, [r0]
	movs r3, #0x14
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r2, #0x11
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl FUN_0201C4EC
	adds r0, r5, #0
	adds r0, #0xb8
	bl FUN_0201D5C8
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0201EFBC
	adds r0, r4, #0
	movs r1, #1
	bl ov43_0222AD00
	movs r0, #4
	ldrsh r0, [r5, r0]
	movs r3, #0
	adds r1, r7, #0
	str r0, [sp]
	str r3, [sp, #4]
	str r6, [sp, #8]
	ldrsh r3, [r5, r3]
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov43_0222C378
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov43_0222AD74
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x10
	bl ov43_0222AD98
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222BB20

	thumb_func_start ov43_0222BBB8
ov43_0222BBB8: @ 0x0222BBB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r2, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov43_0222AA70
	adds r0, r5, #0
	adds r0, #0xb8
	bl FUN_0201D8E4
	movs r7, #2
	movs r6, #0
	adds r5, #8
	lsls r7, r7, #8
_0222BBD6:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r4, r7
	bl ov43_0222C9A4
	adds r6, r6, #1
	adds r5, #0x38
	cmp r6, #3
	blt _0222BBD6
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xff
	bl ov43_0222AD74
	adds r0, r4, #0
	movs r1, #1
	movs r2, #9
	bl ov43_0222AD98
	adds r0, r4, #0
	movs r1, #0
	bl ov43_0222AD00
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xe
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r2, #0x11
	str r2, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	ldrh r3, [r0]
	lsls r3, r3, #0x15
	lsrs r3, r3, #0x18
	str r3, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r3, #0x14
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl FUN_0201C4EC
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0x10
	adds r1, r0, #0
	str r2, [sp]
	movs r3, #4
	str r3, [sp, #4]
	adds r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #0
	adds r3, r1, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl FUN_0201C4EC
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222BBB8

	thumb_func_start ov43_0222BC78
ov43_0222BC78: @ 0x0222BC78
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r3, #0
	bne _0222BC9C
	ldr r0, _0222BD14 @ =0x000005DD
	bl FUN_0200604C
	movs r2, #4
	adds r0, r5, #0
	ldrsh r2, [r5, r2]
	adds r0, #8
	adds r1, r4, #0
	movs r3, #1
	bl ov43_0222C890
	movs r0, #3
	pop {r3, r4, r5, pc}
_0222BC9C:
	cmp r3, #5
	bne _0222BCEA
	movs r0, #4
	ldrsh r2, [r5, r0]
	cmp r2, #8
	bne _0222BCC2
	ldr r0, _0222BD14 @ =0x000005DD
	bl FUN_0200604C
	movs r2, #4
	adds r0, r5, #0
	ldrsh r2, [r5, r2]
	adds r0, #8
	adds r1, r4, #0
	movs r3, #1
	bl ov43_0222C890
	movs r0, #3
	pop {r3, r4, r5, pc}
_0222BCC2:
	movs r0, #0
	ldrsh r3, [r5, r0]
	ldr r1, [r1, #0x10]
	lsls r3, r3, #3
	adds r2, r2, r3
	cmp r1, r2
	bls _0222BD10
	ldr r0, _0222BD14 @ =0x000005DD
	bl FUN_0200604C
	movs r2, #4
	adds r0, r5, #0
	ldrsh r2, [r5, r2]
	adds r0, #8
	adds r1, r4, #0
	movs r3, #1
	bl ov43_0222C890
	movs r0, #4
	pop {r3, r4, r5, pc}
_0222BCEA:
	cmp r3, #1
	bne _0222BCFC
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl ov43_0222AD40
	movs r0, #1
	pop {r3, r4, r5, pc}
_0222BCFC:
	cmp r3, #2
	bne _0222BD0E
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov43_0222AD40
	movs r0, #2
	pop {r3, r4, r5, pc}
_0222BD0E:
	movs r0, #0
_0222BD10:
	pop {r3, r4, r5, pc}
	nop
_0222BD14: .4byte 0x000005DD
	thumb_func_end ov43_0222BC78

	thumb_func_start ov43_0222BD18
ov43_0222BD18: @ 0x0222BD18
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0222BEE0 @ =0x021D110C
	adds r6, r1, #0
	ldr r1, [r0, #0x48]
	ldr r0, _0222BEE4 @ =0x00000CF3
	adds r7, r2, #0
	tst r0, r1
	beq _0222BD30
	movs r0, #0
	str r0, [r6]
_0222BD30:
	ldr r0, _0222BEE0 @ =0x021D110C
	movs r2, #1
	ldr r1, [r0, #0x48]
	tst r2, r1
	beq _0222BD4A
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #5
	bl ov43_0222BC78
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0222BD4A:
	movs r2, #2
	tst r1, r2
	beq _0222BD72
	movs r0, #8
	strh r0, [r5, #4]
	movs r2, #4
	adds r0, r5, #0
	ldrsh r2, [r5, r2]
	adds r0, #8
	adds r1, r7, #0
	bl ov43_0222C844
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0
	bl ov43_0222BC78
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0222BD72:
	movs r1, #4
	ldrsh r1, [r5, r1]
	movs r4, #0
	lsls r2, r1, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	adds r2, r4, #0
	str r2, [sp, #4]
	ldr r2, [r0, #0x4c]
	movs r0, #0x40
	tst r0, r2
	beq _0222BDBA
	cmp r1, #8
	bne _0222BDA0
	movs r0, #6
	ldrsh r0, [r5, r0]
	movs r4, #1
	adds r1, r4, #0
	strh r0, [r5, #4]
	adds r0, r7, #0
	bl ov43_0222AD00
	b _0222BE62
_0222BDA0:
	cmp r1, #4
	bge _0222BDB0
	cmp r1, #0
	ble _0222BE62
	subs r0, r1, #1
	strh r0, [r5, #4]
	movs r4, #1
	b _0222BE62
_0222BDB0:
	ble _0222BE62
	subs r0, r1, #1
	strh r0, [r5, #4]
	movs r4, #1
	b _0222BE62
_0222BDBA:
	movs r0, #0x80
	tst r0, r2
	beq _0222BDEC
	cmp r1, #3
	beq _0222BDC8
	cmp r1, #7
	bne _0222BDD0
_0222BDC8:
	movs r0, #8
	strh r0, [r5, #4]
	movs r4, #1
	b _0222BE62
_0222BDD0:
	cmp r1, #4
	bge _0222BDE0
	cmp r1, #3
	bge _0222BE62
	adds r0, r1, #1
	strh r0, [r5, #4]
	movs r4, #1
	b _0222BE62
_0222BDE0:
	cmp r1, #7
	bge _0222BE62
	adds r0, r1, #1
	strh r0, [r5, #4]
	movs r4, #1
	b _0222BE62
_0222BDEC:
	movs r0, #0x20
	tst r0, r2
	beq _0222BE12
	cmp r1, #8
	beq _0222BE62
	cmp r1, #4
	bge _0222BE0A
	adds r0, r1, #4
	movs r4, #1
	strh r0, [r5, #4]
	adds r0, r4, #0
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp]
	b _0222BE62
_0222BE0A:
	subs r0, r1, #4
	strh r0, [r5, #4]
	movs r4, #1
	b _0222BE62
_0222BE12:
	movs r3, #0x10
	adds r0, r2, #0
	tst r0, r3
	beq _0222BE38
	cmp r1, #8
	beq _0222BE62
	cmp r1, #4
	bge _0222BE2A
	adds r0, r1, #4
	strh r0, [r5, #4]
	movs r4, #1
	b _0222BE62
_0222BE2A:
	subs r0, r1, #4
	movs r4, #1
	strh r0, [r5, #4]
	adds r0, r4, #0
	str r0, [sp, #4]
	str r0, [sp]
	b _0222BE62
_0222BE38:
	ldrb r0, [r6, #0xe]
	cmp r0, #0
	beq _0222BE62
	beq _0222BE50
	lsls r1, r3, #5
	tst r1, r2
	beq _0222BE50
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	str r0, [sp]
	b _0222BE62
_0222BE50:
	cmp r0, #0
	beq _0222BE62
	movs r0, #1
	lsls r0, r0, #8
	tst r0, r2
	beq _0222BE62
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp]
_0222BE62:
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _0222BEBC
	ldr r0, [sp]
	cmp r0, #0
	beq _0222BE96
	movs r0, #0
	ldrsh r1, [r5, r0]
	movs r3, #2
	strh r1, [r5, #2]
	ldrsh r0, [r5, r0]
	adds r0, r0, #1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	strh r0, [r5]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov43_0222BC78
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0222BE96:
	movs r0, #0
	ldrsh r1, [r5, r0]
	strh r1, [r5, #2]
	ldrsh r1, [r5, r0]
	subs r1, r1, #1
	strh r1, [r5]
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bge _0222BEAC
	adds r0, r0, #4
	strh r0, [r5]
_0222BEAC:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #1
	bl ov43_0222BC78
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0222BEBC:
	cmp r4, #1
	bne _0222BED8
	ldr r0, _0222BEE8 @ =0x000005E5
	bl FUN_0200604C
	movs r2, #4
	adds r0, r5, #0
	ldrsh r2, [r5, r2]
	adds r0, #8
	adds r1, r7, #0
	bl ov43_0222C844
	ldr r0, [sp, #8]
	strh r0, [r5, #6]
_0222BED8:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0222BEE0: .4byte 0x021D110C
_0222BEE4: .4byte 0x00000CF3
_0222BEE8: .4byte 0x000005E5
	thumb_func_end ov43_0222BD18

	thumb_func_start ov43_0222BEEC
ov43_0222BEEC: @ 0x0222BEEC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0222BF9C @ =0x0222EF60
	adds r7, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl FUN_0202529C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0222BF08
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222BF08:
	cmp r0, #8
	bhi _0222BF34
	movs r1, #1
	str r1, [r6]
	strh r0, [r5, #4]
	ldr r0, _0222BFA0 @ =0x000005E5
	bl FUN_0200604C
	movs r2, #4
	adds r0, r5, #0
	ldrsh r2, [r5, r2]
	adds r0, #8
	adds r1, r4, #0
	bl ov43_0222C844
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #5
	bl ov43_0222BC78
	pop {r3, r4, r5, r6, r7, pc}
_0222BF34:
	cmp r0, #9
	beq _0222BF4C
	cmp r0, #0xa
	bne _0222BF40
	movs r1, #1
	b _0222BF4C
_0222BF40:
	movs r1, #0
	ldrsh r1, [r5, r1]
	subs r0, #0xb
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
_0222BF4C:
	cmp r1, #0
	bne _0222BF54
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222BF54:
	movs r0, #1
	str r0, [r6]
	movs r0, #0
	ldrsh r2, [r5, r0]
	strh r2, [r5, #2]
	ldrsh r2, [r5, r0]
	adds r2, r2, r1
	strh r2, [r5]
	cmp r1, #0
	ldrsh r0, [r5, r0]
	blt _0222BF86
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	strh r0, [r5]
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #2
	bl ov43_0222BC78
	pop {r3, r4, r5, r6, r7, pc}
_0222BF86:
	cmp r0, #0
	bge _0222BF8E
	adds r0, r0, #4
	strh r0, [r5]
_0222BF8E:
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #1
	bl ov43_0222BC78
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222BF9C: .4byte 0x0222EF60
_0222BFA0: .4byte 0x000005E5
	thumb_func_end ov43_0222BEEC

	thumb_func_start ov43_0222BFA4
ov43_0222BFA4: @ 0x0222BFA4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	movs r3, #0
	str r3, [sp]
	add r3, sp, #0
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov43_0222BEEC
	ldr r1, [sp]
	cmp r1, #0
	beq _0222BFC6
	movs r1, #1
	add sp, #4
	str r1, [r4]
	pop {r3, r4, r5, r6, pc}
_0222BFC6:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov43_0222BD18
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov43_0222BFA4

	thumb_func_start ov43_0222BFD4
ov43_0222BFD4: @ 0x0222BFD4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, #0xb2
	ldrh r0, [r0]
	adds r4, r2, #0
	cmp r0, #2
	bne _0222BFE8
	movs r2, #2
	b _0222BFEA
_0222BFE8:
	movs r2, #1
_0222BFEA:
	movs r0, #4
	ldrsh r0, [r5, r0]
	str r0, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	movs r3, #0
	ldrsh r3, [r5, r3]
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov43_0222C378
	adds r5, #8
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0xa
	bl ov43_0222C844
	adds r0, r4, #0
	movs r1, #0
	bl ov43_0222AD20
	ldr r0, _0222C020 @ =0x000005E1
	bl FUN_0200604C
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0222C020: .4byte 0x000005E1
	thumb_func_end ov43_0222BFD4

	thumb_func_start ov43_0222C024
ov43_0222C024: @ 0x0222C024
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r0, #0xb0
	ldrsh r0, [r5, r0]
	str r1, [sp, #0xc]
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r0, #8
	blt _0222C0B4
	movs r2, #0
	ldr r0, [r4]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201F238
	movs r2, #0
	ldr r0, [r4]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201F238
	ldr r3, _0222C140 @ =0x0222F0FC
	add r2, sp, #0x10
	adds r7, r2, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	adds r0, r4, #0
	adds r0, #8
	adds r1, r7, #0
	bl FUN_02025C88
	adds r0, r5, #0
	adds r0, #0xb2
	ldrh r0, [r0]
	cmp r0, #2
	bne _0222C076
	movs r2, #2
	b _0222C078
_0222C076:
	movs r2, #1
_0222C078:
	movs r0, #0x38
	adds r1, r5, #0
	muls r0, r2, r0
	movs r2, #2
	adds r1, #8
	lsls r2, r2, #8
	adds r0, r1, r0
	adds r1, r4, #0
	adds r2, r4, r2
	bl ov43_0222C9A4
	movs r0, #4
	ldrsh r0, [r5, r0]
	movs r3, #0
	ldr r1, [sp, #0xc]
	str r0, [sp]
	str r3, [sp, #4]
	str r6, [sp, #8]
	ldrsh r3, [r5, r3]
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov43_0222C378
	adds r0, r4, #0
	movs r1, #1
	bl ov43_0222AD20
	add sp, #0x20
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222C0B4:
	lsls r1, r0, #8
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r6, r0, #3
	adds r0, r5, #0
	adds r0, #0xb2
	ldrh r0, [r0]
	cmp r0, #2
	bne _0222C0CA
	rsbs r6, r6, #0
_0222C0CA:
	ldr r0, [r4]
	movs r1, #2
	movs r2, #0
	adds r3, r6, #0
	bl FUN_0201F238
	ldr r0, [r4]
	movs r1, #3
	movs r2, #0
	adds r3, r6, #0
	bl FUN_0201F238
	ldr r3, _0222C140 @ =0x0222F0FC
	add r2, sp, #0x10
	adds r7, r2, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r1, [sp, #0x10]
	lsls r0, r6, #0xc
	adds r0, r1, r0
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r0, #8
	adds r1, r7, #0
	bl FUN_02025C88
	movs r0, #0xb0
	ldrsh r3, [r5, r0]
	movs r0, #0x1f
	lsrs r2, r3, #0x1f
	lsls r1, r3, #0x1f
	subs r1, r1, r2
	rors r1, r0
	adds r0, r2, r1
	beq _0222C130
	adds r2, r3, r2
	asrs r0, r2, #1
	lsls r1, r0, #2
	ldr r0, _0222C144 @ =0x0222F0EC
	ldr r6, [r0, r1]
	cmp r6, #0
	beq _0222C130
	movs r2, #0
	movs r3, #2
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	adds r0, r5, #0
	adds r1, r4, #0
	blx r6
_0222C130:
	movs r0, #0xb0
	ldrsh r0, [r5, r0]
	adds r5, #0xb0
	adds r0, r0, #1
	strh r0, [r5]
	movs r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222C140: .4byte 0x0222F0FC
_0222C144: .4byte 0x0222F0EC
	thumb_func_end ov43_0222C024

	thumb_func_start ov43_0222C148
ov43_0222C148: @ 0x0222C148
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5, #4]
	adds r4, r2, #0
	str r3, [sp, #0x18]
	bl FUN_0202C6F4
	str r0, [sp, #0x1c]
	adds r0, r6, #0
	bl ov43_0222C620
	str r0, [sp, #0x20]
	adds r7, r5, #0
	ldr r1, [sp, #0x20]
	adds r7, #0x18
	ldrb r1, [r7, r1]
	ldr r0, [sp, #0x1c]
	movs r2, #8
	bl FUN_0202C090
	str r0, [sp, #0x24]
	add r0, sp, #0x28
	movs r1, #0
	movs r2, #0x18
	blx FUN_020D4994
	ldr r1, _0222C220 @ =0x0222ED9C
	add r0, sp, #0x28
	ldrh r2, [r1, #4]
	strh r2, [r0]
	ldrh r2, [r1, #6]
	strh r2, [r0, #2]
	ldrh r2, [r1, #8]
	strh r2, [r0, #4]
	ldrh r2, [r1, #0xa]
	strh r2, [r0, #6]
	ldrh r2, [r1, #0xc]
	ldrh r1, [r1, #0xe]
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	ldr r0, [sp, #0x24]
	cmp r0, #2
	bne _0222C1AC
	adds r0, r6, #0
	adds r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #0x34]
	b _0222C1B4
_0222C1AC:
	adds r0, r6, #0
	adds r0, #0xe4
	ldr r0, [r0]
	str r0, [sp, #0x34]
_0222C1B4:
	ldr r0, [r4]
	movs r1, #4
	str r0, [sp, #0x38]
	add r0, sp, #0x28
	strb r1, [r0, #0x14]
	movs r0, #5
	str r0, [sp]
	movs r0, #0x11
	str r0, [sp, #4]
	movs r1, #0
	ldr r0, _0222C224 @ =ov43_0222C630
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r0, #1
	str r0, [sp, #0x14]
	ldr r2, [r5]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #0x18
	add r1, sp, #0x28
	lsrs r2, r2, #0x18
	movs r3, #0xd
	bl FUN_02018648
	adds r1, r6, #0
	adds r1, #0xec
	str r0, [r1]
	ldr r2, [sp, #0x20]
	ldr r1, [r5, #4]
	ldrb r2, [r7, r2]
	ldr r3, [sp, #0x18]
	adds r0, r4, #0
	bl ov43_0222AB20
	ldr r3, [sp, #0x18]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0xc
	bl ov43_0222C550
	adds r0, r4, #0
	movs r1, #0
	bl ov43_0222AD00
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0
	movs r3, #0x3d
	bl FUN_0200B484
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222C220: .4byte 0x0222ED9C
_0222C224: .4byte ov43_0222C630
	thumb_func_end ov43_0222C148

	thumb_func_start ov43_0222C228
ov43_0222C228: @ 0x0222C228
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	bl ov43_0222C5D8
	cmp r0, #0
	bne _0222C23C
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_0222C23C:
	adds r0, r5, #0
	adds r0, #0xec
	ldr r0, [r0]
	bl FUN_020186A4
	adds r4, r0, #0
	cmp r4, #3
	beq _0222C25E
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _0222C25E
	adds r0, r0, #1
	cmp r4, r0
	bne _0222C268
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_0222C25E:
	adds r0, r6, #0
	movs r1, #1
	bl ov43_0222AD00
	movs r4, #2
_0222C268:
	adds r0, r5, #0
	bl ov43_0222C600
	adds r0, r5, #0
	adds r0, #0xec
	ldr r0, [r0]
	bl FUN_02018674
	str r0, [r7]
	adds r0, r5, #0
	adds r0, #0xec
	ldr r0, [r0]
	bl FUN_02018680
	cmp r4, #2
	bne _0222C2A0
	adds r0, r6, #0
	movs r1, #1
	bl ov43_0222AD00
	movs r2, #4
	adds r0, r5, #0
	ldrsh r2, [r5, r2]
	adds r0, #8
	adds r1, r6, #0
	movs r3, #0
	bl ov43_0222C890
_0222C2A0:
	movs r0, #0
	movs r1, #0x3d
	movs r2, #1
	bl FUN_0200B4F0
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222C228

	thumb_func_start ov43_0222C2B0
ov43_0222C2B0: @ 0x0222C2B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r1, #0
	str r0, [sp]
	ldr r0, [r5, #4]
	adds r4, r2, #0
	str r3, [sp, #4]
	bl FUN_0202C6F4
	str r0, [sp, #0x1c]
	ldr r0, [sp]
	bl ov43_0222C620
	adds r6, r5, #0
	adds r7, r0, #0
	adds r6, #0x18
	ldrb r1, [r6, r7]
	ldr r0, [sp, #0x1c]
	bl FUN_0202C23C
	blx FUN_020A0264
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	movs r2, #0
	eors r0, r2
	ldr r2, [sp, #0x14]
	movs r1, #0
	eors r1, r2
	orrs r0, r1
	beq _0222C2F6
	movs r0, #0x3c
	str r0, [sp, #8]
	b _0222C2FA
_0222C2F6:
	movs r0, #0x42
	str r0, [sp, #8]
_0222C2FA:
	ldr r0, _0222C328 @ =0x000005DD
	bl FUN_0200604C
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	adds r0, r4, #0
	bl ov43_0222AAA4
	ldrb r2, [r6, r7]
	ldr r1, [r5, #4]
	ldr r3, [sp, #4]
	adds r0, r4, #0
	bl ov43_0222AB20
	ldr r0, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r1, r4, #0
	bl ov43_0222C550
	movs r0, #1
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222C328: .4byte 0x000005DD
	thumb_func_end ov43_0222C2B0

	thumb_func_start ov43_0222C32C
ov43_0222C32C: @ 0x0222C32C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl ov43_0222C620
	adds r2, r0, #0
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	ldr r1, [r5, #4]
	adds r0, r4, #0
	adds r3, r6, #0
	bl ov43_0222AB20
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x39
	adds r3, r6, #0
	bl ov43_0222C550
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222C32C

	thumb_func_start ov43_0222C358
ov43_0222C358: @ 0x0222C358
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	bl ov43_0222C5D8
	cmp r0, #0
	bne _0222C36A
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222C36A:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl ov43_0222ADB8
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222C358

	thumb_func_start ov43_0222C378
ov43_0222C378: @ 0x0222C378
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	ldr r1, [sp, #0x34]
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r1, #0
	bne _0222C398
	ldr r1, [sp, #0x30]
	strh r7, [r5]
	strh r1, [r5, #4]
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov43_0222C3E8
_0222C398:
	ldr r1, [sp, #0x34]
	adds r4, r5, #0
	movs r0, #0x38
	muls r0, r1, r0
	movs r2, #2
	lsls r2, r2, #8
	adds r4, #8
	str r0, [sp, #0x14]
	adds r0, r4, r0
	adds r1, r6, #0
	adds r2, r6, r2
	bl ov43_0222C7F8
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r6, r0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	adds r5, #0xb4
	adds r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	str r7, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	ldr r3, [r5]
	adds r0, r4, r0
	adds r2, r6, #0
	bl ov43_0222C918
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x30]
	adds r0, r4, r0
	adds r1, r6, #0
	bl ov43_0222C844
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222C378

	thumb_func_start ov43_0222C3E8
ov43_0222C3E8: @ 0x0222C3E8
	push {r4, r5, lr}
	sub sp, #0x1c
	movs r0, #0x83
	adds r5, r1, #0
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r2, #0
	movs r2, #0x10
	adds r1, r0, #0
	str r2, [sp]
	movs r3, #4
	str r3, [sp, #4]
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrh r3, [r0]
	lsls r3, r3, #0x15
	lsrs r3, r3, #0x18
	str r3, [sp, #0x14]
	ldrh r0, [r0, #2]
	adds r3, r1, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl FUN_0201C4EC
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #4
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	lsls r2, r4, #2
	str r1, [sp, #8]
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	movs r1, #8
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	adds r2, #0x10
	lsls r2, r2, #0x18
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #0
	lsrs r2, r2, #0x18
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	adds r3, r1, #0
	bl FUN_0201C4EC
	ldr r0, [r5]
	movs r1, #0
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov43_0222C3E8

	thumb_func_start ov43_0222C46C
ov43_0222C46C: @ 0x0222C46C
	push {r3, r4, lr}
	sub sp, #0x1c
	movs r0, #0x83
	adds r4, r1, #0
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #4
	str r1, [sp]
	lsls r2, r3, #2
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	adds r2, #0x10
	str r1, [sp, #8]
	lsls r1, r2, #0x18
	lsrs r2, r1, #0x18
	str r2, [sp, #0xc]
	movs r1, #8
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #0
	adds r3, r1, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl FUN_0201C4EC
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end ov43_0222C46C

	thumb_func_start ov43_0222C4B8
ov43_0222C4B8: @ 0x0222C4B8
	push {r4, r5, lr}
	sub sp, #0x1c
	movs r0, #0x83
	adds r5, r1, #0
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r2, #0
	movs r2, #0x10
	adds r1, r0, #0
	str r2, [sp]
	movs r3, #4
	str r3, [sp, #4]
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrh r3, [r0]
	lsls r3, r3, #0x15
	lsrs r3, r3, #0x18
	str r3, [sp, #0x14]
	ldrh r0, [r0, #2]
	adds r3, r1, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl FUN_0201C4EC
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #4
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	lsls r2, r4, #2
	str r1, [sp, #8]
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	movs r1, #8
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	adds r2, #0x10
	lsls r2, r2, #0x18
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #0
	lsrs r2, r2, #0x18
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	adds r3, r1, #0
	bl FUN_0201C4EC
	ldr r0, [r5]
	movs r1, #0
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov43_0222C4B8

	thumb_func_start ov43_0222C53C
ov43_0222C53C: @ 0x0222C53C
	movs r3, #3
	strb r3, [r1, #8]
	adds r1, r0, #0
	adds r1, #0xb2
	strh r2, [r1]
	movs r1, #0
	adds r0, #0xb0
	strh r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov43_0222C53C

	thumb_func_start ov43_0222C550
ov43_0222C550: @ 0x0222C550
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r3, #0
	adds r0, #0xc8
	movs r1, #0xf
	adds r7, r2, #0
	bl FUN_0201D978
	movs r0, #0x80
	adds r1, r6, #0
	bl FUN_02026354
	adds r6, r0, #0
	ldr r0, [r4, #0x54]
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_0200BB6C
	adds r1, r5, #0
	adds r1, #0xd8
	ldr r0, [r4, #0x50]
	ldr r1, [r1]
	adds r2, r6, #0
	bl FUN_0200CBBC
	movs r0, #1
	bl FUN_02002B8C
	movs r3, #0
	adds r0, r5, #0
	adds r2, r5, #0
	str r3, [sp]
	adds r0, #0xe0
	ldr r0, [r0]
	adds r2, #0xd8
	str r0, [sp, #4]
	ldr r0, _0222C5D4 @ =0x00010200
	movs r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r2]
	adds r0, #0xc8
	bl FUN_020200FC
	adds r1, r5, #0
	adds r1, #0xdc
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xc8
	movs r1, #1
	movs r2, #0x46
	movs r3, #0xc
	bl FUN_0200E998
	adds r5, #0xc8
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222C5D4: .4byte 0x00010200
	thumb_func_end ov43_0222C550

	thumb_func_start ov43_0222C5D8
ov43_0222C5D8: @ 0x0222C5D8
	push {r4, lr}
	adds r0, #0xdc
	ldr r0, [r0]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0222C5FC
	movs r0, #0
	bl FUN_02002B8C
	bl FUN_02002C04
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
_0222C5FC:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov43_0222C5D8

	thumb_func_start ov43_0222C600
ov43_0222C600: @ 0x0222C600
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xc8
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r4, #0
	adds r0, #0xc8
	bl FUN_0201D8E4
	adds r4, #0xb8
	adds r0, r4, #0
	bl FUN_0201D5C8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov43_0222C600

	thumb_func_start ov43_0222C620
ov43_0222C620: @ 0x0222C620
	movs r1, #0
	ldrsh r1, [r0, r1]
	lsls r2, r1, #3
	movs r1, #4
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	bx lr
	.align 2, 0
	thumb_func_end ov43_0222C620

	thumb_func_start ov43_0222C630
ov43_0222C630: @ 0x0222C630
	push {r3, lr}
	cmp r3, #1
	bne _0222C63E
	ldr r0, _0222C658 @ =0x000005DC
	bl FUN_0200604C
	pop {r3, pc}
_0222C63E:
	cmp r3, #2
	bne _0222C64A
	ldr r0, _0222C658 @ =0x000005DC
	bl FUN_0200604C
	pop {r3, pc}
_0222C64A:
	cmp r3, #3
	bne _0222C654
	ldr r0, _0222C658 @ =0x000005DC
	bl FUN_0200604C
_0222C654:
	pop {r3, pc}
	nop
_0222C658: .4byte 0x000005DC
	thumb_func_end ov43_0222C630

	thumb_func_start ov43_0222C65C
ov43_0222C65C: @ 0x0222C65C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, #0xf8
	adds r4, r1, #0
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xff
	bl ov43_0222AD74
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	movs r1, #4
	bl FUN_020248F0
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0xfc
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #4
	ldrsh r1, [r5, r0]
	movs r0, #0xa
	adds r5, #0xf8
	adds r3, r1, #0
	muls r3, r0, r3
	ldr r0, _0222C700 @ =0x0222EFA0
	ldrsh r0, [r0, r3]
	lsls r2, r0, #3
	ldr r0, _0222C704 @ =0x0222EFA2
	str r2, [sp]
	ldrsh r0, [r0, r3]
	lsls r1, r0, #3
	adds r1, #0xfc
	lsls r0, r2, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	lsls r0, r1, #0xc
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, sp, #0
	bl FUN_020247D4
	ldr r1, _0222C708 @ =0x0400004A
	ldr r0, _0222C70C @ =0xFFFFC0FF
	ldrh r2, [r1]
	ands r2, r0
	movs r0, #7
	lsls r0, r0, #8
	orrs r2, r0
	strh r2, [r1]
	ldrh r3, [r1]
	movs r2, #0x3f
	subs r0, #0xd8
	bics r3, r2
	movs r2, #0x1f
	orrs r3, r2
	movs r2, #0x20
	orrs r3, r2
	strh r3, [r1]
	lsls r4, r2, #0x15
	ldr r3, [r4]
	ldr r1, _0222C710 @ =0xFFFF1FFF
	ands r3, r1
	lsls r1, r2, #0xa
	orrs r1, r3
	str r1, [r4]
	bl FUN_0200604C
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0222C700: .4byte 0x0222EFA0
_0222C704: .4byte 0x0222EFA2
_0222C708: .4byte 0x0400004A
_0222C70C: .4byte 0xFFFFC0FF
_0222C710: .4byte 0xFFFF1FFF
	thumb_func_end ov43_0222C65C

	thumb_func_start ov43_0222C714
ov43_0222C714: @ 0x0222C714
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xf8
	ldr r0, [r0]
	bl FUN_02024B68
	cmp r0, #0
	bne _0222C728
	movs r0, #1
	pop {r4, pc}
_0222C728:
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r0, [r0]
	bl FUN_020249F8
	adds r1, r4, #0
	adds r1, #0xfc
	ldr r1, [r1]
	subs r1, r0, r1
	cmp r1, #2
	blo _0222C748
	adds r4, #0xfc
	str r0, [r4]
	ldr r0, _0222C74C @ =0x00000628
	bl FUN_0200604C
_0222C748:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0222C74C: .4byte 0x00000628
	thumb_func_end ov43_0222C714

	thumb_func_start ov43_0222C750
ov43_0222C750: @ 0x0222C750
	push {r3, r4, r5, lr}
	movs r2, #1
	lsls r2, r2, #0x1a
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r2]
	ldr r0, _0222C784 @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	adds r5, #0xf8
	ldr r0, [r5]
	movs r1, #0
	bl FUN_0202484C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xff
	bl ov43_0222AD74
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222C784: .4byte 0xFFFF1FFF
	thumb_func_end ov43_0222C750

	thumb_func_start ov43_0222C788
ov43_0222C788: @ 0x0222C788
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r2, #0
	adds r5, r0, #0
	ldrh r0, [r4]
	adds r6, r1, #0
	adds r7, r3, #0
	strh r0, [r5]
	ldrh r0, [r4, #2]
	strh r0, [r5, #2]
	ldrh r0, [r4, #4]
	strh r0, [r5, #4]
	adds r0, r5, #0
	adds r0, #8
	bl FUN_0201D3C4
	movs r0, #2
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0222C7B2
	rsbs r1, r1, #0
_0222C7B2:
	movs r0, #0
	ldrsh r3, [r4, r0]
	cmp r3, #0
	bge _0222C7BC
	rsbs r3, r3, #0
_0222C7BC:
	adds r0, r1, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	movs r0, #0x11
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	adds r3, r3, #4
	str r0, [sp, #0x10]
	adds r5, #8
	lsls r3, r3, #0x18
	ldr r0, [r6]
	adds r1, r5, #0
	movs r2, #3
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222C788

	thumb_func_start ov43_0222C7EC
ov43_0222C7EC: @ 0x0222C7EC
	ldr r3, _0222C7F4 @ =FUN_0201D520
	adds r0, #8
	bx r3
	nop
_0222C7F4: .4byte FUN_0201D520
	thumb_func_end ov43_0222C7EC

	thumb_func_start ov43_0222C7F8
ov43_0222C7F8: @ 0x0222C7F8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	movs r1, #2
	ldrsh r5, [r0, r1]
	cmp r5, #0
	bge _0222C808
	rsbs r5, r5, #0
_0222C808:
	movs r1, #0
	ldrsh r3, [r0, r1]
	cmp r3, #0
	bge _0222C812
	rsbs r3, r3, #0
_0222C812:
	lsls r0, r5, #0x18
	ldr r2, [r2, #8]
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldrh r0, [r2]
	lsls r3, r3, #0x18
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	adds r2, #0xc
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4]
	bl FUN_0201C4C4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov43_0222C7F8

	thumb_func_start ov43_0222C844
ov43_0222C844: @ 0x0222C844
	push {r4, lr}
	adds r4, r1, #0
	cmp r2, #0xa
	bne _0222C858
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xff
	bl ov43_0222AD74
	pop {r4, pc}
_0222C858:
	ldr r1, _0222C88C @ =0x0222EFA0
	movs r0, #0xa
	adds r3, r2, #0
	muls r3, r0, r3
	adds r2, r1, r3
	ldrsh r1, [r1, r3]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r0, #0x7f
	lsls r0, r0, #2
	adds r1, r1, #7
	adds r2, r2, #2
	lsls r1, r1, #0x13
	lsls r2, r2, #0x13
	ldr r0, [r4, r0]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xff
	bl ov43_0222AD74
	pop {r4, pc}
	nop
_0222C88C: .4byte 0x0222EFA0
	thumb_func_end ov43_0222C844

	thumb_func_start ov43_0222C890
ov43_0222C890: @ 0x0222C890
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r5, _0222C914 @ =0x0222EFA0
	adds r7, r0, #0
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	movs r4, #0
_0222C8A0:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _0222C8B0
	ldr r0, [sp, #0x10]
	cmp r0, r4
	bne _0222C8B0
	ldrb r0, [r5, #8]
	b _0222C8B2
_0222C8B0:
	ldrb r0, [r5, #7]
_0222C8B2:
	movs r1, #2
	ldrsh r3, [r7, r1]
	cmp r3, #0
	bge _0222C8BC
	rsbs r3, r3, #0
_0222C8BC:
	movs r1, #0
	ldrsh r2, [r7, r1]
	cmp r2, #0
	bge _0222C8C6
	rsbs r2, r2, #0
_0222C8C6:
	ldrb r1, [r5, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r1, [sp]
	ldrb r1, [r5, #5]
	movs r6, #0
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldrsh r6, [r5, r6]
	ldr r0, [sp, #0xc]
	ldrb r1, [r5, #6]
	adds r2, r6, r2
	movs r6, #2
	ldrsh r6, [r5, r6]
	lsls r2, r2, #0x18
	ldr r0, [r0]
	adds r3, r6, r3
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201CA4C
	adds r4, r4, #1
	adds r5, #0xa
	cmp r4, #9
	blt _0222C8A0
	ldr r0, [sp, #0xc]
	movs r1, #2
	ldr r0, [r0]
	bl FUN_0201EFBC
	ldr r0, [sp, #0xc]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_0201EFBC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C914: .4byte 0x0222EFA0
	thumb_func_end ov43_0222C890

	thumb_func_start ov43_0222C918
ov43_0222C918: @ 0x0222C918
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	ldr r0, [sp, #0x30]
	adds r7, r2, #0
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	str r3, [sp, #0x10]
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0x3c]
	ldr r0, [r1, #4]
	bl FUN_0202C6F4
	str r0, [sp, #0x14]
	adds r0, r6, #0
	adds r0, #8
	movs r1, #0
	bl FUN_0201D978
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov43_0222CA30
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x34]
	lsls r0, r0, #3
	str r0, [sp, #0x18]
	movs r4, #0
	adds r5, r1, r0
_0222C954:
	ldr r0, [sp, #0x34]
	ldr r1, [r0]
	ldr r0, [sp, #0x18]
	adds r0, r0, r4
	cmp r1, r0
	bls _0222C97C
	ldr r0, [sp, #0x14]
	str r4, [sp]
	str r0, [sp, #4]
	ldrb r0, [r5, #8]
	ldr r1, [sp, #0x10]
	ldr r3, [sp, #0x30]
	str r0, [sp, #8]
	ldr r0, [sp, #0x3c]
	adds r2, r7, #0
	str r0, [sp, #0xc]
	adds r0, r6, #0
	bl ov43_0222CA50
	b _0222C988
_0222C97C:
	ldr r2, [sp, #0x30]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r3, r4, #0
	bl ov43_0222CB34
_0222C988:
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #8
	blt _0222C954
	ldr r0, [r7]
	movs r1, #2
	bl FUN_0201EFBC
	adds r6, #8
	adds r0, r6, #0
	bl FUN_0201D5C8
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222C918

	thumb_func_start ov43_0222C9A4
ov43_0222C9A4: @ 0x0222C9A4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov43_0222CA30
	adds r0, r5, #0
	adds r0, #8
	bl FUN_0201D8E4
	movs r0, #2
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bge _0222C9C2
	rsbs r1, r1, #0
_0222C9C2:
	movs r0, #0
	ldrsh r3, [r5, r0]
	cmp r3, #0
	bge _0222C9CC
	rsbs r3, r3, #0
_0222C9CC:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldrb r0, [r5, #4]
	lsls r3, r3, #0x18
	movs r2, #0
	str r0, [sp, #4]
	ldrb r0, [r5, #5]
	movs r1, #2
	lsrs r3, r3, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4]
	bl FUN_0201C8C4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201EFBC
	movs r0, #2
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bge _0222C9FC
	rsbs r1, r1, #0
_0222C9FC:
	movs r0, #0
	ldrsh r3, [r5, r0]
	cmp r3, #0
	bge _0222CA06
	rsbs r3, r3, #0
_0222CA06:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldrb r0, [r5, #4]
	lsls r3, r3, #0x18
	movs r2, #0
	str r0, [sp, #4]
	ldrb r0, [r5, #5]
	movs r1, #3
	lsrs r3, r3, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4]
	bl FUN_0201C8C4
	ldr r0, [r4]
	movs r1, #3
	bl FUN_0201EFBC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222C9A4

	thumb_func_start ov43_0222CA30
ov43_0222CA30: @ 0x0222CA30
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r5, r0, #0
	adds r6, r4, #0
_0222CA38:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	beq _0222CA44
	bl FUN_0222740C
	str r6, [r5, #0x18]
_0222CA44:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blt _0222CA38
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov43_0222CA30

	thumb_func_start ov43_0222CA50
ov43_0222CA50: @ 0x0222CA50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	ldr r0, [sp, #0x48]
	adds r6, r2, #0
	str r0, [sp, #0x18]
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x18]
	movs r2, #7
	str r3, [sp, #0x14]
	ldr r4, [sp, #0x40]
	bl FUN_0202C090
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x18]
	movs r2, #8
	bl FUN_0202C090
	adds r7, r0, #0
	cmp r7, #2
	bne _0222CA8C
	ldr r2, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r4, #0
	bl ov43_0222CB34
	b _0222CAD0
_0222CA8C:
	movs r0, #0xa
	adds r6, r4, #0
	muls r6, r0, r6
	ldr r2, _0222CB28 @ =0x0222EFA0
	movs r1, #0
	ldrsh r1, [r5, r1]
	ldrsh r2, [r2, r6]
	adds r0, #0xfc
	adds r1, r1, r2
	lsls r2, r1, #3
	adds r2, #8
	add r1, sp, #0x20
	strh r2, [r1]
	movs r2, #2
	ldrsh r3, [r5, r2]
	ldr r2, _0222CB2C @ =0x0222EFA2
	ldrsh r2, [r2, r6]
	adds r2, r3, r2
	lsls r2, r2, #3
	adds r0, r2, r0
	strh r0, [r1, #2]
	movs r0, #8
	strh r0, [r1, #4]
	movs r0, #1
	strh r0, [r1, #6]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x4c]
	add r1, sp, #0x20
	bl FUN_022272BC
	lsls r1, r4, #2
	adds r1, r5, r1
	str r0, [r1, #0x18]
_0222CAD0:
	ldr r1, [sp, #0x4c]
	movs r0, #0x80
	bl FUN_02026354
	adds r6, r0, #0
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x18]
	bl FUN_0202C254
	adds r1, r0, #0
	adds r0, r6, #0
	bl FUN_020269A0
	adds r3, r4, #0
	movs r0, #0xa
	muls r3, r0, r3
	ldr r0, _0222CB2C @ =0x0222EFA2
	ldr r4, _0222CB28 @ =0x0222EFA0
	ldrsh r0, [r0, r3]
	ldrsh r3, [r4, r3]
	lsls r1, r7, #2
	lsls r0, r0, #3
	subs r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222CB30 @ =0x0222ED94
	adds r5, #8
	ldr r0, [r0, r1]
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r2, r6, #0
	lsls r3, r3, #3
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222CB28: .4byte 0x0222EFA0
_0222CB2C: .4byte 0x0222EFA2
_0222CB30: .4byte 0x0222ED94
	thumb_func_end ov43_0222CA50

	thumb_func_start ov43_0222CB34
ov43_0222CB34: @ 0x0222CB34
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	adds r4, r1, #0
	adds r1, r3, #0
	movs r3, #2
	ldrsh r5, [r0, r3]
	cmp r5, #0
	bge _0222CB46
	rsbs r5, r5, #0
_0222CB46:
	movs r3, #0
	ldrsh r6, [r0, r3]
	cmp r6, #0
	bge _0222CB50
	rsbs r6, r6, #0
_0222CB50:
	ldr r0, [r2, #0xc]
	adds r3, r1, #0
	movs r1, #3
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0xa
	str r1, [sp, #0xc]
	muls r3, r2, r3
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	ldr r2, _0222CBA4 @ =0x0222EFA0
	ldrsh r2, [r2, r3]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	adds r2, r2, r6
	ldr r6, _0222CBA8 @ =0x0222EFA2
	ldrh r0, [r0, #2]
	ldrsh r3, [r6, r3]
	lsls r2, r2, #0x18
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	adds r3, r3, r5
	str r0, [sp, #0x18]
	lsls r3, r3, #0x18
	ldr r0, [r4]
	movs r1, #2
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201C4EC
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222CBA4: .4byte 0x0222EFA0
_0222CBA8: .4byte 0x0222EFA2
	thumb_func_end ov43_0222CB34

	thumb_func_start ov43_0222CBAC
ov43_0222CBAC: @ 0x0222CBAC
	push {r3, lr}
	bl ov43_0222CD3C
	pop {r3, pc}
	thumb_func_end ov43_0222CBAC

	thumb_func_start ov43_0222CBB4
ov43_0222CBB4: @ 0x0222CBB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r2, #0
	adds r7, r1, #0
	ldrb r1, [r5, #8]
	adds r4, r0, #0
	ldr r6, [sp, #0x30]
	cmp r1, #6
	bls _0222CBC8
	b _0222CD26
_0222CBC8:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0222CBD4: @ jump table
	.2byte _0222CBE2 - _0222CBD4 - 2 @ case 0
	.2byte _0222CC2A - _0222CBD4 - 2 @ case 1
	.2byte _0222CC64 - _0222CBD4 - 2 @ case 2
	.2byte _0222CC92 - _0222CBD4 - 2 @ case 3
	.2byte _0222CCAC - _0222CBD4 - 2 @ case 4
	.2byte _0222CCCE - _0222CBD4 - 2 @ case 5
	.2byte _0222CD12 - _0222CBD4 - 2 @ case 6
_0222CBE2:
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov43_0222CD44
	str r0, [r4, #4]
	movs r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r5, #4]
	bl FUN_02028EA8
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xc
	add r2, sp, #8
	bl FUN_02085400
	str r0, [r4, #8]
	adds r0, r7, #0
	bl ov43_0222A1DC
	ldr r0, _0222CD2C @ =0x02102610
	ldr r1, [r4, #4]
	adds r2, r6, #0
	bl FUN_0200724C
	str r0, [r4]
	movs r0, #1
	strb r0, [r5, #8]
	b _0222CD26
_0222CC2A:
	ldr r0, [r4]
	bl FUN_020072A8
	cmp r0, #0
	beq _0222CD26
	ldr r0, [r4]
	bl FUN_02007278
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0222CC54
	ldr r0, _0222CD30 @ =0x02102620
	ldr r1, [r4, #8]
	adds r2, r6, #0
	bl FUN_0200724C
	str r0, [r4]
	movs r0, #2
	strb r0, [r5, #8]
	b _0222CD26
_0222CC54:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov43_0222A318
	movs r0, #3
	strb r0, [r5, #8]
	b _0222CD26
_0222CC64:
	ldr r0, [r4]
	bl FUN_020072A8
	cmp r0, #0
	beq _0222CD26
	ldr r0, [r4]
	bl FUN_02007278
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r1, [r1, #0x18]
	ldr r2, [r2, #0x1c]
	adds r0, r5, #0
	bl ov43_0222A338
	adds r0, r5, #0
	movs r1, #0
	movs r2, #7
	bl ov43_0222A318
	movs r0, #3
	strb r0, [r5, #8]
	b _0222CD26
_0222CC92:
	ldr r0, [r4, #4]
	bl FUN_0208311C
	ldr r0, [r4, #8]
	bl FUN_02085438
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov43_0222A154
	add sp, #0x18
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222CCAC:
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov43_0222CD44
	str r0, [r4, #4]
	adds r0, r7, #0
	bl ov43_0222A1DC
	ldr r0, _0222CD2C @ =0x02102610
	ldr r1, [r4, #4]
	adds r2, r6, #0
	bl FUN_0200724C
	str r0, [r4]
	movs r0, #5
	strb r0, [r5, #8]
	b _0222CD26
_0222CCCE:
	ldr r0, [r4]
	bl FUN_020072A8
	cmp r0, #0
	beq _0222CD26
	ldr r0, [r4]
	bl FUN_02007278
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0222CD02
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0xc
	bl ov43_0222A318
	ldr r1, [r4, #4]
	adds r0, r5, #0
	ldr r1, [r1, #0x18]
	movs r2, #0
	bl ov43_0222A338
	movs r0, #6
	strb r0, [r5, #8]
	b _0222CD26
_0222CD02:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0xd
	bl ov43_0222A318
	movs r0, #6
	strb r0, [r5, #8]
	b _0222CD26
_0222CD12:
	ldr r0, [r4, #4]
	bl FUN_0208311C
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov43_0222A154
	add sp, #0x18
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222CD26:
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222CD2C: .4byte 0x02102610
_0222CD30: .4byte 0x02102620
	thumb_func_end ov43_0222CBB4

	thumb_func_start ov43_0222CD34
ov43_0222CD34: @ 0x0222CD34
	ldr r3, _0222CD38 @ =ov43_0222CD40
	bx r3
	.align 2, 0
_0222CD38: .4byte ov43_0222CD40
	thumb_func_end ov43_0222CD34

	thumb_func_start ov43_0222CD3C
ov43_0222CD3C: @ 0x0222CD3C
	bx lr
	.align 2, 0
	thumb_func_end ov43_0222CD3C

	thumb_func_start ov43_0222CD40
ov43_0222CD40: @ 0x0222CD40
	bx lr
	.align 2, 0
	thumb_func_end ov43_0222CD40

	thumb_func_start ov43_0222CD44
ov43_0222CD44: @ 0x0222CD44
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	ldr r0, [r5, #4]
	adds r4, r2, #0
	bl FUN_02028EA8
	str r0, [sp]
	movs r2, #0
	movs r1, #7
	str r2, [sp, #4]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_020830D8
	adds r4, r0, #0
	ldr r0, [r5, #0x64]
	cmp r0, #1
	bne _0222CD88
	ldr r0, [r5, #0x60]
	ldrh r0, [r0]
	bl FUN_02020B78
	cmp r0, #0
	ldr r0, [r4, #0x18]
	bne _0222CD80
	ldr r1, [r5, #0x60]
	bl FUN_020269A0
	b _0222CD84
_0222CD80:
	bl FUN_020263AC
_0222CD84:
	movs r0, #0
	str r0, [r5, #0x64]
_0222CD88:
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov43_0222CD44

	thumb_func_start ov43_0222CD90
ov43_0222CD90: @ 0x0222CD90
	push {r3, lr}
	bl ov43_0222CE48
	pop {r3, pc}
	thumb_func_end ov43_0222CD90

	thumb_func_start ov43_0222CD98
ov43_0222CD98: @ 0x0222CD98
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldrb r3, [r4, #8]
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r3, #0
	beq _0222CDB0
	cmp r3, #1
	beq _0222CDBA
	cmp r3, #2
	beq _0222CDDC
	b _0222CE04
_0222CDB0:
	bl ov43_0222D028
	movs r0, #1
	strb r0, [r4, #8]
	b _0222CE04
_0222CDBA:
	bl ov43_0222CE14
	cmp r0, #0
	beq _0222CE04
	ldr r0, _0222CE08 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl ov43_0222D0F8
	movs r0, #4
	str r0, [r5, #0x38]
	movs r0, #2
	strb r0, [r4, #8]
	b _0222CE04
_0222CDDC:
	ldr r1, [r5, #0x38]
	subs r1, r1, #1
	str r1, [r5, #0x38]
	cmp r1, #0
	bgt _0222CE04
	adds r1, r6, #0
	movs r2, #0
	bl ov43_0222D0F8
	adds r0, r4, #0
	movs r1, #0
	movs r2, #2
	bl ov43_0222A318
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov43_0222D090
	movs r0, #1
	pop {r4, r5, r6, pc}
_0222CE04:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222CE08: .4byte 0x000005DD
	thumb_func_end ov43_0222CD98

	thumb_func_start ov43_0222CE0C
ov43_0222CE0C: @ 0x0222CE0C
	ldr r3, _0222CE10 @ =ov43_0222D008
	bx r3
	.align 2, 0
_0222CE10: .4byte ov43_0222D008
	thumb_func_end ov43_0222CE0C

	thumb_func_start ov43_0222CE14
ov43_0222CE14: @ 0x0222CE14
	push {r4, lr}
	ldr r0, _0222CE40 @ =0x0222ED7A
	adds r4, r1, #0
	bl FUN_0202529C
	cmp r0, #0
	bne _0222CE28
	movs r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222CE28:
	adds r0, r4, #0
	bl ov43_0222A320
	ldr r0, _0222CE44 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _0222CE3C
	movs r0, #1
	pop {r4, pc}
_0222CE3C:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0222CE40: .4byte 0x0222ED7A
_0222CE44: .4byte 0x021D110C
	thumb_func_end ov43_0222CE14

	thumb_func_start ov43_0222CE48
ov43_0222CE48: @ 0x0222CE48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	str r1, [sp, #0x14]
	adds r4, r2, #0
	adds r7, r3, #0
	bl FUN_0201D3C4
	movs r1, #0xb
	str r1, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r4]
	adds r1, r5, #0
	movs r2, #3
	movs r3, #4
	bl FUN_0201D40C
	adds r0, r5, #0
	adds r0, #0x10
	bl FUN_0201D3C4
	movs r0, #6
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0xc1
	str r0, [sp, #0x10]
	adds r1, r5, #0
	ldr r0, [r4]
	adds r1, #0x10
	movs r2, #3
	movs r3, #9
	bl FUN_0201D40C
	adds r0, r5, #0
	adds r0, #0x20
	bl FUN_0201D3C4
	movs r3, #0x15
	adds r1, r5, #0
	str r3, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0xdd
	str r0, [sp, #0x10]
	ldr r0, [r4]
	adds r1, #0x20
	movs r2, #3
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x80
	adds r1, r7, #0
	bl FUN_02026354
	adds r6, r0, #0
	movs r0, #0x80
	adds r1, r7, #0
	bl FUN_02026354
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	ldr r0, [r0, #4]
	bl FUN_0202C6F4
	bl FUN_0202C08C
	blx FUN_020A0310
	str r1, [sp, #0x1c]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	movs r2, #0
	eors r0, r2
	ldr r2, [sp, #0x24]
	movs r1, #0
	eors r1, r2
	orrs r0, r1
	ldr r0, [r4, #0x54]
	beq _0222CF86
	movs r1, #0x35
	adds r2, r6, #0
	bl FUN_0200BB6C
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02003068
	movs r1, #0xc0
	subs r0, r1, r0
	movs r1, #0
	lsrs r3, r0, #1
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222CFFC @ =0x00010200
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x1c]
	adds r0, r4, #0
	bl ov43_0222AAA4
	ldr r0, [r4, #0x54]
	ldr r2, [sp, #0x20]
	movs r1, #0x34
	bl FUN_0200BB6C
	ldr r0, [r4, #0x50]
	ldr r2, [sp, #0x20]
	adds r1, r6, #0
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222D000 @ =0x000F0200
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x10
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	b _0222CFB4
_0222CF86:
	movs r1, #0x36
	adds r2, r6, #0
	bl FUN_0200BB6C
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02003068
	movs r1, #0xc0
	subs r0, r1, r0
	movs r1, #0
	lsrs r3, r0, #1
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222CFFC @ =0x00010200
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
_0222CFB4:
	ldr r0, [r4, #0x54]
	movs r1, #0x33
	adds r2, r6, #0
	bl FUN_0200BB6C
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222D004 @ =0x00010F00
	movs r1, #4
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x20
	adds r2, r6, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	str r7, [sp]
	adds r3, r5, #0
	ldr r0, [r4, #0x58]
	movs r1, #0xe
	movs r2, #1
	adds r3, #0x34
	bl FUN_02007C2C
	str r0, [r5, #0x30]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222CFFC: .4byte 0x00010200
_0222D000: .4byte 0x000F0200
_0222D004: .4byte 0x00010F00
	thumb_func_end ov43_0222CE48

	thumb_func_start ov43_0222D008
ov43_0222D008: @ 0x0222D008
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x10
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x20
	bl FUN_0201D520
	ldr r0, [r4, #0x30]
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov43_0222D008

	thumb_func_start ov43_0222D028
ov43_0222D028: @ 0x0222D028
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r1, #4]
	adds r4, r2, #0
	bl FUN_02028E9C
	adds r2, r0, #0
	ldr r0, [r4, #0x50]
	movs r1, #0
	bl FUN_0200BE48
	adds r1, r4, #0
	adds r0, r4, #0
	adds r1, #0x64
	movs r2, #0x32
	bl ov43_0222A9F4
	ldr r2, [r5, #0x34]
	movs r3, #0
	str r3, [sp]
	ldrh r0, [r2]
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	adds r2, #0xc
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4]
	bl FUN_0201C4C4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r5, #0
	adds r0, #0x10
	bl FUN_0201D5C8
	adds r5, #0x20
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov43_0222D028

	thumb_func_start ov43_0222D090
ov43_0222D090: @ 0x0222D090
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov43_0222AA70
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201C8C4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201D8E4
	adds r0, r5, #0
	adds r0, #0x10
	bl FUN_0201D8E4
	adds r5, #0x20
	adds r0, r5, #0
	bl FUN_0201D8E4
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201C8C4
	ldr r0, [r4]
	movs r1, #3
	bl FUN_0201EFBC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222D090

	thumb_func_start ov43_0222D0F8
ov43_0222D0F8: @ 0x0222D0F8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r3, _0222D130 @ =_0222ED5C
	adds r4, r1, #0
	ldrb r5, [r3, #1]
	ldrb r3, [r3, #2]
	add r1, sp, #0xc
	strb r5, [r1]
	strb r3, [r1, #1]
	movs r1, #0xe
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	add r0, sp, #0xc
	ldrb r0, [r0, r2]
	movs r1, #2
	movs r2, #0x11
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r3, #0x14
	bl FUN_0201CA4C
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222D130: .4byte _0222ED5C
	thumb_func_end ov43_0222D0F8

	thumb_func_start ov43_0222D134
ov43_0222D134: @ 0x0222D134
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_020503D0
	movs r1, #2
	movs r2, #0x1b
	bl FUN_02066930
	str r0, [r5, #0x10]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov43_0222D584
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222D134

	thumb_func_start ov43_0222D15C
ov43_0222D15C: @ 0x0222D15C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldrb r5, [r6, #8]
	adds r4, r0, #0
	adds r7, r2, #0
	str r3, [sp]
	cmp r5, #6
	bhi _0222D220
	adds r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	add pc, r5
_0222D178: @ jump table
	.2byte _0222D186 - _0222D178 - 2 @ case 0
	.2byte _0222D18C - _0222D178 - 2 @ case 1
	.2byte _0222D19E - _0222D178 - 2 @ case 2
	.2byte _0222D1A6 - _0222D178 - 2 @ case 3
	.2byte _0222D1BC - _0222D178 - 2 @ case 4
	.2byte _0222D1CA - _0222D178 - 2 @ case 5
	.2byte _0222D20C - _0222D178 - 2 @ case 6
_0222D186:
	movs r0, #0
	strh r0, [r4, #0xe]
	strh r0, [r4]
_0222D18C:
	ldr r3, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov43_0222D654
	movs r0, #2
	strb r0, [r6, #8]
	b _0222D220
_0222D19E:
	bl ov43_0222D47C
	strb r0, [r6, #8]
	b _0222D220
_0222D1A6:
	bl ov43_0222D4C4
	ldr r3, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov43_0222D508
	movs r0, #4
	strb r0, [r6, #8]
	b _0222D220
_0222D1BC:
	bl ov43_0222D508
	cmp r0, #1
	bne _0222D220
	movs r0, #2
	strb r0, [r6, #8]
	b _0222D220
_0222D1CA:
	ldrh r0, [r4, #0xe]
	cmp r0, #0
	beq _0222D1DC
	ldrh r0, [r4, #0xc]
	subs r0, r0, #1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	bne _0222D220
_0222D1DC:
	ldr r1, [r4, #8]
	adds r0, r6, #0
	bl ov43_0222DCC4
	cmp r0, #0
	beq _0222D206
	ldr r0, _0222D224 @ =0x000005E5
	bl FUN_0200604C
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov43_0222D87C
	adds r0, r6, #0
	movs r1, #4
	movs r2, #1
	bl ov43_0222A318
	movs r0, #1
	strh r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0222D206:
	movs r0, #2
	strb r0, [r6, #8]
	b _0222D220
_0222D20C:
	adds r1, r7, #0
	bl ov43_0222D778
	adds r0, r6, #0
	movs r1, #1
	movs r2, #9
	bl ov43_0222A318
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222D220:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222D224: .4byte 0x000005E5
	thumb_func_end ov43_0222D15C

	thumb_func_start ov43_0222D228
ov43_0222D228: @ 0x0222D228
	ldr r3, _0222D22C @ =ov43_0222D610
	bx r3
	.align 2, 0
_0222D22C: .4byte ov43_0222D610
	thumb_func_end ov43_0222D228

	thumb_func_start ov43_0222D230
ov43_0222D230: @ 0x0222D230
	ldr r0, [r0, #0x10]
	cmp r0, #1
	bne _0222D23A
	movs r0, #8
	b _0222D23C
_0222D23A:
	movs r0, #3
_0222D23C:
	subs r0, r0, #1
	cmp r1, r0
	bne _0222D246
	movs r0, #1
	bx lr
_0222D246:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov43_0222D230

	thumb_func_start ov43_0222D24C
ov43_0222D24C: @ 0x0222D24C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r3, #5
	bhi _0222D2F2
	adds r1, r3, r3
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0222D262: @ jump table
	.2byte _0222D26E - _0222D262 - 2 @ case 0
	.2byte _0222D284 - _0222D262 - 2 @ case 1
	.2byte _0222D28E - _0222D262 - 2 @ case 2
	.2byte _0222D2AC - _0222D262 - 2 @ case 3
	.2byte _0222D2C8 - _0222D262 - 2 @ case 4
	.2byte _0222D2DE - _0222D262 - 2 @ case 5
_0222D26E:
	movs r1, #0
	ldrsh r1, [r4, r1]
	bl ov43_0222D230
	cmp r0, #0
	beq _0222D2F2
	ldr r0, _0222D2F8 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #6
	pop {r3, r4, r5, pc}
_0222D284:
	ldr r0, _0222D2F8 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #6
	pop {r3, r4, r5, pc}
_0222D28E:
	movs r2, #0
	ldrsh r2, [r4, r2]
	adds r1, r5, #0
	bl ov43_0222DB28
	movs r2, #0
	ldrsh r2, [r4, r2]
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov43_0222DB94
	movs r0, #2
	str r0, [r4, #8]
	movs r0, #3
	pop {r3, r4, r5, pc}
_0222D2AC:
	movs r2, #0
	ldrsh r2, [r4, r2]
	adds r1, r5, #0
	bl ov43_0222DB28
	movs r2, #0
	ldrsh r2, [r4, r2]
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov43_0222DB94
	movs r0, #3
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0222D2C8:
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #4
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #2
	movs r2, #1
	bl ov43_0222AD40
	movs r0, #5
	pop {r3, r4, r5, pc}
_0222D2DE:
	movs r2, #1
	str r2, [r4, #8]
	movs r0, #4
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #3
	bl ov43_0222AD40
	movs r0, #5
	pop {r3, r4, r5, pc}
_0222D2F2:
	movs r0, #2
	pop {r3, r4, r5, pc}
	nop
_0222D2F8: .4byte 0x000005DD
	thumb_func_end ov43_0222D24C

	thumb_func_start ov43_0222D2FC
ov43_0222D2FC: @ 0x0222D2FC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0222D3B0 @ =0x021D110C
	adds r4, r1, #0
	ldr r1, [r0, #0x48]
	ldr r0, _0222D3B4 @ =0x00000CF3
	adds r6, r2, #0
	tst r0, r1
	beq _0222D312
	movs r0, #0
	str r0, [r4]
_0222D312:
	ldr r1, _0222D3B0 @ =0x021D110C
	movs r0, #3
	ldr r2, [r1, #0x48]
	tst r0, r2
	beq _0222D32A
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #1
	bl ov43_0222D24C
	pop {r4, r5, r6, pc}
_0222D32A:
	ldr r0, [r1, #0x4c]
	movs r2, #0x20
	adds r1, r0, #0
	tst r1, r2
	bne _0222D340
	ldrb r1, [r4, #0xe]
	cmp r1, #0
	beq _0222D358
	lsls r2, r2, #4
	tst r2, r0
	beq _0222D358
_0222D340:
	movs r1, #0
	adds r0, r5, #0
	mvns r1, r1
	bl ov43_0222ED18
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #2
	bl ov43_0222D24C
	pop {r4, r5, r6, pc}
_0222D358:
	movs r2, #0x10
	adds r3, r0, #0
	tst r3, r2
	bne _0222D36A
	cmp r1, #0
	beq _0222D380
	adds r2, #0xf0
	tst r0, r2
	beq _0222D380
_0222D36A:
	adds r0, r5, #0
	movs r1, #1
	bl ov43_0222ED18
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #3
	bl ov43_0222D24C
	pop {r4, r5, r6, pc}
_0222D380:
	ldr r0, _0222D3B0 @ =0x021D110C
	ldr r1, [r0, #0x44]
	movs r0, #0x40
	tst r0, r1
	beq _0222D398
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #4
	bl ov43_0222D24C
	pop {r4, r5, r6, pc}
_0222D398:
	movs r0, #0x80
	tst r0, r1
	beq _0222D3AC
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #5
	bl ov43_0222D24C
	pop {r4, r5, r6, pc}
_0222D3AC:
	movs r0, #2
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222D3B0: .4byte 0x021D110C
_0222D3B4: .4byte 0x00000CF3
	thumb_func_end ov43_0222D2FC

	thumb_func_start ov43_0222D3B8
ov43_0222D3B8: @ 0x0222D3B8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	adds r7, r1, #0
	adds r6, r3, #0
	str r2, [sp]
	cmp r0, #0
	beq _0222D3D0
	ldr r0, _0222D474 @ =0x0222EE84
	bl FUN_0202529C
	b _0222D3D6
_0222D3D0:
	ldr r0, _0222D478 @ =0x0222EE42
	bl FUN_0202529C
_0222D3D6:
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0222D3E4
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0222D3E4:
	cmp r4, #0
	bne _0222D3FA
	movs r0, #1
	str r0, [r6]
	ldr r2, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #4
	bl ov43_0222D24C
	pop {r3, r4, r5, r6, r7, pc}
_0222D3FA:
	cmp r4, #1
	bne _0222D410
	movs r0, #1
	str r0, [r6]
	ldr r2, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #5
	bl ov43_0222D24C
	pop {r3, r4, r5, r6, r7, pc}
_0222D410:
	subs r1, r4, #2
	lsls r1, r1, #0x10
	adds r0, r5, #0
	asrs r1, r1, #0x10
	bl ov43_0222D230
	cmp r0, #0
	beq _0222D434
	subs r0, r4, #2
	strh r0, [r5]
	movs r3, #1
	ldr r2, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	str r3, [r6]
	bl ov43_0222D24C
	pop {r3, r4, r5, r6, r7, pc}
_0222D434:
	movs r0, #0
	ldrsh r0, [r5, r0]
	subs r1, r4, #2
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	bne _0222D446
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0222D446:
	movs r0, #1
	str r0, [r6]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222ED18
	cmp r4, #0
	blt _0222D464
	ldr r2, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #3
	bl ov43_0222D24C
	pop {r3, r4, r5, r6, r7, pc}
_0222D464:
	ldr r2, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #2
	bl ov43_0222D24C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222D474: .4byte 0x0222EE84
_0222D478: .4byte 0x0222EE42
	thumb_func_end ov43_0222D3B8

	thumb_func_start ov43_0222D47C
ov43_0222D47C: @ 0x0222D47C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r1, #0
	ldr r1, _0222D4C0 @ =0x021D110C
	adds r6, r2, #0
	ldr r2, [r1, #0x44]
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0xc0
	str r0, [sp]
	tst r1, r2
	bne _0222D496
	strh r0, [r5, #0xe]
_0222D496:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	add r3, sp, #0
	bl ov43_0222D3B8
	ldr r1, [sp]
	cmp r1, #0
	beq _0222D4B0
	movs r1, #1
	add sp, #4
	str r1, [r4]
	pop {r3, r4, r5, r6, pc}
_0222D4B0:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov43_0222D2FC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0222D4C0: .4byte 0x021D110C
	thumb_func_end ov43_0222D47C

	thumb_func_start ov43_0222D4C4
ov43_0222D4C4: @ 0x0222D4C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r1, #0
	adds r5, r0, #0
	adds r4, r2, #0
	movs r1, #0
	str r1, [r5, #4]
	adds r0, r4, #0
	adds r6, r3, #0
	bl ov43_0222AD20
	ldr r0, [r5, #8]
	cmp r0, #2
	bne _0222D4E4
	movs r3, #2
	b _0222D4E6
_0222D4E4:
	movs r3, #1
_0222D4E6:
	movs r0, #0
	ldrsh r0, [r5, r0]
	adds r1, r7, #0
	adds r2, r4, #0
	str r0, [sp]
	adds r0, r5, #0
	str r6, [sp, #4]
	bl ov43_0222DAE8
	ldr r0, _0222D504 @ =0x000005E1
	bl FUN_0200604C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222D504: .4byte 0x000005E1
	thumb_func_end ov43_0222D4C4

	thumb_func_start ov43_0222D508
ov43_0222D508: @ 0x0222D508
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r7, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r0, #4
	ble _0222D55C
	movs r2, #0
	ldr r0, [r4]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201F238
	movs r2, #0
	ldr r0, [r4]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201F238
	movs r3, #0
	ldrsh r0, [r5, r3]
	adds r1, r7, #0
	adds r2, r4, #0
	str r0, [sp]
	adds r0, r5, #0
	str r6, [sp, #4]
	bl ov43_0222DAE8
	adds r0, r4, #0
	movs r1, #1
	bl ov43_0222AD20
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0xff
	bl ov43_0222DB94
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222D55C:
	lsls r1, r0, #8
	asrs r0, r1, #1
	lsrs r0, r0, #0x1e
	adds r0, r1, r0
	asrs r3, r0, #2
	ldr r0, [r5, #8]
	cmp r0, #2
	bne _0222D56E
	rsbs r3, r3, #0
_0222D56E:
	ldr r0, [r4]
	movs r1, #3
	movs r2, #0
	bl FUN_0201F238
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222D508

	thumb_func_start ov43_0222D584
ov43_0222D584: @ 0x0222D584
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r7, r0, #0
	str r2, [sp, #8]
	adds r1, r2, #0
	adds r0, #0xf8
	adds r2, r3, #0
	str r3, [sp, #0xc]
	bl ov43_0222DD40
	ldr r1, [sp, #8]
	adds r0, r7, #0
	bl ov43_0222DDA0
	movs r0, #0
	str r0, [sp, #0x18]
	ldr r0, _0222D600 @ =0x0222EDAC
	adds r7, #0x14
	str r0, [sp, #0x14]
	ldr r0, _0222D604 @ =0x0222EE08
	str r0, [sp, #0x10]
_0222D5AE:
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x14]
	str r0, [sp]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x10]
	ldr r3, [r3]
	adds r0, r7, #0
	bl ov43_0222DDF0
	ldr r4, _0222D608 @ =0x0222F10C
	ldr r5, _0222D60C @ =0x0222F0D0
	movs r6, #0
_0222D5C6:
	ldr r0, [r4]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0xc]
	adds r2, r6, #0
	str r0, [sp, #4]
	ldrb r3, [r5]
	adds r0, r7, #0
	bl ov43_0222DE14
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #1
	cmp r6, #8
	blt _0222D5C6
	ldr r0, [sp, #0x14]
	adds r7, #0x4c
	adds r0, r0, #4
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r0, r0, #6
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #3
	blt _0222D5AE
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222D600: .4byte 0x0222EDAC
_0222D604: .4byte 0x0222EE08
_0222D608: .4byte 0x0222F10C
_0222D60C: .4byte 0x0222F0D0
	thumb_func_end ov43_0222D584

	thumb_func_start ov43_0222D610
ov43_0222D610: @ 0x0222D610
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r6, #0
	adds r5, r0, #0
	str r0, [sp]
	str r2, [sp, #4]
	adds r5, #0x14
	adds r7, r6, #0
_0222D620:
	adds r4, r7, #0
_0222D622:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222DED0
	adds r4, r4, #1
	cmp r4, #8
	blt _0222D622
	adds r0, r5, #0
	bl ov43_0222DE10
	adds r6, r6, #1
	adds r5, #0x4c
	cmp r6, #3
	blt _0222D620
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov43_0222DDD0
	ldr r0, [sp]
	adds r0, #0xf8
	str r0, [sp]
	bl ov43_0222DD88
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222D610

	thumb_func_start ov43_0222D654
ov43_0222D654: @ 0x0222D654
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r1, #0
	adds r4, r2, #0
	movs r2, #0xb
	ldrsb r2, [r6, r2]
	adds r5, r0, #0
	ldr r1, [r6, #4]
	adds r2, r6, r2
	ldrb r2, [r2, #0x18]
	adds r0, r4, #0
	adds r7, r3, #0
	bl ov43_0222AB20
	movs r1, #0x4a
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r1, r5, r1
	movs r2, #0xd
	bl ov43_0222A9F4
	movs r0, #0x45
	lsls r0, r0, #2
	ldr r2, [r5, r0]
	movs r3, #0
	str r3, [sp]
	ldrh r0, [r2]
	movs r1, #5
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	adds r2, #0xc
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4]
	bl FUN_0201C4C4
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201EFBC
	adds r0, r5, #0
	adds r0, #0xfc
	movs r1, #0
	ldr r2, [r0]
	adds r3, r1, #0
	str r1, [sp]
	ldrh r0, [r2]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	adds r2, #0xc
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4]
	bl FUN_0201C4C4
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0201EFBC
	movs r0, #0x41
	lsls r0, r0, #2
	ldr r2, [r5, r0]
	movs r3, #0
	str r3, [sp]
	ldrh r0, [r2]
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	adds r2, #0xc
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4]
	bl FUN_0201C4C4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201EFBC
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl ov43_0222D8B8
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov43_0222AD98
	movs r3, #0
	ldrsh r0, [r5, r3]
	adds r1, r6, #0
	adds r2, r4, #0
	str r0, [sp]
	adds r0, r5, #0
	str r7, [sp, #4]
	bl ov43_0222DAE8
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0xff
	bl ov43_0222DB94
	movs r0, #0x7d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xf4
	movs r2, #0x18
	bl FUN_0200DD88
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl ov43_0222AD40
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xf4
	movs r2, #0x88
	bl FUN_0200DD88
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0
	bl ov43_0222AD40
	adds r0, r4, #0
	movs r1, #1
	bl ov43_0222AD00
	movs r0, #2
	movs r1, #0
	bl FUN_0201BB68
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222D654

	thumb_func_start ov43_0222D778
ov43_0222D778: @ 0x0222D778
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov43_0222AD00
	movs r0, #0x7d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #8
	movs r2, #0x62
	bl FUN_0200DD88
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov43_0222AD40
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0xf8
	movs r2, #0x62
	bl FUN_0200DD88
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov43_0222AD40
	adds r4, r7, #0
	movs r6, #0
	adds r4, #0x14
_0222D7BE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov43_0222DF90
	adds r6, r6, #1
	adds r4, #0x4c
	cmp r6, #3
	blt _0222D7BE
	adds r0, r7, #0
	adds r1, r5, #0
	bl ov43_0222DC7C
	adds r0, r7, #0
	adds r1, r5, #0
	bl ov43_0222DB84
	adds r0, r7, #0
	bl ov43_0222DACC
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5]
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0201C8C4
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5]
	movs r1, #4
	adds r3, r2, #0
	bl FUN_0201C8C4
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201C8C4
	ldr r0, [r5]
	movs r1, #5
	bl FUN_0201EFBC
	ldr r0, [r5]
	movs r1, #4
	bl FUN_0201EFBC
	ldr r0, [r5]
	movs r1, #2
	bl FUN_0201EFBC
	movs r0, #0x43
	lsls r0, r0, #2
	movs r1, #0
	ldr r2, [r7, r0]
	adds r3, r1, #0
	str r1, [sp]
	ldrh r0, [r2]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	adds r2, #0xc
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r5]
	bl FUN_0201C4C4
	ldr r0, [r5]
	movs r1, #0
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl ov43_0222AA70
	movs r0, #2
	adds r1, r0, #0
	bl FUN_0201BB68
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222D778

	thumb_func_start ov43_0222D87C
ov43_0222D87C: @ 0x0222D87C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	adds r6, r1, #0
	movs r4, #0
	adds r5, #0x14
_0222D888:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov43_0222DF90
	adds r4, r4, #1
	adds r5, #0x4c
	cmp r4, #3
	blt _0222D888
	movs r0, #0x46
	lsls r0, r0, #2
	movs r5, #0
	adds r4, r7, r0
_0222D8A0:
	adds r0, r4, #0
	bl FUN_0201D8E4
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #5
	ble _0222D8A0
	adds r0, r6, #0
	bl ov43_0222AA70
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222D87C

	thumb_func_start ov43_0222D8B8
ov43_0222D8B8: @ 0x0222D8B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r5, r1, #0
	adds r7, r0, #0
	ldr r0, [r5, #4]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl FUN_0202C6F4
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	movs r2, #8
	str r0, [sp, #0x24]
	adds r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl FUN_0202C090
	str r0, [sp, #0x20]
	movs r0, #0x46
	lsls r0, r0, #2
	movs r6, #0
	adds r4, r7, r0
_0222D8E4:
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #8
	blo _0222D8E4
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x18]
	movs r3, #2
	adds r2, r5, r2
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r0, [r0, #0x50]
	adds r2, r2, #1
	bl FUN_0200BFCC
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r2, [r5, #0x14]
	ldr r0, [r0, #0x50]
	movs r3, #2
	bl FUN_0200BFCC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222DAC0 @ =0x000F0200
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	movs r0, #0x46
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r1, r5, #0
	movs r3, #0x12
	bl ov43_0222ECD4
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _0222D94A
	ldr r4, _0222DAC4 @ =0x00050600
	b _0222D956
_0222D94A:
	cmp r0, #1
	bne _0222D954
	movs r4, #0xc1
	lsls r4, r4, #0xa
	b _0222D956
_0222D954:
	ldr r4, _0222DAC8 @ =0x00010200
_0222D956:
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x18]
	ldr r1, [r5, #4]
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	ldr r3, [sp, #0x1c]
	bl ov43_0222AB20
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r2, [sp, #0x18]
	adds r0, r7, r0
	adds r1, r5, #0
	movs r3, #0x11
	str r4, [sp, #8]
	bl ov43_0222ECD4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222DAC0 @ =0x000F0200
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	movs r0, #0x5e
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r1, r5, #0
	movs r3, #0xf
	bl ov43_0222ECD4
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x18]
	ldr r1, [r5, #4]
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	ldr r3, [sp, #0x1c]
	bl ov43_0222AB5C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222DAC8 @ =0x00010200
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	movs r0, #0x52
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r1, r5, #0
	movs r3, #0x10
	bl ov43_0222ECD4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222DAC0 @ =0x000F0200
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	movs r0, #0x62
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r1, r5, #0
	movs r3, #0x1b
	bl ov43_0222ECD4
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x18]
	ldr r1, [r5, #4]
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl ov43_0222AB94
	cmp r0, #0
	beq _0222DA0E
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222DAC8 @ =0x00010200
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	movs r0, #0x56
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r1, r5, #0
	movs r3, #0x1c
	bl ov43_0222ECD4
_0222DA0E:
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #0x24]
	movs r2, #7
	adds r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl FUN_0202C090
	adds r1, r0, #0
	ldr r0, [sp, #0x20]
	movs r2, #1
	bl FUN_0205B46C
	movs r1, #2
	add r2, sp, #0x28
	bl FUN_02070D84
	movs r1, #0x32
	ldr r0, [sp, #0x1c]
	lsls r1, r1, #6
	bl FUN_0201AA8C
	movs r3, #0
	adds r4, r0, #0
	str r3, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x1c]
	bl FUN_020141C4
	movs r0, #0x50
	str r0, [sp]
	movs r2, #0
	str r0, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0x5a
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r1, r4, #0
	adds r3, r2, #0
	bl FUN_0201D9D8
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	movs r3, #0x1e
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x30]
	movs r2, #4
	lsls r3, r3, #4
	bl FUN_02007938
	movs r1, #4
	movs r0, #0xa
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	adds r2, r1, #0
	ldr r0, [r0]
	adds r3, r1, #0
	bl FUN_0201CA4C
	movs r0, #0x46
	lsls r0, r0, #2
	movs r4, #0
	adds r5, r7, r0
_0222DAAC:
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #8
	blo _0222DAAC
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DAC0: .4byte 0x000F0200
_0222DAC4: .4byte 0x00050600
_0222DAC8: .4byte 0x00010200
	thumb_func_end ov43_0222D8B8

	thumb_func_start ov43_0222DACC
ov43_0222DACC: @ 0x0222DACC
	push {r3, r4, r5, lr}
	movs r1, #0x46
	lsls r1, r1, #2
	movs r4, #0
	adds r5, r0, r1
_0222DAD6:
	adds r0, r5, #0
	bl FUN_0201D8E4
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #8
	blt _0222DAD6
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov43_0222DACC

	thumb_func_start ov43_0222DAE8
ov43_0222DAE8: @ 0x0222DAE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bne _0222DB00
	ldr r2, [sp, #0x20]
	adds r1, r4, #0
	strh r2, [r5]
	bl ov43_0222DB28
_0222DB00:
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r5, r0
	str r0, [sp]
	ldr r0, [r5, #0x10]
	adds r5, #0x14
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r0, [sp, #8]
	movs r0, #0x4c
	muls r0, r6, r0
	adds r0, r5, r0
	adds r1, r7, #0
	adds r2, r4, #0
	bl ov43_0222DF4C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222DAE8

	thumb_func_start ov43_0222DB28
ov43_0222DB28: @ 0x0222DB28
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0x10]
	adds r5, r1, #0
	cmp r0, #1
	bne _0222DB4A
	lsls r1, r2, #5
	movs r0, #0x7f
	lsls r0, r0, #2
	adds r1, #0x10
	lsls r1, r1, #0x10
	ldr r0, [r5, r0]
	asrs r1, r1, #0x10
	movs r2, #0xb0
	movs r4, #2
	bl FUN_0200DD88
	b _0222DB78
_0222DB4A:
	cmp r2, #2
	bne _0222DB60
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0xf0
	movs r2, #0xb0
	movs r4, #2
	bl FUN_0200DD88
	b _0222DB78
_0222DB60:
	movs r1, #0x70
	muls r1, r2, r1
	movs r0, #0x7f
	lsls r0, r0, #2
	adds r1, #0x38
	lsls r1, r1, #0x10
	ldr r0, [r5, r0]
	asrs r1, r1, #0x10
	movs r2, #0xb0
	movs r4, #1
	bl FUN_0200DD88
_0222DB78:
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl ov43_0222AD74
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222DB28

	thumb_func_start ov43_0222DB84
ov43_0222DB84: @ 0x0222DB84
	ldr r3, _0222DB90 @ =ov43_0222AD74
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0xff
	bx r3
	nop
_0222DB90: .4byte ov43_0222AD74
	thumb_func_end ov43_0222DB84

	thumb_func_start ov43_0222DB94
ov43_0222DB94: @ 0x0222DB94
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	ldr r0, [r6, #0x10]
	adds r5, r1, #0
	adds r4, r2, #0
	cmp r0, #1
	bne _0222DBDC
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x20
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	movs r1, #0xc
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r3, #0x14
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl FUN_0201C4EC
	b _0222DC10
_0222DBDC:
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x20
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	movs r3, #0x14
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl FUN_0201C4EC
_0222DC10:
	cmp r4, #0xff
	bne _0222DC20
	ldr r0, [r5]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
_0222DC20:
	movs r0, #0x83
	ldr r1, [r6, #0x10]
	lsls r0, r0, #2
	ldr r3, [r5, r0]
	ldr r2, _0222DC70 @ =0x0222EDB8
	lsls r0, r1, #3
	adds r2, r2, r0
	ldr r6, _0222DC74 @ =0x0222EDF8
	ldrb r2, [r4, r2]
	adds r0, r6, r0
	ldrb r0, [r4, r0]
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r3, #0
	adds r0, #0xc
	str r0, [sp, #8]
	ldr r0, _0222DC78 @ =0x0222F0C4
	str r2, [sp, #0xc]
	ldrb r0, [r0, r1]
	movs r1, #2
	str r0, [sp, #0x10]
	ldrh r0, [r3]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r3, #2]
	movs r3, #0x14
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl FUN_0201C4EC
	ldr r0, [r5]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222DC70: .4byte 0x0222EDB8
_0222DC74: .4byte 0x0222EDF8
_0222DC78: .4byte 0x0222F0C4
	thumb_func_end ov43_0222DB94

	thumb_func_start ov43_0222DC7C
ov43_0222DC7C: @ 0x0222DC7C
	push {r3, r4, lr}
	sub sp, #0x1c
	movs r0, #0x83
	adds r4, r1, #0
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x20
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	movs r1, #0x1c
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r3, #0x14
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl FUN_0201C4EC
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end ov43_0222DC7C

	thumb_func_start ov43_0222DCC4
ov43_0222DCC4: @ 0x0222DCC4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r7, r1, #0
	bl FUN_0202C6F4
	adds r6, r0, #0
	movs r0, #0xb
	ldrsb r4, [r5, r0]
	cmp r7, #0
	bne _0222DD0A
	ldr r1, [r5, #0x10]
	movs r7, #0
	subs r0, r1, #1
	beq _0222DD3A
_0222DCE2:
	subs r4, r4, #1
	bpl _0222DCE8
	adds r4, r4, r1
_0222DCE8:
	adds r1, r5, r4
	ldrb r1, [r1, #0x18]
	adds r0, r6, #0
	movs r2, #8
	bl FUN_0202C090
	cmp r0, #2
	beq _0222DCFE
	strb r4, [r5, #0xb]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222DCFE:
	ldr r1, [r5, #0x10]
	adds r7, r7, #1
	subs r0, r1, #1
	cmp r7, r0
	blo _0222DCE2
	b _0222DD3A
_0222DD0A:
	ldr r1, [r5, #0x10]
	movs r7, #0
	subs r0, r1, #1
	beq _0222DD3A
_0222DD12:
	adds r0, r4, #1
	blx FUN_020F2BA4
	adds r4, r1, #0
	adds r1, r5, r4
	ldrb r1, [r1, #0x18]
	adds r0, r6, #0
	movs r2, #8
	bl FUN_0202C090
	cmp r0, #2
	beq _0222DD30
	strb r4, [r5, #0xb]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222DD30:
	ldr r1, [r5, #0x10]
	adds r7, r7, #1
	subs r0, r1, #1
	cmp r7, r0
	blo _0222DD12
_0222DD3A:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222DCC4

	thumb_func_start ov43_0222DD40
ov43_0222DD40: @ 0x0222DD40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r1, #0
	ldr r1, _0222DD84 @ =_0222ED5C
	str r2, [sp, #4]
	ldrh r2, [r1, #0x2e]
	adds r5, r0, #0
	add r0, sp, #8
	strh r2, [r0]
	ldrh r2, [r1, #0x30]
	add r4, sp, #8
	movs r6, #0
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x32]
	ldrh r1, [r1, #0x34]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
_0222DD62:
	ldr r0, [sp, #4]
	movs r2, #1
	str r0, [sp]
	ldrh r1, [r4]
	ldr r0, [r7, #0x58]
	adds r3, r5, #4
	bl FUN_02007C2C
	str r0, [r5]
	adds r6, r6, #1
	adds r5, #8
	adds r4, r4, #2
	cmp r6, #4
	blt _0222DD62
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DD84: .4byte _0222ED5C
	thumb_func_end ov43_0222DD40

	thumb_func_start ov43_0222DD88
ov43_0222DD88: @ 0x0222DD88
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0222DD8E:
	ldr r0, [r5]
	bl FUN_0201AB0C
	adds r4, r4, #1
	adds r5, #8
	cmp r4, #4
	blt _0222DD8E
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov43_0222DD88

	thumb_func_start ov43_0222DDA0
ov43_0222DDA0: @ 0x0222DDA0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	movs r1, #0x46
	lsls r1, r1, #2
	ldr r4, _0222DDCC @ =0x0222EF20
	movs r6, #0
	adds r5, r0, r1
_0222DDAE:
	ldr r0, [r7]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #8
	blt _0222DDAE
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222DDCC: .4byte 0x0222EF20
	thumb_func_end ov43_0222DDA0

	thumb_func_start ov43_0222DDD0
ov43_0222DDD0: @ 0x0222DDD0
	push {r3, r4, r5, lr}
	movs r1, #0x46
	lsls r1, r1, #2
	movs r4, #0
	adds r5, r0, r1
_0222DDDA:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #8
	blt _0222DDDA
	pop {r3, r4, r5, pc}
	thumb_func_end ov43_0222DDD0

	thumb_func_start ov43_0222DDF0
ov43_0222DDF0: @ 0x0222DDF0
	ldrh r1, [r2]
	strh r1, [r0]
	ldrh r1, [r2, #2]
	strh r1, [r0, #2]
	ldrh r1, [r2, #4]
	movs r2, #0
	strh r1, [r0, #4]
	str r3, [r0, #8]
	adds r1, r2, #0
_0222DE02:
	str r1, [r0, #0xc]
	str r1, [r0, #0x2c]
	adds r2, r2, #1
	adds r0, r0, #4
	cmp r2, #8
	blt _0222DE02
	bx lr
	thumb_func_end ov43_0222DDF0

	thumb_func_start ov43_0222DE10
ov43_0222DE10: @ 0x0222DE10
	bx lr
	.align 2, 0
	thumb_func_end ov43_0222DE10

	thumb_func_start ov43_0222DE14
ov43_0222DE14: @ 0x0222DE14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r1, [sp, #0x18]
	adds r1, r3, #0
	str r0, [sp, #0x14]
	lsls r1, r1, #0x18
	ldr r0, [sp, #0x44]
	lsrs r1, r1, #0x18
	str r3, [sp, #0x1c]
	lsls r4, r2, #2
	bl FUN_0201D39C
	ldr r1, [sp, #0x14]
	adds r7, r1, r4
	str r0, [r7, #0xc]
	ldr r0, [sp, #0x1c]
	str r0, [r7, #0x2c]
	adds r0, r1, #0
	ldr r0, [r0, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	movs r0, #0
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bls _0222DECA
	ldr r4, [sp, #0x24]
	ldr r5, [sp, #0x40]
_0222DE4E:
	ldr r0, [r7, #0xc]
	adds r0, r0, r4
	bl FUN_0201D3C4
	ldr r1, [sp, #0x14]
	movs r0, #2
	ldrsh r0, [r1, r0]
	cmp r0, #0
	bge _0222DE62
	rsbs r0, r0, #0
_0222DE62:
	ldr r2, [sp, #0x14]
	movs r1, #0
	ldrsh r6, [r2, r1]
	cmp r6, #0
	bge _0222DE6E
	rsbs r6, r6, #0
_0222DE6E:
	ldrb r1, [r5, #1]
	movs r2, #3
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldrb r0, [r5, #2]
	str r0, [sp, #4]
	ldrb r0, [r5, #3]
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x10]
	ldrb r3, [r5]
	ldr r0, [sp, #0x18]
	ldr r1, [r7, #0xc]
	adds r3, r3, r6
	lsls r3, r3, #0x18
	ldr r0, [r0]
	adds r1, r1, r4
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	ldr r0, [r7, #0xc]
	movs r1, #0
	adds r0, r0, r4
	bl FUN_0201D978
	ldrb r1, [r5, #2]
	ldrb r0, [r5, #3]
	adds r4, #0x10
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x20]
	adds r5, r5, #4
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	adds r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [sp, #0x24]
	cmp r1, r0
	blo _0222DE4E
_0222DECA:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222DE14

	thumb_func_start ov43_0222DED0
ov43_0222DED0: @ 0x0222DED0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r4, r1, #2
	adds r0, r5, r4
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _0222DEF4
	adds r6, r5, #0
	adds r6, #0x2c
	ldr r1, [r6, r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201D54C
	movs r1, #0
	adds r0, r5, r4
	str r1, [r0, #0xc]
	str r1, [r6, r4]
_0222DEF4:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov43_0222DED0

	thumb_func_start ov43_0222DEF8
ov43_0222DEF8: @ 0x0222DEF8
	push {r4, r5, r6, lr}
	lsls r1, r1, #2
	adds r5, r0, r1
	ldr r0, [r5, #0x2c]
	movs r6, #0
	cmp r0, #0
	bls _0222DF1A
	adds r4, r6, #0
_0222DF08:
	ldr r0, [r5, #0xc]
	adds r0, r0, r4
	bl FUN_0201D5C8
	ldr r0, [r5, #0x2c]
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, r0
	blo _0222DF08
_0222DF1A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov43_0222DEF8

	thumb_func_start ov43_0222DF1C
ov43_0222DF1C: @ 0x0222DF1C
	push {r3, r4, r5, r6, r7, lr}
	lsls r1, r1, #2
	adds r5, r0, r1
	ldr r0, [r5, #0x2c]
	movs r6, #0
	cmp r0, #0
	bls _0222DF4A
	adds r4, r6, #0
	adds r7, r6, #0
_0222DF2E:
	ldr r0, [r5, #0xc]
	adds r0, r0, r4
	bl FUN_0201D8E4
	ldr r0, [r5, #0xc]
	adds r1, r7, #0
	adds r0, r0, r4
	bl FUN_0201D978
	ldr r0, [r5, #0x2c]
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, r0
	blo _0222DF2E
_0222DF4A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov43_0222DF1C

	thumb_func_start ov43_0222DF4C
ov43_0222DF4C: @ 0x0222DF4C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r2, #0
	adds r7, r1, #0
	adds r1, r5, #0
	adds r6, r0, #0
	adds r4, r3, #0
	bl ov43_0222DF90
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0222DF74
	adds r2, r5, #0
	lsls r5, r4, #2
	ldr r4, _0222DF88 @ =0x0222F12C
	ldr r3, [sp, #0x20]
	ldr r4, [r4, r5]
	adds r0, r6, #0
	adds r1, r7, #0
	blx r4
	pop {r3, r4, r5, r6, r7, pc}
_0222DF74:
	adds r2, r5, #0
	lsls r5, r4, #2
	ldr r4, _0222DF8C @ =0x0222F0E0
	ldr r3, [sp, #0x20]
	ldr r4, [r4, r5]
	adds r0, r6, #0
	adds r1, r7, #0
	blx r4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DF88: .4byte 0x0222F12C
_0222DF8C: .4byte 0x0222F0E0
	thumb_func_end ov43_0222DF4C

	thumb_func_start ov43_0222DF90
ov43_0222DF90: @ 0x0222DF90
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
_0222DF98:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov43_0222DF1C
	adds r4, r4, #1
	cmp r4, #8
	blt _0222DF98
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov43_0222EC14
	pop {r4, r5, r6, pc}
	thumb_func_end ov43_0222DF90

	thumb_func_start ov43_0222DFB0
ov43_0222DFB0: @ 0x0222DFB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	adds r4, r2, #0
	bl FUN_0202C6F4
	str r0, [sp, #0x28]
	movs r1, #0
	str r4, [sp]
	movs r0, #0x13
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, _0222E0E4 @ =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	adds r2, r1, #0
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	adds r3, r5, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x1c]
	bl ov43_0222EC58
	movs r6, #0
	str r6, [sp, #0x24]
_0222DFEE:
	ldr r0, [sp, #0x24]
	str r4, [sp]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r6, #0
	adds r0, #0x14
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, _0222E0E4 @ =0x00010200
	str r7, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	movs r1, #0
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r2, #2
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #0x28]
	adds r2, r6, #1
	adds r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl FUN_0202C090
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x16
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, _0222E0E4 @ =0x00010200
	str r7, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	movs r1, #0
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r2, #2
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	adds r3, r5, #0
	bl ov43_0222EC58
	ldr r0, [sp, #0x24]
	adds r6, r6, #1
	adds r0, #0x18
	str r0, [sp, #0x24]
	cmp r6, #2
	blo _0222DFEE
	str r4, [sp]
	movs r0, #0x17
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E0E4 @ =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	movs r2, #1
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	adds r3, r5, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x1c]
	bl ov43_0222EC58
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #0x28]
	movs r2, #3
	adds r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl FUN_0202C090
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E0E4 @ =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	adds r4, #0x80
	str r0, [sp, #0x14]
	ldr r0, [r4]
	movs r2, #3
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	adds r3, r5, #0
	str r1, [sp, #0x1c]
	bl ov43_0222EC58
	ldr r0, [sp, #0x20]
	movs r1, #0
	bl ov43_0222DEF8
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222E0E4: .4byte 0x00010200
	thumb_func_end ov43_0222DFB0

	thumb_func_start ov43_0222E0E8
ov43_0222E0E8: @ 0x0222E0E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5, #4]
	adds r4, r2, #0
	bl FUN_0203107C
	adds r7, r0, #0
	str r4, [sp]
	movs r0, #0x1d
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, _0222E21C @ =0x00010200
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	movs r1, #2
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	adds r3, r5, #0
	str r0, [sp, #0x18]
	adds r0, r6, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	adds r0, r7, #0
	movs r1, #0x64
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	str r4, [sp]
	adds r0, #0x22
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, _0222E21C @ =0x00010200
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r4, #0x7c]
	movs r2, #1
	str r1, [sp, #0x14]
	adds r1, r4, #0
	adds r1, #0x80
	ldr r1, [r1]
	adds r3, r5, #0
	str r1, [sp, #0x18]
	str r0, [sp, #0x1c]
	adds r0, r6, #0
	movs r1, #2
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	adds r0, r7, #0
	movs r1, #0x71
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x25
	str r0, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0222E21C @ =0x00010200
	movs r2, #1
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	movs r1, #2
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	adds r3, r5, #0
	str r0, [sp, #0x18]
	str r2, [sp, #0x1c]
	adds r0, r6, #0
	bl ov43_0222EC58
	str r4, [sp]
	movs r0, #0x24
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0x18
	str r1, [sp, #0xc]
	ldr r1, _0222E21C @ =0x00010200
	movs r2, #1
	str r1, [sp, #0x10]
	ldr r1, [r4, #0x7c]
	adds r3, r5, #0
	str r1, [sp, #0x14]
	adds r1, r4, #0
	adds r1, #0x80
	ldr r1, [r1]
	str r1, [sp, #0x18]
	str r0, [sp, #0x1c]
	adds r0, r6, #0
	movs r1, #2
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	adds r0, r7, #0
	movs r1, #0x70
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x25
	str r0, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, _0222E21C @ =0x00010200
	movs r2, #1
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x7c]
	adds r4, #0x80
	str r0, [sp, #0x14]
	ldr r0, [r4]
	movs r1, #2
	str r0, [sp, #0x18]
	adds r0, r6, #0
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	adds r0, r6, #0
	movs r1, #2
	bl ov43_0222DEF8
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E21C: .4byte 0x00010200
	thumb_func_end ov43_0222E0E8

	thumb_func_start ov43_0222E220
ov43_0222E220: @ 0x0222E220
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	adds r6, r3, #0
	adds r4, r2, #0
	bl FUN_0203107C
	str r0, [sp, #0x24]
	movs r0, #0x80
	adds r1, r6, #0
	bl FUN_02026354
	adds r7, r0, #0
	movs r0, #0x80
	adds r1, r6, #0
	bl FUN_02026354
	adds r6, r0, #0
	str r4, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, _0222E5B0 @ =0x00010200
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	str r2, [sp, #0x1c]
	movs r1, #3
	adds r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	movs r0, #0x26
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E5B0 @ =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r1, #3
	movs r2, #1
	adds r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	movs r0, #0x28
	str r0, [sp, #4]
	movs r0, #0xd0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 @ =0x00010200
	movs r1, #3
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	movs r0, #2
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r2, #1
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x66
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	cmp r0, #0
	bne _0222E2C8
	movs r0, #0x22
	b _0222E2CA
_0222E2C8:
	movs r0, #0x23
_0222E2CA:
	str r4, [sp]
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E5B0 @ =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r1, #3
	movs r2, #2
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x73
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x25
	str r0, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 @ =0x00010200
	movs r1, #3
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	movs r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r2, #2
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x75
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x2b
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E5B0 @ =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r1, #3
	movs r2, #2
	adds r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	movs r0, #0x24
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 @ =0x00010200
	movs r2, #2
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r1, #3
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x72
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x25
	str r0, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 @ =0x00010200
	movs r1, #3
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	movs r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r2, #2
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x74
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x2b
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 @ =0x00010200
	movs r2, #2
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r1, #3
	adds r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	movs r0, #0x27
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E5B0 @ =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	movs r1, #3
	ldr r0, [sp, #0x20]
	adds r2, r1, #0
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r1, #3
	str r4, [sp]
	movs r0, #0x28
	str r0, [sp, #4]
	movs r0, #0xd0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 @ =0x00010200
	adds r2, r1, #0
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	movs r0, #2
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x68
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	cmp r0, #0
	bne _0222E460
	movs r0, #0x22
	b _0222E462
_0222E460:
	movs r0, #0x23
_0222E462:
	str r4, [sp]
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E5B0 @ =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r1, #3
	movs r2, #4
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x77
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x25
	str r0, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 @ =0x00010200
	movs r1, #3
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	movs r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r2, #4
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x79
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x2b
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _0222E5B0 @ =0x00010200
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r1, #3
	movs r2, #4
	adds r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	movs r0, #0x24
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 @ =0x00010200
	movs r2, #4
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r1, #3
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x76
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x25
	str r0, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 @ =0x00010200
	movs r1, #3
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	movs r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r2, #4
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x78
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x2b
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _0222E5B0 @ =0x00010200
	movs r2, #4
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r1, #3
	adds r3, r5, #0
	bl ov43_0222EC58
	ldr r0, [sp, #0x20]
	movs r1, #3
	bl ov43_0222DEF8
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222E5B0: .4byte 0x00010200
	thumb_func_end ov43_0222E220

	thumb_func_start ov43_0222E5B4
ov43_0222E5B4: @ 0x0222E5B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	adds r6, r3, #0
	adds r4, r2, #0
	bl FUN_0203107C
	str r0, [sp, #0x24]
	movs r0, #0x80
	adds r1, r6, #0
	bl FUN_02026354
	adds r7, r0, #0
	movs r0, #0x80
	adds r1, r6, #0
	bl FUN_02026354
	adds r6, r0, #0
	str r4, [sp]
	movs r0, #0x1f
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, _0222E788 @ =0x00010200
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	str r2, [sp, #0x1c]
	movs r1, #4
	adds r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	movs r0, #0x29
	str r0, [sp, #4]
	movs r0, #0x68
	str r0, [sp, #8]
	movs r0, #0x14
	str r0, [sp, #0xc]
	ldr r0, _0222E788 @ =0x00010200
	movs r2, #0
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	movs r1, #4
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x6c
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	cmp r0, #0
	bne _0222E638
	movs r0, #0x22
	b _0222E63A
_0222E638:
	movs r0, #0x23
_0222E63A:
	str r4, [sp]
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222E788 @ =0x00010200
	movs r1, #4
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x87
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x2d
	str r0, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222E788 @ =0x00010200
	movs r1, #4
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	movs r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r2, #0
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x88
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x2c
	str r0, [sp, #4]
	movs r0, #0xa8
	str r0, [sp, #8]
	movs r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222E788 @ =0x00010200
	movs r2, #0
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	str r2, [sp, #0x1c]
	movs r1, #4
	adds r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	movs r0, #0x24
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222E788 @ =0x00010200
	movs r1, #4
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x86
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x2d
	str r0, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222E788 @ =0x00010200
	movs r1, #4
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	movs r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r2, #0
	adds r3, r5, #0
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x8a
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x2c
	str r0, [sp, #4]
	movs r0, #0xa8
	str r0, [sp, #8]
	movs r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222E788 @ =0x00010200
	movs r2, #0
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	movs r1, #4
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	ldr r0, [sp, #0x20]
	movs r1, #4
	bl ov43_0222DEF8
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222E788: .4byte 0x00010200
	thumb_func_end ov43_0222E5B4

	thumb_func_start ov43_0222E78C
ov43_0222E78C: @ 0x0222E78C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	str r3, [sp, #0x24]
	adds r4, r2, #0
	bl FUN_0203107C
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x24]
	movs r0, #0x80
	bl FUN_02026354
	adds r7, r0, #0
	ldr r1, [sp, #0x24]
	movs r0, #0x80
	bl FUN_02026354
	adds r6, r0, #0
	str r4, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, _0222E900 @ =0x00010200
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	movs r1, #5
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x28]
	movs r1, #0x7c
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	ldr r1, [sp, #0x24]
	bl FUN_0200BCDC
	str r0, [sp, #0x2c]
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E900 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	str r1, [sp, #0xc]
	ldr r0, [r0, #0x20]
	ldr r2, [sp, #0x2c]
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, [sp, #0x2c]
	bl FUN_02026380
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x28]
	movs r1, #0x6a
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	cmp r0, #0
	bne _0222E826
	movs r0, #0x22
	b _0222E828
_0222E826:
	movs r0, #0x23
_0222E828:
	str r4, [sp]
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222E900 @ =0x00010200
	movs r1, #5
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x28]
	movs r1, #0x7b
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x25
	str r0, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222E900 @ =0x00010200
	movs r1, #5
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	movs r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r2, #0
	adds r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	movs r0, #0x24
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222E900 @ =0x00010200
	movs r1, #5
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x28]
	movs r1, #0x7a
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x25
	str r0, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222E900 @ =0x00010200
	movs r1, #5
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	movs r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r2, #0
	adds r3, r5, #0
	bl ov43_0222EC58
	ldr r0, [sp, #0x20]
	movs r1, #5
	bl ov43_0222DEF8
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E900: .4byte 0x00010200
	thumb_func_end ov43_0222E78C

	thumb_func_start ov43_0222E904
ov43_0222E904: @ 0x0222E904
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	adds r6, r3, #0
	adds r4, r2, #0
	bl FUN_0203107C
	str r0, [sp, #0x24]
	movs r0, #0x80
	adds r1, r6, #0
	bl FUN_02026354
	adds r7, r0, #0
	movs r0, #0x80
	adds r1, r6, #0
	bl FUN_02026354
	adds r6, r0, #0
	str r4, [sp]
	movs r0, #0x21
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, _0222EA3C @ =0x00010200
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	movs r1, #6
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x6e
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	cmp r0, #0
	bne _0222E964
	movs r0, #0x22
	b _0222E966
_0222E964:
	movs r0, #0x23
_0222E966:
	str r4, [sp]
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, _0222EA3C @ =0x00010200
	movs r1, #6
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x8f
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x2e
	str r0, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, _0222EA3C @ =0x00010200
	movs r1, #6
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	movs r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r2, #0
	adds r3, r5, #0
	bl ov43_0222EC58
	str r4, [sp]
	movs r0, #0x24
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222EA3C @ =0x00010200
	movs r1, #6
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, [sp, #0x20]
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	ldr r0, [sp, #0x24]
	movs r1, #0x8e
	adds r2, r5, r2
	ldrb r2, [r2, #0x18]
	bl FUN_020310BC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x2e
	str r0, [sp, #4]
	movs r0, #0x70
	str r0, [sp, #8]
	movs r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222EA3C @ =0x00010200
	movs r1, #6
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	str r6, [sp, #0x18]
	movs r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r2, #0
	adds r3, r5, #0
	bl ov43_0222EC58
	ldr r0, [sp, #0x20]
	movs r1, #6
	bl ov43_0222DEF8
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222EA3C: .4byte 0x00010200
	thumb_func_end ov43_0222E904

	thumb_func_start ov43_0222EA40
ov43_0222EA40: @ 0x0222EA40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	adds r4, r2, #0
	adds r7, r3, #0
	bl FUN_0203107C
	ldr r0, [r5, #4]
	bl FUN_0202C6F4
	str r0, [sp, #0x24]
	movs r0, #0x80
	adds r1, r7, #0
	bl FUN_02026354
	adds r6, r0, #0
	movs r0, #0x80
	adds r1, r7, #0
	bl FUN_02026354
	adds r7, r0, #0
	str r4, [sp]
	movs r0, #0x2f
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, _0222EBD4 @ =0x00010200
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	movs r1, #1
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	adds r0, r4, #0
	movs r1, #0
	bl ov43_0222AC18
	str r4, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, _0222EBD4 @ =0x00010200
	movs r1, #1
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #0x24]
	movs r2, #0xa
	adds r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl FUN_0202C090
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x31
	str r0, [sp, #4]
	movs r0, #0x78
	str r0, [sp, #8]
	movs r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, _0222EBD4 @ =0x00010200
	movs r2, #0
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	movs r1, #1
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	adds r0, r4, #0
	movs r1, #1
	bl ov43_0222AC18
	str r4, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _0222EBD4 @ =0x00010200
	movs r1, #1
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	movs r2, #0xb
	ldrsb r1, [r5, r2]
	ldr r0, [sp, #0x24]
	adds r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl FUN_0202C090
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x31
	str r0, [sp, #4]
	movs r0, #0x78
	str r0, [sp, #8]
	movs r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, _0222EBD4 @ =0x00010200
	movs r2, #0
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	movs r1, #1
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	adds r0, r4, #0
	movs r1, #2
	bl ov43_0222AC18
	str r4, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222EBD4 @ =0x00010200
	movs r1, #1
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	ldr r0, [sp, #0x24]
	movs r2, #0xc
	adds r1, r5, r1
	ldrb r1, [r1, #0x18]
	bl FUN_0202C090
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov43_0222ABFC
	str r4, [sp]
	movs r0, #0x31
	str r0, [sp, #4]
	movs r0, #0x78
	str r0, [sp, #8]
	movs r0, #0x48
	str r0, [sp, #0xc]
	ldr r0, _0222EBD4 @ =0x00010200
	movs r2, #0
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	ldr r0, [sp, #0x20]
	movs r1, #1
	adds r3, r5, #0
	str r2, [sp, #0x1c]
	bl ov43_0222EC58
	ldr r0, [sp, #0x20]
	movs r1, #1
	bl ov43_0222DEF8
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222EBD4: .4byte 0x00010200
	thumb_func_end ov43_0222EA40

	thumb_func_start ov43_0222EBD8
ov43_0222EBD8: @ 0x0222EBD8
	push {r3, r4, r5, lr}
	sub sp, #0x20
	adds r3, r1, #0
	str r2, [sp]
	movs r1, #0xe
	str r1, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	ldr r1, _0222EC10 @ =0x00010200
	str r4, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r2, #0x7c]
	adds r2, #0x80
	str r1, [sp, #0x14]
	ldr r1, [r2]
	adds r5, r0, #0
	str r1, [sp, #0x18]
	movs r1, #7
	adds r2, r4, #0
	str r4, [sp, #0x1c]
	bl ov43_0222EC58
	adds r0, r5, #0
	movs r1, #7
	bl ov43_0222DEF8
	add sp, #0x20
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222EC10: .4byte 0x00010200
	thumb_func_end ov43_0222EBD8

	thumb_func_start ov43_0222EC14
ov43_0222EC14: @ 0x0222EC14
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #2
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bge _0222EC24
	rsbs r2, r2, #0
_0222EC24:
	movs r0, #0
	ldrsh r3, [r1, r0]
	cmp r3, #0
	bge _0222EC2E
	rsbs r3, r3, #0
_0222EC2E:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	lsls r3, r3, #0x18
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r4]
	movs r1, #3
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	ldr r0, [r4]
	movs r1, #3
	bl FUN_0201EFBC
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov43_0222EC14

	thumb_func_start ov43_0222EC58
ov43_0222EC58: @ 0x0222EC58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r6, [sp, #0x30]
	adds r7, r0, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	ldr r0, [r6, #0x54]
	ldr r1, [sp, #0x34]
	ldr r2, [sp, #0x48]
	ldr r4, [sp, #0x44]
	ldr r5, [sp, #0x38]
	bl FUN_0200BB6C
	ldr r0, [r6, #0x50]
	ldr r2, [sp, #0x48]
	adds r1, r4, #0
	bl FUN_0200CBBC
	ldr r0, [sp, #0x4c]
	cmp r0, #1
	beq _0222EC88
	cmp r0, #2
	beq _0222EC9A
	b _0222ECA6
_0222EC88:
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	bl FUN_02002F30
	adds r0, r0, #1
	lsrs r0, r0, #1
	subs r5, r5, r0
	b _0222ECA6
_0222EC9A:
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	bl FUN_02002F30
	subs r5, r5, r0
_0222ECA6:
	ldr r0, [sp, #0x3c]
	adds r2, r4, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	adds r3, r5, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r1, [r0, #0xc]
	ldr r0, [sp, #0x14]
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #1
	bl FUN_020200FC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov43_0222EC58

	thumb_func_start ov43_0222ECD4
ov43_0222ECD4: @ 0x0222ECD4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r2, #0
	adds r2, #0x80
	adds r5, r0, #0
	ldr r0, [r4, #0x54]
	ldr r2, [r2]
	adds r1, r3, #0
	bl FUN_0200BB6C
	adds r2, r4, #0
	adds r2, #0x80
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x7c]
	ldr r2, [r2]
	bl FUN_0200CBBC
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	movs r1, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x7c]
	adds r0, r5, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov43_0222ECD4

	thumb_func_start ov43_0222ED18
ov43_0222ED18: @ 0x0222ED18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	cmp r0, #1
	bne _0222ED26
	movs r2, #8
	b _0222ED28
_0222ED26:
	movs r2, #3
_0222ED28:
	cmp r1, #0
	ble _0222ED40
	movs r0, #0
	ldrsh r3, [r4, r0]
	strh r3, [r4, #2]
	ldrsh r0, [r4, r0]
	adds r0, r0, r1
	adds r1, r2, #0
	blx FUN_020F2998
	strh r1, [r4]
	pop {r4, pc}
_0222ED40:
	bge _0222ED58
	movs r0, #0
	ldrsh r3, [r4, r0]
	strh r3, [r4, #2]
	ldrsh r3, [r4, r0]
	adds r1, r3, r1
	strh r1, [r4]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _0222ED58
	adds r0, r0, r2
	strh r0, [r4]
_0222ED58:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov43_0222ED18

	.rodata

_0222ED5C:
	.byte 0x02, 0x02, 0x09, 0x02
	.byte 0x05, 0x1A, 0x0B, 0x01, 0x05, 0x1B, 0x02, 0x02, 0x05, 0x1A, 0x0B, 0x02, 0x05, 0x1A, 0x0B, 0x02
	.byte 0x05, 0x16, 0x0B, 0x00, 0x01, 0x00, 0xBB, 0x01, 0xBB, 0x01, 0xA0, 0xC0, 0x88, 0xF8, 0xFF, 0x00
	.byte 0x00, 0x00, 0x05, 0x05, 0x0B, 0x02, 0x05, 0x09, 0x1A, 0x05, 0x0D, 0x00, 0x0C, 0x00, 0x0A, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x00, 0x05, 0x06, 0x00, 0x00, 0x03, 0x04, 0x00, 0x00, 0x01, 0x0F, 0x00
	.byte 0x03, 0x04, 0x01, 0x0F, 0x00, 0x00, 0xC7, 0x00, 0xAC, 0x00, 0x88, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xF5, 0x01, 0x00, 0x00, 0xF5, 0x01, 0x00, 0x00, 0x00, 0x0E, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x08, 0x0C, 0x10, 0x14, 0x18, 0x1C, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x40, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x05, 0x10, 0x02, 0x02, 0x0C, 0x10, 0x02
	.byte 0x13, 0x05, 0x08, 0x05, 0x17, 0x0C, 0x04, 0x02, 0x0E, 0x0E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x00, 0x00, 0x00, 0x00, 0x20, 0x18, 0x20, 0x00
	.byte 0x00, 0x00, 0x20, 0x18, 0xE0, 0xFF, 0x00, 0x00, 0x20, 0x18, 0x22, 0x3E, 0x12, 0xEE, 0x4A, 0x66
	.byte 0x12, 0xEE, 0x72, 0x8E, 0x12, 0xEE, 0x9A, 0xB6, 0x12, 0xEE, 0xFF, 0x00, 0x00, 0x00, 0x02, 0x01
	.byte 0x0E, 0x02, 0x02, 0x04, 0x1A, 0x02, 0x02, 0x07, 0x1A, 0x04, 0x02, 0x0C, 0x1A, 0x02, 0x02, 0x0F
	.byte 0x1A, 0x04, 0x08, 0x28, 0xEC, 0x0C, 0x78, 0x98, 0xEC, 0x0C, 0xA0, 0xC0, 0x00, 0x70, 0xA0, 0xC0
	.byte 0x70, 0xE0, 0xA0, 0xC0, 0xE0, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x28, 0xEC, 0x0C, 0x78, 0x98, 0xEC, 0x0C, 0xA0, 0xC0, 0x00, 0x20
	.byte 0xA0, 0xC0, 0x20, 0x40, 0xA0, 0xC0, 0x40, 0x60, 0xA0, 0xC0, 0x60, 0x80, 0xA0, 0xC0, 0x80, 0xA0
	.byte 0xA0, 0xC0, 0xA0, 0xC0, 0xA0, 0xC0, 0xC0, 0xE0, 0xA0, 0xC0, 0xE0, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x3D, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x04, 0x19, 0x01, 0x06, 0x02, 0x0E, 0x01, 0x00, 0x04, 0x01, 0x00, 0x18, 0x03, 0x0E, 0x0D, 0x00
	.byte 0x04, 0x16, 0x06, 0x09, 0x02, 0x0E, 0x55, 0x00, 0x04, 0x09, 0x11, 0x08, 0x02, 0x0E, 0x73, 0x00
	.byte 0x04, 0x13, 0x15, 0x0B, 0x02, 0x0E, 0xA5, 0x00, 0x04, 0x04, 0x04, 0x0A, 0x0A, 0x0F, 0xBB, 0x00
	.byte 0x04, 0x01, 0x11, 0x06, 0x02, 0x0E, 0x67, 0x00, 0x04, 0x01, 0x15, 0x11, 0x02, 0x0E, 0x83, 0x00
	.byte 0x20, 0x40, 0x10, 0x80, 0x40, 0x60, 0x10, 0x80, 0x60, 0x80, 0x10, 0x80, 0x80, 0xA0, 0x10, 0x80
	.byte 0x20, 0x40, 0x80, 0xF0, 0x40, 0x60, 0x80, 0xF0, 0x60, 0x80, 0x80, 0xF0, 0x80, 0xA0, 0x80, 0xF0
	.byte 0xA0, 0xC0, 0x88, 0xF8, 0x58, 0x68, 0x00, 0x10, 0x58, 0x68, 0xF0, 0x00, 0x00, 0x20, 0x80, 0xA0
	.byte 0x00, 0x20, 0xA0, 0xC0, 0x00, 0x20, 0xC0, 0xE0, 0x00, 0x20, 0xE0, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x04, 0x00, 0x0F, 0x04, 0x02, 0x02, 0x09, 0x00, 0x02, 0x00, 0x08, 0x00, 0x0F, 0x04
	.byte 0x02, 0x02, 0x09, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x0F, 0x04, 0x02, 0x02, 0x09, 0x00, 0x02, 0x00
	.byte 0x10, 0x00, 0x0F, 0x04, 0x02, 0x02, 0x09, 0x00, 0x10, 0x00, 0x04, 0x00, 0x0F, 0x04, 0x02, 0x02
	.byte 0x09, 0x00, 0x10, 0x00, 0x08, 0x00, 0x0F, 0x04, 0x02, 0x02, 0x09, 0x00, 0x10, 0x00, 0x0C, 0x00
	.byte 0x0F, 0x04, 0x02, 0x02, 0x09, 0x00, 0x10, 0x00, 0x10, 0x00, 0x0F, 0x04, 0x02, 0x02, 0x09, 0x00
	.byte 0x11, 0x00, 0x14, 0x00, 0x0E, 0x04, 0x00, 0x01, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x18, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x19, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1A, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x1C, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x11, 0x00, 0x00, 0x18, 0x10, 0x00, 0x00, 0x00, 0x38, 0x3B, 0x00, 0x01, 0x02, 0x03, 0x05
	.byte 0x04, 0x01, 0x02, 0x05, 0x01, 0x01, 0x01, 0x01

	.data

_0222F0E0:
	.byte 0xB1, 0xDF, 0x22, 0x02, 0x41, 0xEA, 0x22, 0x02, 0xD9, 0xEB, 0x22, 0x02, 0x6D, 0xC4, 0x22, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0xB9, 0xC4, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x10, 0x00, 0x00, 0xF0, 0x0F, 0x00, 0x00, 0x00, 0x0C, 0x00, 0xE8, 0xED, 0x22, 0x02
	.byte 0x6F, 0xED, 0x22, 0x02, 0x82, 0xED, 0x22, 0x02, 0x2E, 0xEE, 0x22, 0x02, 0x5F, 0xED, 0x22, 0x02
	.byte 0x6B, 0xED, 0x22, 0x02, 0x67, 0xED, 0x22, 0x02, 0x63, 0xED, 0x22, 0x02, 0xB1, 0xDF, 0x22, 0x02
	.byte 0x41, 0xEA, 0x22, 0x02, 0xE9, 0xE0, 0x22, 0x02, 0x21, 0xE2, 0x22, 0x02, 0xB5, 0xE5, 0x22, 0x02
	.byte 0x8D, 0xE7, 0x22, 0x02, 0x05, 0xE9, 0x22, 0x02, 0xD9, 0xEB, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x20, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0F, 0x00, 0x00, 0x20, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x0222F1E0
