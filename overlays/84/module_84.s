
	thumb_func_start ov84_0223DD60
ov84_0223DD60: @ 0x0223DD60
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _0223DEAC @ =0x00000050
	movs r1, #2
	bl FUN_02006FF8
	bl ov84_0223E5C4
	movs r2, #2
	movs r0, #3
	movs r1, #0x6e
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r1, #0xf3
	adds r0, r4, #0
	lsls r1, r1, #2
	movs r2, #0x6e
	bl FUN_02007280
	movs r2, #0xf3
	movs r1, #0
	lsls r2, r2, #2
	adds r5, r0, #0
	blx FUN_020E5B44
	movs r0, #0x6e
	bl FUN_0201AC88
	adds r1, r5, #0
	adds r1, #0x90
	str r0, [r1]
	adds r0, r4, #0
	str r4, [r5]
	bl FUN_020072A4
	adds r4, r0, #0
	adds r0, r5, #0
	ldr r1, [r4]
	adds r0, #0xdc
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	bl FUN_02030E88
	adds r1, r5, #0
	adds r1, #0xe0
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	bl FUN_02030FA0
	adds r1, r5, #0
	adds r1, #0xe4
	str r0, [r1]
	ldrb r0, [r4, #4]
	strb r0, [r5, #9]
	ldrh r0, [r4, #0x1e]
	strh r0, [r5, #0x2a]
	ldrh r0, [r4, #0x1c]
	strh r0, [r5, #0x28]
	ldrh r1, [r4, #0x18]
	ldr r0, _0223DEB0 @ =0x000003C2
	strh r1, [r5, r0]
	ldrb r1, [r4, #7]
	subs r0, #0x62
	strb r1, [r5, #0x12]
	adds r1, r4, #0
	adds r1, #0x38
	str r1, [r5, r0]
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	bl FUN_02028EA8
	adds r1, r5, #0
	adds r1, #0xd8
	str r0, [r1]
	movs r0, #0xd9
	ldr r1, [r4, #0x30]
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r1, [r4, #0x34]
	adds r0, r0, #4
	str r1, [r5, r0]
	movs r0, #0xff
	strb r0, [r5, #0xe]
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	bl FUN_0203107C
	str r0, [r5, #4]
	movs r0, #0xd7
	ldr r1, [r4, #8]
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r1, [r4, #0xc]
	adds r0, #0x28
	str r1, [r5, #0x1c]
	ldr r1, [r4, #0x10]
	str r1, [r5, #0x20]
	ldr r1, [r4, #0x14]
	adds r4, #0x42
	str r1, [r5, #0x24]
	str r0, [r5, #0x18]
	ldrb r0, [r4]
	strb r0, [r5, #0xc]
	movs r2, #0
	movs r1, #0x20
_0223DE42:
	adds r0, r5, r2
	adds r0, #0x44
	adds r2, r2, #1
	strb r1, [r0]
	cmp r2, #0x20
	blt _0223DE42
	adds r0, r5, #0
	movs r1, #4
	adds r0, #0x2c
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #0x10
	adds r0, #0x2e
	strb r1, [r0]
	movs r0, #0xf
	movs r1, #0
	lsls r0, r0, #6
	strb r1, [r5, r0]
	adds r0, r5, #0
	bl ov84_0223EDA0
	ldr r1, [r5, #0x24]
	strh r0, [r1]
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1c
	subs r1, r1, r2
	movs r0, #0x1c
	rors r1, r0
	adds r0, r2, r1
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl ov84_0223E5FC
	ldrb r0, [r5, #9]
	bl FUN_02238374
	cmp r0, #1
	bne _0223DE9E
	adds r0, r5, #0
	bl FUN_02096910
_0223DE9E:
	movs r1, #0
	ldr r0, _0223DEB4 @ =0x0223FA20
	str r1, [r6]
	strb r1, [r0]
	strb r1, [r0, #1]
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223DEAC: .4byte 0x00000050
_0223DEB0: .4byte 0x000003C2
_0223DEB4: .4byte 0x0223FA20
	thumb_func_end ov84_0223DD60

	thumb_func_start ov84_0223DEB8
ov84_0223DEB8: @ 0x0223DEB8
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldrb r1, [r4, #0xe]
	cmp r1, #0xff
	beq _0223DEEA
	ldr r1, [r5]
	cmp r1, #1
	bne _0223DEEA
	bl ov84_0223F28C
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	ldrb r1, [r4, #0xe]
	bl ov84_0223EC88
	strb r0, [r4, #0x14]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ov84_0223EBE0
_0223DEEA:
	ldr r0, [r5]
	cmp r0, #4
	bhi _0223DF9C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223DEFC: @ jump table
	.2byte _0223DF06 - _0223DEFC - 2 @ case 0
	.2byte _0223DF1C - _0223DEFC - 2 @ case 1
	.2byte _0223DF62 - _0223DEFC - 2 @ case 2
	.2byte _0223DF78 - _0223DEFC - 2 @ case 3
	.2byte _0223DF8E - _0223DEFC - 2 @ case 4
_0223DF06:
	adds r0, r4, #0
	bl ov84_0223E030
	cmp r0, #1
	bne _0223DF9C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov84_0223EBE0
	b _0223DF9C
_0223DF1C:
	adds r0, r4, #0
	bl ov84_0223E1A8
	cmp r0, #1
	bne _0223DF9C
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	cmp r0, #1
	bne _0223DF40
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ov84_0223EBE0
	b _0223DF9C
_0223DF40:
	ldrb r0, [r4, #9]
	bl FUN_02238374
	cmp r0, #1
	bne _0223DF56
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl ov84_0223EBE0
	b _0223DF9C
_0223DF56:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl ov84_0223EBE0
	b _0223DF9C
_0223DF62:
	adds r0, r4, #0
	bl ov84_0223E384
	cmp r0, #1
	bne _0223DF9C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl ov84_0223EBE0
	b _0223DF9C
_0223DF78:
	adds r0, r4, #0
	bl ov84_0223E418
	cmp r0, #1
	bne _0223DF9C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl ov84_0223EBE0
	b _0223DF9C
_0223DF8E:
	adds r0, r4, #0
	bl ov84_0223E470
	cmp r0, #1
	bne _0223DF9C
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223DF9C:
	ldrb r3, [r4, #0x13]
	adds r1, r4, #0
	movs r2, #0xfe
	adds r0, r3, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x19
	adds r3, r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r3, r3, #0x19
	bics r0, r2
	lsrs r3, r3, #0x18
	orrs r0, r3
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0x13]
	adds r1, #0x13
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	cmp r0, #4
	blo _0223DFE4
	ldrb r0, [r1]
	bics r0, r2
	strb r0, [r1]
	ldrb r3, [r1]
	movs r2, #1
	adds r0, r3, #0
	bics r0, r2
	lsls r2, r3, #0x1f
	lsrs r2, r2, #0x1f
	movs r3, #1
	eors r2, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ands r2, r3
	orrs r0, r2
	strb r0, [r1]
_0223DFE4:
	adds r4, #0xe8
	ldr r0, [r4]
	bl FUN_0202457C
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov84_0223DEB8

	thumb_func_start ov84_0223DFF0
ov84_0223DFF0: @ 0x0223DFF0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #0x36
	lsls r0, r0, #4
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, r0]
	strh r1, [r0]
	bl FUN_020205AC
	adds r0, r4, #0
	bl ov84_0223E4B8
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x6e
	bl FUN_0201A9C4
	ldr r0, _0223E02C @ =0x00000050
	bl FUN_02006F7C
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223E02C: .4byte 0x00000050
	thumb_func_end ov84_0223DFF0

	thumb_func_start ov84_0223E030
ov84_0223E030: @ 0x0223E030
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #9
	bhi _0223E094
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223E048: @ jump table
	.2byte _0223E05C - _0223E048 - 2 @ case 0
	.2byte _0223E080 - _0223E048 - 2 @ case 1
	.2byte _0223E0AA - _0223E048 - 2 @ case 2
	.2byte _0223E0B6 - _0223E048 - 2 @ case 3
	.2byte _0223E0C2 - _0223E048 - 2 @ case 4
	.2byte _0223E0CE - _0223E048 - 2 @ case 5
	.2byte _0223E0F2 - _0223E048 - 2 @ case 6
	.2byte _0223E11A - _0223E048 - 2 @ case 7
	.2byte _0223E15A - _0223E048 - 2 @ case 8
	.2byte _0223E194 - _0223E048 - 2 @ case 9
_0223E05C:
	ldrb r0, [r4, #9]
	bl FUN_02238374
	cmp r0, #1
	bne _0223E078
	bl FUN_02037BEC
	movs r0, #0xc7
	bl FUN_02037AC0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E078:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E080:
	ldrb r0, [r4, #9]
	bl FUN_02238374
	cmp r0, #1
	bne _0223E0A2
	movs r0, #0xc7
	bl FUN_02037B38
	cmp r0, #1
	beq _0223E096
_0223E094:
	b _0223E1A2
_0223E096:
	bl FUN_02037BEC
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0A2:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0AA:
	bl ov84_0223EE74
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0B6:
	bl ov84_0223EFE0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0C2:
	bl ov84_0223F094
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0CE:
	ldrb r0, [r4, #9]
	bl FUN_02238374
	cmp r0, #1
	bne _0223E0EA
	bl FUN_02037BEC
	movs r0, #0xc9
	bl FUN_02037AC0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0EA:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E0F2:
	ldrb r0, [r4, #9]
	bl FUN_02238374
	cmp r0, #1
	bne _0223E112
	movs r0, #0xc9
	bl FUN_02037B38
	cmp r0, #1
	bne _0223E1A2
	bl FUN_02037BEC
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E112:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E11A:
	ldrb r0, [r4, #9]
	bl FUN_02238374
	cmp r0, #1
	bne _0223E13A
	adds r0, r4, #0
	movs r1, #0x1e
	movs r2, #0
	bl ov84_0223ECBC
	cmp r0, #1
	bne _0223E1A2
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E13A:
	movs r0, #6
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E15A:
	ldrb r0, [r4, #9]
	bl FUN_02238374
	cmp r0, #1
	bne _0223E18C
	ldrb r0, [r4, #0xf]
	cmp r0, #2
	blo _0223E1A2
	movs r0, #0
	strb r0, [r4, #0xf]
	movs r1, #6
	str r1, [sp]
	movs r1, #3
	str r1, [sp, #4]
	movs r1, #0x6e
	str r1, [sp, #8]
	movs r1, #1
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E18C:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E1A2
_0223E194:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223E1A2
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_0223E1A2:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov84_0223E030

	thumb_func_start ov84_0223E1A8
ov84_0223E1A8: @ 0x0223E1A8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #8
	bhi _0223E246
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223E1BE: @ jump table
	.2byte _0223E1D0 - _0223E1BE - 2 @ case 0
	.2byte _0223E1E4 - _0223E1BE - 2 @ case 1
	.2byte _0223E1FA - _0223E1BE - 2 @ case 2
	.2byte _0223E23A - _0223E1BE - 2 @ case 3
	.2byte _0223E274 - _0223E1BE - 2 @ case 4
	.2byte _0223E2AC - _0223E1BE - 2 @ case 5
	.2byte _0223E2FC - _0223E1BE - 2 @ case 6
	.2byte _0223E352 - _0223E1BE - 2 @ case 7
	.2byte _0223E362 - _0223E1BE - 2 @ case 8
_0223E1D0:
	movs r1, #0
	strb r1, [r4, #0xb]
	ldrh r1, [r4, #0x16]
	strb r1, [r4, #0xd]
	ldrb r1, [r4, #0xd]
	bl ov84_0223EC4C
	movs r0, #1
	strb r0, [r4, #8]
	b _0223E372
_0223E1E4:
	ldrb r0, [r4, #0xb]
	adds r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0xa
	blo _0223E246
	movs r0, #0
	strb r0, [r4, #0xb]
	movs r0, #2
	strb r0, [r4, #8]
	b _0223E372
_0223E1FA:
	movs r7, #0xb6
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #2
_0223E202:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223E21A
	movs r1, #0x20
	bl ov84_0223F878
	movs r0, #0xb6
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov84_0223F82C
_0223E21A:
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #0x10
	blt _0223E202
	adds r0, r4, #0
	movs r1, #3
	bl ov84_0223EB08
	ldr r0, _0223E378 @ =0x00000608
	bl FUN_0200604C
	movs r0, #0x18
	strb r0, [r4, #0xb]
	movs r0, #3
	strb r0, [r4, #8]
	b _0223E372
_0223E23A:
	ldrb r0, [r4, #0xb]
	subs r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _0223E248
_0223E246:
	b _0223E372
_0223E248:
	movs r7, #0xb6
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #2
_0223E250:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223E25C
	movs r1, #0x21
	bl ov84_0223F878
_0223E25C:
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #0x10
	blt _0223E250
	ldr r0, _0223E378 @ =0x00000608
	bl FUN_0200604C
	movs r0, #0x18
	strb r0, [r4, #0xb]
	movs r0, #4
	strb r0, [r4, #8]
	b _0223E372
_0223E274:
	ldrb r0, [r4, #0xb]
	subs r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0223E372
	movs r7, #0xb6
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #2
_0223E288:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223E294
	movs r1, #0x22
	bl ov84_0223F878
_0223E294:
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #0x10
	blt _0223E288
	ldr r0, _0223E378 @ =0x00000608
	bl FUN_0200604C
	movs r0, #0x18
	strb r0, [r4, #0xb]
	movs r0, #5
	strb r0, [r4, #8]
	b _0223E372
_0223E2AC:
	ldrb r0, [r4, #0xb]
	subs r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0223E372
	movs r7, #0xb6
	movs r5, #0
	adds r6, r4, #0
	lsls r7, r7, #2
_0223E2C0:
	ldr r0, [r6, r7]
	cmp r0, #0
	beq _0223E2D0
	adds r1, r4, r5
	adds r1, #0x34
	ldrb r1, [r1]
	bl ov84_0223F878
_0223E2D0:
	adds r5, r5, #1
	adds r6, r6, #4
	cmp r5, #0x10
	blt _0223E2C0
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov84_0223F82C
	ldr r0, _0223E37C @ =0x00000623
	bl FUN_0200604C
	movs r0, #0xd6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov84_0223F878
	movs r0, #6
	strb r0, [r4, #8]
	b _0223E372
_0223E2FC:
	ldr r1, _0223E380 @ =0x021D110C
	ldr r1, [r1, #0x48]
	bl ov84_0223EBE8
	bl FUN_0203769C
	cmp r0, #0
	bne _0223E316
	ldr r0, [r4, #0x18]
	cmp r0, #0
	ble _0223E316
	subs r0, r0, #1
	str r0, [r4, #0x18]
_0223E316:
	adds r0, r4, #0
	bl ov84_0223F26C
	cmp r0, #1
	beq _0223E326
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _0223E372
_0223E326:
	adds r0, r4, #0
	bl ov84_0223EC80
	ldrb r0, [r4, #9]
	bl FUN_02238374
	cmp r0, #0
	bne _0223E33C
	movs r0, #7
	strb r0, [r4, #8]
	b _0223E372
_0223E33C:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r0, #0xfe
	adds r4, #0x2f
	bics r1, r0
	movs r0, #2
	orrs r0, r1
	strb r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223E352:
	ldrb r1, [r4, #0xd]
	bl ov84_0223EE24
	movs r0, #0x1e
	strb r0, [r4, #0xb]
	movs r0, #8
	strb r0, [r4, #8]
	b _0223E372
_0223E362:
	ldrb r0, [r4, #0xb]
	subs r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0223E372
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223E372:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223E378: .4byte 0x00000608
_0223E37C: .4byte 0x00000623
_0223E380: .4byte 0x021D110C
	thumb_func_end ov84_0223E1A8

	thumb_func_start ov84_0223E384
ov84_0223E384: @ 0x0223E384
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #4
	bhi _0223E414
	adds r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0223E39A: @ jump table
	.2byte _0223E3A4 - _0223E39A - 2 @ case 0
	.2byte _0223E3C8 - _0223E39A - 2 @ case 1
	.2byte _0223E3CE - _0223E39A - 2 @ case 2
	.2byte _0223E3E6 - _0223E39A - 2 @ case 3
	.2byte _0223E3F8 - _0223E39A - 2 @ case 4
_0223E3A4:
	ldrb r2, [r4, #0x14]
	movs r1, #0x1f
	bl ov84_0223ECBC
	cmp r0, #1
	bne _0223E414
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r0, #0xfe
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E414
_0223E3C8:
	adds r0, r1, #1
	strb r0, [r4, #8]
	b _0223E414
_0223E3CE:
	ldrb r1, [r4, #0xe]
	cmp r1, #0xff
	beq _0223E414
	movs r1, #0
	strb r1, [r4, #0xf]
	ldrb r1, [r4, #0xe]
	bl ov84_0223EE24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E414
_0223E3E6:
	bl FUN_02037BEC
	movs r0, #0x97
	bl FUN_02037AC0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E414
_0223E3F8:
	movs r0, #0x97
	bl FUN_02037B38
	cmp r0, #1
	bne _0223E414
	bl FUN_02037BEC
	movs r0, #0x6e
	bl FUN_020379A0
	movs r0, #0xff
	strb r0, [r4, #0xe]
	movs r0, #1
	pop {r4, pc}
_0223E414:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov84_0223E384

	thumb_func_start ov84_0223E418
ov84_0223E418: @ 0x0223E418
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _0223E42C
	cmp r0, #1
	beq _0223E438
	cmp r0, #2
	beq _0223E45A
	b _0223E46C
_0223E42C:
	movs r0, #0xf
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E46C
_0223E438:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _0223E442
	subs r0, r0, #1
	strb r0, [r4, #0xb]
_0223E442:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0223E46C
	bl FUN_02037BEC
	movs r0, #0x98
	bl FUN_02037AC0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E46C
_0223E45A:
	movs r0, #0x98
	bl FUN_02037B38
	cmp r0, #1
	bne _0223E46C
	bl FUN_02037BEC
	movs r0, #1
	pop {r4, pc}
_0223E46C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov84_0223E418

	thumb_func_start ov84_0223E470
ov84_0223E470: @ 0x0223E470
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _0223E482
	cmp r0, #1
	beq _0223E4A2
	b _0223E4B0
_0223E482:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E4B0
_0223E4A2:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223E4B0
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_0223E4B0:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov84_0223E470

	thumb_func_start ov84_0223E4B8
ov84_0223E4B8: @ 0x0223E4B8
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0223E4CA
	bl ov84_0223F818
_0223E4CA:
	movs r0, #0xd6
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0223E4D8
	bl ov84_0223F818
_0223E4D8:
	movs r7, #0xb6
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_0223E4E0:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223E4EA
	bl ov84_0223F818
_0223E4EA:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x10
	blt _0223E4E0
	ldrb r0, [r6, #9]
	movs r1, #1
	bl FUN_022380E8
	adds r7, r0, #0
	movs r5, #0
	cmp r7, #0
	ble _0223E544
	adds r4, r6, #0
_0223E504:
	movs r0, #0xc6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223E512
	bl ov84_0223F818
_0223E512:
	movs r0, #0xca
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223E520
	bl ov84_0223F818
_0223E520:
	movs r0, #0xce
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223E52E
	bl ov84_0223F818
_0223E52E:
	movs r0, #0xd2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223E53C
	bl ov84_0223F818
_0223E53C:
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, r7
	blt _0223E504
_0223E544:
	bl FUN_0203A914
	adds r0, r6, #0
	adds r0, #0xd4
	ldr r0, [r0]
	movs r1, #2
	bl FUN_02003150
	adds r0, r6, #0
	adds r0, #0xd4
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02003150
	adds r0, r6, #0
	adds r0, #0xd4
	ldr r0, [r0]
	bl FUN_02003104
	adds r0, r6, #0
	movs r1, #0
	adds r0, #0xd4
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0xe8
	bl ov84_0223F418
	ldr r0, [r6, #0x68]
	bl FUN_0200BB44
	ldr r0, [r6, #0x6c]
	bl FUN_0200BDA0
	ldr r0, [r6, #0x70]
	bl FUN_02026380
	ldr r0, [r6, #0x74]
	bl FUN_02026380
	movs r5, #0
	adds r4, r6, #0
_0223E596:
	ldr r0, [r4, #0x78]
	bl FUN_02026380
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #2
	blt _0223E596
	adds r0, r6, #0
	adds r0, #0x94
	bl ov84_0223F8E4
	adds r0, r6, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl ov84_0223E958
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200770C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov84_0223E4B8

	thumb_func_start ov84_0223E5C4
ov84_0223E5C4: @ 0x0223E5C4
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
	ldr r0, _0223E5F4 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _0223E5F8 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_0223E5F4: .4byte 0xFFFFE0FF
_0223E5F8: .4byte 0x04001000
	thumb_func_end ov84_0223E5C4

	thumb_func_start ov84_0223E5FC
ov84_0223E5FC: @ 0x0223E5FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #0x18]
	movs r0, #0xb7
	movs r1, #0x6e
	bl FUN_02007688
	movs r2, #0xdb
	ldr r1, [sp, #0x18]
	lsls r2, r2, #2
	str r0, [r1, r2]
	adds r0, r1, #0
	bl ov84_0223E8DC
	ldr r0, [sp, #0x18]
	bl ov84_0223E934
	ldr r2, _0223E8D4 @ =0x000001A9
	movs r0, #1
	movs r1, #0x1b
	movs r3, #0x6e
	bl FUN_0200BAF8
	ldr r1, [sp, #0x18]
	str r0, [r1, #0x68]
	movs r0, #0x6e
	bl FUN_0200BD08
	ldr r1, [sp, #0x18]
	str r0, [r1, #0x6c]
	movs r0, #0x96
	lsls r0, r0, #2
	movs r1, #0x6e
	bl FUN_02026354
	ldr r1, [sp, #0x18]
	str r0, [r1, #0x70]
	movs r0, #0x96
	lsls r0, r0, #2
	movs r1, #0x6e
	bl FUN_02026354
	ldr r1, [sp, #0x18]
	movs r4, #0
	str r0, [r1, #0x74]
	adds r5, r1, #0
	movs r6, #0x20
	movs r7, #0x6e
_0223E65C:
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_02026354
	str r0, [r5, #0x78]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _0223E65C
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x6e
	bl FUN_02003030
	movs r1, #6
	movs r0, #0
	lsls r1, r1, #6
	movs r2, #0x6e
	bl FUN_0200304C
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	adds r0, #0x90
	ldr r0, [r0]
	adds r1, #0x94
	bl ov84_0223F8B4
	movs r0, #0x23
	str r0, [sp]
	movs r0, #0x44
	str r0, [sp, #4]
	movs r0, #0x24
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	str r1, [sp, #0x14]
	movs r1, #1
	adds r0, #0xe8
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov84_0223F7A0
	movs r2, #0xb5
	ldr r1, [sp, #0x18]
	lsls r2, r2, #2
	str r0, [r1, r2]
	adds r0, r1, #0
	ldr r0, [r0, r2]
	movs r1, #0
	bl ov84_0223F82C
	ldr r4, [sp, #0x18]
	movs r5, #0
	adds r6, r4, #0
	movs r7, #0x20
	adds r6, #0xe8
_0223E6D4:
	lsrs r2, r5, #0x1f
	lsls r1, r5, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r1, r2, r1
	movs r0, #0x28
	muls r0, r1, r0
	adds r0, #0x44
	lsls r0, r0, #0x10
	str r7, [sp]
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	asrs r0, r5, #1
	lsrs r0, r0, #0x1e
	adds r0, r5, r0
	asrs r1, r0, #2
	movs r0, #0x28
	muls r0, r1, r0
	movs r1, #1
	adds r0, #0x24
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r6, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov84_0223F7A0
	movs r1, #0xb6
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov84_0223F82C
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #0x10
	blt _0223E6D4
	ldr r0, [sp, #0x18]
	movs r1, #1
	ldrb r0, [r0, #9]
	bl FUN_022380E8
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	ldrb r0, [r0, #9]
	bl FUN_02238374
	cmp r0, #0
	bne _0223E752
	movs r0, #0x32
	movs r7, #0x2e
	str r0, [sp, #0x20]
	b _0223E758
_0223E752:
	movs r0, #0x1a
	movs r7, #0x16
	str r0, [sp, #0x20]
_0223E758:
	ldr r0, [sp, #0x1c]
	movs r5, #0
	cmp r0, #0
	bgt _0223E762
	b _0223E87C
_0223E762:
	ldr r4, [sp, #0x18]
	adds r6, r4, #0
	adds r6, #0xe8
_0223E768:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	movs r1, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r6, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov84_0223F7A0
	movs r1, #0xce
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r1, #2
	movs r0, #0
	str r0, [sp]
	movs r0, #0xf6
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	adds r2, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r6, #0
	adds r3, r1, #0
	bl ov84_0223F7A0
	movs r1, #0xd2
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #0
	movs r2, #3
	str r0, [sp, #0x14]
	adds r0, r6, #0
	adds r1, r5, #3
	adds r3, r2, #0
	bl ov84_0223F7A0
	movs r1, #0xc6
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #0xee
	str r0, [sp, #4]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #0
	movs r2, #3
	str r0, [sp, #0x14]
	adds r0, r6, #0
	adds r1, r5, #7
	adds r3, r2, #0
	bl ov84_0223F7A0
	movs r1, #0xca
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0xd9
	ldr r1, [sp, #0x18]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r5, #0
	bl FUN_02074644
	adds r1, r0, #0
	movs r0, #0xc6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov84_0223F894
	movs r0, #0xda
	ldr r1, [sp, #0x18]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r5, #0
	bl FUN_02074644
	adds r1, r0, #0
	movs r0, #0xca
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov84_0223F894
	movs r0, #0xc6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov84_0223F8A8
	movs r0, #0xca
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov84_0223F8A8
	ldr r0, [sp, #0x20]
	adds r5, r5, #1
	adds r0, #0x28
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	adds r4, r4, #4
	adds r7, #0x28
	cmp r5, r0
	bge _0223E87C
	b _0223E768
_0223E87C:
	ldr r0, [sp, #0x18]
	bl ov84_0223F1BC
	movs r1, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0x80
	str r0, [sp, #4]
	movs r0, #0x60
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	adds r2, r1, #0
	adds r0, #0xe8
	adds r3, r1, #0
	bl ov84_0223F7A0
	movs r2, #0xd6
	ldr r1, [sp, #0x18]
	lsls r2, r2, #2
	str r0, [r1, r2]
	bl FUN_02037474
	cmp r0, #0
	beq _0223E8C6
	movs r0, #1
	movs r1, #0x10
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	bl FUN_0203A880
_0223E8C6:
	ldr r0, _0223E8D8 @ =ov84_0223E98C
	ldr r1, [sp, #0x18]
	bl FUN_0201A0FC
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0223E8D4: .4byte 0x000001A9
_0223E8D8: .4byte ov84_0223E98C
	thumb_func_end ov84_0223E5FC

	thumb_func_start ov84_0223E8DC
ov84_0223E8DC: @ 0x0223E8DC
	push {r4, lr}
	adds r4, r0, #0
	bl ov84_0223E9C4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl ov84_0223E9E4
	movs r0, #0x6e
	bl FUN_020030E8
	adds r1, r4, #0
	adds r1, #0xd4
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xd4
	movs r1, #2
	ldr r0, [r0]
	lsls r2, r1, #8
	movs r3, #0x6e
	bl FUN_02003120
	adds r0, r4, #0
	adds r0, #0xd4
	movs r2, #2
	ldr r0, [r0]
	movs r1, #0
	lsls r2, r2, #8
	movs r3, #0x6e
	bl FUN_02003120
	adds r0, r4, #0
	movs r1, #3
	bl ov84_0223EAAC
	bl ov84_0223EB44
	adds r0, r4, #0
	movs r1, #4
	bl ov84_0223EB78
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov84_0223E8DC

	thumb_func_start ov84_0223E934
ov84_0223E934: @ 0x0223E934
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	bl FUN_02238374
	adds r3, r0, #0
	movs r2, #0xd9
	lsls r2, r2, #2
	ldr r1, [r4, r2]
	adds r2, r2, #4
	adds r0, r4, #0
	lsls r3, r3, #0x18
	ldr r2, [r4, r2]
	adds r0, #0xe8
	lsrs r3, r3, #0x18
	bl ov84_0223F2B4
	pop {r4, pc}
	thumb_func_end ov84_0223E934

	thumb_func_start ov84_0223E958
ov84_0223E958: @ 0x0223E958
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
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov84_0223E958

	thumb_func_start ov84_0223E98C
ov84_0223E98C: @ 0x0223E98C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _0223E99C
	bl FUN_0200398C
_0223E99C:
	adds r4, #0x90
	ldr r0, [r4]
	bl FUN_0201EEB4
	bl FUN_0202061C
	bl FUN_0200B224
	ldr r3, _0223E9BC @ =0x027E0000
	ldr r1, _0223E9C0 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_0223E9BC: .4byte 0x027E0000
_0223E9C0: .4byte 0x00003FF8
	thumb_func_end ov84_0223E98C

	thumb_func_start ov84_0223E9C4
ov84_0223E9C4: @ 0x0223E9C4
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0223E9E0 @ =0x0223F9BC
	add r3, sp, #0
	movs r2, #5
_0223E9CE:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0223E9CE
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_0223E9E0: .4byte 0x0223F9BC
	thumb_func_end ov84_0223E9C4

	thumb_func_start ov84_0223E9E4
ov84_0223E9E4: @ 0x0223E9E4
	push {r4, r5, lr}
	sub sp, #0x64
	ldr r5, _0223EA98 @ =0x0223F924
	add r3, sp, #0x54
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _0223EA9C @ =0x0223F964
	add r3, sp, #0x38
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
	movs r3, #0x6e
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _0223EAA0 @ =0x0223F980
	add r3, sp, #0x1c
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
	ldr r5, _0223EAA4 @ =0x0223F948
	add r3, sp, #0
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
	ldr r1, _0223EAA8 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	strh r2, [r1]
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	add sp, #0x64
	pop {r4, r5, pc}
	.align 2, 0
_0223EA98: .4byte 0x0223F924
_0223EA9C: .4byte 0x0223F964
_0223EAA0: .4byte 0x0223F980
_0223EAA4: .4byte 0x0223F948
_0223EAA8: .4byte 0x04000008
	thumb_func_end ov84_0223E9E4

	thumb_func_start ov84_0223EAAC
ov84_0223EAAC: @ 0x0223EAAC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x6e
	str r0, [sp, #0xc]
	movs r0, #0xdb
	adds r2, r5, #0
	lsls r0, r0, #2
	adds r2, #0x90
	ldr r0, [r5, r0]
	ldr r2, [r2]
	movs r1, #0x7c
	adds r3, r4, #0
	bl FUN_02007B44
	ldrb r0, [r5, #9]
	bl FUN_02238374
	cmp r0, #0
	bne _0223EAE4
	movs r1, #0x78
	b _0223EAE6
_0223EAE4:
	movs r1, #0x7a
_0223EAE6:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6e
	str r0, [sp, #0xc]
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r5, #0x90
	ldr r2, [r5]
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov84_0223EAAC

	thumb_func_start ov84_0223EB08
ov84_0223EB08: @ 0x0223EB08
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	adds r4, r1, #0
	bl FUN_02238374
	cmp r0, #0
	bne _0223EB1E
	movs r1, #0x79
	b _0223EB20
_0223EB1E:
	movs r1, #0x7b
_0223EB20:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6e
	str r0, [sp, #0xc]
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r5, #0x90
	ldr r2, [r5]
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov84_0223EB08

	thumb_func_start ov84_0223EB44
ov84_0223EB44: @ 0x0223EB44
	push {r3, r4, lr}
	sub sp, #4
	movs r0, #0xb7
	movs r1, #0xba
	add r2, sp, #0
	movs r3, #0x6e
	bl FUN_020079F4
	adds r4, r0, #0
	ldr r0, [sp]
	movs r1, #0xe0
	ldr r0, [r0, #0xc]
	blx FUN_020D2894
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
	thumb_func_end ov84_0223EB44

	thumb_func_start ov84_0223EB78
ov84_0223EB78: @ 0x0223EB78
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x6e
	str r0, [sp, #0xc]
	movs r0, #0xdb
	adds r2, r5, #0
	lsls r0, r0, #2
	adds r2, #0x90
	ldr r0, [r5, r0]
	ldr r2, [r2]
	movs r1, #0x7e
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0x40
	str r0, [sp]
	movs r0, #0x6e
	str r0, [sp, #4]
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0xbb
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x6e
	str r0, [sp, #0xc]
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r5, #0x90
	ldr r2, [r5]
	movs r1, #0x7d
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov84_0223EB78

	thumb_func_start ov84_0223EBE0
ov84_0223EBE0: @ 0x0223EBE0
	movs r3, #0
	strb r3, [r0, #8]
	str r2, [r1]
	bx lr
	thumb_func_end ov84_0223EBE0

	thumb_func_start ov84_0223EBE8
ov84_0223EBE8: @ 0x0223EBE8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	ldrb r1, [r0]
	ldrb r0, [r4, #0x10]
	lsls r1, r1, #1
	adds r0, r0, #1
	strb r0, [r4, #0x10]
	ldr r0, _0223EC44 @ =0x0223F913
	ldrb r2, [r4, #0x10]
	ldrb r0, [r0, r1]
	cmp r2, r0
	blo _0223EC42
	movs r0, #0
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0xc]
	cmp r0, #1
	bne _0223EC1E
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1c
	subs r1, r1, r2
	movs r0, #0x1c
	rors r1, r0
	adds r0, r2, r1
	b _0223EC22
_0223EC1E:
	ldrb r0, [r4, #0xd]
	adds r0, r0, #1
_0223EC22:
	strb r0, [r4, #0xd]
	ldr r0, _0223EC48 @ =0x000005E5
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r1, [r4, #0xd]
	ldrb r0, [r0]
	cmp r1, r0
	blo _0223EC3A
	movs r0, #0
	strb r0, [r4, #0xd]
_0223EC3A:
	ldrb r1, [r4, #0xd]
	adds r0, r4, #0
	bl ov84_0223EC4C
_0223EC42:
	pop {r4, pc}
	.align 2, 0
_0223EC44: .4byte 0x0223F913
_0223EC48: .4byte 0x000005E5
	thumb_func_end ov84_0223EBE8

	thumb_func_start ov84_0223EC4C
ov84_0223EC4C: @ 0x0223EC4C
	push {r4, lr}
	adds r2, r1, #0
	movs r1, #0xb5
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	lsrs r4, r2, #0x1f
	lsls r3, r2, #0x1e
	subs r3, r3, r4
	movs r1, #0x1e
	rors r3, r1
	adds r1, r4, r3
	movs r3, #0x28
	adds r4, r1, #0
	muls r4, r3, r4
	lsrs r2, r2, #2
	muls r3, r2, r3
	adds r4, #0x44
	adds r3, #0x24
	lsls r1, r4, #0x10
	lsls r2, r3, #0x10
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	bl ov84_0223F838
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov84_0223EC4C

	thumb_func_start ov84_0223EC80
ov84_0223EC80: @ 0x0223EC80
	ldrb r1, [r0, #0xd]
	strb r1, [r0, #0x14]
	bx lr
	.align 2, 0
	thumb_func_end ov84_0223EC80

	thumb_func_start ov84_0223EC88
ov84_0223EC88: @ 0x0223EC88
	cmp r1, r0
	blo _0223EC92
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0223EC92:
	adds r0, r1, #0
	bx lr
	.align 2, 0
	thumb_func_end ov84_0223EC88

	thumb_func_start ov84_0223EC98
ov84_0223EC98: @ 0x0223EC98
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	ldrh r4, [r5, #0x28]
	bl FUN_02238374
	cmp r0, #1
	bne _0223ECB4
	ldr r0, _0223ECB8 @ =0x000003C2
	ldrh r1, [r5, r0]
	ldrh r0, [r5, #0x28]
	cmp r1, r0
	bls _0223ECB4
	adds r4, r1, #0
_0223ECB4:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223ECB8: .4byte 0x000003C2
	thumb_func_end ov84_0223EC98

	thumb_func_start ov84_0223ECBC
ov84_0223ECBC: @ 0x0223ECBC
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	cmp r1, #0x1e
	beq _0223ECCE
	cmp r1, #0x1f
	beq _0223ECD6
	cmp r1, #0x20
	beq _0223ECDE
	b _0223ECE4
_0223ECCE:
	movs r5, #0x47
	bl ov84_0223ED00
	b _0223ECE4
_0223ECD6:
	movs r5, #0x48
	bl ov84_0223ED6C
	b _0223ECE4
_0223ECDE:
	movs r5, #0x49
	bl ov84_0223EDF8
_0223ECE4:
	movs r1, #0x37
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r1, r4, r1
	movs r2, #0x28
	bl FUN_02037030
	cmp r0, #1
	bne _0223ECFA
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223ECFA:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov84_0223ECBC

	thumb_func_start ov84_0223ED00
ov84_0223ED00: @ 0x0223ED00
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0xdc
	ldr r0, [r0]
	adds r4, r1, #0
	bl FUN_02028E9C
	movs r0, #0x37
	lsls r0, r0, #4
	strh r4, [r5, r0]
	movs r2, #0
	adds r3, r5, #0
	adds r1, r0, #4
_0223ED1A:
	adds r0, r5, r2
	adds r0, #0x34
	ldrb r0, [r0]
	adds r2, r2, #1
	strh r0, [r3, r1]
	adds r3, r3, #2
	cmp r2, #0x10
	blt _0223ED1A
	ldrh r1, [r5, #0x16]
	movs r0, #0xe5
	lsls r0, r0, #2
	strh r1, [r5, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov84_0223ED00

	thumb_func_start ov84_0223ED34
ov84_0223ED34: @ 0x0223ED34
	push {r4, r5, r6, lr}
	adds r4, r3, #0
	adds r6, r0, #0
	ldrb r0, [r4, #0xf]
	adds r5, r2, #0
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	bl FUN_0203769C
	cmp r6, r0
	beq _0223ED6A
	bl FUN_0203769C
	cmp r0, #0
	beq _0223ED6A
	movs r2, #0
	adds r3, r5, #0
_0223ED56:
	ldrh r1, [r3, #4]
	adds r0, r4, r2
	adds r0, #0x34
	adds r2, r2, #1
	adds r3, r3, #2
	strb r1, [r0]
	cmp r2, #0x10
	blt _0223ED56
	ldrh r0, [r5, #0x24]
	strh r0, [r4, #0x16]
_0223ED6A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov84_0223ED34

	thumb_func_start ov84_0223ED6C
ov84_0223ED6C: @ 0x0223ED6C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x37
	lsls r0, r0, #4
	strh r1, [r5, r0]
	adds r4, r2, #0
	adds r0, r0, #2
	strh r4, [r5, r0]
	bl FUN_0203769C
	cmp r0, #0
	bne _0223ED8C
	ldrb r0, [r5, #0xe]
	cmp r0, #0xff
	bne _0223ED8C
	strb r4, [r5, #0xe]
_0223ED8C:
	ldrb r1, [r5, #0xe]
	movs r0, #0xdd
	lsls r0, r0, #2
	strh r1, [r5, r0]
	ldr r1, [r5, #0x24]
	adds r0, r0, #2
	ldrh r1, [r1]
	strh r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov84_0223ED6C

	thumb_func_start ov84_0223EDA0
ov84_0223EDA0: @ 0x0223EDA0
	ldr r3, _0223EDA4 @ =FUN_0201FD44
	bx r3
	.align 2, 0
_0223EDA4: .4byte FUN_0201FD44
	thumb_func_end ov84_0223EDA0

	thumb_func_start ov84_0223EDA8
ov84_0223EDA8: @ 0x0223EDA8
	push {r4, r5, r6, lr}
	adds r4, r3, #0
	adds r6, r0, #0
	ldrb r0, [r4, #0xf]
	adds r5, r2, #0
	adds r0, r0, #1
	strb r0, [r4, #0xf]
	bl FUN_0203769C
	cmp r6, r0
	beq _0223EDF2
	ldrh r1, [r5, #2]
	ldr r0, _0223EDF4 @ =0x000003C1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r0, #0
	bne _0223EDE8
	ldrb r0, [r4, #0xe]
	cmp r0, #0xff
	ldr r0, _0223EDF4 @ =0x000003C1
	beq _0223EDDA
	movs r1, #0
	strb r1, [r4, r0]
	pop {r4, r5, r6, pc}
_0223EDDA:
	ldrb r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r4, #0xe]
	pop {r4, r5, r6, pc}
_0223EDE8:
	ldrh r0, [r5, #4]
	strb r0, [r4, #0xe]
	ldrh r1, [r5, #6]
	ldr r0, [r4, #0x24]
	strh r1, [r0]
_0223EDF2:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223EDF4: .4byte 0x000003C1
	thumb_func_end ov84_0223EDA8

	thumb_func_start ov84_0223EDF8
ov84_0223EDF8: @ 0x0223EDF8
	movs r2, #0x37
	lsls r2, r2, #4
	strh r1, [r0, r2]
	ldrb r3, [r0, #0xd]
	adds r1, r2, #2
	strh r3, [r0, r1]
	bx lr
	.align 2, 0
	thumb_func_end ov84_0223EDF8

	thumb_func_start ov84_0223EE08
ov84_0223EE08: @ 0x0223EE08
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl FUN_0203769C
	cmp r5, r0
	beq _0223EE20
	ldrh r1, [r4, #2]
	movs r0, #0xf
	lsls r0, r0, #6
	strb r1, [r6, r0]
_0223EE20:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov84_0223EE08

	thumb_func_start ov84_0223EE24
ov84_0223EE24: @ 0x0223EE24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	adds r0, #0x2e
	ldrb r0, [r0]
	bl ov84_0223EC88
	ldr r1, [sp]
	str r0, [sp, #4]
	adds r0, r1, r0
	adds r0, #0x34
	ldrb r6, [r0]
	adds r0, r1, #0
	ldr r0, [r0, #0x20]
	movs r7, #0xb6
	strb r6, [r0]
	movs r4, #0
	adds r5, r1, #0
	lsls r7, r7, #2
_0223EE4A:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223EE56
	adds r1, r6, #0
	bl ov84_0223F878
_0223EE56:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x10
	blt _0223EE4A
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov84_0223EC4C
	ldr r0, _0223EE70 @ =0x000005E3
	bl FUN_0200604C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223EE70: .4byte 0x000005E3
	thumb_func_end ov84_0223EE24

	thumb_func_start ov84_0223EE74
ov84_0223EE74: @ 0x0223EE74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	str r0, [sp, #4]
	adds r0, #0x64
	ldr r5, _0223EFD4 @ =0x0223F99C
	movs r7, #0
	str r0, [sp, #4]
_0223EE84:
	ldrh r0, [r6, #0x2a]
	cmp r0, #5
	bhi _0223EED2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223EE96: @ jump table
	.2byte _0223EEA2 - _0223EE96 - 2 @ case 0
	.2byte _0223EEAA - _0223EE96 - 2 @ case 1
	.2byte _0223EEB2 - _0223EE96 - 2 @ case 2
	.2byte _0223EEBA - _0223EE96 - 2 @ case 3
	.2byte _0223EEC2 - _0223EE96 - 2 @ case 4
	.2byte _0223EECA - _0223EE96 - 2 @ case 5
_0223EEA2:
	ldrb r0, [r5]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	b _0223EED8
_0223EEAA:
	ldrb r0, [r5]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	b _0223EED8
_0223EEB2:
	ldrb r0, [r5]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	b _0223EED8
_0223EEBA:
	ldrb r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	b _0223EED8
_0223EEC2:
	ldrb r0, [r5]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	b _0223EED8
_0223EECA:
	ldrb r0, [r5]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	b _0223EED8
_0223EED2:
	ldrb r0, [r5]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
_0223EED8:
	cmp r0, #1
	bne _0223EFC6
	adds r0, r7, #0
	subs r0, #0x18
	movs r4, #0xff
	cmp r0, #7
	bhi _0223EF1C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223EEF2: @ jump table
	.2byte _0223EF06 - _0223EEF2 - 2 @ case 0
	.2byte _0223EF0A - _0223EEF2 - 2 @ case 1
	.2byte _0223EF0E - _0223EEF2 - 2 @ case 2
	.2byte _0223EF02 - _0223EEF2 - 2 @ case 3
	.2byte _0223EF12 - _0223EEF2 - 2 @ case 4
	.2byte _0223EF16 - _0223EEF2 - 2 @ case 5
	.2byte _0223EF1C - _0223EEF2 - 2 @ case 6
	.2byte _0223EF1A - _0223EEF2 - 2 @ case 7
_0223EF02:
	movs r4, #0
	b _0223EF1C
_0223EF06:
	movs r4, #1
	b _0223EF1C
_0223EF0A:
	movs r4, #2
	b _0223EF1C
_0223EF0E:
	movs r4, #3
	b _0223EF1C
_0223EF12:
	movs r4, #4
	b _0223EF1C
_0223EF16:
	movs r4, #5
	b _0223EF1C
_0223EF1A:
	movs r4, #6
_0223EF1C:
	adds r0, r6, #0
	bl ov84_0223EC98
	movs r1, #7
	str r0, [sp]
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	ldr r1, [sp]
	ldr r0, _0223EFD8 @ =0x0000270F
	cmp r1, r0
	blo _0223EF38
	movs r2, #6
_0223EF38:
	cmp r4, #0xff
	beq _0223EFAA
	cmp r2, #7
	bhi _0223EFA2
	adds r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223EF4C: @ jump table
	.2byte _0223EF5C - _0223EF4C - 2 @ case 0
	.2byte _0223EF66 - _0223EF4C - 2 @ case 1
	.2byte _0223EF70 - _0223EF4C - 2 @ case 2
	.2byte _0223EF7A - _0223EF4C - 2 @ case 3
	.2byte _0223EF84 - _0223EF4C - 2 @ case 4
	.2byte _0223EF8E - _0223EF4C - 2 @ case 5
	.2byte _0223EF98 - _0223EF4C - 2 @ case 6
	.2byte _0223EF98 - _0223EF4C - 2 @ case 7
_0223EF5C:
	ldr r0, _0223EFDC @ =0x0223F904
	ldrb r0, [r0, r4]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	b _0223EFAC
_0223EF66:
	ldr r0, _0223EFDC @ =0x0223F904
	ldrb r0, [r0, r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	b _0223EFAC
_0223EF70:
	ldr r0, _0223EFDC @ =0x0223F904
	ldrb r0, [r0, r4]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	b _0223EFAC
_0223EF7A:
	ldr r0, _0223EFDC @ =0x0223F904
	ldrb r0, [r0, r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	b _0223EFAC
_0223EF84:
	ldr r0, _0223EFDC @ =0x0223F904
	ldrb r0, [r0, r4]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	b _0223EFAC
_0223EF8E:
	ldr r0, _0223EFDC @ =0x0223F904
	ldrb r0, [r0, r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	b _0223EFAC
_0223EF98:
	ldr r0, _0223EFDC @ =0x0223F904
	ldrb r0, [r0, r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	b _0223EFAC
_0223EFA2:
	bl FUN_0202551C
	movs r0, #1
	b _0223EFAC
_0223EFAA:
	movs r0, #1
_0223EFAC:
	cmp r0, #1
	bne _0223EFC6
	adds r0, r6, #0
	adds r0, #0x64
	ldrb r0, [r0]
	adds r0, r6, r0
	adds r0, #0x44
	strb r7, [r0]
	ldr r0, [sp, #4]
	ldrb r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #4]
	strb r1, [r0]
_0223EFC6:
	adds r7, r7, #1
	adds r5, r5, #1
	cmp r7, #0x20
	bhs _0223EFD0
	b _0223EE84
_0223EFD0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223EFD4: .4byte 0x0223F99C
_0223EFD8: .4byte 0x0000270F
_0223EFDC: .4byte 0x0223F904
	thumb_func_end ov84_0223EE74

	thumb_func_start ov84_0223EFE0
ov84_0223EFE0: @ 0x0223EFE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrb r3, [r5, #0x12]
	ldr r2, _0223F090 @ =_0223F900
	movs r1, #0
_0223EFEC:
	ldrb r0, [r2]
	cmp r3, r0
	bhs _0223EFFA
	adds r1, r1, #1
	adds r2, r2, #1
	cmp r1, #4
	blo _0223EFEC
_0223EFFA:
	adds r0, r5, #0
	strb r1, [r5, #0x11]
	adds r0, #0x64
	ldrb r0, [r0]
	movs r4, #0
	cmp r0, #0
	ble _0223F08A
	adds r0, r5, #0
	str r0, [sp, #4]
	adds r0, #0x33
	str r0, [sp, #4]
	adds r0, r5, #0
	str r0, [sp]
	adds r0, #0x32
	adds r7, r5, #0
	adds r6, r5, #0
	str r0, [sp]
	adds r7, #0x31
	adds r6, #0x30
_0223F020:
	adds r0, r5, r4
	adds r0, #0x44
	ldrb r0, [r0]
	bl FUN_022384BC
	cmp r0, #0
	bne _0223F036
	ldrb r0, [r6]
	adds r0, r0, #1
	strb r0, [r6]
	b _0223F07E
_0223F036:
	adds r0, r5, r4
	adds r0, #0x44
	ldrb r0, [r0]
	bl FUN_022384BC
	cmp r0, #1
	bne _0223F04C
	ldrb r0, [r7]
	adds r0, r0, #1
	strb r0, [r7]
	b _0223F07E
_0223F04C:
	adds r0, r5, r4
	adds r0, #0x44
	ldrb r0, [r0]
	bl FUN_022384BC
	cmp r0, #2
	bne _0223F066
	ldr r0, [sp]
	ldrb r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp]
	strb r1, [r0]
	b _0223F07E
_0223F066:
	adds r0, r5, r4
	adds r0, #0x44
	ldrb r0, [r0]
	bl FUN_022384BC
	cmp r0, #3
	bne _0223F07E
	ldr r0, [sp, #4]
	ldrb r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp, #4]
	strb r1, [r0]
_0223F07E:
	adds r0, r5, #0
	adds r0, #0x64
	ldrb r0, [r0]
	adds r4, r4, #1
	cmp r4, r0
	blt _0223F020
_0223F08A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223F090: .4byte _0223F900
	thumb_func_end ov84_0223EFE0

	thumb_func_start ov84_0223F094
ov84_0223F094: @ 0x0223F094
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #4]
_0223F09E:
	ldrb r1, [r6, #0x11]
	adds r0, r6, #0
	bl ov84_0223F178
	adds r5, r0, #0
	adds r0, r6, r5
	adds r0, #0x30
	movs r4, #0
	ldrb r7, [r0]
	cmp r5, #0
	beq _0223F0F4
	cmp r5, #1
	bne _0223F0C2
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r4, r4, r0
	b _0223F0F4
_0223F0C2:
	cmp r5, #2
	bne _0223F0D8
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r4, r0
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	adds r4, r1, r0
	b _0223F0F4
_0223F0D8:
	cmp r5, #3
	bne _0223F0F4
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r4, r0
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r0, [r0]
	adds r4, r1, r0
_0223F0F4:
	bl FUN_0201FD44
	adds r1, r7, #0
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r7, #0
_0223F110:
	cmp r7, #0x32
	blt _0223F124
	bl FUN_0202551C
	ldr r0, [sp, #4]
	movs r1, #0
	adds r0, r6, r0
	adds r0, #0x34
	strb r1, [r0]
	b _0223F16A
_0223F124:
	adds r0, r6, r4
	adds r0, #0x44
	ldrb r0, [r0]
	bl FUN_022384BC
	cmp r5, r0
	bne _0223F142
	adds r0, r6, r4
	adds r0, #0x44
	ldrb r1, [r0]
	ldr r0, [sp, #4]
	adds r0, r6, r0
	adds r0, #0x34
	strb r1, [r0]
	b _0223F16A
_0223F142:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #0
	adds r0, #0x64
	ldrb r0, [r0]
	adds r7, r7, #1
	cmp r4, r0
	blo _0223F156
	movs r4, #0
_0223F156:
	ldr r0, [sp]
	cmp r4, r0
	bne _0223F110
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	blo _0223F110
	movs r5, #0
	b _0223F110
_0223F16A:
	ldr r0, [sp, #4]
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #0x10
	blt _0223F09E
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov84_0223F094

	thumb_func_start ov84_0223F178
ov84_0223F178: @ 0x0223F178
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r5, #0
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	ldr r3, _0223F1B8 @ =0x0223F934
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r1, r3, r1
_0223F194:
	ldrb r3, [r1, r0]
	adds r3, r5, r3
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	cmp r2, r5
	blt _0223F1AA
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	blo _0223F194
_0223F1AA:
	cmp r0, #4
	blo _0223F1B4
	bl FUN_0202551C
	movs r0, #0
_0223F1B4:
	pop {r3, r4, r5, pc}
	nop
_0223F1B8: .4byte 0x0223F934
	thumb_func_end ov84_0223F178

	thumb_func_start ov84_0223F1BC
ov84_0223F1BC: @ 0x0223F1BC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	movs r1, #1
	bl FUN_022380E8
	adds r6, r0, #0
	ldrb r0, [r5, #9]
	movs r1, #1
	bl FUN_0223811C
	adds r7, r0, #0
	movs r4, #0
	cmp r6, #0
	bls _0223F21E
_0223F1DA:
	movs r0, #0xd9
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0223F204
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0xce
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl ov84_0223F82C
	b _0223F214
_0223F204:
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0xce
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov84_0223F82C
_0223F214:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _0223F1DA
_0223F21E:
	movs r4, #0
	cmp r7, #0
	bls _0223F268
	movs r6, #0xda
	lsls r6, r6, #2
_0223F228:
	ldr r0, [r5, r6]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0223F24E
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0xd2
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl ov84_0223F82C
	b _0223F25E
_0223F24E:
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0xd2
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov84_0223F82C
_0223F25E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	blo _0223F228
_0223F268:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov84_0223F1BC

	thumb_func_start ov84_0223F26C
ov84_0223F26C: @ 0x0223F26C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223F288 @ =0x0223F90B
	bl FUN_0202529C
	cmp r0, #0
	bne _0223F284
	adds r0, r4, #0
	bl ov84_0223F28C
	movs r0, #1
	pop {r4, pc}
_0223F284:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0223F288: .4byte 0x0223F90B
	thumb_func_end ov84_0223F26C

	thumb_func_start ov84_0223F28C
ov84_0223F28C: @ 0x0223F28C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223F2AC @ =0x000005DC
	movs r1, #0
	bl FUN_02006154
	ldr r0, _0223F2B0 @ =0x000005E4
	bl FUN_0200604C
	movs r0, #0xd6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov84_0223F878
	pop {r4, pc}
	.align 2, 0
_0223F2AC: .4byte 0x000005DC
_0223F2B0: .4byte 0x000005E4
	thumb_func_end ov84_0223F28C

	thumb_func_start ov84_0223F2B4
ov84_0223F2B4: @ 0x0223F2B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	str r1, [sp, #0x14]
	movs r0, #0x20
	movs r1, #0x6e
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl FUN_0202055C
	bl ov84_0223F480
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x6e
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	movs r0, #0x22
	adds r1, r5, #4
	movs r2, #0x6e
	bl FUN_02009F40
	ldr r4, _0223F370 @ =0x0223F9E4
	str r0, [r5]
	movs r7, #0
	adds r6, r5, #0
_0223F2FA:
	ldrb r0, [r4]
	adds r1, r7, #0
	movs r2, #0x6e
	bl FUN_0200A090
	movs r1, #0x4b
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r7, r7, #1
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r7, #4
	blt _0223F2FA
	adds r0, r5, #0
	bl ov84_0223F714
	adds r0, r5, #0
	bl ov84_0223F4B4
	adds r0, r5, #0
	bl ov84_0223F538
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r0, r5, #0
	bl ov84_0223F5E4
	movs r7, #0x4f
	movs r6, #0
	adds r4, r5, #0
	lsls r7, r7, #2
_0223F33A:
	ldr r0, [r4, r7]
	bl FUN_0200ACF0
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #0xb
	blt _0223F33A
	movs r6, #5
	movs r4, #0
	lsls r6, r6, #6
_0223F34E:
	ldr r0, [r5, r6]
	bl FUN_0200AF94
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #4
	blt _0223F34E
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223F370: .4byte 0x0223F9E4
	thumb_func_end ov84_0223F2B4

	thumb_func_start ov84_0223F374
ov84_0223F374: @ 0x0223F374
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
	movs r1, #1
	lsls r1, r1, #0xc
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	adds r0, r5, #0
	str r0, [sp, #0x34]
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r1, [sp, #0x44]
	str r1, [sp, #0x48]
	add r1, sp, #0x2c
	strh r0, [r1, #0x20]
	ldr r1, [sp, #0x94]
	str r1, [sp, #0x50]
	movs r1, #0x6e
	str r1, [sp, #0x58]
	add r1, sp, #0x80
	ldrb r1, [r1, #0x1c]
	cmp r1, #0
	bne _0223F3E6
	movs r0, #1
	str r0, [sp, #0x54]
	b _0223F3F2
_0223F3E6:
	movs r1, #2
	str r1, [sp, #0x54]
	movs r1, #3
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r0, [sp, #0x38]
_0223F3F2:
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
	thumb_func_end ov84_0223F374

	thumb_func_start ov84_0223F418
ov84_0223F418: @ 0x0223F418
	push {r4, r5, r6, lr}
	movs r6, #0x4f
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_0223F422:
	lsls r0, r4, #4
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_0200AEB0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xb
	blo _0223F422
	movs r6, #5
	movs r4, #0
	lsls r6, r6, #6
_0223F43C:
	lsls r0, r4, #4
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_0200B0A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _0223F43C
	movs r6, #0x4b
	movs r4, #0
	lsls r6, r6, #2
_0223F456:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_0200A0D0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _0223F456
	ldr r0, [r5]
	bl FUN_02024504
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov84_0223F418

	thumb_func_start ov84_0223F480
ov84_0223F480: @ 0x0223F480
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0223F4B0 @ =0x0223F9E8
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	movs r1, #0x10
	adds r0, r2, #0
	adds r2, r1, #0
	bl FUN_020215C0
	movs r0, #0xe
	movs r1, #0x6e
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0223F4B0: .4byte 0x0223F9E8
	thumb_func_end ov84_0223F480

	thumb_func_start ov84_0223F4B4
ov84_0223F4B4: @ 0x0223F4B4
	push {r4, lr}
	sub sp, #0x10
	movs r3, #1
	str r3, [sp]
	adds r4, r0, #0
	str r3, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	adds r0, #0xbe
	ldr r0, [r4, r0]
	movs r1, #0xb8
	movs r2, #0x12
	bl FUN_0200A1D8
	movs r1, #0x53
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	movs r0, #0x6e
	str r0, [sp, #0xc]
	adds r0, #0xc2
	ldr r0, [r4, r0]
	movs r1, #0xb8
	movs r2, #0x38
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x15
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r3, #1
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	adds r0, #0xc6
	ldr r0, [r4, r0]
	movs r1, #0xb8
	movs r2, #0x14
	bl FUN_0200A294
	movs r1, #0x55
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r3, #1
	str r3, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	adds r0, #0xca
	ldr r0, [r4, r0]
	movs r1, #0xb8
	movs r2, #0x13
	bl FUN_0200A294
	movs r1, #0x56
	lsls r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov84_0223F4B4

	thumb_func_start ov84_0223F538
ov84_0223F538: @ 0x0223F538
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x15
	movs r1, #0x6e
	bl FUN_02007688
	adds r4, r0, #0
	bl FUN_0207CA9C
	adds r2, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	adds r0, #0xbe
	ldr r0, [r5, r0]
	adds r1, r4, #0
	movs r3, #0
	bl FUN_0200A3C8
	movs r1, #0x57
	lsls r1, r1, #2
	str r0, [r5, r1]
	bl FUN_0207CAA0
	adds r2, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0x6e
	str r0, [sp, #0xc]
	adds r0, #0xc2
	ldr r0, [r5, r0]
	movs r1, #0x15
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x16
	lsls r1, r1, #4
	str r0, [r5, r1]
	bl FUN_0207CAA4
	adds r2, r0, #0
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	adds r0, #0xc6
	ldr r0, [r5, r0]
	adds r1, r4, #0
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r5, r1]
	bl FUN_0207CAA8
	adds r2, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	adds r0, #0xca
	ldr r0, [r5, r0]
	adds r1, r4, #0
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x5a
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov84_0223F538

	thumb_func_start ov84_0223F5E4
ov84_0223F5E4: @ 0x0223F5E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r6, r0, #0
	adds r7, r1, #0
	movs r0, #0x14
	movs r1, #0x6e
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	bl FUN_02007688
	str r0, [sp, #0x18]
	bl FUN_02074490
	movs r1, #3
	adds r2, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x6e
	str r0, [sp, #0xc]
	adds r0, #0xc2
	ldr r0, [r6, r0]
	movs r1, #0x14
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r6, r1]
	bl FUN_02074498
	adds r2, r0, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	adds r0, #0xc6
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x18]
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x5d
	lsls r1, r1, #2
	str r0, [r6, r1]
	bl FUN_020744A4
	adds r2, r0, #0
	movs r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	adds r0, #0xca
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x18]
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r6, r1]
	movs r4, #0
	adds r5, r6, #0
_0223F66A:
	cmp r4, #3
	bne _0223F6A0
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0223F68A
	adds r0, r7, #0
	movs r1, #0
	bl FUN_02074644
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	movs r1, #0
	bl FUN_02074644
	str r0, [sp, #0x1c]
	b _0223F6B4
_0223F68A:
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_02074644
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	adds r1, r4, #0
	bl FUN_02074644
	str r0, [sp, #0x1c]
	b _0223F6B4
_0223F6A0:
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_02074644
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	adds r1, r4, #0
	bl FUN_02074644
	str r0, [sp, #0x1c]
_0223F6B4:
	ldr r0, [sp, #0x20]
	bl FUN_020741B0
	adds r2, r0, #0
	adds r0, r4, #3
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	adds r0, #0xbe
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x18]
	movs r3, #0
	bl FUN_0200A3C8
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp, #0x1c]
	bl FUN_020741B0
	adds r2, r0, #0
	adds r0, r4, #7
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	adds r0, #0xbe
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x18]
	movs r3, #0
	bl FUN_0200A3C8
	movs r1, #0x6b
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #4
	blo _0223F66A
	ldr r0, [sp, #0x18]
	bl FUN_0200770C
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov84_0223F5E4

	thumb_func_start ov84_0223F714
ov84_0223F714: @ 0x0223F714
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	adds r0, #0xbe
	ldr r0, [r4, r0]
	movs r1, #0xb8
	movs r2, #0x15
	movs r3, #1
	bl FUN_0200A1D8
	movs r1, #0x4f
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r3, #0
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x6e
	str r0, [sp, #0xc]
	adds r0, #0xc2
	ldr r0, [r4, r0]
	movs r1, #0xb8
	movs r2, #0x39
	bl FUN_0200A234
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r4, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	adds r0, #0xc6
	ldr r0, [r4, r0]
	movs r1, #0xb8
	movs r2, #0x17
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x6e
	str r0, [sp, #8]
	adds r0, #0xca
	ldr r0, [r4, r0]
	movs r1, #0xb8
	movs r2, #0x16
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x52
	lsls r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov84_0223F714

	thumb_func_start ov84_0223F7A0
ov84_0223F7A0: @ 0x0223F7A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x6e
	movs r1, #0x14
	adds r7, r2, #0
	str r3, [sp, #0x10]
	bl FUN_0201AA8C
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #0x14
	movs r0, #0
_0223F7BC:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0223F7BC
	ldr r0, [sp, #0x38]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x44]
	adds r1, r6, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	adds r2, r7, #0
	str r0, [sp, #8]
	add r0, sp, #0x4c
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	adds r0, r5, #0
	bl ov84_0223F374
	str r0, [r4, #0x10]
	add r0, sp, #0x28
	ldrh r3, [r0, #0x14]
	strh r3, [r4, #0xc]
	ldrh r1, [r0, #0x18]
	add r0, sp, #0x4c
	ldrb r2, [r0]
	strh r1, [r4, #0xe]
	lsls r0, r3, #0xc
	strb r2, [r4, #0xb]
	lsls r1, r1, #0xc
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	cmp r2, #1
	bne _0223F808
	movs r0, #3
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #0x18]
_0223F808:
	ldr r0, [r4, #0x10]
	add r1, sp, #0x14
	bl FUN_020247D4
	adds r0, r4, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov84_0223F7A0

	thumb_func_start ov84_0223F818
ov84_0223F818: @ 0x0223F818
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_02024758
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov84_0223F818

	thumb_func_start ov84_0223F82C
ov84_0223F82C: @ 0x0223F82C
	ldr r3, _0223F834 @ =FUN_02024830
	ldr r0, [r0, #0x10]
	bx r3
	nop
_0223F834: .4byte FUN_02024830
	thumb_func_end ov84_0223F82C

	thumb_func_start ov84_0223F838
ov84_0223F838: @ 0x0223F838
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_020248AC
	adds r3, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	lsls r1, r6, #0xc
	str r0, [r2]
	lsls r0, r4, #0xc
	str r1, [sp, #4]
	str r0, [sp]
	ldrb r0, [r5, #0xb]
	cmp r0, #1
	bne _0223F86A
	movs r0, #3
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
_0223F86A:
	ldr r0, [r5, #0x10]
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov84_0223F838

	thumb_func_start ov84_0223F878
ov84_0223F878: @ 0x0223F878
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #1
	ldr r0, [r5, #0x10]
	lsls r1, r1, #0xc
	bl FUN_02024868
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	bl FUN_02024950
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov84_0223F878

	thumb_func_start ov84_0223F894
ov84_0223F894: @ 0x0223F894
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl FUN_02074484
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_02024AA8
	pop {r4, pc}
	thumb_func_end ov84_0223F894

	thumb_func_start ov84_0223F8A8
ov84_0223F8A8: @ 0x0223F8A8
	ldr r3, _0223F8B0 @ =FUN_0202484C
	ldr r0, [r0, #0x10]
	bx r3
	nop
_0223F8B0: .4byte FUN_0202484C
	thumb_func_end ov84_0223F8A8

	thumb_func_start ov84_0223F8B4
ov84_0223F8B4: @ 0x0223F8B4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	movs r4, #0
_0223F8BC:
	ldr r2, _0223F8E0 @ =0x0223F9F8
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
	cmp r4, #2
	blo _0223F8BC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223F8E0: .4byte 0x0223F9F8
	thumb_func_end ov84_0223F8B4

	thumb_func_start ov84_0223F8E4
ov84_0223F8E4: @ 0x0223F8E4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0223F8EA:
	lsls r0, r4, #4
	adds r0, r5, r0
	bl FUN_0201D520
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #2
	blo _0223F8EA
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov84_0223F8E4

	.rodata

_0223F900:
	.byte 0x15, 0x10, 0x0A, 0x05, 0x3F, 0x3F, 0x3F, 0x3F, 0x15, 0x2A, 0x2A, 0xFE, 0x80, 0x60, 0x20, 0xFF
	.byte 0x00, 0x00, 0x00, 0x14, 0x00, 0x10, 0x00, 0x08, 0x00, 0x04, 0x00, 0x03, 0x00, 0x02, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0F, 0x28, 0x1E, 0x23, 0x14, 0x1E, 0x0F, 0x1E, 0x1E, 0x23, 0x05
	.byte 0x19, 0x28, 0x1E, 0x05, 0x0A, 0x4B, 0x0A, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x06, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x04, 0x03, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7E, 0x45, 0x45, 0x45
	.byte 0x70, 0x70, 0x47, 0x78, 0x7E, 0x7E, 0x45, 0x45, 0x45, 0x70, 0x70, 0x47, 0x78, 0x7E, 0x46, 0x46
	.byte 0x46, 0x46, 0x68, 0x68, 0x7F, 0x47, 0x7F, 0x70, 0x78, 0x70, 0x7F, 0x40, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x0B, 0x0B, 0x20, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00, 0x01, 0x02, 0x13, 0x1B, 0x04, 0x0C, 0x01, 0x00
	.byte 0x01, 0x18, 0x0D, 0x07, 0x04, 0x0D, 0x6D, 0x00
	@ 0x0223FA08

	.bss

_0223FA20:
	.space 0x20
