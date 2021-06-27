
	thumb_func_start ov118_0225F020
ov118_0225F020: @ 0x0225F020
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r4, r1, #0
	adds r6, r0, #0
	ldr r0, [r4]
	ldr r5, [r4, #0xc]
	cmp r0, #8
	bls _0225F032
	b _0225F218
_0225F032:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225F03E: @ jump table
	.2byte _0225F050 - _0225F03E - 2 @ case 0
	.2byte _0225F12C - _0225F03E - 2 @ case 1
	.2byte _0225F144 - _0225F03E - 2 @ case 2
	.2byte _0225F150 - _0225F03E - 2 @ case 3
	.2byte _0225F17E - _0225F03E - 2 @ case 4
	.2byte _0225F18E - _0225F03E - 2 @ case 5
	.2byte _0225F1CC - _0225F03E - 2 @ case 6
	.2byte _0225F1EA - _0225F03E - 2 @ case 7
	.2byte _0225F1FA - _0225F03E - 2 @ case 8
_0225F050:
	movs r0, #4
	movs r1, #0x20
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x20
	str r0, [r4, #0xc]
	blx FUN_020E5B44
	movs r0, #2
	movs r1, #1
	ldr r5, [r4, #0xc]
	bl FUN_02022C60
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0225F264 @ =0xFFFFE0FF
	ands r1, r0
	movs r0, #0x15
	lsls r0, r0, #8
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	ldr r0, [r0, #8]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	ldr r2, _0225F268 @ =_0225F270
	ldr r0, [r0, #8]
	movs r1, #1
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x10]
	movs r1, #1
	ldr r0, [r0, #8]
	bl FUN_0201CAE0
	ldr r0, [r4, #0x10]
	movs r1, #3
	ldr r0, [r0, #8]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	ldr r2, _0225F26C @ =0x0225F28C
	ldr r0, [r0, #8]
	movs r1, #3
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x10]
	movs r1, #3
	ldr r0, [r0, #8]
	bl FUN_0201CAE0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	movs r1, #0xa8
	ldr r0, [r0, #8]
	movs r2, #0xa7
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #3
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x20]
	movs r3, #0xa6
	bl FUN_021F0500
	movs r0, #2
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #8
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #1
	movs r1, #0
	bl FUN_0201C2D8
	ldr r0, [r4, #0x10]
	movs r1, #1
	ldr r0, [r0, #8]
	movs r2, #0
	movs r3, #0x80
	bl FUN_0201BC8C
	ldr r0, [r4, #0x10]
	movs r1, #3
	adds r3, r1, #0
	ldr r0, [r0, #8]
	movs r2, #0
	adds r3, #0xfd
	bl FUN_0201BC8C
	movs r0, #0x15
	bl FUN_02022C9C
	movs r0, #1
	str r0, [r4]
	b _0225F218
_0225F12C:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	adds r1, r0, #0
	subs r1, #0x11
	adds r2, r1, #0
	adds r3, r4, #4
	bl FUN_021EFCF8
	movs r0, #2
	str r0, [r4]
	b _0225F218
_0225F144:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0225F218
	movs r0, #3
	str r0, [r4]
	b _0225F218
_0225F150:
	movs r0, #0x12
	movs r1, #2
	movs r3, #5
	str r0, [sp]
	adds r0, r5, #0
	lsls r1, r1, #0x12
	movs r2, #0
	lsls r3, r3, #0xc
	bl FUN_021EFEC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	movs r0, #1
	str r0, [r5, #0x1c]
	movs r0, #4
	str r0, [r4]
	b _0225F218
_0225F17E:
	adds r0, r5, #0
	bl FUN_021EFF28
	cmp r0, #0
	beq _0225F218
	movs r0, #5
	str r0, [r4]
	b _0225F218
_0225F18E:
	ldr r0, [r4, #0x10]
	movs r2, #0
	ldr r0, [r0, #8]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201BC8C
	ldr r0, [r4, #0x10]
	movs r1, #3
	ldr r0, [r0, #8]
	movs r2, #0
	lsls r3, r1, #7
	bl FUN_0201BC8C
	movs r1, #0
	str r1, [r5, #0x1c]
	ldr r2, [r5, #0x18]
	adds r0, r2, #1
	str r0, [r5, #0x18]
	cmp r2, #5
	bls _0225F218
	movs r0, #1
	bl FUN_02022C60
	movs r0, #1
	str r0, [r5, #0x1c]
	movs r0, #0
	str r0, [r5, #0x18]
	movs r0, #6
	str r0, [r4]
	b _0225F218
_0225F1CC:
	movs r0, #0x12
	movs r2, #2
	movs r3, #5
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	lsls r2, r2, #0x12
	lsls r3, r3, #0xc
	bl FUN_021EFEC8
	movs r0, #1
	str r0, [r5, #0x1c]
	movs r0, #7
	str r0, [r4]
	b _0225F218
_0225F1EA:
	adds r0, r5, #0
	bl FUN_021EFF28
	cmp r0, #0
	beq _0225F218
	movs r0, #8
	str r0, [r4]
	b _0225F218
_0225F1FA:
	movs r0, #0
	str r0, [r5, #0x1c]
	bl FUN_0200FC20
	ldr r1, [r4, #0x14]
	cmp r1, #0
	beq _0225F20C
	movs r0, #1
	str r0, [r1]
_0225F20C:
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_021EFCDC
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
_0225F218:
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _0225F25E
	ldr r0, [r4, #0x10]
	ldr r3, [r5]
	ldr r0, [r0, #8]
	movs r1, #1
	movs r2, #0
	asrs r3, r3, #0xc
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #1
	ldr r0, [r0, #8]
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	ldr r3, [r5]
	movs r1, #3
	asrs r5, r3, #0xc
	lsls r3, r1, #7
	ldr r0, [r0, #8]
	movs r2, #0
	subs r3, r3, r5
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #3
	ldr r0, [r0, #8]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201F238
_0225F25E:
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0225F264: .4byte 0xFFFFE0FF
_0225F268: .4byte _0225F270
_0225F26C: .4byte 0x0225F28C
	thumb_func_end ov118_0225F020

	.rodata

_0225F270:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x02
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x0225F2A8
