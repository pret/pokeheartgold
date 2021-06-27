
	thumb_func_start ov59_02237D40
ov59_02237D40: @ 0x02237D40
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r1, [r5]
	adds r6, r0, #0
	cmp r1, #0
	beq _02237D52
	cmp r1, #1
	beq _02237D94
	b _02237DA4
_02237D52:
	bl ov59_02238624
	movs r2, #2
	movs r0, #3
	movs r1, #0x86
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r1, #0xa7
	adds r0, r6, #0
	lsls r1, r1, #2
	movs r2, #0x86
	bl FUN_02007280
	movs r2, #0xa7
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x86
	str r0, [r4]
	adds r0, r6, #0
	bl FUN_020072A4
	str r0, [r4, #4]
	adds r0, r4, #0
	bl ov59_02237E94
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02237DA4
_02237D94:
	bl FUN_02007290
	bl ov59_02237F3C
	cmp r0, #0
	beq _02237DA4
	movs r0, #1
	pop {r4, r5, r6, pc}
_02237DA4:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_02237D40

	thumb_func_start ov59_02237DA8
ov59_02237DA8: @ 0x02237DA8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #0x10
	bhi _02237E5A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02237DC4: @ jump table
	.2byte _02237DE6 - _02237DC4 - 2 @ case 0
	.2byte _02237DEE - _02237DC4 - 2 @ case 1
	.2byte _02237DF6 - _02237DC4 - 2 @ case 2
	.2byte _02237DFE - _02237DC4 - 2 @ case 3
	.2byte _02237E06 - _02237DC4 - 2 @ case 4
	.2byte _02237E0E - _02237DC4 - 2 @ case 5
	.2byte _02237E16 - _02237DC4 - 2 @ case 6
	.2byte _02237E1E - _02237DC4 - 2 @ case 7
	.2byte _02237E26 - _02237DC4 - 2 @ case 8
	.2byte _02237E2E - _02237DC4 - 2 @ case 9
	.2byte _02237E36 - _02237DC4 - 2 @ case 10
	.2byte _02237E3E - _02237DC4 - 2 @ case 11
	.2byte _02237E5A - _02237DC4 - 2 @ case 12
	.2byte _02237E5A - _02237DC4 - 2 @ case 13
	.2byte _02237E46 - _02237DC4 - 2 @ case 14
	.2byte _02237E4E - _02237DC4 - 2 @ case 15
	.2byte _02237E56 - _02237DC4 - 2 @ case 16
_02237DE6:
	bl ov59_02237FA4
	str r0, [r4]
	b _02237E5A
_02237DEE:
	bl ov59_0223801C
	str r0, [r4]
	b _02237E5A
_02237DF6:
	bl ov59_02238068
	str r0, [r4]
	b _02237E5A
_02237DFE:
	bl ov59_022380E4
	str r0, [r4]
	b _02237E5A
_02237E06:
	bl ov59_022380EC
	str r0, [r4]
	b _02237E5A
_02237E0E:
	bl ov59_0223811C
	str r0, [r4]
	b _02237E5A
_02237E16:
	bl ov59_02238124
	str r0, [r4]
	b _02237E5A
_02237E1E:
	bl ov59_02238218
	str r0, [r4]
	b _02237E5A
_02237E26:
	bl ov59_022382F4
	str r0, [r4]
	b _02237E5A
_02237E2E:
	bl ov59_0223834C
	str r0, [r4]
	b _02237E5A
_02237E36:
	bl ov59_022383B4
	str r0, [r4]
	b _02237E5A
_02237E3E:
	bl ov59_022384E4
	str r0, [r4]
	b _02237E5A
_02237E46:
	bl ov59_02238578
	str r0, [r4]
	b _02237E5A
_02237E4E:
	bl ov59_0223858C
	str r0, [r4]
	b _02237E5A
_02237E56:
	movs r0, #1
	pop {r3, r4, r5, pc}
_02237E5A:
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200D020
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov59_02237DA8

	thumb_func_start ov59_02237E68
ov59_02237E68: @ 0x02237E68
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov59_02237F74
	cmp r0, #0
	bne _02237E7E
	movs r0, #0
	pop {r3, r4, r5, pc}
_02237E7E:
	adds r0, r4, #0
	bl ov59_02237F28
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x86
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov59_02237E68

	thumb_func_start ov59_02237E94
ov59_02237E94: @ 0x02237E94
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x14]
	bl FUN_020183F0
	str r0, [r5, #0x40]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x18]
	bl FUN_02028EA8
	adds r4, r0, #0
	bl FUN_0202AD3C
	adds r1, r5, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r4, #0
	bl FUN_0202ADCC
	adds r1, r5, #0
	adds r1, #0x46
	strb r0, [r1]
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x18]
	adds r0, r5, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x10]
	str r0, [r5, #0x38]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x18]
	bl FUN_02031B14
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl ov59_02238768
	adds r0, r5, #0
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #3
	bne _02237F24
	adds r0, r5, #0
	movs r1, #2
	adds r0, #0x49
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x4a
	strb r1, [r0]
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x1a]
	adds r0, r5, #0
	adds r0, #0x4b
	strb r1, [r0]
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x1b]
	adds r0, r5, #0
	adds r0, #0x4c
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, [r5, #4]
	strb r1, [r0, #0x18]
_02237F24:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov59_02237E94

	thumb_func_start ov59_02237F28
ov59_02237F28: @ 0x02237F28
	adds r1, r0, #0
	ldr r0, [r1, #4]
	ldr r3, _02237F38 @ =FUN_02018410
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x40]
	ldr r0, [r0, #0x14]
	bx r3
	nop
_02237F38: .4byte FUN_02018410
	thumb_func_end ov59_02237F28

	thumb_func_start ov59_02237F3C
ov59_02237F3C: @ 0x02237F3C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	beq _02237F4C
	cmp r1, #1
	beq _02237F58
	b _02237F6E
_02237F4C:
	bl ov59_02238674
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02237F6E
_02237F58:
	bl ov59_022386D0
	bl FUN_020210BC
	movs r0, #1
	bl FUN_02021148
	movs r0, #0
	strh r0, [r4, #0x3c]
	movs r0, #1
	pop {r4, pc}
_02237F6E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_02237F3C

	thumb_func_start ov59_02237F74
ov59_02237F74: @ 0x02237F74
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _02237F82
	cmp r0, #1
	b _02237F94
_02237F82:
	bl FUN_02021238
	adds r0, r4, #0
	bl ov59_022386A8
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02237FA0
_02237F94:
	bl ov59_02238624
	movs r0, #0
	strh r0, [r4, #0x3c]
	movs r0, #1
	pop {r4, pc}
_02237FA0:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov59_02237F74

	thumb_func_start ov59_02237FA4
ov59_02237FA4: @ 0x02237FA4
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _02237FB6
	cmp r0, #1
	beq _02237FD4
	b _02238016
_02237FB6:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238016
_02237FD4:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02238016
	movs r0, #0
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	beq _02238010
	cmp r0, #1
	beq _02237FF4
	cmp r0, #2
	beq _0223800A
	b _02238010
_02237FF4:
	ldr r0, [r4, #0x10]
	bl FUN_02031C00
	cmp r0, #1
	beq _02238004
	add sp, #0xc
	movs r0, #2
	pop {r3, r4, pc}
_02238004:
	add sp, #0xc
	movs r0, #4
	pop {r3, r4, pc}
_0223800A:
	add sp, #0xc
	movs r0, #5
	pop {r3, r4, pc}
_02238010:
	add sp, #0xc
	movs r0, #3
	pop {r3, r4, pc}
_02238016:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov59_02237FA4

	thumb_func_start ov59_0223801C
ov59_0223801C: @ 0x0223801C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _0223802E
	cmp r0, #1
	beq _0223804E
	b _02238060
_0223802E:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238060
_0223804E:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02238060
	movs r0, #0
	strh r0, [r4, #0x3c]
	add sp, #0xc
	movs r0, #0x10
	pop {r3, r4, pc}
_02238060:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223801C

	thumb_func_start ov59_02238068
ov59_02238068: @ 0x02238068
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	bne _022380C2
	movs r1, #1
	bl ov59_02238FF4
	ldr r0, [r4, #0x10]
	bl FUN_02031C00
	cmp r0, #0
	beq _0223808C
	cmp r0, #2
	beq _0223809C
	cmp r0, #3
	beq _022380A8
	b _022380B2
_0223808C:
	adds r2, r4, #0
	adds r2, #0x45
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r1, #0x16
	bl ov59_02238CFC
	b _022380B2
_0223809C:
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #0xff
	bl ov59_02238CFC
	b _022380B2
_022380A8:
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #0xff
	bl ov59_02238CFC
_022380B2:
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02031BEC
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _022380E0
_022380C2:
	bl ov59_022385AC
	cmp r0, #0
	beq _022380E0
	adds r0, r4, #0
	movs r1, #0
	bl ov59_02238FF4
	adds r0, r4, #0
	bl ov59_02238D74
	movs r0, #0
	strh r0, [r4, #0x3c]
	movs r0, #4
	pop {r4, pc}
_022380E0:
	movs r0, #2
	pop {r4, pc}
	thumb_func_end ov59_02238068

	thumb_func_start ov59_022380E4
ov59_022380E4: @ 0x022380E4
	ldr r3, _022380E8 @ =ov59_02239EF8
	bx r3
	.align 2, 0
_022380E8: .4byte ov59_02239EF8
	thumb_func_end ov59_022380E4

	thumb_func_start ov59_022380EC
ov59_022380EC: @ 0x022380EC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	beq _022380FC
	cmp r1, #1
	beq _0223810A
	b _02238118
_022380FC:
	movs r1, #0
	bl ov59_02238FF4
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238118
_0223810A:
	bl ov59_02239F18
	cmp r0, #4
	beq _0223811A
	movs r1, #0
	strh r1, [r4, #0x3c]
	pop {r4, pc}
_02238118:
	movs r0, #4
_0223811A:
	pop {r4, pc}
	thumb_func_end ov59_022380EC

	thumb_func_start ov59_0223811C
ov59_0223811C: @ 0x0223811C
	ldr r3, _02238120 @ =ov59_0223A03C
	bx r3
	.align 2, 0
_02238120: .4byte ov59_0223A03C
	thumb_func_end ov59_0223811C

	thumb_func_start ov59_02238124
ov59_02238124: @ 0x02238124
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #3
	bhi _0223820C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223813A: @ jump table
	.2byte _02238142 - _0223813A - 2 @ case 0
	.2byte _02238160 - _0223813A - 2 @ case 1
	.2byte _0223817E - _0223813A - 2 @ case 2
	.2byte _022381DA - _0223813A - 2 @ case 3
_02238142:
	movs r1, #2
	bl ov59_02238FF4
	adds r0, r4, #0
	movs r1, #1
	bl ov59_02238AB0
	adds r0, r4, #0
	movs r1, #0xb
	bl ov59_02238C40
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238214
_02238160:
	bl ov59_0223A05C
	cmp r0, #6
	beq _02238214
	adds r1, r4, #0
	adds r1, #0x48
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #4
	adds r0, #0x51
	strb r1, [r0]
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238214
_0223817E:
	adds r1, r4, #0
	adds r1, #0x51
	ldrb r3, [r1]
	adds r1, r4, #0
	adds r1, #0x51
	ldrb r1, [r1]
	subs r2, r1, #1
	adds r1, r4, #0
	adds r1, #0x51
	strb r2, [r1]
	cmp r3, #0
	bne _02238214
	adds r1, r4, #0
	adds r1, #0x48
	ldrb r1, [r1]
	cmp r1, #1
	bne _022381BE
	movs r1, #0
	bl ov59_02238FF4
	adds r0, r4, #0
	movs r1, #0
	bl ov59_02238AB0
	adds r0, r4, #0
	movs r1, #0xa
	bl ov59_02238C40
	movs r0, #0
	strh r0, [r4, #0x3c]
	movs r0, #5
	pop {r4, pc}
_022381BE:
	movs r1, #0xc
	bl ov59_02238C40
	adds r0, r4, #0
	movs r1, #0
	bl ov59_02238AB0
	adds r0, r4, #0
	bl ov59_02238F58
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238214
_022381DA:
	bl ov59_02238FB4
	cmp r0, #0
	blt _02238214
	movs r1, #0
	strh r1, [r4, #0x3c]
	cmp r0, #0
	beq _022381FE
	adds r1, r4, #0
	ldr r0, [r4, #0x10]
	adds r1, #0x4d
	adds r4, #0x4e
	ldrb r1, [r1]
	ldrb r2, [r4]
	bl FUN_02031BB8
	movs r0, #1
	pop {r4, pc}
_022381FE:
	adds r0, r4, #0
	bl ov59_02238FF4
	adds r0, r4, #0
	movs r1, #0xa
	bl ov59_02238C40
_0223820C:
	movs r0, #0
	strh r0, [r4, #0x3c]
	movs r0, #5
	pop {r4, pc}
_02238214:
	movs r0, #6
	pop {r4, pc}
	thumb_func_end ov59_02238124

	thumb_func_start ov59_02238218
ov59_02238218: @ 0x02238218
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #3
	bhi _022382D6
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223822E: @ jump table
	.2byte _02238236 - _0223822E - 2 @ case 0
	.2byte _02238244 - _0223822E - 2 @ case 1
	.2byte _0223826A - _0223822E - 2 @ case 2
	.2byte _0223828A - _0223822E - 2 @ case 3
_02238236:
	movs r1, #2
	bl ov59_02238FF4
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _022382DE
_02238244:
	movs r1, #1
	bl ov59_022390A8
	cmp r0, #0
	beq _022382DE
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov59_0223919C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov59_0223919C
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _022382DE
_0223826A:
	adds r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0
	bne _022382DE
	ldr r0, _022382E4 @ =0x000008E6
	bl FUN_0200604C
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x15
	bl FUN_020248F0
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
_0223828A:
	ldr r0, _022382E8 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _022382A2
	movs r0, #0
	strh r0, [r4, #0x3c]
	ldr r0, _022382EC @ =0x000005EA
	bl FUN_0200604C
	movs r0, #0xa
	pop {r4, pc}
_022382A2:
	movs r0, #2
	tst r0, r1
	beq _022382B6
	movs r0, #0
	strh r0, [r4, #0x3c]
	ldr r0, _022382F0 @ =0x00000682
	bl FUN_0200604C
	movs r0, #9
	pop {r4, pc}
_022382B6:
	bl FUN_02025358
	cmp r0, #0
	beq _022382DE
	movs r0, #0
	strh r0, [r4, #0x3c]
	ldr r0, _022382F0 @ =0x00000682
	bl FUN_0200604C
	ldr r0, [r4, #0x40]
	cmp r0, #1
	beq _022382D2
	movs r0, #0
	str r0, [r4, #0x40]
_022382D2:
	movs r0, #9
	pop {r4, pc}
_022382D6:
	movs r0, #0
	strh r0, [r4, #0x3c]
	movs r0, #4
	pop {r4, pc}
_022382DE:
	movs r0, #7
	pop {r4, pc}
	nop
_022382E4: .4byte 0x000008E6
_022382E8: .4byte 0x021D110C
_022382EC: .4byte 0x000005EA
_022382F0: .4byte 0x00000682
	thumb_func_end ov59_02238218

	thumb_func_start ov59_022382F4
ov59_022382F4: @ 0x022382F4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	beq _02238308
	cmp r1, #1
	beq _02238316
	cmp r1, #2
	beq _02238328
	b _02238346
_02238308:
	movs r1, #2
	bl ov59_02238FF4
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238346
_02238316:
	movs r1, #1
	bl ov59_022390A8
	cmp r0, #0
	beq _02238346
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238346
_02238328:
	bl ov59_02239F38
	cmp r0, #0
	beq _02238336
	cmp r0, #1
	beq _0223833E
	b _02238346
_02238336:
	movs r0, #0
	strh r0, [r4, #0x3c]
	movs r0, #9
	pop {r4, pc}
_0223833E:
	movs r0, #0
	strh r0, [r4, #0x3c]
	movs r0, #0xa
	pop {r4, pc}
_02238346:
	movs r0, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_022382F4

	thumb_func_start ov59_0223834C
ov59_0223834C: @ 0x0223834C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	beq _02238360
	cmp r1, #1
	beq _02238386
	cmp r1, #2
	beq _02238394
	b _0223839E
_02238360:
	movs r1, #0
	movs r2, #1
	bl ov59_0223919C
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov59_0223919C
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x14
	bl FUN_020248F0
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _022383AE
_02238386:
	adds r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0
	bne _022383AE
	adds r0, r1, #1
	strh r0, [r4, #0x3c]
	b _022383AE
_02238394:
	movs r1, #0
	bl ov59_022390A8
	cmp r0, #0
	beq _022383AE
_0223839E:
	adds r0, r4, #0
	movs r1, #0
	bl ov59_02238FF4
	movs r0, #0
	strh r0, [r4, #0x3c]
	movs r0, #4
	pop {r4, pc}
_022383AE:
	movs r0, #9
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223834C

	thumb_func_start ov59_022383B4
ov59_022383B4: @ 0x022383B4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #4
	bls _022383C0
	b _022384DA
_022383C0:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022383CC: @ jump table
	.2byte _022383D6 - _022383CC - 2 @ case 0
	.2byte _02238404 - _022383CC - 2 @ case 1
	.2byte _0223841A - _022383CC - 2 @ case 2
	.2byte _0223845A - _022383CC - 2 @ case 3
	.2byte _022384A0 - _022383CC - 2 @ case 4
_022383D6:
	ldrb r1, [r4, #0x18]
	cmp r1, #5
	blo _022383F2
	movs r1, #7
	bl ov59_02238C40
	adds r0, r4, #0
	movs r1, #0x1a
	movs r2, #0xff
	bl ov59_02238CFC
	movs r0, #1
	strh r0, [r4, #0x3c]
	b _022384DA
_022383F2:
	movs r2, #2
	adds r0, #0x49
	strb r2, [r0]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x4a
	strb r1, [r0]
	strh r2, [r4, #0x3c]
	b _022384DA
_02238404:
	bl ov59_022385AC
	cmp r0, #0
	beq _022384DA
	adds r0, r4, #0
	bl ov59_02238D74
	movs r0, #0
	strh r0, [r4, #0x3c]
	movs r0, #9
	pop {r4, pc}
_0223841A:
	movs r1, #0
	bl ov59_022390A8
	cmp r0, #0
	beq _022384DA
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	adds r0, r0, #2
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x16
	bl FUN_020248F0
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024964
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _022384DA
_0223845A:
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024B68
	cmp r0, #0
	bne _022384DA
	ldr r0, _022384E0 @ =0x000008E6
	bl FUN_0200604C
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x14
	bl FUN_020248F0
	adds r1, r4, #0
	adds r1, #0x4d
	ldrb r1, [r1]
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x38]
	bl FUN_02031C30
	adds r0, r4, #0
	bl ov59_02238768
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov59_0223919C
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _022384DA
_022384A0:
	adds r1, r4, #0
	adds r1, #0x50
	ldrb r1, [r1]
	cmp r1, #0
	bne _022384DA
	ldrb r1, [r4, #0x18]
	cmp r1, #5
	blo _022384B8
	movs r1, #7
	bl ov59_02238C40
	b _022384BE
_022384B8:
	movs r1, #6
	bl ov59_02238C40
_022384BE:
	adds r1, r4, #0
	adds r1, #0x4d
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov59_0223892C
	adds r0, r4, #0
	movs r1, #0
	bl ov59_02238FF4
	movs r0, #0
	strh r0, [r4, #0x3c]
	movs r0, #4
	pop {r4, pc}
_022384DA:
	movs r0, #0xa
	pop {r4, pc}
	nop
_022384E0: .4byte 0x000008E6
	thumb_func_end ov59_022383B4

	thumb_func_start ov59_022384E4
ov59_022384E4: @ 0x022384E4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	beq _022384F4
	cmp r1, #1
	beq _02238510
	b _02238574
_022384F4:
	bl ov59_02238E98
	adds r0, r4, #0
	movs r1, #8
	bl ov59_02238C40
	adds r0, r4, #0
	movs r1, #1
	bl ov59_02238FF4
	ldrh r0, [r4, #0x3c]
	adds r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238574
_02238510:
	bl ov59_02238F24
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _02238574
	movs r2, #0
	strh r2, [r4, #0x3c]
	cmp r0, #2
	bhs _0223852A
	subs r1, r2, #2
	cmp r0, r1
	bne _02238534
_0223852A:
	adds r0, r4, #0
	bl ov59_02238C24
	movs r0, #4
	pop {r4, pc}
_02238534:
	cmp r0, #1
	bne _02238552
	adds r0, r4, #0
	movs r1, #9
	bl ov59_02238C40
	adds r0, r4, #0
	bl ov59_02238D90
	adds r0, r4, #0
	movs r1, #1
	bl ov59_02238FF4
	movs r0, #0xf
	pop {r4, pc}
_02238552:
	ldr r0, [r4, #4]
	movs r1, #3
	strb r1, [r0, #0x18]
	ldr r0, [r4, #4]
	strb r2, [r0, #0x1c]
	adds r0, r4, #0
	adds r0, #0x4b
	ldrb r1, [r0]
	ldr r0, [r4, #4]
	strb r1, [r0, #0x1a]
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r1, [r0]
	ldr r0, [r4, #4]
	strb r1, [r0, #0x1b]
	movs r0, #1
	pop {r4, pc}
_02238574:
	movs r0, #0xb
	pop {r4, pc}
	thumb_func_end ov59_022384E4

	thumb_func_start ov59_02238578
ov59_02238578: @ 0x02238578
	push {r3, lr}
	bl ov59_022385AC
	cmp r0, #0
	beq _02238586
	movs r0, #4
	pop {r3, pc}
_02238586:
	movs r0, #0xe
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov59_02238578

	thumb_func_start ov59_0223858C
ov59_0223858C: @ 0x0223858C
	push {r4, lr}
	adds r4, r0, #0
	bl ov59_022385AC
	cmp r0, #0
	beq _022385A8
	adds r0, r4, #0
	bl ov59_02238D74
	adds r0, r4, #0
	bl ov59_02238C24
	movs r0, #4
	pop {r4, pc}
_022385A8:
	movs r0, #0xf
	pop {r4, pc}
	thumb_func_end ov59_0223858C

	thumb_func_start ov59_022385AC
ov59_022385AC: @ 0x022385AC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _022385C4
	bl FUN_02020094
	cmp r0, #0
	beq _022385C4
	movs r0, #0
	pop {r4, pc}
_022385C4:
	bl FUN_02025358
	cmp r0, #0
	beq _022385E6
	ldr r0, _02238618 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	str r0, [r4, #0x40]
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #0xff
	adds r4, #0x47
	strb r0, [r4]
	movs r0, #1
	pop {r4, pc}
_022385E6:
	ldr r0, _0223861C @ =0x021D110C
	ldr r1, [r0, #0x48]
	ldr r0, _02238620 @ =0x00000CF3
	tst r0, r1
	beq _022385F4
	movs r0, #0
	str r0, [r4, #0x40]
_022385F4:
	ldr r0, _0223861C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _02238614
	ldr r0, _02238618 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #0xff
	adds r4, #0x47
	strb r0, [r4]
	movs r0, #1
	pop {r4, pc}
_02238614:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_02238618: .4byte 0x000005DC
_0223861C: .4byte 0x021D110C
_02238620: .4byte 0x00000CF3
	thumb_func_end ov59_022385AC

	thumb_func_start ov59_02238624
ov59_02238624: @ 0x02238624
	push {r3, lr}
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0223866C @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _02238670 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	pop {r3, pc}
	.align 2, 0
_0223866C: .4byte 0xFFFFE0FF
_02238670: .4byte 0x04001000
	thumb_func_end ov59_02238624

	thumb_func_start ov59_02238674
ov59_02238674: @ 0x02238674
	push {r4, lr}
	adds r4, r0, #0
	bl ov59_02239428
	adds r0, r4, #0
	bl ov59_02239604
	adds r0, r4, #0
	bl ov59_02239704
	adds r0, r4, #0
	bl ov59_022397E4
	adds r0, r4, #0
	bl ov59_022398CC
	adds r0, r4, #0
	bl ov59_022399F0
	ldr r0, _022386A4 @ =ov59_022393D4
	adds r1, r4, #0
	bl FUN_0201A0FC
	pop {r4, pc}
	.align 2, 0
_022386A4: .4byte ov59_022393D4
	thumb_func_end ov59_02238674

	thumb_func_start ov59_022386A8
ov59_022386A8: @ 0x022386A8
	push {r4, lr}
	adds r4, r0, #0
	bl ov59_02239A08
	adds r0, r4, #0
	bl ov59_02239918
	adds r0, r4, #0
	bl ov59_022398A0
	adds r0, r4, #0
	bl ov59_0223978C
	adds r0, r4, #0
	bl ov59_022396E4
	adds r0, r4, #0
	bl ov59_022395B8
	pop {r4, pc}
	thumb_func_end ov59_022386A8

	thumb_func_start ov59_022386D0
ov59_022386D0: @ 0x022386D0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r1, #0
	bl ov59_022387D0
	adds r0, r4, #0
	bl ov59_022388C4
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x64]
	movs r1, #0
	bl FUN_0200BB6C
	movs r0, #0
	ldr r1, [r4, #0x64]
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x18
	movs r1, #0
	lsrs r3, r0, #0x18
	str r1, [sp]
	movs r5, #0x50
	subs r5, r5, r3
	lsrs r3, r5, #0x1f
	adds r3, r5, r3
	ldr r0, _02238764 @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r2, [r4, #0x64]
	adds r0, r4, r0
	asrs r3, r3, #1
	bl FUN_020200FC
	movs r5, #0
_0223871E:
	lsls r1, r5, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov59_0223892C
	adds r5, r5, #1
	cmp r5, #7
	blt _0223871E
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	beq _02238758
	cmp r0, #1
	beq _02238742
	cmp r0, #2
	beq _0223874C
	b _02238758
_02238742:
	adds r0, r4, #0
	bl ov59_02238C24
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0223874C:
	adds r0, r4, #0
	movs r1, #0xa
	bl ov59_02238C40
	add sp, #0x10
	pop {r3, r4, r5, pc}
_02238758:
	adds r0, r4, #0
	movs r1, #0
	bl ov59_02238C40
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_02238764: .4byte 0x000F0200
	thumb_func_end ov59_022386D0

	thumb_func_start ov59_02238768
ov59_02238768: @ 0x02238768
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	bl FUN_02031C08
	strb r0, [r5, #0x18]
	ldr r0, [r5, #0x10]
	bl FUN_02031CE8
	strb r0, [r5, #0x14]
	adds r2, r5, #0
	ldr r0, [r5, #0x10]
	movs r1, #8
	adds r2, #0x22
	bl FUN_02031CEC
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r5, #0x16]
	adds r0, r5, #0
	adds r0, #0x22
	bl FUN_02031FE8
	strb r0, [r5, #0x17]
	adds r0, r5, #0
	adds r0, #0x22
	bl FUN_02031D80
	strb r0, [r5, #0x15]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x22
	adds r1, #0x2a
	bl FUN_02031DA0
	ldr r0, [r5, #0x10]
	bl FUN_02031CA0
	strb r0, [r5, #0x19]
	movs r4, #0
_022387BA:
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	bl FUN_02031BA4
	adds r1, r5, r4
	adds r4, r4, #1
	strb r0, [r1, #0x1a]
	cmp r4, #7
	blt _022387BA
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov59_02238768

	thumb_func_start ov59_022387D0
ov59_022387D0: @ 0x022387D0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020248F0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024964
	movs r0, #0x52
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r1, [r4, #0x6c]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	movs r2, #0
	adds r3, r0, #0
	movs r5, #0x30
	subs r3, r5, r3
	str r2, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	ldr r0, _02238830 @ =0x00010200
	adds r1, #0x49
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	adds r0, r4, r1
	ldr r2, [r4, #0x6c]
	movs r1, #4
	lsrs r3, r3, #1
	bl FUN_020200FC
	movs r0, #0x52
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_02238830: .4byte 0x00010200
	thumb_func_end ov59_022387D0

	thumb_func_start ov59_02238834
ov59_02238834: @ 0x02238834
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	movs r0, #0x4a
	adds r6, r1, #0
	lsls r0, r0, #2
	adds r7, r4, r0
	adds r0, r6, #6
	lsls r0, r0, #4
	str r0, [sp, #0x18]
	adds r0, r7, r0
	movs r1, #0
	str r2, [sp, #0x10]
	bl FUN_0201D978
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x68]
	adds r1, r6, #5
	bl FUN_0200BB6C
	ldr r1, [r4, #0x68]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	str r0, [sp, #0x14]
	movs r0, #0
	str r0, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	ldr r1, _022388C0 @ =0x0223CB80
	lsls r2, r6, #2
	ldr r1, [r1, r2]
	ldr r3, [sp, #0x14]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	movs r5, #0x30
	subs r5, r5, r3
	ldr r0, [sp, #0x18]
	lsrs r3, r5, #0x1f
	adds r3, r5, r3
	ldr r2, [r4, #0x68]
	adds r0, r7, r0
	movs r1, #4
	asrs r3, r3, #1
	bl FUN_020200FC
	ldr r0, [sp, #0x18]
	adds r0, r7, r0
	bl FUN_0201D5C8
	movs r0, #0x95
	lsls r0, r0, #2
	adds r4, r4, r0
	adds r0, r6, #0
	adds r0, #9
	lsls r5, r0, #2
	lsls r2, r6, #1
	ldr r1, [sp, #0x10]
	adds r2, #0x1c
	ldr r0, [r4, r5]
	adds r1, r1, r2
	bl FUN_020248F0
	ldr r0, [r4, r5]
	bl FUN_02024964
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022388C0: .4byte 0x0223CB80
	thumb_func_end ov59_02238834

	thumb_func_start ov59_022388C4
ov59_022388C4: @ 0x022388C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov59_02239EA8
	cmp r0, #7
	beq _022388D6
	cmp r0, #8
	beq _022388E2
	b _022388E8
_022388D6:
	adds r0, r5, #0
	movs r6, #0xc8
	movs r4, #0x5c
	bl ov59_02238C24
	b _022388FE
_022388E2:
	movs r6, #0xf0
	movs r4, #0xa8
	b _022388FE
_022388E8:
	ldr r1, _02238914 @ =0x0223C6C4
	lsls r0, r0, #2
	ldrh r1, [r1, r0]
	adds r1, r1, #4
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	ldr r1, _02238918 @ =0x0223C6C6
	ldrh r0, [r1, r0]
	subs r0, #0x10
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
_022388FE:
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_0200DD88
	adds r0, r5, #0
	bl ov59_02238C7C
	pop {r4, r5, r6, pc}
	.align 2, 0
_02238914: .4byte 0x0223C6C4
_02238918: .4byte 0x0223C6C6
	thumb_func_end ov59_022388C4

	thumb_func_start ov59_0223891C
ov59_0223891C: @ 0x0223891C
	movs r2, #0x96
	lsls r2, r2, #2
	ldr r3, _02238928 @ =FUN_0202484C
	ldr r0, [r0, r2]
	bx r3
	nop
_02238928: .4byte FUN_0202484C
	thumb_func_end ov59_0223891C

	thumb_func_start ov59_0223892C
ov59_0223892C: @ 0x0223892C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r0, #0
	movs r0, #0x4a
	lsls r0, r0, #2
	adds r5, r1, #0
	adds r6, r4, r0
	adds r0, r5, #0
	adds r0, #0xb
	lsls r7, r0, #4
	adds r0, r4, #0
	str r0, [sp, #0x14]
	adds r0, #0x1a
	str r0, [sp, #0x14]
	ldrb r0, [r0, r5]
	cmp r0, #0
	bne _0223896C
	movs r0, #0x95
	lsls r0, r0, #2
	adds r2, r4, r0
	adds r0, r5, #2
	lsls r1, r0, #2
	adds r0, r2, r1
	str r0, [sp, #0x10]
	ldr r0, [r2, r1]
	movs r1, #0
	bl FUN_02024830
	adds r0, r6, r7
	bl FUN_0201D8E4
	b _022389E0
_0223896C:
	movs r0, #0x95
	lsls r0, r0, #2
	adds r1, r5, #2
	adds r0, r4, r0
	lsls r2, r1, #2
	adds r1, r0, r2
	str r1, [sp, #0x10]
	ldr r0, [r0, r2]
	movs r1, #1
	bl FUN_02024830
	adds r0, r6, r7
	movs r1, #0
	bl FUN_0201D978
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x14]
	ldr r0, [r4, #0x60]
	ldrb r2, [r2, r5]
	movs r1, #0
	movs r3, #2
	bl FUN_0200BFCC
	ldr r0, [r4, #0x60]
	ldr r1, [r4, #0x64]
	ldr r2, [r4, #0x74]
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [r4, #0x64]
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022389F8 @ =0x00010200
	mov r3, ip
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r4, #0x64]
	movs r4, #0x10
	subs r3, r4, r3
	lsrs r4, r3, #0x1f
	adds r4, r3, r4
	adds r0, r6, r7
	asrs r3, r4, #1
	bl FUN_020200FC
	adds r0, r6, r7
	bl FUN_0201D5C8
_022389E0:
	ldr r1, _022389FC @ =0x0223C6C4
	lsls r3, r5, #2
	ldr r2, _02238A00 @ =0x0223C6C6
	ldr r0, [sp, #0x10]
	ldrsh r1, [r1, r3]
	ldrsh r2, [r2, r3]
	ldr r0, [r0]
	bl FUN_0200DD88
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022389F8: .4byte 0x00010200
_022389FC: .4byte 0x0223C6C4
_02238A00: .4byte 0x0223C6C6
	thumb_func_end ov59_0223892C

	thumb_func_start ov59_02238A04
ov59_02238A04: @ 0x02238A04
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0xa
	blx FUN_020F2998
	add r0, sp, #0x18
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0xa
	blx FUN_020F2998
	add r1, sp, #0x18
	strb r0, [r1, #1]
	movs r0, #0
	str r0, [sp, #0x10]
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r6, _02238AA8 @ =_0223C624
	add r7, sp, #0x18
	adds r4, r5, r0
_02238A32:
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldrb r2, [r7]
	ldr r0, [r5, #0x60]
	movs r1, #0
	movs r3, #1
	bl FUN_0200BFCC
	ldr r0, [r5, #0x60]
	ldr r1, [r5, #0x64]
	ldr r2, [r5, #0x74]
	bl FUN_0200CBBC
	ldr r0, [sp, #0x10]
	movs r1, #0
	adds r0, #8
	lsls r0, r0, #4
	str r0, [sp, #0x14]
	adds r0, r4, r0
	bl FUN_0201D978
	movs r0, #3
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02238AAC @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	ldrb r3, [r6]
	ldr r2, [r5, #0x64]
	adds r0, r4, r0
	bl FUN_020200FC
	ldr r0, [sp, #0x14]
	adds r0, r4, r0
	bl FUN_0201D5C8
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #0x1a]
	cmp r0, #0xa
	blo _02238AA2
	ldr r0, [sp, #0x10]
	adds r7, r7, #1
	adds r0, r0, #1
	adds r6, r6, #1
	str r0, [sp, #0x10]
	cmp r0, #2
	blt _02238A32
_02238AA2:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02238AA8: .4byte _0223C624
_02238AAC: .4byte 0x00010200
	thumb_func_end ov59_02238A04

	thumb_func_start ov59_02238AB0
ov59_02238AB0: @ 0x02238AB0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r7, r1, #0
	beq _02238B6E
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #6
	str r0, [sp, #0xc]
	movs r0, #0x29
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x54]
	movs r3, #1
	bl FUN_02007B68
	adds r1, r5, #0
	adds r1, #0x4e
	ldrb r1, [r1]
	adds r0, r5, #0
	bl ov59_02238A04
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov59_02238834
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov59_02238834
	movs r0, #0x5e
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02238C20 @ =0x00010200
	adds r2, #0x79
	str r0, [sp, #8]
	adds r0, r5, r2
	adds r2, r5, #0
	str r1, [sp, #0xc]
	adds r2, #0x4d
	ldrb r2, [r2]
	adds r3, r1, #0
	lsls r2, r2, #2
	adds r2, r5, r2
	adds r2, #0xd0
	ldr r2, [r2]
	bl FUN_020200FC
	movs r0, #0x5e
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	movs r1, #0x1a
	bl FUN_0200BB6C
	movs r0, #0x72
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02238C20 @ =0x00010200
	adds r2, #0xc9
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, r2
	ldr r2, [r5, #0x68]
	movs r3, #2
	bl FUN_020200FC
	movs r0, #0x72
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	b _02238BB2
_02238B6E:
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x54]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201C8C4
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x54]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	ldr r0, [r5, #0x54]
	movs r1, #1
	bl FUN_0201EFBC
	ldr r0, [r5, #0x54]
	movs r1, #0
	bl FUN_0201EFBC
_02238BB2:
	adds r4, r5, #0
	movs r6, #9
	adds r4, #0x24
_02238BB8:
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r7, #0
	bl FUN_02024830
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0202484C
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #0xe
	ble _02238BB8
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #0x1a]
	cmp r0, #0xa
	bhs _02238C02
	movs r0, #0xa2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x19
	bl FUN_020248F0
	movs r0, #0xa3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x1b
	bl FUN_020248F0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02238C02:
	movs r0, #0xa2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x18
	bl FUN_020248F0
	movs r0, #0xa3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x1a
	bl FUN_020248F0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238C20: .4byte 0x00010200
	thumb_func_end ov59_02238AB0

	thumb_func_start ov59_02238C24
ov59_02238C24: @ 0x02238C24
	push {r3, lr}
	ldrb r1, [r0, #0x18]
	cmp r1, #0
	bne _02238C34
	movs r1, #1
	bl ov59_02238C40
	pop {r3, pc}
_02238C34:
	ldrb r1, [r0, #0x19]
	adds r1, r1, #1
	bl ov59_02238C40
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov59_02238C24

	thumb_func_start ov59_02238C40
ov59_02238C40: @ 0x02238C40
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	movs r6, #0x4e
	adds r5, r0, #0
	lsls r6, r6, #2
	adds r4, r1, #0
	adds r0, r5, r6
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov59_02239D08
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, [r5, #0x68]
	adds r0, r5, r6
	adds r3, r1, #0
	bl FUN_020200A8
	adds r0, r5, r6
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov59_02238C40

	thumb_func_start ov59_02238C7C
ov59_02238C7C: @ 0x02238C7C
	push {r4, r5, lr}
	sub sp, #0xc
	movs r5, #0x5a
	adds r4, r0, #0
	lsls r5, r5, #2
	adds r0, r4, r5
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	bl ov59_02239EA8
	adds r1, r0, #0
	cmp r1, #8
	bne _02238CA4
	adds r0, r4, r5
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, pc}
_02238CA4:
	cmp r1, #6
	bhi _02238CC4
	adds r0, r4, r1
	ldrb r0, [r0, #0x1a]
	cmp r0, #0
	bne _02238CBA
	adds r0, r4, r5
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, pc}
_02238CBA:
	adds r0, r4, #0
	adds r1, #0xd
	bl ov59_02239D08
	b _02238CDC
_02238CC4:
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	beq _02238CD4
	adds r0, r4, #0
	movs r1, #0x15
	bl ov59_02239D08
	b _02238CDC
_02238CD4:
	adds r0, r4, #0
	movs r1, #0x14
	bl ov59_02239D08
_02238CDC:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, [r4, #0x68]
	adds r0, r4, r5
	adds r3, r1, #0
	bl FUN_020200A8
	adds r0, r4, r5
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov59_02238C7C

	thumb_func_start ov59_02238CFC
ov59_02238CFC: @ 0x02238CFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r6, #0x4a
	adds r5, r0, #0
	lsls r6, r6, #2
	adds r7, r1, #0
	adds r0, r5, r6
	movs r1, #0xf
	adds r4, r2, #0
	bl FUN_0201D978
	movs r1, #1
	adds r0, r5, r6
	adds r2, r1, #0
	movs r3, #0xd
	bl FUN_0200E998
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov59_02239D08
	cmp r4, #0xff
	beq _02238D4E
	cmp r4, #0
	beq _02238D4E
	movs r0, #1
	bl FUN_02002B8C
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r5, #0x68]
	adds r0, r5, r6
	movs r1, #1
	bl FUN_020200A8
	adds r1, r5, #0
	adds r1, #0x47
	strb r0, [r1]
	b _02238D68
_02238D4E:
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r5, #0x68]
	adds r0, r5, r6
	movs r1, #1
	bl FUN_020200A8
	adds r0, r5, #0
	movs r1, #0xff
	adds r0, #0x47
	strb r1, [r0]
_02238D68:
	adds r0, r5, r6
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov59_02238CFC

	thumb_func_start ov59_02238D74
ov59_02238D74: @ 0x02238D74
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x4a
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #1
	bl FUN_0200E9BC
	movs r0, #0x4a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	pop {r4, pc}
	thumb_func_end ov59_02238D74

	thumb_func_start ov59_02238D90
ov59_02238D90: @ 0x02238D90
	push {r4, r5, lr}
	sub sp, #0xc
	movs r4, #0x4a
	adds r5, r0, #0
	lsls r4, r4, #2
	adds r0, r5, r4
	movs r1, #0xf
	bl FUN_0201D978
	movs r1, #1
	adds r0, r5, r4
	adds r2, r1, #0
	movs r3, #0xd
	bl FUN_0200E998
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x2a
	movs r2, #0
	bl ov59_02239E0C
	adds r1, r0, #0
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	bl FUN_0200BB6C
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r5, #0x68]
	adds r0, r5, r4
	movs r1, #1
	bl FUN_020200A8
	ldrh r0, [r5, #0x2a]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #5
	bne _02238DEC
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, pc}
_02238DEC:
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #1
	bls _02238E22
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x2c
	movs r2, #1
	bl ov59_02239E0C
	adds r1, r0, #0
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	bl FUN_0200BB6C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	ldr r2, [r5, #0x68]
	adds r0, r5, r4
	movs r1, #1
	bl FUN_020200A8
_02238E22:
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #2
	bls _02238E5A
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x2e
	movs r2, #2
	bl ov59_02239E0C
	adds r1, r0, #0
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	bl FUN_0200BB6C
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	ldr r2, [r5, #0x68]
	adds r0, r5, r4
	movs r1, #1
	bl FUN_020200A8
	b _02238E8E
_02238E5A:
	adds r0, #0xff
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02238E8E
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	movs r1, #0x7a
	bl FUN_0200BB6C
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	movs r3, #0
	movs r1, #1
	subs r0, r0, #1
	lsls r0, r0, #4
	adds r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r5, #0x68]
	adds r0, r5, r4
	bl FUN_020200A8
_02238E8E:
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov59_02238D90

	thumb_func_start ov59_02238E98
ov59_02238E98: @ 0x02238E98
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	add r0, sp, #0xc
	movs r1, #0
	movs r2, #0x18
	blx FUN_020D4994
	ldr r0, _02238F14 @ =0x0223C630
	add r2, sp, #0xc
	ldrh r3, [r0, #0xc]
	ldr r5, _02238F18 @ =0x0223C66A
	add r1, sp, #0xc
	strh r3, [r2]
	ldrh r3, [r0, #0xe]
	strh r3, [r2, #2]
	ldrh r3, [r0, #0x10]
	strh r3, [r2, #4]
	ldrh r3, [r0, #0x12]
	strh r3, [r2, #6]
	ldrh r3, [r0, #0x14]
	ldrh r0, [r0, #0x16]
	strh r3, [r2, #8]
	strh r0, [r2, #0xa]
	movs r0, #0xa5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x54]
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	subs r0, r0, #1
	lsls r3, r0, #3
	ldr r0, _02238F1C @ =0x0223C668
	ldrh r0, [r0, r3]
	strb r0, [r2, #0x14]
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	subs r0, r0, #1
	lsls r3, r0, #3
	ldr r0, _02238F20 @ =0x0223C66B
	ldrb r0, [r0, r3]
	ldrb r3, [r5, r3]
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r2, [r4, #0x40]
	ldr r0, [r4, #0x58]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl FUN_020185FC
	movs r1, #0xa6
	lsls r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x24
	pop {r4, r5, pc}
	.align 2, 0
_02238F14: .4byte 0x0223C630
_02238F18: .4byte 0x0223C66A
_02238F1C: .4byte 0x0223C668
_02238F20: .4byte 0x0223C66B
	thumb_func_end ov59_02238E98

	thumb_func_start ov59_02238F24
ov59_02238F24: @ 0x02238F24
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xa6
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020186A4
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _02238F54
	movs r0, #0xa6
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02018674
	str r0, [r5, #0x40]
	movs r0, #0xa6
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02018680
	adds r0, r4, #0
_02238F54:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov59_02238F24

	thumb_func_start ov59_02238F58
ov59_02238F58: @ 0x02238F58
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, [r4, #0x54]
	movs r1, #0x19
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x6a
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r1, [r0, #0x10]
	movs r1, #5
	strb r1, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	movs r2, #0xf
	bics r1, r2
	ldr r2, [r4, #0x40]
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	movs r2, #0xf
	ands r2, r3
	orrs r1, r2
	strb r1, [r0, #0x12]
	ldrb r2, [r0, #0x12]
	movs r1, #0xf0
	bics r2, r1
	movs r1, #0x10
	orrs r1, r2
	strb r1, [r0, #0x12]
	movs r0, #0x92
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl FUN_020166FC
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov59_02238F58

	thumb_func_start ov59_02238FB4
ov59_02238FB4: @ 0x02238FB4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x92
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _02238FCC
	cmp r0, #2
	beq _02238FD0
	b _02238FD4
_02238FCC:
	movs r4, #1
	b _02238FDA
_02238FD0:
	movs r4, #0
	b _02238FDA
_02238FD4:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_02238FDA:
	movs r0, #0x92
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020169C0
	str r0, [r5, #0x40]
	movs r0, #0x92
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov59_02238FB4

	thumb_func_start ov59_02238FF4
ov59_02238FF4: @ 0x02238FF4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	adds r6, r0, #0
	subs r0, r7, #1
	cmp r0, #1
	bhi _02239062
	movs r4, #0
	adds r5, r6, #0
_02239004:
	adds r0, r6, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r4, r0
	bne _02239020
	cmp r7, #2
	bne _02239020
	movs r0, #0x97
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024B78
	b _0223902C
_02239020:
	movs r0, #0x97
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024B78
_0223902C:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #7
	blt _02239004
	adds r0, r6, #0
	movs r1, #0
	bl ov59_0223891C
	adds r0, r6, #0
	movs r1, #2
	bl ov59_022387D0
	adds r0, r6, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #7
	bhs _022390A6
	adds r0, r0, #2
	lsls r0, r0, #2
	adds r1, r6, r0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	bl FUN_02024ADC
	pop {r3, r4, r5, r6, r7, pc}
_02239062:
	movs r7, #0x97
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_0223906A:
	ldr r0, [r4, r7]
	movs r1, #0
	bl FUN_02024B78
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #7
	blt _0223906A
	adds r0, r6, #0
	movs r1, #1
	bl ov59_0223891C
	adds r0, r6, #0
	movs r1, #0
	bl ov59_022387D0
	adds r0, r6, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #7
	bhs _022390A6
	adds r0, r0, #2
	lsls r0, r0, #2
	adds r1, r6, r0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #3
	bl FUN_02024ADC
_022390A6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov59_02238FF4

	thumb_func_start ov59_022390A8
ov59_022390A8: @ 0x022390A8
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	ldrh r0, [r4, #0x3e]
	beq _02239132
	cmp r0, #0
	beq _022390BC
	cmp r0, #1
	beq _022390D8
	b _02239198
_022390BC:
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #4
	bl FUN_020248F0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x51
	strb r1, [r0]
	ldrh r0, [r4, #0x3e]
	adds r0, r0, #1
	strh r0, [r4, #0x3e]
	b _02239198
_022390D8:
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	movs r2, #2
	bl FUN_0200DEA0
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	adds r0, r0, #2
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	subs r2, r1, #1
	bl FUN_0200DEA0
	adds r0, r4, #0
	adds r0, #0x51
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x51
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x51
	strb r1, [r0]
	cmp r2, #2
	blo _02239198
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #5
	bl FUN_020248F0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x51
	strb r1, [r0]
	strh r1, [r4, #0x3e]
	movs r0, #1
	pop {r4, pc}
_02239132:
	cmp r0, #0
	beq _0223913C
	cmp r0, #1
	beq _02239158
	b _02239198
_0223913C:
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #4
	bl FUN_020248F0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x51
	strb r1, [r0]
	ldrh r0, [r4, #0x3e]
	adds r0, r0, #1
	strh r0, [r4, #0x3e]
	b _02239198
_02239158:
	movs r0, #0x96
	lsls r0, r0, #2
	movs r1, #0
	ldr r0, [r4, r0]
	subs r2, r1, #2
	bl FUN_0200DEA0
	adds r0, r4, #0
	adds r0, #0x51
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x51
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x51
	strb r1, [r0]
	cmp r2, #3
	blo _02239198
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_020248F0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x51
	strb r1, [r0]
	strh r1, [r4, #0x3e]
	movs r0, #1
	pop {r4, pc}
_02239198:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov59_022390A8

	thumb_func_start ov59_0223919C
ov59_0223919C: @ 0x0223919C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7]
	adds r5, r1, #0
	movs r1, #0x20
	adds r6, r2, #0
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x20
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r7, #0
	adds r0, #0x4d
	str r7, [r4]
	ldrb r0, [r0]
	cmp r5, #0
	strb r0, [r4, #7]
	bne _022391DA
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	adds r0, r0, #2
	lsls r0, r0, #2
	adds r1, r7, r0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	b _022391E0
_022391DA:
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r7, r0]
_022391E0:
	str r0, [r4, #0x1c]
	add r1, sp, #8
	ldr r0, [r4, #0x1c]
	adds r1, #2
	add r2, sp, #8
	bl FUN_0200DE00
	cmp r6, #0
	bne _02239202
	lsls r0, r5, #2
	adds r0, #0xc0
	strh r0, [r4, #8]
	movs r0, #9
	mvns r0, r0
	muls r0, r5, r0
	adds r0, #0x60
	b _02239220
_02239202:
	ldrb r0, [r4, #7]
	lsls r1, r0, #2
	ldr r0, _022393C8 @ =0x0223C6C4
	ldrh r1, [r0, r1]
	lsls r0, r5, #2
	adds r0, r1, r0
	strh r0, [r4, #8]
	ldrb r0, [r4, #7]
	lsls r1, r0, #2
	ldr r0, _022393CC @ =0x0223C6C6
	ldrh r1, [r0, r1]
	movs r0, #9
	mvns r0, r0
	muls r0, r5, r0
	adds r0, r1, r0
_02239220:
	strh r0, [r4, #0xa]
	movs r0, #8
	ldrsh r2, [r4, r0]
	add r0, sp, #8
	movs r1, #2
	ldrsh r1, [r0, r1]
	subs r1, r2, r1
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	movs r1, #0xa
	ldrsh r2, [r4, r1]
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	bpl _02239246
	rsbs r0, r6, #0
	b _02239248
_02239246:
	adds r0, r6, #0
_02239248:
	cmp r5, #0
	bge _02239250
	rsbs r1, r5, #0
	b _02239252
_02239250:
	adds r1, r5, #0
_02239252:
	cmp r1, r0
	blt _0223926C
	cmp r5, #0
	bge _0223925E
	rsbs r1, r5, #0
	b _02239260
_0223925E:
	adds r1, r5, #0
_02239260:
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	strb r0, [r4, #5]
	b _02239280
_0223926C:
	cmp r6, #0
	bge _02239274
	rsbs r1, r6, #0
	b _02239276
_02239274:
	adds r1, r6, #0
_02239276:
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	strb r0, [r4, #5]
_02239280:
	add r1, sp, #8
	movs r0, #2
	ldrsh r0, [r1, r0]
	cmp r0, #0
	ble _0223929C
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022392AA
_0223929C:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022392AA:
	blx FUN_020F2104
	str r0, [r4, #0x14]
	add r1, sp, #8
	movs r0, #0
	ldrsh r0, [r1, r0]
	cmp r0, #0
	ble _022392CC
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022392DA
_022392CC:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022392DA:
	blx FUN_020F2104
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #6]
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _022392FE
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp, #4]
	b _0223930E
_022392FE:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp, #4]
_0223930E:
	cmp r5, #0
	ble _02239324
	lsls r0, r5, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02239332
_02239324:
	lsls r0, r5, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02239332:
	blx FUN_020F2104
	adds r5, r0, #0
	ldr r0, [sp, #4]
	blx FUN_020F2104
	adds r1, r0, #0
	adds r0, r5, #0
	blx FUN_020CCBA0
	str r0, [r4, #0xc]
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _02239362
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp]
	b _02239372
_02239362:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp]
_02239372:
	cmp r6, #0
	ble _02239388
	lsls r0, r6, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02239396
_02239388:
	lsls r0, r6, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02239396:
	blx FUN_020F2104
	adds r5, r0, #0
	ldr r0, [sp]
	blx FUN_020F2104
	adds r1, r0, #0
	adds r0, r5, #0
	blx FUN_020CCBA0
	str r0, [r4, #0x10]
	ldr r0, _022393D0 @ =ov59_02239C90
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	adds r7, #0x50
	adds r0, r0, #1
	strb r0, [r7]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022393C8: .4byte 0x0223C6C4
_022393CC: .4byte 0x0223C6C6
_022393D0: .4byte ov59_02239C90
	thumb_func_end ov59_0223919C

	thumb_func_start ov59_022393D4
ov59_022393D4: @ 0x022393D4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x93
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022393E6
	bl FUN_0200D034
_022393E6:
	blx FUN_020B62EC
	ldr r0, [r4, #0x54]
	bl FUN_0201EEB4
	ldr r3, _02239400 @ =0x027E0000
	ldr r1, _02239404 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_02239400: .4byte 0x027E0000
_02239404: .4byte 0x00003FF8
	thumb_func_end ov59_022393D4

	thumb_func_start ov59_02239408
ov59_02239408: @ 0x02239408
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _02239424 @ =0x0223C770
	add r3, sp, #0
	movs r2, #5
_02239412:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02239412
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_02239424: .4byte 0x0223C770
	thumb_func_end ov59_02239408

	thumb_func_start ov59_02239428
ov59_02239428: @ 0x02239428
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	adds r4, r0, #0
	bl ov59_02239408
	ldr r0, [r4]
	bl FUN_0201AC88
	add r3, sp, #0xa8
	ldr r5, _02239594 @ =0x0223C658
	str r0, [r4, #0x54]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r2, _02239598 @ =0x04000304
	ldr r0, _0223959C @ =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r5, _022395A0 @ =0x0223C718
	add r3, sp, #0x8c
	ands r0, r1
	strh r0, [r2]
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
	ldr r0, [r4, #0x54]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x54]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _022395A4 @ =0x0223C68C
	add r3, sp, #0x70
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
	ldr r0, [r4, #0x54]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x54]
	movs r1, #7
	bl FUN_0201CAE0
	ldr r5, _022395A8 @ =0x0223C6A8
	add r3, sp, #0x54
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
	ldr r0, [r4, #0x54]
	adds r3, r1, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x54]
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _022395AC @ =0x0223C6FC
	add r3, sp, #0x38
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4, #0x54]
	movs r1, #1
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x54]
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _022395B0 @ =0x0223C734
	add r3, sp, #0x1c
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
	ldr r0, [r4, #0x54]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x54]
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _022395B4 @ =0x0223C6E0
	add r3, sp, #0
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
	ldr r0, [r4, #0x54]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x54]
	movs r1, #3
	bl FUN_0201CAE0
	ldr r3, [r4]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #7
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	movs r0, #0
	ldr r3, [r4]
	movs r1, #0x20
	adds r2, r0, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #3
	movs r1, #0x40
	movs r2, #0
	bl FUN_0201C1C4
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02239594: .4byte 0x0223C658
_02239598: .4byte 0x04000304
_0223959C: .4byte 0xFFFF7FFF
_022395A0: .4byte 0x0223C718
_022395A4: .4byte 0x0223C68C
_022395A8: .4byte 0x0223C6A8
_022395AC: .4byte 0x0223C6FC
_022395B0: .4byte 0x0223C734
_022395B4: .4byte 0x0223C6E0
	thumb_func_end ov59_02239428

	thumb_func_start ov59_022395B8
ov59_022395B8: @ 0x022395B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x54]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0x54]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x54]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r4, #0x54]
	movs r1, #7
	bl FUN_0201BB4C
	ldr r0, [r4, #0x54]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4, #0x54]
	bl FUN_0201AB0C
	ldr r2, _02239600 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_02239600: .4byte 0x04000304
	thumb_func_end ov59_022395B8

	thumb_func_start ov59_02239604
ov59_02239604: @ 0x02239604
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0xdc
	bl FUN_02007688
	movs r2, #0
	str r2, [sp]
	ldr r1, [r5]
	adds r3, r2, #0
	str r1, [sp, #4]
	movs r1, #3
	adds r4, r0, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #4
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x54]
	adds r0, r4, #0
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #5
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x54]
	adds r0, r4, #0
	movs r3, #3
	bl FUN_02007B68
	movs r1, #0
	str r1, [sp]
	ldr r0, [r5]
	movs r2, #4
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #1
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x54]
	adds r0, r4, #0
	movs r3, #7
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #2
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x54]
	adds r0, r4, #0
	movs r3, #7
	bl FUN_02007B68
	movs r0, #0x29
	lsls r0, r0, #4
	str r4, [r5, r0]
	adds r0, r5, #0
	adds r0, #0x46
	ldrb r0, [r0]
	movs r1, #0
	movs r2, #1
	str r0, [sp]
	ldr r0, [r5]
	movs r3, #0xd
	str r0, [sp, #4]
	ldr r0, [r5, #0x54]
	bl FUN_0200E644
	movs r1, #6
	ldr r2, [r5]
	movs r0, #0
	lsls r1, r1, #6
	bl FUN_0200304C
	movs r1, #6
	ldr r2, [r5]
	movs r0, #4
	lsls r1, r1, #6
	bl FUN_0200304C
	movs r0, #0x1a
	str r0, [sp]
	ldr r0, _022396E0 @ =0x04000050
	movs r1, #0
	movs r2, #8
	movs r3, #6
	blx FUN_020CF15C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_022396E0: .4byte 0x04000050
	thumb_func_end ov59_02239604

	thumb_func_start ov59_022396E4
ov59_022396E4: @ 0x022396E4
	push {r3, lr}
	movs r1, #0x29
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl FUN_0200770C
	movs r1, #0
	ldr r0, _02239700 @ =0x04000050
	adds r2, r1, #0
	movs r3, #0x1f
	str r1, [sp]
	blx FUN_020CF15C
	pop {r3, pc}
	.align 2, 0
_02239700: .4byte 0x04000050
	thumb_func_end ov59_022396E4

	thumb_func_start ov59_02239704
ov59_02239704: @ 0x02239704
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #4
	bl FUN_02002CEC
	ldr r3, [r5]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0x15
	bl FUN_0200BAF8
	str r0, [r5, #0x5c]
	ldr r2, [r5]
	movs r0, #0x10
	movs r1, #0x20
	bl FUN_0200BD18
	str r0, [r5, #0x60]
	movs r0, #1
	ldr r1, [r5]
	lsls r0, r0, #8
	bl FUN_02026354
	str r0, [r5, #0x64]
	movs r0, #1
	ldr r1, [r5]
	lsls r0, r0, #8
	bl FUN_02026354
	str r0, [r5, #0x68]
	ldr r0, [r5, #0x5c]
	movs r1, #1
	bl FUN_0200BBA0
	str r0, [r5, #0x6c]
	ldr r0, [r5, #0x5c]
	movs r1, #0x19
	bl FUN_0200BBA0
	str r0, [r5, #0x74]
	movs r6, #0
	adds r4, r5, #0
_0223975A:
	adds r1, r6, #0
	ldr r0, [r5, #0x5c]
	adds r1, #0x1b
	bl FUN_0200BBA0
	str r0, [r4, #0x78]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #0x16
	blt _0223975A
	movs r4, #0
	adds r6, r5, #0
_02239772:
	ldr r0, [r5, #0x5c]
	adds r1, r4, #7
	bl FUN_0200BBA0
	adds r1, r6, #0
	adds r1, #0xd0
	adds r4, r4, #1
	adds r6, r6, #4
	str r0, [r1]
	cmp r4, #7
	blt _02239772
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov59_02239704

	thumb_func_start ov59_0223978C
ov59_0223978C: @ 0x0223978C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_02239794:
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #7
	blt _02239794
	movs r5, #0
	adds r4, r6, #0
_022397AA:
	ldr r0, [r4, #0x78]
	bl FUN_02026380
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #0x16
	blt _022397AA
	ldr r0, [r6, #0x74]
	bl FUN_02026380
	ldr r0, [r6, #0x6c]
	bl FUN_02026380
	ldr r0, [r6, #0x68]
	bl FUN_02026380
	ldr r0, [r6, #0x64]
	bl FUN_02026380
	ldr r0, [r6, #0x60]
	bl FUN_0200BDA0
	ldr r0, [r6, #0x5c]
	bl FUN_0200BB44
	movs r0, #4
	bl FUN_02002DB4
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_0223978C

	thumb_func_start ov59_022397E4
ov59_022397E4: @ 0x022397E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	movs r1, #0x4a
	movs r6, #0
	lsls r1, r1, #2
	ldr r4, _0223989C @ =0x0223C798
	str r0, [sp, #0x14]
	adds r5, r0, r1
	adds r7, r6, #0
_022397F6:
	ldr r0, [sp, #0x14]
	adds r1, r5, #0
	ldr r0, [r0, #0x54]
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #0xb
	blt _022397F6
	movs r7, #0x6f
	lsls r7, r7, #2
	adds r1, r7, #0
	ldr r0, [sp, #0x14]
	subs r1, #0x94
	adds r0, r0, r1
	movs r4, #0
	movs r6, #6
	str r0, [sp, #0x18]
_02239826:
	adds r0, r4, #0
	adds r0, #0xb
	lsls r0, r0, #4
	str r0, [sp, #0x1c]
	lsrs r3, r4, #0x1f
	str r3, [sp, #0x20]
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r5, [sp, #0x20]
	lsls r3, r4, #0x1f
	subs r3, r3, r5
	movs r5, #0x1f
	rors r3, r5
	ldr r5, [sp, #0x20]
	ldr r2, [sp, #0x18]
	adds r5, r5, r3
	movs r3, #6
	muls r3, r5, r3
	ldr r1, [sp, #0x1c]
	adds r3, r3, #5
	lsls r3, r3, #0x18
	adds r1, r2, r1
	ldr r0, [r0, #0x54]
	movs r2, #2
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	adds r4, r4, #1
	adds r7, r7, #4
	adds r6, r6, #2
	cmp r4, #7
	blt _02239826
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	bl FUN_0201660C
	movs r2, #0x92
	ldr r1, [sp, #0x14]
	lsls r2, r2, #2
	str r0, [r1, r2]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0223989C: .4byte 0x0223C798
	thumb_func_end ov59_022397E4

	thumb_func_start ov59_022398A0
ov59_022398A0: @ 0x022398A0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x4a
	lsls r0, r0, #2
	movs r4, #0
	adds r5, r6, r0
_022398AC:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0x12
	blt _022398AC
	movs r0, #0x92
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02016624
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_022398A0

	thumb_func_start ov59_022398CC
ov59_022398CC: @ 0x022398CC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	beq _02239910
	subs r0, r0, #1
	lsls r7, r0, #3
	ldr r0, _02239914 @ =0x0223C668
	ldr r1, [r6]
	adds r5, r0, r7
	ldrh r0, [r0, r7]
	bl FUN_02014918
	movs r1, #0xa5
	lsls r1, r1, #2
	str r0, [r6, r1]
	ldr r0, _02239914 @ =0x0223C668
	movs r4, #0
	ldrh r0, [r0, r7]
	cmp r0, #0
	ble _02239910
	adds r7, r1, #0
_022398FA:
	ldr r2, [r5, #4]
	ldr r0, [r6, r7]
	ldrb r2, [r2, r4]
	ldr r1, [r6, #0x5c]
	adds r3, r4, #0
	bl FUN_02014960
	ldrh r0, [r5]
	adds r4, r4, #1
	cmp r4, r0
	blt _022398FA
_02239910:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02239914: .4byte 0x0223C668
	thumb_func_end ov59_022398CC

	thumb_func_start ov59_02239918
ov59_02239918: @ 0x02239918
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	beq _02239936
	movs r0, #0xa5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02014950
	movs r0, #0xa5
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_02239936:
	pop {r4, pc}
	thumb_func_end ov59_02239918

	thumb_func_start ov59_02239938
ov59_02239938: @ 0x02239938
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #0x20
	bl FUN_0202055C
	ldr r0, [r4]
	bl FUN_0200CF18
	movs r1, #0x93
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	ldr r1, _022399A8 @ =0x0223C750
	ldr r2, _022399AC @ =0x0223C678
	movs r3, #3
	bl FUN_0200CF70
	ldr r0, [r4]
	bl FUN_0200B2E0
	ldr r0, [r4]
	bl FUN_0200B2E8
	movs r0, #0x93
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200CF38
	movs r1, #0x25
	lsls r1, r1, #4
	str r0, [r4, r1]
	subs r0, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0xf
	bl FUN_0200CFF4
	movs r3, #0
	movs r1, #0x93
	str r3, [sp]
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _022399B0 @ =0x0223C648
	bl FUN_0200D2A4
	ldr r0, [r4]
	movs r1, #0
	bl FUN_02018424
	str r0, [r4, #0x58]
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_022399A8: .4byte 0x0223C750
_022399AC: .4byte 0x0223C678
_022399B0: .4byte 0x0223C648
	thumb_func_end ov59_02239938

	thumb_func_start ov59_022399B4
ov59_022399B4: @ 0x022399B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	bl FUN_02018474
	movs r1, #0x93
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_0200D0E4
	movs r0, #0x25
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
	subs r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200D108
	movs r0, #0x93
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	bl FUN_020205AC
	ldr r0, [r4]
	bl FUN_0200B2E0
	pop {r4, pc}
	thumb_func_end ov59_022399B4

	thumb_func_start ov59_022399F0
ov59_022399F0: @ 0x022399F0
	push {r4, lr}
	adds r4, r0, #0
	bl ov59_02239938
	adds r0, r4, #0
	bl ov59_02239A24
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	pop {r4, pc}
	thumb_func_end ov59_022399F0

	thumb_func_start ov59_02239A08
ov59_02239A08: @ 0x02239A08
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	bl ov59_02239C70
	adds r0, r4, #0
	bl ov59_022399B4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_02239A08

	thumb_func_start ov59_02239A24
ov59_02239A24: @ 0x02239A24
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _02239C5C @ =0x0223C7F0
	movs r7, #0
	adds r4, r5, #0
_02239A2E:
	movs r0, #0x93
	movs r1, #0x25
	lsls r0, r0, #2
	lsls r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl FUN_0200D2B4
	movs r1, #0x95
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	adds r7, r7, #1
	adds r6, #0x28
	adds r4, r4, #4
	cmp r7, #1
	ble _02239A2E
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_02024A04
	ldr r6, _02239C60 @ =0x0223C6C4
	movs r7, #0
_02239A76:
	adds r0, r7, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r4, r5, r0
	movs r0, #0x93
	movs r1, #0x25
	lsls r0, r0, #2
	lsls r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _02239C64 @ =0x0223C840
	bl FUN_0200D2B4
	movs r1, #0x95
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r4, r0]
	bl FUN_0200DD88
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0202484C
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x95
	lsls r0, r0, #2
	adds r1, r7, #0
	ldr r0, [r4, r0]
	adds r1, #9
	bl FUN_020248F0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_02024A04
	adds r7, r7, #1
	adds r6, r6, #4
	cmp r7, #7
	blt _02239A76
	adds r0, r5, #0
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #1
	beq _02239AF0
	cmp r0, #2
	beq _02239B56
	pop {r3, r4, r5, r6, r7, pc}
_02239AF0:
	ldr r7, _02239C5C @ =0x0223C7F0
	movs r4, #0
_02239AF4:
	adds r0, r4, #0
	adds r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r6, r5, r0
	movs r0, #0x93
	movs r1, #0x25
	lsls r0, r0, #2
	lsls r1, r1, #4
	adds r3, r4, #3
	movs r2, #0x28
	muls r2, r3, r2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r7, r2
	bl FUN_0200D2B4
	movs r1, #0x95
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r0, r1, #0
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_0202484C
	adds r4, r4, #1
	cmp r4, #2
	blt _02239AF4
	movs r0, #0x9e
	ldrb r1, [r5, #0x14]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, #0x10
	bl FUN_020248F0
	movs r0, #0x9e
	ldrb r1, [r5, #0x17]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r1, #5
	bl FUN_02024A14
	pop {r3, r4, r5, r6, r7, pc}
_02239B56:
	movs r0, #0x1c
	movs r7, #0
	movs r6, #0x70
	str r0, [sp]
_02239B5E:
	adds r0, r7, #0
	adds r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r4, r5, r0
	movs r0, #0x93
	movs r1, #0x25
	lsls r0, r0, #2
	lsls r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _02239C68 @ =0x0223C8B8
	bl FUN_0200D2B4
	movs r1, #0x95
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	lsls r2, r6, #0x10
	ldr r0, [r4, r0]
	movs r1, #0xa0
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [sp]
	bl FUN_020248F0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024A04
	ldr r0, [sp]
	adds r7, r7, #1
	adds r0, r0, #2
	adds r6, #0x18
	str r0, [sp]
	cmp r7, #2
	blt _02239B5E
	movs r6, #0
_02239BCE:
	adds r0, r6, #0
	adds r0, #0xb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r4, r5, r0
	movs r0, #0x93
	movs r1, #0x25
	lsls r0, r0, #2
	lsls r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _02239C6C @ =0x0223C8E0
	bl FUN_0200D2B4
	movs r1, #0x95
	lsls r1, r1, #2
	str r0, [r4, r1]
	lsrs r1, r6, #0x1f
	lsls r2, r6, #0x1f
	subs r2, r2, r1
	movs r0, #0x1f
	rors r2, r0
	adds r7, r1, r2
	adds r1, r6, r1
	asrs r2, r1, #1
	movs r1, #0x15
	mvns r1, r1
	muls r1, r2, r1
	movs r2, #0x28
	movs r0, #0x95
	muls r2, r7, r2
	lsls r0, r0, #2
	adds r1, #0x67
	adds r2, #0x60
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r4, r0]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0202484C
	movs r0, #0x95
	lsls r0, r0, #2
	lsls r1, r7, #1
	ldr r0, [r4, r0]
	adds r1, #0x18
	bl FUN_020248F0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024A04
	adds r6, r6, #1
	cmp r6, #4
	blt _02239BCE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02239C5C: .4byte 0x0223C7F0
_02239C60: .4byte 0x0223C6C4
_02239C64: .4byte 0x0223C840
_02239C68: .4byte 0x0223C8B8
_02239C6C: .4byte 0x0223C8E0
	thumb_func_end ov59_02239A24

	thumb_func_start ov59_02239C70
ov59_02239C70: @ 0x02239C70
	push {r4, r5, r6, lr}
	movs r6, #0x95
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_02239C7A:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _02239C84
	bl FUN_02024758
_02239C84:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xf
	blt _02239C7A
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov59_02239C70

	thumb_func_start ov59_02239C90
ov59_02239C90: @ 0x02239C90
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r6, r0, #0
	ldrb r0, [r5, #4]
	ldr r4, [r5]
	cmp r0, #0
	beq _02239CA4
	cmp r0, #1
	b _02239CDE
_02239CA4:
	ldr r0, [r5, #0x14]
	add r1, sp, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [r5, #0x1c]
	bl FUN_020247D4
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #0xc]
	adds r0, r1, r0
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r0, [r5, #0x10]
	adds r0, r1, r0
	str r0, [r5, #0x18]
	ldrb r1, [r5, #6]
	adds r0, r1, #1
	strb r0, [r5, #6]
	ldrb r0, [r5, #5]
	cmp r1, r0
	blo _02239D04
	ldrb r0, [r5, #4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r5, #4]
	pop {r3, r4, r5, r6, pc}
_02239CDE:
	movs r1, #8
	movs r2, #0xa
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #0x1c]
	bl FUN_0200DD88
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	adds r4, #0x50
	subs r0, r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_0200E390
_02239D04:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov59_02239C90

	thumb_func_start ov59_02239D08
ov59_02239D08: @ 0x02239D08
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #6
	beq _02239D1E
	cmp r4, #0xc
	beq _02239D3A
	cmp r4, #0x15
	beq _02239D7E
	b _02239DDE
_02239D1E:
	ldr r0, [r5, #0x10]
	bl FUN_02031C08
	movs r1, #0
	str r1, [sp]
	movs r3, #1
	str r3, [sp, #4]
	adds r6, r0, #0
	movs r2, #5
	ldr r0, [r5, #0x60]
	subs r2, r2, r6
	bl FUN_0200BFCC
	b _02239DEE
_02239D3A:
	adds r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #1
	ldr r0, [r5, #0x60]
	bls _02239D56
	adds r2, r5, #0
	adds r2, #0x4d
	ldrb r3, [r2]
	ldr r2, _02239E08 @ =0x000001E5
	movs r1, #0
	adds r2, r3, r2
	bl FUN_0200C134
	b _02239D66
_02239D56:
	adds r2, r5, #0
	adds r2, #0x4d
	ldrb r3, [r2]
	ldr r2, _02239E08 @ =0x000001E5
	movs r1, #0
	adds r2, r3, r2
	bl FUN_0200C0CC
_02239D66:
	movs r0, #0
	adds r2, r5, #0
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	adds r2, #0x4e
	ldrb r2, [r2]
	ldr r0, [r5, #0x60]
	movs r3, #2
	bl FUN_0200BFCC
	b _02239DEE
_02239D7E:
	adds r0, #0x22
	bl FUN_02032004
	adds r1, r0, #0
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x64]
	adds r1, #0x13
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r3, #2
	str r3, [sp, #4]
	ldr r0, [r5, #0x60]
	ldr r2, [r5, #0x64]
	bl FUN_0200BE3C
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldrb r2, [r5, #0x15]
	ldr r0, [r5, #0x60]
	movs r3, #3
	bl FUN_0200BFCC
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldrb r2, [r5, #0x16]
	ldr r0, [r5, #0x60]
	movs r1, #2
	movs r3, #3
	bl FUN_0200BFCC
	movs r0, #0
	str r0, [sp]
	movs r3, #1
	str r3, [sp, #4]
	ldrb r6, [r5, #0x18]
	movs r2, #5
	ldr r0, [r5, #0x60]
	movs r1, #3
	subs r2, r2, r6
	bl FUN_0200BFCC
	b _02239DEE
_02239DDE:
	adds r4, #0x1b
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	adds r1, r4, #0
	bl FUN_0200BB6C
	add sp, #8
	pop {r4, r5, r6, pc}
_02239DEE:
	adds r4, #0x1b
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x64]
	adds r1, r4, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x60]
	ldr r1, [r5, #0x68]
	ldr r2, [r5, #0x64]
	bl FUN_0200CBBC
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_02239E08: .4byte 0x000001E5
	thumb_func_end ov59_02239D08

	thumb_func_start ov59_02239E0C
ov59_02239E0C: @ 0x02239E0C
	push {r3, r4}
	ldrh r4, [r1]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x1c
	subs r3, r0, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	cmp r2, #0
	beq _02239E78
	cmp r2, #1
	beq _02239E5C
	cmp r2, #2
	bne _02239E78
	lsls r1, r4, #0x1c
	lsrs r1, r1, #0x1c
	cmp r1, #6
	bne _02239E34
	movs r0, #0x7a
	pop {r3, r4}
	bx lr
_02239E34:
	cmp r1, #5
	bne _02239E3E
	movs r0, #0x79
	pop {r3, r4}
	bx lr
_02239E3E:
	cmp r0, #0
	bne _02239E4C
	adds r1, #0x7b
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4}
	bx lr
_02239E4C:
	lsls r0, r1, #1
	adds r0, r1, r0
	adds r0, r3, r0
	adds r0, #0x6a
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4}
	bx lr
_02239E5C:
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #6
	bne _02239E6A
	movs r0, #0x7a
	pop {r3, r4}
	bx lr
_02239E6A:
	lsls r0, r0, #2
	adds r0, r3, r0
	adds r0, #0x56
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4}
	bx lr
_02239E78:
	ldrh r0, [r1]
	lsls r0, r0, #0x1c
	lsrs r1, r0, #0x1c
	cmp r1, #6
	bne _02239E88
	movs r0, #0x83
	pop {r3, r4}
	bx lr
_02239E88:
	cmp r1, #5
	bne _02239E96
	adds r3, #0x80
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4}
	bx lr
_02239E96:
	movs r0, #6
	muls r0, r1, r0
	adds r0, r3, r0
	adds r0, #0x38
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov59_02239E0C

	thumb_func_start ov59_02239EA8
ov59_02239EA8: @ 0x02239EA8
	adds r1, r0, #0
	adds r1, #0x49
	ldrb r1, [r1]
	cmp r1, #3
	bhi _02239EF2
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02239EBE: @ jump table
	.2byte _02239EC6 - _02239EBE - 2 @ case 0
	.2byte _02239ED0 - _02239EBE - 2 @ case 1
	.2byte _02239EDE - _02239EBE - 2 @ case 2
	.2byte _02239EEE - _02239EBE - 2 @ case 3
_02239EC6:
	adds r0, #0x4a
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x18
	bx lr
_02239ED0:
	adds r0, #0x4a
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
_02239EDE:
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #1
	bne _02239EEA
	movs r0, #7
	bx lr
_02239EEA:
	movs r0, #8
	bx lr
_02239EEE:
	movs r0, #8
	bx lr
_02239EF2:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov59_02239EA8

	thumb_func_start ov59_02239EF8
ov59_02239EF8: @ 0x02239EF8
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	add r1, sp, #0
	adds r4, r0, #0
	bl ov59_0223A120
	ldr r1, [sp]
	cmp r1, #0
	bne _02239F14
	adds r0, r4, #0
	bl ov59_0223A0B8
_02239F14:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov59_02239EF8

	thumb_func_start ov59_02239F18
ov59_02239F18: @ 0x02239F18
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	add r1, sp, #0
	adds r4, r0, #0
	bl ov59_0223A2D0
	ldr r1, [sp]
	cmp r1, #0
	bne _02239F34
	adds r0, r4, #0
	bl ov59_0223A268
_02239F34:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov59_02239F18

	thumb_func_start ov59_02239F38
ov59_02239F38: @ 0x02239F38
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	add r2, sp, #0
	adds r0, r0, #2
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	bl FUN_0200DE00
	add r3, sp, #0
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, _0223A028 @ =0x0223C940
	bl FUN_020253F0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl FUN_0202534C
	cmp r0, #0
	beq _0223A00A
	ldr r0, _0223A02C @ =0x021D114C
	add r2, sp, #0
	ldrh r1, [r0, #0x20]
	movs r3, #0
	strh r1, [r2, #2]
	ldrh r0, [r0, #0x22]
	strh r0, [r2]
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	adds r0, r0, #2
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl FUN_0200DD88
	movs r0, #0x96
	lsls r0, r0, #2
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	movs r1, #2
	ldrsh r1, [r3, r1]
	subs r2, r2, #6
	lsls r2, r2, #0x10
	ldr r0, [r5, r0]
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	cmp r4, #0
	beq _02239FE0
	adds r0, r5, #0
	adds r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	bne _0223A004
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0x53
	strb r1, [r0]
	ldr r0, _0223A030 @ =0x000008E6
	bl FUN_0200604C
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x15
	bl FUN_020248F0
	b _0223A004
_02239FE0:
	adds r0, r5, #0
	adds r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _0223A004
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x53
	strb r1, [r0]
	ldr r0, _0223A030 @ =0x000008E6
	bl FUN_0200604C
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x14
	bl FUN_020248F0
_0223A004:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_0223A00A:
	movs r0, #0
	adds r5, #0x53
	strb r0, [r5]
	cmp r4, #0
	beq _0223A01E
	ldr r0, _0223A034 @ =0x000005EA
	bl FUN_0200604C
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223A01E:
	ldr r0, _0223A038 @ =0x00000682
	bl FUN_0200604C
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223A028: .4byte 0x0223C940
_0223A02C: .4byte 0x021D114C
_0223A030: .4byte 0x000008E6
_0223A034: .4byte 0x000005EA
_0223A038: .4byte 0x00000682
	thumb_func_end ov59_02239F38

	thumb_func_start ov59_0223A03C
ov59_0223A03C: @ 0x0223A03C
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	add r1, sp, #0
	adds r4, r0, #0
	bl ov59_0223A418
	ldr r1, [sp]
	cmp r1, #0
	bne _0223A058
	adds r0, r4, #0
	bl ov59_0223A3B0
_0223A058:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov59_0223A03C

	thumb_func_start ov59_0223A05C
ov59_0223A05C: @ 0x0223A05C
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	add r1, sp, #0
	adds r4, r0, #0
	bl ov59_0223A614
	ldr r1, [sp]
	cmp r1, #0
	bne _0223A078
	adds r0, r4, #0
	bl ov59_0223A58C
_0223A078:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov59_0223A05C

	thumb_func_start ov59_0223A07C
ov59_0223A07C: @ 0x0223A07C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #6
	bhi _0223A09A
	ldr r0, _0223A0B4 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov59_022388C4
	adds r5, #0x4d
	strb r4, [r5]
	movs r0, #3
	pop {r3, r4, r5, pc}
_0223A09A:
	cmp r4, #8
	bne _0223A0B0
	ldr r0, _0223A0B4 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #1
	bl ov59_022387D0
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223A0B0:
	movs r0, #3
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223A0B4: .4byte 0x000005DC
	thumb_func_end ov59_0223A07C

	thumb_func_start ov59_0223A0B8
ov59_0223A0B8: @ 0x0223A0B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223A114 @ =0x021D110C
	ldr r1, [r0, #0x48]
	ldr r0, _0223A118 @ =0x00000CF3
	tst r0, r1
	beq _0223A0CA
	movs r0, #0
	str r0, [r4, #0x40]
_0223A0CA:
	ldr r0, _0223A114 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _0223A0DE
	adds r0, r4, #0
	movs r1, #8
	bl ov59_0223A07C
	pop {r4, pc}
_0223A0DE:
	movs r0, #1
	tst r0, r1
	beq _0223A0F4
	adds r0, r4, #0
	bl ov59_02239EA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov59_0223A07C
	pop {r4, pc}
_0223A0F4:
	adds r0, r4, #0
	bl ov59_0223A678
	cmp r0, #0
	beq _0223A10E
	ldr r0, _0223A11C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov59_022388C4
	movs r0, #3
	pop {r4, pc}
_0223A10E:
	movs r0, #3
	pop {r4, pc}
	nop
_0223A114: .4byte 0x021D110C
_0223A118: .4byte 0x00000CF3
_0223A11C: .4byte 0x000005DC
	thumb_func_end ov59_0223A0B8

	thumb_func_start ov59_0223A120
ov59_0223A120: @ 0x0223A120
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0223A190 @ =0x0223C924
	adds r5, r1, #0
	bl FUN_0202529C
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0223A13A
	cmp r1, #7
	bne _0223A13E
_0223A13A:
	movs r0, #3
	pop {r3, r4, r5, pc}
_0223A13E:
	movs r0, #1
	str r0, [r5]
	adds r2, r4, #0
	str r0, [r4, #0x40]
	movs r0, #0
	adds r2, #0x4c
	strb r0, [r2]
	adds r2, r4, #0
	adds r2, #0x4c
	ldrb r3, [r2]
	adds r2, r4, #0
	adds r2, #0x4b
	strb r3, [r2]
	adds r2, r4, #0
	adds r2, #0x4a
	strb r0, [r2]
	cmp r1, #8
	bne _0223A16A
	adds r0, r4, #0
	movs r2, #2
	adds r0, #0x49
	b _0223A184
_0223A16A:
	lsrs r3, r1, #0x1f
	lsls r2, r1, #0x1f
	subs r2, r2, r3
	movs r0, #0x1f
	rors r2, r0
	adds r0, r4, #0
	adds r2, r3, r2
	adds r0, #0x49
	strb r2, [r0]
	adds r3, r1, r3
	adds r0, r4, #0
	asrs r2, r3, #1
	adds r0, #0x4a
_0223A184:
	strb r2, [r0]
	adds r0, r4, #0
	bl ov59_0223A07C
	pop {r3, r4, r5, pc}
	nop
_0223A190: .4byte 0x0223C924
	thumb_func_end ov59_0223A120

	thumb_func_start ov59_0223A194
ov59_0223A194: @ 0x0223A194
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #6
	bhi _0223A1C8
	bl ov59_022388C4
	adds r0, r5, r4
	ldrb r0, [r0, #0x1a]
	cmp r0, #0
	bne _0223A1AE
	movs r0, #4
	pop {r3, r4, r5, pc}
_0223A1AE:
	ldr r0, _0223A260 @ =0x000005EB
	bl FUN_0200604C
	adds r0, r5, #0
	adds r0, #0x4d
	strb r4, [r0]
	ldr r0, [r5, #0x40]
	cmp r0, #0
	bne _0223A1C4
	movs r0, #7
	pop {r3, r4, r5, pc}
_0223A1C4:
	movs r0, #8
	pop {r3, r4, r5, pc}
_0223A1C8:
	cmp r4, #8
	bne _0223A1DE
	ldr r0, _0223A264 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #1
	bl ov59_022387D0
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223A1DE:
	cmp r4, #7
	bne _0223A25A
	ldr r0, _0223A264 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov59_022388C4
	adds r0, r5, #0
	adds r0, #0x4d
	strb r4, [r0]
	ldrb r1, [r5, #0x14]
	cmp r1, #0
	bne _0223A216
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne _0223A216
	adds r0, r5, #0
	movs r1, #0x19
	movs r2, #0xff
	bl ov59_02238CFC
	adds r0, r5, #0
	movs r1, #1
	bl ov59_02238FF4
	movs r0, #0xf
	pop {r3, r4, r5, pc}
_0223A216:
	cmp r1, #0
	bne _0223A236
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	beq _0223A236
	adds r0, r5, #0
	movs r1, #0x1b
	movs r2, #0xff
	bl ov59_02238CFC
	adds r0, r5, #0
	movs r1, #1
	bl ov59_02238FF4
	movs r0, #0xf
	pop {r3, r4, r5, pc}
_0223A236:
	cmp r1, #0
	beq _0223A256
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	beq _0223A256
	adds r0, r5, #0
	movs r1, #0x1c
	movs r2, #0xff
	bl ov59_02238CFC
	adds r0, r5, #0
	movs r1, #1
	bl ov59_02238FF4
	movs r0, #0xf
	pop {r3, r4, r5, pc}
_0223A256:
	movs r0, #0xb
	pop {r3, r4, r5, pc}
_0223A25A:
	movs r0, #4
	pop {r3, r4, r5, pc}
	nop
_0223A260: .4byte 0x000005EB
_0223A264: .4byte 0x000005DC
	thumb_func_end ov59_0223A194

	thumb_func_start ov59_0223A268
ov59_0223A268: @ 0x0223A268
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223A2C4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	ldr r0, _0223A2C8 @ =0x00000CF3
	tst r0, r1
	beq _0223A27A
	movs r0, #0
	str r0, [r4, #0x40]
_0223A27A:
	ldr r0, _0223A2C4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _0223A28E
	adds r0, r4, #0
	movs r1, #8
	bl ov59_0223A194
	pop {r4, pc}
_0223A28E:
	movs r0, #1
	tst r0, r1
	beq _0223A2A4
	adds r0, r4, #0
	bl ov59_02239EA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov59_0223A194
	pop {r4, pc}
_0223A2A4:
	adds r0, r4, #0
	bl ov59_0223A678
	cmp r0, #0
	beq _0223A2BE
	ldr r0, _0223A2CC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov59_022388C4
	movs r0, #4
	pop {r4, pc}
_0223A2BE:
	movs r0, #4
	pop {r4, pc}
	nop
_0223A2C4: .4byte 0x021D110C
_0223A2C8: .4byte 0x00000CF3
_0223A2CC: .4byte 0x000005DC
	thumb_func_end ov59_0223A268

	thumb_func_start ov59_0223A2D0
ov59_0223A2D0: @ 0x0223A2D0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0223A34C @ =0x0223C924
	adds r5, r1, #0
	bl FUN_0202529C
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	bne _0223A2EA
	movs r0, #4
	pop {r3, r4, r5, pc}
_0223A2EA:
	movs r0, #1
	str r0, [r5]
	adds r2, r4, #0
	str r0, [r4, #0x40]
	movs r0, #0
	adds r2, #0x4c
	strb r0, [r2]
	adds r2, r4, #0
	adds r2, #0x4c
	ldrb r3, [r2]
	adds r2, r4, #0
	adds r2, #0x4b
	strb r3, [r2]
	adds r2, r4, #0
	adds r2, #0x4a
	strb r0, [r2]
	cmp r1, #7
	beq _0223A314
	cmp r1, #8
	beq _0223A31E
	b _0223A328
_0223A314:
	adds r0, r4, #0
	movs r2, #2
	adds r0, #0x49
	strb r2, [r0]
	b _0223A344
_0223A31E:
	adds r0, r4, #0
	movs r2, #3
	adds r0, #0x49
	strb r2, [r0]
	b _0223A344
_0223A328:
	lsrs r3, r1, #0x1f
	lsls r2, r1, #0x1f
	subs r2, r2, r3
	movs r0, #0x1f
	rors r2, r0
	adds r0, r4, #0
	adds r2, r3, r2
	adds r0, #0x49
	strb r2, [r0]
	adds r3, r1, r3
	adds r0, r4, #0
	asrs r2, r3, #1
	adds r0, #0x4a
	strb r2, [r0]
_0223A344:
	adds r0, r4, #0
	bl ov59_0223A194
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223A34C: .4byte 0x0223C924
	thumb_func_end ov59_0223A2D0

	thumb_func_start ov59_0223A350
ov59_0223A350: @ 0x0223A350
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #6
	bhi _0223A392
	ldr r0, _0223A3AC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov59_022388C4
	adds r0, r5, r4
	ldrb r0, [r0, #0x1a]
	cmp r0, #0
	bne _0223A372
	movs r0, #5
	pop {r3, r4, r5, pc}
_0223A372:
	adds r0, r5, #0
	adds r0, #0x4d
	strb r4, [r0]
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0x4e
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #0x1a]
	adds r5, #0x4f
	strb r0, [r5]
	movs r0, #6
	pop {r3, r4, r5, pc}
_0223A392:
	cmp r4, #8
	bne _0223A3A8
	ldr r0, _0223A3AC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #1
	bl ov59_022387D0
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223A3A8:
	movs r0, #5
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223A3AC: .4byte 0x000005DC
	thumb_func_end ov59_0223A350

	thumb_func_start ov59_0223A3B0
ov59_0223A3B0: @ 0x0223A3B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223A40C @ =0x021D110C
	ldr r1, [r0, #0x48]
	ldr r0, _0223A410 @ =0x00000CF3
	tst r0, r1
	beq _0223A3C2
	movs r0, #0
	str r0, [r4, #0x40]
_0223A3C2:
	ldr r0, _0223A40C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _0223A3D6
	adds r0, r4, #0
	movs r1, #8
	bl ov59_0223A350
	pop {r4, pc}
_0223A3D6:
	movs r0, #1
	tst r0, r1
	beq _0223A3EC
	adds r0, r4, #0
	bl ov59_02239EA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov59_0223A350
	pop {r4, pc}
_0223A3EC:
	adds r0, r4, #0
	bl ov59_0223A678
	cmp r0, #0
	beq _0223A406
	ldr r0, _0223A414 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov59_022388C4
	movs r0, #5
	pop {r4, pc}
_0223A406:
	movs r0, #5
	pop {r4, pc}
	nop
_0223A40C: .4byte 0x021D110C
_0223A410: .4byte 0x00000CF3
_0223A414: .4byte 0x000005DC
	thumb_func_end ov59_0223A3B0

	thumb_func_start ov59_0223A418
ov59_0223A418: @ 0x0223A418
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0223A488 @ =0x0223C924
	adds r5, r1, #0
	bl FUN_0202529C
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0223A432
	cmp r1, #7
	bne _0223A436
_0223A432:
	movs r0, #5
	pop {r3, r4, r5, pc}
_0223A436:
	movs r0, #1
	str r0, [r5]
	adds r2, r4, #0
	str r0, [r4, #0x40]
	movs r0, #0
	adds r2, #0x4c
	strb r0, [r2]
	adds r2, r4, #0
	adds r2, #0x4c
	ldrb r3, [r2]
	adds r2, r4, #0
	adds r2, #0x4b
	strb r3, [r2]
	adds r2, r4, #0
	adds r2, #0x4a
	strb r0, [r2]
	cmp r1, #8
	bne _0223A462
	adds r0, r4, #0
	movs r2, #2
	adds r0, #0x49
	b _0223A47C
_0223A462:
	lsrs r3, r1, #0x1f
	lsls r2, r1, #0x1f
	subs r2, r2, r3
	movs r0, #0x1f
	rors r2, r0
	adds r0, r4, #0
	adds r2, r3, r2
	adds r0, #0x49
	strb r2, [r0]
	adds r3, r1, r3
	adds r0, r4, #0
	asrs r2, r3, #1
	adds r0, #0x4a
_0223A47C:
	strb r2, [r0]
	adds r0, r4, #0
	bl ov59_0223A350
	pop {r3, r4, r5, pc}
	nop
_0223A488: .4byte 0x0223C924
	thumb_func_end ov59_0223A418

	thumb_func_start ov59_0223A48C
ov59_0223A48C: @ 0x0223A48C
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	bne _0223A4A8
	ldr r0, _0223A560 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl ov59_02238834
	movs r0, #0
	pop {r4, pc}
_0223A4A8:
	cmp r1, #1
	bne _0223A4C0
	ldr r0, _0223A560 @ =0x000005DC
	bl FUN_0200604C
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov59_02238834
	movs r0, #1
	pop {r4, pc}
_0223A4C0:
	cmp r1, #5
	bhi _0223A548
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223A4D0: @ jump table
	.2byte _0223A548 - _0223A4D0 - 2 @ case 0
	.2byte _0223A548 - _0223A4D0 - 2 @ case 1
	.2byte _0223A4DC - _0223A4D0 - 2 @ case 2
	.2byte _0223A510 - _0223A4D0 - 2 @ case 3
	.2byte _0223A4F6 - _0223A4D0 - 2 @ case 4
	.2byte _0223A52C - _0223A4D0 - 2 @ case 5
_0223A4DC:
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x4e
	adds r1, #0x4f
	ldrb r0, [r0]
	ldrb r1, [r1]
	movs r2, #1
	bl ov59_0223A564
	adds r1, r4, #0
	adds r1, #0x4e
	strb r0, [r1]
	b _0223A54C
_0223A4F6:
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x4e
	adds r1, #0x4f
	ldrb r0, [r0]
	ldrb r1, [r1]
	movs r2, #0xa
	bl ov59_0223A564
	adds r1, r4, #0
	adds r1, #0x4e
	strb r0, [r1]
	b _0223A54C
_0223A510:
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x4e
	adds r1, #0x4f
	movs r2, #0
	ldrb r0, [r0]
	ldrb r1, [r1]
	mvns r2, r2
	bl ov59_0223A564
	adds r1, r4, #0
	adds r1, #0x4e
	strb r0, [r1]
	b _0223A54C
_0223A52C:
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x4e
	adds r1, #0x4f
	movs r2, #9
	ldrb r0, [r0]
	ldrb r1, [r1]
	mvns r2, r2
	bl ov59_0223A564
	adds r1, r4, #0
	adds r1, #0x4e
	strb r0, [r1]
	b _0223A54C
_0223A548:
	movs r0, #6
	pop {r4, pc}
_0223A54C:
	ldr r0, _0223A560 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r4, #0x4e
	ldrb r1, [r4]
	bl ov59_02238A04
	movs r0, #6
	pop {r4, pc}
	.align 2, 0
_0223A560: .4byte 0x000005DC
	thumb_func_end ov59_0223A48C

	thumb_func_start ov59_0223A564
ov59_0223A564: @ 0x0223A564
	cmp r2, #0
	ble _0223A57A
	cmp r0, r1
	bne _0223A570
	movs r0, #1
	bx lr
_0223A570:
	adds r0, r0, r2
	cmp r0, r1
	ble _0223A58A
	adds r0, r1, #0
	bx lr
_0223A57A:
	cmp r0, #1
	bne _0223A582
	adds r0, r1, #0
	bx lr
_0223A582:
	adds r0, r0, r2
	cmp r0, #0
	bgt _0223A58A
	movs r0, #1
_0223A58A:
	bx lr
	thumb_func_end ov59_0223A564

	thumb_func_start ov59_0223A58C
ov59_0223A58C: @ 0x0223A58C
	push {r3, lr}
	ldr r1, _0223A608 @ =0x021D110C
	ldr r2, [r1, #0x48]
	ldr r1, _0223A60C @ =0x00000CF3
	tst r1, r2
	beq _0223A59C
	movs r1, #0
	str r1, [r0, #0x40]
_0223A59C:
	ldr r1, _0223A608 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #2
	adds r3, r2, #0
	tst r3, r1
	beq _0223A5B0
	movs r1, #1
	bl ov59_0223A48C
	pop {r3, pc}
_0223A5B0:
	movs r3, #1
	tst r3, r2
	beq _0223A5BE
	movs r1, #0
	bl ov59_0223A48C
	pop {r3, pc}
_0223A5BE:
	movs r3, #0x40
	tst r3, r2
	beq _0223A5CA
	bl ov59_0223A48C
	pop {r3, pc}
_0223A5CA:
	movs r1, #0x80
	adds r3, r2, #0
	ands r3, r1
	beq _0223A5DA
	movs r1, #3
	bl ov59_0223A48C
	pop {r3, pc}
_0223A5DA:
	movs r1, #0x10
	tst r1, r2
	beq _0223A5E8
	movs r1, #4
	bl ov59_0223A48C
	pop {r3, pc}
_0223A5E8:
	movs r1, #0x20
	tst r1, r2
	beq _0223A5F6
	movs r1, #5
	bl ov59_0223A48C
	pop {r3, pc}
_0223A5F6:
	cmp r3, #0
	beq _0223A604
	ldr r0, _0223A610 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #6
	pop {r3, pc}
_0223A604:
	movs r0, #6
	pop {r3, pc}
	.align 2, 0
_0223A608: .4byte 0x021D110C
_0223A60C: .4byte 0x00000CF3
_0223A610: .4byte 0x000005DC
	thumb_func_end ov59_0223A58C

	thumb_func_start ov59_0223A614
ov59_0223A614: @ 0x0223A614
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0223A674 @ =0x0223C908
	str r1, [sp]
	bl FUN_0202529C
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0223A62E
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_0223A62E:
	subs r0, r4, #4
	cmp r0, #1
	bhi _0223A642
	adds r0, r5, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #0xa
	bhs _0223A642
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_0223A642:
	cmp r4, #2
	blt _0223A660
	movs r0, #0x95
	lsls r0, r0, #2
	adds r6, r5, r0
	adds r0, r4, #0
	adds r0, #9
	lsls r7, r0, #2
	ldr r0, [r6, r7]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, [r6, r7]
	bl FUN_02024964
_0223A660:
	ldr r0, [sp]
	movs r1, #1
	str r1, [r0]
	str r1, [r5, #0x40]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov59_0223A48C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A674: .4byte 0x0223C908
	thumb_func_end ov59_0223A614

	thumb_func_start ov59_0223A678
ov59_0223A678: @ 0x0223A678
	push {r3, lr}
	adds r1, r0, #0
	adds r1, #0x49
	ldrb r1, [r1]
	cmp r1, #3
	bhi _0223A6E4
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223A690: @ jump table
	.2byte _0223A698 - _0223A690 - 2 @ case 0
	.2byte _0223A6FE - _0223A690 - 2 @ case 1
	.2byte _0223A78C - _0223A690 - 2 @ case 2
	.2byte _0223A7DA - _0223A690 - 2 @ case 3
_0223A698:
	ldr r1, _0223A7F8 @ =0x021D110C
	movs r2, #0x10
	ldr r1, [r1, #0x48]
	tst r2, r1
	beq _0223A6AC
	movs r1, #0
	bl ov59_0223A7FC
	movs r0, #1
	pop {r3, pc}
_0223A6AC:
	movs r2, #0x40
	tst r2, r1
	beq _0223A6D4
	adds r2, r0, #0
	adds r2, #0x4a
	ldrb r2, [r2]
	cmp r2, #0
	beq _0223A6D4
	adds r1, r0, #0
	movs r2, #0
	adds r1, #0x4c
	strb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x4a
	ldrb r1, [r1]
	adds r0, #0x4a
	subs r1, r1, #1
	strb r1, [r0]
	movs r0, #1
	pop {r3, pc}
_0223A6D4:
	movs r2, #0x80
	tst r1, r2
	beq _0223A6E4
	adds r1, r0, #0
	adds r1, #0x4a
	ldrb r1, [r1]
	cmp r1, #3
	blo _0223A6E6
_0223A6E4:
	b _0223A7F4
_0223A6E6:
	adds r1, r0, #0
	movs r2, #0
	adds r1, #0x4c
	strb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x4a
	ldrb r1, [r1]
	adds r0, #0x4a
	adds r1, r1, #1
	strb r1, [r0]
	movs r0, #1
	pop {r3, pc}
_0223A6FE:
	ldr r1, _0223A7F8 @ =0x021D110C
	movs r2, #0x20
	ldr r1, [r1, #0x48]
	tst r2, r1
	beq _0223A712
	movs r1, #1
	bl ov59_0223A7FC
	movs r0, #1
	pop {r3, pc}
_0223A712:
	movs r2, #0x10
	tst r2, r1
	beq _0223A73C
	adds r1, r0, #0
	adds r1, #0x4a
	ldrb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x4c
	strb r2, [r1]
	adds r1, r0, #0
	movs r2, #0
	adds r1, #0x4a
	strb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x49
	ldrb r1, [r1]
	adds r0, #0x49
	adds r1, r1, #1
	strb r1, [r0]
	movs r0, #1
	pop {r3, pc}
_0223A73C:
	movs r2, #0x40
	tst r2, r1
	beq _0223A764
	adds r2, r0, #0
	adds r2, #0x4a
	ldrb r2, [r2]
	cmp r2, #0
	beq _0223A764
	adds r1, r0, #0
	movs r2, #0
	adds r1, #0x4b
	strb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x4a
	ldrb r1, [r1]
	adds r0, #0x4a
	subs r1, r1, #1
	strb r1, [r0]
	movs r0, #1
	pop {r3, pc}
_0223A764:
	movs r2, #0x80
	tst r1, r2
	beq _0223A7F4
	adds r1, r0, #0
	adds r1, #0x4a
	ldrb r1, [r1]
	cmp r1, #2
	bhs _0223A7F4
	adds r1, r0, #0
	movs r2, #0
	adds r1, #0x4b
	strb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x4a
	ldrb r1, [r1]
	adds r0, #0x4a
	adds r1, r1, #1
	strb r1, [r0]
	movs r0, #1
	pop {r3, pc}
_0223A78C:
	ldr r1, _0223A7F8 @ =0x021D110C
	ldr r3, [r1, #0x48]
	movs r1, #0x20
	tst r1, r3
	beq _0223A7B2
	adds r1, r0, #0
	adds r1, #0x4c
	ldrb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x4a
	strb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x49
	ldrb r1, [r1]
	adds r0, #0x49
	subs r1, r1, #1
	strb r1, [r0]
	movs r0, #1
	pop {r3, pc}
_0223A7B2:
	adds r1, r0, #0
	adds r1, #0x44
	ldrb r2, [r1]
	cmp r2, #2
	bne _0223A7C0
	movs r0, #0
	pop {r3, pc}
_0223A7C0:
	movs r1, #0x90
	tst r1, r3
	beq _0223A7F4
	cmp r2, #0
	beq _0223A7F4
	adds r1, r0, #0
	adds r1, #0x49
	ldrb r1, [r1]
	adds r0, #0x49
	adds r1, r1, #1
	strb r1, [r0]
	movs r0, #1
	pop {r3, pc}
_0223A7DA:
	ldr r1, _0223A7F8 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #0x60
	tst r1, r2
	beq _0223A7F4
	adds r1, r0, #0
	adds r1, #0x49
	ldrb r1, [r1]
	adds r0, #0x49
	subs r1, r1, #1
	strb r1, [r0]
	movs r0, #1
	pop {r3, pc}
_0223A7F4:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_0223A7F8: .4byte 0x021D110C
	thumb_func_end ov59_0223A678

	thumb_func_start ov59_0223A7FC
ov59_0223A7FC: @ 0x0223A7FC
	cmp r1, #0
	bne _0223A85E
	adds r1, r0, #0
	adds r1, #0x4a
	ldrb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x4b
	strb r2, [r1]
	adds r1, r0, #0
	movs r2, #1
	adds r1, #0x49
	strb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x4a
	ldrb r1, [r1]
	cmp r1, #3
	bhi _0223A856
	adds r3, r1, r1
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_0223A82A: @ jump table
	.2byte _0223A856 - _0223A82A - 2 @ case 0
	.2byte _0223A832 - _0223A82A - 2 @ case 1
	.2byte _0223A832 - _0223A82A - 2 @ case 2
	.2byte _0223A84E - _0223A82A - 2 @ case 3
_0223A832:
	adds r3, r0, #0
	adds r3, #0x4c
	ldrb r3, [r3]
	cmp r1, r3
	beq _0223A848
	subs r1, r1, #1
	cmp r1, r3
	beq _0223A848
	adds r0, #0x4a
	strb r2, [r0]
	bx lr
_0223A848:
	adds r0, #0x4a
	strb r3, [r0]
	bx lr
_0223A84E:
	movs r1, #2
	adds r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A856:
	movs r1, #0
	adds r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A85E:
	adds r1, r0, #0
	adds r1, #0x4a
	ldrb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x4c
	strb r2, [r1]
	adds r1, r0, #0
	movs r2, #0
	adds r1, #0x49
	strb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x4a
	ldrb r1, [r1]
	cmp r1, #0
	beq _0223A886
	cmp r1, #1
	beq _0223A89E
	cmp r1, #2
	beq _0223A8C2
	b _0223A8DA
_0223A886:
	adds r1, r0, #0
	adds r1, #0x4b
	ldrb r1, [r1]
	cmp r1, #1
	bls _0223A898
	movs r1, #1
	adds r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A898:
	adds r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A89E:
	adds r1, r0, #0
	adds r1, #0x4b
	ldrb r1, [r1]
	cmp r1, #0
	bne _0223A8B0
	movs r1, #1
	adds r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A8B0:
	cmp r1, #3
	bne _0223A8BC
	movs r1, #2
	adds r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A8BC:
	adds r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A8C2:
	adds r1, r0, #0
	adds r1, #0x4b
	ldrb r1, [r1]
	cmp r1, #2
	bhs _0223A8D4
	movs r1, #2
	adds r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A8D4:
	adds r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A8DA:
	adds r0, #0x4a
	strb r2, [r0]
	bx lr
	thumb_func_end ov59_0223A7FC

	thumb_func_start ov59_0223A8E0
ov59_0223A8E0: @ 0x0223A8E0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r1, [r5]
	adds r6, r0, #0
	cmp r1, #0
	beq _0223A8F2
	cmp r1, #1
	beq _0223A934
	b _0223A944
_0223A8F2:
	bl ov59_0223ACD0
	movs r2, #9
	movs r0, #3
	movs r1, #0x86
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r1, #0xbd
	adds r0, r6, #0
	lsls r1, r1, #2
	movs r2, #0x86
	bl FUN_02007280
	movs r2, #0xbd
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x86
	str r0, [r4]
	adds r0, r6, #0
	bl FUN_020072A4
	str r0, [r4, #4]
	adds r0, r4, #0
	bl ov59_0223A9E4
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0223A944
_0223A934:
	bl FUN_02007290
	bl ov59_0223AABC
	cmp r0, #0
	beq _0223A944
	movs r0, #1
	pop {r4, r5, r6, pc}
_0223A944:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_0223A8E0

	thumb_func_start ov59_0223A948
ov59_0223A948: @ 0x0223A948
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #8
	bhi _0223A9A2
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223A964: @ jump table
	.2byte _0223A976 - _0223A964 - 2 @ case 0
	.2byte _0223A97E - _0223A964 - 2 @ case 1
	.2byte _0223A986 - _0223A964 - 2 @ case 2
	.2byte _0223A9A2 - _0223A964 - 2 @ case 3
	.2byte _0223A98E - _0223A964 - 2 @ case 4
	.2byte _0223A996 - _0223A964 - 2 @ case 5
	.2byte _0223A9A2 - _0223A964 - 2 @ case 6
	.2byte _0223A9A2 - _0223A964 - 2 @ case 7
	.2byte _0223A99E - _0223A964 - 2 @ case 8
_0223A976:
	bl ov59_0223AB3C
	str r0, [r4]
	b _0223A9A2
_0223A97E:
	bl ov59_0223AB90
	str r0, [r4]
	b _0223A9A2
_0223A986:
	bl ov59_0223ABE4
	str r0, [r4]
	b _0223A9A2
_0223A98E:
	bl ov59_0223ABEC
	str r0, [r4]
	b _0223A9A2
_0223A996:
	bl ov59_0223AC48
	str r0, [r4]
	b _0223A9A2
_0223A99E:
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223A9A2:
	movs r0, #0x97
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200D020
	ldr r0, [r5, #0x78]
	bl ov59_0223C304
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov59_0223A948

	thumb_func_start ov59_0223A9B8
ov59_0223A9B8: @ 0x0223A9B8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov59_0223AB00
	cmp r0, #0
	bne _0223A9CE
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223A9CE:
	adds r0, r4, #0
	bl ov59_0223AA6C
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x86
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov59_0223A9B8

	thumb_func_start ov59_0223A9E4
ov59_0223A9E4: @ 0x0223A9E4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x14]
	bl FUN_020183F0
	str r0, [r5, #0x44]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x18]
	str r0, [r5, #8]
	bl FUN_02028EA8
	adds r4, r0, #0
	bl FUN_0202AD3C
	adds r1, r5, #0
	adds r1, #0x4b
	strb r0, [r1]
	adds r0, r4, #0
	bl FUN_0202ADCC
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	ldr r0, [r5, #8]
	bl FUN_02031B14
	str r0, [r5, #0x14]
	ldr r1, [r5, #4]
	adds r2, r5, #0
	ldr r1, [r1, #0x14]
	adds r2, #0x18
	bl FUN_02031CEC
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x18
	adds r1, #0x20
	bl FUN_02031DA0
	adds r0, r5, #0
	bl ov59_0223AE20
	adds r0, r5, #0
	adds r0, #0x49
	ldrb r4, [r0]
	movs r1, #0
	cmp r4, #0
	ble _0223AA68
	ldr r0, [r5, #4]
	adds r2, r5, #0
	ldrb r3, [r0, #0x1c]
_0223AA50:
	adds r0, r2, #0
	adds r0, #0x84
	ldrb r0, [r0]
	cmp r3, r0
	bne _0223AA60
	adds r5, #0x4a
	strb r1, [r5]
	pop {r3, r4, r5, pc}
_0223AA60:
	adds r1, r1, #1
	adds r2, #0x34
	cmp r1, r4
	blt _0223AA50
_0223AA68:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov59_0223A9E4

	thumb_func_start ov59_0223AA6C
ov59_0223AA6C: @ 0x0223AA6C
	push {r4, lr}
	adds r4, r0, #0
	bl ov59_0223AE88
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x44]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x14]
	bl FUN_02018410
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r4, r0
	adds r0, #0x84
	ldrb r1, [r0]
	ldr r0, [r4, #4]
	strb r1, [r0, #0x1c]
	adds r0, r4, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0
	beq _0223AAA2
	movs r1, #1
	b _0223AAA4
_0223AAA2:
	movs r1, #3
_0223AAA4:
	ldr r0, [r4, #4]
	strb r1, [r0, #0x18]
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0223AAB8
	adds r4, #0x48
	ldrb r0, [r4]
	strh r0, [r1]
_0223AAB8:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223AA6C

	thumb_func_start ov59_0223AABC
ov59_0223AABC: @ 0x0223AABC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r1, [r1]
	cmp r1, #0
	beq _0223AAD0
	cmp r1, #1
	beq _0223AAE2
	b _0223AAFA
_0223AAD0:
	bl ov59_0223AD20
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r0, [r0]
	adds r4, #0x40
	adds r0, r0, #1
	strh r0, [r4]
	b _0223AAFA
_0223AAE2:
	bl ov59_0223AD84
	bl FUN_020210BC
	movs r0, #1
	bl FUN_02021148
	movs r0, #0
	adds r4, #0x40
	strh r0, [r4]
	movs r0, #1
	pop {r4, pc}
_0223AAFA:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223AABC

	thumb_func_start ov59_0223AB00
ov59_0223AB00: @ 0x0223AB00
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	cmp r0, #0
	beq _0223AB10
	cmp r0, #1
	b _0223AB28
_0223AB10:
	bl FUN_02021238
	adds r0, r4, #0
	bl ov59_0223AD58
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r0, [r0]
	adds r4, #0x40
	adds r0, r0, #1
	strh r0, [r4]
	b _0223AB36
_0223AB28:
	bl ov59_0223ACD0
	movs r0, #0
	adds r4, #0x40
	strh r0, [r4]
	movs r0, #1
	pop {r4, pc}
_0223AB36:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223AB00

	thumb_func_start ov59_0223AB3C
ov59_0223AB3C: @ 0x0223AB3C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	cmp r0, #0
	beq _0223AB50
	cmp r0, #1
	beq _0223AB74
	b _0223AB88
_0223AB50:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r0, [r0]
	adds r4, #0x40
	adds r0, r0, #1
	strh r0, [r4]
	b _0223AB88
_0223AB74:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223AB88
	movs r0, #0
	adds r4, #0x40
	strh r0, [r4]
	add sp, #0xc
	movs r0, #2
	pop {r3, r4, pc}
_0223AB88:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223AB3C

	thumb_func_start ov59_0223AB90
ov59_0223AB90: @ 0x0223AB90
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	cmp r0, #0
	beq _0223ABA4
	cmp r0, #1
	beq _0223ABCA
	b _0223ABDE
_0223ABA4:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r0, [r0]
	adds r4, #0x40
	adds r0, r0, #1
	strh r0, [r4]
	b _0223ABDE
_0223ABCA:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223ABDE
	movs r0, #0
	adds r4, #0x40
	strh r0, [r4]
	add sp, #0xc
	movs r0, #8
	pop {r3, r4, pc}
_0223ABDE:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov59_0223AB90

	thumb_func_start ov59_0223ABE4
ov59_0223ABE4: @ 0x0223ABE4
	ldr r3, _0223ABE8 @ =ov59_0223AF7C
	bx r3
	.align 2, 0
_0223ABE8: .4byte ov59_0223AF7C
	thumb_func_end ov59_0223ABE4

	thumb_func_start ov59_0223ABEC
ov59_0223ABEC: @ 0x0223ABEC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r1, [r1]
	cmp r1, #0
	beq _0223AC00
	cmp r1, #1
	beq _0223AC30
	b _0223AC42
_0223AC00:
	bl ov59_0223AF9C
	cmp r0, #0
	beq _0223AC42
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0223AC22
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r4, #0x36
	strb r1, [r4]
	movs r0, #5
	pop {r4, pc}
_0223AC22:
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r0, [r0]
	adds r4, #0x40
	adds r0, r0, #1
	strh r0, [r4]
	b _0223AC42
_0223AC30:
	bl ov59_0223B11C
	cmp r0, #0
	beq _0223AC42
	movs r0, #0
	adds r4, #0x40
	strh r0, [r4]
	movs r0, #1
	pop {r4, pc}
_0223AC42:
	movs r0, #4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223ABEC

	thumb_func_start ov59_0223AC48
ov59_0223AC48: @ 0x0223AC48
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	cmp r0, #0
	beq _0223AC5A
	cmp r0, #1
	beq _0223AC90
	b _0223ACCA
_0223AC5A:
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #5
	bhs _0223AC82
	adds r2, r4, #0
	adds r2, #0x36
	movs r1, #0x39
_0223AC6A:
	adds r0, r4, r0
	ldrsb r0, [r0, r1]
	cmp r0, #0
	bne _0223AC82
	ldrb r0, [r2]
	adds r0, r0, #1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #5
	blo _0223AC6A
_0223AC82:
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
_0223AC90:
	adds r0, r4, #0
	bl ov59_0223B164
	cmp r0, #0
	beq _0223ACCA
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x36
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x3e
	adds r4, #0x3e
	strb r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0223ACCA
	movs r0, #1
	pop {r4, pc}
_0223ACCA:
	movs r0, #5
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223AC48

	thumb_func_start ov59_0223ACD0
ov59_0223ACD0: @ 0x0223ACD0
	push {r3, lr}
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0223AD18 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _0223AD1C @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	pop {r3, pc}
	.align 2, 0
_0223AD18: .4byte 0xFFFFE0FF
_0223AD1C: .4byte 0x04001000
	thumb_func_end ov59_0223ACD0

	thumb_func_start ov59_0223AD20
ov59_0223AD20: @ 0x0223AD20
	push {r4, lr}
	adds r4, r0, #0
	bl ov59_0223B434
	adds r0, r4, #0
	bl ov59_0223B590
	adds r0, r4, #0
	bl ov59_0223B68C
	adds r0, r4, #0
	bl ov59_0223B740
	adds r0, r4, #0
	bl ov59_0223B8B0
	ldr r0, [r4]
	bl ov59_0223C298
	str r0, [r4, #0x78]
	ldr r0, _0223AD54 @ =ov59_0223B3DC
	adds r1, r4, #0
	bl FUN_0201A0FC
	pop {r4, pc}
	nop
_0223AD54: .4byte ov59_0223B3DC
	thumb_func_end ov59_0223AD20

	thumb_func_start ov59_0223AD58
ov59_0223AD58: @ 0x0223AD58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x78]
	bl ov59_0223C350
	adds r0, r4, #0
	bl ov59_0223B8C8
	adds r0, r4, #0
	bl ov59_0223B7D8
	adds r0, r4, #0
	bl ov59_0223B6FC
	adds r0, r4, #0
	bl ov59_0223B66C
	adds r0, r4, #0
	bl ov59_0223B554
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223AD58

	thumb_func_start ov59_0223AD84
ov59_0223AD84: @ 0x0223AD84
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r1, #2
	bl ov59_0223AEB0
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	movs r1, #0
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0223AE18 @ =0x00010200
	adds r2, #0xe5
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, r2
	ldr r2, [r5, #0x68]
	adds r3, r1, #0
	bl FUN_020200FC
	movs r0, #0x79
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r4, _0223AE1C @ =0x0223C99C
	movs r6, #0
	adds r7, r5, r0
_0223ADC8:
	ldr r1, [r4]
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	adds r1, r1, #5
	bl FUN_0200BB6C
	adds r0, r6, #5
	lsls r0, r0, #4
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223AE18 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r2, [r5, #0x68]
	adds r0, r7, r0
	movs r3, #4
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	adds r0, r7, r0
	bl FUN_0201D5C8
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #5
	blt _0223ADC8
	adds r0, r5, #0
	adds r5, #0x4a
	ldrb r1, [r5]
	bl ov59_0223BC88
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0223AE18: .4byte 0x00010200
_0223AE1C: .4byte 0x0223C99C
	thumb_func_end ov59_0223AD84

	thumb_func_start ov59_0223AE20
ov59_0223AE20: @ 0x0223AE20
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_02074904
	str r0, [r5, #0x10]
	bl FUN_02074640
	movs r6, #0
	adds r4, r6, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _0223AE7E
	adds r0, r5, #0
	str r0, [sp, #8]
	adds r0, #0x7c
	str r0, [sp, #8]
_0223AE44:
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #0x4c
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0223AE76
	ldr r0, [r5]
	adds r1, r6, #0
	str r0, [sp]
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, [sp, #8]
	lsls r3, r4, #0x18
	adds r0, r0, r1
	ldr r1, [r5, #0x10]
	adds r2, r7, #0
	lsrs r3, r3, #0x18
	adds r6, r6, #1
	bl ov59_0223BA64
_0223AE76:
	ldr r0, [sp, #4]
	adds r4, r4, #1
	cmp r4, r0
	blt _0223AE44
_0223AE7E:
	adds r5, #0x49
	strb r6, [r5]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov59_0223AE20

	thumb_func_start ov59_0223AE88
ov59_0223AE88: @ 0x0223AE88
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x49
	ldrb r0, [r0]
	movs r4, #0
	cmp r0, #0
	ble _0223AEAE
	adds r5, r6, #0
	adds r5, #0x7c
_0223AE9A:
	adds r0, r5, #0
	bl ov59_0223BADC
	adds r0, r6, #0
	adds r0, #0x49
	ldrb r0, [r0]
	adds r4, r4, #1
	adds r5, #0x34
	cmp r4, r0
	blt _0223AE9A
_0223AEAE:
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_0223AE88

	thumb_func_start ov59_0223AEB0
ov59_0223AEB0: @ 0x0223AEB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r0, #0
	cmp r1, #3
	bhi _0223AF74
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223AEC6: @ jump table
	.2byte _0223AF5C - _0223AEC6 - 2 @ case 0
	.2byte _0223AF5C - _0223AEC6 - 2 @ case 1
	.2byte _0223AEF4 - _0223AEC6 - 2 @ case 2
	.2byte _0223AECE - _0223AEC6 - 2 @ case 3
_0223AECE:
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x99
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0223AEF4:
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r6, _0223AF78 @ =0x0223C954
	movs r7, #0
	movs r5, #4
	str r4, [sp, #0x10]
_0223AF08:
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x68]
	adds r1, r7, #1
	bl FUN_0200BB6C
	str r5, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6]
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x71
	lsls r0, r0, #2
	ldr r2, [r4, #0x68]
	adds r0, r4, r0
	movs r3, #0
	bl FUN_020200FC
	movs r0, #0x26
	ldr r1, [sp, #0x10]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [sp, #0x10]
	adds r7, r7, #1
	adds r0, r0, #4
	adds r6, r6, #4
	adds r5, #0x18
	str r0, [sp, #0x10]
	cmp r7, #2
	blt _0223AF08
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0223AF5C:
	movs r0, #0x26
	lsls r0, r0, #4
	adds r5, r4, r0
	lsls r4, r1, #2
	lsls r1, r1, #1
	ldr r0, [r5, r4]
	adds r1, r1, #1
	bl FUN_020248F0
	ldr r0, [r5, r4]
	bl FUN_02024964
_0223AF74:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223AF78: .4byte 0x0223C954
	thumb_func_end ov59_0223AEB0

	thumb_func_start ov59_0223AF7C
ov59_0223AF7C: @ 0x0223AF7C
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	add r1, sp, #0
	adds r4, r0, #0
	bl ov59_0223B3B0
	ldr r1, [sp]
	cmp r1, #0
	bne _0223AF98
	adds r0, r4, #0
	bl ov59_0223B358
_0223AF98:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov59_0223AF7C

	thumb_func_start ov59_0223AF9C
ov59_0223AF9C: @ 0x0223AF9C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #5
	bls _0223AFAC
	b _0223B0FA
_0223AFAC:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223AFB8: @ jump table
	.2byte _0223AFC4 - _0223AFB8 - 2 @ case 0
	.2byte _0223B024 - _0223AFB8 - 2 @ case 1
	.2byte _0223B05C - _0223AFB8 - 2 @ case 2
	.2byte _0223B084 - _0223AFB8 - 2 @ case 3
	.2byte _0223B0B4 - _0223AFB8 - 2 @ case 4
	.2byte _0223B0CC - _0223AFB8 - 2 @ case 5
_0223AFC4:
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02024B68
	cmp r0, #0
	beq _0223AFD8
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_0223AFD8:
	adds r0, r4, #0
	movs r1, #3
	bl ov59_0223AEB0
	adds r0, r4, #0
	bl ov59_0223BBB0
	adds r0, r4, #0
	movs r1, #0
	bl ov59_0223BBD4
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xa
	bl FUN_020248F0
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024964
	ldr r0, _0223B114 @ =0x00000921
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r4, #0x42
	adds r0, r0, #1
	strh r0, [r4]
	b _0223B10E
_0223B024:
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024B68
	cmp r0, #0
	beq _0223B038
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_0223B038:
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xb
	bl FUN_020248F0
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024964
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r4, #0x42
	adds r0, r0, #1
	strh r0, [r4]
	b _0223B10E
_0223B05C:
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024B68
	cmp r0, #0
	beq _0223B070
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_0223B070:
	adds r0, r4, #0
	bl ov59_0223C054
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r4, #0x42
	adds r0, r0, #1
	strh r0, [r4]
	b _0223B10E
_0223B084:
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0223B094
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_0223B094:
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	bl ov59_0223C138
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r4, #0x42
	adds r0, r0, #1
	strh r0, [r4]
	b _0223B10E
_0223B0B4:
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0223B0C4
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_0223B0C4:
	movs r0, #6
	adds r4, #0x42
	strh r0, [r4]
	b _0223B10E
_0223B0CC:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223B10E
	movs r0, #6
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r1, #1
	str r0, [sp, #8]
	ldr r3, _0223B118 @ =0x00007FFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r4, #0x42
	adds r0, r0, #1
	strh r0, [r4]
	b _0223B10E
_0223B0FA:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223B10E
	movs r0, #0
	adds r4, #0x42
	strh r0, [r4]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_0223B10E:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0223B114: .4byte 0x00000921
_0223B118: .4byte 0x00007FFF
	thumb_func_end ov59_0223AF9C

	thumb_func_start ov59_0223B11C
ov59_0223B11C: @ 0x0223B11C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r1, [r1]
	cmp r1, #0
	beq _0223B130
	cmp r1, #1
	beq _0223B14A
	b _0223B160
_0223B130:
	bl ov59_0223BBB0
	adds r0, r4, #0
	movs r1, #1
	bl ov59_0223BBD4
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r4, #0x42
	adds r0, r0, #1
	strh r0, [r4]
	b _0223B160
_0223B14A:
	adds r0, #0x4d
	ldrb r0, [r0]
	bl FUN_02020094
	cmp r0, #0
	bne _0223B160
	movs r0, #0
	adds r4, #0x42
	strh r0, [r4]
	movs r0, #1
	pop {r4, pc}
_0223B160:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov59_0223B11C

	thumb_func_start ov59_0223B164
ov59_0223B164: @ 0x0223B164
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r1, [r1]
	lsls r2, r1, #2
	ldr r1, _0223B2A8 @ =0x0223C99C
	ldr r4, [r1, r2]
	adds r1, r5, #0
	adds r1, #0x42
	ldrh r1, [r1]
	cmp r1, #0
	beq _0223B188
	cmp r1, #1
	beq _0223B1CE
	cmp r1, #2
	beq _0223B236
	b _0223B28E
_0223B188:
	movs r1, #0
	adds r0, #0x51
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x38
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	adds r1, r5, r0
	movs r0, #0x39
	ldrsb r1, [r1, r0]
	cmp r1, #0
	bge _0223B1B4
	adds r0, r5, #0
	rsbs r1, r1, #0
	adds r0, #0x37
	strb r1, [r0]
	ldr r0, _0223B2AC @ =0x00000926
	bl FUN_0200604C
	b _0223B1C0
_0223B1B4:
	adds r0, r5, #0
	adds r0, #0x37
	strb r1, [r0]
	ldr r0, _0223B2B0 @ =0x00000925
	bl FUN_0200604C
_0223B1C0:
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x42
	strh r1, [r0]
_0223B1CE:
	adds r0, r5, #0
	adds r0, #0x51
	ldrb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x51
	ldrb r0, [r0]
	subs r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x51
	strb r1, [r0]
	cmp r2, #0
	bne _0223B2A4
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	adds r1, r5, r0
	movs r0, #0x39
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0223B204
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov59_0223BE70
	b _0223B210
_0223B204:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #0
	bl ov59_0223BE70
_0223B210:
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r1, r0
	blo _0223B22E
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r5, #0x42
	adds r0, r0, #1
	strh r0, [r5]
	b _0223B2A4
_0223B22E:
	movs r0, #0xf
	adds r5, #0x51
	strb r0, [r5]
	b _0223B2A4
_0223B236:
	adds r1, r5, #0
	adds r1, #0x4f
	ldrb r1, [r1]
	cmp r1, #0
	bne _0223B2A4
	adds r2, r5, #0
	adds r2, #0x4a
	ldrb r3, [r2]
	adds r1, r5, #0
	movs r2, #0x34
	adds r1, #0x7c
	muls r2, r3, r2
	adds r1, r1, r2
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	bl ov59_0223BD4C
	adds r0, r5, #0
	bl ov59_0223BBB0
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	adds r1, r5, r0
	movs r0, #0x39
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0223B278
	adds r0, r5, #0
	adds r1, r4, #7
	bl ov59_0223BBD4
	b _0223B280
_0223B278:
	adds r0, r5, #0
	adds r1, r4, #2
	bl ov59_0223BBD4
_0223B280:
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r5, #0x42
	adds r0, r0, #1
	strh r0, [r5]
	b _0223B2A4
_0223B28E:
	adds r0, #0x4d
	ldrb r0, [r0]
	bl FUN_02020094
	cmp r0, #0
	bne _0223B2A4
	movs r0, #0
	adds r5, #0x42
	strh r0, [r5]
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223B2A4:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223B2A8: .4byte 0x0223C99C
_0223B2AC: .4byte 0x00000926
_0223B2B0: .4byte 0x00000925
	thumb_func_end ov59_0223B164

	thumb_func_start ov59_0223B2B4
ov59_0223B2B4: @ 0x0223B2B4
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #3
	bhi _0223B34E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223B2C8: @ jump table
	.2byte _0223B2D0 - _0223B2C8 - 2 @ case 0
	.2byte _0223B2E6 - _0223B2C8 - 2 @ case 1
	.2byte _0223B2F8 - _0223B2C8 - 2 @ case 2
	.2byte _0223B324 - _0223B2C8 - 2 @ case 3
_0223B2D0:
	bl ov59_0223BAE8
	ldr r0, _0223B354 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	bl ov59_0223AEB0
	movs r0, #4
	pop {r4, pc}
_0223B2E6:
	ldr r0, _0223B354 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	bl ov59_0223AEB0
	movs r0, #1
	pop {r4, pc}
_0223B2F8:
	adds r0, #0x49
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	subs r0, r0, #1
	adds r0, r0, r1
	blx FUN_020F2998
	adds r0, r4, #0
	adds r0, #0x4a
	strb r1, [r0]
	ldr r0, _0223B354 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r4, #0x4a
	ldrb r1, [r4]
	bl ov59_0223BC88
	movs r0, #2
	pop {r4, pc}
_0223B324:
	adds r0, #0x4a
	adds r1, r4, #0
	ldrb r0, [r0]
	adds r1, #0x49
	ldrb r1, [r1]
	adds r0, r0, #1
	blx FUN_020F2998
	adds r0, r4, #0
	adds r0, #0x4a
	strb r1, [r0]
	ldr r0, _0223B354 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r4, #0x4a
	ldrb r1, [r4]
	bl ov59_0223BC88
	movs r0, #2
	pop {r4, pc}
_0223B34E:
	movs r0, #2
	pop {r4, pc}
	nop
_0223B354: .4byte 0x000005DC
	thumb_func_end ov59_0223B2B4

	thumb_func_start ov59_0223B358
ov59_0223B358: @ 0x0223B358
	push {r3, lr}
	ldr r1, _0223B3A8 @ =0x021D110C
	ldr r2, [r1, #0x48]
	ldr r1, _0223B3AC @ =0x00000CF3
	tst r1, r2
	beq _0223B368
	movs r1, #0
	str r1, [r0, #0x44]
_0223B368:
	ldr r1, _0223B3A8 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #2
	adds r3, r2, #0
	tst r3, r1
	beq _0223B37C
	movs r1, #1
	bl ov59_0223B2B4
	pop {r3, pc}
_0223B37C:
	movs r3, #1
	tst r3, r2
	beq _0223B38A
	movs r1, #0
	bl ov59_0223B2B4
	pop {r3, pc}
_0223B38A:
	movs r3, #0x40
	tst r3, r2
	beq _0223B396
	bl ov59_0223B2B4
	pop {r3, pc}
_0223B396:
	movs r3, #0x80
	tst r2, r3
	beq _0223B3A4
	movs r1, #3
	bl ov59_0223B2B4
	pop {r3, pc}
_0223B3A4:
	adds r0, r1, #0
	pop {r3, pc}
	.align 2, 0
_0223B3A8: .4byte 0x021D110C
_0223B3AC: .4byte 0x00000CF3
	thumb_func_end ov59_0223B358

	thumb_func_start ov59_0223B3B0
ov59_0223B3B0: @ 0x0223B3B0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0223B3D8 @ =0x0223C95C
	adds r4, r1, #0
	bl FUN_0202529C
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	bne _0223B3CA
	movs r0, #2
	pop {r3, r4, r5, pc}
_0223B3CA:
	movs r0, #1
	str r0, [r4]
	str r0, [r5, #0x44]
	adds r0, r5, #0
	bl ov59_0223B2B4
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223B3D8: .4byte 0x0223C95C
	thumb_func_end ov59_0223B3B0

	thumb_func_start ov59_0223B3DC
ov59_0223B3DC: @ 0x0223B3DC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223B3EE
	bl FUN_0200D034
_0223B3EE:
	ldr r0, [r4, #0x78]
	bl ov59_0223C374
	bl FUN_0202061C
	ldr r0, [r4, #0x54]
	bl FUN_0201EEB4
	ldr r3, _0223B40C @ =0x027E0000
	ldr r1, _0223B410 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_0223B40C: .4byte 0x027E0000
_0223B410: .4byte 0x00003FF8
	thumb_func_end ov59_0223B3DC

	thumb_func_start ov59_0223B414
ov59_0223B414: @ 0x0223B414
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0223B430 @ =0x0223CA68
	add r3, sp, #0
	movs r2, #5
_0223B41E:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0223B41E
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_0223B430: .4byte 0x0223CA68
	thumb_func_end ov59_0223B414

	thumb_func_start ov59_0223B434
ov59_0223B434: @ 0x0223B434
	push {r3, r4, r5, lr}
	sub sp, #0x80
	adds r4, r0, #0
	bl ov59_0223B414
	ldr r0, [r4]
	bl FUN_0201AC88
	add r3, sp, #0x70
	ldr r5, _0223B538 @ =0x0223C978
	str r0, [r4, #0x54]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r2, _0223B53C @ =0x04000304
	ldr r0, _0223B540 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r5, _0223B544 @ =0x0223C9B0
	add r3, sp, #0x54
	ands r0, r1
	strh r0, [r2]
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
	ldr r0, [r4, #0x54]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x54]
	movs r1, #7
	bl FUN_0201CAE0
	ldr r5, _0223B548 @ =0x0223C9CC
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
	ldr r0, [r4, #0x54]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x54]
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _0223B54C @ =0x0223C9E8
	add r3, sp, #0x1c
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
	ldr r0, [r4, #0x54]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x54]
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _0223B550 @ =0x0223CA04
	add r3, sp, #0
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4, #0x54]
	movs r1, #3
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x54]
	movs r1, #3
	bl FUN_0201CAE0
	ldr r3, [r4]
	movs r0, #7
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	add sp, #0x80
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223B538: .4byte 0x0223C978
_0223B53C: .4byte 0x04000304
_0223B540: .4byte 0xFFFF7FFF
_0223B544: .4byte 0x0223C9B0
_0223B548: .4byte 0x0223C9CC
_0223B54C: .4byte 0x0223C9E8
_0223B550: .4byte 0x0223CA04
	thumb_func_end ov59_0223B434

	thumb_func_start ov59_0223B554
ov59_0223B554: @ 0x0223B554
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x54]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0x54]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x54]
	movs r1, #7
	bl FUN_0201BB4C
	ldr r0, [r4, #0x54]
	bl FUN_0201AB0C
	ldr r2, _0223B58C @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_0223B58C: .4byte 0x04000304
	thumb_func_end ov59_0223B554

	thumb_func_start ov59_0223B590
ov59_0223B590: @ 0x0223B590
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0xf4
	bl FUN_02007688
	movs r2, #0
	str r2, [sp]
	ldr r1, [r5]
	adds r3, r2, #0
	str r1, [sp, #4]
	movs r1, #5
	adds r4, r0, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #7
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x54]
	adds r0, r4, #0
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #9
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x54]
	adds r0, r4, #0
	movs r3, #3
	bl FUN_02007B68
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5]
	movs r1, #4
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r1, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #6
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x54]
	adds r0, r4, #0
	movs r3, #7
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #8
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x54]
	adds r0, r4, #0
	movs r3, #7
	bl FUN_02007B68
	movs r0, #0xba
	lsls r0, r0, #2
	str r4, [r5, r0]
	adds r0, r5, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	movs r1, #1
	adds r2, r1, #0
	str r0, [sp]
	ldr r0, [r5]
	movs r3, #0xd
	str r0, [sp, #4]
	ldr r0, [r5, #0x54]
	bl FUN_0200E644
	movs r1, #6
	ldr r2, [r5]
	movs r0, #0
	lsls r1, r1, #6
	bl FUN_0200304C
	movs r0, #0x1a
	str r0, [sp]
	ldr r0, _0223B668 @ =0x04000050
	movs r1, #1
	movs r2, #0xe
	movs r3, #6
	blx FUN_020CF15C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223B668: .4byte 0x04000050
	thumb_func_end ov59_0223B590

	thumb_func_start ov59_0223B66C
ov59_0223B66C: @ 0x0223B66C
	push {r3, lr}
	movs r1, #0xba
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_0200770C
	movs r1, #0
	ldr r0, _0223B688 @ =0x04000050
	adds r2, r1, #0
	movs r3, #0x1f
	str r1, [sp]
	blx FUN_020CF15C
	pop {r3, pc}
	.align 2, 0
_0223B688: .4byte 0x04000050
	thumb_func_end ov59_0223B66C

	thumb_func_start ov59_0223B68C
ov59_0223B68C: @ 0x0223B68C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6]
	movs r0, #4
	bl FUN_02002CEC
	movs r0, #1
	bl FUN_02002B34
	movs r0, #1
	bl FUN_02002B8C
	ldr r3, [r6]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0x16
	bl FUN_0200BAF8
	str r0, [r6, #0x5c]
	movs r0, #0x10
	ldr r2, [r6]
	adds r1, r0, #0
	bl FUN_0200BD18
	str r0, [r6, #0x60]
	movs r0, #1
	ldr r1, [r6]
	lsls r0, r0, #8
	bl FUN_02026354
	str r0, [r6, #0x64]
	movs r0, #1
	ldr r1, [r6]
	lsls r0, r0, #8
	bl FUN_02026354
	str r0, [r6, #0x68]
	ldr r0, [r6, #0x5c]
	movs r1, #4
	bl FUN_0200BBA0
	str r0, [r6, #0x6c]
	movs r4, #0
	adds r5, r6, #0
_0223B6E4:
	adds r1, r4, #0
	ldr r0, [r6, #0x5c]
	adds r1, #0xa
	bl FUN_0200BBA0
	str r0, [r5, #0x70]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _0223B6E4
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov59_0223B68C

	thumb_func_start ov59_0223B6FC
ov59_0223B6FC: @ 0x0223B6FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x74]
	bl FUN_02026380
	ldr r0, [r4, #0x70]
	bl FUN_02026380
	ldr r0, [r4, #0x6c]
	bl FUN_02026380
	ldr r0, [r4, #0x68]
	bl FUN_02026380
	ldr r0, [r4, #0x64]
	bl FUN_02026380
	ldr r0, [r4, #0x60]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x5c]
	bl FUN_0200BB44
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #0
	bl FUN_02002B34
	movs r0, #4
	bl FUN_02002DB4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223B6FC

	thumb_func_start ov59_0223B740
ov59_0223B740: @ 0x0223B740
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	movs r1, #0x6d
	movs r6, #0
	lsls r1, r1, #2
	ldr r4, _0223B7D4 @ =0x0223CA40
	str r0, [sp, #0x14]
	adds r5, r0, r1
	adds r7, r6, #0
_0223B752:
	ldr r0, [sp, #0x14]
	adds r1, r5, #0
	ldr r0, [r0, #0x54]
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #4
	ble _0223B752
	movs r6, #0xc1
	adds r1, r6, #0
	ldr r0, [sp, #0x14]
	adds r1, #0xf3
	adds r0, r0, r1
	movs r5, #0
	movs r4, #4
	str r0, [sp, #0x18]
_0223B780:
	adds r0, r5, #5
	lsls r7, r0, #4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, [r0, #0x54]
	adds r1, r1, r7
	movs r2, #2
	movs r3, #1
	bl FUN_0201D40C
	ldr r0, [sp, #0x18]
	movs r1, #0
	adds r0, r0, r7
	bl FUN_0201D978
	adds r5, r5, #1
	adds r6, #0x20
	adds r4, r4, #4
	cmp r5, #5
	blt _0223B780
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	bl FUN_0201660C
	movs r2, #0x95
	ldr r1, [sp, #0x14]
	lsls r2, r2, #2
	str r0, [r1, r2]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223B7D4: .4byte 0x0223CA40
	thumb_func_end ov59_0223B740

	thumb_func_start ov59_0223B7D8
ov59_0223B7D8: @ 0x0223B7D8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x6d
	lsls r0, r0, #2
	movs r4, #0
	adds r5, r6, r0
_0223B7E4:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0xa
	blt _0223B7E4
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02016624
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_0223B7D8

	thumb_func_start ov59_0223B804
ov59_0223B804: @ 0x0223B804
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #0x20
	bl FUN_0202055C
	ldr r0, [r4]
	bl FUN_0200CF18
	movs r1, #0x96
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	ldr r1, _0223B86C @ =0x0223CA20
	ldr r2, _0223B870 @ =0x0223C988
	movs r3, #3
	bl FUN_0200CF70
	ldr r0, [r4]
	bl FUN_0200B2E0
	ldr r0, [r4]
	bl FUN_0200B2E8
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200CF38
	movs r1, #0x97
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r0, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x22
	bl FUN_0200CFF4
	movs r3, #0
	movs r1, #0x96
	str r3, [sp]
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _0223B874 @ =0x0223C968
	bl FUN_0200D2A4
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223B86C: .4byte 0x0223CA20
_0223B870: .4byte 0x0223C988
_0223B874: .4byte 0x0223C968
	thumb_func_end ov59_0223B804

	thumb_func_start ov59_0223B878
ov59_0223B878: @ 0x0223B878
	push {r4, lr}
	movs r1, #0x96
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_0200D0E4
	movs r0, #0x97
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200D108
	movs r0, #0x96
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	bl FUN_020205AC
	ldr r0, [r4]
	bl FUN_0200B2E0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223B878

	thumb_func_start ov59_0223B8B0
ov59_0223B8B0: @ 0x0223B8B0
	push {r4, lr}
	adds r4, r0, #0
	bl ov59_0223B804
	adds r0, r4, #0
	bl ov59_0223B8E4
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	pop {r4, pc}
	thumb_func_end ov59_0223B8B0

	thumb_func_start ov59_0223B8C8
ov59_0223B8C8: @ 0x0223B8C8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	bl ov59_0223BA44
	adds r0, r4, #0
	bl ov59_0223B878
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223B8C8

	thumb_func_start ov59_0223B8E4
ov59_0223B8E4: @ 0x0223B8E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r6, _0223BA34 @ =0x0223CA90
	movs r7, #0
	adds r4, r5, #0
_0223B8F0:
	movs r0, #0x96
	movs r1, #0x97
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl FUN_0200D2B4
	movs r1, #0x26
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024A04
	adds r7, r7, #1
	adds r6, #0x28
	adds r4, r4, #4
	cmp r7, #2
	ble _0223B8F0
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_0202487C
	movs r0, #0
	str r0, [sp]
	ldr r0, _0223BA38 @ =0x0223C99C
	str r0, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #8]
	movs r0, #0x38
	str r0, [sp, #4]
_0223B95C:
	ldr r0, [sp, #0xc]
	movs r1, #0x96
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r4, r5, r0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, _0223BA3C @ =0x0223CB08
	bl FUN_0200D2B4
	movs r1, #0x26
	ldr r2, [sp, #8]
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	lsls r2, r2, #0x10
	movs r1, #0x50
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [sp, #4]
	movs r7, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #0x40
	str r0, [sp, #0x10]
_0223B9B0:
	ldr r0, [sp, #0xc]
	ldr r2, _0223BA40 @ =0x0223CB30
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r1, r0
	adds r0, #8
	adds r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r4, r5, r0
	movs r0, #0x96
	movs r1, #0x97
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl FUN_0200D2B4
	movs r1, #0x26
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	lsls r1, r6, #0x10
	ldr r0, [r4, r0]
	ldr r2, [sp, #0x10]
	asrs r1, r1, #0x10
	bl FUN_0200DD88
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_0202487C
	adds r7, r7, #1
	adds r6, #0x10
	cmp r7, #5
	blt _0223B9B0
	ldr r0, [sp, #0xc]
	adds r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	adds r0, #0x20
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	adds r0, #0x20
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r0, r0, #1
	str r0, [sp]
	cmp r0, #5
	blt _0223B95C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223BA34: .4byte 0x0223CA90
_0223BA38: .4byte 0x0223C99C
_0223BA3C: .4byte 0x0223CB08
_0223BA40: .4byte 0x0223CB30
	thumb_func_end ov59_0223B8E4

	thumb_func_start ov59_0223BA44
ov59_0223BA44: @ 0x0223BA44
	push {r4, r5, r6, lr}
	movs r6, #0x26
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #4
_0223BA4E:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _0223BA58
	bl FUN_02024758
_0223BA58:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x22
	blt _0223BA4E
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov59_0223BA44

	thumb_func_start ov59_0223BA64
ov59_0223BA64: @ 0x0223BA64
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	str r4, [r5]
	adds r6, r1, #0
	strb r3, [r5, #8]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r5, #4]
	adds r0, r4, #0
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r5, #7]
	adds r0, r4, #0
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r5, #6]
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #0
	ldrh r0, [r5, #4]
	movs r2, #0x1c
	bl FUN_0206FBC4
	movs r1, #1
	eors r0, r1
	strb r0, [r5, #9]
	ldr r1, [sp, #0x10]
	movs r0, #0xc
	bl FUN_02026354
	str r0, [r5, #0xc]
	ldr r2, [r5, #0xc]
	adds r0, r4, #0
	movs r1, #0x77
	bl FUN_0206E540
	adds r1, r5, #0
	ldr r0, [r5]
	adds r1, #0x1e
	bl FUN_02073238
	adds r1, r5, #0
	ldrb r2, [r5, #8]
	adds r0, r6, #0
	adds r1, #0x10
	bl FUN_02074670
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov59_0223BA64

	thumb_func_start ov59_0223BADC
ov59_0223BADC: @ 0x0223BADC
	ldr r3, _0223BAE4 @ =FUN_02026380
	ldr r0, [r0, #0xc]
	bx r3
	nop
_0223BAE4: .4byte FUN_02026380
	thumb_func_end ov59_0223BADC

	thumb_func_start ov59_0223BAE8
ov59_0223BAE8: @ 0x0223BAE8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	adds r2, r4, #0
	movs r0, #0x34
	muls r0, r1, r0
	adds r2, #0x7c
	adds r0, r2, r0
	str r0, [sp]
	ldr r2, [sp]
	adds r0, r4, #0
	ldrb r2, [r2, #8]
	ldr r1, [r4, #0x10]
	adds r0, #0x18
	bl FUN_022379C0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #8
	bne _0223BB18
	ldr r0, [r4, #0x14]
	bl FUN_02032024
_0223BB18:
	ldr r2, [sp]
	ldr r1, [sp]
	ldrb r2, [r2, #8]
	ldr r0, [r4, #0x10]
	adds r1, #0x10
	bl FUN_02074670
	ldr r0, [sp]
	ldr r2, [sp]
	ldrh r0, [r0, #0x16]
	ldr r1, [sp]
	adds r2, #0x10
	strh r0, [r4, #0x2e]
	ldr r0, [sp]
	ldrh r0, [r0, #0x18]
	strh r0, [r4, #0x30]
	ldr r0, [sp]
	ldrh r0, [r0, #0x1a]
	strh r0, [r4, #0x32]
	ldr r0, [sp]
	ldrh r0, [r0, #0x1c]
	strh r0, [r4, #0x34]
	ldr r0, [sp]
	ldr r1, [r1]
	ldr r3, [r4]
	adds r0, #0x16
	bl FUN_020732E4
	adds r0, r4, #0
	adds r7, r4, #0
	movs r3, #0
	adds r0, #0x3e
	ldr r5, _0223BBAC @ =0x0223C99C
	strb r3, [r0]
	adds r7, #0x3e
_0223BB5E:
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r2, r1, r0
	ldr r0, [sp]
	adds r1, r4, r3
	ldrh r0, [r0, #0x16]
	adds r6, r0, #0
	asrs r6, r2
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	ldrh r0, [r4, #0x2e]
	asrs r0, r2
	movs r2, #7
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r2, ip
	subs r2, r2, r0
	adds r0, r1, #0
	adds r0, #0x39
	strb r2, [r0]
	movs r0, #0x39
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0223BB9C
	ldrb r0, [r7]
	adds r0, r0, #1
	strb r0, [r7]
_0223BB9C:
	adds r3, r3, #1
	adds r5, r5, #4
	cmp r3, #5
	blt _0223BB5E
	movs r0, #1
	adds r4, #0x48
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223BBAC: .4byte 0x0223C99C
	thumb_func_end ov59_0223BAE8

	thumb_func_start ov59_0223BBB0
ov59_0223BBB0: @ 0x0223BBB0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x6d
	lsls r0, r0, #2
	movs r1, #1
	adds r0, r4, r0
	adds r2, r1, #0
	movs r3, #0xd
	bl FUN_0200E998
	movs r0, #0x6d
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0xf
	bl FUN_0201D978
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223BBB0

	thumb_func_start ov59_0223BBD4
ov59_0223BBD4: @ 0x0223BBD4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	cmp r1, #0xb
	bhi _0223BC42
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223BBEA: @ jump table
	.2byte _0223BC02 - _0223BBEA - 2 @ case 0
	.2byte _0223BC24 - _0223BBEA - 2 @ case 1
	.2byte _0223BC2E - _0223BBEA - 2 @ case 2
	.2byte _0223BC2E - _0223BBEA - 2 @ case 3
	.2byte _0223BC2E - _0223BBEA - 2 @ case 4
	.2byte _0223BC2E - _0223BBEA - 2 @ case 5
	.2byte _0223BC2E - _0223BBEA - 2 @ case 6
	.2byte _0223BC38 - _0223BBEA - 2 @ case 7
	.2byte _0223BC38 - _0223BBEA - 2 @ case 8
	.2byte _0223BC38 - _0223BBEA - 2 @ case 9
	.2byte _0223BC38 - _0223BBEA - 2 @ case 10
	.2byte _0223BC38 - _0223BBEA - 2 @ case 11
_0223BC02:
	ldrh r0, [r4, #0x20]
	lsls r0, r0, #0x1c
	lsrs r1, r0, #0x1c
	cmp r1, #6
	bne _0223BC10
	movs r1, #0xc
	b _0223BC20
_0223BC10:
	cmp r1, #5
	bne _0223BC1E
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r1, [r0]
	adds r1, #0xd
	b _0223BC20
_0223BC1E:
	adds r1, #0xd
_0223BC20:
	movs r5, #0
	b _0223BC48
_0223BC24:
	adds r0, r4, #0
	adds r0, #0x4b
	movs r1, #0x12
	ldrb r5, [r0]
	b _0223BC48
_0223BC2E:
	adds r0, r4, #0
	adds r0, #0x4b
	adds r1, #0x11
	ldrb r5, [r0]
	b _0223BC48
_0223BC38:
	adds r0, r4, #0
	adds r0, #0x4b
	adds r1, #0x11
	ldrb r5, [r0]
	b _0223BC48
_0223BC42:
	adds r0, r4, #0
	adds r0, #0x4b
	ldrb r5, [r0]
_0223BC48:
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x68]
	bl FUN_0200BB6C
	movs r3, #0
	str r3, [sp]
	ldr r0, _0223BC84 @ =0x0001020F
	str r5, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r2, [r4, #0x68]
	adds r0, r4, r0
	movs r1, #1
	bl FUN_020200FC
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	cmp r5, #0
	bne _0223BC7E
	movs r0, #0x6d
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
_0223BC7E:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223BC84: .4byte 0x0001020F
	thumb_func_end ov59_0223BBD4

	thumb_func_start ov59_0223BC88
ov59_0223BC88: @ 0x0223BC88
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r2, r5, #0
	movs r0, #0x34
	muls r0, r1, r0
	adds r2, #0x7c
	adds r4, r2, r0
	movs r0, #0x7d
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0223BD40 @ =0x000F0200
	adds r2, #0xf5
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, r2
	ldr r2, [r4, #0xc]
	adds r3, r1, #0
	bl FUN_020200FC
	ldrb r0, [r4, #7]
	cmp r0, #2
	beq _0223BCE4
	lsls r2, r0, #2
	ldr r0, _0223BD44 @ =0x0223C94C
	movs r1, #0
	ldr r0, [r0, r2]
	str r1, [sp]
	movs r3, #0xff
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r3, #0xf5
	adds r0, r5, r3
	str r1, [sp, #0xc]
	adds r2, r5, r2
	ldr r2, [r2, #0x70]
	movs r3, #0x40
	bl FUN_020200FC
_0223BCE4:
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldrb r2, [r4, #6]
	ldr r0, [r5, #0x60]
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, [r5, #0x60]
	ldr r1, [r5, #0x68]
	ldr r2, [r5, #0x6c]
	bl FUN_0200CBBC
	movs r3, #0x10
	str r3, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0223BD48 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r2, #0xf5
	str r1, [sp, #0xc]
	adds r0, r5, r2
	ldr r2, [r5, #0x68]
	bl FUN_020200FC
	movs r0, #0x7d
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	ldr r0, [r5, #0x78]
	bl ov59_0223C3AC
	ldr r0, [r5, #0x78]
	adds r1, r4, #0
	bl ov59_0223C380
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov59_0223BE18
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223BD40: .4byte 0x000F0200
_0223BD44: .4byte 0x0223C94C
_0223BD48: .4byte 0x00010200
	thumb_func_end ov59_0223BC88

	thumb_func_start ov59_0223BD4C
ov59_0223BD4C: @ 0x0223BD4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp]
	adds r7, r2, #0
	adds r1, #0x10
	adds r6, r0, #0
	adds r0, r1, r7
	str r0, [sp, #4]
	ldrsb r0, [r1, r7]
	cmp r0, #0
	bne _0223BD76
	adds r0, r7, #3
	lsls r0, r0, #2
	adds r1, r6, r0
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	b _0223BDA2
_0223BD76:
	movs r0, #0x26
	lsls r0, r0, #4
	adds r4, r6, r0
	adds r0, r7, #3
	lsls r5, r0, #2
	ldr r0, [r4, r5]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [sp, #4]
	movs r1, #0
	ldrsb r0, [r0, r1]
	cmp r0, #0
	ldr r0, [r4, r5]
	ble _0223BD9C
	movs r1, #8
	bl FUN_020248F0
	b _0223BDA2
_0223BD9C:
	movs r1, #9
	bl FUN_020248F0
_0223BDA2:
	lsls r0, r7, #2
	str r0, [sp, #0x10]
	adds r5, r7, r0
	ldr r0, [sp]
	movs r4, #0
	str r0, [sp, #0xc]
	adds r0, #0x1e
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldrh r1, [r0, #0x16]
	lsls r0, r7, #1
	adds r0, r7, r0
	asrs r1, r0
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp]
	adds r7, r0, r7
_0223BDCA:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldrh r0, [r1, r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	cmp r4, r0
	ble _0223BDE6
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xff
	movs r3, #0
	bl ov59_0223BE44
	b _0223BE0C
_0223BDE6:
	ldr r0, [sp, #8]
	cmp r4, r0
	ble _0223BDFA
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #7
	movs r3, #1
	bl ov59_0223BE44
	b _0223BE0C
_0223BDFA:
	ldrb r2, [r7, #0x18]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r2, #4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r3, #1
	bl ov59_0223BE44
_0223BE0C:
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #5
	blt _0223BDCA
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov59_0223BD4C

	thumb_func_start ov59_0223BE18
ov59_0223BE18: @ 0x0223BE18
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	adds r2, r6, #0
	ldr r1, [r6]
	ldr r3, [r5]
	adds r0, #0x16
	adds r2, #0x10
	bl FUN_020732E4
	movs r4, #0
_0223BE30:
	lsls r2, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	lsrs r2, r2, #0x18
	bl ov59_0223BD4C
	adds r4, r4, #1
	cmp r4, #5
	blt _0223BE30
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_0223BE18

	thumb_func_start ov59_0223BE44
ov59_0223BE44: @ 0x0223BE44
	push {r4, r5, r6, lr}
	adds r1, #8
	lsls r5, r1, #2
	movs r1, #0x26
	lsls r1, r1, #4
	adds r4, r0, r1
	ldr r0, [r4, r5]
	adds r1, r3, #0
	adds r6, r2, #0
	bl FUN_02024830
	cmp r6, #0xff
	beq _0223BE6C
	ldr r0, [r4, r5]
	adds r1, r6, #0
	bl FUN_020248F0
	ldr r0, [r4, r5]
	bl FUN_02024964
_0223BE6C:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov59_0223BE44

	thumb_func_start ov59_0223BE70
ov59_0223BE70: @ 0x0223BE70
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r6, r1, #0
	movs r1, #0x20
	adds r7, r2, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020D4994
	str r5, [r4]
	strb r7, [r4, #4]
	movs r0, #0x1e
	strb r0, [r4, #6]
	lsls r0, r6, #1
	ldrh r1, [r5, #0x2e]
	adds r0, r6, r0
	asrs r1, r0
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r7, #0
	bne _0223BEFE
	adds r1, r5, #0
	adds r1, #0x38
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0223BFBC @ =0x0000019A
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	movs r0, #0
	str r0, [r4, #0x18]
	ldrb r0, [r4, #6]
	cmp r0, #0
	beq _0223BED6
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0223BEE4
_0223BED6:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0223BEE4:
	blx FUN_020F2104
	adds r1, r0, #0
	movs r0, #1
	lsls r0, r0, #0xc
	blx FUN_020CCBA0
	str r0, [r4, #8]
	movs r0, #0xc
	strh r0, [r4, #0xe]
	movs r0, #0
	strh r0, [r4, #0xc]
	b _0223BF5C
_0223BEFE:
	adds r1, r5, #0
	adds r1, #0x38
	ldrb r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0223BFC0 @ =0x0000119A
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [r4, #0x18]
	ldrb r0, [r4, #6]
	cmp r0, #0
	beq _0223BF2E
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0223BF3C
_0223BF2E:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0223BF3C:
	blx FUN_020F2104
	adds r1, r0, #0
	movs r0, #1
	lsls r0, r0, #0xc
	blx FUN_020CCBA0
	rsbs r0, r0, #0
	str r0, [r4, #8]
	movs r0, #0xe
	ldrsh r0, [r4, r0]
	subs r0, #0xc
	strh r0, [r4, #0xe]
	movs r0, #0x5a
	lsls r0, r0, #2
	strh r0, [r4, #0xc]
_0223BF5C:
	lsls r0, r6, #2
	adds r0, r6, r0
	adds r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r7, #0
	adds r0, #8
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	adds r1, r4, #0
	adds r1, #0x10
	str r0, [r4, #0x1c]
	bl FUN_020247F4
	adds r2, r5, r6
	adds r2, #0x30
	ldrb r2, [r2]
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r2, #4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r3, #1
	bl ov59_0223BE44
	ldr r0, _0223BFC4 @ =ov59_0223BFC8
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	adds r0, r5, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x4f
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	adds r5, #0x38
	adds r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223BFBC: .4byte 0x0000019A
_0223BFC0: .4byte 0x0000119A
_0223BFC4: .4byte ov59_0223BFC8
	thumb_func_end ov59_0223BE70

	thumb_func_start ov59_0223BFC8
ov59_0223BFC8: @ 0x0223BFC8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	movs r0, #0xe
	ldrh r1, [r5, #0xc]
	ldrsh r0, [r5, r0]
	ldr r4, [r5]
	adds r0, r1, r0
	strh r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	ldr r0, [r5, #8]
	adds r0, r1, r0
	str r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #8]
	adds r0, r1, r0
	str r0, [r5, #0x14]
	ldrb r0, [r5, #6]
	subs r0, r0, #1
	strb r0, [r5, #6]
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _0223C010
	ldrh r0, [r5, #0xc]
	bl FUN_0201FD00
	adds r1, r0, #0
	ldr r0, [r5, #0x1c]
	bl FUN_02024818
	ldr r0, [r5, #0x1c]
	adds r5, #0x10
	adds r1, r5, #0
	bl FUN_020247F4
	pop {r4, r5, r6, pc}
_0223C010:
	ldr r0, [r5, #0x1c]
	movs r1, #0
	bl FUN_02024818
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [r5, #0x10]
	str r0, [r5, #0x14]
	str r0, [r5, #0x18]
	adds r1, r5, #0
	ldr r0, [r5, #0x1c]
	adds r1, #0x10
	bl FUN_020247F4
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _0223C03A
	ldr r0, [r5, #0x1c]
	movs r1, #0
	bl FUN_02024830
_0223C03A:
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	adds r4, #0x4f
	subs r0, r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_0200E390
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_0223BFC8

	thumb_func_start ov59_0223C054
ov59_0223C054: @ 0x0223C054
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #8
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #8
	blx FUN_020D4994
	str r5, [r4]
	movs r0, #0x1e
	strb r0, [r4, #4]
	movs r0, #0xc
	strb r0, [r4, #6]
	ldr r0, _0223C094 @ =0x00000922
	bl FUN_0200604C
	ldr r0, _0223C098 @ =ov59_0223C09C
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	adds r0, r5, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	adds r5, #0x4f
	adds r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
	nop
_0223C094: .4byte 0x00000922
_0223C098: .4byte ov59_0223C09C
	thumb_func_end ov59_0223C054

	thumb_func_start ov59_0223C09C
ov59_0223C09C: @ 0x0223C09C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	ldrb r0, [r5, #5]
	ldr r4, [r5]
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	ldr r0, [r4, #0x78]
	bne _0223C0D0
	ldrb r2, [r5, #6]
	ldr r0, [r0, #0x20]
	movs r1, #0xc
	bl FUN_02008C2C
	ldr r0, [r4, #0x78]
	ldrb r2, [r5, #6]
	ldr r0, [r0, #0x20]
	movs r1, #0xd
	rsbs r2, r2, #0
	bl FUN_02008C2C
	b _0223C0E8
_0223C0D0:
	ldrb r2, [r5, #6]
	ldr r0, [r0, #0x20]
	movs r1, #0xc
	rsbs r2, r2, #0
	bl FUN_02008C2C
	ldr r0, [r4, #0x78]
	ldrb r2, [r5, #6]
	ldr r0, [r0, #0x20]
	movs r1, #0xd
	bl FUN_02008C2C
_0223C0E8:
	ldrb r1, [r5, #4]
	adds r0, r1, #1
	strb r0, [r5, #4]
	cmp r1, #8
	blo _0223C134
	movs r0, #0
	strb r0, [r5, #4]
	ldrb r1, [r5, #5]
	adds r0, r1, #1
	strb r0, [r5, #5]
	cmp r1, #4
	blo _0223C134
	ldr r0, [r4, #0x78]
	movs r1, #0xc
	adds r2, r1, #0
	ldr r0, [r0, #0x20]
	adds r2, #0xf4
	bl FUN_020087A4
	ldr r0, [r4, #0x78]
	movs r1, #0xd
	adds r2, r1, #0
	ldr r0, [r0, #0x20]
	adds r2, #0xf3
	bl FUN_020087A4
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	adds r4, #0x4f
	subs r0, r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_0200E390
_0223C134:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov59_0223C09C

	thumb_func_start ov59_0223C138
ov59_0223C138: @ 0x0223C138
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	movs r1, #8
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #8
	adds r5, r0, #0
	blx FUN_020D4994
	ldr r0, _0223C168 @ =ov59_0223C16C
	adds r1, r5, #0
	movs r2, #0
	str r4, [r5]
	bl FUN_0200E320
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	adds r4, #0x4f
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223C168: .4byte ov59_0223C16C
	thumb_func_end ov59_0223C138

	thumb_func_start ov59_0223C16C
ov59_0223C16C: @ 0x0223C16C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r6, r0, #0
	ldrb r0, [r4, #5]
	ldr r5, [r4]
	cmp r0, #4
	bhi _0223C25C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223C188: @ jump table
	.2byte _0223C192 - _0223C188 - 2 @ case 0
	.2byte _0223C1AE - _0223C188 - 2 @ case 1
	.2byte _0223C1E8 - _0223C188 - 2 @ case 2
	.2byte _0223C202 - _0223C188 - 2 @ case 3
	.2byte _0223C22A - _0223C188 - 2 @ case 4
_0223C192:
	ldr r0, [r5, #0x78]
	movs r1, #2
	bl ov59_0223C3C0
	ldr r0, _0223C28C @ =0x00000923
	bl FUN_0200604C
	movs r0, #0x14
	strb r0, [r4, #4]
	ldrb r0, [r4, #5]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4, #5]
	pop {r3, r4, r5, r6, pc}
_0223C1AE:
	ldrb r1, [r4, #4]
	subs r0, r1, #1
	strb r0, [r4, #4]
	cmp r1, #0
	bne _0223C288
	ldr r0, _0223C290 @ =0x00007FFF
	movs r1, #0
	str r0, [sp]
	ldr r0, [r5, #0x78]
	movs r2, #0x10
	ldr r0, [r0, #0x20]
	movs r3, #4
	bl FUN_020090B4
	ldr r0, [r5, #0x78]
	movs r1, #1
	bl ov59_0223C3C0
	ldr r0, [r5, #0x78]
	movs r1, #0
	bl ov59_0223C3C0
	movs r0, #0x19
	strb r0, [r4, #4]
	ldrb r0, [r4, #5]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4, #5]
	pop {r3, r4, r5, r6, pc}
_0223C1E8:
	ldrb r1, [r4, #4]
	subs r0, r1, #1
	strb r0, [r4, #4]
	cmp r1, #0
	bne _0223C288
	ldr r0, _0223C294 @ =0x00000924
	bl FUN_0200604C
	ldrb r0, [r4, #5]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4, #5]
	pop {r3, r4, r5, r6, pc}
_0223C202:
	ldr r0, [r5, #0x78]
	ldr r0, [r0, #0x20]
	bl FUN_02009138
	cmp r0, #0
	bne _0223C288
	ldr r0, [r5, #0x78]
	bl ov59_0223C3DC
	cmp r0, #0
	bne _0223C288
	ldr r0, [r5, #0x78]
	ldr r0, [r0, #0x24]
	bl FUN_020154B8
	ldrb r0, [r4, #5]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4, #5]
	pop {r3, r4, r5, r6, pc}
_0223C22A:
	movs r0, #6
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5]
	movs r1, #1
	str r0, [sp, #8]
	ldr r3, _0223C290 @ =0x00007FFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, _0223C290 @ =0x00007FFF
	movs r1, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x78]
	movs r2, #0
	ldr r0, [r0, #0x20]
	movs r3, #4
	bl FUN_020090B4
	ldrb r0, [r4, #5]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4, #5]
	pop {r3, r4, r5, r6, pc}
_0223C25C:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223C288
	ldr r0, [r5, #0x78]
	ldr r0, [r0, #0x20]
	bl FUN_02009138
	cmp r0, #0
	bne _0223C288
	adds r0, r5, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	adds r5, #0x4f
	subs r0, r0, #1
	strb r0, [r5]
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_0200E390
_0223C288:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0223C28C: .4byte 0x00000923
_0223C290: .4byte 0x00007FFF
_0223C294: .4byte 0x00000924
	thumb_func_end ov59_0223C16C

	thumb_func_start ov59_0223C298
ov59_0223C298: @ 0x0223C298
	push {r3, r4, r5, lr}
	sub sp, #8
	movs r1, #0x28
	adds r5, r0, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x28
	blx FUN_020D4994
	movs r1, #0
	str r5, [r4]
	movs r0, #1
	str r0, [sp]
	ldr r0, _0223C2FC @ =ov59_0223C3F0
	movs r2, #2
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r3, r1, #0
	bl FUN_02026EB4
	str r0, [r4, #4]
	bl ov59_0223C474
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov59_0223C5C4
	adds r0, r4, #0
	bl ov59_0223C584
	adds r0, r5, #0
	bl FUN_02007FD4
	str r0, [r4, #0xc]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r1, _0223C300 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	movs r0, #1
	orrs r0, r2
	strh r0, [r1]
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223C2FC: .4byte ov59_0223C3F0
_0223C300: .4byte 0x04000008
	thumb_func_end ov59_0223C298

	thumb_func_start ov59_0223C304
ov59_0223C304: @ 0x0223C304
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02026E48
	bl FUN_0201543C
	bl FUN_02026E48
	blx FUN_020B7350
	bl FUN_02023154
	ldr r2, _0223C348 @ =0x04000440
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
	ldr r0, [r4, #0xc]
	bl FUN_02008120
	bl FUN_02015460
	ldr r0, _0223C34C @ =0x04000540
	movs r1, #1
	str r1, [r0]
	pop {r4, pc}
	.align 2, 0
_0223C348: .4byte 0x04000440
_0223C34C: .4byte 0x04000540
	thumb_func_end ov59_0223C304

	thumb_func_start ov59_0223C350
ov59_0223C350: @ 0x0223C350
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02023120
	ldr r0, [r4, #0xc]
	bl FUN_02008524
	adds r0, r4, #0
	bl ov59_0223C5B0
	ldr r0, [r4, #4]
	bl FUN_02026F54
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov59_0223C350

	thumb_func_start ov59_0223C374
ov59_0223C374: @ 0x0223C374
	ldr r3, _0223C37C @ =FUN_02009418
	ldr r0, [r0, #0xc]
	bx r3
	nop
_0223C37C: .4byte FUN_02009418
	thumb_func_end ov59_0223C374

	thumb_func_start ov59_0223C380
ov59_0223C380: @ 0x0223C380
	push {r4, lr}
	sub sp, #0x20
	ldr r1, [r1]
	adds r4, r0, #0
	add r0, sp, #0x10
	movs r2, #2
	bl FUN_02070124
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0xc]
	add r1, sp, #0x10
	movs r2, #0xcc
	movs r3, #0x70
	bl FUN_020085EC
	str r0, [r4, #0x20]
	add sp, #0x20
	pop {r4, pc}
	thumb_func_end ov59_0223C380

	thumb_func_start ov59_0223C3AC
ov59_0223C3AC: @ 0x0223C3AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0223C3BE
	bl FUN_02008780
	movs r0, #0
	str r0, [r4, #0x20]
_0223C3BE:
	pop {r4, pc}
	thumb_func_end ov59_0223C3AC

	thumb_func_start ov59_0223C3C0
ov59_0223C3C0: @ 0x0223C3C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x24]
	ldr r2, _0223C3D8 @ =ov59_0223C4EC
	adds r3, r4, #0
	bl FUN_02015494
	ldr r0, [r4, #0x24]
	movs r1, #1
	bl FUN_02015528
	pop {r4, pc}
	.align 2, 0
_0223C3D8: .4byte ov59_0223C4EC
	thumb_func_end ov59_0223C3C0

	thumb_func_start ov59_0223C3DC
ov59_0223C3DC: @ 0x0223C3DC
	push {r3, lr}
	ldr r0, [r0, #0x24]
	bl FUN_020154B0
	cmp r0, #0
	beq _0223C3EC
	movs r0, #1
	pop {r3, pc}
_0223C3EC:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov59_0223C3DC

	thumb_func_start ov59_0223C3F0
ov59_0223C3F0: @ 0x0223C3F0
	push {r3, r4, lr}
	sub sp, #4
	blx FUN_020C2698
	blx FUN_020CF564
	blx FUN_020CF704
	ldr r0, _0223C45C @ =0x04000060
	ldr r1, _0223C460 @ =0xFFFFCFFD
	ldrh r2, [r0]
	ldr r3, _0223C464 @ =0x0000CFFB
	ands r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	ands r2, r3
	strh r2, [r0]
	adds r2, r1, #2
	ldrh r4, [r0]
	adds r1, r1, #2
	subs r3, #0x1c
	ands r4, r2
	movs r2, #8
	orrs r2, r4
	strh r2, [r0]
	ldrh r2, [r0]
	ands r2, r1
	movs r1, #0x10
	orrs r1, r2
	strh r1, [r0]
	ldrh r1, [r0]
	ands r1, r3
	strh r1, [r0]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	blx FUN_020CF82C
	movs r0, #0
	ldr r2, _0223C468 @ =0x00007FFF
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r1, _0223C46C @ =0x04000540
	movs r0, #2
	str r0, [r1]
	ldr r0, _0223C470 @ =0xBFFF0000
	str r0, [r1, #0x40]
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223C45C: .4byte 0x04000060
_0223C460: .4byte 0xFFFFCFFD
_0223C464: .4byte 0x0000CFFB
_0223C468: .4byte 0x00007FFF
_0223C46C: .4byte 0x04000540
_0223C470: .4byte 0xBFFF0000
	thumb_func_end ov59_0223C3F0

	thumb_func_start ov59_0223C474
ov59_0223C474: @ 0x0223C474
	push {r3, r4, r5, lr}
	ldr r3, _0223C4AC @ =0x02110924
	movs r0, #2
	movs r1, #0
	ldr r3, [r3]
	lsls r0, r0, #0xe
	adds r2, r1, #0
	blx r3
	ldr r3, _0223C4B0 @ =0x0211092C
	movs r1, #0
	adds r4, r0, #0
	ldr r3, [r3]
	movs r0, #0xa0
	adds r2, r1, #0
	blx r3
	adds r5, r0, #0
	cmp r4, #0
	bne _0223C49C
	bl FUN_0202551C
_0223C49C:
	cmp r5, #0
	bne _0223C4A4
	bl FUN_0202551C
_0223C4A4:
	bl FUN_02014DA0
	pop {r3, r4, r5, pc}
	nop
_0223C4AC: .4byte 0x02110924
_0223C4B0: .4byte 0x0211092C
	thumb_func_end ov59_0223C474

	thumb_func_start ov59_0223C4B4
ov59_0223C4B4: @ 0x0223C4B4
	push {r4, lr}
	ldr r3, _0223C4CC @ =0x02110924
	movs r2, #0
	ldr r3, [r3]
	blx r3
	adds r4, r0, #0
	bl FUN_02015354
	lsls r0, r4, #0x10
	lsrs r0, r0, #0xd
	pop {r4, pc}
	nop
_0223C4CC: .4byte 0x02110924
	thumb_func_end ov59_0223C4B4

	thumb_func_start ov59_0223C4D0
ov59_0223C4D0: @ 0x0223C4D0
	push {r4, lr}
	ldr r3, _0223C4E8 @ =0x0211092C
	movs r2, #0
	ldr r3, [r3]
	blx r3
	adds r4, r0, #0
	bl FUN_02015394
	lsls r0, r4, #0x10
	lsrs r0, r0, #0xd
	pop {r4, pc}
	nop
_0223C4E8: .4byte 0x0211092C
	thumb_func_end ov59_0223C4D0

	thumb_func_start ov59_0223C4EC
ov59_0223C4EC: @ 0x0223C4EC
	push {r3}
	sub sp, #0xc
	add r2, sp, #0
	movs r1, #0
	str r1, [r2]
	str r1, [r2, #4]
	str r1, [r2, #8]
	ldr r1, _0223C530 @ =0xFFFFEFE0
	ldr r2, _0223C534 @ =0x00003310
	str r1, [sp, #4]
	ldr r1, _0223C538 @ =0xFFFFE520
	str r2, [sp]
	str r1, [sp, #8]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	adds r1, r2, r1
	str r1, [r0, #0x28]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #4]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #8]
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	adds r1, r2, r1
	str r1, [r0, #0x30]
	add sp, #0xc
	pop {r3}
	bx lr
	nop
_0223C530: .4byte 0xFFFFEFE0
_0223C534: .4byte 0x00003310
_0223C538: .4byte 0xFFFFE520
	thumb_func_end ov59_0223C4EC

	thumb_func_start ov59_0223C53C
ov59_0223C53C: @ 0x0223C53C
	push {r4, lr}
	sub sp, #8
	movs r1, #0x12
	lsls r1, r1, #0xa
	adds r4, r0, #0
	bl FUN_0201AA8C
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r3, #0x12
	ldr r0, _0223C57C @ =ov59_0223C4B4
	ldr r1, _0223C580 @ =ov59_0223C4D0
	lsls r3, r3, #0xa
	str r4, [sp, #4]
	bl FUN_02014DB4
	adds r4, r0, #0
	bl FUN_02015524
	adds r2, r0, #0
	beq _0223C574
	movs r0, #1
	movs r1, #0xe1
	lsls r0, r0, #0xc
	lsls r1, r1, #0xe
	bl FUN_02023240
_0223C574:
	adds r0, r4, #0
	add sp, #8
	pop {r4, pc}
	nop
_0223C57C: .4byte ov59_0223C4B4
_0223C580: .4byte ov59_0223C4D0
	thumb_func_end ov59_0223C53C

	thumb_func_start ov59_0223C584
ov59_0223C584: @ 0x0223C584
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl ov59_0223C53C
	str r0, [r4, #0x24]
	movs r1, #1
	bl FUN_02015528
	ldr r2, [r4]
	movs r0, #0xf4
	movs r1, #0xa
	bl FUN_02015264
	adds r1, r0, #0
	ldr r0, [r4, #0x24]
	movs r2, #0xa
	movs r3, #1
	bl FUN_0201526C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223C584

	thumb_func_start ov59_0223C5B0
ov59_0223C5B0: @ 0x0223C5B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x24]
	bl FUN_02014EBC
	ldr r0, [r4, #0x24]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov59_0223C5B0

	thumb_func_start ov59_0223C5C4
ov59_0223C5C4: @ 0x0223C5C4
	push {r4, r5, lr}
	sub sp, #0x1c
	ldr r5, _0223C61C @ =0x0223CB58
	adds r4, r0, #0
	adds r2, r1, #0
	ldm r5!, {r0, r1}
	add r3, sp, #0x10
	stm r3!, {r0, r1}
	ldr r0, [r5]
	add r1, sp, #8
	str r0, [r3]
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	adds r0, r2, #0
	bl FUN_02023114
	str r0, [r4, #8]
	movs r1, #1
	str r1, [sp]
	ldr r0, [r4, #8]
	ldr r3, _0223C620 @ =0x000005C1
	str r0, [sp, #4]
	add r0, sp, #0x10
	lsls r1, r1, #0x10
	add r2, sp, #8
	bl FUN_020232BC
	movs r1, #0x19
	ldr r2, [r4, #8]
	movs r0, #0
	lsls r1, r1, #0xe
	bl FUN_02023240
	ldr r0, [r4, #8]
	bl FUN_02023234
	ldr r0, [r4, #8]
	bl FUN_0202313C
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
_0223C61C: .4byte 0x0223CB58
_0223C620: .4byte 0x000005C1
	thumb_func_end ov59_0223C5C4

	.rodata

_0223C624:
	.byte 0x02, 0x08, 0x00, 0x00, 0x05, 0x06, 0x00, 0x00, 0x02, 0x03, 0x04, 0x00
	.byte 0x00, 0x02, 0x01, 0x00, 0x00, 0x04, 0x03, 0x00, 0x00, 0x06, 0x05, 0x00, 0x03, 0x04, 0x00, 0x0B
	.byte 0x00, 0x00, 0x3A, 0x00, 0x1F, 0x00, 0x30, 0x00, 0x12, 0x00, 0x13, 0x00, 0x11, 0x00, 0x10, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x4C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x16, 0x0E, 0x2C, 0xC6, 0x23, 0x02
	.byte 0x02, 0x00, 0x11, 0x0C, 0x28, 0xC6, 0x23, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x31, 0x00, 0x4B, 0x00, 0x41, 0x00, 0x1B, 0x00, 0x51, 0x00
	.byte 0x4B, 0x00, 0x61, 0x00, 0x1B, 0x00, 0x71, 0x00, 0x4B, 0x00, 0x81, 0x00, 0x1B, 0x00, 0x91, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x09, 0x16, 0x06, 0x0C, 0xA6, 0x00
	.byte 0x02, 0x03, 0x01, 0x1C, 0x02, 0x0C, 0x2A, 0x01, 0x02, 0x19, 0x15, 0x06, 0x02, 0x09, 0x62, 0x01
	.byte 0x02, 0x02, 0x15, 0x0A, 0x02, 0x0C, 0x6E, 0x01, 0x07, 0x02, 0x11, 0x1C, 0x06, 0x0C, 0x58, 0x03
	.byte 0x00, 0x09, 0x07, 0x09, 0x02, 0x0C, 0x82, 0x01, 0x00, 0x11, 0x0D, 0x06, 0x02, 0x0C, 0x94, 0x01
	.byte 0x00, 0x11, 0x10, 0x06, 0x02, 0x0C, 0xA0, 0x01, 0x00, 0x0C, 0x0D, 0x02, 0x03, 0x0C, 0xAC, 0x01
	.byte 0x00, 0x09, 0x0D, 0x02, 0x03, 0x0C, 0xB2, 0x01, 0x00, 0x0E, 0x0E, 0x02, 0x02, 0x0C, 0xB8, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x31, 0x00, 0x00, 0x00, 0x09, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x98, 0x00
	.byte 0x00, 0x00, 0x10, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x60, 0x00, 0x00, 0x00, 0x14, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x70, 0x00
	.byte 0x00, 0x00, 0x1C, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x67, 0x00, 0x60, 0x00, 0x00, 0x00, 0x18, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x68, 0x78, 0x88, 0xB8, 0x80, 0x90, 0x88, 0xB8
	.byte 0x58, 0x68, 0x5E, 0x6C, 0x80, 0x90, 0x5E, 0x6C, 0x58, 0x68, 0x4A, 0x58, 0x80, 0x90, 0x4A, 0x58
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFE, 0x1A, 0x30, 0x18, 0xFE, 0x4A, 0x40, 0x18, 0xFE, 0x1A, 0x50, 0x18
	.byte 0xFE, 0x4A, 0x60, 0x18, 0xFE, 0x1A, 0x70, 0x18, 0xFE, 0x4A, 0x80, 0x18, 0xFE, 0x1A, 0x90, 0x18
	.byte 0x48, 0xA0, 0x98, 0xE8, 0xA0, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x06, 0x05, 0x00
	.byte 0x00, 0x04, 0x03, 0x00, 0x00, 0x0F, 0x03, 0x00, 0x00, 0x0F, 0x07, 0x00, 0x90, 0xA8, 0xC0, 0x00
	.byte 0xA8, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0D, 0x00, 0x0C, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x4B, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x01, 0x02, 0x01, 0x1B, 0x02, 0x0C, 0x1F, 0x00, 0x01, 0x19, 0x12, 0x06, 0x06, 0x0C, 0x55, 0x00
	.byte 0x01, 0x19, 0x15, 0x06, 0x02, 0x0C, 0x79, 0x00, 0x02, 0x14, 0x01, 0x0A, 0x02, 0x0C, 0x85, 0x00
	.byte 0x02, 0x14, 0x04, 0x0A, 0x04, 0x0C, 0x99, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB8, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x58, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x28, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x38, 0x00, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00

	.data

_0223CB80:
	.byte 0x00, 0x03, 0x0F, 0x00, 0x00, 0x05, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x0223CBA0
