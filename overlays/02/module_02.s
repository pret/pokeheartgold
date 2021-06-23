
	thumb_func_start ov02_02245B80
ov02_02245B80: @ 0x02245B80
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0205064C
	bl ov02_02245B9C
	adds r2, r0, #0
	ldr r1, _02245B98 @ =ov02_02245BC8
	adds r0, r4, #0
	bl FUN_02050530
	pop {r4, pc}
	.align 2, 0
_02245B98: .4byte ov02_02245BC8
	thumb_func_end ov02_02245B80

	thumb_func_start ov02_02245B9C
ov02_02245B9C: @ 0x02245B9C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #4
	movs r1, #0xd0
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02245BB4
	bl GF_AssertFail
	movs r0, #0
	pop {r3, r4, r5, pc}
_02245BB4:
	movs r1, #0
	movs r2, #0xd0
	blx FUN_020D4994
	str r5, [r4, #4]
	movs r0, #4
	str r0, [r4]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_02245B9C

	thumb_func_start ov02_02245BC8
ov02_02245BC8: @ 0x02245BC8
	push {r3, r4, lr}
	sub sp, #0xc
	bl FUN_02050650
	adds r4, r0, #0
	ldrh r1, [r4, #8]
	cmp r1, #4
	bls _02245BDA
	b _02245D06
_02245BDA:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02245BE6: @ jump table
	.2byte _02245BF0 - _02245BE6 - 2 @ case 0
	.2byte _02245C06 - _02245BE6 - 2 @ case 1
	.2byte _02245C98 - _02245BE6 - 2 @ case 2
	.2byte _02245CB0 - _02245BE6 - 2 @ case 3
	.2byte _02245CF2 - _02245BE6 - 2 @ case 4
_02245BF0:
	bl ov02_02245D18
	movs r1, #0
	adds r0, r4, #0
	strh r1, [r4, #0xa]
	adds r0, #0xcc
	str r1, [r0]
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	b _02245D06
_02245C06:
	adds r0, #0xcc
	ldr r0, [r0]
	cmp r0, #0xff
	beq _02245C68
	cmp r0, #0
	beq _02245C26
	cmp r0, #0x1e
	beq _02245C26
	cmp r0, #0x32
	beq _02245C26
	cmp r0, #0x3c
	beq _02245C26
	cmp r0, #0x46
	beq _02245C26
	cmp r0, #0x50
	bne _02245C5A
_02245C26:
	ldr r0, _02245D0C @ =0x0000088B
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0xcc
	ldr r0, [r0]
	cmp r0, #0x32
	bne _02245C3C
	ldr r0, _02245D10 @ =0x0000088C
	bl FUN_0200604C
_02245C3C:
	adds r0, r4, #0
	adds r0, #0xcc
	ldr r0, [r0]
	cmp r0, #0x3c
	blt _02245C5A
	movs r1, #0xa
	blx FUN_020F2998
	adds r1, r0, #0
	subs r1, r1, #5
	lsls r1, r1, #0x16
	ldr r0, _02245D0C @ =0x0000088B
	asrs r1, r1, #0x10
	bl FUN_02006134
_02245C5A:
	adds r0, r4, #0
	adds r0, #0xcc
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xcc
	str r1, [r0]
_02245C68:
	adds r0, r4, #0
	bl ov02_02245DE0
	ldrh r1, [r4, #0xa]
	adds r0, r1, #1
	strh r0, [r4, #0xa]
	cmp r1, #0x5a
	blo _02245D06
	movs r0, #0x18
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r1, #0
	str r0, [sp, #8]
	ldr r3, _02245D14 @ =0x00007FFF
	movs r0, #3
	adds r2, r1, #0
	bl FUN_0200FA24
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	b _02245D06
_02245C98:
	bl ov02_02245DE0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02245D06
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	b _02245D06
_02245CB0:
	ldrh r2, [r4, #0xa]
	adds r1, r2, #1
	strh r1, [r4, #0xa]
	cmp r2, #0x3c
	blo _02245D06
	bl ov02_02245DB0
	ldr r0, [r4, #4]
	adds r0, #0x50
	bl FUN_021EA284
	ldr r0, [r4, #4]
	movs r1, #4
	ldr r0, [r0, #0x48]
	bl FUN_021EA220
	ldr r1, [r4, #4]
	ldr r3, _02245D14 @ =0x00007FFF
	str r0, [r1, #0x50]
	movs r0, #0x12
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #3
	bl FUN_0200FA24
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	b _02245D06
_02245CF2:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02245D06
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_02245D06:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_02245D0C: .4byte 0x0000088B
_02245D10: .4byte 0x0000088C
_02245D14: .4byte 0x00007FFF
	thumb_func_end ov02_02245BC8

	thumb_func_start ov02_02245D18
ov02_02245D18: @ 0x02245D18
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4]
	adds r0, #0xbc
	movs r2, #0x20
	bl FUN_0201AC14
	adds r0, r4, #0
	ldr r3, [r4]
	adds r0, #0xc
	movs r1, #0xae
	movs r2, #0
	bl FUN_021FBCD8
	ldr r0, [r4]
	adds r1, r4, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0xbc
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x1c
	adds r1, #0xc
	movs r2, #0xae
	movs r3, #1
	bl FUN_021FBE44
	ldr r0, [r4]
	adds r1, r4, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0xbc
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, #0xc
	movs r2, #0xae
	movs r3, #2
	bl FUN_021FBE44
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x44
	adds r1, #0xc
	bl FUN_021FBF2C
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x44
	adds r1, #0x1c
	bl FUN_021FBF50
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x44
	adds r1, #0x30
	bl FUN_021FBF50
	adds r0, r4, #0
	movs r1, #0x22
	movs r3, #0xa
	adds r0, #0x44
	lsls r1, r1, #0xe
	movs r2, #0
	lsls r3, r3, #0x10
	bl FUN_021FC00C
	adds r4, #0x44
	adds r0, r4, #0
	movs r1, #1
	bl FUN_021FC004
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02245D18

	thumb_func_start ov02_02245DB0
ov02_02245DB0: @ 0x02245DB0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x44
	movs r1, #0
	bl FUN_021FC004
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x30
	adds r1, #0xbc
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x1c
	adds r1, #0xbc
	bl FUN_021FBE80
	adds r4, #0xc
	adds r0, r4, #0
	bl FUN_021FBDA8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02245DB0

	thumb_func_start ov02_02245DE0
ov02_02245DE0: @ 0x02245DE0
	push {r4, lr}
	movs r1, #1
	adds r4, r0, #0
	adds r0, #0x1c
	lsls r1, r1, #0xc
	bl FUN_021FBEAC
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x30
	lsls r1, r1, #0xc
	bl FUN_021FBEAC
	adds r4, #0x44
	adds r0, r4, #0
	bl FUN_021FBF68
	pop {r4, pc}
	thumb_func_end ov02_02245DE0

	thumb_func_start ov02_02245E04
ov02_02245E04: @ 0x02245E04
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #0xa4
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0xa4
	blx FUN_020D4994
	adds r0, r4, #0
	adds r0, #0xa0
	str r6, [r0]
	adds r0, r4, #0
	adds r0, #0x8c
	adds r1, r6, #0
	movs r2, #0x20
	bl FUN_0201AC14
	ldrh r1, [r5]
	ldrb r2, [r5, #2]
	adds r0, r4, #0
	adds r3, r6, #0
	bl FUN_021FBCD8
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r4, #0
	bl FUN_021FBF2C
	ldrh r1, [r5]
	ldrb r3, [r5, #3]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	bl ov02_02245ED8
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #1
	bl FUN_021FC004
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x9e
	strh r1, [r0]
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_02245E04

	thumb_func_start ov02_02245E68
ov02_02245E68: @ 0x02245E68
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x10
	movs r1, #0
	bl FUN_021FC004
	adds r0, r5, #0
	adds r0, #0x9c
	ldrb r0, [r0]
	movs r6, #0
	cmp r0, #0
	ble _02245EB8
	adds r0, r5, #0
	adds r7, r5, #0
	str r0, [sp]
	adds r0, #0x8c
	adds r4, r6, #0
	adds r7, #0x10
	str r0, [sp]
_02245E8E:
	adds r1, r5, #0
	adds r1, #0x88
	ldr r1, [r1]
	adds r0, r7, #0
	adds r1, r1, r4
	bl FUN_021FBF5C
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	ldr r1, [sp]
	adds r0, r0, r4
	bl FUN_021FBE80
	adds r0, r5, #0
	adds r0, #0x9c
	ldrb r0, [r0]
	adds r6, r6, #1
	adds r4, #0x14
	cmp r6, r0
	blt _02245E8E
_02245EB8:
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x9c
	strb r1, [r0]
	adds r0, r5, #0
	bl FUN_021FBDA8
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02245E68

	thumb_func_start ov02_02245ED8
ov02_02245ED8: @ 0x02245ED8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	str r3, [sp, #0xc]
	adds r0, #0x9c
	ldrb r0, [r0]
	adds r7, r2, #0
	str r1, [sp, #8]
	cmp r0, #0
	beq _02245F38
	movs r6, #0
	cmp r0, #0
	ble _02245F2E
	adds r0, r5, #0
	str r0, [sp, #0x10]
	adds r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r5, #0
	str r0, [sp, #0x14]
	adds r0, #0x8c
	adds r4, r6, #0
	str r0, [sp, #0x14]
_02245F04:
	adds r1, r5, #0
	adds r1, #0x88
	ldr r1, [r1]
	ldr r0, [sp, #0x10]
	adds r1, r1, r4
	bl FUN_021FBF5C
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	ldr r1, [sp, #0x14]
	adds r0, r0, r4
	bl FUN_021FBE80
	adds r0, r5, #0
	adds r0, #0x9c
	ldrb r0, [r0]
	adds r6, r6, #1
	adds r4, #0x14
	cmp r6, r0
	blt _02245F04
_02245F2E:
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	bl FUN_0201AB0C
_02245F38:
	adds r1, r5, #0
	ldr r0, [sp, #0xc]
	adds r1, #0x9c
	strb r0, [r1]
	adds r1, r5, #0
	adds r1, #0x9c
	adds r0, r5, #0
	ldrb r2, [r1]
	adds r0, #0xa0
	movs r1, #0x14
	ldr r0, [r0]
	muls r1, r2, r1
	bl FUN_0201AA8C
	adds r1, r5, #0
	adds r1, #0x88
	str r0, [r1]
	adds r2, r5, #0
	adds r2, #0x9c
	adds r0, r5, #0
	ldrb r3, [r2]
	adds r0, #0x88
	movs r2, #0x14
	ldr r0, [r0]
	movs r1, #0
	muls r2, r3, r2
	blx FUN_020D4994
	adds r0, r5, #0
	adds r0, #0x9c
	ldrb r0, [r0]
	movs r6, #0
	cmp r0, #0
	ble _02245FCA
	adds r0, r5, #0
	str r0, [sp, #0x18]
	adds r0, #0x8c
	str r0, [sp, #0x18]
	adds r0, r5, #0
	str r0, [sp, #0x1c]
	adds r0, #0x10
	adds r4, r6, #0
	str r0, [sp, #0x1c]
_02245F8E:
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r2, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0x18]
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	ldrh r3, [r7]
	adds r0, r0, r4
	bl FUN_021FBE44
	adds r1, r5, #0
	adds r1, #0x88
	ldr r1, [r1]
	ldr r0, [sp, #0x1c]
	adds r1, r1, r4
	bl FUN_021FBF50
	adds r0, r5, #0
	adds r0, #0x9c
	ldrb r0, [r0]
	adds r6, r6, #1
	adds r7, r7, #2
	adds r4, #0x14
	cmp r6, r0
	blt _02245F8E
_02245FCA:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02245ED8

	thumb_func_start ov02_02245FD0
ov02_02245FD0: @ 0x02245FD0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x9c
	ldrb r0, [r0]
	movs r7, #0
	adds r6, r7, #0
	cmp r0, #0
	ble _0224602E
	adds r4, r7, #0
_02245FE2:
	adds r0, r5, #0
	adds r0, #0x9e
	ldrh r0, [r0]
	cmp r0, #0
	beq _02245FFE
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0224600C
_02245FFE:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0224600C:
	blx FUN_020F2104
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	adds r0, r0, r4
	bl FUN_021FBEE4
	adds r7, r7, r0
	adds r0, r5, #0
	adds r0, #0x9c
	ldrb r0, [r0]
	adds r6, r6, #1
	adds r4, #0x14
	cmp r6, r0
	blt _02245FE2
_0224602E:
	adds r0, r5, #0
	adds r0, #0x10
	bl FUN_021FBF68
	adds r5, #0x9c
	ldrb r0, [r5]
	cmp r7, r0
	bne _02246042
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02246042:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02245FD0

	thumb_func_start ov02_02246048
ov02_02246048: @ 0x02246048
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x9c
	ldrb r0, [r0]
	movs r4, #0
	cmp r0, #0
	ble _022460A2
	movs r7, #0x3f
	adds r6, r4, #0
	lsls r7, r7, #0x18
_0224605C:
	adds r0, r5, #0
	adds r0, #0x9e
	ldrh r0, [r0]
	cmp r0, #0
	beq _02246076
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F1520
	b _02246082
_02246076:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r7, #0
	blx FUN_020F24C8
_02246082:
	blx FUN_020F2104
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	adds r0, r0, r6
	bl FUN_021FBEAC
	adds r0, r5, #0
	adds r0, #0x9c
	ldrb r0, [r0]
	adds r4, r4, #1
	adds r6, #0x14
	cmp r4, r0
	blt _0224605C
_022460A2:
	adds r5, #0x10
	adds r0, r5, #0
	bl FUN_021FBF68
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02246048

	thumb_func_start ov02_022460AC
ov02_022460AC: @ 0x022460AC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	bl FUN_0205064C
	adds r1, r4, #0
	bl ov02_022460CC
	adds r2, r0, #0
	ldr r1, _022460C8 @ =ov02_022460FC
	adds r0, r5, #0
	bl FUN_02050530
	pop {r3, r4, r5, pc}
	.align 2, 0
_022460C8: .4byte ov02_022460FC
	thumb_func_end ov02_022460AC

	thumb_func_start ov02_022460CC
ov02_022460CC: @ 0x022460CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #4
	movs r1, #0x14
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _022460E6
	bl GF_AssertFail
	movs r0, #0
	pop {r4, r5, r6, pc}
_022460E6:
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	str r5, [r4, #4]
	strh r6, [r4, #0x10]
	movs r0, #4
	str r0, [r4]
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_022460CC

	thumb_func_start ov02_022460FC
ov02_022460FC: @ 0x022460FC
	push {r3, r4, lr}
	sub sp, #0xc
	bl FUN_02050650
	adds r4, r0, #0
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	beq _02246116
	cmp r0, #1
	beq _02246158
	cmp r0, #2
	beq _0224616A
	b _0224617C
_02246116:
	ldrh r1, [r4, #0x10]
	movs r0, #0xc
	ldr r2, _02246184 @ =0x02253264
	muls r0, r1, r0
	ldr r1, [r4]
	adds r0, r2, r0
	bl ov02_02245E04
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	add r1, sp, #0
	ldr r0, [r0, #0x40]
	bl FUN_0205C6AC
	ldr r0, [r4, #8]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, #0x10
	bl FUN_021FC00C
	ldrh r1, [r4, #0x10]
	movs r0, #0xc
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, _02246188 @ =0x0225326C
	ldrh r0, [r0, r2]
	bl FUN_0200604C
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0224617C
_02246158:
	ldr r0, [r4, #8]
	bl ov02_02245FD0
	cmp r0, #0
	beq _0224617C
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0224617C
_0224616A:
	ldr r0, [r4, #8]
	bl ov02_02245E68
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_0224617C:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02246184: .4byte 0x02253264
_02246188: .4byte 0x0225326C
	thumb_func_end ov02_022460FC

	thumb_func_start ov02_0224618C
ov02_0224618C: @ 0x0224618C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	bl FUN_0205064C
	adds r1, r4, #0
	bl ov02_022461AC
	adds r2, r0, #0
	ldr r1, _022461A8 @ =ov02_022461DC
	adds r0, r5, #0
	bl FUN_02050530
	pop {r3, r4, r5, pc}
	.align 2, 0
_022461A8: .4byte ov02_022461DC
	thumb_func_end ov02_0224618C

	thumb_func_start ov02_022461AC
ov02_022461AC: @ 0x022461AC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #4
	movs r1, #0x18
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _022461C6
	bl GF_AssertFail
	movs r0, #0
	pop {r4, r5, r6, pc}
_022461C6:
	movs r1, #0
	movs r2, #0x18
	blx FUN_020D4994
	str r5, [r4, #4]
	strb r6, [r4, #0x10]
	movs r0, #4
	str r0, [r4]
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_022461AC

	thumb_func_start ov02_022461DC
ov02_022461DC: @ 0x022461DC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldrh r0, [r4, #0x12]
	cmp r0, #4
	bhi _022462C0
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022461FA: @ jump table
	.2byte _02246204 - _022461FA - 2 @ case 0
	.2byte _0224623A - _022461FA - 2 @ case 1
	.2byte _02246276 - _022461FA - 2 @ case 2
	.2byte _02246282 - _022461FA - 2 @ case 3
	.2byte _022462A4 - _022461FA - 2 @ case 4
_02246204:
	ldrb r0, [r4, #0x10]
	ldr r1, _022462C8 @ =0x02253254
	lsls r0, r0, #3
	adds r0, r1, r0
	ldr r1, [r4]
	bl ov02_02245E04
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	add r1, sp, #0
	ldr r0, [r0, #0x40]
	bl FUN_0205C6AC
	ldr r0, [r4, #8]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, #0x10
	bl FUN_021FC00C
	ldr r0, _022462CC @ =0x0000090F
	bl FUN_0200604C
	ldrh r0, [r4, #0x12]
	adds r0, r0, #1
	strh r0, [r4, #0x12]
	b _022462C0
_0224623A:
	ldr r0, [r4, #8]
	bl ov02_02245FD0
	cmp r0, #0
	beq _022462C0
	ldrb r2, [r4, #0x10]
	ldr r0, [r4, #8]
	movs r1, #0xae
	lsls r3, r2, #3
	ldr r2, _022462D0 @ =0x02253D80
	ldr r2, [r2, r3]
	movs r3, #3
	bl ov02_02245ED8
	ldr r0, _022462D4 @ =ov02_022462DC
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	movs r2, #0
	str r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0203FED4
	ldrh r0, [r4, #0x12]
	adds r0, r0, #1
	strh r0, [r4, #0x12]
	b _022462C0
_02246276:
	ldr r0, [r4, #0xc]
	bl FUN_0200E390
	ldrh r0, [r4, #0x12]
	adds r0, r0, #1
	strh r0, [r4, #0x12]
_02246282:
	ldr r0, [r4, #8]
	bl ov02_02245FD0
	cmp r0, #0
	beq _022462C0
	ldrb r2, [r4, #0x10]
	ldr r0, [r4, #8]
	movs r1, #0xae
	lsls r3, r2, #3
	ldr r2, _022462D8 @ =0x02253D84
	ldr r2, [r2, r3]
	movs r3, #3
	bl ov02_02245ED8
	ldrh r0, [r4, #0x12]
	adds r0, r0, #1
	strh r0, [r4, #0x12]
_022462A4:
	ldr r0, [r4, #8]
	bl ov02_02245FD0
	cmp r0, #0
	beq _022462C0
	ldr r0, [r4, #8]
	bl ov02_02245E68
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_022462C0:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_022462C8: .4byte 0x02253254
_022462CC: .4byte 0x0000090F
_022462D0: .4byte 0x02253D80
_022462D4: .4byte ov02_022462DC
_022462D8: .4byte 0x02253D84
	thumb_func_end ov02_022461DC

	thumb_func_start ov02_022462DC
ov02_022462DC: @ 0x022462DC
	ldr r3, _022462E4 @ =ov02_02246048
	ldr r0, [r1, #8]
	bx r3
	nop
_022462E4: .4byte ov02_02246048
	thumb_func_end ov02_022462DC

	thumb_func_start ov02_022462E8
ov02_022462E8: @ 0x022462E8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0205064C
	bl ov02_02246304
	adds r2, r0, #0
	ldr r1, _02246300 @ =ov02_02246330
	adds r0, r4, #0
	bl FUN_02050530
	pop {r4, pc}
	.align 2, 0
_02246300: .4byte ov02_02246330
	thumb_func_end ov02_022462E8

	thumb_func_start ov02_02246304
ov02_02246304: @ 0x02246304
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #4
	movs r1, #0x10
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _0224631C
	bl GF_AssertFail
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224631C:
	movs r1, #0
	movs r2, #0x10
	blx FUN_020D4994
	str r5, [r4, #4]
	movs r0, #4
	str r0, [r4]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_02246304

	thumb_func_start ov02_02246330
ov02_02246330: @ 0x02246330
	push {r4, lr}
	bl FUN_02050650
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _02246348
	cmp r1, #1
	beq _0224635A
	cmp r1, #2
	beq _02246374
	b _0224638E
_02246348:
	bl ov02_02246398
	ldr r0, _02246394 @ =0x0000087D
	bl FUN_0200604C
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0224638E
_0224635A:
	bl ov02_02246490
	cmp r0, #0
	beq _0224638E
	ldrb r1, [r4, #0xc]
	adds r0, r1, #1
	strb r0, [r4, #0xc]
	cmp r1, #1
	blo _0224638E
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0224638E
_02246374:
	ldr r0, _02246394 @ =0x0000087D
	bl FUN_02006184
	cmp r0, #0
	bne _0224638E
	adds r0, r4, #0
	bl ov02_02246444
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r4, pc}
_0224638E:
	movs r0, #0
	pop {r4, pc}
	nop
_02246394: .4byte 0x0000087D
	thumb_func_end ov02_02246330

	thumb_func_start ov02_02246398
ov02_02246398: @ 0x02246398
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	strb r0, [r5, #0xd]
	ldrb r3, [r5, #0xd]
	movs r0, #0x1f
	movs r1, #2
	subs r0, r0, r3
	str r0, [sp]
	ldr r0, _02246440 @ =0x04000050
	movs r2, #5
	blx FUN_020CF15C
	ldr r1, [r5]
	movs r0, #0xae
	bl FUN_02007688
	movs r1, #0x20
	str r1, [sp]
	ldr r1, [r5]
	movs r2, #0
	str r1, [sp, #4]
	movs r1, #0xc
	adds r3, r2, #0
	adds r4, r0, #0
	bl FUN_02007B8C
	movs r1, #0
	str r1, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5]
	movs r1, #0xd
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	ldr r2, [r2, #8]
	movs r3, #1
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0xe
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	ldr r2, [r2, #8]
	movs r3, #1
	bl FUN_02007B68
	ldr r0, [r5, #4]
	movs r1, #0
	ldr r0, [r0, #8]
	bl FUN_0201CC2C
	strb r0, [r5, #0xe]
	ldr r0, [r5, #4]
	movs r1, #1
	ldr r0, [r0, #8]
	bl FUN_0201CC2C
	strb r0, [r5, #0xf]
	movs r0, #0
	movs r1, #1
	bl FUN_0201BB68
	movs r0, #1
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_02246440: .4byte 0x04000050
	thumb_func_end ov02_02246398

	thumb_func_start ov02_02246444
ov02_02246444: @ 0x02246444
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	ldrb r1, [r4, #0xe]
	movs r0, #0
	bl FUN_0201BB68
	ldrb r1, [r4, #0xf]
	movs r0, #1
	bl FUN_0201BB68
	ldr r0, [r4, #4]
	movs r1, #1
	ldr r0, [r0, #8]
	bl FUN_0201CAE0
	ldr r3, [r4]
	movs r0, #1
	movs r1, #0x40
	movs r2, #0
	bl FUN_0201C1C4
	movs r1, #0
	ldr r0, _0224648C @ =0x04000050
	adds r2, r1, #0
	movs r3, #0x1f
	str r1, [sp]
	blx FUN_020CF15C
	add sp, #4
	pop {r3, r4, pc}
	nop
_0224648C: .4byte 0x04000050
	thumb_func_end ov02_02246444

	thumb_func_start ov02_02246490
ov02_02246490: @ 0x02246490
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _022464A2
	cmp r0, #1
	beq _022464B2
	b _022464F4
_022464A2:
	movs r0, #0
	strb r0, [r4, #0xb]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #9]
	adds r0, r0, #1
	strb r0, [r4, #9]
	b _02246502
_022464B2:
	ldrb r1, [r4, #0xb]
	adds r0, r1, #1
	strb r0, [r4, #0xb]
	cmp r1, #0
	bne _02246502
	ldrb r3, [r4, #0xd]
	movs r0, #0x1f
	movs r1, #2
	subs r0, r0, r3
	str r0, [sp]
	ldr r0, _02246508 @ =0x04000050
	movs r2, #5
	blx FUN_020CF15C
	ldrb r1, [r4, #0xa]
	adds r0, r1, #1
	strb r0, [r4, #0xa]
	cmp r1, #0xc
	ldrb r0, [r4, #0xd]
	bhs _022464DE
	adds r0, r0, #1
	b _022464E0
_022464DE:
	subs r0, r0, #1
_022464E0:
	strb r0, [r4, #0xd]
	movs r0, #0
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xa]
	cmp r0, #0x18
	bls _02246502
	ldrb r0, [r4, #9]
	adds r0, r0, #1
	strb r0, [r4, #9]
	b _02246502
_022464F4:
	movs r0, #0
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xb]
	strb r0, [r4, #9]
	add sp, #4
	movs r0, #1
	pop {r3, r4, pc}
_02246502:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02246508: .4byte 0x04000050
	thumb_func_end ov02_02246490

	thumb_func_start ov02_0224650C
ov02_0224650C: @ 0x0224650C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #0x38
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x38
	blx FUN_020D4994
	str r6, [r4]
	adds r0, r6, #0
	str r5, [r4, #4]
	bl FUN_02023114
	str r0, [r4, #0x18]
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_0224650C

	thumb_func_start ov02_02246534
ov02_02246534: @ 0x02246534
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	bl FUN_02023120
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02246534

	thumb_func_start ov02_02246548
ov02_02246548: @ 0x02246548
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r1, #0
	ble _02246568
	lsls r0, r1, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02246576
_02246568:
	lsls r0, r1, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02246576:
	blx FUN_020F2104
	strh r0, [r5, #8]
	cmp r4, #0
	ble _02246592
	lsls r0, r4, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022465A0
_02246592:
	lsls r0, r4, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022465A0:
	blx FUN_020F2104
	strh r0, [r5, #0xa]
	strh r6, [r5, #0xe]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	strh r0, [r5, #0x12]
	movs r0, #0
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #0x12]
	cmp r0, #0
	beq _022465CA
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022465D8
_022465CA:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022465D8:
	blx FUN_020F2104
	adds r1, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #0xe
	blx FUN_020CCBA0
	str r0, [r5, #0x14]
	ldr r0, [r5, #4]
	ldr r1, [r5, #0x18]
	ldr r0, [r0, #0x24]
	bl FUN_02023128
	ldr r1, [r5, #0x18]
	add r0, sp, #0
	bl FUN_02023630
	add r4, sp, #0
	adds r3, r5, #0
	adds r3, #0x20
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r4]
	adds r4, r2, #0
	str r0, [r3]
	adds r3, r5, #0
	ldm r4!, {r0, r1}
	adds r3, #0x2c
	stm r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	ldr r1, [r5, #0x18]
	adds r0, r2, #0
	bl FUN_02023214
	ldr r0, [r5, #0x18]
	bl FUN_0202313C
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_02246548

	thumb_func_start ov02_0224662C
ov02_0224662C: @ 0x0224662C
	movs r1, #0
	strh r1, [r0, #0x10]
	ldr r0, [r0, #4]
	ldr r3, _02246638 @ =FUN_0202313C
	ldr r0, [r0, #0x24]
	bx r3
	.align 2, 0
_02246638: .4byte FUN_0202313C
	thumb_func_end ov02_0224662C

	thumb_func_start ov02_0224663C
ov02_0224663C: @ 0x0224663C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r2, [r5, #0x10]
	adds r0, #0x10
	adds r1, r2, #1
	strh r1, [r5, #0x10]
	cmp r2, #0
	ldrh r2, [r5, #0x10]
	beq _02246666
	ldrh r1, [r0]
	adds r1, r1, #1
	strh r1, [r0]
	lsls r0, r2, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0224667A
_02246666:
	ldrh r1, [r0]
	adds r1, r1, #1
	strh r1, [r0]
	lsls r0, r2, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0224667A:
	blx FUN_020F2104
	adds r2, r0, #0
	ldr r0, [r5, #0x14]
	asrs r3, r2, #0x1f
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r0, r0, r2
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	bl FUN_0201FD14
	movs r2, #8
	ldrsh r2, [r5, r2]
	adds r4, r0, #0
	asrs r6, r4, #0x1f
	adds r1, r6, #0
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	adds r2, r0, #0
	movs r0, #2
	adds r3, r1, #0
	movs r7, #0
	lsls r0, r0, #0xa
	adds r0, r2, r0
	adcs r3, r7
	ldr r1, [r5, #0x2c]
	lsls r2, r3, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r2
	adds r0, r1, r0
	str r0, [r5, #0x20]
	movs r2, #0xa
	ldrsh r2, [r5, r2]
	adds r0, r4, #0
	adds r1, r6, #0
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r4, #2
	adds r3, r7, #0
	lsls r4, r4, #0xa
	adds r4, r0, r4
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r4, #0xc
	ldr r2, [r5, #0x30]
	orrs r1, r0
	adds r0, r2, r1
	str r0, [r5, #0x24]
	ldrh r1, [r5, #0x10]
	ldrh r0, [r5, #0x12]
	cmp r1, r0
	bhs _022466F8
	adds r0, r3, #0
	pop {r3, r4, r5, r6, r7, pc}
_022466F8:
	ldr r0, [r5, #0x2c]
	str r0, [r5, #0x20]
	ldr r0, [r5, #0x30]
	str r0, [r5, #0x24]
	strh r3, [r5, #0x10]
	ldrh r0, [r5, #0xe]
	subs r0, r0, #1
	strh r0, [r5, #0xe]
	ldrh r0, [r5, #0xe]
	cmp r0, #0
	bne _02246710
	movs r3, #1
_02246710:
	adds r0, r3, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224663C

	thumb_func_start ov02_02246714
ov02_02246714: @ 0x02246714
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0205064C
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	adds r2, r6, #0
	adds r3, r7, #0
	str r1, [sp]
	adds r1, r4, #0
	bl ov02_02246744
	adds r2, r0, #0
	ldr r1, _02246740 @ =ov02_02246798
	adds r0, r5, #0
	bl FUN_02050530
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02246740: .4byte ov02_02246798
	thumb_func_end ov02_02246714

	thumb_func_start ov02_02246744
ov02_02246744: @ 0x02246744
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #4
	movs r1, #0xc
	adds r7, r2, #0
	str r3, [sp, #4]
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02246766
	bl GF_AssertFail
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246766:
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	str r5, [r4, #4]
	movs r1, #4
	str r1, [r4]
	ldr r0, [r4, #4]
	bl ov02_0224650C
	str r0, [r4, #8]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	lsls r1, r6, #0x10
	lsls r2, r7, #0x10
	str r0, [sp]
	ldr r0, [r4, #8]
	ldr r3, [sp, #4]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov02_02246548
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02246744

	thumb_func_start ov02_02246798
ov02_02246798: @ 0x02246798
	push {r4, lr}
	bl FUN_02050650
	adds r4, r0, #0
	ldr r0, [r4, #8]
	bl ov02_0224663C
	cmp r0, #0
	bne _022467AE
	movs r0, #0
	pop {r4, pc}
_022467AE:
	ldr r0, [r4, #8]
	bl ov02_0224662C
	ldr r0, [r4, #8]
	bl ov02_02246534
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov02_02246798

	thumb_func_start ov02_022467C4
ov02_022467C4: @ 0x022467C4
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	bl FUN_0205064C
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	bl ov02_022467E8
	adds r2, r0, #0
	ldr r1, _022467E4 @ =ov02_02246818
	adds r0, r4, #0
	bl FUN_02050530
	pop {r3, r4, r5, pc}
	nop
_022467E4: .4byte ov02_02246818
	thumb_func_end ov02_022467C4

	thumb_func_start ov02_022467E8
ov02_022467E8: @ 0x022467E8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #4
	movs r1, #0x1c
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02246802
	bl GF_AssertFail
	movs r0, #0
	pop {r4, r5, r6, pc}
_02246802:
	movs r1, #0
	movs r2, #0x1c
	blx FUN_020D4994
	str r5, [r4, #4]
	strb r6, [r4, #0x19]
	movs r0, #4
	str r0, [r4]
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_022467E8

	thumb_func_start ov02_02246818
ov02_02246818: @ 0x02246818
	push {r4, lr}
	bl FUN_02050650
	adds r4, r0, #0
	ldrb r1, [r4, #0x18]
	cmp r1, #0
	beq _0224682C
	cmp r1, #1
	beq _0224683E
	b _02246862
_0224682C:
	bl ov02_0224686C
	ldr r0, _02246868 @ =0x000005DC
	bl FUN_0200604C
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	b _02246862
_0224683E:
	bl ov02_022469A0
	cmp r0, #0
	beq _02246862
	ldr r0, _02246868 @ =0x000005DC
	bl FUN_0200604C
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	adds r0, r4, #0
	bl ov02_02246964
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r4, pc}
_02246862:
	movs r0, #0
	pop {r4, pc}
	nop
_02246868: .4byte 0x000005DC
	thumb_func_end ov02_02246818

	thumb_func_start ov02_0224686C
ov02_0224686C: @ 0x0224686C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0xae
	bl FUN_02007688
	movs r1, #0x20
	str r1, [sp]
	ldr r1, [r5]
	movs r2, #0
	str r1, [sp, #4]
	movs r1, #0xf
	adds r3, r2, #0
	adds r4, r0, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0x10
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	ldr r2, [r2, #8]
	movs r3, #1
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0x11
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	ldr r2, [r2, #8]
	movs r3, #1
	bl FUN_02007B68
	ldr r0, [r5, #4]
	movs r1, #1
	ldr r0, [r0, #8]
	bl FUN_0201CC2C
	strb r0, [r5, #0x1a]
	movs r0, #1
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	adds r0, r4, #0
	bl FUN_0200770C
	ldr r0, [r5, #4]
	adds r1, r5, #0
	ldr r0, [r0, #8]
	ldr r2, _0224695C @ =0x0225324C
	adds r1, #8
	bl FUN_0201D4F8
	adds r0, r5, #0
	adds r0, #8
	movs r1, #9
	bl FUN_0201D978
	ldr r3, [r5]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xc6
	bl FUN_0200BAF8
	ldrb r1, [r5, #0x19]
	adds r4, r0, #0
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #3
	adds r1, r7, #0
	movs r2, #0
	bl FUN_02002F30
	lsls r0, r0, #0x18
	movs r1, #0
	lsrs r6, r0, #0x18
	movs r3, #0x70
	subs r6, r3, r6
	lsrs r3, r6, #0x1f
	adds r3, r6, r3
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02246960 @ =0x000F0E09
	adds r2, r7, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	str r1, [sp, #0xc]
	adds r0, #8
	movs r1, #3
	asrs r3, r3, #1
	bl FUN_020200FC
	adds r5, #8
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0200BB44
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224695C: .4byte 0x0225324C
_02246960: .4byte 0x000F0E09
	thumb_func_end ov02_0224686C

	thumb_func_start ov02_02246964
ov02_02246964: @ 0x02246964
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	ldrb r1, [r4, #0x1a]
	movs r0, #1
	bl FUN_0201BB68
	adds r0, r4, #0
	adds r0, #8
	bl FUN_0201D8E4
	adds r0, r4, #0
	adds r0, #8
	bl FUN_0201D520
	ldr r0, [r4, #4]
	movs r1, #1
	ldr r0, [r0, #8]
	bl FUN_0201CAE0
	movs r0, #1
	ldr r3, [r4]
	lsls r1, r0, #0xc
	movs r2, #0
	bl FUN_0201C1C4
	pop {r4, pc}
	thumb_func_end ov02_02246964

	thumb_func_start ov02_022469A0
ov02_022469A0: @ 0x022469A0
	ldr r0, _022469B0 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r1, r0
	bne _022469AC
	movs r0, #0
_022469AC:
	bx lr
	nop
_022469B0: .4byte 0x021D110C
	thumb_func_end ov02_022469A0

	thumb_func_start ov02_022469B4
ov02_022469B4: @ 0x022469B4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r6, r2, #0
	adds r5, r0, #0
	bl FUN_0205064C
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov02_022469D8
	adds r2, r0, #0
	ldr r1, _022469D4 @ =ov02_02246A34
	adds r0, r5, #0
	bl FUN_02050530
	pop {r4, r5, r6, pc}
	.align 2, 0
_022469D4: .4byte ov02_02246A34
	thumb_func_end ov02_022469B4

	thumb_func_start ov02_022469D8
ov02_022469D8: @ 0x022469D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #4
	movs r1, #0x1c
	adds r7, r2, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _022469F8
	bl GF_AssertFail
	add sp, #0x10
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022469F8:
	movs r1, #0
	movs r2, #0x1c
	blx FUN_020D4994
	str r5, [r4, #8]
	str r6, [r4, #0x10]
	str r7, [r4, #0x14]
	movs r0, #4
	str r0, [r4]
	bl FUN_0206DD2C
	str r0, [r4, #0xc]
	bl FUN_0206DCE4
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0xc]
	movs r1, #0x95
	movs r2, #0x64
	movs r3, #0x20
	bl FUN_0206DE38
	adds r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_022469D8

	thumb_func_start ov02_02246A34
ov02_02246A34: @ 0x02246A34
	push {r4, lr}
	bl FUN_02050650
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02246A48
	cmp r0, #1
	beq _02246A5E
	b _02246A7E
_02246A48:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0x14]
	bl ov02_022494C4
	str r0, [r4, #0x18]
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _02246A7E
_02246A5E:
	ldr r0, [r4, #0x18]
	bl ov02_0224953C
	cmp r0, #0
	beq _02246A7E
	ldr r0, [r4, #0x18]
	bl ov02_02249548
	ldr r0, [r4, #0xc]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r4, pc}
_02246A7E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02246A34

	thumb_func_start ov02_02246A84
ov02_02246A84: @ 0x02246A84
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0201481C
	cmp r0, #0
	bne _02246A98
	adds r3, r5, #0
	adds r3, #0x14
	b _02246AB8
_02246A98:
	subs r1, r0, #1
	cmp r1, #1
	bhi _02246AA4
	adds r3, r5, #0
	adds r3, #0x2c
	b _02246AB8
_02246AA4:
	subs r0, r0, #3
	cmp r0, #1
	bhi _02246AB0
	adds r3, r5, #0
	adds r3, #0x44
	b _02246AB8
_02246AB0:
	bl GF_AssertFail
	adds r3, r5, #0
	adds r3, #0x14
_02246AB8:
	movs r2, #0
_02246ABA:
	ldrh r0, [r3]
	adds r1, r5, r2
	adds r2, r2, #1
	str r0, [r4]
	ldrb r0, [r1, #8]
	adds r3, r3, #2
	strh r0, [r4, #4]
	ldrb r0, [r1, #8]
	strh r0, [r4, #6]
	adds r4, #8
	cmp r2, #0xc
	blt _02246ABA
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02246A84

	thumb_func_start ov02_02246AD4
ov02_02246AD4: @ 0x02246AD4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_0201481C
	subs r0, r0, #3
	cmp r0, #1
	bhi _02246AFC
	cmp r4, #1
	bne _02246AF2
	adds r5, #0xc0
	ldrh r0, [r5]
	str r0, [r6, #0x18]
	pop {r4, r5, r6, pc}
_02246AF2:
	cmp r4, #2
	bne _02246AFC
	adds r5, #0xc0
	ldrh r0, [r5]
	str r0, [r6, #8]
_02246AFC:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_02246AD4

	thumb_func_start ov02_02246B00
ov02_02246B00: @ 0x02246B00
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	bl ov02_022522B4
	cmp r0, #3
	bne _02246B2E
	adds r0, r5, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	str r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	str r0, [r4, #0x18]
	adds r0, r5, #0
	adds r0, #0x5e
	ldrh r0, [r0]
	adds r5, #0x5e
	str r0, [r4, #0x20]
	ldrh r0, [r5]
	str r0, [r4, #0x28]
	pop {r3, r4, r5, pc}
_02246B2E:
	bl ov02_022522B4
	cmp r0, #4
	bne _02246B54
	adds r0, r5, #0
	adds r0, #0x60
	ldrh r0, [r0]
	str r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x60
	ldrh r0, [r0]
	str r0, [r4, #0x18]
	adds r0, r5, #0
	adds r0, #0x62
	ldrh r0, [r0]
	adds r5, #0x62
	str r0, [r4, #0x20]
	ldrh r0, [r5]
	str r0, [r4, #0x28]
_02246B54:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_02246B00

	thumb_func_start ov02_02246B58
ov02_02246B58: @ 0x02246B58
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0202D9C4
	str r0, [sp]
	bl FUN_0202D9E0
	cmp r0, #0
	beq _02246B9A
	ldr r0, [sp]
	movs r1, #2
	bl FUN_0202D9A8
	ldr r1, [r5, #0x20]
	movs r2, #0
	ldr r1, [r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FUN_02097F6C
	cmp r0, #0
	beq _02246B9A
	adds r0, r4, #0
	adds r0, #0xbc
	ldrh r0, [r0]
	adds r4, #0xbc
	str r0, [r6]
	ldrh r0, [r4]
	str r0, [r7]
_02246B9A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02246B58

	thumb_func_start ov02_02246B9C
ov02_02246B9C: @ 0x02246B9C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_0202D9C4
	adds r7, r0, #0
	bl FUN_0202D9E0
	cmp r0, #0
	beq _02246BD4
	adds r0, r7, #0
	movs r1, #2
	bl FUN_0202D9A8
	ldr r1, [r5, #0x20]
	movs r2, #1
	ldr r1, [r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FUN_02097F6C
	cmp r0, #0
	beq _02246BD4
	adds r4, #0xbe
	ldrh r0, [r4]
	str r0, [r6]
_02246BD4:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02246B9C

	thumb_func_start ov02_02246BD8
ov02_02246BD8: @ 0x02246BD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	adds r7, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	bl FUN_0202D9C4
	str r0, [sp]
	bl FUN_0202D9E0
	cmp r0, #0
	beq _02246C7A
	ldr r0, [sp]
	movs r1, #2
	bl FUN_0202D9A8
	ldr r1, [r6, #0x20]
	movs r2, #2
	ldr r1, [r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FUN_02097F6C
	cmp r0, #0
	beq _02246C7A
	ldr r0, _02246C80 @ =0x02253290
	add r2, sp, #0x20
	ldr r0, [r0]
	ldr r6, _02246C84 @ =0x02253294
	str r0, [sp, #8]
	ldm r6!, {r0, r1}
	str r2, [sp, #4]
	stm r2!, {r0, r1}
	ldr r0, [r6]
	add r6, sp, #0xc
	str r0, [r2]
	ldr r2, _02246C88 @ =0x022532A0
	mov ip, r6
	ldm r2!, {r0, r1}
	stm r6!, {r0, r1}
	ldm r2!, {r0, r1}
	stm r6!, {r0, r1}
	ldr r0, [r2]
	add r3, sp, #8
	str r0, [r6]
	cmp r7, #0
	beq _02246C44
	cmp r7, #1
	beq _02246C48
	cmp r7, #2
	beq _02246C4E
	b _02246C54
_02246C44:
	movs r1, #1
	b _02246C5C
_02246C48:
	movs r1, #3
	ldr r3, [sp, #4]
	b _02246C5C
_02246C4E:
	movs r1, #5
	mov r3, ip
	b _02246C5C
_02246C54:
	bl GF_AssertFail
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02246C5C:
	movs r2, #0
	cmp r1, #0
	bls _02246C7A
_02246C62:
	adds r0, r5, #0
	adds r0, #0xc2
	lsls r6, r2, #2
	ldr r6, [r3, r6]
	ldrh r0, [r0]
	lsls r6, r6, #3
	str r0, [r4, r6]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r1
	blo _02246C62
_02246C7A:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02246C80: .4byte 0x02253290
_02246C84: .4byte 0x02253294
_02246C88: .4byte 0x022532A0
	thumb_func_end ov02_02246BD8

	thumb_func_start ov02_02246C8C
ov02_02246C8C: @ 0x02246C8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xa0
	adds r5, r0, #0
	adds r0, #0x7e
	ldrh r0, [r0]
	cmp r0, #3
	bhi _02246CA0
	add sp, #0xa0
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246CA0:
	ldr r0, [r5, #0x40]
	bl FUN_0205C67C
	adds r4, r0, #0
	ldr r0, [r5, #0x40]
	bl FUN_0205C688
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02054918
	adds r7, r0, #0
	add r2, sp, #0x18
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, #1
	bl ov02_0224762C
	add r1, sp, #0x18
	strb r0, [r1]
	ldrb r0, [r1]
	cmp r0, #0
	bne _02246CD6
	add sp, #0xa0
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246CD6:
	adds r0, r5, #0
	bl ov02_02248698
	ldr r0, [r5, #0xc]
	bl FUN_02074904
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_0203B8B8
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl FUN_02074644
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	adds r2, r4, #0
	add r3, sp, #0x24
	bl ov02_02248618
	ldr r0, [r5, #0xc]
	bl FUN_0202D9C4
	bl FUN_0202DB08
	cmp r0, #0
	bne _02246D26
	adds r0, r6, #0
	bl FUN_02054388
	movs r1, #1
	str r1, [sp, #0x28]
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	add r1, sp, #0x18
	strb r0, [r1, #0x18]
_02246D26:
	ldr r0, [r5, #0xc]
	bl FUN_0203B9C4
	bl FUN_0203B984
	adds r3, r0, #0
	ldr r0, [sp, #0x10]
	add r1, sp, #0x18
	str r0, [sp]
	ldrb r1, [r1]
	movs r0, #0
	add r2, sp, #0x24
	bl ov02_02248190
	add r1, sp, #0x18
	strb r0, [r1]
	adds r0, r5, #0
	add r1, sp, #0x18
	bl ov02_0224782C
	ldr r0, [sp, #0x10]
	add r1, sp, #0x18
	bl ov02_02247800
	add r1, sp, #0x18
	ldrb r1, [r1]
	adds r0, r5, #0
	adds r2, r7, #0
	bl ov02_02247568
	cmp r0, #0
	beq _02246D6A
	movs r7, #1
	b _02246D6C
_02246D6A:
	movs r7, #0
_02246D6C:
	cmp r7, #0
	bne _02246D76
	add sp, #0xa0
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246D76:
	ldr r0, [r5, #0xc]
	bl FUN_020503D0
	bl FUN_02066644
	cmp r0, #0
	beq _02246D88
	movs r6, #1
	b _02246D8A
_02246D88:
	movs r6, #0
_02246D8A:
	cmp r6, #0
	bne _02246DE0
	adds r0, r5, #0
	add r1, sp, #0x1c
	bl ov02_02248360
	cmp r0, #0
	beq _02246DE0
	ldr r0, [sp, #0x1c]
	movs r1, #6
	bl FUN_0202DA6C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r1, sp, #0x24
	bl ov02_02248290
	cmp r0, #0
	bne _02246DDA
	movs r0, #0xb
	adds r1, r0, #0
	adds r1, #0xf5
	bl FUN_020518D8
	str r0, [sp, #0x20]
	adds r1, r5, #0
	bl FUN_02051F00
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	bl ov02_022482BC
	ldr r1, [sp, #0x20]
	adds r0, r5, #0
	bl FUN_02050B08
	add sp, #0xa0
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02246DDA:
	add sp, #0xa0
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246DE0:
	ldr r0, [r5, #0xc]
	bl FUN_020503D0
	str r0, [sp, #0x14]
	bl FUN_02066860
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	bl FUN_02066870
	str r0, [sp, #8]
	cmp r6, #0
	bne _02246E18
	ldr r0, [sp, #0xc]
	movs r1, #0
	cmp r0, #0
	beq _02246E06
	movs r1, #1
	b _02246E0E
_02246E06:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02246E0E
	movs r1, #2
_02246E0E:
	adds r0, r5, #0
	add r2, sp, #0x20
	bl ov02_02248244
	b _02246E22
_02246E18:
	movs r0, #0xb
	movs r1, #0x4a
	bl FUN_020518D8
	str r0, [sp, #0x20]
_02246E22:
	ldr r0, [sp, #0x20]
	adds r1, r5, #0
	bl FUN_02051F00
	add r0, sp, #0x18
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _02246ECA
	adds r0, r4, #0
	add r1, sp, #0x40
	bl ov02_02246A84
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #0x40
	add r3, sp, #0x48
	bl ov02_02246B58
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #0x40
	bl ov02_02246B00
	cmp r6, #0
	bne _02246EA0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02246E70
	add r0, sp, #0x40
	str r0, [sp]
	add r0, sp, #0x24
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x20]
	adds r0, r5, #0
	adds r3, r4, #0
	bl ov02_02247444
	b _02246F26
_02246E70:
	ldr r0, [sp, #8]
	cmp r0, #0
	add r0, sp, #0x40
	beq _02246E8C
	str r0, [sp]
	add r0, sp, #0x24
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x20]
	adds r0, r5, #0
	adds r3, r4, #0
	bl ov02_02247460
	b _02246F26
_02246E8C:
	str r0, [sp]
	add r0, sp, #0x24
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x20]
	adds r0, r5, #0
	adds r3, r4, #0
	bl ov02_02247424
	b _02246F26
_02246EA0:
	ldr r0, [r5, #0xc]
	bl FUN_020503D0
	bl FUN_02066AD0
	ldr r1, [sp, #0x20]
	movs r2, #0xb
	str r0, [r1, #0x20]
	ldr r0, [sp, #0x20]
	ldr r1, [r5, #0xc]
	bl FUN_020733C0
	add r0, sp, #0x24
	str r0, [sp]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x20]
	adds r0, r5, #0
	add r3, sp, #0x40
	bl ov02_0224749C
	b _02246F26
_02246ECA:
	cmp r0, #1
	bne _02246F16
	movs r0, #0
	adds r1, r4, #0
	add r2, sp, #0x40
_02246ED4:
	adds r3, r1, #0
	adds r3, #0x66
	ldrh r3, [r3]
	adds r0, r0, #1
	str r3, [r2]
	adds r3, r1, #0
	adds r3, #0x65
	ldrb r3, [r3]
	strh r3, [r2, #4]
	adds r3, r1, #0
	adds r3, #0x64
	ldrb r3, [r3]
	adds r1, r1, #4
	strh r3, [r2, #6]
	adds r2, #8
	cmp r0, #5
	blt _02246ED4
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #0x40
	bl ov02_02246B9C
	add r0, sp, #0x24
	str r0, [sp]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	str r0, [sp, #4]
	ldr r2, [sp, #0x20]
	adds r0, r5, #0
	add r3, sp, #0x40
	bl ov02_022474E0
	b _02246F26
_02246F16:
	bl GF_AssertFail
	ldr r0, [sp, #0x20]
	bl FUN_02051BF8
	add sp, #0xa0
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246F26:
	cmp r0, #0
	beq _02246F40
	ldr r1, [sp, #0x20]
	adds r0, r5, #0
	bl FUN_02050B08
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x7e
	strh r1, [r0]
	adds r5, #0x7c
	strh r1, [r5]
	b _02246F42
_02246F40:
	movs r7, #0
_02246F42:
	movs r0, #4
	bl FUN_0201AC84
	cmp r0, #0
	bne _02246F50
	bl GF_AssertFail
_02246F50:
	movs r0, #0xb
	bl FUN_0201AC84
	cmp r0, #0
	bne _02246F5E
	bl GF_AssertFail
_02246F5E:
	cmp r7, #0
	bne _02246F68
	ldr r0, [sp, #0x20]
	bl FUN_02051BF8
_02246F68:
	adds r0, r7, #0
	add sp, #0xa0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02246C8C

	thumb_func_start ov02_02246F70
ov02_02246F70: @ 0x02246F70
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xa0
	str r0, [sp, #0x20]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	bl ov02_0224802C
	adds r4, r0, #0
	bne _02246F88
	add sp, #0xa0
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246F88:
	ldr r0, [sp, #0x20]
	ldr r0, [r0, #0xc]
	bl FUN_02074904
	movs r1, #0
	bl FUN_02074644
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	movs r2, #0
	add r3, sp, #0x24
	bl ov02_02248618
	ldr r0, [sp, #0x20]
	ldr r0, [r0, #0xc]
	bl FUN_0203B9C4
	bl FUN_0203B984
	adds r3, r0, #0
	ldr r0, [sp, #0x1c]
	adds r1, r4, #0
	str r0, [sp]
	movs r0, #1
	add r2, sp, #0x24
	bl ov02_02248190
	adds r4, r0, #0
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	blt _02246FDA
	add sp, #0xa0
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246FDA:
	ldr r0, [sp, #0x20]
	ldr r0, [r0, #0xc]
	bl FUN_020503D0
	bl FUN_02066860
	str r0, [sp, #0x18]
	cmp r0, #0
	beq _02246FF8
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x10]
	movs r1, #1
	bl ov02_02248244
	b _02247002
_02246FF8:
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x10]
	movs r1, #0
	bl ov02_02248244
_02247002:
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x20]
	ldr r0, [r0]
	bl FUN_02051F00
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	bl FUN_02052544
	ldr r0, [sp, #0x20]
	bl FUN_0203B8B8
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0224702C
	cmp r0, #1
	beq _02247032
	cmp r0, #2
	beq _02247038
	b _0224703C
_0224702C:
	ldr r7, [sp, #0x14]
	adds r7, #0x80
	b _0224703C
_02247032:
	ldr r7, [sp, #0x14]
	adds r7, #0x94
	b _0224703C
_02247038:
	ldr r7, [sp, #0x14]
	adds r7, #0xa8
_0224703C:
	movs r6, #0
_0224703E:
	lsls r4, r6, #2
	adds r5, r7, r4
	ldrh r1, [r5, #2]
	lsls r2, r6, #3
	add r0, sp, #0x40
	adds r3, r0, r2
	str r1, [r0, r2]
	ldrb r0, [r5, #1]
	strh r0, [r3, #4]
	ldrb r0, [r7, r4]
	strh r0, [r3, #6]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #5
	blo _0224703E
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0xc]
	add r2, sp, #0x40
	bl ov02_02246AD4
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x14]
	add r3, sp, #0x40
	bl ov02_02246BD8
	add r0, sp, #0x24
	str r0, [sp]
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	ldr r2, [r2]
	add r3, sp, #0x40
	bl ov02_02247514
	cmp r0, #0
	beq _02247098
	add sp, #0xa0
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02247098:
	movs r0, #0
	add sp, #0xa0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02246F70

	thumb_func_start ov02_022470A0
ov02_022470A0: @ 0x022470A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x8c
	str r0, [sp, #0xc]
	str r1, [sp, #4]
	bl ov02_022480B4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bne _022470B8
	add sp, #0x8c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_022470B8:
	ldr r0, [sp, #0xc]
	ldr r0, [r0, #0xc]
	bl FUN_02074904
	movs r1, #0
	bl FUN_02074644
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	movs r2, #0
	add r3, sp, #0x10
	bl ov02_02248618
	ldr r0, [sp, #0xc]
	ldr r0, [r0, #0xc]
	bl FUN_0203B9C4
	bl FUN_0203B984
	adds r3, r0, #0
	ldr r0, [sp, #8]
	adds r1, r4, #0
	str r0, [sp]
	movs r0, #0
	add r2, sp, #0x10
	bl ov02_02248190
	adds r4, r0, #0
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	cmp r1, r4
	blt _02247106
	add sp, #0x8c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_02247106:
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #4]
	movs r1, #0
	bl ov02_02248244
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r0, [r0]
	bl FUN_02051F00
	ldr r0, [sp, #0xc]
	bl FUN_0203B8B8
	adds r5, r0, #0
	adds r5, #0x78
	movs r6, #0
_02247126:
	lsls r3, r6, #2
	adds r4, r5, r3
	ldrh r1, [r4, #2]
	lsls r7, r6, #3
	add r0, sp, #0x2c
	adds r2, r0, r7
	str r1, [r0, r7]
	ldrb r0, [r4, #1]
	strh r0, [r2, #4]
	ldrb r0, [r5, r3]
	strh r0, [r2, #6]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	blo _02247126
	add r0, sp, #0x10
	str r0, [sp]
	ldr r2, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	ldr r2, [r2]
	add r3, sp, #0x2c
	bl ov02_0224754C
	cmp r0, #0
	bne _0224716A
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl FUN_02051BF8
	add sp, #0x8c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0224716A:
	movs r0, #1
	add sp, #0x8c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_022470A0

	thumb_func_start ov02_02247170
ov02_02247170: @ 0x02247170
	push {r4, r5, r6, r7, lr}
	sub sp, #0x9c
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	str r1, [sp, #8]
	bl FUN_020503D0
	adds r7, r0, #0
	ldr r0, [r5, #0x40]
	bl FUN_0205C67C
	adds r4, r0, #0
	ldr r0, [r5, #0x40]
	bl FUN_0205C688
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02054918
	adds r1, r0, #0
	adds r0, r5, #0
	add r2, sp, #0x14
	bl ov02_0224762C
	cmp r0, #0
	bne _022471AC
	add sp, #0x9c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_022471AC:
	ldr r0, [r5, #0xc]
	bl FUN_02074904
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_0203B8B8
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl FUN_02074644
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	adds r2, r4, #0
	add r3, sp, #0x20
	bl ov02_02248618
	movs r0, #1
	str r0, [sp, #0x28]
	adds r0, r7, #0
	bl FUN_02066644
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _0224721A
	adds r0, r5, #0
	add r1, sp, #0x18
	bl ov02_02248360
	cmp r0, #0
	beq _0224721A
	movs r0, #0xb
	adds r1, r0, #0
	adds r1, #0xf5
	bl FUN_020518D8
	str r0, [sp, #0x1c]
	adds r1, r5, #0
	bl FUN_02051F00
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	bl ov02_022482BC
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x1c]
	adds r0, r5, #0
	bl FUN_02050B90
	add sp, #0x9c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0224721A:
	adds r0, r7, #0
	bl FUN_02066860
	adds r6, r0, #0
	adds r0, r7, #0
	bl FUN_02066870
	adds r7, r0, #0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0224724A
	movs r1, #0
	cmp r6, #0
	beq _0224723A
	movs r1, #1
	b _02247240
_0224723A:
	cmp r7, #0
	beq _02247240
	movs r1, #2
_02247240:
	adds r0, r5, #0
	add r2, sp, #0x1c
	bl ov02_02248244
	b _02247254
_0224724A:
	movs r0, #0xb
	movs r1, #0x4a
	bl FUN_020518D8
	str r0, [sp, #0x1c]
_02247254:
	ldr r0, [sp, #0x1c]
	adds r1, r5, #0
	bl FUN_02051F00
	add r0, sp, #0x14
	ldrb r0, [r0]
	cmp r0, #0
	bne _022472F8
	adds r0, r4, #0
	add r1, sp, #0x3c
	bl ov02_02246A84
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #0x3c
	add r3, sp, #0x44
	bl ov02_02246B58
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #0x3c
	bl ov02_02246B00
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _022472CE
	cmp r6, #0
	add r0, sp, #0x3c
	beq _022472A2
	str r0, [sp]
	add r0, sp, #0x20
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	adds r0, r5, #0
	adds r3, r4, #0
	bl ov02_02247444
	b _0224734C
_022472A2:
	cmp r7, #0
	beq _022472BA
	str r0, [sp]
	add r0, sp, #0x20
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	adds r0, r5, #0
	adds r3, r4, #0
	bl ov02_02247460
	b _0224734C
_022472BA:
	str r0, [sp]
	add r0, sp, #0x20
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	adds r0, r5, #0
	adds r3, r4, #0
	bl ov02_02247424
	b _0224734C
_022472CE:
	ldr r0, [r5, #0xc]
	bl FUN_020503D0
	bl FUN_02066AD0
	ldr r1, [sp, #0x1c]
	movs r2, #0xb
	str r0, [r1, #0x20]
	ldr r0, [sp, #0x1c]
	ldr r1, [r5, #0xc]
	bl FUN_020733C0
	add r0, sp, #0x20
	str r0, [sp]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	adds r0, r5, #0
	add r3, sp, #0x3c
	bl ov02_0224749C
	b _0224734C
_022472F8:
	cmp r0, #1
	bne _02247342
	movs r0, #0
	adds r1, r4, #0
	add r2, sp, #0x3c
_02247302:
	adds r3, r1, #0
	adds r3, #0x66
	ldrh r3, [r3]
	adds r0, r0, #1
	str r3, [r2]
	adds r3, r1, #0
	adds r3, #0x65
	ldrb r3, [r3]
	strh r3, [r2, #4]
	adds r3, r1, #0
	adds r3, #0x64
	ldrb r3, [r3]
	adds r1, r1, #4
	strh r3, [r2, #6]
	adds r2, #8
	cmp r0, #5
	blt _02247302
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #0x3c
	bl ov02_02246B9C
	add r0, sp, #0x20
	str r0, [sp]
	str r6, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	adds r0, r5, #0
	add r3, sp, #0x3c
	bl ov02_022474E0
	b _0224734C
_02247342:
	bl GF_AssertFail
	add sp, #0x9c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0224734C:
	cmp r0, #0
	beq _0224735C
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x1c]
	adds r0, r5, #0
	bl FUN_02050B90
	b _02247360
_0224735C:
	bl GF_AssertFail
_02247360:
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x7e
	strh r1, [r0]
	adds r5, #0x7c
	strh r1, [r5]
	movs r0, #1
	add sp, #0x9c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02247170

	thumb_func_start ov02_02247374
ov02_02247374: @ 0x02247374
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xa8
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	str r1, [sp, #0xc]
	adds r4, r2, #0
	bl FUN_02074904
	movs r1, #0
	bl FUN_02074644
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	movs r2, #0
	add r3, sp, #0x2c
	bl ov02_02248618
	ldr r2, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #0
	bl ov02_02248244
	ldr r0, [sp, #0xc]
	adds r1, r5, #0
	ldr r0, [r0]
	bl FUN_02051F00
	movs r5, #0
	add r0, sp, #0x14
_022473B0:
	lsls r3, r5, #2
	ldrh r6, [r4, r3]
	adds r1, r0, r3
	adds r2, r4, r3
	strh r6, [r1, #2]
	ldrb r6, [r2, #3]
	strb r6, [r1, #1]
	ldrb r1, [r2, #2]
	strb r1, [r0, r3]
	adds r1, r5, #1
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r5, #6
	blo _022473B0
	movs r6, #0
	add r4, sp, #0x14
	add r7, sp, #0x48
_022473D2:
	lsls r3, r6, #2
	adds r5, r4, r3
	ldrh r0, [r5, #2]
	lsls r1, r6, #3
	adds r2, r7, r1
	str r0, [r7, r1]
	ldrb r0, [r5, #1]
	strh r0, [r2, #4]
	ldrb r0, [r4, r3]
	strh r0, [r2, #6]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #6
	blo _022473D2
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	movs r1, #0xff
	ldr r0, [r0]
	add r2, sp, #0x2c
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	adds r3, r7, #0
	bl ov02_02247B64
	cmp r0, #0
	bne _0224741C
	ldr r0, [sp, #0xc]
	ldr r0, [r0]
	bl FUN_02051BF8
	add sp, #0xa8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224741C:
	movs r0, #1
	add sp, #0xa8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02247374

	thumb_func_start ov02_02247424
ov02_02247424: @ 0x02247424
	push {lr}
	sub sp, #0xc
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r2, [sp, #8]
	adds r0, r1, #0
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x10]
	movs r1, #0xff
	bl ov02_02247B64
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov02_02247424

	thumb_func_start ov02_02247444
ov02_02247444: @ 0x02247444
	push {lr}
	sub sp, #0xc
	movs r3, #0
	str r3, [sp]
	movs r3, #1
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r3, [sp, #0x14]
	movs r2, #0xff
	bl ov02_02247DA0
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov02_02247444

	thumb_func_start ov02_02247460
ov02_02247460: @ 0x02247460
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r7, _02247498 @ =0x00000018
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r7, #0
	movs r1, #2
	adds r4, r2, #0
	bl FUN_02006FF8
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r3, [sp, #0x24]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0xff
	str r4, [sp, #8]
	bl ov02_02247ED8
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02006F7C
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02247498: .4byte 0x00000018
	thumb_func_end ov02_02247460

	thumb_func_start ov02_0224749C
ov02_0224749C: @ 0x0224749C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	movs r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x20]
	adds r0, r5, #0
	movs r1, #0xff
	adds r6, r3, #0
	str r4, [sp, #8]
	bl ov02_02247B64
	cmp r0, #0
	bne _022474C4
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_022474C4:
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r2, [sp, #0x20]
	adds r0, r5, #0
	movs r1, #0xff
	adds r3, r6, #0
	str r4, [sp, #8]
	bl ov02_02247B64
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_0224749C

	thumb_func_start ov02_022474E0
ov02_022474E0: @ 0x022474E0
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x1c]
	cmp r4, #0
	beq _022474FE
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r3, [sp, #0x18]
	movs r2, #0xff
	bl ov02_02247DA0
	add sp, #0xc
	pop {r3, r4, pc}
_022474FE:
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r2, [sp, #8]
	adds r0, r1, #0
	ldr r2, [sp, #0x18]
	movs r1, #0xff
	bl ov02_02247B64
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov02_022474E0

	thumb_func_start ov02_02247514
ov02_02247514: @ 0x02247514
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x20]
	cmp r4, #0
	beq _02247534
	movs r3, #2
	str r3, [sp]
	movs r3, #1
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	bl ov02_02247DA0
	add sp, #0xc
	pop {r3, r4, pc}
_02247534:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r2, [sp, #8]
	adds r0, r1, #0
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x18]
	bl ov02_02247B64
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov02_02247514

	thumb_func_start ov02_0224754C
ov02_0224754C: @ 0x0224754C
	push {lr}
	sub sp, #0xc
	movs r0, #3
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r2, [sp, #8]
	adds r0, r1, #0
	ldr r2, [sp, #0x10]
	movs r1, #0xff
	bl ov02_02247B64
	add sp, #0xc
	pop {pc}
	thumb_func_end ov02_0224754C

	thumb_func_start ov02_02247568
ov02_02247568: @ 0x02247568
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	str r2, [sp]
	cmp r6, #0x64
	bls _02247576
	movs r6, #0x64
_02247576:
	ldr r0, [r5, #0x40]
	bl FUN_0205C700
	adds r7, r0, #0
	movs r4, #0x28
	cmp r7, #1
	beq _02247598
	cmp r7, #2
	beq _02247598
	ldr r0, [r5, #0x40]
	bl FUN_0205DE98
	cmp r0, #0
	bne _02247598
	subs r4, #0x14
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_02247598:
	ldr r0, [sp]
	bl FUN_0205B6F4
	cmp r0, #0
	beq _022475AA
	adds r4, #0x28
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	b _022475B4
_022475AA:
	cmp r7, #1
	bne _022475B4
	adds r4, #0x1e
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_022475B4:
	adds r0, r5, #0
	adds r0, #0x7c
	ldrh r0, [r0]
	bl ov02_02247610
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl ov02_022522B4
	cmp r0, #1
	bne _022475D4
	adds r4, #0x19
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	b _022475E2
_022475D4:
	bl ov02_022522B4
	cmp r0, #2
	bne _022475E2
	subs r4, #0x19
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_022475E2:
	cmp r4, #0x64
	bls _022475E8
	movs r4, #0x64
_022475E8:
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bge _0224760A
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov02_0224766C
	cmp r0, #0
	beq _0224760A
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224760A:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02247568

	thumb_func_start ov02_02247610
ov02_02247610: @ 0x02247610
	movs r1, #0
	cmp r0, #4
	blo _0224761A
	movs r1, #0x3c
	b _02247628
_0224761A:
	cmp r0, #3
	blo _02247622
	movs r1, #0x28
	b _02247628
_02247622:
	cmp r0, #2
	blo _02247628
	movs r1, #0x1e
_02247628:
	adds r0, r1, #0
	bx lr
	thumb_func_end ov02_02247610

	thumb_func_start ov02_0224762C
ov02_0224762C: @ 0x0224762C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	adds r4, r2, #0
	bl FUN_0205B994
	cmp r0, #0
	beq _02247668
	adds r0, r6, #0
	bl FUN_0205B778
	cmp r0, #0
	beq _02247658
	movs r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	bl ov02_02248020
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6, pc}
_02247658:
	movs r0, #0
	strb r0, [r4]
	adds r0, r5, #0
	bl ov02_02248014
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6, pc}
_02247668:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_0224762C

	thumb_func_start ov02_0224766C
ov02_0224766C: @ 0x0224766C
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bhs _02247686
	movs r0, #1
	pop {r4, pc}
_02247686:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224766C

	thumb_func_start ov02_0224768C
ov02_0224768C: @ 0x0224768C
	push {r3, lr}
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bhs _022476A8
	movs r0, #0
	pop {r3, pc}
_022476A8:
	blo _022476B2
	cmp r0, #0x28
	bhs _022476B2
	movs r0, #1
	pop {r3, pc}
_022476B2:
	cmp r0, #0x28
	blo _022476BE
	cmp r0, #0x32
	bhs _022476BE
	movs r0, #2
	pop {r3, pc}
_022476BE:
	cmp r0, #0x32
	blo _022476CA
	cmp r0, #0x3c
	bhs _022476CA
	movs r0, #3
	pop {r3, pc}
_022476CA:
	cmp r0, #0x3c
	blo _022476D6
	cmp r0, #0x46
	bhs _022476D6
	movs r0, #4
	pop {r3, pc}
_022476D6:
	cmp r0, #0x46
	blo _022476E2
	cmp r0, #0x50
	bhs _022476E2
	movs r0, #5
	pop {r3, pc}
_022476E2:
	cmp r0, #0x50
	blo _022476EE
	cmp r0, #0x55
	bhs _022476EE
	movs r0, #6
	pop {r3, pc}
_022476EE:
	cmp r0, #0x55
	blo _022476FA
	cmp r0, #0x5a
	bhs _022476FA
	movs r0, #7
	pop {r3, pc}
_022476FA:
	cmp r0, #0x5a
	blo _02247706
	cmp r0, #0x5e
	bhs _02247706
	movs r0, #8
	pop {r3, pc}
_02247706:
	cmp r0, #0x5e
	blo _02247712
	cmp r0, #0x62
	bhs _02247712
	movs r0, #9
	pop {r3, pc}
_02247712:
	cmp r0, #0x62
	bne _0224771A
	movs r0, #0xa
	pop {r3, pc}
_0224771A:
	movs r0, #0xb
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_0224768C

	thumb_func_start ov02_02247720
ov02_02247720: @ 0x02247720
	push {r3, lr}
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3c
	bhs _0224773C
	movs r0, #0
	pop {r3, pc}
_0224773C:
	blo _02247746
	cmp r0, #0x5a
	bhs _02247746
	movs r0, #1
	pop {r3, pc}
_02247746:
	cmp r0, #0x5a
	blo _02247752
	cmp r0, #0x5f
	bhs _02247752
	movs r0, #2
	pop {r3, pc}
_02247752:
	cmp r0, #0x5f
	blo _0224775E
	cmp r0, #0x63
	bhs _0224775E
	movs r0, #3
	pop {r3, pc}
_0224775E:
	movs r0, #4
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_02247720

	thumb_func_start ov02_02247764
ov02_02247764: @ 0x02247764
	push {r3, lr}
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bhs _02247780
	movs r0, #0
	pop {r3, pc}
_02247780:
	cmp r0, #0x46
	bhs _02247788
	movs r0, #1
	pop {r3, pc}
_02247788:
	cmp r0, #0x55
	bhs _02247790
	movs r0, #2
	pop {r3, pc}
_02247790:
	cmp r0, #0x5f
	bhs _02247798
	movs r0, #3
	pop {r3, pc}
_02247798:
	movs r0, #4
	pop {r3, pc}
	thumb_func_end ov02_02247764

	thumb_func_start ov02_0224779C
ov02_0224779C: @ 0x0224779C
	push {r3, lr}
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x50
	blo _022477B8
	movs r0, #1
	b _022477BA
_022477B8:
	movs r0, #0
_022477BA:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end ov02_0224779C

	thumb_func_start ov02_022477C0
ov02_022477C0: @ 0x022477C0
	push {r3, lr}
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x32
	bhs _022477DC
	movs r0, #0
	pop {r3, pc}
_022477DC:
	cmp r0, #0x41
	bhs _022477E4
	movs r0, #1
	pop {r3, pc}
_022477E4:
	cmp r0, #0x50
	bhs _022477EC
	movs r0, #2
	pop {r3, pc}
_022477EC:
	cmp r0, #0x5a
	bhs _022477F4
	movs r0, #3
	pop {r3, pc}
_022477F4:
	cmp r0, #0x5f
	bhs _022477FC
	movs r0, #4
	pop {r3, pc}
_022477FC:
	movs r0, #5
	pop {r3, pc}
	thumb_func_end ov02_022477C0

	thumb_func_start ov02_02247800
ov02_02247800: @ 0x02247800
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0xe0
	beq _0224781C
	movs r0, #5
	lsls r0, r0, #6
	cmp r1, r0
	bne _02247828
_0224781C:
	ldrb r0, [r4]
	movs r1, #3
	lsls r0, r0, #1
	blx FUN_020F2998
	strb r0, [r4]
_02247828:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02247800

	thumb_func_start ov02_0224782C
ov02_0224782C: @ 0x0224782C
	push {r4, lr}
	ldr r0, [r0, #0xc]
	adds r4, r1, #0
	bl FUN_0202D9C4
	bl FUN_0202DB2C
	cmp r0, #1
	bne _02247846
	ldrb r0, [r4]
	asrs r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02247846:
	cmp r0, #2
	bne _02247852
	ldrb r1, [r4]
	lsrs r0, r1, #1
	adds r0, r1, r0
	strb r0, [r4]
_02247852:
	pop {r4, pc}
	thumb_func_end ov02_0224782C

	thumb_func_start ov02_02247854
ov02_02247854: @ 0x02247854
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	bne _02247890
	ldrb r0, [r1, #0xe]
	cmp r0, #0x1c
	bne _02247890
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bne _02247890
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl FUN_0206E540
	movs r1, #0x19
	blx FUN_020F2BA4
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	pop {r4, pc}
_02247890:
	bl FUN_0201FD44
	movs r1, #0x19
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, pc}
	thumb_func_end ov02_02247854

	thumb_func_start ov02_022478A4
ov02_022478A4: @ 0x022478A4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldrh r2, [r0, #6]
	ldrh r1, [r0, #4]
	cmp r1, r2
	blo _022478B8
	lsls r0, r2, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r1, #0x18
	b _022478BE
_022478B8:
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r2, #0x18
_022478BE:
	lsrs r5, r0, #0x18
	bl FUN_0201FD44
	subs r1, r5, r4
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r7, #0xd]
	cmp r0, #0
	bne _02247908
	ldrb r0, [r7, #0xe]
	cmp r0, #0x37
	beq _022478E8
	cmp r0, #0x48
	beq _022478E8
	cmp r0, #0x2e
	bne _02247908
_022478E8:
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bne _02247904
	adds r0, r4, r6
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_02247904:
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_02247908:
	adds r0, r4, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022478A4

	thumb_func_start ov02_02247910
ov02_02247910: @ 0x02247910
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #0x10]
	ldr r6, [sp, #0x40]
	str r1, [sp, #0x14]
	movs r0, #0xb
	str r2, [sp, #0x18]
	adds r5, r3, #0
	bl FUN_0206DD2C
	str r0, [sp, #0x1c]
	bl FUN_0206DCE4
	ldrb r0, [r6, #0xd]
	movs r7, #0
	cmp r0, #0
	bne _02247994
	ldrb r0, [r6, #0xe]
	cmp r0, #0x38
	bne _02247970
	ldr r0, [sp, #0x10]
	movs r1, #0x12
	bl FUN_0206FBE8
	cmp r0, #0
	beq _02247994
	cmp r0, #0xfe
	beq _02247994
	cmp r0, #0xff
	beq _02247994
	bl FUN_0201FD44
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	beq _02247994
	ldr r0, [sp, #0x44]
	movs r1, #0x6f
	adds r2, r7, #0
	bl FUN_0206E540
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
	movs r7, #1
	b _02247994
_02247970:
	cmp r0, #0x1c
	bne _02247994
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bne _02247994
	ldr r0, [sp, #0x44]
	bl FUN_0206FDFC
	str r0, [sp, #0x20]
	movs r7, #1
_02247994:
	adds r0, r5, #0
	bl FUN_02070094
	adds r4, r0, #0
	cmp r7, #0
	beq _022479E2
_022479A0:
	ldrb r0, [r6, #0xe]
	cmp r0, #0x38
	bne _022479C8
	ldr r0, [sp, #0x10]
	adds r1, r4, #0
	bl FUN_0206FFC8
	adds r7, r0, #0
	cmp r7, #2
	bne _022479B8
	bl GF_AssertFail
_022479B8:
	ldr r0, [sp, #0x24]
	cmp r7, r0
	bne _022479E2
	adds r0, r5, #0
	bl FUN_02070094
	adds r4, r0, #0
	b _022479A0
_022479C8:
	cmp r0, #0x1c
	bne _022479A0
	adds r0, r4, #0
	bl FUN_0206FE2C
	ldr r1, [sp, #0x20]
	cmp r0, r1
	beq _022479E2
	adds r0, r5, #0
	bl FUN_02070094
	adds r4, r0, #0
	b _022479A0
_022479E2:
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r6]
	movs r3, #0x20
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl FUN_0206DE38
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x48]
	adds r1, r6, #0
	bl ov02_0224855C
	cmp r0, #0
	bne _02247A0E
	bl GF_AssertFail
_02247A0E:
	ldr r0, [sp, #0x1c]
	bl FUN_0201AB0C
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02247910

	thumb_func_start ov02_02247A18
ov02_02247A18: @ 0x02247A18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	str r1, [sp, #0x10]
	str r0, [sp, #0x3c]
	movs r0, #0xb
	str r2, [sp, #0x14]
	adds r6, r3, #0
	ldr r7, [sp, #0x38]
	bl FUN_0206DD2C
	adds r4, r0, #0
	bl FUN_0206DCE4
	ldr r0, [sp, #0xc]
	movs r1, #0x12
	movs r5, #1
	bl FUN_0206FBE8
	cmp r0, #0
	beq _02247A4C
	cmp r0, #0xfe
	beq _02247A4C
	cmp r0, #0xff
	bne _02247A4E
_02247A4C:
	movs r5, #0
_02247A4E:
	cmp r5, #0
	beq _02247AD4
	ldrb r0, [r7, #0xd]
	cmp r0, #0
	bne _02247AD4
	ldrb r0, [r7, #0xe]
	cmp r0, #0x38
	bne _02247AD4
	bl FUN_0201FD44
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	beq _02247AD4
	ldr r0, [sp, #0x3c]
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bne _02247A84
	movs r5, #0
	b _02247A90
_02247A84:
	cmp r5, #0
	bne _02247A8C
	movs r5, #1
	b _02247A90
_02247A8C:
	bl GF_AssertFail
_02247A90:
	ldr r0, [sp, #0x3c]
	adds r1, r7, #0
	bl ov02_02247854
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, r4, #0
	movs r3, #0x20
	bl FUN_0206E14C
	adds r0, r4, #0
	movs r1, #7
	adds r2, r7, #0
	bl FUN_0206EC40
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x40]
	adds r1, r7, #0
	adds r2, r4, #0
	bl ov02_0224855C
	cmp r0, #0
	bne _02247ACA
	bl GF_AssertFail
_02247ACA:
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_02247AD4:
	cmp r6, #0
	beq _02247B26
	movs r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	adds r6, r0, #0
_02247AE0:
	ldr r0, [sp, #0x3c]
	adds r1, r7, #0
	bl ov02_02247854
	str r0, [sp]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, r4, #0
	movs r3, #0x20
	bl FUN_0206E108
	movs r5, #0
_02247AF8:
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x46
	adds r2, r6, #0
	bl FUN_0206E540
	cmp r0, #0x1f
	bne _02247B0E
	movs r0, #1
	str r0, [sp, #0x18]
	b _02247B14
_02247B0E:
	adds r5, r5, #1
	cmp r5, #6
	blt _02247AF8
_02247B14:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _02247B3C
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #4
	blt _02247AE0
	b _02247B3C
_02247B26:
	ldr r0, [sp, #0x3c]
	adds r1, r7, #0
	bl ov02_02247854
	str r0, [sp]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, r4, #0
	movs r3, #0x20
	bl FUN_0206E108
_02247B3C:
	adds r0, r4, #0
	movs r1, #7
	adds r2, r7, #0
	bl FUN_0206EC40
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x40]
	adds r1, r7, #0
	adds r2, r4, #0
	bl ov02_0224855C
	cmp r0, #0
	bne _02247B5A
	bl GF_AssertFail
_02247B5A:
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02247A18

	thumb_func_start ov02_02247B64
ov02_02247B64: @ 0x02247B64
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp, #0xc]
	movs r7, #0
	add r1, sp, #0x10
	strb r7, [r1]
	add r1, sp, #0x18
	ldrb r1, [r1, #0x10]
	adds r6, r0, #0
	adds r5, r2, #0
	adds r4, r3, #0
	cmp r1, #4
	bls _02247B80
	b _02247D36
_02247B80:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02247B8C: @ jump table
	.2byte _02247B96 - _02247B8C - 2 @ case 0
	.2byte _02247C44 - _02247B8C - 2 @ case 1
	.2byte _02247C94 - _02247B8C - 2 @ case 2
	.2byte _02247BF4 - _02247B8C - 2 @ case 3
	.2byte _02247CE6 - _02247B8C - 2 @ case 4
_02247B96:
	movs r1, #8
	str r1, [sp]
	movs r1, #0x2a
	str r1, [sp, #4]
	add r1, sp, #0x10
	str r1, [sp, #8]
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0xc
	bl ov02_02248150
	cmp r0, #0
	bne _02247BD4
	movs r0, #0xd
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0xc
	bl ov02_02248150
	cmp r0, #0
	bne _02247BD4
	bl ov02_0224768C
	add r1, sp, #0x10
	strb r0, [r1]
_02247BD4:
	add r3, sp, #0x10
	ldrb r3, [r3]
	adds r0, r4, #0
	movs r1, #0xc
	adds r2, r5, #0
	bl ov02_022485B0
	add r1, sp, #0x10
	strb r0, [r1]
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r4, r0
	ldrh r0, [r0, #4]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _02247D3A
_02247BF4:
	movs r1, #8
	str r1, [sp]
	movs r1, #0x2a
	str r1, [sp, #4]
	add r1, sp, #0x10
	str r1, [sp, #8]
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #2
	bl ov02_02248150
	cmp r0, #0
	bne _02247C32
	movs r0, #0xd
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #2
	bl ov02_02248150
	cmp r0, #0
	bne _02247C32
	bl ov02_0224779C
	add r1, sp, #0x10
	strb r0, [r1]
_02247C32:
	add r0, sp, #0x10
	ldrb r0, [r0]
	adds r1, r5, #0
	lsls r0, r0, #3
	adds r0, r4, r0
	bl ov02_022478A4
	adds r7, r0, #0
	b _02247D3A
_02247C44:
	movs r1, #8
	str r1, [sp]
	movs r1, #0x2a
	str r1, [sp, #4]
	add r1, sp, #0x10
	str r1, [sp, #8]
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #5
	bl ov02_02248150
	cmp r0, #0
	bne _02247C82
	movs r0, #0xd
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #5
	bl ov02_02248150
	cmp r0, #0
	bne _02247C82
	bl ov02_02247720
	add r1, sp, #0x10
	strb r0, [r1]
_02247C82:
	add r0, sp, #0x10
	ldrb r0, [r0]
	adds r1, r5, #0
	lsls r0, r0, #3
	adds r0, r4, r0
	bl ov02_022478A4
	adds r7, r0, #0
	b _02247D3A
_02247C94:
	movs r1, #8
	str r1, [sp]
	movs r1, #0x2a
	str r1, [sp, #4]
	add r1, sp, #0x10
	str r1, [sp, #8]
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #5
	bl ov02_02248150
	cmp r0, #0
	bne _02247CD4
	movs r0, #0xd
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #5
	bl ov02_02248150
	cmp r0, #0
	bne _02247CD4
	ldr r0, [sp, #0xc]
	bl ov02_02247764
	add r1, sp, #0x10
	strb r0, [r1]
_02247CD4:
	add r0, sp, #0x10
	ldrb r0, [r0]
	adds r1, r5, #0
	lsls r0, r0, #3
	adds r0, r4, r0
	bl ov02_022478A4
	adds r7, r0, #0
	b _02247D3A
_02247CE6:
	movs r1, #8
	str r1, [sp]
	movs r1, #0x2a
	str r1, [sp, #4]
	add r1, sp, #0x10
	str r1, [sp, #8]
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #6
	bl ov02_02248150
	cmp r0, #0
	bne _02247D24
	movs r0, #0xd
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #6
	bl ov02_02248150
	cmp r0, #0
	bne _02247D24
	bl ov02_022477C0
	add r1, sp, #0x10
	strb r0, [r1]
_02247D24:
	add r0, sp, #0x10
	ldrb r0, [r0]
	adds r1, r5, #0
	lsls r0, r0, #3
	adds r0, r4, r0
	bl ov02_022478A4
	adds r7, r0, #0
	b _02247D3A
_02247D36:
	bl GF_AssertFail
_02247D3A:
	add r0, sp, #0x10
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r0, [r4, r0]
	cmp r0, #0xc9
	bne _02247D56
	adds r0, r5, #0
	bl ov02_022482A4
	cmp r0, #0
	bne _02247D56
	add sp, #0x14
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_02247D56:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov02_022481EC
	cmp r0, #0
	beq _02247D6A
	add sp, #0x14
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_02247D6A:
	adds r0, r7, #0
	adds r1, r5, #0
	bl ov02_02248290
	cmp r0, #1
	bne _02247D7C
	add sp, #0x14
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_02247D7C:
	str r5, [sp]
	ldr r0, [sp, #0x30]
	str r6, [sp, #4]
	str r0, [sp, #8]
	add r0, sp, #0x10
	ldrb r0, [r0]
	ldr r2, [sp, #0x2c]
	adds r1, r7, #0
	lsls r0, r0, #3
	ldr r0, [r4, r0]
	movs r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ov02_02247A18
	movs r0, #1
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_02247B64

	thumb_func_start ov02_02247DA0
ov02_02247DA0: @ 0x02247DA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r7, r0, #0
	ldr r0, [r7, #0xc]
	adds r6, r1, #0
	str r2, [sp, #0xc]
	adds r5, r3, #0
	bl FUN_0202F57C
	movs r1, #3
	bl FUN_0202F630
	str r0, [sp, #0x14]
	adds r0, r7, #0
	bl ov02_0224E340
	adds r7, r0, #0
	bl FUN_02014830
	adds r3, r0, #0
	add r0, sp, #0x20
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _02247DDA
	cmp r0, #1
	beq _02247DEC
	cmp r0, #2
	beq _02247DFE
	b _02247E12
_02247DDA:
	movs r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x14]
	adds r1, r7, #0
	movs r2, #0
	bl FUN_020974C4
	adds r4, r0, #0
	b _02247E16
_02247DEC:
	movs r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x14]
	adds r1, r7, #0
	movs r2, #1
	bl FUN_020974C4
	adds r4, r0, #0
	b _02247E16
_02247DFE:
	movs r0, #4
	ldr r2, [sp, #0xc]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	adds r1, r7, #0
	adds r2, r2, #2
	bl FUN_020974C4
	adds r4, r0, #0
	b _02247E16
_02247E12:
	bl GF_AssertFail
_02247E16:
	movs r1, #0
	add r0, sp, #0x18
	strb r1, [r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0x2a
	str r0, [sp, #4]
	add r0, sp, #0x18
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0xa
	bl ov02_02248150
	cmp r0, #0
	bne _02247E50
	movs r0, #0xd
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	add r0, sp, #0x18
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0xa
	bl ov02_02248150
_02247E50:
	cmp r0, #0
	bne _02247E62
	bl FUN_0201FD44
	movs r1, #0xa
	blx FUN_020F2998
	add r0, sp, #0x18
	strb r1, [r0]
_02247E62:
	add r0, sp, #0x20
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _02247E7C
	add r3, sp, #0x18
	ldrb r3, [r3]
	adds r0, r4, #0
	movs r1, #0xa
	adds r2, r5, #0
	bl ov02_022485B0
	add r1, sp, #0x18
	strb r0, [r1]
_02247E7C:
	add r0, sp, #0x18
	ldrb r0, [r0]
	lsls r1, r0, #3
	ldr r0, [r4, r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r4, r1
	ldrh r0, [r0, #4]
	adds r1, r6, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r5, #0
	adds r2, r7, #0
	bl ov02_022481EC
	cmp r0, #0
	bne _02247EAC
	adds r0, r7, #0
	adds r1, r5, #0
	bl ov02_02248290
	cmp r0, #1
	bne _02247EB8
_02247EAC:
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x1c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_02247EB8:
	str r5, [sp]
	ldr r0, [sp, #0x38]
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x34]
	adds r1, r7, #0
	movs r3, #1
	bl ov02_02247A18
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_02247DA0

	thumb_func_start ov02_02247ED8
ov02_02247ED8: @ 0x02247ED8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r1, #0
	adds r5, r3, #0
	bl FUN_0206DB28
	movs r1, #4
	bl FUN_02259B50
	adds r4, r0, #0
	ldrh r0, [r4, #4]
	adds r1, r5, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov02_02248290
	cmp r0, #1
	bne _02247F08
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_02247F08:
	str r5, [sp]
	ldr r0, [sp, #0x28]
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldrh r1, [r4, #4]
	ldr r0, [r4]
	ldr r2, [sp, #0x24]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x18
	movs r3, #1
	bl ov02_02247A18
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov02_02247ED8

	thumb_func_start ov02_02247F30
ov02_02247F30: @ 0x02247F30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp, #0xc]
	bl FUN_02074904
	movs r1, #0
	bl FUN_02074644
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	add r3, sp, #0x10
	bl ov02_02248618
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02247F80
	ldr r0, [r5, #0xc]
	bl FUN_02028E9C
	bl FUN_02028F84
	adds r3, r0, #0
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x40]
	str r4, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #1
	bl ov02_02247910
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02247F80:
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x40]
	str r4, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #0
	bl ov02_02247A18
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02247F30

	thumb_func_start ov02_02247F9C
ov02_02247F9C: @ 0x02247F9C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	movs r4, #0
	bl FUN_0205B994
	cmp r0, #0
	beq _02247FCA
	adds r0, r6, #0
	bl FUN_0205B778
	cmp r0, #0
	beq _02247FC2
	adds r0, r5, #0
	bl ov02_02248020
	adds r4, r0, #0
	b _02247FCA
_02247FC2:
	adds r0, r5, #0
	bl ov02_02248014
	adds r4, r0, #0
_02247FCA:
	cmp r4, #0
	beq _0224800C
	ldr r0, [r5, #0x20]
	ldr r1, [r0]
	ldr r0, _02248010 @ =0x0000013B
	cmp r1, r0
	beq _02247FE0
	adds r0, #0xaf
	subs r0, r1, r0
	cmp r0, #2
	bhi _02248008
_02247FE0:
	ldr r0, [r5, #0xc]
	bl FUN_020503D0
	adds r4, r0, #0
	movs r5, #0
_02247FEA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_02066724
	cmp r0, #0
	beq _02247FFA
	movs r0, #1
	pop {r4, r5, r6, pc}
_02247FFA:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	blo _02247FEA
	movs r0, #0
	pop {r4, r5, r6, pc}
_02248008:
	movs r0, #1
	pop {r4, r5, r6, pc}
_0224800C:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02248010: .4byte 0x0000013B
	thumb_func_end ov02_02247F9C

	thumb_func_start ov02_02248014
ov02_02248014: @ 0x02248014
	push {r3, lr}
	bl FUN_0203B8B8
	ldrb r0, [r0]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_02248014

	thumb_func_start ov02_02248020
ov02_02248020: @ 0x02248020
	push {r3, lr}
	bl FUN_0203B8B8
	ldrb r0, [r0, #1]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_02248020

	thumb_func_start ov02_0224802C
ov02_0224802C: @ 0x0224802C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0203B8B8
	cmp r4, #0
	beq _02248044
	cmp r4, #1
	beq _02248048
	cmp r4, #2
	beq _0224804C
	b _02248050
_02248044:
	ldrb r4, [r0, #3]
	b _02248058
_02248048:
	ldrb r4, [r0, #4]
	b _02248058
_0224804C:
	ldrb r4, [r0, #5]
	b _02248058
_02248050:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, r4, r5, pc}
_02248058:
	cmp r4, #0
	bne _02248060
	movs r0, #0
	pop {r3, r4, r5, pc}
_02248060:
	adds r0, r5, #0
	bl FUN_02069F88
	cmp r0, #0
	beq _0224808A
	ldr r0, [r5, #0xc]
	bl FUN_02074904
	bl FUN_02054388
	movs r1, #9
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov02_02248090
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0224808A:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224802C

	thumb_func_start ov02_02248090
ov02_02248090: @ 0x02248090
	cmp r0, #0x63
	bhi _02248098
	movs r0, #0
	bx lr
_02248098:
	cmp r0, #0x95
	bhi _022480A0
	movs r0, #0x14
	bx lr
_022480A0:
	cmp r0, #0xc7
	bhi _022480A8
	movs r0, #0x1e
	bx lr
_022480A8:
	cmp r0, #0xf9
	bhi _022480B0
	movs r0, #0x28
	bx lr
_022480B0:
	movs r0, #0x32
	bx lr
	thumb_func_end ov02_02248090

	thumb_func_start ov02_022480B4
ov02_022480B4: @ 0x022480B4
	push {r3, lr}
	bl FUN_0203B8B8
	ldrb r0, [r0, #2]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_022480B4

	thumb_func_start ov02_022480C0
ov02_022480C0: @ 0x022480C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	movs r0, #0
	str r1, [sp]
	adds r7, r2, #0
	str r3, [sp, #4]
	adds r4, r0, #0
	add r1, sp, #0x10
_022480D2:
	strb r4, [r1, r0]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc
	blo _022480D2
	ldr r0, [sp]
	adds r5, r4, #0
	cmp r0, #0
	bls _02248128
_022480E6:
	lsls r0, r5, #3
	str r0, [sp, #0xc]
	ldr r0, [r6, r0]
	movs r1, #6
	bl FUN_0206FBE8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	movs r1, #7
	ldr r0, [r6, r0]
	bl FUN_0206FBE8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [sp, #8]
	cmp r0, r7
	beq _02248110
	cmp r1, r7
	bne _0224811C
_02248110:
	adds r1, r4, #1
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r4, r1, #0x18
	add r1, sp, #0x10
	strb r5, [r1, r0]
_0224811C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [sp]
	cmp r5, r0
	blo _022480E6
_02248128:
	cmp r4, #0
	beq _02248132
	ldr r0, [sp]
	cmp r4, r0
	bne _02248138
_02248132:
	add sp, #0x1c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_02248138:
	bl FUN_0201FD44
	adds r1, r4, #0
	blx FUN_020F2998
	add r0, sp, #0x10
	ldrb r1, [r0, r1]
	ldr r0, [sp, #4]
	strb r1, [r0]
	movs r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_022480C0

	thumb_func_start ov02_02248150
ov02_02248150: @ 0x02248150
	push {r3, r4, r5, lr}
	ldrb r0, [r1, #0xd]
	adds r5, r2, #0
	adds r4, r3, #0
	cmp r0, #0
	bne _0224818C
	add r0, sp, #0
	ldrb r1, [r1, #0xe]
	ldrb r0, [r0, #0x14]
	cmp r1, r0
	bne _0224818C
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bne _0224818C
	add r2, sp, #0
	ldrb r2, [r2, #0x10]
	ldr r3, [sp, #0x18]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov02_022480C0
	pop {r3, r4, r5, pc}
_0224818C:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02248150

	thumb_func_start ov02_02248190
ov02_02248190: @ 0x02248190
	push {r3, r4}
	ldrb r4, [r2, #0xd]
	cmp r4, #0
	bne _022481E2
	cmp r0, #0
	ldrb r0, [r2, #0xe]
	beq _022481AA
	cmp r0, #0x3c
	beq _022481A6
	cmp r0, #0x15
	bne _022481DC
_022481A6:
	lsls r1, r1, #1
	b _022481DC
_022481AA:
	cmp r0, #0x47
	beq _022481B6
	cmp r0, #0x63
	beq _022481B6
	cmp r0, #0x23
	bne _022481BA
_022481B6:
	lsls r1, r1, #1
	b _022481DC
_022481BA:
	cmp r0, #0x51
	bne _022481CA
	cmp r3, #5
	bne _022481DC
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r1, r0, #1
	b _022481DC
_022481CA:
	cmp r0, #0x49
	beq _022481D6
	cmp r0, #0x5f
	beq _022481D6
	cmp r0, #1
	bne _022481DC
_022481D6:
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r1, r0, #1
_022481DC:
	cmp r1, #0x64
	ble _022481E2
	movs r1, #0x64
_022481E2:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov02_02248190

	thumb_func_start ov02_022481EC
ov02_022481EC: @ 0x022481EC
	push {r4, lr}
	adds r4, r2, #0
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _022481FA
	movs r0, #0
	pop {r4, pc}
_022481FA:
	ldrb r2, [r0, #0xd]
	cmp r2, #0
	bne _02248240
	ldrb r0, [r0, #0xe]
	cmp r0, #0x33
	beq _0224820A
	cmp r0, #0x16
	bne _02248240
_0224820A:
	adds r0, r1, #0
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bhi _02248220
	movs r0, #0
	pop {r4, pc}
_02248220:
	subs r0, r0, #5
	cmp r4, r0
	bgt _02248240
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bne _02248240
	movs r0, #1
	pop {r4, pc}
_02248240:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov02_022481EC

	thumb_func_start ov02_02248244
ov02_02248244: @ 0x02248244
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	cmp r1, #1
	beq _02248252
	cmp r1, #2
	beq _0224826A
	b _02248284
_02248252:
	ldr r0, [r0, #0xc]
	bl FUN_0203B9C4
	bl FUN_0203B9B8
	adds r1, r0, #0
	ldrh r1, [r1]
	movs r0, #0xb
	bl FUN_02051A60
	str r0, [r5]
	pop {r3, r4, r5, pc}
_0224826A:
	bl FUN_0206DB28
	adds r4, r0, #0
	bl FUN_0206DB30
	adds r1, r0, #0
	ldrh r1, [r1]
	ldr r2, [r4, #0x10]
	movs r0, #0xb
	bl FUN_02051A74
	str r0, [r5]
	pop {r3, r4, r5, pc}
_02248284:
	movs r0, #0xb
	movs r1, #0
	bl FUN_020518D8
	str r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02248244

	thumb_func_start ov02_02248290
ov02_02248290: @ 0x02248290
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _022482A0
	ldrb r1, [r1, #0xc]
	cmp r1, r0
	bls _022482A0
	movs r0, #1
	bx lr
_022482A0:
	movs r0, #0
	bx lr
	thumb_func_end ov02_02248290

	thumb_func_start ov02_022482A4
ov02_022482A4: @ 0x022482A4
	movs r2, #0
_022482A6:
	adds r1, r0, r2
	ldrb r1, [r1, #0x12]
	cmp r1, #0
	beq _022482B2
	movs r0, #1
	bx lr
_022482B2:
	adds r2, r2, #1
	cmp r2, #4
	blt _022482A6
	movs r0, #0
	bx lr
	thumb_func_end ov02_022482A4

	thumb_func_start ov02_022482BC
ov02_022482BC: @ 0x022482BC
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r1, #0
	movs r0, #4
	adds r6, r2, #0
	bl FUN_0206DD2C
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #4
	bl FUN_0202DA6C
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #6
	bl FUN_0202DA6C
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r5, #0
	movs r1, #2
	bl FUN_0202DA6C
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #3
	bl FUN_0202DA6C
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #7
	bl FUN_0202DA6C
	str r0, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #5
	bl FUN_0202DA6C
	add r1, sp, #0x10
	strh r0, [r1]
	ldr r1, [sp, #4]
	ldr r0, [sp, #0xc]
	lsls r1, r1, #0x10
	str r0, [sp]
	ldr r3, [sp, #8]
	adds r0, r4, #0
	lsrs r1, r1, #0x10
	adds r2, r7, #0
	bl FUN_0206E21C
	adds r0, r4, #0
	movs r1, #7
	add r2, sp, #0x30
	bl FUN_0206EC40
	adds r0, r4, #0
	movs r1, #0xa0
	add r2, sp, #0x14
	bl FUN_0206EC40
	adds r0, r4, #0
	movs r1, #0xa3
	add r2, sp, #0x10
	bl FUN_0206EC40
	ldr r0, [r6, #8]
	adds r1, r4, #0
	bl FUN_02074524
	cmp r0, #0
	bne _02248350
	bl GF_AssertFail
_02248350:
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov02_022482BC

	thumb_func_start ov02_02248360
ov02_02248360: @ 0x02248360
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	ldr r0, [r0, #0xc]
	str r1, [sp, #4]
	movs r5, #0
	bl FUN_0202D9C4
	adds r6, r0, #0
	adds r4, r5, #0
_02248374:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0202D9F8
	bl FUN_02067698
	adds r7, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0202DA28
	cmp r0, #0
	beq _022483AC
	ldr r0, [sp]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	cmp r7, r0
	bne _022483AC
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0202DA54
	lsls r2, r5, #2
	add r1, sp, #8
	str r0, [r1, r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_022483AC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _02248374
	cmp r5, #0
	bne _022483C0
	add sp, #0x18
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022483C0:
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bne _022483DC
	add sp, #0x18
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022483DC:
	cmp r5, #1
	bls _0224840A
	cmp r5, #0
	bne _022483E8
	bl GF_AssertFail
_022483E8:
	cmp r5, #1
	bhi _022483F0
	movs r0, #0
	b _022483FE
_022483F0:
	bl FUN_0201FD44
	adds r1, r5, #0
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
_022483FE:
	lsls r1, r0, #2
	add r0, sp, #8
	ldr r1, [r0, r1]
	ldr r0, [sp, #4]
	str r1, [r0]
	b _02248410
_0224840A:
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	str r1, [r0]
_02248410:
	movs r0, #1
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02248360

	thumb_func_start ov02_02248418
ov02_02248418: @ 0x02248418
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	adds r6, r2, #0
	movs r4, #0
	cmp r5, #0
	ble _0224843E
_02248426:
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #1
	bl FUN_0202A108
	cmp r6, r0
	bne _02248438
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02248438:
	adds r4, r4, #1
	cmp r4, r5
	blt _02248426
_0224843E:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02248418

	thumb_func_start ov02_02248444
ov02_02248444: @ 0x02248444
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	beq _02248470
	bl FUN_0201FD44
	ldr r1, _02248554 @ =0x02253290
	lsrs r2, r0, #0x1f
	ldr r3, [r1, #0x48]
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	add sp, #0x18
	ldrb r0, [r3, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02248470:
	movs r0, #4
	movs r1, #0x1c
	bl FUN_0201AACC
	str r0, [sp, #8]
	movs r0, #4
	movs r1, #0x1c
	bl FUN_0201AACC
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	movs r1, #0
	movs r2, #0x1c
	blx FUN_020D4994
	ldr r0, [sp, #4]
	movs r1, #0
	movs r2, #0x1c
	blx FUN_020D4994
	bl ov02_022522B4
	cmp r0, #6
	bne _022484A4
	movs r0, #1
	str r0, [sp, #0xc]
_022484A4:
	ldr r0, [sp]
	movs r6, #0
	ldr r0, [r0, #0x18]
	movs r1, #1
	adds r7, r6, #0
	bl FUN_0202A14C
	lsls r0, r0, #0x18
	adds r1, r6, #0
	lsrs r0, r0, #0x18
	ldr r4, _02248558 @ =0x022532B4
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
_022484BE:
	ldr r1, [sp]
	ldr r0, [sp, #0x10]
	adds r0, r1, r0
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _02248500
	ldr r0, [r4]
	movs r5, #0
	cmp r0, #0
	ble _02248500
_022484D2:
	ldr r2, [r4, #4]
	ldr r0, [sp]
	ldrb r2, [r2, r5]
	ldr r0, [r0, #0x18]
	ldr r1, [sp, #0x14]
	bl ov02_02248418
	cmp r0, #0
	bne _022484EE
	ldr r0, [r4, #4]
	ldrb r1, [r0, r5]
	ldr r0, [sp, #4]
	strb r1, [r0, r6]
	adds r6, r6, #1
_022484EE:
	ldr r0, [r4, #4]
	ldrb r1, [r0, r5]
	ldr r0, [sp, #8]
	adds r5, r5, #1
	strb r1, [r0, r7]
	ldr r0, [r4]
	adds r7, r7, #1
	cmp r5, r0
	blt _022484D2
_02248500:
	ldr r0, [sp, #0x10]
	adds r4, #8
	adds r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _022484BE
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02248534
	cmp r6, #0
	ble _02248534
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	cmp r1, #0x32
	bge _02248534
	bl FUN_0201FD44
	adds r1, r6, #0
	blx FUN_020F2998
	ldr r0, [sp, #4]
	ldrb r4, [r0, r1]
	b _02248542
_02248534:
	bl FUN_0201FD44
	adds r1, r7, #0
	blx FUN_020F2998
	ldr r0, [sp, #8]
	ldrb r4, [r0, r1]
_02248542:
	ldr r0, [sp, #4]
	bl FUN_0201AB0C
	ldr r0, [sp, #8]
	bl FUN_0201AB0C
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02248554: .4byte 0x02253290
_02248558: .4byte 0x022532B4
	thumb_func_end ov02_02248444

	thumb_func_start ov02_0224855C
ov02_0224855C: @ 0x0224855C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	ldrb r0, [r5, #0xd]
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r0, #0
	bne _02248576
	ldrb r0, [r5, #0xe]
	cmp r0, #0xe
	bne _02248576
	movs r2, #1
	b _02248578
_02248576:
	movs r2, #0
_02248578:
	ldr r1, [r6]
	adds r0, r4, #0
	bl FUN_020721A4
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0xc9
	bne _022485A2
	adds r0, r5, #0
	bl ov02_02248444
	add r1, sp, #0
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0x70
	add r2, sp, #0
	bl FUN_0206EC40
_022485A2:
	lsls r0, r7, #2
	adds r0, r6, r0
	ldr r0, [r0, #4]
	adds r1, r4, #0
	bl FUN_02074524
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224855C

	thumb_func_start ov02_022485B0
ov02_022485B0: @ 0x022485B0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r2, #0xd]
	adds r6, r1, #0
	adds r4, r3, #0
	cmp r0, #0
	bne _02248614
	ldrb r0, [r2, #0xe]
	cmp r0, #0x48
	beq _022485CC
	cmp r0, #0x37
	beq _022485CC
	cmp r0, #0x2e
	bne _02248614
_022485CC:
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bne _022485E6
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_022485E6:
	movs r7, #0
	cmp r6, #0
	ble _02248610
_022485EC:
	lsls r2, r4, #3
	lsls r0, r7, #3
	adds r3, r5, r2
	adds r1, r5, r0
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	cmp r0, r2
	bne _02248606
	ldrh r1, [r1, #4]
	ldrh r0, [r3, #4]
	cmp r1, r0
	bls _02248606
	adds r4, r7, #0
_02248606:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, r6
	blt _022485EC
_02248610:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_02248614:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022485B0

	thumb_func_start ov02_02248618
ov02_02248618: @ 0x02248618
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #0x4c
	movs r2, #0
	adds r5, r3, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0224863C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0xa
	strb r2, [r5, #0xd]
	bl FUN_0206E540
	b _02248642
_0224863C:
	movs r0, #1
	strb r0, [r5, #0xd]
	movs r0, #0x7b
_02248642:
	strb r0, [r5, #0xe]
	movs r0, #0
	strb r0, [r5, #0xc]
	str r0, [r5, #4]
	str r0, [r5, #8]
	strb r0, [r5, #0xf]
	strb r0, [r5, #0x10]
	ldr r0, [r7, #0xc]
	bl FUN_020503D0
	adds r6, r0, #0
	ldr r0, [r7, #0x20]
	ldr r1, [r0]
	ldr r0, _02248694 @ =0x000001EB
	cmp r1, r0
	bne _02248666
	movs r0, #1
	b _02248668
_02248666:
	movs r0, #0
_02248668:
	strb r0, [r5, #0x11]
	movs r4, #0
_0224866C:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_02066724
	adds r1, r5, r4
	adds r4, r4, #1
	strb r0, [r1, #0x12]
	cmp r4, #4
	blt _0224866C
	ldr r0, [r7, #0xc]
	bl FUN_0202A634
	str r0, [r5, #0x18]
	ldr r0, [r7, #0xc]
	bl FUN_02028E9C
	bl FUN_02028F84
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02248694: .4byte 0x000001EB
	thumb_func_end ov02_02248618

	thumb_func_start ov02_02248698
ov02_02248698: @ 0x02248698
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x40]
	bl FUN_0205C654
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	cmp r0, #3
	bhi _022486F8
	adds r2, r0, r0
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_022486B8: @ jump table
	.2byte _022486C0 - _022486B8 - 2 @ case 0
	.2byte _022486CE - _022486B8 - 2 @ case 1
	.2byte _022486DC - _022486B8 - 2 @ case 2
	.2byte _022486EA - _022486B8 - 2 @ case 3
_022486C0:
	adds r2, r4, #0
	adds r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #1
	bne _022486FE
	movs r1, #1
	b _022486FE
_022486CE:
	adds r2, r4, #0
	adds r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #0
	bne _022486FE
	movs r1, #1
	b _022486FE
_022486DC:
	adds r2, r4, #0
	adds r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #3
	bne _022486FE
	movs r1, #1
	b _022486FE
_022486EA:
	adds r2, r4, #0
	adds r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #2
	bne _022486FE
	movs r1, #1
	b _022486FE
_022486F8:
	bl GF_AssertFail
	pop {r4, pc}
_022486FE:
	cmp r1, #0
	beq _0224871C
	adds r1, r4, #0
	adds r1, #0x7c
	ldrh r2, [r1]
	ldr r1, _02248724 @ =0x0000FFFF
	cmp r2, r1
	bhs _0224871C
	adds r1, r4, #0
	adds r1, #0x7c
	ldrh r1, [r1]
	adds r2, r1, #1
	adds r1, r4, #0
	adds r1, #0x7c
	strh r2, [r1]
_0224871C:
	adds r4, #0x7a
	strh r0, [r4]
	pop {r4, pc}
	nop
_02248724: .4byte 0x0000FFFF
	thumb_func_end ov02_02248698

	thumb_func_start ov02_02248728
ov02_02248728: @ 0x02248728
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	ldr r0, [sp, #0x1c]
	adds r7, r3, #0
	strb r6, [r5]
	ldr r4, [sp, #0x18]
	strb r7, [r5, #1]
	strb r4, [r5, #2]
	str r0, [sp, #0x1c]
	strb r0, [r5, #3]
	ldr r0, [sp, #0x20]
	movs r2, #4
	strb r0, [r5, #4]
	ldr r0, [sp, #0x24]
	strb r0, [r5, #5]
	ldr r0, [sp, #0x28]
	strb r0, [r5, #6]
	ldr r0, [sp, #0x2c]
	strb r0, [r5, #7]
	adds r0, r1, #0
	adds r1, r5, #0
	adds r1, #0xc
	bl FUN_02009F40
	str r0, [r5, #8]
	adds r0, r5, #0
	movs r2, #2
	adds r0, #0xc
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	adds r0, r6, #0
	movs r1, #0
	movs r2, #4
	bl FUN_0200A090
	movs r1, #0x4d
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r7, #0
	movs r1, #1
	movs r2, #4
	bl FUN_0200A090
	movs r1, #0x4e
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	bl FUN_0200A090
	movs r1, #0x4f
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp, #0x1c]
	movs r1, #3
	movs r2, #4
	bl FUN_0200A090
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #4
	lsls r1, r6, #3
	bl ov02_0224B690
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #4
	lsls r1, r7, #3
	bl ov02_0224B690
	movs r1, #0x52
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #4
	lsls r1, r4, #3
	bl ov02_0224B690
	movs r1, #0x53
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r1, [sp, #0x1c]
	movs r0, #4
	lsls r1, r1, #3
	bl ov02_0224B690
	movs r1, #0x15
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r1, #0
	cmp r6, #0
	ble _02248804
	ble _02248804
	ldr r0, [sp, #0x20]
	adds r2, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_022487F4:
	movs r3, #0x51
	lsls r3, r3, #2
	ldr r3, [r5, r3]
	adds r1, r1, #1
	strh r0, [r3, r2]
	adds r2, #8
	cmp r1, r6
	blt _022487F4
_02248804:
	movs r3, #0
	cmp r7, #0
	ble _02248824
	ble _02248824
	ldr r0, [sp, #0x24]
	movs r6, #0x52
	lsls r0, r0, #0x10
	adds r2, r3, #0
	asrs r1, r0, #0x10
	lsls r6, r6, #2
_02248818:
	ldr r0, [r5, r6]
	adds r3, r3, #1
	strh r1, [r0, r2]
	adds r2, #8
	cmp r3, r7
	blt _02248818
_02248824:
	movs r1, #0
	cmp r4, #0
	ble _02248844
	ble _02248844
	ldr r2, [sp, #0x28]
	adds r0, r1, #0
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	movs r2, #0x53
	lsls r2, r2, #2
_02248838:
	ldr r3, [r5, r2]
	adds r1, r1, #1
	strh r6, [r3, r0]
	adds r0, #8
	cmp r1, r4
	blt _02248838
_02248844:
	ldr r0, [sp, #0x1c]
	movs r1, #0
	cmp r0, #0
	ble _02248868
	ble _02248868
	ldr r2, [sp, #0x2c]
	movs r3, #0x15
	lsls r2, r2, #0x10
	adds r0, r1, #0
	asrs r4, r2, #0x10
	lsls r3, r3, #4
_0224885A:
	ldr r2, [r5, r3]
	adds r1, r1, #1
	strh r4, [r2, r0]
	ldr r2, [sp, #0x1c]
	adds r0, #8
	cmp r1, r2
	blt _0224885A
_02248868:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02248728

	thumb_func_start ov02_0224886C
ov02_0224886C: @ 0x0224886C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5]
	movs r6, #0
	cmp r0, #0
	ble _0224889C
	adds r4, r6, #0
	movs r7, #4
_0224887C:
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	ldrsb r2, [r5, r7]
	adds r0, r1, r4
	ldrsh r1, [r1, r4]
	cmp r2, r1
	beq _02248892
	ldr r0, [r0, #4]
	bl FUN_0200AEB0
_02248892:
	ldrb r0, [r5]
	adds r6, r6, #1
	adds r4, #8
	cmp r6, r0
	blt _0224887C
_0224889C:
	ldrb r0, [r5, #1]
	movs r6, #0
	cmp r0, #0
	ble _022488C8
	adds r4, r6, #0
	movs r7, #5
_022488A8:
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	ldrsb r2, [r5, r7]
	adds r0, r1, r4
	ldrsh r1, [r1, r4]
	cmp r2, r1
	beq _022488BE
	ldr r0, [r0, #4]
	bl FUN_0200B0A8
_022488BE:
	ldrb r0, [r5, #1]
	adds r6, r6, #1
	adds r4, #8
	cmp r6, r0
	blt _022488A8
_022488C8:
	ldrb r0, [r5, #2]
	movs r6, #0
	cmp r0, #0
	ble _022488F4
	adds r4, r6, #0
	movs r7, #6
_022488D4:
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	ldrsb r2, [r5, r7]
	adds r0, r1, r4
	ldrsh r1, [r1, r4]
	cmp r2, r1
	beq _022488EA
	ldr r0, [r0, #4]
	bl FUN_0200A740
_022488EA:
	ldrb r0, [r5, #2]
	adds r6, r6, #1
	adds r4, #8
	cmp r6, r0
	blt _022488D4
_022488F4:
	ldrb r0, [r5, #3]
	movs r6, #0
	cmp r0, #0
	ble _02248920
	adds r4, r6, #0
	movs r7, #7
_02248900:
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	ldrsb r2, [r5, r7]
	adds r0, r1, r4
	ldrsh r1, [r1, r4]
	cmp r2, r1
	beq _02248916
	ldr r0, [r0, #4]
	bl FUN_0200A740
_02248916:
	ldrb r0, [r5, #3]
	adds r6, r6, #1
	adds r4, #8
	cmp r6, r0
	blt _02248900
_02248920:
	movs r0, #0x4d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200A0D0
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200A0D0
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200A0D0
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0200A0D0
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0201AB0C
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0201AB0C
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0201AB0C
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0201AB0C
	ldr r0, [r5, #8]
	bl FUN_02024544
	ldr r0, [r5, #8]
	bl FUN_02024504
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224886C

	thumb_func_start ov02_02248980
ov02_02248980: @ 0x02248980
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	ldrb r5, [r6]
	str r2, [sp, #0x10]
	str r1, [sp, #0xc]
	adds r7, r3, #0
	movs r2, #0
	cmp r5, #0
	ble _022489E6
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r3, [r6, r0]
	movs r0, #4
	ldrsb r4, [r6, r0]
	mov ip, r3
	adds r0, r2, #0
_022489A2:
	ldrsh r1, [r3, r0]
	cmp r4, r1
	bne _022489DE
	lsls r4, r2, #3
	mov r0, ip
	strh r7, [r0, r4]
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	movs r3, #0
	adds r1, r1, r4
	strh r3, [r1, #2]
	str r7, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	subs r0, #0x10
	ldr r0, [r6, r0]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	bl FUN_0200A3C8
	movs r1, #0x51
	lsls r1, r1, #2
	ldr r1, [r6, r1]
	add sp, #0x14
	adds r1, r1, r4
	str r0, [r1, #4]
	pop {r4, r5, r6, r7, pc}
_022489DE:
	adds r2, r2, #1
	adds r3, #8
	cmp r2, r5
	blt _022489A2
_022489E6:
	bl GF_AssertFail
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02248980

	thumb_func_start ov02_022489F0
ov02_022489F0: @ 0x022489F0
	push {r4, r5, r6, lr}
	ldrb r3, [r0]
	movs r2, #0
	cmp r3, #0
	ble _02248A1E
	movs r4, #0x51
	lsls r4, r4, #2
	ldr r0, [r0, r4]
	adds r4, r2, #0
	adds r6, r0, #0
_02248A04:
	ldrsh r5, [r6, r4]
	cmp r1, r5
	bne _02248A16
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl FUN_0200ADA4
	pop {r4, r5, r6, pc}
_02248A16:
	adds r2, r2, #1
	adds r6, #8
	cmp r2, r3
	blt _02248A04
_02248A1E:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_022489F0

	thumb_func_start ov02_02248A24
ov02_02248A24: @ 0x02248A24
	push {r4, r5, r6, lr}
	ldrb r3, [r0]
	movs r2, #0
	cmp r3, #0
	ble _02248A52
	movs r4, #0x51
	lsls r4, r4, #2
	ldr r0, [r0, r4]
	adds r4, r2, #0
	adds r6, r0, #0
_02248A38:
	ldrsh r5, [r6, r4]
	cmp r1, r5
	bne _02248A4A
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl FUN_0200A740
	pop {r4, r5, r6, pc}
_02248A4A:
	adds r2, r2, #1
	adds r6, #8
	cmp r2, r3
	blt _02248A38
_02248A52:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02248A24

	thumb_func_start ov02_02248A58
ov02_02248A58: @ 0x02248A58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r0, #0
	ldrb r5, [r6]
	str r2, [sp, #0x14]
	str r1, [sp, #0x10]
	adds r7, r3, #0
	movs r2, #0
	cmp r5, #0
	ble _02248AC0
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r3, [r6, r0]
	movs r0, #5
	ldrsb r4, [r6, r0]
	mov ip, r3
	adds r0, r2, #0
_02248A7A:
	ldrsh r1, [r3, r0]
	cmp r4, r1
	bne _02248AB8
	lsls r4, r2, #3
	mov r0, ip
	strh r7, [r0, r4]
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	movs r3, #0
	adds r1, r1, r4
	strh r3, [r1, #2]
	str r7, [sp]
	movs r1, #1
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #4
	str r1, [sp, #0xc]
	subs r0, #0x10
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl FUN_0200A480
	movs r1, #0x52
	lsls r1, r1, #2
	ldr r1, [r6, r1]
	add sp, #0x18
	adds r1, r1, r4
	str r0, [r1, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02248AB8:
	adds r2, r2, #1
	adds r3, #8
	cmp r2, r5
	blt _02248A7A
_02248AC0:
	bl GF_AssertFail
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02248A58

	thumb_func_start ov02_02248AC8
ov02_02248AC8: @ 0x02248AC8
	push {r4, r5, r6, lr}
	ldrb r3, [r0, #1]
	movs r2, #0
	cmp r3, #0
	ble _02248AF6
	movs r4, #0x52
	lsls r4, r4, #2
	ldr r0, [r0, r4]
	adds r4, r2, #0
	adds r6, r0, #0
_02248ADC:
	ldrsh r5, [r6, r4]
	cmp r1, r5
	bne _02248AEE
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl FUN_0200B00C
	pop {r4, r5, r6, pc}
_02248AEE:
	adds r2, r2, #1
	adds r6, #8
	cmp r2, r3
	blt _02248ADC
_02248AF6:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02248AC8

	thumb_func_start ov02_02248AFC
ov02_02248AFC: @ 0x02248AFC
	push {r4, r5, r6, lr}
	ldrb r3, [r0, #1]
	movs r2, #0
	cmp r3, #0
	ble _02248B2A
	movs r4, #0x52
	lsls r4, r4, #2
	ldr r0, [r0, r4]
	adds r4, r2, #0
	adds r6, r0, #0
_02248B10:
	ldrsh r5, [r6, r4]
	cmp r1, r5
	bne _02248B22
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl FUN_0200A740
	pop {r4, r5, r6, pc}
_02248B22:
	adds r2, r2, #1
	adds r6, #8
	cmp r2, r3
	blt _02248B10
_02248B2A:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02248AFC

	thumb_func_start ov02_02248B30
ov02_02248B30: @ 0x02248B30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	ldrb r5, [r6]
	str r2, [sp, #0x10]
	str r1, [sp, #0xc]
	adds r7, r3, #0
	movs r2, #0
	cmp r5, #0
	ble _02248B96
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r3, [r6, r0]
	movs r0, #6
	ldrsb r4, [r6, r0]
	mov ip, r3
	adds r0, r2, #0
_02248B52:
	ldrsh r1, [r3, r0]
	cmp r4, r1
	bne _02248B8E
	lsls r4, r2, #3
	mov r0, ip
	strh r7, [r0, r4]
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	movs r3, #0
	adds r1, r1, r4
	strh r3, [r1, #2]
	str r7, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	subs r0, #0x10
	ldr r0, [r6, r0]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	bl FUN_0200A540
	movs r1, #0x53
	lsls r1, r1, #2
	ldr r1, [r6, r1]
	add sp, #0x14
	adds r1, r1, r4
	str r0, [r1, #4]
	pop {r4, r5, r6, r7, pc}
_02248B8E:
	adds r2, r2, #1
	adds r3, #8
	cmp r2, r5
	blt _02248B52
_02248B96:
	bl GF_AssertFail
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02248B30

	thumb_func_start ov02_02248BA0
ov02_02248BA0: @ 0x02248BA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	ldrb r5, [r6]
	str r2, [sp, #0x10]
	str r1, [sp, #0xc]
	adds r7, r3, #0
	movs r2, #0
	cmp r5, #0
	ble _02248C06
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r3, [r6, r0]
	movs r0, #7
	ldrsb r4, [r6, r0]
	mov ip, r3
	adds r0, r2, #0
_02248BC2:
	ldrsh r1, [r3, r0]
	cmp r4, r1
	bne _02248BFE
	lsls r4, r2, #3
	mov r0, ip
	strh r7, [r0, r4]
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r1, [r6, r0]
	movs r3, #0
	adds r1, r1, r4
	strh r3, [r1, #2]
	str r7, [sp]
	movs r1, #3
	str r1, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	subs r0, #0x10
	ldr r0, [r6, r0]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	bl FUN_0200A540
	movs r1, #0x15
	lsls r1, r1, #4
	ldr r1, [r6, r1]
	add sp, #0x14
	adds r1, r1, r4
	str r0, [r1, #4]
	pop {r4, r5, r6, r7, pc}
_02248BFE:
	adds r2, r2, #1
	adds r3, #8
	cmp r2, r5
	blt _02248BC2
_02248C06:
	bl GF_AssertFail
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02248BA0

	thumb_func_start ov02_02248C10
ov02_02248C10: @ 0x02248C10
	push {r4, r5, r6, lr}
	sub sp, #0x70
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	movs r0, #7
	adds r2, r3, #0
	ldrsb r3, [r5, r0]
	ldr r6, [sp, #0x84]
	cmp r6, r3
	bne _02248C2A
	subs r0, #8
	str r0, [sp, #0x84]
_02248C2A:
	ldr r0, [sp, #0x84]
	movs r3, #0
	str r0, [sp]
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x88]
	str r3, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0x4d
	lsls r0, r0, #2
	ldr r6, [r5, r0]
	str r6, [sp, #0x14]
	adds r6, r0, #4
	ldr r6, [r5, r6]
	str r6, [sp, #0x18]
	adds r6, r0, #0
	adds r6, #8
	ldr r6, [r5, r6]
	adds r0, #0xc
	str r6, [sp, #0x1c]
	ldr r0, [r5, r0]
	str r0, [sp, #0x20]
	str r3, [sp, #0x24]
	str r3, [sp, #0x28]
	ldr r3, [sp, #0x80]
	add r0, sp, #0x4c
	bl FUN_02009D48
	ldr r0, [r5, #8]
	add r2, sp, #0x34
	str r0, [sp, #0x2c]
	add r0, sp, #0x4c
	str r0, [sp, #0x30]
	ldm r4!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	ldr r0, [sp, #0x8c]
	str r0, [sp, #0x40]
	movs r0, #1
	str r0, [sp, #0x44]
	movs r0, #4
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	bl FUN_02024714
	adds r4, r0, #0
	bne _02248C92
	bl GF_AssertFail
_02248C92:
	adds r0, r4, #0
	add sp, #0x70
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02248C10

	thumb_func_start ov02_02248C98
ov02_02248C98: @ 0x02248C98
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_020248AC
	adds r2, r0, #0
	ldm r2!, {r0, r1}
	stm r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov02_02248C98

	thumb_func_start ov02_02248CAC
ov02_02248CAC: @ 0x02248CAC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	adds r4, r0, #0
	movs r2, #0
	add r0, sp, #0x1c
	str r2, [r0]
	str r2, [r0, #4]
	add r3, sp, #0x28
	str r2, [r3]
	str r2, [r3, #4]
	ldr r6, _02248D14 @ =0x02253360
	str r2, [r0, #8]
	ldm r6!, {r0, r1}
	add r5, sp, #0x10
	stm r5!, {r0, r1}
	ldr r0, [r6]
	str r2, [r3, #8]
	str r0, [r5]
	adds r1, r3, #0
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r2, [sp, #8]
	movs r0, #0x84
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r3, r2, #0
	bl ov02_02248C10
	adds r4, r0, #0
	movs r1, #2
	bl FUN_0202487C
	adds r0, r4, #0
	add r1, sp, #0x1c
	bl FUN_020247E4
	adds r0, r4, #0
	add r1, sp, #0x10
	bl FUN_020247F4
	movs r0, #0
	bl FUN_0201FD00
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02024818
	adds r0, r4, #0
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	nop
_02248D14: .4byte 0x02253360
	thumb_func_end ov02_02248CAC

	thumb_func_start ov02_02248D18
ov02_02248D18: @ 0x02248D18
	push {r3, r4, lr}
	sub sp, #0x1c
	movs r3, #0
	add r2, sp, #0x10
	str r3, [r2]
	str r3, [r2, #4]
	str r3, [r2, #8]
	cmp r1, #1
	bne _02248D2C
	movs r3, #1
_02248D2C:
	movs r2, #2
	str r2, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #0x83
	str r1, [sp, #0xc]
	add r1, sp, #0x10
	bl ov02_02248C10
	adds r4, r0, #0
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #6
	bl FUN_020248F0
	adds r0, r4, #0
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end ov02_02248D18

	thumb_func_start ov02_02248D58
ov02_02248D58: @ 0x02248D58
	push {r4, r5, lr}
	sub sp, #0x24
	add r5, sp, #0x18
	movs r4, #0
	str r4, [r5]
	str r4, [r5, #4]
	str r0, [sp, #0xc]
	str r2, [sp, #0x14]
	str r3, [sp, #0x10]
	str r4, [r5, #8]
	str r1, [sp, #8]
	add r0, sp, #8
	str r0, [sp]
	movs r0, #0x82
	str r0, [sp, #4]
	adds r0, r1, #0
	ldr r1, _02248D88 @ =0x02253454
	adds r2, r5, #0
	adds r3, r4, #0
	bl FUN_02068B0C
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_02248D88: .4byte 0x02253454
	thumb_func_end ov02_02248D58

	thumb_func_start ov02_02248D8C
ov02_02248D8C: @ 0x02248D8C
	push {r3, lr}
	bl FUN_02068D74
	ldrb r0, [r0, #2]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_02248D8C

	thumb_func_start ov02_02248D98
ov02_02248D98: @ 0x02248D98
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02068D98
	adds r2, r4, #0
	adds r3, r0, #0
	adds r2, #0x58
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4, #0x64]
	bl ov02_02248CAC
	str r0, [r4, #0x68]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02248D98

	thumb_func_start ov02_02248DBC
ov02_02248DBC: @ 0x02248DBC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02068D74
	adds r4, r0, #0
	ldr r0, [r4, #0x6c]
	cmp r0, #0
	beq _02248DD0
	bl FUN_02068B48
_02248DD0:
	ldr r0, [r4, #0x70]
	cmp r0, #0
	beq _02248DDA
	bl FUN_021FCD78
_02248DDA:
	adds r0, r5, #0
	bl FUN_02068B48
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_02248DBC

	thumb_func_start ov02_02248DE4
ov02_02248DE4: @ 0x02248DE4
	ldr r3, _02248DEC @ =FUN_02024758
	ldr r0, [r1, #0x68]
	bx r3
	nop
_02248DEC: .4byte FUN_02024758
	thumb_func_end ov02_02248DE4

	thumb_func_start ov02_02248DF0
ov02_02248DF0: @ 0x02248DF0
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldrb r0, [r5]
	lsls r1, r0, #2
	ldr r0, _02248E0C @ =0x02253320
	ldr r4, [r0, r1]
_02248DFC:
	ldrb r1, [r5, #1]
	adds r0, r5, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _02248DFC
	pop {r3, r4, r5, pc}
	.align 2, 0
_02248E0C: .4byte 0x02253320
	thumb_func_end ov02_02248DF0

	thumb_func_start ov02_02248E10
ov02_02248E10: @ 0x02248E10
	push {r3, lr}
	movs r1, #0
	strb r1, [r0, #2]
	ldr r0, [r0, #0x68]
	bl FUN_02024830
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov02_02248E10

	thumb_func_start ov02_02248E20
ov02_02248E20: @ 0x02248E20
	push {r4, r5, r6, lr}
	sub sp, #0x30
	ldr r4, _02248F74 @ =0x0225339C
	adds r2, r0, #0
	ldm r4!, {r0, r1}
	add r3, sp, #0x24
	stm r3!, {r0, r1}
	ldr r0, [r4]
	ldr r4, _02248F78 @ =0x022533CC
	str r0, [r3]
	ldm r4!, {r0, r1}
	add r3, sp, #0x18
	stm r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	adds r0, r2, #0
	bl FUN_02068D74
	adds r4, r0, #0
	movs r3, #1
	adds r5, r4, #0
	strb r3, [r4]
	movs r2, #0
	strb r2, [r4, #2]
	strb r2, [r4, #1]
	str r2, [r4, #4]
	add r6, sp, #0x24
	ldm r6!, {r0, r1}
	adds r5, #8
	stm r5!, {r0, r1}
	ldr r0, [r6]
	str r0, [r5]
	str r2, [r4, #0x14]
	str r2, [r4, #0x18]
	str r2, [r4, #0x1c]
	ldr r0, _02248F7C @ =0x0015E000
	adds r2, r4, #0
	add r5, sp, #0x18
	str r0, [r4, #0x38]
	ldm r5!, {r0, r1}
	adds r2, #0x2c
	stm r2!, {r0, r1}
	ldr r0, [r5]
	str r0, [r2]
	lsls r0, r3, #0xa
	str r0, [r4, #0x50]
	movs r0, #0x2d
	lsls r0, r0, #0xc
	str r0, [r4, #0x40]
	movs r0, #3
	lsls r0, r0, #0x12
	str r0, [r4, #0x48]
	lsls r0, r3, #0x11
	str r0, [r4, #0x4c]
	movs r0, #0x2d
	bl FUN_0201FCC0
	ldr r2, [r4, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x40]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r2, [r4, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r4, #0x18]
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x14]
	adds r0, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x18]
	adds r0, r1, r0
	str r0, [sp, #0x28]
	ldr r0, [r4, #0x68]
	add r1, sp, #0x24
	bl FUN_020247D4
	ldr r0, [r4, #0x68]
	add r1, sp, #0x18
	bl FUN_020247F4
	ldr r1, [r4, #0x38]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FD00
	adds r1, r0, #0
	ldr r0, [r4, #0x68]
	bl FUN_02024818
	ldr r0, [r4, #0x68]
	movs r1, #0x84
	bl FUN_02024ADC
	ldr r0, [r4, #0x68]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #0x58]
	ldr r1, [r4, #0x60]
	bl ov02_0224B298
	str r0, [r4, #0x6c]
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl FUN_021FCD2C
	ldr r2, _02248F80 @ =0xFFF88000
	movs r1, #1
	movs r3, #0xc
	str r0, [r4, #0x70]
	bl FUN_021FCD8C
	add r1, sp, #0xc
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	ldr r3, _02248F84 @ =0x022533A8
	str r0, [r1, #8]
	ldm r3!, {r0, r1}
	add r2, sp, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #2
	str r0, [r2]
	ldr r4, [r4, #0x60]
	adds r0, r4, #0
	bl FUN_0202487C
	adds r0, r4, #0
	add r1, sp, #0xc
	bl FUN_020247E4
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_020247F4
	movs r0, #0
	bl FUN_0201FD00
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02024818
	adds r0, r4, #0
	movs r1, #2
	bl FUN_020248F0
	bl ov02_022493FC
	add sp, #0x30
	pop {r4, r5, r6, pc}
	nop
_02248F74: .4byte 0x0225339C
_02248F78: .4byte 0x022533CC
_02248F7C: .4byte 0x0015E000
_02248F80: .4byte 0xFFF88000
_02248F84: .4byte 0x022533A8
	thumb_func_end ov02_02248E20

	thumb_func_start ov02_02248F88
ov02_02248F88: @ 0x02248F88
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	ldr r6, [r5, #0x68]
	ldr r4, [r5, #0x60]
	subs r0, r1, r0
	str r0, [r5, #0x48]
	bpl _02248FA0
	movs r0, #0
	str r0, [r5, #0x48]
_02248FA0:
	movs r0, #2
	ldr r1, [r5, #0x4c]
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _02248FB2
	movs r0, #7
	lsls r0, r0, #0xa
	subs r0, r1, r0
	str r0, [r5, #0x4c]
_02248FB2:
	movs r0, #1
	ldr r1, [r5, #0x4c]
	lsls r0, r0, #0xc
	cmp r1, r0
	bge _02248FBE
	str r0, [r5, #0x4c]
_02248FBE:
	movs r0, #0x2d
	bl FUN_0201FCC0
	ldr r2, [r5, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x40]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r2, [r5, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r5, #0x18]
	ldr r1, [r5, #0x40]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	cmp r0, #0x5a
	bge _02249006
	movs r0, #1
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [r5, #0x40]
_02249006:
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x50]
	subs r1, r1, r0
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [r5, #0x2c]
	cmp r1, r0
	bge _02249018
	str r0, [r5, #0x2c]
_02249018:
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x50]
	subs r1, r1, r0
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [r5, #0x30]
	cmp r1, r0
	bge _0224902A
	str r0, [r5, #0x30]
_0224902A:
	adds r1, r5, #0
	adds r0, r6, #0
	adds r1, #0x2c
	bl FUN_020247F4
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x2c
	bl FUN_020247F4
	ldr r1, [r5, #8]
	ldr r0, [r5, #0x14]
	adds r0, r1, r0
	str r0, [sp]
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x18]
	adds r0, r1, r0
	str r0, [sp, #4]
	adds r0, r6, #0
	add r1, sp, #0
	bl FUN_020247D4
	movs r0, #0x12
	ldr r1, [sp, #4]
	lsls r0, r0, #0xc
	subs r0, r1, r0
	str r0, [sp, #4]
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_020247D4
	ldr r0, [r5, #0x48]
	cmp r0, #0
	bne _0224907A
	movs r0, #0
	str r0, [r5, #4]
	ldrb r0, [r5, #1]
	adds r0, r0, #1
	strb r0, [r5, #1]
	b _02249080
_0224907A:
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
_02249080:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_02248F88

	thumb_func_start ov02_02249088
ov02_02249088: @ 0x02249088
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x6c]
	bl ov02_0224B314
	ldr r0, [r4, #0x70]
	movs r1, #2
	movs r2, #0
	movs r3, #0xc
	bl FUN_021FCD8C
	movs r0, #1
	lsls r0, r0, #0xa
	str r0, [r4, #0x50]
	lsls r0, r0, #9
	str r0, [r4, #0x40]
	movs r0, #0
	str r0, [r4, #0x48]
	movs r0, #6
	lsls r0, r0, #0xa
	str r0, [r4, #0x4c]
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov02_02249088

	thumb_func_start ov02_022490BC
ov02_022490BC: @ 0x022490BC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	ldr r4, [r5, #0x68]
	adds r0, r1, r0
	str r0, [r5, #0x48]
	movs r0, #1
	ldr r1, [r5, #0x4c]
	lsls r0, r0, #0xc
	adds r2, r1, r0
	lsls r1, r0, #4
	str r2, [r5, #0x4c]
	cmp r2, r1
	ble _022490E0
	lsls r0, r0, #4
	str r0, [r5, #0x4c]
_022490E0:
	ldr r1, [r5, #0x40]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	ldr r2, [r5, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r5, #0x14]
	movs r0, #0x80
	bl FUN_0201FCAC
	ldr r2, [r5, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r5, #0x18]
	movs r0, #0xa
	ldr r1, [r5, #0x40]
	lsls r0, r0, #0x10
	cmp r1, r0
	bge _02249124
	movs r0, #1
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [r5, #0x40]
_02249124:
	movs r0, #2
	ldr r1, [r5, #0x38]
	lsls r0, r0, #0xc
	adds r1, r1, r0
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	str r1, [r5, #0x38]
	bl FUN_0201FD00
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02024818
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x50]
	adds r1, r1, r0
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [r5, #0x2c]
	cmp r1, r0
	ble _02249156
	str r0, [r5, #0x2c]
_02249156:
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x50]
	adds r1, r1, r0
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [r5, #0x30]
	cmp r1, r0
	ble _02249168
	str r0, [r5, #0x30]
_02249168:
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x2c
	bl FUN_020247F4
	ldr r1, [r5, #8]
	ldr r0, [r5, #0x14]
	adds r0, r1, r0
	str r0, [sp]
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x18]
	subs r0, r1, r0
	str r0, [sp, #4]
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_020247D4
	ldr r1, [sp, #4]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r1, r0, #0xc
	movs r0, #0xf
	mvns r0, r0
	cmp r1, r0
	bgt _022491A2
	ldrb r0, [r5, #1]
	adds r0, r0, #1
	strb r0, [r5, #1]
_022491A2:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov02_022490BC

	thumb_func_start ov02_022491A8
ov02_022491A8: @ 0x022491A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x68]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x60]
	movs r1, #1
	bl FUN_020248F0
	movs r0, #0
	str r0, [r4, #4]
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_022491A8

	thumb_func_start ov02_022491CC
ov02_022491CC: @ 0x022491CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #0x14
	bge _022491E2
	add sp, #0x18
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022491E2:
	ldr r3, _02249284 @ =0x022533D8
	add r2, sp, #0xc
	ldm r3!, {r0, r1}
	adds r6, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _02249288 @ =0x022533B4
	str r0, [r2]
	add r2, sp, #0
	ldm r3!, {r0, r1}
	adds r5, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r7, #0
	str r0, [r2]
	adds r2, r4, #0
	str r7, [r4, #4]
	adds r3, r6, #0
	ldm r3!, {r0, r1}
	adds r2, #8
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	str r7, [r4, #0x14]
	str r7, [r4, #0x18]
	str r7, [r4, #0x1c]
	str r7, [r4, #0x38]
	adds r2, r4, #0
	ldm r5!, {r0, r1}
	adds r2, #0x2c
	stm r2!, {r0, r1}
	ldr r0, [r5]
	movs r1, #2
	str r0, [r2]
	lsls r1, r1, #8
	ldr r0, _0224928C @ =0x0013B000
	str r1, [r4, #0x50]
	str r0, [r4, #0x40]
	lsls r0, r1, #0xa
	str r0, [r4, #0x48]
	lsls r0, r1, #4
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x68]
	adds r1, r6, #0
	bl FUN_020247D4
	ldr r0, [r4, #0x68]
	add r1, sp, #0
	bl FUN_020247F4
	ldr r1, [r4, #0x38]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FD00
	adds r1, r0, #0
	ldr r0, [r4, #0x68]
	bl FUN_02024818
	ldr r0, [r4, #0x68]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #0x60]
	movs r1, #6
	bl FUN_020248F0
	ldr r0, [r4, #0x60]
	movs r1, #1
	bl FUN_0202484C
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	movs r0, #1
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02249284: .4byte 0x022533D8
_02249288: .4byte 0x022533B4
_0224928C: .4byte 0x0013B000
	thumb_func_end ov02_022491CC

	thumb_func_start ov02_02249290
ov02_02249290: @ 0x02249290
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	ldr r4, [r5, #0x68]
	subs r0, r1, r0
	str r0, [r5, #0x48]
	movs r0, #1
	ldr r1, [r5, #0x4c]
	lsls r0, r0, #0x10
	cmp r1, r0
	bge _022492B0
	lsrs r0, r0, #3
	adds r0, r1, r0
	str r0, [r5, #0x4c]
_022492B0:
	ldr r0, [r5, #0x48]
	cmp r0, #0
	bge _022492BA
	movs r0, #0
	str r0, [r5, #0x48]
_022492BA:
	ldr r0, _02249398 @ =0x0000013B
	bl FUN_0201FCC0
	ldr r2, [r5, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x40]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r2, [r5, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r5, #0x18]
	ldr r1, [r5, #0x40]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	cmp r0, #0xb4
	bge _02249302
	movs r0, #1
	lsls r0, r0, #0xe
	subs r0, r1, r0
	str r0, [r5, #0x40]
_02249302:
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x50]
	subs r1, r1, r0
	movs r0, #1
	lsls r0, r0, #0xa
	str r1, [r5, #0x2c]
	cmp r1, r0
	bge _02249314
	str r0, [r5, #0x2c]
_02249314:
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x50]
	subs r1, r1, r0
	movs r0, #1
	lsls r0, r0, #0xa
	str r1, [r5, #0x30]
	cmp r1, r0
	bge _02249326
	str r0, [r5, #0x30]
_02249326:
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x2c
	bl FUN_020247F4
	movs r0, #6
	ldr r1, [r5, #0x38]
	lsls r0, r0, #0xc
	adds r1, r1, r0
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	str r1, [r5, #0x38]
	cmp r0, #0x3c
	ble _0224934C
	movs r0, #0xf
	lsls r0, r0, #0xe
	str r0, [r5, #0x38]
_0224934C:
	ldr r1, [r5, #0x38]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FD00
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02024818
	ldr r1, [r5, #8]
	ldr r0, [r5, #0x14]
	adds r0, r1, r0
	str r0, [sp]
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x18]
	adds r0, r1, r0
	str r0, [sp, #4]
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_020247D4
	ldr r0, [r5, #0x48]
	cmp r0, #0
	bgt _02249390
	adds r0, r4, #0
	movs r1, #0
	bl FUN_02024830
	ldrb r0, [r5, #1]
	adds r0, r0, #1
	strb r0, [r5, #1]
_02249390:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02249398: .4byte 0x0000013B
	thumb_func_end ov02_02249290

	thumb_func_start ov02_0224939C
ov02_0224939C: @ 0x0224939C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #8
	bne _022493BA
	ldr r0, [r4, #0x60]
	movs r1, #1
	bl FUN_020248F0
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl ov02_02249444
_022493BA:
	ldr r0, [r4, #4]
	cmp r0, #0xa
	bne _022493C8
	ldr r0, [r4, #0x60]
	movs r1, #0
	bl FUN_02024830
_022493C8:
	ldr r0, [r4, #4]
	cmp r0, #0xf
	ble _022493E6
	ldr r0, [r4, #0x70]
	bl FUN_021FCD6C
	cmp r0, #1
	bne _022493E6
	movs r0, #0
	str r0, [r4, #4]
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	movs r0, #2
	strb r0, [r4, #2]
_022493E6:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224939C

	thumb_func_start ov02_022493EC
ov02_022493EC: @ 0x022493EC
	movs r0, #0
	bx lr
	thumb_func_end ov02_022493EC

	thumb_func_start ov02_022493F0
ov02_022493F0: @ 0x022493F0
	ldr r3, _022493F8 @ =FUN_02007688
	movs r0, #0x5d
	movs r1, #4
	bx r3
	.align 2, 0
_022493F8: .4byte FUN_02007688
	thumb_func_end ov02_022493F0

	thumb_func_start ov02_022493FC
ov02_022493FC: @ 0x022493FC
	push {lr}
	sub sp, #0xc
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldr r3, _0224941C @ =0x00007FFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	add sp, #0xc
	pop {pc}
	nop
_0224941C: .4byte 0x00007FFF
	thumb_func_end ov02_022493FC

	thumb_func_start ov02_02249420
ov02_02249420: @ 0x02249420
	push {lr}
	sub sp, #0xc
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0
	ldr r3, _02249440 @ =0x00007FFF
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
	add sp, #0xc
	pop {pc}
	.align 2, 0
_02249440: .4byte 0x00007FFF
	thumb_func_end ov02_02249420

	thumb_func_start ov02_02249444
ov02_02249444: @ 0x02249444
	push {r4, lr}
	ldr r0, [r0, #0x40]
	adds r4, r1, #0
	bl FUN_0205C6DC
	adds r1, r4, #0
	bl FUN_0205F690
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02249444

	thumb_func_start ov02_02249458
ov02_02249458: @ 0x02249458
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov02_0224955C
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	strh r7, [r4, #0xc]
	ldrh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	str r5, [r4, #0x20]
	ldr r0, [r4, #0x60]
	ldr r0, [r0, #0x40]
	bl FUN_0205C6DC
	movs r1, #0x82
	lsls r1, r1, #2
	str r0, [r4, r1]
	cmp r5, #0
	bne _02249490
	ldr r0, _022494B8 @ =ov02_02249584
	adds r1, r4, #0
	movs r2, #0x86
	bl FUN_0200E320
	pop {r3, r4, r5, r6, r7, pc}
_02249490:
	cmp r5, #2
	bne _022494AC
	ldr r0, [sp]
	bl FUN_02069D68
	movs r1, #0x83
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _022494BC @ =ov02_022499B8
	adds r1, r4, #0
	movs r2, #0x86
	bl FUN_0200E320
	pop {r3, r4, r5, r6, r7, pc}
_022494AC:
	ldr r0, _022494C0 @ =ov02_02249984
	adds r1, r4, #0
	movs r2, #0x86
	bl FUN_0200E320
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022494B8: .4byte ov02_02249584
_022494BC: .4byte ov02_022499B8
_022494C0: .4byte ov02_02249984
	thumb_func_end ov02_02249458

	thumb_func_start ov02_022494C4
ov02_022494C4: @ 0x022494C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov02_0224955C
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	movs r0, #3
	str r0, [r4, #0x20]
	movs r0, #0x82
	lsls r0, r0, #2
	str r6, [r4, r0]
	adds r0, r0, #4
	str r7, [r4, r0]
	ldr r0, [r4, #0x60]
	ldr r0, [r0, #0x40]
	bl FUN_0205C6DC
	add r1, sp, #0xc
	bl FUN_0205F944
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl FUN_0205F944
	ldr r1, [sp]
	ldr r0, [sp, #0xc]
	subs r0, r1, r0
	movs r1, #2
	lsls r1, r1, #0xc
	blx FUN_020CCBA0
	movs r1, #0xbb
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	adds r0, r2, r0
	str r0, [r4, r1]
	ldr r2, [sp, #8]
	ldr r0, [sp, #0x14]
	adds r1, #8
	subs r0, r2, r0
	str r0, [r4, r1]
	ldr r0, _02249538 @ =ov02_022499B8
	adds r1, r4, #0
	movs r2, #0x86
	bl FUN_0200E320
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02249538: .4byte ov02_022499B8
	thumb_func_end ov02_022494C4

	thumb_func_start ov02_0224953C
ov02_0224953C: @ 0x0224953C
	push {r3, lr}
	bl FUN_0201F988
	ldr r0, [r0, #4]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_0224953C

	thumb_func_start ov02_02249548
ov02_02249548: @ 0x02249548
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0201F988
	bl ov02_0224957C
	adds r0, r4, #0
	bl FUN_0200E390
	pop {r4, pc}
	thumb_func_end ov02_02249548

	thumb_func_start ov02_0224955C
ov02_0224955C: @ 0x0224955C
	push {r3, r4, r5, lr}
	movs r1, #0xbe
	adds r5, r0, #0
	movs r0, #4
	lsls r1, r1, #2
	bl FUN_0201AACC
	movs r2, #0xbe
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020E5B44
	str r5, [r4, #0x60]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224955C

	thumb_func_start ov02_0224957C
ov02_0224957C: @ 0x0224957C
	ldr r3, _02249580 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_02249580: .4byte FUN_0201AB0C
	thumb_func_end ov02_0224957C

	thumb_func_start ov02_02249584
ov02_02249584: @ 0x02249584
	push {r3, r4, r5, lr}
	ldr r4, _022495B4 @ =0x02253550
	adds r5, r1, #0
_0224958A:
	ldr r1, [r5]
	adds r0, r5, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _0224958A
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _022495B2
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _022495AC
	bl FUN_02068BAC
_022495AC:
	adds r0, r5, #0
	bl ov02_0224A32C
_022495B2:
	pop {r3, r4, r5, pc}
	.align 2, 0
_022495B4: .4byte 0x02253550
	thumb_func_end ov02_02249584

	thumb_func_start ov02_022495B8
ov02_022495B8: @ 0x022495B8
	push {r4, lr}
	adds r4, r0, #0
	bl ov02_02249EC0
	adds r0, r4, #0
	bl ov02_02249CF0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov02_022495B8

	thumb_func_start ov02_022495D0
ov02_022495D0: @ 0x022495D0
	push {r4, lr}
	adds r4, r0, #0
	bl ov02_02249F6C
	adds r0, r4, #0
	bl ov02_02249CF0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov02_022495D0

	thumb_func_start ov02_022495E8
ov02_022495E8: @ 0x022495E8
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	movs r0, #0x85
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _022495FE
	add sp, #0x18
	movs r0, #0
	pop {r3, r4, r5, pc}
_022495FE:
	ldr r5, _02249650 @ =0x02253408
	add r3, sp, #0xc
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r5]
	ldr r5, _02249654 @ =0x02253384
	str r0, [r3]
	ldm r5!, {r0, r1}
	add r3, sp, #0
	stm r3!, {r0, r1}
	ldr r0, [r5]
	adds r1, r2, #0
	str r0, [r3]
	adds r0, r4, #0
	bl ov02_0224A418
	movs r1, #0x79
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	add r1, sp, #0
	bl ov02_0224A9B8
	movs r1, #0x7a
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	movs r1, #1
	bl ov02_0224A9D8
	adds r0, r4, #0
	bl ov02_02249D40
	movs r0, #1
	str r0, [r4, #0x10]
	ldr r1, [r4]
	adds r1, r1, #1
	str r1, [r4]
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_02249650: .4byte 0x02253408
_02249654: .4byte 0x02253384
	thumb_func_end ov02_022495E8

	thumb_func_start ov02_02249658
ov02_02249658: @ 0x02249658
	push {r4, lr}
	adds r4, r0, #0
	bl ov02_0224B72C
	movs r0, #0
	ldr r1, _0224968C @ =0xFFFC0000
	str r0, [r4, #0x2c]
	str r1, [r4, #0x54]
	movs r1, #0xfe
	lsls r1, r1, #0xc
	str r1, [r4, #0x44]
	movs r1, #0xff
	lsls r1, r1, #0xc
	str r1, [r4, #0x48]
	movs r1, #0x5f
	lsls r1, r1, #0xc
	str r1, [r4, #0x4c]
	movs r1, #0x61
	lsls r1, r1, #0xc
	str r1, [r4, #0x50]
	movs r1, #1
	str r1, [r4, #0x2c]
	ldr r1, [r4]
	adds r1, r1, #1
	str r1, [r4]
	pop {r4, pc}
	.align 2, 0
_0224968C: .4byte 0xFFFC0000
	thumb_func_end ov02_02249658

	thumb_func_start ov02_02249690
ov02_02249690: @ 0x02249690
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r2, #0
	str r2, [r4, #0x2c]
	ldr r1, [r4, #0x44]
	ldr r0, [r4, #0x54]
	adds r0, r1, r0
	str r0, [r4, #0x44]
	cmp r0, #0
	bgt _022496B4
	movs r0, #2
	str r2, [r4, #0x44]
	lsls r0, r0, #0xc
	str r0, [r4, #0x54]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_022496B4:
	ldr r0, [r4, #0x50]
	str r0, [sp]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	ldr r3, [r4, #0x48]
	adds r0, r4, #0
	bl ov02_0224A69C
	movs r0, #1
	str r0, [r4, #0x2c]
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov02_02249690

	thumb_func_start ov02_022496D0
ov02_022496D0: @ 0x022496D0
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x54]
	subs r0, r1, r0
	str r0, [r4, #0x4c]
	ldr r1, [r4, #0x50]
	ldr r0, [r4, #0x54]
	adds r0, r1, r0
	str r0, [r4, #0x50]
	movs r0, #2
	ldr r1, [r4, #0x54]
	lsls r0, r0, #0xc
	adds r2, r1, r0
	lsls r1, r0, #4
	str r2, [r4, #0x54]
	cmp r2, r1
	ble _022496FE
	lsls r0, r0, #4
	str r0, [r4, #0x54]
_022496FE:
	movs r0, #0xe
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #0xe
	cmp r1, r0
	bge _0224970A
	str r0, [r4, #0x4c]
_0224970A:
	movs r0, #0x22
	ldr r1, [r4, #0x50]
	lsls r0, r0, #0xe
	cmp r1, r0
	ble _02249716
	str r0, [r4, #0x50]
_02249716:
	ldr r0, [r4, #0x50]
	str r0, [sp]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	ldr r3, [r4, #0x48]
	adds r0, r4, #0
	bl ov02_0224A69C
	movs r0, #1
	str r0, [r4, #0x2c]
	movs r0, #0xe
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #0xe
	cmp r1, r0
	bne _0224974E
	movs r0, #0x22
	ldr r1, [r4, #0x50]
	lsls r0, r0, #0xe
	cmp r1, r0
	bne _0224974E
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov02_0224A450
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0224974E:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov02_022496D0

	thumb_func_start ov02_02249754
ov02_02249754: @ 0x02249754
	ldr r1, [r0, #8]
	adds r1, r1, #1
	str r1, [r0, #8]
	cmp r1, #0xf
	blt _0224976C
	movs r1, #0
	str r1, [r0, #8]
	ldr r1, _02249770 @ =0xFFFC0000
	str r1, [r0, #0x58]
	ldr r1, [r0]
	adds r1, r1, #1
	str r1, [r0]
_0224976C:
	movs r0, #0
	bx lr
	.align 2, 0
_02249770: .4byte 0xFFFC0000
	thumb_func_end ov02_02249754

	thumb_func_start ov02_02249774
ov02_02249774: @ 0x02249774
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020248AC
	adds r3, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [sp]
	ldr r0, [r4, #0x58]
	adds r1, r1, r0
	movs r0, #0xa
	lsls r0, r0, #0x10
	str r1, [sp]
	cmp r1, r0
	bgt _022497AC
	movs r0, #3
	lsls r0, r0, #0x12
	str r0, [sp]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_022497AC:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl FUN_020247D4
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov02_02249774

	thumb_func_start ov02_022497C0
ov02_022497C0: @ 0x022497C0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, [r4, #0x58]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r1, r0, #1
	ldr r0, _02249834 @ =0xFFFFE000
	str r1, [r4, #0x58]
	cmp r1, r0
	ble _02249802
	str r0, [r4, #0x58]
	ldr r0, [r4]
	movs r1, #5
	adds r0, r0, #1
	str r0, [r4]
	ldr r0, [r4, #0x5c]
	movs r2, #0
	bl FUN_0206E540
	adds r5, r0, #0
	ldr r0, [r4, #0x5c]
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #0
	lsls r0, r5, #0x10
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x18
	bl FUN_02006218
_02249802:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020248AC
	adds r5, r0, #0
	add r3, sp, #0
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r1, [sp]
	ldr r0, [r4, #0x58]
	adds r0, r1, r0
	str r0, [sp]
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r2, #0
	bl FUN_020247D4
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_02249834: .4byte 0xFFFFE000
	thumb_func_end ov02_022497C0

	thumb_func_start ov02_02249838
ov02_02249838: @ 0x02249838
	ldr r1, [r0, #8]
	adds r1, r1, #1
	str r1, [r0, #8]
	cmp r1, #8
	blt _02249850
	movs r1, #0
	str r1, [r0, #8]
	ldr r1, _02249854 @ =0xFFFFF000
	str r1, [r0, #0x58]
	ldr r1, [r0]
	adds r1, r1, #1
	str r1, [r0]
_02249850:
	movs r0, #0
	bx lr
	.align 2, 0
_02249854: .4byte 0xFFFFF000
	thumb_func_end ov02_02249838

	thumb_func_start ov02_02249858
ov02_02249858: @ 0x02249858
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	lsls r1, r0, #1
	ldr r0, _022498B4 @ =0xFFFC0000
	str r1, [r4, #0x58]
	cmp r1, r0
	bge _0224986C
	str r0, [r4, #0x58]
_0224986C:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020248AC
	adds r5, r0, #0
	add r3, sp, #0
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r1, [sp]
	ldr r0, [r4, #0x58]
	adds r0, r1, r0
	str r0, [sp]
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r2, #0
	bl FUN_020247D4
	ldr r1, [sp]
	ldr r0, _022498B8 @ =0xFFFD8000
	cmp r1, r0
	bgt _022498AC
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [r4, #0x54]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_022498AC:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_022498B4: .4byte 0xFFFC0000
_022498B8: .4byte 0xFFFD8000
	thumb_func_end ov02_02249858

	thumb_func_start ov02_022498BC
ov02_022498BC: @ 0x022498BC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x54]
	adds r0, r1, r0
	str r0, [r4, #0x4c]
	ldr r1, [r4, #0x50]
	ldr r0, [r4, #0x54]
	subs r0, r1, r0
	str r0, [r4, #0x50]
	movs r0, #1
	ldr r1, [r4, #0x54]
	lsls r0, r0, #0xe
	adds r2, r1, r0
	lsls r1, r0, #2
	str r2, [r4, #0x54]
	cmp r2, r1
	ble _022498EA
	lsls r0, r0, #2
	str r0, [r4, #0x54]
_022498EA:
	movs r0, #0x5f
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #0xc
	cmp r1, r0
	blt _022498F6
	str r0, [r4, #0x4c]
_022498F6:
	movs r0, #0x61
	ldr r1, [r4, #0x50]
	lsls r0, r0, #0xc
	cmp r1, r0
	bgt _02249902
	str r0, [r4, #0x50]
_02249902:
	ldr r0, [r4, #0x50]
	str r0, [sp]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	ldr r3, [r4, #0x48]
	adds r0, r4, #0
	bl ov02_0224A69C
	movs r0, #1
	str r0, [r4, #0x2c]
	movs r0, #0x5f
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #0xc
	cmp r1, r0
	bne _0224993A
	movs r0, #0x61
	ldr r1, [r4, #0x50]
	lsls r0, r0, #0xc
	cmp r1, r0
	bne _0224993A
	adds r0, r4, #0
	bl ov02_0224B768
	movs r0, #0x11
	str r0, [r4, #0x34]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0224993A:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov02_022498BC

	thumb_func_start ov02_02249940
ov02_02249940: @ 0x02249940
	push {r4, lr}
	adds r4, r0, #0
	bl ov02_02249FD4
	movs r0, #0
	str r0, [r4, #0x10]
	ldr r1, [r4]
	adds r1, r1, #1
	str r1, [r4]
	pop {r4, pc}
	thumb_func_end ov02_02249940

	thumb_func_start ov02_02249954
ov02_02249954: @ 0x02249954
	push {r4, lr}
	adds r4, r0, #0
	bl ov02_0224A028
	movs r0, #0
	str r0, [r4, #0x10]
	ldr r1, [r4]
	adds r1, r1, #1
	str r1, [r4]
	pop {r4, pc}
	thumb_func_end ov02_02249954

	thumb_func_start ov02_02249968
ov02_02249968: @ 0x02249968
	push {r4, lr}
	adds r4, r0, #0
	bl ov02_0224A6D0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02249968

	thumb_func_start ov02_0224997C
ov02_0224997C: @ 0x0224997C
	movs r1, #1
	str r1, [r0, #4]
	movs r0, #0
	bx lr
	thumb_func_end ov02_0224997C

	thumb_func_start ov02_02249984
ov02_02249984: @ 0x02249984
	push {r3, r4, r5, lr}
	ldr r4, _022499B4 @ =0x02253588
	adds r5, r1, #0
_0224998A:
	ldr r1, [r5]
	adds r0, r5, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _0224998A
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _022499B2
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _022499AC
	bl FUN_02068BAC
_022499AC:
	adds r0, r5, #0
	bl ov02_0224A32C
_022499B2:
	pop {r3, r4, r5, pc}
	.align 2, 0
_022499B4: .4byte 0x02253588
	thumb_func_end ov02_02249984

	thumb_func_start ov02_022499B8
ov02_022499B8: @ 0x022499B8
	push {r3, r4, r5, lr}
	ldr r4, _022499E8 @ =0x022534F0
	adds r5, r1, #0
_022499BE:
	ldr r1, [r5]
	adds r0, r5, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _022499BE
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _022499E6
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _022499E0
	bl FUN_02068BAC
_022499E0:
	adds r0, r5, #0
	bl ov02_0224A32C
_022499E6:
	pop {r3, r4, r5, pc}
	.align 2, 0
_022499E8: .4byte 0x022534F0
	thumb_func_end ov02_022499B8

	thumb_func_start ov02_022499EC
ov02_022499EC: @ 0x022499EC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	movs r0, #0x85
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02249A02
	add sp, #0x18
	movs r0, #0
	pop {r3, r4, r5, pc}
_02249A02:
	ldr r5, _02249A54 @ =0x022533FC
	add r3, sp, #0xc
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r5]
	ldr r5, _02249A58 @ =0x02253414
	str r0, [r3]
	ldm r5!, {r0, r1}
	add r3, sp, #0
	stm r3!, {r0, r1}
	ldr r0, [r5]
	adds r1, r2, #0
	str r0, [r3]
	adds r0, r4, #0
	bl ov02_0224A418
	movs r1, #0x79
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	add r1, sp, #0
	bl ov02_0224A9B8
	movs r1, #0x7a
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	movs r1, #1
	bl ov02_0224A9D8
	adds r0, r4, #0
	bl ov02_02249D40
	movs r0, #1
	str r0, [r4, #0x10]
	ldr r1, [r4]
	adds r1, r1, #1
	str r1, [r4]
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_02249A54: .4byte 0x022533FC
_02249A58: .4byte 0x02253414
	thumb_func_end ov02_022499EC

	thumb_func_start ov02_02249A5C
ov02_02249A5C: @ 0x02249A5C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	movs r3, #0x85
	adds r4, r0, #0
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	cmp r0, #0
	bne _02249A72
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_02249A72:
	ldr r6, _02249AC0 @ =0x02253348
	add r5, sp, #0
	ldm r6!, {r0, r1}
	adds r2, r5, #0
	stm r5!, {r0, r1}
	ldr r0, [r6]
	str r0, [r5]
	adds r0, r3, #0
	adds r0, #0xd8
	ldr r1, [sp]
	ldr r0, [r4, r0]
	adds r3, #0xe0
	adds r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [r4, r3]
	adds r0, r1, r0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r2, #0
	bl ov02_0224A418
	movs r1, #0x79
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_020248F0
	adds r0, r4, #0
	bl ov02_02249D40
	movs r0, #1
	str r0, [r4, #0x10]
	ldr r1, [r4]
	adds r1, r1, #1
	str r1, [r4]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02249AC0: .4byte 0x02253348
	thumb_func_end ov02_02249A5C

	thumb_func_start ov02_02249AC4
ov02_02249AC4: @ 0x02249AC4
	push {r4, lr}
	adds r4, r0, #0
	bl ov02_0224A8D4
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02249AC4

	thumb_func_start ov02_02249AD8
ov02_02249AD8: @ 0x02249AD8
	push {r4, lr}
	adds r4, r0, #0
	bl ov02_0224A4D0
	adds r0, r4, #0
	bl ov02_02249D18
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov02_02249AD8

	thumb_func_start ov02_02249AF0
ov02_02249AF0: @ 0x02249AF0
	push {r4, lr}
	movs r1, #0x85
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _02249B02
	movs r0, #0
	pop {r4, pc}
_02249B02:
	bl ov02_02249D40
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov02_02249AF0

	thumb_func_start ov02_02249B10
ov02_02249B10: @ 0x02249B10
	push {r4, lr}
	adds r4, r0, #0
	bl ov02_0224AB58
	adds r0, r4, #0
	bl ov02_0224AC38
	adds r0, r4, #0
	bl ov02_0224A690
	adds r0, r4, #0
	movs r1, #1
	bl ov02_0224B6B0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02249B10

	thumb_func_start ov02_02249B38
ov02_02249B38: @ 0x02249B38
	push {r4, lr}
	adds r4, r0, #0
	bl ov02_0224AB8C
	cmp r0, #2
	beq _02249B48
	movs r0, #0
	pop {r4, pc}
_02249B48:
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_020248F0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02249B38

	thumb_func_start ov02_02249B60
ov02_02249B60: @ 0x02249B60
	push {r3, lr}
	ldr r1, [r0, #8]
	adds r1, r1, #1
	str r1, [r0, #8]
	cmp r1, #0x14
	blt _02249B7A
	movs r1, #0
	str r1, [r0, #8]
	ldr r1, [r0]
	adds r1, r1, #1
	str r1, [r0]
	bl ov02_0224ADF0
_02249B7A:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_02249B60

	thumb_func_start ov02_02249B80
ov02_02249B80: @ 0x02249B80
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	adds r1, r1, #1
	str r1, [r4, #8]
	cmp r1, #0x14
	blt _02249BA2
	movs r1, #0
	str r1, [r4, #8]
	ldr r1, [r4]
	adds r1, r1, #1
	str r1, [r4]
	bl ov02_0224AB58
	adds r0, r4, #0
	bl ov02_0224ADF0
_02249BA2:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02249B80

	thumb_func_start ov02_02249BA8
ov02_02249BA8: @ 0x02249BA8
	push {r4, lr}
	adds r4, r0, #0
	bl ov02_0224AB8C
	cmp r0, #3
	beq _02249BB8
	movs r0, #0
	pop {r4, pc}
_02249BB8:
	ldr r0, _02249BD4 @ =0x00000648
	bl FUN_0200604C
	movs r0, #2
	lsls r0, r0, #0xa
	str r0, [r4, #0x54]
	movs r0, #2
	str r0, [r4, #0x14]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
	nop
_02249BD4: .4byte 0x00000648
	thumb_func_end ov02_02249BA8

	thumb_func_start ov02_02249BD8
ov02_02249BD8: @ 0x02249BD8
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x54]
	adds r0, r1, r0
	str r0, [r4, #0x4c]
	ldr r1, [r4, #0x50]
	ldr r0, [r4, #0x54]
	subs r0, r1, r0
	str r0, [r4, #0x50]
	movs r0, #2
	ldr r1, [r4, #0x54]
	lsls r0, r0, #0xa
	adds r2, r1, r0
	lsls r1, r0, #5
	str r2, [r4, #0x54]
	cmp r2, r1
	ble _02249C06
	lsls r0, r0, #5
	str r0, [r4, #0x54]
_02249C06:
	movs r0, #0x5f
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #0xc
	cmp r1, r0
	blt _02249C12
	str r0, [r4, #0x4c]
_02249C12:
	movs r0, #0x61
	ldr r1, [r4, #0x50]
	lsls r0, r0, #0xc
	cmp r1, r0
	bgt _02249C1E
	str r0, [r4, #0x50]
_02249C1E:
	ldr r0, [r4, #0x50]
	str r0, [sp]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	ldr r3, [r4, #0x48]
	adds r0, r4, #0
	bl ov02_0224A69C
	movs r0, #1
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _02249C4A
	adds r0, r4, #0
	bl ov02_0224AB8C
	cmp r0, #4
	bne _02249C4A
	movs r0, #1
	str r0, [r4, #0x18]
	bl ov02_02249420
_02249C4A:
	movs r0, #0x5f
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #0xc
	cmp r1, r0
	bne _02249C6C
	movs r0, #0x61
	ldr r1, [r4, #0x50]
	lsls r0, r0, #0xc
	cmp r1, r0
	bne _02249C6C
	movs r0, #0x11
	str r0, [r4, #0x34]
	movs r0, #1
	str r0, [r4, #0x14]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_02249C6C:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov02_02249BD8

	thumb_func_start ov02_02249C74
ov02_02249C74: @ 0x02249C74
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x20]
	cmp r1, #3
	bne _02249C96
	bl ov02_0224AB8C
	cmp r0, #2
	bne _02249C92
	adds r0, r4, #0
	bl ov02_0224AB9C
	ldr r0, [r4]
	adds r0, r0, #2
	str r0, [r4]
_02249C92:
	movs r0, #0
	pop {r4, pc}
_02249C96:
	ldr r1, [r4, #0x18]
	cmp r1, #0
	bne _02249CAC
	bl ov02_0224AB8C
	cmp r0, #4
	bne _02249CAC
	movs r0, #1
	str r0, [r4, #0x18]
	bl ov02_02249420
_02249CAC:
	adds r0, r4, #0
	bl ov02_0224AB8C
	cmp r0, #2
	beq _02249CBA
	movs r0, #0
	pop {r4, pc}
_02249CBA:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _02249CC8
	movs r0, #1
	str r0, [r4, #0x18]
	bl ov02_02249420
_02249CC8:
	adds r0, r4, #0
	bl ov02_0224AB9C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov02_02249C74

	thumb_func_start ov02_02249CD8
ov02_02249CD8: @ 0x02249CD8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02249CEA
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_02249CEA:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02249CD8

	thumb_func_start ov02_02249CF0
ov02_02249CF0: @ 0x02249CF0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x21
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _02249D14 @ =ov02_02249D5C
	adds r1, r4, #0
	movs r2, #0x80
	bl FUN_0200E33C
	movs r1, #0x22
	lsls r1, r1, #4
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_02249D14: .4byte ov02_02249D5C
	thumb_func_end ov02_02249CF0

	thumb_func_start ov02_02249D18
ov02_02249D18: @ 0x02249D18
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x21
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _02249D3C @ =ov02_02249E58
	adds r1, r4, #0
	movs r2, #0x80
	bl FUN_0200E33C
	movs r1, #0x22
	lsls r1, r1, #4
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_02249D3C: .4byte ov02_02249E58
	thumb_func_end ov02_02249D18

	thumb_func_start ov02_02249D40
ov02_02249D40: @ 0x02249D40
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02249D5A
	bl FUN_0200E390
	movs r0, #0x22
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
_02249D5A:
	pop {r4, pc}
	thumb_func_end ov02_02249D40

	thumb_func_start ov02_02249D5C
ov02_02249D5C: @ 0x02249D5C
	push {r3, r4, r5, r6, r7, lr}
	movs r0, #0x21
	adds r6, r1, #0
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _02249DD2
	movs r7, #0x6b
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_02249D72:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _02249D7C
	bl FUN_0200ADA4
_02249D7C:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02249D72
	movs r7, #0x6f
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_02249D8C:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02249D96
	bl FUN_0200B00C
_02249D96:
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #3
	blt _02249D8C
	movs r0, #0x86
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	cmp r1, #0
	beq _02249DAE
	adds r0, r6, #0
	bl ov02_0224A834
_02249DAE:
	movs r0, #0x87
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	cmp r1, #0
	beq _02249DBE
	adds r0, r6, #0
	bl ov02_0224A88C
_02249DBE:
	movs r0, #0x21
	lsls r0, r0, #4
	ldr r1, [r6, r0]
	movs r2, #0x80
	adds r1, r1, #1
	str r1, [r6, r0]
	ldr r0, _02249DD4 @ =ov02_02249DD8
	adds r1, r6, #0
	bl FUN_0200E374
_02249DD2:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02249DD4: .4byte ov02_02249DD8
	thumb_func_end ov02_02249D5C

	thumb_func_start ov02_02249DD8
ov02_02249DD8: @ 0x02249DD8
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	movs r0, #0x21
	adds r6, r1, #0
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	cmp r0, #1
	bne _02249E56
	movs r7, #0x6b
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_02249DF0:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _02249DFA
	bl FUN_0200A740
_02249DFA:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02249DF0
	movs r7, #0x6f
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_02249E0A:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02249E14
	bl FUN_0200A740
_02249E14:
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #3
	blt _02249E0A
	movs r0, #0x86
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02249E32
	bl FUN_0201AB0C
	movs r0, #0x86
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r6, r0]
_02249E32:
	movs r0, #0x87
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02249E48
	bl FUN_0201AB0C
	movs r0, #0x87
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r6, r0]
_02249E48:
	movs r0, #0x85
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r6, r0]
	ldr r0, [sp]
	bl FUN_0200E390
_02249E56:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02249DD8

	thumb_func_start ov02_02249E58
ov02_02249E58: @ 0x02249E58
	push {r4, lr}
	movs r0, #0x67
	adds r4, r1, #0
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200A7BC
	movs r1, #0x21
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _02249E8A
	bl FUN_0200ADA4
	ldr r0, _02249E8C @ =ov02_02249E90
	adds r1, r4, #0
	movs r2, #0x80
	bl FUN_0200E374
	movs r0, #0x21
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02249E8A:
	pop {r4, pc}
	.align 2, 0
_02249E8C: .4byte ov02_02249E90
	thumb_func_end ov02_02249E58

	thumb_func_start ov02_02249E90
ov02_02249E90: @ 0x02249E90
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x67
	adds r4, r1, #0
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200A7BC
	movs r1, #0x21
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	cmp r1, #1
	bne _02249EBE
	bl FUN_0200A740
	movs r0, #0x85
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r5, #0
	bl FUN_0200E390
_02249EBE:
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02249E90

	thumb_func_start ov02_02249EC0
ov02_02249EC0: @ 0x02249EC0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov02_0224A074
	movs r2, #3
	movs r3, #1
	adds r4, r0, #0
	lsls r2, r2, #0x12
	adds r0, r5, #0
	movs r1, #0
	lsls r3, r3, #0xc
	str r2, [sp]
	bl ov02_0224A69C
	adds r0, r5, #0
	bl ov02_0224A648
	ldr r0, [r5, #0x60]
	movs r1, #0
	ldr r0, [r0, #8]
	bl FUN_0201CC2C
	strh r0, [r5, #0x24]
	ldr r0, [r5, #0x60]
	movs r1, #3
	ldr r0, [r0, #8]
	bl FUN_0201CC2C
	strh r0, [r5, #0x26]
	ldr r2, _02249F68 @ =0x0400000A
	movs r1, #3
	ldrh r3, [r2]
	movs r0, #1
	bics r3, r1
	orrs r0, r3
	strh r0, [r2]
	ldrh r0, [r2, #4]
	bics r0, r1
	strh r0, [r2, #4]
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	adds r2, r5, #0
	adds r0, r4, #0
	movs r1, #2
	adds r2, #0x6c
	bl ov02_0224A570
	ldr r0, [r5, #0x60]
	adds r3, r5, #0
	ldr r0, [r0, #8]
	adds r1, r4, #0
	movs r2, #0
	adds r3, #0x68
	bl ov02_0224A598
	ldr r0, [r5, #0x60]
	adds r3, r5, #0
	ldr r0, [r0, #8]
	adds r1, r4, #0
	movs r2, #1
	adds r3, #0x64
	bl ov02_0224A5D0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov02_0224A080
	adds r0, r4, #0
	bl FUN_0200770C
	movs r0, #4
	movs r1, #0x20
	bl FUN_020689C8
	movs r1, #0x1e
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	pop {r3, r4, r5, pc}
	.align 2, 0
_02249F68: .4byte 0x0400000A
	thumb_func_end ov02_02249EC0

	thumb_func_start ov02_02249F6C
ov02_02249F6C: @ 0x02249F6C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov02_0224A074
	adds r4, r0, #0
	ldr r0, [r5, #0x60]
	movs r1, #0
	ldr r0, [r0, #8]
	bl FUN_0201CC2C
	strh r0, [r5, #0x24]
	ldr r0, [r5, #0x60]
	movs r1, #3
	ldr r0, [r0, #8]
	bl FUN_0201CC2C
	strh r0, [r5, #0x26]
	ldr r2, _02249FD0 @ =0x0400000A
	movs r1, #3
	ldrh r3, [r2]
	movs r0, #1
	bics r3, r1
	orrs r0, r3
	strh r0, [r2]
	ldrh r0, [r2, #4]
	bics r0, r1
	strh r0, [r2, #4]
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov02_0224A080
	adds r0, r4, #0
	bl FUN_0200770C
	movs r0, #4
	movs r1, #0x20
	bl FUN_020689C8
	movs r1, #0x1e
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	pop {r3, r4, r5, pc}
	.align 2, 0
_02249FD0: .4byte 0x0400000A
	thumb_func_end ov02_02249F6C

	thumb_func_start ov02_02249FD4
ov02_02249FD4: @ 0x02249FD4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_020689F8
	ldr r0, [r4, #0x60]
	ldr r0, [r0, #8]
	bl ov02_0224A63C
	adds r0, r4, #0
	bl ov02_0224A288
	ldr r2, _0224A024 @ =0x04000008
	ldrh r1, [r4, #0x24]
	ldrh r3, [r2]
	movs r0, #3
	bics r3, r0
	orrs r1, r3
	strh r1, [r2]
	ldrh r1, [r2, #6]
	bics r1, r0
	ldrh r0, [r4, #0x26]
	orrs r0, r1
	strh r0, [r2, #6]
	movs r0, #0
	movs r1, #1
	bl FUN_0205B4EC
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	pop {r4, pc}
	nop
_0224A024: .4byte 0x04000008
	thumb_func_end ov02_02249FD4

	thumb_func_start ov02_0224A028
ov02_0224A028: @ 0x0224A028
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_020689F8
	adds r0, r4, #0
	bl ov02_0224A288
	ldr r2, _0224A070 @ =0x04000008
	ldrh r1, [r4, #0x24]
	ldrh r3, [r2]
	movs r0, #3
	bics r3, r0
	orrs r1, r3
	strh r1, [r2]
	ldrh r1, [r2, #6]
	bics r1, r0
	ldrh r0, [r4, #0x26]
	orrs r0, r1
	strh r0, [r2, #6]
	movs r0, #0
	movs r1, #1
	bl FUN_0205B4EC
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	pop {r4, pc}
	nop
_0224A070: .4byte 0x04000008
	thumb_func_end ov02_0224A028

	thumb_func_start ov02_0224A074
ov02_0224A074: @ 0x0224A074
	ldr r3, _0224A07C @ =FUN_02007688
	movs r0, #0x5d
	movs r1, #4
	bx r3
	.align 2, 0
_0224A07C: .4byte FUN_02007688
	thumb_func_end ov02_0224A074

	thumb_func_start ov02_0224A080
ov02_0224A080: @ 0x0224A080
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r1, #0
	movs r1, #0x7e
	adds r5, r0, #0
	lsls r1, r1, #2
	adds r1, r5, r1
	bl ov02_0224A7A8
	adds r1, r5, #0
	movs r0, #0x20
	adds r1, #0x74
	movs r2, #4
	bl FUN_02009F40
	str r0, [r5, #0x70]
	adds r0, r5, #0
	movs r2, #2
	adds r0, #0x74
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r0, #4
	movs r1, #0
	adds r2, r0, #0
	bl FUN_0200A090
	movs r1, #0x67
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #3
	movs r1, #1
	movs r2, #4
	bl FUN_0200A090
	movs r1, #0x1a
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #4
	movs r1, #2
	adds r2, r0, #0
	bl FUN_0200A090
	movs r1, #0x69
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #2
	movs r1, #3
	movs r2, #4
	bl FUN_0200A090
	movs r1, #0x6a
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #4
	subs r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r6, #0
	movs r2, #0xe
	movs r3, #0
	bl FUN_0200A3C8
	movs r1, #0x6b
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldrh r2, [r5, #0xe]
	subs r1, #0x10
	ldr r0, [r5, r1]
	lsls r3, r2, #1
	ldr r2, _0224A278 @ =0x02253304
	adds r1, r6, #0
	ldrh r2, [r2, r3]
	movs r3, #0
	bl FUN_0200A3C8
	movs r1, #0x1b
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov02_0224A810
	movs r1, #0x6d
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #4
	subs r1, #0x14
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r6, #0
	movs r2, #6
	adds r3, r4, #0
	bl FUN_0200A480
	movs r1, #0x6f
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldrh r2, [r5, #0xe]
	adds r4, r4, #1
	cmp r2, #0
	beq _0224A196
	movs r0, #1
	subs r2, r2, #1
	str r0, [sp]
	lsls r3, r2, #1
	ldr r2, _0224A27C @ =0x022532FC
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #4
	ldrh r2, [r2, r3]
	subs r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r6, #0
	movs r3, #0
	bl FUN_0200A480
	lsls r1, r4, #2
	adds r2, r5, r1
	movs r1, #0x6f
	lsls r1, r1, #2
	str r0, [r2, r1]
	adds r4, r4, #1
_0224A196:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov02_0224A868
	lsls r1, r4, #2
	adds r2, r5, r1
	movs r1, #0x6f
	lsls r1, r1, #2
	str r0, [r2, r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #4
	subs r1, #0x18
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r6, #0
	movs r2, #0xf
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x72
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldrh r2, [r5, #0xe]
	subs r1, #0x24
	ldr r0, [r5, r1]
	lsls r3, r2, #1
	ldr r2, _0224A280 @ =0x02253310
	adds r1, r6, #0
	ldrh r2, [r2, r3]
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x73
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #4
	subs r1, #0x28
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r6, #0
	movs r2, #0xa
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x1d
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r3, #0
	str r3, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #4
	subs r1, #0x28
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r6, #0
	movs r2, #0x10
	bl FUN_0200A540
	movs r1, #0x76
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldrh r2, [r5, #0xe]
	subs r1, #0x30
	ldr r0, [r5, r1]
	lsls r3, r2, #1
	ldr r2, _0224A284 @ =0x0225330A
	adds r1, r6, #0
	ldrh r2, [r2, r3]
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x77
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r1, #0x1c
	ldr r0, [r5, #0x5c]
	adds r1, r5, r1
	movs r2, #4
	bl ov02_0224A7B8
	movs r1, #0x86
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0x20
	adds r0, r5, r1
	movs r1, #4
	bl ov02_0224A800
	movs r1, #0x87
	lsls r1, r1, #2
	str r0, [r5, r1]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0224A278: .4byte 0x02253304
_0224A27C: .4byte 0x022532FC
_0224A280: .4byte 0x02253310
_0224A284: .4byte 0x0225330A
	thumb_func_end ov02_0224A080

	thumb_func_start ov02_0224A288
ov02_0224A288: @ 0x0224A288
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0x6b
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_0224A294:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0224A29E
	bl FUN_0200AEB0
_0224A29E:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0224A294
	movs r7, #0x6f
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_0224A2AE:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _0224A2B8
	bl FUN_0200B0A8
_0224A2B8:
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #3
	blt _0224A2AE
	movs r7, #0x72
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_0224A2C8:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _0224A2D2
	bl FUN_0200A740
_0224A2D2:
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #4
	blt _0224A2C8
	movs r7, #0x76
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_0224A2E2:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _0224A2EC
	bl FUN_0200A740
_0224A2EC:
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #2
	blt _0224A2E2
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200A0D0
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_0200A0D0
	movs r0, #0x69
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200A0D0
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200A0D0
	ldr r0, [r6, #0x70]
	bl FUN_02024544
	ldr r0, [r6, #0x70]
	bl FUN_02024504
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224A288

	thumb_func_start ov02_0224A32C
ov02_0224A32C: @ 0x0224A32C
	push {r3, lr}
	ldr r0, [r0, #0x70]
	cmp r0, #0
	beq _0224A338
	bl FUN_0202457C
_0224A338:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_0224A32C

	thumb_func_start ov02_0224A33C
ov02_0224A33C: @ 0x0224A33C
	push {r4, r5, r6, lr}
	sub sp, #0x70
	adds r5, r0, #0
	ldr r0, [sp, #0x84]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	cmp r0, #4
	bne _0224A384
	movs r0, #0
	mvns r0, r0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	movs r6, #0x67
	ldr r3, [sp, #0x88]
	str r0, [sp, #0xc]
	lsls r6, r6, #2
	str r3, [sp, #0x10]
	ldr r3, [r5, r6]
	str r3, [sp, #0x14]
	adds r3, r6, #4
	ldr r3, [r5, r3]
	adds r6, #8
	str r3, [sp, #0x18]
	ldr r3, [r5, r6]
	str r3, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r3, [sp, #0x80]
	add r0, sp, #0x4c
	bl FUN_02009D48
	b _0224A3BE
_0224A384:
	str r0, [sp]
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0
	ldr r0, [sp, #0x88]
	str r3, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r6, [r5, r0]
	str r6, [sp, #0x14]
	adds r6, r0, #4
	ldr r6, [r5, r6]
	str r6, [sp, #0x18]
	adds r6, r0, #0
	adds r6, #8
	ldr r6, [r5, r6]
	adds r0, #0xc
	str r6, [sp, #0x1c]
	ldr r0, [r5, r0]
	str r0, [sp, #0x20]
	str r3, [sp, #0x24]
	str r3, [sp, #0x28]
	ldr r3, [sp, #0x80]
	add r0, sp, #0x4c
	bl FUN_02009D48
_0224A3BE:
	ldr r0, [r5, #0x70]
	add r2, sp, #0x34
	str r0, [sp, #0x2c]
	add r0, sp, #0x4c
	str r0, [sp, #0x30]
	ldm r4!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	ldr r0, [sp, #0x8c]
	str r0, [sp, #0x40]
	movs r0, #1
	str r0, [sp, #0x44]
	movs r0, #4
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	bl FUN_02024714
	adds r4, r0, #0
	bne _0224A3EA
	bl GF_AssertFail
_0224A3EA:
	adds r0, r4, #0
	add sp, #0x70
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_0224A33C

	thumb_func_start ov02_0224A3F0
ov02_0224A3F0: @ 0x0224A3F0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	movs r5, #1
	adds r4, r3, #0
	str r5, [sp]
	movs r3, #0
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	adds r2, r5, #0
	bl ov02_0224A33C
	adds r1, r4, #0
	adds r5, r0, #0
	bl FUN_020248F0
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224A3F0

	thumb_func_start ov02_0224A418
ov02_0224A418: @ 0x0224A418
	push {r4, lr}
	sub sp, #0x10
	ldrh r2, [r0, #0xe]
	movs r3, #0
	cmp r2, #0
	beq _0224A426
	movs r3, #1
_0224A426:
	movs r2, #2
	str r2, [sp]
	movs r4, #1
	str r4, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r4, #0x83
	str r4, [sp, #0xc]
	bl ov02_0224A33C
	adds r4, r0, #0
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #6
	bl FUN_020248F0
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov02_0224A418

	thumb_func_start ov02_0224A450
ov02_0224A450: @ 0x0224A450
	push {r4, lr}
	movs r1, #1
	adds r4, r0, #0
	bl FUN_0202484C
	movs r1, #1
	adds r0, r4, #0
	lsls r1, r1, #0xc
	bl FUN_02024868
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224A450

	thumb_func_start ov02_0224A468
ov02_0224A468: @ 0x0224A468
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r4, r0, #0
	add r0, sp, #0x1c
	movs r7, #0
	str r7, [r0]
	str r7, [r0, #4]
	adds r6, r2, #0
	ldr r5, _0224A4CC @ =0x02253390
	adds r3, r1, #0
	str r7, [r0, #8]
	ldm r5!, {r0, r1}
	add r2, sp, #0x10
	stm r2!, {r0, r1}
	ldr r0, [r5]
	adds r1, r3, #0
	str r0, [r2]
	str r7, [sp]
	subs r0, r7, #1
	str r0, [sp, #4]
	str r7, [sp, #8]
	adds r0, r4, #0
	adds r2, r7, #0
	adds r3, r7, #0
	str r6, [sp, #0xc]
	bl ov02_0224A33C
	adds r4, r0, #0
	movs r1, #2
	bl FUN_0202487C
	adds r0, r4, #0
	add r1, sp, #0x1c
	bl FUN_020247E4
	adds r0, r4, #0
	add r1, sp, #0x10
	bl FUN_020247F4
	adds r0, r7, #0
	bl FUN_0201FD00
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02024818
	adds r0, r4, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224A4CC: .4byte 0x02253390
	thumb_func_end ov02_0224A468

	thumb_func_start ov02_0224A4D0
ov02_0224A4D0: @ 0x0224A4D0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov02_0224A074
	adds r6, r0, #0
	movs r0, #0x6b
	movs r5, #0
	adds r2, r4, #0
	lsls r0, r0, #2
_0224A4E4:
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _0224A510
	movs r3, #0
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r6, #0
	movs r2, #0xb
	bl FUN_0200A3C8
	lsls r1, r5, #2
	adds r2, r4, r1
	movs r1, #0x6b
	lsls r1, r1, #2
	str r0, [r2, r1]
	b _0224A518
_0224A510:
	adds r5, r5, #1
	adds r2, r2, #4
	cmp r5, #4
	blt _0224A4E4
_0224A518:
	cmp r5, #4
	blt _0224A520
	bl GF_AssertFail
_0224A520:
	movs r0, #0x72
	movs r5, #0
	adds r2, r4, #0
	lsls r0, r0, #2
_0224A528:
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _0224A554
	movs r3, #0
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x69
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r6, #0
	movs r2, #0xc
	bl FUN_0200A540
	lsls r1, r5, #2
	adds r2, r4, r1
	movs r1, #0x72
	lsls r1, r1, #2
	str r0, [r2, r1]
	b _0224A55C
_0224A554:
	adds r5, r5, #1
	adds r2, r2, #4
	cmp r5, #4
	blt _0224A528
_0224A55C:
	cmp r5, #4
	blt _0224A564
	bl GF_AssertFail
_0224A564:
	adds r0, r6, #0
	bl FUN_0200770C
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_0224A4D0

	thumb_func_start ov02_0224A570
ov02_0224A570: @ 0x0224A570
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	movs r2, #4
	bl FUN_0200771C
	adds r1, r5, #0
	adds r4, r0, #0
	blx FUN_020B7140
	ldr r1, [r5]
	movs r0, #3
	ldr r1, [r1, #0xc]
	movs r2, #0x20
	lsls r3, r0, #7
	bl FUN_0201C260
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224A570

	thumb_func_start ov02_0224A598
ov02_0224A598: @ 0x0224A598
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r4, r3, #0
	movs r2, #4
	bl FUN_0200771C
	adds r1, r4, #0
	adds r6, r0, #0
	blx FUN_020B70A8
	ldr r3, [r4]
	movs r0, #0
	str r0, [sp]
	ldr r2, [r3, #0x14]
	ldr r3, [r3, #0x10]
	adds r0, r5, #0
	movs r1, #3
	bl FUN_0201C0C0
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_0224A598

	thumb_func_start ov02_0224A5D0
ov02_0224A5D0: @ 0x0224A5D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r2, #0
	adds r6, r1, #0
	movs r2, #0
	adds r4, r3, #0
	movs r1, #3
	adds r3, r2, #0
	adds r5, r0, #0
	bl FUN_0201BC8C
	movs r1, #3
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #4
	bl FUN_0200771C
	adds r1, r4, #0
	adds r6, r0, #0
	blx FUN_020B71D8
	ldr r3, [r4]
	adds r0, r5, #0
	adds r2, r3, #0
	ldr r3, [r3, #8]
	movs r1, #3
	adds r2, #0xc
	bl FUN_0201C0A8
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xc
	movs r2, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201CA4C
	adds r0, r5, #0
	movs r1, #3
	bl FUN_0201BF7C
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224A5D0

	thumb_func_start ov02_0224A63C
ov02_0224A63C: @ 0x0224A63C
	ldr r3, _0224A644 @ =FUN_0201CAE0
	movs r1, #3
	bx r3
	nop
_0224A644: .4byte FUN_0201CAE0
	thumb_func_end ov02_0224A63C

	thumb_func_start ov02_0224A648
ov02_0224A648: @ 0x0224A648
	push {r4, lr}
	adds r4, r0, #0
	bl ov02_0224A6A8
	movs r0, #0
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl ov02_0224A674
	adds r0, r4, #0
	bl ov02_0224A67C
	adds r0, r4, #0
	bl ov02_0224A66C
	movs r0, #1
	str r0, [r4, #0x2c]
	pop {r4, pc}
	thumb_func_end ov02_0224A648

	thumb_func_start ov02_0224A66C
ov02_0224A66C: @ 0x0224A66C
	movs r1, #1
	str r1, [r0, #0x30]
	bx lr
	.align 2, 0
	thumb_func_end ov02_0224A66C

	thumb_func_start ov02_0224A674
ov02_0224A674: @ 0x0224A674
	movs r1, #0
	str r1, [r0, #0x30]
	bx lr
	.align 2, 0
	thumb_func_end ov02_0224A674

	thumb_func_start ov02_0224A67C
ov02_0224A67C: @ 0x0224A67C
	movs r1, #0x18
	str r1, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x38]
	movs r1, #0x17
	str r1, [r0, #0x3c]
	movs r1, #1
	str r1, [r0, #0x40]
	bx lr
	.align 2, 0
	thumb_func_end ov02_0224A67C

	thumb_func_start ov02_0224A690
ov02_0224A690: @ 0x0224A690
	movs r1, #0x17
	str r1, [r0, #0x3c]
	movs r1, #1
	str r1, [r0, #0x40]
	bx lr
	.align 2, 0
	thumb_func_end ov02_0224A690

	thumb_func_start ov02_0224A69C
ov02_0224A69C: @ 0x0224A69C
	str r1, [r0, #0x44]
	str r3, [r0, #0x48]
	ldr r1, [sp]
	str r2, [r0, #0x4c]
	str r1, [r0, #0x50]
	bx lr
	thumb_func_end ov02_0224A69C

	thumb_func_start ov02_0224A6A8
ov02_0224A6A8: @ 0x0224A6A8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224A6BA
	bl GF_AssertFail
_0224A6BA:
	ldr r0, _0224A6CC @ =ov02_0224A700
	adds r1, r4, #0
	movs r2, #0x81
	bl FUN_0200E33C
	movs r1, #0x89
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_0224A6CC: .4byte ov02_0224A700
	thumb_func_end ov02_0224A6A8

	thumb_func_start ov02_0224A6D0
ov02_0224A6D0: @ 0x0224A6D0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0224A6E2
	bl GF_AssertFail
_0224A6E2:
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200E390
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0224A6FC @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	pop {r4, pc}
	nop
_0224A6FC: .4byte 0xFFFF1FFF
	thumb_func_end ov02_0224A6D0

	thumb_func_start ov02_0224A700
ov02_0224A700: @ 0x0224A700
	push {r3, r4, r5, r6}
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _0224A796
	movs r3, #1
	lsls r3, r3, #0x1a
	ldr r2, [r3]
	ldr r0, _0224A79C @ =0xFFFF1FFF
	ands r2, r0
	ldr r0, [r1, #0x30]
	lsls r0, r0, #0xd
	orrs r0, r2
	str r0, [r3]
	adds r3, #0x48
	ldrh r2, [r3]
	movs r0, #0x3f
	bics r2, r0
	ldr r0, [r1, #0x34]
	orrs r2, r0
	ldr r0, [r1, #0x38]
	cmp r0, #0
	beq _0224A730
	movs r0, #0x20
	orrs r2, r0
_0224A730:
	ldr r0, _0224A7A0 @ =0x04000048
	strh r2, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0x3f
	bics r2, r0
	ldr r0, [r1, #0x3c]
	orrs r2, r0
	ldr r0, [r1, #0x40]
	cmp r0, #0
	beq _0224A748
	movs r0, #0x20
	orrs r2, r0
_0224A748:
	ldr r5, _0224A7A4 @ =0x0400004A
	strh r2, [r5]
	ldr r2, [r1, #0x50]
	ldr r6, [r1, #0x48]
	asrs r0, r2, #0xb
	lsrs r0, r0, #0x14
	adds r0, r2, r0
	ldr r2, [r1, #0x4c]
	asrs r4, r0, #0xc
	asrs r0, r2, #0xb
	lsrs r0, r0, #0x14
	adds r0, r2, r0
	ldr r2, [r1, #0x44]
	asrs r3, r0, #0xc
	asrs r0, r2, #0xb
	lsrs r0, r0, #0x14
	asrs r1, r6, #0xb
	adds r0, r2, r0
	lsrs r1, r1, #0x14
	asrs r0, r0, #0xc
	adds r1, r6, r1
	lsls r2, r0, #8
	movs r0, #0xff
	asrs r1, r1, #0xc
	lsls r0, r0, #8
	lsls r1, r1, #0x18
	ands r2, r0
	lsrs r1, r1, #0x18
	orrs r2, r1
	adds r1, r5, #0
	subs r1, #0xa
	strh r2, [r1]
	lsls r1, r3, #8
	ands r1, r0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	orrs r1, r0
	subs r0, r5, #6
	strh r1, [r0]
_0224A796:
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0224A79C: .4byte 0xFFFF1FFF
_0224A7A0: .4byte 0x04000048
_0224A7A4: .4byte 0x0400004A
	thumb_func_end ov02_0224A700

	thumb_func_start ov02_0224A7A8
ov02_0224A7A8: @ 0x0224A7A8
	ldr r3, _0224A7B4 @ =FUN_02070124
	adds r2, r0, #0
	adds r0, r1, #0
	ldr r1, [r2, #0x5c]
	movs r2, #2
	bx r3
	.align 2, 0
_0224A7B4: .4byte FUN_02070124
	thumb_func_end ov02_0224A7A8

	thumb_func_start ov02_0224A7B8
ov02_0224A7B8: @ 0x0224A7B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	movs r1, #0x32
	adds r6, r0, #0
	movs r0, #4
	lsls r1, r1, #6
	adds r7, r2, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _0224A7D4
	bl GF_AssertFail
_0224A7D4:
	movs r1, #0
	adds r0, r6, #0
	adds r2, r1, #0
	bl FUN_0206E540
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldrh r0, [r5, #6]
	adds r2, r7, #0
	adds r3, r4, #0
	str r0, [sp, #0xc]
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	bl FUN_02014540
	adds r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224A7B8

	thumb_func_start ov02_0224A800
ov02_0224A800: @ 0x0224A800
	adds r3, r0, #0
	adds r2, r1, #0
	ldrh r0, [r3]
	ldrh r1, [r3, #4]
	ldr r3, _0224A80C @ =FUN_02014450
	bx r3
	.align 2, 0
_0224A80C: .4byte FUN_02014450
	thumb_func_end ov02_0224A800

	thumb_func_start ov02_0224A810
ov02_0224A810: @ 0x0224A810
	push {lr}
	sub sp, #0xc
	movs r2, #3
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r2, #4
	str r2, [sp, #8]
	movs r2, #0x67
	lsls r2, r2, #2
	ldr r0, [r0, r2]
	movs r2, #9
	movs r3, #0
	bl FUN_0200A3C8
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov02_0224A810

	thumb_func_start ov02_0224A834
ov02_0224A834: @ 0x0224A834
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0x67
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #3
	bl FUN_0200A7BC
	bl FUN_0200AF00
	movs r1, #1
	blx FUN_020B802C
	movs r1, #0x32
	adds r5, r0, #0
	adds r0, r4, #0
	lsls r1, r1, #6
	blx FUN_020D2894
	movs r2, #0x32
	adds r0, r4, #0
	adds r1, r5, #0
	lsls r2, r2, #6
	blx FUN_020CFE74
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224A834

	thumb_func_start ov02_0224A868
ov02_0224A868: @ 0x0224A868
	push {r3, lr}
	sub sp, #0x10
	movs r2, #3
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #4
	str r2, [sp, #0xc]
	movs r2, #0x1a
	lsls r2, r2, #4
	ldr r0, [r0, r2]
	movs r2, #6
	movs r3, #0
	bl FUN_0200A480
	add sp, #0x10
	pop {r3, pc}
	thumb_func_end ov02_0224A868

	thumb_func_start ov02_0224A88C
ov02_0224A88C: @ 0x0224A88C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x67
	lsls r0, r0, #2
	adds r4, r1, #0
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0200A7BC
	bl FUN_0200AF00
	adds r6, r0, #0
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0200A7BC
	adds r1, r6, #0
	bl FUN_0200B0F8
	movs r1, #1
	blx FUN_020B8078
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	blx FUN_020D2894
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x20
	blx FUN_020CFD18
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_0224A88C

	thumb_func_start ov02_0224A8D4
ov02_0224A8D4: @ 0x0224A8D4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0200A7BC
	adds r4, r0, #0
	bl FUN_0200AEB0
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200A75C
	movs r1, #0x6b
	movs r0, #0
	adds r3, r5, #0
	lsls r1, r1, #2
_0224A8FE:
	ldr r2, [r3, r1]
	cmp r2, r4
	bne _0224A912
	lsls r1, r0, #2
	adds r2, r5, r1
	movs r1, #0x6b
	movs r3, #0
	lsls r1, r1, #2
	str r3, [r2, r1]
	b _0224A91A
_0224A912:
	adds r0, r0, #1
	adds r3, r3, #4
	cmp r0, #4
	blt _0224A8FE
_0224A91A:
	cmp r0, #4
	blt _0224A922
	bl GF_AssertFail
_0224A922:
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0200A7BC
	adds r4, r0, #0
	bl FUN_0200B0A8
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200A75C
	movs r1, #0x6f
	movs r0, #0
	adds r3, r5, #0
	lsls r1, r1, #2
_0224A948:
	ldr r2, [r3, r1]
	cmp r2, r4
	bne _0224A95C
	lsls r1, r0, #2
	adds r2, r5, r1
	movs r1, #0x6f
	movs r3, #0
	lsls r1, r1, #2
	str r3, [r2, r1]
	b _0224A964
_0224A95C:
	adds r0, r0, #1
	adds r3, r3, #4
	cmp r0, #3
	blt _0224A948
_0224A964:
	cmp r0, #3
	blt _0224A96C
	bl GF_AssertFail
_0224A96C:
	movs r0, #0x69
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0200A7BC
	adds r4, r0, #0
	bl FUN_0200A740
	movs r0, #0x69
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200A75C
	movs r1, #0x72
	movs r0, #0
	adds r3, r5, #0
	lsls r1, r1, #2
_0224A992:
	ldr r2, [r3, r1]
	cmp r2, r4
	bne _0224A9A6
	lsls r1, r0, #2
	adds r2, r5, r1
	movs r1, #0x72
	movs r3, #0
	lsls r1, r1, #2
	str r3, [r2, r1]
	b _0224A9AE
_0224A9A6:
	adds r0, r0, #1
	adds r3, r3, #4
	cmp r0, #4
	blt _0224A992
_0224A9AE:
	cmp r0, #4
	blt _0224A9B6
	bl GF_AssertFail
_0224A9B6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224A8D4

	thumb_func_start ov02_0224A9B8
ov02_0224A9B8: @ 0x0224A9B8
	push {r3, lr}
	sub sp, #0x10
	movs r2, #3
	str r2, [sp]
	subs r3, r2, #4
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	movs r3, #0x81
	str r3, [sp, #0xc]
	adds r3, r2, #0
	bl ov02_0224A33C
	add sp, #0x10
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_0224A9B8

	thumb_func_start ov02_0224A9D8
ov02_0224A9D8: @ 0x0224A9D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	movs r0, #2
	ldr r4, _0224AA40 @ =0x022535E4
	adds r6, r1, #0
	str r0, [r5, #0x14]
	movs r7, #0
_0224A9E8:
	ldr r0, [r4]
	add r1, sp, #0x1c
	str r0, [sp, #0x1c]
	ldr r0, [r4, #4]
	add r2, sp, #0x10
	str r0, [sp, #0x20]
	movs r0, #0
	str r0, [sp, #0x24]
	ldr r0, [r4, #8]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	ldr r0, [r4, #0xc]
	str r0, [sp, #8]
	ldr r0, [r4, #0x10]
	ldr r3, [sp, #8]
	str r0, [sp]
	str r0, [sp, #0xc]
	str r6, [sp, #4]
	adds r0, r5, #0
	bl ov02_0224AA44
	movs r0, #1
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0x14
	adds r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #8]
	str r0, [sp]
	adds r0, r5, #0
	add r1, sp, #0x1c
	add r2, sp, #0x10
	str r6, [sp, #4]
	bl ov02_0224AA44
	adds r7, r7, #1
	adds r4, #0x14
	cmp r7, #0xd
	blt _0224A9E8
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224AA40: .4byte 0x022535E4
	thumb_func_end ov02_0224A9D8

	thumb_func_start ov02_0224AA44
ov02_0224AA44: @ 0x0224AA44
	push {r3, r4, r5, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [sp, #0x34]
	str r3, [sp, #8]
	str r5, [sp, #0x10]
	adds r4, r1, #0
	str r0, [sp, #0xc]
	ldm r2!, {r0, r1}
	add r3, sp, #0x14
	stm r3!, {r0, r1}
	ldr r0, [r2]
	ldr r1, _0224AA7C @ =0x02253468
	str r0, [r3]
	add r0, sp, #8
	str r0, [sp]
	movs r0, #0x85
	str r0, [sp, #4]
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x30]
	adds r2, r4, #0
	bl FUN_02068B0C
	add sp, #0x20
	pop {r3, r4, r5, pc}
	nop
_0224AA7C: .4byte 0x02253468
	thumb_func_end ov02_0224AA44

	thumb_func_start ov02_0224AA80
ov02_0224AA80: @ 0x0224AA80
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	bl FUN_02068D98
	adds r2, r4, #0
	adds r3, r0, #0
	adds r2, #0xc
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	adds r0, r5, #0
	bl FUN_02068D90
	str r0, [r4, #4]
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_02068DB8
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0xc]
	ldr r3, [r4, #4]
	add r1, sp, #0
	bl ov02_0224A3F0
	movs r1, #0
	str r0, [r4, #8]
	bl FUN_02024830
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov02_0224AA80

	thumb_func_start ov02_0224AAC8
ov02_0224AAC8: @ 0x0224AAC8
	ldr r3, _0224AAD0 @ =FUN_02024758
	ldr r0, [r1, #8]
	bx r3
	nop
_0224AAD0: .4byte FUN_02024758
	thumb_func_end ov02_0224AAC8

	thumb_func_start ov02_0224AAD4
ov02_0224AAD4: @ 0x0224AAD4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r1, #0
	add r1, sp, #0
	adds r5, r0, #0
	bl FUN_02068DB8
	ldr r1, [sp]
	ldr r0, [r4, #0x18]
	adds r0, r1, r0
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0xb
	str r0, [sp]
	subs r1, r1, r2
	movs r0, #0xb
	rors r1, r0
	adds r0, r2, r1
	str r0, [sp]
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_02068DA8
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl FUN_020247D4
	ldr r0, [r4, #0x10]
	cmp r0, #1
	bne _0224AB4E
	ldr r3, [r4, #0x14]
	ldr r0, [r3, #0x14]
	cmp r0, #2
	bne _0224AB42
	ldr r2, [r3, #0x4c]
	ldr r0, [r3, #0x50]
	movs r3, #2
	ldr r6, [sp, #4]
	lsls r3, r3, #0xc
	subs r5, r6, r3
	movs r1, #0
	cmp r5, r2
	blt _0224AB38
	cmp r5, r0
	bgt _0224AB38
	adds r3, r6, r3
	cmp r3, r2
	blt _0224AB38
	cmp r3, r0
	bgt _0224AB38
	movs r1, #1
_0224AB38:
	ldr r0, [r4, #8]
	bl FUN_02024830
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0224AB42:
	cmp r0, #1
	bne _0224AB4E
	ldr r0, [r4, #8]
	movs r1, #0
	bl FUN_02024830
_0224AB4E:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_0224AAD4

	thumb_func_start ov02_0224AB54
ov02_0224AB54: @ 0x0224AB54
	bx lr
	.align 2, 0
	thumb_func_end ov02_0224AB54

	thumb_func_start ov02_0224AB58
ov02_0224AB58: @ 0x0224AB58
	push {r4, lr}
	sub sp, #0x18
	add r2, sp, #0xc
	movs r3, #0
	adds r4, r0, #0
	str r3, [r2]
	str r3, [r2, #4]
	str r3, [r2, #8]
	str r4, [sp, #8]
	add r0, sp, #8
	str r0, [sp]
	movs r0, #0x82
	str r0, [sp, #4]
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, _0224AB88 @ =0x0225347C
	bl FUN_02068B0C
	movs r1, #0x7b
	lsls r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
_0224AB88: .4byte 0x0225347C
	thumb_func_end ov02_0224AB58

	thumb_func_start ov02_0224AB8C
ov02_0224AB8C: @ 0x0224AB8C
	push {r3, lr}
	movs r1, #0x7b
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_02068D74
	ldrb r0, [r0, #2]
	pop {r3, pc}
	thumb_func_end ov02_0224AB8C

	thumb_func_start ov02_0224AB9C
ov02_0224AB9C: @ 0x0224AB9C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02068D74
	adds r5, r0, #0
	ldr r0, [r5, #0x60]
	cmp r0, #0
	beq _0224ABB6
	bl FUN_02068B48
_0224ABB6:
	ldr r0, [r5, #0x64]
	cmp r0, #0
	beq _0224ABC0
	bl FUN_021FCD78
_0224ABC0:
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02068B48
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224AB9C

	thumb_func_start ov02_0224ABCC
ov02_0224ABCC: @ 0x0224ABCC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02068D98
	ldr r0, [r0]
	add r1, sp, #0
	str r0, [r4, #0x5c]
	adds r0, r5, #0
	bl FUN_02068DB8
	movs r2, #0
	ldr r0, [r4, #0x5c]
	add r1, sp, #0
	adds r3, r2, #0
	bl ov02_0224A468
	str r0, [r4, #0x58]
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov02_0224ABCC

	thumb_func_start ov02_0224ABF8
ov02_0224ABF8: @ 0x0224ABF8
	ldr r3, _0224AC00 @ =FUN_02024758
	ldr r0, [r1, #0x58]
	bx r3
	nop
_0224AC00: .4byte FUN_02024758
	thumb_func_end ov02_0224ABF8

	thumb_func_start ov02_0224AC04
ov02_0224AC04: @ 0x0224AC04
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldrb r0, [r5]
	lsls r1, r0, #2
	ldr r0, _0224AC20 @ =0x022533C0
	ldr r4, [r0, r1]
_0224AC10:
	ldrb r1, [r5, #1]
	adds r0, r5, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _0224AC10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224AC20: .4byte 0x022533C0
	thumb_func_end ov02_0224AC04

	thumb_func_start ov02_0224AC24
ov02_0224AC24: @ 0x0224AC24
	bx lr
	.align 2, 0
	thumb_func_end ov02_0224AC24

	thumb_func_start ov02_0224AC28
ov02_0224AC28: @ 0x0224AC28
	push {r3, lr}
	movs r1, #0
	strb r1, [r0, #2]
	ldr r0, [r0, #0x58]
	bl FUN_02024830
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov02_0224AC28

	thumb_func_start ov02_0224AC38
ov02_0224AC38: @ 0x0224AC38
	push {r4, r5, r6, lr}
	sub sp, #0x18
	ldr r4, _0224ACD8 @ =0x022533E4
	adds r2, r0, #0
	ldm r4!, {r0, r1}
	add r3, sp, #0xc
	stm r3!, {r0, r1}
	ldr r0, [r4]
	ldr r4, _0224ACDC @ =0x022533F0
	str r0, [r3]
	ldm r4!, {r0, r1}
	add r3, sp, #0
	stm r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	bl FUN_02068D74
	adds r4, r0, #0
	movs r3, #1
	adds r5, r4, #0
	strb r3, [r4]
	movs r2, #0
	strb r2, [r4, #1]
	strb r2, [r4, #2]
	add r6, sp, #0xc
	ldm r6!, {r0, r1}
	adds r5, #8
	stm r5!, {r0, r1}
	ldr r0, [r6]
	add r6, sp, #0
	str r0, [r5]
	str r2, [r4, #0x14]
	str r2, [r4, #0x18]
	movs r0, #0xf
	adds r5, r4, #0
	str r2, [r4, #0x1c]
	lsls r0, r0, #0xe
	str r0, [r4, #0x38]
	ldm r6!, {r0, r1}
	adds r5, #0x2c
	stm r5!, {r0, r1}
	ldr r0, [r6]
	add r1, sp, #0xc
	str r0, [r5]
	lsls r0, r3, #9
	str r0, [r4, #0x50]
	movs r0, #0x2d
	lsls r0, r0, #0xe
	str r0, [r4, #0x40]
	str r2, [r4, #0x48]
	lsls r0, r3, #0xd
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x58]
	bl FUN_020247D4
	ldr r0, [r4, #0x58]
	add r1, sp, #0
	bl FUN_020247F4
	ldr r1, [r4, #0x38]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FD00
	adds r1, r0, #0
	ldr r0, [r4, #0x58]
	bl FUN_02024818
	ldr r0, [r4, #0x58]
	movs r1, #1
	bl FUN_02024830
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.align 2, 0
_0224ACD8: .4byte 0x022533E4
_0224ACDC: .4byte 0x022533F0
	thumb_func_end ov02_0224AC38

	thumb_func_start ov02_0224ACE0
ov02_0224ACE0: @ 0x0224ACE0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	ldr r4, [r5, #0x58]
	adds r0, r1, r0
	str r0, [r5, #0x48]
	movs r0, #1
	ldr r1, [r5, #0x4c]
	lsls r0, r0, #0x10
	cmp r1, r0
	bge _0224AD00
	lsrs r0, r0, #2
	adds r0, r1, r0
	str r0, [r5, #0x4c]
_0224AD00:
	ldr r0, _0224ADE0 @ =0x0000013B
	bl FUN_0201FCC0
	ldr r2, [r5, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x40]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r2, [r5, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r5, #0x18]
	ldr r1, [r5, #0x40]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r2, r0, #0xc
	ldr r0, _0224ADE4 @ =0x0000010E
	cmp r2, r0
	bge _0224AD4A
	movs r0, #1
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [r5, #0x40]
_0224AD4A:
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x50]
	adds r1, r1, r0
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [r5, #0x2c]
	cmp r1, r0
	ble _0224AD5C
	str r0, [r5, #0x2c]
_0224AD5C:
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x50]
	adds r1, r1, r0
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [r5, #0x30]
	cmp r1, r0
	ble _0224AD6E
	str r0, [r5, #0x30]
_0224AD6E:
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x2c
	bl FUN_020247F4
	movs r0, #6
	ldr r1, [r5, #0x38]
	lsls r0, r0, #0xc
	subs r1, r1, r0
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	str r1, [r5, #0x38]
	asrs r0, r0, #0xc
	bpl _0224AD90
	movs r0, #0
	str r0, [r5, #0x38]
_0224AD90:
	ldr r1, [r5, #0x38]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FD00
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02024818
	ldr r1, [r5, #8]
	ldr r0, [r5, #0x14]
	adds r0, r1, r0
	str r0, [sp]
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x18]
	adds r0, r1, r0
	str r0, [sp, #4]
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_020247D4
	ldr r1, [sp, #4]
	ldr r0, _0224ADE8 @ =0xFFFC0000
	cmp r1, r0
	bge _0224ADDA
	adds r0, r4, #0
	movs r1, #0
	bl FUN_02024830
	movs r0, #2
	strb r0, [r5, #2]
	ldrb r0, [r5, #1]
	adds r0, r0, #1
	strb r0, [r5, #1]
_0224ADDA:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0224ADE0: .4byte 0x0000013B
_0224ADE4: .4byte 0x0000010E
_0224ADE8: .4byte 0xFFFC0000
	thumb_func_end ov02_0224ACE0

	thumb_func_start ov02_0224ADEC
ov02_0224ADEC: @ 0x0224ADEC
	movs r0, #0
	bx lr
	thumb_func_end ov02_0224ADEC

	thumb_func_start ov02_0224ADF0
ov02_0224ADF0: @ 0x0224ADF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r3, _0224AF5C @ =0x02253354
	adds r5, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x24
	stm r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _0224AF60 @ =0x0225336C
	str r0, [r2]
	ldm r3!, {r0, r1}
	add r2, sp, #0x18
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02068D74
	adds r4, r0, #0
	movs r0, #2
	strb r0, [r4]
	movs r6, #0
	movs r0, #0xbb
	strb r6, [r4, #1]
	movs r7, #1
	strb r7, [r4, #2]
	str r6, [r4, #4]
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	ldr r2, [sp, #0x24]
	adds r0, #8
	adds r1, r2, r1
	str r1, [sp, #0x24]
	adds r2, r4, #0
	ldr r1, [sp, #0x28]
	ldr r0, [r5, r0]
	add r3, sp, #0x24
	adds r0, r1, r0
	str r0, [sp, #0x28]
	ldm r3!, {r0, r1}
	adds r2, #8
	stm r2!, {r0, r1}
	ldr r0, [r3]
	add r3, sp, #0x18
	str r0, [r2]
	str r6, [r4, #0x14]
	str r6, [r4, #0x18]
	str r6, [r4, #0x1c]
	ldr r6, _0224AF64 @ =0x0013B000
	adds r2, r4, #0
	str r6, [r4, #0x38]
	ldm r3!, {r0, r1}
	adds r2, #0x2c
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	adds r0, r7, #0
	adds r0, #0xff
	str r0, [r4, #0x50]
	movs r0, #0xe1
	lsls r0, r0, #0xc
	str r0, [r4, #0x40]
	movs r0, #3
	lsls r0, r0, #0x12
	str r0, [r4, #0x48]
	lsls r0, r7, #0x11
	str r0, [r4, #0x4c]
	lsrs r0, r6, #0xc
	bl FUN_0201FCC0
	ldr r2, [r4, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x40]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r2, [r4, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r4, #0x18]
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x14]
	adds r0, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x18]
	adds r0, r1, r0
	str r0, [sp, #0x28]
	ldr r0, [r4, #0x58]
	add r1, sp, #0x24
	bl FUN_020247D4
	ldr r0, [r4, #0x58]
	add r1, sp, #0x18
	bl FUN_020247F4
	ldr r1, [r4, #0x38]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FD00
	adds r1, r0, #0
	ldr r0, [r4, #0x58]
	bl FUN_02024818
	ldr r0, [r4, #0x58]
	adds r1, r7, #0
	bl FUN_02024830
	movs r1, #0x1e
	lsls r1, r1, #4
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl ov02_0224B298
	str r0, [r4, #0x60]
	adds r0, r7, #0
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x60]
	movs r1, #4
	bl FUN_021FCD2C
	ldr r2, _0224AF68 @ =0xFFF88000
	adds r1, r7, #0
	movs r3, #0xc
	str r0, [r4, #0x64]
	bl FUN_021FCD8C
	add r1, sp, #0xc
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	ldr r3, _0224AF6C @ =0x02253378
	str r0, [r1, #8]
	ldm r3!, {r0, r1}
	add r2, sp, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #0x79
	ldr r1, [r4, #0x5c]
	lsls r0, r0, #2
	ldr r4, [r1, r0]
	movs r1, #2
	adds r0, r4, #0
	bl FUN_0202487C
	adds r0, r4, #0
	add r1, sp, #0xc
	bl FUN_020247E4
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_020247F4
	movs r0, #0
	bl FUN_0201FD00
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02024818
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224AF5C: .4byte 0x02253354
_0224AF60: .4byte 0x0225336C
_0224AF64: .4byte 0x0013B000
_0224AF68: .4byte 0xFFF88000
_0224AF6C: .4byte 0x02253378
	thumb_func_end ov02_0224ADF0

	thumb_func_start ov02_0224AF70
ov02_0224AF70: @ 0x0224AF70
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	ldr r4, [r5, #0x58]
	subs r0, r1, r0
	str r0, [r5, #0x48]
	bpl _0224AF86
	movs r0, #0
	str r0, [r5, #0x48]
_0224AF86:
	movs r0, #2
	ldr r1, [r5, #0x4c]
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _0224AF98
	movs r0, #6
	lsls r0, r0, #0xa
	subs r0, r1, r0
	str r0, [r5, #0x4c]
_0224AF98:
	movs r0, #1
	ldr r1, [r5, #0x4c]
	lsls r0, r0, #0xc
	cmp r1, r0
	bge _0224AFA4
	str r0, [r5, #0x4c]
_0224AFA4:
	ldr r0, _0224B0D8 @ =0x0000013B
	bl FUN_0201FCC0
	ldr r2, [r5, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x40]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r2, [r5, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r5, #0x18]
	ldr r1, [r5, #0x40]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r2, r0, #0xc
	ldr r0, _0224B0DC @ =0x0000010E
	cmp r2, r0
	bge _0224AFEE
	movs r0, #1
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [r5, #0x40]
_0224AFEE:
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x50]
	adds r1, r1, r0
	movs r0, #6
	lsls r0, r0, #0xa
	str r1, [r5, #0x2c]
	cmp r1, r0
	ble _0224B000
	str r0, [r5, #0x2c]
_0224B000:
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x50]
	adds r1, r1, r0
	movs r0, #6
	lsls r0, r0, #0xa
	str r1, [r5, #0x30]
	cmp r1, r0
	ble _0224B012
	str r0, [r5, #0x30]
_0224B012:
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x2c
	bl FUN_020247F4
	movs r0, #2
	ldr r1, [r5, #0x38]
	lsls r0, r0, #0xe
	adds r1, r1, r0
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	str r1, [r5, #0x38]
	asrs r1, r0, #0xc
	movs r0, #0x5a
	lsls r0, r0, #2
	cmp r1, r0
	ble _0224B03A
	lsls r0, r0, #0xc
	str r0, [r5, #0x38]
_0224B03A:
	ldr r1, [r5, #0x38]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FD00
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02024818
	ldr r1, [r5, #8]
	ldr r0, [r5, #0x14]
	adds r0, r1, r0
	str r0, [sp, #0xc]
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x18]
	adds r0, r1, r0
	str r0, [sp, #0x10]
	adds r0, r4, #0
	add r1, sp, #0xc
	bl FUN_020247D4
	ldr r0, [r5, #0x48]
	cmp r0, #0
	bne _0224B07C
	movs r0, #0
	str r0, [r5, #4]
	ldrb r0, [r5, #1]
	adds r0, r0, #1
	strb r0, [r5, #1]
	b _0224B082
_0224B07C:
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
_0224B082:
	ldr r0, [r5, #4]
	cmp r0, #0xc
	bne _0224B08E
	ldr r0, [r5, #0x60]
	bl ov02_0224B2CC
_0224B08E:
	movs r0, #0x79
	ldr r1, [r5, #0x5c]
	lsls r0, r0, #2
	ldr r4, [r1, r0]
	adds r0, r4, #0
	bl FUN_020248B0
	adds r3, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [sp]
	movs r0, #5
	adds r1, #0x80
	lsls r0, r0, #0xa
	str r1, [sp]
	cmp r1, r0
	ble _0224B0B8
	str r0, [sp]
_0224B0B8:
	ldr r1, [sp, #4]
	movs r0, #5
	adds r1, #0x80
	lsls r0, r0, #0xa
	str r1, [sp, #4]
	cmp r1, r0
	ble _0224B0C8
	str r0, [sp, #4]
_0224B0C8:
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_020247F4
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_0224B0D8: .4byte 0x0000013B
_0224B0DC: .4byte 0x0000010E
	thumb_func_end ov02_0224AF70

	thumb_func_start ov02_0224B0E0
ov02_0224B0E0: @ 0x0224B0E0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x79
	ldr r1, [r4, #0x5c]
	lsls r0, r0, #2
	ldr r5, [r1, r0]
	movs r1, #3
	adds r0, r5, #0
	bl FUN_020248F0
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl ov02_0224B6B0
	movs r0, #0x82
	ldr r1, [r4, #0x5c]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_0205F484
	adds r0, r5, #0
	bl FUN_020248AC
	ldr r5, [r0, #4]
	ldr r0, [r4, #0x58]
	bl FUN_020248AC
	ldr r0, [r0, #4]
	subs r0, r5, r0
	str r0, [r4, #0x54]
	ldr r0, [r4, #0x60]
	bl ov02_0224B2C0
	ldr r0, [r4, #0x64]
	movs r1, #2
	movs r2, #0
	movs r3, #0xc
	bl FUN_021FCD8C
	movs r1, #1
	lsls r1, r1, #8
	str r1, [r4, #0x50]
	lsls r0, r1, #0xb
	str r0, [r4, #0x40]
	movs r0, #0
	str r0, [r4, #0x48]
	lsls r0, r1, #3
	str r0, [r4, #0x4c]
	movs r0, #3
	strb r0, [r4, #2]
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224B0E0

	thumb_func_start ov02_0224B158
ov02_0224B158: @ 0x0224B158
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r4, r0, #0
	ldr r1, [r4, #0x48]
	ldr r0, [r4, #0x4c]
	ldr r6, [r4, #0x58]
	adds r0, r1, r0
	str r0, [r4, #0x48]
	movs r0, #1
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #0xc
	adds r2, r1, r0
	lsls r1, r0, #4
	str r2, [r4, #0x4c]
	cmp r2, r1
	ble _0224B17C
	lsls r0, r0, #4
	str r0, [r4, #0x4c]
_0224B17C:
	ldr r1, [r4, #0x40]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	ldr r2, [r4, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r4, #0x14]
	movs r0, #0x80
	bl FUN_0201FCAC
	ldr r2, [r4, #0x48]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	muls r0, r1, r0
	str r0, [r4, #0x18]
	movs r0, #0x87
	ldr r1, [r4, #0x40]
	lsls r0, r0, #0xc
	cmp r1, r0
	bge _0224B1C0
	movs r0, #1
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [r4, #0x40]
_0224B1C0:
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x50]
	adds r1, r1, r0
	movs r0, #2
	lsls r0, r0, #0xc
	str r1, [r4, #0x2c]
	cmp r1, r0
	ble _0224B1D2
	str r0, [r4, #0x2c]
_0224B1D2:
	ldr r1, [r4, #0x30]
	ldr r0, [r4, #0x50]
	adds r1, r1, r0
	movs r0, #2
	lsls r0, r0, #0xc
	str r1, [r4, #0x30]
	cmp r1, r0
	ble _0224B1E4
	str r0, [r4, #0x30]
_0224B1E4:
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x14]
	adds r0, r1, r0
	str r0, [sp, #0x18]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x18]
	adds r1, r1, r0
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	str r1, [sp, #0x1c]
	cmp r0, #0xe6
	blt _0224B20A
	movs r0, #2
	strb r0, [r4, #2]
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
_0224B20A:
	movs r0, #0x79
	ldr r1, [r4, #0x5c]
	lsls r0, r0, #2
	ldr r7, [r1, r0]
	adds r0, r7, #0
	bl FUN_020248B0
	add r2, sp, #0xc
	add r3, sp, #0x18
	adds r5, r0, #0
	ldm r3!, {r0, r1}
	mov ip, r2
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldm r5!, {r0, r1}
	add r2, sp, #0
	stm r2!, {r0, r1}
	ldr r0, [r5]
	str r0, [r2]
	movs r0, #1
	ldr r1, [r4, #0x54]
	lsls r0, r0, #0xc
	subs r1, r1, r0
	str r1, [r4, #0x54]
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	str r0, [sp, #0x10]
	adds r0, r7, #0
	mov r1, ip
	bl FUN_020247D4
	movs r0, #1
	ldr r1, [sp]
	lsls r0, r0, #8
	adds r2, r1, r0
	lsls r1, r0, #5
	str r2, [sp]
	cmp r2, r1
	ble _0224B25E
	lsls r0, r0, #5
	str r0, [sp]
_0224B25E:
	movs r0, #1
	ldr r1, [sp, #4]
	lsls r0, r0, #8
	adds r2, r1, r0
	lsls r1, r0, #5
	str r2, [sp, #4]
	cmp r2, r1
	ble _0224B272
	lsls r0, r0, #5
	str r0, [sp, #4]
_0224B272:
	adds r0, r7, #0
	add r1, sp, #0
	bl FUN_020247F4
	adds r4, #0x2c
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_020247F4
	adds r0, r6, #0
	add r1, sp, #0x18
	bl FUN_020247D4
	movs r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224B158

	thumb_func_start ov02_0224B294
ov02_0224B294: @ 0x0224B294
	movs r0, #0
	bx lr
	thumb_func_end ov02_0224B294

	thumb_func_start ov02_0224B298
ov02_0224B298: @ 0x0224B298
	push {lr}
	sub sp, #0x1c
	add r2, sp, #0x10
	movs r3, #0
	str r3, [r2]
	str r3, [r2, #4]
	str r1, [sp, #0xc]
	str r3, [r2, #8]
	add r1, sp, #8
	str r1, [sp]
	movs r1, #0x81
	str r1, [sp, #4]
	ldr r1, _0224B2BC @ =0x022534A4
	bl FUN_02068B0C
	add sp, #0x1c
	pop {pc}
	nop
_0224B2BC: .4byte 0x022534A4
	thumb_func_end ov02_0224B298

	thumb_func_start ov02_0224B2C0
ov02_0224B2C0: @ 0x0224B2C0
	push {r3, lr}
	bl FUN_02068D74
	movs r1, #0
	str r1, [r0]
	pop {r3, pc}
	thumb_func_end ov02_0224B2C0

	thumb_func_start ov02_0224B2CC
ov02_0224B2CC: @ 0x0224B2CC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl FUN_02068D74
	adds r4, r0, #0
	movs r0, #1
	str r0, [r4]
	movs r0, #0
	str r0, [r4, #4]
	str r0, [r4, #0xc]
	str r0, [r4, #8]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x20]
	bl FUN_020248AC
	adds r6, r0, #0
	add r3, sp, #0
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r6]
	adds r1, r2, #0
	str r0, [r3]
	adds r0, r5, #0
	bl FUN_02068DA8
	ldr r0, [r4, #0x20]
	movs r1, #5
	bl FUN_020248F0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_0224B2CC

	thumb_func_start ov02_0224B314
ov02_0224B314: @ 0x0224B314
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl FUN_02068D74
	adds r4, r0, #0
	movs r0, #2
	str r0, [r4]
	movs r0, #0
	str r0, [r4, #4]
	str r0, [r4, #0xc]
	str r0, [r4, #8]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x20]
	add r1, sp, #0
	bl ov02_02248C98
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_02068DA8
	ldr r0, [r4, #0x20]
	movs r1, #4
	bl FUN_020248F0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224B314

	thumb_func_start ov02_0224B350
ov02_0224B350: @ 0x0224B350
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02068D98
	ldr r1, [r0]
	str r1, [r4, #0x1c]
	ldr r0, [r0, #4]
	str r0, [r4, #0x20]
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov02_0224B350

	thumb_func_start ov02_0224B364
ov02_0224B364: @ 0x0224B364
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _0224B3A8
	ldr r1, [r4, #0xc]
	lsls r2, r1, #2
	ldr r1, _0224B3AC @ =0x02253520
	ldr r1, [r1, r2]
	str r1, [r4, #0x14]
	add r1, sp, #0
	bl FUN_02068DB8
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x14]
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r4, #0x20]
	add r1, sp, #0
	bl FUN_020247D4
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0xc
	blt _0224B3A8
	movs r0, #0
	str r0, [r4, #0xc]
	movs r0, #1
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
_0224B3A8:
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0224B3AC: .4byte 0x02253520
	thumb_func_end ov02_0224B364

	thumb_func_start ov02_0224B3B0
ov02_0224B3B0: @ 0x0224B3B0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _0224B3F4
	ldr r1, [r4, #0xc]
	lsls r2, r1, #2
	ldr r1, _0224B3F8 @ =0x02253430
	ldr r1, [r1, r2]
	str r1, [r4, #0x14]
	add r1, sp, #0
	bl FUN_02068DB8
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x14]
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r4, #0x20]
	add r1, sp, #0
	bl FUN_020247D4
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #4
	blt _0224B3F4
	movs r0, #0
	str r0, [r4, #0xc]
	movs r0, #1
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
_0224B3F4:
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0224B3F8: .4byte 0x02253430
	thumb_func_end ov02_0224B3B0

	thumb_func_start ov02_0224B3FC
ov02_0224B3FC: @ 0x0224B3FC
	push {r3, lr}
	ldr r2, [r1]
	cmp r2, #1
	beq _0224B40A
	cmp r2, #2
	beq _0224B410
	pop {r3, pc}
_0224B40A:
	bl ov02_0224B364
	pop {r3, pc}
_0224B410:
	bl ov02_0224B3B0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_0224B3FC

	thumb_func_start ov02_0224B418
ov02_0224B418: @ 0x0224B418
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0x5f
	adds r5, r0, #0
	movs r0, #4
	lsls r1, r1, #2
	bl ov02_0224B690
	adds r1, r0, #0
	str r4, [r1, #0xc]
	ldr r0, _0224B438 @ =ov02_0224B45C
	movs r2, #0x86
	str r5, [r1, #0x14]
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224B438: .4byte ov02_0224B45C
	thumb_func_end ov02_0224B418

	thumb_func_start ov02_0224B43C
ov02_0224B43C: @ 0x0224B43C
	push {r3, lr}
	bl FUN_0201F988
	ldr r0, [r0, #4]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_0224B43C

	thumb_func_start ov02_0224B448
ov02_0224B448: @ 0x0224B448
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0201F988
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0200E390
	pop {r4, pc}
	thumb_func_end ov02_0224B448

	thumb_func_start ov02_0224B45C
ov02_0224B45C: @ 0x0224B45C
	push {r3, r4, r5, lr}
	ldr r4, _0224B490 @ =0x022534B8
	adds r5, r1, #0
_0224B462:
	ldr r1, [r5]
	adds r0, r5, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _0224B462
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _0224B48E
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0224B484
	bl FUN_02068BAC
_0224B484:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _0224B48E
	bl FUN_0202457C
_0224B48E:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224B490: .4byte 0x022534B8
	thumb_func_end ov02_0224B45C

	thumb_func_start ov02_0224B494
ov02_0224B494: @ 0x0224B494
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl ov02_02249444
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224B494

	thumb_func_start ov02_0224B4AC
ov02_0224B4AC: @ 0x0224B4AC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r0, #4
	movs r1, #0x20
	bl FUN_020689C8
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r2, #2
	str r2, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r0, #0x18
	movs r1, #0x20
	adds r3, r2, #0
	str r2, [sp, #0x14]
	bl ov02_02248728
	bl ov02_022493F0
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #0xb
	movs r3, #0
	bl ov02_02248980
	adds r0, r5, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #6
	movs r3, #0
	bl ov02_02248A58
	adds r0, r5, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #0xc
	movs r3, #0
	bl ov02_02248B30
	adds r0, r5, #0
	adds r0, #0x18
	movs r1, #0
	bl ov02_022489F0
	adds r0, r5, #0
	adds r0, #0x18
	movs r1, #0
	bl ov02_02248AC8
	adds r0, r5, #0
	adds r0, #0x18
	movs r1, #0
	bl ov02_02248A24
	adds r0, r5, #0
	adds r0, #0x18
	movs r1, #0
	bl ov02_02248AFC
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _0224B57C
	adds r0, r5, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #0x11
	movs r3, #2
	bl ov02_02248980
	adds r0, r5, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #0x12
	movs r3, #2
	bl ov02_02248B30
	adds r0, r5, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #0x13
	movs r3, #1
	bl ov02_02248BA0
	adds r0, r5, #0
	adds r0, #0x18
	movs r1, #2
	bl ov02_022489F0
	adds r0, r5, #0
	adds r0, #0x18
	movs r1, #2
	bl ov02_02248A24
	b _0224B5DC
_0224B57C:
	adds r0, r5, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #0x14
	movs r3, #2
	bl ov02_02248980
	adds r0, r5, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #7
	movs r3, #1
	bl ov02_02248A58
	adds r0, r5, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #0x15
	movs r3, #2
	bl ov02_02248B30
	adds r0, r5, #0
	adds r0, #0x18
	adds r1, r4, #0
	movs r2, #0x16
	movs r3, #1
	bl ov02_02248BA0
	adds r0, r5, #0
	adds r0, #0x18
	movs r1, #2
	bl ov02_022489F0
	adds r0, r5, #0
	adds r0, #0x18
	movs r1, #1
	bl ov02_02248AC8
	adds r0, r5, #0
	adds r0, #0x18
	movs r1, #2
	bl ov02_02248A24
	adds r0, r5, #0
	adds r0, #0x18
	movs r1, #1
	bl ov02_02248AFC
_0224B5DC:
	adds r0, r4, #0
	bl FUN_0200770C
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224B4AC

	thumb_func_start ov02_0224B5F0
ov02_0224B5F0: @ 0x0224B5F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	adds r0, #0x18
	bl ov02_02248D18
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_02024830
	movs r3, #0x17
	lsls r3, r3, #4
	ldr r1, [r4, r3]
	subs r3, r3, #4
	adds r2, r4, #0
	ldr r0, [r4, #0x14]
	ldr r3, [r4, r3]
	adds r2, #0x18
	bl ov02_02248D58
	movs r1, #0x5d
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl ov02_02248E20
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #1
	str r0, [r4, #0x10]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov02_0224B5F0

	thumb_func_start ov02_0224B638
ov02_0224B638: @ 0x0224B638
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov02_02248D8C
	cmp r0, #2
	beq _0224B64E
	movs r0, #0
	pop {r4, pc}
_0224B64E:
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov02_02248DBC
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224B638

	thumb_func_start ov02_0224B664
ov02_0224B664: @ 0x0224B664
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_020689F8
	adds r0, r4, #0
	adds r0, #0x18
	bl ov02_0224886C
	movs r0, #0
	str r0, [r4, #0x10]
	movs r1, #1
	str r1, [r4, #4]
	ldr r1, [r4]
	adds r1, r1, #1
	str r1, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224B664

	thumb_func_start ov02_0224B68C
ov02_0224B68C: @ 0x0224B68C
	movs r0, #0
	bx lr
	thumb_func_end ov02_0224B68C

	thumb_func_start ov02_0224B690
ov02_0224B690: @ 0x0224B690
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_0201AACC
	adds r4, r0, #0
	bne _0224B6A0
	bl GF_AssertFail
_0224B6A0:
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	blx FUN_020E5B44
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224B690

	thumb_func_start ov02_0224B6B0
ov02_0224B6B0: @ 0x0224B6B0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_0205F708
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0205F690
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224B6B0

	thumb_func_start ov02_0224B6D0
ov02_0224B6D0: @ 0x0224B6D0
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02068D98
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [r4]
	str r0, [r4, #4]
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov02_0224B6D0

	thumb_func_start ov02_0224B6E4
ov02_0224B6E4: @ 0x0224B6E4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r0, [r4]
	bl FUN_020248AC
	ldr r1, [r4, #4]
	ldr r0, [r0, #4]
	ldr r5, [r1, #0x4c]
	ldr r3, [r1, #0x50]
	ldr r1, [r1, #0x1c]
	cmp r1, #0
	bne _0224B720
	movs r1, #2
	lsls r1, r1, #0xe
	subs r2, r0, r1
	cmp r2, r5
	blt _0224B716
	adds r0, r0, r1
	cmp r0, r3
	bgt _0224B716
	ldr r0, [r4]
	movs r1, #1
	bl FUN_02024830
	pop {r3, r4, r5, pc}
_0224B716:
	ldr r0, [r4]
	movs r1, #0
	bl FUN_02024830
	pop {r3, r4, r5, pc}
_0224B720:
	ldr r0, [r4]
	movs r1, #1
	bl FUN_02024830
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224B6E4

	thumb_func_start ov02_0224B72C
ov02_0224B72C: @ 0x0224B72C
	push {r3, r4, lr}
	sub sp, #0x1c
	add r2, sp, #0x10
	movs r3, #0
	str r3, [r2]
	adds r4, r0, #0
	str r3, [r2, #4]
	movs r0, #0x79
	str r3, [r2, #8]
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, r0, #4
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	add r1, sp, #8
	str r1, [sp]
	movs r1, #0x87
	str r1, [sp, #4]
	ldr r0, [r4, r0]
	ldr r1, _0224B764 @ =0x02253440
	bl FUN_02068B0C
	movs r1, #0x7d
	lsls r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x1c
	pop {r3, r4, pc}
	nop
_0224B764: .4byte 0x02253440
	thumb_func_end ov02_0224B72C

	thumb_func_start ov02_0224B768
ov02_0224B768: @ 0x0224B768
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x7d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224B782
	bl FUN_02068B48
	movs r0, #0x7d
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_0224B782:
	pop {r4, pc}
	thumb_func_end ov02_0224B768

	thumb_func_start ov02_0224B784
ov02_0224B784: @ 0x0224B784
	push {r4, lr}
	sub sp, #0x18
	add r2, sp, #0xc
	movs r1, #0
	str r1, [r2]
	adds r4, r0, #0
	str r1, [r2, #4]
	str r1, [r2, #8]
	str r4, [sp, #8]
	bl ov02_0224B88C
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0xc
	bl FUN_0205F944
	add r0, sp, #8
	str r0, [sp]
	movs r0, #0x83
	str r0, [sp, #4]
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, _0224B7C8 @ =0x02253490
	add r2, sp, #0xc
	movs r3, #0
	bl FUN_02068B0C
	movs r1, #0x1f
	lsls r1, r1, #4
	str r0, [r4, r1]
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
_0224B7C8: .4byte 0x02253490
	thumb_func_end ov02_0224B784

	thumb_func_start ov02_0224B7CC
ov02_0224B7CC: @ 0x0224B7CC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02068D98
	ldr r1, [r0]
	movs r6, #0x8a
	str r1, [r4]
	ldr r4, [r0]
	lsls r6, r6, #2
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_02068DB8
	adds r0, r4, r6
	adds r0, #0x24
	add r1, sp, #0
	bl FUN_021FC014
	adds r0, r4, r6
	adds r0, #0x24
	movs r1, #0
	bl FUN_021FC004
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov02_0224B7CC

	thumb_func_start ov02_0224B804
ov02_0224B804: @ 0x0224B804
	bx lr
	.align 2, 0
	thumb_func_end ov02_0224B804

	thumb_func_start ov02_0224B808
ov02_0224B808: @ 0x0224B808
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, [r5, #4]
	movs r6, #0x8a
	lsls r6, r6, #2
	ldr r4, [r5]
	cmp r0, #3
	bhi _0224B878
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224B824: @ jump table
	.2byte _0224B82C - _0224B824 - 2 @ case 0
	.2byte _0224B832 - _0224B824 - 2 @ case 1
	.2byte _0224B854 - _0224B824 - 2 @ case 2
	.2byte _0224B878 - _0224B824 - 2 @ case 3
_0224B82C:
	movs r0, #1
	str r0, [r5, #4]
	pop {r4, r5, r6, pc}
_0224B832:
	adds r0, r4, r6
	adds r0, #0x24
	movs r1, #1
	bl FUN_021FC004
	adds r0, r4, r6
	adds r0, #0x9c
	movs r1, #0
	bl FUN_021FBF20
	adds r0, r4, r6
	adds r0, #0xb0
	movs r1, #0
	bl FUN_021FBF20
	movs r0, #2
	str r0, [r5, #4]
_0224B854:
	adds r0, r4, r6
	movs r1, #1
	adds r0, #0x9c
	lsls r1, r1, #0xc
	bl FUN_021FBEE4
	adds r0, r4, r6
	movs r1, #1
	adds r0, #0xb0
	lsls r1, r1, #0xc
	bl FUN_021FBEE4
	cmp r0, #0
	beq _0224B878
	movs r0, #1
	str r0, [r5, #8]
	movs r0, #3
	str r0, [r5, #4]
_0224B878:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_0224B808

	thumb_func_start ov02_0224B87C
ov02_0224B87C: @ 0x0224B87C
	movs r0, #0x93
	ldr r1, [r1]
	lsls r0, r0, #2
	ldr r3, _0224B888 @ =FUN_021FBF68
	adds r0, r1, r0
	bx r3
	.align 2, 0
_0224B888: .4byte FUN_021FBF68
	thumb_func_end ov02_0224B87C

	thumb_func_start ov02_0224B88C
ov02_0224B88C: @ 0x0224B88C
	push {r4, lr}
	sub sp, #8
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r4, r0, r1
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x20
	bl FUN_0201AC14
	movs r0, #0x67
	movs r1, #0x83
	movs r2, #4
	bl FUN_02007540
	str r0, [r4, #0x10]
	adds r0, r4, #0
	ldr r1, [r4, #0x10]
	adds r0, #0x14
	bl FUN_021FBD38
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x24
	adds r1, #0x14
	bl FUN_021FBF2C
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x9c
	adds r1, #0x14
	movs r2, #0x67
	movs r3, #0xa7
	str r4, [sp, #4]
	bl FUN_021FBE44
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xb0
	adds r1, #0x14
	movs r2, #0x67
	movs r3, #0xa5
	str r4, [sp, #4]
	bl FUN_021FBE44
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x24
	adds r1, #0x9c
	bl FUN_021FBF50
	adds r0, r4, #0
	adds r4, #0xb0
	adds r0, #0x24
	adds r1, r4, #0
	bl FUN_021FBF50
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224B88C

	thumb_func_start ov02_0224B90C
ov02_0224B90C: @ 0x0224B90C
	push {r4, lr}
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x14
	bl FUN_021FBDFC
	ldr r0, [r4, #0x10]
	bl FUN_021F1448
	adds r0, r4, #0
	adds r0, #0x9c
	adds r1, r4, #0
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r0, #0xb0
	adds r1, r4, #0
	bl FUN_021FBE80
	pop {r4, pc}
	thumb_func_end ov02_0224B90C

	thumb_func_start ov02_0224B938
ov02_0224B938: @ 0x0224B938
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0205F690
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0205F484
	adds r0, r4, #0
	bl ov02_0224B784
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224B938

	thumb_func_start ov02_0224B964
ov02_0224B964: @ 0x0224B964
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02068D74
	ldr r0, [r0, #8]
	cmp r0, #1
	bne _0224B992
	movs r0, #0x1f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02068B48
	adds r0, r4, #0
	bl ov02_0224B90C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
_0224B992:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224B964

	thumb_func_start ov02_0224B998
ov02_0224B998: @ 0x0224B998
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r1, #8]
	str r1, [sp]
	movs r1, #0
	bl FUN_02074644
	adds r7, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_0202D9C4
	adds r6, r0, #0
	adds r0, r7, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov02_0224BAA8
	str r0, [sp, #8]
	cmp r0, #0
	beq _0224BA50
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl FUN_020677F4
	str r0, [sp, #4]
	adds r0, r7, #0
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r7, #0
	movs r1, #0xa0
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [sp]
	ldr r0, [r0, #0x14]
	cmp r0, #1
	bne _0224BA14
	cmp r4, #0
	bne _0224BA14
	add r0, sp, #8
	bl FUN_0202DA44
	ldr r0, [r5, #0xc]
	bl FUN_020503D0
	ldr r1, [sp, #4]
	movs r2, #2
	bl FUN_02066BE8
	b _0224BA42
_0224BA14:
	cmp r0, #4
	bne _0224BA2E
	add r0, sp, #8
	bl FUN_0202DA44
	ldr r0, [r5, #0xc]
	bl FUN_020503D0
	ldr r1, [sp, #4]
	movs r2, #1
	bl FUN_02066BE8
	b _0224BA42
_0224BA2E:
	ldr r0, [sp, #8]
	movs r1, #5
	adds r2, r4, #0
	bl FUN_0202DAB8
	ldr r0, [sp, #8]
	movs r1, #7
	adds r2, r7, #0
	bl FUN_0202DAB8
_0224BA42:
	ldr r1, [r5, #0x20]
	adds r0, r6, #0
	ldr r1, [r1]
	bl ov02_0224BA70
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0224BA50:
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bhs _0224BA6C
	ldr r1, [r5, #0x20]
	adds r0, r6, #0
	ldr r1, [r1]
	bl ov02_0224BA70
_0224BA6C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224B998

	thumb_func_start ov02_0224BA70
ov02_0224BA70: @ 0x0224BA70
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
_0224BA78:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0202DA28
	cmp r0, #0
	beq _0224BA9C
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0202D9F8
	bl FUN_02067698
	cmp r6, r0
	bne _0224BA9C
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02067608
_0224BA9C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _0224BA78
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_0224BA70

	thumb_func_start ov02_0224BAA8
ov02_0224BAA8: @ 0x0224BAA8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
_0224BAB0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0202DA28
	cmp r0, #0
	beq _0224BAD4
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0202DA54
	movs r1, #4
	adds r7, r0, #0
	bl FUN_0202DA6C
	cmp r6, r0
	bne _0224BAD4
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224BAD4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _0224BAB0
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224BAA8

	thumb_func_start ov02_0224BAE4
ov02_0224BAE4: @ 0x0224BAE4
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_0202D9C4
	bl FUN_0202DB04
	ldrb r1, [r0]
	cmp r1, #0
	beq _0224BB0E
	subs r1, r1, #1
	strb r1, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0224BB0E
	ldr r1, _0224BB14 @ =0x000007E6
	adds r0, r4, #0
	movs r2, #0
	bl FUN_0203FE74
	movs r0, #1
	pop {r4, pc}
_0224BB0E:
	movs r0, #0
	pop {r4, pc}
	nop
_0224BB14: .4byte 0x000007E6
	thumb_func_end ov02_0224BAE4

	thumb_func_start ov02_0224BB18
ov02_0224BB18: @ 0x0224BB18
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r6, r1, #0
	movs r1, #0x24
	add r2, sp, #4
	add r3, sp, #0
	adds r5, r0, #0
	bl FUN_02054C20
	cmp r0, #0
	beq _0224BB84
	movs r0, #4
	movs r1, #0x18
	bl FUN_0201AACC
	adds r4, r0, #0
	strb r6, [r4, #0xc]
	movs r0, #0
	strb r0, [r4, #0xd]
	strb r0, [r4, #0xe]
	strb r0, [r4, #0xf]
	ldr r0, [r5, #0x30]
	bl FUN_0203B004
	adds r1, r0, #0
	ldr r0, [sp]
	add r2, sp, #0x14
	bl FUN_02054DC8
	ldr r1, [sp, #4]
	add r0, sp, #8
	bl FUN_021F3B0C
	add r3, sp, #8
	ldm r3!, {r0, r1}
	adds r2, r4, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [r4]
	ldr r0, [sp, #0x14]
	adds r2, r4, #0
	adds r0, r1, r0
	str r0, [r4]
	ldr r1, [r4, #8]
	ldr r0, [sp, #0x1c]
	adds r0, r1, r0
	str r0, [r4, #8]
	ldr r0, [r5, #0x10]
	ldr r1, _0224BB8C @ =ov02_0224BB90
	bl FUN_02050530
	add sp, #0x20
	pop {r4, r5, r6, pc}
_0224BB84:
	bl GF_AssertFail
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.align 2, 0
_0224BB8C: .4byte ov02_0224BB90
	thumb_func_end ov02_0224BB18

	thumb_func_start ov02_0224BB90
ov02_0224BB90: @ 0x0224BB90
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r4, r0, #0
	bl FUN_0205064C
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldrb r1, [r4, #0xf]
	cmp r1, #5
	bls _0224BBAC
	b _0224BDCC
_0224BBAC:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224BBB8: @ jump table
	.2byte _0224BBC4 - _0224BBB8 - 2 @ case 0
	.2byte _0224BC98 - _0224BBB8 - 2 @ case 1
	.2byte _0224BCFA - _0224BBB8 - 2 @ case 2
	.2byte _0224BD42 - _0224BBB8 - 2 @ case 3
	.2byte _0224BD64 - _0224BBB8 - 2 @ case 4
	.2byte _0224BDC2 - _0224BBB8 - 2 @ case 5
_0224BBC4:
	ldr r1, [r6, #0x34]
	movs r0, #0x6b
	bl FUN_021FB90C
	adds r5, r0, #0
	ldr r1, [r6, #0x34]
	movs r0, #0x25
	bl FUN_021FB90C
	adds r7, r0, #0
	ldr r0, [r5]
	blx FUN_020C3B40
	cmp r0, #0
	beq _0224BC02
	adds r2, r0, #0
	adds r2, #8
	beq _0224BBF6
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0224BBF6
	ldrh r1, [r0, #0xe]
	adds r1, r2, r1
	adds r1, r1, #4
	b _0224BBF8
_0224BBF6:
	movs r1, #0
_0224BBF8:
	cmp r1, #0
	beq _0224BC02
	ldr r1, [r1]
	adds r5, r0, r1
	b _0224BC04
_0224BC02:
	movs r5, #0
_0224BC04:
	ldr r0, [r7]
	blx FUN_020C3B40
	cmp r0, #0
	beq _0224BC2E
	adds r2, r0, #0
	adds r2, #8
	beq _0224BC22
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0224BC22
	ldrh r1, [r0, #0xe]
	adds r1, r2, r1
	adds r1, r1, #4
	b _0224BC24
_0224BC22:
	movs r1, #0
_0224BC24:
	cmp r1, #0
	beq _0224BC2E
	ldr r1, [r1]
	adds r7, r0, r1
	b _0224BC30
_0224BC2E:
	movs r7, #0
_0224BC30:
	ldr r0, [r6, #0x34]
	bl FUN_021FB9E0
	movs r1, #0
	str r1, [sp]
	str r5, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	movs r2, #0x10
	movs r3, #0x6b
	bl FUN_021E8DE8
	adds r0, r6, #0
	movs r1, #0x25
	add r2, sp, #0x18
	movs r3, #0
	bl FUN_02054C20
	cmp r0, #0
	bne _0224BC66
	bl GF_AssertFail
_0224BC66:
	ldr r0, [sp, #0x18]
	bl FUN_021F3B38
	adds r5, r0, #0
	ldr r0, [r6, #0x34]
	bl FUN_021FB9E0
	str r5, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	movs r2, #0x20
	movs r3, #0x25
	bl FUN_021E8DE8
	ldrb r0, [r4, #0xf]
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224BDCC
_0224BC98:
	add r1, sp, #0x1c
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldrb r2, [r4, #0xd]
	movs r1, #0xc
	ldr r0, [r4]
	adds r3, r2, #0
	ldr r2, _0224BDD4 @ =0x02253D90
	muls r3, r1, r3
	ldr r2, [r2, r3]
	adds r0, r0, r2
	str r0, [sp, #0x28]
	ldrb r2, [r4, #0xd]
	ldr r0, [r4, #4]
	adds r3, r2, #0
	ldr r2, _0224BDD8 @ =0x02253D94
	muls r3, r1, r3
	ldr r2, [r2, r3]
	adds r0, r0, r2
	str r0, [sp, #0x2c]
	ldrb r2, [r4, #0xd]
	ldr r0, [r4, #8]
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _0224BDDC @ =0x02253D98
	ldr r1, [r1, r3]
	adds r0, r0, r1
	str r0, [sp, #0x30]
	ldr r0, _0224BDE0 @ =0x000005FD
	bl FUN_0200604C
	ldr r0, [r6, #0x54]
	adds r6, #0x9c
	str r0, [sp]
	ldr r0, [r6]
	movs r1, #0x6b
	add r2, sp, #0x28
	add r3, sp, #0x1c
	bl FUN_021F3C0C
	ldrb r1, [r4, #0xd]
	adds r1, r4, r1
	strb r0, [r1, #0x10]
	ldrb r0, [r4, #0xf]
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224BDCC
_0224BCFA:
	ldrb r0, [r4, #0xe]
	cmp r0, #0xc
	bhs _0224BD06
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	b _0224BDCC
_0224BD06:
	movs r0, #0
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #0xd]
	adds r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r1, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	cmp r1, r0
	bhs _0224BD1E
	movs r0, #1
	strb r0, [r4, #0xf]
	b _0224BDCC
_0224BD1E:
	adds r0, r6, #0
	adds r0, #0x9c
	ldrb r1, [r4, #0x10]
	ldr r0, [r0]
	bl FUN_021F3B60
	bl FUN_021F3B38
	adds r3, r0, #0
	ldr r0, [r6, #0x58]
	movs r1, #0x10
	movs r2, #0
	bl FUN_021E8E40
	ldrb r0, [r4, #0xf]
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224BDCC
_0224BD42:
	ldr r0, [r6, #0x58]
	movs r1, #0x10
	movs r2, #0
	bl FUN_021E8E70
	ldr r0, [r6, #0x58]
	movs r1, #0x20
	movs r2, #0
	bl FUN_021E8E70
	ldr r0, _0224BDE4 @ =0x0000049F
	bl FUN_02006B24
	ldrb r0, [r4, #0xf]
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224BDCC
_0224BD64:
	ldr r0, [r6, #0x58]
	movs r1, #0x10
	bl FUN_021E8F10
	cmp r0, #0
	beq _0224BDCC
	ldr r0, [r6, #0x58]
	movs r1, #0x20
	bl FUN_021E8F10
	cmp r0, #0
	beq _0224BDCC
	bl FUN_02006BCC
	cmp r0, #0
	bne _0224BDCC
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	movs r2, #0x20
	bl FUN_021E8ED0
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	movs r2, #0x10
	bl FUN_021E8ED0
	ldrb r0, [r4, #0xc]
	movs r5, #0
	cmp r0, #0
	bls _0224BDBA
_0224BDA0:
	adds r0, r4, r5
	adds r1, r6, #0
	adds r1, #0x9c
	ldrb r0, [r0, #0x10]
	ldr r1, [r1]
	bl FUN_021F36DC
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r4, #0xc]
	cmp r5, r0
	blo _0224BDA0
_0224BDBA:
	ldrb r0, [r4, #0xf]
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224BDCC
_0224BDC2:
	bl FUN_0201AB0C
	add sp, #0x34
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0224BDCC:
	movs r0, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0224BDD4: .4byte 0x02253D90
_0224BDD8: .4byte 0x02253D94
_0224BDDC: .4byte 0x02253D98
_0224BDE0: .4byte 0x000005FD
_0224BDE4: .4byte 0x0000049F
	thumb_func_end ov02_0224BB90

	thumb_func_start ov02_0224BDE8
ov02_0224BDE8: @ 0x0224BDE8
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	movs r2, #0
	adds r4, r1, #0
	movs r1, #0xd0
	adds r3, r2, #0
	adds r5, r0, #0
	bl FUN_02054C20
	cmp r0, #0
	beq _0224BE1A
	movs r0, #4
	adds r1, r0, #0
	bl FUN_0201AACC
	adds r2, r0, #0
	strb r6, [r2]
	strb r4, [r2, #1]
	movs r0, #0
	strb r0, [r2, #2]
	ldr r0, [r5, #0x10]
	ldr r1, _0224BE20 @ =ov02_0224BE24
	bl FUN_02050530
	pop {r4, r5, r6, pc}
_0224BE1A:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	.align 2, 0
_0224BE20: .4byte ov02_0224BE24
	thumb_func_end ov02_0224BDE8

	thumb_func_start ov02_0224BE24
ov02_0224BE24: @ 0x0224BE24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	bl FUN_0205064C
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldrb r1, [r4, #2]
	cmp r1, #4
	bls _0224BE40
	b _0224BF48
_0224BE40:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224BE4C: @ jump table
	.2byte _0224BE56 - _0224BE4C - 2 @ case 0
	.2byte _0224BED2 - _0224BE4C - 2 @ case 1
	.2byte _0224BF00 - _0224BE4C - 2 @ case 2
	.2byte _0224BF2C - _0224BE4C - 2 @ case 3
	.2byte _0224BF3E - _0224BE4C - 2 @ case 4
_0224BE56:
	ldr r1, [r6, #0x34]
	movs r0, #0xd0
	bl FUN_021FB90C
	ldr r0, [r0]
	blx FUN_020C3B40
	cmp r0, #0
	beq _0224BE88
	adds r2, r0, #0
	adds r2, #8
	beq _0224BE7C
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0224BE7C
	ldrh r1, [r0, #0xe]
	adds r1, r2, r1
	adds r1, r1, #4
	b _0224BE7E
_0224BE7C:
	movs r1, #0
_0224BE7E:
	cmp r1, #0
	beq _0224BE88
	ldr r1, [r1]
	adds r7, r0, r1
	b _0224BE8A
_0224BE88:
	movs r7, #0
_0224BE8A:
	adds r0, r6, #0
	movs r1, #0xd0
	add r2, sp, #0x18
	movs r3, #0
	bl FUN_02054C20
	cmp r0, #0
	bne _0224BE9E
	bl GF_AssertFail
_0224BE9E:
	ldr r0, [sp, #0x18]
	bl FUN_021F3B38
	adds r5, r0, #0
	ldr r0, [r6, #0x34]
	bl FUN_021FB9E0
	str r5, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	ldrb r0, [r4]
	movs r2, #1
	movs r3, #0xd0
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	bl FUN_021E8DE8
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	b _0224BF48
_0224BED2:
	ldrb r0, [r4, #1]
	movs r1, #1
	cmp r0, #0
	beq _0224BEE0
	cmp r0, #1
	beq _0224BEE0
	movs r1, #0
_0224BEE0:
	cmp r1, #0
	bne _0224BEE8
	bl GF_AssertFail
_0224BEE8:
	ldrb r2, [r4, #1]
	ldr r0, [r6, #0x58]
	movs r1, #1
	bl FUN_021E8E70
	ldr r0, _0224BF50 @ =0x00000611
	bl FUN_0200604C
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	b _0224BF48
_0224BF00:
	ldr r0, [r6, #0x58]
	movs r1, #1
	bl FUN_021E8F10
	cmp r0, #0
	beq _0224BF48
	ldr r0, _0224BF50 @ =0x00000611
	movs r1, #0
	bl FUN_02006154
	ldr r0, _0224BF54 @ =0x000005F1
	bl FUN_0200604C
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	movs r2, #1
	bl FUN_021E8ED0
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	b _0224BF48
_0224BF2C:
	ldr r0, _0224BF54 @ =0x000005F1
	bl FUN_02006184
	cmp r0, #0
	bne _0224BF48
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	b _0224BF48
_0224BF3E:
	bl FUN_0201AB0C
	add sp, #0x1c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0224BF48:
	movs r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0224BF50: .4byte 0x00000611
_0224BF54: .4byte 0x000005F1
	thumb_func_end ov02_0224BE24

	thumb_func_start ov02_0224BF58
ov02_0224BF58: @ 0x0224BF58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	ldr r2, _0224BFBC @ =0x022536E8
	adds r7, r1, #0
	ldr r3, [r2]
	ldr r2, [r2, #4]
	str r3, [sp, #0x18]
	str r2, [sp, #0x1c]
	add r2, sp, #0x20
	str r2, [sp]
	add r1, sp, #0x18
	movs r2, #2
	add r3, sp, #0x24
	adds r5, r0, #0
	bl FUN_02054C90
	cmp r0, #0
	beq _0224BFB4
	ldr r0, [r5, #0x34]
	bl FUN_021FB9E0
	adds r6, r0, #0
	ldr r0, [sp, #0x24]
	bl FUN_021F3B38
	adds r4, r0, #0
	ldr r0, [sp, #0x24]
	bl FUN_021F3B3C
	str r4, [sp]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x54]
	ldr r1, [r5, #0x58]
	ldr r3, [sp, #0x20]
	adds r2, r7, #0
	bl FUN_021E8DE8
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
_0224BFB4:
	bl GF_AssertFail
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224BFBC: .4byte 0x022536E8
	thumb_func_end ov02_0224BF58

	thumb_func_start ov02_0224BFC0
ov02_0224BFC0: @ 0x0224BFC0
	ldr r3, _0224BFC8 @ =FUN_021E8E70
	ldr r0, [r0, #0x58]
	movs r2, #0
	bx r3
	.align 2, 0
_0224BFC8: .4byte FUN_021E8E70
	thumb_func_end ov02_0224BFC0

	thumb_func_start ov02_0224BFCC
ov02_0224BFCC: @ 0x0224BFCC
	ldr r3, _0224BFD4 @ =FUN_021E8E70
	ldr r0, [r0, #0x58]
	movs r2, #1
	bx r3
	.align 2, 0
_0224BFD4: .4byte FUN_021E8E70
	thumb_func_end ov02_0224BFCC

	thumb_func_start ov02_0224BFD8
ov02_0224BFD8: @ 0x0224BFD8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	movs r1, #0x30
	bl ov02_0224C660
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0xc]
	str r5, [r4, #0x24]
	ldr r0, [r5, #0x40]
	bl FUN_0205C6DC
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x40]
	bl FUN_0205C700
	subs r0, r0, #1
	cmp r0, #1
	bhi _0224C006
	movs r0, #0
	str r0, [r4, #8]
	b _0224C01A
_0224C006:
	adds r0, r5, #0
	bl FUN_02069F88
	cmp r0, #0
	beq _0224C016
	movs r0, #1
	str r0, [r4, #8]
	b _0224C01A
_0224C016:
	movs r0, #0
	str r0, [r4, #8]
_0224C01A:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224BFD8

	thumb_func_start ov02_0224C020
ov02_0224C020: @ 0x0224C020
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	bl FUN_0205064C
	adds r7, r0, #0
	adds r0, r6, #0
	bl FUN_02050650
	adds r5, r0, #0
_0224C032:
	ldr r3, [r5]
	adds r0, r6, #0
	lsls r4, r3, #2
	ldr r3, _0224C058 @ =0x02253700
	adds r1, r7, #0
	ldr r3, [r3, r4]
	adds r2, r5, #0
	blx r3
	adds r4, r0, #0
	cmp r4, #2
	bne _0224C04E
	adds r0, r5, #0
	bl FUN_0201AB0C
_0224C04E:
	cmp r4, #1
	beq _0224C032
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224C058: .4byte 0x02253700
	thumb_func_end ov02_0224C020

	thumb_func_start ov02_0224C05C
ov02_0224C05C: @ 0x0224C05C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r0, r5, #0
	movs r1, #4
	adds r4, r2, #0
	bl FUN_021FCD2C
	ldr r2, _0224C0A4 @ =0xFFF6A000
	str r0, [r4, #0x1c]
	movs r1, #1
	movs r3, #0xf
	bl FUN_021FCD8C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C0A8 @ =0x02253820
	bl FUN_02062214
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C092
	adds r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C0A8 @ =0x02253820
	bl FUN_02062214
	str r0, [r4, #0x14]
_0224C092:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	ldr r0, _0224C0AC @ =0x00000602
	bl FUN_0200604C
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0224C0A4: .4byte 0xFFF6A000
_0224C0A8: .4byte 0x02253820
_0224C0AC: .4byte 0x00000602
	thumb_func_end ov02_0224C05C

	thumb_func_start ov02_0224C0B0
ov02_0224C0B0: @ 0x0224C0B0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r2, #0
	ldr r0, [r4, #0x10]
	adds r5, r1, #0
	bl FUN_02062260
	cmp r0, #0
	bne _0224C0C8
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_0224C0C8:
	ldr r0, [r4, #0x10]
	bl FUN_0206226C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C144 @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C0F0
	ldr r0, [r4, #0x14]
	bl FUN_0206226C
	adds r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C144 @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x14]
_0224C0F0:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #8
	bge _0224C100
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_0224C100:
	ldr r0, [r4, #0xc]
	cmp r0, #2
	bne _0224C120
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	b _0224C138
_0224C120:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0
	ldr r3, _0224C148 @ =0x00007FFF
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
_0224C138:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0224C144: .4byte 0x02253794
_0224C148: .4byte 0x00007FFF
	thumb_func_end ov02_0224C0B0

	thumb_func_start ov02_0224C14C
ov02_0224C14C: @ 0x0224C14C
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	ldr r0, [r4, #0x10]
	adds r5, r1, #0
	bl FUN_02062260
	cmp r0, #1
	bne _0224C184
	ldr r0, [r4, #0x10]
	bl FUN_0206226C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C1B4 @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C184
	ldr r0, [r4, #0x14]
	bl FUN_0206226C
	adds r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C1B4 @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x14]
_0224C184:
	bl FUN_0200FB5C
	cmp r0, #0
	bne _0224C190
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224C190:
	ldr r0, [r4, #0x10]
	bl FUN_0206226C
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C1A2
	ldr r0, [r4, #0x14]
	bl FUN_0206226C
_0224C1A2:
	ldr r0, [r4, #0x1c]
	bl FUN_021FCD78
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0224C1B4: .4byte 0x02253794
	thumb_func_end ov02_0224C14C

	thumb_func_start ov02_0224C1B8
ov02_0224C1B8: @ 0x0224C1B8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r1, #0xc]
	adds r4, r2, #0
	bl FUN_0203B9C4
	bl FUN_0203B964
	adds r1, r0, #0
	ldr r2, [r4, #0xc]
	adds r0, r5, #0
	bl FUN_02053B04
	movs r0, #2
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224C1B8

	thumb_func_start ov02_0224C1D8
ov02_0224C1D8: @ 0x0224C1D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	movs r1, #0x30
	adds r6, r2, #0
	bl ov02_0224C660
	adds r4, r0, #0
	str r6, [r4, #0xc]
	str r5, [r4, #0x24]
	ldr r0, [r5, #0x40]
	bl FUN_0205C6DC
	str r0, [r4, #0x20]
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_0224C1D8

	thumb_func_start ov02_0224C1F8
ov02_0224C1F8: @ 0x0224C1F8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl FUN_0205064C
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_02050650
	ldr r7, _0224C230 @ =0x022536F0
	adds r4, r0, #0
_0224C20C:
	ldr r3, [r4]
	adds r0, r5, #0
	lsls r3, r3, #2
	ldr r3, [r7, r3]
	adds r1, r6, #0
	adds r2, r4, #0
	blx r3
	cmp r0, #2
	bne _0224C228
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224C228:
	cmp r0, #1
	beq _0224C20C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224C230: .4byte 0x022536F0
	thumb_func_end ov02_0224C1F8

	thumb_func_start ov02_0224C234
ov02_0224C234: @ 0x0224C234
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r2, #0
	ldr r0, [r4, #0xc]
	adds r5, r1, #0
	cmp r0, #2
	bne _0224C25A
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	b _0224C270
_0224C25A:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldr r3, _0224C29C @ =0x00007FFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
_0224C270:
	adds r0, r5, #0
	movs r1, #4
	bl FUN_021FCD2C
	movs r1, #1
	ldr r2, _0224C2A0 @ =0xFFF6A000
	str r0, [r4, #0x1c]
	adds r3, r1, #0
	bl FUN_021FCD8C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C2A4 @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x10]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0224C29C: .4byte 0x00007FFF
_0224C2A0: .4byte 0xFFF6A000
_0224C2A4: .4byte 0x02253794
	thumb_func_end ov02_0224C234

	thumb_func_start ov02_0224C2A8
ov02_0224C2A8: @ 0x0224C2A8
	push {r4, lr}
	adds r4, r2, #0
	ldr r0, [r4, #0x10]
	bl FUN_02062260
	cmp r0, #1
	bne _0224C2C6
	ldr r0, [r4, #0x10]
	bl FUN_0206226C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C2E8 @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x10]
_0224C2C6:
	bl FUN_0200FB5C
	cmp r0, #0
	bne _0224C2D2
	movs r0, #0
	pop {r4, pc}
_0224C2D2:
	ldr r0, [r4, #0x1c]
	movs r1, #2
	movs r2, #0
	movs r3, #0x3c
	bl FUN_021FCD8C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0224C2E8: .4byte 0x02253794
	thumb_func_end ov02_0224C2A8

	thumb_func_start ov02_0224C2EC
ov02_0224C2EC: @ 0x0224C2EC
	push {r4, lr}
	adds r4, r2, #0
	ldr r0, [r4, #0x10]
	bl FUN_02062260
	cmp r0, #0
	bne _0224C2FE
	movs r0, #0
	pop {r4, pc}
_0224C2FE:
	ldr r0, [r4, #0x10]
	bl FUN_0206226C
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #4
	ldr r0, [r4, #0x20]
	bge _0224C31C
	ldr r1, _0224C330 @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x10]
	movs r0, #0
	pop {r4, pc}
_0224C31C:
	ldr r1, _0224C334 @ =0x02253884
	bl FUN_02062214
	str r0, [r4, #0x10]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	nop
_0224C330: .4byte 0x02253794
_0224C334: .4byte 0x02253884
	thumb_func_end ov02_0224C2EC

	thumb_func_start ov02_0224C338
ov02_0224C338: @ 0x0224C338
	push {r4, lr}
	adds r4, r2, #0
	ldr r0, [r4, #0x10]
	bl FUN_02062260
	cmp r0, #0
	bne _0224C34A
	movs r0, #0
	pop {r4, pc}
_0224C34A:
	ldr r0, [r4, #0x1c]
	bl FUN_021FCD6C
	cmp r0, #0
	bne _0224C358
	movs r0, #0
	pop {r4, pc}
_0224C358:
	ldr r0, [r4, #0x1c]
	bl FUN_021FCD78
	ldr r0, [r4, #0x10]
	bl FUN_0206226C
	movs r0, #2
	pop {r4, pc}
	thumb_func_end ov02_0224C338

	thumb_func_start ov02_0224C368
ov02_0224C368: @ 0x0224C368
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r3, #0
	movs r1, #0x30
	adds r7, r2, #0
	bl ov02_0224C660
	adds r4, r0, #0
	movs r0, #1
	str r0, [r4, #0xc]
	str r5, [r4, #0x24]
	ldr r0, [r5, #0x40]
	bl FUN_0205C6DC
	str r0, [r4, #0x20]
	adds r0, r5, #0
	str r6, [r4, #0x28]
	bl FUN_02206268
	cmp r0, #0
	beq _0224C3A4
	adds r0, r5, #0
	bl FUN_022062CC
	cmp r7, r0
	bne _0224C3A4
	movs r0, #1
	str r0, [r4, #8]
	b _0224C3A8
_0224C3A4:
	movs r0, #0
	str r0, [r4, #8]
_0224C3A8:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224C368

	thumb_func_start ov02_0224C3AC
ov02_0224C3AC: @ 0x0224C3AC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl FUN_0205064C
	adds r6, r0, #0
	adds r0, r7, #0
	bl FUN_02050650
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02050654
	adds r5, r0, #0
	ldr r0, [r5]
	cmp r0, #3
	bhi _0224C4A2
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224C3D8: @ jump table
	.2byte _0224C3E0 - _0224C3D8 - 2 @ case 0
	.2byte _0224C3F8 - _0224C3D8 - 2 @ case 1
	.2byte _0224C42A - _0224C3D8 - 2 @ case 2
	.2byte _0224C45C - _0224C3D8 - 2 @ case 3
_0224C3E0:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C3F0
	ldr r1, _0224C4A8 @ =0x02205A61
	adds r0, r7, #0
	movs r2, #0
	bl FUN_02050530
_0224C3F0:
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224C4A2
_0224C3F8:
	adds r0, r0, #1
	str r0, [r5]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C42A
	adds r0, r6, #0
	movs r1, #4
	bl ov02_02250780
	cmp r0, #0
	beq _0224C41E
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #1
	movs r4, #2
	bl FUN_0206A1F4
	b _0224C420
_0224C41E:
	movs r4, #1
_0224C420:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov02_022507B4
	b _0224C4A2
_0224C42A:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C456
	ldr r0, [r4, #0x28]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp]
	ldr r0, [r4, #0x28]
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #0
	ldr r0, [sp]
	lsls r1, r1, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x18
	bl FUN_02006218
_0224C456:
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
_0224C45C:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C482
	bl FUN_02006360
	cmp r0, #0
	beq _0224C46E
	movs r5, #0
	b _0224C494
_0224C46E:
	ldr r3, [r4]
	adds r0, r7, #0
	lsls r5, r3, #2
	ldr r3, _0224C4AC @ =0x02253710
	adds r1, r6, #0
	ldr r3, [r3, r5]
	adds r2, r4, #0
	blx r3
	adds r5, r0, #0
	b _0224C494
_0224C482:
	ldr r3, [r4]
	adds r0, r7, #0
	lsls r5, r3, #2
	ldr r3, _0224C4B0 @ =0x02253754
	adds r1, r6, #0
	ldr r3, [r3, r5]
	adds r2, r4, #0
	blx r3
	adds r5, r0, #0
_0224C494:
	cmp r5, #2
	bne _0224C49E
	adds r0, r4, #0
	bl FUN_0201AB0C
_0224C49E:
	cmp r5, #1
	beq _0224C45C
_0224C4A2:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224C4A8: .4byte 0x02205A61
_0224C4AC: .4byte 0x02253710
_0224C4B0: .4byte 0x02253754
	thumb_func_end ov02_0224C3AC

	thumb_func_start ov02_0224C4B4
ov02_0224C4B4: @ 0x0224C4B4
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r0, [r5, #0x40]
	adds r4, r2, #0
	bl FUN_0205C724
	adds r3, r0, #0
	ldr r2, [r4, #0x28]
	adds r0, r5, #0
	movs r1, #0
	bl ov02_02249458
	str r0, [r4, #0x18]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224C4B4

	thumb_func_start ov02_0224C4D8
ov02_0224C4D8: @ 0x0224C4D8
	push {r4, lr}
	adds r4, r2, #0
	ldr r0, [r4, #0x18]
	bl ov02_0224953C
	cmp r0, #0
	bne _0224C4EA
	movs r0, #0
	pop {r4, pc}
_0224C4EA:
	ldr r0, [r4, #0x18]
	bl ov02_02249548
	ldr r0, [r4, #0x24]
	bl FUN_02205D68
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov02_0224C4D8

	thumb_func_start ov02_0224C500
ov02_0224C500: @ 0x0224C500
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r3, #0
	movs r1, #0x30
	adds r7, r2, #0
	bl ov02_0224C660
	adds r4, r0, #0
	movs r0, #2
	str r0, [r4, #0xc]
	str r5, [r4, #0x24]
	ldr r0, [r5, #0x40]
	bl FUN_0205C6DC
	str r0, [r4, #0x20]
	str r6, [r4, #0x28]
	ldr r0, [r5, #0x40]
	bl FUN_0205C700
	subs r0, r0, #1
	cmp r0, #1
	bhi _0224C534
	movs r0, #0
	str r0, [r4, #8]
	b _0224C552
_0224C534:
	adds r0, r5, #0
	bl FUN_02206268
	cmp r0, #0
	beq _0224C54E
	adds r0, r5, #0
	bl FUN_022062CC
	cmp r7, r0
	bne _0224C54E
	movs r0, #1
	str r0, [r4, #8]
	b _0224C552
_0224C54E:
	movs r0, #0
	str r0, [r4, #8]
_0224C552:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224C500

	thumb_func_start ov02_0224C558
ov02_0224C558: @ 0x0224C558
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl FUN_0205064C
	adds r6, r0, #0
	adds r0, r7, #0
	bl FUN_02050650
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02050654
	adds r5, r0, #0
	ldr r0, [r5]
	cmp r0, #3
	bhi _0224C64E
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224C584: @ jump table
	.2byte _0224C58C - _0224C584 - 2 @ case 0
	.2byte _0224C5A4 - _0224C584 - 2 @ case 1
	.2byte _0224C5D6 - _0224C584 - 2 @ case 2
	.2byte _0224C608 - _0224C584 - 2 @ case 3
_0224C58C:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C59C
	ldr r1, _0224C654 @ =0x02205A61
	adds r0, r7, #0
	movs r2, #0
	bl FUN_02050530
_0224C59C:
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224C64E
_0224C5A4:
	adds r0, r0, #1
	str r0, [r5]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C5D6
	adds r0, r6, #0
	movs r1, #0xe
	bl ov02_02250780
	cmp r0, #0
	beq _0224C5CA
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #1
	movs r4, #2
	bl FUN_0206A1F4
	b _0224C5CC
_0224C5CA:
	movs r4, #1
_0224C5CC:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov02_022507B4
	b _0224C64E
_0224C5D6:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C602
	ldr r0, [r4, #0x28]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp]
	ldr r0, [r4, #0x28]
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #0
	ldr r0, [sp]
	lsls r1, r1, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x18
	bl FUN_02006218
_0224C602:
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
_0224C608:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C62E
	bl FUN_02006360
	cmp r0, #0
	beq _0224C61A
	movs r5, #0
	b _0224C640
_0224C61A:
	ldr r3, [r4]
	adds r0, r7, #0
	lsls r5, r3, #2
	ldr r3, _0224C658 @ =0x0225373C
	adds r1, r6, #0
	ldr r3, [r3, r5]
	adds r2, r4, #0
	blx r3
	adds r5, r0, #0
	b _0224C640
_0224C62E:
	ldr r3, [r4]
	adds r0, r7, #0
	lsls r5, r3, #2
	ldr r3, _0224C65C @ =0x02253724
	adds r1, r6, #0
	ldr r3, [r3, r5]
	adds r2, r4, #0
	blx r3
	adds r5, r0, #0
_0224C640:
	cmp r5, #2
	bne _0224C64A
	adds r0, r4, #0
	bl FUN_0201AB0C
_0224C64A:
	cmp r5, #1
	beq _0224C608
_0224C64E:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224C654: .4byte 0x02205A61
_0224C658: .4byte 0x0225373C
_0224C65C: .4byte 0x02253724
	thumb_func_end ov02_0224C558

	thumb_func_start ov02_0224C660
ov02_0224C660: @ 0x0224C660
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_0201AACC
	adds r4, r0, #0
	bne _0224C670
	bl GF_AssertFail
_0224C670:
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	blx FUN_020E5B44
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224C660

	thumb_func_start ov02_0224C680
ov02_0224C680: @ 0x0224C680
	push {r4, lr}
	adds r4, r2, #0
	adds r0, r1, #0
	movs r1, #2
	movs r2, #1
	bl FUN_022060B8
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov02_0224C680

	thumb_func_start ov02_0224C698
ov02_0224C698: @ 0x0224C698
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r0, r5, #0
	movs r1, #4
	adds r4, r2, #0
	bl FUN_021FCD2C
	ldr r2, _0224C6D0 @ =0xFFF6A000
	movs r1, #1
	movs r3, #0xf
	str r0, [r4, #0x1c]
	bl FUN_021FCD8C
	adds r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C6D4 @ =0x02253770
	bl FUN_02062214
	str r0, [r4, #0x14]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	ldr r0, _0224C6D8 @ =0x0000064D
	bl FUN_0200604C
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0224C6D0: .4byte 0xFFF6A000
_0224C6D4: .4byte 0x02253770
_0224C6D8: .4byte 0x0000064D
	thumb_func_end ov02_0224C698

	thumb_func_start ov02_0224C6DC
ov02_0224C6DC: @ 0x0224C6DC
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	ldr r0, [r4, #0x14]
	adds r5, r1, #0
	bl FUN_02062260
	cmp r0, #0
	bne _0224C6F0
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224C6F0:
	ldr r0, [r4, #0x14]
	bl FUN_0206226C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C718 @ =0x02253820
	bl FUN_02062214
	adds r5, #0xe4
	str r0, [r4, #0x10]
	ldr r0, [r5]
	ldr r1, _0224C718 @ =0x02253820
	bl FUN_02062214
	str r0, [r4, #0x14]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0224C718: .4byte 0x02253820
	thumb_func_end ov02_0224C6DC

	thumb_func_start ov02_0224C71C
ov02_0224C71C: @ 0x0224C71C
	push {r4, lr}
	adds r0, r1, #0
	movs r1, #4
	adds r4, r2, #0
	bl FUN_021FCD2C
	ldr r2, _0224C750 @ =0xFFF6A000
	str r0, [r4, #0x1c]
	movs r1, #1
	movs r3, #0xf
	bl FUN_021FCD8C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C754 @ =0x02253820
	bl FUN_02062214
	str r0, [r4, #0x10]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	ldr r0, _0224C758 @ =0x0000064D
	bl FUN_0200604C
	movs r0, #0
	pop {r4, pc}
	nop
_0224C750: .4byte 0xFFF6A000
_0224C754: .4byte 0x02253820
_0224C758: .4byte 0x0000064D
	thumb_func_end ov02_0224C71C

	thumb_func_start ov02_0224C75C
ov02_0224C75C: @ 0x0224C75C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r2, #0
	ldr r0, [r4, #0x10]
	adds r5, r1, #0
	bl FUN_02062260
	cmp r0, #0
	bne _0224C774
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_0224C774:
	ldr r0, [r4, #0x10]
	bl FUN_0206226C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C7D0 @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C79C
	ldr r0, [r4, #0x14]
	bl FUN_0206226C
	adds r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C7D0 @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x14]
_0224C79C:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #8
	bge _0224C7AC
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_0224C7AC:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0224C7D0: .4byte 0x02253794
	thumb_func_end ov02_0224C75C

	thumb_func_start ov02_0224C7D4
ov02_0224C7D4: @ 0x0224C7D4
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	ldr r0, [r4, #0x10]
	adds r5, r1, #0
	bl FUN_02062260
	cmp r0, #1
	bne _0224C80C
	ldr r0, [r4, #0x10]
	bl FUN_0206226C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C83C @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C80C
	ldr r0, [r4, #0x14]
	bl FUN_0206226C
	adds r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C83C @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x14]
_0224C80C:
	bl FUN_0200FB5C
	cmp r0, #0
	bne _0224C818
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224C818:
	ldr r0, [r4, #0x10]
	bl FUN_0206226C
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C82A
	ldr r0, [r4, #0x14]
	bl FUN_0206226C
_0224C82A:
	ldr r0, [r4, #0x1c]
	bl FUN_021FCD78
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0224C83C: .4byte 0x02253794
	thumb_func_end ov02_0224C7D4

	thumb_func_start ov02_0224C840
ov02_0224C840: @ 0x0224C840
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r1, #0xc]
	adds r4, r2, #0
	bl FUN_0203B9C4
	adds r6, r0, #0
	bl FUN_0203B994
	add r1, sp, #0
	adds r7, r0, #0
	bl FUN_0203BA74
	adds r0, r6, #0
	bl FUN_0203B964
	adds r1, r0, #0
	adds r0, r7, #0
	bl FUN_0203BAE8
	ldr r2, [r4, #0xc]
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_02053B04
	movs r0, #2
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224C840

	thumb_func_start ov02_0224C87C
ov02_0224C87C: @ 0x0224C87C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r0, r5, #0
	movs r1, #4
	adds r4, r2, #0
	bl FUN_021FCD2C
	ldr r2, _0224C8C4 @ =0xFFF6A000
	str r0, [r4, #0x1c]
	movs r1, #1
	movs r3, #0xf
	bl FUN_021FCD8C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C8C8 @ =0x022537DC
	bl FUN_02062214
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C8B2
	adds r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C8C8 @ =0x022537DC
	bl FUN_02062214
	str r0, [r4, #0x14]
_0224C8B2:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	ldr r0, _0224C8CC @ =0x00000602
	bl FUN_0200604C
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0224C8C4: .4byte 0xFFF6A000
_0224C8C8: .4byte 0x022537DC
_0224C8CC: .4byte 0x00000602
	thumb_func_end ov02_0224C87C

	thumb_func_start ov02_0224C8D0
ov02_0224C8D0: @ 0x0224C8D0
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	ldr r0, [r4, #0x10]
	adds r5, r1, #0
	bl FUN_02062260
	cmp r0, #0
	bne _0224C8E4
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224C8E4:
	ldr r0, [r4, #0x10]
	bl FUN_0206226C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C938 @ =0x022537B8
	bl FUN_02062214
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C90E
	ldr r0, [r4, #0x14]
	bl FUN_0206226C
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	ldr r1, _0224C938 @ =0x022537B8
	bl FUN_02062214
	str r0, [r4, #0x14]
_0224C90E:
	ldr r0, [r5, #0x40]
	bl FUN_0205C700
	cmp r0, #2
	beq _0224C92E
	ldr r0, [r4, #8]
	cmp r0, #0
	ldr r0, [r4, #0x24]
	beq _0224C928
	bl ov02_0224DDF4
	str r0, [r4, #0x2c]
	b _0224C92E
_0224C928:
	bl ov02_0224DDE0
	str r0, [r4, #0x2c]
_0224C92E:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224C938: .4byte 0x022537B8
	thumb_func_end ov02_0224C8D0

	thumb_func_start ov02_0224C93C
ov02_0224C93C: @ 0x0224C93C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r2, #0
	ldr r0, [r4, #0x10]
	adds r5, r1, #0
	bl FUN_02062260
	cmp r0, #0
	bne _0224C954
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_0224C954:
	ldr r0, [r4, #0x10]
	bl FUN_0206226C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C9B0 @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C97C
	ldr r0, [r4, #0x14]
	bl FUN_0206226C
	adds r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C9B0 @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x14]
_0224C97C:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #8
	bge _0224C98C
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_0224C98C:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0
	ldr r3, _0224C9B4 @ =0x00007FFF
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0224C9B0: .4byte 0x02253794
_0224C9B4: .4byte 0x00007FFF
	thumb_func_end ov02_0224C93C

	thumb_func_start ov02_0224C9B8
ov02_0224C9B8: @ 0x0224C9B8
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	ldr r0, [r4, #0x10]
	adds r5, r1, #0
	bl FUN_02062260
	cmp r0, #1
	bne _0224C9F2
	ldr r0, [r4, #0x10]
	bl FUN_0206226C
	ldr r0, [r4, #0x20]
	ldr r1, _0224CA34 @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C9F2
	ldr r0, [r4, #0x14]
	bl FUN_0206226C
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	ldr r1, _0224CA34 @ =0x02253794
	bl FUN_02062214
	str r0, [r4, #0x14]
_0224C9F2:
	bl FUN_0200FB5C
	cmp r0, #0
	bne _0224C9FE
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224C9FE:
	ldr r0, [r4, #0x10]
	bl FUN_0206226C
	ldr r0, [r5, #0x40]
	bl FUN_0205C700
	cmp r0, #2
	beq _0224CA18
	ldr r0, [r4, #0x2c]
	bl ov02_0224DE08
	movs r0, #0
	str r0, [r4, #0x2c]
_0224CA18:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224CA24
	ldr r0, [r4, #0x14]
	bl FUN_0206226C
_0224CA24:
	ldr r0, [r4, #0x1c]
	bl FUN_021FCD78
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224CA34: .4byte 0x02253794
	thumb_func_end ov02_0224C9B8

	thumb_func_start ov02_0224CA38
ov02_0224CA38: @ 0x0224CA38
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r1, #0xc]
	adds r4, r2, #0
	bl FUN_0203B9C4
	bl FUN_0203B964
	adds r1, r0, #0
	ldr r2, [r4, #0xc]
	adds r0, r5, #0
	bl FUN_02053B04
	movs r0, #2
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224CA38

	thumb_func_start ov02_0224CA58
ov02_0224CA58: @ 0x0224CA58
	push {r4, r5, r6, r7}
	adds r3, r0, #0
	adds r0, r2, #0
	subs r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r2, #0
	beq _0224CAB4
	adds r6, r3, r1
	subs r7, r1, #1
_0224CA6C:
	subs r1, r6, #1
	ldrb r2, [r1]
	movs r1, #1
	adds r5, r7, #0
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r7, #0
	ble _0224CA9A
_0224CA7E:
	ldrb r1, [r3, r5]
	adds r2, r3, r5
	subs r2, r2, #1
	asrs r1, r1, #1
	strb r1, [r3, r5]
	ldrb r2, [r2]
	ldrb r1, [r3, r5]
	lsls r2, r2, #0x1f
	lsrs r2, r2, #0x18
	orrs r1, r2
	strb r1, [r3, r5]
	subs r5, r5, #1
	cmp r5, #0
	bgt _0224CA7E
_0224CA9A:
	ldrb r1, [r3, r5]
	asrs r1, r1, #1
	strb r1, [r3, r5]
	ldrb r2, [r3, r5]
	lsls r1, r4, #7
	orrs r1, r2
	strb r1, [r3, r5]
	adds r1, r0, #0
	subs r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, #0
	bne _0224CA6C
_0224CAB4:
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov02_0224CA58

	thumb_func_start ov02_0224CAB8
ov02_0224CAB8: @ 0x0224CAB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r2, #0
	str r1, [sp]
	adds r7, r3, #0
	bl FUN_02015D68
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_02015D94
	add r1, sp, #4
	strh r0, [r1, #4]
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_02015D94
	add r1, sp, #4
	strh r0, [r1, #6]
	add r1, sp, #0x18
	ldrh r1, [r1, #0x10]
	adds r0, r5, #0
	bl FUN_02015D94
	add r1, sp, #4
	strh r0, [r1, #8]
	add r1, sp, #0x18
	ldrh r1, [r1, #0x14]
	adds r0, r5, #0
	bl FUN_02015D94
	add r1, sp, #4
	movs r2, #0
	strh r0, [r1, #0xa]
	add r3, sp, #8
	add r5, sp, #4
	adds r7, r2, #0
_0224CB06:
	ldrsh r0, [r3, r7]
	cmp r0, #0
	bge _0224CB14
	movs r0, #0
	add sp, #0x10
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CB14:
	cmp r2, #0
	ble _0224CB48
	movs r6, #1
	mvns r6, r6
	ldrsh r6, [r3, r6]
	cmp r0, r6
	blt _0224CB34
	subs r0, r0, r6
	cmp r0, #0xff
	ble _0224CB30
	movs r0, #0
	add sp, #0x10
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CB30:
	strb r0, [r5]
	b _0224CB5A
_0224CB34:
	subs r0, r6, r0
	subs r0, r4, r0
	cmp r0, #0xff
	ble _0224CB44
	movs r0, #0
	add sp, #0x10
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CB44:
	strb r0, [r5]
	b _0224CB5A
_0224CB48:
	movs r0, #4
	ldrsh r0, [r1, r0]
	cmp r0, #0xff
	ble _0224CB58
	movs r0, #0
	add sp, #0x10
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CB58:
	strb r0, [r1]
_0224CB5A:
	adds r2, r2, #1
	adds r3, r3, #2
	adds r5, r5, #1
	cmp r2, #4
	blt _0224CB06
	add r0, sp, #4
	movs r1, #4
	movs r2, #5
	bl ov02_0224CA58
	movs r2, #0
	add r1, sp, #4
	add r4, sp, #4
	movs r3, #0xf0
_0224CB76:
	ldrb r5, [r4, #3]
	ldrb r0, [r1]
	adds r2, r2, #1
	asrs r6, r5, #4
	ands r5, r3
	orrs r5, r6
	eors r0, r5
	strb r0, [r1]
	adds r1, r1, #1
	cmp r2, #3
	blt _0224CB76
	add r2, sp, #4
	ldrb r3, [r2, #3]
	movs r2, #0xf
	add r0, sp, #4
	ands r2, r3
	lsls r2, r2, #0x18
	movs r1, #3
	lsrs r2, r2, #0x18
	bl ov02_0224CA58
	add r1, sp, #4
	ldrb r5, [r1]
	movs r0, #0xf
	adds r4, r5, #0
	ands r4, r0
	cmp r4, #8
	blt _0224CBB4
	add sp, #0x10
	subs r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0224CBB4:
	ldrb r0, [r1, #1]
	eors r0, r5
	strb r0, [r1, #1]
	ldrb r0, [r1, #2]
	eors r0, r5
	strb r0, [r1, #2]
	ldrb r2, [r1, #1]
	ldrb r3, [r1, #2]
	lsls r0, r2, #8
	adds r6, r0, #0
	ldr r0, [sp]
	orrs r6, r3
	cmp r0, r6
	bne _0224CBEE
	movs r0, #0xf0
	ands r0, r5
	asrs r0, r0, #4
	cmp r0, #6
	bne _0224CBEE
	ldrb r0, [r1, #3]
	adds r1, r5, r2
	muls r1, r3, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r0, r1
	bne _0224CBEE
	add sp, #0x10
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224CBEE:
	movs r0, #0
	mvns r0, r0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224CAB8

	thumb_func_start ov02_0224CBF8
ov02_0224CBF8: @ 0x0224CBF8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r2, #0
	str r1, [sp]
	adds r7, r3, #0
	bl FUN_02015D68
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_02015D94
	add r1, sp, #4
	strh r0, [r1, #4]
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_02015D94
	add r1, sp, #4
	strh r0, [r1, #6]
	add r1, sp, #0x18
	ldrh r1, [r1, #0x10]
	adds r0, r5, #0
	bl FUN_02015D94
	add r1, sp, #4
	strh r0, [r1, #8]
	add r1, sp, #0x18
	ldrh r1, [r1, #0x14]
	adds r0, r5, #0
	bl FUN_02015D94
	add r1, sp, #4
	movs r2, #0
	strh r0, [r1, #0xa]
	add r3, sp, #8
	add r5, sp, #4
	adds r7, r2, #0
_0224CC46:
	ldrsh r0, [r3, r7]
	cmp r0, #0
	bge _0224CC54
	movs r0, #0
	add sp, #0x10
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CC54:
	cmp r2, #0
	ble _0224CC88
	movs r6, #1
	mvns r6, r6
	ldrsh r6, [r3, r6]
	cmp r0, r6
	blt _0224CC74
	subs r0, r0, r6
	cmp r0, #0xff
	ble _0224CC70
	movs r0, #0
	add sp, #0x10
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CC70:
	strb r0, [r5]
	b _0224CC9A
_0224CC74:
	subs r0, r6, r0
	subs r0, r4, r0
	cmp r0, #0xff
	ble _0224CC84
	movs r0, #0
	add sp, #0x10
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CC84:
	strb r0, [r5]
	b _0224CC9A
_0224CC88:
	movs r0, #4
	ldrsh r0, [r1, r0]
	cmp r0, #0xff
	ble _0224CC98
	movs r0, #0
	add sp, #0x10
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CC98:
	strb r0, [r1]
_0224CC9A:
	adds r2, r2, #1
	adds r3, r3, #2
	adds r5, r5, #1
	cmp r2, #4
	blt _0224CC46
	add r0, sp, #4
	movs r1, #4
	movs r2, #5
	bl ov02_0224CA58
	movs r2, #0
	add r1, sp, #4
	add r4, sp, #4
	movs r3, #0xf0
_0224CCB6:
	ldrb r5, [r4, #3]
	ldrb r0, [r1]
	adds r2, r2, #1
	asrs r6, r5, #4
	ands r5, r3
	orrs r5, r6
	eors r0, r5
	strb r0, [r1]
	adds r1, r1, #1
	cmp r2, #3
	blt _0224CCB6
	add r2, sp, #4
	ldrb r3, [r2, #3]
	movs r2, #0xf
	add r0, sp, #4
	ands r2, r3
	lsls r2, r2, #0x18
	movs r1, #3
	lsrs r2, r2, #0x18
	bl ov02_0224CA58
	add r1, sp, #4
	ldrb r4, [r1]
	movs r0, #0xf
	ands r0, r4
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #8
	blo _0224CCF4
	cmp r2, #0xb
	blo _0224CCFC
_0224CCF4:
	movs r0, #0
	add sp, #0x10
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CCFC:
	ldrb r2, [r1, #1]
	eors r2, r4
	strb r2, [r1, #1]
	ldrb r2, [r1, #2]
	eors r2, r4
	strb r2, [r1, #2]
	ldrb r2, [r1, #1]
	ldrb r3, [r1, #2]
	lsls r5, r2, #8
	adds r6, r5, #0
	ldr r5, [sp]
	orrs r6, r3
	cmp r5, r6
	bne _0224CD30
	movs r5, #0xf0
	ands r5, r4
	asrs r5, r5, #4
	cmp r5, #6
	bne _0224CD30
	adds r2, r4, r2
	muls r2, r3, r2
	lsls r2, r2, #0x18
	ldrb r1, [r1, #3]
	lsrs r2, r2, #0x18
	cmp r1, r2
	beq _0224CD34
_0224CD30:
	movs r0, #0
	mvns r0, r0
_0224CD34:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224CBF8

	thumb_func_start ov02_0224CD38
ov02_0224CD38: @ 0x0224CD38
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, [sp, #0x24]
	adds r7, r1, #0
	str r2, [sp, #8]
	adds r5, r3, #0
	bl FUN_02015D14
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_02028F88
	adds r1, r0, #0
	str r5, [sp]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	adds r2, r7, #0
	str r0, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r4, #0
	bl ov02_0224CAB8
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02015D54
	adds r0, r5, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224CD38

	thumb_func_start ov02_0224CD74
ov02_0224CD74: @ 0x0224CD74
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, [sp, #0x24]
	adds r7, r1, #0
	str r2, [sp, #8]
	adds r5, r3, #0
	bl FUN_02015D14
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_02028F88
	adds r1, r0, #0
	str r5, [sp]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	adds r2, r7, #0
	str r0, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r4, #0
	bl ov02_0224CBF8
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02015D54
	adds r0, r5, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224CD74

	thumb_func_start ov02_0224CDB0
ov02_0224CDB0: @ 0x0224CDB0
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r6, r1, #0
	movs r1, #0x26
	add r2, sp, #4
	add r3, sp, #0
	adds r5, r0, #0
	bl FUN_02054C20
	cmp r0, #0
	beq _0224CE1C
	movs r0, #4
	movs r1, #0x18
	bl FUN_0201AACC
	adds r4, r0, #0
	strb r6, [r4, #0xc]
	movs r0, #0
	strb r0, [r4, #0xd]
	strb r0, [r4, #0xe]
	strb r0, [r4, #0xf]
	ldr r0, [r5, #0x30]
	bl FUN_0203B004
	adds r1, r0, #0
	ldr r0, [sp]
	add r2, sp, #0x14
	bl FUN_02054DC8
	ldr r1, [sp, #4]
	add r0, sp, #8
	bl FUN_021F3B0C
	add r3, sp, #8
	ldm r3!, {r0, r1}
	adds r2, r4, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [r4]
	ldr r0, [sp, #0x14]
	adds r2, r4, #0
	adds r0, r1, r0
	str r0, [r4]
	ldr r1, [r4, #8]
	ldr r0, [sp, #0x1c]
	adds r0, r1, r0
	str r0, [r4, #8]
	ldr r0, [r5, #0x10]
	ldr r1, _0224CE24 @ =ov02_0224CE28
	bl FUN_02050530
	add sp, #0x20
	pop {r4, r5, r6, pc}
_0224CE1C:
	bl GF_AssertFail
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.align 2, 0
_0224CE24: .4byte ov02_0224CE28
	thumb_func_end ov02_0224CDB0

	thumb_func_start ov02_0224CE28
ov02_0224CE28: @ 0x0224CE28
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r4, r0, #0
	bl FUN_0205064C
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldrb r1, [r4, #0xf]
	cmp r1, #5
	bls _0224CE44
	b _0224CFC0
_0224CE44:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224CE50: @ jump table
	.2byte _0224CE5C - _0224CE50 - 2 @ case 0
	.2byte _0224CEBA - _0224CE50 - 2 @ case 1
	.2byte _0224CF1C - _0224CE50 - 2 @ case 2
	.2byte _0224CF64 - _0224CE50 - 2 @ case 3
	.2byte _0224CF76 - _0224CE50 - 2 @ case 4
	.2byte _0224CFB6 - _0224CE50 - 2 @ case 5
_0224CE5C:
	ldr r1, [r6, #0x34]
	movs r0, #0x6b
	bl FUN_021FB90C
	ldr r0, [r0]
	blx FUN_020C3B40
	cmp r0, #0
	beq _0224CE8E
	adds r2, r0, #0
	adds r2, #8
	beq _0224CE82
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0224CE82
	ldrh r1, [r0, #0xe]
	adds r1, r2, r1
	adds r1, r1, #4
	b _0224CE84
_0224CE82:
	movs r1, #0
_0224CE84:
	cmp r1, #0
	beq _0224CE8E
	ldr r1, [r1]
	adds r5, r0, r1
	b _0224CE90
_0224CE8E:
	movs r5, #0
_0224CE90:
	ldr r0, [r6, #0x34]
	bl FUN_021FB9E0
	movs r1, #0
	str r1, [sp]
	str r5, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	movs r2, #0x10
	movs r3, #0x6b
	bl FUN_021E8DE8
	ldrb r0, [r4, #0xf]
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224CFC0
_0224CEBA:
	add r1, sp, #0x18
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldrb r2, [r4, #0xd]
	movs r1, #0xc
	ldr r0, [r4]
	adds r3, r2, #0
	ldr r2, _0224CFC8 @ =0x02253DD8
	muls r3, r1, r3
	ldr r2, [r2, r3]
	adds r0, r0, r2
	str r0, [sp, #0x24]
	ldrb r2, [r4, #0xd]
	ldr r0, [r4, #4]
	adds r3, r2, #0
	ldr r2, _0224CFCC @ =0x02253DDC
	muls r3, r1, r3
	ldr r2, [r2, r3]
	adds r0, r0, r2
	str r0, [sp, #0x28]
	ldrb r2, [r4, #0xd]
	ldr r0, [r4, #8]
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _0224CFD0 @ =0x02253DE0
	ldr r1, [r1, r3]
	adds r0, r0, r1
	str r0, [sp, #0x2c]
	ldr r0, _0224CFD4 @ =0x000005FD
	bl FUN_0200604C
	ldr r0, [r6, #0x54]
	adds r6, #0x9c
	str r0, [sp]
	ldr r0, [r6]
	movs r1, #0x6b
	add r2, sp, #0x24
	add r3, sp, #0x18
	bl FUN_021F3C0C
	ldrb r1, [r4, #0xd]
	adds r1, r4, r1
	strb r0, [r1, #0x10]
	ldrb r0, [r4, #0xf]
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224CFC0
_0224CF1C:
	ldrb r0, [r4, #0xe]
	cmp r0, #0xf
	bhs _0224CF28
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	b _0224CFC0
_0224CF28:
	movs r0, #0
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #0xd]
	adds r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r1, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	cmp r1, r0
	bhs _0224CF40
	movs r0, #1
	strb r0, [r4, #0xf]
	b _0224CFC0
_0224CF40:
	adds r0, r6, #0
	adds r0, #0x9c
	ldrb r1, [r4, #0x10]
	ldr r0, [r0]
	bl FUN_021F3B60
	bl FUN_021F3B38
	adds r3, r0, #0
	ldr r0, [r6, #0x58]
	movs r1, #0x10
	movs r2, #0
	bl FUN_021E8E40
	ldrb r0, [r4, #0xf]
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224CFC0
_0224CF64:
	ldr r0, [r6, #0x58]
	movs r1, #0x10
	movs r2, #0
	bl FUN_021E8E70
	ldrb r0, [r4, #0xf]
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224CFC0
_0224CF76:
	ldr r0, [r6, #0x58]
	movs r1, #0x10
	bl FUN_021E8F10
	cmp r0, #0
	beq _0224CFC0
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	movs r2, #0x10
	bl FUN_021E8ED0
	ldrb r0, [r4, #0xc]
	movs r5, #0
	cmp r0, #0
	bls _0224CFAE
_0224CF94:
	adds r0, r4, r5
	adds r1, r6, #0
	adds r1, #0x9c
	ldrb r0, [r0, #0x10]
	ldr r1, [r1]
	bl FUN_021F36DC
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r4, #0xc]
	cmp r5, r0
	blo _0224CF94
_0224CFAE:
	ldrb r0, [r4, #0xf]
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224CFC0
_0224CFB6:
	bl FUN_0201AB0C
	add sp, #0x30
	movs r0, #1
	pop {r4, r5, r6, pc}
_0224CFC0:
	movs r0, #0
	add sp, #0x30
	pop {r4, r5, r6, pc}
	nop
_0224CFC8: .4byte 0x02253DD8
_0224CFCC: .4byte 0x02253DDC
_0224CFD0: .4byte 0x02253DE0
_0224CFD4: .4byte 0x000005FD
	thumb_func_end ov02_0224CE28

	thumb_func_start ov02_0224CFD8
ov02_0224CFD8: @ 0x0224CFD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r2, #0
	bl FUN_0205EE60
	adds r6, r0, #0
	add r1, sp, #0
	bl FUN_0205F944
	adds r0, r6, #0
	bl FUN_0205F914
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_0205F934
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_0205F2A8
	cmp r0, #3
	bhi _0224D028
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224D010: @ jump table
	.2byte _0224D018 - _0224D010 - 2 @ case 0
	.2byte _0224D01C - _0224D010 - 2 @ case 1
	.2byte _0224D020 - _0224D010 - 2 @ case 2
	.2byte _0224D024 - _0224D010 - 2 @ case 3
_0224D018:
	subs r4, r4, #1
	b _0224D02C
_0224D01C:
	adds r4, r4, #1
	b _0224D02C
_0224D020:
	subs r5, r5, #1
	b _0224D02C
_0224D024:
	adds r5, r5, #1
	b _0224D02C
_0224D028:
	bl GF_AssertFail
_0224D02C:
	movs r3, #2
	lsls r1, r5, #0x10
	lsls r3, r3, #0xe
	ldr r2, [sp, #4]
	lsls r4, r4, #0x10
	adds r1, r1, r3
	adds r0, r7, #0
	adds r3, r4, r3
	bl FUN_021FC00C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224CFD8

	thumb_func_start ov02_0224D044
ov02_0224D044: @ 0x0224D044
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r1, #0
	adds r6, r0, #0
	add r1, sp, #0
	bl FUN_0205C6AC
	adds r0, r6, #0
	bl FUN_0205C67C
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_0205C688
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_0205C654
	cmp r0, #3
	bhi _0224D090
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224D078: @ jump table
	.2byte _0224D080 - _0224D078 - 2 @ case 0
	.2byte _0224D084 - _0224D078 - 2 @ case 1
	.2byte _0224D088 - _0224D078 - 2 @ case 2
	.2byte _0224D08C - _0224D078 - 2 @ case 3
_0224D080:
	subs r4, r4, #1
	b _0224D094
_0224D084:
	adds r4, r4, #1
	b _0224D094
_0224D088:
	subs r5, r5, #1
	b _0224D094
_0224D08C:
	adds r5, r5, #1
	b _0224D094
_0224D090:
	bl GF_AssertFail
_0224D094:
	movs r3, #2
	lsls r1, r5, #0x10
	lsls r3, r3, #0xe
	ldr r2, [sp, #4]
	lsls r4, r4, #0x10
	adds r1, r1, r3
	adds r0, r7, #0
	adds r3, r4, r3
	bl FUN_021FC00C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224D044

	thumb_func_start ov02_0224D0AC
ov02_0224D0AC: @ 0x0224D0AC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	add r1, sp, #0
	bl FUN_0205C6AC
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r4, #0
	bl FUN_021FC00C
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov02_0224D0AC

	thumb_func_start ov02_0224D0C8
ov02_0224D0C8: @ 0x0224D0C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	str r2, [sp, #8]
	adds r6, r0, #0
	movs r1, #0
	movs r2, #0xdc
	adds r4, r3, #0
	ldr r7, [sp, #0x28]
	blx FUN_020E5B44
	adds r0, r6, #0
	adds r0, #0x78
	movs r1, #0x86
	adds r2, r5, #0
	movs r3, #4
	bl FUN_021FBCD8
	adds r1, r6, #0
	adds r0, r6, #0
	adds r1, #0x78
	bl FUN_021FBF2C
	adds r0, r6, #0
	adds r0, #0xd8
	str r4, [r0]
	adds r0, r6, #0
	adds r0, #0xd8
	ldr r0, [r0]
	movs r4, #0
	cmp r0, #0
	bls _0224D13E
	adds r0, r6, #0
	adds r5, r6, #0
	str r0, [sp, #0xc]
	adds r0, #0x78
	adds r5, #0x88
	str r0, [sp, #0xc]
_0224D114:
	ldr r3, [sp, #8]
	movs r0, #4
	str r0, [sp]
	ldr r1, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #0x86
	adds r3, r3, r4
	str r7, [sp, #4]
	bl FUN_021FBE44
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_021FBF50
	adds r0, r6, #0
	adds r0, #0xd8
	ldr r0, [r0]
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, r0
	blo _0224D114
_0224D13E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224D0C8

	thumb_func_start ov02_0224D144
ov02_0224D144: @ 0x0224D144
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x78
	adds r7, r1, #0
	bl FUN_021FBDA8
	adds r0, r6, #0
	adds r0, #0xd8
	ldr r0, [r0]
	movs r4, #0
	cmp r0, #0
	bls _0224D176
	adds r5, r6, #0
	adds r5, #0x88
_0224D160:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_021FBE80
	adds r0, r6, #0
	adds r0, #0xd8
	ldr r0, [r0]
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, r0
	blo _0224D160
_0224D176:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224D144

	thumb_func_start ov02_0224D178
ov02_0224D178: @ 0x0224D178
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0xd8
	ldr r0, [r0]
	movs r6, #1
	movs r4, #0
	cmp r0, #0
	bls _0224D1A6
	adds r5, r7, #0
	adds r5, #0x88
_0224D18C:
	movs r1, #1
	adds r0, r5, #0
	lsls r1, r1, #0xc
	bl FUN_021FBEE4
	ands r6, r0
	adds r0, r7, #0
	adds r0, #0xd8
	ldr r0, [r0]
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, r0
	blo _0224D18C
_0224D1A6:
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224D178

	thumb_func_start ov02_0224D1AC
ov02_0224D1AC: @ 0x0224D1AC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0xd8
	ldr r0, [r0]
	movs r4, #0
	cmp r0, #0
	bls _0224D1D8
	adds r5, r6, #0
	movs r7, #1
	adds r5, #0x88
	lsls r7, r7, #0xc
_0224D1C2:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_021FBEAC
	adds r0, r6, #0
	adds r0, #0xd8
	ldr r0, [r0]
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, r0
	blo _0224D1C2
_0224D1D8:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224D1AC

	thumb_func_start ov02_0224D1DC
ov02_0224D1DC: @ 0x0224D1DC
	ldr r3, _0224D1E0 @ =FUN_021FBF68
	bx r3
	.align 2, 0
_0224D1E0: .4byte FUN_021FBF68
	thumb_func_end ov02_0224D1DC

	thumb_func_start ov02_0224D1E4
ov02_0224D1E4: @ 0x0224D1E4
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r5, r1, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xf0
	blx FUN_020E5B44
	adds r0, r4, #0
	adds r0, #0xdc
	movs r1, #4
	movs r2, #0x20
	bl FUN_0201AC14
	adds r0, r4, #0
	adds r0, #0xdc
	movs r1, #3
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	adds r3, r1, #0
	bl ov02_0224D0C8
	ldr r0, [r5, #0x40]
	adds r1, r4, #0
	bl ov02_0224D044
	ldr r0, _0224D228 @ =0x0000064A
	bl FUN_0200604C
	movs r0, #0
	adds r4, #0xec
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224D228: .4byte 0x0000064A
	thumb_func_end ov02_0224D1E4

	thumb_func_start ov02_0224D22C
ov02_0224D22C: @ 0x0224D22C
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r5, r1, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xf0
	blx FUN_020E5B44
	adds r0, r4, #0
	adds r0, #0xdc
	movs r1, #4
	movs r2, #0x20
	bl FUN_0201AC14
	adds r0, r4, #0
	adds r0, #0xdc
	movs r1, #3
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	adds r3, r1, #0
	bl ov02_0224D0C8
	ldr r0, [r5, #0x3c]
	movs r1, #0xfd
	adds r2, r4, #0
	bl ov02_0224CFD8
	ldr r0, _0224D274 @ =0x0000064A
	bl FUN_0200604C
	movs r0, #0
	adds r4, #0xec
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0224D274: .4byte 0x0000064A
	thumb_func_end ov02_0224D22C

	thumb_func_start ov02_0224D278
ov02_0224D278: @ 0x0224D278
	ldr r3, _0224D284 @ =ov02_0224D144
	adds r0, r2, #0
	adds r2, #0xdc
	adds r1, r2, #0
	bx r3
	nop
_0224D284: .4byte ov02_0224D144
	thumb_func_end ov02_0224D278

	thumb_func_start ov02_0224D288
ov02_0224D288: @ 0x0224D288
	push {r4, lr}
	adds r4, r2, #0
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	cmp r0, #0
	beq _0224D29A
	cmp r0, #1
	pop {r4, pc}
_0224D29A:
	adds r0, r4, #0
	bl ov02_0224D178
	cmp r0, #1
	bne _0224D2B8
	adds r0, r4, #0
	movs r1, #0
	bl FUN_021FC004
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	adds r4, #0xec
	adds r0, r0, #1
	str r0, [r4]
_0224D2B8:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224D288

	thumb_func_start ov02_0224D2BC
ov02_0224D2BC: @ 0x0224D2BC
	ldr r3, _0224D2C4 @ =ov02_0224D1DC
	adds r0, r2, #0
	bx r3
	nop
_0224D2C4: .4byte ov02_0224D1DC
	thumb_func_end ov02_0224D2BC

	thumb_func_start ov02_0224D2C8
ov02_0224D2C8: @ 0x0224D2C8
	ldr r0, [r0, #4]
	ldr r3, _0224D2D4 @ =FUN_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D2D8 @ =0x02253974
	bx r3
	nop
_0224D2D4: .4byte FUN_021E67BC
_0224D2D8: .4byte 0x02253974
	thumb_func_end ov02_0224D2C8

	thumb_func_start ov02_0224D2DC
ov02_0224D2DC: @ 0x0224D2DC
	ldr r0, [r0, #4]
	ldr r3, _0224D2E8 @ =FUN_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D2EC @ =0x022539BC
	bx r3
	nop
_0224D2E8: .4byte FUN_021E67BC
_0224D2EC: .4byte 0x022539BC
	thumb_func_end ov02_0224D2DC

	thumb_func_start ov02_0224D2F0
ov02_0224D2F0: @ 0x0224D2F0
	ldr r3, _0224D2F4 @ =FUN_021E683C
	bx r3
	.align 2, 0
_0224D2F4: .4byte FUN_021E683C
	thumb_func_end ov02_0224D2F0

	thumb_func_start ov02_0224D2F8
ov02_0224D2F8: @ 0x0224D2F8
	push {r3, lr}
	bl FUN_021E687C
	adds r0, #0xec
	ldr r0, [r0]
	cmp r0, #1
	bne _0224D30A
	movs r0, #1
	pop {r3, pc}
_0224D30A:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_0224D2F8

	thumb_func_start ov02_0224D310
ov02_0224D310: @ 0x0224D310
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r5, r1, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xf0
	blx FUN_020E5B44
	adds r0, r4, #0
	adds r0, #0xdc
	movs r1, #4
	movs r2, #0x20
	bl FUN_0201AC14
	adds r0, r4, #0
	adds r0, #0xdc
	movs r2, #4
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #8
	adds r3, r2, #0
	bl ov02_0224D0C8
	ldr r0, [r5, #0x40]
	adds r1, r4, #0
	bl ov02_0224D044
	ldr r0, _0224D354 @ =0x00000649
	bl FUN_0200604C
	movs r0, #0
	adds r4, #0xec
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224D354: .4byte 0x00000649
	thumb_func_end ov02_0224D310

	thumb_func_start ov02_0224D358
ov02_0224D358: @ 0x0224D358
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r5, r1, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xf0
	blx FUN_020E5B44
	adds r0, r4, #0
	adds r0, #0xdc
	movs r1, #4
	movs r2, #0x20
	bl FUN_0201AC14
	adds r0, r4, #0
	adds r0, #0xdc
	movs r2, #4
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #8
	adds r3, r2, #0
	bl ov02_0224D0C8
	ldr r0, [r5, #0x3c]
	movs r1, #0xfd
	adds r2, r4, #0
	bl ov02_0224CFD8
	ldr r0, _0224D3A0 @ =0x00000649
	bl FUN_0200604C
	movs r0, #0
	adds r4, #0xec
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0224D3A0: .4byte 0x00000649
	thumb_func_end ov02_0224D358

	thumb_func_start ov02_0224D3A4
ov02_0224D3A4: @ 0x0224D3A4
	ldr r3, _0224D3B0 @ =ov02_0224D144
	adds r0, r2, #0
	adds r2, #0xdc
	adds r1, r2, #0
	bx r3
	nop
_0224D3B0: .4byte ov02_0224D144
	thumb_func_end ov02_0224D3A4

	thumb_func_start ov02_0224D3B4
ov02_0224D3B4: @ 0x0224D3B4
	push {r4, lr}
	adds r4, r2, #0
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	cmp r0, #0
	beq _0224D3C6
	cmp r0, #1
	pop {r4, pc}
_0224D3C6:
	adds r0, r4, #0
	bl ov02_0224D178
	cmp r0, #1
	bne _0224D3E4
	adds r0, r4, #0
	movs r1, #0
	bl FUN_021FC004
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	adds r4, #0xec
	adds r0, r0, #1
	str r0, [r4]
_0224D3E4:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224D3B4

	thumb_func_start ov02_0224D3E8
ov02_0224D3E8: @ 0x0224D3E8
	ldr r3, _0224D3F0 @ =ov02_0224D1DC
	adds r0, r2, #0
	bx r3
	nop
_0224D3F0: .4byte ov02_0224D1DC
	thumb_func_end ov02_0224D3E8

	thumb_func_start ov02_0224D3F4
ov02_0224D3F4: @ 0x0224D3F4
	ldr r0, [r0, #4]
	ldr r3, _0224D400 @ =FUN_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D404 @ =0x022538FC
	bx r3
	nop
_0224D400: .4byte FUN_021E67BC
_0224D404: .4byte 0x022538FC
	thumb_func_end ov02_0224D3F4

	thumb_func_start ov02_0224D408
ov02_0224D408: @ 0x0224D408
	ldr r0, [r0, #4]
	ldr r3, _0224D414 @ =FUN_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D418 @ =0x0225398C
	bx r3
	nop
_0224D414: .4byte FUN_021E67BC
_0224D418: .4byte 0x0225398C
	thumb_func_end ov02_0224D408

	thumb_func_start ov02_0224D41C
ov02_0224D41C: @ 0x0224D41C
	ldr r3, _0224D420 @ =FUN_021E683C
	bx r3
	.align 2, 0
_0224D420: .4byte FUN_021E683C
	thumb_func_end ov02_0224D41C

	thumb_func_start ov02_0224D424
ov02_0224D424: @ 0x0224D424
	push {r3, lr}
	bl FUN_021E687C
	adds r0, #0xec
	ldr r0, [r0]
	cmp r0, #1
	bne _0224D436
	movs r0, #1
	pop {r3, pc}
_0224D436:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_0224D424

	thumb_func_start ov02_0224D43C
ov02_0224D43C: @ 0x0224D43C
	push {r4, lr}
	adds r4, r2, #0
	movs r2, #0x73
	adds r0, r4, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	movs r0, #0x6e
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #4
	movs r2, #0x20
	bl FUN_0201AC14
	ldr r0, _0224D464 @ =0x000001CA
	movs r1, #0
	strh r1, [r4, r0]
	pop {r4, pc}
	nop
_0224D464: .4byte 0x000001CA
	thumb_func_end ov02_0224D43C

	thumb_func_start ov02_0224D468
ov02_0224D468: @ 0x0224D468
	push {r4, r5, r6, lr}
	movs r0, #0x6e
	adds r5, r2, #0
	lsls r0, r0, #2
	movs r4, #0
	adds r6, r5, r0
_0224D474:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov02_0224D144
	adds r4, r4, #1
	adds r5, #0xdc
	cmp r4, #2
	blt _0224D474
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_0224D468

	thumb_func_start ov02_0224D488
ov02_0224D488: @ 0x0224D488
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r7, _0224D574 @ =0x000001CA
	adds r4, r2, #0
	ldrh r0, [r4, r7]
	adds r5, r1, #0
	cmp r0, #3
	bhi _0224D570
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224D4A4: @ jump table
	.2byte _0224D4AC - _0224D4A4 - 2 @ case 0
	.2byte _0224D50A - _0224D4A4 - 2 @ case 1
	.2byte _0224D522 - _0224D4A4 - 2 @ case 2
	.2byte _0224D55E - _0224D4A4 - 2 @ case 3
_0224D4AC:
	ldr r2, _0224D578 @ =0x022538EC
	add r1, sp, #4
	ldrb r3, [r2, #2]
	add r0, sp, #4
	adds r1, #2
	strb r3, [r0, #2]
	ldrb r3, [r2, #3]
	strb r3, [r0, #3]
	ldrb r6, [r2, #4]
	add r3, sp, #4
	strb r6, [r0]
	ldrb r2, [r2, #5]
	strb r2, [r0, #1]
	subs r0, r7, #2
	ldrh r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0xdc
	adds r6, r2, #0
	muls r6, r0, r6
	adds r0, #0xdc
	adds r0, r4, r0
	str r0, [sp]
	ldrb r1, [r1, r2]
	ldrb r2, [r3, r2]
	adds r0, r4, r6
	movs r3, #2
	bl ov02_0224D0C8
	ldr r0, [r5, #0x40]
	adds r1, r4, r6
	bl ov02_0224D0AC
	subs r1, r7, #2
	ldrh r0, [r4, r1]
	adds r0, r0, #1
	strh r0, [r4, r1]
	ldrh r0, [r4, r1]
	cmp r0, #2
	blo _0224D570
	adds r0, r1, #2
	ldrh r0, [r4, r0]
	add sp, #8
	adds r2, r0, #1
	adds r0, r1, #2
	strh r2, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0224D50A:
	adds r0, r4, #0
	adds r0, #0xdc
	movs r1, #0
	bl FUN_021FC004
	ldr r0, _0224D57C @ =0x0000064C
	bl FUN_0200604C
	adds r0, r7, #0
	ldrh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
_0224D522:
	adds r0, r4, #0
	bl ov02_0224D178
	adds r6, r0, #0
	ldr r0, [r5, #0x40]
	adds r1, r4, #0
	bl ov02_0224D0AC
	cmp r6, #1
	bne _0224D570
	adds r0, r4, #0
	adds r0, #0xdc
	movs r1, #1
	bl FUN_021FC004
	adds r0, r4, #0
	movs r1, #0
	bl FUN_021FC004
	adds r1, r4, #0
	ldr r0, [r5, #0x40]
	adds r1, #0xdc
	bl ov02_0224D0AC
	ldr r0, _0224D574 @ =0x000001CA
	add sp, #8
	ldrh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0224D55E:
	adds r0, r4, #0
	adds r0, #0xdc
	bl ov02_0224D1AC
	adds r4, #0xdc
	ldr r0, [r5, #0x40]
	adds r1, r4, #0
	bl ov02_0224D0AC
_0224D570:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224D574: .4byte 0x000001CA
_0224D578: .4byte 0x022538EC
_0224D57C: .4byte 0x0000064C
	thumb_func_end ov02_0224D488

	thumb_func_start ov02_0224D580
ov02_0224D580: @ 0x0224D580
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	movs r4, #0
_0224D586:
	adds r0, r5, #0
	bl ov02_0224D1DC
	adds r4, r4, #1
	adds r5, #0xdc
	cmp r4, #2
	blt _0224D586
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224D580

	thumb_func_start ov02_0224D598
ov02_0224D598: @ 0x0224D598
	ldr r0, [r0, #4]
	ldr r3, _0224D5A4 @ =FUN_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D5A8 @ =0x02253944
	bx r3
	nop
_0224D5A4: .4byte FUN_021E67BC
_0224D5A8: .4byte 0x02253944
	thumb_func_end ov02_0224D598

	thumb_func_start ov02_0224D5AC
ov02_0224D5AC: @ 0x0224D5AC
	ldr r3, _0224D5B0 @ =FUN_021E683C
	bx r3
	.align 2, 0
_0224D5B0: .4byte FUN_021E683C
	thumb_func_end ov02_0224D5AC

	thumb_func_start ov02_0224D5B4
ov02_0224D5B4: @ 0x0224D5B4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r1, #0
	ldr r1, _0224D640 @ =0x022538EC
	adds r4, r2, #0
	ldrb r2, [r1]
	add r0, sp, #4
	strb r2, [r0, #1]
	ldrb r2, [r1, #1]
	strb r2, [r0]
	ldrh r2, [r1, #6]
	strh r2, [r0, #2]
	ldrh r2, [r1, #8]
	strh r2, [r0, #4]
	ldrh r2, [r1, #0xa]
	strh r2, [r0, #6]
	ldrh r1, [r1, #0xc]
	movs r2, #0xf0
	strh r1, [r0, #8]
	adds r0, r4, #0
	movs r1, #0
	blx FUN_020E5B44
	adds r0, r4, #0
	adds r0, #0xdc
	movs r1, #4
	movs r2, #0x20
	bl FUN_0201AC14
	ldr r0, [r5, #0x40]
	bl FUN_0205C654
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0xdc
	str r0, [sp]
	add r2, sp, #4
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r3, #1
	bl ov02_0224D0C8
	adds r0, r4, #0
	bl ov02_0224D1AC
	ldr r0, [r5, #0x40]
	adds r1, r4, #0
	bl ov02_0224D0AC
	add r0, sp, #4
	lsls r1, r6, #1
	adds r0, #2
	ldrh r0, [r0, r1]
	bl FUN_0201FCD4
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl FUN_021FC024
	ldr r0, _0224D644 @ =0x0000064C
	bl FUN_0200604C
	movs r0, #0
	adds r4, #0xec
	strh r0, [r4]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0224D640: .4byte 0x022538EC
_0224D644: .4byte 0x0000064C
	thumb_func_end ov02_0224D5B4

	thumb_func_start ov02_0224D648
ov02_0224D648: @ 0x0224D648
	ldr r3, _0224D654 @ =ov02_0224D144
	adds r0, r2, #0
	adds r2, #0xdc
	adds r1, r2, #0
	bx r3
	nop
_0224D654: .4byte ov02_0224D144
	thumb_func_end ov02_0224D648

	thumb_func_start ov02_0224D658
ov02_0224D658: @ 0x0224D658
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r5, r1, #0
	adds r0, r4, #0
	bl ov02_0224D1AC
	ldr r0, [r5, #0x40]
	adds r1, r4, #0
	bl ov02_0224D0AC
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224D658

	thumb_func_start ov02_0224D670
ov02_0224D670: @ 0x0224D670
	ldr r3, _0224D678 @ =ov02_0224D1DC
	adds r0, r2, #0
	bx r3
	nop
_0224D678: .4byte ov02_0224D1DC
	thumb_func_end ov02_0224D670

	thumb_func_start ov02_0224D67C
ov02_0224D67C: @ 0x0224D67C
	ldr r0, [r0, #4]
	ldr r3, _0224D688 @ =FUN_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D68C @ =0x02253914
	bx r3
	nop
_0224D688: .4byte FUN_021E67BC
_0224D68C: .4byte 0x02253914
	thumb_func_end ov02_0224D67C

	thumb_func_start ov02_0224D690
ov02_0224D690: @ 0x0224D690
	ldr r3, _0224D694 @ =FUN_021E683C
	bx r3
	.align 2, 0
_0224D694: .4byte FUN_021E683C
	thumb_func_end ov02_0224D690

	thumb_func_start ov02_0224D698
ov02_0224D698: @ 0x0224D698
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	adds r0, #0xc8
	ldr r0, [r0]
	adds r6, r1, #0
	adds r4, r2, #0
	adds r5, r3, #0
	cmp r0, #0
	beq _0224D6B0
	bl GF_AssertFail
_0224D6B0:
	adds r0, r6, #0
	add r1, sp, #0
	bl FUN_0205C6AC
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	ldr r1, [sp]
	adds r0, r7, #0
	adds r2, r2, r4
	adds r3, r3, r5
	bl FUN_021FC00C
	adds r0, r7, #0
	movs r4, #0
	adds r5, r7, #0
	movs r1, #1
	adds r0, #0xc8
	str r1, [r0]
	adds r5, #0x78
	adds r6, r4, #0
_0224D6D8:
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_021FBF20
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, #4
	blt _0224D6D8
	adds r0, r7, #0
	movs r1, #1
	bl FUN_021FC004
	ldr r0, _0224D6FC @ =0x00000626
	bl FUN_0200604C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0224D6FC: .4byte 0x00000626
	thumb_func_end ov02_0224D698

	thumb_func_start ov02_0224D700
ov02_0224D700: @ 0x0224D700
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	adds r0, #0xc8
	ldr r0, [r0]
	cmp r0, #0
	beq _0224D73A
	ldr r5, [sp]
	movs r4, #1
	movs r6, #0
	adds r5, #0x78
	lsls r7, r4, #0xc
_0224D716:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_021FBEE4
	adds r6, r6, #1
	ands r4, r0
	adds r5, #0x14
	cmp r6, #4
	blt _0224D716
	cmp r4, #1
	bne _0224D73A
	ldr r0, [sp]
	movs r1, #0
	adds r0, #0xc8
	str r1, [r0]
	ldr r0, [sp]
	bl FUN_021FC004
_0224D73A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224D700

	thumb_func_start ov02_0224D73C
ov02_0224D73C: @ 0x0224D73C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #0
	movs r2, #0xcc
	adds r7, r0, #0
	adds r5, r3, #0
	blx FUN_020E5B44
	ldr r1, [sp]
	adds r0, r7, #0
	bl FUN_021FBF2C
	adds r4, r7, #0
	movs r6, #0
	adds r4, #0x78
_0224D75E:
	ldr r1, [sp]
	ldr r2, [r5]
	ldr r3, [sp, #4]
	adds r0, r4, #0
	bl FUN_021FBE70
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_021FBF50
	adds r6, r6, #1
	adds r5, r5, #4
	adds r4, #0x14
	cmp r6, #4
	blt _0224D75E
	adds r0, r7, #0
	movs r1, #0
	bl FUN_021FC004
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224D73C

	thumb_func_start ov02_0224D788
ov02_0224D788: @ 0x0224D788
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	adds r6, r1, #0
	movs r4, #0
	adds r5, #0x78
_0224D794:
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_021FBE80
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, #4
	blt _0224D794
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0xcc
	blx FUN_020E5B44
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224D788

	thumb_func_start ov02_0224D7B0
ov02_0224D7B0: @ 0x0224D7B0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0xce
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0
	ldr r0, [r0, #0x40]
	bl FUN_0205C6AC
	movs r1, #0xcf
	lsls r1, r1, #4
	ldr r2, [sp]
	ldr r0, [r4, r1]
	subs r0, r2, r0
	bne _0224D7F8
	adds r0, r1, #4
	ldr r2, [sp, #4]
	ldr r0, [r4, r0]
	cmp r2, r0
	bge _0224D7F8
	adds r0, r1, #0
	adds r0, #8
	ldr r2, [sp, #8]
	ldr r0, [r4, r0]
	cmp r2, r0
	ble _0224D7F8
	adds r0, r1, #0
	movs r2, #0
	subs r0, #8
	str r2, [r4, r0]
	movs r2, #2
	lsls r2, r2, #0x10
	subs r0, r1, #4
	str r2, [r4, r0]
	b _0224D806
_0224D7F8:
	movs r1, #2
	ldr r0, _0224D81C @ =0x00000CE8
	lsls r1, r1, #0x10
	str r1, [r4, r0]
	lsrs r1, r1, #1
	adds r0, r0, #4
	str r1, [r4, r0]
_0224D806:
	movs r0, #0xcf
	lsls r0, r0, #4
	add r3, sp, #0
	adds r2, r4, r0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0224D81C: .4byte 0x00000CE8
	thumb_func_end ov02_0224D7B0

	thumb_func_start ov02_0224D820
ov02_0224D820: @ 0x0224D820
	push {r4, lr}
	adds r4, r0, #0
	bl ov02_0224D7B0
	movs r2, #0
	adds r1, r4, #0
_0224D82C:
	adds r0, r1, #0
	adds r0, #0xd8
	ldr r0, [r0]
	cmp r0, #0
	bne _0224D858
	adds r1, r4, #0
	movs r0, #0xcc
	movs r3, #0xce
	adds r1, #0x10
	muls r0, r2, r0
	lsls r3, r3, #4
	adds r0, r1, r0
	ldr r1, [r4, r3]
	adds r2, r3, #0
	adds r2, #8
	adds r3, #0xc
	ldr r1, [r1, #0x40]
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	bl ov02_0224D698
	pop {r4, pc}
_0224D858:
	adds r2, r2, #1
	adds r1, #0xcc
	cmp r2, #0x10
	blt _0224D82C
	bl GF_AssertFail
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224D820

	thumb_func_start ov02_0224D868
ov02_0224D868: @ 0x0224D868
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r5, #0x10
_0224D870:
	adds r0, r5, #0
	bl ov02_0224D700
	adds r4, r4, #1
	adds r5, #0xcc
	cmp r4, #0x10
	blt _0224D870
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224D868

	thumb_func_start ov02_0224D880
ov02_0224D880: @ 0x0224D880
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r2, #0
	movs r2, #0xd1
	str r1, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020E5B44
	ldr r0, _0224D90C @ =0x00000CFC
	movs r1, #4
	adds r0, r5, r0
	movs r2, #0x20
	bl FUN_0201AC14
	adds r0, r5, #0
	movs r1, #0x86
	movs r2, #8
	movs r3, #4
	bl FUN_021FBCD8
	movs r7, #0xcd
	movs r4, #0
	adds r6, r5, #0
	lsls r7, r7, #4
_0224D8B4:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x86
	adds r1, r4, #4
	movs r2, #0
	movs r3, #4
	bl FUN_02007A44
	str r0, [r6, r7]
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #4
	blt _0224D8B4
	adds r4, r5, #0
	movs r7, #0xcd
	movs r6, #0
	adds r4, #0x10
	lsls r7, r7, #4
_0224D8D8:
	ldr r2, _0224D90C @ =0x00000CFC
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r5, r2
	adds r3, r5, r7
	bl ov02_0224D73C
	adds r6, r6, #1
	adds r4, #0xcc
	cmp r6, #0x10
	blt _0224D8D8
	movs r1, #0xce
	ldr r0, [sp, #4]
	lsls r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	adds r1, #0x10
	ldr r0, [r0, #0x40]
	adds r1, r5, r1
	bl FUN_0205C6AC
	ldr r0, _0224D910 @ =0x00000D0C
	movs r1, #0
	str r1, [r5, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224D90C: .4byte 0x00000CFC
_0224D910: .4byte 0x00000D0C
	thumb_func_end ov02_0224D880

	thumb_func_start ov02_0224D914
ov02_0224D914: @ 0x0224D914
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r2, #0
	adds r4, r5, #0
	ldr r7, _0224D94C @ =0x00000CFC
	movs r6, #0
	adds r4, #0x10
_0224D920:
	adds r0, r4, #0
	adds r1, r5, r7
	bl ov02_0224D788
	adds r6, r6, #1
	adds r4, #0xcc
	cmp r6, #0x10
	blt _0224D920
	adds r0, r5, #0
	bl FUN_021FBDA8
	movs r6, #0xcd
	movs r4, #0
	lsls r6, r6, #4
_0224D93C:
	ldr r0, [r5, r6]
	bl FUN_0201AB0C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0224D93C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224D94C: .4byte 0x00000CFC
	thumb_func_end ov02_0224D914

	thumb_func_start ov02_0224D950
ov02_0224D950: @ 0x0224D950
	push {r4, lr}
	ldr r1, _0224D988 @ =0x00000D0C
	adds r4, r2, #0
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _0224D986
	adds r0, r1, #0
	subs r0, #0x28
	ldr r0, [r4, r0]
	subs r2, r0, #1
	adds r0, r1, #0
	subs r0, #0x28
	str r2, [r4, r0]
	adds r0, r1, #0
	subs r0, #0x28
	ldr r0, [r4, r0]
	cmp r0, #0
	bge _0224D980
	movs r0, #4
	subs r1, #0x28
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov02_0224D820
_0224D980:
	adds r0, r4, #0
	bl ov02_0224D868
_0224D986:
	pop {r4, pc}
	.align 2, 0
_0224D988: .4byte 0x00000D0C
	thumb_func_end ov02_0224D950

	thumb_func_start ov02_0224D98C
ov02_0224D98C: @ 0x0224D98C
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	movs r4, #0
	adds r5, #0x10
_0224D994:
	adds r0, r5, #0
	bl FUN_021FBF68
	adds r4, r4, #1
	adds r5, #0xcc
	cmp r4, #0x10
	blt _0224D994
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224D98C

	thumb_func_start ov02_0224D9A4
ov02_0224D9A4: @ 0x0224D9A4
	ldr r0, [r0, #4]
	ldr r3, _0224D9B0 @ =FUN_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D9B4 @ =0x0225395C
	bx r3
	nop
_0224D9B0: .4byte FUN_021E67BC
_0224D9B4: .4byte 0x0225395C
	thumb_func_end ov02_0224D9A4

	thumb_func_start ov02_0224D9B8
ov02_0224D9B8: @ 0x0224D9B8
	ldr r3, _0224D9BC @ =FUN_021E683C
	bx r3
	.align 2, 0
_0224D9BC: .4byte FUN_021E683C
	thumb_func_end ov02_0224D9B8

	thumb_func_start ov02_0224D9C0
ov02_0224D9C0: @ 0x0224D9C0
	push {r3, r4, r5, lr}
	sub sp, #0x28
	adds r4, r2, #0
	movs r2, #0x45
	adds r5, r1, #0
	adds r0, r4, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	adds r0, r4, #0
	adds r0, #0xdc
	movs r1, #4
	movs r2, #0x20
	bl FUN_0201AC14
	adds r0, r4, #0
	adds r0, #0xdc
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0x11
	movs r3, #2
	bl ov02_0224D0C8
	ldr r0, [r5, #0x40]
	adds r1, r4, #0
	bl ov02_0224D044
	ldr r1, [r5, #0x24]
	add r0, sp, #0x10
	bl FUN_02023630
	add r3, sp, #0x10
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	adds r2, #0xf8
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [r5, #0x24]
	add r0, sp, #4
	bl FUN_02023640
	add r3, sp, #4
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	adds r2, #0xec
	stm r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0x1c
	str r0, [r2]
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r5, #0x40]
	bl FUN_0205C654
	cmp r0, #3
	bhi _0224DA7C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224DA46: @ jump table
	.2byte _0224DA4E - _0224DA46 - 2 @ case 0
	.2byte _0224DA5A - _0224DA46 - 2 @ case 1
	.2byte _0224DA66 - _0224DA46 - 2 @ case 2
	.2byte _0224DA72 - _0224DA46 - 2 @ case 3
_0224DA4E:
	movs r0, #2
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0xe
	subs r0, r1, r0
	str r0, [sp, #0x24]
	b _0224DA7C
_0224DA5A:
	movs r0, #2
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0x24]
	b _0224DA7C
_0224DA66:
	movs r0, #2
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0xe
	subs r0, r1, r0
	str r0, [sp, #0x1c]
	b _0224DA7C
_0224DA72:
	movs r0, #2
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0x1c]
_0224DA7C:
	movs r0, #0x41
	lsls r0, r0, #2
	add r3, sp, #0x1c
	adds r2, r4, r0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, _0224DA9C @ =0x000008FE
	bl FUN_0200604C
	ldr r0, _0224DAA0 @ =0x00000113
	movs r1, #0
	strb r1, [r4, r0]
	add sp, #0x28
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224DA9C: .4byte 0x000008FE
_0224DAA0: .4byte 0x00000113
	thumb_func_end ov02_0224D9C0

	thumb_func_start ov02_0224DAA4
ov02_0224DAA4: @ 0x0224DAA4
	push {r3, r4, r5, lr}
	sub sp, #0x28
	adds r4, r2, #0
	movs r2, #0x45
	adds r5, r1, #0
	adds r0, r4, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	adds r0, r4, #0
	adds r0, #0xdc
	movs r1, #4
	movs r2, #0x20
	bl FUN_0201AC14
	adds r0, r4, #0
	adds r0, #0xdc
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0x11
	movs r3, #2
	bl ov02_0224D0C8
	ldr r0, [r5, #0x3c]
	movs r1, #0xfd
	adds r2, r4, #0
	bl ov02_0224CFD8
	ldr r1, [r5, #0x24]
	add r0, sp, #0x10
	bl FUN_02023630
	add r3, sp, #0x10
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	adds r2, #0xf8
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [r5, #0x24]
	add r0, sp, #4
	bl FUN_02023640
	add r3, sp, #4
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	adds r2, #0xec
	stm r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0x1c
	str r0, [r2]
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r5, #0x40]
	bl FUN_0205C654
	cmp r0, #3
	bhi _0224DB62
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224DB2C: @ jump table
	.2byte _0224DB34 - _0224DB2C - 2 @ case 0
	.2byte _0224DB40 - _0224DB2C - 2 @ case 1
	.2byte _0224DB4C - _0224DB2C - 2 @ case 2
	.2byte _0224DB58 - _0224DB2C - 2 @ case 3
_0224DB34:
	movs r0, #2
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0xe
	subs r0, r1, r0
	str r0, [sp, #0x24]
	b _0224DB62
_0224DB40:
	movs r0, #2
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0x24]
	b _0224DB62
_0224DB4C:
	movs r0, #2
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0xe
	subs r0, r1, r0
	str r0, [sp, #0x1c]
	b _0224DB62
_0224DB58:
	movs r0, #2
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0x1c]
_0224DB62:
	movs r0, #0x41
	lsls r0, r0, #2
	add r3, sp, #0x1c
	adds r2, r4, r0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, _0224DB84 @ =0x000008FE
	bl FUN_0200604C
	ldr r0, _0224DB88 @ =0x00000113
	movs r1, #0
	strb r1, [r4, r0]
	add sp, #0x28
	pop {r3, r4, r5, pc}
	nop
_0224DB84: .4byte 0x000008FE
_0224DB88: .4byte 0x00000113
	thumb_func_end ov02_0224DAA4

	thumb_func_start ov02_0224DB8C
ov02_0224DB8C: @ 0x0224DB8C
	ldr r3, _0224DB98 @ =ov02_0224D144
	adds r0, r2, #0
	adds r2, #0xdc
	adds r1, r2, #0
	bx r3
	nop
_0224DB98: .4byte ov02_0224D144
	thumb_func_end ov02_0224DB8C

	thumb_func_start ov02_0224DB9C
ov02_0224DB9C: @ 0x0224DB9C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _0224DC50 @ =0x00000113
	adds r4, r2, #0
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0224DBB0
	cmp r0, #1
	beq _0224DC38
	pop {r3, r4, r5, pc}
_0224DBB0:
	subs r0, r1, #1
	ldrb r0, [r4, r0]
	cmp r0, #2
	bhs _0224DC1C
	subs r0, r1, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bgt _0224DC12
	movs r2, #1
	subs r0, r1, #3
	strb r2, [r4, r0]
	subs r0, r1, #2
	ldrb r0, [r4, r0]
	adds r0, r0, #1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r2, r2, r1
	adds r1, r0, #0
	adds r1, #0xf2
	strb r2, [r4, r1]
	adds r1, r0, #0
	adds r1, #0xf2
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0224DBF4
	adds r0, #0xe5
	ldr r1, [r5, #0x24]
	adds r0, r4, r0
	bl FUN_02023514
	b _0224DC1C
_0224DBF4:
	adds r0, r4, #0
	ldr r1, [r5, #0x24]
	adds r0, #0xf8
	bl FUN_0202365C
	adds r0, r4, #0
	ldr r1, [r5, #0x24]
	adds r0, #0xec
	bl FUN_0202366C
	ldr r0, _0224DC54 @ =0x00000112
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _0224DC1C
_0224DC12:
	subs r0, r1, #3
	ldrsb r0, [r4, r0]
	subs r2, r0, #1
	subs r0, r1, #3
	strb r2, [r4, r0]
_0224DC1C:
	adds r0, r4, #0
	bl ov02_0224D178
	cmp r0, #1
	bne _0224DC4C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_021FC004
	ldr r0, _0224DC50 @ =0x00000113
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	pop {r3, r4, r5, pc}
_0224DC38:
	adds r0, r4, #0
	ldr r1, [r5, #0x24]
	adds r0, #0xf8
	bl FUN_0202365C
	adds r4, #0xec
	ldr r1, [r5, #0x24]
	adds r0, r4, #0
	bl FUN_0202366C
_0224DC4C:
	pop {r3, r4, r5, pc}
	nop
_0224DC50: .4byte 0x00000113
_0224DC54: .4byte 0x00000112
	thumb_func_end ov02_0224DB9C

	thumb_func_start ov02_0224DC58
ov02_0224DC58: @ 0x0224DC58
	ldr r3, _0224DC60 @ =ov02_0224D1DC
	adds r0, r2, #0
	bx r3
	nop
_0224DC60: .4byte ov02_0224D1DC
	thumb_func_end ov02_0224DC58

	thumb_func_start ov02_0224DC64
ov02_0224DC64: @ 0x0224DC64
	ldr r0, [r0, #4]
	ldr r3, _0224DC70 @ =FUN_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224DC74 @ =0x022539A4
	bx r3
	nop
_0224DC70: .4byte FUN_021E67BC
_0224DC74: .4byte 0x022539A4
	thumb_func_end ov02_0224DC64

	thumb_func_start ov02_0224DC78
ov02_0224DC78: @ 0x0224DC78
	ldr r0, [r0, #4]
	ldr r3, _0224DC84 @ =FUN_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224DC88 @ =0x0225392C
	bx r3
	nop
_0224DC84: .4byte FUN_021E67BC
_0224DC88: .4byte 0x0225392C
	thumb_func_end ov02_0224DC78

	thumb_func_start ov02_0224DC8C
ov02_0224DC8C: @ 0x0224DC8C
	ldr r3, _0224DC90 @ =FUN_021E683C
	bx r3
	.align 2, 0
_0224DC90: .4byte FUN_021E683C
	thumb_func_end ov02_0224DC8C

	thumb_func_start ov02_0224DC94
ov02_0224DC94: @ 0x0224DC94
	push {r3, lr}
	bl FUN_021E687C
	ldr r1, _0224DCAC @ =0x00000113
	ldrb r0, [r0, r1]
	cmp r0, #1
	bne _0224DCA6
	movs r0, #1
	pop {r3, pc}
_0224DCA6:
	movs r0, #0
	pop {r3, pc}
	nop
_0224DCAC: .4byte 0x00000113
	thumb_func_end ov02_0224DC94

	thumb_func_start ov02_0224DCB0
ov02_0224DCB0: @ 0x0224DCB0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r2, #0
	str r1, [sp, #4]
	ldr r2, _0224DD28 @ =0x00000E9C
	adds r0, r6, #0
	movs r1, #0
	blx FUN_020E5B44
	ldr r0, _0224DD2C @ =0x00000E88
	movs r1, #4
	adds r0, r6, r0
	movs r2, #0x20
	bl FUN_0201AC14
	adds r0, r6, #0
	movs r1, #0x86
	movs r2, #8
	movs r3, #4
	bl FUN_021FBCD8
	ldr r7, _0224DD30 @ =0x00000E68
	movs r4, #0
	adds r5, r6, #0
_0224DCE0:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x86
	adds r1, r4, #4
	movs r2, #0
	movs r3, #4
	bl FUN_02007A44
	str r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0224DCE0
	adds r4, r6, #0
	ldr r7, _0224DD30 @ =0x00000E68
	movs r5, #0
	adds r4, #0x10
_0224DD02:
	ldr r2, _0224DD2C @ =0x00000E88
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r6, r2
	adds r3, r6, r7
	bl ov02_0224DEA8
	adds r5, r5, #1
	adds r4, #0xcc
	cmp r5, #0x12
	blt _0224DD02
	ldr r1, _0224DD34 @ =0x00000E78
	ldr r0, [sp, #4]
	str r0, [r6, r1]
	movs r0, #0
	adds r1, #0x20
	strh r0, [r6, r1]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224DD28: .4byte 0x00000E9C
_0224DD2C: .4byte 0x00000E88
_0224DD30: .4byte 0x00000E68
_0224DD34: .4byte 0x00000E78
	thumb_func_end ov02_0224DCB0

	thumb_func_start ov02_0224DD38
ov02_0224DD38: @ 0x0224DD38
	push {r4, lr}
	adds r4, r2, #0
	bl ov02_0224DCB0
	ldr r0, _0224DD48 @ =0x00000E9A
	movs r1, #1
	strh r1, [r4, r0]
	pop {r4, pc}
	.align 2, 0
_0224DD48: .4byte 0x00000E9A
	thumb_func_end ov02_0224DD38

	thumb_func_start ov02_0224DD4C
ov02_0224DD4C: @ 0x0224DD4C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r2, #0
	adds r4, r5, #0
	ldr r7, _0224DD84 @ =0x00000E88
	movs r6, #0
	adds r4, #0x10
_0224DD58:
	adds r0, r4, #0
	adds r1, r5, r7
	bl ov02_0224DEF4
	adds r6, r6, #1
	adds r4, #0xcc
	cmp r6, #0x12
	blt _0224DD58
	adds r0, r5, #0
	bl FUN_021FBDA8
	ldr r6, _0224DD88 @ =0x00000E68
	movs r4, #0
_0224DD72:
	ldr r0, [r5, r6]
	bl FUN_0201AB0C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0224DD72
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224DD84: .4byte 0x00000E88
_0224DD88: .4byte 0x00000E68
	thumb_func_end ov02_0224DD4C

	thumb_func_start ov02_0224DD8C
ov02_0224DD8C: @ 0x0224DD8C
	push {r4, lr}
	ldr r1, _0224DDC4 @ =0x00000E98
	adds r4, r2, #0
	ldrh r0, [r4, r1]
	cmp r0, #0
	bne _0224DDC2
	adds r0, r1, #0
	subs r0, #0x1c
	ldr r0, [r4, r0]
	subs r2, r0, #1
	adds r0, r1, #0
	subs r0, #0x1c
	str r2, [r4, r0]
	adds r0, r1, #0
	subs r0, #0x1c
	ldr r0, [r4, r0]
	cmp r0, #0
	bge _0224DDBC
	movs r0, #4
	subs r1, #0x1c
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov02_0224DF1C
_0224DDBC:
	adds r0, r4, #0
	bl ov02_0224E008
_0224DDC2:
	pop {r4, pc}
	.align 2, 0
_0224DDC4: .4byte 0x00000E98
	thumb_func_end ov02_0224DD8C

	thumb_func_start ov02_0224DDC8
ov02_0224DDC8: @ 0x0224DDC8
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	movs r4, #0
	adds r5, #0x10
_0224DDD0:
	adds r0, r5, #0
	bl FUN_021FBF68
	adds r4, r4, #1
	adds r5, #0xcc
	cmp r4, #0x12
	blt _0224DDD0
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224DDC8

	thumb_func_start ov02_0224DDE0
ov02_0224DDE0: @ 0x0224DDE0
	ldr r0, [r0, #4]
	ldr r3, _0224DDEC @ =FUN_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224DDF0 @ =0x022539D4
	bx r3
	nop
_0224DDEC: .4byte FUN_021E67BC
_0224DDF0: .4byte 0x022539D4
	thumb_func_end ov02_0224DDE0

	thumb_func_start ov02_0224DDF4
ov02_0224DDF4: @ 0x0224DDF4
	ldr r0, [r0, #4]
	ldr r3, _0224DE00 @ =FUN_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224DE04 @ =0x022539EC
	bx r3
	nop
_0224DE00: .4byte FUN_021E67BC
_0224DE04: .4byte 0x022539EC
	thumb_func_end ov02_0224DDF4

	thumb_func_start ov02_0224DE08
ov02_0224DE08: @ 0x0224DE08
	ldr r3, _0224DE0C @ =FUN_021E683C
	bx r3
	.align 2, 0
_0224DE0C: .4byte FUN_021E683C
	thumb_func_end ov02_0224DE08

	thumb_func_start ov02_0224DE10
ov02_0224DE10: @ 0x0224DE10
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0xc8
	ldr r0, [r0]
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r0, #0
	beq _0224DE26
	bl GF_AssertFail
_0224DE26:
	ldr r2, [r4, #4]
	ldr r3, [r4, #8]
	ldr r1, [r4]
	adds r0, r7, #0
	adds r2, r2, r5
	adds r3, r3, r6
	bl FUN_021FC00C
	adds r0, r7, #0
	movs r4, #0
	adds r5, r7, #0
	movs r1, #1
	adds r0, #0xc8
	str r1, [r0]
	adds r5, #0x78
	adds r6, r4, #0
_0224DE46:
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_021FBF20
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, #4
	blt _0224DE46
	adds r0, r7, #0
	movs r1, #1
	bl FUN_021FC004
	ldr r0, _0224DE68 @ =0x00000626
	bl FUN_0200604C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224DE68: .4byte 0x00000626
	thumb_func_end ov02_0224DE10

	thumb_func_start ov02_0224DE6C
ov02_0224DE6C: @ 0x0224DE6C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	adds r0, #0xc8
	ldr r0, [r0]
	cmp r0, #0
	beq _0224DEA6
	ldr r5, [sp]
	movs r4, #1
	movs r6, #0
	adds r5, #0x78
	lsls r7, r4, #0xc
_0224DE82:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_021FBEE4
	adds r6, r6, #1
	ands r4, r0
	adds r5, #0x14
	cmp r6, #4
	blt _0224DE82
	cmp r4, #1
	bne _0224DEA6
	ldr r0, [sp]
	movs r1, #0
	adds r0, #0xc8
	str r1, [r0]
	ldr r0, [sp]
	bl FUN_021FC004
_0224DEA6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224DE6C

	thumb_func_start ov02_0224DEA8
ov02_0224DEA8: @ 0x0224DEA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #0
	movs r2, #0xcc
	adds r7, r0, #0
	adds r5, r3, #0
	blx FUN_020E5B44
	ldr r1, [sp]
	adds r0, r7, #0
	bl FUN_021FBF2C
	adds r4, r7, #0
	movs r6, #0
	adds r4, #0x78
_0224DECA:
	ldr r1, [sp]
	ldr r2, [r5]
	ldr r3, [sp, #4]
	adds r0, r4, #0
	bl FUN_021FBE70
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_021FBF50
	adds r6, r6, #1
	adds r5, r5, #4
	adds r4, #0x14
	cmp r6, #4
	blt _0224DECA
	adds r0, r7, #0
	movs r1, #0
	bl FUN_021FC004
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224DEA8

	thumb_func_start ov02_0224DEF4
ov02_0224DEF4: @ 0x0224DEF4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	adds r6, r1, #0
	movs r4, #0
	adds r5, #0x78
_0224DF00:
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_021FBE80
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, #4
	blt _0224DF00
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0xcc
	blx FUN_020E5B44
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224DEF4

	thumb_func_start ov02_0224DF1C
ov02_0224DF1C: @ 0x0224DF1C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0x3a
	movs r2, #3
	lsls r0, r0, #0xc
	lsls r1, r1, #6
	str r0, [r4, r1]
	adds r0, r1, #4
	lsls r2, r2, #0xc
	subs r1, #8
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	add r1, sp, #0xc
	ldr r0, [r0, #0x40]
	bl FUN_0205C6AC
	ldr r0, _0224E004 @ =0x00000E9A
	ldrh r1, [r4, r0]
	cmp r1, #0
	beq _0224DFC6
	subs r0, #0x22
	ldr r0, [r4, r0]
	bl FUN_02069D68
	add r1, sp, #0
	bl FUN_0205F944
	movs r5, #0
	adds r1, r4, #0
_0224DF5A:
	adds r0, r1, #0
	adds r0, #0xd8
	ldr r0, [r0]
	cmp r0, #0
	bne _0224DF80
	movs r3, #0x3a
	lsls r3, r3, #6
	adds r1, r4, #0
	movs r0, #0xcc
	ldr r2, [r4, r3]
	adds r3, r3, #4
	adds r1, #0x10
	muls r0, r5, r0
	adds r0, r1, r0
	ldr r3, [r4, r3]
	add r1, sp, #0xc
	bl ov02_0224DE10
	b _0224DF88
_0224DF80:
	adds r5, r5, #1
	adds r1, #0xcc
	cmp r5, #0x12
	blt _0224DF5A
_0224DF88:
	cmp r5, #0x12
	bne _0224DF90
	bl GF_AssertFail
_0224DF90:
	movs r0, #0
	adds r2, r4, #0
_0224DF94:
	adds r1, r2, #0
	adds r1, #0xd8
	ldr r1, [r1]
	cmp r1, #0
	bne _0224DFBC
	adds r2, r4, #0
	movs r1, #0xcc
	movs r3, #0x3a
	adds r2, #0x10
	muls r1, r0, r1
	adds r0, r2, r1
	lsls r3, r3, #6
	ldr r2, [r4, r3]
	adds r3, r3, #4
	ldr r3, [r4, r3]
	add r1, sp, #0
	bl ov02_0224DE10
	add sp, #0x18
	pop {r3, r4, r5, pc}
_0224DFBC:
	adds r0, r0, #1
	adds r2, #0xcc
	cmp r0, #0x12
	blt _0224DF94
	b _0224DFFA
_0224DFC6:
	movs r0, #0
	adds r2, r4, #0
_0224DFCA:
	adds r1, r2, #0
	adds r1, #0xd8
	ldr r1, [r1]
	cmp r1, #0
	bne _0224DFF2
	adds r2, r4, #0
	movs r1, #0xcc
	movs r3, #0x3a
	adds r2, #0x10
	muls r1, r0, r1
	adds r0, r2, r1
	lsls r3, r3, #6
	ldr r2, [r4, r3]
	adds r3, r3, #4
	ldr r3, [r4, r3]
	add r1, sp, #0xc
	bl ov02_0224DE10
	add sp, #0x18
	pop {r3, r4, r5, pc}
_0224DFF2:
	adds r0, r0, #1
	adds r2, #0xcc
	cmp r0, #0x12
	blt _0224DFCA
_0224DFFA:
	bl GF_AssertFail
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_0224E004: .4byte 0x00000E9A
	thumb_func_end ov02_0224DF1C

	thumb_func_start ov02_0224E008
ov02_0224E008: @ 0x0224E008
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r5, #0x10
_0224E010:
	adds r0, r5, #0
	bl ov02_0224DE6C
	adds r4, r4, #1
	adds r5, #0xcc
	cmp r4, #0x12
	blt _0224E010
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224E008

	thumb_func_start ov02_0224E020
ov02_0224E020: @ 0x0224E020
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224E032
	cmp r0, #1
	beq _0224E04A
	pop {r3, r4, r5, pc}
_0224E032:
	ldr r1, [r4, #0xc]
	ldr r0, [r4]
	lsls r2, r1, #2
	ldr r1, _0224E06C @ =0x02253A34
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #1
	bne _0224E068
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224E04A:
	ldr r1, [r4, #0xc]
	ldr r0, [r4]
	lsls r2, r1, #2
	ldr r1, _0224E070 @ =0x02253A04
	ldr r1, [r1, r2]
	blx r1
	ldr r0, [r4, #4]
	movs r1, #1
	strh r1, [r0]
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
_0224E068:
	pop {r3, r4, r5, pc}
	nop
_0224E06C: .4byte 0x02253A34
_0224E070: .4byte 0x02253A04
	thumb_func_end ov02_0224E020

	thumb_func_start ov02_0224E074
ov02_0224E074: @ 0x0224E074
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r0, r3, #0
	movs r1, #0x10
	adds r4, r2, #0
	bl FUN_0201AA8C
	adds r6, r0, #0
	adds r2, r6, #0
	movs r1, #0x10
	movs r0, #0
_0224E08C:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0224E08C
	ldr r1, _0224E0B4 @ =0x02253A1C
	lsls r2, r4, #2
	ldr r1, [r1, r2]
	adds r0, r7, #0
	blx r1
	str r0, [r6]
	str r5, [r6, #4]
	ldr r0, _0224E0B8 @ =ov02_0224E020
	str r4, [r6, #0xc]
	movs r2, #0
	adds r1, r6, #0
	strh r2, [r5]
	bl FUN_0200E320
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224E0B4: .4byte 0x02253A1C
_0224E0B8: .4byte ov02_0224E020
	thumb_func_end ov02_0224E074

	thumb_func_start ov02_0224E0BC
ov02_0224E0BC: @ 0x0224E0BC
	push {r4, lr}
	adds r4, r2, #0
	bl ov02_0224E0D4
	adds r2, r0, #0
	ldr r1, _0224E0D0 @ =ov02_0224E0EC
	adds r0, r4, #0
	bl FUN_02050530
	pop {r4, pc}
	.align 2, 0
_0224E0D0: .4byte ov02_0224E0EC
	thumb_func_end ov02_0224E0BC

	thumb_func_start ov02_0224E0D4
ov02_0224E0D4: @ 0x0224E0D4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #4
	movs r1, #0x20
	bl FUN_0201AACC
	movs r1, #0
	str r1, [r0]
	str r5, [r0, #4]
	str r4, [r0, #8]
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224E0D4

	thumb_func_start ov02_0224E0EC
ov02_0224E0EC: @ 0x0224E0EC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl FUN_0205064C
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldr r0, [r4]
	movs r5, #0
	cmp r0, #5
	bls _0224E108
	b _0224E21E
_0224E108:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224E114: @ jump table
	.2byte _0224E120 - _0224E114 - 2 @ case 0
	.2byte _0224E130 - _0224E114 - 2 @ case 1
	.2byte _0224E156 - _0224E114 - 2 @ case 2
	.2byte _0224E1AA - _0224E114 - 2 @ case 3
	.2byte _0224E1C6 - _0224E114 - 2 @ case 4
	.2byte _0224E1F6 - _0224E114 - 2 @ case 5
_0224E120:
	adds r0, r6, #0
	bl FUN_02069D68
	bl FUN_0205F708
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0224E130:
	ldr r0, [r4, #4]
	bl FUN_02062108
	cmp r0, #0
	beq _0224E21E
	ldr r0, [r4, #8]
	bl FUN_02062108
	cmp r0, #0
	beq _0224E21E
	adds r0, r6, #0
	bl FUN_02069D68
	bl FUN_0205F6FC
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224E21E
_0224E156:
	ldr r0, [r4, #4]
	bl FUN_0205F914
	str r0, [r4, #0xc]
	ldr r0, [r4, #4]
	bl FUN_0205F934
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	bl FUN_0205F2A8
	str r0, [r4, #0x14]
	ldr r0, [r4, #8]
	bl FUN_0205F914
	str r0, [r4, #0x18]
	ldr r0, [r4, #8]
	bl FUN_0205F934
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xc
	adds r1, #0x18
	bl ov02_0224E224
	adds r6, r0, #0
	ldr r0, [r4, #4]
	adds r1, r6, #0
	bl FUN_0206214C
	adds r0, r6, #0
	bl ov02_0224E2D4
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl FUN_0206214C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224E21E
_0224E1AA:
	ldr r0, [r4, #4]
	bl FUN_02062108
	cmp r0, #0
	beq _0224E21E
	ldr r0, [r4, #8]
	bl FUN_02062108
	cmp r0, #0
	beq _0224E21E
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224E21E
_0224E1C6:
	ldr r0, [r4, #4]
	bl FUN_0205F2A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov02_0224E2A0
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl FUN_0206214C
	ldr r0, [r4, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov02_0224E26C
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl FUN_0206214C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224E21E
_0224E1F6:
	ldr r0, [r4, #4]
	bl FUN_02062108
	cmp r0, #0
	beq _0224E21E
	ldr r0, [r4, #8]
	bl FUN_02062108
	cmp r0, #0
	beq _0224E21E
	ldr r0, [r4, #4]
	bl FUN_020621C0
	ldr r0, [r4, #8]
	bl FUN_020621C0
	adds r0, r4, #0
	movs r5, #1
	bl FUN_0201AB0C
_0224E21E:
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_0224E0EC

	thumb_func_start ov02_0224E224
ov02_0224E224: @ 0x0224E224
	push {r3, r4, r5, lr}
	ldr r5, [r1]
	ldr r3, [r0]
	movs r4, #0xd
	cmp r3, r5
	bne _0224E246
	ldr r1, [r1, #4]
	ldr r0, [r0, #4]
	cmp r0, r1
	ble _0224E23C
	movs r4, #0xc
	b _0224E268
_0224E23C:
	cmp r0, r1
	blt _0224E268
	bl GF_AssertFail
	b _0224E268
_0224E246:
	ldr r2, [r0, #4]
	ldr r0, [r1, #4]
	cmp r2, r0
	bne _0224E264
	cmp r3, r5
	ble _0224E256
	movs r4, #0xe
	b _0224E268
_0224E256:
	cmp r3, r5
	bge _0224E25E
	movs r4, #0xf
	b _0224E268
_0224E25E:
	bl GF_AssertFail
	b _0224E268
_0224E264:
	bl GF_AssertFail
_0224E268:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224E224

	thumb_func_start ov02_0224E26C
ov02_0224E26C: @ 0x0224E26C
	push {r3, lr}
	cmp r0, #3
	bhi _0224E296
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224E27E: @ jump table
	.2byte _0224E286 - _0224E27E - 2 @ case 0
	.2byte _0224E28A - _0224E27E - 2 @ case 1
	.2byte _0224E28E - _0224E27E - 2 @ case 2
	.2byte _0224E292 - _0224E27E - 2 @ case 3
_0224E286:
	movs r0, #0
	pop {r3, pc}
_0224E28A:
	movs r0, #1
	pop {r3, pc}
_0224E28E:
	movs r0, #2
	pop {r3, pc}
_0224E292:
	movs r0, #3
	pop {r3, pc}
_0224E296:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_0224E26C

	thumb_func_start ov02_0224E2A0
ov02_0224E2A0: @ 0x0224E2A0
	push {r3, lr}
	cmp r0, #3
	bhi _0224E2CA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224E2B2: @ jump table
	.2byte _0224E2BA - _0224E2B2 - 2 @ case 0
	.2byte _0224E2BE - _0224E2B2 - 2 @ case 1
	.2byte _0224E2C2 - _0224E2B2 - 2 @ case 2
	.2byte _0224E2C6 - _0224E2B2 - 2 @ case 3
_0224E2BA:
	movs r0, #1
	pop {r3, pc}
_0224E2BE:
	movs r0, #0
	pop {r3, pc}
_0224E2C2:
	movs r0, #3
	pop {r3, pc}
_0224E2C6:
	movs r0, #2
	pop {r3, pc}
_0224E2CA:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_0224E2A0

	thumb_func_start ov02_0224E2D4
ov02_0224E2D4: @ 0x0224E2D4
	push {r3, lr}
	subs r0, #0xc
	cmp r0, #3
	bhi _0224E300
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224E2E8: @ jump table
	.2byte _0224E2F0 - _0224E2E8 - 2 @ case 0
	.2byte _0224E2F4 - _0224E2E8 - 2 @ case 1
	.2byte _0224E2F8 - _0224E2E8 - 2 @ case 2
	.2byte _0224E2FC - _0224E2E8 - 2 @ case 3
_0224E2F0:
	movs r0, #0xd
	pop {r3, pc}
_0224E2F4:
	movs r0, #0xc
	pop {r3, pc}
_0224E2F8:
	movs r0, #0xf
	pop {r3, pc}
_0224E2FC:
	movs r0, #0xe
	pop {r3, pc}
_0224E300:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov02_0224E2D4

	thumb_func_start ov02_0224E308
ov02_0224E308: @ 0x0224E308
	ldr r1, _0224E318 @ =0x00000165
	cmp r0, r1
	bne _0224E312
	movs r0, #1
	bx lr
_0224E312:
	movs r0, #0
	bx lr
	nop
_0224E318: .4byte 0x00000165
	thumb_func_end ov02_0224E308

	thumb_func_start ov02_0224E31C
ov02_0224E31C: @ 0x0224E31C
	subs r0, #0x20
	asrs r2, r0, #4
	lsrs r2, r2, #0x1b
	adds r2, r0, r2
	subs r1, #0x20
	asrs r0, r1, #4
	lsrs r0, r0, #0x1b
	adds r0, r1, r0
	asrs r1, r0, #5
	lsls r0, r1, #1
	asrs r2, r2, #5
	adds r0, r1, r0
	adds r0, r2, r0
	bmi _0224E33C
	cmp r0, #6
	blt _0224E33E
_0224E33C:
	movs r0, #0
_0224E33E:
	bx lr
	thumb_func_end ov02_0224E31C

	thumb_func_start ov02_0224E340
ov02_0224E340: @ 0x0224E340
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	bl FUN_0205C67C
	adds r4, r0, #0
	ldr r0, [r5, #0x40]
	bl FUN_0205C688
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov02_0224E31C
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224E340

	thumb_func_start ov02_0224E35C
ov02_0224E35C: @ 0x0224E35C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_020503D0
	adds r6, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_0203B9C4
	bl FUN_0203B958
	ldr r0, [r5, #0xc]
	bl FUN_0202F57C
	adds r4, r0, #0
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl ov02_0224E308
	cmp r0, #0
	bne _0224E38E
	add sp, #0x1c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E38E:
	adds r0, r6, #0
	bl FUN_02066860
	cmp r0, #0
	bne _0224E39E
	add sp, #0x1c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E39E:
	adds r0, r4, #0
	bl FUN_0202F620
	cmp r0, #0
	beq _0224E3AE
	add sp, #0x1c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E3AE:
	adds r0, r4, #0
	bl FUN_0202F720
	cmp r0, #0
	bne _0224E3BE
	add sp, #0x1c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E3BE:
	ldr r0, [r5, #0x40]
	bl FUN_0205C654
	adds r7, r0, #0
	ldr r0, [r5, #0x40]
	bl FUN_0205C67C
	adds r4, r0, #0
	ldr r0, [r5, #0x40]
	bl FUN_0205C688
	str r0, [sp, #8]
	adds r0, r7, #0
	bl FUN_02060F0C
	adds r6, r4, r0
	adds r0, r7, #0
	bl FUN_02060F18
	ldr r1, [sp, #8]
	adds r4, r1, r0
	cmp r6, #0x20
	blt _0224E3F8
	cmp r6, #0x80
	bge _0224E3F8
	cmp r4, #0x20
	blt _0224E3F8
	cmp r4, #0x60
	blt _0224E3FE
_0224E3F8:
	add sp, #0x1c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E3FE:
	cmp r6, #0x20
	blt _0224E40E
	cmp r6, #0x80
	bge _0224E40E
	cmp r4, #0x20
	blt _0224E40E
	cmp r4, #0x60
	blt _0224E414
_0224E40E:
	add sp, #0x1c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E414:
	ldr r0, [r5, #0x40]
	add r1, sp, #0x10
	bl FUN_0205C6AC
	add r0, sp, #0xc
	str r0, [sp]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x18]
	adds r0, r5, #0
	bl FUN_02054774
	adds r7, r0, #0
	add r0, sp, #0xc
	ldrb r0, [r0]
	cmp r0, #1
	beq _0224E43C
	add sp, #0x1c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E43C:
	lsls r0, r4, #4
	adds r0, #8
	cmp r0, #0
	ble _0224E458
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp, #4]
	b _0224E468
_0224E458:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp, #4]
_0224E468:
	lsls r0, r6, #4
	adds r0, #8
	cmp r0, #0
	ble _0224E482
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0224E490
_0224E482:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0224E490:
	blx FUN_020F2104
	adds r4, r0, #0
	ldr r0, [sp, #4]
	blx FUN_020F2104
	adds r3, r0, #0
	add r0, sp, #0xc
	str r0, [sp]
	ldr r1, [sp, #0x14]
	adds r0, r5, #0
	adds r2, r4, #0
	bl FUN_02054774
	add r1, sp, #0xc
	ldrb r1, [r1]
	cmp r1, #1
	beq _0224E4BA
	add sp, #0x1c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E4BA:
	cmp r7, r0
	bne _0224E4C4
	add sp, #0x1c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0224E4C4:
	movs r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224E35C

	thumb_func_start ov02_0224E4CC
ov02_0224E4CC: @ 0x0224E4CC
	push {r3, lr}
	cmp r1, #0
	beq _0224E4D6
	movs r0, #0
	pop {r3, pc}
_0224E4D6:
	bl FUN_0205BAD0
	pop {r3, pc}
	thumb_func_end ov02_0224E4CC

	thumb_func_start ov02_0224E4DC
ov02_0224E4DC: @ 0x0224E4DC
	push {r3, lr}
	cmp r1, #0
	beq _0224E4E6
	movs r0, #0
	pop {r3, pc}
_0224E4E6:
	bl FUN_0205BAE4
	pop {r3, pc}
	thumb_func_end ov02_0224E4DC

	thumb_func_start ov02_0224E4EC
ov02_0224E4EC: @ 0x0224E4EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	adds r0, r1, #0
	movs r1, #0x24
	bl FUN_0201AACC
	movs r1, #0
	movs r2, #0x24
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	bl FUN_0203E344
	str r0, [r4]
	movs r0, #0x43
	lsls r0, r0, #2
	adds r1, r5, r0
	adds r0, r0, #5
	str r1, [r4, #4]
	adds r0, r5, r0
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x40]
	bl FUN_0205C700
	cmp r0, #2
	bne _0224E528
	movs r0, #1
	b _0224E52A
_0224E528:
	movs r0, #0
_0224E52A:
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	strb r6, [r4, #0x18]
	ldr r0, [r5, #0x40]
	bl FUN_0205C654
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x40]
	bl FUN_0205C67C
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x40]
	bl FUN_0205C688
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	ldr r0, [r5, #0x40]
	add r1, sp, #0x20
	bl FUN_0205C6AC
	ldr r0, [sp, #0x14]
	adds r1, r7, #0
	bl ov02_0224E31C
	strb r0, [r4, #0x19]
	add r0, sp, #0x18
	str r0, [sp]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x28]
	adds r0, r5, #0
	bl FUN_02054774
	str r0, [sp, #0x24]
	add r1, sp, #0x18
	ldrb r1, [r1]
	cmp r1, #1
	beq _0224E584
	add sp, #0x2c
	adds r0, r4, #0
	pop {r4, r5, r6, r7, pc}
_0224E584:
	asrs r0, r0, #0xc
	strb r0, [r4, #0x1a]
	ldr r0, [sp, #0x10]
	bl FUN_02060F0C
	ldr r1, [sp, #0x14]
	adds r0, r1, r0
	strb r0, [r4, #9]
	ldr r0, [sp, #0x10]
	bl FUN_02060F18
	adds r0, r7, r0
	strb r0, [r4, #0xb]
	movs r0, #1
	strb r0, [r4, #8]
	ldr r0, [sp, #0x24]
	adds r2, r7, #0
	str r0, [sp]
	add r0, sp, #0x1c
	str r0, [sp, #4]
	add r0, sp, #0x18
	adds r0, #2
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x10]
	adds r0, r5, #0
	bl ov02_0224E828
	cmp r0, #0
	beq _0224E5D4
	add r1, sp, #0x18
	movs r0, #4
	ldrsh r0, [r1, r0]
	strb r0, [r4, #0xd]
	movs r0, #2
	ldrsh r0, [r1, r0]
	strb r0, [r4, #0xf]
	movs r0, #1
	strb r0, [r4, #0xc]
_0224E5D4:
	ldr r0, [sp, #0x24]
	adds r2, r7, #0
	str r0, [sp]
	add r0, sp, #0x1c
	str r0, [sp, #4]
	add r0, sp, #0x18
	adds r0, #2
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x10]
	adds r0, r5, #0
	bl ov02_0224EB48
	cmp r0, #0
	beq _0224E606
	add r1, sp, #0x18
	movs r0, #4
	ldrsh r0, [r1, r0]
	strb r0, [r4, #0x11]
	movs r0, #2
	ldrsh r0, [r1, r0]
	strb r0, [r4, #0x13]
	movs r0, #1
	strb r0, [r4, #0x10]
_0224E606:
	ldr r0, [sp, #0x24]
	adds r2, r7, #0
	str r0, [sp]
	add r0, sp, #0x1c
	str r0, [sp, #4]
	add r0, sp, #0x18
	adds r0, #2
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x10]
	adds r0, r5, #0
	bl ov02_0224EE4C
	cmp r0, #0
	beq _0224E638
	add r1, sp, #0x18
	movs r0, #4
	ldrsh r0, [r1, r0]
	strb r0, [r4, #0x15]
	movs r0, #2
	ldrsh r0, [r1, r0]
	strb r0, [r4, #0x17]
	movs r0, #1
	strb r0, [r4, #0x14]
_0224E638:
	adds r0, r4, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224E4EC

	thumb_func_start ov02_0224E640
ov02_0224E640: @ 0x0224E640
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_02028E9C
	bl FUN_02028F84
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0202F57C
	bl FUN_0202F720
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0xa
	blx FUN_020F2BA4
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bhs _0224E672
	movs r1, #3
	blx FUN_020F2998
	b _0224E67C
_0224E672:
	subs r1, r0, #6
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	adds r0, r0, #2
_0224E67C:
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #3
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r0, #1
	cmp r4, r0
	blt _0224E692
	movs r0, #1
	pop {r3, r4, r5, pc}
_0224E692:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_0224E640

	thumb_func_start ov02_0224E698
ov02_0224E698: @ 0x0224E698
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	bl FUN_0205C654
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [r5, #0x40]
	bl FUN_0205C67C
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, [r5, #0x40]
	bl FUN_0205C688
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r0, [r5, #0x40]
	add r1, sp, #0x14
	bl FUN_0205C6AC
	ldr r0, [r5, #0xc]
	bl FUN_0202F57C
	movs r1, #0
	bl FUN_0202F630
	adds r2, r0, #0
	adds r0, r6, #0
	subs r0, #0x20
	asrs r1, r0, #4
	lsrs r1, r1, #0x1b
	adds r1, r0, r1
	adds r0, r4, #0
	subs r0, #0x20
	asrs r3, r0, #4
	lsrs r3, r3, #0x1b
	adds r3, r0, r3
	asrs r3, r3, #5
	lsls r0, r3, #1
	asrs r1, r1, #5
	adds r0, r3, r0
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #0x7a
	muls r0, r1, r0
	adds r0, r2, r0
	ldrb r0, [r0, #1]
	cmp r0, #0x1e
	blo _0224E706
	add sp, #0x20
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224E706:
	ldr r0, [r5, #0x40]
	bl FUN_0205C700
	cmp r0, #2
	beq _0224E716
	add sp, #0x20
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224E716:
	ldr r0, [r5, #0xc]
	bl ov02_0224E640
	cmp r0, #0
	bne _0224E726
	add sp, #0x20
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0224E726:
	ldr r0, [sp, #0x18]
	adds r1, r6, #0
	str r0, [sp]
	add r0, sp, #0x10
	adds r0, #2
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl ov02_0224EE4C
	cmp r0, #0
	beq _0224E74E
	add sp, #0x20
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224E74E:
	movs r0, #3
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224E698

	thumb_func_start ov02_0224E754
ov02_0224E754: @ 0x0224E754
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x40]
	str r1, [sp]
	bl FUN_0205C654
	adds r6, r0, #0
	ldr r0, [r4, #0x40]
	bl FUN_0205C67C
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_02060F0C
	adds r7, r5, r0
	ldr r0, [r4, #0x40]
	bl FUN_0205C688
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_02060F18
	adds r6, r5, r0
	ldr r0, [r4, #0xc]
	bl FUN_02028E9C
	bl FUN_02028F94
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov02_0224E31C
	adds r5, r0, #0
	lsrs r1, r7, #0x1f
	lsls r0, r7, #0x1b
	subs r0, r0, r1
	movs r2, #0x1b
	rors r0, r2
	adds r7, r1, r0
	lsrs r1, r6, #0x1f
	lsls r0, r6, #0x1b
	subs r0, r0, r1
	rors r0, r2
	adds r6, r1, r0
	ldr r0, [r4, #0xc]
	bl FUN_0202F57C
	movs r1, #0
	bl FUN_0202F630
	movs r1, #0x7a
	muls r1, r5, r1
	adds r0, r0, r1
	str r0, [sp, #8]
	ldrb r0, [r0, #1]
	movs r4, #0
	cmp r0, #0
	ble _0224E81C
	ldr r0, [sp, #8]
	adds r5, r0, #2
_0224E7D4:
	ldrb r1, [r5]
	ldr r2, [sp, #4]
	add r0, sp, #0xc
	bl FUN_02097268
	ldrb r1, [r5, #1]
	cmp r7, r1
	blt _0224E810
	ldrb r0, [r5, #3]
	cmp r6, r0
	bgt _0224E810
	add r2, sp, #0xc
	ldrb r2, [r2, #1]
	lsls r3, r2, #0x1c
	lsrs r3, r3, #0x1d
	adds r1, r1, r3
	cmp r7, r1
	bge _0224E810
	lsls r1, r2, #0x19
	lsrs r1, r1, #0x1d
	subs r0, r0, r1
	cmp r6, r0
	ble _0224E810
	ldr r0, [sp]
	cmp r0, #0
	beq _0224E80A
	strh r4, [r0]
_0224E80A:
	add sp, #0x10
	ldrb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0224E810:
	ldr r0, [sp, #8]
	adds r4, r4, #1
	ldrb r0, [r0, #1]
	adds r5, r5, #4
	cmp r4, r0
	blt _0224E7D4
_0224E81C:
	ldr r0, [sp]
	movs r1, #0
	strh r1, [r0]
	movs r0, #0xff
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224E754

	thumb_func_start ov02_0224E828
ov02_0224E828: @ 0x0224E828
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [sp, #0x84]
	str r2, [sp, #4]
	ldr r1, _0224EB44 @ =0x02253A4C
	str r0, [sp, #0x84]
	ldr r0, [sp, #0x88]
	ldrb r2, [r1, #2]
	str r0, [sp, #0x88]
	ldrb r1, [r1, #3]
	str r3, [sp, #8]
	add r0, sp, #0x68
	strb r2, [r0, #1]
	strb r1, [r0, #2]
	ldr r1, [sp, #0x84]
	ldr r6, [sp, #0x80]
	strh r5, [r1]
	ldr r2, [sp, #4]
	ldr r1, [sp, #0x88]
	strh r2, [r1]
	ldr r1, [sp, #8]
	cmp r1, #3
	bls _0224E85C
	b _0224EB3E
_0224E85C:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224E868: @ jump table
	.2byte _0224E870 - _0224E868 - 2 @ case 0
	.2byte _0224E870 - _0224E868 - 2 @ case 1
	.2byte _0224E992 - _0224E868 - 2 @ case 2
	.2byte _0224E992 - _0224E868 - 2 @ case 3
_0224E870:
	movs r0, #0
	str r0, [sp, #0x50]
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0224E87E
	movs r0, #1
	b _0224E880
_0224E87E:
	ldr r0, [sp, #0x50]
_0224E880:
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #0
	str r0, [sp, #0x54]
	add r0, sp, #0x68
	adds r0, #1
	ldrsb r0, [r0, r1]
	ldr r7, [sp, #0x54]
	str r0, [sp, #0x38]
	add r0, sp, #0x70
	ldrb r0, [r0, #0x1c]
	str r0, [sp, #0x48]
	lsls r0, r5, #4
	str r0, [sp, #0x44]
	adds r0, #8
	str r0, [sp, #0x44]
	lsls r0, r0, #0xc
	str r0, [sp, #0x40]
_0224E8A4:
	ldr r0, [sp, #0x38]
	adds r1, r7, r0
	ldr r0, [sp, #4]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x3c]
	ldr r2, [sp, #0x3c]
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_02054918
	str r0, [sp, #0x58]
	ldr r2, [sp, #0x3c]
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_020548C0
	adds r1, r0, #0
	ldr r0, [sp, #0x58]
	ldr r2, [sp, #0x48]
	bl ov02_0224EF6C
	cmp r0, #0
	beq _0224E95C
	ldr r0, [sp, #0x3c]
	lsls r0, r0, #4
	adds r0, #8
	cmp r0, #0
	ble _0224E8F4
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp, #0x14]
	b _0224E904
_0224E8F4:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp, #0x14]
_0224E904:
	ldr r0, [sp, #0x44]
	cmp r0, #0
	ble _0224E91C
	ldr r0, [sp, #0x40]
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0224E92A
_0224E91C:
	ldr r0, [sp, #0x40]
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0224E92A:
	blx FUN_020F2104
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0x14]
	blx FUN_020F2104
	adds r3, r0, #0
	add r0, sp, #0x68
	str r0, [sp]
	ldr r2, [sp, #0x5c]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_02054774
	add r1, sp, #0x68
	ldrb r1, [r1]
	cmp r1, #1
	bne _0224E95C
	cmp r0, r6
	bne _0224E95C
	ldr r0, [sp, #0x50]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x50]
_0224E95C:
	ldr r0, [sp, #0x38]
	adds r7, r7, r0
	ldr r0, [sp, #0x54]
	adds r0, r0, #1
	str r0, [sp, #0x54]
	cmp r0, #2
	blt _0224E8A4
	ldr r0, [sp, #0x50]
	cmp r0, #2
	beq _0224E972
	b _0224EB3E
_0224E972:
	ldr r0, [sp, #0x84]
	strh r5, [r0]
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0224E984
	ldr r0, [sp, #4]
	subs r1, r0, #1
	ldr r0, [sp, #0x88]
	b _0224E98A
_0224E984:
	ldr r0, [sp, #4]
	adds r1, r0, #2
	ldr r0, [sp, #0x88]
_0224E98A:
	strh r1, [r0]
	add sp, #0x6c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0224E992:
	ldr r1, [sp, #8]
	cmp r1, #2
	bne _0224E99C
	movs r1, #1
	b _0224E99E
_0224E99C:
	movs r1, #2
_0224E99E:
	ldrsb r0, [r0, r1]
	ldr r2, [sp, #4]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_02054918
	str r0, [sp, #0x20]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_020548C0
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	lsls r0, r0, #4
	adds r0, #8
	cmp r0, #0
	ble _0224E9DC
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp, #0x10]
	b _0224E9EC
_0224E9DC:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp, #0x10]
_0224E9EC:
	lsls r0, r5, #4
	str r0, [sp, #0x2c]
	adds r0, #8
	str r0, [sp, #0x2c]
	cmp r0, #0
	ble _0224EA0A
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0224EA18
_0224EA0A:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0224EA18:
	blx FUN_020F2104
	adds r7, r0, #0
	ldr r0, [sp, #0x10]
	blx FUN_020F2104
	adds r3, r0, #0
	add r0, sp, #0x68
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_02054774
	adds r7, r0, #0
	add r0, sp, #0x70
	ldrb r0, [r0, #0x1c]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x34]
	bl ov02_0224EF6C
	cmp r0, #0
	beq _0224EA56
	add r0, sp, #0x68
	ldrb r0, [r0]
	cmp r0, #1
	bne _0224EA56
	cmp r7, r6
	beq _0224EA5C
_0224EA56:
	add sp, #0x6c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0224EA5C:
	movs r0, #0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	add r7, sp, #0x68
	lsls r0, r0, #0xc
	adds r7, #1
	str r0, [sp, #0x4c]
_0224EA6A:
	movs r0, #0
	ldrsb r1, [r7, r0]
	ldr r0, [sp, #4]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x30]
	ldr r2, [sp, #0x30]
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_02054918
	str r0, [sp, #0x24]
	ldr r2, [sp, #0x30]
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_020548C0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x30]
	lsls r0, r0, #4
	adds r0, #8
	cmp r0, #0
	ble _0224EAAE
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp, #0xc]
	b _0224EABE
_0224EAAE:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp, #0xc]
_0224EABE:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	ble _0224EAD6
	ldr r0, [sp, #0x4c]
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0224EAE4
_0224EAD6:
	ldr r0, [sp, #0x4c]
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0224EAE4:
	blx FUN_020F2104
	str r0, [sp, #0x60]
	ldr r0, [sp, #0xc]
	blx FUN_020F2104
	adds r3, r0, #0
	add r0, sp, #0x68
	str r0, [sp]
	ldr r2, [sp, #0x60]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_02054774
	str r0, [sp, #0x64]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x34]
	bl ov02_0224EF6C
	cmp r0, #0
	beq _0224EB32
	add r0, sp, #0x68
	ldrb r0, [r0]
	cmp r0, #1
	bne _0224EB32
	ldr r0, [sp, #0x64]
	cmp r0, r6
	bne _0224EB32
	ldr r0, [sp, #0x84]
	strh r5, [r0]
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x28]
	adds r1, r1, r0
	ldr r0, [sp, #0x88]
	add sp, #0x6c
	strh r1, [r0]
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0224EB32:
	ldr r0, [sp, #0x28]
	adds r7, r7, #1
	adds r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #2
	blt _0224EA6A
_0224EB3E:
	movs r0, #0
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0224EB44: .4byte 0x02253A4C
	thumb_func_end ov02_0224E828

	thumb_func_start ov02_0224EB48
ov02_0224EB48: @ 0x0224EB48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	adds r4, r0, #0
	ldr r0, [sp, #0x84]
	str r1, [sp, #4]
	str r0, [sp, #0x84]
	ldr r0, [sp, #0x88]
	ldr r1, _0224EE48 @ =0x02253A4C
	str r0, [sp, #0x88]
	adds r5, r2, #0
	adds r2, r3, #0
	ldrb r0, [r1]
	add r3, sp, #0x64
	ldr r6, [sp, #0x80]
	strb r0, [r3, #1]
	ldrb r0, [r1, #1]
	cmp r2, #3
	strb r0, [r3, #2]
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x84]
	strh r1, [r0]
	ldr r0, [sp, #0x88]
	strh r5, [r0]
	bls _0224EB7A
	b _0224EE42
_0224EB7A:
	adds r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224EB86: @ jump table
	.2byte _0224EB8E - _0224EB86 - 2 @ case 0
	.2byte _0224EB8E - _0224EB86 - 2 @ case 1
	.2byte _0224ED3A - _0224EB86 - 2 @ case 2
	.2byte _0224ED3A - _0224EB86 - 2 @ case 3
_0224EB8E:
	cmp r2, #0
	bne _0224EB96
	movs r0, #1
	b _0224EB98
_0224EB96:
	movs r0, #2
_0224EB98:
	ldrsb r0, [r3, r0]
	ldr r1, [sp, #4]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_02054918
	str r0, [sp, #0x50]
	ldr r1, [sp, #4]
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_020548C0
	str r0, [sp, #0x4c]
	lsls r0, r5, #4
	str r0, [sp, #0x24]
	adds r0, #8
	str r0, [sp, #0x24]
	cmp r0, #0
	ble _0224EBD8
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp, #0x14]
	b _0224EBE8
_0224EBD8:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp, #0x14]
_0224EBE8:
	ldr r0, [sp, #4]
	lsls r0, r0, #4
	adds r0, #8
	cmp r0, #0
	ble _0224EC04
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0224EC12
_0224EC04:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0224EC12:
	blx FUN_020F2104
	adds r7, r0, #0
	ldr r0, [sp, #0x14]
	blx FUN_020F2104
	adds r3, r0, #0
	add r0, sp, #0x64
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_02054774
	adds r7, r0, #0
	add r0, sp, #0x70
	ldrb r0, [r0, #0x1c]
	ldr r1, [sp, #0x4c]
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x50]
	ldr r2, [sp, #0x30]
	bl ov02_0224EF6C
	cmp r0, #0
	beq _0224EC50
	add r0, sp, #0x64
	ldrb r0, [r0]
	cmp r0, #1
	bne _0224EC50
	cmp r7, r6
	beq _0224EC56
_0224EC50:
	add sp, #0x68
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224EC56:
	movs r0, #0
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x24]
	add r7, sp, #0x64
	lsls r0, r0, #0xc
	adds r7, #1
	str r0, [sp, #0x34]
_0224EC64:
	movs r0, #0
	ldrsb r1, [r7, r0]
	ldr r0, [sp, #4]
	adds r2, r5, #0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x2c]
	ldr r1, [sp, #0x2c]
	adds r0, r4, #0
	bl FUN_02054918
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x2c]
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_020548C0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	ble _0224ECA4
	ldr r0, [sp, #0x34]
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp, #0x10]
	b _0224ECB4
_0224ECA4:
	ldr r0, [sp, #0x34]
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp, #0x10]
_0224ECB4:
	ldr r0, [sp, #0x2c]
	lsls r0, r0, #4
	adds r0, #8
	cmp r0, #0
	ble _0224ECD0
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0224ECDE
_0224ECD0:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0224ECDE:
	blx FUN_020F2104
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x10]
	blx FUN_020F2104
	adds r3, r0, #0
	add r0, sp, #0x64
	str r0, [sp]
	ldr r2, [sp, #0x54]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_02054774
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x30]
	bl ov02_0224EF6C
	cmp r0, #0
	beq _0224ED2C
	add r0, sp, #0x64
	ldrb r0, [r0]
	cmp r0, #1
	bne _0224ED2C
	ldr r0, [sp, #0x58]
	cmp r0, r6
	bne _0224ED2C
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x48]
	subs r1, r1, r0
	ldr r0, [sp, #0x84]
	strh r1, [r0]
	ldr r0, [sp, #0x88]
	add sp, #0x68
	strh r5, [r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224ED2C:
	ldr r0, [sp, #0x48]
	adds r7, r7, #1
	adds r0, r0, #1
	str r0, [sp, #0x48]
	cmp r0, #2
	blt _0224EC64
	b _0224EE42
_0224ED3A:
	movs r0, #0
	str r0, [sp, #0x44]
	cmp r2, #2
	bne _0224ED4E
	ldr r0, [sp, #4]
	subs r0, r0, #2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	b _0224ED58
_0224ED4E:
	ldr r0, [sp, #4]
	adds r0, r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
_0224ED58:
	movs r0, #0
	str r0, [sp, #0x18]
	add r0, sp, #0x70
	ldrb r0, [r0, #0x1c]
	ldr r7, [sp, #0xc]
	str r0, [sp, #0x40]
	lsls r0, r5, #4
	str r0, [sp, #0x3c]
	adds r0, #8
	str r0, [sp, #0x3c]
	lsls r0, r0, #0xc
	str r0, [sp, #0x38]
_0224ED70:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_02054918
	str r0, [sp, #0x5c]
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_020548C0
	adds r1, r0, #0
	ldr r0, [sp, #0x5c]
	ldr r2, [sp, #0x40]
	bl ov02_0224EF6C
	cmp r0, #0
	beq _0224EE20
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	ble _0224EDB4
	ldr r0, [sp, #0x38]
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp, #8]
	b _0224EDC4
_0224EDB4:
	ldr r0, [sp, #0x38]
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp, #8]
_0224EDC4:
	ldr r0, [sp, #0x28]
	lsls r0, r0, #4
	adds r0, #8
	cmp r0, #0
	ble _0224EDE0
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0224EDEE
_0224EDE0:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0224EDEE:
	blx FUN_020F2104
	str r0, [sp, #0x60]
	ldr r0, [sp, #8]
	blx FUN_020F2104
	adds r3, r0, #0
	add r0, sp, #0x64
	str r0, [sp]
	ldr r2, [sp, #0x60]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_02054774
	add r1, sp, #0x64
	ldrb r1, [r1]
	cmp r1, #1
	bne _0224EE20
	cmp r0, r6
	bne _0224EE20
	ldr r0, [sp, #0x44]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x44]
_0224EE20:
	ldr r0, [sp, #0x18]
	adds r7, r7, #1
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #2
	blt _0224ED70
	ldr r0, [sp, #0x44]
	cmp r0, #2
	bne _0224EE42
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x84]
	strh r1, [r0]
	ldr r0, [sp, #0x88]
	add sp, #0x68
	strh r5, [r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224EE42:
	movs r0, #0
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224EE48: .4byte 0x02253A4C
	thumb_func_end ov02_0224EB48

	thumb_func_start ov02_0224EE4C
ov02_0224EE4C: @ 0x0224EE4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r4, [sp, #0x38]
	str r3, [sp, #0x1c]
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x44]
	ldr r6, [sp, #0x3c]
	str r4, [sp, #0x44]
	ldr r4, _0224EF68 @ =0x02253A4C
	ldr r7, [sp, #0x40]
	ldrb r5, [r4, #4]
	add r4, sp, #0x20
	str r0, [sp, #0x10]
	strb r5, [r4]
	ldr r4, _0224EF68 @ =0x02253A4C
	ldrb r5, [r4, #5]
	add r4, sp, #0x20
	strb r5, [r4, #1]
	ldr r4, [sp, #0x14]
	strh r4, [r6]
	ldr r4, [sp, #0x18]
	strh r4, [r7]
	ldr r4, [sp, #0x1c]
	cmp r4, #3
	bhi _0224EF60
	adds r4, r4, r4
	add r4, pc
	ldrh r4, [r4, #6]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	add pc, r4
_0224EE8E: @ jump table
	.2byte _0224EE96 - _0224EE8E - 2 @ case 0
	.2byte _0224EE96 - _0224EE8E - 2 @ case 1
	.2byte _0224EEFC - _0224EE8E - 2 @ case 2
	.2byte _0224EEFC - _0224EE8E - 2 @ case 3
_0224EE96:
	ldr r4, [sp, #0x38]
	str r4, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	ldr r4, [sp, #0x44]
	str r4, [sp, #0xc]
	bl ov02_0224E828
	cmp r0, #0
	beq _0224EF60
	movs r4, #0
	add r5, sp, #0x20
_0224EEAE:
	ldr r0, [sp, #0x38]
	movs r1, #0
	str r0, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	ldr r0, [sp, #0x44]
	str r0, [sp, #0xc]
	ldrsb r2, [r5, r1]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	asrs r1, r1, #0x10
	bl ov02_0224E828
	cmp r0, #0
	beq _0224EEF2
	ldr r0, [sp, #0x14]
	subs r0, r0, r4
	strh r0, [r6]
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0224EEE6
	ldr r0, [sp, #0x18]
	subs r0, r0, #1
	b _0224EEEA
_0224EEE6:
	ldr r0, [sp, #0x18]
	adds r0, r0, #2
_0224EEEA:
	add sp, #0x24
	strh r0, [r7]
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0224EEF2:
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #2
	blt _0224EEAE
	b _0224EF60
_0224EEFC:
	ldr r4, [sp, #0x38]
	str r4, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	ldr r4, [sp, #0x44]
	str r4, [sp, #0xc]
	bl ov02_0224EB48
	cmp r0, #0
	beq _0224EF60
	movs r5, #0
	add r4, sp, #0x20
_0224EF14:
	ldr r0, [sp, #0x38]
	movs r2, #0
	str r0, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	ldr r0, [sp, #0x44]
	str r0, [sp, #0xc]
	ldrsb r3, [r4, r2]
	ldr r2, [sp, #0x18]
	ldr r0, [sp, #0x10]
	subs r2, r2, r3
	lsls r2, r2, #0x10
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x1c]
	asrs r2, r2, #0x10
	bl ov02_0224EB48
	cmp r0, #0
	beq _0224EF58
	ldr r0, [sp, #0x1c]
	cmp r0, #2
	bne _0224EF46
	ldr r0, [sp, #0x14]
	subs r0, r0, #2
	b _0224EF4A
_0224EF46:
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
_0224EF4A:
	strh r0, [r6]
	ldr r0, [sp, #0x18]
	add sp, #0x24
	adds r0, r0, r5
	strh r0, [r7]
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0224EF58:
	adds r5, r5, #1
	adds r4, r4, #1
	cmp r5, #2
	blt _0224EF14
_0224EF60:
	movs r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0224EF68: .4byte 0x02253A4C
	thumb_func_end ov02_0224EE4C

	thumb_func_start ov02_0224EF6C
ov02_0224EF6C: @ 0x0224EF6C
	push {r3, lr}
	cmp r2, #0
	bne _0224EF78
	bl ov02_0224E4CC
	pop {r3, pc}
_0224EF78:
	bl ov02_0224E4DC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_0224EF6C

	thumb_func_start ov02_0224EF80
ov02_0224EF80: @ 0x0224EF80
	ldr r3, _0224EF8C @ =FUN_02050530
	ldr r0, [r0, #0x10]
	ldr r1, _0224EF90 @ =ov02_02250110
	movs r2, #0
	bx r3
	nop
_0224EF8C: .4byte FUN_02050530
_0224EF90: .4byte ov02_02250110
	thumb_func_end ov02_0224EF80

	thumb_func_start ov02_0224EF94
ov02_0224EF94: @ 0x0224EF94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1b0
	adds r7, r0, #0
	ldr r0, [r7, #0x20]
	ldr r0, [r0]
	bl FUN_0203B36C
	adds r2, r0, #0
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r7, r0]
	movs r1, #0xde
	adds r0, #0x14
	adds r2, r2, #1
	bl FUN_02007508
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r1, [r7, r0]
	movs r0, #0x9b
	lsls r0, r0, #2
	adds r0, r1, r0
	movs r1, #0xde
	movs r2, #0
	bl FUN_02007508
	adds r0, r7, #0
	add r1, sp, #4
	bl ov02_0224F058
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r7, r0]
	add r3, sp, #0x20
	str r0, [sp]
	adds r0, #0x14
	str r0, [sp]
	movs r0, #0
	adds r2, r0, #0
_0224EFE2:
	adds r1, r2, #0
	adds r1, #0x1e
	adds r2, r2, #1
	adds r0, r0, #1
	stm r3!, {r1}
	cmp r2, #0xc
	blt _0224EFE2
	add r2, sp, #0x20
	lsls r1, r0, #2
	movs r3, #0
	adds r1, r2, r1
_0224EFF8:
	stm r1!, {r3}
	adds r3, r3, #1
	adds r0, r0, #1
	cmp r3, #0x1e
	blt _0224EFF8
	add r2, sp, #0x20
	lsls r1, r0, #2
	movs r3, #0x2a
	adds r1, r2, r1
_0224F00A:
	stm r1!, {r3}
	adds r3, r3, #1
	adds r0, r0, #1
	cmp r3, #0x64
	blt _0224F00A
	movs r5, #0
	add r4, sp, #0x20
_0224F018:
	ldr r1, [r4]
	movs r0, #0x14
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp]
	adds r6, r0, r2
	ldrh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x16
	beq _0224F044
	adds r0, r7, #0
	adds r1, r6, #0
	add r2, sp, #4
	bl ov02_0224F108
	cmp r0, #0
	beq _0224F044
	ldrh r0, [r6, #0xa]
	add sp, #0x1b0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x16
	pop {r3, r4, r5, r6, r7, pc}
_0224F044:
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #0x64
	blt _0224F018
	bl GF_AssertFail
	movs r0, #0
	add sp, #0x1b0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224EF94

	thumb_func_start ov02_0224F058
ov02_0224F058: @ 0x0224F058
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r4, r1, #0
	bl FUN_02074904
	bl FUN_02054388
	movs r1, #5
	movs r2, #0
	adds r6, r0, #0
	bl FUN_0206E540
	movs r1, #0x12
	lsls r1, r1, #4
	ldr r2, [r5, r1]
	ldr r1, _0224F100 @ =0x0000087E
	strh r0, [r2, r1]
	adds r0, r6, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x12
	lsls r1, r1, #4
	ldr r2, [r5, r1]
	ldr r1, _0224F104 @ =0x0000087D
	strb r0, [r2, r1]
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov02_0224F324
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov02_0224F4BC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov02_0224F580
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov02_0224F5D0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov02_0224F5FC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov02_0224F644
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov02_0224F64C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov02_0224F698
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r3, [r5, r0]
	ldr r2, _0224F100 @ =0x0000087E
	adds r0, r5, #0
	ldrh r1, [r3, r2]
	subs r2, r2, #1
	ldrb r2, [r3, r2]
	adds r3, r4, #0
	bl ov02_0224F6AC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov02_0224F728
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	ldr r0, _0224F100 @ =0x0000087E
	ldrh r0, [r1, r0]
	adds r1, r4, #0
	bl ov02_0224F76C
	pop {r4, r5, r6, pc}
	.align 2, 0
_0224F100: .4byte 0x0000087E
_0224F104: .4byte 0x0000087D
	thumb_func_end ov02_0224F058

	thumb_func_start ov02_0224F108
ov02_0224F108: @ 0x0224F108
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	ldrb r0, [r5, #0x11]
	cmp r1, r0
	blt _0224F124
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F124:
	ldrh r7, [r5, #0x12]
	cmp r7, #0
	beq _0224F13E
	ldr r0, [r6, #0xc]
	bl FUN_020503D0
	adds r1, r7, #0
	bl FUN_020503DC
	cmp r0, #0
	bne _0224F13E
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F13E:
	ldrb r0, [r5, #3]
	lsls r0, r0, #0x1b
	lsrs r1, r0, #0x1b
	beq _0224F15E
	cmp r1, #9
	bne _0224F154
	ldrb r0, [r4]
	cmp r0, #0
	bne _0224F15E
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F154:
	ldrb r0, [r4, #1]
	cmp r1, r0
	beq _0224F15E
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F15E:
	ldrb r1, [r5]
	cmp r1, #0
	beq _0224F16E
	ldrb r0, [r4, #2]
	cmp r1, r0
	beq _0224F16E
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F16E:
	ldrb r0, [r5, #2]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x1d
	beq _0224F19C
	cmp r1, #7
	ldrb r0, [r4, #3]
	bne _0224F194
	cmp r0, #2
	beq _0224F19C
	cmp r0, #3
	beq _0224F19C
	cmp r0, #4
	beq _0224F19C
	cmp r0, #5
	beq _0224F19C
	cmp r0, #8
	beq _0224F19C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F194:
	cmp r1, r0
	beq _0224F19C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F19C:
	ldrh r0, [r5, #0xa]
	lsls r0, r0, #0x1d
	lsrs r1, r0, #0x1d
	beq _0224F1BA
	cmp r1, #5
	ldrb r0, [r4, #0xc]
	bne _0224F1B2
	cmp r0, #5
	bhs _0224F1BA
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F1B2:
	cmp r1, r0
	beq _0224F1BA
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F1BA:
	ldrb r0, [r5, #0x10]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x1d
	beq _0224F1D8
	cmp r1, #4
	ldrb r0, [r4, #0xd]
	bne _0224F1D0
	cmp r0, #4
	bhs _0224F1D8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F1D0:
	cmp r1, r0
	beq _0224F1D8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F1D8:
	ldrb r0, [r5, #0x10]
	lsls r0, r0, #0x1d
	lsrs r1, r0, #0x1e
	beq _0224F1EA
	ldrb r0, [r4, #4]
	cmp r1, r0
	beq _0224F1EA
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F1EA:
	ldrb r0, [r5, #0x10]
	lsls r0, r0, #0x1b
	lsrs r1, r0, #0x1e
	beq _0224F212
	cmp r1, #3
	bne _0224F200
	ldrb r0, [r4, #0xe]
	cmp r0, #0
	bne _0224F200
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F200:
	cmp r1, #1
	bne _0224F20E
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	bne _0224F20E
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F20E:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F212:
	ldrb r0, [r5, #4]
	lsls r0, r0, #0x1b
	lsrs r1, r0, #0x1b
	beq _0224F22A
	ldrb r0, [r4, #5]
	cmp r1, r0
	beq _0224F22A
	ldrb r0, [r4, #6]
	cmp r1, r0
	beq _0224F22A
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F22A:
	ldrh r0, [r5, #8]
	lsls r0, r0, #0x1d
	lsrs r1, r0, #0x1d
	beq _0224F23C
	ldrb r0, [r4, #0x11]
	cmp r1, r0
	beq _0224F23C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F23C:
	ldrh r1, [r5, #0xe]
	cmp r1, #0
	beq _0224F24C
	ldrb r0, [r4, #0x12]
	cmp r1, r0
	beq _0224F24C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F24C:
	ldrb r1, [r5, #5]
	cmp r1, #0
	beq _0224F25C
	ldrb r0, [r4, #0x13]
	cmp r1, r0
	beq _0224F25C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F25C:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	beq _0224F26E
	subs r1, r0, #1
	ldrh r0, [r4, #0x1a]
	cmp r1, r0
	beq _0224F26E
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F26E:
	ldrh r0, [r5, #0xa]
	lsls r0, r0, #0x1a
	lsrs r1, r0, #0x1d
	beq _0224F280
	ldrb r0, [r4, #0x14]
	cmp r1, r0
	beq _0224F280
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F280:
	ldrb r0, [r5, #1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	beq _0224F298
	movs r1, #0x15
	ldrsb r1, [r4, r1]
	bl ov02_02250628
	cmp r0, #0
	bne _0224F298
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F298:
	ldrb r0, [r5, #4]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x1d
	beq _0224F2AA
	ldrb r0, [r4, #0x16]
	cmp r1, r0
	beq _0224F2AA
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F2AA:
	ldrb r0, [r5, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	beq _0224F2C0
	ldrb r1, [r4, #7]
	bl ov02_02250594
	cmp r0, #0
	bne _0224F2C0
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F2C0:
	ldrb r0, [r5, #2]
	lsls r0, r0, #0x1d
	lsrs r1, r0, #0x1d
	beq _0224F2D2
	ldrb r0, [r4, #8]
	cmp r1, r0
	beq _0224F2D2
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F2D2:
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _0224F2E6
	ldrb r1, [r4, #0xa]
	bl ov02_022506D4
	cmp r0, #0
	bne _0224F2E6
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F2E6:
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _0224F2FA
	ldrb r1, [r4, #0xb]
	bl ov02_02250738
	cmp r0, #0
	bne _0224F2FA
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F2FA:
	ldrb r0, [r5, #2]
	lsls r0, r0, #0x1b
	lsrs r1, r0, #0x1e
	beq _0224F30C
	ldrb r0, [r4, #9]
	cmp r1, r0
	beq _0224F30C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F30C:
	ldrh r0, [r5, #8]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x1d
	beq _0224F31E
	ldrb r0, [r4, #0x17]
	cmp r1, r0
	beq _0224F31E
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F31E:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224F108

	thumb_func_start ov02_0224F324
ov02_0224F324: @ 0x0224F324
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r1, #0
	movs r1, #6
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _0224F34E
	movs r1, #1
	lsls r0, r0, #0x10
	strb r1, [r5]
	lsrs r0, r0, #0x10
	movs r1, #5
	movs r2, #0xb
	bl FUN_02077D88
	bl ov02_0224F820
	b _0224F354
_0224F34E:
	movs r0, #0
	strb r0, [r5]
	movs r0, #8
_0224F354:
	strb r0, [r5, #1]
	adds r0, r7, #0
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	adds r4, r0, #0
	adds r0, r7, #0
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #0
	movs r0, #0x64
	muls r0, r4, r0
	blx FUN_020F2998
	cmp r0, #0x64
	bne _0224F380
	movs r0, #1
	strb r0, [r5, #2]
	b _0224F3A2
_0224F380:
	cmp r0, #0x4b
	blt _0224F38A
	movs r0, #2
	strb r0, [r5, #2]
	b _0224F3A2
_0224F38A:
	cmp r0, #0x32
	blt _0224F394
	movs r0, #3
	strb r0, [r5, #2]
	b _0224F3A2
_0224F394:
	cmp r0, #0x19
	blt _0224F39E
	movs r0, #4
	strb r0, [r5, #2]
	b _0224F3A2
_0224F39E:
	movs r0, #5
	strb r0, [r5, #2]
_0224F3A2:
	adds r0, r7, #0
	movs r1, #0xa0
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x88
	tst r1, r0
	beq _0224F3B8
	movs r0, #5
	strb r0, [r5, #3]
	b _0224F3FA
_0224F3B8:
	movs r1, #7
	tst r1, r0
	beq _0224F3C4
	movs r0, #8
	strb r0, [r5, #3]
	b _0224F3FA
_0224F3C4:
	movs r1, #0x10
	tst r1, r0
	beq _0224F3D0
	movs r0, #2
	strb r0, [r5, #3]
	b _0224F3FA
_0224F3D0:
	movs r1, #0x20
	tst r1, r0
	beq _0224F3DC
	movs r0, #3
	strb r0, [r5, #3]
	b _0224F3FA
_0224F3DC:
	movs r1, #0x40
	tst r1, r0
	beq _0224F3E8
	movs r0, #4
	strb r0, [r5, #3]
	b _0224F3FA
_0224F3E8:
	cmp r0, #0
	bne _0224F3F2
	movs r0, #1
	strb r0, [r5, #3]
	b _0224F3FA
_0224F3F2:
	bl GF_AssertFail
	movs r0, #1
	strb r0, [r5, #3]
_0224F3FA:
	adds r0, r7, #0
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #2
	cmp r1, #0x32
	blt _0224F410
	movs r0, #4
	strb r0, [r5, #4]
	b _0224F420
_0224F410:
	subs r0, r0, #2
	cmp r0, #0x32
	bgt _0224F41C
	movs r0, #6
	strb r0, [r5, #4]
	b _0224F420
_0224F41C:
	movs r0, #5
	strb r0, [r5, #4]
_0224F420:
	adds r0, r7, #0
	movs r1, #0xb1
	movs r2, #0
	bl FUN_0206E540
	adds r4, r0, #0
	adds r0, r7, #0
	movs r1, #0xb2
	movs r2, #0
	bl FUN_0206E540
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov02_0224F79C
	strb r0, [r5, #5]
	adds r0, r6, #0
	bl ov02_0224F79C
	strb r0, [r5, #6]
	adds r0, r7, #0
	movs r1, #9
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r5, #7]
	adds r0, r7, #0
	bl FUN_0206FDFC
	lsls r1, r0, #2
	ldr r0, _0224F4B4 @ =0x02253AC0
	movs r2, #0
	ldr r0, [r0, r1]
	movs r1, #0x6f
	strb r0, [r5, #8]
	adds r0, r7, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0224F474
	movs r0, #1
	b _0224F476
_0224F474:
	movs r0, #2
_0224F476:
	ldr r3, _0224F4B8 @ =0x02253A5C
	strb r0, [r5, #9]
	ldm r3!, {r0, r1}
	add r2, sp, #0
	adds r6, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r4, #0
	str r0, [r2]
	strb r4, [r5, #0xb]
	adds r5, #0xb
_0224F490:
	ldr r1, [r6]
	adds r0, r7, #0
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r4
	ldrb r1, [r5]
	adds r4, r4, #1
	adds r6, r6, #4
	orrs r0, r1
	strb r0, [r5]
	cmp r4, #5
	blt _0224F490
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0224F4B4: .4byte 0x02253AC0
_0224F4B8: .4byte 0x02253A5C
	thumb_func_end ov02_0224F324

	thumb_func_start ov02_0224F4BC
ov02_0224F4BC: @ 0x0224F4BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0
	strb r0, [r5, #0xc]
	strb r0, [r5, #0xe]
	strb r0, [r5, #0xf]
	strb r0, [r5, #0x10]
	ldr r0, [r4, #0x40]
	bl FUN_0205C67C
	str r0, [sp, #4]
	ldr r0, [r4, #0x40]
	bl FUN_0205C688
	str r0, [sp]
	ldr r0, [r4, #0x3c]
	bl FUN_0205F168
	str r0, [sp, #8]
	ldr r0, [r4, #0x3c]
	bl FUN_0205F1BC
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r0, #0
	ble _0224F57A
	adds r7, r5, #0
	adds r7, #0xc
_0224F4FC:
	ldr r0, [sp, #0x10]
	bl FUN_0205F624
	cmp r0, #1
	bne _0224F568
	ldr r0, [sp, #0x10]
	bl FUN_0205F914
	adds r4, r0, #0
	ldr r0, [sp, #0x10]
	bl FUN_0205F934
	ldr r1, [sp, #4]
	subs r6, r1, r4
	ldr r1, [sp]
	subs r4, r1, r0
	ldr r0, [sp, #0x10]
	bl FUN_0205F25C
	cmp r0, #0x54
	bne _0224F52C
	movs r0, #1
	strb r0, [r5, #0xf]
	b _0224F568
_0224F52C:
	cmp r0, #0x55
	bne _0224F536
	movs r0, #1
	strb r0, [r5, #0xe]
	b _0224F568
_0224F536:
	cmp r0, #0x56
	bne _0224F540
	movs r0, #1
	strb r0, [r5, #0x10]
	b _0224F568
_0224F540:
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	blt _0224F568
	cmp r6, #1
	bgt _0224F568
	cmp r4, r0
	blt _0224F568
	cmp r4, #1
	bgt _0224F568
	ldr r0, [sp, #0x10]
	bl FUN_0205F24C
	cmp r0, #0xfd
	beq _0224F568
	cmp r0, #0xff
	beq _0224F568
	ldrb r0, [r7]
	adds r0, r0, #1
	strb r0, [r7]
_0224F568:
	add r0, sp, #0x10
	bl FUN_0205F1D0
	ldr r0, [sp, #0xc]
	adds r1, r0, #1
	ldr r0, [sp, #8]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _0224F4FC
_0224F57A:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224F4BC

	thumb_func_start ov02_0224F580
ov02_0224F580: @ 0x0224F580
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	movs r4, #0
	bl FUN_0203B6D8
	adds r5, r0, #0
	ldr r0, [sp]
	bl FUN_0203B6E0
	adds r7, r0, #0
	beq _0224F5C6
	cmp r5, #0
	beq _0224F5C6
	adds r6, r4, #0
	cmp r7, #0
	ble _0224F5C6
_0224F5A4:
	ldrh r0, [r5, #2]
	cmp r0, #2
	bne _0224F5BE
	ldrh r0, [r5]
	bl FUN_0204055C
	adds r1, r0, #0
	ldr r0, [sp]
	bl FUN_020403FC
	cmp r0, #0
	bne _0224F5BE
	adds r4, r4, #1
_0224F5BE:
	adds r6, r6, #1
	adds r5, #0x14
	cmp r6, r7
	blt _0224F5A4
_0224F5C6:
	ldr r0, [sp, #4]
	strb r4, [r0, #0xd]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224F580

	thumb_func_start ov02_0224F5D0
ov02_0224F5D0: @ 0x0224F5D0
	push {r4, lr}
	ldr r0, [r0, #0xc]
	adds r4, r1, #0
	bl FUN_0203B9C4
	bl FUN_0203B984
	cmp r0, #0
	beq _0224F5E8
	cmp r0, #1
	beq _0224F5EE
	b _0224F5F4
_0224F5E8:
	movs r0, #1
	strb r0, [r4, #0x11]
	pop {r4, pc}
_0224F5EE:
	movs r0, #3
	strb r0, [r4, #0x11]
	pop {r4, pc}
_0224F5F4:
	movs r0, #0
	strb r0, [r4, #0x11]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224F5D0

	thumb_func_start ov02_0224F5FC
ov02_0224F5FC: @ 0x0224F5FC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02069D68
	bl FUN_0205F914
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_02069D68
	bl FUN_0205F934
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_02054918
	movs r1, #0x12
	strb r0, [r4, #0x12]
	lsls r1, r1, #4
	ldr r2, [r5, r1]
	ldr r1, _0224F640 @ =0x00000882
	strh r0, [r2, r1]
	bl FUN_0205B994
	cmp r0, #0
	beq _0224F63A
	movs r0, #1
	strb r0, [r4, #0x13]
	pop {r4, r5, r6, pc}
_0224F63A:
	movs r0, #2
	strb r0, [r4, #0x13]
	pop {r4, r5, r6, pc}
	.align 2, 0
_0224F640: .4byte 0x00000882
	thumb_func_end ov02_0224F5FC

	thumb_func_start ov02_0224F644
ov02_0224F644: @ 0x0224F644
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	strh r0, [r1, #0x1a]
	bx lr
	thumb_func_end ov02_0224F644

	thumb_func_start ov02_0224F64C
ov02_0224F64C: @ 0x0224F64C
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_020555E0
	cmp r0, #4
	bhi _0224F68C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224F664: @ jump table
	.2byte _0224F66E - _0224F664 - 2 @ case 0
	.2byte _0224F674 - _0224F664 - 2 @ case 1
	.2byte _0224F67A - _0224F664 - 2 @ case 2
	.2byte _0224F680 - _0224F664 - 2 @ case 3
	.2byte _0224F686 - _0224F664 - 2 @ case 4
_0224F66E:
	movs r0, #1
	strb r0, [r4, #0x14]
	pop {r4, pc}
_0224F674:
	movs r0, #2
	strb r0, [r4, #0x14]
	pop {r4, pc}
_0224F67A:
	movs r0, #3
	strb r0, [r4, #0x14]
	pop {r4, pc}
_0224F680:
	movs r0, #4
	strb r0, [r4, #0x14]
	pop {r4, pc}
_0224F686:
	movs r0, #5
	strb r0, [r4, #0x14]
	pop {r4, pc}
_0224F68C:
	bl GF_AssertFail
	movs r0, #0
	strb r0, [r4, #0x14]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224F64C

	thumb_func_start ov02_0224F698
ov02_0224F698: @ 0x0224F698
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #0x42
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_0206A268
	strb r0, [r4, #0x15]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224F698

	thumb_func_start ov02_0224F6AC
ov02_0224F6AC: @ 0x0224F6AC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r0, [r0, #0xc]
	adds r5, r3, #0
	bl FUN_02074904
	adds r4, r0, #0
	bl FUN_020543BC
	adds r6, r0, #0
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r6, #0
	bl FUN_02074670
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_02074644
	adds r1, r0, #0
	add r0, sp, #0
	add r2, sp, #8
	movs r3, #0xb
	bl FUN_020732E4
	add r0, sp, #0
	ldrh r2, [r0]
	lsls r0, r2, #0x1d
	lsls r2, r2, #0x11
	lsrs r1, r0, #0x1d
	lsrs r2, r2, #0x1d
	movs r0, #1
	cmp r1, r2
	bhs _0224F6F4
	adds r1, r2, #0
	movs r0, #2
_0224F6F4:
	add r2, sp, #0
	ldrh r2, [r2]
	lsls r2, r2, #0x14
	lsrs r2, r2, #0x1d
	cmp r1, r2
	bhs _0224F704
	adds r1, r2, #0
	movs r0, #4
_0224F704:
	add r2, sp, #0
	ldrh r2, [r2]
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x1d
	cmp r1, r2
	bhs _0224F714
	adds r1, r2, #0
	movs r0, #3
_0224F714:
	add r2, sp, #0
	ldrh r2, [r2]
	lsls r2, r2, #0x17
	lsrs r2, r2, #0x1d
	cmp r1, r2
	bhs _0224F722
	movs r0, #5
_0224F722:
	strb r0, [r5, #0x16]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_0224F6AC

	thumb_func_start ov02_0224F728
ov02_0224F728: @ 0x0224F728
	push {r4, lr}
	adds r0, #0xe4
	ldr r0, [r0]
	adds r4, r1, #0
	bl FUN_0205F2A8
	cmp r0, #3
	bhi _0224F764
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224F744: @ jump table
	.2byte _0224F74C - _0224F744 - 2 @ case 0
	.2byte _0224F752 - _0224F744 - 2 @ case 1
	.2byte _0224F758 - _0224F744 - 2 @ case 2
	.2byte _0224F75E - _0224F744 - 2 @ case 3
_0224F74C:
	movs r0, #3
	strb r0, [r4, #0x17]
	pop {r4, pc}
_0224F752:
	movs r0, #4
	strb r0, [r4, #0x17]
	pop {r4, pc}
_0224F758:
	movs r0, #2
	strb r0, [r4, #0x17]
	pop {r4, pc}
_0224F75E:
	movs r0, #1
	strb r0, [r4, #0x17]
	pop {r4, pc}
_0224F764:
	movs r0, #0
	strb r0, [r4, #0x17]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_0224F728

	thumb_func_start ov02_0224F76C
ov02_0224F76C: @ 0x0224F76C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	ble _0224F77C
	ldr r0, _0224F798 @ =0x000001ED
	cmp r5, r0
	ble _0224F782
_0224F77C:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_0224F782:
	movs r0, #0xe9
	movs r1, #0
	movs r2, #0xb
	bl FUN_02007540
	subs r1, r5, #1
	ldrb r1, [r0, r1]
	strb r1, [r4, #0xa]
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224F798: .4byte 0x000001ED
	thumb_func_end ov02_0224F76C

	thumb_func_start ov02_0224F79C
ov02_0224F79C: @ 0x0224F79C
	push {r3, lr}
	cmp r0, #0x11
	bhi _0224F816
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224F7AE: @ jump table
	.2byte _0224F7D2 - _0224F7AE - 2 @ case 0
	.2byte _0224F7D6 - _0224F7AE - 2 @ case 1
	.2byte _0224F7DA - _0224F7AE - 2 @ case 2
	.2byte _0224F7DE - _0224F7AE - 2 @ case 3
	.2byte _0224F7E2 - _0224F7AE - 2 @ case 4
	.2byte _0224F7E6 - _0224F7AE - 2 @ case 5
	.2byte _0224F7EA - _0224F7AE - 2 @ case 6
	.2byte _0224F7EE - _0224F7AE - 2 @ case 7
	.2byte _0224F7F2 - _0224F7AE - 2 @ case 8
	.2byte _0224F816 - _0224F7AE - 2 @ case 9
	.2byte _0224F7F6 - _0224F7AE - 2 @ case 10
	.2byte _0224F7FA - _0224F7AE - 2 @ case 11
	.2byte _0224F7FE - _0224F7AE - 2 @ case 12
	.2byte _0224F802 - _0224F7AE - 2 @ case 13
	.2byte _0224F806 - _0224F7AE - 2 @ case 14
	.2byte _0224F80A - _0224F7AE - 2 @ case 15
	.2byte _0224F80E - _0224F7AE - 2 @ case 16
	.2byte _0224F812 - _0224F7AE - 2 @ case 17
_0224F7D2:
	movs r0, #1
	pop {r3, pc}
_0224F7D6:
	movs r0, #7
	pop {r3, pc}
_0224F7DA:
	movs r0, #0xa
	pop {r3, pc}
_0224F7DE:
	movs r0, #8
	pop {r3, pc}
_0224F7E2:
	movs r0, #9
	pop {r3, pc}
_0224F7E6:
	movs r0, #0xd
	pop {r3, pc}
_0224F7EA:
	movs r0, #0xc
	pop {r3, pc}
_0224F7EE:
	movs r0, #0xe
	pop {r3, pc}
_0224F7F2:
	movs r0, #0x11
	pop {r3, pc}
_0224F7F6:
	movs r0, #2
	pop {r3, pc}
_0224F7FA:
	movs r0, #3
	pop {r3, pc}
_0224F7FE:
	movs r0, #5
	pop {r3, pc}
_0224F802:
	movs r0, #4
	pop {r3, pc}
_0224F806:
	movs r0, #0xb
	pop {r3, pc}
_0224F80A:
	movs r0, #6
	pop {r3, pc}
_0224F80E:
	movs r0, #0xf
	pop {r3, pc}
_0224F812:
	movs r0, #0x10
	pop {r3, pc}
_0224F816:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_0224F79C

	thumb_func_start ov02_0224F820
ov02_0224F820: @ 0x0224F820
	push {r3, lr}
	cmp r0, #6
	bhi _0224F85C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224F832: @ jump table
	.2byte _0224F840 - _0224F832 - 2 @ case 0
	.2byte _0224F844 - _0224F832 - 2 @ case 1
	.2byte _0224F848 - _0224F832 - 2 @ case 2
	.2byte _0224F84C - _0224F832 - 2 @ case 3
	.2byte _0224F850 - _0224F832 - 2 @ case 4
	.2byte _0224F854 - _0224F832 - 2 @ case 5
	.2byte _0224F858 - _0224F832 - 2 @ case 6
_0224F840:
	movs r0, #4
	pop {r3, pc}
_0224F844:
	movs r0, #2
	pop {r3, pc}
_0224F848:
	movs r0, #1
	pop {r3, pc}
_0224F84C:
	movs r0, #7
	pop {r3, pc}
_0224F850:
	movs r0, #6
	pop {r3, pc}
_0224F854:
	movs r0, #5
	pop {r3, pc}
_0224F858:
	movs r0, #3
	pop {r3, pc}
_0224F85C:
	bl GF_AssertFail
	movs r0, #8
	pop {r3, pc}
	thumb_func_end ov02_0224F820

	thumb_func_start ov02_0224F864
ov02_0224F864: @ 0x0224F864
	push {r4, lr}
	ldr r1, _0224F87C @ =0x00000884
	bl FUN_0201AA8C
	ldr r2, _0224F87C @ =0x00000884
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r4, #0
	pop {r4, pc}
	nop
_0224F87C: .4byte 0x00000884
	thumb_func_end ov02_0224F864

	thumb_func_start ov02_0224F880
ov02_0224F880: @ 0x0224F880
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, _0224F8E4 @ =0x000007E4
	movs r1, #0xdf
	adds r0, r4, r0
	subs r2, r2, #1
	bl FUN_02007508
	ldr r0, _0224F8E8 @ =0x00000868
	movs r1, #0
	strb r1, [r4, r0]
	adds r2, r0, #1
	strb r1, [r4, r2]
	adds r2, r0, #3
	strb r1, [r4, r2]
	adds r2, r0, #4
	ldrb r3, [r4, r2]
	movs r2, #0xf
	adds r5, r4, #0
	bics r3, r2
	adds r2, r0, #4
	strb r3, [r4, r2]
	adds r2, r0, #2
	strb r1, [r4, r2]
	adds r2, r0, #5
	strb r1, [r4, r2]
	adds r0, r0, #6
	strh r1, [r4, r0]
	ldr r0, _0224F8E4 @ =0x000007E4
	ldr r2, _0224F8EC @ =0x0000FFFF
_0224F8BE:
	ldrh r3, [r5, r0]
	cmp r3, r2
	beq _0224F8CC
	adds r1, r1, #1
	adds r5, #8
	cmp r1, #5
	blt _0224F8BE
_0224F8CC:
	ldr r3, _0224F8F0 @ =0x0000086C
	lsls r1, r1, #0x18
	ldrb r0, [r4, r3]
	lsrs r1, r1, #0x18
	movs r2, #0xf0
	lsls r1, r1, #0x1c
	bics r0, r2
	lsrs r1, r1, #0x18
	orrs r0, r1
	strb r0, [r4, r3]
	pop {r3, r4, r5, pc}
	nop
_0224F8E4: .4byte 0x000007E4
_0224F8E8: .4byte 0x00000868
_0224F8EC: .4byte 0x0000FFFF
_0224F8F0: .4byte 0x0000086C
	thumb_func_end ov02_0224F880

	thumb_func_start ov02_0224F8F4
ov02_0224F8F4: @ 0x0224F8F4
	ldr r3, _0224F8F8 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_0224F8F8: .4byte FUN_0201AB0C
	thumb_func_end ov02_0224F8F4

	thumb_func_start ov02_0224F8FC
ov02_0224F8FC: @ 0x0224F8FC
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _0224FB2C @ =0x0000086C
	adds r4, r1, #0
	ldrb r3, [r4, r2]
	adds r5, r0, #0
	lsls r2, r3, #0x1c
	lsrs r2, r2, #0x1c
	mov ip, r2
	cmp r2, #5
	blo _0224F93E
	bl ov02_02250504
	ldr r1, _0224FB30 @ =0x0000080C
	ldr r0, [r4, r1]
	cmp r0, #0
	beq _0224F920
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0224F920:
	adds r0, r1, #0
	adds r0, #0xa
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0224F92E
	movs r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0224F92E:
	adds r1, #0xb
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0224F93A
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0224F93A:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224F93E:
	ldr r2, _0224FB2C @ =0x0000086C
	subs r2, #0x88
	adds r7, r4, r2
	mov r2, ip
	lsls r2, r2, #3
	adds r6, r7, r2
	ldrh r7, [r7, r2]
	ldr r2, _0224FB34 @ =0x0000FFFF
	cmp r7, r2
	bne _0224F980
	bl ov02_02250504
	ldr r1, _0224FB30 @ =0x0000080C
	ldr r0, [r4, r1]
	cmp r0, #0
	beq _0224F962
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0224F962:
	adds r0, r1, #0
	adds r0, #0xa
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0224F970
	movs r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0224F970:
	adds r1, #0xb
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0224F97C
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0224F97C:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224F980:
	ldr r2, _0224FB2C @ =0x0000086C
	subs r2, r2, #3
	ldrb r2, [r4, r2]
	cmp r2, #7
	bls _0224F98C
	b _0224FB28
_0224F98C:
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0224F998: @ jump table
	.2byte _0224F9A8 - _0224F998 - 2 @ case 0
	.2byte _0224F9CA - _0224F998 - 2 @ case 1
	.2byte _0224F9E8 - _0224F998 - 2 @ case 2
	.2byte _0224FA06 - _0224F998 - 2 @ case 3
	.2byte _0224FA1A - _0224F998 - 2 @ case 4
	.2byte _0224FA3E - _0224F998 - 2 @ case 5
	.2byte _0224FA50 - _0224F998 - 2 @ case 6
	.2byte _0224FAEE - _0224F998 - 2 @ case 7
_0224F9A8:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov02_0224FB44
	cmp r0, #0
	beq _0224F9CA
	adds r5, #0xe4
	ldr r0, [r5]
	bl FUN_0205F708
	ldr r0, _0224FB38 @ =0x00000868
	movs r1, #0
	strb r1, [r4, r0]
	movs r1, #5
	adds r0, r0, #1
	strb r1, [r4, r0]
	b _0224FB28
_0224F9CA:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov02_0224FB54
	cmp r0, #0
	beq _0224F9E8
	adds r5, #0xe4
	ldr r0, [r5]
	bl FUN_0205F708
	ldr r0, _0224FB3C @ =0x00000869
	movs r1, #2
	strb r1, [r4, r0]
	b _0224FB28
_0224F9E8:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov02_0224FB9C
	cmp r0, #0
	beq _0224FA06
	adds r5, #0xe4
	ldr r0, [r5]
	bl FUN_0205F6FC
	ldr r0, _0224FB3C @ =0x00000869
	movs r1, #6
	strb r1, [r4, r0]
	b _0224FB28
_0224FA06:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov02_0224FC74
	cmp r0, #0
	beq _0224FA1A
	ldr r0, _0224FB3C @ =0x00000869
	movs r1, #7
	strb r1, [r4, r0]
	b _0224FB28
_0224FA1A:
	ldr r2, _0224FB2C @ =0x0000086C
	movs r1, #0xf
	ldrb r3, [r4, r2]
	adds r0, r3, #0
	bics r0, r1
	lsls r1, r3, #0x1c
	lsrs r1, r1, #0x1c
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r1, #0xf
	ands r1, r3
	orrs r0, r1
	strb r0, [r4, r2]
	movs r1, #0
	subs r0, r2, #3
	strb r1, [r4, r0]
	b _0224FB28
_0224FA3E:
	adds r2, r7, #0
	bl ov02_02250004
	cmp r0, #0
	beq _0224FB28
	ldr r0, _0224FB3C @ =0x00000869
	movs r1, #1
	strb r1, [r4, r0]
	b _0224FB28
_0224FA50:
	ldr r0, _0224FB2C @ =0x0000086C
	adds r0, r0, #2
	ldrh r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_0205B624
	cmp r0, #1
	bne _0224FB28
	ldr r1, _0224FB2C @ =0x0000086C
	ldrb r2, [r4, r1]
	lsls r0, r2, #0x18
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x1c
	lsrs r0, r0, #0x1c
	adds r2, r2, #1
	cmp r0, r2
	ble _0224FAA8
	ldr r0, _0224FB40 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _0224FB28
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0200E9BC
	adds r0, r4, #0
	bl FUN_0201D520
	ldr r0, [r4, #0x10]
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x40
	adds r5, #0xd2
	bics r1, r0
	strb r1, [r5]
	ldr r0, _0224FB3C @ =0x00000869
	movs r1, #3
	strb r1, [r4, r0]
	b _0224FB28
_0224FAA8:
	adds r0, r1, #0
	subs r0, #0x60
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224FABA
	movs r2, #3
	subs r0, r1, #3
	strb r2, [r4, r0]
	b _0224FB28
_0224FABA:
	ldr r0, _0224FB40 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _0224FB28
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0200E9BC
	adds r0, r4, #0
	bl FUN_0201D520
	ldr r0, [r4, #0x10]
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x40
	adds r5, #0xd2
	bics r1, r0
	strb r1, [r5]
	ldr r0, _0224FB3C @ =0x00000869
	movs r1, #3
	strb r1, [r4, r0]
	b _0224FB28
_0224FAEE:
	ldr r0, _0224FB2C @ =0x0000086C
	adds r0, r0, #1
	ldrb r1, [r4, r0]
	ldrb r0, [r6, #7]
	cmp r1, r0
	blo _0224FB1A
	movs r0, #0xf
	bics r3, r0
	mov r0, ip
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #0xf
	ands r0, r1
	adds r1, r3, #0
	orrs r1, r0
	ldr r0, _0224FB2C @ =0x0000086C
	strb r1, [r4, r0]
	movs r1, #0
	subs r0, r0, #3
	strb r1, [r4, r0]
	b _0224FB28
_0224FB1A:
	ldr r0, _0224FB2C @ =0x0000086C
	adds r0, r0, #1
	ldrb r0, [r4, r0]
	adds r1, r0, #1
	ldr r0, _0224FB2C @ =0x0000086C
	adds r0, r0, #1
	strb r1, [r4, r0]
_0224FB28:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224FB2C: .4byte 0x0000086C
_0224FB30: .4byte 0x0000080C
_0224FB34: .4byte 0x0000FFFF
_0224FB38: .4byte 0x00000868
_0224FB3C: .4byte 0x00000869
_0224FB40: .4byte 0x021D110C
	thumb_func_end ov02_0224F8FC

	thumb_func_start ov02_0224FB44
ov02_0224FB44: @ 0x0224FB44
	ldrh r0, [r1]
	cmp r0, #0
	beq _0224FB4E
	movs r0, #1
	bx lr
_0224FB4E:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov02_0224FB44

	thumb_func_start ov02_0224FB54
ov02_0224FB54: @ 0x0224FB54
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	ldr r0, _0224FB98 @ =0x00000882
	adds r4, r2, #0
	ldrh r0, [r1, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_0205BB04
	cmp r0, #0
	beq _0224FB74
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224FB74:
	ldrb r2, [r4, #6]
	cmp r2, #0
	beq _0224FB92
	cmp r2, #0xe
	bls _0224FB82
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224FB82:
	adds r0, r5, #0
	adds r5, #0xe4
	ldr r1, [r5]
	subs r2, r2, #1
	bl FUN_02203AB4
	movs r0, #1
	pop {r3, r4, r5, pc}
_0224FB92:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0224FB98: .4byte 0x00000882
	thumb_func_end ov02_0224FB54

	thumb_func_start ov02_0224FB9C
ov02_0224FB9C: @ 0x0224FB9C
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r5, r0, #0
	ldrh r0, [r6, #2]
	adds r4, r1, #0
	cmp r0, #0
	beq _0224FC00
	movs r0, #1
	lsls r0, r0, #0xa
	movs r1, #0xb
	bl FUN_02026354
	str r0, [r4, #0x10]
	ldr r0, [r5, #8]
	adds r1, r4, #0
	movs r2, #3
	bl FUN_0205B514
	ldrh r3, [r6, #2]
	ldr r1, [r4, #0x10]
	adds r0, r5, #0
	movs r2, #0xb
	subs r3, r3, #1
	bl ov02_0224FC8C
	ldr r0, [r5, #0xc]
	bl FUN_02028EA8
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0205B564
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #1
	bl FUN_0205B5B4
	ldr r1, _0224FC04 @ =0x0000086E
	strh r0, [r4, r1]
	adds r0, r5, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x40
	adds r5, #0xd2
	orrs r0, r1
	strb r0, [r5]
	movs r0, #1
	pop {r4, r5, r6, pc}
_0224FC00:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0224FC04: .4byte 0x0000086E
	thumb_func_end ov02_0224FB9C

	thumb_func_start ov02_0224FC08
ov02_0224FC08: @ 0x0224FC08
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #1
	adds r4, r1, #0
	lsls r0, r0, #0xa
	movs r1, #0xb
	adds r6, r2, #0
	bl FUN_02026354
	str r0, [r4, #0x10]
	ldr r0, [r5, #8]
	adds r1, r4, #0
	movs r2, #3
	bl FUN_0205B514
	ldr r0, _0224FC6C @ =0x00000816
	movs r2, #0xb
	ldrb r0, [r4, r0]
	adds r3, r6, #0
	str r0, [sp]
	ldr r1, [r4, #0x10]
	adds r0, r5, #0
	bl ov02_0224FCE0
	ldr r0, [r5, #0xc]
	bl FUN_02028EA8
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0205B564
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #1
	bl FUN_0205B5B4
	ldr r1, _0224FC70 @ =0x0000086E
	strh r0, [r4, r1]
	adds r0, r5, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x40
	adds r5, #0xd2
	orrs r0, r1
	strb r0, [r5]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0224FC6C: .4byte 0x00000816
_0224FC70: .4byte 0x0000086E
	thumb_func_end ov02_0224FC08

	thumb_func_start ov02_0224FC74
ov02_0224FC74: @ 0x0224FC74
	ldr r2, _0224FC88 @ =0x0000086D
	movs r3, #0
	strb r3, [r0, r2]
	ldrb r0, [r1, #7]
	cmp r0, #0
	beq _0224FC82
	movs r3, #1
_0224FC82:
	adds r0, r3, #0
	bx lr
	nop
_0224FC88: .4byte 0x0000086D
	thumb_func_end ov02_0224FC74

	thumb_func_start ov02_0224FC8C
ov02_0224FC8C: @ 0x0224FC8C
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	movs r1, #0x1b
	adds r4, r2, #0
	adds r2, r1, #0
	adds r6, r0, #0
	adds r7, r3, #0
	movs r0, #0
	adds r2, #0xee
	adds r3, r4, #0
	bl FUN_0200BAF8
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0200BD08
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov02_022504A0
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r1, [sp]
	adds r0, r4, #0
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0200BDA0
	adds r0, r5, #0
	bl FUN_0200BB44
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224FC8C

	thumb_func_start ov02_0224FCE0
ov02_0224FCE0: @ 0x0224FCE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r2, #0
	adds r5, r0, #0
	str r1, [sp]
	adds r6, r3, #0
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0x28
	adds r3, r4, #0
	bl FUN_0200BAF8
	adds r7, r0, #0
	adds r0, r4, #0
	bl FUN_0200BD08
	adds r4, r0, #0
	movs r0, #2
	tst r0, r6
	ldr r0, [r5, #0xc]
	beq _0224FD3E
	bl FUN_02028E9C
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0200BE48
	movs r1, #1
	adds r0, r6, #0
	tst r0, r1
	add r2, sp, #0x10
	beq _0224FD30
	ldrb r2, [r2, #0x10]
	adds r0, r4, #0
	subs r2, r2, #1
	bl FUN_0200C654
	movs r1, #0x20
	b _0224FD72
_0224FD30:
	ldrb r2, [r2, #0x10]
	adds r0, r4, #0
	subs r2, r2, #1
	bl FUN_0200C688
	movs r1, #0x5f
	b _0224FD72
_0224FD3E:
	bl FUN_02074904
	bl FUN_02054388
	bl FUN_02070DB0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	bl FUN_02028E9C
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0200BE48
	ldr r2, [sp, #4]
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0200BF8C
	movs r0, #1
	tst r0, r6
	beq _0224FD70
	movs r1, #0x61
	b _0224FD72
_0224FD70:
	movs r1, #0x62
_0224FD72:
	adds r0, r7, #0
	bl FUN_0200BBA0
	adds r5, r0, #0
	ldr r1, [sp]
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0200BDA0
	adds r0, r7, #0
	bl FUN_0200BB44
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224FCE0

	thumb_func_start ov02_0224FD9C
ov02_0224FD9C: @ 0x0224FD9C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_0205F944
	movs r0, #2
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0224FDBC
	ldr r1, [sp]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp]
_0224FDBC:
	movs r0, #3
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0224FDDC
	adds r0, r4, #0
	bl FUN_02069F7C
	cmp r0, #0x32
	beq _0224FDDC
	cmp r0, #0x33
	beq _0224FDDC
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl FUN_021F8F74
_0224FDDC:
	movs r0, #4
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0224FDEC
	ldr r1, [sp, #8]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp, #8]
_0224FDEC:
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_0205F954
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov02_0224FD9C

	thumb_func_start ov02_0224FDF8
ov02_0224FDF8: @ 0x0224FDF8
	push {r4, lr}
	sub sp, #8
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _0224FE32
	cmp r1, #0
	beq _0224FE32
	ldr r0, _0224FE38 @ =0x0000094A
	cmp r1, r0
	bls _0224FE2C
	adds r0, r0, #1
	cmp r1, r0
	bne _0224FE16
	movs r0, #0
	b _0224FE18
_0224FE16:
	movs r0, #0xb
_0224FE18:
	ldr r4, _0224FE3C @ =0x000001FF
	adds r1, r2, #0
	str r4, [sp]
	str r3, [sp, #4]
	adds r2, r4, #0
	adds r3, r4, #0
	bl FUN_020063A4
	add sp, #8
	pop {r4, pc}
_0224FE2C:
	adds r0, r1, #0
	bl FUN_0200604C
_0224FE32:
	add sp, #8
	pop {r4, pc}
	nop
_0224FE38: .4byte 0x0000094A
_0224FE3C: .4byte 0x000001FF
	thumb_func_end ov02_0224FDF8

	thumb_func_start ov02_0224FE40
ov02_0224FE40: @ 0x0224FE40
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	ldrb r0, [r5]
	adds r4, r2, #0
	cmp r0, #0
	beq _0224FE6C
	adds r0, r4, #0
	bl FUN_0205F2A8
	ldrb r1, [r5]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r4, #0
	subs r1, r1, #1
	bl FUN_0205F288
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov02_0224FE70
_0224FE6C:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224FE40

	thumb_func_start ov02_0224FE70
ov02_0224FE70: @ 0x0224FE70
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r6, r2, #0
	bl FUN_022055DC
	cmp r0, #0
	beq _0224FEFC
	adds r0, r4, #0
	bl FUN_0205F2A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	beq _0224FEFC
	ldr r0, _0224FF00 @ =0x0000087C
	ldrb r0, [r5, r0]
	cmp r0, #2
	beq _0224FE9E
	cmp r0, #3
	bne _0224FEFC
_0224FE9E:
	adds r0, r4, #0
	bl FUN_0205F52C
	ldr r1, _0224FF00 @ =0x0000087C
	adds r6, r0, #0
	ldrb r1, [r5, r1]
	adds r0, r4, #0
	add r2, sp, #8
	add r3, sp, #4
	bl ov02_0224FF04
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	adds r0, r6, #0
	bl FUN_02054918
	adds r5, r0, #0
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl FUN_0205B6E8
	cmp r0, #1
	bne _0224FEE0
	movs r0, #1
	str r0, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	bl FUN_021FF0E4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0224FEE0:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl FUN_0205B6F4
	cmp r0, #1
	bne _0224FEFC
	movs r0, #1
	str r0, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	bl FUN_021FF964
_0224FEFC:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0224FF00: .4byte 0x0000087C
	thumb_func_end ov02_0224FE70

	thumb_func_start ov02_0224FF04
ov02_0224FF04: @ 0x0224FF04
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r2, #0
	adds r6, r1, #0
	adds r5, r3, #0
	bl FUN_0205F914
	str r0, [r4]
	adds r0, r7, #0
	bl FUN_0205F934
	str r0, [r5]
	cmp r6, #3
	bhi _0224FF54
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224FF2C: @ jump table
	.2byte _0224FF34 - _0224FF2C - 2 @ case 0
	.2byte _0224FF3C - _0224FF2C - 2 @ case 1
	.2byte _0224FF44 - _0224FF2C - 2 @ case 2
	.2byte _0224FF4C - _0224FF2C - 2 @ case 3
_0224FF34:
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0224FF3C:
	ldr r0, [r5]
	subs r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0224FF44:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0224FF4C:
	ldr r0, [r4]
	subs r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0224FF54:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0224FF04

	thumb_func_start ov02_0224FF5C
ov02_0224FF5C: @ 0x0224FF5C
	push {r4, r5, r6, lr}
	ldr r3, _0224FFCC @ =0x00000818
	adds r5, r0, #0
	adds r2, r3, #0
	adds r2, #0x53
	ldrb r2, [r5, r2]
	adds r0, r5, r3
	adds r3, #0x52
	lsls r2, r2, #3
	adds r4, r0, r2
	ldrb r0, [r5, r3]
	adds r6, r1, #0
	cmp r0, #0
	bne _0224FFA8
	adds r0, r4, #0
	bl ov02_0224FD9C
	ldr r3, _0224FFD0 @ =0x0000086C
	adds r0, r4, #0
	ldrb r1, [r5, r3]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x19
	adds r2, r5, r1
	adds r1, r3, #0
	subs r1, #0x84
	ldrh r1, [r2, r1]
	adds r2, r3, #0
	adds r2, #0x12
	adds r3, #0x11
	ldrh r2, [r5, r2]
	ldrb r3, [r5, r3]
	bl ov02_0224FDF8
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov02_0224FE40
_0224FFA8:
	ldr r1, _0224FFD4 @ =0x0000086A
	ldrb r0, [r5, r1]
	adds r0, r0, #1
	strb r0, [r5, r1]
	ldrb r2, [r5, r1]
	ldrb r0, [r4, #1]
	cmp r2, r0
	blo _0224FFC6
	adds r0, r1, #1
	ldrb r0, [r5, r0]
	adds r2, r0, #1
	adds r0, r1, #1
	strb r2, [r5, r0]
	movs r0, #1
	pop {r4, r5, r6, pc}
_0224FFC6:
	movs r0, #0
	pop {r4, r5, r6, pc}
	nop
_0224FFCC: .4byte 0x00000818
_0224FFD0: .4byte 0x0000086C
_0224FFD4: .4byte 0x0000086A
	thumb_func_end ov02_0224FF5C

	thumb_func_start ov02_0224FFD8
ov02_0224FFD8: @ 0x0224FFD8
	ldr r2, _02250000 @ =0x0000086B
	ldrb r1, [r0, r2]
	cmp r1, #0xa
	blo _0224FFE4
	movs r0, #0
	bx lr
_0224FFE4:
	lsls r1, r1, #3
	adds r3, r0, r1
	adds r1, r2, #0
	subs r1, #0x53
	ldrb r1, [r3, r1]
	cmp r1, #0xff
	bne _0224FFF6
	movs r0, #0
	bx lr
_0224FFF6:
	movs r3, #0
	subs r1, r2, #1
	strb r3, [r0, r1]
	movs r0, #1
	bx lr
	.align 2, 0
_02250000: .4byte 0x0000086B
	thumb_func_end ov02_0224FFD8

	thumb_func_start ov02_02250004
ov02_02250004: @ 0x02250004
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	bne _02250016
	bl GF_AssertFail
	movs r0, #1
	pop {r4, r5, r6, pc}
_02250016:
	ldr r0, _02250108 @ =0x00000868
	ldrb r1, [r4, r0]
	cmp r1, #4
	bhi _02250102
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225002A: @ jump table
	.2byte _02250034 - _0225002A - 2 @ case 0
	.2byte _02250040 - _0225002A - 2 @ case 1
	.2byte _02250082 - _0225002A - 2 @ case 2
	.2byte _02250098 - _0225002A - 2 @ case 3
	.2byte _022500AE - _0225002A - 2 @ case 4
_02250034:
	subs r0, #0x50
	adds r0, r4, r0
	movs r1, #0xe0
	subs r2, r2, #1
	bl FUN_02007508
_02250040:
	adds r0, r5, #0
	adds r0, #0xe4
	movs r1, #0x87
	lsls r1, r1, #4
	ldr r0, [r0]
	adds r1, r4, r1
	bl FUN_0205F944
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	bl FUN_0205F2A8
	ldr r1, _0225010C @ =0x0000087C
	strb r0, [r4, r1]
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #0
	bl FUN_021F8F68
	adds r5, #0xe4
	ldr r0, [r5]
	movs r1, #1
	bl FUN_021F8F08
	ldr r0, _02250108 @ =0x00000868
	movs r1, #2
	strb r1, [r4, r0]
	movs r1, #0
	adds r0, r0, #3
	strb r1, [r4, r0]
	b _02250102
_02250082:
	adds r0, r4, #0
	bl ov02_0224FFD8
	cmp r0, #0
	ldr r0, _02250108 @ =0x00000868
	bne _02250094
	movs r1, #4
	strb r1, [r4, r0]
	b _02250102
_02250094:
	movs r1, #3
	strb r1, [r4, r0]
_02250098:
	adds r5, #0xe4
	ldr r1, [r5]
	adds r0, r4, #0
	bl ov02_0224FF5C
	cmp r0, #0
	beq _02250102
	ldr r0, _02250108 @ =0x00000868
	movs r1, #2
	strb r1, [r4, r0]
	b _02250102
_022500AE:
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	bl FUN_0205F2A8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #0
	bl FUN_021F8F68
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #0
	bl FUN_021F8F08
	adds r0, r5, #0
	adds r0, #0xe4
	movs r1, #0x87
	lsls r1, r1, #4
	ldr r0, [r0]
	adds r1, r4, r1
	bl FUN_0205F954
	ldr r1, _0225010C @ =0x0000087C
	adds r0, r5, #0
	adds r0, #0xe4
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl FUN_0205F288
	adds r5, #0xe4
	ldr r1, [r5]
	adds r0, r4, #0
	adds r2, r6, #0
	bl ov02_0224FE70
	movs r0, #1
	pop {r4, r5, r6, pc}
_02250102:
	movs r0, #0
	pop {r4, r5, r6, pc}
	nop
_02250108: .4byte 0x00000868
_0225010C: .4byte 0x0000087C
	thumb_func_end ov02_02250004

	thumb_func_start ov02_02250110
ov02_02250110: @ 0x02250110
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl FUN_0205064C
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_02050654
	adds r6, r0, #0
	ldr r0, [r6]
	cmp r0, #5
	bls _0225012A
	b _0225047E
_0225012A:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02250136: @ jump table
	.2byte _02250142 - _02250136 - 2 @ case 0
	.2byte _0225015C - _02250136 - 2 @ case 1
	.2byte _022501A2 - _02250136 - 2 @ case 2
	.2byte _02250314 - _02250136 - 2 @ case 3
	.2byte _02250378 - _02250136 - 2 @ case 4
	.2byte _02250418 - _02250136 - 2 @ case 5
_02250142:
	adds r0, r4, #0
	bl ov02_0224EF94
	adds r1, r0, #0
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov02_0224F880
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0225047E
_0225015C:
	movs r1, #0x12
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov02_0224F8FC
	cmp r0, #1
	bne _02250178
	adds r4, #0xe4
	ldr r0, [r4]
	bl FUN_0205F6FC
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02250178:
	cmp r0, #2
	bne _0225018E
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250484 @ =0x00000869
	movs r2, #0xa
	strb r2, [r1, r0]
	movs r0, #2
	str r0, [r6]
	b _0225047E
_0225018E:
	cmp r0, #3
	bne _02250198
	movs r0, #3
	str r0, [r6]
	b _0225047E
_02250198:
	cmp r0, #4
	bne _02250270
	movs r0, #4
	str r0, [r6]
	b _0225047E
_022501A2:
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250484 @ =0x00000869
	ldrb r0, [r1, r0]
	subs r0, #0xa
	cmp r0, #3
	bhi _02250270
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022501BE: @ jump table
	.2byte _022501C6 - _022501BE - 2 @ case 0
	.2byte _022501DE - _022501BE - 2 @ case 1
	.2byte _02250218 - _022501BE - 2 @ case 2
	.2byte _02250246 - _022501BE - 2 @ case 3
_022501C6:
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0
	bl FUN_021F6A9C
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250484 @ =0x00000869
	movs r2, #0xb
	strb r2, [r1, r0]
	b _0225047E
_022501DE:
	adds r0, r4, #0
	bl FUN_021F6B00
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_021F6B10
	cmp r5, #3
	bne _02250270
	cmp r0, #1
	bne _02250270
	movs r3, #0x12
	lsls r3, r3, #4
	ldr r5, [r4, r3]
	movs r3, #0x22
	movs r1, #3
	lsls r3, r3, #6
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r5, r3
	bl FUN_021F6ABC
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250484 @ =0x00000869
	movs r2, #0xc
	strb r2, [r1, r0]
	b _0225047E
_02250218:
	adds r0, r4, #0
	bl FUN_021F6B00
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_021F6AEC
	cmp r5, #3
	bne _02250270
	cmp r0, #6
	bne _02250270
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl FUN_021F6A9C
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250484 @ =0x00000869
	movs r2, #0xd
	strb r2, [r1, r0]
	b _0225047E
_02250246:
	adds r0, r4, #0
	bl FUN_021F6B00
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_021F6B10
	cmp r5, #0
	bne _02250270
	cmp r0, #1
	bne _02250270
	movs r0, #0x12
	lsls r0, r0, #4
	movs r1, #0x22
	ldr r0, [r4, r0]
	lsls r1, r1, #6
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _02250272
	cmp r1, #1
	beq _022502C4
_02250270:
	b _0225047E
_02250272:
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201D520
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x10]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x40
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0xd2
	strb r1, [r0]
	movs r0, #0x12
	lsls r0, r0, #4
	movs r1, #0x81
	ldr r0, [r4, r0]
	lsls r1, r1, #4
	ldrh r1, [r0, r1]
	cmp r1, #0
	bne _022502BA
	adds r4, #0xe4
	ldr r0, [r4]
	bl FUN_0205F6FC
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022502BA:
	bl ov02_0224F880
	movs r0, #1
	str r0, [r6]
	b _0225047E
_022502C4:
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201D520
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x10]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x40
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0xd2
	strb r1, [r0]
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, _02250488 @ =0x00000812
	ldrh r1, [r0, r1]
	cmp r1, #0
	bne _0225030A
	adds r4, #0xe4
	ldr r0, [r4]
	bl FUN_0205F6FC
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225030A:
	bl ov02_0224F880
	movs r0, #1
	str r0, [r6]
	b _0225047E
_02250314:
	ldr r0, [r4, #0xc]
	bl FUN_0202C028
	bl FUN_0202B9E0
	adds r7, r0, #0
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _0225048C @ =0x00000816
	ldrb r0, [r1, r0]
	subs r5, r0, #1
	bmi _02250332
	cmp r5, #0x64
	blt _02250336
_02250332:
	bl GF_AssertFail
_02250336:
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #1
	bl FUN_0202BA2C
	cmp r0, #0
	beq _02250364
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #1
	bl FUN_0202BB08
	movs r1, #0x12
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #3
	bl ov02_0224FC08
	ldr r0, _02250490 @ =0x000004A7
	bl FUN_02006B24
	b _02250372
_02250364:
	movs r1, #0x12
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #2
	bl ov02_0224FC08
_02250372:
	movs r0, #5
	str r0, [r6]
	b _0225047E
_02250378:
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250494 @ =0x00000817
	ldrb r0, [r1, r0]
	cmp r0, #5
	bhi _022503B2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02250392: @ jump table
	.2byte _022503B2 - _02250392 - 2 @ case 0
	.2byte _0225039E - _02250392 - 2 @ case 1
	.2byte _022503A2 - _02250392 - 2 @ case 2
	.2byte _022503A6 - _02250392 - 2 @ case 3
	.2byte _022503AA - _02250392 - 2 @ case 4
	.2byte _022503AE - _02250392 - 2 @ case 5
_0225039E:
	movs r5, #0xb5
	b _022503BA
_022503A2:
	movs r5, #0xb6
	b _022503BA
_022503A6:
	movs r5, #0xb7
	b _022503BA
_022503AA:
	movs r5, #0xb8
	b _022503BA
_022503AE:
	movs r5, #0xb9
	b _022503BA
_022503B2:
	bl GF_AssertFail
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022503BA:
	ldr r0, [r4, #0xc]
	bl FUN_02074904
	bl FUN_02054388
	adds r1, r5, #0
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bne _02250404
	ldr r0, [r4, #0xc]
	bl FUN_020503D0
	bl FUN_02066654
	movs r1, #1
	add r0, sp, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r1, r5, #0
	add r2, sp, #0
	bl FUN_0206EC40
	movs r1, #0x12
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	bl ov02_0224FC08
	ldr r0, _02250490 @ =0x000004A7
	bl FUN_02006B24
	b _02250412
_02250404:
	movs r1, #0x12
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #0
	bl ov02_0224FC08
_02250412:
	movs r0, #5
	str r0, [r6]
	b _0225047E
_02250418:
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250498 @ =0x0000086E
	ldrh r0, [r1, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_0205B624
	cmp r0, #1
	bne _0225047E
	bl FUN_02006BCC
	cmp r0, #0
	bne _0225047E
	ldr r0, _0225049C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _0225047E
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201D520
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x10]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x40
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0xd2
	adds r4, #0xe4
	strb r1, [r0]
	ldr r0, [r4]
	bl FUN_0205F6FC
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225047E:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02250484: .4byte 0x00000869
_02250488: .4byte 0x00000812
_0225048C: .4byte 0x00000816
_02250490: .4byte 0x000004A7
_02250494: .4byte 0x00000817
_02250498: .4byte 0x0000086E
_0225049C: .4byte 0x021D110C
	thumb_func_end ov02_02250110

	thumb_func_start ov02_022504A0
ov02_022504A0: @ 0x022504A0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r4, r1, #0
	bl FUN_02074904
	bl FUN_02054388
	adds r6, r0, #0
	bl FUN_02070DB0
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #0
	adds r2, r7, #0
	bl FUN_0200BF8C
	adds r0, r4, #0
	movs r1, #1
	adds r2, r7, #0
	bl FUN_0200BF1C
	ldr r0, [r5, #0xc]
	bl FUN_02028E9C
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0200BE48
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl FUN_0203B36C
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0200C5AC
	adds r0, r6, #0
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0200C0CC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022504A0

	thumb_func_start ov02_02250504
ov02_02250504: @ 0x02250504
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_02074904
	bl FUN_02054388
	adds r4, r0, #0
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0206A268
	movs r1, #0x12
	str r0, [sp]
	lsls r1, r1, #4
	ldr r2, [r5, r1]
	ldr r1, _0225058C @ =0x00000815
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	str r1, [sp]
	cmp r1, #0x7f
	ble _02250538
	movs r0, #0x7f
	str r0, [sp]
	b _02250542
_02250538:
	movs r0, #0x7e
	mvns r0, r0
	cmp r1, r0
	bge _02250542
	str r0, [sp]
_02250542:
	movs r0, #0x42
	ldr r1, [sp]
	lsls r0, r0, #2
	lsls r1, r1, #0x18
	ldr r0, [r5, r0]
	asrs r1, r1, #0x18
	bl FUN_0206A240
	adds r0, r4, #0
	movs r1, #9
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x12
	str r0, [sp]
	lsls r1, r1, #4
	ldr r2, [r5, r1]
	ldr r1, _02250590 @ =0x00000814
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	str r0, [sp]
	cmp r0, #0xff
	ble _02250576
	movs r0, #0xff
	str r0, [sp]
	b _0225057E
_02250576:
	cmp r0, #0
	bge _0225057E
	movs r0, #0
	str r0, [sp]
_0225057E:
	adds r0, r4, #0
	movs r1, #9
	add r2, sp, #0
	bl FUN_0206EC40
	pop {r3, r4, r5, pc}
	nop
_0225058C: .4byte 0x00000815
_02250590: .4byte 0x00000814
	thumb_func_end ov02_02250504

	thumb_func_start ov02_02250594
ov02_02250594: @ 0x02250594
	cmp r0, #0xa
	bhi _02250622
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022505A4: @ jump table
	.2byte _02250622 - _022505A4 - 2 @ case 0
	.2byte _022505BA - _022505A4 - 2 @ case 1
	.2byte _022505C2 - _022505A4 - 2 @ case 2
	.2byte _022505CE - _022505A4 - 2 @ case 3
	.2byte _022505DA - _022505A4 - 2 @ case 4
	.2byte _022505E6 - _022505A4 - 2 @ case 5
	.2byte _022505F2 - _022505A4 - 2 @ case 6
	.2byte _022505FE - _022505A4 - 2 @ case 7
	.2byte _0225060A - _022505A4 - 2 @ case 8
	.2byte _02250612 - _022505A4 - 2 @ case 9
	.2byte _0225061A - _022505A4 - 2 @ case 10
_022505BA:
	cmp r1, #0xff
	bne _02250622
	movs r0, #1
	bx lr
_022505C2:
	cmp r1, #0xc8
	blt _02250622
	cmp r1, #0xff
	bge _02250622
	movs r0, #1
	bx lr
_022505CE:
	cmp r1, #0x96
	blt _02250622
	cmp r1, #0xc8
	bge _02250622
	movs r0, #1
	bx lr
_022505DA:
	cmp r1, #0x5a
	blt _02250622
	cmp r1, #0x96
	bge _02250622
	movs r0, #1
	bx lr
_022505E6:
	cmp r1, #0x3c
	blt _02250622
	cmp r1, #0x5a
	bge _02250622
	movs r0, #1
	bx lr
_022505F2:
	cmp r1, #0x1e
	blt _02250622
	cmp r1, #0x3c
	bge _02250622
	movs r0, #1
	bx lr
_022505FE:
	cmp r1, #1
	blt _02250622
	cmp r1, #0x1e
	bge _02250622
	movs r0, #1
	bx lr
_0225060A:
	cmp r1, #0
	bne _02250622
	movs r0, #1
	bx lr
_02250612:
	cmp r1, #0x5a
	blt _02250622
	movs r0, #1
	bx lr
_0225061A:
	cmp r1, #0x3c
	bge _02250622
	movs r0, #1
	bx lr
_02250622:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov02_02250594

	thumb_func_start ov02_02250628
ov02_02250628: @ 0x02250628
	cmp r0, #0xa
	bhi _022506CE
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02250638: @ jump table
	.2byte _022506CE - _02250638 - 2 @ case 0
	.2byte _0225064E - _02250638 - 2 @ case 1
	.2byte _02250656 - _02250638 - 2 @ case 2
	.2byte _02250662 - _02250638 - 2 @ case 3
	.2byte _0225066E - _02250638 - 2 @ case 4
	.2byte _0225067A - _02250638 - 2 @ case 5
	.2byte _0225068A - _02250638 - 2 @ case 6
	.2byte _0225069C - _02250638 - 2 @ case 7
	.2byte _022506AE - _02250638 - 2 @ case 8
	.2byte _022506BA - _02250638 - 2 @ case 9
	.2byte _022506C2 - _02250638 - 2 @ case 10
_0225064E:
	cmp r1, #0x7f
	bne _022506CE
	movs r0, #1
	bx lr
_02250656:
	cmp r1, #0x64
	blt _022506CE
	cmp r1, #0x7f
	bge _022506CE
	movs r0, #1
	bx lr
_02250662:
	cmp r1, #0x32
	blt _022506CE
	cmp r1, #0x64
	bge _022506CE
	movs r0, #1
	bx lr
_0225066E:
	cmp r1, #0x1e
	blt _022506CE
	cmp r1, #0x32
	bge _022506CE
	movs r0, #1
	bx lr
_0225067A:
	movs r0, #0x1d
	mvns r0, r0
	cmp r1, r0
	ble _022506CE
	cmp r1, #0x1e
	bge _022506CE
	movs r0, #1
	bx lr
_0225068A:
	movs r0, #0x31
	mvns r0, r0
	cmp r1, r0
	ble _022506CE
	adds r0, #0x14
	cmp r1, r0
	bgt _022506CE
	movs r0, #1
	bx lr
_0225069C:
	movs r0, #0x7e
	mvns r0, r0
	cmp r1, r0
	ble _022506CE
	adds r0, #0x4d
	cmp r1, r0
	bgt _022506CE
	movs r0, #1
	bx lr
_022506AE:
	movs r0, #0x7e
	mvns r0, r0
	cmp r1, r0
	bne _022506CE
	movs r0, #1
	bx lr
_022506BA:
	cmp r1, #0
	blt _022506CE
	movs r0, #1
	bx lr
_022506C2:
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	bgt _022506CE
	movs r0, #1
	bx lr
_022506CE:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov02_02250628

	thumb_func_start ov02_022506D4
ov02_022506D4: @ 0x022506D4
	push {r3, lr}
	cmp r0, #0xf9
	bhi _022506E2
	cmp r0, r1
	bne _02250732
	movs r0, #1
	pop {r3, pc}
_022506E2:
	subs r0, #0xfa
	cmp r0, #4
	bhi _0225072A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022506F4: @ jump table
	.2byte _022506FE - _022506F4 - 2 @ case 0
	.2byte _02250706 - _022506F4 - 2 @ case 1
	.2byte _0225070E - _022506F4 - 2 @ case 2
	.2byte _0225071A - _022506F4 - 2 @ case 3
	.2byte _02250722 - _022506F4 - 2 @ case 4
_022506FE:
	cmp r1, #0x13
	bhi _02250732
	movs r0, #1
	pop {r3, pc}
_02250706:
	cmp r1, #0x82
	bhi _02250732
	movs r0, #1
	pop {r3, pc}
_0225070E:
	cmp r1, #0x8c
	blo _02250732
	cmp r1, #0x95
	bhi _02250732
	movs r0, #1
	pop {r3, pc}
_0225071A:
	cmp r1, #0xa0
	blo _02250732
	movs r0, #1
	pop {r3, pc}
_02250722:
	cmp r1, #0xdc
	blo _02250732
	movs r0, #1
	pop {r3, pc}
_0225072A:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
_02250732:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_022506D4

	thumb_func_start ov02_02250738
ov02_02250738: @ 0x02250738
	push {r4, r5}
	sub sp, #8
	ldr r4, _0225077C @ =0x02253A54
	add r2, sp, #0
	ldrb r5, [r4]
	add r3, sp, #0
	adds r0, r2, r0
	strb r5, [r3]
	ldrb r5, [r4, #1]
	subs r0, r0, #1
	strb r5, [r3, #1]
	ldrb r5, [r4, #2]
	strb r5, [r3, #2]
	ldrb r5, [r4, #3]
	ldrb r4, [r4, #4]
	strb r5, [r3, #3]
	strb r4, [r3, #4]
	ldrb r0, [r0]
	movs r3, #0
	ands r0, r1
_02250760:
	cmp r0, #0
	bne _0225076C
	add sp, #8
	movs r0, #1
	pop {r4, r5}
	bx lr
_0225076C:
	adds r3, r3, #1
	cmp r3, #5
	blt _02250760
	movs r0, #0
	add sp, #8
	pop {r4, r5}
	bx lr
	nop
_0225077C: .4byte 0x02253A54
	thumb_func_end ov02_02250738

	thumb_func_start ov02_02250780
ov02_02250780: @ 0x02250780
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0xc]
	adds r5, r1, #0
	bl FUN_02074904
	bl FUN_02054388
	adds r6, r0, #0
	movs r1, #0xb1
	movs r2, #0
	bl FUN_0206E540
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0xb2
	movs r2, #0
	bl FUN_0206E540
	cmp r4, r5
	beq _022507AC
	cmp r0, r5
	bne _022507B0
_022507AC:
	movs r0, #1
	pop {r4, r5, r6, pc}
_022507B0:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02250780

	thumb_func_start ov02_022507B4
ov02_022507B4: @ 0x022507B4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0xe4
	ldr r0, [r0]
	adds r4, r1, #0
	bl FUN_02069F7C
	subs r0, #0x32
	cmp r0, #1
	bls _022507E0
	movs r0, #0xb
	movs r1, #8
	bl FUN_0201AACC
	adds r2, r0, #0
	strh r4, [r2]
	movs r0, #0
	strh r0, [r2, #2]
	ldr r0, [r5, #0x10]
	ldr r1, _022507E4 @ =ov02_022507E8
	bl FUN_02050530
_022507E0:
	pop {r3, r4, r5, pc}
	nop
_022507E4: .4byte ov02_022507E8
	thumb_func_end ov02_022507B4

	thumb_func_start ov02_022507E8
ov02_022507E8: @ 0x022507E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl FUN_0205064C
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_02050650
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02050654
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #4
	bhi _022508AA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02250814: @ jump table
	.2byte _0225081E - _02250814 - 2 @ case 0
	.2byte _0225082E - _02250814 - 2 @ case 1
	.2byte _0225084C - _02250814 - 2 @ case 2
	.2byte _02250874 - _02250814 - 2 @ case 3
	.2byte _022508A0 - _02250814 - 2 @ case 4
_0225081E:
	adds r0, r6, #0
	adds r0, #0xe4
	ldr r0, [r0]
	bl FUN_0205F708
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0225082E:
	adds r0, r6, #0
	bl FUN_02069D68
	bl FUN_02062108
	cmp r0, #0
	beq _022508AA
	adds r6, #0xe4
	ldr r0, [r6]
	bl FUN_0205F6FC
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _022508AA
_0225084C:
	adds r0, r6, #0
	adds r0, #0xe4
	ldr r0, [r0]
	bl FUN_0205F2A8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r6, #0xe4
	movs r2, #0x14
	ldr r3, _022508B0 @ =0x02253A70
	muls r2, r1, r2
	ldr r0, [r6]
	adds r1, r3, r2
	bl FUN_02062214
	str r0, [r5, #4]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _022508AA
_02250874:
	ldr r0, [r5, #4]
	bl FUN_02062260
	cmp r0, #1
	bne _022508AA
	ldr r0, [r5, #4]
	bl FUN_0206226C
	ldrh r0, [r5, #2]
	adds r0, r0, #1
	strh r0, [r5, #2]
	ldrh r1, [r5, #2]
	ldrh r0, [r5]
	cmp r1, r0
	blo _0225089A
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _022508AA
_0225089A:
	movs r0, #0
	str r0, [r4]
	b _022508AA
_022508A0:
	adds r0, r5, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r4, r5, r6, pc}
_022508AA:
	movs r0, #0
	pop {r4, r5, r6, pc}
	nop
_022508B0: .4byte 0x02253A70
	thumb_func_end ov02_022507E8

	thumb_func_start ov02_022508B4
ov02_022508B4: @ 0x022508B4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xb
	movs r1, #4
	bl FUN_0201AACC
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r2]
	strh r0, [r2, #2]
	ldr r0, [r4, #0x10]
	ldr r1, _022508D4 @ =ov02_022508D8
	bl FUN_02050530
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_022508D4: .4byte ov02_022508D8
	thumb_func_end ov02_022508B4

	thumb_func_start ov02_022508D8
ov02_022508D8: @ 0x022508D8
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r4, r0, #0
	bl FUN_0205064C
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_02050654
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02050650
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #3
	bls _022508FC
	b _02250A44
_022508FC:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02250908: @ jump table
	.2byte _02250910 - _02250908 - 2 @ case 0
	.2byte _0225099A - _02250908 - 2 @ case 1
	.2byte _022509AE - _02250908 - 2 @ case 2
	.2byte _02250A3A - _02250908 - 2 @ case 3
_02250910:
	ldr r3, _02250A4C @ =0x02253B24
	add r2, sp, #0xc
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldrh r0, [r4, #2]
	adds r0, r0, #1
	strh r0, [r4, #2]
	ldrh r0, [r4, #2]
	blx FUN_020F0C18
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r1, _02250A50 @ =0x40A00000
	movs r0, #0
	blx FUN_020F0C54
	ldr r3, _02250A54 @ =0x40240000
	movs r2, #0
	blx FUN_020F2DA0
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r1, _02250A58 @ =0x40B00000
	movs r0, #0
	blx FUN_020F068C
	blx FUN_020F0AA8
	str r0, [sp, #0xc]
	ldrh r0, [r4, #2]
	blx FUN_020F0C18
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r1, _02250A50 @ =0x40A00000
	movs r0, #0
	blx FUN_020F0C54
	ldr r3, _02250A54 @ =0x40240000
	movs r2, #0
	blx FUN_020F2DA0
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r1, _02250A58 @ =0x40B00000
	movs r0, #0
	blx FUN_020F068C
	blx FUN_020F0AA8
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x3c]
	bl FUN_021F771C
	add r1, sp, #0xc
	bl FUN_02023E78
	ldrh r0, [r4, #2]
	cmp r0, #0xa
	blo _02250A44
	movs r0, #0
	strh r0, [r4, #2]
	strh r0, [r4]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02250A44
_0225099A:
	ldrh r0, [r4]
	adds r0, r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0xa
	blo _02250A44
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02250A44
_022509AE:
	ldr r3, _02250A5C @ =0x02253B30
	add r2, sp, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldrh r0, [r4, #2]
	adds r0, r0, #1
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	cmp r1, #0xa
	blo _022509CE
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02250A2C
_022509CE:
	movs r0, #0xa
	subs r0, r0, r1
	blx FUN_020F0BD8
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r1, _02250A50 @ =0x40A00000
	movs r0, #0
	blx FUN_020F0C54
	ldr r3, _02250A54 @ =0x40240000
	movs r2, #0
	blx FUN_020F2DA0
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r1, _02250A58 @ =0x40B00000
	movs r0, #0
	blx FUN_020F068C
	blx FUN_020F0AA8
	str r0, [sp]
	ldrh r1, [r4, #2]
	movs r0, #0xa
	subs r0, r0, r1
	blx FUN_020F0BD8
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r1, _02250A50 @ =0x40A00000
	movs r0, #0
	blx FUN_020F0C54
	ldr r3, _02250A54 @ =0x40240000
	movs r2, #0
	blx FUN_020F2DA0
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r1, _02250A58 @ =0x40B00000
	movs r0, #0
	blx FUN_020F068C
	blx FUN_020F0AA8
	str r0, [sp, #4]
_02250A2C:
	ldr r0, [r6, #0x3c]
	bl FUN_021F771C
	add r1, sp, #0
	bl FUN_02023E78
	b _02250A44
_02250A3A:
	bl FUN_0201AB0C
	add sp, #0x18
	movs r0, #1
	pop {r4, r5, r6, pc}
_02250A44:
	movs r0, #0
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_02250A4C: .4byte 0x02253B24
_02250A50: .4byte 0x40A00000
_02250A54: .4byte 0x40240000
_02250A58: .4byte 0x40B00000
_02250A5C: .4byte 0x02253B30
	thumb_func_end ov02_022508D8

	thumb_func_start ov02_02250A60
ov02_02250A60: @ 0x02250A60
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r0, #4
	movs r1, #0x28
	bl FUN_0201AACC
	ldr r1, [r5, #4]
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	ldr r1, [r5, #0x24]
	ldr r4, [r0, #0x24]
	movs r0, #4
	bl FUN_02019014
	str r0, [r4, #8]
	ldr r0, _02250AC4 @ =0x020F566C
	ldrb r0, [r0]
	str r0, [r4, #0x24]
	ldr r1, [r5, #0x24]
	add r0, sp, #0xc
	bl FUN_02023630
	add r3, sp, #0xc
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	adds r2, #0xc
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [r5, #0x24]
	add r0, sp, #0
	bl FUN_02023640
	add r3, sp, #0
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	adds r2, #0x18
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	str r0, [r4]
	adds r0, r4, #0
	bl ov02_02250BB0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_02250AC4: .4byte 0x020F566C
	thumb_func_end ov02_02250A60

	thumb_func_start ov02_02250AC8
ov02_02250AC8: @ 0x02250AC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #8]
	bl FUN_02019030
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FUN_0201AB0C
	ldr r0, [r4, #4]
	movs r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02250AC8

	thumb_func_start ov02_02250AE8
ov02_02250AE8: @ 0x02250AE8
	push {r3, lr}
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl FUN_021E687C
	movs r1, #1
	strb r1, [r0, #0x10]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_02250AE8

	thumb_func_start ov02_02250AFC
ov02_02250AFC: @ 0x02250AFC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl FUN_021E687C
	ldrb r1, [r0, #0x10]
	cmp r1, #3
	beq _02250B22
	bl GF_AssertFail
	ldr r0, [r5, #0x10]
	ldr r1, _02250B2C @ =ov02_02250B58
	movs r2, #0
	bl FUN_02050530
	pop {r3, r4, r5, pc}
_02250B22:
	strb r4, [r0, #0x11]
	adds r0, r5, #0
	bl ov02_02250B44
	pop {r3, r4, r5, pc}
	.align 2, 0
_02250B2C: .4byte ov02_02250B58
	thumb_func_end ov02_02250AFC

	thumb_func_start ov02_02250B30
ov02_02250B30: @ 0x02250B30
	ldr r3, _02250B3C @ =FUN_02050530
	ldr r0, [r0, #0x10]
	ldr r1, _02250B40 @ =ov02_02251320
	movs r2, #0
	bx r3
	nop
_02250B3C: .4byte FUN_02050530
_02250B40: .4byte ov02_02251320
	thumb_func_end ov02_02250B30

	thumb_func_start ov02_02250B44
ov02_02250B44: @ 0x02250B44
	push {r3, lr}
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl FUN_021E687C
	movs r1, #4
	strb r1, [r0, #0x10]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov02_02250B44

	thumb_func_start ov02_02250B58
ov02_02250B58: @ 0x02250B58
	push {r4, lr}
	bl FUN_0205064C
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl FUN_021E687C
	ldrb r0, [r0, #0x10]
	cmp r0, #3
	bne _02250B7A
	adds r0, r4, #0
	bl ov02_02250B44
	movs r0, #1
	pop {r4, pc}
_02250B7A:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02250B58

	thumb_func_start ov02_02250B80
ov02_02250B80: @ 0x02250B80
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #4
	movs r1, #0xd8
	bl FUN_0201AACC
	adds r4, r0, #0
	movs r1, #0
	adds r0, #0xd4
	str r1, [r0]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r4, #0
	bl ov02_022511AC
	ldr r0, [r5, #0x10]
	ldr r1, _02250BAC @ =ov02_022512AC
	adds r2, r4, #0
	bl FUN_02050530
	pop {r3, r4, r5, pc}
	nop
_02250BAC: .4byte ov02_022512AC
	thumb_func_end ov02_02250B80

	thumb_func_start ov02_02250BB0
ov02_02250BB0: @ 0x02250BB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, _02250BC0 @ =0x02253B4C
	bl FUN_021E67BC
	str r0, [r4, #4]
	pop {r4, pc}
	.align 2, 0
_02250BC0: .4byte 0x02253B4C
	thumb_func_end ov02_02250BB0

	thumb_func_start ov02_02250BC4
ov02_02250BC4: @ 0x02250BC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r0, r1, #0
	ldr r0, [r0, #4]
	adds r5, r2, #0
	ldr r0, [r0, #0x24]
	str r1, [sp, #8]
	ldr r0, [r0, #0x24]
	movs r1, #4
	strh r0, [r5, #0x12]
	adds r0, r5, #0
	movs r2, #0x20
	bl FUN_0201AC14
	adds r0, r5, #0
	adds r0, #0x14
	movs r1, #0xae
	movs r2, #0x12
	movs r3, #4
	bl FUN_021FBCD8
	adds r0, r5, #0
	adds r0, #0x24
	movs r1, #0xae
	movs r2, #0x19
	movs r3, #4
	bl FUN_021FBCD8
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #0xae
	movs r2, #0x20
	movs r3, #4
	bl FUN_021FBCD8
	movs r0, #4
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x44
	adds r1, #0x14
	movs r2, #0xae
	movs r3, #0x13
	str r5, [sp, #4]
	bl FUN_021FBE44
	movs r0, #4
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x58
	adds r1, #0x14
	movs r2, #0xae
	movs r3, #0x14
	str r5, [sp, #4]
	bl FUN_021FBE44
	movs r0, #4
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x6c
	adds r1, #0x14
	movs r2, #0xae
	movs r3, #0x15
	str r5, [sp, #4]
	bl FUN_021FBE44
	movs r0, #4
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x80
	adds r1, #0x24
	movs r2, #0xae
	movs r3, #0x1a
	str r5, [sp, #4]
	bl FUN_021FBE44
	movs r0, #4
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x94
	adds r1, #0x24
	movs r2, #0xae
	movs r3, #0x1b
	str r5, [sp, #4]
	bl FUN_021FBE44
	movs r0, #4
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xa8
	adds r1, #0x34
	movs r2, #0xae
	movs r3, #0x21
	str r5, [sp, #4]
	bl FUN_021FBE44
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xbc
	adds r1, #0x14
	bl FUN_021FBF2C
	movs r0, #0x4d
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r0, r5, r0
	adds r1, #0x24
	bl FUN_021FBF2C
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xbc
	adds r1, #0x44
	bl FUN_021FBF50
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xbc
	adds r1, #0x58
	bl FUN_021FBF50
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xbc
	adds r1, #0x6c
	bl FUN_021FBF50
	movs r0, #0x4d
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r0, r5, r0
	adds r1, #0x80
	bl FUN_021FBF50
	movs r0, #0x4d
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r0, r5, r0
	adds r1, #0x94
	bl FUN_021FBF50
	adds r0, r5, #0
	adds r0, #0xbc
	movs r1, #0
	bl FUN_021FC004
	movs r0, #0x4d
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_021FC004
	movs r0, #0x6b
	lsls r0, r0, #2
	adds r4, r5, r0
	adds r0, r5, #0
	str r0, [sp, #0xc]
	adds r0, #0x34
	str r0, [sp, #0xc]
	adds r0, r5, #0
	str r0, [sp, #0x10]
	adds r0, #0xa8
	movs r6, #0
	str r0, [sp, #0x10]
_02250D16:
	movs r0, #0x78
	adds r7, r6, #0
	muls r7, r0, r7
	ldr r1, [sp, #0xc]
	adds r0, r4, r7
	bl FUN_021FBF2C
	ldr r1, [sp, #0x10]
	adds r0, r4, r7
	bl FUN_021FBF50
	adds r0, r4, r7
	movs r1, #0
	bl FUN_021FC004
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #4
	blo _02250D16
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #3
	movs r2, #0
	bl ov02_022510D4
	adds r0, r5, #0
	adds r0, #0x80
	movs r1, #2
	movs r2, #0
	bl ov02_022510D4
	adds r0, r5, #0
	adds r0, #0xa8
	movs r1, #1
	movs r2, #0
	bl ov02_022510D4
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x40]
	bl FUN_0205C6DC
	add r1, sp, #0x14
	bl FUN_0205F944
	adds r0, r5, #0
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r0, #0xbc
	bl FUN_021FC00C
	movs r0, #0x4d
	lsls r0, r0, #2
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r0, r5, r0
	bl FUN_021FC00C
	ldrh r0, [r5, #0x12]
	cmp r0, #8
	bne _02250E04
	movs r2, #2
	ldr r1, [sp, #0x14]
	lsls r2, r2, #0x12
	adds r1, r1, r2
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r3, [sp, #0x18]
	lsrs r2, r2, #2
	adds r2, r3, r2
	movs r3, #0x2d
	ldr r4, [sp, #0x1c]
	lsls r3, r3, #0xe
	adds r0, r5, r0
	subs r3, r4, r3
	bl FUN_021FC00C
	movs r2, #2
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r1, [sp, #0x14]
	lsls r2, r2, #0x12
	subs r1, r1, r2
	ldr r3, [sp, #0x18]
	lsrs r2, r2, #2
	adds r2, r3, r2
	movs r3, #0x2d
	ldr r4, [sp, #0x1c]
	lsls r3, r3, #0xe
	adds r0, r5, r0
	subs r3, r4, r3
	bl FUN_021FC00C
	movs r1, #0
	movs r0, #0xa7
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_021FC00C
	movs r1, #0
	movs r0, #0xc5
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_021FC00C
	ldr r0, _02250EA4 @ =0x00000131
	ldr r1, _02250EA8 @ =0x000004AC
	ldr r2, _02250EAC @ =0x02253C20
	str r0, [r5, r1]
	adds r0, r1, #4
	str r2, [r5, r0]
	ldr r0, _02250EB0 @ =0x02253B94
	b _02250E98
_02250E04:
	movs r1, #0x32
	ldr r2, [sp, #0x14]
	lsls r1, r1, #0xe
	adds r1, r2, r1
	movs r2, #0x49
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r3, [sp, #0x18]
	lsls r2, r2, #0xc
	subs r2, r3, r2
	movs r3, #9
	ldr r4, [sp, #0x1c]
	lsls r3, r3, #0x10
	adds r0, r5, r0
	adds r3, r4, r3
	bl FUN_021FC00C
	movs r1, #0xc6
	movs r0, #0x89
	lsls r0, r0, #2
	ldr r2, [sp, #0x14]
	lsls r1, r1, #0xc
	subs r1, r2, r1
	movs r2, #0x49
	ldr r3, [sp, #0x18]
	lsls r2, r2, #0xc
	subs r2, r3, r2
	movs r3, #9
	ldr r4, [sp, #0x1c]
	lsls r3, r3, #0x10
	adds r0, r5, r0
	adds r3, r4, r3
	bl FUN_021FC00C
	movs r1, #0x32
	movs r0, #0xa7
	lsls r0, r0, #2
	ldr r2, [sp, #0x14]
	lsls r1, r1, #0xe
	adds r1, r2, r1
	movs r2, #0x49
	ldr r3, [sp, #0x18]
	lsls r2, r2, #0xc
	subs r2, r3, r2
	ldr r4, [sp, #0x1c]
	ldr r3, _02250EB4 @ =0x0010E000
	adds r0, r5, r0
	subs r3, r4, r3
	bl FUN_021FC00C
	movs r1, #0xc6
	movs r0, #0xc5
	lsls r0, r0, #2
	ldr r2, [sp, #0x14]
	lsls r1, r1, #0xc
	subs r1, r2, r1
	movs r2, #0x49
	ldr r3, [sp, #0x18]
	lsls r2, r2, #0xc
	subs r2, r3, r2
	ldr r4, [sp, #0x1c]
	ldr r3, _02250EB4 @ =0x0010E000
	adds r0, r5, r0
	subs r3, r4, r3
	bl FUN_021FC00C
	movs r0, #0x13
	ldr r1, _02250EA8 @ =0x000004AC
	lsls r0, r0, #4
	str r0, [r5, r1]
	ldr r2, _02250EB8 @ =0x02253BD0
	adds r0, r1, #4
	str r2, [r5, r0]
	ldr r0, _02250EBC @ =0x02253B64
_02250E98:
	adds r1, #8
	str r0, [r5, r1]
	movs r0, #0
	strb r0, [r5, #0x10]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02250EA4: .4byte 0x00000131
_02250EA8: .4byte 0x000004AC
_02250EAC: .4byte 0x02253C20
_02250EB0: .4byte 0x02253B94
_02250EB4: .4byte 0x0010E000
_02250EB8: .4byte 0x02253BD0
_02250EBC: .4byte 0x02253B64
	thumb_func_end ov02_02250BC4

	thumb_func_start ov02_02250EC0
ov02_02250EC0: @ 0x02250EC0
	push {r4, lr}
	adds r4, r2, #0
	adds r0, r4, #0
	adds r0, #0x6c
	adds r1, r4, #0
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r0, #0x58
	adds r1, r4, #0
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r0, #0x44
	adds r1, r4, #0
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r0, #0x94
	adds r1, r4, #0
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r0, #0x80
	adds r1, r4, #0
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r0, #0xa8
	adds r1, r4, #0
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r0, #0x14
	bl FUN_021FBDA8
	adds r0, r4, #0
	adds r0, #0x24
	bl FUN_021FBDA8
	adds r4, #0x34
	adds r0, r4, #0
	bl FUN_021FBDA8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02250EC0

	thumb_func_start ov02_02250F1C
ov02_02250F1C: @ 0x02250F1C
	push {r4, lr}
	adds r4, r2, #0
	ldrb r0, [r4, #0x10]
	cmp r0, #5
	bhi _02250FDC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02250F32: @ jump table
	.2byte _02250FDC - _02250F32 - 2 @ case 0
	.2byte _02250F3E - _02250F32 - 2 @ case 1
	.2byte _02250F4E - _02250F32 - 2 @ case 2
	.2byte _02250F68 - _02250F32 - 2 @ case 3
	.2byte _02250F74 - _02250F32 - 2 @ case 4
	.2byte _02250FA4 - _02250F32 - 2 @ case 5
_02250F3E:
	adds r0, r4, #0
	adds r0, #0xbc
	movs r1, #1
	bl FUN_021FC004
	movs r0, #2
	strb r0, [r4, #0x10]
	pop {r4, pc}
_02250F4E:
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #3
	bl ov02_022510FC
	cmp r0, #0
	beq _02250FDC
	adds r0, r4, #0
	bl ov02_02251018
	movs r0, #3
	strb r0, [r4, #0x10]
	pop {r4, pc}
_02250F68:
	adds r4, #0x44
	adds r0, r4, #0
	movs r1, #3
	bl ov02_02251138
	pop {r4, pc}
_02250F74:
	adds r0, r4, #0
	adds r0, #0xbc
	movs r1, #0
	bl FUN_021FC004
	adds r0, r4, #0
	movs r1, #1
	bl ov02_02251164
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #2
	movs r2, #0
	bl ov02_022510D4
	adds r0, r4, #0
	adds r0, #0xa8
	movs r1, #1
	movs r2, #0
	bl ov02_022510D4
	movs r0, #5
	strb r0, [r4, #0x10]
	pop {r4, pc}
_02250FA4:
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #3
	bl ov02_02251138
	adds r0, r4, #0
	adds r0, #0xa8
	movs r1, #1
	bl ov02_022510FC
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #2
	bl ov02_022510FC
	cmp r0, #0
	beq _02250FDC
	adds r0, r4, #0
	movs r1, #0
	bl ov02_02251164
	adds r0, r4, #0
	adds r0, #0xbc
	movs r1, #1
	bl FUN_021FC004
	movs r0, #3
	strb r0, [r4, #0x10]
_02250FDC:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02250F1C

	thumb_func_start ov02_02250FE0
ov02_02250FE0: @ 0x02250FE0
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	adds r0, r4, #0
	adds r0, #0xbc
	bl FUN_021FBF68
	movs r0, #0x4d
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_021FBF68
	movs r0, #0x6b
	lsls r0, r0, #2
	movs r5, #0
	adds r4, r4, r0
	movs r6, #0x78
_02251000:
	adds r0, r5, #0
	muls r0, r6, r0
	adds r0, r4, r0
	bl FUN_021FBF68
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	blo _02251000
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov02_02250FE0

	thumb_func_start ov02_02251018
ov02_02251018: @ 0x02251018
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, #0xbc
	adds r1, #0x44
	bl FUN_021FBF5C
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xbc
	adds r1, #0x58
	bl FUN_021FBF5C
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xbc
	adds r1, #0x6c
	bl FUN_021FBF5C
	adds r0, r4, #0
	adds r0, #0x6c
	adds r1, r4, #0
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r0, #0x58
	adds r1, r4, #0
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r0, #0x44
	adds r1, r4, #0
	bl FUN_021FBE80
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x44
	adds r1, #0x14
	movs r2, #0xae
	movs r3, #0x16
	str r4, [sp, #4]
	bl FUN_021FBE44
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x58
	adds r1, #0x14
	movs r2, #0xae
	movs r3, #0x17
	str r4, [sp, #4]
	bl FUN_021FBE44
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x6c
	adds r1, #0x14
	movs r2, #0xae
	movs r3, #0x18
	str r4, [sp, #4]
	bl FUN_021FBE44
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xbc
	adds r1, #0x44
	bl FUN_021FBF50
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xbc
	adds r1, #0x58
	bl FUN_021FBF50
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xbc
	adds r1, #0x6c
	bl FUN_021FBF50
	adds r4, #0x44
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0
	bl ov02_022510D4
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov02_02251018

	thumb_func_start ov02_022510D4
ov02_022510D4: @ 0x022510D4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	adds r7, r2, #0
	movs r4, #0
	cmp r5, #0
	bls _022510F8
_022510E2:
	movs r0, #0x14
	muls r0, r4, r0
	adds r0, r6, r0
	adds r1, r7, #0
	bl FUN_021FBF20
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _022510E2
_022510F8:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_022510D4

	thumb_func_start ov02_022510FC
ov02_022510FC: @ 0x022510FC
	push {r3, r4, r5, r6, r7, lr}
	movs r5, #0
	adds r6, r1, #0
	adds r7, r0, #0
	adds r4, r5, #0
	cmp r6, #0
	bls _0225112C
_0225110A:
	movs r0, #0x14
	muls r0, r4, r0
	movs r1, #1
	adds r0, r7, r0
	lsls r1, r1, #0xc
	bl FUN_021FBEE4
	cmp r0, #0
	beq _02251122
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_02251122:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _0225110A
_0225112C:
	cmp r5, r6
	bne _02251134
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02251134:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022510FC

	thumb_func_start ov02_02251138
ov02_02251138: @ 0x02251138
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _02251160 @ =0x00000000
	beq _0225115C
	movs r7, #0x14
_02251144:
	adds r0, r4, #0
	muls r0, r7, r0
	movs r1, #1
	adds r0, r5, r0
	lsls r1, r1, #0xc
	bl FUN_021FBEAC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _02251144
_0225115C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02251160: .4byte 0x00000000
	thumb_func_end ov02_02251138

	thumb_func_start ov02_02251164
ov02_02251164: @ 0x02251164
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x12]
	adds r7, r1, #0
	cmp r0, #8
	bne _02251174
	movs r5, #2
	b _02251176
_02251174:
	movs r5, #4
_02251176:
	movs r0, #0x4d
	lsls r0, r0, #2
	adds r0, r6, r0
	adds r1, r7, #0
	bl FUN_021FC004
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	bne _022511AA
	movs r4, #0
	cmp r5, #0
	bls _022511AA
	movs r0, #0x6b
	lsls r0, r0, #2
	adds r6, r6, r0
_02251194:
	movs r0, #0x78
	muls r0, r4, r0
	adds r0, r6, r0
	adds r1, r7, #0
	bl FUN_021FC004
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _02251194
_022511AA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02251164

	thumb_func_start ov02_022511AC
ov02_022511AC: @ 0x022511AC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r4, r2, #0
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x20
	bl FUN_0201AC14
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #0xae
	movs r2, #0x1c
	adds r3, r5, #0
	bl FUN_021FBCD8
	adds r0, r4, #0
	adds r1, r4, #0
	str r5, [sp]
	adds r0, #0x20
	adds r1, #0x10
	movs r2, #0xae
	movs r3, #0x1d
	str r4, [sp, #4]
	bl FUN_021FBE44
	adds r0, r4, #0
	adds r1, r4, #0
	str r5, [sp]
	adds r0, #0x34
	adds r1, #0x10
	movs r2, #0xae
	movs r3, #0x1e
	str r4, [sp, #4]
	bl FUN_021FBE44
	adds r0, r4, #0
	adds r1, r4, #0
	str r5, [sp]
	adds r0, #0x48
	adds r1, #0x10
	movs r2, #0xae
	movs r3, #0x1f
	str r4, [sp, #4]
	bl FUN_021FBE44
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x5c
	adds r1, #0x10
	bl FUN_021FBF2C
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x5c
	adds r1, #0x20
	bl FUN_021FBF50
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x5c
	adds r1, #0x34
	bl FUN_021FBF50
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x5c
	adds r1, #0x48
	bl FUN_021FBF50
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #3
	movs r2, #0
	bl ov02_022510D4
	ldr r0, [r6, #0x40]
	bl FUN_0205C6DC
	add r1, sp, #8
	bl FUN_0205F944
	movs r0, #0x19
	ldr r1, [sp, #0xc]
	lsls r0, r0, #0xe
	adds r2, r1, r0
	ldr r1, [sp, #0x10]
	ldr r0, _0225127C @ =0x0015E000
	str r2, [sp, #0xc]
	subs r3, r1, r0
	adds r0, r4, #0
	ldr r1, [sp, #8]
	adds r0, #0x5c
	str r3, [sp, #0x10]
	bl FUN_021FC00C
	adds r4, #0x5c
	adds r0, r4, #0
	movs r1, #1
	bl FUN_021FC004
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0225127C: .4byte 0x0015E000
	thumb_func_end ov02_022511AC

	thumb_func_start ov02_02251280
ov02_02251280: @ 0x02251280
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, #0x48
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r0, #0x34
	adds r1, r4, #0
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r4, #0
	bl FUN_021FBE80
	adds r4, #0x10
	adds r0, r4, #0
	bl FUN_021FBDA8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02251280

	thumb_func_start ov02_022512AC
ov02_022512AC: @ 0x022512AC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02050650
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_02050654
	adds r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _022512CA
	cmp r0, #1
	beq _02251306
	b _02251316
_022512CA:
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xd4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	cmp r0, #2
	bne _022512E8
	ldr r0, _0225131C @ =0x0000090D
	bl FUN_0200604C
_022512E8:
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #3
	bl ov02_022510FC
	cmp r0, #0
	beq _022512FC
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
_022512FC:
	adds r4, #0x5c
	adds r0, r4, #0
	bl FUN_021FBF68
	b _02251316
_02251306:
	adds r0, r4, #0
	bl ov02_02251280
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r3, r4, r5, pc}
_02251316:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0225131C: .4byte 0x0000090D
	thumb_func_end ov02_022512AC

	thumb_func_start ov02_02251320
ov02_02251320: @ 0x02251320
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	bl FUN_0205064C
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_02050654
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl FUN_021E687C
	adds r5, r0, #0
	ldr r0, [sp, #4]
	ldr r0, [r0]
	cmp r0, #0
	beq _02251352
	cmp r0, #1
	beq _022513AE
	cmp r0, #2
	beq _02251412
	b _02251418
_02251352:
	adds r0, r4, #0
	ldr r1, _02251420 @ =0x000004AC
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r1, [r5, r1]
	bl FUN_022040D0
	adds r7, r0, #0
	movs r6, #0
_02251364:
	ldr r0, [r4, #0x54]
	adds r1, r6, #0
	str r0, [sp]
	ldr r0, _02251420 @ =0x000004AC
	movs r2, #1
	ldr r0, [r5, r0]
	adds r3, r7, #0
	bl FUN_021E8970
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	blo _02251364
	movs r6, #0
_02251382:
	ldr r0, _02251420 @ =0x000004AC
	ldr r2, [r4, #0x54]
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_021E8B04
	adds r7, r0, #0
	movs r1, #1
	bl FUN_021E8B84
	adds r0, r7, #0
	bl FUN_021E8B6C
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	blo _02251382
	ldr r0, [sp, #4]
	movs r1, #1
	str r1, [r0]
	b _02251418
_022513AE:
	adds r0, r4, #0
	ldr r1, _02251420 @ =0x000004AC
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r1, [r5, r1]
	bl FUN_022040D0
	adds r7, r0, #0
	ldr r0, _02251420 @ =0x000004AC
	ldr r2, [r4, #0x54]
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_021E8B04
	bl FUN_021E8B90
	cmp r0, #0
	beq _02251418
	movs r6, #0
_022513D4:
	ldr r2, _02251420 @ =0x000004AC
	ldr r0, [r4, #0x54]
	ldr r2, [r5, r2]
	adds r1, r7, #0
	adds r3, r6, #0
	bl FUN_021E8A8C
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	blo _022513D4
	movs r6, #0
_022513EE:
	ldr r0, [r4, #0x54]
	adds r1, r6, #2
	str r0, [sp]
	ldr r0, _02251420 @ =0x000004AC
	movs r2, #1
	ldr r0, [r5, r0]
	adds r3, r7, #0
	bl FUN_021E8970
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	blo _022513EE
	ldr r0, [sp, #4]
	movs r1, #2
	str r1, [r0]
	b _02251418
_02251412:
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02251418:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02251420: .4byte 0x000004AC
	thumb_func_end ov02_02251320

	thumb_func_start ov02_02251424
ov02_02251424: @ 0x02251424
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r7, r1, #0
	ldr r6, [r0, #0x24]
	ldr r0, [r6, #4]
	bl FUN_021E687C
	adds r4, r0, #0
	cmp r7, #3
	blo _02251440
	bl GF_AssertFail
_02251440:
	adds r0, r6, #0
	ldr r1, [r5, #0x24]
	adds r0, #0xc
	bl FUN_0202365C
	adds r6, #0x18
	ldr r1, [r5, #0x24]
	adds r0, r6, #0
	bl FUN_0202366C
	movs r0, #0x14
	adds r6, r7, #0
	muls r6, r0, r6
	movs r0, #0x4b
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r5, #0x24]
	ldr r0, [r0, r6]
	bl FUN_020235D4
	movs r0, #0x4b
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r5, #0x24]
	adds r0, r0, r6
	adds r0, r0, #4
	bl FUN_02023558
	movs r0, #0x4b
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r5, #0x24]
	adds r0, r0, r6
	ldrh r0, [r0, #0xe]
	bl FUN_02023494
	ldr r0, _022514C0 @ =0x000004B4
	ldr r1, [r4, r0]
	movs r0, #0xc
	muls r0, r7, r0
	adds r0, r1, r0
	ldr r1, [r5, #0x24]
	bl FUN_02023514
	movs r0, #0x96
	ldr r1, _022514C4 @ =0x006A4000
	ldr r2, [r5, #0x24]
	lsls r0, r0, #0xc
	bl FUN_02023240
	ldr r1, [r5, #0x24]
	add r0, sp, #8
	bl FUN_02023630
	ldr r0, [r5, #0x24]
	bl FUN_02023658
	ldr r1, [r5, #0x24]
	add r0, sp, #0
	bl FUN_02023618
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_022514C0: .4byte 0x000004B4
_022514C4: .4byte 0x006A4000
	thumb_func_end ov02_02251424

	thumb_func_start ov02_022514C8
ov02_022514C8: @ 0x022514C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r0, [r0, #4]
	adds r4, r1, #0
	ldr r0, [r0, #0x24]
	str r0, [sp]
	ldr r0, [r0, #4]
	bl FUN_021E687C
	adds r6, r0, #0
	cmp r4, #0
	bne _022514E4
	movs r1, #0
	b _022514E6
_022514E4:
	movs r1, #3
_022514E6:
	movs r0, #0x4b
	lsls r0, r0, #4
	movs r5, #0x14
	adds r3, r1, #0
	ldr r0, [r6, r0]
	muls r3, r5, r3
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	add r2, sp, #4
	add r7, sp, #8
	strh r0, [r2]
	movs r0, #0x4b
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	adds r0, r0, r3
	ldrh r0, [r0, #0xe]
	strh r0, [r2, #2]
	movs r0, #0x4b
	lsls r0, r0, #4
	adds r0, r0, #4
	movs r2, #0xc
	ldr r0, [r6, r0]
	muls r2, r1, r2
	adds r2, r0, r2
	ldm r2!, {r0, r1}
	stm r7!, {r0, r1}
	ldr r0, [r2]
	str r0, [r7]
	movs r0, #0x4b
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	ldr r0, [r0, r3]
	str r0, [sp, #0x14]
	ldr r0, [sp]
	ldr r0, [r0, #0x24]
	cmp r0, #7
	bne _02251538
	cmp r4, #0
	bne _02251542
	movs r5, #0xc8
	b _02251542
_02251538:
	cmp r4, #0
	bne _02251540
	movs r5, #0xa0
	b _02251542
_02251540:
	movs r5, #0xc8
_02251542:
	ldr r0, [sp]
	add r1, sp, #4
	ldr r0, [r0, #8]
	adds r2, r5, #0
	bl FUN_02019040
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_022514C8

	thumb_func_start ov02_02251554
ov02_02251554: @ 0x02251554
	ldr r3, _02251560 @ =FUN_02050530
	ldr r0, [r0, #0x10]
	ldr r1, _02251564 @ =ov02_02251568
	movs r2, #0
	bx r3
	nop
_02251560: .4byte FUN_02050530
_02251564: .4byte ov02_02251568
	thumb_func_end ov02_02251554

	thumb_func_start ov02_02251568
ov02_02251568: @ 0x02251568
	push {r3, r4, lr}
	sub sp, #0x14
	bl FUN_0205064C
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #8]
	bl FUN_020190E8
	cmp r0, #0
	beq _0225159C
	ldr r1, [r4, #0x24]
	add r0, sp, #8
	bl FUN_02023630
	ldr r0, [r4, #0x24]
	bl FUN_02023658
	ldr r1, [r4, #0x24]
	add r0, sp, #0
	bl FUN_02023618
	add sp, #0x14
	movs r0, #1
	pop {r3, r4, pc}
_0225159C:
	movs r0, #0
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov02_02251568

	thumb_func_start ov02_022515A4
ov02_022515A4: @ 0x022515A4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #4
	movs r1, #0xe4
	bl FUN_0201AACC
	adds r2, r0, #0
	ldr r0, _022515C8 @ =0x020F566C
	ldrb r1, [r0]
	adds r0, r2, #0
	adds r0, #0xe0
	strh r1, [r0]
	ldr r0, [r4, #0x10]
	ldr r1, _022515CC @ =ov02_022515D0
	bl FUN_02050530
	pop {r4, pc}
	nop
_022515C8: .4byte 0x020F566C
_022515CC: .4byte ov02_022515D0
	thumb_func_end ov02_022515A4

	thumb_func_start ov02_022515D0
ov02_022515D0: @ 0x022515D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	bl FUN_0205064C
	str r0, [sp, #8]
	adds r0, r5, #0
	bl FUN_02050650
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_02050654
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0xe0
	ldrh r0, [r0]
	cmp r0, #8
	bne _02251604
	movs r0, #0xf9
	str r0, [sp, #0x10]
	movs r0, #0x12
	movs r1, #5
	str r0, [sp, #0xc]
	ldr r7, _022518D8 @ =0x0000090E
	b _02251610
_02251604:
	movs r0, #0xfa
	str r0, [sp, #0x10]
	movs r0, #0
	ldr r7, _022518DC @ =0x0000090A
	movs r1, #5
	str r0, [sp, #0xc]
_02251610:
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x3c]
	bl FUN_0205EE60
	adds r6, r0, #0
	bne _02251620
	bl GF_AssertFail
_02251620:
	ldr r0, [r5]
	cmp r0, #7
	bls _02251628
	b _022518D0
_02251628:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02251634: @ jump table
	.2byte _02251644 - _02251634 - 2 @ case 0
	.2byte _02251740 - _02251634 - 2 @ case 1
	.2byte _0225178A - _02251634 - 2 @ case 2
	.2byte _022517FE - _02251634 - 2 @ case 3
	.2byte _0225181E - _02251634 - 2 @ case 4
	.2byte _0225184E - _02251634 - 2 @ case 5
	.2byte _02251884 - _02251634 - 2 @ case 6
	.2byte _02251898 - _02251634 - 2 @ case 7
_02251644:
	adds r0, r4, #0
	adds r0, #0xc
	movs r1, #4
	movs r2, #0x20
	bl FUN_0201AC14
	adds r0, r4, #0
	adds r0, #0x1c
	movs r1, #0xae
	movs r2, #0x22
	movs r3, #4
	bl FUN_021FBCD8
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0xc
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x2c
	adds r1, #0x1c
	movs r2, #0xae
	movs r3, #0x23
	bl FUN_021FBE44
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0xc
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x40
	adds r1, #0x1c
	movs r2, #0xae
	movs r3, #0x24
	bl FUN_021FBE44
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0xc
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x54
	adds r1, #0x1c
	movs r2, #0xae
	movs r3, #0x25
	bl FUN_021FBE44
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x68
	adds r1, #0x1c
	bl FUN_021FBF2C
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x68
	adds r1, #0x2c
	bl FUN_021FBF50
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x68
	adds r1, #0x40
	bl FUN_021FBF50
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x68
	adds r1, #0x54
	bl FUN_021FBF50
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #0
	bl FUN_021FC004
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #3
	movs r2, #0
	bl ov02_022510D4
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x40]
	bl FUN_0205C6DC
	add r1, sp, #0x2c
	bl FUN_0205F944
	adds r0, r4, #0
	adds r0, #0xe0
	ldrh r0, [r0]
	cmp r0, #7
	bne _02251720
	movs r0, #0xa
	ldr r1, [sp, #0x30]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0x30]
	movs r0, #1
	ldr r1, [sp, #0x34]
	lsls r0, r0, #0x10
	subs r0, r1, r0
	str r0, [sp, #0x34]
	b _0225172A
_02251720:
	movs r0, #0x46
	ldr r1, [sp, #0x34]
	lsls r0, r0, #0xe
	subs r0, r1, r0
	str r0, [sp, #0x34]
_0225172A:
	adds r4, #0x68
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x34]
	adds r0, r4, #0
	bl FUN_021FC00C
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022518D0
_02251740:
	adds r0, r6, #0
	add r1, sp, #0x20
	bl FUN_0205F944
	ldr r0, [sp, #0x24]
	str r0, [r4, #4]
	adds r0, r4, #0
	adds r0, #0xe0
	ldrh r0, [r0]
	cmp r0, #7
	bne _0225175C
	movs r0, #0x1e
	lsls r0, r0, #0xe
	b _02251760
_0225175C:
	movs r0, #0xa
	lsls r0, r0, #0x10
_02251760:
	str r0, [r4]
	ldr r1, [sp, #0x24]
	ldr r0, [r4]
	adds r0, r1, r0
	str r0, [sp, #0x24]
	adds r0, r6, #0
	add r1, sp, #0x20
	bl FUN_0205F954
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0205F690
	movs r0, #0
	strh r0, [r4, #8]
	adds r4, #0xe2
	strh r0, [r4]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022518D0
_0225178A:
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	ldrh r1, [r4, #8]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	blt _022517C0
	adds r0, r4, #0
	adds r0, #0xe2
	ldrh r0, [r0]
	cmp r0, #0
	bne _022517B2
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x18
	adds r0, #0xe2
	strh r1, [r0]
_022517B2:
	adds r0, r4, #0
	adds r0, #0xe2
	ldrh r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xe2
	strh r1, [r0]
_022517C0:
	adds r0, r6, #0
	add r1, sp, #0x14
	movs r7, #0
	bl FUN_0205F944
	movs r0, #1
	ldr r1, [r4]
	lsls r0, r0, #0xc
	subs r0, r1, r0
	str r0, [r4]
	cmp r0, #0
	bgt _022517DE
	adds r0, r7, #0
	str r0, [r4]
	movs r7, #1
_022517DE:
	ldr r1, [r4, #4]
	ldr r0, [r4]
	adds r0, r1, r0
	str r0, [sp, #0x18]
	adds r0, r6, #0
	add r1, sp, #0x14
	bl FUN_0205F954
	cmp r7, #0
	beq _022518D0
	movs r0, #0
	strh r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022518D0
_022517FE:
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	cmp r0, #0x3c
	blo _022518D0
	adds r0, r6, #0
	movs r1, #1
	bl FUN_0205F328
	movs r0, #0
	strh r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022518D0
_0225181E:
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	cmp r0, #0x32
	blo _022518D0
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #1
	bl FUN_021FC004
	ldr r0, [sp, #0x10]
	movs r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02006218
	movs r0, #0
	strh r0, [r4, #0xa]
	strh r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022518D0
_0225184E:
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #3
	bl ov02_022510FC
	ldrh r1, [r4, #0xa]
	adds r1, r1, #1
	strh r1, [r4, #0xa]
	cmp r0, #0
	beq _0225187A
	ldrh r0, [r4, #0xa]
	cmp r0, #0x41
	blo _0225187A
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0205F328
	movs r0, #0
	strh r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
_0225187A:
	adds r4, #0x68
	adds r0, r4, #0
	bl FUN_021FBF68
	b _022518D0
_02251884:
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	cmp r0, #0x1e
	blo _022518D0
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022518D0
_02251898:
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x54
	adds r1, #0xc
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x40
	adds r1, #0xc
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x2c
	adds r1, #0xc
	bl FUN_021FBE80
	adds r0, r4, #0
	adds r0, #0x1c
	bl FUN_021FBDA8
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x38
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022518D0:
	movs r0, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022518D8: .4byte 0x0000090E
_022518DC: .4byte 0x0000090A
	thumb_func_end ov02_022515D0

	thumb_func_start ov02_022518E0
ov02_022518E0: @ 0x022518E0
	push {r3, lr}
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x24]
	ldr r1, [r1, #0x24]
	cmp r1, #8
	bne _022518F2
	bl ov02_022518F8
	pop {r3, pc}
_022518F2:
	bl ov02_022519B0
	pop {r3, pc}
	thumb_func_end ov02_022518E0

	thumb_func_start ov02_022518F8
ov02_022518F8: @ 0x022518F8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	ldr r0, [r6, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl FUN_021E687C
	movs r4, #0xe3
	adds r5, r0, #0
	lsls r4, r4, #2
	adds r0, r5, r4
	movs r1, #0xae
	movs r2, #0x26
	movs r3, #4
	bl FUN_021FBCD8
	movs r0, #4
	str r0, [sp]
	adds r0, r5, r4
	adds r0, #0x10
	adds r1, r5, r4
	movs r2, #0xae
	movs r3, #0x27
	str r5, [sp, #4]
	bl FUN_021FBE44
	movs r0, #4
	str r0, [sp]
	adds r0, r5, r4
	adds r0, #0x24
	adds r1, r5, r4
	movs r2, #0xae
	movs r3, #0x28
	str r5, [sp, #4]
	bl FUN_021FBE44
	adds r0, r5, r4
	adds r0, #0x38
	adds r1, r5, r4
	bl FUN_021FBF2C
	adds r0, r5, r4
	adds r1, r5, r4
	adds r0, #0x38
	adds r1, #0x10
	bl FUN_021FBF50
	adds r0, r5, r4
	adds r1, r5, r4
	adds r0, #0x38
	adds r1, #0x24
	bl FUN_021FBF50
	adds r0, r5, r4
	adds r0, #0x38
	movs r1, #1
	bl FUN_021FC004
	adds r0, r5, r4
	adds r0, #0x10
	movs r1, #2
	movs r2, #0
	bl ov02_022510D4
	ldr r0, [r6, #0x40]
	bl FUN_0205C6DC
	add r1, sp, #8
	bl FUN_0205F944
	adds r0, r5, r4
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r0, #0x38
	bl FUN_021FC00C
	ldr r0, _022519A8 @ =ov02_02251BA8
	adds r1, r5, #0
	movs r2, #0
	bl FUN_0200E320
	ldr r1, _022519AC @ =0x000004A8
	str r0, [r5, r1]
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_022519A8: .4byte ov02_02251BA8
_022519AC: .4byte 0x000004A8
	thumb_func_end ov02_022518F8

	thumb_func_start ov02_022519B0
ov02_022519B0: @ 0x022519B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl FUN_021E687C
	ldr r1, _02251AFC @ =0x0000043C
	str r0, [sp, #0x10]
	adds r6, r0, r1
	ldr r0, [r4, #8]
	movs r4, #0
	str r0, [r6, #0x64]
	adds r0, r6, #0
	str r0, [sp, #0x14]
	adds r0, #0x18
	str r0, [sp, #0x14]
_022519D4:
	ldr r1, _02251B00 @ =0x02253B44
	lsls r7, r4, #2
	ldrb r1, [r1, r4]
	adds r5, r6, r7
	movs r0, #4
	str r0, [sp]
	movs r0, #0xae
	movs r2, #0
	adds r3, r5, #0
	bl FUN_020079D8
	ldr r1, _02251B04 @ =0x02253B3C
	ldr r3, [sp, #0x14]
	str r0, [r5, #0x30]
	movs r0, #4
	str r0, [sp]
	ldrb r1, [r1, r4]
	movs r0, #0xae
	movs r2, #0
	adds r3, r3, r7
	bl FUN_020079D8
	str r0, [r5, #0x48]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	blo _022519D4
	ldr r3, [r6]
	ldr r0, [r6, #0x64]
	adds r2, r3, #0
	ldr r3, [r3, #8]
	movs r1, #2
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r3, [r6, #0x18]
	ldr r0, [r6, #0x64]
	adds r2, r3, #0
	ldr r3, [r3, #8]
	movs r1, #3
	adds r2, #0xc
	bl FUN_0201C0A8
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r2, #0
	ldr r0, [r6, #0x64]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201CA4C
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r2, #0
	ldr r0, [r6, #0x64]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201CA4C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	ldr r2, [r6, #0x64]
	movs r0, #0xae
	movs r1, #0x35
	movs r3, #2
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	ldr r2, [r6, #0x64]
	movs r0, #0xae
	movs r1, #0x35
	movs r3, #3
	bl FUN_020078F0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #0xae
	movs r1, #0x36
	movs r2, #0
	movs r3, #0xc0
	bl FUN_02007938
	ldr r0, _02251B08 @ =ov02_02251BC4
	ldr r1, [sp, #0x10]
	movs r2, #0
	bl FUN_0200E320
	ldr r2, _02251B0C @ =0x000004A8
	ldr r1, [sp, #0x10]
	str r0, [r1, r2]
	ldr r0, [r6, #0x64]
	movs r1, #2
	bl FUN_0201EFBC
	ldr r0, [r6, #0x64]
	movs r1, #3
	bl FUN_0201EFBC
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	adds r0, r6, #0
	movs r1, #0
	adds r0, #0x63
	strb r1, [r0]
	str r1, [r6, #0x68]
	ldr r3, _02251B10 @ =0x0400000C
	movs r1, #3
	ldrh r0, [r3]
	bics r0, r1
	strh r0, [r3]
	ldrh r2, [r3, #2]
	movs r0, #1
	bics r2, r1
	orrs r0, r2
	strh r0, [r3, #2]
	subs r2, r3, #4
	ldrh r3, [r2]
	movs r0, #2
	bics r3, r1
	orrs r0, r3
	strh r0, [r2]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02251AFC: .4byte 0x0000043C
_02251B00: .4byte 0x02253B44
_02251B04: .4byte 0x02253B3C
_02251B08: .4byte ov02_02251BC4
_02251B0C: .4byte 0x000004A8
_02251B10: .4byte 0x0400000C
	thumb_func_end ov02_022519B0

	thumb_func_start ov02_02251B14
ov02_02251B14: @ 0x02251B14
	push {r3, r4, r5, lr}
	ldr r0, [r0, #4]
	ldr r5, [r0, #0x24]
	ldr r0, [r5, #4]
	bl FUN_021E687C
	adds r4, r0, #0
	ldr r0, _02251B48 @ =0x000004A8
	ldr r0, [r4, r0]
	bl FUN_0200E390
	ldr r0, _02251B48 @ =0x000004A8
	movs r1, #0
	str r1, [r4, r0]
	ldr r0, [r5, #0x24]
	cmp r0, #8
	bne _02251B3E
	adds r0, r4, #0
	bl ov02_02251B4C
	pop {r3, r4, r5, pc}
_02251B3E:
	adds r0, r4, #0
	bl ov02_02251B70
	pop {r3, r4, r5, pc}
	nop
_02251B48: .4byte 0x000004A8
	thumb_func_end ov02_02251B14

	thumb_func_start ov02_02251B4C
ov02_02251B4C: @ 0x02251B4C
	push {r3, r4, r5, lr}
	movs r4, #0xe3
	adds r5, r0, #0
	lsls r4, r4, #2
	adds r0, r5, r4
	adds r0, #0x24
	adds r1, r5, #0
	bl FUN_021FBE80
	adds r0, r5, r4
	adds r0, #0x10
	adds r1, r5, #0
	bl FUN_021FBE80
	adds r0, r5, r4
	bl FUN_021FBDA8
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02251B4C

	thumb_func_start ov02_02251B70
ov02_02251B70: @ 0x02251B70
	push {r4, r5, r6, lr}
	ldr r1, _02251BA4 @ =0x0000043C
	adds r6, r0, r1
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	movs r4, #0
_02251B88:
	lsls r0, r4, #2
	adds r5, r6, r0
	ldr r0, [r5, #0x30]
	bl FUN_0201AB0C
	ldr r0, [r5, #0x48]
	bl FUN_0201AB0C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	blo _02251B88
	pop {r4, r5, r6, pc}
	.align 2, 0
_02251BA4: .4byte 0x0000043C
	thumb_func_end ov02_02251B70

	thumb_func_start ov02_02251BA8
ov02_02251BA8: @ 0x02251BA8
	push {r3, r4, r5, lr}
	movs r4, #0xe3
	adds r5, r1, #0
	lsls r4, r4, #2
	adds r0, r5, r4
	adds r0, #0x10
	movs r1, #2
	bl ov02_02251138
	adds r0, r5, r4
	adds r0, #0x38
	bl FUN_021FBF68
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02251BA8

	thumb_func_start ov02_02251BC4
ov02_02251BC4: @ 0x02251BC4
	push {r3, r4, lr}
	sub sp, #0x1c
	ldr r0, _02251CEC @ =0x0000043C
	adds r4, r1, r0
	adds r0, r4, #0
	adds r0, #0x63
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x63
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x63
	ldrb r0, [r0]
	cmp r0, #6
	blo _02251C7E
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x63
	strb r1, [r0]
	ldr r0, [r4, #0x68]
	adds r0, r0, #1
	str r0, [r4, #0x68]
	cmp r0, #6
	blt _02251BF8
	str r1, [r4, #0x68]
_02251BF8:
	movs r1, #0x20
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0x68]
	movs r2, #0
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r3, r2, #0
	adds r0, #0xc
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r4, #0x64]
	movs r1, #2
	bl FUN_0201C568
	movs r1, #0x20
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0x68]
	movs r2, #0
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #0x18]
	adds r3, r2, #0
	adds r0, #0xc
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r4, #0x64]
	movs r1, #3
	bl FUN_0201C568
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r2, #0
	ldr r0, [r4, #0x64]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201CA4C
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r2, #0
	ldr r0, [r4, #0x64]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201CA4C
	ldr r0, [r4, #0x64]
	movs r1, #2
	bl FUN_0201EFBC
	ldr r0, [r4, #0x64]
	movs r1, #3
	bl FUN_0201EFBC
_02251C7E:
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	adds r3, r4, #0
	adds r3, #0x60
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x60
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	movs r2, #0
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x61
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x62
	ldrb r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x62
	strb r1, [r0]
	ldrb r3, [r3]
	ldr r0, [r4, #0x64]
	movs r1, #2
	bl FUN_0201F238
	adds r3, r4, #0
	adds r3, #0x62
	ldrb r3, [r3]
	ldr r0, [r4, #0x64]
	movs r1, #2
	movs r2, #3
	bl FUN_0201F238
	adds r3, r4, #0
	adds r3, #0x61
	ldrb r3, [r3]
	ldr r0, [r4, #0x64]
	movs r1, #3
	movs r2, #0
	bl FUN_0201F238
	ldr r0, [r4, #0x64]
	adds r4, #0x62
	movs r1, #3
	ldrb r3, [r4]
	adds r2, r1, #0
	bl FUN_0201F238
	add sp, #0x1c
	pop {r3, r4, pc}
	nop
_02251CEC: .4byte 0x0000043C
	thumb_func_end ov02_02251BC4

	thumb_func_start ov02_02251CF0
ov02_02251CF0: @ 0x02251CF0
	push {r3, r4, r5, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r0, #4
	movs r1, #0x28
	bl FUN_0201AACC
	ldr r1, [r5, #4]
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	ldr r0, _02251DAC @ =0x020F566C
	ldrb r0, [r0]
	strh r0, [r4, #0x1a]
	ldrh r0, [r4, #0x1a]
	cmp r0, #7
	bne _02251D1A
	bl GF_AssertFail
	add sp, #0x20
	pop {r3, r4, r5, pc}
_02251D1A:
	ldr r0, [r5, #0x24]
	bl FUN_02023614
	str r0, [r4]
	ldr r1, [r5, #0x24]
	add r0, sp, #0
	bl FUN_02023618
	add r0, sp, #0
	ldrh r1, [r0]
	strh r1, [r4, #4]
	ldrh r1, [r0, #2]
	strh r1, [r4, #6]
	ldrh r1, [r0, #4]
	strh r1, [r4, #8]
	ldrh r0, [r0, #6]
	strh r0, [r4, #0xa]
	ldr r1, [r5, #0x24]
	add r0, sp, #8
	bl FUN_02023630
	add r3, sp, #8
	ldm r3!, {r0, r1}
	add r2, sp, #0x14
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0x24]
	bl FUN_02023658
	adds r2, r4, #0
	adds r1, r0, #0
	add r0, sp, #0x14
	adds r2, #0xc
	blx FUN_020CCDAC
	ldr r0, [r5, #0x24]
	bl FUN_0202360C
	strh r0, [r4, #0x18]
	ldr r0, [r5, #0x24]
	bl FUN_02023654
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x24]
	bl FUN_02023650
	str r0, [r4, #0x20]
	ldr r0, _02251DB0 @ =0x0029AEC1
	ldr r1, [r5, #0x24]
	bl FUN_020235D4
	ldr r0, _02251DB4 @ =0x02253C74
	ldr r1, [r5, #0x24]
	bl FUN_02023558
	ldr r0, _02251DB8 @ =0x000005C1
	ldr r1, [r5, #0x24]
	bl FUN_02023494
	ldr r0, _02251DBC @ =0x02253BC4
	ldr r1, [r5, #0x24]
	bl FUN_02023514
	movs r0, #0x96
	ldr r1, _02251DC0 @ =0x006A4000
	ldr r2, [r5, #0x24]
	lsls r0, r0, #0xc
	bl FUN_02023240
	add sp, #0x20
	pop {r3, r4, r5, pc}
	nop
_02251DAC: .4byte 0x020F566C
_02251DB0: .4byte 0x0029AEC1
_02251DB4: .4byte 0x02253C74
_02251DB8: .4byte 0x000005C1
_02251DBC: .4byte 0x02253BC4
_02251DC0: .4byte 0x006A4000
	thumb_func_end ov02_02251CF0

	thumb_func_start ov02_02251DC4
ov02_02251DC4: @ 0x02251DC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	ldrh r0, [r0, #0x1a]
	cmp r0, #7
	bne _02251DD6
	bl GF_AssertFail
_02251DD6:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FUN_0201AB0C
	ldr r0, [r4, #4]
	movs r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov02_02251DC4

	thumb_func_start ov02_02251DE8
ov02_02251DE8: @ 0x02251DE8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	ldrh r0, [r4, #0x1a]
	cmp r0, #7
	bne _02251E00
	bl GF_AssertFail
	add sp, #0x14
	pop {r4, r5, pc}
_02251E00:
	ldr r1, [r5, #0x24]
	movs r0, #4
	bl FUN_02019014
	str r0, [r4, #0x24]
	adds r3, r4, #0
	ldrh r1, [r4, #4]
	add r0, sp, #0
	adds r3, #0xc
	strh r1, [r0]
	ldrh r1, [r4, #0x18]
	add r2, sp, #4
	strh r1, [r0, #2]
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0
	str r0, [r2]
	ldr r0, [r4]
	movs r2, #0x1e
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x24]
	bl FUN_02019040
	ldr r0, [r5, #0x10]
	ldr r1, _02251E40 @ =ov02_02251E44
	adds r2, r5, #0
	bl FUN_02050530
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_02251E40: .4byte ov02_02251E44
	thumb_func_end ov02_02251DE8

	thumb_func_start ov02_02251E44
ov02_02251E44: @ 0x02251E44
	push {r4, r5, r6, lr}
	bl FUN_02050650
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r5, [r0, #0x24]
	ldr r6, [r5, #0x24]
	adds r0, r6, #0
	bl FUN_020190E8
	cmp r0, #0
	beq _02251E70
	adds r0, r6, #0
	bl FUN_02019030
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	ldr r2, [r4, #0x24]
	bl FUN_02023240
	movs r0, #1
	pop {r4, r5, r6, pc}
_02251E70:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02251E44

	thumb_func_start ov02_02251E74
ov02_02251E74: @ 0x02251E74
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldrb r1, [r0]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	beq _02251E86
	ldrb r0, [r0, #2]
	cmp r0, #0x4b
	blo _02251E92
_02251E86:
	movs r0, #8
	adds r1, r4, #0
	bl FUN_02026354
	adds r5, r0, #0
	b _02251EB2
_02251E92:
	bl FUN_02095FEC
	adds r2, r0, #0
	movs r0, #1
	movs r1, #0x1b
	adds r3, r4, #0
	bl FUN_0200BAF8
	adds r4, r0, #0
	movs r1, #0
	bl FUN_0200BBA0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0200BB44
_02251EB2:
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov02_02251E74

	thumb_func_start ov02_02251EB8
ov02_02251EB8: @ 0x02251EB8
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0x4b
	blo _02251ED0
	movs r0, #0xff
	strb r0, [r4, #2]
	strb r0, [r4, #5]
	movs r0, #0
	strb r0, [r4, #6]
	bl GF_AssertFail
	b _02251ED6
_02251ED0:
	strb r1, [r4, #2]
	strb r2, [r4, #5]
	strb r3, [r4, #6]
_02251ED6:
	ldr r0, _02251EE4 @ =0xFFFFFFF8
	add r0, sp
	ldrb r1, [r0, #0x10]
	strb r1, [r4, #3]
	ldrb r0, [r0, #0x14]
	strb r0, [r4, #4]
	pop {r4, pc}
	.align 2, 0
_02251EE4: .4byte 0xFFFFFFF8
	thumb_func_end ov02_02251EB8

	thumb_func_start ov02_02251EE8
ov02_02251EE8: @ 0x02251EE8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #5
	blx FUN_020D4994
	ldrb r0, [r5, #2]
	cmp r0, #0x4b
	blo _02251F08
	bl GF_AssertFail
	movs r0, #0xff
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02251F08:
	ldrb r0, [r5, #5]
	strb r0, [r4]
	ldrb r0, [r5, #6]
	strb r0, [r4, #1]
	ldrb r0, [r5, #3]
	strb r0, [r4, #3]
	ldrb r0, [r5, #4]
	strb r0, [r4, #4]
	ldrb r0, [r5, #7]
	strb r0, [r4, #2]
	ldrb r0, [r5, #2]
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02251EE8

	thumb_func_start ov02_02251F20
ov02_02251F20: @ 0x02251F20
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	bl FUN_0203B9C4
	bl FUN_0203B958
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0203B4A8
	cmp r0, #0
	bne _02251F3E
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02251F3E:
	ldrb r0, [r5]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _02251F4E
	ldr r1, [r5, #8]
	ldr r0, [r5, #0xc]
	cmp r1, r0
	bge _02251F52
_02251F4E:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02251F52:
	movs r0, #4
	bl FUN_02095EF8
	adds r6, r0, #0
	ldr r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov02_022521C0
	adds r7, r0, #0
	beq _02251F9C
	adds r0, r6, #0
	bl FUN_02095F68
	cmp r7, #2
	bne _02251F90
	ldr r2, [r5, #0x3c]
	adds r0, r2, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x80
	adds r2, #0xd2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r5, #0x3c]
	ldr r1, _02251FD8 @ =0x000007FF
	movs r2, #0
	bl FUN_0203FE74
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02251F90:
	adds r0, r5, #0
	movs r1, #1
	bl ov02_022522AC
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02251F9C:
	bl FUN_0201FDB8
	movs r1, #0x64
	blx FUN_020F2BA4
	ldrh r0, [r5, #0x12]
	cmp r1, r0
	bls _02251FB8
	adds r0, r6, #0
	bl FUN_02095F68
	movs r0, #0
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02251FB8:
	ldr r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov02_02251FDC
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_02095F68
	cmp r4, #0
	bne _02251FD2
	movs r0, #0
	str r0, [r5, #8]
_02251FD2:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02251FD8: .4byte 0x000007FF
	thumb_func_end ov02_02251F20

	thumb_func_start ov02_02251FDC
ov02_02251FDC: @ 0x02251FDC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp, #8]
	ldr r0, [r0, #0x38]
	adds r6, r1, #0
	str r2, [sp, #0xc]
	bl FUN_020503D0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x38]
	bl FUN_02028E9C
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x38]
	bl FUN_0202A954
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x30]
	bl FUN_0202EEC0
	str r0, [sp, #0x2c]
	ldr r0, [sp, #8]
	movs r1, #4
	ldr r0, [r0, #0x30]
	bl FUN_0202EF44
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x2c]
	movs r0, #4
	bl FUN_0201AACC
	ldr r2, [sp, #0x2c]
	movs r1, #0xff
	adds r4, r0, #0
	blx FUN_020D4994
	bl FUN_0201FD44
	movs r1, #0xfa
	lsls r1, r1, #2
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x7d
	lsls r0, r0, #2
	cmp r1, r0
	bhs _02252046
	movs r0, #0
	str r0, [sp, #0x24]
	b _02252058
_02252046:
	movs r0, #0x32
	lsls r0, r0, #4
	cmp r1, r0
	bhs _02252054
	movs r0, #1
	str r0, [sp, #0x24]
	b _02252058
_02252054:
	movs r0, #2
	str r0, [sp, #0x24]
_02252058:
	ldr r0, [sp, #0x2c]
	movs r7, #0
	adds r2, r7, #0
	cmp r0, #0
	bls _022520A2
_02252062:
	ldr r0, [sp, #0x20]
	movs r1, #0x14
	ldrb r3, [r0, r2]
	ldr r0, [r6, #4]
	muls r1, r3, r1
	adds r5, r0, r1
	ldrb r1, [r5, #0xf]
	ldr r0, [sp, #0x24]
	cmp r0, r1
	bne _02252096
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _0225208C
	cmp r0, #0xc
	beq _0225208C
	cmp r0, #0xb
	beq _0225208C
	cmp r0, #0xa
	beq _0225208C
	cmp r0, #0xe
	bne _02252096
_0225208C:
	adds r1, r7, #1
	adds r0, r7, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	strb r3, [r4, r0]
_02252096:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [sp, #0x2c]
	cmp r2, r0
	blo _02252062
_022520A2:
	cmp r7, #0
	bne _022520B8
	ldr r0, [sp, #0x20]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x30
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022520B8:
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x2c]
	movs r1, #0xff
	blx FUN_020D4994
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x38]
	bl FUN_02028D3C
	ldr r0, [r0, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	bl FUN_02066870
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	bl FUN_0202AAD4
	cmp r0, r7
	bne _022520F6
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	bl FUN_0202AA9C
_022520F6:
	movs r5, #0
	cmp r7, #0
	bls _02252164
_022520FC:
	ldrb r2, [r4, r5]
	movs r1, #0x14
	ldr r0, [r6, #4]
	muls r1, r2, r1
	adds r0, r0, r1
	ldrh r1, [r0, #6]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	beq _0225215A
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	bl FUN_0202AA44
	cmp r0, #0
	bne _0225215A
	ldrb r0, [r4, r5]
	cmp r0, #8
	bne _02252134
	ldr r0, [sp, #0x14]
	bl FUN_02095FF8
	cmp r0, #0
	bne _0225215A
	ldr r0, [sp, #0x1c]
	bl FUN_02066E58
	cmp r0, #0
	bne _0225215A
_02252134:
	ldrb r1, [r4, r5]
	movs r2, #0x14
	ldr r0, [r6, #4]
	muls r2, r1, r2
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	cmp r0, #0x60
	bne _0225214A
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0225215A
_0225214A:
	ldr r0, [sp, #0x28]
	adds r2, r0, #0
	adds r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x28]
	ldr r2, [sp, #0x20]
	strb r1, [r2, r0]
_0225215A:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r7
	blo _022520FC
_02252164:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _022521AC
	bl FUN_0201FDB8
	ldr r2, [sp, #0x28]
	movs r1, #0x64
	muls r1, r2, r1
	blx FUN_020F2BA4
	adds r0, r1, #0
	movs r1, #0x64
	blx FUN_020F2BA4
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	lsls r1, r1, #0x18
	str r0, [sp]
	lsrs r2, r1, #0x18
	str r0, [sp, #4]
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #8]
	ldrb r1, [r1, r2]
	ldr r2, [sp, #0x24]
	adds r3, r7, #0
	bl ov02_02251EB8
	ldr r0, [sp, #8]
	bl FUN_02092DF4
	ldr r0, [sp, #8]
	movs r1, #1
	bl ov02_022522AC
_022521AC:
	ldr r0, [sp, #0x20]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [sp, #0x28]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02251FDC

	thumb_func_start ov02_022521C0
ov02_022521C0: @ 0x022521C0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	bl ov02_02252218
	adds r6, r0, #0
	cmp r6, #0xff
	bne _022521D6
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_022521D6:
	movs r0, #6
	adds r4, r6, #0
	muls r4, r0, r4
	movs r0, #3
	str r0, [sp]
	ldr r0, _0225220C @ =0x02253C86
	ldr r1, _02252210 @ =0x02253C84
	ldrh r0, [r0, r4]
	ldrb r1, [r1, r4]
	movs r2, #0xff
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl ov02_02251EB8
	adds r0, r5, #0
	bl FUN_02092DF4
	ldr r0, _02252214 @ =0x02253C88
	strb r6, [r5, #7]
	ldrb r0, [r0, r4]
	adds r0, r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0225220C: .4byte 0x02253C86
_02252210: .4byte 0x02253C84
_02252214: .4byte 0x02253C88
	thumb_func_end ov02_022521C0

	thumb_func_start ov02_02252218
ov02_02252218: @ 0x02252218
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #4
	movs r1, #0xd
	str r2, [sp, #4]
	bl FUN_0201AACC
	movs r1, #0
	movs r2, #0xd
	str r0, [sp, #8]
	blx FUN_020D4994
	movs r5, #0
	ldr r6, _022522A8 @ =0x02253C84
	adds r4, r5, #0
_0225223A:
	lsls r1, r4, #0x18
	ldr r0, [r7, #0x34]
	lsrs r1, r1, #0x18
	bl FUN_0202F08C
	cmp r0, #0
	beq _02252276
	ldr r0, [sp]
	movs r1, #0x14
	ldr r2, [r0, #4]
	ldrb r0, [r6]
	muls r1, r0, r1
	adds r0, r2, r1
	ldrb r1, [r2, r1]
	cmp r1, #6
	bne _02252268
	ldr r0, [r7, #0x30]
	movs r1, #6
	bl FUN_0202EEE4
	cmp r0, #0xff
	beq _02252276
	b _02252270
_02252268:
	ldrh r1, [r0, #6]
	ldr r0, [sp, #4]
	cmp r1, r0
	beq _02252276
_02252270:
	ldr r0, [sp, #8]
	strb r4, [r0, r5]
	adds r5, r5, #1
_02252276:
	adds r4, r4, #1
	adds r6, r6, #6
	cmp r4, #0xd
	blt _0225223A
	cmp r5, #0
	bne _0225228E
	ldr r0, [sp, #8]
	bl FUN_0201AB0C
	add sp, #0xc
	movs r0, #0xff
	pop {r4, r5, r6, r7, pc}
_0225228E:
	bl FUN_0201FD44
	adds r1, r5, #0
	blx FUN_020F2998
	ldr r0, [sp, #8]
	ldrb r4, [r0, r1]
	bl FUN_0201AB0C
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022522A8: .4byte 0x02253C84
	thumb_func_end ov02_02252218

	thumb_func_start ov02_022522AC
ov02_022522AC: @ 0x022522AC
	ldr r3, _022522B0 @ =FUN_02093010
	bx r3
	.align 2, 0
_022522B0: .4byte FUN_02093010
	thumb_func_end ov02_022522AC

	thumb_func_start ov02_022522B4
ov02_022522B4: @ 0x022522B4
	push {r3, lr}
	bl FUN_02004A20
	lsls r0, r0, #0x10
	ldr r2, _0225232C @ =0x00000492
	lsrs r0, r0, #0x10
	cmp r0, r2
	bgt _022522F0
	bge _0225231C
	adds r1, r2, #0
	subs r1, #0x44
	cmp r0, r1
	bgt _022522E8
	subs r2, #0x47
	subs r1, r0, r2
	bmi _02252328
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022522E0: @ jump table
	.2byte _02252314 - _022522E0 - 2 @ case 0
	.2byte _02252310 - _022522E0 - 2 @ case 1
	.2byte _02252320 - _022522E0 - 2 @ case 2
	.2byte _02252324 - _022522E0 - 2 @ case 3
_022522E8:
	ldr r1, _02252330 @ =0x00000491
	cmp r0, r1
	beq _02252318
	b _02252328
_022522F0:
	adds r1, r2, #0
	adds r1, #0x8e
	cmp r0, r1
	bgt _02252308
	adds r1, r2, #0
	adds r1, #0x8e
	cmp r0, r1
	bge _02252310
	adds r2, #0x8d
	cmp r0, r2
	beq _02252314
	b _02252328
_02252308:
	adds r2, #0x90
	cmp r0, r2
	beq _02252324
	b _02252328
_02252310:
	movs r0, #1
	pop {r3, pc}
_02252314:
	movs r0, #2
	pop {r3, pc}
_02252318:
	movs r0, #3
	pop {r3, pc}
_0225231C:
	movs r0, #4
	pop {r3, pc}
_02252320:
	movs r0, #6
	pop {r3, pc}
_02252324:
	movs r0, #5
	pop {r3, pc}
_02252328:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_0225232C: .4byte 0x00000492
_02252330: .4byte 0x00000491
	thumb_func_end ov02_022522B4

	thumb_func_start ov02_02252334
ov02_02252334: @ 0x02252334
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	bl FUN_0205C6DC
	bl FUN_02062108
	cmp r0, #0
	bne _0225234A
	movs r0, #0
	pop {r4, r5, r6, pc}
_0225234A:
	adds r0, r5, #0
	bl FUN_02069F88
	cmp r0, #0
	beq _022523B0
	adds r0, r5, #0
	adds r0, #0xf4
	ldr r1, [r0]
	movs r0, #0x7b
	lsls r0, r0, #2
	cmp r1, r0
	bne _022523B0
	ldr r0, [r5, #0xc]
	bl FUN_02074904
	bl FUN_02054388
	adds r6, r0, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0xf4
	ldr r0, [r0]
	cmp r4, r0
	beq _02252392
	bl GF_AssertFail
_02252392:
	adds r0, r5, #0
	adds r0, #0xf4
	ldr r0, [r0]
	cmp r4, r0
	beq _022523A0
	movs r0, #0
	pop {r4, r5, r6, pc}
_022523A0:
	adds r5, #0xfc
	ldrh r0, [r5]
	cmp r0, #1
	bne _022523B0
	cmp r6, #0
	bne _022523B0
	movs r0, #1
	pop {r4, r5, r6, pc}
_022523B0:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02252334

	thumb_func_start ov02_022523B4
ov02_022523B4: @ 0x022523B4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xb
	movs r1, #0xc
	bl FUN_0201AACC
	adds r2, r0, #0
	ldr r1, _022523CC @ =ov02_022523D0
	adds r0, r4, #0
	bl FUN_02050530
	pop {r4, pc}
	.align 2, 0
_022523CC: .4byte ov02_022523D0
	thumb_func_end ov02_022523B4

	thumb_func_start ov02_022523D0
ov02_022523D0: @ 0x022523D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	bl FUN_02050654
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_0205064C
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_02050650
	adds r6, r0, #0
	ldr r0, [r5]
	cmp r0, #4
	bls _022523F4
	b _02252524
_022523F4:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02252400: @ jump table
	.2byte _0225240A - _02252400 - 2 @ case 0
	.2byte _02252426 - _02252400 - 2 @ case 1
	.2byte _0225246E - _02252400 - 2 @ case 2
	.2byte _022524D2 - _02252400 - 2 @ case 3
	.2byte _022524EE - _02252400 - 2 @ case 4
_0225240A:
	adds r0, r4, #0
	bl FUN_02069D68
	bl FUN_0205F708
	ldr r0, [r4, #0x10]
	ldr r1, _0225252C @ =0x02205A61
	movs r2, #0
	bl FUN_02050530
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252524
_02252426:
	adds r0, r4, #0
	bl FUN_02069D68
	add r1, sp, #0
	bl FUN_0205F944
	adds r0, r4, #0
	bl FUN_02069FB0
	cmp r0, #0
	beq _0225244A
	ldr r0, [r4, #0x44]
	add r1, sp, #0
	bl FUN_022052C4
	str r0, [r6, #4]
	movs r0, #1
	b _0225244E
_0225244A:
	movs r0, #0
	str r0, [r6, #4]
_0225244E:
	str r0, [r6, #8]
	adds r0, r4, #0
	movs r2, #0
	movs r1, #0x7b
	str r2, [r6]
	adds r4, #0xfb
	adds r0, #0xe4
	ldrb r3, [r4]
	ldr r0, [r0]
	lsls r1, r1, #2
	bl FUN_02069EE8
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252524
_0225246E:
	ldr r0, [r6, #8]
	cmp r0, #0
	beq _02252490
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	cmp r0, #4
	blt _02252524
	adds r4, #0xe4
	ldr r0, [r4]
	ldr r1, _02252530 @ =0x000003CE
	bl FUN_021FA930
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252524
_02252490:
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	bl FUN_0205F35C
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	bl FUN_0205F25C
	adds r7, r0, #0
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	bl FUN_0205E420
	adds r2, r4, #0
	adds r2, #0xe4
	ldr r2, [r2]
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_021FA108
	adds r4, #0xe4
	ldr r0, [r4]
	ldr r1, _02252530 @ =0x000003CE
	bl FUN_0205E38C
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252524
_022524D2:
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	bl FUN_021FA2D4
	cmp r0, #0
	bne _02252524
	movs r0, #0
	adds r4, #0xfc
	strh r0, [r4]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252524
_022524EE:
	ldr r0, [r6, #4]
	movs r5, #0
	cmp r0, #0
	bne _022524FA
	movs r5, #1
	b _0225250A
_022524FA:
	bl FUN_022052F4
	cmp r0, #0
	beq _0225250A
	ldr r0, [r6, #4]
	bl FUN_02068B48
	movs r5, #1
_0225250A:
	cmp r5, #0
	beq _02252524
	adds r0, r6, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_02069D68
	bl FUN_0205F6FC
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02252524:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225252C: .4byte 0x02205A61
_02252530: .4byte 0x000003CE
	thumb_func_end ov02_022523D0

	thumb_func_start ov02_02252534
ov02_02252534: @ 0x02252534
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xb
	movs r1, #0xf4
	bl FUN_0201AACC
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0xf4
	blx FUN_020D4994
	str r5, [r4, #8]
	ldr r0, [r5, #0x10]
	ldr r1, _02252558 @ =ov02_0225255C
	adds r2, r4, #0
	bl FUN_02050530
	pop {r3, r4, r5, pc}
	.align 2, 0
_02252558: .4byte ov02_0225255C
	thumb_func_end ov02_02252534

	thumb_func_start ov02_0225255C
ov02_0225255C: @ 0x0225255C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl FUN_02050654
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0205064C
	adds r0, r4, #0
	bl FUN_02050650
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #5
	bls _0225257E
	b _02252698
_0225257E:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225258A: @ jump table
	.2byte _02252596 - _0225258A - 2 @ case 0
	.2byte _022525B4 - _0225258A - 2 @ case 1
	.2byte _022525EA - _0225258A - 2 @ case 2
	.2byte _0225260C - _0225258A - 2 @ case 3
	.2byte _02252638 - _0225258A - 2 @ case 4
	.2byte _0225266E - _0225258A - 2 @ case 5
_02252596:
	movs r1, #4
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0
	ldr r3, _022526C4 @ =0x00007FFF
	movs r0, #3
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252698
_022525B4:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02252698
	adds r0, r4, #0
	bl ov02_02252898
	ldr r0, [r4, #8]
	bl FUN_02069D68
	movs r1, #1
	bl FUN_02069DC8
	movs r0, #4
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r3, _022526C4 @ =0x00007FFF
	movs r0, #3
	movs r2, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252698
_022525EA:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02252698
	ldr r0, [r4, #8]
	bl FUN_02069D68
	bl FUN_0205F484
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0xf0
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252698
_0225260C:
	adds r1, r4, #0
	adds r1, #0xf2
	ldrb r1, [r1]
	adds r2, r1, #1
	adds r1, r4, #0
	adds r1, #0xf2
	strb r2, [r1]
	adds r1, r4, #0
	adds r1, #0xf2
	ldrb r1, [r1]
	cmp r1, #0x1e
	blo _02252698
	bl ov02_022526C8
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xf2
	strb r1, [r0]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252698
_02252638:
	adds r0, #0xf2
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf2
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf2
	ldrb r0, [r0]
	cmp r0, #0x50
	blo _02252698
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0
	ldr r3, _022526C4 @ =0x00007FFF
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252698
_0225266E:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02252698
	adds r0, r4, #0
	bl ov02_022526EC
	cmp r0, #0
	beq _02252698
	adds r0, r4, #0
	bl ov02_0225296C
	adds r0, r4, #4
	bl FUN_021F46DC
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_02252698:
	adds r0, r4, #0
	adds r0, #0xf0
	ldrb r0, [r0]
	cmp r0, #0
	beq _022526AA
	adds r0, r4, #0
	adds r0, #0x2c
	bl ov02_022529C4
_022526AA:
	adds r0, r4, #0
	adds r0, #0xf1
	ldrb r0, [r0]
	cmp r0, #0
	beq _022526BC
	adds r4, #0x68
	adds r0, r4, #0
	bl FUN_021FBF68
_022526BC:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_022526C4: .4byte 0x00007FFF
	thumb_func_end ov02_0225255C

	thumb_func_start ov02_022526C8
ov02_022526C8: @ 0x022526C8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0xd
	bl FUN_021F467C
	str r0, [r4, #4]
	ldr r0, _022526E8 @ =ov02_022526FC
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	movs r0, #0
	strb r0, [r4, #2]
	pop {r4, pc}
	nop
_022526E8: .4byte ov02_022526FC
	thumb_func_end ov02_022526C8

	thumb_func_start ov02_022526EC
ov02_022526EC: @ 0x022526EC
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _022526F6
	movs r0, #1
	bx lr
_022526F6:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov02_022526EC

	thumb_func_start ov02_022526FC
ov02_022526FC: @ 0x022526FC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0xee
	ldrh r0, [r0]
	cmp r0, #0
	beq _02252716
	cmp r0, #1
	beq _02252746
	add sp, #0xc
	pop {r4, r5, pc}
_02252716:
	ldr r3, _02252760 @ =0x02253CE0
	add r2, sp, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #8]
	ldr r0, [r0, #0x24]
	bl FUN_0202360C
	add r1, sp, #0
	strh r0, [r1, #8]
	adds r0, r4, #0
	add r1, sp, #0
	bl ov02_02252764
	adds r0, r4, #0
	adds r0, #0xee
	ldrh r0, [r0]
	adds r4, #0xee
	add sp, #0xc
	adds r0, r0, #1
	strh r0, [r4]
	pop {r4, r5, pc}
_02252746:
	adds r0, r4, #0
	bl ov02_02252888
	cmp r0, #0
	beq _0225275A
	movs r0, #1
	strb r0, [r4, #2]
	adds r0, r5, #0
	bl FUN_0200E390
_0225275A:
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02252760: .4byte 0x02253CE0
	thumb_func_end ov02_022526FC

	thumb_func_start ov02_02252764
ov02_02252764: @ 0x02252764
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0
	strb r1, [r5, #3]
	adds r0, #0xe6
	strh r1, [r0]
	adds r0, r5, #0
	ldr r1, [r4]
	adds r0, #0xe0
	str r1, [r0]
	adds r0, r5, #0
	ldrh r1, [r5]
	adds r0, #0xe4
	strh r1, [r0]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x24]
	bl FUN_0202360C
	adds r1, r5, #0
	adds r1, #0xea
	strh r0, [r1]
	adds r0, r5, #0
	ldrh r1, [r4, #8]
	adds r0, #0xec
	movs r2, #1
	strh r1, [r0]
	adds r0, r5, #0
	ldr r1, [r4, #4]
	adds r0, #0xe8
	strh r1, [r0]
	ldr r0, _022527AC @ =ov02_0225286C
	adds r1, r5, #0
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	.align 2, 0
_022527AC: .4byte ov02_0225286C
	thumb_func_end ov02_02252764

	thumb_func_start ov02_022527B0
ov02_022527B0: @ 0x022527B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	ldr r3, _02252864 @ =0x02253CD4
	adds r5, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #4
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x24]
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0xe6
	ldrh r0, [r0]
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0xe6
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0xe6
	ldrh r6, [r0]
	adds r0, r5, #0
	adds r0, #0xe8
	ldrh r7, [r0]
	adds r0, r5, #0
	adds r0, #0xea
	ldrh r4, [r0]
	adds r0, r5, #0
	adds r0, #0xec
	ldrh r0, [r0]
	subs r1, r0, r4
	adds r0, r1, #0
	muls r0, r6, r0
	adds r1, r7, #0
	blx FUN_020F2998
	adds r4, r0, r4
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r1, [r0]
	adds r0, r1, #0
	muls r0, r6, r0
	adds r1, r7, #0
	blx FUN_020F2998
	adds r1, r5, #0
	adds r1, #0xe4
	ldrh r1, [r1]
	ldr r3, _02252868 @ =0x021094DC
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0x10
	bl FUN_020CB108
	add r0, sp, #4
	add r1, sp, #0x10
	add r2, sp, #0x34
	blx FUN_020CB630
	ldr r1, [sp]
	add r0, sp, #0x34
	bl FUN_02023204
	lsls r0, r4, #0x10
	ldr r1, [sp]
	lsrs r0, r0, #0x10
	bl FUN_02023494
	adds r0, r5, #0
	adds r0, #0xe6
	adds r5, #0xe8
	ldrh r1, [r0]
	ldrh r0, [r5]
	cmp r1, r0
	blo _0225285E
	add sp, #0x40
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225285E:
	movs r0, #0
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02252864: .4byte 0x02253CD4
_02252868: .4byte 0x021094DC
	thumb_func_end ov02_022527B0

	thumb_func_start ov02_0225286C
ov02_0225286C: @ 0x0225286C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov02_022527B0
	cmp r0, #0
	beq _02252886
	movs r0, #1
	strb r0, [r4, #3]
	adds r0, r5, #0
	bl FUN_0200E390
_02252886:
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0225286C

	thumb_func_start ov02_02252888
ov02_02252888: @ 0x02252888
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _02252892
	movs r0, #1
	bx lr
_02252892:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov02_02252888

	thumb_func_start ov02_02252898
ov02_02252898: @ 0x02252898
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	ldr r3, _02252968 @ =0x02253CEC
	str r0, [sp, #8]
	ldm r3!, {r0, r1}
	add r2, sp, #0x1c
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #4
	str r0, [r2]
	ldr r0, [sp, #8]
	movs r2, #0x20
	adds r0, #0xc
	bl FUN_0201AC14
	ldr r0, [sp, #8]
	movs r1, #0xae
	adds r0, #0x1c
	movs r2, #0x4b
	movs r3, #4
	bl FUN_021FBCD8
	ldr r0, [sp, #8]
	ldr r4, [sp, #8]
	ldr r7, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, #0x1c
	movs r5, #0
	adds r4, #0xc
	adds r7, #0x2c
	str r0, [sp, #0xc]
_022528D6:
	movs r0, #4
	str r0, [sp]
	movs r0, #0x14
	muls r0, r5, r0
	str r4, [sp, #4]
	lsls r6, r5, #2
	add r3, sp, #0x1c
	ldr r1, [sp, #0xc]
	ldr r3, [r3, r6]
	adds r0, r7, r0
	movs r2, #0xae
	bl FUN_021FBE44
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	blo _022528D6
	ldr r0, [sp, #8]
	ldr r1, [sp, #8]
	adds r0, #0x68
	adds r1, #0x1c
	bl FUN_021FBF2C
	ldr r6, [sp, #8]
	ldr r4, [sp, #8]
	movs r5, #0
	adds r6, #0x68
	adds r4, #0x2c
	movs r7, #0x14
_02252912:
	adds r1, r5, #0
	muls r1, r7, r1
	adds r0, r6, #0
	adds r1, r4, r1
	bl FUN_021FBF50
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	blo _02252912
	ldr r0, [sp, #8]
	movs r1, #1
	adds r0, #0x68
	bl FUN_021FC004
	ldr r0, [sp, #8]
	movs r1, #0
	adds r0, #0x2c
	bl ov02_022529A0
	ldr r0, [sp, #8]
	ldr r0, [r0, #8]
	bl FUN_02069D68
	add r1, sp, #0x10
	bl FUN_0205F944
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	adds r0, #0x68
	bl FUN_021FC00C
	ldr r0, [sp, #8]
	movs r1, #1
	adds r0, #0xf1
	str r0, [sp, #8]
	strb r1, [r0]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02252968: .4byte 0x02253CEC
	thumb_func_end ov02_02252898

	thumb_func_start ov02_0225296C
ov02_0225296C: @ 0x0225296C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r0, #0
	str r0, [sp]
	movs r5, #0
	adds r4, #0x2c
	adds r6, #0xc
	movs r7, #0x14
_0225297C:
	adds r0, r5, #0
	muls r0, r7, r0
	adds r0, r4, r0
	adds r1, r6, #0
	bl FUN_021FBE80
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	blo _0225297C
	ldr r0, [sp]
	adds r0, #0x1c
	str r0, [sp]
	bl FUN_021FBDA8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_0225296C

	thumb_func_start ov02_022529A0
ov02_022529A0: @ 0x022529A0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	movs r7, #0x14
_022529AA:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r5, r0
	adds r1, r6, #0
	bl FUN_021FBF20
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _022529AA
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_022529A0

	thumb_func_start ov02_022529C4
ov02_022529C4: @ 0x022529C4
	push {r3, r4, r5, r6, r7, lr}
	movs r5, #0
	adds r6, r0, #0
	adds r4, r5, #0
	movs r7, #0x14
_022529CE:
	adds r0, r4, #0
	muls r0, r7, r0
	movs r1, #1
	adds r0, r6, r0
	lsls r1, r1, #0xc
	bl FUN_021FBEE4
	cmp r0, #0
	beq _022529E6
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_022529E6:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _022529CE
	cmp r5, #3
	bne _022529F8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022529F8:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022529C4

	thumb_func_start ov02_022529FC
ov02_022529FC: @ 0x022529FC
	push {r3, r4, r5, lr}
	movs r1, #0x8a
	adds r5, r0, #0
	movs r0, #0xb
	lsls r1, r1, #2
	bl FUN_0201AACC
	movs r2, #0x8a
	adds r4, r0, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020D4994
	str r5, [r4]
	ldr r0, [r5, #0x10]
	ldr r1, _02252A24 @ =ov02_02252A28
	adds r2, r4, #0
	bl FUN_02050530
	pop {r3, r4, r5, pc}
	.align 2, 0
_02252A24: .4byte ov02_02252A28
	thumb_func_end ov02_022529FC

	thumb_func_start ov02_02252A28
ov02_02252A28: @ 0x02252A28
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl FUN_02050654
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0205064C
	adds r0, r4, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldr r0, [r5]
	cmp r0, #5
	bhi _02252B3A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02252A54: @ jump table
	.2byte _02252A60 - _02252A54 - 2 @ case 0
	.2byte _02252A80 - _02252A54 - 2 @ case 1
	.2byte _02252AAC - _02252A54 - 2 @ case 2
	.2byte _02252AD2 - _02252A54 - 2 @ case 3
	.2byte _02252AF2 - _02252A54 - 2 @ case 4
	.2byte _02252B20 - _02252A54 - 2 @ case 5
_02252A60:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	movs r1, #0
	str r0, [sp, #8]
	ldr r3, _02252B94 @ =0x00007FFF
	movs r0, #3
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252A80:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02252B3A
	adds r0, r4, #0
	bl ov02_02252BA4
	movs r0, #2
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldr r3, _02252B94 @ =0x00007FFF
	movs r0, #3
	movs r2, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252AAC:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02252B3A
	movs r2, #0x89
	lsls r2, r2, #2
	movs r1, #1
	strb r1, [r4, r2]
	adds r0, r2, #3
	movs r3, #0
	subs r2, #0x78
	strb r3, [r4, r0]
	adds r0, r4, r2
	bl FUN_021FC004
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252AD2:
	ldr r1, _02252B98 @ =0x00000227
	ldrb r0, [r4, r1]
	adds r0, r0, #1
	strb r0, [r4, r1]
	ldrb r0, [r4, r1]
	cmp r0, #0x64
	blo _02252B3A
	movs r2, #1
	subs r0, r1, #2
	strb r2, [r4, r0]
	movs r0, #0
	strb r0, [r4, r1]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252AF2:
	ldr r0, _02252B98 @ =0x00000227
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #0x96
	blo _02252B3A
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	movs r1, #0
	str r0, [sp, #8]
	ldr r3, _02252B94 @ =0x00007FFF
	movs r0, #3
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252B20:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02252B3A
	adds r0, r4, #0
	bl ov02_02252DF8
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_02252B3A:
	movs r0, #0x89
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02252B58
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #2
	bl ov02_02252EA8
	adds r0, r4, #0
	adds r0, #0x5c
	movs r1, #2
	bl ov02_02252EA8
_02252B58:
	ldr r0, _02252B9C @ =0x00000225
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _02252B6A
	subs r0, #0xa1
	adds r0, r4, r0
	movs r1, #2
	bl ov02_02252EA8
_02252B6A:
	ldr r0, _02252BA0 @ =0x00000226
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02252B8C
	adds r0, r4, #0
	adds r0, #0x84
	bl FUN_021FBF68
	adds r0, r4, #0
	adds r0, #0xfc
	bl FUN_021FBF68
	movs r0, #0x6b
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_021FBF68
_02252B8C:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02252B94: .4byte 0x00007FFF
_02252B98: .4byte 0x00000227
_02252B9C: .4byte 0x00000225
_02252BA0: .4byte 0x00000226
	thumb_func_end ov02_02252A28

	thumb_func_start ov02_02252BA4
ov02_02252BA4: @ 0x02252BA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	ldr r3, _02252DEC @ =0x02253D14
	add r2, sp, #0x40
	str r0, [sp, #8]
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, _02252DF0 @ =0x02253CF8
	ldr r1, [r0, #4]
	ldr r2, [r0]
	str r1, [sp, #0x30]
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	str r2, [sp, #0x2c]
	str r0, [sp, #0x28]
	ldr r0, [sp, #8]
	str r1, [sp, #0x24]
	adds r0, r0, #4
	movs r1, #4
	movs r2, #0x20
	bl FUN_0201AC14
	ldr r4, [sp, #8]
	movs r5, #0
	adds r4, #0x14
	movs r7, #0xae
	add r6, sp, #0x24
_02252BDE:
	lsls r2, r5, #2
	lsls r0, r5, #4
	ldr r2, [r6, r2]
	adds r0, r4, r0
	adds r1, r7, #0
	movs r3, #4
	bl FUN_021FBCD8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	blo _02252BDE
	movs r1, #0x5d
	ldr r0, [sp, #8]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xae
	movs r2, #0x55
	movs r3, #4
	bl FUN_021FBCD8
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	adds r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	str r0, [sp, #0x14]
	adds r0, #0x14
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r0, [sp, #0x18]
	adds r0, #0x34
	str r0, [sp, #0x18]
_02252C24:
	ldr r0, [sp, #0x10]
	movs r5, #0
	lsls r1, r0, #3
	add r0, sp, #0x40
	adds r6, r0, r1
	ldr r0, [sp, #0x10]
	adds r1, r0, #0
	lsls r7, r0, #4
	movs r0, #0x28
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x18]
	adds r4, r0, r2
_02252C3E:
	movs r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x14]
	str r0, [sp, #4]
	movs r0, #0x14
	lsls r3, r5, #2
	muls r0, r5, r0
	ldr r3, [r6, r3]
	adds r0, r4, r0
	adds r1, r1, r7
	movs r2, #0xae
	bl FUN_021FBE44
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	blo _02252C3E
	ldr r0, [sp, #0x10]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	cmp r0, #2
	blo _02252C24
	ldr r0, [sp, #8]
	movs r1, #0x61
	lsls r1, r1, #2
	movs r5, #0
	adds r4, r0, #4
	adds r7, r0, r1
_02252C7E:
	movs r0, #4
	str r0, [sp]
	movs r0, #0x14
	movs r1, #0x5d
	muls r0, r5, r0
	ldr r2, [sp, #8]
	lsls r1, r1, #2
	adds r1, r2, r1
	lsls r6, r5, #2
	add r3, sp, #0x2c
	ldr r3, [r3, r6]
	adds r0, r7, r0
	movs r2, #0xae
	str r4, [sp, #4]
	bl FUN_021FBE44
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	blo _02252C7E
	ldr r4, [sp, #8]
	ldr r6, [sp, #8]
	movs r5, #0
	adds r4, #0x84
	adds r6, #0x14
	movs r7, #0x78
_02252CB4:
	adds r0, r5, #0
	muls r0, r7, r0
	lsls r1, r5, #4
	adds r0, r4, r0
	adds r1, r6, r1
	bl FUN_021FBF2C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	blo _02252CB4
	movs r2, #0x6b
	ldr r0, [sp, #8]
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [sp, #8]
	subs r2, #0x38
	adds r1, r1, r2
	bl FUN_021FBF2C
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r7, [sp, #8]
	str r0, [sp, #0x20]
	adds r0, #0x34
	str r0, [sp, #0x20]
	adds r7, #0x84
_02252CEE:
	ldr r1, [sp, #0xc]
	movs r0, #0x28
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x20]
	adds r6, r1, #0
	adds r4, r0, r2
	movs r0, #0x78
	movs r5, #0
	muls r6, r0, r6
_02252D02:
	movs r1, #0x14
	muls r1, r5, r1
	adds r0, r7, r6
	adds r1, r4, r1
	bl FUN_021FBF50
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	blo _02252D02
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	cmp r0, #2
	blo _02252CEE
	movs r6, #0x6b
	lsls r6, r6, #2
	adds r1, r6, #0
	ldr r0, [sp, #8]
	subs r1, #0x28
	movs r5, #0
	adds r4, r0, r1
	movs r7, #0x14
_02252D36:
	ldr r0, [sp, #8]
	adds r1, r5, #0
	muls r1, r7, r1
	adds r0, r0, r6
	adds r1, r4, r1
	bl FUN_021FBF50
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	blo _02252D36
	ldr r4, [sp, #8]
	ldr r6, [sp, #8]
	movs r5, #0
	adds r4, #0x84
	adds r6, #0x34
	movs r7, #0x28
_02252D5A:
	movs r0, #0x78
	muls r0, r5, r0
	adds r0, r4, r0
	movs r1, #1
	bl FUN_021FC004
	adds r0, r5, #0
	muls r0, r7, r0
	adds r0, r6, r0
	movs r1, #2
	movs r2, #0
	bl ov02_02252E80
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	blo _02252D5A
	movs r1, #0x6b
	ldr r0, [sp, #8]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	bl FUN_021FC004
	movs r1, #0x61
	ldr r0, [sp, #8]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #2
	movs r2, #0
	bl ov02_02252E80
	ldr r0, [sp, #8]
	ldr r0, [r0]
	bl FUN_02069D68
	add r1, sp, #0x34
	bl FUN_0205F944
	ldr r4, [sp, #8]
	movs r5, #0
	adds r4, #0x84
	movs r6, #0x78
_02252DB2:
	adds r0, r5, #0
	muls r0, r6, r0
	ldr r1, [sp, #0x34]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x3c]
	adds r0, r4, r0
	bl FUN_021FC00C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	blo _02252DB2
	movs r1, #0x6b
	ldr r0, [sp, #8]
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [sp, #0x34]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x3c]
	bl FUN_021FC00C
	ldr r1, _02252DF4 @ =0x00000226
	ldr r0, [sp, #8]
	movs r2, #1
	strb r2, [r0, r1]
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02252DEC: .4byte 0x02253D14
_02252DF0: .4byte 0x02253CF8
_02252DF4: .4byte 0x00000226
	thumb_func_end ov02_02252BA4

	thumb_func_start ov02_02252DF8
ov02_02252DF8: @ 0x02252DF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	str r0, [sp, #8]
	adds r0, #0x14
	str r0, [sp, #8]
	adds r0, r5, #0
	str r0, [sp, #4]
	adds r0, #0x34
	str r0, [sp, #4]
	movs r7, #0x14
_02252E14:
	ldr r1, [sp]
	movs r0, #0x28
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #4]
	movs r4, #0
	adds r6, r0, r2
_02252E22:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r6, r0
	adds r1, r5, #4
	bl FUN_021FBE80
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	blo _02252E22
	ldr r0, [sp]
	lsls r1, r0, #4
	ldr r0, [sp, #8]
	adds r0, r0, r1
	bl FUN_021FBDA8
	ldr r0, [sp]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	cmp r0, #2
	blo _02252E14
	movs r0, #0x61
	lsls r0, r0, #2
	movs r4, #0
	adds r6, r5, r0
	movs r7, #0x14
_02252E5C:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r6, r0
	adds r1, r5, #4
	bl FUN_021FBE80
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	blo _02252E5C
	movs r0, #0x5d
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_021FBDA8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_02252DF8

	thumb_func_start ov02_02252E80
ov02_02252E80: @ 0x02252E80
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	adds r7, r2, #0
	movs r4, #0
	cmp r5, #0
	bls _02252EA4
_02252E8E:
	movs r0, #0x14
	muls r0, r4, r0
	adds r0, r6, r0
	adds r1, r7, #0
	bl FUN_021FBF20
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _02252E8E
_02252EA4:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov02_02252E80

	thumb_func_start ov02_02252EA8
ov02_02252EA8: @ 0x02252EA8
	push {r3, r4, r5, r6, r7, lr}
	movs r5, #0
	adds r6, r1, #0
	adds r7, r0, #0
	adds r4, r5, #0
	cmp r6, #0
	bls _02252ED8
_02252EB6:
	movs r0, #0x14
	muls r0, r4, r0
	movs r1, #1
	adds r0, r7, r0
	lsls r1, r1, #0xc
	bl FUN_021FBEE4
	cmp r0, #0
	beq _02252ECE
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_02252ECE:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _02252EB6
_02252ED8:
	cmp r5, r6
	bne _02252EE0
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02252EE0:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02252EA8

	thumb_func_start ov02_02252EE4
ov02_02252EE4: @ 0x02252EE4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0xb
	movs r1, #0xf0
	bl FUN_0201AACC
	adds r6, r0, #0
	movs r1, #0
	movs r2, #0xf0
	blx FUN_020D4994
	adds r0, r6, #0
	str r5, [r6]
	adds r0, #0xef
	strb r4, [r0]
	ldr r0, [r5, #0x10]
	ldr r1, _02252F10 @ =ov02_02252F14
	adds r2, r6, #0
	bl FUN_02050530
	pop {r4, r5, r6, pc}
	.align 2, 0
_02252F10: .4byte ov02_02252F14
	thumb_func_end ov02_02252EE4

	thumb_func_start ov02_02252F14
ov02_02252F14: @ 0x02252F14
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl FUN_02050654
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0205064C
	adds r0, r5, #0
	bl FUN_02050650
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #4
	bhi _02252FD4
	adds r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_02252F40: @ jump table
	.2byte _02252F4A - _02252F40 - 2 @ case 0
	.2byte _02252F6A - _02252F40 - 2 @ case 1
	.2byte _02252F96 - _02252F40 - 2 @ case 2
	.2byte _02252FB6 - _02252F40 - 2 @ case 3
	.2byte _02252FC4 - _02252F40 - 2 @ case 4
_02252F4A:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	movs r1, #0
	str r0, [sp, #8]
	ldr r3, _02253008 @ =0x00007FFF
	movs r0, #3
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02252FD4
_02252F6A:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02252FD4
	adds r0, r5, #0
	bl ov02_0225300C
	movs r0, #2
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldr r3, _02253008 @ =0x00007FFF
	movs r0, #3
	movs r2, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02252FD4
_02252F96:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02252FD4
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0xec
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0xed
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02252FD4
_02252FB6:
	adds r0, #0xed
	ldrb r0, [r0]
	cmp r0, #0
	beq _02252FD4
	adds r0, r1, #1
	str r0, [r4]
	b _02252FD4
_02252FC4:
	bl ov02_02253108
	adds r0, r5, #0
	bl FUN_0201AB0C
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_02252FD4:
	adds r0, r5, #0
	adds r0, #0xec
	ldrb r0, [r0]
	cmp r0, #0
	beq _02252FEE
	adds r0, r5, #0
	adds r0, #0x24
	movs r1, #4
	bl ov02_02252EA8
	adds r1, r5, #0
	adds r1, #0xed
	strb r0, [r1]
_02252FEE:
	adds r0, r5, #0
	adds r0, #0xee
	ldrb r0, [r0]
	cmp r0, #0
	beq _02253000
	adds r5, #0x74
	adds r0, r5, #0
	bl FUN_021FBF68
_02253000:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02253008: .4byte 0x00007FFF
	thumb_func_end ov02_02252F14

	thumb_func_start ov02_0225300C
ov02_0225300C: @ 0x0225300C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	ldr r4, _02253100 @ =0x02253D24
	adds r7, r0, #0
	add r3, sp, #0x2c
	movs r2, #6
_02253018:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02253018
	ldr r3, _02253104 @ =0x02253D08
	add r2, sp, #0x20
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #4
	str r0, [r2]
	adds r0, r7, #4
	movs r2, #0x20
	bl FUN_0201AC14
	adds r2, r7, #0
	adds r2, #0xef
	ldrb r2, [r2]
	adds r0, r7, #0
	adds r0, #0x14
	lsls r3, r2, #2
	add r2, sp, #0x20
	ldr r2, [r2, r3]
	movs r1, #0xae
	movs r3, #4
	bl FUN_021FBCD8
	adds r0, r7, #4
	str r0, [sp, #0x10]
	adds r0, r7, #0
	str r0, [sp, #8]
	adds r0, #0x24
	str r0, [sp, #8]
	adds r0, r7, #0
	str r0, [sp, #0xc]
	adds r0, #0x14
	movs r4, #0
	str r0, [sp, #0xc]
_02253064:
	movs r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x10]
	adds r3, r7, #0
	str r0, [sp, #4]
	adds r3, #0xef
	ldrb r3, [r3]
	movs r0, #0x14
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, [sp, #8]
	lsls r6, r3, #4
	add r3, sp, #0x2c
	adds r0, r0, r1
	lsls r5, r4, #2
	adds r3, r3, r6
	ldr r1, [sp, #0xc]
	ldr r3, [r5, r3]
	movs r2, #0xae
	bl FUN_021FBE44
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _02253064
	adds r0, r7, #0
	adds r1, r7, #0
	adds r0, #0x74
	adds r1, #0x14
	bl FUN_021FBF2C
	adds r6, r7, #0
	adds r5, r7, #0
	movs r4, #0
	adds r6, #0x74
	adds r5, #0x24
_022530AE:
	movs r1, #0x14
	muls r1, r4, r1
	adds r0, r6, #0
	adds r1, r5, r1
	bl FUN_021FBF50
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _022530AE
	adds r0, r7, #0
	adds r0, #0x74
	movs r1, #1
	bl FUN_021FC004
	adds r0, r7, #0
	adds r0, #0x24
	movs r1, #4
	movs r2, #0
	bl ov02_02252E80
	ldr r0, [r7]
	bl FUN_02069D68
	add r1, sp, #0x14
	bl FUN_0205F944
	adds r0, r7, #0
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r0, #0x74
	bl FUN_021FC00C
	movs r0, #1
	adds r7, #0xee
	strb r0, [r7]
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_02253100: .4byte 0x02253D24
_02253104: .4byte 0x02253D08
	thumb_func_end ov02_0225300C

	thumb_func_start ov02_02253108
ov02_02253108: @ 0x02253108
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	movs r4, #0
	adds r6, #0x24
	movs r7, #0x14
_02253114:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r6, r0
	adds r1, r5, #4
	bl FUN_021FBE80
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _02253114
	adds r5, #0x14
	adds r0, r5, #0
	bl FUN_021FBDA8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02253108

	thumb_func_start ov02_02253134
ov02_02253134: @ 0x02253134
	push {r3, r4, r5, r6, r7, lr}
	bl FUN_0202C028
	bl FUN_0202B9E0
	ldr r6, _02253168 @ =0x02253D54
	adds r5, r0, #0
	movs r4, #0
	movs r7, #1
_02253146:
	ldrb r1, [r6, r4]
	adds r0, r5, #0
	adds r2, r7, #0
	bl FUN_0202BA2C
	cmp r0, #1
	bne _02253158
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02253158:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x27
	blo _02253146
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02253168: .4byte 0x02253D54
	thumb_func_end ov02_02253134

	thumb_func_start ov02_0225316C
ov02_0225316C: @ 0x0225316C
	push {r3, lr}
	bl FUN_0201FD44
	movs r1, #0x27
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _02253184 @ =0x02253D54
	ldrb r0, [r0, r1]
	pop {r3, pc}
	nop
_02253184: .4byte 0x02253D54
	thumb_func_end ov02_0225316C

	thumb_func_start ov02_02253188
ov02_02253188: @ 0x02253188
	push {r3, r4, r5, lr}
	bl FUN_0202C028
	bl FUN_0202B9E0
	adds r4, r0, #0
	movs r5, #0
_02253196:
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_0202BA5C
	cmp r0, #0
	bne _022531A6
	movs r0, #0
	pop {r3, r4, r5, pc}
_022531A6:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xe
	blo _02253196
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02253188

	thumb_func_start ov02_022531B4
ov02_022531B4: @ 0x022531B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r4, #0
	adds r1, r4, #0
	adds r3, r4, #0
	add r2, sp, #0
_022531C0:
	strb r3, [r2, r1]
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0xe
	blo _022531C0
	bl FUN_0202C028
	bl FUN_0202B9E0
	adds r6, r0, #0
	movs r5, #0
	add r7, sp, #0
_022531DA:
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0202BA5C
	cmp r0, #0
	bne _022531EE
	adds r0, r4, #1
	lsls r0, r0, #0x18
	strb r5, [r7, r4]
	lsrs r4, r0, #0x18
_022531EE:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xe
	blo _022531DA
	cmp r4, #0
	bne _02253206
	bl GF_AssertFail
	add sp, #0x10
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02253206:
	bl FUN_0201FD44
	adds r1, r4, #0
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	add r0, sp, #0
	ldrb r0, [r0, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022531B4

	.rodata

_0225321C:
	.byte 0x0B, 0x00, 0x04, 0x00
	.byte 0x05, 0x00, 0x43, 0x00, 0x42, 0x00, 0x44, 0x00, 0x45, 0x00, 0x46, 0x00, 0x47, 0x00, 0x3B, 0x00
	.byte 0x3C, 0x00, 0x3D, 0x00, 0x3E, 0x00, 0x3F, 0x00, 0x40, 0x00, 0x48, 0x00, 0x49, 0x00, 0x4A, 0x00
	.byte 0x39, 0x00, 0x38, 0x00, 0x3A, 0x00, 0x07, 0x00, 0x08, 0x00, 0x09, 0x00, 0x01, 0x09, 0x0A, 0x0E
	.byte 0x02, 0x00, 0x80, 0x00, 0xAE, 0x00, 0x37, 0x03, 0x40, 0x32, 0x25, 0x02, 0xAE, 0x00, 0x41, 0x03
	.byte 0x22, 0x32, 0x25, 0x02, 0xAE, 0x00, 0x0A, 0x01, 0x1C, 0x32, 0x25, 0x02, 0x7E, 0x08, 0x00, 0x00
	.byte 0xAE, 0x00, 0x03, 0x02, 0x1E, 0x32, 0x25, 0x02, 0x7F, 0x08, 0x00, 0x00, 0xAE, 0x00, 0x06, 0x03
	.byte 0x46, 0x32, 0x25, 0x02, 0x81, 0x08, 0x00, 0x00, 0x1A, 0x1B, 0x00, 0x00, 0x16, 0x17, 0x18, 0x19
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xEC, 0x32, 0x25, 0x02, 0x05, 0x00, 0x00, 0x00
	.byte 0xDC, 0x32, 0x25, 0x02, 0x07, 0x00, 0x00, 0x00, 0xE4, 0x32, 0x25, 0x02, 0x04, 0x00, 0x00, 0x00
	.byte 0x8C, 0x32, 0x25, 0x02, 0x02, 0x00, 0x00, 0x00, 0x88, 0x32, 0x25, 0x02, 0x11, 0x12, 0x13, 0x14
	.byte 0x15, 0x00, 0x00, 0x00, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x00, 0x00, 0x01, 0x02, 0x03
	.byte 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x00, 0x00, 0x11, 0x8E, 0x24, 0x02, 0x07, 0x00, 0x08, 0x00
	.byte 0x29, 0xAC, 0x24, 0x02, 0x11, 0x00, 0x14, 0x00, 0x17, 0x00, 0x13, 0x00, 0x16, 0x00, 0x19, 0x00
	.byte 0x12, 0x00, 0x15, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0xF8, 0x32, 0x25, 0x02, 0xD0, 0x34, 0x25, 0x02, 0x01, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0xE1, 0xAC, 0x24, 0x02, 0xED, 0xAD, 0x24, 0x02, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x40, 0x05, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x80, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00
	.byte 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x12, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0x00, 0xF0, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x33, 0x25, 0x02, 0x30, 0x33, 0x25, 0x02, 0x20, 0x34, 0x25, 0x02, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x08, 0x00, 0x00, 0xF0, 0x04, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x08, 0x00, 0x00, 0x80, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x12, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x71, 0xAF, 0x24, 0x02, 0xE1, 0xB0, 0x24, 0x02, 0x59, 0xB1, 0x24, 0x02, 0x95, 0xB2, 0x24, 0x02
	.byte 0x00, 0xC0, 0xFF, 0xFF, 0x00, 0xA0, 0xFF, 0xFF, 0x00, 0x90, 0xFF, 0xFF, 0x00, 0x80, 0xFF, 0xFF
	.byte 0x08, 0x00, 0x00, 0x00, 0xD1, 0xB6, 0x24, 0x02, 0xD5, 0x8D, 0x06, 0x02, 0xE5, 0xB6, 0x24, 0x02
	.byte 0xD1, 0x8D, 0x06, 0x02, 0x74, 0x00, 0x00, 0x00, 0x99, 0x8D, 0x24, 0x02, 0xE5, 0x8D, 0x24, 0x02
	.byte 0xF1, 0x8D, 0x24, 0x02, 0xD1, 0x8D, 0x06, 0x02, 0x24, 0x00, 0x00, 0x00, 0x81, 0xAA, 0x24, 0x02
	.byte 0xC9, 0xAA, 0x24, 0x02, 0xD5, 0xAA, 0x24, 0x02, 0x55, 0xAB, 0x24, 0x02, 0x68, 0x00, 0x00, 0x00
	.byte 0xCD, 0xAB, 0x24, 0x02, 0xF9, 0xAB, 0x24, 0x02, 0x05, 0xAC, 0x24, 0x02, 0x25, 0xAC, 0x24, 0x02
	.byte 0x0C, 0x00, 0x00, 0x00, 0xCD, 0xB7, 0x24, 0x02, 0x05, 0xB8, 0x24, 0x02, 0x09, 0xB8, 0x24, 0x02
	.byte 0x7D, 0xB8, 0x24, 0x02, 0x24, 0x00, 0x00, 0x00, 0x51, 0xB3, 0x24, 0x02, 0xD5, 0x8D, 0x06, 0x02
	.byte 0xFD, 0xB3, 0x24, 0x02, 0xD1, 0x8D, 0x06, 0x02, 0x95, 0xB4, 0x24, 0x02, 0xAD, 0xB4, 0x24, 0x02
	.byte 0xF1, 0xB5, 0x24, 0x02, 0x39, 0xB6, 0x24, 0x02, 0x65, 0xB6, 0x24, 0x02, 0x8D, 0xB6, 0x24, 0x02
	.byte 0x89, 0x8F, 0x24, 0x02, 0x89, 0x90, 0x24, 0x02, 0xBD, 0x90, 0x24, 0x02, 0xA9, 0x91, 0x24, 0x02
	.byte 0xCD, 0x91, 0x24, 0x02, 0x91, 0x92, 0x24, 0x02, 0x9D, 0x93, 0x24, 0x02, 0xED, 0x93, 0x24, 0x02
	.byte 0xD1, 0x95, 0x24, 0x02, 0x5D, 0x9A, 0x24, 0x02, 0x39, 0xB9, 0x24, 0x02, 0x65, 0xB9, 0x24, 0x02
	.byte 0xD9, 0x9A, 0x24, 0x02, 0xF1, 0x9A, 0x24, 0x02, 0x81, 0x9B, 0x24, 0x02, 0xA9, 0x9B, 0x24, 0x02
	.byte 0x75, 0x9C, 0x24, 0x02, 0xD9, 0x9C, 0x24, 0x02, 0x55, 0x99, 0x24, 0x02, 0x7D, 0x99, 0x24, 0x02
	.byte 0x00, 0x40, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0xC0, 0xFE, 0xFF, 0x00, 0x80, 0xFE, 0xFF
	.byte 0x00, 0x60, 0xFE, 0xFF, 0x00, 0x40, 0xFE, 0xFF, 0x00, 0x40, 0xFE, 0xFF, 0x00, 0x40, 0xFE, 0xFF
	.byte 0x00, 0x60, 0xFE, 0xFF, 0x00, 0x80, 0xFE, 0xFF, 0x00, 0xA0, 0xFE, 0xFF, 0x00, 0xC0, 0xFE, 0xFF
	.byte 0xB9, 0x95, 0x24, 0x02, 0xE9, 0x95, 0x24, 0x02, 0x59, 0x96, 0x24, 0x02, 0x91, 0x96, 0x24, 0x02
	.byte 0xD1, 0x96, 0x24, 0x02, 0x55, 0x97, 0x24, 0x02, 0x75, 0x97, 0x24, 0x02, 0xC1, 0x97, 0x24, 0x02
	.byte 0x39, 0x98, 0x24, 0x02, 0x59, 0x98, 0x24, 0x02, 0xBD, 0x98, 0x24, 0x02, 0x41, 0x99, 0x24, 0x02
	.byte 0x69, 0x99, 0x24, 0x02, 0x7D, 0x99, 0x24, 0x02, 0xB9, 0x95, 0x24, 0x02, 0xED, 0x99, 0x24, 0x02
	.byte 0x59, 0x96, 0x24, 0x02, 0x91, 0x96, 0x24, 0x02, 0xD1, 0x96, 0x24, 0x02, 0x55, 0x97, 0x24, 0x02
	.byte 0x75, 0x97, 0x24, 0x02, 0xC1, 0x97, 0x24, 0x02, 0x39, 0x98, 0x24, 0x02, 0x59, 0x98, 0x24, 0x02
	.byte 0xC5, 0x9A, 0x24, 0x02, 0xD9, 0x9A, 0x24, 0x02, 0xF1, 0x9A, 0x24, 0x02, 0x11, 0x9B, 0x24, 0x02
	.byte 0x39, 0x9B, 0x24, 0x02, 0x61, 0x9B, 0x24, 0x02, 0xA9, 0x9B, 0x24, 0x02, 0xD9, 0x9B, 0x24, 0x02
	.byte 0x75, 0x9C, 0x24, 0x02, 0xD9, 0x9C, 0x24, 0x02, 0x41, 0x99, 0x24, 0x02, 0x69, 0x99, 0x24, 0x02
	.byte 0x7D, 0x99, 0x24, 0x02, 0x00, 0xF0, 0x00, 0x00, 0x00, 0xF0, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x85, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x04, 0x00, 0x00, 0x30, 0x04, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x85, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0x00, 0xD0, 0x03, 0x00, 0x00, 0x80, 0x01, 0x00, 0x80, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0F, 0x00, 0x00, 0x50, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x85, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x02, 0x00, 0x00, 0xE0, 0x04, 0x00, 0x00, 0x80, 0x01, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80, 0x04, 0x00, 0x00, 0xB0, 0x05, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x85, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00
	.byte 0x00, 0x60, 0x05, 0x00, 0x00, 0x80, 0x01, 0x00, 0x80, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x03, 0x00, 0x00, 0x40, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x85, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x05, 0x00, 0x00, 0xD0, 0x06, 0x00, 0x00, 0x80, 0x01, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x09, 0x00, 0x00, 0x40, 0x06, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x85, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x01, 0x00
	.byte 0x00, 0xE0, 0x07, 0x00, 0x00, 0x80, 0x01, 0x00, 0x80, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0xC0, 0x08, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0x80, 0x01, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x0D, 0x00, 0x00, 0xC0, 0x07, 0x00, 0x00, 0x80, 0x01, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x8A, 0x00, 0x00, 0x00
	.byte 0x35, 0xC2, 0x24, 0x02, 0xA9, 0xC2, 0x24, 0x02, 0xED, 0xC2, 0x24, 0x02, 0x39, 0xC3, 0x24, 0x02
	.byte 0x5D, 0xC0, 0x24, 0x02, 0xB1, 0xC0, 0x24, 0x02, 0x4D, 0xC1, 0x24, 0x02, 0xB9, 0xC1, 0x24, 0x02
	.byte 0x7D, 0xC8, 0x24, 0x02, 0xD1, 0xC8, 0x24, 0x02, 0x3D, 0xC9, 0x24, 0x02, 0xB9, 0xC9, 0x24, 0x02
	.byte 0x39, 0xCA, 0x24, 0x02, 0xB5, 0xC4, 0x24, 0x02, 0xD9, 0xC4, 0x24, 0x02, 0x1D, 0xC7, 0x24, 0x02
	.byte 0x5D, 0xC7, 0x24, 0x02, 0xD5, 0xC7, 0x24, 0x02, 0x41, 0xC8, 0x24, 0x02, 0x81, 0xC6, 0x24, 0x02
	.byte 0x99, 0xC6, 0x24, 0x02, 0xDD, 0xC6, 0x24, 0x02, 0x5D, 0xC7, 0x24, 0x02, 0xD5, 0xC7, 0x24, 0x02
	.byte 0x41, 0xC8, 0x24, 0x02, 0xB5, 0xC4, 0x24, 0x02, 0xD9, 0xC4, 0x24, 0x02, 0x7D, 0xC8, 0x24, 0x02
	.byte 0xD1, 0xC8, 0x24, 0x02, 0x3D, 0xC9, 0x24, 0x02, 0xB9, 0xC9, 0x24, 0x02, 0x39, 0xCA, 0x24, 0x02
	.byte 0x01, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00
	.byte 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0xFE, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x03, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x03, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x04, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x05, 0x00, 0x01, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x10, 0x0F, 0x0E, 0x0B
	.byte 0x0C, 0x09, 0xB4, 0x00, 0x00, 0x00, 0x0E, 0x01, 0x5A, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00
	.byte 0xF0, 0x00, 0x00, 0x00, 0x11, 0xD3, 0x24, 0x02, 0xA5, 0xD3, 0x24, 0x02, 0xB5, 0xD3, 0x24, 0x02
	.byte 0xE9, 0xD3, 0x24, 0x02, 0x00, 0x04, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00, 0xB5, 0xD5, 0x24, 0x02
	.byte 0x49, 0xD6, 0x24, 0x02, 0x59, 0xD6, 0x24, 0x02, 0x71, 0xD6, 0x24, 0x02, 0x00, 0x04, 0x00, 0x00
	.byte 0x14, 0x01, 0x00, 0x00, 0xA5, 0xDA, 0x24, 0x02, 0x8D, 0xDB, 0x24, 0x02, 0x9D, 0xDB, 0x24, 0x02
	.byte 0x59, 0xDC, 0x24, 0x02, 0x00, 0x04, 0x00, 0x00, 0xCC, 0x01, 0x00, 0x00, 0x3D, 0xD4, 0x24, 0x02
	.byte 0x69, 0xD4, 0x24, 0x02, 0x89, 0xD4, 0x24, 0x02, 0x81, 0xD5, 0x24, 0x02, 0x00, 0x04, 0x00, 0x00
	.byte 0x10, 0x0D, 0x00, 0x00, 0x81, 0xD8, 0x24, 0x02, 0x15, 0xD9, 0x24, 0x02, 0x51, 0xD9, 0x24, 0x02
	.byte 0x8D, 0xD9, 0x24, 0x02, 0x00, 0x04, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00, 0xE5, 0xD1, 0x24, 0x02
	.byte 0x79, 0xD2, 0x24, 0x02, 0x89, 0xD2, 0x24, 0x02, 0xBD, 0xD2, 0x24, 0x02, 0x00, 0x04, 0x00, 0x00
	.byte 0xF0, 0x00, 0x00, 0x00, 0x59, 0xD3, 0x24, 0x02, 0xA5, 0xD3, 0x24, 0x02, 0xB5, 0xD3, 0x24, 0x02
	.byte 0xE9, 0xD3, 0x24, 0x02, 0x00, 0x04, 0x00, 0x00, 0x14, 0x01, 0x00, 0x00, 0xC1, 0xD9, 0x24, 0x02
	.byte 0x8D, 0xDB, 0x24, 0x02, 0x9D, 0xDB, 0x24, 0x02, 0x59, 0xDC, 0x24, 0x02, 0x00, 0x04, 0x00, 0x00
	.byte 0xF0, 0x00, 0x00, 0x00, 0x2D, 0xD2, 0x24, 0x02, 0x79, 0xD2, 0x24, 0x02, 0x89, 0xD2, 0x24, 0x02
	.byte 0xBD, 0xD2, 0x24, 0x02, 0x00, 0x04, 0x00, 0x00, 0x9C, 0x0E, 0x00, 0x00, 0xB1, 0xDC, 0x24, 0x02
	.byte 0x4D, 0xDD, 0x24, 0x02, 0x8D, 0xDD, 0x24, 0x02, 0xC9, 0xDD, 0x24, 0x02, 0x00, 0x04, 0x00, 0x00
	.byte 0x9C, 0x0E, 0x00, 0x00, 0x39, 0xDD, 0x24, 0x02, 0x4D, 0xDD, 0x24, 0x02, 0x8D, 0xDD, 0x24, 0x02
	.byte 0xC9, 0xDD, 0x24, 0x02, 0xF1, 0xD2, 0x24, 0x02, 0x1D, 0xD4, 0x24, 0x02, 0x1D, 0xD4, 0x24, 0x02
	.byte 0xF1, 0xD2, 0x24, 0x02, 0x8D, 0xDC, 0x24, 0x02, 0x8D, 0xDC, 0x24, 0x02, 0xC9, 0xD2, 0x24, 0x02
	.byte 0xF5, 0xD3, 0x24, 0x02, 0x09, 0xD4, 0x24, 0x02, 0xDD, 0xD2, 0x24, 0x02, 0x65, 0xDC, 0x24, 0x02
	.byte 0x79, 0xDC, 0x24, 0x02, 0xF9, 0xD2, 0x24, 0x02, 0x25, 0xD4, 0x24, 0x02, 0x25, 0xD4, 0x24, 0x02
	.byte 0xF9, 0xD2, 0x24, 0x02, 0x95, 0xDC, 0x24, 0x02, 0x95, 0xDC, 0x24, 0x02, 0xFF, 0x01, 0xFF, 0x01
	.byte 0x01, 0xFF, 0x00, 0x00, 0x01, 0x02, 0x04, 0x08, 0x10, 0x00, 0x00, 0x00, 0xB5, 0x00, 0x00, 0x00
	.byte 0xB6, 0x00, 0x00, 0x00, 0xB7, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00
	.byte 0x49, 0x00, 0x01, 0x00, 0x30, 0x00, 0x01, 0x00, 0x3E, 0x00, 0x01, 0x00, 0x4A, 0x00, 0x01, 0x00
	.byte 0xFE, 0x00, 0x00, 0x00, 0x49, 0x00, 0x01, 0x00, 0x31, 0x00, 0x01, 0x00, 0x3E, 0x00, 0x01, 0x00
	.byte 0x4A, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x49, 0x00, 0x01, 0x00, 0x32, 0x00, 0x01, 0x00
	.byte 0x3E, 0x00, 0x01, 0x00, 0x4A, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x49, 0x00, 0x01, 0x00
	.byte 0x33, 0x00, 0x01, 0x00, 0x3E, 0x00, 0x01, 0x00, 0x4A, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x2F, 0x30, 0x31, 0x32
	.byte 0x33, 0x34, 0x00, 0x00, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0xB8, 0x04, 0x00, 0x00, 0xC5, 0x0B, 0x25, 0x02, 0xC1, 0x0E, 0x25, 0x02, 0x1D, 0x0F, 0x25, 0x02
	.byte 0xE1, 0x0F, 0x25, 0x02, 0x00, 0xD0, 0xF3, 0xFF, 0x52, 0xB6, 0xF6, 0xFF, 0xEF, 0x2C, 0xFD, 0xFF
	.byte 0x00, 0x60, 0x0C, 0x00, 0x52, 0xB6, 0xF6, 0xFF, 0xEF, 0x2C, 0xFD, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xF9, 0xC3, 0xFD, 0xFF, 0x3D, 0x8F, 0xFE, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x1E, 0xFA, 0x1E, 0x00
	.byte 0xAE, 0xCB, 0x01, 0x00, 0x00, 0x10, 0xF8, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF3, 0xFF
	.byte 0x00, 0xF0, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF3, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xFA, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xF0, 0xE4, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xF1, 0xFF
	.byte 0xC1, 0xAE, 0x29, 0x00, 0x62, 0xF5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05
	.byte 0x00, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0x62, 0xF5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0x62, 0xF7, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x0C, 0x00, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x29, 0x00
	.byte 0xA2, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x0C, 0x00, 0x00, 0x00, 0x00
	.byte 0xC1, 0xAE, 0x29, 0x00, 0xE2, 0xDF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05
	.byte 0x00, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0xE2, 0xDF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0xF2, 0xDE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x29, 0x00
	.byte 0xF2, 0xDE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00
	.byte 0xC1, 0xAE, 0x29, 0x00, 0xF2, 0xDE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x55, 0x00, 0x01, 0x00, 0x09, 0x00, 0x5D, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00
	.byte 0x8E, 0x00, 0x01, 0x00, 0x18, 0x00, 0x8F, 0x00, 0x01, 0x00, 0x18, 0x00, 0x90, 0x00, 0x01, 0x00
	.byte 0x18, 0x00, 0x91, 0x00, 0x01, 0x00, 0x18, 0x00, 0x92, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0xFF, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x4C, 0x00, 0x00, 0x00
	.byte 0x4E, 0x00, 0x00, 0x00, 0x4D, 0x00, 0x00, 0x00, 0x56, 0x00, 0x00, 0x00, 0x57, 0x00, 0x00, 0x00
	.byte 0x4F, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x53, 0x00, 0x00, 0x00
	.byte 0x54, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00
	.byte 0x59, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00
	.byte 0x5D, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x62, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00
	.byte 0x61, 0x00, 0x00, 0x00, 0x2F, 0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F, 0x40, 0x41, 0x42
	.byte 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52
	.byte 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5A, 0x5B, 0x5F, 0x60, 0x00

	.data

_02253D80:
	.byte 0x2E, 0x32, 0x25, 0x02, 0x34, 0x32, 0x25, 0x02, 0x28, 0x32, 0x25, 0x02, 0x3A, 0x32, 0x25, 0x02
	.byte 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0x48, 0x00, 0x00
	.byte 0x00, 0xC0, 0x00, 0x00, 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00
	.byte 0x00, 0xC0, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0xC0, 0x00, 0x00
	.byte 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0x48, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xB8, 0xFF, 0xFF
	.byte 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00
	.byte 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0xC0, 0x00, 0x00
	.byte 0x00, 0x48, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00
