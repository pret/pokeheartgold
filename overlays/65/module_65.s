
	thumb_func_start ov65_0221BE20
ov65_0221BE20: @ 0x0221BE20
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0221BF9C @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _0221BFA0 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	ldr r2, _0221BFA4 @ =0x00070FA0
	movs r0, #3
	movs r1, #0x1a
	bl FUN_0201A910
	movs r0, #4
	movs r1, #0x1a
	bl FUN_02002CEC
	movs r0, #0x34
	movs r1, #0x1a
	bl FUN_02007688
	adds r5, r0, #0
	ldr r1, _0221BFA8 @ =0x000036CC
	adds r0, r6, #0
	movs r2, #0x1a
	bl FUN_02007280
	adds r4, r0, #0
	ldr r2, _0221BFA8 @ =0x000036CC
	movs r0, #0
	adds r1, r4, #0
	blx FUN_020D4858
	movs r0, #0x1a
	bl FUN_0201AC88
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r4, r1]
	movs r0, #0xc
	movs r1, #0x16
	movs r2, #0x1a
	bl FUN_0200BD18
	movs r1, #0x61
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x1a
	bl FUN_0200BD08
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x1a
	bl FUN_0200BD08
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xb7
	movs r3, #0x1a
	bl FUN_0200BAF8
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #0
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov65_0221D0EC
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	bl ov65_0221CE98
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov65_0221CEB8
	movs r0, #0x10
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x1a
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov65_0221D280
	ldr r0, _0221BFAC @ =ov65_0221CE1C
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl ov65_0221D3B8
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov65_0221D3E8
	adds r0, r4, #0
	bl ov65_0221D930
	movs r0, #6
	ldr r2, [r4, #8]
	lsls r0, r0, #6
	ldr r1, _0221BFB0 @ =0x00000444
	ldr r0, [r4, r0]
	ldr r2, [r2, #0x18]
	adds r1, r4, r1
	bl ov65_0221F8D0
	ldr r0, [r4, #8]
	adds r1, r4, #0
	ldr r0, [r0]
	str r0, [r4]
	bl FUN_0208F7E0
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221BFB4 @ =0x000005B4
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0x14
	movs r2, #1
	bl ov65_0221FB90
	ldr r0, [r4]
	bl FUN_0208F658
	movs r0, #0
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r1, #6
	lsls r1, r1, #6
	ldr r1, [r4, r1]
	movs r0, #0x1a
	bl FUN_020399FC
	bl FUN_0203A880
	bl FUN_02014804
	ldr r1, _0221BFB8 @ =0x00000427
	movs r0, #0
	bl FUN_02055198
	ldr r0, _0221BFB8 @ =0x00000427
	bl FUN_02005448
	adds r0, r5, #0
	bl FUN_0200770C
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0221BF9C: .4byte 0xFFFFE0FF
_0221BFA0: .4byte 0x04001000
_0221BFA4: .4byte 0x00070FA0
_0221BFA8: .4byte 0x000036CC
_0221BFAC: .4byte ov65_0221CE1C
_0221BFB0: .4byte 0x00000444
_0221BFB4: .4byte 0x000005B4
_0221BFB8: .4byte 0x00000427
	thumb_func_end ov65_0221BE20

	thumb_func_start ov65_0221BFBC
ov65_0221BFBC: @ 0x0221BFBC
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r1, [sp, #0x10]
	adds r4, r2, #0
	lsls r1, r1, #4
	adds r1, #0x92
	movs r2, #2
	ldr r0, [r0, #0x14]
	adds r6, r3, #0
	lsls r1, r1, #5
	lsls r2, r2, #8
	blx FUN_020CFE74
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_02074364
	adds r1, r0, #0
	ldr r0, [sp, #0x14]
	adds r1, #0xa
	bl FUN_02024A74
	pop {r4, r5, r6, pc}
	thumb_func_end ov65_0221BFBC

	thumb_func_start ov65_0221BFEC
ov65_0221BFEC: @ 0x0221BFEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	bl FUN_0203769C
	bl FUN_02034818
	adds r4, r0, #0
	bl FUN_0203769C
	movs r1, #1
	eors r0, r1
	bl FUN_02034818
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #0x1a
	bl FUN_02028F68
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x1a
	bl FUN_02028F68
	adds r6, r0, #0
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x32
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221C080 @ =0x00000444
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0xa
	movs r3, #0
	bl ov65_0221FB4C
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221C084 @ =0x00000454
	adds r1, r6, #0
	adds r0, r5, r0
	movs r2, #0xa
	movs r3, #0
	bl ov65_0221FB4C
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221C088 @ =0x000004A4
	adds r1, r7, #0
	adds r0, r5, r0
	movs r2, #5
	movs r3, #0
	bl ov65_0221FB4C
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221C080: .4byte 0x00000444
_0221C084: .4byte 0x00000454
_0221C088: .4byte 0x000004A4
	thumb_func_end ov65_0221BFEC

	thumb_func_start ov65_0221C08C
ov65_0221C08C: @ 0x0221C08C
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x34
	movs r1, #0x1a
	bl FUN_02007688
	adds r4, r0, #0
	bl ov65_0221CE98
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl ov65_0221CEB8
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov65_0221D280
	adds r0, r5, #0
	bl ov65_0221C1C4
	adds r0, r5, #0
	bl ov65_0221BFEC
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x18]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, _0221C1AC @ =0x000003D9
	movs r1, #0
	movs r3, #0xa
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, _0221C1B0 @ =0x000003F7
	movs r3, #0xb
	bl FUN_0200E3DC
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r5, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221C1B4 @ =0x00000594
	ldr r3, [r5, r3]
	adds r0, r5, r0
	movs r1, #0xf
	movs r2, #1
	bl ov65_0221FB90
	movs r0, #4
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #5
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #6
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BC28
	movs r0, #2
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #3
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	bl ov65_0221D3B8
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov65_0221D3E8
	adds r0, r5, #0
	bl ov65_0221D930
	ldr r0, _0221C1B8 @ =0x00002224
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r5, #0
	bl ov65_0221C46C
	ldr r0, _0221C1BC @ =0x00002228
	movs r1, #6
	ldr r0, [r5, r0]
	adds r2, r5, #0
	bl ov65_0221C46C
	movs r0, #0xd1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xd2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	ldr r0, _0221C1C0 @ =ov65_0221CE1C
	adds r1, r5, #0
	bl FUN_0201A0FC
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0221C1AC: .4byte 0x000003D9
_0221C1B0: .4byte 0x000003F7
_0221C1B4: .4byte 0x00000594
_0221C1B8: .4byte 0x00002224
_0221C1BC: .4byte 0x00002228
_0221C1C0: .4byte ov65_0221CE1C
	thumb_func_end ov65_0221C08C

	thumb_func_start ov65_0221C1C4
ov65_0221C1C4: @ 0x0221C1C4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x61
	ldr r1, _0221C240 @ =0x00002224
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	movs r2, #0
	bl ov65_0221C3DC
	movs r0, #0x61
	ldr r1, _0221C244 @ =0x00002228
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	movs r2, #6
	bl ov65_0221C3DC
	movs r0, #0
	movs r2, #0x61
	str r0, [sp]
	lsls r2, r2, #2
	ldr r3, _0221C240 @ =0x00002224
	ldr r0, _0221C248 @ =0x000004B4
	ldr r1, [r5, r2]
	adds r2, #0xc
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	adds r0, r5, r0
	bl ov65_0221C414
	movs r0, #6
	movs r2, #0x61
	str r0, [sp]
	lsls r2, r2, #2
	ldr r3, _0221C244 @ =0x00002228
	ldr r0, _0221C24C @ =0x00000514
	ldr r1, [r5, r2]
	adds r2, #0xc
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	adds r0, r5, r0
	bl ov65_0221C414
	ldr r0, _0221C240 @ =0x00002224
	ldr r0, [r5, r0]
	bl FUN_02074640
	adds r4, r0, #0
	ldr r0, _0221C244 @ =0x00002228
	ldr r0, [r5, r0]
	bl FUN_02074640
	adds r2, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl ov65_0221D25C
	pop {r3, r4, r5, pc}
	nop
_0221C240: .4byte 0x00002224
_0221C244: .4byte 0x00002228
_0221C248: .4byte 0x000004B4
_0221C24C: .4byte 0x00000514
	thumb_func_end ov65_0221C1C4

	thumb_func_start ov65_0221C250
ov65_0221C250: @ 0x0221C250
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	movs r6, #0
	cmp r1, #0
	beq _0221C270
	cmp r1, #1
	beq _0221C284
	cmp r1, #2
	bne _0221C26E
	b _0221C3AA
_0221C26E:
	b _0221C3B4
_0221C270:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0221C28A
	movs r0, #1
	str r0, [r5]
	adds r0, r4, #0
	bl ov65_0221BFEC
	b _0221C3B4
_0221C284:
	ldr r1, [r4, #0x54]
	cmp r1, #7
	bls _0221C28C
_0221C28A:
	b _0221C3B4
_0221C28C:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0221C298: @ jump table
	.2byte _0221C2A8 - _0221C298 - 2 @ case 0
	.2byte _0221C2B0 - _0221C298 - 2 @ case 1
	.2byte _0221C2B8 - _0221C298 - 2 @ case 2
	.2byte _0221C2D6 - _0221C298 - 2 @ case 3
	.2byte _0221C2F4 - _0221C298 - 2 @ case 4
	.2byte _0221C330 - _0221C298 - 2 @ case 5
	.2byte _0221C380 - _0221C298 - 2 @ case 6
	.2byte _0221C39C - _0221C298 - 2 @ case 7
_0221C2A8:
	bl ov65_0221C5E0
	str r0, [r4, #0x54]
	b _0221C3B4
_0221C2B0:
	bl ov65_0221CC0C
	str r0, [r4, #0x54]
	b _0221C3B4
_0221C2B8:
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x1a
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r6, #0
	adds r2, r6, #0
	adds r3, r6, #0
	bl FUN_0200FA24
	movs r0, #2
	str r0, [r5]
	b _0221C3B4
_0221C2D6:
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x1a
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r6, #0
	adds r2, r6, #0
	adds r3, r6, #0
	bl FUN_0200FA24
	movs r0, #4
	str r0, [r4, #0x54]
	b _0221C3B4
_0221C2F4:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0221C3B4
	adds r0, r4, #0
	bl ov65_0221CD0C
	adds r0, r4, #0
	bl ov65_0221CCB0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov65_0221D1C8
	movs r0, #1
	str r0, [r4, #0x50]
	movs r0, #5
	str r0, [r4, #0x54]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov65_0221E06C
	b _0221C3B4
_0221C330:
	ldr r0, [r4, #0x4c]
	bl FUN_020072A8
	cmp r0, #0
	beq _0221C3B4
	ldr r0, [r4, #0x4c]
	bl FUN_02007278
	adds r0, r4, #0
	bl ov65_0221C08C
	adds r0, r6, #0
	str r0, [r4, #0x50]
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r2, [r0]
	ldr r1, [r4, #0x48]
	movs r0, #6
	muls r0, r1, r0
	adds r1, r2, r0
	adds r0, r4, #0
	adds r0, #0x94
	str r1, [r0]
	adds r0, r4, #0
	bl ov65_0221CB5C
	adds r0, r4, #0
	movs r1, #0xd1
	adds r0, #0x94
	lsls r1, r1, #2
	ldr r0, [r0]
	ldr r1, [r4, r1]
	adds r2, r6, #0
	bl ov65_0221DD34
	bl FUN_0203A880
	movs r0, #6
	str r0, [r4, #0x54]
	b _0221C3B4
_0221C380:
	movs r0, #8
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x1a
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r1, #0
	adds r3, r6, #0
	bl FUN_0200FA24
	movs r0, #7
	str r0, [r4, #0x54]
	b _0221C3B4
_0221C39C:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0221C3B4
	movs r0, #1
	str r0, [r4, #0x54]
	b _0221C3B4
_0221C3AA:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0221C3B4
	movs r6, #1
_0221C3B4:
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _0221C3CA
	adds r0, r4, #0
	bl ov65_0221F714
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0202457C
_0221C3CA:
	movs r1, #6
	lsls r1, r1, #6
	ldr r1, [r4, r1]
	movs r0, #0x1a
	bl FUN_020399FC
	adds r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov65_0221C250

	thumb_func_start ov65_0221C3DC
ov65_0221C3DC: @ 0x0221C3DC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	adds r0, r5, #0
	adds r6, r2, #0
	movs r4, #0
	bl FUN_02074640
	cmp r0, #0
	ble _0221C412
_0221C3F0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02074644
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r4, r6
	bl FUN_0200BF8C
	adds r0, r5, #0
	adds r4, r4, #1
	bl FUN_02074640
	cmp r4, r0
	blt _0221C3F0
_0221C412:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov65_0221C3DC

	thumb_func_start ov65_0221C414
ov65_0221C414: @ 0x0221C414
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r0, r3, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r6, [sp, #0x28]
	movs r4, #0
	bl FUN_02074640
	cmp r0, #0
	ble _0221C466
	adds r7, r6, #1
_0221C430:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r2, r7, r4
	movs r3, #0x1a
	bl FUN_0200BC4C
	adds r6, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #8
	movs r3, #0
	bl ov65_0221FB4C
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, [sp, #0x10]
	adds r5, #0x10
	adds r4, r4, #1
	bl FUN_02074640
	cmp r4, r0
	blt _0221C430
_0221C466:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov65_0221C414

	thumb_func_start ov65_0221C46C
ov65_0221C46C: @ 0x0221C46C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x20]
	movs r7, #0
	bl FUN_02074640
	cmp r0, #0
	bgt _0221C482
	b _0221C584
_0221C482:
	ldr r1, _0221C5C4 @ =0x000007CC
	ldr r0, [sp, #0x20]
	adds r0, r0, r1
	str r0, [sp, #0x1c]
_0221C48A:
	ldr r0, [sp, #0xc]
	ldr r2, _0221C5C8 @ =0x000006A2
	adds r0, r7, r0
	str r0, [sp, #0x10]
	lsls r0, r0, #2
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	lsls r1, r0, #4
	ldr r0, [sp, #0x20]
	adds r4, r0, r1
	ldr r1, [sp, #0x18]
	ldrb r2, [r4, r2]
	adds r5, r0, r1
	ldr r0, _0221C5CC @ =0x0000069C
	ldr r1, _0221C5D0 @ =0x000006A1
	ldrh r0, [r4, r0]
	ldrb r1, [r4, r1]
	bl FUN_020741BC
	adds r1, r0, #0
	movs r0, #0x1a
	str r0, [sp]
	ldr r6, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	movs r0, #0x14
	movs r2, #0
	adds r3, r6, r3
	bl FUN_020079BC
	ldr r1, _0221C5D4 @ =0x0000079C
	str r0, [r5, r1]
	adds r0, r1, #0
	adds r0, #0x30
	ldr r0, [r5, r0]
	movs r1, #2
	ldr r0, [r0, #0x14]
	lsls r1, r1, #8
	blx FUN_020D2894
	ldr r0, [sp, #0x10]
	ldr r1, _0221C5CC @ =0x0000069C
	str r0, [sp]
	movs r0, #0xdf
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, _0221C5C8 @ =0x000006A2
	str r0, [sp, #4]
	ldr r3, _0221C5D0 @ =0x000006A1
	ldr r0, _0221C5C4 @ =0x000007CC
	ldrh r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	ldr r0, [r5, r0]
	bl ov65_0221BFBC
	movs r0, #0xdf
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	ldr r0, _0221C5D8 @ =0x0000069E
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _0221C51A
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	b _0221C542
_0221C51A:
	ldr r0, [sp, #0x10]
	lsls r1, r0, #2
	ldr r0, [sp, #0x20]
	adds r1, r0, r1
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	str r1, [sp, #0x14]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xeb
	ldr r1, [sp, #0x14]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, _0221C5D8 @ =0x0000069E
	ldrh r1, [r4, r1]
	adds r1, r1, #2
	bl FUN_020248F0
_0221C542:
	ldr r0, _0221C5DC @ =0x000006A8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0221C558
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	b _0221C578
_0221C558:
	ldr r0, [sp, #0x10]
	lsls r1, r0, #2
	ldr r0, [sp, #0x20]
	adds r4, r0, r1
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x15
	bl FUN_020248F0
_0221C578:
	ldr r0, [sp, #8]
	adds r7, r7, #1
	bl FUN_02074640
	cmp r7, r0
	blt _0221C48A
_0221C584:
	cmp r7, #6
	bge _0221C5C0
	ldr r0, [sp, #0xc]
	movs r6, #0xeb
	lsls r1, r0, #2
	ldr r0, [sp, #0x20]
	lsls r6, r6, #2
	adds r1, r0, r1
	lsls r0, r7, #2
	adds r5, r6, #0
	adds r4, r1, r0
	adds r5, #0x30
_0221C59C:
	movs r0, #0xdf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, r6]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, r5]
	movs r1, #0
	bl FUN_02024830
	adds r7, r7, #1
	adds r4, r4, #4
	cmp r7, #6
	blt _0221C59C
_0221C5C0:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221C5C4: .4byte 0x000007CC
_0221C5C8: .4byte 0x000006A2
_0221C5CC: .4byte 0x0000069C
_0221C5D0: .4byte 0x000006A1
_0221C5D4: .4byte 0x0000079C
_0221C5D8: .4byte 0x0000069E
_0221C5DC: .4byte 0x000006A8
	thumb_func_end ov65_0221C46C

	thumb_func_start ov65_0221C5E0
ov65_0221C5E0: @ 0x0221C5E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl ov65_0221F864
	ldr r0, [r4, #0x58]
	cmp r0, #0x13
	bls _0221C5F2
	b _0221C99E
_0221C5F2:
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0221C5FE: @ jump table
	.2byte _0221C626 - _0221C5FE - 2 @ case 0
	.2byte _0221C68E - _0221C5FE - 2 @ case 1
	.2byte _0221C6D8 - _0221C5FE - 2 @ case 2
	.2byte _0221C6E6 - _0221C5FE - 2 @ case 3
	.2byte _0221C6FA - _0221C5FE - 2 @ case 4
	.2byte _0221C70A - _0221C5FE - 2 @ case 5
	.2byte _0221C722 - _0221C5FE - 2 @ case 6
	.2byte _0221C736 - _0221C5FE - 2 @ case 7
	.2byte _0221C748 - _0221C5FE - 2 @ case 8
	.2byte _0221C774 - _0221C5FE - 2 @ case 9
	.2byte _0221C782 - _0221C5FE - 2 @ case 10
	.2byte _0221C78E - _0221C5FE - 2 @ case 11
	.2byte _0221C812 - _0221C5FE - 2 @ case 12
	.2byte _0221C82E - _0221C5FE - 2 @ case 13
	.2byte _0221C83A - _0221C5FE - 2 @ case 14
	.2byte _0221C84C - _0221C5FE - 2 @ case 15
	.2byte _0221C890 - _0221C5FE - 2 @ case 16
	.2byte _0221C8CA - _0221C5FE - 2 @ case 17
	.2byte _0221C90C - _0221C5FE - 2 @ case 18
	.2byte _0221C94C - _0221C5FE - 2 @ case 19
_0221C626:
	movs r0, #0x50
	bl FUN_02037AC0
	movs r0, #2
	bl FUN_0201A728
	adds r0, r4, #0
	bl ov65_0221F760
	ldr r0, [r4, #8]
	movs r5, #0
	ldr r0, [r0, #8]
	bl FUN_02074640
	cmp r0, #0
	ble _0221C686
	movs r7, #0x7b
	lsls r7, r7, #2
_0221C64A:
	ldr r0, [r4, #8]
	adds r1, r5, #0
	ldr r0, [r0, #8]
	bl FUN_02074644
	movs r1, #0xae
	movs r2, #0
	adds r6, r0, #0
	bl FUN_0206E540
	cmp r0, r7
	bne _0221C678
	adds r0, r6, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _0221C678
	adds r0, r6, #0
	movs r1, #0
	bl FUN_02071D6C
_0221C678:
	ldr r0, [r4, #8]
	adds r5, r5, #1
	ldr r0, [r0, #8]
	bl FUN_02074640
	cmp r5, r0
	blt _0221C64A
_0221C686:
	ldr r0, [r4, #0x58]
	adds r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C68E:
	movs r0, #0x50
	bl FUN_02037B38
	cmp r0, #0
	beq _0221C77A
	ldr r0, [r4, #8]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	bne _0221C6A4
	movs r0, #6
	b _0221C6A6
_0221C6A4:
	movs r0, #2
_0221C6A6:
	str r0, [r4, #0x58]
	bl FUN_0203769C
	cmp r0, #0
	bne _0221C6CA
	bl FUN_0201FD44
	movs r1, #0x3c
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	bl FUN_0203769C
	movs r1, #0x1f
	adds r2, r5, #3
	bl ov65_0221DE10
_0221C6CA:
	ldr r0, [r4, #4]
	bl ov65_0221DE8C
	adds r0, r4, #0
	bl ov65_0221F850
	b _0221C99E
_0221C6D8:
	ldr r1, _0221C9A4 @ =0x000022CC
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0221C77A
	adds r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C6E6:
	ldr r0, _0221C9A4 @ =0x000022CC
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0221C77A
	movs r0, #4
	str r0, [r4, #0x58]
	b _0221C99E
_0221C6FA:
	ldr r0, _0221C9A8 @ =0x000036A8
	adds r0, r4, r0
	bl FUN_02039EAC
	ldr r0, [r4, #0x58]
	adds r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C70A:
	ldr r2, _0221C9A8 @ =0x000036A8
	ldr r0, [r4, #4]
	movs r1, #2
	adds r2, r4, r2
	bl FUN_02039EB4
	cmp r0, #0
	beq _0221C77A
	ldr r0, [r4, #0x58]
	adds r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C722:
	movs r0, #1
	bl FUN_020378E4
	movs r0, #0x51
	bl FUN_02037AC0
	ldr r0, [r4, #0x58]
	adds r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C736:
	movs r0, #0x51
	bl FUN_02037B38
	cmp r0, #0
	beq _0221C77A
	ldr r0, [r4, #0x58]
	adds r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C748:
	movs r0, #0
	str r0, [r4, #0x5c]
	str r0, [r4, #0x60]
	str r0, [r4, #0x64]
	bl FUN_0203769C
	cmp r0, #1
	bne _0221C76C
	bl FUN_0203769C
	ldr r1, _0221C9AC @ =0x00002224
	ldr r2, [r4, #0x5c]
	ldr r1, [r4, r1]
	bl ov65_0221DE64
	ldr r0, [r4, #0x5c]
	adds r0, r0, #1
	str r0, [r4, #0x5c]
_0221C76C:
	ldr r0, [r4, #0x58]
	adds r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C774:
	ldr r0, [r4, #0x60]
	cmp r0, #0
	bne _0221C77C
_0221C77A:
	b _0221C99E
_0221C77C:
	movs r0, #0xa
	str r0, [r4, #0x58]
	b _0221C99E
_0221C782:
	adds r0, r0, #1
	str r0, [r4, #0x58]
	adds r0, r4, #0
	bl ov65_0221C1C4
	b _0221C99E
_0221C78E:
	movs r1, #0
	ldr r0, _0221C9B0 @ =0x0000069C
	adds r2, r4, #0
	adds r5, r1, #0
_0221C796:
	adds r1, r1, #1
	strh r5, [r2, r0]
	adds r2, #0x10
	cmp r1, #0xd
	blt _0221C796
	ldr r0, _0221C9AC @ =0x00002224
	ldr r0, [r4, r0]
	bl FUN_02074640
	cmp r0, #0
	ble _0221C7D0
	ldr r0, _0221C9B0 @ =0x0000069C
	ldr r7, _0221C9AC @ =0x00002224
	adds r6, r4, r0
_0221C7B2:
	ldr r0, _0221C9AC @ =0x00002224
	adds r1, r5, #0
	ldr r0, [r4, r0]
	bl FUN_02074644
	adds r1, r6, #0
	bl ov65_0221C9D8
	ldr r0, [r4, r7]
	adds r6, #0x10
	adds r5, r5, #1
	bl FUN_02074640
	cmp r5, r0
	blt _0221C7B2
_0221C7D0:
	ldr r0, _0221C9B4 @ =0x00002228
	movs r5, #0
	ldr r0, [r4, r0]
	bl FUN_02074640
	cmp r0, #0
	ble _0221C804
	ldr r0, _0221C9B0 @ =0x0000069C
	ldr r7, _0221C9B4 @ =0x00002228
	adds r6, r4, r0
_0221C7E4:
	ldr r0, _0221C9B4 @ =0x00002228
	adds r1, r5, #0
	ldr r0, [r4, r0]
	bl FUN_02074644
	adds r1, r5, #6
	lsls r1, r1, #4
	adds r1, r6, r1
	bl ov65_0221C9D8
	ldr r0, [r4, r7]
	adds r5, r5, #1
	bl FUN_02074640
	cmp r5, r0
	blt _0221C7E4
_0221C804:
	ldr r0, _0221C9B8 @ =0x0000075C
	movs r1, #1
	strh r1, [r4, r0]
	ldr r0, [r4, #0x58]
	adds r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C812:
	bl FUN_0203769C
	bl FUN_02034818
	ldr r2, _0221C9BC @ =0x00002230
	ldr r1, [r4, r2]
	adds r2, r2, #4
	adds r2, r4, r2
	bl ov65_0221DEA0
	ldr r0, [r4, #0x58]
	adds r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C82E:
	ldr r1, [r4, #0x60]
	cmp r1, #3
	bne _0221C88E
	adds r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C83A:
	ldr r0, [r4, #4]
	bl FUN_0202CE64
	bl ov65_0221DF0C
	ldr r0, [r4, #0x58]
	adds r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C84C:
	ldr r1, [r4, #0x60]
	cmp r1, #4
	bne _0221C88E
	adds r0, r0, #1
	str r0, [r4, #0x58]
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	ldr r0, _0221C9AC @ =0x00002224
	movs r1, #0
	ldr r0, [r4, r0]
	adds r2, r4, #0
	bl ov65_0221C46C
	ldr r0, _0221C9B4 @ =0x00002228
	movs r1, #6
	ldr r0, [r4, r0]
	adds r2, r4, #0
	bl ov65_0221C46C
	movs r6, #0xd1
	movs r5, #0
	movs r7, #1
	lsls r6, r6, #2
_0221C87E:
	ldr r0, [r4, r6]
	adds r1, r7, #0
	bl FUN_02024830
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #2
	blt _0221C87E
_0221C88E:
	b _0221C99E
_0221C890:
	movs r1, #0
	movs r0, #1
	adds r2, r1, #0
	str r0, [sp]
	movs r0, #8
	subs r2, #0x10
	movs r3, #0x1e
	bl FUN_0200B484
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BC28
	movs r0, #2
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #3
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	ldr r0, [r4, #0x58]
	adds r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C8CA:
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #0
	beq _0221C99E
	ldr r0, _0221C9AC @ =0x00002224
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02074644
	ldr r2, _0221C9C0 @ =0x000007FC
	ldr r3, _0221C9C4 @ =0x000020FC
	adds r1, r0, #0
	movs r0, #0
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov65_0221D57C
	ldr r1, _0221C9C8 @ =0x0000211C
	ldr r2, _0221C9AC @ =0x00002224
	str r0, [r4, r1]
	str r4, [sp]
	ldr r0, _0221C9CC @ =0x00000444
	movs r1, #0
	ldr r2, [r4, r2]
	adds r0, r4, r0
	adds r3, r1, #0
	bl ov65_0221D674
	ldr r0, [r4, #0x58]
	adds r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C90C:
	movs r1, #0
	movs r0, #2
	adds r2, r1, #0
	str r0, [sp]
	movs r0, #8
	subs r2, #0x10
	movs r3, #0x17
	bl FUN_0200B484
	movs r0, #4
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #5
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #6
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, [r4, #0x58]
	adds r0, r0, #1
	str r0, [r4, #0x58]
	adds r0, r4, #0
	bl ov65_0221F780
	b _0221C99E
_0221C94C:
	movs r0, #2
	bl FUN_0200B5C0
	cmp r0, #0
	beq _0221C99E
	ldr r0, _0221C9D0 @ =0x000005B4
	movs r1, #1
	adds r0, r4, r0
	bl FUN_0200E9BC
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221C9D4 @ =0x00000594
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0xf
	movs r2, #1
	bl ov65_0221FB90
	movs r0, #2
	bl FUN_0201A738
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221C99E:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221C9A4: .4byte 0x000022CC
_0221C9A8: .4byte 0x000036A8
_0221C9AC: .4byte 0x00002224
_0221C9B0: .4byte 0x0000069C
_0221C9B4: .4byte 0x00002228
_0221C9B8: .4byte 0x0000075C
_0221C9BC: .4byte 0x00002230
_0221C9C0: .4byte 0x000007FC
_0221C9C4: .4byte 0x000020FC
_0221C9C8: .4byte 0x0000211C
_0221C9CC: .4byte 0x00000444
_0221C9D0: .4byte 0x000005B4
_0221C9D4: .4byte 0x00000594
	thumb_func_end ov65_0221C5E0

	thumb_func_start ov65_0221C9D8
ov65_0221C9D8: @ 0x0221C9D8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0206DD40
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #0x9b
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r4, #4]
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4]
	adds r0, r5, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r4, #6]
	adds r0, r5, #0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r4, #5]
	adds r0, r5, #0
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4, #8]
	adds r0, r5, #0
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	str r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_0206DD8C
	ldrh r0, [r4]
	cmp r0, #0
	beq _0221CA50
	ldrb r1, [r4, #6]
	movs r2, #0x1c
	bl FUN_0206FBC4
	strh r0, [r4, #0xa]
_0221CA50:
	cmp r6, #0
	beq _0221CA60
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	adds r0, r0, #1
	strh r0, [r4, #2]
_0221CA60:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov65_0221C9D8

	thumb_func_start ov65_0221CA64
ov65_0221CA64: @ 0x0221CA64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r1, #0
	ldr r1, _0221CAD4 @ =0x0000040C
	lsls r7, r5, #2
	adds r6, r0, r1
	adds r4, r2, #0
	ldr r0, [r6, r7]
	adds r1, r4, #7
	bl FUN_020248F0
	cmp r5, #2
	bne _0221CAA6
	movs r0, #0x20
	subs r1, r4, #1
	str r0, [sp]
	movs r0, #0x1a
	lsls r2, r1, #2
	ldr r1, _0221CAD8 @ =0x0221FEEC
	str r0, [sp, #4]
	movs r0, #0xa2
	ldr r1, [r1, r2]
	adds r3, r0, #0
	movs r2, #5
	adds r3, #0xbe
	bl FUN_02007938
	ldr r0, [r6, r7]
	movs r1, #0xb
	bl FUN_02024A14
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0221CAA6:
	cmp r5, #3
	bne _0221CACE
	movs r0, #0x20
	subs r1, r4, #1
	str r0, [sp]
	movs r0, #0x1a
	lsls r2, r1, #2
	ldr r1, _0221CAD8 @ =0x0221FEEC
	str r0, [sp, #4]
	movs r0, #0xa2
	ldr r1, [r1, r2]
	adds r3, r0, #0
	movs r2, #5
	adds r3, #0xde
	bl FUN_02007938
	ldr r0, [r6, r7]
	movs r1, #0xc
	bl FUN_02024A14
_0221CACE:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221CAD4: .4byte 0x0000040C
_0221CAD8: .4byte 0x0221FEEC
	thumb_func_end ov65_0221CA64

	thumb_func_start ov65_0221CADC
ov65_0221CADC: @ 0x0221CADC
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #6
	blx FUN_020F2998
	ldr r0, _0221CB48 @ =0x00002228
	adds r7, r1, #0
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #6
	blx FUN_020F2998
	adds r1, r6, #0
	ldr r2, _0221CB4C @ =0x000007FC
	movs r6, #0x32
	adds r3, r0, #0
	lsls r6, r6, #6
	muls r6, r3, r6
	adds r2, r5, r2
	adds r2, r2, r6
	ldr r6, _0221CB50 @ =0x000020FC
	lsls r3, r3, #4
	adds r6, r5, r6
	movs r0, #1
	adds r3, r6, r3
	bl ov65_0221D57C
	ldr r1, _0221CB54 @ =0x0000211C
	ldr r2, _0221CB48 @ =0x00002228
	str r0, [r5, r1]
	str r5, [sp]
	ldr r0, _0221CB58 @ =0x00000444
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	adds r3, r7, #0
	bl ov65_0221D674
	lsls r2, r4, #4
	adds r3, r5, r2
	movs r2, #0x6a
	lsls r2, r2, #4
	ldrb r2, [r3, r2]
	adds r0, r5, #0
	movs r1, #3
	bl ov65_0221CA64
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221CB48: .4byte 0x00002228
_0221CB4C: .4byte 0x000007FC
_0221CB50: .4byte 0x000020FC
_0221CB54: .4byte 0x0000211C
_0221CB58: .4byte 0x00000444
	thumb_func_end ov65_0221CADC

	thumb_func_start ov65_0221CB5C
ov65_0221CB5C: @ 0x0221CB5C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x94
	ldr r1, [r1]
	cmp r1, #0xc
	beq _0221CBEE
	cmp r1, #6
	bge _0221CBD4
	ldr r0, _0221CBF0 @ =0x00002224
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	adds r3, r0, #0
	ldr r2, _0221CBF4 @ =0x000007FC
	adds r1, r4, #0
	adds r4, r5, r2
	movs r2, #0x32
	lsls r2, r2, #6
	muls r2, r3, r2
	adds r2, r4, r2
	ldr r4, _0221CBF8 @ =0x000020FC
	lsls r3, r3, #4
	adds r4, r5, r4
	movs r0, #0
	adds r3, r4, r3
	bl ov65_0221D57C
	ldr r1, _0221CBFC @ =0x0000211C
	adds r3, r5, #0
	str r0, [r5, r1]
	ldr r0, _0221CC00 @ =0x00000444
	ldr r2, _0221CBF0 @ =0x00002224
	str r5, [sp]
	adds r3, #0x94
	ldr r2, [r5, r2]
	ldr r3, [r3]
	adds r0, r5, r0
	movs r1, #0
	bl ov65_0221D674
	ldr r0, _0221CC00 @ =0x00000444
	movs r1, #1
	adds r0, r5, r0
	adds r2, r5, #0
	bl ov65_0221D8C4
	ldr r0, _0221CC04 @ =0x00000418
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
	pop {r3, r4, r5, pc}
_0221CBD4:
	bl ov65_0221CADC
	ldr r0, _0221CC00 @ =0x00000444
	movs r1, #0
	adds r0, r5, r0
	adds r2, r5, #0
	bl ov65_0221D8C4
	ldr r0, _0221CC08 @ =0x00000414
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
_0221CBEE:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221CBF0: .4byte 0x00002224
_0221CBF4: .4byte 0x000007FC
_0221CBF8: .4byte 0x000020FC
_0221CBFC: .4byte 0x0000211C
_0221CC00: .4byte 0x00000444
_0221CC04: .4byte 0x00000418
_0221CC08: .4byte 0x00000414
	thumb_func_end ov65_0221CB5C

	thumb_func_start ov65_0221CC0C
ov65_0221CC0C: @ 0x0221CC0C
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0221CCA8 @ =0x00002220
	adds r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0221CC22
	blx r1
	movs r1, #0x53
	lsls r1, r1, #2
	str r0, [r4, r1]
_0221CC22:
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #3
	bhi _0221CC4C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221CC38: @ jump table
	.2byte _0221CC4C - _0221CC38 - 2 @ case 0
	.2byte _0221CC4C - _0221CC38 - 2 @ case 1
	.2byte _0221CC40 - _0221CC38 - 2 @ case 2
	.2byte _0221CC46 - _0221CC38 - 2 @ case 3
_0221CC40:
	add sp, #4
	movs r0, #2
	pop {r3, r4, pc}
_0221CC46:
	add sp, #4
	movs r0, #3
	pop {r3, r4, pc}
_0221CC4C:
	movs r0, #0
	movs r2, #0xd1
	str r0, [sp]
	movs r0, #0x56
	lsls r2, r2, #2
	ldr r3, _0221CCAC @ =0x0000069C
	lsls r0, r0, #2
	adds r1, r4, #0
	ldr r2, [r4, r2]
	adds r0, r4, r0
	adds r1, #0x94
	adds r3, r4, r3
	bl ov65_0221DDC0
	cmp r0, #0
	beq _0221CC72
	adds r0, r4, #0
	bl ov65_0221CB5C
_0221CC72:
	movs r0, #1
	movs r2, #0xd2
	str r0, [sp]
	movs r0, #0x57
	lsls r2, r2, #2
	ldr r3, _0221CCAC @ =0x0000069C
	lsls r0, r0, #2
	adds r1, r4, #0
	ldr r2, [r4, r2]
	adds r0, r4, r0
	adds r1, #0x98
	adds r3, r4, r3
	bl ov65_0221DDC0
	adds r0, r4, #0
	adds r0, #0x9c
	bl ov65_0221DCBC
	adds r0, r4, #0
	adds r4, #0x94
	ldr r2, [r4]
	movs r1, #0x17
	bl ov65_0221DE24
	movs r0, #1
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0221CCA8: .4byte 0x00002220
_0221CCAC: .4byte 0x0000069C
	thumb_func_end ov65_0221CC0C

	thumb_func_start ov65_0221CCB0
ov65_0221CCB0: @ 0x0221CCB0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0xb7
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	movs r0, #0xbb
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	movs r0, #0x2e
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	movs r7, #0xb3
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_0221CCE4:
	ldr r0, [r5, r7]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0221CCE4
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_02024504
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov65_0221CCB0

	thumb_func_start ov65_0221CD0C
ov65_0221CD0C: @ 0x0221CD0C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0221CD64 @ =0x00002224
	movs r6, #0
	ldr r0, [r5, r0]
	bl FUN_02074640
	cmp r0, #0
	ble _0221CD38
	ldr r7, _0221CD64 @ =0x00002224
	adds r4, r5, #0
_0221CD22:
	ldr r0, _0221CD68 @ =0x0000079C
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, [r5, r7]
	adds r4, r4, #4
	adds r6, r6, #1
	bl FUN_02074640
	cmp r6, r0
	blt _0221CD22
_0221CD38:
	ldr r0, _0221CD6C @ =0x00002228
	movs r6, #0
	ldr r0, [r5, r0]
	bl FUN_02074640
	cmp r0, #0
	ble _0221CD60
	ldr r7, _0221CD6C @ =0x00002228
	adds r4, r5, #0
_0221CD4A:
	ldr r0, _0221CD70 @ =0x000007B4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, [r5, r7]
	adds r4, r4, #4
	adds r6, r6, #1
	bl FUN_02074640
	cmp r6, r0
	blt _0221CD4A
_0221CD60:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221CD64: .4byte 0x00002224
_0221CD68: .4byte 0x0000079C
_0221CD6C: .4byte 0x00002228
_0221CD70: .4byte 0x000007B4
	thumb_func_end ov65_0221CD0C

	thumb_func_start ov65_0221CD74
ov65_0221CD74: @ 0x0221CD74
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_020072A4
	ldr r1, [r4, #0x68]
	str r1, [r0, #0x24]
	adds r0, r4, #0
	bl ov65_0221CD0C
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026380
	ldr r0, _0221CE14 @ =0x00002228
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl ov65_0221CCB0
	ldr r0, _0221CE18 @ =0x00000444
	adds r0, r4, r0
	bl ov65_0221FAE0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov65_0221D1C8
	movs r1, #6
	lsls r1, r1, #6
	ldr r1, [r4, r1]
	movs r0, #0x1a
	bl FUN_0201AB80
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026380
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #4
	bl FUN_02002DB4
	movs r0, #0x1a
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221CE14: .4byte 0x00002228
_0221CE18: .4byte 0x00000444
	thumb_func_end ov65_0221CD74

	thumb_func_start ov65_0221CE1C
ov65_0221CE1C: @ 0x0221CE1C
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0201EEB4
	ldr r0, _0221CE84 @ =0x0000211C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0221CE6C
	subs r4, r0, #1
	ldr r0, _0221CE88 @ =0x000007FC
	movs r2, #0x32
	lsls r2, r2, #6
	adds r1, r4, #0
	adds r0, r5, r0
	muls r1, r2, r1
	adds r0, r0, r1
	blx FUN_020CFECC
	lsls r1, r4, #4
	movs r0, #0x20
	adds r2, r5, r1
	str r0, [sp]
	movs r0, #0x1a
	adds r3, r4, #2
	ldr r1, _0221CE8C @ =0x000020FC
	str r0, [sp, #4]
	ldrh r0, [r2, r1]
	adds r1, r1, #4
	ldrh r1, [r2, r1]
	movs r2, #5
	lsls r3, r3, #5
	bl FUN_02007938
	ldr r0, _0221CE84 @ =0x0000211C
	movs r1, #0
	str r1, [r5, r0]
_0221CE6C:
	bl FUN_0202061C
	bl FUN_0200B224
	ldr r3, _0221CE90 @ =0x027E0000
	ldr r1, _0221CE94 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221CE84: .4byte 0x0000211C
_0221CE88: .4byte 0x000007FC
_0221CE8C: .4byte 0x000020FC
_0221CE90: .4byte 0x027E0000
_0221CE94: .4byte 0x00003FF8
	thumb_func_end ov65_0221CE1C

	thumb_func_start ov65_0221CE98
ov65_0221CE98: @ 0x0221CE98
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0221CEB4 @ =0x0221FE44
	add r3, sp, #0
	movs r2, #5
_0221CEA2:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0221CEA2
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_0221CEB4: .4byte 0x0221FE44
	thumb_func_end ov65_0221CE98

	thumb_func_start ov65_0221CEB8
ov65_0221CEB8: @ 0x0221CEB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xd4
	ldr r4, _0221D0C0 @ =0x0221FD58
	add r3, sp, #0xc4
	adds r5, r0, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r4, _0221D0C4 @ =0x0221FDF0
	add r3, sp, #0xa8
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #0
	str r0, [r3]
	adds r0, r5, #0
	adds r3, r1, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r4, _0221D0C8 @ =0x0221FDB8
	add r3, sp, #0x8c
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #1
	str r0, [r3]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r4, _0221D0CC @ =0x0221FE0C
	add r3, sp, #0x70
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #2
	str r0, [r3]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #2
	bl FUN_0201CAE0
	ldr r4, _0221D0D0 @ =0x0221FE28
	add r3, sp, #0x54
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #3
	str r0, [r3]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r4, _0221D0D4 @ =0x0221FD80
	add r3, sp, #0x38
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	adds r0, r5, #0
	movs r1, #4
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r4, _0221D0D8 @ =0x0221FD9C
	add r3, sp, #0x1c
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #5
	str r0, [r3]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r4, _0221D0DC @ =0x0221FDD4
	add r3, sp, #0
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #6
	str r0, [r3]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x1a
	bl FUN_0201C1C4
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x1a
	bl FUN_0201C1C4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x1a
	bl FUN_0201C1C4
	movs r4, #0
	movs r6, #3
	adds r7, r4, #0
_0221CFFC:
	lsls r1, r4, #0x18
	movs r2, #0
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201BC8C
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0201BC8C
	adds r1, r4, #4
	lsls r1, r1, #0x18
	movs r2, #0
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r1, r4, #4
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r4, r4, #1
	cmp r4, #4
	blt _0221CFFC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201BC28
	movs r0, #1
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #2
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #3
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #4
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #5
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #6
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #1
	lsls r0, r0, #0x1a
	adds r3, r0, #0
	ldr r2, [r0]
	ldr r1, _0221D0E0 @ =0xFFFF1FFF
	adds r3, #0x48
	ands r1, r2
	str r1, [r0]
	ldrh r4, [r3]
	movs r1, #0x3f
	movs r2, #0x1f
	bics r4, r1
	orrs r4, r2
	strh r4, [r3]
	adds r3, r0, #0
	adds r3, #0x4a
	ldrh r4, [r3]
	bics r4, r1
	orrs r2, r4
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r3]
	adds r1, r0, #0
	movs r2, #0xf
	lsls r2, r2, #0xc
	adds r1, #0x40
	strh r2, [r1]
	ldr r2, _0221D0E4 @ =0x04000304
	movs r1, #0x10
	adds r0, #0x44
	strh r1, [r0]
	ldrh r1, [r2]
	ldr r0, _0221D0E8 @ =0xFFFF7FFF
	ands r0, r1
	strh r0, [r2]
	add sp, #0xd4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221D0C0: .4byte 0x0221FD58
_0221D0C4: .4byte 0x0221FDF0
_0221D0C8: .4byte 0x0221FDB8
_0221D0CC: .4byte 0x0221FE0C
_0221D0D0: .4byte 0x0221FE28
_0221D0D4: .4byte 0x0221FD80
_0221D0D8: .4byte 0x0221FD9C
_0221D0DC: .4byte 0x0221FDD4
_0221D0E0: .4byte 0xFFFF1FFF
_0221D0E4: .4byte 0x04000304
_0221D0E8: .4byte 0xFFFF7FFF
	thumb_func_end ov65_0221CEB8

	thumb_func_start ov65_0221D0EC
ov65_0221D0EC: @ 0x0221D0EC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	bl FUN_020072A4
	adds r4, r0, #0
	movs r2, #6
	ldr r0, _0221D1B0 @ =0x00000674
	str r4, [r5, #8]
	movs r1, #4
	str r1, [r5, r0]
	movs r3, #0
	str r3, [r5, #0x50]
	subs r0, r0, #4
	str r3, [r5, r0]
	movs r0, #0x5e
	lsls r0, r0, #2
	str r2, [r5, r0]
	adds r1, r0, #4
	str r2, [r5, r1]
	adds r1, r5, #0
	adds r1, #0x94
	str r3, [r1]
	adds r1, r5, #0
	adds r1, #0x98
	str r2, [r1]
	subs r0, #0x2c
	str r3, [r5, r0]
	str r3, [r5, #0x54]
	ldr r0, _0221D1B4 @ =ov65_0221E050
	ldr r1, _0221D1B8 @ =0x00002220
	str r3, [r5, #0x58]
	str r0, [r5, r1]
	str r3, [r5, #0x6c]
	str r3, [r5, #0x70]
	ldr r0, _0221D1BC @ =0x0000211C
	str r3, [r5, #0x68]
	str r3, [r5, r0]
	ldr r0, _0221D1C0 @ =0x000036AC
	subs r6, r2, #7
	str r6, [r5, r0]
	adds r2, r0, #4
	str r6, [r5, r2]
	adds r2, r1, #0
	adds r2, #0xac
	str r3, [r5, r2]
	adds r2, r0, #0
	adds r2, #0xc
	str r3, [r5, r2]
	adds r0, #0x10
	str r3, [r5, r0]
	adds r0, r1, #4
	ldr r2, [r4, #8]
	adds r1, #0x10
	str r2, [r5, r0]
	ldr r0, [r4, #0xc]
	str r0, [r5, r1]
	ldr r0, [r4, #0x10]
	str r0, [r5, #4]
	bl FUN_020744AC
	adds r1, r0, #0
	movs r0, #0x1a
	bl FUN_0201AA8C
	ldr r1, _0221D1C4 @ =0x00002228
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #6
	bl FUN_020744DC
	bl FUN_020744AC
	adds r2, r0, #0
	ldr r0, _0221D1C4 @ =0x00002228
	movs r1, #0xff
	ldr r0, [r5, r0]
	blx FUN_020E5B44
	ldr r0, [r4, #4]
	movs r1, #0x1a
	bl FUN_02028F68
	movs r1, #0x66
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #8
	ldr r0, [r5, r1]
	movs r1, #0x2a
	bl FUN_0200BBA0
	movs r1, #0x67
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r4, #0x14]
	bl FUN_02039F68
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221D1B0: .4byte 0x00000674
_0221D1B4: .4byte ov65_0221E050
_0221D1B8: .4byte 0x00002220
_0221D1BC: .4byte 0x0000211C
_0221D1C0: .4byte 0x000036AC
_0221D1C4: .4byte 0x00002228
	thumb_func_end ov65_0221D0EC

	thumb_func_start ov65_0221D1C8
ov65_0221D1C8: @ 0x0221D1C8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201BB4C
	pop {r4, pc}
	thumb_func_end ov65_0221D1C8

	thumb_func_start ov65_0221D204
ov65_0221D204: @ 0x0221D204
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r2, #0
	movs r2, #1
	adds r4, r3, #0
	str r2, [sp]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	bl FUN_02007C98
	adds r6, r0, #0
	beq _0221D256
	add r1, sp, #4
	blx FUN_020B71D8
	cmp r0, #0
	beq _0221D250
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0221D232
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	str r0, [sp, #0x1c]
_0221D232:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl FUN_0201CC08
	cmp r0, #0
	beq _0221D250
	ldr r2, [sp, #4]
	lsls r1, r4, #0x18
	ldr r3, [sp, #0x1c]
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r2, #0xc
	bl FUN_0201C0A8
_0221D250:
	adds r0, r6, #0
	bl FUN_0201AB0C
_0221D256:
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov65_0221D204

	thumb_func_start ov65_0221D25C
ov65_0221D25C: @ 0x0221D25C
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #2
	adds r4, r0, #0
	bl FUN_0201CC08
	adds r2, r0, #0
	movs r0, #0
	movs r3, #6
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #2
	lsls r3, r3, #8
	bl FUN_0201BF94
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov65_0221D25C

	thumb_func_start ov65_0221D280
ov65_0221D280: @ 0x0221D280
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r1, #0
	movs r1, #6
	lsls r1, r1, #6
	ldr r4, [r0, r1]
	subs r1, #0x60
	str r1, [sp]
	movs r0, #0x1a
	movs r1, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #4
	adds r3, r1, #0
	bl FUN_02007B8C
	movs r1, #0
	movs r0, #0x12
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02007B8C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201C2D8
	movs r0, #4
	movs r1, #0
	bl FUN_0201C2D8
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x1a
	bl FUN_0200304C
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #0x1a
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #2
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x1a
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #3
	adds r2, r4, #0
	movs r3, #2
	bl ov65_0221D204
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x1a
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #4
	adds r2, r4, #0
	movs r3, #3
	bl FUN_02007B68
	movs r0, #0
	movs r1, #0x40
	movs r2, #0x1a
	bl FUN_0200304C
	movs r0, #0
	movs r1, #0x60
	movs r2, #0x1a
	bl FUN_02003030
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x1a
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #2
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x1a
	movs r1, #5
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r1, #0
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x1a
	movs r1, #6
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r1, #0
	bl FUN_02007B68
	movs r0, #4
	movs r1, #0x40
	movs r2, #0x1a
	bl FUN_0200304C
	movs r0, #4
	movs r1, #0x60
	movs r2, #0x1a
	bl FUN_02003030
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov65_0221D280

	thumb_func_start ov65_0221D3B8
ov65_0221D3B8: @ 0x0221D3B8
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0221D3E4 @ =0x0221FD48
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_020215A0
	movs r0, #0x14
	movs r1, #0x1a
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0221D3E4: .4byte 0x0221FD48
	thumb_func_end ov65_0221D3B8

	thumb_func_start ov65_0221D3E8
ov65_0221D3E8: @ 0x0221D3E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r7, r1, #0
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x64
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x1a
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	movs r1, #0x69
	lsls r1, r1, #2
	movs r0, #0x2d
	adds r1, r5, r1
	movs r2, #0x1a
	bl FUN_02009F40
	movs r1, #0x1a
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r6, #0
	adds r4, r5, #0
_0221D424:
	movs r0, #2
	adds r1, r6, #0
	movs r2, #0x1a
	bl FUN_0200A090
	movs r1, #0xb3
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _0221D424
	movs r0, #0
	str r0, [sp]
	movs r3, #1
	str r3, [sp, #4]
	movs r0, #0x1a
	str r0, [sp, #8]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	adds r1, r7, #0
	movs r2, #7
	bl FUN_0200A3C8
	movs r1, #0xb7
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r2, #0
	str r2, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #9
	str r0, [sp, #8]
	movs r0, #0x1a
	subs r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	adds r3, r2, #0
	bl FUN_0200A480
	movs r1, #0x2e
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x1a
	subs r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r2, #8
	movs r3, #1
	bl FUN_0200A540
	movs r1, #0xb9
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x1a
	subs r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r2, #9
	movs r3, #1
	bl FUN_0200A540
	movs r1, #0xba
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r3, #1
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x1a
	subs r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r2, #0xa
	bl FUN_0200A3C8
	movs r1, #0xbb
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0x1a
	movs r2, #0
	subs r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	adds r3, r2, #0
	bl FUN_0200A480
	movs r1, #0x2f
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r3, #1
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x1a
	subs r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r2, #0xb
	bl FUN_0200A540
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r3, #1
	str r3, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x1a
	subs r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r2, #0xc
	bl FUN_0200A540
	movs r1, #0xbe
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0x1c
	ldr r0, [r5, r1]
	bl FUN_0200ACF0
	movs r0, #0xbb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200ACF0
	movs r0, #0x2e
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	bl FUN_02074490
	adds r1, r0, #0
	movs r0, #0x80
	str r0, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	movs r0, #0x14
	movs r2, #1
	lsls r3, r0, #4
	bl FUN_02007938
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov65_0221D3E8

	thumb_func_start ov65_0221D57C
ov65_0221D57C: @ 0x0221D57C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r7, r0, #0
	adds r6, r2, #0
	adds r0, r3, #0
	movs r2, #2
	adds r5, r1, #0
	str r3, [sp, #0x20]
	bl FUN_02070124
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl FUN_0206E540
	str r0, [sp, #0x24]
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #1
	bne _0221D5C0
	ldr r0, _0221D5F8 @ =0x00000147
	cmp r4, r0
	bne _0221D5C0
	adds r4, r0, #0
	adds r4, #0xa7
_0221D5C0:
	movs r3, #0
	str r3, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	str r6, [sp, #0xc]
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	movs r0, #2
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	str r4, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	ldrh r0, [r0]
	ldrh r1, [r1, #2]
	movs r2, #0x1a
	bl FUN_02014494
	movs r1, #0x32
	adds r0, r6, #0
	lsls r1, r1, #6
	blx FUN_020D2894
	adds r0, r7, #1
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221D5F8: .4byte 0x00000147
	thumb_func_end ov65_0221D57C

	thumb_func_start ov65_0221D5FC
ov65_0221D5FC: @ 0x0221D5FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r0, #0x14
	movs r1, #0x1a
	str r3, [sp, #8]
	bl FUN_02026354
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_02074644
	movs r1, #0x77
	adds r2, r4, #0
	bl FUN_0206E540
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #8]
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl ov65_0221FB4C
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov65_0221D5FC

	thumb_func_start ov65_0221D648
ov65_0221D648: @ 0x0221D648
	push {r4, lr}
	ldrh r0, [r0]
	adds r4, r3, #0
	cmp r0, #0x1d
	beq _0221D656
	cmp r0, #0x20
	bne _0221D66E
_0221D656:
	adds r0, r1, #0
	adds r1, r2, #0
	bl FUN_02074644
	movs r1, #0x4d
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0221D66E
	movs r0, #2
	pop {r4, pc}
_0221D66E:
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov65_0221D648

	thumb_func_start ov65_0221D674
ov65_0221D674: @ 0x0221D674
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r7, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	adds r1, r3, #0
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r4, [sp, #0x50]
	bl FUN_02074644
	movs r1, #2
	bl FUN_0207083C
	str r0, [sp, #0x10]
	ldr r0, _0221D8AC @ =0x0000040C
	movs r1, #1
	adds r6, r4, r0
	lsls r0, r5, #2
	str r0, [sp, #0x14]
	ldr r0, [r6, r0]
	bl FUN_02024830
	movs r0, #0xc
	adds r3, r5, #0
	muls r3, r0, r3
	ldr r1, _0221D8B0 @ =0x0221FEA4
	ldr r0, [sp, #0x14]
	ldr r2, _0221D8B4 @ =0x0221FEA8
	ldr r1, [r1, r3]
	ldr r3, [r2, r3]
	ldr r2, [sp, #0x10]
	ldr r0, [r6, r0]
	adds r2, r2, r3
	adds r2, #0xc0
	bl ov65_0221F748
	cmp r5, #0
	bne _0221D6D4
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x14]
	lsls r1, r1, #4
	adds r2, r4, r1
	ldr r1, _0221D8B8 @ =0x000006A6
	ldr r0, [r6, r0]
	ldrh r1, [r2, r1]
	bl FUN_02024890
_0221D6D4:
	ldr r2, [sp, #0xc]
	adds r0, r4, #0
	lsls r2, r2, #4
	adds r3, r4, r2
	movs r2, #0x6a
	lsls r2, r2, #4
	ldrb r2, [r3, r2]
	adds r1, r5, #2
	bl ov65_0221CA64
	adds r0, r5, #2
	lsls r0, r0, #2
	adds r1, r4, r0
	ldr r0, _0221D8AC @ =0x0000040C
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #6
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x1a
	lsls r0, r0, #4
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	adds r0, r7, r0
	movs r3, #9
	bl ov65_0221D5FC
	movs r0, #6
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0xc]
	adds r0, r0, r1
	lsls r0, r0, #4
	str r0, [sp, #0x34]
	ldr r0, _0221D8BC @ =0x0000069C
	ldr r3, [sp, #0x34]
	mov ip, r0
	adds r3, r4, r3
	str r3, [sp, #0x30]
	mov r3, ip
	adds r1, r4, r0
	ldr r0, [sp, #0x34]
	ldr r6, [sp, #0x30]
	adds r3, #8
	adds r0, r1, r0
	ldrh r3, [r6, r3]
	ldr r1, [sp, #8]
	bl ov65_0221D648
	ldr r1, _0221D8C0 @ =0x000006A1
	adds r2, r4, r1
	ldr r1, [sp, #0x34]
	str r2, [sp, #0x18]
	ldrb r1, [r2, r1]
	cmp r1, #0
	beq _0221D74C
	movs r0, #2
_0221D74C:
	cmp r0, #0
	beq _0221D76A
	cmp r0, #1
	beq _0221D78E
	cmp r0, #2
	bne _0221D7B0
	adds r0, r5, #4
	lsls r0, r0, #2
	adds r1, r4, r0
	ldr r0, _0221D8AC @ =0x0000040C
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	b _0221D7B0
_0221D76A:
	ldr r0, _0221D8AC @ =0x0000040C
	adds r0, r4, r0
	str r0, [sp, #0x1c]
	adds r0, r5, #4
	lsls r0, r0, #2
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0x20]
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	ldr r0, [r1, r0]
	movs r1, #7
	bl FUN_020248F0
	b _0221D7B0
_0221D78E:
	ldr r0, _0221D8AC @ =0x0000040C
	adds r0, r4, r0
	str r0, [sp, #0x24]
	adds r0, r5, #4
	lsls r0, r0, #2
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	ldr r0, [r1, r0]
	movs r1, #6
	bl FUN_020248F0
_0221D7B0:
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x34]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0221D836
	movs r0, #0xa
	movs r1, #0x1a
	bl FUN_02026354
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x1c
	lsls r0, r0, #4
	str r0, [sp, #0x2c]
	adds r0, r7, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x29
	adds r2, r6, #0
	bl FUN_0200BB6C
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	adds r1, r6, #0
	adds r0, r7, r0
	movs r2, #9
	movs r3, #0xff
	bl ov65_0221FB4C
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl FUN_02074644
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, r6, #0
	movs r2, #3
	movs r3, #0
	bl FUN_02026464
	movs r0, #0x1e
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	movs r3, #0
	adds r0, r7, r0
	adds r1, r6, #0
	movs r2, #9
	str r3, [sp, #4]
	bl ov65_0221FB4C
	adds r0, r6, #0
	bl FUN_02026380
	b _0221D842
_0221D836:
	adds r0, r5, #0
	adds r0, #0x1c
	lsls r0, r0, #4
	adds r0, r7, r0
	bl FUN_0201D8C8
_0221D842:
	movs r0, #3
	str r0, [sp]
	movs r3, #0
	adds r0, r5, #0
	movs r1, #0x67
	adds r0, #0x1e
	lsls r0, r0, #4
	str r3, [sp, #4]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r7, r0
	movs r2, #7
	bl ov65_0221FB4C
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	adds r5, #0x20
	lsls r0, r0, #0x10
	lsls r4, r5, #4
	lsrs r6, r0, #0x10
	adds r0, r7, r4
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x14
	movs r1, #0x1a
	bl FUN_02026354
	adds r1, r6, #0
	movs r2, #0x1a
	adds r5, r0, #0
	bl FUN_02077D40
	movs r0, #3
	str r0, [sp]
	movs r3, #0
	adds r0, r7, r4
	adds r1, r5, #0
	movs r2, #9
	str r3, [sp, #4]
	bl ov65_0221FB4C
	adds r0, r5, #0
	bl FUN_02026380
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221D8AC: .4byte 0x0000040C
_0221D8B0: .4byte 0x0221FEA4
_0221D8B4: .4byte 0x0221FEA8
_0221D8B8: .4byte 0x000006A6
_0221D8BC: .4byte 0x0000069C
_0221D8C0: .4byte 0x000006A1
	thumb_func_end ov65_0221D674

	thumb_func_start ov65_0221D8C4
ov65_0221D8C4: @ 0x0221D8C4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	lsls r0, r4, #2
	adds r1, r6, r0
	ldr r0, _0221D92C @ =0x0000040C
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #2
	lsls r0, r0, #2
	adds r1, r6, r0
	ldr r0, _0221D92C @ =0x0000040C
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #4
	lsls r0, r0, #2
	adds r1, r6, r0
	ldr r0, _0221D92C @ =0x0000040C
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	adds r0, #0x1a
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #0x1c
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #0x1e
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8C8
	adds r4, #0x20
	lsls r0, r4, #4
	adds r0, r5, r0
	bl FUN_0201D8C8
	pop {r4, r5, r6, pc}
	nop
_0221D92C: .4byte 0x0000040C
	thumb_func_end ov65_0221D8C4

	thumb_func_start ov65_0221D930
ov65_0221D930: @ 0x0221D930
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	movs r1, #0
	adds r5, r0, #0
	str r1, [sp]
	subs r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r2, #0xb3
	str r1, [sp, #0xc]
	movs r0, #2
	lsls r2, r2, #2
	str r0, [sp, #0x10]
	ldr r0, [r5, r2]
	adds r3, r1, #0
	str r0, [sp, #0x14]
	adds r0, r2, #4
	ldr r0, [r5, r0]
	str r0, [sp, #0x18]
	adds r0, r2, #0
	adds r0, #8
	ldr r0, [r5, r0]
	str r0, [sp, #0x1c]
	adds r0, r2, #0
	adds r0, #0xc
	ldr r0, [r5, r0]
	adds r2, #0x30
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	adds r0, r5, r2
	adds r2, r1, #0
	str r1, [sp, #0x28]
	bl FUN_02009D48
	movs r1, #1
	movs r3, #0xb3
	str r1, [sp]
	subs r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsls r3, r3, #2
	ldr r2, [r5, r3]
	str r2, [sp, #0x14]
	adds r2, r3, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	adds r2, r3, #0
	adds r2, #8
	ldr r2, [r5, r2]
	str r2, [sp, #0x1c]
	adds r2, r3, #0
	adds r2, #0xc
	ldr r2, [r5, r2]
	adds r3, #0x54
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r5, r3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02009D48
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #2
	str r0, [sp, #0x2c]
	movs r0, #0xbf
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp, #0x30]
	movs r0, #6
	lsls r1, r1, #0x10
	lsls r0, r0, #0x10
	str r0, [sp, #0x38]
	lsrs r0, r1, #5
	movs r7, #0
	str r1, [sp, #0x34]
	str r7, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r7, [r0, #0x20]
	movs r0, #1
	str r0, [sp, #0x54]
	movs r0, #0x1a
	ldr r6, _0221DBE4 @ =0x0221FF4C
	str r7, [sp, #0x50]
	str r0, [sp, #0x58]
	adds r4, r5, #0
_0221D9EC:
	ldr r0, [r6]
	lsls r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r6, #4]
	lsls r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl FUN_02024624
	movs r1, #0xd1
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	adds r0, r4, #0
	movs r1, #0xd1
	adds r0, #0x94
	lsls r1, r1, #2
	ldr r0, [r0]
	ldr r1, [r4, r1]
	adds r2, r7, #0
	bl ov65_0221DD34
	movs r0, #0xd1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x64
	bl FUN_02024ADC
	movs r0, #0xd1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xd1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	adds r7, r7, #1
	adds r6, #8
	adds r4, r4, #4
	cmp r7, #2
	blt _0221D9EC
	ldr r6, _0221DBE4 @ =0x0221FF4C
	movs r7, #0
	adds r4, r5, #0
_0221DA54:
	ldr r0, [r6]
	adds r0, #0x10
	lsls r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r6, #4]
	subs r0, r0, #6
	lsls r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl FUN_02024624
	movs r1, #0xdf
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0xdf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r7, #5
	bl FUN_020248F0
	movs r0, #0xdf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #5
	bl FUN_02024ADC
	movs r0, #0xdf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xdf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	adds r7, r7, #1
	adds r6, #8
	adds r4, r4, #4
	cmp r7, #0xc
	blt _0221DA54
	ldr r6, _0221DBE4 @ =0x0221FF4C
	movs r7, #0
	adds r4, r5, #0
_0221DABA:
	ldr r0, [r6]
	adds r0, #0x24
	lsls r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r6, #4]
	adds r0, #0x10
	lsls r0, r0, #0xc
	str r0, [sp, #0x38]
	movs r0, #0
	str r0, [sp, #0x50]
	add r0, sp, #0x2c
	bl FUN_02024624
	movs r1, #0xeb
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_02024ADC
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	adds r7, r7, #1
	adds r6, #8
	adds r4, r4, #4
	cmp r7, #0xc
	blt _0221DABA
	ldr r6, _0221DBE4 @ =0x0221FF4C
	movs r7, #0
	adds r4, r5, #0
_0221DB0C:
	ldr r0, [r6]
	adds r0, #0x2d
	lsls r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r6, #4]
	adds r0, #0x10
	lsls r0, r0, #0xc
	str r0, [sp, #0x38]
	movs r0, #0
	str r0, [sp, #0x50]
	add r0, sp, #0x2c
	bl FUN_02024624
	movs r1, #0xf7
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_02024ADC
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	adds r7, r7, #1
	adds r6, #8
	adds r4, r4, #4
	cmp r7, #0xc
	blt _0221DB0C
	movs r0, #6
	lsls r0, r0, #0x10
	str r0, [sp, #0x34]
	movs r0, #0x42
	lsls r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl FUN_02024624
	ldr r1, _0221DBE8 @ =0x00000424
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, _0221DBE8 @ =0x00000424
	movs r1, #0x14
	ldr r0, [r5, r0]
	bl FUN_020248F0
	ldr r0, _0221DBE8 @ =0x00000424
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r4, _0221DBEC @ =0x0221FEA4
	movs r6, #0
	adds r7, r5, r0
_0221DB94:
	ldr r0, [r4]
	str r7, [sp, #0x30]
	lsls r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r4, #4]
	lsls r1, r0, #0xc
	movs r0, #3
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #0x38]
	movs r0, #2
	str r0, [sp, #0x54]
	add r0, sp, #0x2c
	bl FUN_02024624
	ldr r1, _0221DBF0 @ =0x0000040C
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	ldr r0, _0221DBF0 @ =0x0000040C
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0202484C
	ldr r0, _0221DBF0 @ =0x0000040C
	ldr r1, [r4, #8]
	ldr r0, [r5, r0]
	bl FUN_020248F0
	adds r6, r6, #1
	adds r4, #0xc
	adds r5, r5, #4
	cmp r6, #6
	blt _0221DB94
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_0221DBE4: .4byte 0x0221FF4C
_0221DBE8: .4byte 0x00000424
_0221DBEC: .4byte 0x0221FEA4
_0221DBF0: .4byte 0x0000040C
	thumb_func_end ov65_0221D930

	thumb_func_start ov65_0221DBF4
ov65_0221DBF4: @ 0x0221DBF4
	push {r3, r4}
	ldr r3, _0221DC30 @ =0x021D110C
	movs r1, #0
	ldr r3, [r3, #0x4c]
	movs r4, #0x40
	adds r2, r1, #0
	tst r4, r3
	beq _0221DC08
	movs r2, #1
	adds r1, r1, #1
_0221DC08:
	movs r4, #0x80
	tst r4, r3
	beq _0221DC12
	movs r2, #2
	adds r1, r1, #1
_0221DC12:
	movs r4, #0x20
	tst r4, r3
	beq _0221DC1C
	movs r2, #3
	adds r1, r1, #1
_0221DC1C:
	movs r4, #0x10
	tst r3, r4
	beq _0221DC26
	movs r2, #4
	adds r1, r1, #1
_0221DC26:
	cmp r1, #0
	beq _0221DC2C
	str r2, [r0]
_0221DC2C:
	pop {r3, r4}
	bx lr
	.align 2, 0
_0221DC30: .4byte 0x021D110C
	thumb_func_end ov65_0221DBF4

	thumb_func_start ov65_0221DC34
ov65_0221DC34: @ 0x0221DC34
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r0, #6
	bge _0221DCAA
	ldr r0, _0221DCAC @ =0x0221FE6C
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0221DCAA
	cmp r0, #6
	bge _0221DCAA
	lsls r0, r0, #4
	ldr r1, _0221DCB0 @ =0x0000069C
	adds r0, r4, r0
	ldrh r0, [r0, r1]
	cmp r0, #0
	beq _0221DCAA
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	lsls r0, r0, #4
	adds r2, r4, r0
	adds r0, r1, #5
	ldrb r0, [r2, r0]
	cmp r0, #0
	bne _0221DCAA
	ldrh r0, [r2, r1]
	adds r1, r1, #6
	ldrb r2, [r2, r1]
	ldr r1, _0221DCB4 @ =0x000001B9
	cmp r0, r1
	bne _0221DC8E
	ldr r0, [r4, #4]
	bl FUN_0202CE64
	movs r1, #0
	movs r2, #0x64
	adds r3, r1, #0
	bl FUN_02006E4C
	b _0221DC96
_0221DC8E:
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl FUN_02006218
_0221DC96:
	ldr r0, _0221DCB8 @ =0x0000040C
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_0202484C
	ldr r0, _0221DCB8 @ =0x0000040C
	movs r1, #4
	ldr r0, [r4, r0]
	bl FUN_020248F0
_0221DCAA:
	pop {r4, pc}
	.align 2, 0
_0221DCAC: .4byte 0x0221FE6C
_0221DCB0: .4byte 0x0000069C
_0221DCB4: .4byte 0x000001B9
_0221DCB8: .4byte 0x0000040C
	thumb_func_end ov65_0221DC34

	thumb_func_start ov65_0221DCBC
ov65_0221DCBC: @ 0x0221DCBC
	push {r3, lr}
	ldrh r1, [r0]
	adds r1, #0x14
	strh r1, [r0]
	ldrh r2, [r0]
	movs r1, #0x5a
	lsls r1, r1, #2
	cmp r2, r1
	bls _0221DCD2
	movs r1, #0
	strh r1, [r0]
_0221DCD2:
	ldrh r0, [r0]
	bl FUN_0201FCAC
	movs r1, #0xa
	muls r1, r0, r1
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	adds r0, #0xf
	lsls r1, r0, #5
	movs r0, #0x1d
	orrs r1, r0
	add r0, sp, #0
	strh r1, [r0]
	add r0, sp, #0
	movs r1, #0x3a
	movs r2, #2
	blx FUN_020CFD18
	pop {r3, pc}
	thumb_func_end ov65_0221DCBC

	thumb_func_start ov65_0221DCFC
ov65_0221DCFC: @ 0x0221DCFC
	push {r3, r4, r5, r6}
	movs r5, #0x18
	muls r5, r0, r5
	ldr r6, _0221DD30 @ =0x0221FFB4
	movs r0, #6
	movs r4, #0
	adds r5, r6, r5
	muls r0, r1, r0
	adds r5, r5, r0
	adds r3, r4, #0
	adds r1, r5, #0
_0221DD12:
	ldrb r0, [r1]
	lsls r0, r0, #4
	ldrh r0, [r2, r0]
	cmp r0, #0
	beq _0221DD20
	ldrb r4, [r5, r3]
	b _0221DD28
_0221DD20:
	adds r3, r3, #1
	adds r1, r1, #1
	cmp r3, #6
	blt _0221DD12
_0221DD28:
	adds r0, r4, #0
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0221DD30: .4byte 0x0221FFB4
	thumb_func_end ov65_0221DCFC

	thumb_func_start ov65_0221DD34
ov65_0221DD34: @ 0x0221DD34
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	cmp r5, #0xd
	blt _0221DD46
	bl FUN_0202551C
_0221DD46:
	ldr r1, _0221DDAC @ =0x0221FF4C
	lsls r0, r5, #3
	ldr r1, [r1, r0]
	lsls r1, r1, #0xc
	str r1, [sp]
	ldr r1, _0221DDB0 @ =0x0221FF50
	ldr r0, [r1, r0]
	add r1, sp, #0
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	cmp r5, #0xc
	bne _0221DD78
	adds r0, r6, #0
	bl FUN_020247D4
	movs r1, #0xc
	adds r2, r4, #0
	muls r2, r1, r2
	ldr r1, _0221DDB4 @ =0x0221FD70
	adds r0, r6, #0
	ldr r1, [r1, r2]
	bl FUN_020248F0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0221DD78:
	adds r0, r6, #0
	bl FUN_020247D4
	cmp r5, #6
	bge _0221DD96
	movs r1, #0xc
	adds r2, r4, #0
	muls r2, r1, r2
	ldr r1, _0221DDB8 @ =0x0221FD68
	adds r0, r6, #0
	ldr r1, [r1, r2]
	bl FUN_020248F0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0221DD96:
	movs r1, #0xc
	adds r2, r4, #0
	muls r2, r1, r2
	ldr r1, _0221DDBC @ =0x0221FD6C
	adds r0, r6, #0
	ldr r1, [r1, r2]
	bl FUN_020248F0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0221DDAC: .4byte 0x0221FF4C
_0221DDB0: .4byte 0x0221FF50
_0221DDB4: .4byte 0x0221FD70
_0221DDB8: .4byte 0x0221FD68
_0221DDBC: .4byte 0x0221FD6C
	thumb_func_end ov65_0221DD34

	thumb_func_start ov65_0221DDC0
ov65_0221DDC0: @ 0x0221DDC0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	str r2, [sp]
	ldr r0, [r5]
	adds r4, r1, #0
	ldr r2, [sp, #0x18]
	subs r1, r0, #1
	movs r7, #0
	cmp r2, #0
	bne _0221DE00
	cmp r0, #0
	beq _0221DDFA
	ldr r0, [r4]
	adds r2, r3, #0
	bl ov65_0221DCFC
	ldr r1, [sp]
	ldr r2, [sp, #0x18]
	adds r6, r0, #0
	bl ov65_0221DD34
	ldr r0, [r4]
	cmp r0, r6
	beq _0221DDFA
	ldr r0, _0221DE0C @ =0x000005DC
	bl FUN_0200604C
	str r6, [r4]
	movs r7, #1
_0221DDFA:
	movs r0, #0
	str r0, [r5]
	b _0221DE08
_0221DE00:
	ldr r0, [r4]
	ldr r1, [sp]
	bl ov65_0221DD34
_0221DE08:
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221DE0C: .4byte 0x000005DC
	thumb_func_end ov65_0221DDC0

	thumb_func_start ov65_0221DE10
ov65_0221DE10: @ 0x0221DE10
	push {r3, lr}
	add r0, sp, #0
	strb r2, [r0]
	adds r0, r1, #0
	add r1, sp, #0
	movs r2, #1
	bl FUN_02037030
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov65_0221DE10

	thumb_func_start ov65_0221DE24
ov65_0221DE24: @ 0x0221DE24
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0221DE54 @ =0x000036AC
	adds r4, r1, #0
	ldr r1, [r5, r0]
	adds r6, r2, #0
	cmp r6, r1
	bne _0221DE3C
	adds r0, r0, #4
	ldr r0, [r5, r0]
	cmp r4, r0
	beq _0221DE50
_0221DE3C:
	bl FUN_0203769C
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov65_0221DE10
	ldr r0, _0221DE54 @ =0x000036AC
	str r6, [r5, r0]
	adds r0, r0, #4
	str r4, [r5, r0]
_0221DE50:
	pop {r4, r5, r6, pc}
	nop
_0221DE54: .4byte 0x000036AC
	thumb_func_end ov65_0221DE24

	thumb_func_start ov65_0221DE58
ov65_0221DE58: @ 0x0221DE58
	movs r2, #0x59
	lsls r2, r2, #4
	muls r2, r1, r2
	adds r0, r0, r2
	bx lr
	.align 2, 0
	thumb_func_end ov65_0221DE58

	thumb_func_start ov65_0221DE64
ov65_0221DE64: @ 0x0221DE64
	push {r3, r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_020373B4
	cmp r0, #0
	beq _0221DE8A
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov65_0221DE58
	movs r2, #0x59
	adds r1, r0, #0
	movs r0, #0x16
	lsls r2, r2, #4
	bl FUN_02036FD8
_0221DE8A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov65_0221DE64

	thumb_func_start ov65_0221DE8C
ov65_0221DE8C: @ 0x0221DE8C
	push {r3, lr}
	bl FUN_0202D95C
	adds r1, r0, #0
	movs r0, #0x20
	movs r2, #0xe
	bl FUN_02037030
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov65_0221DE8C

	thumb_func_start ov65_0221DEA0
ov65_0221DEA0: @ 0x0221DEA0
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	adds r6, r0, #0
	adds r5, r1, #0
	bl FUN_02028F54
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02002028
	adds r0, r6, #0
	bl FUN_02028F84
	str r0, [r4, #0x10]
	adds r0, r6, #0
	bl FUN_02029088
	strb r0, [r4, #0x14]
	adds r0, r6, #0
	bl FUN_0202907C
	strb r0, [r4, #0x15]
	adds r0, r6, #0
	bl FUN_02028F94
	strb r0, [r4, #0x16]
	movs r0, #0
	adds r1, r4, #0
_0221DED8:
	ldr r2, [r5, #0x10]
	str r2, [r1, #0x18]
	ldrb r3, [r5, #0x15]
	adds r2, r4, r0
	adds r2, #0x58
	strb r3, [r2]
	adds r2, r4, r0
	ldrb r3, [r5, #0x14]
	adds r2, #0x68
	adds r1, r1, #4
	strb r3, [r2]
	adds r2, r4, r0
	ldrb r3, [r5, #0x16]
	adds r2, #0x78
	adds r0, r0, #1
	adds r5, #0x88
	strb r3, [r2]
	cmp r0, #0x10
	blt _0221DED8
	movs r0, #0x1c
	adds r1, r4, #0
	movs r2, #0x88
	bl FUN_02036FD8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov65_0221DEA0

	thumb_func_start ov65_0221DF0C
ov65_0221DF0C: @ 0x0221DF0C
	ldr r3, _0221DF18 @ =FUN_02036FD8
	movs r2, #0xfa
	adds r1, r0, #0
	movs r0, #0x1d
	lsls r2, r2, #2
	bx r3
	.align 2, 0
_0221DF18: .4byte FUN_02036FD8
	thumb_func_end ov65_0221DF0C

	thumb_func_start ov65_0221DF1C
ov65_0221DF1C: @ 0x0221DF1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221DFA0 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _0221DF52
	ldr r0, _0221DFA4 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xc
	adds r0, #0x94
	str r1, [r0]
	adds r0, r4, #0
	bl ov65_0221CB5C
	adds r0, r4, #0
	movs r1, #0xd1
	adds r0, #0x94
	lsls r1, r1, #2
	ldr r0, [r0]
	ldr r1, [r4, r1]
	movs r2, #0
	bl ov65_0221DD34
	b _0221DF9A
_0221DF52:
	movs r0, #0x56
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov65_0221DBF4
	ldr r0, _0221DFA0 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _0221DF9A
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0221DF9A
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r0, #0xc
	bne _0221DF82
	ldr r1, _0221DFA8 @ =ov65_0221E144
	ldr r0, _0221DFAC @ =0x00002220
	str r1, [r4, r0]
	b _0221DF9A
_0221DF82:
	cmp r0, #6
	bge _0221DF8E
	ldr r1, _0221DFB0 @ =ov65_0221E9A8
	ldr r0, _0221DFAC @ =0x00002220
	str r1, [r4, r0]
	b _0221DF9A
_0221DF8E:
	blt _0221DF9A
	cmp r0, #0xc
	bge _0221DF9A
	ldr r1, _0221DFB4 @ =ov65_0221F3F4
	ldr r0, _0221DFAC @ =0x00002220
	str r1, [r4, r0]
_0221DF9A:
	movs r0, #0
	pop {r4, pc}
	nop
_0221DFA0: .4byte 0x021D110C
_0221DFA4: .4byte 0x000005DC
_0221DFA8: .4byte ov65_0221E144
_0221DFAC: .4byte 0x00002220
_0221DFB0: .4byte ov65_0221E9A8
_0221DFB4: .4byte ov65_0221F3F4
	thumb_func_end ov65_0221DF1C

	thumb_func_start ov65_0221DFB8
ov65_0221DFB8: @ 0x0221DFB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221E034 @ =0x0221FE6C
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0221E030
	cmp r0, #0xc
	bne _0221DFE4
	ldr r0, _0221E038 @ =0x000005DC
	bl FUN_0200604C
	ldr r1, _0221E03C @ =ov65_0221E144
	ldr r0, _0221E040 @ =0x00002220
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0xc
	adds r0, #0x94
	str r1, [r0]
	b _0221E014
_0221DFE4:
	lsls r1, r0, #4
	adds r2, r4, r1
	ldr r1, _0221E044 @ =0x0000069C
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _0221E014
	adds r1, r4, #0
	adds r1, #0x94
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r0, #6
	bge _0221E008
	ldr r1, _0221E048 @ =ov65_0221E9A8
	ldr r0, _0221E040 @ =0x00002220
	str r1, [r4, r0]
	b _0221E014
_0221E008:
	blt _0221E014
	cmp r0, #0xc
	bge _0221E014
	ldr r1, _0221E04C @ =ov65_0221F3F4
	ldr r0, _0221E040 @ =0x00002220
	str r1, [r4, r0]
_0221E014:
	adds r0, r4, #0
	movs r1, #0xd1
	adds r0, #0x94
	lsls r1, r1, #2
	ldr r0, [r0]
	ldr r1, [r4, r1]
	movs r2, #0
	bl ov65_0221DD34
	adds r0, r4, #0
	bl ov65_0221CB5C
	movs r0, #1
	pop {r4, pc}
_0221E030:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0221E034: .4byte 0x0221FE6C
_0221E038: .4byte 0x000005DC
_0221E03C: .4byte ov65_0221E144
_0221E040: .4byte 0x00002220
_0221E044: .4byte 0x0000069C
_0221E048: .4byte ov65_0221E9A8
_0221E04C: .4byte ov65_0221F3F4
	thumb_func_end ov65_0221DFB8

	thumb_func_start ov65_0221E050
ov65_0221E050: @ 0x0221E050
	push {r4, lr}
	adds r4, r0, #0
	bl ov65_0221DFB8
	cmp r0, #0
	bne _0221E062
	adds r0, r4, #0
	bl ov65_0221DF1C
_0221E062:
	adds r0, r4, #0
	bl ov65_0221DC34
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov65_0221E050

	thumb_func_start ov65_0221E06C
ov65_0221E06C: @ 0x0221E06C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bne _0221E09C
	ldr r0, _0221E130 @ =0x00002224
	ldr r0, [r5, r0]
	str r0, [r5, #0xc]
	ldr r0, [r5, #8]
	ldr r0, [r0, #8]
	bl FUN_02074640
	strb r0, [r5, #0x1f]
	movs r0, #0
	str r0, [r5, #0x34]
	bl FUN_0203769C
	bl FUN_02034818
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0xc
	bl FUN_0208AD34
	b _0221E0D6
_0221E09C:
	ldr r0, _0221E134 @ =0x00002228
	ldr r1, [r5, r0]
	str r1, [r5, #0xc]
	ldr r0, [r5, r0]
	bl FUN_02074640
	strb r0, [r5, #0x1f]
	bl FUN_0203769C
	movs r2, #1
	ldr r1, _0221E138 @ =0x00002E20
	eors r2, r0
	movs r0, #0xfb
	lsls r0, r0, #2
	adds r1, r5, r1
	muls r0, r2, r0
	adds r0, r1, r0
	str r0, [r5, #0x34]
	bl FUN_0203769C
	movs r1, #1
	eors r0, r1
	bl FUN_02034818
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0xc
	bl FUN_0208AD34
_0221E0D6:
	movs r0, #1
	strb r0, [r5, #0x1d]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #1
	strb r0, [r5, #0x1e]
	movs r0, #0
	strh r0, [r5, #0x24]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x10]
	bl FUN_02088288
	str r0, [r5, #0x38]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x2c]
	str r0, [r5, #0x28]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x18]
	str r0, [r5, #0x10]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x10]
	bl FUN_0202D95C
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	ldr r1, _0221E13C @ =_0221FD34
	adds r0, #0xc
	bl FUN_02089D40
	adds r1, r5, #0
	ldr r0, _0221E140 @ =0x02103A1C
	adds r1, #0xc
	movs r2, #0x1a
	bl FUN_0200724C
	str r0, [r5, #0x4c]
	str r4, [r5, #0x48]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221E130: .4byte 0x00002224
_0221E134: .4byte 0x00002228
_0221E138: .4byte 0x00002E20
_0221E13C: .4byte _0221FD34
_0221E140: .4byte 0x02103A1C
	thumb_func_end ov65_0221E06C

	thumb_func_start ov65_0221E144
ov65_0221E144: @ 0x0221E144
	push {r4, lr}
	sub sp, #0x10
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x19
	str r0, [sp]
	ldr r0, _0221E188 @ =0x000005B4
	lsls r3, r1, #4
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r2, #1
	bl ov65_0221FB90
	ldr r1, _0221E18C @ =ov65_0221E194
	ldr r0, _0221E190 @ =0x00002220
	str r1, [r4, r0]
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0221E188: .4byte 0x000005B4
_0221E18C: .4byte ov65_0221E194
_0221E190: .4byte 0x00002220
	thumb_func_end ov65_0221E144

	thumb_func_start ov65_0221E194
ov65_0221E194: @ 0x0221E194
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	ldr r2, _0221E258 @ =0x00000664
	lsls r0, r0, #6
	movs r3, #0xdb
	adds r1, r4, r2
	adds r2, #0xc
	lsls r3, r3, #6
	ldr r0, [r4, r0]
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221E250
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221E1C6: @ jump table
	.2byte _0221E250 - _0221E1C6 - 2 @ case 0
	.2byte _0221E1D0 - _0221E1C6 - 2 @ case 1
	.2byte _0221E218 - _0221E1C6 - 2 @ case 2
	.2byte _0221E1D0 - _0221E1C6 - 2 @ case 3
	.2byte _0221E218 - _0221E1C6 - 2 @ case 4
_0221E1D0:
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221E25C @ =0x000005B4
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0x1c
	movs r2, #1
	bl ov65_0221FB90
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #1
	bl ov65_0221DE24
	ldr r1, _0221E260 @ =ov65_0221E8EC
	ldr r0, _0221E264 @ =0x00002220
	str r1, [r4, r0]
	movs r0, #0
	str r0, [r4, #0x68]
	b _0221E250
_0221E218:
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221E268 @ =0x00000594
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0xf
	movs r2, #1
	bl ov65_0221FB90
	ldr r1, _0221E26C @ =ov65_0221E050
	ldr r0, _0221E264 @ =0x00002220
	str r1, [r4, r0]
_0221E250:
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221E258: .4byte 0x00000664
_0221E25C: .4byte 0x000005B4
_0221E260: .4byte ov65_0221E8EC
_0221E264: .4byte 0x00002220
_0221E268: .4byte 0x00000594
_0221E26C: .4byte ov65_0221E050
	thumb_func_end ov65_0221E194

	thumb_func_start ov65_0221E270
ov65_0221E270: @ 0x0221E270
	push {r4, lr}
	sub sp, #0x10
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221E2B4 @ =0x000005B4
	ldr r1, [r4, #0x74]
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r2, #1
	bl ov65_0221FB90
	ldr r1, _0221E2B8 @ =ov65_0221E2C0
	ldr r0, _0221E2BC @ =0x00002220
	str r1, [r4, r0]
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0221E2B4: .4byte 0x000005B4
_0221E2B8: .4byte ov65_0221E2C0
_0221E2BC: .4byte 0x00002220
	thumb_func_end ov65_0221E270

	thumb_func_start ov65_0221E2C0
ov65_0221E2C0: @ 0x0221E2C0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, _0221E31C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	bne _0221E2D8
	ldr r0, _0221E320 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _0221E316
_0221E2D8:
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221E324 @ =0x00000594
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0xf
	movs r2, #1
	bl ov65_0221FB90
	ldr r1, _0221E328 @ =ov65_0221E050
	ldr r0, _0221E32C @ =0x00002220
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov65_0221EF0C
_0221E316:
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0221E31C: .4byte 0x021D110C
_0221E320: .4byte 0x021D114C
_0221E324: .4byte 0x00000594
_0221E328: .4byte ov65_0221E050
_0221E32C: .4byte 0x00002220
	thumb_func_end ov65_0221E2C0

	thumb_func_start ov65_0221E330
ov65_0221E330: @ 0x0221E330
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #0xda
	adds r3, r0, #0
	lsls r4, r4, #6
	ldr r0, [r3, r4]
	adds r4, r4, #4
	str r0, [sp]
	ldr r0, _0221E350 @ =0x000005B4
	movs r2, #1
	adds r0, r3, r0
	ldr r3, [r3, r4]
	bl ov65_0221FB90
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0221E350: .4byte 0x000005B4
	thumb_func_end ov65_0221E330

	thumb_func_start ov65_0221E354
ov65_0221E354: @ 0x0221E354
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	ldr r2, _0221E3AC @ =0x00000664
	lsls r0, r0, #6
	movs r3, #0xdb
	adds r1, r4, r2
	adds r2, #0xc
	lsls r3, r3, #6
	ldr r0, [r4, r0]
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221E3A6
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221E386: @ jump table
	.2byte _0221E3A6 - _0221E386 - 2 @ case 0
	.2byte _0221E390 - _0221E386 - 2 @ case 1
	.2byte _0221E398 - _0221E386 - 2 @ case 2
	.2byte _0221E390 - _0221E386 - 2 @ case 3
	.2byte _0221E398 - _0221E386 - 2 @ case 4
_0221E390:
	ldr r1, _0221E3B0 @ =ov65_0221E740
	ldr r0, _0221E3B4 @ =0x00002220
	str r1, [r4, r0]
	b _0221E3A6
_0221E398:
	adds r0, r4, #0
	movs r1, #0x3f
	bl ov65_0221E330
	ldr r1, _0221E3B8 @ =ov65_0221E600
	ldr r0, _0221E3B4 @ =0x00002220
	str r1, [r4, r0]
_0221E3A6:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0221E3AC: .4byte 0x00000664
_0221E3B0: .4byte ov65_0221E740
_0221E3B4: .4byte 0x00002220
_0221E3B8: .4byte ov65_0221E600
	thumb_func_end ov65_0221E354

	thumb_func_start ov65_0221E3BC
ov65_0221E3BC: @ 0x0221E3BC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	ldr r2, _0221E458 @ =0x00000664
	lsls r0, r0, #6
	movs r3, #0xdb
	adds r1, r4, r2
	adds r2, #0xc
	lsls r3, r3, #6
	ldr r0, [r4, r0]
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221E450
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221E3EE: @ jump table
	.2byte _0221E450 - _0221E3EE - 2 @ case 0
	.2byte _0221E3F8 - _0221E3EE - 2 @ case 1
	.2byte _0221E42C - _0221E3EE - 2 @ case 2
	.2byte _0221E3F8 - _0221E3EE - 2 @ case 3
	.2byte _0221E42C - _0221E3EE - 2 @ case 4
_0221E3F8:
	ldr r0, [r4, #4]
	bl FUN_0203107C
	ldr r1, _0221E45C @ =0x0000367C
	ldr r1, [r4, r1]
	bl FUN_020311AC
	ldr r1, _0221E460 @ =0x000036A0
	ldr r0, [r4, r1]
	subs r1, #0x24
	ldr r1, [r4, r1]
	bl FUN_0202C338
	movs r0, #0
	str r0, [sp]
	ldr r1, _0221E464 @ =0x00003678
	ldr r0, [r4, #4]
	ldr r1, [r4, r1]
	movs r2, #0x1f
	movs r3, #0x1a
	bl FUN_0203A280
	ldr r1, _0221E468 @ =ov65_0221E740
	ldr r0, _0221E46C @ =0x00002220
	str r1, [r4, r0]
	b _0221E450
_0221E42C:
	ldr r0, _0221E464 @ =0x00003678
	ldr r0, [r4, r0]
	bl FUN_02034818
	adds r2, r0, #0
	movs r0, #0xda
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200BE48
	adds r0, r4, #0
	movs r1, #0x40
	bl ov65_0221E330
	ldr r1, _0221E470 @ =ov65_0221E354
	ldr r0, _0221E46C @ =0x00002220
	str r1, [r4, r0]
_0221E450:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_0221E458: .4byte 0x00000664
_0221E45C: .4byte 0x0000367C
_0221E460: .4byte 0x000036A0
_0221E464: .4byte 0x00003678
_0221E468: .4byte ov65_0221E740
_0221E46C: .4byte 0x00002220
_0221E470: .4byte ov65_0221E354
	thumb_func_end ov65_0221E3BC

	thumb_func_start ov65_0221E474
ov65_0221E474: @ 0x0221E474
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0221E530 @ =0x0000368C
	ldr r0, [r5, r0]
	bl FUN_02001338
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _0221E494
	adds r0, r0, #1
	cmp r4, r0
	bne _0221E4C0
	movs r0, #0
	pop {r4, r5, r6, pc}
_0221E494:
	ldr r0, _0221E534 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _0221E538 @ =0x00003678
	ldr r0, [r5, r0]
	bl FUN_02034818
	adds r2, r0, #0
	movs r0, #0xda
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200BE48
	adds r0, r5, #0
	movs r1, #0x40
	bl ov65_0221E330
	ldr r1, _0221E53C @ =ov65_0221E354
	ldr r0, _0221E540 @ =0x00002220
	str r1, [r5, r0]
	b _0221E506
_0221E4C0:
	ldr r0, _0221E534 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _0221E544 @ =0x0000367C
	str r4, [r5, r0]
	movs r0, #0x1a
	bl FUN_02028ED0
	adds r6, r0, #0
	ldr r0, _0221E548 @ =0x000036A0
	adds r1, r4, #0
	ldr r0, [r5, r0]
	bl FUN_0202C254
	adds r1, r0, #0
	adds r0, r6, #0
	bl FUN_02028F24
	movs r0, #0xda
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0
	adds r2, r6, #0
	bl FUN_0200BE48
	adds r0, r6, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	movs r1, #0x41
	bl ov65_0221E330
	ldr r1, _0221E54C @ =ov65_0221E3BC
	ldr r0, _0221E540 @ =0x00002220
	str r1, [r5, r0]
_0221E506:
	ldr r0, _0221E550 @ =0x00003690
	movs r1, #0
	adds r0, r5, r0
	bl FUN_0200E5D4
	ldr r0, _0221E550 @ =0x00003690
	adds r0, r5, r0
	bl FUN_0201D520
	ldr r0, _0221E530 @ =0x0000368C
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r1, #0
	bl FUN_02001434
	ldr r0, _0221E554 @ =0x00003688
	ldr r0, [r5, r0]
	bl FUN_02014950
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221E530: .4byte 0x0000368C
_0221E534: .4byte 0x000005DC
_0221E538: .4byte 0x00003678
_0221E53C: .4byte ov65_0221E354
_0221E540: .4byte 0x00002220
_0221E544: .4byte 0x0000367C
_0221E548: .4byte 0x000036A0
_0221E54C: .4byte ov65_0221E3BC
_0221E550: .4byte 0x00003690
_0221E554: .4byte 0x00003688
	thumb_func_end ov65_0221E474

	thumb_func_start ov65_0221E558
ov65_0221E558: @ 0x0221E558
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0221E5EC @ =0x000036A0
	ldr r0, [r5, r0]
	bl FUN_0202C2F8
	str r0, [sp]
	adds r0, r0, #1
	movs r1, #0x1a
	bl FUN_02014918
	ldr r1, _0221E5F0 @ =0x00003688
	str r0, [r5, r1]
	movs r0, #0x64
	movs r1, #0x1a
	bl FUN_02026354
	ldr r7, _0221E5EC @ =0x000036A0
	adds r6, r0, #0
	movs r4, #0
_0221E580:
	ldr r0, [r5, r7]
	adds r1, r4, #0
	bl FUN_0202C2DC
	cmp r0, #0
	beq _0221E5AA
	ldr r0, _0221E5EC @ =0x000036A0
	adds r1, r4, #0
	ldr r0, [r5, r0]
	bl FUN_0202C254
	adds r1, r0, #0
	adds r0, r6, #0
	bl FUN_020269A0
	ldr r0, _0221E5F0 @ =0x00003688
	adds r1, r6, #0
	ldr r0, [r5, r0]
	adds r2, r4, #0
	bl FUN_02014980
_0221E5AA:
	adds r4, r4, #1
	cmp r4, #0x20
	blt _0221E580
	ldr r1, _0221E5F0 @ =0x00003688
	movs r2, #0xb
	ldr r0, [r5, r1]
	subs r1, r1, #4
	adds r3, r2, #0
	ldr r1, [r5, r1]
	subs r3, #0xd
	bl FUN_02014960
	adds r0, r6, #0
	bl FUN_02026380
	ldr r2, _0221E5F0 @ =0x00003688
	movs r3, #6
	lsls r3, r3, #6
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r1, [sp]
	ldr r3, [r5, r3]
	adds r2, r5, r2
	bl ov65_0221FCA0
	ldr r1, _0221E5F4 @ =0x0000368C
	str r0, [r5, r1]
	ldr r1, _0221E5F8 @ =ov65_0221E474
	ldr r0, _0221E5FC @ =0x00002220
	str r1, [r5, r0]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E5EC: .4byte 0x000036A0
_0221E5F0: .4byte 0x00003688
_0221E5F4: .4byte 0x0000368C
_0221E5F8: .4byte ov65_0221E474
_0221E5FC: .4byte 0x00002220
	thumb_func_end ov65_0221E558

	thumb_func_start ov65_0221E600
ov65_0221E600: @ 0x0221E600
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	ldr r2, _0221E670 @ =0x00000664
	lsls r0, r0, #6
	movs r3, #0xdb
	adds r1, r4, r2
	adds r2, #0xc
	lsls r3, r3, #6
	ldr r0, [r4, r0]
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221E668
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221E632: @ jump table
	.2byte _0221E668 - _0221E632 - 2 @ case 0
	.2byte _0221E63C - _0221E632 - 2 @ case 1
	.2byte _0221E644 - _0221E632 - 2 @ case 2
	.2byte _0221E63C - _0221E632 - 2 @ case 3
	.2byte _0221E644 - _0221E632 - 2 @ case 4
_0221E63C:
	ldr r1, _0221E674 @ =ov65_0221E558
	ldr r0, _0221E678 @ =0x00002220
	str r1, [r4, r0]
	b _0221E668
_0221E644:
	ldr r0, _0221E67C @ =0x00003678
	ldr r0, [r4, r0]
	bl FUN_02034818
	adds r2, r0, #0
	movs r0, #0xda
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200BE48
	adds r0, r4, #0
	movs r1, #0x40
	bl ov65_0221E330
	ldr r1, _0221E680 @ =ov65_0221E354
	ldr r0, _0221E678 @ =0x00002220
	str r1, [r4, r0]
_0221E668:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_0221E670: .4byte 0x00000664
_0221E674: .4byte ov65_0221E558
_0221E678: .4byte 0x00002220
_0221E67C: .4byte 0x00003678
_0221E680: .4byte ov65_0221E354
	thumb_func_end ov65_0221E600

	thumb_func_start ov65_0221E684
ov65_0221E684: @ 0x0221E684
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	ldr r2, _0221E714 @ =0x00000664
	lsls r0, r0, #6
	movs r3, #0xdb
	adds r1, r4, r2
	adds r2, #0xc
	lsls r3, r3, #6
	ldr r0, [r4, r0]
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221E70E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221E6B6: @ jump table
	.2byte _0221E70E - _0221E6B6 - 2 @ case 0
	.2byte _0221E6C0 - _0221E6B6 - 2 @ case 1
	.2byte _0221E708 - _0221E6B6 - 2 @ case 2
	.2byte _0221E6C0 - _0221E6B6 - 2 @ case 3
	.2byte _0221E708 - _0221E6B6 - 2 @ case 4
_0221E6C0:
	ldr r1, _0221E718 @ =ov65_0221E740
	ldr r0, _0221E71C @ =0x00002220
	ldr r6, _0221E720 @ =0x000036A0
	str r1, [r4, r0]
	movs r5, #0
_0221E6CA:
	ldr r0, [r4, r6]
	adds r1, r5, #0
	bl FUN_0202C2DC
	cmp r0, #0
	bne _0221E6EA
	movs r0, #0
	str r0, [sp]
	ldr r1, _0221E724 @ =0x00003678
	ldr r0, [r4, #4]
	ldr r1, [r4, r1]
	adds r2, r5, #0
	movs r3, #0x1a
	bl FUN_0203A280
	b _0221E6F0
_0221E6EA:
	adds r5, r5, #1
	cmp r5, #0x20
	blt _0221E6CA
_0221E6F0:
	cmp r5, #0x20
	bne _0221E70E
	adds r0, r4, #0
	movs r1, #0x3f
	bl ov65_0221E330
	ldr r1, _0221E728 @ =ov65_0221E600
	ldr r0, _0221E71C @ =0x00002220
	add sp, #4
	str r1, [r4, r0]
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_0221E708:
	ldr r1, _0221E718 @ =ov65_0221E740
	ldr r0, _0221E71C @ =0x00002220
	str r1, [r4, r0]
_0221E70E:
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0221E714: .4byte 0x00000664
_0221E718: .4byte ov65_0221E740
_0221E71C: .4byte 0x00002220
_0221E720: .4byte 0x000036A0
_0221E724: .4byte 0x00003678
_0221E728: .4byte ov65_0221E600
	thumb_func_end ov65_0221E684

	thumb_func_start ov65_0221E72C
ov65_0221E72C: @ 0x0221E72C
	push {r3, lr}
	movs r0, #0x13
	bl FUN_02037B38
	cmp r0, #0
	beq _0221E73C
	movs r0, #2
	pop {r3, pc}
_0221E73C:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov65_0221E72C

	thumb_func_start ov65_0221E740
ov65_0221E740: @ 0x0221E740
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #0
	ldr r0, _0221E838 @ =0x00003678
	mvns r1, r1
	str r1, [r5, r0]
	movs r6, #0
	bl FUN_02037454
	cmp r0, #0
	ble _0221E77C
	ldr r7, _0221E83C @ =0x000035F8
	adds r4, r5, #0
_0221E75A:
	ldr r0, [r4, r7]
	cmp r0, #2
	bne _0221E770
	ldr r0, _0221E838 @ =0x00003678
	lsls r1, r6, #2
	str r6, [r5, r0]
	movs r2, #0
	adds r1, r5, r1
	subs r0, #0x80
	str r2, [r1, r0]
	b _0221E77C
_0221E770:
	adds r4, r4, #4
	adds r6, r6, #1
	bl FUN_02037454
	cmp r6, r0
	blt _0221E75A
_0221E77C:
	ldr r0, _0221E838 @ =0x00003678
	movs r1, #0
	ldr r2, [r5, r0]
	mvns r1, r1
	cmp r2, r1
	bne _0221E7C2
	adds r0, #0xc
	ldr r0, [r5, r0]
	bl FUN_0200BB44
	movs r0, #0xda
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0200BDA0
	movs r0, #0x13
	bl FUN_02037AC0
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r5, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221E840 @ =0x000005B4
	ldr r3, [r5, r3]
	adds r0, r5, r0
	movs r1, #0x1c
	movs r2, #1
	bl ov65_0221FB90
	ldr r1, _0221E844 @ =ov65_0221E72C
	ldr r0, _0221E848 @ =0x00002220
	str r1, [r5, r0]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221E7C2:
	ldr r0, [r5, #4]
	bl FUN_0207879C
	ldr r1, _0221E84C @ =0x000001B5
	movs r2, #1
	movs r3, #0x1a
	bl FUN_020784B0
	cmp r0, #1
	bne _0221E7FE
	ldr r0, _0221E838 @ =0x00003678
	ldr r0, [r5, r0]
	bl FUN_02034818
	adds r2, r0, #0
	movs r0, #0xda
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200BE48
	adds r0, r5, #0
	movs r1, #0x3e
	bl ov65_0221E330
	ldr r1, _0221E850 @ =ov65_0221E684
	ldr r0, _0221E848 @ =0x00002220
	str r1, [r5, r0]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221E7FE:
	ldr r0, [r5, #4]
	bl FUN_0202C6F4
	adds r6, r0, #0
	movs r4, #0
_0221E808:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0202C2DC
	cmp r0, #0
	bne _0221E828
	movs r0, #0
	str r0, [sp]
	ldr r1, _0221E838 @ =0x00003678
	ldr r0, [r5, #4]
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x1a
	bl FUN_0203A280
	b _0221E82E
_0221E828:
	adds r4, r4, #1
	cmp r4, #0x20
	blt _0221E808
_0221E82E:
	ldr r1, _0221E854 @ =ov65_0221E740
	ldr r0, _0221E848 @ =0x00002220
	str r1, [r5, r0]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221E838: .4byte 0x00003678
_0221E83C: .4byte 0x000035F8
_0221E840: .4byte 0x000005B4
_0221E844: .4byte ov65_0221E72C
_0221E848: .4byte 0x00002220
_0221E84C: .4byte 0x000001B5
_0221E850: .4byte ov65_0221E684
_0221E854: .4byte ov65_0221E740
	thumb_func_end ov65_0221E740

	thumb_func_start ov65_0221E858
ov65_0221E858: @ 0x0221E858
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0221E8CC @ =0x000035F8
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #0x1a
	bl FUN_0203A1C4
	cmp r0, #0
	bne _0221E898
	movs r0, #0x13
	bl FUN_02037AC0
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221E8D0 @ =0x000005B4
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0x1c
	movs r2, #1
	bl ov65_0221FB90
	ldr r1, _0221E8D4 @ =ov65_0221E72C
	ldr r0, _0221E8D8 @ =0x00002220
	add sp, #4
	str r1, [r4, r0]
	movs r0, #0
	pop {r3, r4, pc}
_0221E898:
	movs r0, #0x1a
	bl FUN_0200BD08
	movs r1, #0xda
	lsls r1, r1, #6
	str r0, [r4, r1]
	ldr r2, _0221E8DC @ =0x0000030B
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x1a
	bl FUN_0200BAF8
	ldr r1, _0221E8E0 @ =0x00003684
	str r0, [r4, r1]
	ldr r0, [r4, #4]
	bl FUN_0202C6F4
	ldr r1, _0221E8E4 @ =0x000036A0
	str r0, [r4, r1]
	ldr r1, _0221E8E8 @ =ov65_0221E740
	ldr r0, _0221E8D8 @ =0x00002220
	str r1, [r4, r0]
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_0221E8CC: .4byte 0x000035F8
_0221E8D0: .4byte 0x000005B4
_0221E8D4: .4byte ov65_0221E72C
_0221E8D8: .4byte 0x00002220
_0221E8DC: .4byte 0x0000030B
_0221E8E0: .4byte 0x00003684
_0221E8E4: .4byte 0x000036A0
_0221E8E8: .4byte ov65_0221E740
	thumb_func_end ov65_0221E858

	thumb_func_start ov65_0221E8EC
ov65_0221E8EC: @ 0x0221E8EC
	ldr r2, [r0, #0x6c]
	cmp r2, #0
	beq _0221E918
	ldr r1, [r0, #0x70]
	cmp r1, #0
	beq _0221E918
	cmp r2, #1
	bne _0221E908
	cmp r1, #1
	bne _0221E908
	ldr r2, _0221E91C @ =ov65_0221E858
	ldr r1, _0221E920 @ =0x00002220
	str r2, [r0, r1]
	b _0221E90E
_0221E908:
	ldr r2, _0221E924 @ =ov65_0221E270
	ldr r1, _0221E920 @ =0x00002220
	str r2, [r0, r1]
_0221E90E:
	movs r1, #0
	str r1, [r0, #0x6c]
	str r1, [r0, #0x70]
	movs r1, #0x1d
	str r1, [r0, #0x74]
_0221E918:
	movs r0, #0
	bx lr
	.align 2, 0
_0221E91C: .4byte ov65_0221E858
_0221E920: .4byte 0x00002220
_0221E924: .4byte ov65_0221E270
	thumb_func_end ov65_0221E8EC

	thumb_func_start ov65_0221E928
ov65_0221E928: @ 0x0221E928
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x1a
	movs r1, #0
	adds r6, r2, #0
	bl FUN_02018424
	ldr r1, _0221E99C @ =0x000036C4
	movs r2, #0x18
	str r0, [r5, r1]
	add r0, sp, #0xc
	movs r1, #0
	blx FUN_020D4994
	ldr r0, _0221E9A0 @ =0x0221FD3C
	add r2, sp, #0xc
	ldrh r3, [r0]
	add r1, sp, #0xc
	strh r3, [r2]
	ldrh r3, [r0, #2]
	strh r3, [r2, #2]
	ldrh r3, [r0, #4]
	strh r3, [r2, #4]
	ldrh r3, [r0, #6]
	strh r3, [r2, #6]
	ldrh r3, [r0, #8]
	ldrh r0, [r0, #0xa]
	strh r3, [r2, #8]
	strh r0, [r2, #0xa]
	ldr r0, _0221E9A4 @ =0x00000668
	movs r3, #0x11
	ldr r0, [r5, r0]
	str r0, [sp, #0x18]
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	str r0, [sp, #0x1c]
	lsls r0, r6, #0x18
	strb r4, [r2, #0x14]
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xd
	str r0, [sp, #4]
	movs r2, #0
	ldr r0, _0221E99C @ =0x000036C4
	str r2, [sp, #8]
	ldr r0, [r5, r0]
	bl FUN_020185FC
	adds r4, r0, #0
	bl ov65_0221F890
	adds r0, r4, #0
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	nop
_0221E99C: .4byte 0x000036C4
_0221E9A0: .4byte 0x0221FD3C
_0221E9A4: .4byte 0x00000668
	thumb_func_end ov65_0221E928

	thumb_func_start ov65_0221E9A8
ov65_0221E9A8: @ 0x0221E9A8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, _0221EA5C @ =0x00002224
	adds r1, r4, #0
	adds r1, #0x94
	ldr r0, [r4, r0]
	ldr r1, [r1]
	bl FUN_02074644
	bl FUN_02070DB0
	adds r2, r0, #0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200BF8C
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x62
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #8
	str r0, [sp]
	ldr r0, _0221EA60 @ =0x000005A4
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0x10
	movs r2, #1
	bl ov65_0221FB90
	movs r0, #3
	movs r1, #0x1a
	bl FUN_02014918
	ldr r1, _0221EA64 @ =0x00000668
	movs r2, #0x11
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0x19
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #0
	bl FUN_02014960
	ldr r0, _0221EA64 @ =0x00000668
	movs r1, #0x19
	lsls r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x12
	movs r3, #1
	bl FUN_02014960
	ldr r0, _0221EA64 @ =0x00000668
	movs r1, #0x19
	lsls r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #2
	bl FUN_02014960
	adds r0, r4, #0
	movs r1, #3
	movs r2, #9
	bl ov65_0221E928
	ldr r1, _0221EA68 @ =0x000036C8
	str r0, [r4, r1]
	ldr r1, _0221EA6C @ =ov65_0221EA74
	ldr r0, _0221EA70 @ =0x00002220
	str r1, [r4, r0]
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221EA5C: .4byte 0x00002224
_0221EA60: .4byte 0x000005A4
_0221EA64: .4byte 0x00000668
_0221EA68: .4byte 0x000036C8
_0221EA6C: .4byte ov65_0221EA74
_0221EA70: .4byte 0x00002220
	thumb_func_end ov65_0221E9A8

	thumb_func_start ov65_0221EA74
ov65_0221EA74: @ 0x0221EA74
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, _0221EB80 @ =0x000036C8
	ldr r0, [r4, r0]
	bl FUN_020186A4
	cmp r0, #2
	bhi _0221EA94
	cmp r0, #0
	beq _0221EA9E
	cmp r0, #1
	beq _0221EAEA
	cmp r0, #2
	beq _0221EB32
	b _0221EB78
_0221EA94:
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _0221EB32
	b _0221EB78
_0221EA9E:
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221EB84 @ =0x00000594
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0xf
	movs r2, #1
	bl ov65_0221FB90
	adds r0, r4, #0
	bl ov65_0221F4B0
	ldr r0, _0221EB88 @ =0x00000668
	ldr r0, [r4, r0]
	bl FUN_02014950
	ldr r1, _0221EB8C @ =ov65_0221E050
	ldr r0, _0221EB90 @ =0x00002220
	add sp, #0x10
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
_0221EAEA:
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221EB94 @ =0x000005B4
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0x14
	movs r2, #1
	bl ov65_0221FB90
	adds r0, r4, #0
	bl ov65_0221F4B0
	ldr r0, _0221EB88 @ =0x00000668
	ldr r0, [r4, r0]
	bl FUN_02014950
	ldr r1, _0221EB98 @ =ov65_0221EB9C
	ldr r0, _0221EB90 @ =0x00002220
	str r1, [r4, r0]
	b _0221EB78
_0221EB32:
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221EB84 @ =0x00000594
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0xf
	movs r2, #1
	bl ov65_0221FB90
	adds r0, r4, #0
	bl ov65_0221F4B0
	ldr r0, _0221EB88 @ =0x00000668
	ldr r0, [r4, r0]
	bl FUN_02014950
	ldr r1, _0221EB8C @ =ov65_0221E050
	ldr r0, _0221EB90 @ =0x00002220
	str r1, [r4, r0]
_0221EB78:
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221EB80: .4byte 0x000036C8
_0221EB84: .4byte 0x00000594
_0221EB88: .4byte 0x00000668
_0221EB8C: .4byte ov65_0221E050
_0221EB90: .4byte 0x00002220
_0221EB94: .4byte 0x000005B4
_0221EB98: .4byte ov65_0221EB9C
	thumb_func_end ov65_0221EA74

	thumb_func_start ov65_0221EB9C
ov65_0221EB9C: @ 0x0221EB9C
	push {r4, lr}
	sub sp, #0x10
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221EBEC @ =0x000005B4
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0x14
	movs r2, #1
	bl ov65_0221FB90
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl ov65_0221DE24
	ldr r1, _0221EBF0 @ =ov65_0221EBF8
	ldr r0, _0221EBF4 @ =0x00002220
	str r1, [r4, r0]
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221EBEC: .4byte 0x000005B4
_0221EBF0: .4byte ov65_0221EBF8
_0221EBF4: .4byte 0x00002220
	thumb_func_end ov65_0221EB9C

	thumb_func_start ov65_0221EBF8
ov65_0221EBF8: @ 0x0221EBF8
	ldr r2, [r0, #0x6c]
	cmp r2, #0
	beq _0221EC24
	ldr r1, [r0, #0x70]
	cmp r1, #0
	beq _0221EC24
	cmp r2, #2
	bne _0221EC14
	cmp r1, #2
	bne _0221EC14
	ldr r2, _0221EC28 @ =ov65_0221EC34
	ldr r1, _0221EC2C @ =0x00002220
	str r2, [r0, r1]
	b _0221EC1A
_0221EC14:
	ldr r2, _0221EC30 @ =ov65_0221E270
	ldr r1, _0221EC2C @ =0x00002220
	str r2, [r0, r1]
_0221EC1A:
	movs r1, #0x18
	str r1, [r0, #0x74]
	movs r1, #0
	str r1, [r0, #0x6c]
	str r1, [r0, #0x70]
_0221EC24:
	movs r0, #0
	bx lr
	.align 2, 0
_0221EC28: .4byte ov65_0221EC34
_0221EC2C: .4byte 0x00002220
_0221EC30: .4byte ov65_0221E270
	thumb_func_end ov65_0221EBF8

	thumb_func_start ov65_0221EC34
ov65_0221EC34: @ 0x0221EC34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0221ED54 @ =0x00000444
	movs r6, #0
	adds r0, r7, r0
	adds r4, r7, #0
	adds r5, r7, #0
	str r0, [sp, #4]
_0221EC46:
	adds r0, r7, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r6, r0
	beq _0221EC84
	movs r0, #0xdf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	ldr r0, _0221ED58 @ =0x0000069E
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _0221EC70
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
_0221EC70:
	ldr r0, _0221ED5C @ =0x000006A8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0221EC84
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
_0221EC84:
	adds r0, r6, #7
	lsls r1, r0, #4
	ldr r0, [sp, #4]
	adds r0, r0, r1
	bl FUN_0201D8E4
	adds r0, r7, #0
	adds r0, #0x98
	ldr r0, [r0]
	subs r0, r0, #6
	cmp r6, r0
	beq _0221ECD0
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	ldr r0, _0221ED60 @ =0x000006FE
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _0221ECBC
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
_0221ECBC:
	ldr r0, _0221ED64 @ =0x00000708
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0221ECD0
	movs r0, #0xfd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
_0221ECD0:
	adds r0, r6, #0
	adds r0, #0xd
	lsls r1, r0, #4
	ldr r0, [sp, #4]
	adds r0, r0, r1
	bl FUN_0201D8E4
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, #0x10
	cmp r6, #6
	blt _0221EC46
	movs r0, #0xd1
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xd2
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r7, #0
	adds r0, #0x94
	ldr r0, [r0]
	ldr r1, _0221ED68 @ =0x0221FF4C
	lsls r2, r0, #3
	movs r0, #0x20
	str r0, [sp]
	ldr r0, _0221ED6C @ =0x000022D0
	ldr r1, [r1, r2]
	ldr r3, _0221ED70 @ =0x0221FF50
	adds r0, r7, r0
	ldr r2, [r3, r2]
	adds r1, #0x10
	subs r2, r2, #6
	movs r3, #0x30
	bl ov65_0221ED80
	adds r0, r7, #0
	adds r0, #0x98
	ldr r0, [r0]
	ldr r1, _0221ED68 @ =0x0221FF4C
	lsls r2, r0, #3
	movs r0, #0x20
	str r0, [sp]
	ldr r0, _0221ED74 @ =0x000022E8
	ldr r1, [r1, r2]
	ldr r3, _0221ED70 @ =0x0221FF50
	adds r0, r7, r0
	ldr r2, [r3, r2]
	adds r1, #0x10
	subs r2, r2, #6
	movs r3, #0xb0
	bl ov65_0221ED80
	ldr r1, _0221ED78 @ =0x000022C8
	movs r0, #0
	str r0, [r7, r1]
	ldr r2, _0221ED7C @ =ov65_0221EE18
	subs r1, #0xa8
	str r2, [r7, r1]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221ED54: .4byte 0x00000444
_0221ED58: .4byte 0x0000069E
_0221ED5C: .4byte 0x000006A8
_0221ED60: .4byte 0x000006FE
_0221ED64: .4byte 0x00000708
_0221ED68: .4byte 0x0221FF4C
_0221ED6C: .4byte 0x000022D0
_0221ED70: .4byte 0x0221FF50
_0221ED74: .4byte 0x000022E8
_0221ED78: .4byte 0x000022C8
_0221ED7C: .4byte ov65_0221EE18
	thumb_func_end ov65_0221EC34

	thumb_func_start ov65_0221ED80
ov65_0221ED80: @ 0x0221ED80
	lsls r1, r1, #0xc
	str r1, [r0]
	lsls r1, r2, #0xc
	str r1, [r0, #4]
	lsls r1, r3, #0xc
	str r1, [r0, #0xc]
	ldr r1, [sp]
	lsls r1, r1, #0xc
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end ov65_0221ED80

	thumb_func_start ov65_0221ED94
ov65_0221ED94: @ 0x0221ED94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r7, [sp, #0x48]
	str r0, [sp]
	ldr r4, [r7]
	ldr r0, [r7, #0xc]
	str r1, [sp, #4]
	adds r6, r3, #0
	subs r0, r0, r4
	movs r1, #0x14
	str r2, [sp, #8]
	ldr r5, [sp, #0x4c]
	blx FUN_020F2998
	muls r0, r6, r0
	adds r0, r4, r0
	str r0, [sp, #0x24]
	ldr r4, [r7, #4]
	ldr r0, [r7, #0x10]
	movs r1, #0x14
	subs r0, r0, r4
	blx FUN_020F2998
	muls r0, r6, r0
	adds r0, r4, r0
	str r0, [sp, #0x28]
	ldr r0, [sp]
	add r1, sp, #0x24
	bl FUN_020247D4
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _0221EDF2
	movs r0, #5
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0x18]
	movs r0, #0x16
	ldr r1, [sp, #0x28]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #4]
	add r1, sp, #0x18
	bl FUN_020247D4
_0221EDF2:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0221EE14
	movs r0, #7
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0xc]
	movs r0, #0x16
	ldr r1, [sp, #0x28]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	add r1, sp, #0xc
	bl FUN_020247D4
_0221EE14:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov65_0221ED94

	thumb_func_start ov65_0221EE18
ov65_0221EE18: @ 0x0221EE18
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r3, _0221EEE8 @ =0x000022C8
	adds r4, r0, #0
	ldr r0, [r4, r3]
	adds r2, r3, #0
	adds r0, r0, #1
	str r0, [r4, r3]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r1, [r0]
	adds r2, #8
	adds r2, r4, r2
	lsls r0, r1, #2
	str r2, [sp]
	ldr r2, _0221EEEC @ =0x0000069C
	lsls r1, r1, #4
	adds r2, r4, r2
	adds r1, r2, r1
	movs r2, #0xdf
	str r1, [sp, #4]
	lsls r2, r2, #2
	adds r5, r4, r0
	adds r1, r2, #0
	ldr r0, [r5, r2]
	adds r1, #0x30
	adds r2, #0x60
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	ldr r3, [r4, r3]
	bl ov65_0221ED94
	adds r0, r4, #0
	adds r0, #0x98
	ldr r3, _0221EEF0 @ =0x000022E8
	ldr r5, [r0]
	adds r1, r4, r3
	str r1, [sp]
	ldr r1, _0221EEEC @ =0x0000069C
	lsls r0, r5, #2
	adds r2, r4, r1
	lsls r1, r5, #4
	adds r1, r2, r1
	movs r2, #0xdf
	lsls r2, r2, #2
	str r1, [sp, #4]
	adds r5, r4, r0
	adds r1, r2, #0
	ldr r0, [r5, r2]
	adds r1, #0x30
	adds r2, #0x60
	subs r3, #0x20
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	ldr r3, [r4, r3]
	bl ov65_0221ED94
	ldr r1, _0221EEE8 @ =0x000022C8
	ldr r0, [r4, r1]
	cmp r0, #0x15
	bne _0221EEE0
	movs r0, #1
	adds r2, r4, #0
	str r0, [sp]
	ldr r0, _0221EEF4 @ =0x00000574
	subs r1, #0xa4
	adds r2, #0x94
	ldr r1, [r4, r1]
	ldr r2, [r2]
	adds r0, r4, r0
	movs r3, #8
	bl ov65_0221D5FC
	movs r0, #1
	adds r2, r4, #0
	str r0, [sp]
	ldr r1, _0221EEF8 @ =0x00002228
	adds r2, #0x98
	ldr r0, _0221EEFC @ =0x00000584
	ldr r2, [r2]
	ldr r1, [r4, r1]
	adds r0, r4, r0
	subs r2, r2, #6
	movs r3, #8
	bl ov65_0221D5FC
	adds r1, r4, #0
	adds r1, #0x98
	ldr r1, [r1]
	adds r0, r4, #0
	bl ov65_0221CADC
	ldr r1, _0221EF00 @ =ov65_0221F028
	ldr r0, _0221EF04 @ =0x00002220
	str r1, [r4, r0]
	ldr r0, _0221EF08 @ =0x00000424
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_02024830
_0221EEE0:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0221EEE8: .4byte 0x000022C8
_0221EEEC: .4byte 0x0000069C
_0221EEF0: .4byte 0x000022E8
_0221EEF4: .4byte 0x00000574
_0221EEF8: .4byte 0x00002228
_0221EEFC: .4byte 0x00000584
_0221EF00: .4byte ov65_0221F028
_0221EF04: .4byte 0x00002220
_0221EF08: .4byte 0x00000424
	thumb_func_end ov65_0221EE18

	thumb_func_start ov65_0221EF0C
ov65_0221EF0C: @ 0x0221EF0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _0221F004 @ =0x00000574
	str r0, [sp]
	adds r0, r0, r1
	bl FUN_0201D8E4
	ldr r1, _0221F008 @ =0x00000584
	ldr r0, [sp]
	adds r0, r0, r1
	bl FUN_0201D8E4
	ldr r6, [sp]
	ldr r1, _0221F00C @ =0x00000444
	adds r0, r6, #0
	adds r0, r0, r1
	ldr r4, _0221F010 @ =0x0221FF4C
	movs r7, #0
	adds r5, r6, #0
	str r0, [sp, #4]
_0221EF34:
	ldr r0, _0221F014 @ =0x0000069C
	ldrh r0, [r6, r0]
	cmp r0, #0
	beq _0221EFB2
	movs r0, #0xdf
	lsls r0, r0, #2
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldr r0, [r5, r0]
	adds r1, #0x10
	subs r2, r2, #6
	bl ov65_0221F748
	movs r0, #0xdf
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	ldr r0, _0221F018 @ =0x0000069E
	ldrh r0, [r6, r0]
	cmp r0, #0
	beq _0221EF80
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldr r0, [r5, r0]
	adds r1, #0x24
	adds r2, #0x10
	bl ov65_0221F748
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
_0221EF80:
	ldr r0, _0221F01C @ =0x000006A8
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0221EFA6
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldr r0, [r5, r0]
	adds r1, #0x2c
	adds r2, #0x10
	bl ov65_0221F748
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
_0221EFA6:
	adds r0, r7, #7
	lsls r1, r0, #4
	ldr r0, [sp, #4]
	adds r0, r0, r1
	bl FUN_0201D5C8
_0221EFB2:
	adds r7, r7, #1
	adds r6, #0x10
	adds r4, #8
	adds r5, r5, #4
	cmp r7, #0xc
	blt _0221EF34
	movs r1, #0xd1
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #1
	bl FUN_02024830
	movs r1, #0xd2
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #1
	bl FUN_02024830
	ldr r1, _0221F00C @ =0x00000444
	ldr r0, [sp]
	ldr r2, [sp]
	adds r0, r0, r1
	movs r1, #1
	bl ov65_0221D8C4
	ldr r1, _0221F020 @ =0x00000418
	ldr r0, [sp]
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_02024830
	ldr r1, _0221F024 @ =0x00000424
	ldr r0, [sp]
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_02024830
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221F004: .4byte 0x00000574
_0221F008: .4byte 0x00000584
_0221F00C: .4byte 0x00000444
_0221F010: .4byte 0x0221FF4C
_0221F014: .4byte 0x0000069C
_0221F018: .4byte 0x0000069E
_0221F01C: .4byte 0x000006A8
_0221F020: .4byte 0x00000418
_0221F024: .4byte 0x00000424
	thumb_func_end ov65_0221EF0C

	thumb_func_start ov65_0221F028
ov65_0221F028: @ 0x0221F028
	push {r4, lr}
	sub sp, #0x10
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	ldr r0, _0221F0B0 @ =0x00002224
	adds r1, r4, #0
	adds r1, #0x94
	ldr r0, [r4, r0]
	ldr r1, [r1]
	bl FUN_02074644
	bl FUN_02070DB0
	adds r2, r0, #0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200BF8C
	adds r1, r4, #0
	ldr r0, _0221F0B4 @ =0x00002228
	adds r1, #0x98
	ldr r1, [r1]
	ldr r0, [r4, r0]
	subs r1, r1, #6
	bl FUN_02074644
	bl FUN_02070DB0
	adds r2, r0, #0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200BF8C
	movs r3, #0x62
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #8
	str r0, [sp]
	ldr r0, _0221F0B8 @ =0x000005B4
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0x15
	movs r2, #1
	bl ov65_0221FB90
	ldr r1, _0221F0BC @ =ov65_0221F120
	ldr r0, _0221F0C0 @ =0x00002220
	str r1, [r4, r0]
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221F0B0: .4byte 0x00002224
_0221F0B4: .4byte 0x00002228
_0221F0B8: .4byte 0x000005B4
_0221F0BC: .4byte ov65_0221F120
_0221F0C0: .4byte 0x00002220
	thumb_func_end ov65_0221F028

	thumb_func_start ov65_0221F0C4
ov65_0221F0C4: @ 0x0221F0C4
	push {r4, lr}
	movs r1, #0x18
	movs r2, #3
	adds r4, r0, #0
	bl ov65_0221DE24
	movs r0, #1
	str r0, [r4, #0x68]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov65_0221F0C4

	thumb_func_start ov65_0221F0D8
ov65_0221F0D8: @ 0x0221F0D8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r1, #0
	movs r1, #0
	adds r5, r0, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	adds r6, r2, #0
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r5, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221F11C @ =0x00000444
	ldr r3, [r5, r3]
	adds r1, r5, r0
	lsls r0, r4, #4
	adds r0, r1, r0
	adds r1, r6, #0
	movs r2, #1
	bl ov65_0221FB90
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221F11C: .4byte 0x00000444
	thumb_func_end ov65_0221F0D8

	thumb_func_start ov65_0221F120
ov65_0221F120: @ 0x0221F120
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	ldr r2, _0221F240 @ =0x00000664
	lsls r0, r0, #6
	movs r3, #0xdb
	adds r1, r4, r2
	adds r2, #0xc
	lsls r3, r3, #6
	ldr r0, [r4, r0]
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221F238
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221F152: @ jump table
	.2byte _0221F238 - _0221F152 - 2 @ case 0
	.2byte _0221F15C - _0221F152 - 2 @ case 1
	.2byte _0221F1F6 - _0221F152 - 2 @ case 2
	.2byte _0221F15C - _0221F152 - 2 @ case 3
	.2byte _0221F1F6 - _0221F152 - 2 @ case 4
_0221F15C:
	adds r0, r4, #0
	bl ov65_0221F79C
	cmp r0, #0
	beq _0221F1E4
	adds r0, r4, #0
	bl ov65_0221F7E0
	cmp r0, #0
	beq _0221F17A
	cmp r0, #1
	beq _0221F1AC
	cmp r0, #2
	beq _0221F1C8
	b _0221F238
_0221F17A:
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	lsls r0, r0, #4
	adds r1, r4, r0
	ldr r0, _0221F244 @ =0x000006A8
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0221F1A4
	adds r0, r4, #0
	bl ov65_0221F0C4
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #0x14
	bl ov65_0221F0D8
	ldr r1, _0221F248 @ =ov65_0221F354
	ldr r0, _0221F24C @ =0x00002220
	str r1, [r4, r0]
	b _0221F238
_0221F1A4:
	ldr r1, _0221F250 @ =ov65_0221F258
	ldr r0, _0221F24C @ =0x00002220
	str r1, [r4, r0]
	b _0221F238
_0221F1AC:
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #0x25
	bl ov65_0221F0D8
	ldr r1, _0221F248 @ =ov65_0221F354
	ldr r0, _0221F24C @ =0x00002220
	movs r2, #4
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0x18
	bl ov65_0221DE24
	b _0221F238
_0221F1C8:
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #0x26
	bl ov65_0221F0D8
	ldr r1, _0221F248 @ =ov65_0221F354
	ldr r0, _0221F24C @ =0x00002220
	movs r2, #4
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0x18
	bl ov65_0221DE24
	b _0221F238
_0221F1E4:
	ldr r1, _0221F248 @ =ov65_0221F354
	ldr r0, _0221F24C @ =0x00002220
	movs r2, #4
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0x18
	bl ov65_0221DE24
	b _0221F238
_0221F1F6:
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221F254 @ =0x000005B4
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0x14
	movs r2, #1
	bl ov65_0221FB90
	ldr r1, _0221F248 @ =ov65_0221F354
	ldr r0, _0221F24C @ =0x00002220
	movs r2, #4
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0x18
	bl ov65_0221DE24
_0221F238:
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221F240: .4byte 0x00000664
_0221F244: .4byte 0x000006A8
_0221F248: .4byte ov65_0221F354
_0221F24C: .4byte 0x00002220
_0221F250: .4byte ov65_0221F258
_0221F254: .4byte 0x000005B4
	thumb_func_end ov65_0221F120

	thumb_func_start ov65_0221F258
ov65_0221F258: @ 0x0221F258
	push {r4, lr}
	sub sp, #0x10
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x62
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #8
	str r0, [sp]
	ldr r0, _0221F29C @ =0x000005B4
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0x24
	movs r2, #1
	bl ov65_0221FB90
	ldr r1, _0221F2A0 @ =ov65_0221F2A8
	ldr r0, _0221F2A4 @ =0x00002220
	str r1, [r4, r0]
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0221F29C: .4byte 0x000005B4
_0221F2A0: .4byte ov65_0221F2A8
_0221F2A4: .4byte 0x00002220
	thumb_func_end ov65_0221F258

	thumb_func_start ov65_0221F2A8
ov65_0221F2A8: @ 0x0221F2A8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	ldr r2, _0221F344 @ =0x00000664
	lsls r0, r0, #6
	movs r3, #0xdb
	adds r1, r4, r2
	adds r2, #0xc
	lsls r3, r3, #6
	ldr r0, [r4, r0]
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221F33E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221F2DA: @ jump table
	.2byte _0221F33E - _0221F2DA - 2 @ case 0
	.2byte _0221F2E4 - _0221F2DA - 2 @ case 1
	.2byte _0221F2FC - _0221F2DA - 2 @ case 2
	.2byte _0221F2E4 - _0221F2DA - 2 @ case 3
	.2byte _0221F2FC - _0221F2DA - 2 @ case 4
_0221F2E4:
	adds r0, r4, #0
	bl ov65_0221F0C4
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #0x14
	bl ov65_0221F0D8
	ldr r1, _0221F348 @ =ov65_0221F354
	ldr r0, _0221F34C @ =0x00002220
	str r1, [r4, r0]
	b _0221F33E
_0221F2FC:
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221F350 @ =0x000005B4
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0x14
	movs r2, #1
	bl ov65_0221FB90
	ldr r1, _0221F348 @ =ov65_0221F354
	ldr r0, _0221F34C @ =0x00002220
	movs r2, #4
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0x18
	bl ov65_0221DE24
_0221F33E:
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0221F344: .4byte 0x00000664
_0221F348: .4byte ov65_0221F354
_0221F34C: .4byte 0x00002220
_0221F350: .4byte 0x000005B4
	thumb_func_end ov65_0221F2A8

	thumb_func_start ov65_0221F354
ov65_0221F354: @ 0x0221F354
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x6c]
	cmp r1, #0
	beq _0221F39C
	ldr r0, [r4, #0x70]
	cmp r0, #0
	beq _0221F39C
	cmp r1, #3
	bne _0221F37C
	cmp r0, #3
	bne _0221F37C
	ldr r0, _0221F3A0 @ =0x000036A4
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, _0221F3A4 @ =ov65_0221F3B0
	ldr r0, _0221F3A8 @ =0x00002220
	str r1, [r4, r0]
	b _0221F382
_0221F37C:
	ldr r1, _0221F3AC @ =ov65_0221E270
	ldr r0, _0221F3A8 @ =0x00002220
	str r1, [r4, r0]
_0221F382:
	movs r0, #0
	str r0, [r4, #0x6c]
	str r0, [r4, #0x70]
	adds r0, r4, #0
	bl ov65_0221F79C
	cmp r0, #0
	beq _0221F398
	movs r0, #0x18
	str r0, [r4, #0x74]
	b _0221F39C
_0221F398:
	movs r0, #0x22
	str r0, [r4, #0x74]
_0221F39C:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0221F3A0: .4byte 0x000036A4
_0221F3A4: .4byte ov65_0221F3B0
_0221F3A8: .4byte 0x00002220
_0221F3AC: .4byte ov65_0221E270
	thumb_func_end ov65_0221F354

	thumb_func_start ov65_0221F3B0
ov65_0221F3B0: @ 0x0221F3B0
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_02034AEC
	ldr r0, [r4, #8]
	adds r3, r4, #0
	adds r2, r4, #0
	ldr r1, _0221F3E8 @ =0x00002224
	str r0, [sp]
	adds r3, #0x98
	ldr r0, [r4, r1]
	adds r1, r1, #4
	adds r2, #0x94
	ldr r3, [r3]
	ldr r1, [r4, r1]
	ldr r2, [r2]
	subs r3, r3, #6
	bl ov65_0221F5A0
	ldr r1, _0221F3EC @ =ov65_0221E270
	ldr r0, _0221F3F0 @ =0x00002220
	str r1, [r4, r0]
	movs r0, #2
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0221F3E8: .4byte 0x00002224
_0221F3EC: .4byte ov65_0221E270
_0221F3F0: .4byte 0x00002220
	thumb_func_end ov65_0221F3B0

	thumb_func_start ov65_0221F3F4
ov65_0221F3F4: @ 0x0221F3F4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r1, r4, #0
	ldr r0, _0221F498 @ =0x00002228
	adds r1, #0x94
	ldr r1, [r1]
	ldr r0, [r4, r0]
	subs r1, r1, #6
	bl FUN_02074644
	bl FUN_02070DB0
	adds r2, r0, #0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200BF8C
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x62
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #8
	str r0, [sp]
	ldr r0, _0221F49C @ =0x000005A4
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0x10
	movs r2, #1
	bl ov65_0221FB90
	movs r0, #2
	movs r1, #0x1a
	bl FUN_02014918
	ldr r1, _0221F4A0 @ =0x00000668
	movs r2, #0x11
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0x19
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #0
	bl FUN_02014960
	ldr r0, _0221F4A0 @ =0x00000668
	movs r1, #0x19
	lsls r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #1
	bl FUN_02014960
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0xc
	bl ov65_0221E928
	ldr r1, _0221F4A4 @ =0x000036C8
	str r0, [r4, r1]
	ldr r1, _0221F4A8 @ =ov65_0221F4D4
	ldr r0, _0221F4AC @ =0x00002220
	str r1, [r4, r0]
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221F498: .4byte 0x00002228
_0221F49C: .4byte 0x000005A4
_0221F4A0: .4byte 0x00000668
_0221F4A4: .4byte 0x000036C8
_0221F4A8: .4byte ov65_0221F4D4
_0221F4AC: .4byte 0x00002220
	thumb_func_end ov65_0221F3F4

	thumb_func_start ov65_0221F4B0
ov65_0221F4B0: @ 0x0221F4B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221F4CC @ =0x000036C8
	ldr r0, [r4, r0]
	bl FUN_02018680
	ldr r0, _0221F4D0 @ =0x000036C4
	ldr r0, [r4, r0]
	bl FUN_02018474
	bl ov65_0221F8B4
	pop {r4, pc}
	nop
_0221F4CC: .4byte 0x000036C8
_0221F4D0: .4byte 0x000036C4
	thumb_func_end ov65_0221F4B0

	thumb_func_start ov65_0221F4D4
ov65_0221F4D4: @ 0x0221F4D4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, _0221F58C @ =0x000036C8
	ldr r0, [r4, r0]
	bl FUN_020186A4
	cmp r0, #0
	beq _0221F4F4
	cmp r0, #1
	beq _0221F540
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _0221F540
	b _0221F586
_0221F4F4:
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221F590 @ =0x00000594
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0xf
	movs r2, #1
	bl ov65_0221FB90
	ldr r1, _0221F594 @ =ov65_0221E050
	ldr r0, _0221F598 @ =0x00002220
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov65_0221F4B0
	ldr r0, _0221F59C @ =0x00000668
	ldr r0, [r4, r0]
	bl FUN_02014950
	add sp, #0x10
	movs r0, #3
	pop {r4, pc}
_0221F540:
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r3, #0x61
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	adds r3, #0xc
	str r0, [sp]
	ldr r0, _0221F590 @ =0x00000594
	ldr r3, [r4, r3]
	adds r0, r4, r0
	movs r1, #0xf
	movs r2, #1
	bl ov65_0221FB90
	adds r0, r4, #0
	bl ov65_0221F4B0
	ldr r0, _0221F59C @ =0x00000668
	ldr r0, [r4, r0]
	bl FUN_02014950
	ldr r1, _0221F594 @ =ov65_0221E050
	ldr r0, _0221F598 @ =0x00002220
	str r1, [r4, r0]
_0221F586:
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0221F58C: .4byte 0x000036C8
_0221F590: .4byte 0x00000594
_0221F594: .4byte ov65_0221E050
_0221F598: .4byte 0x00002220
_0221F59C: .4byte 0x00000668
	thumb_func_end ov65_0221F4D4

	thumb_func_start ov65_0221F5A0
ov65_0221F5A0: @ 0x0221F5A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	movs r0, #0x1a
	str r1, [sp, #4]
	adds r6, r2, #0
	str r3, [sp, #8]
	ldr r5, [sp, #0x30]
	bl FUN_0206DD2C
	str r0, [sp, #0xc]
	movs r0, #0x1a
	bl FUN_0206DD2C
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_02074644
	ldr r1, [sp, #0xc]
	bl FUN_0207188C
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl FUN_02074644
	adds r1, r4, #0
	bl FUN_0207188C
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _0221F70C @ =0x000001ED
	cmp r0, r1
	bne _0221F62C
	adds r0, r4, #0
	movs r1, #0x6e
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0221F614
	adds r0, r4, #0
	movs r1, #0x99
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0x56
	bne _0221F62C
	adds r0, r4, #0
	movs r1, #0x6e
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0221F62C
_0221F614:
	ldr r0, [r5, #0x10]
	bl FUN_020503D0
	str r0, [sp, #0x10]
	bl FUN_02066E28
	cmp r0, #0
	bne _0221F62C
	ldr r0, [sp, #0x10]
	movs r1, #1
	bl FUN_02066E38
_0221F62C:
	adds r0, r4, #0
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206EC40
	adds r0, r4, #0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0221F664
	movs r1, #0x46
	add r0, sp, #0x14
	strb r1, [r0, #1]
	movs r1, #0
	strb r1, [r0]
	add r2, sp, #0x14
	adds r0, r4, #0
	movs r1, #9
	adds r2, #1
	bl FUN_0206EC40
	adds r0, r4, #0
	movs r1, #0xbb
	add r2, sp, #0x14
	bl FUN_0206EC40
_0221F664:
	bl FUN_0203769C
	bl FUN_02034818
	adds r1, r0, #0
	movs r0, #0xb
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #5
	movs r3, #0
	bl FUN_0208F260
	adds r0, r4, #0
	bl FUN_02072894
	ldr r0, [sp, #0xc]
	ldr r1, [r5, #0x38]
	bl FUN_0207188C
	ldr r1, [r5, #0x3c]
	adds r0, r4, #0
	bl FUN_0207188C
	bl FUN_0203769C
	movs r1, #1
	eors r0, r1
	bl FUN_02034818
	ldr r1, [r5, #0x34]
	bl FUN_02028EE4
	ldr r1, _0221F710 @ =0x000001B9
	adds r0, r7, #0
	str r6, [r5, #0x28]
	bl FUN_020748CC
	cmp r0, #0
	bne _0221F6BC
	ldr r0, [r5, #0x10]
	bl FUN_0202CE64
	bl FUN_0202CE74
_0221F6BC:
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	bl FUN_0202ECC0
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_02074644
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_0207188C
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl FUN_02074644
	adds r1, r0, #0
	ldr r0, [sp, #0xc]
	bl FUN_0207188C
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_02074708
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl FUN_02074708
	ldr r0, [r5, #0x1c]
	movs r1, #0x14
	bl FUN_0202D0FC
	ldr r0, [sp, #0xc]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221F70C: .4byte 0x000001ED
_0221F710: .4byte 0x000001B9
	thumb_func_end ov65_0221F5A0

	thumb_func_start ov65_0221F714
ov65_0221F714: @ 0x0221F714
	push {r4, lr}
	ldr r3, _0221F744 @ =0x000022C4
	adds r4, r0, #0
	ldr r0, [r4, r3]
	movs r1, #6
	adds r0, r0, #2
	str r0, [r4, r3]
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	movs r2, #0
	bl FUN_0201BC8C
	movs r0, #6
	ldr r3, _0221F744 @ =0x000022C4
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	movs r1, #3
	movs r2, #0
	bl FUN_0201BC8C
	pop {r4, pc}
	.align 2, 0
_0221F744: .4byte 0x000022C4
	thumb_func_end ov65_0221F714

	thumb_func_start ov65_0221F748
ov65_0221F748: @ 0x0221F748
	push {lr}
	sub sp, #0xc
	lsls r1, r1, #0xc
	str r1, [sp]
	lsls r1, r2, #0xc
	str r1, [sp, #4]
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov65_0221F748

	thumb_func_start ov65_0221F760
ov65_0221F760: @ 0x0221F760
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221F774 @ =0x000005B4
	ldr r1, _0221F778 @ =0x000003D9
	adds r0, r4, r0
	bl FUN_0200F0AC
	ldr r1, _0221F77C @ =0x000036B4
	str r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_0221F774: .4byte 0x000005B4
_0221F778: .4byte 0x000003D9
_0221F77C: .4byte 0x000036B4
	thumb_func_end ov65_0221F760

	thumb_func_start ov65_0221F780
ov65_0221F780: @ 0x0221F780
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221F798 @ =0x000036B4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221F796
	bl FUN_0200F450
	ldr r0, _0221F798 @ =0x000036B4
	movs r1, #0
	str r1, [r4, r0]
_0221F796:
	pop {r4, pc}
	.align 2, 0
_0221F798: .4byte 0x000036B4
	thumb_func_end ov65_0221F780

	thumb_func_start ov65_0221F79C
ov65_0221F79C: @ 0x0221F79C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0221F7D8 @ =0x00002224
	movs r4, #0
	ldr r0, [r5, r0]
	bl FUN_02074640
	adds r3, r4, #0
	cmp r0, #0
	ble _0221F7C8
	adds r1, r5, #0
	adds r1, #0x94
	ldr r6, [r1]
	ldr r1, _0221F7DC @ =0x000006A1
_0221F7B8:
	cmp r3, r6
	beq _0221F7C0
	ldrb r2, [r5, r1]
	adds r4, r4, r2
_0221F7C0:
	adds r3, r3, #1
	adds r5, #0x10
	cmp r3, r0
	blt _0221F7B8
_0221F7C8:
	subs r0, r0, #1
	cmp r4, r0
	bne _0221F7D2
	movs r0, #0
	pop {r4, r5, r6, pc}
_0221F7D2:
	movs r0, #1
	pop {r4, r5, r6, pc}
	nop
_0221F7D8: .4byte 0x00002224
_0221F7DC: .4byte 0x000006A1
	thumb_func_end ov65_0221F79C

	thumb_func_start ov65_0221F7E0
ov65_0221F7E0: @ 0x0221F7E0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0221F848 @ =0x00002224
	ldr r0, [r5, r0]
	bl FUN_02074640
	adds r6, r0, #0
	movs r4, #0
	cmp r6, #0
	ble _0221F814
	ldr r7, _0221F848 @ =0x00002224
_0221F7F6:
	ldr r0, [r5, r7]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #3
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _0221F80E
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221F80E:
	adds r4, r4, #1
	cmp r4, r6
	blt _0221F7F6
_0221F814:
	ldr r0, _0221F84C @ =0x00002228
	ldr r0, [r5, r0]
	bl FUN_02074640
	adds r6, r0, #0
	movs r4, #0
	cmp r6, #0
	ble _0221F844
	ldr r7, _0221F84C @ =0x00002228
_0221F826:
	ldr r0, [r5, r7]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #3
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _0221F83E
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0221F83E:
	adds r4, r4, #1
	cmp r4, r6
	blt _0221F826
_0221F844:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221F848: .4byte 0x00002224
_0221F84C: .4byte 0x00002228
	thumb_func_end ov65_0221F7E0

	thumb_func_start ov65_0221F850
ov65_0221F850: @ 0x0221F850
	ldr r1, _0221F860 @ =0x000036B8
	movs r2, #1
	str r2, [r0, r1]
	movs r2, #0
	adds r1, r1, #4
	str r2, [r0, r1]
	bx lr
	nop
_0221F860: .4byte 0x000036B8
	thumb_func_end ov65_0221F850

	thumb_func_start ov65_0221F864
ov65_0221F864: @ 0x0221F864
	push {r3, lr}
	ldr r2, _0221F888 @ =0x000036B8
	ldr r1, [r0, r2]
	cmp r1, #0
	beq _0221F886
	adds r1, r2, #4
	ldr r1, [r0, r1]
	adds r3, r1, #1
	adds r1, r2, #4
	str r3, [r0, r1]
	ldr r1, [r0, r1]
	ldr r0, _0221F88C @ =0x00000708
	cmp r1, r0
	ble _0221F886
	movs r0, #4
	bl FUN_02039AD8
_0221F886:
	pop {r3, pc}
	.align 2, 0
_0221F888: .4byte 0x000036B8
_0221F88C: .4byte 0x00000708
	thumb_func_end ov65_0221F864

	thumb_func_start ov65_0221F890
ov65_0221F890: @ 0x0221F890
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _0221F8AC @ =0xFFFF1FFF
	ldr r3, _0221F8B0 @ =FUN_020CF178
	ands r2, r1
	lsrs r1, r0, #0xd
	orrs r1, r2
	str r1, [r0]
	adds r0, #0x50
	movs r1, #0x1e
	movs r2, #7
	bx r3
	nop
_0221F8AC: .4byte 0xFFFF1FFF
_0221F8B0: .4byte FUN_020CF178
	thumb_func_end ov65_0221F890

	thumb_func_start ov65_0221F8B4
ov65_0221F8B4: @ 0x0221F8B4
	ldr r2, _0221F8C8 @ =0x04000050
	movs r0, #0
	strh r0, [r2]
	subs r2, #0x50
	ldr r1, [r2]
	ldr r0, _0221F8CC @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	bx lr
	nop
_0221F8C8: .4byte 0x04000050
_0221F8CC: .4byte 0xFFFF1FFF
	thumb_func_end ov65_0221F8B4

	thumb_func_start ov65_0221F8D0
ov65_0221F8D0: @ 0x0221F8D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r2, #0
	movs r2, #1
	str r2, [sp]
	movs r3, #0xa
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r6, #8
	str r6, [sp, #0xc]
	adds r5, r1, #0
	str r0, [sp, #0x14]
	str r2, [sp, #0x10]
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	movs r2, #1
	adds r1, r5, #0
	str r2, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	adds r0, r6, #0
	str r0, [sp, #0xc]
	movs r0, #0x15
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	adds r1, #0x10
	movs r3, #0x14
	bl FUN_0201D40C
	adds r0, r5, #0
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x15
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	adds r0, r6, #0
	str r0, [sp, #0xc]
	movs r0, #0x29
	str r0, [sp, #0x10]
	adds r1, r5, #0
	ldr r0, [sp, #0x14]
	adds r1, #0x60
	movs r2, #1
	movs r3, #0x1a
	bl FUN_0201D40C
	adds r0, r5, #0
	adds r0, #0x60
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, _0221FAD0 @ =0x000003D9
	movs r1, #0
	movs r3, #0xa
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, _0221FAD4 @ =0x000003F7
	movs r3, #0xb
	bl FUN_0200E3DC
	movs r1, #0x15
	str r1, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r3, #2
	lsls r1, r1, #4
	str r3, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	adds r1, r5, r1
	movs r2, #0
	bl FUN_0201D40C
	movs r0, #0x15
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r3, #2
	movs r1, #0x16
	lsls r1, r1, #4
	str r3, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	adds r1, r5, r1
	movs r2, #0
	bl FUN_0201D40C
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x36
	movs r1, #0x17
	str r0, [sp, #0x10]
	lsls r1, r1, #4
	ldr r0, [sp, #0x14]
	adds r1, r5, r1
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0x17
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r1, #0xa2
	str r1, [sp, #0x10]
	adds r1, #0xee
	ldr r0, [sp, #0x14]
	adds r1, r5, r1
	movs r2, #0
	movs r3, #0x14
	bl FUN_0201D40C
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r4, _0221FAD8 @ =0x0222010C
	movs r7, #0
	movs r6, #0x33
_0221FA3A:
	adds r0, r7, #7
	lsls r0, r0, #4
	str r0, [sp, #0x18]
	ldrh r0, [r4, #2]
	ldr r1, [sp, #0x18]
	movs r2, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r3, [r4]
	ldr r0, [sp, #0x14]
	adds r1, r5, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	ldr r0, [sp, #0x18]
	movs r1, #0
	adds r0, r5, r0
	bl FUN_0201D978
	adds r7, r7, #1
	adds r6, #0x10
	adds r4, r4, #4
	cmp r7, #0xe
	blt _0221FA3A
	ldr r4, _0221FADC @ =0x02220144
	movs r6, #0
_0221FA84:
	adds r0, r6, #0
	adds r0, #0x1a
	lsls r7, r0, #4
	ldrh r0, [r4, #2]
	adds r1, r5, r7
	movs r2, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r4, #6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldrh r0, [r4, #8]
	str r0, [sp, #0x10]
	ldrh r3, [r4]
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r0, r5, r7
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #0xa
	cmp r6, #8
	blt _0221FA84
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0221FAD0: .4byte 0x000003D9
_0221FAD4: .4byte 0x000003F7
_0221FAD8: .4byte 0x0222010C
_0221FADC: .4byte 0x02220144
	thumb_func_end ov65_0221F8D0

	thumb_func_start ov65_0221FAE0
ov65_0221FAE0: @ 0x0221FAE0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
_0221FAE6:
	adds r0, r5, #7
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
	adds r5, r5, #1
	cmp r5, #0xe
	blt _0221FAE6
	movs r5, #0
_0221FAF8:
	adds r0, r5, #0
	adds r0, #0x1a
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
	adds r5, r5, #1
	cmp r5, #8
	blt _0221FAF8
	adds r0, r4, #0
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x10
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x60
	bl FUN_0201D520
	movs r0, #0x15
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0x17
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov65_0221FAE0

	thumb_func_start ov65_0221FB4C
ov65_0221FB4C: @ 0x0221FB4C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r3, #0
	ldr r3, [sp, #0x20]
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r3, #1
	bne _0221FB70
	movs r0, #0
	adds r2, r0, #0
	bl FUN_02002F30
	ldrb r1, [r5, #7]
	lsls r1, r1, #3
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r3, r0, #1
_0221FB70:
	ldr r0, [sp, #0x24]
	movs r1, #0
	str r0, [sp]
	ldr r0, _0221FB8C @ =0x000B0C00
	str r4, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0221FB8C: .4byte 0x000B0C00
	thumb_func_end ov65_0221FB4C

	thumb_func_start ov65_0221FB90
ov65_0221FB90: @ 0x0221FB90
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, [sp, #0x20]
	adds r2, r6, #0
	movs r3, #0x1a
	bl FUN_0200BC4C
	adds r6, r0, #0
	cmp r4, #1
	bne _0221FBBA
	ldr r2, _0221FBFC @ =0x000003D9
	adds r0, r5, #0
	movs r1, #1
	movs r3, #0xa
	bl FUN_0200E998
	b _0221FBC6
_0221FBBA:
	ldr r2, _0221FC00 @ =0x000003F7
	adds r0, r5, #0
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E580
_0221FBC6:
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221FC04 @ =0x0001020F
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r6, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0221FBFC: .4byte 0x000003D9
_0221FC00: .4byte 0x000003F7
_0221FC04: .4byte 0x0001020F
	thumb_func_end ov65_0221FB90

	thumb_func_start ov65_0221FC08
ov65_0221FC08: @ 0x0221FC08
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #6
	lsls r0, r0, #6
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	str r4, [sp]
	movs r0, #0x1a
	add r2, sp, #0
	strb r0, [r2, #0x10]
	movs r1, #0xa
	strb r1, [r2, #0x11]
	ldrb r3, [r2, #0x12]
	movs r1, #0xf
	bics r3, r1
	strb r3, [r2, #0x12]
	ldrb r3, [r2, #0x12]
	movs r1, #0xf0
	bics r3, r1
	strb r3, [r2, #0x12]
	bl FUN_0201660C
	add r1, sp, #0
	adds r4, r0, #0
	bl FUN_020166FC
	adds r0, r4, #0
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov65_0221FC08

	thumb_func_start ov65_0221FC54
ov65_0221FC54: @ 0x0221FC54
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	ldr r1, [r5]
	movs r6, #0
	adds r4, r3, #0
	mvns r6, r6
	cmp r1, #0
	beq _0221FC6A
	cmp r1, #1
	beq _0221FC82
	b _0221FC9A
_0221FC6A:
	bl ov65_0221FC08
	str r0, [r4]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0221FC7A
	bl ov65_0221F890
_0221FC7A:
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0221FC9A
_0221FC82:
	ldr r0, [r4]
	bl FUN_020168F4
	adds r6, r0, #0
	beq _0221FC9A
	ldr r0, [r4]
	bl FUN_02016624
	bl ov65_0221F8B4
	movs r0, #0
	str r0, [r5]
_0221FC9A:
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov65_0221FC54

	thumb_func_start ov65_0221FCA0
ov65_0221FCA0: @ 0x0221FCA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _0221FD10 @ =0x0000034D
	adds r4, r2, #0
	adds r6, r1, #0
	str r0, [sp, #0x10]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0x13
	bl FUN_0201D40C
	ldr r2, _0221FD14 @ =0x000003F7
	adds r0, r4, #0
	movs r1, #0
	movs r3, #0xb
	bl FUN_0200E580
	ldr r3, _0221FD18 @ =0x022200EC
	add r2, sp, #0x14
	adds r7, r2, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	adds r1, r6, #1
	add r0, sp, #0x14
	strh r1, [r0, #0x10]
	movs r1, #5
	strh r1, [r0, #0x12]
	ldr r0, _0221FD1C @ =ov65_0221FD20
	movs r1, #0
	str r0, [sp, #0x18]
	adds r0, r7, #0
	adds r2, r1, #0
	movs r3, #0x1a
	str r5, [sp, #0x14]
	str r4, [sp, #0x20]
	bl FUN_020011DC
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0221FD10: .4byte 0x0000034D
_0221FD14: .4byte 0x000003F7
_0221FD18: .4byte 0x022200EC
_0221FD1C: .4byte ov65_0221FD20
	thumb_func_end ov65_0221FCA0

	thumb_func_start ov65_0221FD20
ov65_0221FD20: @ 0x0221FD20
	push {r3, lr}
	cmp r2, #0
	bne _0221FD2C
	ldr r0, _0221FD30 @ =0x000005DC
	bl FUN_0200604C
_0221FD2C:
	pop {r3, pc}
	nop
_0221FD30: .4byte 0x000005DC
	thumb_func_end ov65_0221FD20

	.rodata

_0221FD34:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x0C
	.byte 0x00, 0x00, 0x80, 0x01, 0xCE, 0x01, 0x4E, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x47, 0x00, 0x3F
	.byte 0x20, 0x47, 0x40, 0x7F, 0x48, 0x6F, 0x00, 0x3F, 0x48, 0x6F, 0x40, 0x7F, 0x70, 0x97, 0x00, 0x3F
	.byte 0x70, 0x97, 0x40, 0x7F, 0x20, 0x47, 0x80, 0xBF, 0x20, 0x47, 0xC0, 0xFF, 0x48, 0x6F, 0x80, 0xBF
	.byte 0x48, 0x6F, 0xC0, 0xFF, 0x70, 0x97, 0x80, 0xBF, 0x70, 0x97, 0xC0, 0xFF, 0xA0, 0xC0, 0xC8, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0xE3, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00
	.byte 0x33, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00
	.byte 0x33, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00
	.byte 0x36, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00
	.byte 0x3A, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x48, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x70, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x48, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x70, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x00, 0x00, 0x04, 0x02, 0x0C, 0x0C, 0x00, 0x00, 0x02, 0x04, 0x0C, 0x0C, 0x00, 0x00
	.byte 0x07, 0x06, 0x01, 0x00, 0x00, 0x00, 0x01, 0x06, 0x07, 0x00, 0x00, 0x00, 0x05, 0x03, 0x0C, 0x0C
	.byte 0x00, 0x00, 0x03, 0x05, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x07, 0x06, 0x01, 0x00, 0x00, 0x06, 0x07
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x08, 0x07, 0x06, 0x00, 0x00, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01
	.byte 0x00, 0x00, 0x05, 0x01, 0x01, 0x01, 0x00, 0x00, 0x02, 0x09, 0x08, 0x07, 0x00, 0x00, 0x08, 0x09
	.byte 0x06, 0x06, 0x00, 0x00, 0x02, 0x02, 0x02, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0A, 0x09, 0x08, 0x07, 0x06, 0x05, 0x03, 0x01, 0x00, 0x00, 0x00, 0x03, 0x03, 0x03, 0x03
	.byte 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x04, 0x04, 0x04, 0x04, 0x00, 0x00, 0x0A, 0x08
	.byte 0x06, 0x00, 0x00, 0x00, 0x0A, 0x08, 0x0C, 0x00, 0x00, 0x00, 0x08, 0x0A, 0x0C, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x09, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x02, 0x01, 0x00, 0x00, 0x00, 0x09, 0x07, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x04, 0x03, 0x02, 0x01, 0x00, 0x0B, 0x09, 0x07, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0x09, 0x07, 0x06, 0x00, 0x00, 0x07, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x20, 0x00
	.byte 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00
	.byte 0x08, 0x00, 0x07, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x08, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x11, 0x00
	.byte 0x08, 0x00, 0x11, 0x00, 0x10, 0x00, 0x07, 0x00, 0x18, 0x00, 0x07, 0x00, 0x10, 0x00, 0x0C, 0x00
	.byte 0x18, 0x00, 0x0C, 0x00, 0x10, 0x00, 0x11, 0x00, 0x18, 0x00, 0x11, 0x00, 0x04, 0x00, 0x08, 0x00
	.byte 0x14, 0x00, 0x08, 0x00, 0x04, 0x00, 0x01, 0x00, 0x09, 0x00, 0x02, 0x00, 0x01, 0x00, 0x14, 0x00
	.byte 0x01, 0x00, 0x09, 0x00, 0x02, 0x00, 0x13, 0x00, 0x04, 0x00, 0x03, 0x00, 0x08, 0x00, 0x02, 0x00
	.byte 0x25, 0x00, 0x14, 0x00, 0x03, 0x00, 0x08, 0x00, 0x02, 0x00, 0x35, 0x00, 0x02, 0x00, 0x13, 0x00
	.byte 0x07, 0x00, 0x02, 0x00, 0x45, 0x00, 0x12, 0x00, 0x13, 0x00, 0x07, 0x00, 0x02, 0x00, 0x53, 0x00
	.byte 0x02, 0x00, 0x15, 0x00, 0x0C, 0x00, 0x02, 0x00, 0x61, 0x00, 0x12, 0x00, 0x15, 0x00, 0x0C, 0x00
	.byte 0x02, 0x00, 0x79, 0x00
	@ 0x02220194
