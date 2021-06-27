	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov13_022208E8
ov13_022208E8: @ 0x022208E8
	push {r3, lr}
	ldr r1, _022208F4 @ =0x0224DD80
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	nop
_022208F4: .4byte 0x0224DD80
	thumb_func_end ov13_022208E8

	thumb_func_start ov13_022208F8
ov13_022208F8: @ 0x022208F8
	push {r3, lr}
	ldr r1, _02220904 @ =0x0224DD8C
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	nop
_02220904: .4byte 0x0224DD8C
	thumb_func_end ov13_022208F8

	thumb_func_start ov13_02220908
ov13_02220908: @ 0x02220908
	push {r4, lr}
	ldr r2, _022209DC @ =0x00000106
	adds r4, r0, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _02220958
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	blt _02220958
	adds r0, r2, #2
	ldrsh r0, [r4, r0]
	cmp r0, r1
	blt _02220958
	adds r0, r2, #4
	ldrsh r0, [r4, r0]
	cmp r0, #0
	beq _02220958
	cmp r0, r1
	blt _02220958
	adds r0, r2, #6
	ldrsh r0, [r4, r0]
	cmp r0, r1
	blt _02220958
	adds r0, r2, #0
	adds r0, #8
	ldrsh r0, [r4, r0]
	cmp r0, r1
	blt _02220958
	ldrh r1, [r4, #4]
	cmp r1, #0
	beq _02220958
	subs r0, r2, #6
	cmp r1, r0
	bhi _02220958
	subs r0, r1, #1
	adds r0, r4, r0
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _0222095E
_02220958:
	movs r1, #0
	mvns r1, r1
	b _02220960
_0222095E:
	movs r1, #0
_02220960:
	ldr r0, _022209E0 @ =0x0224DD80
	ldr r0, [r0]
	cmp r0, #0
	beq _02220970
	ldr r0, _022209E4 @ =0x0224DD8C
	ldr r0, [r0]
	cmp r0, #0
	bne _02220974
_02220970:
	movs r1, #0
	mvns r1, r1
_02220974:
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	bne _0222098C
	ldr r0, _022209E8 @ =0x00000116
	movs r1, #0xf
	strb r1, [r4, r0]
	bl ov13_02221428
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
_0222098C:
	ldr r0, _022209EC @ =0x000005F8
	bl ov13_022208E8
	ldr r1, _022209F0 @ =0x0224CF98
	cmp r0, #0
	str r0, [r1, #0x14]
	bne _022209AA
	ldr r0, _022209E8 @ =0x00000116
	movs r1, #0xf
	strb r1, [r4, r0]
	bl ov13_02221428
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
_022209AA:
	movs r0, #0
	mvns r0, r0
	bl ov13_022217D0
	adds r0, r4, #0
	bl ov13_022209F8
	adds r4, r0, #0
	ldr r0, _022209F0 @ =0x0224CF98
	ldr r0, [r0, #0x14]
	bl ov13_022208F8
	bl ov13_02221428
	ldr r0, _022209F4 @ =0x022459B4
	movs r1, #0
	ldr r0, [r0]
	mvns r1, r1
	cmp r0, r1
	beq _022209D6
	bl ov13_02222A14
_022209D6:
	adds r0, r4, #0
	pop {r4, pc}
	nop
_022209DC: .4byte 0x00000106
_022209E0: .4byte 0x0224DD80
_022209E4: .4byte 0x0224DD8C
_022209E8: .4byte 0x00000116
_022209EC: .4byte 0x000005F8
_022209F0: .4byte 0x0224CF98
_022209F4: .4byte 0x022459B4
	thumb_func_end ov13_02220908

	thumb_func_start ov13_022209F8
ov13_022209F8: @ 0x022209F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xc8
	ldr r1, _02220D4C @ =0x0224267C
	str r0, [sp, #8]
	ldrh r2, [r1]
	ldrh r1, [r1, #2]
	add r0, sp, #0x2c
	strh r2, [r0, #0x30]
	strh r1, [r0, #0x32]
	movs r0, #0
	add r1, sp, #0x58
	strh r0, [r1]
	str r0, [sp, #0x24]
	strh r0, [r1, #2]
	movs r0, #1
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x50]
	str r0, [sp, #0x1c]
	add r0, sp, #0xb0
	movs r2, #0x18
	bl ov13_02222978
	ldr r1, _02220D50 @ =0x00000106
	ldr r0, [sp, #8]
	ldrsh r0, [r0, r1]
	add r1, sp, #0x2c
	strh r0, [r1, #0x30]
	movs r0, #0x30
	ldrsh r2, [r1, r0]
	subs r0, #0x31
	cmp r2, r0
	bne _02220A40
	movs r0, #0xa
	strh r0, [r1, #0x30]
_02220A40:
	ldr r1, _02220D54 @ =0x0000010A
	ldr r0, [sp, #8]
	ldrsh r0, [r0, r1]
	add r1, sp, #0x2c
	strh r0, [r1, #0x2c]
	movs r0, #0x2c
	ldrsh r2, [r1, r0]
	subs r0, #0x2d
	cmp r2, r0
	bne _02220A58
	movs r0, #0xa
	strh r0, [r1, #0x2c]
_02220A58:
	movs r1, #0x42
	ldr r0, [sp, #8]
	lsls r1, r1, #2
	ldrsh r0, [r0, r1]
	add r1, sp, #0x2c
	strh r0, [r1, #0x32]
	movs r0, #0x32
	ldrsh r2, [r1, r0]
	subs r0, #0x33
	cmp r2, r0
	bne _02220A72
	movs r0, #0x64
	strh r0, [r1, #0x32]
_02220A72:
	movs r1, #0x43
	ldr r0, [sp, #8]
	lsls r1, r1, #2
	ldrsh r0, [r0, r1]
	add r1, sp, #0x2c
	strh r0, [r1, #0x2e]
	movs r0, #0x2e
	ldrsh r2, [r1, r0]
	subs r0, #0x2f
	cmp r2, r0
	bne _02220A8C
	movs r0, #0x64
	strh r0, [r1, #0x2e]
_02220A8C:
	ldr r1, _02220D58 @ =0x0000010E
	ldr r0, [sp, #8]
	ldrsh r0, [r0, r1]
	movs r1, #0
	mvns r1, r1
	str r0, [sp, #0xc]
	cmp r0, r1
	bne _02220AA2
	movs r0, #0x7d
	lsls r0, r0, #4
	str r0, [sp, #0xc]
_02220AA2:
	ldr r0, [sp, #8]
	bl ov13_02221454
	ldr r0, _02220D5C @ =0x0224CF98
	ldr r1, [r0, #0x2c]
	movs r0, #1
	ands r0, r1
	cmp r0, #1
	beq _02220ACE
	movs r0, #0x13
	bl ov13_022214AC
	ldr r1, _02220D60 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220ACE:
	movs r4, #0
	adds r0, r4, #0
	bl ov13_022217D0
	add r1, sp, #0x2c
	movs r0, #0x32
	ldrsh r6, [r1, r0]
	movs r0, #0x30
	ldrsh r7, [r1, r0]
	ldr r5, _02220D5C @ =0x0224CF98
_02220AE2:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _02220AF0
	bl ov13_022208F8
	movs r0, #0
	str r0, [r5, #4]
_02220AF0:
	ldr r0, _02220D64 @ =0x0224CF9C
	bl ov13_02222DB0
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _02220B12
	ldr r1, _02220D60 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220B12:
	ldr r0, [r5, #4]
	bl ov13_022216E0
	cmp r0, #4
	bne _02220B30
	ldr r1, _02220D60 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #2
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220B30:
	cmp r0, #0
	beq _02220B5A
	cmp r4, r7
	blt _02220B4C
	ldr r1, _02220D60 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #1
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220B4C:
	adds r0, r6, #0
	bl ov13_022230F8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	b _02220AE2
_02220B5A:
	movs r0, #1
	bl ov13_022217D0
	add r0, sp, #0x74
	movs r1, #0
	movs r2, #0x3c
	bl ov13_02222978
	add r0, sp, #0x74
	bl ov13_0222175C
	cmp r0, #0
	beq _02220B88
	ldr r1, _02220D60 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220B88:
	movs r0, #0x58
	bl ov13_022208E8
	ldr r1, _02220D5C @ =0x0224CF98
	cmp r0, #0
	str r0, [r1, #0xc]
	bne _02220BAA
	ldr r1, _02220D60 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220BAA:
	movs r1, #0
	movs r2, #0x58
	bl ov13_02222978
	add r1, sp, #0x2c
	movs r0, #0x30
	ldrsh r5, [r1, r0]
	movs r4, #0
	cmp r5, #0
	ble _02220C02
	ldr r7, _02220D5C @ =0x0224CF98
_02220BC0:
	ldr r1, [r7, #0xc]
	add r0, sp, #0x74
	bl ov13_02222F28
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _02220BE4
	ldr r1, _02220D60 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220BE4:
	cmp r0, #0
	bne _02220BF2
	bne _02220C02
	ldr r0, [r7, #0xc]
	ldr r0, [r0]
	cmp r0, #1
	beq _02220C02
_02220BF2:
	adds r0, r6, #0
	bl ov13_022230F8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, r5
	blt _02220BC0
_02220C02:
	add r0, sp, #0x2c
	movs r1, #0x30
	ldrsh r0, [r0, r1]
	cmp r4, r0
	bne _02220C20
	ldr r0, [sp, #8]
	movs r2, #0xf
	adds r1, #0xe6
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220C20:
	ldr r0, _02220D68 @ =0xC0A80B65
	movs r1, #0xff
	mvns r1, r1
	adds r2, r0, #0
	bl ov13_022228CC
	cmp r0, #0
	beq _02220C4A
	movs r0, #0xc
	bl ov13_022214AC
	ldr r1, _02220D60 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220C4A:
	bl ov13_02221428
	movs r3, #0x11
	ldr r2, [sp, #8]
	lsls r3, r3, #4
	movs r0, #3
	add r1, sp, #0xb0
	adds r2, r2, r3
	bl ov13_022217A0
	movs r0, #2
	adds r1, r0, #0
	movs r2, #0
	bl ov13_02222A00
	ldr r1, _02220D6C @ =0x022459B4
	cmp r0, #0
	str r0, [r1]
	bge _02220C84
	ldr r1, _02220D60 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220C84:
	movs r1, #4
	str r1, [sp]
	ldr r1, _02220D70 @ =0x0000FFFF
	movs r2, #1
	add r3, sp, #0x54
	bl ov13_022229FC
	cmp r0, #0
	bge _02220CB0
	movs r0, #0xb
	bl ov13_022214AC
	ldr r1, _02220D60 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220CB0:
	add r0, sp, #0x2c
	movs r1, #0
	movs r2, #8
	bl ov13_02222978
	movs r1, #2
	add r0, sp, #0x2c
	strb r1, [r0, #1]
	ldr r0, _02220D68 @ =0xC0A80B65
	bl ov13_02222A1C
	str r0, [sp, #0x30]
	ldr r0, _02220D74 @ =0x00005790
	bl ov13_02222A44
	add r1, sp, #0x2c
	strh r0, [r1, #2]
	ldr r0, _02220D6C @ =0x022459B4
	add r1, sp, #0x2c
	ldr r0, [r0]
	movs r2, #8
	bl ov13_02222A08
	cmp r0, #0
	bge _02220CF6
	ldr r1, _02220D60 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220CF6:
	ldr r0, _02220D5C @ =0x0224CF98
	movs r1, #0
	ldr r0, [r0, #0x14]
	movs r2, #0x14
	str r0, [sp, #0x18]
	add r0, sp, #0x60
	bl ov13_02222978
	ldr r0, _02220D68 @ =0xC0A80B65
	movs r1, #0xfa
	str r0, [sp, #0x70]
	subs r0, #0x64
	str r0, [sp, #0x60]
	ldr r0, [sp, #0xc]
	lsls r1, r1, #2
	blx FUN_020F2998
	str r0, [sp, #0x14]
	movs r1, #0xfa
	ldr r0, [sp, #0xc]
	lsls r1, r1, #2
	blx FUN_020F2998
	movs r0, #0xfa
	lsls r0, r0, #2
	muls r0, r1, r0
	str r0, [sp, #0x10]
	movs r1, #0x30
	add r0, sp, #0x2c
	ldrsh r7, [r0, r1]
	ldr r5, _02220D5C @ =0x0224CF98
_02220D34:
	ldr r0, [sp, #0x24]
	cmp r0, #1
	bne _02220D44
	ldr r1, _02220D78 @ =0x0224CFB8
	movs r0, #0x1c
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _02220D46
_02220D44:
	b _02220FC0
_02220D46:
	ldr r0, _02220D6C @ =0x022459B4
	b _02220D7C
	nop
_02220D4C: .4byte 0x0224267C
_02220D50: .4byte 0x00000106
_02220D54: .4byte 0x0000010A
_02220D58: .4byte 0x0000010E
_02220D5C: .4byte 0x0224CF98
_02220D60: .4byte 0x00000116
_02220D64: .4byte 0x0224CF9C
_02220D68: .4byte 0xC0A80B65
_02220D6C: .4byte 0x022459B4
_02220D70: .4byte 0x0000FFFF
_02220D74: .4byte 0x00005790
_02220D78: .4byte 0x0224CFB8
_02220D7C:
	movs r1, #0
	ldr r0, [r0]
	mvns r1, r1
	cmp r0, r1
	beq _02220D8A
	bl ov13_02222A14
_02220D8A:
	movs r1, #0
	ldr r0, _022210BC @ =0x022459B4
	mvns r1, r1
	str r1, [r0]
	bl ov13_02222924
	cmp r0, #0
	beq _02220DAE
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220DAE:
	movs r0, #0x58
	bl ov13_022208E8
	str r0, [r5, #4]
	cmp r0, #0
	bne _02220DCE
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220DCE:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _02220DDC
	bl ov13_022208F8
	movs r0, #0
	str r0, [r5, #4]
_02220DDC:
	ldr r0, _022210C4 @ =0x0224CF9C
	bl ov13_02222DB0
	movs r1, #0
	mvns r1, r1
	str r0, [sp, #0x28]
	cmp r0, r1
	bne _02220E00
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220E00:
	ldr r0, [r5, #4]
	bl ov13_022216E0
	cmp r0, #4
	bne _02220E1E
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #2
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220E1E:
	cmp r0, #0
	beq _02220E48
	cmp r4, r7
	blt _02220E3A
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #1
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220E3A:
	adds r0, r6, #0
	bl ov13_022230F8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	b _02220DCE
_02220E48:
	movs r0, #0
	ldr r1, [sp, #0x28]
	mvns r0, r0
	cmp r1, r0
	bne _02220E66
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220E66:
	movs r0, #0x58
	bl ov13_022208E8
	str r0, [r5, #0xc]
	cmp r0, #0
	bne _02220E86
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220E86:
	movs r1, #0
	movs r2, #0x58
	bl ov13_02222978
	movs r4, #0
	cmp r7, #0
	ble _02220ED6
_02220E94:
	ldr r1, [r5, #0xc]
	add r0, sp, #0x74
	bl ov13_02222F28
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _02220EB8
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220EB8:
	cmp r0, #0
	bne _02220EC6
	bne _02220ED6
	ldr r0, [r5, #0xc]
	ldr r0, [r0]
	cmp r0, #1
	beq _02220ED6
_02220EC6:
	adds r0, r6, #0
	bl ov13_022230F8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, r7
	blt _02220E94
_02220ED6:
	cmp r4, r7
	bne _02220EEE
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220EEE:
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl ov13_02221410
	ldr r1, [r5, #0x38]
	adds r2, r0, #0
	str r0, [sp, #0x1c]
	bl ov13_022228CC
	cmp r0, #0
	beq _02220F1E
	movs r0, #0xc
	bl ov13_022214AC
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220F1E:
	ldr r0, _022210C8 @ =0x0224CFB8
	movs r1, #1
	strb r1, [r0, #0x1c]
	bl ov13_02221428
	movs r0, #2
	adds r1, r0, #0
	movs r2, #0
	bl ov13_02222A00
	ldr r1, _022210BC @ =0x022459B4
	cmp r0, #0
	str r0, [r1]
	bge _02220F4E
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220F4E:
	movs r1, #4
	str r1, [sp]
	ldr r1, _022210CC @ =0x0000FFFF
	movs r2, #1
	add r3, sp, #0x54
	bl ov13_022229FC
	cmp r0, #0
	bge _02220F7A
	movs r0, #0xb
	bl ov13_022214AC
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220F7A:
	add r0, sp, #0x2c
	movs r1, #0
	movs r2, #8
	bl ov13_02222978
	movs r1, #2
	add r0, sp, #0x2c
	strb r1, [r0, #1]
	ldr r0, [sp, #0x1c]
	bl ov13_02222A1C
	str r0, [sp, #0x30]
	ldr r0, _022210D0 @ =0x00005790
	bl ov13_02222A44
	add r1, sp, #0x2c
	strh r0, [r1, #2]
	ldr r0, _022210BC @ =0x022459B4
	add r1, sp, #0x2c
	ldr r0, [r0]
	movs r2, #8
	bl ov13_02222A08
	cmp r0, #0
	bge _02220FC0
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220FC0:
	ldr r3, _022210BC @ =0x022459B4
	ldr r0, [sp, #0x24]
	ldr r3, [r3]
	add r1, sp, #0x60
	add r2, sp, #0xb0
	bl ov13_022220B4
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _02220FF6
	movs r1, #1
	ldr r0, [sp, #0x24]
	lsls r1, r1, #0xc
	adds r0, r0, r1
	bl ov13_022214AC
	ldr r1, _022210C0 @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220FF6:
	ldr r0, [sp, #0x18]
	ldr r2, _022210D4 @ =0x000005F8
	movs r1, #0
	bl ov13_02222978
	add r0, sp, #0x3c
	bl ov13_02222B20
	ldr r0, _022210BC @ =0x022459B4
	add r1, sp, #0x3c
	ldr r0, [r0]
	bl ov13_02222B2C
	ldr r0, [sp, #0x14]
	movs r2, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x10]
	add r1, sp, #0x3c
	str r0, [sp, #0x38]
	add r0, sp, #0x34
	str r0, [sp]
	ldr r0, _022210BC @ =0x022459B4
	adds r3, r2, #0
	ldr r0, [r0]
	adds r0, r0, #1
	bl ov13_02222998
	cmp r0, #0
	bgt _02221070
	ldr r0, [sp, #0x50]
	add r1, sp, #0x2c
	adds r2, r0, #1
	str r2, [sp, #0x50]
	movs r0, #0x2c
	ldrsh r0, [r1, r0]
	cmp r2, r0
	ble _02221066
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _0222104E
	movs r0, #0xf
	bl ov13_022214AC
	b _02221060
_0222104E:
	cmp r0, #1
	bne _0222105A
	movs r0, #0x10
	bl ov13_022214AC
	b _02221060
_0222105A:
	movs r0, #0x11
	bl ov13_022214AC
_02221060:
	movs r5, #0
	mvns r5, r5
	b _0222134E
_02221066:
	movs r0, #0x2e
	ldrsh r0, [r1, r0]
	bl ov13_022230F8
	b _02220D34
_02221070:
	movs r0, #8
	str r0, [sp, #0x44]
	add r0, sp, #0x48
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	ldr r0, _022210BC @ =0x022459B4
	ldr r1, [sp, #0x18]
	ldr r0, [r0]
	ldr r2, _022210D8 @ =0x000005DC
	adds r1, #0xc
	movs r3, #0
	bl ov13_02222984
	ldr r1, _022210BC @ =0x022459B4
	lsls r0, r0, #0x10
	ldr r2, [r1]
	ldr r1, [sp, #0x18]
	lsrs r0, r0, #0x10
	str r2, [r1]
	bl ov13_02222A84
	ldr r1, [sp, #0x18]
	add r2, sp, #0x50
	str r0, [r1, #4]
	ldr r0, _022210BC @ =0x022459B4
	add r3, sp, #0xb0
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, [sp, #0x24]
	bl ov13_022217FC
	str r0, [sp, #0x20]
	cmp r0, #0x64
	bne _022210DC
	movs r5, #0
	b _0222134E
	nop
_022210BC: .4byte 0x022459B4
_022210C0: .4byte 0x00000116
_022210C4: .4byte 0x0224CF9C
_022210C8: .4byte 0x0224CFB8
_022210CC: .4byte 0x0000FFFF
_022210D0: .4byte 0x00005790
_022210D4: .4byte 0x000005F8
_022210D8: .4byte 0x000005DC
_022210DC:
	movs r5, #0
	mvns r5, r5
	cmp r0, r5
	bne _022210E6
	b _0222134E
_022210E6:
	ldr r1, [sp, #0x24]
	cmp r1, r0
	bne _022210EE
	b _02221310
_022210EE:
	cmp r0, #2
	beq _022210F4
	b _0222130A
_022210F4:
	ldr r0, _022213F8 @ =0x022459B4
	ldr r0, [r0]
	cmp r0, r5
	beq _02221100
	bl ov13_02222A14
_02221100:
	movs r1, #0
	ldr r0, _022213F8 @ =0x022459B4
	mvns r1, r1
	str r1, [r0]
	bl ov13_02222924
	cmp r0, #0
	beq _02221124
	ldr r1, _022213FC @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221124:
	movs r0, #4
	movs r4, #0
	bl ov13_022217D0
	add r1, sp, #0x2c
	movs r0, #0x30
	ldrsh r7, [r1, r0]
	ldr r5, _02221400 @ =0x0224CF98
_02221134:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _02221142
	bl ov13_022208F8
	movs r0, #0
	str r0, [r5, #4]
_02221142:
	ldr r0, _02221404 @ =0x0224CF9C
	bl ov13_02222DB0
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _02221164
	ldr r1, _022213FC @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221164:
	ldr r0, [r5, #4]
	bl ov13_022216E0
	cmp r0, #4
	bne _02221182
	ldr r1, _022213FC @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #2
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221182:
	cmp r0, #0
	beq _022211AC
	cmp r4, r7
	blt _0222119E
	ldr r1, _022213FC @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #1
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0222119E:
	adds r0, r6, #0
	bl ov13_022230F8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	b _02221134
_022211AC:
	movs r0, #0x58
	bl ov13_022208E8
	ldr r1, _02221400 @ =0x0224CF98
	cmp r0, #0
	str r0, [r1, #0xc]
	bne _022211CE
	ldr r1, _022213FC @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022211CE:
	movs r1, #0
	movs r2, #0x58
	bl ov13_02222978
	add r1, sp, #0x2c
	movs r0, #0x30
	ldrsh r5, [r1, r0]
	movs r4, #0
	cmp r5, #0
	ble _02221226
	ldr r7, _02221400 @ =0x0224CF98
_022211E4:
	ldr r1, [r7, #0xc]
	add r0, sp, #0x74
	bl ov13_02222F28
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _02221208
	ldr r1, _022213FC @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221208:
	cmp r0, #0
	bne _02221216
	bne _02221226
	ldr r0, [r7, #0xc]
	ldr r0, [r0]
	cmp r0, #1
	beq _02221226
_02221216:
	adds r0, r6, #0
	bl ov13_022230F8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, r5
	blt _022211E4
_02221226:
	add r0, sp, #0x2c
	movs r1, #0x30
	ldrsh r0, [r0, r1]
	cmp r4, r0
	bne _02221244
	ldr r0, [sp, #8]
	movs r2, #0xf
	adds r1, #0xe6
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221244:
	ldr r1, _02221400 @ =0x0224CF98
	ldr r0, [sp, #0x1c]
	ldr r1, [r1, #0x38]
	adds r2, r0, #0
	bl ov13_022228CC
	cmp r0, #0
	beq _0222126E
	movs r0, #0xc
	bl ov13_022214AC
	ldr r1, _022213FC @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0222126E:
	bl ov13_02221428
	movs r0, #2
	adds r1, r0, #0
	movs r2, #0
	bl ov13_02222A00
	ldr r1, _022213F8 @ =0x022459B4
	cmp r0, #0
	str r0, [r1]
	bge _02221298
	ldr r1, _022213FC @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221298:
	movs r1, #4
	str r1, [sp]
	ldr r1, _02221408 @ =0x0000FFFF
	movs r2, #1
	add r3, sp, #0x54
	bl ov13_022229FC
	cmp r0, #0
	bge _022212C4
	movs r0, #0xb
	bl ov13_022214AC
	ldr r1, _022213FC @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022212C4:
	add r0, sp, #0x2c
	movs r1, #0
	movs r2, #8
	bl ov13_02222978
	movs r1, #2
	add r0, sp, #0x2c
	strb r1, [r0, #1]
	ldr r0, [sp, #0x1c]
	bl ov13_02222A1C
	str r0, [sp, #0x30]
	ldr r0, _0222140C @ =0x00005790
	bl ov13_02222A44
	add r1, sp, #0x2c
	strh r0, [r1, #2]
	ldr r0, _022213F8 @ =0x022459B4
	add r1, sp, #0x2c
	ldr r0, [r0]
	movs r2, #8
	bl ov13_02222A08
	cmp r0, #0
	bge _0222130A
	ldr r1, _022213FC @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0222130A:
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x24]
	b _02220CF6
_02221310:
	str r0, [sp, #0x24]
	add r1, sp, #0x2c
	movs r0, #0x2c
	ldrsh r0, [r1, r0]
	ldr r2, [sp, #0x50]
	cmp r2, r0
	ble _02221344
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _0222132C
	movs r0, #0xf
	bl ov13_022214AC
	b _0222133E
_0222132C:
	cmp r0, #1
	bne _02221338
	movs r0, #0x10
	bl ov13_022214AC
	b _0222133E
_02221338:
	movs r0, #0x11
	bl ov13_022214AC
_0222133E:
	movs r5, #0
	mvns r5, r5
	b _0222134E
_02221344:
	movs r0, #0x2e
	ldrsh r0, [r1, r0]
	bl ov13_022230F8
	b _02220CF6
_0222134E:
	ldr r0, _022213F8 @ =0x022459B4
	movs r1, #0
	ldr r0, [r0]
	mvns r1, r1
	cmp r0, r1
	beq _0222135E
	bl ov13_02222A14
_0222135E:
	movs r1, #0
	ldr r0, _022213F8 @ =0x022459B4
	mvns r1, r1
	str r1, [r0]
	bl ov13_02222924
	cmp r0, #0
	beq _02221382
	ldr r1, _022213FC @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221382:
	cmp r5, #0
	beq _022213D2
	bl ov13_022214B8
	subs r0, #0xf
	cmp r0, #6
	bhi _022213BE
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222139C: @ jump table
	.2byte _022213AA - _0222139C - 2 @ case 0
	.2byte _022213AE - _0222139C - 2 @ case 1
	.2byte _022213B2 - _0222139C - 2 @ case 2
	.2byte _022213BE - _0222139C - 2 @ case 3
	.2byte _022213BE - _0222139C - 2 @ case 4
	.2byte _022213B6 - _0222139C - 2 @ case 5
	.2byte _022213BA - _0222139C - 2 @ case 6
_022213AA:
	movs r2, #3
	b _022213C0
_022213AE:
	movs r2, #4
	b _022213C0
_022213B2:
	movs r2, #5
	b _022213C0
_022213B6:
	movs r2, #7
	b _022213C0
_022213BA:
	movs r2, #8
	b _022213C0
_022213BE:
	movs r2, #0xf
_022213C0:
	ldr r1, _022213FC @ =0x00000116
	ldr r0, [sp, #8]
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022213D2:
	ldr r0, [sp, #8]
	bl ov13_022214C4
	cmp r0, #0
	beq _022213F0
	ldr r1, _022213FC @ =0x00000116
	ldr r0, [sp, #8]
	movs r2, #6
	strb r2, [r0, r1]
	bl ov13_02221428
	movs r0, #0
	add sp, #0xc8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022213F0:
	movs r0, #0
	add sp, #0xc8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022213F8: .4byte 0x022459B4
_022213FC: .4byte 0x00000116
_02221400: .4byte 0x0224CF98
_02221404: .4byte 0x0224CF9C
_02221408: .4byte 0x0000FFFF
_0222140C: .4byte 0x00005790
	thumb_func_end ov13_022209F8

	thumb_func_start ov13_02221410
ov13_02221410: @ 0x02221410
	adds r2, r0, #0
	ands r2, r1
	mvns r1, r1
	ands r0, r1
	adds r0, r0, #1
	orrs r0, r2
	orrs r1, r2
	cmp r0, r1
	blo _02221426
	movs r0, #1
	orrs r0, r2
_02221426:
	bx lr
	thumb_func_end ov13_02221410

	thumb_func_start ov13_02221428
ov13_02221428: @ 0x02221428
	push {r3, lr}
	ldr r0, _02221450 @ =0x0224CF98
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _0222143C
	bl ov13_022208F8
	ldr r0, _02221450 @ =0x0224CF98
	movs r1, #0
	str r1, [r0, #0xc]
_0222143C:
	ldr r0, _02221450 @ =0x0224CF98
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0222144E
	bl ov13_022208F8
	ldr r0, _02221450 @ =0x0224CF98
	movs r1, #0
	str r1, [r0, #4]
_0222144E:
	pop {r3, pc}
	.align 2, 0
_02221450: .4byte 0x0224CF98
	thumb_func_end ov13_02221428

	thumb_func_start ov13_02221454
ov13_02221454: @ 0x02221454
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02221498 @ =0x0224DCF8
	movs r1, #0
	movs r2, #8
	bl ov13_02222978
	ldr r0, _0222149C @ =0x0224CF98
	movs r1, #1
	str r1, [r0, #0x10]
	ldr r0, _022214A0 @ =0x0224CFBC
	movs r1, #0
	movs r2, #0x1c
	bl ov13_02222978
	ldr r1, _0222149C @ =0x0224CF98
	adds r0, r4, #6
	str r0, [r1, #0x24]
	ldrh r0, [r4, #4]
	movs r3, #0
	str r0, [r1, #0x28]
	ldrh r2, [r4]
	movs r0, #0xf
	ands r0, r2
	str r0, [r1, #0x2c]
	ldrb r2, [r4, #2]
	ldr r0, _022214A4 @ =0x0224CFB8
	strb r2, [r0, #0x1d]
	ldr r2, _022214A8 @ =0xC0A80B01
	str r3, [r1, #0x30]
	str r2, [r1, #0x34]
	strb r3, [r0, #0x1c]
	pop {r4, pc}
	nop
_02221498: .4byte 0x0224DCF8
_0222149C: .4byte 0x0224CF98
_022214A0: .4byte 0x0224CFBC
_022214A4: .4byte 0x0224CFB8
_022214A8: .4byte 0xC0A80B01
	thumb_func_end ov13_02221454

	thumb_func_start ov13_022214AC
ov13_022214AC: @ 0x022214AC
	ldr r1, _022214B4 @ =0x0224CF98
	str r0, [r1, #0x10]
	bx lr
	nop
_022214B4: .4byte 0x0224CF98
	thumb_func_end ov13_022214AC

	thumb_func_start ov13_022214B8
ov13_022214B8: @ 0x022214B8
	ldr r0, _022214C0 @ =0x0224CF98
	ldr r0, [r0, #0x10]
	bx lr
	nop
_022214C0: .4byte 0x0224CF98
	thumb_func_end ov13_022214B8

	thumb_func_start ov13_022214C4
ov13_022214C4: @ 0x022214C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0222169C @ =0x0224D8C0
	ldr r2, _022216A0 @ =0x00000117
	str r0, [sp, #4]
	ldr r0, _022216A4 @ =0x0224D930
	adds r4, r7, r2
	ldr r6, _022216A8 @ =0x0224D660
	ldr r5, _022216AC @ =0x0224D790
	str r0, [sp]
	bne _022214E4
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022214E4:
	ldr r1, _022216B0 @ =0x0224CF98
	adds r2, #0x3d
	ldr r0, [r1, #0x2c]
	ldr r1, [r1, #0x30]
	ands r0, r1
	strh r0, [r7]
	adds r0, r4, #0
	movs r1, #0
	bl ov13_02222978
	ldrh r1, [r7]
	movs r0, #1
	tst r0, r1
	beq _02221562
	adds r1, r6, #0
	ldr r2, [r6, #4]
	adds r0, r4, #0
	adds r1, #0x30
	bl ov13_02222968
	adds r1, r6, #0
	ldr r2, [r6, #4]
	adds r0, r4, #6
	adds r1, #0x70
	bl ov13_02222968
	adds r0, r4, #0
	adds r1, r6, #0
	ldr r2, [r6, #4]
	adds r0, #0xc
	adds r1, #0xb0
	bl ov13_02222968
	adds r0, r4, #0
	adds r1, r6, #0
	ldr r2, [r6, #4]
	adds r0, #0x12
	adds r1, #0xf0
	bl ov13_02222968
	adds r0, r6, #0
	adds r0, #8
	bl ov13_02222A9C
	adds r1, r0, #0
	adds r0, r6, #0
	adds r0, #8
	bl ov13_022216BC
	cmp r0, #0
	beq _0222154C
	b _02221688
_0222154C:
	adds r0, r6, #0
	adds r0, #8
	bl ov13_02222A9C
	adds r2, r0, #0
	adds r0, r4, #0
	adds r6, #8
	adds r0, #0x18
	adds r1, r6, #0
	bl ov13_02222968
_02221562:
	ldrh r1, [r7]
	movs r0, #2
	tst r0, r1
	beq _022215CE
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [r5, #4]
	adds r0, #0x39
	adds r1, #0x30
	bl ov13_02222968
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [r5, #4]
	adds r0, #0x47
	adds r1, #0x70
	bl ov13_02222968
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [r5, #4]
	adds r0, #0x55
	adds r1, #0xb0
	bl ov13_02222968
	adds r0, r4, #0
	adds r1, r5, #0
	ldr r2, [r5, #4]
	adds r0, #0x63
	adds r1, #0xf0
	bl ov13_02222968
	adds r0, r5, #0
	adds r0, #8
	bl ov13_02222A9C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #8
	bl ov13_022216BC
	cmp r0, #0
	bne _02221688
	adds r0, r5, #0
	adds r0, #8
	bl ov13_02222A9C
	adds r2, r0, #0
	adds r0, r4, #0
	adds r5, #8
	adds r0, #0x71
	adds r1, r5, #0
	bl ov13_02222968
_022215CE:
	ldrh r1, [r7]
	movs r0, #4
	tst r0, r1
	beq _02221626
	ldr r1, [sp, #4]
	ldr r0, [sp, #4]
	ldr r1, [r1, #4]
	adds r0, #0x30
	subs r1, r1, #1
	bl ov13_022216BC
	cmp r0, #0
	bne _02221688
	ldr r2, [sp, #4]
	ldr r1, [sp, #4]
	adds r0, r4, #0
	ldr r2, [r2, #4]
	adds r0, #0x92
	adds r1, #0x30
	bl ov13_02222968
	ldr r0, [sp, #4]
	adds r0, #8
	bl ov13_02222A9C
	adds r1, r0, #0
	ldr r0, [sp, #4]
	adds r0, #8
	bl ov13_022216BC
	cmp r0, #0
	bne _02221688
	ldr r0, [sp, #4]
	adds r0, #8
	bl ov13_02222A9C
	ldr r1, [sp, #4]
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, #8
	adds r0, #0xd2
	str r1, [sp, #4]
	bl ov13_02222968
_02221626:
	ldrh r1, [r7]
	movs r0, #8
	tst r0, r1
	beq _0222167E
	ldr r1, [sp]
	ldr r0, [sp]
	ldr r1, [r1, #4]
	adds r0, #0x30
	subs r1, r1, #1
	bl ov13_022216BC
	cmp r0, #0
	bne _02221688
	ldr r2, [sp]
	ldr r1, [sp]
	adds r0, r4, #0
	ldr r2, [r2, #4]
	adds r0, #0xf3
	adds r1, #0x30
	bl ov13_02222968
	ldr r0, [sp]
	adds r0, #8
	bl ov13_02222A9C
	adds r1, r0, #0
	ldr r0, [sp]
	adds r0, #8
	bl ov13_022216BC
	cmp r0, #0
	bne _02221688
	ldr r0, [sp]
	adds r0, #8
	bl ov13_02222A9C
	adds r2, r0, #0
	ldr r0, _022216B4 @ =0x00000133
	ldr r1, [sp]
	adds r0, r4, r0
	adds r1, #8
	str r1, [sp]
	bl ov13_02222968
_0222167E:
	ldr r1, _022216B8 @ =0x00000116
	movs r0, #0
	add sp, #8
	strb r0, [r7, r1]
	pop {r3, r4, r5, r6, r7, pc}
_02221688:
	movs r2, #0x55
	adds r0, r4, #0
	movs r1, #0
	lsls r2, r2, #2
	bl ov13_02222978
	movs r0, #0
	mvns r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222169C: .4byte 0x0224D8C0
_022216A0: .4byte 0x00000117
_022216A4: .4byte 0x0224D930
_022216A8: .4byte 0x0224D660
_022216AC: .4byte 0x0224D790
_022216B0: .4byte 0x0224CF98
_022216B4: .4byte 0x00000133
_022216B8: .4byte 0x00000116
	thumb_func_end ov13_022214C4

	thumb_func_start ov13_022216BC
ov13_022216BC: @ 0x022216BC
	movs r3, #0
	cmp r1, #0
	ble _022216DA
_022216C2:
	ldrb r2, [r0]
	adds r0, r0, #1
	cmp r2, #0x20
	blo _022216CE
	cmp r2, #0x7f
	bls _022216D4
_022216CE:
	movs r0, #0
	mvns r0, r0
	bx lr
_022216D4:
	adds r3, r3, #1
	cmp r3, r1
	blt _022216C2
_022216DA:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov13_022216BC

	thumb_func_start ov13_022216E0
ov13_022216E0: @ 0x022216E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5]
	movs r4, #0
	str r4, [sp, #4]
	str r0, [sp]
	cmp r0, #0
	bne _022216F8
	add sp, #8
	movs r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_022216F8:
	cmp r0, #0x40
	bls _02221700
	movs r0, #0x40
	str r0, [sp]
_02221700:
	ldr r0, [sp]
	movs r7, #0
	cmp r0, #0
	ble _02221742
	adds r6, r5, #0
	adds r6, #8
_0222170C:
	ldr r1, [r5, #0x54]
	movs r0, #1
	tst r0, r1
	beq _02221736
	ldr r0, _02221758 @ =0x02245A14
	bl ov13_02222A9C
	ldr r1, [r5, #4]
	cmp r1, r0
	bne _02221736
	ldr r0, _02221758 @ =0x02245A14
	bl ov13_02222A9C
	adds r2, r0, #0
	ldr r1, _02221758 @ =0x02245A14
	adds r0, r6, #0
	bl ov13_02222948
	cmp r0, #0
	bne _02221736
	adds r4, r4, #1
_02221736:
	ldr r0, [sp]
	adds r7, r7, #1
	adds r5, #0x54
	adds r6, #0x54
	cmp r7, r0
	blt _0222170C
_02221742:
	cmp r4, #1
	ble _0222174A
	movs r0, #4
	str r0, [sp, #4]
_0222174A:
	cmp r4, #0
	bne _02221752
	movs r0, #5
	str r0, [sp, #4]
_02221752:
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02221758: .4byte 0x02245A14
	thumb_func_end ov13_022216E0

	thumb_func_start ov13_0222175C
ov13_0222175C: @ 0x0222175C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02221798 @ =0x02245A14
	bl ov13_02222A9C
	str r0, [r4]
	ldr r1, _02221798 @ =0x02245A14
	ldr r2, [r4]
	adds r0, r4, #4
	bl ov13_02222968
	movs r0, #1
	str r0, [r4, #0x24]
	ldr r0, _0222179C @ =0x02245A20
	bl ov13_02222A9C
	adds r2, r0, #0
	str r0, [r4, #0x28]
	cmp r2, #0xd
	bls _0222178A
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
_0222178A:
	adds r4, #0x2c
	ldr r1, _0222179C @ =0x02245A20
	adds r0, r4, #0
	bl ov13_02222968
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_02221798: .4byte 0x02245A14
_0222179C: .4byte 0x02245A20
	thumb_func_end ov13_0222175C

	thumb_func_start ov13_022217A0
ov13_022217A0: @ 0x022217A0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	movs r4, #0
	cmp r6, #0
	ble _022217CE
_022217AE:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #6
	bl ov13_02222968
	bl ov13_02222AB0
	strh r0, [r5, #6]
	ldrh r0, [r5, #6]
	bl ov13_02222A44
	strh r0, [r5, #6]
	adds r4, r4, #1
	adds r5, #8
	cmp r4, r6
	blt _022217AE
_022217CE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov13_022217A0

	thumb_func_start ov13_022217D0
ov13_022217D0: @ 0x022217D0
	push {r3, lr}
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _022217E2
	ldr r1, _022217F8 @ =0x022459B4
	str r0, [r1, #4]
	movs r0, #0
	pop {r3, pc}
_022217E2:
	ldr r1, _022217F8 @ =0x022459B4
	ldr r2, [r1, #4]
	cmp r2, r0
	beq _022217F2
	str r0, [r1, #4]
	bl ov13_02223100
	pop {r3, pc}
_022217F2:
	movs r0, #0
	pop {r3, pc}
	nop
_022217F8: .4byte 0x022459B4
	thumb_func_end ov13_022217D0

	thumb_func_start ov13_022217FC
ov13_022217FC: @ 0x022217FC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	ldrh r0, [r6, #0xc]
	adds r7, r6, #0
	adds r4, r2, #0
	str r3, [sp]
	adds r7, #0xc
	bl ov13_02222A84
	cmp r0, #1
	bhs _0222181E
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222181E:
	ldrb r0, [r7, #0xf]
	cmp r0, #0x11
	beq _0222182E
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222182E:
	adds r0, r6, #0
	adds r0, #0xc
	bl ov13_02221AF4
	cmp r0, #0
	ble _02221844
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_02221844:
	ldrh r0, [r7, #6]
	bl ov13_02222A84
	ldr r1, _02221890 @ =0x00001010
	cmp r0, r1
	beq _0222185E
	ldr r1, _02221894 @ =0x00002010
	cmp r0, r1
	beq _0222186E
	ldr r1, _02221898 @ =0x00003010
	cmp r0, r1
	beq _0222187E
	b _0222188C
_0222185E:
	ldr r3, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov13_0222189C
	adds r5, r0, #0
	b _0222188C
_0222186E:
	ldr r3, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov13_02221978
	adds r5, r0, #0
	b _0222188C
_0222187E:
	ldr r3, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov13_02221A50
	adds r5, r0, #0
_0222188C:
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02221890: .4byte 0x00001010
_02221894: .4byte 0x00002010
_02221898: .4byte 0x00003010
	thumb_func_end ov13_022217FC

	thumb_func_start ov13_0222189C
ov13_0222189C: @ 0x0222189C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r6, #0
	beq _022218AE
	ldr r1, [r5]
	adds r1, r1, #1
	str r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_022218AE:
	adds r7, r1, #0
	adds r7, #0xc
	adds r4, r1, #0
	adds r1, r7, #0
	adds r0, r3, #0
	adds r1, #0x10
	adds r4, #0x24
	bl ov13_02221C2C
	cmp r0, #0
	bge _022218CE
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_022218CE:
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	cmp r0, #0
	bne _022218E2
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_022218E2:
	ldrb r0, [r4]
	cmp r0, #7
	bne _02221920
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	bne _022218FE
	movs r0, #0x14
	bl ov13_022214AC
	b _0222191A
_022218FE:
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	movs r1, #2
	mvns r1, r1
	cmp r0, r1
	bne _02221914
	movs r0, #0x15
	bl ov13_022214AC
	b _0222191A
_02221914:
	movs r0, #0x18
	bl ov13_022214AC
_0222191A:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221920:
	cmp r0, #1
	beq _0222192E
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222192E:
	ldr r1, _02221970 @ =0x0224CFD8
	adds r0, r4, #4
	bl ov13_02221C78
	cmp r0, #0
	bge _02221958
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	bne _0222194E
	movs r0, #0x16
	bl ov13_022214AC
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0222194E:
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02221958:
	ldrh r0, [r7, #0xc]
	bl ov13_02222A84
	bl ov13_022220A4
	ldr r1, _02221974 @ =0x0224CF98
	str r0, [r1]
	movs r0, #0
	str r0, [r5]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02221970: .4byte 0x0224CFD8
_02221974: .4byte 0x0224CF98
	thumb_func_end ov13_0222189C

	thumb_func_start ov13_02221978
ov13_02221978: @ 0x02221978
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r6, #1
	beq _0222198A
	ldr r1, [r5]
	adds r1, r1, #1
	str r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222198A:
	adds r7, r1, #0
	adds r7, #0xc
	adds r4, r1, #0
	adds r3, #8
	adds r1, r7, #0
	adds r0, r3, #0
	adds r1, #0x10
	adds r4, #0x24
	bl ov13_02221C2C
	cmp r0, #0
	bge _022219AC
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_022219AC:
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	cmp r0, #0
	bne _022219C0
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_022219C0:
	ldrb r0, [r4]
	cmp r0, #7
	bne _022219FE
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	bne _022219DC
	movs r0, #0x14
	bl ov13_022214AC
	b _022219F8
_022219DC:
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	movs r1, #2
	mvns r1, r1
	cmp r0, r1
	bne _022219F2
	movs r0, #0x15
	bl ov13_022214AC
	b _022219F8
_022219F2:
	movs r0, #0x18
	bl ov13_022214AC
_022219F8:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022219FE:
	movs r2, #0x6a
	ldr r0, _02221A44 @ =0x0224D658
	movs r1, #0
	lsls r2, r2, #4
	bl ov13_02222978
	ldrh r0, [r7, #0xa]
	bl ov13_02222A84
	adds r2, r0, #0
	ldr r0, _02221A48 @ =0x0224CFD8
	ldr r3, _02221A44 @ =0x0224D658
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	bl ov13_02221F94
	cmp r0, #0
	bge _02221A2E
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02221A2E:
	ldr r0, _02221A4C @ =0x0224CF98
	ldr r1, [r0, #0x30]
	ldr r0, [r0, #0x2c]
	tst r0, r1
	bne _02221A3C
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02221A3C:
	movs r0, #0
	str r0, [r5]
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02221A44: .4byte 0x0224D658
_02221A48: .4byte 0x0224CFD8
_02221A4C: .4byte 0x0224CF98
	thumb_func_end ov13_02221978

	thumb_func_start ov13_02221A50
ov13_02221A50: @ 0x02221A50
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r6, #2
	beq _02221A62
	ldr r1, [r5]
	adds r1, r1, #1
	str r1, [r5]
	pop {r4, r5, r6, pc}
_02221A62:
	adds r4, r1, #0
	adds r3, #0x10
	adds r1, #0xc
	adds r0, r3, #0
	adds r1, #0x10
	adds r4, #0x24
	bl ov13_02221C2C
	cmp r0, #0
	bge _02221A80
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_02221A80:
	ldrb r0, [r4]
	cmp r0, #7
	beq _02221A90
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_02221A90:
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	cmp r0, #0
	bne _02221AA4
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_02221AA4:
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	cmp r0, #0
	bne _02221AB2
	movs r0, #0x64
	pop {r4, r5, r6, pc}
_02221AB2:
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	bne _02221ACC
	movs r0, #0x14
	bl ov13_022214AC
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_02221ACC:
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	movs r1, #2
	mvns r1, r1
	cmp r0, r1
	bne _02221AE6
	movs r0, #0x15
	bl ov13_022214AC
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_02221AE6:
	movs r0, #0x18
	bl ov13_022214AC
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov13_02221A50

	thumb_func_start ov13_02221AF4
ov13_02221AF4: @ 0x02221AF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r1, r5, #0
	adds r4, r5, #0
	add r0, sp, #0xc
	adds r1, #0x10
	movs r2, #8
	adds r4, #0x18
	bl ov13_02222968
	ldr r0, _02221BE0 @ =0x02245A20
	bl ov13_02222A9C
	adds r3, r0, #0
	ldr r2, _02221BE0 @ =0x02245A20
	add r0, sp, #0xc
	movs r1, #8
	bl ov13_022227A0
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _02221B32
	movs r0, #2
	bl ov13_022214AC
	movs r0, #0x63
	add sp, #0x14
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_02221B32:
	ldrh r0, [r5, #6]
	bl ov13_02222A84
	add r1, sp, #0xc
	bl ov13_02221BE8
	cmp r0, #0
	bne _02221BDA
	ldrh r0, [r5, #6]
	bl ov13_02222A84
	movs r1, #1
	lsls r1, r1, #0xc
	cmp r0, r1
	bne _02221B5A
	ldr r0, _02221BE4 @ =0x0224DCF8
	add r1, sp, #0xc
	movs r2, #8
	bl ov13_02222968
_02221B5A:
	ldrh r0, [r5, #0xc]
	bl ov13_02222A84
	movs r1, #0xf
	tst r0, r1
	bne _02221B6C
	add sp, #0x14
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_02221B6C:
	ldrh r0, [r4]
	bl ov13_02222A84
	adds r6, r0, #0
	bl ov13_022208E8
	adds r7, r0, #0
	bne _02221B88
	movs r0, #2
	bl ov13_022214AC
	add sp, #0x14
	movs r0, #0x64
	pop {r4, r5, r6, r7, pc}
_02221B88:
	adds r0, r4, #2
	str r0, [sp]
	ldr r0, _02221BE4 @ =0x0224DCF8
	adds r1, r7, #0
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	ldrb r3, [r5, #0xe]
	adds r0, r4, #4
	adds r2, r6, #0
	bl ov13_022225B0
	cmp r0, #0
	bge _02221BBE
	adds r0, r7, #0
	bl ov13_022208F8
	bl ov13_022214B8
	cmp r0, #2
	bne _02221BB8
	add sp, #0x14
	movs r0, #0x64
	pop {r4, r5, r6, r7, pc}
_02221BB8:
	add sp, #0x14
	movs r0, #0xc8
	pop {r4, r5, r6, r7, pc}
_02221BBE:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl ov13_02222968
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	bl ov13_02222A44
	strh r0, [r5, #0xa]
	adds r0, r7, #0
	bl ov13_022208F8
	movs r0, #0
_02221BDA:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02221BE0: .4byte 0x02245A20
_02221BE4: .4byte 0x0224DCF8
	thumb_func_end ov13_02221AF4

	thumb_func_start ov13_02221BE8
ov13_02221BE8: @ 0x02221BE8
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r6, _02221C28 @ =0x0224DCF8
	adds r5, r4, #0
	adds r3, r4, #0
_02221BF2:
	ldrb r2, [r6]
	cmp r2, #0
	beq _02221BFC
	movs r5, #1
	b _02221C04
_02221BFC:
	adds r3, r3, #1
	adds r6, r6, #1
	cmp r3, #6
	blt _02221BF2
_02221C04:
	cmp r5, #0
	beq _02221C18
	ldr r0, _02221C28 @ =0x0224DCF8
	movs r2, #6
	bl ov13_02222948
	cmp r0, #0
	beq _02221C22
	movs r4, #1
	b _02221C22
_02221C18:
	movs r1, #1
	lsls r1, r1, #0xc
	cmp r0, r1
	beq _02221C22
	movs r4, #2
_02221C22:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_02221C28: .4byte 0x0224DCF8
	thumb_func_end ov13_02221BE8

	thumb_func_start ov13_02221C2C
ov13_02221C2C: @ 0x02221C2C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _02221C74 @ =0x02245A20
	adds r5, r1, #0
	movs r4, #0
	bl ov13_02222A9C
	adds r3, r0, #0
	ldr r2, _02221C74 @ =0x02245A20
	adds r0, r5, #0
	movs r1, #8
	bl ov13_022227A0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #6
	bl ov13_02222948
	cmp r0, #0
	beq _02221C58
	subs r4, r4, #1
	b _02221C6E
_02221C58:
	ldrh r0, [r6, #6]
	bl ov13_02222A84
	adds r6, r0, #0
	ldrh r0, [r5, #6]
	bl ov13_02222A84
	adds r1, r6, #1
	cmp r1, r0
	beq _02221C6E
	subs r4, r4, #2
_02221C6E:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_02221C74: .4byte 0x02245A20
	thumb_func_end ov13_02221C2C

	thumb_func_start ov13_02221C78
ov13_02221C78: @ 0x02221C78
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	movs r2, #0x41
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0
	lsls r2, r2, #2
	bl ov13_02222978
	adds r7, r5, #0
	adds r4, r6, #0
	adds r7, #0x80
_02221C90:
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	adds r2, r0, #0
	cmp r2, #0
	bgt _02221CA2
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221CA2:
	ldrb r0, [r4]
	cmp r0, #6
	bhi _02221D18
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02221CB4: @ jump table
	.2byte _02221CC2 - _02221CB4 - 2 @ case 0
	.2byte _02221CCC - _02221CB4 - 2 @ case 1
	.2byte _02221CD6 - _02221CB4 - 2 @ case 2
	.2byte _02221CE4 - _02221CB4 - 2 @ case 3
	.2byte _02221CE4 - _02221CB4 - 2 @ case 4
	.2byte _02221CF4 - _02221CB4 - 2 @ case 5
	.2byte _02221D06 - _02221CB4 - 2 @ case 6
_02221CC2:
	adds r0, r5, #0
	adds r1, r4, #6
	bl ov13_02222968
	b _02221D1E
_02221CCC:
	adds r0, r7, #0
	adds r1, r4, #6
	bl ov13_02222968
	b _02221D1E
_02221CD6:
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r5, r0
	adds r1, r4, #6
	bl ov13_02222968
	b _02221D1E
_02221CE4:
	ldrb r0, [r4, #6]
	bl ov13_02222A84
	cmp r0, #0
	bgt _02221D1E
	movs r0, #1
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221CF4:
	adds r0, r4, #6
	adds r1, r2, #0
	bl ov13_02221D34
	bl ov13_02222A5C
	ldr r1, _02221D30 @ =0x0224CF98
	str r0, [r1, #0x34]
	b _02221D1E
_02221D06:
	adds r0, r4, #6
	adds r1, r2, #0
	bl ov13_02221D34
	bl ov13_02222A5C
	ldr r1, _02221D30 @ =0x0224CF98
	str r0, [r1, #0x38]
	b _02221D1E
_02221D18:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221D1E:
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _02221D2C
	bl ov13_02222A84
	adds r4, r6, r0
	b _02221C90
_02221D2C:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02221D30: .4byte 0x0224CF98
	thumb_func_end ov13_02221C78

	thumb_func_start ov13_02221D34
ov13_02221D34: @ 0x02221D34
	push {r4, r5}
	movs r3, #0
	subs r2, r1, #1
	adds r5, r0, r2
	adds r4, r3, #0
	cmp r1, #0
	ble _02221D50
_02221D42:
	ldrb r0, [r5]
	lsls r2, r3, #8
	adds r4, r4, #1
	subs r5, r5, #1
	adds r3, r2, r0
	cmp r4, r1
	blt _02221D42
_02221D50:
	adds r0, r3, #0
	pop {r4, r5}
	bx lr
	.align 2, 0
	thumb_func_end ov13_02221D34

	thumb_func_start ov13_02221D58
ov13_02221D58: @ 0x02221D58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r1, #0
	adds r5, r0, #6
	adds r0, r6, #0
	str r0, [sp, #0xc]
	adds r0, #8
	str r0, [sp, #0xc]
	adds r0, r6, #0
	str r0, [sp, #8]
	adds r0, #0xf0
	str r0, [sp, #8]
	adds r0, r6, #0
	str r0, [sp, #4]
	adds r0, #0xb0
	str r0, [sp, #4]
	adds r0, r6, #0
	str r0, [sp]
	adds r0, #0x70
	adds r7, r6, #0
	str r0, [sp]
	adds r7, #0x30
	str r5, [sp, #0x10]
_02221D86:
	ldrh r0, [r5, #2]
	bl ov13_02222A84
	adds r4, r0, #0
	ldrb r0, [r5]
	cmp r0, #0x21
	bgt _02221DBE
	bge _02221DDC
	cmp r0, #0x15
	bgt _02221DB8
	adds r1, r0, #0
	subs r1, #0x10
	bmi _02221DF4
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02221DAC: @ jump table
	.2byte _02221DD0 - _02221DAC - 2 @ case 0
	.2byte _02221DD0 - _02221DAC - 2 @ case 1
	.2byte _02221DD0 - _02221DAC - 2 @ case 2
	.2byte _02221DD0 - _02221DAC - 2 @ case 3
	.2byte _02221DF4 - _02221DAC - 2 @ case 4
	.2byte _02221DE8 - _02221DAC - 2 @ case 5
_02221DB8:
	cmp r0, #0x20
	beq _02221DDC
	b _02221DF4
_02221DBE:
	cmp r0, #0x23
	bgt _02221DCA
	bge _02221DDC
	cmp r0, #0x22
	beq _02221DDC
	b _02221DF4
_02221DCA:
	cmp r0, #0x25
	beq _02221DE8
	b _02221DF4
_02221DD0:
	cmp r4, #5
	bls _02221DF4
	movs r0, #0
	add sp, #0x14
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_02221DDC:
	cmp r4, #0xd
	bls _02221DF4
	movs r0, #0
	add sp, #0x14
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_02221DE8:
	cmp r4, #0x21
	bls _02221DF4
	movs r0, #0
	add sp, #0x14
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_02221DF4:
	cmp r0, #0x21
	bgt _02221E22
	bge _02221E42
	cmp r0, #0x15
	bgt _02221E1C
	adds r1, r0, #0
	subs r1, #0x10
	bmi _02221E8C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02221E10: @ jump table
	.2byte _02221E34 - _02221E10 - 2 @ case 0
	.2byte _02221E42 - _02221E10 - 2 @ case 1
	.2byte _02221E50 - _02221E10 - 2 @ case 2
	.2byte _02221E5E - _02221E10 - 2 @ case 3
	.2byte _02221E8C - _02221E10 - 2 @ case 4
	.2byte _02221E6C - _02221E10 - 2 @ case 5
_02221E1C:
	cmp r0, #0x20
	beq _02221E34
	b _02221E8C
_02221E22:
	cmp r0, #0x23
	bgt _02221E2E
	bge _02221E5E
	cmp r0, #0x22
	beq _02221E50
	b _02221E8C
_02221E2E:
	cmp r0, #0x25
	beq _02221E6C
	b _02221E8C
_02221E34:
	adds r0, r7, #0
	adds r1, r5, #6
	adds r2, r4, #0
	bl ov13_02222968
	str r4, [r6, #4]
	b _02221E94
_02221E42:
	ldr r0, [sp]
	adds r1, r5, #6
	adds r2, r4, #0
	bl ov13_02222968
	str r4, [r6, #4]
	b _02221E94
_02221E50:
	ldr r0, [sp, #4]
	adds r1, r5, #6
	adds r2, r4, #0
	bl ov13_02222968
	str r4, [r6, #4]
	b _02221E94
_02221E5E:
	ldr r0, [sp, #8]
	adds r1, r5, #6
	adds r2, r4, #0
	bl ov13_02222968
	str r4, [r6, #4]
	b _02221E94
_02221E6C:
	cmp r4, #0
	beq _02221E80
	adds r0, r5, r4
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _02221E80
	movs r0, #0
	add sp, #0x14
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_02221E80:
	ldr r0, [sp, #0xc]
	adds r1, r5, #6
	adds r2, r4, #0
	bl ov13_02222968
	b _02221E94
_02221E8C:
	movs r0, #0
	add sp, #0x14
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_02221E94:
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _02221EA4
	bl ov13_02222A84
	ldr r1, [sp, #0x10]
	adds r5, r1, r0
	b _02221D86
_02221EA4:
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov13_02221D58

	thumb_func_start ov13_02221EAC
ov13_02221EAC: @ 0x02221EAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r1, #0
	adds r4, r0, #6
	adds r0, r6, #0
	str r0, [sp]
	adds r0, #8
	adds r7, r6, #0
	str r0, [sp]
	adds r7, #0x30
	str r4, [sp, #4]
_02221EC2:
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	adds r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0x35
	bgt _02221ED8
	bge _02221EF2
	cmp r0, #0x30
	beq _02221EE6
	b _02221EFE
_02221ED8:
	cmp r0, #0x40
	bgt _02221EE0
	beq _02221EE6
	b _02221EFE
_02221EE0:
	cmp r0, #0x45
	beq _02221EF2
	b _02221EFE
_02221EE6:
	cmp r5, #0x40
	bls _02221EFE
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221EF2:
	cmp r5, #0x21
	bls _02221EFE
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221EFE:
	cmp r0, #0x35
	bgt _02221F0A
	bge _02221F26
	cmp r0, #0x30
	beq _02221F18
	b _02221F46
_02221F0A:
	cmp r0, #0x40
	bgt _02221F12
	beq _02221F18
	b _02221F46
_02221F12:
	cmp r0, #0x45
	beq _02221F26
	b _02221F46
_02221F18:
	adds r0, r7, #0
	adds r1, r4, #6
	adds r2, r5, #0
	bl ov13_02222968
	str r5, [r6, #4]
	b _02221F4E
_02221F26:
	cmp r5, #0
	beq _02221F3A
	adds r0, r4, r5
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _02221F3A
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221F3A:
	ldr r0, [sp]
	adds r1, r4, #6
	adds r2, r5, #0
	bl ov13_02222968
	b _02221F4E
_02221F46:
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221F4E:
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _02221F5E
	bl ov13_02222A84
	ldr r1, [sp, #4]
	adds r4, r1, r0
	b _02221EC2
_02221F5E:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov13_02221EAC

	thumb_func_start ov13_02221F64
ov13_02221F64: @ 0x02221F64
	push {r3, r4, r5, lr}
	adds r4, r0, #6
	ldrh r0, [r4, #2]
	adds r5, r1, #0
	bl ov13_02222A84
	adds r2, r0, #0
	cmp r2, #0
	bgt _02221F7C
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_02221F7C:
	ldrb r0, [r4]
	cmp r0, #0x70
	beq _02221F88
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_02221F88:
	adds r0, r5, #0
	adds r1, r4, #6
	bl ov13_02222968
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov13_02221F64

	thumb_func_start ov13_02221F94
ov13_02221F94: @ 0x02221F94
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r2, #0
	str r0, [sp]
	adds r4, r1, #0
	movs r5, #0
	str r3, [sp, #4]
	cmp r6, #0
	bgt _02221FAC
	add sp, #0x14
	subs r0, r5, #2
	pop {r4, r5, r6, r7, pc}
_02221FAC:
	ldr r7, _0222209C @ =0x022459B0
_02221FAE:
	ldr r2, [sp]
	ldrb r0, [r4]
	ldrb r2, [r7, r2]
	adds r1, r4, #0
	cmp r0, r2
	beq _02221FD2
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	adds r0, r0, #4
	subs r6, r6, r0
	adds r4, r4, r0
	cmp r6, #0
	bgt _02221FAE
	movs r0, #3
	add sp, #0x14
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_02221FD2:
	ldrh r0, [r1, #2]
	adds r4, r4, #4
	bl ov13_02222A84
	adds r7, r0, #0
	movs r1, #0x35
	ldr r0, [sp]
	lsls r1, r1, #4
	muls r1, r0, r1
	ldr r0, [sp, #4]
	adds r6, r0, r1
	ldr r0, [sp, #0x28]
	str r0, [sp, #8]
	ldr r0, [sp]
	adds r0, r0, #3
	lsls r0, r0, #7
	str r0, [sp, #0xc]
	adds r0, r6, #0
	str r0, [sp, #0x10]
	adds r0, #8
	str r0, [sp, #0x10]
_02221FFC:
	ldrb r0, [r4]
	cmp r0, #0xa
	bhi _02222076
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222200E: @ jump table
	.2byte _02222076 - _0222200E - 2 @ case 0
	.2byte _02222076 - _0222200E - 2 @ case 1
	.2byte _02222076 - _0222200E - 2 @ case 2
	.2byte _02222024 - _0222200E - 2 @ case 3
	.2byte _02222032 - _0222200E - 2 @ case 4
	.2byte _02222044 - _0222200E - 2 @ case 5
	.2byte _02222056 - _0222200E - 2 @ case 6
	.2byte _02222076 - _0222200E - 2 @ case 7
	.2byte _02222076 - _0222200E - 2 @ case 8
	.2byte _02222076 - _0222200E - 2 @ case 9
	.2byte _02222068 - _0222200E - 2 @ case 10
_02222024:
	ldr r1, [sp, #0x10]
	adds r0, r4, #0
	bl ov13_02221D58
	movs r1, #1
	orrs r5, r1
	b _0222207A
_02222032:
	movs r1, #0x4e
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r1, r6, r1
	bl ov13_02221D58
	movs r1, #2
	orrs r5, r1
	b _0222207A
_02222044:
	movs r1, #0x9a
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r1, r6, r1
	bl ov13_02221EAC
	movs r1, #4
	orrs r5, r1
	b _0222207A
_02222056:
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r1, r6, r1
	bl ov13_02221EAC
	movs r1, #8
	orrs r5, r1
	b _0222207A
_02222068:
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r2, r1
	bl ov13_02221F64
	b _0222207A
_02222076:
	movs r0, #2
	mvns r0, r0
_0222207A:
	cmp r0, #0
	bne _02222098
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	adds r0, r0, #4
	subs r7, r7, r0
	adds r4, r4, r0
	cmp r7, #0
	bgt _02221FFC
	ldr r0, _022220A0 @ =0x0224CF98
	ldr r1, [r0, #0x30]
	orrs r1, r5
	str r1, [r0, #0x30]
	movs r0, #0
_02222098:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222209C: .4byte 0x022459B0
_022220A0: .4byte 0x0224CF98
	thumb_func_end ov13_02221F94

	thumb_func_start ov13_022220A4
ov13_022220A4: @ 0x022220A4
	movs r1, #0x10
	movs r2, #0
	tst r0, r1
	beq _022220AE
	movs r2, #1
_022220AE:
	adds r0, r2, #0
	bx lr
	.align 2, 0
	thumb_func_end ov13_022220A4

	thumb_func_start ov13_022220B4
ov13_022220B4: @ 0x022220B4
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r0, #0
	beq _022220CA
	cmp r0, #1
	beq _022220DC
	cmp r0, #2
	beq _022220EE
	b _02222100
_022220CA:
	movs r0, #2
	bl ov13_022217D0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov13_02222108
	pop {r4, r5, r6, pc}
_022220DC:
	movs r0, #3
	bl ov13_022217D0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov13_0222224C
	pop {r4, r5, r6, pc}
_022220EE:
	movs r0, #5
	bl ov13_022217D0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov13_02222328
	pop {r4, r5, r6, pc}
_02222100:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov13_022220B4

	thumb_func_start ov13_02222108
ov13_02222108: @ 0x02222108
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r7, r1, #0
	movs r1, #0
	add r0, sp, #0x10
	strb r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #2]
	ldr r0, _0222223C @ =0x0224CF98
	str r2, [sp, #0xc]
	ldr r5, [r0, #0x14]
	ldr r2, _02222240 @ =0x000005DC
	adds r0, r5, #0
	bl ov13_02222978
	movs r0, #0x21
	lsls r0, r0, #4
	bl ov13_022208E8
	adds r4, r0, #0
	bne _02222140
	movs r0, #2
	bl ov13_022214AC
	movs r0, #0
	add sp, #0x20
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02222140:
	movs r2, #0x21
	movs r1, #0
	lsls r2, r2, #4
	bl ov13_02222978
	adds r6, r5, #0
	ldr r0, _02222244 @ =0x0224DCF8
	adds r1, r7, #0
	movs r2, #8
	adds r6, #0x18
	bl ov13_02222968
	add r0, sp, #0x14
	ldr r1, _02222244 @ =0x0224DCF8
	adds r0, #2
	movs r2, #8
	bl ov13_02222968
	adds r0, r4, #4
	bl ov13_02222394
	add r1, sp, #0x10
	strh r0, [r1, #4]
	movs r0, #4
	ldrsh r0, [r1, r0]
	cmp r0, #0
	bge _0222218E
	movs r0, #3
	bl ov13_022214AC
	cmp r4, #0
	beq _02222186
	adds r0, r4, #0
	bl ov13_022208F8
_02222186:
	movs r0, #0
	add sp, #0x20
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0222218E:
	movs r0, #0
	strb r0, [r4]
	ldrh r0, [r1, #4]
	bl ov13_02222A44
	strh r0, [r4, #2]
	add r1, sp, #0x10
	movs r0, #4
	ldrsh r0, [r1, r0]
	adds r2, r4, #0
	add r3, sp, #0x14
	adds r0, r0, #4
	strh r0, [r1, #4]
	add r0, sp, #0x10
	adds r0, #2
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r6, #0
	bl ov13_02222420
	add r1, sp, #0x10
	movs r0, #2
	ldrsh r2, [r1, r0]
	movs r0, #0x10
	movs r3, #6
	orrs r0, r2
	strh r0, [r1, #2]
	add r0, sp, #0x14
	ldr r2, _02222248 @ =0x02245A20
	adds r0, #2
	movs r1, #8
	bl ov13_022227A0
	cmp r0, #0
	beq _022221F0
	movs r0, #2
	bl ov13_022214AC
	cmp r4, #0
	beq _022221E8
	adds r0, r4, #0
	bl ov13_022208F8
_022221E8:
	movs r0, #0
	add sp, #0x20
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022221F0:
	add r3, sp, #0x10
	movs r0, #0
	ldrsb r0, [r3, r0]
	movs r1, #1
	movs r2, #4
	str r0, [sp]
	movs r0, #0x11
	str r0, [sp, #4]
	add r0, sp, #0x14
	adds r0, #2
	str r0, [sp, #8]
	movs r6, #2
	ldrsh r2, [r3, r2]
	ldrsh r3, [r3, r6]
	adds r0, r5, #0
	lsls r1, r1, #0xc
	bl ov13_02222474
	add r2, sp, #0x10
	movs r1, #4
	ldrsh r0, [r2, r1]
	ldr r3, [sp, #0xc]
	adds r0, #0x18
	strh r0, [r2, #4]
	ldrsh r1, [r2, r1]
	adds r0, r5, #0
	movs r2, #0xff
	bl ov13_022224CC
	cmp r4, #0
	beq _02222234
	adds r0, r4, #0
	bl ov13_022208F8
_02222234:
	movs r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222223C: .4byte 0x0224CF98
_02222240: .4byte 0x000005DC
_02222244: .4byte 0x0224DCF8
_02222248: .4byte 0x02245A20
	thumb_func_end ov13_02222108

	thumb_func_start ov13_0222224C
ov13_0222224C: @ 0x0222224C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	adds r5, r1, #0
	movs r1, #0
	add r0, sp, #0xc
	strb r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #2]
	ldr r0, _0222231C @ =0x0224CF98
	adds r6, r2, #0
	ldr r4, [r0, #0x14]
	add r0, sp, #0x14
	movs r2, #8
	bl ov13_02222978
	ldr r2, _02222320 @ =0x000005DC
	adds r0, r4, #0
	movs r1, #0
	bl ov13_02222978
	movs r1, #2
	add r0, sp, #0xc
	strb r1, [r0, #8]
	movs r1, #0
	strb r1, [r0, #9]
	movs r0, #4
	bl ov13_02222A44
	add r1, sp, #0xc
	strh r0, [r1, #0xa]
	ldr r0, _0222231C @ =0x0224CF98
	ldr r0, [r0, #0x2c]
	str r0, [sp, #0x18]
	bl ov13_02222A1C
	str r0, [sp, #0x18]
	movs r1, #8
	add r0, sp, #0xc
	strh r1, [r0, #4]
	add r0, sp, #0xc
	adds r0, #2
	str r0, [sp]
	add r0, sp, #0xc
	str r0, [sp, #4]
	ldr r0, _0222231C @ =0x0224CF98
	adds r1, r4, #0
	ldr r0, [r0]
	adds r1, #0x18
	add r2, sp, #0x14
	add r3, sp, #0x10
	bl ov13_02222420
	adds r5, #8
	add r0, sp, #0x1c
	adds r1, r5, #0
	movs r2, #8
	bl ov13_02222968
	ldr r2, _02222324 @ =0x02245A20
	add r0, sp, #0x1c
	movs r1, #8
	movs r3, #6
	bl ov13_022227A0
	cmp r0, #0
	beq _022222DE
	movs r0, #2
	bl ov13_022214AC
	movs r0, #0
	add sp, #0x24
	mvns r0, r0
	pop {r3, r4, r5, r6, pc}
_022222DE:
	add r3, sp, #0xc
	movs r0, #0
	ldrsb r0, [r3, r0]
	movs r1, #2
	movs r2, #4
	str r0, [sp]
	movs r0, #0x11
	str r0, [sp, #4]
	add r0, sp, #0x1c
	str r0, [sp, #8]
	movs r5, #2
	ldrsh r2, [r3, r2]
	ldrsh r3, [r3, r5]
	adds r0, r4, #0
	lsls r1, r1, #0xc
	bl ov13_02222474
	add r2, sp, #0xc
	movs r1, #4
	ldrsh r0, [r2, r1]
	adds r3, r6, #0
	adds r0, #0x18
	strh r0, [r2, #4]
	ldrsh r1, [r2, r1]
	adds r0, r4, #0
	movs r2, #0
	bl ov13_022224CC
	movs r0, #0
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222231C: .4byte 0x0224CF98
_02222320: .4byte 0x000005DC
_02222324: .4byte 0x02245A20
	thumb_func_end ov13_0222224C

	thumb_func_start ov13_02222328
ov13_02222328: @ 0x02222328
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	ldr r0, _02222388 @ =0x0224CF98
	adds r6, r2, #0
	ldr r4, [r0, #0x14]
	ldr r2, _0222238C @ =0x000005DC
	adds r5, r1, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov13_02222978
	adds r5, #0x10
	add r0, sp, #0xc
	adds r1, r5, #0
	movs r2, #8
	bl ov13_02222968
	ldr r0, _02222390 @ =0x02245A20
	bl ov13_02222A9C
	adds r3, r0, #0
	ldr r2, _02222390 @ =0x02245A20
	add r0, sp, #0xc
	movs r1, #8
	bl ov13_022227A0
	movs r2, #0
	movs r1, #3
	str r2, [sp]
	movs r0, #0x11
	str r0, [sp, #4]
	add r0, sp, #0xc
	str r0, [sp, #8]
	adds r0, r4, #0
	lsls r1, r1, #0xc
	adds r3, r2, #0
	bl ov13_02222474
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #0
	adds r3, r6, #0
	bl ov13_022224CC
	movs r0, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_02222388: .4byte 0x0224CF98
_0222238C: .4byte 0x000005DC
_02222390: .4byte 0x02245A20
	thumb_func_end ov13_02222328

	thumb_func_start ov13_02222394
ov13_02222394: @ 0x02222394
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _02222418 @ =0x0224CFB8
	adds r5, r0, #0
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	ldr r1, _0222241C @ =0x0224CF98
	movs r6, #0
	strb r0, [r5]
	movs r0, #1
	strb r0, [r5, #1]
	ldr r0, [r1, #0x28]
	ldr r1, [r1, #0x24]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r0, r5, #6
	adds r2, r4, #0
	bl ov13_02222968
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl ov13_02222A44
	strh r0, [r5, #2]
	adds r0, r4, #6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #1
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #0x11
	asrs r7, r0, #0x10
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	bl ov13_02222A44
	strh r0, [r5, #4]
	adds r0, r6, r7
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #0x60
	strb r0, [r5, r7]
	adds r4, r5, r7
	movs r0, #0
	strb r0, [r4, #1]
	bl ov13_02222A44
	strh r0, [r4, #4]
	movs r0, #0xe
	bl ov13_02222A1C
	str r0, [sp]
	adds r0, r4, #6
	add r1, sp, #0
	movs r2, #4
	bl ov13_02222968
	movs r0, #4
	bl ov13_02222A44
	adds r6, #0xa
	strh r0, [r4, #2]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222418: .4byte 0x0224CFB8
_0222241C: .4byte 0x0224CF98
	thumb_func_end ov13_02222394

	thumb_func_start ov13_02222420
ov13_02222420: @ 0x02222420
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r4, r3, #0
	cmp r0, #1
	bne _02222460
	ldr r0, [sp, #0x18]
	movs r1, #1
	strh r1, [r0]
	adds r0, r5, #2
	str r0, [sp]
	ldr r0, _02222470 @ =0x0224DCF8
	ldr r3, [sp, #0x1c]
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r2, #0
	ldrsh r2, [r4, r2]
	adds r1, r5, #4
	bl ov13_02222534
	ldrh r0, [r4]
	bl ov13_02222A44
	strh r0, [r5]
	movs r0, #0
	ldrsh r0, [r4, r0]
	add sp, #0xc
	adds r0, r0, #4
	strh r0, [r4]
	pop {r4, r5, pc}
_02222460:
	adds r1, r2, #0
	movs r2, #0
	ldrsh r2, [r4, r2]
	adds r0, r5, #0
	bl ov13_02222968
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_02222470: .4byte 0x0224DCF8
	thumb_func_end ov13_02222420

	thumb_func_start ov13_02222474
ov13_02222474: @ 0x02222474
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #1
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov13_02222A44
	strh r0, [r5]
	movs r0, #0
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl ov13_02222A44
	strh r0, [r5, #6]
	movs r0, #0
	strh r0, [r5, #8]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	bl ov13_02222A44
	strh r0, [r5, #0xa]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	bl ov13_02222A44
	strh r0, [r5, #0xc]
	add r1, sp, #8
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	movs r2, #8
	strb r0, [r5, #0xe]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	ldr r1, [sp, #0x20]
	strb r0, [r5, #0xf]
	adds r5, #0x10
	adds r0, r5, #0
	bl ov13_02222968
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov13_02222474

	thumb_func_start ov13_022224CC
ov13_022224CC: @ 0x022224CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	add r0, sp, #8
	movs r1, #0
	movs r2, #8
	adds r7, r3, #0
	bl ov13_02222978
	movs r1, #2
	add r0, sp, #8
	strb r1, [r0, #1]
	ldr r0, _02222528 @ =0x00005790
	bl ov13_02222A44
	add r1, sp, #8
	strh r0, [r1, #2]
	ldr r0, _0222252C @ =0x0224CF98
	ldr r0, [r0, #0x34]
	bl ov13_02222A1C
	str r0, [sp, #0xc]
	cmp r4, #0xff
	beq _0222250A
	ldr r1, _02222530 @ =0x0224CFB8
	movs r0, #0x1c
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _02222510
_0222250A:
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0xc]
_02222510:
	add r0, sp, #8
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl ov13_022229EC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02222528: .4byte 0x00005790
_0222252C: .4byte 0x0224CF98
_02222530: .4byte 0x0224CFB8
	thumb_func_end ov13_022224CC

	thumb_func_start ov13_02222534
ov13_02222534: @ 0x02222534
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r2, #0
	adds r7, r1, #0
	adds r4, r3, #0
	adds r1, r5, #0
	adds r6, r0, #0
	bl ov13_02222708
	strb r0, [r4]
	adds r0, r5, #0
	bl ov13_022208E8
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _0222255C
	movs r0, #0
	add sp, #0x14
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_0222255C:
	bl ov13_02222AB0
	add r1, sp, #0
	strh r0, [r1]
	ldr r0, [sp, #0x28]
	add r1, sp, #0
	movs r2, #2
	bl ov13_02222968
	ldr r0, _022225A8 @ =0x0224DD00
	ldr r1, [sp, #0x28]
	movs r2, #2
	bl ov13_02222968
	ldr r0, _022225AC @ =0x0224DD02
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	bl ov13_02222968
	ldr r2, [sp, #0x30]
	ldr r1, _022225A8 @ =0x0224DD00
	add r0, sp, #4
	adds r2, r2, #2
	adds r3, r5, #0
	bl ov13_02222638
	add r0, sp, #4
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl ov13_0222269C
	ldr r0, [sp, #0xc]
	bl ov13_022208F8
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022225A8: .4byte 0x0224DD00
_022225AC: .4byte 0x0224DD02
	thumb_func_end ov13_02222534

	thumb_func_start ov13_022225B0
ov13_022225B0: @ 0x022225B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r2, #0
	adds r7, r0, #0
	adds r0, r4, #0
	adds r5, r1, #0
	adds r6, r3, #0
	bl ov13_022208E8
	str r0, [sp, #8]
	cmp r0, #0
	bne _022225D6
	movs r0, #2
	bl ov13_022214AC
	movs r0, #0
	add sp, #0x10
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022225D6:
	ldr r0, _02222630 @ =0x0224DD00
	ldr r1, [sp, #0x28]
	movs r2, #2
	bl ov13_02222968
	ldr r0, _02222634 @ =0x0224DD02
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	bl ov13_02222968
	ldr r2, [sp, #0x30]
	ldr r1, _02222630 @ =0x0224DD00
	add r0, sp, #0
	adds r2, r2, #2
	adds r3, r4, #0
	bl ov13_02222638
	add r0, sp, #0
	adds r1, r5, #0
	adds r2, r7, #0
	adds r3, r4, #0
	bl ov13_0222269C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov13_02222708
	cmp r0, r6
	beq _02222624
	movs r0, #0x12
	bl ov13_022214AC
	ldr r0, [sp, #8]
	bl ov13_022208F8
	movs r0, #0
	add sp, #0x10
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02222624:
	ldr r0, [sp, #8]
	bl ov13_022208F8
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02222630: .4byte 0x0224DD00
_02222634: .4byte 0x0224DD02
	thumb_func_end ov13_022225B0

	thumb_func_start ov13_02222638
ov13_02222638: @ 0x02222638
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	ldr r4, [r0, #8]
	ldr r1, [sp]
	movs r0, #0
	str r0, [r1, #4]
	str r2, [sp, #8]
	str r0, [r1]
	adds r2, r3, #0
	str r2, [r1, #0xc]
	str r3, [sp, #0xc]
	adds r1, r3, #0
	beq _02222660
_02222656:
	ldr r1, [sp, #0xc]
	strb r0, [r4, r0]
	adds r0, r0, #1
	cmp r0, r1
	blo _02222656
_02222660:
	ldr r0, [sp, #0xc]
	movs r1, #0
	adds r6, r1, #0
	adds r5, r1, #0
	cmp r0, #0
	bls _02222696
_0222266C:
	ldr r0, [sp, #4]
	ldrb r7, [r4, r5]
	ldrb r0, [r0, r6]
	adds r0, r1, r0
	ldr r1, [sp]
	adds r0, r7, r0
	ldr r1, [r1, #0xc]
	blx FUN_020F2BA4
	ldrb r0, [r4, r1]
	adds r6, r6, #1
	strb r7, [r4, r1]
	strb r0, [r4, r5]
	ldr r0, [sp, #8]
	cmp r6, r0
	blo _0222268E
	movs r6, #0
_0222268E:
	ldr r0, [sp, #0xc]
	adds r5, r5, #1
	cmp r5, r0
	blo _0222266C
_02222696:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov13_02222638

	thumb_func_start ov13_0222269C
ov13_0222269C: @ 0x0222269C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r4, _022226C4 @ =0x00000000
	beq _022226C0
_022226AA:
	ldr r0, [sp]
	bl ov13_022226C8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrb r0, [r6, r4]
	eors r0, r1
	strb r0, [r5, r4]
	adds r4, r4, #1
	cmp r4, r7
	blo _022226AA
_022226C0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022226C4: .4byte 0x00000000
	thumb_func_end ov13_0222269C

	thumb_func_start ov13_022226C8
ov13_022226C8: @ 0x022226C8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	ldr r4, [r5, #8]
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, [sp]
	adds r0, r0, #1
	blx FUN_020F2BA4
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
	ldrb r6, [r4, r7]
	ldr r0, [r5, #4]
	ldr r1, [sp]
	adds r0, r6, r0
	blx FUN_020F2BA4
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldrb r0, [r4, r1]
	str r7, [r5]
	str r1, [r5, #4]
	strb r6, [r4, r1]
	strb r0, [r4, r7]
	ldr r1, [r5, #0xc]
	adds r0, r6, r0
	blx FUN_020F2BA4
	ldrb r0, [r4, r1]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov13_022226C8

	thumb_func_start ov13_02222708
ov13_02222708: @ 0x02222708
	push {r3, lr}
	adds r3, r0, #0
	ldr r0, _0222272C @ =0x0224D258
	adds r2, r1, #0
	str r0, [sp]
	movs r0, #0
	adds r1, r3, #0
	mvns r0, r0
	movs r3, #0
	bl ov13_02222730
	movs r1, #0
	mvns r1, r1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3, pc}
	nop
_0222272C: .4byte 0x0224D258
	thumb_func_end ov13_02222708

	thumb_func_start ov13_02222730
ov13_02222730: @ 0x02222730
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	ldr r6, [sp, #0x18]
	cmp r3, #0
	bne _02222746
	adds r0, r3, #0
	adds r1, r6, #0
	bl ov13_02222768
_02222746:
	movs r1, #0
	cmp r4, #0
	ble _02222762
_0222274C:
	ldrb r2, [r7, r1]
	lsrs r0, r5, #8
	adds r1, r1, #1
	eors r2, r5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x16
	ldr r2, [r6, r2]
	adds r5, r0, #0
	eors r5, r2
	cmp r1, r4
	blt _0222274C
_02222762:
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov13_02222730

	thumb_func_start ov13_02222768
ov13_02222768: @ 0x02222768
	push {r4, r5, r6, r7}
	movs r5, #1
	adds r3, r5, #0
	ldr r4, _0222279C @ =0xEDB88320
	movs r0, #0
	adds r3, #0xff
_02222774:
	adds r7, r0, #0
	movs r2, #0
_02222778:
	adds r6, r7, #0
	tst r6, r5
	beq _02222786
	lsrs r6, r7, #1
	adds r7, r6, #0
	eors r7, r4
	b _02222788
_02222786:
	lsrs r7, r7, #1
_02222788:
	adds r2, r2, #1
	cmp r2, #8
	blt _02222778
	adds r0, r0, #1
	stm r1!, {r7}
	cmp r0, r3
	blt _02222774
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0222279C: .4byte 0xEDB88320
	thumb_func_end ov13_02222768

	thumb_func_start ov13_022227A0
ov13_022227A0: @ 0x022227A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	adds r7, r0, #0
	lsrs r0, r5, #0x1f
	adds r0, r5, r0
	asrs r0, r0, #1
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl ov13_022208E8
	adds r6, r0, #0
	bne _022227C2
	movs r0, #0
	add sp, #0x10
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022227C2:
	adds r0, r5, #0
	bl ov13_022208E8
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _022227DC
	adds r0, r6, #0
	bl ov13_022208F8
	movs r0, #0
	add sp, #0x10
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022227DC:
	movs r4, #0
_022227DE:
	ldr r0, [sp, #8]
	ldr r3, [sp, #4]
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl ov13_0222281C
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov13_02222850
	ldr r2, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r5, #0
	bl ov13_02222874
	adds r4, r4, #1
	cmp r4, #2
	blt _022227DE
	adds r0, r6, #0
	bl ov13_022208F8
	ldr r0, [sp, #0xc]
	bl ov13_022208F8
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov13_022227A0

	thumb_func_start ov13_0222281C
ov13_0222281C: @ 0x0222281C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsrs r1, r2, #0x1f
	adds r1, r2, r1
	ldr r6, [sp, #0x18]
	asrs r4, r1, #1
	adds r1, r6, #0
	adds r7, r3, #0
	blx FUN_020F2998
	movs r0, #0
	cmp r4, #0
	ble _0222284E
_02222836:
	strb r0, [r5, r0]
	ldrsb r2, [r7, r1]
	ldrsb r3, [r5, r0]
	adds r1, r1, #1
	eors r2, r3
	strb r2, [r5, r0]
	cmp r1, r6
	blt _02222848
	movs r1, #0
_02222848:
	adds r0, r0, #1
	cmp r0, r4
	blt _02222836
_0222284E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov13_0222281C

	thumb_func_start ov13_02222850
ov13_02222850: @ 0x02222850
	push {r4, r5}
	lsrs r3, r2, #0x1f
	adds r3, r2, r3
	asrs r4, r3, #1
	movs r3, #0
	cmp r4, #0
	ble _02222870
	adds r5, r1, r4
_02222860:
	ldrsb r1, [r0, r3]
	ldrb r2, [r5]
	adds r3, r3, #1
	eors r1, r2
	strb r1, [r5]
	adds r5, r5, #1
	cmp r3, r4
	blt _02222860
_02222870:
	pop {r4, r5}
	bx lr
	thumb_func_end ov13_02222850

	thumb_func_start ov13_02222874
ov13_02222874: @ 0x02222874
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	lsrs r0, r6, #0x1f
	adds r0, r6, r0
	asrs r7, r0, #1
	adds r4, r2, #0
	adds r0, r4, #0
	adds r1, r5, r7
	adds r2, r7, #0
	bl ov13_02222968
	adds r0, r4, r7
	adds r1, r5, #0
	adds r2, r7, #0
	bl ov13_02222968
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov13_02222968
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov13_02222874

	thumb_func_start ov13_022228A4
ov13_022228A4: @ 0x022228A4
	push {r3, lr}
	cmp r1, #0
	ble _022228B4
	adds r0, r1, #0
	ldr r1, _022228B8 @ =0x0224DD80
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
_022228B4:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_022228B8: .4byte 0x0224DD80
	thumb_func_end ov13_022228A4

	thumb_func_start ov13_022228BC
ov13_022228BC: @ 0x022228BC
	push {r3, lr}
	adds r0, r1, #0
	ldr r1, _022228C8 @ =0x0224DD8C
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	.align 2, 0
_022228C8: .4byte 0x0224DD8C
	thumb_func_end ov13_022228BC

	thumb_func_start ov13_022228CC
ov13_022228CC: @ 0x022228CC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	bl ov13_02222A1C
	ldr r1, _02222918 @ =0x022459B4
	str r0, [r1, #0x18]
	adds r0, r5, #0
	bl ov13_02222A1C
	ldr r1, _02222918 @ =0x022459B4
	str r0, [r1, #0x1c]
	adds r0, r4, #0
	bl ov13_02222A1C
	ldr r1, _02222918 @ =0x022459B4
	str r0, [r1, #0x20]
	ldr r0, _0222291C @ =0x022459BC
	blx FUN_020A33FC
	cmp r0, #0
	bge _022228FE
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_022228FE:
	ldr r5, _02222920 @ =0x021D4670
	ldr r0, [r5]
	cmp r0, #0
	bne _02222914
	movs r4, #0x64
_02222908:
	adds r0, r4, #0
	blx FUN_020D2108
	ldr r0, [r5]
	cmp r0, #0
	beq _02222908
_02222914:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02222918: .4byte 0x022459B4
_0222291C: .4byte 0x022459BC
_02222920: .4byte 0x021D4670
	thumb_func_end ov13_022228CC

	thumb_func_start ov13_02222924
ov13_02222924: @ 0x02222924
	push {r3, lr}
	blx FUN_020A3570
	cmp r0, #0
	bge _02222934
	movs r0, #0
	mvns r0, r0
	pop {r3, pc}
_02222934:
	bl ov13_02222D78
	cmp r0, #0
	beq _02222940
	movs r0, #1
	b _02222942
_02222940:
	movs r0, #0
_02222942:
	rsbs r0, r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov13_02222924

	thumb_func_start ov13_02222948
ov13_02222948: @ 0x02222948
	push {r3, r4}
	movs r3, #0
	b _02222952
_0222294E:
	adds r0, r0, #1
	adds r1, r1, #1
_02222952:
	adds r4, r2, #0
	subs r2, r2, #1
	cmp r4, #0
	ble _02222962
	ldrb r4, [r0]
	ldrb r3, [r1]
	subs r3, r4, r3
	beq _0222294E
_02222962:
	adds r0, r3, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov13_02222948

	thumb_func_start ov13_02222968
ov13_02222968: @ 0x02222968
	adds r3, r0, #0
	adds r0, r1, #0
	adds r1, r3, #0
	ldr r3, _02222974 @ =FUN_020D4A50
	bx r3
	nop
_02222974: .4byte FUN_020D4A50
	thumb_func_end ov13_02222968

	thumb_func_start ov13_02222978
ov13_02222978: @ 0x02222978
	ldr r3, _02222980 @ =FUN_020D4994
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bx r3
	.align 2, 0
_02222980: .4byte FUN_020D4994
	thumb_func_end ov13_02222978

	thumb_func_start ov13_02222984
ov13_02222984: @ 0x02222984
	push {r3, r4, r5, lr}
	ldr r4, [sp, #0x14]
	ldr r5, [r4]
	ldr r4, [sp, #0x10]
	strb r5, [r4]
	str r4, [sp]
	blx FUN_020A2F84
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov13_02222984

	thumb_func_start ov13_02222998
ov13_02222998: @ 0x02222998
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r2, [r1]
	ldr r0, [r1, #4]
	ldr r5, [sp, #0x18]
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [r5]
	movs r4, #0
	ldr r2, _022229E8 @ =0x01FF6210
	asrs r1, r0, #0x1f
	adds r3, r4, #0
	blx FUN_020F2948
	lsrs r3, r0, #6
	lsls r2, r1, #0x1a
	orrs r3, r2
	lsrs r0, r1, #6
	adds r6, r4, r3
	adcs r4, r0
	ldr r0, [r5, #4]
	ldr r2, _022229E8 @ =0x01FF6210
	asrs r1, r0, #0x1f
	movs r3, #0
	blx FUN_020F2948
	lsrs r3, r0, #6
	lsls r2, r1, #0x1a
	orrs r3, r2
	lsrs r0, r1, #6
	adds r2, r6, r3
	adcs r4, r0
	add r0, sp, #0
	movs r1, #1
	adds r3, r4, #0
	blx FUN_020A36A0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_022229E8: .4byte 0x01FF6210
	thumb_func_end ov13_02222998

	thumb_func_start ov13_022229EC
ov13_022229EC: @ 0x022229EC
	push {r3, r4, r5, lr}
	ldr r5, [sp, #0x14]
	ldr r4, [sp, #0x10]
	strb r5, [r4]
	str r4, [sp]
	blx FUN_020A3038
	pop {r3, r4, r5, pc}
	thumb_func_end ov13_022229EC

	thumb_func_start ov13_022229FC
ov13_022229FC: @ 0x022229FC
	bx lr
	.align 2, 0
	thumb_func_end ov13_022229FC

	thumb_func_start ov13_02222A00
ov13_02222A00: @ 0x02222A00
	ldr r3, _02222A04 @ =FUN_020A2EAC
	bx r3
	.align 2, 0
_02222A04: .4byte FUN_020A2EAC
	thumb_func_end ov13_02222A00

	thumb_func_start ov13_02222A08
ov13_02222A08: @ 0x02222A08
	ldr r3, _02222A10 @ =FUN_020A2ED8
	strb r2, [r1]
	bx r3
	nop
_02222A10: .4byte FUN_020A2ED8
	thumb_func_end ov13_02222A08

	thumb_func_start ov13_02222A14
ov13_02222A14: @ 0x02222A14
	ldr r3, _02222A18 @ =FUN_020A30C8
	bx r3
	.align 2, 0
_02222A18: .4byte FUN_020A30C8
	thumb_func_end ov13_02222A14

	thumb_func_start ov13_02222A1C
ov13_02222A1C: @ 0x02222A1C
	push {r4, r5}
	movs r3, #0xff
	lsls r1, r0, #0x18
	lsls r3, r3, #0x18
	adds r2, r1, #0
	lsls r4, r0, #8
	lsrs r1, r3, #8
	ands r1, r4
	lsrs r4, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	lsrs r4, r0, #8
	lsrs r0, r3, #0x10
	ands r0, r4
	orrs r0, r5
	ands r2, r3
	orrs r0, r1
	orrs r0, r2
	pop {r4, r5}
	bx lr
	thumb_func_end ov13_02222A1C

	thumb_func_start ov13_02222A44
ov13_02222A44: @ 0x02222A44
	asrs r1, r0, #8
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	lsls r1, r0, #8
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	orrs r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
	thumb_func_end ov13_02222A44

	thumb_func_start ov13_02222A5C
ov13_02222A5C: @ 0x02222A5C
	push {r4, r5}
	movs r3, #0xff
	lsls r1, r0, #0x18
	lsls r3, r3, #0x18
	adds r2, r1, #0
	lsls r4, r0, #8
	lsrs r1, r3, #8
	ands r1, r4
	lsrs r4, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	lsrs r4, r0, #8
	lsrs r0, r3, #0x10
	ands r0, r4
	orrs r0, r5
	ands r2, r3
	orrs r0, r1
	orrs r0, r2
	pop {r4, r5}
	bx lr
	thumb_func_end ov13_02222A5C

	thumb_func_start ov13_02222A84
ov13_02222A84: @ 0x02222A84
	asrs r1, r0, #8
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	lsls r1, r0, #8
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	orrs r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
	thumb_func_end ov13_02222A84

	thumb_func_start ov13_02222A9C
ov13_02222A9C: @ 0x02222A9C
	movs r2, #0
	ldrsb r1, [r0, r2]
	cmp r1, #0
	beq _02222AAC
_02222AA4:
	adds r2, r2, #1
	ldrsb r1, [r0, r2]
	cmp r1, #0
	bne _02222AA4
_02222AAC:
	adds r0, r2, #0
	bx lr
	thumb_func_end ov13_02222A9C

	thumb_func_start ov13_02222AB0
ov13_02222AB0: @ 0x02222AB0
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r0, _02222B10 @ =0x0224CF98
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02222AF2
	movs r4, #0
	add r0, sp, #0
	adds r1, r4, #0
	movs r2, #0xc
	bl ov13_02222978
	add r0, sp, #0
	blx FUN_020DBB48
	cmp r0, #0
	bne _02222AE2
	ldr r0, [sp]
	lsls r0, r0, #0xa
	adds r1, r4, r0
	ldr r0, [sp, #4]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, [sp, #8]
	adds r4, r1, r0
_02222AE2:
	ldr r0, _02222B10 @ =0x0224CF98
	ldr r1, _02222B14 @ =0x5D588B65
	str r4, [r0, #0x18]
	str r1, [r0, #0x1c]
	ldr r1, _02222B18 @ =0x00269EC3
	str r1, [r0, #0x20]
	movs r1, #1
	str r1, [r0, #8]
_02222AF2:
	ldr r0, _02222B10 @ =0x0224CF98
	ldr r2, [r0, #0x1c]
	ldr r1, [r0, #0x18]
	ldr r3, [r0, #0x20]
	muls r1, r2, r1
	adds r1, r3, r1
	str r1, [r0, #0x18]
	ldr r0, _02222B1C @ =0x00007FFF
	lsrs r1, r1, #0x10
	muls r0, r1, r0
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_02222B10: .4byte 0x0224CF98
_02222B14: .4byte 0x5D588B65
_02222B18: .4byte 0x00269EC3
_02222B1C: .4byte 0x00007FFF
	thumb_func_end ov13_02222AB0

	thumb_func_start ov13_02222B20
ov13_02222B20: @ 0x02222B20
	movs r1, #0
	str r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	bx lr
	.align 2, 0
	thumb_func_end ov13_02222B20

	thumb_func_start ov13_02222B2C
ov13_02222B2C: @ 0x02222B2C
	str r0, [r1]
	movs r0, #1
	strh r0, [r1, #4]
	bx lr
	thumb_func_end ov13_02222B2C

	thumb_func_start ov13_02222B34
ov13_02222B34: @ 0x02222B34
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0xa]
	adds r4, r1, #0
	adds r1, r4, #4
	str r0, [r4]
	adds r0, r5, #0
	adds r0, #0xc
	movs r2, #0x20
	blx FUN_020D47B8
	ldrh r0, [r5, #0x36]
	adds r1, r4, #0
	adds r1, #0x30
	str r0, [r4, #0x24]
	adds r0, r5, #4
	movs r2, #6
	blx FUN_020D47B8
	movs r1, #0
	ldr r2, _02222BBC @ =0x02245A28
	adds r0, r1, #0
	movs r6, #0x80
_02222B62:
	ldrh r7, [r5, #0x30]
	ldrh r3, [r2]
	tst r3, r7
	beq _02222B8C
	ldrb r7, [r2, #2]
	adds r3, r4, r1
	adds r3, #0x3c
	strb r7, [r3]
	ldrh r7, [r5, #0x2e]
	ldrh r3, [r2]
	tst r3, r7
	beq _02222B8A
	adds r3, r4, r1
	adds r3, #0x3c
	ldrb r3, [r3]
	adds r7, r3, #0
	adds r3, r4, r1
	orrs r7, r6
	adds r3, #0x3c
	strb r7, [r3]
_02222B8A:
	adds r1, r1, #1
_02222B8C:
	adds r0, r0, #1
	adds r2, r2, #4
	cmp r0, #0xc
	blt _02222B62
	str r1, [r4, #0x38]
	ldrh r0, [r5, #0x32]
	str r0, [r4, #0x4c]
	ldrh r1, [r5, #0x2c]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _02222BAA
	movs r0, #1
	str r0, [r4, #0x50]
	pop {r3, r4, r5, r6, r7, pc}
_02222BAA:
	cmp r0, #2
	bne _02222BB4
	movs r0, #2
	str r0, [r4, #0x50]
	pop {r3, r4, r5, r6, r7, pc}
_02222BB4:
	movs r0, #0
	str r0, [r4, #0x50]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222BBC: .4byte 0x02245A28
	thumb_func_end ov13_02222B34

	thumb_func_start ov13_02222BC0
ov13_02222BC0: @ 0x02222BC0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0
	adds r1, #0xc
	movs r2, #0x20
	blx FUN_020D4790
	ldr r0, [r5]
	adds r1, r4, #0
	strh r0, [r4, #0xa]
	ldrh r2, [r4, #0xa]
	adds r0, r5, #4
	adds r1, #0xc
	blx FUN_020D4A50
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov13_02222BC0

	thumb_func_start ov13_02222BE4
ov13_02222BE4: @ 0x02222BE4
	adds r3, r0, #0
	adds r0, r1, #0
	str r2, [r3]
	adds r1, r3, #4
	ldr r3, _02222BF0 @ =ov13_02222B34
	bx r3
	.align 2, 0
_02222BF0: .4byte ov13_02222B34
	thumb_func_end ov13_02222BE4

	thumb_func_start ov13_02222BF4
ov13_02222BF4: @ 0x02222BF4
	ldr r3, _02222C00 @ =FUN_020D23B0
	adds r1, r0, #0
	ldr r0, _02222C04 @ =0x0224DDA0
	movs r2, #0
	bx r3
	nop
_02222C00: .4byte FUN_020D23B0
_02222C04: .4byte 0x0224DDA0
	thumb_func_end ov13_02222BF4

	thumb_func_start ov13_02222C08
ov13_02222C08: @ 0x02222C08
	ldr r3, _02222C14 @ =FUN_020D23B0
	adds r1, r0, #0
	ldr r0, _02222C18 @ =0x0224DDA0
	movs r2, #0
	bx r3
	nop
_02222C14: .4byte FUN_020D23B0
_02222C18: .4byte 0x0224DDA0
	thumb_func_end ov13_02222C08

	thumb_func_start ov13_02222C1C
ov13_02222C1C: @ 0x02222C1C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _02222CCC @ =0x0224DDA0
	ldr r1, _02222CD0 @ =0x0224DD90
	movs r2, #4
	movs r4, #1
	blx FUN_020D2388
	cmp r5, #0
	beq _02222C36
	cmp r6, #0
	bne _02222C3C
_02222C36:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02222C3C:
	blx FUN_020D3A38
	ldr r1, _02222CD4 @ =0x0224DD80
	str r5, [r1]
	str r6, [r1, #0xc]
	blx FUN_020D3A4C
	ldr r1, _02222CD4 @ =0x0224DD80
	ldr r0, _02222CD8 @ =0x00005890
	ldr r1, [r1]
	blx r1
	adds r1, r0, #0
	ldr r0, _02222CD4 @ =0x0224DD80
	str r1, [r0, #8]
	bne _02222C5E
	subs r0, r4, #2
	pop {r3, r4, r5, r6, r7, pc}
_02222C5E:
	ldr r0, _02222CDC @ =ov13_02222BF4
	ldr r2, _02222CD8 @ =0x00005890
	bl ov13_022236B8
	cmp r0, #0
	bne _02222C6C
	movs r4, #0
_02222C6C:
	cmp r4, #0
	beq _02222CBC
	ldr r5, _02222CCC @ =0x0224DDA0
	add r6, sp, #0
	movs r7, #1
_02222C76:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	blx FUN_020D2444
	ldr r0, [sp]
	cmp r0, #0xf
	bhi _02222CB6
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02222C92: @ jump table
	.2byte _02222CB6 - _02222C92 - 2 @ case 0
	.2byte _02222CB6 - _02222C92 - 2 @ case 1
	.2byte _02222CB6 - _02222C92 - 2 @ case 2
	.2byte _02222CB6 - _02222C92 - 2 @ case 3
	.2byte _02222CB8 - _02222C92 - 2 @ case 4
	.2byte _02222CB8 - _02222C92 - 2 @ case 5
	.2byte _02222CB2 - _02222C92 - 2 @ case 6
	.2byte _02222CB6 - _02222C92 - 2 @ case 7
	.2byte _02222CB6 - _02222C92 - 2 @ case 8
	.2byte _02222CB6 - _02222C92 - 2 @ case 9
	.2byte _02222CB6 - _02222C92 - 2 @ case 10
	.2byte _02222CB6 - _02222C92 - 2 @ case 11
	.2byte _02222CB6 - _02222C92 - 2 @ case 12
	.2byte _02222CB6 - _02222C92 - 2 @ case 13
	.2byte _02222CB6 - _02222C92 - 2 @ case 14
	.2byte _02222CB6 - _02222C92 - 2 @ case 15
_02222CB2:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02222CB6:
	movs r4, #0
_02222CB8:
	cmp r4, #0
	bne _02222C76
_02222CBC:
	ldr r1, _02222CD4 @ =0x0224DD80
	ldr r0, [r1, #8]
	ldr r1, [r1, #0xc]
	blx r1
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222CCC: .4byte 0x0224DDA0
_02222CD0: .4byte 0x0224DD90
_02222CD4: .4byte 0x0224DD80
_02222CD8: .4byte 0x00005890
_02222CDC: .4byte ov13_02222BF4
	thumb_func_end ov13_02222C1C

	thumb_func_start ov13_02222CE0
ov13_02222CE0: @ 0x02222CE0
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02222D70 @ =0x0224DD80
	movs r4, #1
	ldr r0, [r0, #0xc]
	subs r5, r4, #2
	cmp r0, #0
	bne _02222CF2
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_02222CF2:
	bl ov13_022235DC
	cmp r0, #0
	bne _02222CFE
	subs r0, r4, #2
	pop {r3, r4, r5, r6, r7, pc}
_02222CFE:
	ldr r7, _02222D74 @ =0x0224DDA0
	ldr r6, _02222D70 @ =0x0224DD80
_02222D02:
	adds r0, r7, #0
	add r1, sp, #0
	movs r2, #1
	blx FUN_020D2444
	ldr r0, [sp]
	cmp r0, #0x14
	bhi _02222D54
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02222D1E: @ jump table
	.2byte _02222D54 - _02222D1E - 2 @ case 0
	.2byte _02222D54 - _02222D1E - 2 @ case 1
	.2byte _02222D54 - _02222D1E - 2 @ case 2
	.2byte _02222D54 - _02222D1E - 2 @ case 3
	.2byte _02222D56 - _02222D1E - 2 @ case 4
	.2byte _02222D56 - _02222D1E - 2 @ case 5
	.2byte _02222D54 - _02222D1E - 2 @ case 6
	.2byte _02222D54 - _02222D1E - 2 @ case 7
	.2byte _02222D54 - _02222D1E - 2 @ case 8
	.2byte _02222D54 - _02222D1E - 2 @ case 9
	.2byte _02222D54 - _02222D1E - 2 @ case 10
	.2byte _02222D54 - _02222D1E - 2 @ case 11
	.2byte _02222D54 - _02222D1E - 2 @ case 12
	.2byte _02222D54 - _02222D1E - 2 @ case 13
	.2byte _02222D54 - _02222D1E - 2 @ case 14
	.2byte _02222D54 - _02222D1E - 2 @ case 15
	.2byte _02222D54 - _02222D1E - 2 @ case 16
	.2byte _02222D54 - _02222D1E - 2 @ case 17
	.2byte _02222D54 - _02222D1E - 2 @ case 18
	.2byte _02222D54 - _02222D1E - 2 @ case 19
	.2byte _02222D48 - _02222D1E - 2 @ case 20
_02222D48:
	ldr r0, [r6, #8]
	movs r4, #0
	ldr r1, [r6, #0xc]
	adds r5, r4, #0
	blx r1
	b _02222D56
_02222D54:
	movs r4, #0
_02222D56:
	cmp r4, #0
	bne _02222D02
	blx FUN_020D3A38
	ldr r1, _02222D70 @ =0x0224DD80
	movs r2, #0
	str r2, [r1]
	str r2, [r1, #0xc]
	blx FUN_020D3A4C
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222D70: .4byte 0x0224DD80
_02222D74: .4byte 0x0224DDA0
	thumb_func_end ov13_02222CE0

	thumb_func_start ov13_02222D78
ov13_02222D78: @ 0x02222D78
	push {r3, r4, r5, r6, r7, lr}
	movs r5, #0
	mvns r5, r5
	bl ov13_022235A4
	cmp r0, #0
	beq _02222DA8
	ldr r4, _02222DAC @ =0x0224DDA0
	add r6, sp, #0
	movs r7, #1
_02222D8C:
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	blx FUN_020D2444
	ldr r0, [sp]
	cmp r0, #0xe
	bne _02222DA2
	movs r0, #0
	adds r5, r0, #0
	b _02222DA4
_02222DA2:
	movs r0, #0
_02222DA4:
	cmp r0, #0
	bne _02222D8C
_02222DA8:
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02222DAC: .4byte 0x0224DDA0
	thumb_func_end ov13_02222D78

	thumb_func_start ov13_02222DB0
ov13_02222DB0: @ 0x02222DB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp, #4]
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x10]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r6, #0
	ldr r0, _02222F14 @ =0x0224DD80
	adds r7, r6, #0
	ldr r1, [r0]
	adds r5, r6, #0
	cmp r1, #0
	beq _02222DD4
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _02222DDC
_02222DD4:
	movs r0, #0
	add sp, #0x44
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_02222DDC:
	movs r0, #3
	lsls r0, r0, #0xc
	blx r1
	adds r4, r0, #0
	bne _02222DEC
	add sp, #0x44
	subs r0, r6, #1
	pop {r4, r5, r6, r7, pc}
_02222DEC:
	adds r0, r6, #0
	ldr r3, _02222F18 @ =0x0030BFFE
	adds r1, r0, #0
	adds r2, r0, #0
	str r4, [sp, #8]
	bl ov13_02223478
	cmp r0, #0
	bne _02222E00
	b _02222F04
_02222E00:
	add r0, sp, #0x18
	blx FUN_020D36AC
	movs r0, #0x13
	str r0, [sp]
	ldr r1, _02222F1C @ =0x003FEC42
	ldr r3, _02222F20 @ =ov13_02222C08
	add r0, sp, #0x18
	adds r2, r6, #0
	blx FUN_020D37E8
_02222E16:
	ldr r0, _02222F24 @ =0x0224DDA0
	add r1, sp, #0x14
	movs r2, #1
	blx FUN_020D2444
	ldr r0, [sp, #0x14]
	cmp r0, #0x13
	bhi _02222EEA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02222E32: @ jump table
	.2byte _02222EEA - _02222E32 - 2 @ case 0
	.2byte _02222EEA - _02222E32 - 2 @ case 1
	.2byte _02222EEA - _02222E32 - 2 @ case 2
	.2byte _02222EEA - _02222E32 - 2 @ case 3
	.2byte _02222EA0 - _02222E32 - 2 @ case 4
	.2byte _02222E78 - _02222E32 - 2 @ case 5
	.2byte _02222EEA - _02222E32 - 2 @ case 6
	.2byte _02222EEA - _02222E32 - 2 @ case 7
	.2byte _02222EA0 - _02222E32 - 2 @ case 8
	.2byte _02222EEA - _02222E32 - 2 @ case 9
	.2byte _02222E9A - _02222E32 - 2 @ case 10
	.2byte _02222EEA - _02222E32 - 2 @ case 11
	.2byte _02222EEA - _02222E32 - 2 @ case 12
	.2byte _02222EEA - _02222E32 - 2 @ case 13
	.2byte _02222EEA - _02222E32 - 2 @ case 14
	.2byte _02222EEA - _02222E32 - 2 @ case 15
	.2byte _02222EEA - _02222E32 - 2 @ case 16
	.2byte _02222EEA - _02222E32 - 2 @ case 17
	.2byte _02222EA0 - _02222E32 - 2 @ case 18
	.2byte _02222E5A - _02222E32 - 2 @ case 19
_02222E5A:
	cmp r6, #0
	bne _02222EA0
	cmp r5, #0
	beq _02222E6C
	adds r0, r4, #0
	movs r1, #0x40
	bl ov13_02223434
	adds r7, r0, #0
_02222E6C:
	bl ov13_02223568
	cmp r0, #0
	beq _02222EEA
	movs r6, #1
	b _02222EA0
_02222E78:
	cmp r6, #0
	bne _02222EA0
	cmp r5, #8
	bge _02222E84
	adds r5, r5, #1
	b _02222EA0
_02222E84:
	adds r0, r4, #0
	movs r1, #0x40
	bl ov13_02223434
	adds r7, r0, #0
	bl ov13_02223568
	cmp r0, #0
	beq _02222EEA
	movs r6, #1
	b _02222EA0
_02222E9A:
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
_02222EA0:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _02222E16
	cmp r7, #0
	beq _02222EBE
	subs r1, r7, #1
	movs r0, #0x54
	muls r0, r1, r0
	ldr r1, _02222F14 @ =0x0224DD80
	adds r0, #0x58
	ldr r1, [r1]
	blx r1
	cmp r0, #0
	bne _02222ECA
	b _02222EEA
_02222EBE:
	ldr r1, _02222F14 @ =0x0224DD80
	movs r0, #0x58
	ldr r1, [r1]
	blx r1
	cmp r0, #0
	beq _02222EEA
_02222ECA:
	ldr r1, [sp, #4]
	movs r6, #0
	str r0, [r1]
	str r7, [r0]
	cmp r7, #0
	ble _02222EEA
	adds r5, r0, #4
_02222ED8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov13_02222B34
	adds r6, r6, #1
	adds r4, #0xc0
	adds r5, #0x54
	cmp r6, r7
	blt _02222ED8
_02222EEA:
	add r0, sp, #0x18
	blx FUN_020D3854
	ldr r5, _02222F24 @ =0x0224DDA0
	add r4, sp, #0x14
	movs r6, #0
_02222EF6:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	blx FUN_020D2444
	cmp r0, #1
	beq _02222EF6
_02222F04:
	ldr r1, _02222F14 @ =0x0224DD80
	ldr r0, [sp, #8]
	ldr r1, [r1, #0xc]
	blx r1
	ldr r0, [sp, #0x10]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_02222F14: .4byte 0x0224DD80
_02222F18: .4byte 0x0030BFFE
_02222F1C: .4byte 0x003FEC42
_02222F20: .4byte ov13_02222C08
_02222F24: .4byte 0x0224DDA0
	thumb_func_end ov13_02222DB0

	thumb_func_start ov13_02222F28
ov13_02222F28: @ 0x02222F28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	movs r4, #1
	adds r7, r0, #0
	subs r0, r4, #2
	str r0, [sp, #0xc]
	ldr r0, [r7, #0x24]
	movs r6, #0
	str r1, [sp, #4]
	cmp r0, #0
	bne _02222F42
	lsls r5, r4, #0x13
	b _02222F4A
_02222F42:
	cmp r0, #1
	bne _02222F4A
	movs r5, #3
	lsls r5, r5, #0x12
_02222F4A:
	movs r0, #3
	lsls r0, r0, #0x10
	orrs r5, r0
	ldr r0, _022230DC @ =0x0224DE80
	movs r1, #0
	movs r2, #0x60
	blx FUN_020D4994
	ldr r0, [r7, #0x28]
	cmp r0, #5
	bne _02222F68
	ldr r0, _022230DC @ =0x0224DE80
	movs r1, #1
	strb r1, [r0]
	b _02222F88
_02222F68:
	cmp r0, #0xd
	bne _02222F74
	ldr r0, _022230DC @ =0x0224DE80
	movs r1, #2
	strb r1, [r0]
	b _02222F88
_02222F74:
	cmp r0, #0x10
	bne _02222F80
	ldr r0, _022230DC @ =0x0224DE80
	movs r1, #3
	strb r1, [r0]
	b _02222F88
_02222F80:
	movs r0, #0
	add sp, #0x40
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02222F88:
	movs r1, #0x14
	ldr r2, _022230DC @ =0x0224DE80
	muls r1, r6, r1
	adds r1, r1, #2
	adds r0, r7, #0
	strb r6, [r2, #1]
	adds r1, r2, r1
	ldr r2, [r7, #0x28]
	adds r0, #0x2c
	blx FUN_020D4A50
	blx FUN_020AF9BC
	ldr r2, [r7]
	ldr r3, _022230E0 @ =0x0030BFFE
	movs r0, #0
	adds r1, r7, #4
	bl ov13_02223478
	cmp r0, #0
	bne _02222FB4
	b _022230C2
_02222FB4:
	movs r0, #0
	str r0, [sp, #8]
	add r0, sp, #0x14
	blx FUN_020D36AC
	movs r0, #0x12
	str r0, [sp]
	ldr r1, _022230E4 @ =0x003FEC42
	ldr r3, _022230E8 @ =ov13_02222C08
	add r0, sp, #0x14
	movs r2, #0
	blx FUN_020D37E8
	b _022230A4
_02222FD0:
	ldr r0, _022230EC @ =0x0224DDA0
	add r1, sp, #0x10
	movs r2, #1
	blx FUN_020D2444
	ldr r0, [sp, #0x10]
	cmp r0, #0x13
	bhi _022230A2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02222FEC: @ jump table
	.2byte _022230A2 - _02222FEC - 2 @ case 0
	.2byte _022230A2 - _02222FEC - 2 @ case 1
	.2byte _022230A2 - _02222FEC - 2 @ case 2
	.2byte _022230A2 - _02222FEC - 2 @ case 3
	.2byte _022230A4 - _02222FEC - 2 @ case 4
	.2byte _0222301C - _02222FEC - 2 @ case 5
	.2byte _022230A2 - _02222FEC - 2 @ case 6
	.2byte _022230A2 - _02222FEC - 2 @ case 7
	.2byte _022230A4 - _02222FEC - 2 @ case 8
	.2byte _022230A2 - _02222FEC - 2 @ case 9
	.2byte _02223062 - _02222FEC - 2 @ case 10
	.2byte _022230A2 - _02222FEC - 2 @ case 11
	.2byte _0222307C - _02222FEC - 2 @ case 12
	.2byte _02223082 - _02222FEC - 2 @ case 13
	.2byte _022230A2 - _02222FEC - 2 @ case 14
	.2byte _022230A2 - _02222FEC - 2 @ case 15
	.2byte _022230A2 - _02222FEC - 2 @ case 16
	.2byte _022230A2 - _02222FEC - 2 @ case 17
	.2byte _02223014 - _02222FEC - 2 @ case 18
	.2byte _0222301A - _02222FEC - 2 @ case 19
_02223014:
	cmp r6, #0
	bne _022230A4
	movs r4, #0
_0222301A:
	b _022230A4
_0222301C:
	cmp r6, #0
	bne _022230A4
	add r0, sp, #0x14
	blx FUN_020D3854
	ldr r0, _022230F0 @ =0x0224DDC0
	movs r1, #1
	bl ov13_02223434
	cmp r0, #1
	beq _02223036
	movs r4, #0
	b _022230A4
_02223036:
	ldr r1, _022230F0 @ =0x0224DDC0
	adds r0, r7, #0
	bl ov13_02222BC0
	ldr r1, _022230F4 @ =0x0224DDC0
	movs r0, #0
	ldrh r1, [r1, #0xa]
	b _02223048
_02223046:
	adds r0, r0, #1
_02223048:
	cmp r0, r1
	blt _02223046
	ldr r0, _022230F0 @ =0x0224DDC0
	ldr r1, _022230DC @ =0x0224DE80
	adds r2, r5, #0
	bl ov13_02223634
	cmp r0, #0
	bne _0222305E
	movs r4, #0
	b _022230A4
_0222305E:
	movs r6, #1
	b _022230A4
_02223062:
	ldr r1, _022230F0 @ =0x0224DDC0
	adds r0, r7, #0
	bl ov13_02222BC0
	ldr r0, _022230F0 @ =0x0224DDC0
	ldr r1, _022230DC @ =0x0224DE80
	adds r2, r5, #0
	bl ov13_02223634
	cmp r0, #0
	bne _022230A4
	movs r4, #0
	b _022230A4
_0222307C:
	movs r4, #0
	str r4, [sp, #0xc]
	b _022230A4
_02223082:
	ldr r0, [sp, #8]
	adds r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #3
	bge _0222309E
	ldr r0, _022230F0 @ =0x0224DDC0
	ldr r1, _022230DC @ =0x0224DE80
	adds r2, r5, #0
	bl ov13_02223634
	cmp r0, #0
	bne _022230A4
	movs r4, #0
	b _022230A4
_0222309E:
	movs r4, #0
	b _022230A4
_022230A2:
	movs r4, #0
_022230A4:
	cmp r4, #0
	bne _02222FD0
	add r0, sp, #0x14
	blx FUN_020D3854
	ldr r5, _022230EC @ =0x0224DDA0
	add r4, sp, #0x10
	movs r6, #0
_022230B4:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	blx FUN_020D2444
	cmp r0, #1
	beq _022230B4
_022230C2:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _022230CC
	movs r2, #1
	b _022230CE
_022230CC:
	movs r2, #0
_022230CE:
	ldr r0, [sp, #4]
	ldr r1, _022230F0 @ =0x0224DDC0
	bl ov13_02222BE4
	ldr r0, [sp, #0xc]
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022230DC: .4byte 0x0224DE80
_022230E0: .4byte 0x0030BFFE
_022230E4: .4byte 0x003FEC42
_022230E8: .4byte ov13_02222C08
_022230EC: .4byte 0x0224DDA0
_022230F0: .4byte 0x0224DDC0
_022230F4: .4byte 0x0224DDC0
	thumb_func_end ov13_02222F28

	thumb_func_start ov13_022230F8
ov13_022230F8: @ 0x022230F8
	ldr r3, _022230FC @ =FUN_020D2108
	bx r3
	.align 2, 0
_022230FC: .4byte FUN_020D2108
	thumb_func_end ov13_022230F8

	thumb_func_start ov13_02223100
ov13_02223100: @ 0x02223100
	push {r3, lr}
	ldr r1, _02223110 @ =0x0224DD80
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _0222310C
	blx r1
_0222310C:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_02223110: .4byte 0x0224DD80
	thumb_func_end ov13_02223100

	thumb_func_start ov13_02223114
ov13_02223114: @ 0x02223114
	push {r3, lr}
	cmp r0, #0
	bne _0222311C
	b _022233C4
_0222311C:
	movs r1, #0
	ldrsh r2, [r0, r1]
	cmp r2, #7
	bls _02223126
	b _022233B6
_02223126:
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_02223132: @ jump table
	.2byte _022233B6 - _02223132 - 2 @ case 0
	.2byte _02223142 - _02223132 - 2 @ case 1
	.2byte _0222336A - _02223132 - 2 @ case 2
	.2byte _022231C2 - _02223132 - 2 @ case 3
	.2byte _02223226 - _02223132 - 2 @ case 4
	.2byte _022231F4 - _02223132 - 2 @ case 5
	.2byte _022232C6 - _02223132 - 2 @ case 6
	.2byte _022233A2 - _02223132 - 2 @ case 7
_02223142:
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _022231AE
	ldr r2, _022233C8 @ =0x0224DEE0
	ldr r0, [r2, #0x18]
	cmp r0, #4
	bne _02223162
	movs r0, #3
	str r0, [r2, #0x18]
	ldr r2, [r2, #0x1c]
	cmp r2, #0
	beq _022231BA
	movs r0, #6
	blx r2
	pop {r3, pc}
_02223162:
	cmp r0, #6
	bne _02223188
	ldr r0, [r2, #0x10]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #4]
	blx FUN_020ADCB4
	cmp r0, #3
	beq _022231BA
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022231BA
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_02223188:
	cmp r0, #8
	bne _022231BA
	ldr r0, [r2, #0x20]
	ldr r1, [r2, #0x24]
	ldr r2, [r2, #0xc]
	blx FUN_020ADEF0
	cmp r0, #3
	beq _022231BA
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022231BA
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_022231AE:
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r3, #1
	str r3, [r0, #0x18]
	ldr r3, [r0, #0x1c]
	cmp r3, #0
	bne _022231BC
_022231BA:
	b _022233C4
_022231BC:
	adds r0, r2, #0
	blx r3
	pop {r3, pc}
_022231C2:
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _022231E2
	ldr r0, _022233C8 @ =0x0224DEE0
	ldr r2, [r0, #0x18]
	cmp r2, #6
	bne _022232BE
	movs r2, #5
	str r2, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	movs r0, #8
	blx r2
	pop {r3, pc}
_022231E2:
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r2, #3
	str r2, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	movs r0, #9
	blx r2
	pop {r3, pc}
_022231F4:
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _02223214
	ldr r0, _022233C8 @ =0x0224DEE0
	ldr r2, [r0, #0x18]
	cmp r2, #8
	bne _022232BE
	movs r2, #7
	str r2, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	movs r0, #0xc
	blx r2
	pop {r3, pc}
_02223214:
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r2, #3
	str r2, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	movs r0, #0xd
	blx r2
	pop {r3, pc}
_02223226:
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _022232B2
	ldr r2, _022233C8 @ =0x0224DEE0
	ldr r0, [r2, #0x18]
	cmp r0, #4
	bne _02223246
	movs r0, #3
	str r0, [r2, #0x18]
	ldr r2, [r2, #0x1c]
	cmp r2, #0
	beq _022232BE
	movs r0, #0xa
	blx r2
	pop {r3, pc}
_02223246:
	cmp r0, #6
	bne _0222326C
	ldr r0, [r2, #0x10]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #4]
	blx FUN_020ADCB4
	cmp r0, #3
	beq _022232BE
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_0222326C:
	cmp r0, #2
	bne _0222328C
	blx FUN_020ADBC4
	cmp r0, #3
	beq _022232BE
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_0222328C:
	cmp r0, #8
	bne _022232BE
	ldr r0, [r2, #0x20]
	ldr r1, [r2, #0x24]
	ldr r2, [r2, #0xc]
	blx FUN_020ADEF0
	cmp r0, #3
	beq _022232BE
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_022232B2:
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r2, #3
	str r2, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	bne _022232C0
_022232BE:
	b _022233C4
_022232C0:
	movs r0, #0xb
	blx r2
	pop {r3, pc}
_022232C6:
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _02223358
	ldr r2, _022233C8 @ =0x0224DEE0
	ldr r0, [r2, #0x18]
	cmp r0, #4
	bne _022232E6
	movs r0, #3
	str r0, [r2, #0x18]
	ldr r2, [r2, #0x1c]
	cmp r2, #0
	beq _022233C4
	movs r0, #0xe
	blx r2
	pop {r3, pc}
_022232E6:
	cmp r0, #6
	bne _0222330C
	ldr r0, [r2, #0x10]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #4]
	blx FUN_020ADCB4
	cmp r0, #3
	beq _022233C4
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_0222330C:
	cmp r0, #2
	bne _0222332C
	blx FUN_020ADBC4
	cmp r0, #3
	beq _022233C4
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_0222332C:
	cmp r0, #8
	bne _02223352
	ldr r0, [r2, #0x20]
	ldr r1, [r2, #0x24]
	ldr r2, [r2, #0xc]
	blx FUN_020ADEF0
	cmp r0, #3
	beq _022233C4
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_02223352:
	movs r0, #3
	str r0, [r2, #0x18]
	pop {r3, pc}
_02223358:
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r2, #3
	str r2, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	movs r0, #0xf
	blx r2
	pop {r3, pc}
_0222336A:
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _02223390
	ldr r0, _022233C8 @ =0x0224DEE0
	ldr r0, [r0, #0x18]
	cmp r0, #2
	bne _022233C4
	blx FUN_020AD968
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r1, #0
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	movs r0, #0x14
	blx r2
	pop {r3, pc}
_02223390:
	ldr r0, _022233C8 @ =0x0224DEE0
	movs r3, #3
	str r3, [r0, #0x18]
	ldr r3, [r0, #0x1c]
	cmp r3, #0
	beq _022233C4
	adds r0, r2, #0
	blx r3
	pop {r3, pc}
_022233A2:
	ldr r0, _022233C8 @ =0x0224DEE0
	ldr r2, [r0, #0x18]
	cmp r2, #5
	bne _022233C4
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	movs r0, #5
	blx r2
	pop {r3, pc}
_022233B6:
	ldr r0, _022233C8 @ =0x0224DEE0
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	movs r0, #1
	movs r1, #0
	blx r2
_022233C4:
	pop {r3, pc}
	nop
_022233C8: .4byte 0x0224DEE0
	thumb_func_end ov13_02223114

	thumb_func_start ov13_022233CC
ov13_022233CC: @ 0x022233CC
	push {r3, lr}
	ldr r1, _0222342C @ =0x0224DEE0
	ldr r0, [r1, #0x18]
	cmp r0, #8
	bhi _02223422
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022233E2: @ jump table
	.2byte _02223422 - _022233E2 - 2 @ case 0
	.2byte _02223412 - _022233E2 - 2 @ case 1
	.2byte _02223422 - _022233E2 - 2 @ case 2
	.2byte _02223422 - _022233E2 - 2 @ case 3
	.2byte _02223422 - _022233E2 - 2 @ case 4
	.2byte _022233F4 - _022233E2 - 2 @ case 5
	.2byte _02223422 - _022233E2 - 2 @ case 6
	.2byte _02223406 - _022233E2 - 2 @ case 7
	.2byte _02223422 - _022233E2 - 2 @ case 8
_022233F4:
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	blx FUN_020ADCB4
	cmp r0, #3
	beq _02223426
	movs r0, #0
	pop {r3, pc}
_02223406:
	blx FUN_020AE0F4
	cmp r0, #3
	beq _02223426
	movs r0, #0
	pop {r3, pc}
_02223412:
	ldr r0, [r1, #8]
	ldr r1, _02223430 @ =ov13_02223114
	blx FUN_020AD9C0
	cmp r0, #3
	beq _02223426
	movs r0, #0
	pop {r3, pc}
_02223422:
	movs r0, #0
	pop {r3, pc}
_02223426:
	movs r0, #1
	pop {r3, pc}
	nop
_0222342C: .4byte 0x0224DEE0
_02223430: .4byte ov13_02223114
	thumb_func_end ov13_022233CC

	thumb_func_start ov13_02223434
ov13_02223434: @ 0x02223434
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #1
	adds r7, r1, #0
	blx FUN_020AFA68
	blx FUN_020AFA10
	adds r6, r0, #0
	cmp r6, #0
	ble _0222346C
	movs r4, #0
	cmp r6, #0
	ble _0222346C
_02223450:
	cmp r4, r7
	bge _0222346C
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	blx FUN_020AFAE4
	adds r1, r5, #0
	movs r2, #0xc0
	blx FUN_020D4808
	adds r4, r4, #1
	adds r5, #0xc0
	cmp r4, r6
	blt _02223450
_0222346C:
	movs r0, #0
	blx FUN_020AFA68
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov13_02223434

	thumb_func_start ov13_02223478
ov13_02223478: @ 0x02223478
	push {r3, r4, r5, r6, r7, lr}
	str r3, [sp]
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	blx FUN_020D3A38
	adds r7, r0, #0
	ldr r1, _02223554 @ =0x0224DEE0
	ldr r0, [sp]
	cmp r5, #0
	str r0, [r1, #4]
	beq _022234AC
	ldr r2, _02223558 @ =0x0224DF08
	movs r1, #0
_02223496:
	ldrb r0, [r5]
	adds r1, r1, #1
	adds r5, r5, #1
	strb r0, [r2]
	adds r2, r2, #1
	cmp r1, #6
	blt _02223496
	ldr r1, _02223558 @ =0x0224DF08
	ldr r0, _02223554 @ =0x0224DEE0
	str r1, [r0, #0x10]
	b _022234BC
_022234AC:
	ldr r0, _02223558 @ =0x0224DF08
	movs r1, #0xff
	movs r2, #6
	blx FUN_020D4994
	ldr r1, _0222355C @ =0x02108FC0
	ldr r0, _02223554 @ =0x0224DEE0
	str r1, [r0, #0x10]
_022234BC:
	cmp r4, #0
	beq _022234FA
	cmp r6, #0
	ble _022234FA
	cmp r6, #0x20
	bgt _022234FA
	movs r0, #0
	cmp r6, #0
	ble _022234DE
	ldr r2, _02223560 @ =0x0224DF10
_022234D0:
	ldrb r1, [r4]
	adds r0, r0, #1
	adds r4, r4, #1
	strb r1, [r2]
	adds r2, r2, #1
	cmp r0, r6
	blt _022234D0
_022234DE:
	cmp r0, #0x20
	bge _022234F2
	ldr r1, _02223560 @ =0x0224DF10
	adds r2, r1, r0
	movs r1, #0
_022234E8:
	adds r0, r0, #1
	strb r1, [r2]
	adds r2, r2, #1
	cmp r0, #0x20
	blt _022234E8
_022234F2:
	ldr r1, _02223560 @ =0x0224DF10
	ldr r0, _02223554 @ =0x0224DEE0
	str r1, [r0, #0x14]
	b _0222350A
_022234FA:
	ldr r0, _02223560 @ =0x0224DF10
	movs r1, #0xff
	movs r2, #0x20
	blx FUN_020D4994
	ldr r1, _02223564 @ =0x02108FC8
	ldr r0, _02223554 @ =0x0224DEE0
	str r1, [r0, #0x14]
_0222350A:
	ldr r2, _02223554 @ =0x0224DEE0
	ldr r0, [r2, #0x18]
	cmp r0, #3
	bne _02223530
	ldr r0, [r2, #0x10]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #4]
	blx FUN_020ADCB4
	cmp r0, #3
	bne _02223548
	ldr r0, _02223554 @ =0x0224DEE0
	movs r1, #6
	str r1, [r0, #0x18]
	adds r0, r7, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223530:
	bl ov13_022233CC
	cmp r0, #1
	bne _02223548
	ldr r0, _02223554 @ =0x0224DEE0
	movs r1, #6
	str r1, [r0, #0x18]
	adds r0, r7, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223548:
	adds r0, r7, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223554: .4byte 0x0224DEE0
_02223558: .4byte 0x0224DF08
_0222355C: .4byte 0x02108FC0
_02223560: .4byte 0x0224DF10
_02223564: .4byte 0x02108FC8
	thumb_func_end ov13_02223478

	thumb_func_start ov13_02223568
ov13_02223568: @ 0x02223568
	push {r4, lr}
	blx FUN_020D3A38
	adds r4, r0, #0
	ldr r0, _022235A0 @ =0x0224DEE0
	ldr r0, [r0, #0x18]
	cmp r0, #5
	bne _02223596
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	blx FUN_020ADCB4
	cmp r0, #3
	bne _02223596
	ldr r0, _022235A0 @ =0x0224DEE0
	movs r1, #4
	str r1, [r0, #0x18]
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r4, pc}
_02223596:
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_022235A0: .4byte 0x0224DEE0
	thumb_func_end ov13_02223568

	thumb_func_start ov13_022235A4
ov13_022235A4: @ 0x022235A4
	push {r4, lr}
	blx FUN_020D3A38
	adds r4, r0, #0
	ldr r0, _022235D8 @ =0x0224DEE0
	ldr r0, [r0, #0x18]
	cmp r0, #7
	bne _022235CC
	blx FUN_020AE0F4
	cmp r0, #3
	bne _022235CC
	ldr r0, _022235D8 @ =0x0224DEE0
	movs r1, #4
	str r1, [r0, #0x18]
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r4, pc}
_022235CC:
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r4, pc}
	nop
_022235D8: .4byte 0x0224DEE0
	thumb_func_end ov13_022235A4

	thumb_func_start ov13_022235DC
ov13_022235DC: @ 0x022235DC
	push {r4, lr}
	blx FUN_020D3A38
	adds r4, r0, #0
	ldr r0, _02223630 @ =0x0224DEE0
	ldr r0, [r0, #0x18]
	cmp r0, #3
	bne _0222360E
	blx FUN_020ADBC4
	cmp r0, #3
	beq _022235FE
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r4, pc}
_022235FE:
	ldr r0, _02223630 @ =0x0224DEE0
	movs r1, #2
	str r1, [r0, #0x18]
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r4, pc}
_0222360E:
	bl ov13_022233CC
	cmp r0, #1
	bne _02223626
	ldr r0, _02223630 @ =0x0224DEE0
	movs r1, #2
	str r1, [r0, #0x18]
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r4, pc}
_02223626:
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_02223630: .4byte 0x0224DEE0
	thumb_func_end ov13_022235DC

	thumb_func_start ov13_02223634
ov13_02223634: @ 0x02223634
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	blx FUN_020D3A38
	ldr r1, _022236B4 @ =0x0224DEE0
	adds r4, r0, #0
	str r6, [r1, #0xc]
	cmp r5, #0
	beq _02223656
	ldr r1, [r1, #0x24]
	adds r0, r5, #0
	movs r2, #0x50
	blx FUN_020D4A50
	b _02223660
_02223656:
	ldr r0, [r1, #0x24]
	movs r1, #0
	movs r2, #0x50
	blx FUN_020D4994
_02223660:
	ldr r1, _022236B4 @ =0x0224DEE0
	adds r0, r7, #0
	ldr r1, [r1, #0x20]
	movs r2, #0xc0
	blx FUN_020D4808
	bl ov13_022233CC
	cmp r0, #1
	bne _02223684
	ldr r0, _022236B4 @ =0x0224DEE0
	movs r1, #8
	str r1, [r0, #0x18]
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223684:
	ldr r2, _022236B4 @ =0x0224DEE0
	ldr r0, [r2, #0x18]
	cmp r0, #3
	bne _022236AA
	ldr r0, [r2, #0x20]
	ldr r1, [r2, #0x24]
	ldr r2, [r2, #0xc]
	blx FUN_020ADEF0
	cmp r0, #3
	bne _022236AA
	ldr r0, _022236B4 @ =0x0224DEE0
	movs r1, #8
	str r1, [r0, #0x18]
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022236AA:
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022236B4: .4byte 0x0224DEE0
	thumb_func_end ov13_02223634

	thumb_func_start ov13_022236B8
ov13_022236B8: @ 0x022236B8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	str r2, [sp]
	blx FUN_020D3A38
	adds r4, r0, #0
	adds r0, r5, #0
	ldr r2, _02223764 @ =0x0224DEE0
	adds r0, #0x53
	movs r1, #3
	bics r0, r1
	adds r6, r0, #0
	str r5, [r2, #0x24]
	adds r6, #0x2f
	movs r1, #0x1f
	ldr r3, _02223768 @ =0x0000231F
	str r0, [r2, #8]
	bics r6, r1
	str r6, [r2]
	adds r6, r6, r3
	bics r6, r1
	str r6, [r2, #0x20]
	adds r6, #0xdf
	bics r6, r1
	str r6, [r0, #4]
	ldr r1, [sp]
	ldr r0, [r2, #8]
	adds r5, r5, r1
	ldr r1, [r0, #4]
	subs r1, r5, r1
	str r1, [r0, #8]
	ldr r0, [r2, #8]
	movs r1, #0
	str r1, [r0, #0xc]
	ldr r0, [r2, #8]
	movs r1, #3
	str r1, [r0]
	str r7, [r2, #0x1c]
	ldr r0, [r2, #0x18]
	cmp r0, #0
	bne _0222372A
	subs r3, #0x1f
	ldr r0, [r2]
	adds r1, r3, #0
	blx FUN_020AD850
	cmp r0, #0
	beq _02223724
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02223724:
	ldr r0, _02223764 @ =0x0224DEE0
	movs r1, #1
	str r1, [r0, #0x18]
_0222372A:
	ldr r0, _02223764 @ =0x0224DEE0
	ldr r1, [r0, #0x18]
	cmp r1, #1
	bne _02223758
	ldr r0, [r0, #8]
	ldr r1, _0222376C @ =ov13_02223114
	blx FUN_020AD9C0
	cmp r0, #3
	beq _02223748
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02223748:
	ldr r0, _02223764 @ =0x0224DEE0
	movs r1, #4
	str r1, [r0, #0x18]
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223758:
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223764: .4byte 0x0224DEE0
_02223768: .4byte 0x0000231F
_0222376C: .4byte ov13_02223114
	thumb_func_end ov13_022236B8

	thumb_func_start ov13_02223770
ov13_02223770: @ 0x02223770
	push {r3, lr}
	cmp r0, #0
	bne _02223778
	b _02223A72
_02223778:
	movs r1, #0
	ldrsh r2, [r0, r1]
	cmp r2, #9
	bls _02223782
	b _02223A64
_02223782:
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0222378E: @ jump table
	.2byte _02223A64 - _0222378E - 2 @ case 0
	.2byte _022237A2 - _0222378E - 2 @ case 1
	.2byte _022239F2 - _0222378E - 2 @ case 2
	.2byte _02223828 - _0222378E - 2 @ case 3
	.2byte _02223896 - _0222378E - 2 @ case 4
	.2byte _02223860 - _0222378E - 2 @ case 5
	.2byte _0222393E - _0222378E - 2 @ case 6
	.2byte _02223A2E - _0222378E - 2 @ case 7
	.2byte _02223A44 - _0222378E - 2 @ case 8
	.2byte _02223A52 - _0222378E - 2 @ case 9
_022237A2:
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _02223814
	ldr r2, _02223A74 @ =0x0224DF30
	ldr r0, [r2, #0x2c]
	cmp r0, #4
	bne _022237C4
	movs r0, #3
	str r0, [r2, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223858
	movs r0, #6
	blx r2
	pop {r3, pc}
_022237C4:
	cmp r0, #6
	bne _022237EC
	ldr r0, [r2, #0x44]
	ldr r1, [r2, #0x48]
	ldr r2, [r2, #0x60]
	blx FUN_020ADCB4
	cmp r0, #3
	beq _02223858
	ldr r0, _02223A74 @ =0x0224DF30
	movs r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223858
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_022237EC:
	cmp r0, #8
	bne _02223858
	ldr r0, [r2, #0x4c]
	ldr r1, [r2, #0x28]
	ldr r2, [r2, #0x58]
	blx FUN_020ADEF0
	cmp r0, #3
	beq _02223858
	ldr r0, _02223A74 @ =0x0224DF30
	movs r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223858
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_02223814:
	ldr r0, _02223A74 @ =0x0224DF30
	movs r3, #1
	str r3, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r3, [r0]
	cmp r3, #0
	beq _02223858
	adds r0, r2, #0
	blx r3
	pop {r3, pc}
_02223828:
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0222384A
	ldr r0, _02223A74 @ =0x0224DF30
	ldr r2, [r0, #0x2c]
	cmp r2, #6
	bne _02223858
	movs r2, #5
	str r2, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223858
	movs r0, #8
	blx r2
	pop {r3, pc}
_0222384A:
	ldr r0, _02223A74 @ =0x0224DF30
	movs r2, #3
	str r2, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	bne _0222385A
_02223858:
	b _02223A72
_0222385A:
	movs r0, #9
	blx r2
	pop {r3, pc}
_02223860:
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _02223882
	ldr r0, _02223A74 @ =0x0224DF30
	ldr r2, [r0, #0x2c]
	cmp r2, #8
	bne _0222395A
	movs r2, #7
	str r2, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	movs r0, #0xc
	blx r2
	pop {r3, pc}
_02223882:
	ldr r0, _02223A74 @ =0x0224DF30
	movs r2, #3
	str r2, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	movs r0, #0xd
	blx r2
	pop {r3, pc}
_02223896:
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0222392A
	ldr r2, _02223A74 @ =0x0224DF30
	ldr r0, [r2, #0x2c]
	cmp r0, #4
	bne _022238B8
	movs r0, #3
	str r0, [r2, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	movs r0, #0xa
	blx r2
	pop {r3, pc}
_022238B8:
	cmp r0, #6
	bne _022238E0
	ldr r0, [r2, #0x44]
	ldr r1, [r2, #0x48]
	ldr r2, [r2, #0x60]
	blx FUN_020ADCB4
	cmp r0, #3
	beq _0222395A
	ldr r0, _02223A74 @ =0x0224DF30
	movs r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_022238E0:
	cmp r0, #2
	bne _02223902
	blx FUN_020ADBC4
	cmp r0, #3
	beq _0222395A
	ldr r0, _02223A74 @ =0x0224DF30
	movs r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_02223902:
	cmp r0, #8
	bne _0222395A
	ldr r0, [r2, #0x4c]
	ldr r1, [r2, #0x28]
	ldr r2, [r2, #0x58]
	blx FUN_020ADEF0
	cmp r0, #3
	beq _0222395A
	ldr r0, _02223A74 @ =0x0224DF30
	movs r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_0222392A:
	ldr r0, _02223A74 @ =0x0224DF30
	movs r2, #3
	str r2, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	movs r0, #0xb
	blx r2
	pop {r3, pc}
_0222393E:
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _022239DE
	ldr r2, _02223A74 @ =0x0224DF30
	ldr r0, [r2, #0x2c]
	cmp r0, #4
	bne _02223962
	movs r0, #3
	str r0, [r2, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	bne _0222395C
_0222395A:
	b _02223A72
_0222395C:
	movs r0, #0xe
	blx r2
	pop {r3, pc}
_02223962:
	cmp r0, #6
	bne _0222398A
	ldr r0, [r2, #0x44]
	ldr r1, [r2, #0x48]
	ldr r2, [r2, #0x60]
	blx FUN_020ADCB4
	cmp r0, #3
	beq _02223A72
	ldr r0, _02223A74 @ =0x0224DF30
	movs r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_0222398A:
	cmp r0, #2
	bne _022239AC
	blx FUN_020ADBC4
	cmp r0, #3
	beq _02223A72
	ldr r0, _02223A74 @ =0x0224DF30
	movs r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_022239AC:
	cmp r0, #8
	bne _022239D4
	ldr r0, [r2, #0x4c]
	ldr r1, [r2, #0x28]
	ldr r2, [r2, #0x58]
	blx FUN_020ADEF0
	cmp r0, #3
	beq _02223A72
	ldr r0, _02223A74 @ =0x0224DF30
	movs r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	movs r0, #2
	movs r1, #0
	blx r2
	pop {r3, pc}
_022239D4:
	cmp r0, #7
	bne _02223A72
	movs r0, #3
	str r0, [r2, #0x2c]
	pop {r3, pc}
_022239DE:
	ldr r0, _02223A74 @ =0x0224DF30
	movs r2, #3
	str r2, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	movs r0, #0xf
	blx r2
	pop {r3, pc}
_022239F2:
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _02223A1A
	ldr r0, _02223A74 @ =0x0224DF30
	ldr r0, [r0, #0x2c]
	cmp r0, #2
	bne _02223A72
	blx FUN_020AD968
	ldr r0, _02223A74 @ =0x0224DF30
	movs r1, #0
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	movs r0, #0x14
	blx r2
	pop {r3, pc}
_02223A1A:
	ldr r0, _02223A74 @ =0x0224DF30
	movs r3, #3
	str r3, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r3, [r0]
	cmp r3, #0
	beq _02223A72
	adds r0, r2, #0
	blx r3
	pop {r3, pc}
_02223A2E:
	ldr r0, _02223A74 @ =0x0224DF30
	ldr r0, [r0, #0x2c]
	cmp r0, #5
	bne _02223A72
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	movs r0, #5
	blx r2
	pop {r3, pc}
_02223A44:
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	movs r0, #4
	blx r2
	pop {r3, pc}
_02223A52:
	ldr r0, _02223A74 @ =0x0224DF30
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	movs r0, #3
	blx r2
	pop {r3, pc}
_02223A64:
	ldr r0, _02223A78 @ =0x0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	movs r0, #1
	movs r1, #0
	blx r2
_02223A72:
	pop {r3, pc}
	.align 2, 0
_02223A74: .4byte 0x0224DF30
_02223A78: .4byte 0x0224DFB0
	thumb_func_end ov13_02223770

	thumb_func_start ov13_02223A7C
ov13_02223A7C: @ 0x02223A7C
	push {r3, lr}
	ldr r1, _02223ADC @ =0x0224DF30
	ldr r0, [r1, #0x2c]
	cmp r0, #8
	bhi _02223AD2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02223A92: @ jump table
	.2byte _02223AD2 - _02223A92 - 2 @ case 0
	.2byte _02223AC2 - _02223A92 - 2 @ case 1
	.2byte _02223AD2 - _02223A92 - 2 @ case 2
	.2byte _02223AD2 - _02223A92 - 2 @ case 3
	.2byte _02223AD2 - _02223A92 - 2 @ case 4
	.2byte _02223AA4 - _02223A92 - 2 @ case 5
	.2byte _02223AD2 - _02223A92 - 2 @ case 6
	.2byte _02223AB6 - _02223A92 - 2 @ case 7
	.2byte _02223AD2 - _02223A92 - 2 @ case 8
_02223AA4:
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	blx FUN_020ADCB4
	cmp r0, #3
	beq _02223AD6
	movs r0, #0
	pop {r3, pc}
_02223AB6:
	blx FUN_020AE0F4
	cmp r0, #3
	beq _02223AD6
	movs r0, #0
	pop {r3, pc}
_02223AC2:
	ldr r0, [r1, #8]
	ldr r1, _02223AE0 @ =ov13_02223770
	blx FUN_020AD9C0
	cmp r0, #3
	beq _02223AD6
	movs r0, #0
	pop {r3, pc}
_02223AD2:
	movs r0, #0
	pop {r3, pc}
_02223AD6:
	movs r0, #1
	pop {r3, pc}
	nop
_02223ADC: .4byte 0x0224DF30
_02223AE0: .4byte ov13_02223770
	thumb_func_end ov13_02223A7C

	thumb_func_start ov13_02223AE4
ov13_02223AE4: @ 0x02223AE4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #1
	adds r7, r1, #0
	blx FUN_020AFA68
	blx FUN_020AFA10
	adds r6, r0, #0
	cmp r6, #0
	ble _02223B1C
	movs r4, #0
	cmp r6, #0
	ble _02223B1C
_02223B00:
	cmp r4, r7
	bge _02223B1C
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	blx FUN_020AFAE4
	adds r1, r5, #0
	movs r2, #0xc0
	blx FUN_020D4808
	adds r4, r4, #1
	adds r5, #0xc0
	cmp r4, r6
	blt _02223B00
_02223B1C:
	movs r0, #0
	blx FUN_020AFA68
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov13_02223AE4

	thumb_func_start ov13_02223B28
ov13_02223B28: @ 0x02223B28
	push {r3, r4, r5, r6, r7, lr}
	str r3, [sp]
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	blx FUN_020D3A38
	adds r7, r0, #0
	ldr r1, _02223BFC @ =0x0224DF30
	ldr r0, [sp]
	cmp r5, #0
	str r0, [r1, #0x60]
	ldr r0, _02223C00 @ =0x0224E3E8
	str r0, [r1, #0x44]
	beq _02223B58
	movs r2, #0
_02223B48:
	ldrb r1, [r5]
	adds r2, r2, #1
	adds r5, r5, #1
	strb r1, [r0]
	adds r0, r0, #1
	cmp r2, #6
	blt _02223B48
	b _02223B66
_02223B58:
	movs r1, #0xff
	movs r2, #6
	blx FUN_020D4994
	ldr r1, _02223C04 @ =0x02108FC0
	ldr r0, _02223BFC @ =0x0224DF30
	str r1, [r0, #0x44]
_02223B66:
	ldr r2, _02223C08 @ =0x0224E420
	ldr r0, _02223BFC @ =0x0224DF30
	cmp r4, #0
	str r2, [r0, #0x48]
	beq _02223BA2
	cmp r6, #0
	ble _02223BA2
	cmp r6, #0x20
	bge _02223BA2
	movs r0, #0
	cmp r6, #0
	ble _02223B8C
_02223B7E:
	ldrb r1, [r4]
	adds r0, r0, #1
	adds r4, r4, #1
	strb r1, [r2]
	adds r2, r2, #1
	cmp r0, r6
	blt _02223B7E
_02223B8C:
	cmp r0, #0x20
	bge _02223BB2
	ldr r1, _02223C08 @ =0x0224E420
	adds r2, r1, r0
	movs r1, #0
_02223B96:
	adds r0, r0, #1
	strb r1, [r2]
	adds r2, r2, #1
	cmp r0, #0x20
	blt _02223B96
	b _02223BB2
_02223BA2:
	ldr r0, _02223C08 @ =0x0224E420
	movs r1, #0xff
	movs r2, #0x20
	blx FUN_020D4994
	ldr r1, _02223C0C @ =0x02108FC8
	ldr r0, _02223BFC @ =0x0224DF30
	str r1, [r0, #0x48]
_02223BB2:
	ldr r2, _02223BFC @ =0x0224DF30
	ldr r0, [r2, #0x2c]
	cmp r0, #3
	bne _02223BD8
	ldr r1, [r2, #0x48]
	ldr r0, _02223C00 @ =0x0224E3E8
	ldr r2, [r2, #0x60]
	blx FUN_020ADCB4
	cmp r0, #3
	bne _02223BF0
	ldr r0, _02223BFC @ =0x0224DF30
	movs r1, #6
	str r1, [r0, #0x2c]
	adds r0, r7, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223BD8:
	bl ov13_02223A7C
	cmp r0, #1
	bne _02223BF0
	ldr r0, _02223BFC @ =0x0224DF30
	movs r1, #6
	str r1, [r0, #0x2c]
	adds r0, r7, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223BF0:
	adds r0, r7, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223BFC: .4byte 0x0224DF30
_02223C00: .4byte 0x0224E3E8
_02223C04: .4byte 0x02108FC0
_02223C08: .4byte 0x0224E420
_02223C0C: .4byte 0x02108FC8
	thumb_func_end ov13_02223B28

	thumb_func_start ov13_02223C10
ov13_02223C10: @ 0x02223C10
	push {r4, lr}
	blx FUN_020D3A38
	adds r4, r0, #0
	ldr r0, _02223C44 @ =0x0224DF30
	ldr r0, [r0, #0x2c]
	cmp r0, #7
	bne _02223C38
	blx FUN_020AE0F4
	cmp r0, #3
	bne _02223C38
	ldr r0, _02223C44 @ =0x0224DF30
	movs r1, #4
	str r1, [r0, #0x2c]
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r4, pc}
_02223C38:
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r4, pc}
	nop
_02223C44: .4byte 0x0224DF30
	thumb_func_end ov13_02223C10

	thumb_func_start ov13_02223C48
ov13_02223C48: @ 0x02223C48
	push {r4, lr}
	blx FUN_020D3A38
	adds r4, r0, #0
	ldr r0, _02223C9C @ =0x0224DF30
	ldr r0, [r0, #0x2c]
	cmp r0, #3
	bne _02223C7A
	blx FUN_020ADBC4
	cmp r0, #3
	beq _02223C6A
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r4, pc}
_02223C6A:
	ldr r0, _02223C9C @ =0x0224DF30
	movs r1, #2
	str r1, [r0, #0x2c]
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r4, pc}
_02223C7A:
	bl ov13_02223A7C
	cmp r0, #1
	bne _02223C92
	ldr r0, _02223C9C @ =0x0224DF30
	movs r1, #2
	str r1, [r0, #0x2c]
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r4, pc}
_02223C92:
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_02223C9C: .4byte 0x0224DF30
	thumb_func_end ov13_02223C48

	thumb_func_start ov13_02223CA0
ov13_02223CA0: @ 0x02223CA0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	blx FUN_020D3A38
	ldr r1, _02223D20 @ =0x0224DF30
	adds r4, r0, #0
	str r6, [r1, #0x58]
	cmp r5, #0
	beq _02223CC2
	ldr r1, [r1, #0x28]
	adds r0, r5, #0
	movs r2, #0x60
	blx FUN_020D4A50
	b _02223CCC
_02223CC2:
	ldr r0, [r1, #0x28]
	movs r1, #0
	movs r2, #0x60
	blx FUN_020D4994
_02223CCC:
	ldr r1, _02223D20 @ =0x0224DF30
	adds r0, r7, #0
	ldr r1, [r1, #0x4c]
	movs r2, #0xc0
	blx FUN_020D4808
	bl ov13_02223A7C
	cmp r0, #1
	bne _02223CF0
	ldr r0, _02223D20 @ =0x0224DF30
	movs r1, #8
	str r1, [r0, #0x2c]
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223CF0:
	ldr r2, _02223D20 @ =0x0224DF30
	ldr r0, [r2, #0x2c]
	cmp r0, #3
	bne _02223D16
	ldr r0, [r2, #0x4c]
	ldr r1, [r2, #0x28]
	ldr r2, [r2, #0x58]
	blx FUN_020ADEF0
	cmp r0, #3
	bne _02223D16
	ldr r0, _02223D20 @ =0x0224DF30
	movs r1, #8
	str r1, [r0, #0x2c]
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223D16:
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02223D20: .4byte 0x0224DF30
	thumb_func_end ov13_02223CA0

	thumb_func_start ov13_02223D24
ov13_02223D24: @ 0x02223D24
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	str r2, [sp]
	blx FUN_020D3A38
	adds r4, r0, #0
	adds r0, r5, #0
	ldr r2, _02223DD0 @ =0x0224DF30
	adds r0, #0x63
	movs r1, #3
	bics r0, r1
	adds r6, r0, #0
	str r5, [r2, #0x28]
	adds r6, #0x2f
	movs r1, #0x1f
	ldr r3, _02223DD4 @ =0x0000231F
	str r0, [r2, #8]
	bics r6, r1
	str r6, [r2, #0x3c]
	adds r6, r6, r3
	bics r6, r1
	str r6, [r2, #0x4c]
	adds r6, #0xdf
	bics r6, r1
	str r6, [r0, #4]
	ldr r1, [sp]
	ldr r0, [r2, #8]
	adds r5, r5, r1
	ldr r1, [r0, #4]
	subs r1, r5, r1
	str r1, [r0, #8]
	ldr r0, [r2, #8]
	movs r1, #0
	str r1, [r0, #0xc]
	ldr r0, [r2, #8]
	movs r1, #3
	str r1, [r0]
	ldr r0, _02223DD8 @ =0x0224DFB0
	str r7, [r0]
	ldr r0, [r2, #0x2c]
	cmp r0, #0
	bne _02223D98
	subs r3, #0x1f
	ldr r0, [r2, #0x3c]
	adds r1, r3, #0
	blx FUN_020AD850
	cmp r0, #0
	beq _02223D92
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02223D92:
	ldr r0, _02223DD0 @ =0x0224DF30
	movs r1, #1
	str r1, [r0, #0x2c]
_02223D98:
	ldr r0, _02223DD0 @ =0x0224DF30
	ldr r1, [r0, #0x2c]
	cmp r1, #1
	bne _02223DC6
	ldr r0, [r0, #8]
	ldr r1, _02223DDC @ =ov13_02223770
	blx FUN_020AD9C0
	cmp r0, #3
	beq _02223DB6
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02223DB6:
	ldr r0, _02223DD0 @ =0x0224DF30
	movs r1, #4
	str r1, [r0, #0x2c]
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223DC6:
	adds r0, r4, #0
	blx FUN_020D3A4C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02223DD0: .4byte 0x0224DF30
_02223DD4: .4byte 0x0000231F
_02223DD8: .4byte 0x0224DFB0
_02223DDC: .4byte ov13_02223770
	thumb_func_end ov13_02223D24

	thumb_func_start ov13_02223DE0
ov13_02223DE0: @ 0x02223DE0
	ldr r0, _02223DE8 @ =0x0224DF30
	ldr r0, [r0, #0x2c]
	bx lr
	nop
_02223DE8: .4byte 0x0224DF30
	thumb_func_end ov13_02223DE0

	thumb_func_start ov13_02223DEC
ov13_02223DEC: @ 0x02223DEC
	push {r4, lr}
	adds r4, r1, #0
	cmp r4, #0
	ble _02223E0E
	ldr r0, _02223E14 @ =0x0224DFC4
	blx FUN_020D2618
	ldr r1, _02223E18 @ =0x0224DF30
	adds r0, r4, #0
	ldr r1, [r1, #4]
	blx r1
	adds r4, r0, #0
	ldr r0, _02223E14 @ =0x0224DFC4
	blx FUN_020D269C
	adds r0, r4, #0
	pop {r4, pc}
_02223E0E:
	movs r0, #0
	pop {r4, pc}
	nop
_02223E14: .4byte 0x0224DFC4
_02223E18: .4byte 0x0224DF30
	thumb_func_end ov13_02223DEC

	thumb_func_start ov13_02223E1C
ov13_02223E1C: @ 0x02223E1C
	push {r4, lr}
	adds r4, r1, #0
	beq _02223E3A
	cmp r2, #0
	ble _02223E3A
	ldr r0, _02223E3C @ =0x0224DFC4
	blx FUN_020D2618
	ldr r1, _02223E40 @ =0x0224DF30
	adds r0, r4, #0
	ldr r1, [r1, #0xc]
	blx r1
	ldr r0, _02223E3C @ =0x0224DFC4
	blx FUN_020D269C
_02223E3A:
	pop {r4, pc}
	.align 2, 0
_02223E3C: .4byte 0x0224DFC4
_02223E40: .4byte 0x0224DF30
	thumb_func_end ov13_02223E1C

	thumb_func_start ov13_02223E44
ov13_02223E44: @ 0x02223E44
	push {r3, lr}
	blx FUN_020D3A38
	ldr r1, _02223E64 @ =0x0224DF30
	movs r2, #0
	str r2, [r1, #0x68]
	str r2, [r1, #0x6c]
	ldr r3, _02223E68 @ =0x0224DFB4
	adds r1, r2, #0
_02223E56:
	adds r2, r2, #1
	stm r3!, {r1}
	cmp r2, #4
	blt _02223E56
	blx FUN_020D3A4C
	pop {r3, pc}
	.align 2, 0
_02223E64: .4byte 0x0224DF30
_02223E68: .4byte 0x0224DFB4
	thumb_func_end ov13_02223E44

	thumb_func_start ov13_02223E6C
ov13_02223E6C: @ 0x02223E6C
	push {r3, r4, r5, lr}
	blx FUN_020D3A38
	ldr r1, _02223E9C @ =0x0224DF30
	ldr r5, [r1, #0x6c]
	ldr r2, [r1, #0x68]
	cmp r2, r5
	bne _02223E80
	movs r4, #0
	b _02223E92
_02223E80:
	ldr r2, _02223EA0 @ =0x0224DFB4
	lsls r3, r5, #2
	ldr r4, [r2, r3]
	adds r2, r5, #1
	str r2, [r1, #0x6c]
	cmp r2, #4
	blt _02223E92
	movs r2, #0
	str r2, [r1, #0x6c]
_02223E92:
	blx FUN_020D3A4C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02223E9C: .4byte 0x0224DF30
_02223EA0: .4byte 0x0224DFB4
	thumb_func_end ov13_02223E6C

	thumb_func_start ov13_02223EA4
ov13_02223EA4: @ 0x02223EA4
	push {r3, r4}
	ldr r1, _02223ECC @ =0x0224DF30
	ldr r3, [r1, #0x68]
	ldr r2, [r1, #0x6c]
	adds r4, r3, #1
	cmp r4, r2
	beq _02223EC8
	adds r2, r2, #3
	cmp r3, r2
	beq _02223EC8
	ldr r2, _02223ED0 @ =0x0224DFB4
	lsls r3, r3, #2
	str r0, [r2, r3]
	str r4, [r1, #0x68]
	cmp r4, #4
	blt _02223EC8
	movs r0, #0
	str r0, [r1, #0x68]
_02223EC8:
	pop {r3, r4}
	bx lr
	.align 2, 0
_02223ECC: .4byte 0x0224DF30
_02223ED0: .4byte 0x0224DFB4
	thumb_func_end ov13_02223EA4

	thumb_func_start ov13_02223ED4
ov13_02223ED4: @ 0x02223ED4
	ldr r3, _02223EDC @ =ov13_02223EA4
	movs r1, #0
	bx r3
	nop
_02223EDC: .4byte ov13_02223EA4
	thumb_func_end ov13_02223ED4

	thumb_func_start ov13_02223EE0
ov13_02223EE0: @ 0x02223EE0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _02223F74 @ =0x0224DF30
	movs r4, #1
	str r6, [r0, #0x70]
	bl ov13_02223E44
	movs r0, #0xd0
	adds r7, r6, #0
	muls r7, r0, r7
	ldr r0, _02223F78 @ =0x000024D0
	adds r1, r7, r0
	movs r0, #0xc0
	muls r0, r6, r0
	adds r0, r1, r0
	ldr r1, _02223F74 @ =0x0224DF30
	ldr r1, [r1, #4]
	blx r1
	ldr r6, _02223F74 @ =0x0224DF30
	cmp r0, #0
	str r0, [r6, #0x54]
	bne _02223F10
	subs r0, r4, #2
	pop {r3, r4, r5, r6, r7, pc}
_02223F10:
	movs r1, #0x1f
	adds r2, r0, r1
	adds r0, r1, #0
	subs r0, #0x3f
	adds r3, r2, #0
	ands r3, r0
	ldr r0, _02223F7C @ =0x00002490
	str r3, [r6, #0x40]
	adds r2, r7, r0
	adds r0, r3, r2
	adds r0, r0, r1
	subs r1, #0x3f
	ands r0, r1
	str r0, [r6, #0x5c]
	ldr r0, _02223F80 @ =ov13_02223EA4
	adds r1, r3, #0
	bl ov13_02223D24
	cmp r0, #0
	bne _02223F3C
	subs r0, r4, #3
	pop {r3, r4, r5, r6, r7, pc}
_02223F3C:
	movs r6, #0
	adds r7, r4, #0
_02223F40:
	movs r0, #0xa
	blx FUN_020D2108
	bl ov13_02223E6C
	cmp r0, #0
	beq _02223F6C
_02223F4E:
	cmp r0, #4
	beq _02223F64
	cmp r0, #5
	beq _02223F64
	cmp r0, #6
	bne _02223F60
	adds r4, r6, #0
	adds r5, r7, #0
	b _02223F64
_02223F60:
	movs r4, #0
	subs r5, r4, #2
_02223F64:
	bl ov13_02223E6C
	cmp r0, #0
	bne _02223F4E
_02223F6C:
	cmp r4, #0
	bne _02223F40
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02223F74: .4byte 0x0224DF30
_02223F78: .4byte 0x000024D0
_02223F7C: .4byte 0x00002490
_02223F80: .4byte ov13_02223EA4
	thumb_func_end ov13_02223EE0

	thumb_func_start ov13_02223F84
ov13_02223F84: @ 0x02223F84
	push {r3, r4, r5, r6, r7, lr}
	movs r5, #1
	bl ov13_02223C48
	cmp r0, #0
	beq _02223FC2
	movs r6, #0
	adds r4, r6, #0
	movs r7, #0xa
_02223F96:
	adds r0, r7, #0
	blx FUN_020D2108
	bl ov13_02223E6C
	cmp r0, #0
	beq _02223FBE
_02223FA4:
	cmp r0, #4
	beq _02223FB6
	cmp r0, #5
	beq _02223FB6
	cmp r0, #0x14
	bne _02223FB4
	adds r5, r4, #0
	b _02223FB6
_02223FB4:
	adds r5, r6, #0
_02223FB6:
	bl ov13_02223E6C
	cmp r0, #0
	bne _02223FA4
_02223FBE:
	cmp r5, #0
	bne _02223F96
_02223FC2:
	ldr r1, _02223FD8 @ =0x0224DF30
	ldr r0, [r1, #0x54]
	cmp r0, #0
	beq _02223FD4
	ldr r1, [r1, #0xc]
	blx r1
	ldr r0, _02223FD8 @ =0x0224DF30
	movs r1, #0
	str r1, [r0, #0x54]
_02223FD4:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02223FD8: .4byte 0x0224DF30
	thumb_func_end ov13_02223F84

	thumb_func_start ov13_02223FDC
ov13_02223FDC: @ 0x02223FDC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r0, _022240EC @ =0x0224DF30
	movs r4, #1
	ldr r3, [r0, #0x5c]
	ldr r0, [r0, #0x18]
	movs r2, #0xc0
	adds r1, r0, #0
	muls r1, r2, r1
	subs r5, r4, #3
	adds r6, r3, r1
	bne _02223FFA
	add sp, #0x30
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02223FFA:
	adds r0, r6, #0
	movs r1, #0
	lsls r2, r2, #0xa
	bl ov13_02223CA0
	cmp r0, #0
	bne _0222400E
	add sp, #0x30
	subs r0, r4, #3
	pop {r3, r4, r5, r6, r7, pc}
_0222400E:
	add r0, sp, #4
	blx FUN_020D36AC
	movs r0, #0x12
	str r0, [sp]
	ldr r1, _022240F0 @ =0x003FEC42
	ldr r3, _022240F4 @ =ov13_02223ED4
	add r0, sp, #4
	movs r2, #0
	blx FUN_020D37E8
	movs r7, #0
_02224026:
	bl ov13_02226CBC
	ldr r1, _022240F8 @ =0x02245A58
	ldr r1, [r1, #0xc]
	cmp r0, r1
	blo _02224038
	movs r5, #2
	mvns r5, r5
	b _022240B8
_02224038:
	ldr r0, _022240EC @ =0x0224DF30
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02224046
	movs r5, #7
	mvns r5, r5
	b _022240B8
_02224046:
	movs r0, #0xa
	blx FUN_020D2108
	bl ov13_02223E6C
	cmp r0, #0
	beq _022240B4
_02224054:
	cmp r0, #0xc
	bgt _0222406A
	bge _0222407E
	cmp r0, #5
	bgt _022240AA
	cmp r0, #4
	blt _022240AA
	beq _022240AC
	cmp r0, #5
	beq _022240AC
	b _022240AA
_0222406A:
	cmp r0, #0x13
	bgt _022240AA
	cmp r0, #0xd
	blt _022240AA
	beq _02224084
	cmp r0, #0x12
	beq _022240AC
	cmp r0, #0x13
	beq _022240AC
	b _022240AA
_0222407E:
	adds r4, r7, #0
	movs r5, #1
	b _022240AC
_02224084:
	ldr r0, _022240EC @ =0x0224DF30
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02224094
	movs r4, #0
	adds r5, r4, #0
	subs r5, #8
	b _022240AC
_02224094:
	movs r2, #3
	adds r0, r6, #0
	movs r1, #0
	lsls r2, r2, #0x10
	bl ov13_02223CA0
	cmp r0, #0
	bne _022240AC
	add sp, #0x30
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_022240AA:
	movs r4, #0
_022240AC:
	bl ov13_02223E6C
	cmp r0, #0
	bne _02224054
_022240B4:
	cmp r4, #0
	bne _02224026
_022240B8:
	add r0, sp, #4
	blx FUN_020D3854
_022240BE:
	bl ov13_02223E6C
	cmp r0, #0
	bne _022240BE
	cmp r5, #0
	ble _022240E6
	ldr r0, _022240EC @ =0x0224DF30
	movs r1, #1
	str r1, [r0, #0x20]
	ldr r0, _022240FC @ =0x02245A6C
	blx FUN_020A33FC
	cmp r0, #0
	bge _022240E0
	movs r5, #1
	mvns r5, r5
	b _022240E6
_022240E0:
	ldr r0, _022240EC @ =0x0224DF30
	movs r1, #1
	str r1, [r0, #0x24]
_022240E6:
	adds r0, r5, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022240EC: .4byte 0x0224DF30
_022240F0: .4byte 0x003FEC42
_022240F4: .4byte ov13_02223ED4
_022240F8: .4byte 0x02245A58
_022240FC: .4byte 0x02245A6C
	thumb_func_end ov13_02223FDC

	thumb_func_start ov13_02224100
ov13_02224100: @ 0x02224100
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02224160 @ =0x0224DF30
	movs r5, #1
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _0222414C
	bl ov13_02223C10
	cmp r0, #0
	beq _02224146
	movs r6, #0
	adds r4, r6, #0
	movs r7, #0xa
_0222411A:
	adds r0, r7, #0
	blx FUN_020D2108
	bl ov13_02223E6C
	cmp r0, #0
	beq _02224142
_02224128:
	cmp r0, #4
	beq _0222413A
	cmp r0, #5
	beq _0222413A
	cmp r0, #0xe
	bne _02224138
	adds r5, r4, #0
	b _0222413A
_02224138:
	adds r5, r6, #0
_0222413A:
	bl ov13_02223E6C
	cmp r0, #0
	bne _02224128
_02224142:
	cmp r5, #0
	bne _0222411A
_02224146:
	ldr r0, _02224160 @ =0x0224DF30
	movs r1, #0
	str r1, [r0, #0x20]
_0222414C:
	ldr r0, _02224160 @ =0x0224DF30
	ldr r1, [r0, #0x24]
	cmp r1, #0
	beq _0222415C
	movs r1, #0
	str r1, [r0, #0x24]
	blx FUN_020A3570
_0222415C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02224160: .4byte 0x0224DF30
	thumb_func_end ov13_02224100

	thumb_func_start ov13_02224164
ov13_02224164: @ 0x02224164
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	ldr r0, [sp]
	str r1, [sp, #4]
	adds r6, r0, #4
	adds r0, r1, #0
	adds r4, r0, #4
	ldr r0, [sp, #0x20]
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #0
	bls _02224238
_02224188:
	add r2, sp, #0x48
	adds r2, #2
	movs r1, #0x22
	movs r0, #0
_02224190:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _02224190
	add r0, sp, #0x48
	adds r0, #2
	adds r1, r6, #4
	movs r2, #0x20
	blx FUN_020E5AD8
	add r0, sp, #0x48
	ldr r1, [r6]
	movs r7, #0
	adds r0, #2
	strb r7, [r0, r1]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	str r0, [sp, #0x10]
	cmp r0, #0
	bls _0222421C
	adds r0, r6, #0
	str r0, [sp, #0x24]
	adds r0, #0x28
	ldr r5, [r6]
	str r0, [sp, #0x24]
_022241C2:
	cmp r5, #0
	beq _0222421C
	cmp r5, #0x20
	bhi _0222421C
	cmp r5, #1
	bne _022241D8
	ldrb r0, [r6, #4]
	cmp r0, #0
	beq _0222421C
	cmp r0, #0x20
	beq _0222421C
_022241D8:
	add r0, sp, #0x48
	adds r0, #2
	blx FUN_020E9580
	adds r2, r0, #0
	add r0, sp, #0x48
	adds r0, #2
	adds r1, r4, #4
	blx FUN_020E5BB0
	cmp r0, #0
	bne _02224212
	adds r1, r4, #0
	ldr r0, [sp, #0x24]
	adds r1, #0x28
	movs r2, #6
	blx FUN_020E5BB0
	cmp r0, #0
	bne _02224212
	ldrh r1, [r6, #0x2e]
	ldrh r0, [r4, #0x2e]
	cmp r1, r0
	beq _02224212
	cmp r1, #0
	bne _02224212
	movs r0, #1
	str r0, [sp, #0x20]
	b _0222421C
_02224212:
	ldr r0, [sp, #0x10]
	adds r7, r7, #1
	adds r4, #0x30
	cmp r7, r0
	blo _022241C2
_0222421C:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _02224238
	ldr r0, [sp, #4]
	adds r6, #0x30
	adds r4, r0, #4
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldr r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _02224188
_02224238:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _02224314
	add r2, sp, #0x28
	movs r1, #0x22
	movs r0, #0
_02224244:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _02224244
	movs r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x14]
	ldr r0, [sp]
	ldr r6, [sp, #0x18]
	adds r4, r0, #4
	ldr r0, [sp, #4]
	adds r5, r0, #4
	ldr r0, [r0]
	cmp r0, #0
	bls _022242A0
	add r7, sp, #0x28
_02224264:
	adds r0, r7, #0
	adds r1, r5, #4
	movs r2, #0x20
	blx FUN_020E5AD8
	ldr r1, [r5]
	movs r0, #0
	strb r0, [r7, r1]
	ldr r0, _0222432C @ =0x02245AC4
	blx FUN_020E9580
	adds r2, r0, #0
	ldr r1, _0222432C @ =0x02245AC4
	adds r0, r7, #0
	blx FUN_020E5BB0
	cmp r0, #0
	bne _02224294
	ldrh r0, [r5, #0x2e]
	cmp r0, #0
	bne _02224294
	movs r0, #1
	str r0, [sp, #0x14]
	b _022242A0
_02224294:
	ldr r0, [sp, #4]
	adds r6, r6, #1
	ldr r0, [r0]
	adds r5, #0x30
	cmp r6, r0
	blo _02224264
_022242A0:
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #0
	bls _02224304
	ldr r7, _0222432C @ =0x02245AC4
	add r5, sp, #0x28
_022242B0:
	adds r0, r5, #0
	adds r1, r4, #4
	movs r2, #0x20
	blx FUN_020E5AD8
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r5, r1]
	adds r0, r5, #0
	blx FUN_020E9580
	adds r6, r0, #0
	adds r0, r7, #0
	blx FUN_020E9580
	cmp r6, r0
	bne _022242F2
	adds r0, r7, #0
	blx FUN_020E9580
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	blx FUN_020E5BB0
	cmp r0, #0
	bne _022242F2
	ldrh r0, [r4, #0x2e]
	cmp r0, #0
	bne _022242F2
	movs r0, #1
	str r0, [sp, #0x18]
	b _02224304
_022242F2:
	ldr r0, [sp, #0xc]
	adds r4, #0x30
	adds r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldr r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _022242B0
_02224304:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _02224314
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _02224314
	movs r0, #1
	str r0, [sp, #0x20]
_02224314:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _02224324
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	str r1, [r0]
	movs r0, #1
	str r0, [sp, #0x1c]
_02224324:
	ldr r0, [sp, #0x1c]
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	nop
_0222432C: .4byte 0x02245AC4
	thumb_func_end ov13_02224164

	thumb_func_start ov13_02224330
ov13_02224330: @ 0x02224330
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0x20]
	ldr r0, _022245A8 @ =0x0224DF30
	movs r4, #0
	ldr r1, [r0, #0x70]
	movs r0, #0x30
	muls r0, r1, r0
	str r0, [sp, #0x10]
	adds r0, #0x34
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	movs r0, #1
	mvns r4, r4
	bl ov13_02226CD8
	str r0, [sp, #0xc]
	cmp r0, #0
	beq _02224368
	ldr r1, [sp, #0x10]
	movs r0, #1
	bl ov13_02226CD8
	str r0, [sp, #8]
	cmp r0, #0
	bne _0222436A
_02224368:
	b _0222458E
_0222436A:
	movs r0, #0
	str r0, [sp, #0x1c]
	b _02224556
_02224370:
	bl ov13_02226CBC
	ldr r1, _022245AC @ =0x02245A58
	ldr r1, [r1, #0xc]
	cmp r0, r1
	bhs _0222445A
	movs r0, #0
	ldr r3, _022245B0 @ =0x0030BFFE
	adds r1, r0, #0
	adds r2, r0, #0
	bl ov13_02223B28
	cmp r0, #0
	bne _02224392
	movs r4, #1
	mvns r4, r4
	b _0222458E
_02224392:
	add r0, sp, #0x24
	blx FUN_020D36AC
	movs r0, #0x13
	str r0, [sp]
	ldr r1, _022245B4 @ =0x000FFB10
	ldr r3, _022245B8 @ =ov13_02223ED4
	add r0, sp, #0x24
	movs r2, #0
	blx FUN_020D37E8
	ldr r7, _022245A8 @ =0x0224DF30
	movs r5, #1
	movs r4, #0
	add r6, sp, #0x24
_022243B0:
	movs r0, #0xa
	blx FUN_020D2108
	bl ov13_02226CBC
	ldr r1, _022245AC @ =0x02245A58
	ldr r1, [r1, #0xc]
	cmp r0, r1
	bhs _02224444
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _02224444
	bl ov13_02223E6C
	cmp r0, #0
	beq _02224440
_022243D0:
	cmp r0, #0x13
	bhi _02224436
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022243E0: @ jump table
	.2byte _02224436 - _022243E0 - 2 @ case 0
	.2byte _02224436 - _022243E0 - 2 @ case 1
	.2byte _02224436 - _022243E0 - 2 @ case 2
	.2byte _02224436 - _022243E0 - 2 @ case 3
	.2byte _02224438 - _022243E0 - 2 @ case 4
	.2byte _0222440C - _022243E0 - 2 @ case 5
	.2byte _02224436 - _022243E0 - 2 @ case 6
	.2byte _02224436 - _022243E0 - 2 @ case 7
	.2byte _02224438 - _022243E0 - 2 @ case 8
	.2byte _02224436 - _022243E0 - 2 @ case 9
	.2byte _02224432 - _022243E0 - 2 @ case 10
	.2byte _02224436 - _022243E0 - 2 @ case 11
	.2byte _02224436 - _022243E0 - 2 @ case 12
	.2byte _02224436 - _022243E0 - 2 @ case 13
	.2byte _02224436 - _022243E0 - 2 @ case 14
	.2byte _02224436 - _022243E0 - 2 @ case 15
	.2byte _02224436 - _022243E0 - 2 @ case 16
	.2byte _02224436 - _022243E0 - 2 @ case 17
	.2byte _02224438 - _022243E0 - 2 @ case 18
	.2byte _02224408 - _022243E0 - 2 @ case 19
_02224408:
	movs r5, #0
	b _02224438
_0222440C:
	ldr r0, [r7, #0x5c]
	ldr r1, [r7, #0x70]
	bl ov13_02223AE4
	cmp r0, r4
	ble _02224438
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020D3854
	movs r0, #0x13
	str r0, [sp]
	ldr r1, _022245B4 @ =0x000FFB10
	ldr r3, _022245B8 @ =ov13_02223ED4
	adds r0, r6, #0
	movs r2, #0
	blx FUN_020D37E8
	b _02224438
_02224432:
	movs r5, #0
	b _02224438
_02224436:
	movs r5, #0
_02224438:
	bl ov13_02223E6C
	cmp r0, #0
	bne _022243D0
_02224440:
	cmp r5, #0
	bne _022243B0
_02224444:
	add r0, sp, #0x24
	blx FUN_020D3854
_0222444A:
	bl ov13_02223E6C
	cmp r0, #0
	bne _0222444A
	ldr r1, _022245A8 @ =0x0224DF30
	ldr r0, [r1, #0x10]
	cmp r0, #0
	beq _0222445C
_0222445A:
	b _02224566
_0222445C:
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r1, #0x70]
	cmp r4, r0
	blt _0222446C
	ldr r0, [sp, #0x14]
	subs r4, r0, #6
	b _0222458E
_0222446C:
	ldr r0, [sp, #0x14]
	ldr r5, [r1, #0x5c]
	str r0, [sp, #0x18]
	cmp r4, #0
	ble _022244E2
	ble _022244E2
	ldr r0, [sp, #0xc]
	ldr r7, [sp, #0xc]
	str r0, [sp, #4]
	adds r0, #8
	adds r6, r7, #0
	str r0, [sp, #4]
	adds r6, #0x2c
_02224486:
	adds r1, r5, #0
	ldr r0, [sp, #4]
	adds r1, #0xc
	movs r2, #0x20
	blx FUN_020E5AD8
	ldrh r0, [r5, #0xa]
	str r0, [r7, #4]
	ldrh r0, [r5, #0xa]
	adds r1, r7, r0
	movs r0, #0
	strb r0, [r1, #8]
	ldrh r1, [r5, #0x2c]
	movs r0, #0x10
	tst r0, r1
	beq _022244AA
	movs r0, #1
	b _022244AC
_022244AA:
	movs r0, #0
_022244AC:
	strh r0, [r7, #0x32]
	ldrb r0, [r5, #4]
	adds r7, #0x30
	strb r0, [r6]
	ldrb r0, [r5, #5]
	strb r0, [r6, #1]
	ldrb r0, [r5, #6]
	strb r0, [r6, #2]
	ldrb r0, [r5, #7]
	strb r0, [r6, #3]
	ldrb r0, [r5, #8]
	strb r0, [r6, #4]
	ldrb r0, [r5, #9]
	adds r5, #0xc0
	strb r0, [r6, #5]
	ldr r0, [sp, #4]
	adds r6, #0x30
	adds r0, #0x30
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, r4
	blt _02224486
_022244E2:
	ldr r0, [sp, #0xc]
	str r4, [r0]
	ldr r0, _022245A8 @ =0x0224DF30
	ldr r0, [r0, #0x38]
	cmp r0, #1
	beq _0222453C
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	add r2, sp, #0x20
	bl ov13_02224164
	cmp r0, #0
	beq _0222453C
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x20]
	adds r1, r0, #4
	movs r0, #0x30
	muls r0, r2, r0
	adds r4, r1, r0
	ldr r0, _022245A8 @ =0x0224DF30
	adds r1, r4, #4
	str r2, [r0, #0x18]
	ldr r0, _022245BC @ =0x0224E440
	blx FUN_020E959C
	adds r0, r4, #0
	adds r4, #0x28
	ldrb r2, [r4]
	ldr r1, _022245C0 @ =0x0224E3E0
	adds r0, #0x28
	strb r2, [r1]
	ldrb r2, [r0, #1]
	strb r2, [r1, #1]
	ldrb r2, [r0, #2]
	strb r2, [r1, #2]
	ldrb r2, [r0, #3]
	strb r2, [r1, #3]
	ldrb r2, [r0, #4]
	strb r2, [r1, #4]
	ldrb r0, [r0, #5]
	strb r0, [r1, #5]
	add r0, sp, #0x50
	bl ov13_02226D40
	b _02224566
_0222453C:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	blx FUN_020E5AD8
	ldr r0, _022245A8 @ =0x0224DF30
	movs r1, #2
	str r1, [r0, #0x38]
	bl ov13_02226F3C
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
_02224556:
	ldr r0, [sp, #0x1c]
	cmp r0, #0x1e
	bge _02224566
	ldr r0, _022245A8 @ =0x0224DF30
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _02224566
	b _02224370
_02224566:
	ldr r0, [sp, #0x1c]
	cmp r0, #0x1e
	bge _02224578
	bl ov13_02226CBC
	ldr r1, _022245AC @ =0x02245A58
	ldr r1, [r1, #0xc]
	cmp r0, r1
	bls _0222457E
_02224578:
	movs r4, #2
	mvns r4, r4
	b _0222458E
_0222457E:
	ldr r0, _022245A8 @ =0x0224DF30
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0222458C
	movs r4, #7
	mvns r4, r4
	b _0222458E
_0222458C:
	movs r4, #1
_0222458E:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02224598
	bl ov13_02226CFC
_02224598:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _022245A2
	bl ov13_02226CFC
_022245A2:
	adds r0, r4, #0
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022245A8: .4byte 0x0224DF30
_022245AC: .4byte 0x02245A58
_022245B0: .4byte 0x0030BFFE
_022245B4: .4byte 0x000FFB10
_022245B8: .4byte ov13_02223ED4
_022245BC: .4byte 0x0224E440
_022245C0: .4byte 0x0224E3E0
	thumb_func_end ov13_02224330

	thumb_func_start ov13_022245C4
ov13_022245C4: @ 0x022245C4
	push {r3, lr}
	ldr r2, [sp, #8]
	str r1, [sp]
	adds r1, r3, #0
	movs r3, #0
	blx FUN_020A3038
	cmp r0, #0
	bge _022245DA
	movs r0, #3
	mvns r0, r0
_022245DA:
	pop {r3, pc}
	thumb_func_end ov13_022245C4

	thumb_func_start ov13_022245DC
ov13_022245DC: @ 0x022245DC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #8
	add r0, sp, #4
	strb r1, [r0, #4]
	movs r1, #2
	strb r1, [r0, #5]
	subs r1, r1, #3
	str r1, [sp, #0xc]
	ldr r1, _02224614 @ =0x000001E6
	adds r4, r2, #0
	strh r1, [r0, #6]
	blx FUN_020A2C10
	add r1, sp, #4
	blx FUN_020A3680
	adds r0, r5, #0
	add r1, sp, #8
	add r2, sp, #4
	adds r3, r6, #0
	str r4, [sp]
	bl ov13_022245C4
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_02224614: .4byte 0x000001E6
	thumb_func_end ov13_022245DC

	thumb_func_start ov13_02224618
ov13_02224618: @ 0x02224618
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _02224620 @ =ov13_022245DC
	bx r3
	.align 2, 0
_02224620: .4byte ov13_022245DC
	thumb_func_end ov13_02224618

	thumb_func_start ov13_02224624
ov13_02224624: @ 0x02224624
	push {r3, r4, r5, r6}
	ldrh r5, [r0]
	movs r3, #0
	asrs r4, r5, #8
	lsls r4, r4, #0x18
	lsrs r6, r4, #0x18
	lsls r4, r5, #8
	movs r5, #0xff
	lsls r5, r5, #8
	ands r4, r5
	orrs r4, r6
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [r1]
	ldrh r6, [r0, #2]
	asrs r1, r6, #8
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r1, r6, #8
	ands r1, r5
	orrs r1, r4
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r0, #6
	str r4, [r2]
	adds r2, r1, r4
	adds r4, r0, #0
	cmp r0, r2
	bhs _02224668
_0222465E:
	ldrb r1, [r4]
	adds r4, r4, #1
	adds r3, r3, r1
	cmp r4, r2
	blo _0222465E
_02224668:
	ldrh r5, [r2]
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r5, #8
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	movs r2, #0xff
	lsls r3, r5, #8
	lsls r2, r2, #8
	ands r2, r3
	orrs r2, r4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r1, r2
	beq _0222468C
	movs r0, #0
	pop {r3, r4, r5, r6}
	bx lr
_0222468C:
	adds r0, r0, #6
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
	thumb_func_end ov13_02224624

	thumb_func_start ov13_02224694
ov13_02224694: @ 0x02224694
	push {r3, r4, r5, r6}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, r1
	blo _022246A4
	movs r0, #0
	pop {r3, r4, r5, r6}
	bx lr
_022246A4:
	ldrh r5, [r0]
	asrs r1, r5, #8
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r1, r5, #8
	movs r5, #0xff
	lsls r5, r5, #8
	ands r1, r5
	orrs r1, r6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [r2]
	ldrh r6, [r0, #2]
	adds r0, r0, #4
	asrs r1, r6, #8
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	lsls r1, r6, #8
	ands r1, r5
	orrs r1, r2
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	str r2, [r3]
	adds r2, #0xb
	movs r1, #7
	bics r2, r1
	subs r1, r2, #4
	adds r1, r0, r1
	str r1, [r4]
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
	thumb_func_end ov13_02224694

	thumb_func_start ov13_022246E4
ov13_022246E4: @ 0x022246E4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r5, #8
	str r5, [sp]
	adds r3, r2, #0
	ldrh r2, [r0]
	adds r4, r1, #0
	add r0, sp, #0
	asrs r1, r2, #8
	lsls r6, r2, #8
	movs r2, #0xff
	lsls r1, r1, #0x18
	lsls r2, r2, #8
	lsrs r1, r1, #0x18
	ands r2, r6
	orrs r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r1, r5, r1
	adds r2, r4, #0
	bl ov13_02224694
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov13_022246E4

	thumb_func_start ov13_02224718
ov13_02224718: @ 0x02224718
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r3, #0
	adds r6, r0, #0
	adds r0, r7, #0
	subs r0, #8
	str r1, [sp, #4]
	lsls r0, r0, #0x10
	adds r1, r2, #0
	movs r5, #0
	strb r5, [r1]
	lsrs r0, r0, #0x10
	strb r5, [r1, #1]
	asrs r2, r0, #8
	strb r5, [r1, #2]
	lsls r2, r2, #0x18
	strb r5, [r1, #3]
	lsrs r3, r2, #0x18
	lsls r2, r0, #8
	movs r0, #0xff
	strb r5, [r1, #4]
	lsls r0, r0, #8
	strb r5, [r1, #5]
	ands r0, r2
	strb r5, [r1, #6]
	orrs r0, r3
	strb r5, [r1, #7]
	ldr r3, [sp, #0x20]
	adds r4, r6, #0
	strh r0, [r1]
	cmp r3, #0
	beq _02224768
	movs r0, #0x10
	str r0, [sp]
	adds r0, r6, #6
	adds r2, r7, #0
	bl ov13_02225358
	adds r7, #8
	b _02224770
_02224768:
	adds r0, r6, #6
	adds r2, r7, #0
	blx FUN_020E5AD8
_02224770:
	movs r0, #0
	strb r0, [r6]
	strb r0, [r6, #1]
	strb r0, [r6, #2]
	strb r0, [r6, #3]
	strb r0, [r6, #4]
	strb r0, [r6, #5]
	ldr r0, [sp, #4]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r1, #8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0xff
	lsls r1, r1, #8
	lsls r0, r0, #8
	ands r1, r0
	orrs r1, r2
	strh r1, [r6]
	lsls r1, r7, #0x10
	lsrs r2, r1, #0x10
	asrs r1, r2, #8
	lsls r1, r1, #0x18
	lsls r2, r2, #8
	lsrs r1, r1, #0x18
	ands r0, r2
	orrs r0, r1
	strh r0, [r6, #2]
	adds r0, r4, #6
	adds r4, r0, r7
	adds r1, r6, #0
	cmp r6, r4
	bhs _022247BC
_022247B2:
	ldrb r0, [r1]
	adds r1, r1, #1
	adds r5, r5, r0
	cmp r1, r4
	blo _022247B2
_022247BC:
	lsls r0, r5, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r1, #8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0xff
	lsls r1, r1, #8
	lsls r0, r0, #8
	ands r0, r1
	orrs r0, r2
	strh r0, [r4]
	adds r0, r4, #2
	subs r0, r0, r6
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov13_02224718

	thumb_func_start ov13_022247DC
ov13_022247DC: @ 0x022247DC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	lsls r0, r1, #0x10
	adds r4, r3, #0
	movs r3, #0
	lsrs r0, r0, #0x10
	adds r7, r2, #0
	strb r3, [r5]
	asrs r1, r0, #8
	lsls r2, r0, #8
	movs r0, #0xff
	strb r3, [r5, #1]
	lsls r1, r1, #0x18
	lsls r0, r0, #8
	strb r3, [r5, #2]
	lsrs r1, r1, #0x18
	ands r2, r0
	orrs r1, r2
	strb r3, [r5, #3]
	adds r2, r4, #0
	strh r1, [r5]
	adds r2, #0xb
	movs r1, #7
	bics r2, r1
	lsls r1, r4, #0x10
	subs r6, r2, #4
	lsrs r2, r1, #0x10
	asrs r1, r2, #8
	lsls r1, r1, #0x18
	lsls r2, r2, #8
	ands r0, r2
	lsrs r1, r1, #0x18
	orrs r0, r1
	strh r0, [r5, #2]
	adds r5, r5, #4
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r6, #0
	blx FUN_020E5B44
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	blx FUN_020E5AD8
	adds r0, r5, r6
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov13_022247DC

	thumb_func_start ov13_0222483C
ov13_0222483C: @ 0x0222483C
	push {r4, lr}
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
	adds r0, r4, #0
	adds r0, #8
	bl ov13_022247DC
	subs r0, r0, r4
	adds r1, r0, #0
	subs r1, #8
	strh r1, [r4]
	pop {r4, pc}
	thumb_func_end ov13_0222483C

	thumb_func_start ov13_02224864
ov13_02224864: @ 0x02224864
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp]
	add r1, sp, #0x18
	add r2, sp, #0x14
	bl ov13_02224624
	movs r6, #0
	adds r5, r0, #0
	adds r7, r6, #0
	str r5, [sp, #8]
	str r6, [sp, #4]
	cmp r5, #0
	bne _02224886
	add sp, #0x1c
	adds r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02224886:
	ldr r0, [sp, #0x18]
	cmp r0, #1
	beq _02224892
	add sp, #0x1c
	adds r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02224892:
	ldr r4, [sp, #0x14]
	adds r0, r5, #0
	adds r0, #8
	str r0, [sp, #8]
	add r0, sp, #8
	adds r1, r5, r4
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov13_02224694
	cmp r0, #0
	beq _02224912
_022248AA:
	ldr r1, [sp, #0x10]
	cmp r1, #1
	beq _022248BA
	cmp r1, #2
	beq _022248D2
	cmp r1, #5
	beq _022248EC
	b _02224902
_022248BA:
	ldrh r1, [r0]
	asrs r0, r1, #8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0xff
	lsls r1, r1, #8
	lsls r0, r0, #8
	ands r0, r1
	orrs r0, r2
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	b _02224902
_022248D2:
	ldrh r1, [r0]
	asrs r0, r1, #8
	lsls r2, r1, #8
	movs r1, #0xff
	lsls r0, r0, #0x18
	lsls r1, r1, #8
	lsrs r0, r0, #0x18
	ands r1, r2
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	b _02224902
_022248EC:
	ldrh r1, [r0]
	asrs r0, r1, #8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0xff
	lsls r1, r1, #8
	lsls r0, r0, #8
	ands r0, r1
	orrs r0, r2
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_02224902:
	add r0, sp, #8
	adds r1, r5, r4
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov13_02224694
	cmp r0, #0
	bne _022248AA
_02224912:
	cmp r6, #1
	bne _0222491C
	ldr r0, [sp, #4]
	cmp r0, #1
	beq _02224922
_0222491C:
	add sp, #0x1c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_02224922:
	cmp r7, #1
	blt _0222492C
	movs r1, #1
	ldr r0, [sp]
	b _02224930
_0222492C:
	ldr r0, [sp]
	movs r1, #0
_02224930:
	str r1, [r0]
	movs r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov13_02224864

	thumb_func_start ov13_02224938
ov13_02224938: @ 0x02224938
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r6, r2, #0
	add r1, sp, #8
	add r2, sp, #4
	adds r4, r3, #0
	bl ov13_02224624
	adds r1, r0, #0
	bne _02224954
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_02224954:
	ldr r0, [sp, #8]
	cmp r0, r5
	beq _02224960
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_02224960:
	cmp r4, #0
	beq _0222497A
	movs r0, #0x10
	str r0, [sp]
	ldr r2, [sp, #4]
	adds r0, r6, #0
	adds r3, r4, #0
	bl ov13_02225510
	ldr r0, [sp, #4]
	subs r0, #8
	str r0, [sp, #4]
	b _02224982
_0222497A:
	ldr r2, [sp, #4]
	adds r0, r6, #0
	blx FUN_020E5AD8
_02224982:
	ldr r0, [sp, #4]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov13_02224938

	thumb_func_start ov13_02224988
ov13_02224988: @ 0x02224988
	push {r4, lr}
	sub sp, #0x10
	movs r1, #1
	adds r4, r0, #0
	add r2, sp, #4
	lsls r1, r1, #8
	add r0, sp, #4
	strh r1, [r0]
	ldr r3, _02224A10 @ =0x02242680
	adds r2, #2
	movs r1, #7
_0222499E:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0222499E
	ldr r0, _02224A14 @ =0x02245A58
	movs r1, #1
	ldr r0, [r0]
	add r2, sp, #4
	movs r3, #2
	bl ov13_022247DC
	movs r1, #2
	add r2, sp, #4
	adds r3, r1, #0
	bl ov13_022247DC
	ldr r1, _02224A18 @ =0x0224DF30
	ldr r1, [r1, #0x50]
	cmp r1, #0
	beq _022249D4
	movs r1, #5
	add r2, sp, #4
	movs r3, #2
	bl ov13_022247DC
_022249D4:
	add r2, sp, #4
	movs r1, #3
	adds r2, #2
	movs r3, #7
	bl ov13_022247DC
	ldr r1, _02224A18 @ =0x0224DF30
	adds r3, r0, #0
	ldr r1, [r1, #0x50]
	cmp r1, #0
	beq _022249F6
	ldr r2, _02224A1C @ =0x0224E3D8
	movs r1, #4
	movs r3, #6
	bl ov13_022247DC
	adds r3, r0, #0
_022249F6:
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	ldr r4, _02224A14 @ =0x02245A58
	ldr r2, _02224A20 @ =0x0224E464
	ldr r4, [r4]
	movs r1, #2
	subs r3, r3, r4
	adds r3, #8
	bl ov13_02224718
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_02224A10: .4byte 0x02242680
_02224A14: .4byte 0x02245A58
_02224A18: .4byte 0x0224DF30
_02224A1C: .4byte 0x0224E3D8
_02224A20: .4byte 0x0224E464
	thumb_func_end ov13_02224988

	thumb_func_start ov13_02224A24
ov13_02224A24: @ 0x02224A24
	push {r3, lr}
	blx FUN_020D3C40
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov13_02224A24

	thumb_func_start ov13_02224A30
ov13_02224A30: @ 0x02224A30
	push {r3, r4, lr}
	sub sp, #0x4c
	ldr r1, _02224B1C @ =0x02245B18
	adds r4, r0, #0
	ldrb r0, [r1]
	adds r2, r4, #0
	adds r2, #0xc
	strb r0, [r4, #0xc]
	ldrb r0, [r1, #1]
	strb r0, [r2, #1]
	ldrb r0, [r1, #2]
	strb r0, [r2, #2]
	ldrb r0, [r1, #3]
	add r1, sp, #4
	adds r1, #2
	strb r0, [r2, #3]
	ldr r0, _02224B20 @ =0x0224E3E0
	ldrb r2, [r0]
	strb r2, [r1]
	ldrb r2, [r0, #1]
	strb r2, [r1, #1]
	ldrb r2, [r0, #2]
	strb r2, [r1, #2]
	ldrb r2, [r0, #3]
	strb r2, [r1, #3]
	ldrb r2, [r0, #4]
	ldrb r0, [r0, #5]
	strb r2, [r1, #4]
	strb r0, [r1, #5]
	add r1, sp, #0
	ldrb r2, [r1, #6]
	movs r0, #0xfd
	ands r0, r2
	strb r0, [r1, #6]
	add r0, sp, #0
	bl ov13_02224A24
	add r1, sp, #0
	ldrb r2, [r1]
	ldr r0, _02224B24 @ =0x0224E3D8
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	strb r2, [r0, #2]
	ldrb r2, [r1, #3]
	strb r2, [r0, #3]
	ldrb r2, [r1, #4]
	strb r2, [r0, #4]
	ldrb r2, [r1, #5]
	strb r2, [r0, #5]
	add r0, sp, #4
	adds r0, #2
	movs r2, #6
	blx FUN_020E5BB0
	cmp r0, #0
	bgt _02224AC4
	add r1, sp, #0
	ldrb r0, [r1]
	strb r0, [r4]
	ldrb r0, [r1, #1]
	strb r0, [r4, #1]
	ldrb r0, [r1, #2]
	strb r0, [r4, #2]
	ldrb r0, [r1, #3]
	strb r0, [r4, #3]
	ldrb r0, [r1, #4]
	strb r0, [r4, #4]
	ldrb r0, [r1, #5]
	add r1, sp, #4
	adds r1, #2
	strb r0, [r4, #5]
	b _02224AE2
_02224AC4:
	add r1, sp, #4
	adds r1, #2
	ldrb r0, [r1]
	strb r0, [r4]
	ldrb r0, [r1, #1]
	strb r0, [r4, #1]
	ldrb r0, [r1, #2]
	strb r0, [r4, #2]
	ldrb r0, [r1, #3]
	strb r0, [r4, #3]
	ldrb r0, [r1, #4]
	strb r0, [r4, #4]
	ldrb r0, [r1, #5]
	add r1, sp, #0
	strb r0, [r4, #5]
_02224AE2:
	ldrb r0, [r1]
	strb r0, [r4, #6]
	ldrb r0, [r1, #1]
	strb r0, [r4, #7]
	ldrb r0, [r1, #2]
	strb r0, [r4, #8]
	ldrb r0, [r1, #3]
	strb r0, [r4, #9]
	ldrb r0, [r1, #4]
	strb r0, [r4, #0xa]
	ldrb r0, [r1, #5]
	strb r0, [r4, #0xb]
	ldr r0, _02224B28 @ =0x02245A58
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02224B14
	add r0, sp, #0x2c
	add r1, sp, #0
	bl ov13_02226D40
	add r1, sp, #4
	add r0, sp, #0xc
	adds r1, #2
	bl ov13_02226D40
_02224B14:
	movs r0, #1
	add sp, #0x4c
	pop {r3, r4, pc}
	nop
_02224B1C: .4byte 0x02245B18
_02224B20: .4byte 0x0224E3E0
_02224B24: .4byte 0x0224E3D8
_02224B28: .4byte 0x02245A58
	thumb_func_end ov13_02224A30

	thumb_func_start ov13_02224B2C
ov13_02224B2C: @ 0x02224B2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r1, r0, #0
	str r1, [sp, #4]
	adds r1, #8
	str r1, [sp, #4]
	str r1, [sp, #0x14]
	movs r1, #0
	str r1, [sp]
	ldrh r1, [r0]
	add r3, sp, #0xc
	asrs r0, r1, #8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0xff
	lsls r1, r1, #8
	lsls r0, r0, #8
	ands r0, r1
	orrs r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	add r0, sp, #0x14
	adds r1, r2, r1
	add r2, sp, #0x10
	bl ov13_02224694
	adds r5, r0, #0
	bne _02224B6C
	b _02224CDC
_02224B6C:
	ldr r2, [sp, #0x10]
	ldr r0, _02224CE4 @ =0x00000201
	subs r1, r2, r0
	cmp r1, #9
	bhi _02224BFA
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02224B82: @ jump table
	.2byte _02224B96 - _02224B82 - 2 @ case 0
	.2byte _02224BB6 - _02224B82 - 2 @ case 1
	.2byte _02224BD2 - _02224B82 - 2 @ case 2
	.2byte _02224BFC - _02224B82 - 2 @ case 3
	.2byte _02224C26 - _02224B82 - 2 @ case 4
	.2byte _02224C42 - _02224B82 - 2 @ case 5
	.2byte _02224C42 - _02224B82 - 2 @ case 6
	.2byte _02224C42 - _02224B82 - 2 @ case 7
	.2byte _02224C42 - _02224B82 - 2 @ case 8
	.2byte _02224CA2 - _02224B82 - 2 @ case 9
_02224B96:
	ldr r3, _02224CE8 @ =0x0224E284
	movs r0, #0
	adds r2, r3, #0
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r2, [sp, #0xc]
	adds r0, r3, #0
	adds r1, r5, #0
	blx FUN_020E5AD8
	movs r0, #1
	str r0, [sp]
	b _02224CC6
_02224BB6:
	ldrh r1, [r5]
	asrs r0, r1, #8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0xff
	lsls r1, r1, #8
	lsls r0, r0, #8
	ands r0, r1
	orrs r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _02224CEC @ =0x0224E2B0
	str r1, [r0]
	b _02224CC6
_02224BD2:
	ldrh r3, [r5]
	ldr r1, _02224CF0 @ =0x0224E184
	movs r0, #0
	asrs r2, r3, #8
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	movs r2, #0xff
	lsls r3, r3, #8
	lsls r2, r2, #8
	ands r2, r3
	orrs r2, r4
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	movs r2, #0x57
	lsls r2, r2, #2
_02224BF0:
	adds r0, r0, #1
	str r3, [r1, r2]
	adds r1, #0x28
	cmp r0, #4
	blt _02224BF0
_02224BFA:
	b _02224CC6
_02224BFC:
	ldrh r3, [r5]
	ldr r0, _02224CF0 @ =0x0224E184
	movs r1, #0
	asrs r2, r3, #8
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	movs r2, #0xff
	lsls r3, r3, #8
	lsls r2, r2, #8
	ands r2, r3
	orrs r2, r4
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	movs r2, #0x16
	lsls r2, r2, #4
_02224C1A:
	adds r1, r1, #1
	str r3, [r0, r2]
	adds r0, #0x28
	cmp r1, #4
	blt _02224C1A
	b _02224CC6
_02224C26:
	ldrh r1, [r5]
	asrs r0, r1, #8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0xff
	lsls r1, r1, #8
	lsls r0, r0, #8
	ands r0, r1
	orrs r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _02224CEC @ =0x0224E2B0
	str r1, [r0, #4]
	b _02224CC6
_02224C42:
	adds r0, r0, #5
	subs r2, r2, r0
	movs r0, #0x28
	muls r0, r2, r0
	ldr r1, _02224CF4 @ =0x0224E2E8
	movs r2, #0x20
	adds r0, r1, r0
	movs r1, #0
	blx FUN_020E5B44
	ldr r0, _02224CEC @ =0x0224E2B0
	ldr r1, _02224CF8 @ =0x00000206
	ldr r0, [r0, #0x30]
	cmp r0, #1
	bne _02224C8C
	ldr r2, [sp, #0x10]
	ldr r0, _02224CF4 @ =0x0224E2E8
	subs r2, r2, r1
	movs r1, #0x28
	muls r1, r2, r1
	adds r4, r0, r1
	ldr r0, [sp, #0xc]
	movs r6, #0
	cmp r0, #0
	ble _02224CC6
	adds r7, r6, #0
_02224C76:
	ldrsb r1, [r5, r7]
	adds r0, r4, #0
	adds r5, r5, #1
	bl ov13_02226D0C
	adds r4, r4, r0
	ldr r0, [sp, #0xc]
	adds r6, r6, #1
	cmp r6, r0
	blt _02224C76
	b _02224CC6
_02224C8C:
	ldr r2, [sp, #0x10]
	ldr r0, _02224CF4 @ =0x0224E2E8
	subs r2, r2, r1
	movs r1, #0x28
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [sp, #0xc]
	adds r1, r5, #0
	blx FUN_020E5AD8
	b _02224CC6
_02224CA2:
	ldr r3, _02224CFC @ =0x0224E380
	movs r0, #0
	adds r2, r3, #0
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r2, [sp, #0xc]
	adds r0, r3, #0
	adds r1, r5, #0
	blx FUN_020E5AD8
_02224CC6:
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	add r0, sp, #0x14
	adds r1, r2, r1
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov13_02224694
	adds r5, r0, #0
	beq _02224CDC
	b _02224B6C
_02224CDC:
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02224CE4: .4byte 0x00000201
_02224CE8: .4byte 0x0224E284
_02224CEC: .4byte 0x0224E2B0
_02224CF0: .4byte 0x0224E184
_02224CF4: .4byte 0x0224E2E8
_02224CF8: .4byte 0x00000206
_02224CFC: .4byte 0x0224E380
	thumb_func_end ov13_02224B2C

	thumb_func_start ov13_02224D00
ov13_02224D00: @ 0x02224D00
	push {r4, r5, r6, r7}
	adds r4, r2, #0
	movs r2, #0
	adds r5, r1, #0
	adds r3, r2, #0
	cmp r4, #0
	ble _02224DAE
	movs r7, #0x1f
_02224D10:
	ldrsb r1, [r5, r3]
	cmp r1, #0x63
	bgt _02224D66
	bge _02224D7E
	cmp r1, #0x61
	bgt _02224D60
	bge _02224D7E
	adds r6, r1, #0
	subs r6, #0x30
	cmp r6, #0x16
	bhi _02224D8A
	adds r6, r6, r6
	add r6, pc
	ldrh r6, [r6, #6]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	add pc, r6
_02224D32: @ jump table
	.2byte _02224D78 - _02224D32 - 2 @ case 0
	.2byte _02224D78 - _02224D32 - 2 @ case 1
	.2byte _02224D78 - _02224D32 - 2 @ case 2
	.2byte _02224D78 - _02224D32 - 2 @ case 3
	.2byte _02224D78 - _02224D32 - 2 @ case 4
	.2byte _02224D78 - _02224D32 - 2 @ case 5
	.2byte _02224D78 - _02224D32 - 2 @ case 6
	.2byte _02224D78 - _02224D32 - 2 @ case 7
	.2byte _02224D78 - _02224D32 - 2 @ case 8
	.2byte _02224D78 - _02224D32 - 2 @ case 9
	.2byte _02224D8A - _02224D32 - 2 @ case 10
	.2byte _02224D8A - _02224D32 - 2 @ case 11
	.2byte _02224D8A - _02224D32 - 2 @ case 12
	.2byte _02224D8A - _02224D32 - 2 @ case 13
	.2byte _02224D8A - _02224D32 - 2 @ case 14
	.2byte _02224D8A - _02224D32 - 2 @ case 15
	.2byte _02224D8A - _02224D32 - 2 @ case 16
	.2byte _02224D84 - _02224D32 - 2 @ case 17
	.2byte _02224D84 - _02224D32 - 2 @ case 18
	.2byte _02224D84 - _02224D32 - 2 @ case 19
	.2byte _02224D84 - _02224D32 - 2 @ case 20
	.2byte _02224D84 - _02224D32 - 2 @ case 21
	.2byte _02224D84 - _02224D32 - 2 @ case 22
_02224D60:
	cmp r1, #0x62
	beq _02224D7E
	b _02224D8A
_02224D66:
	cmp r1, #0x65
	bgt _02224D72
	bge _02224D7E
	cmp r1, #0x64
	beq _02224D7E
	b _02224D8A
_02224D72:
	cmp r1, #0x66
	beq _02224D7E
	b _02224D8A
_02224D78:
	subs r1, #0x30
	adds r2, r2, r1
	b _02224D90
_02224D7E:
	subs r1, #0x57
	adds r2, r2, r1
	b _02224D90
_02224D84:
	subs r1, #0x37
	adds r2, r2, r1
	b _02224D90
_02224D8A:
	movs r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_02224D90:
	lsrs r6, r3, #0x1f
	lsls r1, r3, #0x1f
	subs r1, r1, r6
	rors r1, r7
	adds r1, r6, r1
	bne _02224DA0
	lsls r2, r2, #4
	b _02224DA8
_02224DA0:
	adds r6, r3, r6
	asrs r1, r6, #1
	strb r2, [r0, r1]
	movs r2, #0
_02224DA8:
	adds r3, r3, #1
	cmp r3, r4
	blt _02224D10
_02224DAE:
	movs r0, #1
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov13_02224D00

	thumb_func_start ov13_02224DB4
ov13_02224DB4: @ 0x02224DB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	movs r0, #1
	str r0, [sp]
	ldr r0, _02224F1C @ =0x0224E09C
	ldr r1, _02224F20 @ =0x0224E284
	blx FUN_020E959C
	ldr r1, _02224F24 @ =0x0224E2B0
	ldr r0, [r1]
	cmp r0, #3
	bls _02224DCE
	b _02224F0E
_02224DCE:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02224DDA: @ jump table
	.2byte _02224DE2 - _02224DDA - 2 @ case 0
	.2byte _02224DEA - _02224DDA - 2 @ case 1
	.2byte _02224EE2 - _02224DDA - 2 @ case 2
	.2byte _02224EF8 - _02224DDA - 2 @ case 3
_02224DE2:
	ldr r0, _02224F28 @ =0x0224E0B0
	movs r1, #0
	str r1, [r0, #0xc]
	b _02224F14
_02224DEA:
	ldr r1, [r1, #4]
	cmp r1, #0
	bne _02224DF8
	movs r0, #6
	mvns r0, r0
	str r0, [sp]
	b _02224F14
_02224DF8:
	ldr r0, _02224F28 @ =0x0224E0B0
	ldr r6, _02224F2C @ =0x0224E2E8
	ldr r5, _02224F30 @ =0x0224E0C4
	str r1, [r0, #0x10]
	movs r7, #0
	add r4, sp, #4
_02224E04:
	add r0, sp, #4
	adds r1, r6, #0
	movs r2, #0x20
	blx FUN_020E5AD8
	movs r1, #0
	add r0, sp, #0x24
	strb r1, [r0]
	add r0, sp, #4
	blx FUN_020E9580
	cmp r0, #0x10
	bhi _02224E3C
	cmp r0, #0xa
	blo _02224E2E
	beq _02224E66
	cmp r0, #0xd
	beq _02224E78
	cmp r0, #0x10
	beq _02224EA4
	b _02224ED0
_02224E2E:
	cmp r0, #0
	bhi _02224E36
	beq _02224ED6
	b _02224ED0
_02224E36:
	cmp r0, #5
	beq _02224E4A
	b _02224ED0
_02224E3C:
	cmp r0, #0x1a
	bhi _02224E44
	beq _02224E92
	b _02224ED0
_02224E44:
	cmp r0, #0x20
	beq _02224EBE
	b _02224ED0
_02224E4A:
	ldr r0, _02224F28 @ =0x0224E0B0
	movs r1, #1
	str r1, [r0, #0xc]
	ldrb r0, [r4]
	strb r0, [r5]
	ldrb r0, [r4, #1]
	strb r0, [r5, #1]
	ldrb r0, [r4, #2]
	strb r0, [r5, #2]
	ldrb r0, [r4, #3]
	strb r0, [r5, #3]
	ldrb r0, [r4, #4]
	strb r0, [r5, #4]
	b _02224ED6
_02224E66:
	ldr r0, _02224F28 @ =0x0224E0B0
	movs r1, #1
	str r1, [r0, #0xc]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0xa
	bl ov13_02224D00
	b _02224ED6
_02224E78:
	ldr r0, _02224F28 @ =0x0224E0B0
	movs r1, #2
	str r1, [r0, #0xc]
	adds r3, r4, #0
	adds r2, r5, #0
	movs r1, #0xd
_02224E84:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _02224E84
	b _02224ED6
_02224E92:
	ldr r0, _02224F28 @ =0x0224E0B0
	movs r1, #2
	str r1, [r0, #0xc]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x1a
	bl ov13_02224D00
	b _02224ED6
_02224EA4:
	ldr r0, _02224F28 @ =0x0224E0B0
	movs r1, #3
	str r1, [r0, #0xc]
	adds r3, r4, #0
	adds r2, r5, #0
	movs r1, #0x10
_02224EB0:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _02224EB0
	b _02224ED6
_02224EBE:
	ldr r0, _02224F28 @ =0x0224E0B0
	movs r1, #3
	str r1, [r0, #0xc]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x20
	bl ov13_02224D00
	b _02224ED6
_02224ED0:
	movs r0, #6
	mvns r0, r0
	str r0, [sp]
_02224ED6:
	adds r7, r7, #1
	adds r6, #0x28
	adds r5, #0x20
	cmp r7, #4
	blt _02224E04
	b _02224F14
_02224EE2:
	ldr r0, _02224F28 @ =0x0224E0B0
	movs r1, #4
	ldr r4, _02224F34 @ =0x0224E144
	ldr r3, _02224F38 @ =0x0224E380
	str r1, [r0, #0xc]
	movs r2, #8
_02224EEE:
	ldm r3!, {r0, r1}
	stm r4!, {r0, r1}
	subs r2, r2, #1
	bne _02224EEE
	b _02224F14
_02224EF8:
	ldr r0, _02224F28 @ =0x0224E0B0
	movs r1, #5
	ldr r4, _02224F34 @ =0x0224E144
	ldr r3, _02224F38 @ =0x0224E380
	str r1, [r0, #0xc]
	movs r2, #8
_02224F04:
	ldm r3!, {r0, r1}
	stm r4!, {r0, r1}
	subs r2, r2, #1
	bne _02224F04
	b _02224F14
_02224F0E:
	movs r0, #6
	mvns r0, r0
	str r0, [sp]
_02224F14:
	ldr r0, [sp]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02224F1C: .4byte 0x0224E09C
_02224F20: .4byte 0x0224E284
_02224F24: .4byte 0x0224E2B0
_02224F28: .4byte 0x0224E0B0
_02224F2C: .4byte 0x0224E2E8
_02224F30: .4byte 0x0224E0C4
_02224F34: .4byte 0x0224E144
_02224F38: .4byte 0x0224E380
	thumb_func_end ov13_02224DB4

	thumb_func_start ov13_02224F3C
ov13_02224F3C: @ 0x02224F3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	movs r4, #0
	subs r0, r4, #5
	str r0, [sp, #8]
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #1
	str r4, [sp, #0xc]
	str r4, [sp, #4]
	adds r6, r4, #0
	str r1, [r0, #0x1c]
	b _022252EE
_02224F54:
	movs r0, #0x7d
	lsls r0, r0, #2
	blx FUN_020D2108
	ldr r0, _02225284 @ =0x0224DF30
	ldr r0, [r0, #0x1c]
	cmp r0, #0xa
	bls _02224F66
	b _022252EE
_02224F66:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02224F72: @ jump table
	.2byte _022252EE - _02224F72 - 2 @ case 0
	.2byte _02224F88 - _02224F72 - 2 @ case 1
	.2byte _02224FA8 - _02224F72 - 2 @ case 2
	.2byte _02224FBE - _02224F72 - 2 @ case 3
	.2byte _0222500C - _02224F72 - 2 @ case 4
	.2byte _02225074 - _02224F72 - 2 @ case 5
	.2byte _02225098 - _02224F72 - 2 @ case 6
	.2byte _02225142 - _02224F72 - 2 @ case 7
	.2byte _0222519E - _02224F72 - 2 @ case 8
	.2byte _02225226 - _02224F72 - 2 @ case 9
	.2byte _022252C4 - _02224F72 - 2 @ case 10
_02224F88:
	bl ov13_02224330
	str r0, [sp, #8]
	cmp r0, #1
	beq _02224F96
	movs r6, #1
	b _022252EE
_02224F96:
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #3
	str r1, [r0, #0x38]
	bl ov13_02226F3C
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #2
	str r1, [r0, #0x1c]
	b _022252EE
_02224FA8:
	bl ov13_02223FDC
	str r0, [sp, #8]
	cmp r0, #1
	beq _02224FB6
	movs r6, #1
	b _022252EE
_02224FB6:
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #3
	str r1, [r0, #0x1c]
	b _022252EE
_02224FBE:
	movs r0, #2
	adds r1, r0, #0
	movs r2, #0
	blx FUN_020A2EAC
	adds r4, r0, #0
	bpl _02224FD6
	movs r0, #1
	mvns r0, r0
	str r0, [sp, #8]
	movs r6, #1
	b _022252EE
_02224FD6:
	add r5, sp, #0x24
	movs r1, #0
	str r1, [r5]
	str r1, [r5, #4]
	movs r3, #8
	add r2, sp, #0x10
	strb r3, [r2, #0x14]
	movs r3, #2
	strb r3, [r2, #0x15]
	ldr r3, _02225288 @ =0x000001E6
	strh r3, [r2, #0x16]
	str r1, [sp, #0x28]
	adds r1, r5, #0
	blx FUN_020A2ED8
	str r0, [sp, #8]
	cmp r0, #0
	bge _02225004
	movs r0, #1
	mvns r0, r0
	str r0, [sp, #8]
	movs r6, #1
	b _022252EE
_02225004:
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #4
	str r1, [r0, #0x1c]
	b _022252EE
_0222500C:
	bl ov13_02226CBC
	ldr r1, _0222528C @ =0x02245A58
	ldr r1, [r1, #0xc]
	cmp r0, r1
	blo _02225028
	adds r0, r4, #0
	blx FUN_020A30C8
	movs r0, #2
	mvns r0, r0
	str r0, [sp, #8]
	movs r6, #1
	b _022252EE
_02225028:
	movs r1, #8
	add r0, sp, #0x10
	strb r1, [r0, #0xc]
	ldr r0, _02225290 @ =0x0224E3F0
	add r1, sp, #0x1c
	bl ov13_02224A30
	add r0, sp, #0x1c
	movs r2, #2
	str r0, [sp]
	ldr r1, _02225294 @ =0x0224EC64
	adds r0, r4, #0
	lsls r2, r2, #0xa
	movs r3, #4
	blx FUN_020A2F84
	cmp r0, #0
	ble _02225126
	ldr r0, _02225294 @ =0x0224EC64
	ldr r1, _02225298 @ =0x0224DF80
	bl ov13_02224864
	cmp r0, #0
	beq _02225126
	bl ov13_02226CBC
	ldr r1, _0222529C @ =0x00007530
	adds r1, r0, r1
	ldr r0, _0222528C @ =0x02245A58
	str r1, [r0, #0xc]
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #5
	str r1, [r0, #0x1c]
	movs r1, #4
	str r1, [r0, #0x38]
	bl ov13_02226F3C
	b _022252EE
_02225074:
	ldr r0, _02225294 @ =0x0224EC64
	bl ov13_02224988
	adds r3, r0, #0
	ldr r0, _02225284 @ =0x0224DF30
	ldr r2, _02225294 @ =0x0224EC64
	str r3, [r0, #0x14]
	adds r0, r4, #0
	add r1, sp, #0x1c
	bl ov13_02224618
	bl ov13_02226CBC
	str r0, [sp, #0xc]
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #6
	str r1, [r0, #0x1c]
	b _022252EE
_02225098:
	bl ov13_02226CBC
	ldr r1, _0222528C @ =0x02245A58
	ldr r1, [r1, #0xc]
	cmp r0, r1
	blo _022250B4
	adds r0, r4, #0
	blx FUN_020A30C8
	movs r0, #3
	mvns r0, r0
	str r0, [sp, #8]
	movs r6, #1
	b _022252EE
_022250B4:
	add r0, sp, #0x1c
	movs r2, #2
	str r0, [sp]
	ldr r1, _02225294 @ =0x0224EC64
	adds r0, r4, #0
	lsls r2, r2, #0xa
	movs r3, #4
	blx FUN_020A2F84
	cmp r0, #0
	ble _02225128
	ldr r0, _02225294 @ =0x0224EC64
	ldr r2, _022252A0 @ =0x0224E464
	ldr r3, _02225290 @ =0x0224E3F0
	movs r1, #3
	bl ov13_02224938
	cmp r0, #0
	beq _02225128
	ldr r0, _022252A0 @ =0x0224E464
	add r1, sp, #0x18
	add r2, sp, #0x14
	bl ov13_022246E4
	adds r5, r0, #0
	ldr r1, [sp, #0x18]
	ldr r0, _022252A4 @ =0x00000101
	cmp r1, r0
	bne _02225126
	bl ov13_02226CBC
	ldr r2, _022252A8 @ =0x0224E400
	str r0, [sp, #0x10]
	movs r1, #8
_022250F8:
	ldrb r0, [r5]
	adds r5, r5, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _022250F8
	ldr r0, _022252AC @ =0x0224E408
	add r1, sp, #0x10
	movs r2, #4
	bl ov13_02226C94
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #7
	str r1, [r0, #0x1c]
	movs r1, #5
	str r1, [r0, #0x38]
	ldr r0, _0222528C @ =0x02245A58
	subs r1, r1, #6
	str r1, [r0, #0xc]
	bl ov13_02226F3C
_02225126:
	b _022252EE
_02225128:
	bl ov13_02226CBC
	movs r2, #0xfa
	ldr r1, [sp, #0xc]
	lsls r2, r2, #2
	adds r1, r1, r2
	cmp r0, r1
	bhs _0222513A
	b _022252EE
_0222513A:
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #5
	str r1, [r0, #0x1c]
	b _022252EE
_02225142:
	ldr r0, _022252A0 @ =0x0224E464
	ldr r1, _022252B0 @ =0x00000102
	ldr r2, _022252AC @ =0x0224E408
	movs r3, #8
	bl ov13_0222483C
	ldr r3, _02225284 @ =0x0224DF30
	ldr r2, _022252A0 @ =0x0224E464
	str r0, [r3, #0x34]
	ldr r0, _02225290 @ =0x0224E3F0
	movs r1, #4
	str r0, [sp]
	ldr r0, _02225294 @ =0x0224EC64
	ldr r3, [r3, #0x34]
	bl ov13_02224718
	adds r3, r0, #0
	ldr r0, _02225284 @ =0x0224DF30
	ldr r2, _02225294 @ =0x0224EC64
	str r3, [r0, #0x14]
	adds r0, r4, #0
	add r1, sp, #0x1c
	bl ov13_02224618
	bl ov13_02226CBC
	str r0, [sp, #0xc]
	movs r0, #0
	movs r5, #0x12
	ldr r7, _022252B4 @ =0x0224E184
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	mov ip, r5
_02225186:
	stm r7!, {r0, r1, r2, r3}
	mov r5, ip
	subs r5, r5, #1
	stm r7!, {r0, r1, r2, r3}
	mov ip, r5
	bne _02225186
	stm r7!, {r0, r1, r2, r3}
	str r0, [r7]
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #8
	str r1, [r0, #0x1c]
	b _022252EE
_0222519E:
	add r0, sp, #0x1c
	movs r2, #2
	str r0, [sp]
	ldr r1, _02225294 @ =0x0224EC64
	adds r0, r4, #0
	lsls r2, r2, #0xa
	movs r3, #4
	blx FUN_020A2F84
	cmp r0, #0
	ble _022251F4
	ldr r0, _02225294 @ =0x0224EC64
	ldr r2, _022252A0 @ =0x0224E464
	ldr r3, _022252A8 @ =0x0224E400
	movs r1, #5
	bl ov13_02224938
	ldr r1, _02225284 @ =0x0224DF30
	cmp r0, #0
	str r0, [r1, #0x34]
	beq _022251F4
	ldr r0, _022252A0 @ =0x0224E464
	bl ov13_02224B2C
	cmp r0, #0
	beq _022251F4
	ldr r1, _022252B8 @ =0x0224E270
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _022251E2
	movs r1, #1
	ldr r0, _02225284 @ =0x0224DF30
	b _022251E6
_022251E2:
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #0
_022251E6:
	strb r1, [r0]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #9
	str r1, [r0, #0x1c]
	b _022252EE
_022251F4:
	bl ov13_02226CBC
	movs r2, #0xfa
	ldr r1, [sp, #0xc]
	lsls r2, r2, #2
	adds r1, r1, r2
	cmp r0, r1
	blo _022252EE
	ldr r0, [sp, #4]
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #0xa
	blt _0222521E
	adds r0, r4, #0
	blx FUN_020A30C8
	movs r0, #1
	mvns r0, r0
	str r0, [sp, #8]
	movs r6, #1
	b _022252EE
_0222521E:
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #7
	str r1, [r0, #0x1c]
	b _022252EE
_02225226:
	ldr r0, _022252A0 @ =0x0224E464
	ldr r1, _022252BC @ =0x00000301
	ldr r2, _022252C0 @ =0x0224DF30
	movs r3, #1
	bl ov13_0222483C
	ldr r3, _02225284 @ =0x0224DF30
	ldr r2, _022252A0 @ =0x0224E464
	str r0, [r3, #0x34]
	ldr r0, _022252A8 @ =0x0224E400
	movs r1, #6
	str r0, [sp]
	ldr r0, _02225294 @ =0x0224EC64
	ldr r3, [r3, #0x34]
	bl ov13_02224718
	ldr r1, _02225284 @ =0x0224DF30
	str r0, [r1, #0x14]
	bl ov13_02223DE0
	cmp r0, #7
	beq _02225268
	bl ov13_02226CBC
	movs r1, #0xfa
	lsls r1, r1, #2
	adds r0, r0, r1
	str r0, [sp, #0xc]
	movs r0, #0xa
	ldr r1, _02225284 @ =0x0224DF30
	str r0, [sp, #4]
	str r0, [r1, #0x1c]
	b _022252EE
_02225268:
	ldr r3, _02225284 @ =0x0224DF30
	ldr r2, _02225294 @ =0x0224EC64
	ldr r3, [r3, #0x14]
	adds r0, r4, #0
	add r1, sp, #0x1c
	bl ov13_02224618
	bl ov13_02226CBC
	str r0, [sp, #0xc]
	ldr r0, _02225284 @ =0x0224DF30
	movs r1, #0xa
	str r1, [r0, #0x1c]
	b _022252EE
	.align 2, 0
_02225284: .4byte 0x0224DF30
_02225288: .4byte 0x000001E6
_0222528C: .4byte 0x02245A58
_02225290: .4byte 0x0224E3F0
_02225294: .4byte 0x0224EC64
_02225298: .4byte 0x0224DF80
_0222529C: .4byte 0x00007530
_022252A0: .4byte 0x0224E464
_022252A4: .4byte 0x00000101
_022252A8: .4byte 0x0224E400
_022252AC: .4byte 0x0224E408
_022252B0: .4byte 0x00000102
_022252B4: .4byte 0x0224E184
_022252B8: .4byte 0x0224E270
_022252BC: .4byte 0x00000301
_022252C0: .4byte 0x0224DF30
_022252C4:
	bl ov13_02226CBC
	movs r2, #0xfa
	ldr r1, [sp, #0xc]
	lsls r2, r2, #2
	adds r1, r1, r2
	cmp r0, r1
	blo _022252EE
	ldr r0, [sp, #4]
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #0xa
	blt _022252E8
	movs r6, #1
	bl ov13_02224DB4
	str r0, [sp, #8]
	b _022252EE
_022252E8:
	ldr r0, _0222531C @ =0x0224DF30
	movs r1, #9
	str r1, [r0, #0x1c]
_022252EE:
	cmp r6, #0
	bne _022252FC
	ldr r0, _0222531C @ =0x0224DF30
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _022252FC
	b _02224F54
_022252FC:
	cmp r4, #0
	beq _02225306
	adds r0, r4, #0
	blx FUN_020A30C8
_02225306:
	ldr r0, _0222531C @ =0x0224DF30
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02225314
	movs r0, #7
	mvns r0, r0
	str r0, [sp, #8]
_02225314:
	ldr r0, [sp, #8]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_0222531C: .4byte 0x0224DF30
	thumb_func_end ov13_02224F3C

	thumb_func_start ov13_02225320
ov13_02225320: @ 0x02225320
	push {r4, lr}
	bl ov13_02224F3C
	adds r4, r0, #0
	ldr r0, _02225350 @ =0x0224DF30
	str r4, [r0, #0x78]
	bl ov13_02224100
	cmp r4, #1
	bne _0222533A
	movs r1, #6
	ldr r0, _02225350 @ =0x0224DF30
	b _0222533E
_0222533A:
	ldr r0, _02225350 @ =0x0224DF30
	movs r1, #7
_0222533E:
	str r1, [r0, #0x38]
	movs r1, #0
	ldr r0, _02225354 @ =0x02245A58
	mvns r1, r1
	str r1, [r0, #0xc]
	bl ov13_02226F3C
	pop {r4, pc}
	nop
_02225350: .4byte 0x0224DF30
_02225354: .4byte 0x02245A58
	thumb_func_end ov13_02225320

	thumb_func_start ov13_02225358
ov13_02225358: @ 0x02225358
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1a8
	str r0, [sp]
	ldr r0, _0222550C @ =0xA6A6A6A6
	adds r4, r2, #0
	adds r5, r1, #0
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	movs r0, #7
	adds r1, r4, #0
	tst r1, r0
	bne _02225376
	ldr r2, [sp, #0x1c0]
	tst r0, r2
	beq _0222537C
_02225376:
	add sp, #0x1a8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222537C:
	lsrs r0, r4, #3
	str r0, [sp, #0x14]
	cmp r0, #2
	bge _0222538A
	add sp, #0x1a8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222538A:
	add r0, sp, #0x68
	adds r1, r3, #0
	lsls r2, r2, #3
	bl ov13_02225710
	str r0, [sp, #0x1c]
	ldr r0, [sp]
	adds r1, r5, #0
	adds r0, #8
	adds r2, r4, #0
	blx FUN_020E5AD8
	add r3, sp, #0x58
	add r2, sp, #0x48
	movs r1, #8
_022253A8:
	ldrb r0, [r2]
	adds r2, r2, #1
	strb r0, [r3]
	adds r3, r3, #1
	subs r1, r1, #1
	bne _022253A8
	movs r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x18]
_022253BE:
	ldr r0, [sp, #0x14]
	movs r4, #1
	cmp r0, #1
	bge _022253C8
	b _022254E4
_022253C8:
	ldr r2, [sp, #0x20]
	ldr r1, [sp, #0x18]
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	str r0, [sp, #0xc]
	movs r0, #0
	str r1, [sp, #8]
	str r0, [sp, #0x28]
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0x30]
	adds r0, r1, #0
	orrs r0, r1
	str r0, [sp, #0x40]
_022253E6:
	ldr r0, [sp]
	lsls r1, r4, #3
	adds r5, r0, r1
	adds r3, r5, #0
	add r2, sp, #0x60
	movs r1, #8
_022253F2:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _022253F2
	add r2, sp, #0x58
	ldr r1, [sp, #0x1c]
	add r0, sp, #0x68
	adds r3, r2, #0
	bl ov13_02225B58
	ldr r0, [sp, #0xc]
	asrs r1, r4, #0x1f
	adds r3, r4, r0
	ldr r0, [sp, #8]
	adcs r1, r0
	movs r0, #0xff
	lsls r0, r0, #0x18
	ands r0, r1
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r0, r0, #8
	str r0, [sp, #0x2c]
	movs r0, #0xff
	lsls r0, r0, #8
	movs r2, #0
	ands r0, r1
	ands r2, r3
	lsls r6, r0, #8
	lsrs r2, r2, #0x18
	str r2, [sp, #0x34]
	orrs r2, r6
	lsrs r0, r0, #0x18
	str r2, [sp, #0x34]
	str r0, [sp, #0x38]
	movs r0, #0xff
	movs r2, #0
	ands r0, r1
	ands r2, r3
	lsls r6, r0, #0x18
	lsrs r2, r2, #8
	str r2, [sp, #0x44]
	orrs r2, r6
	lsrs r0, r0, #8
	str r2, [sp, #0x44]
	str r0, [sp, #0x3c]
	movs r0, #0
	adds r2, r1, #0
	ands r2, r0
	movs r0, #0xff
	lsls r0, r0, #0x18
	ands r0, r3
	lsrs r6, r0, #0x18
	lsls r0, r0, #8
	mov ip, r0
	movs r0, #0
	ands r1, r0
	movs r0, #0xff
	lsls r0, r0, #0x10
	lsls r2, r2, #8
	ands r0, r3
	orrs r2, r6
	lsrs r6, r0, #8
	lsls r7, r0, #0x18
	movs r0, #0xff
	lsls r1, r1, #0x18
	ands r0, r3
	orrs r1, r6
	lsls r6, r0, #0x18
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r3
	lsls r0, r0, #8
	orrs r0, r6
	orrs r1, r0
	ldr r0, [sp, #0x40]
	adds r3, r7, #0
	orrs r3, r0
	mov r0, ip
	orrs r1, r2
	adds r2, r0, #0
	ldr r0, [sp, #0x3c]
	orrs r2, r3
	orrs r1, r0
	ldr r0, [sp, #0x44]
	orrs r2, r0
	ldr r0, [sp, #0x38]
	orrs r1, r0
	ldr r0, [sp, #0x34]
	orrs r2, r0
	ldr r0, [sp, #0x30]
	orrs r1, r0
	ldr r0, [sp, #0x2c]
	orrs r2, r0
	ldr r0, [sp, #0x28]
	orrs r1, r0
	ldr r0, [sp, #0x24]
	str r1, [sp, #0x54]
	orrs r0, r2
	str r0, [sp, #0x50]
	add r0, sp, #0x58
	add r1, sp, #0x50
	adds r2, r0, #0
	bl ov13_022256C8
	add r2, sp, #0x60
	movs r1, #8
_022254D0:
	ldrb r0, [r2]
	adds r2, r2, #1
	strb r0, [r5]
	adds r5, r5, #1
	subs r1, r1, #1
	bne _022254D0
	ldr r0, [sp, #0x14]
	adds r4, r4, #1
	cmp r4, r0
	ble _022253E6
_022254E4:
	ldr r0, [sp, #0x20]
	adds r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #6
	bge _022254F0
	b _022253BE
_022254F0:
	add r3, sp, #0x58
	movs r2, #8
_022254F4:
	ldrb r1, [r3]
	ldr r0, [sp]
	adds r3, r3, #1
	strb r1, [r0]
	adds r0, r0, #1
	str r0, [sp]
	subs r2, r2, #1
	bne _022254F4
	movs r0, #1
	add sp, #0x1a8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222550C: .4byte 0xA6A6A6A6
	thumb_func_end ov13_02225358

	thumb_func_start ov13_02225510
ov13_02225510: @ 0x02225510
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1a8
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #0x1c]
	ldr r0, _022256C4 @ =0xA6A6A6A6
	adds r4, r2, #0
	adds r5, r1, #0
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	movs r0, #7
	adds r1, r4, #0
	tst r1, r0
	bne _02225532
	ldr r2, [sp, #0x1c0]
	tst r0, r2
	beq _02225538
_02225532:
	add sp, #0x1a8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02225538:
	subs r0, r4, #1
	lsrs r0, r0, #3
	str r0, [sp, #0x14]
	cmp r0, #2
	bge _02225548
	add sp, #0x1a8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02225548:
	add r0, sp, #0x68
	adds r1, r3, #0
	lsls r2, r2, #3
	bl ov13_022259C8
	str r0, [sp, #0x20]
	add r3, sp, #0x58
	adds r2, r5, #0
	movs r1, #8
_0222555A:
	ldrb r0, [r2]
	adds r2, r2, #1
	strb r0, [r3]
	adds r3, r3, #1
	subs r1, r1, #1
	bne _0222555A
	adds r5, #8
	ldr r0, [sp]
	adds r1, r5, #0
	subs r2, r4, #1
	blx FUN_020E5AD8
	movs r0, #5
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x14]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x18]
_0222557C:
	ldr r4, [sp, #0x14]
	adds r0, r4, #0
	cmp r0, #0
	bgt _02225586
	b _022256A0
_02225586:
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x18]
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	str r0, [sp, #0xc]
	movs r0, #0
	str r1, [sp, #8]
	str r0, [sp, #0x2c]
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0x34]
	adds r0, r1, #0
	orrs r0, r1
	str r0, [sp, #0x40]
_022255A4:
	ldr r0, [sp, #0xc]
	asrs r1, r4, #0x1f
	adds r5, r4, r0
	ldr r0, [sp, #8]
	adcs r1, r0
	movs r0, #0xff
	lsls r0, r0, #0x18
	ands r0, r1
	lsrs r0, r0, #0x18
	str r0, [sp, #0x28]
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r0, r0, #8
	str r0, [sp, #0x30]
	movs r0, #0xff
	lsls r0, r0, #8
	adds r2, r1, #0
	ands r2, r0
	movs r0, #0
	adds r3, r5, #0
	ands r3, r0
	lsls r0, r2, #8
	lsrs r3, r3, #0x18
	orrs r3, r0
	lsrs r0, r2, #0x18
	str r0, [sp, #0x38]
	movs r0, #0xff
	movs r2, #0
	ands r0, r1
	ands r2, r5
	lsls r6, r0, #0x18
	lsrs r2, r2, #8
	str r2, [sp, #0x44]
	orrs r2, r6
	lsrs r0, r0, #8
	str r2, [sp, #0x44]
	str r0, [sp, #0x3c]
	movs r0, #0
	adds r2, r1, #0
	ands r2, r0
	movs r0, #0xff
	lsls r0, r0, #0x18
	ands r0, r5
	lsrs r6, r0, #0x18
	lsls r0, r0, #8
	mov ip, r0
	movs r0, #0
	ands r1, r0
	movs r0, #0xff
	lsls r0, r0, #0x10
	lsls r2, r2, #8
	ands r0, r5
	orrs r2, r6
	lsrs r6, r0, #8
	lsls r7, r0, #0x18
	movs r0, #0xff
	lsls r1, r1, #0x18
	ands r0, r5
	orrs r1, r6
	lsls r6, r0, #0x18
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r5
	lsls r0, r0, #8
	orrs r0, r6
	orrs r1, r0
	ldr r0, [sp, #0x40]
	adds r5, r7, #0
	orrs r5, r0
	mov r0, ip
	orrs r1, r2
	adds r2, r0, #0
	ldr r0, [sp, #0x3c]
	orrs r2, r5
	orrs r1, r0
	ldr r0, [sp, #0x44]
	orrs r2, r0
	ldr r0, [sp, #0x38]
	orrs r2, r3
	orrs r1, r0
	ldr r0, [sp, #0x34]
	orrs r1, r0
	ldr r0, [sp, #0x30]
	orrs r2, r0
	ldr r0, [sp, #0x2c]
	orrs r1, r0
	ldr r0, [sp, #0x28]
	str r1, [sp, #0x54]
	orrs r0, r2
	str r0, [sp, #0x50]
	add r0, sp, #0x58
	add r1, sp, #0x50
	adds r2, r0, #0
	bl ov13_022256C8
	subs r0, r4, #1
	lsls r1, r0, #3
	ldr r0, [sp]
	add r2, sp, #0x60
	adds r5, r0, r1
	adds r3, r5, #0
	movs r1, #8
_02225672:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _02225672
	add r2, sp, #0x58
	ldr r1, [sp, #0x20]
	add r0, sp, #0x68
	adds r3, r2, #0
	bl ov13_02225F14
	add r2, sp, #0x60
	movs r1, #8
_0222568E:
	ldrb r0, [r2]
	adds r2, r2, #1
	strb r0, [r5]
	adds r5, r5, #1
	subs r1, r1, #1
	bne _0222568E
	subs r4, r4, #1
	cmp r4, #0
	bgt _022255A4
_022256A0:
	ldr r0, [sp, #0x24]
	subs r0, r0, #1
	str r0, [sp, #0x24]
	bmi _022256AA
	b _0222557C
_022256AA:
	add r0, sp, #0x48
	add r1, sp, #0x58
	movs r2, #8
	blx FUN_020E5BB0
	cmp r0, #0
	beq _022256BC
	movs r0, #0
	str r0, [sp, #0x1c]
_022256BC:
	ldr r0, [sp, #0x1c]
	add sp, #0x1a8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022256C4: .4byte 0xA6A6A6A6
	thumb_func_end ov13_02225510

	thumb_func_start ov13_022256C8
ov13_022256C8: @ 0x022256C8
	push {r3, r4}
	ldrb r4, [r0]
	ldrb r3, [r1]
	eors r3, r4
	strb r3, [r2]
	ldrb r4, [r0, #1]
	ldrb r3, [r1, #1]
	eors r3, r4
	strb r3, [r2, #1]
	ldrb r4, [r0, #2]
	ldrb r3, [r1, #2]
	eors r3, r4
	strb r3, [r2, #2]
	ldrb r4, [r0, #3]
	ldrb r3, [r1, #3]
	eors r3, r4
	strb r3, [r2, #3]
	ldrb r4, [r0, #4]
	ldrb r3, [r1, #4]
	eors r3, r4
	strb r3, [r2, #4]
	ldrb r4, [r0, #5]
	ldrb r3, [r1, #5]
	eors r3, r4
	strb r3, [r2, #5]
	ldrb r4, [r0, #6]
	ldrb r3, [r1, #6]
	eors r3, r4
	strb r3, [r2, #6]
	ldrb r3, [r0, #7]
	ldrb r0, [r1, #7]
	eors r0, r3
	strb r0, [r2, #7]
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov13_022256C8

	thumb_func_start ov13_02225710
ov13_02225710: @ 0x02225710
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r3, r1, #0
	adds r1, r2, #0
	movs r2, #0
	str r2, [sp]
	ldrb r2, [r3, #2]
	ldrb r6, [r3, #1]
	ldrb r5, [r3, #3]
	lsls r4, r2, #8
	ldrb r2, [r3]
	lsls r6, r6, #0x10
	lsls r2, r2, #0x18
	eors r2, r6
	eors r2, r4
	eors r2, r5
	str r2, [r0]
	ldrb r2, [r3, #6]
	ldrb r6, [r3, #5]
	ldrb r5, [r3, #7]
	lsls r4, r2, #8
	ldrb r2, [r3, #4]
	lsls r6, r6, #0x10
	lsls r2, r2, #0x18
	eors r2, r6
	eors r2, r4
	eors r2, r5
	str r2, [r0, #4]
	ldrb r2, [r3, #0xa]
	ldrb r6, [r3, #9]
	ldrb r5, [r3, #0xb]
	lsls r4, r2, #8
	ldrb r2, [r3, #8]
	lsls r6, r6, #0x10
	lsls r2, r2, #0x18
	eors r2, r6
	eors r2, r4
	eors r2, r5
	str r2, [r0, #8]
	ldrb r2, [r3, #0xe]
	ldrb r6, [r3, #0xd]
	ldrb r5, [r3, #0xf]
	lsls r4, r2, #8
	ldrb r2, [r3, #0xc]
	lsls r6, r6, #0x10
	lsls r2, r2, #0x18
	eors r2, r6
	eors r2, r4
	eors r2, r5
	str r2, [r0, #0xc]
	cmp r1, #0x80
	bne _022257F4
	ldr r5, _022259C0 @ =0x02242688
	ldr r2, _022259C4 @ =0x022442B0
_0222577C:
	ldr r4, [r0, #0xc]
	ldr r3, [r5]
	lsrs r1, r4, #0x18
	lsls r1, r1, #2
	ldr r1, [r2, r1]
	adds r5, r5, #4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x16
	ldr r6, [r2, r1]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r7, r6, #0
	ands r7, r1
	ldr r1, [r0]
	str r1, [sp, #4]
	lsrs r1, r4, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x16
	ldr r6, [r2, r1]
	movs r1, #0xff
	lsls r1, r1, #0x18
	lsrs r4, r4, #8
	ands r6, r1
	ldr r1, [sp, #4]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	eors r1, r6
	ldr r6, [r2, r4]
	movs r4, #0xff
	lsls r4, r4, #0x10
	ands r4, r6
	eors r1, r4
	adds r4, r7, #0
	eors r4, r1
	ldr r1, [sp, #8]
	eors r1, r4
	eors r3, r1
	str r3, [r0, #0x10]
	ldr r1, [r0, #4]
	eors r3, r1
	str r3, [r0, #0x14]
	ldr r1, [r0, #8]
	eors r3, r1
	str r3, [r0, #0x18]
	ldr r1, [r0, #0xc]
	eors r1, r3
	str r1, [r0, #0x1c]
	ldr r1, [sp]
	adds r1, r1, #1
	str r1, [sp]
	cmp r1, #0xa
	blt _022257F0
	add sp, #0x18
	movs r0, #0xa
	pop {r3, r4, r5, r6, r7, pc}
_022257F0:
	adds r0, #0x10
	b _0222577C
_022257F4:
	ldrb r2, [r3, #0x12]
	ldrb r6, [r3, #0x11]
	ldrb r5, [r3, #0x13]
	lsls r4, r2, #8
	ldrb r2, [r3, #0x10]
	lsls r6, r6, #0x10
	lsls r2, r2, #0x18
	eors r2, r6
	eors r2, r4
	eors r2, r5
	str r2, [r0, #0x10]
	ldrb r2, [r3, #0x16]
	ldrb r6, [r3, #0x15]
	ldrb r5, [r3, #0x17]
	lsls r4, r2, #8
	ldrb r2, [r3, #0x14]
	lsls r6, r6, #0x10
	lsls r2, r2, #0x18
	eors r2, r6
	eors r2, r4
	eors r2, r5
	str r2, [r0, #0x14]
	cmp r1, #0xc0
	bne _022258B0
	ldr r5, _022259C0 @ =0x02242688
	ldr r3, _022259C4 @ =0x022442B0
_02225828:
	ldr r4, [r0, #0x14]
	ldr r6, [r5]
	lsrs r1, r4, #0x18
	lsls r1, r1, #2
	ldr r1, [r3, r1]
	adds r5, r5, #4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x16
	ldr r2, [r3, r1]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r7, r2, #0
	ands r7, r1
	ldr r1, [r0]
	mov lr, r1
	lsrs r1, r4, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x16
	ldr r2, [r3, r1]
	movs r1, #0xff
	lsls r1, r1, #0x18
	ands r1, r2
	mov r2, lr
	eors r1, r2
	lsrs r2, r4, #8
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x16
	ldr r4, [r3, r2]
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r4
	eors r1, r2
	adds r2, r7, #0
	eors r2, r1
	ldr r1, [sp, #0xc]
	eors r1, r2
	adds r2, r6, #0
	eors r2, r1
	str r2, [r0, #0x18]
	ldr r1, [r0, #4]
	eors r2, r1
	str r2, [r0, #0x1c]
	ldr r1, [r0, #8]
	eors r2, r1
	str r2, [r0, #0x20]
	ldr r1, [r0, #0xc]
	eors r1, r2
	str r1, [r0, #0x24]
	ldr r1, [sp]
	adds r1, r1, #1
	str r1, [sp]
	cmp r1, #8
	blt _0222589E
	add sp, #0x18
	movs r0, #0xc
	pop {r3, r4, r5, r6, r7, pc}
_0222589E:
	ldr r2, [r0, #0x10]
	ldr r1, [r0, #0x24]
	eors r2, r1
	str r2, [r0, #0x28]
	ldr r1, [r0, #0x14]
	eors r1, r2
	str r1, [r0, #0x2c]
	adds r0, #0x18
	b _02225828
_022258B0:
	ldrb r2, [r3, #0x1a]
	ldrb r6, [r3, #0x19]
	ldrb r5, [r3, #0x1b]
	lsls r4, r2, #8
	ldrb r2, [r3, #0x18]
	lsls r6, r6, #0x10
	lsls r2, r2, #0x18
	eors r2, r6
	eors r2, r4
	eors r2, r5
	str r2, [r0, #0x18]
	ldrb r2, [r3, #0x1e]
	ldrb r5, [r3, #0x1f]
	lsls r4, r2, #8
	ldrb r2, [r3, #0x1c]
	ldrb r3, [r3, #0x1d]
	lsls r2, r2, #0x18
	lsls r3, r3, #0x10
	eors r2, r3
	eors r2, r4
	eors r2, r5
	str r2, [r0, #0x1c]
	movs r2, #1
	lsls r2, r2, #8
	cmp r1, r2
	bne _022259BA
	ldr r5, _022259C0 @ =0x02242688
	ldr r3, _022259C4 @ =0x022442B0
_022258E8:
	ldr r4, [r0, #0x1c]
	ldr r6, [r5]
	lsrs r1, r4, #0x18
	lsls r1, r1, #2
	ldr r1, [r3, r1]
	adds r5, r5, #4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x10]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x16
	ldr r2, [r3, r1]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r7, r2, #0
	ands r7, r1
	ldr r1, [r0]
	mov ip, r1
	lsrs r1, r4, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x16
	ldr r2, [r3, r1]
	movs r1, #0xff
	lsls r1, r1, #0x18
	ands r1, r2
	mov r2, ip
	eors r1, r2
	lsrs r2, r4, #8
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x16
	ldr r4, [r3, r2]
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r4
	eors r1, r2
	adds r2, r7, #0
	eors r2, r1
	ldr r1, [sp, #0x10]
	eors r1, r2
	adds r2, r6, #0
	eors r2, r1
	str r2, [r0, #0x20]
	ldr r1, [r0, #4]
	eors r2, r1
	str r2, [r0, #0x24]
	ldr r1, [r0, #8]
	eors r2, r1
	str r2, [r0, #0x28]
	ldr r1, [r0, #0xc]
	eors r1, r2
	str r1, [r0, #0x2c]
	ldr r1, [sp]
	adds r1, r1, #1
	str r1, [sp]
	cmp r1, #7
	blt _0222595E
	add sp, #0x18
	movs r0, #0xe
	pop {r3, r4, r5, r6, r7, pc}
_0222595E:
	ldr r6, [r0, #0x2c]
	ldr r7, [r0, #0x10]
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x16
	ldr r1, [r3, r1]
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsrs r1, r6, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x16
	ldr r2, [r3, r1]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r2
	str r1, [sp, #0x14]
	lsrs r1, r6, #0x18
	lsls r1, r1, #2
	ldr r2, [r3, r1]
	movs r1, #0xff
	lsls r1, r1, #0x18
	ands r1, r2
	lsrs r2, r6, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x16
	ldr r6, [r3, r2]
	movs r2, #0xff
	lsls r2, r2, #0x10
	eors r1, r7
	ands r2, r6
	eors r2, r1
	ldr r1, [sp, #0x14]
	eors r1, r2
	adds r2, r4, #0
	eors r2, r1
	str r2, [r0, #0x30]
	ldr r1, [r0, #0x14]
	eors r2, r1
	str r2, [r0, #0x34]
	ldr r1, [r0, #0x18]
	eors r2, r1
	str r2, [r0, #0x38]
	ldr r1, [r0, #0x1c]
	eors r1, r2
	str r1, [r0, #0x3c]
	adds r0, #0x20
	b _022258E8
_022259BA:
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022259C0: .4byte 0x02242688
_022259C4: .4byte 0x022442B0
	thumb_func_end ov13_02225710

	thumb_func_start ov13_022259C8
ov13_022259C8: @ 0x022259C8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl ov13_02225710
	mov ip, r0
	mov r1, ip
	lsls r6, r1, #2
	movs r0, #0
	cmp r6, #0
	ble _02225A0E
	lsls r2, r6, #2
	adds r1, r4, #0
	adds r2, r4, r2
_022259E2:
	ldr r5, [r1]
	ldr r3, [r2]
	adds r0, r0, #4
	str r3, [r1]
	str r5, [r2]
	ldr r5, [r1, #4]
	ldr r3, [r2, #4]
	subs r6, r6, #4
	str r3, [r1, #4]
	str r5, [r2, #4]
	ldr r5, [r1, #8]
	ldr r3, [r2, #8]
	str r3, [r1, #8]
	str r5, [r2, #8]
	ldr r5, [r1, #0xc]
	ldr r3, [r2, #0xc]
	str r3, [r1, #0xc]
	str r5, [r2, #0xc]
	adds r1, #0x10
	subs r2, #0x10
	cmp r0, r6
	blt _022259E2
_02225A0E:
	movs r0, #1
	str r0, [sp]
	mov r0, ip
	cmp r0, #1
	bgt _02225A1A
	b _02225B3E
_02225A1A:
	ldr r2, _02225B44 @ =0x022442B0
	ldr r7, _02225B48 @ =0x02242AB0
_02225A1E:
	adds r4, #0x10
	ldr r3, [r4]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x16
	ldr r0, [r2, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r7, r0]
	lsrs r0, r3, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r0, [r2, r0]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x16
	ldr r0, _02225B4C @ =0x022426B0
	ldr r6, [r0, r5]
	lsrs r0, r3, #0x18
	lsls r0, r0, #2
	lsrs r3, r3, #0x10
	ldr r0, [r2, r0]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x16
	lsls r0, r0, #0x18
	ldr r3, [r2, r3]
	lsrs r5, r0, #0x16
	ldr r0, _02225B50 @ =0x022446B0
	lsls r3, r3, #0x18
	ldr r0, [r0, r5]
	lsrs r5, r3, #0x16
	ldr r3, _02225B54 @ =0x02244AB0
	ldr r3, [r3, r5]
	eors r0, r3
	eors r0, r6
	eors r0, r1
	str r0, [r4]
	ldr r3, [r4, #4]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x16
	ldr r0, [r2, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r7, r0]
	lsrs r0, r3, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r0, [r2, r0]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x16
	ldr r0, _02225B4C @ =0x022426B0
	ldr r6, [r0, r5]
	lsrs r0, r3, #0x18
	lsls r0, r0, #2
	lsrs r3, r3, #0x10
	ldr r0, [r2, r0]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x16
	lsls r0, r0, #0x18
	ldr r3, [r2, r3]
	lsrs r5, r0, #0x16
	ldr r0, _02225B50 @ =0x022446B0
	lsls r3, r3, #0x18
	ldr r0, [r0, r5]
	lsrs r5, r3, #0x16
	ldr r3, _02225B54 @ =0x02244AB0
	ldr r3, [r3, r5]
	eors r0, r3
	eors r0, r6
	eors r0, r1
	str r0, [r4, #4]
	ldr r3, [r4, #8]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x16
	ldr r0, [r2, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r7, r0]
	lsrs r0, r3, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r0, [r2, r0]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x16
	ldr r0, _02225B4C @ =0x022426B0
	ldr r6, [r0, r5]
	lsrs r0, r3, #0x18
	lsls r0, r0, #2
	lsrs r3, r3, #0x10
	ldr r0, [r2, r0]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x16
	lsls r0, r0, #0x18
	ldr r3, [r2, r3]
	lsrs r5, r0, #0x16
	ldr r0, _02225B50 @ =0x022446B0
	lsls r3, r3, #0x18
	ldr r0, [r0, r5]
	lsrs r5, r3, #0x16
	ldr r3, _02225B54 @ =0x02244AB0
	ldr r3, [r3, r5]
	eors r0, r3
	eors r0, r6
	eors r0, r1
	str r0, [r4, #8]
	ldr r3, [r4, #0xc]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x16
	ldr r0, [r2, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r7, r0]
	lsrs r0, r3, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r0, [r2, r0]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x16
	ldr r0, _02225B4C @ =0x022426B0
	ldr r6, [r0, r5]
	lsrs r0, r3, #0x18
	lsls r0, r0, #2
	lsrs r3, r3, #0x10
	ldr r0, [r2, r0]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x16
	lsls r0, r0, #0x18
	ldr r3, [r2, r3]
	lsrs r5, r0, #0x16
	ldr r0, _02225B50 @ =0x022446B0
	lsls r3, r3, #0x18
	ldr r0, [r0, r5]
	lsrs r5, r3, #0x16
	ldr r3, _02225B54 @ =0x02244AB0
	ldr r3, [r3, r5]
	eors r0, r3
	eors r0, r6
	eors r0, r1
	str r0, [r4, #0xc]
	ldr r0, [sp]
	adds r1, r0, #1
	mov r0, ip
	str r1, [sp]
	cmp r1, r0
	bge _02225B3E
	b _02225A1E
_02225B3E:
	mov r0, ip
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02225B44: .4byte 0x022442B0
_02225B48: .4byte 0x02242AB0
_02225B4C: .4byte 0x022426B0
_02225B50: .4byte 0x022446B0
_02225B54: .4byte 0x02244AB0
	thumb_func_end ov13_022259C8

	thumb_func_start ov13_02225B58
ov13_02225B58: @ 0x02225B58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	adds r7, r1, #0
	adds r1, r2, #0
	ldrb r2, [r1, #2]
	str r3, [sp]
	ldrb r6, [r1, #1]
	lsls r3, r2, #8
	ldrb r2, [r1]
	ldrb r4, [r1, #3]
	lsls r6, r6, #0x10
	lsls r2, r2, #0x18
	eors r2, r6
	eors r2, r3
	eors r2, r4
	ldr r5, [r0]
	ldrb r6, [r1, #5]
	eors r2, r5
	str r2, [sp, #0xc]
	ldrb r2, [r1, #6]
	ldrb r4, [r1, #7]
	lsls r6, r6, #0x10
	lsls r3, r2, #8
	ldrb r2, [r1, #4]
	ldr r5, [r0, #4]
	lsls r2, r2, #0x18
	eors r2, r6
	eors r2, r3
	eors r2, r4
	eors r2, r5
	str r2, [sp, #8]
	ldrb r2, [r1, #0xa]
	ldrb r6, [r1, #9]
	ldrb r4, [r1, #0xb]
	lsls r3, r2, #8
	ldrb r2, [r1, #8]
	lsls r6, r6, #0x10
	ldr r5, [r0, #8]
	lsls r2, r2, #0x18
	eors r2, r6
	eors r2, r3
	eors r2, r4
	eors r5, r2
	ldrb r2, [r1, #0xe]
	ldrb r4, [r1, #0xf]
	ldr r6, [r0, #0xc]
	lsls r3, r2, #8
	ldrb r2, [r1, #0xc]
	ldrb r1, [r1, #0xd]
	lsls r2, r2, #0x18
	lsls r1, r1, #0x10
	eors r1, r2
	eors r1, r3
	eors r1, r4
	eors r6, r1
	asrs r1, r7, #1
	str r1, [sp, #4]
_02225BCA:
	lsls r1, r6, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _02225F00 @ =0x02243EB0
	ldr r4, [r0, #0x10]
	ldr r3, [r1, r2]
	lsrs r1, r5, #8
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _02225F04 @ =0x02243AB0
	ldr r1, [r1, r2]
	str r1, [sp, #0x40]
	ldr r1, [sp, #0xc]
	lsrs r1, r1, #0x18
	lsls r2, r1, #2
	ldr r1, _02225F08 @ =0x022432B0
	ldr r7, [r1, r2]
	ldr r1, [sp, #8]
	lsrs r1, r1, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _02225F0C @ =0x022436B0
	ldr r1, [r1, r2]
	adds r2, r7, #0
	eors r2, r1
	ldr r1, [sp, #0x40]
	eors r1, r2
	eors r1, r3
	eors r1, r4
	str r1, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r4, [r0, #0x14]
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _02225F00 @ =0x02243EB0
	ldr r3, [r1, r2]
	lsrs r1, r6, #8
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _02225F04 @ =0x02243AB0
	ldr r1, [r1, r2]
	str r1, [sp, #0x48]
	ldr r1, [sp, #8]
	lsrs r1, r1, #0x18
	lsls r2, r1, #2
	ldr r1, _02225F08 @ =0x022432B0
	ldr r7, [r1, r2]
	lsrs r1, r5, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _02225F0C @ =0x022436B0
	ldr r1, [r1, r2]
	adds r2, r7, #0
	eors r2, r1
	ldr r1, [sp, #0x48]
	eors r1, r2
	eors r1, r3
	eors r1, r4
	str r1, [sp, #0x44]
	ldr r1, [sp, #8]
	ldr r4, [r0, #0x18]
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _02225F00 @ =0x02243EB0
	ldr r3, [r1, r2]
	ldr r1, [sp, #0xc]
	lsrs r1, r1, #8
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _02225F04 @ =0x02243AB0
	ldr r1, [r1, r2]
	str r1, [sp, #0x14]
	lsrs r1, r5, #0x18
	lsls r2, r1, #2
	ldr r1, _02225F08 @ =0x022432B0
	ldr r7, [r1, r2]
	lsrs r1, r6, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _02225F0C @ =0x022436B0
	ldr r1, [r1, r2]
	adds r2, r7, #0
	eors r2, r1
	ldr r1, [sp, #0x14]
	ldr r7, [r0, #0x1c]
	eors r1, r2
	eors r1, r3
	adds r2, r4, #0
	eors r2, r1
	lsls r1, r5, #0x18
	lsrs r3, r1, #0x16
	ldr r1, _02225F00 @ =0x02243EB0
	adds r0, #0x20
	ldr r3, [r1, r3]
	ldr r1, [sp, #8]
	lsrs r1, r1, #8
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x16
	ldr r1, _02225F04 @ =0x02243AB0
	ldr r1, [r1, r4]
	lsrs r4, r6, #0x18
	lsls r5, r4, #2
	ldr r4, _02225F08 @ =0x022432B0
	ldr r6, [r4, r5]
	ldr r4, [sp, #0xc]
	lsrs r4, r4, #0x10
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x16
	ldr r4, _02225F0C @ =0x022436B0
	ldr r4, [r4, r5]
	eors r4, r6
	eors r1, r4
	eors r1, r3
	ldr r3, [sp, #4]
	eors r1, r7
	subs r3, r3, #1
	str r3, [sp, #4]
	beq _02225D94
	lsls r3, r1, #0x18
	lsrs r5, r3, #0x16
	ldr r3, _02225F00 @ =0x02243EB0
	ldr r4, [r0]
	ldr r3, [r3, r5]
	lsrs r5, r2, #8
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x16
	ldr r5, _02225F04 @ =0x02243AB0
	ldr r7, [r5, r6]
	ldr r5, [sp, #0x10]
	lsrs r5, r5, #0x18
	lsls r6, r5, #2
	ldr r5, _02225F08 @ =0x022432B0
	ldr r5, [r5, r6]
	str r5, [sp, #0x18]
	ldr r5, [sp, #0x44]
	lsrs r5, r5, #0x10
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x16
	ldr r5, _02225F0C @ =0x022436B0
	ldr r6, [r5, r6]
	ldr r5, [sp, #0x18]
	eors r5, r6
	eors r5, r7
	eors r3, r5
	eors r3, r4
	str r3, [sp, #0xc]
	ldr r3, [sp, #0x10]
	ldr r4, [r0, #4]
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x16
	ldr r3, _02225F00 @ =0x02243EB0
	ldr r3, [r3, r5]
	lsrs r5, r1, #8
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x16
	ldr r5, _02225F04 @ =0x02243AB0
	ldr r7, [r5, r6]
	ldr r5, [sp, #0x44]
	lsrs r5, r5, #0x18
	lsls r6, r5, #2
	ldr r5, _02225F08 @ =0x022432B0
	ldr r5, [r5, r6]
	str r5, [sp, #0x1c]
	lsrs r5, r2, #0x10
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x16
	ldr r5, _02225F0C @ =0x022436B0
	ldr r6, [r5, r6]
	ldr r5, [sp, #0x1c]
	eors r5, r6
	eors r5, r7
	eors r3, r5
	eors r3, r4
	str r3, [sp, #8]
	ldr r3, [sp, #0x44]
	ldr r6, [r0, #8]
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x16
	ldr r3, _02225F00 @ =0x02243EB0
	ldr r5, [r3, r4]
	ldr r3, [sp, #0x10]
	lsrs r3, r3, #8
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x16
	ldr r3, _02225F04 @ =0x02243AB0
	ldr r3, [r3, r4]
	str r3, [sp, #0x20]
	lsrs r3, r2, #0x18
	lsls r4, r3, #2
	ldr r3, _02225F08 @ =0x022432B0
	lsls r2, r2, #0x18
	ldr r7, [r3, r4]
	lsrs r3, r1, #0x10
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x16
	ldr r3, _02225F0C @ =0x022436B0
	lsrs r1, r1, #0x18
	ldr r3, [r3, r4]
	adds r4, r7, #0
	eors r4, r3
	ldr r3, [sp, #0x20]
	ldr r7, [r0, #0xc]
	eors r3, r4
	eors r3, r5
	adds r5, r6, #0
	eors r5, r3
	lsrs r3, r2, #0x16
	ldr r2, _02225F00 @ =0x02243EB0
	ldr r3, [r2, r3]
	ldr r2, [sp, #0x44]
	lsrs r2, r2, #8
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x16
	ldr r2, _02225F04 @ =0x02243AB0
	ldr r2, [r2, r4]
	lsls r4, r1, #2
	ldr r1, _02225F08 @ =0x022432B0
	ldr r6, [r1, r4]
	ldr r1, [sp, #0x10]
	lsrs r1, r1, #0x10
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x16
	ldr r1, _02225F0C @ =0x022436B0
	ldr r1, [r1, r4]
	eors r1, r6
	eors r1, r2
	eors r1, r3
	adds r6, r7, #0
	eors r6, r1
	b _02225BCA
_02225D94:
	ldr r3, [r0]
	movs r6, #0xff
	str r3, [sp, #0x24]
	lsls r3, r1, #0x18
	lsrs r4, r3, #0x16
	ldr r3, _02225F10 @ =0x022442B0
	lsls r6, r6, #0x10
	ldr r4, [r3, r4]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x28]
	lsrs r4, r2, #8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #8
	ands r4, r5
	str r4, [sp, #0x2c]
	ldr r4, [sp, #0x10]
	lsrs r4, r4, #0x18
	lsls r4, r4, #2
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #0x18
	ands r5, r4
	ldr r4, [sp, #0x44]
	lsrs r4, r4, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r4, [r3, r4]
	ands r4, r6
	eors r5, r4
	ldr r4, [sp, #0x2c]
	eors r5, r4
	ldr r4, [sp, #0x28]
	eors r5, r4
	ldr r4, [sp, #0x24]
	eors r4, r5
	ldr r5, [sp]
	lsrs r6, r4, #0x18
	strb r6, [r5]
	lsrs r6, r4, #0x10
	strb r6, [r5, #1]
	lsrs r6, r4, #8
	strb r6, [r5, #2]
	strb r4, [r5, #3]
	ldr r4, [r0, #4]
	movs r6, #0xff
	str r4, [sp, #0x30]
	ldr r4, [sp, #0x10]
	lsls r6, r6, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r4, [r3, r4]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x34]
	lsrs r4, r1, #8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #8
	ands r4, r5
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x44]
	lsrs r4, r4, #0x18
	lsls r4, r4, #2
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #0x18
	ands r5, r4
	lsrs r4, r2, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r4, [r3, r4]
	ands r4, r6
	eors r5, r4
	ldr r4, [sp, #0x38]
	eors r5, r4
	ldr r4, [sp, #0x34]
	eors r5, r4
	ldr r4, [sp, #0x30]
	eors r4, r5
	ldr r5, [sp]
	lsrs r6, r4, #0x18
	strb r6, [r5, #4]
	lsrs r6, r4, #0x10
	strb r6, [r5, #5]
	lsrs r6, r4, #8
	strb r6, [r5, #6]
	strb r4, [r5, #7]
	ldr r4, [r0, #8]
	str r4, [sp, #0x3c]
	ldr r4, [sp, #0x44]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r4, [r3, r4]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov lr, r4
	ldr r4, [sp, #0x10]
	lsrs r4, r4, #8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #8
	ands r4, r5
	mov ip, r4
	lsrs r4, r2, #0x18
	lsls r4, r4, #2
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #0x18
	adds r6, r5, #0
	ands r6, r4
	lsrs r4, r1, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #0x10
	ands r4, r5
	eors r4, r6
	mov r5, ip
	eors r5, r4
	mov r4, lr
	eors r5, r4
	ldr r4, [sp, #0x3c]
	eors r4, r5
	ldr r5, [sp]
	lsrs r6, r4, #0x18
	strb r6, [r5, #8]
	lsrs r6, r4, #0x10
	strb r6, [r5, #9]
	lsrs r6, r4, #8
	strb r6, [r5, #0xa]
	strb r4, [r5, #0xb]
	ldr r5, [r0, #0xc]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x16
	ldr r0, [r3, r0]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp, #0x44]
	lsrs r0, r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r2, [r3, r0]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r2, r0
	lsrs r0, r1, #0x18
	lsls r0, r0, #2
	ldr r1, [r3, r0]
	movs r0, #0xff
	lsls r0, r0, #0x18
	ands r0, r1
	ldr r1, [sp, #0x10]
	lsrs r1, r1, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x16
	ldr r3, [r3, r1]
	movs r1, #0xff
	lsls r1, r1, #0x10
	ands r1, r3
	eors r0, r1
	eors r0, r2
	eors r0, r4
	eors r0, r5
	ldr r1, [sp]
	lsrs r2, r0, #0x18
	strb r2, [r1, #0xc]
	lsrs r2, r0, #0x10
	strb r2, [r1, #0xd]
	lsrs r2, r0, #8
	strb r2, [r1, #0xe]
	strb r0, [r1, #0xf]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02225F00: .4byte 0x02243EB0
_02225F04: .4byte 0x02243AB0
_02225F08: .4byte 0x022432B0
_02225F0C: .4byte 0x022436B0
_02225F10: .4byte 0x022442B0
	thumb_func_end ov13_02225B58

	thumb_func_start ov13_02225F14
ov13_02225F14: @ 0x02225F14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r7, r1, #0
	adds r1, r2, #0
	ldrb r2, [r1, #2]
	str r3, [sp]
	ldrb r6, [r1, #1]
	lsls r3, r2, #8
	ldrb r2, [r1]
	ldrb r4, [r1, #3]
	lsls r6, r6, #0x10
	lsls r2, r2, #0x18
	eors r2, r6
	eors r2, r3
	eors r2, r4
	ldr r5, [r0]
	ldrb r6, [r1, #5]
	eors r2, r5
	str r2, [sp, #0xc]
	ldrb r2, [r1, #6]
	ldrb r4, [r1, #7]
	lsls r6, r6, #0x10
	lsls r3, r2, #8
	ldrb r2, [r1, #4]
	ldr r5, [r0, #4]
	lsls r2, r2, #0x18
	eors r2, r6
	eors r2, r3
	eors r2, r4
	eors r2, r5
	str r2, [sp, #8]
	ldrb r2, [r1, #0xa]
	ldrb r6, [r1, #9]
	ldrb r4, [r1, #0xb]
	lsls r3, r2, #8
	ldrb r2, [r1, #8]
	lsls r6, r6, #0x10
	ldr r5, [r0, #8]
	lsls r2, r2, #0x18
	eors r2, r6
	eors r2, r3
	eors r2, r4
	eors r2, r5
	str r2, [sp, #0x40]
	ldrb r2, [r1, #0xe]
	ldr r5, [r0, #0xc]
	ldrb r4, [r1, #0xf]
	lsls r3, r2, #8
	ldrb r2, [r1, #0xc]
	ldrb r1, [r1, #0xd]
	adds r6, r5, #0
	lsls r2, r2, #0x18
	lsls r1, r1, #0x10
	eors r1, r2
	eors r1, r3
	eors r1, r4
	eors r6, r1
	asrs r1, r7, #1
	str r1, [sp, #4]
_02225F8A:
	ldr r1, [sp, #8]
	ldr r5, [r0, #0x10]
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _022262BC @ =0x02242AB0
	ldr r4, [r1, r2]
	ldr r1, [sp, #0x40]
	lsrs r1, r1, #8
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _022262C0 @ =0x022426B0
	ldr r3, [r1, r2]
	ldr r1, [sp, #0xc]
	lsrs r1, r1, #0x18
	lsls r2, r1, #2
	ldr r1, _022262C4 @ =0x022446B0
	ldr r7, [r1, r2]
	lsrs r1, r6, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _022262C8 @ =0x02244AB0
	ldr r1, [r1, r2]
	eors r1, r7
	eors r1, r3
	eors r1, r4
	eors r1, r5
	str r1, [sp, #0x10]
	ldr r1, [sp, #0x40]
	ldr r5, [r0, #0x14]
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _022262BC @ =0x02242AB0
	ldr r4, [r1, r2]
	lsrs r1, r6, #8
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _022262C0 @ =0x022426B0
	ldr r3, [r1, r2]
	ldr r1, [sp, #8]
	lsrs r1, r1, #0x18
	lsls r2, r1, #2
	ldr r1, _022262C4 @ =0x022446B0
	ldr r7, [r1, r2]
	ldr r1, [sp, #0xc]
	lsrs r1, r1, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _022262C8 @ =0x02244AB0
	ldr r1, [r1, r2]
	eors r1, r7
	eors r1, r3
	eors r1, r4
	eors r1, r5
	str r1, [sp, #0x44]
	lsls r1, r6, #0x18
	lsrs r2, r1, #0x16
	ldr r1, _022262BC @ =0x02242AB0
	ldr r3, [r0, #0x18]
	ldr r2, [r1, r2]
	ldr r1, [sp, #0xc]
	lsrs r1, r1, #8
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x16
	ldr r1, _022262C0 @ =0x022426B0
	ldr r1, [r1, r4]
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x40]
	lsrs r1, r1, #0x18
	lsls r4, r1, #2
	ldr r1, _022262C4 @ =0x022446B0
	ldr r1, [r1, r4]
	ldr r4, [sp, #8]
	lsrs r4, r4, #0x10
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x16
	ldr r4, _022262C8 @ =0x02244AB0
	ldr r4, [r4, r5]
	eors r4, r1
	ldr r1, [sp, #0x14]
	eors r1, r4
	eors r1, r2
	adds r2, r3, #0
	eors r2, r1
	ldr r1, [sp, #0xc]
	ldr r3, [r0, #0x1c]
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x16
	ldr r1, _022262BC @ =0x02242AB0
	adds r0, #0x20
	ldr r1, [r1, r4]
	ldr r4, [sp, #8]
	lsrs r4, r4, #8
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x16
	ldr r4, _022262C0 @ =0x022426B0
	ldr r7, [r4, r5]
	lsrs r4, r6, #0x18
	lsls r5, r4, #2
	ldr r4, _022262C4 @ =0x022446B0
	ldr r6, [r4, r5]
	ldr r4, [sp, #0x40]
	lsrs r4, r4, #0x10
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x16
	ldr r4, _022262C8 @ =0x02244AB0
	ldr r4, [r4, r5]
	eors r4, r6
	eors r4, r7
	eors r1, r4
	eors r1, r3
	ldr r3, [sp, #4]
	subs r3, r3, #1
	str r3, [sp, #4]
	beq _0222614E
	ldr r3, [sp, #0x44]
	ldr r4, [r0]
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x16
	ldr r3, _022262BC @ =0x02242AB0
	ldr r3, [r3, r5]
	lsrs r5, r2, #8
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x16
	ldr r5, _022262C0 @ =0x022426B0
	ldr r7, [r5, r6]
	ldr r5, [sp, #0x10]
	lsrs r5, r5, #0x18
	lsls r6, r5, #2
	ldr r5, _022262C4 @ =0x022446B0
	ldr r5, [r5, r6]
	str r5, [sp, #0x18]
	lsrs r5, r1, #0x10
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x16
	ldr r5, _022262C8 @ =0x02244AB0
	ldr r6, [r5, r6]
	ldr r5, [sp, #0x18]
	eors r5, r6
	eors r5, r7
	eors r3, r5
	eors r3, r4
	str r3, [sp, #0xc]
	lsls r3, r2, #0x18
	lsrs r5, r3, #0x16
	ldr r3, _022262BC @ =0x02242AB0
	ldr r4, [r0, #4]
	ldr r3, [r3, r5]
	lsrs r5, r1, #8
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x16
	ldr r5, _022262C0 @ =0x022426B0
	ldr r7, [r5, r6]
	ldr r5, [sp, #0x44]
	lsrs r5, r5, #0x18
	lsls r6, r5, #2
	ldr r5, _022262C4 @ =0x022446B0
	ldr r5, [r5, r6]
	str r5, [sp, #0x1c]
	ldr r5, [sp, #0x10]
	lsrs r5, r5, #0x10
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x16
	ldr r5, _022262C8 @ =0x02244AB0
	ldr r6, [r5, r6]
	ldr r5, [sp, #0x1c]
	eors r5, r6
	eors r5, r7
	eors r3, r5
	eors r3, r4
	str r3, [sp, #8]
	lsls r3, r1, #0x18
	lsrs r4, r3, #0x16
	ldr r3, _022262BC @ =0x02242AB0
	ldr r6, [r0, #8]
	ldr r5, [r3, r4]
	ldr r3, [sp, #0x10]
	lsrs r1, r1, #0x18
	lsrs r3, r3, #8
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x16
	ldr r3, _022262C0 @ =0x022426B0
	ldr r3, [r3, r4]
	str r3, [sp, #0x20]
	lsrs r3, r2, #0x18
	lsls r4, r3, #2
	ldr r3, _022262C4 @ =0x022446B0
	lsrs r2, r2, #0x10
	ldr r7, [r3, r4]
	ldr r3, [sp, #0x44]
	lsls r2, r2, #0x18
	lsrs r3, r3, #0x10
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x16
	ldr r3, _022262C8 @ =0x02244AB0
	ldr r3, [r3, r4]
	adds r4, r7, #0
	eors r4, r3
	ldr r3, [sp, #0x20]
	eors r3, r4
	eors r3, r5
	eors r3, r6
	str r3, [sp, #0x40]
	ldr r3, [sp, #0x10]
	ldr r5, [r0, #0xc]
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x16
	ldr r3, _022262BC @ =0x02242AB0
	ldr r4, [r3, r4]
	ldr r3, [sp, #0x44]
	lsrs r3, r3, #8
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x16
	ldr r3, _022262C0 @ =0x022426B0
	ldr r3, [r3, r6]
	lsls r6, r1, #2
	ldr r1, _022262C4 @ =0x022446B0
	ldr r1, [r1, r6]
	lsrs r6, r2, #0x16
	ldr r2, _022262C8 @ =0x02244AB0
	ldr r2, [r2, r6]
	adds r6, r5, #0
	eors r1, r2
	eors r1, r3
	eors r1, r4
	eors r6, r1
	b _02225F8A
_0222614E:
	ldr r3, [r0]
	movs r6, #0xff
	str r3, [sp, #0x24]
	ldr r3, [sp, #0x44]
	lsls r6, r6, #0x10
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x16
	ldr r3, _022262CC @ =0x02242EB0
	ldr r4, [r3, r4]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x28]
	lsrs r4, r2, #8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #8
	ands r4, r5
	str r4, [sp, #0x2c]
	ldr r4, [sp, #0x10]
	lsrs r4, r4, #0x18
	lsls r4, r4, #2
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #0x18
	ands r5, r4
	lsrs r4, r1, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r4, [r3, r4]
	ands r4, r6
	eors r5, r4
	ldr r4, [sp, #0x2c]
	eors r5, r4
	ldr r4, [sp, #0x28]
	eors r5, r4
	ldr r4, [sp, #0x24]
	eors r4, r5
	ldr r5, [sp]
	lsrs r6, r4, #0x18
	strb r6, [r5]
	lsrs r6, r4, #0x10
	strb r6, [r5, #1]
	lsrs r6, r4, #8
	strb r6, [r5, #2]
	strb r4, [r5, #3]
	ldr r4, [r0, #4]
	movs r6, #0xff
	str r4, [sp, #0x30]
	lsls r4, r2, #0x18
	lsrs r4, r4, #0x16
	ldr r4, [r3, r4]
	lsls r6, r6, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x34]
	lsrs r4, r1, #8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #8
	ands r4, r5
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x44]
	lsrs r4, r4, #0x18
	lsls r4, r4, #2
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #0x18
	ands r5, r4
	ldr r4, [sp, #0x10]
	lsrs r4, r4, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r4, [r3, r4]
	ands r4, r6
	eors r5, r4
	ldr r4, [sp, #0x38]
	eors r5, r4
	ldr r4, [sp, #0x34]
	eors r5, r4
	ldr r4, [sp, #0x30]
	eors r4, r5
	ldr r5, [sp]
	lsrs r6, r4, #0x18
	strb r6, [r5, #4]
	lsrs r6, r4, #0x10
	strb r6, [r5, #5]
	lsrs r6, r4, #8
	strb r6, [r5, #6]
	strb r4, [r5, #7]
	ldr r4, [r0, #8]
	str r4, [sp, #0x3c]
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x16
	ldr r4, [r3, r4]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov lr, r4
	ldr r4, [sp, #0x10]
	lsrs r4, r4, #8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #8
	ands r4, r5
	mov ip, r4
	lsrs r4, r2, #0x18
	lsls r4, r4, #2
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #0x18
	adds r6, r5, #0
	ands r6, r4
	ldr r4, [sp, #0x44]
	lsrs r4, r4, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x16
	ldr r5, [r3, r4]
	movs r4, #0xff
	lsls r4, r4, #0x10
	ands r4, r5
	eors r4, r6
	mov r5, ip
	eors r5, r4
	mov r4, lr
	eors r5, r4
	ldr r4, [sp, #0x3c]
	eors r4, r5
	ldr r5, [sp]
	lsrs r6, r4, #0x18
	strb r6, [r5, #8]
	lsrs r6, r4, #0x10
	strb r6, [r5, #9]
	lsrs r6, r4, #8
	strb r6, [r5, #0xa]
	strb r4, [r5, #0xb]
	ldr r5, [r0, #0xc]
	ldr r0, [sp, #0x10]
	lsrs r2, r2, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r0, [r3, r0]
	lsrs r1, r1, #0x18
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp, #0x44]
	lsls r2, r2, #0x18
	lsrs r0, r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r6, [r3, r0]
	movs r0, #0xff
	lsls r0, r0, #8
	lsls r1, r1, #2
	ands r0, r6
	movs r6, #0xff
	lsrs r2, r2, #0x16
	ldr r1, [r3, r1]
	ldr r3, [r3, r2]
	movs r2, #0xff
	lsls r6, r6, #0x18
	lsls r2, r2, #0x10
	ands r1, r6
	ands r2, r3
	eors r1, r2
	eors r0, r1
	eors r0, r4
	eors r0, r5
	ldr r1, [sp]
	lsrs r2, r0, #0x18
	strb r2, [r1, #0xc]
	lsrs r2, r0, #0x10
	strb r2, [r1, #0xd]
	lsrs r2, r0, #8
	strb r2, [r1, #0xe]
	strb r0, [r1, #0xf]
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022262BC: .4byte 0x02242AB0
_022262C0: .4byte 0x022426B0
_022262C4: .4byte 0x022446B0
_022262C8: .4byte 0x02244AB0
_022262CC: .4byte 0x02242EB0
	thumb_func_end ov13_02225F14

	thumb_func_start ov13_022262D0
ov13_022262D0: @ 0x022262D0
	movs r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x10]
	ldr r1, _022262E8 @ =0x67452301
	str r1, [r0]
	ldr r1, _022262EC @ =0xEFCDAB89
	str r1, [r0, #4]
	ldr r1, _022262F0 @ =0x98BADCFE
	str r1, [r0, #8]
	ldr r1, _022262F4 @ =0x10325476
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_022262E8: .4byte 0x67452301
_022262EC: .4byte 0xEFCDAB89
_022262F0: .4byte 0x98BADCFE
_022262F4: .4byte 0x10325476
	thumb_func_end ov13_022262D0

	thumb_func_start ov13_022262F8
ov13_022262F8: @ 0x022262F8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, [r5, #0x10]
	adds r6, r2, #0
	lsrs r2, r1, #3
	movs r0, #0x3f
	ands r0, r2
	lsls r2, r6, #3
	adds r1, r1, r2
	str r1, [r5, #0x10]
	cmp r1, r2
	bhs _02226318
	ldr r1, [r5, #0x14]
	adds r1, r1, #1
	str r1, [r5, #0x14]
_02226318:
	ldr r2, [r5, #0x14]
	lsrs r1, r6, #0x1d
	adds r1, r2, r1
	str r1, [r5, #0x14]
	movs r1, #0x40
	subs r4, r1, r0
	cmp r6, r4
	blo _0222635E
	adds r1, r5, #0
	adds r1, #0x18
	adds r0, r1, r0
	adds r1, r7, #0
	adds r2, r4, #0
	bl ov13_02226C64
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x18
	bl ov13_022263C4
	adds r0, r4, #0
	adds r0, #0x3f
	cmp r0, r6
	bhs _0222635A
_02226348:
	adds r0, r5, #0
	adds r1, r7, r4
	bl ov13_022263C4
	adds r4, #0x40
	adds r0, r4, #0
	adds r0, #0x3f
	cmp r0, r6
	blo _02226348
_0222635A:
	movs r0, #0
	b _02226360
_0222635E:
	movs r4, #0
_02226360:
	adds r5, #0x18
	adds r0, r5, r0
	adds r1, r7, r4
	subs r2, r6, r4
	bl ov13_02226C64
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov13_022262F8

	thumb_func_start ov13_02226370
ov13_02226370: @ 0x02226370
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	add r0, sp, #0
	adds r1, #0x10
	movs r2, #8
	bl ov13_02226C0C
	ldr r0, [r4, #0x10]
	lsrs r1, r0, #3
	movs r0, #0x3f
	ands r1, r0
	cmp r1, #0x38
	bhs _02226392
	movs r0, #0x38
	b _02226394
_02226392:
	movs r0, #0x78
_02226394:
	subs r2, r0, r1
	ldr r1, _022263C0 @ =0x02245AD8
	adds r0, r4, #0
	bl ov13_022262F8
	adds r0, r4, #0
	add r1, sp, #0
	movs r2, #8
	bl ov13_022262F8
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x10
	bl ov13_02226C0C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x58
	bl ov13_02226C7C
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_022263C0: .4byte 0x02245AD8
	thumb_func_end ov13_02226370

	thumb_func_start ov13_022263C4
ov13_022263C4: @ 0x022263C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	adds r7, r0, #0
	ldr r0, [r7]
	movs r2, #0x40
	str r0, [sp]
	add r0, sp, #0x44
	ldr r4, [r7, #4]
	ldr r5, [r7, #8]
	ldr r6, [r7, #0xc]
	bl ov13_02226C38
	ldr r0, [sp, #0x44]
	adds r1, r4, #0
	str r0, [sp, #4]
	mvns r0, r4
	ands r1, r5
	ands r0, r6
	orrs r1, r0
	ldr r0, [sp, #4]
	adds r1, r0, r1
	ldr r0, _0222679C @ =0x28955B88
	subs r1, r1, r0
	ldr r0, [sp]
	adds r0, r0, r1
	lsls r1, r0, #7
	lsrs r0, r0, #0x19
	orrs r0, r1
	adds r3, r0, r4
	ldr r0, [sp, #0x48]
	mvns r1, r3
	str r0, [sp, #8]
	adds r0, r3, #0
	ands r0, r4
	ands r1, r5
	orrs r1, r0
	ldr r0, [sp, #8]
	adds r1, r0, r1
	ldr r0, _022267A0 @ =0x173848AA
	subs r0, r1, r0
	adds r0, r6, r0
	lsls r1, r0, #0xc
	lsrs r0, r0, #0x14
	orrs r0, r1
	adds r2, r0, r3
	ldr r0, [sp, #0x4c]
	mvns r1, r2
	str r0, [sp, #0xc]
	adds r0, r2, #0
	ands r0, r3
	ands r1, r4
	orrs r1, r0
	ldr r0, [sp, #0xc]
	adds r1, r0, r1
	ldr r0, _022267A4 @ =0x242070DB
	adds r0, r1, r0
	adds r0, r5, r0
	lsls r1, r0, #0x11
	lsrs r0, r0, #0xf
	orrs r0, r1
	adds r1, r0, r2
	ldr r0, [sp, #0x50]
	mvns r5, r1
	str r0, [sp, #0x10]
	adds r0, r1, #0
	ands r0, r2
	ands r5, r3
	orrs r5, r0
	ldr r0, [sp, #0x10]
	adds r5, r0, r5
	ldr r0, _022267A8 @ =0x3E423112
	subs r0, r5, r0
	adds r0, r4, r0
	lsls r4, r0, #0x16
	lsrs r0, r0, #0xa
	orrs r0, r4
	ldr r4, [sp, #0x54]
	adds r0, r0, r1
	str r4, [sp, #0x14]
	adds r4, r0, #0
	mvns r5, r0
	ands r4, r1
	ands r5, r2
	orrs r5, r4
	ldr r4, [sp, #0x14]
	adds r5, r4, r5
	ldr r4, _022267AC @ =0x0A83F051
	subs r4, r5, r4
	adds r3, r3, r4
	lsls r4, r3, #7
	lsrs r3, r3, #0x19
	orrs r3, r4
	ldr r4, [sp, #0x58]
	adds r3, r3, r0
	str r4, [sp, #0x18]
	adds r4, r3, #0
	mvns r5, r3
	ands r4, r0
	ands r5, r1
	orrs r5, r4
	ldr r4, [sp, #0x18]
	adds r5, r4, r5
	ldr r4, _022267B0 @ =0x4787C62A
	adds r4, r5, r4
	adds r2, r2, r4
	lsls r4, r2, #0xc
	lsrs r2, r2, #0x14
	orrs r2, r4
	ldr r4, [sp, #0x5c]
	adds r2, r2, r3
	str r4, [sp, #0x1c]
	adds r4, r2, #0
	mvns r5, r2
	ands r4, r3
	ands r5, r0
	orrs r5, r4
	ldr r4, [sp, #0x1c]
	adds r5, r4, r5
	ldr r4, _022267B4 @ =0x57CFB9ED
	subs r4, r5, r4
	adds r1, r1, r4
	lsls r4, r1, #0x11
	lsrs r1, r1, #0xf
	orrs r1, r4
	ldr r4, [sp, #0x60]
	adds r1, r1, r2
	str r4, [sp, #0x20]
	adds r4, r1, #0
	mvns r5, r1
	ands r4, r2
	ands r5, r3
	orrs r5, r4
	ldr r4, [sp, #0x20]
	adds r5, r4, r5
	ldr r4, _022267B8 @ =0x02B96AFF
	subs r4, r5, r4
	adds r0, r0, r4
	lsls r4, r0, #0x16
	lsrs r0, r0, #0xa
	orrs r0, r4
	ldr r4, [sp, #0x64]
	adds r0, r0, r1
	str r4, [sp, #0x24]
	adds r4, r0, #0
	mvns r5, r0
	ands r4, r1
	ands r5, r2
	orrs r5, r4
	ldr r4, [sp, #0x24]
	adds r5, r4, r5
	ldr r4, _022267BC @ =0x698098D8
	adds r4, r5, r4
	adds r3, r3, r4
	lsls r4, r3, #7
	lsrs r3, r3, #0x19
	orrs r3, r4
	ldr r4, [sp, #0x68]
	adds r3, r3, r0
	str r4, [sp, #0x28]
	adds r4, r3, #0
	mvns r5, r3
	ands r4, r0
	ands r5, r1
	orrs r5, r4
	ldr r4, [sp, #0x28]
	adds r5, r4, r5
	ldr r4, _022267C0 @ =0x74BB0851
	subs r4, r5, r4
	adds r2, r2, r4
	lsls r4, r2, #0xc
	lsrs r2, r2, #0x14
	orrs r2, r4
	ldr r4, [sp, #0x6c]
	adds r2, r2, r3
	str r4, [sp, #0x2c]
	adds r4, r2, #0
	mvns r5, r2
	ands r4, r3
	ands r5, r0
	orrs r5, r4
	ldr r4, [sp, #0x2c]
	adds r5, r4, r5
	ldr r4, _022267C4 @ =0x0000A44F
	subs r4, r5, r4
	adds r1, r1, r4
	lsls r4, r1, #0x11
	lsrs r1, r1, #0xf
	orrs r1, r4
	ldr r4, [sp, #0x70]
	adds r1, r1, r2
	str r4, [sp, #0x30]
	adds r4, r1, #0
	mvns r5, r1
	ands r4, r2
	ands r5, r3
	orrs r5, r4
	ldr r4, [sp, #0x30]
	adds r5, r4, r5
	ldr r4, _022267C8 @ =0x76A32842
	subs r4, r5, r4
	adds r0, r0, r4
	lsls r4, r0, #0x16
	lsrs r0, r0, #0xa
	orrs r0, r4
	adds r0, r0, r1
	ldr r4, [sp, #0x74]
	mvns r5, r0
	str r4, [sp, #0x34]
	adds r4, r0, #0
	ands r4, r1
	ands r5, r2
	orrs r5, r4
	ldr r4, [sp, #0x34]
	adds r5, r4, r5
	ldr r4, _022267CC @ =0x6B901122
	adds r4, r5, r4
	adds r3, r3, r4
	lsls r4, r3, #7
	lsrs r3, r3, #0x19
	orrs r3, r4
	adds r4, r3, r0
	ldr r3, [sp, #0x78]
	mvns r5, r4
	str r3, [sp, #0x38]
	adds r3, r4, #0
	ands r3, r0
	ands r5, r1
	orrs r5, r3
	ldr r3, [sp, #0x38]
	adds r5, r3, r5
	ldr r3, _022267D0 @ =0x02678E6D
	subs r3, r5, r3
	adds r2, r2, r3
	lsls r3, r2, #0xc
	lsrs r2, r2, #0x14
	orrs r2, r3
	adds r3, r2, r4
	mvns r2, r3
	str r2, [sp, #0x3c]
	ldr r2, [sp, #0x7c]
	ldr r5, [sp, #0x3c]
	str r2, [sp, #0x40]
	adds r2, r3, #0
	ands r2, r4
	ands r5, r0
	orrs r5, r2
	ldr r2, [sp, #0x40]
	adds r5, r2, r5
	ldr r2, _022267D4 @ =0x5986BC72
	subs r2, r5, r2
	adds r1, r1, r2
	lsls r2, r1, #0x11
	lsrs r1, r1, #0xf
	orrs r1, r2
	adds r2, r1, r3
	ldr r1, [sp, #0x80]
	adds r5, r2, #0
	mvns r6, r2
	mov ip, r1
	adds r1, r6, #0
	ands r5, r3
	ands r1, r4
	orrs r5, r1
	mov r1, ip
	adds r5, r1, r5
	ldr r1, _022267D8 @ =0x49B40821
	adds r1, r5, r1
	adds r0, r0, r1
	lsls r1, r0, #0x16
	lsrs r0, r0, #0xa
	orrs r0, r1
	adds r1, r0, r2
	ldr r5, [sp, #0x3c]
	adds r0, r1, #0
	ands r0, r3
	ands r5, r2
	orrs r5, r0
	ldr r0, [sp, #8]
	adds r5, r0, r5
	ldr r0, _022267DC @ =0x09E1DA9E
	subs r0, r5, r0
	adds r0, r4, r0
	lsls r4, r0, #5
	lsrs r0, r0, #0x1b
	orrs r0, r4
	adds r0, r0, r1
	adds r4, r0, #0
	adds r5, r1, #0
	ands r4, r2
	bics r5, r2
	orrs r5, r4
	ldr r4, [sp, #0x1c]
	adds r5, r4, r5
	ldr r4, _022267E0 @ =0x3FBF4CC0
	subs r4, r5, r4
	adds r3, r3, r4
	lsls r4, r3, #9
	lsrs r3, r3, #0x17
	orrs r3, r4
	adds r3, r3, r0
	adds r4, r3, #0
	mvns r5, r1
	ands r4, r1
	ands r5, r0
	orrs r5, r4
	ldr r4, [sp, #0x30]
	adds r5, r4, r5
	ldr r4, _022267E4 @ =0x265E5A51
	adds r4, r5, r4
	adds r2, r2, r4
	lsls r4, r2, #0xe
	lsrs r2, r2, #0x12
	orrs r2, r4
	adds r2, r2, r3
	adds r4, r2, #0
	mvns r5, r0
	ands r4, r0
	ands r5, r3
	orrs r5, r4
	ldr r4, [sp, #4]
	adds r5, r4, r5
	ldr r4, _022267E8 @ =0x16493856
	subs r4, r5, r4
	adds r1, r1, r4
	lsls r4, r1, #0x14
	lsrs r1, r1, #0xc
	orrs r1, r4
	adds r1, r1, r2
	adds r4, r1, #0
	mvns r5, r3
	ands r4, r3
	ands r5, r2
	orrs r5, r4
	ldr r4, [sp, #0x18]
	adds r5, r4, r5
	ldr r4, _022267EC @ =0x29D0EFA3
	subs r4, r5, r4
	adds r0, r0, r4
	lsls r4, r0, #5
	lsrs r0, r0, #0x1b
	orrs r0, r4
	adds r4, r0, r1
	adds r0, r4, #0
	mvns r5, r2
	ands r0, r2
	ands r5, r1
	orrs r5, r0
	ldr r0, [sp, #0x2c]
	adds r5, r0, r5
	ldr r0, _022267F0 @ =0x02441453
	adds r0, r5, r0
	adds r0, r3, r0
	lsls r3, r0, #9
	lsrs r0, r0, #0x17
	orrs r0, r3
	adds r3, r0, r4
	adds r0, r3, #0
	mvns r5, r1
	ands r0, r1
	ands r5, r4
	orrs r5, r0
	mov r0, ip
	adds r5, r0, r5
	ldr r0, _022267F4 @ =0x275E197F
	subs r0, r5, r0
	adds r0, r2, r0
	lsls r2, r0, #0xe
	lsrs r0, r0, #0x12
	orrs r0, r2
	adds r0, r0, r3
	adds r2, r0, #0
	mvns r5, r4
	ands r2, r4
	ands r5, r3
	orrs r5, r2
	ldr r2, [sp, #0x14]
	adds r5, r2, r5
	ldr r2, _022267F8 @ =0x182C0438
	subs r2, r5, r2
	adds r1, r1, r2
	lsls r2, r1, #0x14
	lsrs r1, r1, #0xc
	orrs r1, r2
	adds r5, r1, r0
	adds r1, r5, #0
	mvns r2, r3
	ands r1, r3
	ands r2, r0
	orrs r2, r1
	ldr r1, [sp, #0x28]
	adds r2, r1, r2
	ldr r1, _022267FC @ =0x21E1CDE6
	adds r1, r2, r1
	adds r1, r4, r1
	lsls r2, r1, #5
	lsrs r1, r1, #0x1b
	orrs r1, r2
	adds r2, r1, r5
	adds r1, r2, #0
	mvns r4, r0
	ands r1, r0
	ands r4, r5
	orrs r4, r1
	ldr r1, [sp, #0x40]
	adds r4, r1, r4
	ldr r1, _02226800 @ =0x3CC8F82A
	subs r1, r4, r1
	adds r1, r3, r1
	lsls r3, r1, #9
	lsrs r1, r1, #0x17
	orrs r1, r3
	adds r1, r1, r2
	adds r3, r1, #0
	mvns r4, r5
	ands r3, r5
	ands r4, r2
	orrs r4, r3
	ldr r3, [sp, #0x10]
	adds r4, r3, r4
	ldr r3, _02226804 @ =0x0B2AF279
	subs r3, r4, r3
	adds r0, r0, r3
	lsls r3, r0, #0xe
	lsrs r0, r0, #0x12
	orrs r0, r3
	adds r4, r0, r1
	adds r0, r4, #0
	mvns r3, r2
	ands r0, r2
	ands r3, r1
	orrs r3, r0
	ldr r0, [sp, #0x24]
	adds r3, r0, r3
	ldr r0, _02226808 @ =0x455A14ED
	adds r0, r3, r0
	adds r0, r5, r0
	lsls r3, r0, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r3
	adds r3, r0, r4
	adds r0, r3, #0
	mvns r5, r1
	ands r0, r1
	ands r5, r4
	orrs r5, r0
	ldr r0, [sp, #0x38]
	adds r5, r0, r5
	ldr r0, _0222680C @ =0x561C16FB
	subs r0, r5, r0
	adds r0, r2, r0
	lsls r2, r0, #5
	lsrs r0, r0, #0x1b
	orrs r0, r2
	adds r0, r0, r3
	adds r2, r0, #0
	mvns r5, r4
	ands r2, r4
	ands r5, r3
	orrs r5, r2
	ldr r2, [sp, #0xc]
	adds r5, r2, r5
	ldr r2, _02226810 @ =0x03105C08
	subs r2, r5, r2
	adds r1, r1, r2
	lsls r2, r1, #9
	lsrs r1, r1, #0x17
	orrs r1, r2
	adds r5, r1, r0
	adds r1, r5, #0
	mvns r2, r3
	ands r1, r3
	ands r2, r0
	orrs r2, r1
	ldr r1, [sp, #0x20]
	adds r2, r1, r2
	ldr r1, _02226814 @ =0x676F02D9
	adds r1, r2, r1
	adds r1, r4, r1
	lsls r2, r1, #0xe
	lsrs r1, r1, #0x12
	orrs r1, r2
	adds r2, r1, r5
	adds r1, r2, #0
	mvns r4, r0
	ands r1, r0
	ands r4, r5
	orrs r4, r1
	ldr r1, [sp, #0x34]
	adds r4, r1, r4
	ldr r1, _02226818 @ =0x72D5B376
	b _0222681C
	nop
_0222679C: .4byte 0x28955B88
_022267A0: .4byte 0x173848AA
_022267A4: .4byte 0x242070DB
_022267A8: .4byte 0x3E423112
_022267AC: .4byte 0x0A83F051
_022267B0: .4byte 0x4787C62A
_022267B4: .4byte 0x57CFB9ED
_022267B8: .4byte 0x02B96AFF
_022267BC: .4byte 0x698098D8
_022267C0: .4byte 0x74BB0851
_022267C4: .4byte 0x0000A44F
_022267C8: .4byte 0x76A32842
_022267CC: .4byte 0x6B901122
_022267D0: .4byte 0x02678E6D
_022267D4: .4byte 0x5986BC72
_022267D8: .4byte 0x49B40821
_022267DC: .4byte 0x09E1DA9E
_022267E0: .4byte 0x3FBF4CC0
_022267E4: .4byte 0x265E5A51
_022267E8: .4byte 0x16493856
_022267EC: .4byte 0x29D0EFA3
_022267F0: .4byte 0x02441453
_022267F4: .4byte 0x275E197F
_022267F8: .4byte 0x182C0438
_022267FC: .4byte 0x21E1CDE6
_02226800: .4byte 0x3CC8F82A
_02226804: .4byte 0x0B2AF279
_02226808: .4byte 0x455A14ED
_0222680C: .4byte 0x561C16FB
_02226810: .4byte 0x03105C08
_02226814: .4byte 0x676F02D9
_02226818: .4byte 0x72D5B376
_0222681C:
	subs r1, r4, r1
	adds r1, r3, r1
	lsls r3, r1, #0x14
	lsrs r1, r1, #0xc
	orrs r1, r3
	adds r1, r1, r2
	adds r3, r1, #0
	eors r3, r2
	adds r4, r5, #0
	eors r4, r3
	ldr r3, [sp, #0x18]
	adds r4, r3, r4
	ldr r3, _02226B8C @ =0x0005C6BE
	subs r3, r4, r3
	adds r0, r0, r3
	lsls r3, r0, #4
	lsrs r0, r0, #0x1c
	orrs r0, r3
	adds r4, r0, r1
	adds r0, r4, #0
	eors r0, r1
	adds r3, r2, #0
	eors r3, r0
	ldr r0, [sp, #0x24]
	adds r3, r0, r3
	ldr r0, _02226B90 @ =0x788E097F
	subs r0, r3, r0
	adds r0, r5, r0
	lsls r3, r0, #0xb
	lsrs r0, r0, #0x15
	orrs r0, r3
	adds r3, r0, r4
	adds r0, r3, #0
	eors r0, r4
	adds r5, r1, #0
	eors r5, r0
	ldr r0, [sp, #0x30]
	adds r5, r0, r5
	ldr r0, _02226B94 @ =0x6D9D6122
	adds r0, r5, r0
	adds r0, r2, r0
	lsls r2, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r2
	adds r0, r0, r3
	adds r2, r0, #0
	eors r2, r3
	adds r5, r4, #0
	eors r5, r2
	ldr r2, [sp, #0x40]
	adds r5, r2, r5
	ldr r2, _02226B98 @ =0x021AC7F4
	subs r2, r5, r2
	adds r1, r1, r2
	lsls r2, r1, #0x17
	lsrs r1, r1, #9
	orrs r1, r2
	adds r5, r1, r0
	adds r1, r5, #0
	eors r1, r0
	adds r2, r3, #0
	eors r2, r1
	ldr r1, [sp, #8]
	adds r2, r1, r2
	ldr r1, _02226B9C @ =0x5B4115BC
	subs r1, r2, r1
	adds r1, r4, r1
	lsls r2, r1, #4
	lsrs r1, r1, #0x1c
	orrs r1, r2
	adds r2, r1, r5
	adds r1, r2, #0
	eors r1, r5
	adds r4, r0, #0
	eors r4, r1
	ldr r1, [sp, #0x14]
	adds r4, r1, r4
	ldr r1, _02226BA0 @ =0x4BDECFA9
	adds r1, r4, r1
	adds r1, r3, r1
	lsls r3, r1, #0xb
	lsrs r1, r1, #0x15
	orrs r1, r3
	adds r1, r1, r2
	adds r3, r1, #0
	eors r3, r2
	adds r4, r5, #0
	eors r4, r3
	ldr r3, [sp, #0x20]
	adds r4, r3, r4
	ldr r3, _02226BA4 @ =0x0944B4A0
	subs r3, r4, r3
	adds r0, r0, r3
	lsls r3, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r3
	adds r4, r0, r1
	adds r0, r4, #0
	eors r0, r1
	adds r3, r2, #0
	eors r3, r0
	ldr r0, [sp, #0x2c]
	adds r3, r0, r3
	ldr r0, _02226BA8 @ =0x41404390
	subs r0, r3, r0
	adds r0, r5, r0
	lsls r3, r0, #0x17
	lsrs r0, r0, #9
	orrs r0, r3
	adds r3, r0, r4
	adds r0, r3, #0
	eors r0, r4
	adds r5, r1, #0
	eors r5, r0
	ldr r0, [sp, #0x38]
	adds r5, r0, r5
	ldr r0, _02226BAC @ =0x289B7EC6
	adds r0, r5, r0
	adds r0, r2, r0
	lsls r2, r0, #4
	lsrs r0, r0, #0x1c
	orrs r0, r2
	adds r0, r0, r3
	adds r2, r0, #0
	eors r2, r3
	adds r5, r4, #0
	eors r5, r2
	ldr r2, [sp, #4]
	adds r5, r2, r5
	ldr r2, _02226BB0 @ =0x155ED806
	subs r2, r5, r2
	adds r1, r1, r2
	lsls r2, r1, #0xb
	lsrs r1, r1, #0x15
	orrs r1, r2
	adds r5, r1, r0
	adds r1, r5, #0
	eors r1, r0
	adds r2, r3, #0
	eors r2, r1
	ldr r1, [sp, #0x10]
	adds r2, r1, r2
	ldr r1, _02226BB4 @ =0x2B10CF7B
	subs r1, r2, r1
	adds r1, r4, r1
	lsls r2, r1, #0x10
	lsrs r1, r1, #0x10
	orrs r1, r2
	adds r2, r1, r5
	adds r1, r2, #0
	eors r1, r5
	adds r4, r0, #0
	eors r4, r1
	ldr r1, [sp, #0x1c]
	adds r4, r1, r4
	ldr r1, _02226BB8 @ =0x04881D05
	adds r1, r4, r1
	adds r1, r3, r1
	lsls r3, r1, #0x17
	lsrs r1, r1, #9
	orrs r1, r3
	adds r1, r1, r2
	adds r3, r1, #0
	eors r3, r2
	adds r4, r5, #0
	eors r4, r3
	ldr r3, [sp, #0x28]
	adds r4, r3, r4
	ldr r3, _02226BBC @ =0x262B2FC7
	subs r3, r4, r3
	adds r0, r0, r3
	lsls r3, r0, #4
	lsrs r0, r0, #0x1c
	orrs r0, r3
	adds r4, r0, r1
	adds r0, r4, #0
	eors r0, r1
	adds r3, r2, #0
	eors r3, r0
	ldr r0, [sp, #0x34]
	adds r3, r0, r3
	ldr r0, _02226BC0 @ =0x1924661B
	subs r0, r3, r0
	adds r0, r5, r0
	lsls r3, r0, #0xb
	lsrs r0, r0, #0x15
	orrs r0, r3
	adds r3, r0, r4
	adds r0, r3, #0
	eors r0, r4
	adds r5, r1, #0
	eors r5, r0
	mov r0, ip
	adds r5, r0, r5
	ldr r0, _02226BC4 @ =0x1FA27CF8
	adds r0, r5, r0
	adds r0, r2, r0
	lsls r2, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r2
	adds r0, r0, r3
	adds r2, r0, #0
	eors r2, r3
	adds r5, r4, #0
	eors r5, r2
	ldr r2, [sp, #0xc]
	adds r5, r2, r5
	ldr r2, _02226BC8 @ =0x3B53A99B
	subs r2, r5, r2
	adds r1, r1, r2
	lsls r2, r1, #0x17
	lsrs r1, r1, #9
	orrs r1, r2
	adds r5, r1, r0
	mvns r1, r3
	orrs r1, r5
	adds r2, r0, #0
	eors r2, r1
	ldr r1, [sp, #4]
	adds r2, r1, r2
	ldr r1, _02226BCC @ =0x0BD6DDBC
	subs r1, r2, r1
	adds r1, r4, r1
	lsls r2, r1, #6
	lsrs r1, r1, #0x1a
	orrs r1, r2
	adds r2, r1, r5
	mvns r1, r0
	orrs r1, r2
	adds r4, r5, #0
	eors r4, r1
	ldr r1, [sp, #0x20]
	adds r4, r1, r4
	ldr r1, _02226BD0 @ =0x432AFF97
	adds r1, r4, r1
	adds r1, r3, r1
	lsls r3, r1, #0xa
	lsrs r1, r1, #0x16
	orrs r1, r3
	adds r1, r1, r2
	mvns r3, r5
	orrs r3, r1
	adds r4, r2, #0
	eors r4, r3
	ldr r3, [sp, #0x40]
	adds r4, r3, r4
	ldr r3, _02226BD4 @ =0x546BDC59
	subs r3, r4, r3
	adds r0, r0, r3
	lsls r3, r0, #0xf
	lsrs r0, r0, #0x11
	orrs r0, r3
	adds r4, r0, r1
	mvns r0, r2
	orrs r0, r4
	adds r3, r1, #0
	eors r3, r0
	ldr r0, [sp, #0x18]
	adds r3, r0, r3
	ldr r0, _02226BD8 @ =0x036C5FC7
	subs r0, r3, r0
	adds r0, r5, r0
	lsls r3, r0, #0x15
	lsrs r0, r0, #0xb
	orrs r0, r3
	adds r3, r0, r4
	mvns r0, r1
	orrs r0, r3
	adds r5, r4, #0
	eors r5, r0
	ldr r0, [sp, #0x34]
	adds r5, r0, r5
	ldr r0, _02226BDC @ =0x655B59C3
	adds r0, r5, r0
	adds r0, r2, r0
	lsls r2, r0, #6
	lsrs r0, r0, #0x1a
	orrs r0, r2
	adds r0, r0, r3
	mvns r2, r4
	orrs r2, r0
	adds r5, r3, #0
	eors r5, r2
	ldr r2, [sp, #0x10]
	adds r5, r2, r5
	ldr r2, _02226BE0 @ =0x70F3336E
	subs r2, r5, r2
	adds r1, r1, r2
	lsls r2, r1, #0xa
	lsrs r1, r1, #0x16
	orrs r1, r2
	adds r5, r1, r0
	mvns r1, r3
	orrs r1, r5
	adds r2, r0, #0
	eors r2, r1
	ldr r1, [sp, #0x2c]
	adds r2, r1, r2
	ldr r1, _02226BE4 @ =0x00100B83
	subs r1, r2, r1
	adds r1, r4, r1
	lsls r2, r1, #0xf
	lsrs r1, r1, #0x11
	orrs r1, r2
	adds r2, r1, r5
	mvns r1, r0
	orrs r1, r2
	adds r4, r5, #0
	eors r4, r1
	ldr r1, [sp, #8]
	adds r4, r1, r4
	ldr r1, _02226BE8 @ =0x7A7BA22F
	subs r1, r4, r1
	adds r1, r3, r1
	lsls r3, r1, #0x15
	lsrs r1, r1, #0xb
	orrs r1, r3
	adds r1, r1, r2
	mvns r3, r5
	orrs r3, r1
	adds r4, r2, #0
	eors r4, r3
	ldr r3, [sp, #0x24]
	adds r4, r3, r4
	ldr r3, _02226BEC @ =0x6FA87E4F
	adds r3, r4, r3
	adds r0, r0, r3
	lsls r3, r0, #6
	lsrs r0, r0, #0x1a
	orrs r0, r3
	adds r3, r0, r1
	mvns r0, r2
	orrs r0, r3
	eors r0, r1
	mov r4, ip
	adds r4, r4, r0
	ldr r0, _02226BF0 @ =0x01D31920
	subs r0, r4, r0
	adds r0, r5, r0
	lsls r4, r0, #0xa
	lsrs r0, r0, #0x16
	orrs r0, r4
	adds r0, r0, r3
	mvns r4, r1
	orrs r4, r0
	adds r5, r3, #0
	eors r5, r4
	ldr r4, [sp, #0x1c]
	adds r5, r4, r5
	ldr r4, _02226BF4 @ =0x5CFEBCEC
	subs r4, r5, r4
	adds r2, r2, r4
	lsls r4, r2, #0xf
	lsrs r2, r2, #0x11
	orrs r2, r4
	adds r4, r2, r0
	mvns r2, r3
	orrs r2, r4
	adds r5, r0, #0
	eors r5, r2
	ldr r2, [sp, #0x38]
	adds r5, r2, r5
	ldr r2, _02226BF8 @ =0x4E0811A1
	adds r2, r5, r2
	adds r1, r1, r2
	lsls r2, r1, #0x15
	lsrs r1, r1, #0xb
	orrs r1, r2
	adds r2, r1, r4
	mvns r1, r0
	orrs r1, r2
	adds r5, r4, #0
	eors r5, r1
	ldr r1, [sp, #0x14]
	adds r5, r1, r5
	ldr r1, _02226BFC @ =0x08AC817E
	subs r1, r5, r1
	adds r1, r3, r1
	lsls r3, r1, #6
	lsrs r1, r1, #0x1a
	orrs r1, r3
	adds r1, r1, r2
	mvns r3, r4
	orrs r3, r1
	adds r5, r2, #0
	eors r5, r3
	ldr r3, [sp, #0x30]
	adds r5, r3, r5
	ldr r3, _02226C00 @ =0x42C50DCB
	subs r3, r5, r3
	adds r0, r0, r3
	lsls r3, r0, #0xa
	lsrs r0, r0, #0x16
	orrs r0, r3
	adds r5, r0, r1
	mvns r0, r2
	orrs r0, r5
	adds r3, r1, #0
	eors r3, r0
	ldr r0, [sp, #0xc]
	adds r3, r0, r3
	ldr r0, _02226C04 @ =0x2AD7D2BB
	adds r0, r3, r0
	adds r0, r4, r0
	lsls r3, r0, #0xf
	lsrs r0, r0, #0x11
	orrs r0, r3
	adds r3, r0, r5
	mvns r0, r1
	orrs r0, r3
	adds r4, r5, #0
	eors r4, r0
	ldr r0, [sp, #0x28]
	adds r4, r0, r4
	ldr r0, _02226C08 @ =0x14792C6F
	subs r0, r4, r0
	adds r0, r2, r0
	lsls r2, r0, #0x15
	lsrs r0, r0, #0xb
	orrs r0, r2
	ldr r2, [r7]
	adds r0, r0, r3
	adds r1, r2, r1
	str r1, [r7]
	ldr r1, [r7, #4]
	movs r2, #0x40
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r0, [r7, #8]
	movs r1, #0
	adds r0, r0, r3
	str r0, [r7, #8]
	ldr r0, [r7, #0xc]
	adds r0, r0, r5
	str r0, [r7, #0xc]
	add r0, sp, #0x44
	bl ov13_02226C7C
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02226B8C: .4byte 0x0005C6BE
_02226B90: .4byte 0x788E097F
_02226B94: .4byte 0x6D9D6122
_02226B98: .4byte 0x021AC7F4
_02226B9C: .4byte 0x5B4115BC
_02226BA0: .4byte 0x4BDECFA9
_02226BA4: .4byte 0x0944B4A0
_02226BA8: .4byte 0x41404390
_02226BAC: .4byte 0x289B7EC6
_02226BB0: .4byte 0x155ED806
_02226BB4: .4byte 0x2B10CF7B
_02226BB8: .4byte 0x04881D05
_02226BBC: .4byte 0x262B2FC7
_02226BC0: .4byte 0x1924661B
_02226BC4: .4byte 0x1FA27CF8
_02226BC8: .4byte 0x3B53A99B
_02226BCC: .4byte 0x0BD6DDBC
_02226BD0: .4byte 0x432AFF97
_02226BD4: .4byte 0x546BDC59
_02226BD8: .4byte 0x036C5FC7
_02226BDC: .4byte 0x655B59C3
_02226BE0: .4byte 0x70F3336E
_02226BE4: .4byte 0x00100B83
_02226BE8: .4byte 0x7A7BA22F
_02226BEC: .4byte 0x6FA87E4F
_02226BF0: .4byte 0x01D31920
_02226BF4: .4byte 0x5CFEBCEC
_02226BF8: .4byte 0x4E0811A1
_02226BFC: .4byte 0x08AC817E
_02226C00: .4byte 0x42C50DCB
_02226C04: .4byte 0x2AD7D2BB
_02226C08: .4byte 0x14792C6F
	thumb_func_end ov13_022263C4

	thumb_func_start ov13_02226C0C
ov13_02226C0C: @ 0x02226C0C
	push {r4, r5}
	movs r4, #0
	cmp r2, #0
	bls _02226C34
_02226C14:
	ldr r5, [r1]
	adds r3, r0, r4
	strb r5, [r0, r4]
	ldr r5, [r1]
	adds r4, r4, #4
	lsrs r5, r5, #8
	strb r5, [r3, #1]
	ldr r5, [r1]
	lsrs r5, r5, #0x10
	strb r5, [r3, #2]
	ldr r5, [r1]
	adds r1, r1, #4
	lsrs r5, r5, #0x18
	strb r5, [r3, #3]
	cmp r4, r2
	blo _02226C14
_02226C34:
	pop {r4, r5}
	bx lr
	thumb_func_end ov13_02226C0C

	thumb_func_start ov13_02226C38
ov13_02226C38: @ 0x02226C38
	push {r4, r5, r6, r7}
	movs r7, #0
	cmp r2, #0
	bls _02226C5E
_02226C40:
	adds r6, r1, r7
	ldrb r3, [r6, #3]
	lsls r5, r3, #0x18
	ldrb r3, [r6, #2]
	ldrb r6, [r6, #1]
	lsls r4, r3, #0x10
	ldrb r3, [r1, r7]
	lsls r6, r6, #8
	adds r7, r7, #4
	orrs r3, r6
	orrs r3, r4
	orrs r3, r5
	stm r0!, {r3}
	cmp r7, r2
	blo _02226C40
_02226C5E:
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
	thumb_func_end ov13_02226C38

	thumb_func_start ov13_02226C64
ov13_02226C64: @ 0x02226C64
	push {r3, r4}
	movs r4, #0
	cmp r2, #0
	bls _02226C76
_02226C6C:
	ldrb r3, [r1, r4]
	strb r3, [r0, r4]
	adds r4, r4, #1
	cmp r4, r2
	blo _02226C6C
_02226C76:
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov13_02226C64

	thumb_func_start ov13_02226C7C
ov13_02226C7C: @ 0x02226C7C
	movs r3, #0
	cmp r2, #0
	bls _02226C90
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
_02226C86:
	adds r3, r3, #1
	strb r1, [r0]
	adds r0, r0, #1
	cmp r3, r2
	blo _02226C86
_02226C90:
	bx lr
	.align 2, 0
	thumb_func_end ov13_02226C7C

	thumb_func_start ov13_02226C94
ov13_02226C94: @ 0x02226C94
	push {r4, r5, r6, lr}
	sub sp, #0x58
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	add r0, sp, #0
	bl ov13_022262D0
	add r0, sp, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov13_022262F8
	adds r0, r5, #0
	add r1, sp, #0
	bl ov13_02226370
	add sp, #0x58
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov13_02226C94

	thumb_func_start ov13_02226CBC
ov13_02226CBC: @ 0x02226CBC
	push {r3, lr}
	blx FUN_020D34B0
	lsrs r2, r0, #0x1a
	lsls r1, r1, #6
	orrs r1, r2
	ldr r2, _02226CD4 @ =0x000082EA
	lsls r0, r0, #6
	movs r3, #0
	blx FUN_020F2900
	pop {r3, pc}
	.align 2, 0
_02226CD4: .4byte 0x000082EA
	thumb_func_end ov13_02226CBC

	thumb_func_start ov13_02226CD8
ov13_02226CD8: @ 0x02226CD8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	muls r4, r1, r4
	ldr r1, _02226CF8 @ =0x0224DF30
	adds r0, r4, #0
	ldr r1, [r1, #4]
	blx r1
	adds r5, r0, #0
	beq _02226CF2
	movs r1, #0
	adds r2, r4, #0
	blx FUN_020E5B44
_02226CF2:
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	nop
_02226CF8: .4byte 0x0224DF30
	thumb_func_end ov13_02226CD8

	thumb_func_start ov13_02226CFC
ov13_02226CFC: @ 0x02226CFC
	push {r3, lr}
	ldr r1, _02226D08 @ =0x0224DF30
	ldr r1, [r1, #0xc]
	blx r1
	pop {r3, pc}
	nop
_02226D08: .4byte 0x0224DF30
	thumb_func_end ov13_02226CFC

	thumb_func_start ov13_02226D0C
ov13_02226D0C: @ 0x02226D0C
	push {r4, r5}
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r1, #0xf0
	ands r1, r3
	asrs r5, r1, #4
	movs r1, #0xf
	adds r2, r0, #0
	movs r4, #0
	ands r1, r3
_02226D20:
	cmp r5, #9
	bgt _02226D28
	adds r5, #0x30
	b _02226D2A
_02226D28:
	adds r5, #0x37
_02226D2A:
	adds r4, r4, #1
	strb r5, [r2]
	adds r2, r2, #1
	adds r5, r1, #0
	cmp r4, #2
	blt _02226D20
	movs r1, #0
	strb r1, [r2]
	subs r0, r2, r0
	pop {r4, r5}
	bx lr
	thumb_func_end ov13_02226D0C

	thumb_func_start ov13_02226D40
ov13_02226D40: @ 0x02226D40
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	adds r6, r1, #0
	adds r4, r0, #0
	movs r5, #0
	movs r7, #0x3a
_02226D4C:
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r0, r4, #0
	adds r6, r6, #1
	bl ov13_02226D0C
	adds r0, r4, r0
	adds r4, r0, #0
	cmp r5, #5
	bge _02226D64
	adds r4, r0, #1
	strb r7, [r0]
_02226D64:
	adds r5, r5, #1
	cmp r5, #6
	blt _02226D4C
	movs r0, #0
	strb r0, [r4]
	ldr r0, [sp]
	subs r0, r4, r0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov13_02226D40

	thumb_func_start ov13_02226D74
ov13_02226D74: @ 0x02226D74
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _02226E44 @ =0x0224DF30
	ldr r0, [r0, #0x38]
	cmp r0, #1
	blt _02226D8E
	cmp r0, #5
	bgt _02226D8E
	movs r0, #9
	add sp, #8
	mvns r0, r0
	pop {r4, r5, r6, pc}
_02226D8E:
	ldr r5, _02226E48 @ =0x02245A58
	ldr r0, _02226E44 @ =0x0224DF30
	movs r6, #7
	str r1, [r5, #0x10]
	str r6, [r0, #0x38]
	str r2, [r0, #0x7c]
	ldr r2, [sp, #0x18]
	str r3, [r0, #4]
	str r2, [r0, #0xc]
	ldr r0, [sp, #0x1c]
	str r0, [r5, #8]
	adds r0, r1, #0
	bl ov13_02223EE0
	movs r2, #1
	ldr r1, _02226E44 @ =0x0224DF30
	cmp r0, #0
	str r2, [r1, #0x74]
	bge _02226DBA
	str r0, [r1, #0x78]
	add sp, #8
	pop {r4, r5, r6, pc}
_02226DBA:
	adds r0, r5, #0
	ldr r0, [r0, #8]
	ldr r1, [r1, #4]
	blx r1
	ldr r1, _02226E44 @ =0x0224DF30
	cmp r0, #0
	str r0, [r1, #0x30]
	bne _02226DD4
	adds r0, r6, #0
	subs r0, #8
	str r0, [r1, #0x78]
	add sp, #8
	pop {r4, r5, r6, pc}
_02226DD4:
	blx FUN_020D1AC4
	cmp r0, #1
	beq _02226DE8
	adds r0, r6, #0
	ldr r1, _02226E44 @ =0x0224DF30
	subs r0, #0x10
	str r0, [r1, #0x78]
	add sp, #8
	pop {r4, r5, r6, pc}
_02226DE8:
	adds r0, r5, #0
	ldr r3, [r0, #8]
	ldr r0, _02226E4C @ =0x0224DFDC
	str r3, [sp]
	str r4, [sp, #4]
	ldr r4, _02226E44 @ =0x0224DF30
	ldr r1, _02226E50 @ =ov13_02225320
	ldr r5, [r4, #0x30]
	movs r4, #7
	bics r3, r4
	movs r2, #0
	adds r3, r5, r3
	blx FUN_020D1AD4
	ldr r0, _02226E44 @ =0x0224DF30
	movs r1, #1
	str r1, [r0, #0x38]
	bl ov13_02226CBC
	ldr r1, _02226E54 @ =0x0000EA60
	ldr r5, _02226E58 @ =0x0224E09C
	adds r1, r0, r1
	ldr r0, _02226E48 @ =0x02245A58
	adds r4, r6, #0
	str r1, [r0, #0xc]
	movs r0, #0
	ldr r1, _02226E44 @ =0x0224DF30
	adds r2, r0, #0
	str r0, [r1, #0x10]
	adds r1, r0, #0
	adds r3, r0, #0
_02226E26:
	stm r5!, {r0, r1, r2, r3}
	stm r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _02226E26
	stm r5!, {r0, r1}
	bl ov13_02226F3C
	ldr r0, _02226E4C @ =0x0224DFDC
	blx FUN_020D1F34
	ldr r1, _02226E44 @ =0x0224DF30
	movs r0, #1
	str r0, [r1, #0x64]
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_02226E44: .4byte 0x0224DF30
_02226E48: .4byte 0x02245A58
_02226E4C: .4byte 0x0224DFDC
_02226E50: .4byte ov13_02225320
_02226E54: .4byte 0x0000EA60
_02226E58: .4byte 0x0224E09C
	thumb_func_end ov13_02226D74

	thumb_func_start ov13_02226E5C
ov13_02226E5C: @ 0x02226E5C
	push {r4, r5, r6, lr}
	ldr r4, _02226EE8 @ =0x0224DF30
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq _02226ECC
	ldr r6, [r4, #0x38]
	movs r0, #1
	str r0, [r4, #0x10]
	movs r5, #0x64
	b _02226E76
_02226E70:
	adds r0, r5, #0
	blx FUN_020D2108
_02226E76:
	ldr r0, [r4, #0x38]
	cmp r0, #1
	blt _02226E80
	cmp r0, #5
	ble _02226E70
_02226E80:
	movs r0, #0x7d
	lsls r0, r0, #2
	blx FUN_020D2108
	ldr r0, _02226EEC @ =0x0224DFDC
	blx FUN_020D1E68
	cmp r0, #0
	bne _02226EAA
	ldr r4, _02226EEC @ =0x0224DFDC
_02226E94:
	adds r0, r4, #0
	blx FUN_020D1F34
	adds r0, r4, #0
	blx FUN_020D1E38
	adds r0, r4, #0
	blx FUN_020D1E68
	cmp r0, #0
	beq _02226E94
_02226EAA:
	ldr r1, _02226EE8 @ =0x0224DF30
	ldr r0, [r1, #0x30]
	cmp r0, #0
	beq _02226EBC
	ldr r1, [r1, #0xc]
	blx r1
	ldr r0, _02226EE8 @ =0x0224DF30
	movs r1, #0
	str r1, [r0, #0x30]
_02226EBC:
	ldr r0, _02226EE8 @ =0x0224DF30
	movs r1, #0
	str r1, [r0, #0x64]
	ldr r0, [r0, #0x38]
	cmp r6, r0
	beq _02226ECC
	bl ov13_02226F3C
_02226ECC:
	ldr r0, _02226EE8 @ =0x0224DF30
	ldr r0, [r0, #0x74]
	cmp r0, #0
	ble _02226EE0
	bl ov13_02223F84
	ldr r1, _02226EE8 @ =0x0224DF30
	movs r2, #0
	str r2, [r1, #0x74]
	pop {r4, r5, r6, pc}
_02226EE0:
	movs r0, #9
	mvns r0, r0
	pop {r4, r5, r6, pc}
	nop
_02226EE8: .4byte 0x0224DF30
_02226EEC: .4byte 0x0224DFDC
	thumb_func_end ov13_02226E5C

	thumb_func_start ov13_02226EF0
ov13_02226EF0: @ 0x02226EF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02226F20 @ =0x0224DF30
	ldr r0, [r0, #0x38]
	str r0, [r4]
	ldr r0, _02226F24 @ =0x02245A58
	ldr r1, [r0, #0xc]
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	bne _02226F08
	b _02226F12
_02226F08:
	bl ov13_02226CBC
	ldr r1, _02226F24 @ =0x02245A58
	ldr r1, [r1, #0xc]
	subs r0, r1, r0
_02226F12:
	str r0, [r4, #4]
	ldr r0, _02226F20 @ =0x0224DF30
	ldr r0, [r0, #0x78]
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
	nop
_02226F20: .4byte 0x0224DF30
_02226F24: .4byte 0x02245A58
	thumb_func_end ov13_02226EF0

	thumb_func_start ov13_02226F28
ov13_02226F28: @ 0x02226F28
	push {r3, lr}
	ldr r1, _02226F38 @ =0x0224E09C
	movs r2, #0xe8
	blx FUN_020E5AD8
	movs r0, #1
	pop {r3, pc}
	nop
_02226F38: .4byte 0x0224E09C
	thumb_func_end ov13_02226F28

	thumb_func_start ov13_02226F3C
ov13_02226F3C: @ 0x02226F3C
	push {lr}
	sub sp, #0xc
	add r0, sp, #0
	bl ov13_02226EF0
	ldr r1, _02226F54 @ =0x0224DF30
	add r0, sp, #0
	ldr r1, [r1, #0x7c]
	blx r1
	add sp, #0xc
	pop {pc}
	nop
_02226F54: .4byte 0x0224DF30
	thumb_func_end ov13_02226F3C

	.rodata

_0224267C:
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x06, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02
	.byte 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20
	.byte 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x36
	.byte 0xF4, 0x51, 0x50, 0xA7, 0x41, 0x7E, 0x53, 0x65, 0x17, 0x1A, 0xC3, 0xA4, 0x27, 0x3A, 0x96, 0x5E
	.byte 0xAB, 0x3B, 0xCB, 0x6B, 0x9D, 0x1F, 0xF1, 0x45, 0xFA, 0xAC, 0xAB, 0x58, 0xE3, 0x4B, 0x93, 0x03
	.byte 0x30, 0x20, 0x55, 0xFA, 0x76, 0xAD, 0xF6, 0x6D, 0xCC, 0x88, 0x91, 0x76, 0x02, 0xF5, 0x25, 0x4C
	.byte 0xE5, 0x4F, 0xFC, 0xD7, 0x2A, 0xC5, 0xD7, 0xCB, 0x35, 0x26, 0x80, 0x44, 0x62, 0xB5, 0x8F, 0xA3
	.byte 0xB1, 0xDE, 0x49, 0x5A, 0xBA, 0x25, 0x67, 0x1B, 0xEA, 0x45, 0x98, 0x0E, 0xFE, 0x5D, 0xE1, 0xC0
	.byte 0x2F, 0xC3, 0x02, 0x75, 0x4C, 0x81, 0x12, 0xF0, 0x46, 0x8D, 0xA3, 0x97, 0xD3, 0x6B, 0xC6, 0xF9
	.byte 0x8F, 0x03, 0xE7, 0x5F, 0x92, 0x15, 0x95, 0x9C, 0x6D, 0xBF, 0xEB, 0x7A, 0x52, 0x95, 0xDA, 0x59
	.byte 0xBE, 0xD4, 0x2D, 0x83, 0x74, 0x58, 0xD3, 0x21, 0xE0, 0x49, 0x29, 0x69, 0xC9, 0x8E, 0x44, 0xC8
	.byte 0xC2, 0x75, 0x6A, 0x89, 0x8E, 0xF4, 0x78, 0x79, 0x58, 0x99, 0x6B, 0x3E, 0xB9, 0x27, 0xDD, 0x71
	.byte 0xE1, 0xBE, 0xB6, 0x4F, 0x88, 0xF0, 0x17, 0xAD, 0x20, 0xC9, 0x66, 0xAC, 0xCE, 0x7D, 0xB4, 0x3A
	.byte 0xDF, 0x63, 0x18, 0x4A, 0x1A, 0xE5, 0x82, 0x31, 0x51, 0x97, 0x60, 0x33, 0x53, 0x62, 0x45, 0x7F
	.byte 0x64, 0xB1, 0xE0, 0x77, 0x6B, 0xBB, 0x84, 0xAE, 0x81, 0xFE, 0x1C, 0xA0, 0x08, 0xF9, 0x94, 0x2B
	.byte 0x48, 0x70, 0x58, 0x68, 0x45, 0x8F, 0x19, 0xFD, 0xDE, 0x94, 0x87, 0x6C, 0x7B, 0x52, 0xB7, 0xF8
	.byte 0x73, 0xAB, 0x23, 0xD3, 0x4B, 0x72, 0xE2, 0x02, 0x1F, 0xE3, 0x57, 0x8F, 0x55, 0x66, 0x2A, 0xAB
	.byte 0xEB, 0xB2, 0x07, 0x28, 0xB5, 0x2F, 0x03, 0xC2, 0xC5, 0x86, 0x9A, 0x7B, 0x37, 0xD3, 0xA5, 0x08
	.byte 0x28, 0x30, 0xF2, 0x87, 0xBF, 0x23, 0xB2, 0xA5, 0x03, 0x02, 0xBA, 0x6A, 0x16, 0xED, 0x5C, 0x82
	.byte 0xCF, 0x8A, 0x2B, 0x1C, 0x79, 0xA7, 0x92, 0xB4, 0x07, 0xF3, 0xF0, 0xF2, 0x69, 0x4E, 0xA1, 0xE2
	.byte 0xDA, 0x65, 0xCD, 0xF4, 0x05, 0x06, 0xD5, 0xBE, 0x34, 0xD1, 0x1F, 0x62, 0xA6, 0xC4, 0x8A, 0xFE
	.byte 0x2E, 0x34, 0x9D, 0x53, 0xF3, 0xA2, 0xA0, 0x55, 0x8A, 0x05, 0x32, 0xE1, 0xF6, 0xA4, 0x75, 0xEB
	.byte 0x83, 0x0B, 0x39, 0xEC, 0x60, 0x40, 0xAA, 0xEF, 0x71, 0x5E, 0x06, 0x9F, 0x6E, 0xBD, 0x51, 0x10
	.byte 0x21, 0x3E, 0xF9, 0x8A, 0xDD, 0x96, 0x3D, 0x06, 0x3E, 0xDD, 0xAE, 0x05, 0xE6, 0x4D, 0x46, 0xBD
	.byte 0x54, 0x91, 0xB5, 0x8D, 0xC4, 0x71, 0x05, 0x5D, 0x06, 0x04, 0x6F, 0xD4, 0x50, 0x60, 0xFF, 0x15
	.byte 0x98, 0x19, 0x24, 0xFB, 0xBD, 0xD6, 0x97, 0xE9, 0x40, 0x89, 0xCC, 0x43, 0xD9, 0x67, 0x77, 0x9E
	.byte 0xE8, 0xB0, 0xBD, 0x42, 0x89, 0x07, 0x88, 0x8B, 0x19, 0xE7, 0x38, 0x5B, 0xC8, 0x79, 0xDB, 0xEE
	.byte 0x7C, 0xA1, 0x47, 0x0A, 0x42, 0x7C, 0xE9, 0x0F, 0x84, 0xF8, 0xC9, 0x1E, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x09, 0x83, 0x86, 0x2B, 0x32, 0x48, 0xED, 0x11, 0x1E, 0xAC, 0x70, 0x5A, 0x6C, 0x4E, 0x72
	.byte 0x0E, 0xFD, 0xFB, 0xFF, 0x85, 0x0F, 0x56, 0x38, 0xAE, 0x3D, 0x1E, 0xD5, 0x2D, 0x36, 0x27, 0x39
	.byte 0x0F, 0x0A, 0x64, 0xD9, 0x5C, 0x68, 0x21, 0xA6, 0x5B, 0x9B, 0xD1, 0x54, 0x36, 0x24, 0x3A, 0x2E
	.byte 0x0A, 0x0C, 0xB1, 0x67, 0x57, 0x93, 0x0F, 0xE7, 0xEE, 0xB4, 0xD2, 0x96, 0x9B, 0x1B, 0x9E, 0x91
	.byte 0xC0, 0x80, 0x4F, 0xC5, 0xDC, 0x61, 0xA2, 0x20, 0x77, 0x5A, 0x69, 0x4B, 0x12, 0x1C, 0x16, 0x1A
	.byte 0x93, 0xE2, 0x0A, 0xBA, 0xA0, 0xC0, 0xE5, 0x2A, 0x22, 0x3C, 0x43, 0xE0, 0x1B, 0x12, 0x1D, 0x17
	.byte 0x09, 0x0E, 0x0B, 0x0D, 0x8B, 0xF2, 0xAD, 0xC7, 0xB6, 0x2D, 0xB9, 0xA8, 0x1E, 0x14, 0xC8, 0xA9
	.byte 0xF1, 0x57, 0x85, 0x19, 0x75, 0xAF, 0x4C, 0x07, 0x99, 0xEE, 0xBB, 0xDD, 0x7F, 0xA3, 0xFD, 0x60
	.byte 0x01, 0xF7, 0x9F, 0x26, 0x72, 0x5C, 0xBC, 0xF5, 0x66, 0x44, 0xC5, 0x3B, 0xFB, 0x5B, 0x34, 0x7E
	.byte 0x43, 0x8B, 0x76, 0x29, 0x23, 0xCB, 0xDC, 0xC6, 0xED, 0xB6, 0x68, 0xFC, 0xE4, 0xB8, 0x63, 0xF1
	.byte 0x31, 0xD7, 0xCA, 0xDC, 0x63, 0x42, 0x10, 0x85, 0x97, 0x13, 0x40, 0x22, 0xC6, 0x84, 0x20, 0x11
	.byte 0x4A, 0x85, 0x7D, 0x24, 0xBB, 0xD2, 0xF8, 0x3D, 0xF9, 0xAE, 0x11, 0x32, 0x29, 0xC7, 0x6D, 0xA1
	.byte 0x9E, 0x1D, 0x4B, 0x2F, 0xB2, 0xDC, 0xF3, 0x30, 0x86, 0x0D, 0xEC, 0x52, 0xC1, 0x77, 0xD0, 0xE3
	.byte 0xB3, 0x2B, 0x6C, 0x16, 0x70, 0xA9, 0x99, 0xB9, 0x94, 0x11, 0xFA, 0x48, 0xE9, 0x47, 0x22, 0x64
	.byte 0xFC, 0xA8, 0xC4, 0x8C, 0xF0, 0xA0, 0x1A, 0x3F, 0x7D, 0x56, 0xD8, 0x2C, 0x33, 0x22, 0xEF, 0x90
	.byte 0x49, 0x87, 0xC7, 0x4E, 0x38, 0xD9, 0xC1, 0xD1, 0xCA, 0x8C, 0xFE, 0xA2, 0xD4, 0x98, 0x36, 0x0B
	.byte 0xF5, 0xA6, 0xCF, 0x81, 0x7A, 0xA5, 0x28, 0xDE, 0xB7, 0xDA, 0x26, 0x8E, 0xAD, 0x3F, 0xA4, 0xBF
	.byte 0x3A, 0x2C, 0xE4, 0x9D, 0x78, 0x50, 0x0D, 0x92, 0x5F, 0x6A, 0x9B, 0xCC, 0x7E, 0x54, 0x62, 0x46
	.byte 0x8D, 0xF6, 0xC2, 0x13, 0xD8, 0x90, 0xE8, 0xB8, 0x39, 0x2E, 0x5E, 0xF7, 0xC3, 0x82, 0xF5, 0xAF
	.byte 0x5D, 0x9F, 0xBE, 0x80, 0xD0, 0x69, 0x7C, 0x93, 0xD5, 0x6F, 0xA9, 0x2D, 0x25, 0xCF, 0xB3, 0x12
	.byte 0xAC, 0xC8, 0x3B, 0x99, 0x18, 0x10, 0xA7, 0x7D, 0x9C, 0xE8, 0x6E, 0x63, 0x3B, 0xDB, 0x7B, 0xBB
	.byte 0x26, 0xCD, 0x09, 0x78, 0x59, 0x6E, 0xF4, 0x18, 0x9A, 0xEC, 0x01, 0xB7, 0x4F, 0x83, 0xA8, 0x9A
	.byte 0x95, 0xE6, 0x65, 0x6E, 0xFF, 0xAA, 0x7E, 0xE6, 0xBC, 0x21, 0x08, 0xCF, 0x15, 0xEF, 0xE6, 0xE8
	.byte 0xE7, 0xBA, 0xD9, 0x9B, 0x6F, 0x4A, 0xCE, 0x36, 0x9F, 0xEA, 0xD4, 0x09, 0xB0, 0x29, 0xD6, 0x7C
	.byte 0xA4, 0x31, 0xAF, 0xB2, 0x3F, 0x2A, 0x31, 0x23, 0xA5, 0xC6, 0x30, 0x94, 0xA2, 0x35, 0xC0, 0x66
	.byte 0x4E, 0x74, 0x37, 0xBC, 0x82, 0xFC, 0xA6, 0xCA, 0x90, 0xE0, 0xB0, 0xD0, 0xA7, 0x33, 0x15, 0xD8
	.byte 0x04, 0xF1, 0x4A, 0x98, 0xEC, 0x41, 0xF7, 0xDA, 0xCD, 0x7F, 0x0E, 0x50, 0x91, 0x17, 0x2F, 0xF6
	.byte 0x4D, 0x76, 0x8D, 0xD6, 0xEF, 0x43, 0x4D, 0xB0, 0xAA, 0xCC, 0x54, 0x4D, 0x96, 0xE4, 0xDF, 0x04
	.byte 0xD1, 0x9E, 0xE3, 0xB5, 0x6A, 0x4C, 0x1B, 0x88, 0x2C, 0xC1, 0xB8, 0x1F, 0x65, 0x46, 0x7F, 0x51
	.byte 0x5E, 0x9D, 0x04, 0xEA, 0x8C, 0x01, 0x5D, 0x35, 0x87, 0xFA, 0x73, 0x74, 0x0B, 0xFB, 0x2E, 0x41
	.byte 0x67, 0xB3, 0x5A, 0x1D, 0xDB, 0x92, 0x52, 0xD2, 0x10, 0xE9, 0x33, 0x56, 0xD6, 0x6D, 0x13, 0x47
	.byte 0xD7, 0x9A, 0x8C, 0x61, 0xA1, 0x37, 0x7A, 0x0C, 0xF8, 0x59, 0x8E, 0x14, 0x13, 0xEB, 0x89, 0x3C
	.byte 0xA9, 0xCE, 0xEE, 0x27, 0x61, 0xB7, 0x35, 0xC9, 0x1C, 0xE1, 0xED, 0xE5, 0x47, 0x7A, 0x3C, 0xB1
	.byte 0xD2, 0x9C, 0x59, 0xDF, 0xF2, 0x55, 0x3F, 0x73, 0x14, 0x18, 0x79, 0xCE, 0xC7, 0x73, 0xBF, 0x37
	.byte 0xF7, 0x53, 0xEA, 0xCD, 0xFD, 0x5F, 0x5B, 0xAA, 0x3D, 0xDF, 0x14, 0x6F, 0x44, 0x78, 0x86, 0xDB
	.byte 0xAF, 0xCA, 0x81, 0xF3, 0x68, 0xB9, 0x3E, 0xC4, 0x24, 0x38, 0x2C, 0x34, 0xA3, 0xC2, 0x5F, 0x40
	.byte 0x1D, 0x16, 0x72, 0xC3, 0xE2, 0xBC, 0x0C, 0x25, 0x3C, 0x28, 0x8B, 0x49, 0x0D, 0xFF, 0x41, 0x95
	.byte 0xA8, 0x39, 0x71, 0x01, 0x0C, 0x08, 0xDE, 0xB3, 0xB4, 0xD8, 0x9C, 0xE4, 0x56, 0x64, 0x90, 0xC1
	.byte 0xCB, 0x7B, 0x61, 0x84, 0x32, 0xD5, 0x70, 0xB6, 0x6C, 0x48, 0x74, 0x5C, 0xB8, 0xD0, 0x42, 0x57
	.byte 0x51, 0x50, 0xA7, 0xF4, 0x7E, 0x53, 0x65, 0x41, 0x1A, 0xC3, 0xA4, 0x17, 0x3A, 0x96, 0x5E, 0x27
	.byte 0x3B, 0xCB, 0x6B, 0xAB, 0x1F, 0xF1, 0x45, 0x9D, 0xAC, 0xAB, 0x58, 0xFA, 0x4B, 0x93, 0x03, 0xE3
	.byte 0x20, 0x55, 0xFA, 0x30, 0xAD, 0xF6, 0x6D, 0x76, 0x88, 0x91, 0x76, 0xCC, 0xF5, 0x25, 0x4C, 0x02
	.byte 0x4F, 0xFC, 0xD7, 0xE5, 0xC5, 0xD7, 0xCB, 0x2A, 0x26, 0x80, 0x44, 0x35, 0xB5, 0x8F, 0xA3, 0x62
	.byte 0xDE, 0x49, 0x5A, 0xB1, 0x25, 0x67, 0x1B, 0xBA, 0x45, 0x98, 0x0E, 0xEA, 0x5D, 0xE1, 0xC0, 0xFE
	.byte 0xC3, 0x02, 0x75, 0x2F, 0x81, 0x12, 0xF0, 0x4C, 0x8D, 0xA3, 0x97, 0x46, 0x6B, 0xC6, 0xF9, 0xD3
	.byte 0x03, 0xE7, 0x5F, 0x8F, 0x15, 0x95, 0x9C, 0x92, 0xBF, 0xEB, 0x7A, 0x6D, 0x95, 0xDA, 0x59, 0x52
	.byte 0xD4, 0x2D, 0x83, 0xBE, 0x58, 0xD3, 0x21, 0x74, 0x49, 0x29, 0x69, 0xE0, 0x8E, 0x44, 0xC8, 0xC9
	.byte 0x75, 0x6A, 0x89, 0xC2, 0xF4, 0x78, 0x79, 0x8E, 0x99, 0x6B, 0x3E, 0x58, 0x27, 0xDD, 0x71, 0xB9
	.byte 0xBE, 0xB6, 0x4F, 0xE1, 0xF0, 0x17, 0xAD, 0x88, 0xC9, 0x66, 0xAC, 0x20, 0x7D, 0xB4, 0x3A, 0xCE
	.byte 0x63, 0x18, 0x4A, 0xDF, 0xE5, 0x82, 0x31, 0x1A, 0x97, 0x60, 0x33, 0x51, 0x62, 0x45, 0x7F, 0x53
	.byte 0xB1, 0xE0, 0x77, 0x64, 0xBB, 0x84, 0xAE, 0x6B, 0xFE, 0x1C, 0xA0, 0x81, 0xF9, 0x94, 0x2B, 0x08
	.byte 0x70, 0x58, 0x68, 0x48, 0x8F, 0x19, 0xFD, 0x45, 0x94, 0x87, 0x6C, 0xDE, 0x52, 0xB7, 0xF8, 0x7B
	.byte 0xAB, 0x23, 0xD3, 0x73, 0x72, 0xE2, 0x02, 0x4B, 0xE3, 0x57, 0x8F, 0x1F, 0x66, 0x2A, 0xAB, 0x55
	.byte 0xB2, 0x07, 0x28, 0xEB, 0x2F, 0x03, 0xC2, 0xB5, 0x86, 0x9A, 0x7B, 0xC5, 0xD3, 0xA5, 0x08, 0x37
	.byte 0x30, 0xF2, 0x87, 0x28, 0x23, 0xB2, 0xA5, 0xBF, 0x02, 0xBA, 0x6A, 0x03, 0xED, 0x5C, 0x82, 0x16
	.byte 0x8A, 0x2B, 0x1C, 0xCF, 0xA7, 0x92, 0xB4, 0x79, 0xF3, 0xF0, 0xF2, 0x07, 0x4E, 0xA1, 0xE2, 0x69
	.byte 0x65, 0xCD, 0xF4, 0xDA, 0x06, 0xD5, 0xBE, 0x05, 0xD1, 0x1F, 0x62, 0x34, 0xC4, 0x8A, 0xFE, 0xA6
	.byte 0x34, 0x9D, 0x53, 0x2E, 0xA2, 0xA0, 0x55, 0xF3, 0x05, 0x32, 0xE1, 0x8A, 0xA4, 0x75, 0xEB, 0xF6
	.byte 0x0B, 0x39, 0xEC, 0x83, 0x40, 0xAA, 0xEF, 0x60, 0x5E, 0x06, 0x9F, 0x71, 0xBD, 0x51, 0x10, 0x6E
	.byte 0x3E, 0xF9, 0x8A, 0x21, 0x96, 0x3D, 0x06, 0xDD, 0xDD, 0xAE, 0x05, 0x3E, 0x4D, 0x46, 0xBD, 0xE6
	.byte 0x91, 0xB5, 0x8D, 0x54, 0x71, 0x05, 0x5D, 0xC4, 0x04, 0x6F, 0xD4, 0x06, 0x60, 0xFF, 0x15, 0x50
	.byte 0x19, 0x24, 0xFB, 0x98, 0xD6, 0x97, 0xE9, 0xBD, 0x89, 0xCC, 0x43, 0x40, 0x67, 0x77, 0x9E, 0xD9
	.byte 0xB0, 0xBD, 0x42, 0xE8, 0x07, 0x88, 0x8B, 0x89, 0xE7, 0x38, 0x5B, 0x19, 0x79, 0xDB, 0xEE, 0xC8
	.byte 0xA1, 0x47, 0x0A, 0x7C, 0x7C, 0xE9, 0x0F, 0x42, 0xF8, 0xC9, 0x1E, 0x84, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x83, 0x86, 0x80, 0x32, 0x48, 0xED, 0x2B, 0x1E, 0xAC, 0x70, 0x11, 0x6C, 0x4E, 0x72, 0x5A
	.byte 0xFD, 0xFB, 0xFF, 0x0E, 0x0F, 0x56, 0x38, 0x85, 0x3D, 0x1E, 0xD5, 0xAE, 0x36, 0x27, 0x39, 0x2D
	.byte 0x0A, 0x64, 0xD9, 0x0F, 0x68, 0x21, 0xA6, 0x5C, 0x9B, 0xD1, 0x54, 0x5B, 0x24, 0x3A, 0x2E, 0x36
	.byte 0x0C, 0xB1, 0x67, 0x0A, 0x93, 0x0F, 0xE7, 0x57, 0xB4, 0xD2, 0x96, 0xEE, 0x1B, 0x9E, 0x91, 0x9B
	.byte 0x80, 0x4F, 0xC5, 0xC0, 0x61, 0xA2, 0x20, 0xDC, 0x5A, 0x69, 0x4B, 0x77, 0x1C, 0x16, 0x1A, 0x12
	.byte 0xE2, 0x0A, 0xBA, 0x93, 0xC0, 0xE5, 0x2A, 0xA0, 0x3C, 0x43, 0xE0, 0x22, 0x12, 0x1D, 0x17, 0x1B
	.byte 0x0E, 0x0B, 0x0D, 0x09, 0xF2, 0xAD, 0xC7, 0x8B, 0x2D, 0xB9, 0xA8, 0xB6, 0x14, 0xC8, 0xA9, 0x1E
	.byte 0x57, 0x85, 0x19, 0xF1, 0xAF, 0x4C, 0x07, 0x75, 0xEE, 0xBB, 0xDD, 0x99, 0xA3, 0xFD, 0x60, 0x7F
	.byte 0xF7, 0x9F, 0x26, 0x01, 0x5C, 0xBC, 0xF5, 0x72, 0x44, 0xC5, 0x3B, 0x66, 0x5B, 0x34, 0x7E, 0xFB
	.byte 0x8B, 0x76, 0x29, 0x43, 0xCB, 0xDC, 0xC6, 0x23, 0xB6, 0x68, 0xFC, 0xED, 0xB8, 0x63, 0xF1, 0xE4
	.byte 0xD7, 0xCA, 0xDC, 0x31, 0x42, 0x10, 0x85, 0x63, 0x13, 0x40, 0x22, 0x97, 0x84, 0x20, 0x11, 0xC6
	.byte 0x85, 0x7D, 0x24, 0x4A, 0xD2, 0xF8, 0x3D, 0xBB, 0xAE, 0x11, 0x32, 0xF9, 0xC7, 0x6D, 0xA1, 0x29
	.byte 0x1D, 0x4B, 0x2F, 0x9E, 0xDC, 0xF3, 0x30, 0xB2, 0x0D, 0xEC, 0x52, 0x86, 0x77, 0xD0, 0xE3, 0xC1
	.byte 0x2B, 0x6C, 0x16, 0xB3, 0xA9, 0x99, 0xB9, 0x70, 0x11, 0xFA, 0x48, 0x94, 0x47, 0x22, 0x64, 0xE9
	.byte 0xA8, 0xC4, 0x8C, 0xFC, 0xA0, 0x1A, 0x3F, 0xF0, 0x56, 0xD8, 0x2C, 0x7D, 0x22, 0xEF, 0x90, 0x33
	.byte 0x87, 0xC7, 0x4E, 0x49, 0xD9, 0xC1, 0xD1, 0x38, 0x8C, 0xFE, 0xA2, 0xCA, 0x98, 0x36, 0x0B, 0xD4
	.byte 0xA6, 0xCF, 0x81, 0xF5, 0xA5, 0x28, 0xDE, 0x7A, 0xDA, 0x26, 0x8E, 0xB7, 0x3F, 0xA4, 0xBF, 0xAD
	.byte 0x2C, 0xE4, 0x9D, 0x3A, 0x50, 0x0D, 0x92, 0x78, 0x6A, 0x9B, 0xCC, 0x5F, 0x54, 0x62, 0x46, 0x7E
	.byte 0xF6, 0xC2, 0x13, 0x8D, 0x90, 0xE8, 0xB8, 0xD8, 0x2E, 0x5E, 0xF7, 0x39, 0x82, 0xF5, 0xAF, 0xC3
	.byte 0x9F, 0xBE, 0x80, 0x5D, 0x69, 0x7C, 0x93, 0xD0, 0x6F, 0xA9, 0x2D, 0xD5, 0xCF, 0xB3, 0x12, 0x25
	.byte 0xC8, 0x3B, 0x99, 0xAC, 0x10, 0xA7, 0x7D, 0x18, 0xE8, 0x6E, 0x63, 0x9C, 0xDB, 0x7B, 0xBB, 0x3B
	.byte 0xCD, 0x09, 0x78, 0x26, 0x6E, 0xF4, 0x18, 0x59, 0xEC, 0x01, 0xB7, 0x9A, 0x83, 0xA8, 0x9A, 0x4F
	.byte 0xE6, 0x65, 0x6E, 0x95, 0xAA, 0x7E, 0xE6, 0xFF, 0x21, 0x08, 0xCF, 0xBC, 0xEF, 0xE6, 0xE8, 0x15
	.byte 0xBA, 0xD9, 0x9B, 0xE7, 0x4A, 0xCE, 0x36, 0x6F, 0xEA, 0xD4, 0x09, 0x9F, 0x29, 0xD6, 0x7C, 0xB0
	.byte 0x31, 0xAF, 0xB2, 0xA4, 0x2A, 0x31, 0x23, 0x3F, 0xC6, 0x30, 0x94, 0xA5, 0x35, 0xC0, 0x66, 0xA2
	.byte 0x74, 0x37, 0xBC, 0x4E, 0xFC, 0xA6, 0xCA, 0x82, 0xE0, 0xB0, 0xD0, 0x90, 0x33, 0x15, 0xD8, 0xA7
	.byte 0xF1, 0x4A, 0x98, 0x04, 0x41, 0xF7, 0xDA, 0xEC, 0x7F, 0x0E, 0x50, 0xCD, 0x17, 0x2F, 0xF6, 0x91
	.byte 0x76, 0x8D, 0xD6, 0x4D, 0x43, 0x4D, 0xB0, 0xEF, 0xCC, 0x54, 0x4D, 0xAA, 0xE4, 0xDF, 0x04, 0x96
	.byte 0x9E, 0xE3, 0xB5, 0xD1, 0x4C, 0x1B, 0x88, 0x6A, 0xC1, 0xB8, 0x1F, 0x2C, 0x46, 0x7F, 0x51, 0x65
	.byte 0x9D, 0x04, 0xEA, 0x5E, 0x01, 0x5D, 0x35, 0x8C, 0xFA, 0x73, 0x74, 0x87, 0xFB, 0x2E, 0x41, 0x0B
	.byte 0xB3, 0x5A, 0x1D, 0x67, 0x92, 0x52, 0xD2, 0xDB, 0xE9, 0x33, 0x56, 0x10, 0x6D, 0x13, 0x47, 0xD6
	.byte 0x9A, 0x8C, 0x61, 0xD7, 0x37, 0x7A, 0x0C, 0xA1, 0x59, 0x8E, 0x14, 0xF8, 0xEB, 0x89, 0x3C, 0x13
	.byte 0xCE, 0xEE, 0x27, 0xA9, 0xB7, 0x35, 0xC9, 0x61, 0xE1, 0xED, 0xE5, 0x1C, 0x7A, 0x3C, 0xB1, 0x47
	.byte 0x9C, 0x59, 0xDF, 0xD2, 0x55, 0x3F, 0x73, 0xF2, 0x18, 0x79, 0xCE, 0x14, 0x73, 0xBF, 0x37, 0xC7
	.byte 0x53, 0xEA, 0xCD, 0xF7, 0x5F, 0x5B, 0xAA, 0xFD, 0xDF, 0x14, 0x6F, 0x3D, 0x78, 0x86, 0xDB, 0x44
	.byte 0xCA, 0x81, 0xF3, 0xAF, 0xB9, 0x3E, 0xC4, 0x68, 0x38, 0x2C, 0x34, 0x24, 0xC2, 0x5F, 0x40, 0xA3
	.byte 0x16, 0x72, 0xC3, 0x1D, 0xBC, 0x0C, 0x25, 0xE2, 0x28, 0x8B, 0x49, 0x3C, 0xFF, 0x41, 0x95, 0x0D
	.byte 0x39, 0x71, 0x01, 0xA8, 0x08, 0xDE, 0xB3, 0x0C, 0xD8, 0x9C, 0xE4, 0xB4, 0x64, 0x90, 0xC1, 0x56
	.byte 0x7B, 0x61, 0x84, 0xCB, 0xD5, 0x70, 0xB6, 0x32, 0x48, 0x74, 0x5C, 0x6C, 0xD0, 0x42, 0x57, 0xB8
	.byte 0x52, 0x52, 0x52, 0x52, 0x09, 0x09, 0x09, 0x09, 0x6A, 0x6A, 0x6A, 0x6A, 0xD5, 0xD5, 0xD5, 0xD5
	.byte 0x30, 0x30, 0x30, 0x30, 0x36, 0x36, 0x36, 0x36, 0xA5, 0xA5, 0xA5, 0xA5, 0x38, 0x38, 0x38, 0x38
	.byte 0xBF, 0xBF, 0xBF, 0xBF, 0x40, 0x40, 0x40, 0x40, 0xA3, 0xA3, 0xA3, 0xA3, 0x9E, 0x9E, 0x9E, 0x9E
	.byte 0x81, 0x81, 0x81, 0x81, 0xF3, 0xF3, 0xF3, 0xF3, 0xD7, 0xD7, 0xD7, 0xD7, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x7C, 0x7C, 0x7C, 0x7C, 0xE3, 0xE3, 0xE3, 0xE3, 0x39, 0x39, 0x39, 0x39, 0x82, 0x82, 0x82, 0x82
	.byte 0x9B, 0x9B, 0x9B, 0x9B, 0x2F, 0x2F, 0x2F, 0x2F, 0xFF, 0xFF, 0xFF, 0xFF, 0x87, 0x87, 0x87, 0x87
	.byte 0x34, 0x34, 0x34, 0x34, 0x8E, 0x8E, 0x8E, 0x8E, 0x43, 0x43, 0x43, 0x43, 0x44, 0x44, 0x44, 0x44
	.byte 0xC4, 0xC4, 0xC4, 0xC4, 0xDE, 0xDE, 0xDE, 0xDE, 0xE9, 0xE9, 0xE9, 0xE9, 0xCB, 0xCB, 0xCB, 0xCB
	.byte 0x54, 0x54, 0x54, 0x54, 0x7B, 0x7B, 0x7B, 0x7B, 0x94, 0x94, 0x94, 0x94, 0x32, 0x32, 0x32, 0x32
	.byte 0xA6, 0xA6, 0xA6, 0xA6, 0xC2, 0xC2, 0xC2, 0xC2, 0x23, 0x23, 0x23, 0x23, 0x3D, 0x3D, 0x3D, 0x3D
	.byte 0xEE, 0xEE, 0xEE, 0xEE, 0x4C, 0x4C, 0x4C, 0x4C, 0x95, 0x95, 0x95, 0x95, 0x0B, 0x0B, 0x0B, 0x0B
	.byte 0x42, 0x42, 0x42, 0x42, 0xFA, 0xFA, 0xFA, 0xFA, 0xC3, 0xC3, 0xC3, 0xC3, 0x4E, 0x4E, 0x4E, 0x4E
	.byte 0x08, 0x08, 0x08, 0x08, 0x2E, 0x2E, 0x2E, 0x2E, 0xA1, 0xA1, 0xA1, 0xA1, 0x66, 0x66, 0x66, 0x66
	.byte 0x28, 0x28, 0x28, 0x28, 0xD9, 0xD9, 0xD9, 0xD9, 0x24, 0x24, 0x24, 0x24, 0xB2, 0xB2, 0xB2, 0xB2
	.byte 0x76, 0x76, 0x76, 0x76, 0x5B, 0x5B, 0x5B, 0x5B, 0xA2, 0xA2, 0xA2, 0xA2, 0x49, 0x49, 0x49, 0x49
	.byte 0x6D, 0x6D, 0x6D, 0x6D, 0x8B, 0x8B, 0x8B, 0x8B, 0xD1, 0xD1, 0xD1, 0xD1, 0x25, 0x25, 0x25, 0x25
	.byte 0x72, 0x72, 0x72, 0x72, 0xF8, 0xF8, 0xF8, 0xF8, 0xF6, 0xF6, 0xF6, 0xF6, 0x64, 0x64, 0x64, 0x64
	.byte 0x86, 0x86, 0x86, 0x86, 0x68, 0x68, 0x68, 0x68, 0x98, 0x98, 0x98, 0x98, 0x16, 0x16, 0x16, 0x16
	.byte 0xD4, 0xD4, 0xD4, 0xD4, 0xA4, 0xA4, 0xA4, 0xA4, 0x5C, 0x5C, 0x5C, 0x5C, 0xCC, 0xCC, 0xCC, 0xCC
	.byte 0x5D, 0x5D, 0x5D, 0x5D, 0x65, 0x65, 0x65, 0x65, 0xB6, 0xB6, 0xB6, 0xB6, 0x92, 0x92, 0x92, 0x92
	.byte 0x6C, 0x6C, 0x6C, 0x6C, 0x70, 0x70, 0x70, 0x70, 0x48, 0x48, 0x48, 0x48, 0x50, 0x50, 0x50, 0x50
	.byte 0xFD, 0xFD, 0xFD, 0xFD, 0xED, 0xED, 0xED, 0xED, 0xB9, 0xB9, 0xB9, 0xB9, 0xDA, 0xDA, 0xDA, 0xDA
	.byte 0x5E, 0x5E, 0x5E, 0x5E, 0x15, 0x15, 0x15, 0x15, 0x46, 0x46, 0x46, 0x46, 0x57, 0x57, 0x57, 0x57
	.byte 0xA7, 0xA7, 0xA7, 0xA7, 0x8D, 0x8D, 0x8D, 0x8D, 0x9D, 0x9D, 0x9D, 0x9D, 0x84, 0x84, 0x84, 0x84
	.byte 0x90, 0x90, 0x90, 0x90, 0xD8, 0xD8, 0xD8, 0xD8, 0xAB, 0xAB, 0xAB, 0xAB, 0x00, 0x00, 0x00, 0x00
	.byte 0x8C, 0x8C, 0x8C, 0x8C, 0xBC, 0xBC, 0xBC, 0xBC, 0xD3, 0xD3, 0xD3, 0xD3, 0x0A, 0x0A, 0x0A, 0x0A
	.byte 0xF7, 0xF7, 0xF7, 0xF7, 0xE4, 0xE4, 0xE4, 0xE4, 0x58, 0x58, 0x58, 0x58, 0x05, 0x05, 0x05, 0x05
	.byte 0xB8, 0xB8, 0xB8, 0xB8, 0xB3, 0xB3, 0xB3, 0xB3, 0x45, 0x45, 0x45, 0x45, 0x06, 0x06, 0x06, 0x06
	.byte 0xD0, 0xD0, 0xD0, 0xD0, 0x2C, 0x2C, 0x2C, 0x2C, 0x1E, 0x1E, 0x1E, 0x1E, 0x8F, 0x8F, 0x8F, 0x8F
	.byte 0xCA, 0xCA, 0xCA, 0xCA, 0x3F, 0x3F, 0x3F, 0x3F, 0x0F, 0x0F, 0x0F, 0x0F, 0x02, 0x02, 0x02, 0x02
	.byte 0xC1, 0xC1, 0xC1, 0xC1, 0xAF, 0xAF, 0xAF, 0xAF, 0xBD, 0xBD, 0xBD, 0xBD, 0x03, 0x03, 0x03, 0x03
	.byte 0x01, 0x01, 0x01, 0x01, 0x13, 0x13, 0x13, 0x13, 0x8A, 0x8A, 0x8A, 0x8A, 0x6B, 0x6B, 0x6B, 0x6B
	.byte 0x3A, 0x3A, 0x3A, 0x3A, 0x91, 0x91, 0x91, 0x91, 0x11, 0x11, 0x11, 0x11, 0x41, 0x41, 0x41, 0x41
	.byte 0x4F, 0x4F, 0x4F, 0x4F, 0x67, 0x67, 0x67, 0x67, 0xDC, 0xDC, 0xDC, 0xDC, 0xEA, 0xEA, 0xEA, 0xEA
	.byte 0x97, 0x97, 0x97, 0x97, 0xF2, 0xF2, 0xF2, 0xF2, 0xCF, 0xCF, 0xCF, 0xCF, 0xCE, 0xCE, 0xCE, 0xCE
	.byte 0xF0, 0xF0, 0xF0, 0xF0, 0xB4, 0xB4, 0xB4, 0xB4, 0xE6, 0xE6, 0xE6, 0xE6, 0x73, 0x73, 0x73, 0x73
	.byte 0x96, 0x96, 0x96, 0x96, 0xAC, 0xAC, 0xAC, 0xAC, 0x74, 0x74, 0x74, 0x74, 0x22, 0x22, 0x22, 0x22
	.byte 0xE7, 0xE7, 0xE7, 0xE7, 0xAD, 0xAD, 0xAD, 0xAD, 0x35, 0x35, 0x35, 0x35, 0x85, 0x85, 0x85, 0x85
	.byte 0xE2, 0xE2, 0xE2, 0xE2, 0xF9, 0xF9, 0xF9, 0xF9, 0x37, 0x37, 0x37, 0x37, 0xE8, 0xE8, 0xE8, 0xE8
	.byte 0x1C, 0x1C, 0x1C, 0x1C, 0x75, 0x75, 0x75, 0x75, 0xDF, 0xDF, 0xDF, 0xDF, 0x6E, 0x6E, 0x6E, 0x6E
	.byte 0x47, 0x47, 0x47, 0x47, 0xF1, 0xF1, 0xF1, 0xF1, 0x1A, 0x1A, 0x1A, 0x1A, 0x71, 0x71, 0x71, 0x71
	.byte 0x1D, 0x1D, 0x1D, 0x1D, 0x29, 0x29, 0x29, 0x29, 0xC5, 0xC5, 0xC5, 0xC5, 0x89, 0x89, 0x89, 0x89
	.byte 0x6F, 0x6F, 0x6F, 0x6F, 0xB7, 0xB7, 0xB7, 0xB7, 0x62, 0x62, 0x62, 0x62, 0x0E, 0x0E, 0x0E, 0x0E
	.byte 0xAA, 0xAA, 0xAA, 0xAA, 0x18, 0x18, 0x18, 0x18, 0xBE, 0xBE, 0xBE, 0xBE, 0x1B, 0x1B, 0x1B, 0x1B
	.byte 0xFC, 0xFC, 0xFC, 0xFC, 0x56, 0x56, 0x56, 0x56, 0x3E, 0x3E, 0x3E, 0x3E, 0x4B, 0x4B, 0x4B, 0x4B
	.byte 0xC6, 0xC6, 0xC6, 0xC6, 0xD2, 0xD2, 0xD2, 0xD2, 0x79, 0x79, 0x79, 0x79, 0x20, 0x20, 0x20, 0x20
	.byte 0x9A, 0x9A, 0x9A, 0x9A, 0xDB, 0xDB, 0xDB, 0xDB, 0xC0, 0xC0, 0xC0, 0xC0, 0xFE, 0xFE, 0xFE, 0xFE
	.byte 0x78, 0x78, 0x78, 0x78, 0xCD, 0xCD, 0xCD, 0xCD, 0x5A, 0x5A, 0x5A, 0x5A, 0xF4, 0xF4, 0xF4, 0xF4
	.byte 0x1F, 0x1F, 0x1F, 0x1F, 0xDD, 0xDD, 0xDD, 0xDD, 0xA8, 0xA8, 0xA8, 0xA8, 0x33, 0x33, 0x33, 0x33
	.byte 0x88, 0x88, 0x88, 0x88, 0x07, 0x07, 0x07, 0x07, 0xC7, 0xC7, 0xC7, 0xC7, 0x31, 0x31, 0x31, 0x31
	.byte 0xB1, 0xB1, 0xB1, 0xB1, 0x12, 0x12, 0x12, 0x12, 0x10, 0x10, 0x10, 0x10, 0x59, 0x59, 0x59, 0x59
	.byte 0x27, 0x27, 0x27, 0x27, 0x80, 0x80, 0x80, 0x80, 0xEC, 0xEC, 0xEC, 0xEC, 0x5F, 0x5F, 0x5F, 0x5F
	.byte 0x60, 0x60, 0x60, 0x60, 0x51, 0x51, 0x51, 0x51, 0x7F, 0x7F, 0x7F, 0x7F, 0xA9, 0xA9, 0xA9, 0xA9
	.byte 0x19, 0x19, 0x19, 0x19, 0xB5, 0xB5, 0xB5, 0xB5, 0x4A, 0x4A, 0x4A, 0x4A, 0x0D, 0x0D, 0x0D, 0x0D
	.byte 0x2D, 0x2D, 0x2D, 0x2D, 0xE5, 0xE5, 0xE5, 0xE5, 0x7A, 0x7A, 0x7A, 0x7A, 0x9F, 0x9F, 0x9F, 0x9F
	.byte 0x93, 0x93, 0x93, 0x93, 0xC9, 0xC9, 0xC9, 0xC9, 0x9C, 0x9C, 0x9C, 0x9C, 0xEF, 0xEF, 0xEF, 0xEF
	.byte 0xA0, 0xA0, 0xA0, 0xA0, 0xE0, 0xE0, 0xE0, 0xE0, 0x3B, 0x3B, 0x3B, 0x3B, 0x4D, 0x4D, 0x4D, 0x4D
	.byte 0xAE, 0xAE, 0xAE, 0xAE, 0x2A, 0x2A, 0x2A, 0x2A, 0xF5, 0xF5, 0xF5, 0xF5, 0xB0, 0xB0, 0xB0, 0xB0
	.byte 0xC8, 0xC8, 0xC8, 0xC8, 0xEB, 0xEB, 0xEB, 0xEB, 0xBB, 0xBB, 0xBB, 0xBB, 0x3C, 0x3C, 0x3C, 0x3C
	.byte 0x83, 0x83, 0x83, 0x83, 0x53, 0x53, 0x53, 0x53, 0x99, 0x99, 0x99, 0x99, 0x61, 0x61, 0x61, 0x61
	.byte 0x17, 0x17, 0x17, 0x17, 0x2B, 0x2B, 0x2B, 0x2B, 0x04, 0x04, 0x04, 0x04, 0x7E, 0x7E, 0x7E, 0x7E
	.byte 0xBA, 0xBA, 0xBA, 0xBA, 0x77, 0x77, 0x77, 0x77, 0xD6, 0xD6, 0xD6, 0xD6, 0x26, 0x26, 0x26, 0x26
	.byte 0xE1, 0xE1, 0xE1, 0xE1, 0x69, 0x69, 0x69, 0x69, 0x14, 0x14, 0x14, 0x14, 0x63, 0x63, 0x63, 0x63
	.byte 0x55, 0x55, 0x55, 0x55, 0x21, 0x21, 0x21, 0x21, 0x0C, 0x0C, 0x0C, 0x0C, 0x7D, 0x7D, 0x7D, 0x7D
	.byte 0xA5, 0x63, 0x63, 0xC6, 0x84, 0x7C, 0x7C, 0xF8, 0x99, 0x77, 0x77, 0xEE, 0x8D, 0x7B, 0x7B, 0xF6
	.byte 0x0D, 0xF2, 0xF2, 0xFF, 0xBD, 0x6B, 0x6B, 0xD6, 0xB1, 0x6F, 0x6F, 0xDE, 0x54, 0xC5, 0xC5, 0x91
	.byte 0x50, 0x30, 0x30, 0x60, 0x03, 0x01, 0x01, 0x02, 0xA9, 0x67, 0x67, 0xCE, 0x7D, 0x2B, 0x2B, 0x56
	.byte 0x19, 0xFE, 0xFE, 0xE7, 0x62, 0xD7, 0xD7, 0xB5, 0xE6, 0xAB, 0xAB, 0x4D, 0x9A, 0x76, 0x76, 0xEC
	.byte 0x45, 0xCA, 0xCA, 0x8F, 0x9D, 0x82, 0x82, 0x1F, 0x40, 0xC9, 0xC9, 0x89, 0x87, 0x7D, 0x7D, 0xFA
	.byte 0x15, 0xFA, 0xFA, 0xEF, 0xEB, 0x59, 0x59, 0xB2, 0xC9, 0x47, 0x47, 0x8E, 0x0B, 0xF0, 0xF0, 0xFB
	.byte 0xEC, 0xAD, 0xAD, 0x41, 0x67, 0xD4, 0xD4, 0xB3, 0xFD, 0xA2, 0xA2, 0x5F, 0xEA, 0xAF, 0xAF, 0x45
	.byte 0xBF, 0x9C, 0x9C, 0x23, 0xF7, 0xA4, 0xA4, 0x53, 0x96, 0x72, 0x72, 0xE4, 0x5B, 0xC0, 0xC0, 0x9B
	.byte 0xC2, 0xB7, 0xB7, 0x75, 0x1C, 0xFD, 0xFD, 0xE1, 0xAE, 0x93, 0x93, 0x3D, 0x6A, 0x26, 0x26, 0x4C
	.byte 0x5A, 0x36, 0x36, 0x6C, 0x41, 0x3F, 0x3F, 0x7E, 0x02, 0xF7, 0xF7, 0xF5, 0x4F, 0xCC, 0xCC, 0x83
	.byte 0x5C, 0x34, 0x34, 0x68, 0xF4, 0xA5, 0xA5, 0x51, 0x34, 0xE5, 0xE5, 0xD1, 0x08, 0xF1, 0xF1, 0xF9
	.byte 0x93, 0x71, 0x71, 0xE2, 0x73, 0xD8, 0xD8, 0xAB, 0x53, 0x31, 0x31, 0x62, 0x3F, 0x15, 0x15, 0x2A
	.byte 0x0C, 0x04, 0x04, 0x08, 0x52, 0xC7, 0xC7, 0x95, 0x65, 0x23, 0x23, 0x46, 0x5E, 0xC3, 0xC3, 0x9D
	.byte 0x28, 0x18, 0x18, 0x30, 0xA1, 0x96, 0x96, 0x37, 0x0F, 0x05, 0x05, 0x0A, 0xB5, 0x9A, 0x9A, 0x2F
	.byte 0x09, 0x07, 0x07, 0x0E, 0x36, 0x12, 0x12, 0x24, 0x9B, 0x80, 0x80, 0x1B, 0x3D, 0xE2, 0xE2, 0xDF
	.byte 0x26, 0xEB, 0xEB, 0xCD, 0x69, 0x27, 0x27, 0x4E, 0xCD, 0xB2, 0xB2, 0x7F, 0x9F, 0x75, 0x75, 0xEA
	.byte 0x1B, 0x09, 0x09, 0x12, 0x9E, 0x83, 0x83, 0x1D, 0x74, 0x2C, 0x2C, 0x58, 0x2E, 0x1A, 0x1A, 0x34
	.byte 0x2D, 0x1B, 0x1B, 0x36, 0xB2, 0x6E, 0x6E, 0xDC, 0xEE, 0x5A, 0x5A, 0xB4, 0xFB, 0xA0, 0xA0, 0x5B
	.byte 0xF6, 0x52, 0x52, 0xA4, 0x4D, 0x3B, 0x3B, 0x76, 0x61, 0xD6, 0xD6, 0xB7, 0xCE, 0xB3, 0xB3, 0x7D
	.byte 0x7B, 0x29, 0x29, 0x52, 0x3E, 0xE3, 0xE3, 0xDD, 0x71, 0x2F, 0x2F, 0x5E, 0x97, 0x84, 0x84, 0x13
	.byte 0xF5, 0x53, 0x53, 0xA6, 0x68, 0xD1, 0xD1, 0xB9, 0x00, 0x00, 0x00, 0x00, 0x2C, 0xED, 0xED, 0xC1
	.byte 0x60, 0x20, 0x20, 0x40, 0x1F, 0xFC, 0xFC, 0xE3, 0xC8, 0xB1, 0xB1, 0x79, 0xED, 0x5B, 0x5B, 0xB6
	.byte 0xBE, 0x6A, 0x6A, 0xD4, 0x46, 0xCB, 0xCB, 0x8D, 0xD9, 0xBE, 0xBE, 0x67, 0x4B, 0x39, 0x39, 0x72
	.byte 0xDE, 0x4A, 0x4A, 0x94, 0xD4, 0x4C, 0x4C, 0x98, 0xE8, 0x58, 0x58, 0xB0, 0x4A, 0xCF, 0xCF, 0x85
	.byte 0x6B, 0xD0, 0xD0, 0xBB, 0x2A, 0xEF, 0xEF, 0xC5, 0xE5, 0xAA, 0xAA, 0x4F, 0x16, 0xFB, 0xFB, 0xED
	.byte 0xC5, 0x43, 0x43, 0x86, 0xD7, 0x4D, 0x4D, 0x9A, 0x55, 0x33, 0x33, 0x66, 0x94, 0x85, 0x85, 0x11
	.byte 0xCF, 0x45, 0x45, 0x8A, 0x10, 0xF9, 0xF9, 0xE9, 0x06, 0x02, 0x02, 0x04, 0x81, 0x7F, 0x7F, 0xFE
	.byte 0xF0, 0x50, 0x50, 0xA0, 0x44, 0x3C, 0x3C, 0x78, 0xBA, 0x9F, 0x9F, 0x25, 0xE3, 0xA8, 0xA8, 0x4B
	.byte 0xF3, 0x51, 0x51, 0xA2, 0xFE, 0xA3, 0xA3, 0x5D, 0xC0, 0x40, 0x40, 0x80, 0x8A, 0x8F, 0x8F, 0x05
	.byte 0xAD, 0x92, 0x92, 0x3F, 0xBC, 0x9D, 0x9D, 0x21, 0x48, 0x38, 0x38, 0x70, 0x04, 0xF5, 0xF5, 0xF1
	.byte 0xDF, 0xBC, 0xBC, 0x63, 0xC1, 0xB6, 0xB6, 0x77, 0x75, 0xDA, 0xDA, 0xAF, 0x63, 0x21, 0x21, 0x42
	.byte 0x30, 0x10, 0x10, 0x20, 0x1A, 0xFF, 0xFF, 0xE5, 0x0E, 0xF3, 0xF3, 0xFD, 0x6D, 0xD2, 0xD2, 0xBF
	.byte 0x4C, 0xCD, 0xCD, 0x81, 0x14, 0x0C, 0x0C, 0x18, 0x35, 0x13, 0x13, 0x26, 0x2F, 0xEC, 0xEC, 0xC3
	.byte 0xE1, 0x5F, 0x5F, 0xBE, 0xA2, 0x97, 0x97, 0x35, 0xCC, 0x44, 0x44, 0x88, 0x39, 0x17, 0x17, 0x2E
	.byte 0x57, 0xC4, 0xC4, 0x93, 0xF2, 0xA7, 0xA7, 0x55, 0x82, 0x7E, 0x7E, 0xFC, 0x47, 0x3D, 0x3D, 0x7A
	.byte 0xAC, 0x64, 0x64, 0xC8, 0xE7, 0x5D, 0x5D, 0xBA, 0x2B, 0x19, 0x19, 0x32, 0x95, 0x73, 0x73, 0xE6
	.byte 0xA0, 0x60, 0x60, 0xC0, 0x98, 0x81, 0x81, 0x19, 0xD1, 0x4F, 0x4F, 0x9E, 0x7F, 0xDC, 0xDC, 0xA3
	.byte 0x66, 0x22, 0x22, 0x44, 0x7E, 0x2A, 0x2A, 0x54, 0xAB, 0x90, 0x90, 0x3B, 0x83, 0x88, 0x88, 0x0B
	.byte 0xCA, 0x46, 0x46, 0x8C, 0x29, 0xEE, 0xEE, 0xC7, 0xD3, 0xB8, 0xB8, 0x6B, 0x3C, 0x14, 0x14, 0x28
	.byte 0x79, 0xDE, 0xDE, 0xA7, 0xE2, 0x5E, 0x5E, 0xBC, 0x1D, 0x0B, 0x0B, 0x16, 0x76, 0xDB, 0xDB, 0xAD
	.byte 0x3B, 0xE0, 0xE0, 0xDB, 0x56, 0x32, 0x32, 0x64, 0x4E, 0x3A, 0x3A, 0x74, 0x1E, 0x0A, 0x0A, 0x14
	.byte 0xDB, 0x49, 0x49, 0x92, 0x0A, 0x06, 0x06, 0x0C, 0x6C, 0x24, 0x24, 0x48, 0xE4, 0x5C, 0x5C, 0xB8
	.byte 0x5D, 0xC2, 0xC2, 0x9F, 0x6E, 0xD3, 0xD3, 0xBD, 0xEF, 0xAC, 0xAC, 0x43, 0xA6, 0x62, 0x62, 0xC4
	.byte 0xA8, 0x91, 0x91, 0x39, 0xA4, 0x95, 0x95, 0x31, 0x37, 0xE4, 0xE4, 0xD3, 0x8B, 0x79, 0x79, 0xF2
	.byte 0x32, 0xE7, 0xE7, 0xD5, 0x43, 0xC8, 0xC8, 0x8B, 0x59, 0x37, 0x37, 0x6E, 0xB7, 0x6D, 0x6D, 0xDA
	.byte 0x8C, 0x8D, 0x8D, 0x01, 0x64, 0xD5, 0xD5, 0xB1, 0xD2, 0x4E, 0x4E, 0x9C, 0xE0, 0xA9, 0xA9, 0x49
	.byte 0xB4, 0x6C, 0x6C, 0xD8, 0xFA, 0x56, 0x56, 0xAC, 0x07, 0xF4, 0xF4, 0xF3, 0x25, 0xEA, 0xEA, 0xCF
	.byte 0xAF, 0x65, 0x65, 0xCA, 0x8E, 0x7A, 0x7A, 0xF4, 0xE9, 0xAE, 0xAE, 0x47, 0x18, 0x08, 0x08, 0x10
	.byte 0xD5, 0xBA, 0xBA, 0x6F, 0x88, 0x78, 0x78, 0xF0, 0x6F, 0x25, 0x25, 0x4A, 0x72, 0x2E, 0x2E, 0x5C
	.byte 0x24, 0x1C, 0x1C, 0x38, 0xF1, 0xA6, 0xA6, 0x57, 0xC7, 0xB4, 0xB4, 0x73, 0x51, 0xC6, 0xC6, 0x97
	.byte 0x23, 0xE8, 0xE8, 0xCB, 0x7C, 0xDD, 0xDD, 0xA1, 0x9C, 0x74, 0x74, 0xE8, 0x21, 0x1F, 0x1F, 0x3E
	.byte 0xDD, 0x4B, 0x4B, 0x96, 0xDC, 0xBD, 0xBD, 0x61, 0x86, 0x8B, 0x8B, 0x0D, 0x85, 0x8A, 0x8A, 0x0F
	.byte 0x90, 0x70, 0x70, 0xE0, 0x42, 0x3E, 0x3E, 0x7C, 0xC4, 0xB5, 0xB5, 0x71, 0xAA, 0x66, 0x66, 0xCC
	.byte 0xD8, 0x48, 0x48, 0x90, 0x05, 0x03, 0x03, 0x06, 0x01, 0xF6, 0xF6, 0xF7, 0x12, 0x0E, 0x0E, 0x1C
	.byte 0xA3, 0x61, 0x61, 0xC2, 0x5F, 0x35, 0x35, 0x6A, 0xF9, 0x57, 0x57, 0xAE, 0xD0, 0xB9, 0xB9, 0x69
	.byte 0x91, 0x86, 0x86, 0x17, 0x58, 0xC1, 0xC1, 0x99, 0x27, 0x1D, 0x1D, 0x3A, 0xB9, 0x9E, 0x9E, 0x27
	.byte 0x38, 0xE1, 0xE1, 0xD9, 0x13, 0xF8, 0xF8, 0xEB, 0xB3, 0x98, 0x98, 0x2B, 0x33, 0x11, 0x11, 0x22
	.byte 0xBB, 0x69, 0x69, 0xD2, 0x70, 0xD9, 0xD9, 0xA9, 0x89, 0x8E, 0x8E, 0x07, 0xA7, 0x94, 0x94, 0x33
	.byte 0xB6, 0x9B, 0x9B, 0x2D, 0x22, 0x1E, 0x1E, 0x3C, 0x92, 0x87, 0x87, 0x15, 0x20, 0xE9, 0xE9, 0xC9
	.byte 0x49, 0xCE, 0xCE, 0x87, 0xFF, 0x55, 0x55, 0xAA, 0x78, 0x28, 0x28, 0x50, 0x7A, 0xDF, 0xDF, 0xA5
	.byte 0x8F, 0x8C, 0x8C, 0x03, 0xF8, 0xA1, 0xA1, 0x59, 0x80, 0x89, 0x89, 0x09, 0x17, 0x0D, 0x0D, 0x1A
	.byte 0xDA, 0xBF, 0xBF, 0x65, 0x31, 0xE6, 0xE6, 0xD7, 0xC6, 0x42, 0x42, 0x84, 0xB8, 0x68, 0x68, 0xD0
	.byte 0xC3, 0x41, 0x41, 0x82, 0xB0, 0x99, 0x99, 0x29, 0x77, 0x2D, 0x2D, 0x5A, 0x11, 0x0F, 0x0F, 0x1E
	.byte 0xCB, 0xB0, 0xB0, 0x7B, 0xFC, 0x54, 0x54, 0xA8, 0xD6, 0xBB, 0xBB, 0x6D, 0x3A, 0x16, 0x16, 0x2C
	.byte 0x63, 0x63, 0xC6, 0xA5, 0x7C, 0x7C, 0xF8, 0x84, 0x77, 0x77, 0xEE, 0x99, 0x7B, 0x7B, 0xF6, 0x8D
	.byte 0xF2, 0xF2, 0xFF, 0x0D, 0x6B, 0x6B, 0xD6, 0xBD, 0x6F, 0x6F, 0xDE, 0xB1, 0xC5, 0xC5, 0x91, 0x54
	.byte 0x30, 0x30, 0x60, 0x50, 0x01, 0x01, 0x02, 0x03, 0x67, 0x67, 0xCE, 0xA9, 0x2B, 0x2B, 0x56, 0x7D
	.byte 0xFE, 0xFE, 0xE7, 0x19, 0xD7, 0xD7, 0xB5, 0x62, 0xAB, 0xAB, 0x4D, 0xE6, 0x76, 0x76, 0xEC, 0x9A
	.byte 0xCA, 0xCA, 0x8F, 0x45, 0x82, 0x82, 0x1F, 0x9D, 0xC9, 0xC9, 0x89, 0x40, 0x7D, 0x7D, 0xFA, 0x87
	.byte 0xFA, 0xFA, 0xEF, 0x15, 0x59, 0x59, 0xB2, 0xEB, 0x47, 0x47, 0x8E, 0xC9, 0xF0, 0xF0, 0xFB, 0x0B
	.byte 0xAD, 0xAD, 0x41, 0xEC, 0xD4, 0xD4, 0xB3, 0x67, 0xA2, 0xA2, 0x5F, 0xFD, 0xAF, 0xAF, 0x45, 0xEA
	.byte 0x9C, 0x9C, 0x23, 0xBF, 0xA4, 0xA4, 0x53, 0xF7, 0x72, 0x72, 0xE4, 0x96, 0xC0, 0xC0, 0x9B, 0x5B
	.byte 0xB7, 0xB7, 0x75, 0xC2, 0xFD, 0xFD, 0xE1, 0x1C, 0x93, 0x93, 0x3D, 0xAE, 0x26, 0x26, 0x4C, 0x6A
	.byte 0x36, 0x36, 0x6C, 0x5A, 0x3F, 0x3F, 0x7E, 0x41, 0xF7, 0xF7, 0xF5, 0x02, 0xCC, 0xCC, 0x83, 0x4F
	.byte 0x34, 0x34, 0x68, 0x5C, 0xA5, 0xA5, 0x51, 0xF4, 0xE5, 0xE5, 0xD1, 0x34, 0xF1, 0xF1, 0xF9, 0x08
	.byte 0x71, 0x71, 0xE2, 0x93, 0xD8, 0xD8, 0xAB, 0x73, 0x31, 0x31, 0x62, 0x53, 0x15, 0x15, 0x2A, 0x3F
	.byte 0x04, 0x04, 0x08, 0x0C, 0xC7, 0xC7, 0x95, 0x52, 0x23, 0x23, 0x46, 0x65, 0xC3, 0xC3, 0x9D, 0x5E
	.byte 0x18, 0x18, 0x30, 0x28, 0x96, 0x96, 0x37, 0xA1, 0x05, 0x05, 0x0A, 0x0F, 0x9A, 0x9A, 0x2F, 0xB5
	.byte 0x07, 0x07, 0x0E, 0x09, 0x12, 0x12, 0x24, 0x36, 0x80, 0x80, 0x1B, 0x9B, 0xE2, 0xE2, 0xDF, 0x3D
	.byte 0xEB, 0xEB, 0xCD, 0x26, 0x27, 0x27, 0x4E, 0x69, 0xB2, 0xB2, 0x7F, 0xCD, 0x75, 0x75, 0xEA, 0x9F
	.byte 0x09, 0x09, 0x12, 0x1B, 0x83, 0x83, 0x1D, 0x9E, 0x2C, 0x2C, 0x58, 0x74, 0x1A, 0x1A, 0x34, 0x2E
	.byte 0x1B, 0x1B, 0x36, 0x2D, 0x6E, 0x6E, 0xDC, 0xB2, 0x5A, 0x5A, 0xB4, 0xEE, 0xA0, 0xA0, 0x5B, 0xFB
	.byte 0x52, 0x52, 0xA4, 0xF6, 0x3B, 0x3B, 0x76, 0x4D, 0xD6, 0xD6, 0xB7, 0x61, 0xB3, 0xB3, 0x7D, 0xCE
	.byte 0x29, 0x29, 0x52, 0x7B, 0xE3, 0xE3, 0xDD, 0x3E, 0x2F, 0x2F, 0x5E, 0x71, 0x84, 0x84, 0x13, 0x97
	.byte 0x53, 0x53, 0xA6, 0xF5, 0xD1, 0xD1, 0xB9, 0x68, 0x00, 0x00, 0x00, 0x00, 0xED, 0xED, 0xC1, 0x2C
	.byte 0x20, 0x20, 0x40, 0x60, 0xFC, 0xFC, 0xE3, 0x1F, 0xB1, 0xB1, 0x79, 0xC8, 0x5B, 0x5B, 0xB6, 0xED
	.byte 0x6A, 0x6A, 0xD4, 0xBE, 0xCB, 0xCB, 0x8D, 0x46, 0xBE, 0xBE, 0x67, 0xD9, 0x39, 0x39, 0x72, 0x4B
	.byte 0x4A, 0x4A, 0x94, 0xDE, 0x4C, 0x4C, 0x98, 0xD4, 0x58, 0x58, 0xB0, 0xE8, 0xCF, 0xCF, 0x85, 0x4A
	.byte 0xD0, 0xD0, 0xBB, 0x6B, 0xEF, 0xEF, 0xC5, 0x2A, 0xAA, 0xAA, 0x4F, 0xE5, 0xFB, 0xFB, 0xED, 0x16
	.byte 0x43, 0x43, 0x86, 0xC5, 0x4D, 0x4D, 0x9A, 0xD7, 0x33, 0x33, 0x66, 0x55, 0x85, 0x85, 0x11, 0x94
	.byte 0x45, 0x45, 0x8A, 0xCF, 0xF9, 0xF9, 0xE9, 0x10, 0x02, 0x02, 0x04, 0x06, 0x7F, 0x7F, 0xFE, 0x81
	.byte 0x50, 0x50, 0xA0, 0xF0, 0x3C, 0x3C, 0x78, 0x44, 0x9F, 0x9F, 0x25, 0xBA, 0xA8, 0xA8, 0x4B, 0xE3
	.byte 0x51, 0x51, 0xA2, 0xF3, 0xA3, 0xA3, 0x5D, 0xFE, 0x40, 0x40, 0x80, 0xC0, 0x8F, 0x8F, 0x05, 0x8A
	.byte 0x92, 0x92, 0x3F, 0xAD, 0x9D, 0x9D, 0x21, 0xBC, 0x38, 0x38, 0x70, 0x48, 0xF5, 0xF5, 0xF1, 0x04
	.byte 0xBC, 0xBC, 0x63, 0xDF, 0xB6, 0xB6, 0x77, 0xC1, 0xDA, 0xDA, 0xAF, 0x75, 0x21, 0x21, 0x42, 0x63
	.byte 0x10, 0x10, 0x20, 0x30, 0xFF, 0xFF, 0xE5, 0x1A, 0xF3, 0xF3, 0xFD, 0x0E, 0xD2, 0xD2, 0xBF, 0x6D
	.byte 0xCD, 0xCD, 0x81, 0x4C, 0x0C, 0x0C, 0x18, 0x14, 0x13, 0x13, 0x26, 0x35, 0xEC, 0xEC, 0xC3, 0x2F
	.byte 0x5F, 0x5F, 0xBE, 0xE1, 0x97, 0x97, 0x35, 0xA2, 0x44, 0x44, 0x88, 0xCC, 0x17, 0x17, 0x2E, 0x39
	.byte 0xC4, 0xC4, 0x93, 0x57, 0xA7, 0xA7, 0x55, 0xF2, 0x7E, 0x7E, 0xFC, 0x82, 0x3D, 0x3D, 0x7A, 0x47
	.byte 0x64, 0x64, 0xC8, 0xAC, 0x5D, 0x5D, 0xBA, 0xE7, 0x19, 0x19, 0x32, 0x2B, 0x73, 0x73, 0xE6, 0x95
	.byte 0x60, 0x60, 0xC0, 0xA0, 0x81, 0x81, 0x19, 0x98, 0x4F, 0x4F, 0x9E, 0xD1, 0xDC, 0xDC, 0xA3, 0x7F
	.byte 0x22, 0x22, 0x44, 0x66, 0x2A, 0x2A, 0x54, 0x7E, 0x90, 0x90, 0x3B, 0xAB, 0x88, 0x88, 0x0B, 0x83
	.byte 0x46, 0x46, 0x8C, 0xCA, 0xEE, 0xEE, 0xC7, 0x29, 0xB8, 0xB8, 0x6B, 0xD3, 0x14, 0x14, 0x28, 0x3C
	.byte 0xDE, 0xDE, 0xA7, 0x79, 0x5E, 0x5E, 0xBC, 0xE2, 0x0B, 0x0B, 0x16, 0x1D, 0xDB, 0xDB, 0xAD, 0x76
	.byte 0xE0, 0xE0, 0xDB, 0x3B, 0x32, 0x32, 0x64, 0x56, 0x3A, 0x3A, 0x74, 0x4E, 0x0A, 0x0A, 0x14, 0x1E
	.byte 0x49, 0x49, 0x92, 0xDB, 0x06, 0x06, 0x0C, 0x0A, 0x24, 0x24, 0x48, 0x6C, 0x5C, 0x5C, 0xB8, 0xE4
	.byte 0xC2, 0xC2, 0x9F, 0x5D, 0xD3, 0xD3, 0xBD, 0x6E, 0xAC, 0xAC, 0x43, 0xEF, 0x62, 0x62, 0xC4, 0xA6
	.byte 0x91, 0x91, 0x39, 0xA8, 0x95, 0x95, 0x31, 0xA4, 0xE4, 0xE4, 0xD3, 0x37, 0x79, 0x79, 0xF2, 0x8B
	.byte 0xE7, 0xE7, 0xD5, 0x32, 0xC8, 0xC8, 0x8B, 0x43, 0x37, 0x37, 0x6E, 0x59, 0x6D, 0x6D, 0xDA, 0xB7
	.byte 0x8D, 0x8D, 0x01, 0x8C, 0xD5, 0xD5, 0xB1, 0x64, 0x4E, 0x4E, 0x9C, 0xD2, 0xA9, 0xA9, 0x49, 0xE0
	.byte 0x6C, 0x6C, 0xD8, 0xB4, 0x56, 0x56, 0xAC, 0xFA, 0xF4, 0xF4, 0xF3, 0x07, 0xEA, 0xEA, 0xCF, 0x25
	.byte 0x65, 0x65, 0xCA, 0xAF, 0x7A, 0x7A, 0xF4, 0x8E, 0xAE, 0xAE, 0x47, 0xE9, 0x08, 0x08, 0x10, 0x18
	.byte 0xBA, 0xBA, 0x6F, 0xD5, 0x78, 0x78, 0xF0, 0x88, 0x25, 0x25, 0x4A, 0x6F, 0x2E, 0x2E, 0x5C, 0x72
	.byte 0x1C, 0x1C, 0x38, 0x24, 0xA6, 0xA6, 0x57, 0xF1, 0xB4, 0xB4, 0x73, 0xC7, 0xC6, 0xC6, 0x97, 0x51
	.byte 0xE8, 0xE8, 0xCB, 0x23, 0xDD, 0xDD, 0xA1, 0x7C, 0x74, 0x74, 0xE8, 0x9C, 0x1F, 0x1F, 0x3E, 0x21
	.byte 0x4B, 0x4B, 0x96, 0xDD, 0xBD, 0xBD, 0x61, 0xDC, 0x8B, 0x8B, 0x0D, 0x86, 0x8A, 0x8A, 0x0F, 0x85
	.byte 0x70, 0x70, 0xE0, 0x90, 0x3E, 0x3E, 0x7C, 0x42, 0xB5, 0xB5, 0x71, 0xC4, 0x66, 0x66, 0xCC, 0xAA
	.byte 0x48, 0x48, 0x90, 0xD8, 0x03, 0x03, 0x06, 0x05, 0xF6, 0xF6, 0xF7, 0x01, 0x0E, 0x0E, 0x1C, 0x12
	.byte 0x61, 0x61, 0xC2, 0xA3, 0x35, 0x35, 0x6A, 0x5F, 0x57, 0x57, 0xAE, 0xF9, 0xB9, 0xB9, 0x69, 0xD0
	.byte 0x86, 0x86, 0x17, 0x91, 0xC1, 0xC1, 0x99, 0x58, 0x1D, 0x1D, 0x3A, 0x27, 0x9E, 0x9E, 0x27, 0xB9
	.byte 0xE1, 0xE1, 0xD9, 0x38, 0xF8, 0xF8, 0xEB, 0x13, 0x98, 0x98, 0x2B, 0xB3, 0x11, 0x11, 0x22, 0x33
	.byte 0x69, 0x69, 0xD2, 0xBB, 0xD9, 0xD9, 0xA9, 0x70, 0x8E, 0x8E, 0x07, 0x89, 0x94, 0x94, 0x33, 0xA7
	.byte 0x9B, 0x9B, 0x2D, 0xB6, 0x1E, 0x1E, 0x3C, 0x22, 0x87, 0x87, 0x15, 0x92, 0xE9, 0xE9, 0xC9, 0x20
	.byte 0xCE, 0xCE, 0x87, 0x49, 0x55, 0x55, 0xAA, 0xFF, 0x28, 0x28, 0x50, 0x78, 0xDF, 0xDF, 0xA5, 0x7A
	.byte 0x8C, 0x8C, 0x03, 0x8F, 0xA1, 0xA1, 0x59, 0xF8, 0x89, 0x89, 0x09, 0x80, 0x0D, 0x0D, 0x1A, 0x17
	.byte 0xBF, 0xBF, 0x65, 0xDA, 0xE6, 0xE6, 0xD7, 0x31, 0x42, 0x42, 0x84, 0xC6, 0x68, 0x68, 0xD0, 0xB8
	.byte 0x41, 0x41, 0x82, 0xC3, 0x99, 0x99, 0x29, 0xB0, 0x2D, 0x2D, 0x5A, 0x77, 0x0F, 0x0F, 0x1E, 0x11
	.byte 0xB0, 0xB0, 0x7B, 0xCB, 0x54, 0x54, 0xA8, 0xFC, 0xBB, 0xBB, 0x6D, 0xD6, 0x16, 0x16, 0x2C, 0x3A
	.byte 0x63, 0xC6, 0xA5, 0x63, 0x7C, 0xF8, 0x84, 0x7C, 0x77, 0xEE, 0x99, 0x77, 0x7B, 0xF6, 0x8D, 0x7B
	.byte 0xF2, 0xFF, 0x0D, 0xF2, 0x6B, 0xD6, 0xBD, 0x6B, 0x6F, 0xDE, 0xB1, 0x6F, 0xC5, 0x91, 0x54, 0xC5
	.byte 0x30, 0x60, 0x50, 0x30, 0x01, 0x02, 0x03, 0x01, 0x67, 0xCE, 0xA9, 0x67, 0x2B, 0x56, 0x7D, 0x2B
	.byte 0xFE, 0xE7, 0x19, 0xFE, 0xD7, 0xB5, 0x62, 0xD7, 0xAB, 0x4D, 0xE6, 0xAB, 0x76, 0xEC, 0x9A, 0x76
	.byte 0xCA, 0x8F, 0x45, 0xCA, 0x82, 0x1F, 0x9D, 0x82, 0xC9, 0x89, 0x40, 0xC9, 0x7D, 0xFA, 0x87, 0x7D
	.byte 0xFA, 0xEF, 0x15, 0xFA, 0x59, 0xB2, 0xEB, 0x59, 0x47, 0x8E, 0xC9, 0x47, 0xF0, 0xFB, 0x0B, 0xF0
	.byte 0xAD, 0x41, 0xEC, 0xAD, 0xD4, 0xB3, 0x67, 0xD4, 0xA2, 0x5F, 0xFD, 0xA2, 0xAF, 0x45, 0xEA, 0xAF
	.byte 0x9C, 0x23, 0xBF, 0x9C, 0xA4, 0x53, 0xF7, 0xA4, 0x72, 0xE4, 0x96, 0x72, 0xC0, 0x9B, 0x5B, 0xC0
	.byte 0xB7, 0x75, 0xC2, 0xB7, 0xFD, 0xE1, 0x1C, 0xFD, 0x93, 0x3D, 0xAE, 0x93, 0x26, 0x4C, 0x6A, 0x26
	.byte 0x36, 0x6C, 0x5A, 0x36, 0x3F, 0x7E, 0x41, 0x3F, 0xF7, 0xF5, 0x02, 0xF7, 0xCC, 0x83, 0x4F, 0xCC
	.byte 0x34, 0x68, 0x5C, 0x34, 0xA5, 0x51, 0xF4, 0xA5, 0xE5, 0xD1, 0x34, 0xE5, 0xF1, 0xF9, 0x08, 0xF1
	.byte 0x71, 0xE2, 0x93, 0x71, 0xD8, 0xAB, 0x73, 0xD8, 0x31, 0x62, 0x53, 0x31, 0x15, 0x2A, 0x3F, 0x15
	.byte 0x04, 0x08, 0x0C, 0x04, 0xC7, 0x95, 0x52, 0xC7, 0x23, 0x46, 0x65, 0x23, 0xC3, 0x9D, 0x5E, 0xC3
	.byte 0x18, 0x30, 0x28, 0x18, 0x96, 0x37, 0xA1, 0x96, 0x05, 0x0A, 0x0F, 0x05, 0x9A, 0x2F, 0xB5, 0x9A
	.byte 0x07, 0x0E, 0x09, 0x07, 0x12, 0x24, 0x36, 0x12, 0x80, 0x1B, 0x9B, 0x80, 0xE2, 0xDF, 0x3D, 0xE2
	.byte 0xEB, 0xCD, 0x26, 0xEB, 0x27, 0x4E, 0x69, 0x27, 0xB2, 0x7F, 0xCD, 0xB2, 0x75, 0xEA, 0x9F, 0x75
	.byte 0x09, 0x12, 0x1B, 0x09, 0x83, 0x1D, 0x9E, 0x83, 0x2C, 0x58, 0x74, 0x2C, 0x1A, 0x34, 0x2E, 0x1A
	.byte 0x1B, 0x36, 0x2D, 0x1B, 0x6E, 0xDC, 0xB2, 0x6E, 0x5A, 0xB4, 0xEE, 0x5A, 0xA0, 0x5B, 0xFB, 0xA0
	.byte 0x52, 0xA4, 0xF6, 0x52, 0x3B, 0x76, 0x4D, 0x3B, 0xD6, 0xB7, 0x61, 0xD6, 0xB3, 0x7D, 0xCE, 0xB3
	.byte 0x29, 0x52, 0x7B, 0x29, 0xE3, 0xDD, 0x3E, 0xE3, 0x2F, 0x5E, 0x71, 0x2F, 0x84, 0x13, 0x97, 0x84
	.byte 0x53, 0xA6, 0xF5, 0x53, 0xD1, 0xB9, 0x68, 0xD1, 0x00, 0x00, 0x00, 0x00, 0xED, 0xC1, 0x2C, 0xED
	.byte 0x20, 0x40, 0x60, 0x20, 0xFC, 0xE3, 0x1F, 0xFC, 0xB1, 0x79, 0xC8, 0xB1, 0x5B, 0xB6, 0xED, 0x5B
	.byte 0x6A, 0xD4, 0xBE, 0x6A, 0xCB, 0x8D, 0x46, 0xCB, 0xBE, 0x67, 0xD9, 0xBE, 0x39, 0x72, 0x4B, 0x39
	.byte 0x4A, 0x94, 0xDE, 0x4A, 0x4C, 0x98, 0xD4, 0x4C, 0x58, 0xB0, 0xE8, 0x58, 0xCF, 0x85, 0x4A, 0xCF
	.byte 0xD0, 0xBB, 0x6B, 0xD0, 0xEF, 0xC5, 0x2A, 0xEF, 0xAA, 0x4F, 0xE5, 0xAA, 0xFB, 0xED, 0x16, 0xFB
	.byte 0x43, 0x86, 0xC5, 0x43, 0x4D, 0x9A, 0xD7, 0x4D, 0x33, 0x66, 0x55, 0x33, 0x85, 0x11, 0x94, 0x85
	.byte 0x45, 0x8A, 0xCF, 0x45, 0xF9, 0xE9, 0x10, 0xF9, 0x02, 0x04, 0x06, 0x02, 0x7F, 0xFE, 0x81, 0x7F
	.byte 0x50, 0xA0, 0xF0, 0x50, 0x3C, 0x78, 0x44, 0x3C, 0x9F, 0x25, 0xBA, 0x9F, 0xA8, 0x4B, 0xE3, 0xA8
	.byte 0x51, 0xA2, 0xF3, 0x51, 0xA3, 0x5D, 0xFE, 0xA3, 0x40, 0x80, 0xC0, 0x40, 0x8F, 0x05, 0x8A, 0x8F
	.byte 0x92, 0x3F, 0xAD, 0x92, 0x9D, 0x21, 0xBC, 0x9D, 0x38, 0x70, 0x48, 0x38, 0xF5, 0xF1, 0x04, 0xF5
	.byte 0xBC, 0x63, 0xDF, 0xBC, 0xB6, 0x77, 0xC1, 0xB6, 0xDA, 0xAF, 0x75, 0xDA, 0x21, 0x42, 0x63, 0x21
	.byte 0x10, 0x20, 0x30, 0x10, 0xFF, 0xE5, 0x1A, 0xFF, 0xF3, 0xFD, 0x0E, 0xF3, 0xD2, 0xBF, 0x6D, 0xD2
	.byte 0xCD, 0x81, 0x4C, 0xCD, 0x0C, 0x18, 0x14, 0x0C, 0x13, 0x26, 0x35, 0x13, 0xEC, 0xC3, 0x2F, 0xEC
	.byte 0x5F, 0xBE, 0xE1, 0x5F, 0x97, 0x35, 0xA2, 0x97, 0x44, 0x88, 0xCC, 0x44, 0x17, 0x2E, 0x39, 0x17
	.byte 0xC4, 0x93, 0x57, 0xC4, 0xA7, 0x55, 0xF2, 0xA7, 0x7E, 0xFC, 0x82, 0x7E, 0x3D, 0x7A, 0x47, 0x3D
	.byte 0x64, 0xC8, 0xAC, 0x64, 0x5D, 0xBA, 0xE7, 0x5D, 0x19, 0x32, 0x2B, 0x19, 0x73, 0xE6, 0x95, 0x73
	.byte 0x60, 0xC0, 0xA0, 0x60, 0x81, 0x19, 0x98, 0x81, 0x4F, 0x9E, 0xD1, 0x4F, 0xDC, 0xA3, 0x7F, 0xDC
	.byte 0x22, 0x44, 0x66, 0x22, 0x2A, 0x54, 0x7E, 0x2A, 0x90, 0x3B, 0xAB, 0x90, 0x88, 0x0B, 0x83, 0x88
	.byte 0x46, 0x8C, 0xCA, 0x46, 0xEE, 0xC7, 0x29, 0xEE, 0xB8, 0x6B, 0xD3, 0xB8, 0x14, 0x28, 0x3C, 0x14
	.byte 0xDE, 0xA7, 0x79, 0xDE, 0x5E, 0xBC, 0xE2, 0x5E, 0x0B, 0x16, 0x1D, 0x0B, 0xDB, 0xAD, 0x76, 0xDB
	.byte 0xE0, 0xDB, 0x3B, 0xE0, 0x32, 0x64, 0x56, 0x32, 0x3A, 0x74, 0x4E, 0x3A, 0x0A, 0x14, 0x1E, 0x0A
	.byte 0x49, 0x92, 0xDB, 0x49, 0x06, 0x0C, 0x0A, 0x06, 0x24, 0x48, 0x6C, 0x24, 0x5C, 0xB8, 0xE4, 0x5C
	.byte 0xC2, 0x9F, 0x5D, 0xC2, 0xD3, 0xBD, 0x6E, 0xD3, 0xAC, 0x43, 0xEF, 0xAC, 0x62, 0xC4, 0xA6, 0x62
	.byte 0x91, 0x39, 0xA8, 0x91, 0x95, 0x31, 0xA4, 0x95, 0xE4, 0xD3, 0x37, 0xE4, 0x79, 0xF2, 0x8B, 0x79
	.byte 0xE7, 0xD5, 0x32, 0xE7, 0xC8, 0x8B, 0x43, 0xC8, 0x37, 0x6E, 0x59, 0x37, 0x6D, 0xDA, 0xB7, 0x6D
	.byte 0x8D, 0x01, 0x8C, 0x8D, 0xD5, 0xB1, 0x64, 0xD5, 0x4E, 0x9C, 0xD2, 0x4E, 0xA9, 0x49, 0xE0, 0xA9
	.byte 0x6C, 0xD8, 0xB4, 0x6C, 0x56, 0xAC, 0xFA, 0x56, 0xF4, 0xF3, 0x07, 0xF4, 0xEA, 0xCF, 0x25, 0xEA
	.byte 0x65, 0xCA, 0xAF, 0x65, 0x7A, 0xF4, 0x8E, 0x7A, 0xAE, 0x47, 0xE9, 0xAE, 0x08, 0x10, 0x18, 0x08
	.byte 0xBA, 0x6F, 0xD5, 0xBA, 0x78, 0xF0, 0x88, 0x78, 0x25, 0x4A, 0x6F, 0x25, 0x2E, 0x5C, 0x72, 0x2E
	.byte 0x1C, 0x38, 0x24, 0x1C, 0xA6, 0x57, 0xF1, 0xA6, 0xB4, 0x73, 0xC7, 0xB4, 0xC6, 0x97, 0x51, 0xC6
	.byte 0xE8, 0xCB, 0x23, 0xE8, 0xDD, 0xA1, 0x7C, 0xDD, 0x74, 0xE8, 0x9C, 0x74, 0x1F, 0x3E, 0x21, 0x1F
	.byte 0x4B, 0x96, 0xDD, 0x4B, 0xBD, 0x61, 0xDC, 0xBD, 0x8B, 0x0D, 0x86, 0x8B, 0x8A, 0x0F, 0x85, 0x8A
	.byte 0x70, 0xE0, 0x90, 0x70, 0x3E, 0x7C, 0x42, 0x3E, 0xB5, 0x71, 0xC4, 0xB5, 0x66, 0xCC, 0xAA, 0x66
	.byte 0x48, 0x90, 0xD8, 0x48, 0x03, 0x06, 0x05, 0x03, 0xF6, 0xF7, 0x01, 0xF6, 0x0E, 0x1C, 0x12, 0x0E
	.byte 0x61, 0xC2, 0xA3, 0x61, 0x35, 0x6A, 0x5F, 0x35, 0x57, 0xAE, 0xF9, 0x57, 0xB9, 0x69, 0xD0, 0xB9
	.byte 0x86, 0x17, 0x91, 0x86, 0xC1, 0x99, 0x58, 0xC1, 0x1D, 0x3A, 0x27, 0x1D, 0x9E, 0x27, 0xB9, 0x9E
	.byte 0xE1, 0xD9, 0x38, 0xE1, 0xF8, 0xEB, 0x13, 0xF8, 0x98, 0x2B, 0xB3, 0x98, 0x11, 0x22, 0x33, 0x11
	.byte 0x69, 0xD2, 0xBB, 0x69, 0xD9, 0xA9, 0x70, 0xD9, 0x8E, 0x07, 0x89, 0x8E, 0x94, 0x33, 0xA7, 0x94
	.byte 0x9B, 0x2D, 0xB6, 0x9B, 0x1E, 0x3C, 0x22, 0x1E, 0x87, 0x15, 0x92, 0x87, 0xE9, 0xC9, 0x20, 0xE9
	.byte 0xCE, 0x87, 0x49, 0xCE, 0x55, 0xAA, 0xFF, 0x55, 0x28, 0x50, 0x78, 0x28, 0xDF, 0xA5, 0x7A, 0xDF
	.byte 0x8C, 0x03, 0x8F, 0x8C, 0xA1, 0x59, 0xF8, 0xA1, 0x89, 0x09, 0x80, 0x89, 0x0D, 0x1A, 0x17, 0x0D
	.byte 0xBF, 0x65, 0xDA, 0xBF, 0xE6, 0xD7, 0x31, 0xE6, 0x42, 0x84, 0xC6, 0x42, 0x68, 0xD0, 0xB8, 0x68
	.byte 0x41, 0x82, 0xC3, 0x41, 0x99, 0x29, 0xB0, 0x99, 0x2D, 0x5A, 0x77, 0x2D, 0x0F, 0x1E, 0x11, 0x0F
	.byte 0xB0, 0x7B, 0xCB, 0xB0, 0x54, 0xA8, 0xFC, 0x54, 0xBB, 0x6D, 0xD6, 0xBB, 0x16, 0x2C, 0x3A, 0x16
	.byte 0xC6, 0xA5, 0x63, 0x63, 0xF8, 0x84, 0x7C, 0x7C, 0xEE, 0x99, 0x77, 0x77, 0xF6, 0x8D, 0x7B, 0x7B
	.byte 0xFF, 0x0D, 0xF2, 0xF2, 0xD6, 0xBD, 0x6B, 0x6B, 0xDE, 0xB1, 0x6F, 0x6F, 0x91, 0x54, 0xC5, 0xC5
	.byte 0x60, 0x50, 0x30, 0x30, 0x02, 0x03, 0x01, 0x01, 0xCE, 0xA9, 0x67, 0x67, 0x56, 0x7D, 0x2B, 0x2B
	.byte 0xE7, 0x19, 0xFE, 0xFE, 0xB5, 0x62, 0xD7, 0xD7, 0x4D, 0xE6, 0xAB, 0xAB, 0xEC, 0x9A, 0x76, 0x76
	.byte 0x8F, 0x45, 0xCA, 0xCA, 0x1F, 0x9D, 0x82, 0x82, 0x89, 0x40, 0xC9, 0xC9, 0xFA, 0x87, 0x7D, 0x7D
	.byte 0xEF, 0x15, 0xFA, 0xFA, 0xB2, 0xEB, 0x59, 0x59, 0x8E, 0xC9, 0x47, 0x47, 0xFB, 0x0B, 0xF0, 0xF0
	.byte 0x41, 0xEC, 0xAD, 0xAD, 0xB3, 0x67, 0xD4, 0xD4, 0x5F, 0xFD, 0xA2, 0xA2, 0x45, 0xEA, 0xAF, 0xAF
	.byte 0x23, 0xBF, 0x9C, 0x9C, 0x53, 0xF7, 0xA4, 0xA4, 0xE4, 0x96, 0x72, 0x72, 0x9B, 0x5B, 0xC0, 0xC0
	.byte 0x75, 0xC2, 0xB7, 0xB7, 0xE1, 0x1C, 0xFD, 0xFD, 0x3D, 0xAE, 0x93, 0x93, 0x4C, 0x6A, 0x26, 0x26
	.byte 0x6C, 0x5A, 0x36, 0x36, 0x7E, 0x41, 0x3F, 0x3F, 0xF5, 0x02, 0xF7, 0xF7, 0x83, 0x4F, 0xCC, 0xCC
	.byte 0x68, 0x5C, 0x34, 0x34, 0x51, 0xF4, 0xA5, 0xA5, 0xD1, 0x34, 0xE5, 0xE5, 0xF9, 0x08, 0xF1, 0xF1
	.byte 0xE2, 0x93, 0x71, 0x71, 0xAB, 0x73, 0xD8, 0xD8, 0x62, 0x53, 0x31, 0x31, 0x2A, 0x3F, 0x15, 0x15
	.byte 0x08, 0x0C, 0x04, 0x04, 0x95, 0x52, 0xC7, 0xC7, 0x46, 0x65, 0x23, 0x23, 0x9D, 0x5E, 0xC3, 0xC3
	.byte 0x30, 0x28, 0x18, 0x18, 0x37, 0xA1, 0x96, 0x96, 0x0A, 0x0F, 0x05, 0x05, 0x2F, 0xB5, 0x9A, 0x9A
	.byte 0x0E, 0x09, 0x07, 0x07, 0x24, 0x36, 0x12, 0x12, 0x1B, 0x9B, 0x80, 0x80, 0xDF, 0x3D, 0xE2, 0xE2
	.byte 0xCD, 0x26, 0xEB, 0xEB, 0x4E, 0x69, 0x27, 0x27, 0x7F, 0xCD, 0xB2, 0xB2, 0xEA, 0x9F, 0x75, 0x75
	.byte 0x12, 0x1B, 0x09, 0x09, 0x1D, 0x9E, 0x83, 0x83, 0x58, 0x74, 0x2C, 0x2C, 0x34, 0x2E, 0x1A, 0x1A
	.byte 0x36, 0x2D, 0x1B, 0x1B, 0xDC, 0xB2, 0x6E, 0x6E, 0xB4, 0xEE, 0x5A, 0x5A, 0x5B, 0xFB, 0xA0, 0xA0
	.byte 0xA4, 0xF6, 0x52, 0x52, 0x76, 0x4D, 0x3B, 0x3B, 0xB7, 0x61, 0xD6, 0xD6, 0x7D, 0xCE, 0xB3, 0xB3
	.byte 0x52, 0x7B, 0x29, 0x29, 0xDD, 0x3E, 0xE3, 0xE3, 0x5E, 0x71, 0x2F, 0x2F, 0x13, 0x97, 0x84, 0x84
	.byte 0xA6, 0xF5, 0x53, 0x53, 0xB9, 0x68, 0xD1, 0xD1, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x2C, 0xED, 0xED
	.byte 0x40, 0x60, 0x20, 0x20, 0xE3, 0x1F, 0xFC, 0xFC, 0x79, 0xC8, 0xB1, 0xB1, 0xB6, 0xED, 0x5B, 0x5B
	.byte 0xD4, 0xBE, 0x6A, 0x6A, 0x8D, 0x46, 0xCB, 0xCB, 0x67, 0xD9, 0xBE, 0xBE, 0x72, 0x4B, 0x39, 0x39
	.byte 0x94, 0xDE, 0x4A, 0x4A, 0x98, 0xD4, 0x4C, 0x4C, 0xB0, 0xE8, 0x58, 0x58, 0x85, 0x4A, 0xCF, 0xCF
	.byte 0xBB, 0x6B, 0xD0, 0xD0, 0xC5, 0x2A, 0xEF, 0xEF, 0x4F, 0xE5, 0xAA, 0xAA, 0xED, 0x16, 0xFB, 0xFB
	.byte 0x86, 0xC5, 0x43, 0x43, 0x9A, 0xD7, 0x4D, 0x4D, 0x66, 0x55, 0x33, 0x33, 0x11, 0x94, 0x85, 0x85
	.byte 0x8A, 0xCF, 0x45, 0x45, 0xE9, 0x10, 0xF9, 0xF9, 0x04, 0x06, 0x02, 0x02, 0xFE, 0x81, 0x7F, 0x7F
	.byte 0xA0, 0xF0, 0x50, 0x50, 0x78, 0x44, 0x3C, 0x3C, 0x25, 0xBA, 0x9F, 0x9F, 0x4B, 0xE3, 0xA8, 0xA8
	.byte 0xA2, 0xF3, 0x51, 0x51, 0x5D, 0xFE, 0xA3, 0xA3, 0x80, 0xC0, 0x40, 0x40, 0x05, 0x8A, 0x8F, 0x8F
	.byte 0x3F, 0xAD, 0x92, 0x92, 0x21, 0xBC, 0x9D, 0x9D, 0x70, 0x48, 0x38, 0x38, 0xF1, 0x04, 0xF5, 0xF5
	.byte 0x63, 0xDF, 0xBC, 0xBC, 0x77, 0xC1, 0xB6, 0xB6, 0xAF, 0x75, 0xDA, 0xDA, 0x42, 0x63, 0x21, 0x21
	.byte 0x20, 0x30, 0x10, 0x10, 0xE5, 0x1A, 0xFF, 0xFF, 0xFD, 0x0E, 0xF3, 0xF3, 0xBF, 0x6D, 0xD2, 0xD2
	.byte 0x81, 0x4C, 0xCD, 0xCD, 0x18, 0x14, 0x0C, 0x0C, 0x26, 0x35, 0x13, 0x13, 0xC3, 0x2F, 0xEC, 0xEC
	.byte 0xBE, 0xE1, 0x5F, 0x5F, 0x35, 0xA2, 0x97, 0x97, 0x88, 0xCC, 0x44, 0x44, 0x2E, 0x39, 0x17, 0x17
	.byte 0x93, 0x57, 0xC4, 0xC4, 0x55, 0xF2, 0xA7, 0xA7, 0xFC, 0x82, 0x7E, 0x7E, 0x7A, 0x47, 0x3D, 0x3D
	.byte 0xC8, 0xAC, 0x64, 0x64, 0xBA, 0xE7, 0x5D, 0x5D, 0x32, 0x2B, 0x19, 0x19, 0xE6, 0x95, 0x73, 0x73
	.byte 0xC0, 0xA0, 0x60, 0x60, 0x19, 0x98, 0x81, 0x81, 0x9E, 0xD1, 0x4F, 0x4F, 0xA3, 0x7F, 0xDC, 0xDC
	.byte 0x44, 0x66, 0x22, 0x22, 0x54, 0x7E, 0x2A, 0x2A, 0x3B, 0xAB, 0x90, 0x90, 0x0B, 0x83, 0x88, 0x88
	.byte 0x8C, 0xCA, 0x46, 0x46, 0xC7, 0x29, 0xEE, 0xEE, 0x6B, 0xD3, 0xB8, 0xB8, 0x28, 0x3C, 0x14, 0x14
	.byte 0xA7, 0x79, 0xDE, 0xDE, 0xBC, 0xE2, 0x5E, 0x5E, 0x16, 0x1D, 0x0B, 0x0B, 0xAD, 0x76, 0xDB, 0xDB
	.byte 0xDB, 0x3B, 0xE0, 0xE0, 0x64, 0x56, 0x32, 0x32, 0x74, 0x4E, 0x3A, 0x3A, 0x14, 0x1E, 0x0A, 0x0A
	.byte 0x92, 0xDB, 0x49, 0x49, 0x0C, 0x0A, 0x06, 0x06, 0x48, 0x6C, 0x24, 0x24, 0xB8, 0xE4, 0x5C, 0x5C
	.byte 0x9F, 0x5D, 0xC2, 0xC2, 0xBD, 0x6E, 0xD3, 0xD3, 0x43, 0xEF, 0xAC, 0xAC, 0xC4, 0xA6, 0x62, 0x62
	.byte 0x39, 0xA8, 0x91, 0x91, 0x31, 0xA4, 0x95, 0x95, 0xD3, 0x37, 0xE4, 0xE4, 0xF2, 0x8B, 0x79, 0x79
	.byte 0xD5, 0x32, 0xE7, 0xE7, 0x8B, 0x43, 0xC8, 0xC8, 0x6E, 0x59, 0x37, 0x37, 0xDA, 0xB7, 0x6D, 0x6D
	.byte 0x01, 0x8C, 0x8D, 0x8D, 0xB1, 0x64, 0xD5, 0xD5, 0x9C, 0xD2, 0x4E, 0x4E, 0x49, 0xE0, 0xA9, 0xA9
	.byte 0xD8, 0xB4, 0x6C, 0x6C, 0xAC, 0xFA, 0x56, 0x56, 0xF3, 0x07, 0xF4, 0xF4, 0xCF, 0x25, 0xEA, 0xEA
	.byte 0xCA, 0xAF, 0x65, 0x65, 0xF4, 0x8E, 0x7A, 0x7A, 0x47, 0xE9, 0xAE, 0xAE, 0x10, 0x18, 0x08, 0x08
	.byte 0x6F, 0xD5, 0xBA, 0xBA, 0xF0, 0x88, 0x78, 0x78, 0x4A, 0x6F, 0x25, 0x25, 0x5C, 0x72, 0x2E, 0x2E
	.byte 0x38, 0x24, 0x1C, 0x1C, 0x57, 0xF1, 0xA6, 0xA6, 0x73, 0xC7, 0xB4, 0xB4, 0x97, 0x51, 0xC6, 0xC6
	.byte 0xCB, 0x23, 0xE8, 0xE8, 0xA1, 0x7C, 0xDD, 0xDD, 0xE8, 0x9C, 0x74, 0x74, 0x3E, 0x21, 0x1F, 0x1F
	.byte 0x96, 0xDD, 0x4B, 0x4B, 0x61, 0xDC, 0xBD, 0xBD, 0x0D, 0x86, 0x8B, 0x8B, 0x0F, 0x85, 0x8A, 0x8A
	.byte 0xE0, 0x90, 0x70, 0x70, 0x7C, 0x42, 0x3E, 0x3E, 0x71, 0xC4, 0xB5, 0xB5, 0xCC, 0xAA, 0x66, 0x66
	.byte 0x90, 0xD8, 0x48, 0x48, 0x06, 0x05, 0x03, 0x03, 0xF7, 0x01, 0xF6, 0xF6, 0x1C, 0x12, 0x0E, 0x0E
	.byte 0xC2, 0xA3, 0x61, 0x61, 0x6A, 0x5F, 0x35, 0x35, 0xAE, 0xF9, 0x57, 0x57, 0x69, 0xD0, 0xB9, 0xB9
	.byte 0x17, 0x91, 0x86, 0x86, 0x99, 0x58, 0xC1, 0xC1, 0x3A, 0x27, 0x1D, 0x1D, 0x27, 0xB9, 0x9E, 0x9E
	.byte 0xD9, 0x38, 0xE1, 0xE1, 0xEB, 0x13, 0xF8, 0xF8, 0x2B, 0xB3, 0x98, 0x98, 0x22, 0x33, 0x11, 0x11
	.byte 0xD2, 0xBB, 0x69, 0x69, 0xA9, 0x70, 0xD9, 0xD9, 0x07, 0x89, 0x8E, 0x8E, 0x33, 0xA7, 0x94, 0x94
	.byte 0x2D, 0xB6, 0x9B, 0x9B, 0x3C, 0x22, 0x1E, 0x1E, 0x15, 0x92, 0x87, 0x87, 0xC9, 0x20, 0xE9, 0xE9
	.byte 0x87, 0x49, 0xCE, 0xCE, 0xAA, 0xFF, 0x55, 0x55, 0x50, 0x78, 0x28, 0x28, 0xA5, 0x7A, 0xDF, 0xDF
	.byte 0x03, 0x8F, 0x8C, 0x8C, 0x59, 0xF8, 0xA1, 0xA1, 0x09, 0x80, 0x89, 0x89, 0x1A, 0x17, 0x0D, 0x0D
	.byte 0x65, 0xDA, 0xBF, 0xBF, 0xD7, 0x31, 0xE6, 0xE6, 0x84, 0xC6, 0x42, 0x42, 0xD0, 0xB8, 0x68, 0x68
	.byte 0x82, 0xC3, 0x41, 0x41, 0x29, 0xB0, 0x99, 0x99, 0x5A, 0x77, 0x2D, 0x2D, 0x1E, 0x11, 0x0F, 0x0F
	.byte 0x7B, 0xCB, 0xB0, 0xB0, 0xA8, 0xFC, 0x54, 0x54, 0x6D, 0xD6, 0xBB, 0xBB, 0x2C, 0x3A, 0x16, 0x16
	.byte 0x63, 0x63, 0x63, 0x63, 0x7C, 0x7C, 0x7C, 0x7C, 0x77, 0x77, 0x77, 0x77, 0x7B, 0x7B, 0x7B, 0x7B
	.byte 0xF2, 0xF2, 0xF2, 0xF2, 0x6B, 0x6B, 0x6B, 0x6B, 0x6F, 0x6F, 0x6F, 0x6F, 0xC5, 0xC5, 0xC5, 0xC5
	.byte 0x30, 0x30, 0x30, 0x30, 0x01, 0x01, 0x01, 0x01, 0x67, 0x67, 0x67, 0x67, 0x2B, 0x2B, 0x2B, 0x2B
	.byte 0xFE, 0xFE, 0xFE, 0xFE, 0xD7, 0xD7, 0xD7, 0xD7, 0xAB, 0xAB, 0xAB, 0xAB, 0x76, 0x76, 0x76, 0x76
	.byte 0xCA, 0xCA, 0xCA, 0xCA, 0x82, 0x82, 0x82, 0x82, 0xC9, 0xC9, 0xC9, 0xC9, 0x7D, 0x7D, 0x7D, 0x7D
	.byte 0xFA, 0xFA, 0xFA, 0xFA, 0x59, 0x59, 0x59, 0x59, 0x47, 0x47, 0x47, 0x47, 0xF0, 0xF0, 0xF0, 0xF0
	.byte 0xAD, 0xAD, 0xAD, 0xAD, 0xD4, 0xD4, 0xD4, 0xD4, 0xA2, 0xA2, 0xA2, 0xA2, 0xAF, 0xAF, 0xAF, 0xAF
	.byte 0x9C, 0x9C, 0x9C, 0x9C, 0xA4, 0xA4, 0xA4, 0xA4, 0x72, 0x72, 0x72, 0x72, 0xC0, 0xC0, 0xC0, 0xC0
	.byte 0xB7, 0xB7, 0xB7, 0xB7, 0xFD, 0xFD, 0xFD, 0xFD, 0x93, 0x93, 0x93, 0x93, 0x26, 0x26, 0x26, 0x26
	.byte 0x36, 0x36, 0x36, 0x36, 0x3F, 0x3F, 0x3F, 0x3F, 0xF7, 0xF7, 0xF7, 0xF7, 0xCC, 0xCC, 0xCC, 0xCC
	.byte 0x34, 0x34, 0x34, 0x34, 0xA5, 0xA5, 0xA5, 0xA5, 0xE5, 0xE5, 0xE5, 0xE5, 0xF1, 0xF1, 0xF1, 0xF1
	.byte 0x71, 0x71, 0x71, 0x71, 0xD8, 0xD8, 0xD8, 0xD8, 0x31, 0x31, 0x31, 0x31, 0x15, 0x15, 0x15, 0x15
	.byte 0x04, 0x04, 0x04, 0x04, 0xC7, 0xC7, 0xC7, 0xC7, 0x23, 0x23, 0x23, 0x23, 0xC3, 0xC3, 0xC3, 0xC3
	.byte 0x18, 0x18, 0x18, 0x18, 0x96, 0x96, 0x96, 0x96, 0x05, 0x05, 0x05, 0x05, 0x9A, 0x9A, 0x9A, 0x9A
	.byte 0x07, 0x07, 0x07, 0x07, 0x12, 0x12, 0x12, 0x12, 0x80, 0x80, 0x80, 0x80, 0xE2, 0xE2, 0xE2, 0xE2
	.byte 0xEB, 0xEB, 0xEB, 0xEB, 0x27, 0x27, 0x27, 0x27, 0xB2, 0xB2, 0xB2, 0xB2, 0x75, 0x75, 0x75, 0x75
	.byte 0x09, 0x09, 0x09, 0x09, 0x83, 0x83, 0x83, 0x83, 0x2C, 0x2C, 0x2C, 0x2C, 0x1A, 0x1A, 0x1A, 0x1A
	.byte 0x1B, 0x1B, 0x1B, 0x1B, 0x6E, 0x6E, 0x6E, 0x6E, 0x5A, 0x5A, 0x5A, 0x5A, 0xA0, 0xA0, 0xA0, 0xA0
	.byte 0x52, 0x52, 0x52, 0x52, 0x3B, 0x3B, 0x3B, 0x3B, 0xD6, 0xD6, 0xD6, 0xD6, 0xB3, 0xB3, 0xB3, 0xB3
	.byte 0x29, 0x29, 0x29, 0x29, 0xE3, 0xE3, 0xE3, 0xE3, 0x2F, 0x2F, 0x2F, 0x2F, 0x84, 0x84, 0x84, 0x84
	.byte 0x53, 0x53, 0x53, 0x53, 0xD1, 0xD1, 0xD1, 0xD1, 0x00, 0x00, 0x00, 0x00, 0xED, 0xED, 0xED, 0xED
	.byte 0x20, 0x20, 0x20, 0x20, 0xFC, 0xFC, 0xFC, 0xFC, 0xB1, 0xB1, 0xB1, 0xB1, 0x5B, 0x5B, 0x5B, 0x5B
	.byte 0x6A, 0x6A, 0x6A, 0x6A, 0xCB, 0xCB, 0xCB, 0xCB, 0xBE, 0xBE, 0xBE, 0xBE, 0x39, 0x39, 0x39, 0x39
	.byte 0x4A, 0x4A, 0x4A, 0x4A, 0x4C, 0x4C, 0x4C, 0x4C, 0x58, 0x58, 0x58, 0x58, 0xCF, 0xCF, 0xCF, 0xCF
	.byte 0xD0, 0xD0, 0xD0, 0xD0, 0xEF, 0xEF, 0xEF, 0xEF, 0xAA, 0xAA, 0xAA, 0xAA, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x43, 0x43, 0x43, 0x43, 0x4D, 0x4D, 0x4D, 0x4D, 0x33, 0x33, 0x33, 0x33, 0x85, 0x85, 0x85, 0x85
	.byte 0x45, 0x45, 0x45, 0x45, 0xF9, 0xF9, 0xF9, 0xF9, 0x02, 0x02, 0x02, 0x02, 0x7F, 0x7F, 0x7F, 0x7F
	.byte 0x50, 0x50, 0x50, 0x50, 0x3C, 0x3C, 0x3C, 0x3C, 0x9F, 0x9F, 0x9F, 0x9F, 0xA8, 0xA8, 0xA8, 0xA8
	.byte 0x51, 0x51, 0x51, 0x51, 0xA3, 0xA3, 0xA3, 0xA3, 0x40, 0x40, 0x40, 0x40, 0x8F, 0x8F, 0x8F, 0x8F
	.byte 0x92, 0x92, 0x92, 0x92, 0x9D, 0x9D, 0x9D, 0x9D, 0x38, 0x38, 0x38, 0x38, 0xF5, 0xF5, 0xF5, 0xF5
	.byte 0xBC, 0xBC, 0xBC, 0xBC, 0xB6, 0xB6, 0xB6, 0xB6, 0xDA, 0xDA, 0xDA, 0xDA, 0x21, 0x21, 0x21, 0x21
	.byte 0x10, 0x10, 0x10, 0x10, 0xFF, 0xFF, 0xFF, 0xFF, 0xF3, 0xF3, 0xF3, 0xF3, 0xD2, 0xD2, 0xD2, 0xD2
	.byte 0xCD, 0xCD, 0xCD, 0xCD, 0x0C, 0x0C, 0x0C, 0x0C, 0x13, 0x13, 0x13, 0x13, 0xEC, 0xEC, 0xEC, 0xEC
	.byte 0x5F, 0x5F, 0x5F, 0x5F, 0x97, 0x97, 0x97, 0x97, 0x44, 0x44, 0x44, 0x44, 0x17, 0x17, 0x17, 0x17
	.byte 0xC4, 0xC4, 0xC4, 0xC4, 0xA7, 0xA7, 0xA7, 0xA7, 0x7E, 0x7E, 0x7E, 0x7E, 0x3D, 0x3D, 0x3D, 0x3D
	.byte 0x64, 0x64, 0x64, 0x64, 0x5D, 0x5D, 0x5D, 0x5D, 0x19, 0x19, 0x19, 0x19, 0x73, 0x73, 0x73, 0x73
	.byte 0x60, 0x60, 0x60, 0x60, 0x81, 0x81, 0x81, 0x81, 0x4F, 0x4F, 0x4F, 0x4F, 0xDC, 0xDC, 0xDC, 0xDC
	.byte 0x22, 0x22, 0x22, 0x22, 0x2A, 0x2A, 0x2A, 0x2A, 0x90, 0x90, 0x90, 0x90, 0x88, 0x88, 0x88, 0x88
	.byte 0x46, 0x46, 0x46, 0x46, 0xEE, 0xEE, 0xEE, 0xEE, 0xB8, 0xB8, 0xB8, 0xB8, 0x14, 0x14, 0x14, 0x14
	.byte 0xDE, 0xDE, 0xDE, 0xDE, 0x5E, 0x5E, 0x5E, 0x5E, 0x0B, 0x0B, 0x0B, 0x0B, 0xDB, 0xDB, 0xDB, 0xDB
	.byte 0xE0, 0xE0, 0xE0, 0xE0, 0x32, 0x32, 0x32, 0x32, 0x3A, 0x3A, 0x3A, 0x3A, 0x0A, 0x0A, 0x0A, 0x0A
	.byte 0x49, 0x49, 0x49, 0x49, 0x06, 0x06, 0x06, 0x06, 0x24, 0x24, 0x24, 0x24, 0x5C, 0x5C, 0x5C, 0x5C
	.byte 0xC2, 0xC2, 0xC2, 0xC2, 0xD3, 0xD3, 0xD3, 0xD3, 0xAC, 0xAC, 0xAC, 0xAC, 0x62, 0x62, 0x62, 0x62
	.byte 0x91, 0x91, 0x91, 0x91, 0x95, 0x95, 0x95, 0x95, 0xE4, 0xE4, 0xE4, 0xE4, 0x79, 0x79, 0x79, 0x79
	.byte 0xE7, 0xE7, 0xE7, 0xE7, 0xC8, 0xC8, 0xC8, 0xC8, 0x37, 0x37, 0x37, 0x37, 0x6D, 0x6D, 0x6D, 0x6D
	.byte 0x8D, 0x8D, 0x8D, 0x8D, 0xD5, 0xD5, 0xD5, 0xD5, 0x4E, 0x4E, 0x4E, 0x4E, 0xA9, 0xA9, 0xA9, 0xA9
	.byte 0x6C, 0x6C, 0x6C, 0x6C, 0x56, 0x56, 0x56, 0x56, 0xF4, 0xF4, 0xF4, 0xF4, 0xEA, 0xEA, 0xEA, 0xEA
	.byte 0x65, 0x65, 0x65, 0x65, 0x7A, 0x7A, 0x7A, 0x7A, 0xAE, 0xAE, 0xAE, 0xAE, 0x08, 0x08, 0x08, 0x08
	.byte 0xBA, 0xBA, 0xBA, 0xBA, 0x78, 0x78, 0x78, 0x78, 0x25, 0x25, 0x25, 0x25, 0x2E, 0x2E, 0x2E, 0x2E
	.byte 0x1C, 0x1C, 0x1C, 0x1C, 0xA6, 0xA6, 0xA6, 0xA6, 0xB4, 0xB4, 0xB4, 0xB4, 0xC6, 0xC6, 0xC6, 0xC6
	.byte 0xE8, 0xE8, 0xE8, 0xE8, 0xDD, 0xDD, 0xDD, 0xDD, 0x74, 0x74, 0x74, 0x74, 0x1F, 0x1F, 0x1F, 0x1F
	.byte 0x4B, 0x4B, 0x4B, 0x4B, 0xBD, 0xBD, 0xBD, 0xBD, 0x8B, 0x8B, 0x8B, 0x8B, 0x8A, 0x8A, 0x8A, 0x8A
	.byte 0x70, 0x70, 0x70, 0x70, 0x3E, 0x3E, 0x3E, 0x3E, 0xB5, 0xB5, 0xB5, 0xB5, 0x66, 0x66, 0x66, 0x66
	.byte 0x48, 0x48, 0x48, 0x48, 0x03, 0x03, 0x03, 0x03, 0xF6, 0xF6, 0xF6, 0xF6, 0x0E, 0x0E, 0x0E, 0x0E
	.byte 0x61, 0x61, 0x61, 0x61, 0x35, 0x35, 0x35, 0x35, 0x57, 0x57, 0x57, 0x57, 0xB9, 0xB9, 0xB9, 0xB9
	.byte 0x86, 0x86, 0x86, 0x86, 0xC1, 0xC1, 0xC1, 0xC1, 0x1D, 0x1D, 0x1D, 0x1D, 0x9E, 0x9E, 0x9E, 0x9E
	.byte 0xE1, 0xE1, 0xE1, 0xE1, 0xF8, 0xF8, 0xF8, 0xF8, 0x98, 0x98, 0x98, 0x98, 0x11, 0x11, 0x11, 0x11
	.byte 0x69, 0x69, 0x69, 0x69, 0xD9, 0xD9, 0xD9, 0xD9, 0x8E, 0x8E, 0x8E, 0x8E, 0x94, 0x94, 0x94, 0x94
	.byte 0x9B, 0x9B, 0x9B, 0x9B, 0x1E, 0x1E, 0x1E, 0x1E, 0x87, 0x87, 0x87, 0x87, 0xE9, 0xE9, 0xE9, 0xE9
	.byte 0xCE, 0xCE, 0xCE, 0xCE, 0x55, 0x55, 0x55, 0x55, 0x28, 0x28, 0x28, 0x28, 0xDF, 0xDF, 0xDF, 0xDF
	.byte 0x8C, 0x8C, 0x8C, 0x8C, 0xA1, 0xA1, 0xA1, 0xA1, 0x89, 0x89, 0x89, 0x89, 0x0D, 0x0D, 0x0D, 0x0D
	.byte 0xBF, 0xBF, 0xBF, 0xBF, 0xE6, 0xE6, 0xE6, 0xE6, 0x42, 0x42, 0x42, 0x42, 0x68, 0x68, 0x68, 0x68
	.byte 0x41, 0x41, 0x41, 0x41, 0x99, 0x99, 0x99, 0x99, 0x2D, 0x2D, 0x2D, 0x2D, 0x0F, 0x0F, 0x0F, 0x0F
	.byte 0xB0, 0xB0, 0xB0, 0xB0, 0x54, 0x54, 0x54, 0x54, 0xBB, 0xBB, 0xBB, 0xBB, 0x16, 0x16, 0x16, 0x16
	.byte 0x50, 0xA7, 0xF4, 0x51, 0x53, 0x65, 0x41, 0x7E, 0xC3, 0xA4, 0x17, 0x1A, 0x96, 0x5E, 0x27, 0x3A
	.byte 0xCB, 0x6B, 0xAB, 0x3B, 0xF1, 0x45, 0x9D, 0x1F, 0xAB, 0x58, 0xFA, 0xAC, 0x93, 0x03, 0xE3, 0x4B
	.byte 0x55, 0xFA, 0x30, 0x20, 0xF6, 0x6D, 0x76, 0xAD, 0x91, 0x76, 0xCC, 0x88, 0x25, 0x4C, 0x02, 0xF5
	.byte 0xFC, 0xD7, 0xE5, 0x4F, 0xD7, 0xCB, 0x2A, 0xC5, 0x80, 0x44, 0x35, 0x26, 0x8F, 0xA3, 0x62, 0xB5
	.byte 0x49, 0x5A, 0xB1, 0xDE, 0x67, 0x1B, 0xBA, 0x25, 0x98, 0x0E, 0xEA, 0x45, 0xE1, 0xC0, 0xFE, 0x5D
	.byte 0x02, 0x75, 0x2F, 0xC3, 0x12, 0xF0, 0x4C, 0x81, 0xA3, 0x97, 0x46, 0x8D, 0xC6, 0xF9, 0xD3, 0x6B
	.byte 0xE7, 0x5F, 0x8F, 0x03, 0x95, 0x9C, 0x92, 0x15, 0xEB, 0x7A, 0x6D, 0xBF, 0xDA, 0x59, 0x52, 0x95
	.byte 0x2D, 0x83, 0xBE, 0xD4, 0xD3, 0x21, 0x74, 0x58, 0x29, 0x69, 0xE0, 0x49, 0x44, 0xC8, 0xC9, 0x8E
	.byte 0x6A, 0x89, 0xC2, 0x75, 0x78, 0x79, 0x8E, 0xF4, 0x6B, 0x3E, 0x58, 0x99, 0xDD, 0x71, 0xB9, 0x27
	.byte 0xB6, 0x4F, 0xE1, 0xBE, 0x17, 0xAD, 0x88, 0xF0, 0x66, 0xAC, 0x20, 0xC9, 0xB4, 0x3A, 0xCE, 0x7D
	.byte 0x18, 0x4A, 0xDF, 0x63, 0x82, 0x31, 0x1A, 0xE5, 0x60, 0x33, 0x51, 0x97, 0x45, 0x7F, 0x53, 0x62
	.byte 0xE0, 0x77, 0x64, 0xB1, 0x84, 0xAE, 0x6B, 0xBB, 0x1C, 0xA0, 0x81, 0xFE, 0x94, 0x2B, 0x08, 0xF9
	.byte 0x58, 0x68, 0x48, 0x70, 0x19, 0xFD, 0x45, 0x8F, 0x87, 0x6C, 0xDE, 0x94, 0xB7, 0xF8, 0x7B, 0x52
	.byte 0x23, 0xD3, 0x73, 0xAB, 0xE2, 0x02, 0x4B, 0x72, 0x57, 0x8F, 0x1F, 0xE3, 0x2A, 0xAB, 0x55, 0x66
	.byte 0x07, 0x28, 0xEB, 0xB2, 0x03, 0xC2, 0xB5, 0x2F, 0x9A, 0x7B, 0xC5, 0x86, 0xA5, 0x08, 0x37, 0xD3
	.byte 0xF2, 0x87, 0x28, 0x30, 0xB2, 0xA5, 0xBF, 0x23, 0xBA, 0x6A, 0x03, 0x02, 0x5C, 0x82, 0x16, 0xED
	.byte 0x2B, 0x1C, 0xCF, 0x8A, 0x92, 0xB4, 0x79, 0xA7, 0xF0, 0xF2, 0x07, 0xF3, 0xA1, 0xE2, 0x69, 0x4E
	.byte 0xCD, 0xF4, 0xDA, 0x65, 0xD5, 0xBE, 0x05, 0x06, 0x1F, 0x62, 0x34, 0xD1, 0x8A, 0xFE, 0xA6, 0xC4
	.byte 0x9D, 0x53, 0x2E, 0x34, 0xA0, 0x55, 0xF3, 0xA2, 0x32, 0xE1, 0x8A, 0x05, 0x75, 0xEB, 0xF6, 0xA4
	.byte 0x39, 0xEC, 0x83, 0x0B, 0xAA, 0xEF, 0x60, 0x40, 0x06, 0x9F, 0x71, 0x5E, 0x51, 0x10, 0x6E, 0xBD
	.byte 0xF9, 0x8A, 0x21, 0x3E, 0x3D, 0x06, 0xDD, 0x96, 0xAE, 0x05, 0x3E, 0xDD, 0x46, 0xBD, 0xE6, 0x4D
	.byte 0xB5, 0x8D, 0x54, 0x91, 0x05, 0x5D, 0xC4, 0x71, 0x6F, 0xD4, 0x06, 0x04, 0xFF, 0x15, 0x50, 0x60
	.byte 0x24, 0xFB, 0x98, 0x19, 0x97, 0xE9, 0xBD, 0xD6, 0xCC, 0x43, 0x40, 0x89, 0x77, 0x9E, 0xD9, 0x67
	.byte 0xBD, 0x42, 0xE8, 0xB0, 0x88, 0x8B, 0x89, 0x07, 0x38, 0x5B, 0x19, 0xE7, 0xDB, 0xEE, 0xC8, 0x79
	.byte 0x47, 0x0A, 0x7C, 0xA1, 0xE9, 0x0F, 0x42, 0x7C, 0xC9, 0x1E, 0x84, 0xF8, 0x00, 0x00, 0x00, 0x00
	.byte 0x83, 0x86, 0x80, 0x09, 0x48, 0xED, 0x2B, 0x32, 0xAC, 0x70, 0x11, 0x1E, 0x4E, 0x72, 0x5A, 0x6C
	.byte 0xFB, 0xFF, 0x0E, 0xFD, 0x56, 0x38, 0x85, 0x0F, 0x1E, 0xD5, 0xAE, 0x3D, 0x27, 0x39, 0x2D, 0x36
	.byte 0x64, 0xD9, 0x0F, 0x0A, 0x21, 0xA6, 0x5C, 0x68, 0xD1, 0x54, 0x5B, 0x9B, 0x3A, 0x2E, 0x36, 0x24
	.byte 0xB1, 0x67, 0x0A, 0x0C, 0x0F, 0xE7, 0x57, 0x93, 0xD2, 0x96, 0xEE, 0xB4, 0x9E, 0x91, 0x9B, 0x1B
	.byte 0x4F, 0xC5, 0xC0, 0x80, 0xA2, 0x20, 0xDC, 0x61, 0x69, 0x4B, 0x77, 0x5A, 0x16, 0x1A, 0x12, 0x1C
	.byte 0x0A, 0xBA, 0x93, 0xE2, 0xE5, 0x2A, 0xA0, 0xC0, 0x43, 0xE0, 0x22, 0x3C, 0x1D, 0x17, 0x1B, 0x12
	.byte 0x0B, 0x0D, 0x09, 0x0E, 0xAD, 0xC7, 0x8B, 0xF2, 0xB9, 0xA8, 0xB6, 0x2D, 0xC8, 0xA9, 0x1E, 0x14
	.byte 0x85, 0x19, 0xF1, 0x57, 0x4C, 0x07, 0x75, 0xAF, 0xBB, 0xDD, 0x99, 0xEE, 0xFD, 0x60, 0x7F, 0xA3
	.byte 0x9F, 0x26, 0x01, 0xF7, 0xBC, 0xF5, 0x72, 0x5C, 0xC5, 0x3B, 0x66, 0x44, 0x34, 0x7E, 0xFB, 0x5B
	.byte 0x76, 0x29, 0x43, 0x8B, 0xDC, 0xC6, 0x23, 0xCB, 0x68, 0xFC, 0xED, 0xB6, 0x63, 0xF1, 0xE4, 0xB8
	.byte 0xCA, 0xDC, 0x31, 0xD7, 0x10, 0x85, 0x63, 0x42, 0x40, 0x22, 0x97, 0x13, 0x20, 0x11, 0xC6, 0x84
	.byte 0x7D, 0x24, 0x4A, 0x85, 0xF8, 0x3D, 0xBB, 0xD2, 0x11, 0x32, 0xF9, 0xAE, 0x6D, 0xA1, 0x29, 0xC7
	.byte 0x4B, 0x2F, 0x9E, 0x1D, 0xF3, 0x30, 0xB2, 0xDC, 0xEC, 0x52, 0x86, 0x0D, 0xD0, 0xE3, 0xC1, 0x77
	.byte 0x6C, 0x16, 0xB3, 0x2B, 0x99, 0xB9, 0x70, 0xA9, 0xFA, 0x48, 0x94, 0x11, 0x22, 0x64, 0xE9, 0x47
	.byte 0xC4, 0x8C, 0xFC, 0xA8, 0x1A, 0x3F, 0xF0, 0xA0, 0xD8, 0x2C, 0x7D, 0x56, 0xEF, 0x90, 0x33, 0x22
	.byte 0xC7, 0x4E, 0x49, 0x87, 0xC1, 0xD1, 0x38, 0xD9, 0xFE, 0xA2, 0xCA, 0x8C, 0x36, 0x0B, 0xD4, 0x98
	.byte 0xCF, 0x81, 0xF5, 0xA6, 0x28, 0xDE, 0x7A, 0xA5, 0x26, 0x8E, 0xB7, 0xDA, 0xA4, 0xBF, 0xAD, 0x3F
	.byte 0xE4, 0x9D, 0x3A, 0x2C, 0x0D, 0x92, 0x78, 0x50, 0x9B, 0xCC, 0x5F, 0x6A, 0x62, 0x46, 0x7E, 0x54
	.byte 0xC2, 0x13, 0x8D, 0xF6, 0xE8, 0xB8, 0xD8, 0x90, 0x5E, 0xF7, 0x39, 0x2E, 0xF5, 0xAF, 0xC3, 0x82
	.byte 0xBE, 0x80, 0x5D, 0x9F, 0x7C, 0x93, 0xD0, 0x69, 0xA9, 0x2D, 0xD5, 0x6F, 0xB3, 0x12, 0x25, 0xCF
	.byte 0x3B, 0x99, 0xAC, 0xC8, 0xA7, 0x7D, 0x18, 0x10, 0x6E, 0x63, 0x9C, 0xE8, 0x7B, 0xBB, 0x3B, 0xDB
	.byte 0x09, 0x78, 0x26, 0xCD, 0xF4, 0x18, 0x59, 0x6E, 0x01, 0xB7, 0x9A, 0xEC, 0xA8, 0x9A, 0x4F, 0x83
	.byte 0x65, 0x6E, 0x95, 0xE6, 0x7E, 0xE6, 0xFF, 0xAA, 0x08, 0xCF, 0xBC, 0x21, 0xE6, 0xE8, 0x15, 0xEF
	.byte 0xD9, 0x9B, 0xE7, 0xBA, 0xCE, 0x36, 0x6F, 0x4A, 0xD4, 0x09, 0x9F, 0xEA, 0xD6, 0x7C, 0xB0, 0x29
	.byte 0xAF, 0xB2, 0xA4, 0x31, 0x31, 0x23, 0x3F, 0x2A, 0x30, 0x94, 0xA5, 0xC6, 0xC0, 0x66, 0xA2, 0x35
	.byte 0x37, 0xBC, 0x4E, 0x74, 0xA6, 0xCA, 0x82, 0xFC, 0xB0, 0xD0, 0x90, 0xE0, 0x15, 0xD8, 0xA7, 0x33
	.byte 0x4A, 0x98, 0x04, 0xF1, 0xF7, 0xDA, 0xEC, 0x41, 0x0E, 0x50, 0xCD, 0x7F, 0x2F, 0xF6, 0x91, 0x17
	.byte 0x8D, 0xD6, 0x4D, 0x76, 0x4D, 0xB0, 0xEF, 0x43, 0x54, 0x4D, 0xAA, 0xCC, 0xDF, 0x04, 0x96, 0xE4
	.byte 0xE3, 0xB5, 0xD1, 0x9E, 0x1B, 0x88, 0x6A, 0x4C, 0xB8, 0x1F, 0x2C, 0xC1, 0x7F, 0x51, 0x65, 0x46
	.byte 0x04, 0xEA, 0x5E, 0x9D, 0x5D, 0x35, 0x8C, 0x01, 0x73, 0x74, 0x87, 0xFA, 0x2E, 0x41, 0x0B, 0xFB
	.byte 0x5A, 0x1D, 0x67, 0xB3, 0x52, 0xD2, 0xDB, 0x92, 0x33, 0x56, 0x10, 0xE9, 0x13, 0x47, 0xD6, 0x6D
	.byte 0x8C, 0x61, 0xD7, 0x9A, 0x7A, 0x0C, 0xA1, 0x37, 0x8E, 0x14, 0xF8, 0x59, 0x89, 0x3C, 0x13, 0xEB
	.byte 0xEE, 0x27, 0xA9, 0xCE, 0x35, 0xC9, 0x61, 0xB7, 0xED, 0xE5, 0x1C, 0xE1, 0x3C, 0xB1, 0x47, 0x7A
	.byte 0x59, 0xDF, 0xD2, 0x9C, 0x3F, 0x73, 0xF2, 0x55, 0x79, 0xCE, 0x14, 0x18, 0xBF, 0x37, 0xC7, 0x73
	.byte 0xEA, 0xCD, 0xF7, 0x53, 0x5B, 0xAA, 0xFD, 0x5F, 0x14, 0x6F, 0x3D, 0xDF, 0x86, 0xDB, 0x44, 0x78
	.byte 0x81, 0xF3, 0xAF, 0xCA, 0x3E, 0xC4, 0x68, 0xB9, 0x2C, 0x34, 0x24, 0x38, 0x5F, 0x40, 0xA3, 0xC2
	.byte 0x72, 0xC3, 0x1D, 0x16, 0x0C, 0x25, 0xE2, 0xBC, 0x8B, 0x49, 0x3C, 0x28, 0x41, 0x95, 0x0D, 0xFF
	.byte 0x71, 0x01, 0xA8, 0x39, 0xDE, 0xB3, 0x0C, 0x08, 0x9C, 0xE4, 0xB4, 0xD8, 0x90, 0xC1, 0x56, 0x64
	.byte 0x61, 0x84, 0xCB, 0x7B, 0x70, 0xB6, 0x32, 0xD5, 0x74, 0x5C, 0x6C, 0x48, 0x42, 0x57, 0xB8, 0xD0
	.byte 0xA7, 0xF4, 0x51, 0x50, 0x65, 0x41, 0x7E, 0x53, 0xA4, 0x17, 0x1A, 0xC3, 0x5E, 0x27, 0x3A, 0x96
	.byte 0x6B, 0xAB, 0x3B, 0xCB, 0x45, 0x9D, 0x1F, 0xF1, 0x58, 0xFA, 0xAC, 0xAB, 0x03, 0xE3, 0x4B, 0x93
	.byte 0xFA, 0x30, 0x20, 0x55, 0x6D, 0x76, 0xAD, 0xF6, 0x76, 0xCC, 0x88, 0x91, 0x4C, 0x02, 0xF5, 0x25
	.byte 0xD7, 0xE5, 0x4F, 0xFC, 0xCB, 0x2A, 0xC5, 0xD7, 0x44, 0x35, 0x26, 0x80, 0xA3, 0x62, 0xB5, 0x8F
	.byte 0x5A, 0xB1, 0xDE, 0x49, 0x1B, 0xBA, 0x25, 0x67, 0x0E, 0xEA, 0x45, 0x98, 0xC0, 0xFE, 0x5D, 0xE1
	.byte 0x75, 0x2F, 0xC3, 0x02, 0xF0, 0x4C, 0x81, 0x12, 0x97, 0x46, 0x8D, 0xA3, 0xF9, 0xD3, 0x6B, 0xC6
	.byte 0x5F, 0x8F, 0x03, 0xE7, 0x9C, 0x92, 0x15, 0x95, 0x7A, 0x6D, 0xBF, 0xEB, 0x59, 0x52, 0x95, 0xDA
	.byte 0x83, 0xBE, 0xD4, 0x2D, 0x21, 0x74, 0x58, 0xD3, 0x69, 0xE0, 0x49, 0x29, 0xC8, 0xC9, 0x8E, 0x44
	.byte 0x89, 0xC2, 0x75, 0x6A, 0x79, 0x8E, 0xF4, 0x78, 0x3E, 0x58, 0x99, 0x6B, 0x71, 0xB9, 0x27, 0xDD
	.byte 0x4F, 0xE1, 0xBE, 0xB6, 0xAD, 0x88, 0xF0, 0x17, 0xAC, 0x20, 0xC9, 0x66, 0x3A, 0xCE, 0x7D, 0xB4
	.byte 0x4A, 0xDF, 0x63, 0x18, 0x31, 0x1A, 0xE5, 0x82, 0x33, 0x51, 0x97, 0x60, 0x7F, 0x53, 0x62, 0x45
	.byte 0x77, 0x64, 0xB1, 0xE0, 0xAE, 0x6B, 0xBB, 0x84, 0xA0, 0x81, 0xFE, 0x1C, 0x2B, 0x08, 0xF9, 0x94
	.byte 0x68, 0x48, 0x70, 0x58, 0xFD, 0x45, 0x8F, 0x19, 0x6C, 0xDE, 0x94, 0x87, 0xF8, 0x7B, 0x52, 0xB7
	.byte 0xD3, 0x73, 0xAB, 0x23, 0x02, 0x4B, 0x72, 0xE2, 0x8F, 0x1F, 0xE3, 0x57, 0xAB, 0x55, 0x66, 0x2A
	.byte 0x28, 0xEB, 0xB2, 0x07, 0xC2, 0xB5, 0x2F, 0x03, 0x7B, 0xC5, 0x86, 0x9A, 0x08, 0x37, 0xD3, 0xA5
	.byte 0x87, 0x28, 0x30, 0xF2, 0xA5, 0xBF, 0x23, 0xB2, 0x6A, 0x03, 0x02, 0xBA, 0x82, 0x16, 0xED, 0x5C
	.byte 0x1C, 0xCF, 0x8A, 0x2B, 0xB4, 0x79, 0xA7, 0x92, 0xF2, 0x07, 0xF3, 0xF0, 0xE2, 0x69, 0x4E, 0xA1
	.byte 0xF4, 0xDA, 0x65, 0xCD, 0xBE, 0x05, 0x06, 0xD5, 0x62, 0x34, 0xD1, 0x1F, 0xFE, 0xA6, 0xC4, 0x8A
	.byte 0x53, 0x2E, 0x34, 0x9D, 0x55, 0xF3, 0xA2, 0xA0, 0xE1, 0x8A, 0x05, 0x32, 0xEB, 0xF6, 0xA4, 0x75
	.byte 0xEC, 0x83, 0x0B, 0x39, 0xEF, 0x60, 0x40, 0xAA, 0x9F, 0x71, 0x5E, 0x06, 0x10, 0x6E, 0xBD, 0x51
	.byte 0x8A, 0x21, 0x3E, 0xF9, 0x06, 0xDD, 0x96, 0x3D, 0x05, 0x3E, 0xDD, 0xAE, 0xBD, 0xE6, 0x4D, 0x46
	.byte 0x8D, 0x54, 0x91, 0xB5, 0x5D, 0xC4, 0x71, 0x05, 0xD4, 0x06, 0x04, 0x6F, 0x15, 0x50, 0x60, 0xFF
	.byte 0xFB, 0x98, 0x19, 0x24, 0xE9, 0xBD, 0xD6, 0x97, 0x43, 0x40, 0x89, 0xCC, 0x9E, 0xD9, 0x67, 0x77
	.byte 0x42, 0xE8, 0xB0, 0xBD, 0x8B, 0x89, 0x07, 0x88, 0x5B, 0x19, 0xE7, 0x38, 0xEE, 0xC8, 0x79, 0xDB
	.byte 0x0A, 0x7C, 0xA1, 0x47, 0x0F, 0x42, 0x7C, 0xE9, 0x1E, 0x84, 0xF8, 0xC9, 0x00, 0x00, 0x00, 0x00
	.byte 0x86, 0x80, 0x09, 0x83, 0xED, 0x2B, 0x32, 0x48, 0x70, 0x11, 0x1E, 0xAC, 0x72, 0x5A, 0x6C, 0x4E
	.byte 0xFF, 0x0E, 0xFD, 0xFB, 0x38, 0x85, 0x0F, 0x56, 0xD5, 0xAE, 0x3D, 0x1E, 0x39, 0x2D, 0x36, 0x27
	.byte 0xD9, 0x0F, 0x0A, 0x64, 0xA6, 0x5C, 0x68, 0x21, 0x54, 0x5B, 0x9B, 0xD1, 0x2E, 0x36, 0x24, 0x3A
	.byte 0x67, 0x0A, 0x0C, 0xB1, 0xE7, 0x57, 0x93, 0x0F, 0x96, 0xEE, 0xB4, 0xD2, 0x91, 0x9B, 0x1B, 0x9E
	.byte 0xC5, 0xC0, 0x80, 0x4F, 0x20, 0xDC, 0x61, 0xA2, 0x4B, 0x77, 0x5A, 0x69, 0x1A, 0x12, 0x1C, 0x16
	.byte 0xBA, 0x93, 0xE2, 0x0A, 0x2A, 0xA0, 0xC0, 0xE5, 0xE0, 0x22, 0x3C, 0x43, 0x17, 0x1B, 0x12, 0x1D
	.byte 0x0D, 0x09, 0x0E, 0x0B, 0xC7, 0x8B, 0xF2, 0xAD, 0xA8, 0xB6, 0x2D, 0xB9, 0xA9, 0x1E, 0x14, 0xC8
	.byte 0x19, 0xF1, 0x57, 0x85, 0x07, 0x75, 0xAF, 0x4C, 0xDD, 0x99, 0xEE, 0xBB, 0x60, 0x7F, 0xA3, 0xFD
	.byte 0x26, 0x01, 0xF7, 0x9F, 0xF5, 0x72, 0x5C, 0xBC, 0x3B, 0x66, 0x44, 0xC5, 0x7E, 0xFB, 0x5B, 0x34
	.byte 0x29, 0x43, 0x8B, 0x76, 0xC6, 0x23, 0xCB, 0xDC, 0xFC, 0xED, 0xB6, 0x68, 0xF1, 0xE4, 0xB8, 0x63
	.byte 0xDC, 0x31, 0xD7, 0xCA, 0x85, 0x63, 0x42, 0x10, 0x22, 0x97, 0x13, 0x40, 0x11, 0xC6, 0x84, 0x20
	.byte 0x24, 0x4A, 0x85, 0x7D, 0x3D, 0xBB, 0xD2, 0xF8, 0x32, 0xF9, 0xAE, 0x11, 0xA1, 0x29, 0xC7, 0x6D
	.byte 0x2F, 0x9E, 0x1D, 0x4B, 0x30, 0xB2, 0xDC, 0xF3, 0x52, 0x86, 0x0D, 0xEC, 0xE3, 0xC1, 0x77, 0xD0
	.byte 0x16, 0xB3, 0x2B, 0x6C, 0xB9, 0x70, 0xA9, 0x99, 0x48, 0x94, 0x11, 0xFA, 0x64, 0xE9, 0x47, 0x22
	.byte 0x8C, 0xFC, 0xA8, 0xC4, 0x3F, 0xF0, 0xA0, 0x1A, 0x2C, 0x7D, 0x56, 0xD8, 0x90, 0x33, 0x22, 0xEF
	.byte 0x4E, 0x49, 0x87, 0xC7, 0xD1, 0x38, 0xD9, 0xC1, 0xA2, 0xCA, 0x8C, 0xFE, 0x0B, 0xD4, 0x98, 0x36
	.byte 0x81, 0xF5, 0xA6, 0xCF, 0xDE, 0x7A, 0xA5, 0x28, 0x8E, 0xB7, 0xDA, 0x26, 0xBF, 0xAD, 0x3F, 0xA4
	.byte 0x9D, 0x3A, 0x2C, 0xE4, 0x92, 0x78, 0x50, 0x0D, 0xCC, 0x5F, 0x6A, 0x9B, 0x46, 0x7E, 0x54, 0x62
	.byte 0x13, 0x8D, 0xF6, 0xC2, 0xB8, 0xD8, 0x90, 0xE8, 0xF7, 0x39, 0x2E, 0x5E, 0xAF, 0xC3, 0x82, 0xF5
	.byte 0x80, 0x5D, 0x9F, 0xBE, 0x93, 0xD0, 0x69, 0x7C, 0x2D, 0xD5, 0x6F, 0xA9, 0x12, 0x25, 0xCF, 0xB3
	.byte 0x99, 0xAC, 0xC8, 0x3B, 0x7D, 0x18, 0x10, 0xA7, 0x63, 0x9C, 0xE8, 0x6E, 0xBB, 0x3B, 0xDB, 0x7B
	.byte 0x78, 0x26, 0xCD, 0x09, 0x18, 0x59, 0x6E, 0xF4, 0xB7, 0x9A, 0xEC, 0x01, 0x9A, 0x4F, 0x83, 0xA8
	.byte 0x6E, 0x95, 0xE6, 0x65, 0xE6, 0xFF, 0xAA, 0x7E, 0xCF, 0xBC, 0x21, 0x08, 0xE8, 0x15, 0xEF, 0xE6
	.byte 0x9B, 0xE7, 0xBA, 0xD9, 0x36, 0x6F, 0x4A, 0xCE, 0x09, 0x9F, 0xEA, 0xD4, 0x7C, 0xB0, 0x29, 0xD6
	.byte 0xB2, 0xA4, 0x31, 0xAF, 0x23, 0x3F, 0x2A, 0x31, 0x94, 0xA5, 0xC6, 0x30, 0x66, 0xA2, 0x35, 0xC0
	.byte 0xBC, 0x4E, 0x74, 0x37, 0xCA, 0x82, 0xFC, 0xA6, 0xD0, 0x90, 0xE0, 0xB0, 0xD8, 0xA7, 0x33, 0x15
	.byte 0x98, 0x04, 0xF1, 0x4A, 0xDA, 0xEC, 0x41, 0xF7, 0x50, 0xCD, 0x7F, 0x0E, 0xF6, 0x91, 0x17, 0x2F
	.byte 0xD6, 0x4D, 0x76, 0x8D, 0xB0, 0xEF, 0x43, 0x4D, 0x4D, 0xAA, 0xCC, 0x54, 0x04, 0x96, 0xE4, 0xDF
	.byte 0xB5, 0xD1, 0x9E, 0xE3, 0x88, 0x6A, 0x4C, 0x1B, 0x1F, 0x2C, 0xC1, 0xB8, 0x51, 0x65, 0x46, 0x7F
	.byte 0xEA, 0x5E, 0x9D, 0x04, 0x35, 0x8C, 0x01, 0x5D, 0x74, 0x87, 0xFA, 0x73, 0x41, 0x0B, 0xFB, 0x2E
	.byte 0x1D, 0x67, 0xB3, 0x5A, 0xD2, 0xDB, 0x92, 0x52, 0x56, 0x10, 0xE9, 0x33, 0x47, 0xD6, 0x6D, 0x13
	.byte 0x61, 0xD7, 0x9A, 0x8C, 0x0C, 0xA1, 0x37, 0x7A, 0x14, 0xF8, 0x59, 0x8E, 0x3C, 0x13, 0xEB, 0x89
	.byte 0x27, 0xA9, 0xCE, 0xEE, 0xC9, 0x61, 0xB7, 0x35, 0xE5, 0x1C, 0xE1, 0xED, 0xB1, 0x47, 0x7A, 0x3C
	.byte 0xDF, 0xD2, 0x9C, 0x59, 0x73, 0xF2, 0x55, 0x3F, 0xCE, 0x14, 0x18, 0x79, 0x37, 0xC7, 0x73, 0xBF
	.byte 0xCD, 0xF7, 0x53, 0xEA, 0xAA, 0xFD, 0x5F, 0x5B, 0x6F, 0x3D, 0xDF, 0x14, 0xDB, 0x44, 0x78, 0x86
	.byte 0xF3, 0xAF, 0xCA, 0x81, 0xC4, 0x68, 0xB9, 0x3E, 0x34, 0x24, 0x38, 0x2C, 0x40, 0xA3, 0xC2, 0x5F
	.byte 0xC3, 0x1D, 0x16, 0x72, 0x25, 0xE2, 0xBC, 0x0C, 0x49, 0x3C, 0x28, 0x8B, 0x95, 0x0D, 0xFF, 0x41
	.byte 0x01, 0xA8, 0x39, 0x71, 0xB3, 0x0C, 0x08, 0xDE, 0xE4, 0xB4, 0xD8, 0x9C, 0xC1, 0x56, 0x64, 0x90
	.byte 0x84, 0xCB, 0x7B, 0x61, 0xB6, 0x32, 0xD5, 0x70, 0x5C, 0x6C, 0x48, 0x74, 0x57, 0xB8, 0xD0, 0x42

	.data

_022459B0:
	.byte 0x09, 0x08, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x01
	.byte 0xA5, 0x28, 0x22, 0x02, 0xBD, 0x28, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x45, 0x53, 0x53, 0x49, 0x44, 0x2D, 0x41, 0x4F, 0x53, 0x53, 0x00, 0x00
	.byte 0x4D, 0x45, 0x4C, 0x43, 0x4F, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x0B, 0x00, 0x08, 0x00, 0x0C, 0x00, 0x10, 0x00, 0x12, 0x00, 0x20, 0x00, 0x16, 0x00
	.byte 0x40, 0x00, 0x18, 0x00, 0x80, 0x00, 0x24, 0x00, 0x00, 0x01, 0x30, 0x00, 0x00, 0x02, 0x48, 0x00
	.byte 0x00, 0x04, 0x60, 0x00, 0x00, 0x08, 0x6C, 0x00, 0x6C, 0xE4, 0x24, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01
	.byte 0xED, 0x3D, 0x22, 0x02, 0x1D, 0x3E, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xA8, 0x00, 0xB0
	.byte 0xFF, 0xFF, 0xFF, 0x00, 0xC0, 0xA8, 0x00, 0xC8, 0xC0, 0xA8, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xCC, 0x5A, 0x24, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x2A, 0x2A, 0x2A, 0x2A, 0x2A, 0x2A, 0x00, 0x00, 0x4E, 0x49, 0x4E, 0x54
	.byte 0x45, 0x4E, 0x44, 0x4F, 0x2D, 0x44, 0x53, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x57, 0x41, 0x52, 0x50, 0x00, 0x00, 0x00, 0x00

	.bss

_0224CF98:
	.space 0x24CC
