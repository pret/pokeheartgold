
	thumb_func_start ov83_0223DD60
ov83_0223DD60: @ 0x0223DD60
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0223DE40 @ =0x00000050
	movs r1, #2
	bl FUN_02006FF8
	bl ov83_0223F1C8
	movs r0, #3
	movs r1, #0x6b
	lsls r2, r0, #0x10
	bl FUN_0201A910
	ldr r1, _0223DE44 @ =0x0000086C
	adds r0, r4, #0
	movs r2, #0x6b
	bl FUN_02007280
	ldr r2, _0223DE44 @ =0x0000086C
	movs r1, #0
	adds r5, r0, #0
	blx FUN_020E5B44
	movs r0, #0x6b
	bl FUN_0201AC88
	str r0, [r5, #0x4c]
	adds r0, r4, #0
	str r4, [r5]
	bl FUN_020072A4
	adds r4, r0, #0
	ldr r1, [r4]
	ldr r0, _0223DE48 @ =0x0000050C
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	bl FUN_02030CC8
	movs r1, #0x51
	lsls r1, r1, #4
	str r0, [r5, r1]
	subs r0, r1, #4
	ldr r0, [r5, r0]
	bl FUN_02030E08
	ldr r1, _0223DE4C @ =0x00000514
	adds r2, r4, #0
	str r0, [r5, r1]
	ldrb r0, [r4, #4]
	adds r2, #0x20
	subs r1, #8
	strb r0, [r5, #9]
	movs r0, #0x7a
	lsls r0, r0, #4
	str r2, [r5, r0]
	ldr r0, [r5, r1]
	bl FUN_02028EA8
	ldr r1, _0223DE50 @ =0x00000508
	str r0, [r5, r1]
	ldr r2, [r4, #0x18]
	ldr r0, _0223DE54 @ =0x000007A4
	str r2, [r5, r0]
	movs r2, #0xff
	strb r2, [r5, #0x12]
	ldrh r2, [r4, #0x28]
	adds r0, #0x5e
	strh r2, [r5, r0]
	adds r0, r1, #4
	ldr r0, [r5, r0]
	bl FUN_0203107C
	str r0, [r5, #4]
	ldr r0, _0223DE58 @ =0x000007FF
	movs r3, #0
	movs r2, #1
_0223DDF8:
	adds r1, r5, r3
	adds r3, r3, #1
	strb r2, [r1, r0]
	cmp r3, #3
	blt _0223DDF8
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _0223DE10
	movs r0, #3
	b _0223DE12
_0223DE10:
	movs r0, #4
_0223DE12:
	strb r0, [r5, #0x14]
	movs r0, #4
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0x15]
	subs r0, r0, #1
	strb r0, [r5, #0xc]
	ldr r0, _0223DE5C @ =0x00000868
	adds r0, r5, r0
	bl ov83_022477E4
	adds r0, r5, #0
	bl ov83_0223F200
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _0223DE3C
	adds r0, r5, #0
	bl FUN_02096910
_0223DE3C:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223DE40: .4byte 0x00000050
_0223DE44: .4byte 0x0000086C
_0223DE48: .4byte 0x0000050C
_0223DE4C: .4byte 0x00000514
_0223DE50: .4byte 0x00000508
_0223DE54: .4byte 0x000007A4
_0223DE58: .4byte 0x000007FF
_0223DE5C: .4byte 0x00000868
	thumb_func_end ov83_0223DD60

	thumb_func_start ov83_0223DE60
ov83_0223DE60: @ 0x0223DE60
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, _0223DFAC @ =0x000007FE
	adds r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #1
	bne _0223DEC6
	ldr r2, [r5]
	cmp r2, #1
	bne _0223DEEC
	movs r2, #0
	strb r2, [r4, r1]
	bl ov83_022412A0
	ldr r0, _0223DFB0 @ =0x0000075C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223DE94
	bl ov83_0224753C
	ldrb r1, [r4, #0xe]
	movs r0, #4
	bics r1, r0
	strb r1, [r4, #0xe]
_0223DE94:
	ldr r0, _0223DFB4 @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	ldr r0, [r4, #0x24]
	movs r1, #0
	bl FUN_0222A7CC
	adds r0, r4, #0
	movs r1, #8
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl ov83_02240DA8
	b _0223DEEC
_0223DEC6:
	ldrb r0, [r4, #0x12]
	cmp r0, #0xff
	beq _0223DEEC
	ldr r0, [r5]
	cmp r0, #1
	beq _0223DED6
	cmp r0, #3
	bne _0223DEEC
_0223DED6:
	ldr r0, _0223DFAC @ =0x000007FE
	movs r1, #0
	strb r1, [r4, r0]
	adds r0, r4, #0
	bl ov83_022412A0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ov83_02240DA8
_0223DEEC:
	ldr r0, [r5]
	cmp r0, #4
	bhi _0223DF9A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223DEFE: @ jump table
	.2byte _0223DF08 - _0223DEFE - 2 @ case 0
	.2byte _0223DF1E - _0223DEFE - 2 @ case 1
	.2byte _0223DF60 - _0223DEFE - 2 @ case 2
	.2byte _0223DF76 - _0223DEFE - 2 @ case 3
	.2byte _0223DF8C - _0223DEFE - 2 @ case 4
_0223DF08:
	adds r0, r4, #0
	bl ov83_0223E008
	cmp r0, #1
	bne _0223DF9A
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov83_02240DA8
	b _0223DF9A
_0223DF1E:
	adds r0, r4, #0
	bl ov83_0223E14C
	cmp r0, #1
	bne _0223DF9A
	ldrb r0, [r4, #0xe]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0223DF3E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ov83_02240DA8
	b _0223DF9A
_0223DF3E:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _0223DF54
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl ov83_02240DA8
	b _0223DF9A
_0223DF54:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl ov83_02240DA8
	b _0223DF9A
_0223DF60:
	adds r0, r4, #0
	bl ov83_0223EEA0
	cmp r0, #1
	bne _0223DF9A
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov83_02240DA8
	b _0223DF9A
_0223DF76:
	adds r0, r4, #0
	bl ov83_0223EFA4
	cmp r0, #1
	bne _0223DF9A
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl ov83_02240DA8
	b _0223DF9A
_0223DF8C:
	adds r0, r4, #0
	bl ov83_0223F010
	cmp r0, #1
	bne _0223DF9A
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223DF9A:
	adds r0, r4, #0
	bl ov83_02241B30
	ldr r0, _0223DFB8 @ =0x00000518
	ldr r0, [r4, r0]
	bl FUN_0202457C
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223DFAC: .4byte 0x000007FE
_0223DFB0: .4byte 0x0000075C
_0223DFB4: .4byte 0x00000508
_0223DFB8: .4byte 0x00000518
	thumb_func_end ov83_0223DE60

	thumb_func_start ov83_0223DFBC
ov83_0223DFBC: @ 0x0223DFBC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #0x7a
	lsls r0, r0, #4
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, r0]
	strh r1, [r0]
	ldr r0, _0223E000 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	bl FUN_020205AC
	adds r0, r4, #0
	bl ov83_0223F058
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x6b
	bl FUN_0201A9C4
	ldr r0, _0223E004 @ =0x00000050
	bl FUN_02006F7C
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0223E000: .4byte 0x04000050
_0223E004: .4byte 0x00000050
	thumb_func_end ov83_0223DFBC

	thumb_func_start ov83_0223E008
ov83_0223E008: @ 0x0223E008
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #4
	bhi _0223E104
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223E020: @ jump table
	.2byte _0223E02A - _0223E020 - 2 @ case 0
	.2byte _0223E046 - _0223E020 - 2 @ case 1
	.2byte _0223E06E - _0223E020 - 2 @ case 2
	.2byte _0223E0B4 - _0223E020 - 2 @ case 3
	.2byte _0223E0F6 - _0223E020 - 2 @ case 4
_0223E02A:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _0223E03E
	bl FUN_02037BEC
	movs r0, #0xd7
	bl FUN_02037AC0
_0223E03E:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E046:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _0223E066
	movs r0, #0xd7
	bl FUN_02037B38
	cmp r0, #1
	bne _0223E104
	bl FUN_02037BEC
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E066:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E06E:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _0223E08E
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0
	bl ov83_02241368
	cmp r0, #1
	bne _0223E104
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E08E:
	adds r0, r4, #0
	bl ov83_0223E10C
	movs r0, #6
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E0B4:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _0223E0EE
	ldrb r0, [r4, #0xf]
	cmp r0, #2
	blo _0223E104
	movs r0, #0
	strb r0, [r4, #0xf]
	adds r0, r4, #0
	bl ov83_0223E10C
	movs r0, #6
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E0EE:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E104
_0223E0F6:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223E104
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_0223E104:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov83_0223E008

	thumb_func_start ov83_0223E10C
ov83_0223E10C: @ 0x0223E10C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x50
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov83_0224153C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov83_02241770
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x80
	bl ov83_02240080
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x70
	bl ov83_02240170
	adds r0, r5, #0
	bl ov83_02240290
	bl FUN_02022D24
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_0223E10C

	thumb_func_start ov83_0223E14C
ov83_0223E14C: @ 0x0223E14C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0x16
	bls _0223E15C
	bl _0223EE86
_0223E15C:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223E168: @ jump table
	.2byte _0223E196 - _0223E168 - 2 @ case 0
	.2byte _0223E254 - _0223E168 - 2 @ case 1
	.2byte _0223E2D2 - _0223E168 - 2 @ case 2
	.2byte _0223E42C - _0223E168 - 2 @ case 3
	.2byte _0223E608 - _0223E168 - 2 @ case 4
	.2byte _0223E6BA - _0223E168 - 2 @ case 5
	.2byte _0223E6CC - _0223E168 - 2 @ case 6
	.2byte _0223E6F2 - _0223E168 - 2 @ case 7
	.2byte _0223E714 - _0223E168 - 2 @ case 8
	.2byte _0223E814 - _0223E168 - 2 @ case 9
	.2byte _0223E8CA - _0223E168 - 2 @ case 10
	.2byte _0223EA26 - _0223E168 - 2 @ case 11
	.2byte _0223EB92 - _0223E168 - 2 @ case 12
	.2byte _0223EC40 - _0223E168 - 2 @ case 13
	.2byte _0223EC52 - _0223E168 - 2 @ case 14
	.2byte _0223EC78 - _0223E168 - 2 @ case 15
	.2byte _0223ECC0 - _0223E168 - 2 @ case 16
	.2byte _0223ECDA - _0223E168 - 2 @ case 17
	.2byte _0223ED00 - _0223E168 - 2 @ case 18
	.2byte _0223EDC2 - _0223E168 - 2 @ case 19
	.2byte _0223EDE2 - _0223E168 - 2 @ case 20
	.2byte _0223EE04 - _0223E168 - 2 @ case 21
	.2byte _0223EE46 - _0223E168 - 2 @ case 22
_0223E196:
	ldrb r1, [r4, #0xe]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1e
	cmp r1, #1
	bne _0223E1C2
	bl ov83_02240348
	ldr r0, _0223E4F0 @ =0x00000778
	movs r1, #0xcc
	ldr r0, [r4, r0]
	movs r2, #0x64
	bl ov83_02247630
	movs r0, #2
	strb r0, [r4, #8]
	ldrb r1, [r4, #0xe]
	movs r0, #0x60
	add sp, #4
	bics r1, r0
	strb r1, [r4, #0xe]
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_0223E1C2:
	cmp r1, #2
	bne _0223E1E8
	bl ov83_02240384
	ldr r0, _0223E4F0 @ =0x00000778
	movs r1, #0xd3
	ldr r0, [r4, r0]
	movs r2, #0x6a
	bl ov83_02247630
	movs r0, #8
	strb r0, [r4, #8]
	ldrb r1, [r4, #0xe]
	movs r0, #0x60
	add sp, #4
	bics r1, r0
	strb r1, [r4, #0xe]
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_0223E1E8:
	ldr r0, _0223E4F4 @ =0x00000838
	ldr r0, [r4, r0]
	bl ov83_02247AD4
	cmp r0, #4
	bhi _0223E20A
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223E200: @ jump table
	.2byte _0223E216 - _0223E200 - 2 @ case 0
	.2byte _0223E216 - _0223E200 - 2 @ case 1
	.2byte _0223E216 - _0223E200 - 2 @ case 2
	.2byte _0223E216 - _0223E200 - 2 @ case 3
	.2byte _0223E22A - _0223E200 - 2 @ case 4
_0223E20A:
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _0223E236
	bl _0223EE86
_0223E216:
	adds r0, r4, #0
	bl ov83_022402F4
	adds r0, r4, #0
	bl ov83_02240300
	movs r0, #1
	strb r0, [r4, #8]
	bl _0223EE86
_0223E22A:
	ldr r0, _0223E4F8 @ =0x000005DC
	bl FUN_0200604C
	add sp, #4
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0223E236:
	ldrb r1, [r4, #0xd]
	ldrb r0, [r4, #0x15]
	cmp r1, r0
	beq _0223E2FA
	ldr r0, _0223E4F4 @ =0x00000838
	ldr r0, [r4, r0]
	bl ov83_02247B04
	ldrb r2, [r4, #0xd]
	adds r0, r4, #0
	movs r1, #4
	bl ov83_02242AB4
	bl _0223EE86
_0223E254:
	movs r0, #0x21
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_020186A4
	ldr r1, _0223E4F8 @ =0x000005DC
	adds r5, r0, #0
	bl ov83_022477B0
	adds r0, r4, #0
	bl ov83_02242DAC
	cmp r5, #5
	bhi _0223E27A
	bhs _0223E2AA
	cmp r5, #0
	beq _0223E296
	bl _0223EE86
_0223E27A:
	cmp r5, #0xb
	bhi _0223E284
	beq _0223E2BE
	bl _0223EE86
_0223E284:
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	blo _0223E2FA
	beq _0223E2BE
	adds r0, r0, #1
	cmp r5, r0
	bl _0223EE86
_0223E296:
	adds r0, r4, #0
	bl ov83_02240334
	adds r0, r4, #0
	bl ov83_02240348
	movs r0, #2
	strb r0, [r4, #8]
	bl _0223EE86
_0223E2AA:
	adds r0, r4, #0
	bl ov83_02240334
	adds r0, r4, #0
	bl ov83_02240384
	movs r0, #8
	strb r0, [r4, #8]
	bl _0223EE86
_0223E2BE:
	adds r0, r4, #0
	bl ov83_02240334
	adds r0, r4, #0
	bl ov83_02240290
	movs r0, #0
	strb r0, [r4, #8]
	bl _0223EE86
_0223E2D2:
	movs r0, #0x21
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_020186A4
	ldr r1, _0223E4F8 @ =0x000005DC
	adds r5, r0, #0
	bl ov83_022477B0
	adds r0, r4, #0
	bl ov83_02242DFC
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	bhi _0223E322
	blo _0223E2F6
	b _0223E418
_0223E2F6:
	cmp r5, #0xb
	bls _0223E2FE
_0223E2FA:
	bl _0223EE86
_0223E2FE:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223E30A: @ jump table
	.2byte _0223EE86 - _0223E30A - 2 @ case 0
	.2byte _0223E32C - _0223E30A - 2 @ case 1
	.2byte _0223E32C - _0223E30A - 2 @ case 2
	.2byte _0223E32C - _0223E30A - 2 @ case 3
	.2byte _0223E3A4 - _0223E30A - 2 @ case 4
	.2byte _0223EE86 - _0223E30A - 2 @ case 5
	.2byte _0223EE86 - _0223E30A - 2 @ case 6
	.2byte _0223EE86 - _0223E30A - 2 @ case 7
	.2byte _0223EE86 - _0223E30A - 2 @ case 8
	.2byte _0223EE86 - _0223E30A - 2 @ case 9
	.2byte _0223EE86 - _0223E30A - 2 @ case 10
	.2byte _0223E418 - _0223E30A - 2 @ case 11
_0223E322:
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bl _0223EE86
_0223E32C:
	adds r0, r4, #0
	strb r5, [r4, #0x13]
	bl ov83_0224037C
	ldr r0, _0223E4FC @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	ldr r0, _0223E500 @ =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	movs r2, #0
	bl ov83_0224777C
	ldr r1, _0223E504 @ =0x00000848
	ldr r2, [r4, r1]
	movs r1, #0xc
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _0223E508 @ =0x02247F4C
	ldr r1, [r1, r3]
	cmp r0, r1
	bhs _0223E378
	adds r0, r4, #0
	movs r1, #0x21
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	movs r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
_0223E378:
	lsls r3, r2, #1
	ldr r2, _0223E50C @ =0x02247D18
	movs r1, #0
	ldrh r2, [r2, r3]
	adds r0, r4, #0
	movs r3, #3
	str r1, [sp]
	bl ov83_02240C48
	adds r0, r4, #0
	movs r1, #0x37
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	bl ov83_02240514
	movs r0, #3
	strb r0, [r4, #8]
	bl _0223EE86
_0223E3A4:
	ldr r0, _0223E500 @ =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	movs r2, #0
	bl ov83_0224777C
	adds r6, r0, #0
	cmp r6, #3
	bne _0223E3C8
	ldr r0, _0223E4F8 @ =0x000005DC
	movs r1, #0
	bl FUN_02006154
	ldr r0, _0223E510 @ =0x000005F3
	bl FUN_0200604C
	bl _0223EE86
_0223E3C8:
	strb r5, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_0224037C
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	adds r5, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl FUN_020310BC
	movs r1, #0
	ldr r2, _0223E514 @ =0x02247D48
	lsls r3, r6, #1
	ldrh r2, [r2, r3]
	adds r0, r4, #0
	movs r3, #4
	str r1, [sp]
	bl ov83_02240C48
	adds r0, r4, #0
	movs r1, #0x26
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	bl ov83_02240514
	movs r0, #4
	strb r0, [r4, #8]
	bl _0223EE86
_0223E418:
	adds r0, r4, #0
	bl ov83_0224037C
	adds r0, r4, #0
	bl ov83_02240300
	movs r0, #1
	strb r0, [r4, #8]
	bl _0223EE86
_0223E42C:
	ldr r0, _0223E518 @ =0x0000084C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _0223E442
	cmp r0, #2
	bne _0223E43E
	b _0223E5F2
_0223E43E:
	bl _0223EE86
_0223E442:
	ldr r0, _0223E518 @ =0x0000084C
	adds r0, r4, r0
	bl ov83_022478B4
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _0223E51C @ =0x000007A4
	ldr r0, [r4, r0]
	bl FUN_02074644
	adds r5, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	adds r6, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r4, #4]
	adds r1, r6, #0
	bl FUN_020310BC
	adds r6, r0, #0
	ldr r0, _0223E500 @ =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	movs r2, #0
	bl ov83_0224777C
	ldr r1, _0223E504 @ =0x00000848
	movs r2, #0xc
	ldr r1, [r4, r1]
	adds r3, r1, #0
	muls r3, r2, r3
	ldr r2, _0223E508 @ =0x02247F4C
	ldr r2, [r2, r3]
	cmp r0, r2
	bhs _0223E4C0
	ldr r0, _0223E4FC @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	adds r0, r4, #0
	movs r1, #0x21
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	movs r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
_0223E4C0:
	ldr r0, _0223E50C @ =0x02247D18
	lsls r2, r1, #1
	ldrh r0, [r0, r2]
	cmp r6, r0
	bhs _0223E520
	ldr r0, _0223E4FC @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	movs r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
	.align 2, 0
_0223E4F0: .4byte 0x00000778
_0223E4F4: .4byte 0x00000838
_0223E4F8: .4byte 0x000005DC
_0223E4FC: .4byte 0x00000508
_0223E500: .4byte 0x0000050C
_0223E504: .4byte 0x00000848
_0223E508: .4byte 0x02247F4C
_0223E50C: .4byte 0x02247D18
_0223E510: .4byte 0x000005F3
_0223E514: .4byte 0x02247D48
_0223E518: .4byte 0x0000084C
_0223E51C: .4byte 0x000007A4
_0223E520:
	cmp r1, #0
	bne _0223E552
	adds r0, r5, #0
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	cmp r6, r0
	bne _0223E5AC
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	movs r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
_0223E552:
	cmp r1, #1
	bne _0223E574
	adds r0, r5, #0
	bl ov83_022412DC
	cmp r0, #0
	bne _0223E5AC
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	movs r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
_0223E574:
	adds r0, r5, #0
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	cmp r6, r0
	bne _0223E5AC
	adds r0, r5, #0
	bl ov83_022412DC
	cmp r0, #0
	bne _0223E5AC
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	movs r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
_0223E5AC:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _0223E5E4
	ldrb r2, [r4, #0x13]
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	subs r2, r2, #1
	lsls r3, r2, #1
	ldr r2, _0223E8D8 @ =0x02247D18
	ldrh r2, [r2, r3]
	bl FUN_02237FA4
	adds r1, r4, #0
	adds r0, r4, #0
	adds r1, #0x50
	bl ov83_02241770
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_022415F4
	movs r0, #0x13
	strb r0, [r4, #8]
	bl _0223EE86
_0223E5E4:
	ldrb r1, [r4, #0xe]
	movs r0, #2
	add sp, #4
	orrs r0, r1
	strb r0, [r4, #0xe]
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0223E5F2:
	ldr r0, _0223E8DC @ =0x0000084C
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	bl ov83_02240348
	movs r0, #2
	strb r0, [r4, #8]
	bl _0223EE86
_0223E608:
	ldr r0, _0223E8DC @ =0x0000084C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _0223E61C
	cmp r0, #2
	beq _0223E6A6
	bl _0223EE86
_0223E61C:
	ldr r0, _0223E8DC @ =0x0000084C
	adds r0, r4, r0
	bl ov83_022478B4
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	adds r5, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl FUN_020310BC
	adds r5, r0, #0
	ldr r0, _0223E8E0 @ =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	movs r2, #0
	bl ov83_0224777C
	lsls r1, r0, #1
	ldr r0, _0223E8E4 @ =0x02247D48
	ldrh r0, [r0, r1]
	cmp r5, r0
	bhs _0223E67E
	ldr r0, _0223E8E8 @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	adds r0, r4, #0
	movs r1, #0x29
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	movs r0, #7
	strb r0, [r4, #8]
	bl _0223EE86
_0223E67E:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _0223E698
	ldrb r1, [r4, #0xd]
	adds r0, r4, #0
	movs r2, #4
	bl ov83_02241BC4
	movs r0, #5
	strb r0, [r4, #8]
	b _0223EE86
_0223E698:
	ldrb r1, [r4, #0xe]
	movs r0, #2
	add sp, #4
	orrs r0, r1
	strb r0, [r4, #0xe]
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0223E6A6:
	ldr r0, _0223E8DC @ =0x0000084C
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	bl ov83_02240348
	movs r0, #2
	strb r0, [r4, #8]
	b _0223EE86
_0223E6BA:
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0x13]
	bl ov83_02240FAC
	cmp r0, #1
	bne _0223E754
	movs r0, #6
	strb r0, [r4, #8]
	b _0223EE86
_0223E6CC:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223E754
	ldr r0, _0223E8EC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov83_02240348
	ldr r0, _0223E8F0 @ =0x00000778
	movs r1, #0xcc
	ldr r0, [r4, r0]
	movs r2, #0x64
	bl ov83_02247630
	movs r0, #2
	strb r0, [r4, #8]
	b _0223EE86
_0223E6F2:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223E754
	ldr r0, _0223E8EC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02241354
	adds r0, r4, #0
	bl ov83_02240348
	movs r0, #2
	strb r0, [r4, #8]
	b _0223EE86
_0223E714:
	ldr r2, _0223E8F4 @ =0x00000868
	movs r0, #2
	movs r1, #0
	adds r2, r4, r2
	bl ov83_022477EC
	movs r0, #0x21
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_020186A4
	ldr r1, _0223E8EC @ =0x000005DC
	adds r5, r0, #0
	bl ov83_022477B0
	adds r0, r4, #0
	bl ov83_02242E88
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	bhi _0223E756
	bhs _0223E75C
	cmp r5, #8
	bhi _0223E754
	cmp r5, #6
	blo _0223E754
	beq _0223E76E
	cmp r5, #7
	beq _0223E784
	cmp r5, #8
	beq _0223E7C0
_0223E754:
	b _0223EE86
_0223E756:
	adds r0, r0, #1
	cmp r5, r0
	b _0223EE86
_0223E75C:
	adds r0, r4, #0
	bl ov83_022403B8
	adds r0, r4, #0
	bl ov83_02240300
	movs r0, #1
	strb r0, [r4, #8]
	b _0223EE86
_0223E76E:
	adds r0, r4, #0
	strb r5, [r4, #0x13]
	bl ov83_022403B8
	adds r0, r4, #0
	movs r1, #6
	bl ov83_022403C0
	movs r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223E784:
	adds r0, r4, #0
	strb r5, [r4, #0x13]
	bl ov83_022403B8
	ldr r0, _0223E8E0 @ =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	movs r2, #1
	bl ov83_0224777C
	cmp r0, #1
	bne _0223E7B2
	adds r0, r4, #0
	movs r1, #0x36
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	movs r0, #0xf
	strb r0, [r4, #8]
	add sp, #4
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_0223E7B2:
	adds r0, r4, #0
	movs r1, #7
	bl ov83_022403C0
	movs r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223E7C0:
	ldr r0, _0223E8E0 @ =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	movs r2, #1
	bl ov83_0224777C
	adds r6, r0, #0
	cmp r6, #3
	bne _0223E7E2
	ldr r0, _0223E8EC @ =0x000005DC
	movs r1, #0
	bl FUN_02006154
	ldr r0, _0223E8F8 @ =0x000005F3
	bl FUN_0200604C
	b _0223EE86
_0223E7E2:
	adds r0, r4, #0
	strb r5, [r4, #0x13]
	bl ov83_022403B8
	movs r1, #0
	ldr r2, _0223E8FC @ =0x02247D4E
	lsls r3, r6, #1
	ldrh r2, [r2, r3]
	adds r0, r4, #0
	movs r3, #4
	str r1, [sp]
	bl ov83_02240C48
	adds r0, r4, #0
	movs r1, #0x26
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	bl ov83_02240514
	movs r0, #0xc
	strb r0, [r4, #8]
	b _0223EE86
_0223E814:
	ldr r0, _0223E900 @ =0x0000085C
	ldr r0, [r4, r0]
	bl ov83_02247BC4
	adds r5, r0, #0
	movs r0, #2
	mvns r0, r0
	cmp r5, r0
	bhi _0223E84A
	bhs _0223E8AE
	cmp r5, #8
	bhi _0223E852
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223E838: @ jump table
	.2byte _0223E854 - _0223E838 - 2 @ case 0
	.2byte _0223E854 - _0223E838 - 2 @ case 1
	.2byte _0223E854 - _0223E838 - 2 @ case 2
	.2byte _0223E854 - _0223E838 - 2 @ case 3
	.2byte _0223E854 - _0223E838 - 2 @ case 4
	.2byte _0223E854 - _0223E838 - 2 @ case 5
	.2byte _0223E882 - _0223E838 - 2 @ case 6
	.2byte _0223E898 - _0223E838 - 2 @ case 7
	.2byte _0223E8B6 - _0223E838 - 2 @ case 8
_0223E84A:
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	beq _0223E8B6
_0223E852:
	b _0223EE86
_0223E854:
	ldr r0, _0223E904 @ =0x00000862
	movs r1, #6
	ldrsh r2, [r4, r0]
	muls r1, r2, r1
	adds r2, r5, r1
	subs r1, r0, #2
	strb r2, [r4, r1]
	subs r0, r0, #1
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	cmp r1, r0
	bhs _0223E916
	ldr r0, _0223E908 @ =0x000005DD
	bl FUN_0200604C
	lsls r1, r5, #0x10
	adds r0, r4, #0
	lsrs r1, r1, #0x10
	bl ov83_02242F18
	movs r0, #0xa
	strb r0, [r4, #8]
	b _0223EE86
_0223E882:
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #6
	bl ov83_02242F18
	movs r0, #0xa
	strb r0, [r4, #8]
	b _0223EE86
_0223E898:
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #7
	bl ov83_02242F18
	movs r0, #0xa
	strb r0, [r4, #8]
	b _0223EE86
_0223E8AE:
	ldr r0, _0223E8EC @ =0x000005DC
	bl FUN_0200604C
	b _0223EE86
_0223E8B6:
	ldr r0, _0223E908 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #8
	bl ov83_02242F18
	movs r0, #0xa
	strb r0, [r4, #8]
	b _0223EE86
_0223E8CA:
	bl ov83_02242F2C
	cmp r0, #1
	beq _0223E916
	ldr r0, _0223E90C @ =0x00000864
	b _0223E910
	nop
_0223E8D8: .4byte 0x02247D18
_0223E8DC: .4byte 0x0000084C
_0223E8E0: .4byte 0x0000050C
_0223E8E4: .4byte 0x02247D48
_0223E8E8: .4byte 0x00000508
_0223E8EC: .4byte 0x000005DC
_0223E8F0: .4byte 0x00000778
_0223E8F4: .4byte 0x00000868
_0223E8F8: .4byte 0x000005F3
_0223E8FC: .4byte 0x02247D4E
_0223E900: .4byte 0x0000085C
_0223E904: .4byte 0x00000862
_0223E908: .4byte 0x000005DD
_0223E90C: .4byte 0x00000864
_0223E910:
	ldrh r1, [r4, r0]
	cmp r1, #8
	bls _0223E918
_0223E916:
	b _0223EE86
_0223E918:
	adds r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0223E924: @ jump table
	.2byte _0223E936 - _0223E924 - 2 @ case 0
	.2byte _0223E936 - _0223E924 - 2 @ case 1
	.2byte _0223E936 - _0223E924 - 2 @ case 2
	.2byte _0223E936 - _0223E924 - 2 @ case 3
	.2byte _0223E936 - _0223E924 - 2 @ case 4
	.2byte _0223E936 - _0223E924 - 2 @ case 5
	.2byte _0223E982 - _0223E924 - 2 @ case 6
	.2byte _0223E9CA - _0223E924 - 2 @ case 7
	.2byte _0223EA14 - _0223E924 - 2 @ case 8
_0223E936:
	adds r0, r4, #0
	bl ov83_022428A8
	ldr r0, _0223EC84 @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	movs r1, #0x86
	lsls r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02240EC4
	adds r2, r0, #0
	movs r1, #0
	adds r0, r4, #0
	movs r3, #3
	str r1, [sp]
	bl ov83_02240C48
	adds r0, r4, #0
	movs r1, #0x37
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	bl ov83_02240514
	movs r0, #0xb
	strb r0, [r4, #8]
	b _0223EE86
_0223E982:
	subs r1, r0, #2
	ldrsh r1, [r4, r1]
	subs r2, r1, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bge _0223E9A2
	subs r0, r0, #3
	ldrb r0, [r4, r0]
	movs r1, #6
	subs r0, r0, #1
	blx FUN_020F2998
	ldr r1, _0223EC88 @ =0x00000862
	strh r0, [r4, r1]
_0223E9A2:
	adds r0, r4, #0
	bl ov83_02240664
	adds r0, r4, #0
	bl ov83_02240748
	adds r0, r4, #0
	bl ov83_022407FC
	ldr r0, _0223EC8C @ =0x0000085C
	ldr r0, [r4, r0]
	bl FUN_02019F74
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov83_022408E0
	movs r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223E9CA:
	subs r1, r0, #2
	ldrsh r1, [r4, r1]
	adds r2, r1, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	subs r0, r0, #3
	ldrb r0, [r4, r0]
	movs r1, #6
	subs r0, r0, #1
	blx FUN_020F2998
	ldr r1, _0223EC88 @ =0x00000862
	ldrsh r2, [r4, r1]
	cmp r0, r2
	bge _0223E9EC
	movs r0, #0
	strh r0, [r4, r1]
_0223E9EC:
	adds r0, r4, #0
	bl ov83_02240664
	adds r0, r4, #0
	bl ov83_02240748
	adds r0, r4, #0
	bl ov83_022407FC
	ldr r0, _0223EC8C @ =0x0000085C
	ldr r0, [r4, r0]
	bl FUN_02019F74
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov83_022408E0
	movs r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223EA14:
	adds r0, r4, #0
	bl ov83_0224042C
	adds r0, r4, #0
	bl ov83_02240384
	movs r0, #8
	strb r0, [r4, #8]
	b _0223EE86
_0223EA26:
	ldr r0, _0223EC90 @ =0x0000084C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _0223EA3A
	cmp r0, #2
	bne _0223EA38
	b _0223EB7E
_0223EA38:
	b _0223EE86
_0223EA3A:
	ldr r0, _0223EC90 @ =0x0000084C
	adds r0, r4, r0
	bl ov83_022478B4
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	adds r5, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl FUN_020310BC
	movs r1, #0x86
	lsls r1, r1, #4
	adds r5, r0, #0
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02240EC4
	cmp r5, r0
	bhs _0223EA96
	ldr r0, _0223EC84 @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	movs r0, #0x10
	strb r0, [r4, #8]
	b _0223EE86
_0223EA96:
	ldr r0, _0223EC94 @ =0x00000804
	movs r1, #6
	ldr r5, [r4, r0]
	movs r2, #0
	adds r0, r5, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0223EB36
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _0223EB0A
	adds r0, r4, #0
	bl ov83_0224042C
	ldr r0, _0223EC84 @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	movs r1, #0x86
	lsls r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02240EC4
	adds r2, r0, #0
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	bl FUN_02237FA4
	adds r1, r4, #0
	adds r0, r4, #0
	adds r1, #0x50
	bl ov83_02241770
	movs r1, #0x86
	lsls r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02240F48
	adds r2, r0, #0
	ldrb r1, [r4, #0xd]
	adds r0, r4, #0
	bl ov83_022416A0
	movs r0, #0x13
	strb r0, [r4, #8]
	b _0223EE86
_0223EB0A:
	movs r1, #0x86
	lsls r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02240F48
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl ov83_0224042C
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02241354
	ldrb r1, [r4, #0xe]
	movs r0, #2
	add sp, #4
	orrs r0, r1
	strb r0, [r4, #0xe]
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0223EB36:
	adds r0, r5, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov83_02240C60
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	adds r2, r0, #0
	ldr r0, [r4, #0x24]
	movs r1, #1
	bl FUN_0200C100
	ldr r0, _0223EC84 @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	movs r0, #0x11
	strb r0, [r4, #8]
	b _0223EE86
_0223EB7E:
	ldr r0, _0223EC90 @ =0x0000084C
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	bl ov83_0224175C
	movs r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223EB92:
	ldr r0, _0223EC90 @ =0x0000084C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _0223EBA4
	cmp r0, #2
	beq _0223EC2C
	b _0223EE86
_0223EBA4:
	ldr r0, _0223EC90 @ =0x0000084C
	adds r0, r4, r0
	bl ov83_022478B4
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	adds r5, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl FUN_020310BC
	adds r5, r0, #0
	ldr r0, _0223EC98 @ =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	movs r2, #1
	bl ov83_0224777C
	lsls r1, r0, #1
	ldr r0, _0223EC9C @ =0x02247D4E
	ldrh r0, [r0, r1]
	cmp r5, r0
	bhs _0223EC04
	ldr r0, _0223EC84 @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	adds r0, r4, #0
	movs r1, #0x29
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	movs r0, #0xf
	strb r0, [r4, #8]
	b _0223EE86
_0223EC04:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _0223EC1E
	ldrb r1, [r4, #0xd]
	adds r0, r4, #0
	movs r2, #8
	bl ov83_02241BC4
	movs r0, #0xd
	strb r0, [r4, #8]
	b _0223EE86
_0223EC1E:
	ldrb r1, [r4, #0xe]
	movs r0, #2
	add sp, #4
	orrs r0, r1
	strb r0, [r4, #0xe]
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0223EC2C:
	ldr r0, _0223EC90 @ =0x0000084C
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	bl ov83_02240384
	movs r0, #8
	strb r0, [r4, #8]
	b _0223EE86
_0223EC40:
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0x13]
	bl ov83_02240FAC
	cmp r0, #1
	bne _0223ED10
	movs r0, #0xe
	strb r0, [r4, #8]
	b _0223EE86
_0223EC52:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223ED10
	ldr r0, _0223ECA0 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov83_02240384
	ldr r0, _0223ECA4 @ =0x00000778
	movs r1, #0xd3
	ldr r0, [r4, r0]
	movs r2, #0x6a
	bl ov83_02247630
	movs r0, #8
	strb r0, [r4, #8]
	b _0223EE86
_0223EC78:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223ED10
	ldr r0, _0223ECA0 @ =0x000005DC
	b _0223ECA8
	.align 2, 0
_0223EC84: .4byte 0x00000508
_0223EC88: .4byte 0x00000862
_0223EC8C: .4byte 0x0000085C
_0223EC90: .4byte 0x0000084C
_0223EC94: .4byte 0x00000804
_0223EC98: .4byte 0x0000050C
_0223EC9C: .4byte 0x02247D4E
_0223ECA0: .4byte 0x000005DC
_0223ECA4: .4byte 0x00000778
_0223ECA8:
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02241354
	adds r0, r4, #0
	bl ov83_02240384
	movs r0, #8
	strb r0, [r4, #8]
	b _0223EE86
_0223ECC0:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223ED10
	ldr r0, _0223EE8C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov83_0224175C
	movs r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223ECDA:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223ED10
	ldr r0, _0223EE8C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x3d
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	bl ov83_02240514
	movs r0, #0x12
	strb r0, [r4, #8]
	b _0223EE86
_0223ED00:
	ldr r0, _0223EE90 @ =0x0000084C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _0223ED12
	cmp r0, #2
	beq _0223EDAE
_0223ED10:
	b _0223EE86
_0223ED12:
	ldr r0, _0223EE90 @ =0x0000084C
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	bl ov83_02240664
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _0223ED82
	adds r0, r4, #0
	bl ov83_0224042C
	ldr r0, _0223EE94 @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	movs r1, #0x86
	lsls r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02240EC4
	adds r2, r0, #0
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	bl FUN_02237FA4
	adds r1, r4, #0
	adds r0, r4, #0
	adds r1, #0x50
	bl ov83_02241770
	movs r1, #0x86
	lsls r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02240F48
	adds r2, r0, #0
	ldrb r1, [r4, #0xd]
	adds r0, r4, #0
	bl ov83_022416A0
	movs r0, #0x13
	strb r0, [r4, #8]
	b _0223EE86
_0223ED82:
	movs r1, #0x86
	lsls r1, r1, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02240F48
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl ov83_0224042C
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02241354
	ldrb r1, [r4, #0xe]
	movs r0, #2
	add sp, #4
	orrs r0, r1
	strb r0, [r4, #0xe]
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0223EDAE:
	ldr r0, _0223EE90 @ =0x0000084C
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	bl ov83_0224175C
	movs r0, #9
	strb r0, [r4, #8]
	b _0223EE86
_0223EDC2:
	ldr r2, _0223EE98 @ =0x00000868
	movs r0, #2
	movs r1, #0
	adds r2, r4, r2
	bl ov83_022477EC
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02240FAC
	cmp r0, #1
	bne _0223EE86
	movs r0, #0x14
	strb r0, [r4, #8]
	b _0223EE86
_0223EDE2:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223EE86
	ldr r0, _0223EE8C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02241354
	adds r0, r4, #0
	bl ov83_02240290
	movs r0, #0
	strb r0, [r4, #8]
	b _0223EE86
_0223EE04:
	ldr r1, _0223EE9C @ =0x021D110C
	ldr r3, [r1, #0x48]
	movs r1, #0x20
	adds r2, r3, #0
	tst r2, r1
	beq _0223EE18
	subs r1, #0x21
	bl ov83_02241208
	b _0223EE86
_0223EE18:
	movs r1, #0x10
	tst r1, r3
	beq _0223EE26
	movs r1, #1
	bl ov83_02241208
	b _0223EE86
_0223EE26:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223EE86
	ldr r0, _0223EE8C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov83_02241B18
	adds r0, r4, #0
	bl ov83_02240300
	movs r0, #1
	strb r0, [r4, #8]
	b _0223EE86
_0223EE46:
	ldr r1, _0223EE9C @ =0x021D110C
	ldr r3, [r1, #0x48]
	movs r1, #0x20
	adds r2, r3, #0
	tst r2, r1
	beq _0223EE5A
	subs r1, #0x21
	bl ov83_02241254
	b _0223EE86
_0223EE5A:
	movs r1, #0x10
	tst r1, r3
	beq _0223EE68
	movs r1, #1
	bl ov83_02241254
	b _0223EE86
_0223EE68:
	bl ov83_02247CF0
	cmp r0, #1
	bne _0223EE86
	ldr r0, _0223EE8C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov83_02241B18
	adds r0, r4, #0
	bl ov83_02240300
	movs r0, #1
	strb r0, [r4, #8]
_0223EE86:
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0223EE8C: .4byte 0x000005DC
_0223EE90: .4byte 0x0000084C
_0223EE94: .4byte 0x00000508
_0223EE98: .4byte 0x00000868
_0223EE9C: .4byte 0x021D110C
	thumb_func_end ov83_0223E14C

	thumb_func_start ov83_0223EEA0
ov83_0223EEA0: @ 0x0223EEA0
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #4
	bhi _0223EF96
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223EEB6: @ jump table
	.2byte _0223EEC0 - _0223EEB6 - 2 @ case 0
	.2byte _0223EEF2 - _0223EEB6 - 2 @ case 1
	.2byte _0223EF1E - _0223EEB6 - 2 @ case 2
	.2byte _0223EF40 - _0223EEB6 - 2 @ case 3
	.2byte _0223EF5E - _0223EEB6 - 2 @ case 4
_0223EEC0:
	ldrb r1, [r4, #0xe]
	movs r0, #0x60
	ldr r2, _0223EF9C @ =0x00000868
	bics r1, r0
	strb r1, [r4, #0xe]
	movs r0, #2
	movs r1, #0
	adds r2, r4, r2
	bl ov83_022477EC
	ldrb r2, [r4, #0xd]
	adds r0, r4, #0
	movs r1, #0xb
	bl ov83_02241368
	cmp r0, #1
	bne _0223EF96
	ldrb r1, [r4, #0xe]
	movs r0, #2
	bics r1, r0
	strb r1, [r4, #0xe]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223EF96
_0223EEF2:
	ldrb r1, [r4, #0x12]
	cmp r1, #0xff
	beq _0223EF96
	movs r1, #0
	strb r1, [r4, #0xf]
	ldrb r2, [r4, #0x13]
	cmp r2, #4
	beq _0223EF06
	cmp r2, #8
	bne _0223EF10
_0223EF06:
	ldrb r1, [r4, #0x12]
	adds r0, r4, #0
	bl ov83_02241BC4
	b _0223EF16
_0223EF10:
	ldrb r1, [r4, #0x12]
	bl ov83_022418E8
_0223EF16:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223EF96
_0223EF1E:
	ldrb r0, [r4, #0x15]
	ldrb r1, [r4, #0x12]
	bl ov83_0224776C
	adds r1, r0, #0
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02240FAC
	cmp r0, #1
	bne _0223EF96
	movs r0, #0x1e
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223EF96
_0223EF40:
	ldrb r0, [r4, #0xb]
	subs r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0223EF96
	bl FUN_02037BEC
	movs r0, #0x82
	bl FUN_02037AC0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223EF96
_0223EF5E:
	movs r0, #0x82
	bl FUN_02037B38
	cmp r0, #1
	bne _0223EF96
	bl FUN_02037BEC
	movs r0, #0x6b
	bl FUN_020379A0
	movs r0, #0xff
	strb r0, [r4, #0x12]
	ldrb r0, [r4, #0xe]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1e
	bne _0223EF8C
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02241354
	adds r0, r4, #0
	bl ov83_02240290
_0223EF8C:
	ldr r0, _0223EFA0 @ =0x000007FE
	movs r1, #0
	strb r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
_0223EF96:
	movs r0, #0
	pop {r4, pc}
	nop
_0223EF9C: .4byte 0x00000868
_0223EFA0: .4byte 0x000007FE
	thumb_func_end ov83_0223EEA0

	thumb_func_start ov83_0223EFA4
ov83_0223EFA4: @ 0x0223EFA4
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _0223EFB8
	cmp r1, #1
	beq _0223EFD0
	cmp r1, #2
	beq _0223EFF2
	b _0223F00C
_0223EFB8:
	movs r1, #0xd
	movs r2, #0
	bl ov83_02241368
	cmp r0, #1
	bne _0223F00C
	movs r0, #0x1e
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223F00C
_0223EFD0:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _0223EFDA
	subs r0, r0, #1
	strb r0, [r4, #0xb]
_0223EFDA:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0223F00C
	bl FUN_02037BEC
	movs r0, #0x83
	bl FUN_02037AC0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223F00C
_0223EFF2:
	movs r0, #0x83
	bl FUN_02037B38
	cmp r0, #1
	bne _0223F00C
	bl FUN_02037BEC
	adds r4, #0xb0
	adds r0, r4, #0
	bl ov83_02241354
	movs r0, #1
	pop {r4, pc}
_0223F00C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov83_0223EFA4

	thumb_func_start ov83_0223F010
ov83_0223F010: @ 0x0223F010
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _0223F022
	cmp r0, #1
	beq _0223F042
	b _0223F050
_0223F022:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223F050
_0223F042:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223F050
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_0223F050:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov83_0223F010

	thumb_func_start ov83_0223F058
ov83_0223F058: @ 0x0223F058
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0223F18C @ =0x0000084C
	adds r0, r5, r0
	bl ov83_02247858
	ldr r0, _0223F190 @ =0x0000083C
	ldr r0, [r5, r0]
	bl ov83_02247CC4
	ldr r0, _0223F194 @ =0x00000838
	ldr r0, [r5, r0]
	bl ov83_02247A18
	ldr r0, _0223F198 @ =0x00000734
	ldr r0, [r5, r0]
	bl ov83_0224753C
	ldr r0, _0223F19C @ =0x00000738
	ldr r0, [r5, r0]
	bl ov83_0224753C
	ldr r0, _0223F1A0 @ =0x00000778
	ldr r0, [r5, r0]
	bl ov83_0224753C
	movs r0, #0x76
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl ov83_0224753C
	ldr r0, _0223F1A4 @ =0x00000764
	ldr r0, [r5, r0]
	bl ov83_0224753C
	ldr r0, _0223F1A8 @ =0x0000077C
	ldr r0, [r5, r0]
	bl ov83_0224753C
	movs r0, #0x1e
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl ov83_0224753C
	ldr r0, _0223F1AC @ =0x0000079C
	ldr r0, [r5, r0]
	bl ov83_0224753C
	ldrb r0, [r5, #9]
	movs r1, #1
	bl FUN_02237B24
	adds r7, r0, #0
	movs r6, #0
	cmp r7, #0
	ble _0223F0EA
	adds r4, r5, #0
_0223F0CA:
	ldr r0, _0223F1B0 @ =0x0000073C
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, _0223F1B4 @ =0x0000074C
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, _0223F1B8 @ =0x00000768
	ldr r0, [r4, r0]
	bl ov83_0224753C
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r7
	blt _0223F0CA
_0223F0EA:
	ldr r7, _0223F1BC @ =0x00000784
	movs r6, #0
	adds r4, r5, #0
_0223F0F0:
	ldr r0, [r4, r7]
	bl ov83_0224753C
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #6
	blt _0223F0F0
	bl FUN_0203A914
	movs r0, #5
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_02003150
	movs r0, #5
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02003150
	movs r0, #5
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	bl FUN_02003104
	movs r0, #5
	movs r1, #0
	lsls r0, r0, #8
	str r1, [r5, r0]
	adds r0, #0x18
	adds r0, r5, r0
	bl ov83_022471FC
	ldr r0, [r5, #0x20]
	bl FUN_0200BB44
	ldr r0, [r5, #0x1c]
	bl FUN_0200BB44
	ldr r0, [r5, #0x24]
	bl FUN_0200BDA0
	ldr r0, [r5, #0x28]
	bl FUN_02026380
	ldr r0, [r5, #0x2c]
	bl FUN_02026380
	ldr r0, _0223F1C0 @ =0x00000504
	ldr r0, [r5, r0]
	bl FUN_0200CD94
	movs r0, #4
	bl FUN_02002DB4
	movs r6, #0
	adds r4, r5, #0
_0223F164:
	ldr r0, [r4, #0x30]
	bl FUN_02026380
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #3
	blt _0223F164
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
	bl ov83_0224791C
	ldr r0, [r5, #0x4c]
	bl ov83_0223F734
	ldr r0, _0223F1C4 @ =0x000007A8
	ldr r0, [r5, r0]
	bl FUN_0200770C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223F18C: .4byte 0x0000084C
_0223F190: .4byte 0x0000083C
_0223F194: .4byte 0x00000838
_0223F198: .4byte 0x00000734
_0223F19C: .4byte 0x00000738
_0223F1A0: .4byte 0x00000778
_0223F1A4: .4byte 0x00000764
_0223F1A8: .4byte 0x0000077C
_0223F1AC: .4byte 0x0000079C
_0223F1B0: .4byte 0x0000073C
_0223F1B4: .4byte 0x0000074C
_0223F1B8: .4byte 0x00000768
_0223F1BC: .4byte 0x00000784
_0223F1C0: .4byte 0x00000504
_0223F1C4: .4byte 0x000007A8
	thumb_func_end ov83_0223F058

	thumb_func_start ov83_0223F1C8
ov83_0223F1C8: @ 0x0223F1C8
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
	ldr r0, _0223F1F8 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _0223F1FC @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_0223F1F8: .4byte 0xFFFFE0FF
_0223F1FC: .4byte 0x04001000
	thumb_func_end ov83_0223F1C8

	thumb_func_start ov83_0223F200
ov83_0223F200: @ 0x0223F200
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r5, r0, #0
	movs r0, #0xb7
	movs r1, #0x6b
	bl FUN_02007688
	ldr r1, _0223F594 @ =0x000007A8
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov83_0223F690
	adds r0, r5, #0
	bl ov83_0223F70C
	movs r0, #4
	movs r1, #0x6b
	bl FUN_02002CEC
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0x1f
	movs r3, #0x6b
	bl FUN_0200BAF8
	str r0, [r5, #0x20]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xdd
	movs r3, #0x6b
	bl FUN_0200BAF8
	str r0, [r5, #0x1c]
	movs r0, #0x6b
	bl FUN_0200BD08
	str r0, [r5, #0x24]
	movs r0, #0x96
	lsls r0, r0, #2
	movs r1, #0x6b
	bl FUN_02026354
	str r0, [r5, #0x28]
	movs r0, #0x96
	lsls r0, r0, #2
	movs r1, #0x6b
	bl FUN_02026354
	str r0, [r5, #0x2c]
	movs r6, #0
	adds r4, r5, #0
	movs r7, #0x20
_0223F268:
	adds r0, r7, #0
	movs r1, #0x6b
	bl FUN_02026354
	str r0, [r4, #0x30]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #3
	blt _0223F268
	movs r1, #7
	movs r0, #0
	lsls r1, r1, #6
	movs r2, #0x6b
	bl FUN_02003030
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x6b
	bl FUN_0200304C
	movs r0, #1
	movs r1, #2
	movs r2, #0
	movs r3, #0x6b
	bl FUN_0200CC74
	ldr r1, _0223F598 @ =0x00000504
	movs r2, #0
	str r0, [r5, r1]
	adds r1, r5, #0
	ldr r0, [r5, #0x4c]
	adds r1, #0x50
	bl ov83_022478D4
	add r0, sp, #0x30
	add r1, sp, #0x34
	add r3, sp, #0x30
	str r0, [sp]
	adds r0, r5, #0
	adds r1, #2
	add r2, sp, #0x34
	adds r3, #2
	bl ov83_02240F7C
	movs r1, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #0xa0
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	ldr r0, _0223F59C @ =0x00000518
	str r1, [sp, #0xc]
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0223F5A0 @ =0x00000734
	str r0, [r5, r1]
	movs r1, #0
	movs r0, #5
	str r0, [sp]
	movs r0, #0xa0
	str r0, [sp, #4]
	movs r0, #0x7c
	str r0, [sp, #8]
	ldr r0, _0223F59C @ =0x00000518
	str r1, [sp, #0xc]
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0223F5A4 @ =0x00000738
	str r0, [r5, r1]
	subs r0, r1, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov83_0224755C
	ldr r0, _0223F5A4 @ =0x00000738
	movs r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224755C
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _0223F32C
	movs r0, #0x48
	movs r7, #0x40
	str r0, [sp, #0x18]
	b _0223F332
_0223F32C:
	movs r0, #0x28
	movs r7, #0x20
	str r0, [sp, #0x18]
_0223F332:
	ldrb r0, [r5, #9]
	movs r1, #1
	bl FUN_02237B24
	movs r6, #0
	str r0, [sp, #0x14]
	cmp r0, #0
	bgt _0223F344
	b _0223F45C
_0223F344:
	adds r4, r5, #0
_0223F346:
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x18]
	movs r1, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x3e
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, _0223F59C @ =0x00000518
	adds r2, r1, #0
	adds r0, r5, r0
	adds r3, r1, #0
	bl ov83_02247454
	ldr r1, _0223F5A8 @ =0x0000074C
	str r0, [r4, r1]
	adds r0, r1, #0
	adds r0, #0x58
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	str r0, [sp, #0x1c]
	bl FUN_0206E540
	cmp r0, #0
	bne _0223F394
	ldr r0, _0223F5A8 @ =0x0000074C
	movs r1, #0
	ldr r0, [r4, r0]
	bl ov83_0224755C
_0223F394:
	ldr r0, [sp, #0x1c]
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x30
	bl FUN_020880B0
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov83_022411B0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x30
	bl FUN_020880B0
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov83_022411DC
	movs r1, #0
	str r0, [sp]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x4e
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, _0223F59C @ =0x00000518
	adds r2, r1, #0
	adds r0, r5, r0
	adds r3, r1, #0
	bl ov83_02247454
	ldr r1, _0223F5AC @ =0x00000768
	movs r2, #0xa
	str r0, [r4, r1]
	ldr r0, [sp, #0x28]
	adds r1, r6, #0
	str r0, [sp]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x3a
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, _0223F59C @ =0x00000518
	adds r1, #0xa
	adds r0, r5, r0
	movs r3, #5
	bl ov83_02247454
	ldr r1, _0223F5B0 @ =0x0000073C
	str r0, [r4, r1]
	adds r0, r1, #0
	adds r0, #0x68
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_02074644
	adds r1, r0, #0
	ldr r0, _0223F5B0 @ =0x0000073C
	ldr r0, [r4, r0]
	bl ov83_022475EC
	ldr r0, [sp, #0x18]
	adds r6, r6, #1
	adds r0, #0x40
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	adds r4, r4, #4
	adds r7, #0x40
	cmp r6, r0
	bge _0223F45C
	b _0223F346
_0223F45C:
	movs r1, #0
	str r1, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0xa0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0223F59C @ =0x00000518
	str r1, [sp, #0x10]
	movs r1, #3
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov83_022474C4
	ldr r1, _0223F5B4 @ =0x0000079C
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #0
	bl ov83_0224755C
	movs r4, #0
	adds r6, r5, #0
	adds r7, r4, #0
_0223F48C:
	add r1, sp, #0x2c
	adds r0, r4, #0
	adds r1, #2
	add r2, sp, #0x2c
	bl ov83_02242894
	str r7, [sp]
	add r1, sp, #0x2c
	movs r0, #2
	ldrsh r0, [r1, r0]
	movs r3, #4
	str r0, [sp, #4]
	movs r0, #0
	ldrsh r0, [r1, r0]
	adds r1, r4, #4
	adds r2, r1, #0
	str r0, [sp, #8]
	ldr r0, _0223F59C @ =0x00000518
	str r7, [sp, #0xc]
	adds r0, r5, r0
	str r7, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0223F5B8 @ =0x00000784
	str r0, [r6, r1]
	adds r0, r1, #0
	ldr r0, [r6, r0]
	movs r1, #0
	bl ov83_0224755C
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #6
	blt _0223F48C
	adds r0, r5, #0
	add r1, sp, #0x3c
	add r2, sp, #0x38
	movs r3, #0
	bl ov83_02240E70
	movs r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	movs r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	adds r2, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	ldr r0, _0223F59C @ =0x00000518
	adds r3, r1, #0
	adds r0, r5, r0
	str r1, [sp, #0x10]
	bl ov83_02247454
	movs r1, #0x76
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	ldr r1, [sp, #0x3c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	ldr r1, [sp, #0x38]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #8]
	movs r1, #0
	str r0, [sp, #0xc]
	ldr r0, _0223F59C @ =0x00000518
	adds r2, r1, #0
	adds r0, r5, r0
	adds r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0223F5BC @ =0x00000764
	str r0, [r5, r1]
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _0223F548
	ldr r0, _0223F5BC @ =0x00000764
	movs r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224755C
_0223F548:
	movs r0, #0xb
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _0223F59C @ =0x00000518
	str r1, [sp, #0xc]
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0223F5C0 @ =0x00000778
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #0
	bl ov83_0224755C
	movs r1, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, _0223F59C @ =0x00000518
	adds r2, r1, #0
	adds r0, r5, r0
	adds r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0223F5C4 @ =0x0000077C
	b _0223F5C8
	nop
_0223F594: .4byte 0x000007A8
_0223F598: .4byte 0x00000504
_0223F59C: .4byte 0x00000518
_0223F5A0: .4byte 0x00000734
_0223F5A4: .4byte 0x00000738
_0223F5A8: .4byte 0x0000074C
_0223F5AC: .4byte 0x00000768
_0223F5B0: .4byte 0x0000073C
_0223F5B4: .4byte 0x0000079C
_0223F5B8: .4byte 0x00000784
_0223F5BC: .4byte 0x00000764
_0223F5C0: .4byte 0x00000778
_0223F5C4: .4byte 0x0000077C
_0223F5C8:
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #0
	bl ov83_0224755C
	adds r0, r5, #0
	bl ov83_02241E18
	adds r0, r5, #0
	bl ov83_02241FF0
	adds r0, r5, #0
	movs r1, #1
	bl ov83_022421E0
	movs r1, #0
	str r1, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	movs r0, #0x28
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0223F67C @ =0x00000518
	str r1, [sp, #0x10]
	movs r1, #2
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov83_022474C4
	movs r3, #0x1e
	lsls r3, r3, #6
	adds r2, r3, #0
	str r0, [r5, r3]
	adds r1, r3, #0
	adds r2, #0x8c
	ldr r0, [r5, r3]
	adds r1, #0x88
	adds r3, #0x94
	ldrh r2, [r5, r2]
	ldr r1, [r5, r1]
	ldr r3, [r5, r3]
	bl ov83_02247668
	ldrb r2, [r5, #0x14]
	adds r0, r5, #0
	movs r1, #1
	bl ov83_02247A24
	ldr r1, _0223F680 @ =0x00000838
	str r0, [r5, r1]
	ldr r1, _0223F67C @ =0x00000518
	ldr r0, [r5, r1]
	subs r1, #0x18
	ldr r1, [r5, r1]
	bl ov83_02247CB8
	ldr r1, _0223F684 @ =0x0000083C
	str r0, [r5, r1]
	adds r1, #0x10
	adds r0, r5, r1
	bl ov83_02247844
	bl FUN_02037474
	cmp r0, #0
	beq _0223F660
	movs r0, #1
	movs r1, #0x10
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	bl FUN_0203A880
_0223F660:
	movs r0, #0xa
	str r0, [sp]
	ldr r0, _0223F688 @ =0x04000050
	movs r1, #0
	movs r2, #0xe
	movs r3, #6
	blx FUN_020CF15C
	ldr r0, _0223F68C @ =ov83_0223F7A0
	adds r1, r5, #0
	bl FUN_0201A0FC
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223F67C: .4byte 0x00000518
_0223F680: .4byte 0x00000838
_0223F684: .4byte 0x0000083C
_0223F688: .4byte 0x04000050
_0223F68C: .4byte ov83_0223F7A0
	thumb_func_end ov83_0223F200

	thumb_func_start ov83_0223F690
ov83_0223F690: @ 0x0223F690
	push {r4, lr}
	ldr r2, _0223F700 @ =0x04000304
	adds r4, r0, #0
	ldrh r1, [r2]
	ldr r0, _0223F704 @ =0xFFFF7FFF
	ands r0, r1
	strh r0, [r2]
	bl ov83_0223F7E4
	ldr r0, [r4, #0x4c]
	bl ov83_0223F804
	movs r0, #0x6b
	bl FUN_020030E8
	movs r1, #5
	lsls r1, r1, #8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #2
	lsls r2, r1, #8
	movs r3, #0x6b
	bl FUN_02003120
	movs r0, #5
	lsls r0, r0, #8
	movs r2, #2
	ldr r0, [r4, r0]
	movs r1, #0
	lsls r2, r2, #8
	movs r3, #0x6b
	bl FUN_02003120
	adds r0, r4, #0
	movs r1, #3
	bl ov83_0223FA00
	bl ov83_0223FA74
	adds r0, r4, #0
	movs r1, #2
	bl ov83_0223FAA8
	bl ov83_0223FAF0
	ldr r2, _0223F708 @ =0x00000868
	movs r0, #2
	movs r1, #0
	adds r2, r4, r2
	bl ov83_022477EC
	adds r0, r4, #0
	movs r1, #4
	bl ov83_0223FBEC
	pop {r4, pc}
	.align 2, 0
_0223F700: .4byte 0x04000304
_0223F704: .4byte 0xFFFF7FFF
_0223F708: .4byte 0x00000868
	thumb_func_end ov83_0223F690

	thumb_func_start ov83_0223F70C
ov83_0223F70C: @ 0x0223F70C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	adds r2, r0, #0
	ldr r1, _0223F72C @ =0x000007A4
	ldr r0, _0223F730 @ =0x00000518
	lsls r2, r2, #0x18
	ldr r1, [r4, r1]
	adds r0, r4, r0
	lsrs r2, r2, #0x18
	bl ov83_02246E08
	pop {r4, pc}
	nop
_0223F72C: .4byte 0x000007A4
_0223F730: .4byte 0x00000518
	thumb_func_end ov83_0223F70C

	thumb_func_start ov83_0223F734
ov83_0223F734: @ 0x0223F734
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
	movs r1, #0
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
	ldr r2, _0223F79C @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_0223F79C: .4byte 0x04000304
	thumb_func_end ov83_0223F734

	thumb_func_start ov83_0223F7A0
ov83_0223F7A0: @ 0x0223F7A0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223F7B2
	bl FUN_0200398C
_0223F7B2:
	ldr r0, [r4, #0x4c]
	bl FUN_0201EEB4
	ldr r0, _0223F7D8 @ =0x00000868
	adds r0, r4, r0
	bl ov83_0224780C
	bl FUN_0202061C
	bl FUN_0200B224
	ldr r3, _0223F7DC @ =0x027E0000
	ldr r1, _0223F7E0 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_0223F7D8: .4byte 0x00000868
_0223F7DC: .4byte 0x027E0000
_0223F7E0: .4byte 0x00003FF8
	thumb_func_end ov83_0223F7A0

	thumb_func_start ov83_0223F7E4
ov83_0223F7E4: @ 0x0223F7E4
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0223F800 @ =0x02247E88
	add r3, sp, #0
	movs r2, #5
_0223F7EE:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0223F7EE
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_0223F800: .4byte 0x02247E88
	thumb_func_end ov83_0223F7E4

	thumb_func_start ov83_0223F804
ov83_0223F804: @ 0x0223F804
	push {r3, r4, r5, lr}
	sub sp, #0xf0
	ldr r5, _0223F9D8 @ =0x02247D38
	add r3, sp, #0xe0
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _0223F9DC @ =0x02247DA0
	add r3, sp, #0xc4
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
	movs r3, #0x6b
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _0223F9E0 @ =0x02247DBC
	add r3, sp, #0xa8
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #0
	str r0, [r3]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_0201B1E4
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x6b
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _0223F9E4 @ =0x02247DF4
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
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x6b
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _0223F9E8 @ =0x02247E10
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
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x6b
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	ldr r5, _0223F9EC @ =0x02247E2C
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
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _0223F9F0 @ =0x02247E48
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
	movs r3, #0x6b
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201CAE0
	ldr r5, _0223F9F4 @ =0x02247D84
	add r3, sp, #0x1c
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	adds r0, r4, #0
	movs r1, #6
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x6b
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201CAE0
	ldr r5, _0223F9F8 @ =0x02247DD8
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
	movs r0, #7
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x6b
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201CAE0
	ldr r1, _0223F9FC @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	strh r2, [r1]
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #0
	bl FUN_02022CC8
	add sp, #0xf0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223F9D8: .4byte 0x02247D38
_0223F9DC: .4byte 0x02247DA0
_0223F9E0: .4byte 0x02247DBC
_0223F9E4: .4byte 0x02247DF4
_0223F9E8: .4byte 0x02247E10
_0223F9EC: .4byte 0x02247E2C
_0223F9F0: .4byte 0x02247E48
_0223F9F4: .4byte 0x02247D84
_0223F9F8: .4byte 0x02247DD8
_0223F9FC: .4byte 0x04000008
	thumb_func_end ov83_0223F804

	thumb_func_start ov83_0223FA00
ov83_0223FA00: @ 0x0223FA00
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FA70 @ =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	movs r1, #0x22
	adds r3, r4, #0
	bl FUN_02007B44
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _0223FA4E
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FA70 @ =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	movs r1, #0x23
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0223FA4E:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FA70 @ =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	movs r1, #0x24
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223FA70: .4byte 0x000007A8
	thumb_func_end ov83_0223FA00

	thumb_func_start ov83_0223FA74
ov83_0223FA74: @ 0x0223FA74
	push {r3, r4, lr}
	sub sp, #4
	movs r0, #0xb7
	movs r1, #0x9c
	add r2, sp, #0
	movs r3, #0x6b
	bl FUN_020079F4
	adds r4, r0, #0
	ldr r0, [sp]
	movs r1, #0xe0
	ldr r0, [r0, #0xc]
	blx DC_FlushRange
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0, #0xc]
	movs r2, #0xe0
	blx FUN_020CFC6C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov83_0223FA74

	thumb_func_start ov83_0223FAA8
ov83_0223FAA8: @ 0x0223FAA8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FAEC @ =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	movs r1, #0x22
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FAEC @ =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	movs r1, #0x2a
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223FAEC: .4byte 0x000007A8
	thumb_func_end ov83_0223FAA8

	thumb_func_start ov83_0223FAF0
ov83_0223FAF0: @ 0x0223FAF0
	push {r3, r4, lr}
	sub sp, #4
	movs r0, #0xb7
	movs r1, #0x9c
	add r2, sp, #0
	movs r3, #0x6b
	bl FUN_020079F4
	adds r4, r0, #0
	ldr r0, [sp]
	movs r1, #0x80
	ldr r0, [r0, #0xc]
	blx DC_FlushRange
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0, #0xc]
	movs r2, #0x80
	blx FUN_020CFC6C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov83_0223FAF0

	thumb_func_start ov83_0223FB24
ov83_0223FB24: @ 0x0223FB24
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FB68 @ =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	movs r1, #0x22
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FB68 @ =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	movs r1, #0x2b
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223FB68: .4byte 0x000007A8
	thumb_func_end ov83_0223FB24

	thumb_func_start ov83_0223FB6C
ov83_0223FB6C: @ 0x0223FB6C
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FBE8 @ =0x000007A8
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, r0]
	movs r1, #0x22
	movs r3, #2
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FBE8 @ =0x000007A8
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, r0]
	movs r1, #0x26
	movs r3, #2
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FBE8 @ =0x000007A8
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, r0]
	movs r1, #0x28
	movs r3, #6
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FBE8 @ =0x000007A8
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, r0]
	movs r1, #0x29
	movs r3, #6
	bl FUN_02007B68
	add sp, #0x10
	pop {r4, pc}
	nop
_0223FBE8: .4byte 0x000007A8
	thumb_func_end ov83_0223FB6C

	thumb_func_start ov83_0223FBEC
ov83_0223FBEC: @ 0x0223FBEC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FC44 @ =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	movs r1, #0x28
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	ldr r0, _0223FC44 @ =0x000007A8
	ldr r2, [r5, #0x4c]
	ldr r0, [r5, r0]
	movs r1, #0x93
	adds r3, r4, #0
	bl FUN_02007B68
	movs r3, #0
	str r3, [sp]
	movs r0, #0x6b
	str r0, [sp, #4]
	ldr r0, _0223FC44 @ =0x000007A8
	movs r1, #0xbe
	ldr r0, [r5, r0]
	movs r2, #4
	bl FUN_02007B8C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223FC44: .4byte 0x000007A8
	thumb_func_end ov83_0223FBEC

	thumb_func_start ov83_0223FC48
ov83_0223FC48: @ 0x0223FC48
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
	ldr r0, [r5, #0x20]
	ldr r2, [r5, #0x2c]
	adds r1, r6, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
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
	ldr r2, [r5, #0x28]
	adds r0, r4, #0
	bl FUN_020200FC
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov83_0223FC48

	thumb_func_start ov83_0223FCB4
ov83_0223FCB4: @ 0x0223FCB4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, [r5, #0x20]
	ldr r2, [r5, #0x2c]
	adds r6, r3, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	bl FUN_0200CBBC
	ldr r0, [sp, #0x20]
	add r2, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x24]
	adds r3, r6, #0
	str r0, [sp, #4]
	add r0, sp, #0x30
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
	add r1, sp, #0x34
	ldrb r1, [r1]
	ldr r2, [r5, #0x28]
	adds r0, r4, #0
	bl FUN_020200FC
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r0, r5, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov83_0223FCB4

	thumb_func_start ov83_0223FD14
ov83_0223FD14: @ 0x0223FD14
	push {r3, r4, r5, lr}
	sub sp, #0x18
	movs r3, #1
	adds r4, r1, #0
	str r3, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r3, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	movs r1, #0xf
	str r1, [sp, #0x10]
	adds r5, r0, #0
	adds r1, r5, #0
	str r2, [sp, #0x14]
	adds r1, #0xb0
	adds r2, r4, #0
	bl ov83_0223FC48
	adds r5, #0xb0
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov83_0223FD14

	thumb_func_start ov83_0223FD4C
ov83_0223FD4C: @ 0x0223FD4C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r6, #0
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	adds r2, r0, #0
	ldr r0, [r5, #0x24]
	movs r1, #0
	bl FUN_0200C0CC
	movs r0, #8
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x46
	movs r3, #1
	bl ov83_0223FF20
	movs r0, #8
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x47
	movs r3, #0x40
	bl ov83_0223FF20
	adds r0, r6, #0
	bl FUN_0206FDFC
	adds r2, r0, #0
	ldr r0, [r5, #0x24]
	movs r1, #0
	bl FUN_0200C098
	movs r0, #0x18
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x48
	movs r3, #1
	bl ov83_0223FF20
	movs r0, #0x18
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x49
	movs r3, #0x40
	bl ov83_0223FF20
	adds r0, r6, #0
	movs r1, #0xa
	movs r2, #0
	bl FUN_0206E540
	adds r2, r0, #0
	ldr r0, [r5, #0x24]
	movs r1, #0
	bl FUN_0200C060
	movs r0, #0x28
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x4a
	movs r3, #1
	bl ov83_0223FF20
	movs r0, #0x28
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x4b
	movs r3, #0x40
	bl ov83_0223FF20
	adds r0, r6, #0
	movs r1, #0xa5
	movs r2, #0
	bl FUN_0206E540
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	movs r3, #3
	bl ov83_02240C48
	movs r0, #0x38
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x4c
	movs r3, #1
	bl ov83_0223FF20
	movs r3, #0x38
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x4d
	str r3, [sp]
	bl ov83_0223FF20
	adds r0, r6, #0
	movs r1, #0xa6
	movs r2, #0
	bl FUN_0206E540
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	movs r3, #3
	bl ov83_02240C48
	movs r0, #0x38
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x4e
	movs r3, #0x58
	bl ov83_0223FF20
	movs r0, #0x38
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x4f
	movs r3, #0x90
	bl ov83_0223FF20
	adds r0, r6, #0
	movs r1, #0xa8
	movs r2, #0
	bl FUN_0206E540
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	movs r3, #3
	bl ov83_02240C48
	movs r0, #0x48
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x50
	movs r3, #1
	bl ov83_0223FF20
	movs r0, #0x48
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x51
	movs r3, #0x38
	bl ov83_0223FF20
	adds r0, r6, #0
	movs r1, #0xa9
	movs r2, #0
	bl FUN_0206E540
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	movs r3, #3
	bl ov83_02240C48
	movs r0, #0x48
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x52
	movs r3, #0x58
	bl ov83_0223FF20
	movs r0, #0x48
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x53
	movs r3, #0x90
	bl ov83_0223FF20
	adds r0, r6, #0
	movs r1, #0xa7
	movs r2, #0
	bl FUN_0206E540
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	movs r3, #3
	bl ov83_02240C48
	movs r0, #0x58
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x54
	movs r3, #1
	bl ov83_0223FF20
	movs r0, #0x58
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x55
	movs r3, #0x38
	bl ov83_0223FF20
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov83_0223FD4C

	thumb_func_start ov83_0223FF20
ov83_0223FF20: @ 0x0223FF20
	push {r4, lr}
	sub sp, #0x18
	add r4, sp, #0x10
	ldrh r4, [r4, #0x10]
	str r4, [sp]
	movs r4, #0xff
	str r4, [sp, #4]
	movs r4, #1
	str r4, [sp, #8]
	movs r4, #2
	str r4, [sp, #0xc]
	movs r4, #0
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	bl ov83_0223FCB4
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov83_0223FF20

	thumb_func_start ov83_0223FF44
ov83_0223FF44: @ 0x0223FF44
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r4, r2, #0
	bl FUN_0201D978
	movs r0, #0x64
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x36
	str r0, [sp, #8]
	movs r0, #0x3a
	str r0, [sp, #0xc]
	movs r0, #0x42
	str r0, [sp, #0x10]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x60
	bl ov83_0223FFD8
	movs r0, #0x64
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x37
	str r0, [sp, #8]
	movs r0, #0x3b
	str r0, [sp, #0xc]
	movs r0, #0x43
	str r0, [sp, #0x10]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #0x61
	bl ov83_0223FFD8
	movs r0, #0x64
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x38
	str r0, [sp, #8]
	movs r0, #0x3c
	str r0, [sp, #0xc]
	movs r0, #0x44
	str r0, [sp, #0x10]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #0x62
	bl ov83_0223FFD8
	movs r0, #0x64
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	movs r0, #0x45
	str r0, [sp, #0x10]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #0x63
	bl ov83_0223FFD8
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov83_0223FF44

	thumb_func_start ov83_0223FFD8
ov83_0223FFD8: @ 0x0223FFD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x38]
	movs r2, #0
	adds r7, r3, #0
	bl FUN_0206E540
	adds r2, r0, #0
	ldr r0, [r4, #0x24]
	adds r1, r5, #0
	bl FUN_0200BFF0
	movs r3, #0x18
	adds r0, r5, #0
	muls r0, r3, r0
	adds r0, #0xc
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	str r5, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov83_0223FCB4
	strb r0, [r4, #0xa]
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x3c]
	movs r2, #0
	bl FUN_0206E540
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #4
	movs r3, #3
	bl ov83_02240C48
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x40]
	movs r2, #0
	bl FUN_0206E540
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #5
	movs r3, #3
	bl ov83_02240C48
	str r5, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r2, [sp, #0x30]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x60
	bl ov83_0223FCB4
	strb r0, [r4, #0xa]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov83_0223FFD8

	thumb_func_start ov83_02240080
ov83_02240080: @ 0x02240080
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	adds r5, r0, #0
	adds r0, r7, #0
	movs r1, #0
	bl FUN_0201D978
	ldrb r0, [r5, #9]
	movs r1, #1
	bl FUN_02237B24
	adds r6, r0, #0
	movs r4, #0
	cmp r6, #0
	ble _022400B2
_0224009E:
	lsls r2, r4, #0x18
	adds r0, r5, #0
	adds r1, r7, #0
	lsrs r2, r2, #0x18
	movs r3, #0
	bl ov83_022400BC
	adds r4, r4, #1
	cmp r4, r6
	blt _0224009E
_022400B2:
	adds r0, r7, #0
	bl FUN_0201D5C8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov83_02240080

	thumb_func_start ov83_022400BC
ov83_022400BC: @ 0x022400BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, _02240168 @ =0x000007A4
	adds r4, r2, #0
	adds r6, r1, #0
	ldr r0, [r5, r0]
	adds r1, r4, #0
	adds r7, r3, #0
	bl FUN_02074644
	str r0, [sp, #0xc]
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _022400E2
	movs r0, #0x24
	b _022400E4
_022400E2:
	movs r0, #4
_022400E4:
	cmp r7, #0
	bne _0224010A
	lsls r1, r4, #6
	adds r2, r0, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	adds r2, r0, #0
	adds r2, #0x18
	adds r2, r2, r1
	adds r0, #0x20
	lsls r2, r2, #0x10
	adds r0, r0, r1
	lsrs r2, r2, #0x10
	lsls r0, r0, #0x10
	str r2, [sp, #0x10]
	lsrs r0, r0, #0x10
	movs r4, #1
	str r0, [sp, #0x14]
	b _02240116
_0224010A:
	movs r0, #0x1c
	str r0, [sp, #0x10]
	movs r0, #0x24
	movs r7, #4
	movs r4, #0
	str r0, [sp, #0x14]
_02240116:
	ldr r0, [sp, #0xc]
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	str r6, [sp]
	adds r1, r0, #0
	str r7, [sp, #4]
	ldr r0, _0224016C @ =0x00000504
	str r4, [sp, #8]
	ldr r0, [r5, r0]
	movs r2, #3
	movs r3, #1
	bl FUN_0200CDF0
	str r4, [sp]
	ldr r0, _0224016C @ =0x00000504
	ldr r3, [sp, #0x10]
	ldr r0, [r5, r0]
	movs r1, #0
	adds r2, r6, #0
	bl FUN_0200CDAC
	ldr r0, [sp, #0xc]
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	str r6, [sp]
	adds r1, r0, #0
	ldr r0, [sp, #0x14]
	movs r2, #3
	str r0, [sp, #4]
	ldr r0, _0224016C @ =0x00000504
	str r4, [sp, #8]
	ldr r0, [r5, r0]
	movs r3, #0
	bl FUN_0200CDF0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02240168: .4byte 0x000007A4
_0224016C: .4byte 0x00000504
	thumb_func_end ov83_022400BC

	thumb_func_start ov83_02240170
ov83_02240170: @ 0x02240170
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	adds r6, r1, #0
	movs r1, #1
	bl FUN_02237B24
	adds r7, r0, #0
	movs r4, #0
	cmp r7, #0
	ble _0224019A
_02240186:
	lsls r2, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	lsrs r2, r2, #0x18
	movs r3, #0
	bl ov83_022401A4
	adds r4, r4, #1
	cmp r4, r7
	blt _02240186
_0224019A:
	adds r0, r6, #0
	bl FUN_0201D5C8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov83_02240170

	thumb_func_start ov83_022401A4
ov83_022401A4: @ 0x022401A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	str r3, [sp, #0x14]
	ldrb r0, [r5, #9]
	str r1, [sp, #0x10]
	adds r6, r2, #0
	bl FUN_02237D8C
	cmp r0, #0
	bne _022401C0
	movs r4, #0x28
	movs r7, #0x50
	b _022401C4
_022401C0:
	movs r4, #8
	movs r7, #0x30
_022401C4:
	ldr r0, _02240230 @ =0x000007A4
	adds r1, r6, #0
	ldr r0, [r5, r0]
	bl FUN_02074644
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _022401E0
	lsls r0, r6, #6
	adds r6, r4, r0
	movs r4, #1
	adds r7, r7, r0
	b _022401E6
_022401E0:
	movs r6, #4
	movs r4, #0
	movs r7, #0x30
_022401E6:
	ldr r0, [sp, #0x18]
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	movs r1, #1
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, _02240234 @ =0x00000504
	str r4, [sp, #0xc]
	ldr r0, [r5, r0]
	movs r3, #3
	bl FUN_0200CE7C
	ldr r0, [sp, #0x18]
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0
	lsls r0, r0, #0x18
	str r1, [sp]
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	adds r2, r7, #0
	adds r3, r4, #0
	bl ov83_02240D64
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02240230: .4byte 0x000007A4
_02240234: .4byte 0x00000504
	thumb_func_end ov83_022401A4

	thumb_func_start ov83_02240238
ov83_02240238: @ 0x02240238
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	adds r6, r1, #0
	adds r4, r2, #0
	adds r7, r3, #0
	bl FUN_02237D8C
	cmp r0, #0
	bne _02240252
	movs r1, #0x24
	b _02240254
_02240252:
	movs r1, #4
_02240254:
	lsls r0, r4, #6
	adds r4, r1, r0
	movs r0, #0x18
	str r0, [sp]
	movs r0, #9
	movs r1, #0
	lsls r2, r4, #0x10
	str r0, [sp, #4]
	adds r0, r6, #0
	lsrs r2, r2, #0x10
	adds r3, r1, #0
	bl FUN_0201DA74
	str r6, [sp]
	str r4, [sp, #4]
	movs r3, #1
	ldr r0, _0224028C @ =0x00000504
	str r3, [sp, #8]
	ldr r0, [r5, r0]
	adds r1, r7, #0
	movs r2, #3
	bl FUN_0200CDF0
	adds r0, r6, #0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0224028C: .4byte 0x00000504
	thumb_func_end ov83_02240238

	thumb_func_start ov83_02240290
ov83_02240290: @ 0x02240290
	push {r4, lr}
	sub sp, #0x18
	movs r1, #5
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #2
	adds r4, r0, #0
	str r1, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	adds r1, r4, #0
	str r3, [sp, #0x14]
	adds r1, #0x60
	movs r2, #6
	bl ov83_0223FC48
	strb r0, [r4, #0xa]
	ldr r0, _022402F0 @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02247944
	movs r3, #1
	adds r1, r4, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r1, #0xc0
	movs r2, #5
	str r3, [sp, #0x14]
	bl ov83_0223FC48
	strb r0, [r4, #0xa]
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
_022402F0: .4byte 0x00000508
	thumb_func_end ov83_02240290

	thumb_func_start ov83_022402F4
ov83_022402F4: @ 0x022402F4
	ldr r3, _022402FC @ =ov83_02241354
	adds r0, #0xc0
	bx r3
	nop
_022402FC: .4byte ov83_02241354
	thumb_func_end ov83_022402F4

	thumb_func_start ov83_02240300
ov83_02240300: @ 0x02240300
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0224032C @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	movs r1, #1
	ldr r0, _02240330 @ =0x00000848
	mvns r1, r1
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov83_02242BAC
	adds r0, r4, #0
	bl ov83_02242DAC
	pop {r4, pc}
	.align 2, 0
_0224032C: .4byte 0x00000508
_02240330: .4byte 0x00000848
	thumb_func_end ov83_02240300

	thumb_func_start ov83_02240334
ov83_02240334: @ 0x02240334
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xb0
	bl ov83_02241354
	adds r0, r4, #0
	bl ov83_02242D5C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_02240334

	thumb_func_start ov83_02240348
ov83_02240348: @ 0x02240348
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02240374 @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	movs r1, #1
	ldr r0, _02240378 @ =0x00000848
	mvns r1, r1
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov83_02242BF0
	adds r0, r4, #0
	bl ov83_02242DFC
	pop {r4, pc}
	.align 2, 0
_02240374: .4byte 0x00000508
_02240378: .4byte 0x00000848
	thumb_func_end ov83_02240348

	thumb_func_start ov83_0224037C
ov83_0224037C: @ 0x0224037C
	ldr r3, _02240380 @ =ov83_02242D5C
	bx r3
	.align 2, 0
_02240380: .4byte ov83_02242D5C
	thumb_func_end ov83_0224037C

	thumb_func_start ov83_02240384
ov83_02240384: @ 0x02240384
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _022403B0 @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	movs r1, #1
	ldr r0, _022403B4 @ =0x00000848
	mvns r1, r1
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov83_02242CAC
	adds r0, r4, #0
	bl ov83_02242E88
	pop {r4, pc}
	.align 2, 0
_022403B0: .4byte 0x00000508
_022403B4: .4byte 0x00000848
	thumb_func_end ov83_02240384

	thumb_func_start ov83_022403B8
ov83_022403B8: @ 0x022403B8
	ldr r3, _022403BC @ =ov83_02242D5C
	bx r3
	.align 2, 0
_022403BC: .4byte ov83_02242D5C
	thumb_func_end ov83_022403B8

	thumb_func_start ov83_022403C0
ov83_022403C0: @ 0x022403C0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r1, [r5, #0xe]
	movs r0, #8
	orrs r0, r1
	strb r0, [r5, #0xe]
	adds r0, r5, #0
	adds r0, #0xb0
	bl ov83_02241354
	adds r0, r5, #0
	adds r0, #0xb0
	bl FUN_0201D8E4
	adds r0, r5, #0
	adds r0, #0xe0
	bl FUN_0201D8E4
	adds r0, r5, #0
	bl ov83_0223FB6C
	ldr r2, _02240428 @ =0x00000868
	movs r0, #2
	movs r1, #1
	adds r2, r5, r2
	bl ov83_022477EC
	ldr r2, _02240428 @ =0x00000868
	movs r0, #6
	movs r1, #1
	adds r2, r5, r2
	bl ov83_022477EC
	ldr r2, _02240428 @ =0x00000868
	movs r0, #7
	movs r1, #1
	adds r2, r5, r2
	bl ov83_022477EC
	movs r0, #0x86
	movs r1, #0
	lsls r0, r0, #4
	strb r1, [r5, r0]
	adds r0, r0, #2
	strh r1, [r5, r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov83_02240B54
	pop {r3, r4, r5, pc}
	nop
_02240428: .4byte 0x00000868
	thumb_func_end ov83_022403C0

	thumb_func_start ov83_0224042C
ov83_0224042C: @ 0x0224042C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0xe]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _022404F8
	adds r6, r5, #0
	movs r4, #0
	adds r6, #0x50
_02240440:
	adds r0, r4, #0
	adds r0, #0x30
	lsls r0, r0, #4
	adds r0, r6, r0
	bl FUN_0201D8E4
	adds r4, r4, #1
	cmp r4, #6
	blo _02240440
	movs r0, #0x3b
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8E4
	movs r0, #0xf
	lsls r0, r0, #6
	adds r0, r5, r0
	bl FUN_0201D8E4
	movs r0, #0x3f
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8E4
	movs r0, #1
	lsls r0, r0, #0xa
	adds r0, r5, r0
	bl FUN_0201D8E4
	movs r0, #0x41
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8E4
	ldr r2, _022404FC @ =0x00000868
	movs r0, #2
	movs r1, #0
	adds r2, r5, r2
	bl ov83_022477EC
	ldr r2, _022404FC @ =0x00000868
	movs r0, #6
	movs r1, #0
	adds r2, r5, r2
	bl ov83_022477EC
	ldr r2, _022404FC @ =0x00000868
	movs r0, #7
	movs r1, #0
	adds r2, r5, r2
	bl ov83_022477EC
	ldr r0, _02240500 @ =0x0000085C
	ldr r0, [r5, r0]
	bl ov83_02247A18
	ldr r0, _02240504 @ =0x000004DC
	ldr r0, [r5, r0]
	bl FUN_02014950
	ldr r0, _02240508 @ =0x0000077C
	movs r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224755C
	ldr r0, _0224050C @ =0x0000079C
	movs r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224755C
	ldr r7, _02240510 @ =0x00000784
	movs r6, #0
	adds r4, r5, #0
_022404D2:
	ldr r0, [r4, r7]
	movs r1, #0
	bl ov83_0224755C
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #6
	blo _022404D2
	movs r0, #0x1e
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0x30
	movs r2, #0x28
	bl ov83_0224759C
	ldrb r1, [r5, #0xe]
	movs r0, #8
	bics r1, r0
	strb r1, [r5, #0xe]
_022404F8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022404FC: .4byte 0x00000868
_02240500: .4byte 0x0000085C
_02240504: .4byte 0x000004DC
_02240508: .4byte 0x0000077C
_0224050C: .4byte 0x0000079C
_02240510: .4byte 0x00000784
	thumb_func_end ov83_0224042C

	thumb_func_start ov83_02240514
ov83_02240514: @ 0x02240514
	adds r1, r0, #0
	ldr r0, _02240520 @ =0x0000084C
	ldr r3, _02240524 @ =ov83_02247864
	adds r0, r1, r0
	ldr r1, [r1, #0x4c]
	bx r3
	.align 2, 0
_02240520: .4byte 0x0000084C
_02240524: .4byte ov83_02247864
	thumb_func_end ov83_02240514

	thumb_func_start ov83_02240528
ov83_02240528: @ 0x02240528
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #4
	adds r4, r1, #0
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #1
	lsls r0, r0, #0xa
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x41
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	cmp r4, #6
	ldr r0, _02240658 @ =0x00010200
	bne _02240574
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x6a
	bl ov83_022479E4
	b _0224058C
_02240574:
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x6b
	bl ov83_022479E4
_0224058C:
	ldr r0, _0224065C @ =0x0000050C
	ldr r0, [r5, r0]
	bl FUN_02028E9C
	adds r6, r0, #0
	movs r0, #8
	movs r1, #0x6b
	bl FUN_02026354
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_02028F54
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_020269A0
	adds r0, r6, #0
	bl FUN_02028F94
	cmp r0, #0
	bne _022405BC
	ldr r0, _02240660 @ =0x00070800
	b _022405C0
_022405BC:
	movs r0, #0xc1
	lsls r0, r0, #0xa
_022405C0:
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #1
	lsls r0, r0, #0xa
	adds r0, r5, r0
	adds r1, r4, #0
	adds r3, r2, #0
	str r2, [sp, #8]
	bl ov83_02247998
	adds r0, r4, #0
	bl FUN_02026380
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	adds r4, r0, #0
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r5, #4]
	adds r1, r4, #0
	bl FUN_020310BC
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	movs r3, #4
	bl ov83_02240C48
	movs r0, #0x41
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02240658 @ =0x00010200
	movs r1, #0x41
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	lsls r1, r1, #4
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #2
	bl ov83_02241DD8
	movs r0, #0x3f
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D5C8
	movs r0, #1
	lsls r0, r0, #0xa
	adds r0, r5, r0
	bl FUN_0201D5C8
	movs r0, #0x41
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_02240658: .4byte 0x00010200
_0224065C: .4byte 0x0000050C
_02240660: .4byte 0x00070800
	thumb_func_end ov83_02240528

	thumb_func_start ov83_02240664
ov83_02240664: @ 0x02240664
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	ldr r0, _02240738 @ =0x00000862
	adds r4, r5, #0
	ldrsh r1, [r5, r0]
	movs r0, #6
	movs r6, #0
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	lsls r0, r0, #3
	str r0, [sp, #0x14]
	adds r4, #0x50
_02240682:
	adds r0, r6, #0
	adds r0, #0x30
	lsls r0, r0, #4
	str r0, [sp, #0x1c]
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x18]
	adds r1, r0, r6
	ldr r0, _0224073C @ =0x00000861
	ldrb r0, [r5, r0]
	cmp r1, r0
	bge _02240722
	adds r0, r6, #0
	adds r0, #0x30
	lsls r0, r0, #4
	str r0, [sp, #0x20]
	movs r0, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02240740 @ =0x00010200
	ldr r2, _02240744 @ =0x000004DC
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r3, [r5, r2]
	ldr r2, [sp, #0x14]
	ldr r0, [sp, #0x20]
	adds r2, r2, r3
	lsls r7, r6, #3
	ldr r2, [r7, r2]
	adds r0, r4, r0
	movs r1, #0
	movs r3, #4
	bl FUN_020200FC
	ldr r1, _02240744 @ =0x000004DC
	adds r0, r5, #0
	ldr r2, [r5, r1]
	ldr r1, [sp, #0x14]
	adds r1, r1, r2
	adds r1, r7, r1
	ldr r1, [r1, #4]
	ldrb r2, [r5, #0x13]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ov83_02240EC4
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	movs r3, #2
	bl ov83_02240C48
	ldr r0, [sp, #0x20]
	adds r0, r4, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, #4
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, _02240740 @ =0x00010200
	ldr r1, [sp, #0x20]
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r4, r1
	movs r3, #0x68
	bl ov83_02241DD8
_02240722:
	ldr r0, [sp, #0x1c]
	adds r0, r4, r0
	bl FUN_0201D5C8
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #6
	blo _02240682
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02240738: .4byte 0x00000862
_0224073C: .4byte 0x00000861
_02240740: .4byte 0x00010200
_02240744: .4byte 0x000004DC
	thumb_func_end ov83_02240664

	thumb_func_start ov83_02240748
ov83_02240748: @ 0x02240748
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _022407E8 @ =0x00000862
	movs r4, #0
	ldrsh r1, [r5, r0]
	movs r0, #6
	str r4, [sp, #4]
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #3
	adds r6, r5, #0
	str r0, [sp]
_02240764:
	ldr r0, _022407EC @ =0x00000861
	ldrb r0, [r5, r0]
	cmp r7, r0
	bhs _022407C8
	ldr r1, _022407F0 @ =0x000004DC
	adds r0, r5, #0
	ldr r2, [r5, r1]
	ldr r1, [sp]
	adds r2, r1, r2
	ldr r1, [sp, #4]
	adds r1, r1, r2
	ldr r1, [r1, #4]
	ldrb r2, [r5, #0x13]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ov83_02240F48
	str r0, [sp, #8]
	ldr r0, _022407F4 @ =0x00000518
	ldr r2, [sp, #8]
	adds r0, r5, r0
	adds r1, r4, #4
	bl ov83_02247264
	ldr r0, _022407F4 @ =0x00000518
	ldr r2, [sp, #8]
	adds r0, r5, r0
	adds r1, r4, #4
	bl ov83_022472A0
	add r1, sp, #0xc
	adds r0, r4, #0
	adds r1, #2
	add r2, sp, #0xc
	bl ov83_02242894
	ldr r0, _022407F8 @ =0x00000784
	add r1, sp, #0xc
	add r2, sp, #0xc
	ldrh r1, [r1, #2]
	ldrh r2, [r2]
	ldr r0, [r6, r0]
	bl ov83_02247568
	ldr r0, _022407F8 @ =0x00000784
	movs r1, #1
	ldr r0, [r6, r0]
	bl ov83_0224755C
	b _022407D2
_022407C8:
	ldr r0, _022407F8 @ =0x00000784
	movs r1, #0
	ldr r0, [r6, r0]
	bl ov83_0224755C
_022407D2:
	ldr r0, [sp, #4]
	adds r4, r4, #1
	adds r0, #8
	adds r7, r7, #1
	adds r6, r6, #4
	str r0, [sp, #4]
	cmp r4, #6
	blo _02240764
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022407E8: .4byte 0x00000862
_022407EC: .4byte 0x00000861
_022407F0: .4byte 0x000004DC
_022407F4: .4byte 0x00000518
_022407F8: .4byte 0x00000784
	thumb_func_end ov83_02240748

	thumb_func_start ov83_022407FC
ov83_022407FC: @ 0x022407FC
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #0x3d
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	ldr r2, _02240880 @ =0x00000862
	str r1, [sp]
	ldrsh r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #1
	adds r2, r2, #1
	bl ov83_02240C48
	ldr r0, _02240884 @ =0x00000861
	movs r1, #6
	ldrb r0, [r4, r0]
	subs r0, r0, #1
	blx FUN_020F2998
	adds r2, r0, #0
	movs r0, #0
	movs r1, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r2, r2, #1
	adds r3, r1, #0
	bl ov83_02240C48
	movs r0, #0x3d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	lsls r1, r0, #3
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02240888 @ =0x00010200
	movs r1, #0x3d
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	lsls r1, r1, #4
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, r4, r1
	movs r3, #0x67
	bl ov83_02241DD8
	movs r0, #0x3d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_02240880: .4byte 0x00000862
_02240884: .4byte 0x00000861
_02240888: .4byte 0x00010200
	thumb_func_end ov83_022407FC

	thumb_func_start ov83_0224088C
ov83_0224088C: @ 0x0224088C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x3e
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x3e
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _022408DC @ =0x00010200
	lsls r5, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x3e
	lsrs r3, r5, #0x1f
	lsls r0, r0, #4
	adds r3, r5, r3
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x69
	asrs r3, r3, #1
	bl ov83_022479E4
	movs r0, #0x3e
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_022408DC: .4byte 0x00010200
	thumb_func_end ov83_0224088C

	thumb_func_start ov83_022408E0
ov83_022408E0: @ 0x022408E0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x42
	lsls r0, r0, #4
	adds r4, r1, #0
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r1, _02240970 @ =0x00000862
	movs r0, #6
	ldrsh r2, [r5, r1]
	subs r1, #0xc6
	muls r0, r2, r0
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, [r5, r1]
	movs r1, #0
	bl ov83_0224755C
	cmp r4, #6
	bhs _02240960
	ldr r0, _02240974 @ =0x00000861
	ldrb r0, [r5, r0]
	cmp r6, r0
	bge _02240960
	ldrb r2, [r5, #0x13]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov83_02240F48
	adds r4, r0, #0
	movs r3, #0
	str r3, [sp]
	ldr r0, _02240978 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x42
	lsls r0, r0, #4
	ldr r1, [r5, #0x1c]
	adds r0, r5, r0
	adds r2, r4, #0
	bl ov83_022479E4
	ldr r0, _0224097C @ =0x00000518
	movs r1, #3
	adds r0, r5, r0
	adds r2, r4, #0
	bl ov83_02247264
	ldr r0, _0224097C @ =0x00000518
	movs r1, #3
	adds r0, r5, r0
	adds r2, r4, #0
	bl ov83_022472A0
	ldr r0, _02240980 @ =0x0000079C
	movs r1, #1
	ldr r0, [r5, r0]
	bl ov83_0224755C
_02240960:
	movs r0, #0x42
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02240970: .4byte 0x00000862
_02240974: .4byte 0x00000861
_02240978: .4byte 0x00010200
_0224097C: .4byte 0x00000518
_02240980: .4byte 0x0000079C
	thumb_func_end ov83_022408E0

	thumb_func_start ov83_02240984
ov83_02240984: @ 0x02240984
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0x43
	lsls r0, r0, #4
	movs r6, #0x3e
	adds r4, r5, r0
	movs r7, #0
_02240994:
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #0x45
	bls _02240994
	movs r3, #0
	str r3, [sp]
	ldr r0, _02240B34 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x45
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x58
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _02240B34 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x49
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x46
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _02240B34 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x47
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x59
	bl ov83_022479E4
	movs r1, #0
	ldr r2, _02240B38 @ =0x00000818
	str r1, [sp]
	ldrh r2, [r5, r2]
	adds r0, r5, #0
	movs r3, #3
	bl ov83_02240C48
	movs r0, #0
	str r0, [sp]
	ldr r2, _02240B3C @ =0x0000081A
	adds r0, r5, #0
	ldrh r2, [r5, r2]
	movs r1, #1
	movs r3, #3
	bl ov83_02240C48
	movs r0, #0x12
	lsls r0, r0, #6
	adds r0, r5, r0
	bl FUN_0201EE90
	lsls r1, r0, #3
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02240B34 @ =0x00010200
	movs r1, #0x12
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	lsls r1, r1, #6
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x5f
	bl ov83_02241DD8
	ldr r0, _02240B40 @ =0x00000804
	ldr r0, [r5, r0]
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, [r5, #0x24]
	movs r1, #0
	bl FUN_0200BF8C
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02240B34 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #0x43
	lsls r1, r1, #4
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x5b
	bl ov83_02241DD8
	ldr r0, _02240B44 @ =0x0000080E
	ldrb r0, [r5, r0]
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x1f
	bne _02240AC2
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bne _02240AA2
	movs r3, #0
	str r3, [sp]
	ldr r0, _02240B48 @ =0x00050600
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x11
	lsls r0, r0, #6
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x56
	bl ov83_022479E4
	b _02240AC2
_02240AA2:
	cmp r0, #1
	bne _02240AC2
	movs r3, #0
	str r3, [sp]
	movs r0, #0xc1
	str r3, [sp, #4]
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x11
	lsls r0, r0, #6
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x57
	bl ov83_022479E4
_02240AC2:
	movs r1, #0
	ldr r2, _02240B4C @ =0x0000080F
	str r1, [sp]
	ldrb r2, [r5, r2]
	adds r0, r5, #0
	movs r3, #3
	bl ov83_02240C48
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02240B34 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #0x46
	lsls r1, r1, #4
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x5e
	bl ov83_02241DD8
	ldr r2, _02240B50 @ =0x00000812
	ldr r0, [r5, #0x24]
	ldrh r2, [r5, r2]
	movs r1, #0
	bl FUN_0200C0CC
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02240B34 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #0x4a
	lsls r1, r1, #4
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x47
	bl ov83_02241DD8
	movs r0, #0x43
	lsls r0, r0, #4
	movs r4, #0x3e
	adds r5, r5, r0
_02240B22:
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0x45
	bls _02240B22
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02240B34: .4byte 0x00010200
_02240B38: .4byte 0x00000818
_02240B3C: .4byte 0x0000081A
_02240B40: .4byte 0x00000804
_02240B44: .4byte 0x0000080E
_02240B48: .4byte 0x00050600
_02240B4C: .4byte 0x0000080F
_02240B50: .4byte 0x00000812
	thumb_func_end ov83_02240984

	thumb_func_start ov83_02240B54
ov83_02240B54: @ 0x02240B54
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	str r1, [sp]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xde
	movs r3, #0x6b
	bl FUN_0200BAF8
	adds r7, r0, #0
	ldr r0, _02240C28 @ =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	movs r2, #1
	bl ov83_0224777C
	ldr r1, [sp]
	cmp r1, #6
	bne _02240B8A
	subs r0, r0, #1
	lsls r1, r0, #1
	ldr r0, _02240C2C @ =0x02247D12
	ldr r6, _02240C30 @ =0x02247F88
	ldrh r1, [r0, r1]
	ldr r0, _02240C34 @ =0x00000861
	strb r1, [r5, r0]
	b _02240B98
_02240B8A:
	subs r0, r0, #1
	lsls r1, r0, #1
	ldr r0, _02240C38 @ =0x02247D24
	ldr r6, _02240C3C @ =0x02247EE0
	ldrh r1, [r0, r1]
	ldr r0, _02240C34 @ =0x00000861
	strb r1, [r5, r0]
_02240B98:
	ldr r0, _02240C34 @ =0x00000861
	movs r1, #0x6b
	ldrb r0, [r5, r0]
	bl FUN_02014918
	ldr r1, _02240C40 @ =0x000004DC
	movs r4, #0
	str r0, [r5, r1]
	ldr r0, _02240C34 @ =0x00000861
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _02240BCE
_02240BB0:
	ldr r0, _02240C40 @ =0x000004DC
	lsls r2, r4, #1
	ldrh r2, [r6, r2]
	ldr r0, [r5, r0]
	adds r1, r7, #0
	adds r3, r4, #0
	bl FUN_02014960
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _02240C34 @ =0x00000861
	ldrb r0, [r5, r0]
	cmp r4, r0
	blt _02240BB0
_02240BCE:
	adds r0, r7, #0
	bl FUN_0200BB44
	adds r0, r5, #0
	bl ov83_02247B7C
	ldr r1, _02240C44 @ =0x0000085C
	str r0, [r5, r1]
	subs r1, #0xe0
	ldr r0, [r5, r1]
	movs r1, #1
	bl ov83_0224755C
	ldr r1, [sp]
	adds r0, r5, #0
	bl ov83_02240528
	adds r0, r5, #0
	bl ov83_02240664
	adds r0, r5, #0
	bl ov83_02240748
	adds r0, r5, #0
	bl ov83_022407FC
	adds r0, r5, #0
	bl ov83_0224088C
	adds r0, r5, #0
	movs r1, #0
	bl ov83_022408E0
	adds r0, r5, #0
	bl ov83_02240984
	movs r0, #0x1e
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0x30
	movs r2, #0x48
	bl ov83_0224759C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02240C28: .4byte 0x0000050C
_02240C2C: .4byte 0x02247D12
_02240C30: .4byte 0x02247F88
_02240C34: .4byte 0x00000861
_02240C38: .4byte 0x02247D24
_02240C3C: .4byte 0x02247EE0
_02240C40: .4byte 0x000004DC
_02240C44: .4byte 0x0000085C
	thumb_func_end ov83_02240B54

	thumb_func_start ov83_02240C48
ov83_02240C48: @ 0x02240C48
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	movs r4, #1
	str r4, [sp, #4]
	ldr r0, [r0, #0x24]
	bl FUN_0200BFCC
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_02240C48

	thumb_func_start ov83_02240C60
ov83_02240C60: @ 0x02240C60
	ldr r3, _02240C68 @ =FUN_0200BF8C
	ldr r0, [r0, #0x24]
	bx r3
	nop
_02240C68: .4byte FUN_0200BF8C
	thumb_func_end ov83_02240C60

	thumb_func_start ov83_02240C6C
ov83_02240C6C: @ 0x02240C6C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02240C88 @ =0x0000050C
	adds r4, r1, #0
	ldr r0, [r5, r0]
	bl FUN_02028E9C
	adds r2, r0, #0
	ldr r0, [r5, #0x24]
	adds r1, r4, #0
	bl FUN_0200BE48
	pop {r3, r4, r5, pc}
	nop
_02240C88: .4byte 0x0000050C
	thumb_func_end ov83_02240C6C

	thumb_func_start ov83_02240C8C
ov83_02240C8C: @ 0x02240C8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r1, #0
	ldr r1, _02240CF4 @ =0x0000050C
	str r2, [sp, #0x10]
	ldr r0, [r0, r1]
	adds r6, r3, #0
	bl FUN_02028E9C
	adds r7, r0, #0
	movs r0, #8
	movs r1, #0x6b
	bl FUN_02026354
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02028F54
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_020269A0
	adds r0, r7, #0
	bl FUN_02028F94
	cmp r0, #0
	bne _02240CC6
	ldr r1, _02240CF8 @ =0x00070800
	b _02240CCA
_02240CC6:
	movs r1, #0xc1
	lsls r1, r1, #0xa
_02240CCA:
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
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02240CF4: .4byte 0x0000050C
_02240CF8: .4byte 0x00070800
	thumb_func_end ov83_02240C8C

	thumb_func_start ov83_02240CFC
ov83_02240CFC: @ 0x02240CFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r7, r1, #0
	str r2, [sp, #0x18]
	adds r6, r3, #0
	bl FUN_0203769C
	movs r1, #1
	eors r0, r1
	bl FUN_02034818
	str r0, [sp, #0x1c]
	bl FUN_02028F94
	cmp r0, #0
	bne _02240D22
	ldr r4, _02240D60 @ =0x00070800
	b _02240D26
_02240D22:
	movs r4, #0xc1
	lsls r4, r4, #0xa
_02240D26:
	ldr r0, [r5, #0x24]
	ldr r2, [sp, #0x1c]
	movs r1, #0
	bl FUN_0200BE48
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	lsrs r0, r4, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsrs r0, r4, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r3, [sp, #0x18]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #1
	bl ov83_0223FCB4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02240D60: .4byte 0x00070800
	thumb_func_end ov83_02240CFC

	thumb_func_start ov83_02240D64
ov83_02240D64: @ 0x02240D64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r2, #0
	adds r2, r3, #0
	add r3, sp, #0x20
	ldrb r3, [r3, #0x14]
	cmp r3, #0
	bne _02240D7E
	movs r3, #0x56
	movs r4, #7
	movs r5, #8
	movs r6, #0
	b _02240D8A
_02240D7E:
	cmp r3, #1
	bne _02240DA4
	movs r3, #0x57
	movs r4, #3
	movs r5, #4
	movs r6, #0
_02240D8A:
	str r2, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	add r2, sp, #0x20
	ldrb r2, [r2, #0x10]
	str r2, [sp, #0x14]
	adds r2, r3, #0
	adds r3, r7, #0
	bl ov83_0223FCB4
_02240DA4:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov83_02240D64

	thumb_func_start ov83_02240DA8
ov83_02240DA8: @ 0x02240DA8
	movs r3, #0
	strb r3, [r0, #8]
	str r2, [r1]
	bx lr
	thumb_func_end ov83_02240DA8

	thumb_func_start ov83_02240DB0
ov83_02240DB0: @ 0x02240DB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02240DDC @ =0x000005DC
	bl FUN_0200604C
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _02240DCE
	ldrb r2, [r4, #0xd]
	adds r0, r4, #0
	movs r1, #0xc
	bl ov83_02241368
_02240DCE:
	ldrb r1, [r4, #0xd]
	adds r0, r4, #0
	movs r2, #0
	bl ov83_02240DE0
	pop {r4, pc}
	nop
_02240DDC: .4byte 0x000005DC
	thumb_func_end ov83_02240DB0

	thumb_func_start ov83_02240DE0
ov83_02240DE0: @ 0x02240DE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	bne _02240DF8
	movs r0, #0x76
	lsls r0, r0, #4
	ldr r4, [r5, r0]
	movs r2, #1
	movs r1, #0
	b _02240E00
_02240DF8:
	ldr r0, _02240E6C @ =0x00000764
	movs r2, #2
	ldr r4, [r5, r0]
	movs r1, #0x11
_02240E00:
	ldrb r0, [r5, #0x15]
	cmp r7, r0
	blo _02240E26
	adds r0, r4, #0
	bl ov83_022475D4
	adds r0, r4, #0
	movs r1, #0xe0
	movs r2, #0xa0
	bl ov83_02247568
	cmp r6, #0
	bne _02240E68
	adds r0, r5, #0
	movs r1, #0
	bl ov83_02242844
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02240E26:
	adds r0, r4, #0
	adds r1, r2, #0
	bl ov83_022475D4
	adds r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	adds r3, r7, #0
	bl ov83_02240E70
	ldr r1, [sp, #4]
	ldr r2, [sp]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	adds r0, r4, #0
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	bl ov83_02247568
	cmp r6, #0
	bne _02240E68
	ldrb r1, [r5, #0xc]
	ldrb r0, [r5, #0x15]
	cmp r1, r0
	blo _02240E60
	adds r0, r5, #0
	movs r1, #1
	bl ov83_02242844
_02240E60:
	adds r0, r5, #0
	movs r1, #0
	bl ov83_02242814
_02240E68:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02240E6C: .4byte 0x00000764
	thumb_func_end ov83_02240DE0

	thumb_func_start ov83_02240E70
ov83_02240E70: @ 0x02240E70
	push {r4, r5, r6, lr}
	ldrb r0, [r0, #9]
	adds r5, r1, #0
	adds r6, r2, #0
	adds r4, r3, #0
	bl FUN_02237D8C
	cmp r0, #1
	bne _02240EA6
	cmp r4, #0
	bne _02240E8C
	movs r0, #0x28
	str r0, [r5]
	b _02240EBE
_02240E8C:
	cmp r4, #1
	bne _02240E96
	movs r0, #0x68
	str r0, [r5]
	b _02240EBE
_02240E96:
	cmp r4, #2
	bne _02240EA0
	movs r0, #0xa8
	str r0, [r5]
	b _02240EBE
_02240EA0:
	movs r0, #0xe8
	str r0, [r5]
	b _02240EBE
_02240EA6:
	cmp r4, #0
	bne _02240EB0
	movs r0, #0x48
	str r0, [r5]
	b _02240EBE
_02240EB0:
	cmp r4, #1
	bne _02240EBA
	movs r0, #0x88
	str r0, [r5]
	b _02240EBE
_02240EBA:
	movs r0, #0xc8
	str r0, [r5]
_02240EBE:
	movs r0, #0x58
	str r0, [r6]
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_02240E70

	thumb_func_start ov83_02240EC4
ov83_02240EC4: @ 0x02240EC4
	push {r3, r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _02240EEC @ =0x0000050C
	adds r5, r1, #0
	adds r4, r2, #0
	ldrb r1, [r3, #9]
	ldr r0, [r3, r0]
	movs r2, #1
	bl ov83_0224777C
	cmp r4, #6
	bne _02240EE4
	ldr r0, _02240EF0 @ =0x02247FC8
	lsls r1, r5, #1
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, pc}
_02240EE4:
	ldr r0, _02240EF4 @ =0x02247F16
	lsls r1, r5, #1
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02240EEC: .4byte 0x0000050C
_02240EF0: .4byte 0x02247FC8
_02240EF4: .4byte 0x02247F16
	thumb_func_end ov83_02240EC4

	thumb_func_start ov83_02240EF8
ov83_02240EF8: @ 0x02240EF8
	push {r3, lr}
	ldr r3, _02240F38 @ =0x02247EE0
	movs r2, #0
_02240EFE:
	ldrh r1, [r3]
	cmp r0, r1
	bne _02240F0C
	ldr r0, _02240F3C @ =0x02247F16
	lsls r1, r2, #1
	ldrh r0, [r0, r1]
	pop {r3, pc}
_02240F0C:
	adds r2, r2, #1
	adds r3, r3, #2
	cmp r2, #0x1b
	blo _02240EFE
	ldr r2, _02240F40 @ =0x02247F88
	movs r3, #0
_02240F18:
	ldrh r1, [r2]
	cmp r0, r1
	bne _02240F26
	ldr r0, _02240F44 @ =0x02247FC8
	lsls r1, r3, #1
	ldrh r0, [r0, r1]
	pop {r3, pc}
_02240F26:
	adds r3, r3, #1
	adds r2, r2, #2
	cmp r3, #0x20
	blo _02240F18
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	nop
_02240F38: .4byte 0x02247EE0
_02240F3C: .4byte 0x02247F16
_02240F40: .4byte 0x02247F88
_02240F44: .4byte 0x02247FC8
	thumb_func_end ov83_02240EF8

	thumb_func_start ov83_02240F48
ov83_02240F48: @ 0x02240F48
	push {r3, r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _02240F70 @ =0x0000050C
	adds r5, r1, #0
	adds r4, r2, #0
	ldrb r1, [r3, #9]
	ldr r0, [r3, r0]
	movs r2, #1
	bl ov83_0224777C
	cmp r4, #6
	bne _02240F68
	ldr r0, _02240F74 @ =0x02247F88
	lsls r1, r5, #1
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, pc}
_02240F68:
	ldr r0, _02240F78 @ =0x02247EE0
	lsls r1, r5, #1
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02240F70: .4byte 0x0000050C
_02240F74: .4byte 0x02247F88
_02240F78: .4byte 0x02247EE0
	thumb_func_end ov83_02240F48

	thumb_func_start ov83_02240F7C
ov83_02240F7C: @ 0x02240F7C
	push {r3, r4, r5, r6, r7, lr}
	ldrb r0, [r0, #9]
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r4, [sp, #0x18]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02240F9E
	movs r0, #0x28
	strh r0, [r5]
	movs r0, #0
	strh r0, [r6]
	strh r0, [r7]
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02240F9E:
	movs r1, #0
	strh r1, [r5]
	strh r1, [r6]
	movs r0, #0x80
	strh r0, [r7]
	strh r1, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov83_02240F7C

	thumb_func_start ov83_02240FAC
ov83_02240FAC: @ 0x02240FAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	adds r6, r2, #0
	bl ov83_02247768
	adds r5, r0, #0
	ldr r0, _0224119C @ =0x000007A4
	adds r1, r5, #0
	ldr r0, [r4, r0]
	bl FUN_02074644
	str r0, [sp, #0x14]
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	adds r7, r0, #0
	ldr r0, [sp, #0x1c]
	lsls r1, r7, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x30
	bl FUN_020880B0
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov83_022411B0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	lsls r1, r7, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x30
	bl FUN_020880B0
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov83_022411DC
	adds r7, r0, #0
	cmp r6, #0xa
	bls _02241018
	b _02241196
_02241018:
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02241024: @ jump table
	.2byte _02241196 - _02241024 - 2 @ case 0
	.2byte _02241048 - _02241024 - 2 @ case 1
	.2byte _02241048 - _02241024 - 2 @ case 2
	.2byte _02241048 - _02241024 - 2 @ case 3
	.2byte _0224103A - _02241024 - 2 @ case 4
	.2byte _02241196 - _02241024 - 2 @ case 5
	.2byte _0224110C - _02241024 - 2 @ case 6
	.2byte _0224110C - _02241024 - 2 @ case 7
	.2byte _0224103A - _02241024 - 2 @ case 8
	.2byte _0224117A - _02241024 - 2 @ case 9
	.2byte _02241188 - _02241024 - 2 @ case 10
_0224103A:
	ldrb r1, [r4, #0xe]
	movs r0, #4
	add sp, #0x20
	bics r1, r0
	strb r1, [r4, #0xe]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02241048:
	ldrb r1, [r4, #0xe]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	bne _0224108E
	movs r0, #4
	orrs r0, r1
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02241064
	movs r1, #0x40
	b _02241066
_02241064:
	movs r1, #0x20
_02241066:
	movs r0, #8
	str r0, [sp]
	lsls r0, r5, #6
	adds r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r1, #0
	movs r0, #0x3e
	str r0, [sp, #8]
	ldr r0, _022411A0 @ =0x00000518
	str r1, [sp, #0xc]
	adds r0, r4, r0
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _022411A4 @ =0x0000075C
	str r0, [r4, r1]
_0224108E:
	ldr r0, _022411A4 @ =0x0000075C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022410AC
	bl ov83_02247624
	cmp r0, #0
	bne _022410AC
	ldr r0, _022411A4 @ =0x0000075C
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, _022411A4 @ =0x0000075C
	movs r1, #0
	str r1, [r4, r0]
_022410AC:
	ldr r0, _022411A4 @ =0x0000075C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02241196
	ldr r0, [sp, #0x14]
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	adds r1, r4, #0
	adds r3, r0, #0
	adds r0, r4, #0
	adds r1, #0x80
	adds r2, r5, #0
	bl ov83_02240238
	ldrb r0, [r4, #0xd]
	cmp r0, r5
	bne _022410E0
	adds r0, r4, #0
	bl ov83_02241E18
	adds r0, r4, #0
	movs r1, #0
	bl ov83_022421E0
_022410E0:
	lsls r5, r5, #2
	ldr r0, _022411A8 @ =0x00000768
	adds r1, r4, r5
	ldr r0, [r1, r0]
	adds r1, r7, #0
	bl ov83_022475D4
	ldr r0, _022411AC @ =0x0000073C
	adds r1, r4, r5
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x18]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov83_02247600
	ldrb r1, [r4, #0xe]
	movs r0, #4
	add sp, #0x20
	bics r1, r0
	strb r1, [r4, #0xe]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224110C:
	ldrb r1, [r4, #0xe]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	bne _02241152
	movs r0, #4
	orrs r0, r1
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02241128
	movs r1, #0x40
	b _0224112A
_02241128:
	movs r1, #0x20
_0224112A:
	movs r0, #0x10
	str r0, [sp]
	lsls r0, r5, #6
	adds r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r1, #0
	movs r0, #0x3e
	str r0, [sp, #8]
	ldr r0, _022411A0 @ =0x00000518
	str r1, [sp, #0xc]
	adds r0, r4, r0
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _022411A4 @ =0x0000075C
	str r0, [r4, r1]
_02241152:
	ldr r0, _022411A4 @ =0x0000075C
	ldr r0, [r4, r0]
	bl ov83_02247624
	cmp r0, #0
	bne _02241196
	ldr r0, _022411A4 @ =0x0000075C
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, _022411A4 @ =0x0000075C
	movs r1, #0
	str r1, [r4, r0]
	ldrb r1, [r4, #0xe]
	movs r0, #4
	add sp, #0x20
	bics r1, r0
	strb r1, [r4, #0xe]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224117A:
	ldrb r1, [r4, #0xe]
	movs r0, #4
	add sp, #0x20
	bics r1, r0
	strb r1, [r4, #0xe]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02241188:
	ldrb r1, [r4, #0xe]
	movs r0, #4
	add sp, #0x20
	bics r1, r0
	strb r1, [r4, #0xe]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02241196:
	movs r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224119C: .4byte 0x000007A4
_022411A0: .4byte 0x00000518
_022411A4: .4byte 0x0000075C
_022411A8: .4byte 0x00000768
_022411AC: .4byte 0x0000073C
	thumb_func_end ov83_02240FAC

	thumb_func_start ov83_022411B0
ov83_022411B0: @ 0x022411B0
	cmp r1, #4
	bhi _022411D8
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022411C0: @ jump table
	.2byte _022411D8 - _022411C0 - 2 @ case 0
	.2byte _022411D6 - _022411C0 - 2 @ case 1
	.2byte _022411D2 - _022411C0 - 2 @ case 2
	.2byte _022411CE - _022411C0 - 2 @ case 3
	.2byte _022411CA - _022411C0 - 2 @ case 4
_022411CA:
	movs r0, #1
	bx lr
_022411CE:
	movs r0, #2
	bx lr
_022411D2:
	movs r0, #3
	bx lr
_022411D6:
	movs r0, #4
_022411D8:
	bx lr
	.align 2, 0
	thumb_func_end ov83_022411B0

	thumb_func_start ov83_022411DC
ov83_022411DC: @ 0x022411DC
	cmp r1, #4
	bhi _02241204
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022411EC: @ jump table
	.2byte _02241204 - _022411EC - 2 @ case 0
	.2byte _02241202 - _022411EC - 2 @ case 1
	.2byte _022411FE - _022411EC - 2 @ case 2
	.2byte _022411FA - _022411EC - 2 @ case 3
	.2byte _022411F6 - _022411EC - 2 @ case 4
_022411F6:
	movs r0, #0xf
	bx lr
_022411FA:
	movs r0, #0xf
	bx lr
_022411FE:
	movs r0, #0xe
	bx lr
_02241202:
	movs r0, #0xd
_02241204:
	bx lr
	.align 2, 0
	thumb_func_end ov83_022411DC

	thumb_func_start ov83_02241208
ov83_02241208: @ 0x02241208
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xd
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	ldrb r0, [r4, #0x14]
	bpl _02241222
	subs r0, r0, #1
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	b _02241228
_02241222:
	cmp r1, r0
	blt _02241228
	movs r1, #0
_02241228:
	strb r1, [r4, #0xd]
	adds r0, r4, #0
	bl ov83_02240DB0
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _02241250 @ =0x000007A4
	ldr r0, [r4, r0]
	bl FUN_02074644
	adds r2, r0, #0
	adds r0, r4, #0
	adds r4, #0x90
	adds r1, r4, #0
	bl ov83_0223FD4C
	pop {r4, pc}
	.align 2, 0
_02241250: .4byte 0x000007A4
	thumb_func_end ov83_02241208

	thumb_func_start ov83_02241254
ov83_02241254: @ 0x02241254
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xd
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	ldrb r0, [r4, #0x14]
	bpl _0224126E
	subs r0, r0, #1
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	b _02241274
_0224126E:
	cmp r1, r0
	blt _02241274
	movs r1, #0
_02241274:
	strb r1, [r4, #0xd]
	adds r0, r4, #0
	bl ov83_02240DB0
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _0224129C @ =0x000007A4
	ldr r0, [r4, r0]
	bl FUN_02074644
	adds r2, r0, #0
	adds r0, r4, #0
	adds r4, #0x90
	adds r1, r4, #0
	bl ov83_0223FF44
	pop {r4, pc}
	.align 2, 0
_0224129C: .4byte 0x000007A4
	thumb_func_end ov83_02241254

	thumb_func_start ov83_022412A0
ov83_022412A0: @ 0x022412A0
	push {r4, lr}
	adds r4, r0, #0
	bl ov83_02241730
	adds r0, r4, #0
	bl ov83_0224042C
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02241354
	adds r0, r4, #0
	bl ov83_02241B18
	ldr r2, _022412D4 @ =0x00000868
	movs r0, #2
	movs r1, #0
	adds r2, r4, r2
	bl ov83_022477EC
	ldr r0, _022412D8 @ =0x00000778
	movs r1, #0
	ldr r0, [r4, r0]
	bl ov83_0224755C
	pop {r4, pc}
	.align 2, 0
_022412D4: .4byte 0x00000868
_022412D8: .4byte 0x00000778
	thumb_func_end ov83_022412A0

	thumb_func_start ov83_022412DC
ov83_022412DC: @ 0x022412DC
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r5, r0, #0
	movs r1, #0x3a
	adds r2, r4, #0
	bl FUN_0206E540
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0x42
	adds r2, r4, #0
	bl FUN_0206E540
	cmp r6, r0
	beq _022412FC
	movs r4, #1
_022412FC:
	adds r0, r5, #0
	movs r1, #0x3b
	movs r2, #0
	bl FUN_0206E540
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0x43
	movs r2, #0
	bl FUN_0206E540
	cmp r6, r0
	beq _02241318
	movs r4, #1
_02241318:
	adds r0, r5, #0
	movs r1, #0x3c
	movs r2, #0
	bl FUN_0206E540
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0x44
	movs r2, #0
	bl FUN_0206E540
	cmp r6, r0
	beq _02241334
	movs r4, #1
_02241334:
	adds r0, r5, #0
	movs r1, #0x3d
	movs r2, #0
	bl FUN_0206E540
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0x45
	movs r2, #0
	bl FUN_0206E540
	cmp r6, r0
	beq _02241350
	movs r4, #1
_02241350:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_022412DC

	thumb_func_start ov83_02241354
ov83_02241354: @ 0x02241354
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_02241354

	thumb_func_start ov83_02241368
ov83_02241368: @ 0x02241368
	push {r3, r4, r5, lr}
	adds r3, r1, #0
	subs r3, #0xa
	adds r5, r0, #0
	cmp r3, #3
	bhi _022413A6
	adds r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_02241380: @ jump table
	.2byte _02241388 - _02241380 - 2 @ case 0
	.2byte _02241390 - _02241380 - 2 @ case 1
	.2byte _02241398 - _02241380 - 2 @ case 2
	.2byte _022413A0 - _02241380 - 2 @ case 3
_02241388:
	movs r4, #0x31
	bl ov83_022413C4
	b _022413A6
_02241390:
	movs r4, #0x32
	bl ov83_0224143C
	b _022413A6
_02241398:
	movs r4, #0x33
	bl ov83_022414CC
	b _022413A6
_022413A0:
	movs r4, #0x34
	bl ov83_02241504
_022413A6:
	ldr r1, _022413C0 @ =0x000007AC
	adds r0, r4, #0
	adds r1, r5, r1
	movs r2, #0x28
	bl FUN_02037030
	cmp r0, #1
	bne _022413BA
	movs r0, #1
	pop {r3, r4, r5, pc}
_022413BA:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_022413C0: .4byte 0x000007AC
	thumb_func_end ov83_02241368

	thumb_func_start ov83_022413C4
ov83_022413C4: @ 0x022413C4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _02241400 @ =0x0000050C
	adds r4, r1, #0
	ldr r0, [r6, r0]
	bl FUN_02028E9C
	ldr r1, _02241404 @ =0x000007AC
	strh r4, [r6, r1]
	bl FUN_02028F94
	ldr r1, _02241408 @ =0x000007AE
	movs r4, #0
	strh r0, [r6, r1]
	adds r5, r6, #4
	subs r7, r1, #2
_022413E4:
	ldr r0, _02241400 @ =0x0000050C
	ldrb r1, [r6, #9]
	lsls r2, r4, #0x18
	ldr r0, [r6, r0]
	lsrs r2, r2, #0x18
	bl ov83_0224777C
	strh r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #3
	blt _022413E4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02241400: .4byte 0x0000050C
_02241404: .4byte 0x000007AC
_02241408: .4byte 0x000007AE
	thumb_func_end ov83_022413C4

	thumb_func_start ov83_0224140C
ov83_0224140C: @ 0x0224140C
	push {r4, r5, r6, lr}
	adds r4, r3, #0
	adds r5, r0, #0
	ldrb r0, [r4, #0xf]
	adds r6, r2, #0
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	bl FUN_0203769C
	cmp r5, r0
	beq _02241436
	ldr r0, _02241438 @ =0x000007FF
	movs r3, #0
	adds r5, r6, #4
_02241428:
	ldrh r2, [r5]
	adds r1, r4, r3
	adds r3, r3, #1
	adds r5, r5, #2
	strb r2, [r1, r0]
	cmp r3, #3
	blt _02241428
_02241436:
	pop {r4, r5, r6, pc}
	.align 2, 0
_02241438: .4byte 0x000007FF
	thumb_func_end ov83_0224140C

	thumb_func_start ov83_0224143C
ov83_0224143C: @ 0x0224143C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02241470 @ =0x000007AC
	adds r4, r2, #0
	strh r1, [r5, r0]
	adds r0, r0, #2
	strh r4, [r5, r0]
	bl FUN_0203769C
	cmp r0, #0
	bne _0224145A
	ldrb r0, [r5, #0x12]
	cmp r0, #0xff
	bne _0224145A
	strb r4, [r5, #0x12]
_0224145A:
	ldrb r1, [r5, #0x12]
	movs r0, #0x7b
	lsls r0, r0, #4
	strh r1, [r5, r0]
	ldrh r2, [r5, #0x10]
	adds r1, r0, #4
	adds r0, r0, #6
	strh r2, [r5, r1]
	ldrb r1, [r5, #0x13]
	strh r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02241470: .4byte 0x000007AC
	thumb_func_end ov83_0224143C

	thumb_func_start ov83_02241474
ov83_02241474: @ 0x02241474
	push {r4, r5, r6, lr}
	adds r4, r3, #0
	adds r6, r0, #0
	ldrb r0, [r4, #0xf]
	adds r5, r2, #0
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	bl FUN_0203769C
	cmp r6, r0
	beq _022414C4
	ldrh r1, [r5, #2]
	ldr r0, _022414C8 @ =0x000007FD
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r0, #0
	bne _022414B8
	ldrb r0, [r4, #0x12]
	cmp r0, #0xff
	ldr r0, _022414C8 @ =0x000007FD
	beq _022414A6
	movs r1, #0
	strb r1, [r4, r0]
	pop {r4, r5, r6, pc}
_022414A6:
	ldrb r1, [r4, r0]
	ldrb r0, [r4, #0x15]
	adds r0, r1, r0
	strb r0, [r4, #0x12]
	ldrh r0, [r5, #8]
	strh r0, [r4, #0x10]
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0x13]
	pop {r4, r5, r6, pc}
_022414B8:
	ldrh r0, [r5, #4]
	strb r0, [r4, #0x12]
	ldrh r0, [r5, #8]
	strh r0, [r4, #0x10]
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0x13]
_022414C4:
	pop {r4, r5, r6, pc}
	nop
_022414C8: .4byte 0x000007FD
	thumb_func_end ov83_02241474

	thumb_func_start ov83_022414CC
ov83_022414CC: @ 0x022414CC
	ldr r2, _022414D8 @ =0x000007AC
	strh r1, [r0, r2]
	ldrb r3, [r0, #0xd]
	adds r1, r2, #2
	strh r3, [r0, r1]
	bx lr
	.align 2, 0
_022414D8: .4byte 0x000007AC
	thumb_func_end ov83_022414CC

	thumb_func_start ov83_022414DC
ov83_022414DC: @ 0x022414DC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	adds r4, r3, #0
	bl FUN_0203769C
	cmp r5, r0
	beq _022414FC
	ldrh r0, [r6, #2]
	ldr r1, _02241500 @ =0x000007FC
	movs r2, #1
	strb r0, [r4, r1]
	ldrb r1, [r4, r1]
	adds r0, r4, #0
	bl ov83_02240DE0
_022414FC:
	pop {r4, r5, r6, pc}
	nop
_02241500: .4byte 0x000007FC
	thumb_func_end ov83_022414DC

	thumb_func_start ov83_02241504
ov83_02241504: @ 0x02241504
	ldr r1, _0224150C @ =0x000007AC
	movs r2, #1
	strh r2, [r0, r1]
	bx lr
	.align 2, 0
_0224150C: .4byte 0x000007AC
	thumb_func_end ov83_02241504

	thumb_func_start ov83_02241510
ov83_02241510: @ 0x02241510
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl FUN_0203769C
	cmp r5, r0
	beq _02241526
	ldrh r1, [r4]
	ldr r0, _02241528 @ =0x000007FE
	strb r1, [r6, r0]
_02241526:
	pop {r4, r5, r6, pc}
	.align 2, 0
_02241528: .4byte 0x000007FE
	thumb_func_end ov83_02241510

	thumb_func_start ov83_0224152C
ov83_0224152C: @ 0x0224152C
	push {r3, lr}
	movs r2, #0x6b
	str r2, [sp]
	movs r2, #0
	adds r3, r2, #0
	bl FUN_020902D0
	pop {r3, pc}
	thumb_func_end ov83_0224152C

	thumb_func_start ov83_0224153C
ov83_0224153C: @ 0x0224153C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	add r1, sp, #4
	str r1, [sp]
	add r1, sp, #8
	add r3, sp, #4
	adds r5, r0, #0
	adds r1, #2
	add r2, sp, #8
	adds r3, #2
	bl ov83_02240F7C
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02241580
	movs r0, #0
	str r0, [sp]
	add r3, sp, #4
	ldrh r2, [r3, #6]
	ldrh r3, [r3, #4]
	adds r0, r5, #0
	adds r2, r2, #4
	adds r3, r3, #1
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	adds r1, r4, #0
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x10
	bl ov83_02240C8C
	b _022415E8
_02241580:
	bl FUN_0203769C
	cmp r0, #0
	add r2, sp, #4
	bne _022415BA
	ldrh r0, [r2, #4]
	adds r1, r4, #0
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0
	str r0, [sp]
	ldrh r2, [r2, #6]
	adds r0, r5, #0
	bl ov83_02240C8C
	movs r0, #0
	str r0, [sp]
	add r3, sp, #4
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r3, #1
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	bl ov83_02240CFC
	b _022415E8
_022415BA:
	ldrh r0, [r2, #4]
	adds r1, r4, #0
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0
	str r0, [sp]
	ldrh r2, [r2, #6]
	adds r0, r5, #0
	bl ov83_02240CFC
	movs r0, #0
	str r0, [sp]
	add r3, sp, #4
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r3, #1
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	bl ov83_02240C8C
_022415E8:
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov83_0224153C

	thumb_func_start ov83_022415F4
ov83_022415F4: @ 0x022415F4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x14]
	adds r4, r2, #0
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _0224168C @ =0x000007A4
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r6, r0, #0
	ldr r0, _02241690 @ =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	movs r2, #0
	bl ov83_0224777C
	adds r0, r6, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov83_02240C60
	ldr r0, _02241694 @ =0x00000508
	ldr r0, [r5, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0xb0
	bl ov83_02247944
	subs r1, r4, #1
	lsls r2, r1, #1
	ldr r1, _02241698 @ =_02247D0C
	adds r0, r5, #0
	ldrh r1, [r1, r2]
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r5, #0xa]
	cmp r4, #1
	beq _0224165A
	cmp r4, #2
	beq _02241664
	cmp r4, #3
	beq _0224166E
	b _02241680
_0224165A:
	adds r0, r6, #0
	movs r1, #0x18
	bl ov83_0224152C
	b _02241684
_02241664:
	adds r0, r6, #0
	movs r1, #0x29
	bl ov83_0224152C
	b _02241684
_0224166E:
	adds r0, r6, #0
	movs r1, #0x18
	bl ov83_0224152C
	adds r0, r6, #0
	movs r1, #0x29
	bl ov83_0224152C
	b _02241684
_02241680:
	bl GF_AssertFail
_02241684:
	ldr r0, _0224169C @ =0x000005EC
	bl FUN_0200604C
	pop {r4, r5, r6, pc}
	.align 2, 0
_0224168C: .4byte 0x000007A4
_02241690: .4byte 0x0000050C
_02241694: .4byte 0x00000508
_02241698: .4byte _02247D0C
_0224169C: .4byte 0x000005EC
	thumb_func_end ov83_022415F4

	thumb_func_start ov83_022416A0
ov83_022416A0: @ 0x022416A0
	push {r0, r1, r2, r3}
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x14]
	adds r4, r1, #0
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _02241724 @ =0x000007A4
	ldr r0, [r5, r0]
	bl FUN_02074644
	movs r1, #6
	add r2, sp, #0x18
	adds r6, r0, #0
	bl FUN_0206EC40
	ldrb r0, [r5, #0xd]
	cmp r0, r4
	bne _022416D6
	adds r0, r5, #0
	bl ov83_02241E18
	adds r0, r5, #0
	movs r1, #0
	bl ov83_022421E0
_022416D6:
	ldrb r0, [r5, #0x14]
	adds r1, r4, #0
	bl ov83_02247768
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _02241728 @ =0x0000074C
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov83_0224755C
	adds r0, r6, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov83_02240C60
	add r2, sp, #0x10
	ldrh r2, [r2, #8]
	ldr r0, [r5, #0x24]
	movs r1, #1
	bl FUN_0200C0CC
	adds r0, r5, #0
	movs r1, #0x3b
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r5, #0xa]
	ldr r0, _0224172C @ =0x00000623
	bl FUN_0200604C
	pop {r4, r5, r6}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_02241724: .4byte 0x000007A4
_02241728: .4byte 0x0000074C
_0224172C: .4byte 0x00000623
	thumb_func_end ov83_022416A0

	thumb_func_start ov83_02241730
ov83_02241730: @ 0x02241730
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0xe]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0224174E
	movs r0, #0x21
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_02018694
	adds r0, r4, #0
	bl ov83_02242D5C
_0224174E:
	ldr r0, _02241758 @ =0x0000084C
	adds r0, r4, r0
	bl ov83_022478B4
	pop {r4, pc}
	.align 2, 0
_02241758: .4byte 0x0000084C
	thumb_func_end ov83_02241730

	thumb_func_start ov83_0224175C
ov83_0224175C: @ 0x0224175C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xb0
	bl ov83_02241354
	adds r0, r4, #0
	bl ov83_022429E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_0224175C

	thumb_func_start ov83_02241770
ov83_02241770: @ 0x02241770
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r4, r1, #0
	add r1, sp, #0x1c
	str r1, [sp]
	add r1, sp, #0x20
	add r3, sp, #0x1c
	adds r5, r0, #0
	adds r1, #2
	add r2, sp, #0x20
	adds r3, #2
	bl ov83_02240F7C
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02241806
	add r1, sp, #0x1c
	ldrh r0, [r1, #6]
	adds r0, #0x48
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r0, [r1, #4]
	movs r1, #0
	adds r2, r7, #0
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r3, r6, #0
	bl FUN_0201DA74
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	str r0, [sp, #0x18]
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x18]
	bl FUN_020310BC
	movs r1, #0
	adds r2, r0, #0
	str r1, [sp]
	adds r0, r5, #0
	movs r3, #4
	bl ov83_02240C48
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r2, #2
	str r2, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r7, #0
	bl ov83_0223FCB4
	strb r0, [r5, #0xa]
	b _022418D4
_02241806:
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0x10
	movs r1, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x40
	adds r3, r1, #0
	bl FUN_0201DA74
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0x10
	movs r1, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0xc0
	adds r3, r1, #0
	bl FUN_0201DA74
	bl FUN_0203769C
	cmp r0, #0
	bne _0224185A
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	adds r6, r0, #0
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r5, #4]
	adds r1, r6, #0
	bl FUN_020310BC
	adds r6, r0, #0
	ldr r0, _022418E0 @ =0x00000802
	ldrh r7, [r5, r0]
	b _0224187C
_0224185A:
	ldr r0, _022418E0 @ =0x00000802
	ldrh r6, [r5, r0]
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	adds r7, r0, #0
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r5, #4]
	adds r1, r7, #0
	bl FUN_020310BC
	adds r7, r0, #0
_0224187C:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #4
	str r1, [sp]
	bl ov83_02240C48
	movs r0, #0x70
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _022418E4 @ =0x00010200
	adds r1, r4, #0
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	movs r3, #2
	bl ov83_02241DD8
	movs r1, #0
	adds r0, r5, #0
	adds r2, r7, #0
	movs r3, #4
	str r1, [sp]
	bl ov83_02240C48
	movs r0, #0xf0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _022418E4 @ =0x00010200
	adds r1, r4, #0
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	movs r3, #3
	bl ov83_02241DD8
_022418D4:
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_022418E0: .4byte 0x00000802
_022418E4: .4byte 0x00010200
	thumb_func_end ov83_02241770

	thumb_func_start ov83_022418E8
ov83_022418E8: @ 0x022418E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _02241A4C @ =0x000005E3
	adds r7, r1, #0
	adds r5, r2, #0
	bl FUN_0200604C
	ldrb r0, [r4, #0x15]
	adds r1, r7, #0
	str r0, [sp]
	bl ov83_0224776C
	str r0, [sp, #4]
	cmp r5, #0xa
	bhi _02241940
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02241914: @ jump table
	.2byte _02241940 - _02241914 - 2 @ case 0
	.2byte _0224192A - _02241914 - 2 @ case 1
	.2byte _0224192A - _02241914 - 2 @ case 2
	.2byte _0224192A - _02241914 - 2 @ case 3
	.2byte _02241940 - _02241914 - 2 @ case 4
	.2byte _02241940 - _02241914 - 2 @ case 5
	.2byte _02241934 - _02241914 - 2 @ case 6
	.2byte _02241934 - _02241914 - 2 @ case 7
	.2byte _02241940 - _02241914 - 2 @ case 8
	.2byte _0224193E - _02241914 - 2 @ case 9
	.2byte _0224193E - _02241914 - 2 @ case 10
_0224192A:
	subs r0, r5, #1
	lsls r1, r0, #1
	ldr r0, _02241A50 @ =0x02247D18
	ldrh r6, [r0, r1]
	b _02241940
_02241934:
	ldrh r0, [r4, #0x10]
	bl ov83_02240EF8
	adds r6, r0, #0
	b _02241940
_0224193E:
	movs r6, #0
_02241940:
	bl FUN_0203769C
	cmp r0, #0
	bne _02241974
	ldr r0, [sp]
	cmp r7, r0
	bhs _02241962
	adds r0, r4, #0
	movs r1, #5
	bl ov83_02240C6C
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	adds r2, r6, #0
	bl FUN_02237FA4
	b _0224199E
_02241962:
	ldr r0, [r4, #0x24]
	movs r1, #5
	bl ov83_022477C4
	ldr r0, _02241A54 @ =0x00000802
	ldrh r1, [r4, r0]
	subs r1, r1, r6
	strh r1, [r4, r0]
	b _0224199E
_02241974:
	ldr r0, [sp]
	cmp r7, r0
	bhs _0224198C
	ldr r0, [r4, #0x24]
	movs r1, #5
	bl ov83_022477C4
	ldr r0, _02241A54 @ =0x00000802
	ldrh r1, [r4, r0]
	subs r1, r1, r6
	strh r1, [r4, r0]
	b _0224199E
_0224198C:
	adds r0, r4, #0
	movs r1, #5
	bl ov83_02240C6C
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	adds r2, r6, #0
	bl FUN_02237FA4
_0224199E:
	adds r1, r4, #0
	adds r0, r4, #0
	adds r1, #0x50
	bl ov83_02241770
	adds r0, r4, #0
	bl ov83_02241730
	adds r0, r4, #0
	bl ov83_02241B18
	adds r0, r4, #0
	bl ov83_0224042C
	ldr r2, _02241A58 @ =0x00000868
	movs r0, #2
	movs r1, #0
	adds r2, r4, r2
	bl ov83_022477EC
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02241354
	cmp r5, #0xa
	bhi _02241A48
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022419DE: @ jump table
	.2byte _02241A48 - _022419DE - 2 @ case 0
	.2byte _022419F4 - _022419DE - 2 @ case 1
	.2byte _022419F4 - _022419DE - 2 @ case 2
	.2byte _022419F4 - _022419DE - 2 @ case 3
	.2byte _02241A48 - _022419DE - 2 @ case 4
	.2byte _02241A48 - _022419DE - 2 @ case 5
	.2byte _02241A14 - _022419DE - 2 @ case 6
	.2byte _02241A14 - _022419DE - 2 @ case 7
	.2byte _02241A48 - _022419DE - 2 @ case 8
	.2byte _02241A34 - _022419DE - 2 @ case 9
	.2byte _02241A40 - _022419DE - 2 @ case 10
_022419F4:
	ldr r0, _02241A5C @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	ldr r1, [sp, #4]
	adds r0, r4, #0
	adds r2, r5, #0
	bl ov83_022415F4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02241A14:
	ldr r0, _02241A5C @ =0x00000508
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xb0
	bl ov83_02247944
	ldrh r2, [r4, #0x10]
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl ov83_022416A0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02241A34:
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl ov83_02241A60
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02241A40:
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl ov83_02241ABC
_02241A48:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02241A4C: .4byte 0x000005E3
_02241A50: .4byte 0x02247D18
_02241A54: .4byte 0x00000802
_02241A58: .4byte 0x00000868
_02241A5C: .4byte 0x00000508
	thumb_func_end ov83_022418E8

	thumb_func_start ov83_02241A60
ov83_02241A60: @ 0x02241A60
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #2
	bl ov83_0223FAA8
	adds r0, r5, #0
	adds r0, #0xb0
	bl FUN_0201D8E4
	adds r0, r5, #0
	adds r0, #0xa0
	bl FUN_0201D8E4
	movs r0, #5
	lsls r0, r0, #6
	adds r0, r5, r0
	bl FUN_0201D8E4
	ldrb r0, [r5, #0x14]
	adds r1, r4, #0
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _02241AB4 @ =0x000007A4
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r1, r5, #0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, #0x90
	bl ov83_0223FD4C
	ldr r2, _02241AB8 @ =0x00000868
	movs r0, #2
	movs r1, #1
	adds r2, r5, r2
	bl ov83_022477EC
	pop {r3, r4, r5, pc}
	nop
_02241AB4: .4byte 0x000007A4
_02241AB8: .4byte 0x00000868
	thumb_func_end ov83_02241A60

	thumb_func_start ov83_02241ABC
ov83_02241ABC: @ 0x02241ABC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #2
	bl ov83_0223FB24
	adds r0, r5, #0
	adds r0, #0xb0
	bl FUN_0201D8E4
	adds r0, r5, #0
	adds r0, #0xa0
	bl FUN_0201D8E4
	movs r0, #5
	lsls r0, r0, #6
	adds r0, r5, r0
	bl FUN_0201D8E4
	ldrb r0, [r5, #0x14]
	adds r1, r4, #0
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _02241B10 @ =0x000007A4
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r1, r5, #0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, #0x90
	bl ov83_0223FF44
	ldr r2, _02241B14 @ =0x00000868
	movs r0, #2
	movs r1, #1
	adds r2, r5, r2
	bl ov83_022477EC
	pop {r3, r4, r5, pc}
	nop
_02241B10: .4byte 0x000007A4
_02241B14: .4byte 0x00000868
	thumb_func_end ov83_02241ABC

	thumb_func_start ov83_02241B18
ov83_02241B18: @ 0x02241B18
	ldr r2, _02241B28 @ =0x00000868
	adds r3, r0, #0
	adds r2, r3, r2
	ldr r3, _02241B2C @ =ov83_022477EC
	movs r0, #2
	movs r1, #0
	bx r3
	nop
_02241B28: .4byte 0x00000868
_02241B2C: .4byte ov83_022477EC
	thumb_func_end ov83_02241B18

	thumb_func_start ov83_02241B30
ov83_02241B30: @ 0x02241B30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldrb r0, [r6, #9]
	movs r1, #1
	bl FUN_02237B24
	movs r4, #0
	str r0, [sp]
	cmp r0, #0
	ble _02241BB8
	adds r5, r6, #0
_02241B48:
	ldr r0, _02241BBC @ =0x000007A4
	adds r1, r4, #0
	ldr r0, [r6, r0]
	bl FUN_02074644
	str r0, [sp, #4]
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	adds r7, r0, #0
	ldr r0, [sp, #4]
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #0
	lsls r0, r7, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	bl FUN_0222A43C
	adds r1, r0, #0
	ldr r0, _02241BC0 @ =0x0000073C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02241BAE
	bl ov83_02247600
	ldrb r0, [r6, #0x14]
	ldrb r1, [r6, #0xd]
	bl ov83_02247768
	cmp r4, r0
	bne _02241B98
	ldrb r1, [r6, #0xd]
	ldrb r0, [r6, #0x15]
	cmp r1, r0
	blo _02241BA4
_02241B98:
	ldr r0, _02241BC0 @ =0x0000073C
	movs r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224760C
	b _02241BAE
_02241BA4:
	ldr r0, _02241BC0 @ =0x0000073C
	movs r1, #1
	ldr r0, [r5, r0]
	bl ov83_0224760C
_02241BAE:
	ldr r0, [sp]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r0
	blt _02241B48
_02241BB8:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02241BBC: .4byte 0x000007A4
_02241BC0: .4byte 0x0000073C
	thumb_func_end ov83_02241B30

	thumb_func_start ov83_02241BC4
ov83_02241BC4: @ 0x02241BC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	str r2, [sp]
	ldrb r0, [r5, #9]
	adds r6, r1, #0
	movs r1, #0
	bl FUN_02237B24
	ldr r0, [sp]
	cmp r0, #4
	beq _02241BE0
	movs r0, #1
	b _02241BE2
_02241BE0:
	movs r0, #0
_02241BE2:
	ldrb r7, [r5, #0x15]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov83_0224776C
	bl FUN_0203769C
	cmp r0, #0
	bne _02241CC4
	cmp r6, r7
	bhs _02241C92
	adds r0, r5, #0
	movs r1, #5
	bl ov83_02240C6C
	ldr r0, _02241DC4 @ =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	adds r2, r4, #0
	bl ov83_0224777C
	adds r2, r0, #0
	movs r0, #6
	adds r6, r4, #0
	muls r6, r0, r6
	ldr r3, _02241DC8 @ =0x02247D48
	lsls r2, r2, #1
	adds r3, r3, r6
	ldrb r1, [r5, #9]
	ldrh r2, [r2, r3]
	ldr r0, [r5, #4]
	bl FUN_02237FA4
	ldr r0, _02241DC4 @ =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	adds r2, r4, #0
	bl ov83_0224777C
	adds r7, r0, #0
	ldr r0, _02241DC4 @ =0x0000050C
	ldr r0, [r5, r0]
	bl FUN_0203107C
	str r0, [sp, #4]
	ldrb r0, [r5, #9]
	adds r1, r4, #0
	bl FUN_0205C174
	str r0, [sp, #8]
	ldrb r0, [r5, #9]
	adds r1, r4, #0
	bl FUN_0205C174
	bl FUN_0205C268
	adds r3, r7, #1
	adds r2, r0, #0
	lsls r3, r3, #0x10
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	lsrs r3, r3, #0x10
	bl FUN_02031108
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #1
	beq _02241C72
	b _02241D8C
_02241C72:
	ldr r0, [sp]
	ldrb r1, [r5, #0xe]
	cmp r0, #4
	bne _02241C86
	movs r0, #0x60
	bics r1, r0
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r5, #0xe]
	b _02241D8C
_02241C86:
	movs r0, #0x60
	bics r1, r0
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r5, #0xe]
	b _02241D8C
_02241C92:
	ldr r0, [r5, #0x24]
	movs r1, #5
	bl ov83_022477C4
	ldr r0, _02241DCC @ =0x000007FF
	adds r6, r4, #0
	adds r1, r5, r0
	ldrb r7, [r1, r4]
	movs r0, #6
	muls r6, r0, r6
	ldr r0, _02241DCC @ =0x000007FF
	ldr r2, _02241DC8 @ =0x02247D48
	adds r0, r0, #3
	lsls r3, r7, #1
	adds r2, r2, r6
	ldrh r0, [r5, r0]
	ldrh r2, [r3, r2]
	subs r0, r0, r2
	ldr r2, _02241DCC @ =0x000007FF
	adds r2, r2, #3
	strh r0, [r5, r2]
	ldrb r0, [r1, r4]
	adds r0, r0, #1
	strb r0, [r1, r4]
	b _02241D8C
_02241CC4:
	cmp r6, r7
	bhs _02241CFA
	ldr r0, [r5, #0x24]
	movs r1, #5
	bl ov83_022477C4
	ldr r0, _02241DCC @ =0x000007FF
	adds r6, r4, #0
	adds r1, r5, r0
	ldrb r7, [r1, r4]
	movs r0, #6
	muls r6, r0, r6
	ldr r0, _02241DCC @ =0x000007FF
	ldr r2, _02241DC8 @ =0x02247D48
	adds r0, r0, #3
	lsls r3, r7, #1
	adds r2, r2, r6
	ldrh r0, [r5, r0]
	ldrh r2, [r3, r2]
	subs r0, r0, r2
	ldr r2, _02241DCC @ =0x000007FF
	adds r2, r2, #3
	strh r0, [r5, r2]
	ldrb r0, [r1, r4]
	adds r0, r0, #1
	strb r0, [r1, r4]
	b _02241D8C
_02241CFA:
	adds r0, r5, #0
	movs r1, #5
	bl ov83_02240C6C
	ldr r0, _02241DC4 @ =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	adds r2, r4, #0
	bl ov83_0224777C
	adds r2, r0, #0
	movs r0, #6
	adds r6, r4, #0
	muls r6, r0, r6
	ldr r3, _02241DC8 @ =0x02247D48
	lsls r2, r2, #1
	adds r3, r3, r6
	ldrb r1, [r5, #9]
	ldrh r2, [r2, r3]
	ldr r0, [r5, #4]
	bl FUN_02237FA4
	ldr r0, _02241DC4 @ =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	adds r2, r4, #0
	bl ov83_0224777C
	adds r7, r0, #0
	ldr r0, _02241DC4 @ =0x0000050C
	ldr r0, [r5, r0]
	bl FUN_0203107C
	str r0, [sp, #0xc]
	ldrb r0, [r5, #9]
	adds r1, r4, #0
	bl FUN_0205C174
	str r0, [sp, #0x10]
	ldrb r0, [r5, #9]
	adds r1, r4, #0
	bl FUN_0205C174
	bl FUN_0205C268
	adds r3, r7, #1
	adds r2, r0, #0
	lsls r3, r3, #0x10
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	lsrs r3, r3, #0x10
	bl FUN_02031108
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _02241D8C
	ldr r0, [sp]
	ldrb r1, [r5, #0xe]
	cmp r0, #4
	bne _02241D82
	movs r0, #0x60
	bics r1, r0
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r5, #0xe]
	b _02241D8C
_02241D82:
	movs r0, #0x60
	bics r1, r0
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r5, #0xe]
_02241D8C:
	adds r0, r5, #0
	bl ov83_02241730
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x50
	bl ov83_02241770
	ldr r0, _02241DD0 @ =0x00000508
	ldr r0, [r5, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0xb0
	bl ov83_02247944
	ldr r1, _02241DD4 @ =0x02247D5A
	lsls r2, r7, #1
	adds r1, r1, r6
	ldrh r1, [r2, r1]
	adds r0, r5, #0
	movs r2, #1
	bl ov83_0223FD14
	strb r0, [r5, #0xa]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02241DC4: .4byte 0x0000050C
_02241DC8: .4byte 0x02247D48
_02241DCC: .4byte 0x000007FF
_02241DD0: .4byte 0x00000508
_02241DD4: .4byte 0x02247D5A
	thumb_func_end ov83_02241BC4

	thumb_func_start ov83_02241DD8
ov83_02241DD8: @ 0x02241DD8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r2, #0
	adds r1, r3, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	adds r2, r6, #0
	bl FUN_0200CBBC
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x24]
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	str r0, [sp, #8]
	ldr r1, [r5, #0x28]
	adds r0, r4, #0
	bl ov83_02247998
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov83_02241DD8

	thumb_func_start ov83_02241E18
ov83_02241E18: @ 0x02241E18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrb r0, [r5, #0x14]
	ldrb r1, [r5, #0xd]
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _02241FA8 @ =0x000007A4
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r6, r0, #0
	bl FUN_0206DD40
	str r0, [sp, #4]
	ldr r0, _02241FAC @ =0x00000804
	str r6, [r5, r0]
	adds r0, r6, #0
	bl FUN_02070DB0
	ldr r1, _02241FB0 @ =0x00000808
	movs r2, #0
	str r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #5
	bl FUN_0206E540
	ldr r1, _02241FB4 @ =0x0000080C
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa1
	bl FUN_0206E540
	ldr r1, _02241FB8 @ =0x0000080F
	movs r2, #0
	strb r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa
	bl FUN_0206E540
	movs r1, #0x81
	lsls r1, r1, #4
	strb r0, [r5, r1]
	adds r0, r6, #0
	bl FUN_0206FDFC
	ldr r1, _02241FBC @ =0x00000811
	movs r2, #0
	strb r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #6
	bl FUN_0206E540
	ldr r1, _02241FC0 @ =0x00000812
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa3
	bl FUN_0206E540
	ldr r1, _02241FC4 @ =0x00000818
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa4
	bl FUN_0206E540
	ldr r1, _02241FC8 @ =0x0000081A
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa5
	bl FUN_0206E540
	ldr r1, _02241FCC @ =0x0000081C
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa8
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _02241FD0 @ =0x0000081E
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa6
	bl FUN_0206E540
	movs r1, #0x82
	lsls r1, r1, #4
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa9
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _02241FD4 @ =0x00000822
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa7
	bl FUN_0206E540
	ldr r1, _02241FD8 @ =0x00000824
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0x70
	bl FUN_0206E540
	ldr r1, _02241FDC @ =0x00000826
	strb r0, [r5, r1]
	movs r1, #0
	adds r0, r6, #0
	adds r2, r1, #0
	bl FUN_0206E540
	ldr r1, _02241FE0 @ =0x00000814
	movs r2, #0
	str r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xb0
	bl FUN_0206E540
	cmp r0, #1
	ldr r1, _02241FE4 @ =0x0000080E
	bne _02241F24
	ldrb r2, [r5, r1]
	movs r0, #0x80
	bics r2, r0
	strb r2, [r5, r1]
	b _02241F2C
_02241F24:
	ldrb r2, [r5, r1]
	movs r0, #0x80
	orrs r0, r2
	strb r0, [r5, r1]
_02241F2C:
	adds r0, r6, #0
	bl FUN_0206FF88
	ldr r3, _02241FE4 @ =0x0000080E
	movs r2, #0x7f
	ldrb r1, [r5, r3]
	movs r4, #0
	bics r1, r2
	movs r2, #0x7f
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, r3]
_02241F44:
	lsls r0, r4, #1
	adds r0, r5, r0
	adds r1, r4, #0
	str r0, [sp]
	adds r0, r6, #0
	adds r1, #0x36
	movs r2, #0
	bl FUN_0206E540
	ldr r2, [sp]
	ldr r1, _02241FE8 @ =0x00000828
	adds r7, r5, r4
	strh r0, [r2, r1]
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x3a
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x83
	lsls r1, r1, #4
	strb r0, [r7, r1]
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x3e
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r1, r1, #0x18
	ldr r2, [sp]
	ldr r0, _02241FE8 @ =0x00000828
	lsrs r1, r1, #0x18
	ldrh r0, [r2, r0]
	bl FUN_0207332C
	ldr r1, _02241FEC @ =0x00000834
	strb r0, [r7, r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	blo _02241F44
	ldr r1, [sp, #4]
	adds r0, r6, #0
	bl FUN_0206DD8C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02241FA8: .4byte 0x000007A4
_02241FAC: .4byte 0x00000804
_02241FB0: .4byte 0x00000808
_02241FB4: .4byte 0x0000080C
_02241FB8: .4byte 0x0000080F
_02241FBC: .4byte 0x00000811
_02241FC0: .4byte 0x00000812
_02241FC4: .4byte 0x00000818
_02241FC8: .4byte 0x0000081A
_02241FCC: .4byte 0x0000081C
_02241FD0: .4byte 0x0000081E
_02241FD4: .4byte 0x00000822
_02241FD8: .4byte 0x00000824
_02241FDC: .4byte 0x00000826
_02241FE0: .4byte 0x00000814
_02241FE4: .4byte 0x0000080E
_02241FE8: .4byte 0x00000828
_02241FEC: .4byte 0x00000834
	thumb_func_end ov83_02241E18

	thumb_func_start ov83_02241FF0
ov83_02241FF0: @ 0x02241FF0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x1b
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x1d
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x1f
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x21
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x23
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x25
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x27
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x29
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x2b
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	ldr r0, _022421DC @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x58
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _022421DC @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x1b
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x4a
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _022421DC @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x1d
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x48
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _022421DC @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x1f
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x46
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _022421DC @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x21
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x59
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _022421DC @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x23
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x4c
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _022421DC @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x50
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _022421DC @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x4e
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _022421DC @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x29
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x52
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _022421DC @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x2b
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x54
	bl ov83_022479E4
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x1b
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x1d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x1f
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x21
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x23
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x25
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x27
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x29
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x2b
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	add sp, #0x10
	pop {r4, pc}
	nop
_022421DC: .4byte 0x00010200
	thumb_func_end ov83_02241FF0

	thumb_func_start ov83_022421E0
ov83_022421E0: @ 0x022421E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r4, r0, #0
	movs r0, #0x17
	lsls r0, r0, #4
	str r1, [sp, #0x14]
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #6
	lsls r0, r0, #6
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x1a
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x1e
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x22
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #9
	lsls r0, r0, #6
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x26
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0xa
	lsls r0, r0, #6
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x2a
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0xb
	lsls r0, r0, #6
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x31
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x33
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0xd
	lsls r0, r0, #6
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0224262C @ =0x00000804
	ldr r0, [r4, r0]
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, [r4, #0x24]
	movs r1, #0
	bl FUN_0200BF8C
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02242630 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #0x17
	lsls r1, r1, #4
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, r4, r1
	movs r3, #0x5b
	bl ov83_02241DD8
	ldr r0, _02242634 @ =0x0000080E
	ldrb r0, [r4, r0]
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x1f
	bne _02242354
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bne _02242334
	movs r3, #0
	str r3, [sp]
	ldr r0, _02242638 @ =0x00050600
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #6
	lsls r0, r0, #6
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x56
	bl ov83_022479E4
	b _02242354
_02242334:
	cmp r0, #1
	bne _02242354
	movs r3, #0
	str r3, [sp]
	movs r0, #0xc1
	str r3, [sp, #4]
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #6
	lsls r0, r0, #6
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x57
	bl ov83_022479E4
_02242354:
	movs r1, #0
	ldr r2, _0224263C @ =0x0000080F
	str r1, [sp]
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #3
	bl ov83_02240C48
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02242630 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #0x1a
	lsls r1, r1, #4
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, r4, r1
	movs r3, #0x5e
	bl ov83_02241DD8
	movs r2, #0x81
	lsls r2, r2, #4
	ldrb r2, [r4, r2]
	ldr r0, [r4, #0x24]
	movs r1, #0
	bl FUN_0200C060
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02242630 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #7
	lsls r1, r1, #6
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, r4, r1
	movs r3, #0x4b
	bl ov83_02241DD8
	ldr r2, _02242640 @ =0x00000811
	ldr r0, [r4, #0x24]
	ldrb r2, [r4, r2]
	movs r1, #0
	bl FUN_0200C098
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02242630 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #0x1e
	lsls r1, r1, #4
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, r4, r1
	movs r3, #0x49
	bl ov83_02241DD8
	ldr r2, _02242644 @ =0x00000812
	ldr r0, [r4, #0x24]
	ldrh r2, [r4, r2]
	movs r1, #0
	bl FUN_0200C0CC
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02242630 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #2
	lsls r1, r1, #8
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, r4, r1
	movs r3, #0x47
	bl ov83_02241DD8
	movs r1, #0
	ldr r2, _02242648 @ =0x00000818
	str r1, [sp]
	ldrh r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #3
	bl ov83_02240C48
	movs r0, #0
	str r0, [sp]
	ldr r2, _0224264C @ =0x0000081A
	adds r0, r4, #0
	ldrh r2, [r4, r2]
	movs r1, #1
	movs r3, #3
	bl ov83_02240C48
	movs r0, #0x22
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 @ =0x00010200
	movs r1, #0x22
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	lsls r1, r1, #4
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, r4, r1
	movs r3, #0x5f
	bl ov83_02241DD8
	movs r1, #0
	ldr r2, _02242650 @ =0x0000081C
	str r1, [sp]
	ldrh r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #3
	bl ov83_02240C48
	movs r0, #9
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 @ =0x00010200
	movs r1, #9
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	lsls r1, r1, #6
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, r4, r1
	movs r3, #0x4d
	bl ov83_02241DD8
	movs r1, #0
	ldr r2, _02242654 @ =0x0000081E
	str r1, [sp]
	ldrh r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #3
	bl ov83_02240C48
	movs r0, #0x26
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 @ =0x00010200
	movs r1, #0x26
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	lsls r1, r1, #4
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, r4, r1
	movs r3, #0x51
	bl ov83_02241DD8
	movs r1, #0
	movs r2, #0x82
	str r1, [sp]
	lsls r2, r2, #4
	ldrh r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #3
	bl ov83_02240C48
	movs r0, #0xa
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 @ =0x00010200
	movs r1, #0xa
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	lsls r1, r1, #6
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, r4, r1
	movs r3, #0x4f
	bl ov83_02241DD8
	movs r1, #0
	ldr r2, _02242658 @ =0x00000822
	str r1, [sp]
	ldrh r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #3
	bl ov83_02240C48
	movs r0, #0x2a
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 @ =0x00010200
	movs r1, #0x2a
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	lsls r1, r1, #4
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, r4, r1
	movs r3, #0x53
	bl ov83_02241DD8
	movs r1, #0
	ldr r2, _0224265C @ =0x00000824
	str r1, [sp]
	ldrh r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #3
	bl ov83_02240C48
	movs r0, #0xb
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 @ =0x00010200
	movs r1, #0xb
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	lsls r1, r1, #6
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, r4, r1
	movs r3, #0x55
	bl ov83_02241DD8
	adds r6, r4, #0
	movs r5, #0
	str r4, [sp, #0x1c]
	adds r6, #0x50
_02242586:
	ldr r3, [sp, #0x1c]
	ldr r2, _02242660 @ =0x00000828
	ldr r0, [r4, #0x24]
	ldrh r2, [r3, r2]
	adds r1, r5, #0
	bl FUN_0200BFF0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02242630 @ =0x00010200
	adds r1, r5, #0
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	adds r1, #0x28
	lsls r1, r1, #4
	adds r3, r5, #0
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, r6, r1
	adds r3, #0x60
	bl ov83_02241DD8
	ldr r1, [sp, #0x1c]
	ldr r0, _02242660 @ =0x00000828
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _022425F2
	adds r0, r5, #0
	adds r0, #0x2c
	lsls r7, r0, #4
	adds r0, r6, r7
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02242630 @ =0x00010200
	lsls r3, r3, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r6, r7
	lsrs r7, r3, #0x1f
	adds r7, r3, r7
	ldr r1, [r4, #0x20]
	movs r2, #0x66
	asrs r3, r7, #1
	bl ov83_022479E4
	b _02242712
_022425F2:
	ldr r0, [r4, #0x20]
	movs r1, #0x5a
	bl FUN_0200BBA0
	str r0, [sp, #0x28]
	movs r0, #0
	ldr r1, [sp, #0x28]
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x10
	str r0, [sp, #0x24]
	adds r0, r5, #0
	adds r0, #0x2c
	lsls r7, r0, #4
	adds r0, r6, r7
	bl FUN_0201EE90
	lsls r1, r0, #3
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	movs r0, #0
	str r0, [sp]
	ldr r0, _02242630 @ =0x00010200
	b _02242664
	.align 2, 0
_0224262C: .4byte 0x00000804
_02242630: .4byte 0x00010200
_02242634: .4byte 0x0000080E
_02242638: .4byte 0x00050600
_0224263C: .4byte 0x0000080F
_02242640: .4byte 0x00000811
_02242644: .4byte 0x00000812
_02242648: .4byte 0x00000818
_0224264C: .4byte 0x0000081A
_02242650: .4byte 0x0000081C
_02242654: .4byte 0x0000081E
_02242658: .4byte 0x00000822
_0224265C: .4byte 0x00000824
_02242660: .4byte 0x00000828
_02242664:
	ldr r1, [sp, #0x28]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r2, [sp, #0x20]
	adds r0, r6, r7
	movs r3, #0
	bl ov83_02247998
	ldr r0, [sp, #0x28]
	bl FUN_02026380
	adds r0, r4, r5
	str r0, [sp, #0x18]
	movs r0, #0
	movs r2, #0x83
	str r0, [sp]
	ldr r3, [sp, #0x18]
	lsls r2, r2, #4
	ldrb r2, [r3, r2]
	adds r0, r4, #0
	movs r1, #0
	movs r3, #2
	bl ov83_02240C48
	ldr r0, [r4, #0x20]
	movs r1, #0x65
	bl FUN_0200BBA0
	str r0, [sp, #0x2c]
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	ldr r2, [sp, #0x2c]
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [r4, #0x28]
	adds r2, r0, #0
	bl FUN_02002F30
	mov ip, r0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0224280C @ =0x00010200
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r3, [sp, #0x20]
	ldr r2, [sp, #0x24]
	ldr r1, [r4, #0x28]
	subs r2, r3, r2
	mov r3, ip
	subs r2, r2, r3
	adds r0, r6, r7
	movs r3, #0
	bl ov83_02247998
	ldr r0, [sp, #0x2c]
	bl FUN_02026380
	movs r0, #0
	str r0, [sp]
	ldr r3, [sp, #0x18]
	ldr r2, _02242810 @ =0x00000834
	adds r0, r4, #0
	ldrb r2, [r3, r2]
	movs r1, #0
	movs r3, #2
	bl ov83_02240C48
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x24]
	movs r3, #0x65
	adds r0, r1, r0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0224280C @ =0x00010200
	adds r1, r6, r7
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	bl ov83_02241DD8
_02242712:
	ldr r0, [sp, #0x1c]
	adds r5, r5, #1
	adds r0, r0, #2
	str r0, [sp, #0x1c]
	cmp r5, #4
	bhs _02242720
	b _02242586
_02242720:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _02242740
	movs r0, #0x17
	lsls r0, r0, #4
	movs r5, #0x12
	adds r4, r4, r0
_0224272E:
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #0x2f
	bls _0224272E
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
_02242740:
	movs r0, #0x17
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #6
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x1a
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x1e
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x22
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #9
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x26
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0xa
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x2a
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0xb
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x31
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x33
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0xd
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201D8A0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224280C: .4byte 0x00010200
_02242810: .4byte 0x00000834
	thumb_func_end ov83_022421E0

	thumb_func_start ov83_02242814
ov83_02242814: @ 0x02242814
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ov83_02241E18
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov83_022421E0
	movs r3, #0x1e
	lsls r3, r3, #6
	adds r2, r3, #0
	adds r1, r3, #0
	adds r2, #0x8c
	ldr r0, [r4, r3]
	adds r1, #0x88
	adds r3, #0x94
	ldrh r2, [r4, r2]
	ldr r1, [r4, r1]
	ldr r3, [r4, r3]
	bl ov83_02247668
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov83_02242814

	thumb_func_start ov83_02242844
ov83_02242844: @ 0x02242844
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	cmp r1, #1
	bne _02242870
	movs r0, #0x17
	lsls r0, r0, #4
	movs r4, #0x12
	adds r5, r6, r0
_02242854:
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0x2f
	bls _02242854
	movs r0, #0x1e
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	movs r1, #1
	bl ov83_0224755C
	pop {r4, r5, r6, pc}
_02242870:
	movs r0, #0x17
	lsls r0, r0, #4
	movs r5, #0x12
	adds r4, r6, r0
_02242878:
	adds r0, r4, #0
	bl FUN_0201D8E4
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #0x2f
	bls _02242878
	movs r0, #0x1e
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	movs r1, #0
	bl ov83_0224755C
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_02242844

	thumb_func_start ov83_02242894
ov83_02242894: @ 0x02242894
	lsls r3, r0, #0x1f
	lsrs r3, r3, #0x18
	adds r3, #0x14
	strh r3, [r1]
	lsrs r1, r0, #1
	movs r0, #0x28
	muls r0, r1, r0
	adds r0, #0x38
	strh r0, [r2]
	bx lr
	thumb_func_end ov83_02242894

	thumb_func_start ov83_022428A8
ov83_022428A8: @ 0x022428A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	str r0, [sp, #0x14]
	adds r0, #0x50
	adds r7, r1, #0
	movs r4, #0
	adds r5, r6, #0
	str r0, [sp, #0x14]
_022428BA:
	adds r0, r4, #0
	adds r0, #0x30
	lsls r1, r0, #4
	ldr r0, [sp, #0x14]
	adds r0, r0, r1
	bl FUN_0201D8E4
	cmp r4, r7
	ldr r0, _022429CC @ =0x00000784
	beq _022428D8
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov83_0224755C
	b _022428E2
_022428D8:
	ldr r0, [r5, r0]
	movs r1, #0x44
	movs r2, #0x4c
	bl ov83_02247568
_022428E2:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blo _022428BA
	ldr r0, _022429D0 @ =0x0000077C
	movs r1, #0
	ldr r0, [r6, r0]
	bl ov83_0224755C
	movs r0, #0x6b
	str r0, [sp]
	ldr r0, _022429D4 @ =0x000007A8
	movs r1, #0x27
	ldr r0, [r6, r0]
	movs r2, #1
	add r3, sp, #0x18
	bl FUN_02007C2C
	movs r3, #0
	adds r4, r0, #0
	str r3, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	ldr r2, [sp, #0x18]
	ldr r0, [r6, #0x4c]
	movs r1, #2
	adds r2, #0xc
	bl FUN_0201C4C4
	ldr r0, [r6, #0x4c]
	movs r1, #2
	bl FUN_0201EFBC
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0x3b
	lsls r0, r0, #4
	adds r0, r6, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0xf
	lsls r0, r0, #6
	adds r0, r6, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _022429D8 @ =0x00000862
	ldr r2, _022429DC @ =0x000004DC
	ldrsh r1, [r6, r0]
	movs r0, #6
	muls r0, r1, r0
	movs r1, #0
	adds r0, r0, r7
	lsls r4, r0, #3
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022429E0 @ =0x00010200
	adds r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r6, r2]
	movs r0, #0x3b
	lsls r0, r0, #4
	ldr r2, [r2, r4]
	adds r0, r6, r0
	bl FUN_020200FC
	ldr r1, _022429DC @ =0x000004DC
	ldrb r2, [r6, #0x13]
	ldr r1, [r6, r1]
	adds r0, r6, #0
	adds r1, r1, r4
	ldr r1, [r1, #4]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ov83_02240EC4
	adds r2, r0, #0
	movs r1, #0
	adds r0, r6, #0
	movs r3, #2
	str r1, [sp]
	bl ov83_02240C48
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _022429E0 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #0xf
	lsls r1, r1, #6
	ldr r2, [r6, #0x20]
	adds r0, r6, #0
	adds r1, r6, r1
	movs r3, #0x68
	bl ov83_02241DD8
	movs r0, #0x3b
	lsls r0, r0, #4
	adds r0, r6, r0
	bl FUN_0201D5C8
	movs r0, #0xf
	lsls r0, r0, #6
	adds r0, r6, r0
	bl FUN_0201D5C8
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022429CC: .4byte 0x00000784
_022429D0: .4byte 0x0000077C
_022429D4: .4byte 0x000007A8
_022429D8: .4byte 0x00000862
_022429DC: .4byte 0x000004DC
_022429E0: .4byte 0x00010200
	thumb_func_end ov83_022428A8

	thumb_func_start ov83_022429E4
ov83_022429E4: @ 0x022429E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #0x3b
	lsls r0, r0, #4
	adds r0, r6, r0
	bl FUN_0201D8E4
	movs r0, #0xf
	lsls r0, r0, #6
	adds r0, r6, r0
	bl FUN_0201D8E4
	movs r0, #0x6b
	str r0, [sp]
	ldr r0, _02242AA0 @ =0x000007A8
	movs r1, #0x26
	ldr r0, [r6, r0]
	movs r2, #1
	add r3, sp, #0x10
	bl FUN_02007C2C
	movs r3, #0
	adds r4, r0, #0
	str r3, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	ldr r2, [sp, #0x10]
	ldr r0, [r6, #0x4c]
	movs r1, #2
	adds r2, #0xc
	bl FUN_0201C4C4
	ldr r0, [r6, #0x4c]
	movs r1, #2
	bl FUN_0201EFBC
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, _02242AA4 @ =0x00000862
	movs r4, #0
	ldrsh r1, [r6, r0]
	movs r0, #6
	adds r5, r6, #0
	adds r7, r1, #0
	muls r7, r0, r7
_02242A46:
	add r1, sp, #0xc
	adds r0, r4, #0
	adds r1, #2
	add r2, sp, #0xc
	bl ov83_02242894
	ldr r0, _02242AA8 @ =0x00000784
	add r1, sp, #0xc
	add r2, sp, #0xc
	ldrh r1, [r1, #2]
	ldrh r2, [r2]
	ldr r0, [r5, r0]
	bl ov83_02247568
	ldr r0, _02242AAC @ =0x00000861
	adds r1, r7, r4
	ldrb r0, [r6, r0]
	cmp r1, r0
	bhs _02242A76
	ldr r0, _02242AA8 @ =0x00000784
	movs r1, #1
	ldr r0, [r5, r0]
	bl ov83_0224755C
_02242A76:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blo _02242A46
	ldr r0, _02242AB0 @ =0x0000077C
	movs r1, #1
	ldr r0, [r6, r0]
	bl ov83_0224755C
	adds r0, r6, #0
	bl ov83_02240664
	adds r0, r6, #0
	bl ov83_022407FC
	adds r0, r6, #0
	bl ov83_0224088C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02242AA0: .4byte 0x000007A8
_02242AA4: .4byte 0x00000862
_02242AA8: .4byte 0x00000784
_02242AAC: .4byte 0x00000861
_02242AB0: .4byte 0x0000077C
	thumb_func_end ov83_022429E4

	thumb_func_start ov83_02242AB4
ov83_02242AB4: @ 0x02242AB4
	ldr r3, _02242ABC @ =ov83_02240DB0
	strb r1, [r0, #0xd]
	strb r2, [r0, #0xc]
	bx r3
	.align 2, 0
_02242ABC: .4byte ov83_02240DB0
	thumb_func_end ov83_02242AB4

	thumb_func_start ov83_02242AC0
ov83_02242AC0: @ 0x02242AC0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02242ADC @ =0x0000077C
	adds r4, r3, #0
	ldr r0, [r5, r0]
	bl ov83_02247568
	ldr r0, _02242ADC @ =0x0000077C
	adds r1, r4, #0
	ldr r0, [r5, r0]
	bl ov83_022475D4
	pop {r3, r4, r5, pc}
	nop
_02242ADC: .4byte 0x0000077C
	thumb_func_end ov83_02242AC0

	thumb_func_start ov83_02242AE0
ov83_02242AE0: @ 0x02242AE0
	ldr r3, _02242AE8 @ =ov83_022408E0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bx r3
	.align 2, 0
_02242AE8: .4byte ov83_022408E0
	thumb_func_end ov83_02242AE0

	thumb_func_start ov83_02242AEC
ov83_02242AEC: @ 0x02242AEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	add r0, sp, #4
	adds r4, r1, #0
	adds r0, #2
	add r1, sp, #4
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov83_02247988
	ldr r0, _02242B9C @ =_02247D0C
	add r1, sp, #4
	ldrh r2, [r0, #0x1e]
	add r3, sp, #8
	strh r2, [r1, #0x1c]
	ldrh r2, [r0, #0x20]
	strh r2, [r1, #0x1e]
	ldrh r2, [r0, #0x22]
	strh r2, [r1, #0x20]
	ldrh r2, [r0, #0x24]
	strh r2, [r1, #0x22]
	ldrh r2, [r0, #0x26]
	ldrh r0, [r0, #0x28]
	strh r2, [r1, #0x24]
	strh r0, [r1, #0x26]
	ldrh r0, [r1, #2]
	strh r0, [r1, #0x22]
	ldrh r2, [r1]
	adds r0, r0, r2
	subs r0, #0x1b
	strh r0, [r1, #0x24]
	strh r2, [r1, #0x26]
	ldrh r0, [r1, #0x1c]
	strh r0, [r1, #4]
	ldrh r0, [r1, #0x1e]
	strh r0, [r1, #6]
	ldrh r0, [r1, #0x20]
	strh r0, [r1, #8]
	ldrh r0, [r1, #0x22]
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0x24]
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0x26]
	strh r0, [r1, #0xe]
	ldr r0, _02242BA0 @ =0x00000844
	ldr r2, [r5, r0]
	subs r0, #8
	str r2, [sp, #0x14]
	ldr r2, [r5, #0x4c]
	str r2, [sp, #0x18]
	strb r4, [r1, #0x18]
	add r1, sp, #0x30
	ldrb r1, [r1, #0x10]
	adds r2, r6, #0
	str r1, [sp]
	adds r1, r3, #0
	ldr r0, [r5, r0]
	adds r3, r7, #0
	bl ov83_02247CCC
	movs r1, #0x21
	lsls r1, r1, #6
	str r0, [r5, r1]
	ldrb r1, [r5, #0xe]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r5, #0xe]
	ldrb r0, [r5, #9]
	movs r1, #1
	bl FUN_02237B24
	adds r4, r0, #0
	ldr r0, _02242BA4 @ =0x0000073C
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #1
	bl ov83_0224773C
	ldr r0, _02242BA8 @ =0x0000074C
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #1
	bl ov83_0224773C
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02242B9C: .4byte _02247D0C
_02242BA0: .4byte 0x00000844
_02242BA4: .4byte 0x0000073C
_02242BA8: .4byte 0x0000074C
	thumb_func_end ov83_02242AEC

	thumb_func_start ov83_02242BAC
ov83_02242BAC: @ 0x02242BAC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #3
	movs r1, #0x6b
	bl FUN_02014918
	ldr r1, _02242BE8 @ =0x00000844
	ldr r5, _02242BEC @ =0x02247D6C
	str r0, [r6, r1]
	movs r4, #0
	adds r7, r1, #0
_02242BC2:
	ldr r0, [r6, r7]
	ldr r1, [r6, #0x20]
	ldr r2, [r5]
	ldr r3, [r5, #4]
	bl FUN_02014960
	adds r4, r4, #1
	adds r5, #8
	cmp r4, #3
	blo _02242BC2
	movs r0, #0xd
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #3
	movs r2, #0x11
	movs r3, #8
	bl ov83_02242AEC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02242BE8: .4byte 0x00000844
_02242BEC: .4byte 0x02247D6C
	thumb_func_end ov83_02242BAC

	thumb_func_start ov83_02242BF0
ov83_02242BF0: @ 0x02242BF0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #5
	movs r1, #0x6b
	bl FUN_02014918
	ldr r1, _02242C9C @ =0x00000844
	movs r2, #0
	str r0, [r4, r1]
	ldr r0, _02242CA0 @ =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	bl ov83_0224777C
	movs r5, #0
	adds r7, r0, #0
	adds r6, r5, #0
_02242C12:
	movs r0, #0xc
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, _02242CA4 @ =0x02247F4C
	adds r2, r0, r1
	ldr r3, [r2, #8]
	cmp r3, #4
	bhi _02242C6A
	adds r0, r3, r3
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02242C2E: @ jump table
	.2byte _02242C6A - _02242C2E - 2 @ case 0
	.2byte _02242C38 - _02242C2E - 2 @ case 1
	.2byte _02242C38 - _02242C2E - 2 @ case 2
	.2byte _02242C38 - _02242C2E - 2 @ case 3
	.2byte _02242C52 - _02242C2E - 2 @ case 4
_02242C38:
	ldr r0, [r2]
	cmp r7, r0
	blo _02242C7C
	ldr r0, _02242C9C @ =0x00000844
	ldr r1, [r4, #0x20]
	ldr r0, [r4, r0]
	ldr r2, [r2, #4]
	bl FUN_02014960
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _02242C7C
_02242C52:
	cmp r7, #3
	beq _02242C7C
	ldr r0, _02242C9C @ =0x00000844
	ldr r1, [r4, #0x20]
	ldr r0, [r4, r0]
	ldr r2, [r2, #4]
	bl FUN_02014960
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _02242C7C
_02242C6A:
	ldr r0, _02242C9C @ =0x00000844
	ldr r1, [r4, #0x20]
	ldr r0, [r4, r0]
	ldr r2, [r2, #4]
	bl FUN_02014960
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_02242C7C:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #5
	blo _02242C12
	ldr r3, _02242CA8 @ =0x02248008
	movs r0, #0xd
	ldrb r3, [r3, r5]
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x11
	bl ov83_02242AEC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02242C9C: .4byte 0x00000844
_02242CA0: .4byte 0x0000050C
_02242CA4: .4byte 0x02247F4C
_02242CA8: .4byte 0x02248008
	thumb_func_end ov83_02242BF0

	thumb_func_start ov83_02242CAC
ov83_02242CAC: @ 0x02242CAC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #4
	movs r1, #0x6b
	bl FUN_02014918
	ldr r1, _02242D4C @ =0x00000844
	movs r2, #1
	str r0, [r5, r1]
	ldr r0, _02242D50 @ =0x0000050C
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	bl ov83_0224777C
	movs r4, #0
	adds r7, r0, #0
	adds r6, r4, #0
_02242CCE:
	movs r0, #0xc
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, _02242D54 @ =0x02247EB0
	adds r2, r0, r1
	ldr r3, [r2, #8]
	cmp r3, #6
	beq _02242CE8
	cmp r3, #7
	beq _02242CE8
	cmp r3, #8
	beq _02242D02
	b _02242D1A
_02242CE8:
	ldr r0, [r2]
	cmp r7, r0
	blo _02242D2C
	ldr r0, _02242D4C @ =0x00000844
	ldr r1, [r5, #0x20]
	ldr r0, [r5, r0]
	ldr r2, [r2, #4]
	bl FUN_02014960
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _02242D2C
_02242D02:
	cmp r7, #3
	beq _02242D2C
	ldr r0, _02242D4C @ =0x00000844
	ldr r1, [r5, #0x20]
	ldr r0, [r5, r0]
	ldr r2, [r2, #4]
	bl FUN_02014960
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _02242D2C
_02242D1A:
	ldr r0, _02242D4C @ =0x00000844
	ldr r1, [r5, #0x20]
	ldr r0, [r5, r0]
	ldr r2, [r2, #4]
	bl FUN_02014960
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_02242D2C:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #4
	blo _02242CCE
	ldr r3, _02242D58 @ =0x02248008
	movs r0, #0xd
	ldrb r3, [r3, r4]
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x11
	bl ov83_02242AEC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02242D4C: .4byte 0x00000844
_02242D50: .4byte 0x0000050C
_02242D54: .4byte 0x02247EB0
_02242D58: .4byte 0x02248008
	thumb_func_end ov83_02242CAC

	thumb_func_start ov83_02242D5C
ov83_02242D5C: @ 0x02242D5C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	movs r1, #1
	bl FUN_02237B24
	adds r4, r0, #0
	ldr r0, _02242DA0 @ =0x0000073C
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	bl ov83_0224773C
	ldr r0, _02242DA4 @ =0x0000074C
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	bl ov83_0224773C
	movs r0, #0x21
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl ov83_02247CE8
	ldr r0, _02242DA8 @ =0x00000844
	ldr r0, [r5, r0]
	bl FUN_02014950
	ldrb r1, [r5, #0xe]
	movs r0, #0x10
	bics r1, r0
	strb r1, [r5, #0xe]
	pop {r3, r4, r5, pc}
	nop
_02242DA0: .4byte 0x0000073C
_02242DA4: .4byte 0x0000074C
_02242DA8: .4byte 0x00000844
	thumb_func_end ov83_02242D5C

	thumb_func_start ov83_02242DAC
ov83_02242DAC: @ 0x02242DAC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	movs r1, #0x21
	adds r4, r0, #0
	lsls r1, r1, #6
	ldr r2, [r4, r1]
	adds r1, #8
	adds r2, #0x24
	ldrb r2, [r2]
	ldr r1, [r4, r1]
	cmp r1, r2
	beq _02242DF4
	movs r3, #1
	str r3, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	lsls r5, r2, #1
	ldr r2, _02242DF8 @ =0x02247D1E
	str r3, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	movs r1, #0xf
	str r1, [sp, #0x10]
	adds r1, r4, #0
	ldrh r2, [r2, r5]
	adds r1, #0xb0
	str r3, [sp, #0x14]
	bl ov83_0223FC48
	movs r0, #0x21
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	adds r0, #8
	adds r1, #0x24
	ldrb r1, [r1]
	str r1, [r4, r0]
_02242DF4:
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_02242DF8: .4byte 0x02247D1E
	thumb_func_end ov83_02242DAC

	thumb_func_start ov83_02242DFC
ov83_02242DFC: @ 0x02242DFC
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	movs r0, #0x21
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	adds r1, #0x24
	ldrb r2, [r1]
	adds r1, r0, #0
	adds r1, #8
	ldr r1, [r4, r1]
	cmp r1, r2
	beq _02242E80
	adds r0, r0, #4
	ldr r1, [r4, r0]
	lsls r0, r2, #3
	adds r0, r1, r0
	ldr r1, [r0, #4]
	cmp r1, #4
	beq _02242E2E
	movs r0, #1
	mvns r0, r0
	cmp r1, r0
	beq _02242E4E
	b _02242E52
_02242E2E:
	ldr r0, _02242E84 @ =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	movs r2, #0
	bl ov83_0224777C
	cmp r0, #3
	bne _02242E42
	movs r2, #0x1b
	b _02242E54
_02242E42:
	cmp r0, #1
	bne _02242E4A
	movs r2, #0x19
	b _02242E54
_02242E4A:
	movs r2, #0x1a
	b _02242E54
_02242E4E:
	movs r2, #0x1c
	b _02242E54
_02242E52:
	movs r2, #0x18
_02242E54:
	movs r3, #1
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	adds r1, r4, #0
	str r3, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r1, #0xb0
	str r3, [sp, #0x14]
	bl ov83_0223FC48
	movs r0, #0x21
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	adds r0, #8
	adds r1, #0x24
	ldrb r1, [r1]
	str r1, [r4, r0]
_02242E80:
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
_02242E84: .4byte 0x0000050C
	thumb_func_end ov83_02242DFC

	thumb_func_start ov83_02242E88
ov83_02242E88: @ 0x02242E88
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	movs r0, #0x21
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	adds r1, #0x24
	ldrb r2, [r1]
	adds r1, r0, #0
	adds r1, #8
	ldr r1, [r4, r1]
	cmp r1, r2
	beq _02242F10
	adds r0, r0, #4
	ldr r1, [r4, r0]
	lsls r0, r2, #3
	adds r0, r1, r0
	ldr r0, [r0, #4]
	cmp r0, #6
	beq _02242EBA
	cmp r0, #7
	beq _02242EBE
	cmp r0, #8
	beq _02242EC2
	b _02242EE2
_02242EBA:
	movs r2, #0x30
	b _02242EE4
_02242EBE:
	movs r2, #0x31
	b _02242EE4
_02242EC2:
	ldr r0, _02242F14 @ =0x0000050C
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	movs r2, #1
	bl ov83_0224777C
	cmp r0, #3
	bne _02242ED6
	movs r2, #0x34
	b _02242EE4
_02242ED6:
	cmp r0, #1
	bne _02242EDE
	movs r2, #0x32
	b _02242EE4
_02242EDE:
	movs r2, #0x33
	b _02242EE4
_02242EE2:
	movs r2, #0x35
_02242EE4:
	movs r3, #1
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	adds r1, r4, #0
	str r3, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r1, #0xb0
	str r3, [sp, #0x14]
	bl ov83_0223FC48
	movs r0, #0x21
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	adds r0, #8
	adds r1, #0x24
	ldrb r1, [r1]
	str r1, [r4, r0]
_02242F10:
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
_02242F14: .4byte 0x0000050C
	thumb_func_end ov83_02242E88

	thumb_func_start ov83_02242F18
ov83_02242F18: @ 0x02242F18
	ldr r2, _02242F28 @ =0x00000864
	movs r3, #0
	strh r1, [r0, r2]
	adds r1, r2, #2
	strb r3, [r0, r1]
	adds r1, r2, #3
	strb r3, [r0, r1]
	bx lr
	.align 2, 0
_02242F28: .4byte 0x00000864
	thumb_func_end ov83_02242F18

	thumb_func_start ov83_02242F2C
ov83_02242F2C: @ 0x02242F2C
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _02242FD8 @ =0x00000864
	adds r4, r0, #0
	ldrh r0, [r4, r1]
	ldr r2, _02242FDC @ =0x02247E64
	lsls r0, r0, #2
	adds r3, r2, r0
	adds r0, r1, #2
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02242F4E
	cmp r0, #1
	beq _02242F78
	cmp r0, #2
	beq _02242FBA
	b _02242FD0
_02242F4E:
	ldrb r0, [r3, #2]
	movs r1, #2
	str r0, [sp]
	ldrb r0, [r3, #3]
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	ldrb r2, [r3]
	ldrb r3, [r3, #1]
	ldr r0, [r4, #0x4c]
	bl FUN_0201CA4C
	ldr r0, [r4, #0x4c]
	movs r1, #2
	bl FUN_0201EFBC
	ldr r0, _02242FE0 @ =0x00000866
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _02242FD0
_02242F78:
	adds r0, r1, #3
	ldrb r0, [r4, r0]
	adds r2, r0, #1
	adds r0, r1, #3
	strb r2, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #4
	bne _02242FD0
	ldrb r0, [r3, #2]
	movs r1, #2
	str r0, [sp]
	ldrb r0, [r3, #3]
	str r0, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	ldrb r2, [r3]
	ldrb r3, [r3, #1]
	ldr r0, [r4, #0x4c]
	bl FUN_0201CA4C
	ldr r0, [r4, #0x4c]
	movs r1, #2
	bl FUN_0201EFBC
	ldr r0, _02242FE4 @ =0x00000867
	movs r1, #0
	strb r1, [r4, r0]
	subs r1, r0, #1
	ldrb r1, [r4, r1]
	subs r0, r0, #1
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _02242FD0
_02242FBA:
	adds r0, r1, #3
	ldrb r0, [r4, r0]
	adds r2, r0, #1
	adds r0, r1, #3
	strb r2, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #2
	bne _02242FD0
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_02242FD0:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02242FD8: .4byte 0x00000864
_02242FDC: .4byte 0x02247E64
_02242FE0: .4byte 0x00000866
_02242FE4: .4byte 0x00000867
	thumb_func_end ov83_02242F2C

	thumb_func_start ov83_02242FE8
ov83_02242FE8: @ 0x02242FE8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _022430F0 @ =0x00000050
	movs r1, #2
	bl FUN_02006FF8
	bl ov83_02243F9C
	movs r0, #3
	movs r1, #0x6b
	lsls r2, r0, #0x10
	bl FUN_0201A910
	ldr r1, _022430F4 @ =0x00000614
	adds r0, r4, #0
	movs r2, #0x6b
	bl FUN_02007280
	ldr r2, _022430F4 @ =0x00000614
	movs r1, #0
	adds r5, r0, #0
	blx FUN_020E5B44
	movs r0, #0x6b
	bl FUN_0201AC88
	str r0, [r5, #0x4c]
	adds r0, r4, #0
	str r4, [r5]
	bl FUN_020072A4
	adds r4, r0, #0
	movs r0, #0xaf
	ldr r1, [r4]
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	bl FUN_02030CC8
	movs r1, #0xb
	lsls r1, r1, #6
	str r0, [r5, r1]
	subs r0, r1, #4
	ldr r0, [r5, r0]
	bl FUN_02030E08
	movs r1, #0xb1
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldrb r0, [r4, #4]
	adds r2, r4, #0
	adds r2, #0x20
	strb r0, [r5, #9]
	ldr r0, _022430F8 @ =0x00000548
	subs r1, #8
	str r2, [r5, r0]
	ldr r0, [r5, r1]
	bl FUN_02028EA8
	movs r1, #0xae
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r3, r4, #0
	ldr r2, [r4, #0x1c]
	ldr r0, _022430FC @ =0x0000055C
	adds r3, #8
	str r2, [r5, r0]
	adds r2, r0, #0
	subs r2, #0x10
	str r3, [r5, r2]
	adds r3, r4, #0
	adds r2, r0, #0
	adds r3, #0xc
	subs r2, #0xc
	str r3, [r5, r2]
	adds r3, r4, #0
	adds r2, r0, #0
	adds r3, #0x10
	subs r2, #8
	str r3, [r5, r2]
	adds r3, r4, #0
	subs r2, r0, #4
	adds r3, #0x14
	str r3, [r5, r2]
	movs r2, #0xff
	strb r2, [r5, #0x11]
	ldrh r2, [r4, #0x28]
	adds r0, #0x5e
	strh r2, [r5, r0]
	adds r0, r1, #4
	ldr r0, [r5, r0]
	bl FUN_0203107C
	str r0, [r5, #4]
	ldr r0, _02243100 @ =0x000005B7
	movs r3, #0
	movs r2, #1
_022430AA:
	adds r1, r5, r3
	adds r3, r3, #1
	strb r2, [r1, r0]
	cmp r3, #3
	blt _022430AA
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _022430C2
	movs r0, #3
	b _022430C4
_022430C2:
	movs r0, #4
_022430C4:
	strb r0, [r5, #0x14]
	movs r0, #4
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0x15]
	movs r1, #0
	subs r0, r0, #1
	strb r0, [r5, #0xc]
	ldr r0, _02243104 @ =0x000005B4
	strb r1, [r5, r0]
	adds r0, r5, #0
	bl ov83_02243FD4
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _022430EC
	adds r0, r5, #0
	bl FUN_02096910
_022430EC:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_022430F0: .4byte 0x00000050
_022430F4: .4byte 0x00000614
_022430F8: .4byte 0x00000548
_022430FC: .4byte 0x0000055C
_02243100: .4byte 0x000005B7
_02243104: .4byte 0x000005B4
	thumb_func_end ov83_02242FE8

	thumb_func_start ov83_02243108
ov83_02243108: @ 0x02243108
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, _02243260 @ =0x000005B6
	adds r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #1
	bne _02243176
	ldr r2, [r5]
	cmp r2, #1
	bne _022431A2
	movs r2, #0
	strb r2, [r4, r1]
	bl ov83_02245074
	adds r0, r4, #0
	bl ov83_022459A0
	ldr r0, _02243264 @ =0x00000504
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02243142
	bl ov83_0224753C
	ldrb r1, [r4, #0xf]
	movs r0, #1
	bics r1, r0
	strb r1, [r4, #0xf]
_02243142:
	movs r0, #0xae
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02247944
	ldr r0, [r4, #0x24]
	movs r1, #0
	bl FUN_0222A7CC
	adds r0, r4, #0
	movs r1, #7
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl ov83_02244CD4
	b _022431A2
_02243176:
	ldrb r0, [r4, #0x11]
	cmp r0, #0xff
	beq _022431A2
	ldr r0, [r5]
	cmp r0, #1
	beq _02243186
	cmp r0, #3
	bne _022431A2
_02243186:
	ldr r0, _02243260 @ =0x000005B6
	movs r1, #0
	strb r1, [r4, r0]
	adds r0, r4, #0
	bl ov83_02245074
	adds r0, r4, #0
	bl ov83_022459A0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ov83_02244CD4
_022431A2:
	ldr r0, [r5]
	cmp r0, #4
	bhi _0224324C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022431B4: @ jump table
	.2byte _022431BE - _022431B4 - 2 @ case 0
	.2byte _022431D4 - _022431B4 - 2 @ case 1
	.2byte _02243212 - _022431B4 - 2 @ case 2
	.2byte _02243228 - _022431B4 - 2 @ case 3
	.2byte _0224323E - _022431B4 - 2 @ case 4
_022431BE:
	adds r0, r4, #0
	bl ov83_022432B4
	cmp r0, #1
	bne _0224324C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov83_02244CD4
	b _0224324C
_022431D4:
	adds r0, r4, #0
	bl ov83_022433F8
	cmp r0, #1
	bne _0224324C
	ldrb r0, [r4, #0x10]
	cmp r0, #1
	bne _022431F0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ov83_02244CD4
	b _0224324C
_022431F0:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _02243206
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl ov83_02244CD4
	b _0224324C
_02243206:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl ov83_02244CD4
	b _0224324C
_02243212:
	adds r0, r4, #0
	bl ov83_02243C88
	cmp r0, #1
	bne _0224324C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov83_02244CD4
	b _0224324C
_02243228:
	adds r0, r4, #0
	bl ov83_02243D7C
	cmp r0, #1
	bne _0224324C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl ov83_02244CD4
	b _0224324C
_0224323E:
	adds r0, r4, #0
	bl ov83_02243DE8
	cmp r0, #1
	bne _0224324C
	movs r0, #1
	pop {r3, r4, r5, pc}
_0224324C:
	adds r0, r4, #0
	bl ov83_022459AC
	movs r0, #0xb2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202457C
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02243260: .4byte 0x000005B6
_02243264: .4byte 0x00000504
	thumb_func_end ov83_02243108

	thumb_func_start ov83_02243268
ov83_02243268: @ 0x02243268
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, _022432A8 @ =0x00000548
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, r0]
	strh r1, [r0]
	ldr r0, _022432AC @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	bl FUN_020205AC
	adds r0, r4, #0
	bl ov83_02243E30
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x6b
	bl FUN_0201A9C4
	ldr r0, _022432B0 @ =0x00000050
	bl FUN_02006F7C
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_022432A8: .4byte 0x00000548
_022432AC: .4byte 0x04000050
_022432B0: .4byte 0x00000050
	thumb_func_end ov83_02243268

	thumb_func_start ov83_022432B4
ov83_022432B4: @ 0x022432B4
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #4
	bhi _022433B0
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022432CC: @ jump table
	.2byte _022432D6 - _022432CC - 2 @ case 0
	.2byte _022432F2 - _022432CC - 2 @ case 1
	.2byte _0224331A - _022432CC - 2 @ case 2
	.2byte _02243360 - _022432CC - 2 @ case 3
	.2byte _022433A2 - _022432CC - 2 @ case 4
_022432D6:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _022432EA
	bl FUN_02037BEC
	movs r0, #0xd8
	bl FUN_02037AC0
_022432EA:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_022432F2:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _02243312
	movs r0, #0xd8
	bl FUN_02037B38
	cmp r0, #1
	bne _022433B0
	bl FUN_02037BEC
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_02243312:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_0224331A:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _0224333A
	adds r0, r4, #0
	movs r1, #0x14
	movs r2, #0
	bl ov83_022450A8
	cmp r0, #1
	bne _022433B0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_0224333A:
	adds r0, r4, #0
	bl ov83_022433B8
	movs r0, #6
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_02243360:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _0224339A
	ldrb r0, [r4, #0x17]
	cmp r0, #2
	blo _022433B0
	movs r0, #0
	strb r0, [r4, #0x17]
	adds r0, r4, #0
	bl ov83_022433B8
	movs r0, #6
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_0224339A:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _022433B0
_022433A2:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _022433B0
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_022433B0:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov83_022432B4

	thumb_func_start ov83_022433B8
ov83_022433B8: @ 0x022433B8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x50
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov83_02245584
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov83_022453DC
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x80
	bl ov83_022448E4
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x70
	bl ov83_022449D4
	adds r0, r5, #0
	bl ov83_02244BEC
	bl FUN_02022D24
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_022433B8

	thumb_func_start ov83_022433F8
ov83_022433F8: @ 0x022433F8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0x12
	bhi _022434BA
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224340E: @ jump table
	.2byte _02243434 - _0224340E - 2 @ case 0
	.2byte _0224348E - _0224340E - 2 @ case 1
	.2byte _022434F6 - _0224340E - 2 @ case 2
	.2byte _0224361E - _0224340E - 2 @ case 3
	.2byte _022436D4 - _0224340E - 2 @ case 4
	.2byte _022437D8 - _0224340E - 2 @ case 5
	.2byte _022438AE - _0224340E - 2 @ case 6
	.2byte _02243A36 - _0224340E - 2 @ case 7
	.2byte _02243A76 - _0224340E - 2 @ case 8
	.2byte _02243AB6 - _0224340E - 2 @ case 9
	.2byte _02243B5A - _0224340E - 2 @ case 10
	.2byte _02243B86 - _0224340E - 2 @ case 11
	.2byte _02243B92 - _0224340E - 2 @ case 12
	.2byte _02243BBC - _0224340E - 2 @ case 13
	.2byte _02243BCE - _0224340E - 2 @ case 14
	.2byte _02243BE0 - _0224340E - 2 @ case 15
	.2byte _02243BFA - _0224340E - 2 @ case 16
	.2byte _02243C1C - _0224340E - 2 @ case 17
	.2byte _02243C4C - _0224340E - 2 @ case 18
_02243434:
	movs r0, #0
	strb r0, [r4, #0xb]
	movs r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #0xf]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	cmp r0, #1
	bne _02243456
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02245094
	adds r0, r4, #0
	bl ov83_02244BEC
	b _02243484
_02243456:
	cmp r0, #2
	bne _0224347C
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02245094
	adds r0, r4, #0
	bl ov83_02244C9C
	movs r0, #0x15
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0xc8
	movs r2, #0x69
	bl ov83_02247630
	movs r0, #6
	strb r0, [r4, #8]
	b _02243484
_0224347C:
	cmp r0, #3
	bne _02243484
	movs r0, #0xe
	strb r0, [r4, #8]
_02243484:
	ldrb r1, [r4, #0xf]
	movs r0, #0xf8
	bics r1, r0
	strb r1, [r4, #0xf]
	b _02243C7A
_0224348E:
	movs r0, #0x5f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov83_02247AD4
	cmp r0, #4
	bhi _022434B2
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022434A8: @ jump table
	.2byte _022434BC - _022434A8 - 2 @ case 0
	.2byte _022434BC - _022434A8 - 2 @ case 1
	.2byte _022434BC - _022434A8 - 2 @ case 2
	.2byte _022434BC - _022434A8 - 2 @ case 3
	.2byte _022434CE - _022434A8 - 2 @ case 4
_022434B2:
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _022434D8
_022434BA:
	b _02243C7A
_022434BC:
	adds r0, r4, #0
	bl ov83_02244C4C
	adds r0, r4, #0
	bl ov83_02244C58
	movs r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_022434CE:
	ldr r0, _022437F0 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	pop {r3, r4, r5, pc}
_022434D8:
	ldrb r1, [r4, #0xd]
	ldrb r0, [r4, #0x15]
	cmp r1, r0
	beq _0224351A
	movs r0, #0x5f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov83_02247B04
	ldrb r2, [r4, #0xd]
	adds r0, r4, #0
	movs r1, #4
	bl ov83_022469D8
	b _02243C7A
_022434F6:
	ldr r0, _022437F4 @ =0x000005F8
	ldr r0, [r4, r0]
	bl FUN_020186A4
	ldr r1, _022437F0 @ =0x000005DC
	adds r5, r0, #0
	bl ov83_022477B0
	adds r0, r4, #0
	bl ov83_02246CC0
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	bhi _02243536
	bhs _0224360C
	cmp r5, #6
	bls _0224351C
_0224351A:
	b _02243C7A
_0224351C:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02243528: @ jump table
	.2byte _0224353E - _02243528 - 2 @ case 0
	.2byte _022435C6 - _02243528 - 2 @ case 1
	.2byte _022435FA - _02243528 - 2 @ case 2
	.2byte _02243C7A - _02243528 - 2 @ case 3
	.2byte _02243C7A - _02243528 - 2 @ case 4
	.2byte _02243C7A - _02243528 - 2 @ case 5
	.2byte _0224360C - _02243528 - 2 @ case 6
_02243536:
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	b _02243C7A
_0224353E:
	strb r5, [r4, #0x13]
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	ldr r1, _022437F8 @ =0x0000054C
	ldr r1, [r4, r1]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02243584
	adds r0, r4, #0
	bl ov83_02244C88
	adds r0, r4, #0
	bl ov83_022453C0
	movs r1, #0
	adds r0, r4, #0
	movs r2, #1
	movs r3, #4
	str r1, [sp]
	bl ov83_02244A98
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	bl ov83_02244A74
	movs r0, #3
	strb r0, [r4, #8]
	b _02243C7A
_02243584:
	adds r0, r4, #0
	bl ov83_02244C88
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _022437FC @ =0x0000055C
	ldr r0, [r4, r0]
	bl FUN_02074644
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov83_022453C0
	adds r0, r5, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov83_02244AB0
	adds r0, r4, #0
	movs r1, #0x14
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	movs r0, #0x10
	strb r0, [r4, #8]
	b _02243C7A
_022435C6:
	adds r0, r4, #0
	strb r5, [r4, #0x13]
	bl ov83_02244C88
	adds r0, r4, #0
	bl ov83_022453C0
	movs r2, #0x17
	lsls r2, r2, #6
	ldr r2, [r4, r2]
	adds r0, r4, #0
	movs r1, #0
	bl ov83_02244AB0
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	bl ov83_02244A88
	movs r0, #4
	strb r0, [r4, #8]
	b _02243C7A
_022435FA:
	adds r0, r4, #0
	bl ov83_02244C88
	adds r0, r4, #0
	bl ov83_02244C9C
	movs r0, #6
	strb r0, [r4, #8]
	b _02243C7A
_0224360C:
	adds r0, r4, #0
	bl ov83_02244C88
	adds r0, r4, #0
	bl ov83_02244BEC
	movs r0, #0
	strb r0, [r4, #8]
	b _02243C7A
_0224361E:
	ldr r0, _02243800 @ =0x00000604
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _02243630
	cmp r0, #2
	beq _022436B8
	b _02243C7A
_02243630:
	ldr r0, _02243800 @ =0x00000604
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02245094
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	adds r5, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl FUN_020310BC
	cmp r0, #1
	bhs _02243678
	adds r0, r4, #0
	bl ov83_022453C0
	adds r0, r4, #0
	movs r1, #0x1c
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	movs r0, #0x10
	strb r0, [r4, #8]
	b _02243C7A
_02243678:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _022436B2
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	movs r2, #1
	bl FUN_02237FA4
	adds r1, r4, #0
	adds r0, r4, #0
	adds r1, #0x50
	bl ov83_022453DC
	ldrb r1, [r4, #0xd]
	adds r0, r4, #0
	bl ov83_02245748
	adds r0, r4, #0
	bl ov83_02246988
	adds r0, r4, #0
	movs r1, #0
	bl ov83_02246114
	movs r0, #0xb
	strb r0, [r4, #8]
	b _02243C7A
_022436B2:
	movs r0, #1
	strb r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_022436B8:
	ldr r0, _02243800 @ =0x00000604
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02245094
	adds r0, r4, #0
	bl ov83_02244C58
	movs r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_022436D4:
	ldr r0, _022437F4 @ =0x000005F8
	ldr r0, [r4, r0]
	bl FUN_020186A4
	ldr r1, _022437F0 @ =0x000005DC
	adds r5, r0, #0
	bl ov83_022477B0
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	bhi _02243700
	bhs _02243706
	cmp r5, #2
	bhi _022436FE
	cmp r5, #0
	beq _02243720
	cmp r5, #1
	beq _0224377C
	cmp r5, #2
	beq _02243706
_022436FE:
	b _02243C7A
_02243700:
	adds r0, r0, #1
	cmp r5, r0
	b _02243C7A
_02243706:
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02245094
	adds r0, r4, #0
	bl ov83_02244A90
	adds r0, r4, #0
	bl ov83_02244C58
	movs r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_02243720:
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	adds r5, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl FUN_020310BC
	adds r0, r4, #0
	bl ov83_02244A90
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	movs r1, #0x55
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0224376E
	adds r0, r4, #0
	bl ov83_022453C0
	adds r0, r4, #0
	movs r1, #0x1d
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	movs r0, #0x10
	strb r0, [r4, #8]
	b _02243C7A
_0224376E:
	adds r0, r4, #0
	movs r1, #1
	bl ov83_02245554
	movs r0, #5
	strb r0, [r4, #8]
	b _02243C7A
_0224377C:
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	adds r5, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl FUN_020310BC
	adds r0, r4, #0
	bl ov83_02244A90
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	movs r1, #0x55
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _022437CA
	adds r0, r4, #0
	bl ov83_022453C0
	adds r0, r4, #0
	movs r1, #0x1e
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	movs r0, #0x10
	strb r0, [r4, #8]
	b _02243C7A
_022437CA:
	adds r0, r4, #0
	movs r1, #2
	bl ov83_02245554
	movs r0, #5
	strb r0, [r4, #8]
	b _02243C7A
_022437D8:
	ldr r0, _02243800 @ =0x00000604
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _022437EA
	cmp r0, #2
	beq _02243892
	b _02243C7A
_022437EA:
	ldr r0, _02243800 @ =0x00000604
	b _02243804
	nop
_022437F0: .4byte 0x000005DC
_022437F4: .4byte 0x000005F8
_022437F8: .4byte 0x0000054C
_022437FC: .4byte 0x0000055C
_02243800: .4byte 0x00000604
_02243804:
	adds r0, r4, r0
	bl ov83_022478B4
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	adds r5, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl FUN_020310BC
	adds r5, r0, #0
	ldrb r0, [r4, #0xe]
	bl ov83_02245068
	cmp r5, r0
	bhs _0224384C
	adds r0, r4, #0
	bl ov83_022453C0
	adds r0, r4, #0
	movs r1, #0x1c
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	movs r0, #0x10
	strb r0, [r4, #8]
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224384C:
	ldrb r0, [r4, #0xe]
	strb r0, [r4, #0x12]
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _0224388C
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02245094
	ldrb r0, [r4, #0xe]
	bl ov83_02245068
	adds r2, r0, #0
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	bl FUN_02237FA4
	adds r1, r4, #0
	adds r0, r4, #0
	adds r1, #0x50
	bl ov83_022453DC
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xe]
	adds r0, r4, #0
	bl ov83_02245838
	movs r0, #0xc
	strb r0, [r4, #8]
	b _02243C7A
_0224388C:
	movs r0, #1
	strb r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_02243892:
	ldr r0, _02243BA8 @ =0x00000604
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02245094
	adds r0, r4, #0
	bl ov83_02244C58
	movs r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_022438AE:
	ldr r0, _02243BAC @ =0x000005F8
	ldr r0, [r4, r0]
	bl FUN_020186A4
	ldr r1, _02243BB0 @ =0x000005DC
	adds r5, r0, #0
	bl ov83_022477B0
	adds r0, r4, #0
	bl ov83_02246D40
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	bhi _022438E2
	bhs _022438E8
	cmp r5, #5
	bhi _022438E0
	cmp r5, #3
	blo _022438E0
	beq _02243902
	cmp r5, #4
	beq _0224394E
	cmp r5, #5
	beq _022439C0
_022438E0:
	b _02243C7A
_022438E2:
	adds r0, r0, #1
	cmp r5, r0
	b _02243C7A
_022438E8:
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02245094
	adds r0, r4, #0
	bl ov83_02244CCC
	adds r0, r4, #0
	bl ov83_02244C58
	movs r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_02243902:
	strb r5, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02244CCC
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	ldr r1, _02243BB4 @ =0x00000554
	ldr r1, [r4, r1]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02243948
	adds r0, r4, #0
	bl ov83_022453C0
	movs r1, #0
	adds r0, r4, #0
	movs r2, #2
	movs r3, #4
	str r1, [sp]
	bl ov83_02244A98
	adds r0, r4, #0
	movs r1, #0x2b
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	bl ov83_02244A74
	movs r0, #7
	strb r0, [r4, #8]
	b _02243C7A
_02243948:
	movs r0, #0x11
	strb r0, [r4, #8]
	b _02243C7A
_0224394E:
	adds r0, r4, #0
	strb r5, [r4, #0x13]
	bl ov83_02244CCC
	movs r0, #0xaf
	lsls r0, r0, #2
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	movs r2, #2
	bl ov83_0224777C
	cmp r0, #1
	bne _0224397C
	adds r0, r4, #0
	movs r1, #0x2a
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	movs r0, #0xf
	strb r0, [r4, #8]
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224397C:
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	ldr r1, _02243BB8 @ =0x00000558
	ldr r1, [r4, r1]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _022439BA
	adds r0, r4, #0
	bl ov83_022453C0
	movs r1, #0
	adds r0, r4, #0
	movs r2, #5
	movs r3, #4
	str r1, [sp]
	bl ov83_02244A98
	adds r0, r4, #0
	movs r1, #0x4f
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	bl ov83_02244A74
	movs r0, #8
	strb r0, [r4, #8]
	b _02243C7A
_022439BA:
	movs r0, #0x12
	strb r0, [r4, #8]
	b _02243C7A
_022439C0:
	movs r0, #0xaf
	lsls r0, r0, #2
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	movs r2, #2
	bl ov83_0224777C
	cmp r0, #2
	bne _022439EC
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02245094
	adds r0, r4, #0
	bl ov83_02244CCC
	adds r0, r4, #0
	bl ov83_02244C58
	movs r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_022439EC:
	strb r5, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02244CCC
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	adds r5, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl FUN_020310BC
	movs r1, #0
	adds r0, r4, #0
	movs r2, #0x32
	movs r3, #4
	str r1, [sp]
	bl ov83_02244A98
	adds r0, r4, #0
	movs r1, #0x5b
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	bl ov83_02244A74
	movs r0, #9
	strb r0, [r4, #8]
	b _02243C7A
_02243A36:
	ldr r0, _02243BA8 @ =0x00000604
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _02243A48
	cmp r0, #2
	beq _02243A62
	b _02243C7A
_02243A48:
	ldr r0, _02243BA8 @ =0x00000604
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0x2e
	bl ov83_02245A40
	cmp r0, #1
	bne _02243A86
	movs r0, #1
	pop {r3, r4, r5, pc}
_02243A62:
	ldr r0, _02243BA8 @ =0x00000604
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	bl ov83_02244C9C
	movs r0, #6
	strb r0, [r4, #8]
	b _02243C7A
_02243A76:
	ldr r0, _02243BA8 @ =0x00000604
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _02243A88
	cmp r0, #2
	beq _02243AA2
_02243A86:
	b _02243C7A
_02243A88:
	ldr r0, _02243BA8 @ =0x00000604
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0x52
	bl ov83_02245A40
	cmp r0, #1
	bne _02243AC6
	movs r0, #1
	pop {r3, r4, r5, pc}
_02243AA2:
	ldr r0, _02243BA8 @ =0x00000604
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	bl ov83_02244C9C
	movs r0, #6
	strb r0, [r4, #8]
	b _02243C7A
_02243AB6:
	ldr r0, _02243BA8 @ =0x00000604
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _02243AC8
	cmp r0, #2
	beq _02243B46
_02243AC6:
	b _02243C7A
_02243AC8:
	ldr r0, _02243BA8 @ =0x00000604
	adds r0, r4, r0
	bl ov83_022478B4
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	adds r5, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl FUN_020310BC
	adds r5, r0, #0
	movs r0, #0xaf
	lsls r0, r0, #2
	ldrb r1, [r4, #9]
	ldr r0, [r4, r0]
	movs r2, #2
	bl ov83_0224777C
	cmp r5, #0x32
	bhs _02243B26
	movs r0, #0xae
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02247944
	adds r0, r4, #0
	movs r1, #0x52
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r4, #0xa]
	movs r0, #0xf
	strb r0, [r4, #8]
	b _02243C7A
_02243B26:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02243B40
	ldrb r1, [r4, #0xd]
	adds r0, r4, #0
	movs r2, #5
	bl ov83_02245ACC
	movs r0, #0xa
	strb r0, [r4, #8]
	b _02243C7A
_02243B40:
	movs r0, #1
	strb r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_02243B46:
	ldr r0, _02243BA8 @ =0x00000604
	adds r0, r4, r0
	bl ov83_022478B4
	adds r0, r4, #0
	bl ov83_02244C9C
	movs r0, #6
	strb r0, [r4, #8]
	b _02243C7A
_02243B5A:
	bl ov83_02247CF0
	cmp r0, #1
	beq _02243B64
	b _02243C7A
_02243B64:
	adds r0, r4, #0
	bl ov83_02244C9C
	adds r0, r4, #0
	movs r1, #0
	bl ov83_02246114
	movs r0, #0x15
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0xc8
	movs r2, #0x69
	bl ov83_02247630
	movs r0, #6
	strb r0, [r4, #8]
	b _02243C7A
_02243B86:
	adds r1, r4, #0
	adds r1, #0x80
	bl ov83_022448E4
	movs r0, #0xc
	strb r0, [r4, #8]
_02243B92:
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02244E24
	cmp r0, #1
	bne _02243C7A
	movs r0, #0x10
	strb r0, [r4, #8]
	b _02243C7A
	nop
_02243BA8: .4byte 0x00000604
_02243BAC: .4byte 0x000005F8
_02243BB0: .4byte 0x000005DC
_02243BB4: .4byte 0x00000554
_02243BB8: .4byte 0x00000558
_02243BBC:
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0x13]
	bl ov83_02244E24
	cmp r0, #1
	bne _02243C7A
	movs r0, #0xe
	strb r0, [r4, #8]
	b _02243C7A
_02243BCE:
	ldrb r0, [r4, #0x13]
	cmp r0, #3
	bne _02243BDA
	movs r0, #0x11
	strb r0, [r4, #8]
	b _02243C7A
_02243BDA:
	movs r0, #0x12
	strb r0, [r4, #8]
	b _02243C7A
_02243BE0:
	bl ov83_02247CF0
	cmp r0, #1
	bne _02243C7A
	ldr r0, _02243C80 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov83_02244C9C
	movs r0, #6
	strb r0, [r4, #8]
	b _02243C7A
_02243BFA:
	bl ov83_02247CF0
	cmp r0, #1
	bne _02243C7A
	ldr r0, _02243C80 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02245094
	adds r0, r4, #0
	bl ov83_02244BEC
	movs r0, #0
	strb r0, [r4, #8]
	b _02243C7A
_02243C1C:
	ldr r0, _02243C84 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0x20
	tst r0, r1
	bne _02243C7A
	movs r0, #0x10
	tst r0, r1
	bne _02243C7A
	bl ov83_02247CF0
	cmp r0, #1
	bne _02243C7A
	ldr r0, _02243C80 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov83_022459A0
	adds r0, r4, #0
	bl ov83_02244C58
	movs r0, #2
	strb r0, [r4, #8]
	b _02243C7A
_02243C4C:
	ldr r0, _02243C84 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0x20
	tst r0, r1
	bne _02243C7A
	movs r0, #0x10
	tst r0, r1
	bne _02243C7A
	bl ov83_02247CF0
	cmp r0, #1
	bne _02243C7A
	ldr r0, _02243C80 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov83_022459A0
	adds r0, r4, #0
	bl ov83_02244C58
	movs r0, #2
	strb r0, [r4, #8]
_02243C7A:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_02243C80: .4byte 0x000005DC
_02243C84: .4byte 0x021D110C
	thumb_func_end ov83_022433F8

	thumb_func_start ov83_02243C88
ov83_02243C88: @ 0x02243C88
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #5
	bhi _02243D74
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02243C9E: @ jump table
	.2byte _02243CAA - _02243C9E - 2 @ case 0
	.2byte _02243CCE - _02243C9E - 2 @ case 1
	.2byte _02243CF4 - _02243C9E - 2 @ case 2
	.2byte _02243D16 - _02243C9E - 2 @ case 3
	.2byte _02243D34 - _02243C9E - 2 @ case 4
	.2byte _02243D46 - _02243C9E - 2 @ case 5
_02243CAA:
	ldrb r2, [r4, #0xf]
	movs r1, #0xf8
	bics r2, r1
	movs r1, #8
	orrs r1, r2
	strb r1, [r4, #0xf]
	ldrb r2, [r4, #0xd]
	movs r1, #0x15
	bl ov83_022450A8
	cmp r0, #1
	bne _02243D74
	movs r0, #0
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _02243D74
_02243CCE:
	ldrb r1, [r4, #0x11]
	cmp r1, #0xff
	beq _02243D74
	movs r1, #0
	strb r1, [r4, #0x17]
	ldrb r2, [r4, #0x13]
	ldrb r1, [r4, #0x11]
	cmp r2, #5
	bne _02243CE8
	movs r2, #5
	bl ov83_02245ACC
	b _02243CEC
_02243CE8:
	bl ov83_0224563C
_02243CEC:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _02243D74
_02243CF4:
	ldrb r0, [r4, #0x15]
	ldrb r1, [r4, #0x11]
	bl ov83_0224776C
	adds r1, r0, #0
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02244E24
	cmp r0, #1
	bne _02243D74
	movs r0, #0x1e
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _02243D74
_02243D16:
	ldrb r0, [r4, #0x16]
	subs r0, r0, #1
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	bne _02243D74
	bl FUN_02037BEC
	movs r0, #0x85
	bl FUN_02037AC0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _02243D74
_02243D34:
	movs r0, #0x85
	bl FUN_02037B38
	cmp r0, #1
	bne _02243D74
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _02243D74
_02243D46:
	ldrb r0, [r4, #0x15]
	ldrb r1, [r4, #0x11]
	bl ov83_0224776C
	adds r1, r0, #0
	ldrb r2, [r4, #0x13]
	adds r0, r4, #0
	bl ov83_02244F60
	cmp r0, #1
	bne _02243D74
	bl FUN_02037BEC
	movs r0, #0x6b
	bl FUN_020379A0
	movs r0, #0xff
	strb r0, [r4, #0x11]
	ldr r0, _02243D78 @ =0x000005B6
	movs r1, #0
	strb r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
_02243D74:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_02243D78: .4byte 0x000005B6
	thumb_func_end ov83_02243C88

	thumb_func_start ov83_02243D7C
ov83_02243D7C: @ 0x02243D7C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _02243D90
	cmp r1, #1
	beq _02243DA8
	cmp r1, #2
	beq _02243DCA
	b _02243DE4
_02243D90:
	movs r1, #0x17
	movs r2, #0
	bl ov83_022450A8
	cmp r0, #1
	bne _02243DE4
	movs r0, #0x1e
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _02243DE4
_02243DA8:
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	beq _02243DB2
	subs r0, r0, #1
	strb r0, [r4, #0x16]
_02243DB2:
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	bne _02243DE4
	bl FUN_02037BEC
	movs r0, #0x86
	bl FUN_02037AC0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _02243DE4
_02243DCA:
	movs r0, #0x86
	bl FUN_02037B38
	cmp r0, #1
	bne _02243DE4
	bl FUN_02037BEC
	adds r4, #0xc0
	adds r0, r4, #0
	bl ov83_02245094
	movs r0, #1
	pop {r4, pc}
_02243DE4:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov83_02243D7C

	thumb_func_start ov83_02243DE8
ov83_02243DE8: @ 0x02243DE8
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _02243DFA
	cmp r0, #1
	beq _02243E1A
	b _02243E28
_02243DFA:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _02243E28
_02243E1A:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _02243E28
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_02243E28:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov83_02243DE8

	thumb_func_start ov83_02243E30
ov83_02243E30: @ 0x02243E30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _02243F80 @ =0x00000604
	str r0, [sp]
	adds r0, r0, r1
	bl ov83_02247858
	ldr r1, _02243F84 @ =0x000005F4
	ldr r0, [sp]
	ldr r0, [r0, r1]
	bl ov83_02247CC4
	movs r1, #0x5f
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl ov83_02247A18
	ldr r1, _02243F88 @ =0x00000508
	ldr r0, [sp]
	ldr r0, [r0, r1]
	bl ov83_0224753C
	ldr r1, _02243F8C @ =0x0000050C
	ldr r0, [sp]
	ldr r0, [r0, r1]
	bl ov83_0224753C
	movs r1, #0x15
	ldr r0, [sp]
	lsls r1, r1, #6
	ldr r0, [r0, r1]
	bl ov83_0224753C
	ldr r1, _02243F90 @ =0x00000544
	ldr r0, [sp]
	ldr r0, [r0, r1]
	bl ov83_0224753C
	movs r0, #0
	movs r6, #0x52
	ldr r7, [sp]
	str r0, [sp, #4]
	lsls r6, r6, #4
_02243E88:
	movs r4, #0
	adds r5, r7, #0
_02243E8C:
	ldr r0, [r5, r6]
	bl ov83_0224753C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _02243E8C
	ldr r0, [sp, #4]
	adds r7, #8
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #4
	blt _02243E88
	ldr r0, [sp]
	movs r1, #1
	ldrb r0, [r0, #9]
	bl FUN_02237B58
	adds r6, r0, #0
	movs r5, #0
	cmp r6, #0
	ble _02243EDC
	movs r7, #0x51
	ldr r4, [sp]
	lsls r7, r7, #4
_02243EBE:
	ldr r0, _02243F94 @ =0x000004F4
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, _02243F98 @ =0x000004E4
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, [r4, r7]
	bl ov83_0224753C
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, r6
	blt _02243EBE
_02243EDC:
	bl FUN_0203A914
	movs r1, #0x2b
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	movs r1, #2
	bl FUN_02003150
	movs r1, #0x2b
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_02003150
	movs r1, #0x2b
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl FUN_02003104
	movs r1, #0x2b
	ldr r0, [sp]
	movs r2, #0
	lsls r1, r1, #4
	str r2, [r0, r1]
	adds r1, #0x18
	adds r0, r0, r1
	bl ov83_022471FC
	ldr r0, [sp]
	ldr r0, [r0, #0x20]
	bl FUN_0200BB44
	ldr r0, [sp]
	ldr r0, [r0, #0x24]
	bl FUN_0200BDA0
	ldr r0, [sp]
	ldr r0, [r0, #0x28]
	bl FUN_02026380
	ldr r0, [sp]
	ldr r0, [r0, #0x2c]
	bl FUN_02026380
	movs r1, #0xad
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_0200CD94
	movs r0, #4
	bl FUN_02002DB4
	ldr r4, [sp]
	movs r5, #0
_02243F50:
	ldr r0, [r4, #0x30]
	bl FUN_02026380
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #3
	blt _02243F50
	ldr r0, [sp]
	movs r1, #1
	adds r0, #0x50
	bl ov83_0224791C
	ldr r0, [sp]
	ldr r0, [r0, #0x4c]
	bl ov83_0224442C
	movs r1, #0x56
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl FUN_0200770C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02243F80: .4byte 0x00000604
_02243F84: .4byte 0x000005F4
_02243F88: .4byte 0x00000508
_02243F8C: .4byte 0x0000050C
_02243F90: .4byte 0x00000544
_02243F94: .4byte 0x000004F4
_02243F98: .4byte 0x000004E4
	thumb_func_end ov83_02243E30

	thumb_func_start ov83_02243F9C
ov83_02243F9C: @ 0x02243F9C
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
	ldr r0, _02243FCC @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _02243FD0 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_02243FCC: .4byte 0xFFFFE0FF
_02243FD0: .4byte 0x04001000
	thumb_func_end ov83_02243F9C

	thumb_func_start ov83_02243FD4
ov83_02243FD4: @ 0x02243FD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	movs r0, #0xb7
	movs r1, #0x6b
	bl FUN_02007688
	movs r1, #0x56
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov83_02244394
	adds r0, r5, #0
	bl ov83_02244408
	movs r0, #4
	movs r1, #0x6b
	bl FUN_02002CEC
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0x21
	movs r3, #0x6b
	bl FUN_0200BAF8
	str r0, [r5, #0x20]
	movs r0, #0x6b
	bl FUN_0200BD08
	str r0, [r5, #0x24]
	movs r0, #0x96
	lsls r0, r0, #2
	movs r1, #0x6b
	bl FUN_02026354
	str r0, [r5, #0x28]
	movs r0, #0x96
	lsls r0, r0, #2
	movs r1, #0x6b
	bl FUN_02026354
	str r0, [r5, #0x2c]
	movs r6, #0
	adds r4, r5, #0
	movs r7, #0x20
_02244030:
	adds r0, r7, #0
	movs r1, #0x6b
	bl FUN_02026354
	str r0, [r4, #0x30]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #3
	blt _02244030
	movs r1, #7
	movs r0, #0
	lsls r1, r1, #6
	movs r2, #0x6b
	bl FUN_02003030
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x6b
	bl FUN_0200304C
	movs r0, #1
	movs r1, #2
	movs r2, #0
	movs r3, #0x6b
	bl FUN_0200CC74
	movs r1, #0xad
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r1, r5, #0
	ldr r0, [r5, #0x4c]
	adds r1, #0x50
	movs r2, #1
	bl ov83_022478D4
	add r0, sp, #0x28
	add r1, sp, #0x2c
	add r3, sp, #0x28
	str r0, [sp]
	adds r0, r5, #0
	adds r1, #2
	add r2, sp, #0x2c
	adds r3, #2
	bl ov83_02244DF4
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _0224409E
	movs r0, #0x3c
	movs r7, #0x40
	str r0, [sp, #0x1c]
	b _022440A4
_0224409E:
	movs r0, #0x1c
	movs r7, #0x20
	str r0, [sp, #0x1c]
_022440A4:
	ldrb r0, [r5, #9]
	movs r1, #1
	bl FUN_02237B58
	movs r6, #0
	str r0, [sp, #0x18]
	cmp r0, #0
	ble _022441AC
	adds r4, r5, #0
_022440B6:
	movs r0, #7
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x3e
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov83_02247454
	ldr r1, _02244370 @ =0x000004F4
	str r0, [r4, r1]
	movs r1, #0
	movs r0, #0xf
	str r0, [sp]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x4e
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov83_02247454
	movs r1, #0x51
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #1
	str r0, [sp]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x3a
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r0, r5, r0
	adds r1, #0xa
	movs r2, #0xa
	movs r3, #5
	bl ov83_02247454
	ldr r1, _02244374 @ =0x000004E4
	str r0, [r4, r1]
	adds r0, r1, #0
	adds r0, #0x78
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_02074644
	adds r1, r0, #0
	ldr r0, _02244374 @ =0x000004E4
	ldr r0, [r4, r0]
	bl ov83_022475EC
	ldr r0, _02244378 @ =0x0000054C
	ldr r0, [r5, r0]
	ldrb r0, [r0, r6]
	cmp r0, #0
	ldr r0, _02244370 @ =0x000004F4
	bne _0224417C
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov83_0224755C
	ldr r0, _02244374 @ =0x000004E4
	movs r1, #0
	ldr r0, [r4, r0]
	bl ov83_0224755C
	movs r0, #0x51
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov83_0224755C
	b _0224419A
_0224417C:
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov83_0224755C
	ldr r0, _02244374 @ =0x000004E4
	movs r1, #1
	ldr r0, [r4, r0]
	bl ov83_0224755C
	movs r0, #0x51
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov83_0224755C
_0224419A:
	ldr r0, [sp, #0x1c]
	adds r6, r6, #1
	adds r0, #0x40
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	adds r4, r4, #4
	adds r7, #0x40
	cmp r6, r0
	blt _022440B6
_022441AC:
	adds r0, r5, #0
	add r1, sp, #0x34
	add r2, sp, #0x30
	movs r3, #0
	bl ov83_02244DA0
	movs r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x34]
	movs r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	adds r2, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _0224437C @ =0x00000508
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	ldr r1, [sp, #0x34]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	ldr r1, [sp, #0x30]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #8]
	movs r1, #0
	str r0, [sp, #0xc]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _02244380 @ =0x0000050C
	str r0, [r5, r1]
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02244226
	ldr r0, _02244380 @ =0x0000050C
	movs r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224755C
_02244226:
	movs r0, #0
	str r0, [sp, #0x14]
	str r0, [sp, #0x20]
	str r5, [sp, #0x24]
_0224422E:
	movs r7, #0
	ldr r4, [sp, #0x24]
	adds r6, r7, #0
_02244234:
	adds r0, r5, #0
	add r1, sp, #0x34
	add r2, sp, #0x30
	bl ov83_02245CE8
	movs r0, #0xc
	str r0, [sp]
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #0x20]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r1, #0
	ldr r0, [sp, #0x30]
	adds r2, r1, #0
	adds r0, r0, r6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r3, r1, #0
	bl ov83_02247454
	movs r1, #0x52
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov83_0224755C
	adds r7, r7, #1
	adds r6, #0xc
	adds r4, r4, #4
	cmp r7, #2
	blt _02244234
	ldr r0, [sp, #0x20]
	adds r0, #0x40
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	adds r0, #8
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _0224422E
	adds r0, r5, #0
	bl ov83_02245C80
	movs r1, #0
	movs r0, #0xb
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0xb2
	lsls r0, r0, #2
	str r1, [sp, #0xc]
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	movs r1, #0x15
	lsls r1, r1, #6
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #0
	bl ov83_0224755C
	adds r0, r5, #0
	bl ov83_02245D48
	adds r0, r5, #0
	bl ov83_02245F24
	adds r0, r5, #0
	movs r1, #1
	bl ov83_02246114
	movs r1, #0
	str r1, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	movs r0, #0x28
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0xb2
	str r1, [sp, #0x10]
	movs r1, #2
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov83_022474C4
	ldr r1, _02244384 @ =0x00000544
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov83_02246988
	ldrb r2, [r5, #0x14]
	adds r0, r5, #0
	movs r1, #1
	bl ov83_02247A7C
	movs r1, #0x5f
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r1, #0xb2
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	subs r1, #0x18
	ldr r1, [r5, r1]
	bl ov83_02247CB8
	ldr r1, _02244388 @ =0x000005F4
	str r0, [r5, r1]
	adds r1, #0x10
	adds r0, r5, r1
	bl ov83_02247844
	bl FUN_02037474
	cmp r0, #0
	beq _02244354
	movs r0, #1
	movs r1, #0x10
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	bl FUN_0203A880
_02244354:
	movs r0, #0xa
	str r0, [sp]
	ldr r0, _0224438C @ =0x04000050
	movs r1, #0
	movs r2, #0xe
	movs r3, #6
	blx FUN_020CF15C
	ldr r0, _02244390 @ =ov83_02244488
	adds r1, r5, #0
	bl FUN_0201A0FC
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02244370: .4byte 0x000004F4
_02244374: .4byte 0x000004E4
_02244378: .4byte 0x0000054C
_0224437C: .4byte 0x00000508
_02244380: .4byte 0x0000050C
_02244384: .4byte 0x00000544
_02244388: .4byte 0x000005F4
_0224438C: .4byte 0x04000050
_02244390: .4byte ov83_02244488
	thumb_func_end ov83_02243FD4

	thumb_func_start ov83_02244394
ov83_02244394: @ 0x02244394
	push {r4, lr}
	ldr r2, _02244400 @ =0x04000304
	adds r4, r0, #0
	ldrh r1, [r2]
	ldr r0, _02244404 @ =0xFFFF7FFF
	ands r0, r1
	strh r0, [r2]
	bl ov83_022444C0
	ldr r0, [r4, #0x4c]
	bl ov83_022444E0
	movs r0, #0x6b
	bl FUN_020030E8
	movs r1, #0x2b
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #2
	lsls r2, r1, #8
	movs r3, #0x6b
	bl FUN_02003120
	movs r2, #0x2b
	lsls r2, r2, #4
	ldr r0, [r4, r2]
	movs r1, #0
	subs r2, #0xb0
	movs r3, #0x6b
	bl FUN_02003120
	adds r0, r4, #0
	movs r1, #3
	bl ov83_0224465C
	bl ov83_022446D0
	adds r0, r4, #0
	movs r1, #2
	bl ov83_02244704
	bl ov83_0224474C
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	movs r1, #4
	bl ov83_02244780
	pop {r4, pc}
	nop
_02244400: .4byte 0x04000304
_02244404: .4byte 0xFFFF7FFF
	thumb_func_end ov83_02244394

	thumb_func_start ov83_02244408
ov83_02244408: @ 0x02244408
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	adds r2, r0, #0
	ldr r1, _02244428 @ =0x0000055C
	movs r0, #0xb2
	lsls r0, r0, #2
	lsls r2, r2, #0x18
	ldr r1, [r4, r1]
	adds r0, r4, r0
	lsrs r2, r2, #0x18
	bl ov83_02246E08
	pop {r4, pc}
	.align 2, 0
_02244428: .4byte 0x0000055C
	thumb_func_end ov83_02244408

	thumb_func_start ov83_0224442C
ov83_0224442C: @ 0x0224442C
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
	movs r1, #0
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
	bl FUN_0201AB0C
	ldr r2, _02244484 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_02244484: .4byte 0x04000304
	thumb_func_end ov83_0224442C

	thumb_func_start ov83_02244488
ov83_02244488: @ 0x02244488
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2b
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224449A
	bl FUN_0200398C
_0224449A:
	ldr r0, [r4, #0x4c]
	bl FUN_0201EEB4
	bl FUN_0202061C
	bl FUN_0200B224
	ldr r3, _022444B8 @ =0x027E0000
	ldr r1, _022444BC @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_022444B8: .4byte 0x027E0000
_022444BC: .4byte 0x00003FF8
	thumb_func_end ov83_02244488

	thumb_func_start ov83_022444C0
ov83_022444C0: @ 0x022444C0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _022444DC @ =0x02248150
	add r3, sp, #0
	movs r2, #5
_022444CA:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _022444CA
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_022444DC: .4byte 0x02248150
	thumb_func_end ov83_022444C0

	thumb_func_start ov83_022444E0
ov83_022444E0: @ 0x022444E0
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	ldr r5, _0224463C @ =0x02248044
	add r3, sp, #0xa8
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _02244640 @ =0x02248068
	add r3, sp, #0x8c
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
	movs r3, #0x6b
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _02244644 @ =0x02248084
	add r3, sp, #0x70
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #0
	str r0, [r3]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_0201B1E4
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x6b
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _02244648 @ =0x022480A0
	add r3, sp, #0x54
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
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x6b
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _0224464C @ =0x022480BC
	add r3, sp, #0x38
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
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x6b
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	ldr r5, _02244650 @ =0x022480D8
	add r3, sp, #0x1c
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
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _02244654 @ =0x022480F4
	add r3, sp, #0
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
	movs r3, #0x6b
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201CAE0
	ldr r1, _02244658 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	strh r2, [r1]
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224463C: .4byte 0x02248044
_02244640: .4byte 0x02248068
_02244644: .4byte 0x02248084
_02244648: .4byte 0x022480A0
_0224464C: .4byte 0x022480BC
_02244650: .4byte 0x022480D8
_02244654: .4byte 0x022480F4
_02244658: .4byte 0x04000008
	thumb_func_end ov83_022444E0

	thumb_func_start ov83_0224465C
ov83_0224465C: @ 0x0224465C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x6b
	str r0, [sp, #0xc]
	movs r0, #0x56
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #0x30
	adds r3, r4, #0
	bl FUN_02007B44
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _022446AE
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	movs r0, #0x56
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #0x2c
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
_022446AE:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	movs r0, #0x56
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #0x2d
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_0224465C

	thumb_func_start ov83_022446D0
ov83_022446D0: @ 0x022446D0
	push {r3, r4, lr}
	sub sp, #4
	movs r0, #0xb7
	movs r1, #0x9d
	add r2, sp, #0
	movs r3, #0x6b
	bl FUN_020079F4
	adds r4, r0, #0
	ldr r0, [sp]
	movs r1, #0x80
	ldr r0, [r0, #0xc]
	blx DC_FlushRange
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0, #0xc]
	movs r2, #0x80
	blx FUN_020CFC6C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov83_022446D0

	thumb_func_start ov83_02244704
ov83_02244704: @ 0x02244704
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x6b
	str r0, [sp, #0xc]
	movs r0, #0x56
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #0x30
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	movs r0, #0x56
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #0x2e
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_02244704

	thumb_func_start ov83_0224474C
ov83_0224474C: @ 0x0224474C
	push {r3, r4, lr}
	sub sp, #4
	movs r0, #0xb7
	movs r1, #0x9d
	add r2, sp, #0
	movs r3, #0x6b
	bl FUN_020079F4
	adds r4, r0, #0
	ldr r0, [sp]
	movs r1, #0x80
	ldr r0, [r0, #0xc]
	blx DC_FlushRange
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0, #0xc]
	movs r2, #0x80
	blx FUN_020CFC6C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov83_0224474C

	thumb_func_start ov83_02244780
ov83_02244780: @ 0x02244780
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x6b
	str r0, [sp, #0xc]
	movs r0, #0x56
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #0x28
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	movs r0, #0x56
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x4c]
	movs r1, #0x93
	adds r3, r4, #0
	bl FUN_02007B68
	movs r3, #0
	str r3, [sp]
	movs r0, #0x6b
	str r0, [sp, #4]
	movs r0, #0x56
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0xbe
	movs r2, #4
	bl FUN_02007B8C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov83_02244780

	thumb_func_start ov83_022447E0
ov83_022447E0: @ 0x022447E0
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
	ldr r0, [r5, #0x20]
	ldr r2, [r5, #0x2c]
	adds r1, r6, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
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
	ldr r2, [r5, #0x28]
	adds r0, r4, #0
	bl FUN_020200FC
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov83_022447E0

	thumb_func_start ov83_0224484C
ov83_0224484C: @ 0x0224484C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, [r5, #0x20]
	ldr r2, [r5, #0x2c]
	adds r6, r3, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	bl FUN_0200CBBC
	ldr r0, [sp, #0x20]
	add r2, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x24]
	adds r3, r6, #0
	str r0, [sp, #4]
	add r0, sp, #0x30
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
	add r1, sp, #0x34
	ldrb r1, [r1]
	ldr r2, [r5, #0x28]
	adds r0, r4, #0
	bl FUN_020200FC
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r0, r5, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov83_0224484C

	thumb_func_start ov83_022448AC
ov83_022448AC: @ 0x022448AC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	movs r3, #1
	adds r4, r1, #0
	str r3, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r3, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	movs r1, #0xf
	str r1, [sp, #0x10]
	adds r5, r0, #0
	adds r1, r5, #0
	str r2, [sp, #0x14]
	adds r1, #0xc0
	adds r2, r4, #0
	bl ov83_022447E0
	adds r5, #0xc0
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov83_022448AC

	thumb_func_start ov83_022448E4
ov83_022448E4: @ 0x022448E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02244902
	movs r6, #0x24
	b _02244904
_02244902:
	movs r6, #4
_02244904:
	ldrb r0, [r5, #9]
	movs r1, #1
	bl FUN_02237B58
	movs r7, #0
	str r0, [sp, #0xc]
	cmp r0, #0
	ble _022449C0
	adds r0, r6, #0
	str r0, [sp, #0x14]
	adds r0, #0x18
	str r0, [sp, #0x14]
	adds r0, r6, #0
	str r0, [sp, #0x10]
	adds r0, #0x20
	str r0, [sp, #0x10]
_02244924:
	ldr r0, _022449CC @ =0x0000054C
	ldr r0, [r5, r0]
	ldrb r0, [r0, r7]
	cmp r0, #0
	bne _02244946
	movs r0, #0x40
	str r0, [sp]
	movs r0, #0x10
	lsls r2, r6, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	lsrs r2, r2, #0x10
	movs r3, #1
	bl FUN_0201DA74
	b _022449AA
_02244946:
	ldr r0, _022449D0 @ =0x0000055C
	adds r1, r7, #0
	ldr r0, [r5, r0]
	bl FUN_02074644
	movs r1, #0xa3
	movs r2, #0
	str r0, [sp, #0x18]
	bl FUN_0206E540
	str r4, [sp]
	adds r1, r0, #0
	str r6, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xad
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r2, #3
	movs r3, #1
	bl FUN_0200CDF0
	movs r0, #1
	str r0, [sp]
	movs r0, #0xad
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x14]
	movs r1, #0
	adds r2, r4, #0
	bl FUN_0200CDAC
	ldr r0, [sp, #0x18]
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #0
	ldr r0, [sp, #0x10]
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xad
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r2, #3
	movs r3, #0
	bl FUN_0200CDF0
_022449AA:
	ldr r0, [sp, #0x14]
	adds r7, r7, #1
	adds r0, #0x40
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r6, #0x40
	adds r0, #0x40
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	cmp r7, r0
	blt _02244924
_022449C0:
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022449CC: .4byte 0x0000054C
_022449D0: .4byte 0x0000055C
	thumb_func_end ov83_022448E4

	thumb_func_start ov83_022449D4
ov83_022449D4: @ 0x022449D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	str r1, [sp, #0x10]
	adds r0, r1, #0
	movs r1, #0
	bl FUN_0201D978
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _022449F4
	movs r4, #0x28
	movs r6, #0x50
	b _022449F8
_022449F4:
	movs r4, #8
	movs r6, #0x30
_022449F8:
	ldrb r0, [r5, #9]
	movs r1, #1
	bl FUN_02237B58
	movs r7, #0
	str r0, [sp, #0x14]
	cmp r0, #0
	ble _02244A66
_02244A08:
	ldr r0, _02244A70 @ =0x0000055C
	adds r1, r7, #0
	ldr r0, [r5, r0]
	bl FUN_02074644
	movs r1, #0xa1
	movs r2, #0
	str r0, [sp, #0x18]
	bl FUN_0206E540
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	movs r1, #1
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0xad
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r3, #3
	bl FUN_0200CE7C
	ldr r0, [sp, #0x18]
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0
	lsls r0, r0, #0x18
	str r1, [sp]
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #1
	bl ov83_02244BA8
	ldr r0, [sp, #0x14]
	adds r7, r7, #1
	adds r4, #0x40
	adds r6, #0x40
	cmp r7, r0
	blt _02244A08
_02244A66:
	ldr r0, [sp, #0x10]
	bl FUN_0201D5C8
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02244A70: .4byte 0x0000055C
	thumb_func_end ov83_022449D4

	thumb_func_start ov83_02244A74
ov83_02244A74: @ 0x02244A74
	adds r1, r0, #0
	ldr r0, _02244A80 @ =0x00000604
	ldr r3, _02244A84 @ =ov83_02247864
	adds r0, r1, r0
	ldr r1, [r1, #0x4c]
	bx r3
	.align 2, 0
_02244A80: .4byte 0x00000604
_02244A84: .4byte ov83_02247864
	thumb_func_end ov83_02244A74

	thumb_func_start ov83_02244A88
ov83_02244A88: @ 0x02244A88
	ldr r3, _02244A8C @ =ov83_02246C2C
	bx r3
	.align 2, 0
_02244A8C: .4byte ov83_02246C2C
	thumb_func_end ov83_02244A88

	thumb_func_start ov83_02244A90
ov83_02244A90: @ 0x02244A90
	ldr r3, _02244A94 @ =ov83_02246C70
	bx r3
	.align 2, 0
_02244A94: .4byte ov83_02246C70
	thumb_func_end ov83_02244A90

	thumb_func_start ov83_02244A98
ov83_02244A98: @ 0x02244A98
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	movs r4, #1
	str r4, [sp, #4]
	ldr r0, [r0, #0x24]
	bl FUN_0200BFCC
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_02244A98

	thumb_func_start ov83_02244AB0
ov83_02244AB0: @ 0x02244AB0
	ldr r3, _02244AB8 @ =FUN_0200BF1C
	ldr r0, [r0, #0x24]
	bx r3
	nop
_02244AB8: .4byte FUN_0200BF1C
	thumb_func_end ov83_02244AB0

	thumb_func_start ov83_02244ABC
ov83_02244ABC: @ 0x02244ABC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xaf
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_02028E9C
	adds r2, r0, #0
	ldr r0, [r5, #0x24]
	adds r1, r4, #0
	bl FUN_0200BE48
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_02244ABC

	thumb_func_start ov83_02244AD8
ov83_02244AD8: @ 0x02244AD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r1, #0
	movs r1, #0xaf
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	str r2, [sp, #0x10]
	adds r5, r3, #0
	bl FUN_02028E9C
	adds r6, r0, #0
	movs r0, #8
	movs r1, #0x6b
	bl FUN_02026354
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_02028F54
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_020269A0
	adds r0, r6, #0
	bl FUN_02028F94
	cmp r0, #0
	bne _02244B14
	ldr r1, _02244B3C @ =0x00070800
	b _02244B18
_02244B14:
	movs r1, #0xc1
	lsls r1, r1, #0xa
_02244B18:
	str r5, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x18
	ldrb r1, [r1, #0x10]
	ldr r3, [sp, #0x10]
	adds r0, r7, #0
	adds r2, r4, #0
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02244B3C: .4byte 0x00070800
	thumb_func_end ov83_02244AD8

	thumb_func_start ov83_02244B40
ov83_02244B40: @ 0x02244B40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r7, r1, #0
	str r2, [sp, #0x18]
	adds r6, r3, #0
	bl FUN_0203769C
	movs r1, #1
	eors r0, r1
	bl FUN_02034818
	str r0, [sp, #0x1c]
	bl FUN_02028F94
	cmp r0, #0
	bne _02244B66
	ldr r4, _02244BA4 @ =0x00070800
	b _02244B6A
_02244B66:
	movs r4, #0xc1
	lsls r4, r4, #0xa
_02244B6A:
	ldr r0, [r5, #0x24]
	ldr r2, [sp, #0x1c]
	movs r1, #0
	bl FUN_0200BE48
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	lsrs r0, r4, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsrs r0, r4, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r3, [sp, #0x18]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #1
	bl ov83_0224484C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02244BA4: .4byte 0x00070800
	thumb_func_end ov83_02244B40

	thumb_func_start ov83_02244BA8
ov83_02244BA8: @ 0x02244BA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r2, #0
	adds r2, r3, #0
	add r3, sp, #0x20
	ldrb r3, [r3, #0x14]
	cmp r3, #0
	bne _02244BC2
	movs r3, #0x40
	movs r4, #7
	movs r5, #8
	movs r6, #0
	b _02244BCE
_02244BC2:
	cmp r3, #1
	bne _02244BE8
	movs r3, #0x41
	movs r4, #3
	movs r5, #4
	movs r6, #0
_02244BCE:
	str r2, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	add r2, sp, #0x20
	ldrb r2, [r2, #0x10]
	str r2, [sp, #0x14]
	adds r2, r3, #0
	adds r3, r7, #0
	bl ov83_0224484C
_02244BE8:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov83_02244BA8

	thumb_func_start ov83_02244BEC
ov83_02244BEC: @ 0x02244BEC
	push {r4, lr}
	sub sp, #0x18
	movs r2, #5
	str r2, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #2
	adds r4, r0, #0
	str r1, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	adds r1, r4, #0
	str r3, [sp, #0x14]
	adds r1, #0x60
	bl ov83_022447E0
	strb r0, [r4, #0xa]
	movs r0, #0xae
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xd0
	bl ov83_02247944
	movs r3, #1
	adds r1, r4, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r1, #0xd0
	movs r2, #4
	str r3, [sp, #0x14]
	bl ov83_022447E0
	strb r0, [r4, #0xa]
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov83_02244BEC

	thumb_func_start ov83_02244C4C
ov83_02244C4C: @ 0x02244C4C
	ldr r3, _02244C54 @ =ov83_02245094
	adds r0, #0xd0
	bx r3
	nop
_02244C54: .4byte ov83_02245094
	thumb_func_end ov83_02244C4C

	thumb_func_start ov83_02244C58
ov83_02244C58: @ 0x02244C58
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xae
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02247944
	movs r1, #1
	movs r0, #6
	mvns r1, r1
	lsls r0, r0, #8
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov83_02246AA4
	adds r0, r4, #0
	bl ov83_02246CC0
	pop {r4, pc}
	thumb_func_end ov83_02244C58

	thumb_func_start ov83_02244C88
ov83_02244C88: @ 0x02244C88
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xc0
	bl ov83_02245094
	adds r0, r4, #0
	bl ov83_02246C70
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_02244C88

	thumb_func_start ov83_02244C9C
ov83_02244C9C: @ 0x02244C9C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xae
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02247944
	movs r1, #1
	movs r0, #6
	mvns r1, r1
	lsls r0, r0, #8
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov83_02246B6C
	adds r0, r4, #0
	bl ov83_02246D40
	pop {r4, pc}
	thumb_func_end ov83_02244C9C

	thumb_func_start ov83_02244CCC
ov83_02244CCC: @ 0x02244CCC
	ldr r3, _02244CD0 @ =ov83_02246C70
	bx r3
	.align 2, 0
_02244CD0: .4byte ov83_02246C70
	thumb_func_end ov83_02244CCC

	thumb_func_start ov83_02244CD4
ov83_02244CD4: @ 0x02244CD4
	movs r3, #0
	strb r3, [r0, #8]
	str r2, [r1]
	bx lr
	thumb_func_end ov83_02244CD4

	thumb_func_start ov83_02244CDC
ov83_02244CDC: @ 0x02244CDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02244D08 @ =0x000005DC
	bl FUN_0200604C
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _02244CFA
	ldrb r2, [r4, #0xd]
	adds r0, r4, #0
	movs r1, #0x16
	bl ov83_022450A8
_02244CFA:
	ldrb r1, [r4, #0xd]
	adds r0, r4, #0
	movs r2, #0
	bl ov83_02244D0C
	pop {r4, pc}
	nop
_02244D08: .4byte 0x000005DC
	thumb_func_end ov83_02244CDC

	thumb_func_start ov83_02244D0C
ov83_02244D0C: @ 0x02244D0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	bne _02244D22
	ldr r0, _02244D98 @ =0x00000508
	movs r2, #1
	ldr r4, [r5, r0]
	movs r1, #0
	b _02244D2A
_02244D22:
	ldr r0, _02244D9C @ =0x0000050C
	movs r2, #2
	ldr r4, [r5, r0]
	movs r1, #0x11
_02244D2A:
	ldrb r0, [r5, #0x15]
	cmp r7, r0
	blo _02244D50
	adds r0, r4, #0
	bl ov83_022475D4
	adds r0, r4, #0
	movs r1, #0xe0
	movs r2, #0xa0
	bl ov83_02247568
	cmp r6, #0
	bne _02244D92
	adds r0, r5, #0
	movs r1, #0
	bl ov83_02246938
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02244D50:
	adds r0, r4, #0
	adds r1, r2, #0
	bl ov83_022475D4
	adds r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	adds r3, r7, #0
	bl ov83_02244DA0
	ldr r1, [sp, #4]
	ldr r2, [sp]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	adds r0, r4, #0
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	bl ov83_02247568
	cmp r6, #0
	bne _02244D92
	ldrb r1, [r5, #0xc]
	ldrb r0, [r5, #0x15]
	cmp r1, r0
	blo _02244D8A
	adds r0, r5, #0
	movs r1, #1
	bl ov83_02246938
_02244D8A:
	adds r0, r5, #0
	movs r1, #0
	bl ov83_0224691C
_02244D92:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02244D98: .4byte 0x00000508
_02244D9C: .4byte 0x0000050C
	thumb_func_end ov83_02244D0C

	thumb_func_start ov83_02244DA0
ov83_02244DA0: @ 0x02244DA0
	push {r4, r5, r6, lr}
	ldrb r0, [r0, #9]
	adds r5, r1, #0
	adds r6, r2, #0
	adds r4, r3, #0
	bl FUN_02237D8C
	cmp r0, #1
	bne _02244DD6
	cmp r4, #0
	bne _02244DBC
	movs r0, #0x28
	str r0, [r5]
	b _02244DEE
_02244DBC:
	cmp r4, #1
	bne _02244DC6
	movs r0, #0x68
	str r0, [r5]
	b _02244DEE
_02244DC6:
	cmp r4, #2
	bne _02244DD0
	movs r0, #0xa8
	str r0, [r5]
	b _02244DEE
_02244DD0:
	movs r0, #0xe8
	str r0, [r5]
	b _02244DEE
_02244DD6:
	cmp r4, #0
	bne _02244DE0
	movs r0, #0x48
	str r0, [r5]
	b _02244DEE
_02244DE0:
	cmp r4, #1
	bne _02244DEA
	movs r0, #0x88
	str r0, [r5]
	b _02244DEE
_02244DEA:
	movs r0, #0xc8
	str r0, [r5]
_02244DEE:
	movs r0, #0x58
	str r0, [r6]
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_02244DA0

	thumb_func_start ov83_02244DF4
ov83_02244DF4: @ 0x02244DF4
	push {r3, r4, r5, r6, r7, lr}
	ldrb r0, [r0, #9]
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r4, [sp, #0x18]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02244E16
	movs r0, #0x28
	strh r0, [r5]
	movs r0, #0
	strh r0, [r6]
	strh r0, [r7]
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02244E16:
	movs r1, #0
	strh r1, [r5]
	strh r1, [r6]
	movs r0, #0x80
	strh r0, [r7]
	strh r1, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov83_02244DF4

	thumb_func_start ov83_02244E24
ov83_02244E24: @ 0x02244E24
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	adds r5, r2, #0
	bl ov83_02247768
	adds r6, r0, #0
	ldr r0, _02244F58 @ =0x0000055C
	adds r1, r6, #0
	ldr r0, [r4, r0]
	bl FUN_02074644
	cmp r5, #5
	bls _02244E44
	b _02244F52
_02244E44:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02244E50: @ jump table
	.2byte _02244E5C - _02244E50 - 2 @ case 0
	.2byte _02244E6A - _02244E50 - 2 @ case 1
	.2byte _02244F52 - _02244E50 - 2 @ case 2
	.2byte _02244EE8 - _02244E50 - 2 @ case 3
	.2byte _02244F16 - _02244E50 - 2 @ case 4
	.2byte _02244F44 - _02244E50 - 2 @ case 5
_02244E5C:
	ldrb r1, [r4, #0xf]
	movs r0, #1
	add sp, #0x14
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_02244E6A:
	ldrb r1, [r4, #0xf]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	bne _02244EC0
	movs r0, #1
	bics r1, r0
	movs r0, #1
	orrs r0, r1
	strb r0, [r4, #0xf]
	ldrb r0, [r4, #0x12]
	cmp r0, #1
	bne _02244E86
	movs r5, #9
	b _02244E88
_02244E86:
	movs r5, #0xa
_02244E88:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02244E96
	movs r1, #0x50
	b _02244E98
_02244E96:
	movs r1, #0x30
_02244E98:
	lsls r0, r6, #6
	adds r0, r1, r0
	lsls r0, r0, #0x10
	str r5, [sp]
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r1, #0
	movs r0, #0x32
	str r0, [sp, #8]
	movs r0, #0xb2
	lsls r0, r0, #2
	str r1, [sp, #0xc]
	adds r0, r4, r0
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp, #0x10]
	bl ov83_02247454
	ldr r1, _02244F5C @ =0x00000504
	str r0, [r4, r1]
_02244EC0:
	ldr r0, _02244F5C @ =0x00000504
	ldr r0, [r4, r0]
	bl ov83_02247624
	cmp r0, #0
	bne _02244F52
	ldr r0, _02244F5C @ =0x00000504
	ldr r0, [r4, r0]
	bl ov83_0224753C
	ldr r0, _02244F5C @ =0x00000504
	movs r1, #0
	str r1, [r4, r0]
	ldrb r1, [r4, #0xf]
	movs r0, #1
	add sp, #0x14
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_02244EE8:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02244F08
	adds r0, r4, #0
	movs r1, #0
	bl ov83_02246114
	ldrb r1, [r4, #0xf]
	movs r0, #1
	add sp, #0x14
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_02244F08:
	ldrb r1, [r4, #0xf]
	movs r0, #1
	add sp, #0x14
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_02244F16:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02244F36
	adds r0, r4, #0
	movs r1, #0
	bl ov83_02246114
	ldrb r1, [r4, #0xf]
	movs r0, #1
	add sp, #0x14
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_02244F36:
	ldrb r1, [r4, #0xf]
	movs r0, #1
	add sp, #0x14
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_02244F44:
	ldrb r1, [r4, #0xf]
	movs r0, #1
	add sp, #0x14
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_02244F52:
	movs r0, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02244F58: .4byte 0x0000055C
_02244F5C: .4byte 0x00000504
	thumb_func_end ov83_02244E24

	thumb_func_start ov83_02244F60
ov83_02244F60: @ 0x02244F60
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	adds r6, r2, #0
	ldrb r5, [r4, #0x15]
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _02245064 @ =0x0000055C
	ldr r0, [r4, r0]
	bl FUN_02074644
	cmp r6, #5
	bhi _02245060
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02244F88: @ jump table
	.2byte _02244F94 - _02244F88 - 2 @ case 0
	.2byte _02244F94 - _02244F88 - 2 @ case 1
	.2byte _02245060 - _02244F88 - 2 @ case 2
	.2byte _02244FBC - _02244F88 - 2 @ case 3
	.2byte _0224500E - _02244F88 - 2 @ case 4
	.2byte _02244FA0 - _02244F88 - 2 @ case 5
_02244F94:
	ldrb r1, [r4, #0xf]
	movs r0, #1
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r4, r5, r6, pc}
_02244FA0:
	ldrb r0, [r4, #0xf]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _02244FB0
	adds r0, r4, #0
	movs r1, #0
	bl ov83_02246114
_02244FB0:
	ldrb r1, [r4, #0xf]
	movs r0, #1
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r4, r5, r6, pc}
_02244FBC:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _02244FF0
	bl FUN_0203769C
	cmp r0, #0
	ldrb r0, [r4, #0x11]
	bne _02244FE0
	cmp r0, r5
	blo _02244FF0
	ldrb r1, [r4, #0xf]
	movs r0, #1
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r4, r5, r6, pc}
_02244FE0:
	cmp r0, r5
	bhs _02244FF0
	ldrb r1, [r4, #0xf]
	movs r0, #1
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r4, r5, r6, pc}
_02244FF0:
	ldrb r1, [r4, #0xf]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	bne _02245060
	movs r0, #0xf8
	bics r1, r0
	movs r0, #0x18
	orrs r0, r1
	strb r0, [r4, #0xf]
	ldrb r1, [r4, #0xf]
	movs r0, #1
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r4, r5, r6, pc}
_0224500E:
	ldrb r0, [r4, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _02245042
	bl FUN_0203769C
	cmp r0, #0
	ldrb r0, [r4, #0x11]
	bne _02245032
	cmp r0, r5
	blo _02245042
	ldrb r1, [r4, #0xf]
	movs r0, #1
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r4, r5, r6, pc}
_02245032:
	cmp r0, r5
	bhs _02245042
	ldrb r1, [r4, #0xf]
	movs r0, #1
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r4, r5, r6, pc}
_02245042:
	ldrb r1, [r4, #0xf]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	bne _02245060
	movs r0, #0xf8
	bics r1, r0
	movs r0, #0x18
	orrs r0, r1
	strb r0, [r4, #0xf]
	ldrb r1, [r4, #0xf]
	movs r0, #1
	bics r1, r0
	strb r1, [r4, #0xf]
	movs r0, #1
	pop {r4, r5, r6, pc}
_02245060:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02245064: .4byte 0x0000055C
	thumb_func_end ov83_02244F60

	thumb_func_start ov83_02245068
ov83_02245068: @ 0x02245068
	cmp r0, #1
	bne _02245070
	movs r0, #1
	bx lr
_02245070:
	movs r0, #0xf
	bx lr
	thumb_func_end ov83_02245068

	thumb_func_start ov83_02245074
ov83_02245074: @ 0x02245074
	push {r4, lr}
	adds r4, r0, #0
	bl ov83_02245390
	adds r0, r4, #0
	adds r0, #0xc0
	bl ov83_02245094
	movs r0, #0x15
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov83_0224755C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_02245074

	thumb_func_start ov83_02245094
ov83_02245094: @ 0x02245094
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_02245094

	thumb_func_start ov83_022450A8
ov83_022450A8: @ 0x022450A8
	push {r3, r4, r5, lr}
	adds r3, r1, #0
	subs r3, #0x14
	adds r5, r0, #0
	cmp r3, #3
	bhi _022450E6
	adds r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_022450C0: @ jump table
	.2byte _022450C8 - _022450C0 - 2 @ case 0
	.2byte _022450D0 - _022450C0 - 2 @ case 1
	.2byte _022450D8 - _022450C0 - 2 @ case 2
	.2byte _022450E0 - _022450C0 - 2 @ case 3
_022450C8:
	movs r4, #0x35
	bl ov83_02245104
	b _022450E6
_022450D0:
	movs r4, #0x36
	bl ov83_0224517C
	b _022450E6
_022450D8:
	movs r4, #0x37
	bl ov83_02245210
	b _022450E6
_022450E0:
	movs r4, #0x38
	bl ov83_02245248
_022450E6:
	ldr r1, _02245100 @ =0x00000564
	adds r0, r4, #0
	adds r1, r5, r1
	movs r2, #0x28
	bl FUN_02037030
	cmp r0, #1
	bne _022450FA
	movs r0, #1
	pop {r3, r4, r5, pc}
_022450FA:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_02245100: .4byte 0x00000564
	thumb_func_end ov83_022450A8

	thumb_func_start ov83_02245104
ov83_02245104: @ 0x02245104
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0xaf
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	adds r4, r1, #0
	bl FUN_02028E9C
	ldr r1, _02245144 @ =0x00000564
	strh r4, [r6, r1]
	bl FUN_02028F94
	ldr r1, _02245148 @ =0x00000566
	movs r4, #0
	strh r0, [r6, r1]
	adds r5, r6, #4
	subs r7, r1, #2
_02245126:
	movs r0, #0xaf
	lsls r0, r0, #2
	lsls r2, r4, #0x18
	ldrb r1, [r6, #9]
	ldr r0, [r6, r0]
	lsrs r2, r2, #0x18
	bl ov83_0224777C
	strh r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #3
	blt _02245126
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02245144: .4byte 0x00000564
_02245148: .4byte 0x00000566
	thumb_func_end ov83_02245104

	thumb_func_start ov83_0224514C
ov83_0224514C: @ 0x0224514C
	push {r4, r5, r6, lr}
	adds r4, r3, #0
	adds r5, r0, #0
	ldrb r0, [r4, #0x17]
	adds r6, r2, #0
	adds r0, r0, #1
	strb r0, [r4, #0x17]
	bl FUN_0203769C
	cmp r5, r0
	beq _02245176
	ldr r0, _02245178 @ =0x000005B7
	movs r3, #0
	adds r5, r6, #4
_02245168:
	ldrh r2, [r5]
	adds r1, r4, r3
	adds r3, r3, #1
	adds r5, r5, #2
	strb r2, [r1, r0]
	cmp r3, #3
	blt _02245168
_02245176:
	pop {r4, r5, r6, pc}
	.align 2, 0
_02245178: .4byte 0x000005B7
	thumb_func_end ov83_0224514C

	thumb_func_start ov83_0224517C
ov83_0224517C: @ 0x0224517C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _022451B0 @ =0x00000564
	adds r4, r2, #0
	strh r1, [r5, r0]
	adds r0, r0, #2
	strh r4, [r5, r0]
	bl FUN_0203769C
	cmp r0, #0
	bne _0224519A
	ldrb r0, [r5, #0x11]
	cmp r0, #0xff
	bne _0224519A
	strb r4, [r5, #0x11]
_0224519A:
	ldrb r1, [r5, #0x11]
	ldr r0, _022451B4 @ =0x00000568
	strh r1, [r5, r0]
	ldrb r2, [r5, #0x12]
	adds r1, r0, #4
	adds r0, r0, #6
	strh r2, [r5, r1]
	ldrb r1, [r5, #0x13]
	strh r1, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_022451B0: .4byte 0x00000564
_022451B4: .4byte 0x00000568
	thumb_func_end ov83_0224517C

	thumb_func_start ov83_022451B8
ov83_022451B8: @ 0x022451B8
	push {r4, r5, r6, lr}
	adds r4, r3, #0
	adds r6, r0, #0
	ldrb r0, [r4, #0x17]
	adds r5, r2, #0
	adds r0, r0, #1
	strb r0, [r4, #0x17]
	bl FUN_0203769C
	cmp r6, r0
	beq _02245208
	ldrh r1, [r5, #2]
	ldr r0, _0224520C @ =0x000005B5
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r0, #0
	bne _022451FC
	ldrb r0, [r4, #0x11]
	cmp r0, #0xff
	ldr r0, _0224520C @ =0x000005B5
	beq _022451EA
	movs r1, #0
	strb r1, [r4, r0]
	pop {r4, r5, r6, pc}
_022451EA:
	ldrb r1, [r4, r0]
	ldrb r0, [r4, #0x15]
	adds r0, r1, r0
	strb r0, [r4, #0x11]
	ldrh r0, [r5, #8]
	strb r0, [r4, #0x12]
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0x13]
	pop {r4, r5, r6, pc}
_022451FC:
	ldrh r0, [r5, #4]
	strb r0, [r4, #0x11]
	ldrh r0, [r5, #8]
	strb r0, [r4, #0x12]
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0x13]
_02245208:
	pop {r4, r5, r6, pc}
	nop
_0224520C: .4byte 0x000005B5
	thumb_func_end ov83_022451B8

	thumb_func_start ov83_02245210
ov83_02245210: @ 0x02245210
	ldr r2, _0224521C @ =0x00000564
	strh r1, [r0, r2]
	ldrb r3, [r0, #0xd]
	adds r1, r2, #2
	strh r3, [r0, r1]
	bx lr
	.align 2, 0
_0224521C: .4byte 0x00000564
	thumb_func_end ov83_02245210

	thumb_func_start ov83_02245220
ov83_02245220: @ 0x02245220
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	adds r4, r3, #0
	bl FUN_0203769C
	cmp r5, r0
	beq _02245240
	ldrh r0, [r6, #2]
	ldr r1, _02245244 @ =0x000005B4
	movs r2, #1
	strb r0, [r4, r1]
	ldrb r1, [r4, r1]
	adds r0, r4, #0
	bl ov83_02244D0C
_02245240:
	pop {r4, r5, r6, pc}
	nop
_02245244: .4byte 0x000005B4
	thumb_func_end ov83_02245220

	thumb_func_start ov83_02245248
ov83_02245248: @ 0x02245248
	ldr r1, _02245250 @ =0x00000564
	movs r2, #1
	strh r2, [r0, r1]
	bx lr
	.align 2, 0
_02245250: .4byte 0x00000564
	thumb_func_end ov83_02245248

	thumb_func_start ov83_02245254
ov83_02245254: @ 0x02245254
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl FUN_0203769C
	cmp r5, r0
	beq _0224526A
	ldrh r1, [r4]
	ldr r0, _0224526C @ =0x000005B6
	strb r1, [r6, r0]
_0224526A:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0224526C: .4byte 0x000005B6
	thumb_func_end ov83_02245254

	thumb_func_start ov83_02245270
ov83_02245270: @ 0x02245270
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	bl ov83_02247768
	ldr r1, _02245284 @ =0x00000554
	movs r2, #1
	ldr r1, [r4, r1]
	strb r2, [r1, r0]
	pop {r4, pc}
	.align 2, 0
_02245284: .4byte 0x00000554
	thumb_func_end ov83_02245270

	thumb_func_start ov83_02245288
ov83_02245288: @ 0x02245288
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xae
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0xc0
	bl ov83_02247944
	ldrb r0, [r5, #0x14]
	adds r1, r4, #0
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _022452F8 @ =0x0000055C
	ldr r0, [r5, r0]
	bl FUN_02074644
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov83_02244AB0
	adds r0, r5, #0
	movs r1, #0x2f
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov83_02245270
	adds r0, r5, #0
	bl ov83_02245C80
	ldrb r0, [r5, #0xd]
	cmp r0, r4
	bne _022452F0
	adds r0, r5, #0
	bl ov83_02245D48
	adds r0, r5, #0
	movs r1, #0
	bl ov83_02246114
_022452F0:
	ldr r0, _022452FC @ =0x00000623
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
	.align 2, 0
_022452F8: .4byte 0x0000055C
_022452FC: .4byte 0x00000623
	thumb_func_end ov83_02245288

	thumb_func_start ov83_02245300
ov83_02245300: @ 0x02245300
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	bl ov83_02247768
	ldr r1, _02245314 @ =0x00000558
	movs r2, #1
	ldr r1, [r4, r1]
	strb r2, [r1, r0]
	pop {r4, pc}
	.align 2, 0
_02245314: .4byte 0x00000558
	thumb_func_end ov83_02245300

	thumb_func_start ov83_02245318
ov83_02245318: @ 0x02245318
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xae
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0xc0
	bl ov83_02247944
	ldrb r0, [r5, #0x14]
	adds r1, r4, #0
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _02245388 @ =0x0000055C
	ldr r0, [r5, r0]
	bl FUN_02074644
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov83_02244AB0
	adds r0, r5, #0
	movs r1, #0x53
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov83_02245300
	adds r0, r5, #0
	bl ov83_02245C80
	ldrb r0, [r5, #0xd]
	cmp r0, r4
	bne _02245380
	adds r0, r5, #0
	bl ov83_02245D48
	adds r0, r5, #0
	movs r1, #0
	bl ov83_02246114
_02245380:
	ldr r0, _0224538C @ =0x00000623
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
	.align 2, 0
_02245388: .4byte 0x0000055C
_0224538C: .4byte 0x00000623
	thumb_func_end ov83_02245318

	thumb_func_start ov83_02245390
ov83_02245390: @ 0x02245390
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0xf]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _022453AC
	ldr r0, _022453B8 @ =0x000005F8
	ldr r0, [r4, r0]
	bl FUN_02018694
	adds r0, r4, #0
	bl ov83_02246C70
_022453AC:
	ldr r0, _022453BC @ =0x00000604
	adds r0, r4, r0
	bl ov83_022478B4
	pop {r4, pc}
	nop
_022453B8: .4byte 0x000005F8
_022453BC: .4byte 0x00000604
	thumb_func_end ov83_02245390

	thumb_func_start ov83_022453C0
ov83_022453C0: @ 0x022453C0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xae
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	adds r4, #0xc0
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov83_02247944
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_022453C0

	thumb_func_start ov83_022453DC
ov83_022453DC: @ 0x022453DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r4, r1, #0
	add r1, sp, #0x1c
	str r1, [sp]
	add r1, sp, #0x20
	add r3, sp, #0x1c
	adds r5, r0, #0
	adds r1, #2
	add r2, sp, #0x20
	adds r3, #2
	bl ov83_02244DF4
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02245472
	add r1, sp, #0x1c
	ldrh r0, [r1, #6]
	adds r0, #0x48
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r0, [r1, #4]
	movs r1, #0
	adds r2, r7, #0
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r3, r6, #0
	bl FUN_0201DA74
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	str r0, [sp, #0x18]
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x18]
	bl FUN_020310BC
	movs r1, #0
	adds r2, r0, #0
	str r1, [sp]
	adds r0, r5, #0
	movs r3, #4
	bl ov83_02244A98
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r2, #2
	str r2, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r7, #0
	bl ov83_0224484C
	strb r0, [r5, #0xa]
	b _02245540
_02245472:
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0x10
	movs r1, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x40
	adds r3, r1, #0
	bl FUN_0201DA74
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0x10
	movs r1, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0xc0
	adds r3, r1, #0
	bl FUN_0201DA74
	bl FUN_0203769C
	cmp r0, #0
	bne _022454C6
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	adds r6, r0, #0
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r5, #4]
	adds r1, r6, #0
	bl FUN_020310BC
	adds r6, r0, #0
	ldr r0, _0224554C @ =0x000005BA
	ldrh r7, [r5, r0]
	b _022454E8
_022454C6:
	ldr r0, _0224554C @ =0x000005BA
	ldrh r6, [r5, r0]
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	adds r7, r0, #0
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r5, #4]
	adds r1, r7, #0
	bl FUN_020310BC
	adds r7, r0, #0
_022454E8:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #4
	str r1, [sp]
	bl ov83_02244A98
	movs r0, #0x70
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02245550 @ =0x00010200
	adds r1, r4, #0
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	movs r3, #2
	bl ov83_02245D08
	movs r1, #0
	adds r0, r5, #0
	adds r2, r7, #0
	movs r3, #4
	str r1, [sp]
	bl ov83_02244A98
	movs r0, #0xf0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02245550 @ =0x00010200
	adds r1, r4, #0
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	movs r3, #3
	bl ov83_02245D08
_02245540:
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0224554C: .4byte 0x000005BA
_02245550: .4byte 0x00010200
	thumb_func_end ov83_022453DC

	thumb_func_start ov83_02245554
ov83_02245554: @ 0x02245554
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov83_02245068
	adds r2, r0, #0
	movs r1, #0
	adds r0, r5, #0
	movs r3, #4
	str r1, [sp]
	bl ov83_02244A98
	adds r0, r5, #0
	movs r1, #0x19
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	adds r0, r5, #0
	bl ov83_02244A74
	strb r4, [r5, #0xe]
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_02245554

	thumb_func_start ov83_02245584
ov83_02245584: @ 0x02245584
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	add r1, sp, #4
	str r1, [sp]
	add r1, sp, #8
	add r3, sp, #4
	adds r5, r0, #0
	adds r1, #2
	add r2, sp, #8
	adds r3, #2
	bl ov83_02244DF4
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _022455C8
	movs r0, #0
	str r0, [sp]
	add r3, sp, #4
	ldrh r2, [r3, #6]
	ldrh r3, [r3, #4]
	adds r0, r5, #0
	adds r2, r2, #4
	adds r3, r3, #1
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	adds r1, r4, #0
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x10
	bl ov83_02244AD8
	b _02245630
_022455C8:
	bl FUN_0203769C
	cmp r0, #0
	add r2, sp, #4
	bne _02245602
	ldrh r0, [r2, #4]
	adds r1, r4, #0
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0
	str r0, [sp]
	ldrh r2, [r2, #6]
	adds r0, r5, #0
	bl ov83_02244AD8
	movs r0, #0
	str r0, [sp]
	add r3, sp, #4
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r3, #1
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	bl ov83_02244B40
	b _02245630
_02245602:
	ldrh r0, [r2, #4]
	adds r1, r4, #0
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0
	str r0, [sp]
	ldrh r2, [r2, #6]
	adds r0, r5, #0
	bl ov83_02244B40
	movs r0, #0
	str r0, [sp]
	add r3, sp, #4
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r3, #1
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	bl ov83_02244AD8
_02245630:
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov83_02245584

	thumb_func_start ov83_0224563C
ov83_0224563C: @ 0x0224563C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _02245740 @ =0x000005E3
	adds r7, r1, #0
	adds r6, r2, #0
	bl FUN_0200604C
	ldrb r0, [r4, #0x15]
	adds r1, r7, #0
	str r0, [sp]
	bl ov83_0224776C
	str r0, [sp, #4]
	cmp r6, #4
	bhi _02245686
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02245668: @ jump table
	.2byte _02245672 - _02245668 - 2 @ case 0
	.2byte _02245676 - _02245668 - 2 @ case 1
	.2byte _02245686 - _02245668 - 2 @ case 2
	.2byte _02245680 - _02245668 - 2 @ case 3
	.2byte _02245684 - _02245668 - 2 @ case 4
_02245672:
	movs r5, #1
	b _02245686
_02245676:
	ldrb r0, [r4, #0x12]
	bl ov83_02245068
	adds r5, r0, #0
	b _02245686
_02245680:
	movs r5, #2
	b _02245686
_02245684:
	movs r5, #5
_02245686:
	bl FUN_0203769C
	cmp r0, #0
	bne _022456BA
	ldr r0, [sp]
	cmp r7, r0
	bhs _022456A8
	adds r0, r4, #0
	movs r1, #5
	bl ov83_02244ABC
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	adds r2, r5, #0
	bl FUN_02237FA4
	b _022456E4
_022456A8:
	ldr r0, [r4, #0x24]
	movs r1, #5
	bl ov83_022477C4
	ldr r0, _02245744 @ =0x000005BA
	ldrh r1, [r4, r0]
	subs r1, r1, r5
	strh r1, [r4, r0]
	b _022456E4
_022456BA:
	ldr r0, [sp]
	cmp r7, r0
	bhs _022456D2
	ldr r0, [r4, #0x24]
	movs r1, #5
	bl ov83_022477C4
	ldr r0, _02245744 @ =0x000005BA
	ldrh r1, [r4, r0]
	subs r1, r1, r5
	strh r1, [r4, r0]
	b _022456E4
_022456D2:
	adds r0, r4, #0
	movs r1, #5
	bl ov83_02244ABC
	ldrb r1, [r4, #9]
	ldr r0, [r4, #4]
	adds r2, r5, #0
	bl FUN_02237FA4
_022456E4:
	adds r1, r4, #0
	adds r0, r4, #0
	adds r1, #0x50
	bl ov83_022453DC
	adds r0, r4, #0
	bl ov83_02245390
	cmp r6, #4
	bhi _0224573C
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02245704: @ jump table
	.2byte _0224570E - _02245704 - 2 @ case 0
	.2byte _0224571A - _02245704 - 2 @ case 1
	.2byte _0224573C - _02245704 - 2 @ case 2
	.2byte _02245728 - _02245704 - 2 @ case 3
	.2byte _02245734 - _02245704 - 2 @ case 4
_0224570E:
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl ov83_02245824
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0224571A:
	ldrb r2, [r4, #0x12]
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl ov83_02245838
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02245728:
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl ov83_02245288
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02245734:
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl ov83_02245318
_0224573C:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02245740: .4byte 0x000005E3
_02245744: .4byte 0x000005BA
	thumb_func_end ov83_0224563C

	thumb_func_start ov83_02245748
ov83_02245748: @ 0x02245748
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x14]
	adds r4, r1, #0
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _02245810 @ =0x0000055C
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r6, r0, #0
	movs r0, #0xae
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0xc0
	bl ov83_02247944
	adds r0, r6, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov83_02244AB0
	adds r0, r5, #0
	movs r1, #0x14
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	ldrb r0, [r5, #0x14]
	adds r1, r4, #0
	bl ov83_02247768
	ldr r1, _02245814 @ =0x0000054C
	movs r2, #1
	ldr r1, [r5, r1]
	strb r2, [r1, r0]
	ldrb r0, [r5, #0x14]
	adds r1, r4, #0
	bl ov83_02247768
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _02245818 @ =0x000004F4
	ldr r0, [r1, r0]
	movs r1, #0
	bl ov83_0224755C
	ldrb r0, [r5, #0x14]
	adds r1, r4, #0
	bl ov83_02247768
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _0224581C @ =0x000004E4
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov83_0224755C
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x70
	bl ov83_022449D4
	ldrb r0, [r5, #0xd]
	cmp r0, r4
	bne _022457F0
	adds r0, r5, #0
	bl ov83_02245D48
	adds r0, r5, #0
	movs r1, #0
	bl ov83_02246114
	adds r0, r5, #0
	bl ov83_02246988
_022457F0:
	ldrb r0, [r5, #0x14]
	adds r1, r4, #0
	bl ov83_02247768
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x51
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov83_0224755C
	ldr r0, _02245820 @ =0x00000623
	bl FUN_0200604C
	pop {r4, r5, r6, pc}
	.align 2, 0
_02245810: .4byte 0x0000055C
_02245814: .4byte 0x0000054C
_02245818: .4byte 0x000004F4
_0224581C: .4byte 0x000004E4
_02245820: .4byte 0x00000623
	thumb_func_end ov83_02245748

	thumb_func_start ov83_02245824
ov83_02245824: @ 0x02245824
	push {r4, lr}
	adds r4, r0, #0
	bl ov83_02245748
	adds r0, r4, #0
	adds r4, #0x80
	adds r1, r4, #0
	bl ov83_022448E4
	pop {r4, pc}
	thumb_func_end ov83_02245824

	thumb_func_start ov83_02245838
ov83_02245838: @ 0x02245838
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0xae
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r6, r1, #0
	adds r7, r2, #0
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0xc0
	bl ov83_02247944
	ldrb r0, [r5, #0x14]
	adds r1, r6, #0
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _02245994 @ =0x0000055C
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r4, r0, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov83_02244AB0
	cmp r7, #1
	bne _0224588E
	adds r0, r5, #0
	movs r1, #0x1f
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	ldr r0, _02245998 @ =0x00000632
	bl FUN_0200604C
	b _022458A0
_0224588E:
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	ldr r0, _0224599C @ =0x00000633
	bl FUN_0200604C
_022458A0:
	ldrb r0, [r5, #0x14]
	adds r1, r6, #0
	bl ov83_02247768
	movs r1, #0x55
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	ldrb r0, [r1, r0]
	cmp r0, #0
	ldrb r0, [r5, #0x14]
	bne _022458C6
	adds r1, r6, #0
	bl ov83_02247768
	movs r1, #0x55
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	strb r7, [r1, r0]
	b _022458D6
_022458C6:
	adds r1, r6, #0
	bl ov83_02247768
	movs r1, #0x55
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0
	strb r2, [r1, r0]
_022458D6:
	ldrb r0, [r5, #0x14]
	adds r1, r6, #0
	bl ov83_02247768
	movs r1, #0x55
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0224590E
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x32
	bl FUN_0206FD00
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #8
	add r2, sp, #0
	bl FUN_0206EC40
	adds r0, r4, #0
	bl FUN_0206E250
	b _02245968
_0224590E:
	ldrb r0, [r5, #0x14]
	adds r1, r6, #0
	bl ov83_02247768
	movs r1, #0x55
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _02245946
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x37
	bl FUN_0206FD00
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #8
	add r2, sp, #0
	bl FUN_0206EC40
	adds r0, r4, #0
	bl FUN_0206E250
	b _02245968
_02245946:
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x2d
	bl FUN_0206FD00
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #8
	add r2, sp, #0
	bl FUN_0206EC40
	adds r0, r4, #0
	bl FUN_0206E250
_02245968:
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x80
	bl ov83_022448E4
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x70
	bl ov83_022449D4
	ldrb r0, [r5, #0xd]
	cmp r0, r6
	bne _02245990
	adds r0, r5, #0
	bl ov83_02245D48
	adds r0, r5, #0
	movs r1, #0
	bl ov83_02246114
_02245990:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02245994: .4byte 0x0000055C
_02245998: .4byte 0x00000632
_0224599C: .4byte 0x00000633
	thumb_func_end ov83_02245838

	thumb_func_start ov83_022459A0
ov83_022459A0: @ 0x022459A0
	ldr r3, _022459A8 @ =FUN_02022C60
	movs r0, #4
	movs r1, #0
	bx r3
	.align 2, 0
_022459A8: .4byte FUN_02022C60
	thumb_func_end ov83_022459A0

	thumb_func_start ov83_022459AC
ov83_022459AC: @ 0x022459AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldrb r0, [r6, #9]
	movs r1, #1
	bl FUN_02237B24
	movs r4, #0
	str r0, [sp]
	cmp r0, #0
	ble _02245A34
	adds r5, r6, #0
_022459C4:
	ldr r0, _02245A38 @ =0x0000055C
	adds r1, r4, #0
	ldr r0, [r6, r0]
	bl FUN_02074644
	str r0, [sp, #4]
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	adds r7, r0, #0
	ldr r0, [sp, #4]
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #0
	lsls r0, r7, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	bl FUN_0222A43C
	adds r1, r0, #0
	ldr r0, _02245A3C @ =0x000004E4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02245A2A
	bl ov83_02247600
	ldrb r0, [r6, #0x14]
	ldrb r1, [r6, #0xd]
	bl ov83_02247768
	cmp r4, r0
	bne _02245A14
	ldrb r1, [r6, #0xd]
	ldrb r0, [r6, #0x15]
	cmp r1, r0
	blo _02245A20
_02245A14:
	ldr r0, _02245A3C @ =0x000004E4
	movs r1, #0
	ldr r0, [r5, r0]
	bl ov83_0224760C
	b _02245A2A
_02245A20:
	ldr r0, _02245A3C @ =0x000004E4
	movs r1, #1
	ldr r0, [r5, r0]
	bl ov83_0224760C
_02245A2A:
	ldr r0, [sp]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r0
	blt _022459C4
_02245A34:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02245A38: .4byte 0x0000055C
_02245A3C: .4byte 0x000004E4
	thumb_func_end ov83_022459AC

	thumb_func_start ov83_02245A40
ov83_02245A40: @ 0x02245A40
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_0205C1F0
	adds r7, r0, #0
	ldrb r0, [r5, #9]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [r5, #4]
	adds r1, r7, #0
	bl FUN_020310BC
	cmp r0, r4
	bhs _02245A82
	adds r0, r5, #0
	bl ov83_022453C0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	movs r0, #0x10
	strb r0, [r5, #8]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02245A82:
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #0
	bne _02245AC6
	adds r0, r5, #0
	adds r0, #0xc0
	bl ov83_02245094
	ldrb r1, [r5, #9]
	ldr r0, [r5, #4]
	adds r2, r4, #0
	bl FUN_02237FA4
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x50
	bl ov83_022453DC
	cmp r4, #2
	bne _02245AB6
	ldrb r1, [r5, #0xd]
	adds r0, r5, #0
	bl ov83_02245288
	b _02245ABE
_02245AB6:
	ldrb r1, [r5, #0xd]
	adds r0, r5, #0
	bl ov83_02245318
_02245ABE:
	movs r0, #0xd
	strb r0, [r5, #8]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02245AC6:
	movs r0, #1
	strb r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov83_02245A40

	thumb_func_start ov83_02245ACC
ov83_02245ACC: @ 0x02245ACC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	adds r4, r1, #0
	movs r1, #0
	adds r7, r2, #0
	bl FUN_02237B24
	cmp r7, #5
	bne _02245AE6
	movs r6, #2
	b _02245AEA
_02245AE6:
	bl GF_AssertFail
_02245AEA:
	ldrb r7, [r5, #0x15]
	adds r1, r4, #0
	adds r0, r7, #0
	bl ov83_0224776C
	bl FUN_0203769C
	cmp r0, #0
	bne _02245B9A
	cmp r4, r7
	bhs _02245B7A
	adds r0, r5, #0
	movs r1, #5
	bl ov83_02244ABC
	movs r0, #0xaf
	lsls r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	adds r2, r6, #0
	bl ov83_0224777C
	ldrb r1, [r5, #9]
	ldr r0, [r5, #4]
	movs r2, #0x32
	bl FUN_02237FA4
	movs r0, #0xaf
	lsls r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	adds r2, r6, #0
	bl ov83_0224777C
	adds r4, r0, #0
	movs r0, #0xaf
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0203107C
	adds r7, r0, #0
	ldrb r0, [r5, #9]
	adds r1, r6, #0
	bl FUN_0205C174
	str r0, [sp]
	ldrb r0, [r5, #9]
	adds r1, r6, #0
	bl FUN_0205C174
	bl FUN_0205C268
	adds r3, r4, #1
	lsls r3, r3, #0x10
	adds r2, r0, #0
	ldr r1, [sp]
	adds r0, r7, #0
	lsrs r3, r3, #0x10
	bl FUN_02031108
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _02245C36
	ldrb r1, [r5, #0xf]
	movs r0, #0xf8
	bics r1, r0
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r5, #0xf]
	b _02245C36
_02245B7A:
	ldr r0, [r5, #0x24]
	movs r1, #5
	bl ov83_022477C4
	ldr r1, _02245C78 @ =0x000005B7
	adds r2, r1, #3
	adds r0, r5, r1
	ldrh r2, [r5, r2]
	ldrb r4, [r0, r6]
	adds r1, r1, #3
	subs r2, #0x32
	strh r2, [r5, r1]
	ldrb r1, [r0, r6]
	adds r1, r1, #1
	strb r1, [r0, r6]
	b _02245C36
_02245B9A:
	cmp r4, r7
	bhs _02245BBE
	ldr r0, [r5, #0x24]
	movs r1, #5
	bl ov83_022477C4
	ldr r1, _02245C78 @ =0x000005B7
	adds r2, r1, #3
	adds r0, r5, r1
	ldrh r2, [r5, r2]
	ldrb r4, [r0, r6]
	adds r1, r1, #3
	subs r2, #0x32
	strh r2, [r5, r1]
	ldrb r1, [r0, r6]
	adds r1, r1, #1
	strb r1, [r0, r6]
	b _02245C36
_02245BBE:
	adds r0, r5, #0
	movs r1, #5
	bl ov83_02244ABC
	movs r0, #0xaf
	lsls r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	adds r2, r6, #0
	bl ov83_0224777C
	ldrb r1, [r5, #9]
	ldr r0, [r5, #4]
	movs r2, #0x32
	bl FUN_02237FA4
	movs r0, #0xaf
	lsls r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	adds r2, r6, #0
	bl ov83_0224777C
	adds r4, r0, #0
	movs r0, #0xaf
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0203107C
	adds r7, r0, #0
	ldrb r0, [r5, #9]
	adds r1, r6, #0
	bl FUN_0205C174
	str r0, [sp, #4]
	ldrb r0, [r5, #9]
	adds r1, r6, #0
	bl FUN_0205C174
	bl FUN_0205C268
	adds r3, r4, #1
	lsls r3, r3, #0x10
	adds r2, r0, #0
	ldr r1, [sp, #4]
	adds r0, r7, #0
	lsrs r3, r3, #0x10
	bl FUN_02031108
	ldrb r0, [r5, #9]
	bl FUN_02237D8C
	cmp r0, #1
	bne _02245C36
	ldrb r1, [r5, #0xf]
	movs r0, #0xf8
	bics r1, r0
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r5, #0xf]
_02245C36:
	adds r0, r5, #0
	bl ov83_02245390
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x50
	bl ov83_022453DC
	movs r0, #0xae
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0xc0
	bl ov83_02247944
	movs r1, #6
	adds r3, r6, #0
	muls r3, r1, r3
	ldr r1, _02245C7C @ =0x02248054
	lsls r2, r4, #1
	adds r1, r1, r3
	ldrh r1, [r2, r1]
	adds r0, r5, #0
	movs r2, #1
	bl ov83_022448AC
	strb r0, [r5, #0xa]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02245C78: .4byte 0x000005B7
_02245C7C: .4byte 0x02248054
	thumb_func_end ov83_02245ACC

	thumb_func_start ov83_02245C80
ov83_02245C80: @ 0x02245C80
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrb r0, [r6, #9]
	movs r1, #1
	bl FUN_02237B58
	adds r5, r0, #0
	movs r4, #0
	cmp r5, #0
	ble _02245CA4
_02245C94:
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	bl ov83_02245CA8
	adds r4, r4, #1
	cmp r4, r5
	blt _02245C94
_02245CA4:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov83_02245C80

	thumb_func_start ov83_02245CA8
ov83_02245CA8: @ 0x02245CA8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02245CE0 @ =0x00000554
	adds r4, r1, #0
	ldr r1, [r5, r0]
	ldrb r1, [r1, r4]
	cmp r1, #1
	bne _02245CC6
	lsls r1, r4, #3
	adds r1, r5, r1
	subs r0, #0x34
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov83_0224755C
_02245CC6:
	ldr r0, _02245CE4 @ =0x00000558
	ldr r1, [r5, r0]
	ldrb r1, [r1, r4]
	cmp r1, #1
	bne _02245CDE
	lsls r1, r4, #3
	adds r1, r5, r1
	subs r0, #0x34
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov83_0224755C
_02245CDE:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02245CE0: .4byte 0x00000554
_02245CE4: .4byte 0x00000558
	thumb_func_end ov83_02245CA8

	thumb_func_start ov83_02245CE8
ov83_02245CE8: @ 0x02245CE8
	push {r3, r4, r5, lr}
	ldrb r0, [r0, #9]
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_02237D8C
	cmp r0, #1
	bne _02245CFC
	movs r0, #0x40
	b _02245CFE
_02245CFC:
	movs r0, #0x60
_02245CFE:
	str r0, [r5]
	movs r0, #0x3c
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov83_02245CE8

	thumb_func_start ov83_02245D08
ov83_02245D08: @ 0x02245D08
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r2, #0
	adds r1, r3, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	adds r2, r6, #0
	bl FUN_0200CBBC
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x24]
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	str r0, [sp, #8]
	ldr r1, [r5, #0x28]
	adds r0, r4, #0
	bl ov83_02247998
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov83_02245D08

	thumb_func_start ov83_02245D48
ov83_02245D48: @ 0x02245D48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrb r0, [r5, #0x14]
	ldrb r1, [r5, #0xd]
	bl ov83_02247768
	adds r1, r0, #0
	ldr r0, _02245EDC @ =0x0000055C
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r6, r0, #0
	bl FUN_0206DD40
	str r0, [sp, #4]
	ldr r0, _02245EE0 @ =0x000005BC
	str r6, [r5, r0]
	adds r0, r6, #0
	bl FUN_02070DB0
	movs r1, #0x17
	lsls r1, r1, #6
	str r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _02245EE4 @ =0x000005C4
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa1
	bl FUN_0206E540
	ldr r1, _02245EE8 @ =0x000005C7
	movs r2, #0
	strb r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa
	bl FUN_0206E540
	ldr r1, _02245EEC @ =0x000005C8
	strb r0, [r5, r1]
	adds r0, r6, #0
	bl FUN_0206FDFC
	ldr r1, _02245EF0 @ =0x000005C9
	movs r2, #0
	strb r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #6
	bl FUN_0206E540
	ldr r1, _02245EF4 @ =0x000005CA
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa3
	bl FUN_0206E540
	movs r1, #0x5d
	lsls r1, r1, #4
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _02245EF8 @ =0x000005D2
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa5
	bl FUN_0206E540
	ldr r1, _02245EFC @ =0x000005D4
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa8
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _02245F00 @ =0x000005D6
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa6
	bl FUN_0206E540
	ldr r1, _02245F04 @ =0x000005D8
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa9
	bl FUN_0206E540
	ldr r1, _02245F08 @ =0x000005DA
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xa7
	bl FUN_0206E540
	ldr r1, _02245F0C @ =0x000005DC
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0x70
	bl FUN_0206E540
	ldr r1, _02245F10 @ =0x000005DE
	strb r0, [r5, r1]
	movs r1, #0
	adds r0, r6, #0
	adds r2, r1, #0
	bl FUN_0206E540
	ldr r1, _02245F14 @ =0x000005CC
	movs r2, #0
	str r0, [r5, r1]
	adds r0, r6, #0
	movs r1, #0xb0
	bl FUN_0206E540
	cmp r0, #1
	ldr r1, _02245F18 @ =0x000005C6
	bne _02245E54
	ldrb r2, [r5, r1]
	movs r0, #0x80
	bics r2, r0
	strb r2, [r5, r1]
	b _02245E5C
_02245E54:
	ldrb r2, [r5, r1]
	movs r0, #0x80
	orrs r0, r2
	strb r0, [r5, r1]
_02245E5C:
	adds r0, r6, #0
	bl FUN_0206FF88
	ldr r3, _02245F18 @ =0x000005C6
	movs r2, #0x7f
	ldrb r1, [r5, r3]
	movs r4, #0
	bics r1, r2
	movs r2, #0x7f
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, r3]
_02245E74:
	lsls r0, r4, #1
	adds r0, r5, r0
	adds r1, r4, #0
	str r0, [sp]
	adds r0, r6, #0
	adds r1, #0x36
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x5e
	ldr r2, [sp]
	lsls r1, r1, #4
	strh r0, [r2, r1]
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x3a
	movs r2, #0
	adds r7, r5, r4
	bl FUN_0206E540
	ldr r1, _02245F1C @ =0x000005E8
	movs r2, #0
	strb r0, [r7, r1]
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x3e
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x5e
	lsls r1, r1, #0x18
	ldr r2, [sp]
	lsls r0, r0, #4
	ldrh r0, [r2, r0]
	lsrs r1, r1, #0x18
	bl FUN_0207332C
	ldr r1, _02245F20 @ =0x000005EC
	strb r0, [r7, r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	blo _02245E74
	ldr r1, [sp, #4]
	adds r0, r6, #0
	bl FUN_0206DD8C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02245EDC: .4byte 0x0000055C
_02245EE0: .4byte 0x000005BC
_02245EE4: .4byte 0x000005C4
_02245EE8: .4byte 0x000005C7
_02245EEC: .4byte 0x000005C8
_02245EF0: .4byte 0x000005C9
_02245EF4: .4byte 0x000005CA
_02245EF8: .4byte 0x000005D2
_02245EFC: .4byte 0x000005D4
_02245F00: .4byte 0x000005D6
_02245F04: .4byte 0x000005D8
_02245F08: .4byte 0x000005DA
_02245F0C: .4byte 0x000005DC
_02245F10: .4byte 0x000005DE
_02245F14: .4byte 0x000005CC
_02245F18: .4byte 0x000005C6
_02245F1C: .4byte 0x000005E8
_02245F20: .4byte 0x000005EC
	thumb_func_end ov83_02245D48

	thumb_func_start ov83_02245F24
ov83_02245F24: @ 0x02245F24
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x13
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x15
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x17
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x1b
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x1d
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x1f
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x21
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x23
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x25
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246110 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x42
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246110 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x34
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246110 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x32
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246110 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x30
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246110 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x1b
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x43
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246110 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x1d
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x36
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246110 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x1f
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x3a
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246110 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x21
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x38
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246110 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x23
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x3c
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246110 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r1, [r4, #0x20]
	adds r0, r4, r0
	movs r2, #0x3e
	bl ov83_022479E4
	movs r0, #0x13
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x15
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x17
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x1b
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x1d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x1f
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x21
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x23
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	movs r0, #0x25
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	add sp, #0x10
	pop {r4, pc}
	nop
_02246110: .4byte 0x00010200
	thumb_func_end ov83_02245F24

	thumb_func_start ov83_02246114
ov83_02246114: @ 0x02246114
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	movs r0, #0xaf
	str r1, [sp, #0x14]
	lsls r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	movs r2, #2
	bl ov83_0224777C
	adds r6, r0, #0
	ldrb r0, [r5, #0x14]
	ldrb r1, [r5, #0xd]
	bl ov83_02247768
	adds r4, r0, #0
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x12
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #5
	lsls r0, r0, #6
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #6
	lsls r0, r0, #6
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x1a
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x1e
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x22
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #9
	lsls r0, r0, #6
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x26
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x27
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _02246538 @ =0x000005C6
	ldrb r0, [r5, r0]
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x1f
	bne _0224621E
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bne _022461FE
	movs r3, #0
	str r3, [sp]
	ldr r0, _0224653C @ =0x00050600
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x40
	bl ov83_022479E4
	b _0224621E
_022461FE:
	cmp r0, #1
	bne _0224621E
	movs r3, #0
	str r3, [sp]
	movs r0, #0xc1
	str r3, [sp, #4]
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x41
	bl ov83_022479E4
_0224621E:
	movs r1, #0
	ldr r2, _02246540 @ =0x000005C7
	str r1, [sp]
	ldrb r2, [r5, r2]
	adds r0, r5, #0
	movs r3, #3
	bl ov83_02244A98
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02246544 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #5
	lsls r1, r1, #6
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x48
	bl ov83_02245D08
	ldr r0, _02246548 @ =0x0000054C
	ldr r1, [r5, r0]
	ldrb r1, [r1, r4]
	cmp r1, #0
	beq _022462D8
	adds r0, #0x70
	ldr r0, [r5, r0]
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, [r5, #0x24]
	movs r1, #0
	bl FUN_0200BF1C
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02246544 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #0x11
	lsls r1, r1, #4
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x45
	bl ov83_02245D08
	movs r1, #0
	movs r2, #0x5d
	str r1, [sp]
	lsls r2, r2, #4
	ldrh r2, [r5, r2]
	adds r0, r5, #0
	movs r3, #3
	bl ov83_02244A98
	movs r0, #0
	str r0, [sp]
	ldr r2, _0224654C @ =0x000005D2
	adds r0, r5, #0
	ldrh r2, [r5, r2]
	movs r1, #1
	movs r3, #3
	bl ov83_02244A98
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r5, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02246544 @ =0x00010200
	movs r1, #7
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	lsls r1, r1, #6
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x4e
	bl ov83_02245D08
	b _0224631C
_022462D8:
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246544 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x4b
	bl ov83_022479E4
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r5, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02246544 @ =0x00010200
	movs r2, #0x4d
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #7
	lsls r0, r0, #6
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	lsls r3, r3, #3
	bl ov83_022479E4
_0224631C:
	ldr r2, _02246550 @ =0x00000554
	ldr r0, [r5, r2]
	ldrb r0, [r0, r4]
	cmp r0, #0
	bne _02246328
	b _022464D2
_02246328:
	adds r2, #0x74
	ldrb r2, [r5, r2]
	ldr r0, [r5, #0x24]
	movs r1, #0
	bl FUN_0200C060
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02246544 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #0x16
	lsls r1, r1, #4
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x35
	bl ov83_02245D08
	ldr r2, _02246554 @ =0x000005C9
	ldr r0, [r5, #0x24]
	ldrb r2, [r5, r2]
	movs r1, #0
	bl FUN_0200C098
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02246544 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #6
	lsls r1, r1, #6
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x33
	bl ov83_02245D08
	ldr r2, _02246558 @ =0x000005CA
	ldr r0, [r5, #0x24]
	ldrh r2, [r5, r2]
	movs r1, #0
	bl FUN_0200C0CC
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _02246544 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #0x1a
	lsls r1, r1, #4
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x31
	bl ov83_02245D08
	movs r1, #0
	ldr r2, _0224655C @ =0x000005D4
	str r1, [sp]
	ldrh r2, [r5, r2]
	adds r0, r5, #0
	movs r3, #3
	bl ov83_02244A98
	movs r0, #0x1e
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02246544 @ =0x00010200
	movs r1, #0x1e
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	lsls r1, r1, #4
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x37
	bl ov83_02245D08
	movs r1, #0
	ldr r2, _02246560 @ =0x000005D6
	str r1, [sp]
	ldrh r2, [r5, r2]
	adds r0, r5, #0
	movs r3, #3
	bl ov83_02244A98
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02246544 @ =0x00010200
	movs r1, #1
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r1, r1, #9
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x3b
	bl ov83_02245D08
	movs r1, #0
	ldr r2, _02246564 @ =0x000005D8
	str r1, [sp]
	ldrh r2, [r5, r2]
	adds r0, r5, #0
	movs r3, #3
	bl ov83_02244A98
	movs r0, #0x22
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02246544 @ =0x00010200
	movs r1, #0x22
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	lsls r1, r1, #4
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x39
	bl ov83_02245D08
	movs r1, #0
	ldr r2, _02246568 @ =0x000005DA
	str r1, [sp]
	ldrh r2, [r5, r2]
	adds r0, r5, #0
	movs r3, #3
	bl ov83_02244A98
	movs r0, #9
	lsls r0, r0, #6
	adds r0, r5, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02246544 @ =0x00010200
	movs r1, #9
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	lsls r1, r1, #6
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x3d
	bl ov83_02245D08
	movs r1, #0
	ldr r2, _0224656C @ =0x000005DC
	str r1, [sp]
	ldrh r2, [r5, r2]
	adds r0, r5, #0
	movs r3, #3
	bl ov83_02244A98
	movs r0, #0x26
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02246544 @ =0x00010200
	movs r1, #0x26
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	lsls r1, r1, #4
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r3, #0x3f
	bl ov83_02245D08
	b _0224662C
_022464D2:
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246544 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x4b
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246544 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #6
	lsls r0, r0, #6
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x4b
	bl ov83_022479E4
	movs r3, #0
	str r3, [sp]
	ldr r0, _02246544 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x4b
	bl ov83_022479E4
	movs r0, #0x1e
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02246544 @ =0x00010200
	b _02246570
	nop
_02246538: .4byte 0x000005C6
_0224653C: .4byte 0x00050600
_02246540: .4byte 0x000005C7
_02246544: .4byte 0x00010200
_02246548: .4byte 0x0000054C
_0224654C: .4byte 0x000005D2
_02246550: .4byte 0x00000554
_02246554: .4byte 0x000005C9
_02246558: .4byte 0x000005CA
_0224655C: .4byte 0x000005D4
_02246560: .4byte 0x000005D6
_02246564: .4byte 0x000005D8
_02246568: .4byte 0x000005DA
_0224656C: .4byte 0x000005DC
_02246570:
	movs r2, #0x4a
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	lsls r3, r3, #3
	bl ov83_022479E4
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0224690C @ =0x00010200
	movs r2, #0x4a
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	lsls r0, r0, #9
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	lsls r3, r3, #3
	bl ov83_022479E4
	movs r0, #0x22
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0224690C @ =0x00010200
	movs r2, #0x4a
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	lsls r3, r3, #3
	bl ov83_022479E4
	movs r0, #9
	lsls r0, r0, #6
	adds r0, r5, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0224690C @ =0x00010200
	movs r2, #0x4a
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #9
	lsls r0, r0, #6
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	lsls r3, r3, #3
	bl ov83_022479E4
	movs r0, #0x26
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0224690C @ =0x00010200
	movs r2, #0x4a
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	lsls r3, r3, #3
	bl ov83_022479E4
_0224662C:
	cmp r6, #1
	bne _0224664C
	movs r3, #0
	str r3, [sp]
	ldr r0, _0224690C @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r2, #0x4c
	bl ov83_022479E4
	b _02246864
_0224664C:
	ldr r0, _02246910 @ =0x00000558
	ldr r0, [r5, r0]
	ldrb r0, [r0, r4]
	cmp r0, #0
	bne _02246722
	movs r0, #0
	str r0, [sp, #0x20]
_0224665A:
	ldr r0, [sp, #0x20]
	movs r2, #0x4b
	lsls r4, r0, #4
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0224690C @ =0x00010200
	movs r3, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	bl ov83_022479E4
	ldr r0, [r5, #0x20]
	movs r1, #0x44
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #0
	adds r1, r7, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x17
	lsrs r6, r0, #0x18
	movs r0, #0
	str r0, [sp]
	ldr r0, _0224690C @ =0x00010200
	adds r1, r7, #0
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0x27
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r2, #0x78
	adds r3, r4, #0
	bl ov83_02247998
	adds r0, r7, #0
	bl FUN_02026380
	ldr r0, [r5, #0x20]
	movs r1, #0x49
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #0
	adds r1, r7, #0
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0224690C @ =0x00010200
	movs r2, #0x78
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x27
	lsls r0, r0, #4
	subs r2, r2, r6
	subs r2, r2, r3
	adds r0, r5, r0
	adds r1, r7, #0
	adds r3, r4, #0
	bl ov83_02247998
	adds r0, r7, #0
	bl FUN_02026380
	adds r6, #0x78
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0224690C @ =0x00010200
	movs r2, #0x49
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	adds r3, r6, #0
	bl ov83_022479E4
	ldr r0, [sp, #0x20]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	cmp r0, #4
	blo _0224665A
	b _02246864
_02246722:
	movs r4, #0
_02246724:
	lsls r0, r4, #1
	movs r2, #0x5e
	adds r7, r5, r0
	lsls r2, r2, #4
	ldrh r2, [r7, r2]
	ldr r0, [r5, #0x24]
	adds r1, r4, #0
	bl FUN_0200BFF0
	movs r0, #0
	movs r1, #0x27
	lsls r1, r1, #4
	adds r3, r4, #0
	lsls r6, r4, #4
	str r0, [sp]
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0224690C @ =0x00010200
	adds r1, r5, r1
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	adds r3, #0x54
	bl ov83_02245D08
	movs r0, #0x5e
	lsls r0, r0, #4
	ldrh r0, [r7, r0]
	cmp r0, #0
	bne _02246784
	str r6, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0224690C @ =0x00010200
	movs r2, #0x5a
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r1, [r5, #0x20]
	adds r0, r5, r0
	movs r3, #0x78
	bl ov83_022479E4
	b _02246858
_02246784:
	ldr r0, [r5, #0x20]
	movs r1, #0x44
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #0
	adds r1, r7, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x17
	lsrs r6, r0, #0x18
	lsls r0, r4, #4
	str r0, [sp, #0x1c]
	movs r0, #0
	str r0, [sp]
	ldr r0, _0224690C @ =0x00010200
	ldr r3, [sp, #0x1c]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0x27
	lsls r0, r0, #4
	adds r0, r5, r0
	adds r1, r7, #0
	movs r2, #0x78
	bl ov83_02247998
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r5, r4
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp]
	ldr r3, [sp, #0x18]
	ldr r2, _02246914 @ =0x000005E8
	adds r0, r5, #0
	ldrb r2, [r3, r2]
	movs r1, #0
	movs r3, #2
	bl ov83_02244A98
	ldr r0, [r5, #0x20]
	movs r1, #0x59
	bl FUN_0200BBA0
	adds r7, r0, #0
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [r5, #0x28]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0224690C @ =0x00010200
	movs r3, #0x78
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x27
	subs r3, r3, r6
	lsls r0, r0, #4
	subs r2, r3, r2
	ldr r1, [r5, #0x28]
	ldr r3, [sp, #0x1c]
	adds r0, r5, r0
	bl ov83_02247998
	adds r0, r7, #0
	bl FUN_02026380
	movs r0, #0
	str r0, [sp]
	ldr r3, [sp, #0x18]
	ldr r2, _02246918 @ =0x000005EC
	adds r0, r5, #0
	ldrb r2, [r3, r2]
	movs r1, #0
	movs r3, #2
	bl ov83_02244A98
	adds r6, #0x78
	movs r1, #0x27
	lsls r1, r1, #4
	ldr r0, [sp, #0x1c]
	str r6, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, _0224690C @ =0x00010200
	adds r1, r5, r1
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x20]
	adds r0, r5, #0
	movs r3, #0x59
	bl ov83_02245D08
_02246858:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhs _02246864
	b _02246724
_02246864:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _02246884
	movs r4, #0xc
	adds r5, #0x50
_0224686E:
	lsls r0, r4, #4
	adds r0, r5, r0
	bl FUN_0201D5C8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x22
	bls _0224686E
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_02246884:
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8A0
	movs r0, #0x12
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8A0
	movs r0, #5
	lsls r0, r0, #6
	adds r0, r5, r0
	bl FUN_0201D8A0
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8A0
	movs r0, #6
	lsls r0, r0, #6
	adds r0, r5, r0
	bl FUN_0201D8A0
	movs r0, #0x1a
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8A0
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r5, r0
	bl FUN_0201D8A0
	movs r0, #0x1e
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8A0
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D8A0
	movs r0, #0x22
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8A0
	movs r0, #9
	lsls r0, r0, #6
	adds r0, r5, r0
	bl FUN_0201D8A0
	movs r0, #0x26
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8A0
	movs r0, #0x27
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D8A0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0224690C: .4byte 0x00010200
_02246910: .4byte 0x00000558
_02246914: .4byte 0x000005E8
_02246918: .4byte 0x000005EC
	thumb_func_end ov83_02246114

	thumb_func_start ov83_0224691C
ov83_0224691C: @ 0x0224691C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov83_02245D48
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov83_02246114
	adds r0, r5, #0
	bl ov83_02246988
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov83_0224691C

	thumb_func_start ov83_02246938
ov83_02246938: @ 0x02246938
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	cmp r1, #1
	bne _02246962
	movs r0, #0x11
	lsls r0, r0, #4
	movs r4, #0xc
	adds r5, r6, r0
_02246948:
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0x22
	bls _02246948
	ldr r0, _02246984 @ =0x00000544
	movs r1, #1
	ldr r0, [r6, r0]
	bl ov83_0224755C
	pop {r4, r5, r6, pc}
_02246962:
	movs r0, #0x11
	lsls r0, r0, #4
	movs r5, #0xc
	adds r4, r6, r0
_0224696A:
	adds r0, r4, #0
	bl FUN_0201D8E4
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #0x22
	bls _0224696A
	ldr r0, _02246984 @ =0x00000544
	movs r1, #0
	ldr r0, [r6, r0]
	bl ov83_0224755C
	pop {r4, r5, r6, pc}
	.align 2, 0
_02246984: .4byte 0x00000544
	thumb_func_end ov83_02246938

	thumb_func_start ov83_02246988
ov83_02246988: @ 0x02246988
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	ldrb r1, [r4, #0xd]
	bl ov83_02247768
	ldr r3, _022469D4 @ =0x0000054C
	ldr r1, [r4, r3]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _022469B6
	adds r0, r3, #0
	adds r1, r3, #0
	subs r0, #8
	adds r1, #0x74
	adds r3, #0x80
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r3, [r4, r3]
	movs r2, #0
	bl ov83_02247668
	pop {r4, pc}
_022469B6:
	adds r2, r3, #0
	adds r0, r3, #0
	adds r1, r3, #0
	adds r2, #0x78
	subs r0, #8
	adds r1, #0x74
	adds r3, #0x80
	ldrh r2, [r4, r2]
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r3, [r4, r3]
	bl ov83_02247668
	pop {r4, pc}
	nop
_022469D4: .4byte 0x0000054C
	thumb_func_end ov83_02246988

	thumb_func_start ov83_022469D8
ov83_022469D8: @ 0x022469D8
	ldr r3, _022469E0 @ =ov83_02244CDC
	strb r1, [r0, #0xd]
	strb r2, [r0, #0xc]
	bx r3
	.align 2, 0
_022469E0: .4byte ov83_02244CDC
	thumb_func_end ov83_022469D8

	thumb_func_start ov83_022469E4
ov83_022469E4: @ 0x022469E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	add r0, sp, #4
	adds r4, r1, #0
	adds r0, #2
	add r1, sp, #4
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov83_02247988
	ldr r0, _02246A90 @ =0x02248018
	add r1, sp, #4
	ldrh r2, [r0]
	add r3, sp, #8
	strh r2, [r1, #0x1c]
	ldrh r2, [r0, #2]
	strh r2, [r1, #0x1e]
	ldrh r2, [r0, #4]
	strh r2, [r1, #0x20]
	ldrh r2, [r0, #6]
	strh r2, [r1, #0x22]
	ldrh r2, [r0, #8]
	ldrh r0, [r0, #0xa]
	strh r2, [r1, #0x24]
	strh r0, [r1, #0x26]
	ldrh r0, [r1, #2]
	strh r0, [r1, #0x22]
	ldrh r2, [r1]
	adds r0, r0, r2
	subs r0, #0x1b
	strh r0, [r1, #0x24]
	strh r2, [r1, #0x26]
	ldrh r0, [r1, #0x1c]
	strh r0, [r1, #4]
	ldrh r0, [r1, #0x1e]
	strh r0, [r1, #6]
	ldrh r0, [r1, #0x20]
	strh r0, [r1, #8]
	ldrh r0, [r1, #0x22]
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0x24]
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0x26]
	strh r0, [r1, #0xe]
	ldr r0, _02246A94 @ =0x000005FC
	ldr r2, [r5, r0]
	subs r0, #8
	str r2, [sp, #0x14]
	ldr r2, [r5, #0x4c]
	str r2, [sp, #0x18]
	strb r4, [r1, #0x18]
	add r1, sp, #0x30
	ldrb r1, [r1, #0x10]
	adds r2, r6, #0
	str r1, [sp]
	adds r1, r3, #0
	ldr r0, [r5, r0]
	adds r3, r7, #0
	bl ov83_02247CCC
	ldr r1, _02246A98 @ =0x000005F8
	str r0, [r5, r1]
	ldrb r1, [r5, #0xf]
	movs r0, #4
	orrs r0, r1
	strb r0, [r5, #0xf]
	ldrb r0, [r5, #9]
	movs r1, #1
	bl FUN_02237B24
	adds r4, r0, #0
	ldr r0, _02246A9C @ =0x000004E4
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #1
	bl ov83_0224773C
	ldr r0, _02246AA0 @ =0x000004F4
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #1
	bl ov83_0224773C
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02246A90: .4byte 0x02248018
_02246A94: .4byte 0x000005FC
_02246A98: .4byte 0x000005F8
_02246A9C: .4byte 0x000004E4
_02246AA0: .4byte 0x000004F4
	thumb_func_end ov83_022469E4

	thumb_func_start ov83_02246AA4
ov83_02246AA4: @ 0x02246AA4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #4
	movs r1, #0x6b
	movs r4, #0
	bl FUN_02014918
	ldr r1, _02246B5C @ =0x000005FC
	movs r2, #2
	str r0, [r5, r1]
	movs r0, #0xaf
	lsls r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	bl ov83_0224777C
	adds r7, r0, #0
	ldrb r0, [r5, #0x14]
	ldrb r1, [r5, #0xd]
	bl ov83_02247768
	adds r6, r0, #0
	ldr r0, _02246B60 @ =0x0000054C
	ldr r1, [r5, r0]
	ldrb r1, [r1, r6]
	cmp r1, #0
	bne _02246AEE
	adds r0, #0xb0
	ldr r0, [r5, r0]
	ldr r1, [r5, #0x20]
	movs r2, #8
	adds r3, r4, #0
	bl FUN_02014960
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_02246AEE:
	ldr r0, _02246B5C @ =0x000005FC
	ldr r1, [r5, #0x20]
	ldr r0, [r5, r0]
	movs r2, #9
	movs r3, #1
	bl FUN_02014960
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _02246B64 @ =0x00000554
	ldr r1, [r5, r0]
	ldrb r1, [r1, r6]
	cmp r1, #0
	beq _02246B1A
	adds r0, r0, #4
	ldr r0, [r5, r0]
	ldrb r0, [r0, r6]
	cmp r0, #0
	beq _02246B1A
	cmp r7, #2
	beq _02246B2E
_02246B1A:
	ldr r0, _02246B5C @ =0x000005FC
	ldr r1, [r5, #0x20]
	ldr r0, [r5, r0]
	movs r2, #0xa
	movs r3, #2
	bl FUN_02014960
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_02246B2E:
	ldr r0, _02246B5C @ =0x000005FC
	movs r2, #0xb
	adds r3, r2, #0
	ldr r0, [r5, r0]
	ldr r1, [r5, #0x20]
	subs r3, #0xd
	bl FUN_02014960
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r3, #0x18
	ldr r4, _02246B68 @ =0x02248010
	movs r0, #0xd
	str r0, [sp]
	ldrb r3, [r4, r3]
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #0x11
	bl ov83_022469E4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02246B5C: .4byte 0x000005FC
_02246B60: .4byte 0x0000054C
_02246B64: .4byte 0x00000554
_02246B68: .4byte 0x02248010
	thumb_func_end ov83_02246AA4

	thumb_func_start ov83_02246B6C
ov83_02246B6C: @ 0x02246B6C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #4
	movs r1, #0x6b
	movs r4, #0
	bl FUN_02014918
	ldr r1, _02246C1C @ =0x000005FC
	movs r2, #2
	str r0, [r5, r1]
	movs r0, #0xaf
	lsls r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	bl ov83_0224777C
	adds r6, r0, #0
	ldrb r0, [r5, #0x14]
	ldrb r1, [r5, #0xd]
	bl ov83_02247768
	adds r7, r0, #0
	ldr r0, _02246C20 @ =0x00000554
	ldr r1, [r5, r0]
	ldrb r1, [r1, r7]
	cmp r1, #0
	bne _02246BB6
	adds r0, #0xa8
	ldr r0, [r5, r0]
	ldr r1, [r5, #0x20]
	movs r2, #0x21
	movs r3, #3
	bl FUN_02014960
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_02246BB6:
	cmp r6, #1
	beq _02246BD8
	ldr r0, _02246C24 @ =0x00000558
	ldr r1, [r5, r0]
	ldrb r1, [r1, r7]
	cmp r1, #0
	bne _02246BD8
	adds r0, #0xa4
	ldr r0, [r5, r0]
	ldr r1, [r5, #0x20]
	movs r2, #0x22
	movs r3, #4
	bl FUN_02014960
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_02246BD8:
	cmp r6, #2
	beq _02246BF0
	ldr r0, _02246C1C @ =0x000005FC
	ldr r1, [r5, #0x20]
	ldr r0, [r5, r0]
	movs r2, #0x23
	movs r3, #5
	bl FUN_02014960
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_02246BF0:
	ldr r0, _02246C1C @ =0x000005FC
	movs r2, #0x24
	adds r3, r2, #0
	ldr r0, [r5, r0]
	ldr r1, [r5, #0x20]
	subs r3, #0x26
	bl FUN_02014960
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r3, #0x18
	ldr r4, _02246C28 @ =0x02248010
	movs r0, #0xd
	str r0, [sp]
	ldrb r3, [r4, r3]
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #0x11
	bl ov83_022469E4
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02246C1C: .4byte 0x000005FC
_02246C20: .4byte 0x00000554
_02246C24: .4byte 0x00000558
_02246C28: .4byte 0x02248010
	thumb_func_end ov83_02246B6C

	thumb_func_start ov83_02246C2C
ov83_02246C2C: @ 0x02246C2C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x6b
	bl FUN_02014918
	ldr r1, _02246C6C @ =0x000005FC
	movs r4, #0
	str r0, [r5, r1]
	adds r6, r1, #0
_02246C42:
	adds r2, r4, #0
	ldr r0, [r5, r6]
	ldr r1, [r5, #0x20]
	adds r2, #0x16
	adds r3, r4, #0
	bl FUN_02014960
	adds r4, r4, #1
	cmp r4, #3
	blo _02246C42
	movs r0, #0xd
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0x11
	movs r3, #8
	bl ov83_022469E4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02246C6C: .4byte 0x000005FC
	thumb_func_end ov83_02246C2C

	thumb_func_start ov83_02246C70
ov83_02246C70: @ 0x02246C70
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	movs r1, #1
	bl FUN_02237B24
	adds r4, r0, #0
	ldr r0, _02246CB0 @ =0x000004E4
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	bl ov83_0224773C
	ldr r0, _02246CB4 @ =0x000004F4
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	bl ov83_0224773C
	ldr r0, _02246CB8 @ =0x000005F8
	ldr r0, [r5, r0]
	bl ov83_02247CE8
	ldr r0, _02246CBC @ =0x000005FC
	ldr r0, [r5, r0]
	bl FUN_02014950
	ldrb r1, [r5, #0xf]
	movs r0, #4
	bics r1, r0
	strb r1, [r5, #0xf]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02246CB0: .4byte 0x000004E4
_02246CB4: .4byte 0x000004F4
_02246CB8: .4byte 0x000005F8
_02246CBC: .4byte 0x000005FC
	thumb_func_end ov83_02246C70

	thumb_func_start ov83_02246CC0
ov83_02246CC0: @ 0x02246CC0
	push {r4, lr}
	sub sp, #0x18
	ldr r1, _02246D3C @ =0x000005F8
	adds r4, r0, #0
	ldr r0, [r4, r1]
	adds r3, r1, #0
	adds r0, #0x24
	adds r3, #8
	ldrb r0, [r0]
	ldr r3, [r4, r3]
	cmp r3, r0
	beq _02246D36
	adds r1, r1, #4
	ldr r1, [r4, r1]
	lsls r0, r0, #3
	adds r0, r1, r0
	ldr r1, [r0, #4]
	cmp r1, #2
	bhi _02246CF4
	cmp r1, #0
	beq _02246CFE
	cmp r1, #1
	beq _02246D02
	cmp r1, #2
	beq _02246D06
	b _02246D0C
_02246CF4:
	movs r0, #1
	mvns r0, r0
	cmp r1, r0
	beq _02246D0A
	b _02246D0C
_02246CFE:
	movs r2, #0xc
	b _02246D0C
_02246D02:
	movs r2, #0xd
	b _02246D0C
_02246D06:
	movs r2, #0xe
	b _02246D0C
_02246D0A:
	movs r2, #0xf
_02246D0C:
	movs r3, #1
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	adds r1, r4, #0
	str r3, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r1, #0xc0
	str r3, [sp, #0x14]
	bl ov83_022447E0
	ldr r0, _02246D3C @ =0x000005F8
	ldr r1, [r4, r0]
	adds r0, #8
	adds r1, #0x24
	ldrb r1, [r1]
	str r1, [r4, r0]
_02246D36:
	add sp, #0x18
	pop {r4, pc}
	nop
_02246D3C: .4byte 0x000005F8
	thumb_func_end ov83_02246CC0

	thumb_func_start ov83_02246D40
ov83_02246D40: @ 0x02246D40
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r0, #6
	lsls r0, r0, #8
	ldr r1, [r5, r0]
	subs r0, #8
	ldr r0, [r5, r0]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r1, r0
	beq _02246DEA
	movs r0, #0xaf
	lsls r0, r0, #2
	ldrb r1, [r5, #9]
	ldr r0, [r5, r0]
	movs r2, #2
	bl ov83_0224777C
	cmp r0, #1
	beq _02246D6E
	movs r1, #1
	b _02246D70
_02246D6E:
	movs r1, #0
_02246D70:
	ldr r2, _02246DF0 @ =0x000005FC
	ldr r0, [r5, r2]
	subs r2, r2, #4
	ldr r2, [r5, r2]
	adds r2, #0x24
	ldrb r2, [r2]
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r2, [r0, #4]
	cmp r2, #5
	bhi _02246D96
	cmp r2, #3
	blo _02246DBE
	beq _02246DA0
	cmp r2, #4
	beq _02246DA8
	cmp r2, #5
	beq _02246DB0
	b _02246DBE
_02246D96:
	movs r0, #1
	mvns r0, r0
	cmp r2, r0
	beq _02246DB8
	b _02246DBE
_02246DA0:
	ldr r0, _02246DF4 @ =0x02248024
	lsls r1, r1, #1
	ldrh r4, [r0, r1]
	b _02246DBE
_02246DA8:
	ldr r0, _02246DF8 @ =0x02248028
	lsls r1, r1, #1
	ldrh r4, [r0, r1]
	b _02246DBE
_02246DB0:
	ldr r0, _02246DFC @ =0x0224802C
	lsls r1, r1, #1
	ldrh r4, [r0, r1]
	b _02246DBE
_02246DB8:
	ldr r0, _02246E00 @ =0x02248030
	lsls r1, r1, #1
	ldrh r4, [r0, r1]
_02246DBE:
	movs r3, #1
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	adds r1, r5, #0
	str r3, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r1, #0xc0
	adds r2, r4, #0
	str r3, [sp, #0x14]
	bl ov83_022447E0
	ldr r0, _02246E04 @ =0x000005F8
	ldr r1, [r5, r0]
	adds r0, #8
	adds r1, #0x24
	ldrb r1, [r1]
	str r1, [r5, r0]
_02246DEA:
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_02246DF0: .4byte 0x000005FC
_02246DF4: .4byte 0x02248024
_02246DF8: .4byte 0x02248028
_02246DFC: .4byte 0x0224802C
_02246E00: .4byte 0x02248030
_02246E04: .4byte 0x000005F8
	thumb_func_end ov83_02246D40

	thumb_func_start ov83_02246E08
ov83_02246E08: @ 0x02246E08
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	str r1, [sp, #0x14]
	movs r0, #0x20
	movs r1, #0x6b
	str r2, [sp, #0x18]
	bl FUN_0202055C
	bl ov83_022472DC
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x6b
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	movs r0, #0x28
	adds r1, r5, #4
	movs r2, #0x6b
	bl FUN_02009F40
	ldr r4, _02247148 @ =0x02248178
	str r0, [r5]
	movs r7, #0
	adds r6, r5, #0
_02246E4C:
	ldrb r0, [r4]
	adds r1, r7, #0
	movs r2, #0x6b
	bl FUN_0200A090
	movs r1, #0x4b
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r7, r7, #1
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r7, #4
	blt _02246E4C
	adds r0, r5, #0
	bl ov83_022473BC
	movs r0, #0
	str r0, [sp]
	movs r3, #1
	str r3, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xc1
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0xf
	bl FUN_0200A1D8
	movs r1, #0x4f
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r3, #0
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	adds r0, #0xc5
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x37
	bl FUN_0200A234
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xc9
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x11
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xcd
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x10
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x52
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0x12
	movs r1, #0x6b
	bl FUN_02007688
	adds r6, r5, #0
	adds r7, r0, #0
	movs r4, #4
	adds r6, #0x40
_02246EFC:
	movs r0, #0
	movs r1, #1
	bl FUN_02077C18
	adds r2, r0, #0
	str r4, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xc1
	ldr r0, [r5, r0]
	adds r1, r7, #0
	movs r3, #0
	bl FUN_0200A3C8
	movs r1, #0x4f
	lsls r1, r1, #2
	str r0, [r6, r1]
	movs r0, #0
	movs r1, #2
	bl FUN_02077C18
	adds r2, r0, #0
	str r4, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	adds r0, #0xc5
	ldr r0, [r5, r0]
	movs r1, #0x12
	movs r3, #0
	bl FUN_0200A234
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r6, r1]
	adds r4, r4, #1
	adds r6, #0x10
	cmp r4, #9
	ble _02246EFC
	bl FUN_02077CE0
	adds r2, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xc9
	ldr r0, [r5, r0]
	adds r1, r7, #0
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x61
	lsls r1, r1, #2
	str r0, [r5, r1]
	bl FUN_02077CE4
	adds r2, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xcd
	ldr r0, [r5, r0]
	adds r1, r7, #0
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	movs r1, #2
	bl FUN_02077C18
	adds r2, r0, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	adds r0, #0xc5
	ldr r0, [r5, r0]
	movs r1, #0x12
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r7, #0
	bl FUN_0200770C
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xc1
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x24
	movs r3, #1
	bl FUN_0200A1D8
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xc9
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x26
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x5d
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xcd
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x25
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov83_02247314
	movs r0, #0x14
	movs r1, #0x6b
	bl FUN_02007688
	adds r7, r0, #0
	bl FUN_02074490
	adds r2, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	adds r0, #0xc5
	ldr r0, [r5, r0]
	movs r1, #0x14
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x1e
	lsls r1, r1, #4
	str r0, [r5, r1]
	bl FUN_02074498
	adds r2, r0, #0
	movs r0, #5
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xc9
	ldr r0, [r5, r0]
	adds r1, r7, #0
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x79
	lsls r1, r1, #2
	str r0, [r5, r1]
	bl FUN_020744A4
	adds r2, r0, #0
	movs r0, #5
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xcd
	ldr r0, [r5, r0]
	adds r1, r7, #0
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x7a
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r4, #0
	adds r6, r5, #0
_022470AE:
	cmp r4, #3
	bne _022470CC
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _022470C2
	ldr r0, [sp, #0x14]
	movs r1, #0
	bl FUN_02074644
	b _022470D4
_022470C2:
	ldr r0, [sp, #0x14]
	adds r1, r4, #0
	bl FUN_02074644
	b _022470D4
_022470CC:
	ldr r0, [sp, #0x14]
	adds r1, r4, #0
	bl FUN_02074644
_022470D4:
	bl FUN_020741B0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xa
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xc1
	ldr r0, [r5, r0]
	adds r1, r7, #0
	movs r3, #0
	bl FUN_0200A3C8
	movs r1, #0x77
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r4, r4, #1
	adds r6, #0x10
	cmp r4, #4
	blt _022470AE
	adds r0, r7, #0
	bl FUN_0200770C
	movs r7, #0x4f
	movs r6, #0
	adds r4, r5, #0
	lsls r7, r7, #2
_02247110:
	ldr r0, [r4, r7]
	bl FUN_0200ACF0
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #0xe
	blt _02247110
	movs r6, #5
	movs r4, #0
	lsls r6, r6, #6
_02247124:
	ldr r0, [r5, r6]
	bl FUN_0200AF94
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0xb
	blt _02247124
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02247148: .4byte 0x02248178
	thumb_func_end ov83_02246E08

	thumb_func_start ov83_0224714C
ov83_0224714C: @ 0x0224714C
	push {r4, r5, r6, lr}
	sub sp, #0x80
	adds r4, r0, #0
	movs r0, #0
	str r3, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r5, #0
	ldr r0, [sp, #0x98]
	str r5, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r6, [r4, r0]
	str r6, [sp, #0x14]
	adds r6, r0, #4
	ldr r6, [r4, r6]
	str r6, [sp, #0x18]
	adds r6, r0, #0
	adds r6, #8
	ldr r6, [r4, r6]
	adds r0, #0xc
	str r6, [sp, #0x1c]
	ldr r0, [r4, r0]
	str r0, [sp, #0x20]
	str r5, [sp, #0x24]
	str r5, [sp, #0x28]
	add r0, sp, #0x5c
	bl FUN_02009D48
	ldr r0, [r4]
	adds r1, r5, #0
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
	ldr r0, [sp, #0x94]
	str r0, [sp, #0x50]
	add r0, sp, #0x80
	ldrb r0, [r0, #0x1c]
	cmp r0, #0
	bne _022471BA
	movs r0, #1
	str r0, [sp, #0x54]
	b _022471BE
_022471BA:
	movs r0, #2
	str r0, [sp, #0x54]
_022471BE:
	movs r0, #0x6b
	str r0, [sp, #0x58]
	add r0, sp, #0x80
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	bne _022471D4
	movs r0, #3
	ldr r1, [sp, #0x38]
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #0x38]
_022471D4:
	add r0, sp, #0x2c
	bl FUN_02024624
	movs r1, #1
	adds r4, r0, #0
	bl FUN_0202484C
	movs r1, #1
	adds r0, r4, #0
	lsls r1, r1, #0xc
	bl FUN_02024868
	ldr r1, [sp, #0x90]
	adds r0, r4, #0
	bl FUN_020248F0
	adds r0, r4, #0
	add sp, #0x80
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov83_0224714C

	thumb_func_start ov83_022471FC
ov83_022471FC: @ 0x022471FC
	push {r4, r5, r6, lr}
	movs r6, #0x4f
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_02247206:
	lsls r0, r4, #4
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_0200AEB0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xe
	blo _02247206
	movs r6, #5
	movs r4, #0
	lsls r6, r6, #6
_02247220:
	lsls r0, r4, #4
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_0200B0A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xb
	blo _02247220
	movs r6, #0x4b
	movs r4, #0
	lsls r6, r6, #2
_0224723A:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_0200A0D0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _0224723A
	ldr r0, [r5]
	bl FUN_02024504
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov83_022471FC

	thumb_func_start ov83_02247264
ov83_02247264: @ 0x02247264
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r6, r2, #0
	bl FUN_0200A7BC
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x6b
	str r0, [sp, #4]
	adds r0, #0xc1
	ldr r0, [r5, r0]
	adds r1, r4, #0
	movs r2, #0x12
	bl FUN_0200A2E4
	adds r0, r4, #0
	bl FUN_0200AE8C
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_02247264

	thumb_func_start ov83_022472A0
ov83_022472A0: @ 0x022472A0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r6, r2, #0
	bl FUN_0200A7BC
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #2
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x6b
	str r0, [sp, #4]
	adds r0, #0xc5
	ldr r0, [r5, r0]
	adds r1, r4, #0
	movs r2, #0x12
	bl FUN_0200A350
	adds r0, r4, #0
	bl FUN_0200B084
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_022472A0

	thumb_func_start ov83_022472DC
ov83_022472DC: @ 0x022472DC
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0224730C @ =0x0224817C
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	ldr r2, _02247310 @ =0x00100010
	movs r1, #0x10
	bl FUN_020215C0
	movs r0, #0x20
	movs r1, #0x6b
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0224730C: .4byte 0x0224817C
_02247310: .4byte 0x00100010
	thumb_func_end ov83_022472DC

	thumb_func_start ov83_02247314
ov83_02247314: @ 0x02247314
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x15
	movs r1, #0x6b
	bl FUN_02007688
	adds r4, r0, #0
	bl FUN_0207CA9C
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xc1
	ldr r0, [r5, r0]
	adds r1, r4, #0
	movs r3, #0
	bl FUN_0200A3C8
	movs r1, #0x53
	lsls r1, r1, #2
	str r0, [r5, r1]
	bl FUN_0207CAA0
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	adds r0, #0xc5
	ldr r0, [r5, r0]
	movs r1, #0x15
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x15
	lsls r1, r1, #4
	str r0, [r5, r1]
	bl FUN_0207CAA4
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xc9
	ldr r0, [r5, r0]
	adds r1, r4, #0
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x55
	lsls r1, r1, #2
	str r0, [r5, r1]
	bl FUN_0207CAA8
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xcd
	ldr r0, [r5, r0]
	adds r1, r4, #0
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x56
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_02247314

	thumb_func_start ov83_022473BC
ov83_022473BC: @ 0x022473BC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #8
	movs r1, #0x6b
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xc1
	ldr r0, [r5, r0]
	adds r1, r4, #0
	movs r2, #0x4c
	movs r3, #0
	bl FUN_0200A3C8
	movs r1, #0x57
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6b
	str r0, [sp, #0xc]
	adds r0, #0xc5
	ldr r0, [r5, r0]
	adds r1, r4, #0
	movs r2, #0x4b
	movs r3, #0
	bl FUN_0200A480
	movs r1, #0x16
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xc9
	ldr r0, [r5, r0]
	adds r1, r4, #0
	movs r2, #0x4d
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	adds r0, #0xcd
	ldr r0, [r5, r0]
	adds r1, r4, #0
	movs r2, #0x4e
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x5a
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_022473BC

	thumb_func_start ov83_02247454
ov83_02247454: @ 0x02247454
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x6b
	movs r1, #8
	adds r7, r2, #0
	str r3, [sp, #0x10]
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
	add r0, sp, #0x28
	movs r2, #0x14
	ldrsh r2, [r0, r2]
	ldr r3, [sp, #0x10]
	strh r2, [r4]
	movs r2, #0x18
	ldrsh r0, [r0, r2]
	adds r2, r7, #0
	strh r0, [r4, #2]
	ldr r0, [sp, #0x38]
	str r0, [sp]
	ldr r0, [sp, #0x44]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov83_0224714C
	str r0, [r4, #4]
	add r1, sp, #0x28
	movs r0, #0x14
	ldrsh r0, [r1, r0]
	lsls r0, r0, #0xc
	str r0, [sp, #0x14]
	movs r0, #0x18
	ldrsh r0, [r1, r0]
	add r1, sp, #0x14
	lsls r0, r0, #0xc
	str r0, [sp, #0x18]
	ldr r0, [r4, #4]
	bl FUN_020247D4
	adds r0, r4, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov83_02247454

	thumb_func_start ov83_022474C4
ov83_022474C4: @ 0x022474C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x6b
	movs r1, #8
	adds r7, r2, #0
	str r3, [sp, #0x10]
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
	add r0, sp, #0x28
	movs r2, #0x14
	ldrsh r2, [r0, r2]
	ldr r3, [sp, #0x10]
	strh r2, [r4]
	movs r2, #0x18
	ldrsh r0, [r0, r2]
	adds r2, r7, #0
	strh r0, [r4, #2]
	ldr r0, [sp, #0x38]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [sp, #0x44]
	adds r1, r6, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r5, #0
	bl ov83_0224714C
	str r0, [r4, #4]
	add r1, sp, #0x28
	movs r0, #0x14
	ldrsh r0, [r1, r0]
	lsls r0, r0, #0xc
	str r0, [sp, #0x14]
	movs r0, #0x18
	ldrsh r1, [r1, r0]
	lsls r0, r0, #0xf
	lsls r1, r1, #0xc
	adds r0, r1, r0
	str r0, [sp, #0x18]
	ldr r0, [r4, #4]
	add r1, sp, #0x14
	bl FUN_020247D4
	adds r0, r4, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov83_022474C4

	thumb_func_start ov83_0224753C
ov83_0224753C: @ 0x0224753C
	push {r4, lr}
	adds r4, r0, #0
	bne _0224754A
	bl GF_AssertFail
	movs r0, #0
	pop {r4, pc}
_0224754A:
	ldr r0, [r4, #4]
	bl FUN_02024758
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_0224753C

	thumb_func_start ov83_0224755C
ov83_0224755C: @ 0x0224755C
	ldr r3, _02247564 @ =FUN_02024830
	ldr r0, [r0, #4]
	bx r3
	nop
_02247564: .4byte FUN_02024830
	thumb_func_end ov83_0224755C

	thumb_func_start ov83_02247568
ov83_02247568: @ 0x02247568
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_020248AC
	adds r3, r0, #0
	add r2, sp, #0
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r1, r7, #0
	str r0, [r2]
	lsls r0, r4, #0xc
	str r0, [sp]
	lsls r0, r6, #0xc
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	bl FUN_020247D4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov83_02247568

	thumb_func_start ov83_0224759C
ov83_0224759C: @ 0x0224759C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_020248AC
	adds r3, r0, #0
	add r2, sp, #0
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	lsls r1, r6, #0xc
	str r0, [r2]
	lsls r0, r4, #0xc
	str r0, [sp]
	movs r0, #3
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	adds r1, r7, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov83_0224759C

	thumb_func_start ov83_022475D4
ov83_022475D4: @ 0x022475D4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	movs r1, #0
	bl FUN_020249D4
	ldr r0, [r5, #4]
	adds r1, r4, #0
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
	thumb_func_end ov83_022475D4

	thumb_func_start ov83_022475EC
ov83_022475EC: @ 0x022475EC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl FUN_02074484
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl FUN_02024AA8
	pop {r4, pc}
	thumb_func_end ov83_022475EC

	thumb_func_start ov83_02247600
ov83_02247600: @ 0x02247600
	ldr r3, _02247608 @ =FUN_0222A3D4
	ldr r0, [r0, #4]
	bx r3
	nop
_02247608: .4byte FUN_0222A3D4
	thumb_func_end ov83_02247600

	thumb_func_start ov83_0224760C
ov83_0224760C: @ 0x0224760C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #4]
	bl FUN_0222A400
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_0224760C

	thumb_func_start ov83_02247624
ov83_02247624: @ 0x02247624
	ldr r3, _0224762C @ =FUN_02024B68
	ldr r0, [r0, #4]
	bx r3
	nop
_0224762C: .4byte FUN_02024B68
	thumb_func_end ov83_02247624

	thumb_func_start ov83_02247630
ov83_02247630: @ 0x02247630
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	movs r1, #0xb
	bl ov83_022475D4
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov83_02247568
	adds r0, r5, #0
	movs r1, #1
	bl ov83_0224755C
	ldr r0, _02247660 @ =0x000005E3
	bl FUN_0200604C
	ldr r0, _02247664 @ =0x00000655
	bl FUN_0200604C
	pop {r4, r5, r6, pc}
	nop
_02247660: .4byte 0x000005E3
_02247664: .4byte 0x00000655
	thumb_func_end ov83_02247630

	thumb_func_start ov83_02247668
ov83_02247668: @ 0x02247668
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r7, r3, #0
	adds r6, r2, #0
	ldr r3, _02247738 @ =0x0224818C
	add r2, sp, #0x20
	adds r5, r0, #0
	str r1, [sp, #0x14]
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r1, #0x32
	movs r0, #0x6b
	lsls r1, r1, #6
	bl FUN_0201AACC
	adds r4, r0, #0
	cmp r6, #0
	beq _022476C0
	ldr r1, [sp, #0x14]
	add r0, sp, #0x30
	movs r2, #2
	movs r3, #0
	bl FUN_0207013C
	str r4, [sp]
	str r7, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	add r1, sp, #0x1c
	ldrh r0, [r1, #0x14]
	ldrh r1, [r1, #0x16]
	movs r2, #0x6b
	add r3, sp, #0x20
	bl FUN_02014510
	add r0, sp, #0x1c
	ldrh r7, [r0, #0x14]
	ldrh r6, [r0, #0x18]
	b _022476EA
_022476C0:
	movs r0, #0x6b
	str r0, [sp]
	movs r0, #0xb8
	movs r1, #0x27
	movs r2, #1
	add r3, sp, #0x1c
	bl FUN_020079BC
	adds r6, r0, #0
	ldr r0, [sp, #0x1c]
	movs r2, #0x32
	ldr r0, [r0, #0x14]
	adds r1, r4, #0
	lsls r2, r2, #6
	blx FUN_020D4808
	adds r0, r6, #0
	bl FUN_0201AB0C
	movs r7, #0xb8
	movs r6, #0x3d
_022476EA:
	ldr r0, [r5, #4]
	bl FUN_02024B1C
	movs r1, #2
	blx FUN_020B802C
	movs r1, #0x32
	str r0, [sp, #0x18]
	adds r0, r4, #0
	lsls r1, r1, #6
	blx DC_FlushRange
	movs r2, #0x32
	ldr r1, [sp, #0x18]
	adds r0, r4, #0
	lsls r2, r2, #6
	blx FUN_020CFECC
	ldr r0, [r5, #4]
	bl FUN_02024B34
	movs r1, #2
	blx FUN_020B8078
	adds r3, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x6b
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #5
	bl FUN_02007938
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02247738: .4byte 0x0224818C
	thumb_func_end ov83_02247668

	thumb_func_start ov83_0224773C
ov83_0224773C: @ 0x0224773C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r2, #1
	bne _0224774A
	movs r7, #1
	b _0224774C
_0224774A:
	movs r7, #0
_0224774C:
	movs r4, #0
	cmp r6, #0
	bls _02247764
_02247752:
	ldr r0, [r5]
	adds r1, r7, #0
	ldr r0, [r0, #4]
	bl FUN_02024B78
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r6
	blo _02247752
_02247764:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov83_0224773C

	thumb_func_start ov83_02247768
ov83_02247768: @ 0x02247768
	adds r0, r1, #0
	bx lr
	thumb_func_end ov83_02247768

	thumb_func_start ov83_0224776C
ov83_0224776C: @ 0x0224776C
	cmp r1, r0
	blo _02247776
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_02247776:
	adds r0, r1, #0
	bx lr
	.align 2, 0
	thumb_func_end ov83_0224776C

	thumb_func_start ov83_0224777C
ov83_0224777C: @ 0x0224777C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_0203107C
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0205C174
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0205C174
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_020310BC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov83_0224777C

	thumb_func_start ov83_022477B0
ov83_022477B0: @ 0x022477B0
	push {r3, lr}
	movs r2, #0
	mvns r2, r2
	cmp r0, r2
	beq _022477C0
	adds r0, r1, #0
	bl FUN_0200604C
_022477C0:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov83_022477B0

	thumb_func_start ov83_022477C4
ov83_022477C4: @ 0x022477C4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0203769C
	movs r1, #1
	eors r0, r1
	bl FUN_02034818
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0200BE48
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov83_022477C4

	thumb_func_start ov83_022477E4
ov83_022477E4: @ 0x022477E4
	movs r1, #0
	str r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov83_022477E4

	thumb_func_start ov83_022477EC
ov83_022477EC: @ 0x022477EC
	push {r4, r5}
	lsls r5, r0, #2
	adds r0, r1, #1
	adds r4, r0, #0
	movs r0, #0xf
	adds r1, r0, #0
	lsls r1, r5
	subs r0, #0x10
	ldr r3, [r2]
	eors r0, r1
	lsls r4, r5
	ands r0, r3
	orrs r0, r4
	str r0, [r2]
	pop {r4, r5}
	bx lr
	thumb_func_end ov83_022477EC

	thumb_func_start ov83_0224780C
ov83_0224780C: @ 0x0224780C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	movs r6, #0xf
_02247814:
	ldr r1, [r5]
	lsls r0, r4, #2
	lsrs r1, r0
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	beq _02247832
	subs r1, r1, #1
	lsls r0, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BC28
_02247832:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #7
	bls _02247814
	adds r0, r5, #0
	bl ov83_022477E4
	pop {r4, r5, r6, pc}
	thumb_func_end ov83_0224780C

	thumb_func_start ov83_02247844
ov83_02247844: @ 0x02247844
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x6b
	bl FUN_0201660C
	str r0, [r4]
	movs r0, #0
	str r0, [r4, #4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_02247844

	thumb_func_start ov83_02247858
ov83_02247858: @ 0x02247858
	ldr r3, _02247860 @ =FUN_02016624
	ldr r0, [r0]
	bx r3
	nop
_02247860: .4byte FUN_02016624
	thumb_func_end ov83_02247858

	thumb_func_start ov83_02247864
ov83_02247864: @ 0x02247864
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	adds r5, r1, #0
	add r0, sp, #0
	adds r0, #2
	add r1, sp, #0
	str r5, [r4, #8]
	bl ov83_02247988
	movs r0, #0
	str r5, [sp, #4]
	str r0, [sp, #8]
	add r2, sp, #0
	ldrh r1, [r2, #2]
	str r1, [sp, #0xc]
	movs r1, #0xb
	str r1, [sp, #0x10]
	movs r1, #0x19
	strb r1, [r2, #0x14]
	movs r1, #0xa
	strb r1, [r2, #0x15]
	ldrb r3, [r2, #0x16]
	movs r1, #0xf
	bics r3, r1
	strb r3, [r2, #0x16]
	ldrb r3, [r2, #0x16]
	movs r1, #0xf0
	bics r3, r1
	strb r3, [r2, #0x16]
	strb r0, [r2, #0x17]
	ldr r0, [r4]
	add r1, sp, #4
	bl FUN_020166FC
	movs r0, #1
	str r0, [r4, #4]
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov83_02247864

	thumb_func_start ov83_022478B4
ov83_022478B4: @ 0x022478B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022478D0
	ldr r0, [r4]
	bl FUN_020169CC
	ldr r0, [r4, #8]
	movs r1, #0
	bl FUN_0201BF7C
	movs r0, #0
	str r0, [r4, #4]
_022478D0:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_022478B4

	thumb_func_start ov83_022478D4
ov83_022478D4: @ 0x022478D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	adds r5, r1, #0
	ldr r0, _02247914 @ =0x0224819C
	lsls r1, r2, #3
	ldr r0, [r0, r1]
	movs r4, #0
	str r0, [sp, #4]
	ldr r0, _02247918 @ =0x022481A0
	ldr r7, [r0, r1]
	cmp r7, #0
	bls _02247910
_022478EE:
	ldr r2, [sp, #4]
	lsls r6, r4, #4
	lsls r3, r4, #3
	ldr r0, [sp]
	adds r1, r5, r6
	adds r2, r2, r3
	bl FUN_0201D4F8
	adds r0, r5, r6
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	blo _022478EE
_02247910:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02247914: .4byte 0x0224819C
_02247918: .4byte 0x022481A0
	thumb_func_end ov83_022478D4

	thumb_func_start ov83_0224791C
ov83_0224791C: @ 0x0224791C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _02247940 @ =0x022481A0
	lsls r1, r1, #3
	ldr r5, [r0, r1]
	movs r4, #0
	cmp r5, #0
	bls _0224793E
_0224792C:
	lsls r0, r4, #4
	adds r0, r6, r0
	bl FUN_0201D520
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r5
	blo _0224792C
_0224793E:
	pop {r4, r5, r6, pc}
	.align 2, 0
_02247940: .4byte 0x022481A0
	thumb_func_end ov83_0224791C

	thumb_func_start ov83_02247944
ov83_02247944: @ 0x02247944
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r4, r0, #0
	bl FUN_0201EE8C
	adds r1, r0, #0
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x6b
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02247984 @ =0x000003D9
	movs r3, #0xa
	bl FUN_0200E644
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	ldr r2, _02247984 @ =0x000003D9
	adds r0, r4, #0
	movs r1, #1
	movs r3, #0xa
	bl FUN_0200E998
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02247984: .4byte 0x000003D9
	thumb_func_end ov83_02247944

	thumb_func_start ov83_02247988
ov83_02247988: @ 0x02247988
	movs r2, #0xf0
	strh r2, [r1]
	ldr r1, _02247994 @ =0x000002E9
	strh r1, [r0]
	bx lr
	nop
_02247994: .4byte 0x000002E9
	thumb_func_end ov83_02247988

	thumb_func_start ov83_02247998
ov83_02247998: @ 0x02247998
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, [sp, #0x30]
	adds r7, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	cmp r0, #1
	bne _022479B6
	ldr r0, [sp, #0x28]
	movs r2, #0
	bl FUN_02002F30
	subs r5, r5, r0
	b _022479C6
_022479B6:
	cmp r0, #2
	bne _022479C6
	ldr r0, [sp, #0x28]
	movs r2, #0
	bl FUN_02002F30
	lsrs r0, r0, #1
	subs r5, r5, r0
_022479C6:
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
	thumb_func_end ov83_02247998

	thumb_func_start ov83_022479E4
ov83_022479E4: @ 0x022479E4
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
	bl ov83_02247998
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov83_022479E4

	thumb_func_start ov83_02247A18
ov83_02247A18: @ 0x02247A18
	ldr r3, _02247A1C @ =FUN_02019BDC
	bx r3
	.align 2, 0
_02247A1C: .4byte FUN_02019BDC
	thumb_func_end ov83_02247A18

	thumb_func_start ov83_02247A20
ov83_02247A20: @ 0x02247A20
	bx lr
	.align 2, 0
	thumb_func_end ov83_02247A20

	thumb_func_start ov83_02247A24
ov83_02247A24: @ 0x02247A24
	push {lr}
	sub sp, #0xc
	adds r3, r0, #0
	cmp r2, #3
	bne _02247A4A
	movs r0, #1
	str r0, [sp]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	ldr r0, _02247A68 @ =0x02248530
	ldr r1, _02247A6C @ =0x022485A8
	ldr r2, _02247A70 @ =0x02248500
	bl FUN_02019BA4
	add sp, #0xc
	pop {pc}
_02247A4A:
	movs r0, #1
	str r0, [sp]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	ldr r0, _02247A74 @ =0x02248558
	ldr r1, _02247A78 @ =0x022485E8
	ldr r2, _02247A70 @ =0x02248500
	bl FUN_02019BA4
	add sp, #0xc
	pop {pc}
	nop
_02247A68: .4byte 0x02248530
_02247A6C: .4byte 0x022485A8
_02247A70: .4byte 0x02248500
_02247A74: .4byte 0x02248558
_02247A78: .4byte 0x022485E8
	thumb_func_end ov83_02247A24

	thumb_func_start ov83_02247A7C
ov83_02247A7C: @ 0x02247A7C
	push {lr}
	sub sp, #0xc
	adds r3, r0, #0
	cmp r2, #3
	bne _02247AA2
	movs r0, #1
	str r0, [sp]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	ldr r0, _02247AC0 @ =0x02248530
	ldr r1, _02247AC4 @ =0x022485A8
	ldr r2, _02247AC8 @ =0x02248510
	bl FUN_02019BA4
	add sp, #0xc
	pop {pc}
_02247AA2:
	movs r0, #1
	str r0, [sp]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	ldr r0, _02247ACC @ =0x02248558
	ldr r1, _02247AD0 @ =0x022485E8
	ldr r2, _02247AC8 @ =0x02248510
	bl FUN_02019BA4
	add sp, #0xc
	pop {pc}
	nop
_02247AC0: .4byte 0x02248530
_02247AC4: .4byte 0x022485A8
_02247AC8: .4byte 0x02248510
_02247ACC: .4byte 0x02248558
_02247AD0: .4byte 0x022485E8
	thumb_func_end ov83_02247A7C

	thumb_func_start ov83_02247AD4
ov83_02247AD4: @ 0x02247AD4
	push {r3, lr}
	bl FUN_02019BE4
	adds r1, r0, #4
	cmp r1, #3
	bhi _02247AF6
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02247AEC: @ jump table
	.2byte _02247AF4 - _02247AEC - 2 @ case 0
	.2byte _02247AF4 - _02247AEC - 2 @ case 1
	.2byte _02247AF4 - _02247AEC - 2 @ case 2
	.2byte _02247AF4 - _02247AEC - 2 @ case 3
_02247AF4:
	pop {r3, pc}
_02247AF6:
	lsls r1, r0, #2
	ldr r0, _02247B00 @ =0x02248544
	ldr r0, [r0, r1]
	pop {r3, pc}
	nop
_02247B00: .4byte 0x02248544
	thumb_func_end ov83_02247AD4

	thumb_func_start ov83_02247B04
ov83_02247B04: @ 0x02247B04
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02019F74
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	adds r3, r2, #0
	bl FUN_02019F88
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov83_02247B04

	thumb_func_start ov83_02247B1C
ov83_02247B1C: @ 0x02247B1C
	ldr r3, _02247B2C @ =0x02248544
	lsls r1, r1, #2
	lsls r2, r2, #2
	ldr r1, [r3, r1]
	ldr r2, [r3, r2]
	ldr r3, _02247B30 @ =ov83_02242AB4
	bx r3
	nop
_02247B2C: .4byte 0x02248544
_02247B30: .4byte ov83_02242AB4
	thumb_func_end ov83_02247B1C

	thumb_func_start ov83_02247B34
ov83_02247B34: @ 0x02247B34
	ldr r3, _02247B44 @ =0x02248544
	lsls r1, r1, #2
	lsls r2, r2, #2
	ldr r1, [r3, r1]
	ldr r2, [r3, r2]
	ldr r3, _02247B48 @ =ov83_02242AB4
	bx r3
	nop
_02247B44: .4byte 0x02248544
_02247B48: .4byte ov83_02242AB4
	thumb_func_end ov83_02247B34

	thumb_func_start ov83_02247B4C
ov83_02247B4C: @ 0x02247B4C
	ldr r3, _02247B5C @ =0x02248544
	lsls r1, r1, #2
	lsls r2, r2, #2
	ldr r1, [r3, r1]
	ldr r2, [r3, r2]
	ldr r3, _02247B60 @ =ov83_022469D8
	bx r3
	nop
_02247B5C: .4byte 0x02248544
_02247B60: .4byte ov83_022469D8
	thumb_func_end ov83_02247B4C

	thumb_func_start ov83_02247B64
ov83_02247B64: @ 0x02247B64
	ldr r3, _02247B74 @ =0x02248544
	lsls r1, r1, #2
	lsls r2, r2, #2
	ldr r1, [r3, r1]
	ldr r2, [r3, r2]
	ldr r3, _02247B78 @ =ov83_022469D8
	bx r3
	nop
_02247B74: .4byte 0x02248544
_02247B78: .4byte ov83_022469D8
	thumb_func_end ov83_02247B64

	thumb_func_start ov83_02247B7C
ov83_02247B7C: @ 0x02247B7C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x6b
	str r0, [sp, #8]
	ldr r0, _02247BB8 @ =0x022485C8
	ldr r1, _02247BBC @ =0x02248610
	ldr r2, _02247BC0 @ =0x02248520
	adds r3, r4, #0
	bl FUN_02019BA4
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #0x34
	movs r3, #3
	bl ov83_02242AC0
	adds r0, r4, #0
	movs r1, #0
	bl ov83_02242AE0
	adds r0, r5, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02247BB8: .4byte 0x022485C8
_02247BBC: .4byte 0x02248610
_02247BC0: .4byte 0x02248520
	thumb_func_end ov83_02247B7C

	thumb_func_start ov83_02247BC4
ov83_02247BC4: @ 0x02247BC4
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02019BE4
	adds r1, r0, #4
	cmp r1, #3
	bhi _02247C28
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02247BDE: @ jump table
	.2byte _02247BE6 - _02247BDE - 2 @ case 0
	.2byte _02247BE6 - _02247BDE - 2 @ case 1
	.2byte _02247BE6 - _02247BDE - 2 @ case 2
	.2byte _02247BE8 - _02247BDE - 2 @ case 3
_02247BE6:
	pop {r4, pc}
_02247BE8:
	ldr r0, _02247C4C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0x20
	tst r0, r1
	beq _02247C08
	adds r0, r4, #0
	bl FUN_02019F74
	cmp r0, #0
	beq _02247C04
	cmp r0, #2
	beq _02247C04
	cmp r0, #4
	bne _02247C08
_02247C04:
	movs r0, #6
	pop {r4, pc}
_02247C08:
	ldr r0, _02247C4C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0x10
	tst r0, r1
	beq _02247C30
	adds r0, r4, #0
	bl FUN_02019F74
	cmp r0, #1
	beq _02247C24
	cmp r0, #3
	beq _02247C24
	cmp r0, #5
	bne _02247C30
_02247C24:
	movs r0, #7
	pop {r4, pc}
_02247C28:
	lsls r1, r0, #2
	ldr r0, _02247C50 @ =0x0224858C
	ldr r0, [r0, r1]
	pop {r4, pc}
_02247C30:
	ldr r0, _02247C54 @ =0x022484F4
	bl FUN_02025224
	cmp r0, #0
	bne _02247C3E
	movs r0, #6
	pop {r4, pc}
_02247C3E:
	cmp r0, #1
	bne _02247C46
	movs r0, #7
	pop {r4, pc}
_02247C46:
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	.align 2, 0
_02247C4C: .4byte 0x021D110C
_02247C50: .4byte 0x0224858C
_02247C54: .4byte 0x022484F4
	thumb_func_end ov83_02247BC4

	thumb_func_start ov83_02247C58
ov83_02247C58: @ 0x02247C58
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r1, _02247C7C @ =0x02248610
	lsls r3, r4, #3
	ldr r2, _02247C80 @ =0x02248611
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r3, _02247C84 @ =0x02248570
	lsls r6, r4, #2
	ldr r3, [r3, r6]
	adds r5, r0, #0
	bl ov83_02242AC0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov83_02242AE0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02247C7C: .4byte 0x02248610
_02247C80: .4byte 0x02248611
_02247C84: .4byte 0x02248570
	thumb_func_end ov83_02247C58

	thumb_func_start ov83_02247C88
ov83_02247C88: @ 0x02247C88
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r1, _02247CAC @ =0x02248610
	lsls r3, r4, #3
	ldr r2, _02247CB0 @ =0x02248611
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r3, _02247CB4 @ =0x02248570
	lsls r6, r4, #2
	ldr r3, [r3, r6]
	adds r5, r0, #0
	bl ov83_02242AC0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov83_02242AE0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02247CAC: .4byte 0x02248610
_02247CB0: .4byte 0x02248611
_02247CB4: .4byte 0x02248570
	thumb_func_end ov83_02247C88

	thumb_func_start ov83_02247CB8
ov83_02247CB8: @ 0x02247CB8
	ldr r3, _02247CC0 @ =FUN_02018424
	movs r0, #0x6b
	bx r3
	nop
_02247CC0: .4byte FUN_02018424
	thumb_func_end ov83_02247CB8

	thumb_func_start ov83_02247CC4
ov83_02247CC4: @ 0x02247CC4
	ldr r3, _02247CC8 @ =FUN_02018474
	bx r3
	.align 2, 0
_02247CC8: .4byte FUN_02018474
	thumb_func_end ov83_02247CC4

	thumb_func_start ov83_02247CCC
ov83_02247CCC: @ 0x02247CCC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r2, #0
	str r3, [sp]
	add r2, sp, #8
	ldrb r2, [r2, #0x10]
	adds r3, r4, #0
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	bl FUN_020185FC
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov83_02247CCC

	thumb_func_start ov83_02247CE8
ov83_02247CE8: @ 0x02247CE8
	ldr r3, _02247CEC @ =FUN_02018680
	bx r3
	.align 2, 0
_02247CEC: .4byte FUN_02018680
	thumb_func_end ov83_02247CE8

	thumb_func_start ov83_02247CF0
ov83_02247CF0: @ 0x02247CF0
	push {r3, lr}
	ldr r0, _02247D08 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _02247D00
	movs r0, #1
	pop {r3, pc}
_02247D00:
	bl FUN_02025358
	pop {r3, pc}
	nop
_02247D08: .4byte 0x021D110C
	thumb_func_end ov83_02247CF0

	.rodata

_02247D0C:
	.byte 0x22, 0x00, 0x23, 0x00
	.byte 0x24, 0x00, 0x08, 0x00, 0x08, 0x00, 0x20, 0x00, 0x0A, 0x00, 0x08, 0x00, 0x0C, 0x00, 0x0E, 0x00
	.byte 0x0F, 0x00, 0x12, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x1B, 0x00, 0x03, 0x00, 0x00, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x96, 0x00, 0x00, 0x00, 0x32, 0x00, 0x32, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x2B, 0x00
	.byte 0x00, 0x00, 0x44, 0x00, 0x45, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0xFE, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x02, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x10, 0x05, 0x10, 0x04, 0x10, 0x05, 0x00, 0x09, 0x10, 0x05
	.byte 0x10, 0x09, 0x10, 0x05, 0x00, 0x0E, 0x10, 0x05, 0x10, 0x0E, 0x10, 0x05, 0x00, 0x14, 0x04, 0x04
	.byte 0x06, 0x14, 0x04, 0x04, 0x19, 0x14, 0x07, 0x04, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF
	.byte 0xDD, 0x00, 0xD9, 0x00, 0x0F, 0x01, 0xFD, 0x00, 0x15, 0x01, 0x0D, 0x01, 0x1E, 0x01, 0x28, 0x01
	.byte 0x10, 0x01, 0x11, 0x01, 0xEC, 0x00, 0x02, 0x01, 0xD6, 0x00, 0xE6, 0x00, 0x13, 0x01, 0xEA, 0x00
	.byte 0xD5, 0x00, 0xE8, 0x00, 0x09, 0x01, 0x14, 0x01, 0xDC, 0x00, 0x29, 0x01, 0x1F, 0x01, 0x0A, 0x01
	.byte 0x0B, 0x01, 0x0C, 0x01, 0x0E, 0x01, 0x0A, 0x00, 0x0F, 0x00, 0x05, 0x00, 0x0F, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x05, 0x00
	.byte 0x0F, 0x00, 0x0A, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00
	.byte 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x17, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF, 0x95, 0x00, 0x96, 0x00, 0x97, 0x00, 0x98, 0x00
	.byte 0x99, 0x00, 0x9C, 0x00, 0x9D, 0x00, 0x9E, 0x00, 0xC9, 0x00, 0xCA, 0x00, 0xCB, 0x00, 0xCC, 0x00
	.byte 0xCD, 0x00, 0xCE, 0x00, 0xCF, 0x00, 0xB8, 0x00, 0xB9, 0x00, 0xBA, 0x00, 0xBB, 0x00, 0xBC, 0x00
	.byte 0xBD, 0x00, 0xBE, 0x00, 0xBF, 0x00, 0xC0, 0x00, 0xC1, 0x00, 0xC2, 0x00, 0xC3, 0x00, 0xC4, 0x00
	.byte 0xC5, 0x00, 0xC6, 0x00, 0xC7, 0x00, 0xC8, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00
	.byte 0x02, 0x00, 0x02, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x12, 0x0E, 0x0B, 0x08, 0x05, 0x02, 0x00, 0x00
	.byte 0x12, 0x0E, 0x0B, 0x08, 0x05, 0x02, 0x00, 0x00, 0x03, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x25, 0x00, 0x25, 0x00, 0x26, 0x00, 0x26, 0x00, 0x27, 0x00, 0x28, 0x00
	.byte 0x29, 0x00, 0x29, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x5F, 0x00, 0x5F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x05, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x02
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF
	.byte 0x21, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x0E, 0x0E, 0x0E, 0x0E, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xC4, 0x82, 0x24, 0x02
	.byte 0x46, 0x00, 0x00, 0x00, 0xAC, 0x81, 0x24, 0x02, 0x23, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x1E
	.byte 0x02, 0x0E, 0x01, 0x00, 0x01, 0x1A, 0x13, 0x04, 0x03, 0x0E, 0x3D, 0x00, 0x01, 0x00, 0x04, 0x20
	.byte 0x02, 0x0E, 0x49, 0x00, 0x01, 0x00, 0x09, 0x20, 0x02, 0x0E, 0x89, 0x00, 0x00, 0x04, 0x0A, 0x1A
	.byte 0x0E, 0x0E, 0x01, 0x00, 0x00, 0x17, 0x0F, 0x08, 0x08, 0x0E, 0x01, 0x00, 0x00, 0x16, 0x09, 0x09
	.byte 0x08, 0x0E, 0x6D, 0x01, 0x00, 0x02, 0x13, 0x1B, 0x04, 0x0D, 0xB5, 0x01, 0x00, 0x02, 0x13, 0x14
	.byte 0x04, 0x0D, 0x21, 0x02, 0x00, 0x02, 0x13, 0x11, 0x04, 0x0D, 0x71, 0x02, 0x00, 0x18, 0x0D, 0x07
	.byte 0x04, 0x0E, 0xB5, 0x02, 0x00, 0x18, 0x0B, 0x07, 0x06, 0x0E, 0xD1, 0x02, 0x05, 0x0D, 0x01, 0x08
	.byte 0x02, 0x0F, 0xF0, 0x03, 0x05, 0x15, 0x01, 0x01, 0x02, 0x0F, 0xEE, 0x03, 0x05, 0x17, 0x01, 0x03
	.byte 0x02, 0x0F, 0xE8, 0x03, 0x05, 0x1A, 0x01, 0x03, 0x02, 0x0F, 0xE2, 0x03, 0x05, 0x0D, 0x04, 0x07
	.byte 0x02, 0x0F, 0xD4, 0x03, 0x05, 0x14, 0x04, 0x0B, 0x02, 0x0F, 0xBE, 0x03, 0x05, 0x0D, 0x07, 0x06
	.byte 0x02, 0x0F, 0xB2, 0x03, 0x05, 0x14, 0x07, 0x08, 0x02, 0x0F, 0xA2, 0x03, 0x05, 0x0D, 0x0A, 0x06
	.byte 0x02, 0x0F, 0x96, 0x03, 0x05, 0x13, 0x0A, 0x0C, 0x02, 0x0F, 0x7E, 0x03, 0x05, 0x01, 0x0B, 0x02
	.byte 0x02, 0x0F, 0x7A, 0x03, 0x05, 0x04, 0x0B, 0x07, 0x02, 0x0F, 0x6C, 0x03, 0x05, 0x01, 0x0D, 0x06
	.byte 0x02, 0x0F, 0x58, 0x03, 0x05, 0x08, 0x0D, 0x03, 0x02, 0x0F, 0x52, 0x03, 0x05, 0x01, 0x11, 0x07
	.byte 0x02, 0x0F, 0x44, 0x03, 0x05, 0x08, 0x11, 0x03, 0x02, 0x0F, 0x3E, 0x03, 0x05, 0x01, 0x0F, 0x06
	.byte 0x02, 0x0F, 0x32, 0x03, 0x05, 0x08, 0x0F, 0x03, 0x02, 0x0F, 0x2C, 0x03, 0x05, 0x01, 0x13, 0x07
	.byte 0x02, 0x0F, 0x1E, 0x03, 0x05, 0x08, 0x13, 0x03, 0x02, 0x0F, 0x18, 0x03, 0x05, 0x01, 0x15, 0x06
	.byte 0x02, 0x0F, 0x0C, 0x03, 0x05, 0x08, 0x15, 0x03, 0x02, 0x0F, 0x06, 0x03, 0x05, 0x0D, 0x0E, 0x12
	.byte 0x08, 0x0F, 0x76, 0x02, 0x01, 0x01, 0x01, 0x1E, 0x02, 0x0E, 0x01, 0x00, 0x01, 0x1A, 0x13, 0x04
	.byte 0x03, 0x0E, 0x3D, 0x00, 0x01, 0x00, 0x04, 0x20, 0x02, 0x0E, 0x49, 0x00, 0x01, 0x00, 0x09, 0x20
	.byte 0x02, 0x0E, 0x89, 0x00, 0x00, 0x05, 0x0A, 0x18, 0x0E, 0x0E, 0x01, 0x00, 0x00, 0x0C, 0x02, 0x13
	.byte 0x0C, 0x0E, 0x01, 0x00, 0x00, 0x02, 0x13, 0x1B, 0x04, 0x0D, 0xEF, 0x01, 0x00, 0x02, 0x13, 0x14
	.byte 0x04, 0x0D, 0x5B, 0x02, 0x00, 0x02, 0x13, 0x11, 0x04, 0x0D, 0xAB, 0x02, 0x00, 0x17, 0x11, 0x08
	.byte 0x06, 0x0E, 0xEF, 0x02, 0x00, 0x14, 0x07, 0x0B, 0x0A, 0x0E, 0x1F, 0x03, 0x00, 0x16, 0x09, 0x09
	.byte 0x08, 0x0E, 0x1F, 0x03, 0x00, 0x07, 0x11, 0x17, 0x06, 0x0D, 0x5B, 0x02, 0x00, 0x18, 0x0D, 0x07
	.byte 0x04, 0x0E, 0xE5, 0x02, 0x00, 0x18, 0x0B, 0x07, 0x06, 0x0E, 0x01, 0x03, 0x00, 0x01, 0x01, 0x08
	.byte 0x04, 0x0E, 0x2B, 0x03, 0x00, 0x01, 0x07, 0x0A, 0x02, 0x0E, 0x4B, 0x03, 0x00, 0x01, 0x0D, 0x0B
	.byte 0x02, 0x0E, 0x5F, 0x03, 0x05, 0x0D, 0x01, 0x08, 0x02, 0x0F, 0xF0, 0x03, 0x05, 0x15, 0x01, 0x01
	.byte 0x02, 0x0F, 0xEE, 0x03, 0x05, 0x17, 0x01, 0x03, 0x02, 0x0F, 0xE8, 0x03, 0x05, 0x1A, 0x01, 0x03
	.byte 0x02, 0x0F, 0xE2, 0x03, 0x05, 0x0D, 0x04, 0x07, 0x02, 0x0F, 0xD4, 0x03, 0x05, 0x14, 0x04, 0x0B
	.byte 0x02, 0x0F, 0xBE, 0x03, 0x05, 0x0D, 0x07, 0x06, 0x02, 0x0F, 0xB2, 0x03, 0x05, 0x14, 0x07, 0x08
	.byte 0x02, 0x0F, 0xA2, 0x03, 0x05, 0x0D, 0x0A, 0x06, 0x02, 0x0F, 0x96, 0x03, 0x05, 0x13, 0x0A, 0x0C
	.byte 0x02, 0x0F, 0x7E, 0x03, 0x05, 0x01, 0x0B, 0x02, 0x02, 0x0F, 0x7A, 0x03, 0x05, 0x04, 0x0B, 0x07
	.byte 0x02, 0x0F, 0x6C, 0x03, 0x05, 0x01, 0x0D, 0x06, 0x02, 0x0F, 0x58, 0x03, 0x05, 0x08, 0x0D, 0x03
	.byte 0x02, 0x0F, 0x52, 0x03, 0x05, 0x01, 0x11, 0x07, 0x02, 0x0F, 0x44, 0x03, 0x05, 0x08, 0x11, 0x03
	.byte 0x02, 0x0F, 0x3E, 0x03, 0x05, 0x01, 0x0F, 0x06, 0x02, 0x0F, 0x32, 0x03, 0x05, 0x08, 0x0F, 0x03
	.byte 0x02, 0x0F, 0x2C, 0x03, 0x05, 0x01, 0x13, 0x07, 0x02, 0x0F, 0x1E, 0x03, 0x05, 0x08, 0x13, 0x03
	.byte 0x02, 0x0F, 0x18, 0x03, 0x05, 0x01, 0x15, 0x07, 0x02, 0x0F, 0x0A, 0x03, 0x05, 0x08, 0x15, 0x03
	.byte 0x02, 0x0F, 0x04, 0x03, 0x05, 0x0D, 0x0E, 0x0B, 0x02, 0x0F, 0xEE, 0x02, 0x05, 0x0D, 0x10, 0x0B
	.byte 0x02, 0x0F, 0xD8, 0x02, 0x05, 0x0D, 0x12, 0x0B, 0x02, 0x0F, 0xC2, 0x02, 0x05, 0x0D, 0x14, 0x0B
	.byte 0x02, 0x0F, 0xAC, 0x02, 0x05, 0x1A, 0x0E, 0x05, 0x02, 0x0F, 0xA2, 0x02, 0x05, 0x1A, 0x10, 0x05
	.byte 0x02, 0x0F, 0x98, 0x02, 0x05, 0x1A, 0x12, 0x05, 0x02, 0x0F, 0x8E, 0x02, 0x05, 0x1A, 0x14, 0x05
	.byte 0x02, 0x0F, 0x84, 0x02, 0x00, 0x03, 0x04, 0x0D, 0x05, 0x0E, 0x01, 0x00, 0x00, 0x13, 0x04, 0x0D
	.byte 0x05, 0x0E, 0x42, 0x00, 0x00, 0x03, 0x09, 0x0D, 0x05, 0x0E, 0x83, 0x00, 0x00, 0x13, 0x09, 0x0D
	.byte 0x05, 0x0E, 0xC4, 0x00, 0x00, 0x03, 0x0E, 0x0D, 0x05, 0x0E, 0x05, 0x01, 0x00, 0x13, 0x0E, 0x0D
	.byte 0x05, 0x0E, 0x46, 0x01, 0x00, 0x0A, 0x08, 0x0C, 0x02, 0x0E, 0x87, 0x01, 0x00, 0x16, 0x08, 0x05
	.byte 0x02, 0x0E, 0x9F, 0x01, 0x00, 0x0E, 0x15, 0x04, 0x02, 0x0E, 0xA9, 0x01, 0x00, 0x1A, 0x15, 0x05
	.byte 0x02, 0x0E, 0xB1, 0x01, 0x00, 0x02, 0x01, 0x0C, 0x02, 0x0E, 0xBB, 0x01, 0x00, 0x10, 0x01, 0x08
	.byte 0x02, 0x0E, 0xD3, 0x01, 0x00, 0x18, 0x01, 0x06, 0x02, 0x0E, 0xE3, 0x01, 0x07, 0x04, 0x11, 0x1B
	.byte 0x06, 0x0F, 0x5E, 0x03, 0x07, 0x0D, 0x05, 0x08, 0x02, 0x0F, 0x4E, 0x03, 0x07, 0x15, 0x05, 0x01
	.byte 0x02, 0x0F, 0x4C, 0x03, 0x07, 0x17, 0x05, 0x03, 0x02, 0x0F, 0x46, 0x03, 0x07, 0x1A, 0x05, 0x03
	.byte 0x02, 0x0F, 0x40, 0x03, 0x07, 0x0D, 0x08, 0x02, 0x02, 0x0F, 0x3C, 0x03, 0x07, 0x10, 0x08, 0x08
	.byte 0x02, 0x0F, 0x2C, 0x03, 0x07, 0x0D, 0x0B, 0x06, 0x02, 0x0F, 0x20, 0x03, 0x07, 0x13, 0x0B, 0x0C
	.byte 0x02, 0x0F, 0x08, 0x03, 0xA0, 0xBF, 0x00, 0x27, 0xA0, 0xBF, 0x28, 0x4F, 0xFF, 0x00, 0x00, 0x00
	.byte 0x21, 0x7A, 0x24, 0x02, 0x21, 0x7A, 0x24, 0x02, 0x1D, 0x7B, 0x24, 0x02, 0x35, 0x7B, 0x24, 0x02
	.byte 0x21, 0x7A, 0x24, 0x02, 0x21, 0x7A, 0x24, 0x02, 0x4D, 0x7B, 0x24, 0x02, 0x65, 0x7B, 0x24, 0x02
	.byte 0x21, 0x7A, 0x24, 0x02, 0x21, 0x7A, 0x24, 0x02, 0x59, 0x7C, 0x24, 0x02, 0x89, 0x7C, 0x24, 0x02
	.byte 0x98, 0xAF, 0xC8, 0xF7, 0x20, 0x4F, 0x20, 0x5F, 0x20, 0x4F, 0x60, 0x9F, 0x20, 0x4F, 0xA0, 0xDF
	.byte 0xFF, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x98, 0xAF, 0xC8, 0xF7, 0x20, 0x4F, 0x00, 0x3F
	.byte 0x20, 0x4F, 0x40, 0x7F, 0x20, 0x4F, 0x80, 0xBF, 0x20, 0x4F, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x03
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x01, 0x20, 0x47, 0x00, 0x7F, 0x20, 0x47, 0x80, 0xFF
	.byte 0x48, 0x6F, 0x00, 0x7F, 0x48, 0x6F, 0x80, 0xFF, 0x70, 0x97, 0x00, 0x7F, 0x70, 0x97, 0x80, 0xFF
	.byte 0xA0, 0xBF, 0xC8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x02, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x03
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x03, 0x01
	.byte 0x40, 0x34, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0xC0, 0x34, 0x00, 0x00, 0x01, 0x03, 0x00, 0x01
	.byte 0x40, 0x5C, 0x00, 0x00, 0x00, 0x04, 0x02, 0x03, 0xC0, 0x5C, 0x00, 0x00, 0x01, 0x05, 0x02, 0x03
	.byte 0x40, 0x84, 0x00, 0x00, 0x02, 0x06, 0x04, 0x05, 0xC0, 0x84, 0x00, 0x00, 0x03, 0x06, 0x04, 0x05
	.byte 0xE4, 0xB0, 0x00, 0x00, 0x85, 0x06, 0x06, 0x06
	@ 0x02248648
