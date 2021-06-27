
	thumb_func_start ov20_022598C0
ov20_022598C0: @ 0x022598C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r1, #0
	adds r2, r1, #0
	adds r5, r0, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #0x47
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x48
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x49
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	movs r1, #0x4b
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	eors r0, r6
	asrs r1, r4, #8
	muls r0, r7, r0
	eors r0, r1
	lsls r1, r4, #0x18
	lsrs r3, r1, #0x18
	lsls r0, r0, #0x10
	ldr r2, [sp, #4]
	ldr r1, [sp]
	lsrs r0, r0, #0x10
	eors r2, r1
	ldr r1, [sp, #8]
	muls r2, r1, r2
	adds r1, r3, #0
	eors r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #8
	adds r0, r0, r1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov20_022598C0

	thumb_func_start ov20_0225996C
ov20_0225996C: @ 0x0225996C
	push {r3, r4}
	ldr r3, _0225999C @ =0x02259C74
	movs r4, #1
	movs r2, #6
_02259974:
	adds r1, r4, #0
	muls r1, r2, r1
	adds r1, r3, r1
	ldrh r1, [r1, #4]
	cmp r0, r1
	bhs _0225998A
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4}
	bx lr
_0225998A:
	adds r1, r4, #1
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r4, #0xf
	blo _02259974
	adds r0, r4, #0
	pop {r3, r4}
	bx lr
	nop
_0225999C: .4byte 0x02259C74
	thumb_func_end ov20_0225996C

	thumb_func_start ov20_022599A0
ov20_022599A0: @ 0x022599A0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #4
	adds r5, r1, #0
	bl FUN_02091308
	adds r4, r0, #0
	movs r1, #0
	movs r2, #4
	bl FUN_02091334
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_02091410
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_020913C4
	adds r0, r4, #0
	bl FUN_02091320
	adds r0, r5, #0
	bl ov20_0225996C
	adds r4, r0, #0
	movs r1, #6
	muls r4, r1, r4
	ldr r0, _02259A10 @ =0x02259C78
	ldr r2, _02259A14 @ =0x02259C76
	ldrh r0, [r0, r4]
	ldrh r2, [r2, r4]
	asrs r1, r5, #0x1f
	movs r3, #0
	subs r0, r5, r0
	sbcs r1, r3
	blx FUN_020F2900
	adds r2, r0, #0
	adds r0, r6, #0
	ldr r6, _02259A18 @ =0x02259C74
	adds r3, r1, #0
	movs r5, #0
	ldrh r4, [r6, r4]
	adds r1, r5, #0
	adds r2, r4, r2
	adcs r5, r3
	adds r3, r5, #0
	blx FUN_020F2948
	movs r2, #0xa
	movs r3, #0
	blx FUN_020F2900
	pop {r4, r5, r6, pc}
	nop
_02259A10: .4byte 0x02259C78
_02259A14: .4byte 0x02259C76
_02259A18: .4byte 0x02259C74
	thumb_func_end ov20_022599A0

	thumb_func_start ov20_02259A1C
ov20_02259A1C: @ 0x02259A1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r1, #0
	movs r1, #0x10
	adds r7, r2, #0
	adds r4, r3, #0
	bl FUN_020402F0
	add r1, sp, #0x10
	adds r5, r0, #0
	ldrh r1, [r1, #0x10]
	adds r0, r4, #0
	bl ov20_022599A0
	movs r1, #0xfa
	lsls r1, r1, #2
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0xfe
	blx FUN_020F2BA4
	adds r0, r0, #5
	movs r1, #0xa
	blx FUN_020F2BA4
	movs r1, #0xa
	adds r4, r0, #0
	blx FUN_020F2BA4
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	adds r1, r6, #0
	movs r3, #3
	bl FUN_0200BFCC
	adds r0, r4, #0
	movs r1, #0xa
	blx FUN_020F2BA4
	movs r0, #0
	adds r2, r1, #0
	str r0, [sp]
	movs r3, #1
	str r3, [sp, #4]
	ldr r0, [r5]
	adds r1, r7, #0
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov20_02259A1C

	thumb_func_start ov20_02259A88
ov20_02259A88: @ 0x02259A88
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x80
	ldr r5, [r1]
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02040374
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_0203FE2C
	adds r4, #0x80
	adds r1, r0, #0
	ldr r0, [r4]
	bl FUN_020403AC
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_02074904
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #5
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r7, #0
	bl ov20_022598C0
	add r1, sp, #0
	strh r0, [r1, #2]
	ldrh r1, [r1, #2]
	adds r0, r4, #0
	bl ov20_022599A0
	adds r7, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_020503D0
	bl FUN_02066B50
	add r1, sp, #0
	strh r0, [r1]
	ldrh r1, [r1]
	adds r0, r4, #0
	bl ov20_022599A0
	adds r5, r0, #0
	movs r0, #0xfa
	lsls r0, r0, #2
	muls r0, r7, r0
	movs r1, #0xfe
	blx FUN_020F2BA4
	adds r0, r0, #5
	movs r1, #0xa
	blx FUN_020F2BA4
	adds r4, r0, #0
	movs r0, #0xfa
	lsls r0, r0, #2
	muls r0, r5, r0
	movs r1, #0xfe
	blx FUN_020F2BA4
	adds r0, r0, #5
	movs r1, #0xa
	blx FUN_020F2BA4
	cmp r4, r0
	bne _02259B2E
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02259B2E:
	cmp r4, r0
	bls _02259B36
	movs r0, #2
	b _02259B38
_02259B36:
	movs r0, #0
_02259B38:
	strh r0, [r6]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov20_02259A88

	thumb_func_start ov20_02259B40
ov20_02259B40: @ 0x02259B40
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x80
	ldr r4, [r1]
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_020403AC
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_02074904
	adds r1, r5, #0
	bl FUN_02074644
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_020503D0
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov20_022598C0
	adds r1, r0, #0
	lsls r1, r1, #0x10
	adds r0, r4, #0
	lsrs r1, r1, #0x10
	bl FUN_02066B60
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov20_02259B40

	thumb_func_start ov20_02259B88
ov20_02259B88: @ 0x02259B88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x80
	ldr r4, [r1]
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_020403AC
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_020403AC
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_020403AC
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_020503D0
	bl FUN_02066B50
	add r1, sp, #4
	strh r0, [r1]
	ldrh r0, [r1]
	lsls r1, r6, #0x18
	lsls r2, r7, #0x18
	str r0, [sp]
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	adds r3, r5, #0
	bl ov20_02259A1C
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov20_02259B88

	thumb_func_start ov20_02259BF4
ov20_02259BF4: @ 0x02259BF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x80
	ldr r4, [r1]
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_020403AC
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_020403AC
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_020403AC
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_02074904
	adds r1, r5, #0
	bl FUN_02074644
	str r0, [sp, #4]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	adds r5, r0, #0
	ldr r0, [sp, #4]
	bl ov20_022598C0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r6, #0x18
	lsls r2, r7, #0x18
	lsls r3, r5, #0x10
	str r0, [sp]
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x10
	bl ov20_02259A1C
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov20_02259BF4

	.rodata

_02259C74:
	.byte 0x22, 0x01, 0x01, 0x00, 0x00, 0x00, 0x2C, 0x01, 0x01, 0x00, 0x0A, 0x00
	.byte 0x90, 0x01, 0x02, 0x00, 0x6E, 0x00, 0xF4, 0x01, 0x04, 0x00, 0x36, 0x01, 0x58, 0x02, 0x14, 0x00
	.byte 0xC6, 0x02, 0xBC, 0x02, 0x32, 0x00, 0x96, 0x0A, 0x20, 0x03, 0x64, 0x00, 0x1E, 0x1E, 0x84, 0x03
	.byte 0x96, 0x00, 0x2E, 0x45, 0xE8, 0x03, 0x96, 0x00, 0xC6, 0x7F, 0x4C, 0x04, 0x64, 0x00, 0x5E, 0xBA
	.byte 0xB0, 0x04, 0x32, 0x00, 0x6E, 0xE1, 0x14, 0x05, 0x14, 0x00, 0xF6, 0xF4, 0x78, 0x05, 0x05, 0x00
	.byte 0xC6, 0xFC, 0xDC, 0x05, 0x02, 0x00, 0xBA, 0xFE, 0x40, 0x06, 0x01, 0x00, 0x82, 0xFF, 0xA4, 0x06
	.byte 0x01, 0x00, 0xE6, 0xFF
