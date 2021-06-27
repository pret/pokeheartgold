
	thumb_func_start ov71_02246960
ov71_02246960: @ 0x02246960
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl FUN_0200FB5C
	cmp r0, #0
	bne _02246970
	b _02246B0C
_02246970:
	movs r0, #3
	movs r1, #0x38
	lsls r2, r0, #0xf
	bl FUN_0201A910
	movs r0, #3
	movs r1, #0x39
	lsls r2, r0, #0xf
	bl FUN_0201A910
	bl ov71_022473E4
	movs r1, #0xfd
	movs r0, #3
	lsls r1, r1, #2
	movs r2, #1
	bl FUN_02004EC4
	movs r1, #0x56
	adds r0, r5, #0
	lsls r1, r1, #2
	movs r2, #0x38
	bl FUN_02007280
	adds r4, r0, #0
	bne _022469A6
	b _02246B06
_022469A6:
	adds r0, r5, #0
	bl FUN_020072A4
	str r0, [r4]
	movs r0, #0
	str r0, [r4, #4]
	movs r0, #0x38
	bl FUN_0201AC88
	str r0, [r4, #8]
	movs r0, #0x19
	lsls r0, r0, #4
	movs r1, #0x38
	bl FUN_02026354
	str r0, [r4, #0x14]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xb3
	movs r3, #0x38
	bl FUN_0200BAF8
	str r0, [r4, #0x10]
	movs r0, #0x38
	bl FUN_0200BD08
	str r0, [r4, #0xc]
	ldr r2, [r4]
	ldr r0, [r2, #0x10]
	cmp r0, #1
	beq _022469EE
	cmp r0, #2
	beq _02246A20
	cmp r0, #4
	beq _02246A2C
	b _02246A44
_022469EE:
	ldr r0, [r4, #0xc]
	ldr r2, [r2]
	movs r1, #0
	bl FUN_0200BF8C
	ldr r2, [r4]
	ldr r0, [r4, #0xc]
	ldr r2, [r2, #4]
	movs r1, #1
	bl FUN_0200BF8C
	ldr r2, [r4]
	ldr r0, [r4, #0xc]
	ldr r2, [r2, #8]
	movs r1, #2
	bl FUN_0200BE48
	ldr r0, [r4]
	ldr r0, [r0, #4]
	bl ov71_02246B28
	movs r1, #0x52
	lsls r1, r1, #2
	str r0, [r4, r1]
	b _02246A44
_02246A20:
	ldr r0, [r4, #0xc]
	ldr r2, [r2]
	movs r1, #0
	bl FUN_0200BF8C
	b _02246A44
_02246A2C:
	ldr r0, [r4, #0xc]
	ldr r2, [r2, #4]
	movs r1, #1
	bl FUN_0200BF8C
	ldr r0, [r4]
	ldr r0, [r0, #4]
	bl ov71_02246B28
	movs r1, #0x52
	lsls r1, r1, #2
	str r0, [r4, r1]
_02246A44:
	blx FUN_020B78D4
	movs r0, #1
	str r0, [sp]
	movs r0, #0x7f
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r1, #0x38
	str r1, [sp, #0x10]
	movs r1, #0x80
	adds r2, r0, #0
	bl FUN_0200B150
	adds r1, r4, #0
	movs r0, #0x40
	adds r1, #0x1c
	movs r2, #0x38
	bl FUN_02009F40
	str r0, [r4, #0x18]
	adds r0, r4, #0
	movs r2, #0x3a
	adds r0, #0x1c
	movs r1, #0
	lsls r2, r2, #0xe
	bl FUN_02009FC8
	ldr r0, [r4]
	movs r1, #5
	ldr r0, [r0]
	movs r2, #0
	bl FUN_0206E640
	movs r1, #0x53
	lsls r1, r1, #2
	strh r0, [r4, r1]
	ldr r0, [r4]
	movs r1, #5
	ldr r0, [r0, #4]
	movs r2, #0
	bl FUN_0206E640
	movs r1, #0x15
	lsls r1, r1, #4
	strh r0, [r4, r1]
	ldr r0, [r4]
	movs r1, #0x70
	ldr r0, [r0]
	movs r2, #0
	bl FUN_0206E640
	ldr r1, _02246B14 @ =0x0000014E
	movs r2, #0
	strh r0, [r4, r1]
	ldr r0, [r4]
	movs r1, #0x70
	ldr r0, [r0, #4]
	bl FUN_0206E640
	ldr r1, _02246B18 @ =0x00000152
	strh r0, [r4, r1]
	movs r0, #0
	adds r1, r1, #2
	str r0, [r4, r1]
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02246B1C @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _02246B20 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	ldr r0, _02246B24 @ =ov71_02246C48
	adds r1, r4, #0
	movs r2, #1
	bl FUN_0200E358
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	adds r1, #0x10
	str r0, [r4, r1]
_02246B06:
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, pc}
_02246B0C:
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_02246B14: .4byte 0x0000014E
_02246B18: .4byte 0x00000152
_02246B1C: .4byte 0xFFFFE0FF
_02246B20: .4byte 0x04001000
_02246B24: .4byte ov71_02246C48
	thumb_func_end ov71_02246960

	thumb_func_start ov71_02246B28
ov71_02246B28: @ 0x02246B28
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E640
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x1c
	bl FUN_0206FBC4
	cmp r0, #0
	bne _02246B52
	movs r0, #1
	pop {r3, r4, r5, pc}
_02246B52:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov71_02246B28

	thumb_func_start ov71_02246B58
ov71_02246B58: @ 0x02246B58
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	blx FUN_020D3A38
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200E390
	bl FUN_0203A914
	ldr r0, [r4, #0xc]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x10]
	bl FUN_0200BB44
	ldr r0, [r4, #0x14]
	bl FUN_02026380
	ldr r0, [r4, #8]
	bl FUN_0201AB0C
	ldr r0, [r4, #0x18]
	bl FUN_02024504
	bl FUN_0200B244
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x38
	bl FUN_0201A9C4
	movs r0, #0x39
	bl FUN_0201A9C4
	adds r0, r6, #0
	blx FUN_020D3A4C
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov71_02246B58

	thumb_func_start ov71_02246BB8
ov71_02246BB8: @ 0x02246BB8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r3, [r4, #4]
	cmp r3, #7
	bhs _02246C34
	ldr r1, [r4]
	ldr r6, _02246C38 @ =0x0224BBF8
	lsls r2, r3, #4
	ldr r1, [r1, #0x10]
	ldr r6, [r6, r2]
	tst r1, r6
	beq _02246C24
	movs r1, #0x55
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _02246BEC
	ldr r1, _02246C3C @ =0x0224BBEC
	ldr r1, [r1, r2]
	blx r1
	movs r1, #0x55
	lsls r1, r1, #2
	str r0, [r4, r1]
_02246BEC:
	ldr r2, [r4, #4]
	movs r0, #0x55
	lsls r3, r2, #4
	ldr r2, _02246C40 @ =0x0224BBF0
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r2, r3]
	adds r1, r5, #0
	blx r2
	cmp r0, #0
	beq _02246C2C
	ldr r1, [r4, #4]
	movs r0, #0x55
	lsls r2, r1, #4
	ldr r1, _02246C44 @ =0x0224BBF4
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r1, r2]
	blx r1
	movs r0, #0x55
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	str r1, [r5]
	b _02246C2C
_02246C24:
	adds r0, r3, #1
	str r0, [r4, #4]
	movs r0, #0
	str r0, [r5]
_02246C2C:
	bl ov71_022473F0
	movs r0, #0
	pop {r4, r5, r6, pc}
_02246C34:
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_02246C38: .4byte 0x0224BBF8
_02246C3C: .4byte 0x0224BBEC
_02246C40: .4byte 0x0224BBF0
_02246C44: .4byte 0x0224BBF4
	thumb_func_end ov71_02246BB8

	thumb_func_start ov71_02246C48
ov71_02246C48: @ 0x02246C48
	push {r3, lr}
	ldr r0, [r1, #0x18]
	bl FUN_0202457C
	bl FUN_0200B224
	ldr r3, _02246C64 @ =0x027E0000
	ldr r1, _02246C68 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r3, pc}
	nop
_02246C64: .4byte 0x027E0000
_02246C68: .4byte 0x00003FF8
	thumb_func_end ov71_02246C48

	thumb_func_start ov71_02246C6C
ov71_02246C6C: @ 0x02246C6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x38
	adds r6, r1, #0
	adds r1, r0, #0
	adds r1, #0xc8
	bl FUN_0201AA8C
	adds r4, r0, #0
	ldr r0, _02246D30 @ =0x00000000
	str r0, [r5]
	beq _02246D28
	movs r0, #0x59
	movs r1, #6
	add r2, sp, #4
	movs r3, #0x38
	bl FUN_020079F4
	adds r7, r0, #0
	beq _02246CA6
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x60
	blx FUN_020D4790
	adds r0, r7, #0
	bl FUN_0201AB0C
_02246CA6:
	adds r1, r4, #0
	movs r0, #0
	adds r1, #0xec
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xe8
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xf0
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xf4
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xe4
	str r5, [r1]
	adds r1, r4, #0
	adds r1, #0xf8
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xfc
	str r6, [r1]
	adds r3, r4, #0
	adds r2, r0, #0
_02246CD6:
	adds r1, r3, #0
	adds r1, #0xc4
	adds r0, r0, #1
	adds r3, r3, #4
	str r2, [r1]
	cmp r0, #8
	blt _02246CD6
	movs r0, #8
	str r0, [sp]
	ldr r0, _02246D34 @ =0x04000050
	movs r1, #4
	movs r2, #0xc
	movs r3, #0x10
	blx FUN_020CF15C
	movs r0, #8
	str r0, [sp]
	ldr r0, _02246D38 @ =0x04001050
	movs r1, #4
	movs r2, #0xc
	movs r3, #0x10
	blx FUN_020CF15C
	ldr r0, _02246D3C @ =ov71_02246D9C
	adds r1, r4, #0
	movs r2, #0x14
	bl FUN_0200E374
	adds r1, r4, #0
	adds r1, #0xc0
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	cmp r0, #0
	beq _02246D28
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #1
	str r1, [r0]
_02246D28:
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02246D30: .4byte 0x00000000
_02246D34: .4byte 0x04000050
_02246D38: .4byte 0x04001050
_02246D3C: .4byte ov71_02246D9C
	thumb_func_end ov71_02246C6C

	thumb_func_start ov71_02246D40
ov71_02246D40: @ 0x02246D40
	adds r1, r0, #0
	adds r1, #0xe4
	ldr r1, [r1]
	ldr r1, [r1]
	cmp r1, #1
	bne _02246D52
	movs r1, #1
	adds r0, #0xe8
	str r1, [r0]
_02246D52:
	bx lr
	thumb_func_end ov71_02246D40

	thumb_func_start ov71_02246D54
ov71_02246D54: @ 0x02246D54
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0xe4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #1
	bne _02246D9A
	movs r4, #0
	adds r5, r6, #0
_02246D66:
	adds r0, r5, #0
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0
	beq _02246D78
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov71_02246F60
_02246D78:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blt _02246D66
	adds r0, r6, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #0
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0xc0
	ldr r0, [r0]
	bl FUN_0200E390
	adds r0, r6, #0
	bl FUN_0201AB0C
_02246D9A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_02246D54

	thumb_func_start ov71_02246D9C
ov71_02246D9C: @ 0x02246D9C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	cmp r0, #0
	bne _02246E1A
	adds r0, r4, #0
	adds r0, #0xf0
	ldr r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf0
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf0
	ldr r0, [r0]
	cmp r0, #0
	bgt _02246DD8
	ldr r0, _02246E80 @ =0x000006AD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x1e
	adds r0, #0xf0
	str r1, [r0]
	adds r0, r4, #0
	bl ov71_02246EAC
_02246DD8:
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	cmp r0, #0
	beq _02246E7C
	blx FUN_020D0524
	blx FUN_020D0774
	adds r0, r4, #0
	movs r1, #0x60
	blx DC_FlushRange
	movs r1, #6
	adds r0, r4, #0
	lsls r1, r1, #0xc
	movs r2, #0x60
	blx FUN_020D05C4
	movs r1, #6
	adds r0, r4, #0
	lsls r1, r1, #0xc
	movs r2, #0x60
	blx FUN_020D078C
	blx FUN_020D0634
	blx FUN_020D07F0
	movs r0, #0
	adds r4, #0xec
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02246E1A:
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	cmp r0, #0
	beq _02246E5C
	blx FUN_020D0524
	blx FUN_020D0774
	adds r0, r4, #0
	movs r1, #0x60
	blx DC_FlushRange
	movs r1, #6
	adds r0, r4, #0
	lsls r1, r1, #0xc
	movs r2, #0x60
	blx FUN_020D05C4
	movs r1, #6
	adds r0, r4, #0
	lsls r1, r1, #0xc
	movs r2, #0x60
	blx FUN_020D078C
	blx FUN_020D0634
	blx FUN_020D07F0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xec
	str r1, [r0]
_02246E5C:
	adds r0, r4, #0
	adds r0, #0xf4
	ldr r0, [r0]
	cmp r0, #0
	bne _02246E7C
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #0
	str r1, [r0]
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
_02246E7C:
	pop {r3, r4, r5, pc}
	nop
_02246E80: .4byte 0x000006AD
	thumb_func_end ov71_02246D9C

	thumb_func_start ov71_02246E84
ov71_02246E84: @ 0x02246E84
	push {r3, r4}
	cmp r1, #0
	blt _02246E94
	cmp r1, #0x60
	bge _02246E94
	movs r4, #0
	lsls r1, r1, #1
	strh r4, [r0, r1]
_02246E94:
	cmp r2, #0
	blt _02246EA0
	cmp r2, #0x60
	bge _02246EA0
	lsls r1, r2, #1
	strh r3, [r0, r1]
_02246EA0:
	movs r1, #1
	adds r0, #0xec
	str r1, [r0]
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov71_02246E84

	thumb_func_start ov71_02246EAC
ov71_02246EAC: @ 0x02246EAC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0xf8
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0
	bne _02246F58
	movs r0, #0x38
	movs r1, #0x18
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _02246F58
	adds r0, r5, #0
	str r5, [r4]
	adds r0, #0xfc
	ldr r0, [r0]
	cmp r0, #1
	bne _02246EDE
	movs r0, #0
	mvns r0, r0
	b _02246EE0
_02246EDE:
	movs r0, #0xf
_02246EE0:
	str r0, [r4, #4]
	movs r0, #0
	str r0, [r4, #0xc]
	movs r0, #2
	str r0, [r4, #8]
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	adds r1, r4, #0
	str r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r2, #0xa
	str r0, [r4, #0x14]
	ldr r0, _02246F5C @ =ov71_02246F90
	bl FUN_0200E320
	adds r1, r5, #0
	adds r1, #0xf8
	ldr r1, [r1]
	lsls r1, r1, #2
	adds r1, r5, r1
	adds r1, #0xc4
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0
	beq _02246F52
	adds r0, r5, #0
	adds r0, #0xf4
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0xf4
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0xf8
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	cmp r0, #8
	blt _02246F58
	movs r0, #0
	adds r5, #0xf8
	str r0, [r5]
	pop {r3, r4, r5, pc}
_02246F52:
	adds r0, r4, #0
	bl FUN_0201AB0C
_02246F58:
	pop {r3, r4, r5, pc}
	nop
_02246F5C: .4byte ov71_02246F90
	thumb_func_end ov71_02246EAC

	thumb_func_start ov71_02246F60
ov71_02246F60: @ 0x02246F60
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	lsls r4, r1, #2
	adds r6, #0xc4
	ldr r0, [r6, r4]
	cmp r0, #0
	beq _02246F8E
	bl FUN_0201F988
	bl FUN_0201AB0C
	ldr r0, [r6, r4]
	bl FUN_0200E390
	movs r0, #0
	str r0, [r6, r4]
	adds r0, r5, #0
	adds r0, #0xf4
	ldr r0, [r0]
	adds r5, #0xf4
	subs r0, r0, #1
	str r0, [r5]
_02246F8E:
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_02246F60

	thumb_func_start ov71_02246F90
ov71_02246F90: @ 0x02246F90
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0xc]
	adds r1, r0, #1
	str r1, [r4, #0xc]
	ldr r0, [r4, #8]
	cmp r1, r0
	blt _02246FF8
	movs r3, #0
	str r3, [r4, #0xc]
	ldr r0, [r4, #0x14]
	cmp r0, #1
	bne _02246FD0
	ldr r1, [r4, #4]
	ldr r0, [r4]
	adds r2, r1, #1
	cmp r2, #0xf
	blt _02246FC2
	bl ov71_02246E84
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	bl ov71_02246F60
	pop {r4, pc}
_02246FC2:
	ldr r3, _02246FFC @ =0x00007FFF
	bl ov71_02246E84
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, pc}
_02246FD0:
	ldr r2, [r4, #4]
	ldr r0, [r4]
	cmp r2, #0
	bge _02246FEA
	adds r1, r2, #0
	adds r2, r2, #1
	bl ov71_02246E84
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	bl ov71_02246F60
	pop {r4, pc}
_02246FEA:
	ldr r3, _02246FFC @ =0x00007FFF
	adds r1, r2, #1
	bl ov71_02246E84
	ldr r0, [r4, #4]
	subs r0, r0, #1
	str r0, [r4, #4]
_02246FF8:
	pop {r4, pc}
	nop
_02246FFC: .4byte 0x00007FFF
	thumb_func_end ov71_02246F90

	thumb_func_start ov71_02247000
ov71_02247000: @ 0x02247000
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	adds r6, r1, #0
	movs r0, #0x38
	movs r1, #0x24
	adds r7, r2, #0
	str r3, [sp, #4]
	ldr r5, [sp, #0x28]
	bl FUN_0201AA8C
	adds r4, r0, #0
	ldr r0, _02247060 @ =0x00000001
	str r0, [r5]
	beq _02247058
	ldr r1, [sp]
	str r1, [r4]
	str r6, [r4, #8]
	ldr r1, [sp, #4]
	str r7, [r4, #0xc]
	str r1, [r4, #0x10]
	ldr r1, [sp, #0x20]
	str r1, [r4, #0x14]
	cmp r6, r7
	bge _02247034
	movs r0, #0
_02247034:
	str r0, [r4, #0x18]
	ldr r0, [sp, #0x24]
	movs r2, #0
	str r0, [r4, #0x1c]
	str r5, [r4, #4]
	ldr r0, _02247064 @ =ov71_02247068
	adds r1, r4, #0
	str r2, [r5]
	bl FUN_0200E33C
	str r0, [r4, #0x20]
	cmp r0, #0
	bne _02247058
	movs r0, #1
	str r0, [r5]
	adds r0, r4, #0
	bl FUN_0201AB0C
_02247058:
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02247060: .4byte 0x00000001
_02247064: .4byte ov71_02247068
	thumb_func_end ov71_02247000

	thumb_func_start ov71_02247068
ov71_02247068: @ 0x02247068
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	muls r1, r0, r1
	asrs r2, r1, #0xc
	asrs r1, r2, #4
	lsrs r1, r1, #0x1b
	adds r1, r2, r1
	asrs r2, r1, #5
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _0224708A
	cmp r1, #1
	beq _022470A0
	b _022470B4
_0224708A:
	ldr r1, [r4, #0xc]
	adds r0, r0, r2
	cmp r0, r1
	bge _02247096
	str r0, [r4, #8]
	b _022470B4
_02247096:
	str r1, [r4, #8]
	ldr r0, [r4, #4]
	movs r1, #1
	str r1, [r0]
	b _022470B4
_022470A0:
	ldr r1, [r4, #0xc]
	subs r0, r0, r2
	cmp r0, r1
	ble _022470AC
	str r0, [r4, #8]
	b _022470B4
_022470AC:
	str r1, [r4, #8]
	ldr r0, [r4, #4]
	movs r1, #1
	str r1, [r0]
_022470B4:
	adds r0, r4, #0
	bl ov71_022470DC
	ldr r0, [r4, #4]
	ldr r0, [r0]
	cmp r0, #0
	beq _022470D0
	adds r0, r4, #0
	bl ov71_02247424
	adds r0, r5, #0
	bl FUN_0200E390
	pop {r3, r4, r5, pc}
_022470D0:
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x14]
	adds r0, r1, r0
	str r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov71_02247068

	thumb_func_start ov71_022470DC
ov71_022470DC: @ 0x022470DC
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #8]
	add r2, sp, #4
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	movs r3, #0x80
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x1c]
	lsls r1, r0, #2
	ldr r0, _02247120 @ =_0224BBD4
	ldr r0, [r0, r1]
	movs r1, #2
	str r0, [sp]
	ldr r0, [r4]
	bl FUN_0201BE7C
	ldr r0, [r4, #0x1c]
	add r2, sp, #4
	lsls r1, r0, #2
	ldr r0, _02247120 @ =_0224BBD4
	movs r3, #0x80
	ldr r0, [r0, r1]
	movs r1, #6
	str r0, [sp]
	ldr r0, [r4]
	bl FUN_0201BE7C
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_02247120: .4byte _0224BBD4
	thumb_func_end ov71_022470DC

	thumb_func_start ov71_02247124
ov71_02247124: @ 0x02247124
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r5, r0, #0
	ldr r0, [sp, #0x60]
	adds r4, r1, #0
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	cmp r0, #0
	beq _0224713C
	movs r7, #0x19
	lsls r7, r7, #8
	b _02247140
_0224713C:
	movs r7, #0x32
	lsls r7, r7, #6
_02247140:
	movs r0, #0x38
	adds r1, r7, #0
	bl FUN_0201AACC
	str r0, [sp, #0x24]
	cmp r0, #0
	beq _02247202
	ldr r3, _02247228 @ =0x0224BBDC
	add r2, sp, #0x28
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	cmp r4, #0
	ldr r0, [r5]
	bne _02247164
	ldr r4, [r0]
	b _02247166
_02247164:
	ldr r4, [r0, #4]
_02247166:
	adds r0, r4, #0
	bl FUN_0206DDD8
	str r0, [sp, #0x20]
	add r0, sp, #0x38
	adds r1, r4, #0
	movs r2, #2
	movs r3, #0
	bl FUN_0207013C
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl FUN_0206E640
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, [sp, #0x60]
	cmp r0, #0
	beq _022471A0
	ldr r0, [sp, #0x30]
	lsls r0, r0, #1
	str r0, [sp, #0x30]
_022471A0:
	adds r0, r4, #0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E640
	cmp r0, #1
	bne _022471B8
	ldr r0, _0224722C @ =0x00000147
	cmp r6, r0
	bne _022471B8
	adds r6, r0, #0
	adds r6, #0xa7
_022471B8:
	ldr r0, [sp, #0x24]
	add r1, sp, #0x28
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	movs r2, #0x38
	str r0, [sp, #4]
	ldr r0, [sp, #0x60]
	add r3, sp, #0x28
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	ldrh r0, [r1, #0x10]
	ldrh r1, [r1, #0x12]
	bl FUN_02014510
	ldr r0, [sp, #0x24]
	adds r1, r7, #0
	blx DC_FlushRange
	ldr r1, [sp, #0x14]
	movs r0, #0
	str r0, [sp]
	lsls r1, r1, #0x18
	ldr r0, [r5, #8]
	ldr r2, [sp, #0x24]
	lsrs r1, r1, #0x18
	adds r3, r7, #0
	bl FUN_0201C0C0
	ldr r1, [sp, #0x20]
	adds r0, r4, #0
	bl FUN_0206DE00
	ldr r0, [sp, #0x24]
	bl FUN_0201AB0C
_02247202:
	ldr r0, [sp, #0x14]
	cmp r0, #4
	blo _0224720C
	movs r2, #4
	b _0224720E
_0224720C:
	movs r2, #0
_0224720E:
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x38
	ldr r3, [sp, #0x18]
	str r0, [sp, #4]
	add r1, sp, #0x28
	ldrh r0, [r1, #0x10]
	ldrh r1, [r1, #0x14]
	lsls r3, r3, #5
	bl FUN_02007938
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02247228: .4byte 0x0224BBDC
_0224722C: .4byte 0x00000147
	thumb_func_end ov71_02247124

	thumb_func_start ov71_02247230
ov71_02247230: @ 0x02247230
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r1, #0
	bne _02247242
	ldr r1, _022472C0 @ =0x0000010A
	b _02247252
_02247242:
	movs r1, #0x52
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #0
	beq _02247250
	subs r1, #0x3d
	b _02247252
_02247250:
	subs r1, #0x3e
_02247252:
	movs r0, #0x38
	str r0, [sp]
	movs r0, #7
	movs r2, #0
	add r3, sp, #0x1c
	bl FUN_020079D8
	adds r7, r0, #0
	beq _022472BA
	movs r0, #0xa
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x38]
	adds r0, #0xc
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0x20
	ldr r3, [sp, #0x3c]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	lsls r1, r4, #0x18
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	ldr r0, [r5, #8]
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201C4EC
	movs r0, #0xa
	str r0, [sp]
	str r0, [sp, #4]
	lsls r0, r6, #0x18
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x3c]
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsls r1, r4, #0x18
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	ldr r0, [r5, #8]
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201CA4C
	adds r0, r7, #0
	bl FUN_0201AB0C
_022472BA:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022472C0: .4byte 0x0000010A
	thumb_func_end ov71_02247230

	thumb_func_start ov71_022472C4
ov71_022472C4: @ 0x022472C4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r3, #0
	movs r0, #0x39
	adds r3, r5, #0
	str r0, [sp]
	adds r1, r2, #0
	adds r0, r4, #0
	movs r2, #1
	adds r3, #8
	bl FUN_02007A0C
	str r0, [r5]
	movs r0, #0x39
	adds r3, r5, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	adds r3, #0xc
	bl FUN_02007A28
	str r0, [r5, #4]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov71_022472C4

	thumb_func_start ov71_022472FC
ov71_022472FC: @ 0x022472FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0224730E
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4]
_0224730E:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0224731C
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #4]
_0224731C:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_022472FC

	thumb_func_start ov71_02247320
ov71_02247320: @ 0x02247320
	str r2, [r0]
	str r3, [r0, #8]
	ldr r2, [r1, #8]
	str r2, [r0, #0xc]
	ldr r1, [r1, #0xc]
	ldr r2, [sp]
	str r1, [r0, #0x10]
	adds r1, r0, #0
	adds r1, #0x20
	strb r2, [r1]
	movs r1, #0
	str r1, [r0, #4]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ov71_02247320

	thumb_func_start ov71_02247340
ov71_02247340: @ 0x02247340
	push {r4, lr}
	sub sp, #0x20
	ldr r0, [r0, #0x18]
	str r0, [sp]
	lsls r0, r2, #0xc
	str r0, [sp, #8]
	lsls r0, r3, #0xc
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x28]
	str r1, [sp, #4]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x18]
	movs r0, #0x38
	str r0, [sp, #0x1c]
	add r0, sp, #0
	bl FUN_02024714
	adds r4, r0, #0
	beq _0224737C
	movs r1, #1
	bl FUN_0202484C
	movs r1, #1
	adds r0, r4, #0
	lsls r1, r1, #0xc
	bl FUN_02024868
_0224737C:
	adds r0, r4, #0
	add sp, #0x20
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_02247340

	thumb_func_start ov71_02247384
ov71_02247384: @ 0x02247384
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov71_02247384

	thumb_func_start ov71_02247388
ov71_02247388: @ 0x02247388
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov71_02247388

	thumb_func_start ov71_0224738C
ov71_0224738C: @ 0x0224738C
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end ov71_0224738C

	thumb_func_start ov71_02247390
ov71_02247390: @ 0x02247390
	ldr r0, [r0]
	ldr r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov71_02247390

	thumb_func_start ov71_02247398
ov71_02247398: @ 0x02247398
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
	thumb_func_end ov71_02247398

	thumb_func_start ov71_022473A0
ov71_022473A0: @ 0x022473A0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bx lr
	.align 2, 0
	thumb_func_end ov71_022473A0

	thumb_func_start ov71_022473A8
ov71_022473A8: @ 0x022473A8
	movs r1, #0x53
	lsls r1, r1, #2
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end ov71_022473A8

	thumb_func_start ov71_022473B0
ov71_022473B0: @ 0x022473B0
	ldr r1, _022473B8 @ =0x0000014E
	ldrh r0, [r0, r1]
	bx lr
	nop
_022473B8: .4byte 0x0000014E
	thumb_func_end ov71_022473B0

	thumb_func_start ov71_022473BC
ov71_022473BC: @ 0x022473BC
	movs r1, #0x15
	lsls r1, r1, #4
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end ov71_022473BC

	thumb_func_start ov71_022473C4
ov71_022473C4: @ 0x022473C4
	ldr r1, _022473CC @ =0x00000152
	ldrh r0, [r0, r1]
	bx lr
	nop
_022473CC: .4byte 0x00000152
	thumb_func_end ov71_022473C4

	thumb_func_start ov71_022473D0
ov71_022473D0: @ 0x022473D0
	ldr r0, [r0]
	ldr r3, _022473D8 @ =FUN_0202ADCC
	ldr r0, [r0, #0x14]
	bx r3
	.align 2, 0
_022473D8: .4byte FUN_0202ADCC
	thumb_func_end ov71_022473D0

	thumb_func_start ov71_022473DC
ov71_022473DC: @ 0x022473DC
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bx lr
	.align 2, 0
	thumb_func_end ov71_022473DC

	thumb_func_start ov71_022473E4
ov71_022473E4: @ 0x022473E4
	ldr r0, _022473EC @ =0x0224C040
	movs r1, #0
	str r1, [r0]
	bx lr
	.align 2, 0
_022473EC: .4byte 0x0224C040
	thumb_func_end ov71_022473E4

	thumb_func_start ov71_022473F0
ov71_022473F0: @ 0x022473F0
	push {r4, r5, r6, lr}
	ldr r6, _0224741C @ =0x0224C040
	ldr r0, [r6]
	cmp r0, #0
	beq _02247418
	movs r4, #0
	cmp r0, #0
	ble _02247412
	ldr r5, _02247420 @ =0x0224C044
_02247402:
	ldr r0, [r5]
	bl FUN_0201AB0C
	ldr r0, [r6]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r0
	blt _02247402
_02247412:
	ldr r0, _0224741C @ =0x0224C040
	movs r1, #0
	str r1, [r0]
_02247418:
	pop {r4, r5, r6, pc}
	nop
_0224741C: .4byte 0x0224C040
_02247420: .4byte 0x0224C044
	thumb_func_end ov71_022473F0

	thumb_func_start ov71_02247424
ov71_02247424: @ 0x02247424
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02247444 @ =0x0224C040
	ldr r0, [r0]
	cmp r0, #0x20
	blt _02247434
	bl GF_AssertFail
_02247434:
	ldr r0, _02247444 @ =0x0224C040
	ldr r2, [r0]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, _02247448 @ =0x0224C044
	lsls r1, r2, #2
	str r4, [r0, r1]
	pop {r4, pc}
	.align 2, 0
_02247444: .4byte 0x0224C040
_02247448: .4byte 0x0224C044
	thumb_func_end ov71_02247424

	thumb_func_start ov71_0224744C
ov71_0224744C: @ 0x0224744C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	movs r0, #0x39
	movs r1, #0x20
	adds r5, r2, #0
	str r3, [sp]
	bl FUN_0201AA8C
	adds r6, r0, #0
	beq _02247492
	ldr r3, [sp]
	adds r1, r4, #0
	adds r2, r5, #0
	bl ov71_0224784C
	movs r1, #0x8c
	movs r0, #0x39
	muls r1, r7, r1
	bl FUN_0201AA8C
	str r0, [r6, #0x18]
	movs r4, #0
	str r7, [r6, #0x1c]
	cmp r7, #0
	bls _02247492
	adds r5, r4, #0
_02247482:
	ldr r0, [r6, #0x18]
	adds r0, r0, r5
	bl ov71_022475C4
	adds r4, r4, #1
	adds r5, #0x8c
	cmp r4, r7
	blo _02247482
_02247492:
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov71_0224744C

	thumb_func_start ov71_02247498
ov71_02247498: @ 0x02247498
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x1c]
	movs r6, #0
	cmp r0, #0
	bls _022474B8
	adds r4, r6, #0
_022474A6:
	ldr r0, [r5, #0x18]
	adds r0, r0, r4
	bl ov71_022475F8
	ldr r0, [r5, #0x1c]
	adds r6, r6, #1
	adds r4, #0x8c
	cmp r6, r0
	blo _022474A6
_022474B8:
	ldr r0, [r5, #0x18]
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl ov71_022478B8
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_02247498

	thumb_func_start ov71_022474CC
ov71_022474CC: @ 0x022474CC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	movs r1, #0
	adds r5, r0, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	bl FUN_02023154
	ldr r0, [r5, #0x1c]
	movs r6, #0
	cmp r0, #0
	bls _02247502
	adds r4, r6, #0
_022474EA:
	ldr r0, [r5, #0x18]
	adds r0, r0, r4
	ldr r1, [r0, #0x64]
	cmp r1, #0
	beq _022474F8
	bl ov71_02247514
_022474F8:
	ldr r0, [r5, #0x1c]
	adds r6, r6, #1
	adds r4, #0x8c
	cmp r6, r0
	blo _022474EA
_02247502:
	movs r2, #1
	movs r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	blx FUN_020C2528
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov71_022474CC

	thumb_func_start ov71_02247514
ov71_02247514: @ 0x02247514
	push {r4, lr}
	sub sp, #0x50
	adds r4, r0, #0
	add r0, sp, #0x2c
	blx FUN_020CAFEC
	adds r0, r4, #0
	adds r0, #0x80
	ldrh r0, [r0]
	ldr r3, _022475C0 @ =0x021094DC
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #8
	bl FUN_020CB0D0
	add r1, sp, #0x2c
	add r0, sp, #8
	adds r2, r1, #0
	blx FUN_020CB410
	adds r0, r4, #0
	adds r0, #0x82
	ldrh r0, [r0]
	ldr r3, _022475C0 @ =0x021094DC
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #8
	bl FUN_020CB0EC
	add r1, sp, #0x2c
	add r0, sp, #8
	adds r2, r1, #0
	blx FUN_020CB410
	adds r0, r4, #0
	adds r0, #0x84
	ldrh r0, [r0]
	ldr r3, _022475C0 @ =0x021094DC
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #8
	bl FUN_020CB108
	add r1, sp, #0x2c
	add r0, sp, #8
	adds r2, r1, #0
	blx FUN_020CB410
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	cmp r0, #0x1f
	beq _022475AC
	str r0, [sp]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	str r0, [sp, #4]
	blx FUN_020BF0CC
_022475AC:
	adds r1, r4, #0
	adds r0, r4, #4
	adds r4, #0x74
	adds r1, #0x68
	add r2, sp, #0x2c
	adds r3, r4, #0
	bl FUN_0201F554
	add sp, #0x50
	pop {r4, pc}
	.align 2, 0
_022475C0: .4byte 0x021094DC
	thumb_func_end ov71_02247514

	thumb_func_start ov71_022475C4
ov71_022475C4: @ 0x022475C4
	movs r1, #0
	str r1, [r0, #0x64]
	adds r2, r0, #0
	str r1, [r0]
	adds r2, #0x84
	strh r1, [r2]
	movs r2, #0x84
	ldrsh r3, [r0, r2]
	adds r2, r0, #0
	adds r2, #0x82
	strh r3, [r2]
	movs r2, #0x82
	ldrsh r3, [r0, r2]
	adds r2, r0, #0
	adds r2, #0x80
	strh r3, [r2]
	movs r2, #1
	lsls r2, r2, #0xc
	str r2, [r0, #0x7c]
	str r2, [r0, #0x78]
	str r2, [r0, #0x74]
	str r1, [r0, #0x70]
	str r1, [r0, #0x6c]
	str r1, [r0, #0x68]
	bx lr
	.align 2, 0
	thumb_func_end ov71_022475C4

	thumb_func_start ov71_022475F8
ov71_022475F8: @ 0x022475F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0224760C
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4]
	str r0, [r4, #0x64]
_0224760C:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_022475F8

	thumb_func_start ov71_02247610
ov71_02247610: @ 0x02247610
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, [r0, #0x18]
	adds r6, r1, #0
	movs r0, #0x8c
	muls r6, r0, r6
	adds r7, r2, #0
	movs r0, #1
	str r0, [sp]
	str r3, [sp, #4]
	adds r1, r3, #0
	adds r0, r7, #0
	movs r2, #0
	movs r3, #0x39
	adds r5, r4, r6
	bl FUN_02007A44
	str r0, [r4, r6]
	ldr r1, [sp, #4]
	adds r0, r7, #0
	bl FUN_020075BC
	adds r1, r0, #0
	ldr r0, [r4, r6]
	blx DC_FlushRange
	ldr r0, [r4, r6]
	cmp r0, #0
	beq _022476AC
	blx FUN_020C3B40
	str r0, [r5, #0x58]
	cmp r0, #0
	beq _02247674
	adds r2, r0, #0
	adds r2, #8
	beq _02247668
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _02247668
	ldrh r1, [r0, #0xe]
	adds r1, r2, r1
	adds r1, r1, #4
	b _0224766A
_02247668:
	movs r1, #0
_0224766A:
	cmp r1, #0
	beq _02247674
	ldr r1, [r1]
	adds r0, r0, r1
	b _02247676
_02247674:
	movs r0, #0
_02247676:
	str r0, [r5, #0x5c]
	ldr r0, [r5]
	blx FUN_020C3B50
	str r0, [r5, #0x60]
	bl FUN_0201F668
	ldr r0, [r5]
	ldr r1, [r5, #0x60]
	bl FUN_0201F64C
	ldr r1, [r5, #0x5c]
	adds r0, r5, #4
	blx FUN_020BE120
	ldr r0, [sp, #0x20]
	movs r1, #0x1f
	str r0, [r5, #0x68]
	ldr r0, [sp, #0x24]
	str r0, [r5, #0x6c]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x70]
	adds r0, r5, #0
	adds r0, #0x88
	str r1, [r0]
	ldr r0, [sp, #0x2c]
	str r0, [r5, #0x64]
_022476AC:
	adds r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov71_02247610

	thumb_func_start ov71_022476B4
ov71_022476B4: @ 0x022476B4
	adds r2, r0, #0
	adds r2, #0x68
	adds r3, r1, #0
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end ov71_022476B4

	thumb_func_start ov71_022476C4
ov71_022476C4: @ 0x022476C4
	adds r3, r1, #0
	adds r2, r0, #0
	ldm r3!, {r0, r1}
	adds r2, #0x68
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end ov71_022476C4

	thumb_func_start ov71_022476D4
ov71_022476D4: @ 0x022476D4
	adds r2, r0, #0
	adds r2, #0x80
	ldrh r2, [r2]
	strh r2, [r1]
	adds r2, r0, #0
	adds r2, #0x82
	ldrh r2, [r2]
	adds r0, #0x84
	strh r2, [r1, #2]
	ldrh r0, [r0]
	strh r0, [r1, #4]
	bx lr
	thumb_func_end ov71_022476D4

	thumb_func_start ov71_022476EC
ov71_022476EC: @ 0x022476EC
	ldrh r3, [r1]
	adds r2, r0, #0
	adds r2, #0x80
	strh r3, [r2]
	adds r2, r0, #0
	ldrh r3, [r1, #2]
	adds r2, #0x82
	adds r0, #0x84
	strh r3, [r2]
	ldrh r1, [r1, #4]
	strh r1, [r0]
	bx lr
	thumb_func_end ov71_022476EC

	thumb_func_start ov71_02247704
ov71_02247704: @ 0x02247704
	str r1, [r0, #0x64]
	bx lr
	thumb_func_end ov71_02247704

	thumb_func_start ov71_02247708
ov71_02247708: @ 0x02247708
	push {r3, lr}
	adds r2, r0, #0
	adds r2, #0x88
	str r1, [r2]
	cmp r1, #0x1f
	ldr r0, [r0, #0x5c]
	beq _02247722
	movs r2, #0x1f
	movs r1, #0
	lsls r2, r2, #0x10
	blx FUN_020C2C54
	pop {r3, pc}
_02247722:
	movs r2, #0x1f
	movs r1, #1
	lsls r2, r2, #0x10
	blx FUN_020C2C54
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov71_02247708

	thumb_func_start ov71_02247730
ov71_02247730: @ 0x02247730
	str r1, [r0, #0x74]
	str r1, [r0, #0x78]
	str r1, [r0, #0x7c]
	bx lr
	thumb_func_end ov71_02247730

	thumb_func_start ov71_02247738
ov71_02247738: @ 0x02247738
	push {r3, r4, lr}
	sub sp, #0x4c
	adds r4, r0, #0
	add r0, sp, #0x28
	blx FUN_020CAFEC
	adds r0, r4, #0
	adds r0, #0x80
	ldrh r0, [r0]
	ldr r3, _022477E8 @ =0x021094DC
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #4
	bl FUN_020CB0D0
	add r1, sp, #0x28
	add r0, sp, #4
	adds r2, r1, #0
	blx FUN_020CB410
	adds r0, r4, #0
	adds r0, #0x82
	ldrh r0, [r0]
	ldr r3, _022477E8 @ =0x021094DC
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #4
	bl FUN_020CB0EC
	add r1, sp, #0x28
	add r0, sp, #4
	adds r2, r1, #0
	blx FUN_020CB410
	adds r0, r4, #0
	adds r0, #0x84
	ldrh r0, [r0]
	ldr r3, _022477E8 @ =0x021094DC
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #4
	bl FUN_020CB108
	add r1, sp, #0x28
	add r0, sp, #4
	adds r2, r1, #0
	blx FUN_020CB410
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	bl FUN_02023154
	adds r1, r4, #0
	ldr r0, [r4, #0x5c]
	adds r4, #0x74
	adds r1, #0x68
	add r2, sp, #0x28
	adds r3, r4, #0
	bl FUN_0201F990
	adds r4, r0, #0
	movs r2, #1
	movs r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	blx FUN_020C2528
	adds r0, r4, #0
	add sp, #0x4c
	pop {r3, r4, pc}
	.align 2, 0
_022477E8: .4byte 0x021094DC
	thumb_func_end ov71_02247738

	thumb_func_start ov71_022477EC
ov71_022477EC: @ 0x022477EC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r1, [r2]
	add r0, sp, #0
	bl FUN_02023640
	add r2, sp, #0
	ldm r2!, {r0, r1}
	stm r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov71_022477EC

	thumb_func_start ov71_0224780C
ov71_0224780C: @ 0x0224780C
	ldr r3, _02247818 @ =FUN_02023558
	adds r2, r0, #0
	adds r0, r1, #0
	ldr r1, [r2]
	bx r3
	nop
_02247818: .4byte FUN_02023558
	thumb_func_end ov71_0224780C

	thumb_func_start ov71_0224781C
ov71_0224781C: @ 0x0224781C
	ldr r3, _02247828 @ =FUN_0202357C
	adds r2, r0, #0
	adds r0, r1, #0
	ldr r1, [r2]
	bx r3
	nop
_02247828: .4byte FUN_0202357C
	thumb_func_end ov71_0224781C

	thumb_func_start ov71_0224782C
ov71_0224782C: @ 0x0224782C
	ldr r3, _02247838 @ =FUN_020233D8
	adds r2, r0, #0
	adds r0, r1, #0
	ldr r1, [r2]
	bx r3
	nop
_02247838: .4byte FUN_020233D8
	thumb_func_end ov71_0224782C

	thumb_func_start ov71_0224783C
ov71_0224783C: @ 0x0224783C
	ldr r3, _02247848 @ =FUN_02023494
	adds r2, r0, #0
	adds r0, r1, #0
	ldr r1, [r2]
	bx r3
	nop
_02247848: .4byte FUN_02023494
	thumb_func_end ov71_0224783C

	thumb_func_start ov71_0224784C
ov71_0224784C: @ 0x0224784C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r0, #0x39
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_02023114
	str r0, [r5]
	str r4, [r5, #4]
	str r6, [r5, #8]
	movs r1, #0x4b
	adds r2, r5, #0
	str r7, [r5, #0xc]
	movs r0, #0
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	strh r0, [r5, #0x14]
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r3, _022478B4 @ =0x00000FA4
	str r0, [sp, #8]
	adds r0, r5, #4
	lsls r1, r1, #0xe
	adds r2, #0x10
	bl FUN_02023254
	movs r1, #0
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x10]
	str r1, [sp, #0xc]
	str r1, [sp, #0x14]
	ldr r1, [r5]
	add r0, sp, #0xc
	bl FUN_02023204
	ldr r0, [r5]
	bl FUN_0202313C
	movs r1, #0xfa
	ldr r2, [r5]
	movs r0, #0
	lsls r1, r1, #0xe
	bl FUN_02023240
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022478B4: .4byte 0x00000FA4
	thumb_func_end ov71_0224784C

	thumb_func_start ov71_022478B8
ov71_022478B8: @ 0x022478B8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02023148
	ldr r0, [r4]
	bl FUN_02023120
	pop {r4, pc}
	thumb_func_end ov71_022478B8

	thumb_func_start ov71_022478C8
ov71_022478C8: @ 0x022478C8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x39
	movs r1, #0x84
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _0224791E
	str r5, [r4]
	movs r0, #0
	str r0, [r4, #4]
	adds r0, r5, #0
	bl ov71_02247384
	str r0, [r4, #0x54]
	movs r0, #0x39
	bl FUN_02007FD4
	str r0, [r4, #0xc]
	movs r0, #0
	str r0, [r4, #0x10]
	movs r0, #0x4b
	lsls r0, r0, #2
	movs r1, #0x39
	bl FUN_02026354
	str r0, [r4, #0x68]
	movs r0, #0x4b
	lsls r0, r0, #2
	movs r1, #0x39
	bl FUN_02026354
	str r0, [r4, #0x6c]
	movs r0, #0
	str r0, [r4, #0x78]
	str r0, [r4, #0x7c]
	movs r0, #0xb4
	movs r1, #0x39
	bl FUN_02007688
	adds r1, r4, #0
	adds r1, #0x80
	str r0, [r1]
_0224791E:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov71_022478C8

	thumb_func_start ov71_02247924
ov71_02247924: @ 0x02247924
	push {r4, lr}
	adds r4, r0, #0
	beq _0224798C
	bl ov71_02248120
	adds r0, r4, #0
	bl ov71_022481EC
	adds r0, r4, #0
	bl ov71_0224809C
	ldr r0, [r4, #0x68]
	bl FUN_02026380
	ldr r0, [r4, #0x6c]
	bl FUN_02026380
	ldr r0, [r4, #0x70]
	bl ov71_02247498
	ldr r0, [r4, #0x54]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x54]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0x54]
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0x58
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_0200770C
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02247980
	bl FUN_02008780
_02247980:
	ldr r0, [r4, #0xc]
	bl FUN_02008524
	adds r0, r4, #0
	bl FUN_0201AB0C
_0224798C:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_02247924

	thumb_func_start ov71_02247990
ov71_02247990: @ 0x02247990
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r2, [r4]
	adds r5, r0, #0
	cmp r2, #4
	bhs _022479BE
	lsls r3, r2, #2
	ldr r2, _022479C4 @ =0x0224BC64
	adds r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _022479B4
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	str r0, [r5, #4]
_022479B4:
	adds r0, r5, #0
	bl ov71_022479C8
	movs r0, #0
	pop {r3, r4, r5, pc}
_022479BE:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_022479C4: .4byte 0x0224BC64
	thumb_func_end ov71_02247990

	thumb_func_start ov71_022479C8
ov71_022479C8: @ 0x022479C8
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	blx FUN_020CF670
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	blx FUN_020C23F4
	blx FUN_020B7350
	ldr r0, [r4, #0xc]
	bl FUN_02009418
	ldr r0, [r4, #0xc]
	bl FUN_02008120
	movs r2, #1
	str r2, [sp]
	movs r0, #0x12
	add r1, sp, #0
	blx FUN_020C2528
	ldr r0, [r4, #0x70]
	bl ov71_022474CC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov71_022479C8

	thumb_func_start ov71_02247A10
ov71_02247A10: @ 0x02247A10
	push {r3, r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, _02247C0C @ =0x0224BCBC
	bl FUN_02022BE8
	ldr r2, _02247C10 @ =0x04000304
	ldr r0, _02247C14 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldr r0, _02247C18 @ =0x0224BC74
	bl FUN_0201ACB0
	ldr r0, [r4, #0x54]
	ldr r2, _02247C1C @ =0x0224BC84
	movs r1, #1
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x54]
	ldr r2, _02247C20 @ =0x0224BCA0
	movs r1, #2
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x54]
	ldr r2, _02247C20 @ =0x0224BCA0
	movs r1, #6
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r2, _02247C24 @ =0x04000008
	movs r0, #3
	ldrh r3, [r2]
	movs r1, #1
	bics r3, r0
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r2, #0
	str r2, [sp]
	ldr r0, [r4, #0x54]
	adds r3, r1, #0
	bl FUN_0201C1F4
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4, #0x54]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201C8C4
	ldr r0, [r4]
	bl ov71_022473D0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x39
	str r0, [sp, #4]
	ldr r0, [r4, #0x54]
	movs r1, #1
	movs r2, #0x6d
	movs r3, #2
	bl FUN_0200E644
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	adds r1, r4, #0
	str r0, [sp, #8]
	movs r2, #1
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, [r4, #0x54]
	adds r1, #0x58
	movs r3, #2
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0xf
	bl FUN_0201D978
	movs r3, #0x20
	str r3, [sp]
	movs r0, #0x39
	str r0, [sp, #4]
	movs r0, #0x10
	movs r1, #8
	movs r2, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x54]
	movs r0, #0x59
	movs r1, #0x16
	movs r3, #2
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x54]
	movs r0, #0x59
	movs r1, #0x15
	movs r3, #2
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x39
	movs r2, #0
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #0x17
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x54]
	movs r0, #0x59
	movs r1, #0x16
	movs r3, #6
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x54]
	movs r0, #0x59
	movs r1, #0x15
	movs r3, #6
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x39
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #0x17
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	ldr r0, [r4, #0x54]
	movs r1, #1
	bl FUN_0201BF7C
	adds r0, r4, #0
	bl ov71_02247ED0
	movs r1, #0
	movs r0, #1
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov71_0224744C
	str r0, [r4, #0x70]
	adds r0, r4, #0
	bl ov71_02247F9C
	str r0, [r4, #0x10]
	movs r1, #0
	movs r0, #0x6a
	str r1, [sp]
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	ldr r0, _02247C28 @ =0x00073800
	movs r2, #0x59
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x70]
	movs r3, #0x1b
	bl ov71_02247610
	ldr r2, _02247C2C @ =0x0224BC5C
	str r0, [r4, #0x74]
	ldrh r3, [r2]
	add r0, sp, #0x14
	add r1, sp, #0x14
	strh r3, [r0]
	ldrh r3, [r2, #2]
	ldrh r2, [r2, #4]
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	ldr r0, [r4, #0x74]
	bl ov71_022476EC
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	adds r0, r4, #0
	bl ov71_02247FF8
	ldr r0, _02247C30 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	bl FUN_0203A880
	movs r0, #1
	movs r1, #0x38
	bl FUN_0203A948
	movs r0, #0x10
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	add sp, #0x1c
	pop {r3, r4, pc}
	.align 2, 0
_02247C0C: .4byte 0x0224BCBC
_02247C10: .4byte 0x04000304
_02247C14: .4byte 0xFFFF7FFF
_02247C18: .4byte 0x0224BC74
_02247C1C: .4byte 0x0224BC84
_02247C20: .4byte 0x0224BCA0
_02247C24: .4byte 0x04000008
_02247C28: .4byte 0x00073800
_02247C2C: .4byte 0x0224BC5C
_02247C30: .4byte 0x04000050
	thumb_func_end ov71_02247A10

	thumb_func_start ov71_02247C34
ov71_02247C34: @ 0x02247C34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r1]
	cmp r0, #0
	bne _02247C5A
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02247C5A
	ldr r0, [r4, #0x3c]
	movs r1, #1
	bl FUN_020248F0
	ldr r0, [r4, #0x3c]
	movs r1, #1
	bl FUN_02024830
	movs r0, #1
	pop {r4, pc}
_02247C5A:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_02247C34

	thumb_func_start ov71_02247C60
ov71_02247C60: @ 0x02247C60
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [r5]
	cmp r0, #4
	bhi _02247C9A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02247C7A: @ jump table
	.2byte _02247C84 - _02247C7A - 2 @ case 0
	.2byte _02247C90 - _02247C7A - 2 @ case 1
	.2byte _02247D04 - _02247C7A - 2 @ case 2
	.2byte _02247DB4 - _02247C7A - 2 @ case 3
	.2byte _02247DD4 - _02247C7A - 2 @ case 4
_02247C84:
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02247DE4
_02247C90:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	bgt _02247C9C
_02247C9A:
	b _02247DE4
_02247C9C:
	ldr r0, [r4]
	bl ov71_0224738C
	str r0, [sp, #0xc]
	ldr r0, [r4]
	bl ov71_02247388
	adds r7, r0, #0
	ldr r0, [r4]
	bl ov71_022473DC
	cmp r0, #1
	bne _02247CBC
	movs r1, #0
	movs r6, #2
	b _02247CC0
_02247CBC:
	movs r1, #4
	movs r6, #3
_02247CC0:
	ldr r0, [sp, #0xc]
	ldr r2, [r4, #0x68]
	bl FUN_0200BB6C
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x68]
	adds r0, r7, #0
	bl FUN_0200CBBC
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r4, #0
	ldr r2, [r4, #0x6c]
	adds r0, #0x58
	movs r1, #1
	bl FUN_020200A8
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0x6d
	movs r2, #2
	bl FUN_0200E948
	adds r0, r4, #0
	adds r0, #0x58
	bl FUN_0201D578
	movs r0, #0
	str r0, [r4, #8]
	str r6, [r5]
	b _02247DE4
_02247D04:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x3c
	ble _02247DE4
	ldr r0, [r4]
	bl ov71_0224738C
	adds r6, r0, #0
	ldr r0, [r4]
	bl ov71_02247388
	adds r7, r0, #0
	ldr r2, [r4, #0x68]
	adds r0, r6, #0
	movs r1, #1
	bl FUN_0200BB6C
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x68]
	adds r0, r7, #0
	bl FUN_0200CBBC
	ldr r0, [r4]
	bl ov71_02247390
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E640
	cmp r0, #0
	bne _02247D80
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02008550
	ldr r0, [r4]
	bl ov71_022473A8
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	add r1, sp, #0x10
	movs r3, #1
	bl FUN_020729A4
	ldr r0, [r4]
	bl ov71_022473A8
	adds r6, r0, #0
	ldr r0, [r4]
	bl ov71_022473B0
	adds r2, r0, #0
	add r1, sp, #0x10
	lsls r2, r2, #0x18
	ldrb r1, [r1]
	adds r0, r6, #0
	lsrs r2, r2, #0x18
	bl FUN_020062E0
_02247D80:
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0xf
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r4, #0
	ldr r2, [r4, #0x6c]
	adds r0, #0x58
	movs r1, #1
	bl FUN_020200A8
	adds r0, r4, #0
	adds r0, #0x58
	bl FUN_0201D8A0
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02247DE4
_02247DB4:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x3c
	ble _02247DE4
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02247DE4
_02247DD4:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x14
	ble _02247DE4
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02247DE4:
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov71_02247C60

	thumb_func_start ov71_02247DEC
ov71_02247DEC: @ 0x02247DEC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #4
	bhi _02247EC6
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02247E06: @ jump table
	.2byte _02247E10 - _02247E06 - 2 @ case 0
	.2byte _02247E2A - _02247E06 - 2 @ case 1
	.2byte _02247E50 - _02247E06 - 2 @ case 2
	.2byte _02247E7C - _02247E06 - 2 @ case 3
	.2byte _02247EAE - _02247E06 - 2 @ case 4
_02247E10:
	ldr r0, _02247ECC @ =0x000006A7
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0xc
	bl ov71_022480C0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02247EC6
_02247E2A:
	bl ov71_02248110
	cmp r0, #0
	beq _02247EC6
	ldr r0, [r5, #0x10]
	bl FUN_02008780
	ldr r0, [r5, #0x40]
	movs r1, #0
	bl FUN_020248F0
	ldr r0, [r5, #0x40]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02247EC6
_02247E50:
	ldr r0, [r5, #0x40]
	bl FUN_02024B68
	cmp r0, #0
	bne _02247EC6
	ldr r0, [r5, #0x74]
	movs r1, #1
	bl ov71_02247704
	movs r1, #0x10
	adds r0, r5, #0
	movs r2, #0
	adds r3, r1, #0
	bl ov71_022480C0
	adds r0, r5, #0
	bl ov71_0224817C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02247EC6
_02247E7C:
	bl ov71_022481D8
	cmp r0, #2
	bge _02247E8E
	adds r0, r5, #0
	bl ov71_022481C8
	cmp r0, #1
	bne _02247EC6
_02247E8E:
	movs r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02247EC6
_02247EAE:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02247EC6
	adds r0, r5, #0
	bl ov71_022481C8
	cmp r0, #0
	beq _02247EC6
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_02247EC6:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_02247ECC: .4byte 0x000006A7
	thumb_func_end ov71_02247DEC

	thumb_func_start ov71_02247ED0
ov71_02247ED0: @ 0x02247ED0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	blx FUN_020C2698
	blx FUN_020CF704
	ldr r0, _02247F78 @ =0x04000060
	ldr r2, _02247F7C @ =0xFFFFCFFD
	ldrh r1, [r0]
	ands r1, r2
	strh r1, [r0]
	ldrh r3, [r0]
	adds r1, r2, #2
	ands r3, r1
	movs r1, #0x10
	orrs r1, r3
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _02247F80 @ =0x0000CFFB
	ands r1, r3
	strh r1, [r0]
	adds r1, r2, #2
	ldrh r3, [r0]
	lsrs r2, r2, #0x11
	ands r3, r1
	movs r1, #8
	orrs r1, r3
	strh r1, [r0]
	movs r0, #0
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r1, _02247F84 @ =0x04000540
	movs r0, #2
	str r0, [r1]
	ldr r0, _02247F88 @ =0xBFFF0000
	str r0, [r1, #0x40]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02027000
	movs r0, #1
	lsls r0, r0, #0xe
	movs r1, #1
	bl FUN_02027008
	ldr r3, _02247F8C @ =0x02110924
	movs r0, #1
	movs r1, #0
	ldr r3, [r3]
	lsls r0, r0, #0xe
	adds r2, r1, #0
	blx r3
	ldr r3, _02247F90 @ =0x0211092C
	adds r4, r0, #0
	ldr r3, [r3]
	movs r0, #0x80
	movs r1, #0
	movs r2, #1
	blx r3
	ldr r2, _02247F94 @ =0x7FFF0000
	adds r6, r0, #0
	ands r2, r4
	lsls r1, r4, #0x10
	lsrs r2, r2, #0x10
	ldr r0, [r5, #0xc]
	lsrs r1, r1, #0xd
	lsls r2, r2, #4
	bl FUN_020093FC
	ldr r2, _02247F98 @ =0xFFFF0000
	lsls r1, r6, #0x10
	ands r2, r6
	lsrs r2, r2, #0x10
	ldr r0, [r5, #0xc]
	lsrs r1, r1, #0xd
	lsls r2, r2, #3
	bl FUN_02009408
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02247F78: .4byte 0x04000060
_02247F7C: .4byte 0xFFFFCFFD
_02247F80: .4byte 0x0000CFFB
_02247F84: .4byte 0x04000540
_02247F88: .4byte 0xBFFF0000
_02247F8C: .4byte 0x02110924
_02247F90: .4byte 0x0211092C
_02247F94: .4byte 0x7FFF0000
_02247F98: .4byte 0xFFFF0000
	thumb_func_end ov71_02247ED0

	thumb_func_start ov71_02247F9C
ov71_02247F9C: @ 0x02247F9C
	push {r3, r4, r5, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [r5]
	bl ov71_02247390
	adds r4, r0, #0
	add r0, sp, #0x10
	adds r1, r4, #0
	movs r2, #2
	movs r3, #0
	bl FUN_0207013C
	ldr r0, [r5]
	bl ov71_022473A8
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	adds r1, r5, #0
	ldr r0, [r0]
	adds r1, #0x14
	movs r3, #1
	bl FUN_02072914
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl FUN_02070854
	adds r3, r0, #0
	movs r1, #0
	str r1, [sp]
	adds r0, r5, #0
	str r1, [sp, #4]
	adds r0, #0x14
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0xc]
	adds r3, #0x50
	add r1, sp, #0x10
	movs r2, #0x80
	bl FUN_020085EC
	add sp, #0x20
	pop {r3, r4, r5, pc}
	thumb_func_end ov71_02247F9C

	thumb_func_start ov71_02247FF8
ov71_02247FF8: @ 0x02247FF8
	push {r4, lr}
	sub sp, #0x70
	adds r4, r0, #0
	adds r0, #0x44
	movs r1, #0x59
	movs r2, #7
	movs r3, #8
	bl ov71_022472C4
	add r0, sp, #0x5c
	blx FUN_020B804C
	add r0, sp, #0x38
	blx FUN_020B8008
	movs r3, #0
	str r3, [sp]
	movs r2, #1
	str r2, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	add r0, sp, #0x38
	str r0, [sp, #0x10]
	movs r0, #0x59
	movs r1, #9
	bl FUN_02007994
	movs r0, #0x39
	str r0, [sp]
	add r0, sp, #0x5c
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl FUN_02007974
	movs r0, #2
	adds r1, r4, #0
	str r0, [sp]
	add r0, sp, #0x14
	adds r1, #0x44
	add r2, sp, #0x38
	add r3, sp, #0x5c
	bl ov71_02247320
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x14
	movs r2, #0x80
	movs r3, #0x64
	bl ov71_02247340
	str r0, [r4, #0x3c]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x14
	movs r2, #0x80
	movs r3, #0x5a
	bl ov71_02247340
	str r0, [r4, #0x40]
	movs r1, #1
	bl FUN_02024A04
	ldr r0, [r4, #0x3c]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x40]
	movs r1, #0
	bl FUN_02024830
	add sp, #0x70
	pop {r4, pc}
	thumb_func_end ov71_02247FF8

	thumb_func_start ov71_0224809C
ov71_0224809C: @ 0x0224809C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_022480A4:
	ldr r0, [r5, #0x3c]
	cmp r0, #0
	beq _022480AE
	bl FUN_02024758
_022480AE:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _022480A4
	adds r6, #0x44
	adds r0, r6, #0
	bl ov71_022472FC
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_0224809C

	thumb_func_start ov71_022480C0
ov71_022480C0: @ 0x022480C0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x39
	movs r1, #0x14
	str r2, [sp]
	adds r7, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _02248106
	str r5, [r4]
	lsls r0, r6, #0xc
	str r0, [r4, #4]
	ldr r0, [sp]
	lsls r1, r0, #0xc
	str r1, [r4, #8]
	ldr r0, [r4, #4]
	subs r0, r1, r0
	adds r1, r7, #0
	blx FUN_020F2998
	str r0, [r4, #0xc]
	ldr r0, _02248108 @ =ov71_02248140
	str r7, [r4, #0x10]
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E33C
	str r0, [r5, #0x78]
	ldr r0, _0224810C @ =0x04000050
	movs r1, #1
	adds r2, r6, #0
	blx FUN_020CF178
_02248106:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02248108: .4byte ov71_02248140
_0224810C: .4byte 0x04000050
	thumb_func_end ov71_022480C0

	thumb_func_start ov71_02248110
ov71_02248110: @ 0x02248110
	ldr r0, [r0, #0x78]
	cmp r0, #0
	bne _0224811A
	movs r0, #1
	bx lr
_0224811A:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov71_02248110

	thumb_func_start ov71_02248120
ov71_02248120: @ 0x02248120
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _0224813C
	bl FUN_0201F988
	bl ov71_02247424
	ldr r0, [r4, #0x78]
	bl FUN_0200E390
	movs r0, #0
	str r0, [r4, #0x78]
_0224813C:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_02248120

	thumb_func_start ov71_02248140
ov71_02248140: @ 0x02248140
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x10]
	subs r0, r0, #1
	str r0, [r4, #0x10]
	cmp r0, #0
	ble _02248162
	ldr r1, [r4, #4]
	ldr r0, [r4, #0xc]
	adds r2, r1, r0
	str r2, [r4, #4]
	ldr r0, _02248178 @ =0x04000050
	movs r1, #1
	asrs r2, r2, #0xc
	blx FUN_020CF178
	pop {r4, pc}
_02248162:
	ldr r2, [r4, #8]
	ldr r0, _02248178 @ =0x04000050
	movs r1, #1
	asrs r2, r2, #0xc
	blx FUN_020CF178
	ldr r0, [r4]
	bl ov71_02248120
	pop {r4, pc}
	nop
_02248178: .4byte 0x04000050
	thumb_func_end ov71_02248140

	thumb_func_start ov71_0224817C
ov71_0224817C: @ 0x0224817C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x39
	movs r1, #0x30
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _022481BC
	str r5, [r4]
	ldr r0, [r5, #0x74]
	adds r1, r4, #0
	str r0, [r4, #4]
	adds r1, #8
	bl ov71_022476B4
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x14
	bl ov71_022476D4
	ldr r0, _022481C0 @ =0x00002F60
	movs r2, #0
	str r0, [r4, #0x1c]
	str r2, [r4, #0x20]
	strh r2, [r4, #0x2c]
	str r2, [r4, #0x24]
	ldr r0, _022481C4 @ =ov71_0224820C
	adds r1, r4, #0
	str r2, [r4, #0x28]
	bl FUN_0200E320
	str r0, [r5, #0x7c]
_022481BC:
	pop {r3, r4, r5, pc}
	nop
_022481C0: .4byte 0x00002F60
_022481C4: .4byte ov71_0224820C
	thumb_func_end ov71_0224817C

	thumb_func_start ov71_022481C8
ov71_022481C8: @ 0x022481C8
	ldr r0, [r0, #0x7c]
	cmp r0, #0
	bne _022481D2
	movs r0, #1
	bx lr
_022481D2:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov71_022481C8

	thumb_func_start ov71_022481D8
ov71_022481D8: @ 0x022481D8
	push {r3, lr}
	ldr r0, [r0, #0x7c]
	cmp r0, #0
	beq _022481E8
	bl FUN_0201F988
	ldr r0, [r0, #0x20]
	pop {r3, pc}
_022481E8:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov71_022481D8

	thumb_func_start ov71_022481EC
ov71_022481EC: @ 0x022481EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x7c]
	cmp r0, #0
	beq _02248208
	bl FUN_0201F988
	bl FUN_0201AB0C
	ldr r0, [r4, #0x7c]
	bl FUN_0200E390
	movs r0, #0
	str r0, [r4, #0x7c]
_02248208:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_022481EC

	thumb_func_start ov71_0224820C
ov71_0224820C: @ 0x0224820C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _02248280
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x1c]
	adds r0, r1, r0
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	blt _0224822E
	movs r0, #0x1e
	lsls r0, r0, #6
	subs r0, r1, r0
	str r0, [r4, #0x1c]
	b _02248280
_0224822E:
	movs r0, #0x1e
	lsls r0, r0, #6
	subs r0, r1, r0
	str r0, [r4, #0x1c]
	ldr r1, [r4, #0xc]
	ldr r0, _022482E4 @ =0xFFFFC000
	cmp r1, r0
	bgt _02248280
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	movs r0, #0x2c
	muls r0, r1, r0
	movs r1, #0x64
	blx FUN_020F2998
	rsbs r1, r0, #0
	movs r0, #0xfa
	lsls r0, r0, #4
	str r1, [r4, #0x1c]
	cmp r1, r0
	bge _0224825C
	movs r0, #1
	str r0, [r4, #0x24]
_0224825C:
	ldr r0, _022482E8 @ =0x000005E6
	bl FUN_0200604C
	ldr r0, [r4, #0x20]
	adds r0, r0, #1
	str r0, [r4, #0x20]
	cmp r0, #1
	beq _02248272
	cmp r0, #3
	beq _02248278
	b _02248280
_02248272:
	movs r0, #0xb0
	strh r0, [r4, #0x2c]
	b _02248280
_02248278:
	movs r0, #0x2c
	ldrsh r0, [r4, r0]
	adds r0, #0x50
	strh r0, [r4, #0x2c]
_02248280:
	movs r0, #0x14
	movs r2, #0x2c
	ldrsh r3, [r4, r0]
	ldrsh r0, [r4, r2]
	adds r1, r4, #0
	adds r1, #0x14
	adds r0, r3, r0
	strh r0, [r4, #0x14]
	movs r0, #0x18
	ldrsh r3, [r4, r0]
	ldrsh r0, [r4, r2]
	subs r0, r3, r0
	strh r0, [r4, #0x18]
	ldr r0, [r4, #4]
	bl ov71_022476EC
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	ldr r5, [r4, #8]
	adds r1, r4, #0
	lsls r0, r3, #2
	adds r0, r3, r0
	adds r0, r5, r0
	str r0, [r4, #8]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x10]
	adds r1, #8
	lsls r0, r2, #2
	adds r0, r2, r0
	adds r0, r3, r0
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	bl ov71_022476C4
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _022482E2
	movs r0, #0x2c
	ldrsh r0, [r4, r0]
	subs r0, #0xe
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x28]
	adds r0, r0, #1
	str r0, [r4, #0x28]
	cmp r0, #0x1e
	ble _022482E2
	ldr r0, [r4]
	bl ov71_022481EC
_022482E2:
	pop {r3, r4, r5, pc}
	.align 2, 0
_022482E4: .4byte 0xFFFFC000
_022482E8: .4byte 0x000005E6
	thumb_func_end ov71_0224820C

	thumb_func_start ov71_022482EC
ov71_022482EC: @ 0x022482EC
	push {r3, r4, r5, lr}
	movs r1, #0x5b
	adds r5, r0, #0
	movs r0, #0x39
	lsls r1, r1, #2
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _0224834E
	str r5, [r4]
	movs r0, #0
	str r0, [r4, #4]
	adds r0, r5, #0
	bl ov71_02247384
	adds r1, r4, #0
	adds r1, #0xc0
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xd4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xcc
	str r1, [r0]
	movs r0, #0x16
	lsls r0, r0, #4
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	bl FUN_0201FDB8
	adds r1, r4, #0
	adds r1, #0xbc
	str r0, [r1]
	adds r0, r4, #0
	movs r2, #0
	adds r0, #0xd0
	str r2, [r0]
	movs r0, #0x5a
	lsls r0, r0, #2
	str r2, [r4, r0]
	ldr r0, _02248354 @ =ov71_02248B60
	adds r1, r4, #0
	bl FUN_0200E374
_0224834E:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02248354: .4byte ov71_02248B60
	thumb_func_end ov71_022482EC

	thumb_func_start ov71_02248358
ov71_02248358: @ 0x02248358
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	blx FUN_020D3A38
	adds r4, r0, #0
	cmp r5, #0
	beq _022483A4
	adds r0, r5, #0
	bl ov71_0224889C
	adds r0, r5, #0
	bl ov71_022489F8
	adds r0, r5, #0
	bl ov71_02248B24
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02248386
	bl FUN_0200E390
_02248386:
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02248394
	bl ov71_02248E04
_02248394:
	adds r0, r5, #0
	adds r0, #0xbc
	ldr r0, [r0]
	bl FUN_0201FD74
	adds r0, r5, #0
	bl FUN_0201AB0C
_022483A4:
	adds r0, r4, #0
	blx FUN_020D3A4C
	pop {r3, r4, r5, pc}
	thumb_func_end ov71_02248358

	thumb_func_start ov71_022483AC
ov71_022483AC: @ 0x022483AC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r2, [r4]
	adds r5, r0, #0
	cmp r2, #4
	bhs _022483DA
	lsls r3, r2, #2
	ldr r2, _022483E0 @ =0x0224BCFC
	adds r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _022483D0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	str r0, [r5, #4]
_022483D0:
	adds r0, r5, #0
	bl ov71_022483E4
	movs r0, #0
	pop {r3, r4, r5, pc}
_022483DA:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_022483E0: .4byte 0x0224BCFC
	thumb_func_end ov71_022483AC

	thumb_func_start ov71_022483E4
ov71_022483E4: @ 0x022483E4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02248404
	blx FUN_020CF670
	adds r4, #0xd4
	ldr r0, [r4]
	bl ov71_022474CC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
_02248404:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_022483E4

	thumb_func_start ov71_02248408
ov71_02248408: @ 0x02248408
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov71_02248604
	adds r0, r4, #0
	bl ov71_022488E4
	adds r0, r4, #0
	bl ov71_02248A08
	movs r0, #8
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov71_02248408

	thumb_func_start ov71_0224843C
ov71_0224843C: @ 0x0224843C
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _0224844C
	cmp r1, #1
	beq _02248462
	b _0224847A
_0224844C:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0224847A
	ldr r0, _02248480 @ =0x0224C0C4
	movs r1, #0
	str r1, [r0]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224847A
_02248462:
	ldr r1, _02248480 @ =0x0224C0C4
	ldr r2, [r1]
	cmp r2, #0x1e
	bge _0224846E
	adds r2, r2, #1
	str r2, [r1]
_0224846E:
	adds r0, #0xd0
	ldr r0, [r0]
	cmp r0, #0
	beq _0224847A
	movs r0, #1
	pop {r4, pc}
_0224847A:
	movs r0, #0
	pop {r4, pc}
	nop
_02248480: .4byte 0x0224C0C4
	thumb_func_end ov71_0224843C

	thumb_func_start ov71_02248484
ov71_02248484: @ 0x02248484
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #4
	bhi _0224852A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224849C: @ jump table
	.2byte _022484A6 - _0224849C - 2 @ case 0
	.2byte _022484B2 - _0224849C - 2 @ case 1
	.2byte _022484F6 - _0224849C - 2 @ case 2
	.2byte _0224850C - _0224849C - 2 @ case 3
	.2byte _02248522 - _0224849C - 2 @ case 4
_022484A6:
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224852A
_022484B2:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #8
	ble _0224852A
	adds r0, r4, #0
	adds r0, #0xd8
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0x1f
	movs r3, #0x18
	bl ov71_02248E30
	adds r0, r4, #0
	bl ov71_02248EB4
	movs r1, #0x16
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r4, #0
	adds r0, #0xd8
	ldr r0, [r0]
	movs r1, #0
	bl ov71_02247708
	adds r4, #0xd8
	ldr r0, [r4]
	movs r1, #1
	bl ov71_02247704
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224852A
_022484F6:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov71_02249260
	cmp r0, #0
	beq _0224852A
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224852A
_0224850C:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov71_02249254
	cmp r0, #0
	beq _0224852A
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224852A
_02248522:
	bl ov71_02248B54
	movs r0, #1
	pop {r3, r4, r5, pc}
_0224852A:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov71_02248484

	thumb_func_start ov71_02248530
ov71_02248530: @ 0x02248530
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r1, #0
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #4
	bhi _022485F4
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224854A: @ jump table
	.2byte _02248554 - _0224854A - 2 @ case 0
	.2byte _0224856A - _0224854A - 2 @ case 1
	.2byte _02248588 - _0224854A - 2 @ case 2
	.2byte _022485A4 - _0224854A - 2 @ case 3
	.2byte _022485E6 - _0224854A - 2 @ case 4
_02248554:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov71_0224926C
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022485F4
_0224856A:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #2
	ble _022485F4
	movs r0, #0
	str r0, [r4, #8]
	adds r4, #0xc4
	ldr r0, [r4]
	bl ov71_02246D40
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022485F4
_02248588:
	adds r1, r4, #0
	adds r1, #0xc8
	ldr r1, [r1]
	cmp r1, #0
	bne _022485F4
	movs r1, #0x59
	lsls r1, r1, #2
	adds r1, r4, r1
	bl ov71_02248D0C
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022485F4
_022485A4:
	ldr r0, [r4, #8]
	cmp r0, #0x28
	bge _022485B8
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x28
	bne _022485B8
	ldr r0, _022485FC @ =0x000006AF
	bl FUN_0200604C
_022485B8:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov71_02249254
	cmp r0, #0
	beq _022485F4
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0
	ldr r3, _02248600 @ =0x00007FFF
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022485F4
_022485E6:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _022485F4
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_022485F4:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_022485FC: .4byte 0x000006AF
_02248600: .4byte 0x00007FFF
	thumb_func_end ov71_02248530

	thumb_func_start ov71_02248604
ov71_02248604: @ 0x02248604
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, _02248880 @ =0x0224BD54
	bl FUN_02022BE8
	ldr r2, _02248884 @ =0x04000304
	ldr r0, _02248888 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0224888C @ =0x0224BCEC
	bl FUN_0201ACB0
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r2, _02248890 @ =0x0224BD1C
	movs r1, #2
	movs r3, #1
	bl FUN_0201B1E4
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r2, _02248890 @ =0x0224BD1C
	movs r1, #6
	movs r3, #1
	bl FUN_0201B1E4
	blx FUN_020D3A38
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r2, _02248894 @ =0x0224BD38
	movs r1, #3
	movs r3, #2
	bl FUN_0201B1E4
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r2, _02248894 @ =0x0224BD38
	movs r1, #7
	movs r3, #2
	bl FUN_0201B1E4
	adds r0, r5, #0
	blx FUN_020D3A4C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	adds r2, r4, #0
	str r0, [sp, #0xc]
	adds r2, #0xc0
	movs r1, #2
	ldr r2, [r2]
	movs r0, #0x59
	adds r3, r1, #0
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	adds r2, r4, #0
	str r0, [sp, #0xc]
	adds r2, #0xc0
	ldr r2, [r2]
	movs r0, #0x59
	movs r1, #2
	movs r3, #6
	bl FUN_020078F0
	movs r1, #0
	str r1, [sp]
	adds r2, r4, #0
	str r1, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	adds r2, #0xc0
	ldr r2, [r2]
	movs r0, #0x59
	movs r3, #2
	bl FUN_02007914
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	adds r2, r4, #0
	str r0, [sp, #0xc]
	adds r2, #0xc0
	ldr r2, [r2]
	movs r0, #0x59
	movs r3, #6
	bl FUN_02007914
	ldr r0, [r4]
	bl ov71_022473A0
	adds r5, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x39
	movs r2, #0
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #3
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x39
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #3
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	ldr r0, _02248898 @ =0x0224BCE4
	lsls r1, r5, #1
	ldrh r5, [r0, r1]
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0x59
	movs r1, #3
	movs r2, #0
	adds r3, r5, #0
	bl FUN_02007950
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0x59
	movs r1, #3
	movs r2, #4
	adds r3, r5, #0
	bl FUN_02007950
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	adds r2, r4, #0
	str r0, [sp, #0xc]
	adds r2, #0xc0
	ldr r2, [r2]
	movs r0, #0x59
	movs r1, #5
	movs r3, #3
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	adds r2, r4, #0
	str r0, [sp, #0xc]
	adds r2, #0xc0
	ldr r2, [r2]
	movs r0, #0x59
	movs r1, #5
	movs r3, #7
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	adds r2, r4, #0
	str r0, [sp, #0xc]
	adds r2, #0xc0
	ldr r2, [r2]
	movs r0, #0x59
	movs r1, #4
	movs r3, #3
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	adds r2, r4, #0
	str r0, [sp, #0xc]
	adds r2, #0xc0
	ldr r2, [r2]
	movs r0, #0x59
	movs r1, #4
	movs r3, #7
	bl FUN_02007914
	movs r0, #0x39
	movs r1, #0x60
	bl FUN_0201AA8C
	adds r5, r0, #0
	beq _0224880A
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0x60
	blx FUN_020D47EC
	adds r0, r5, #0
	movs r1, #0x60
	blx DC_FlushRange
	blx FUN_020D0524
	blx FUN_020D0774
	movs r1, #6
	adds r0, r5, #0
	lsls r1, r1, #0xc
	movs r2, #0x60
	blx FUN_020D05C4
	movs r1, #6
	adds r0, r5, #0
	lsls r1, r1, #0xc
	movs r2, #0x60
	blx FUN_020D078C
	blx FUN_020D0634
	blx FUN_020D07F0
	adds r0, r5, #0
	bl FUN_0201AB0C
_0224880A:
	adds r0, r4, #0
	adds r0, #0xc0
	movs r3, #0xff
	ldr r0, [r0]
	movs r1, #6
	movs r2, #3
	mvns r3, r3
	bl FUN_0201BC8C
	movs r0, #7
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	adds r0, r4, #0
	adds r0, #0xc0
	movs r1, #3
	ldr r0, [r0]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	adds r0, #0xc8
	movs r1, #1
	bl ov71_02246C6C
	adds r1, r4, #0
	adds r1, #0xc4
	str r0, [r1]
	movs r0, #0x4a
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xd0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0xc0
	movs r1, #0x12
	movs r2, #1
	ldr r0, [r0]
	lsls r1, r1, #6
	lsls r2, r2, #0xc
	movs r3, #1
	bl ov71_02247000
	adds r4, #0xcc
	str r0, [r4]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_02248880: .4byte 0x0224BD54
_02248884: .4byte 0x04000304
_02248888: .4byte 0xFFFF7FFF
_0224888C: .4byte 0x0224BCEC
_02248890: .4byte 0x0224BD1C
_02248894: .4byte 0x0224BD38
_02248898: .4byte 0x0224BCE4
	thumb_func_end ov71_02248604

	thumb_func_start ov71_0224889C
ov71_0224889C: @ 0x0224889C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xc8
	ldr r0, [r0]
	cmp r0, #0
	beq _022488B2
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	bl ov71_02246D54
_022488B2:
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0201BB4C
	adds r4, #0xc0
	ldr r0, [r4]
	movs r1, #7
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_0224889C

	thumb_func_start ov71_022488E4
ov71_022488E4: @ 0x022488E4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	blx FUN_020C2698
	blx FUN_020CF704
	ldr r0, _022489C4 @ =0x04000060
	ldr r1, _022489C8 @ =0xFFFFCFFD
	ldrh r2, [r0]
	ands r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	adds r2, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _022489CC @ =0x0000CFFB
	ands r2, r3
	strh r2, [r0]
	adds r2, r1, #2
	ldrh r3, [r0]
	adds r1, r1, #2
	ands r3, r2
	movs r2, #8
	orrs r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	ands r2, r1
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r0]
	ldr r0, _022489D0 @ =0x0224BD0C
	blx FUN_020CF8E4
	movs r1, #0
	ldr r0, _022489D4 @ =0x000043FF
	ldr r2, _022489D8 @ =0x00007FFF
	movs r3, #0x3f
	str r1, [sp]
	blx FUN_020CF910
	ldr r1, _022489DC @ =0x04000540
	movs r0, #2
	str r0, [r1]
	ldr r0, _022489E0 @ =0xBFFF0000
	str r0, [r1, #0x40]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02027000
	movs r0, #1
	lsls r0, r0, #0xe
	movs r1, #1
	bl FUN_02027008
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r1, _022489E4 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	strh r2, [r1]
	movs r1, #0
	movs r0, #1
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov71_0224744C
	adds r1, r4, #0
	adds r1, #0xd4
	str r0, [r1]
	movs r1, #0
	ldr r0, _022489E8 @ =0xFFFC8800
	str r1, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r4, #0
	str r1, [sp, #0xc]
	adds r0, #0xd4
	ldr r0, [r0]
	movs r2, #0x59
	movs r3, #0x1b
	bl ov71_02247610
	adds r1, r4, #0
	adds r1, #0xd8
	str r0, [r1]
	ldr r1, _022489EC @ =0x0000EBE0
	ldr r0, _022489F0 @ =0x0224C0C4
	strh r1, [r0, #4]
	movs r1, #0
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	ldr r1, _022489F4 @ =0x0224C0C8
	bl ov71_0224780C
	adds r4, #0xd8
	movs r1, #7
	ldr r0, [r4]
	lsls r1, r1, #0xa
	bl ov71_02247730
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_022489C4: .4byte 0x04000060
_022489C8: .4byte 0xFFFFCFFD
_022489CC: .4byte 0x0000CFFB
_022489D0: .4byte 0x0224BD0C
_022489D4: .4byte 0x000043FF
_022489D8: .4byte 0x00007FFF
_022489DC: .4byte 0x04000540
_022489E0: .4byte 0xBFFF0000
_022489E4: .4byte 0x04000008
_022489E8: .4byte 0xFFFC8800
_022489EC: .4byte 0x0000EBE0
_022489F0: .4byte 0x0224C0C4
_022489F4: .4byte 0x0224C0C8
	thumb_func_end ov71_022488E4

	thumb_func_start ov71_022489F8
ov71_022489F8: @ 0x022489F8
	push {r3, lr}
	adds r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02248A06
	bl ov71_02247498
_02248A06:
	pop {r3, pc}
	thumb_func_end ov71_022489F8

	thumb_func_start ov71_02248A08
ov71_02248A08: @ 0x02248A08
	push {r4, r5, r6, r7, lr}
	sub sp, #0x74
	adds r7, r0, #0
	adds r0, #0xc
	movs r1, #0x59
	movs r2, #0xb
	movs r3, #0xc
	bl ov71_022472C4
	add r0, sp, #0x60
	blx FUN_020B804C
	add r0, sp, #0x3c
	blx FUN_020B8008
	movs r3, #0
	str r3, [sp]
	movs r2, #1
	str r2, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	add r0, sp, #0x3c
	str r0, [sp, #0x10]
	movs r0, #0x59
	movs r1, #0xd
	bl FUN_02007994
	movs r3, #0
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	add r0, sp, #0x3c
	str r0, [sp, #0x10]
	movs r0, #0x59
	movs r1, #0xd
	movs r2, #1
	bl FUN_02007994
	movs r0, #0x39
	str r0, [sp]
	add r0, sp, #0x60
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #0xe
	movs r2, #1
	movs r3, #0
	bl FUN_02007974
	movs r0, #0x39
	str r0, [sp]
	add r0, sp, #0x60
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #0xe
	movs r2, #2
	movs r3, #0
	bl FUN_02007974
	movs r0, #1
	adds r1, r7, #0
	str r0, [sp]
	add r0, sp, #0x18
	adds r1, #0xc
	add r2, sp, #0x3c
	add r3, sp, #0x60
	bl ov71_02247320
	ldr r0, _02248B20 @ =0x035947D1
	bl FUN_0201FD74
	movs r0, #0
	str r0, [sp, #0x14]
	adds r4, r7, #0
_02248AA2:
	bl FUN_0201FDB8
	movs r1, #0xe8
	blx FUN_020F2BA4
	adds r6, r1, #0
	adds r6, #0xc
	bl FUN_0201FDB8
	movs r1, #0x71
	lsls r1, r1, #2
	blx FUN_020F2BA4
	adds r5, r1, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	subs r5, #0x1c
	str r0, [sp, #4]
	ldr r0, [r7]
	add r1, sp, #0x18
	adds r2, r6, #0
	adds r3, r5, #0
	bl ov71_02247340
	str r0, [r4, #0x1c]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r5, #0x38
	ldr r0, [r7]
	add r1, sp, #0x18
	adds r2, r6, #0
	adds r3, r5, #0
	bl ov71_02247340
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_020248F0
	ldr r0, [r4, #0x20]
	movs r1, #1
	bl FUN_020248F0
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [sp, #0x14]
	adds r4, #8
	adds r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #0x14
	blt _02248AA2
	add sp, #0x74
	pop {r4, r5, r6, r7, pc}
	nop
_02248B20: .4byte 0x035947D1
	thumb_func_end ov71_02248A08

	thumb_func_start ov71_02248B24
ov71_02248B24: @ 0x02248B24
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_02248B2C:
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _02248B36
	bl FUN_02024758
_02248B36:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _02248B40
	bl FUN_02024758
_02248B40:
	adds r4, r4, #1
	adds r5, #8
	cmp r4, #0x14
	blt _02248B2C
	adds r6, #0xc
	adds r0, r6, #0
	bl ov71_022472FC
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov71_02248B24

	thumb_func_start ov71_02248B54
ov71_02248B54: @ 0x02248B54
	movs r1, #0x5a
	movs r2, #1
	lsls r1, r1, #2
	str r2, [r0, r1]
	bx lr
	.align 2, 0
	thumb_func_end ov71_02248B54

	thumb_func_start ov71_02248B60
ov71_02248B60: @ 0x02248B60
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x5a
	adds r4, r1, #0
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _02248BB4
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xc0
	movs r3, #0xff
	ldr r0, [r0]
	movs r1, #2
	movs r2, #3
	mvns r3, r3
	bl FUN_0201BC8C
	adds r4, #0xc0
	ldr r0, [r4]
	movs r1, #6
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	movs r0, #3
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #7
	movs r1, #1
	bl FUN_0201BC28
	ldr r2, _02248BB8 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	adds r0, r5, #0
	bl FUN_0200E390
_02248BB4:
	pop {r3, r4, r5, pc}
	nop
_02248BB8: .4byte 0x04000304
	thumb_func_end ov71_02248B60

	thumb_func_start ov71_02248BBC
ov71_02248BBC: @ 0x02248BBC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	str r5, [r2, #4]
	adds r0, r2, #0
	str r1, [r0]
	movs r1, #0x52
	movs r7, #0
	lsls r1, r1, #2
	str r7, [r0, r1]
	adds r1, r1, #4
	str r2, [sp]
	str r7, [r0, r1]
	adds r4, r2, #0
	adds r6, r2, #0
_02248BD8:
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r5, #0x1c]
	bl FUN_020248AC
	adds r2, r6, #0
	adds r3, r0, #0
	ldm r3!, {r0, r1}
	adds r2, #0x58
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r7, r7, #1
	str r0, [r2]
	adds r4, r4, #4
	adds r5, #8
	adds r6, #0xc
	cmp r7, #0x14
	blt _02248BD8
	ldr r0, _02248C20 @ =ov71_02248C24
	ldr r1, [sp]
	movs r2, #0
	bl FUN_0200E320
	ldr r1, [sp]
	ldr r1, [r1]
	str r0, [r1]
	ldr r0, [sp]
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	bne _02248C1C
	ldr r0, [sp]
	bl FUN_0201AB0C
_02248C1C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02248C20: .4byte ov71_02248C24
	thumb_func_end ov71_02248BBC

	thumb_func_start ov71_02248C24
ov71_02248C24: @ 0x02248C24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r1, #0
	movs r1, #0x52
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r0, r0, #1
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	cmp r0, #0xc
	ble _02248C58
	movs r0, #0
	str r0, [r5, r1]
	adds r0, r1, #4
	ldr r0, [r5, r0]
	cmp r0, #0x14
	bge _02248C58
	lsls r0, r0, #2
	movs r2, #1
	adds r0, r5, r0
	str r2, [r0, #8]
	adds r0, r1, #4
	ldr r0, [r5, r0]
	adds r2, r0, #1
	adds r0, r1, #4
	str r2, [r5, r0]
_02248C58:
	movs r0, #0
	adds r7, r5, #0
	str r0, [sp, #4]
	adds r6, r5, #0
	str r5, [sp]
	adds r4, r0, #0
	adds r7, #0x58
_02248C66:
	movs r1, #0x21
	ldr r2, [r6, #0x5c]
	lsls r1, r1, #0xc
	adds r2, r2, r1
	movs r1, #0x6a
	adds r0, r6, #0
	lsls r1, r1, #0xe
	adds r0, #0x5c
	str r2, [r6, #0x5c]
	cmp r2, r1
	blt _02248CA6
	movs r1, #0x71
	ldr r2, [r0]
	lsls r1, r1, #0xe
	subs r1, r2, r1
	str r1, [r0]
	ldr r0, [sp]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02248CA6
	ldr r0, [r5, #4]
	movs r1, #1
	adds r0, r0, r4
	ldr r0, [r0, #0x1c]
	bl FUN_02024830
	ldr r0, [r5, #4]
	movs r1, #1
	adds r0, r0, r4
	ldr r0, [r0, #0x20]
	bl FUN_02024830
_02248CA6:
	ldr r0, [r5, #4]
	adds r1, r7, #0
	adds r0, r0, r4
	ldr r0, [r0, #0x1c]
	bl FUN_020247D4
	adds r2, r6, #0
	adds r2, #0x58
	add r3, sp, #8
	ldm r2!, {r0, r1}
	mov ip, r3
	stm r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	movs r0, #0xe
	ldr r1, [sp, #0xc]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0xc]
	ldr r0, [r5, #4]
	mov r1, ip
	adds r0, r0, r4
	ldr r0, [r0, #0x20]
	bl FUN_020247D4
	ldr r0, [sp]
	adds r6, #0xc
	adds r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r4, #8
	adds r0, r0, #1
	adds r7, #0xc
	str r0, [sp, #4]
	cmp r0, #0x14
	blt _02248C66
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov71_02248C24

	thumb_func_start ov71_02248CF4
ov71_02248CF4: @ 0x02248CF4
	push {r4, lr}
	adds r4, r0, #0
	beq _02248D0A
	bl FUN_0201F988
	ldr r0, [r0]
	movs r1, #0
	str r1, [r0]
	adds r0, r4, #0
	bl FUN_0200E390
_02248D0A:
	pop {r4, pc}
	thumb_func_end ov71_02248CF4

	thumb_func_start ov71_02248D0C
ov71_02248D0C: @ 0x02248D0C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	movs r1, #0x17
	adds r6, r0, #0
	movs r0, #0x39
	lsls r1, r1, #4
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _02248D78
	str r6, [r4]
	adds r6, #0xc0
	movs r0, #0x55
	ldr r1, [r6]
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_0201BE00
	lsls r1, r0, #0xc
	movs r0, #0x56
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #6
	bl FUN_0201BE00
	movs r1, #0x57
	lsls r0, r0, #0xc
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r2, #0
	adds r0, r1, #4
	str r2, [r4, r0]
	adds r0, r1, #0
	adds r0, #8
	str r2, [r4, r0]
	adds r0, r1, #0
	adds r0, #0xc
	str r5, [r4, r0]
	adds r1, #0x10
	str r2, [r4, r1]
	ldr r0, _02248D7C @ =ov71_02248D80
	adds r1, r4, #0
	bl FUN_0200E33C
	str r0, [r5]
	cmp r0, #0
	bne _02248D78
	adds r0, r4, #0
	bl FUN_0201AB0C
_02248D78:
	pop {r4, r5, r6, pc}
	nop
_02248D7C: .4byte ov71_02248D80
	thumb_func_end ov71_02248D0C

	thumb_func_start ov71_02248D80
ov71_02248D80: @ 0x02248D80
	push {r4, r5, r6, lr}
	movs r3, #0x59
	adds r4, r1, #0
	lsls r3, r3, #2
	movs r0, #2
	ldr r1, [r4, r3]
	lsls r0, r0, #0x14
	cmp r1, r0
	bge _02248E02
	subs r0, r3, #4
	ldr r1, [r4, r0]
	adds r0, r3, #0
	subs r0, #0x44
	adds r1, r1, r0
	subs r0, r3, #4
	str r1, [r4, r0]
	adds r5, r3, #0
	ldr r1, [r4, r3]
	ldr r0, [r4, r0]
	subs r5, #0xc
	adds r0, r1, r0
	str r0, [r4, r3]
	adds r0, r3, #0
	subs r0, #0x10
	ldr r5, [r4, r5]
	ldr r3, [r4, r3]
	ldr r0, [r4, r0]
	subs r3, r5, r3
	movs r1, #2
	movs r2, #3
	asrs r3, r3, #0xc
	bl FUN_0201BC8C
	movs r5, #0x55
	lsls r5, r5, #2
	adds r3, r5, #0
	ldr r0, [r4, r5]
	adds r3, #8
	adds r5, #0x10
	ldr r6, [r4, r3]
	ldr r3, [r4, r5]
	movs r1, #6
	subs r3, r6, r3
	movs r2, #3
	asrs r3, r3, #0xc
	bl FUN_0201BC8C
	movs r1, #0x59
	lsls r1, r1, #2
	movs r0, #2
	ldr r2, [r4, r1]
	lsls r0, r0, #0x12
	cmp r2, r0
	blt _02248E02
	adds r0, r1, #0
	adds r0, #8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02248E02
	adds r1, #8
	ldr r0, [r4]
	adds r1, r4, r1
	adds r2, r4, #4
	bl ov71_02248BBC
_02248E02:
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_02248D80

	thumb_func_start ov71_02248E04
ov71_02248E04: @ 0x02248E04
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	beq _02248E2E
	bl FUN_0201F988
	adds r4, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	movs r2, #0
	str r2, [r1]
	adds r0, r0, #4
	ldr r0, [r4, r0]
	bl ov71_02248CF4
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
_02248E2E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov71_02248E04

	thumb_func_start ov71_02248E30
ov71_02248E30: @ 0x02248E30
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	adds r5, r1, #0
	movs r0, #0x39
	movs r1, #0x14
	adds r7, r2, #0
	adds r6, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _02248E70
	lsls r0, r5, #0xc
	str r0, [r4]
	lsls r1, r7, #0xc
	str r1, [r4, #8]
	ldr r0, [r4]
	subs r0, r1, r0
	adds r1, r6, #0
	blx FUN_020F2998
	str r0, [r4, #4]
	ldr r0, [sp]
	str r6, [r4, #0xc]
	adds r1, r5, #0
	str r0, [r4, #0x10]
	bl ov71_02247708
	ldr r0, _02248E74 @ =ov71_02248E78
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
_02248E70:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02248E74: .4byte ov71_02248E78
	thumb_func_end ov71_02248E30

	thumb_func_start ov71_02248E78
ov71_02248E78: @ 0x02248E78
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	subs r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0
	ble _02248E9A
	ldr r1, [r4]
	ldr r0, [r4, #4]
	adds r1, r1, r0
	str r1, [r4]
	ldr r0, [r4, #0x10]
	asrs r1, r1, #0xc
	bl ov71_02247708
	pop {r3, r4, r5, pc}
_02248E9A:
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x10]
	asrs r1, r1, #0xc
	bl ov71_02247708
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov71_02248E78

	thumb_func_start ov71_02248EB4
ov71_02248EB4: @ 0x02248EB4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xdc
	adds r0, #0xd8
	adds r1, r4, #0
	ldr r0, [r0]
	adds r1, #8
	bl ov71_022476B4
	adds r0, r5, #0
	adds r0, #0xd8
	adds r1, r4, #0
	ldr r0, [r0]
	adds r1, #0x20
	bl ov71_022476D4
	adds r3, r4, #0
	adds r3, #8
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	adds r2, #0x14
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	adds r0, r5, #0
	adds r0, #0xd4
	ldr r0, [r0]
	str r0, [r4, #4]
	adds r0, r5, #0
	adds r0, #0xd8
	ldr r0, [r0]
	adds r5, #0xdc
	str r0, [r5]
	ldr r0, [r4, #0xc]
	str r0, [r4, #0x28]
	ldr r1, [r4, #0xc]
	ldr r0, _02248F84 @ =0xFFFF8000
	subs r0, r0, r1
	movs r1, #0x1e
	blx FUN_020F2998
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r2, #1
	movs r1, #0x1e
	adds r0, #0x80
	str r1, [r0]
	movs r1, #0
	str r1, [r4, #0x38]
	str r1, [r4, #0x3c]
	str r1, [r4, #0x40]
	adds r0, r4, #0
	str r1, [r4, #0x44]
	adds r0, #0x54
	strh r1, [r0]
	adds r0, r4, #0
	lsls r2, r2, #0xe
	adds r0, #0x56
	strh r2, [r0]
	adds r0, r4, #0
	adds r0, #0x5a
	strh r1, [r0]
	str r1, [r4, #0x7c]
	adds r2, r4, #0
	adds r0, r1, #0
_02248F38:
	adds r3, r2, #0
	adds r3, #0x5c
	strh r0, [r3]
	adds r3, r2, #0
	adds r3, #0x5e
	strh r0, [r3]
	adds r3, r2, #0
	adds r3, #0x60
	strh r0, [r3]
	adds r3, r2, #0
	adds r3, #0x62
	adds r1, r1, #1
	adds r2, #8
	strh r0, [r3]
	cmp r1, #3
	blt _02248F38
	movs r1, #0xd
	str r0, [r4, #0x78]
	adds r0, r4, #0
	lsls r1, r1, #8
	movs r2, #0x1e
	bl ov71_02248F8C
	movs r1, #0x29
	movs r2, #5
	adds r0, r4, #0
	lsls r1, r1, #0xc
	lsls r2, r2, #0xe
	movs r3, #0x1e
	bl ov71_02248FC8
	ldr r0, _02248F88 @ =ov71_02249184
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	nop
_02248F84: .4byte 0xFFFF8000
_02248F88: .4byte ov71_02249184
	thumb_func_end ov71_02248EB4

	thumb_func_start ov71_02248F8C
ov71_02248F8C: @ 0x02248F8C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	beq _02248FBA
	movs r0, #0x56
	ldrsh r0, [r5, r0]
	adds r1, r6, #0
	subs r0, r4, r0
	blx FUN_020F2998
	adds r1, r5, #0
	adds r1, #0x5a
	strh r0, [r1]
	movs r0, #0x56
	ldrsh r1, [r5, r0]
	movs r0, #0x5a
	ldrsh r0, [r5, r0]
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x56
	strh r1, [r0]
	b _02248FBE
_02248FBA:
	adds r0, #0x56
	strh r4, [r0]
_02248FBE:
	adds r0, r5, #0
	adds r0, #0x58
	strh r4, [r0]
	str r6, [r5, #0x74]
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_02248F8C

	thumb_func_start ov71_02248FC8
ov71_02248FC8: @ 0x02248FC8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	beq _02249000
	ldr r0, [r5, #0x38]
	adds r1, r7, #0
	subs r0, r4, r0
	blx FUN_020F2998
	str r0, [r5, #0x40]
	ldr r0, [r5, #0x3c]
	adds r1, r7, #0
	subs r0, r6, r0
	blx FUN_020F2998
	str r0, [r5, #0x44]
	ldr r1, [r5, #0x38]
	ldr r0, [r5, #0x40]
	adds r0, r1, r0
	str r0, [r5, #0x38]
	ldr r1, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	adds r0, r1, r0
	str r0, [r5, #0x3c]
	str r4, [r5, #0x48]
	str r6, [r5, #0x4c]
_02249000:
	str r7, [r5, #0x50]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov71_02248FC8

	thumb_func_start ov71_02249004
ov71_02249004: @ 0x02249004
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	beq _0224902A
	lsls r0, r4, #3
	str r0, [sp]
	adds r1, r5, r0
	movs r0, #0x5c
	ldrsh r0, [r1, r0]
	adds r1, r7, #0
	subs r0, r6, r0
	blx FUN_020F2998
	ldr r1, [sp]
	adds r1, r5, r1
	adds r1, #0x5e
	strh r0, [r1]
_0224902A:
	lsls r1, r4, #3
	adds r0, r5, r1
	adds r0, #0x60
	strh r6, [r0]
	adds r0, r5, r1
	adds r0, #0x62
	strh r7, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov71_02249004

	thumb_func_start ov71_0224903C
ov71_0224903C: @ 0x0224903C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x74]
	cmp r0, #0
	beq _02249068
	subs r0, r0, #1
	str r0, [r5, #0x74]
	beq _0224905E
	movs r0, #0x56
	ldrsh r1, [r5, r0]
	movs r0, #0x5a
	ldrsh r0, [r5, r0]
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x56
	strh r1, [r0]
	b _02249068
_0224905E:
	movs r0, #0x58
	ldrsh r1, [r5, r0]
	adds r0, r5, #0
	adds r0, #0x56
	strh r1, [r0]
_02249068:
	movs r0, #0x54
	ldrsh r1, [r5, r0]
	movs r0, #0x56
	ldrsh r0, [r5, r0]
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x54
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x54
	ldrh r0, [r0]
	movs r1, #0xb6
	blx FUN_020F2998
	adds r4, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	cmp r4, r0
	blt _02249090
	subs r4, r4, r0
_02249090:
	ldr r0, [r5, #0x50]
	cmp r0, #0
	beq _022490B6
	ldr r1, [r5, #0x38]
	ldr r0, [r5, #0x40]
	adds r0, r1, r0
	str r0, [r5, #0x38]
	ldr r1, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	adds r0, r1, r0
	str r0, [r5, #0x3c]
	ldr r0, [r5, #0x50]
	subs r0, r0, #1
	str r0, [r5, #0x50]
	bne _022490B6
	ldr r0, [r5, #0x48]
	str r0, [r5, #0x38]
	ldr r0, [r5, #0x4c]
	str r0, [r5, #0x3c]
_022490B6:
	lsls r0, r4, #0x10
	ldr r6, [r5, #0x38]
	lsrs r0, r0, #0x10
	bl FUN_0201FC30
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r3, #2
	movs r6, #0
	lsls r3, r3, #0xa
	adds r3, r0, r3
	adcs r1, r6
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	ldr r2, [r5, #8]
	orrs r1, r0
	adds r0, r2, r1
	str r0, [r5, #0x14]
	lsls r0, r4, #0x10
	ldr r6, [r5, #0x3c]
	lsrs r0, r0, #0x10
	bl FUN_0201FBB8
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r4, #2
	movs r3, #0
	lsls r4, r4, #0xa
	adds r4, r0, r4
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r4, #0xc
	ldr r2, [r5, #0x10]
	orrs r1, r0
	adds r0, r2, r1
	str r0, [r5, #0x1c]
	movs r0, #0x22
	ldrsh r1, [r5, r0]
	movs r0, #0x56
	ldrsh r0, [r5, r0]
	movs r2, #0x5e
	movs r6, #0x60
	adds r0, r1, r0
	strh r0, [r5, #0x22]
	adds r0, r5, #0
	movs r1, #0x5c
_0224911E:
	adds r4, r0, #0
	adds r4, #0x62
	ldrh r4, [r4]
	cmp r4, #0
	beq _02249156
	adds r4, r0, #0
	adds r4, #0x62
	ldrh r4, [r4]
	subs r7, r4, #1
	adds r4, r0, #0
	adds r4, #0x62
	strh r7, [r4]
	adds r4, r0, #0
	adds r4, #0x62
	ldrh r4, [r4]
	cmp r4, #0
	bne _0224914A
	ldrsh r7, [r0, r6]
	adds r4, r0, #0
	adds r4, #0x5c
	strh r7, [r4]
	b _02249156
_0224914A:
	ldrsh r7, [r0, r1]
	ldrsh r4, [r0, r2]
	adds r7, r7, r4
	adds r4, r0, #0
	adds r4, #0x5c
	strh r7, [r4]
_02249156:
	adds r3, r3, #1
	adds r0, #8
	cmp r3, #3
	blt _0224911E
	movs r0, #0x20
	ldrsh r1, [r5, r0]
	movs r0, #0x5c
	ldrsh r0, [r5, r0]
	adds r0, r1, r0
	strh r0, [r5, #0x20]
	movs r0, #0x22
	ldrsh r1, [r5, r0]
	movs r0, #0x64
	ldrsh r0, [r5, r0]
	adds r0, r1, r0
	strh r0, [r5, #0x22]
	movs r0, #0x24
	ldrsh r1, [r5, r0]
	movs r0, #0x6c
	ldrsh r0, [r5, r0]
	adds r0, r1, r0
	strh r0, [r5, #0x24]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov71_0224903C

	thumb_func_start ov71_02249184
ov71_02249184: @ 0x02249184
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _022491E4
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x2c]
	adds r0, r1, r0
	str r0, [r4, #0x28]
	str r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x80
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	bgt _022491E4
	movs r1, #2
	lsls r1, r1, #8
	str r1, [r4, #0x30]
	movs r0, #0
	lsls r1, r1, #5
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x3c
	bl ov71_02248FC8
	ldr r2, _02249200 @ =0xFFFFF800
	adds r0, r4, #0
	movs r1, #0
	movs r3, #0x1e
	bl ov71_02249004
	movs r0, #1
	str r0, [r4, #0x7c]
	ldr r1, _02249204 @ =ov71_02249208
	adds r0, r5, #0
	bl FUN_0201F984
_022491E4:
	adds r0, r4, #0
	bl ov71_0224903C
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x14
	bl ov71_022476C4
	ldr r0, [r4]
	adds r4, #0x20
	adds r1, r4, #0
	bl ov71_022476EC
	pop {r3, r4, r5, pc}
	.align 2, 0
_02249200: .4byte 0xFFFFF800
_02249204: .4byte ov71_02249208
	thumb_func_end ov71_02249184

	thumb_func_start ov71_02249208
ov71_02249208: @ 0x02249208
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x78]
	cmp r0, #0
	bne _02249252
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	adds r1, r1, r0
	str r1, [r4, #0x2c]
	ldr r0, [r4, #0x28]
	adds r0, r0, r1
	str r0, [r4, #0x28]
	str r0, [r4, #0x18]
	adds r0, r4, #0
	bl ov71_0224903C
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x14
	bl ov71_022476C4
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x20
	bl ov71_022476EC
	ldr r0, [r4]
	bl ov71_02247738
	cmp r0, #0
	bne _02249252
	ldr r0, [r4]
	movs r1, #0
	bl ov71_02247704
	movs r0, #1
	str r0, [r4, #0x78]
_02249252:
	pop {r4, pc}
	thumb_func_end ov71_02249208

	thumb_func_start ov71_02249254
ov71_02249254: @ 0x02249254
	push {r3, lr}
	bl FUN_0201F988
	ldr r0, [r0, #0x78]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov71_02249254

	thumb_func_start ov71_02249260
ov71_02249260: @ 0x02249260
	push {r3, lr}
	bl FUN_0201F988
	ldr r0, [r0, #0x7c]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov71_02249260

	thumb_func_start ov71_0224926C
ov71_0224926C: @ 0x0224926C
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl FUN_0201F988
	adds r4, r0, #0
	movs r1, #0
	str r1, [r4, #0x78]
	add r0, sp, #0
	strh r1, [r0, #4]
	ldrh r1, [r0, #4]
	strh r1, [r0, #2]
	strh r1, [r0]
	ldr r0, [r4, #4]
	movs r1, #1
	bl ov71_0224782C
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl ov71_0224780C
	ldr r1, _022492F4 @ =0x000058CC
	movs r0, #2
	lsls r0, r0, #0x12
	str r1, [r4, #0x2c]
	subs r0, r1, r0
	str r0, [r4, #0x28]
	adds r0, r4, #0
	movs r1, #0
	movs r3, #0x14
	adds r0, #0x80
	str r3, [r0]
	ldr r0, [r4, #0x28]
	adds r2, r1, #0
	str r0, [r4, #0x18]
	adds r0, r4, #0
	bl ov71_02248FC8
	movs r2, #0x56
	ldrsh r2, [r4, r2]
	adds r0, r4, #0
	movs r1, #1
	rsbs r2, r2, #0
	movs r3, #0x1e
	bl ov71_02249004
	movs r1, #2
	adds r2, r1, #0
	adds r0, r4, #0
	adds r2, #0xfe
	movs r3, #0x32
	bl ov71_02249004
	movs r1, #2
	ldr r0, [r4]
	lsls r1, r1, #0xc
	bl ov71_02247730
	ldr r0, [r4]
	movs r1, #1
	bl ov71_02247704
	ldr r1, _022492F8 @ =ov71_022492FC
	adds r0, r5, #0
	bl FUN_0201F984
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_022492F4: .4byte 0x000058CC
_022492F8: .4byte ov71_022492FC
	thumb_func_end ov71_0224926C

	thumb_func_start ov71_022492FC
ov71_022492FC: @ 0x022492FC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov71_0224903C
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _0224933C
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x2c]
	adds r0, r1, r0
	str r0, [r4, #0x28]
	str r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x80
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	bne _0224933C
	ldr r1, _02249354 @ =ov71_02249358
	adds r0, r5, #0
	bl FUN_0201F984
_0224933C:
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x14
	bl ov71_022476C4
	ldr r0, [r4]
	adds r4, #0x20
	adds r1, r4, #0
	bl ov71_022476EC
	pop {r3, r4, r5, pc}
	nop
_02249354: .4byte ov71_02249358
	thumb_func_end ov71_022492FC

	thumb_func_start ov71_02249358
ov71_02249358: @ 0x02249358
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov71_0224903C
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x80
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #0x6e
	ble _0224939A
	ldr r1, [r4, #0x28]
	ldr r0, _022493B0 @ =0xFFFC5800
	subs r0, r0, r1
	movs r1, #0x35
	blx FUN_020F2998
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r1, #0x35
	adds r0, #0x80
	str r1, [r0]
	ldr r1, _022493B4 @ =ov71_022493B8
	adds r0, r5, #0
	bl FUN_0201F984
_0224939A:
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x14
	bl ov71_022476C4
	ldr r0, [r4]
	adds r4, #0x20
	adds r1, r4, #0
	bl ov71_022476EC
	pop {r3, r4, r5, pc}
	.align 2, 0
_022493B0: .4byte 0xFFFC5800
_022493B4: .4byte ov71_022493B8
	thumb_func_end ov71_02249358

	thumb_func_start ov71_022493B8
ov71_022493B8: @ 0x022493B8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov71_0224903C
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _022493F8
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x2c]
	adds r0, r1, r0
	str r0, [r4, #0x28]
	str r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x80
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	bne _022493F8
	ldr r1, _02249410 @ =ov71_02249414
	adds r0, r5, #0
	bl FUN_0201F984
_022493F8:
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x14
	bl ov71_022476C4
	ldr r0, [r4]
	adds r4, #0x20
	adds r1, r4, #0
	bl ov71_022476EC
	pop {r3, r4, r5, pc}
	nop
_02249410: .4byte ov71_02249414
	thumb_func_end ov71_022493B8

	thumb_func_start ov71_02249414
ov71_02249414: @ 0x02249414
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov71_0224903C
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x80
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #1
	ble _02249446
	movs r0, #2
	lsls r0, r0, #0x10
	str r0, [r4, #0x2c]
	ldr r1, _0224945C @ =ov71_02249460
	adds r0, r5, #0
	bl FUN_0201F984
_02249446:
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x14
	bl ov71_022476C4
	ldr r0, [r4]
	adds r4, #0x20
	adds r1, r4, #0
	bl ov71_022476EC
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224945C: .4byte ov71_02249460
	thumb_func_end ov71_02249414

	thumb_func_start ov71_02249460
ov71_02249460: @ 0x02249460
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x78]
	cmp r0, #0
	bne _0224949C
	adds r0, r4, #0
	bl ov71_0224903C
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x2c]
	adds r0, r1, r0
	str r0, [r4, #0x28]
	str r0, [r4, #0x18]
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x14
	bl ov71_022476C4
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x20
	bl ov71_022476EC
	ldr r0, [r4]
	bl ov71_02247738
	cmp r0, #0
	bne _0224949C
	movs r0, #1
	str r0, [r4, #0x78]
_0224949C:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_02249460

	thumb_func_start ov71_022494A0
ov71_022494A0: @ 0x022494A0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x39
	movs r1, #0xa4
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _022494CA
	str r5, [r4]
	movs r0, #0
	str r0, [r4, #4]
	adds r0, r5, #0
	bl ov71_02247384
	str r0, [r4, #0x24]
	movs r0, #0
	str r0, [r4, #0x28]
	adds r0, r4, #0
	adds r0, #0x34
	bl ov71_02249988
_022494CA:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov71_022494A0

	thumb_func_start ov71_022494D0
ov71_022494D0: @ 0x022494D0
	push {r4, lr}
	adds r4, r0, #0
	beq _022494FE
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	adds r0, r4, #0
	bl ov71_022497C8
	adds r0, r4, #0
	bl ov71_022498E0
	adds r0, r4, #0
	bl ov71_02249970
	adds r0, r4, #0
	adds r0, #0x34
	bl ov71_02249990
	adds r0, r4, #0
	bl FUN_0201AB0C
_022494FE:
	pop {r4, pc}
	thumb_func_end ov71_022494D0

	thumb_func_start ov71_02249500
ov71_02249500: @ 0x02249500
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r2, [r4]
	adds r5, r0, #0
	cmp r2, #2
	bhs _0224952E
	lsls r3, r2, #2
	ldr r2, _02249534 @ =0x0224BD7C
	adds r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _02249524
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	str r0, [r5, #4]
_02249524:
	adds r0, r5, #0
	bl ov71_02249538
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224952E:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_02249534: .4byte 0x0224BD7C
	thumb_func_end ov71_02249500

	thumb_func_start ov71_02249538
ov71_02249538: @ 0x02249538
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _02249554
	blx FUN_020CF670
	ldr r0, [r4, #0x28]
	bl ov71_022474CC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
_02249554:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_02249538

	thumb_func_start ov71_02249558
ov71_02249558: @ 0x02249558
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov71_02249670
	adds r0, r4, #0
	bl ov71_022497E0
	adds r0, r4, #0
	bl ov71_022498F0
	movs r2, #0
	ldr r0, _02249598 @ =ov71_02249C98
	adds r1, r4, #0
	str r2, [r4, #0xc]
	bl FUN_0200E374
	movs r0, #3
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	ldr r3, _0224959C @ =0x00007FFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02249598: .4byte ov71_02249C98
_0224959C: .4byte 0x00007FFF
	thumb_func_end ov71_02249558

	thumb_func_start ov71_022495A0
ov71_022495A0: @ 0x022495A0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #4
	bhi _0224965C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022495BA: @ jump table
	.2byte _022495C4 - _022495BA - 2 @ case 0
	.2byte _022495D0 - _022495BA - 2 @ case 1
	.2byte _022495FA - _022495BA - 2 @ case 2
	.2byte _02249624 - _022495BA - 2 @ case 3
	.2byte _0224964E - _022495BA - 2 @ case 4
_022495C4:
	movs r0, #0
	str r0, [r5, #8]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224965C
_022495D0:
	ldr r0, [r5, #8]
	adds r0, r0, #1
	str r0, [r5, #8]
	cmp r0, #0xa
	ble _0224965C
	ldr r0, _02249664 @ =0x000006AB
	bl FUN_0200604C
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x34
	bl ov71_022499A4
	ldr r0, [r5, #0x2c]
	movs r1, #1
	bl ov71_02247704
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224965C
_022495FA:
	adds r0, r5, #0
	adds r0, #0x34
	bl ov71_02249A50
	cmp r0, #0
	beq _0224965C
	ldr r0, _02249668 @ =0x000006AC
	bl FUN_0200604C
	ldr r0, [r5, #0x20]
	movs r1, #3
	bl FUN_020248F0
	ldr r0, [r5, #0x20]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224965C
_02249624:
	ldr r0, [r5, #0x20]
	bl FUN_02024B68
	cmp r0, #0
	bne _0224965C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0
	ldr r3, _0224966C @ =0x00007FFF
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224965C
_0224964E:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0224965C
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0224965C:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02249664: .4byte 0x000006AB
_02249668: .4byte 0x000006AC
_0224966C: .4byte 0x00007FFF
	thumb_func_end ov71_022495A0

	thumb_func_start ov71_02249670
ov71_02249670: @ 0x02249670
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, _022497B4 @ =0x0224BDC0
	bl FUN_02022BE8
	ldr r2, _022497B8 @ =0x04000304
	ldr r0, _022497BC @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldr r0, _022497C0 @ =0x0224BD84
	bl FUN_0201ACB0
	ldr r0, [r4, #0x24]
	ldr r2, _022497C4 @ =0x0224BDA4
	movs r1, #3
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x24]
	ldr r2, _022497C4 @ =0x0224BDA4
	movs r1, #7
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4]
	bl ov71_022473A0
	cmp r0, #3
	bhi _022496C2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022496BA: @ jump table
	.2byte _022496C2 - _022496BA - 2 @ case 0
	.2byte _022496CE - _022496BA - 2 @ case 1
	.2byte _022496DA - _022496BA - 2 @ case 2
	.2byte _022496E6 - _022496BA - 2 @ case 3
_022496C2:
	movs r0, #0xf
	str r0, [sp, #0x10]
	movs r7, #0x10
	movs r6, #0x11
	movs r5, #0
	b _022496F0
_022496CE:
	movs r0, #0xf
	str r0, [sp, #0x10]
	movs r7, #0x10
	movs r6, #0x11
	movs r5, #0x20
	b _022496F0
_022496DA:
	movs r0, #0xf
	str r0, [sp, #0x10]
	movs r7, #0x10
	movs r6, #0x11
	movs r5, #0x40
	b _022496F0
_022496E6:
	movs r0, #0x18
	str r0, [sp, #0x10]
	movs r7, #0x19
	movs r6, #0x1a
	movs r5, #0
_022496F0:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x24]
	movs r0, #0x59
	adds r1, r7, #0
	movs r3, #3
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x24]
	movs r0, #0x59
	adds r1, r7, #0
	movs r3, #7
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, [r4, #0x24]
	movs r0, #0x59
	movs r3, #3
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, [r4, #0x24]
	movs r0, #0x59
	movs r3, #7
	bl FUN_02007914
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0x59
	adds r1, r6, #0
	adds r3, r5, #0
	bl FUN_02007950
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0x59
	adds r1, r6, #0
	movs r2, #4
	adds r3, r5, #0
	bl FUN_02007950
	movs r1, #3
	adds r3, r1, #0
	ldr r0, [r4, #0x24]
	adds r2, r1, #0
	adds r3, #0xfd
	bl FUN_0201BC8C
	ldr r0, [r4, #0x24]
	movs r1, #7
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022497B4: .4byte 0x0224BDC0
_022497B8: .4byte 0x04000304
_022497BC: .4byte 0xFFFF7FFF
_022497C0: .4byte 0x0224BD84
_022497C4: .4byte 0x0224BDA4
	thumb_func_end ov71_02249670

	thumb_func_start ov71_022497C8
ov71_022497C8: @ 0x022497C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x24]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x24]
	movs r1, #7
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_022497C8

	thumb_func_start ov71_022497E0
ov71_022497E0: @ 0x022497E0
	push {r3, r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	blx FUN_020C2698
	blx FUN_020CF704
	ldr r0, _022498B4 @ =0x04000060
	ldr r1, _022498B8 @ =0xFFFFCFFD
	ldrh r2, [r0]
	ands r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	adds r2, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _022498BC @ =0x0000CFFB
	ands r2, r3
	strh r2, [r0]
	adds r2, r1, #2
	ldrh r3, [r0]
	adds r1, r1, #2
	ands r3, r2
	movs r2, #8
	orrs r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	ands r2, r1
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r0]
	ldr r0, _022498C0 @ =0x0224BD94
	blx FUN_020CF8E4
	movs r1, #0
	ldr r0, _022498C4 @ =0x000043FF
	ldr r2, _022498C8 @ =0x00007FFF
	movs r3, #0x3f
	str r1, [sp]
	blx FUN_020CF910
	ldr r1, _022498CC @ =0x04000540
	movs r0, #2
	str r0, [r1]
	ldr r0, _022498D0 @ =0xBFFF0000
	str r0, [r1, #0x40]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02027000
	movs r0, #1
	lsls r0, r0, #0xe
	movs r1, #1
	bl FUN_02027008
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r1, _022498D4 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	strh r2, [r1]
	movs r1, #0
	movs r0, #1
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov71_0224744C
	str r0, [r4, #0x28]
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x28]
	movs r2, #0x59
	movs r3, #0x1b
	bl ov71_02247610
	ldr r1, _022498D8 @ =0x000018E3
	str r0, [r4, #0x2c]
	add r0, sp, #0x10
	strh r1, [r0]
	movs r1, #0
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r0, [r4, #0x28]
	add r1, sp, #0x10
	bl ov71_0224780C
	ldr r0, [r4, #0x28]
	ldr r1, _022498DC @ =0x000007D2
	bl ov71_0224783C
	ldr r0, [r4, #0x28]
	add r1, sp, #0x18
	bl ov71_022477EC
	add sp, #0x24
	pop {r3, r4, pc}
	nop
_022498B4: .4byte 0x04000060
_022498B8: .4byte 0xFFFFCFFD
_022498BC: .4byte 0x0000CFFB
_022498C0: .4byte 0x0224BD94
_022498C4: .4byte 0x000043FF
_022498C8: .4byte 0x00007FFF
_022498CC: .4byte 0x04000540
_022498D0: .4byte 0xBFFF0000
_022498D4: .4byte 0x04000008
_022498D8: .4byte 0x000018E3
_022498DC: .4byte 0x000007D2
	thumb_func_end ov71_022497E0

	thumb_func_start ov71_022498E0
ov71_022498E0: @ 0x022498E0
	push {r3, lr}
	ldr r0, [r0, #0x28]
	cmp r0, #0
	beq _022498EC
	bl ov71_02247498
_022498EC:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov71_022498E0

	thumb_func_start ov71_022498F0
ov71_022498F0: @ 0x022498F0
	push {r4, lr}
	sub sp, #0x70
	adds r4, r0, #0
	adds r0, #0x10
	movs r1, #0x59
	movs r2, #7
	movs r3, #8
	bl ov71_022472C4
	add r0, sp, #0x5c
	blx FUN_020B804C
	add r0, sp, #0x38
	blx FUN_020B8008
	movs r3, #0
	str r3, [sp]
	movs r2, #1
	str r2, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	add r0, sp, #0x38
	str r0, [sp, #0x10]
	movs r0, #0x59
	movs r1, #9
	bl FUN_02007994
	movs r0, #0x39
	str r0, [sp]
	add r0, sp, #0x5c
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl FUN_02007974
	movs r0, #0
	adds r1, r4, #0
	str r0, [sp]
	add r0, sp, #0x14
	adds r1, #0x10
	add r2, sp, #0x38
	add r3, sp, #0x5c
	bl ov71_02247320
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x14
	movs r2, #0x80
	movs r3, #0x60
	bl ov71_02247340
	movs r1, #0
	str r0, [r4, #0x20]
	bl FUN_02024830
	add sp, #0x70
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_022498F0

	thumb_func_start ov71_02249970
ov71_02249970: @ 0x02249970
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0224997E
	bl FUN_02024758
_0224997E:
	adds r4, #0x10
	adds r0, r4, #0
	bl ov71_022472FC
	pop {r4, pc}
	thumb_func_end ov71_02249970

	thumb_func_start ov71_02249988
ov71_02249988: @ 0x02249988
	movs r1, #0
	str r1, [r0, #4]
	bx lr
	.align 2, 0
	thumb_func_end ov71_02249988

	thumb_func_start ov71_02249990
ov71_02249990: @ 0x02249990
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022499A2
	bl FUN_0200E390
	movs r0, #0
	str r0, [r4, #4]
_022499A2:
	pop {r4, pc}
	thumb_func_end ov71_02249990

	thumb_func_start ov71_022499A4
ov71_022499A4: @ 0x022499A4
	push {r4, lr}
	adds r4, r1, #0
	str r0, [r4]
	ldr r1, [r0, #0x2c]
	ldr r2, _02249A34 @ =0xFFFFD870
	str r1, [r4, #0xc]
	ldr r0, [r0, #0x28]
	ldr r1, _02249A38 @ =0xFFF50E00
	str r0, [r4, #8]
	movs r0, #0
	str r0, [r4, #0x10]
	str r1, [r4, #0x14]
	movs r1, #0xe2
	lsls r1, r1, #0xc
	str r1, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x6c
	strh r2, [r1]
	adds r1, r4, #0
	ldr r2, _02249A3C @ =0xFFFFF550
	adds r1, #0x6e
	strh r2, [r1]
	ldr r1, _02249A40 @ =0x000134C4
	str r1, [r4, #0x3c]
	ldr r1, _02249A44 @ =0xFFFF4D56
	str r1, [r4, #0x40]
	str r0, [r4, #0x60]
	str r0, [r4, #0x64]
	movs r1, #2
	str r0, [r4, #0x68]
	lsls r1, r1, #0xc
	strh r1, [r4, #0x34]
	ldr r1, _02249A48 @ =0xFFFFE000
	strh r1, [r4, #0x36]
	strh r0, [r4, #0x38]
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x34
	bl ov71_022476EC
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [r4, #0x54]
	movs r0, #0x4a
	lsls r0, r0, #0xa
	str r0, [r4, #0x44]
	movs r0, #0x63
	lsls r0, r0, #0xa
	str r0, [r4, #0x48]
	movs r0, #0
	str r0, [r4, #0x5c]
	adds r0, r4, #0
	bl ov71_02249A98
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x28
	bl ov71_022476C4
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x34
	bl ov71_022476D4
	ldr r0, _02249A4C @ =ov71_02249B64
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	str r0, [r4, #4]
	pop {r4, pc}
	nop
_02249A34: .4byte 0xFFFFD870
_02249A38: .4byte 0xFFF50E00
_02249A3C: .4byte 0xFFFFF550
_02249A40: .4byte 0x000134C4
_02249A44: .4byte 0xFFFF4D56
_02249A48: .4byte 0xFFFFE000
_02249A4C: .4byte ov71_02249B64
	thumb_func_end ov71_022499A4

	thumb_func_start ov71_02249A50
ov71_02249A50: @ 0x02249A50
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _02249A5A
	movs r0, #1
	bx lr
_02249A5A:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov71_02249A50

	thumb_func_start ov71_02249A60
ov71_02249A60: @ 0x02249A60
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x18]
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r4, #0
	beq _02249A96
	ldr r0, [r5, #0x44]
	subs r0, r1, r0
	adds r1, r4, #0
	blx FUN_020F2998
	str r0, [r5, #0x4c]
	ldr r0, [r5, #0x48]
	adds r1, r4, #0
	subs r0, r6, r0
	blx FUN_020F2998
	str r0, [r5, #0x50]
	ldr r0, [r5, #0x54]
	adds r1, r4, #0
	subs r0, r7, r0
	blx FUN_020F2998
	str r0, [r5, #0x58]
	ldr r0, [sp, #0x18]
	str r0, [r5, #0x5c]
_02249A96:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov71_02249A60

	thumb_func_start ov71_02249A98
ov71_02249A98: @ 0x02249A98
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x6c
	ldrh r0, [r0]
	movs r1, #0xb6
	blx FUN_020F2998
	adds r4, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	cmp r4, r0
	blt _02249AB2
	subs r4, r4, r0
_02249AB2:
	movs r0, #0x6c
	ldrsh r1, [r5, r0]
	movs r0, #0x6e
	ldrsh r0, [r5, r0]
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x6c
	strh r1, [r0]
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	beq _02249AEC
	ldr r1, [r5, #0x44]
	ldr r0, [r5, #0x4c]
	adds r0, r1, r0
	str r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x50]
	adds r0, r1, r0
	str r0, [r5, #0x48]
	ldr r1, [r5, #0x54]
	ldr r0, [r5, #0x58]
	adds r1, r1, r0
	str r1, [r5, #0x54]
	ldr r0, [r5, #0xc]
	bl ov71_02247730
	ldr r0, [r5, #0x5c]
	subs r0, r0, #1
	str r0, [r5, #0x5c]
_02249AEC:
	lsls r0, r4, #0x10
	ldr r6, [r5, #0x44]
	lsrs r0, r0, #0x10
	bl FUN_0201FC30
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r5, #0x1c]
	lsls r0, r4, #0x10
	ldr r6, [r5, #0x48]
	lsrs r0, r0, #0x10
	bl FUN_0201FBB8
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r5, #0x20]
	adds r1, r5, #0
	str r3, [r5, #0x24]
	movs r0, #0x34
	ldrsh r2, [r5, r0]
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r2, r0
	strh r0, [r5, #0x34]
	ldr r0, [r5, #0xc]
	adds r1, #0x34
	bl ov71_022476EC
	adds r0, r5, #0
	adds r1, r5, #0
	adds r5, #0x28
	adds r0, #0x1c
	adds r1, #0x10
	adds r2, r5, #0
	blx FUN_020CCD78
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov71_02249A98

	thumb_func_start ov71_02249B64
ov71_02249B64: @ 0x02249B64
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r1, #0
	ldr r1, [r4, #0x68]
	cmp r1, #0x3c
	bge _02249B74
	adds r1, r1, #1
	str r1, [r4, #0x68]
_02249B74:
	ldr r1, [r4, #0x60]
	cmp r1, #4
	bls _02249B7C
	b _02249C8C
_02249B7C:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02249B88: @ jump table
	.2byte _02249B92 - _02249B88 - 2 @ case 0
	.2byte _02249BC6 - _02249B88 - 2 @ case 1
	.2byte _02249C04 - _02249B88 - 2 @ case 2
	.2byte _02249C4A - _02249B88 - 2 @ case 3
	.2byte _02249C7A - _02249B88 - 2 @ case 4
_02249B92:
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x3c]
	adds r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x40]
	adds r0, r1, r0
	str r0, [r4, #0x18]
	adds r0, r4, #0
	bl ov71_02249A98
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x28
	bl ov71_022476C4
	ldr r0, [r4, #0xc]
	bl ov71_02247738
	cmp r0, #0
	beq _02249C8C
	ldr r0, [r4, #0x60]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0x60]
	pop {r3, r4, pc}
_02249BC6:
	ldr r0, [r4, #0xc]
	bl ov71_02247738
	cmp r0, #0
	bne _02249BE0
	ldr r0, [r4]
	bl ov71_02249C90
	ldr r0, [r4, #0x60]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0x60]
	pop {r3, r4, pc}
_02249BE0:
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x3c]
	adds r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x40]
	adds r0, r1, r0
	str r0, [r4, #0x18]
	adds r0, r4, #0
	bl ov71_02249A98
	ldr r0, [r4, #0xc]
	adds r4, #0x28
	adds r1, r4, #0
	bl ov71_022476C4
	add sp, #4
	pop {r3, r4, pc}
_02249C04:
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x3c]
	adds r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x40]
	adds r0, r1, r0
	str r0, [r4, #0x18]
	adds r0, r4, #0
	bl ov71_02249A98
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x28
	bl ov71_022476C4
	ldr r0, [r4, #0x68]
	cmp r0, #0x3c
	blt _02249C8C
	movs r1, #2
	lsls r1, r1, #0xa
	movs r0, #0xc
	str r0, [sp]
	adds r0, r4, #0
	adds r2, r1, #0
	lsrs r3, r1, #2
	bl ov71_02249A60
	movs r0, #0
	str r0, [r4, #0x64]
	ldr r0, [r4, #0x60]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0x60]
	pop {r3, r4, pc}
_02249C4A:
	adds r0, r4, #0
	bl ov71_02249A98
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x28
	bl ov71_022476C4
	ldr r0, [r4, #0x64]
	adds r0, r0, #1
	str r0, [r4, #0x64]
	cmp r0, #0xc
	blt _02249C8C
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl ov71_02247704
	movs r0, #0
	str r0, [r4, #0x64]
	ldr r0, [r4, #0x60]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0x60]
	pop {r3, r4, pc}
_02249C7A:
	ldr r1, [r4, #0x64]
	adds r1, r1, #1
	str r1, [r4, #0x64]
	cmp r1, #8
	ble _02249C8C
	movs r1, #0
	str r1, [r4, #4]
	bl FUN_0200E390
_02249C8C:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov71_02249B64

	thumb_func_start ov71_02249C90
ov71_02249C90: @ 0x02249C90
	movs r1, #1
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
	thumb_func_end ov71_02249C90

	thumb_func_start ov71_02249C98
ov71_02249C98: @ 0x02249C98
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02249CE4
	movs r3, #0
	ldr r1, _02249CE8 @ =0x00001150
	str r3, [r4, #0xc]
	add r0, sp, #0
	strh r1, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	movs r1, #3
	ldr r0, [r4, #0x24]
	adds r2, r1, #0
	bl FUN_0201BC8C
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r4, #0x24]
	movs r1, #7
	adds r3, #0xfd
	bl FUN_0201BC8C
	ldr r0, [r4, #0x28]
	add r1, sp, #0
	bl ov71_0224781C
	ldr r2, _02249CEC @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	adds r0, r5, #0
	bl FUN_0200E390
_02249CE4:
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02249CE8: .4byte 0x00001150
_02249CEC: .4byte 0x04000304
	thumb_func_end ov71_02249C98

	thumb_func_start ov71_02249CF0
ov71_02249CF0: @ 0x02249CF0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x39
	movs r1, #0x24
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _02249D0E
	str r5, [r4]
	movs r0, #0
	str r0, [r4, #4]
	adds r0, r5, #0
	bl ov71_02247384
	str r0, [r4, #0xc]
_02249D0E:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov71_02249CF0

	thumb_func_start ov71_02249D14
ov71_02249D14: @ 0x02249D14
	push {r4, lr}
	adds r4, r0, #0
	beq _02249D24
	bl ov71_0224A080
	adds r0, r4, #0
	bl FUN_0201AB0C
_02249D24:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_02249D14

	thumb_func_start ov71_02249D28
ov71_02249D28: @ 0x02249D28
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r2, [r4]
	adds r5, r0, #0
	cmp r2, #2
	bhs _02249D50
	lsls r3, r2, #2
	ldr r2, _02249D54 @ =0x0224BDE8
	adds r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _02249D4C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	str r0, [r5, #4]
_02249D4C:
	movs r0, #0
	pop {r3, r4, r5, pc}
_02249D50:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_02249D54: .4byte 0x0224BDE8
	thumb_func_end ov71_02249D28

	thumb_func_start ov71_02249D58
ov71_02249D58: @ 0x02249D58
	push {lr}
	sub sp, #0xc
	bl ov71_02249E6C
	movs r0, #8
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	ldr r3, _02249D7C @ =0x00007FFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	movs r0, #1
	add sp, #0xc
	pop {pc}
	.align 2, 0
_02249D7C: .4byte 0x00007FFF
	thumb_func_end ov71_02249D58

	thumb_func_start ov71_02249D80
ov71_02249D80: @ 0x02249D80
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02249D98
	cmp r0, #1
	beq _02249DCA
	cmp r0, #2
	beq _02249DF6
	b _02249E04
_02249D98:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02249E04
	ldr r0, _02249E0C @ =0xFFE80000
	movs r2, #0
	str r0, [r5, #0x10]
	movs r0, #5
	lsls r0, r0, #0x10
	str r0, [r5, #0x14]
	ldr r0, _02249E10 @ =0x00005999
	adds r1, r5, #0
	str r0, [r5, #0x18]
	ldr r0, _02249E14 @ =0xFFFFDDDE
	str r0, [r5, #0x1c]
	movs r0, #0x3c
	str r0, [r5, #8]
	ldr r0, _02249E18 @ =ov71_02249E24
	str r2, [r5, #0x20]
	bl FUN_0200E33C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02249E04
_02249DCA:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _02249E04
	ldr r0, _02249E1C @ =0x000006A8
	bl FUN_0200604C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0
	ldr r3, _02249E20 @ =0x00007FFF
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02249E04
_02249DF6:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02249E04
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_02249E04:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02249E0C: .4byte 0xFFE80000
_02249E10: .4byte 0x00005999
_02249E14: .4byte 0xFFFFDDDE
_02249E18: .4byte ov71_02249E24
_02249E1C: .4byte 0x000006A8
_02249E20: .4byte 0x00007FFF
	thumb_func_end ov71_02249D80

	thumb_func_start ov71_02249E24
ov71_02249E24: @ 0x02249E24
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02249E52
	subs r0, r0, #1
	str r0, [r4, #8]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x18]
	adds r0, r1, r0
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x1c]
	adds r2, r1, r0
	str r2, [r4, #0x14]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0xc]
	asrs r1, r1, #0xc
	asrs r2, r2, #0xc
	bl ov71_0224A0B8
	pop {r3, r4, r5, pc}
_02249E52:
	movs r1, #0x2f
	mvns r1, r1
	ldr r0, [r4, #0xc]
	adds r2, r1, #0
	bl ov71_0224A0B8
	movs r0, #1
	str r0, [r4, #0x20]
	adds r0, r5, #0
	bl FUN_0200E390
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov71_02249E24

	thumb_func_start ov71_02249E6C
ov71_02249E6C: @ 0x02249E6C
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, _0224A064 @ =0x0224BE54
	bl FUN_02022BE8
	ldr r2, _0224A068 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0224A06C @ =0x0224BDF0
	bl FUN_0201ACB0
	ldr r0, [r4, #0xc]
	ldr r2, _0224A070 @ =0x0224BE00
	movs r1, #1
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	ldr r2, _0224A070 @ =0x0224BE00
	movs r1, #5
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	ldr r2, _0224A074 @ =0x0224BE1C
	movs r1, #2
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	ldr r2, _0224A078 @ =0x0224BE38
	movs r1, #3
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	ldr r2, _0224A078 @ =0x0224BE38
	movs r1, #7
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	movs r0, #0x59
	movs r1, #0x13
	movs r3, #3
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	movs r0, #0x59
	movs r1, #0x13
	movs r3, #7
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	movs r0, #0x59
	movs r1, #0x12
	movs r3, #3
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	movs r0, #0x59
	movs r1, #0x12
	movs r3, #7
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x39
	movs r2, #0
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #0x14
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x39
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #0x14
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	movs r0, #0xc8
	str r0, [sp]
	movs r1, #1
	ldr r0, [r4, #0xc]
	movs r2, #0
	adds r3, r1, #0
	bl FUN_0201C1F4
	movs r0, #0xc8
	str r0, [sp]
	ldr r0, [r4, #0xc]
	movs r1, #5
	movs r2, #0
	movs r3, #1
	bl FUN_0201C1F4
	movs r0, #0xc8
	str r0, [sp]
	ldr r0, [r4, #0xc]
	movs r1, #2
	movs r2, #0
	movs r3, #1
	bl FUN_0201C1F4
	movs r1, #0
	str r1, [sp]
	ldr r0, [r4]
	movs r2, #1
	movs r3, #0xe
	bl ov71_02247124
	movs r1, #0
	str r1, [sp]
	ldr r0, [r4]
	movs r2, #5
	movs r3, #0xe
	bl ov71_02247124
	movs r0, #0
	str r0, [sp]
	ldr r0, [r4]
	movs r1, #1
	movs r2, #2
	movs r3, #0xf
	bl ov71_02247124
	movs r3, #0
	str r3, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [r4, #0xc]
	movs r1, #1
	movs r2, #0xc8
	bl FUN_0201C8C4
	movs r3, #0
	str r3, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [r4, #0xc]
	movs r1, #5
	movs r2, #0xc8
	bl FUN_0201C8C4
	movs r3, #0
	str r3, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [r4, #0xc]
	movs r1, #2
	movs r2, #0xc8
	bl FUN_0201C8C4
	movs r0, #0x14
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r0, [r4]
	movs r2, #1
	movs r3, #0xe
	bl ov71_02247230
	movs r0, #0x14
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r0, [r4]
	movs r2, #5
	movs r3, #0xe
	bl ov71_02247230
	movs r2, #2
	str r2, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r1, #1
	movs r3, #0xf
	bl ov71_02247230
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_0201BF7C
	ldr r0, [r4, #0xc]
	movs r1, #5
	bl FUN_0201BF7C
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_0201BF7C
	ldr r0, [r4, #0xc]
	ldr r2, _0224A07C @ =0xFFFFFE80
	movs r1, #0x50
	bl ov71_0224A0B8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0224A064: .4byte 0x0224BE54
_0224A068: .4byte 0x04000304
_0224A06C: .4byte 0x0224BDF0
_0224A070: .4byte 0x0224BE00
_0224A074: .4byte 0x0224BE1C
_0224A078: .4byte 0x0224BE38
_0224A07C: .4byte 0xFFFFFE80
	thumb_func_end ov71_02249E6C

	thumb_func_start ov71_0224A080
ov71_0224A080: @ 0x0224A080
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #7
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #5
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_0224A080

	thumb_func_start ov71_0224A0B8
ov71_0224A0B8: @ 0x0224A0B8
	push {r4, r5, r6, lr}
	ldr r3, _0224A0EC @ =0x000001FF
	adds r4, r1, #0
	adds r6, r2, #0
	ands r4, r3
	adds r5, r0, #0
	movs r1, #2
	movs r2, #3
	ands r3, r6
	bl FUN_0201BC8C
	adds r0, r5, #0
	movs r1, #1
	movs r2, #3
	adds r3, r4, #0
	bl FUN_0201BC8C
	adds r4, #0xc0
	adds r0, r5, #0
	movs r1, #5
	movs r2, #3
	adds r3, r4, #0
	bl FUN_0201BC8C
	pop {r4, r5, r6, pc}
	nop
_0224A0EC: .4byte 0x000001FF
	thumb_func_end ov71_0224A0B8

	thumb_func_start ov71_0224A0F0
ov71_0224A0F0: @ 0x0224A0F0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x39
	movs r1, #0xb0
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _0224A124
	str r5, [r4]
	movs r0, #0
	str r0, [r4, #4]
	adds r0, r5, #0
	bl ov71_02247384
	str r0, [r4, #0x24]
	movs r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x34
	bl ov71_0224A5A8
	ldr r0, _0224A128 @ =ov71_0224A8B0
	adds r1, r4, #0
	bl FUN_0201A0FC
_0224A124:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224A128: .4byte ov71_0224A8B0
	thumb_func_end ov71_0224A0F0

	thumb_func_start ov71_0224A12C
ov71_0224A12C: @ 0x0224A12C
	push {r4, lr}
	adds r4, r0, #0
	beq _0224A15A
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	adds r0, r4, #0
	bl ov71_0224A3D8
	adds r0, r4, #0
	bl ov71_0224A500
	adds r0, r4, #0
	bl ov71_0224A590
	adds r0, r4, #0
	adds r0, #0x34
	bl ov71_0224A5B0
	adds r0, r4, #0
	bl FUN_0201AB0C
_0224A15A:
	pop {r4, pc}
	thumb_func_end ov71_0224A12C

	thumb_func_start ov71_0224A15C
ov71_0224A15C: @ 0x0224A15C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r2, [r4]
	adds r5, r0, #0
	cmp r2, #2
	bhs _0224A184
	lsls r3, r2, #2
	ldr r2, _0224A188 @ =0x0224BE7C
	adds r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _0224A180
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	str r0, [r5, #4]
_0224A180:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224A184:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224A188: .4byte 0x0224BE7C
	thumb_func_end ov71_0224A15C

	thumb_func_start ov71_0224A18C
ov71_0224A18C: @ 0x0224A18C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov71_0224A278
	adds r0, r4, #0
	bl ov71_0224A3F0
	adds r0, r4, #0
	bl ov71_0224A510
	movs r0, #8
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	ldr r3, _0224A1C0 @ =0x00007FFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0224A1C0: .4byte 0x00007FFF
	thumb_func_end ov71_0224A18C

	thumb_func_start ov71_0224A1C4
ov71_0224A1C4: @ 0x0224A1C4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	bhi _0224A26A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224A1DE: @ jump table
	.2byte _0224A1E6 - _0224A1DE - 2 @ case 0
	.2byte _0224A206 - _0224A1DE - 2 @ case 1
	.2byte _0224A230 - _0224A1DE - 2 @ case 2
	.2byte _0224A25C - _0224A1DE - 2 @ case 3
_0224A1E6:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0224A26A
	ldr r0, [r5, #0x20]
	movs r1, #3
	bl FUN_020248F0
	ldr r0, [r5, #0x20]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224A26A
_0224A206:
	ldr r0, [r5, #0x20]
	bl FUN_02024B68
	cmp r0, #0
	bne _0224A26A
	ldr r0, _0224A270 @ =0x000006AA
	bl FUN_0200604C
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x34
	bl ov71_0224A5C4
	ldr r0, [r5, #0x2c]
	movs r1, #1
	bl ov71_02247704
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224A26A
_0224A230:
	adds r5, #0x34
	adds r0, r5, #0
	bl ov71_0224A684
	cmp r0, #0
	beq _0224A26A
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0
	ldr r3, _0224A274 @ =0x00007FFF
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224A26A
_0224A25C:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0224A26A
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0224A26A:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0224A270: .4byte 0x000006AA
_0224A274: .4byte 0x00007FFF
	thumb_func_end ov71_0224A1C4

	thumb_func_start ov71_0224A278
ov71_0224A278: @ 0x0224A278
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, _0224A3C8 @ =0x0224BEC0
	bl FUN_02022BE8
	ldr r2, _0224A3CC @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0224A3D0 @ =0x0224BE84
	bl FUN_0201ACB0
	ldr r0, [r4, #0x24]
	ldr r2, _0224A3D4 @ =0x0224BEA4
	movs r1, #3
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x24]
	ldr r2, _0224A3D4 @ =0x0224BEA4
	movs r1, #7
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4]
	bl ov71_022473A0
	cmp r0, #3
	bhi _0224A2CA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224A2C2: @ jump table
	.2byte _0224A2CA - _0224A2C2 - 2 @ case 0
	.2byte _0224A2D6 - _0224A2C2 - 2 @ case 1
	.2byte _0224A2E2 - _0224A2C2 - 2 @ case 2
	.2byte _0224A2EE - _0224A2C2 - 2 @ case 3
_0224A2CA:
	movs r0, #0xf
	str r0, [sp, #0x10]
	movs r7, #0x10
	movs r6, #0x11
	movs r5, #0
	b _0224A2F8
_0224A2D6:
	movs r0, #0xf
	str r0, [sp, #0x10]
	movs r7, #0x10
	movs r6, #0x11
	movs r5, #0x20
	b _0224A2F8
_0224A2E2:
	movs r0, #0xf
	str r0, [sp, #0x10]
	movs r7, #0x10
	movs r6, #0x11
	movs r5, #0x40
	b _0224A2F8
_0224A2EE:
	movs r0, #0x18
	str r0, [sp, #0x10]
	movs r7, #0x19
	movs r6, #0x1a
	movs r5, #0
_0224A2F8:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x24]
	movs r0, #0x59
	adds r1, r7, #0
	movs r3, #3
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x24]
	movs r0, #0x59
	adds r1, r7, #0
	movs r3, #7
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, [r4, #0x24]
	movs r0, #0x59
	movs r3, #3
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, [r4, #0x24]
	movs r0, #0x59
	movs r3, #7
	bl FUN_02007914
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0x59
	adds r1, r6, #0
	adds r3, r5, #0
	bl FUN_02007950
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0x59
	adds r1, r6, #0
	movs r2, #4
	adds r3, r5, #0
	bl FUN_02007950
	movs r1, #3
	ldr r0, [r4, #0x24]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r4, #0x24]
	movs r1, #7
	adds r3, #0xfd
	bl FUN_0201BC8C
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	bl FUN_0203A880
	movs r0, #1
	movs r1, #0x38
	bl FUN_0203A948
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0224A3C8: .4byte 0x0224BEC0
_0224A3CC: .4byte 0x04000304
_0224A3D0: .4byte 0x0224BE84
_0224A3D4: .4byte 0x0224BEA4
	thumb_func_end ov71_0224A278

	thumb_func_start ov71_0224A3D8
ov71_0224A3D8: @ 0x0224A3D8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x24]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x24]
	movs r1, #7
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_0224A3D8

	thumb_func_start ov71_0224A3F0
ov71_0224A3F0: @ 0x0224A3F0
	push {r3, r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	blx FUN_020C2698
	blx FUN_020CF704
	ldr r0, _0224A4D0 @ =0x04000060
	ldr r1, _0224A4D4 @ =0xFFFFCFFD
	ldrh r2, [r0]
	ands r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	adds r2, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _0224A4D8 @ =0x0000CFFB
	ands r2, r3
	strh r2, [r0]
	adds r2, r1, #2
	ldrh r3, [r0]
	adds r1, r1, #2
	ands r3, r2
	movs r2, #8
	orrs r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	ands r2, r1
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r0]
	ldr r0, _0224A4DC @ =0x0224BE94
	blx FUN_020CF8E4
	movs r1, #0
	ldr r0, _0224A4E0 @ =0x000043FF
	ldr r2, _0224A4E4 @ =0x00007FFF
	movs r3, #0x3f
	str r1, [sp]
	blx FUN_020CF910
	ldr r1, _0224A4E8 @ =0x04000540
	movs r0, #2
	str r0, [r1]
	ldr r0, _0224A4EC @ =0xBFFF0000
	str r0, [r1, #0x40]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02027000
	movs r0, #1
	lsls r0, r0, #0xe
	movs r1, #1
	bl FUN_02027008
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r1, _0224A4F0 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	strh r2, [r1]
	movs r1, #0
	movs r0, #1
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov71_0224744C
	str r0, [r4, #0x28]
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x28]
	movs r2, #0x59
	movs r3, #0x1b
	bl ov71_02247610
	ldr r1, _0224A4F4 @ =0x000018E3
	str r0, [r4, #0x2c]
	add r0, sp, #0x10
	strh r1, [r0]
	movs r1, #0
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r0, [r4, #0x28]
	add r1, sp, #0x10
	bl ov71_0224780C
	ldr r1, _0224A4F8 @ =0x00001150
	add r0, sp, #0x10
	strh r1, [r0]
	ldr r0, [r4, #0x28]
	add r1, sp, #0x10
	bl ov71_0224781C
	ldr r0, [r4, #0x28]
	ldr r1, _0224A4FC @ =0x000007D2
	bl ov71_0224783C
	ldr r0, [r4, #0x28]
	add r1, sp, #0x18
	bl ov71_022477EC
	add sp, #0x24
	pop {r3, r4, pc}
	.align 2, 0
_0224A4D0: .4byte 0x04000060
_0224A4D4: .4byte 0xFFFFCFFD
_0224A4D8: .4byte 0x0000CFFB
_0224A4DC: .4byte 0x0224BE94
_0224A4E0: .4byte 0x000043FF
_0224A4E4: .4byte 0x00007FFF
_0224A4E8: .4byte 0x04000540
_0224A4EC: .4byte 0xBFFF0000
_0224A4F0: .4byte 0x04000008
_0224A4F4: .4byte 0x000018E3
_0224A4F8: .4byte 0x00001150
_0224A4FC: .4byte 0x000007D2
	thumb_func_end ov71_0224A3F0

	thumb_func_start ov71_0224A500
ov71_0224A500: @ 0x0224A500
	push {r3, lr}
	ldr r0, [r0, #0x28]
	cmp r0, #0
	beq _0224A50C
	bl ov71_02247498
_0224A50C:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov71_0224A500

	thumb_func_start ov71_0224A510
ov71_0224A510: @ 0x0224A510
	push {r4, lr}
	sub sp, #0x70
	adds r4, r0, #0
	adds r0, #0x10
	movs r1, #0x59
	movs r2, #7
	movs r3, #8
	bl ov71_022472C4
	add r0, sp, #0x5c
	blx FUN_020B804C
	add r0, sp, #0x38
	blx FUN_020B8008
	movs r3, #0
	str r3, [sp]
	movs r2, #1
	str r2, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	add r0, sp, #0x38
	str r0, [sp, #0x10]
	movs r0, #0x59
	movs r1, #9
	bl FUN_02007994
	movs r0, #0x39
	str r0, [sp]
	add r0, sp, #0x5c
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl FUN_02007974
	movs r0, #1
	adds r1, r4, #0
	str r0, [sp]
	add r0, sp, #0x14
	adds r1, #0x10
	add r2, sp, #0x38
	add r3, sp, #0x5c
	bl ov71_02247320
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x14
	movs r2, #0x80
	movs r3, #0x60
	bl ov71_02247340
	movs r1, #0
	str r0, [r4, #0x20]
	bl FUN_02024830
	add sp, #0x70
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_0224A510

	thumb_func_start ov71_0224A590
ov71_0224A590: @ 0x0224A590
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0224A59E
	bl FUN_02024758
_0224A59E:
	adds r4, #0x10
	adds r0, r4, #0
	bl ov71_022472FC
	pop {r4, pc}
	thumb_func_end ov71_0224A590

	thumb_func_start ov71_0224A5A8
ov71_0224A5A8: @ 0x0224A5A8
	movs r1, #0
	str r1, [r0, #4]
	bx lr
	.align 2, 0
	thumb_func_end ov71_0224A5A8

	thumb_func_start ov71_0224A5B0
ov71_0224A5B0: @ 0x0224A5B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0224A5C2
	bl FUN_0200E390
	movs r0, #0
	str r0, [r4, #4]
_0224A5C2:
	pop {r4, pc}
	thumb_func_end ov71_0224A5B0

	thumb_func_start ov71_0224A5C4
ov71_0224A5C4: @ 0x0224A5C4
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r1, #0
	str r0, [r4]
	ldr r1, [r0, #0x2c]
	ldr r2, _0224A664 @ =0xFFFFD870
	str r1, [r4, #0xc]
	ldr r0, [r0, #0x28]
	ldr r1, _0224A668 @ =0x003D6C00
	str r0, [r4, #8]
	movs r0, #0
	str r0, [r4, #0x10]
	str r1, [r4, #0x14]
	ldr r1, _0224A66C @ =0xFFE44000
	str r1, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x78
	strh r2, [r1]
	adds r1, r4, #0
	ldr r2, _0224A670 @ =0xFFFFF550
	adds r1, #0x7a
	strh r2, [r1]
	ldr r1, _0224A674 @ =0xFFFEF2C6
	str r1, [r4, #0x3c]
	ldr r1, _0224A678 @ =0x0000936D
	str r1, [r4, #0x40]
	str r0, [r4, #0x6c]
	str r0, [r4, #0x70]
	movs r1, #2
	str r0, [r4, #0x74]
	lsls r1, r1, #0xc
	strh r1, [r4, #0x34]
	ldr r1, _0224A67C @ =0xFFFFE000
	strh r1, [r4, #0x36]
	strh r0, [r4, #0x38]
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x34
	bl ov71_022476EC
	movs r3, #2
	lsls r3, r3, #8
	movs r1, #0x4a
	movs r2, #0x63
	str r3, [r4, #0x5c]
	lsls r0, r3, #2
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	movs r0, #0
	str r0, [r4, #0x68]
	movs r0, #0xc
	str r0, [sp]
	adds r0, r4, #0
	lsls r1, r1, #0xa
	lsls r2, r2, #0xa
	lsls r3, r3, #3
	bl ov71_0224A694
	adds r0, r4, #0
	bl ov71_0224A6D8
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x28
	bl ov71_022476C4
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x34
	bl ov71_022476D4
	ldr r0, _0224A680 @ =ov71_0224A7D0
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	str r0, [r4, #4]
	add sp, #4
	pop {r3, r4, pc}
	nop
_0224A664: .4byte 0xFFFFD870
_0224A668: .4byte 0x003D6C00
_0224A66C: .4byte 0xFFE44000
_0224A670: .4byte 0xFFFFF550
_0224A674: .4byte 0xFFFEF2C6
_0224A678: .4byte 0x0000936D
_0224A67C: .4byte 0xFFFFE000
_0224A680: .4byte ov71_0224A7D0
	thumb_func_end ov71_0224A5C4

	thumb_func_start ov71_0224A684
ov71_0224A684: @ 0x0224A684
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0224A68E
	movs r0, #1
	bx lr
_0224A68E:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov71_0224A684

	thumb_func_start ov71_0224A694
ov71_0224A694: @ 0x0224A694
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [sp, #0x18]
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	str r0, [sp]
	cmp r0, #0
	beq _0224A6D4
	ldr r0, [r5, #0x44]
	ldr r1, [sp]
	subs r0, r4, r0
	blx FUN_020F2998
	str r0, [r5, #0x4c]
	ldr r0, [r5, #0x48]
	ldr r1, [sp]
	subs r0, r6, r0
	blx FUN_020F2998
	str r0, [r5, #0x50]
	ldr r0, [r5, #0x5c]
	ldr r1, [sp]
	subs r0, r7, r0
	blx FUN_020F2998
	str r0, [r5, #0x60]
	str r4, [r5, #0x54]
	str r6, [r5, #0x58]
	ldr r0, [sp, #0x18]
	str r7, [r5, #0x64]
	str r0, [r5, #0x68]
_0224A6D4:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov71_0224A694

	thumb_func_start ov71_0224A6D8
ov71_0224A6D8: @ 0x0224A6D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0224A7CC @ =0x0224C020
	ldr r0, [r0]
	cmp r0, #0
	beq _0224A7BA
	adds r0, r5, #0
	adds r0, #0x78
	ldrh r0, [r0]
	movs r1, #0xb6
	blx FUN_020F2998
	adds r4, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	cmp r4, r0
	blt _0224A6FC
	subs r4, r4, r0
_0224A6FC:
	movs r0, #0x78
	ldrsh r1, [r5, r0]
	movs r0, #0x7a
	ldrsh r0, [r5, r0]
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x78
	strh r1, [r0]
	ldr r0, [r5, #0x68]
	cmp r0, #0
	beq _0224A744
	subs r0, r0, #1
	str r0, [r5, #0x68]
	beq _0224A730
	ldr r1, [r5, #0x44]
	ldr r0, [r5, #0x4c]
	adds r0, r1, r0
	str r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x50]
	adds r0, r1, r0
	str r0, [r5, #0x48]
	ldr r1, [r5, #0x5c]
	ldr r0, [r5, #0x60]
	adds r0, r1, r0
	b _0224A73A
_0224A730:
	ldr r0, [r5, #0x54]
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x58]
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x64]
_0224A73A:
	str r0, [r5, #0x5c]
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x5c]
	bl ov71_02247730
_0224A744:
	lsls r0, r4, #0x10
	ldr r6, [r5, #0x44]
	lsrs r0, r0, #0x10
	bl FUN_0201FC30
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r5, #0x1c]
	lsls r0, r4, #0x10
	ldr r6, [r5, #0x48]
	lsrs r0, r0, #0x10
	bl FUN_0201FBB8
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r5, #0x20]
	adds r1, r5, #0
	str r3, [r5, #0x24]
	movs r0, #0x34
	ldrsh r2, [r5, r0]
	movs r0, #3
	lsls r0, r0, #8
	subs r0, r2, r0
	strh r0, [r5, #0x34]
	ldr r0, [r5, #0xc]
	adds r1, #0x34
	bl ov71_022476EC
	adds r0, r5, #0
	adds r1, r5, #0
	adds r5, #0x28
	adds r0, #0x1c
	adds r1, #0x10
	adds r2, r5, #0
	blx FUN_020CCD78
	pop {r4, r5, r6, pc}
_0224A7BA:
	adds r2, r5, #0
	adds r2, #0x10
	ldm r2!, {r0, r1}
	adds r5, #0x28
	stm r5!, {r0, r1}
	ldr r0, [r2]
	str r0, [r5]
	pop {r4, r5, r6, pc}
	nop
_0224A7CC: .4byte 0x0224C020
	thumb_func_end ov71_0224A6D8

	thumb_func_start ov71_0224A7D0
ov71_0224A7D0: @ 0x0224A7D0
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4, #0x74]
	cmp r1, #0x46
	bge _0224A7DE
	adds r1, r1, #1
	str r1, [r4, #0x74]
_0224A7DE:
	ldr r1, [r4, #0x6c]
	cmp r1, #3
	bhi _0224A8A4
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224A7F0: @ jump table
	.2byte _0224A7F8 - _0224A7F0 - 2 @ case 0
	.2byte _0224A81E - _0224A7F0 - 2 @ case 1
	.2byte _0224A858 - _0224A7F0 - 2 @ case 2
	.2byte _0224A892 - _0224A7F0 - 2 @ case 3
_0224A7F8:
	adds r0, r4, #0
	bl ov71_0224A6D8
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x28
	bl ov71_022476C4
	ldr r0, [r4, #0x74]
	adds r0, r0, #1
	str r0, [r4, #0x74]
	cmp r0, #0xc
	blt _0224A8A4
	movs r0, #0
	str r0, [r4, #0x74]
	ldr r0, [r4, #0x6c]
	adds r0, r0, #1
	str r0, [r4, #0x6c]
	pop {r4, pc}
_0224A81E:
	ldr r0, [r4, #0xc]
	bl ov71_02247738
	cmp r0, #0
	bne _0224A836
	ldr r0, [r4]
	bl ov71_0224A8A8
	ldr r0, [r4, #0x6c]
	adds r0, r0, #1
	str r0, [r4, #0x6c]
	pop {r4, pc}
_0224A836:
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x3c]
	adds r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x40]
	adds r0, r1, r0
	str r0, [r4, #0x18]
	adds r0, r4, #0
	bl ov71_0224A6D8
	ldr r0, [r4, #0xc]
	adds r4, #0x28
	adds r1, r4, #0
	bl ov71_022476C4
	pop {r4, pc}
_0224A858:
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x3c]
	adds r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x40]
	adds r0, r1, r0
	str r0, [r4, #0x18]
	adds r0, r4, #0
	bl ov71_0224A6D8
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x28
	bl ov71_022476C4
	ldr r0, [r4, #0x74]
	cmp r0, #0x46
	blt _0224A8A4
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl ov71_02247704
	movs r0, #0
	str r0, [r4, #0x70]
	ldr r0, [r4, #0x6c]
	adds r0, r0, #1
	str r0, [r4, #0x6c]
	pop {r4, pc}
_0224A892:
	ldr r1, [r4, #0x70]
	adds r1, r1, #1
	str r1, [r4, #0x70]
	cmp r1, #8
	ble _0224A8A4
	movs r1, #0
	str r1, [r4, #4]
	bl FUN_0200E390
_0224A8A4:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_0224A7D0

	thumb_func_start ov71_0224A8A8
ov71_0224A8A8: @ 0x0224A8A8
	movs r1, #1
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
	thumb_func_end ov71_0224A8A8

	thumb_func_start ov71_0224A8B0
ov71_0224A8B0: @ 0x0224A8B0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _0224A8CE
	blx FUN_020CF670
	ldr r0, [r4, #0x28]
	bl ov71_022474CC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
_0224A8CE:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0224A910
	ldr r1, _0224A914 @ =0x0000EEB0
	add r0, sp, #0
	strh r1, [r0]
	movs r1, #0
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	movs r1, #3
	adds r3, r1, #0
	ldr r0, [r4, #0x24]
	adds r2, r1, #0
	adds r3, #0xfd
	bl FUN_0201BC8C
	ldr r0, [r4, #0x24]
	movs r1, #7
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r4, #0x28]
	add r1, sp, #0
	bl ov71_0224781C
	ldr r2, _0224A918 @ =0x04000304
	ldr r0, _0224A91C @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	movs r0, #0
	str r0, [r4, #0xc]
_0224A910:
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_0224A914: .4byte 0x0000EEB0
_0224A918: .4byte 0x04000304
_0224A91C: .4byte 0xFFFF7FFF
	thumb_func_end ov71_0224A8B0

	thumb_func_start ov71_0224A920
ov71_0224A920: @ 0x0224A920
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x39
	movs r1, #0x3c
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _0224A94E
	str r5, [r4]
	movs r0, #0
	str r0, [r4, #4]
	adds r0, r5, #0
	bl ov71_02247384
	str r0, [r4, #0xc]
	movs r0, #0
	str r0, [r4, #0x20]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	str r0, [r4, #0x38]
_0224A94E:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov71_0224A920

	thumb_func_start ov71_0224A954
ov71_0224A954: @ 0x0224A954
	push {r4, lr}
	adds r4, r0, #0
	beq _0224A988
	bl ov71_0224ADB0
	adds r0, r4, #0
	bl ov71_0224AEF4
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _0224A96E
	bl ov71_0224B068
_0224A96E:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0224A978
	bl ov71_0224AFB8
_0224A978:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0224A982
	bl ov71_0224B11C
_0224A982:
	adds r0, r4, #0
	bl FUN_0201AB0C
_0224A988:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_0224A954

	thumb_func_start ov71_0224A98C
ov71_0224A98C: @ 0x0224A98C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r2, [r4]
	adds r5, r0, #0
	cmp r2, #3
	bhs _0224A9BA
	lsls r3, r2, #2
	ldr r2, _0224A9C0 @ =0x0224BEF0
	adds r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _0224A9B0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	str r0, [r5, #4]
_0224A9B0:
	adds r0, r5, #0
	bl ov71_0224A9C4
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224A9BA:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0224A9C0: .4byte 0x0224BEF0
	thumb_func_end ov71_0224A98C

	thumb_func_start ov71_0224A9C4
ov71_0224A9C4: @ 0x0224A9C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0224A9F6
	movs r0, #0x2a
	ldrsh r1, [r4, r0]
	movs r0, #1
	lsls r0, r0, #0xc
	adds r0, r1, r0
	strh r0, [r4, #0x2a]
	adds r1, r4, #0
	ldr r0, [r4, #0x24]
	adds r1, #0x28
	bl ov71_022476EC
	blx FUN_020CF670
	ldr r0, [r4, #0x20]
	bl ov71_022474CC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
_0224A9F6:
	pop {r4, pc}
	thumb_func_end ov71_0224A9C4

	thumb_func_start ov71_0224A9F8
ov71_0224A9F8: @ 0x0224A9F8
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov71_0224AB7C
	adds r0, r4, #0
	bl ov71_0224ADE4
	movs r0, #8
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	ldr r3, _0224AA24 @ =0x00007FFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0224AA24: .4byte 0x00007FFF
	thumb_func_end ov71_0224A9F8

	thumb_func_start ov71_0224AA28
ov71_0224AA28: @ 0x0224AA28
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #6
	bhi _0224AAF2
	adds r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0224AA40: @ jump table
	.2byte _0224AA4E - _0224AA40 - 2 @ case 0
	.2byte _0224AA6C - _0224AA40 - 2 @ case 1
	.2byte _0224AA86 - _0224AA40 - 2 @ case 2
	.2byte _0224AA98 - _0224AA40 - 2 @ case 3
	.2byte _0224AAB0 - _0224AA40 - 2 @ case 4
	.2byte _0224AAD4 - _0224AA40 - 2 @ case 5
	.2byte _0224AAE8 - _0224AA40 - 2 @ case 6
_0224AA4E:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0224AAF2
	movs r0, #0
	str r0, [r4, #8]
	adds r0, r4, #0
	adds r4, #0x30
	adds r1, r4, #0
	bl ov71_0224AFD4
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224AAF2
_0224AA6C:
	ldr r1, [r4, #8]
	adds r1, r1, #1
	str r1, [r4, #8]
	cmp r1, #8
	ble _0224AAF2
	adds r4, #0x34
	adds r1, r4, #0
	bl ov71_0224AF08
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224AAF2
_0224AA86:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bne _0224AAF2
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _0224AAF2
	adds r0, r1, #1
	str r0, [r5]
	b _0224AAF2
_0224AA98:
	movs r1, #0
	adds r0, #0x14
	mvns r1, r1
	bl ov71_02246C6C
	str r0, [r4, #0x10]
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224AAF2
_0224AAB0:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x1e
	ble _0224AAF2
	adds r0, r4, #0
	adds r0, #0x38
	str r0, [sp]
	ldr r0, [r4, #0x24]
	movs r1, #0x1f
	movs r2, #0
	movs r3, #0x28
	bl ov71_0224B084
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224AAF2
_0224AAD4:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _0224AAF2
	ldr r0, [r4, #0x10]
	bl ov71_02246D40
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224AAF2
_0224AAE8:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0224AAF2
	movs r0, #1
	pop {r3, r4, r5, pc}
_0224AAF2:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov71_0224AA28

	thumb_func_start ov71_0224AAF8
ov71_0224AAF8: @ 0x0224AAF8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0224AB10
	cmp r0, #1
	beq _0224AB38
	cmp r0, #2
	beq _0224AB62
	b _0224AB76
_0224AB10:
	movs r0, #0x4a
	lsls r0, r0, #2
	movs r3, #1
	str r0, [sp]
	adds r0, r5, #0
	str r3, [sp, #4]
	adds r0, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, #0xc]
	lsls r1, r3, #0xc
	lsls r2, r3, #0xa
	bl ov71_02247000
	str r0, [r5, #0x18]
	movs r0, #0
	str r0, [r5, #8]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224AB76
_0224AB38:
	ldr r0, [r5, #8]
	adds r0, r0, #1
	str r0, [r5, #8]
	cmp r0, #0xd
	ble _0224AB76
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224AB76
_0224AB62:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0224AB76
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _0224AB76
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0224AB76:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov71_0224AAF8

	thumb_func_start ov71_0224AB7C
ov71_0224AB7C: @ 0x0224AB7C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, _0224AD94 @ =0x0224BF54
	bl FUN_02022BE8
	ldr r2, _0224AD98 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0224AD9C @ =0x0224BEFC
	bl FUN_0201ACB0
	ldr r0, [r4, #0xc]
	ldr r2, _0224ADA0 @ =0x0224BF1C
	movs r1, #2
	movs r3, #1
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	ldr r2, _0224ADA0 @ =0x0224BF1C
	movs r1, #6
	movs r3, #1
	bl FUN_0201B1E4
	blx FUN_020D3A38
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	ldr r2, _0224ADA4 @ =0x0224BF38
	movs r1, #3
	movs r3, #2
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	ldr r2, _0224ADA4 @ =0x0224BF38
	movs r1, #7
	movs r3, #2
	bl FUN_0201B1E4
	adds r0, r5, #0
	blx FUN_020D3A4C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	movs r1, #2
	ldr r2, [r4, #0xc]
	movs r0, #0x59
	adds r3, r1, #0
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	movs r0, #0x59
	movs r1, #2
	movs r3, #6
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	movs r0, #0x59
	movs r3, #2
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	movs r0, #0x59
	movs r3, #6
	bl FUN_02007914
	ldr r0, [r4]
	bl ov71_022473A0
	adds r5, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x39
	movs r2, #0
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #3
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x39
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #3
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	ldr r0, _0224ADA8 @ =0x0224BEE8
	lsls r1, r5, #1
	ldrh r5, [r0, r1]
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0x59
	movs r1, #3
	movs r2, #0
	adds r3, r5, #0
	bl FUN_02007950
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0x59
	movs r1, #3
	movs r2, #4
	adds r3, r5, #0
	bl FUN_02007950
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	movs r0, #0x59
	movs r1, #5
	movs r3, #3
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	movs r0, #0x59
	movs r1, #5
	movs r3, #7
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	movs r0, #0x59
	movs r1, #4
	movs r3, #3
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	movs r0, #0x59
	movs r1, #4
	movs r3, #7
	bl FUN_02007914
	movs r0, #0x39
	movs r1, #0x60
	bl FUN_0201AA8C
	adds r5, r0, #0
	beq _0224AD52
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0x60
	blx FUN_020D47EC
	adds r0, r5, #0
	movs r1, #0x60
	blx DC_FlushRange
	blx FUN_020D0524
	blx FUN_020D0774
	movs r1, #6
	adds r0, r5, #0
	lsls r1, r1, #0xc
	movs r2, #0x60
	blx FUN_020D05C4
	movs r1, #6
	adds r0, r5, #0
	lsls r1, r1, #0xc
	movs r2, #0x60
	blx FUN_020D078C
	blx FUN_020D0634
	blx FUN_020D07F0
	adds r0, r5, #0
	bl FUN_0201AB0C
_0224AD52:
	ldr r0, [r4, #0xc]
	ldr r3, _0224ADAC @ =0xFFFFFE80
	movs r1, #2
	movs r2, #3
	bl FUN_0201BC8C
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r4, #0xc]
	movs r1, #6
	subs r3, #0xc3
	bl FUN_0201BC8C
	movs r1, #3
	ldr r0, [r4, #0xc]
	adds r2, r1, #0
	movs r3, #0x43
	bl FUN_0201BC8C
	movs r0, #7
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224AD94: .4byte 0x0224BF54
_0224AD98: .4byte 0x04000304
_0224AD9C: .4byte 0x0224BEFC
_0224ADA0: .4byte 0x0224BF1C
_0224ADA4: .4byte 0x0224BF38
_0224ADA8: .4byte 0x0224BEE8
_0224ADAC: .4byte 0xFFFFFE80
	thumb_func_end ov71_0224AB7C

	thumb_func_start ov71_0224ADB0
ov71_0224ADB0: @ 0x0224ADB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0224ADC0
	ldr r0, [r4, #0x10]
	bl ov71_02246D54
_0224ADC0:
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #7
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_0224ADB0

	thumb_func_start ov71_0224ADE4
ov71_0224ADE4: @ 0x0224ADE4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	blx FUN_020C2698
	blx FUN_020CF704
	ldr r0, _0224AEC8 @ =0x04000060
	ldr r1, _0224AECC @ =0xFFFFCFFD
	ldrh r2, [r0]
	ands r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	adds r2, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _0224AED0 @ =0x0000CFFB
	ands r2, r3
	strh r2, [r0]
	adds r2, r1, #2
	ldrh r3, [r0]
	adds r1, r1, #2
	ands r3, r2
	movs r2, #8
	orrs r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	ands r2, r1
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r0]
	ldr r0, _0224AED4 @ =0x0224BF0C
	blx FUN_020CF8E4
	movs r1, #0
	ldr r0, _0224AED8 @ =0x000043FF
	ldr r2, _0224AEDC @ =0x00007FFF
	movs r3, #0x3f
	str r1, [sp]
	blx FUN_020CF910
	ldr r1, _0224AEE0 @ =0x04000540
	movs r0, #2
	str r0, [r1]
	ldr r0, _0224AEE4 @ =0xBFFF0000
	str r0, [r1, #0x40]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02027000
	movs r0, #1
	lsls r0, r0, #0xe
	movs r1, #1
	bl FUN_02027008
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r1, _0224AEE8 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	strh r2, [r1]
	movs r1, #0
	movs r0, #1
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov71_0224744C
	str r0, [r4, #0x20]
	movs r1, #0
	movs r0, #0x23
	str r1, [sp]
	lsls r0, r0, #0xe
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x20]
	movs r2, #0x59
	movs r3, #0x1b
	bl ov71_02247610
	str r0, [r4, #0x24]
	ldr r0, _0224AEEC @ =0x0224C0D0
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r0, [r4, #0x20]
	ldr r1, _0224AEF0 @ =0x0224C0D0
	bl ov71_0224780C
	ldr r0, [r4, #0x20]
	movs r1, #1
	bl ov71_0224782C
	movs r1, #2
	ldr r0, [r4, #0x24]
	lsls r1, r1, #0xc
	bl ov71_02247730
	ldr r0, [r4, #0x24]
	adds r4, #0x28
	adds r1, r4, #0
	bl ov71_022476D4
	add sp, #0x10
	pop {r4, pc}
	nop
_0224AEC8: .4byte 0x04000060
_0224AECC: .4byte 0xFFFFCFFD
_0224AED0: .4byte 0x0000CFFB
_0224AED4: .4byte 0x0224BF0C
_0224AED8: .4byte 0x000043FF
_0224AEDC: .4byte 0x00007FFF
_0224AEE0: .4byte 0x04000540
_0224AEE4: .4byte 0xBFFF0000
_0224AEE8: .4byte 0x04000008
_0224AEEC: .4byte 0x0224C0D0
_0224AEF0: .4byte 0x0224C0D0
	thumb_func_end ov71_0224ADE4

	thumb_func_start ov71_0224AEF4
ov71_0224AEF4: @ 0x0224AEF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0224AF06
	bl ov71_02247498
	movs r0, #0
	str r0, [r4, #0x20]
_0224AF06:
	pop {r4, pc}
	thumb_func_end ov71_0224AEF4

	thumb_func_start ov71_0224AF08
ov71_0224AF08: @ 0x0224AF08
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #0x39
	movs r1, #0x24
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _0224AF48
	str r6, [r4]
	ldr r0, [r6, #0xc]
	adds r1, r4, #0
	str r0, [r4, #4]
	ldr r0, _0224AF4C @ =0xFFE80000
	movs r2, #0
	str r0, [r4, #0xc]
	asrs r0, r0, #1
	str r0, [r4, #0x10]
	ldr r0, _0224AF50 @ =0x00009999
	str r0, [r4, #0x14]
	movs r0, #0x28
	str r0, [r4, #8]
	ldr r0, _0224AF54 @ =ov71_0224AF58
	str r5, [r4, #0x1c]
	bl FUN_0200E33C
	str r0, [r5]
	cmp r0, #0
	bne _0224AF48
	adds r0, r4, #0
	bl FUN_0201AB0C
_0224AF48:
	pop {r4, r5, r6, pc}
	nop
_0224AF4C: .4byte 0xFFE80000
_0224AF50: .4byte 0x00009999
_0224AF54: .4byte ov71_0224AF58
	thumb_func_end ov71_0224AF08

	thumb_func_start ov71_0224AF58
ov71_0224AF58: @ 0x0224AF58
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224AF98
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x14]
	movs r2, #3
	adds r0, r1, r0
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x14]
	adds r0, r1, r0
	str r0, [r4, #0x10]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #4]
	movs r1, #2
	asrs r3, r3, #0xc
	bl FUN_0201BC8C
	ldr r3, [r4, #0x10]
	ldr r0, [r4, #4]
	movs r1, #6
	movs r2, #3
	asrs r3, r3, #0xc
	bl FUN_0201BC8C
	ldr r0, [r4, #8]
	subs r0, r0, #1
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224AF98:
	ldr r0, [r4, #4]
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r4, #4]
	movs r1, #6
	movs r2, #3
	movs r3, #0xc0
	bl FUN_0201BC8C
	adds r0, r5, #0
	bl ov71_0224AFB8
	pop {r3, r4, r5, pc}
	thumb_func_end ov71_0224AF58

	thumb_func_start ov71_0224AFB8
ov71_0224AFB8: @ 0x0224AFB8
	push {r4, lr}
	adds r4, r0, #0
	beq _0224AFD2
	bl FUN_0201F988
	ldr r1, [r0, #0x1c]
	movs r2, #0
	str r2, [r1]
	bl ov71_02247424
	adds r0, r4, #0
	bl FUN_0200E390
_0224AFD2:
	pop {r4, pc}
	thumb_func_end ov71_0224AFB8

	thumb_func_start ov71_0224AFD4
ov71_0224AFD4: @ 0x0224AFD4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #0x39
	movs r1, #0x1c
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _0224B020
	str r5, [r4]
	ldr r0, [r6, #0x24]
	adds r1, r4, #0
	str r0, [r4, #8]
	adds r1, #0xc
	bl ov71_022476B4
	movs r0, #0x32
	ldr r1, [r4, #0x10]
	lsls r0, r0, #0xc
	subs r1, r0, r1
	asrs r0, r1, #3
	lsrs r0, r0, #0x1c
	adds r0, r1, r0
	asrs r0, r0, #4
	str r0, [r4, #0x18]
	movs r0, #0x10
	str r0, [r4, #4]
	ldr r0, _0224B024 @ =ov71_0224B028
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	str r0, [r5]
	cmp r0, #0
	bne _0224B020
	adds r0, r4, #0
	bl FUN_0201AB0C
_0224B020:
	pop {r4, r5, r6, pc}
	nop
_0224B024: .4byte ov71_0224B028
	thumb_func_end ov71_0224AFD4

	thumb_func_start ov71_0224B028
ov71_0224B028: @ 0x0224B028
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0224B04E
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x18]
	adds r0, r1, r0
	str r0, [r4, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #8]
	adds r1, #0xc
	bl ov71_022476C4
	ldr r0, [r4, #4]
	subs r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0224B04E:
	movs r0, #0x32
	lsls r0, r0, #0xc
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	adds r4, #0xc
	adds r1, r4, #0
	bl ov71_022476C4
	adds r0, r5, #0
	bl ov71_0224B068
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov71_0224B028

	thumb_func_start ov71_0224B068
ov71_0224B068: @ 0x0224B068
	push {r4, lr}
	adds r4, r0, #0
	beq _0224B082
	bl FUN_0201F988
	ldr r1, [r0]
	movs r2, #0
	str r2, [r1]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0200E390
_0224B082:
	pop {r4, pc}
	thumb_func_end ov71_0224B068

	thumb_func_start ov71_0224B084
ov71_0224B084: @ 0x0224B084
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	adds r6, r1, #0
	movs r0, #0x39
	movs r1, #0x18
	str r2, [sp, #4]
	adds r7, r3, #0
	ldr r5, [sp, #0x20]
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _0224B0DC
	str r5, [r4]
	lsls r0, r6, #0xc
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	lsls r1, r0, #0xc
	str r1, [r4, #0xc]
	ldr r0, [r4, #4]
	subs r0, r1, r0
	adds r1, r7, #0
	blx FUN_020F2998
	str r0, [r4, #8]
	ldr r0, [sp]
	str r7, [r4, #0x10]
	adds r1, r6, #0
	str r0, [r4, #0x14]
	bl ov71_02247708
	ldr r0, _0224B0E4 @ =ov71_0224B0E8
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	str r0, [r5]
	cmp r0, #0
	bne _0224B0E0
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0224B0DC:
	movs r0, #0
	str r0, [r5]
_0224B0E0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224B0E4: .4byte ov71_0224B0E8
	thumb_func_end ov71_0224B084

	thumb_func_start ov71_0224B0E8
ov71_0224B0E8: @ 0x0224B0E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r1, #0x10]
	subs r0, r0, #1
	str r0, [r1, #0x10]
	cmp r0, #0
	ble _0224B108
	ldr r2, [r1, #4]
	ldr r0, [r1, #8]
	adds r2, r2, r0
	str r2, [r1, #4]
	ldr r0, [r1, #0x14]
	asrs r1, r2, #0xc
	bl ov71_02247708
	pop {r4, pc}
_0224B108:
	ldr r0, [r1, #0x14]
	ldr r1, [r1, #0xc]
	asrs r1, r1, #0xc
	bl ov71_02247708
	adds r0, r4, #0
	bl ov71_0224B11C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_0224B0E8

	thumb_func_start ov71_0224B11C
ov71_0224B11C: @ 0x0224B11C
	push {r4, lr}
	adds r4, r0, #0
	beq _0224B136
	bl FUN_0201F988
	ldr r1, [r0]
	movs r2, #0
	str r2, [r1]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0200E390
_0224B136:
	pop {r4, pc}
	thumb_func_end ov71_0224B11C

	thumb_func_start ov71_0224B138
ov71_0224B138: @ 0x0224B138
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x39
	movs r1, #0x88
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _0224B194
	str r5, [r4]
	movs r0, #0
	str r0, [r4, #4]
	adds r0, r5, #0
	bl ov71_02247384
	str r0, [r4, #0x58]
	movs r0, #0x39
	bl FUN_02007FD4
	str r0, [r4, #0x10]
	movs r0, #0
	str r0, [r4, #0x14]
	movs r0, #0x4b
	lsls r0, r0, #2
	movs r1, #0x39
	bl FUN_02026354
	str r0, [r4, #0x6c]
	movs r0, #0x4b
	lsls r0, r0, #2
	movs r1, #0x39
	bl FUN_02026354
	str r0, [r4, #0x70]
	movs r1, #0
	adds r0, r4, #0
	str r1, [r4, #0x7c]
	adds r0, #0x80
	str r1, [r0]
	str r1, [r4, #0x74]
	movs r0, #0xb4
	movs r1, #0x39
	bl FUN_02007688
	adds r1, r4, #0
	adds r1, #0x84
	str r0, [r1]
_0224B194:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov71_0224B138

	thumb_func_start ov71_0224B198
ov71_0224B198: @ 0x0224B198
	push {r4, lr}
	adds r4, r0, #0
	beq _0224B1F8
	bl ov71_0224B970
	adds r0, r4, #0
	bl ov71_0224B8EC
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl ov71_0224BA48
	ldr r0, [r4, #0x6c]
	bl FUN_02026380
	ldr r0, [r4, #0x70]
	bl FUN_02026380
	ldr r0, [r4, #0x74]
	cmp r0, #0
	beq _0224B1C8
	bl ov71_02247498
_0224B1C8:
	ldr r0, [r4, #0x58]
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0x5c
	bl FUN_0201D520
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0224B1E2
	bl FUN_02008780
_0224B1E2:
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_0200770C
	ldr r0, [r4, #0x10]
	bl FUN_02008524
	adds r0, r4, #0
	bl FUN_0201AB0C
_0224B1F8:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_0224B198

	thumb_func_start ov71_0224B1FC
ov71_0224B1FC: @ 0x0224B1FC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r2, [r4]
	adds r5, r0, #0
	cmp r2, #4
	bhs _0224B22A
	lsls r3, r2, #2
	ldr r2, _0224B230 @ =0x0224BF84
	adds r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _0224B220
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	str r0, [r5, #4]
_0224B220:
	adds r0, r5, #0
	bl ov71_0224B234
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224B22A:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0224B230: .4byte 0x0224BF84
	thumb_func_end ov71_0224B1FC

	thumb_func_start ov71_0224B234
ov71_0224B234: @ 0x0224B234
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	blx FUN_020CF670
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	blx FUN_020C23F4
	blx FUN_020B7350
	ldr r0, [r4, #0x10]
	bl FUN_02009418
	ldr r0, [r4, #0x10]
	bl FUN_02008120
	movs r2, #1
	str r2, [sp]
	movs r0, #0x12
	add r1, sp, #0
	blx FUN_020C2528
	ldr r0, [r4, #0x74]
	cmp r0, #0
	beq _0224B272
	bl ov71_022474CC
_0224B272:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov71_0224B234

	thumb_func_start ov71_0224B280
ov71_0224B280: @ 0x0224B280
	push {r3, r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, _0224B430 @ =0x0224BFDC
	bl FUN_02022BE8
	ldr r2, _0224B434 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0224B438 @ =0x0224BF94
	bl FUN_0201ACB0
	ldr r0, [r4, #0x58]
	ldr r2, _0224B43C @ =0x0224BFA4
	movs r1, #1
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x58]
	ldr r2, _0224B440 @ =0x0224BFC0
	movs r1, #2
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r2, _0224B444 @ =0x04000008
	movs r0, #3
	ldrh r3, [r2]
	movs r1, #1
	bics r3, r0
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r2, #0
	str r2, [sp]
	ldr r0, [r4, #0x58]
	adds r3, r1, #0
	bl FUN_0201C1F4
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4, #0x58]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201C8C4
	ldr r0, [r4]
	bl ov71_022473D0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x39
	str r0, [sp, #4]
	ldr r0, [r4, #0x58]
	movs r1, #1
	movs r2, #0x6d
	movs r3, #2
	bl FUN_0200E644
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	adds r1, r4, #0
	str r0, [sp, #8]
	movs r2, #1
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, [r4, #0x58]
	adds r1, #0x5c
	movs r3, #2
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0x5c
	movs r1, #0xf
	bl FUN_0201D978
	movs r3, #0x20
	str r3, [sp]
	movs r0, #0x39
	str r0, [sp, #4]
	movs r0, #0x10
	movs r1, #8
	movs r2, #0
	bl FUN_02007938
	ldr r0, [r4, #0x58]
	movs r1, #1
	bl FUN_0201BF7C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x58]
	movs r0, #0x59
	movs r1, #0x16
	movs r3, #2
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x58]
	movs r0, #0x59
	movs r1, #0x15
	movs r3, #2
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x39
	movs r2, #0
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #0x17
	adds r3, r2, #0
	bl FUN_02007938
	adds r0, r4, #0
	bl ov71_0224B720
	movs r1, #0
	movs r0, #1
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov71_0224744C
	str r0, [r4, #0x74]
	adds r0, r4, #0
	bl ov71_0224B7EC
	movs r1, #6
	movs r2, #1
	str r0, [r4, #0x14]
	bl FUN_020087A4
	movs r1, #0
	movs r0, #0x13
	str r1, [sp]
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r0, #0x1e
	lsls r0, r0, #0xe
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x74]
	movs r2, #0x59
	movs r3, #0x1b
	bl ov71_02247610
	ldr r2, _0224B448 @ =0x0224BF7C
	str r0, [r4, #0x78]
	ldrh r3, [r2]
	add r0, sp, #0x14
	add r1, sp, #0x14
	strh r3, [r0]
	ldrh r3, [r2, #2]
	ldrh r2, [r2, #4]
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	ldr r0, [r4, #0x78]
	bl ov71_022476EC
	adds r0, r4, #0
	bl ov71_0224B848
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0
	str r0, [sp]
	ldr r0, _0224B44C @ =0x04000050
	movs r1, #1
	movs r2, #4
	movs r3, #0x10
	blx FUN_020CF15C
	movs r0, #0x10
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	movs r0, #1
	add sp, #0x1c
	pop {r3, r4, pc}
	.align 2, 0
_0224B430: .4byte 0x0224BFDC
_0224B434: .4byte 0x04000304
_0224B438: .4byte 0x0224BF94
_0224B43C: .4byte 0x0224BFA4
_0224B440: .4byte 0x0224BFC0
_0224B444: .4byte 0x04000008
_0224B448: .4byte 0x0224BF7C
_0224B44C: .4byte 0x04000050
	thumb_func_end ov71_0224B280

	thumb_func_start ov71_0224B450
ov71_0224B450: @ 0x0224B450
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r1]
	cmp r0, #0
	bne _0224B476
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0224B476
	ldr r0, [r4, #0x40]
	movs r1, #1
	bl FUN_020248F0
	ldr r0, [r4, #0x40]
	movs r1, #1
	bl FUN_02024830
	movs r0, #1
	pop {r4, pc}
_0224B476:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_0224B450

	thumb_func_start ov71_0224B47C
ov71_0224B47C: @ 0x0224B47C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r1, #0
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #4
	bhi _0224B576
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224B496: @ jump table
	.2byte _0224B4A0 - _0224B496 - 2 @ case 0
	.2byte _0224B4AE - _0224B496 - 2 @ case 1
	.2byte _0224B4DC - _0224B496 - 2 @ case 2
	.2byte _0224B504 - _0224B496 - 2 @ case 3
	.2byte _0224B566 - _0224B496 - 2 @ case 4
_0224B4A0:
	adds r1, r4, #0
	adds r1, #0x80
	bl ov71_0224B9CC
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
_0224B4AE:
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	bne _0224B576
	ldr r0, [r4, #0x44]
	movs r1, #2
	bl FUN_020248F0
	ldr r0, [r4, #0x44]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #0x78]
	movs r1, #0
	bl ov71_02247704
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224B576
_0224B4DC:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	ble _0224B576
	ldr r0, [r4, #0x14]
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0xc
	bl ov71_0224B910
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _0224B576
_0224B504:
	bl ov71_0224B960
	cmp r0, #0
	beq _0224B576
	ldr r0, [r4]
	bl ov71_02247398
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E640
	cmp r0, #0
	bne _0224B55A
	ldr r0, [r4]
	bl ov71_022473BC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	add r1, sp, #0
	movs r3, #1
	bl FUN_020729A4
	ldr r0, [r4]
	bl ov71_022473BC
	adds r6, r0, #0
	ldr r0, [r4]
	bl ov71_022473C4
	adds r2, r0, #0
	add r1, sp, #0
	lsls r2, r2, #0x18
	ldrb r1, [r1]
	adds r0, r6, #0
	lsrs r2, r2, #0x18
	bl FUN_020062E0
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_02008550
_0224B55A:
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224B576
_0224B566:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x1e
	ble _0224B576
	add sp, #4
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0224B576:
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov71_0224B47C

	thumb_func_start ov71_0224B57C
ov71_0224B57C: @ 0x0224B57C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #5
	bhi _0224B5B8
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224B596: @ jump table
	.2byte _0224B5A2 - _0224B596 - 2 @ case 0
	.2byte _0224B5AE - _0224B596 - 2 @ case 1
	.2byte _0224B62C - _0224B596 - 2 @ case 2
	.2byte _0224B68E - _0224B596 - 2 @ case 3
	.2byte _0224B6AE - _0224B596 - 2 @ case 4
	.2byte _0224B6D8 - _0224B596 - 2 @ case 5
_0224B5A2:
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224B6E6
_0224B5AE:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	bgt _0224B5BA
_0224B5B8:
	b _0224B6E6
_0224B5BA:
	ldr r0, [r4]
	bl ov71_0224738C
	str r0, [sp, #0xc]
	ldr r0, [r4]
	bl ov71_02247388
	adds r7, r0, #0
	ldr r0, [r4]
	bl ov71_022473DC
	cmp r0, #1
	bne _0224B5DA
	movs r1, #2
	adds r6, r1, #0
	b _0224B5DE
_0224B5DA:
	movs r1, #5
	movs r6, #3
_0224B5DE:
	ldr r0, [sp, #0xc]
	ldr r2, [r4, #0x6c]
	bl FUN_0200BB6C
	ldr r1, [r4, #0x70]
	ldr r2, [r4, #0x6c]
	adds r0, r7, #0
	bl FUN_0200CBBC
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r4, #0
	ldr r2, [r4, #0x70]
	adds r0, #0x5c
	movs r1, #1
	bl FUN_020200A8
	adds r0, r4, #0
	adds r0, #0x5c
	movs r1, #0x6d
	movs r2, #2
	bl FUN_0200E948
	adds r0, r4, #0
	adds r0, #0x5c
	bl FUN_0201D578
	ldr r0, _0224B6EC @ =0x000004A4
	bl FUN_02006B24
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	str r0, [r4, #0xc]
	str r6, [r5]
	b _0224B6E6
_0224B62C:
	movs r1, #0x3c
	bl ov71_0224B6F0
	cmp r0, #0
	beq _0224B6E6
	ldr r0, [r4]
	bl ov71_0224738C
	adds r6, r0, #0
	ldr r0, [r4]
	bl ov71_02247388
	adds r7, r0, #0
	ldr r2, [r4, #0x6c]
	adds r0, r6, #0
	movs r1, #3
	bl FUN_0200BB6C
	ldr r1, [r4, #0x70]
	ldr r2, [r4, #0x6c]
	adds r0, r7, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	adds r0, #0x5c
	movs r1, #0xf
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r4, #0
	ldr r2, [r4, #0x70]
	adds r0, #0x5c
	movs r1, #1
	bl FUN_020200A8
	adds r0, r4, #0
	adds r0, #0x5c
	bl FUN_0201D8A0
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224B6E6
_0224B68E:
	movs r1, #0x3c
	bl ov71_0224B6F0
	cmp r0, #0
	beq _0224B6E6
	adds r0, r4, #0
	adds r0, #0x5c
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224B6E6
_0224B6AE:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	ble _0224B6E6
	movs r0, #0x10
	str r0, [sp]
	movs r1, #0
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224B6E6
_0224B6D8:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0224B6E6
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224B6E6:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224B6EC: .4byte 0x000004A4
	thumb_func_end ov71_0224B57C

	thumb_func_start ov71_0224B6F0
ov71_0224B6F0: @ 0x0224B6F0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r4, r1, #0
	cmp r0, #0
	beq _0224B702
	bl FUN_02006BCC
	str r0, [r5, #0xc]
_0224B702:
	ldr r0, [r5, #8]
	cmp r0, r4
	bge _0224B710
	adds r0, r0, #1
	str r0, [r5, #8]
	movs r0, #0
	pop {r3, r4, r5, pc}
_0224B710:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _0224B71A
	movs r0, #1
	pop {r3, r4, r5, pc}
_0224B71A:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov71_0224B6F0

	thumb_func_start ov71_0224B720
ov71_0224B720: @ 0x0224B720
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	blx FUN_020C2698
	blx FUN_020CF704
	ldr r0, _0224B7C8 @ =0x04000060
	ldr r2, _0224B7CC @ =0xFFFFCFFD
	ldrh r1, [r0]
	ands r1, r2
	strh r1, [r0]
	ldrh r3, [r0]
	adds r1, r2, #2
	ands r3, r1
	movs r1, #0x10
	orrs r1, r3
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _0224B7D0 @ =0x0000CFFB
	ands r1, r3
	strh r1, [r0]
	adds r1, r2, #2
	ldrh r3, [r0]
	lsrs r2, r2, #0x11
	ands r3, r1
	movs r1, #8
	orrs r1, r3
	strh r1, [r0]
	movs r0, #0
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r1, _0224B7D4 @ =0x04000540
	movs r0, #2
	str r0, [r1]
	ldr r0, _0224B7D8 @ =0xBFFF0000
	str r0, [r1, #0x40]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02027000
	movs r0, #1
	lsls r0, r0, #0xe
	movs r1, #1
	bl FUN_02027008
	ldr r3, _0224B7DC @ =0x02110924
	movs r0, #1
	movs r1, #0
	ldr r3, [r3]
	lsls r0, r0, #0xe
	adds r2, r1, #0
	blx r3
	ldr r3, _0224B7E0 @ =0x0211092C
	adds r4, r0, #0
	ldr r3, [r3]
	movs r0, #0x80
	movs r1, #0
	movs r2, #1
	blx r3
	ldr r2, _0224B7E4 @ =0x7FFF0000
	adds r6, r0, #0
	ands r2, r4
	lsls r1, r4, #0x10
	lsrs r2, r2, #0x10
	ldr r0, [r5, #0x10]
	lsrs r1, r1, #0xd
	lsls r2, r2, #4
	bl FUN_020093FC
	ldr r2, _0224B7E8 @ =0xFFFF0000
	lsls r1, r6, #0x10
	ands r2, r6
	lsrs r2, r2, #0x10
	ldr r0, [r5, #0x10]
	lsrs r1, r1, #0xd
	lsls r2, r2, #3
	bl FUN_02009408
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0224B7C8: .4byte 0x04000060
_0224B7CC: .4byte 0xFFFFCFFD
_0224B7D0: .4byte 0x0000CFFB
_0224B7D4: .4byte 0x04000540
_0224B7D8: .4byte 0xBFFF0000
_0224B7DC: .4byte 0x02110924
_0224B7E0: .4byte 0x0211092C
_0224B7E4: .4byte 0x7FFF0000
_0224B7E8: .4byte 0xFFFF0000
	thumb_func_end ov71_0224B720

	thumb_func_start ov71_0224B7EC
ov71_0224B7EC: @ 0x0224B7EC
	push {r3, r4, r5, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [r5]
	bl ov71_02247398
	adds r4, r0, #0
	add r0, sp, #0x10
	adds r1, r4, #0
	movs r2, #2
	movs r3, #0
	bl FUN_0207013C
	ldr r0, [r5]
	bl ov71_022473BC
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	adds r1, r5, #0
	ldr r0, [r0]
	adds r1, #0x18
	movs r3, #1
	bl FUN_02072914
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl FUN_02070854
	adds r3, r0, #0
	movs r1, #0
	str r1, [sp]
	adds r0, r5, #0
	str r1, [sp, #4]
	adds r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0x10]
	adds r3, #0x50
	add r1, sp, #0x10
	movs r2, #0x80
	bl FUN_020085EC
	add sp, #0x20
	pop {r3, r4, r5, pc}
	thumb_func_end ov71_0224B7EC

	thumb_func_start ov71_0224B848
ov71_0224B848: @ 0x0224B848
	push {r4, lr}
	sub sp, #0x70
	adds r4, r0, #0
	adds r0, #0x48
	movs r1, #0x59
	movs r2, #7
	movs r3, #8
	bl ov71_022472C4
	add r0, sp, #0x5c
	blx FUN_020B804C
	add r0, sp, #0x38
	blx FUN_020B8008
	movs r3, #0
	str r3, [sp]
	movs r2, #1
	str r2, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0x39
	str r0, [sp, #0xc]
	add r0, sp, #0x38
	str r0, [sp, #0x10]
	movs r0, #0x59
	movs r1, #9
	bl FUN_02007994
	movs r0, #0x39
	str r0, [sp]
	add r0, sp, #0x5c
	str r0, [sp, #4]
	movs r0, #0x59
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl FUN_02007974
	movs r0, #2
	adds r1, r4, #0
	str r0, [sp]
	add r0, sp, #0x14
	adds r1, #0x48
	add r2, sp, #0x38
	add r3, sp, #0x5c
	bl ov71_02247320
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x14
	movs r2, #0x80
	movs r3, #0x64
	bl ov71_02247340
	str r0, [r4, #0x40]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x14
	movs r2, #0x80
	movs r3, #0x5a
	bl ov71_02247340
	str r0, [r4, #0x44]
	movs r1, #1
	bl FUN_02024A04
	ldr r0, [r4, #0x40]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x44]
	movs r1, #0
	bl FUN_02024830
	add sp, #0x70
	pop {r4, pc}
	thumb_func_end ov71_0224B848

	thumb_func_start ov71_0224B8EC
ov71_0224B8EC: @ 0x0224B8EC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_0224B8F4:
	ldr r0, [r5, #0x40]
	cmp r0, #0
	beq _0224B8FE
	bl FUN_02024758
_0224B8FE:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _0224B8F4
	adds r6, #0x48
	adds r0, r6, #0
	bl ov71_022472FC
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_0224B8EC

	thumb_func_start ov71_0224B910
ov71_0224B910: @ 0x0224B910
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x39
	movs r1, #0x14
	str r2, [sp]
	adds r7, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _0224B956
	str r5, [r4]
	lsls r0, r6, #0xc
	str r0, [r4, #4]
	ldr r0, [sp]
	lsls r1, r0, #0xc
	str r1, [r4, #8]
	ldr r0, [r4, #4]
	subs r0, r1, r0
	adds r1, r7, #0
	blx FUN_020F2998
	str r0, [r4, #0xc]
	ldr r0, _0224B958 @ =ov71_0224B990
	str r7, [r4, #0x10]
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E33C
	str r0, [r5, #0x7c]
	ldr r0, _0224B95C @ =0x04000050
	movs r1, #1
	adds r2, r6, #0
	blx FUN_020CF178
_0224B956:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224B958: .4byte ov71_0224B990
_0224B95C: .4byte 0x04000050
	thumb_func_end ov71_0224B910

	thumb_func_start ov71_0224B960
ov71_0224B960: @ 0x0224B960
	ldr r0, [r0, #0x7c]
	cmp r0, #0
	bne _0224B96A
	movs r0, #1
	bx lr
_0224B96A:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov71_0224B960

	thumb_func_start ov71_0224B970
ov71_0224B970: @ 0x0224B970
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x7c]
	cmp r0, #0
	beq _0224B98C
	bl FUN_0201F988
	bl ov71_02247424
	ldr r0, [r4, #0x7c]
	bl FUN_0200E390
	movs r0, #0
	str r0, [r4, #0x7c]
_0224B98C:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov71_0224B970

	thumb_func_start ov71_0224B990
ov71_0224B990: @ 0x0224B990
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x10]
	subs r0, r0, #1
	str r0, [r4, #0x10]
	cmp r0, #0
	ble _0224B9B2
	ldr r1, [r4, #4]
	ldr r0, [r4, #0xc]
	adds r2, r1, r0
	str r2, [r4, #4]
	ldr r0, _0224B9C8 @ =0x04000050
	movs r1, #1
	asrs r2, r2, #0xc
	blx FUN_020CF178
	pop {r4, pc}
_0224B9B2:
	ldr r2, [r4, #8]
	ldr r0, _0224B9C8 @ =0x04000050
	movs r1, #1
	asrs r2, r2, #0xc
	blx FUN_020CF178
	ldr r0, [r4]
	bl ov71_0224B970
	pop {r4, pc}
	nop
_0224B9C8: .4byte 0x04000050
	thumb_func_end ov71_0224B990

	thumb_func_start ov71_0224B9CC
ov71_0224B9CC: @ 0x0224B9CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x39
	movs r1, #0x44
	bl FUN_0201AA8C
	adds r4, r0, #0
	beq _0224BA3A
	movs r1, #0
	str r1, [r4, #4]
	str r6, [r4]
	ldr r0, [r5, #0x74]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x78]
	str r0, [r4, #0x14]
	str r5, [r4, #8]
	ldr r0, _0224BA40 @ =0x000018CC
	str r1, [r4, #0x18]
	str r0, [r4, #0x1c]
	movs r0, #0x14
	str r0, [r4, #0x20]
	movs r0, #1
	lsls r0, r0, #0xc
	strh r0, [r4, #0x3a]
	str r1, [r4, #0x40]
	ldr r0, [r4, #0x14]
	bl ov71_02247708
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl ov71_02247704
	adds r1, r4, #0
	ldr r0, [r4, #0x14]
	adds r1, #0x24
	bl ov71_022476B4
	adds r1, r4, #0
	ldr r0, [r4, #0x14]
	adds r1, #0x34
	bl ov71_022476D4
	ldr r0, _0224BA44 @ =ov71_0224BABC
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	str r0, [r6]
	cmp r0, #0
	bne _0224BA3E
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
_0224BA3A:
	movs r0, #0
	str r0, [r6]
_0224BA3E:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0224BA40: .4byte 0x000018CC
_0224BA44: .4byte ov71_0224BABC
	thumb_func_end ov71_0224B9CC

	thumb_func_start ov71_0224BA48
ov71_0224BA48: @ 0x0224BA48
	push {r4, lr}
	adds r4, r0, #0
	beq _0224BA62
	bl FUN_0201F988
	ldr r1, [r0]
	movs r2, #0
	str r2, [r1]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0200E390
_0224BA62:
	pop {r4, pc}
	thumb_func_end ov71_0224BA48

	thumb_func_start ov71_0224BA64
ov71_0224BA64: @ 0x0224BA64
	adds r1, r0, #0
	ldr r0, [r1, #0x40]
	cmp r0, #0
	beq _0224BA86
	movs r0, #0x3a
	ldrsh r2, [r1, r0]
	movs r0, #0x3c
	ldrsh r0, [r1, r0]
	adds r0, r2, r0
	strh r0, [r1, #0x3a]
	ldr r0, [r1, #0x40]
	subs r0, r0, #1
	str r0, [r1, #0x40]
	bne _0224BA86
	movs r0, #0x3e
	ldrsh r0, [r1, r0]
	strh r0, [r1, #0x3a]
_0224BA86:
	movs r0, #0x36
	ldrsh r2, [r1, r0]
	movs r0, #0x3a
	ldrsh r0, [r1, r0]
	ldr r3, _0224BA9C @ =ov71_022476EC
	adds r0, r2, r0
	strh r0, [r1, #0x36]
	ldr r0, [r1, #0x14]
	adds r1, #0x34
	bx r3
	nop
_0224BA9C: .4byte ov71_022476EC
	thumb_func_end ov71_0224BA64

	thumb_func_start ov71_0224BAA0
ov71_0224BAA0: @ 0x0224BAA0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	beq _0224BAB8
	movs r0, #0x3a
	ldrsh r0, [r5, r0]
	subs r0, r1, r0
	adds r1, r4, #0
	blx FUN_020F2998
	strh r0, [r5, #0x3c]
	str r4, [r5, #0x40]
_0224BAB8:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov71_0224BAA0

	thumb_func_start ov71_0224BABC
ov71_0224BABC: @ 0x0224BABC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov71_0224BA64
	ldr r0, [r4, #4]
	cmp r0, #5
	bhi _0224BBCA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224BADA: @ jump table
	.2byte _0224BAE6 - _0224BADA - 2 @ case 0
	.2byte _0224BB16 - _0224BADA - 2 @ case 1
	.2byte _0224BB2E - _0224BADA - 2 @ case 2
	.2byte _0224BB44 - _0224BADA - 2 @ case 3
	.2byte _0224BB8C - _0224BADA - 2 @ case 4
	.2byte _0224BBBA - _0224BADA - 2 @ case 5
_0224BAE6:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0224BB06
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x1c]
	adds r0, r1, r0
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x20]
	subs r0, r0, #1
	str r0, [r4, #0x20]
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x14]
	asrs r1, r1, #0xc
	bl ov71_02247708
	pop {r3, r4, r5, pc}
_0224BB06:
	ldr r0, [r4, #0x14]
	movs r1, #0x1f
	bl ov71_02247708
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0224BB16:
	movs r1, #6
	adds r0, r4, #0
	lsls r1, r1, #6
	movs r2, #0x1e
	bl ov71_0224BAA0
	movs r0, #0
	str r0, [r4, #0xc]
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0224BB2E:
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0xa
	ble _0224BBCA
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0224BB44:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x30]
	adds r0, r1, r0
	str r0, [r4, #0x28]
	movs r0, #0x1e
	ldr r1, [r4, #0x30]
	lsls r0, r0, #6
	subs r0, r1, r0
	str r0, [r4, #0x30]
	adds r1, r4, #0
	ldr r0, [r4, #0x14]
	adds r1, #0x24
	bl ov71_022476C4
	ldr r1, [r4, #0x28]
	ldr r0, _0224BBCC @ =0xFFFF5000
	cmp r1, r0
	bge _0224BBCA
	ldr r0, _0224BBD0 @ =0x000005E6
	bl FUN_0200604C
	movs r0, #0
	ldr r1, [r4, #0x30]
	mvns r0, r0
	muls r0, r1, r0
	str r0, [r4, #0x30]
	ldr r0, [r4, #8]
	movs r1, #0
	movs r2, #0x10
	movs r3, #8
	bl ov71_0224B910
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0224BB8C:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x30]
	adds r1, r1, r0
	movs r0, #0x13
	lsls r0, r0, #0xc
	str r1, [r4, #0x28]
	cmp r1, r0
	blt _0224BB9E
	str r0, [r4, #0x28]
_0224BB9E:
	adds r1, r4, #0
	ldr r0, [r4, #0x14]
	adds r1, #0x24
	bl ov71_022476C4
	movs r0, #0x13
	ldr r1, [r4, #0x28]
	lsls r0, r0, #0xc
	cmp r1, r0
	bne _0224BBCA
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0224BBBA:
	ldr r0, [r4, #8]
	bl ov71_0224B960
	cmp r0, #0
	beq _0224BBCA
	adds r0, r5, #0
	bl ov71_0224BA48
_0224BBCA:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224BBCC: .4byte 0xFFFF5000
_0224BBD0: .4byte 0x000005E6
	thumb_func_end ov71_0224BABC

	.rodata

_0224BBD4:
	.byte 0x90, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xC9, 0x78, 0x24, 0x02
	.byte 0x91, 0x79, 0x24, 0x02, 0x25, 0x79, 0x24, 0x02, 0x03, 0x00, 0x00, 0x00, 0xED, 0x82, 0x24, 0x02
	.byte 0xAD, 0x83, 0x24, 0x02, 0x59, 0x83, 0x24, 0x02, 0x03, 0x00, 0x00, 0x00, 0xA1, 0x94, 0x24, 0x02
	.byte 0x01, 0x95, 0x24, 0x02, 0xD1, 0x94, 0x24, 0x02, 0x03, 0x00, 0x00, 0x00, 0xF1, 0x9C, 0x24, 0x02
	.byte 0x29, 0x9D, 0x24, 0x02, 0x15, 0x9D, 0x24, 0x02, 0x01, 0x00, 0x00, 0x00, 0xF1, 0xA0, 0x24, 0x02
	.byte 0x5D, 0xA1, 0x24, 0x02, 0x2D, 0xA1, 0x24, 0x02, 0x05, 0x00, 0x00, 0x00, 0x21, 0xA9, 0x24, 0x02
	.byte 0x8D, 0xA9, 0x24, 0x02, 0x55, 0xA9, 0x24, 0x02, 0x05, 0x00, 0x00, 0x00, 0x39, 0xB1, 0x24, 0x02
	.byte 0xFD, 0xB1, 0x24, 0x02, 0x99, 0xB1, 0x24, 0x02, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0
	.byte 0x00, 0x00, 0x00, 0x00, 0x11, 0x7A, 0x24, 0x02, 0x35, 0x7C, 0x24, 0x02, 0x61, 0x7C, 0x24, 0x02
	.byte 0xED, 0x7D, 0x24, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x60, 0x00, 0xA0, 0x00, 0xE0, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x84, 0x24, 0x02
	.byte 0x3D, 0x84, 0x24, 0x02, 0x85, 0x84, 0x24, 0x02, 0x31, 0x85, 0x24, 0x02, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x01, 0x16, 0x00
	.byte 0x00, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x1E, 0x04, 0x00, 0x03, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x59, 0x95, 0x24, 0x02
	.byte 0xA1, 0x95, 0x24, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x1E, 0x00, 0x00, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x59, 0x9D, 0x24, 0x02, 0x81, 0x9D, 0x24, 0x02
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x1A, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x1C, 0x04
	.byte 0x00, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01, 0x00, 0x03, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x8D, 0xA1, 0x24, 0x02
	.byte 0xC5, 0xA1, 0x24, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x1E, 0x00, 0x00, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x60, 0x00, 0xA0, 0x00, 0xE0, 0x00
	.byte 0xF9, 0xA9, 0x24, 0x02, 0x29, 0xAA, 0x24, 0x02, 0xF9, 0xAA, 0x24, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x01, 0x16, 0x00
	.byte 0x00, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x1E, 0x04, 0x00, 0x03, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0
	.byte 0x00, 0x00, 0x00, 0x00, 0x81, 0xB2, 0x24, 0x02, 0x51, 0xB4, 0x24, 0x02, 0x7D, 0xB4, 0x24, 0x02
	.byte 0x7D, 0xB5, 0x24, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

	.data

_0224C020:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_0224C040:
	.space 0xa0
