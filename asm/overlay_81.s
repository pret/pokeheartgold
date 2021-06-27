
	thumb_func_start ov81_0223DD60
ov81_0223DD60: @ 0x0223DD60
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _0223DE90 @ =0x00000050
	movs r1, #2
	bl FUN_02006FF8
	bl ov81_02240D2C
	movs r0, #3
	movs r1, #0x64
	lsls r2, r0, #0x10
	bl FUN_0201A910
	ldr r1, _0223DE94 @ =0x0000048C
	adds r0, r5, #0
	movs r2, #0x64
	bl FUN_02007280
	ldr r2, _0223DE94 @ =0x0000048C
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r2, #2
	movs r1, #0
	ldr r0, _0223DE98 @ =ov81_02242BC8
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0x64
	adds r3, r1, #0
	bl FUN_02026EB4
	movs r1, #0x69
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x64
	bl FUN_0201AC88
	str r0, [r4, #0x4c]
	str r5, [r4]
	adds r0, r5, #0
	bl FUN_020072A4
	movs r3, #0x6f
	movs r2, #0xf
	ldr r1, [r0]
	lsls r3, r3, #2
	str r1, [r4, r3]
	ldrb r1, [r0, #4]
	lsls r2, r2, #6
	strb r1, [r4, #9]
	ldrb r1, [r0, #5]
	strb r1, [r4, #0xa]
	ldrb r1, [r0, #6]
	strb r1, [r4, #0xb]
	ldr r1, [r0, #8]
	str r1, [r4, r2]
	ldr r5, [r0, #0xc]
	adds r1, r2, #4
	str r5, [r4, r1]
	adds r0, #0x10
	adds r2, #0x14
	str r0, [r4, r2]
	ldr r0, [r4, r3]
	bl FUN_02028EA8
	movs r1, #0x6e
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #8
	str r0, [r4, #0x14]
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _0223DE10
	movs r0, #6
	strb r0, [r4, #0x12]
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02243240
	ldr r1, _0223DE9C @ =0x00000464
	str r0, [r4, r1]
	b _0223DE4C
_0223DE10:
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223DE34
	movs r0, #2
	strb r0, [r4, #0x12]
	movs r0, #3
	strb r0, [r4, #0x1a]
	movs r0, #6
	strb r0, [r4, #0x1b]
	adds r0, r4, #0
	movs r1, #0
	bl ov81_022432DC
	ldr r1, _0223DE9C @ =0x00000464
	str r0, [r4, r1]
	b _0223DE4C
_0223DE34:
	movs r0, #3
	strb r0, [r4, #0x12]
	movs r0, #4
	strb r0, [r4, #0x1a]
	movs r0, #5
	strb r0, [r4, #0x1b]
	adds r0, r4, #0
	movs r1, #0
	bl ov81_022432AC
	ldr r1, _0223DE9C @ =0x00000464
	str r0, [r4, r1]
_0223DE4C:
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223DE5A
	movs r1, #2
	b _0223DE5C
_0223DE5A:
	movs r1, #3
_0223DE5C:
	ldr r0, _0223DEA0 @ =0x0000047C
	str r1, [r4, r0]
	ldr r0, _0223DEA4 @ =0x0000046C
	adds r0, r4, r0
	bl ov81_02241BB8
	adds r0, r4, #0
	bl ov81_02240D64
	movs r0, #1
	bl FUN_02002B8C
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223DE84
	adds r0, r4, #0
	bl FUN_02096910
_0223DE84:
	movs r0, #0
	str r0, [r6]
	movs r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0223DE90: .4byte 0x00000050
_0223DE94: .4byte 0x0000048C
_0223DE98: .4byte ov81_02242BC8
_0223DE9C: .4byte 0x00000464
_0223DEA0: .4byte 0x0000047C
_0223DEA4: .4byte 0x0000046C
	thumb_func_end ov81_0223DD60

	thumb_func_start ov81_0223DEA8
ov81_0223DEA8: @ 0x0223DEA8
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, _0223E1A0 @ =0x00000458
	adds r4, r0, #0
	ldrh r1, [r4, r1]
	cmp r1, #1
	bne _0223DEF0
	ldr r1, [r5]
	cmp r1, #9
	bhi _0223DEF0
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223DECC: @ jump table
	.2byte _0223DEF0 - _0223DECC - 2 @ case 0
	.2byte _0223DEF0 - _0223DECC - 2 @ case 1
	.2byte _0223DEF0 - _0223DECC - 2 @ case 2
	.2byte _0223DEF0 - _0223DECC - 2 @ case 3
	.2byte _0223DEF0 - _0223DECC - 2 @ case 4
	.2byte _0223DEF0 - _0223DECC - 2 @ case 5
	.2byte _0223DEE0 - _0223DECC - 2 @ case 6
	.2byte _0223DEE0 - _0223DECC - 2 @ case 7
	.2byte _0223DEE0 - _0223DECC - 2 @ case 8
	.2byte _0223DEE0 - _0223DECC - 2 @ case 9
_0223DEE0:
	ldrb r1, [r4, #0x13]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	bne _0223DEF0
	adds r1, r5, #0
	movs r2, #0xb
	bl ov81_022404AC
_0223DEF0:
	adds r0, r4, #0
	bl ov81_02242514
	ldr r0, [r5]
	cmp r0, #0xe
	bhi _0223DF94
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223DF08: @ jump table
	.2byte _0223DF26 - _0223DF08 - 2 @ case 0
	.2byte _0223DF56 - _0223DF08 - 2 @ case 1
	.2byte _0223DF3C - _0223DF08 - 2 @ case 2
	.2byte _0223DF84 - _0223DF08 - 2 @ case 3
	.2byte _0223DFE6 - _0223DF08 - 2 @ case 4
	.2byte _0223E01A - _0223DF08 - 2 @ case 5
	.2byte _0223E030 - _0223DF08 - 2 @ case 6
	.2byte _0223E07A - _0223DF08 - 2 @ case 7
	.2byte _0223E0CC - _0223DF08 - 2 @ case 8
	.2byte _0223E12A - _0223DF08 - 2 @ case 9
	.2byte _0223E17C - _0223DF08 - 2 @ case 10
	.2byte _0223E1B6 - _0223DF08 - 2 @ case 11
	.2byte _0223E1E0 - _0223DF08 - 2 @ case 12
	.2byte _0223E1F6 - _0223DF08 - 2 @ case 13
	.2byte _0223E204 - _0223DF08 - 2 @ case 14
_0223DF26:
	adds r0, r4, #0
	bl ov81_0223E318
	cmp r0, #1
	bne _0223DF94
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov81_022404AC
	b _0223E218
_0223DF3C:
	adds r0, r4, #0
	bl ov81_0223EC88
	cmp r0, #1
	bne _0223DF52
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov81_022404AC
	b _0223DF56
_0223DF52:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223DF56:
	adds r0, r4, #0
	bl ov81_0223E520
	cmp r0, #1
	bne _0223DF94
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _0223DF78
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl ov81_022404AC
	b _0223E218
_0223DF78:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #6
	bl ov81_022404AC
	b _0223E218
_0223DF84:
	adds r0, r4, #0
	bl ov81_02241144
	adds r0, r4, #0
	bl ov81_0223ECE4
	cmp r0, #1
	beq _0223DF96
_0223DF94:
	b _0223E218
_0223DF96:
	ldrb r0, [r4, #0x13]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0223DFAC
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ov81_022404AC
	b _0223E218
_0223DFAC:
	ldrb r0, [r4, #9]
	bl ov81_02240F18
	ldrb r1, [r4, #0x11]
	cmp r1, r0
	bne _0223DFC4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl ov81_022404AC
	b _0223E218
_0223DFC4:
	adds r0, r4, #0
	bl ov81_02240F28
	cmp r0, #1
	bne _0223DFDA
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xd
	bl ov81_022404AC
	b _0223E218
_0223DFDA:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl ov81_022404AC
	b _0223E218
_0223DFE6:
	adds r0, r4, #0
	bl ov81_02241144
	adds r0, r4, #0
	bl ov81_0223F1A4
	cmp r0, #1
	bne _0223E0D6
	ldrb r0, [r4, #9]
	bl ov81_02240F18
	ldrb r1, [r4, #0x11]
	cmp r1, r0
	bne _0223E00E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xd
	bl ov81_022404AC
	b _0223E218
_0223E00E:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl ov81_022404AC
	b _0223E218
_0223E01A:
	adds r0, r4, #0
	bl ov81_0223F314
	cmp r0, #1
	bne _0223E0D6
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl ov81_022404AC
	b _0223E218
_0223E030:
	adds r0, r4, #0
	bl ov81_0223F38C
	cmp r0, #1
	bne _0223E0D6
	ldrb r0, [r4, #0x13]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0223E050
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ov81_022404AC
	b _0223E218
_0223E050:
	adds r0, r4, #0
	bl ov81_02240F28
	cmp r0, #1
	bne _0223E06E
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02240F38
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl ov81_022404AC
	b _0223E218
_0223E06E:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	bl ov81_022404AC
	b _0223E218
_0223E07A:
	adds r0, r4, #0
	bl ov81_0223F6A8
	cmp r0, #1
	bne _0223E0D6
	adds r0, r4, #0
	bl ov81_02240F28
	cmp r0, #1
	bne _0223E0A2
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02240F38
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #6
	bl ov81_022404AC
	b _0223E218
_0223E0A2:
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223E0C0
	ldrb r1, [r4, #0x13]
	movs r0, #8
	movs r2, #0xb
	bics r1, r0
	strb r1, [r4, #0x13]
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov81_022404AC
	b _0223E218
_0223E0C0:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xd
	bl ov81_022404AC
	b _0223E218
_0223E0CC:
	adds r0, r4, #0
	bl ov81_0223F770
	cmp r0, #1
	beq _0223E0D8
_0223E0D6:
	b _0223E218
_0223E0D8:
	adds r0, r4, #0
	bl ov81_02240F28
	cmp r0, #1
	bne _0223E0F6
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02240F38
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #9
	bl ov81_022404AC
	b _0223E218
_0223E0F6:
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	bne _0223E108
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	bl ov81_022404AC
	b _0223E218
_0223E108:
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223E11E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xb
	bl ov81_022404AC
	b _0223E218
_0223E11E:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xd
	bl ov81_022404AC
	b _0223E218
_0223E12A:
	adds r0, r4, #0
	bl ov81_0223FBAC
	cmp r0, #1
	bne _0223E218
	adds r0, r4, #0
	bl ov81_02240F28
	cmp r0, #1
	bne _0223E152
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02240F38
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #8
	bl ov81_022404AC
	b _0223E218
_0223E152:
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223E170
	ldrb r1, [r4, #0x13]
	movs r0, #8
	movs r2, #0xb
	bics r1, r0
	strb r1, [r4, #0x13]
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov81_022404AC
	b _0223E218
_0223E170:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xd
	bl ov81_022404AC
	b _0223E218
_0223E17C:
	adds r0, r4, #0
	bl ov81_0223FC74
	cmp r0, #1
	bne _0223E218
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	bne _0223E1A4
	adds r0, r4, #0
	bl ov81_0223E8BC
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #6
	bl ov81_022404AC
	b _0223E218
	nop
_0223E1A0: .4byte 0x00000458
_0223E1A4:
	adds r0, r4, #0
	bl ov81_0223EA98
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #8
	bl ov81_022404AC
	b _0223E218
_0223E1B6:
	adds r0, r4, #0
	bl ov81_02240008
	cmp r0, #1
	bne _0223E218
	ldr r0, _0223E230 @ =0x00000458
	ldrh r0, [r4, r0]
	cmp r0, #1
	bne _0223E1D4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xe
	bl ov81_022404AC
	b _0223E218
_0223E1D4:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xc
	bl ov81_022404AC
	b _0223E218
_0223E1E0:
	adds r0, r4, #0
	bl ov81_02240048
	cmp r0, #1
	bne _0223E218
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xd
	bl ov81_022404AC
	b _0223E218
_0223E1F6:
	adds r0, r4, #0
	bl ov81_02240088
	cmp r0, #1
	bne _0223E218
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223E204:
	adds r0, r4, #0
	bl ov81_022400D0
	cmp r0, #1
	bne _0223E218
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xc
	bl ov81_022404AC
_0223E218:
	movs r0, #0x71
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202457C
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_02242C48
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223E230: .4byte 0x00000458
	thumb_func_end ov81_0223DEA8

	thumb_func_start ov81_0223E234
ov81_0223E234: @ 0x0223E234
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02003B44
	cmp r0, #0
	beq _0223E260
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200374C
	ldr r0, _0223E308 @ =0x00000478
	movs r1, #0xff
	str r1, [r4, r0]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0223E260:
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _0223E29A
	ldrb r0, [r4, #9]
	movs r7, #0
	bl ov81_02240F18
	cmp r0, #0
	ble _0223E2CE
	adds r6, r4, #0
	adds r5, r7, #0
_0223E27C:
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r1, [r6, r0]
	adds r0, #0xc
	ldr r0, [r4, r0]
	adds r6, r6, #2
	strh r1, [r0, r5]
	ldrb r0, [r4, #9]
	adds r5, r5, #2
	adds r7, r7, #1
	bl ov81_02240F18
	cmp r7, r0
	blt _0223E27C
	b _0223E2CE
_0223E29A:
	movs r7, #0xf2
	lsls r7, r7, #2
	movs r6, #0
	adds r0, r7, #0
	adds r3, r4, #0
	adds r5, r6, #0
	adds r0, #0xc
_0223E2A8:
	ldrh r2, [r3, r7]
	ldr r1, [r4, r0]
	adds r6, r6, #1
	strh r2, [r1, r5]
	adds r3, r3, #2
	adds r5, r5, #2
	cmp r6, #2
	blt _0223E2A8
	ldrb r0, [r4, #0x13]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	bne _0223E2CE
	movs r0, #0xf5
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	movs r2, #0xff
	strh r2, [r1]
	ldr r0, [r4, r0]
	strh r2, [r0, #2]
_0223E2CE:
	movs r0, #0
	bl FUN_02002B8C
	ldr r0, _0223E30C @ =0x0000046C
	ldr r0, [r4, r0]
	bl ov81_02241BC8
	ldr r0, _0223E310 @ =0x00000464
	ldr r0, [r4, r0]
	bl ov81_02243220
	adds r0, r4, #0
	bl ov81_02240BB0
	ldr r0, [sp]
	bl FUN_02007294
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x64
	bl FUN_0201A9C4
	ldr r0, _0223E314 @ =0x00000050
	bl FUN_02006F7C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223E308: .4byte 0x00000478
_0223E30C: .4byte 0x0000046C
_0223E310: .4byte 0x00000464
_0223E314: .4byte 0x00000050
	thumb_func_end ov81_0223E234

	thumb_func_start ov81_0223E318
ov81_0223E318: @ 0x0223E318
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #6
	bhi _0223E3EE
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223E330: @ jump table
	.2byte _0223E33E - _0223E330 - 2 @ case 0
	.2byte _0223E35A - _0223E330 - 2 @ case 1
	.2byte _0223E382 - _0223E330 - 2 @ case 2
	.2byte _0223E3E6 - _0223E330 - 2 @ case 3
	.2byte _0223E402 - _0223E330 - 2 @ case 4
	.2byte _0223E450 - _0223E330 - 2 @ case 5
	.2byte _0223E46A - _0223E330 - 2 @ case 6
_0223E33E:
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223E352
	bl FUN_02037BEC
	movs r0, #0xed
	bl FUN_02037AC0
_0223E352:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E35A:
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223E37A
	movs r0, #0xed
	bl FUN_02037B38
	cmp r0, #1
	bne _0223E3EE
	bl FUN_02037BEC
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E37A:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E382:
	ldrb r0, [r4, #0x12]
	movs r6, #0
	cmp r0, #0
	ble _0223E3AA
	movs r7, #0x36
	adds r5, r4, #0
	lsls r7, r7, #4
_0223E390:
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl ov81_02242F30
	ldr r0, [r5, r7]
	bl ov81_02242F60
	ldrb r0, [r4, #0x12]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _0223E390
_0223E3AA:
	movs r3, #0x42
	ldr r0, [r4, #0x4c]
	movs r1, #6
	movs r2, #0
	lsls r3, r3, #2
	bl FUN_0201BC8C
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #6
	movs r2, #1
	bl FUN_020087A4
	movs r0, #6
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E3E6:
	bl FUN_0200FB5C
	cmp r0, #0
	bne _0223E3F0
_0223E3EE:
	b _0223E508
_0223E3F0:
	ldr r0, _0223E510 @ =0x00000611
	bl FUN_0200604C
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E402:
	bl ov81_022404B4
	cmp r0, #1
	bne _0223E508
	ldr r0, _0223E510 @ =0x00000611
	movs r1, #0
	bl FUN_02006154
	ldr r0, _0223E514 @ =0x00000678
	bl FUN_0200604C
	ldrb r0, [r4, #0x12]
	movs r6, #0
	cmp r0, #0
	ble _0223E438
	movs r7, #0x36
	adds r5, r4, #0
	lsls r7, r7, #4
_0223E426:
	ldr r0, [r5, r7]
	movs r1, #4
	bl ov81_02242F94
	ldrb r0, [r4, #0x12]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _0223E426
_0223E438:
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02240658
	movs r0, #8
	str r0, [r4, #0x14]
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E450:
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov81_02242DD8
	cmp r0, #1
	beq _0223E508
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E508
_0223E46A:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	bne _0223E4E2
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _0223E4A8
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
	ldr r0, _0223E518 @ =0x0000FFFF
	movs r1, #0x10
	str r0, [sp]
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0
	movs r3, #1
	bl FUN_020090E4
	b _0223E4E2
_0223E4A8:
	ldr r0, _0223E51C @ =0x0000047C
	movs r6, #0
	ldr r0, [r4, r0]
	cmp r0, #0
	bls _0223E4CE
	ldr r7, _0223E51C @ =0x0000047C
	adds r5, r4, #0
_0223E4B6:
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4, r7]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blo _0223E4B6
_0223E4CE:
	ldr r0, _0223E518 @ =0x0000FFFF
	movs r1, #0x10
	str r0, [sp]
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0
	movs r3, #1
	bl FUN_020090E4
_0223E4E2:
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02009138
	ldrb r0, [r4, #0x19]
	adds r0, r0, #1
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #0x19]
	cmp r0, #2
	blo _0223E508
	movs r0, #0
	strb r0, [r4, #0x19]
	adds r0, r4, #0
	bl ov81_02241398
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0223E508:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0223E510: .4byte 0x00000611
_0223E514: .4byte 0x00000678
_0223E518: .4byte 0x0000FFFF
_0223E51C: .4byte 0x0000047C
	thumb_func_end ov81_0223E318

	thumb_func_start ov81_0223E520
ov81_0223E520: @ 0x0223E520
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _0223E532
	cmp r1, #1
	beq _0223E59E
	b _0223E5AC
_0223E532:
	movs r1, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _0223E544
	adds r0, r4, #0
	bl ov81_0223E5B4
	b _0223E54A
_0223E544:
	adds r0, r4, #0
	bl ov81_0223E8BC
_0223E54A:
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223E56C
	movs r2, #0
	adds r1, r4, #0
	adds r0, r4, #0
	adds r1, #0x60
	adds r3, r2, #0
	str r2, [sp]
	bl ov81_0224093C
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
_0223E56C:
	ldrb r0, [r4, #0x13]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0223E58E
	movs r0, #6
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
_0223E58E:
	ldrb r1, [r4, #0x13]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E5AC
_0223E59E:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223E5AC
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_0223E5AC:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov81_0223E520

	thumb_func_start ov81_0223E5B4
ov81_0223E5B4: @ 0x0223E5B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	bl FUN_02236DD4
	str r0, [sp, #0x18]
	adds r0, r5, #0
	movs r1, #0
	bl ov81_02240F38
	adds r0, r5, #0
	bl ov81_02241524
	ldr r1, _0223E864 @ =0x00000464
	add r2, sp, #0x28
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	add r3, sp, #0x24
	bl ov81_02243228
	movs r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x28]
	movs r2, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	adds r3, r1, #0
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov81_02242D18
	movs r1, #0xe2
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r1, #0xdc
	ldr r0, [r5, r1]
	movs r1, #6
	add r2, sp, #0x28
	add r3, sp, #0x24
	bl ov81_02243228
	movs r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x28]
	movs r2, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	adds r3, r1, #0
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov81_02242D18
	movs r1, #0xe3
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r5, #0
	add r1, sp, #0x28
	add r2, sp, #0x24
	bl ov81_02241CA0
	movs r2, #0
	str r2, [sp]
	ldr r0, [sp, #0x28]
	movs r1, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	adds r3, r2, #0
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov81_02242CBC
	movs r1, #0x39
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov81_02241F50
	adds r0, r5, #0
	bl ov81_02241FEC
	adds r0, r5, #0
	bl ov81_022420B4
	adds r0, r5, #0
	bl ov81_0224218C
	movs r2, #0
	str r2, [sp]
	movs r0, #0x50
	str r0, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #4
	adds r3, r2, #0
	bl ov81_02242D18
	movs r1, #0xe5
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r2, #0
	str r2, [sp]
	movs r0, #0x50
	str r0, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #5
	adds r3, r2, #0
	bl ov81_02242D18
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r2, #0
	str r0, [r5, r2]
	adds r1, #0x28
	adds r2, #0xd0
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	adds r0, r5, #0
	movs r3, #6
	bl ov81_02242218
	ldr r1, _0223E868 @ =0x00000468
	adds r0, r5, #0
	ldr r1, [r5, r1]
	movs r2, #6
	bl ov81_02242300
	ldr r0, _0223E86C @ =0x00000474
	movs r1, #0
	ldr r0, [r5, r0]
	movs r2, #7
	adds r3, r1, #0
	bl FUN_020196E8
	movs r2, #0
	adds r1, r5, #0
	str r2, [sp]
	adds r0, r5, #0
	adds r1, #0x50
	adds r3, r2, #0
	bl ov81_022408C4
	ldrb r0, [r5, #0x11]
	movs r6, #0
	cmp r0, #0
	ble _0223E740
	movs r7, #0x36
	adds r4, r5, #0
	lsls r7, r7, #4
_0223E6FA:
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F48
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	bl ov81_02242FB0
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	movs r1, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, r7]
	bl ov81_02242F94
	ldrb r0, [r5, #0x11]
	adds r6, r6, #1
	adds r4, r4, #2
	cmp r6, r0
	blt _0223E6FA
_0223E740:
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0xc0
	bl ov81_02243028
	ldrb r2, [r5, #0x11]
	adds r0, r5, #0
	movs r1, #0
	adds r2, r2, #1
	bl ov81_022408A0
	adds r0, r5, #0
	movs r1, #0
	bl ov81_0224086C
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x13]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0223E85A
	adds r0, r5, #0
	bl ov81_02241D0C
	str r0, [sp, #0x1c]
	ldrb r0, [r5, #0x11]
	movs r6, #0
	cmp r0, #0
	ble _0223E79E
	movs r7, #0x6b
	adds r4, r5, #0
	lsls r7, r7, #2
_0223E78A:
	ldr r0, [r4, r7]
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
	ldrb r0, [r5, #0x11]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blt _0223E78A
_0223E79E:
	ldr r0, [sp, #0x1c]
	movs r2, #0
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #6
	bl FUN_020087A4
	ldr r2, _0223E868 @ =0x00000468
	ldr r1, [sp, #0x1c]
	ldr r2, [r5, r2]
	adds r0, r5, #0
	movs r3, #0
	bl ov81_02241E68
	adds r0, r5, #0
	bl ov81_02241FEC
	ldr r1, _0223E870 @ =0x0000047C
	ldr r0, [sp, #0x1c]
	ldr r1, [r5, r1]
	add r2, sp, #0x28
	add r3, sp, #0x24
	bl ov81_02241C84
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x24]
	bl ov81_02242D94
	adds r0, r5, #0
	movs r1, #0xff
	bl ov81_02240658
	adds r0, r5, #0
	bl ov81_02241450
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	beq _0223E860
	ldr r0, [sp, #0x18]
	movs r4, #0
	cmp r0, #0
	ble _0223E860
	adds r7, r5, #0
	adds r6, r5, #0
	adds r7, #0x50
_0223E804:
	adds r0, r4, #5
	lsls r0, r0, #4
	str r0, [sp, #0x20]
	adds r0, r7, r0
	movs r1, #0
	bl FUN_0201D978
	ldrb r0, [r5, #0x18]
	cmp r4, r0
	bge _0223E844
	movs r0, #0xf
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _0223E874 @ =0x0000045A
	ldr r1, [sp, #0x20]
	ldrh r0, [r6, r0]
	movs r2, #0
	adds r1, r7, r1
	str r0, [sp, #0x10]
	ldr r0, _0223E878 @ =0x0000045E
	adds r3, r2, #0
	ldrh r0, [r6, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	adds r0, r5, #0
	bl ov81_02240AD8
_0223E844:
	ldr r0, [sp, #0x20]
	adds r0, r7, r0
	bl FUN_0201D5C8
	ldr r0, [sp, #0x18]
	adds r4, r4, #1
	adds r6, r6, #2
	cmp r4, r0
	blt _0223E804
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_0223E85A:
	adds r0, r5, #0
	bl ov81_022414E0
_0223E860:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223E864: .4byte 0x00000464
_0223E868: .4byte 0x00000468
_0223E86C: .4byte 0x00000474
_0223E870: .4byte 0x0000047C
_0223E874: .4byte 0x0000045A
_0223E878: .4byte 0x0000045E
	thumb_func_end ov81_0223E5B4

	thumb_func_start ov81_0223E87C
ov81_0223E87C: @ 0x0223E87C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrb r0, [r6, #0x12]
	movs r4, #0
	cmp r0, #0
	ble _0223E8AE
	movs r7, #0x36
	adds r5, r6, #0
	lsls r7, r7, #4
_0223E88E:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov81_022412C4
	movs r1, #0x36
	lsls r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r7]
	movs r1, #1
	bl ov81_02242EB8
	ldrb r0, [r6, #0x12]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r0
	blt _0223E88E
_0223E8AE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov81_0223E87C

	thumb_func_start ov81_0223E8B0
ov81_0223E8B0: @ 0x0223E8B0
	ldr r3, _0223E8B8 @ =ov81_02241DDC
	movs r1, #0
	bx r3
	nop
_0223E8B8: .4byte ov81_02241DDC
	thumb_func_end ov81_0223E8B0

	thumb_func_start ov81_0223E8BC
ov81_0223E8BC: @ 0x0223E8BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r1, #0
	adds r5, r0, #0
	bl ov81_02240F38
	ldr r1, _0223EA88 @ =0x00000464
	adds r0, r5, #0
	ldr r1, [r5, r1]
	bl ov81_02243370
	ldr r1, _0223EA88 @ =0x00000464
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov81_0224185C
	ldr r1, _0223EA88 @ =0x00000464
	add r2, sp, #0x10
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	add r3, sp, #0xc
	bl ov81_02243228
	movs r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x10]
	movs r2, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r3, r1, #0
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov81_02242D18
	movs r1, #0xe2
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r2, #0
	lsrs r0, r1, #1
	str r2, [sp]
	str r2, [sp, #4]
	adds r0, r5, r0
	movs r1, #1
	adds r3, r2, #0
	str r2, [sp, #8]
	bl ov81_02242CBC
	movs r1, #0x39
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov81_02241D38
	ldr r0, _0223EA88 @ =0x00000464
	movs r1, #4
	ldr r0, [r5, r0]
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov81_02243228
	movs r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x10]
	movs r2, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r3, r1, #0
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov81_02242D18
	movs r1, #0xe3
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov81_02241F50
	adds r0, r5, #0
	movs r1, #0
	bl ov81_02242058
	adds r0, r5, #0
	bl ov81_022420B4
	movs r2, #0
	str r2, [sp]
	movs r0, #0x50
	str r0, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #4
	adds r3, r2, #0
	bl ov81_02242D18
	movs r1, #0xe5
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r2, #0
	str r2, [sp]
	movs r0, #0x50
	str r0, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #5
	adds r3, r2, #0
	bl ov81_02242D18
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r2, #0
	str r0, [r5, r2]
	adds r1, #0x28
	adds r2, #0xd0
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	adds r0, r5, #0
	movs r3, #4
	bl ov81_02242218
	movs r1, #0xf
	lsls r1, r1, #6
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov81_022423D0
	ldr r0, _0223EA8C @ =0x00000474
	movs r1, #0
	ldr r0, [r5, r0]
	movs r2, #7
	adds r3, r1, #0
	bl FUN_020196E8
	movs r2, #0
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x50
	adds r3, r2, #0
	str r2, [sp]
	bl ov81_022408C4
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0xc0
	bl ov81_02243028
	adds r0, r5, #0
	movs r1, #9
	bl ov81_0224086C
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x13]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0223EA70
	ldr r0, _0223EA90 @ =0x0000047C
	movs r6, #0
	ldr r1, [r5, r0]
	cmp r1, #0
	bls _0223EA38
	adds r4, r5, #0
	adds r7, r0, #0
_0223EA20:
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
	ldr r1, [r5, r7]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r1
	blo _0223EA20
_0223EA38:
	ldr r0, _0223EA94 @ =0x00000468
	add r2, sp, #0x10
	ldr r0, [r5, r0]
	add r3, sp, #0xc
	bl ov81_02241C84
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl ov81_02242D94
	adds r0, r5, #0
	movs r1, #0xff
	bl ov81_02240658
	adds r0, r5, #0
	bl ov81_0224174C
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov81_02242E08
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0223EA70:
	adds r0, r5, #0
	bl ov81_022417B4
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov81_02242E08
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0223EA88: .4byte 0x00000464
_0223EA8C: .4byte 0x00000474
_0223EA90: .4byte 0x0000047C
_0223EA94: .4byte 0x00000468
	thumb_func_end ov81_0223E8BC

	thumb_func_start ov81_0223EA98
ov81_0223EA98: @ 0x0223EA98
	push {r3, r4, lr}
	sub sp, #0x14
	ldr r1, _0223EBD8 @ =0x00000464
	adds r4, r0, #0
	ldr r1, [r4, r1]
	bl ov81_02243398
	ldr r1, _0223EBD8 @ =0x00000464
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov81_02241A98
	ldr r0, _0223EBD8 @ =0x00000464
	movs r1, #0
	ldr r0, [r4, r0]
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov81_02243228
	movs r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x10]
	movs r2, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r3, r1, #0
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov81_02242D18
	movs r1, #0xe2
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	adds r0, #0xe0
	adds r1, #0xf4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov81_02241C84
	movs r2, #0
	str r2, [sp]
	ldr r0, [sp, #0x10]
	movs r1, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r3, r2, #0
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov81_02242CBC
	movs r1, #0x39
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r1, #0xd4
	ldr r0, [r4, r1]
	movs r1, #6
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov81_02243228
	movs r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x10]
	movs r2, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r3, r1, #0
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov81_02242D18
	movs r1, #0xe3
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov81_02241F50
	adds r0, r4, #0
	movs r1, #1
	bl ov81_02242058
	adds r0, r4, #0
	bl ov81_022420B4
	movs r2, #0
	str r2, [sp]
	movs r0, #0x50
	str r0, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #4
	adds r3, r2, #0
	bl ov81_02242D18
	movs r1, #0xe5
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r2, #0
	str r2, [sp]
	movs r0, #0x50
	str r0, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #5
	adds r3, r2, #0
	bl ov81_02242D18
	movs r1, #0xe6
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r1, #0x2c
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl ov81_02242218
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02242420
	ldr r0, _0223EBDC @ =0x00000474
	movs r1, #0
	ldr r0, [r4, r0]
	movs r2, #7
	adds r3, r1, #0
	bl FUN_020196E8
	movs r2, #0
	adds r1, r4, #0
	adds r0, r4, #0
	adds r1, #0x50
	adds r3, r2, #0
	str r2, [sp]
	bl ov81_022408C4
	ldr r0, _0223EBE0 @ =0x00000468
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov81_022419E0
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_0223EBD8: .4byte 0x00000464
_0223EBDC: .4byte 0x00000474
_0223EBE0: .4byte 0x00000468
	thumb_func_end ov81_0223EA98

	thumb_func_start ov81_0223EBE4
ov81_0223EBE4: @ 0x0223EBE4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x12]
	movs r6, #0
	cmp r0, #0
	ble _0223EC40
	movs r7, #0x36
	adds r4, r5, #0
	lsls r7, r7, #4
_0223EBF6:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov81_022412C4
	movs r1, #0x36
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r7]
	movs r1, #1
	bl ov81_02242EB8
	ldrb r0, [r5, #0x13]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	bne _0223EC36
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov81_02242F48
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242FB0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242F94
_0223EC36:
	ldrb r0, [r5, #0x12]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blt _0223EBF6
_0223EC40:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov81_0223EBE4

	thumb_func_start ov81_0223EC44
ov81_0223EC44: @ 0x0223EC44
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #1
	adds r6, r0, #0
	bl ov81_02241DDC
	ldr r0, _0223EC84 @ =0x0000047C
	movs r4, #0
	ldr r0, [r6, r0]
	cmp r0, #0
	bls _0223EC80
	ldr r7, _0223EC84 @ =0x0000047C
	adds r5, r6, #0
_0223EC5C:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #1
	bl ov81_02241E68
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	movs r2, #1
	bl FUN_020087A4
	ldr r0, [r6, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r0
	blo _0223EC5C
_0223EC80:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223EC84: .4byte 0x0000047C
	thumb_func_end ov81_0223EC44

	thumb_func_start ov81_0223EC88
ov81_0223EC88: @ 0x0223EC88
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _0223ECDA
	ldr r0, [r4, #4]
	bl FUN_020072A8
	cmp r0, #1
	bne _0223ECDA
	movs r1, #7
	lsls r1, r1, #6
	ldr r0, [r4, r1]
	ldrb r2, [r0, #0x14]
	movs r0, #0xf6
	lsls r0, r0, #2
	str r2, [r4, r0]
	ldr r2, [r4, r1]
	adds r0, #0x90
	ldrb r2, [r2, #0x14]
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	bl FUN_0201AB0C
	ldr r0, [r4, #4]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #4]
	adds r0, r4, #0
	bl ov81_02240CD4
	ldrb r1, [r4, #0x13]
	movs r0, #0x40
	bics r1, r0
	strb r1, [r4, #0x13]
	ldr r0, _0223ECE0 @ =0x00000478
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
_0223ECDA:
	movs r0, #0
	pop {r4, pc}
	nop
_0223ECE0: .4byte 0x00000478
	thumb_func_end ov81_0223EC88

	thumb_func_start ov81_0223ECE4
ov81_0223ECE4: @ 0x0223ECE4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #8
	bhi _0223ED5A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223ECFC: @ jump table
	.2byte _0223ED0E - _0223ECFC - 2 @ case 0
	.2byte _0223ED1C - _0223ECFC - 2 @ case 1
	.2byte _0223EE5E - _0223ECFC - 2 @ case 2
	.2byte _0223EE64 - _0223ECFC - 2 @ case 3
	.2byte _0223EEB6 - _0223ECFC - 2 @ case 4
	.2byte _0223EEC2 - _0223ECFC - 2 @ case 5
	.2byte _0223EED0 - _0223ECFC - 2 @ case 6
	.2byte _0223EEF6 - _0223ECFC - 2 @ case 7
	.2byte _0223EF38 - _0223ECFC - 2 @ case 8
_0223ED0E:
	movs r0, #1
	strb r0, [r4, #8]
	ldrb r1, [r4, #0x13]
	movs r0, #2
	bics r1, r0
	strb r1, [r4, #0x13]
	b _0223EF42
_0223ED1C:
	ldr r0, _0223EF48 @ =0x00000464
	ldr r0, [r4, r0]
	bl FUN_02019BE4
	adds r5, r0, #0
	movs r0, #2
	mvns r0, r0
	cmp r5, r0
	bhi _0223ED52
	bhs _0223EDDA
	cmp r5, #8
	bhi _0223ED5A
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223ED40: @ jump table
	.2byte _0223ED5C - _0223ED40 - 2 @ case 0
	.2byte _0223ED5C - _0223ED40 - 2 @ case 1
	.2byte _0223ED5C - _0223ED40 - 2 @ case 2
	.2byte _0223ED5C - _0223ED40 - 2 @ case 3
	.2byte _0223ED5C - _0223ED40 - 2 @ case 4
	.2byte _0223ED5C - _0223ED40 - 2 @ case 5
	.2byte _0223ED92 - _0223ED40 - 2 @ case 6
	.2byte _0223EDAA - _0223ED40 - 2 @ case 7
	.2byte _0223EDC2 - _0223ED40 - 2 @ case 8
_0223ED52:
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	beq _0223EE12
_0223ED5A:
	b _0223EF42
_0223ED5C:
	ldr r0, _0223EF4C @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _0223EF50 @ =0x00000468
	str r5, [r4, r0]
	adds r0, r4, #0
	bl ov81_02241C0C
	movs r2, #0xf
	lsls r2, r2, #6
	ldr r1, [r4, r2]
	adds r2, #0xa8
	ldr r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #6
	bl ov81_02242218
	ldr r1, _0223EF50 @ =0x00000468
	adds r0, r4, #0
	ldr r1, [r4, r1]
	movs r2, #6
	bl ov81_02242300
	adds r0, r4, #0
	bl ov81_02241450
	b _0223EF42
_0223ED92:
	ldr r0, _0223EF4C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0xc
	movs r3, #6
	bl ov81_022425C4
	movs r0, #2
	strb r0, [r4, #8]
	b _0223EF42
_0223EDAA:
	ldr r0, _0223EF4C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #0xc
	movs r3, #7
	bl ov81_022425C4
	movs r0, #2
	strb r0, [r4, #8]
	b _0223EF42
_0223EDC2:
	ldr r0, _0223EF4C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0xf
	movs r3, #8
	bl ov81_022425C4
	movs r0, #2
	strb r0, [r4, #8]
	b _0223EF42
_0223EDDA:
	ldr r0, _0223EF4C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov81_02241C0C
	ldr r0, _0223EF48 @ =0x00000464
	ldr r0, [r4, r0]
	bl FUN_02019F74
	movs r1, #0xf
	lsls r1, r1, #6
	adds r2, r0, #0
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r3, #6
	bl ov81_02242218
	ldr r0, _0223EF48 @ =0x00000464
	ldr r0, [r4, r0]
	bl FUN_02019F74
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #6
	bl ov81_02242300
	b _0223EF42
_0223EE12:
	ldr r0, _0223EF48 @ =0x00000464
	ldr r0, [r4, r0]
	bl FUN_02019F74
	cmp r0, #6
	blo _0223EE30
	ldr r0, _0223EF4C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov81_022414E0
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0223EE30:
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	bne _0223EE38
	b _0223EF42
_0223EE38:
	ldr r0, _0223EF4C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov81_0223EF5C
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223EE58
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl ov81_02240FA4
_0223EE58:
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0223EE5E:
	bl ov81_022425EC
	b _0223EF42
_0223EE64:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223EF42
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02003B44
	cmp r0, #0
	beq _0223EE8C
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200374C
	ldr r0, _0223EF54 @ =0x00000478
	movs r1, #0xff
	str r1, [r4, r0]
	b _0223EF42
_0223EE8C:
	adds r0, r4, #0
	bl ov81_02240E78
	adds r0, r4, #0
	bl ov81_02240BB0
	movs r1, #7
	lsls r1, r1, #6
	ldr r0, _0223EF58 @ =0x02103A1C
	ldr r1, [r4, r1]
	movs r2, #0x64
	bl FUN_0200724C
	str r0, [r4, #4]
	ldrb r1, [r4, #0x13]
	movs r0, #2
	add sp, #0xc
	orrs r0, r1
	strb r0, [r4, #0x13]
	movs r0, #1
	pop {r4, r5, pc}
_0223EEB6:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0223EF42
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0223EEC2:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223EF42
	movs r0, #1
	strb r0, [r4, #8]
	b _0223EF42
_0223EED0:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r1, [r4, #0x13]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r4, #0x13]
	movs r0, #3
	strb r0, [r4, #8]
	b _0223EF42
_0223EEF6:
	bl ov81_022414E0
	ldr r0, _0223EF50 @ =0x00000468
	ldr r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F40
	cmp r0, #0
	bne _0223EF18
	adds r0, r4, #0
	bl ov81_0223F038
	b _0223EF1E
_0223EF18:
	adds r0, r4, #0
	bl ov81_0223F0BC
_0223EF1E:
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223EF32
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl ov81_02240FA4
_0223EF32:
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0223EF38:
	bl ov81_022414E0
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0223EF42:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0223EF48: .4byte 0x00000464
_0223EF4C: .4byte 0x000005DC
_0223EF50: .4byte 0x00000468
_0223EF54: .4byte 0x00000478
_0223EF58: .4byte 0x02103A1C
	thumb_func_end ov81_0223ECE4

	thumb_func_start ov81_0223EF5C
ov81_0223EF5C: @ 0x0223EF5C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x11]
	movs r2, #1
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #6
	bl FUN_020087A4
	ldrb r0, [r4, #0x11]
	adds r1, r4, #0
	adds r1, #0x50
	adds r0, r0, #2
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldrb r0, [r4, #0x11]
	adds r1, r4, #0
	adds r1, #0x50
	adds r0, r0, #2
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D5C8
	ldrb r0, [r4, #0x11]
	movs r1, #0
	subs r0, r0, #1
	strb r0, [r4, #0x11]
	ldrb r2, [r4, #0x11]
	adds r0, r4, #0
	adds r2, r2, #1
	bl ov81_022408A0
	adds r0, r4, #0
	movs r1, #0
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r1, [r1, r0]
	subs r0, #0x68
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r0, [r1, r0]
	bl ov81_02242F54
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r1, [r1, r0]
	subs r0, #0x68
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov81_02242FB0
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r1, [r1, r0]
	subs r0, #0x68
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r0, [r1, r0]
	movs r1, #0
	bl ov81_02242F94
	ldrb r0, [r4, #0x11]
	movs r2, #0
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r0, #0xf2
	lsls r0, r0, #2
	strh r2, [r1, r0]
	adds r0, r4, #0
	bl ov81_02241C0C
	adds r0, r4, #0
	bl ov81_02241FEC
	adds r0, r4, #0
	bl ov81_0224218C
	ldr r0, _0223F034 @ =0x00000464
	ldr r0, [r4, r0]
	bl FUN_02019F74
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #6
	bl ov81_02242300
	pop {r4, pc}
	nop
_0223F034: .4byte 0x00000464
	thumb_func_end ov81_0223EF5C

	thumb_func_start ov81_0223F038
ov81_0223F038: @ 0x0223F038
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0223F0B8 @ =0x00000468
	ldr r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F48
	ldr r0, _0223F0B8 @ =0x00000468
	ldr r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	bl ov81_02242FB0
	ldr r0, _0223F0B8 @ =0x00000468
	ldr r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov81_02242F94
	ldrb r1, [r4, #0x11]
	ldr r0, _0223F0B8 @ =0x00000468
	ldr r2, [r4, r0]
	lsls r1, r1, #1
	adds r1, r4, r1
	subs r0, #0xa0
	strh r2, [r1, r0]
	ldrb r0, [r4, #0x11]
	adds r0, r0, #1
	strb r0, [r4, #0x11]
	ldrb r0, [r4, #9]
	ldrb r5, [r4, #0x11]
	bl ov81_02240F18
	cmp r5, r0
	beq _0223F0AA
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #1
	bl ov81_022408A0
	adds r0, r4, #0
	movs r1, #0
	bl ov81_0224086C
	strb r0, [r4, #0x10]
_0223F0AA:
	adds r0, r4, #0
	bl ov81_02241FEC
	adds r0, r4, #0
	bl ov81_0224218C
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223F0B8: .4byte 0x00000468
	thumb_func_end ov81_0223F038

	thumb_func_start ov81_0223F0BC
ov81_0223F0BC: @ 0x0223F0BC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0223F1A0 @ =0x00000468
	ldr r0, [r5, r0]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F54
	ldr r0, _0223F1A0 @ =0x00000468
	ldr r0, [r5, r0]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov81_02242FB0
	ldr r0, _0223F1A0 @ =0x00000468
	ldr r0, [r5, r0]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	bl ov81_02242F94
	ldrb r0, [r5, #0x11]
	cmp r0, #2
	blo _0223F130
	movs r2, #0xf2
	lsls r2, r2, #2
	adds r0, r2, #0
	adds r0, #0xa0
	ldrh r1, [r5, r2]
	ldr r0, [r5, r0]
	cmp r1, r0
	bne _0223F130
	adds r0, r2, #2
	ldrh r0, [r5, r0]
	movs r1, #0
	adds r3, r1, #0
	strh r0, [r5, r2]
	ldrh r2, [r5, r2]
	adds r0, r5, #0
	bl ov81_02241E68
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
_0223F130:
	ldrb r0, [r5, #0x11]
	movs r2, #0
	subs r0, r0, #1
	strb r0, [r5, #0x11]
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0xf2
	lsls r0, r0, #2
	strh r2, [r1, r0]
	ldrb r0, [r5, #9]
	bl ov81_02240F18
	adds r7, r0, #0
	movs r4, #0
	cmp r7, #0
	ble _0223F168
	adds r6, r5, #0
	adds r6, #0x50
_0223F156:
	adds r0, r4, #2
	lsls r0, r0, #4
	adds r0, r6, r0
	movs r1, #0
	bl FUN_0201D978
	adds r4, r4, #1
	cmp r4, r7
	blt _0223F156
_0223F168:
	ldrb r2, [r5, #0x11]
	adds r0, r5, #0
	movs r1, #0
	adds r2, r2, #1
	bl ov81_022408A0
	adds r0, r5, #0
	movs r1, #0
	bl ov81_0224086C
	strb r0, [r5, #0x10]
	adds r0, r5, #0
	bl ov81_02241C0C
	adds r0, r5, #0
	bl ov81_02241FEC
	adds r0, r5, #0
	bl ov81_0224218C
	ldr r1, _0223F1A0 @ =0x00000468
	adds r0, r5, #0
	ldr r1, [r5, r1]
	movs r2, #6
	bl ov81_02242300
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223F1A0: .4byte 0x00000468
	thumb_func_end ov81_0223F0BC

	thumb_func_start ov81_0223F1A4
ov81_0223F1A4: @ 0x0223F1A4
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_02236DD4
	adds r2, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #7
	bhi _0223F254
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223F1C2: @ jump table
	.2byte _0223F1D2 - _0223F1C2 - 2 @ case 0
	.2byte _0223F1F6 - _0223F1C2 - 2 @ case 1
	.2byte _0223F202 - _0223F1C2 - 2 @ case 2
	.2byte _0223F208 - _0223F1C2 - 2 @ case 3
	.2byte _0223F214 - _0223F1C2 - 2 @ case 4
	.2byte _0223F244 - _0223F1C2 - 2 @ case 5
	.2byte _0223F2C2 - _0223F1C2 - 2 @ case 6
	.2byte _0223F2FA - _0223F1C2 - 2 @ case 7
_0223F1D2:
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F1F6:
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F202:
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F208:
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F214:
	adds r0, r4, #0
	movs r1, #0
	bl ov81_022408A0
	adds r0, r4, #0
	movs r1, #1
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	ldr r0, _0223F310 @ =0x0000046C
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, r0]
	bl ov81_02241BD0
	adds r0, r4, #0
	movs r1, #1
	bl ov81_02242694
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F244:
	ldr r0, _0223F310 @ =0x0000046C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _0223F256
	cmp r0, #2
	beq _0223F26E
_0223F254:
	b _0223F30C
_0223F256:
	ldr r0, _0223F310 @ =0x0000046C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02242694
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F26E:
	ldr r0, _0223F310 @ =0x0000046C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02242694
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_02242D88
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_02242D88
	ldrb r0, [r4, #0x11]
	movs r2, #0
	subs r0, r0, #1
	strb r0, [r4, #0x11]
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r0, #0xf2
	lsls r0, r0, #2
	strh r2, [r1, r0]
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223F2BE
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl ov81_02240FA4
_0223F2BE:
	movs r0, #1
	pop {r4, pc}
_0223F2C2:
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #0
	bne _0223F2D0
	movs r0, #1
	pop {r4, pc}
_0223F2D0:
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl ov81_02240FA4
	cmp r0, #1
	bne _0223F30C
	adds r0, r4, #0
	movs r1, #2
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	bl FUN_02037BEC
	movs r0, #0xa4
	bl FUN_02037AC0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223F30C
_0223F2FA:
	movs r0, #0xa4
	bl FUN_02037B38
	cmp r0, #1
	bne _0223F30C
	bl FUN_02037BEC
	movs r0, #1
	pop {r4, pc}
_0223F30C:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0223F310: .4byte 0x0000046C
	thumb_func_end ov81_0223F1A4

	thumb_func_start ov81_0223F314
ov81_0223F314: @ 0x0223F314
	push {r3, lr}
	bl ov81_0223F320
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov81_0223F314

	thumb_func_start ov81_0223F320
ov81_0223F320: @ 0x0223F320
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_02236DD4
	ldr r0, _0223F388 @ =0x00000468
	ldr r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F54
	ldr r0, _0223F388 @ =0x00000468
	ldr r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov81_02242FB0
	ldr r0, _0223F388 @ =0x00000468
	ldr r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	bl ov81_02242F94
	ldrb r2, [r4, #0x11]
	adds r0, r4, #0
	movs r1, #0
	adds r2, r2, #1
	bl ov81_022408A0
	adds r0, r4, #0
	movs r1, #0
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	adds r0, r4, #0
	bl ov81_02241FEC
	adds r0, r4, #0
	bl ov81_0224218C
	pop {r4, pc}
	.align 2, 0
_0223F388: .4byte 0x00000468
	thumb_func_end ov81_0223F320

	thumb_func_start ov81_0223F38C
ov81_0223F38C: @ 0x0223F38C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #9
	bhi _0223F408
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223F3A4: @ jump table
	.2byte _0223F3B8 - _0223F3A4 - 2 @ case 0
	.2byte _0223F3CC - _0223F3A4 - 2 @ case 1
	.2byte _0223F592 - _0223F3A4 - 2 @ case 2
	.2byte _0223F598 - _0223F3A4 - 2 @ case 3
	.2byte _0223F5EA - _0223F3A4 - 2 @ case 4
	.2byte _0223F5F6 - _0223F3A4 - 2 @ case 5
	.2byte _0223F604 - _0223F3A4 - 2 @ case 6
	.2byte _0223F616 - _0223F3A4 - 2 @ case 7
	.2byte _0223F63C - _0223F3A4 - 2 @ case 8
	.2byte _0223F652 - _0223F3A4 - 2 @ case 9
_0223F3B8:
	movs r1, #0
	bl ov81_02240F38
	movs r0, #1
	strb r0, [r4, #8]
	ldrb r1, [r4, #0x13]
	movs r0, #2
	bics r1, r0
	strb r1, [r4, #0x13]
	b _0223F666
_0223F3CC:
	ldr r0, _0223F66C @ =0x00000464
	ldr r0, [r4, r0]
	bl FUN_02019BE4
	adds r5, r0, #0
	movs r0, #2
	mvns r0, r0
	cmp r5, r0
	bhi _0223F3FE
	bhs _0223F4DC
	cmp r5, #6
	bhi _0223F408
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223F3F0: @ jump table
	.2byte _0223F40A - _0223F3F0 - 2 @ case 0
	.2byte _0223F40A - _0223F3F0 - 2 @ case 1
	.2byte _0223F40A - _0223F3F0 - 2 @ case 2
	.2byte _0223F494 - _0223F3F0 - 2 @ case 3
	.2byte _0223F44C - _0223F3F0 - 2 @ case 4
	.2byte _0223F464 - _0223F3F0 - 2 @ case 5
	.2byte _0223F47C - _0223F3F0 - 2 @ case 6
_0223F3FE:
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	bne _0223F408
	b _0223F548
_0223F408:
	b _0223F666
_0223F40A:
	ldr r0, _0223F670 @ =0x000005DC
	bl FUN_0200604C
	ldr r2, _0223F674 @ =0x00000468
	adds r0, r4, #0
	adds r1, r2, #0
	str r5, [r4, r2]
	subs r1, #0xa8
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	movs r3, #4
	bl ov81_02242218
	adds r0, r4, #0
	bl ov81_02241D38
	ldr r0, _0223F678 @ =0x00000474
	movs r1, #0
	ldr r0, [r4, r0]
	movs r2, #7
	adds r3, r1, #0
	bl FUN_020196E8
	adds r0, r4, #0
	bl ov81_0224174C
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_02242E08
	b _0223F666
_0223F44C:
	ldr r0, _0223F670 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0xc
	movs r3, #7
	bl ov81_022425C4
	movs r0, #2
	strb r0, [r4, #8]
	b _0223F666
_0223F464:
	ldr r0, _0223F670 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #0xc
	movs r3, #8
	bl ov81_022425C4
	movs r0, #2
	strb r0, [r4, #8]
	b _0223F666
_0223F47C:
	ldr r0, _0223F670 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0xf
	movs r3, #9
	bl ov81_022425C4
	movs r0, #2
	strb r0, [r4, #8]
	b _0223F666
_0223F494:
	ldr r0, _0223F670 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0xe6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	adds r0, r4, #0
	adds r0, #0xd0
	bl FUN_0201D8E4
	ldr r0, _0223F678 @ =0x00000474
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0201980C
	adds r0, r4, #0
	bl ov81_02241D38
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #0xf
	movs r3, #6
	bl ov81_022425D8
	movs r0, #2
	strb r0, [r4, #8]
	b _0223F666
_0223F4DC:
	ldr r0, _0223F670 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _0223F66C @ =0x00000464
	ldr r0, [r4, r0]
	bl FUN_02019F74
	adds r2, r0, #0
	cmp r2, #3
	bne _0223F51C
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0xe6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	adds r0, r4, #0
	adds r0, #0xd0
	bl FUN_0201D8E4
	ldr r0, _0223F678 @ =0x00000474
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0201980C
	b _0223F540
_0223F51C:
	movs r1, #0xf
	lsls r1, r1, #6
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r3, #3
	bl ov81_02242218
	adds r0, r4, #0
	adds r0, #0xd0
	bl FUN_0201D5C8
	ldr r0, _0223F678 @ =0x00000474
	movs r1, #0
	ldr r0, [r4, r0]
	movs r2, #7
	adds r3, r1, #0
	bl FUN_020196E8
_0223F540:
	adds r0, r4, #0
	bl ov81_02241D38
	b _0223F666
_0223F548:
	ldr r0, _0223F66C @ =0x00000464
	ldr r0, [r4, r0]
	bl FUN_02019F74
	cmp r0, #4
	ldr r0, _0223F670 @ =0x000005DC
	blo _0223F56E
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov81_022417B4
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242E08
	b _0223F666
_0223F56E:
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov81_02241840
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_02242E08
	adds r0, r4, #0
	movs r1, #1
	bl ov81_02240F38
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0223F592:
	bl ov81_022425EC
	b _0223F666
_0223F598:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223F666
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02003B44
	cmp r0, #0
	beq _0223F5C0
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200374C
	ldr r0, _0223F67C @ =0x00000478
	movs r1, #0xff
	str r1, [r4, r0]
	b _0223F666
_0223F5C0:
	adds r0, r4, #0
	bl ov81_02240E78
	adds r0, r4, #0
	bl ov81_02240BB0
	movs r1, #7
	lsls r1, r1, #6
	ldr r0, _0223F680 @ =0x02103A1C
	ldr r1, [r4, r1]
	movs r2, #0x64
	bl FUN_0200724C
	str r0, [r4, #4]
	ldrb r1, [r4, #0x13]
	movs r0, #2
	add sp, #0xc
	orrs r0, r1
	strb r0, [r4, #0x13]
	movs r0, #1
	pop {r4, r5, pc}
_0223F5EA:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0223F666
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0223F5F6:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223F666
	movs r0, #1
	strb r0, [r4, #8]
	b _0223F666
_0223F604:
	bl ov81_02241840
	adds r0, r4, #0
	movs r1, #1
	bl ov81_02240F38
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0223F616:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r1, [r4, #0x13]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r4, #0x13]
	movs r0, #3
	strb r0, [r4, #8]
	b _0223F666
_0223F63C:
	bl ov81_0223F684
	adds r0, r4, #0
	bl ov81_022417B4
	adds r0, r4, #0
	bl ov81_02241840
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0223F652:
	bl ov81_022417B4
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242E08
	movs r0, #1
	strb r0, [r4, #8]
_0223F666:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0223F66C: .4byte 0x00000464
_0223F670: .4byte 0x000005DC
_0223F674: .4byte 0x00000468
_0223F678: .4byte 0x00000474
_0223F67C: .4byte 0x00000478
_0223F680: .4byte 0x02103A1C
	thumb_func_end ov81_0223F38C

	thumb_func_start ov81_0223F684
ov81_0223F684: @ 0x0223F684
	ldrb r2, [r0, #0x11]
	ldr r1, _0223F6A4 @ =0x00000468
	ldr r3, [r0, r1]
	lsls r2, r2, #1
	adds r2, r0, r2
	subs r1, #0xa0
	strh r3, [r2, r1]
	ldrb r1, [r0, #0x11]
	adds r1, r1, #1
	strb r1, [r0, #0x11]
	ldrb r2, [r0, #0x13]
	movs r1, #4
	orrs r1, r2
	strb r1, [r0, #0x13]
	bx lr
	nop
_0223F6A4: .4byte 0x00000468
	thumb_func_end ov81_0223F684

	thumb_func_start ov81_0223F6A8
ov81_0223F6A8: @ 0x0223F6A8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _0223F6BC
	cmp r1, #1
	beq _0223F6DE
	cmp r1, #2
	beq _0223F746
	b _0223F74A
_0223F6BC:
	movs r1, #0xa
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	ldr r0, _0223F750 @ =0x0000046C
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, r0]
	bl ov81_02241BD0
	adds r0, r4, #0
	movs r1, #1
	bl ov81_02242694
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223F74A
_0223F6DE:
	ldr r0, _0223F750 @ =0x0000046C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _0223F6F0
	cmp r0, #2
	beq _0223F71C
	b _0223F74A
_0223F6F0:
	ldr r0, _0223F750 @ =0x0000046C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02242694
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223F714
	adds r0, r4, #0
	movs r1, #2
	bl ov81_0224086C
	strb r0, [r4, #0x10]
_0223F714:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223F74A
_0223F71C:
	ldr r0, _0223F750 @ =0x0000046C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02242694
	adds r0, r4, #0
	bl ov81_0223F754
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242E08
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223F74A
_0223F746:
	movs r0, #1
	pop {r4, pc}
_0223F74A:
	movs r0, #0
	pop {r4, pc}
	nop
_0223F750: .4byte 0x0000046C
	thumb_func_end ov81_0223F6A8

	thumb_func_start ov81_0223F754
ov81_0223F754: @ 0x0223F754
	push {r4, lr}
	adds r4, r0, #0
	bl ov81_02241804
	adds r0, r4, #0
	movs r1, #1
	bl ov81_02240F38
	adds r0, r4, #0
	movs r1, #9
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	pop {r4, pc}
	thumb_func_end ov81_0223F754

	thumb_func_start ov81_0223F770
ov81_0223F770: @ 0x0223F770
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #8
	bhi _0223F7FC
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223F786: @ jump table
	.2byte _0223F798 - _0223F786 - 2 @ case 0
	.2byte _0223F7BC - _0223F786 - 2 @ case 1
	.2byte _0223FA4A - _0223F786 - 2 @ case 2
	.2byte _0223FABC - _0223F786 - 2 @ case 3
	.2byte _0223FAC0 - _0223F786 - 2 @ case 4
	.2byte _0223FAC6 - _0223F786 - 2 @ case 5
	.2byte _0223FAD4 - _0223F786 - 2 @ case 6
	.2byte _0223FAE4 - _0223F786 - 2 @ case 7
	.2byte _0223FB24 - _0223F786 - 2 @ case 8
_0223F798:
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov81_02243028
	adds r0, r4, #0
	movs r1, #0xd
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	movs r0, #1
	strb r0, [r4, #8]
	b _0223FB38
_0223F7BC:
	ldr r0, _0223FB10 @ =0x00000464
	ldr r0, [r4, r0]
	bl FUN_02019BE4
	adds r5, r0, #0
	movs r0, #2
	mvns r0, r0
	cmp r5, r0
	bhi _0223F7F2
	blo _0223F7D2
	b _0223F956
_0223F7D2:
	cmp r5, #7
	bhi _0223F7FC
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223F7E2: @ jump table
	.2byte _0223F7FE - _0223F7E2 - 2 @ case 0
	.2byte _0223F7FE - _0223F7E2 - 2 @ case 1
	.2byte _0223F7FE - _0223F7E2 - 2 @ case 2
	.2byte _0223F7FE - _0223F7E2 - 2 @ case 3
	.2byte _0223F84A - _0223F7E2 - 2 @ case 4
	.2byte _0223F8B8 - _0223F7E2 - 2 @ case 5
	.2byte _0223F926 - _0223F7E2 - 2 @ case 6
	.2byte _0223F93E - _0223F7E2 - 2 @ case 7
_0223F7F2:
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	bne _0223F7FC
	b _0223FA02
_0223F7FC:
	b _0223FB38
_0223F7FE:
	ldr r0, _0223FB14 @ =0x000005DC
	bl FUN_0200604C
	ldr r2, _0223FB18 @ =0x00000468
	adds r0, r4, #0
	adds r1, r2, #0
	str r5, [r4, r2]
	subs r1, #0xa4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	movs r3, #4
	bl ov81_02242218
	ldr r0, _0223FB1C @ =0x00000474
	movs r1, #0
	ldr r0, [r4, r0]
	movs r2, #7
	adds r3, r1, #0
	bl FUN_020196E8
	adds r0, r4, #0
	bl ov81_02241D94
	ldr r1, _0223FB18 @ =0x00000468
	adds r0, r4, #0
	ldr r1, [r4, r1]
	bl ov81_022424AC
	adds r0, r4, #0
	bl ov81_02241980
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_02242E08
	b _0223FB38
_0223F84A:
	ldr r0, _0223FB14 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0xe6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	movs r2, #1
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #6
	bl FUN_020087A4
	adds r0, r4, #0
	adds r0, #0xd0
	bl FUN_0201D8E4
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	adds r1, r4, #0
	adds r1, #0x50
	adds r0, r0, #2
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D8E4
	ldr r0, _0223FB1C @ =0x00000474
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0201980C
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0xf
	movs r3, #5
	bl ov81_022425D8
	movs r0, #4
	strb r0, [r4, #8]
	b _0223FB38
_0223F8B8:
	ldr r0, _0223FB14 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0xe6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	movs r2, #1
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #6
	bl FUN_020087A4
	adds r0, r4, #0
	adds r0, #0xd0
	bl FUN_0201D8E4
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	adds r1, r4, #0
	adds r1, #0x50
	adds r0, r0, #2
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D8E4
	ldr r0, _0223FB1C @ =0x00000474
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0201980C
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #0xf
	movs r3, #6
	bl ov81_022425D8
	movs r0, #4
	strb r0, [r4, #8]
	b _0223FB38
_0223F926:
	ldr r0, _0223FB14 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0xf
	movs r3, #7
	bl ov81_022425C4
	movs r0, #4
	strb r0, [r4, #8]
	b _0223FB38
_0223F93E:
	ldr r0, _0223FB14 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #0xf
	movs r3, #8
	bl ov81_022425C4
	movs r0, #4
	strb r0, [r4, #8]
	b _0223FB38
_0223F956:
	ldr r0, _0223FB14 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _0223FB10 @ =0x00000464
	ldr r0, [r4, r0]
	bl FUN_02019F74
	adds r5, r0, #0
	subs r0, r5, #4
	cmp r0, #1
	bhi _0223F9C4
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0xe6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	movs r2, #1
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #6
	bl FUN_020087A4
	adds r0, r4, #0
	adds r0, #0xd0
	bl FUN_0201D8E4
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	adds r1, r4, #0
	adds r1, #0x50
	adds r0, r0, #2
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D8E4
	ldr r0, _0223FB1C @ =0x00000474
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0201980C
	b _0223FB38
_0223F9C4:
	cmp r5, #6
	beq _0223FA5A
	cmp r5, #7
	beq _0223FA5A
	movs r1, #0xf1
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #4
	bl ov81_02242218
	adds r0, r4, #0
	adds r0, #0xd0
	bl FUN_0201D5C8
	ldr r0, _0223FB1C @ =0x00000474
	movs r1, #0
	ldr r0, [r4, r0]
	movs r2, #7
	adds r3, r1, #0
	bl FUN_020196E8
	adds r0, r4, #0
	bl ov81_02241D94
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov81_022424AC
	b _0223FB38
_0223FA02:
	ldr r0, _0223FB10 @ =0x00000464
	ldr r0, [r4, r0]
	bl FUN_02019F74
	cmp r0, #6
	ldr r0, _0223FB14 @ =0x000005DC
	blo _0223FA28
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov81_022419E0
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242E08
	b _0223FB38
_0223FA28:
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov81_02241A7C
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_02242E08
	adds r0, r4, #0
	movs r1, #1
	bl ov81_02240F38
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223FA4A:
	ldr r0, _0223FB20 @ =0x0000046C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _0223FA5C
	cmp r0, #2
	beq _0223FA8E
_0223FA5A:
	b _0223FB38
_0223FA5C:
	ldr r0, _0223FB20 @ =0x0000046C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02242694
	adds r0, r4, #0
	bl ov81_0223FB64
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223FA86
	adds r0, r4, #0
	movs r1, #2
	bl ov81_0224086C
	strb r0, [r4, #0x10]
_0223FA86:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223FB38
_0223FA8E:
	ldr r0, _0223FB20 @ =0x0000046C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02242694
	adds r0, r4, #0
	bl ov81_0223FB88
	adds r0, r4, #0
	bl ov81_02241A38
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242E08
	movs r0, #1
	strb r0, [r4, #8]
	b _0223FB38
_0223FABC:
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223FAC0:
	bl ov81_022425EC
	b _0223FB38
_0223FAC6:
	bl ov81_02241A7C
	adds r0, r4, #0
	bl ov81_0223FB3C
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223FAD4:
	bl ov81_02241A7C
	adds r0, r4, #0
	movs r1, #1
	bl ov81_02240F38
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223FAE4:
	bl ov81_022419E0
	adds r0, r4, #0
	bl ov81_02241A7C
	ldr r0, _0223FB20 @ =0x0000046C
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, r0]
	bl ov81_02241BD0
	adds r0, r4, #0
	movs r1, #1
	bl ov81_02242694
	adds r0, r4, #0
	movs r1, #0xe
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	movs r0, #2
	strb r0, [r4, #8]
	b _0223FB38
	.align 2, 0
_0223FB10: .4byte 0x00000464
_0223FB14: .4byte 0x000005DC
_0223FB18: .4byte 0x00000468
_0223FB1C: .4byte 0x00000474
_0223FB20: .4byte 0x0000046C
_0223FB24:
	bl ov81_022419E0
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242E08
	movs r0, #1
	strb r0, [r4, #8]
_0223FB38:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_0223F770

	thumb_func_start ov81_0223FB3C
ov81_0223FB3C: @ 0x0223FB3C
	ldrb r2, [r0, #0x13]
	movs r1, #4
	movs r3, #0xf2
	bics r2, r1
	strb r2, [r0, #0x13]
	ldrb r1, [r0, #0x11]
	lsls r3, r3, #2
	adds r2, r3, #0
	subs r1, r1, #1
	strb r1, [r0, #0x11]
	movs r1, #0
	strh r1, [r0, r3]
	adds r2, #0xa0
	adds r3, #0x9c
	str r1, [r0, r2]
	ldr r0, [r0, r3]
	ldr r3, _0223FB60 @ =FUN_02019F7C
	bx r3
	.align 2, 0
_0223FB60: .4byte FUN_02019F7C
	thumb_func_end ov81_0223FB3C

	thumb_func_start ov81_0223FB64
ov81_0223FB64: @ 0x0223FB64
	ldrb r2, [r0, #0x13]
	movs r1, #8
	orrs r1, r2
	strb r1, [r0, #0x13]
	ldrb r2, [r0, #0x11]
	ldr r1, _0223FB84 @ =0x00000468
	ldr r3, [r0, r1]
	lsls r2, r2, #1
	adds r2, r0, r2
	subs r1, #0xa0
	strh r3, [r2, r1]
	ldrb r1, [r0, #0x11]
	adds r1, r1, #1
	strb r1, [r0, #0x11]
	bx lr
	nop
_0223FB84: .4byte 0x00000468
	thumb_func_end ov81_0223FB64

	thumb_func_start ov81_0223FB88
ov81_0223FB88: @ 0x0223FB88
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov81_02243028
	adds r0, r4, #0
	movs r1, #0xd
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	pop {r4, pc}
	thumb_func_end ov81_0223FB88

	thumb_func_start ov81_0223FBAC
ov81_0223FBAC: @ 0x0223FBAC
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _0223FBC0
	cmp r1, #1
	beq _0223FBE2
	cmp r1, #2
	beq _0223FC52
	b _0223FC56
_0223FBC0:
	movs r1, #0xa
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	ldr r0, _0223FC5C @ =0x0000046C
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, r0]
	bl ov81_02241BD0
	adds r0, r4, #0
	movs r1, #1
	bl ov81_02242694
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223FC56
_0223FBE2:
	ldr r0, _0223FC5C @ =0x0000046C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _0223FBF4
	cmp r0, #2
	beq _0223FC28
	b _0223FC56
_0223FBF4:
	ldr r0, _0223FC5C @ =0x0000046C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02242694
	ldrb r1, [r4, #0x13]
	movs r0, #8
	bics r1, r0
	strb r1, [r4, #0x13]
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223FC20
	adds r0, r4, #0
	movs r1, #2
	bl ov81_0224086C
	strb r0, [r4, #0x10]
_0223FC20:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223FC56
_0223FC28:
	ldr r0, _0223FC5C @ =0x0000046C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	bl ov81_02242694
	adds r0, r4, #0
	bl ov81_0223FC60
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242E08
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223FC56
_0223FC52:
	movs r0, #1
	pop {r4, pc}
_0223FC56:
	movs r0, #0
	pop {r4, pc}
	nop
_0223FC5C: .4byte 0x0000046C
	thumb_func_end ov81_0223FBAC

	thumb_func_start ov81_0223FC60
ov81_0223FC60: @ 0x0223FC60
	push {r4, lr}
	adds r4, r0, #0
	bl ov81_02241A38
	adds r0, r4, #0
	movs r1, #1
	bl ov81_02240F38
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov81_0223FC60

	thumb_func_start ov81_0223FC74
ov81_0223FC74: @ 0x0223FC74
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_02236DD4
	ldrb r0, [r4, #8]
	cmp r0, #6
	bhi _0223FD48
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223FC90: @ jump table
	.2byte _0223FC9E - _0223FC90 - 2 @ case 0
	.2byte _0223FD3C - _0223FC90 - 2 @ case 1
	.2byte _0223FDC2 - _0223FC90 - 2 @ case 2
	.2byte _0223FE14 - _0223FC90 - 2 @ case 3
	.2byte _0223FEAA - _0223FC90 - 2 @ case 4
	.2byte _0223FF0C - _0223FC90 - 2 @ case 5
	.2byte _0223FF26 - _0223FC90 - 2 @ case 6
_0223FC9E:
	ldrb r1, [r4, #0x13]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r4, #0x13]
	adds r0, r4, #0
	adds r0, #0x60
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #0xa0
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #0xb0
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #0x50
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x50
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x70
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #0x80
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #0x90
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #0xd0
	bl FUN_0201D8C8
	ldr r0, _0223FFF0 @ =0x00000474
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0201980C
	adds r0, r4, #0
	adds r0, #0xc0
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r4, #0
	adds r0, #0xc0
	bl FUN_0201D8E4
	adds r0, r4, #0
	adds r0, #0x50
	bl ov81_0224300C
	ldr r0, _0223FFF4 @ =0x0000FFFF
	movs r1, #0
	str r0, [sp]
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0x10
	adds r3, r1, #0
	bl FUN_020090E4
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223FFEC
_0223FD3C:
	ldrb r0, [r4, #0x19]
	adds r0, r0, #1
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #0x19]
	cmp r0, #2
	bhs _0223FD4A
_0223FD48:
	b _0223FFEC
_0223FD4A:
	ldr r0, _0223FFF8 @ =0x0000047C
	movs r6, #0
	ldr r0, [r4, r0]
	cmp r0, #0
	bls _0223FD6C
	ldr r7, _0223FFF8 @ =0x0000047C
	adds r5, r4, #0
_0223FD58:
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02008780
	ldr r0, [r4, r7]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blo _0223FD58
_0223FD6C:
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_02242D74
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_02242D74
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov81_02242D74
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_02242D74
	movs r0, #0xe6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_02242D74
	adds r0, r4, #0
	bl ov81_02241FC0
	adds r0, r4, #0
	bl ov81_02242170
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #2
	bl ov81_02242DE4
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223FFEC
_0223FDC2:
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02009138
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov81_02242DD8
	cmp r0, #1
	beq _0223FEB4
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	adds r0, r4, #0
	movs r1, #6
	bl ov81_02240728
	adds r0, r4, #0
	movs r1, #2
	bl ov81_022406E0
	ldr r0, [r4, #0x4c]
	ldr r3, [r4, #0xc]
	movs r1, #6
	movs r2, #0
	bl FUN_0201BC8C
	ldr r0, _0223FFFC @ =0x00000611
	bl FUN_0200604C
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223FFEC
_0223FE14:
	adds r0, r4, #0
	bl ov81_02240564
	cmp r0, #1
	bne _0223FEB4
	ldr r0, _0223FFFC @ =0x00000611
	movs r1, #0
	bl FUN_02006154
	ldr r0, _02240000 @ =0x00000678
	bl FUN_0200604C
	movs r0, #8
	str r0, [r4, #0x14]
	ldrb r0, [r4, #0x12]
	movs r6, #0
	cmp r0, #0
	ble _0223FE5A
	adds r5, r4, #0
	adds r7, r6, #0
_0223FE3C:
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl ov81_02242EA4
	movs r1, #0x36
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	str r7, [r5, r0]
	ldrb r0, [r4, #0x12]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _0223FE3C
_0223FE5A:
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223FE74
	ldrb r0, [r4, #0x12]
	cmp r0, #2
	bne _0223FE70
	movs r0, #4
	strb r0, [r4, #0x12]
	b _0223FE74
_0223FE70:
	movs r0, #2
	strb r0, [r4, #0x12]
_0223FE74:
	adds r0, r4, #0
	bl ov81_0223EBE4
	ldrb r0, [r4, #0x12]
	movs r6, #0
	cmp r0, #0
	ble _0223FE98
	movs r7, #0x36
	adds r5, r4, #0
	lsls r7, r7, #4
_0223FE88:
	ldr r0, [r5, r7]
	bl ov81_02242F60
	ldrb r0, [r4, #0x12]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _0223FE88
_0223FE98:
	ldr r0, _0223FFFC @ =0x00000611
	bl FUN_0200604C
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223FFEC
_0223FEAA:
	adds r0, r4, #0
	bl ov81_022404B4
	cmp r0, #1
	beq _0223FEB6
_0223FEB4:
	b _0223FFEC
_0223FEB6:
	ldr r0, _0223FFFC @ =0x00000611
	movs r1, #0
	bl FUN_02006154
	ldr r0, _02240000 @ =0x00000678
	bl FUN_0200604C
	ldrb r0, [r4, #0x12]
	movs r6, #0
	cmp r0, #0
	ble _0223FEE4
	movs r7, #0x36
	adds r5, r4, #0
	lsls r7, r7, #4
_0223FED2:
	ldr r0, [r5, r7]
	movs r1, #4
	bl ov81_02242F94
	ldrb r0, [r4, #0x12]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _0223FED2
_0223FEE4:
	movs r0, #8
	str r0, [r4, #0x14]
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_02242D88
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_02242DE4
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223FFEC
_0223FF0C:
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov81_02242DD8
	cmp r0, #1
	beq _0223FFEC
	movs r0, #0
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223FFEC
_0223FF26:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	bne _0223FFAA
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	ldrb r0, [r4, #0x13]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	ldr r0, _0223FFF8 @ =0x0000047C
	bne _0223FF60
	ldr r0, [r4, r0]
	movs r5, #0
	cmp r0, #0
	bls _0223FF96
	ldr r6, _0223FFF8 @ =0x0000047C
	movs r7, #1
_0223FF4A:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r5, #0
	adds r3, r7, #0
	bl ov81_02241E68
	ldr r0, [r4, r6]
	adds r5, r5, #1
	cmp r5, r0
	blo _0223FF4A
	b _0223FF96
_0223FF60:
	ldr r0, [r4, r0]
	movs r5, #0
	cmp r0, #0
	bls _0223FF96
	ldr r7, _0223FFF8 @ =0x0000047C
	adds r6, r7, #0
	subs r6, #0xb4
_0223FF6E:
	ldrh r0, [r4, r6]
	cmp r5, r0
	bne _0223FF82
	movs r2, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r2, #0
	bl ov81_02241EDC
	b _0223FF8E
_0223FF82:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r5, #0
	movs r3, #1
	bl ov81_02241E68
_0223FF8E:
	ldr r0, [r4, r7]
	adds r5, r5, #1
	cmp r5, r0
	blo _0223FF6E
_0223FF96:
	ldr r0, _0223FFF4 @ =0x0000FFFF
	movs r1, #0x10
	str r0, [sp]
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0
	movs r3, #1
	bl FUN_020090E4
_0223FFAA:
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02009138
	ldrb r0, [r4, #0x19]
	adds r0, r0, #1
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #0x19]
	cmp r0, #0x15
	blo _0223FFEC
	adds r0, r4, #0
	bl ov81_02241398
	ldrb r1, [r4, #0x13]
	movs r0, #0x20
	bics r1, r0
	strb r1, [r4, #0x13]
	ldrb r0, [r4, #9]
	bl FUN_02237254
	cmp r0, #1
	bne _0223FFE4
	ldr r0, _02240004 @ =0x00000463
	movs r1, #1
	strb r1, [r4, r0]
	adds r0, r4, #0
	bl ov81_02241144
_0223FFE4:
	movs r0, #0
	strb r0, [r4, #0x19]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223FFEC:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223FFF0: .4byte 0x00000474
_0223FFF4: .4byte 0x0000FFFF
_0223FFF8: .4byte 0x0000047C
_0223FFFC: .4byte 0x00000611
_02240000: .4byte 0x00000678
_02240004: .4byte 0x00000463
	thumb_func_end ov81_0223FC74

	thumb_func_start ov81_02240008
ov81_02240008: @ 0x02240008
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _02240018
	cmp r1, #1
	beq _02240030
	b _02240040
_02240018:
	ldrb r2, [r4, #0x13]
	movs r1, #0xa
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x1f
	bl ov81_02240FA4
	cmp r0, #1
	bne _02240040
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _02240040
_02240030:
	ldr r0, _02240044 @ =0x00000462
	ldrb r1, [r4, r0]
	cmp r1, #2
	blo _02240040
	movs r1, #0
	strb r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
_02240040:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_02240044: .4byte 0x00000462
	thumb_func_end ov81_02240008

	thumb_func_start ov81_02240048
ov81_02240048: @ 0x02240048
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _02240058
	cmp r1, #1
	beq _02240072
	b _02240084
_02240058:
	movs r1, #0xf
	bl ov81_0224086C
	strb r0, [r4, #0x10]
	bl FUN_02037BEC
	movs r0, #0xa5
	bl FUN_02037AC0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _02240084
_02240072:
	movs r0, #0xa5
	bl FUN_02037B38
	cmp r0, #1
	bne _02240084
	bl FUN_02037BEC
	movs r0, #1
	pop {r4, pc}
_02240084:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov81_02240048

	thumb_func_start ov81_02240088
ov81_02240088: @ 0x02240088
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _0224009A
	cmp r0, #1
	beq _022400BA
	b _022400C8
_0224009A:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _022400C8
_022400BA:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _022400C8
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_022400C8:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov81_02240088

	thumb_func_start ov81_022400D0
ov81_022400D0: @ 0x022400D0
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _022400E2
	cmp r0, #1
	beq _022401AC
	b _022401C0
_022400E2:
	movs r0, #0xdf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02240114
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02001BC4
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_022413E0
	movs r0, #0xdf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov81_02242FC8
	movs r0, #0xdf
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_02240114:
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_0222A7CC
	movs r1, #0xf
	lsls r1, r1, #6
	ldr r0, [r4, r1]
	adds r1, #8
	ldrh r1, [r4, r1]
	adds r1, r1, #2
	bl FUN_02074644
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #1
	bl ov81_022408B8
	movs r1, #0xf1
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #6
	ldrh r1, [r4, r1]
	bl FUN_02074644
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl ov81_022408B8
	movs r0, #0x6e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov81_02243028
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02028EA8
	bl FUN_0202AD3C
	movs r3, #1
	str r3, [sp]
	str r0, [sp, #4]
	adds r1, r4, #0
	str r3, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	adds r0, r4, #0
	adds r1, #0xc0
	movs r2, #0x10
	bl ov81_0224080C
	strb r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0xc0
	bl FUN_0201D5C8
	movs r0, #0x50
	strb r0, [r4, #0x19]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _022401C0
_022401AC:
	ldrb r0, [r4, #0x10]
	bl FUN_02020094
	cmp r0, #0
	bne _022401C0
	movs r0, #0
	strb r0, [r4, #0x19]
	add sp, #0x18
	movs r0, #1
	pop {r4, pc}
_022401C0:
	movs r0, #0
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov81_022400D0

	thumb_func_start ov81_022401C8
ov81_022401C8: @ 0x022401C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02240204
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02009418
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022401EA
	bl FUN_0200398C
_022401EA:
	ldr r0, [r4, #0x4c]
	bl FUN_0201EEB4
	bl FUN_0202061C
	bl FUN_0200B224
	ldr r3, _02240208 @ =0x027E0000
	ldr r1, _0224020C @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
_02240204:
	pop {r4, pc}
	nop
_02240208: .4byte 0x027E0000
_0224020C: .4byte 0x00003FF8
	thumb_func_end ov81_022401C8

	thumb_func_start ov81_02240210
ov81_02240210: @ 0x02240210
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0224022C @ =0x0224356C
	add r3, sp, #0
	movs r2, #5
_0224021A:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0224021A
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_0224022C: .4byte 0x0224356C
	thumb_func_end ov81_02240210

	thumb_func_start ov81_02240230
ov81_02240230: @ 0x02240230
	push {r4, r5, lr}
	sub sp, #0xd4
	ldr r5, _0224039C @ =0x02243480
	add r3, sp, #0xc4
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _022403A0 @ =0x022434A8
	add r3, sp, #0xa8
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #1
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x64
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _022403A4 @ =0x022434C4
	add r3, sp, #0x8c
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #2
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _022403A8 @ =0x022434FC
	add r3, sp, #0x70
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #3
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	ldr r5, _022403AC @ =0x02243518
	add r3, sp, #0x54
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #4
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x64
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _022403B0 @ =0x022434E0
	add r3, sp, #0x38
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #5
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x64
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201CAE0
	ldr r5, _022403B4 @ =0x02243534
	add r3, sp, #0x1c
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #6
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201CAE0
	ldr r5, _022403B8 @ =0x02243550
	add r3, sp, #0
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #7
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201CAE0
	ldr r1, _022403BC @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	movs r0, #1
	strh r2, [r1]
	adds r1, r0, #0
	bl FUN_02022C60
	add sp, #0xd4
	pop {r4, r5, pc}
	.align 2, 0
_0224039C: .4byte 0x02243480
_022403A0: .4byte 0x022434A8
_022403A4: .4byte 0x022434C4
_022403A8: .4byte 0x022434FC
_022403AC: .4byte 0x02243518
_022403B0: .4byte 0x022434E0
_022403B4: .4byte 0x02243534
_022403B8: .4byte 0x02243550
_022403BC: .4byte 0x04000008
	thumb_func_end ov81_02240230

	thumb_func_start ov81_022403C0
ov81_022403C0: @ 0x022403C0
	push {r4, lr}
	adds r4, r0, #0
	bl ov81_02240210
	ldr r0, [r4, #0x4c]
	bl ov81_02240230
	movs r0, #0x64
	bl FUN_020030E8
	movs r1, #0x1a
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #2
	lsls r2, r1, #8
	movs r3, #0x64
	bl FUN_02003120
	movs r2, #0x1a
	lsls r2, r2, #4
	ldr r0, [r4, r2]
	movs r1, #0
	adds r2, #0x60
	movs r3, #0x64
	bl FUN_02003120
	bl ov81_02240770
	adds r0, r4, #0
	movs r1, #6
	bl ov81_02240728
	adds r0, r4, #0
	movs r1, #3
	bl ov81_02240698
	adds r0, r4, #0
	movs r1, #2
	bl ov81_022406E0
	ldrb r0, [r4, #0x13]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	beq _02240426
	ldr r0, [r4, #0x4c]
	ldr r3, [r4, #0xc]
	movs r1, #6
	movs r2, #0
	bl FUN_0201BC8C
_02240426:
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	adds r0, r4, #0
	movs r1, #7
	bl ov81_022407A8
	pop {r4, pc}
	thumb_func_end ov81_022403C0

	thumb_func_start ov81_02240448
ov81_02240448: @ 0x02240448
	movs r1, #0x71
	lsls r1, r1, #2
	ldr r3, _02240454 @ =ov81_0224276C
	adds r0, r0, r1
	bx r3
	nop
_02240454: .4byte ov81_0224276C
	thumb_func_end ov81_02240448

	thumb_func_start ov81_02240458
ov81_02240458: @ 0x02240458
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x1f
	movs r1, #0
	bl FUN_02022CC8
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
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201BB4C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov81_02240458

	thumb_func_start ov81_022404AC
ov81_022404AC: @ 0x022404AC
	movs r3, #0
	strb r3, [r0, #8]
	str r2, [r1]
	bx lr
	thumb_func_end ov81_022404AC

	thumb_func_start ov81_022404B4
ov81_022404B4: @ 0x022404B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, [r5, #0x4c]
	movs r1, #6
	movs r2, #1
	movs r3, #8
	bl FUN_0201BC8C
	ldr r0, [r5, #0x4c]
	movs r1, #6
	bl FUN_0201BDF4
	str r0, [r5, #0xc]
	ldrb r0, [r5, #0x12]
	movs r6, #0
	cmp r0, #0
	ble _0224054A
	adds r4, r5, #0
_022404DE:
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov81_02242F30
	adds r7, r0, #0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov81_02242F8C
	ldr r2, [r7]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	subs r1, #8
	cmp r1, r0
	bgt _0224052E
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov81_02242F8C
	adds r7, r0, #0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov81_02242F90
	adds r2, r0, #0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r1, r7, #0
	bl ov81_02242F10
	movs r0, #1
	str r0, [sp]
	b _02240540
_0224052E:
	movs r1, #0x36
	lsls r1, r1, #4
	movs r2, #7
	ldr r1, [r4, r1]
	add r0, sp, #4
	mvns r2, r2
	movs r3, #0
	bl ov81_02242EC4
_02240540:
	ldrb r0, [r5, #0x12]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blt _022404DE
_0224054A:
	adds r0, r5, #0
	bl ov81_022405F0
	ldr r0, [sp]
	cmp r0, #1
	bne _0224055C
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224055C:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov81_022404B4

	thumb_func_start ov81_02240564
ov81_02240564: @ 0x02240564
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, [r6, #0x4c]
	movs r1, #6
	movs r2, #1
	movs r3, #8
	movs r4, #0
	bl FUN_0201BC8C
	ldr r0, [r6, #0x4c]
	movs r1, #6
	bl FUN_0201BDF4
	str r0, [r6, #0xc]
	ldrb r0, [r6, #0x12]
	adds r7, r4, #0
	cmp r0, #0
	ble _022405D6
	adds r5, r6, #0
_0224058C:
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl ov81_02242F30
	ldr r1, [r0]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r1, r0, #0xc
	movs r0, #0x17
	subs r1, #8
	mvns r0, r0
	cmp r1, r0
	bge _022405BA
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov81_02242EB8
	adds r4, r4, #1
	b _022405CC
_022405BA:
	movs r1, #0x36
	lsls r1, r1, #4
	movs r2, #7
	ldr r1, [r5, r1]
	add r0, sp, #0
	mvns r2, r2
	movs r3, #0
	bl ov81_02242EC4
_022405CC:
	ldrb r0, [r6, #0x12]
	adds r7, r7, #1
	adds r5, r5, #4
	cmp r7, r0
	blt _0224058C
_022405D6:
	adds r0, r6, #0
	bl ov81_022405F0
	ldrb r0, [r6, #0x12]
	cmp r4, r0
	bne _022405E8
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_022405E8:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov81_02240564

	thumb_func_start ov81_022405F0
ov81_022405F0: @ 0x022405F0
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x14]
	movs r0, #3
	tst r0, r1
	bne _0224061E
	lsrs r0, r1, #2
	cmp r0, #4
	blo _02240608
	movs r0, #0
	str r0, [r4, #0x14]
_02240608:
	movs r3, #0x20
	str r3, [sp]
	ldr r2, [r4, #0x14]
	adds r0, r4, #0
	lsrs r2, r2, #2
	adds r2, r2, #2
	lsls r2, r2, #0x18
	movs r1, #7
	lsrs r2, r2, #0x18
	bl ov81_02240628
_0224061E:
	ldr r0, [r4, #0x14]
	adds r0, r0, #1
	str r0, [r4, #0x14]
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov81_022405F0

	thumb_func_start ov81_02240628
ov81_02240628: @ 0x02240628
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	str r3, [sp]
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	adds r4, r1, #0
	lsls r1, r4, #0x18
	str r0, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0
	ldr r0, [r5, #0x4c]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201CA4C
	lsls r1, r4, #0x18
	ldr r0, [r5, #0x4c]
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov81_02240628

	thumb_func_start ov81_02240658
ov81_02240658: @ 0x02240658
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #5
	bhi _02240688
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224066C: @ jump table
	.2byte _02240678 - _0224066C - 2 @ case 0
	.2byte _0224067C - _0224066C - 2 @ case 1
	.2byte _02240688 - _0224066C - 2 @ case 2
	.2byte _02240688 - _0224066C - 2 @ case 3
	.2byte _02240680 - _0224066C - 2 @ case 4
	.2byte _02240684 - _0224066C - 2 @ case 5
_02240678:
	movs r1, #1
	b _0224068A
_0224067C:
	movs r1, #2
	b _0224068A
_02240680:
	movs r1, #1
	b _0224068A
_02240684:
	movs r1, #2
	b _0224068A
_02240688:
	movs r1, #4
_0224068A:
	adds r0, r4, #0
	bl ov81_02241340
	movs r1, #0xe
	lsls r1, r1, #6
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov81_02240658

	thumb_func_start ov81_02240698
ov81_02240698: @ 0x02240698
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x64
	str r0, [sp, #0xc]
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #0x81
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x64
	str r0, [sp, #0xc]
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #0x82
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_02240698

	thumb_func_start ov81_022406E0
ov81_022406E0: @ 0x022406E0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x64
	str r0, [sp, #0xc]
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #0x92
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x64
	str r0, [sp, #0xc]
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #0x91
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_022406E0

	thumb_func_start ov81_02240728
ov81_02240728: @ 0x02240728
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x64
	str r0, [sp, #0xc]
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #4
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x64
	str r0, [sp, #0xc]
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #8
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_02240728

	thumb_func_start ov81_02240770
ov81_02240770: @ 0x02240770
	push {r3, r4, lr}
	sub sp, #4
	movs r0, #0xb7
	movs r1, #0xc1
	add r2, sp, #0
	movs r3, #0x64
	bl FUN_020079F4
	adds r4, r0, #0
	ldr r0, [sp]
	movs r1, #0x16
	ldr r0, [r0, #0xc]
	lsls r1, r1, #4
	blx FUN_020D2894
	ldr r0, [sp]
	movs r2, #0x16
	ldr r0, [r0, #0xc]
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020CFC6C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov81_02240770

	thumb_func_start ov81_022407A8
ov81_022407A8: @ 0x022407A8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x64
	str r0, [sp, #0xc]
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #4
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x64
	str r0, [sp, #0xc]
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #7
	adds r3, r4, #0
	bl FUN_02007B68
	movs r0, #0x16
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #0x64
	str r0, [sp, #4]
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x95
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov81_022407A8

	thumb_func_start ov81_0224080C
ov81_0224080C: @ 0x0224080C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	add r1, sp, #0x38
	ldrb r1, [r1]
	adds r5, r0, #0
	adds r0, r4, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0201D978
	ldr r0, [r5, #0x1c]
	ldr r2, [r5, #0x28]
	adds r1, r6, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x20]
	ldr r1, [r5, #0x24]
	ldr r2, [r5, #0x28]
	bl FUN_0200CBBC
	ldr r0, [sp, #0x28]
	add r2, sp, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	adds r3, r7, #0
	str r0, [sp, #4]
	add r0, sp, #0x38
	ldrb r1, [r0]
	ldrb r0, [r2, #0x18]
	ldrb r2, [r2, #0x1c]
	lsls r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r0, r0, #8
	lsrs r2, r2, #0x10
	orrs r0, r2
	orrs r0, r1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x3c
	ldrb r1, [r1]
	ldr r2, [r5, #0x24]
	adds r0, r4, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov81_0224080C

	thumb_func_start ov81_0224086C
ov81_0224086C: @ 0x0224086C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	movs r3, #1
	adds r2, r1, #0
	str r3, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r3, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	movs r1, #0xf
	str r1, [sp, #0x10]
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0xc0
	str r3, [sp, #0x14]
	bl ov81_0224080C
	adds r4, #0xc0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_0224086C

	thumb_func_start ov81_022408A0
ov81_022408A0: @ 0x022408A0
	push {r3, lr}
	sub sp, #8
	movs r3, #0
	str r3, [sp]
	movs r3, #1
	str r3, [sp, #4]
	ldr r0, [r0, #0x20]
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov81_022408A0

	thumb_func_start ov81_022408B8
ov81_022408B8: @ 0x022408B8
	ldr r3, _022408C0 @ =FUN_0200BF1C
	ldr r0, [r0, #0x20]
	bx r3
	nop
_022408C0: .4byte FUN_0200BF1C
	thumb_func_end ov81_022408B8

	thumb_func_start ov81_022408C4
ov81_022408C4: @ 0x022408C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r1, #0
	movs r1, #0x6f
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	str r2, [sp, #0x10]
	adds r6, r3, #0
	bl FUN_02028E9C
	adds r7, r0, #0
	movs r0, #8
	movs r1, #0x64
	bl FUN_02026354
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r7, #0
	bl FUN_02028F54
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_020269A0
	adds r0, r7, #0
	bl FUN_02028F94
	cmp r0, #0
	bne _02240908
	ldr r1, _02240938 @ =0x00070800
	b _0224090C
_02240908:
	movs r1, #0xc1
	lsls r1, r1, #0xa
_0224090C:
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x18
	ldrb r1, [r1, #0x10]
	ldr r3, [sp, #0x10]
	adds r0, r5, #0
	adds r2, r4, #0
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02240938: .4byte 0x00070800
	thumb_func_end ov81_022408C4

	thumb_func_start ov81_0224093C
ov81_0224093C: @ 0x0224093C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r1, #0
	str r2, [sp, #0x10]
	adds r6, r3, #0
	bl FUN_0203769C
	movs r1, #1
	subs r0, r1, r0
	bl FUN_02034818
	adds r7, r0, #0
	movs r0, #8
	movs r1, #0x64
	bl FUN_02026354
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_02028F58
	adds r0, r7, #0
	bl FUN_02028F94
	cmp r0, #0
	bne _0224097C
	ldr r1, _022409AC @ =0x00070800
	b _02240980
_0224097C:
	movs r1, #0xc1
	lsls r1, r1, #0xa
_02240980:
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x18
	ldrb r1, [r1, #0x10]
	ldr r3, [sp, #0x10]
	adds r0, r5, #0
	adds r2, r4, #0
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_022409AC: .4byte 0x00070800
	thumb_func_end ov81_0224093C

	thumb_func_start ov81_022409B0
ov81_022409B0: @ 0x022409B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r4, r1, #0
	add r1, sp, #0x28
	ldrb r1, [r1, #0x1c]
	adds r5, r0, #0
	adds r0, r4, #0
	adds r6, r2, #0
	str r3, [sp, #0x10]
	bl FUN_0201D978
	ldr r0, [sp, #0x4c]
	adds r1, r6, #0
	bl FUN_02074644
	adds r7, r0, #0
	movs r0, #0xb
	movs r1, #0x64
	bl FUN_02026354
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x1c]
	movs r1, #0x1c
	bl FUN_0200BBA0
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, [r5, #0x20]
	movs r1, #0
	bl FUN_0200BF1C
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	bl FUN_0200CBBC
	add r0, sp, #0x48
	ldrb r6, [r0]
	ldr r0, [sp, #0x38]
	add r2, sp, #0x28
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldrb r0, [r2, #0x14]
	ldrb r1, [r2, #0x1c]
	ldrb r2, [r2, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x10
	orrs r0, r2
	orrs r0, r1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x10]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020200FC
	ldr r0, [sp, #0x1c]
	bl FUN_02026380
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	adds r0, r7, #0
	movs r1, #0xb0
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #1
	bne _02240AC8
	adds r0, r7, #0
	bl FUN_0206FF88
	adds r7, r0, #0
	adds r0, r4, #0
	bl FUN_0201EE90
	subs r0, r0, #1
	lsls r0, r0, #3
	subs r0, r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	cmp r7, #0
	bne _02240A96
	ldr r0, [r5, #0x1c]
	movs r1, #0x1a
	bl FUN_0200BBA0
	adds r5, r0, #0
	ldr r0, [sp, #0x38]
	adds r1, r6, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02240AD4 @ =0x00070800
	adds r2, r5, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x14]
	adds r0, r4, #0
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_02026380
	b _02240AC8
_02240A96:
	cmp r7, #1
	bne _02240AC8
	ldr r0, [r5, #0x1c]
	movs r1, #0x1b
	bl FUN_0200BBA0
	adds r5, r0, #0
	ldr r0, [sp, #0x38]
	adds r1, r6, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0xc1
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x14]
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_02026380
_02240AC8:
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02240AD4: .4byte 0x00070800
	thumb_func_end ov81_022409B0

	thumb_func_start ov81_02240AD8
ov81_02240AD8: @ 0x02240AD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r1, #0
	add r1, sp, #0x28
	ldrb r1, [r1, #0x18]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	str r2, [sp, #0x14]
	adds r6, r3, #0
	bl FUN_0201D978
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xed
	movs r3, #0x64
	bl FUN_0200BAF8
	add r1, sp, #0x28
	ldrh r1, [r1, #0x20]
	adds r7, r0, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_0200BB44
	add r2, sp, #0x28
	ldrb r0, [r2, #0x1c]
	ldr r3, [sp, #0x14]
	str r0, [sp, #0x1c]
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldrb r0, [r2, #0x10]
	ldrb r1, [r2, #0x18]
	ldrb r2, [r2, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #8
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x10
	orrs r0, r2
	orrs r0, r1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x1c]
	adds r0, r5, #0
	adds r2, r4, #0
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_0201EE90
	subs r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	add r0, sp, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	bne _02240B58
	movs r0, #0x1a
	str r0, [sp, #0x18]
	b _02240B5C
_02240B58:
	movs r0, #0x1b
	str r0, [sp, #0x18]
_02240B5C:
	add r0, sp, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	bne _02240B68
	ldr r7, _02240BAC @ =0x00070800
	b _02240B6C
_02240B68:
	movs r7, #0xc1
	lsls r7, r7, #0xa
_02240B6C:
	adds r0, r4, #0
	bl FUN_020263AC
	add r0, sp, #0x4c
	ldrb r0, [r0]
	cmp r0, #2
	beq _02240BA0
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x18]
	ldr r0, [r0, #0x1c]
	adds r2, r4, #0
	bl FUN_0200BB6C
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	adds r0, r5, #0
	adds r2, r4, #0
	lsls r3, r3, #3
	bl FUN_020200FC
_02240BA0:
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02240BAC: .4byte 0x00070800
	thumb_func_end ov81_02240AD8

	thumb_func_start ov81_02240BB0
ov81_02240BB0: @ 0x02240BB0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov81_0224275C
	ldrb r0, [r5, #0x12]
	movs r6, #0
	cmp r0, #0
	ble _02240BE0
	movs r7, #0x36
	adds r4, r5, #0
	lsls r7, r7, #4
_02240BC6:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02240BD6
	bl ov81_02242EA4
	movs r1, #0x36
	lsls r1, r1, #4
	str r0, [r4, r1]
_02240BD6:
	ldrb r0, [r5, #0x12]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blt _02240BC6
_02240BE0:
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov81_02242D74
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov81_02242D74
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl ov81_02242D74
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov81_02242D74
	movs r0, #0xe6
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov81_02242D74
	adds r0, r5, #0
	bl ov81_02241364
	adds r0, r5, #0
	bl ov81_02241FC0
	adds r0, r5, #0
	bl ov81_02242170
	bl FUN_0203A914
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_02003150
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02003150
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02003104
	movs r0, #0x1a
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
	adds r0, #0x24
	adds r0, r5, r0
	bl ov81_02242B38
	movs r7, #0x6b
	movs r6, #0
	adds r4, r5, #0
	lsls r7, r7, #2
_02240C62:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02240C6C
	bl FUN_02008780
_02240C6C:
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #3
	blt _02240C62
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02008524
	ldr r0, [r5, #0x1c]
	bl FUN_0200BB44
	ldr r0, [r5, #0x20]
	bl FUN_0200BDA0
	ldr r0, [r5, #0x24]
	bl FUN_02026380
	ldr r0, [r5, #0x28]
	bl FUN_02026380
	movs r6, #0
	adds r4, r5, #0
_02240C9A:
	ldr r0, [r4, #0x2c]
	bl FUN_02026380
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _02240C9A
	movs r0, #4
	bl FUN_02002DB4
	adds r0, r5, #0
	adds r0, #0x50
	bl ov81_0224300C
	ldr r0, [r5, #0x4c]
	bl ov81_02240458
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200770C
	movs r0, #0x69
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02026F54
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov81_02240BB0

	thumb_func_start ov81_02240CD4
ov81_02240CD4: @ 0x02240CD4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl ov81_02240D2C
	movs r2, #2
	movs r1, #0
	ldr r0, _02240D24 @ =ov81_02242BC8
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0x64
	adds r3, r1, #0
	bl FUN_02026EB4
	movs r1, #0x69
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x64
	bl FUN_0201AC88
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	bl ov81_02240D64
	adds r1, r4, #0
	ldr r0, [r4, #0x4c]
	adds r1, #0x50
	bl ov81_02242FDC
	ldr r0, _02240D28 @ =0x0000047C
	ldr r0, [r4, r0]
	cmp r0, #2
	bne _02240D1E
	adds r4, #0x70
	adds r0, r4, #0
	bl ov81_022430E8
_02240D1E:
	add sp, #8
	pop {r4, pc}
	nop
_02240D24: .4byte ov81_02242BC8
_02240D28: .4byte 0x0000047C
	thumb_func_end ov81_02240CD4

	thumb_func_start ov81_02240D2C
ov81_02240D2C: @ 0x02240D2C
	push {r3, lr}
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A120
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02240D5C @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _02240D60 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_02240D5C: .4byte 0xFFFFE0FF
_02240D60: .4byte 0x04001000
	thumb_func_end ov81_02240D2C

	thumb_func_start ov81_02240D64
ov81_02240D64: @ 0x02240D64
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0xb7
	movs r1, #0x64
	bl FUN_02007688
	movs r1, #0xf7
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov81_022403C0
	adds r0, r5, #0
	bl ov81_02240448
	movs r0, #4
	movs r1, #0x64
	bl FUN_02002CEC
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xc2
	movs r3, #0x64
	bl FUN_0200BAF8
	str r0, [r5, #0x1c]
	movs r0, #0x64
	bl FUN_0200BD08
	str r0, [r5, #0x20]
	movs r0, #0x32
	lsls r0, r0, #4
	movs r1, #0x64
	bl FUN_02026354
	str r0, [r5, #0x24]
	movs r0, #0x32
	lsls r0, r0, #4
	movs r1, #0x64
	bl FUN_02026354
	str r0, [r5, #0x28]
	movs r6, #0
	adds r4, r5, #0
	movs r7, #0x40
_02240DBE:
	adds r0, r7, #0
	movs r1, #0x64
	bl FUN_02026354
	str r0, [r4, #0x2c]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _02240DBE
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x64
	bl FUN_02003030
	movs r1, #0x1a
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #0x64
	bl FUN_02003030
	movs r1, #6
	movs r0, #0
	lsls r1, r1, #6
	movs r2, #0x64
	bl FUN_0200304C
	movs r1, #6
	movs r0, #4
	lsls r1, r1, #6
	movs r2, #0x64
	bl FUN_0200304C
	movs r0, #0x64
	bl FUN_02007FD4
	movs r1, #0x6a
	lsls r1, r1, #2
	str r0, [r5, r1]
	bl FUN_02037474
	cmp r0, #0
	beq _02240E26
	movs r0, #1
	movs r1, #0x10
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	bl FUN_0203A880
_02240E26:
	adds r0, r5, #0
	movs r1, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _02240E40
	adds r0, r5, #0
	bl ov81_0223E87C
	adds r0, r5, #0
	bl ov81_0223E8B0
	b _02240E4C
_02240E40:
	adds r0, r5, #0
	bl ov81_0223EBE4
	adds r0, r5, #0
	bl ov81_0223EC44
_02240E4C:
	adds r0, r5, #0
	bl ov81_02242500
	movs r1, #0xf7
	lsls r1, r1, #2
	ldr r0, [r5, #0x4c]
	ldr r1, [r5, r1]
	bl ov81_02243100
	adds r0, r5, #0
	bl ov81_0224271C
	bl FUN_02022D24
	ldr r0, _02240E74 @ =ov81_022401C8
	adds r1, r5, #0
	bl FUN_0201A0FC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02240E74: .4byte ov81_022401C8
	thumb_func_end ov81_02240D64

	thumb_func_start ov81_02240E78
ov81_02240E78: @ 0x02240E78
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	movs r1, #0x3c
	bl FUN_0201AA8C
	movs r1, #7
	lsls r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0
	movs r2, #0x3c
	blx FUN_020E5B44
	movs r1, #0xf
	movs r2, #7
	lsls r1, r1, #6
	lsls r2, r2, #6
	ldr r3, [r4, r1]
	ldr r0, [r4, r2]
	adds r1, #0xa8
	str r3, [r0]
	adds r0, r2, #0
	subs r0, #8
	ldr r3, [r4, r0]
	ldr r0, [r4, r2]
	str r3, [r0, #4]
	ldr r0, [r4, r2]
	movs r3, #1
	strb r3, [r0, #0x11]
	ldr r0, [r4, r2]
	strb r3, [r0, #0x12]
	ldrb r3, [r4, #0x12]
	ldr r0, [r4, r2]
	strb r3, [r0, #0x13]
	ldr r1, [r4, r1]
	ldr r0, [r4, r2]
	strb r1, [r0, #0x14]
	ldr r0, [r4, r2]
	movs r1, #0
	strh r1, [r0, #0x18]
	subs r0, r2, #4
	ldr r0, [r4, r0]
	bl FUN_02074910
	movs r1, #7
	lsls r1, r1, #6
	ldr r2, [r4, r1]
	str r0, [r2, #0x1c]
	ldr r0, [r4, r1]
	movs r2, #0
	str r2, [r0, #0x2c]
	ldr r0, [r4, r1]
	str r2, [r0, #0x34]
	ldr r0, [r4, r1]
	ldr r1, _02240F04 @ =_02243458
	bl FUN_02089D40
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02028E9C
	adds r1, r0, #0
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0208AD34
	pop {r4, pc}
	.align 2, 0
_02240F04: .4byte _02243458
	thumb_func_end ov81_02240E78

	thumb_func_start ov81_02240F08
ov81_02240F08: @ 0x02240F08
	ldrb r0, [r0, #0xb]
	cmp r0, r1
	bne _02240F12
	movs r0, #1
	bx lr
_02240F12:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov81_02240F08

	thumb_func_start ov81_02240F18
ov81_02240F18: @ 0x02240F18
	cmp r0, #0
	beq _02240F20
	cmp r0, #1
	bne _02240F24
_02240F20:
	movs r0, #3
	bx lr
_02240F24:
	movs r0, #2
	bx lr
	thumb_func_end ov81_02240F18

	thumb_func_start ov81_02240F28
ov81_02240F28: @ 0x02240F28
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _02240F34
	movs r0, #1
	bx lr
_02240F34:
	movs r0, #0
	bx lr
	thumb_func_end ov81_02240F28

	thumb_func_start ov81_02240F38
ov81_02240F38: @ 0x02240F38
	ldrb r3, [r0, #0x13]
	movs r2, #1
	bics r3, r2
	movs r2, #1
	ands r1, r2
	orrs r1, r3
	strb r1, [r0, #0x13]
	bx lr
	thumb_func_end ov81_02240F38

	thumb_func_start ov81_02240F48
ov81_02240F48: @ 0x02240F48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r4, r1, #2
	ldr r1, [sp, #0x20]
	movs r7, #0x6b
	lsls r7, r7, #2
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	subs r1, r7, #4
	adds r5, r0, r7
	ldr r0, [r0, r1]
	movs r1, #0
	adds r6, r2, #0
	bl ov81_02242C80
	str r0, [r5, r4]
	ldr r0, [r5, r4]
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	adds r7, r0, #0
	adds r0, r6, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #0
	adds r0, r7, #0
	movs r2, #0x1c
	bl FUN_0206FBC4
	cmp r0, #0
	bne _02240FA0
	ldr r0, [r5, r4]
	ldr r1, [sp, #0x24]
	bl ov81_02242CB0
_02240FA0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov81_02240F48

	thumb_func_start ov81_02240FA4
ov81_02240FA4: @ 0x02240FA4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	adds r4, r1, #0
	adds r7, r2, #0
	bl FUN_02237254
	cmp r0, #0
	bne _02240FBA
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02240FBA:
	cmp r4, #7
	beq _02240FC8
	cmp r4, #8
	beq _02240FD4
	cmp r4, #0xa
	beq _02240FE2
	b _02240FEE
_02240FC8:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r6, #0x1d
	bl ov81_02241008
	b _02240FEE
_02240FD4:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r6, #0x1e
	bl ov81_0224102C
	b _02240FEE
_02240FE2:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r6, #0x20
	bl ov81_02241218
_02240FEE:
	movs r1, #0x3e
	lsls r1, r1, #4
	adds r0, r6, #0
	adds r1, r5, r1
	movs r2, #0x3c
	bl FUN_02037030
	cmp r0, #1
	bne _02241004
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02241004:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov81_02240FA4

	thumb_func_start ov81_02241008
ov81_02241008: @ 0x02241008
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_02028E9C
	movs r0, #0x3e
	lsls r0, r0, #4
	strh r4, [r5, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_02241008

	thumb_func_start ov81_02241020
ov81_02241020: @ 0x02241020
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0203769C
	cmp r4, r0
	pop {r4, pc}
	thumb_func_end ov81_02241020

	thumb_func_start ov81_0224102C
ov81_0224102C: @ 0x0224102C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #0
	movs r0, #0x3e
	str r1, [sp]
	adds r2, r5, #0
	adds r4, r1, #0
	lsls r0, r0, #4
_0224103C:
	adds r1, r1, #1
	strh r4, [r2, r0]
	adds r2, r2, #2
	cmp r1, #0x3c
	blt _0224103C
	ldrb r1, [r5, #0x11]
	movs r0, #0x3e
	lsls r0, r0, #4
	strh r1, [r5, r0]
	ldr r0, [sp]
	adds r0, r0, #1
	str r0, [sp]
	ldrb r0, [r5, #0x11]
	cmp r0, #0
	ble _0224108C
	ldr r0, [sp]
	adds r7, r5, #0
	lsls r0, r0, #1
	adds r6, r5, r0
_02241062:
	movs r1, #0xf2
	movs r0, #0xf
	lsls r1, r1, #2
	lsls r0, r0, #6
	ldrh r1, [r7, r1]
	ldr r0, [r5, r0]
	bl FUN_02074644
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x3e
	lsls r1, r1, #4
	strh r0, [r6, r1]
	ldrb r0, [r5, #0x11]
	adds r4, r4, #1
	adds r7, r7, #2
	adds r6, r6, #2
	cmp r4, r0
	blt _02241062
_0224108C:
	ldr r1, [sp]
	movs r7, #0
	adds r1, r1, r0
	cmp r0, #0
	ble _022410C6
	lsls r0, r1, #1
	adds r6, r5, #0
	adds r4, r5, r0
_0224109C:
	movs r1, #0xf2
	movs r0, #0xf
	lsls r1, r1, #2
	lsls r0, r0, #6
	ldrh r1, [r6, r1]
	ldr r0, [r5, r0]
	bl FUN_02074644
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x3e
	lsls r1, r1, #4
	strh r0, [r4, r1]
	ldrb r0, [r5, #0x11]
	adds r7, r7, #1
	adds r6, r6, #2
	adds r4, r4, #2
	cmp r7, r0
	blt _0224109C
_022410C6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov81_0224102C

	thumb_func_start ov81_022410C8
ov81_022410C8: @ 0x022410C8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r3, #0
	adds r7, r0, #0
	ldrb r0, [r5, #9]
	adds r6, r2, #0
	movs r4, #0
	bl FUN_02236DD4
	bl FUN_0203769C
	cmp r7, r0
	beq _0224112C
	ldrh r0, [r6]
	adds r4, r4, #1
	strb r0, [r5, #0x18]
	ldrb r3, [r5, #0x18]
	movs r0, #0
	cmp r3, #0
	ble _02241106
	lsls r1, r4, #1
	ldr r7, _02241130 @ =0x0000045A
	adds r1, r6, r1
	adds r2, r5, #0
_022410F6:
	ldrh r3, [r1]
	adds r0, r0, #1
	adds r1, r1, #2
	strh r3, [r2, r7]
	ldrb r3, [r5, #0x18]
	adds r2, r2, #2
	cmp r0, r3
	blt _022410F6
_02241106:
	adds r1, r4, r3
	movs r0, #0
	cmp r3, #0
	ble _02241126
	lsls r1, r1, #1
	adds r3, r6, r1
	ldr r1, _02241134 @ =0x0000045E
	adds r4, r5, #0
_02241116:
	ldrh r2, [r3]
	adds r0, r0, #1
	adds r3, r3, #2
	strh r2, [r4, r1]
	ldrb r2, [r5, #0x18]
	adds r4, r4, #2
	cmp r0, r2
	blt _02241116
_02241126:
	ldr r0, _02241138 @ =0x00000463
	movs r1, #1
	strb r1, [r5, r0]
_0224112C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02241130: .4byte 0x0000045A
_02241134: .4byte 0x0000045E
_02241138: .4byte 0x00000463
	thumb_func_end ov81_022410C8

	thumb_func_start ov81_0224113C
ov81_0224113C: @ 0x0224113C
	ldr r3, _02241140 @ =GF_AssertFail
	bx r3
	.align 2, 0
_02241140: .4byte GF_AssertFail
	thumb_func_end ov81_0224113C

	thumb_func_start ov81_02241144
ov81_02241144: @ 0x02241144
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r7, r0, #0
	ldrb r0, [r7, #9]
	bl FUN_02236DD4
	str r0, [sp, #0x18]
	ldrb r0, [r7, #0x13]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _02241180
	adds r0, r7, #0
	adds r0, #0x60
	bl FUN_0201D8E4
	adds r0, r7, #0
	adds r0, #0xa0
	bl FUN_0201D8E4
	adds r7, #0xb0
	adds r0, r7, #0
	bl FUN_0201D8E4
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_02241180:
	ldr r0, _0224120C @ =0x00000463
	ldrb r0, [r7, r0]
	cmp r0, #1
	bne _02241200
	ldr r0, [sp, #0x18]
	movs r4, #0
	cmp r0, #0
	ble _022411E8
	adds r6, r7, #0
	adds r5, r7, #0
	adds r6, #0x50
_02241196:
	adds r0, r4, #5
	lsls r0, r0, #4
	str r0, [sp, #0x1c]
	adds r0, r6, r0
	movs r1, #0
	bl FUN_0201D978
	ldrb r0, [r7, #0x18]
	cmp r4, r0
	bge _022411D6
	movs r0, #0xf
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _02241210 @ =0x0000045A
	ldr r1, [sp, #0x1c]
	ldrh r0, [r5, r0]
	movs r2, #0
	adds r1, r6, r1
	str r0, [sp, #0x10]
	ldr r0, _02241214 @ =0x0000045E
	adds r3, r2, #0
	ldrh r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	adds r0, r7, #0
	bl ov81_02240AD8
_022411D6:
	ldr r0, [sp, #0x1c]
	adds r0, r6, r0
	bl FUN_0201D5C8
	ldr r0, [sp, #0x18]
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, r0
	blt _02241196
_022411E8:
	movs r2, #0
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, #0x60
	adds r3, r2, #0
	str r2, [sp]
	bl ov81_0224093C
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
_02241200:
	ldr r0, _0224120C @ =0x00000463
	movs r1, #0
	strb r1, [r7, r0]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224120C: .4byte 0x00000463
_02241210: .4byte 0x0000045A
_02241214: .4byte 0x0000045E
	thumb_func_end ov81_02241144

	thumb_func_start ov81_02241218
ov81_02241218: @ 0x02241218
	movs r3, #0x3e
	lsls r3, r3, #4
	strh r1, [r0, r3]
	adds r1, r3, #2
	strh r2, [r0, r1]
	adds r1, r3, #0
	subs r1, #0x18
	ldrh r2, [r0, r1]
	adds r1, r3, #4
	strh r2, [r0, r1]
	adds r1, r3, #0
	subs r1, #0x16
	ldrh r2, [r0, r1]
	adds r1, r3, #6
	strh r2, [r0, r1]
	bx lr
	thumb_func_end ov81_02241218

	thumb_func_start ov81_02241238
ov81_02241238: @ 0x02241238
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _022412BC @ =0x00000462
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _022412BA
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _022412C0 @ =0x00000458
	strh r1, [r4, r0]
	bl FUN_0203769C
	cmp r0, #0
	bne _02241294
	ldrb r0, [r4, #0x13]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _02241274
	ldr r0, _022412C0 @ =0x00000458
	movs r1, #0
	strh r1, [r4, r0]
	pop {r4, r5, r6, pc}
_02241274:
	ldr r1, _022412C0 @ =0x00000458
	ldrh r0, [r4, r1]
	cmp r0, #1
	bne _022412BA
	ldrh r0, [r5, #4]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x90
	strh r2, [r4, r0]
	ldrh r0, [r5, #6]
	subs r1, #0x8e
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, r1]
	pop {r4, r5, r6, pc}
_02241294:
	ldr r1, _022412C0 @ =0x00000458
	ldrh r0, [r4, r1]
	cmp r0, #1
	bne _022412BA
	ldrb r2, [r4, #0x13]
	movs r0, #8
	bics r2, r0
	strb r2, [r4, #0x13]
	ldrh r0, [r5, #4]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x90
	strh r2, [r4, r0]
	ldrh r0, [r5, #6]
	subs r1, #0x8e
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r4, r1]
_022412BA:
	pop {r4, r5, r6, pc}
	.align 2, 0
_022412BC: .4byte 0x00000462
_022412C0: .4byte 0x00000458
	thumb_func_end ov81_02241238

	thumb_func_start ov81_022412C4
ov81_022412C4: @ 0x022412C4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0
	adds r5, r0, #0
	bl ov81_02240F08
	cmp r0, #1
	bne _022412E0
	ldr r0, _02241320 @ =0x02243490
	lsls r2, r4, #2
	ldrh r1, [r0, r2]
	ldr r0, _02241324 @ =0x02243492
	ldrh r2, [r0, r2]
	b _02241312
_022412E0:
	ldrb r0, [r5, #9]
	bl FUN_02237254
	cmp r0, #0
	bne _022412F6
	ldr r0, _02241328 @ =0x02243464
	lsls r2, r4, #2
	ldrh r1, [r0, r2]
	ldr r0, _0224132C @ =0x02243466
	ldrh r2, [r0, r2]
	b _02241312
_022412F6:
	ldrb r0, [r5, #0x12]
	cmp r0, #2
	bne _02241308
	ldr r0, _02241330 @ =0x0224345C
	lsls r2, r4, #2
	ldrh r1, [r0, r2]
	ldr r0, _02241334 @ =0x0224345E
	ldrh r2, [r0, r2]
	b _02241312
_02241308:
	ldr r0, _02241338 @ =0x02243470
	lsls r2, r4, #2
	ldrh r1, [r0, r2]
	ldr r0, _0224133C @ =0x02243472
	ldrh r2, [r0, r2]
_02241312:
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r3, #0x64
	bl ov81_02242E50
	pop {r3, r4, r5, pc}
	.align 2, 0
_02241320: .4byte 0x02243490
_02241324: .4byte 0x02243492
_02241328: .4byte 0x02243464
_0224132C: .4byte 0x02243466
_02241330: .4byte 0x0224345C
_02241334: .4byte 0x0224345E
_02241338: .4byte 0x02243470
_0224133C: .4byte 0x02243472
	thumb_func_end ov81_022412C4

	thumb_func_start ov81_02241340
ov81_02241340: @ 0x02241340
	push {lr}
	sub sp, #0xc
	adds r2, r1, #0
	movs r1, #0xa
	str r1, [sp]
	movs r1, #0x80
	str r1, [sp, #4]
	movs r1, #0x7c
	str r1, [sp, #8]
	movs r1, #0x71
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #1
	movs r3, #2
	bl ov81_02242CBC
	add sp, #0xc
	pop {pc}
	thumb_func_end ov81_02241340

	thumb_func_start ov81_02241364
ov81_02241364: @ 0x02241364
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224137E
	bl ov81_02242D74
	movs r0, #0xe
	movs r1, #0
	lsls r0, r0, #6
	str r1, [r4, r0]
_0224137E:
	movs r0, #0xe1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02241394
	bl ov81_02242D74
	movs r0, #0xe1
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_02241394:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov81_02241364

	thumb_func_start ov81_02241398
ov81_02241398: @ 0x02241398
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x64
	bl FUN_0201C1C4
	ldr r0, [r4, #0x4c]
	movs r1, #1
	bl FUN_0201CAE0
	adds r1, r4, #0
	ldr r0, [r4, #0x4c]
	adds r1, #0x50
	bl ov81_02242FDC
	ldr r0, _022413DC @ =0x0000047C
	ldr r0, [r4, r0]
	cmp r0, #2
	bne _022413D2
	adds r4, #0x70
	adds r0, r4, #0
	bl ov81_022430E8
_022413D2:
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	pop {r4, pc}
	.align 2, 0
_022413DC: .4byte 0x0000047C
	thumb_func_end ov81_02241398

	thumb_func_start ov81_022413E0
ov81_022413E0: @ 0x022413E0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov81_022413E0

	thumb_func_start ov81_022413F4
ov81_022413F4: @ 0x022413F4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _02241418 @ =0x00000464
	add r2, sp, #4
	ldr r0, [r4, r0]
	add r3, sp, #0
	bl ov81_02243228
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242DAC
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_02241418: .4byte 0x00000464
	thumb_func_end ov81_022413F4

	thumb_func_start ov81_0224141C
ov81_0224141C: @ 0x0224141C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0224144C @ =0x00000464
	add r2, sp, #4
	ldr r0, [r4, r0]
	add r3, sp, #0
	bl ov81_02243228
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	bl ov81_02242DE4
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242DAC
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_0224144C: .4byte 0x00000464
	thumb_func_end ov81_0224141C

	thumb_func_start ov81_02241450
ov81_02241450: @ 0x02241450
	push {r4, lr}
	movs r1, #0xf7
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r4, #0x4c]
	ldr r1, [r4, r1]
	movs r2, #0
	bl ov81_02243140
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r4, r0
	bl FUN_0201D5C8
	movs r0, #0x13
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
	ldr r0, _022414D8 @ =0x00000468
	ldr r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F40
	cmp r0, #0
	bne _02241498
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
	b _022414A2
_02241498:
	movs r0, #0x12
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
_022414A2:
	ldr r0, _022414DC @ =0x00000464
	movs r1, #6
	ldr r0, [r4, r0]
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #6
	bl ov81_0224141C
	ldr r0, _022414DC @ =0x00000464
	movs r1, #1
	ldr r0, [r4, r0]
	bl ov81_02243270
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_02242D88
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_02242E08
	pop {r4, pc}
	.align 2, 0
_022414D8: .4byte 0x00000468
_022414DC: .4byte 0x00000464
	thumb_func_end ov81_02241450

	thumb_func_start ov81_022414E0
ov81_022414E0: @ 0x022414E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	movs r1, #0
	bl ov81_022431E0
	ldr r1, _02241520 @ =0x00000464
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, _02241520 @ =0x00000464
	movs r1, #0
	ldr r0, [r4, r0]
	bl ov81_02243270
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242E08
	pop {r4, pc}
	.align 2, 0
_02241520: .4byte 0x00000464
	thumb_func_end ov81_022414E0

	thumb_func_start ov81_02241524
ov81_02241524: @ 0x02241524
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r4, r0
	movs r1, #2
	bl FUN_0201D978
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #2
	bl FUN_0201D978
	movs r0, #0x12
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #2
	bl FUN_0201D978
	movs r0, #0x13
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #2
	bl FUN_0201D978
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r4, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _0224164C @ =0x000F0E02
	lsls r5, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	lsrs r3, r5, #0x1f
	adds r0, #0xfe
	adds r3, r5, r3
	ldr r1, [r4, #0x1c]
	adds r0, r4, r0
	movs r2, #5
	asrs r3, r3, #1
	bl ov81_022430B4
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _0224164C @ =0x000F0E02
	lsls r5, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x11
	lsrs r3, r5, #0x1f
	lsls r0, r0, #4
	adds r3, r5, r3
	ldr r1, [r4, #0x1c]
	adds r0, r4, r0
	movs r2, #6
	asrs r3, r3, #1
	bl ov81_022430B4
	movs r0, #0x12
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _0224164C @ =0x000F0E02
	lsls r5, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x12
	lsrs r3, r5, #0x1f
	lsls r0, r0, #4
	adds r3, r5, r3
	ldr r1, [r4, #0x1c]
	adds r0, r4, r0
	movs r2, #8
	asrs r3, r3, #1
	bl ov81_022430B4
	movs r0, #0x13
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _0224164C @ =0x000F0E02
	lsls r5, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x13
	lsrs r3, r5, #0x1f
	lsls r0, r0, #4
	adds r3, r5, r3
	ldr r1, [r4, #0x1c]
	adds r0, r4, r0
	movs r2, #7
	asrs r3, r3, #1
	bl ov81_022430B4
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x12
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x13
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224164C: .4byte 0x000F0E02
	thumb_func_end ov81_02241524

	thumb_func_start ov81_02241650
ov81_02241650: @ 0x02241650
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _022416C8 @ =0x00000464
	add r2, sp, #4
	ldr r0, [r5, r0]
	add r3, sp, #0
	adds r4, r1, #0
	bl ov81_02243228
	cmp r4, #3
	bne _0224169E
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov81_02242D88
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	bl ov81_02242DE4
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242DAC
	add sp, #8
	pop {r3, r4, r5, pc}
_0224169E:
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov81_02242D88
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242DAC
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_022416C8: .4byte 0x00000464
	thumb_func_end ov81_02241650

	thumb_func_start ov81_022416CC
ov81_022416CC: @ 0x022416CC
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _02241748 @ =0x00000464
	adds r4, r1, #0
	ldr r0, [r5, r0]
	add r2, sp, #4
	add r3, sp, #0
	bl ov81_02243228
	subs r0, r4, #4
	cmp r0, #1
	bhi _0224171C
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov81_02242D88
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	bl ov81_02242DE4
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242DAC
	add sp, #8
	pop {r3, r4, r5, pc}
_0224171C:
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov81_02242D88
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov81_02242D88
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242DAC
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02241748: .4byte 0x00000464
	thumb_func_end ov81_022416CC

	thumb_func_start ov81_0224174C
ov81_0224174C: @ 0x0224174C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	movs r1, #3
	bl ov81_022431E0
	movs r1, #0xf7
	lsls r1, r1, #2
	ldr r0, [r4, #0x4c]
	ldr r1, [r4, r1]
	movs r2, #0
	bl ov81_02243140
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r4, r0
	bl FUN_0201D5C8
	movs r0, #5
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201D5C8
	movs r0, #0x13
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
	ldr r0, _022417B0 @ =0x00000464
	movs r1, #4
	ldr r0, [r4, r0]
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #4
	bl ov81_0224141C
	ldr r0, _022417B0 @ =0x00000464
	ldrb r2, [r4, #9]
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_02243314
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_02242D88
	pop {r4, pc}
	.align 2, 0
_022417B0: .4byte 0x00000464
	thumb_func_end ov81_0224174C

	thumb_func_start ov81_022417B4
ov81_022417B4: @ 0x022417B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	movs r1, #0
	bl ov81_022431E0
	movs r1, #0xf7
	lsls r1, r1, #2
	ldr r0, [r4, #0x4c]
	ldr r1, [r4, r1]
	movs r2, #3
	bl ov81_02243140
	adds r0, r4, #0
	adds r0, #0xf0
	bl FUN_0201D5C8
	ldr r1, _02241800 @ =0x00000464
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, _02241800 @ =0x00000464
	ldrb r2, [r4, #9]
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02243314
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	pop {r4, pc}
	.align 2, 0
_02241800: .4byte 0x00000464
	thumb_func_end ov81_022417B4

	thumb_func_start ov81_02241804
ov81_02241804: @ 0x02241804
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0224183C @ =0x00000464
	ldr r0, [r5, r0]
	bl FUN_02019F74
	movs r1, #0xf7
	lsls r1, r1, #2
	adds r4, r0, #0
	ldr r0, [r5, #0x4c]
	ldr r1, [r5, r1]
	movs r2, #3
	bl ov81_02243140
	adds r0, r5, #0
	adds r0, #0xf0
	bl FUN_0201D5C8
	cmp r4, #3
	bne _02241838
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov81_02242D88
_02241838:
	pop {r3, r4, r5, pc}
	nop
_0224183C: .4byte 0x00000464
	thumb_func_end ov81_02241804

	thumb_func_start ov81_02241840
ov81_02241840: @ 0x02241840
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	movs r1, #3
	bl ov81_022431E0
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov81_02241840

	thumb_func_start ov81_0224185C
ov81_0224185C: @ 0x0224185C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r4, r0
	movs r1, #2
	bl FUN_0201D978
	movs r0, #5
	lsls r0, r0, #6
	adds r0, r4, r0
	movs r1, #2
	bl FUN_0201D978
	movs r0, #0x13
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #2
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0xf0
	movs r1, #2
	bl FUN_0201D978
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r4, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _0224197C @ =0x000F0E02
	lsls r5, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	lsrs r3, r5, #0x1f
	adds r0, #0xfe
	adds r3, r5, r3
	ldr r1, [r4, #0x1c]
	adds r0, r4, r0
	movs r2, #0x14
	asrs r3, r3, #1
	bl ov81_022430B4
	movs r0, #5
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _0224197C @ =0x000F0E02
	lsls r5, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #5
	lsrs r3, r5, #0x1f
	lsls r0, r0, #6
	adds r3, r5, r3
	ldr r1, [r4, #0x1c]
	adds r0, r4, r0
	movs r2, #0x15
	asrs r3, r3, #1
	bl ov81_022430B4
	movs r0, #0x13
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _0224197C @ =0x000F0E02
	lsls r5, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x13
	lsrs r3, r5, #0x1f
	lsls r0, r0, #4
	adds r3, r5, r3
	ldr r1, [r4, #0x1c]
	adds r0, r4, r0
	movs r2, #0x16
	asrs r3, r3, #1
	bl ov81_022430B4
	adds r0, r4, #0
	adds r0, #0xf0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _0224197C @ =0x000F0E02
	lsls r5, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	lsrs r3, r5, #0x1f
	adds r0, r4, #0
	adds r3, r5, r3
	ldr r1, [r4, #0x1c]
	adds r0, #0xf0
	movs r2, #0x13
	asrs r3, r3, #1
	bl ov81_022430B4
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #5
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x13
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	adds r4, #0xf0
	adds r0, r4, #0
	bl FUN_0201D8A0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224197C: .4byte 0x000F0E02
	thumb_func_end ov81_0224185C

	thumb_func_start ov81_02241980
ov81_02241980: @ 0x02241980
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	movs r1, #2
	bl ov81_022431E0
	movs r1, #0xf7
	lsls r1, r1, #2
	ldr r0, [r4, #0x4c]
	ldr r1, [r4, r1]
	movs r2, #1
	bl ov81_02243140
	movs r0, #0x15
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
	ldr r0, _022419DC @ =0x00000464
	movs r1, #6
	ldr r0, [r4, r0]
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #6
	bl ov81_0224141C
	ldr r0, _022419DC @ =0x00000464
	ldrb r2, [r4, #9]
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_022433FC
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov81_02242D88
	pop {r4, pc}
	nop
_022419DC: .4byte 0x00000464
	thumb_func_end ov81_02241980

	thumb_func_start ov81_022419E0
ov81_022419E0: @ 0x022419E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	movs r1, #1
	bl ov81_022431E0
	movs r1, #0xf7
	lsls r1, r1, #2
	ldr r0, [r4, #0x4c]
	ldr r1, [r4, r1]
	movs r2, #2
	bl ov81_02243140
	adds r0, r4, #0
	adds r0, #0xe0
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0xf0
	bl FUN_0201D5C8
	ldr r1, _02241A34 @ =0x00000464
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, _02241A34 @ =0x00000464
	ldrb r2, [r4, #9]
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_022433FC
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	pop {r4, pc}
	.align 2, 0
_02241A34: .4byte 0x00000464
	thumb_func_end ov81_022419E0

	thumb_func_start ov81_02241A38
ov81_02241A38: @ 0x02241A38
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02241A78 @ =0x00000464
	ldr r0, [r5, r0]
	bl FUN_02019F74
	movs r1, #0xf7
	lsls r1, r1, #2
	adds r4, r0, #0
	ldr r0, [r5, #0x4c]
	ldr r1, [r5, r1]
	movs r2, #2
	bl ov81_02243140
	adds r0, r5, #0
	adds r0, #0xe0
	bl FUN_0201D5C8
	adds r0, r5, #0
	adds r0, #0xf0
	bl FUN_0201D5C8
	cmp r4, #4
	blo _02241A74
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov81_02242D88
_02241A74:
	pop {r3, r4, r5, pc}
	nop
_02241A78: .4byte 0x00000464
	thumb_func_end ov81_02241A38

	thumb_func_start ov81_02241A7C
ov81_02241A7C: @ 0x02241A7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	movs r1, #2
	bl ov81_022431E0
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov81_02242D88
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov81_02241A7C

	thumb_func_start ov81_02241A98
ov81_02241A98: @ 0x02241A98
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x15
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #2
	bl FUN_0201D978
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #2
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0xe0
	movs r1, #2
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0xf0
	movs r1, #2
	bl FUN_0201D978
	movs r0, #0x15
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _02241BB4 @ =0x000F0E02
	lsls r5, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x15
	lsrs r3, r5, #0x1f
	lsls r0, r0, #4
	adds r3, r5, r3
	ldr r1, [r4, #0x1c]
	adds r0, r4, r0
	movs r2, #0x19
	asrs r3, r3, #1
	bl ov81_022430B4
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _02241BB4 @ =0x000F0E02
	lsls r5, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x16
	lsrs r3, r5, #0x1f
	lsls r0, r0, #4
	adds r3, r5, r3
	ldr r1, [r4, #0x1c]
	adds r0, r4, r0
	movs r2, #0x16
	asrs r3, r3, #1
	bl ov81_022430B4
	adds r0, r4, #0
	adds r0, #0xe0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _02241BB4 @ =0x000F0E02
	lsls r5, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	lsrs r3, r5, #0x1f
	adds r0, r4, #0
	adds r3, r5, r3
	ldr r1, [r4, #0x1c]
	adds r0, #0xe0
	movs r2, #0x17
	asrs r3, r3, #1
	bl ov81_022430B4
	adds r0, r4, #0
	adds r0, #0xf0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _02241BB4 @ =0x000F0E02
	lsls r5, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	lsrs r3, r5, #0x1f
	adds r0, r4, #0
	adds r3, r5, r3
	ldr r1, [r4, #0x1c]
	adds r0, #0xf0
	movs r2, #0x18
	asrs r3, r3, #1
	bl ov81_022430B4
	movs r0, #0x15
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	adds r0, r4, #0
	adds r0, #0xe0
	bl FUN_0201D8A0
	adds r4, #0xf0
	adds r0, r4, #0
	bl FUN_0201D8A0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02241BB4: .4byte 0x000F0E02
	thumb_func_end ov81_02241A98

	thumb_func_start ov81_02241BB8
ov81_02241BB8: @ 0x02241BB8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl FUN_0201660C
	str r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov81_02241BB8

	thumb_func_start ov81_02241BC8
ov81_02241BC8: @ 0x02241BC8
	ldr r3, _02241BCC @ =FUN_02016624
	bx r3
	.align 2, 0
_02241BCC: .4byte FUN_02016624
	thumb_func_end ov81_02241BC8

	thumb_func_start ov81_02241BD0
ov81_02241BD0: @ 0x02241BD0
	push {lr}
	sub sp, #0x14
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r1, #0xe
	lsls r1, r1, #6
	str r1, [sp, #8]
	movs r1, #0xe
	str r1, [sp, #0xc]
	movs r1, #0x19
	add r2, sp, #0
	strb r1, [r2, #0x10]
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
	movs r1, #0
	strb r1, [r2, #0x13]
	add r1, sp, #0
	bl FUN_020166FC
	add sp, #0x14
	pop {pc}
	thumb_func_end ov81_02241BD0

	thumb_func_start ov81_02241C0C
ov81_02241C0C: @ 0x02241C0C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _02241C80 @ =0x00000464
	ldr r0, [r4, r0]
	bl FUN_02019F74
	adds r2, r0, #0
	cmp r2, #6
	bhs _02241C7C
	ldrb r1, [r4, #0x11]
	movs r0, #0
	cmp r1, #0
	ble _02241C3E
	movs r3, #0xf2
	lsls r3, r3, #2
_02241C2A:
	lsls r5, r0, #1
	adds r5, r4, r5
	ldrh r5, [r5, r3]
	cmp r2, r5
	beq _02241C3E
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	blt _02241C2A
_02241C3E:
	cmp r1, #0
	beq _02241C5A
	cmp r0, r1
	beq _02241C5A
	lsls r0, r1, #2
	adds r1, r4, r0
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #6
	movs r2, #1
	bl FUN_020087A4
	b _02241C76
_02241C5A:
	adds r0, r4, #0
	movs r3, #0
	bl ov81_02241E68
	ldrb r0, [r4, #0x11]
	movs r2, #0
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #6
	bl FUN_020087A4
_02241C76:
	adds r0, r4, #0
	bl ov81_02241CEC
_02241C7C:
	pop {r3, r4, r5, pc}
	nop
_02241C80: .4byte 0x00000464
	thumb_func_end ov81_02241C0C

	thumb_func_start ov81_02241C84
ov81_02241C84: @ 0x02241C84
	cmp r1, #3
	bne _02241C90
	movs r1, #0x50
	muls r1, r0, r1
	adds r1, #0x30
	b _02241C96
_02241C90:
	movs r1, #0x70
	muls r1, r0, r1
	adds r1, #0x48
_02241C96:
	str r1, [r2]
	movs r0, #0x90
	str r0, [r3]
	bx lr
	.align 2, 0
	thumb_func_end ov81_02241C84

	thumb_func_start ov81_02241CA0
ov81_02241CA0: @ 0x02241CA0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _02241CE4 @ =0x00000464
	adds r4, r1, #0
	ldr r0, [r5, r0]
	adds r7, r2, #0
	bl FUN_02019F74
	cmp r0, #6
	bhs _02241CE2
	ldrb r2, [r5, #0x11]
	movs r1, #0
	cmp r2, #0
	ble _02241CD4
	movs r3, #0xf2
	lsls r3, r3, #2
_02241CC0:
	lsls r6, r1, #1
	adds r6, r5, r6
	ldrh r6, [r6, r3]
	cmp r0, r6
	beq _02241CD4
	adds r1, r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, r2
	blt _02241CC0
_02241CD4:
	adds r0, r1, #0
	ldr r1, _02241CE8 @ =0x0000047C
	adds r2, r4, #0
	ldr r1, [r5, r1]
	adds r3, r7, #0
	bl ov81_02241C84
_02241CE2:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02241CE4: .4byte 0x00000464
_02241CE8: .4byte 0x0000047C
	thumb_func_end ov81_02241CA0

	thumb_func_start ov81_02241CEC
ov81_02241CEC: @ 0x02241CEC
	push {r4, lr}
	sub sp, #8
	add r1, sp, #4
	add r2, sp, #0
	adds r4, r0, #0
	bl ov81_02241CA0
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242D94
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov81_02241CEC

	thumb_func_start ov81_02241D0C
ov81_02241D0C: @ 0x02241D0C
	push {r4, r5}
	ldr r1, _02241D34 @ =0x00000468
	movs r3, #0
	ldr r5, [r0, r1]
	adds r4, r0, #0
	subs r1, #0xa0
_02241D18:
	ldrh r2, [r4, r1]
	cmp r5, r2
	bne _02241D24
	adds r0, r3, #0
	pop {r4, r5}
	bx lr
_02241D24:
	adds r3, r3, #1
	adds r4, r4, #2
	cmp r3, #3
	blo _02241D18
	ldrb r0, [r0, #0x11]
	pop {r4, r5}
	bx lr
	nop
_02241D34: .4byte 0x00000468
	thumb_func_end ov81_02241D0C

	thumb_func_start ov81_02241D38
ov81_02241D38: @ 0x02241D38
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _02241D8C @ =0x00000464
	ldr r0, [r5, r0]
	bl FUN_02019F74
	adds r4, r0, #0
	cmp r4, #4
	bhs _02241D88
	cmp r4, #3
	bne _02241D60
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov81_02242D88
	add sp, #8
	pop {r3, r4, r5, pc}
_02241D60:
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov81_02242D88
	ldr r1, _02241D90 @ =0x0000047C
	adds r0, r4, #0
	ldr r1, [r5, r1]
	add r2, sp, #4
	add r3, sp, #0
	bl ov81_02241C84
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov81_02242D94
_02241D88:
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02241D8C: .4byte 0x00000464
_02241D90: .4byte 0x0000047C
	thumb_func_end ov81_02241D38

	thumb_func_start ov81_02241D94
ov81_02241D94: @ 0x02241D94
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02241DD8 @ =0x00000464
	ldr r0, [r5, r0]
	bl FUN_02019F74
	adds r4, r0, #0
	cmp r4, #6
	bhs _02241DD4
	cmp r4, #4
	blo _02241DB8
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov81_02242D88
	pop {r3, r4, r5, pc}
_02241DB8:
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov81_02242D88
	movs r1, #0xf2
	lsls r1, r1, #2
	ldrh r1, [r5, r1]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov81_02241EDC
_02241DD4:
	pop {r3, r4, r5, pc}
	nop
_02241DD8: .4byte 0x00000464
	thumb_func_end ov81_02241D94

	thumb_func_start ov81_02241DDC
ov81_02241DDC: @ 0x02241DDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r0, _02241E64 @ =0x0000047C
	str r1, [sp, #8]
	ldr r1, [r5, r0]
	cmp r1, #3
	bne _02241DF6
	movs r0, #0x30
	str r0, [sp, #0x10]
	movs r0, #0x50
	str r0, [sp, #0xc]
	b _02241DFE
_02241DF6:
	movs r0, #0x48
	str r0, [sp, #0x10]
	movs r0, #0x70
	str r0, [sp, #0xc]
_02241DFE:
	movs r4, #0
	cmp r1, #0
	bls _02241E5E
	str r4, [sp, #0x14]
	str r5, [sp, #0x18]
	adds r7, r5, #0
_02241E0A:
	movs r2, #0xf2
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r1, [sp, #0x18]
	lsls r2, r2, #2
	ldrh r1, [r1, r2]
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r2, r0, #0
	movs r0, #0x90
	str r0, [sp]
	ldr r0, [sp, #8]
	lsls r1, r4, #0x18
	str r0, [sp, #4]
	ldr r6, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r3, r6, r3
	bl ov81_02240F48
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r1, #6
	movs r2, #1
	bl FUN_020087A4
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	adds r4, r4, #1
	adds r0, r1, r0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	adds r7, r7, #4
	adds r0, r0, #2
	str r0, [sp, #0x18]
	ldr r0, _02241E64 @ =0x0000047C
	ldr r0, [r5, r0]
	cmp r4, r0
	blo _02241E0A
_02241E5E:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02241E64: .4byte 0x0000047C
	thumb_func_end ov81_02241DDC

	thumb_func_start ov81_02241E68
ov81_02241E68: @ 0x02241E68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r7, r2, #0
	adds r6, r3, #0
	bl FUN_02008780
	ldr r0, _02241ED8 @ =0x0000047C
	ldr r1, [r5, r0]
	cmp r1, #3
	bne _02241EB0
	subs r0, #0xbc
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_02074644
	movs r3, #0x50
	adds r2, r0, #0
	movs r0, #0x90
	str r0, [sp]
	lsls r1, r4, #0x18
	muls r3, r4, r3
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r3, #0x30
	str r6, [sp, #4]
	bl ov81_02240F48
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02241EB0:
	subs r0, #0xbc
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_02074644
	movs r3, #0x70
	adds r2, r0, #0
	movs r0, #0x90
	str r0, [sp]
	lsls r1, r4, #0x18
	muls r3, r4, r3
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r3, #0x48
	str r6, [sp, #4]
	bl ov81_02240F48
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02241ED8: .4byte 0x0000047C
	thumb_func_end ov81_02241E68

	thumb_func_start ov81_02241EDC
ov81_02241EDC: @ 0x02241EDC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r7, r2, #0
	adds r6, r3, #0
	bl FUN_02008780
	ldr r0, _02241F4C @ =0x0000047C
	ldr r1, [r5, r0]
	cmp r1, #3
	bne _02241F24
	subs r0, #0xb8
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_02074644
	movs r3, #0x50
	adds r2, r0, #0
	movs r0, #0x90
	str r0, [sp]
	lsls r1, r4, #0x18
	muls r3, r4, r3
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r3, #0x30
	str r6, [sp, #4]
	bl ov81_02240F48
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02241F24:
	subs r0, #0xb8
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_02074644
	movs r3, #0x70
	adds r2, r0, #0
	movs r0, #0x90
	str r0, [sp]
	lsls r1, r4, #0x18
	muls r3, r4, r3
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r3, #0x48
	str r6, [sp, #4]
	bl ov81_02240F48
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02241F4C: .4byte 0x0000047C
	thumb_func_end ov81_02241EDC

	thumb_func_start ov81_02241F50
ov81_02241F50: @ 0x02241F50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r0, _02241FBC @ =0x0000047C
	ldr r1, [r7, r0]
	cmp r1, #3
	bne _02241F68
	movs r0, #0x30
	str r0, [sp, #0x10]
	movs r0, #0x50
	str r0, [sp, #0xc]
	b _02241F70
_02241F68:
	movs r0, #0x48
	str r0, [sp, #0x10]
	movs r0, #0x70
	str r0, [sp, #0xc]
_02241F70:
	movs r4, #0
	cmp r1, #0
	bls _02241FB8
	adds r6, r4, #0
	adds r5, r7, #0
_02241F7A:
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	movs r1, #1
	adds r0, r0, r6
	str r0, [sp, #4]
	movs r0, #0x90
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r7, r0
	movs r2, #3
	adds r3, r1, #0
	bl ov81_02242CBC
	movs r1, #0xe7
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov81_02242D88
	ldr r0, [sp, #0xc]
	adds r4, r4, #1
	adds r6, r6, r0
	ldr r0, _02241FBC @ =0x0000047C
	adds r5, r5, #4
	ldr r0, [r7, r0]
	cmp r4, r0
	blo _02241F7A
_02241FB8:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02241FBC: .4byte 0x0000047C
	thumb_func_end ov81_02241F50

	thumb_func_start ov81_02241FC0
ov81_02241FC0: @ 0x02241FC0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _02241FE8 @ =0x0000047C
	movs r4, #0
	ldr r0, [r6, r0]
	cmp r0, #0
	bls _02241FE6
	ldr r7, _02241FE8 @ =0x0000047C
	adds r5, r6, #0
_02241FD2:
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov81_02242D74
	ldr r0, [r6, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r0
	blo _02241FD2
_02241FE6:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02241FE8: .4byte 0x0000047C
	thumb_func_end ov81_02241FC0

	thumb_func_start ov81_02241FEC
ov81_02241FEC: @ 0x02241FEC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _02242054 @ =0x0000047C
	movs r4, #0
	ldr r0, [r6, r0]
	cmp r0, #0
	bls _02242052
	movs r7, #0xe7
	adds r5, r6, #0
	lsls r7, r7, #2
_02242000:
	ldrb r0, [r6, #0x11]
	cmp r4, r0
	bne _0224201C
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl ov81_02242DFC
	ldr r0, [r5, r7]
	movs r1, #1
	bl ov81_02242D88
	b _02242046
_0224201C:
	cmp r4, r0
	bhs _0224203A
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #2
	bl ov81_02242DFC
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov81_02242D88
	b _02242046
_0224203A:
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov81_02242D88
_02242046:
	ldr r0, _02242054 @ =0x0000047C
	adds r4, r4, #1
	ldr r0, [r6, r0]
	adds r5, r5, #4
	cmp r4, r0
	blo _02242000
_02242052:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02242054: .4byte 0x0000047C
	thumb_func_end ov81_02241FEC

	thumb_func_start ov81_02242058
ov81_02242058: @ 0x02242058
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _022420AC @ =0x0000047C
	adds r7, r1, #0
	ldr r0, [r6, r0]
	movs r4, #0
	cmp r0, #0
	bls _022420A8
	adds r5, r6, #0
_0224206A:
	ldr r0, _022420B0 @ =0x00000468
	ldr r0, [r6, r0]
	cmp r4, r0
	bne _02242084
	cmp r7, #1
	bne _02242084
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl ov81_02242DFC
	b _02242090
_02242084:
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #2
	bl ov81_02242DFC
_02242090:
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov81_02242D88
	ldr r0, _022420AC @ =0x0000047C
	adds r4, r4, #1
	ldr r0, [r6, r0]
	adds r5, r5, #4
	cmp r4, r0
	blo _0224206A
_022420A8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022420AC: .4byte 0x0000047C
_022420B0: .4byte 0x00000468
	thumb_func_end ov81_02242058

	thumb_func_start ov81_022420B4
ov81_022420B4: @ 0x022420B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0224216C @ =0x0000047C
	ldr r0, [r5, r0]
	cmp r0, #3
	bne _022420CA
	movs r0, #0x50
	movs r7, #0x10
	str r0, [sp, #0xc]
	b _022420D0
_022420CA:
	movs r0, #0x70
	movs r7, #0x28
	str r0, [sp, #0xc]
_022420D0:
	movs r6, #0
	adds r4, r6, #0
_022420D4:
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0xc]
	adds r2, r6, #0
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r7, r1
	str r0, [sp, #4]
	movs r0, #0xb0
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #2
	movs r3, #0
	bl ov81_02242CBC
	lsls r1, r4, #2
	adds r2, r5, r1
	movs r1, #0xea
	lsls r1, r1, #2
	str r0, [r2, r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	blo _022420D4
	adds r0, r1, #0
	adds r0, #0xd4
	ldr r1, [r5, r0]
	cmp r1, #2
	bne _02242124
	subs r0, #0xcc
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov81_02242D88
_02242124:
	movs r6, #0
	cmp r4, #6
	bhs _02242166
_0224212A:
	lsls r0, r4, #2
	adds r7, r5, r0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #3
	adds r2, r6, #0
	movs r3, #0
	bl ov81_02242D18
	movs r1, #0xea
	lsls r1, r1, #2
	str r0, [r7, r1]
	adds r0, r1, #0
	ldr r0, [r7, r0]
	movs r1, #0
	bl ov81_02242D88
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #6
	blo _0224212A
_02242166:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224216C: .4byte 0x0000047C
	thumb_func_end ov81_022420B4

	thumb_func_start ov81_02242170
ov81_02242170: @ 0x02242170
	push {r4, r5, r6, lr}
	movs r6, #0xea
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_0224217A:
	ldr r0, [r5, r6]
	bl ov81_02242D74
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blo _0224217A
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov81_02242170

	thumb_func_start ov81_0224218C
ov81_0224218C: @ 0x0224218C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r7, #0xea
	adds r5, r0, #0
	movs r4, #3
	lsls r7, r7, #2
_02242198:
	subs r0, r4, #3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrb r0, [r5, #0x11]
	cmp r1, r0
	bhs _022421F8
	lsls r0, r1, #1
	adds r1, r5, r0
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r0, [r1, r0]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov81_02242F30
	adds r6, r0, #0
	add r3, sp, #0
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	movs r0, #1
	ldr r1, [sp]
	lsls r0, r0, #0xe
	subs r0, r1, r0
	str r0, [sp]
	movs r0, #1
	ldr r1, [sp, #4]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #4]
	lsls r0, r4, #2
	adds r6, r5, r0
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	adds r1, r2, #0
	bl ov81_02242DCC
	ldr r0, [r6, r7]
	movs r1, #1
	bl ov81_02242D88
	b _02242208
_022421F8:
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl ov81_02242D88
_02242208:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #6
	blo _02242198
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov81_0224218C

	thumb_func_start ov81_02242218
ov81_02242218: @ 0x02242218
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r2, #0
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r6, r3
	bhs _022422FA
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #5
	movs r2, #0
	str r0, [sp, #0x1c]
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [sp, #0x1c]
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	ldr r2, [sp, #0x18]
	adds r0, r7, #0
	movs r1, #0
	bl FUN_020741BC
	adds r1, r0, #0
	movs r0, #0x64
	str r0, [sp]
	movs r0, #0x14
	movs r2, #0
	add r3, sp, #0x24
	bl FUN_020079BC
	str r0, [sp, #0x20]
	movs r0, #0x12
	lsls r0, r0, #6
	ldr r1, [r5, r0]
	movs r2, #2
	lsls r1, r1, #2
	adds r1, r5, r1
	subs r0, #0xec
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x24]
	lsls r2, r2, #8
	ldr r1, [r1, #0x14]
	movs r3, #2
	bl ov81_02242E14
	ldr r0, [sp, #0x20]
	bl FUN_0201AB0C
	ldr r1, [sp, #0x18]
	adds r0, r7, #0
	movs r2, #0
	bl FUN_02074364
	adds r1, r0, #0
	movs r0, #0x12
	lsls r0, r0, #6
	ldr r2, [r5, r0]
	subs r0, #0xec
	lsls r2, r2, #2
	adds r2, r5, r2
	ldr r0, [r2, r0]
	bl ov81_02242E08
	movs r0, #0x12
	lsls r0, r0, #6
	ldr r1, [r5, r0]
	subs r0, #0xec
	lsls r1, r1, #2
	adds r1, r5, r1
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov81_02242D88
	movs r1, #0x12
	lsls r1, r1, #6
	ldr r2, [r5, r1]
	movs r0, #1
	eors r0, r2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	subs r1, #0xec
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, r1]
	movs r1, #0
	bl ov81_02242D88
	movs r1, #0
	lsls r2, r6, #0x18
	str r1, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	str r1, [sp, #0x10]
	adds r5, #0xd0
	adds r1, r5, #0
	lsrs r2, r2, #0x18
	movs r3, #4
	str r4, [sp, #0x14]
	bl ov81_022409B0
_022422FA:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov81_02242218

	thumb_func_start ov81_02242300
ov81_02242300: @ 0x02242300
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r6, r2
	bhs _022423C8
	movs r4, #0
	str r4, [sp, #0x18]
	ldrb r0, [r5, #0x11]
	cmp r0, #0
	ble _02242364
	adds r7, r5, #0
	adds r7, #0x50
_0224231A:
	lsls r0, r4, #1
	adds r1, r5, r0
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r2, [r1, r0]
	cmp r6, r2
	bne _0224232C
	movs r0, #1
	str r0, [sp, #0x18]
_0224232C:
	movs r0, #0
	str r0, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r1, r4, #2
	lsls r1, r1, #4
	lsls r2, r2, #0x18
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r7, r1
	lsrs r2, r2, #0x18
	movs r3, #4
	bl ov81_022409B0
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r0, [r5, #0x11]
	cmp r4, r0
	blt _0224231A
_02242364:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0224239C
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf
	str r1, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	lsls r0, r1, #6
	adds r2, r5, #0
	adds r1, r4, #2
	ldr r0, [r5, r0]
	adds r2, #0x50
	lsls r1, r1, #4
	adds r1, r2, r1
	lsls r2, r6, #0x18
	str r0, [sp, #0x14]
	adds r0, r5, #0
	lsrs r2, r2, #0x18
	movs r3, #4
	bl ov81_022409B0
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0224239C:
	ldr r0, _022423CC @ =0x0000047C
	ldr r0, [r5, r0]
	cmp r4, r0
	bhs _022423C8
	adds r6, r5, #0
	adds r6, #0x50
_022423A8:
	adds r0, r4, #2
	lsls r7, r0, #4
	adds r0, r6, r7
	movs r1, #0
	bl FUN_0201D978
	adds r0, r6, r7
	bl FUN_0201D5C8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _022423CC @ =0x0000047C
	ldr r0, [r5, r0]
	cmp r4, r0
	blo _022423A8
_022423C8:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022423CC: .4byte 0x0000047C
	thumb_func_end ov81_02242300

	thumb_func_start ov81_022423D0
ov81_022423D0: @ 0x022423D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, _0224241C @ =0x0000047C
	adds r7, r1, #0
	ldr r0, [r5, r0]
	movs r4, #0
	cmp r0, #0
	bls _02242416
	adds r6, r5, #0
	adds r6, #0x50
_022423E6:
	movs r0, #0
	str r0, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r4, #2
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsls r1, r1, #4
	lsls r2, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, r1
	lsrs r2, r2, #0x18
	movs r3, #4
	str r7, [sp, #0x14]
	bl ov81_022409B0
	ldr r0, _0224241C @ =0x0000047C
	adds r4, r4, #1
	ldr r0, [r5, r0]
	cmp r4, r0
	blo _022423E6
_02242416:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224241C: .4byte 0x0000047C
	thumb_func_end ov81_022423D0

	thumb_func_start ov81_02242420
ov81_02242420: @ 0x02242420
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, _022424A8 @ =0x0000047C
	movs r4, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	bls _022424A4
	adds r6, r5, #0
	lsls r0, r1, #0x18
	adds r6, #0x50
	lsrs r7, r0, #0x18
_02242438:
	movs r0, #0xf2
	lsls r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, r4
	bne _0224246E
	movs r0, #0
	str r0, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #2
	lsls r1, r1, #4
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r6, r1
	adds r2, r7, #0
	movs r3, #4
	bl ov81_022409B0
	b _0224249A
_0224246E:
	movs r0, #0
	str r0, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r1, r4, #2
	lsls r1, r1, #4
	lsls r2, r4, #0x18
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r6, r1
	lsrs r2, r2, #0x18
	movs r3, #4
	bl ov81_022409B0
_0224249A:
	ldr r0, _022424A8 @ =0x0000047C
	adds r4, r4, #1
	ldr r0, [r5, r0]
	cmp r4, r0
	blo _02242438
_022424A4:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022424A8: .4byte 0x0000047C
	thumb_func_end ov81_02242420

	thumb_func_start ov81_022424AC
ov81_022424AC: @ 0x022424AC
	push {r4, r5, r6, lr}
	sub sp, #0x18
	movs r6, #0xf2
	lsls r6, r6, #2
	adds r2, r1, #0
	ldrh r1, [r0, r6]
	adds r1, r1, #2
	cmp r2, #4
	blo _022424CC
	adds r0, #0x50
	lsls r1, r1, #4
	adds r0, r0, r1
	bl FUN_0201D8E4
	add sp, #0x18
	pop {r4, r5, r6, pc}
_022424CC:
	lsls r4, r1, #4
	movs r1, #0
	str r1, [sp]
	movs r3, #0xf
	str r3, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	subs r1, r6, #4
	adds r5, r0, #0
	ldr r1, [r0, r1]
	lsls r2, r2, #0x18
	adds r5, #0x50
	str r1, [sp, #0x14]
	adds r1, r5, r4
	lsrs r2, r2, #0x18
	movs r3, #4
	bl ov81_022409B0
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov81_022424AC

	thumb_func_start ov81_02242500
ov81_02242500: @ 0x02242500
	push {r3, lr}
	movs r1, #0x1a
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	movs r1, #2
	movs r2, #0
	lsls r3, r1, #8
	bl FUN_020032A4
	pop {r3, pc}
	thumb_func_end ov81_02242500

	thumb_func_start ov81_02242514
ov81_02242514: @ 0x02242514
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02242580
	ldr r1, _02242584 @ =0x00000478
	ldr r1, [r4, r1]
	cmp r1, #0xff
	beq _02242580
	bl FUN_02003B44
	cmp r0, #0
	bne _02242580
	ldr r0, _02242584 @ =0x00000478
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0224255A
	movs r0, #0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, _02242588 @ =0x0000FFFF
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r2, #8
	movs r3, #2
	bl FUN_02003370
	b _02242576
_0224255A:
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _02242588 @ =0x0000FFFF
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r2, #8
	movs r3, #2
	bl FUN_02003370
_02242576:
	ldr r1, _02242584 @ =0x00000478
	movs r0, #1
	ldr r2, [r4, r1]
	eors r0, r2
	str r0, [r4, r1]
_02242580:
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_02242584: .4byte 0x00000478
_02242588: .4byte 0x0000FFFF
	thumb_func_end ov81_02242514

	thumb_func_start ov81_0224258C
ov81_0224258C: @ 0x0224258C
	push {r3, r4}
	ldr r4, _022425BC @ =0x00000484
	strb r1, [r0, r4]
	adds r1, r4, #1
	strb r2, [r0, r1]
	ldr r2, _022425C0 @ =0xFFFFFFF8
	adds r1, r4, #2
	strb r3, [r0, r1]
	add r2, sp
	ldrb r3, [r2, #0x10]
	adds r1, r4, #3
	strb r3, [r0, r1]
	ldrb r2, [r2, #0x14]
	adds r1, r4, #7
	strb r2, [r0, r1]
	movs r2, #0
	adds r1, r4, #4
	strb r2, [r0, r1]
	adds r1, r4, #5
	strb r2, [r0, r1]
	adds r1, r4, #6
	strb r2, [r0, r1]
	pop {r3, r4}
	bx lr
	.align 2, 0
_022425BC: .4byte 0x00000484
_022425C0: .4byte 0xFFFFFFF8
	thumb_func_end ov81_0224258C

	thumb_func_start ov81_022425C4
ov81_022425C4: @ 0x022425C4
	push {r4, lr}
	sub sp, #8
	movs r4, #2
	str r4, [sp]
	str r3, [sp, #4]
	movs r3, #0xc
	bl ov81_0224258C
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov81_022425C4

	thumb_func_start ov81_022425D8
ov81_022425D8: @ 0x022425D8
	push {r4, lr}
	sub sp, #8
	movs r4, #2
	str r4, [sp]
	str r3, [sp, #4]
	movs r3, #7
	bl ov81_0224258C
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov81_022425D8

	thumb_func_start ov81_022425EC
ov81_022425EC: @ 0x022425EC
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r3, _0224268C @ =0x00000489
	adds r4, r0, #0
	ldrb r0, [r4, r3]
	cmp r0, #0
	bne _02242656
	adds r0, r3, #1
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _02242624
	subs r0, r3, #3
	ldrb r0, [r4, r0]
	subs r2, r3, #5
	movs r1, #5
	str r0, [sp]
	subs r0, r3, #2
	ldrb r0, [r4, r0]
	subs r3, r3, #4
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	ldr r0, [r4, #0x4c]
	bl FUN_0201CA4C
	b _02242644
_02242624:
	subs r0, r3, #3
	ldrb r0, [r4, r0]
	subs r2, r3, #5
	movs r1, #5
	str r0, [sp]
	subs r0, r3, #2
	ldrb r0, [r4, r0]
	subs r3, r3, #4
	str r0, [sp, #4]
	movs r0, #9
	str r0, [sp, #8]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	ldr r0, [r4, #0x4c]
	bl FUN_0201CA4C
_02242644:
	ldr r0, [r4, #0x4c]
	movs r1, #5
	bl FUN_0201EFBC
	ldr r1, _02242690 @ =0x0000048A
	movs r0, #1
	ldrb r2, [r4, r1]
	eors r0, r2
	strb r0, [r4, r1]
_02242656:
	ldr r1, _0224268C @ =0x00000489
	ldrb r0, [r4, r1]
	adds r0, r0, #1
	strb r0, [r4, r1]
	ldrb r0, [r4, r1]
	cmp r0, #2
	bne _02242684
	subs r0, r1, #1
	ldrb r0, [r4, r0]
	adds r2, r0, #1
	subs r0, r1, #1
	strb r2, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #4
	bne _02242680
	adds r0, r1, #2
	ldrb r0, [r4, r0]
	add sp, #0xc
	strb r0, [r4, #8]
	movs r0, #0
	pop {r3, r4, pc}
_02242680:
	movs r0, #0
	strb r0, [r4, r1]
_02242684:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0224268C: .4byte 0x00000489
_02242690: .4byte 0x0000048A
	thumb_func_end ov81_022425EC

	thumb_func_start ov81_02242694
ov81_02242694: @ 0x02242694
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	cmp r1, #1
	bne _022426D2
	movs r0, #0xa
	str r0, [sp]
	ldr r0, _022426FC @ =0x04001050
	movs r1, #0
	movs r2, #0xf
	movs r3, #6
	blx FUN_020CF15C
	ldrb r0, [r5, #0x12]
	movs r6, #0
	cmp r0, #0
	bls _022426FA
	movs r7, #0x36
	adds r4, r5, #0
	lsls r7, r7, #4
_022426BA:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _022426C6
	movs r1, #1
	bl ov81_02242FBC
_022426C6:
	ldrb r0, [r5, #0x12]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blo _022426BA
	pop {r3, r4, r5, r6, r7, pc}
_022426D2:
	ldr r0, _02242700 @ =0x04000050
	movs r6, #0
	strh r6, [r0]
	ldrb r0, [r5, #0x12]
	cmp r0, #0
	bls _022426FA
	movs r7, #0x36
	adds r4, r5, #0
	lsls r7, r7, #4
_022426E4:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _022426F0
	movs r1, #0
	bl ov81_02242FBC
_022426F0:
	ldrb r0, [r5, #0x12]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blo _022426E4
_022426FA:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022426FC: .4byte 0x04001050
_02242700: .4byte 0x04000050
	thumb_func_end ov81_02242694

	thumb_func_start ov81_02242704
ov81_02242704: @ 0x02242704
	ldr r3, _0224270C @ =FUN_02237254
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx r3
	.align 2, 0
_0224270C: .4byte FUN_02237254
	thumb_func_end ov81_02242704

	thumb_func_start ov81_02242710
ov81_02242710: @ 0x02242710
	ldr r3, _02242718 @ =FUN_02237254
	ldrb r0, [r0, #9]
	bx r3
	nop
_02242718: .4byte FUN_02237254
	thumb_func_end ov81_02242710

	thumb_func_start ov81_0224271C
ov81_0224271C: @ 0x0224271C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	movs r1, #2
	movs r2, #1
	movs r3, #0x64
	bl FUN_0201956C
	ldr r1, _02242758 @ =0x00000474
	movs r2, #4
	str r0, [r4, r1]
	str r2, [sp]
	ldr r0, [r4, r1]
	movs r1, #0
	movs r3, #0x12
	bl FUN_020195F4
	movs r0, #1
	ldr r2, _02242758 @ =0x00000474
	str r0, [sp]
	ldr r0, [r4, r2]
	subs r2, #0x98
	ldr r2, [r4, r2]
	movs r1, #0
	movs r3, #0x90
	bl FUN_020196B8
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02242758: .4byte 0x00000474
	thumb_func_end ov81_0224271C

	thumb_func_start ov81_0224275C
ov81_0224275C: @ 0x0224275C
	ldr r1, _02242764 @ =0x00000474
	ldr r3, _02242768 @ =FUN_020195C0
	ldr r0, [r0, r1]
	bx r3
	.align 2, 0
_02242764: .4byte 0x00000474
_02242768: .4byte FUN_020195C0
	thumb_func_end ov81_0224275C

	thumb_func_start ov81_0224276C
ov81_0224276C: @ 0x0224276C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl ov81_02242B90
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x64
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	movs r0, #0x20
	adds r1, r5, #4
	movs r2, #0x64
	bl FUN_02009F40
	movs r2, #2
	str r0, [r5]
	adds r0, r5, #4
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	ldr r4, _02242A88 @ =0x02243594
	movs r7, #0
	adds r6, r5, #0
_022427B0:
	ldrb r0, [r4]
	adds r1, r7, #0
	movs r2, #0x64
	bl FUN_0200A090
	movs r1, #0x4b
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r7, r7, #1
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r7, #4
	blt _022427B0
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xc8
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x28
	bl FUN_0200A1D8
	movs r1, #0x53
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x64
	str r0, [sp, #0xc]
	adds r0, #0xcc
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x3e
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x15
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r3, #1
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xd0
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x29
	bl FUN_0200A294
	movs r1, #0x55
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r3, #1
	str r3, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xd4
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x2a
	bl FUN_0200A294
	movs r1, #0x56
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	movs r3, #1
	str r3, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xc8
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x2b
	bl FUN_0200A1D8
	movs r1, #0x57
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x64
	str r0, [sp, #0xc]
	adds r0, #0xcc
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x3f
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x16
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xd0
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x2c
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xd4
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x2d
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x5a
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r2, #0
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xc8
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r3, #1
	bl FUN_0200A1D8
	movs r1, #0x4f
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r3, #0
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	movs r0, #0x64
	str r0, [sp, #0xc]
	adds r0, #0xcc
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x34
	bl FUN_0200A234
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	movs r2, #2
	str r2, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xd0
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xd4
	movs r2, #1
	ldr r0, [r5, r0]
	movs r1, #0xb8
	adds r3, r2, #0
	bl FUN_0200A294
	movs r1, #0x52
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xc8
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x2b
	movs r3, #1
	bl FUN_0200A1D8
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x64
	str r0, [sp, #0xc]
	adds r0, #0xcc
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x3f
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xd0
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x2c
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x5d
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xd4
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x2d
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r4, #0
	adds r6, r5, #0
	movs r7, #2
_022429C8:
	adds r0, r4, #4
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xc8
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x2e
	movs r3, #1
	bl FUN_0200A1D8
	movs r1, #0x5f
	lsls r1, r1, #2
	str r0, [r6, r1]
	bl FUN_02074490
	adds r2, r0, #0
	adds r0, r4, #4
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0x64
	str r0, [sp, #0xc]
	adds r0, #0xcc
	ldr r0, [r5, r0]
	movs r1, #0x14
	movs r3, #0
	bl FUN_0200A234
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r6, r1]
	adds r0, r4, #4
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xd0
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x2f
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x61
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r0, r4, #4
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	adds r0, #0xd4
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x30
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r4, r4, #1
	adds r6, #0x10
	cmp r4, #2
	blt _022429C8
	adds r7, r1, #0
	adds r6, r1, #0
	movs r4, #0
	subs r7, #0x4c
	subs r6, #0x48
_02242A60:
	ldr r0, [r5, r7]
	bl FUN_0200ACF0
	ldr r0, [r5, r6]
	bl FUN_0200AF94
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #6
	blt _02242A60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02242A88: .4byte 0x02243594
	thumb_func_end ov81_0224276C

	thumb_func_start ov81_02242A8C
ov81_02242A8C: @ 0x02242A8C
	push {r4, r5, r6, lr}
	sub sp, #0x80
	adds r5, r0, #0
	movs r0, #0
	str r1, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	adds r4, r3, #0
	str r0, [sp, #8]
	movs r3, #0
	ldr r0, [sp, #0x90]
	str r3, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0x4b
	lsls r0, r0, #2
	adds r6, r2, #0
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
	adds r2, r1, #0
	str r0, [sp, #0x20]
	str r3, [sp, #0x24]
	str r3, [sp, #0x28]
	add r0, sp, #0x5c
	adds r3, r1, #0
	bl FUN_02009D48
	ldr r0, [r5]
	movs r1, #0
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r1, [r0, #0x20]
	str r4, [sp, #0x50]
	add r0, sp, #0x80
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _02242B00
	movs r0, #1
	str r0, [sp, #0x54]
	b _02242B04
_02242B00:
	movs r0, #2
	str r0, [sp, #0x54]
_02242B04:
	movs r0, #0x64
	str r0, [sp, #0x58]
	add r0, sp, #0x80
	ldrb r0, [r0, #0x14]
	cmp r0, #1
	bne _02242B1A
	movs r0, #2
	ldr r1, [sp, #0x38]
	lsls r0, r0, #0x14
	adds r0, r1, r0
	str r0, [sp, #0x38]
_02242B1A:
	add r0, sp, #0x2c
	bl FUN_02024624
	adds r4, r0, #0
	movs r1, #1
	bl FUN_0202484C
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020248F0
	adds r0, r4, #0
	add sp, #0x80
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov81_02242A8C

	thumb_func_start ov81_02242B38
ov81_02242B38: @ 0x02242B38
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #5
	adds r5, r0, #0
	movs r4, #0
	lsls r7, r7, #6
_02242B42:
	lsls r0, r4, #4
	adds r6, r5, r0
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	ldr r0, [r6, r7]
	bl FUN_0200B0A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	blo _02242B42
	movs r6, #0x4b
	movs r4, #0
	lsls r6, r6, #2
_02242B66:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_0200A0D0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _02242B66
	ldr r0, [r5]
	bl FUN_02024504
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov81_02242B38

	thumb_func_start ov81_02242B90
ov81_02242B90: @ 0x02242B90
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _02242BC0 @ =0x02243598
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r1, _02242BC4 @ =0x00100010
	adds r0, r2, #0
	adds r2, r1, #0
	bl FUN_020215C0
	movs r0, #8
	movs r1, #0x64
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_02242BC0: .4byte 0x02243598
_02242BC4: .4byte 0x00100010
	thumb_func_end ov81_02242B90

	thumb_func_start ov81_02242BC8
ov81_02242BC8: @ 0x02242BC8
	push {r3, lr}
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r0, _02242C30 @ =0x04000008
	movs r1, #3
	ldrh r2, [r0]
	bics r2, r1
	strh r2, [r0]
	adds r0, #0x58
	ldrh r2, [r0]
	ldr r1, _02242C34 @ =0xFFFFCFFD
	ands r2, r1
	strh r2, [r0]
	adds r2, r1, #2
	ldrh r3, [r0]
	adds r1, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _02242C38 @ =0x0000CFFB
	ands r3, r2
	strh r3, [r0]
	ldrh r3, [r0]
	subs r2, #0x1c
	ands r3, r1
	movs r1, #8
	orrs r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	ands r1, r2
	strh r1, [r0]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	blx FUN_020CF82C
	movs r0, #0
	ldr r2, _02242C3C @ =0x00007FFF
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r1, _02242C40 @ =0xBFFF0000
	ldr r0, _02242C44 @ =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_02242C30: .4byte 0x04000008
_02242C34: .4byte 0xFFFFCFFD
_02242C38: .4byte 0x0000CFFB
_02242C3C: .4byte 0x00007FFF
_02242C40: .4byte 0xBFFF0000
_02242C44: .4byte 0x04000580
	thumb_func_end ov81_02242BC8

	thumb_func_start ov81_02242C48
ov81_02242C48: @ 0x02242C48
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02026E48
	ldr r2, _02242C78 @ =0x04000440
	movs r3, #0
	adds r1, r2, #0
	str r3, [r2]
	adds r1, #0x14
	str r3, [r1]
	movs r0, #2
	str r0, [r2]
	str r3, [r1]
	blx FUN_020BEF98
	blx FUN_020B7350
	adds r0, r4, #0
	bl FUN_02008120
	ldr r0, _02242C7C @ =0x04000540
	movs r1, #1
	str r1, [r0]
	pop {r4, pc}
	.align 2, 0
_02242C78: .4byte 0x04000440
_02242C7C: .4byte 0x04000540
	thumb_func_end ov81_02242C48

	thumb_func_start ov81_02242C80
ov81_02242C80: @ 0x02242C80
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	add r0, sp, #0x10
	movs r2, #2
	adds r6, r3, #0
	bl FUN_02070124
	ldr r0, [sp, #0x34]
	ldr r3, [sp, #0x30]
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r5, #0
	add r1, sp, #0x10
	adds r2, r6, #0
	bl FUN_020085EC
	add sp, #0x20
	pop {r4, r5, r6, pc}
	thumb_func_end ov81_02242C80

	thumb_func_start ov81_02242CB0
ov81_02242CB0: @ 0x02242CB0
	ldr r3, _02242CB8 @ =FUN_020087A4
	adds r2, r1, #0
	movs r1, #0x23
	bx r3
	.align 2, 0
_02242CB8: .4byte FUN_020087A4
	thumb_func_end ov81_02242CB0

	thumb_func_start ov81_02242CBC
ov81_02242CBC: @ 0x02242CBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	movs r0, #0x64
	movs r1, #0xc
	str r2, [sp, #8]
	adds r5, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	strb r1, [r4]
	strb r1, [r4, #1]
	strb r1, [r4, #2]
	strb r1, [r4, #3]
	strb r1, [r4, #4]
	strb r1, [r4, #5]
	strb r1, [r4, #6]
	strb r1, [r4, #7]
	strb r1, [r4, #8]
	strb r1, [r4, #9]
	strb r1, [r4, #0xa]
	ldr r0, [sp, #0x24]
	strb r1, [r4, #0xb]
	str r0, [r4]
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #8]
	str r0, [r4, #4]
	str r5, [sp]
	str r1, [sp, #4]
	ldr r3, [sp, #0x20]
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov81_02242A8C
	str r0, [r4, #8]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	adds r0, r4, #0
	bl ov81_02242D94
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov81_02242CBC

	thumb_func_start ov81_02242D18
ov81_02242D18: @ 0x02242D18
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	movs r0, #0x64
	movs r1, #0xc
	str r2, [sp, #8]
	adds r5, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	strb r0, [r4, #4]
	strb r0, [r4, #5]
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xb]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #8]
	str r0, [r4]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x20]
	str r0, [r4, #4]
	str r5, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov81_02242A8C
	str r0, [r4, #8]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	adds r0, r4, #0
	bl ov81_02242DAC
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov81_02242D18

	thumb_func_start ov81_02242D74
ov81_02242D74: @ 0x02242D74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02024758
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov81_02242D74

	thumb_func_start ov81_02242D88
ov81_02242D88: @ 0x02242D88
	ldr r3, _02242D90 @ =FUN_02024830
	ldr r0, [r0, #8]
	bx r3
	nop
_02242D90: .4byte FUN_02024830
	thumb_func_end ov81_02242D88

	thumb_func_start ov81_02242D94
ov81_02242D94: @ 0x02242D94
	push {lr}
	sub sp, #0xc
	lsls r1, r1, #0xc
	str r1, [sp]
	lsls r1, r2, #0xc
	str r1, [sp, #4]
	ldr r0, [r0, #8]
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {pc}
	thumb_func_end ov81_02242D94

	thumb_func_start ov81_02242DAC
ov81_02242DAC: @ 0x02242DAC
	push {lr}
	sub sp, #0xc
	lsls r1, r1, #0xc
	str r1, [sp]
	movs r1, #2
	lsls r2, r2, #0xc
	lsls r1, r1, #0x14
	adds r1, r2, r1
	str r1, [sp, #4]
	ldr r0, [r0, #8]
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov81_02242DAC

	thumb_func_start ov81_02242DCC
ov81_02242DCC: @ 0x02242DCC
	ldr r3, _02242DD4 @ =FUN_020247D4
	ldr r0, [r0, #8]
	bx r3
	nop
_02242DD4: .4byte FUN_020247D4
	thumb_func_end ov81_02242DCC

	thumb_func_start ov81_02242DD8
ov81_02242DD8: @ 0x02242DD8
	ldr r3, _02242DE0 @ =FUN_02024B68
	ldr r0, [r0, #8]
	bx r3
	nop
_02242DE0: .4byte FUN_02024B68
	thumb_func_end ov81_02242DD8

	thumb_func_start ov81_02242DE4
ov81_02242DE4: @ 0x02242DE4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	adds r4, r1, #0
	movs r1, #0
	bl FUN_020249D4
	ldr r0, [r5, #8]
	adds r1, r4, #0
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_02242DE4

	thumb_func_start ov81_02242DFC
ov81_02242DFC: @ 0x02242DFC
	ldr r3, _02242E04 @ =FUN_02024A14
	ldr r0, [r0, #8]
	bx r3
	nop
_02242E04: .4byte FUN_02024A14
	thumb_func_end ov81_02242DFC

	thumb_func_start ov81_02242E08
ov81_02242E08: @ 0x02242E08
	ldr r3, _02242E10 @ =FUN_02024A48
	ldr r0, [r0, #8]
	bx r3
	nop
_02242E10: .4byte FUN_02024A48
	thumb_func_end ov81_02242E08

	thumb_func_start ov81_02242E14
ov81_02242E14: @ 0x02242E14
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, [r0, #8]
	adds r6, r3, #0
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_02024B1C
	adds r1, r6, #0
	blx FUN_020B802C
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	blx FUN_020D2894
	cmp r6, #1
	bne _02242E42
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	blx FUN_020CFE74
	pop {r3, r4, r5, r6, r7, pc}
_02242E42:
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	blx FUN_020CFECC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov81_02242E14

	thumb_func_start ov81_02242E50
ov81_02242E50: @ 0x02242E50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r5, r1, #0
	adds r0, r3, #0
	movs r1, #0x10
	adds r6, r2, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #0x10
	movs r0, #0
_02242E6A:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _02242E6A
	movs r1, #0
	strh r1, [r4]
	str r5, [r4, #4]
	str r6, [r4, #8]
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r2, r1, #0
	movs r3, #0xa
	bl ov81_02242A8C
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov81_02242F10
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02024A14
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov81_02242E50

	thumb_func_start ov81_02242EA4
ov81_02242EA4: @ 0x02242EA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_02024758
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov81_02242EA4

	thumb_func_start ov81_02242EB8
ov81_02242EB8: @ 0x02242EB8
	ldr r3, _02242EC0 @ =FUN_02024830
	ldr r0, [r0, #0xc]
	bx r3
	nop
_02242EC0: .4byte FUN_02024830
	thumb_func_end ov81_02242EB8

	thumb_func_start ov81_02242EC4
ov81_02242EC4: @ 0x02242EC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_020248AC
	adds r3, r0, #0
	add r2, sp, #0
	ldm r3!, {r0, r1}
	mov ip, r2
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [sp]
	lsls r0, r6, #0xc
	adds r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #4]
	lsls r0, r7, #0xc
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	mov r1, ip
	bl FUN_020247D4
	ldr r0, [r4, #0xc]
	bl FUN_020248AC
	adds r2, r0, #0
	ldm r2!, {r0, r1}
	stm r5!, {r0, r1}
	ldr r0, [r2]
	str r0, [r5]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov81_02242EC4

	thumb_func_start ov81_02242F10
ov81_02242F10: @ 0x02242F10
	push {lr}
	sub sp, #0xc
	lsls r1, r1, #0xc
	str r1, [sp]
	movs r1, #2
	lsls r2, r2, #0xc
	lsls r1, r1, #0x14
	adds r1, r2, r1
	str r1, [sp, #4]
	ldr r0, [r0, #0xc]
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov81_02242F10

	thumb_func_start ov81_02242F30
ov81_02242F30: @ 0x02242F30
	ldr r3, _02242F38 @ =FUN_020248AC
	ldr r0, [r0, #0xc]
	bx r3
	nop
_02242F38: .4byte FUN_020248AC
	thumb_func_end ov81_02242F30

	thumb_func_start ov81_02242F3C
ov81_02242F3C: @ 0x02242F3C
	strh r1, [r0]
	bx lr
	thumb_func_end ov81_02242F3C

	thumb_func_start ov81_02242F40
ov81_02242F40: @ 0x02242F40
	ldrh r0, [r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	thumb_func_end ov81_02242F40

	thumb_func_start ov81_02242F48
ov81_02242F48: @ 0x02242F48
	ldr r3, _02242F50 @ =ov81_02242F3C
	movs r1, #1
	bx r3
	nop
_02242F50: .4byte ov81_02242F3C
	thumb_func_end ov81_02242F48

	thumb_func_start ov81_02242F54
ov81_02242F54: @ 0x02242F54
	ldr r3, _02242F5C @ =ov81_02242F3C
	movs r1, #0
	bx r3
	nop
_02242F5C: .4byte ov81_02242F3C
	thumb_func_end ov81_02242F54

	thumb_func_start ov81_02242F60
ov81_02242F60: @ 0x02242F60
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov81_02242F30
	ldr r2, [r0]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	adds r1, #0xf8
	lsls r1, r1, #0xc
	str r1, [sp]
	ldr r0, [r0, #4]
	add r1, sp, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	bl FUN_020247D4
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov81_02242F60

	thumb_func_start ov81_02242F8C
ov81_02242F8C: @ 0x02242F8C
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov81_02242F8C

	thumb_func_start ov81_02242F90
ov81_02242F90: @ 0x02242F90
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov81_02242F90

	thumb_func_start ov81_02242F94
ov81_02242F94: @ 0x02242F94
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #1
	ldr r0, [r5, #0xc]
	lsls r1, r1, #0xc
	bl FUN_02024868
	ldr r0, [r5, #0xc]
	adds r1, r4, #0
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov81_02242F94

	thumb_func_start ov81_02242FB0
ov81_02242FB0: @ 0x02242FB0
	ldr r3, _02242FB8 @ =FUN_02024A14
	ldr r0, [r0, #0xc]
	bx r3
	nop
_02242FB8: .4byte FUN_02024A14
	thumb_func_end ov81_02242FB0

	thumb_func_start ov81_02242FBC
ov81_02242FBC: @ 0x02242FBC
	ldr r3, _02242FC4 @ =FUN_02024B78
	ldr r0, [r0, #0xc]
	bx r3
	nop
_02242FC4: .4byte FUN_02024B78
	thumb_func_end ov81_02242FBC

	thumb_func_start ov81_02242FC8
ov81_02242FC8: @ 0x02242FC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_02024758
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov81_02242FC8

	thumb_func_start ov81_02242FDC
ov81_02242FDC: @ 0x02242FDC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	movs r4, #0
_02242FE4:
	ldr r2, _02243008 @ =0x022435A8
	lsls r6, r4, #4
	lsls r3, r4, #3
	adds r0, r7, #0
	adds r1, r5, r6
	adds r2, r2, r3
	bl FUN_0201D4F8
	adds r0, r5, r6
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x12
	blo _02242FE4
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02243008: .4byte 0x022435A8
	thumb_func_end ov81_02242FDC

	thumb_func_start ov81_0224300C
ov81_0224300C: @ 0x0224300C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_02243012:
	lsls r0, r4, #4
	adds r0, r5, r0
	bl FUN_0201D520
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x12
	blo _02243012
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov81_0224300C

	thumb_func_start ov81_02243028
ov81_02243028: @ 0x02243028
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r4, r0, #0
	bl FUN_0201EE8C
	adds r1, r0, #0
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x64
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02243064 @ =0x000003E2
	movs r3, #0xb
	bl FUN_0200E644
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	ldr r2, _02243064 @ =0x000003E2
	adds r0, r4, #0
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E998
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02243064: .4byte 0x000003E2
	thumb_func_end ov81_02243028

	thumb_func_start ov81_02243068
ov81_02243068: @ 0x02243068
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, [sp, #0x30]
	adds r7, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	cmp r0, #1
	bne _02243086
	ldr r0, [sp, #0x28]
	movs r2, #0
	bl FUN_02002F30
	subs r5, r5, r0
	b _02243096
_02243086:
	cmp r0, #2
	bne _02243096
	ldr r0, [sp, #0x28]
	movs r2, #0
	bl FUN_02002F30
	lsrs r0, r0, #1
	subs r5, r5, r0
_02243096:
	str r4, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x28]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r6, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov81_02243068

	thumb_func_start ov81_022430B4
ov81_022430B4: @ 0x022430B4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r6, r3, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x28]
	adds r1, r4, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	bl ov81_02243068
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov81_022430B4

	thumb_func_start ov81_022430E8
ov81_022430E8: @ 0x022430E8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #4
	bl FUN_0201EEA8
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #0x12
	bl FUN_0201EEA8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov81_022430E8

	thumb_func_start ov81_02243100
ov81_02243100: @ 0x02243100
	push {r4, lr}
	sub sp, #0x10
	adds r2, r0, #0
	ldr r0, _0224313C @ =0x000003D9
	adds r4, r1, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x64
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x86
	movs r3, #5
	bl FUN_02007B44
	movs r0, #0x40
	movs r1, #0xc2
	str r0, [sp]
	movs r0, #0x64
	adds r3, r1, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #4
	adds r3, #0x5e
	bl FUN_02007B8C
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0224313C: .4byte 0x000003D9
	thumb_func_end ov81_02243100

	thumb_func_start ov81_02243140
ov81_02243140: @ 0x02243140
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r7, r0, #0
	adds r4, r2, #0
	movs r0, #0x64
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r4, #0
	adds r1, #0x87
	movs r2, #1
	add r3, sp, #0x24
	bl FUN_02007C2C
	str r0, [sp, #0x20]
	cmp r4, #0
	bne _0224316A
	movs r0, #0xb
	str r0, [sp, #0x10]
	movs r0, #7
	str r0, [sp, #0x18]
	b _02243172
_0224316A:
	movs r0, #0xe
	str r0, [sp, #0x10]
	movs r0, #4
	str r0, [sp, #0x18]
_02243172:
	ldr r0, [sp, #0x24]
	str r0, [sp, #0x1c]
	adds r0, #0xc
	str r0, [sp, #0x1c]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bls _022431D2
_02243184:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	movs r4, #0
	adds r2, r1, r0
	lsls r1, r0, #6
	ldr r0, [sp, #0x1c]
	adds r5, r0, r1
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
_02243196:
	str r6, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #9
	str r0, [sp, #0xc]
	lsls r2, r4, #1
	ldrh r3, [r5, r2]
	ldr r2, _022431DC @ =0x000003D9
	adds r0, r7, #0
	adds r2, r3, r2
	lsls r2, r2, #0x10
	movs r1, #5
	lsrs r2, r2, #0x10
	adds r3, r4, #0
	bl FUN_0201C8C4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x20
	blo _02243196
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	blo _02243184
_022431D2:
	ldr r0, [sp, #0x20]
	bl FUN_0201AB0C
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022431DC: .4byte 0x000003D9
	thumb_func_end ov81_02243140

	thumb_func_start ov81_022431E0
ov81_022431E0: @ 0x022431E0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	cmp r1, #0
	bne _022431F0
	movs r0, #0xb
	movs r1, #7
	b _022431F4
_022431F0:
	movs r0, #0xe
	movs r1, #4
_022431F4:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #9
	movs r2, #0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0201C8C4
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201EFBC
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov81_022431E0

	thumb_func_start ov81_02243220
ov81_02243220: @ 0x02243220
	ldr r3, _02243224 @ =FUN_02019BDC
	bx r3
	.align 2, 0
_02243224: .4byte FUN_02019BDC
	thumb_func_end ov81_02243220

	thumb_func_start ov81_02243228
ov81_02243228: @ 0x02243228
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	adds r4, r3, #0
	bl FUN_0201A018
	ldrb r1, [r0]
	str r1, [r5]
	ldrb r0, [r0, #1]
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_02243228

	thumb_func_start ov81_0224323C
ov81_0224323C: @ 0x0224323C
	bx lr
	.align 2, 0
	thumb_func_end ov81_0224323C

	thumb_func_start ov81_02243240
ov81_02243240: @ 0x02243240
	push {lr}
	sub sp, #0xc
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	ldr r0, _02243264 @ =0x022436F0
	ldr r1, _02243268 @ =0x02243808
	ldr r2, _0224326C @ =0x02243658
	bl FUN_02019BA4
	add sp, #0xc
	pop {pc}
	nop
_02243264: .4byte 0x022436F0
_02243268: .4byte 0x02243808
_0224326C: .4byte 0x02243658
	thumb_func_end ov81_02243240

	thumb_func_start ov81_02243270
ov81_02243270: @ 0x02243270
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #1
	bne _0224327E
	bl FUN_02019FC4
	pop {r4, pc}
_0224327E:
	movs r1, #6
	bl FUN_02019FD0
	adds r0, r4, #0
	movs r1, #7
	bl FUN_02019FD0
	adds r0, r4, #0
	movs r1, #8
	bl FUN_02019FD0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov81_02243270

	thumb_func_start ov81_02243298
ov81_02243298: @ 0x02243298
	push {r3, lr}
	cmp r1, #6
	blt _022432A4
	bl ov81_0224141C
	pop {r3, pc}
_022432A4:
	bl ov81_022413F4
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov81_02243298

	thumb_func_start ov81_022432AC
ov81_022432AC: @ 0x022432AC
	push {lr}
	sub sp, #0xc
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	ldr r0, _022432D0 @ =0x02243668
	ldr r1, _022432D4 @ =0x02243750
	ldr r2, _022432D8 @ =0x02243648
	bl FUN_02019BA4
	add sp, #0xc
	pop {pc}
	nop
_022432D0: .4byte 0x02243668
_022432D4: .4byte 0x02243750
_022432D8: .4byte 0x02243648
	thumb_func_end ov81_022432AC

	thumb_func_start ov81_022432DC
ov81_022432DC: @ 0x022432DC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	ldr r0, _02243308 @ =0x02243688
	ldr r1, _0224330C @ =0x02243718
	ldr r2, _02243310 @ =0x02243648
	bl FUN_02019BA4
	movs r1, #2
	adds r4, r0, #0
	bl FUN_02019FD0
	adds r0, r4, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_02243308: .4byte 0x02243688
_0224330C: .4byte 0x02243718
_02243310: .4byte 0x02243648
	thumb_func_end ov81_022432DC

	thumb_func_start ov81_02243314
ov81_02243314: @ 0x02243314
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r1, #1
	bne _0224332C
	bl FUN_02019FC4
	adds r0, r5, #0
	movs r1, #3
	bl FUN_02019FD0
	b _02243348
_0224332C:
	bl FUN_02019FC4
	adds r0, r5, #0
	movs r1, #4
	bl FUN_02019FD0
	adds r0, r5, #0
	movs r1, #5
	bl FUN_02019FD0
	adds r0, r5, #0
	movs r1, #6
	bl FUN_02019FD0
_02243348:
	adds r0, r4, #0
	bl ov81_02242704
	cmp r0, #1
	bne _0224335A
	adds r0, r5, #0
	movs r1, #2
	bl FUN_02019FD0
_0224335A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_02243314

	thumb_func_start ov81_0224335C
ov81_0224335C: @ 0x0224335C
	push {r3, lr}
	cmp r1, #4
	blt _02243368
	bl ov81_0224141C
	pop {r3, pc}
_02243368:
	bl ov81_02241650
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov81_0224335C

	thumb_func_start ov81_02243370
ov81_02243370: @ 0x02243370
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl ov81_02243220
	adds r0, r4, #0
	bl ov81_02242710
	cmp r0, #1
	bne _0224338E
	adds r0, r4, #0
	movs r1, #0
	bl ov81_022432DC
	pop {r4, pc}
_0224338E:
	adds r0, r4, #0
	movs r1, #0
	bl ov81_022432AC
	pop {r4, pc}
	thumb_func_end ov81_02243370

	thumb_func_start ov81_02243398
ov81_02243398: @ 0x02243398
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, r1, #0
	bl ov81_02243220
	adds r0, r4, #0
	bl ov81_02242710
	cmp r0, #1
	bne _022433CA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	ldr r0, _022433E8 @ =0x022436CC
	ldr r1, _022433EC @ =0x02243788
	ldr r2, _022433F0 @ =0x02243638
	adds r3, r4, #0
	bl FUN_02019BA4
	add sp, #0xc
	pop {r3, r4, pc}
_022433CA:
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x64
	str r0, [sp, #8]
	ldr r0, _022433F4 @ =0x022436A8
	ldr r1, _022433F8 @ =0x022437C8
	ldr r2, _022433F0 @ =0x02243638
	adds r3, r4, #0
	bl FUN_02019BA4
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_022433E8: .4byte 0x022436CC
_022433EC: .4byte 0x02243788
_022433F0: .4byte 0x02243638
_022433F4: .4byte 0x022436A8
_022433F8: .4byte 0x022437C8
	thumb_func_end ov81_02243398

	thumb_func_start ov81_022433FC
ov81_022433FC: @ 0x022433FC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r1, #1
	bne _0224341C
	bl FUN_02019FC4
	adds r0, r5, #0
	movs r1, #4
	bl FUN_02019FD0
	adds r0, r5, #0
	movs r1, #5
	bl FUN_02019FD0
	b _02243430
_0224341C:
	bl FUN_02019FC4
	adds r0, r5, #0
	movs r1, #6
	bl FUN_02019FD0
	adds r0, r5, #0
	movs r1, #7
	bl FUN_02019FD0
_02243430:
	adds r0, r4, #0
	bl ov81_02242704
	cmp r0, #0
	bne _02243442
	adds r0, r5, #0
	movs r1, #3
	bl FUN_02019FD0
_02243442:
	pop {r3, r4, r5, pc}
	thumb_func_end ov81_022433FC

	thumb_func_start ov81_02243444
ov81_02243444: @ 0x02243444
	push {r3, lr}
	cmp r1, #6
	blt _02243450
	bl ov81_0224141C
	pop {r3, pc}
_02243450:
	bl ov81_022416CC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov81_02243444

	.rodata

_02243458:
	.byte 0x00, 0x01, 0x03, 0x04, 0x60, 0x00, 0x40, 0x00
	.byte 0x98, 0x00, 0x40, 0x00, 0x40, 0x00, 0x40, 0x00, 0x78, 0x00, 0x40, 0x00, 0xB0, 0x00, 0x40, 0x00
	.byte 0x28, 0x00, 0x40, 0x00, 0x60, 0x00, 0x40, 0x00, 0x98, 0x00, 0x40, 0x00, 0xD0, 0x00, 0x40, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x40, 0x00, 0x40, 0x00, 0x40, 0x00, 0x68, 0x00, 0x40, 0x00, 0x90, 0x00, 0x40, 0x00
	.byte 0xB8, 0x00, 0x40, 0x00, 0xE0, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x06, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x06, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x06, 0x06, 0x06, 0x06, 0x20, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x01, 0x01, 0x08, 0x08, 0x02, 0x0D, 0x01, 0x00
	.byte 0x01, 0x01, 0x01, 0x08, 0x02, 0x0D, 0x11, 0x00, 0x01, 0x01, 0x0B, 0x0A, 0x02, 0x0D, 0x21, 0x00
	.byte 0x01, 0x0B, 0x0B, 0x0A, 0x02, 0x0D, 0x35, 0x00, 0x01, 0x15, 0x0B, 0x0A, 0x02, 0x0D, 0x49, 0x00
	.byte 0x01, 0x04, 0x04, 0x0A, 0x02, 0x0D, 0x6D, 0x00, 0x01, 0x12, 0x04, 0x0A, 0x02, 0x0D, 0x81, 0x00
	.byte 0x05, 0x02, 0x13, 0x1B, 0x04, 0x0C, 0x01, 0x00, 0x05, 0x0C, 0x01, 0x0A, 0x02, 0x0D, 0x6D, 0x00
	.byte 0x05, 0x02, 0x0F, 0x07, 0x02, 0x09, 0x81, 0x00, 0x05, 0x17, 0x0F, 0x07, 0x02, 0x09, 0x8F, 0x00
	.byte 0x05, 0x02, 0x0C, 0x0C, 0x02, 0x09, 0x9D, 0x00, 0x05, 0x12, 0x0C, 0x0C, 0x02, 0x09, 0xB5, 0x00
	.byte 0x05, 0x12, 0x0C, 0x0C, 0x02, 0x09, 0xCD, 0x00, 0x05, 0x0A, 0x0F, 0x0C, 0x02, 0x09, 0xE5, 0x00
	.byte 0x05, 0x12, 0x0C, 0x0C, 0x02, 0x09, 0xB5, 0x00, 0x05, 0x02, 0x0F, 0x0C, 0x02, 0x09, 0xCD, 0x00
	.byte 0x05, 0x12, 0x0F, 0x0C, 0x02, 0x09, 0xE5, 0x00, 0x3D, 0x32, 0x24, 0x02, 0x3D, 0x32, 0x24, 0x02
	.byte 0x45, 0x34, 0x24, 0x02, 0x45, 0x34, 0x24, 0x02, 0x3D, 0x32, 0x24, 0x02, 0x3D, 0x32, 0x24, 0x02
	.byte 0x5D, 0x33, 0x24, 0x02, 0x5D, 0x33, 0x24, 0x02, 0x3D, 0x32, 0x24, 0x02, 0x3D, 0x32, 0x24, 0x02
	.byte 0x99, 0x32, 0x24, 0x02, 0x99, 0x32, 0x24, 0x02, 0x2C, 0x53, 0x2C, 0x53, 0x2C, 0x53, 0x64, 0x8B
	.byte 0x2C, 0x53, 0x9C, 0xC3, 0x74, 0x8B, 0xB4, 0xF3, 0x5C, 0x73, 0x0C, 0x73, 0x5C, 0x73, 0x8C, 0xF3
	.byte 0x74, 0x8B, 0x4C, 0xB3, 0xFF, 0x00, 0x00, 0x00, 0x2C, 0x53, 0x4C, 0x73, 0x2C, 0x53, 0x84, 0xAB
	.byte 0x00, 0x00, 0x00, 0x00, 0x74, 0x8B, 0xB4, 0xF3, 0x5C, 0x73, 0x0C, 0x73, 0x5C, 0x73, 0x8C, 0xF3
	.byte 0x74, 0x8B, 0x4C, 0xB3, 0xFF, 0x00, 0x00, 0x00, 0x2C, 0x53, 0x2C, 0x53, 0x2C, 0x53, 0x64, 0x8B
	.byte 0x2C, 0x53, 0x9C, 0xC3, 0x00, 0x00, 0x00, 0x00, 0x74, 0x8B, 0x0C, 0x4B, 0x74, 0x8B, 0xB4, 0xF3
	.byte 0x74, 0x8B, 0x0C, 0x73, 0x74, 0x8C, 0x8C, 0xF3, 0xFF, 0x00, 0x00, 0x00, 0x2C, 0x53, 0x14, 0x3B
	.byte 0x2C, 0x53, 0x4C, 0x73, 0x2C, 0x53, 0x84, 0xAB, 0x2C, 0x53, 0xBC, 0xE3, 0x74, 0x8B, 0x0C, 0x4B
	.byte 0x74, 0x8B, 0xB4, 0xF3, 0x74, 0x8B, 0x0C, 0x73, 0x74, 0x8C, 0x8C, 0xF3, 0xFF, 0x00, 0x00, 0x00
	.byte 0x2C, 0x53, 0x04, 0x2B, 0x2C, 0x53, 0x2C, 0x53, 0x2C, 0x53, 0x54, 0x7B, 0x2C, 0x53, 0x7C, 0xA3
	.byte 0x2C, 0x53, 0xA4, 0xCB, 0x2C, 0x53, 0xCC, 0xF3, 0x5C, 0x73, 0x0C, 0x73, 0x5C, 0x73, 0x8C, 0xF3
	.byte 0x74, 0x8B, 0x4C, 0xB3, 0xFF, 0x00, 0x00, 0x00, 0x60, 0x40, 0x00, 0x00, 0x03, 0x03, 0x03, 0x01
	.byte 0x98, 0x40, 0x00, 0x00, 0x03, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x02, 0x02
	.byte 0xD4, 0x80, 0x00, 0x00, 0x80, 0x80, 0x01, 0x00, 0x40, 0x68, 0x00, 0x00, 0x04, 0x06, 0x04, 0x05
	.byte 0xC0, 0x68, 0x00, 0x00, 0x05, 0x06, 0x04, 0x05, 0x80, 0x80, 0x00, 0x00, 0x84, 0x06, 0x06, 0x06
	.byte 0x40, 0x40, 0x00, 0x00, 0x03, 0x03, 0x03, 0x01, 0x78, 0x40, 0x00, 0x00, 0x03, 0x03, 0x00, 0x02
	.byte 0xB0, 0x40, 0x00, 0x00, 0x03, 0x03, 0x01, 0x03, 0xD4, 0x80, 0x00, 0x00, 0x80, 0x80, 0x02, 0x00
	.byte 0x40, 0x68, 0x00, 0x00, 0x04, 0x06, 0x04, 0x05, 0xC0, 0x68, 0x00, 0x00, 0x05, 0x06, 0x04, 0x05
	.byte 0x80, 0x80, 0x00, 0x00, 0x84, 0x06, 0x06, 0x06, 0x28, 0x40, 0x00, 0x00, 0x04, 0x04, 0x05, 0x01
	.byte 0x60, 0x40, 0x00, 0x00, 0x04, 0x04, 0x00, 0x02, 0x98, 0x40, 0x00, 0x00, 0x04, 0x04, 0x01, 0x03
	.byte 0xD0, 0x40, 0x00, 0x00, 0x04, 0x04, 0x02, 0x04, 0x2C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x03, 0x05
	.byte 0xD4, 0x80, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x40, 0x80, 0x00, 0x00, 0x06, 0x06, 0x06, 0x07
	.byte 0xC0, 0x80, 0x00, 0x00, 0x07, 0x07, 0x06, 0x07, 0x40, 0x40, 0x00, 0x00, 0x04, 0x04, 0x05, 0x01
	.byte 0x78, 0x40, 0x00, 0x00, 0x04, 0x04, 0x00, 0x02, 0xB0, 0x40, 0x00, 0x00, 0x04, 0x04, 0x01, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x03, 0x03, 0x03, 0x2C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x02, 0x05
	.byte 0xD4, 0x80, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x40, 0x80, 0x00, 0x00, 0x06, 0x06, 0x06, 0x07
	.byte 0xC0, 0x80, 0x00, 0x00, 0x07, 0x07, 0x06, 0x07, 0x18, 0x40, 0x00, 0x00, 0x00, 0x00, 0x05, 0x01
	.byte 0x40, 0x40, 0x00, 0x00, 0x01, 0x01, 0x00, 0x02, 0x68, 0x40, 0x00, 0x00, 0x02, 0x02, 0x01, 0x03
	.byte 0x90, 0x40, 0x00, 0x00, 0x03, 0x03, 0x02, 0x04, 0xB8, 0x40, 0x00, 0x00, 0x04, 0x04, 0x03, 0x05
	.byte 0xE0, 0x40, 0x00, 0x00, 0x05, 0x05, 0x04, 0x00, 0x40, 0x68, 0x00, 0x00, 0x06, 0x08, 0x06, 0x07
	.byte 0xC0, 0x68, 0x00, 0x00, 0x07, 0x08, 0x06, 0x07, 0x80, 0x80, 0x00, 0x00, 0x86, 0x08, 0x08, 0x08
	@ 0x02243850
