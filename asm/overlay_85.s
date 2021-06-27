
	thumb_func_start ov85_021E5900
ov85_021E5900: @ 0x021E5900
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl FUN_020072A4
	adds r4, r0, #0
	movs r0, #1
	adds r1, r0, #0
	bl FUN_020398D4
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r0, #2
	bl FUN_0201A728
	movs r2, #2
	movs r0, #3
	movs r1, #0x66
	lsls r2, r2, #0x12
	bl FUN_0201A910
	ldr r1, _021E5A28 @ =0x00000DCC
	adds r0, r5, #0
	movs r2, #0x66
	bl FUN_02007280
	ldr r2, _021E5A28 @ =0x00000DCC
	adds r6, r0, #0
	movs r1, #0
	blx FUN_020E5B44
	adds r0, r6, #0
	str r6, [r4, #0x34]
	adds r0, #0xcc
	str r4, [r0]
	adds r0, r6, #0
	ldr r1, [r4, #0x30]
	adds r0, #0xd0
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0xcc
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	bl FUN_02074904
	str r0, [r6, #0x24]
	movs r0, #0xbb
	movs r1, #0x66
	bl FUN_02007688
	movs r1, #0x36
	lsls r1, r1, #6
	str r0, [r6, r1]
	movs r0, #8
	movs r1, #0x66
	bl FUN_0202055C
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	adds r0, r6, #0
	bl ov85_021E678C
	ldr r0, _021E5A2C @ =ov85_021E6764
	adds r1, r6, #0
	bl FUN_0201A0FC
	adds r0, r6, #0
	bl ov85_021E752C
	adds r0, r6, #0
	bl ov85_021E7650
	movs r4, #0
	adds r5, r4, #0
	bl FUN_0203769C
	adds r1, r6, #0
	adds r1, #0xd4
	mov ip, r1
	adds r1, r6, #0
	adds r1, #0xcc
	ldr r7, [r1]
	movs r3, #1
	ldr r1, [r7, #0xc]
_021E59B6:
	adds r2, r3, #0
	lsls r2, r4
	tst r2, r1
	beq _021E59C4
	cmp r4, r0
	beq _021E59CA
	adds r5, r5, #1
_021E59C4:
	adds r4, r4, #1
	cmp r4, #5
	blt _021E59B6
_021E59CA:
	ldr r1, [r7, #8]
	movs r0, #0xa
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, _021E5A30 @ =0x021EA788
	lsls r1, r5, #1
	adds r0, r0, r2
	ldrh r0, [r1, r0]
	lsls r1, r0, #0xc
	mov r0, ip
	str r1, [r0, #0x40]
	bl FUN_02004A90
	str r0, [r6, #0x1c]
	adds r0, r6, #0
	bl ov85_021E7D08
	adds r0, r6, #0
	bl ov85_021E7E3C
	adds r0, r6, #0
	bl ov85_021E7F74
	adds r0, r6, #0
	bl ov85_021E80E0
	adds r0, r6, #0
	bl ov85_021E82F8
	adds r0, r6, #0
	bl ov85_021E83E0
	movs r0, #8
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x66
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E5A28: .4byte 0x00000DCC
_021E5A2C: .4byte ov85_021E6764
_021E5A30: .4byte 0x021EA788
	thumb_func_end ov85_021E5900

	thumb_func_start ov85_021E5A34
ov85_021E5A34: @ 0x021E5A34
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl FUN_02021238
	cmp r0, #1
	beq _021E5A4A
	bl FUN_0202551C
_021E5A4A:
	adds r0, r4, #0
	bl ov85_021E7D40
	adds r0, r4, #0
	bl ov85_021E7E78
	adds r0, r4, #0
	bl ov85_021E7FB0
	adds r0, r4, #0
	bl ov85_021E8118
	adds r0, r4, #0
	bl ov85_021E833C
	adds r0, r4, #0
	bl ov85_021E8418
	adds r0, r4, #0
	bl ov85_021E75B8
	adds r0, r4, #0
	bl ov85_021E7658
	adds r0, r4, #0
	bl ov85_021E67CC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_020205AC
	movs r0, #0x36
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0200770C
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x66
	bl FUN_0201A9C4
	movs r0, #2
	bl FUN_0201A738
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E5A34

	thumb_func_start ov85_021E5AAC
ov85_021E5AAC: @ 0x021E5AAC
	push {r3, r4, r5, lr}
	bl FUN_02007290
	adds r5, r0, #0
	bl ov85_021E74AC
	ldr r4, _021E5AEC @ =0x021EA800
_021E5ABA:
	ldr r1, [r5]
	adds r0, r5, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _021E5ABA
	cmp r0, #2
	bne _021E5AD0
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5AD0:
	adds r0, r5, #0
	bl ov85_021E75C8
	adds r0, r5, #0
	bl ov85_021E7798
	adds r0, r5, #0
	bl ov85_021E67F4
	adds r0, r5, #0
	bl ov85_021E5AF0
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5AEC: .4byte 0x021EA800
	thumb_func_end ov85_021E5AAC

	thumb_func_start ov85_021E5AF0
ov85_021E5AF0: @ 0x021E5AF0
	movs r1, #0
	str r1, [r0, #0x34]
	str r1, [r0, #0x3c]
	bx lr
	thumb_func_end ov85_021E5AF0

	thumb_func_start ov85_021E5AF8
ov85_021E5AF8: @ 0x021E5AF8
	push {r4, lr}
	movs r1, #0
	adds r4, r0, #0
	bl ov85_021E7194
	movs r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E5AF8

	thumb_func_start ov85_021E5B0C
ov85_021E5B0C: @ 0x021E5B0C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5B2C
	bl FUN_0203769C
	cmp r0, #0
	bne _021E5B24
	movs r0, #2
	b _021E5B26
_021E5B24:
	movs r0, #8
_021E5B26:
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E5B2C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5B0C

	thumb_func_start ov85_021E5B30
ov85_021E5B30: @ 0x021E5B30
	push {r4, lr}
	adds r4, r0, #0
	bl ov85_021E8628
	cmp r0, #0
	beq _021E5B44
	movs r0, #3
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E5B44:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5B30

	thumb_func_start ov85_021E5B48
ov85_021E5B48: @ 0x021E5B48
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #1
	add r0, sp, #0
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	movs r1, #8
	add r2, sp, #0
	movs r3, #2
	bl FUN_02096D4C
	cmp r0, #1
	bne _021E5B72
	movs r0, #4
	str r0, [r4]
	add sp, #4
	movs r0, #1
	pop {r3, r4, pc}
_021E5B72:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov85_021E5B48

	thumb_func_start ov85_021E5B78
ov85_021E5B78: @ 0x021E5B78
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov85_021E8660
	adds r5, r0, #1
	bl FUN_02037454
	cmp r5, r0
	beq _021E5B8E
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E5B8E:
	movs r0, #5
	str r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E5B78

	thumb_func_start ov85_021E5B98
ov85_021E5B98: @ 0x021E5B98
	push {r4, lr}
	adds r4, r0, #0
	bl ov85_021E8660
	adds r0, r0, #1
	str r0, [r4, #0x30]
	adds r0, r4, #0
	adds r0, #0xd0
	adds r2, r4, #0
	ldr r0, [r0]
	movs r1, #0xd
	adds r2, #0x30
	movs r3, #4
	bl FUN_02096D4C
	cmp r0, #1
	bne _021E5BC2
	movs r0, #0
	str r0, [r4, #0x14]
	movs r0, #6
	str r0, [r4]
_021E5BC2:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E5B98

	thumb_func_start ov85_021E5BC8
ov85_021E5BC8: @ 0x021E5BC8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, [r4, #0x14]
	cmp r3, #0
	bne _021E5BFC
	movs r1, #0
	add r0, sp, #0
	strh r1, [r0, #2]
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	movs r1, #0xc
	add r2, sp, #0
	movs r3, #4
	bl FUN_02096D4C
	cmp r0, #1
	bne _021E5BF6
	ldr r0, [r4, #0x14]
	adds r0, r0, #1
	str r0, [r4, #0x14]
_021E5BF6:
	add sp, #4
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_021E5BFC:
	adds r2, r4, #0
	adds r2, #0xd0
	ldr r2, [r2]
	movs r0, #1
	adds r2, #0x42
	ldrh r2, [r2]
	adds r1, r0, #0
	adds r5, r0, #0
_021E5C0C:
	adds r6, r5, #0
	lsls r6, r0
	tst r6, r2
	beq _021E5C3E
	cmp r1, r3
	blt _021E5C3C
	add r1, sp, #0
	strh r0, [r1, #2]
	ldr r0, [r4, #0x14]
	add r2, sp, #0
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	movs r1, #0xc
	movs r3, #4
	bl FUN_02096D4C
	cmp r0, #1
	bne _021E5C44
	ldr r0, [r4, #0x14]
	adds r0, r0, #1
	str r0, [r4, #0x14]
	b _021E5C44
_021E5C3C:
	adds r1, r1, #1
_021E5C3E:
	adds r0, r0, #1
	cmp r0, #5
	blt _021E5C0C
_021E5C44:
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	blt _021E5C50
	movs r0, #7
	str r0, [r4]
_021E5C50:
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov85_021E5BC8

	thumb_func_start ov85_021E5C58
ov85_021E5C58: @ 0x021E5C58
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #8
	add r0, sp, #0
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	add r2, sp, #0
	movs r3, #2
	bl FUN_02096D4C
	cmp r0, #1
	bne _021E5C7A
	movs r0, #0xa
	str r0, [r4]
_021E5C7A:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov85_021E5C58

	thumb_func_start ov85_021E5C80
ov85_021E5C80: @ 0x021E5C80
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xd0
	movs r2, #0
	ldr r0, [r0]
	movs r1, #9
	adds r3, r2, #0
	bl FUN_02096D4C
	cmp r0, #1
	bne _021E5CA0
	movs r0, #0
	str r0, [r4, #0x10]
	movs r1, #9
	str r1, [r4]
	pop {r4, pc}
_021E5CA0:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5C80

	thumb_func_start ov85_021E5CA4
ov85_021E5CA4: @ 0x021E5CA4
	push {r4, lr}
	movs r1, #8
	adds r4, r0, #0
	bl ov85_021E8614
	cmp r0, #1
	bne _021E5CCA
	ldr r0, [r4, #0x30]
	cmp r0, #2
	bge _021E5CBC
	bl FUN_0202551C
_021E5CBC:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _021E5CC6
	bl FUN_0202551C
_021E5CC6:
	movs r0, #0xa
	str r0, [r4]
_021E5CCA:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E5CA4

	thumb_func_start ov85_021E5CD0
ov85_021E5CD0: @ 0x021E5CD0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xca
	bl FUN_02037AC0
	movs r0, #0xb
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E5CD0

	thumb_func_start ov85_021E5CE4
ov85_021E5CE4: @ 0x021E5CE4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xca
	bl FUN_02037B38
	cmp r0, #0
	beq _021E5CF6
	movs r0, #0xc
	str r0, [r4]
_021E5CF6:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E5CE4

	thumb_func_start ov85_021E5CFC
ov85_021E5CFC: @ 0x021E5CFC
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0xcc
	adds r0, #0xd0
	ldr r2, [r2]
	ldr r0, [r0]
	movs r1, #0xe
	adds r2, r2, #4
	movs r3, #4
	bl FUN_02096D4C
	cmp r0, #0
	beq _021E5D1C
	movs r0, #0xd
	str r0, [r4]
_021E5D1C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5CFC

	thumb_func_start ov85_021E5D20
ov85_021E5D20: @ 0x021E5D20
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0x59
	ldr r1, [r4, #0x24]
	movs r0, #0x83
	lsls r2, r2, #4
	bl FUN_02036FD8
	cmp r0, #0
	beq _021E5D38
	movs r0, #0xe
	str r0, [r4]
_021E5D38:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5D20

	thumb_func_start ov85_021E5D3C
ov85_021E5D3C: @ 0x021E5D3C
	push {r4, lr}
	adds r4, r0, #0
	bl ov85_021E8720
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bne _021E5D7E
	adds r0, r4, #0
	bl ov85_021E8834
	cmp r0, #1
	bne _021E5D6A
	adds r0, r4, #0
	adds r0, #0xd0
	movs r2, #0
	ldr r0, [r0]
	movs r1, #0x10
	adds r3, r2, #0
	bl FUN_02096D4C
	movs r0, #0x2e
	str r0, [r4]
	b _021E5D7E
_021E5D6A:
	adds r0, r4, #0
	adds r0, #0xd0
	movs r2, #0
	ldr r0, [r0]
	movs r1, #0x11
	adds r3, r2, #0
	bl FUN_02096D4C
	movs r0, #0xf
	str r0, [r4]
_021E5D7E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E5D3C

	thumb_func_start ov85_021E5D84
ov85_021E5D84: @ 0x021E5D84
	push {r4, lr}
	adds r4, r0, #0
	bl ov85_021E8898
	cmp r0, #1
	bne _021E5D96
	movs r0, #0x2e
	str r0, [r4]
	b _021E5DA6
_021E5D96:
	adds r0, r4, #0
	bl ov85_021E8878
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bne _021E5DA6
	movs r0, #0x10
	str r0, [r4]
_021E5DA6:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E5D84

	thumb_func_start ov85_021E5DAC
ov85_021E5DAC: @ 0x021E5DAC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r1, #0x18
	bl ov85_021E85F0
	adds r7, r0, #0
	ldr r0, [r6, #0x2c]
	ldr r2, _021E5E28 @ =0x021EA788
	str r0, [r7, #0x10]
	ldr r1, [r6, #0x30]
	movs r0, #0xa
	adds r3, r1, #0
	str r1, [r7, #0x14]
	muls r3, r0, r3
	ldr r0, [r6, #0x2c]
	movs r4, #0
	lsls r1, r0, #1
	adds r0, r2, r3
	ldrh r0, [r1, r0]
	adds r5, r6, #0
	str r0, [r7, #4]
_021E5DD6:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov85_021E86B0
	cmp r0, #0
	beq _021E5DFE
	adds r0, r4, #0
	bl FUN_02034818
	adds r1, r5, #0
	adds r1, #0x84
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x84
	adds r1, #0x98
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_02028F58
_021E5DFE:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blt _021E5DD6
	ldr r0, [r7, #4]
	movs r2, #1
	lsls r1, r0, #0xc
	movs r0, #0x45
	lsls r0, r0, #2
	str r1, [r6, r0]
	movs r0, #0x11
	str r0, [r6]
	ldr r1, _021E5E2C @ =0x00000483
	movs r0, #0xf
	bl FUN_02004EC4
	adds r0, r6, #0
	bl ov85_021E72E8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E5E28: .4byte 0x021EA788
_021E5E2C: .4byte 0x00000483
	thumb_func_end ov85_021E5DAC

	thumb_func_start ov85_021E5E30
ov85_021E5E30: @ 0x021E5E30
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r1, [r5, #0xc]
	subs r1, r1, #1
	str r1, [r5, #0xc]
	cmp r1, #0
	ble _021E5E46
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_021E5E46:
	movs r1, #0xf
	str r1, [r5, #0xc]
	bl ov85_021E8610
	adds r4, r0, #0
	ldr r1, [r4, #0x14]
	movs r0, #0xa
	adds r3, r1, #0
	ldr r2, [r4, #0x10]
	muls r3, r0, r3
	ldr r0, _021E5EB0 @ =0x021EA7C4
	lsls r1, r2, #1
	adds r0, r0, r3
	ldrh r0, [r1, r0]
	str r0, [sp]
	ldr r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r1, r5, r0
	movs r0, #0xb0
	muls r0, r2, r0
	adds r0, r1, r0
	str r0, [sp, #8]
	lsls r1, r2, #2
	adds r1, r5, r1
	adds r1, #0x72
	ldrh r1, [r1]
	ldr r3, [r4]
	adds r0, r5, #0
	bl ov85_021E7B40
	ldr r0, [r4, #0x10]
	adds r0, r0, #1
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	blx FUN_020F2998
	str r1, [r4, #0x10]
	ldr r0, [r4]
	adds r1, r0, #1
	str r1, [r4]
	ldr r0, [r4, #0x14]
	cmp r1, r0
	bne _021E5EA8
	movs r0, #0
	str r0, [r5, #0xc]
	movs r0, #0x12
	str r0, [r5]
_021E5EA8:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E5EB0: .4byte 0x021EA7C4
	thumb_func_end ov85_021E5E30

	thumb_func_start ov85_021E5EB4
ov85_021E5EB4: @ 0x021E5EB4
	push {r3, r4, r5, r6}
	movs r1, #0x19
	movs r3, #0
	lsls r1, r1, #4
	adds r6, r0, r1
	ldr r5, [r0, #0x30]
	adds r4, r3, #0
	subs r1, #0x48
_021E5EC4:
	ldr r2, [r6, r1]
	cmp r2, #1
	bne _021E5ECC
	adds r4, r4, #1
_021E5ECC:
	adds r3, r3, #1
	adds r6, #0xb0
	cmp r3, r5
	blt _021E5EC4
	cmp r4, r5
	bne _021E5EE2
	movs r1, #0x13
	str r1, [r0]
	movs r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_021E5EE2:
	movs r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov85_021E5EB4

	thumb_func_start ov85_021E5EE8
ov85_021E5EE8: @ 0x021E5EE8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0x1e
	ble _021E5F0C
	movs r0, #0
	str r0, [r4, #0xc]
	bl FUN_0203769C
	cmp r0, #0
	bne _021E5F08
	movs r0, #0x14
	str r0, [r4]
	b _021E5F0C
_021E5F08:
	movs r0, #0x15
	str r0, [r4]
_021E5F0C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5EE8

	thumb_func_start ov85_021E5F10
ov85_021E5F10: @ 0x021E5F10
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #4
	add r0, sp, #0
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	movs r1, #8
	add r2, sp, #0
	movs r3, #2
	bl FUN_02096D4C
	cmp r0, #1
	bne _021E5F34
	movs r0, #0x16
	str r0, [r4]
_021E5F34:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E5F10

	thumb_func_start ov85_021E5F3C
ov85_021E5F3C: @ 0x021E5F3C
	push {r4, lr}
	movs r1, #4
	adds r4, r0, #0
	bl ov85_021E8614
	cmp r0, #1
	bne _021E5F52
	movs r0, #0x16
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E5F52:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E5F3C

	thumb_func_start ov85_021E5F58
ov85_021E5F58: @ 0x021E5F58
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xca
	bl FUN_02037AC0
	movs r0, #0x17
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E5F58

	thumb_func_start ov85_021E5F6C
ov85_021E5F6C: @ 0x021E5F6C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xca
	bl FUN_02037B38
	cmp r0, #0
	beq _021E5F7E
	movs r0, #0x18
	str r0, [r4]
_021E5F7E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E5F6C

	thumb_func_start ov85_021E5F84
ov85_021E5F84: @ 0x021E5F84
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl ov85_021E84EC
	adds r0, r4, #0
	bl ov85_021E81E0
	movs r0, #0x19
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5F84

	thumb_func_start ov85_021E5F9C
ov85_021E5F9C: @ 0x021E5F9C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r0, r0, #1
	str r0, [r5, #0xc]
	cmp r0, #0x5f
	bge _021E5FAE
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E5FAE:
	ldr r0, [r5, #0x30]
	movs r4, #0
	cmp r0, #0
	ble _021E5FC6
_021E5FB6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov85_021E7400
	ldr r0, [r5, #0x30]
	adds r4, r4, #1
	cmp r4, r0
	blt _021E5FB6
_021E5FC6:
	movs r0, #0
	str r0, [r5, #0xc]
	movs r1, #0x1a
	str r1, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E5F9C

	thumb_func_start ov85_021E5FD0
ov85_021E5FD0: @ 0x021E5FD0
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0203769C
	movs r0, #0x1b
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5FD0

	thumb_func_start ov85_021E5FE0
ov85_021E5FE0: @ 0x021E5FE0
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	bl ov85_021E8570
	cmp r0, #1
	bne _021E6002
	adds r0, r4, #0
	bl ov85_021E8150
	cmp r0, #0
	bne _021E6002
	movs r0, #0x1d
	str r0, [r4]
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E6002:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _021E6018
	adds r0, r4, #0
	bl ov85_021E8150
	cmp r0, #0
	bne _021E6018
	adds r0, r4, #0
	bl ov85_021E8128
_021E6018:
	adds r0, r4, #0
	bl ov85_021E834C
	cmp r0, #0
	bne _021E6046
	adds r0, r4, #0
	bl ov85_021E750C
	cmp r0, #1
	bne _021E6046
	adds r0, r4, #0
	bl ov85_021E8150
	cmp r0, #0
	bne _021E6040
	adds r0, r4, #0
	bl ov85_021E8128
	movs r0, #1
	str r0, [r4, #0x38]
_021E6040:
	adds r0, r4, #0
	bl ov85_021E8358
_021E6046:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _021E6068
	adds r0, r4, #0
	adds r0, #0xcc
	ldr r0, [r0]
	adds r2, r4, #0
	ldr r0, [r0, #0x30]
	movs r1, #0xa
	adds r2, #0x38
	movs r3, #1
	bl FUN_02096D4C
	cmp r0, #1
	bne _021E6068
	movs r0, #0
	str r0, [r4, #0x38]
_021E6068:
	adds r0, r4, #0
	movs r1, #0x4b
	ldr r2, [r4, #8]
	adds r0, #0xd4
	lsls r1, r1, #2
	cmp r2, r1
	ldr r2, [r0, #0x48]
	bge _021E6088
	movs r1, #0xe
	adds r2, #0xbf
	lsls r1, r1, #0xc
	str r2, [r0, #0x48]
	cmp r2, r1
	blt _021E6096
	str r1, [r0, #0x48]
	b _021E6096
_021E6088:
	movs r1, #1
	subs r2, #0xbf
	lsls r1, r1, #0xe
	str r2, [r0, #0x48]
	cmp r2, r1
	bge _021E6096
	str r1, [r0, #0x48]
_021E6096:
	ldr r5, [r0, #0x48]
	adds r0, r4, #0
	bl ov85_021E8144
	cmp r0, #1
	bne _021E60AE
	adds r0, r4, #0
	adds r0, #0xd4
	lsls r1, r5, #1
	bl ov85_021E7644
	b _021E60B6
_021E60AE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov85_021E8558
_021E60B6:
	ldr r0, [r4, #8]
	add r2, sp, #0
	movs r1, #0x47
	strh r0, [r2, #2]
	lsls r1, r1, #2
	ldr r3, [r4, r1]
	subs r1, #0xc
	asrs r0, r3, #0xb
	lsrs r0, r0, #0x14
	adds r0, r3, r0
	asrs r0, r0, #0xc
	strh r0, [r2, #4]
	ldr r1, [r4, r1]
	adds r4, #0xd0
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	strh r0, [r2, #6]
	ldr r0, [r4]
	movs r1, #0xb
	add r2, sp, #0
	movs r3, #8
	bl FUN_02096D4C
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E5FE0

	thumb_func_start ov85_021E60F0
ov85_021E60F0: @ 0x021E60F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #1
	bne _021E611A
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r0, [r0]
	lsls r1, r0, #0xc
	movs r0, #0x11
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r0, #0x5c
	ldrsh r1, [r4, r0]
	adds r0, #0xc0
	lsls r1, r1, #0xc
	str r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	str r0, [r4, #8]
_021E611A:
	adds r0, r4, #0
	bl ov85_021E8570
	cmp r0, #1
	bne _021E6136
	adds r0, r4, #0
	bl ov85_021E8150
	cmp r0, #0
	bne _021E6136
	movs r0, #0x1d
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E6136:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _021E614C
	adds r0, r4, #0
	bl ov85_021E8150
	cmp r0, #0
	bne _021E614C
	adds r0, r4, #0
	bl ov85_021E8128
_021E614C:
	adds r0, r4, #0
	bl ov85_021E834C
	cmp r0, #0
	bne _021E617A
	adds r0, r4, #0
	bl ov85_021E750C
	cmp r0, #1
	bne _021E617A
	adds r0, r4, #0
	bl ov85_021E8150
	cmp r0, #0
	bne _021E6174
	adds r0, r4, #0
	bl ov85_021E8128
	movs r0, #1
	str r0, [r4, #0x38]
_021E6174:
	adds r0, r4, #0
	bl ov85_021E8358
_021E617A:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _021E619C
	adds r0, r4, #0
	adds r0, #0xcc
	ldr r0, [r0]
	adds r2, r4, #0
	ldr r0, [r0, #0x30]
	movs r1, #0xa
	adds r2, #0x38
	movs r3, #1
	bl FUN_02096D4C
	cmp r0, #1
	bne _021E619C
	movs r0, #0
	str r0, [r4, #0x38]
_021E619C:
	adds r0, r4, #0
	bl ov85_021E8144
	cmp r0, #1
	bne _021E61B8
	movs r1, #0x47
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	adds r0, #0xd4
	lsls r1, r1, #1
	bl ov85_021E7644
	b _021E61C4
_021E61B8:
	movs r1, #0x47
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov85_021E8558
_021E61C4:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E60F0

	thumb_func_start ov85_021E61C8
ov85_021E61C8: @ 0x021E61C8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl ov85_021E84EC
	adds r0, r4, #0
	bl ov85_021E7958
	str r0, [r4, #0x28]
	bl FUN_0203769C
	ldr r1, [r4, #0x28]
	ldr r1, [r1, #0xc]
	cmp r1, r0
	bne _021E61EA
	movs r0, #0x1e
	b _021E61EC
_021E61EA:
	movs r0, #0x1f
_021E61EC:
	str r0, [r4]
	ldr r0, _021E61F8 @ =0x000005F1
	bl FUN_0200604C
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_021E61F8: .4byte 0x000005F1
	thumb_func_end ov85_021E61C8

	thumb_func_start ov85_021E61FC
ov85_021E61FC: @ 0x021E61FC
	push {r4, lr}
	movs r1, #1
	adds r4, r0, #0
	lsls r1, r1, #0xe
	bl ov85_021E8558
	adds r0, r4, #0
	bl ov85_021E7958
	str r0, [r4, #0x28]
	bl FUN_0203769C
	ldr r1, [r4, #0x28]
	ldr r1, [r1, #0xc]
	cmp r1, r0
	beq _021E6220
	movs r0, #0x1f
	str r0, [r4]
_021E6220:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E61FC

	thumb_func_start ov85_021E6224
ov85_021E6224: @ 0x021E6224
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x28]
	ldr r2, [r6, #0x30]
	ldr r1, [r0, #0x1c]
	ldr r3, [r6, #0x2c]
	movs r0, #0xa
	muls r0, r2, r0
	ldr r4, _021E629C @ =0x021EA7C4
	lsls r2, r3, #1
	adds r0, r4, r0
	ldrh r0, [r2, r0]
	movs r5, #1
	lsls r5, r5, #0xe
	lsls r4, r0, #0xc
	str r1, [sp]
	subs r2, r4, r1
	bpl _021E6252
	movs r0, #0x5a
	lsls r0, r0, #0xe
	adds r0, r4, r0
	subs r2, r0, r1
_021E6252:
	movs r0, #1
	lsls r0, r0, #0x10
	cmp r2, r0
	bgt _021E625C
	asrs r5, r5, #1
_021E625C:
	cmp r2, r5
	bge _021E6262
	adds r5, r2, #0
_021E6262:
	adds r0, r6, #0
	adds r0, #0xd4
	adds r1, r5, #0
	bl ov85_021E7644
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov85_021E78A4
	add r0, sp, #0
	adds r1, r5, #0
	bl ov85_021E8530
	ldr r1, [sp]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r1, r0, #0xc
	asrs r0, r4, #0xb
	lsrs r0, r0, #0x14
	adds r0, r4, r0
	asrs r0, r0, #0xc
	cmp r1, r0
	bne _021E6296
	movs r0, #0x20
	str r0, [r6]
_021E6296:
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E629C: .4byte 0x021EA7C4
	thumb_func_end ov85_021E6224

	thumb_func_start ov85_021E62A0
ov85_021E62A0: @ 0x021E62A0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xca
	bl FUN_02037AC0
	movs r0, #0x21
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E62A0

	thumb_func_start ov85_021E62B4
ov85_021E62B4: @ 0x021E62B4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xca
	bl FUN_02037B38
	cmp r0, #0
	beq _021E62D4
	bl FUN_0203769C
	cmp r0, #0
	bne _021E62D0
	movs r0, #0x22
	str r0, [r4]
	b _021E62D4
_021E62D0:
	movs r0, #0x23
	str r0, [r4]
_021E62D4:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E62B4

	thumb_func_start ov85_021E62D8
ov85_021E62D8: @ 0x021E62D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	movs r7, #0
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r1, r0, #0xc
	add r0, sp, #0
	strh r1, [r0]
	str r7, [r5, #0x20]
	ldr r0, [r5, #0x30]
	cmp r0, #0
	ble _021E6346
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r6, r5, #0
	adds r4, r5, r0
	adds r6, #0x20
_021E6304:
	ldr r0, [r4]
	cmp r0, #0
	bne _021E630E
	bl FUN_0202551C
_021E630E:
	ldr r1, [r4, #0x1c]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	ldr r1, [r4, #0x10]
	asrs r0, r0, #0xc
	lsls r2, r1, #1
	add r1, sp, #0
	adds r1, r1, r2
	strh r0, [r1, #4]
	ldr r1, [r4, #0x1c]
	ldr r2, [r5, #0x30]
	adds r0, r5, #0
	bl ov85_021E8764
	cmp r0, #1
	bne _021E633C
	ldr r2, [r4, #0xc]
	movs r1, #1
	ldr r0, [r6]
	lsls r1, r2
	orrs r0, r1
	str r0, [r6]
_021E633C:
	ldr r0, [r5, #0x30]
	adds r7, r7, #1
	adds r4, #0xb0
	cmp r7, r0
	blt _021E6304
_021E6346:
	ldr r1, [r5, #0x20]
	add r0, sp, #0
	strh r1, [r0, #2]
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r0, [r0]
	movs r1, #0xf
	add r2, sp, #0
	movs r3, #0x10
	bl FUN_02096D4C
	cmp r0, #1
	bne _021E6364
	movs r0, #0x24
	str r0, [r5]
_021E6364:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov85_021E62D8

	thumb_func_start ov85_021E636C
ov85_021E636C: @ 0x021E636C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	cmp r0, #1
	bne _021E63D2
	adds r0, r5, #0
	adds r0, #0x60
	ldrh r0, [r0]
	adds r7, r5, #0
	adds r7, #0x60
	lsls r1, r0, #0xc
	movs r0, #0x11
	lsls r0, r0, #4
	str r1, [r5, r0]
	ldr r0, [r5, #0x30]
	movs r6, #0
	cmp r0, #0
	ble _021E63B6
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r4, r5, r0
_021E6396:
	ldr r0, [r4]
	cmp r0, #0
	bne _021E63A0
	bl FUN_0202551C
_021E63A0:
	ldr r0, [r4, #0x10]
	adds r6, r6, #1
	lsls r0, r0, #1
	adds r0, r7, r0
	ldrh r0, [r0, #4]
	lsls r0, r0, #0xc
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x30]
	adds r4, #0xb0
	cmp r6, r0
	blt _021E6396
_021E63B6:
	ldrh r0, [r7, #2]
	str r0, [r5, #0x20]
	adds r0, r5, #0
	bl ov85_021E75C8
	adds r0, r5, #0
	bl ov85_021E7798
	adds r0, r5, #0
	bl ov85_021E7958
	str r0, [r5, #0x28]
	movs r0, #0x24
	str r0, [r5]
_021E63D2:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov85_021E636C

	thumb_func_start ov85_021E63D8
ov85_021E63D8: @ 0x021E63D8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x28]
	movs r6, #0
	ldr r4, [r0, #0x10]
	ldr r0, [r5, #0x30]
	cmp r0, #0
	ble _021E6416
_021E63E8:
	movs r0, #0xb0
	muls r0, r4, r0
	adds r1, r5, r0
	movs r0, #0xb7
	lsls r0, r0, #2
	ldr r3, [r1, r0]
	adds r0, r5, #0
	lsls r1, r3, #2
	adds r1, r5, r1
	adds r1, #0x98
	ldr r1, [r1]
	adds r2, r6, #0
	bl ov85_021E73D4
	ldr r7, [r5, #0x30]
	adds r0, r4, #1
	adds r1, r7, #0
	blx FUN_020F2998
	adds r6, r6, #1
	adds r4, r1, #0
	cmp r6, r7
	blt _021E63E8
_021E6416:
	movs r0, #0
	str r0, [r5, #0xc]
	movs r1, #0x25
	str r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov85_021E63D8

	thumb_func_start ov85_021E6420
ov85_021E6420: @ 0x021E6420
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r0, r0, #1
	str r0, [r5, #0xc]
	cmp r0, #0x78
	bge _021E6432
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E6432:
	movs r4, #0
	str r4, [r5, #0xc]
	ldr r0, [r5, #0x30]
	cmp r0, #0
	ble _021E644C
_021E643C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov85_021E7400
	ldr r0, [r5, #0x30]
	adds r4, r4, #1
	cmp r4, r0
	blt _021E643C
_021E644C:
	ldr r2, [r5, #0x28]
	adds r0, r5, #0
	ldr r2, [r2, #0xc]
	movs r1, #2
	lsls r2, r2, #2
	adds r2, r5, r2
	adds r2, #0x84
	ldr r2, [r2]
	bl ov85_021E71EC
	ldr r0, _021E6470 @ =0x000004A1
	bl FUN_02006B24
	movs r0, #0x26
	str r0, [r5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E6470: .4byte 0x000004A1
	thumb_func_end ov85_021E6420

	thumb_func_start ov85_021E6474
ov85_021E6474: @ 0x021E6474
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0x78
	bge _021E6484
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _021E6494
_021E6484:
	bl FUN_02006BCC
	cmp r0, #0
	bne _021E6494
	movs r0, #0
	str r0, [r4, #0xc]
	movs r0, #0x27
	str r0, [r4]
_021E6494:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E6474

	thumb_func_start ov85_021E6498
ov85_021E6498: @ 0x021E6498
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov85_021E8454
	ldr r0, [r5, #0x28]
	ldr r2, [r5, #0x20]
	ldr r0, [r0, #0xc]
	movs r1, #1
	lsls r1, r0
	adds r0, r2, #0
	tst r0, r1
	bne _021E64B8
	movs r0, #0x2b
	str r0, [r5]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E64B8:
	ldr r0, [r5, #0x30]
	lsls r6, r0, #3
	ldr r0, _021E6520 @ =0x021EA728
	ldr r4, [r0, r6]
	ldr r0, _021E6524 @ =0x021EA72C
	ldr r7, [r0, r6]
	bl FUN_0201FD44
	subs r1, r7, r4
	adds r1, r1, #1
	blx FUN_020F2BA4
	ldr r0, _021E6520 @ =0x021EA728
	adds r4, r4, r1
	ldr r0, [r0, r6]
	cmp r4, r0
	bhs _021E64DE
	adds r4, r0, #0
	b _021E64E4
_021E64DE:
	cmp r4, r7
	bls _021E64E4
	adds r4, r7, #0
_021E64E4:
	adds r0, r5, #0
	movs r1, #3
	adds r2, r4, #0
	bl ov85_021E7274
	adds r0, r5, #0
	adds r0, #0xcc
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	bl FUN_0207879C
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	movs r2, #1
	movs r3, #0x66
	bl FUN_02078398
	adds r4, r0, #0
	ldr r0, _021E6528 @ =0x000004A1
	bl FUN_02006B24
	cmp r4, #1
	bne _021E6516
	movs r0, #0x28
	b _021E6518
_021E6516:
	movs r0, #0x29
_021E6518:
	str r0, [r5]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6520: .4byte 0x021EA728
_021E6524: .4byte 0x021EA72C
_021E6528: .4byte 0x000004A1
	thumb_func_end ov85_021E6498

	thumb_func_start ov85_021E652C
ov85_021E652C: @ 0x021E652C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0x78
	bge _021E653C
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _021E654C
_021E653C:
	bl FUN_02006BCC
	cmp r0, #0
	bne _021E654C
	movs r0, #0
	str r0, [r4, #0xc]
	movs r0, #0x2b
	str r0, [r4]
_021E654C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E652C

	thumb_func_start ov85_021E6550
ov85_021E6550: @ 0x021E6550
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0x78
	bge _021E6560
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _021E6578
_021E6560:
	bl FUN_02006BCC
	cmp r0, #0
	bne _021E6578
	movs r0, #0
	str r0, [r4, #0xc]
	movs r0, #0x28
	str r0, [r4]
	adds r0, r4, #0
	movs r1, #4
	bl ov85_021E7194
_021E6578:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E6550

	thumb_func_start ov85_021E657C
ov85_021E657C: @ 0x021E657C
	ldr r1, [r0, #0xc]
	cmp r1, #0x78
	bge _021E6588
	adds r1, r1, #1
	str r1, [r0, #0xc]
	b _021E6590
_021E6588:
	movs r1, #0
	str r1, [r0, #0xc]
	movs r1, #0x2b
	str r1, [r0]
_021E6590:
	movs r0, #0
	bx lr
	thumb_func_end ov85_021E657C

	thumb_func_start ov85_021E6594
ov85_021E6594: @ 0x021E6594
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xcc
	ldr r0, [r0]
	movs r1, #0x78
	ldr r0, [r0, #0x28]
	bl FUN_0202D0FC
	adds r0, r4, #0
	adds r0, #0xcc
	ldr r0, [r0]
	movs r1, #0x22
	ldr r0, [r0, #0x28]
	bl FUN_0202D1C0
	adds r0, r4, #0
	movs r1, #0xb
	bl ov85_021E7194
	movs r0, #0xca
	bl FUN_02037AC0
	ldr r0, _021E65D0 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #0xc]
	movs r0, #0x2c
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	nop
_021E65D0: .4byte 0x021D116C
	thumb_func_end ov85_021E6594

	thumb_func_start ov85_021E65D4
ov85_021E65D4: @ 0x021E65D4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xca
	bl FUN_02037B38
	cmp r0, #0
	beq _021E6604
	ldr r1, [r4, #0x28]
	adds r0, r4, #0
	ldr r1, [r1, #0xc]
	bl ov85_021E86CC
	adds r0, r4, #4
	bl FUN_02039EAC
	ldr r0, _021E6608 @ =0x00000CA8
	movs r1, #0xa
	adds r0, r4, r0
	bl FUN_0200F0AC
	ldr r1, _021E660C @ =0x00000DC8
	str r0, [r4, r1]
	movs r0, #0x2d
	str r0, [r4]
_021E6604:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E6608: .4byte 0x00000CA8
_021E660C: .4byte 0x00000DC8
	thumb_func_end ov85_021E65D4

	thumb_func_start ov85_021E6610
ov85_021E6610: @ 0x021E6610
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xcc
	ldr r0, [r0]
	movs r1, #2
	ldr r0, [r0, #0x1c]
	adds r2, r4, #4
	bl FUN_02039EB4
	cmp r0, #0
	beq _021E6638
	ldr r0, _021E663C @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #0xc]
	ldr r0, _021E6640 @ =0x00000DC8
	ldr r0, [r4, r0]
	bl FUN_0200F450
	movs r0, #0x30
	str r0, [r4]
_021E6638:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E663C: .4byte 0x021D116C
_021E6640: .4byte 0x00000DC8
	thumb_func_end ov85_021E6610

	thumb_func_start ov85_021E6644
ov85_021E6644: @ 0x021E6644
	push {r4, lr}
	movs r1, #0xc
	adds r4, r0, #0
	bl ov85_021E7194
	movs r0, #0x2f
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E6644

	thumb_func_start ov85_021E6658
ov85_021E6658: @ 0x021E6658
	ldr r1, [r0, #0xc]
	adds r1, r1, #1
	str r1, [r0, #0xc]
	cmp r1, #0x78
	blt _021E666E
	movs r1, #0
	str r1, [r0, #0xc]
	movs r1, #0x30
	str r1, [r0]
	movs r0, #1
	bx lr
_021E666E:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov85_021E6658

	thumb_func_start ov85_021E6674
ov85_021E6674: @ 0x021E6674
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _021E6684
	movs r0, #0xca
	bl FUN_02037AC0
_021E6684:
	adds r0, r4, #0
	movs r1, #0xa
	bl ov85_021E7194
	movs r0, #0x31
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E6674

	thumb_func_start ov85_021E6694
ov85_021E6694: @ 0x021E6694
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _021E66C0
	movs r0, #0xca
	bl FUN_02037B38
	cmp r0, #0
	beq _021E66EE
	movs r0, #0
	adds r1, r0, #0
	bl FUN_020398D4
	movs r0, #1
	bl FUN_02038C1C
	bl FUN_02037FF0
	movs r0, #0x32
	str r0, [r4]
	b _021E66EE
_021E66C0:
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0x78
	blt _021E66EE
	movs r0, #0
	adds r1, r4, #0
	str r0, [r4, #0xc]
	adds r1, #0xd0
	ldr r1, [r1]
	ldr r1, [r1, #0x3c]
	cmp r1, #0
	bne _021E66EA
	adds r1, r0, #0
	bl FUN_020398D4
	movs r0, #1
	bl FUN_02038C1C
	bl FUN_02037FF0
_021E66EA:
	movs r0, #0x32
	str r0, [r4]
_021E66EE:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E6694

	thumb_func_start ov85_021E66F4
ov85_021E66F4: @ 0x021E66F4
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02037454
	cmp r0, #1
	bgt _021E6708
	movs r0, #0x33
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E6708:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E66F4

	thumb_func_start ov85_021E670C
ov85_021E670C: @ 0x021E670C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #8
	movs r1, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x66
	str r0, [sp, #8]
	movs r0, #2
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
	ldr r5, [r4, #0x1c]
	bl FUN_02004A90
	cmp r5, r0
	beq _021E673E
	lsls r1, r5, #0x10
	movs r0, #0
	lsrs r1, r1, #0x10
	bl FUN_02055198
_021E673E:
	movs r0, #0x34
	str r0, [r4]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov85_021E670C

	thumb_func_start ov85_021E6748
ov85_021E6748: @ 0x021E6748
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E675C
	movs r0, #0x35
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E675C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E6748

	thumb_func_start ov85_021E6760
ov85_021E6760: @ 0x021E6760
	movs r0, #2
	bx lr
	thumb_func_end ov85_021E6760

	thumb_func_start ov85_021E6764
ov85_021E6764: @ 0x021E6764
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0202061C
	bl FUN_0200D034
	ldr r0, _021E6784 @ =0x00000D9C
	ldr r0, [r4, r0]
	bl FUN_0200398C
	ldr r0, _021E6788 @ =0x00000D84
	ldr r0, [r4, r0]
	bl FUN_0201EEB4
	pop {r4, pc}
	nop
_021E6784: .4byte 0x00000D9C
_021E6788: .4byte 0x00000D84
	thumb_func_end ov85_021E6764

	thumb_func_start ov85_021E678C
ov85_021E678C: @ 0x021E678C
	push {r4, lr}
	adds r4, r0, #0
	bl ov85_021E6854
	adds r0, r4, #0
	bl ov85_021E6980
	adds r0, r4, #0
	bl ov85_021E7424
	adds r0, r4, #0
	bl ov85_021E6A2C
	adds r0, r4, #0
	bl ov85_021E6E14
	adds r0, r4, #0
	bl ov85_021E6ECC
	adds r0, r4, #0
	bl ov85_021E6B68
	adds r0, r4, #0
	bl ov85_021E705C
	adds r0, r4, #0
	bl ov85_021E6F6C
	adds r0, r4, #0
	bl ov85_021E6874
	pop {r4, pc}
	thumb_func_end ov85_021E678C

	thumb_func_start ov85_021E67CC
ov85_021E67CC: @ 0x021E67CC
	push {r4, lr}
	adds r4, r0, #0
	bl ov85_021E692C
	adds r0, r4, #0
	bl ov85_021E7024
	adds r0, r4, #0
	bl ov85_021E7148
	adds r0, r4, #0
	bl ov85_021E6D68
	adds r0, r4, #0
	bl ov85_021E6E6C
	adds r0, r4, #0
	bl ov85_021E749C
	pop {r4, pc}
	thumb_func_end ov85_021E67CC

	thumb_func_start ov85_021E67F4
ov85_021E67F4: @ 0x021E67F4
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02026E48
	bl FUN_02023154
	movs r0, #0
	ldr r2, _021E6848 @ =0xFFFFF000
	adds r1, r0, #0
	adds r3, r0, #0
	blx FUN_020BF034
	ldr r1, _021E684C @ =0x00007FFF
	movs r0, #0
	blx FUN_020BF070
	ldr r0, _021E684C @ =0x00007FFF
	movs r2, #0
	adds r1, r0, #0
	blx FUN_020BF084
	ldr r0, _021E684C @ =0x00007FFF
	movs r2, #0
	adds r1, r0, #0
	blx FUN_020BF0A8
	adds r0, r4, #0
	bl ov85_021E7628
	adds r0, r4, #0
	bl ov85_021E782C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
	ldr r0, _021E6850 @ =0x00000D98
	ldr r0, [r4, r0]
	bl FUN_0200D020
	pop {r4, pc}
	nop
_021E6848: .4byte 0xFFFFF000
_021E684C: .4byte 0x00007FFF
_021E6850: .4byte 0x00000D98
	thumb_func_end ov85_021E67F4

	thumb_func_start ov85_021E6854
ov85_021E6854: @ 0x021E6854
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E6870 @ =0x021EA700
	add r3, sp, #0
	movs r2, #5
_021E685E:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E685E
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E6870: .4byte 0x021EA700
	thumb_func_end ov85_021E6854

	thumb_func_start ov85_021E6874
ov85_021E6874: @ 0x021E6874
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, _021E6924 @ =0x04000008
	movs r4, #3
	ldrh r1, [r0]
	movs r2, #1
	movs r3, #2
	bics r1, r4
	orrs r1, r2
	strh r1, [r0]
	ldrh r1, [r0, #2]
	movs r5, #3
	bics r1, r4
	strh r1, [r0, #2]
	ldrh r1, [r0, #4]
	bics r1, r4
	orrs r1, r3
	strh r1, [r0, #4]
	ldrh r1, [r0, #6]
	bics r1, r4
	orrs r1, r5
	strh r1, [r0, #6]
	ldr r1, _021E6928 @ =0x04001008
	ldrh r6, [r1]
	bics r6, r4
	strh r6, [r1]
	ldrh r6, [r1, #2]
	bics r6, r4
	orrs r2, r6
	strh r2, [r1, #2]
	ldrh r2, [r1, #4]
	bics r2, r4
	orrs r2, r3
	strh r2, [r1, #4]
	ldrh r2, [r1, #6]
	bics r2, r4
	orrs r2, r5
	strh r2, [r1, #6]
	movs r1, #0xa
	str r1, [sp]
	adds r0, #0x48
	movs r1, #4
	movs r2, #0x28
	movs r3, #0xb
	blx FUN_020CF15C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E6924: .4byte 0x04000008
_021E6928: .4byte 0x04001008
	thumb_func_end ov85_021E6874

	thumb_func_start ov85_021E692C
ov85_021E692C: @ 0x021E692C
	push {r3, lr}
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022CC8
	pop {r3, pc}
	thumb_func_end ov85_021E692C

	thumb_func_start ov85_021E6980
ov85_021E6980: @ 0x021E6980
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	blx FUN_020C2698
	blx FUN_020CF704
	ldr r0, _021E6A10 @ =0x04000060
	ldr r1, _021E6A14 @ =0xFFFFCFFD
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
	ldr r2, _021E6A18 @ =0x0000CFFB
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
	adds r3, r4, #0
	ands r2, r1
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0xda
	ldr r1, _021E6A1C @ =0x00001084
	movs r2, #0
	lsls r0, r0, #4
_021E69CE:
	adds r2, r2, #1
	strh r1, [r3, r0]
	adds r3, r3, #2
	cmp r2, #8
	blt _021E69CE
	movs r0, #0xda
	lsls r0, r0, #4
	adds r0, r4, r0
	blx FUN_020CF8E4
	ldr r0, _021E6A20 @ =0x00007FFF
	movs r1, #0
	adds r2, r0, #0
	movs r3, #0x3f
	str r1, [sp]
	blx FUN_020CF910
	ldr r1, _021E6A24 @ =0x04000540
	movs r0, #2
	str r0, [r1]
	ldr r0, _021E6A28 @ =0xBFFF0000
	str r0, [r1, #0x40]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02027000
	movs r0, #1
	lsls r0, r0, #0xe
	movs r1, #1
	bl FUN_02027008
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021E6A10: .4byte 0x04000060
_021E6A14: .4byte 0xFFFFCFFD
_021E6A18: .4byte 0x0000CFFB
_021E6A1C: .4byte 0x00001084
_021E6A20: .4byte 0x00007FFF
_021E6A24: .4byte 0x04000540
_021E6A28: .4byte 0xBFFF0000
	thumb_func_end ov85_021E6980

	thumb_func_start ov85_021E6A2C
ov85_021E6A2C: @ 0x021E6A2C
	push {r4, r5, lr}
	sub sp, #0x9c
	adds r4, r0, #0
	movs r0, #0x66
	bl FUN_0201AC88
	ldr r1, _021E6B48 @ =0x00000D84
	ldr r2, _021E6B4C @ =0x04000304
	str r0, [r4, r1]
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	ldr r5, _021E6B50 @ =0x021EA538
	orrs r0, r1
	strh r0, [r2]
	add r3, sp, #0x8c
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E6B54 @ =0x021EA60C
	add r3, sp, #0x70
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
	ldr r0, _021E6B48 @ =0x00000D84
	movs r3, #0
	ldr r0, [r4, r0]
	bl FUN_0201B1E4
	ldr r0, _021E6B48 @ =0x00000D84
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x66
	bl FUN_0201C1C4
	ldr r5, _021E6B58 @ =0x021EA628
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
	ldr r0, _021E6B48 @ =0x00000D84
	movs r3, #0
	ldr r0, [r4, r0]
	bl FUN_0201B1E4
	ldr r0, _021E6B48 @ =0x00000D84
	movs r1, #2
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	ldr r5, _021E6B5C @ =0x021EA644
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
	ldr r0, _021E6B48 @ =0x00000D84
	movs r3, #0
	ldr r0, [r4, r0]
	bl FUN_0201B1E4
	ldr r0, _021E6B48 @ =0x00000D84
	movs r1, #3
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	ldr r5, _021E6B60 @ =0x021EA660
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
	ldr r0, _021E6B48 @ =0x00000D84
	movs r3, #0
	ldr r0, [r4, r0]
	bl FUN_0201B1E4
	ldr r0, _021E6B48 @ =0x00000D84
	movs r1, #6
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	ldr r5, _021E6B64 @ =0x021EA67C
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
	ldr r0, _021E6B48 @ =0x00000D84
	movs r3, #0
	ldr r0, [r4, r0]
	bl FUN_0201B1E4
	ldr r0, _021E6B48 @ =0x00000D84
	movs r1, #7
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	add sp, #0x9c
	pop {r4, r5, pc}
	nop
_021E6B48: .4byte 0x00000D84
_021E6B4C: .4byte 0x04000304
_021E6B50: .4byte 0x021EA538
_021E6B54: .4byte 0x021EA60C
_021E6B58: .4byte 0x021EA628
_021E6B5C: .4byte 0x021EA644
_021E6B60: .4byte 0x021EA660
_021E6B64: .4byte 0x021EA67C
	thumb_func_end ov85_021E6A2C

	thumb_func_start ov85_021E6B68
ov85_021E6B68: @ 0x021E6B68
	push {r3, r4, r5, lr}
	movs r1, #0x11
	movs r2, #0
	adds r4, r0, #0
	bl ov85_021E8588
	movs r1, #0xd9
	lsls r1, r1, #4
	adds r1, r4, r1
	adds r5, r0, #0
	blx FUN_020B7140
	movs r0, #0x40
	movs r2, #0
	ldr r1, _021E6D54 @ =0x00000D9C
	str r0, [sp]
	ldr r0, [r4, r1]
	subs r1, #0xc
	ldr r1, [r4, r1]
	adds r3, r2, #0
	ldr r1, [r1, #0xc]
	bl FUN_0200316C
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	movs r1, #0x14
	movs r2, #0
	bl ov85_021E8588
	movs r1, #0xd9
	lsls r1, r1, #4
	adds r1, r4, r1
	adds r5, r0, #0
	blx FUN_020B7140
	movs r0, #0x40
	ldr r1, _021E6D54 @ =0x00000D9C
	str r0, [sp]
	ldr r0, [r4, r1]
	subs r1, #0xc
	ldr r1, [r4, r1]
	movs r2, #1
	ldr r1, [r1, #0xc]
	movs r3, #0
	bl FUN_0200316C
	adds r0, r5, #0
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E6D54 @ =0x00000D9C
	ldr r2, _021E6D58 @ =0x0000FFFF
	ldr r0, [r4, r0]
	movs r1, #1
	movs r3, #8
	bl FUN_02003EA4
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl ov85_021E8588
	ldr r1, _021E6D5C @ =0x00000D8C
	adds r5, r0, #0
	adds r1, r4, r1
	blx FUN_020B70A8
	ldr r0, _021E6D5C @ =0x00000D8C
	movs r1, #0
	ldr r3, [r4, r0]
	subs r0, #8
	str r1, [sp]
	ldr r2, [r3, #0x14]
	ldr r0, [r4, r0]
	ldr r3, [r3, #0x10]
	movs r1, #3
	bl FUN_0201C0C0
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	movs r1, #0x16
	movs r2, #0
	bl ov85_021E8588
	adds r5, r0, #0
	ldr r1, _021E6D5C @ =0x00000D8C
	adds r1, r4, r1
	blx FUN_020B70A8
	ldr r0, _021E6D5C @ =0x00000D8C
	movs r1, #0
	ldr r3, [r4, r0]
	subs r0, #8
	str r1, [sp]
	ldr r2, [r3, #0x14]
	ldr r0, [r4, r0]
	ldr r3, [r3, #0x10]
	movs r1, #6
	bl FUN_0201C0C0
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #0
	bl ov85_021E8588
	ldr r1, _021E6D5C @ =0x00000D8C
	adds r5, r0, #0
	adds r1, r4, r1
	blx FUN_020B70A8
	ldr r0, _021E6D5C @ =0x00000D8C
	movs r1, #0
	ldr r3, [r4, r0]
	subs r0, #8
	str r1, [sp]
	ldr r2, [r3, #0x14]
	ldr r0, [r4, r0]
	ldr r3, [r3, #0x10]
	movs r1, #7
	bl FUN_0201C0C0
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0
	bl ov85_021E8588
	ldr r1, _021E6D60 @ =0x00000D88
	adds r5, r0, #0
	adds r1, r4, r1
	blx FUN_020B71D8
	ldr r0, _021E6D60 @ =0x00000D88
	movs r1, #2
	ldr r3, [r4, r0]
	subs r0, r0, #4
	adds r2, r3, #0
	ldr r0, [r4, r0]
	ldr r3, [r3, #8]
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, _021E6D64 @ =0x00000D84
	movs r1, #2
	ldr r0, [r4, r0]
	bl FUN_0201BF7C
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #0
	bl ov85_021E8588
	ldr r1, _021E6D60 @ =0x00000D88
	adds r5, r0, #0
	adds r1, r4, r1
	blx FUN_020B71D8
	ldr r0, _021E6D60 @ =0x00000D88
	movs r1, #3
	ldr r3, [r4, r0]
	subs r0, r0, #4
	adds r2, r3, #0
	ldr r0, [r4, r0]
	ldr r3, [r3, #8]
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, _021E6D64 @ =0x00000D84
	movs r1, #3
	ldr r0, [r4, r0]
	bl FUN_0201BF7C
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #0
	bl ov85_021E8588
	ldr r1, _021E6D60 @ =0x00000D88
	adds r5, r0, #0
	adds r1, r4, r1
	blx FUN_020B71D8
	ldr r0, _021E6D60 @ =0x00000D88
	movs r1, #6
	ldr r3, [r4, r0]
	subs r0, r0, #4
	adds r2, r3, #0
	ldr r0, [r4, r0]
	ldr r3, [r3, #8]
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, _021E6D64 @ =0x00000D84
	movs r1, #6
	ldr r0, [r4, r0]
	bl FUN_0201BF7C
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #0
	bl ov85_021E8588
	ldr r1, _021E6D60 @ =0x00000D88
	adds r5, r0, #0
	adds r1, r4, r1
	blx FUN_020B71D8
	ldr r0, _021E6D60 @ =0x00000D88
	movs r1, #7
	ldr r3, [r4, r0]
	subs r0, r0, #4
	adds r2, r3, #0
	ldr r0, [r4, r0]
	ldr r3, [r3, #8]
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, _021E6D64 @ =0x00000D84
	movs r1, #7
	ldr r0, [r4, r0]
	bl FUN_0201BF7C
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	nop
_021E6D54: .4byte 0x00000D9C
_021E6D58: .4byte 0x0000FFFF
_021E6D5C: .4byte 0x00000D8C
_021E6D60: .4byte 0x00000D88
_021E6D64: .4byte 0x00000D84
	thumb_func_end ov85_021E6B68

	thumb_func_start ov85_021E6D68
ov85_021E6D68: @ 0x021E6D68
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E6DA8 @ =0x00000D84
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E6DA8 @ =0x00000D84
	movs r1, #2
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E6DA8 @ =0x00000D84
	movs r1, #3
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E6DA8 @ =0x00000D84
	movs r1, #6
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E6DA8 @ =0x00000D84
	movs r1, #7
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E6DA8 @ =0x00000D84
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
_021E6DA8: .4byte 0x00000D84
	thumb_func_end ov85_021E6D68

	thumb_func_start ov85_021E6DAC
ov85_021E6DAC: @ 0x021E6DAC
	push {r3, r4, r5, lr}
	movs r2, #0
	adds r5, r0, #0
	bl ov85_021E8588
	ldr r1, _021E6DE8 @ =0x00000D88
	adds r4, r0, #0
	adds r1, r5, r1
	blx FUN_020B71D8
	ldr r0, _021E6DE8 @ =0x00000D88
	movs r1, #6
	ldr r3, [r5, r0]
	subs r0, r0, #4
	adds r2, r3, #0
	ldr r0, [r5, r0]
	ldr r3, [r3, #8]
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, _021E6DEC @ =0x00000D84
	movs r1, #6
	ldr r0, [r5, r0]
	bl FUN_0201BF7C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	nop
_021E6DE8: .4byte 0x00000D88
_021E6DEC: .4byte 0x00000D84
	thumb_func_end ov85_021E6DAC

	thumb_func_start ov85_021E6DF0
ov85_021E6DF0: @ 0x021E6DF0
	ldr r3, _021E6DF8 @ =ov85_021E6DAC
	movs r1, #0x1a
	bx r3
	nop
_021E6DF8: .4byte ov85_021E6DAC
	thumb_func_end ov85_021E6DF0

	thumb_func_start ov85_021E6DFC
ov85_021E6DFC: @ 0x021E6DFC
	ldr r3, _021E6E04 @ =ov85_021E6DAC
	movs r1, #0x18
	bx r3
	nop
_021E6E04: .4byte ov85_021E6DAC
	thumb_func_end ov85_021E6DFC

	thumb_func_start ov85_021E6E08
ov85_021E6E08: @ 0x021E6E08
	ldr r3, _021E6E10 @ =ov85_021E6DAC
	movs r1, #0x19
	bx r3
	nop
_021E6E10: .4byte ov85_021E6DAC
	thumb_func_end ov85_021E6E08

	thumb_func_start ov85_021E6E14
ov85_021E6E14: @ 0x021E6E14
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x66
	bl FUN_020030E8
	ldr r1, _021E6E68 @ =0x00000D9C
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_02003B50
	ldr r0, _021E6E68 @ =0x00000D9C
	movs r2, #2
	ldr r0, [r4, r0]
	movs r1, #0
	lsls r2, r2, #8
	movs r3, #0x66
	bl FUN_02003120
	ldr r0, _021E6E68 @ =0x00000D9C
	movs r1, #2
	ldr r0, [r4, r0]
	lsls r2, r1, #8
	movs r3, #0x66
	bl FUN_02003120
	ldr r0, _021E6E68 @ =0x00000D9C
	movs r1, #1
	ldr r0, [r4, r0]
	lsls r2, r1, #9
	movs r3, #0x66
	bl FUN_02003120
	ldr r0, _021E6E68 @ =0x00000D9C
	movs r2, #2
	ldr r0, [r4, r0]
	movs r1, #3
	lsls r2, r2, #8
	movs r3, #0x66
	bl FUN_02003120
	pop {r4, pc}
	.align 2, 0
_021E6E68: .4byte 0x00000D9C
	thumb_func_end ov85_021E6E14

	thumb_func_start ov85_021E6E6C
ov85_021E6E6C: @ 0x021E6E6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E6EA4 @ =0x00000D9C
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02003150
	ldr r0, _021E6EA4 @ =0x00000D9C
	movs r1, #2
	ldr r0, [r4, r0]
	bl FUN_02003150
	ldr r0, _021E6EA4 @ =0x00000D9C
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_02003150
	ldr r0, _021E6EA4 @ =0x00000D9C
	movs r1, #3
	ldr r0, [r4, r0]
	bl FUN_02003150
	ldr r0, _021E6EA4 @ =0x00000D9C
	ldr r0, [r4, r0]
	bl FUN_02003104
	pop {r4, pc}
	nop
_021E6EA4: .4byte 0x00000D9C
	thumb_func_end ov85_021E6E6C

	thumb_func_start ov85_021E6EA8
ov85_021E6EA8: @ 0x021E6EA8
	push {r3, lr}
	adds r3, r1, #0
	movs r1, #0
	str r1, [sp]
	ldr r1, _021E6EC4 @ =0x00000D9C
	lsls r3, r3, #0x18
	ldr r0, [r0, r1]
	ldr r2, _021E6EC8 @ =0x0000FFFF
	movs r1, #1
	lsrs r3, r3, #0x18
	bl FUN_02003EA4
	pop {r3, pc}
	nop
_021E6EC4: .4byte 0x00000D9C
_021E6EC8: .4byte 0x0000FFFF
	thumb_func_end ov85_021E6EA8

	thumb_func_start ov85_021E6ECC
ov85_021E6ECC: @ 0x021E6ECC
	push {r3, r4, lr}
	sub sp, #0x4c
	ldr r3, _021E6F58 @ =0x021EA6B8
	adds r4, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x2c
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r3, _021E6F5C @ =0x021EA56C
	add r2, sp, #0x18
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #0x66
	bl FUN_0200CF18
	ldr r1, _021E6F60 @ =0x00000D94
	add r2, sp, #0x18
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, sp, #0x2c
	movs r3, #0x20
	bl FUN_0200CF70
	ldr r3, _021E6F64 @ =0x021EA594
	add r2, sp, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, _021E6F60 @ =0x00000D94
	ldr r0, [r4, r0]
	bl FUN_0200CF38
	ldr r1, _021E6F68 @ =0x00000D98
	movs r2, #0xff
	str r0, [r4, r1]
	subs r0, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl FUN_0200CFF4
	cmp r0, #0
	bne _021E6F3C
	bl FUN_0202551C
_021E6F3C:
	ldr r1, _021E6F60 @ =0x00000D94
	add r2, sp, #0
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_0200D3F8
	cmp r0, #0
	bne _021E6F52
	bl FUN_0202551C
_021E6F52:
	add sp, #0x4c
	pop {r3, r4, pc}
	nop
_021E6F58: .4byte 0x021EA6B8
_021E6F5C: .4byte 0x021EA56C
_021E6F60: .4byte 0x00000D94
_021E6F64: .4byte 0x021EA594
_021E6F68: .4byte 0x00000D98
	thumb_func_end ov85_021E6ECC

	thumb_func_start ov85_021E6F6C
ov85_021E6F6C: @ 0x021E6F6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r2, _021E7020 @ =0x00000D94
	adds r1, r2, #4
	ldr r6, [r0, r2]
	adds r2, #8
	ldr r5, [r0, r1]
	ldr r7, [r0, r2]
	movs r0, #1
	bl FUN_0200A080
	movs r0, #0xd9
	movs r1, #0x66
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x10
	bl FUN_0200D504
	str r4, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #5
	str r0, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #2
	adds r2, r6, #0
	adds r3, r5, #0
	bl FUN_0200D68C
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x11
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x12
	bl FUN_0200D71C
	adds r0, r4, #0
	bl FUN_0200770C
	bl FUN_0203A880
	movs r0, #0x66
	bl FUN_0203A4AC
	add r1, sp, #0x18
	adds r4, r0, #0
	blx FUN_020B7140
	movs r0, #0x20
	str r0, [sp]
	ldr r1, [sp, #0x18]
	adds r0, r7, #0
	ldr r1, [r1, #0xc]
	movs r2, #2
	movs r3, #0xe0
	bl FUN_0200316C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E7020: .4byte 0x00000D94
	thumb_func_end ov85_021E6F6C

	thumb_func_start ov85_021E7024
ov85_021E7024: @ 0x021E7024
	push {r4, lr}
	ldr r1, _021E7040 @ =0x00000D94
	adds r4, r0, #0
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_0200D998
	ldr r0, _021E7040 @ =0x00000D94
	ldr r0, [r4, r0]
	bl FUN_0200D108
	pop {r4, pc}
	nop
_021E7040: .4byte 0x00000D94
	thumb_func_end ov85_021E7024

	thumb_func_start ov85_021E7044
ov85_021E7044: @ 0x021E7044
	adds r2, r1, #0
	ldr r1, _021E7054 @ =0x00000D94
	adds r3, r0, #0
	ldr r0, [r3, r1]
	adds r1, r1, #4
	ldr r1, [r3, r1]
	ldr r3, _021E7058 @ =FUN_0200D734
	bx r3
	.align 2, 0
_021E7054: .4byte 0x00000D94
_021E7058: .4byte FUN_0200D734
	thumb_func_end ov85_021E7044

	thumb_func_start ov85_021E705C
ov85_021E705C: @ 0x021E705C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, _021E7138 @ =0x00000C9C
	movs r1, #0
	str r1, [sp]
	movs r1, #0x66
	adds r4, r6, r0
	str r1, [sp, #4]
	adds r0, #0xe8
	movs r1, #1
	ldr r0, [r6, r0]
	adds r2, r1, #0
	movs r3, #0xf
	bl FUN_0200E3DC
	adds r0, r6, #0
	adds r0, #0xcc
	ldr r0, [r0]
	movs r1, #1
	ldr r0, [r0, #0x18]
	movs r2, #0xa
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x66
	str r0, [sp, #4]
	ldr r0, _021E713C @ =0x00000D84
	movs r3, #0xe
	ldr r0, [r6, r0]
	bl FUN_0200E644
	adds r0, r6, #0
	adds r0, #0xcc
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	bl FUN_0200E640
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xe0
	str r0, [sp, #8]
	ldr r0, _021E7140 @ =0x00000D9C
	movs r1, #0x26
	ldr r0, [r6, r0]
	movs r3, #0x66
	bl FUN_02003200
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xf0
	str r0, [sp, #8]
	ldr r0, _021E7140 @ =0x00000D9C
	movs r1, #0x10
	ldr r0, [r6, r0]
	movs r2, #8
	movs r3, #0x66
	bl FUN_02003200
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xce
	movs r3, #0x66
	bl FUN_0200BAF8
	str r0, [r4, #4]
	movs r0, #0x66
	bl FUN_0200BD08
	str r0, [r4, #8]
	ldr r0, _021E713C @ =0x00000D84
	adds r1, r4, #0
	ldr r0, [r6, r0]
	ldr r2, _021E7144 @ =0x021EA4FC
	adds r1, #0xc
	bl FUN_0201D4F8
	movs r0, #1
	lsls r0, r0, #8
	movs r1, #0x66
	bl FUN_02026354
	str r0, [r4, #0x6c]
	movs r4, #0
	adds r5, r6, #0
	movs r7, #8
_021E7112:
	adds r0, r7, #0
	movs r1, #0x66
	bl FUN_02026354
	adds r1, r5, #0
	adds r1, #0x98
	adds r4, r4, #1
	adds r5, r5, #4
	str r0, [r1]
	cmp r4, #5
	blt _021E7112
	adds r0, r6, #0
	adds r6, #0xcc
	ldr r1, [r6]
	ldr r1, [r1, #8]
	bl ov85_021E730C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E7138: .4byte 0x00000C9C
_021E713C: .4byte 0x00000D84
_021E7140: .4byte 0x00000D9C
_021E7144: .4byte 0x021EA4FC
	thumb_func_end ov85_021E705C

	thumb_func_start ov85_021E7148
ov85_021E7148: @ 0x021E7148
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _021E7190 @ =0x00000C9C
	adds r4, r5, r0
	adds r6, r4, #0
	adds r6, #0xc
	adds r0, r6, #0
	bl FUN_0201D8C8
	adds r0, r6, #0
	bl FUN_0201D520
	adds r0, r5, #0
	bl ov85_021E7350
	ldr r0, [r4, #4]
	bl FUN_0200BB44
	ldr r0, [r4, #8]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x6c]
	bl FUN_02026380
	movs r4, #0
_021E717A:
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #5
	blt _021E717A
	pop {r4, r5, r6, pc}
	nop
_021E7190: .4byte 0x00000C9C
	thumb_func_end ov85_021E7148

	thumb_func_start ov85_021E7194
ov85_021E7194: @ 0x021E7194
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r1, #0
	ldr r1, _021E71E8 @ =0x00000C9C
	adds r4, r0, r1
	adds r5, r4, #0
	adds r5, #0xc
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0xa
	movs r3, #0xe
	bl FUN_0200E998
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x6c]
	adds r1, r6, #0
	bl FUN_0200BB6C
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r4, #0x6c]
	adds r0, r5, #0
	movs r1, #1
	bl FUN_020200A8
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021E71E8: .4byte 0x00000C9C
	thumb_func_end ov85_021E7194

	thumb_func_start ov85_021E71EC
ov85_021E71EC: @ 0x021E71EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r1, #0
	ldr r1, _021E7270 @ =0x00000C9C
	adds r6, r2, #0
	adds r4, r0, r1
	adds r5, r4, #0
	adds r5, #0xc
	bl FUN_0203769C
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, [r4, #8]
	movs r1, #1
	bl FUN_0200BE48
	ldr r0, [r4, #8]
	movs r1, #2
	adds r2, r6, #0
	bl FUN_0200BE48
	movs r0, #1
	lsls r0, r0, #8
	movs r1, #0x66
	bl FUN_02026354
	adds r6, r0, #0
	ldr r0, [r4, #4]
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_0200BB6C
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x6c]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0xa
	movs r3, #0xe
	bl FUN_0200E998
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r4, #0x6c]
	adds r0, r5, #0
	movs r1, #1
	bl FUN_020200A8
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E7270: .4byte 0x00000C9C
	thumb_func_end ov85_021E71EC

	thumb_func_start ov85_021E7274
ov85_021E7274: @ 0x021E7274
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r1, #0
	ldr r1, _021E72E4 @ =0x00000C9C
	adds r4, r0, r1
	adds r5, r4, #0
	ldr r0, [r4, #8]
	movs r1, #0
	adds r5, #0xc
	bl FUN_0200C0CC
	movs r0, #1
	lsls r0, r0, #8
	movs r1, #0x66
	bl FUN_02026354
	adds r6, r0, #0
	ldr r0, [r4, #4]
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_0200BB6C
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x6c]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0xa
	movs r3, #0xe
	bl FUN_0200E998
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r4, #0x6c]
	adds r0, r5, #0
	movs r1, #1
	bl FUN_020200A8
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E72E4: .4byte 0x00000C9C
	thumb_func_end ov85_021E7274

	thumb_func_start ov85_021E72E8
ov85_021E72E8: @ 0x021E72E8
	push {r3, r4, r5, lr}
	ldr r4, _021E7308 @ =0x00000CA8
	adds r5, r0, #0
	adds r0, r5, r4
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, r4
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, r4
	bl FUN_0201D5C8
	pop {r3, r4, r5, pc}
	nop
_021E7308: .4byte 0x00000CA8
	thumb_func_end ov85_021E72E8

	thumb_func_start ov85_021E730C
ov85_021E730C: @ 0x021E730C
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	adds r7, r0, #0
	ldr r0, [sp]
	ldr r1, _021E7344 @ =0x00000C9C
	lsls r2, r0, #2
	ldr r0, _021E7348 @ =0x021EA5AC
	movs r6, #0
	ldr r4, [r0, r2]
	ldr r0, [sp]
	str r0, [r7, r1]
	cmp r0, #0
	ble _021E7342
	adds r5, r7, r1
	adds r5, #0x1c
_021E732A:
	ldr r0, _021E734C @ =0x00000D84
	adds r1, r5, #0
	ldr r0, [r7, r0]
	adds r2, r4, #0
	bl FUN_0201D4F8
	ldr r0, [sp]
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, r0
	blt _021E732A
_021E7342:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E7344: .4byte 0x00000C9C
_021E7348: .4byte 0x021EA5AC
_021E734C: .4byte 0x00000D84
	thumb_func_end ov85_021E730C

	thumb_func_start ov85_021E7350
ov85_021E7350: @ 0x021E7350
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _021E737C @ =0x00000C9C
	adds r6, r0, #0
	ldr r0, [r6, r7]
	movs r4, #0
	cmp r0, #0
	ble _021E7378
	adds r5, r6, r7
	adds r5, #0x1c
_021E7362:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	ldr r0, [r6, r7]
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, r0
	blt _021E7362
_021E7378:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E737C: .4byte 0x00000C9C
	thumb_func_end ov85_021E7350

	thumb_func_start ov85_021E7380
ov85_021E7380: @ 0x021E7380
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r1, #0
	ldr r1, _021E73D0 @ =0x00000CB8
	lsls r4, r2, #4
	adds r5, r0, r1
	movs r1, #1
	adds r7, r3, #0
	adds r0, r5, r4
	adds r2, r1, #0
	movs r3, #0xe
	bl FUN_0200E580
	adds r0, r5, r4
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	movs r3, #0x40
	bl FUN_020030A0
	movs r1, #0
	adds r3, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r7, [sp, #8]
	adds r0, r5, r4
	adds r2, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E73D0: .4byte 0x00000CB8
	thumb_func_end ov85_021E7380

	thumb_func_start ov85_021E73D4
ov85_021E73D4: @ 0x021E73D4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	str r2, [sp]
	adds r5, r3, #0
	ldr r4, _021E73FC @ =0x00010200
	bl FUN_0203769C
	cmp r5, r0
	bne _021E73EC
	movs r4, #0xc1
	lsls r4, r4, #0xa
_021E73EC:
	ldr r2, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r3, r4, #0
	bl ov85_021E7380
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E73FC: .4byte 0x00010200
	thumb_func_end ov85_021E73D4

	thumb_func_start ov85_021E7400
ov85_021E7400: @ 0x021E7400
	push {r3, r4, r5, lr}
	ldr r2, _021E7420 @ =0x00000CB8
	lsls r4, r1, #4
	adds r5, r0, r2
	adds r0, r5, r4
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, r4
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, r4
	bl FUN_0201D5C8
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7420: .4byte 0x00000CB8
	thumb_func_end ov85_021E7400

	thumb_func_start ov85_021E7424
ov85_021E7424: @ 0x021E7424
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, _021E748C @ =0x00000D0C
	adds r4, r5, r0
	movs r0, #0x66
	bl FUN_02023114
	str r0, [r4, #0x1c]
	movs r2, #0
	str r2, [r4, #8]
	str r2, [r4, #0xc]
	ldr r0, _021E7490 @ =0x0000E93F
	str r2, [r4, #0x10]
	strh r0, [r4, #0x14]
	strh r2, [r4, #0x16]
	ldr r0, _021E7494 @ =0x00143000
	ldr r1, _021E748C @ =0x00000D0C
	strh r2, [r4, #0x18]
	str r0, [r5, r1]
	ldr r0, _021E7498 @ =0x00000444
	str r0, [r4, #4]
	str r2, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0x1c]
	adds r2, r4, #0
	str r0, [sp, #8]
	ldr r3, [r4, #4]
	adds r0, r4, #0
	lsls r3, r3, #0x10
	ldr r1, [r5, r1]
	adds r0, #8
	adds r2, #0x14
	lsrs r3, r3, #0x10
	bl FUN_02023254
	movs r1, #0
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x10]
	str r1, [sp, #0xc]
	str r1, [sp, #0x14]
	ldr r1, [r4, #0x1c]
	add r0, sp, #0xc
	bl FUN_02023204
	ldr r0, [r4, #0x1c]
	bl FUN_0202313C
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E748C: .4byte 0x00000D0C
_021E7490: .4byte 0x0000E93F
_021E7494: .4byte 0x00143000
_021E7498: .4byte 0x00000444
	thumb_func_end ov85_021E7424

	thumb_func_start ov85_021E749C
ov85_021E749C: @ 0x021E749C
	ldr r1, _021E74A4 @ =0x00000D28
	ldr r3, _021E74A8 @ =FUN_02023120
	ldr r0, [r0, r1]
	bx r3
	.align 2, 0
_021E74A4: .4byte 0x00000D28
_021E74A8: .4byte FUN_02023120
	thumb_func_end ov85_021E749C

	thumb_func_start ov85_021E74AC
ov85_021E74AC: @ 0x021E74AC
	push {r4, r5, r6, lr}
	ldr r1, _021E74EC @ =0x00000D2C
	movs r6, #0
	adds r5, r0, r1
	adds r0, r5, #0
	adds r0, #0x10
	movs r1, #2
	adds r2, r6, #0
	movs r4, #3
	bl FUN_02021280
	adds r2, r5, #0
	adds r2, #0x18
	movs r0, #1
_021E74C8:
	ldrh r1, [r2, #0x16]
	cmp r1, #1
	bne _021E74D8
	ldrh r1, [r2, #0x12]
	adds r6, r0, #0
	str r1, [r5]
	ldrh r1, [r2, #0x14]
	str r1, [r5, #4]
_021E74D8:
	subs r2, #8
	subs r4, r4, #1
	bpl _021E74C8
	ldr r0, [r5, #0xc]
	eors r0, r6
	ands r0, r6
	str r0, [r5, #8]
	str r6, [r5, #0xc]
	pop {r4, r5, r6, pc}
	nop
_021E74EC: .4byte 0x00000D2C
	thumb_func_end ov85_021E74AC

	thumb_func_start ov85_021E74F0
ov85_021E74F0: @ 0x021E74F0
	ldr r1, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0x20
	blt _021E7508
	cmp r0, #0x9f
	bgt _021E7508
	cmp r1, #0x40
	blt _021E7508
	cmp r1, #0xbf
	bgt _021E7508
	movs r0, #1
	bx lr
_021E7508:
	movs r0, #0
	bx lr
	thumb_func_end ov85_021E74F0

	thumb_func_start ov85_021E750C
ov85_021E750C: @ 0x021E750C
	push {r3, lr}
	ldr r1, _021E7528 @ =0x00000D2C
	adds r0, r0, r1
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _021E7524
	bl ov85_021E74F0
	cmp r0, #1
	bne _021E7524
	movs r0, #1
	pop {r3, pc}
_021E7524:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_021E7528: .4byte 0x00000D2C
	thumb_func_end ov85_021E750C

	thumb_func_start ov85_021E752C
ov85_021E752C: @ 0x021E752C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r0, #0xcc
	ldr r0, [r0]
	adds r4, r6, #0
	ldr r0, [r0, #8]
	movs r2, #0x36
	lsls r5, r0, #2
	movs r0, #0x66
	ldr r3, _021E75AC @ =0x021EA5C4
	str r0, [sp]
	movs r1, #0
	adds r4, #0xd4
	adds r0, r4, #0
	str r1, [sp, #4]
	lsls r2, r2, #6
	ldr r2, [r6, r2]
	ldr r3, [r3, r5]
	adds r0, #0x54
	bl FUN_020696C4
	adds r0, r4, #0
	adds r0, #0x54
	bl FUN_02069714
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x68
	adds r1, #0x54
	bl FUN_02069978
	ldr r1, _021E75B0 @ =0x021EA5DC
	movs r0, #0
	adds r2, r4, #0
	ldr r1, [r1, r5]
	str r0, [r4, #0x3c]
	str r1, [r4, #0x44]
	movs r1, #1
	lsls r1, r1, #0xc
	str r1, [r4, #0x18]
	str r1, [r4, #0x1c]
	str r1, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x50
	strh r0, [r1]
	adds r6, #0xd4
	ldr r1, _021E75B4 @ =0xFFFDC000
	str r0, [r6]
	str r1, [r4, #4]
	str r0, [r4, #8]
	ldm r4!, {r0, r1}
	adds r2, #0xc
	stm r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E75AC: .4byte 0x021EA5C4
_021E75B0: .4byte 0x021EA5DC
_021E75B4: .4byte 0xFFFDC000
	thumb_func_end ov85_021E752C

	thumb_func_start ov85_021E75B8
ov85_021E75B8: @ 0x021E75B8
	movs r1, #0x4a
	lsls r1, r1, #2
	ldr r3, _021E75C4 @ =FUN_02069784
	adds r0, r0, r1
	bx r3
	nop
_021E75C4: .4byte FUN_02069784
	thumb_func_end ov85_021E75B8

	thumb_func_start ov85_021E75C8
ov85_021E75C8: @ 0x021E75C8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xd4
	ldr r0, [r4, #0x3c]
	str r0, [sp]
	ldr r1, [r4, #0x40]
	add r0, sp, #0
	bl ov85_021E8530
	ldr r1, [r4, #0x44]
	add r0, sp, #0
	bl ov85_021E8530
	ldr r1, [sp]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	movs r1, #0x5a
	asrs r0, r0, #0xc
	lsls r1, r1, #2
	subs r0, r1, r0
	blx FUN_020F2998
	adds r0, r4, #0
	adds r0, #0x4e
	strh r1, [r0]
	adds r5, #0xd4
	ldr r1, [r5]
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x24]
	adds r0, r1, r0
	adds r0, r2, r0
	str r0, [r4, #0xc]
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x34]
	ldr r2, [r4, #0x28]
	adds r0, r1, r0
	adds r0, r2, r0
	str r0, [r4, #0x10]
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x38]
	ldr r2, [r4, #0x2c]
	adds r0, r1, r0
	adds r0, r2, r0
	str r0, [r4, #0x14]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E75C8

	thumb_func_start ov85_021E7628
ov85_021E7628: @ 0x021E7628
	push {r3, lr}
	adds r3, r0, #0
	adds r3, #0xd4
	adds r0, r3, #0
	adds r1, r3, #0
	adds r2, r3, #0
	adds r0, #0x68
	adds r1, #0xc
	adds r2, #0x18
	adds r3, #0x4c
	bl FUN_020699D0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov85_021E7628

	thumb_func_start ov85_021E7644
ov85_021E7644: @ 0x021E7644
	ldr r3, _021E764C @ =ov85_021E8530
	adds r0, #0x3c
	bx r3
	nop
_021E764C: .4byte ov85_021E8530
	thumb_func_end ov85_021E7644

	thumb_func_start ov85_021E7650
ov85_021E7650: @ 0x021E7650
	ldr r3, _021E7654 @ =ov85_021E7660
	bx r3
	.align 2, 0
_021E7654: .4byte ov85_021E7660
	thumb_func_end ov85_021E7650

	thumb_func_start ov85_021E7658
ov85_021E7658: @ 0x021E7658
	ldr r3, _021E765C @ =ov85_021E7734
	bx r3
	.align 2, 0
_021E765C: .4byte ov85_021E7734
	thumb_func_end ov85_021E7658

	thumb_func_start ov85_021E7660
ov85_021E7660: @ 0x021E7660
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	movs r0, #0x66
	movs r1, #0
	str r0, [sp]
	movs r2, #0x36
	movs r5, #0x19
	lsls r5, r5, #4
	str r1, [sp, #4]
	lsls r2, r2, #6
	ldr r2, [r7, r2]
	adds r0, r7, r5
	adds r3, r1, #0
	bl FUN_020696C4
	adds r0, r7, r5
	bl FUN_02069714
	movs r0, #0x66
	str r0, [sp]
	movs r1, #0
	movs r2, #0x36
	adds r0, r7, r5
	str r1, [sp, #4]
	lsls r2, r2, #6
	ldr r2, [r7, r2]
	adds r0, #0x14
	movs r3, #5
	bl FUN_020696C4
	adds r0, r7, r5
	adds r0, #0x14
	bl FUN_02069714
	adds r4, r7, r5
	ldr r0, _021E772C @ =0x021EA558
	adds r4, #0x28
	str r0, [sp, #0xc]
	ldr r0, _021E7730 @ =0x021EA580
	adds r5, r7, r5
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0x10]
	adds r5, #0x8c
	adds r6, r4, #0
_021E76BC:
	movs r0, #0x66
	str r0, [sp]
	movs r0, #0
	movs r2, #0x36
	str r0, [sp, #4]
	ldr r3, [sp, #0xc]
	lsls r2, r2, #6
	ldr r2, [r7, r2]
	ldr r3, [r3]
	adds r0, r4, #0
	movs r1, #0
	bl FUN_020696C4
	adds r0, r4, #0
	bl FUN_02069714
	movs r0, #0x66
	str r0, [sp]
	movs r0, #0
	movs r2, #0x36
	str r0, [sp, #4]
	ldr r3, [sp, #8]
	lsls r2, r2, #6
	ldr r2, [r7, r2]
	ldr r3, [r3]
	adds r0, r5, #0
	movs r1, #0
	bl FUN_020697DC
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x66
	bl FUN_02069864
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_02069884
	ldr r0, [sp, #0x10]
	adds r4, #0x14
	adds r0, r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	adds r5, #0x24
	adds r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	adds r6, #0x14
	adds r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	cmp r0, #5
	blt _021E76BC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021E772C: .4byte 0x021EA558
_021E7730: .4byte 0x021EA580
	thumb_func_end ov85_021E7660

	thumb_func_start ov85_021E7734
ov85_021E7734: @ 0x021E7734
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0x19
	adds r5, r0, #0
	lsls r7, r7, #4
	adds r0, r5, r7
	bl FUN_02069784
	adds r0, r5, r7
	adds r0, #0x14
	bl FUN_02069784
	adds r4, r5, r7
	adds r5, r5, r7
	movs r6, #0
	adds r4, #0x28
	adds r5, #0x8c
_021E7754:
	adds r0, r4, #0
	bl FUN_02069784
	adds r0, r5, #0
	bl FUN_02069818
	adds r6, r6, #1
	adds r4, #0x14
	adds r5, #0x24
	cmp r6, #5
	blt _021E7754
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov85_021E7734

	thumb_func_start ov85_021E776C
ov85_021E776C: @ 0x021E776C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0x19
	adds r5, r0, #0
	adds r0, r4, #0
	lsls r1, r1, #4
	adds r0, #0x5c
	adds r1, r5, r1
	bl FUN_02069978
	movs r0, #1
	str r0, [r4, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov85_021E7A20
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov85_021E7AC8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E776C

	thumb_func_start ov85_021E7798
ov85_021E7798: @ 0x021E7798
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x30]
	movs r1, #0x19
	lsls r1, r1, #4
	adds r4, r5, r1
	str r0, [sp, #0xc]
	cmp r0, #0
	ble _021E7824
	subs r1, #0x50
	adds r0, r4, r1
	str r0, [sp, #8]
	movs r0, #0x4b
	lsls r0, r0, #4
	adds r0, r4, r0
	str r0, [sp]
	ldr r0, _021E7828 @ =0x0000071C
	str r4, [sp, #4]
	adds r7, r4, #0
	adds r6, r4, r0
_021E77C6:
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E77DC
	movs r1, #0x41
	lsls r1, r1, #2
	ldr r0, [sp, #8]
	adds r1, r5, r1
	bl ov85_021E78D8
_021E77DC:
	movs r0, #0x4b
	ldr r1, [sp, #4]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021E77F0
	ldr r1, [sp]
	adds r0, r5, #0
	bl ov85_021E7A54
_021E77F0:
	ldr r0, _021E7828 @ =0x0000071C
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _021E7800
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov85_021E7B04
_021E7800:
	ldr r0, [sp, #8]
	adds r4, #0xb0
	adds r0, #0xb0
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	adds r7, #0x68
	adds r0, #0x7c
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r6, #0x68
	adds r0, #0x7c
	str r0, [sp]
	ldr r0, [sp, #0x10]
	adds r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _021E77C6
_021E7824:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E7828: .4byte 0x0000071C
	thumb_func_end ov85_021E7798

	thumb_func_start ov85_021E782C
ov85_021E782C: @ 0x021E782C
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, [r0, #0x30]
	movs r7, #0
	str r1, [sp]
	movs r1, #0x19
	lsls r1, r1, #4
	adds r2, r0, r1
	movs r0, #0x4b
	lsls r0, r0, #4
	adds r4, r2, r0
	ldr r0, _021E78A0 @ =0x0000071C
	subs r1, #0x50
	adds r5, r2, r0
	ldr r0, [sp]
	adds r6, r2, r1
	cmp r0, #0
	ble _021E789E
_021E784E:
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _021E7868
	adds r0, r6, #0
	adds r1, r6, #0
	adds r2, r6, #0
	adds r3, r6, #0
	adds r0, #0x5c
	adds r1, #0x44
	adds r2, #0x38
	adds r3, #0x24
	bl FUN_020699D0
_021E7868:
	ldr r0, [r4]
	cmp r0, #0
	beq _021E7880
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r0, #0x24
	adds r1, #0x18
	adds r2, #0xc
	adds r3, r4, #4
	bl FUN_020699D0
_021E7880:
	ldr r0, [r5]
	cmp r0, #0
	beq _021E7890
	adds r0, r5, #0
	adds r0, #0x10
	adds r1, r5, #4
	bl FUN_020699BC
_021E7890:
	ldr r0, [sp]
	adds r7, r7, #1
	adds r6, #0xb0
	adds r4, #0x7c
	adds r5, #0x68
	cmp r7, r0
	blt _021E784E
_021E789E:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E78A0: .4byte 0x0000071C
	thumb_func_end ov85_021E782C

	thumb_func_start ov85_021E78A4
ov85_021E78A4: @ 0x021E78A4
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	movs r1, #0x19
	lsls r1, r1, #4
	ldr r7, [r0, #0x30]
	movs r6, #0
	adds r4, r0, r1
	cmp r7, #0
	ble _021E78D6
	subs r1, #0x34
	adds r5, r4, r1
_021E78BA:
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E78CC
	ldr r1, [sp]
	adds r0, r5, #0
	bl ov85_021E8530
_021E78CC:
	adds r6, r6, #1
	adds r4, #0xb0
	adds r5, #0xb0
	cmp r6, r7
	blt _021E78BA
_021E78D6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov85_021E78A4

	thumb_func_start ov85_021E78D8
ov85_021E78D8: @ 0x021E78D8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x1c]
	adds r4, r1, #0
	str r0, [sp]
	ldr r1, [r5, #0x20]
	add r0, sp, #0
	bl ov85_021E8530
	ldr r1, [sp]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r6, r0, #0x10
	adds r0, r6, #0
	bl FUN_0201FC30
	ldr r2, [r5, #0x50]
	ldr r1, [r4]
	adds r2, r2, r1
	movs r1, #0x16
	muls r1, r0, r1
	adds r0, r2, r1
	str r0, [r5, #0x44]
	movs r0, #6
	ldr r1, [r5, #0x54]
	lsls r0, r0, #0xc
	subs r1, r1, r0
	ldr r0, [r4, #4]
	adds r0, r1, r0
	str r0, [r5, #0x48]
	adds r0, r6, #0
	bl FUN_0201FBB8
	ldr r2, [r5, #0x58]
	ldr r1, [r4, #8]
	adds r2, r2, r1
	movs r1, #0x16
	muls r1, r0, r1
	adds r0, r2, r1
	str r0, [r5, #0x4c]
	ldr r1, [r5, #0x2c]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	strh r0, [r5, #0x24]
	ldr r1, [r5, #0x30]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	strh r0, [r5, #0x26]
	ldr r1, [r5, #0x34]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	strh r0, [r5, #0x28]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov85_021E78D8

	thumb_func_start ov85_021E7958
ov85_021E7958: @ 0x021E7958
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	movs r1, #0x19
	ldr r6, [r0, #0x30]
	lsls r1, r1, #4
	adds r1, r0, r1
	mov lr, r1
	ldr r0, [r0, #0x2c]
	movs r1, #0xa
	adds r2, r6, #0
	muls r2, r1, r2
	ldr r1, _021E7A18 @ =0x021EA7C4
	lsls r4, r0, #1
	adds r0, r1, r2
	ldrh r0, [r4, r0]
	movs r3, #0
	add r1, sp, #4
	lsls r5, r0, #0xc
	ldr r0, _021E7A1C @ =0x0000FFFF
	add r2, sp, #0x18
_021E7980:
	stm r1!, {r3}
	adds r3, r3, #1
	stm r2!, {r0}
	cmp r3, r6
	blt _021E7980
	movs r3, #0
	cmp r6, #0
	ble _021E79B8
	movs r0, #0x5a
	lsls r0, r0, #0xe
	mov r1, lr
	add r2, sp, #0x18
	adds r7, r5, r0
_021E799A:
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r4, [r1, r0]
	subs r0, r5, r4
	bpl _021E79A6
	subs r0, r7, r4
_021E79A6:
	asrs r4, r0, #0xb
	lsrs r4, r4, #0x14
	adds r4, r0, r4
	asrs r0, r4, #0xc
	adds r3, r3, #1
	stm r2!, {r0}
	adds r1, #0xb0
	cmp r3, r6
	blt _021E799A
_021E79B8:
	movs r7, #1
	cmp r6, #1
	ble _021E7A02
	add r0, sp, #8
	str r0, [sp]
	add r5, sp, #0x18
_021E79C4:
	ldr r0, [sp]
	add r2, sp, #4
	ldr r0, [r0]
	mov ip, r0
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	subs r0, r7, #1
	lsls r3, r0, #2
	adds r2, r2, r3
	b _021E79DE
_021E79D8:
	str r3, [r2, #4]
	subs r2, r2, #4
	subs r0, r0, #1
_021E79DE:
	cmp r0, #0
	blt _021E79EC
	ldr r3, [r2]
	lsls r4, r3, #2
	ldr r4, [r5, r4]
	cmp r4, r1
	bgt _021E79D8
_021E79EC:
	lsls r1, r0, #2
	add r0, sp, #4
	adds r1, r0, r1
	mov r0, ip
	str r0, [r1, #4]
	ldr r0, [sp]
	adds r7, r7, #1
	adds r0, r0, #4
	str r0, [sp]
	cmp r7, r6
	blt _021E79C4
_021E7A02:
	movs r1, #5
	lsls r1, r1, #6
	mov r0, lr
	adds r2, r0, r1
	ldr r1, [sp, #4]
	movs r0, #0xb0
	muls r0, r1, r0
	adds r0, r2, r0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_021E7A18: .4byte 0x021EA7C4
_021E7A1C: .4byte 0x0000FFFF
	thumb_func_end ov85_021E7958

	thumb_func_start ov85_021E7A20
ov85_021E7A20: @ 0x021E7A20
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x19
	lsls r0, r0, #4
	adds r3, r5, r0
	movs r0, #0x4b
	lsls r0, r0, #4
	adds r2, r3, r0
	ldr r4, [r1, #0x10]
	movs r0, #0x7c
	muls r0, r4, r0
	movs r6, #1
	adds r4, r2, r0
	str r6, [r2, r0]
	adds r0, r4, #0
	adds r3, #0x14
	str r1, [r4, #0x78]
	adds r0, #0x24
	adds r1, r3, #0
	bl FUN_02069978
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov85_021E7A54
	pop {r4, r5, r6, pc}
	thumb_func_end ov85_021E7A20

	thumb_func_start ov85_021E7A54
ov85_021E7A54: @ 0x021E7A54
	push {r4, r5}
	adds r3, r1, #0
	movs r0, #0
	strh r0, [r3, #4]
	strh r0, [r3, #6]
	strh r0, [r3, #8]
	ldr r5, [r3, #0x78]
	adds r4, r3, #0
	adds r5, #0x44
	adds r4, #0x18
	ldm r5!, {r0, r1}
	adds r2, r4, #0
	stm r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
	ldr r0, [r3, #0x78]
	ldr r1, [r2]
	ldr r0, [r0, #0x50]
	subs r0, r1, r0
	str r0, [r2]
	ldr r0, [r3, #0x78]
	ldr r1, [r3, #0x1c]
	ldr r0, [r0, #0x54]
	subs r0, r1, r0
	str r0, [r3, #0x1c]
	ldr r0, [r3, #0x78]
	ldr r1, [r3, #0x20]
	ldr r0, [r0, #0x58]
	subs r0, r1, r0
	str r0, [r3, #0x20]
	movs r0, #2
	ldr r1, [r3, #0x1c]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [r3, #0x1c]
	ldr r0, [r3, #0x78]
	ldr r1, [r0, #0x54]
	cmp r1, #0
	bge _021E7AA4
	rsbs r1, r1, #0
_021E7AA4:
	asrs r0, r1, #6
	lsrs r0, r0, #0x19
	adds r0, r1, r0
	asrs r1, r0, #7
	movs r0, #2
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _021E7AB6
	adds r1, r0, #0
_021E7AB6:
	movs r0, #1
	lsls r0, r0, #0xc
	subs r0, r0, r1
	str r0, [r3, #0xc]
	str r0, [r3, #0x10]
	str r0, [r3, #0x14]
	pop {r4, r5}
	bx lr
	.align 2, 0
	thumb_func_end ov85_021E7A54

	thumb_func_start ov85_021E7AC8
ov85_021E7AC8: @ 0x021E7AC8
	push {r3, r4, r5, lr}
	movs r2, #0x19
	lsls r2, r2, #4
	adds r3, r0, r2
	ldr r0, _021E7B00 @ =0x0000071C
	ldr r4, [r1, #0x10]
	adds r2, r3, r0
	adds r5, r4, #0
	movs r0, #0x68
	muls r5, r0, r5
	movs r4, #1
	str r4, [r2, r5]
	adds r4, r3, #0
	adds r0, r2, r5
	str r1, [r0, #0x64]
	ldr r2, [r1, #0x10]
	movs r1, #0x14
	adds r4, #0x28
	muls r1, r2, r1
	adds r1, r4, r1
	movs r4, #0x24
	adds r3, #0x8c
	muls r4, r2, r4
	adds r0, #0x10
	adds r2, r3, r4
	bl FUN_02069998
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7B00: .4byte 0x0000071C
	thumb_func_end ov85_021E7AC8

	thumb_func_start ov85_021E7B04
ov85_021E7B04: @ 0x021E7B04
	push {r3, r4, r5, lr}
	adds r2, r1, #0
	ldr r5, [r2, #0x64]
	adds r3, r0, #0
	adds r5, #0x44
	ldm r5!, {r0, r1}
	adds r4, r2, #4
	stm r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
	movs r0, #5
	ldr r1, [r2, #8]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [r2, #8]
	movs r0, #0x87
	lsls r0, r0, #2
	adds r3, r3, r0
	ldr r0, [r2, #0x64]
	movs r2, #1
	ldr r1, [r0, #0x10]
	movs r0, #0x24
	muls r0, r1, r0
	movs r1, #1
	adds r0, r3, r0
	lsls r1, r1, #0xc
	bl FUN_020698E8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E7B04

	thumb_func_start ov85_021E7B40
ov85_021E7B40: @ 0x021E7B40
	push {r3, r4, r5, lr}
	ldr r4, [sp, #0x18]
	adds r5, r0, #0
	str r1, [r4, #0xc]
	str r2, [r4, #0x10]
	ldr r0, [sp, #0x10]
	str r3, [r4, #0x14]
	str r2, [r4, #0x18]
	lsls r0, r0, #0xc
	str r0, [r4, #0x1c]
	ldr r0, [sp, #0x14]
	movs r1, #0x18
	lsls r0, r0, #0xc
	str r0, [r4, #0x20]
	movs r0, #1
	str r0, [r4]
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #0x66
	bl FUN_0201AACC
	adds r1, r0, #0
	adds r3, r1, #0
	movs r2, #0x18
	movs r0, #0
_021E7B72:
	strb r0, [r3]
	adds r3, r3, #1
	subs r2, r2, #1
	bne _021E7B72
	ldr r0, _021E7B88 @ =ov85_021E7B8C
	str r5, [r1, #0x14]
	movs r2, #0
	str r4, [r1, #0x10]
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7B88: .4byte ov85_021E7B8C
	thumb_func_end ov85_021E7B40

	thumb_func_start ov85_021E7B8C
ov85_021E7B8C: @ 0x021E7B8C
	push {r4, r5, r6, lr}
	ldr r4, _021E7BBC @ =0x021EA51C
	adds r6, r0, #0
	adds r5, r1, #0
_021E7B94:
	ldr r1, [r5]
	adds r0, r5, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _021E7B94
	cmp r0, #2
	bne _021E7BB8
	ldr r0, [r5, #0x10]
	movs r1, #1
	str r1, [r0, #8]
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_0200E390
_021E7BB8:
	pop {r4, r5, r6, pc}
	nop
_021E7BBC: .4byte 0x021EA51C
	thumb_func_end ov85_021E7B8C

	thumb_func_start ov85_021E7BC0
ov85_021E7BC0: @ 0x021E7BC0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	ldr r1, [r4, #0x10]
	lsls r0, r0, #0xc
	str r0, [r1, #0x38]
	str r0, [r1, #0x3c]
	str r0, [r1, #0x40]
	movs r0, #3
	lsls r0, r0, #0x12
	str r0, [r1, #0x54]
	ldr r0, [r4, #0x14]
	bl ov85_021E776C
	movs r0, #2
	lsls r0, r0, #0xe
	str r0, [r4, #0xc]
	movs r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E7BC0

	thumb_func_start ov85_021E7BEC
ov85_021E7BEC: @ 0x021E7BEC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x54]
	subs r0, r1, r0
	str r0, [r4, #0x54]
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _021E7C14
	movs r0, #0x1a
	ldr r1, [r4, #0x54]
	lsls r0, r0, #0xe
	cmp r1, r0
	bgt _021E7C14
	movs r0, #1
	str r0, [r5, #8]
	ldr r0, _021E7C28 @ =0x0000064F
	bl FUN_0200604C
_021E7C14:
	movs r0, #2
	ldr r1, [r4, #0x54]
	lsls r0, r0, #0x10
	cmp r1, r0
	bgt _021E7C24
	str r0, [r4, #0x54]
	movs r0, #2
	str r0, [r5]
_021E7C24:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7C28: .4byte 0x0000064F
	thumb_func_end ov85_021E7BEC

	thumb_func_start ov85_021E7C2C
ov85_021E7C2C: @ 0x021E7C2C
	push {r3, lr}
	movs r1, #1
	ldr r3, [r0, #0xc]
	lsls r1, r1, #0xc
	ldr r2, [r0, #0x10]
	cmp r3, r1
	ble _021E7C44
	subs r3, r3, r1
	str r3, [r0, #0xc]
	cmp r3, r1
	bge _021E7C44
	str r1, [r0, #0xc]
_021E7C44:
	ldr r3, [r2, #0x54]
	ldr r1, [r0, #0xc]
	subs r1, r3, r1
	str r1, [r2, #0x54]
	cmp r1, #0
	bgt _021E7C6A
	movs r1, #0
	str r1, [r2, #0x54]
	ldr r3, [r2, #0xc]
	ldr r0, [r0, #0x14]
	lsls r1, r3, #2
	adds r1, r0, r1
	adds r1, #0x98
	ldr r1, [r1]
	ldr r2, [r2, #0x14]
	bl ov85_021E73D4
	movs r0, #2
	pop {r3, pc}
_021E7C6A:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov85_021E7C2C

	thumb_func_start ov85_021E7C70
ov85_021E7C70: @ 0x021E7C70
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r1, [r5, #4]
	adds r6, r0, #0
	ldr r4, [r5, #0x1c]
	cmp r1, #0
	beq _021E7C84
	cmp r1, #1
	beq _021E7C9A
	pop {r4, r5, r6, pc}
_021E7C84:
	adds r1, r4, #0
	bl ov85_021E7E88
	movs r0, #1
	lsls r0, r0, #0xe
	str r0, [r5, #0x10]
	ldr r0, _021E7CDC @ =0xFFFFFBBC
	str r0, [r5, #0x14]
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
_021E7C9A:
	ldr r1, [r4, #0x54]
	ldr r0, [r5, #0x10]
	adds r0, r1, r0
	str r0, [r4, #0x54]
	ldr r1, [r5, #0x10]
	ldr r0, [r5, #0x14]
	adds r0, r1, r0
	str r0, [r5, #0x10]
	ldr r0, [r5, #8]
	adds r0, r0, #1
	str r0, [r5, #8]
	cmp r0, #0xf
	blt _021E7CDA
	movs r1, #0
	str r1, [r5, #8]
	str r1, [r5, #0x10]
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _021E7CC6
	movs r0, #1
	str r0, [r5, #0xc]
	pop {r4, r5, r6, pc}
_021E7CC6:
	str r1, [r4, #0x54]
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov85_021E7FC0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020E5B44
_021E7CDA:
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E7CDC: .4byte 0xFFFFFBBC
	thumb_func_end ov85_021E7C70

	thumb_func_start ov85_021E7CE0
ov85_021E7CE0: @ 0x021E7CE0
	push {r4, r5, r6, lr}
	ldr r0, _021E7D04 @ =0x00000AB4
	adds r6, r1, #0
	adds r5, r6, r0
	movs r4, #0
_021E7CEA:
	ldr r0, [r5]
	cmp r0, #0
	beq _021E7CF8
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov85_021E7C70
_021E7CF8:
	adds r4, r4, #1
	adds r5, #0x20
	cmp r4, #5
	blt _021E7CEA
	pop {r4, r5, r6, pc}
	nop
_021E7D04: .4byte 0x00000AB4
	thumb_func_end ov85_021E7CE0

	thumb_func_start ov85_021E7D08
ov85_021E7D08: @ 0x021E7D08
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E7D38 @ =0x00000AB4
	movs r1, #0
	adds r0, r4, r0
	movs r2, #0xa0
	blx FUN_020E5B44
	movs r2, #1
	ldr r0, _021E7D3C @ =ov85_021E7CE0
	adds r1, r4, #0
	lsls r2, r2, #8
	bl FUN_0200E320
	movs r1, #0xdb
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E7D34
	bl FUN_0202551C
_021E7D34:
	pop {r4, pc}
	nop
_021E7D38: .4byte 0x00000AB4
_021E7D3C: .4byte ov85_021E7CE0
	thumb_func_end ov85_021E7D08

	thumb_func_start ov85_021E7D40
ov85_021E7D40: @ 0x021E7D40
	movs r1, #0xdb
	lsls r1, r1, #4
	ldr r3, _021E7D4C @ =FUN_0200E390
	ldr r0, [r0, r1]
	bx r3
	nop
_021E7D4C: .4byte FUN_0200E390
	thumb_func_end ov85_021E7D40

	thumb_func_start ov85_021E7D50
ov85_021E7D50: @ 0x021E7D50
	push {r3, lr}
	ldr r2, _021E7D74 @ =0x00000AB4
	adds r3, r0, r2
	movs r2, #0
_021E7D58:
	ldr r0, [r3]
	cmp r0, #0
	bne _021E7D66
	movs r0, #1
	str r0, [r3]
	str r1, [r3, #0x1c]
	pop {r3, pc}
_021E7D66:
	adds r2, r2, #1
	adds r3, #0x20
	cmp r2, #5
	blt _021E7D58
	bl FUN_0202551C
	pop {r3, pc}
	.align 2, 0
_021E7D74: .4byte 0x00000AB4
	thumb_func_end ov85_021E7D50

	thumb_func_start ov85_021E7D78
ov85_021E7D78: @ 0x021E7D78
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x19
	lsls r1, r1, #4
	adds r4, r0, r1
	subs r1, #0x50
	ldr r7, [r0, #0x30]
	str r0, [sp]
	movs r6, #0
	adds r5, r4, r1
_021E7D8A:
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E7D9C
	ldr r0, [sp]
	adds r1, r5, #0
	bl ov85_021E7D50
_021E7D9C:
	adds r6, r6, #1
	adds r4, #0xb0
	adds r5, #0xb0
	cmp r6, r7
	blt _021E7D8A
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov85_021E7D78

	thumb_func_start ov85_021E7DA8
ov85_021E7DA8: @ 0x021E7DA8
	ldr r1, _021E7DC4 @ =0x00000AB4
	adds r2, r0, r1
	movs r1, #0
_021E7DAE:
	ldr r0, [r2]
	cmp r0, #0
	beq _021E7DB8
	movs r0, #1
	bx lr
_021E7DB8:
	adds r1, r1, #1
	adds r2, #0x20
	cmp r1, #5
	blt _021E7DAE
	movs r0, #0
	bx lr
	.align 2, 0
_021E7DC4: .4byte 0x00000AB4
	thumb_func_end ov85_021E7DA8

	thumb_func_start ov85_021E7DC8
ov85_021E7DC8: @ 0x021E7DC8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldr r4, [r5, #0x10]
	cmp r0, #0
	beq _021E7DDA
	cmp r0, #1
	beq _021E7DEA
	pop {r3, r4, r5, pc}
_021E7DDA:
	movs r0, #6
	lsls r0, r0, #0xe
	str r0, [r5, #0xc]
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
_021E7DEA:
	adds r0, r4, #0
	ldr r1, [r5, #0xc]
	adds r0, #0x30
	bl ov85_021E8530
	movs r0, #1
	ldr r1, [r4, #0x30]
	lsls r0, r0, #0xe
	cmp r1, r0
	bge _021E7E16
	ldr r1, [r5, #0xc]
	lsrs r1, r1, #1
	str r1, [r5, #0xc]
	cmp r1, r0
	bge _021E7E16
	movs r1, #0
	str r1, [r4, #0x30]
	movs r0, #0x14
_021E7E0E:
	strb r1, [r5]
	adds r5, r5, #1
	subs r0, r0, #1
	bne _021E7E0E
_021E7E16:
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E7DC8

	thumb_func_start ov85_021E7E18
ov85_021E7E18: @ 0x021E7E18
	push {r3, r4, r5, lr}
	ldr r0, _021E7E38 @ =0x00000B54
	movs r4, #0
	adds r5, r1, r0
_021E7E20:
	ldr r0, [r5]
	cmp r0, #0
	beq _021E7E2C
	adds r0, r5, #0
	bl ov85_021E7DC8
_021E7E2C:
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, #5
	blt _021E7E20
	pop {r3, r4, r5, pc}
	nop
_021E7E38: .4byte 0x00000B54
	thumb_func_end ov85_021E7E18

	thumb_func_start ov85_021E7E3C
ov85_021E7E3C: @ 0x021E7E3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E7E68 @ =0x00000B54
	movs r1, #0
	adds r0, r4, r0
	movs r2, #0x64
	blx FUN_020E5B44
	ldr r0, _021E7E6C @ =ov85_021E7E18
	ldr r2, _021E7E70 @ =0x00000101
	adds r1, r4, #0
	bl FUN_0200E320
	ldr r1, _021E7E74 @ =0x00000DB4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E7E64
	bl FUN_0202551C
_021E7E64:
	pop {r4, pc}
	nop
_021E7E68: .4byte 0x00000B54
_021E7E6C: .4byte ov85_021E7E18
_021E7E70: .4byte 0x00000101
_021E7E74: .4byte 0x00000DB4
	thumb_func_end ov85_021E7E3C

	thumb_func_start ov85_021E7E78
ov85_021E7E78: @ 0x021E7E78
	ldr r1, _021E7E80 @ =0x00000DB4
	ldr r3, _021E7E84 @ =FUN_0200E390
	ldr r0, [r0, r1]
	bx r3
	.align 2, 0
_021E7E80: .4byte 0x00000DB4
_021E7E84: .4byte FUN_0200E390
	thumb_func_end ov85_021E7E78

	thumb_func_start ov85_021E7E88
ov85_021E7E88: @ 0x021E7E88
	push {r4, lr}
	ldr r2, _021E7ECC @ =0x00000B54
	movs r3, #0
	adds r0, r0, r2
	adds r4, r0, #0
_021E7E92:
	ldr r2, [r4]
	cmp r2, #1
	bne _021E7EA4
	ldr r2, [r4, #0x10]
	cmp r2, r1
	bne _021E7EA4
	movs r0, #0
	str r0, [r4, #4]
	pop {r4, pc}
_021E7EA4:
	adds r3, r3, #1
	adds r4, #0x14
	cmp r3, #5
	blt _021E7E92
	movs r3, #0
_021E7EAE:
	ldr r2, [r0]
	cmp r2, #0
	bne _021E7EBC
	movs r2, #1
	str r2, [r0]
	str r1, [r0, #0x10]
	pop {r4, pc}
_021E7EBC:
	adds r3, r3, #1
	adds r0, #0x14
	cmp r3, #5
	blt _021E7EAE
	bl FUN_0202551C
	pop {r4, pc}
	nop
_021E7ECC: .4byte 0x00000B54
	thumb_func_end ov85_021E7E88

	thumb_func_start ov85_021E7ED0
ov85_021E7ED0: @ 0x021E7ED0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldr r4, [r5, #0x14]
	cmp r0, #0
	beq _021E7EE2
	cmp r0, #1
	beq _021E7EFA
	pop {r4, r5, r6, pc}
_021E7EE2:
	movs r0, #0
	str r0, [r4, #0x34]
	str r0, [r5, #0x10]
	movs r0, #0x1e
	lsls r0, r0, #0xc
	str r0, [r5, #8]
	movs r0, #5
	lsls r0, r0, #0xe
	str r0, [r5, #0xc]
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
_021E7EFA:
	ldr r1, [r5, #0x10]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r0, r0, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FBB8
	ldr r2, [r5, #8]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r2, r1, #0xc
	adds r1, r2, #0
	muls r1, r0, r1
	movs r0, #0
	str r0, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x34
	bl ov85_021E8530
	adds r0, r5, #0
	ldr r1, [r5, #0xc]
	adds r0, #0x10
	ldr r6, [r5, #0x10]
	bl ov85_021E8530
	ldr r0, [r5, #0x10]
	cmp r0, r6
	bge _021E7F4C
	ldr r0, [r5, #8]
	lsrs r0, r0, #1
	str r0, [r5, #8]
	bne _021E7F4C
	movs r1, #0
	str r1, [r4, #0x34]
	movs r0, #0x18
_021E7F44:
	strb r1, [r5]
	adds r5, r5, #1
	subs r0, r0, #1
	bne _021E7F44
_021E7F4C:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov85_021E7ED0

	thumb_func_start ov85_021E7F50
ov85_021E7F50: @ 0x021E7F50
	push {r3, r4, r5, lr}
	ldr r0, _021E7F70 @ =0x00000BB8
	movs r4, #0
	adds r5, r1, r0
_021E7F58:
	ldr r0, [r5]
	cmp r0, #0
	beq _021E7F64
	adds r0, r5, #0
	bl ov85_021E7ED0
_021E7F64:
	adds r4, r4, #1
	adds r5, #0x18
	cmp r4, #5
	blt _021E7F58
	pop {r3, r4, r5, pc}
	nop
_021E7F70: .4byte 0x00000BB8
	thumb_func_end ov85_021E7F50

	thumb_func_start ov85_021E7F74
ov85_021E7F74: @ 0x021E7F74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E7FA0 @ =0x00000BB8
	movs r1, #0
	adds r0, r4, r0
	movs r2, #0x78
	blx FUN_020E5B44
	ldr r0, _021E7FA4 @ =ov85_021E7F50
	ldr r2, _021E7FA8 @ =0x00000102
	adds r1, r4, #0
	bl FUN_0200E320
	ldr r1, _021E7FAC @ =0x00000DB8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E7F9C
	bl FUN_0202551C
_021E7F9C:
	pop {r4, pc}
	nop
_021E7FA0: .4byte 0x00000BB8
_021E7FA4: .4byte ov85_021E7F50
_021E7FA8: .4byte 0x00000102
_021E7FAC: .4byte 0x00000DB8
	thumb_func_end ov85_021E7F74

	thumb_func_start ov85_021E7FB0
ov85_021E7FB0: @ 0x021E7FB0
	ldr r1, _021E7FB8 @ =0x00000DB8
	ldr r3, _021E7FBC @ =FUN_0200E390
	ldr r0, [r0, r1]
	bx r3
	.align 2, 0
_021E7FB8: .4byte 0x00000DB8
_021E7FBC: .4byte FUN_0200E390
	thumb_func_end ov85_021E7FB0

	thumb_func_start ov85_021E7FC0
ov85_021E7FC0: @ 0x021E7FC0
	push {r4, lr}
	ldr r2, _021E8004 @ =0x00000BB8
	movs r3, #0
	adds r0, r0, r2
	adds r4, r0, #0
_021E7FCA:
	ldr r2, [r4]
	cmp r2, #1
	bne _021E7FDC
	ldr r2, [r4, #0x14]
	cmp r2, r1
	bne _021E7FDC
	movs r0, #0
	str r0, [r4, #4]
	pop {r4, pc}
_021E7FDC:
	adds r3, r3, #1
	adds r4, #0x18
	cmp r3, #5
	blt _021E7FCA
	movs r3, #0
_021E7FE6:
	ldr r2, [r0]
	cmp r2, #0
	bne _021E7FF4
	movs r2, #1
	str r2, [r0]
	str r1, [r0, #0x14]
	pop {r4, pc}
_021E7FF4:
	adds r3, r3, #1
	adds r0, #0x18
	cmp r3, #5
	blt _021E7FE6
	bl FUN_0202551C
	pop {r4, pc}
	nop
_021E8004: .4byte 0x00000BB8
	thumb_func_end ov85_021E7FC0

	thumb_func_start ov85_021E8008
ov85_021E8008: @ 0x021E8008
	push {r4, lr}
	adds r4, r1, #0
	ldr r2, [r4]
	adds r1, r0, #0
	adds r1, #0xd4
	cmp r2, #5
	bhi _021E80C6
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_021E8022: @ jump table
	.2byte _021E80C6 - _021E8022 - 2 @ case 0
	.2byte _021E802E - _021E8022 - 2 @ case 1
	.2byte _021E803E - _021E8022 - 2 @ case 2
	.2byte _021E8056 - _021E8022 - 2 @ case 3
	.2byte _021E807C - _021E8022 - 2 @ case 4
	.2byte _021E80AE - _021E8022 - 2 @ case 5
_021E802E:
	movs r0, #1
	lsls r0, r0, #0xe
	str r0, [r4, #0x10]
	movs r0, #0
	str r0, [r4, #0xc]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_021E803E:
	movs r0, #1
	ldr r2, [r1, #0x34]
	lsls r0, r0, #0xc
	subs r2, r2, r0
	ldr r0, _021E80C8 @ =0xFFFF8000
	str r2, [r1, #0x34]
	cmp r2, r0
	bgt _021E80C6
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_021E8056:
	movs r2, #2
	ldr r3, [r1, #0x34]
	lsls r2, r2, #0xc
	adds r2, r3, r2
	str r2, [r1, #0x34]
	bmi _021E80C6
	movs r2, #0
	str r2, [r1, #0x34]
	bl ov85_021E7D78
	movs r0, #1
	str r0, [r4, #4]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	ldr r0, _021E80CC @ =0x00000656
	bl FUN_0200604C
	pop {r4, pc}
_021E807C:
	ldr r0, [r4, #0x10]
	str r0, [r1, #0x28]
	ldr r0, [r4, #0x10]
	rsbs r0, r0, #0
	str r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	adds r2, r0, #1
	movs r0, #3
	str r2, [r4, #0xc]
	tst r0, r2
	bne _021E80C6
	movs r0, #1
	ldr r2, [r4, #0x10]
	lsls r0, r0, #0xc
	cmp r2, r0
	bgt _021E80A8
	movs r0, #0
	str r0, [r1, #0x28]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_021E80A8:
	asrs r0, r2, #1
	str r0, [r4, #0x10]
	pop {r4, pc}
_021E80AE:
	bl ov85_021E7DA8
	cmp r0, #0
	bne _021E80C6
	movs r0, #0
	str r0, [r4, #8]
	str r0, [r4, #4]
	str r0, [r4]
	movs r0, #0x63
	lsls r0, r0, #4
	bl FUN_0200604C
_021E80C6:
	pop {r4, pc}
	.align 2, 0
_021E80C8: .4byte 0xFFFF8000
_021E80CC: .4byte 0x00000656
	thumb_func_end ov85_021E8008

	thumb_func_start ov85_021E80D0
ov85_021E80D0: @ 0x021E80D0
	movs r2, #0xc3
	ldr r3, _021E80DC @ =ov85_021E8008
	lsls r2, r2, #4
	adds r0, r1, #0
	adds r1, r1, r2
	bx r3
	.align 2, 0
_021E80DC: .4byte ov85_021E8008
	thumb_func_end ov85_021E80D0

	thumb_func_start ov85_021E80E0
ov85_021E80E0: @ 0x021E80E0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc3
	lsls r0, r0, #4
	adds r2, r4, r0
	movs r1, #0x14
	movs r0, #0
_021E80EE:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _021E80EE
	ldr r0, _021E8110 @ =ov85_021E80D0
	adds r1, r4, #0
	movs r2, #0xff
	bl FUN_0200E320
	ldr r1, _021E8114 @ =0x00000DBC
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E810E
	bl FUN_0202551C
_021E810E:
	pop {r4, pc}
	.align 2, 0
_021E8110: .4byte ov85_021E80D0
_021E8114: .4byte 0x00000DBC
	thumb_func_end ov85_021E80E0

	thumb_func_start ov85_021E8118
ov85_021E8118: @ 0x021E8118
	ldr r1, _021E8120 @ =0x00000DBC
	ldr r3, _021E8124 @ =FUN_0200E390
	ldr r0, [r0, r1]
	bx r3
	.align 2, 0
_021E8120: .4byte 0x00000DBC
_021E8124: .4byte FUN_0200E390
	thumb_func_end ov85_021E8118

	thumb_func_start ov85_021E8128
ov85_021E8128: @ 0x021E8128
	push {r4, lr}
	movs r1, #0xc3
	lsls r1, r1, #4
	adds r4, r0, r1
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E813A
	bl FUN_0202551C
_021E813A:
	movs r0, #1
	str r0, [r4, #8]
	str r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E8128

	thumb_func_start ov85_021E8144
ov85_021E8144: @ 0x021E8144
	ldr r1, _021E814C @ =0x00000C34
	ldr r0, [r0, r1]
	bx lr
	nop
_021E814C: .4byte 0x00000C34
	thumb_func_end ov85_021E8144

	thumb_func_start ov85_021E8150
ov85_021E8150: @ 0x021E8150
	ldr r1, _021E8158 @ =0x00000C38
	ldr r0, [r0, r1]
	bx lr
	nop
_021E8158: .4byte 0x00000C38
	thumb_func_end ov85_021E8150

	thumb_func_start ov85_021E815C
ov85_021E815C: @ 0x021E815C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E8172
	cmp r0, #1
	beq _021E81C6
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E8172:
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bge _021E81A8
	ldr r5, _021E81DC @ =0x021EA528
	add r3, sp, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4, #4]
	subs r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #0
	bgt _021E81A8
	movs r0, #0x1e
	str r0, [r4, #4]
	ldr r0, [r4, #0xc]
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0200604C
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
_021E81A8:
	movs r1, #6
	ldr r0, [r4, #0x14]
	lsls r1, r1, #0xa
	bl FUN_0200DC34
	ldr r0, [r4, #0x14]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _021E81D8
	ldr r0, [r4]
	add sp, #0x10
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E81C6:
	ldr r0, [r4, #0x14]
	bl FUN_0200D9DC
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
_021E81D8:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E81DC: .4byte 0x021EA528
	thumb_func_end ov85_021E815C

	thumb_func_start ov85_021E81E0
ov85_021E81E0: @ 0x021E81E0
	push {r4, r5, lr}
	sub sp, #0x34
	adds r5, r0, #0
	movs r0, #0x66
	movs r1, #0x18
	bl FUN_0201AACC
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #0x18
	movs r0, #0
_021E81F6:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _021E81F6
	movs r1, #0x80
	add r0, sp, #0
	strh r1, [r0]
	movs r1, #0x64
	strh r1, [r0, #2]
	movs r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #4
	str r0, [sp, #0x14]
	movs r0, #5
	str r0, [sp, #0x18]
	movs r0, #6
	str r0, [sp, #0x1c]
	movs r0, #7
	str r0, [sp, #0x20]
	subs r0, #8
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x2c]
	str r1, [sp, #0x30]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r5, #0
	add r1, sp, #0
	bl ov85_021E7044
	str r0, [r4, #0x14]
	bl FUN_0200DC18
	ldr r0, _021E8258 @ =ov85_021E815C
	adds r1, r4, #0
	movs r2, #0
	str r5, [r4, #0x10]
	bl FUN_0200E320
	adds r4, r0, #0
	bne _021E8252
	bl FUN_0202551C
_021E8252:
	adds r0, r4, #0
	add sp, #0x34
	pop {r4, r5, pc}
	.align 2, 0
_021E8258: .4byte ov85_021E815C
	thumb_func_end ov85_021E81E0

	thumb_func_start ov85_021E825C
ov85_021E825C: @ 0x021E825C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldrh r1, [r4]
	adds r5, r0, #0
	cmp r1, #4
	bhi _021E82DC
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E8274: @ jump table
	.2byte _021E82DC - _021E8274 - 2 @ case 0
	.2byte _021E827E - _021E8274 - 2 @ case 1
	.2byte _021E8292 - _021E8274 - 2 @ case 2
	.2byte _021E82AE - _021E8274 - 2 @ case 3
	.2byte _021E82C8 - _021E8274 - 2 @ case 4
_021E827E:
	bl ov85_021E6DF0
	ldr r0, _021E82E0 @ =0x000005E4
	bl FUN_0200604C
	movs r0, #0
	str r0, [r4, #4]
	ldrh r0, [r4]
	adds r0, r0, #1
	strh r0, [r4]
_021E8292:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #2
	blt _021E82DC
	movs r0, #0
	str r0, [r4, #4]
	ldrh r0, [r4]
	adds r0, r0, #1
	strh r0, [r4]
	adds r0, r5, #0
	bl ov85_021E6E08
	pop {r3, r4, r5, pc}
_021E82AE:
	ldr r1, [r4, #4]
	adds r1, r1, #1
	str r1, [r4, #4]
	cmp r1, #4
	blt _021E82DC
	bl ov85_021E6DF0
	movs r0, #0
	str r0, [r4, #4]
	ldrh r0, [r4]
	adds r0, r0, #1
	strh r0, [r4]
	pop {r3, r4, r5, pc}
_021E82C8:
	ldr r1, [r4, #4]
	adds r1, r1, #1
	str r1, [r4, #4]
	cmp r1, #2
	blt _021E82DC
	bl ov85_021E6DFC
	movs r0, #0
	strh r0, [r4, #2]
	strh r0, [r4]
_021E82DC:
	pop {r3, r4, r5, pc}
	nop
_021E82E0: .4byte 0x000005E4
	thumb_func_end ov85_021E825C

	thumb_func_start ov85_021E82E4
ov85_021E82E4: @ 0x021E82E4
	ldr r2, _021E82F0 @ =0x00000C44
	ldr r3, _021E82F4 @ =ov85_021E825C
	adds r0, r1, #0
	adds r1, r1, r2
	bx r3
	nop
_021E82F0: .4byte 0x00000C44
_021E82F4: .4byte ov85_021E825C
	thumb_func_end ov85_021E82E4

	thumb_func_start ov85_021E82F8
ov85_021E82F8: @ 0x021E82F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E8330 @ =0x00000C44
	ldr r2, _021E8334 @ =0x00000103
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	strb r0, [r1, #4]
	strb r0, [r1, #5]
	strb r0, [r1, #6]
	strb r0, [r1, #7]
	ldr r0, _021E8338 @ =ov85_021E82E4
	adds r1, r4, #0
	bl FUN_0200E320
	movs r1, #0x37
	lsls r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E832C
	bl FUN_0202551C
_021E832C:
	pop {r4, pc}
	nop
_021E8330: .4byte 0x00000C44
_021E8334: .4byte 0x00000103
_021E8338: .4byte ov85_021E82E4
	thumb_func_end ov85_021E82F8

	thumb_func_start ov85_021E833C
ov85_021E833C: @ 0x021E833C
	movs r1, #0x37
	lsls r1, r1, #6
	ldr r3, _021E8348 @ =FUN_0200E390
	ldr r0, [r0, r1]
	bx r3
	nop
_021E8348: .4byte FUN_0200E390
	thumb_func_end ov85_021E833C

	thumb_func_start ov85_021E834C
ov85_021E834C: @ 0x021E834C
	ldr r1, _021E8354 @ =0x00000C46
	ldrh r0, [r0, r1]
	bx lr
	nop
_021E8354: .4byte 0x00000C46
	thumb_func_end ov85_021E834C

	thumb_func_start ov85_021E8358
ov85_021E8358: @ 0x021E8358
	push {r4, lr}
	ldr r1, _021E8370 @ =0x00000C44
	adds r4, r0, r1
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _021E8368
	bl FUN_0202551C
_021E8368:
	movs r0, #1
	strh r0, [r4, #2]
	strh r0, [r4]
	pop {r4, pc}
	.align 2, 0
_021E8370: .4byte 0x00000C44
	thumb_func_end ov85_021E8358

	thumb_func_start ov85_021E8374
ov85_021E8374: @ 0x021E8374
	ldr r0, [r1]
	cmp r0, #0
	beq _021E83BA
	cmp r0, #1
	beq _021E8384
	cmp r0, #2
	beq _021E83A8
	bx lr
_021E8384:
	ldr r0, [r1, #4]
	lsls r2, r0, #2
	ldr r0, _021E83BC @ =0x021EAA80
	ldr r0, [r0, r2]
	lsls r2, r0, #0xc
	ldr r0, [r1, #0xc]
	str r2, [r0, #0x54]
	ldr r0, [r1, #4]
	adds r0, r0, #1
	str r0, [r1, #4]
	cmp r0, #0x10
	blt _021E83BA
	movs r0, #0
	str r0, [r1, #4]
	ldr r0, [r1]
	adds r0, r0, #1
	str r0, [r1]
	bx lr
_021E83A8:
	ldr r0, [r1, #8]
	adds r0, r0, #1
	str r0, [r1, #8]
	cmp r0, #0xf
	blt _021E83BA
	movs r0, #0
	str r0, [r1, #8]
	movs r0, #1
	str r0, [r1]
_021E83BA:
	bx lr
	.align 2, 0
_021E83BC: .4byte 0x021EAA80
	thumb_func_end ov85_021E8374

	thumb_func_start ov85_021E83C0
ov85_021E83C0: @ 0x021E83C0
	push {r4, r5, r6, lr}
	ldr r0, _021E83DC @ =0x00000C4C
	adds r6, r1, #0
	adds r5, r6, r0
	movs r4, #0
_021E83CA:
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov85_021E8374
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #5
	blt _021E83CA
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E83DC: .4byte 0x00000C4C
	thumb_func_end ov85_021E83C0

	thumb_func_start ov85_021E83E0
ov85_021E83E0: @ 0x021E83E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E840C @ =0x00000C4C
	movs r1, #0
	adds r0, r4, r0
	movs r2, #0x50
	blx FUN_020E5B44
	movs r2, #0x41
	ldr r0, _021E8410 @ =ov85_021E83C0
	adds r1, r4, #0
	lsls r2, r2, #2
	bl FUN_0200E320
	ldr r1, _021E8414 @ =0x00000DC4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E840A
	bl FUN_0202551C
_021E840A:
	pop {r4, pc}
	.align 2, 0
_021E840C: .4byte 0x00000C4C
_021E8410: .4byte ov85_021E83C0
_021E8414: .4byte 0x00000DC4
	thumb_func_end ov85_021E83E0

	thumb_func_start ov85_021E8418
ov85_021E8418: @ 0x021E8418
	ldr r1, _021E8420 @ =0x00000DC4
	ldr r3, _021E8424 @ =FUN_0200E390
	ldr r0, [r0, r1]
	bx r3
	.align 2, 0
_021E8420: .4byte 0x00000DC4
_021E8424: .4byte FUN_0200E390
	thumb_func_end ov85_021E8418

	thumb_func_start ov85_021E8428
ov85_021E8428: @ 0x021E8428
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _021E8450 @ =0x00000C4C
	ldr r2, [r5, #0xc]
	adds r1, r0, r1
	lsls r0, r2, #4
	adds r4, r1, r0
	cmp r2, #5
	blt _021E843E
	bl FUN_0202551C
_021E843E:
	ldr r0, [r4]
	cmp r0, #0
	beq _021E8448
	bl FUN_0202551C
_021E8448:
	movs r0, #1
	str r0, [r4]
	str r5, [r4, #0xc]
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E8450: .4byte 0x00000C4C
	thumb_func_end ov85_021E8428

	thumb_func_start ov85_021E8454
ov85_021E8454: @ 0x021E8454
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	ldr r0, [r0, #0x20]
	movs r1, #0x19
	str r0, [sp, #4]
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r7, [r0, #0x30]
	movs r6, #0
	adds r4, r0, r1
	cmp r7, #0
	ble _021E84A0
	subs r1, #0x50
	adds r5, r4, r1
_021E8472:
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E8496
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	movs r0, #1
	adds r2, r0, #0
	lsls r2, r1
	ldr r0, [sp, #4]
	tst r0, r2
	beq _021E8496
	ldr r0, [sp]
	adds r1, r5, #0
	bl ov85_021E8428
_021E8496:
	adds r6, r6, #1
	adds r4, #0xb0
	adds r5, #0xb0
	cmp r6, r7
	blt _021E8472
_021E84A0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov85_021E8454

	thumb_func_start ov85_021E84A4
ov85_021E84A4: @ 0x021E84A4
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5, #4]
	movs r4, #0
	cmp r0, #1
	ldr r0, [r5, #8]
	bne _021E84C2
	subs r0, r0, #1
	str r0, [r5, #8]
	cmp r0, #0
	bgt _021E84D0
	str r4, [r5, #8]
	movs r4, #1
	b _021E84D0
_021E84C2:
	adds r0, r0, #1
	str r0, [r5, #8]
	cmp r0, #8
	blt _021E84D0
	movs r0, #8
	str r0, [r5, #8]
	movs r4, #1
_021E84D0:
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl ov85_021E6EA8
	cmp r4, #1
	bne _021E84E8
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_0200E390
_021E84E8:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov85_021E84A4

	thumb_func_start ov85_021E84EC
ov85_021E84EC: @ 0x021E84EC
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _021E8528 @ =_021EA4F0
	adds r4, r1, #0
	ldr r1, [r0, #0x1c]
	ldr r0, [r0, #0x20]
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0x66
	movs r1, #0xc
	bl FUN_0201AACC
	adds r1, r0, #0
	str r5, [r1]
	lsls r2, r4, #2
	add r0, sp, #0
	ldr r0, [r0, r2]
	str r4, [r1, #4]
	str r0, [r1, #8]
	ldr r0, _021E852C @ =ov85_021E84A4
	movs r2, #0
	bl FUN_0200E320
	cmp r0, #0
	bne _021E8524
	bl FUN_0202551C
_021E8524:
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E8528: .4byte _021EA4F0
_021E852C: .4byte ov85_021E84A4
	thumb_func_end ov85_021E84EC

	thumb_func_start ov85_021E8530
ov85_021E8530: @ 0x021E8530
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	bpl _021E8548
	movs r0, #0x5a
	lsls r0, r0, #0xe
_021E8540:
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	bmi _021E8540
_021E8548:
	movs r1, #0x5a
	ldr r0, [r4]
	lsls r1, r1, #0xe
	blx FUN_020F2998
	str r1, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E8530

	thumb_func_start ov85_021E8558
ov85_021E8558: @ 0x021E8558
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #0xd4
	bl ov85_021E7644
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov85_021E78A4
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E8558

	thumb_func_start ov85_021E8570
ov85_021E8570: @ 0x021E8570
	ldr r1, [r0, #8]
	adds r2, r1, #1
	movs r1, #0x96
	lsls r1, r1, #2
	str r2, [r0, #8]
	cmp r2, r1
	bge _021E8582
	movs r0, #0
	bx lr
_021E8582:
	str r1, [r0, #8]
	movs r0, #1
	bx lr
	thumb_func_end ov85_021E8570

	thumb_func_start ov85_021E8588
ov85_021E8588: @ 0x021E8588
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0x36
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	adds r6, r1, #0
	adds r5, r2, #0
	bl FUN_020077E8
	adds r1, r0, #0
	cmp r5, #1
	bne _021E85A8
	movs r0, #0x66
	bl FUN_0201AA8C
	b _021E85AE
_021E85A8:
	movs r0, #0x66
	bl FUN_0201AACC
_021E85AE:
	adds r5, r0, #0
	movs r0, #0x36
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	adds r1, r6, #0
	adds r2, r5, #0
	bl FUN_0200778C
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov85_021E8588

	thumb_func_start ov85_021E85C4
ov85_021E85C4: @ 0x021E85C4
	cmp r1, #0
	beq _021E85CA
	str r1, [r0, #0x34]
_021E85CA:
	bx lr
	thumb_func_end ov85_021E85C4

	thumb_func_start ov85_021E85CC
ov85_021E85CC: @ 0x021E85CC
	movs r2, #1
	str r2, [r0, #0x3c]
	ldrh r3, [r1]
	adds r2, r0, #0
	adds r2, #0x58
	strh r3, [r2]
	adds r2, r0, #0
	ldrh r3, [r1, #2]
	adds r2, #0x5a
	strh r3, [r2]
	adds r2, r0, #0
	ldrh r3, [r1, #4]
	adds r2, #0x5c
	adds r0, #0x5e
	strh r3, [r2]
	ldrh r1, [r1, #6]
	strh r1, [r0]
	bx lr
	thumb_func_end ov85_021E85CC

	thumb_func_start ov85_021E85F0
ov85_021E85F0: @ 0x021E85F0
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0x20
	blo _021E85FC
	bl FUN_0202551C
_021E85FC:
	adds r0, r4, #0
	adds r0, #0xac
	movs r1, #0
	movs r2, #0x20
	blx FUN_020E5B44
	adds r4, #0xac
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E85F0

	thumb_func_start ov85_021E8610
ov85_021E8610: @ 0x021E8610
	adds r0, #0xac
	bx lr
	thumb_func_end ov85_021E8610

	thumb_func_start ov85_021E8614
ov85_021E8614: @ 0x021E8614
	adds r0, #0xd0
	ldr r0, [r0]
	adds r0, #0x40
	ldrh r0, [r0]
	tst r0, r1
	beq _021E8624
	movs r0, #1
	bx lr
_021E8624:
	movs r0, #0
	bx lr
	thumb_func_end ov85_021E8614

	thumb_func_start ov85_021E8628
ov85_021E8628: @ 0x021E8628
	push {r3, r4}
	adds r1, r0, #0
	adds r0, #0xd0
	ldr r0, [r0]
	adds r1, #0xcc
	ldr r1, [r1]
	adds r0, #0x42
	ldr r1, [r1, #8]
	ldrh r4, [r0]
	movs r2, #0
	subs r3, r1, #1
	cmp r4, #0
	beq _021E864E
	movs r0, #1
_021E8644:
	adds r1, r4, #0
	ands r1, r0
	adds r2, r2, r1
	lsrs r4, r4, #1
	bne _021E8644
_021E864E:
	cmp r2, r3
	blt _021E8658
	movs r0, #1
	pop {r3, r4}
	bx lr
_021E8658:
	movs r0, #0
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov85_021E8628

	thumb_func_start ov85_021E8660
ov85_021E8660: @ 0x021E8660
	adds r0, #0xd0
	ldr r0, [r0]
	movs r2, #0
	adds r0, #0x42
	ldrh r3, [r0]
	cmp r3, #0
	beq _021E867A
	movs r0, #1
_021E8670:
	adds r1, r3, #0
	ands r1, r0
	adds r2, r2, r1
	lsrs r3, r3, #1
	bne _021E8670
_021E867A:
	adds r0, r2, #0
	bx lr
	.align 2, 0
	thumb_func_end ov85_021E8660

	thumb_func_start ov85_021E8680
ov85_021E8680: @ 0x021E8680
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r4]
	lsls r2, r0, #2
	adds r0, r5, r2
	adds r0, #0x70
	strh r1, [r0]
	adds r0, r5, r2
	ldrh r1, [r4, #2]
	adds r0, #0x72
	strh r1, [r0]
	bl FUN_0203769C
	ldrh r1, [r4, #2]
	cmp r1, r0
	bne _021E86A8
	ldrh r0, [r4]
	str r0, [r5, #0x2c]
_021E86A8:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E8680

	thumb_func_start ov85_021E86AC
ov85_021E86AC: @ 0x021E86AC
	str r1, [r0, #0x30]
	bx lr
	thumb_func_end ov85_021E86AC

	thumb_func_start ov85_021E86B0
ov85_021E86B0: @ 0x021E86B0
	cmp r1, #0
	beq _021E86C8
	adds r0, #0xd0
	ldr r0, [r0]
	adds r0, #0x42
	ldrh r2, [r0]
	movs r0, #1
	lsls r0, r1
	tst r0, r2
	bne _021E86C8
	movs r0, #0
	bx lr
_021E86C8:
	movs r0, #1
	bx lr
	thumb_func_end ov85_021E86B0

	thumb_func_start ov85_021E86CC
ov85_021E86CC: @ 0x021E86CC
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0xd0
	ldr r0, [r0]
	adds r5, r1, #0
	ldr r6, [r4, #0x24]
	bl FUN_02097018
	adds r7, r0, #0
	lsls r0, r5, #2
	adds r0, r4, r0
	adds r4, #0xcc
	ldr r1, [r4]
	ldr r5, [r0, #0x44]
	ldr r1, [r1, #4]
	adds r0, r6, #0
	bl FUN_02074644
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r5, #0
	bl FUN_02074644
	adds r5, r0, #0
	bl FUN_0203769C
	bl FUN_02034818
	adds r1, r0, #0
	movs r0, #0xb
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #5
	movs r3, #0
	bl FUN_0208F260
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0207188C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov85_021E86CC

	thumb_func_start ov85_021E8720
ov85_021E8720: @ 0x021E8720
	adds r0, #0xd0
	ldr r1, [r0]
	movs r0, #0x46
	ldrsh r3, [r1, r0]
	movs r2, #0
	cmp r3, #0
	beq _021E873A
	movs r0, #1
_021E8730:
	adds r1, r3, #0
	ands r1, r0
	adds r2, r2, r1
	lsrs r3, r3, #1
	bne _021E8730
_021E873A:
	adds r0, r2, #0
	bx lr
	.align 2, 0
	thumb_func_end ov85_021E8720

	thumb_func_start ov85_021E8740
ov85_021E8740: @ 0x021E8740
	lsls r1, r1, #2
	adds r0, r0, r1
	str r2, [r0, #0x44]
	bx lr
	thumb_func_end ov85_021E8740

	thumb_func_start ov85_021E8748
ov85_021E8748: @ 0x021E8748
	push {r3, r4}
	adds r4, r0, #0
	adds r4, #0x60
	movs r3, #8
_021E8750:
	ldrh r2, [r1]
	adds r1, r1, #2
	strh r2, [r4]
	adds r4, r4, #2
	subs r3, r3, #1
	bne _021E8750
	movs r1, #1
	str r1, [r0, #0x40]
	pop {r3, r4}
	bx lr
	thumb_func_end ov85_021E8748

	thumb_func_start ov85_021E8764
ov85_021E8764: @ 0x021E8764
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	movs r1, #0x11
	adds r3, r0, #0
	lsls r1, r1, #4
	ldr r1, [r3, r1]
	add r0, sp, #0x14
	rsbs r1, r1, #0
	adds r4, r2, #0
	bl ov85_021E8530
	ldr r0, [sp, #0x14]
	ldr r1, _021E87E8 @ =0xFFFFC000
	str r0, [sp]
	add r0, sp, #0
	bl ov85_021E8530
	ldr r1, [sp]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r5, r0, #0xc
	ldr r0, [sp, #0x14]
	movs r1, #5
	str r0, [sp]
	add r0, sp, #0
	lsls r1, r1, #0xc
	bl ov85_021E8530
	ldr r1, [sp]
	ldr r2, _021E87EC @ =0x021EA758
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	lsls r1, r4, #3
	adds r3, r2, r1
	ldr r2, [r2, r1]
	asrs r0, r0, #0xc
	ldr r3, [r3, #4]
	cmp r2, #0
	beq _021E87DC
_021E87B6:
	ldrh r4, [r3]
	cmp r5, r4
	blo _021E87C2
	ldrh r1, [r3, #2]
	cmp r5, r1
	bls _021E87CC
_021E87C2:
	cmp r0, r4
	blo _021E87D6
	ldrh r1, [r3, #2]
	cmp r0, r1
	bhi _021E87D6
_021E87CC:
	movs r0, #1
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
_021E87D6:
	adds r3, r3, #4
	subs r2, r2, #1
	bne _021E87B6
_021E87DC:
	movs r0, #0
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_021E87E8: .4byte 0xFFFFC000
_021E87EC: .4byte 0x021EA758
	thumb_func_end ov85_021E8764

	thumb_func_start ov85_021E87F0
ov85_021E87F0: @ 0x021E87F0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl FUN_02074640
	adds r6, r0, #0
	movs r5, #0
	cmp r6, #0
	ble _021E882E
_021E8800:
	adds r0, r7, #0
	adds r1, r5, #0
	bl FUN_02074644
	movs r1, #0x4c
	movs r2, #0
	adds r4, r0, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _021E8828
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _021E8828
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E8828:
	adds r5, r5, #1
	cmp r5, r6
	blt _021E8800
_021E882E:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov85_021E87F0

	thumb_func_start ov85_021E8834
ov85_021E8834: @ 0x021E8834
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x24]
	bl ov85_021E87F0
	cmp r0, #1
	bne _021E8846
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E8846:
	movs r4, #0
_021E8848:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov85_021E86B0
	cmp r0, #0
	beq _021E886C
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r0, [r0]
	adds r1, r4, #0
	bl FUN_02097018
	bl ov85_021E87F0
	cmp r0, #1
	bne _021E886C
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E886C:
	adds r4, r4, #1
	cmp r4, #5
	blt _021E8848
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E8834

	thumb_func_start ov85_021E8878
ov85_021E8878: @ 0x021E8878
	adds r0, #0xd0
	ldr r0, [r0]
	movs r2, #0
	adds r0, #0x4a
	ldrh r3, [r0]
	cmp r3, #0
	beq _021E8892
	movs r0, #1
_021E8888:
	adds r1, r3, #0
	ands r1, r0
	adds r2, r2, r1
	lsrs r3, r3, #1
	bne _021E8888
_021E8892:
	adds r0, r2, #0
	bx lr
	.align 2, 0
	thumb_func_end ov85_021E8878

	thumb_func_start ov85_021E8898
ov85_021E8898: @ 0x021E8898
	adds r0, #0xd0
	ldr r0, [r0]
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _021E88A8
	movs r0, #1
	bx lr
_021E88A8:
	movs r0, #0
	bx lr
	thumb_func_end ov85_021E8898

	thumb_func_start ov85_021E88AC
ov85_021E88AC: @ 0x021E88AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r4, r0, #0
	bl FUN_020072A4
	adds r6, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _021E88C8
	cmp r0, #1
	bne _021E88C6
	b _021E89E4
_021E88C6:
	b _021E89EE
_021E88C8:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E89F4 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E89F8 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #3
	movs r1, #0x66
	lsls r2, r2, #7
	bl FUN_0201A910
	movs r0, #0xd9
	movs r1, #0x66
	bl FUN_02007688
	adds r7, r0, #0
	bne _021E890A
	bl FUN_0202551C
_021E890A:
	ldr r1, _021E89FC @ =0x00004AB0
	adds r0, r4, #0
	movs r2, #0x66
	bl FUN_02007280
	ldr r2, _021E89FC @ =0x00004AB0
	adds r4, r0, #0
	movs r1, #0
	blx FUN_020E5B44
	str r4, [r6, #0x38]
	str r6, [r4, #0xc]
	ldr r0, [r6, #0x30]
	str r0, [r4, #0x10]
	movs r0, #0x66
	bl FUN_0201AC88
	str r0, [r4, #0x14]
	movs r0, #0x66
	bl FUN_0200BD08
	str r0, [r4, #0x34]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xcf
	movs r3, #0x66
	bl FUN_0200BAF8
	str r0, [r4, #0x38]
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	bl ov85_021E8C3C
	ldr r0, [r4, #0x14]
	bl ov85_021E8C5C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x66
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0x11
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov85_021E8E6C
	ldr r0, _021E8A00 @ =ov85_021E8C14
	adds r1, r4, #0
	bl FUN_0201A0FC
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov85_021E8D64
	bl ov85_021E8F58
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov85_021E8F88
	adds r0, r4, #0
	bl ov85_021E9084
	adds r0, r4, #0
	bl ov85_021E9160
	movs r1, #0
	movs r0, #0x34
	adds r2, r1, #0
	bl FUN_02004EC4
	ldr r0, [r6, #0x30]
	bl FUN_02096CE0
	bl FUN_0203897C
	movs r0, #3
	bl FUN_02038C1C
	bl FUN_0203769C
	cmp r0, #0
	bne _021E89C6
	movs r0, #0xd
	bl FUN_0205A904
_021E89C6:
	bl FUN_0203A880
	ldr r0, _021E8A04 @ =ov85_021E8BB0
	adds r1, r4, #0
	movs r2, #5
	bl FUN_0200E33C
	str r0, [r4, #0x30]
	adds r0, r7, #0
	bl FUN_0200770C
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _021E89EE
_021E89E4:
	movs r0, #0
	str r0, [r5]
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_021E89EE:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E89F4: .4byte 0xFFFFE0FF
_021E89F8: .4byte 0x04001000
_021E89FC: .4byte 0x00004AB0
_021E8A00: .4byte ov85_021E8C14
_021E8A04: .4byte ov85_021E8BB0
	thumb_func_end ov85_021E88AC

	thumb_func_start ov85_021E8A08
ov85_021E8A08: @ 0x021E8A08
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	bl FUN_02025358
	cmp r0, #0
	beq _021E8A1E
	ldr r0, _021E8AFC @ =0x021D110C
	movs r1, #1
	str r1, [r0, #0x5c]
_021E8A1E:
	bl FUN_0203769C
	cmp r0, #0
	bne _021E8A3A
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _021E8A3A
	bl FUN_02033250
	ldr r2, [r4, #0x10]
	ldr r1, [r2, #0x30]
	ands r0, r1
	str r0, [r2, #0x30]
_021E8A3A:
	ldr r1, [r4]
	cmp r1, #3
	bhi _021E8AF0
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E8A4C: @ jump table
	.2byte _021E8A54 - _021E8A4C - 2 @ case 0
	.2byte _021E8A7E - _021E8A4C - 2 @ case 1
	.2byte _021E8ACC - _021E8A4C - 2 @ case 2
	.2byte _021E8AE4 - _021E8A4C - 2 @ case 3
_021E8A54:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E8AF0
	movs r0, #1
	str r0, [r4]
	bl FUN_0203769C
	cmp r0, #0
	beq _021E8AF0
	bl ov85_021E9FD0
	cmp r0, #2
	ble _021E8AF0
	movs r2, #0
	ldr r0, [r4, #0x10]
	movs r1, #4
	adds r3, r2, #0
	bl FUN_02096D4C
	b _021E8AF0
_021E8A7E:
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	lsls r2, r0, #2
	ldr r0, _021E8B00 @ =0x021EA9E0
	ldr r2, [r0, r2]
	cmp r2, #0
	beq _021E8A94
	adds r0, r4, #0
	blx r2
	str r0, [r4]
_021E8A94:
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	bne _021E8AAC
	movs r0, #0xaa
	lsls r0, r0, #2
	ldr r2, _021E8B04 @ =0x00010300
	adds r0, r4, r0
	movs r1, #0
	adds r3, r4, #0
	bl ov85_021E9EC0
_021E8AAC:
	adds r0, r4, #0
	bl ov85_021EA1AC
	bl FUN_0203769C
	cmp r0, #0
	bne _021E8AF0
	adds r0, r4, #0
	movs r1, #1
	bl ov85_021EA3F0
	ldr r1, [r4]
	cmp r1, #1
	bne _021E8AF0
	str r0, [r4]
	b _021E8AF0
_021E8ACC:
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	lsls r2, r0, #2
	ldr r0, _021E8B00 @ =0x021EA9E0
	ldr r2, [r0, r2]
	cmp r2, #0
	beq _021E8AF0
	adds r0, r4, #0
	blx r2
	str r0, [r4]
	b _021E8AF0
_021E8AE4:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E8AF0
	movs r0, #1
	pop {r4, pc}
_021E8AF0:
	ldr r0, [r4, #0x60]
	bl FUN_0202457C
	movs r0, #0
	pop {r4, pc}
	nop
_021E8AFC: .4byte 0x021D110C
_021E8B00: .4byte 0x021EA9E0
_021E8B04: .4byte 0x00010300
	thumb_func_end ov85_021E8A08

	thumb_func_start ov85_021E8B08
ov85_021E8B08: @ 0x021E8B08
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl FUN_02007290
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	bl FUN_0200E390
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	movs r7, #0x63
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_021E8B34:
	ldr r0, [r5, r7]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E8B34
	ldr r0, [r6, #0x60]
	bl FUN_02024504
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	adds r0, r6, #0
	bl ov85_021E9288
	ldr r0, [r6, #0x14]
	bl ov85_021E8E38
	ldr r0, [r6, #0x38]
	bl FUN_0200BB44
	ldr r0, [r6, #0x34]
	bl FUN_0200BDA0
	ldr r2, _021E8BAC @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	ldr r1, [r6, #8]
	ldr r0, [r6, #0xc]
	str r1, [r0, #0x10]
	bl ov85_021E9FD0
	ldr r1, [r6, #0xc]
	str r0, [r1, #8]
	bl ov85_021E9FEC
	ldr r1, [r6, #0xc]
	str r0, [r1, #0xc]
	adds r0, r6, #0
	bl ov85_021E8E00
	ldr r0, [sp]
	bl FUN_02007294
	movs r0, #0x66
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8BAC: .4byte 0x04000304
	thumb_func_end ov85_021E8B08

	thumb_func_start ov85_021E8BB0
ov85_021E8BB0: @ 0x021E8BB0
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x1c]
	adds r1, #0x1c
	cmp r0, #0
	beq _021E8C0A
	ldr r0, [r1, #4]
	ldr r3, [r1, #8]
	lsls r2, r0, #1
	ldr r0, _021E8C0C @ =0x021EA8EA
	ldrb r0, [r0, r2]
	cmp r3, r0
	ble _021E8BFA
	movs r0, #0
	str r0, [r1, #8]
	ldr r2, [r1, #4]
	adds r2, r2, #1
	str r2, [r1, #4]
	lsls r3, r2, #1
	ldr r2, _021E8C10 @ =0x021EA8EB
	ldrb r2, [r2, r3]
	cmp r2, #0xff
	bne _021E8BE0
	str r0, [r1, #4]
_021E8BE0:
	ldr r0, [r1, #0x10]
	ldr r1, [r1, #4]
	ldr r0, [r0, #0xc]
	lsls r2, r1, #1
	ldr r1, _021E8C10 @ =0x021EA8EB
	ldrb r1, [r1, r2]
	movs r2, #0x20
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0
	blx FUN_020CFD18
	b _021E8C00
_021E8BFA:
	ldr r0, [r4, #0x24]
	adds r0, r0, #1
	str r0, [r4, #0x24]
_021E8C00:
	movs r0, #0xed
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov85_021E9E58
_021E8C0A:
	pop {r4, pc}
	.align 2, 0
_021E8C0C: .4byte 0x021EA8EA
_021E8C10: .4byte 0x021EA8EB
	thumb_func_end ov85_021E8BB0

	thumb_func_start ov85_021E8C14
ov85_021E8C14: @ 0x021E8C14
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0202061C
	bl FUN_0200B224
	adds r0, r4, #0
	bl FUN_0201EEB4
	ldr r3, _021E8C34 @ =0x027E0000
	ldr r1, _021E8C38 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E8C34: .4byte 0x027E0000
_021E8C38: .4byte 0x00003FF8
	thumb_func_end ov85_021E8C14

	thumb_func_start ov85_021E8C3C
ov85_021E8C3C: @ 0x021E8C3C
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E8C58 @ =0x021EA9B8
	add r3, sp, #0
	movs r2, #5
_021E8C46:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E8C46
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E8C58: .4byte 0x021EA9B8
	thumb_func_end ov85_021E8C3C

	thumb_func_start ov85_021E8C5C
ov85_021E8C5C: @ 0x021E8C5C
	push {r4, r5, lr}
	sub sp, #0x9c
	ldr r5, _021E8D4C @ =0x021EA8F4
	add r3, sp, #0x8c
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E8D50 @ =0x021EA980
	add r3, sp, #0x70
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
	ldr r5, _021E8D54 @ =0x021EA99C
	add r3, sp, #0x54
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
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201CAE0
	ldr r5, _021E8D58 @ =0x021EA92C
	add r3, sp, #0x38
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
	ldr r5, _021E8D5C @ =0x021EA948
	add r3, sp, #0x1c
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
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _021E8D60 @ =0x021EA964
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
	adds r0, r4, #0
	movs r1, #1
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x66
	bl FUN_0201C1C4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x66
	bl FUN_0201C1C4
	add sp, #0x9c
	pop {r4, r5, pc}
	nop
_021E8D4C: .4byte 0x021EA8F4
_021E8D50: .4byte 0x021EA980
_021E8D54: .4byte 0x021EA99C
_021E8D58: .4byte 0x021EA92C
_021E8D5C: .4byte 0x021EA948
_021E8D60: .4byte 0x021EA964
	thumb_func_end ov85_021E8C5C

	thumb_func_start ov85_021E8D64
ov85_021E8D64: @ 0x021E8D64
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	str r1, [sp]
	movs r6, #0
	adds r4, r7, #0
	adds r5, r7, #0
_021E8D70:
	movs r0, #8
	movs r1, #0x66
	bl FUN_02026354
	str r0, [r4, #0x3c]
	movs r0, #0xdd
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r0, #4
	str r1, [r5, r0]
	movs r0, #0xe7
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, #8
	cmp r6, #5
	blt _021E8D70
	movs r0, #0xb4
	movs r1, #0x66
	bl FUN_02026354
	str r0, [r7, #0x54]
	movs r0, #0x28
	movs r1, #0x66
	bl FUN_02026354
	str r0, [r7, #0x58]
	movs r0, #0xd5
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r7, r0]
	ldr r0, [r7, #0x38]
	ldr r2, [r7, #0x58]
	movs r1, #0x11
	bl FUN_0200BB6C
	ldr r1, [sp]
	adds r0, r7, #0
	bl ov85_021EA2C0
	movs r0, #0x66
	bl FUN_0205B4A4
	movs r1, #0xee
	lsls r1, r1, #2
	str r0, [r7, r1]
	movs r0, #0
	str r0, [r7, #0x1c]
	str r0, [r7, #0x24]
	str r0, [r7, #0x20]
	adds r2, r7, #0
	ldr r0, [sp]
	movs r1, #1
	adds r2, #0x2c
	movs r3, #0x66
	bl FUN_02007C48
	str r0, [r7, #0x28]
	ldr r0, _021E8DFC @ =0x00004A44
	movs r1, #0
	str r1, [r7, r0]
	movs r0, #0x33
	lsls r0, r0, #4
	str r1, [r7, r0]
	ldr r0, [r7, #0x10]
	movs r1, #2
	str r1, [r0, #0x2c]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E8DFC: .4byte 0x00004A44
	thumb_func_end ov85_021E8D64

	thumb_func_start ov85_021E8E00
ov85_021E8E00: @ 0x021E8E00
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ov85_021EA368
	ldr r0, [r6, #0x28]
	bl FUN_0201AB0C
	movs r0, #0xee
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0201AB0C
	movs r4, #0
	adds r5, r6, #0
_021E8E1C:
	ldr r0, [r5, #0x3c]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #5
	blt _021E8E1C
	ldr r0, [r6, #0x58]
	bl FUN_02026380
	ldr r0, [r6, #0x54]
	bl FUN_02026380
	pop {r4, r5, r6, pc}
	thumb_func_end ov85_021E8E00

	thumb_func_start ov85_021E8E38
ov85_021E8E38: @ 0x021E8E38
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
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E8E38

	thumb_func_start ov85_021E8E6C
ov85_021E8E6C: @ 0x021E8E6C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #2
	ldr r4, [r5, #0x14]
	lsls r0, r0, #8
	adds r6, r1, #0
	movs r1, #0
	str r0, [sp]
	movs r0, #0x66
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02007B8C
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x66
	str r0, [sp, #4]
	movs r0, #0xe
	movs r1, #0x47
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x66
	bl FUN_0200304C
	movs r1, #0x1a
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #0x66
	bl FUN_0200304C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x66
	str r0, [sp, #0xc]
	movs r0, #0xe
	movs r1, #0xa
	adds r2, r4, #0
	movs r3, #6
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x66
	str r0, [sp, #0xc]
	movs r0, #0xe
	movs r1, #0xb
	adds r2, r4, #0
	movs r3, #6
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x66
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #2
	adds r2, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x66
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #3
	adds r2, r4, #0
	bl FUN_02007B68
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x24]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x66
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0xa
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	movs r0, #0x66
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E3DC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov85_021E8E6C

	thumb_func_start ov85_021E8F58
ov85_021E8F58: @ 0x021E8F58
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E8F84 @ =0x021EA904
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_020215A0
	movs r0, #0x14
	movs r1, #0x66
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E8F84: .4byte 0x021EA904
	thumb_func_end ov85_021E8F58

	thumb_func_start ov85_021E8F88
ov85_021E8F88: @ 0x021E8F88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r0, #0
	str r1, [sp, #0x14]
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x66
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	adds r1, r6, #0
	movs r0, #0x1e
	adds r1, #0x64
	movs r2, #0x66
	bl FUN_02009F40
	str r0, [r6, #0x60]
	cmp r0, #0
	bne _021E8FC2
	bl FUN_0202551C
_021E8FC2:
	adds r0, r6, #0
	movs r2, #1
	adds r0, #0x64
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r7, #0x63
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_021E8FD8:
	movs r0, #3
	adds r1, r4, #0
	movs r2, #0x66
	bl FUN_0200A090
	str r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E8FD8
	movs r0, #2
	str r0, [sp]
	movs r3, #1
	str r3, [sp, #4]
	movs r0, #0x66
	str r0, [sp, #8]
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x14]
	movs r2, #0xc
	bl FUN_0200A3C8
	movs r1, #0x6f
	lsls r1, r1, #2
	str r0, [r6, r1]
	movs r0, #2
	str r0, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0x66
	subs r1, #0x2c
	str r0, [sp, #0xc]
	ldr r0, [r6, r1]
	ldr r1, [sp, #0x14]
	movs r3, #0
	bl FUN_0200A480
	movs r1, #7
	lsls r1, r1, #6
	str r0, [r6, r1]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x66
	subs r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	ldr r1, [sp, #0x14]
	movs r2, #0xd
	movs r3, #1
	bl FUN_0200A540
	movs r1, #0x71
	lsls r1, r1, #2
	str r0, [r6, r1]
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x66
	str r0, [sp, #8]
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x14]
	movs r2, #0xe
	movs r3, #1
	bl FUN_0200A540
	movs r1, #0x72
	lsls r1, r1, #2
	str r0, [r6, r1]
	subs r1, #0xc
	ldr r0, [r6, r1]
	bl FUN_0200ACF0
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	bl FUN_0200AF94
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov85_021E8F88

	thumb_func_start ov85_021E9084
ov85_021E9084: @ 0x021E9084
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	movs r1, #2
	adds r5, r0, #0
	str r1, [sp]
	subs r0, r1, #3
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	movs r3, #0x63
	str r0, [sp, #0xc]
	movs r2, #1
	lsls r3, r3, #2
	str r2, [sp, #0x10]
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
	adds r3, #0x88
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r5, r3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02009D48
	ldr r0, [r5, #0x60]
	movs r6, #0
	str r0, [sp, #0x2c]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp, #0x30]
	movs r0, #1
	lsls r0, r0, #0xc
	movs r7, #0x8f
	str r6, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r6, [r0, #0x20]
	movs r0, #1
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	movs r0, #0x66
	ldr r4, _021E915C @ =0x021EA914
	str r0, [sp, #0x58]
	lsls r7, r7, #2
_021E90F8:
	ldrh r0, [r4, #4]
	lsls r0, r0, #0xc
	str r0, [sp, #0x34]
	ldrh r0, [r4, #6]
	lsls r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl FUN_02024624
	movs r1, #0x8f
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x8f
	lsls r0, r0, #2
	subs r1, r6, #1
	lsls r1, r1, #1
	ldr r0, [r5, r0]
	adds r1, #0x1b
	bl FUN_020248F0
	ldr r0, [r5, r7]
	movs r1, #0
	bl FUN_02024830
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #5
	blt _021E90F8
	movs r0, #6
	lsls r0, r0, #0xe
	str r0, [sp, #0x34]
	movs r0, #0x1a
	lsls r0, r0, #0x10
	str r0, [sp, #0x38]
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E915C: .4byte 0x021EA914
	thumb_func_end ov85_021E9084

	thumb_func_start ov85_021E9160
ov85_021E9160: @ 0x021E9160
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #0x14
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _021E923C @ =0x000001C3
	movs r1, #0xc2
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r0, [r4, #0x14]
	adds r1, r4, r1
	movs r2, #5
	movs r3, #0x1a
	bl FUN_0201D40C
	movs r0, #0xc2
	lsls r0, r0, #2
	adds r0, r4, r0
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
	movs r0, #0x28
	movs r1, #0xbe
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r0, [r4, #0x14]
	adds r1, r4, r1
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0xbe
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #1
	str r0, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	movs r0, #0x94
	movs r1, #0xc6
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r0, [r4, #0x14]
	adds r1, r4, r1
	movs r2, #0
	movs r3, #3
	bl FUN_0201D40C
	movs r0, #0xc6
	lsls r0, r0, #2
	ldr r1, [r4, #0x58]
	adds r0, r4, r0
	movs r2, #0
	bl ov85_021E9244
	movs r0, #6
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	movs r0, #0xc8
	movs r1, #0xaa
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r0, [r4, #0x14]
	adds r1, r4, r1
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0xaa
	lsls r0, r0, #2
	ldr r2, _021E9240 @ =0x00010300
	adds r0, r4, r0
	movs r1, #0
	adds r3, r4, #0
	bl ov85_021E9EC0
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_021E923C: .4byte 0x000001C3
_021E9240: .4byte 0x00010300
	thumb_func_end ov85_021E9160

	thumb_func_start ov85_021E9244
ov85_021E9244: @ 0x021E9244
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r2, #0
	movs r0, #1
	movs r2, #0
	adds r7, r1, #0
	bl FUN_02002F30
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	movs r1, #1
	str r1, [sp]
	movs r0, #0x41
	movs r3, #0xd0
	str r4, [sp, #4]
	subs r4, r3, r6
	lsls r0, r0, #0xa
	lsrs r3, r4, #0x1f
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r4, r3
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r2, r7, #0
	asrs r3, r3, #1
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov85_021E9244

	thumb_func_start ov85_021E9288
ov85_021E9288: @ 0x021E9288
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0xc6
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0xc2
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0xbe
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E9288

	thumb_func_start ov85_021E92B8
ov85_021E92B8: @ 0x021E92B8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0
	movs r1, #1
	bl FUN_020398D4
	bl FUN_0203769C
	cmp r0, #0
	bne _021E92E2
	bl FUN_02037454
	cmp r0, #2
	blt _021E92EC
	adds r0, r5, #0
	movs r1, #2
	movs r2, #0
	bl ov85_021EA0EC
	b _021E92EC
_021E92E2:
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl ov85_021EA0EC
_021E92EC:
	adds r0, r5, #0
	movs r1, #3
	bl ov85_021E9458
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E92B8

	thumb_func_start ov85_021E92F8
ov85_021E92F8: @ 0x021E92F8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov85_021E9324
	bl FUN_0203769C
	cmp r0, #0
	bne _021E931A
	bl ov85_021E9EA4
	cmp r0, #1
	beq _021E9320
	adds r0, r5, #0
	bl ov85_021E9FCC
	b _021E9320
_021E931A:
	adds r0, r5, #0
	bl ov85_021E9FCC
_021E9320:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E92F8

	thumb_func_start ov85_021E9324
ov85_021E9324: @ 0x021E9324
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _021E9430 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _021E9384
	bl FUN_0203769C
	cmp r0, #0
	bne _021E942E
	ldr r5, [r4, #0x10]
	bl ov85_021E9FD0
	ldr r1, [r5, #0x2c]
	cmp r1, r0
	bne _021E937C
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bne _021E937C
	movs r1, #1
	add r0, sp, #0
	strb r1, [r0, #2]
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0
	bl ov85_021EA0EC
	adds r0, r4, #0
	movs r1, #0x16
	bl ov85_021E9458
	add r2, sp, #0
	ldr r0, [r4, #0x10]
	movs r1, #7
	adds r2, #2
	movs r3, #1
	bl FUN_02096D4C
	adds r0, r4, #0
	movs r1, #0
	bl ov85_021EA39C
	pop {r3, r4, r5, pc}
_021E937C:
	ldr r0, _021E9434 @ =0x000005F2
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
_021E9384:
	movs r0, #2
	tst r0, r1
	beq _021E9400
	bl FUN_0203769C
	cmp r0, #0
	beq _021E93B6
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x28]
	cmp r0, #0
	bne _021E93AE
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	bl ov85_021EA0EC
	adds r0, r4, #0
	movs r1, #4
	bl ov85_021E9458
	pop {r3, r4, r5, pc}
_021E93AE:
	ldr r0, _021E9434 @ =0x000005F2
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
_021E93B6:
	ldr r5, [r4, #0x10]
	bl FUN_02037454
	ldr r1, [r5, #0x2c]
	cmp r1, r0
	bne _021E93F8
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bne _021E93F8
	movs r1, #1
	add r0, sp, #0
	strb r1, [r0, #1]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	bl ov85_021EA0EC
	adds r0, r4, #0
	movs r1, #4
	bl ov85_021E9458
	add r2, sp, #0
	ldr r0, [r4, #0x10]
	movs r1, #7
	adds r2, #1
	movs r3, #1
	bl FUN_02096D4C
	adds r0, r4, #0
	movs r1, #0
	bl ov85_021EA39C
	pop {r3, r4, r5, pc}
_021E93F8:
	ldr r0, _021E9434 @ =0x000005F2
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
_021E9400:
	ldr r0, _021E9438 @ =0x00004A48
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E942E
	bl FUN_0203769C
	cmp r0, #0
	bne _021E942E
	bl FUN_02037454
	ldr r1, [r4, #0x10]
	ldr r1, [r1, #0x2c]
	cmp r1, r0
	bne _021E942E
	movs r1, #0
	add r0, sp, #0
	strb r1, [r0]
	ldr r0, [r4, #0x10]
	movs r1, #7
	add r2, sp, #0
	movs r3, #1
	bl FUN_02096D4C
_021E942E:
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E9430: .4byte 0x021D110C
_021E9434: .4byte 0x000005F2
_021E9438: .4byte 0x00004A48
	thumb_func_end ov85_021E9324

	thumb_func_start ov85_021E943C
ov85_021E943C: @ 0x021E943C
	bx lr
	.align 2, 0
	thumb_func_end ov85_021E943C

	thumb_func_start ov85_021E9440
ov85_021E9440: @ 0x021E9440
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #2
	bl ov85_021E9458
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E9440

	thumb_func_start ov85_021E9458
ov85_021E9458: @ 0x021E9458
	movs r2, #0xd5
	movs r3, #0x1e
	lsls r2, r2, #2
	str r3, [r0, r2]
	adds r2, r2, #4
	str r1, [r0, r2]
	bx lr
	.align 2, 0
	thumb_func_end ov85_021E9458

	thumb_func_start ov85_021E9468
ov85_021E9468: @ 0x021E9468
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	adds r4, r1, #0
	bl ov85_021EA17C
	cmp r0, #0
	beq _021E9482
	movs r0, #0xd6
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	subs r0, r0, #4
	str r1, [r5, r0]
_021E9482:
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E9468

	thumb_func_start ov85_021E948C
ov85_021E948C: @ 0x021E948C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0203769C
	cmp r0, #0
	bne _021E94AA
	movs r0, #0
	str r0, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #7
	add r2, sp, #0
	movs r3, #1
	bl FUN_02096D4C
_021E94AA:
	movs r0, #0xd5
	movs r1, #3
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E948C

	thumb_func_start ov85_021E94BC
ov85_021E94BC: @ 0x021E94BC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x66
	adds r4, r1, #0
	str r0, [sp]
	ldr r0, [r5, #0x14]
	ldr r1, _021E94E8 @ =0x021EA8D8
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_02001FC8
	movs r1, #0x33
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #5
	adds r1, #0x24
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E94E8: .4byte 0x021EA8D8
	thumb_func_end ov85_021E94BC

	thumb_func_start ov85_021E94EC
ov85_021E94EC: @ 0x021E94EC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	bl FUN_0203769C
	cmp r0, #0
	ldr r0, [r5, #0x10]
	beq _021E9520
	ldr r0, [r0, #0x28]
	cmp r0, #0
	beq _021E9542
	ldr r0, _021E9608 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0xc3
	tst r0, r1
	beq _021E9514
	ldr r0, _021E960C @ =0x000005F2
	bl FUN_0200604C
_021E9514:
	adds r0, r5, #0
	bl ov85_021E943C
	add sp, #8
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_021E9520:
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _021E9542
	ldr r0, _021E9608 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0xc3
	tst r0, r1
	beq _021E9536
	ldr r0, _021E960C @ =0x000005F2
	bl FUN_0200604C
_021E9536:
	adds r0, r5, #0
	bl ov85_021E943C
	add sp, #8
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_021E9542:
	bl ov85_021E9FD0
	adds r4, r0, #0
	bl FUN_02037454
	cmp r4, r0
	beq _021E955C
	adds r0, r5, #0
	bl ov85_021E943C
	add sp, #8
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_021E955C:
	movs r0, #0x33
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x66
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021E95FC
	subs r1, r1, #1
	cmp r0, r1
	bne _021E95A0
	bl FUN_0203769C
	cmp r0, #0
	bne _021E9596
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	movs r1, #7
	add r2, sp, #4
	movs r3, #1
	bl FUN_02096D4C
	adds r0, r5, #0
	movs r1, #1
	bl ov85_021EA39C
_021E9596:
	adds r0, r5, #0
	movs r1, #0
	bl ov85_021E9458
	b _021E95F4
_021E95A0:
	bl FUN_0203769C
	cmp r0, #0
	bne _021E95BC
	adds r0, r5, #0
	movs r1, #0xb
	bl ov85_021E9458
	adds r0, r5, #0
	movs r1, #0xe
	movs r2, #0
	bl ov85_021EA0EC
	b _021E95F4
_021E95BC:
	add r0, sp, #0
	movs r1, #0
	movs r2, #4
	blx FUN_020D4994
	movs r1, #0
	add r0, sp, #0
	strb r1, [r0, #2]
	bl FUN_0203769C
	add r1, sp, #0
	strb r0, [r1]
	ldr r0, _021E9610 @ =0x00004A50
	movs r1, #1
	strb r1, [r5, r0]
	movs r1, #0
	adds r0, #0xc
	strh r1, [r5, r0]
	movs r0, #0xd5
	movs r1, #6
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [r5, #0x10]
	movs r1, #2
	add r2, sp, #0
	movs r3, #4
	bl FUN_02096D4C
_021E95F4:
	movs r0, #0x33
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
_021E95FC:
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r6, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E9608: .4byte 0x021D110C
_021E960C: .4byte 0x000005F2
_021E9610: .4byte 0x00004A50
	thumb_func_end ov85_021E94EC

	thumb_func_start ov85_021E9614
ov85_021E9614: @ 0x021E9614
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _021E9628 @ =0x00004A5C
	movs r2, #0
	strh r2, [r0, r1]
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r4, pc}
	nop
_021E9628: .4byte 0x00004A5C
	thumb_func_end ov85_021E9614

	thumb_func_start ov85_021E962C
ov85_021E962C: @ 0x021E962C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02037454
	ldr r1, [r5, #0x10]
	ldrh r1, [r1, #0x38]
	cmp r1, r0
	bne _021E964A
	bl ov85_021E9FD0
	ldr r1, [r5, #0x10]
	ldrh r1, [r1, #0x38]
	cmp r1, r0
	beq _021E9662
_021E964A:
	ldr r0, _021E96AC @ =0x00004A5C
	movs r1, #0
	strh r1, [r5, r0]
	movs r0, #0xd5
	movs r1, #8
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_021E9662:
	ldr r0, _021E96AC @ =0x00004A5C
	ldrsh r1, [r5, r0]
	adds r1, r1, #1
	strh r1, [r5, r0]
	ldrsh r0, [r5, r0]
	cmp r0, #0x1e
	ble _021E96A2
	add r0, sp, #0
	movs r1, #0
	movs r2, #4
	blx FUN_020D4994
	movs r1, #1
	add r0, sp, #0
	strb r1, [r0, #2]
	bl FUN_0203769C
	add r1, sp, #0
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	movs r1, #2
	add r2, sp, #0
	movs r3, #4
	bl FUN_02096D4C
	ldr r0, _021E96AC @ =0x00004A5C
	movs r1, #0
	strh r1, [r5, r0]
	movs r0, #0xd5
	movs r1, #9
	lsls r0, r0, #2
	str r1, [r5, r0]
_021E96A2:
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E96AC: .4byte 0x00004A5C
	thumb_func_end ov85_021E962C

	thumb_func_start ov85_021E96B0
ov85_021E96B0: @ 0x021E96B0
	push {r3, r4, r5, lr}
	ldr r2, _021E96CC @ =0x00004A50
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #0
	strb r1, [r5, r2]
	bl ov85_021E9458
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E96CC: .4byte 0x00004A50
	thumb_func_end ov85_021E96B0

	thumb_func_start ov85_021E96D0
ov85_021E96D0: @ 0x021E96D0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x66
	adds r4, r1, #0
	str r0, [sp]
	ldr r0, [r5, #0x14]
	ldr r1, _021E96FC @ =0x021EA8D8
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_02001FC8
	movs r1, #0x33
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #0x17
	adds r1, #0x24
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E96FC: .4byte 0x021EA8D8
	thumb_func_end ov85_021E96D0

	thumb_func_start ov85_021E9700
ov85_021E9700: @ 0x021E9700
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x10]
	adds r6, r1, #0
	bl ov85_021E9FD0
	ldr r1, [r4, #0x2c]
	cmp r1, r0
	bne _021E971A
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _021E9736
_021E971A:
	ldr r0, _021E97AC @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0xc3
	tst r0, r1
	beq _021E972A
	ldr r0, _021E97B0 @ =0x000005F2
	bl FUN_0200604C
_021E972A:
	adds r0, r5, #0
	bl ov85_021E943C
	add sp, #4
	adds r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_021E9736:
	movs r0, #0x33
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x66
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021E979E
	subs r1, r1, #1
	cmp r0, r1
	bne _021E9772
	movs r0, #0
	str r0, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #7
	add r2, sp, #0
	movs r3, #1
	bl FUN_02096D4C
	adds r0, r5, #0
	movs r1, #1
	bl ov85_021EA39C
	adds r0, r5, #0
	movs r1, #0
	bl ov85_021E9458
	b _021E9796
_021E9772:
	bl FUN_0203769C
	cmp r0, #0
	bne _021E9792
	movs r0, #0xd5
	movs r1, #0x18
	lsls r0, r0, #2
	str r1, [r5, r0]
	bl ov85_021E9FD0
	ldr r1, _021E97B4 @ =0x00004A52
	strb r0, [r5, r1]
	movs r0, #0xc
	bl FUN_0205A904
	b _021E9796
_021E9792:
	bl FUN_0202551C
_021E9796:
	movs r0, #0x33
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
_021E979E:
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r6, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E97AC: .4byte 0x021D110C
_021E97B0: .4byte 0x000005F2
_021E97B4: .4byte 0x00004A52
	thumb_func_end ov85_021E9700

	thumb_func_start ov85_021E97B8
ov85_021E97B8: @ 0x021E97B8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021E97E4 @ =0x00004A53
	adds r4, r1, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021E97DE
	movs r2, #0
	ldr r0, [r5, #0x10]
	movs r1, #5
	adds r3, r2, #0
	bl FUN_02096D4C
	cmp r0, #1
	bne _021E97DE
	movs r0, #0xd5
	movs r1, #0x1f
	lsls r0, r0, #2
	str r1, [r5, r0]
_021E97DE:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E97E4: .4byte 0x00004A53
	thumb_func_end ov85_021E97B8

	thumb_func_start ov85_021E97E8
ov85_021E97E8: @ 0x021E97E8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0203769C
	cmp r0, #0
	bne _021E97FA
	bl FUN_02037454
_021E97FA:
	bl FUN_02037454
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0x20]
	cmp r1, r0
	bne _021E980E
	movs r0, #0xd5
	movs r1, #0x1f
	lsls r0, r0, #2
	str r1, [r5, r0]
_021E980E:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E97E8

	thumb_func_start ov85_021E9814
ov85_021E9814: @ 0x021E9814
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r4, r1, #0
	movs r1, #0x3e
	lsls r1, r1, #6
	ldr r0, [r0, #0x1c]
	adds r1, r5, r1
	bl ov85_021EA4EC
	movs r0, #0xd5
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E9814

	thumb_func_start ov85_021E9834
ov85_021E9834: @ 0x021E9834
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _021E9860 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #0xc]
	ldr r0, [r5, #0xc]
	movs r1, #0x13
	ldr r0, [r0, #0x28]
	bl FUN_0202D1C0
	movs r0, #0x3b
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_02039EAC
	movs r0, #0xd5
	movs r1, #0x1c
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E9860: .4byte 0x021D116C
	thumb_func_end ov85_021E9834

	thumb_func_start ov85_021E9864
ov85_021E9864: @ 0x021E9864
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0203769C
	cmp r0, #0
	bne _021E9876
	bl FUN_02037454
_021E9876:
	ldr r0, [r5, #0xc]
	movs r2, #0x3b
	lsls r2, r2, #4
	ldr r0, [r0, #0x1c]
	movs r1, #2
	adds r2, r5, r2
	bl FUN_02039EB4
	cmp r0, #0
	beq _021E98B6
	ldr r0, _021E98BC @ =0x00000657
	movs r1, #8
	bl FUN_02006154
	adds r0, r5, #0
	movs r1, #0xd
	movs r2, #0
	bl ov85_021EA0EC
	adds r0, r5, #0
	movs r1, #0x1d
	bl ov85_021E9458
	movs r1, #0
	movs r0, #0x36
	str r1, [r5, #0x1c]
	lsls r0, r0, #4
	str r1, [r5, r0]
	ldr r0, _021E98C0 @ =0x021D116C
	strb r1, [r0, #0xc]
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x24]
_021E98B6:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E98BC: .4byte 0x00000657
_021E98C0: .4byte 0x021D116C
	thumb_func_end ov85_021E9864

	thumb_func_start ov85_021E98C4
ov85_021E98C4: @ 0x021E98C4
	push {r3, r4}
	movs r2, #0x36
	lsls r2, r2, #4
	ldr r4, [r0, r2]
	adds r3, r4, #1
	str r3, [r0, r2]
	cmp r4, #0x3c
	ble _021E98DA
	movs r3, #0xf
	subs r2, #0xc
	str r3, [r0, r2]
_021E98DA:
	adds r0, r1, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov85_021E98C4

	thumb_func_start ov85_021E98E0
ov85_021E98E0: @ 0x021E98E0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #5
	movs r2, #0
	bl ov85_021EA0EC
	adds r0, r5, #0
	movs r1, #0xa
	bl ov85_021E9458
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E98E0

	thumb_func_start ov85_021E9900
ov85_021E9900: @ 0x021E9900
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x36
	lsls r0, r0, #4
	adds r4, r1, #0
	ldr r1, [r5, r0]
	adds r1, r1, #1
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	cmp r0, #0x3c
	ble _021E9930
	movs r1, #0x10
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x66
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r4, #3
_021E9930:
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov85_021E9900

	thumb_func_start ov85_021E993C
ov85_021E993C: @ 0x021E993C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x66
	adds r4, r1, #0
	str r0, [sp]
	ldr r0, [r5, #0x14]
	ldr r1, _021E9968 @ =0x021EA8D8
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_02001FC8
	movs r1, #0x33
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #0xc
	adds r1, #0x24
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E9968: .4byte 0x021EA8D8
	thumb_func_end ov85_021E993C

	thumb_func_start ov85_021E996C
ov85_021E996C: @ 0x021E996C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x10]
	adds r6, r1, #0
	bl ov85_021E9FD0
	ldr r1, [r4, #0x2c]
	cmp r1, r0
	bne _021E9986
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _021E99A2
_021E9986:
	ldr r0, _021E9A14 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0xc3
	tst r0, r1
	beq _021E9996
	ldr r0, _021E9A18 @ =0x000005F2
	bl FUN_0200604C
_021E9996:
	adds r0, r5, #0
	bl ov85_021E943C
	add sp, #4
	adds r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_021E99A2:
	movs r0, #0x33
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x66
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021E9A08
	subs r1, r1, #1
	cmp r0, r1
	bne _021E99DC
	movs r1, #0
	movs r0, #0xd5
	str r1, [sp]
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [r5, #0x10]
	movs r1, #7
	add r2, sp, #0
	movs r3, #1
	bl FUN_02096D4C
	adds r0, r5, #0
	movs r1, #1
	bl ov85_021EA39C
	b _021E9A00
_021E99DC:
	movs r0, #0xd5
	movs r1, #0xd
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r2, #0
	ldr r0, [r5, #0x10]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_02096D4C
	movs r0, #0
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl FUN_0200BE48
_021E9A00:
	movs r0, #0x33
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
_021E9A08:
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r6, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E9A14: .4byte 0x021D110C
_021E9A18: .4byte 0x000005F2
	thumb_func_end ov85_021E996C

	thumb_func_start ov85_021E9A1C
ov85_021E9A1C: @ 0x021E9A1C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0203769C
	cmp r0, #0
	bne _021E9A36
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0
	bl ov85_021EA0EC
	b _021E9A50
_021E9A36:
	movs r0, #0
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl FUN_0200BE48
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov85_021EA0EC
_021E9A50:
	adds r0, r5, #0
	movs r1, #0xe
	bl ov85_021E9458
	movs r0, #0x36
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E9A1C

	thumb_func_start ov85_021E9A6C
ov85_021E9A6C: @ 0x021E9A6C
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #0x36
	lsls r1, r1, #4
	ldr r2, [r0, r1]
	adds r2, r2, #1
	str r2, [r0, r1]
	ldr r2, [r0, r1]
	cmp r2, #0x2d
	ble _021E9A86
	movs r2, #0xf
	subs r1, #0xc
	str r2, [r0, r1]
_021E9A86:
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E9A6C

	thumb_func_start ov85_021E9A90
ov85_021E9A90: @ 0x021E9A90
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xca
	adds r4, r1, #0
	bl FUN_02037AC0
	movs r0, #0xd5
	movs r1, #0x10
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E9A90

	thumb_func_start ov85_021E9AB0
ov85_021E9AB0: @ 0x021E9AB0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0xca
	adds r5, r1, #0
	bl FUN_02037B38
	cmp r0, #0
	beq _021E9AE2
	movs r0, #0
	adds r1, r0, #0
	bl FUN_020398D4
	movs r1, #0x10
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x66
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r5, #3
_021E9AE2:
	adds r0, r4, #0
	bl ov85_021E943C
	adds r0, r5, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E9AB0

	thumb_func_start ov85_021E9AF0
ov85_021E9AF0: @ 0x021E9AF0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	adds r4, r1, #0
	bl ov85_021EA17C
	cmp r0, #0
	beq _021E9B0A
	adds r0, r5, #0
	movs r1, #9
	movs r2, #0
	bl ov85_021EA0EC
_021E9B0A:
	movs r0, #0xd5
	movs r1, #0x12
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E9AF0

	thumb_func_start ov85_021E9B1C
ov85_021E9B1C: @ 0x021E9B1C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	adds r4, r1, #0
	bl ov85_021EA17C
	cmp r0, #0
	beq _021E9B34
	movs r0, #0xd5
	movs r1, #0xa
	lsls r0, r0, #2
	str r1, [r5, r0]
_021E9B34:
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021E9B1C

	thumb_func_start ov85_021E9B40
ov85_021E9B40: @ 0x021E9B40
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	adds r4, r1, #0
	cmp r0, #0xff
	beq _021E9B5E
	bl ov85_021EA17C
	cmp r0, #0
	bne _021E9B5E
	ldr r0, [r5, #0x5c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_021E9B5E:
	adds r0, r5, #0
	movs r1, #0xf
	movs r2, #1
	bl ov85_021EA0EC
	movs r0, #0xd5
	movs r1, #0x14
	lsls r0, r0, #2
	str r1, [r5, r0]
	bl FUN_0203769C
	cmp r0, #0
	bne _021E9B80
	adds r0, r5, #0
	movs r1, #0
	bl ov85_021EA39C
_021E9B80:
	bl FUN_02037454
	ldr r1, _021E9B9C @ =0x00004A58
	movs r2, #0x4b
	str r0, [r5, r1]
	lsls r2, r2, #2
	subs r0, r1, #4
	str r2, [r5, r0]
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E9B9C: .4byte 0x00004A58
	thumb_func_end ov85_021E9B40

	thumb_func_start ov85_021E9BA0
ov85_021E9BA0: @ 0x021E9BA0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021E9BD8 @ =0x00004A58
	adds r4, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9BBE
	bl FUN_02037454
	ldr r1, _021E9BD8 @ =0x00004A58
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021E9BBE
	movs r0, #0
	str r0, [r5, r1]
_021E9BBE:
	movs r0, #0xd5
	movs r1, #0x15
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0
	adds r0, #0xc
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E9BD8: .4byte 0x00004A58
	thumb_func_end ov85_021E9BA0

	thumb_func_start ov85_021E9BDC
ov85_021E9BDC: @ 0x021E9BDC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021E9C48 @ =0x00004A58
	adds r4, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9BFA
	bl FUN_02037454
	ldr r1, _021E9C48 @ =0x00004A58
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021E9BFA
	movs r0, #0
	str r0, [r5, r1]
_021E9BFA:
	ldr r0, _021E9C4C @ =0x00004A54
	ldr r1, [r5, r0]
	subs r1, r1, #1
	str r1, [r5, r0]
	ldr r1, [r5, r0]
	cmp r1, #0
	bge _021E9C0E
	movs r1, #0
	adds r0, r0, #4
	str r1, [r5, r0]
_021E9C0E:
	movs r1, #0x36
	lsls r1, r1, #4
	ldr r0, [r5, r1]
	adds r0, r0, #1
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	cmp r0, #0x3c
	ble _021E9C3C
	ldr r0, _021E9C48 @ =0x00004A58
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021E9C3C
	movs r0, #0
	subs r1, #0xc
	str r0, [r5, r1]
	bl FUN_0203769C
	cmp r0, #0
	bne _021E9C3C
	adds r0, r5, #0
	movs r1, #1
	bl ov85_021EA39C
_021E9C3C:
	adds r0, r5, #0
	bl ov85_021E943C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E9C48: .4byte 0x00004A58
_021E9C4C: .4byte 0x00004A54
	thumb_func_end ov85_021E9BDC

	thumb_func_start ov85_021E9C50
ov85_021E9C50: @ 0x021E9C50
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0xc
	bl FUN_0205A904
	movs r1, #0x10
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x66
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl ov85_021E943C
	movs r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov85_021E9C50

	thumb_func_start ov85_021E9C84
ov85_021E9C84: @ 0x021E9C84
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0x13
	bgt _021E9CAC
	bge _021E9D12
	cmp r4, #8
	bgt _021E9CA6
	cmp r4, #2
	blt _021E9D92
	beq _021E9CBA
	cmp r4, #7
	beq _021E9D8C
	cmp r4, #8
	beq _021E9D8C
	pop {r4, r5, r6, pc}
_021E9CA6:
	cmp r4, #0xd
	beq _021E9CC0
	pop {r4, r5, r6, pc}
_021E9CAC:
	cmp r4, #0x19
	bgt _021E9CB4
	beq _021E9CDA
	pop {r4, r5, r6, pc}
_021E9CB4:
	cmp r4, #0x1f
	beq _021E9D60
	pop {r4, r5, r6, pc}
_021E9CBA:
	bl ov85_021EA19C
	b _021E9D8C
_021E9CC0:
	movs r0, #0x33
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9D8C
	movs r1, #0x66
	bl FUN_02001FFC
	movs r0, #0x33
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
	b _021E9D8C
_021E9CDA:
	ldr r0, [r5, #0x5c]
	bl ov85_021EA17C
	cmp r0, #0
	bne _021E9CEE
	ldr r0, [r5, #0x5c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_021E9CEE:
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #0
	bl ov85_021EA0EC
	movs r0, #0x33
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9D8C
	movs r1, #0x66
	bl FUN_02001FFC
	movs r0, #0x33
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
	b _021E9D8C
_021E9D12:
	ldr r0, _021E9D94 @ =0x00004A50
	ldrb r0, [r5, r0]
	cmp r0, #1
	beq _021E9D92
	adds r0, r6, #0
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl FUN_0200BE48
	bl FUN_0203769C
	cmp r6, r0
	beq _021E9D92
	movs r0, #0x33
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9D4A
	movs r1, #0x66
	bl FUN_02001FFC
	movs r0, #0x33
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
_021E9D4A:
	bl FUN_0203769C
	cmp r0, #0
	bne _021E9D8C
	ldr r2, [r5, #0x10]
	ldr r0, _021E9D98 @ =0x0000FFFF
	ldr r1, [r2, #0x30]
	eors r0, r6
	ands r0, r1
	str r0, [r2, #0x30]
	b _021E9D8C
_021E9D60:
	ldr r0, [r5, #0x5c]
	bl ov85_021EA17C
	cmp r0, #0
	bne _021E9D74
	ldr r0, [r5, #0x5c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_021E9D74:
	movs r0, #0x33
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9D8C
	movs r1, #0x66
	bl FUN_02001FFC
	movs r0, #0x33
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
_021E9D8C:
	movs r0, #0xd5
	lsls r0, r0, #2
	str r4, [r5, r0]
_021E9D92:
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E9D94: .4byte 0x00004A50
_021E9D98: .4byte 0x0000FFFF
	thumb_func_end ov85_021E9C84

	thumb_func_start ov85_021E9D9C
ov85_021E9D9C: @ 0x021E9D9C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r0, #3
	bne _021E9E3E
	cmp r4, #1
	beq _021E9DBA
	cmp r4, #0x13
	beq _021E9E00
	b _021E9E36
_021E9DBA:
	adds r0, r6, #0
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl FUN_0200BE48
	adds r0, r5, #0
	movs r1, #1
	bl ov85_021EA39C
	movs r0, #0xd5
	lsls r0, r0, #2
	str r4, [r5, r0]
	bl FUN_02037454
	ldr r1, [r5, #0x10]
	str r0, [r1, #0x2c]
	ldr r0, [r5, #0x10]
	movs r1, #0
	str r1, [r0, #0x30]
	bl FUN_0203769C
	cmp r0, #0
	bne _021E9E50
	movs r3, #1
	str r3, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #7
	add r2, sp, #0
	bl FUN_02096D4C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021E9E00:
	adds r0, r6, #0
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl FUN_0200BE48
	bl FUN_0203769C
	cmp r6, r0
	beq _021E9E50
	bl FUN_0203769C
	cmp r0, #0
	bne _021E9E2C
	ldr r2, [r5, #0x10]
	ldr r0, _021E9E54 @ =0x0000FFFF
	ldr r1, [r2, #0x30]
	eors r0, r6
	ands r0, r1
	str r0, [r2, #0x30]
_021E9E2C:
	movs r0, #0xd5
	lsls r0, r0, #2
	add sp, #4
	str r4, [r5, r0]
	pop {r3, r4, r5, r6, pc}
_021E9E36:
	bl FUN_0202551C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021E9E3E:
	cmp r4, #1
	bne _021E9E50
	ldr r0, [r5, #0x10]
	movs r1, #0
	str r1, [r0, #0x30]
	bl FUN_02037454
	ldr r1, [r5, #0x10]
	str r0, [r1, #0x2c]
_021E9E50:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E9E54: .4byte 0x0000FFFF
	thumb_func_end ov85_021E9D9C

	thumb_func_start ov85_021E9E58
ov85_021E9E58: @ 0x021E9E58
	push {r3, lr}
	ldrh r1, [r0]
	adds r1, #0xa
	strh r1, [r0]
	ldrh r2, [r0]
	movs r1, #0x5a
	lsls r1, r1, #2
	cmp r2, r1
	bls _021E9E6E
	movs r1, #0
	strh r1, [r0]
_021E9E6E:
	ldrh r0, [r0]
	bl FUN_0201FCAC
	movs r1, #0xa
	adds r2, r0, #0
	muls r2, r1, r2
	asrs r0, r2, #0xb
	lsrs r0, r0, #0x14
	adds r0, r2, r0
	asrs r0, r0, #0xc
	adds r0, #0xf
	lsls r2, r0, #5
	movs r0, #0x1d
	orrs r2, r0
	add r0, sp, #0
	strh r2, [r0]
	add r0, sp, #0
	movs r2, #2
	blx FUN_020CFD18
	add r0, sp, #0
	movs r1, #0x2a
	movs r2, #2
	blx FUN_020CFD18
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov85_021E9E58

	thumb_func_start ov85_021E9EA4
ov85_021E9EA4: @ 0x021E9EA4
	push {r3, r4, r5, lr}
	movs r5, #0
	adds r4, r5, #0
_021E9EAA:
	adds r0, r4, #0
	bl FUN_02034818
	cmp r0, #0
	beq _021E9EB6
	adds r5, r5, #1
_021E9EB6:
	adds r4, r4, #1
	cmp r4, #5
	blt _021E9EAA
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E9EA4

	thumb_func_start ov85_021E9EC0
ov85_021E9EC0: @ 0x021E9EC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r3, [sp, #0x14]
	adds r6, r0, #0
	str r2, [sp, #0x10]
	bl FUN_0203769C
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	bl ov85_021EA010
	cmp r0, #0
	bne _021E9EE0
	add sp, #0x28
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E9EE0:
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r7, [sp, #0x14]
	movs r0, #0
	str r0, [sp, #0x20]
	adds r4, r7, #0
	movs r5, #1
_021E9EF2:
	movs r0, #0xdd
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _021E9FAC
	bl FUN_02028F88
	str r0, [sp, #0x24]
	movs r0, #0xdd
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	ldr r1, [r4, #0x3c]
	bl FUN_02028F58
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x24]
	ldr r0, [r0, #0x34]
	movs r1, #0
	movs r3, #5
	bl FUN_0200BFCC
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	ldr r0, [r0, #0x34]
	ldr r1, [r1, #0x38]
	movs r2, #1
	movs r3, #0x66
	bl FUN_0200BC4C
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	cmp r1, r0
	str r5, [sp]
	bne _021E9F74
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E9FC8 @ =0x00020300
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x3c]
	adds r0, r6, #0
	movs r3, #5
	bl FUN_020200FC
	str r5, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E9FC8 @ =0x00020300
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #0
	movs r3, #0x46
	bl FUN_020200FC
	b _021E9FA6
_021E9F74:
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x3c]
	adds r0, r6, #0
	movs r3, #5
	bl FUN_020200FC
	str r5, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #0
	movs r3, #0x46
	bl FUN_020200FC
_021E9FA6:
	ldr r0, [sp, #0x18]
	bl FUN_02026380
_021E9FAC:
	ldr r0, [sp, #0x20]
	adds r7, #8
	adds r0, r0, #1
	adds r4, r4, #4
	adds r5, #0x12
	str r0, [sp, #0x20]
	cmp r0, #5
	blt _021E9EF2
	adds r0, r6, #0
	bl FUN_0201D578
	movs r0, #1
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E9FC8: .4byte 0x00020300
	thumb_func_end ov85_021E9EC0

	thumb_func_start ov85_021E9FCC
ov85_021E9FCC: @ 0x021E9FCC
	bx lr
	.align 2, 0
	thumb_func_end ov85_021E9FCC

	thumb_func_start ov85_021E9FD0
ov85_021E9FD0: @ 0x021E9FD0
	push {r3, r4, r5, lr}
	movs r5, #0
	adds r4, r5, #0
_021E9FD6:
	adds r0, r4, #0
	bl FUN_02034818
	cmp r0, #0
	beq _021E9FE2
	adds r5, r5, #1
_021E9FE2:
	adds r4, r4, #1
	cmp r4, #5
	blt _021E9FD6
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E9FD0

	thumb_func_start ov85_021E9FEC
ov85_021E9FEC: @ 0x021E9FEC
	push {r4, r5, r6, lr}
	movs r5, #0
	adds r4, r5, #0
	movs r6, #1
_021E9FF4:
	adds r0, r4, #0
	bl FUN_02034818
	cmp r0, #0
	beq _021EA004
	adds r0, r6, #0
	lsls r0, r4
	orrs r5, r0
_021EA004:
	adds r4, r4, #1
	cmp r4, #5
	blt _021E9FF4
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov85_021E9FEC

	thumb_func_start ov85_021EA010
ov85_021EA010: @ 0x021EA010
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r4, #0
	str r4, [sp]
	adds r6, r7, #0
	adds r5, r7, #0
_021EA01C:
	movs r0, #0xdd
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	adds r0, r0, #4
	str r1, [r6, r0]
	adds r0, r4, #0
	bl FUN_02034818
	movs r1, #0xdd
	lsls r1, r1, #2
	str r0, [r6, r1]
	ldr r0, _021EA0E0 @ =0x00004A60
	ldr r2, _021EA0E4 @ =0x00004A68
	ldr r1, [r5, r0]
	adds r0, r0, #4
	ldr r0, [r5, r0]
	str r1, [r5, r2]
	adds r1, r2, #4
	str r0, [r5, r1]
	movs r0, #0xdd
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021EA05A
	bl FUN_02028F84
	ldr r1, _021EA0E0 @ =0x00004A60
	str r0, [r5, r1]
	movs r1, #1
	ldr r0, _021EA0E8 @ =0x00004A64
	b _021EA064
_021EA05A:
	adds r0, r2, #0
	movs r1, #0
	subs r0, #8
	str r1, [r5, r0]
	subs r0, r2, #4
_021EA064:
	adds r4, r4, #1
	str r1, [r5, r0]
	adds r6, #8
	adds r5, #0x10
	cmp r4, #5
	blt _021EA01C
	movs r4, #0
	adds r2, r7, #0
	adds r3, r7, #0
_021EA076:
	movs r0, #0xdd
	movs r1, #0xde
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r7, r0]
	ldr r1, [r7, r1]
	cmp r1, r0
	beq _021EA0A0
	movs r1, #1
	str r1, [sp]
	cmp r0, #0
	bne _021EA098
	movs r0, #0xe7
	movs r1, #3
	lsls r0, r0, #2
	str r1, [r2, r0]
	b _021EA0D0
_021EA098:
	movs r0, #0xe7
	lsls r0, r0, #2
	str r1, [r2, r0]
	b _021EA0D0
_021EA0A0:
	ldr r0, _021EA0E0 @ =0x00004A60
	ldr r5, _021EA0E4 @ =0x00004A68
	ldr r1, [r3, r0]
	ldr r6, [r3, r5]
	adds r0, r0, #4
	adds r5, r5, #4
	ldr r0, [r3, r0]
	ldr r5, [r3, r5]
	eors r1, r6
	eors r5, r0
	orrs r1, r5
	beq _021EA0D0
	movs r1, #1
	str r1, [sp]
	cmp r0, #0
	bne _021EA0CA
	movs r0, #0xe7
	movs r1, #3
	lsls r0, r0, #2
	str r1, [r2, r0]
	b _021EA0D0
_021EA0CA:
	movs r0, #0xe7
	lsls r0, r0, #2
	str r1, [r2, r0]
_021EA0D0:
	adds r4, r4, #1
	adds r7, #8
	adds r2, r2, #4
	adds r3, #0x10
	cmp r4, #5
	blt _021EA076
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EA0E0: .4byte 0x00004A60
_021EA0E4: .4byte 0x00004A68
_021EA0E8: .4byte 0x00004A64
	thumb_func_end ov85_021EA010

	thumb_func_start ov85_021EA0EC
ov85_021EA0EC: @ 0x021EA0EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r7, r1, #0
	movs r0, #0xb4
	movs r1, #0x66
	adds r6, r2, #0
	bl FUN_02026354
	adds r4, r0, #0
	ldr r0, [r5, #0x38]
	adds r1, r7, #0
	adds r2, r4, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x54]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #0xbe
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0xbe
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	movs r2, #1
	movs r3, #0xa
	bl FUN_0200E998
	cmp r6, #0
	bne _021EA15C
	adds r0, r5, #0
	bl ov85_021EA398
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r2, [r5, #0x54]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	add sp, #0xc
	str r0, [r5, #0x5c]
	pop {r4, r5, r6, r7, pc}
_021EA15C:
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r2, [r5, #0x54]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	movs r0, #0xff
	str r0, [r5, #0x5c]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov85_021EA0EC

	thumb_func_start ov85_021EA17C
ov85_021EA17C: @ 0x021EA17C
	push {r3, lr}
	cmp r0, #0xff
	bne _021EA186
	movs r0, #1
	pop {r3, pc}
_021EA186:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _021EA196
	movs r0, #1
	pop {r3, pc}
_021EA196:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov85_021EA17C

	thumb_func_start ov85_021EA19C
ov85_021EA19C: @ 0x021EA19C
	movs r1, #0xbe
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r3, _021EA1A8 @ =FUN_0200E9BC
	movs r1, #0
	bx r3
	.align 2, 0
_021EA1A8: .4byte FUN_0200E9BC
	thumb_func_end ov85_021EA19C

	thumb_func_start ov85_021EA1AC
ov85_021EA1AC: @ 0x021EA1AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #0xcf
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp, #0x14]
	movs r0, #0xd3
	lsls r0, r0, #2
	movs r4, #0
	adds r0, r5, r0
	str r4, [sp, #8]
	adds r6, r5, #0
	movs r7, #0x1c
	str r0, [sp, #0x18]
_021EA1CE:
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #3
	bhi _021EA29A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EA1E4: @ jump table
	.2byte _021EA29A - _021EA1E4 - 2 @ case 0
	.2byte _021EA1EC - _021EA1E4 - 2 @ case 1
	.2byte _021EA29A - _021EA1E4 - 2 @ case 2
	.2byte _021EA262 - _021EA1E4 - 2 @ case 3
_021EA1EC:
	movs r0, #0xdd
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _021EA1FA
	bl FUN_0202551C
_021EA1FA:
	movs r0, #0xdd
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02028F94
	str r0, [sp, #0xc]
	movs r0, #0xdd
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0202903C
	str r0, [sp, #0x10]
	bl FUN_0203769C
	cmp r4, r0
	bne _021EA22C
	movs r0, #0x8f
	ldr r1, [sp, #0xc]
	lsls r0, r0, #2
	lsls r1, r1, #1
	ldr r0, [r5, r0]
	adds r1, #0x26
	bl FUN_020248F0
	b _021EA248
_021EA22C:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	adds r2, r4, #0
	bl ov85_021EA324
	movs r0, #0x8f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	bl FUN_020248F0
_021EA248:
	movs r0, #0x8f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xe7
	movs r1, #2
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r0, #1
	str r0, [sp, #8]
	b _021EA29A
_021EA262:
	bl FUN_0203769C
	cmp r4, r0
	bne _021EA286
	movs r0, #0xdd
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02028F94
	adds r1, r0, #0
	movs r0, #0x8f
	lsls r0, r0, #2
	lsls r1, r1, #1
	ldr r0, [r5, r0]
	adds r1, #0x27
	bl FUN_020248F0
	b _021EA292
_021EA286:
	movs r0, #0x8f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_020248F0
_021EA292:
	movs r0, #0xe7
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_021EA29A:
	ldr r0, [sp, #4]
	adds r4, r4, #1
	adds r0, r0, #2
	adds r5, r5, #4
	adds r6, #8
	adds r7, r7, #2
	str r0, [sp, #4]
	cmp r4, #5
	blt _021EA1CE
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _021EA2B8
	ldr r0, _021EA2BC @ =0x0000064E
	bl FUN_0200604C
_021EA2B8:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021EA2BC: .4byte 0x0000064E
	thumb_func_end ov85_021EA1AC

	thumb_func_start ov85_021EA2C0
ov85_021EA2C0: @ 0x021EA2C0
	push {r3, r4, r5, lr}
	movs r2, #0xd3
	adds r5, r0, #0
	lsls r2, r2, #2
	adds r4, r1, #0
	movs r0, #0x64
	movs r1, #9
	adds r2, r5, r2
	movs r3, #0x66
	bl FUN_020079F4
	movs r2, #0xd1
	lsls r2, r2, #2
	str r0, [r5, r2]
	adds r2, #0xc
	adds r0, r4, #0
	movs r1, #7
	adds r2, r5, r2
	movs r3, #0x66
	bl FUN_02007C48
	movs r3, #0xd2
	lsls r3, r3, #2
	str r0, [r5, r3]
	movs r0, #0x66
	subs r3, #0xc
	str r0, [sp]
	movs r0, #0x64
	movs r1, #0x2b
	movs r2, #1
	adds r3, r5, r3
	bl FUN_020079BC
	movs r3, #0xcd
	lsls r3, r3, #2
	str r0, [r5, r3]
	movs r0, #0x66
	adds r3, #0xc
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #9
	movs r2, #1
	adds r3, r5, r3
	bl FUN_02007C10
	movs r1, #0xce
	lsls r1, r1, #2
	str r0, [r5, r1]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov85_021EA2C0

	thumb_func_start ov85_021EA324
ov85_021EA324: @ 0x021EA324
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x18]
	adds r1, r3, #0
	adds r5, r2, #0
	bl FUN_0205B464
	adds r4, r0, #0
	ldr r0, [r6, #4]
	movs r2, #6
	ldr r6, [r0, #0xc]
	ldr r0, [r7, #4]
	lsls r2, r2, #8
	ldr r1, [r0, #0x14]
	adds r0, r4, #0
	muls r0, r2, r0
	adds r0, r1, r0
	ldr r1, _021EA364 @ =0x021EA8E0
	lsls r3, r5, #1
	ldrh r1, [r1, r3]
	blx FUN_020CFE74
	lsls r0, r4, #5
	adds r1, r5, #7
	adds r0, r6, r0
	lsls r1, r1, #5
	movs r2, #0x20
	blx FUN_020CFD18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA364: .4byte 0x021EA8E0
	thumb_func_end ov85_021EA324

	thumb_func_start ov85_021EA368
ov85_021EA368: @ 0x021EA368
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xd1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0xd2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0xce
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov85_021EA368

	thumb_func_start ov85_021EA398
ov85_021EA398: @ 0x021EA398
	movs r0, #1
	bx lr
	thumb_func_end ov85_021EA398

	thumb_func_start ov85_021EA39C
ov85_021EA39C: @ 0x021EA39C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0203769C
	cmp r0, #0
	bne _021EA3E8
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _021EA3BA
	movs r0, #1
	bl FUN_02038C1C
	b _021EA3CA
_021EA3BA:
	bl FUN_02037454
	adds r0, r4, r0
	cmp r0, #5
	ble _021EA3C6
	movs r0, #5
_021EA3C6:
	bl FUN_02038C1C
_021EA3CA:
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	ldr r0, _021EA3EC @ =0x00004A51
	bne _021EA3DA
	movs r1, #2
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
_021EA3DA:
	cmp r4, #0
	bne _021EA3E4
	movs r1, #1
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
_021EA3E4:
	movs r1, #0
	strb r1, [r5, r0]
_021EA3E8:
	pop {r3, r4, r5, pc}
	nop
_021EA3EC: .4byte 0x00004A51
	thumb_func_end ov85_021EA39C

	thumb_func_start ov85_021EA3F0
ov85_021EA3F0: @ 0x021EA3F0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	bl ov85_021E9FD0
	adds r5, r0, #0
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x2c]
	cmp r5, r0
	ble _021EA41A
	movs r3, #1
	add r0, sp, #0
	strb r3, [r0]
	ldr r0, [r4, #0x10]
	movs r1, #7
	add r2, sp, #0
	bl FUN_02096D4C
	movs r1, #1
	b _021EA41C
_021EA41A:
	movs r1, #0
_021EA41C:
	ldr r0, _021EA4E4 @ =0x00004A48
	str r1, [r4, r0]
	ldr r0, _021EA4E8 @ =0x00004A44
	ldr r0, [r4, r0]
	cmp r5, r0
	bne _021EA42E
	add sp, #4
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_021EA42E:
	cmp r5, #5
	bhi _021EA4D4
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EA43E: @ jump table
	.2byte _021EA4D4 - _021EA43E - 2 @ case 0
	.2byte _021EA44A - _021EA43E - 2 @ case 1
	.2byte _021EA48E - _021EA43E - 2 @ case 2
	.2byte _021EA48E - _021EA43E - 2 @ case 3
	.2byte _021EA48E - _021EA43E - 2 @ case 4
	.2byte _021EA4C6 - _021EA43E - 2 @ case 5
_021EA44A:
	bl FUN_02037454
	cmp r0, #1
	bgt _021EA45A
	bl FUN_02033250
	cmp r0, #1
	bls _021EA460
_021EA45A:
	add sp, #4
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_021EA460:
	movs r0, #0xd5
	movs r1, #0x11
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	subs r1, #0x12
	bl ov85_021EA39C
	movs r0, #0x33
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021EA488
	movs r1, #0x66
	bl FUN_02001FFC
	movs r0, #0x33
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
_021EA488:
	add sp, #4
	movs r0, #2
	pop {r3, r4, r5, r6, pc}
_021EA48E:
	movs r0, #0xd
	bl FUN_0205A904
	ldr r0, _021EA4E8 @ =0x00004A44
	ldr r1, [r4, r0]
	cmp r5, r1
	bge _021EA4D4
	adds r0, #0xd
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _021EA4AA
	cmp r0, #1
	beq _021EA4B4
	b _021EA4BC
_021EA4AA:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov85_021EA39C
	b _021EA4BC
_021EA4B4:
	adds r0, r4, #0
	movs r1, #0
	bl ov85_021EA39C
_021EA4BC:
	bl FUN_02037454
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x2c]
	b _021EA4D4
_021EA4C6:
	movs r0, #0xc
	bl FUN_0205A904
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov85_021EA39C
_021EA4D4:
	bl ov85_021E9FD0
	ldr r1, _021EA4E8 @ =0x00004A44
	str r0, [r4, r1]
	movs r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021EA4E4: .4byte 0x00004A48
_021EA4E8: .4byte 0x00004A44
	thumb_func_end ov85_021EA3F0

	thumb_func_start ov85_021EA4EC
ov85_021EA4EC: @ 0x021EA4EC
	bx lr
	.align 2, 0
	thumb_func_end ov85_021EA4EC

	.rodata

_021EA4F0:
	.byte 0x00, 0x00, 0xB4, 0x00, 0x00, 0x00, 0xC6, 0x00, 0x56, 0x01, 0x67, 0x01, 0x01, 0x02, 0x13, 0x1A
	.byte 0x04, 0x0F, 0x28, 0x00, 0x00, 0x00, 0xD7, 0x00, 0x43, 0x01, 0x67, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x25, 0x00, 0x8E, 0x00, 0xD7, 0x00, 0x43, 0x01, 0xC1, 0x7B, 0x1E, 0x02
	.byte 0xED, 0x7B, 0x1E, 0x02, 0x2D, 0x7C, 0x1E, 0x02, 0xDD, 0x05, 0x00, 0x00, 0xDD, 0x05, 0x00, 0x00
	.byte 0xDD, 0x05, 0x00, 0x00, 0x42, 0x06, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x0C, 0x12, 0x08, 0x02, 0x0F, 0x94, 0x00
	.byte 0x01, 0x0C, 0x06, 0x08, 0x02, 0x0F, 0xBC, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x48, 0xA5, 0x1E, 0x02, 0xF4, 0xA5, 0x1E, 0x02, 0x98, 0xA6, 0x1E, 0x02
	.byte 0xD8, 0xA6, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xFB, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xF4, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x0C, 0x12, 0x08, 0x02, 0x0F, 0x94, 0x00, 0x01, 0x05, 0x0A, 0x08
	.byte 0x02, 0x0F, 0xBC, 0x00, 0x01, 0x13, 0x0A, 0x08, 0x02, 0x0F, 0xE4, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x03, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x05, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x07
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x0C, 0x12, 0x08, 0x02, 0x0F, 0x94, 0x00
	.byte 0x01, 0x04, 0x0D, 0x08, 0x02, 0x0F, 0xBC, 0x00, 0x01, 0x0C, 0x06, 0x08, 0x02, 0x0F, 0xE4, 0x00
	.byte 0x01, 0x14, 0x0D, 0x08, 0x02, 0x0F, 0x0C, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x0C, 0x13, 0x08, 0x02, 0x0F, 0x94, 0x00
	.byte 0x01, 0x04, 0x0E, 0x08, 0x02, 0x0F, 0xBC, 0x00, 0x01, 0x06, 0x09, 0x08, 0x02, 0x0F, 0xE4, 0x00
	.byte 0x01, 0x12, 0x09, 0x08, 0x02, 0x0F, 0x0C, 0x01, 0x01, 0x14, 0x0E, 0x08, 0x02, 0x0F, 0x34, 0x01
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x9F, 0x00, 0x00, 0x00, 0xA3, 0x00, 0x00, 0x00
	.byte 0x9F, 0x00, 0x00, 0x00, 0xA3, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00
	.byte 0xAF, 0x00, 0x00, 0x00, 0xB7, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xF0, 0xA4, 0x1E, 0x02
	.byte 0x02, 0x00, 0x00, 0x00, 0xF4, 0xA4, 0x1E, 0x02, 0x02, 0x00, 0x00, 0x00, 0x14, 0xA5, 0x1E, 0x02
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0xA5, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB4, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0E, 0x01, 0xB4, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x01, 0xD8, 0x00
	.byte 0x90, 0x00, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x0E, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x5A, 0x00, 0xD2, 0x00, 0x4A, 0x01, 0x00, 0x00, 0x00, 0x00, 0x5A, 0x00, 0xB4, 0x00
	.byte 0x0E, 0x01, 0x00, 0x00, 0x00, 0x00, 0x5A, 0x00, 0xA2, 0x00, 0xEA, 0x00, 0x32, 0x01, 0x12, 0x00
	.byte 0xF9, 0x5A, 0x1E, 0x02, 0x0D, 0x5B, 0x1E, 0x02, 0x31, 0x5B, 0x1E, 0x02, 0x49, 0x5B, 0x1E, 0x02
	.byte 0x79, 0x5B, 0x1E, 0x02, 0x99, 0x5B, 0x1E, 0x02, 0xC9, 0x5B, 0x1E, 0x02, 0x59, 0x5C, 0x1E, 0x02
	.byte 0x81, 0x5C, 0x1E, 0x02, 0xA5, 0x5C, 0x1E, 0x02, 0xD1, 0x5C, 0x1E, 0x02, 0xE5, 0x5C, 0x1E, 0x02
	.byte 0xFD, 0x5C, 0x1E, 0x02, 0x21, 0x5D, 0x1E, 0x02, 0x3D, 0x5D, 0x1E, 0x02, 0x85, 0x5D, 0x1E, 0x02
	.byte 0xAD, 0x5D, 0x1E, 0x02, 0x31, 0x5E, 0x1E, 0x02, 0xB5, 0x5E, 0x1E, 0x02, 0xE9, 0x5E, 0x1E, 0x02
	.byte 0x11, 0x5F, 0x1E, 0x02, 0x3D, 0x5F, 0x1E, 0x02, 0x59, 0x5F, 0x1E, 0x02, 0x6D, 0x5F, 0x1E, 0x02
	.byte 0x85, 0x5F, 0x1E, 0x02, 0x9D, 0x5F, 0x1E, 0x02, 0xD1, 0x5F, 0x1E, 0x02, 0xE1, 0x5F, 0x1E, 0x02
	.byte 0xF1, 0x60, 0x1E, 0x02, 0xC9, 0x61, 0x1E, 0x02, 0xFD, 0x61, 0x1E, 0x02, 0x25, 0x62, 0x1E, 0x02
	.byte 0xA1, 0x62, 0x1E, 0x02, 0xB5, 0x62, 0x1E, 0x02, 0xD9, 0x62, 0x1E, 0x02, 0x6D, 0x63, 0x1E, 0x02
	.byte 0xD9, 0x63, 0x1E, 0x02, 0x21, 0x64, 0x1E, 0x02, 0x75, 0x64, 0x1E, 0x02, 0x99, 0x64, 0x1E, 0x02
	.byte 0x2D, 0x65, 0x1E, 0x02, 0x51, 0x65, 0x1E, 0x02, 0x7D, 0x65, 0x1E, 0x02, 0x95, 0x65, 0x1E, 0x02
	.byte 0xD5, 0x65, 0x1E, 0x02, 0x11, 0x66, 0x1E, 0x02, 0x45, 0x66, 0x1E, 0x02, 0x59, 0x66, 0x1E, 0x02
	.byte 0x75, 0x66, 0x1E, 0x02, 0x95, 0x66, 0x1E, 0x02, 0xF5, 0x66, 0x1E, 0x02, 0x0D, 0x67, 0x1E, 0x02
	.byte 0x49, 0x67, 0x1E, 0x02, 0x61, 0x67, 0x1E, 0x02, 0x00, 0x17, 0x0D, 0x07, 0x04, 0x0D, 0x78, 0x01
	.byte 0xA0, 0x01, 0xA0, 0x07, 0xA0, 0x0D, 0xA0, 0x13, 0xA0, 0x19, 0x08, 0x02, 0x08, 0x03, 0x08, 0x04
	.byte 0x18, 0x00, 0x00, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x66, 0x00, 0x00, 0x00, 0xCC, 0x00, 0x54, 0x00, 0xCC, 0x00, 0x35, 0x00, 0xE9, 0x00, 0x48, 0x00
	.byte 0xDF, 0x00, 0x67, 0x00, 0xB8, 0x00, 0x67, 0x00, 0xAE, 0x00, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB9, 0x92, 0x1E, 0x02, 0x41, 0x94, 0x1E, 0x02, 0x8D, 0x94, 0x1E, 0x02, 0xF9, 0x92, 0x1E, 0x02
	.byte 0xBD, 0x94, 0x1E, 0x02, 0xED, 0x94, 0x1E, 0x02, 0x15, 0x96, 0x1E, 0x02, 0x2D, 0x96, 0x1E, 0x02
	.byte 0xB1, 0x96, 0x1E, 0x02, 0xE1, 0x98, 0x1E, 0x02, 0x01, 0x99, 0x1E, 0x02, 0x3D, 0x99, 0x1E, 0x02
	.byte 0x6D, 0x99, 0x1E, 0x02, 0x1D, 0x9A, 0x1E, 0x02, 0x6D, 0x9A, 0x1E, 0x02, 0x91, 0x9A, 0x1E, 0x02
	.byte 0xB1, 0x9A, 0x1E, 0x02, 0xF1, 0x9A, 0x1E, 0x02, 0x1D, 0x9B, 0x1E, 0x02, 0x41, 0x9B, 0x1E, 0x02
	.byte 0xA1, 0x9B, 0x1E, 0x02, 0xDD, 0x9B, 0x1E, 0x02, 0xD1, 0x96, 0x1E, 0x02, 0x01, 0x97, 0x1E, 0x02
	.byte 0xB9, 0x97, 0x1E, 0x02, 0xE9, 0x97, 0x1E, 0x02, 0x15, 0x98, 0x1E, 0x02, 0x35, 0x98, 0x1E, 0x02
	.byte 0x65, 0x98, 0x1E, 0x02, 0xC5, 0x98, 0x1E, 0x02, 0x69, 0x94, 0x1E, 0x02, 0x51, 0x9C, 0x1E, 0x02

	.data

_021EAA80:
	.byte 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x021EAAC0
