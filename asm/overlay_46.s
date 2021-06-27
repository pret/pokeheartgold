
	thumb_func_start ov46_02258800
ov46_02258800: @ 0x02258800
	push {r4, r5, lr}
	sub sp, #0x1c
	movs r2, #2
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0x77
	lsls r2, r2, #0x10
	bl FUN_0201A910
	ldr r1, _02258918 @ =0x00000404
	adds r0, r4, #0
	movs r2, #0x77
	bl FUN_02007280
	ldr r2, _02258918 @ =0x00000404
	movs r1, #0
	adds r5, r0, #0
	blx FUN_020E5B44
	adds r0, r4, #0
	bl FUN_020072A4
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, _0225891C @ =0x0000047D
	str r0, [r5]
	movs r0, #0xb
	movs r2, #0
	bl FUN_02004EC4
	movs r0, #0
	str r0, [r4, #0x10]
	adds r0, r5, #0
	movs r1, #0x77
	bl ov46_02258F78
	movs r0, #2
	str r0, [sp]
	movs r0, #0x13
	str r0, [sp, #4]
	movs r0, #0x1b
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r5]
	ldr r3, _02258920 @ =0x0000030A
	str r0, [sp, #0x14]
	movs r0, #0x77
	str r0, [sp, #0x18]
	adds r0, r5, #0
	ldr r1, [r5, #0xc]
	adds r0, #0x40
	movs r2, #1
	bl ov46_022592EC
	movs r0, #2
	str r0, [sp]
	movs r0, #0x13
	str r0, [sp, #4]
	movs r0, #0x1b
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r5]
	movs r3, #0x32
	str r0, [sp, #0x14]
	movs r0, #0x77
	str r0, [sp, #0x18]
	adds r0, r5, #0
	ldr r1, [r5, #0xc]
	adds r0, #0x70
	movs r2, #1
	lsls r3, r3, #4
	bl ov46_022592EC
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x17
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #0x94
	str r0, [sp, #0x10]
	ldr r0, [r5]
	movs r3, #0x32
	str r0, [sp, #0x14]
	movs r0, #0x77
	str r0, [sp, #0x18]
	adds r0, r5, #0
	ldr r1, [r5, #0xc]
	adds r0, #0xa0
	movs r2, #0
	lsls r3, r3, #4
	bl ov46_022592EC
	movs r0, #5
	str r0, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r0, #0x16
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x81
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r5]
	ldr r3, _02258920 @ =0x0000030A
	str r0, [sp, #0x14]
	movs r0, #0x77
	str r0, [sp, #0x18]
	adds r0, r5, #0
	ldr r1, [r5, #0xc]
	adds r0, #0x10
	bl ov46_022592EC
	adds r0, r5, #0
	adds r0, #0x10
	movs r1, #0x15
	bl ov46_022594E0
	ldr r0, _02258924 @ =ov46_02258F70
	adds r1, r5, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	ldr r0, _02258928 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #1
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
_02258918: .4byte 0x00000404
_0225891C: .4byte 0x0000047D
_02258920: .4byte 0x0000030A
_02258924: .4byte ov46_02258F70
_02258928: .4byte 0x021D116C
	thumb_func_end ov46_02258800

	thumb_func_start ov46_0225892C
ov46_0225892C: @ 0x0225892C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	bl FUN_02007290
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_020072A4
	adds r6, r0, #0
	ldr r0, [r4]
	cmp r0, #0xf
	bls _0225894A
	b _02258C24
_0225894A:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02258956: @ jump table
	.2byte _02258976 - _02258956 - 2 @ case 0
	.2byte _02258994 - _02258956 - 2 @ case 1
	.2byte _022589A4 - _02258956 - 2 @ case 2
	.2byte _022589D0 - _02258956 - 2 @ case 3
	.2byte _02258A0A - _02258956 - 2 @ case 4
	.2byte _02258A32 - _02258956 - 2 @ case 5
	.2byte _02258A64 - _02258956 - 2 @ case 6
	.2byte _02258BF6 - _02258956 - 2 @ case 7
	.2byte _02258C16 - _02258956 - 2 @ case 8
	.2byte _02258AB2 - _02258956 - 2 @ case 9
	.2byte _02258B0E - _02258956 - 2 @ case 10
	.2byte _02258B4C - _02258956 - 2 @ case 11
	.2byte _02258B74 - _02258956 - 2 @ case 12
	.2byte _02258BA6 - _02258956 - 2 @ case 13
	.2byte _02258BB4 - _02258956 - 2 @ case 14
	.2byte _02258BD8 - _02258956 - 2 @ case 15
_02258976:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x77
	str r0, [sp, #8]
	ldr r3, _02258C30 @ =0x0000FFFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258994:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _022589F0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258C28
_022589A4:
	ldr r0, [r6, #8]
	cmp r0, #0
	bne _022589CA
	adds r0, r5, #0
	adds r0, #0x70
	movs r1, #0x11
	bl ov46_02259374
	movs r1, #0x23
	ldr r0, [r5, #0xc]
	lsls r1, r1, #4
	bl ov46_02259550
	adds r5, #0xd0
	str r0, [r5]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258C28
_022589CA:
	movs r0, #4
	str r0, [r4]
	b _02258C28
_022589D0:
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl FUN_020168F4
	cmp r0, #1
	bne _022589EC
	adds r5, #0xd0
	ldr r0, [r5]
	bl FUN_02016624
	movs r0, #4
	str r0, [r4]
	b _02258C28
_022589EC:
	cmp r0, #2
	beq _022589F2
_022589F0:
	b _02258C28
_022589F2:
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl FUN_02016624
	adds r5, #0x40
	adds r0, r5, #0
	bl ov46_022593F8
	movs r0, #7
	str r0, [r4]
	b _02258C28
_02258A0A:
	ldr r0, [r6, #4]
	bl FUN_0222A5C0
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_0203976C
	adds r0, r5, #0
	adds r0, #0x70
	movs r1, #0x17
	bl ov46_02259374
	adds r5, #0x70
	adds r0, r5, #0
	bl ov46_02259450
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258A32:
	bl FUN_020393C8
	cmp r0, #0
	bne _02258A42
	bl FUN_020397FC
	cmp r0, #0
	beq _02258A4E
_02258A42:
	adds r5, #0x70
	adds r0, r5, #0
	bl ov46_02259474
	movs r0, #9
	str r0, [r4]
_02258A4E:
	bl FUN_020397E4
	cmp r0, #1
	bne _02258B20
	ldr r0, [r6, #4]
	bl FUN_0222B244
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258A64:
	bl FUN_020393C8
	cmp r0, #0
	bne _02258A74
	bl FUN_020397FC
	cmp r0, #0
	beq _02258A80
_02258A74:
	adds r0, r5, #0
	adds r0, #0x70
	bl ov46_02259474
	movs r0, #9
	str r0, [r4]
_02258A80:
	bl FUN_02039274
	cmp r0, #0
	beq _02258B20
	adds r0, r5, #0
	adds r0, #0x70
	bl ov46_02259474
	ldr r0, [r5]
	bl FUN_0202CF54
	movs r1, #0x21
	bl FUN_0202D1C0
	bl FUN_020147DC
	ldr r2, [r6, #0xc]
	str r0, [r2]
	str r1, [r2, #4]
	movs r0, #1
	str r0, [r6, #0x10]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258AB2:
	bl FUN_020393C8
	cmp r0, #0
	beq _02258ACE
	bl FUN_020392D8
	adds r7, r0, #0
	ldr r0, [r7]
	ldr r1, [r7, #4]
	bl FUN_0222D7CC
	str r0, [sp, #0xc]
	ldr r7, [r7]
	b _02258ADC
_02258ACE:
	bl FUN_0222E7CC
	bl FUN_0222E7FC
	adds r7, r0, #0
	movs r0, #0x20
	str r0, [sp, #0xc]
_02258ADC:
	ldr r0, [r6, #4]
	bl FUN_0222B270
	adds r0, r5, #0
	adds r0, #0x40
	bl ov46_022593F8
	adds r0, r5, #0
	adds r0, #0x70
	bl ov46_022593F8
	adds r0, r5, #0
	adds r0, #0xa0
	adds r1, r7, #0
	bl ov46_02259534
	adds r5, #0xa0
	ldr r1, [sp, #0xc]
	adds r0, r5, #0
	bl ov46_02259374
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258B0E:
	ldr r0, _02258C34 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _02258B22
	bl FUN_02025358
	cmp r0, #1
	beq _02258B22
_02258B20:
	b _02258C28
_02258B22:
	bl FUN_020393C8
	cmp r0, #0
	beq _02258B46
	bl FUN_020392D8
	adds r1, r0, #0
	ldm r1, {r0, r1}
	bl FUN_0222D7FC
	cmp r0, #0
	bne _02258B40
	movs r0, #0xb
	str r0, [r4]
	b _02258C28
_02258B40:
	movs r0, #0xe
	str r0, [r4]
	b _02258C28
_02258B46:
	movs r0, #0xb
	str r0, [r4]
	b _02258C28
_02258B4C:
	adds r0, r5, #0
	adds r0, #0xa0
	bl ov46_022593F8
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0x58
	bl ov46_02259374
	movs r1, #0x23
	ldr r0, [r5, #0xc]
	lsls r1, r1, #4
	bl ov46_02259550
	adds r5, #0xd0
	str r0, [r5]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258B74:
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl FUN_020168F4
	cmp r0, #1
	bne _02258B94
	adds r5, #0xd0
	ldr r0, [r5]
	bl FUN_02016624
	bl FUN_020397C8
	movs r0, #0xd
	str r0, [r4]
	b _02258C28
_02258B94:
	cmp r0, #2
	bne _02258C28
	adds r5, #0xd0
	ldr r0, [r5]
	bl FUN_02016624
	movs r0, #0xe
	str r0, [r4]
	b _02258C28
_02258BA6:
	bl FUN_02037D78
	cmp r0, #0
	bne _02258C28
	movs r0, #4
	str r0, [r4]
	b _02258C28
_02258BB4:
	adds r0, r5, #0
	adds r0, #0x40
	bl ov46_022593F8
	adds r0, r5, #0
	adds r0, #0x70
	bl ov46_022593F8
	adds r5, #0xa0
	adds r0, r5, #0
	bl ov46_022593F8
	bl FUN_020397C8
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258BD8:
	bl FUN_02037D78
	cmp r0, #0
	bne _02258C28
	adds r0, r5, #0
	adds r0, #0x40
	bl ov46_022593F8
	adds r5, #0x70
	adds r0, r5, #0
	bl ov46_022593F8
	movs r0, #7
	str r0, [r4]
	b _02258C28
_02258BF6:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x77
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258C28
_02258C16:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02258C28
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02258C24:
	bl GF_AssertFail
_02258C28:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02258C30: .4byte 0x0000FFFF
_02258C34: .4byte 0x021D110C
	thumb_func_end ov46_0225892C

	thumb_func_start ov46_02258C38
ov46_02258C38: @ 0x02258C38
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02258C68
	bl FUN_0200E390
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xd4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xd8
	str r1, [r0]
_02258C68:
	adds r0, r4, #0
	adds r0, #0x40
	bl ov46_02259494
	adds r0, r4, #0
	adds r0, #0x70
	bl ov46_02259494
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov46_02259494
	adds r0, r4, #0
	adds r0, #0x10
	bl ov46_02259494
	adds r0, r4, #0
	bl ov46_022592B8
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xd8
	str r1, [r0]
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0x77
	bl FUN_0201A9C4
	ldr r0, _02258CB0 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_02258CB0: .4byte 0x021D116C
	thumb_func_end ov46_02258C38

	thumb_func_start ov46_02258CB4
ov46_02258CB4: @ 0x02258CB4
	push {r4, r5, lr}
	sub sp, #0x1c
	movs r2, #2
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x77
	lsls r2, r2, #0x10
	bl FUN_0201A910
	ldr r1, _02258D98 @ =0x00000404
	adds r0, r5, #0
	movs r2, #0x77
	bl FUN_02007280
	ldr r2, _02258D98 @ =0x00000404
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r0, r5, #0
	bl FUN_020072A4
	ldr r0, [r0]
	movs r1, #0x77
	str r0, [r4]
	adds r0, r4, #0
	bl ov46_02258F78
	movs r0, #2
	str r0, [sp]
	movs r0, #0x13
	str r0, [sp, #4]
	movs r0, #0x1b
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r4]
	movs r3, #0x32
	str r0, [sp, #0x14]
	movs r0, #0x77
	str r0, [sp, #0x18]
	adds r0, r4, #0
	ldr r1, [r4, #0xc]
	adds r0, #0x40
	movs r2, #1
	lsls r3, r3, #4
	bl ov46_022592EC
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x17
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #0x94
	str r0, [sp, #0x10]
	ldr r0, [r4]
	movs r3, #0x32
	str r0, [sp, #0x14]
	movs r0, #0x77
	str r0, [sp, #0x18]
	adds r0, r4, #0
	ldr r1, [r4, #0xc]
	adds r0, #0xa0
	movs r2, #0
	lsls r3, r3, #4
	bl ov46_022592EC
	movs r0, #5
	str r0, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r0, #0x16
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0x81
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r3, _02258D9C @ =0x0000030A
	str r0, [sp, #0x14]
	movs r0, #0x77
	str r0, [sp, #0x18]
	adds r0, r4, #0
	ldr r1, [r4, #0xc]
	adds r0, #0x10
	bl ov46_022592EC
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #0x15
	bl ov46_022594E0
	bl FUN_0203A880
	ldr r0, _02258DA0 @ =ov46_02258F70
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	ldr r0, _02258DA4 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #1
	add sp, #0x1c
	pop {r4, r5, pc}
	nop
_02258D98: .4byte 0x00000404
_02258D9C: .4byte 0x0000030A
_02258DA0: .4byte ov46_02258F70
_02258DA4: .4byte 0x021D116C
	thumb_func_end ov46_02258CB4

	thumb_func_start ov46_02258DA8
ov46_02258DA8: @ 0x02258DA8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r4, r1, #0
	bl FUN_02007290
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_020072A4
	adds r6, r0, #0
	ldr r0, [r4]
	cmp r0, #0xa
	bls _02258DC6
	b _02258EF2
_02258DC6:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02258DD2: @ jump table
	.2byte _02258DE8 - _02258DD2 - 2 @ case 0
	.2byte _02258E06 - _02258DD2 - 2 @ case 1
	.2byte _02258E14 - _02258DD2 - 2 @ case 2
	.2byte _02258E4A - _02258DD2 - 2 @ case 3
	.2byte _02258E5A - _02258DD2 - 2 @ case 4
	.2byte _02258E74 - _02258DD2 - 2 @ case 5
	.2byte _02258E7E - _02258DD2 - 2 @ case 6
	.2byte _02258E9A - _02258DD2 - 2 @ case 7
	.2byte _02258EAE - _02258DD2 - 2 @ case 8
	.2byte _02258EBC - _02258DD2 - 2 @ case 9
	.2byte _02258EDC - _02258DD2 - 2 @ case 10
_02258DE8:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x77
	str r0, [sp, #8]
	ldr r3, _02258EF8 @ =0x0000FFFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258EF2
_02258E06:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02258EF2
	movs r0, #2
	str r0, [r4]
	b _02258EF2
_02258E14:
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0x1a
	bl ov46_02259374
	bl FUN_020393C8
	cmp r0, #0
	bne _02258E2E
	bl FUN_020397FC
	cmp r0, #0
	beq _02258E3C
_02258E2E:
	movs r0, #5
	adds r5, #0x40
	str r0, [r4]
	adds r0, r5, #0
	bl ov46_02259450
	b _02258EF2
_02258E3C:
	movs r0, #3
	adds r5, #0x40
	str r0, [r4]
	adds r0, r5, #0
	bl ov46_02259450
	b _02258EF2
_02258E4A:
	bl FUN_0222ED7C
	movs r0, #0xe1
	lsls r0, r0, #2
	str r0, [r5, #8]
	movs r0, #4
	str r0, [r4]
	b _02258EF2
_02258E5A:
	ldr r0, [r5, #8]
	subs r0, r0, #1
	str r0, [r5, #8]
	bl FUN_0222EDA8
	cmp r0, #0
	bne _02258E6E
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _02258EF2
_02258E6E:
	movs r0, #5
	str r0, [r4]
	b _02258EF2
_02258E74:
	bl FUN_020397C8
	movs r0, #6
	str r0, [r4]
	b _02258EF2
_02258E7E:
	bl FUN_02037D78
	cmp r0, #0
	bne _02258EF2
	adds r5, #0x70
	adds r0, r5, #0
	bl ov46_02259474
	ldr r0, [r6, #4]
	bl FUN_0222B270
	movs r0, #7
	str r0, [r4]
	b _02258EF2
_02258E9A:
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0x1b
	bl ov46_02259374
	movs r0, #0x5a
	str r0, [r5, #8]
	movs r0, #8
	str r0, [r4]
	b _02258EF2
_02258EAE:
	ldr r0, [r5, #8]
	subs r0, r0, #1
	str r0, [r5, #8]
	bne _02258EF2
	movs r0, #9
	str r0, [r4]
	b _02258EF2
_02258EBC:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x77
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258EF2
_02258EDC:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02258EF2
	adds r5, #0x40
	adds r0, r5, #0
	bl ov46_02259474
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_02258EF2:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02258EF8: .4byte 0x0000FFFF
	thumb_func_end ov46_02258DA8

	thumb_func_start ov46_02258EFC
ov46_02258EFC: @ 0x02258EFC
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02258F2C
	bl FUN_0200E390
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xd4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xd8
	str r1, [r0]
_02258F2C:
	adds r0, r4, #0
	adds r0, #0x40
	bl ov46_02259494
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov46_02259494
	adds r0, r4, #0
	adds r0, #0x10
	bl ov46_02259494
	adds r0, r4, #0
	bl ov46_022592B8
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xd8
	str r1, [r0]
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0x77
	bl FUN_0201A9C4
	ldr r0, _02258F6C @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_02258F6C: .4byte 0x021D116C
	thumb_func_end ov46_02258EFC

	thumb_func_start ov46_02258F70
ov46_02258F70: @ 0x02258F70
	ldr r3, _02258F74 @ =ov46_022592E0
	bx r3
	.align 2, 0
_02258F74: .4byte ov46_022592E0
	thumb_func_end ov46_02258F70

	thumb_func_start ov46_02258F78
ov46_02258F78: @ 0x02258F78
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	adds r6, r1, #0
	ldr r0, _022591F4 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r0, _022591F8 @ =0x04001050
	strh r1, [r0]
	ldr r0, _022591FC @ =0x022595B4
	bl FUN_02022BE8
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201C2D8
	ldr r0, _02259200 @ =0x022595A4
	bl FUN_0201ACB0
	adds r0, r6, #0
	bl FUN_0201AC88
	ldr r1, [sp, #0x10]
	ldr r4, _02259204 @ =0x022595DC
	ldr r5, _02259208 @ =_02259598
	str r0, [r1, #0xc]
	movs r7, #0
_02258FAE:
	ldr r0, [sp, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0xc]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r5]
	movs r1, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	adds r3, r6, #0
	bl FUN_0201C1C4
	ldr r0, [sp, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0xc]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r7, r7, #1
	adds r4, #0x1c
	adds r5, r5, #4
	cmp r7, #3
	blt _02258FAE
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	bl FUN_02028EA8
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	movs r1, #5
	lsrs r4, r0, #0x18
	movs r0, #0
	lsls r1, r1, #6
	adds r2, r6, #0
	bl FUN_02003030
	movs r1, #0x12
	movs r0, #0
	lsls r1, r1, #4
	adds r2, r6, #0
	bl FUN_0200304C
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	str r6, [sp, #4]
	ldr r0, [r0, #0xc]
	movs r1, #1
	movs r2, #0x1f
	movs r3, #0xc
	bl FUN_0200E3DC
	str r4, [sp]
	movs r1, #1
	ldr r0, [sp, #0x10]
	str r6, [sp, #4]
	ldr r0, [r0, #0xc]
	adds r2, r1, #0
	movs r3, #0xb
	bl FUN_0200E644
	movs r0, #0x12
	lsls r0, r0, #4
	str r0, [sp]
	movs r2, #0
	movs r0, #0x58
	movs r1, #3
	adds r3, r2, #0
	str r6, [sp, #4]
	bl FUN_02007938
	movs r0, #0x12
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #0x58
	movs r1, #3
	movs r2, #4
	movs r3, #0
	str r6, [sp, #4]
	bl FUN_02007938
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [sp, #0x10]
	str r6, [sp, #0xc]
	ldr r2, [r2, #0xc]
	movs r0, #0x58
	movs r1, #2
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [sp, #0x10]
	str r6, [sp, #0xc]
	ldr r2, [r2, #0xc]
	movs r0, #0x58
	movs r1, #0xb
	movs r3, #4
	bl FUN_020078F0
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [sp, #0x10]
	str r6, [sp, #0xc]
	ldr r2, [r2, #0xc]
	movs r0, #0x58
	movs r1, #6
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [sp, #0x10]
	str r6, [sp, #0xc]
	ldr r2, [r2, #0xc]
	movs r0, #0x58
	movs r1, #0xc
	movs r3, #4
	bl FUN_02007914
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x58
	adds r1, r6, #0
	bl FUN_02007688
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x10]
	movs r2, #0x33
	adds r0, #0xd4
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020D4994
	ldr r0, [sp, #0x2c]
	movs r1, #5
	add r2, sp, #0x38
	adds r3, r6, #0
	bl FUN_02007C48
	adds r4, r0, #0
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #0xc]
	adds r1, #0xdc
	movs r2, #0x80
	blx FUN_020D47B8
	ldr r0, [sp, #0x38]
	movs r2, #0x57
	ldr r1, [sp, #0x10]
	lsls r2, r2, #2
	adds r1, r1, r2
	ldr r0, [r0, #0xc]
	movs r2, #0x80
	blx FUN_020D47B8
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	movs r1, #0x57
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x10]
	lsls r1, r1, #2
	adds r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x14]
	adds r0, #0xdc
	str r0, [sp, #0x14]
_02259126:
	movs r0, #0
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	adds r0, r0, #1
	lsls r1, r0, #5
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	str r0, [sp, #0x30]
_02259138:
	ldr r0, [sp, #0x24]
	cmp r0, #0x15
	blt _02259142
	bl GF_AssertFail
_02259142:
	ldr r0, [sp, #0x30]
	movs r7, #1
	adds r6, r0, #2
	ldr r0, [sp, #0x18]
	adds r4, r0, #2
	ldr r0, [sp, #0x14]
	adds r5, r0, #2
	ldr r0, [sp, #0x20]
	asrs r0, r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x34]
_0225915A:
	adds r0, r6, #0
	adds r0, #0xdc
	ldrh r0, [r0]
	ldr r3, [sp, #0x34]
	adds r1, r4, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #1
	bl FUN_02003DE8
	adds r7, r7, #1
	adds r6, r6, #2
	adds r4, r4, #2
	adds r5, r5, #2
	cmp r7, #0x10
	blt _0225915A
	ldr r0, [sp, #0x18]
	adds r0, #0x20
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	adds r0, r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	beq _022591A6
	movs r0, #3
	ldr r1, [sp, #0x20]
	lsls r0, r0, #8
	adds r1, r1, r0
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [sp, #0x20]
	cmp r1, r0
	blt _02259138
	str r0, [sp, #0x20]
	movs r0, #1
	str r0, [sp, #0x1c]
	b _02259138
_022591A6:
	ldr r0, [sp, #0x14]
	adds r0, #0x20
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	adds r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _02259126
	movs r1, #0x57
	ldr r0, [sp, #0x10]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0x2a
	lsls r1, r1, #4
	blx FUN_020D2894
	ldr r0, [sp, #0x10]
	movs r1, #1
	adds r0, #0xd8
	str r1, [r0]
	ldr r0, [sp, #0x10]
	movs r2, #0
	lsls r1, r1, #0xa
	str r2, [r0, r1]
	ldr r1, [sp, #0x10]
	ldr r0, _0225920C @ =ov46_02259210
	adds r1, #0xd4
	movs r2, #0x14
	bl FUN_0200E33C
	ldr r1, [sp, #0x10]
	adds r1, #0xd4
	str r0, [r1]
	ldr r0, [sp, #0x2c]
	str r1, [sp, #0x10]
	bl FUN_0200770C
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022591F4: .4byte 0x04000050
_022591F8: .4byte 0x04001050
_022591FC: .4byte 0x022595B4
_02259200: .4byte 0x022595A4
_02259204: .4byte 0x022595DC
_02259208: .4byte _02259598
_0225920C: .4byte ov46_02259210
	thumb_func_end ov46_02258F78

	thumb_func_start ov46_02259210
ov46_02259210: @ 0x02259210
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022592AE
	ldr r1, _022592B0 @ =0x0000032B
	movs r0, #1
	ldrb r2, [r4, r1]
	eors r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	tst r0, r2
	bne _022592AE
	adds r0, r1, #1
	ldr r0, [r4, r0]
	cmp r0, #1
	bhi _02259246
	subs r0, r1, #3
	ldrsh r0, [r4, r0]
	adds r2, r4, #0
	adds r2, #0x88
	lsls r0, r0, #5
	adds r0, r2, r0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020CFC6C
_02259246:
	movs r0, #0xcb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02259254
	cmp r0, #2
	bne _0225926A
_02259254:
	movs r0, #0xca
	lsls r0, r0, #2
	ldrsh r0, [r4, r0]
	adds r1, r4, #0
	adds r1, #0x88
	lsls r0, r0, #5
	adds r0, r1, r0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020CFCC0
_0225926A:
	ldr r0, _022592B4 @ =0x0000032A
	ldrsb r1, [r4, r0]
	cmp r1, #0
	bne _02259292
	subs r1, r0, #2
	ldrsh r1, [r4, r1]
	adds r2, r1, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0x15
	blt _022592AE
	movs r2, #0x13
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r2, [r4, r0]
	movs r1, #1
	eors r1, r2
	strb r1, [r4, r0]
	pop {r4, pc}
_02259292:
	subs r1, r0, #2
	ldrsh r1, [r4, r1]
	subs r2, r1, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bge _022592AE
	movs r2, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r1, [r4, r0]
	eors r1, r2
	strb r1, [r4, r0]
_022592AE:
	pop {r4, pc}
	.align 2, 0
_022592B0: .4byte 0x0000032B
_022592B4: .4byte 0x0000032A
	thumb_func_end ov46_02259210

	thumb_func_start ov46_022592B8
ov46_022592B8: @ 0x022592B8
	push {r4, r5, r6, lr}
	ldr r5, _022592DC @ =_02259598
	adds r6, r0, #0
	movs r4, #0
_022592C0:
	ldr r1, [r5]
	ldr r0, [r6, #0xc]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB4C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _022592C0
	ldr r0, [r6, #0xc]
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
_022592DC: .4byte _02259598
	thumb_func_end ov46_022592B8

	thumb_func_start ov46_022592E0
ov46_022592E0: @ 0x022592E0
	ldr r3, _022592E8 @ =FUN_0201EEB4
	ldr r0, [r0, #0xc]
	bx r3
	nop
_022592E8: .4byte FUN_0201EEB4
	thumb_func_end ov46_022592E0

	thumb_func_start ov46_022592EC
ov46_022592EC: @ 0x022592EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r4, [sp, #0x48]
	adds r5, r0, #0
	str r3, [sp, #0x14]
	adds r0, r4, #0
	adds r7, r1, #0
	adds r6, r2, #0
	bl FUN_0200BD08
	str r0, [r5]
	ldr r2, [sp, #0x14]
	movs r0, #0
	movs r1, #0x1b
	adds r3, r4, #0
	bl FUN_0200BAF8
	str r0, [r5, #4]
	movs r0, #1
	lsls r0, r0, #8
	adds r1, r4, #0
	bl FUN_02026354
	str r0, [r5, #0x18]
	movs r0, #1
	lsls r0, r0, #8
	adds r1, r4, #0
	bl FUN_02026354
	str r0, [r5, #0x1c]
	ldr r0, [sp, #0x44]
	str r6, [r5, #0x20]
	bl FUN_02028EA8
	bl FUN_0202AD3C
	str r0, [r5, #0x28]
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, [sp, #0x34]
	ldr r3, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x38]
	adds r5, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x3c]
	lsls r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #9
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x40]
	adds r1, r5, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r7, #0
	movs r2, #1
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov46_022592EC

	thumb_func_start ov46_02259374
ov46_02259374: @ 0x02259374
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _02259394
	ldr r0, [r5, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_02259394:
	adds r0, r5, #0
	adds r0, #8
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x1c]
	adds r1, r4, #0
	bl FUN_0200BB6C
	ldr r0, [r5]
	ldr r1, [r5, #0x18]
	ldr r2, [r5, #0x1c]
	bl FUN_0200CBBC
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r5, #0
	ldr r2, [r5, #0x18]
	adds r0, #8
	movs r1, #1
	bl FUN_020200A8
	ldr r0, [r5, #0x20]
	cmp r0, #0
	bne _022593DE
	adds r0, r5, #0
	adds r0, #8
	movs r1, #1
	movs r2, #0x1f
	movs r3, #0xc
	bl FUN_0200E580
	b _022593EC
_022593DE:
	adds r0, r5, #0
	movs r1, #1
	adds r0, #8
	adds r2, r1, #0
	movs r3, #0xb
	bl FUN_0200E998
_022593EC:
	adds r5, #8
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov46_02259374

	thumb_func_start ov46_022593F8
ov46_022593F8: @ 0x022593F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _02259414
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_02259414:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bne _0225942E
	adds r0, r4, #0
	adds r0, #8
	movs r1, #1
	bl FUN_0200E5D4
	adds r4, #8
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
_0225942E:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _0225943A
	adds r0, r4, #0
	bl ov46_02259474
_0225943A:
	adds r0, r4, #0
	adds r0, #8
	movs r1, #1
	bl FUN_0200E9BC
	adds r4, #8
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov46_022593F8

	thumb_func_start ov46_02259450
ov46_02259450: @ 0x02259450
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #1
	bne _02259470
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _02259464
	bl GF_AssertFail
_02259464:
	adds r0, r4, #0
	adds r0, #8
	movs r1, #1
	bl FUN_0200F0AC
	str r0, [r4, #0x24]
_02259470:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov46_02259450

	thumb_func_start ov46_02259474
ov46_02259474: @ 0x02259474
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #1
	bne _02259492
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _02259488
	bl GF_AssertFail
_02259488:
	ldr r0, [r4, #0x24]
	bl FUN_0200F450
	movs r0, #0
	str r0, [r4, #0x24]
_02259492:
	pop {r4, pc}
	thumb_func_end ov46_02259474

	thumb_func_start ov46_02259494
ov46_02259494: @ 0x02259494
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _022594B0
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_022594B0:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _022594BC
	adds r0, r4, #0
	bl ov46_02259474
_022594BC:
	adds r0, r4, #0
	adds r0, #8
	bl FUN_0201D520
	ldr r0, [r4, #0x1c]
	bl FUN_02026380
	ldr r0, [r4, #0x18]
	bl FUN_02026380
	ldr r0, [r4, #4]
	bl FUN_0200BB44
	ldr r0, [r4]
	bl FUN_0200BDA0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov46_02259494

	thumb_func_start ov46_022594E0
ov46_022594E0: @ 0x022594E0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, #8
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x1c]
	adds r1, r5, #0
	bl FUN_0200BB6C
	ldr r0, [r4]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x1c]
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [r4, #0x18]
	adds r2, r0, #0
	movs r3, #0xb0
	bl FUN_020030A0
	movs r1, #0
	adds r3, r0, #0
	str r1, [sp]
	ldr r0, _02259530 @ =0x000F0E00
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	ldr r2, [r4, #0x18]
	adds r0, #8
	movs r1, #1
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02259530: .4byte 0x000F0E00
	thumb_func_end ov46_022594E0

	thumb_func_start ov46_02259534
ov46_02259534: @ 0x02259534
	push {r3, lr}
	sub sp, #8
	adds r2, r1, #0
	movs r1, #2
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r0, [r0]
	movs r1, #0
	movs r3, #5
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov46_02259534

	thumb_func_start ov46_02259550
ov46_02259550: @ 0x02259550
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0x77
	adds r4, r1, #0
	bl FUN_0201660C
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #0xd
	str r1, [sp, #0xc]
	str r5, [sp]
	str r4, [sp, #8]
	movs r1, #0x19
	add r2, sp, #0
	strb r1, [r2, #0x10]
	movs r1, #0xa
	strb r1, [r2, #0x11]
	ldrb r3, [r2, #0x12]
	movs r1, #0xf
	adds r6, r0, #0
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
	adds r0, r6, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov46_02259550

	.rodata

_02259598:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
