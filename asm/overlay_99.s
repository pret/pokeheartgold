
	thumb_func_start ov99_021E5900
ov99_021E5900: @ 0x021E5900
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, _021E59F0 @ =0x00000062
	movs r1, #2
	bl FUN_02006FF8
	adds r0, r4, #0
	bl FUN_020072A4
	adds r5, r0, #0
	bne _021E591C
	bl FUN_0202551C
_021E591C:
	movs r0, #3
	movs r1, #0x84
	lsls r2, r0, #0x10
	bl FUN_0201A910
	adds r0, r4, #0
	movs r1, #0x94
	movs r2, #0x84
	bl FUN_02007280
	movs r1, #0
	movs r2, #0x94
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x84
	str r0, [r4, #0xc]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x8c
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x90
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x84
	str r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov99_021E5B54
	bl FUN_0221F090
	adds r0, r4, #0
	bl ov99_021E5C88
	adds r0, r4, #0
	bl ov99_021E5D58
	ldr r0, _021E59F4 @ =0x0000013A
	ldr r3, _021E59F8 @ =0x021E96D8
	str r0, [sp]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #4]
	movs r2, #0x11
	bl FUN_0221EABC
	add r3, sp, #4
	ldr r5, _021E59FC @ =0x021E95A4
	str r0, [r4, #0x10]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r1, r2, #0
	ldr r0, [r4, #0xc]
	movs r2, #0x1a
	bl FUN_0221E5E0
	str r0, [r4, #0x14]
	adds r0, r4, #0
	bl ov99_021E6274
	adds r0, r4, #0
	bl ov99_021E6438
	adds r0, r4, #0
	movs r1, #0
	bl ov99_021E64E0
	adds r0, r4, #0
	movs r1, #0
	bl ov99_021E5FE8
	adds r0, r4, #0
	movs r1, #0
	bl ov99_021E6050
	adds r0, r4, #0
	movs r1, #0
	bl ov99_021E6530
	adds r0, r4, #0
	bl ov99_021E6018
	movs r0, #2
	movs r1, #4
	bl FUN_0201A71C
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	ldr r0, _021E5A00 @ =ov99_021E6250
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #1
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
_021E59F0: .4byte 0x00000062
_021E59F4: .4byte 0x0000013A
_021E59F8: .4byte 0x021E96D8
_021E59FC: .4byte 0x021E95A4
_021E5A00: .4byte ov99_021E6250
	thumb_func_end ov99_021E5900

	thumb_func_start ov99_021E5A04
ov99_021E5A04: @ 0x021E5A04
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	ldr r0, [r4]
	bl ov99_021E5B74
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x84
	bl FUN_0201A9C4
	ldr r0, _021E5A34 @ =0x00000062
	bl FUN_02006F7C
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5A34: .4byte 0x00000062
	thumb_func_end ov99_021E5A04

	thumb_func_start ov99_021E5A38
ov99_021E5A38: @ 0x021E5A38
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov99_021E5F74
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #1
	bne _021E5A86
	adds r1, r4, #0
	adds r1, #0x88
	ldr r1, [r1]
	adds r0, r4, #0
	bl ov99_021E5FE8
	adds r1, r4, #0
	adds r1, #0x88
	ldr r1, [r1]
	adds r0, r4, #0
	bl ov99_021E6050
	adds r1, r4, #0
	adds r1, #0x88
	ldr r1, [r1]
	adds r0, r4, #0
	bl ov99_021E6530
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x90
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x8c
	str r1, [r0]
_021E5A86:
	ldr r0, [r5]
	cmp r0, #4
	bhi _021E5B36
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5A98: @ jump table
	.2byte _021E5AA2 - _021E5A98 - 2 @ case 0
	.2byte _021E5ABE - _021E5A98 - 2 @ case 1
	.2byte _021E5ACC - _021E5A98 - 2 @ case 2
	.2byte _021E5B04 - _021E5A98 - 2 @ case 3
	.2byte _021E5B12 - _021E5A98 - 2 @ case 4
_021E5AA2:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0xc]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	str r0, [r5]
	b _021E5B40
_021E5ABE:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5B40
	movs r0, #2
	str r0, [r5]
	b _021E5B40
_021E5ACC:
	adds r0, r4, #0
	bl ov99_021E6638
	cmp r0, #0
	beq _021E5B40
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	bne _021E5B40
	ldr r0, _021E5B4C @ =0x000005DC
	bl FUN_0200604C
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #3
	str r0, [r5]
	b _021E5B40
_021E5B04:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5B40
	movs r0, #4
	str r0, [r5]
	b _021E5B40
_021E5B12:
	ldr r0, [r4, #0x10]
	movs r1, #0x11
	bl FUN_0221EB84
	adds r0, r4, #0
	bl ov99_021E5D2C
	ldr r0, [r4, #0x14]
	adds r4, #0x18
	adds r1, r4, #0
	movs r2, #0x1a
	bl FUN_0221E684
	bl FUN_0221F0EC
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_021E5B36:
	ldr r0, _021E5B50 @ =0x021EA5C0
	cmp r0, #0
	beq _021E5B40
	bl FUN_0202551C
_021E5B40:
	ldr r0, [r4, #0x14]
	bl FUN_0221E6CC
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_021E5B4C: .4byte 0x000005DC
_021E5B50: .4byte 0x021EA5C0
	thumb_func_end ov99_021E5A38

	thumb_func_start ov99_021E5B54
ov99_021E5B54: @ 0x021E5B54
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r4, r1, #0
	movs r1, #8
	bl FUN_0201AA8C
	ldr r1, [r4]
	str r1, [r0]
	ldr r1, [r4, #4]
	str r1, [r0, #4]
	str r0, [r5]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov99_021E5B54

	thumb_func_start ov99_021E5B70
ov99_021E5B70: @ 0x021E5B70
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov99_021E5B70

	thumb_func_start ov99_021E5B74
ov99_021E5B74: @ 0x021E5B74
	ldr r3, _021E5B78 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_021E5B78: .4byte FUN_0201AB0C
	thumb_func_end ov99_021E5B74

	thumb_func_start ov99_021E5B7C
ov99_021E5B7C: @ 0x021E5B7C
	ldr r3, [r0]
	movs r0, #0x2c
	muls r0, r1, r0
	adds r1, r3, r0
	movs r0, #0xc
	adds r1, #8
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
	.align 2, 0
	thumb_func_end ov99_021E5B7C

	thumb_func_start ov99_021E5B90
ov99_021E5B90: @ 0x021E5B90
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _021E5B9E
	bl FUN_0202551C
_021E5B9E:
	cmp r4, #5
	blt _021E5BA6
	bl FUN_0202551C
_021E5BA6:
	movs r0, #0x2c
	ldr r1, [r5]
	muls r0, r4, r0
	adds r0, r1, r0
	ldrh r0, [r0, #6]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov99_021E5B90

	thumb_func_start ov99_021E5BB4
ov99_021E5BB4: @ 0x021E5BB4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _021E5BC2
	bl FUN_0202551C
_021E5BC2:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov99_021E5B90
	cmp r0, #0
	beq _021E5BD2
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5BD2:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov99_021E5BB4

	thumb_func_start ov99_021E5BD8
ov99_021E5BD8: @ 0x021E5BD8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r5, #0
	bne _021E5BE8
	bl FUN_0202551C
_021E5BE8:
	cmp r6, #3
	bne _021E5C12
	movs r0, #0x2c
	adds r3, r4, #0
	ldr r1, [r5]
	muls r3, r0, r3
	adds r0, r1, r3
	ldrh r2, [r0, #6]
	ldrh r1, [r1, r3]
	subs r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrh r1, [r0, #2]
	ldrh r0, [r0, #4]
	subs r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6, pc}
_021E5C12:
	movs r0, #0x2c
	ldr r2, [r5]
	muls r0, r4, r0
	lsls r1, r6, #1
	adds r0, r2, r0
	ldrh r0, [r1, r0]
	pop {r4, r5, r6, pc}
	thumb_func_end ov99_021E5BD8

	thumb_func_start ov99_021E5C20
ov99_021E5C20: @ 0x021E5C20
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	cmp r0, #0
	bne _021E5C2E
	bl FUN_0202551C
_021E5C2E:
	cmp r5, #0xa
	blt _021E5C36
	bl FUN_0202551C
_021E5C36:
	cmp r4, #4
	blo _021E5C3E
	bl FUN_0202551C
_021E5C3E:
	ldr r0, _021E5C48 @ =0x021E9600
	lsls r1, r5, #2
	adds r0, r0, r1
	ldrb r0, [r4, r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5C48: .4byte 0x021E9600
	thumb_func_end ov99_021E5C20

	thumb_func_start ov99_021E5C4C
ov99_021E5C4C: @ 0x021E5C4C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r5, #0
	bne _021E5C5C
	bl FUN_0202551C
_021E5C5C:
	cmp r6, #3
	blo _021E5C64
	bl FUN_0202551C
_021E5C64:
	cmp r4, #5
	blo _021E5C6C
	bl FUN_0202551C
_021E5C6C:
	movs r0, #0x2c
	ldr r1, [r5]
	muls r0, r4, r0
	adds r1, r1, r0
	movs r0, #0xc
	muls r0, r6, r0
	adds r0, r1, r0
	ldr r0, [r0, #8]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x17
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov99_021E5C4C

	thumb_func_start ov99_021E5C88
ov99_021E5C88: @ 0x021E5C88
	push {r4, r5, r6, r7, lr}
	sub sp, #0xf4
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_0201AC88
	add r3, sp, #4
	ldr r4, _021E5D18 @ =0x021E9564
	str r0, [r5, #4]
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r4, _021E5D1C @ =0x021E9760
	add r3, sp, #0x14
	movs r2, #0x1c
_021E5CB0:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5CB0
	ldr r4, _021E5D20 @ =_021E954C
	movs r7, #0
	add r6, sp, #0x14
_021E5CBE:
	ldrb r1, [r4]
	ldr r0, [r5, #4]
	adds r2, r6, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldrb r1, [r4]
	ldr r0, [r5, #4]
	bl FUN_0201CAE0
	ldrb r0, [r4]
	ldr r3, [r5, #0xc]
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	adds r7, r7, #1
	adds r6, #0x1c
	adds r4, r4, #1
	cmp r7, #8
	blt _021E5CBE
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E5D24 @ =0x04000050
	movs r1, #8
	movs r2, #4
	movs r3, #0xf
	blx FUN_020CF15C
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E5D28 @ =0x04001050
	movs r1, #8
	movs r2, #2
	movs r3, #0xf
	blx FUN_020CF15C
	ldr r1, [r5, #0xc]
	movs r0, #0xb1
	bl FUN_02007688
	str r0, [r5, #8]
	add sp, #0xf4
	pop {r4, r5, r6, r7, pc}
	nop
_021E5D18: .4byte 0x021E9564
_021E5D1C: .4byte 0x021E9760
_021E5D20: .4byte _021E954C
_021E5D24: .4byte 0x04000050
_021E5D28: .4byte 0x04001050
	thumb_func_end ov99_021E5C88

	thumb_func_start ov99_021E5D2C
ov99_021E5D2C: @ 0x021E5D2C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_0200770C
	ldr r6, _021E5D54 @ =_021E954C
	movs r4, #0
_021E5D3A:
	ldrb r1, [r6, r4]
	ldr r0, [r5, #4]
	bl FUN_0201BB4C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #8
	blo _021E5D3A
	ldr r0, [r5, #4]
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E5D54: .4byte _021E954C
	thumb_func_end ov99_021E5D2C

	thumb_func_start ov99_021E5D58
ov99_021E5D58: @ 0x021E5D58
	push {r4, lr}
	sub sp, #0x10
	movs r2, #0
	adds r4, r0, #0
	str r2, [sp]
	ldr r0, [r4, #0xc]
	movs r1, #0x1e
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x1f
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x3e
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #2
	bl FUN_02007B44
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r4, #0xc]
	movs r3, #0x1e
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	movs r1, #0x24
	movs r2, #0
	lsls r3, r3, #4
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x25
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x26
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #3
	bl FUN_02007B68
	movs r3, #0
	str r3, [sp]
	ldr r0, [r4, #0xc]
	movs r1, #0x21
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	movs r2, #4
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x22
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #4
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x23
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #4
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x44
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #5
	bl FUN_02007B44
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r4, #0xc]
	movs r3, #0x1e
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	movs r1, #0x27
	movs r2, #4
	lsls r3, r3, #4
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x28
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #7
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x29
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #7
	bl FUN_02007B68
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov99_021E5D58

	thumb_func_start ov99_021E5EB4
ov99_021E5EB4: @ 0x021E5EB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	beq _021E5EC6
	movs r6, #0xff
	mvns r6, r6
	b _021E5ECA
_021E5EC6:
	movs r6, #1
	lsls r6, r6, #8
_021E5ECA:
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #0xc]
	ldr r1, _021E5F68 @ =0x021E95D8
	str r0, [sp, #0xc]
	lsls r4, r4, #3
	ldr r0, [r5, #8]
	ldr r1, [r1, r4]
	ldr r2, [r5, #4]
	movs r3, #2
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #0xc]
	ldr r1, _021E5F6C @ =0x021E95DC
	str r0, [sp, #0xc]
	ldr r0, [r5, #8]
	ldr r1, [r1, r4]
	ldr r2, [r5, #4]
	movs r3, #5
	bl FUN_02007B68
	ldr r0, [r5, #4]
	movs r1, #2
	movs r2, #0
	adds r3, r6, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #4]
	movs r1, #5
	movs r2, #0
	adds r3, r6, #0
	bl FUN_0201BC8C
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	rsbs r0, r6, #0
	lsls r0, r0, #0x10
	ldr r7, _021E5F70 @ =0x021E9690
	movs r4, #0
	asrs r6, r0, #0x10
_021E5F46:
	movs r0, #0xc
	muls r0, r4, r0
	ldr r0, [r7, r0]
	adds r1, r6, #0
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	movs r2, #0
	bl FUN_0200DED0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	blo _021E5F46
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E5F68: .4byte 0x021E95D8
_021E5F6C: .4byte 0x021E95DC
_021E5F70: .4byte 0x021E9690
	thumb_func_end ov99_021E5EB4

	thumb_func_start ov99_021E5F74
ov99_021E5F74: @ 0x021E5F74
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _021E5FE0
	ldr r0, [r5, #4]
	movs r1, #2
	bl FUN_0201BDF4
	asrs r6, r0, #2
	cmp r0, r6
	bne _021E5F90
	movs r6, #0
_021E5F90:
	ldr r0, [r5, #4]
	movs r1, #2
	movs r2, #0
	adds r3, r6, #0
	bl FUN_0201F238
	ldr r0, [r5, #4]
	movs r1, #5
	movs r2, #0
	adds r3, r6, #0
	bl FUN_0201F238
	ldr r7, _021E5FE4 @ =0x021E9690
	movs r4, #0
_021E5FAC:
	movs r0, #0xc
	muls r0, r4, r0
	adds r2, r7, r0
	ldr r1, [r2, #4]
	ldr r0, [r7, r0]
	ldr r2, [r2, #8]
	lsls r0, r0, #2
	adds r0, r5, r0
	subs r1, r1, r6
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r0, #0x18]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	blo _021E5FAC
	cmp r6, #0
	bne _021E5FE0
	movs r0, #0
	adds r5, #0x8c
	str r0, [r5]
_021E5FE0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5FE4: .4byte 0x021E9690
	thumb_func_end ov99_021E5F74

	thumb_func_start ov99_021E5FE8
ov99_021E5FE8: @ 0x021E5FE8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	bl ov99_021E5BB4
	cmp r0, #0
	beq _021E6006
	adds r0, r5, #0
	adds r5, #0x84
	ldr r2, [r5]
	adds r1, r4, #0
	bl ov99_021E5EB4
	pop {r3, r4, r5, pc}
_021E6006:
	ldr r0, [r5, #4]
	movs r1, #2
	bl FUN_0201CAE0
	ldr r0, [r5, #4]
	movs r1, #5
	bl FUN_0201CAE0
	pop {r3, r4, r5, pc}
	thumb_func_end ov99_021E5FE8

	thumb_func_start ov99_021E6018
ov99_021E6018: @ 0x021E6018
	push {r4, lr}
	sub sp, #8
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	ldr r0, [r4, #0x10]
	movs r2, #2
	movs r3, #1
	bl FUN_0221EC08
	movs r2, #0
	str r2, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r3, #1
	bl FUN_0221EBEC
	ldr r0, [r4, #0x10]
	movs r1, #0xb
	movs r2, #7
	movs r3, #0
	bl FUN_0221EBD8
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov99_021E6018

	thumb_func_start ov99_021E6050
ov99_021E6050: @ 0x021E6050
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov99_021E6188
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov99_021E607C
	ldr r0, [r5]
	adds r1, r4, #0
	bl ov99_021E5BB4
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov99_021E6144
	adds r0, r5, #0
	bl ov99_021E6218
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov99_021E6050

	thumb_func_start ov99_021E607C
ov99_021E607C: @ 0x021E607C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	adds r7, r1, #0
	bl FUN_0221EEFC
	ldr r4, _021E6140 @ =0x021E958C
	str r0, [sp, #8]
	movs r6, #0
_021E6090:
	lsls r2, r6, #0x18
	ldr r0, [r5]
	adds r1, r7, #0
	lsrs r2, r2, #0x18
	bl ov99_021E5C20
	adds r2, r0, #0
	lsls r2, r2, #0x18
	ldr r0, [sp, #8]
	movs r1, #1
	lsrs r2, r2, #0x18
	bl FUN_0200C9C8
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	ldr r1, [r4]
	movs r2, #0xa
	adds r3, r6, #1
	bl FUN_0221ECD0
	ldr r0, [r5]
	adds r1, r7, #0
	bl ov99_021E5BB4
	cmp r0, #0
	beq _021E60EC
	lsls r2, r6, #0x10
	ldr r0, [r5]
	adds r1, r7, #0
	lsrs r2, r2, #0x10
	bl ov99_021E5BD8
	adds r3, r0, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	ldr r1, [r4, #4]
	movs r2, #8
	bl FUN_0221ECD0
	b _021E60F8
_021E60EC:
	ldr r0, [r5, #0x10]
	ldr r1, [r4, #4]
	movs r2, #9
	movs r3, #0
	bl FUN_0221EBD8
_021E60F8:
	adds r6, r6, #1
	adds r4, #8
	cmp r6, #3
	blt _021E6090
	ldr r0, [r5]
	adds r1, r7, #0
	bl ov99_021E5BB4
	cmp r0, #0
	beq _021E612E
	ldr r0, [r5]
	adds r1, r7, #0
	movs r2, #3
	bl ov99_021E5BD8
	adds r3, r0, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	movs r1, #0xc
	movs r2, #8
	bl FUN_0221ECD0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021E612E:
	ldr r0, [r5, #0x10]
	movs r1, #0xc
	movs r2, #9
	movs r3, #0
	bl FUN_0221EBD8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E6140: .4byte 0x021E958C
	thumb_func_end ov99_021E607C

	thumb_func_start ov99_021E6144
ov99_021E6144: @ 0x021E6144
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r5, [r6, #0x10]
	adds r7, r1, #0
	movs r4, #0
_021E614E:
	cmp r7, #0
	beq _021E6174
	adds r1, r6, #0
	adds r1, #0x88
	ldr r1, [r1]
	lsls r2, r4, #0x18
	lsls r1, r1, #0x18
	ldr r0, [r6]
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl ov99_021E5C4C
	adds r1, r4, #0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, #0xe
	bl FUN_0221EE28
	b _021E617E
_021E6174:
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0xe
	bl FUN_0221EE84
_021E617E:
	adds r4, r4, #1
	cmp r4, #3
	blt _021E614E
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov99_021E6144

	thumb_func_start ov99_021E6188
ov99_021E6188: @ 0x021E6188
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x10]
	adds r6, r1, #0
	adds r0, r4, #0
	bl FUN_0221EEFC
	lsls r2, r6, #0x18
	movs r1, #0
	lsrs r2, r2, #0x18
	adds r7, r0, #0
	bl FUN_0200C984
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	ldr r0, [r5, #0x10]
	movs r2, #4
	adds r3, r1, #0
	bl FUN_0221EC08
	lsls r2, r6, #0x18
	adds r0, r7, #0
	movs r1, #0
	lsrs r2, r2, #0x18
	bl FUN_0200C944
	movs r1, #3
	ldr r0, [r5, #0x10]
	adds r2, r1, #0
	movs r3, #1
	bl FUN_0221EBD8
	ldr r0, [r5]
	bl ov99_021E5B70
	cmp r0, #0
	beq _021E6216
	ldr r0, [r5]
	adds r1, r6, #0
	bl ov99_021E5B90
	bl FUN_0221EF64
	cmp r0, #0
	bne _021E61F2
	ldr r0, [r5, #0x10]
	movs r1, #4
	movs r2, #5
	movs r3, #1
	bl FUN_0221EBD8
	pop {r3, r4, r5, r6, r7, pc}
_021E61F2:
	cmp r0, #1
	bne _021E6204
	ldr r0, [r5, #0x10]
	movs r1, #4
	movs r2, #6
	movs r3, #1
	bl FUN_0221EBD8
	pop {r3, r4, r5, r6, r7, pc}
_021E6204:
	ldr r0, [r4, #4]
	movs r1, #0
	adds r0, #0x40
	bl FUN_0201D978
	ldr r0, [r4, #4]
	adds r0, #0x40
	bl FUN_0201D5C8
_021E6216:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov99_021E6188

	thumb_func_start ov99_021E6218
ov99_021E6218: @ 0x021E6218
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x88
	ldr r0, [r5]
	ldr r1, [r1]
	ldr r4, [r5, #0x10]
	bl ov99_021E5BB4
	cmp r0, #0
	beq _021E623C
	ldr r0, [r5, #0x10]
	movs r1, #0xd
	movs r2, #1
	movs r3, #0
	bl FUN_0221EBD8
	pop {r3, r4, r5, pc}
_021E623C:
	ldr r0, [r4, #4]
	movs r1, #0
	adds r0, #0xd0
	bl FUN_0201D978
	ldr r0, [r4, #4]
	adds r0, #0xd0
	bl FUN_0201D5C8
	pop {r3, r4, r5, pc}
	thumb_func_end ov99_021E6218

	thumb_func_start ov99_021E6250
ov99_021E6250: @ 0x021E6250
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200D034
	ldr r0, [r4, #4]
	bl FUN_0201EEB4
	ldr r3, _021E626C @ =0x027E0000
	ldr r1, _021E6270 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E626C: .4byte 0x027E0000
_021E6270: .4byte 0x00003FF8
	thumb_func_end ov99_021E6250

	thumb_func_start ov99_021E6274
ov99_021E6274: @ 0x021E6274
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	bl FUN_0221E5C0
	adds r4, r0, #0
	ldr r0, [r5, #0x14]
	bl FUN_0221E5D0
	adds r6, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x15
	bl FUN_0200D504
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x14
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x16
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x17
	bl FUN_0200D71C
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200D504
	movs r3, #0
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #2
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #3
	bl FUN_0200D71C
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #5
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #4
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #6
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #7
	bl FUN_0200D71C
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #9
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #8
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0xa
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0xb
	bl FUN_0200D71C
	adds r0, r5, #0
	bl ov99_021E6400
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x14]
	ldr r1, _021E63FC @ =0x021E9554
	movs r2, #3
	movs r3, #0
	bl FUN_0221E8A8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E63FC: .4byte 0x021E9554
	thumb_func_end ov99_021E6274

	thumb_func_start ov99_021E6400
ov99_021E6400: @ 0x021E6400
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	bl FUN_0221E5C0
	adds r6, r0, #0
	ldr r0, [r4, #0x14]
	bl FUN_0221E5D0
	ldr r7, _021E6434 @ =0x021E9650
	adds r5, r0, #0
	movs r4, #0
_021E6418:
	lsls r2, r4, #4
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, r2
	movs r3, #1
	bl FUN_0221E784
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _021E6418
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6434: .4byte 0x021E9650
	thumb_func_end ov99_021E6400

	thumb_func_start ov99_021E6438
ov99_021E6438: @ 0x021E6438
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r4, _021E64DC @ =0x021E9840
	movs r7, #0
	adds r5, r6, #0
_021E6442:
	ldr r0, [r6, #0x14]
	adds r1, r4, #0
	bl FUN_0221E6E0
	movs r1, #1
	str r0, [r5, #0x18]
	bl FUN_0200DC78
	adds r7, r7, #1
	adds r4, #0x34
	adds r5, r5, #4
	cmp r7, #0x1a
	blt _021E6442
	movs r5, #0
	adds r4, r6, #0
	movs r7, #0x1f
_021E6462:
	ldr r0, [r6]
	adds r1, r5, #0
	bl ov99_021E5BB4
	cmp r0, #0
	bne _021E6476
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_0200DCE8
_021E6476:
	ldr r0, [r6]
	adds r1, r5, #0
	bl ov99_021E5B90
	bl FUN_0221EF64
	cmp r0, #2
	bne _021E64A4
	lsrs r1, r5, #0x1f
	lsls r0, r5, #0x1f
	subs r0, r0, r1
	rors r0, r7
	adds r0, r1, r0
	ldr r0, [r4, #0x30]
	bne _021E649C
	movs r1, #5
	bl FUN_0200DC4C
	b _021E64D0
_021E649C:
	movs r1, #6
	bl FUN_0200DC4C
	b _021E64D0
_021E64A4:
	cmp r0, #1
	bne _021E64C8
	lsrs r2, r5, #0x1f
	lsls r1, r5, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	ldr r0, [r4, #0x30]
	bne _021E64C0
	movs r1, #2
	bl FUN_0200DC4C
	b _021E64D0
_021E64C0:
	movs r1, #3
	bl FUN_0200DC4C
	b _021E64D0
_021E64C8:
	ldr r0, [r4, #0x30]
	movs r1, #0
	bl FUN_0200DCE8
_021E64D0:
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #5
	blt _021E6462
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E64DC: .4byte 0x021E9840
	thumb_func_end ov99_021E6438

	thumb_func_start ov99_021E64E0
ov99_021E64E0: @ 0x021E64E0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x50]
	adds r4, r1, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x54]
	adds r1, r4, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x58]
	adds r1, r4, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x44]
	adds r1, r4, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x48]
	adds r1, r4, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x4c]
	adds r1, r4, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x5c]
	adds r1, r4, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x60]
	adds r1, r4, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x64]
	adds r1, r4, #0
	bl FUN_0200DCE8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov99_021E64E0

	thumb_func_start ov99_021E6530
ov99_021E6530: @ 0x021E6530
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5]
	adds r7, r1, #0
	bl ov99_021E5B90
	str r0, [sp, #8]
	movs r4, #0
_021E6542:
	ldr r0, [r5]
	adds r1, r7, #0
	bl ov99_021E5BB4
	cmp r0, #1
	bne _021E658C
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [sp, #8]
	lsrs r1, r1, #0x18
	bl FUN_0221F120
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r4, #2
	adds r6, r5, r0
	ldr r0, [r6, #0x68]
	ldr r1, [sp, #4]
	bl FUN_0200DC4C
	ldr r1, [sp, #4]
	ldr r0, [r6, #0x50]
	lsls r2, r1, #2
	ldr r1, _021E6634 @ =0x021E9628
	ldr r1, [r1, r2]
	bl FUN_0200DC4C
	ldr r0, [r6, #0x50]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, [r6, #0x68]
	movs r1, #1
	bl FUN_0200DCE8
	b _021E65A0
_021E658C:
	lsls r0, r4, #2
	adds r6, r5, r0
	ldr r0, [r6, #0x50]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r6, #0x68]
	movs r1, #0
	bl FUN_0200DCE8
_021E65A0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _021E6542
	movs r4, #0
_021E65AC:
	ldr r0, [r5]
	adds r1, r7, #0
	adds r2, r4, #0
	bl ov99_021E5B7C
	str r0, [sp, #0xc]
	ldr r0, [r5]
	adds r1, r7, #0
	bl ov99_021E5BB4
	cmp r0, #1
	bne _021E65FA
	lsls r0, r4, #2
	adds r6, r5, r0
	ldr r0, [r5, #0xc]
	ldr r1, [sp, #0xc]
	str r0, [sp]
	ldr r0, [r6, #0x44]
	movs r2, #1
	movs r3, #0
	bl FUN_0221E7E8
	ldr r0, [r6, #0x44]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x14]
	ldr r1, [r6, #0x74]
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl FUN_0221E970
	ldr r0, [r6, #0x74]
	movs r1, #1
	bl FUN_0200DCE8
	b _021E6606
_021E65FA:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x74]
	movs r1, #0
	bl FUN_0200DCE8
_021E6606:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _021E65AC
	movs r4, #0
_021E6612:
	ldr r0, [r5]
	adds r1, r7, #0
	bl ov99_021E5BB4
	adds r1, r0, #0
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x5c]
	bl FUN_0200DCE8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _021E6612
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6634: .4byte 0x021E9628
	thumb_func_end ov99_021E6530

	thumb_func_start ov99_021E6638
ov99_021E6638: @ 0x021E6638
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _021E6764 @ =0x021D110C
	movs r1, #0
	adds r5, r0, #0
	str r1, [sp]
	adds r4, r5, #0
	movs r0, #0x80
	ldr r1, [r2, #0x48]
	movs r3, #2
	adds r4, #0x80
	ldrsb r6, [r5, r0]
	tst r3, r1
	beq _021E6656
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6656:
	ldr r3, _021E6768 @ =0x021D114C
	ldrh r3, [r3, #0x24]
	cmp r3, #0
	beq _021E669E
	ldr r0, _021E676C @ =0x021E95BC
	bl FUN_0202529C
	adds r7, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r7, r0
	beq _021E66EE
	cmp r7, #5
	bne _021E6678
	movs r0, #1
	str r0, [sp]
	b _021E669A
_021E6678:
	movs r1, #0
	ldrsb r0, [r4, r1]
	cmp r0, r7
	bge _021E6682
	movs r1, #1
_021E6682:
	str r1, [r4, #4]
	ldr r0, [r5, #0x18]
	movs r1, #9
	bl FUN_0200DC4C
	ldr r0, [r5, #0x18]
	movs r1, #1
	bl FUN_0200DC78
	ldr r0, _021E6770 @ =0x000005DC
	bl FUN_0200604C
_021E669A:
	strb r7, [r4]
	b _021E66EE
_021E669E:
	ldr r2, [r2, #0x4c]
	movs r3, #0x10
	tst r3, r2
	bne _021E66AA
	tst r0, r2
	beq _021E66C2
_021E66AA:
	cmp r6, #5
	bge _021E66EE
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r0, #1
	strb r0, [r4]
	movs r0, #1
	str r0, [r4, #4]
	ldr r0, _021E6770 @ =0x000005DC
	bl FUN_0200604C
	b _021E66EE
_021E66C2:
	movs r0, #0x20
	tst r0, r2
	bne _021E66CE
	movs r0, #0x40
	tst r0, r2
	beq _021E66E4
_021E66CE:
	cmp r6, #0
	ble _021E66EE
	movs r0, #0
	ldrsb r1, [r4, r0]
	subs r1, r1, #1
	strb r1, [r4]
	str r0, [r4, #4]
	ldr r0, _021E6770 @ =0x000005DC
	bl FUN_0200604C
	b _021E66EE
_021E66E4:
	movs r0, #1
	tst r1, r0
	beq _021E66EE
	cmp r6, #5
	beq _021E6760
_021E66EE:
	movs r0, #0
	ldrsb r1, [r4, r0]
	cmp r1, #5
	ble _021E66FA
	movs r1, #5
	b _021E6700
_021E66FA:
	cmp r1, #0
	bge _021E6700
	adds r1, r0, #0
_021E6700:
	strb r1, [r4]
	movs r1, #0
	adds r0, r5, #0
	ldrsb r2, [r4, r1]
	adds r0, #0x88
	str r2, [r0]
	ldrsb r0, [r4, r1]
	cmp r6, r0
	beq _021E675E
	ldr r1, _021E6774 @ =0x021E9574
	lsls r2, r0, #2
	ldr r3, _021E6778 @ =0x021E9576
	ldrsh r1, [r1, r2]
	ldrsh r2, [r3, r2]
	ldr r0, [r5, #0x18]
	bl FUN_0200DDB8
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #5
	ldr r0, [r5, #0x18]
	bne _021E6734
	movs r1, #0xc
	bl FUN_0200DC4C
	b _021E675E
_021E6734:
	bl FUN_0200DC64
	cmp r0, #9
	beq _021E6744
	ldr r0, [r5, #0x18]
	movs r1, #8
	bl FUN_0200DC4C
_021E6744:
	cmp r6, #5
	bne _021E6750
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #4
	beq _021E675E
_021E6750:
	adds r0, r5, #0
	movs r1, #0
	bl ov99_021E64E0
	movs r0, #1
	adds r5, #0x90
	str r0, [r5]
_021E675E:
	ldr r0, [sp]
_021E6760:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6764: .4byte 0x021D110C
_021E6768: .4byte 0x021D114C
_021E676C: .4byte 0x021E95BC
_021E6770: .4byte 0x000005DC
_021E6774: .4byte 0x021E9574
_021E6778: .4byte 0x021E9576
	thumb_func_end ov99_021E6638

	thumb_func_start ov99_021E677C
ov99_021E677C: @ 0x021E677C
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, _021E682C @ =0x00000062
	movs r1, #2
	bl FUN_02006FF8
	adds r0, r4, #0
	bl FUN_020072A4
	adds r5, r0, #0
	bne _021E6798
	bl FUN_0202551C
_021E6798:
	movs r0, #3
	movs r1, #0x84
	lsls r2, r0, #0x10
	bl FUN_0201A910
	movs r1, #0x49
	adds r0, r4, #0
	lsls r1, r1, #2
	movs r2, #0x84
	bl FUN_02007280
	movs r2, #0x49
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x84
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov99_021E6FD0
	bl FUN_0221F090
	adds r0, r4, #0
	bl ov99_021E695C
	adds r0, r4, #0
	bl ov99_021E69D8
	ldr r0, _021E6830 @ =0x0000013A
	ldr r3, _021E6834 @ =0x021E9ED0
	str r0, [sp]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #4]
	movs r2, #0xf
	bl FUN_0221EABC
	add r3, sp, #4
	ldr r5, _021E6838 @ =0x021E9DEC
	str r0, [r4, #0x10]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r1, r2, #0
	ldr r0, [r4, #0xc]
	movs r2, #0x43
	bl FUN_0221E5E0
	str r0, [r4, #0x14]
	adds r0, r4, #0
	bl ov99_021E6A9C
	adds r0, r4, #0
	bl ov99_021E6D34
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	ldr r0, _021E683C @ =ov99_021E6938
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #1
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
_021E682C: .4byte 0x00000062
_021E6830: .4byte 0x0000013A
_021E6834: .4byte 0x021E9ED0
_021E6838: .4byte 0x021E9DEC
_021E683C: .4byte ov99_021E6938
	thumb_func_end ov99_021E677C

	thumb_func_start ov99_021E6840
ov99_021E6840: @ 0x021E6840
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r4]
	bl ov99_021E7060
	adds r1, r4, #0
	ldr r0, [r4, #0x14]
	adds r1, #0x18
	movs r2, #0x43
	bl FUN_0221E684
	ldr r0, [r4, #0x10]
	movs r1, #0xf
	bl FUN_0221EB84
	adds r0, r4, #0
	bl ov99_021E6A70
	bl FUN_0221F0EC
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x84
	bl FUN_0201A9C4
	ldr r0, _021E6884 @ =0x00000062
	bl FUN_02006F7C
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6884: .4byte 0x00000062
	thumb_func_end ov99_021E6840

	thumb_func_start ov99_021E6888
ov99_021E6888: @ 0x021E6888
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	bl FUN_02007290
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #4
	bhi _021E691A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E68A6: @ jump table
	.2byte _021E68B0 - _021E68A6 - 2 @ case 0
	.2byte _021E68CC - _021E68A6 - 2 @ case 1
	.2byte _021E68DA - _021E68A6 - 2 @ case 2
	.2byte _021E6906 - _021E68A6 - 2 @ case 3
	.2byte _021E6914 - _021E68A6 - 2 @ case 4
_021E68B0:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	str r0, [r4]
	b _021E6924
_021E68CC:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E6924
	movs r0, #2
	str r0, [r4]
	b _021E6924
_021E68DA:
	bl FUN_0221EF24
	cmp r0, #0
	beq _021E6924
	ldr r0, _021E6930 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #3
	str r0, [r4]
	b _021E6924
_021E6906:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E6924
	movs r0, #4
	str r0, [r4]
	b _021E6924
_021E6914:
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_021E691A:
	ldr r0, _021E6934 @ =0x021EA5CC
	cmp r0, #0
	beq _021E6924
	bl FUN_0202551C
_021E6924:
	ldr r0, [r5, #0x14]
	bl FUN_0221E6CC
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_021E6930: .4byte 0x000005DC
_021E6934: .4byte 0x021EA5CC
	thumb_func_end ov99_021E6888

	thumb_func_start ov99_021E6938
ov99_021E6938: @ 0x021E6938
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200D034
	ldr r0, [r4, #4]
	bl FUN_0201EEB4
	ldr r3, _021E6954 @ =0x027E0000
	ldr r1, _021E6958 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E6954: .4byte 0x027E0000
_021E6958: .4byte 0x00003FF8
	thumb_func_end ov99_021E6938

	thumb_func_start ov99_021E695C
ov99_021E695C: @ 0x021E695C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x80
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_0201AC88
	add r3, sp, #0
	ldr r4, _021E69CC @ =0x021E9D9C
	str r0, [r5, #4]
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r4, _021E69D0 @ =0x021E9E60
	add r3, sp, #0x10
	movs r2, #0xe
_021E6984:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6984
	ldr r4, _021E69D4 @ =0x021E9D88
	movs r7, #0
	add r6, sp, #0x10
_021E6992:
	ldrb r1, [r4]
	ldr r0, [r5, #4]
	adds r2, r6, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldrb r1, [r4]
	ldr r0, [r5, #4]
	bl FUN_0201CAE0
	ldrb r0, [r4]
	ldr r3, [r5, #0xc]
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	adds r7, r7, #1
	adds r6, #0x1c
	adds r4, r4, #1
	cmp r7, #4
	blt _021E6992
	ldr r1, [r5, #0xc]
	movs r0, #0xb1
	bl FUN_02007688
	str r0, [r5, #8]
	add sp, #0x80
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E69CC: .4byte 0x021E9D9C
_021E69D0: .4byte 0x021E9E60
_021E69D4: .4byte 0x021E9D88
	thumb_func_end ov99_021E695C

	thumb_func_start ov99_021E69D8
ov99_021E69D8: @ 0x021E69D8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x40
	str r0, [sp]
	ldr r0, [r4, #0xc]
	movs r2, #0
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	movs r1, #0x38
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x39
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	bl FUN_02007B44
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x3a
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	bl FUN_02007B68
	movs r0, #0x40
	str r0, [sp]
	ldr r0, [r4, #0xc]
	movs r1, #0x3b
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x3c
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #4
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x3d
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #4
	bl FUN_02007B68
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov99_021E69D8

	thumb_func_start ov99_021E6A70
ov99_021E6A70: @ 0x021E6A70
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_0200770C
	ldr r6, _021E6A98 @ =0x021E9D88
	movs r4, #0
_021E6A7E:
	ldrb r1, [r6, r4]
	ldr r0, [r5, #4]
	bl FUN_0201BB4C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _021E6A7E
	ldr r0, [r5, #4]
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E6A98: .4byte 0x021E9D88
	thumb_func_end ov99_021E6A70

	thumb_func_start ov99_021E6A9C
ov99_021E6A9C: @ 0x021E6A9C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	bl FUN_0221E5C0
	adds r4, r0, #0
	ldr r0, [r5, #0x14]
	bl FUN_0221E5D0
	adds r6, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x11
	bl FUN_0200D504
	movs r1, #0
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x10
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x12
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x13
	bl FUN_0200D71C
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #9
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #8
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #9
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #8
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0xa
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0xb
	bl FUN_0200D71C
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200D504
	movs r3, #0
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200D5D4
	movs r3, #1
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200D504
	movs r3, #0
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	movs r3, #2
	str r3, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #3
	bl FUN_0200D71C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov99_021E6A9C

	thumb_func_start ov99_021E6C14
ov99_021E6C14: @ 0x021E6C14
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	ldr r1, _021E6C2C @ =0x021E9E2C
	bl FUN_0221E6E0
	movs r1, #1
	str r0, [r4, #0x18]
	bl FUN_0200DC78
	pop {r4, pc}
	nop
_021E6C2C: .4byte 0x021E9E2C
	thumb_func_end ov99_021E6C14

	thumb_func_start ov99_021E6C30
ov99_021E6C30: @ 0x021E6C30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r0, [sp]
	ldr r0, [sp, #0x64]
	adds r5, r2, #0
	str r0, [sp, #0x64]
	ldr r0, [sp, #0x6c]
	str r1, [sp, #4]
	str r0, [sp, #0x6c]
	movs r0, #0
	add r2, sp, #0x14
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	str r0, [r2]
	ldr r0, [sp, #4]
	adds r7, r3, #0
	bl FUN_0221F150
	movs r4, #0
	cmp r7, #0
	bls _021E6CE6
	add r1, sp, #0x50
	ldrb r2, [r1, #0x18]
	subs r0, r7, r0
	lsls r3, r5, #2
	str r2, [sp, #8]
	ldr r2, [sp]
	adds r6, r4, #0
	adds r5, r2, r3
	movs r2, #0x10
	ldrsh r1, [r1, r2]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
_021E6C7C:
	subs r1, r7, r4
	lsls r1, r1, #0x18
	ldr r0, [sp, #4]
	lsrs r1, r1, #0x18
	bl FUN_0221F120
	add r1, sp, #0x14
	strh r0, [r1, #6]
	ldr r0, [sp, #0x6c]
	cmp r0, #0
	beq _021E6C96
	ldr r0, _021E6CEC @ =0x021E9DBC
	b _021E6C98
_021E6C96:
	ldr r0, _021E6CF0 @ =0x021E9DD4
_021E6C98:
	add r1, sp, #0x28
	movs r2, #0x18
	blx FUN_020D4A50
	ldr r0, [sp, #0x6c]
	cmp r0, #0
	beq _021E6CAA
	movs r0, #1
	b _021E6CAC
_021E6CAA:
	movs r0, #2
_021E6CAC:
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x10]
	adds r1, r0, r6
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x64]
	strh r1, [r0, #2]
	ldr r0, [sp]
	add r1, sp, #0x14
	ldr r0, [r0, #0x14]
	bl FUN_0221E6E0
	movs r1, #1
	str r0, [r5, #0x18]
	bl FUN_0200DC78
	ldr r0, [sp, #0xc]
	cmp r0, r4
	bls _021E6CDA
	ldr r0, [r5, #0x18]
	movs r1, #0
	bl FUN_0200DCE8
_021E6CDA:
	ldr r0, [sp, #8]
	adds r4, r4, #1
	adds r6, r6, r0
	adds r5, r5, #4
	cmp r4, r7
	blo _021E6C7C
_021E6CE6:
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6CEC: .4byte 0x021E9DBC
_021E6CF0: .4byte 0x021E9DD4
	thumb_func_end ov99_021E6C30

	thumb_func_start ov99_021E6CF4
ov99_021E6CF4: @ 0x021E6CF4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x28
	bls _021E6D02
	bl FUN_0202551C
_021E6D02:
	lsrs r2, r4, #1
	ldr r0, [r5, #0x10]
	movs r1, #6
	adds r2, #0x21
	movs r3, #0
	bl FUN_0221EBD8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov99_021E6CF4

	thumb_func_start ov99_021E6D14
ov99_021E6D14: @ 0x021E6D14
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0xa
	bls _021E6D22
	bl FUN_0202551C
_021E6D22:
	adds r4, #0x11
	ldr r0, [r5, #0x10]
	movs r1, #9
	adds r2, r4, #0
	movs r3, #0
	bl FUN_0221EBD8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov99_021E6D14

	thumb_func_start ov99_021E6D34
ov99_021E6D34: @ 0x021E6D34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r5, r0, #0
	ldr r0, [r5]
	bl ov99_021E70C8
	str r0, [sp, #0x1c]
	ldr r0, [r5]
	bl ov99_021E70B8
	str r0, [sp, #0x20]
	ldr r0, [r5]
	bl ov99_021E70A8
	str r0, [sp, #0x24]
	ldr r0, [r5]
	bl ov99_021E70D8
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl ov99_021E7088
	str r0, [sp, #0x28]
	adds r0, r5, #0
	bl ov99_021E7124
	str r0, [sp, #0x14]
	ldr r0, [r5]
	bl ov99_021E7078
	bl FUN_0221EF80
	str r0, [sp, #0x10]
	ldr r0, [r5]
	bl ov99_021E7068
	adds r7, r0, #0
	ldr r0, [sp, #0x18]
	bl ov99_021E7100
	adds r4, r0, #0
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r0, r1, r0
	adds r0, r7, r0
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r5, #0x10]
	bl FUN_0221EEFC
	str r0, [sp, #0x2c]
	ldr r0, [r5]
	bl ov99_021E7098
	adds r2, r0, #0
	ldr r0, [sp, #0x2c]
	movs r1, #0
	bl FUN_0200BE48
	movs r1, #0
	str r1, [sp]
	ldr r0, [r5, #0x10]
	movs r2, #0xb
	movs r3, #1
	bl FUN_0221EC08
	ldr r0, [r5, #0x10]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl FUN_0221EBD8
	ldr r0, [r5, #0x10]
	movs r1, #2
	movs r2, #0xd
	movs r3, #0
	bl FUN_0221EBD8
	ldr r0, [r5, #0x10]
	movs r1, #3
	movs r2, #0xe
	movs r3, #0
	bl FUN_0221EBD8
	ldr r0, [r5, #0x10]
	movs r1, #4
	movs r2, #0xf
	movs r3, #0
	bl FUN_0221EBD8
	movs r0, #0
	str r0, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #5
	movs r2, #0x20
	movs r3, #2
	bl FUN_0221EC08
	movs r2, #0
	str r2, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	movs r1, #7
	movs r3, #1
	bl FUN_0221EBEC
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov99_021E6CF4
	ldr r0, [r5, #0x10]
	movs r1, #8
	movs r2, #0x10
	movs r3, #0
	bl FUN_0221EBD8
	ldr r0, [r5, #0x10]
	movs r1, #0xd
	movs r2, #0x1f
	movs r3, #0
	bl FUN_0221EBD8
	ldr r0, [r5, #0x10]
	movs r1, #0xe
	movs r2, #1
	movs r3, #0
	bl FUN_0221EBD8
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	ldr r3, [sp, #0x1c]
	movs r1, #0xa
	movs r2, #0x1c
	bl FUN_0221ECD0
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	ldr r3, [sp, #0x20]
	movs r1, #0xb
	movs r2, #0x1d
	bl FUN_0221ECD0
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	ldr r3, [sp, #0x24]
	movs r1, #0xc
	movs r2, #0x1e
	bl FUN_0221ECD0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov99_021E6D14
	adds r0, r5, #0
	bl ov99_021E6C14
	ldr r0, [sp, #0x28]
	cmp r0, #1
	bne _021E6E98
	ldr r0, [r5, #0x18]
	movs r1, #1
	bl FUN_0200DC4C
	ldr r0, [r5, #0x18]
	movs r1, #1
	bl FUN_0200DD10
_021E6E98:
	movs r0, #0xc8
	str r0, [sp]
	movs r0, #0x70
	str r0, [sp, #4]
	movs r0, #0x20
	str r0, [sp, #8]
	movs r2, #1
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #2
	str r2, [sp, #0xc]
	bl ov99_021E6C30
	movs r0, #0x50
	str r0, [sp]
	movs r0, #0xa0
	str r0, [sp, #4]
	movs r0, #0x20
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x18]
	adds r0, r5, #0
	movs r2, #3
	movs r3, #4
	bl ov99_021E6C30
	movs r0, #7
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x28
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r1, r5, #0
	ldr r0, [r5, #0x14]
	ldr r2, _021E6F68 @ =0x021E9DAC
	ldr r3, [sp, #0x14]
	adds r1, #0x18
	bl FUN_0221E6F0
	movs r0, #0x11
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x48
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r1, r5, #0
	ldr r0, [r5, #0x14]
	ldr r2, _021E6F68 @ =0x021E9DAC
	ldr r3, [sp, #0x10]
	adds r1, #0x18
	bl FUN_0221E6F0
	movs r0, #0x1b
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x68
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r1, r5, #0
	ldr r0, [r5, #0x14]
	ldr r2, _021E6F68 @ =0x021E9DAC
	adds r1, #0x18
	adds r3, r7, #0
	bl FUN_0221E6F0
	movs r0, #0x25
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x88
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r1, r5, #0
	ldr r0, [r5, #0x14]
	ldr r2, _021E6F68 @ =0x021E9DAC
	adds r1, #0x18
	adds r3, r4, #0
	bl FUN_0221E6F0
	movs r0, #0x39
	str r0, [sp]
	movs r0, #0x60
	str r0, [sp, #4]
	movs r0, #0x78
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	adds r5, #0x18
	ldr r2, _021E6F6C @ =0x021E9D8C
	adds r1, r5, #0
	adds r3, r4, #0
	bl FUN_0221E6F0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6F68: .4byte 0x021E9DAC
_021E6F6C: .4byte 0x021E9D8C
	thumb_func_end ov99_021E6D34

	thumb_func_start ov99_021E6F70
ov99_021E6F70: @ 0x021E6F70
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _021E6F9C @ =0x00000000
	bne _021E6F7C
	bl FUN_0202551C
_021E6F7C:
	adds r0, r5, #0
	bl FUN_02031990
	movs r2, #0
_021E6F84:
	lsls r1, r2, #1
	ldrh r1, [r0, r1]
	adds r1, r4, r1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r2, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	cmp r2, #0xa
	blo _021E6F84
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6F9C: .4byte 0x00000000
	thumb_func_end ov99_021E6F70

	thumb_func_start ov99_021E6FA0
ov99_021E6FA0: @ 0x021E6FA0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r5, _021E6FC8 @ =0x00000000
	bne _021E6FAC
	bl FUN_0202551C
_021E6FAC:
	ldr r7, _021E6FCC @ =0x000001ED
	movs r4, #0
_021E6FB0:
	ldrb r0, [r6, r4]
	blx FUN_020E3714
	adds r0, r5, r0
	lsls r0, r0, #0x10
	adds r4, r4, #1
	lsrs r5, r0, #0x10
	cmp r4, r7
	blt _021E6FB0
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6FC8: .4byte 0x00000000
_021E6FCC: .4byte 0x000001ED
	thumb_func_end ov99_021E6FA0

	thumb_func_start ov99_021E6FD0
ov99_021E6FD0: @ 0x021E6FD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #0xc]
	adds r5, r1, #0
	movs r1, #0x1c
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x1c
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [r5, #4]
	ldr r6, [r5]
	str r0, [sp, #8]
	adds r0, r6, #0
	bl FUN_02031974
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_0203197C
	str r0, [sp, #4]
	adds r0, r6, #0
	bl FUN_02031978
	str r0, [sp]
	movs r2, #0
	adds r3, r4, #0
_021E700C:
	ldrh r1, [r5, #6]
	adds r2, r2, #1
	adds r5, #0x2c
	strh r1, [r3, #0xc]
	ldrh r0, [r4, #4]
	adds r3, r3, #2
	adds r0, r0, r1
	strh r0, [r4, #4]
	cmp r2, #5
	blt _021E700C
	ldr r0, [sp, #8]
	str r0, [r4]
	adds r0, r6, #0
	bl ov99_021E6F70
	strh r0, [r4, #6]
	ldr r0, [sp]
	bl ov99_021E6FA0
	strh r0, [r4, #0xa]
	ldr r0, [sp]
	bl FUN_0221F024
	strb r0, [r4, #0x16]
	ldr r0, [sp, #4]
	bl FUN_0221F058
	strb r0, [r4, #0x17]
	ldrh r1, [r4, #4]
	ldrh r0, [r4, #6]
	ldrh r2, [r4, #0xa]
	adds r0, r1, r0
	adds r0, r2, r0
	strh r0, [r4, #8]
	ldr r0, [sp, #8]
	bl FUN_02028F94
	strb r0, [r4, #0x18]
	str r4, [r7]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov99_021E6FD0

	thumb_func_start ov99_021E7060
ov99_021E7060: @ 0x021E7060
	ldr r3, _021E7064 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_021E7064: .4byte FUN_0201AB0C
	thumb_func_end ov99_021E7060

	thumb_func_start ov99_021E7068
ov99_021E7068: @ 0x021E7068
	push {r4, lr}
	adds r4, r0, #0
	bne _021E7072
	bl FUN_0202551C
_021E7072:
	ldrb r0, [r4, #0x17]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov99_021E7068

	thumb_func_start ov99_021E7078
ov99_021E7078: @ 0x021E7078
	push {r4, lr}
	adds r4, r0, #0
	bne _021E7082
	bl FUN_0202551C
_021E7082:
	ldrb r0, [r4, #0x16]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov99_021E7078

	thumb_func_start ov99_021E7088
ov99_021E7088: @ 0x021E7088
	push {r4, lr}
	adds r4, r0, #0
	bne _021E7092
	bl FUN_0202551C
_021E7092:
	ldrb r0, [r4, #0x18]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov99_021E7088

	thumb_func_start ov99_021E7098
ov99_021E7098: @ 0x021E7098
	push {r4, lr}
	adds r4, r0, #0
	bne _021E70A2
	bl FUN_0202551C
_021E70A2:
	ldr r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov99_021E7098

	thumb_func_start ov99_021E70A8
ov99_021E70A8: @ 0x021E70A8
	push {r4, lr}
	adds r4, r0, #0
	bne _021E70B2
	bl FUN_0202551C
_021E70B2:
	ldrh r0, [r4, #0xa]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov99_021E70A8

	thumb_func_start ov99_021E70B8
ov99_021E70B8: @ 0x021E70B8
	push {r4, lr}
	adds r4, r0, #0
	bne _021E70C2
	bl FUN_0202551C
_021E70C2:
	ldrh r0, [r4, #6]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov99_021E70B8

	thumb_func_start ov99_021E70C8
ov99_021E70C8: @ 0x021E70C8
	push {r4, lr}
	adds r4, r0, #0
	bne _021E70D2
	bl FUN_0202551C
_021E70D2:
	ldrh r0, [r4, #4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov99_021E70C8

	thumb_func_start ov99_021E70D8
ov99_021E70D8: @ 0x021E70D8
	push {r4, lr}
	adds r4, r0, #0
	bne _021E70E2
	bl FUN_0202551C
_021E70E2:
	ldrh r0, [r4, #8]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov99_021E70D8

	thumb_func_start ov99_021E70E8
ov99_021E70E8: @ 0x021E70E8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _021E70F6
	bl FUN_0202551C
_021E70F6:
	lsls r0, r5, #1
	adds r0, r4, r0
	ldrh r0, [r0, #0xc]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov99_021E70E8

	thumb_func_start ov99_021E7100
ov99_021E7100: @ 0x021E7100
	ldr r2, _021E7120 @ =0x021E9E04
	movs r3, #0
_021E7104:
	lsls r1, r3, #2
	ldr r1, [r2, r1]
	cmp r1, r0
	ble _021E7116
	adds r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #0xa
	blo _021E7104
_021E7116:
	movs r0, #0xa
	subs r0, r0, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_021E7120: .4byte 0x021E9E04
	thumb_func_end ov99_021E7100

	thumb_func_start ov99_021E7124
ov99_021E7124: @ 0x021E7124
	push {r4, r5, r6, lr}
	movs r5, #0
	adds r6, r0, #0
	adds r4, r5, #0
_021E712C:
	lsls r1, r4, #0x18
	ldr r0, [r6]
	lsrs r1, r1, #0x18
	bl ov99_021E70E8
	bl FUN_0221EF64
	adds r0, r5, r0
	lsls r0, r0, #0x18
	adds r4, r4, #1
	lsrs r5, r0, #0x18
	cmp r4, #5
	blt _021E712C
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov99_021E7124

	thumb_func_start ov99_021E714C
ov99_021E714C: @ 0x021E714C
	movs r0, #1
	bx lr
	thumb_func_end ov99_021E714C

	thumb_func_start ov99_021E7150
ov99_021E7150: @ 0x021E7150
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #0xc]
	bx lr
	.align 2, 0
	thumb_func_end ov99_021E7150

	thumb_func_start ov99_021E7158
ov99_021E7158: @ 0x021E7158
	push {r3, lr}
	movs r1, #0xfd
	lsls r1, r1, #2
	ldr r1, [r0, r1]
	lsls r0, r1, #0xd
	lsrs r2, r0, #0x1b
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1b
	cmp r2, r0
	bne _021E717C
	lsls r0, r1, #0x12
	lsrs r0, r0, #0x17
	movs r1, #0x1e
	blx FUN_020F2BA4
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bne _021E717E
_021E717C:
	movs r0, #0x1e
_021E717E:
	pop {r3, pc}
	thumb_func_end ov99_021E7158

	thumb_func_start ov99_021E7180
ov99_021E7180: @ 0x021E7180
	ldr r0, [r0, #0x10]
	ldr r2, [r0, #4]
	subs r0, r1, #1
	ldrb r0, [r2, r0]
	bx lr
	.align 2, 0
	thumb_func_end ov99_021E7180

	thumb_func_start ov99_021E718C
ov99_021E718C: @ 0x021E718C
	ldr r0, [r0, #0x10]
	ldr r3, _021E7194 @ =FUN_0221F024
	ldr r0, [r0, #4]
	bx r3
	.align 2, 0
_021E7194: .4byte FUN_0221F024
	thumb_func_end ov99_021E718C

	thumb_func_start ov99_021E7198
ov99_021E7198: @ 0x021E7198
	push {r3, lr}
	bl ov99_021E7180
	blx FUN_020E3714
	cmp r0, #5
	bne _021E71AA
	movs r0, #1
	pop {r3, pc}
_021E71AA:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov99_021E7198

	thumb_func_start ov99_021E71B0
ov99_021E71B0: @ 0x021E71B0
	movs r1, #0xfd
	lsls r1, r1, #2
	ldr r1, [r0, r1]
	lsls r2, r1, #5
	lsls r1, r1, #0xd
	lsrs r3, r2, #0x18
	lsrs r2, r1, #0x1b
	movs r1, #0x1e
	muls r1, r2, r1
	adds r2, r3, r1
	ldr r1, _021E71D8 @ =0x000001ED
	cmp r2, r1
	blt _021E71CE
	movs r0, #0
	bx lr
_021E71CE:
	lsls r1, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0, #0x14]
	bx lr
	nop
_021E71D8: .4byte 0x000001ED
	thumb_func_end ov99_021E71B0

	thumb_func_start ov99_021E71DC
ov99_021E71DC: @ 0x021E71DC
	ldr r0, [r0, #0x10]
	ldr r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov99_021E71DC

	thumb_func_start ov99_021E71E4
ov99_021E71E4: @ 0x021E71E4
	push {r4, lr}
	adds r4, r1, #0
	beq _021E71F0
	ldr r1, _021E7204 @ =0x000001ED
	cmp r4, r1
	bls _021E71F4
_021E71F0:
	movs r0, #0
	pop {r4, pc}
_021E71F4:
	bl ov99_021E71DC
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0202A640
	pop {r4, pc}
	nop
_021E7204: .4byte 0x000001ED
	thumb_func_end ov99_021E71E4

	thumb_func_start ov99_021E7208
ov99_021E7208: @ 0x021E7208
	push {r4, lr}
	adds r4, r1, #0
	beq _021E7214
	ldr r1, _021E7238 @ =0x000001ED
	cmp r4, r1
	bls _021E7218
_021E7214:
	movs r0, #0
	pop {r4, pc}
_021E7218:
	bl ov99_021E71DC
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0202A0B4
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021E7234
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0206FFC8
_021E7234:
	pop {r4, pc}
	nop
_021E7238: .4byte 0x000001ED
	thumb_func_end ov99_021E7208

	thumb_func_start ov99_021E723C
ov99_021E723C: @ 0x021E723C
	push {r3, lr}
	bl ov99_021E71DC
	movs r1, #0
	bl FUN_0202A088
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov99_021E723C

	thumb_func_start ov99_021E724C
ov99_021E724C: @ 0x021E724C
	push {r3, lr}
	bl ov99_021E718C
	bl FUN_0221EF80
	pop {r3, pc}
	thumb_func_end ov99_021E724C

	thumb_func_start ov99_021E7258
ov99_021E7258: @ 0x021E7258
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	bl ov99_021E7180
	adds r5, r0, #0
	movs r4, #0
	movs r7, #1
_021E7266:
	lsls r0, r4, #2
	adds r1, r6, r0
	ldr r0, _021E7288 @ =0x00000444
	ldr r0, [r1, r0]
	adds r1, r5, #0
	ands r1, r7
	bl FUN_0200DCE8
	lsls r0, r5, #0x17
	lsrs r5, r0, #0x18
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	blo _021E7266
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7288: .4byte 0x00000444
	thumb_func_end ov99_021E7258

	thumb_func_start ov99_021E728C
ov99_021E728C: @ 0x021E728C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov99_021E714C
	adds r1, r0, #0
	movs r2, #0
	lsls r3, r1, #2
	ldr r1, _021E72BC @ =0x021E9F4C
	str r2, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	ldr r1, [r1, r3]
	ldr r0, [r5, #8]
	ldr r3, [r5, #0xc]
	bl FUN_02007CAC
	ldr r1, [sp, #8]
	lsrs r1, r1, #1
	str r1, [r4]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E72BC: .4byte 0x021E9F4C
	thumb_func_end ov99_021E728C

	thumb_func_start ov99_021E72C0
ov99_021E72C0: @ 0x021E72C0
	push {r3, r4, r5, r6, r7, lr}
	add r1, sp, #0
	adds r5, r0, #0
	bl ov99_021E728C
	movs r1, #0x3f
	lsls r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [sp]
	movs r7, #0
	cmp r0, #0
	bls _021E7332
	adds r6, r7, #0
_021E72DA:
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldrh r4, [r0, r6]
	cmp r4, #0
	beq _021E72EC
	ldr r0, _021E7384 @ =0x000001ED
	cmp r4, r0
	bls _021E72F0
_021E72EC:
	bl FUN_0202551C
_021E72F0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov99_021E7180
	cmp r0, #0
	beq _021E7328
	movs r0, #0xfd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x17
	lsls r0, r0, #1
	adds r0, r5, r0
	strh r4, [r0, #0x14]
	movs r0, #0xfd
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	ldr r0, _021E7388 @ =0xFFFFC01F
	ands r0, r1
	lsls r1, r1, #0x12
	lsrs r1, r1, #0x17
	adds r1, r1, #1
	lsls r1, r1, #0x17
	lsrs r1, r1, #0x12
	orrs r1, r0
	movs r0, #0xfd
	lsls r0, r0, #2
	str r1, [r5, r0]
_021E7328:
	ldr r0, [sp]
	adds r7, r7, #1
	adds r6, r6, #2
	cmp r7, r0
	blo _021E72DA
_021E7332:
	movs r0, #0xfd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x17
	beq _021E7380
	movs r1, #0x1e
	blx FUN_020F2BA4
	movs r2, #0xfd
	lsls r2, r2, #2
	ldr r3, [r5, r2]
	movs r1, #0x1f
	bics r3, r1
	movs r1, #0x1f
	ands r0, r1
	orrs r0, r3
	str r0, [r5, r2]
	ldr r0, [r5, r2]
	movs r1, #0x1e
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x17
	blx FUN_020F2BA4
	cmp r1, #0
	bne _021E7380
	movs r2, #0xfd
	lsls r2, r2, #2
	ldr r3, [r5, r2]
	movs r1, #0x1f
	adds r0, r3, #0
	bics r0, r1
	lsls r1, r3, #0x1b
	lsrs r1, r1, #0x1b
	subs r3, r1, #1
	movs r1, #0x1f
	ands r1, r3
	orrs r0, r1
	str r0, [r5, r2]
_021E7380:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7384: .4byte 0x000001ED
_021E7388: .4byte 0xFFFFC01F
	thumb_func_end ov99_021E72C0

	thumb_func_start ov99_021E738C
ov99_021E738C: @ 0x021E738C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp, #0xc]
	movs r5, #0
	adds r7, r0, #0
	str r2, [sp, #0x10]
	str r5, [sp, #0x14]
_021E739A:
	ldr r0, [sp, #0x10]
	movs r4, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_021E73A2:
	adds r0, r4, r5
	adds r1, r0, #1
	add r0, sp, #0x18
	strh r1, [r0]
	str r6, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r0, [r7]
	adds r3, r3, r4
	lsls r3, r3, #0x18
	movs r1, #3
	add r2, sp, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201C4C4
	adds r4, r4, #1
	cmp r4, #2
	blt _021E73A2
	ldr r0, [sp, #0x10]
	adds r5, r5, #2
	adds r0, r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #2
	blt _021E739A
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov99_021E738C

	thumb_func_start ov99_021E73E0
ov99_021E73E0: @ 0x021E73E0
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r1, r2, #0
	adds r5, r0, #0
	bl ov99_021E7198
	cmp r0, #0
	beq _021E7424
	adds r0, r4, #0
	movs r1, #6
	blx FUN_020F2998
	adds r6, r1, #0
	adds r0, r4, #0
	movs r1, #6
	blx FUN_020F2998
	adds r2, r0, #0
	lsls r3, r2, #1
	lsls r1, r6, #2
	adds r2, r2, r3
	adds r1, r1, #6
	adds r2, r2, #4
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	adds r0, r5, #0
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov99_021E738C
	ldr r0, [r5]
	movs r1, #3
	bl FUN_0201BF7C
_021E7424:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov99_021E73E0

	thumb_func_start ov99_021E7428
ov99_021E7428: @ 0x021E7428
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _021E744C @ =0x00000408
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
_021E7432:
	adds r0, r4, #0
	adds r0, #0x14
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, r7]
	adds r1, r6, #0
	bl FUN_0200DCE8
	adds r4, r4, #1
	cmp r4, #0x1e
	blt _021E7432
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E744C: .4byte 0x00000408
	thumb_func_end ov99_021E7428

	thumb_func_start ov99_021E7450
ov99_021E7450: @ 0x021E7450
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl ov99_021E7158
	str r0, [sp, #4]
	add r1, sp, #8
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r5]
	movs r1, #3
	bl FUN_0201CAE0
	adds r0, r5, #0
	movs r1, #0
	bl ov99_021E7428
	ldr r0, [sp, #4]
	movs r4, #0
	cmp r0, #0
	ble _021E74F2
_021E747E:
	movs r0, #0xfd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0x1b
	movs r0, #0x1e
	muls r0, r1, r0
	adds r0, r4, r0
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r6, [r0, #0x14]
	ldr r1, [sp, #8]
	ldr r0, _021E74F8 @ =0xFFFFFE00
	ands r1, r0
	lsrs r0, r0, #0x17
	ands r0, r6
	orrs r0, r1
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov99_021E71E4
	lsls r0, r0, #0x1b
	ldr r2, [sp, #8]
	ldr r1, _021E74FC @ =0xFFFFC1FF
	lsrs r0, r0, #0x12
	ands r1, r2
	orrs r0, r1
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x14
	lsls r0, r0, #2
	adds r7, r5, r0
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E7500 @ =0x00000404
	ldr r1, _021E7504 @ =0x00000408
	ldr r0, [r5, r0]
	ldr r1, [r7, r1]
	add r2, sp, #8
	movs r3, #1
	bl FUN_0221E970
	ldr r0, _021E7504 @ =0x00000408
	movs r1, #1
	ldr r0, [r7, r0]
	bl FUN_0200DCE8
	lsls r1, r4, #0x10
	adds r0, r5, #0
	lsrs r1, r1, #0x10
	adds r2, r6, #0
	bl ov99_021E73E0
	ldr r0, [sp, #4]
	adds r4, r4, #1
	cmp r4, r0
	blt _021E747E
_021E74F2:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021E74F8: .4byte 0xFFFFFE00
_021E74FC: .4byte 0xFFFFC1FF
_021E7500: .4byte 0x00000404
_021E7504: .4byte 0x00000408
	thumb_func_end ov99_021E7450

	thumb_func_start ov99_021E7508
ov99_021E7508: @ 0x021E7508
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xfd
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	movs r1, #0
	lsls r0, r2, #0x1b
	lsrs r0, r0, #0x1b
	beq _021E7522
	lsls r2, r2, #0xd
	lsrs r2, r2, #0x1b
	beq _021E7522
	movs r1, #1
_021E7522:
	cmp r0, #0
	beq _021E7538
	movs r2, #0xfd
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	lsls r2, r2, #0xd
	lsrs r2, r2, #0x1b
	cmp r2, r0
	bhs _021E7538
	movs r5, #1
	b _021E753A
_021E7538:
	movs r5, #0
_021E753A:
	ldr r0, _021E7594 @ =0x0000040C
	ldr r0, [r4, r0]
	bl FUN_0200DCE8
	movs r0, #0x41
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r1, r5, #0
	bl FUN_0200DCE8
	movs r1, #1
	lsls r1, r1, #0xa
	ldr r0, [r4, r1]
	subs r1, #0xc
	ldr r1, [r4, r1]
	movs r2, #2
	lsls r1, r1, #0xd
	lsrs r1, r1, #0x1b
	adds r1, r1, #1
	movs r3, #0
	bl FUN_0221EDA4
	movs r1, #1
	lsls r1, r1, #0xa
	ldr r0, [r4, r1]
	subs r1, #0xc
	ldr r1, [r4, r1]
	movs r2, #2
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	adds r1, r1, #1
	movs r3, #1
	bl FUN_0221EDA4
	movs r3, #0
	movs r0, #1
	str r3, [sp]
	lsls r0, r0, #0xa
	ldr r0, [r4, r0]
	movs r1, #3
	movs r2, #0x81
	bl FUN_0221ED48
	pop {r3, r4, r5, pc}
	nop
_021E7594: .4byte 0x0000040C
	thumb_func_end ov99_021E7508

	thumb_func_start ov99_021E7598
ov99_021E7598: @ 0x021E7598
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0xfd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	lsls r0, r0, #4
	lsrs r0, r0, #0x1f
	beq _021E75AE
	movs r0, #1
	b _021E75B2
_021E75AE:
	movs r0, #0
	mvns r0, r0
_021E75B2:
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xfe
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bne _021E75E6
	adds r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02019F74
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov99_021E7508
	cmp r4, #0x1e
	bne _021E75DE
	adds r0, r5, #0
	bl ov99_021E77D8
	b _021E7636
_021E75DE:
	adds r0, r5, #0
	bl ov99_021E7794
	b _021E7636
_021E75E6:
	cmp r1, #4
	bne _021E7636
	adds r0, r5, #0
	bl ov99_021E7450
	movs r6, #0
	adds r4, r5, #0
_021E75F4:
	movs r0, #0xfe
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	add r2, sp, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r7, r1, #0
	ldr r0, [sp]
	add r1, sp, #4
	muls r7, r0, r7
	ldr r0, _021E76D4 @ =0x00000458
	adds r1, #2
	ldr r0, [r4, r0]
	bl FUN_0200DE44
	ldr r0, _021E76D4 @ =0x00000458
	add r2, sp, #4
	movs r1, #2
	ldrsh r2, [r2, r1]
	lsls r1, r7, #1
	add r3, sp, #4
	subs r1, r2, r1
	movs r2, #0
	lsls r1, r1, #0x10
	ldrsh r2, [r3, r2]
	ldr r0, [r4, r0]
	asrs r1, r1, #0x10
	bl FUN_0200DDB8
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #0x1e
	blt _021E75F4
_021E7636:
	movs r0, #0xfe
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bhs _021E7680
	ldr r0, [sp]
	movs r1, #2
	rsbs r4, r0, #0
	ldr r0, [r5]
	movs r2, #1
	adds r3, r4, #0
	bl FUN_0201F238
	ldr r0, [r5]
	movs r1, #3
	movs r2, #1
	adds r3, r4, #0
	bl FUN_0201F238
	ldr r0, [sp]
	movs r6, #0
	lsls r0, r0, #0x10
	adds r4, r5, #0
	asrs r7, r0, #0x10
_021E766A:
	ldr r0, _021E76D4 @ =0x00000458
	adds r1, r7, #0
	ldr r0, [r4, r0]
	movs r2, #0
	bl FUN_0200DED0
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #0x1e
	blt _021E766A
	b _021E76B4
_021E7680:
	movs r2, #0
	ldr r0, [r5]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201F238
	movs r2, #0
	ldr r0, [r5]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201F238
	movs r1, #0xfe
	lsls r1, r1, #2
	ldr r2, [r5, r1]
	movs r0, #0xff
	bics r2, r0
	str r2, [r5, r1]
	adds r1, #0x10
	ldr r0, [r5, r1]
	movs r1, #1
	bl FUN_0200DCE8
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E76B4:
	movs r2, #0xfe
	lsls r2, r2, #2
	ldr r3, [r5, r2]
	movs r1, #0xff
	adds r0, r3, #0
	bics r0, r1
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	orrs r0, r1
	str r0, [r5, r2]
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E76D4: .4byte 0x00000458
	thumb_func_end ov99_021E7598

	thumb_func_start ov99_021E76D8
ov99_021E76D8: @ 0x021E76D8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r3, sp, #4
	movs r2, #0
	str r2, [r3]
	str r2, [r3, #4]
	str r2, [r3, #8]
	ldr r2, [sp, #4]
	ldr r3, _021E7744 @ =0xFFFFFE00
	adds r4, r1, #0
	ands r2, r3
	lsrs r3, r3, #0x17
	ands r3, r4
	orrs r2, r3
	str r2, [sp, #4]
	adds r5, r0, #0
	bl ov99_021E71E4
	lsls r0, r0, #0x1b
	ldr r2, [sp, #4]
	ldr r1, _021E7748 @ =0xFFFFC1FF
	lsrs r0, r0, #0x12
	ands r1, r2
	orrs r0, r1
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov99_021E7208
	lsls r0, r0, #0x1e
	ldr r2, [sp, #4]
	ldr r1, _021E774C @ =0xFFFF3FFF
	lsrs r0, r0, #0x10
	ands r1, r2
	orrs r0, r1
	str r0, [sp, #4]
	ldr r0, _021E7750 @ =0x00000147
	cmp r4, r0
	bne _021E772E
	adds r0, r5, #0
	bl ov99_021E723C
	str r0, [sp, #8]
_021E772E:
	ldr r0, [r5, #0xc]
	movs r2, #0
	str r0, [sp]
	ldr r0, _021E7754 @ =0x00000414
	add r1, sp, #4
	ldr r0, [r5, r0]
	adds r3, r2, #0
	bl FUN_0221E7E8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7744: .4byte 0xFFFFFE00
_021E7748: .4byte 0xFFFFC1FF
_021E774C: .4byte 0xFFFF3FFF
_021E7750: .4byte 0x00000147
_021E7754: .4byte 0x00000414
	thumb_func_end ov99_021E76D8

	thumb_func_start ov99_021E7758
ov99_021E7758: @ 0x021E7758
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #1
	lsls r0, r0, #0xa
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_0221EEFC
	cmp r4, #0
	beq _021E7786
	movs r1, #0
	adds r2, r4, #0
	bl FUN_0200BEE8
	movs r0, #1
	lsls r0, r0, #0xa
	ldr r0, [r5, r0]
	movs r1, #5
	movs r2, #0x7c
	movs r3, #0
	bl FUN_0221EBD8
	pop {r3, r4, r5, pc}
_021E7786:
	movs r0, #1
	lsls r0, r0, #0xa
	ldr r0, [r5, r0]
	movs r1, #5
	bl FUN_0221EE84
	pop {r3, r4, r5, pc}
	thumb_func_end ov99_021E7758

	thumb_func_start ov99_021E7794
ov99_021E7794: @ 0x021E7794
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov99_021E71B0
	adds r4, r0, #0
	ldr r0, _021E77D4 @ =0x000001ED
	cmp r4, r0
	bls _021E77A6
	movs r4, #0
_021E77A6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov99_021E76D8
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov99_021E7758
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov99_021E7258
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov99_021E7198
	adds r1, r0, #0
	lsls r1, r1, #0x18
	movs r0, #4
	lsrs r1, r1, #0x18
	bl FUN_02022CC8
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E77D4: .4byte 0x000001ED
	thumb_func_end ov99_021E7794

	thumb_func_start ov99_021E77D8
ov99_021E77D8: @ 0x021E77D8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _021E7810 @ =0x00000414
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200DCE8
	adds r0, r5, #0
	movs r1, #0
	bl ov99_021E7758
	movs r4, #0
	ldr r6, _021E7814 @ =0x00000444
	adds r7, r4, #0
_021E77F4:
	ldr r0, [r5, r6]
	adds r1, r7, #0
	bl FUN_0200DCE8
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #5
	blt _021E77F4
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7810: .4byte 0x00000414
_021E7814: .4byte 0x00000444
	thumb_func_end ov99_021E77D8

	thumb_func_start ov99_021E7818
ov99_021E7818: @ 0x021E7818
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _021E78E0 @ =0x00000062
	movs r1, #2
	bl FUN_02006FF8
	adds r0, r4, #0
	bl FUN_020072A4
	adds r5, r0, #0
	bl FUN_02022CBC
	bl FUN_02022C54
	cmp r5, #0
	bne _021E783C
	bl FUN_0202551C
_021E783C:
	movs r0, #3
	movs r1, #0x84
	lsls r2, r0, #0x10
	bl FUN_0201A910
	movs r1, #0x4d
	adds r0, r4, #0
	lsls r1, r1, #4
	movs r2, #0x84
	bl FUN_02007280
	movs r2, #0x4d
	movs r1, #0
	lsls r2, r2, #4
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x84
	str r0, [r4, #0xc]
	str r5, [r4, #0x10]
	bl FUN_0221F090
	ldr r1, [r4, #0xc]
	movs r0, #0xb1
	bl FUN_02007688
	str r0, [r4, #4]
	ldr r1, [r4, #0xc]
	movs r0, #0x4a
	bl FUN_02007688
	str r0, [r4, #8]
	adds r0, r4, #0
	bl ov99_021E72C0
	adds r0, r4, #0
	bl ov99_021E7D30
	adds r0, r4, #0
	bl ov99_021E7DA4
	ldr r0, _021E78E4 @ =0x0000013A
	ldr r3, _021E78E8 @ =0x021E9FDC
	str r0, [sp]
	ldr r0, [r4, #0xc]
	ldr r1, [r4]
	movs r2, #0xc
	bl FUN_0221EABC
	movs r1, #1
	lsls r1, r1, #0xa
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov99_021E7EF0
	adds r0, r4, #0
	bl ov99_021E7A78
	adds r0, r4, #0
	bl ov99_021E7508
	adds r0, r4, #0
	bl ov99_021E7450
	adds r0, r4, #0
	bl ov99_021E7794
	adds r0, r4, #0
	bl ov99_021E8224
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	ldr r0, _021E78EC @ =ov99_021E7A54
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E78E0: .4byte 0x00000062
_021E78E4: .4byte 0x0000013A
_021E78E8: .4byte 0x021E9FDC
_021E78EC: .4byte ov99_021E7A54
	thumb_func_end ov99_021E7818

	thumb_func_start ov99_021E78F0
ov99_021E78F0: @ 0x021E78F0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl ov99_021E7AB8
	ldr r1, _021E7944 @ =0x00000404
	movs r2, #0x32
	ldr r0, [r4, r1]
	adds r1, r1, #4
	adds r1, r4, r1
	bl FUN_0221E684
	movs r0, #1
	lsls r0, r0, #0xa
	ldr r0, [r4, r0]
	movs r1, #0xc
	bl FUN_0221EB84
	adds r0, r4, #0
	bl ov99_021E7EBC
	bl FUN_0221F0EC
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x84
	bl FUN_0201A9C4
	ldr r0, _021E7948 @ =0x00000062
	bl FUN_02006F7C
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7944: .4byte 0x00000404
_021E7948: .4byte 0x00000062
	thumb_func_end ov99_021E78F0

	thumb_func_start ov99_021E794C
ov99_021E794C: @ 0x021E794C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #4
	bhi _021E7A28
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E796A: @ jump table
	.2byte _021E7974 - _021E796A - 2 @ case 0
	.2byte _021E7990 - _021E796A - 2 @ case 1
	.2byte _021E799E - _021E796A - 2 @ case 2
	.2byte _021E7A14 - _021E796A - 2 @ case 3
	.2byte _021E7A22 - _021E796A - 2 @ case 4
_021E7974:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0xc]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	str r0, [r5]
	b _021E7A32
_021E7990:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E7A32
	movs r0, #2
	str r0, [r5]
	b _021E7A32
_021E799E:
	movs r1, #0xfd
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	lsls r1, r1, #2
	lsrs r1, r1, #0x1f
	beq _021E79BA
	bl ov99_021E7794
	movs r1, #0xfd
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	ldr r0, _021E7A40 @ =0xDFFFFFFF
	ands r0, r2
	str r0, [r4, r1]
_021E79BA:
	movs r0, #0xfd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	lsls r0, r0, #3
	lsrs r0, r0, #0x1f
	beq _021E79DE
	adds r0, r4, #0
	bl ov99_021E7598
	cmp r0, #0
	beq _021E7A32
	movs r1, #0xfd
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	ldr r0, _021E7A44 @ =0xEFFFFFFF
	ands r0, r2
	str r0, [r4, r1]
	b _021E7A32
_021E79DE:
	adds r0, r4, #0
	bl ov99_021E7BC8
	cmp r0, #0
	bne _021E79F0
	bl FUN_0221EF24
	cmp r0, #0
	beq _021E7A32
_021E79F0:
	ldr r0, _021E7A48 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #3
	str r0, [r5]
	b _021E7A32
_021E7A14:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E7A32
	movs r0, #4
	str r0, [r5]
	b _021E7A32
_021E7A22:
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_021E7A28:
	ldr r0, _021E7A4C @ =0x021EA5D8
	cmp r0, #0
	beq _021E7A32
	bl FUN_0202551C
_021E7A32:
	ldr r0, _021E7A50 @ =0x00000404
	ldr r0, [r4, r0]
	bl FUN_0221E6CC
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_021E7A40: .4byte 0xDFFFFFFF
_021E7A44: .4byte 0xEFFFFFFF
_021E7A48: .4byte 0x000005DC
_021E7A4C: .4byte 0x021EA5D8
_021E7A50: .4byte 0x00000404
	thumb_func_end ov99_021E794C

	thumb_func_start ov99_021E7A54
ov99_021E7A54: @ 0x021E7A54
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200D034
	ldr r0, [r4]
	bl FUN_0201EEB4
	ldr r3, _021E7A70 @ =0x027E0000
	ldr r1, _021E7A74 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E7A70: .4byte 0x027E0000
_021E7A74: .4byte 0x00003FF8
	thumb_func_end ov99_021E7A54

	thumb_func_start ov99_021E7A78
ov99_021E7A78: @ 0x021E7A78
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0xfd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, _021E7AAC @ =0x021EA250
	lsls r0, r0, #5
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	ldr r2, _021E7AB0 @ =0x021E9FA0
	str r0, [sp, #8]
	ldr r0, _021E7AB4 @ =0x021EA03C
	adds r3, r4, #0
	bl FUN_02019BA4
	movs r1, #0xff
	lsls r1, r1, #2
	str r0, [r4, r1]
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_021E7AAC: .4byte 0x021EA250
_021E7AB0: .4byte 0x021E9FA0
_021E7AB4: .4byte 0x021EA03C
	thumb_func_end ov99_021E7A78

	thumb_func_start ov99_021E7AB8
ov99_021E7AB8: @ 0x021E7AB8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E7AD2
	bl FUN_02019BDC
	movs r0, #0xff
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_021E7AD2:
	pop {r4, pc}
	thumb_func_end ov99_021E7AB8

	thumb_func_start ov99_021E7AD4
ov99_021E7AD4: @ 0x021E7AD4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0xfd
	lsls r0, r0, #2
	adds r4, r1, #0
	ldr r1, [r5, r0]
	adds r7, r2, #0
	lsls r2, r1, #0xd
	lsrs r2, r2, #0x1b
	cmp r4, #0
	beq _021E7AFA
	ldr r3, _021E7BB8 @ =0xFFF83FFF
	ands r1, r3
	adds r3, r2, #1
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0xd
	orrs r1, r3
	str r1, [r5, r0]
	b _021E7B0C
_021E7AFA:
	cmp r2, #0
	beq _021E7B0C
	ldr r3, _021E7BB8 @ =0xFFF83FFF
	ands r1, r3
	subs r3, r2, #1
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0xd
	orrs r1, r3
	str r1, [r5, r0]
_021E7B0C:
	movs r0, #0xfd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	lsls r1, r0, #0x1b
	lsls r0, r0, #0xd
	lsrs r3, r1, #0x1b
	lsrs r0, r0, #0x1b
	cmp r0, r3
	bhi _021E7B20
	adds r3, r0, #0
_021E7B20:
	movs r6, #0xfd
	lsls r6, r6, #2
	ldr r1, [r5, r6]
	ldr r0, _021E7BB8 @ =0xFFF83FFF
	ands r0, r1
	lsls r1, r3, #0x1b
	lsrs r1, r1, #0xd
	orrs r0, r1
	str r0, [r5, r6]
	ldr r0, [r5, r6]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0x1b
	cmp r0, r2
	beq _021E7BB4
	ldr r0, _021E7BBC @ =0x000005DC
	bl FUN_0200604C
	cmp r4, #0
	bne _021E7B4A
	movs r2, #1
	b _021E7B4C
_021E7B4A:
	movs r2, #0
_021E7B4C:
	movs r0, #0xfd
	lsls r0, r0, #2
	ldr r3, [r5, r0]
	ldr r1, _021E7BC0 @ =0xF7FFFFFF
	lsls r2, r2, #0x1f
	ands r1, r3
	lsrs r2, r2, #4
	orrs r1, r2
	str r1, [r5, r0]
	movs r1, #1
	ldr r2, [r5, r0]
	lsls r1, r1, #0x1c
	orrs r1, r2
	str r1, [r5, r0]
	adds r0, #8
	ldr r0, [r5, r0]
	movs r6, #0
	bl FUN_02019F74
	cmp r7, #0
	beq _021E7B80
	cmp r0, #0x1e
	bne _021E7B96
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _021E7B96
_021E7B80:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, #0
	beq _021E7B90
	subs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _021E7B96
_021E7B90:
	adds r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_021E7B96:
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov99_021E7C58
	ldr r0, _021E7BC4 @ =0x00000408
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200DCE8
_021E7BB4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7BB8: .4byte 0xFFF83FFF
_021E7BBC: .4byte 0x000005DC
_021E7BC0: .4byte 0xF7FFFFFF
_021E7BC4: .4byte 0x00000408
	thumb_func_end ov99_021E7AD4

	thumb_func_start ov99_021E7BC8
ov99_021E7BC8: @ 0x021E7BC8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02019D18
	adds r6, r0, #0
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02019F74
	adds r4, r0, #0
	ldr r0, _021E7C50 @ =0x021E9F54
	bl FUN_0202529C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021E7C12
	cmp r0, #0
	bne _021E7C02
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	bl ov99_021E7AD4
	b _021E7C4C
_021E7C02:
	cmp r0, #1
	bne _021E7C4C
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov99_021E7AD4
	b _021E7C4C
_021E7C12:
	cmp r6, r1
	bne _021E7C3E
	cmp r4, #0x1e
	bhs _021E7C3E
	ldr r0, _021E7C54 @ =0x021D110C
	ldr r0, [r0, #0x4c]
	cmp r0, #0x20
	bne _021E7C2E
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov99_021E7AD4
	b _021E7C4C
_021E7C2E:
	cmp r0, #0x10
	bne _021E7C4C
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov99_021E7AD4
	b _021E7C4C
_021E7C3E:
	cmp r4, #0x1e
	bne _021E7C4C
	ldr r0, _021E7C54 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r1, r0
	bne _021E7C4E
_021E7C4C:
	movs r0, #0
_021E7C4E:
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E7C50: .4byte 0x021E9F54
_021E7C54: .4byte 0x021D110C
	thumb_func_end ov99_021E7BC8

	thumb_func_start ov99_021E7C58
ov99_021E7C58: @ 0x021E7C58
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	ldr r0, _021E7C9C @ =0x00000408
	add r2, sp, #0
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	bl FUN_0200DDB8
	movs r1, #0xfd
	lsls r1, r1, #2
	ldr r2, [r5, r1]
	ldr r0, _021E7CA0 @ =0xF807FFFF
	ands r2, r0
	lsls r0, r4, #0x18
	lsrs r0, r0, #5
	orrs r0, r2
	str r0, [r5, r1]
	ldr r0, _021E7CA4 @ =0x000005DC
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
	nop
_021E7C9C: .4byte 0x00000408
_021E7CA0: .4byte 0xF807FFFF
_021E7CA4: .4byte 0x000005DC
	thumb_func_end ov99_021E7C58

	thumb_func_start ov99_021E7CA8
ov99_021E7CA8: @ 0x021E7CA8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xff
	adds r4, r1, #0
	lsls r0, r0, #2
	lsls r1, r4, #0x18
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov99_021E7C58
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov99_021E7CA8

	thumb_func_start ov99_021E7CC8
ov99_021E7CC8: @ 0x021E7CC8
	bx lr
	.align 2, 0
	thumb_func_end ov99_021E7CC8

	thumb_func_start ov99_021E7CCC
ov99_021E7CCC: @ 0x021E7CCC
	push {r3, lr}
	movs r3, #0
	bl ov99_021E7CE4
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov99_021E7CCC

	thumb_func_start ov99_021E7CD8
ov99_021E7CD8: @ 0x021E7CD8
	push {r3, lr}
	movs r3, #1
	bl ov99_021E7CE4
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov99_021E7CD8

	thumb_func_start ov99_021E7CE4
ov99_021E7CE4: @ 0x021E7CE4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r3, #0
	cmp r4, r2
	beq _021E7D2A
	cmp r4, #0x20
	bhs _021E7D2A
	bl ov99_021E7C58
	cmp r4, #0x1e
	bge _021E7D0C
	movs r1, #0xfd
	lsls r1, r1, #2
	movs r0, #2
	ldr r2, [r5, r1]
	lsls r0, r0, #0x1c
	orrs r0, r2
	str r0, [r5, r1]
	b _021E7D12
_021E7D0C:
	adds r0, r5, #0
	bl ov99_021E77D8
_021E7D12:
	cmp r4, #0x1e
	bne _021E7D1A
	movs r1, #0xc
	b _021E7D1C
_021E7D1A:
	movs r1, #0xe
_021E7D1C:
	cmp r6, #0
	beq _021E7D22
	adds r1, r1, #1
_021E7D22:
	ldr r0, _021E7D2C @ =0x00000408
	ldr r0, [r5, r0]
	bl FUN_0200DC4C
_021E7D2A:
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E7D2C: .4byte 0x00000408
	thumb_func_end ov99_021E7CE4

	thumb_func_start ov99_021E7D30
ov99_021E7D30: @ 0x021E7D30
	push {r4, r5, r6, r7, lr}
	sub sp, #0xd4
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_0201AC88
	add r3, sp, #0
	ldr r4, _021E7D98 @ =0x021E9F80
	str r0, [r5]
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r4, _021E7D9C @ =0x021EA0BC
	add r3, sp, #0x10
	movs r2, #0x18
_021E7D58:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E7D58
	ldr r0, [r4]
	ldr r4, _021E7DA0 @ =0x021EA348
	str r0, [r3]
	movs r7, #0
	add r6, sp, #0x10
_021E7D6A:
	ldrb r1, [r4]
	ldr r0, [r5]
	adds r2, r6, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldrb r1, [r4]
	ldr r0, [r5]
	bl FUN_0201CAE0
	ldrb r0, [r4]
	ldr r3, [r5, #0xc]
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	adds r7, r7, #1
	adds r6, #0x1c
	adds r4, r4, #1
	cmp r7, #7
	blt _021E7D6A
	add sp, #0xd4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E7D98: .4byte 0x021E9F80
_021E7D9C: .4byte 0x021EA0BC
_021E7DA0: .4byte 0x021EA348
	thumb_func_end ov99_021E7D30

	thumb_func_start ov99_021E7DA4
ov99_021E7DA4: @ 0x021E7DA4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x40
	str r0, [sp]
	ldr r0, [r4, #0xc]
	movs r2, #0
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	movs r1, #0x2a
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x2c
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	ldr r2, [r4]
	bl FUN_02007B44
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x2e
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	ldr r2, [r4]
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x2c
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	ldr r2, [r4]
	movs r3, #2
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x2f
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	ldr r2, [r4]
	movs r3, #2
	bl FUN_02007B68
	movs r1, #1
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x30
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	ldr r2, [r4]
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0x40
	str r0, [sp]
	ldr r0, [r4, #0xc]
	movs r1, #0x2b
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x2d
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	ldr r2, [r4]
	movs r3, #4
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x31
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	ldr r2, [r4]
	movs r3, #4
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x2d
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	ldr r2, [r4]
	movs r3, #6
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x32
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	ldr r2, [r4]
	movs r3, #6
	bl FUN_02007B68
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov99_021E7DA4

	thumb_func_start ov99_021E7EBC
ov99_021E7EBC: @ 0x021E7EBC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_0200770C
	ldr r0, [r5, #4]
	bl FUN_0200770C
	ldr r6, _021E7EEC @ =0x021EA348
	movs r4, #0
_021E7ED0:
	ldrb r1, [r6, r4]
	ldr r0, [r5]
	bl FUN_0201BB4C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	blo _021E7ED0
	ldr r0, [r5]
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	nop
_021E7EEC: .4byte 0x021EA348
	thumb_func_end ov99_021E7EBC

	thumb_func_start ov99_021E7EF0
ov99_021E7EF0: @ 0x021E7EF0
	push {r3, r4, r5, lr}
	sub sp, #0x28
	ldr r5, _021E7F58 @ =0x021E9FC4
	add r3, sp, #0x10
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r1, r2, #0
	ldr r0, [r4, #0xc]
	movs r2, #0x32
	bl FUN_0221E5E0
	ldr r1, _021E7F5C @ =0x00000404
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov99_021E7F90
	adds r0, r4, #0
	bl ov99_021E80D0
	adds r0, r4, #0
	bl ov99_021E810C
	adds r0, r4, #0
	bl ov99_021E8198
	adds r0, r4, #0
	bl ov99_021E724C
	adds r3, r0, #0
	movs r0, #5
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #0x98
	str r0, [sp, #8]
	movs r0, #1
	ldr r1, _021E7F5C @ =0x00000404
	str r0, [sp, #0xc]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r2, _021E7F60 @ =0x021E9F60
	adds r1, r4, r1
	bl FUN_0221E6F0
	add sp, #0x28
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7F58: .4byte 0x021E9FC4
_021E7F5C: .4byte 0x00000404
_021E7F60: .4byte 0x021E9F60
	thumb_func_end ov99_021E7EF0

	thumb_func_start ov99_021E7F64
ov99_021E7F64: @ 0x021E7F64
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021E7F88 @ =0x00000404
	ldr r0, [r5, r0]
	bl FUN_0221E5C0
	adds r4, r0, #0
	ldr r0, _021E7F88 @ =0x00000404
	ldr r0, [r5, r0]
	bl FUN_0221E5D0
	adds r1, r0, #0
	ldr r2, _021E7F8C @ =0x021E9F70
	adds r0, r4, #0
	movs r3, #2
	bl FUN_0221E784
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7F88: .4byte 0x00000404
_021E7F8C: .4byte 0x021E9F70
	thumb_func_end ov99_021E7F64

	thumb_func_start ov99_021E7F90
ov99_021E7F90: @ 0x021E7F90
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _021E80C8 @ =0x00000404
	ldr r0, [r5, r0]
	bl FUN_0221E5C0
	adds r4, r0, #0
	ldr r0, _021E80C8 @ =0x00000404
	ldr r0, [r5, r0]
	bl FUN_0221E5D0
	adds r6, r0, #0
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200D504
	movs r3, #0
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	movs r3, #2
	str r3, [sp, #4]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #3
	bl FUN_0200D71C
	movs r0, #0
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #4
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x20
	str r0, [sp, #8]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #5
	bl FUN_0200D504
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #6
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #7
	bl FUN_0200D71C
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x18
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x19
	bl FUN_0200D504
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x1a
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x1b
	bl FUN_0200D71C
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E80C8 @ =0x00000404
	ldr r1, _021E80CC @ =0x021E9F90
	ldr r0, [r5, r0]
	movs r2, #0x1e
	movs r3, #1
	bl FUN_0221E8A8
	adds r0, r5, #0
	bl ov99_021E7F64
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E80C8: .4byte 0x00000404
_021E80CC: .4byte 0x021E9F90
	thumb_func_end ov99_021E7F90

	thumb_func_start ov99_021E80D0
ov99_021E80D0: @ 0x021E80D0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _021E8100 @ =0x021EA180
	movs r6, #0
	adds r5, r7, #0
_021E80DA:
	ldr r0, _021E8104 @ =0x00000404
	adds r1, r4, #0
	ldr r0, [r7, r0]
	bl FUN_0221E6E0
	ldr r1, _021E8108 @ =0x00000408
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DC78
	adds r6, r6, #1
	adds r4, #0x34
	adds r5, r5, #4
	cmp r6, #4
	blt _021E80DA
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8100: .4byte 0x021EA180
_021E8104: .4byte 0x00000404
_021E8108: .4byte 0x00000408
	thumb_func_end ov99_021E80D0

	thumb_func_start ov99_021E810C
ov99_021E810C: @ 0x021E810C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	movs r4, #0
	str r0, [sp]
	add r2, sp, #4
	adds r0, r4, #0
	adds r1, r4, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r7, _021E818C @ =0x021E9FB0
	str r0, [r2]
	movs r6, #0x30
_021E812C:
	add r0, sp, #4
	strh r4, [r0, #6]
	movs r0, #0x20
	str r0, [sp, #0x18]
	movs r0, #3
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	movs r0, #2
	str r0, [sp, #0x14]
	ldr r0, [r7]
	str r4, [sp, #0x10]
	lsls r1, r0, #3
	adds r1, #0x68
	add r0, sp, #4
	strh r1, [r0]
	strh r6, [r0, #2]
	adds r0, r4, #0
	adds r0, #0xf
	lsls r1, r0, #2
	ldr r0, [sp]
	adds r5, r0, r1
	adds r1, r0, #0
	ldr r0, _021E8190 @ =0x00000404
	ldr r0, [r1, r0]
	add r1, sp, #4
	bl FUN_0221E6E0
	ldr r1, _021E8194 @ =0x00000408
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DC78
	ldr r0, _021E8194 @ =0x00000408
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200DCE8
	adds r4, r4, #1
	adds r7, r7, #4
	adds r6, #0x20
	cmp r4, #5
	blt _021E812C
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E818C: .4byte 0x021E9FB0
_021E8190: .4byte 0x00000404
_021E8194: .4byte 0x00000408
	thumb_func_end ov99_021E810C

	thumb_func_start ov99_021E8198
ov99_021E8198: @ 0x021E8198
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r6, r0, #0
	movs r0, #0
	add r2, sp, #0x10
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	str r0, [sp, #8]
	str r0, [r2]
	str r0, [sp, #4]
	movs r0, #0x20
	str r0, [sp]
_021E81BA:
	ldr r0, [sp]
	movs r4, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x30
	str r0, [sp, #0xc]
_021E81C6:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	adds r7, r4, r0
	adds r0, r7, #2
	str r0, [sp, #0x24]
	movs r0, #1
	str r0, [sp, #0x28]
	str r0, [sp, #0x2c]
	str r0, [sp, #0x30]
	str r0, [sp, #0x20]
	add r0, sp, #0x10
	strh r5, [r0]
	strh r1, [r0, #2]
	movs r0, #1
	str r0, [sp, #0x3c]
	ldr r0, _021E821C @ =0x00000404
	add r1, sp, #0x10
	ldr r0, [r6, r0]
	bl FUN_0221E6E0
	adds r7, #0x14
	lsls r1, r7, #2
	adds r2, r6, r1
	ldr r1, _021E8220 @ =0x00000408
	adds r4, r4, #1
	adds r5, #0x20
	str r0, [r2, r1]
	cmp r4, #6
	blo _021E81C6
	ldr r0, [sp, #4]
	adds r0, r0, #6
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #8]
	adds r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #5
	blo _021E81BA
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_021E821C: .4byte 0x00000404
_021E8220: .4byte 0x00000408
	thumb_func_end ov99_021E8198

	thumb_func_start ov99_021E8224
ov99_021E8224: @ 0x021E8224
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	lsls r0, r0, #0xa
	ldr r0, [r5, r0]
	bl FUN_0221EEFC
	adds r6, r0, #0
	movs r0, #1
	lsls r0, r0, #0xa
	ldr r0, [r5, r0]
	movs r1, #0xb
	movs r2, #0x7e
	movs r3, #3
	bl FUN_0221EC24
	movs r1, #0
	movs r0, #1
	str r1, [sp]
	lsls r0, r0, #0xa
	ldr r0, [r5, r0]
	movs r2, #0x7f
	movs r3, #1
	bl FUN_0221EC08
	movs r2, #0
	movs r1, #4
	str r2, [sp]
	str r1, [sp, #4]
	lsls r0, r1, #8
	ldr r0, [r5, r0]
	movs r3, #1
	bl FUN_0221EBEC
	movs r7, #1
	movs r4, #0
	lsls r7, r7, #0xa
_021E8270:
	lsls r2, r4, #0x18
	adds r0, r6, #0
	movs r1, #0
	lsrs r2, r2, #0x18
	bl FUN_0200C984
	ldr r0, [r5, r7]
	adds r1, r4, #6
	movs r2, #4
	movs r3, #0
	bl FUN_0221EBD8
	adds r4, r4, #1
	cmp r4, #5
	blt _021E8270
	adds r0, r5, #0
	bl ov99_021E718C
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	lsls r0, r0, #0xa
	movs r1, #1
	ldr r0, [r5, r0]
	movs r2, #0x80
	adds r3, r1, #0
	bl FUN_0221EC08
	adds r0, r5, #0
	bl ov99_021E7150
	cmp r0, #0
	beq _021E82E0
	adds r0, r5, #0
	bl ov99_021E724C
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	lsls r0, r0, #0xa
	ldr r0, [r5, r0]
	movs r1, #2
	adds r2, #0x71
	movs r3, #1
	bl FUN_0221EC08
_021E82E0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov99_021E8224

	thumb_func_start ov99_021E82E4
ov99_021E82E4: @ 0x021E82E4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _021E82F2
	bl FUN_0202551C
_021E82F2:
	cmp r4, #0xa
	blo _021E82FA
	bl FUN_0202551C
_021E82FA:
	ldr r0, [r5]
	ldr r1, [r0, #8]
	lsls r0, r4, #1
	ldrh r0, [r1, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov99_021E82E4

	thumb_func_start ov99_021E8304
ov99_021E8304: @ 0x021E8304
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _021E839C @ =0x00000062
	movs r1, #2
	bl FUN_02006FF8
	adds r0, r4, #0
	bl FUN_020072A4
	adds r5, r0, #0
	bne _021E831E
	bl FUN_0202551C
_021E831E:
	movs r0, #3
	movs r1, #0x84
	lsls r2, r0, #0x10
	bl FUN_0201A910
	adds r0, r4, #0
	movs r1, #0xe4
	movs r2, #0x84
	bl FUN_02007280
	movs r1, #0
	movs r2, #0xe4
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x84
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov99_021E93DC
	bl FUN_0221F090
	adds r0, r4, #0
	bl ov99_021E8590
	adds r0, r4, #0
	bl ov99_021E860C
	ldr r0, _021E83A0 @ =0x0000013A
	ldr r3, _021E83A4 @ =0x021EA45C
	str r0, [sp]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #4]
	movs r2, #0x13
	bl FUN_0221EABC
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl ov99_021E88D4
	adds r0, r4, #0
	bl ov99_021E8788
	adds r0, r4, #0
	bl ov99_021E8C04
	adds r0, r4, #0
	bl ov99_021E8818
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	ldr r0, _021E83A8 @ =ov99_021E856C
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E839C: .4byte 0x00000062
_021E83A0: .4byte 0x0000013A
_021E83A4: .4byte 0x021EA45C
_021E83A8: .4byte ov99_021E856C
	thumb_func_end ov99_021E8304

	thumb_func_start ov99_021E83AC
ov99_021E83AC: @ 0x021E83AC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r4]
	bl ov99_021E9418
	adds r1, r4, #0
	ldr r0, [r4, #0x14]
	adds r1, #0x18
	movs r2, #0x25
	bl FUN_0221E684
	ldr r0, [r4, #0x10]
	movs r1, #0x13
	bl FUN_0221EB84
	adds r0, r4, #0
	bl ov99_021E875C
	bl FUN_0221F0EC
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x84
	bl FUN_0201A9C4
	ldr r0, _021E83F0 @ =0x00000062
	bl FUN_02006F7C
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E83F0: .4byte 0x00000062
	thumb_func_end ov99_021E83AC

	thumb_func_start ov99_021E83F4
ov99_021E83F4: @ 0x021E83F4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #4
	bhi _021E84CC
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E8412: @ jump table
	.2byte _021E841C - _021E8412 - 2 @ case 0
	.2byte _021E8438 - _021E8412 - 2 @ case 1
	.2byte _021E8446 - _021E8412 - 2 @ case 2
	.2byte _021E84B8 - _021E8412 - 2 @ case 3
	.2byte _021E84C6 - _021E8412 - 2 @ case 4
_021E841C:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0xc]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	str r0, [r5]
	b _021E84D6
_021E8438:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E84D6
	movs r0, #2
	str r0, [r5]
	b _021E84D6
_021E8446:
	adds r1, r4, #0
	adds r1, #0xb4
	ldr r1, [r1]
	cmp r1, #0
	beq _021E8464
	adds r1, r4, #0
	adds r1, #0xb0
	ldr r2, [r1]
	movs r1, #1
	eors r2, r1
	adds r1, r4, #0
	adds r1, #0xb0
	str r2, [r1]
	bl ov99_021E8828
_021E8464:
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	cmp r0, #0
	beq _021E8482
	adds r0, r4, #0
	bl ov99_021E8788
	adds r0, r4, #0
	bl ov99_021E8C50
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xb8
	str r1, [r0]
_021E8482:
	bl FUN_0221EF24
	cmp r0, #0
	bne _021E8494
	adds r0, r4, #0
	bl ov99_021E90F4
	cmp r0, #0
	beq _021E84D6
_021E8494:
	ldr r0, _021E84E4 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #3
	str r0, [r5]
	b _021E84D6
_021E84B8:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E84D6
	movs r0, #4
	str r0, [r5]
	b _021E84D6
_021E84C6:
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_021E84CC:
	ldr r0, _021E84E8 @ =0x021EA5E4
	cmp r0, #0
	beq _021E84D6
	bl FUN_0202551C
_021E84D6:
	ldr r0, [r4, #0x14]
	bl FUN_0221E6CC
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E84E4: .4byte 0x000005DC
_021E84E8: .4byte 0x021EA5E4
	thumb_func_end ov99_021E83F4

	thumb_func_start ov99_021E84EC
ov99_021E84EC: @ 0x021E84EC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0xb0
	ldr r0, [r5]
	ldr r3, [r3]
	movs r2, #0
	adds r4, r1, #0
	bl ov99_021E94CC
	adds r6, r0, #0
	ldr r0, [r5]
	bl ov99_021E945C
	adds r1, r0, #0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r2, r6, #0
	bl FUN_0221EFE8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov99_021E84EC

	thumb_func_start ov99_021E8518
ov99_021E8518: @ 0x021E8518
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	movs r2, #0
	ldr r0, [r5]
	adds r3, r2, #0
	adds r4, r1, #0
	bl ov99_021E94CC
	adds r5, #0xb0
	adds r2, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _021E8538
	movs r0, #0
	pop {r4, r5, r6, pc}
_021E8538:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0221EFE8
	pop {r4, r5, r6, pc}
	thumb_func_end ov99_021E8518

	thumb_func_start ov99_021E8544
ov99_021E8544: @ 0x021E8544
	push {r3, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r1, #0xac
	ldr r0, [r3]
	ldrsb r1, [r3, r1]
	adds r3, #0xb0
	ldr r3, [r3]
	bl ov99_021E94CC
	ldr r1, _021E8568 @ =0x0000FFFF
	cmp r0, r1
	bne _021E8562
	movs r0, #1
	pop {r3, pc}
_021E8562:
	movs r0, #0
	pop {r3, pc}
	nop
_021E8568: .4byte 0x0000FFFF
	thumb_func_end ov99_021E8544

	thumb_func_start ov99_021E856C
ov99_021E856C: @ 0x021E856C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200D034
	ldr r0, [r4, #4]
	bl FUN_0201EEB4
	ldr r3, _021E8588 @ =0x027E0000
	ldr r1, _021E858C @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E8588: .4byte 0x027E0000
_021E858C: .4byte 0x00003FF8
	thumb_func_end ov99_021E856C

	thumb_func_start ov99_021E8590
ov99_021E8590: @ 0x021E8590
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xb8
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_0201AC88
	add r3, sp, #0
	ldr r4, _021E8600 @ =0x021EA374
	str r0, [r5, #4]
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r4, _021E8604 @ =0x021EA4F4
	add r3, sp, #0x10
	movs r2, #0x15
_021E85B8:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E85B8
	ldr r4, _021E8608 @ =0x021EA59C
	movs r7, #0
	add r6, sp, #0x10
_021E85C6:
	ldrb r1, [r4]
	ldr r0, [r5, #4]
	adds r2, r6, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldrb r1, [r4]
	ldr r0, [r5, #4]
	bl FUN_0201CAE0
	ldrb r0, [r4]
	ldr r3, [r5, #0xc]
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	adds r7, r7, #1
	adds r6, #0x1c
	adds r4, r4, #1
	cmp r7, #6
	blt _021E85C6
	ldr r1, [r5, #0xc]
	movs r0, #0xb1
	bl FUN_02007688
	str r0, [r5, #8]
	add sp, #0xb8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8600: .4byte 0x021EA374
_021E8604: .4byte 0x021EA4F4
_021E8608: .4byte 0x021EA59C
	thumb_func_end ov99_021E8590

	thumb_func_start ov99_021E860C
ov99_021E860C: @ 0x021E860C
	push {r4, lr}
	sub sp, #0x10
	movs r2, #0
	adds r4, r0, #0
	str r2, [sp]
	ldr r0, [r4, #0xc]
	movs r1, #0x33
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x34
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	bl FUN_02007B44
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x35
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	bl FUN_02007B68
	movs r1, #1
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x37
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #2
	bl FUN_02007B44
	movs r3, #0
	str r3, [sp]
	ldr r0, [r4, #0xc]
	movs r1, #0x33
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	movs r2, #4
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x34
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #4
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x36
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #4
	bl FUN_02007B68
	movs r1, #1
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x37
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	movs r3, #6
	bl FUN_02007B44
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov99_021E860C

	thumb_func_start ov99_021E86D4
ov99_021E86D4: @ 0x021E86D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r7, r0, #0
	ldr r0, [sp, #0x44]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	cmp r0, #0
	beq _021E86E8
	movs r0, #6
	b _021E86EA
_021E86E8:
	movs r0, #2
_021E86EA:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
	movs r0, #6
	muls r0, r1, r0
	str r0, [sp, #0x18]
	movs r0, #0x5a
	movs r5, #0
	ldr r1, [sp, #0x40]
	lsls r0, r0, #2
	muls r0, r1, r0
	str r5, [sp, #0x20]
	str r0, [sp, #0x14]
_021E8704:
	ldr r0, [sp, #0x10]
	movs r4, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_021E870C:
	ldr r0, [sp, #0x18]
	adds r1, r4, #1
	adds r0, r1, r0
	adds r1, r0, r5
	ldr r0, [sp, #0x14]
	add r2, sp, #0x24
	adds r1, r0, r1
	add r0, sp, #0x24
	strh r1, [r0]
	str r6, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r0, [r7, #4]
	adds r3, r3, r4
	lsls r3, r3, #0x18
	ldr r1, [sp, #0x1c]
	lsrs r3, r3, #0x18
	bl FUN_0201C4C4
	adds r4, r4, #1
	cmp r4, #6
	blt _021E870C
	ldr r0, [sp, #0x10]
	adds r5, #0x3c
	adds r0, r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x20]
	adds r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #6
	blt _021E8704
	ldr r0, [r7, #4]
	ldr r1, [sp, #0x1c]
	bl FUN_0201BF7C
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov99_021E86D4

	thumb_func_start ov99_021E875C
ov99_021E875C: @ 0x021E875C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_0200770C
	ldr r6, _021E8784 @ =0x021EA59C
	movs r4, #0
_021E876A:
	ldrb r1, [r6, r4]
	ldr r0, [r5, #4]
	bl FUN_0201BB4C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	blo _021E876A
	ldr r0, [r5, #4]
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E8784: .4byte 0x021EA59C
	thumb_func_end ov99_021E875C

	thumb_func_start ov99_021E8788
ov99_021E8788: @ 0x021E8788
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _021E879A
	movs r5, #1
	b _021E87B0
_021E879A:
	movs r0, #0xac
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, #0xbc
	ldr r0, [r0]
	cmp r0, #0
	bne _021E87AE
	movs r5, #1
	b _021E87B0
_021E87AE:
	movs r5, #0
_021E87B0:
	adds r0, r4, #0
	bl ov99_021E89EC
	str r5, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r4, #0xac
	ldrb r1, [r4]
	movs r2, #0x1a
	movs r3, #0
	bl ov99_021E86D4
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov99_021E8788

	thumb_func_start ov99_021E87D0
ov99_021E87D0: @ 0x021E87D0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _021E87E2
	movs r0, #2
	b _021E87E4
_021E87E2:
	movs r0, #1
_021E87E4:
	lsls r0, r0, #0x1d
	lsrs r4, r0, #0x18
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #0x33
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	movs r2, #0
	adds r3, r4, #0
	bl FUN_02007BA4
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #0x33
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	movs r2, #4
	adds r3, r4, #0
	bl FUN_02007BA4
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov99_021E87D0

	thumb_func_start ov99_021E8818
ov99_021E8818: @ 0x021E8818
	push {r4, lr}
	adds r4, r0, #0
	bl ov99_021E89A4
	adds r0, r4, #0
	bl ov99_021E9038
	pop {r4, pc}
	thumb_func_end ov99_021E8818

	thumb_func_start ov99_021E8828
ov99_021E8828: @ 0x021E8828
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	bl ov99_021E89A4
	adds r0, r5, #0
	bl ov99_021E9038
	adds r0, r5, #0
	bl ov99_021E87D0
	ldr r6, _021E88D0 @ =0x021EA35A
	movs r4, #0
_021E8842:
	ldr r0, [r5, #0x10]
	adds r1, r4, #7
	bl FUN_0221EE84
	ldr r0, [r5, #0x10]
	adds r1, r4, #7
	bl FUN_0221EEDC
	adds r2, r5, #0
	adds r2, #0xb0
	ldr r2, [r2]
	ldr r0, [r5, #0x10]
	ldrb r2, [r6, r2]
	adds r1, r4, #7
	bl FUN_0221EEEC
	adds r4, r4, #1
	adds r6, r6, #2
	cmp r4, #5
	blt _021E8842
	adds r0, r5, #0
	movs r1, #0
	bl ov99_021E8FEC
	ldr r0, [r5, #4]
	movs r1, #6
	bl FUN_0201CAE0
	ldr r0, [r5, #0x1c]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x10]
	movs r1, #3
	bl FUN_0221EE84
	ldr r0, [r5, #0x10]
	movs r1, #6
	bl FUN_0221EE84
	ldr r0, [r5, #0x10]
	movs r1, #0x11
	bl FUN_0221EE84
	ldr r0, [r5, #0x10]
	movs r1, #0x12
	bl FUN_0221EE84
	adds r0, r5, #0
	bl ov99_021E9020
	movs r3, #1
	str r3, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #2
	movs r2, #0x3f
	bl FUN_0221EC08
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #5
	movs r2, #0x40
	movs r3, #0
	bl FUN_0221EC08
	movs r0, #0
	adds r5, #0xb4
	str r0, [r5]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E88D0: .4byte 0x021EA35A
	thumb_func_end ov99_021E8828

	thumb_func_start ov99_021E88D4
ov99_021E88D4: @ 0x021E88D4
	push {r3, lr}
	sub sp, #8
	movs r2, #0
	str r2, [sp]
	movs r1, #4
	str r1, [sp, #4]
	ldr r0, [r0, #0x10]
	movs r3, #1
	bl FUN_0221EBEC
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov99_021E88D4

	thumb_func_start ov99_021E88EC
ov99_021E88EC: @ 0x021E88EC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _021E89A0 @ =0x0000FFFF
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r4, r0
	bne _021E8900
	bl FUN_0202551C
_021E8900:
	movs r0, #0xac
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _021E8944
	adds r0, r4, #0
	movs r1, #0x1e
	blx FUN_020F2998
	adds r1, r0, #0
	lsls r1, r1, #0x18
	ldr r0, [r5, #0x10]
	lsrs r1, r1, #0x18
	movs r2, #3
	movs r3, #0
	bl FUN_0221EDA4
	adds r0, r4, #0
	movs r1, #0x1e
	blx FUN_020F2998
	movs r0, #0xa
	muls r0, r1, r0
	movs r1, #0x1e
	blx FUN_020F2998
	adds r1, r0, #0
	lsls r1, r1, #0x18
	movs r2, #1
	ldr r0, [r5, #0x10]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0221EDA4
	b _021E8984
_021E8944:
	cmp r0, #6
	ldr r0, [r5, #0x10]
	bne _021E897A
	lsrs r1, r4, #0xa
	movs r2, #3
	movs r3, #0
	bl FUN_0221EDA4
	lsrs r3, r4, #0x1f
	lsls r2, r4, #0x16
	subs r2, r2, r3
	movs r1, #0x16
	rors r2, r1
	adds r2, r3, r2
	adds r3, r2, #0
	movs r1, #0xa
	muls r3, r1, r3
	asrs r1, r3, #9
	lsrs r1, r1, #0x16
	adds r1, r3, r1
	movs r2, #1
	ldr r0, [r5, #0x10]
	asrs r1, r1, #0xa
	adds r3, r2, #0
	bl FUN_0221EDA4
	b _021E8984
_021E897A:
	adds r1, r4, #0
	movs r2, #3
	movs r3, #0
	bl FUN_0221EDA4
_021E8984:
	ldr r0, [sp, #0x18]
	movs r2, #0xac
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldrsb r2, [r5, r2]
	ldr r0, [r5, #0x10]
	adds r1, r6, #0
	adds r2, #0x56
	movs r3, #0
	bl FUN_0221ED48
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E89A0: .4byte 0x0000FFFF
	thumb_func_end ov99_021E88EC

	thumb_func_start ov99_021E89A4
ov99_021E89A4: @ 0x021E89A4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r1, #0
	adds r2, r4, #0
	str r1, [sp]
	adds r2, #0xb0
	ldr r2, [r2]
	ldr r0, [r4, #0x10]
	lsls r3, r2, #2
	ldr r2, _021E89E4 @ =0x021EA384
	ldr r2, [r2, r3]
	movs r3, #1
	bl FUN_0221EC08
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	adds r4, #0xb0
	ldr r2, [r4]
	movs r1, #1
	lsls r3, r2, #2
	ldr r2, _021E89E8 @ =0x021EA38C
	ldr r2, [r2, r3]
	adds r3, r1, #0
	bl FUN_0221EBEC
	add sp, #8
	pop {r4, pc}
	nop
_021E89E4: .4byte 0x021EA384
_021E89E8: .4byte 0x021EA38C
	thumb_func_end ov99_021E89A4

	thumb_func_start ov99_021E89EC
ov99_021E89EC: @ 0x021E89EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	bl FUN_0221EEFC
	adds r2, r5, #0
	adds r2, #0xac
	ldrb r2, [r2]
	movs r1, #0
	bl FUN_0200C9C8
	movs r3, #1
	str r3, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #2
	movs r2, #0x3e
	bl FUN_0221EC08
	movs r0, #1
	str r0, [sp]
	movs r3, #0
	str r3, [sp, #4]
	movs r2, #0xac
	ldrsb r2, [r5, r2]
	ldr r0, [r5, #0x10]
	movs r1, #5
	adds r2, #0x41
	bl FUN_0221EBEC
	ldr r0, [r5, #0x10]
	bl FUN_0221EEFC
	adds r1, r5, #0
	adds r1, #0xac
	adds r2, r5, #0
	adds r2, #0xb0
	adds r4, r0, #0
	ldrb r1, [r1]
	ldr r0, [r5]
	ldr r2, [r2]
	bl ov99_021E94FC
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r3, #7
	bl FUN_0200BFCC
	movs r0, #0
	str r0, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #3
	movs r2, #0x36
	movs r3, #1
	bl FUN_0221EC08
	movs r4, #0
	adds r7, r4, #0
_021E8A68:
	cmp r4, #0
	bne _021E8A7A
	adds r0, r5, #0
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	bne _021E8A7A
	movs r6, #1
	b _021E8A7C
_021E8A7A:
	movs r6, #0
_021E8A7C:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov99_021E8544
	cmp r0, #0
	bne _021E8AB2
	movs r1, #0xac
	adds r3, r5, #0
	adds r3, #0xb0
	lsls r2, r4, #0x18
	ldrsb r1, [r5, r1]
	ldr r0, [r5]
	ldr r3, [r3]
	lsrs r2, r2, #0x18
	bl ov99_021E94CC
	adds r1, r0, #0
	str r6, [sp]
	movs r3, #0xac
	ldrsb r3, [r5, r3]
	adds r0, r5, #0
	adds r2, r4, #7
	adds r3, #0x56
	bl ov99_021E88EC
	b _021E8ACA
_021E8AB2:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r7, [sp, #4]
	movs r2, #0xac
	ldrsb r2, [r5, r2]
	ldr r0, [r5, #0x10]
	adds r1, r4, #7
	adds r2, #0x60
	adds r3, r7, #0
	bl FUN_0221EBEC
_021E8ACA:
	adds r4, r4, #1
	cmp r4, #5
	blt _021E8A68
	adds r0, r5, #0
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _021E8B2A
	ldr r0, [r5, #0x10]
	movs r1, #6
	movs r2, #0x4b
	movs r3, #0
	bl FUN_0221EBD8
	adds r0, r5, #0
	bl ov99_021E9020
	movs r4, #0
	movs r6, #1
	adds r7, r4, #0
_021E8AF2:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov99_021E8544
	cmp r0, #0
	bne _021E8B20
	adds r1, r5, #0
	adds r1, #0xac
	ldrb r1, [r1]
	lsls r2, r4, #0x18
	ldr r0, [r5]
	lsrs r2, r2, #0x18
	bl ov99_021E9518
	adds r1, r4, #0
	str r6, [sp]
	adds r2, r0, #0
	ldr r0, [r5, #0x10]
	adds r1, #0xc
	adds r3, r7, #0
	bl FUN_0221EE9C
_021E8B20:
	adds r4, r4, #1
	cmp r4, #5
	blt _021E8AF2
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E8B2A:
	movs r0, #0xac
	ldrsb r1, [r5, r0]
	lsls r0, r1, #2
	adds r0, r5, r0
	adds r0, #0xbc
	ldr r0, [r0]
	cmp r0, #0
	beq _021E8B4C
	ldr r0, [r5, #0x10]
	movs r1, #0x11
	bl FUN_0221EE84
	ldr r0, [r5, #0x10]
	movs r1, #0x12
	bl FUN_0221EE84
	b _021E8B76
_021E8B4C:
	lsls r1, r1, #0x18
	ldr r0, [r5]
	lsrs r1, r1, #0x18
	bl ov99_021E82E4
	adds r3, r0, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	movs r1, #0x11
	movs r2, #0x6b
	bl FUN_0221ECD0
	ldr r0, [r5, #0x10]
	movs r1, #0x12
	movs r2, #0x6a
	movs r3, #0
	bl FUN_0221EBD8
_021E8B76:
	movs r0, #0xac
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _021E8B86
	ldr r0, [r5, #0x10]
	movs r1, #6
	bl FUN_0221EE84
_021E8B86:
	ldr r0, [r5]
	bl ov99_021E945C
	cmp r0, #0
	bne _021E8BC8
	movs r0, #0xac
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0xbc
	ldr r0, [r0]
	cmp r0, #0
	beq _021E8BB0
	ldr r0, [r5, #0x10]
	movs r1, #6
	movs r2, #0x6d
	movs r3, #0
	bl FUN_0221EBD8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E8BB0:
	ldr r0, [r5]
	bl ov99_021E9508
	str r0, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #6
	movs r2, #0x6c
	movs r3, #0
	bl FUN_0221EDC4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E8BC8:
	movs r1, #0xac
	ldrsb r1, [r5, r1]
	adds r0, r5, #0
	bl ov99_021E84EC
	cmp r0, #0
	beq _021E8BEE
	ldr r0, [r5]
	bl ov99_021E9508
	str r0, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #6
	movs r2, #0x6c
	movs r3, #0
	bl FUN_0221EDC4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E8BEE:
	movs r2, #0xac
	ldrsb r2, [r5, r2]
	ldr r0, [r5, #0x10]
	movs r1, #6
	adds r2, #0x4c
	movs r3, #0
	bl FUN_0221EBD8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov99_021E89EC

	thumb_func_start ov99_021E8C04
ov99_021E8C04: @ 0x021E8C04
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r5, _021E8C4C @ =0x021EA3AC
	add r3, sp, #0
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r1, r2, #0
	ldr r0, [r4, #0xc]
	movs r2, #0x25
	bl FUN_0221E5E0
	str r0, [r4, #0x14]
	adds r0, r4, #0
	bl ov99_021E8C88
	adds r0, r4, #0
	bl ov99_021E8D5C
	adds r0, r4, #0
	bl ov99_021E8D88
	adds r0, r4, #0
	bl ov99_021E8EBC
	adds r0, r4, #0
	bl ov99_021E8C50
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_021E8C4C: .4byte 0x021EA3AC
	thumb_func_end ov99_021E8C04

	thumb_func_start ov99_021E8C50
ov99_021E8C50: @ 0x021E8C50
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _021E8C60
	movs r5, #0
	b _021E8C76
_021E8C60:
	movs r0, #0xac
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, #0xbc
	ldr r0, [r0]
	cmp r0, #0
	bne _021E8C74
	movs r5, #1
	b _021E8C76
_021E8C74:
	movs r5, #0
_021E8C76:
	adds r0, r4, #0
	bl ov99_021E8F50
	ldr r0, [r4, #0x1c]
	adds r1, r5, #0
	bl FUN_0200DCE8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov99_021E8C50

	thumb_func_start ov99_021E8C88
ov99_021E8C88: @ 0x021E8C88
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	bl FUN_0221E5C0
	adds r4, r0, #0
	ldr r0, [r5, #0x14]
	bl FUN_0221E5D0
	adds r6, r0, #0
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200D504
	movs r3, #0
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #2
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #3
	bl FUN_0200D71C
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0xc
	bl FUN_0200D5D4
	movs r1, #1
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0xd
	bl FUN_0200D504
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0xe
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0xf
	bl FUN_0200D71C
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x14]
	ldr r1, _021E8D58 @ =0x021EA364
	movs r2, #0xf
	movs r3, #0
	bl FUN_0221E8A8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E8D58: .4byte 0x021EA364
	thumb_func_end ov99_021E8C88

	thumb_func_start ov99_021E8D5C
ov99_021E8D5C: @ 0x021E8D5C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _021E8D84 @ =0x021EA3F4
	movs r6, #0
	adds r5, r7, #0
_021E8D66:
	ldr r0, [r7, #0x14]
	adds r1, r4, #0
	bl FUN_0221E6E0
	movs r1, #1
	str r0, [r5, #0x18]
	bl FUN_0200DC78
	adds r6, r6, #1
	adds r4, #0x34
	adds r5, r5, #4
	cmp r6, #2
	blt _021E8D66
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8D84: .4byte 0x021EA3F4
	thumb_func_end ov99_021E8D5C

	thumb_func_start ov99_021E8D88
ov99_021E8D88: @ 0x021E8D88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	adds r5, r0, #0
	movs r0, #0
	add r2, sp, #0x2c
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	str r0, [sp, #0x20]
	str r0, [r2]
	str r0, [sp, #0x18]
	movs r0, #0x48
	str r0, [sp, #0x14]
	movs r0, #6
	str r0, [sp, #0x10]
_021E8DAE:
	movs r0, #0
	str r0, [sp, #0x1c]
	movs r0, #0x20
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	movs r7, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x24]
_021E8DCC:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	movs r2, #0x18
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _021E8EB8 @ =0x021EA394
	add r1, sp, #0x40
	blx FUN_020D4A50
	movs r0, #1
	str r0, [sp, #0x3c]
	ldr r1, [sp, #0xc]
	add r0, sp, #0x2c
	strh r1, [r0]
	ldr r1, [sp, #0x24]
	strh r1, [r0, #2]
	movs r0, #0
	str r0, [sp, #0x34]
	movs r1, #0x10
	add r0, sp, #0x2c
	strh r1, [r0, #6]
	adds r0, r4, #0
	adds r0, #0xc
	lsls r0, r0, #2
	adds r6, r5, r0
	ldr r0, [r5, #0x14]
	add r1, sp, #0x2c
	bl FUN_0221E6E0
	str r0, [r6, #0x18]
	lsls r0, r4, #2
	str r0, [sp, #0x28]
	adds r0, r5, r0
	adds r0, #0xbc
	ldr r0, [r0]
	cmp r0, #0
	bne _021E8E1C
	movs r1, #1
	b _021E8E1E
_021E8E1C:
	movs r1, #0
_021E8E1E:
	ldr r0, [r6, #0x18]
	bl FUN_0200DCE8
	movs r0, #1
	str r0, [sp, #0x34]
	movs r1, #4
	add r0, sp, #0x2c
	strh r1, [r0, #6]
	adds r0, r4, #2
	lsls r0, r0, #2
	adds r6, r5, r0
	ldr r0, [r5, #0x14]
	add r1, sp, #0x2c
	bl FUN_0221E6E0
	lsls r1, r4, #0x18
	str r0, [r6, #0x18]
	adds r0, r5, #0
	asrs r1, r1, #0x18
	movs r2, #1
	bl ov99_021E8518
	adds r1, r0, #0
	ldr r0, [r6, #0x18]
	bl FUN_0200DCE8
	ldr r0, [r6, #0x18]
	movs r1, #1
	bl FUN_0200DC78
	ldr r0, [sp, #0x28]
	adds r0, r5, r0
	adds r0, #0xbc
	ldr r0, [r0]
	cmp r0, #0
	bne _021E8E6A
	movs r0, #1
	b _021E8E6C
_021E8E6A:
	movs r0, #0
_021E8E6C:
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	lsls r2, r7, #0x10
	lsrs r2, r2, #0x10
	lsls r2, r2, #0x10
	ldr r3, [sp, #8]
	adds r0, r5, #0
	adds r1, r4, #0
	asrs r2, r2, #0x10
	bl ov99_021E86D4
	ldr r0, [sp, #0xc]
	adds r7, r7, #6
	adds r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #5
	blo _021E8DCC
	ldr r0, [sp, #0x18]
	adds r0, r0, #5
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	adds r0, #0x40
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r0, #8
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x20]
	adds r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #2
	bhs _021E8EB4
	b _021E8DAE
_021E8EB4:
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E8EB8: .4byte 0x021EA394
	thumb_func_end ov99_021E8D88

	thumb_func_start ov99_021E8EBC
ov99_021E8EBC: @ 0x021E8EBC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r6, r0, #0
	movs r0, #0
	add r2, sp, #0x14
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	str r0, [sp, #0xc]
	str r0, [r2]
	str r0, [sp, #8]
	str r0, [sp, #4]
	movs r0, #0x2c
	str r0, [sp]
_021E8EE0:
	ldr r0, [sp]
	movs r4, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x3c
	str r0, [sp, #0x10]
_021E8EEC:
	ldr r0, [sp, #8]
	adds r0, r4, r0
	adds r1, r0, #2
	str r1, [sp, #0x28]
	movs r1, #2
	str r1, [sp, #0x2c]
	str r1, [sp, #0x30]
	str r1, [sp, #0x34]
	str r1, [sp, #0x24]
	ldr r1, [sp, #4]
	adds r0, #0x16
	adds r2, r5, r1
	add r1, sp, #0x14
	strh r2, [r1]
	ldr r2, [sp, #0x10]
	lsls r0, r0, #2
	strh r2, [r1, #2]
	movs r1, #3
	subs r1, r1, r4
	str r1, [sp, #0x1c]
	adds r7, r6, r0
	ldr r0, [r6, #0x14]
	add r1, sp, #0x14
	bl FUN_0221E6E0
	movs r1, #1
	str r0, [r7, #0x18]
	bl FUN_0200DC78
	adds r4, r4, #1
	adds r5, #0x18
	cmp r4, #3
	blo _021E8EEC
	ldr r0, [sp, #8]
	adds r0, r0, #3
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	adds r0, #8
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #5
	blo _021E8EE0
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov99_021E8EBC

	thumb_func_start ov99_021E8F50
ov99_021E8F50: @ 0x021E8F50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	movs r7, #0
	adds r5, r0, #0
	str r7, [sp, #8]
_021E8F5A:
	movs r1, #0xac
	adds r3, r5, #0
	adds r3, #0xb0
	lsls r2, r7, #0x18
	ldrsb r1, [r5, r1]
	ldr r0, [r5]
	ldr r3, [r3]
	lsrs r2, r2, #0x18
	bl ov99_021E94CC
	ldr r1, _021E8FE8 @ =0x0000FFFF
	cmp r0, r1
	beq _021E8FD6
	movs r4, #0
_021E8F76:
	movs r1, #0
	add r0, sp, #0xc
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [sp, #8]
	str r4, [sp]
	adds r6, r4, r0
	adds r0, r5, #0
	adds r0, #0xb0
	ldr r0, [r0]
	movs r2, #0xac
	str r0, [sp, #4]
	ldrsb r2, [r5, r2]
	ldr r0, [r5]
	add r1, sp, #0xc
	adds r3, r7, #0
	adds r6, #0x16
	bl ov99_021E9464
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x17
	beq _021E8FD0
	lsls r0, r6, #2
	adds r6, r5, r0
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x14]
	ldr r1, [r6, #0x18]
	add r2, sp, #0xc
	movs r3, #0
	bl FUN_0221E970
	ldr r0, [r6, #0x18]
	movs r1, #1
	bl FUN_0200DCE8
	cmp r7, #0
	bne _021E8FD0
	movs r1, #6
	ldr r0, [r6, #0x18]
	lsls r1, r1, #0xa
	bl FUN_0200DC8C
_021E8FD0:
	adds r4, r4, #1
	cmp r4, #3
	blt _021E8F76
_021E8FD6:
	ldr r0, [sp, #8]
	adds r7, r7, #1
	adds r0, r0, #3
	str r0, [sp, #8]
	cmp r7, #5
	blt _021E8F5A
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8FE8: .4byte 0x0000FFFF
	thumb_func_end ov99_021E8F50

	thumb_func_start ov99_021E8FEC
ov99_021E8FEC: @ 0x021E8FEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r4, #0
	str r0, [sp]
	adds r7, r1, #0
	str r4, [sp, #4]
_021E8FF8:
	ldr r0, [sp]
	lsls r1, r4, #2
	movs r6, #0
	adds r5, r0, r1
_021E9000:
	ldr r0, [r5, #0x70]
	adds r1, r7, #0
	bl FUN_0200DCE8
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #3
	blt _021E9000
	ldr r0, [sp, #4]
	adds r4, r4, #3
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #5
	blt _021E8FF8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov99_021E8FEC

	thumb_func_start ov99_021E9020
ov99_021E9020: @ 0x021E9020
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021E9026:
	adds r1, r4, #0
	ldr r0, [r5, #0x10]
	adds r1, #0xc
	bl FUN_0221EE84
	adds r4, r4, #1
	cmp r4, #5
	blt _021E9026
	pop {r3, r4, r5, pc}
	thumb_func_end ov99_021E9020

	thumb_func_start ov99_021E9038
ov99_021E9038: @ 0x021E9038
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x10]
	movs r0, #6
	str r0, [sp, #0xc]
_021E9048:
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	movs r7, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
_021E905A:
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _021E9072
	movs r6, #1
	b _021E9084
_021E9072:
	lsls r1, r4, #2
	adds r1, r5, r1
	adds r1, #0xbc
	ldr r1, [r1]
	cmp r1, #0
	bne _021E9082
	movs r6, #1
	b _021E9084
_021E9082:
	movs r6, #0
_021E9084:
	adds r2, r4, #0
	adds r2, #0xc
	cmp r0, #0
	beq _021E9090
	movs r1, #0
	b _021E9092
_021E9090:
	adds r1, r6, #0
_021E9092:
	lsls r0, r2, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	bl FUN_0200DCE8
	lsls r1, r4, #0x18
	adds r0, r5, #0
	asrs r1, r1, #0x18
	movs r2, #1
	bl ov99_021E8518
	adds r1, r0, #0
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x20]
	bl FUN_0200DCE8
	lsls r2, r7, #0x10
	lsrs r2, r2, #0x10
	lsls r2, r2, #0x10
	str r6, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r5, #0
	adds r1, r4, #0
	asrs r2, r2, #0x10
	bl ov99_021E86D4
	ldr r0, [sp, #0x14]
	adds r7, r7, #6
	adds r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #5
	blo _021E905A
	ldr r0, [sp, #0x10]
	adds r0, r0, #5
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	adds r0, #8
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #2
	blo _021E9048
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov99_021E9038

	thumb_func_start ov99_021E90F4
ov99_021E90F4: @ 0x021E90F4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xac
	ldrsb r4, [r5, r0]
	ldr r0, _021E92DC @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021E9154
	ldr r0, _021E92E0 @ =0x021EA3C4
	bl FUN_0202529C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021E9114
	b _021E923A
_021E9114:
	subs r1, r0, #1
	adds r0, r5, #0
	adds r0, #0xac
	strb r1, [r0]
	ldr r0, [r5, #0x18]
	movs r1, #0xb
	bl FUN_0200DC4C
	ldr r0, _021E92E4 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0xac
	ldrsb r1, [r5, r0]
	subs r0, #0xad
	cmp r1, r0
	bne _021E914A
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0xb4
	str r1, [r0]
	ldr r0, [r5, #0x18]
	movs r1, #0xd
	bl FUN_0200DC4C
	ldr r0, _021E92E4 @ =0x000005DC
	bl FUN_0200604C
_021E914A:
	ldr r0, [r5, #0x18]
	movs r1, #1
	bl FUN_0200DC78
	b _021E923A
_021E9154:
	ldr r0, _021E92E8 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r1, r0
	beq _021E9176
	cmp r4, #0xa
	bne _021E9164
	b _021E92D8
_021E9164:
	subs r1, r0, #2
	cmp r4, r1
	bne _021E9176
	adds r1, r5, #0
	adds r1, #0xb4
	str r0, [r1]
	ldr r0, _021E92E4 @ =0x000005DC
	bl FUN_0200604C
_021E9176:
	movs r0, #0xac
	ldrsb r1, [r5, r0]
	subs r0, #0xad
	cmp r1, r0
	bne _021E9196
	ldr r0, _021E92E8 @ =0x021D110C
	ldr r1, [r0, #0x40]
	movs r0, #0x80
	tst r0, r1
	beq _021E923A
	movs r0, #0xad
	ldrsb r1, [r5, r0]
	adds r0, r5, #0
	adds r0, #0xac
	strb r1, [r0]
	b _021E923A
_021E9196:
	cmp r1, #0xa
	bne _021E91B2
	ldr r0, _021E92E8 @ =0x021D110C
	ldr r1, [r0, #0x40]
	movs r0, #0x40
	tst r0, r1
	beq _021E923A
	movs r0, #0xad
	ldrsb r0, [r5, r0]
	adds r1, r0, #5
	adds r0, r5, #0
	adds r0, #0xac
	strb r1, [r0]
	b _021E923A
_021E91B2:
	ldr r0, _021E92E8 @ =0x021D110C
	movs r2, #0x10
	ldr r0, [r0, #0x40]
	tst r2, r0
	beq _021E91C6
	adds r0, r5, #0
	adds r1, r1, #1
	adds r0, #0xac
	strb r1, [r0]
	b _021E9202
_021E91C6:
	movs r2, #0x20
	tst r2, r0
	beq _021E91D6
	adds r0, r5, #0
	subs r1, r1, #1
	adds r0, #0xac
	strb r1, [r0]
	b _021E9202
_021E91D6:
	movs r2, #0x80
	tst r2, r0
	beq _021E91E6
	adds r0, r5, #0
	adds r1, r1, #5
	adds r0, #0xac
	strb r1, [r0]
	b _021E9202
_021E91E6:
	movs r2, #0x40
	tst r0, r2
	beq _021E9202
	cmp r1, #0xa
	bne _021E91F4
	movs r1, #1
	b _021E91F6
_021E91F4:
	movs r1, #5
_021E91F6:
	movs r0, #0xac
	ldrsb r0, [r5, r0]
	subs r1, r0, r1
	adds r0, r5, #0
	adds r0, #0xac
	strb r1, [r0]
_021E9202:
	movs r1, #0xac
	ldrsb r2, [r5, r1]
	cmp r2, #0xa
	ble _021E920E
	movs r2, #0xa
	b _021E921A
_021E920E:
	adds r0, r1, #0
	subs r0, #0xad
	cmp r2, r0
	bge _021E921A
	adds r2, r1, #0
	subs r2, #0xad
_021E921A:
	adds r0, r5, #0
	adds r0, #0xac
	movs r1, #0xac
	strb r2, [r0]
	ldrsb r0, [r5, r1]
	subs r1, #0xad
	cmp r0, r1
	beq _021E923A
	cmp r0, #0xa
	beq _021E923A
	movs r1, #5
	blx FUN_020F2998
	adds r0, r5, #0
	adds r0, #0xad
	strb r1, [r0]
_021E923A:
	movs r0, #0xac
	ldrsb r0, [r5, r0]
	cmp r4, r0
	beq _021E92D6
	ldr r0, _021E92E4 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0xac
	ldrsb r1, [r5, r0]
	subs r0, #0xad
	cmp r1, r0
	bne _021E9266
	ldr r0, [r5, #0x18]
	movs r1, #0xe0
	movs r2, #0x10
	bl FUN_0200DDB8
	ldr r0, [r5, #0x18]
	movs r1, #0xc
	bl FUN_0200DC4C
	b _021E92D6
_021E9266:
	cmp r1, #0xa
	bne _021E927E
	ldr r0, [r5, #0x18]
	movs r1, #0xe0
	movs r2, #0xb0
	bl FUN_0200DDB8
	ldr r0, [r5, #0x18]
	movs r1, #0xc
	bl FUN_0200DC4C
	b _021E92D6
_021E927E:
	cmp r1, #5
	blt _021E9286
	movs r2, #1
	b _021E9288
_021E9286:
	movs r2, #0
_021E9288:
	cmp r2, #0
	beq _021E9292
	subs r0, r1, #5
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
_021E9292:
	movs r3, #0x30
	muls r3, r1, r3
	lsls r2, r2, #6
	adds r3, #0x20
	adds r2, #0x48
	lsls r1, r3, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r5, #0x18]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r0, [r5, #0x18]
	bl FUN_0200DC64
	cmp r0, #0xb
	beq _021E92BC
	ldr r0, [r5, #0x18]
	movs r1, #0xa
	bl FUN_0200DC4C
_021E92BC:
	cmp r4, #0xa
	bne _021E92C8
	movs r0, #0xac
	ldrsb r0, [r5, r0]
	cmp r0, #9
	beq _021E92D6
_021E92C8:
	adds r0, r5, #0
	movs r1, #0
	bl ov99_021E8FEC
	movs r0, #1
	adds r5, #0xb8
	str r0, [r5]
_021E92D6:
	movs r0, #0
_021E92D8:
	pop {r3, r4, r5, pc}
	nop
_021E92DC: .4byte 0x021D114C
_021E92E0: .4byte 0x021EA3C4
_021E92E4: .4byte 0x000005DC
_021E92E8: .4byte 0x021D110C
	thumb_func_end ov99_021E90F4

	thumb_func_start ov99_021E92EC
ov99_021E92EC: @ 0x021E92EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r0, [sp]
	str r1, [sp, #4]
	adds r0, r1, #0
	str r2, [sp, #8]
	adds r1, r2, #0
	movs r2, #0x6e
	lsls r2, r2, #2
	blx FUN_020D4A50
	ldr r1, _021E93D8 @ =0x021EA350
	movs r0, #0
	str r0, [sp, #0xc]
	ldrh r2, [r1, #4]
	add r0, sp, #0x20
	strh r2, [r0]
	ldrh r2, [r1, #6]
	ldrh r1, [r1, #8]
	strh r2, [r0, #2]
	strh r1, [r0, #4]
_021E9316:
	ldr r0, [sp, #0xc]
	movs r6, #0
	lsls r0, r0, #0x18
	ldr r4, [sp, #4]
	lsrs r5, r0, #0x18
	adds r7, r6, #0
_021E9322:
	ldrh r2, [r4]
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_0221EFB4
	cmp r0, #0
	beq _021E9338
	adds r6, r6, #1
	adds r4, #8
	cmp r6, #5
	blt _021E9322
_021E9338:
	cmp r6, #0
	bne _021E9344
	ldr r0, [sp]
	movs r1, #1
	adds r0, #0xbc
	str r1, [r0]
_021E9344:
	add r0, sp, #0x20
	ldrh r0, [r0]
	ldr r4, [sp, #8]
	ldr r5, [sp, #4]
	str r0, [sp, #0x10]
	add r0, sp, #0x20
	ldrh r0, [r0, #2]
	movs r7, #0
	str r0, [sp, #0x14]
	add r0, sp, #0x20
	ldrh r0, [r0, #4]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x1c]
_021E9364:
	cmp r7, r6
	bne _021E938E
	ldr r1, [sp, #0x10]
	add r0, sp, #0x20
	strh r1, [r0, #6]
	ldr r1, [sp, #0x14]
	movs r2, #6
	strh r1, [r0, #8]
	ldr r1, [sp, #0x18]
	strh r1, [r0, #0xa]
	add r0, sp, #0x24
	adds r0, #2
	adds r1, r4, #2
	blx FUN_020D4A50
	ldr r0, [sp, #0x1c]
	movs r1, #0
	bl FUN_0221EFA4
	strh r0, [r4]
	b _021E93AC
_021E938E:
	cmp r7, r6
	ble _021E93AC
	adds r0, r5, #0
	subs r0, #8
	ldrh r0, [r0]
	strh r0, [r4]
	subs r0, r5, #6
	ldrh r0, [r0]
	strh r0, [r4, #2]
	subs r0, r5, #4
	ldrh r0, [r0]
	strh r0, [r4, #4]
	subs r0, r5, #2
	ldrh r0, [r0]
	strh r0, [r4, #6]
_021E93AC:
	adds r7, r7, #1
	adds r4, #8
	adds r5, #8
	cmp r7, #5
	blt _021E9364
	ldr r0, [sp, #4]
	adds r0, #0x2c
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #8]
	adds r0, #0x2c
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0xa
	blt _021E9316
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_021E93D8: .4byte 0x021EA350
	thumb_func_end ov99_021E92EC

	thumb_func_start ov99_021E93DC
ov99_021E93DC: @ 0x021E93DC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #7
	ldr r0, [r5, #0xc]
	lsls r1, r1, #6
	bl FUN_0201AA8C
	movs r2, #7
	adds r4, r0, #0
	movs r1, #0
	lsls r2, r2, #6
	blx FUN_020D4994
	str r6, [r4]
	ldr r1, [r6]
	adds r0, r5, #0
	adds r2, r4, #4
	bl ov99_021E92EC
	ldr r1, [r5, #0xc]
	movs r0, #8
	bl FUN_02026354
	movs r1, #0x6f
	lsls r1, r1, #2
	str r0, [r4, r1]
	str r4, [r5]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov99_021E93DC

	thumb_func_start ov99_021E9418
ov99_021E9418: @ 0x021E9418
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov99_021E9418

	thumb_func_start ov99_021E9430
ov99_021E9430: @ 0x021E9430
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0xa
	blo _021E9440
	bl FUN_0202551C
_021E9440:
	cmp r6, #0
	beq _021E9450
	ldr r0, [r5]
	ldr r1, [r0, #4]
	movs r0, #0xa4
	muls r0, r4, r0
	adds r0, r1, r0
	pop {r4, r5, r6, pc}
_021E9450:
	adds r1, r5, #4
	movs r0, #0x2c
	muls r0, r4, r0
	adds r0, r1, r0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov99_021E9430

	thumb_func_start ov99_021E945C
ov99_021E945C: @ 0x021E945C
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bx lr
	.align 2, 0
	thumb_func_end ov99_021E945C

	thumb_func_start ov99_021E9464
ov99_021E9464: @ 0x021E9464
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	cmp r6, #0
	bne _021E9476
	bl FUN_0202551C
_021E9476:
	cmp r4, #5
	blt _021E947E
	bl FUN_0202551C
_021E947E:
	ldr r0, [sp, #0x18]
	cmp r0, #3
	blt _021E9488
	bl FUN_0202551C
_021E9488:
	lsls r1, r7, #0x18
	ldr r2, [sp, #0x1c]
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	bl ov99_021E9430
	lsls r1, r4, #3
	adds r1, r0, r1
	ldr r0, [sp, #0x18]
	ldr r2, [r5]
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0, #2]
	ldr r1, _021E94C4 @ =0xFFFFFE00
	adds r3, r2, #0
	lsrs r2, r1, #0x16
	ands r3, r1
	ands r2, r0
	lsrs r1, r1, #0x17
	ands r1, r2
	adds r2, r3, #0
	orrs r2, r1
	ldr r1, _021E94C8 @ =0xFFFFC1FF
	asrs r0, r0, #0xa
	lsls r0, r0, #0x1b
	ands r1, r2
	lsrs r0, r0, #0x12
	orrs r0, r1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E94C4: .4byte 0xFFFFFE00
_021E94C8: .4byte 0xFFFFC1FF
	thumb_func_end ov99_021E9464

	thumb_func_start ov99_021E94CC
ov99_021E94CC: @ 0x021E94CC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	bne _021E94DE
	bl FUN_0202551C
_021E94DE:
	cmp r4, #5
	blo _021E94E6
	bl FUN_0202551C
_021E94E6:
	lsls r1, r6, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r2, r7, #0
	bl ov99_021E9430
	adds r1, r4, #0
	bl FUN_0221F01C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov99_021E94CC

	thumb_func_start ov99_021E94FC
ov99_021E94FC: @ 0x021E94FC
	push {r3, lr}
	bl ov99_021E9430
	ldr r0, [r0, #0x28]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov99_021E94FC

	thumb_func_start ov99_021E9508
ov99_021E9508: @ 0x021E9508
	push {r4, lr}
	adds r4, r0, #0
	bne _021E9512
	bl FUN_0202551C
_021E9512:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	pop {r4, pc}
	thumb_func_end ov99_021E9508

	thumb_func_start ov99_021E9518
ov99_021E9518: @ 0x021E9518
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r5, #0
	bne _021E9528
	bl FUN_0202551C
_021E9528:
	ldr r1, [r5]
	movs r0, #0x6f
	ldr r2, [r1, #4]
	movs r1, #0xa4
	muls r1, r4, r1
	adds r2, r2, r1
	lsls r0, r0, #2
	movs r1, #0x18
	ldr r0, [r5, r0]
	adds r2, #0x30
	muls r1, r6, r1
	adds r1, r2, r1
	bl FUN_020269A0
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	pop {r4, r5, r6, pc}
	thumb_func_end ov99_021E9518

	.rodata

_021E954C:
	.byte 0x00, 0x01, 0x02, 0x03
	.byte 0x04, 0x05, 0x06, 0x07, 0x07, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x10, 0x00, 0xF0, 0x00, 0x30, 0x00, 0xD0, 0x00, 0x50, 0x00
	.byte 0xF0, 0x00, 0x70, 0x00, 0xD0, 0x00, 0x90, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFE, 0xD0, 0x10, 0x10
	.byte 0xFE, 0xF0, 0x30, 0x10, 0xFE, 0xD0, 0x50, 0x10, 0xFE, 0xF0, 0x70, 0x10, 0xFE, 0xD0, 0x90, 0x10
	.byte 0xA0, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00, 0x45, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x47, 0x00, 0x00, 0x00
	.byte 0x42, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x06, 0x0A, 0x03, 0x02, 0x09, 0x0A, 0x08, 0x09, 0x01, 0x0A, 0x07, 0x06, 0x03, 0x0A
	.byte 0x05, 0x04, 0x00, 0x0A, 0x00, 0x05, 0x04, 0x06, 0x05, 0x04, 0x01, 0x08, 0x09, 0x08, 0x01, 0x03
	.byte 0x03, 0x02, 0x09, 0x07, 0x06, 0x07, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x38, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00
	.byte 0x68, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x58, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x02, 0x0C, 0x01, 0x00
	.byte 0x00, 0x00, 0x16, 0x0E, 0x02, 0x0C, 0x1D, 0x00, 0x00, 0x19, 0x15, 0x06, 0x02, 0x0C, 0x39, 0x00
	.byte 0x06, 0x07, 0x00, 0x12, 0x02, 0x0C, 0x01, 0x00, 0x06, 0x02, 0x02, 0x1C, 0x02, 0x0C, 0x25, 0x00
	.byte 0x06, 0x03, 0x06, 0x0E, 0x02, 0x0C, 0x5D, 0x00, 0x06, 0x03, 0x08, 0x0E, 0x02, 0x0C, 0x79, 0x00
	.byte 0x06, 0x03, 0x0A, 0x0E, 0x02, 0x0C, 0x95, 0x00, 0x06, 0x16, 0x06, 0x08, 0x02, 0x0C, 0xB1, 0x00
	.byte 0x06, 0x16, 0x08, 0x08, 0x02, 0x0C, 0xC1, 0x00, 0x06, 0x16, 0x0A, 0x08, 0x02, 0x0C, 0xD1, 0x00
	.byte 0x06, 0x07, 0x0C, 0x0E, 0x02, 0x0C, 0xE1, 0x00, 0x06, 0x16, 0x0C, 0x08, 0x02, 0x0C, 0xFD, 0x00
	.byte 0x06, 0x1A, 0x16, 0x06, 0x02, 0x0C, 0x0D, 0x01, 0x06, 0x04, 0x10, 0x0C, 0x02, 0x0C, 0x19, 0x01
	.byte 0x06, 0x05, 0x13, 0x0C, 0x02, 0x0C, 0x31, 0x01, 0x06, 0x06, 0x16, 0x0C, 0x02, 0x0C, 0x49, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x02
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x03, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x05, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1D, 0x01
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0x10, 0x00, 0x00, 0x00, 0x08, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x50, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xF0, 0x00, 0x70, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x90, 0x00, 0x00, 0x00, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x10, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x30, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0x50, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x70, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x90, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x40, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x38, 0x00, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x78, 0x00, 0x98, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x68, 0x00, 0x98, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x58, 0x00, 0x98, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x38, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x60, 0x00, 0x00, 0x00, 0x0B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x98, 0x00
	.byte 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0x95, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x95, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0x95, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x98, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x04, 0x05, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x94, 0x11, 0x00, 0x00, 0x68, 0x10, 0x00, 0x00, 0xA0, 0x0F, 0x00, 0x00
	.byte 0xD8, 0x0E, 0x00, 0x00, 0x10, 0x0E, 0x00, 0x00, 0x48, 0x0D, 0x00, 0x00, 0xE4, 0x0C, 0x00, 0x00
	.byte 0x80, 0x0C, 0x00, 0x00, 0x1C, 0x0C, 0x00, 0x00, 0xB8, 0x0B, 0x00, 0x00, 0xD8, 0x00, 0x28, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x18, 0x02, 0x0C, 0x01, 0x00, 0x01, 0x01, 0x02, 0x10, 0x02, 0x0C, 0x31, 0x00
	.byte 0x01, 0x01, 0x06, 0x10, 0x02, 0x0C, 0x51, 0x00, 0x01, 0x01, 0x0A, 0x10, 0x02, 0x0C, 0x71, 0x00
	.byte 0x01, 0x01, 0x0E, 0x10, 0x02, 0x0C, 0x91, 0x00, 0x01, 0x18, 0x12, 0x08, 0x02, 0x0C, 0xB1, 0x00
	.byte 0x01, 0x01, 0x12, 0x16, 0x06, 0x0C, 0xC1, 0x00, 0x01, 0x19, 0x15, 0x06, 0x02, 0x0C, 0x45, 0x01
	.byte 0x05, 0x01, 0x00, 0x14, 0x02, 0x0C, 0x01, 0x00, 0x05, 0x01, 0x02, 0x1E, 0x02, 0x0C, 0x29, 0x00
	.byte 0x05, 0x01, 0x05, 0x1F, 0x02, 0x0C, 0x65, 0x00, 0x05, 0x01, 0x08, 0x1F, 0x02, 0x0C, 0xA3, 0x00
	.byte 0x05, 0x01, 0x0B, 0x1E, 0x02, 0x0C, 0xE1, 0x00, 0x05, 0x03, 0x0E, 0x0A, 0x02, 0x0C, 0x1D, 0x01
	.byte 0x05, 0x18, 0x16, 0x08, 0x02, 0x0C, 0x31, 0x01, 0x20, 0x00, 0x30, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x44, 0x63, 0x00, 0x1F, 0x44, 0x63, 0xE0, 0xFF, 0xFF, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x21, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xA9, 0x7C, 0x1E, 0x02, 0xC9, 0x7C, 0x1E, 0x02, 0xCD, 0x7C, 0x1E, 0x02, 0xD9, 0x7C, 0x1E, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x0C
	.byte 0x02, 0x0C, 0x01, 0x00, 0x01, 0x00, 0x14, 0x12, 0x02, 0x0C, 0x19, 0x00, 0x01, 0x00, 0x16, 0x18
	.byte 0x02, 0x0C, 0x3D, 0x00, 0x01, 0x0F, 0x00, 0x05, 0x02, 0x0C, 0x6D, 0x00, 0x01, 0x19, 0x15, 0x06
	.byte 0x02, 0x0C, 0x77, 0x00, 0x05, 0x07, 0x01, 0x14, 0x02, 0x0C, 0x01, 0x00, 0x05, 0x0F, 0x05, 0x0B
	.byte 0x02, 0x0C, 0x29, 0x00, 0x05, 0x11, 0x09, 0x0B, 0x02, 0x0C, 0x3F, 0x00, 0x05, 0x12, 0x0D, 0x0B
	.byte 0x02, 0x0C, 0x55, 0x00, 0x05, 0x11, 0x11, 0x0B, 0x02, 0x0C, 0x6B, 0x00, 0x05, 0x0F, 0x15, 0x0B
	.byte 0x02, 0x0C, 0x81, 0x00, 0x06, 0x02, 0x12, 0x08, 0x04, 0x01, 0x00, 0x02, 0x1C, 0x33, 0x20, 0x3F
	.byte 0x1C, 0x33, 0x40, 0x5F, 0x1C, 0x33, 0x60, 0x7F, 0x1C, 0x33, 0x80, 0x9F, 0x1C, 0x33, 0xA0, 0xBF
	.byte 0x1C, 0x33, 0xC0, 0xDF, 0x34, 0x4B, 0x20, 0x3F, 0x34, 0x4B, 0x40, 0x5F, 0x34, 0x4B, 0x60, 0x7F
	.byte 0x34, 0x4B, 0x80, 0x9F, 0x34, 0x4B, 0xA0, 0xBF, 0x34, 0x4B, 0xC0, 0xDF, 0x4C, 0x63, 0x20, 0x3F
	.byte 0x4C, 0x63, 0x40, 0x5F, 0x4C, 0x63, 0x60, 0x7F, 0x4C, 0x63, 0x80, 0x9F, 0x4C, 0x63, 0xA0, 0xBF
	.byte 0x4C, 0x63, 0xC0, 0xDF, 0x64, 0x7B, 0x20, 0x3F, 0x64, 0x7B, 0x40, 0x5F, 0x64, 0x7B, 0x60, 0x7F
	.byte 0x64, 0x7B, 0x80, 0x9F, 0x64, 0x7B, 0xA0, 0xBF, 0x64, 0x7B, 0xC0, 0xDF, 0x7C, 0x93, 0x20, 0x3F
	.byte 0x7C, 0x93, 0x40, 0x5F, 0x7C, 0x93, 0x60, 0x7F, 0x7C, 0x93, 0x80, 0x9F, 0x7C, 0x93, 0xA0, 0xBF
	.byte 0x7C, 0x93, 0xC0, 0xDF, 0xA0, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x03, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x05, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x04, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x24, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x54, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x54, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x70, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x21, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x30, 0x24, 0x00, 0x00, 0x00, 0x06, 0x00, 0x01, 0x50, 0x24, 0x00, 0x00, 0x01, 0x07, 0x00, 0x02
	.byte 0x70, 0x24, 0x00, 0x00, 0x02, 0x08, 0x01, 0x03, 0x90, 0x24, 0x00, 0x00, 0x03, 0x09, 0x02, 0x04
	.byte 0xB0, 0x24, 0x00, 0x00, 0x04, 0x0A, 0x03, 0x05, 0xD0, 0x24, 0x00, 0x00, 0x05, 0x0B, 0x04, 0x05
	.byte 0x30, 0x3C, 0x00, 0x00, 0x00, 0x0C, 0x06, 0x07, 0x50, 0x3C, 0x00, 0x00, 0x01, 0x0D, 0x06, 0x08
	.byte 0x70, 0x3C, 0x00, 0x00, 0x02, 0x0E, 0x07, 0x09, 0x90, 0x3C, 0x00, 0x00, 0x03, 0x0F, 0x08, 0x0A
	.byte 0xB0, 0x3C, 0x00, 0x00, 0x04, 0x10, 0x09, 0x0B, 0xD0, 0x3C, 0x00, 0x00, 0x05, 0x11, 0x0A, 0x0B
	.byte 0x30, 0x54, 0x00, 0x00, 0x06, 0x12, 0x0C, 0x0D, 0x50, 0x54, 0x00, 0x00, 0x07, 0x13, 0x0C, 0x0E
	.byte 0x70, 0x54, 0x00, 0x00, 0x08, 0x14, 0x0D, 0x0F, 0x90, 0x54, 0x00, 0x00, 0x09, 0x15, 0x0E, 0x10
	.byte 0xB0, 0x54, 0x00, 0x00, 0x0A, 0x16, 0x0F, 0x11, 0xD0, 0x54, 0x00, 0x00, 0x0B, 0x17, 0x10, 0x11
	.byte 0x30, 0x6C, 0x00, 0x00, 0x0C, 0x18, 0x12, 0x13, 0x50, 0x6C, 0x00, 0x00, 0x0D, 0x19, 0x12, 0x14
	.byte 0x70, 0x6C, 0x00, 0x00, 0x0E, 0x1A, 0x13, 0x15, 0x90, 0x6C, 0x00, 0x00, 0x0F, 0x1B, 0x14, 0x16
	.byte 0xB0, 0x6C, 0x00, 0x00, 0x10, 0x1C, 0x15, 0x17, 0xD0, 0x6C, 0x00, 0x00, 0x11, 0x1D, 0x16, 0x17
	.byte 0x30, 0x84, 0x00, 0x00, 0x12, 0x1E, 0x18, 0x19, 0x50, 0x84, 0x00, 0x00, 0x13, 0x1E, 0x18, 0x1A
	.byte 0x70, 0x84, 0x00, 0x00, 0x14, 0x1E, 0x19, 0x1B, 0x90, 0x84, 0x00, 0x00, 0x15, 0x1E, 0x1A, 0x1C
	.byte 0xB0, 0x84, 0x00, 0x00, 0x16, 0x1E, 0x1B, 0x1D, 0xD0, 0x84, 0x00, 0x00, 0x17, 0x1E, 0x1C, 0x1D
	.byte 0xE0, 0xB0, 0x00, 0x00, 0x9D, 0x1E, 0x1E, 0x1E, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x00
	.byte 0x3C, 0x00, 0x2C, 0x00, 0x98, 0x00, 0x9B, 0x00, 0x9E, 0x00, 0x04, 0x06, 0x09, 0x0A, 0x0D, 0x0E
	.byte 0x11, 0x12, 0x15, 0x16, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00
	.byte 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0xC0, 0x00, 0x30, 0x60, 0x08, 0x38, 0x30, 0x60, 0x38, 0x68
	.byte 0x30, 0x60, 0x68, 0x98, 0x30, 0x60, 0x98, 0xC8, 0x30, 0x60, 0x68, 0xF8, 0x70, 0xA0, 0x08, 0x38
	.byte 0x70, 0xA0, 0x38, 0x68, 0x70, 0xA0, 0x68, 0x98, 0x70, 0xA0, 0x98, 0xC8, 0x70, 0xA0, 0xC8, 0xF8
	.byte 0xFF, 0x00, 0x00, 0x00, 0x20, 0x00, 0x48, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE8, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x15
	.byte 0x02, 0x0C, 0x01, 0x00, 0x01, 0x19, 0x01, 0x06, 0x02, 0x0C, 0x2B, 0x00, 0x01, 0x00, 0x14, 0x18
	.byte 0x02, 0x0C, 0x37, 0x00, 0x01, 0x00, 0x16, 0x18, 0x02, 0x0C, 0x67, 0x00, 0x01, 0x19, 0x15, 0x06
	.byte 0x02, 0x0C, 0x97, 0x00, 0x05, 0x01, 0x00, 0x1A, 0x02, 0x0C, 0x01, 0x00, 0x05, 0x01, 0x02, 0x16
	.byte 0x02, 0x0C, 0x35, 0x00, 0x05, 0x10, 0x04, 0x0B, 0x02, 0x0C, 0x89, 0x00, 0x05, 0x11, 0x09, 0x0B
	.byte 0x02, 0x0C, 0x9F, 0x00, 0x05, 0x12, 0x0D, 0x0B, 0x02, 0x0C, 0xB5, 0x00, 0x05, 0x13, 0x11, 0x0B
	.byte 0x02, 0x0C, 0xCB, 0x00, 0x05, 0x14, 0x15, 0x0B, 0x02, 0x0C, 0xE1, 0x00, 0x05, 0x10, 0x04, 0x0B
	.byte 0x02, 0x0C, 0xF7, 0x00, 0x05, 0x11, 0x08, 0x0B, 0x02, 0x0C, 0x0D, 0x01, 0x05, 0x12, 0x0C, 0x0B
	.byte 0x02, 0x0C, 0x23, 0x01, 0x05, 0x13, 0x10, 0x0B, 0x02, 0x0C, 0x39, 0x01, 0x05, 0x14, 0x14, 0x0B
	.byte 0x02, 0x0C, 0x4F, 0x01, 0x05, 0x11, 0x06, 0x03, 0x02, 0x0C, 0x65, 0x01, 0x05, 0x14, 0x06, 0x06
	.byte 0x02, 0x0C, 0x6B, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x04
	.byte 0x05, 0x06, 0x00, 0x00

	.data

	.balign 4, 0
_021EA5C0:
	.asciz "seq error!"

	.balign 4, 0
_021EA5CC:
	.asciz "seq error!"

	.balign 4, 0
_021EA5D8:
	.asciz "seq error!"

	.balign 4, 0
_021EA5E4:
	.asciz "seq error!"
