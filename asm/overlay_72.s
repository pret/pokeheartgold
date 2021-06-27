
	thumb_func_start ov72_022378C0
ov72_022378C0: @ 0x022378C0
	push {r3, r4}
	ldr r3, _022378D8 @ =0x0223B820
	movs r4, #1
	str r4, [r3]
	movs r4, #0
	str r4, [r3, #4]
	str r0, [r3, #8]
	str r1, [r3, #0xc]
	str r2, [r3, #0x10]
	pop {r3, r4}
	bx lr
	nop
_022378D8: .4byte 0x0223B820
	thumb_func_end ov72_022378C0

	thumb_func_start ov72_022378DC
ov72_022378DC: @ 0x022378DC
	push {r3, lr}
	ldr r1, _02237B48 @ =0x0223B820
	ldr r0, [r1]
	cmp r0, #0xc
	bls _022378E8
	b _02237B44
_022378E8:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022378F4: @ jump table
	.2byte _02237B44 - _022378F4 - 2 @ case 0
	.2byte _02237B44 - _022378F4 - 2 @ case 1
	.2byte _0223790E - _022378F4 - 2 @ case 2
	.2byte _02237B38 - _022378F4 - 2 @ case 3
	.2byte _02237958 - _022378F4 - 2 @ case 4
	.2byte _02237B38 - _022378F4 - 2 @ case 5
	.2byte _022379C8 - _022378F4 - 2 @ case 6
	.2byte _02237B38 - _022378F4 - 2 @ case 7
	.2byte _02237A3A - _022378F4 - 2 @ case 8
	.2byte _02237B38 - _022378F4 - 2 @ case 9
	.2byte _02237AAC - _022378F4 - 2 @ case 10
	.2byte _02237B38 - _022378F4 - 2 @ case 11
	.2byte _02237B44 - _022378F4 - 2 @ case 12
_0223790E:
	bl FUN_0221BF48
	cmp r0, #1
	beq _0223791C
	cmp r0, #7
	beq _02237934
	pop {r3, pc}
_0223791C:
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #0xc
	str r1, [r0]
	bl FUN_0221C014
	bl ov72_02237D88
	ldr r1, _02237B48 @ =0x0223B820
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_02237934:
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #0xc
	str r1, [r0]
	bl FUN_0221C020
	cmp r0, #0
	ble _0223794A
	ldr r0, _02237B4C @ =0x0223B920
	ldrb r1, [r0, #3]
	ldr r0, _02237B48 @ =0x0223B820
	b _02237950
_0223794A:
	movs r1, #1
	ldr r0, _02237B48 @ =0x0223B820
	mvns r1, r1
_02237950:
	str r1, [r0, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_02237958:
	bl FUN_0221BF48
	cmp r0, #1
	beq _02237966
	cmp r0, #7
	beq _0223797E
	pop {r3, pc}
_02237966:
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #0xc
	str r1, [r0]
	bl FUN_0221C014
	bl ov72_02237D88
	ldr r1, _02237B48 @ =0x0223B820
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_0223797E:
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #0xc
	str r1, [r0]
	bl FUN_0221C020
	ldr r1, _02237B50 @ =0x00000A38
	cmp r0, r1
	bne _02237996
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #0
	str r1, [r0, #4]
	b _022379C2
_02237996:
	ldr r0, _02237B4C @ =0x0223B920
	ldr r0, [r0, #8]
	ldrb r0, [r0]
	cmp r0, #2
	beq _022379A6
	cmp r0, #5
	beq _022379B0
	b _022379BA
_022379A6:
	movs r1, #2
	ldr r0, _02237B48 @ =0x0223B820
	mvns r1, r1
	str r1, [r0, #4]
	b _022379C2
_022379B0:
	movs r1, #1
	ldr r0, _02237B48 @ =0x0223B820
	mvns r1, r1
	str r1, [r0, #4]
	b _022379C2
_022379BA:
	movs r1, #4
	ldr r0, _02237B48 @ =0x0223B820
	mvns r1, r1
	str r1, [r0, #4]
_022379C2:
	bl FUN_0221BFEC
	pop {r3, pc}
_022379C8:
	bl FUN_0221BF48
	cmp r0, #1
	beq _022379D6
	cmp r0, #7
	beq _022379EE
	pop {r3, pc}
_022379D6:
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #0xc
	str r1, [r0]
	bl FUN_0221C014
	bl ov72_02237D88
	ldr r1, _02237B48 @ =0x0223B820
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_022379EE:
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #0xc
	ldr r2, _02237B4C @ =0x0223B920
	str r1, [r0]
	ldrb r2, [r2, #3]
	cmp r2, #5
	bhi _02237A2C
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_02237A08: @ jump table
	.2byte _02237A2C - _02237A08 - 2 @ case 0
	.2byte _02237A14 - _02237A08 - 2 @ case 1
	.2byte _02237A1A - _02237A08 - 2 @ case 2
	.2byte _02237A2C - _02237A08 - 2 @ case 3
	.2byte _02237A20 - _02237A08 - 2 @ case 4
	.2byte _02237A26 - _02237A08 - 2 @ case 5
_02237A14:
	movs r1, #0
	str r1, [r0, #4]
	b _02237A34
_02237A1A:
	subs r1, #0xf
	str r1, [r0, #4]
	b _02237A34
_02237A20:
	subs r1, #0xd
	str r1, [r0, #4]
	b _02237A34
_02237A26:
	subs r1, #0xe
	str r1, [r0, #4]
	b _02237A34
_02237A2C:
	movs r1, #4
	ldr r0, _02237B48 @ =0x0223B820
	mvns r1, r1
	str r1, [r0, #4]
_02237A34:
	bl FUN_0221BFEC
	pop {r3, pc}
_02237A3A:
	bl FUN_0221BF48
	cmp r0, #1
	beq _02237A48
	cmp r0, #7
	beq _02237A60
	pop {r3, pc}
_02237A48:
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #0xc
	str r1, [r0]
	bl FUN_0221C014
	bl ov72_02237D88
	ldr r1, _02237B48 @ =0x0223B820
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_02237A60:
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #0xc
	ldr r2, _02237B4C @ =0x0223B920
	str r1, [r0]
	ldrb r2, [r2, #3]
	cmp r2, #5
	bhi _02237A9E
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_02237A7A: @ jump table
	.2byte _02237A9E - _02237A7A - 2 @ case 0
	.2byte _02237A86 - _02237A7A - 2 @ case 1
	.2byte _02237A9E - _02237A7A - 2 @ case 2
	.2byte _02237A8C - _02237A7A - 2 @ case 3
	.2byte _02237A92 - _02237A7A - 2 @ case 4
	.2byte _02237A98 - _02237A7A - 2 @ case 5
_02237A86:
	movs r1, #0
	str r1, [r0, #4]
	b _02237AA6
_02237A8C:
	movs r1, #1
	str r1, [r0, #4]
	b _02237AA6
_02237A92:
	movs r1, #2
	str r1, [r0, #4]
	b _02237AA6
_02237A98:
	subs r1, #0xe
	str r1, [r0, #4]
	b _02237AA6
_02237A9E:
	movs r1, #4
	ldr r0, _02237B48 @ =0x0223B820
	mvns r1, r1
	str r1, [r0, #4]
_02237AA6:
	bl FUN_0221BFEC
	pop {r3, pc}
_02237AAC:
	bl FUN_0221BF48
	cmp r0, #1
	beq _02237ABA
	cmp r0, #7
	beq _02237AD2
	pop {r3, pc}
_02237ABA:
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #0xc
	str r1, [r0]
	bl FUN_0221C014
	bl ov72_02237D88
	ldr r1, _02237B48 @ =0x0223B820
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_02237AD2:
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #0xc
	str r1, [r0]
	bl FUN_0221C020
	cmp r0, #8
	bne _02237AE8
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #0
	str r1, [r0, #4]
	b _02237B32
_02237AE8:
	ldr r0, _02237B4C @ =0x0223B920
	ldrb r0, [r0, #3]
	cmp r0, #5
	bhi _02237B2A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02237AFC: @ jump table
	.2byte _02237B2A - _02237AFC - 2 @ case 0
	.2byte _02237B08 - _02237AFC - 2 @ case 1
	.2byte _02237B2A - _02237AFC - 2 @ case 2
	.2byte _02237B10 - _02237AFC - 2 @ case 3
	.2byte _02237B18 - _02237AFC - 2 @ case 4
	.2byte _02237B20 - _02237AFC - 2 @ case 5
_02237B08:
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #0
	str r1, [r0, #4]
	b _02237B32
_02237B10:
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #1
	str r1, [r0, #4]
	b _02237B32
_02237B18:
	ldr r0, _02237B48 @ =0x0223B820
	movs r1, #2
	str r1, [r0, #4]
	b _02237B32
_02237B20:
	movs r1, #1
	ldr r0, _02237B48 @ =0x0223B820
	mvns r1, r1
	str r1, [r0, #4]
	b _02237B32
_02237B2A:
	movs r1, #4
	ldr r0, _02237B48 @ =0x0223B820
	mvns r1, r1
	str r1, [r0, #4]
_02237B32:
	bl FUN_0221BFEC
	pop {r3, pc}
_02237B38:
	movs r0, #0xc
	str r0, [r1]
	subs r0, #0x10
	str r0, [r1, #4]
	bl FUN_0221BFEC
_02237B44:
	pop {r3, pc}
	nop
_02237B48: .4byte 0x0223B820
_02237B4C: .4byte 0x0223B920
_02237B50: .4byte 0x00000A38
	thumb_func_end ov72_022378DC

	thumb_func_start ov72_02237B54
ov72_02237B54: @ 0x02237B54
	ldr r1, _02237B70 @ =0x0223B820
	ldr r0, [r1]
	cmp r0, #1
	beq _02237B62
	cmp r0, #0xc
	beq _02237B66
	b _02237B6C
_02237B62:
	movs r0, #1
	bx lr
_02237B66:
	movs r0, #1
	str r0, [r1]
	bx lr
_02237B6C:
	movs r0, #0
	bx lr
	.align 2, 0
_02237B70: .4byte 0x0223B820
	thumb_func_end ov72_02237B54

	thumb_func_start ov72_02237B74
ov72_02237B74: @ 0x02237B74
	ldr r0, _02237B7C @ =0x0223B820
	ldr r0, [r0, #4]
	bx lr
	nop
_02237B7C: .4byte 0x0223B820
	thumb_func_end ov72_02237B74

	thumb_func_start ov72_02237B80
ov72_02237B80: @ 0x02237B80
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl FUN_0221BE84
	ldr r0, _02237BC0 @ =0x0223B820
	subs r1, r4, #1
	strb r1, [r0, #0x14]
	movs r0, #2
	str r0, [sp]
	ldr r0, _02237BC4 @ =0x0223B4E0
	ldr r1, _02237BC8 @ =0x0223B834
	ldr r3, _02237BCC @ =0x0223B923
	movs r2, #1
	bl ov72_02237D50
	cmp r0, #0
	beq _02237BAE
	ldr r0, _02237BC0 @ =0x0223B820
	movs r1, #2
	str r1, [r0]
	add sp, #4
	pop {r3, r4, pc}
_02237BAE:
	ldr r0, _02237BC0 @ =0x0223B820
	movs r1, #0xc
	str r1, [r0]
	subs r1, #0x11
	str r1, [r0, #4]
	bl FUN_0221BFEC
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02237BC0: .4byte 0x0223B820
_02237BC4: .4byte 0x0223B4E0
_02237BC8: .4byte 0x0223B834
_02237BCC: .4byte 0x0223B923
	thumb_func_end ov72_02237B80

	thumb_func_start ov72_02237BD0
ov72_02237BD0: @ 0x02237BD0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _02237C1C @ =0x0223B920
	adds r6, r2, #0
	adds r4, r1, #0
	str r6, [r0, #8]
	bl FUN_0221BE84
	ldr r0, _02237C20 @ =0x0223B820
	subs r1, r5, #1
	strb r1, [r0, #0x14]
	subs r1, r4, #1
	strb r1, [r0, #0x15]
	ldr r0, _02237C24 @ =0x00000A38
	ldr r1, _02237C28 @ =0x0223B834
	str r0, [sp]
	ldr r0, _02237C2C @ =0x0223B52C
	movs r2, #2
	adds r3, r6, #0
	bl ov72_02237D50
	cmp r0, #0
	beq _02237C0A
	ldr r0, _02237C20 @ =0x0223B820
	movs r1, #4
	str r1, [r0]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02237C0A:
	ldr r0, _02237C20 @ =0x0223B820
	movs r1, #0xc
	str r1, [r0]
	subs r1, #0x11
	str r1, [r0, #4]
	bl FUN_0221BFEC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02237C1C: .4byte 0x0223B920
_02237C20: .4byte 0x0223B820
_02237C24: .4byte 0x00000A38
_02237C28: .4byte 0x0223B834
_02237C2C: .4byte 0x0223B52C
	thumb_func_end ov72_02237BD0

	thumb_func_start ov72_02237C30
ov72_02237C30: @ 0x02237C30
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	bl FUN_0221BE84
	ldr r0, _02237C94 @ =0x0223B834
	adds r1, r4, #0
	movs r2, #0xe4
	blx FUN_020E5AD8
	ldr r0, _02237C98 @ =0x0223B900
	subs r1, r5, #1
	strb r1, [r0, #0x18]
	subs r1, r6, #1
	strb r1, [r0, #0x19]
	ldr r3, _02237C9C @ =0x0223B91B
	ldr r2, _02237CA0 @ =0x0223B82C
	strb r7, [r0, #0x1a]
	movs r1, #8
_02237C5A:
	ldrb r0, [r2]
	adds r2, r2, #1
	strb r0, [r3]
	adds r3, r3, #1
	subs r1, r1, #1
	bne _02237C5A
	movs r0, #2
	str r0, [sp]
	ldr r0, _02237CA4 @ =0x0223B578
	ldr r1, _02237C94 @ =0x0223B834
	ldr r3, _02237CA8 @ =0x0223B923
	movs r2, #0xef
	bl ov72_02237D50
	cmp r0, #0
	beq _02237C82
	ldr r0, _02237CAC @ =0x0223B820
	movs r1, #6
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
_02237C82:
	ldr r0, _02237CAC @ =0x0223B820
	movs r1, #0xc
	str r1, [r0]
	subs r1, #0x11
	str r1, [r0, #4]
	bl FUN_0221BFEC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02237C94: .4byte 0x0223B834
_02237C98: .4byte 0x0223B900
_02237C9C: .4byte 0x0223B91B
_02237CA0: .4byte 0x0223B82C
_02237CA4: .4byte 0x0223B578
_02237CA8: .4byte 0x0223B923
_02237CAC: .4byte 0x0223B820
	thumb_func_end ov72_02237C30

	thumb_func_start ov72_02237CB0
ov72_02237CB0: @ 0x02237CB0
	push {r3, lr}
	bl FUN_0221BE84
	movs r0, #2
	str r0, [sp]
	ldr r0, _02237CE4 @ =0x0223B5C4
	ldr r1, _02237CE8 @ =0x0223B834
	ldr r3, _02237CEC @ =0x0223B923
	movs r2, #0
	bl ov72_02237D50
	cmp r0, #0
	beq _02237CD2
	ldr r0, _02237CF0 @ =0x0223B820
	movs r1, #8
	str r1, [r0]
	pop {r3, pc}
_02237CD2:
	ldr r0, _02237CF0 @ =0x0223B820
	movs r1, #0xc
	str r1, [r0]
	subs r1, #0x11
	str r1, [r0, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
	nop
_02237CE4: .4byte 0x0223B5C4
_02237CE8: .4byte 0x0223B834
_02237CEC: .4byte 0x0223B923
_02237CF0: .4byte 0x0223B820
	thumb_func_end ov72_02237CB0

	thumb_func_start ov72_02237CF4
ov72_02237CF4: @ 0x02237CF4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x1c
	adds r4, r1, #0
	blx FUN_020D3C40
	ldr r0, _02237D40 @ =0x0223B834
	adds r1, r5, #0
	movs r2, #0x64
	blx FUN_020E5AD8
	ldr r0, _02237D44 @ =0x0223B920
	str r4, [r0, #8]
	bl FUN_0221BE84
	movs r0, #8
	str r0, [sp]
	ldr r3, _02237D44 @ =0x0223B920
	ldr r0, _02237D48 @ =0x0223B60C
	ldr r1, _02237D40 @ =0x0223B834
	ldr r3, [r3, #8]
	movs r2, #0x64
	bl ov72_02237D50
	cmp r0, #0
	beq _02237D30
	ldr r0, _02237D4C @ =0x0223B820
	movs r1, #0xa
	str r1, [r0]
	pop {r3, r4, r5, pc}
_02237D30:
	ldr r0, _02237D4C @ =0x0223B820
	movs r1, #0xc
	str r1, [r0]
	subs r1, #0x11
	str r1, [r0, #4]
	bl FUN_0221BFEC
	pop {r3, r4, r5, pc}
	.align 2, 0
_02237D40: .4byte 0x0223B834
_02237D44: .4byte 0x0223B920
_02237D48: .4byte 0x0223B60C
_02237D4C: .4byte 0x0223B820
	thumb_func_end ov72_02237CF4

	thumb_func_start ov72_02237D50
ov72_02237D50: @ 0x02237D50
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	ldr r1, [sp, #0x18]
	str r3, [sp]
	str r1, [sp, #4]
	adds r4, r2, #0
	ldr r1, _02237D84 @ =0x0223B820
	adds r2, r5, #0
	ldr r1, [r1, #8]
	adds r3, r4, #0
	bl FUN_0221BEA8
	cmp r0, #0
	beq _02237D76
	cmp r0, #1
	beq _02237D7C
	cmp r0, #2
	b _02237D7C
_02237D76:
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, pc}
_02237D7C:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02237D84: .4byte 0x0223B820
	thumb_func_end ov72_02237D50

	thumb_func_start ov72_02237D88
ov72_02237D88: @ 0x02237D88
	push {r4, lr}
	cmp r0, #0x20
	bhi _02237E00
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02237D9A: @ jump table
	.2byte _02237DDC - _02237D9A - 2 @ case 0
	.2byte _02237DDC - _02237D9A - 2 @ case 1
	.2byte _02237DE2 - _02237D9A - 2 @ case 2
	.2byte _02237DDC - _02237D9A - 2 @ case 3
	.2byte _02237DDC - _02237D9A - 2 @ case 4
	.2byte _02237DDC - _02237D9A - 2 @ case 5
	.2byte _02237DDC - _02237D9A - 2 @ case 6
	.2byte _02237E00 - _02237D9A - 2 @ case 7
	.2byte _02237DE2 - _02237D9A - 2 @ case 8
	.2byte _02237DDC - _02237D9A - 2 @ case 9
	.2byte _02237DDC - _02237D9A - 2 @ case 10
	.2byte _02237DE8 - _02237D9A - 2 @ case 11
	.2byte _02237DEE - _02237D9A - 2 @ case 12
	.2byte _02237DEE - _02237D9A - 2 @ case 13
	.2byte _02237DDC - _02237D9A - 2 @ case 14
	.2byte _02237DFA - _02237D9A - 2 @ case 15
	.2byte _02237DF4 - _02237D9A - 2 @ case 16
	.2byte _02237DF4 - _02237D9A - 2 @ case 17
	.2byte _02237DF4 - _02237D9A - 2 @ case 18
	.2byte _02237DF4 - _02237D9A - 2 @ case 19
	.2byte _02237DDC - _02237D9A - 2 @ case 20
	.2byte _02237DDC - _02237D9A - 2 @ case 21
	.2byte _02237DDC - _02237D9A - 2 @ case 22
	.2byte _02237DDC - _02237D9A - 2 @ case 23
	.2byte _02237E00 - _02237D9A - 2 @ case 24
	.2byte _02237DE2 - _02237D9A - 2 @ case 25
	.2byte _02237DF4 - _02237D9A - 2 @ case 26
	.2byte _02237DF4 - _02237D9A - 2 @ case 27
	.2byte _02237DF4 - _02237D9A - 2 @ case 28
	.2byte _02237DF4 - _02237D9A - 2 @ case 29
	.2byte _02237DFA - _02237D9A - 2 @ case 30
	.2byte _02237DF4 - _02237D9A - 2 @ case 31
	.2byte _02237DDC - _02237D9A - 2 @ case 32
_02237DDC:
	movs r4, #4
	mvns r4, r4
	b _02237E04
_02237DE2:
	movs r4, #4
	mvns r4, r4
	b _02237E04
_02237DE8:
	movs r4, #6
	mvns r4, r4
	b _02237E04
_02237DEE:
	movs r4, #6
	mvns r4, r4
	b _02237E04
_02237DF4:
	movs r4, #1
	mvns r4, r4
	b _02237E04
_02237DFA:
	movs r4, #1
	mvns r4, r4
	b _02237E04
_02237E00:
	movs r4, #4
	mvns r4, r4
_02237E04:
	movs r0, #4
	mvns r0, r0
	cmp r4, r0
	beq _02237E1C
	blx FUN_020AE420
	cmp r0, #9
	beq _02237E18
	movs r4, #5
	mvns r4, r4
_02237E18:
	blx FUN_021EC210
_02237E1C:
	adds r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov72_02237D88

	thumb_func_start ov72_02237E20
ov72_02237E20: @ 0x02237E20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02237E36
	cmp r0, #1
	bne _02237E34
	b _02237F4A
_02237E34:
	b _02237F60
_02237E36:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02237F68 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _02237F6C @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r2, #5
	movs r0, #3
	movs r1, #0x43
	lsls r2, r2, #0x10
	bl FUN_0201A910
	bl FUN_020915B0
	bl FUN_02091614
	movs r0, #0x43
	bl FUN_02039FD8
	ldr r1, _02237F70 @ =0x000013A4
	adds r0, r6, #0
	movs r2, #0x43
	bl FUN_02007280
	ldr r2, _02237F70 @ =0x000013A4
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x43
	bl FUN_0201AC88
	str r0, [r4, #4]
	ldr r0, _02237F74 @ =0x0223B92C
	add r2, sp, #0
	ldr r3, _02237F78 @ =0x0223B354
	str r4, [r0, #4]
	adds r7, r2, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	adds r0, r7, #0
	bl FUN_0201ACB0
	movs r0, #0xb
	movs r1, #0x20
	movs r2, #0x43
	bl FUN_0200BD18
	movs r1, #0xbd
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r2, _02237F7C @ =0x00000306
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x43
	bl FUN_0200BAF8
	ldr r1, _02237F80 @ =0x00000BD4
	ldr r2, _02237F84 @ =0x0000030A
	str r0, [r4, r1]
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x43
	bl FUN_0200BAF8
	ldr r1, _02237F88 @ =0x00000BD8
	str r0, [r4, r1]
	movs r2, #0x32
	movs r0, #0
	movs r1, #0x1b
	lsls r2, r2, #4
	movs r3, #0x43
	bl FUN_0200BAF8
	ldr r1, _02237F8C @ =0x00000BDC
	str r0, [r4, r1]
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov72_02238144
	adds r0, r4, #0
	bl ov72_022387D8
	movs r1, #0
	movs r0, #0x34
	adds r2, r1, #0
	bl FUN_02004EC4
	ldr r1, _02237F90 @ =0x00020020
	movs r0, #0x43
	bl FUN_0201AA8C
	str r0, [r4, #0x24]
	adds r0, #0x1f
	movs r1, #0x1f
	bics r0, r1
	movs r1, #2
	lsls r1, r1, #0x10
	movs r2, #0
	blx FUN_020B535C
	str r0, [r4, #0x28]
	ldr r1, _02237F94 @ =0x0000047D
	movs r0, #0xb
	movs r2, #1
	bl FUN_02004EC4
	movs r0, #1
	bl FUN_02002B8C
	ldr r2, _02237F98 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	str r0, [r5]
	b _02237F60
_02237F4A:
	bl FUN_02034D8C
	movs r0, #4
	movs r1, #0x43
	bl FUN_02002CEC
	movs r0, #0
	str r0, [r5]
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02237F60:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02237F68: .4byte 0xFFFFE0FF
_02237F6C: .4byte 0x04001000
_02237F70: .4byte 0x000013A4
_02237F74: .4byte 0x0223B92C
_02237F78: .4byte 0x0223B354
_02237F7C: .4byte 0x00000306
_02237F80: .4byte 0x00000BD4
_02237F84: .4byte 0x0000030A
_02237F88: .4byte 0x00000BD8
_02237F8C: .4byte 0x00000BDC
_02237F90: .4byte 0x00020020
_02237F94: .4byte 0x0000047D
_02237F98: .4byte 0x04000304
	thumb_func_end ov72_02237E20

	thumb_func_start ov72_02237F9C
ov72_02237F9C: @ 0x02237F9C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	bl FUN_02007290
	adds r5, r0, #0
	blx FUN_021ECB40
	bl ov72_022378DC
	blx FUN_021ECB40
	ldr r1, [r4]
	cmp r1, #5
	bhi _02238044
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02237FC4: @ jump table
	.2byte _02237FD0 - _02237FC4 - 2 @ case 0
	.2byte _02237FEC - _02237FC4 - 2 @ case 1
	.2byte _02238000 - _02237FC4 - 2 @ case 2
	.2byte _0223800E - _02237FC4 - 2 @ case 3
	.2byte _02238022 - _02237FC4 - 2 @ case 4
	.2byte _02238040 - _02237FC4 - 2 @ case 5
_02237FD0:
	bl FUN_02034DB8
	cmp r0, #0
	beq _02238044
	ldr r1, [r5, #0x28]
	ldr r0, _02238054 @ =0x0223B92C
	str r1, [r0]
	ldr r0, _02238058 @ =ov72_02238778
	ldr r1, _0223805C @ =ov72_022387A0
	blx FUN_021EC294
	movs r0, #1
	str r0, [r4]
	b _02238044
_02237FEC:
	ldr r3, [r5, #0x10]
	movs r2, #0xc
	adds r6, r3, #0
	muls r6, r2, r6
	ldr r2, _02238060 @ =0x0223B654
	adds r0, r5, #0
	ldr r2, [r2, r6]
	blx r2
	str r0, [r4]
	b _02238044
_02238000:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02238044
	movs r0, #3
	str r0, [r4]
	b _02238044
_0223800E:
	ldr r3, [r5, #0x10]
	movs r2, #0xc
	adds r6, r3, #0
	muls r6, r2, r6
	ldr r2, _02238064 @ =0x0223B658
	adds r0, r5, #0
	ldr r2, [r2, r6]
	blx r2
	str r0, [r4]
	b _02238044
_02238022:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02238044
	ldr r3, [r5, #0x10]
	movs r2, #0xc
	adds r6, r3, #0
	muls r6, r2, r6
	ldr r2, _02238068 @ =0x0223B65C
	ldr r1, [r4]
	ldr r2, [r2, r6]
	adds r0, r5, #0
	blx r2
	str r0, [r4]
	b _02238044
_02238040:
	movs r0, #1
	pop {r4, r5, r6, pc}
_02238044:
	ldr r0, _0223806C @ =0x00000BF8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02238050
	bl FUN_0202457C
_02238050:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02238054: .4byte 0x0223B92C
_02238058: .4byte ov72_02238778
_0223805C: .4byte ov72_022387A0
_02238060: .4byte 0x0223B654
_02238064: .4byte 0x0223B658
_02238068: .4byte 0x0223B65C
_0223806C: .4byte 0x00000BF8
	thumb_func_end ov72_02237F9C

	thumb_func_start ov72_02238070
ov72_02238070: @ 0x02238070
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #0
	bne _02238086
	movs r0, #0
	pop {r3, r4, r5, pc}
_02238086:
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #4
	bl FUN_02002DB4
	ldr r0, [r4, #0x24]
	bl FUN_0201AB0C
	bl FUN_02091624
	bl FUN_020915C0
	adds r0, r4, #0
	bl ov72_02238800
	ldr r0, _022380F0 @ =0x00000BDC
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	ldr r0, _022380F4 @ =0x00000BD8
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	ldr r0, _022380F8 @ =0x00000BD4
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	movs r0, #0xbd
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	adds r0, r4, #0
	bl ov72_02238160
	bl FUN_02034DE0
	ldr r0, [r4, #4]
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x43
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_022380F0: .4byte 0x00000BDC
_022380F4: .4byte 0x00000BD8
_022380F8: .4byte 0x00000BD4
	thumb_func_end ov72_02238070

	thumb_func_start ov72_022380FC
ov72_022380FC: @ 0x022380FC
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0202061C
	ldr r0, [r4, #4]
	bl FUN_0201EEB4
	bl FUN_0200B224
	ldr r3, _0223811C @ =0x027E0000
	ldr r1, _02238120 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_0223811C: .4byte 0x027E0000
_02238120: .4byte 0x00003FF8
	thumb_func_end ov72_022380FC

	thumb_func_start ov72_02238124
ov72_02238124: @ 0x02238124
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _02238140 @ =0x0223B37C
	add r3, sp, #0
	movs r2, #5
_0223812E:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0223812E
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_02238140: .4byte 0x0223B37C
	thumb_func_end ov72_02238124

	thumb_func_start ov72_02238144
ov72_02238144: @ 0x02238144
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl FUN_020072A4
	movs r1, #0
	str r0, [r4]
	adds r0, r4, #0
	adds r2, r1, #0
	str r1, [r4, #0x10]
	bl ov72_022387D0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov72_02238144

	thumb_func_start ov72_02238160
ov72_02238160: @ 0x02238160
	bx lr
	.align 2, 0
	thumb_func_end ov72_02238160

	thumb_func_start ov72_02238164
ov72_02238164: @ 0x02238164
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _02238190 @ =0x0223B344
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_020215A0
	movs r0, #0x14
	movs r1, #0x43
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_02238190: .4byte 0x0223B344
	thumb_func_end ov72_02238164

	thumb_func_start ov72_02238194
ov72_02238194: @ 0x02238194
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r0, #0xef
	movs r1, #0x43
	bl FUN_02007688
	str r0, [sp, #0x14]
	movs r0, #0xee
	movs r1, #0x43
	bl FUN_02007688
	adds r7, r0, #0
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x43
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	ldr r1, _022383AC @ =0x00000BFC
	movs r0, #0x14
	adds r1, r5, r1
	movs r2, #0x43
	bl FUN_02009F40
	ldr r1, _022383B0 @ =0x00000BF8
	movs r2, #1
	str r0, [r5, r1]
	adds r0, r1, #4
	adds r0, r5, r0
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r6, #0
	adds r4, r5, #0
_022381EC:
	movs r0, #3
	adds r1, r6, #0
	movs r2, #0x43
	bl FUN_0200A090
	ldr r1, _022383B4 @ =0x00000D24
	adds r6, r6, #1
	str r0, [r4, r1]
	adds r4, r4, #4
	cmp r6, #4
	blt _022381EC
	movs r3, #0
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x43
	str r0, [sp, #8]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	adds r1, r7, #0
	movs r2, #1
	bl FUN_0200A3C8
	ldr r1, _022383B8 @ =0x00000D34
	movs r2, #0
	str r0, [r5, r1]
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0x43
	subs r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	adds r3, r2, #0
	bl FUN_0200A480
	ldr r1, _022383BC @ =0x00000D38
	movs r3, #0
	str r0, [r5, r1]
	str r3, [sp]
	movs r2, #2
	str r2, [sp, #4]
	movs r0, #0x43
	subs r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	bl FUN_0200A540
	ldr r1, _022383C0 @ =0x00000D3C
	movs r3, #0
	str r0, [r5, r1]
	str r3, [sp]
	movs r2, #3
	str r2, [sp, #4]
	movs r0, #0x43
	subs r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	bl FUN_0200A540
	movs r1, #0x35
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x43
	subs r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r2, #5
	movs r3, #0
	bl FUN_0200A3C8
	ldr r1, _022383C4 @ =0x00000D44
	movs r2, #4
	str r0, [r5, r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0x43
	subs r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r3, #0
	bl FUN_0200A480
	ldr r1, _022383C8 @ =0x00000D48
	movs r2, #6
	str r0, [r5, r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x43
	subs r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r3, #0
	bl FUN_0200A540
	ldr r1, _022383CC @ =0x00000D4C
	movs r2, #7
	str r0, [r5, r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x43
	subs r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r7, #0
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0xd5
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x43
	subs r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x14]
	movs r2, #0xc
	movs r3, #0
	bl FUN_0200A3C8
	ldr r1, _022383D0 @ =0x00000D54
	movs r2, #0xb
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x43
	subs r1, #0x2c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x14]
	movs r3, #0
	bl FUN_0200A480
	ldr r1, _022383D4 @ =0x00000D58
	movs r2, #0xd
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x43
	subs r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x14]
	movs r3, #0
	bl FUN_0200A540
	ldr r1, _022383D8 @ =0x00000D5C
	movs r2, #0xe
	str r0, [r5, r1]
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x43
	subs r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x14]
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0xd6
	lsls r1, r1, #4
	str r0, [r5, r1]
	subs r1, #0x2c
	ldr r0, [r5, r1]
	bl FUN_0200ACF0
	ldr r0, _022383C4 @ =0x00000D44
	ldr r0, [r5, r0]
	bl FUN_0200ACF0
	ldr r0, _022383D0 @ =0x00000D54
	ldr r0, [r5, r0]
	bl FUN_0200ACF0
	ldr r0, _022383BC @ =0x00000D38
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	ldr r0, _022383C8 @ =0x00000D48
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	ldr r0, _022383D4 @ =0x00000D58
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	adds r0, r7, #0
	bl FUN_0200770C
	ldr r0, [sp, #0x14]
	bl FUN_0200770C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022383AC: .4byte 0x00000BFC
_022383B0: .4byte 0x00000BF8
_022383B4: .4byte 0x00000D24
_022383B8: .4byte 0x00000D34
_022383BC: .4byte 0x00000D38
_022383C0: .4byte 0x00000D3C
_022383C4: .4byte 0x00000D44
_022383C8: .4byte 0x00000D48
_022383CC: .4byte 0x00000D4C
_022383D0: .4byte 0x00000D54
_022383D4: .4byte 0x00000D58
_022383D8: .4byte 0x00000D5C
	thumb_func_end ov72_02238194

	thumb_func_start ov72_022383DC
ov72_022383DC: @ 0x022383DC
	push {r3, r4}
	ldr r4, _02238404 @ =0x00000BF8
	ldr r1, [r1, r4]
	str r1, [r0]
	str r2, [r0, #4]
	movs r2, #0
	movs r1, #1
	str r2, [r0, #0x10]
	lsls r1, r1, #0xc
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	strh r2, [r0, #0x20]
	movs r1, #1
	str r1, [r0, #0x24]
	str r3, [r0, #0x28]
	movs r1, #0x43
	str r1, [r0, #0x2c]
	pop {r3, r4}
	bx lr
	.align 2, 0
_02238404: .4byte 0x00000BF8
	thumb_func_end ov72_022383DC

	thumb_func_start ov72_02238408
ov72_02238408: @ 0x02238408
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	subs r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, _02238638 @ =0x00000D24
	str r1, [sp, #0x10]
	ldr r0, [r6, r2]
	adds r3, r1, #0
	str r0, [sp, #0x14]
	adds r0, r2, #4
	ldr r0, [r6, r0]
	str r0, [sp, #0x18]
	adds r0, r2, #0
	adds r0, #8
	ldr r0, [r6, r0]
	str r0, [sp, #0x1c]
	adds r0, r2, #0
	adds r0, #0xc
	ldr r0, [r6, r0]
	adds r2, #0x40
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	adds r0, r6, r2
	adds r2, r1, #0
	str r1, [sp, #0x28]
	bl FUN_02009D48
	movs r1, #1
	str r1, [sp]
	subs r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r3, _02238638 @ =0x00000D24
	str r0, [sp, #0x10]
	ldr r2, [r6, r3]
	str r2, [sp, #0x14]
	adds r2, r3, #4
	ldr r2, [r6, r2]
	str r2, [sp, #0x18]
	adds r2, r3, #0
	adds r2, #8
	ldr r2, [r6, r2]
	str r2, [sp, #0x1c]
	adds r2, r3, #0
	adds r2, #0xc
	ldr r2, [r6, r2]
	adds r3, #0x64
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r6, r3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02009D48
	movs r1, #2
	str r1, [sp]
	subs r0, r1, #3
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r3, _02238638 @ =0x00000D24
	str r0, [sp, #0x10]
	ldr r2, [r6, r3]
	str r2, [sp, #0x14]
	adds r2, r3, #4
	ldr r2, [r6, r2]
	str r2, [sp, #0x18]
	adds r2, r3, #0
	adds r2, #8
	ldr r2, [r6, r2]
	str r2, [sp, #0x1c]
	adds r2, r3, #0
	adds r2, #0xc
	ldr r2, [r6, r2]
	adds r3, #0x88
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r6, r3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02009D48
	ldr r2, _0223863C @ =0x00000D64
	add r0, sp, #0x2c
	adds r1, r6, #0
	adds r2, r6, r2
	movs r3, #2
	bl ov72_022383DC
	ldr r4, _02238640 @ =0x0223B364
	movs r7, #0
	adds r5, r6, #0
_022384D4:
	ldrh r0, [r4]
	lsls r0, r0, #0xc
	str r0, [sp, #0x34]
	ldrh r0, [r4, #2]
	lsls r1, r0, #0xc
	movs r0, #1
	lsls r0, r0, #0x14
	adds r0, r1, r0
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl FUN_02024624
	ldr r1, _02238644 @ =0x00000DF4
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, _02238644 @ =0x00000DF4
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_020248F0
	ldr r0, _02238644 @ =0x00000DF4
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #3
	blt _022384D4
	ldr r2, _02238648 @ =0x00000D88
	add r0, sp, #0x2c
	adds r1, r6, #0
	adds r2, r6, r2
	movs r3, #2
	bl ov72_022383DC
	movs r0, #2
	lsls r0, r0, #0x10
	str r0, [sp, #0x34]
	ldr r0, _0223864C @ =0x00151000
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl FUN_02024624
	movs r1, #0xe
	lsls r1, r1, #8
	str r0, [r6, r1]
	ldr r0, [r6, r1]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0xe
	lsls r0, r0, #8
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_020248F0
	movs r0, #0xe
	lsls r0, r0, #8
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #6
	lsls r0, r0, #0x10
	str r0, [sp, #0x34]
	ldr r0, _02238650 @ =0x00129000
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl FUN_02024624
	ldr r1, _02238654 @ =0x00000E04
	str r0, [r6, r1]
	ldr r0, [r6, r1]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, _02238654 @ =0x00000E04
	movs r1, #0
	ldr r0, [r6, r0]
	bl FUN_020248F0
	ldr r0, _02238654 @ =0x00000E04
	movs r1, #0
	ldr r0, [r6, r0]
	bl FUN_02024830
	ldr r4, _02238658 @ =0x0223B338
	movs r7, #0
	adds r5, r6, #0
_02238592:
	ldrh r0, [r4]
	lsls r0, r0, #0xc
	str r0, [sp, #0x34]
	ldrh r0, [r4, #2]
	lsls r1, r0, #0xc
	movs r0, #1
	lsls r0, r0, #0x14
	adds r0, r1, r0
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl FUN_02024624
	ldr r1, _0223865C @ =0x00000E08
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, _0223865C @ =0x00000E08
	movs r1, #3
	ldr r0, [r5, r0]
	bl FUN_020248F0
	ldr r0, _0223865C @ =0x00000E08
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_02024A04
	ldr r0, _0223865C @ =0x00000E08
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #3
	blt _02238592
	ldr r2, _02238660 @ =0x00000DAC
	add r0, sp, #0x2c
	adds r1, r6, #0
	adds r2, r6, r2
	movs r3, #2
	bl ov72_022383DC
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [sp, #0x34]
	ldr r0, _0223864C @ =0x00151000
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl FUN_02024624
	ldr r1, _02238664 @ =0x00000E14
	str r0, [r6, r1]
	ldr r0, [r6, r1]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, _02238664 @ =0x00000E14
	movs r1, #1
	ldr r0, [r6, r0]
	bl FUN_020248F0
	ldr r0, _02238664 @ =0x00000E14
	movs r1, #0
	ldr r0, [r6, r0]
	bl FUN_02024830
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	bl FUN_0203A880
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_02238638: .4byte 0x00000D24
_0223863C: .4byte 0x00000D64
_02238640: .4byte 0x0223B364
_02238644: .4byte 0x00000DF4
_02238648: .4byte 0x00000D88
_0223864C: .4byte 0x00151000
_02238650: .4byte 0x00129000
_02238654: .4byte 0x00000E04
_02238658: .4byte 0x0223B338
_0223865C: .4byte 0x00000E08
_02238660: .4byte 0x00000DAC
_02238664: .4byte 0x00000E14
	thumb_func_end ov72_02238408

	thumb_func_start ov72_02238668
ov72_02238668: @ 0x02238668
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_020168F4
	adds r4, r0, #0
	beq _0223867A
	adds r0, r5, #0
	bl FUN_02016624
_0223867A:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov72_02238668

	thumb_func_start ov72_02238680
ov72_02238680: @ 0x02238680
	str r1, [r0, #0x1c]
	str r2, [r0, #0x20]
	bx lr
	.align 2, 0
	thumb_func_end ov72_02238680

	thumb_func_start ov72_02238688
ov72_02238688: @ 0x02238688
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	ble _022386A6
	lsls r0, r1, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022386B4
_022386A6:
	lsls r0, r1, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022386B4:
	blx FUN_020F2104
	str r0, [sp]
	cmp r5, #0
	ble _022386D0
	lsls r0, r5, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022386DE
_022386D0:
	lsls r0, r5, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022386DE:
	blx FUN_020F2104
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov72_02238688

	thumb_func_start ov72_022386F4
ov72_022386F4: @ 0x022386F4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, _02238728 @ =0x0223B3A4
	lsls r3, r4, #2
	ldr r2, _0223872C @ =0x0223B3A6
	ldrh r1, [r1, r3]
	ldrh r3, [r2, r3]
	movs r2, #1
	lsls r2, r2, #8
	adds r2, r3, r2
	adds r5, r0, #0
	bl ov72_02238688
	cmp r4, #0xa
	bge _0223871C
	adds r0, r5, #0
	movs r1, #1
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
_0223871C:
	adds r0, r5, #0
	movs r1, #2
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
	nop
_02238728: .4byte 0x0223B3A4
_0223872C: .4byte 0x0223B3A6
	thumb_func_end ov72_022386F4

	thumb_func_start ov72_02238730
ov72_02238730: @ 0x02238730
	push {r4, lr}
	adds r4, r2, #0
	movs r3, #0xc
	muls r4, r3, r4
	ldr r3, _02238748 @ =0x0223B364
	lsls r2, r1, #2
	adds r1, r3, r4
	ldrh r1, [r2, r1]
	ldr r2, _0223874C @ =0x00000129
	bl ov72_02238688
	pop {r4, pc}
	.align 2, 0
_02238748: .4byte 0x0223B364
_0223874C: .4byte 0x00000129
	thumb_func_end ov72_02238730

	thumb_func_start ov72_02238750
ov72_02238750: @ 0x02238750
	push {r3, r4, r5, lr}
	adds r3, r2, #0
	movs r5, #0xc
	lsls r4, r1, #2
	muls r3, r5, r3
	ldr r2, _02238770 @ =0x0223B366
	ldr r1, _02238774 @ =0x0223B364
	adds r2, r2, r3
	adds r1, r1, r3
	ldrh r2, [r4, r2]
	adds r5, #0xf4
	ldrh r1, [r4, r1]
	adds r2, r2, r5
	bl ov72_02238688
	pop {r3, r4, r5, pc}
	.align 2, 0
_02238770: .4byte 0x0223B366
_02238774: .4byte 0x0223B364
	thumb_func_end ov72_02238750

	thumb_func_start ov72_02238778
ov72_02238778: @ 0x02238778
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	blx FUN_020D3A38
	adds r6, r0, #0
	ldr r0, _0223879C @ =0x0223B92C
	adds r1, r5, #0
	ldr r0, [r0]
	adds r2, r4, #0
	blx FUN_020B53A0
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020D3A4C
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223879C: .4byte 0x0223B92C
	thumb_func_end ov72_02238778

	thumb_func_start ov72_022387A0
ov72_022387A0: @ 0x022387A0
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	beq _022387BC
	blx FUN_020D3A38
	adds r4, r0, #0
	ldr r0, _022387C0 @ =0x0223B92C
	adds r1, r5, #0
	ldr r0, [r0]
	blx FUN_020B5530
	adds r0, r4, #0
	blx FUN_020D3A4C
_022387BC:
	pop {r3, r4, r5, pc}
	nop
_022387C0: .4byte 0x0223B92C
	thumb_func_end ov72_022387A0

	thumb_func_start ov72_022387C4
ov72_022387C4: @ 0x022387C4
	push {r3, lr}
	blx FUN_021EC9D4
	movs r1, #3
	subs r0, r1, r0
	pop {r3, pc}
	thumb_func_end ov72_022387C4

	thumb_func_start ov72_022387D0
ov72_022387D0: @ 0x022387D0
	str r1, [r0, #0x14]
	str r2, [r0, #0x18]
	bx lr
	.align 2, 0
	thumb_func_end ov72_022387D0

	thumb_func_start ov72_022387D8
ov72_022387D8: @ 0x022387D8
	push {r4, lr}
	adds r4, r0, #0
	bl ov72_02238124
	bl ov72_02238164
	adds r0, r4, #0
	bl ov72_02238194
	adds r0, r4, #0
	bl ov72_02238408
	ldr r0, _022387FC @ =ov72_022380FC
	adds r1, r4, #0
	bl FUN_0201A0FC
	pop {r4, pc}
	nop
_022387FC: .4byte ov72_022380FC
	thumb_func_end ov72_022387D8

	thumb_func_start ov72_02238800
ov72_02238800: @ 0x02238800
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _02238854 @ =0x00000D34
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	ldr r0, _02238858 @ =0x00000D44
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	ldr r0, _0223885C @ =0x00000D38
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	ldr r0, _02238860 @ =0x00000D48
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	ldr r7, _02238864 @ =0x00000D24
	movs r4, #0
	adds r5, r6, #0
_0223882A:
	ldr r0, [r5, r7]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0223882A
	ldr r0, _02238868 @ =0x00000BF8
	ldr r0, [r6, r0]
	bl FUN_02024504
	ldr r0, _02238868 @ =0x00000BF8
	movs r1, #0
	str r1, [r6, r0]
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02238854: .4byte 0x00000D34
_02238858: .4byte 0x00000D44
_0223885C: .4byte 0x00000D38
_02238860: .4byte 0x00000D48
_02238864: .4byte 0x00000D24
_02238868: .4byte 0x00000BF8
	thumb_func_end ov72_02238800

	thumb_func_start ov72_0223886C
ov72_0223886C: @ 0x0223886C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov72_02239040
	movs r0, #8
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x43
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4, #4]
	bl ov72_022389C8
	adds r0, r4, #0
	bl ov72_02238BEC
	adds r0, r4, #0
	bl ov72_02238EE4
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, [r4]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_0202D488
	adds r1, r4, #0
	adds r1, #0x90
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r1, [r0]
	adds r0, r4, #0
	adds r0, #0x94
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x9c
	str r1, [r0]
	ldr r0, _02238940 @ =0x00000F4C
	movs r1, #0
	str r1, [r4, r0]
	blx FUN_021EC5B4
	cmp r0, #0
	bne _0223892E
	ldr r1, [r4]
	ldr r0, [r1, #0x24]
	cmp r0, #0
	beq _02238922
	ldr r0, [r1, #0xc]
	bl FUN_02039418
	ldr r0, _02238944 @ =0x00000F0F
	movs r2, #1
	str r0, [sp]
	ldr r1, _02238948 @ =0x00000BD8
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r3, r2, #0
	bl ov72_0223A350
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #2
	bl ov72_02238680
	adds r0, r4, #0
	bl ov72_0223A420
	b _0223893A
_02238922:
	movs r0, #4
	bl FUN_0201A4CC
	movs r0, #0
	str r0, [r4, #0x1c]
	b _0223893A
_0223892E:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl FUN_02039418
	movs r0, #0x33
	str r0, [r4, #0x1c]
_0223893A:
	movs r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_02238940: .4byte 0x00000F4C
_02238944: .4byte 0x00000F0F
_02238948: .4byte 0x00000BD8
	thumb_func_end ov72_0223886C

	thumb_func_start ov72_0223894C
ov72_0223894C: @ 0x0223894C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov72_022387C4
	bl FUN_0203A930
	ldr r4, [r5, #0x1c]
	ldr r1, _02238978 @ =0x0223B660
	lsls r2, r4, #2
	ldr r1, [r1, r2]
	adds r0, r5, #0
	blx r1
	ldr r1, [r5, #0x1c]
	cmp r4, r1
	beq _02238976
	movs r1, #0xfd
	movs r2, #0
	lsls r1, r1, #4
	strh r2, [r5, r1]
	adds r1, r1, #2
	strh r2, [r5, r1]
_02238976:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02238978: .4byte 0x0223B660
	thumb_func_end ov72_0223894C

	thumb_func_start ov72_0223897C
ov72_0223897C: @ 0x0223897C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _022389C0 @ =0x00000FD8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02238996
	bl FUN_0200E390
	ldr r0, _022389C0 @ =0x00000FD8
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
_02238996:
	adds r0, r4, #0
	bl ov72_02239098
	adds r0, r4, #0
	bl ov72_02238FFC
	ldr r0, [r4, #4]
	bl ov72_02238AEC
	ldr r0, _022389C4 @ =0x00000FDC
	movs r1, #0
	str r1, [r4, r0]
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x10]
	cmp r0, #0
	bne _022389BA
	movs r0, #5
	pop {r4, pc}
_022389BA:
	movs r0, #1
	pop {r4, pc}
	nop
_022389C0: .4byte 0x00000FD8
_022389C4: .4byte 0x00000FDC
	thumb_func_end ov72_0223897C

	thumb_func_start ov72_022389C8
ov72_022389C8: @ 0x022389C8
	push {r4, r5, lr}
	sub sp, #0x8c
	ldr r5, _02238AD8 @ =0x0223B42C
	adds r4, r0, #0
	ldm r5!, {r0, r1}
	add r3, sp, #0x70
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
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _02238ADC @ =0x0223B410
	add r3, sp, #0x54
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
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	ldr r5, _02238AE0 @ =0x0223B448
	add r3, sp, #0x38
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
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _02238AE4 @ =0x0223B3D8
	add r3, sp, #0x1c
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
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	ldr r5, _02238AE8 @ =0x0223B3F4
	add r3, sp, #0
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
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201CAE0
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x43
	bl FUN_0201C1C4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x43
	bl FUN_0201C1C4
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x43
	bl FUN_0201C1C4
	add sp, #0x8c
	pop {r4, r5, pc}
	nop
_02238AD8: .4byte 0x0223B42C
_02238ADC: .4byte 0x0223B410
_02238AE0: .4byte 0x0223B448
_02238AE4: .4byte 0x0223B3D8
_02238AE8: .4byte 0x0223B3F4
	thumb_func_end ov72_022389C8

	thumb_func_start ov72_02238AEC
ov72_02238AEC: @ 0x02238AEC
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
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201BB4C
	pop {r4, pc}
	thumb_func_end ov72_02238AEC

	thumb_func_start ov72_02238B18
ov72_02238B18: @ 0x02238B18
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r4, [r5, #4]
	cmp r1, #0
	bne _02238B86
	movs r0, #0x58
	movs r1, #0x43
	bl FUN_02007688
	movs r1, #1
	lsls r1, r1, #8
	str r1, [sp]
	movs r1, #0x43
	str r1, [sp, #4]
	movs r1, #3
	movs r2, #4
	movs r3, #0
	adds r6, r0, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x43
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #0xb
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007B44
	movs r1, #0
	movs r0, #6
	str r1, [sp]
	lsls r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x43
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #0xc
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007B68
	ldr r0, _02238BE8 @ =0x00001304
	movs r1, #0
	str r1, [r5, r0]
	adds r0, r6, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_02238B86:
	movs r0, #0xee
	movs r1, #0x43
	bl FUN_02007688
	ldr r1, _02238BE8 @ =0x00001304
	movs r2, #1
	str r2, [r5, r1]
	movs r1, #0x40
	str r1, [sp]
	movs r1, #0x43
	str r1, [sp, #4]
	movs r1, #8
	movs r2, #4
	movs r3, #0
	adds r6, r0, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x43
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #9
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007B44
	movs r1, #0
	movs r0, #6
	str r1, [sp]
	lsls r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x43
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #0xa
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007B68
	adds r0, r6, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02238BE8: .4byte 0x00001304
	thumb_func_end ov72_02238B18

	thumb_func_start ov72_02238BEC
ov72_02238BEC: @ 0x02238BEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	ldr r4, [r0, #4]
	movs r0, #0x58
	movs r1, #0x43
	bl FUN_02007688
	movs r2, #0
	str r2, [sp]
	movs r1, #0x43
	str r1, [sp, #4]
	movs r1, #3
	adds r3, r2, #0
	str r0, [sp, #0x2c]
	bl FUN_02007B8C
	movs r3, #0
	str r3, [sp]
	movs r0, #0x43
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	movs r1, #3
	movs r2, #4
	bl FUN_02007B8C
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x43
	bl FUN_0200304C
	movs r1, #0x1a
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #0x43
	bl FUN_0200304C
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x43
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E644
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x43
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	movs r0, #0x43
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E3DC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x43
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	movs r1, #2
	adds r2, r4, #0
	movs r3, #1
	bl FUN_02007B44
	movs r1, #0
	movs r0, #6
	str r1, [sp]
	lsls r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x43
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	movs r1, #6
	adds r2, r4, #0
	movs r3, #1
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x43
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	movs r1, #0xb
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007B44
	movs r1, #0
	movs r0, #6
	str r1, [sp]
	lsls r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x43
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	movs r1, #0xc
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007B68
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201C2D8
	movs r0, #4
	movs r1, #0
	bl FUN_0201C2D8
	movs r2, #0x33
	ldr r1, _02238E28 @ =0x00000FD8
	ldr r0, [sp, #0x10]
	lsls r2, r2, #4
	adds r0, r0, r1
	movs r1, #0
	blx FUN_020D4994
	ldr r0, [sp, #0x2c]
	movs r1, #5
	add r2, sp, #0x38
	movs r3, #0x43
	bl FUN_02007C48
	adds r4, r0, #0
	ldr r0, [sp, #0x38]
	movs r2, #0xfe
	ldr r1, [sp, #0x10]
	lsls r2, r2, #4
	adds r1, r1, r2
	ldr r0, [r0, #0xc]
	movs r2, #0x80
	blx FUN_020D47B8
	ldr r0, [sp, #0x38]
	ldr r2, _02238E2C @ =0x00001060
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #0xc]
	adds r1, r1, r2
	movs r2, #0x80
	blx FUN_020D47B8
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r1, _02238E2C @ =0x00001060
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	subs r1, #0x80
	adds r0, r0, r1
	str r0, [sp, #0x14]
_02238D5E:
	movs r0, #0
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	adds r0, r0, #1
	lsls r1, r0, #5
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	str r0, [sp, #0x30]
_02238D70:
	ldr r0, [sp, #0x24]
	cmp r0, #0x15
	blt _02238D7A
	bl GF_AssertFail
_02238D7A:
	ldr r0, [sp, #0x30]
	movs r7, #1
	adds r4, r0, #2
	ldr r0, [sp, #0x18]
	adds r6, r0, #2
	ldr r0, [sp, #0x14]
	adds r5, r0, #2
	ldr r0, [sp, #0x20]
	asrs r0, r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x34]
_02238D92:
	movs r0, #0xfe
	lsls r0, r0, #4
	ldrh r0, [r4, r0]
	ldr r3, [sp, #0x34]
	adds r1, r6, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #1
	bl FUN_02003DE8
	adds r7, r7, #1
	adds r4, r4, #2
	adds r6, r6, #2
	adds r5, r5, #2
	cmp r7, #0x10
	blt _02238D92
	ldr r0, [sp, #0x18]
	adds r0, #0x20
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	adds r0, r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	beq _02238DDE
	movs r0, #3
	ldr r1, [sp, #0x20]
	lsls r0, r0, #8
	adds r1, r1, r0
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [sp, #0x20]
	cmp r1, r0
	blt _02238D70
	str r0, [sp, #0x20]
	movs r0, #1
	str r0, [sp, #0x1c]
	b _02238D70
_02238DDE:
	ldr r0, [sp, #0x14]
	adds r0, #0x20
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	adds r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _02238D5E
	ldr r1, _02238E2C @ =0x00001060
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	movs r1, #0x2a
	lsls r1, r1, #4
	blx DC_FlushRange
	ldr r1, _02238E30 @ =0x00000FDC
	ldr r0, [sp, #0x10]
	movs r2, #1
	str r2, [r0, r1]
	ldr r2, _02238E34 @ =0x00001304
	movs r3, #0
	str r3, [r0, r2]
	subs r2, r1, #4
	ldr r1, [sp, #0x10]
	ldr r0, _02238E38 @ =ov72_02238E3C
	adds r1, r1, r2
	movs r2, #0x14
	bl FUN_0200E33C
	ldr r2, _02238E28 @ =0x00000FD8
	ldr r1, [sp, #0x10]
	str r0, [r1, r2]
	ldr r0, [sp, #0x2c]
	bl FUN_0200770C
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02238E28: .4byte 0x00000FD8
_02238E2C: .4byte 0x00001060
_02238E30: .4byte 0x00000FDC
_02238E34: .4byte 0x00001304
_02238E38: .4byte ov72_02238E3C
	thumb_func_end ov72_02238BEC

	thumb_func_start ov72_02238E3C
ov72_02238E3C: @ 0x02238E3C
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02238EDA
	ldr r1, _02238EDC @ =0x0000032B
	movs r0, #1
	ldrb r2, [r4, r1]
	eors r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	tst r0, r2
	bne _02238EDA
	adds r0, r1, #1
	ldr r0, [r4, r0]
	cmp r0, #1
	bhi _02238E72
	subs r0, r1, #3
	ldrsh r0, [r4, r0]
	adds r2, r4, #0
	adds r2, #0x88
	lsls r0, r0, #5
	adds r0, r2, r0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020CFC6C
_02238E72:
	movs r0, #0xcb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02238E80
	cmp r0, #2
	bne _02238E96
_02238E80:
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
_02238E96:
	ldr r0, _02238EE0 @ =0x0000032A
	ldrsb r1, [r4, r0]
	cmp r1, #0
	bne _02238EBE
	subs r1, r0, #2
	ldrsh r1, [r4, r1]
	adds r2, r1, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0x15
	blt _02238EDA
	movs r2, #0x13
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r2, [r4, r0]
	movs r1, #1
	eors r1, r2
	strb r1, [r4, r0]
	pop {r4, pc}
_02238EBE:
	subs r1, r0, #2
	ldrsh r1, [r4, r1]
	subs r2, r1, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bge _02238EDA
	movs r2, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r1, [r4, r0]
	eors r1, r2
	strb r1, [r4, r0]
_02238EDA:
	pop {r4, pc}
	.align 2, 0
_02238EDC: .4byte 0x0000032B
_02238EE0: .4byte 0x0000032A
	thumb_func_end ov72_02238E3C

	thumb_func_start ov72_02238EE4
ov72_02238EE4: @ 0x02238EE4
	push {r3, r4, lr}
	sub sp, #0x14
	movs r3, #4
	adds r4, r0, #0
	str r3, [sp]
	movs r0, #0x17
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0xa4
	ldr r1, _02238FE0 @ =0x00000E58
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #0
	bl FUN_0201D40C
	ldr r0, _02238FE0 @ =0x00000E58
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0201D978
	movs r0, #0xe
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x94
	ldr r1, _02238FE4 @ =0x00000E38
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #0
	movs r3, #0x1a
	bl FUN_0201D40C
	ldr r0, _02238FE4 @ =0x00000E38
	movs r1, #0xf
	adds r0, r4, r0
	bl FUN_0201D978
	movs r0, #0xe
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x9c
	ldr r1, _02238FE8 @ =0x00000E28
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #0
	movs r3, #0x1a
	bl FUN_0201D40C
	ldr r0, _02238FE8 @ =0x00000E28
	movs r1, #0xf
	adds r0, r4, r0
	bl FUN_0201D978
	movs r0, #1
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x85
	lsls r0, r0, #2
	ldr r1, _02238FEC @ =0x00000E48
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #0
	movs r3, #4
	bl FUN_0201D40C
	ldr r0, _02238FEC @ =0x00000E48
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0201D978
	movs r3, #1
	ldr r0, _02238FF0 @ =0x000F0E00
	str r3, [sp]
	str r0, [sp, #4]
	ldr r1, _02238FF4 @ =0x00000BE4
	ldr r0, _02238FEC @ =0x00000E48
	ldr r1, [r4, r1]
	adds r0, r4, r0
	movs r2, #0
	bl ov72_0223A3E0
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x28
	ldr r1, _02238FF8 @ =0x00000E18
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	ldr r0, _02238FF8 @ =0x00000E18
	movs r1, #0xf
	adds r0, r4, r0
	bl FUN_0201D978
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_02238FE0: .4byte 0x00000E58
_02238FE4: .4byte 0x00000E38
_02238FE8: .4byte 0x00000E28
_02238FEC: .4byte 0x00000E48
_02238FF0: .4byte 0x000F0E00
_02238FF4: .4byte 0x00000BE4
_02238FF8: .4byte 0x00000E18
	thumb_func_end ov72_02238EE4

	thumb_func_start ov72_02238FFC
ov72_02238FFC: @ 0x02238FFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223902C @ =0x00000E18
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _02239030 @ =0x00000E48
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _02239034 @ =0x00000E28
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _02239038 @ =0x00000E38
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _0223903C @ =0x00000E58
	adds r0, r4, r0
	bl FUN_0201D520
	pop {r4, pc}
	nop
_0223902C: .4byte 0x00000E18
_02239030: .4byte 0x00000E48
_02239034: .4byte 0x00000E28
_02239038: .4byte 0x00000E38
_0223903C: .4byte 0x00000E58
	thumb_func_end ov72_02238FFC

	thumb_func_start ov72_02239040
ov72_02239040: @ 0x02239040
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xb4
	movs r1, #0x43
	bl FUN_02026354
	movs r1, #0xbe
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #4
	movs r1, #0x43
	bl FUN_02026354
	ldr r1, _0223908C @ =0x00000BE8
	str r0, [r4, r1]
	movs r0, #3
	movs r1, #0x43
	bl FUN_02026354
	ldr r1, _02239090 @ =0x00000BEC
	str r0, [r4, r1]
	subs r1, #0x18
	ldr r0, [r4, r1]
	movs r1, #0xc
	bl FUN_0200BBA0
	ldr r1, _02239094 @ =0x00000BE4
	str r0, [r4, r1]
	movs r0, #1
	lsls r0, r0, #8
	movs r1, #0x43
	bl FUN_02026354
	movs r1, #0xbf
	lsls r1, r1, #4
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_0223908C: .4byte 0x00000BE8
_02239090: .4byte 0x00000BEC
_02239094: .4byte 0x00000BE4
	thumb_func_end ov72_02239040

	thumb_func_start ov72_02239098
ov72_02239098: @ 0x02239098
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02026380
	ldr r0, _022390CC @ =0x00000BE4
	ldr r0, [r4, r0]
	bl FUN_02026380
	ldr r0, _022390D0 @ =0x00000BEC
	ldr r0, [r4, r0]
	bl FUN_02026380
	ldr r0, _022390D4 @ =0x00000BE8
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0xbe
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02026380
	pop {r4, pc}
	nop
_022390CC: .4byte 0x00000BE4
_022390D0: .4byte 0x00000BEC
_022390D4: .4byte 0x00000BE8
	thumb_func_end ov72_02239098

	thumb_func_start ov72_022390D8
ov72_022390D8: @ 0x022390D8
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239100 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _02239104 @ =0x00000BDC
	movs r2, #0x11
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A350
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #1
	bl ov72_02238680
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239100: .4byte 0x00000F0F
_02239104: .4byte 0x00000BDC
	thumb_func_end ov72_022390D8

	thumb_func_start ov72_02239108
ov72_02239108: @ 0x02239108
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0223915C @ =0x0000136C
	adds r0, r4, r0
	bl ov72_0223AF48
	cmp r0, #0
	beq _02239154
	cmp r0, #2
	bne _02239132
	bl FUN_0203946C
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov72_022387D0
	movs r0, #0x2e
	str r0, [r4, #0x1c]
	b _02239154
_02239132:
	ldr r0, _02239160 @ =0x00000F0F
	ldr r1, _02239164 @ =0x00000BD8
	str r0, [sp]
	movs r2, #1
	ldr r1, [r4, r1]
	adds r0, r4, #0
	adds r3, r2, #0
	bl ov72_0223A350
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #2
	bl ov72_02238680
	adds r0, r4, #0
	bl ov72_0223A420
_02239154:
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223915C: .4byte 0x0000136C
_02239160: .4byte 0x00000F0F
_02239164: .4byte 0x00000BD8
	thumb_func_end ov72_02239108

	thumb_func_start ov72_02239168
ov72_02239168: @ 0x02239168
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239190 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _02239194 @ =0x00000BD8
	movs r2, #0xc
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A350
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #0x34
	bl ov72_02238680
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239190: .4byte 0x00000F0F
_02239194: .4byte 0x00000BD8
	thumb_func_end ov72_02239168

	thumb_func_start ov72_02239198
ov72_02239198: @ 0x02239198
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _022391E4 @ =0x0000136C
	adds r0, r4, r0
	bl ov72_0223AF48
	cmp r0, #0
	beq _022391E0
	cmp r0, #2
	bne _022391C0
	blx FUN_021EC5B4
	cmp r0, #0
	bne _022391BA
	movs r0, #0
	str r0, [r4, #0x1c]
	b _022391E0
_022391BA:
	movs r0, #0x29
	str r0, [r4, #0x1c]
	b _022391E0
_022391C0:
	blx FUN_021EC5B4
	cmp r0, #0
	bne _022391D6
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov72_022387D0
	movs r0, #0x2e
	b _022391D8
_022391D6:
	movs r0, #0x29
_022391D8:
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	movs r1, #1
	str r1, [r0, #0x20]
_022391E0:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_022391E4: .4byte 0x0000136C
	thumb_func_end ov72_02239198

	thumb_func_start ov72_022391E8
ov72_022391E8: @ 0x022391E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl FUN_02039418
	movs r0, #4
	bl FUN_0201A4BC
	adds r0, r4, #0
	bl ov72_0223A414
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #2
	movs r2, #1
	movs r3, #0x14
	blx FUN_021EC3F0
	movs r0, #2
	blx FUN_021EC454
	blx FUN_021EC4A4
	movs r0, #3
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov72_022391E8

	thumb_func_start ov72_02239220
ov72_02239220: @ 0x02239220
	push {r3, r4, lr}
	sub sp, #0x44
	adds r4, r0, #0
	blx FUN_021EC60C
	blx FUN_021EC5B4
	cmp r0, #0
	beq _022392A0
	blx FUN_021EC724
	cmp r0, #8
	bhi _0223927E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02239246: @ jump table
	.2byte _0223927E - _02239246 - 2 @ case 0
	.2byte _0223927E - _02239246 - 2 @ case 1
	.2byte _0223927E - _02239246 - 2 @ case 2
	.2byte _0223927E - _02239246 - 2 @ case 3
	.2byte _02239296 - _02239246 - 2 @ case 4
	.2byte _0223927E - _02239246 - 2 @ case 5
	.2byte _0223927E - _02239246 - 2 @ case 6
	.2byte _02239258 - _02239246 - 2 @ case 7
	.2byte _0223927E - _02239246 - 2 @ case 8
_02239258:
	add r0, sp, #4
	blx FUN_021EC0FC
	movs r1, #0xf5
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r2, [sp, #4]
	adds r0, r1, #4
	str r2, [r4, r0]
	blx FUN_021EC210
	blx FUN_021EC8D8
	adds r0, r4, #0
	bl ov72_0223A444
	movs r0, #0x37
	str r0, [r4, #0x1c]
	b _022392A0
_0223927E:
	add r0, sp, #0
	blx FUN_021EC0FC
	adds r0, r4, #0
	bl ov72_0223A444
	movs r1, #0x35
	str r1, [r4, #0x1c]
	ldr r0, _022392A8 @ =0x00000F5C
	subs r1, #0x37
	str r1, [r4, r0]
	b _022392A0
_02239296:
	add r0, sp, #8
	blx FUN_021EC9E0
	movs r0, #4
	str r0, [r4, #0x1c]
_022392A0:
	movs r0, #3
	add sp, #0x44
	pop {r3, r4, pc}
	nop
_022392A8: .4byte 0x00000F5C
	thumb_func_end ov72_02239220

	thumb_func_start ov72_022392AC
ov72_022392AC: @ 0x022392AC
	push {r4, lr}
	adds r4, r0, #0
	blx FUN_021ECD04
	movs r0, #5
	str r0, [r4, #0x1c]
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov72_022392AC

	thumb_func_start ov72_022392BC
ov72_022392BC: @ 0x022392BC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	blx FUN_021ECDC8
	cmp r0, #5
	bhi _02239362
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022392D6: @ jump table
	.2byte _022392E8 - _022392D6 - 2 @ case 0
	.2byte _02239362 - _022392D6 - 2 @ case 1
	.2byte _02239362 - _022392D6 - 2 @ case 2
	.2byte _022392E2 - _022392D6 - 2 @ case 3
	.2byte _022392E8 - _022392D6 - 2 @ case 4
	.2byte _022392E8 - _022392D6 - 2 @ case 5
_022392E2:
	movs r0, #6
	str r0, [r4, #0x1c]
	b _02239362
_022392E8:
	adds r0, r4, #0
	bl ov72_0223A444
	add r0, sp, #4
	add r1, sp, #0
	blx FUN_021EC11C
	movs r1, #0xf5
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r2, [sp, #4]
	adds r0, r1, #4
	str r2, [r4, r0]
	blx FUN_021EC210
	blx FUN_021EC8D8
	movs r0, #0x37
	str r0, [r4, #0x1c]
	ldr r1, [sp]
	cmp r1, #7
	bhi _02239350
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02239320: @ jump table
	.2byte _02239350 - _02239320 - 2 @ case 0
	.2byte _02239330 - _02239320 - 2 @ case 1
	.2byte _02239330 - _02239320 - 2 @ case 2
	.2byte _02239342 - _02239320 - 2 @ case 3
	.2byte _02239334 - _02239320 - 2 @ case 4
	.2byte _0223934C - _02239320 - 2 @ case 5
	.2byte _0223933E - _02239320 - 2 @ case 6
	.2byte _0223934C - _02239320 - 2 @ case 7
_02239330:
	str r0, [r4, #0x1c]
	b _02239350
_02239334:
	blx FUN_021FA0D8
	movs r0, #0x37
	str r0, [r4, #0x1c]
	b _02239350
_0223933E:
	str r0, [r4, #0x1c]
	b _02239350
_02239342:
	blx FUN_021ED9B4
	movs r0, #0x37
	str r0, [r4, #0x1c]
	b _02239350
_0223934C:
	bl FUN_020399EC
_02239350:
	ldr r1, [sp, #4]
	ldr r0, _02239368 @ =0xFFFFB1E0
	cmp r1, r0
	bge _02239362
	ldr r0, _0223936C @ =0xFFFF8AD1
	cmp r1, r0
	blt _02239362
	movs r0, #0x37
	str r0, [r4, #0x1c]
_02239362:
	movs r0, #3
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_02239368: .4byte 0xFFFFB1E0
_0223936C: .4byte 0xFFFF8AD1
	thumb_func_end ov72_022392BC

	thumb_func_start ov72_02239370
ov72_02239370: @ 0x02239370
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_02028DD8
	cmp r0, #0
	bne _0223938A
	ldr r1, [r5]
	ldr r0, [r1, #8]
	ldr r1, [r1, #0x1c]
	bl FUN_02028DDC
_0223938A:
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_02028DD8
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x14]
	blx FUN_020A0310
	adds r3, r0, #0
	adds r2, r1, #0
	adds r0, r4, #0
	adds r1, r3, #0
	bl ov72_022378C0
	movs r0, #7
	str r0, [r5, #0x1c]
	movs r0, #3
	pop {r3, r4, r5, pc}
	thumb_func_end ov72_02239370

	thumb_func_start ov72_022393B0
ov72_022393B0: @ 0x022393B0
	push {r4, lr}
	adds r4, r0, #0
	bl ov72_02237CB0
	movs r0, #8
	str r0, [r4, #0x1c]
	ldr r0, _022393C8 @ =0x00000FD4
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	nop
_022393C8: .4byte 0x00000FD4
	thumb_func_end ov72_022393B0

	thumb_func_start ov72_022393CC
ov72_022393CC: @ 0x022393CC
	push {r4, lr}
	adds r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _02239484
	bl ov72_02237B74
	ldr r1, _022394A0 @ =0x00000FD4
	movs r2, #0
	str r2, [r4, r1]
	adds r2, r0, #7
	cmp r2, #9
	bhi _02239478
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_022393F4: @ jump table
	.2byte _02239458 - _022393F4 - 2 @ case 0
	.2byte _02239468 - _022393F4 - 2 @ case 1
	.2byte _02239478 - _022393F4 - 2 @ case 2
	.2byte _02239458 - _022393F4 - 2 @ case 3
	.2byte _02239478 - _022393F4 - 2 @ case 4
	.2byte _02239468 - _022393F4 - 2 @ case 5
	.2byte _02239448 - _022393F4 - 2 @ case 6
	.2byte _02239408 - _022393F4 - 2 @ case 7
	.2byte _02239438 - _022393F4 - 2 @ case 8
	.2byte _02239448 - _022393F4 - 2 @ case 9
_02239408:
	adds r0, r4, #0
	bl ov72_0223A444
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _02239420
	cmp r0, #1
	beq _0223942C
	cmp r0, #2
	beq _02239432
	b _0223949A
_02239420:
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xd
	bl ov72_02238680
	b _0223949A
_0223942C:
	movs r0, #0x19
	str r0, [r4, #0x1c]
	b _0223949A
_02239432:
	movs r0, #0x1d
	str r0, [r4, #0x1c]
	b _0223949A
_02239438:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _0223949A
_02239448:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _0223949A
_02239458:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _0223949A
_02239468:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _0223949A
_02239478:
	adds r0, r4, #0
	bl ov72_0223A444
	bl FUN_020399EC
	b _0223949A
_02239484:
	ldr r0, _022394A0 @ =0x00000FD4
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _0223949A
	bl FUN_020399EC
_0223949A:
	movs r0, #3
	pop {r4, pc}
	nop
_022394A0: .4byte 0x00000FD4
	thumb_func_end ov72_022393CC

	thumb_func_start ov72_022394A4
ov72_022394A4: @ 0x022394A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, _022394D0 @ =0x00000F64
	ldr r0, [r0, #0xc]
	adds r1, r4, r1
	bl FUN_0203189C
	ldr r1, _022394D0 @ =0x00000F64
	adds r0, r4, r1
	adds r1, #0x64
	adds r1, r4, r1
	bl ov72_02237CF4
	movs r0, #0xa
	str r0, [r4, #0x1c]
	ldr r0, _022394D4 @ =0x00000FD4
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	nop
_022394D0: .4byte 0x00000F64
_022394D4: .4byte 0x00000FD4
	thumb_func_end ov72_022394A4

	thumb_func_start ov72_022394D8
ov72_022394D8: @ 0x022394D8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	bne _022394E6
	b _022395EE
_022394E6:
	bl ov72_02237B74
	adds r5, r0, #0
	ldr r0, _02239608 @ =0x00000FD4
	movs r1, #0
	str r1, [r4, r0]
	adds r1, r5, #7
	cmp r1, #9
	bhi _022395E2
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02239504: @ jump table
	.2byte _022395C2 - _02239504 - 2 @ case 0
	.2byte _022395D2 - _02239504 - 2 @ case 1
	.2byte _022395E2 - _02239504 - 2 @ case 2
	.2byte _022395C2 - _02239504 - 2 @ case 3
	.2byte _022395E2 - _02239504 - 2 @ case 4
	.2byte _022395D2 - _02239504 - 2 @ case 5
	.2byte _022395B2 - _02239504 - 2 @ case 6
	.2byte _02239518 - _02239504 - 2 @ case 7
	.2byte _022395A2 - _02239504 - 2 @ case 8
	.2byte _022395B2 - _02239504 - 2 @ case 9
_02239518:
	adds r0, r4, #0
	bl ov72_0223A444
	ldr r0, _0223960C @ =0x00000FC8
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _02239530
	cmp r1, #1
	beq _02239586
	cmp r1, #2
	beq _02239586
	b _02239596
_02239530:
	adds r1, r0, #4
	ldr r1, [r4, r1]
	cmp r1, #3
	bhi _02239604
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02239544: @ jump table
	.2byte _0223954C - _02239544 - 2 @ case 0
	.2byte _02239576 - _02239544 - 2 @ case 1
	.2byte _02239576 - _02239544 - 2 @ case 2
	.2byte _02239576 - _02239544 - 2 @ case 3
_0223954C:
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0223955E
	cmp r0, #1
	beq _0223956A
	cmp r0, #2
	beq _02239570
	b _02239604
_0223955E:
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xd
	bl ov72_02238680
	b _02239604
_0223956A:
	movs r0, #0x19
	str r0, [r4, #0x1c]
	b _02239604
_02239570:
	movs r0, #0x1d
	str r0, [r4, #0x1c]
	b _02239604
_02239576:
	subs r0, #0x6c
	str r5, [r4, r0]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239604
_02239586:
	ldr r0, _02239610 @ =0x00000F5C
	str r5, [r4, r0]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239604
_02239596:
	adds r0, r4, #0
	bl ov72_0223A444
	bl FUN_020399EC
	b _02239604
_022395A2:
	subs r0, #0x78
	str r5, [r4, r0]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239604
_022395B2:
	subs r0, #0x78
	str r5, [r4, r0]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239604
_022395C2:
	subs r0, #0x78
	str r5, [r4, r0]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239604
_022395D2:
	subs r0, #0x78
	str r5, [r4, r0]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239604
_022395E2:
	adds r0, r4, #0
	bl ov72_0223A444
	bl FUN_020399EC
	b _02239604
_022395EE:
	ldr r0, _02239608 @ =0x00000FD4
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _02239604
	bl FUN_020399EC
_02239604:
	movs r0, #3
	pop {r3, r4, r5, pc}
	.align 2, 0
_02239608: .4byte 0x00000FD4
_0223960C: .4byte 0x00000FC8
_02239610: .4byte 0x00000F5C
	thumb_func_end ov72_022394D8

	thumb_func_start ov72_02239614
ov72_02239614: @ 0x02239614
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl ov72_02237B80
	movs r0, #0xc
	str r0, [r4, #0x1c]
	ldr r0, _02239634 @ =0x00000FD4
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov72_0223A420
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_02239634: .4byte 0x00000FD4
	thumb_func_end ov72_02239614

	thumb_func_start ov72_02239638
ov72_02239638: @ 0x02239638
	push {r4, lr}
	adds r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _022396CA
	bl ov72_02237B74
	ldr r1, _022396E4 @ =0x00000FD4
	movs r2, #0
	str r2, [r4, r1]
	adds r2, r0, #7
	cmp r2, #6
	bhi _022396B4
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_02239660: @ jump table
	.2byte _02239696 - _02239660 - 2 @ case 0
	.2byte _0223968C - _02239660 - 2 @ case 1
	.2byte _022396A0 - _02239660 - 2 @ case 2
	.2byte _02239696 - _02239660 - 2 @ case 3
	.2byte _02239682 - _02239660 - 2 @ case 4
	.2byte _02239678 - _02239660 - 2 @ case 5
	.2byte _0223966E - _02239660 - 2 @ case 6
_0223966E:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	b _022396C2
_02239678:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	b _022396C2
_02239682:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	b _022396C2
_0223968C:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	b _022396C2
_02239696:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	b _022396C2
_022396A0:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	bl FUN_020399EC
	b _022396C2
_022396B4:
	cmp r0, #0
	ble _022396C2
	adds r1, r4, #0
	adds r1, #0x98
	str r0, [r1]
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
_022396C2:
	adds r0, r4, #0
	bl ov72_0223A444
	b _022396E0
_022396CA:
	ldr r0, _022396E4 @ =0x00000FD4
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _022396E0
	bl FUN_020399EC
_022396E0:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_022396E4: .4byte 0x00000FD4
	thumb_func_end ov72_02239638

	thumb_func_start ov72_022396E8
ov72_022396E8: @ 0x022396E8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x98
	ldr r2, [r0]
	cmp r2, #0x64
	blt _02239720
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xbd
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, _02239758 @ =0x00000F0F
	ldr r1, _0223975C @ =0x00000BD4
	str r0, [sp]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #0xb
	movs r3, #1
	bl ov72_0223A280
	b _02239746
_02239720:
	movs r3, #2
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xbd
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200BFCC
	ldr r0, _02239758 @ =0x00000F0F
	ldr r1, _0223975C @ =0x00000BD4
	str r0, [sp]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #1
	bl ov72_0223A280
_02239746:
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #0xe
	bl ov72_02238680
	movs r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_02239758: .4byte 0x00000F0F
_0223975C: .4byte 0x00000BD4
	thumb_func_end ov72_022396E8

	thumb_func_start ov72_02239760
ov72_02239760: @ 0x02239760
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x98
	ldr r2, [r2]
	movs r1, #1
	bl ov72_0223A520
	movs r0, #0xf
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl ov72_0223A41C
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov72_02239760

	thumb_func_start ov72_02239784
ov72_02239784: @ 0x02239784
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	bl ov72_0223A588
	adds r4, r0, #0
	beq _022397E0
	cmp r4, #0
	ble _022397D2
	add r0, sp, #0
	add r1, sp, #0x10
	blx FUN_021ECB94
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, r5, #0
	adds r2, r5, #0
	str r4, [r0]
	adds r1, #0x94
	adds r2, #0x9c
	ldr r0, [r5]
	ldr r1, [r1]
	ldr r2, [r2]
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	ldr r0, [r0, #4]
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	add r3, sp, #0
	bl FUN_0202D720
	cmp r0, #0
	beq _022397CC
	movs r0, #0x14
	str r0, [r5, #0x1c]
	b _022397E0
_022397CC:
	movs r0, #0x10
	str r0, [r5, #0x1c]
	b _022397E0
_022397D2:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov72_0223A41C
	movs r0, #0x15
	str r0, [r5, #0x1c]
_022397E0:
	movs r0, #3
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov72_02239784

	thumb_func_start ov72_022397E8
ov72_022397E8: @ 0x022397E8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xbd
	adds r2, r4, #0
	lsls r0, r0, #4
	adds r2, #0x9c
	ldr r0, [r4, r0]
	ldr r2, [r2]
	movs r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	movs r3, #2
	movs r0, #0xbd
	adds r2, r4, #0
	str r3, [sp]
	movs r1, #1
	str r1, [sp, #4]
	lsls r0, r0, #4
	adds r2, #0x94
	ldr r0, [r4, r0]
	ldr r2, [r2]
	bl FUN_0200BFCC
	ldr r0, _02239850 @ =0x00000F0F
	movs r2, #1
	str r0, [sp]
	ldr r1, _02239854 @ =0x00000BD4
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r3, r2, #0
	bl ov72_0223A280
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #0x11
	bl ov72_02238680
	adds r4, #0xa0
	ldr r2, _02239858 @ =0x00000A38
	movs r0, #0
	adds r1, r4, #0
	blx FUN_020D4858
	movs r0, #3
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_02239850: .4byte 0x00000F0F
_02239854: .4byte 0x00000BD4
_02239858: .4byte 0x00000A38
	thumb_func_end ov72_022397E8

	thumb_func_start ov72_0223985C
ov72_0223985C: @ 0x0223985C
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239884 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _02239888 @ =0x00000BD4
	movs r2, #2
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A280
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #0xd
	bl ov72_02238680
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239884: .4byte 0x00000F0F
_02239888: .4byte 0x00000BD4
	thumb_func_end ov72_0223985C

	thumb_func_start ov72_0223988C
ov72_0223988C: @ 0x0223988C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, #0x90
	adds r1, #0x9c
	adds r2, r4, #0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, #0xa0
	bl ov72_02237BD0
	adds r0, r4, #0
	bl ov72_0223A420
	movs r0, #0x12
	str r0, [r4, #0x1c]
	ldr r0, _022398B8 @ =0x00000FD4
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	nop
_022398B8: .4byte 0x00000FD4
	thumb_func_end ov72_0223988C

	thumb_func_start ov72_022398BC
ov72_022398BC: @ 0x022398BC
	push {r3, r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _022399AA
	bl ov72_02237B74
	ldr r1, _022399C8 @ =0x00000FD4
	movs r2, #0
	str r2, [r4, r1]
	adds r2, r0, #7
	cmp r2, #7
	bhi _022399C0
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_022398E6: @ jump table
	.2byte _02239986 - _022398E6 - 2 @ case 0
	.2byte _02239976 - _022398E6 - 2 @ case 1
	.2byte _02239996 - _022398E6 - 2 @ case 2
	.2byte _02239966 - _022398E6 - 2 @ case 3
	.2byte _02239966 - _022398E6 - 2 @ case 4
	.2byte _02239956 - _022398E6 - 2 @ case 5
	.2byte _02239946 - _022398E6 - 2 @ case 6
	.2byte _022398F6 - _022398E6 - 2 @ case 7
_022398F6:
	adds r2, r4, #0
	adds r3, r4, #0
	adds r2, #0x90
	adds r3, #0x9c
	ldr r0, [r4]
	ldr r2, [r2]
	ldr r3, [r3]
	adds r1, r4, #0
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	ldr r0, [r0, #4]
	adds r1, #0xa0
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0202D7C0
	adds r0, r4, #0
	movs r1, #0x27
	movs r2, #0x13
	bl ov72_02238680
	add r0, sp, #0
	add r1, sp, #0x10
	blx FUN_021ECB94
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x94
	adds r4, #0x9c
	ldr r1, [r1]
	ldr r2, [r4]
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	ldr r0, [r0, #4]
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	add r3, sp, #0
	bl FUN_0202D678
	b _022399C0
_02239946:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _022399C0
_02239956:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _022399C0
_02239966:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0xb
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _022399C0
_02239976:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _022399C0
_02239986:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _022399C0
_02239996:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	bl FUN_020399EC
	b _022399C0
_022399AA:
	ldr r0, _022399C8 @ =0x00000FD4
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _022399C0
	bl FUN_020399EC
_022399C0:
	movs r0, #3
	add sp, #0x1c
	pop {r3, r4, pc}
	nop
_022399C8: .4byte 0x00000FD4
	thumb_func_end ov72_022398BC

	thumb_func_start ov72_022399CC
ov72_022399CC: @ 0x022399CC
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239A00 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _02239A04 @ =0x00000BD4
	movs r2, #3
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A350
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #0x2d
	bl ov72_02238680
	adds r0, r4, #0
	bl ov72_0223A444
	ldr r0, [r4]
	movs r1, #0
	str r1, [r0, #0x20]
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239A00: .4byte 0x00000F0F
_02239A04: .4byte 0x00000BD4
	thumb_func_end ov72_022399CC

	thumb_func_start ov72_02239A08
ov72_02239A08: @ 0x02239A08
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239A34 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _02239A38 @ =0x00000BD4
	movs r2, #7
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A350
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #0x1a
	bl ov72_02238680
	adds r0, r4, #0
	bl ov72_0223A420
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02239A34: .4byte 0x00000F0F
_02239A38: .4byte 0x00000BD4
	thumb_func_end ov72_02239A08

	thumb_func_start ov72_02239A3C
ov72_02239A3C: @ 0x02239A3C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0202D568
	adds r4, r0, #0
	ldr r0, [r5]
	add r1, sp, #0
	ldr r0, [r0, #4]
	bl FUN_0202D7F0
	ldr r0, [r5]
	ldr r2, _02239A80 @ =0x00000AD8
	ldr r0, [r0, #0xc]
	movs r1, #1
	adds r2, r5, r2
	bl FUN_02069528
	add r1, sp, #0
	ldrb r0, [r1]
	ldr r3, _02239A80 @ =0x00000AD8
	ldrb r1, [r1, #1]
	adds r2, r4, #0
	adds r3, r5, r3
	bl ov72_02237C30
	movs r0, #0x1b
	str r0, [r5, #0x1c]
	ldr r0, _02239A84 @ =0x00000FD4
	movs r1, #0
	str r1, [r5, r0]
	movs r0, #3
	pop {r3, r4, r5, pc}
	.align 2, 0
_02239A80: .4byte 0x00000AD8
_02239A84: .4byte 0x00000FD4
	thumb_func_end ov72_02239A3C

	thumb_func_start ov72_02239A88
ov72_02239A88: @ 0x02239A88
	push {r4, lr}
	adds r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _02239B3C
	bl ov72_02237B74
	ldr r1, _02239B58 @ =0x00000FD4
	movs r2, #0
	str r2, [r4, r1]
	adds r2, r0, #7
	cmp r2, #7
	bhi _02239B52
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_02239AB0: @ jump table
	.2byte _02239B18 - _02239AB0 - 2 @ case 0
	.2byte _02239B08 - _02239AB0 - 2 @ case 1
	.2byte _02239B28 - _02239AB0 - 2 @ case 2
	.2byte _02239B18 - _02239AB0 - 2 @ case 3
	.2byte _02239AF8 - _02239AB0 - 2 @ case 4
	.2byte _02239AE8 - _02239AB0 - 2 @ case 5
	.2byte _02239AD8 - _02239AB0 - 2 @ case 6
	.2byte _02239AC0 - _02239AB0 - 2 @ case 7
_02239AC0:
	ldr r0, [r4]
	movs r1, #5
	ldr r0, [r0]
	movs r2, #2
	bl FUN_0202D5DC
	adds r0, r4, #0
	movs r1, #0x27
	movs r2, #0x1c
	bl ov72_02238680
	b _02239B52
_02239AD8:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239B52
_02239AE8:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239B52
_02239AF8:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239B52
_02239B08:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239B52
_02239B18:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239B52
_02239B28:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	bl FUN_020399EC
	b _02239B52
_02239B3C:
	ldr r0, _02239B58 @ =0x00000FD4
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _02239B52
	bl FUN_020399EC
_02239B52:
	movs r0, #3
	pop {r4, pc}
	nop
_02239B58: .4byte 0x00000FD4
	thumb_func_end ov72_02239A88

	thumb_func_start ov72_02239B5C
ov72_02239B5C: @ 0x02239B5C
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239B90 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _02239B94 @ =0x00000BD4
	movs r2, #8
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A350
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #0x2d
	bl ov72_02238680
	adds r0, r4, #0
	bl ov72_0223A444
	ldr r0, [r4]
	movs r1, #0
	str r1, [r0, #0x20]
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239B90: .4byte 0x00000F0F
_02239B94: .4byte 0x00000BD4
	thumb_func_end ov72_02239B5C

	thumb_func_start ov72_02239B98
ov72_02239B98: @ 0x02239B98
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239BC0 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _02239BC4 @ =0x00000BD4
	movs r2, #5
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A350
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #0x1e
	bl ov72_02238680
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239BC0: .4byte 0x00000F0F
_02239BC4: .4byte 0x00000BD4
	thumb_func_end ov72_02239B98

	thumb_func_start ov72_02239BC8
ov72_02239BC8: @ 0x02239BC8
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #1
	adds r2, #0x94
	str r1, [r2]
	adds r2, r1, #0
	bl ov72_0223A41C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xa
	bl ov72_0223A520
	movs r0, #0x1f
	str r0, [r4, #0x1c]
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov72_02239BC8

	thumb_func_start ov72_02239BEC
ov72_02239BEC: @ 0x02239BEC
	push {r4, lr}
	adds r4, r0, #0
	bl ov72_0223A588
	cmp r0, #0
	beq _02239C10
	ble _02239C0C
	adds r1, r4, #0
	adds r1, #0x94
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0x20
	bl ov72_02238680
	b _02239C10
_02239C0C:
	movs r0, #0x17
	str r0, [r4, #0x1c]
_02239C10:
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov72_02239BEC

	thumb_func_start ov72_02239C14
ov72_02239C14: @ 0x02239C14
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x98
	ldr r2, [r0]
	cmp r2, #0x64
	blt _02239C4C
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xbd
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, _02239C84 @ =0x00000F0F
	ldr r1, _02239C88 @ =0x00000BD4
	str r0, [sp]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #0xa
	movs r3, #1
	bl ov72_0223A280
	b _02239C72
_02239C4C:
	movs r3, #2
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xbd
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200BFCC
	ldr r0, _02239C84 @ =0x00000F0F
	ldr r1, _02239C88 @ =0x00000BD4
	str r0, [sp]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #6
	movs r3, #1
	bl ov72_0223A280
_02239C72:
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #0x21
	bl ov72_02238680
	movs r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_02239C84: .4byte 0x00000F0F
_02239C88: .4byte 0x00000BD4
	thumb_func_end ov72_02239C14

	thumb_func_start ov72_02239C8C
ov72_02239C8C: @ 0x02239C8C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #1
	adds r2, #0x9c
	str r1, [r2]
	adds r2, r4, #0
	adds r2, #0x98
	ldr r2, [r2]
	bl ov72_0223A520
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl ov72_0223A41C
	movs r0, #0x22
	str r0, [r4, #0x1c]
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov72_02239C8C

	thumb_func_start ov72_02239CB4
ov72_02239CB4: @ 0x02239CB4
	push {r4, lr}
	adds r4, r0, #0
	bl ov72_0223A588
	cmp r0, #0
	beq _02239CD2
	ble _02239CCE
	adds r1, r4, #0
	adds r1, #0x9c
	str r0, [r1]
	movs r0, #0x23
	str r0, [r4, #0x1c]
	b _02239CD2
_02239CCE:
	movs r0, #0x1d
	str r0, [r4, #0x1c]
_02239CD2:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov72_02239CB4

	thumb_func_start ov72_02239CD8
ov72_02239CD8: @ 0x02239CD8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xbd
	adds r2, r4, #0
	lsls r0, r0, #4
	adds r2, #0x9c
	ldr r0, [r4, r0]
	ldr r2, [r2]
	movs r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	movs r3, #2
	movs r0, #0xbd
	adds r2, r4, #0
	str r3, [sp]
	movs r1, #1
	str r1, [sp, #4]
	lsls r0, r0, #4
	adds r2, #0x94
	ldr r0, [r4, r0]
	ldr r2, [r2]
	bl FUN_0200BFCC
	ldr r0, _02239D34 @ =0x00000F0F
	movs r2, #1
	str r0, [sp]
	ldr r1, _02239D38 @ =0x00000BD4
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r3, r2, #0
	bl ov72_0223A280
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #0x24
	bl ov72_02238680
	movs r0, #3
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_02239D34: .4byte 0x00000F0F
_02239D38: .4byte 0x00000BD4
	thumb_func_end ov72_02239CD8

	thumb_func_start ov72_02239D3C
ov72_02239D3C: @ 0x02239D3C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, #0x94
	adds r1, #0x9c
	adds r2, r4, #0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, #0xa0
	bl ov72_02237BD0
	movs r0, #0x25
	str r0, [r4, #0x1c]
	ldr r0, _02239D68 @ =0x00000FD4
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov72_0223A420
	movs r0, #3
	pop {r4, pc}
	nop
_02239D68: .4byte 0x00000FD4
	thumb_func_end ov72_02239D3C

	thumb_func_start ov72_02239D6C
ov72_02239D6C: @ 0x02239D6C
	push {r4, lr}
	adds r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _02239E34
	bl ov72_02237B74
	ldr r1, _02239E50 @ =0x00000FD4
	movs r2, #0
	str r2, [r4, r1]
	adds r2, r0, #7
	cmp r2, #7
	bhi _02239E4A
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_02239D94: @ jump table
	.2byte _02239E10 - _02239D94 - 2 @ case 0
	.2byte _02239E00 - _02239D94 - 2 @ case 1
	.2byte _02239E20 - _02239D94 - 2 @ case 2
	.2byte _02239E10 - _02239D94 - 2 @ case 3
	.2byte _02239DF0 - _02239D94 - 2 @ case 4
	.2byte _02239DE0 - _02239D94 - 2 @ case 5
	.2byte _02239DD0 - _02239D94 - 2 @ case 6
	.2byte _02239DA4 - _02239D94 - 2 @ case 7
_02239DA4:
	adds r2, r4, #0
	adds r3, r4, #0
	adds r2, #0x94
	adds r3, #0x9c
	ldr r0, [r4]
	ldr r2, [r2]
	ldr r3, [r3]
	ldr r1, _02239E54 @ =0x000006DC
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	ldr r0, [r0, #4]
	adds r1, r4, r1
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0202D8A4
	adds r0, r4, #0
	movs r1, #0x27
	movs r2, #0x26
	bl ov72_02238680
	b _02239E4A
_02239DD0:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239E4A
_02239DE0:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239E4A
_02239DF0:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0xb
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239E4A
_02239E00:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239E4A
_02239E10:
	movs r2, #0xb
	str r2, [r4, #0x1c]
	subs r1, #0x78
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov72_0223A444
	b _02239E4A
_02239E20:
	subs r1, #0x78
	str r0, [r4, r1]
	movs r0, #0x35
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
	bl FUN_020399EC
	b _02239E4A
_02239E34:
	ldr r0, _02239E50 @ =0x00000FD4
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _02239E4A
	bl FUN_020399EC
_02239E4A:
	movs r0, #3
	pop {r4, pc}
	nop
_02239E50: .4byte 0x00000FD4
_02239E54: .4byte 0x000006DC
	thumb_func_end ov72_02239D6C

	thumb_func_start ov72_02239E58
ov72_02239E58: @ 0x02239E58
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239E8C @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _02239E90 @ =0x00000BD4
	movs r2, #3
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A350
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #0x2d
	bl ov72_02238680
	adds r0, r4, #0
	bl ov72_0223A444
	ldr r0, [r4]
	movs r1, #0
	str r1, [r0, #0x20]
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239E8C: .4byte 0x00000F0F
_02239E90: .4byte 0x00000BD4
	thumb_func_end ov72_02239E58

	thumb_func_start ov72_02239E94
ov72_02239E94: @ 0x02239E94
	movs r1, #0x29
	str r1, [r0, #0x1c]
	movs r0, #3
	bx lr
	thumb_func_end ov72_02239E94

	thumb_func_start ov72_02239E9C
ov72_02239E9C: @ 0x02239E9C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	movs r1, #2
	ldr r0, [r0, #0xc]
	bl FUN_02027550
	movs r0, #0x28
	str r0, [r4, #0x1c]
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov72_02239E9C

	thumb_func_start ov72_02239EB4
ov72_02239EB4: @ 0x02239EB4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl FUN_02027564
	cmp r0, #2
	bne _02239ECE
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov72_0223A444
_02239ECE:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov72_02239EB4

	thumb_func_start ov72_02239ED4
ov72_02239ED4: @ 0x02239ED4
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239EFC @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _02239F00 @ =0x00000BD4
	movs r2, #4
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A350
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #0x16
	bl ov72_02238680
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239EFC: .4byte 0x00000F0F
_02239F00: .4byte 0x00000BD4
	thumb_func_end ov72_02239ED4

	thumb_func_start ov72_02239F04
ov72_02239F04: @ 0x02239F04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02239F2C @ =0x0000136C
	adds r0, r4, r0
	bl ov72_0223AF48
	cmp r0, #0
	beq _02239F28
	cmp r0, #2
	bne _02239F1E
	movs r0, #0xd
	str r0, [r4, #0x1c]
	b _02239F28
_02239F1E:
	movs r0, #0x29
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	movs r1, #1
	str r1, [r0, #0x20]
_02239F28:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_02239F2C: .4byte 0x0000136C
	thumb_func_end ov72_02239F04

	thumb_func_start ov72_02239F30
ov72_02239F30: @ 0x02239F30
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239F58 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _02239F5C @ =0x00000BD4
	movs r2, #9
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A350
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #0x18
	bl ov72_02238680
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239F58: .4byte 0x00000F0F
_02239F5C: .4byte 0x00000BD4
	thumb_func_end ov72_02239F30

	thumb_func_start ov72_02239F60
ov72_02239F60: @ 0x02239F60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02239F88 @ =0x0000136C
	adds r0, r4, r0
	bl ov72_0223AF48
	cmp r0, #0
	beq _02239F84
	cmp r0, #2
	bne _02239F7A
	movs r0, #0x1d
	str r0, [r4, #0x1c]
	b _02239F84
_02239F7A:
	movs r0, #0x29
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	movs r1, #1
	str r1, [r0, #0x20]
_02239F84:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_02239F88: .4byte 0x0000136C
	thumb_func_end ov72_02239F60

	thumb_func_start ov72_02239F8C
ov72_02239F8C: @ 0x02239F8C
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239FB4 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _02239FB8 @ =0x00000BDC
	movs r2, #0x1a
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A350
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #0x2a
	bl ov72_02238680
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239FB4: .4byte 0x00000F0F
_02239FB8: .4byte 0x00000BDC
	thumb_func_end ov72_02239F8C

	thumb_func_start ov72_02239FBC
ov72_02239FBC: @ 0x02239FBC
	push {r4, lr}
	adds r4, r0, #0
	blx FUN_021EC8D8
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov72_022387D0
	movs r0, #0x2b
	str r0, [r4, #0x1c]
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov72_02239FBC

	thumb_func_start ov72_02239FD8
ov72_02239FD8: @ 0x02239FD8
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223A008 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _0223A00C @ =0x00000BDC
	movs r2, #0x1b
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A350
	adds r0, r4, #0
	movs r1, #0x31
	movs r2, #0x2e
	bl ov72_02238680
	movs r0, #0xf6
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223A008: .4byte 0x00000F0F
_0223A00C: .4byte 0x00000BDC
	thumb_func_end ov72_02239FD8

	thumb_func_start ov72_0223A010
ov72_0223A010: @ 0x0223A010
	movs r0, #3
	bx lr
	thumb_func_end ov72_0223A010

	thumb_func_start ov72_0223A014
ov72_0223A014: @ 0x0223A014
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl FUN_0203A914
	bl FUN_0203946C
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x43
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0
	str r0, [r4, #0x1c]
	movs r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov72_0223A014

	thumb_func_start ov72_0223A044
ov72_0223A044: @ 0x0223A044
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223A068 @ =0x00001308
	ldr r0, [r4, r0]
	bl ov72_02238668
	cmp r0, #0
	beq _0223A062
	cmp r0, #2
	bne _0223A05E
	movs r0, #0
	str r0, [r4, #0x1c]
	b _0223A062
_0223A05E:
	movs r0, #0x29
	str r0, [r4, #0x1c]
_0223A062:
	movs r0, #3
	pop {r4, pc}
	nop
_0223A068: .4byte 0x00001308
	thumb_func_end ov72_0223A044

	thumb_func_start ov72_0223A06C
ov72_0223A06C: @ 0x0223A06C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0223A0D4 @ =0x00000F5C
	movs r4, #0
	ldr r0, [r5, r0]
	adds r0, r0, #7
	cmp r0, #9
	bhi _0223A0AE
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223A088: @ jump table
	.2byte _0223A0A8 - _0223A088 - 2 @ case 0
	.2byte _0223A09C - _0223A088 - 2 @ case 1
	.2byte _0223A0AE - _0223A088 - 2 @ case 2
	.2byte _0223A0A8 - _0223A088 - 2 @ case 3
	.2byte _0223A0AC - _0223A088 - 2 @ case 4
	.2byte _0223A09C - _0223A088 - 2 @ case 5
	.2byte _0223A0A4 - _0223A088 - 2 @ case 6
	.2byte _0223A0AE - _0223A088 - 2 @ case 7
	.2byte _0223A0A0 - _0223A088 - 2 @ case 8
	.2byte _0223A0A4 - _0223A088 - 2 @ case 9
_0223A09C:
	movs r4, #0xf
	b _0223A0AE
_0223A0A0:
	movs r4, #0xd
	b _0223A0AE
_0223A0A4:
	movs r4, #0xe
	b _0223A0AE
_0223A0A8:
	movs r4, #0x10
	b _0223A0AE
_0223A0AC:
	movs r4, #0x11
_0223A0AE:
	adds r0, r5, #0
	bl ov72_0223A444
	ldr r0, _0223A0D8 @ =0x00000F0F
	ldr r1, _0223A0DC @ =0x00000BD4
	str r0, [sp]
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #1
	bl ov72_0223A350
	adds r0, r5, #0
	movs r1, #0x2f
	movs r2, #0x36
	bl ov72_02238680
	movs r0, #3
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223A0D4: .4byte 0x00000F5C
_0223A0D8: .4byte 0x00000F0F
_0223A0DC: .4byte 0x00000BD4
	thumb_func_end ov72_0223A06C

	thumb_func_start ov72_0223A0E0
ov72_0223A0E0: @ 0x0223A0E0
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0xfd
	adds r4, r0, #0
	lsls r1, r1, #4
	ldrsh r2, [r4, r1]
	cmp r2, #3
	bhi _0223A17C
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0223A0FC: @ jump table
	.2byte _0223A104 - _0223A0FC - 2 @ case 0
	.2byte _0223A120 - _0223A0FC - 2 @ case 1
	.2byte _0223A144 - _0223A0FC - 2 @ case 2
	.2byte _0223A160 - _0223A0FC - 2 @ case 3
_0223A104:
	subs r1, #0xc1
	str r1, [sp]
	ldr r1, _0223A1A0 @ =0x00000BD4
	movs r2, #0x12
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A350
	movs r0, #0xfd
	lsls r0, r0, #4
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	b _0223A198
_0223A120:
	ldr r0, _0223A1A4 @ =0x00000BF4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223A198
	bl FUN_0203946C
	blx FUN_021EC8D8
	movs r0, #0xfd
	lsls r0, r0, #4
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	b _0223A198
_0223A144:
	subs r1, #0xc1
	str r1, [sp]
	ldr r1, _0223A1A0 @ =0x00000BD4
	movs r2, #0x13
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov72_0223A350
	movs r0, #0xfd
	lsls r0, r0, #4
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	b _0223A198
_0223A160:
	ldr r0, _0223A1A4 @ =0x00000BF4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223A198
	movs r0, #0xfd
	lsls r0, r0, #4
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	b _0223A198
_0223A17C:
	ldr r0, _0223A1A8 @ =0x00000FD2
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0x1e
	ble _0223A198
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov72_022387D0
	movs r0, #0x2e
	str r0, [r4, #0x1c]
_0223A198:
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223A1A0: .4byte 0x00000BD4
_0223A1A4: .4byte 0x00000BF4
_0223A1A8: .4byte 0x00000FD2
	thumb_func_end ov72_0223A0E0

	thumb_func_start ov72_0223A1AC
ov72_0223A1AC: @ 0x0223A1AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223A1C8 @ =0x00000BF4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223A1C4
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
_0223A1C4:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223A1C8: .4byte 0x00000BF4
	thumb_func_end ov72_0223A1AC

	thumb_func_start ov72_0223A1CC
ov72_0223A1CC: @ 0x0223A1CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223A1FC @ =0x00000BF4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223A1F8
	movs r0, #0xf6
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	ble _0223A1EE
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
_0223A1EE:
	movs r0, #0xf6
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_0223A1F8:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223A1FC: .4byte 0x00000BF4
	thumb_func_end ov72_0223A1CC

	thumb_func_start ov72_0223A200
ov72_0223A200: @ 0x0223A200
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223A274 @ =0x00000BF4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223A26E
	ldr r0, _0223A278 @ =0x00000E14
	ldr r1, [r4, r0]
	ldr r0, _0223A27C @ =0x00001370
	str r1, [r4, r0]
	ldr r2, [r4, #4]
	subs r1, r0, #4
	str r2, [r4, r1]
	adds r1, r0, #0
	movs r2, #0x43
	adds r1, #0x24
	str r2, [r4, r1]
	adds r1, r0, #0
	movs r2, #0
	adds r1, #0x28
	strb r2, [r4, r1]
	adds r1, r0, #0
	movs r2, #0xa
	adds r1, #0x2a
	strb r2, [r4, r1]
	adds r1, r0, #0
	movs r2, #6
	adds r1, #0x2b
	strb r2, [r4, r1]
	adds r1, r0, #0
	movs r2, #4
	adds r1, #0x2e
	strb r2, [r4, r1]
	adds r1, r0, #0
	movs r2, #0xb
	adds r1, #0x2c
	strb r2, [r4, r1]
	adds r1, r0, #0
	movs r2, #1
	adds r1, #0x2d
	strb r2, [r4, r1]
	adds r1, r0, #0
	subs r0, r0, #4
	adds r2, #0xff
	adds r1, #0x30
	adds r0, r4, r0
	str r2, [r4, r1]
	bl ov72_0223AF1C
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
_0223A26E:
	movs r0, #3
	pop {r4, pc}
	nop
_0223A274: .4byte 0x00000BF4
_0223A278: .4byte 0x00000E14
_0223A27C: .4byte 0x00001370
	thumb_func_end ov72_0223A200

	thumb_func_start ov72_0223A280
ov72_0223A280: @ 0x0223A280
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r4, r3, #0
	bl FUN_0200BBA0
	movs r1, #0xbd
	adds r6, r0, #0
	lsls r1, r1, #4
	ldr r0, [r5, r1]
	adds r1, #0x10
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl FUN_0200CBBC
	ldr r0, _0223A2E0 @ =0x00000E18
	movs r1, #0xf
	adds r0, r5, r0
	bl FUN_0201D978
	ldr r0, _0223A2E0 @ =0x00000E18
	movs r1, #0
	adds r0, r5, r0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	movs r2, #0xbe
	ldr r0, _0223A2E0 @ =0x00000E18
	str r3, [sp, #8]
	lsls r2, r2, #4
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	ldr r1, _0223A2E4 @ =0x00000BF4
	str r0, [r5, r1]
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0223A2E0: .4byte 0x00000E18
_0223A2E4: .4byte 0x00000BF4
	thumb_func_end ov72_0223A280

	thumb_func_start ov72_0223A2E8
ov72_0223A2E8: @ 0x0223A2E8
	push {r4, lr}
	ldr r1, _0223A310 @ =0x00000F54
	adds r4, r0, #0
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	rsbs r0, r0, #0
	bl FUN_021E6A70
	ldr r2, _0223A310 @ =0x00000F54
	adds r1, r0, #0
	ldr r2, [r4, r2]
	adds r0, r4, #0
	rsbs r2, r2, #0
	bl ov72_0223A4DC
	movs r0, #0x38
	str r0, [r4, #0x1c]
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223A310: .4byte 0x00000F54
	thumb_func_end ov72_0223A2E8

	thumb_func_start ov72_0223A314
ov72_0223A314: @ 0x0223A314
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223A344 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	bne _0223A330
	movs r0, #2
	tst r0, r1
	bne _0223A330
	ldr r0, _0223A348 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _0223A33E
_0223A330:
	ldr r0, _0223A34C @ =0x00000E58
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E5D4
	movs r0, #0
	str r0, [r4, #0x1c]
_0223A33E:
	movs r0, #3
	pop {r4, pc}
	nop
_0223A344: .4byte 0x021D110C
_0223A348: .4byte 0x021D114C
_0223A34C: .4byte 0x00000E58
	thumb_func_end ov72_0223A314

	thumb_func_start ov72_0223A350
ov72_0223A350: @ 0x0223A350
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0xbe
	lsls r2, r2, #4
	ldr r2, [r5, r2]
	adds r4, r3, #0
	bl FUN_0200BB6C
	ldr r0, _0223A3A0 @ =0x00000E18
	movs r1, #0xf
	adds r0, r5, r0
	bl FUN_0201D978
	ldr r0, _0223A3A0 @ =0x00000E18
	movs r1, #0
	adds r0, r5, r0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	movs r2, #0xbe
	ldr r0, _0223A3A0 @ =0x00000E18
	str r3, [sp, #8]
	lsls r2, r2, #4
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	ldr r1, _0223A3A4 @ =0x00000BF4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223A3A0: .4byte 0x00000E18
_0223A3A4: .4byte 0x00000BF4
	thumb_func_end ov72_0223A350

	thumb_func_start ov72_0223A3A8
ov72_0223A3A8: @ 0x0223A3A8
	push {r4, lr}
	adds r4, r0, #0
	cmp r3, #1
	beq _0223A3B6
	cmp r3, #2
	beq _0223A3CC
	b _0223A3DA
_0223A3B6:
	ldr r0, [sp, #0xc]
	movs r2, #0
	bl FUN_02002F30
	ldrb r1, [r4, #7]
	lsls r1, r1, #3
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r2, r0, #1
	b _0223A3DA
_0223A3CC:
	ldr r0, [sp, #0xc]
	movs r2, #0
	bl FUN_02002F30
	ldrb r1, [r4, #7]
	lsls r1, r1, #3
	subs r2, r1, r0
_0223A3DA:
	adds r0, r2, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov72_0223A3A8

	thumb_func_start ov72_0223A3E0
ov72_0223A3E0: @ 0x0223A3E0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r3, #0
	ldr r3, [sp, #0x24]
	adds r5, r0, #0
	str r3, [sp]
	movs r3, #1
	str r3, [sp, #4]
	ldr r3, [sp, #0x20]
	adds r6, r1, #0
	bl ov72_0223A3A8
	adds r3, r0, #0
	str r4, [sp]
	movs r1, #0
	ldr r0, [sp, #0x24]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov72_0223A3E0

	thumb_func_start ov72_0223A414
ov72_0223A414: @ 0x0223A414
	ldr r3, _0223A418 @ =FUN_0203A880
	bx r3
	.align 2, 0
_0223A418: .4byte FUN_0203A880
	thumb_func_end ov72_0223A414

	thumb_func_start ov72_0223A41C
ov72_0223A41C: @ 0x0223A41C
	bx lr
	.align 2, 0
	thumb_func_end ov72_0223A41C

	thumb_func_start ov72_0223A420
ov72_0223A420: @ 0x0223A420
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223A43C @ =0x00000F4C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223A43A
	ldr r0, _0223A440 @ =0x00000E18
	movs r1, #1
	adds r0, r4, r0
	bl FUN_0200F0AC
	ldr r1, _0223A43C @ =0x00000F4C
	str r0, [r4, r1]
_0223A43A:
	pop {r4, pc}
	.align 2, 0
_0223A43C: .4byte 0x00000F4C
_0223A440: .4byte 0x00000E18
	thumb_func_end ov72_0223A420

	thumb_func_start ov72_0223A444
ov72_0223A444: @ 0x0223A444
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223A45C @ =0x00000F4C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223A45A
	bl FUN_0200F450
	ldr r0, _0223A45C @ =0x00000F4C
	movs r1, #0
	str r1, [r4, r0]
_0223A45A:
	pop {r4, pc}
	.align 2, 0
_0223A45C: .4byte 0x00000F4C
	thumb_func_end ov72_0223A444

	thumb_func_start ov72_0223A460
ov72_0223A460: @ 0x0223A460
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #1
	adds r6, r1, #0
	lsls r0, r0, #8
	movs r1, #0x43
	bl FUN_02026354
	adds r4, r0, #0
	ldr r0, _0223A4D0 @ =0x00000BDC
	adds r1, r6, #0
	ldr r0, [r5, r0]
	adds r2, r4, #0
	bl FUN_0200BB6C
	movs r1, #0xbd
	lsls r1, r1, #4
	ldr r0, [r5, r1]
	adds r1, #0x20
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	ldr r0, _0223A4D4 @ =0x00000E58
	movs r1, #0xf
	adds r0, r5, r0
	bl FUN_0201D978
	ldr r0, _0223A4D4 @ =0x00000E58
	movs r1, #1
	adds r0, r5, r0
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E580
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r2, #0xbf
	ldr r0, _0223A4D4 @ =0x00000E58
	str r3, [sp, #8]
	lsls r2, r2, #4
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	ldr r1, _0223A4D8 @ =0x00000BF4
	str r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0223A4D0: .4byte 0x00000BDC
_0223A4D4: .4byte 0x00000E58
_0223A4D8: .4byte 0x00000BF4
	thumb_func_end ov72_0223A460

	thumb_func_start ov72_0223A4DC
ov72_0223A4DC: @ 0x0223A4DC
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	adds r4, r1, #0
	mvns r0, r0
	cmp r4, r0
	bne _0223A4EE
	movs r4, #0xb
_0223A4EE:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xbd
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	movs r3, #5
	bl FUN_0200BFCC
	ldr r0, _0223A51C @ =0x00000E18
	movs r1, #1
	adds r0, r5, r0
	bl FUN_0200E9BC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov72_0223A460
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223A51C: .4byte 0x00000E18
	thumb_func_end ov72_0223A4DC

	thumb_func_start ov72_0223A520
ov72_0223A520: @ 0x0223A520
	push {r4, lr}
	ldr r3, _0223A580 @ =0x0000130C
	movs r4, #0
	strb r1, [r0, r3]
	adds r1, r3, #1
	strb r2, [r0, r1]
	adds r1, r3, #2
	strb r4, [r0, r1]
	adds r1, r3, #3
	strb r4, [r0, r1]
	cmp r2, #0x64
	beq _0223A544
	adds r1, r3, #4
	movs r2, #1
	strh r2, [r0, r1]
	adds r3, #0x5c
	str r2, [r0, r3]
	b _0223A54C
_0223A544:
	adds r1, r3, #4
	strh r4, [r0, r1]
	adds r3, #0x5c
	str r4, [r0, r3]
_0223A54C:
	ldr r3, _0223A584 @ =0x00001312
	movs r1, #0
	strb r1, [r0, r3]
	subs r4, r1, #1
	adds r2, r3, #2
	strb r4, [r0, r2]
	adds r2, r3, #3
	strb r4, [r0, r2]
	adds r2, r3, #4
	strb r4, [r0, r2]
	adds r2, r3, #0
	adds r2, #0x52
	strh r1, [r0, r2]
	movs r2, #1
	adds r3, #0x54
	strh r2, [r0, r3]
	movs r2, #0xe
	lsls r2, r2, #8
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _0223A57A
	bl ov72_022386F4
_0223A57A:
	movs r0, #1
	pop {r4, pc}
	nop
_0223A580: .4byte 0x0000130C
_0223A584: .4byte 0x00001312
	thumb_func_end ov72_0223A520

	thumb_func_start ov72_0223A588
ov72_0223A588: @ 0x0223A588
	push {r4, lr}
	ldr r1, _0223A5A8 @ =0x00001312
	adds r4, r0, #0
	ldrb r1, [r4, r1]
	lsls r2, r1, #2
	ldr r1, _0223A5AC @ =0x0223B744
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #1
	bne _0223A5A2
	ldr r0, _0223A5B0 @ =0x0000130E
	ldrsb r0, [r4, r0]
	pop {r4, pc}
_0223A5A2:
	movs r0, #0
	pop {r4, pc}
	nop
_0223A5A8: .4byte 0x00001312
_0223A5AC: .4byte 0x0223B744
_0223A5B0: .4byte 0x0000130E
	thumb_func_end ov72_0223A588

	thumb_func_start ov72_0223A5B4
ov72_0223A5B4: @ 0x0223A5B4
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #0x43
	str r1, [sp, #8]
	movs r1, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
	ldr r0, _0223A5DC @ =0x00001312
	movs r1, #1
	strb r1, [r4, r0]
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0223A5DC: .4byte 0x00001312
	thumb_func_end ov72_0223A5B4

	thumb_func_start ov72_0223A5E0
ov72_0223A5E0: @ 0x0223A5E0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223A65E
	adds r0, r4, #0
	bl ov72_0223A680
	ldr r2, _0223A664 @ =0x00001310
	ldr r0, _0223A668 @ =0x00000E04
	ldrsh r1, [r4, r2]
	adds r2, #0x58
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	bl ov72_02238730
	adds r0, r4, #0
	movs r1, #1
	bl ov72_02238B18
	adds r0, r4, #0
	bl ov72_0223ACA8
	ldr r1, _0223A66C @ =0x00000BD4
	ldr r0, _0223A670 @ =0x00001328
	ldr r1, [r4, r1]
	adds r0, r4, r0
	movs r2, #0x14
	bl ov72_0223AD20
	ldr r1, _0223A66C @ =0x00000BD4
	ldr r0, _0223A674 @ =0x00001338
	ldr r1, [r4, r1]
	adds r0, r4, r0
	movs r2, #0x15
	bl ov72_0223AD20
	ldr r1, _0223A66C @ =0x00000BD4
	ldr r0, _0223A678 @ =0x00001348
	ldr r1, [r4, r1]
	adds r0, r4, r0
	movs r2, #0x16
	bl ov72_0223AD20
	movs r0, #4
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #4
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r2, #0x43
	str r2, [sp, #8]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	ldr r0, _0223A67C @ =0x00001312
	movs r1, #2
	strb r1, [r4, r0]
_0223A65E:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0223A664: .4byte 0x00001310
_0223A668: .4byte 0x00000E04
_0223A66C: .4byte 0x00000BD4
_0223A670: .4byte 0x00001328
_0223A674: .4byte 0x00001338
_0223A678: .4byte 0x00001348
_0223A67C: .4byte 0x00001312
	thumb_func_end ov72_0223A5E0

	thumb_func_start ov72_0223A680
ov72_0223A680: @ 0x0223A680
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _0223A6FC @ =0x0000130D
	ldrb r0, [r6, r0]
	cmp r0, #0x64
	bne _0223A696
	ldr r0, _0223A700 @ =0x00000DF4
	movs r1, #1
	ldr r0, [r6, r0]
	bl FUN_02024830
_0223A696:
	ldr r0, _0223A704 @ =0x00000DF8
	movs r1, #1
	ldr r0, [r6, r0]
	bl FUN_02024830
	ldr r0, _0223A708 @ =0x00000DFC
	movs r1, #1
	ldr r0, [r6, r0]
	bl FUN_02024830
	ldr r7, _0223A70C @ =0x00001368
	movs r4, #0
	adds r5, r6, #0
_0223A6B0:
	ldr r0, _0223A700 @ =0x00000DF4
	ldr r2, [r6, r7]
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl ov72_02238750
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _0223A6B0
	movs r0, #0xe
	lsls r0, r0, #8
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_02024830
	ldr r0, _0223A710 @ =0x00000E04
	movs r1, #1
	ldr r0, [r6, r0]
	bl FUN_02024830
	ldr r0, _0223A714 @ =0x00000E08
	movs r1, #1
	ldr r0, [r6, r0]
	bl FUN_02024830
	ldr r0, _0223A718 @ =0x00000E0C
	movs r1, #1
	ldr r0, [r6, r0]
	bl FUN_02024830
	movs r0, #0xe1
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_02024830
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223A6FC: .4byte 0x0000130D
_0223A700: .4byte 0x00000DF4
_0223A704: .4byte 0x00000DF8
_0223A708: .4byte 0x00000DFC
_0223A70C: .4byte 0x00001368
_0223A710: .4byte 0x00000E04
_0223A714: .4byte 0x00000E08
_0223A718: .4byte 0x00000E0C
	thumb_func_end ov72_0223A680

	thumb_func_start ov72_0223A71C
ov72_0223A71C: @ 0x0223A71C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223A72E
	ldr r0, _0223A734 @ =0x00001312
	movs r1, #3
	strb r1, [r4, r0]
_0223A72E:
	movs r0, #0
	pop {r4, pc}
	nop
_0223A734: .4byte 0x00001312
	thumb_func_end ov72_0223A71C

	thumb_func_start ov72_0223A738
ov72_0223A738: @ 0x0223A738
	push {r3, lr}
	ldr r1, _0223A754 @ =0x0000130D
	ldrb r0, [r0, r1]
	cmp r0, #0x64
	bne _0223A74A
	ldr r0, _0223A758 @ =0x0223B774
	bl FUN_02025224
	pop {r3, pc}
_0223A74A:
	ldr r0, _0223A75C @ =0x0223B7B8
	bl FUN_02025224
	pop {r3, pc}
	nop
_0223A754: .4byte 0x0000130D
_0223A758: .4byte 0x0223B774
_0223A75C: .4byte 0x0223B7B8
	thumb_func_end ov72_0223A738

	thumb_func_start ov72_0223A760
ov72_0223A760: @ 0x0223A760
	push {r3, r4}
	ldr r3, _0223A7E0 @ =0x0223B48C
	lsls r4, r0, #2
	adds r3, r3, r4
	ldrb r1, [r1, r3]
	cmp r1, #0xd
	bne _0223A776
	ldrh r1, [r2]
	ldr r0, _0223A7E4 @ =0x0223B464
	ldrb r1, [r0, r1]
	b _0223A7D8
_0223A776:
	cmp r1, #0xe
	bne _0223A782
	ldrh r1, [r2]
	ldr r0, _0223A7E8 @ =0x0223B466
	ldrb r1, [r0, r1]
	b _0223A7D8
_0223A782:
	cmp r1, #0xf
	bne _0223A78E
	ldrh r1, [r2, #2]
	ldr r0, _0223A7EC @ =0x0223B468
	ldrb r1, [r0, r1]
	b _0223A7D8
_0223A78E:
	cmp r1, #0x10
	bne _0223A79A
	ldrh r1, [r2, #2]
	ldr r0, _0223A7F0 @ =0x0223B46A
	ldrb r1, [r0, r1]
	b _0223A7D8
_0223A79A:
	cmp r1, #0xa
	bne _0223A7BA
	cmp r0, #5
	beq _0223A7A6
	cmp r0, #0
	bne _0223A7AC
_0223A7A6:
	movs r0, #0
	strh r0, [r2]
	b _0223A7D8
_0223A7AC:
	cmp r0, #1
	beq _0223A7B4
	cmp r0, #6
	bne _0223A7D8
_0223A7B4:
	movs r0, #1
	strh r0, [r2]
	b _0223A7D8
_0223A7BA:
	cmp r1, #0xc
	bne _0223A7D8
	cmp r0, #3
	beq _0223A7C6
	cmp r0, #8
	bne _0223A7CC
_0223A7C6:
	movs r0, #0
	strh r0, [r2, #2]
	b _0223A7D8
_0223A7CC:
	cmp r0, #4
	beq _0223A7D4
	cmp r0, #9
	bne _0223A7D8
_0223A7D4:
	movs r0, #1
	strh r0, [r2, #2]
_0223A7D8:
	adds r0, r1, #0
	pop {r3, r4}
	bx lr
	nop
_0223A7E0: .4byte 0x0223B48C
_0223A7E4: .4byte 0x0223B464
_0223A7E8: .4byte 0x0223B466
_0223A7EC: .4byte 0x0223B468
_0223A7F0: .4byte 0x0223B46A
	thumb_func_end ov72_0223A760

	thumb_func_start ov72_0223A7F4
ov72_0223A7F4: @ 0x0223A7F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r7, r0, #0
	adds r6, r1, #0
	movs r0, #0x64
	movs r4, #3
	movs r1, #0
	add r2, sp, #0x18
	movs r3, #8
_0223A806:
	adds r5, r7, r1
	ldrsb r5, [r5, r3]
	adds r1, r1, #1
	cmp r1, #3
	stm r2!, {r5}
	blt _0223A806
	movs r1, #0
	mvns r1, r1
	cmp r6, r1
	beq _0223A824
	movs r1, #4
	ldrsh r1, [r7, r1]
	lsls r2, r1, #2
	add r1, sp, #0x18
	str r6, [r1, r2]
_0223A824:
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r5, r1, #0
	add r6, sp, #0x18
_0223A82E:
	adds r2, r7, r5
	movs r1, #8
	ldrsb r1, [r2, r1]
	cmp r1, #0
	bne _0223A83E
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _0223A844
_0223A83E:
	ldr r2, [r6]
	cmp r2, #0
	bge _0223A84E
_0223A844:
	movs r1, #0xa
	blx FUN_020F2998
	subs r4, r4, #1
	b _0223A860
_0223A84E:
	movs r1, #1
	ldr r3, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [sp, #4]
	adds r3, r3, #1
	str r3, [sp, #4]
	lsls r1, r1, #2
	add r3, sp, #0xc
	str r2, [r3, r1]
_0223A860:
	adds r5, r5, #1
	adds r6, r6, #4
	cmp r5, #3
	blt _0223A82E
	movs r6, #0
	str r6, [sp]
	cmp r4, #0
	ble _0223A88A
	add r5, sp, #0xc
_0223A872:
	ldr r1, [r5]
	muls r1, r0, r1
	adds r6, r6, r1
	movs r1, #0xa
	blx FUN_020F2998
	ldr r1, [sp]
	adds r5, r5, #4
	adds r1, r1, #1
	str r1, [sp]
	cmp r1, r4
	blt _0223A872
_0223A88A:
	ldrb r0, [r7, #1]
	cmp r6, r0
	ble _0223A898
	movs r0, #0
	add sp, #0x24
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_0223A898:
	adds r0, r6, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov72_0223A7F4

	thumb_func_start ov72_0223A8A0
ov72_0223A8A0: @ 0x0223A8A0
	ldrb r1, [r0, #1]
	cmp r1, #0x64
	beq _0223A8BA
	movs r1, #9
	ldrsb r1, [r0, r1]
	cmp r1, #0
	blt _0223A8D6
	movs r1, #0xa
	ldrsb r0, [r0, r1]
	cmp r0, #0
	blt _0223A8D6
	movs r0, #1
	bx lr
_0223A8BA:
	movs r1, #8
	ldrsb r1, [r0, r1]
	cmp r1, #0
	blt _0223A8D6
	movs r1, #9
	ldrsb r1, [r0, r1]
	cmp r1, #0
	blt _0223A8D6
	movs r1, #0xa
	ldrsb r0, [r0, r1]
	cmp r0, #0
	blt _0223A8D6
	movs r0, #1
	bx lr
_0223A8D6:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov72_0223A8A0

	thumb_func_start ov72_0223A8DC
ov72_0223A8DC: @ 0x0223A8DC
	push {r4, lr}
	adds r4, r0, #0
	bl ov72_0223A8A0
	cmp r0, #0
	beq _0223A8EC
	movs r0, #0xb
	pop {r4, pc}
_0223A8EC:
	ldrb r0, [r4, #3]
	pop {r4, pc}
	thumb_func_end ov72_0223A8DC

	thumb_func_start ov72_0223A8F0
ov72_0223A8F0: @ 0x0223A8F0
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0xf
	bls _0223A8FC
	b _0223AA6A
_0223A8FC:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223A908: @ jump table
	.2byte _0223AA6A - _0223A908 - 2 @ case 0
	.2byte _0223AA6A - _0223A908 - 2 @ case 1
	.2byte _0223AA6A - _0223A908 - 2 @ case 2
	.2byte _0223A928 - _0223A908 - 2 @ case 3
	.2byte _0223A928 - _0223A908 - 2 @ case 4
	.2byte _0223A928 - _0223A908 - 2 @ case 5
	.2byte _0223A928 - _0223A908 - 2 @ case 6
	.2byte _0223A928 - _0223A908 - 2 @ case 7
	.2byte _0223A928 - _0223A908 - 2 @ case 8
	.2byte _0223A928 - _0223A908 - 2 @ case 9
	.2byte _0223A928 - _0223A908 - 2 @ case 10
	.2byte _0223A928 - _0223A908 - 2 @ case 11
	.2byte _0223A928 - _0223A908 - 2 @ case 12
	.2byte _0223A9A2 - _0223A908 - 2 @ case 13
	.2byte _0223A9F4 - _0223A908 - 2 @ case 14
	.2byte _0223AA38 - _0223A908 - 2 @ case 15
_0223A928:
	ldr r0, _0223AA6C @ =0x0000130C
	subs r1, r5, #3
	adds r0, r4, r0
	bl ov72_0223A7F4
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0223A99A
	ldr r1, _0223AA70 @ =0x00001310
	subs r3, r5, #3
	ldrsh r0, [r4, r1]
	adds r2, r4, r0
	adds r0, r1, #4
	strb r3, [r2, r0]
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bge _0223A950
	adds r0, r0, #1
	strh r0, [r4, r1]
_0223A950:
	ldr r2, _0223AA70 @ =0x00001310
	ldr r0, _0223AA74 @ =0x00000E04
	ldrsh r1, [r4, r2]
	adds r2, #0x58
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	bl ov72_02238730
	ldr r0, _0223AA78 @ =0x0000130F
	subs r1, r5, #3
	strb r1, [r4, r0]
	subs r0, r0, #3
	adds r0, r4, r0
	bl ov72_0223A8DC
	ldr r1, _0223AA78 @ =0x0000130F
	strb r0, [r4, r1]
	movs r0, #0xe
	lsls r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AA7C @ =0x000005DC
	bl FUN_0200604C
	subs r0, r5, #3
	lsls r3, r0, #1
	ldr r1, _0223AA80 @ =0x0223B478
	ldr r2, _0223AA84 @ =0x0223B479
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	adds r0, r4, #0
	movs r3, #3
	bl ov72_0223AED0
	pop {r3, r4, r5, pc}
_0223A99A:
	ldr r0, _0223AA88 @ =0x000005F2
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
_0223A9A2:
	ldr r1, _0223AA70 @ =0x00001310
	movs r3, #0
	ldrsh r0, [r4, r1]
	mvns r3, r3
	adds r2, r4, r0
	adds r0, r1, #4
	strb r3, [r2, r0]
	ldrsh r0, [r4, r1]
	subs r0, r0, #1
	strh r0, [r4, r1]
	subs r0, r1, #3
	ldrb r0, [r4, r0]
	cmp r0, #0x64
	ldrsh r0, [r4, r1]
	bne _0223A9CA
	cmp r0, #0
	bge _0223A9D2
	movs r0, #0
	strh r0, [r4, r1]
	b _0223A9D2
_0223A9CA:
	cmp r0, #1
	bge _0223A9D2
	movs r0, #1
	strh r0, [r4, r1]
_0223A9D2:
	ldr r0, _0223AA7C @ =0x000005DC
	bl FUN_0200604C
	ldr r2, _0223AA70 @ =0x00001310
	ldr r0, _0223AA74 @ =0x00000E04
	ldrsh r1, [r4, r2]
	adds r2, #0x58
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	bl ov72_02238730
	ldr r0, _0223AA8C @ =0x00000E08
	movs r1, #5
	ldr r0, [r4, r0]
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
_0223A9F4:
	ldr r1, _0223AA78 @ =0x0000130F
	subs r0, r5, #3
	strb r0, [r4, r1]
	movs r0, #0xe
	lsls r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AA6C @ =0x0000130C
	movs r1, #0
	adds r0, r4, r0
	mvns r1, r1
	bl ov72_0223A7F4
	ldr r1, _0223AA90 @ =0x0000130E
	strb r0, [r4, r1]
	ldrsb r0, [r4, r1]
	cmp r0, #0
	bgt _0223AA20
	movs r0, #1
	strb r0, [r4, r1]
_0223AA20:
	ldr r0, _0223AA94 @ =0x00001312
	movs r1, #7
	strb r1, [r4, r0]
	ldr r0, _0223AA7C @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _0223AA98 @ =0x00000E0C
	movs r1, #5
	ldr r0, [r4, r0]
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
_0223AA38:
	ldr r1, _0223AA78 @ =0x0000130F
	subs r0, r5, #3
	movs r2, #0
	strb r0, [r4, r1]
	mvns r2, r2
	subs r0, r1, #1
	strb r2, [r4, r0]
	movs r0, #0xe
	lsls r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AA94 @ =0x00001312
	movs r1, #7
	strb r1, [r4, r0]
	ldr r0, _0223AA7C @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0xe1
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #5
	bl FUN_020248F0
_0223AA6A:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223AA6C: .4byte 0x0000130C
_0223AA70: .4byte 0x00001310
_0223AA74: .4byte 0x00000E04
_0223AA78: .4byte 0x0000130F
_0223AA7C: .4byte 0x000005DC
_0223AA80: .4byte 0x0223B478
_0223AA84: .4byte 0x0223B479
_0223AA88: .4byte 0x000005F2
_0223AA8C: .4byte 0x00000E08
_0223AA90: .4byte 0x0000130E
_0223AA94: .4byte 0x00001312
_0223AA98: .4byte 0x00000E0C
	thumb_func_end ov72_0223A8F0

	thumb_func_start ov72_0223AA9C
ov72_0223AA9C: @ 0x0223AA9C
	push {r4, lr}
	ldr r1, _0223AB78 @ =0x021D110C
	movs r3, #0x40
	ldr r2, [r1, #0x4c]
	adds r4, r0, #0
	tst r3, r2
	beq _0223AAD0
	ldr r2, _0223AB7C @ =0x0000130F
	movs r1, #0
	ldrb r0, [r4, r2]
	adds r2, #0x55
	adds r2, r4, r2
	bl ov72_0223A760
	ldr r1, _0223AB7C @ =0x0000130F
	strb r0, [r4, r1]
	movs r0, #0xe
	lsls r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AB80 @ =0x000005DC
	bl FUN_0200604C
	b _0223AB74
_0223AAD0:
	movs r3, #0x80
	tst r3, r2
	beq _0223AAFC
	ldr r2, _0223AB7C @ =0x0000130F
	movs r1, #1
	ldrb r0, [r4, r2]
	adds r2, #0x55
	adds r2, r4, r2
	bl ov72_0223A760
	ldr r1, _0223AB7C @ =0x0000130F
	strb r0, [r4, r1]
	movs r0, #0xe
	lsls r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AB80 @ =0x000005DC
	bl FUN_0200604C
	b _0223AB74
_0223AAFC:
	movs r3, #0x20
	tst r3, r2
	beq _0223AB28
	ldr r2, _0223AB7C @ =0x0000130F
	movs r1, #2
	ldrb r0, [r4, r2]
	adds r2, #0x55
	adds r2, r4, r2
	bl ov72_0223A760
	ldr r1, _0223AB7C @ =0x0000130F
	strb r0, [r4, r1]
	movs r0, #0xe
	lsls r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AB80 @ =0x000005DC
	bl FUN_0200604C
	b _0223AB74
_0223AB28:
	movs r3, #0x10
	tst r2, r3
	beq _0223AB54
	ldr r2, _0223AB7C @ =0x0000130F
	movs r1, #3
	ldrb r0, [r4, r2]
	adds r2, #0x55
	adds r2, r4, r2
	bl ov72_0223A760
	ldr r1, _0223AB7C @ =0x0000130F
	strb r0, [r4, r1]
	movs r0, #0xe
	lsls r0, r0, #8
	ldrb r1, [r4, r1]
	ldr r0, [r4, r0]
	bl ov72_022386F4
	ldr r0, _0223AB80 @ =0x000005DC
	bl FUN_0200604C
	b _0223AB74
_0223AB54:
	ldr r2, [r1, #0x48]
	movs r1, #1
	tst r1, r2
	beq _0223AB68
	ldr r1, _0223AB7C @ =0x0000130F
	ldrb r1, [r4, r1]
	adds r1, r1, #3
	bl ov72_0223A8F0
	b _0223AB74
_0223AB68:
	movs r1, #2
	tst r1, r2
	beq _0223AB74
	movs r1, #0xd
	bl ov72_0223A8F0
_0223AB74:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0223AB78: .4byte 0x021D110C
_0223AB7C: .4byte 0x0000130F
_0223AB80: .4byte 0x000005DC
	thumb_func_end ov72_0223AA9C

	thumb_func_start ov72_0223AB84
ov72_0223AB84: @ 0x0223AB84
	push {r4, lr}
	adds r4, r0, #0
	bl ov72_0223A738
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	bne _0223AB9E
	adds r0, r4, #0
	bl ov72_0223AA9C
	b _0223ABA4
_0223AB9E:
	adds r0, r4, #0
	bl ov72_0223A8F0
_0223ABA4:
	adds r0, r4, #0
	bl ov72_0223ABB0
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov72_0223AB84

	thumb_func_start ov72_0223ABB0
ov72_0223ABB0: @ 0x0223ABB0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
	subs r7, r4, #1
_0223ABBA:
	ldr r0, _0223ABEC @ =0x00001314
	adds r1, r6, r4
	ldrsb r1, [r1, r0]
	cmp r1, r7
	bne _0223ABD0
	ldr r0, _0223ABF0 @ =0x00000DF4
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_020248F0
	b _0223ABE2
_0223ABD0:
	cmp r1, #0
	blt _0223ABE2
	cmp r1, #9
	bgt _0223ABE2
	ldr r0, _0223ABF0 @ =0x00000DF4
	adds r1, r1, #1
	ldr r0, [r5, r0]
	bl FUN_020248F0
_0223ABE2:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _0223ABBA
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223ABEC: .4byte 0x00001314
_0223ABF0: .4byte 0x00000DF4
	thumb_func_end ov72_0223ABB0

	thumb_func_start ov72_0223ABF4
ov72_0223ABF4: @ 0x0223ABF4
	movs r0, #0
	bx lr
	thumb_func_end ov72_0223ABF4

	thumb_func_start ov72_0223ABF8
ov72_0223ABF8: @ 0x0223ABF8
	movs r0, #0
	bx lr
	thumb_func_end ov72_0223ABF8

	thumb_func_start ov72_0223ABFC
ov72_0223ABFC: @ 0x0223ABFC
	movs r0, #0
	bx lr
	thumb_func_end ov72_0223ABFC

	thumb_func_start ov72_0223AC00
ov72_0223AC00: @ 0x0223AC00
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #0x43
	str r1, [sp, #8]
	movs r1, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
	ldr r0, _0223AC28 @ =0x00001312
	movs r1, #8
	strb r1, [r4, r0]
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0223AC28: .4byte 0x00001312
	thumb_func_end ov72_0223AC00

	thumb_func_start ov72_0223AC2C
ov72_0223AC2C: @ 0x0223AC2C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223AC62
	adds r0, r4, #0
	bl ov72_0223AD94
	adds r0, r4, #0
	movs r1, #0
	bl ov72_02238B18
	movs r0, #4
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r2, #0x43
	str r2, [sp, #8]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	ldr r0, _0223AC68 @ =0x00001312
	movs r1, #9
	strb r1, [r4, r0]
_0223AC62:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0223AC68: .4byte 0x00001312
	thumb_func_end ov72_0223AC2C

	thumb_func_start ov72_0223AC6C
ov72_0223AC6C: @ 0x0223AC6C
	push {r4, lr}
	adds r4, r0, #0
	bl ov72_0223AE6C
	cmp r0, #0
	bne _0223AC80
	ldr r0, _0223AC84 @ =0x00001313
	ldrb r1, [r4, r0]
	subs r0, r0, #1
	strb r1, [r4, r0]
_0223AC80:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0223AC84: .4byte 0x00001313
	thumb_func_end ov72_0223AC6C

	thumb_func_start ov72_0223AC88
ov72_0223AC88: @ 0x0223AC88
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223AC9A
	ldr r0, _0223ACA0 @ =0x00001312
	movs r1, #0xb
	strb r1, [r4, r0]
_0223AC9A:
	movs r0, #0
	pop {r4, pc}
	nop
_0223ACA0: .4byte 0x00001312
	thumb_func_end ov72_0223AC88

	thumb_func_start ov72_0223ACA4
ov72_0223ACA4: @ 0x0223ACA4
	movs r0, #1
	bx lr
	thumb_func_end ov72_0223ACA4

	thumb_func_start ov72_0223ACA8
ov72_0223ACA8: @ 0x0223ACA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r1, _0223AD14 @ =0x00001328
	ldr r5, _0223AD18 @ =0x0223B46C
	str r0, [sp, #0x14]
	movs r7, #0
	movs r4, #0x1f
	adds r6, r0, r1
_0223ACB8:
	movs r0, #0x15
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [r5]
	ldr r0, [r0, #4]
	lsls r3, r3, #0x18
	adds r1, r6, #0
	movs r2, #4
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r7, r7, #1
	adds r4, #0x40
	adds r5, r5, #4
	adds r6, #0x10
	cmp r7, #3
	blt _0223ACB8
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r2, #4
	str r2, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x4f
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, _0223AD1C @ =0x00001318
	ldr r1, [sp, #0x14]
	ldr r0, [r0, #4]
	adds r1, r1, r3
	movs r3, #2
	bl FUN_0201D40C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223AD14: .4byte 0x00001328
_0223AD18: .4byte 0x0223B46C
_0223AD1C: .4byte 0x00001318
	thumb_func_end ov72_0223ACA8

	thumb_func_start ov72_0223AD20
ov72_0223AD20: @ 0x0223AD20
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	ldr r0, _0223AD60 @ =0x000F0200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #4
	adds r2, r4, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_0201D578
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223AD60: .4byte 0x000F0200
	thumb_func_end ov72_0223AD20

	thumb_func_start ov72_0223AD64
ov72_0223AD64: @ 0x0223AD64
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0223AD8C @ =0x00001328
	movs r4, #0
	adds r5, r6, r0
_0223AD6E:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _0223AD6E
	ldr r0, _0223AD90 @ =0x00001318
	adds r0, r6, r0
	bl FUN_0201D520
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223AD8C: .4byte 0x00001328
_0223AD90: .4byte 0x00001318
	thumb_func_end ov72_0223AD64

	thumb_func_start ov72_0223AD94
ov72_0223AD94: @ 0x0223AD94
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov72_0223AD64
	ldr r0, _0223AE08 @ =0x00000DF4
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
	ldr r0, _0223AE0C @ =0x00000DF8
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
	ldr r0, _0223AE10 @ =0x00000DFC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
	movs r0, #0xe
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	ldr r0, _0223AE14 @ =0x00000E04
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
	ldr r0, _0223AE18 @ =0x00000E08
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
	ldr r0, _0223AE1C @ =0x00000E0C
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
	movs r0, #0xe1
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r4, #0
	ldr r6, _0223AE08 @ =0x00000DF4
	adds r7, r4, #0
_0223ADF6:
	ldr r0, [r5, r6]
	adds r1, r7, #0
	bl FUN_020248F0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _0223ADF6
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223AE08: .4byte 0x00000DF4
_0223AE0C: .4byte 0x00000DF8
_0223AE10: .4byte 0x00000DFC
_0223AE14: .4byte 0x00000E04
_0223AE18: .4byte 0x00000E08
_0223AE1C: .4byte 0x00000E0C
	thumb_func_end ov72_0223AD94

	thumb_func_start ov72_0223AE20
ov72_0223AE20: @ 0x0223AE20
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0223AE64 @ =0x00001358
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0223AE42
	ldrb r0, [r4, #2]
	lsls r0, r0, #2
	adds r2, r5, r0
	ldr r0, _0223AE68 @ =0x00000DF4
	ldr r0, [r2, r0]
	bl FUN_020248F0
	add sp, #0xc
	pop {r4, r5, pc}
_0223AE42:
	ldrb r0, [r4, #4]
	str r0, [sp]
	ldrb r0, [r4, #5]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #6]
	ldrb r3, [r4, #7]
	ldr r0, [r5, #4]
	bl FUN_0201CA4C
	ldrb r1, [r4, #2]
	ldr r0, [r5, #4]
	bl FUN_0201EFBC
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0223AE64: .4byte 0x00001358
_0223AE68: .4byte 0x00000DF4
	thumb_func_end ov72_0223AE20

	thumb_func_start ov72_0223AE6C
ov72_0223AE6C: @ 0x0223AE6C
	push {r4, lr}
	ldr r1, _0223AECC @ =0x00001358
	adds r4, r0, r1
	ldrb r1, [r4, #1]
	cmp r1, #0
	beq _0223AE82
	cmp r1, #1
	beq _0223AE94
	cmp r1, #2
	beq _0223AEB6
	b _0223AEC6
_0223AE82:
	ldrh r1, [r4, #8]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov72_0223AE20
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	b _0223AEC6
_0223AE94:
	ldrb r1, [r4, #3]
	adds r1, r1, #1
	strb r1, [r4, #3]
	ldrb r1, [r4, #3]
	cmp r1, #4
	bne _0223AEC6
	ldrh r1, [r4, #0xa]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov72_0223AE20
	movs r0, #0
	strb r0, [r4, #3]
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	b _0223AEC6
_0223AEB6:
	ldrb r0, [r4, #3]
	adds r0, r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	cmp r0, #2
	bne _0223AEC6
	movs r0, #0
	pop {r4, pc}
_0223AEC6:
	movs r0, #1
	pop {r4, pc}
	nop
_0223AECC: .4byte 0x00001358
	thumb_func_end ov72_0223AE6C

	thumb_func_start ov72_0223AED0
ov72_0223AED0: @ 0x0223AED0
	push {r4, r5, r6, r7}
	ldr r4, _0223AF18 @ =0x00001358
	movs r5, #1
	strb r5, [r0, r4]
	movs r5, #0
	adds r6, r4, #3
	strb r5, [r0, r6]
	adds r6, r4, #1
	strb r5, [r0, r6]
	movs r7, #5
	adds r6, r4, #2
	strb r7, [r0, r6]
	adds r7, r4, #0
	adds r7, #8
	movs r6, #1
	strh r6, [r0, r7]
	adds r6, r4, #0
	adds r6, #0xa
	strh r5, [r0, r6]
	adds r5, r4, #6
	strb r1, [r0, r5]
	adds r1, r4, #7
	strb r2, [r0, r1]
	movs r2, #6
	adds r1, r4, #4
	strb r2, [r0, r1]
	adds r1, r4, #5
	strb r2, [r0, r1]
	adds r1, r4, #0
	subs r1, #0x45
	strb r3, [r0, r1]
	movs r1, #0xa
	subs r4, #0x46
	strb r1, [r0, r4]
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_0223AF18: .4byte 0x00001358
	thumb_func_end ov72_0223AED0

	thumb_func_start ov72_0223AF1C
ov72_0223AF1C: @ 0x0223AF1C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	movs r2, #0
	adds r1, #0x2d
	strb r2, [r1]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r2, [r1]
	adds r1, r4, #0
	adds r1, #0x33
	strb r2, [r1]
	bl ov72_0223B0C4
	adds r0, r4, #0
	bl ov72_0223B1C8
	adds r0, r4, #0
	bl ov72_0223B2E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov72_0223AF1C

	thumb_func_start ov72_0223AF48
ov72_0223AF48: @ 0x0223AF48
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r2, r1, #2
	ldr r1, _0223AF6C @ =0x0223B7FC
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #1
	bne _0223AF66
	adds r4, #0x33
	ldrb r0, [r4]
	adds r0, r0, #1
	pop {r4, pc}
_0223AF66:
	movs r0, #0
	pop {r4, pc}
	nop
_0223AF6C: .4byte 0x0223B7FC
	thumb_func_end ov72_0223AF48

	thumb_func_start ov72_0223AF70
ov72_0223AF70: @ 0x0223AF70
	movs r1, #1
	adds r0, #0x2d
	strb r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov72_0223AF70

	thumb_func_start ov72_0223AF7C
ov72_0223AF7C: @ 0x0223AF7C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0223B078 @ =0x0223B4C8
	bl FUN_02025224
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _0223AFE6
	ldr r0, _0223B07C @ =0x000005DC
	bl FUN_0200604C
	cmp r5, #0
	bne _0223AFBE
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x33
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov72_0223B2FC
	ldr r0, [r4, #4]
	movs r1, #3
	bl FUN_020248F0
	movs r0, #3
	adds r4, #0x2d
	strb r0, [r4]
	b _0223B074
_0223AFBE:
	cmp r5, #1
	bne _0223B074
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x33
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov72_0223B2FC
	ldr r0, [r4, #4]
	movs r1, #3
	bl FUN_020248F0
	movs r0, #3
	adds r4, #0x2d
	strb r0, [r4]
	b _0223B074
_0223AFE6:
	ldr r0, _0223B080 @ =0x021D110C
	movs r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _0223B00A
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x33
	strb r1, [r0]
	adds r0, r4, #0
	adds r4, #0x33
	ldrb r1, [r4]
	bl ov72_0223B2FC
	ldr r0, _0223B07C @ =0x000005DC
	bl FUN_0200604C
	b _0223B074
_0223B00A:
	movs r1, #0x80
	tst r1, r0
	beq _0223B02A
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x33
	strb r1, [r0]
	adds r0, r4, #0
	adds r4, #0x33
	ldrb r1, [r4]
	bl ov72_0223B2FC
	ldr r0, _0223B07C @ =0x000005DC
	bl FUN_0200604C
	b _0223B074
_0223B02A:
	movs r2, #1
	adds r1, r0, #0
	tst r1, r2
	beq _0223B048
	ldr r0, [r4, #4]
	movs r1, #3
	bl FUN_020248F0
	movs r0, #3
	adds r4, #0x2d
	strb r0, [r4]
	ldr r0, _0223B07C @ =0x000005DC
	bl FUN_0200604C
	b _0223B074
_0223B048:
	movs r1, #2
	tst r0, r1
	beq _0223B074
	adds r0, r4, #0
	adds r0, #0x33
	adds r1, r4, #0
	strb r2, [r0]
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov72_0223B2FC
	adds r0, r4, #0
	movs r1, #3
	adds r0, #0x2d
	strb r1, [r0]
	ldr r0, [r4, #4]
	bl FUN_020248F0
	ldr r0, _0223B07C @ =0x000005DC
	bl FUN_0200604C
_0223B074:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223B078: .4byte 0x0223B4C8
_0223B07C: .4byte 0x000005DC
_0223B080: .4byte 0x021D110C
	thumb_func_end ov72_0223AF7C

	thumb_func_start ov72_0223B084
ov72_0223B084: @ 0x0223B084
	movs r0, #0
	bx lr
	thumb_func_end ov72_0223B084

	thumb_func_start ov72_0223B088
ov72_0223B088: @ 0x0223B088
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl FUN_02024B68
	cmp r0, #0
	beq _0223B09A
	movs r0, #0
	pop {r4, pc}
_0223B09A:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	movs r1, #0
	bl FUN_0201BC28
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	movs r1, #0
	bl FUN_0201BC28
	adds r0, r4, #0
	bl ov72_0223B2C0
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_02024830
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov72_0223B088

	thumb_func_start ov72_0223B0C4
ov72_0223B0C4: @ 0x0223B0C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r1, [r4, #0x28]
	movs r0, #0xef
	bl FUN_02007688
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	str r0, [sp, #0x14]
	cmp r1, #3
	bhi _0223B108
	movs r1, #0x20
	str r1, [sp]
	ldr r1, [r4, #0x28]
	adds r3, r4, #0
	str r1, [sp, #4]
	adds r3, #0x2e
	ldrb r3, [r3]
	movs r1, #0
	adds r2, r1, #0
	lsls r3, r3, #5
	bl FUN_02007B8C
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r2, [r4, #0x28]
	movs r0, #0
	lsls r1, r1, #5
	bl FUN_02003030
	b _0223B130
_0223B108:
	movs r1, #0x20
	str r1, [sp]
	ldr r1, [r4, #0x28]
	adds r3, r4, #0
	str r1, [sp, #4]
	adds r3, #0x2e
	ldrb r3, [r3]
	movs r1, #0
	movs r2, #4
	lsls r3, r3, #5
	bl FUN_02007B8C
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r2, [r4, #0x28]
	movs r0, #4
	lsls r1, r1, #5
	bl FUN_02003030
_0223B130:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x28]
	adds r3, r4, #0
	str r0, [sp, #0xc]
	adds r3, #0x2f
	ldrb r3, [r3]
	ldr r0, [sp, #0x14]
	ldr r2, [r4]
	movs r1, #1
	bl FUN_02007B44
	ldr r0, [r4, #0x28]
	movs r1, #0xa
	str r0, [sp]
	ldr r0, [sp, #0x14]
	movs r2, #0
	add r3, sp, #0x18
	bl FUN_02007C2C
	adds r1, r4, #0
	adds r1, #0x2f
	str r0, [sp, #0x10]
	ldrb r1, [r1]
	ldr r0, [r4]
	bl FUN_0201CC08
	ldr r2, [sp, #0x18]
	movs r5, #3
	ldr r7, _0223B1C4 @ =0x00000FFF
	adds r3, r0, #0
	movs r1, #0
	adds r2, #0xc
	lsls r5, r5, #8
_0223B178:
	adds r0, r4, #0
	adds r0, #0x2e
	ldrh r6, [r2]
	ldrb r0, [r0]
	adds r1, r1, #1
	ands r6, r7
	lsls r0, r0, #0xc
	orrs r0, r6
	strh r0, [r3]
	adds r2, r2, #2
	adds r3, r3, #2
	cmp r1, r5
	blt _0223B178
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	ldr r0, [r4]
	bl FUN_0201BF7C
	ldr r0, [sp, #0x10]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x14]
	bl FUN_0200770C
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	movs r1, #1
	bl FUN_0201BC28
	adds r4, #0x32
	ldrb r0, [r4]
	movs r1, #1
	bl FUN_0201BC28
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223B1C4: .4byte 0x00000FFF
	thumb_func_end ov72_0223B0C4

	thumb_func_start ov72_0223B1C8
ov72_0223B1C8: @ 0x0223B1C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r3, [r5, #0x28]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xbf
	bl FUN_0200BAF8
	adds r4, r0, #0
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r2, r5, #0
	adds r1, r5, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	adds r2, #0x32
	adds r1, #8
	str r0, [sp, #0x10]
	ldrb r2, [r2]
	ldr r0, [r5]
	movs r3, #0xc
	bl FUN_0201D40C
	adds r0, r5, #0
	adds r0, #8
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0xe
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r2, r5, #0
	adds r1, r5, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	adds r2, #0x32
	adds r1, #0x18
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrb r2, [r2]
	ldr r0, [r5]
	movs r3, #0xc
	bl FUN_0201D40C
	adds r0, r5, #0
	adds r0, #0x18
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	movs r1, #0x2e
	bl FUN_0200BBA0
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #0x2f
	bl FUN_0200BBA0
	movs r3, #0
	adds r7, r0, #0
	str r3, [sp]
	ldr r0, _0223B2BC @ =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #8
	movs r1, #4
	adds r2, r6, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	movs r3, #0
	str r3, [sp]
	ldr r0, _0223B2BC @ =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x18
	movs r1, #4
	adds r2, r7, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	adds r0, #8
	bl FUN_0201D578
	adds r5, #0x18
	adds r0, r5, #0
	bl FUN_0201D578
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0200BB44
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0223B2BC: .4byte 0x000F0100
	thumb_func_end ov72_0223B1C8

	thumb_func_start ov72_0223B2C0
ov72_0223B2C0: @ 0x0223B2C0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x18
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #8
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_0201D520
	adds r4, #8
	adds r0, r4, #0
	bl FUN_0201D520
	pop {r4, pc}
	thumb_func_end ov72_0223B2C0

	thumb_func_start ov72_0223B2E4
ov72_0223B2E4: @ 0x0223B2E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_02024830
	adds r0, r4, #0
	adds r4, #0x2c
	ldrb r1, [r4]
	bl ov72_0223B2FC
	pop {r4, pc}
	thumb_func_end ov72_0223B2E4

	thumb_func_start ov72_0223B2FC
ov72_0223B2FC: @ 0x0223B2FC
	push {lr}
	sub sp, #0xc
	lsls r3, r1, #2
	ldr r1, _0223B328 @ =0x0223B4C0
	ldrh r1, [r1, r3]
	lsls r1, r1, #0xc
	str r1, [sp]
	ldr r1, _0223B32C @ =0x0223B4C2
	ldr r2, [r0, #0x34]
	ldrh r1, [r1, r3]
	adds r1, r2, r1
	lsls r1, r1, #0xc
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, [r0, #4]
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {pc}
	nop
_0223B328: .4byte 0x0223B4C0
_0223B32C: .4byte 0x0223B4C2
	thumb_func_end ov72_0223B2FC

	.rodata

_0223B330:
	.byte 0x00, 0x17, 0x0D, 0x07, 0x04, 0x0D, 0x00, 0x00, 0x28, 0x00, 0xB0, 0x00, 0x80, 0x00, 0xB0, 0x00
	.byte 0xD8, 0x00, 0xB0, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x43, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x1D, 0x00, 0x80, 0x00, 0x1D, 0x00, 0xA0, 0x00, 0x1D, 0x00
	.byte 0x50, 0x00, 0x1D, 0x00, 0x70, 0x00, 0x1D, 0x00, 0x90, 0x00, 0x1D, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x20, 0x00, 0x51, 0x00, 0x50, 0x00, 0x51, 0x00, 0x80, 0x00, 0x51, 0x00
	.byte 0xAE, 0x00, 0x51, 0x00, 0xE0, 0x00, 0x51, 0x00, 0x20, 0x00, 0x80, 0x00, 0x50, 0x00, 0x80, 0x00
	.byte 0x80, 0x00, 0x80, 0x00, 0xAE, 0x00, 0x80, 0x00, 0xE0, 0x00, 0x80, 0x00, 0x28, 0x00, 0xB0, 0x00
	.byte 0x80, 0x00, 0xB0, 0x00, 0xD8, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x06, 0x00, 0x01, 0x08, 0x09, 0x03, 0x04, 0x01, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x01, 0x07, 0x07, 0x07, 0x0D, 0x07, 0x13, 0x07
	.byte 0x19, 0x07, 0x01, 0x0D, 0x07, 0x0D, 0x0D, 0x0D, 0x13, 0x0D, 0x19, 0x0D, 0x0A, 0x05, 0x04, 0x01
	.byte 0x0A, 0x06, 0x00, 0x02, 0x0B, 0x07, 0x01, 0x03, 0x0C, 0x08, 0x02, 0x04, 0x0C, 0x09, 0x03, 0x00
	.byte 0x00, 0x0A, 0x09, 0x06, 0x01, 0x0A, 0x05, 0x07, 0x02, 0x0B, 0x06, 0x08, 0x03, 0x0C, 0x07, 0x09
	.byte 0x04, 0x0C, 0x08, 0x05, 0x0D, 0x0E, 0x0C, 0x0B, 0x07, 0x02, 0x0A, 0x0C, 0x0F, 0x10, 0x0B, 0x0A
	.byte 0x80, 0x00, 0x48, 0x00, 0x80, 0x00, 0x78, 0x00, 0x32, 0x5C, 0x03, 0xFB, 0x63, 0x8C, 0x03, 0xFB
	.byte 0xFF, 0x00, 0x00, 0x00

	.data

_0223B4E0:
	.byte 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x67, 0x61, 0x6D, 0x65, 0x73, 0x74, 0x61, 0x74, 0x73
	.byte 0x32, 0x2E, 0x67, 0x73, 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x77, 0x69, 0x66
	.byte 0x69, 0x2E, 0x6E, 0x65, 0x74, 0x2F, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F, 0x6E, 0x64, 0x70, 0x64
	.byte 0x73, 0x2F, 0x62, 0x61, 0x74, 0x74, 0x6C, 0x65, 0x74, 0x6F, 0x77, 0x65, 0x72, 0x2F, 0x72, 0x6F
	.byte 0x6F, 0x6D, 0x6E, 0x75, 0x6D, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00, 0x00, 0x68, 0x74, 0x74, 0x70
	.byte 0x3A, 0x2F, 0x2F, 0x67, 0x61, 0x6D, 0x65, 0x73, 0x74, 0x61, 0x74, 0x73, 0x32, 0x2E, 0x67, 0x73
	.byte 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x77, 0x69, 0x66, 0x69, 0x2E, 0x6E, 0x65
	.byte 0x74, 0x2F, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F, 0x6E, 0x64, 0x70, 0x64, 0x73, 0x2F, 0x62, 0x61
	.byte 0x74, 0x74, 0x6C, 0x65, 0x74, 0x6F, 0x77, 0x65, 0x72, 0x2F, 0x64, 0x6F, 0x77, 0x6E, 0x6C, 0x6F
	.byte 0x61, 0x64, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00, 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x67
	.byte 0x61, 0x6D, 0x65, 0x73, 0x74, 0x61, 0x74, 0x73, 0x32, 0x2E, 0x67, 0x73, 0x2E, 0x6E, 0x69, 0x6E
	.byte 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x77, 0x69, 0x66, 0x69, 0x2E, 0x6E, 0x65, 0x74, 0x2F, 0x70, 0x6F
	.byte 0x6B, 0x65, 0x6D, 0x6F, 0x6E, 0x64, 0x70, 0x64, 0x73, 0x2F, 0x62, 0x61, 0x74, 0x74, 0x6C, 0x65
	.byte 0x74, 0x6F, 0x77, 0x65, 0x72, 0x2F, 0x75, 0x70, 0x6C, 0x6F, 0x61, 0x64, 0x2E, 0x61, 0x73, 0x70
	.byte 0x00, 0x00, 0x00, 0x00, 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x67, 0x61, 0x6D, 0x65, 0x73
	.byte 0x74, 0x61, 0x74, 0x73, 0x32, 0x2E, 0x67, 0x73, 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64
	.byte 0x6F, 0x77, 0x69, 0x66, 0x69, 0x2E, 0x6E, 0x65, 0x74, 0x2F, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F
	.byte 0x6E, 0x64, 0x70, 0x64, 0x73, 0x2F, 0x62, 0x61, 0x74, 0x74, 0x6C, 0x65, 0x74, 0x6F, 0x77, 0x65
	.byte 0x72, 0x2F, 0x69, 0x6E, 0x66, 0x6F, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00, 0x68, 0x74, 0x74, 0x70
	.byte 0x3A, 0x2F, 0x2F, 0x67, 0x61, 0x6D, 0x65, 0x73, 0x74, 0x61, 0x74, 0x73, 0x32, 0x2E, 0x67, 0x73
	.byte 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x77, 0x69, 0x66, 0x69, 0x2E, 0x6E, 0x65
	.byte 0x74, 0x2F, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F, 0x6E, 0x64, 0x70, 0x64, 0x73, 0x2F, 0x63, 0x6F
	.byte 0x6D, 0x6D, 0x6F, 0x6E, 0x2F, 0x73, 0x65, 0x74, 0x50, 0x72, 0x6F, 0x66, 0x69, 0x6C, 0x65, 0x2E
	.byte 0x61, 0x73, 0x70, 0x00, 0x6D, 0x88, 0x23, 0x02, 0x4D, 0x89, 0x23, 0x02, 0x7D, 0x89, 0x23, 0x02
	.byte 0xD9, 0x90, 0x23, 0x02, 0x09, 0x91, 0x23, 0x02, 0xE9, 0x91, 0x23, 0x02, 0x21, 0x92, 0x23, 0x02
	.byte 0xAD, 0x92, 0x23, 0x02, 0xBD, 0x92, 0x23, 0x02, 0x71, 0x93, 0x23, 0x02, 0xB1, 0x93, 0x23, 0x02
	.byte 0xCD, 0x93, 0x23, 0x02, 0xA5, 0x94, 0x23, 0x02, 0xD9, 0x94, 0x23, 0x02, 0x15, 0x96, 0x23, 0x02
	.byte 0x39, 0x96, 0x23, 0x02, 0xE9, 0x96, 0x23, 0x02, 0x61, 0x97, 0x23, 0x02, 0x85, 0x97, 0x23, 0x02
	.byte 0xE9, 0x97, 0x23, 0x02, 0x8D, 0x98, 0x23, 0x02, 0xBD, 0x98, 0x23, 0x02, 0xCD, 0x99, 0x23, 0x02
	.byte 0x5D, 0x98, 0x23, 0x02, 0xD5, 0x9E, 0x23, 0x02, 0x05, 0x9F, 0x23, 0x02, 0x31, 0x9F, 0x23, 0x02
	.byte 0x61, 0x9F, 0x23, 0x02, 0x09, 0x9A, 0x23, 0x02, 0x3D, 0x9A, 0x23, 0x02, 0x89, 0x9A, 0x23, 0x02
	.byte 0x5D, 0x9B, 0x23, 0x02, 0x99, 0x9B, 0x23, 0x02, 0xC9, 0x9B, 0x23, 0x02, 0xED, 0x9B, 0x23, 0x02
	.byte 0x15, 0x9C, 0x23, 0x02, 0x8D, 0x9C, 0x23, 0x02, 0xB5, 0x9C, 0x23, 0x02, 0xD9, 0x9C, 0x23, 0x02
	.byte 0x3D, 0x9D, 0x23, 0x02, 0x6D, 0x9D, 0x23, 0x02, 0x59, 0x9E, 0x23, 0x02, 0x9D, 0x9E, 0x23, 0x02
	.byte 0xB5, 0x9E, 0x23, 0x02, 0x8D, 0x9F, 0x23, 0x02, 0xBD, 0x9F, 0x23, 0x02, 0xD9, 0x9F, 0x23, 0x02
	.byte 0x11, 0xA0, 0x23, 0x02, 0x95, 0x9E, 0x23, 0x02, 0x15, 0xA0, 0x23, 0x02, 0xAD, 0xA1, 0x23, 0x02
	.byte 0x01, 0xA2, 0x23, 0x02, 0xCD, 0xA1, 0x23, 0x02, 0x45, 0xA0, 0x23, 0x02, 0x69, 0x91, 0x23, 0x02
	.byte 0x99, 0x91, 0x23, 0x02, 0x6D, 0xA0, 0x23, 0x02, 0xE1, 0xA0, 0x23, 0x02, 0xE9, 0xA2, 0x23, 0x02
	.byte 0x15, 0xA3, 0x23, 0x02, 0xB5, 0xA5, 0x23, 0x02, 0xE1, 0xA5, 0x23, 0x02, 0x1D, 0xA7, 0x23, 0x02
	.byte 0x85, 0xAB, 0x23, 0x02, 0xF5, 0xAB, 0x23, 0x02, 0xF9, 0xAB, 0x23, 0x02, 0xFD, 0xAB, 0x23, 0x02
	.byte 0x01, 0xAC, 0x23, 0x02, 0x2D, 0xAC, 0x23, 0x02, 0x89, 0xAC, 0x23, 0x02, 0x6D, 0xAC, 0x23, 0x02
	.byte 0xA5, 0xAC, 0x23, 0x02, 0x0E, 0x2F, 0x58, 0x77, 0x0E, 0x2F, 0x78, 0x97, 0x0E, 0x2F, 0x98, 0xB7
	.byte 0x3C, 0x63, 0x0C, 0x33, 0x3C, 0x63, 0x3C, 0x63, 0x3C, 0x63, 0x6C, 0x93, 0x3C, 0x63, 0x9E, 0xC3
	.byte 0x3C, 0x63, 0xCC, 0xF3, 0x6C, 0x93, 0x0C, 0x33, 0x6C, 0x93, 0x3C, 0x63, 0x6C, 0x93, 0x6C, 0x93
	.byte 0x6C, 0x93, 0x9E, 0xC3, 0x6C, 0x93, 0xCC, 0xF3, 0xA4, 0xBB, 0x04, 0x4B, 0xA4, 0xBB, 0x5C, 0xA3
	.byte 0xA4, 0xBB, 0xB4, 0xFB, 0xFF, 0x00, 0x00, 0x00, 0x0E, 0x2F, 0x48, 0x67, 0x0E, 0x2F, 0x68, 0x87
	.byte 0x0E, 0x2F, 0x88, 0xA7, 0x3C, 0x63, 0x0C, 0x33, 0x3C, 0x63, 0x3C, 0x63, 0x3C, 0x63, 0x6C, 0x93
	.byte 0x3C, 0x63, 0x9E, 0xC3, 0x3C, 0x63, 0xCC, 0xF3, 0x6C, 0x93, 0x0C, 0x33, 0x6C, 0x93, 0x3C, 0x63
	.byte 0x6C, 0x93, 0x6C, 0x93, 0x6C, 0x93, 0x9E, 0xC3, 0x6C, 0x93, 0xCC, 0xF3, 0xA4, 0xBB, 0x04, 0x4B
	.byte 0xA4, 0xBB, 0x5C, 0xA3, 0xA4, 0xBB, 0xB4, 0xFB, 0xFF, 0x00, 0x00, 0x00, 0x71, 0xAF, 0x23, 0x02
	.byte 0x7D, 0xAF, 0x23, 0x02, 0x85, 0xB0, 0x23, 0x02, 0x89, 0xB0, 0x23, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_0223B820:
	.space 0x120
