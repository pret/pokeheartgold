
	thumb_func_start ov91_0225C540
ov91_0225C540: @ 0x0225C540
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x6a
	lsls r2, r0, #0x11
	bl FUN_0201A910
	adds r0, r4, #0
	movs r1, #0x88
	movs r2, #0x6a
	bl FUN_02007280
	movs r1, #0
	movs r2, #0x88
	adds r4, r0, #0
	blx FUN_020E5B44
	str r5, [sp]
	adds r1, r5, #0
	adds r1, #0x39
	ldr r2, [r5, #0x34]
	adds r5, #0x38
	adds r0, r4, #0
	ldrb r1, [r1]
	ldrb r3, [r5]
	adds r0, #8
	bl FUN_02258800
	adds r0, r4, #0
	movs r1, #0x6a
	bl ov91_0225CBE4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov91_0225C540

	thumb_func_start ov91_0225C58C
ov91_0225C58C: @ 0x0225C58C
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r6, r0, #0
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_020072A4
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #8
	bl FUN_02258B54
	cmp r0, #1
	bne _0225C60A
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _0225C5BE
	cmp r0, #1
	beq _0225C5D8
	cmp r0, #2
	beq _0225C5EC
	b _0225C5FA
_0225C5BE:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0225C5CA
	bl FUN_0200FB70
_0225C5CA:
	movs r0, #0
	bl FUN_0200FC20
	ldr r0, [r4, #0x78]
	adds r0, r0, #1
	str r0, [r4, #0x78]
	b _0225C604
_0225C5D8:
	adds r0, r4, #0
	adds r0, #8
	bl FUN_02258B98
	cmp r0, #1
	bne _0225C604
	ldr r0, [r4, #0x78]
	adds r0, r0, #1
	str r0, [r4, #0x78]
	b _0225C604
_0225C5EC:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov91_0225CC4C
	add sp, #0x28
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225C5FA:
	bl FUN_0202551C
	add sp, #0x28
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225C604:
	add sp, #0x28
	movs r0, #0
	pop {r4, r5, r6, pc}
_0225C60A:
	ldr r0, [r5]
	cmp r0, #0xf
	bhi _0225C67E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225C61C: @ jump table
	.2byte _0225C63C - _0225C61C - 2 @ case 0
	.2byte _0225C650 - _0225C61C - 2 @ case 1
	.2byte _0225C674 - _0225C61C - 2 @ case 2
	.2byte _0225C77E - _0225C61C - 2 @ case 3
	.2byte _0225C7A8 - _0225C61C - 2 @ case 4
	.2byte _0225C7E0 - _0225C61C - 2 @ case 5
	.2byte _0225C7F6 - _0225C61C - 2 @ case 6
	.2byte _0225C80A - _0225C61C - 2 @ case 7
	.2byte _0225C88C - _0225C61C - 2 @ case 8
	.2byte _0225C8CE - _0225C61C - 2 @ case 9
	.2byte _0225C8E6 - _0225C61C - 2 @ case 10
	.2byte _0225C8FA - _0225C61C - 2 @ case 11
	.2byte _0225C922 - _0225C61C - 2 @ case 12
	.2byte _0225C94C - _0225C61C - 2 @ case 13
	.2byte _0225C99C - _0225C61C - 2 @ case 14
	.2byte _0225C9BE - _0225C61C - 2 @ case 15
_0225C63C:
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x6a
	bl FUN_02258914
	str r0, [r4]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C650:
	ldr r0, [r4]
	bl FUN_022589BC
	cmp r0, #1
	bne _0225C67E
	ldr r0, [r4]
	bl FUN_022589CC
	str r0, [r4, #0x70]
	ldr r0, [r4]
	bl FUN_02258938
	movs r0, #0
	str r0, [r4]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C674:
	ldr r0, _0225C940 @ =0x021D110C
	ldr r1, [r0, #0x44]
	movs r0, #1
	tst r0, r1
	beq _0225C680
_0225C67E:
	b _0225C9E6
_0225C680:
	ldr r0, _0225C944 @ =ov91_0225CB58
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r2, #0
	str r2, [r4, #0x38]
	str r2, [r4, #0x3c]
	adds r0, r4, #0
	adds r1, r4, #0
	str r2, [r4, #0x40]
	adds r0, #0x84
	strb r2, [r0]
	adds r1, #0x84
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r0, #0x20
	movs r1, #0x6a
	bl FUN_0202055C
	adds r0, r4, #0
	bl ov91_02261B2C
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x80
	str r1, [r0]
	bl FUN_020347A0
	str r0, [r4, #0x74]
	cmp r0, #1
	bhi _0225C6C8
	bl FUN_0202551C
_0225C6C8:
	bl FUN_0203769C
	adds r1, r4, #0
	adds r1, #0x44
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x44
	adds r0, r4, #0
	ldrh r1, [r1]
	adds r0, #8
	bl FUN_0225886C
	adds r1, r4, #0
	adds r1, #0x46
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0225C706
	movs r1, #0x4b
	adds r3, r4, #0
	ldr r2, [r4, #0x74]
	movs r0, #0x6a
	lsls r1, r1, #4
	adds r3, #0x48
	bl ov91_0225CCC4
	str r0, [r4, #0x30]
	movs r0, #1
	str r0, [r4, #0x7c]
_0225C706:
	adds r0, r4, #0
	adds r0, #0x48
	str r0, [sp]
	adds r3, r4, #0
	adds r3, #0x46
	movs r1, #0x4b
	ldrh r3, [r3]
	ldr r2, [r4, #0x74]
	movs r0, #0x6a
	lsls r1, r1, #4
	bl ov91_0225CDF4
	str r0, [r4, #0x34]
	bl FUN_0203A880
	adds r6, #0x38
	ldrb r0, [r6]
	cmp r0, #0
	beq _0225C732
	movs r0, #0x6a
	bl FUN_021E69A8
_0225C732:
	ldr r0, [r4, #0x70]
	cmp r0, #0
	beq _0225C742
	cmp r0, #1
	beq _0225C74C
	cmp r0, #2
	beq _0225C758
	b _0225C764
_0225C742:
	movs r1, #0
	add r0, sp, #0xc
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	b _0225C768
_0225C74C:
	movs r1, #0
	add r0, sp, #0xc
	strb r1, [r0, #8]
	movs r1, #1
	strb r1, [r0, #9]
	b _0225C768
_0225C758:
	movs r1, #1
	add r0, sp, #0xc
	strb r1, [r0, #8]
	movs r1, #0
	strb r1, [r0, #9]
	b _0225C768
_0225C764:
	bl FUN_0202551C
_0225C768:
	ldr r0, [r4, #0x34]
	add r1, sp, #0x14
	bl ov91_0225D3C4
	movs r0, #1
	bl FUN_02037AC0
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C77E:
	movs r0, #1
	bl FUN_02037B38
	cmp r0, #0
	beq _0225C7CE
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x6a
	movs r1, #0x1b
	str r0, [sp, #8]
	ldr r3, _0225C948 @ =0x0000FFFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C7A8:
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov91_0225CEB4
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225C7CE
	adds r4, #0x44
	ldrh r0, [r4]
	cmp r0, #0
	bne _0225C7D8
	movs r1, #0
	movs r0, #0x16
	adds r2, r1, #0
	bl FUN_02037030
	cmp r0, #0
	bne _0225C7D0
_0225C7CE:
	b _0225C9E6
_0225C7D0:
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C7D8:
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C7E0:
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov91_0225CEB4
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0225C8DC
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C7F6:
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov91_0225CEB4
	cmp r0, #0
	bne _0225C8DC
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C80A:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _0225C82E
	ldr r0, [r4, #0x34]
	bl ov91_0225D37C
	str r0, [sp, #0x10]
	movs r0, #0x19
	add r1, sp, #0x10
	movs r2, #4
	bl FUN_02037030
	cmp r0, #0
	beq _0225C8DC
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C82E:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0225C878
	ldr r0, [r4, #0x30]
	bl ov91_0225CCF4
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	bl ov91_0225CD5C
	cmp r0, #0
	beq _0225C868
	ldr r0, [r4, #0x30]
	bl ov91_0225CD6C
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x1b
	add r2, sp, #0xc
	movs r3, #4
	bl ov91_0225CCA8
	cmp r0, #1
	bne _0225C868
	ldr r0, [r4, #0x30]
	bl ov91_0225CD64
_0225C868:
	cmp r5, #0
	bne _0225C878
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0x17
	adds r3, r2, #0
	bl ov91_0225CCA8
_0225C878:
	ldr r0, [r4, #0x34]
	bl ov91_0225D1DC
	adds r0, r4, #0
	bl ov91_0225CB64
	adds r0, r4, #0
	bl ov91_0225CB98
	b _0225C9E6
_0225C88C:
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov91_0225D078
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0225C8C6
	ldr r0, [r4, #0x30]
	bl ov91_0225CDAC
	cmp r0, #1
	bne _0225C8DC
	ldr r0, [r4, #0x30]
	add r1, sp, #0x18
	bl ov91_0225CDC4
	movs r0, #0x1a
	add r1, sp, #0x18
	movs r2, #0x10
	bl FUN_02037030
	cmp r0, #0
	beq _0225C8DC
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C8C6:
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C8CE:
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov91_0225D078
	ldr r0, [r4, #0x40]
	cmp r0, #1
	beq _0225C8DE
_0225C8DC:
	b _0225C9E6
_0225C8DE:
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C8E6:
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov91_0225D078
	cmp r0, #0
	bne _0225C9E6
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C8FA:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x6a
	movs r1, #0x1a
	str r0, [sp, #8]
	ldr r3, _0225C948 @ =0x0000FFFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov91_0225D078
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C922:
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov91_0225D078
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225C9E6
	movs r0, #3
	bl FUN_02037AC0
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
	.align 2, 0
_0225C940: .4byte 0x021D110C
_0225C944: .4byte ov91_0225CB58
_0225C948: .4byte 0x0000FFFF
_0225C94C:
	movs r0, #3
	bl FUN_02037B38
	cmp r0, #0
	bne _0225C95C
	add sp, #0x28
	movs r0, #0
	pop {r4, r5, r6, pc}
_0225C95C:
	adds r6, #0x38
	ldrb r0, [r6]
	cmp r0, #0
	beq _0225C968
	bl FUN_021E6A4C
_0225C968:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0225C97C
	ldr r0, [r4, #0x30]
	bl ov91_0225CCEC
	movs r0, #0
	str r0, [r4, #0x30]
_0225C97C:
	ldr r0, [r4, #0x34]
	bl ov91_0225CE80
	movs r0, #0
	str r0, [r4, #0x34]
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_020205AC
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C99C:
	ldrb r1, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_02258AA8
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #8
	adds r1, #0x18
	movs r2, #0x6a
	bl FUN_022589E0
	str r0, [r4, #4]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C9BE:
	ldr r0, [r4, #4]
	bl FUN_02258AA0
	cmp r0, #1
	bne _0225C9E6
	ldr r0, [r4, #4]
	bl FUN_02258AA4
	adds r6, r0, #0
	ldr r0, [r4, #4]
	bl FUN_02258A04
	movs r0, #0
	str r0, [r4, #4]
	cmp r6, #0
	bne _0225C9E4
	add sp, #0x28
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225C9E4:
	str r0, [r5]
_0225C9E6:
	movs r0, #0
	add sp, #0x28
	pop {r4, r5, r6, pc}
	thumb_func_end ov91_0225C58C

	thumb_func_start ov91_0225C9EC
ov91_0225C9EC: @ 0x0225C9EC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02007290
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_020072A4
	ldr r0, [r4]
	cmp r0, #0
	beq _0225CA0A
	cmp r0, #1
	beq _0225CA44
	b _0225CA60
_0225CA0A:
	adds r0, r6, #0
	adds r0, #8
	bl FUN_02258B54
	adds r7, r0, #0
	adds r0, r6, #0
	bl ov91_0225CC38
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x6a
	bl FUN_0201A9C4
	movs r0, #0
	movs r1, #1
	bl FUN_020398D4
	cmp r7, #1
	bne _0225CA36
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225CA36:
	movs r0, #4
	bl FUN_02037AC0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225CA60
_0225CA44:
	movs r0, #4
	bl FUN_02037B38
	cmp r0, #0
	bne _0225CA5C
	bl FUN_02037454
	adds r4, r0, #0
	bl FUN_020347A0
	cmp r4, r0
	bge _0225CA60
_0225CA5C:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225CA60:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225C9EC

	thumb_func_start ov91_0225CA64
ov91_0225CA64: @ 0x0225CA64
	movs r1, #1
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225CA64

	thumb_func_start ov91_0225CA6C
ov91_0225CA6C: @ 0x0225CA6C
	movs r1, #1
	str r1, [r0, #0x3c]
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225CA6C

	thumb_func_start ov91_0225CA74
ov91_0225CA74: @ 0x0225CA74
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #8
	adds r1, r2, #0
	bl FUN_0225886C
	adds r2, r0, #0
	ldr r0, [r5, #0x30]
	adds r1, r4, #0
	bl ov91_0225CD74
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov91_0225CA74

	thumb_func_start ov91_0225CA90
ov91_0225CA90: @ 0x0225CA90
	ldr r3, _0225CA98 @ =ov91_0225D2EC
	ldr r0, [r0, #0x34]
	bx r3
	nop
_0225CA98: .4byte ov91_0225D2EC
	thumb_func_end ov91_0225CA90

	thumb_func_start ov91_0225CA9C
ov91_0225CA9C: @ 0x0225CA9C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #8
	adds r1, r2, #0
	bl FUN_0225886C
	adds r2, r0, #0
	ldr r0, [r5, #0x30]
	cmp r0, #0
	beq _0225CAB8
	adds r1, r4, #0
	bl ov91_0225CD84
_0225CAB8:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov91_0225CA9C

	thumb_func_start ov91_0225CABC
ov91_0225CABC: @ 0x0225CABC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r4, r1, #0
	bl ov91_0225D368
	movs r0, #1
	str r0, [r5, #0x40]
	movs r1, #0
_0225CACE:
	ldr r0, [r4]
	adds r1, r1, #1
	str r0, [r5, #0x18]
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r1, #4
	blt _0225CACE
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov91_0225CABC

	thumb_func_start ov91_0225CAE0
ov91_0225CAE0: @ 0x0225CAE0
	ldr r3, _0225CAE8 @ =ov91_0225D380
	ldr r0, [r0, #0x34]
	bx r3
	nop
_0225CAE8: .4byte ov91_0225D380
	thumb_func_end ov91_0225CAE0

	thumb_func_start ov91_0225CAEC
ov91_0225CAEC: @ 0x0225CAEC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, #8
	adds r1, r2, #0
	bl FUN_0225886C
	adds r4, r0, #0
	ldr r0, [r5, #0x34]
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov91_0225D3B4
	adds r1, r5, #0
	adds r1, #0x84
	ldrb r0, [r1, r4]
	adds r0, r0, #1
	strb r0, [r1, r4]
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0225CB4E
	ldr r3, [r5, #0x74]
	movs r1, #1
	movs r0, #0
	cmp r3, #0
	bls _0225CB3A
	ldr r2, [r5, #0x7c]
	adds r6, r0, #0
_0225CB28:
	adds r4, r5, r0
	adds r4, #0x84
	ldrb r4, [r4]
	cmp r2, r4
	bls _0225CB34
	adds r1, r6, #0
_0225CB34:
	adds r0, r0, #1
	cmp r0, r3
	blo _0225CB28
_0225CB3A:
	cmp r1, #1
	bne _0225CB4E
	ldr r0, [r5, #0x7c]
	movs r1, #0
	adds r0, r0, #1
	str r0, [r5, #0x7c]
	movs r0, #0x1d
	adds r2, r1, #0
	bl FUN_02037030
_0225CB4E:
	pop {r4, r5, r6, pc}
	thumb_func_end ov91_0225CAEC

	thumb_func_start ov91_0225CB50
ov91_0225CB50: @ 0x0225CB50
	movs r1, #1
	adds r0, #0x80
	str r1, [r0]
	bx lr
	thumb_func_end ov91_0225CB50

	thumb_func_start ov91_0225CB58
ov91_0225CB58: @ 0x0225CB58
	ldr r3, _0225CB60 @ =ov91_0225D2D0
	ldr r0, [r0, #0x34]
	bx r3
	nop
_0225CB60: .4byte ov91_0225D2D0
	thumb_func_end ov91_0225CB58

	thumb_func_start ov91_0225CB64
ov91_0225CB64: @ 0x0225CB64
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	add r1, sp, #0
	bl ov91_0225D32C
	cmp r0, #1
	bne _0225CB94
	movs r6, #0x18
	add r4, sp, #0
	movs r7, #0x14
_0225CB7C:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl ov91_0225CCA8
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	bl ov91_0225D32C
	cmp r0, #1
	beq _0225CB7C
_0225CB94:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225CB64

	thumb_func_start ov91_0225CB98
ov91_0225CB98: @ 0x0225CB98
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl ov91_0225D2E8
	cmp r0, #0
	beq _0225CBDE
	movs r1, #0x1e
	blx FUN_020F2998
	cmp r1, #0
	bne _0225CBDE
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #1
	bne _0225CBDE
	ldr r0, [r4, #0x34]
	bl ov91_0225D37C
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x1c
	add r2, sp, #0
	movs r3, #4
	bl ov91_0225CCA8
	cmp r0, #0
	bne _0225CBD8
	bl FUN_0202551C
_0225CBD8:
	movs r0, #0
	adds r4, #0x80
	str r0, [r4]
_0225CBDE:
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov91_0225CB98

	thumb_func_start ov91_0225CBE4
ov91_0225CBE4: @ 0x0225CBE4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r3, r1, #0
	movs r1, #0
	adds r7, r0, #0
	str r1, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	movs r0, #0xd4
	adds r2, r1, #0
	bl FUN_02007AC4
	str r0, [r7, #0x4c]
	ldr r0, [sp, #8]
	movs r1, #0x18
	blx FUN_020F2BA4
	str r0, [r7, #0x48]
	ldrb r0, [r7, #0x10]
	movs r4, #0
	cmp r0, #0
	ble _0225CC34
	adds r6, r7, #0
	adds r5, r7, #0
	adds r6, #8
_0225CC16:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_022588CC
	str r0, [r5, #0x50]
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_022588A4
	str r0, [r5, #0x60]
	ldrb r0, [r7, #0x10]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r0
	blt _0225CC16
_0225CC34:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225CBE4

	thumb_func_start ov91_0225CC38
ov91_0225CC38: @ 0x0225CC38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x4c]
	str r0, [r4, #0x48]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov91_0225CC38

	thumb_func_start ov91_0225CC4C
ov91_0225CC4C: @ 0x0225CC4C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	adds r4, r1, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	ldr r0, [r5]
	cmp r0, #0
	beq _0225CC6C
	bl FUN_02258938
	movs r0, #0
	str r0, [r5]
_0225CC6C:
	ldr r0, [r5, #0x34]
	cmp r0, #0
	beq _0225CC8C
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0225CC82
	ldr r0, [r5, #0x30]
	bl ov91_0225CCEC
_0225CC82:
	ldr r0, [r5, #0x34]
	bl ov91_0225CE80
	bl FUN_020205AC
_0225CC8C:
	adds r4, #0x38
	ldrb r0, [r4]
	cmp r0, #0
	beq _0225CC98
	bl FUN_021E6A4C
_0225CC98:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0225CCA6
	bl FUN_02258A04
	movs r0, #0
	str r0, [r5, #4]
_0225CCA6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov91_0225CC4C

	thumb_func_start ov91_0225CCA8
ov91_0225CCA8: @ 0x0225CCA8
	push {r3, lr}
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	bne _0225CCB6
	movs r0, #0
	pop {r3, pc}
_0225CCB6:
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	bl FUN_02037030
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov91_0225CCA8

	thumb_func_start ov91_0225CCC4
ov91_0225CCC4: @ 0x0225CCC4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	movs r1, #0x38
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x38
	blx FUN_020E5B44
	str r5, [r4]
	str r6, [r4, #8]
	str r7, [r4, #0x30]
	movs r0, #1
	str r0, [r4, #4]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov91_0225CCC4

	thumb_func_start ov91_0225CCEC
ov91_0225CCEC: @ 0x0225CCEC
	ldr r3, _0225CCF0 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_0225CCF0: .4byte FUN_0201AB0C
	thumb_func_end ov91_0225CCEC

	thumb_func_start ov91_0225CCF4
ov91_0225CCF4: @ 0x0225CCF4
	push {r4, r5, r6, r7}
	ldr r2, [r0]
	cmp r2, #0
	ble _0225CD06
	ldr r1, [r0, #4]
	cmp r1, #1
	bne _0225CD06
	subs r1, r2, #1
	str r1, [r0]
_0225CD06:
	ldr r1, [r0]
	cmp r1, #0
	bgt _0225CD12
	movs r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_0225CD12:
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r4, [r1]
	ldr r5, [r0, #0x30]
	ldr r2, [r5]
	adds r1, r4, #0
	adds r3, r4, #0
	cmp r4, r2
	bhs _0225CD3E
	ldr r6, [r5, #4]
	movs r5, #0x18
	muls r5, r4, r5
	ldrh r7, [r0, #0x34]
	adds r6, r6, r5
_0225CD2E:
	ldr r5, [r6]
	cmp r5, r7
	bge _0225CD3E
	adds r1, r1, #1
	adds r6, #0x18
	adds r3, r1, #0
	cmp r1, r2
	blo _0225CD2E
_0225CD3E:
	cmp r3, r2
	bne _0225CD44
	subs r1, r1, #1
_0225CD44:
	cmp r1, r4
	beq _0225CD54
	adds r2, r0, #0
	adds r2, #0x36
	strb r1, [r2]
	movs r1, #1
	adds r0, #0x37
	strb r1, [r0]
_0225CD54:
	movs r0, #1
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225CCF4

	thumb_func_start ov91_0225CD5C
ov91_0225CD5C: @ 0x0225CD5C
	adds r0, #0x37
	ldrb r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225CD5C

	thumb_func_start ov91_0225CD64
ov91_0225CD64: @ 0x0225CD64
	movs r1, #0
	adds r0, #0x37
	strb r1, [r0]
	bx lr
	thumb_func_end ov91_0225CD64

	thumb_func_start ov91_0225CD6C
ov91_0225CD6C: @ 0x0225CD6C
	adds r0, #0x36
	ldrb r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225CD6C

	thumb_func_start ov91_0225CD74
ov91_0225CD74: @ 0x0225CD74
	ldrh r1, [r1, #2]
	cmp r1, #0
	beq _0225CD80
	ldrh r1, [r0, #0x34]
	adds r1, r1, #1
	strh r1, [r0, #0x34]
_0225CD80:
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225CD74

	thumb_func_start ov91_0225CD84
ov91_0225CD84: @ 0x0225CD84
	push {r3, r4}
	ldr r3, _0225CDA8 @ =0x0001869F
	cmp r1, r3
	bls _0225CD8E
	adds r1, r3, #0
_0225CD8E:
	movs r3, #1
	lsls r3, r2
	ldr r4, [r0, #0x1c]
	tst r4, r3
	bne _0225CDA4
	lsls r2, r2, #2
	adds r2, r0, r2
	str r1, [r2, #0xc]
	ldr r1, [r0, #0x1c]
	orrs r1, r3
	str r1, [r0, #0x1c]
_0225CDA4:
	pop {r3, r4}
	bx lr
	.align 2, 0
_0225CDA8: .4byte 0x0001869F
	thumb_func_end ov91_0225CD84

	thumb_func_start ov91_0225CDAC
ov91_0225CDAC: @ 0x0225CDAC
	push {r4, lr}
	adds r4, r0, #0
	bl ov91_0225CDD4
	ldr r1, [r4, #8]
	cmp r0, r1
	blo _0225CDBE
	movs r0, #1
	pop {r4, pc}
_0225CDBE:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov91_0225CDAC

	thumb_func_start ov91_0225CDC4
ov91_0225CDC4: @ 0x0225CDC4
	adds r2, r0, #0
	adds r3, r1, #0
	adds r2, #0xc
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	bx lr
	thumb_func_end ov91_0225CDC4

	thumb_func_start ov91_0225CDD4
ov91_0225CDD4: @ 0x0225CDD4
	push {r3, r4}
	movs r3, #0
	ldr r4, [r0, #0x1c]
	adds r2, r3, #0
	movs r0, #1
_0225CDDE:
	adds r1, r0, #0
	lsls r1, r2
	tst r1, r4
	beq _0225CDE8
	adds r3, r3, #1
_0225CDE8:
	adds r2, r2, #1
	cmp r2, #4
	blt _0225CDDE
	adds r0, r3, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov91_0225CDD4

	thumb_func_start ov91_0225CDF4
ov91_0225CDF4: @ 0x0225CDF4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r1, _0225CE64 @ =0x000087E8
	adds r5, r0, #0
	adds r7, r2, #0
	str r3, [sp]
	bl FUN_0201AA8C
	ldr r2, _0225CE64 @ =0x000087E8
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #1
	str r0, [r4, #4]
	movs r0, #0
	str r0, [r4, #8]
	str r6, [r4, #0xc]
	ldr r0, [sp]
	str r7, [r4, #0x10]
	str r0, [r4, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, _0225CE68 @ =0x0000877C
	str r1, [r4, r0]
	ldr r1, _0225CE6C @ =0x000019CC
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov91_0225DC3C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov91_0225F508
	ldr r0, _0225CE70 @ =0x0000878C
	ldr r1, _0225CE74 @ =0x00001AB4
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r5, #0
	bl ov91_0225F0C0
	ldr r0, _0225CE78 @ =0x000087CC
	adds r0, r4, r0
	bl ov91_0225F388
	ldr r0, _0225CE7C @ =0x022627C0
	movs r1, #8
	movs r2, #4
	bl FUN_020210D8
	cmp r0, #1
	beq _0225CE5E
	bl FUN_0202551C
_0225CE5E:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225CE64: .4byte 0x000087E8
_0225CE68: .4byte 0x0000877C
_0225CE6C: .4byte 0x000019CC
_0225CE70: .4byte 0x0000878C
_0225CE74: .4byte 0x00001AB4
_0225CE78: .4byte 0x000087CC
_0225CE7C: .4byte 0x022627C0
	thumb_func_end ov91_0225CDF4

	thumb_func_start ov91_0225CE80
ov91_0225CE80: @ 0x0225CE80
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02021238
	cmp r0, #1
	beq _0225CE90
	bl FUN_0202551C
_0225CE90:
	ldr r0, _0225CEAC @ =0x0000878C
	ldr r1, _0225CEB0 @ =0x00001AB4
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_0225F1E8
	adds r0, r4, #0
	bl ov91_0225F66C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	nop
_0225CEAC: .4byte 0x0000878C
_0225CEB0: .4byte 0x00001AB4
	thumb_func_end ov91_0225CE80

	thumb_func_start ov91_0225CEB4
ov91_0225CEB4: @ 0x0225CEB4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0225D054 @ =0x00001F38
	adds r6, r1, #0
	ldr r0, [r4, r0]
	movs r5, #1
	cmp r0, #4
	blo _0225CEE6
	ldr r0, _0225D058 @ =0x00008785
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0225CED2
	adds r1, r5, #0
	subs r1, #0x79
	b _0225CED4
_0225CED2:
	movs r1, #0x78
_0225CED4:
	ldr r2, _0225D05C @ =0x000019CC
	adds r0, r4, r2
	adds r2, r2, #2
	ldrh r2, [r4, r2]
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ov91_0225DD50
_0225CEE6:
	ldr r1, _0225D060 @ =0x00001AB4
	adds r0, r4, r1
	subs r1, #0xe8
	adds r1, r4, r1
	bl ov91_0225DBC0
	ldr r0, _0225D064 @ =0x00001F74
	ldr r1, _0225D05C @ =0x000019CC
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_022601F4
	ldr r0, _0225D064 @ =0x00001F74
	ldr r1, _0225D05C @ =0x000019CC
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_02260218
	ldr r0, _0225D054 @ =0x00001F38
	ldr r1, [r4, r0]
	cmp r1, #8
	bls _0225CF14
	b _0225D036
_0225CF14:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225CF20: @ jump table
	.2byte _0225CF32 - _0225CF20 - 2 @ case 0
	.2byte _0225CF44 - _0225CF20 - 2 @ case 1
	.2byte _0225CF62 - _0225CF20 - 2 @ case 2
	.2byte _0225CF7C - _0225CF20 - 2 @ case 3
	.2byte _0225CFD2 - _0225CF20 - 2 @ case 4
	.2byte _0225CFDC - _0225CF20 - 2 @ case 5
	.2byte _0225CFF4 - _0225CF20 - 2 @ case 6
	.2byte _0225D00A - _0225CF20 - 2 @ case 7
	.2byte _0225D020 - _0225CF20 - 2 @ case 8
_0225CF32:
	ldr r0, _0225D068 @ =0x0000878C
	adds r0, r4, r0
	bl ov91_0225F23C
	ldr r0, _0225D054 @ =0x00001F38
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0225D036
_0225CF44:
	ldr r0, _0225D068 @ =0x0000878C
	adds r1, r4, #0
	adds r0, r4, r0
	bl ov91_0225F25C
	cmp r0, #1
	bne _0225D036
	ldr r0, _0225D054 @ =0x00001F38
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	movs r0, #2
	bl FUN_02037AC0
	b _0225D036
_0225CF62:
	movs r0, #2
	bl FUN_02037B38
	cmp r0, #0
	beq _0225D036
	ldr r0, _0225D054 @ =0x00001F38
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	movs r1, #0x41
	adds r0, #8
	str r1, [r4, r0]
	b _0225D036
_0225CF7C:
	adds r1, r0, #0
	adds r1, #8
	ldr r1, [r4, r1]
	subs r2, r1, #1
	adds r1, r0, #0
	adds r1, #8
	str r2, [r4, r1]
	adds r0, #8
	ldr r0, [r4, r0]
	cmp r0, #0x32
	bne _0225CF98
	ldr r0, _0225D06C @ =0x00000619
	bl FUN_0200604C
_0225CF98:
	movs r0, #0x7d
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0x14
	bne _0225CFA8
	ldr r0, _0225D070 @ =0x0000063D
	bl FUN_0200604C
_0225CFA8:
	ldr r0, _0225D064 @ =0x00001F74
	movs r1, #1
	adds r0, r4, r0
	lsls r1, r1, #0xc
	bl ov91_0226031C
	movs r0, #0x7d
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _0225D036
	ldr r1, _0225D060 @ =0x00001AB4
	subs r0, #8
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_0225DB7C
	ldr r0, _0225D054 @ =0x00001F38
	movs r1, #4
	str r1, [r4, r0]
	b _0225D036
_0225CFD2:
	cmp r6, #1
	bne _0225D036
	movs r1, #5
	str r1, [r4, r0]
	b _0225D036
_0225CFDC:
	ldr r1, _0225D060 @ =0x00001AB4
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_0225DB18
	ldr r0, _0225D074 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, _0225D054 @ =0x00001F38
	movs r1, #6
	str r1, [r4, r0]
	b _0225D036
_0225CFF4:
	ldr r1, _0225D060 @ =0x00001AB4
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_0225DB44
	cmp r0, #0
	bne _0225D036
	ldr r0, _0225D054 @ =0x00001F38
	movs r1, #7
	str r1, [r4, r0]
	b _0225D036
_0225D00A:
	ldr r1, _0225D060 @ =0x00001AB4
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_0225DBAC
	cmp r0, #0
	bne _0225D036
	ldr r0, _0225D054 @ =0x00001F38
	movs r1, #8
	str r1, [r4, r0]
	b _0225D036
_0225D020:
	ldr r1, _0225D060 @ =0x00001AB4
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_0225DB5C
	ldr r0, _0225D05C @ =0x000019CC
	movs r1, #1
	adds r0, r4, r0
	bl ov91_0225DD20
	movs r5, #0
_0225D036:
	ldr r0, _0225D064 @ =0x00001F74
	ldr r1, _0225D05C @ =0x000019CC
	ldr r2, [r4]
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_022601AC
	ldr r1, _0225D060 @ =0x00001AB4
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov91_0225F7A8
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	nop
_0225D054: .4byte 0x00001F38
_0225D058: .4byte 0x00008785
_0225D05C: .4byte 0x000019CC
_0225D060: .4byte 0x00001AB4
_0225D064: .4byte 0x00001F74
_0225D068: .4byte 0x0000878C
_0225D06C: .4byte 0x00000619
_0225D070: .4byte 0x0000063D
_0225D074: .4byte 0x000005DD
	thumb_func_end ov91_0225CEB4

	thumb_func_start ov91_0225D078
ov91_0225D078: @ 0x0225D078
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldr r1, _0225D1B8 @ =0x00001F54
	adds r4, r0, #0
	ldr r2, [r4, r1]
	movs r6, #1
	cmp r2, #3
	bhi _0225D158
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0225D094: @ jump table
	.2byte _0225D09C - _0225D094 - 2 @ case 0
	.2byte _0225D0E2 - _0225D094 - 2 @ case 1
	.2byte _0225D13E - _0225D094 - 2 @ case 2
	.2byte _0225D156 - _0225D094 - 2 @ case 3
_0225D09C:
	bl ov91_0225E6B0
	adds r0, r4, #0
	bl ov91_0225EE9C
	movs r0, #2
	str r0, [sp]
	movs r0, #0x18
	adds r1, r0, #0
	subs r1, #0x26
	movs r2, #0
	movs r3, #0x3f
	bl FUN_0200B484
	ldr r0, _0225D1BC @ =0x00001AB4
	adds r0, r4, r0
	bl ov91_0225DBE4
	ldr r0, _0225D1C0 @ =0x000021A4
	ldr r0, [r4, r0]
	bl FUN_02258CB0
	ldr r0, _0225D1C4 @ =0x000087E4
	adds r0, r4, r0
	bl ov91_02261B10
	ldr r0, _0225D1C8 @ =0x0000862C
	adds r0, r4, r0
	bl ov91_02261890
	ldr r0, _0225D1B8 @ =0x00001F54
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0225D158
_0225D0E2:
	ldr r0, _0225D1BC @ =0x00001AB4
	adds r5, r6, #0
	adds r0, r4, r0
	bl ov91_0225DBF4
	cmp r0, #0
	bne _0225D0F2
	movs r5, #0
_0225D0F2:
	adds r0, r4, #0
	bl ov91_0225E40C
	adds r0, r4, #0
	bl ov91_0225E648
	adds r0, r4, #0
	bl ov91_0225E6D0
	cmp r0, #1
	bne _0225D10A
	movs r5, #0
_0225D10A:
	ldr r0, _0225D1BC @ =0x00001AB4
	adds r0, r4, r0
	bl ov91_0225DC24
	cmp r0, #0
	bne _0225D118
	movs r5, #0
_0225D118:
	movs r0, #2
	bl FUN_0200B5C0
	cmp r0, #0
	bne _0225D124
	movs r5, #0
_0225D124:
	cmp r5, #1
	bne _0225D158
	cmp r7, #1
	bne _0225D158
	ldr r0, _0225D1CC @ =0x00001F58
	movs r1, #0
	str r1, [r4, r0]
	subs r1, r0, #4
	ldr r1, [r4, r1]
	subs r0, r0, #4
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0225D158
_0225D13E:
	adds r0, r1, #4
	ldr r0, [r4, r0]
	adds r2, r0, #1
	adds r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0x40
	blo _0225D158
	ldr r0, [r4, r1]
	adds r0, r0, #1
	str r0, [r4, r1]
	b _0225D158
_0225D156:
	movs r6, #0
_0225D158:
	ldr r0, _0225D1D0 @ =0x00008785
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0225D166
	movs r2, #0x77
	mvns r2, r2
	b _0225D168
_0225D166:
	movs r2, #0x78
_0225D168:
	ldr r1, _0225D1D4 @ =0x000019CC
	adds r0, r4, r1
	adds r1, r1, #2
	ldrh r1, [r4, r1]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ov91_0225DD50
	ldr r0, _0225D1D8 @ =0x00001F74
	ldr r1, _0225D1D4 @ =0x000019CC
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_022601C8
	ldr r0, _0225D1D8 @ =0x00001F74
	ldr r1, _0225D1D4 @ =0x000019CC
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_022601F4
	ldr r0, _0225D1D8 @ =0x00001F74
	ldr r1, _0225D1D4 @ =0x000019CC
	ldr r2, [r4]
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_022601AC
	ldr r1, _0225D1BC @ =0x00001AB4
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov91_0225F7A8
	ldr r0, _0225D1C8 @ =0x0000862C
	adds r0, r4, r0
	bl ov91_02261928
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D1B8: .4byte 0x00001F54
_0225D1BC: .4byte 0x00001AB4
_0225D1C0: .4byte 0x000021A4
_0225D1C4: .4byte 0x000087E4
_0225D1C8: .4byte 0x0000862C
_0225D1CC: .4byte 0x00001F58
_0225D1D0: .4byte 0x00008785
_0225D1D4: .4byte 0x000019CC
_0225D1D8: .4byte 0x00001F74
	thumb_func_end ov91_0225D078

	thumb_func_start ov91_0225D1DC
ov91_0225D1DC: @ 0x0225D1DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	cmp r2, #2
	bhs _0225D202
	ldr r0, _0225D2A8 @ =0x02261C44
	lsls r1, r2, #2
	ldr r1, [r0, r1]
	ldr r0, [r4, #8]
	cmp r1, r0
	bhi _0225D202
	adds r0, r2, #1
	str r0, [r4]
	cmp r0, #1
	bne _0225D202
	ldr r0, _0225D2AC @ =0x000087E4
	adds r0, r4, r0
	bl ov91_022619E8
_0225D202:
	ldr r0, _0225D2B0 @ =0x000086EC
	movs r1, #1
	adds r0, r4, r0
	movs r2, #0
	bl FUN_02021280
	adds r0, r4, #0
	bl ov91_0225EA7C
	ldr r0, _0225D2B4 @ =0x00008730
	adds r0, r4, r0
	bl ov91_0225EF70
	cmp r0, #0
	bne _0225D22A
	ldr r1, _0225D2B4 @ =0x00008730
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov91_0225F008
_0225D22A:
	ldr r0, _0225D2B8 @ =0x000087CC
	ldr r1, [r4, #0x10]
	adds r0, r4, r0
	bl ov91_0225F3E8
	cmp r0, #1
	bne _0225D258
	ldr r0, _0225D2B8 @ =0x000087CC
	adds r0, r4, r0
	bl ov91_0225F3E4
	adds r1, r0, #0
	ldr r0, _0225D2BC @ =0x0000FFFF
	cmp r1, r0
	beq _0225D250
	ldr r0, _0225D2C0 @ =0x00001F74
	adds r0, r4, r0
	bl ov91_02260370
_0225D250:
	ldr r0, _0225D2B8 @ =0x000087CC
	adds r0, r4, r0
	bl ov91_0225F3D4
_0225D258:
	adds r0, r4, #0
	bl ov91_0225E40C
	ldr r1, _0225D2C4 @ =0x000019CC
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov91_0225DCC4
	ldr r1, _0225D2C8 @ =0x00001AB4
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov91_0225F74C
	adds r0, r4, #0
	bl ov91_0225E62C
	ldr r0, _0225D2AC @ =0x000087E4
	ldr r1, _0225D2CC @ =0x00001C54
	ldr r2, _0225D2C0 @ =0x00001F74
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, r2
	bl ov91_02261A00
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _0225D294
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
_0225D294:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	cmp r0, r1
	blt _0225D2A2
	str r1, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_0225D2A2:
	movs r0, #0
	pop {r4, pc}
	nop
_0225D2A8: .4byte 0x02261C44
_0225D2AC: .4byte 0x000087E4
_0225D2B0: .4byte 0x000086EC
_0225D2B4: .4byte 0x00008730
_0225D2B8: .4byte 0x000087CC
_0225D2BC: .4byte 0x0000FFFF
_0225D2C0: .4byte 0x00001F74
_0225D2C4: .4byte 0x000019CC
_0225D2C8: .4byte 0x00001AB4
_0225D2CC: .4byte 0x00001C54
	thumb_func_end ov91_0225D1DC

	thumb_func_start ov91_0225D2D0
ov91_0225D2D0: @ 0x0225D2D0
	push {r3, lr}
	ldr r1, _0225D2E4 @ =0x00001AB4
	ldr r0, [r0, r1]
	bl FUN_0201EEB4
	bl FUN_0202061C
	bl FUN_0200B224
	pop {r3, pc}
	.align 2, 0
_0225D2E4: .4byte 0x00001AB4
	thumb_func_end ov91_0225D2D0

	thumb_func_start ov91_0225D2E8
ov91_0225D2E8: @ 0x0225D2E8
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov91_0225D2E8

	thumb_func_start ov91_0225D2EC
ov91_0225D2EC: @ 0x0225D2EC
	push {r3, r4, r5, lr}
	sub sp, #0x28
	adds r4, r1, #0
	adds r5, r0, #0
	ldrh r0, [r4]
	ldr r1, [r5, #0x14]
	cmp r1, r0
	beq _0225D324
	adds r0, r4, #0
	add r1, sp, #0
	bl ov91_0225E294
	adds r0, r5, #0
	add r1, sp, #0
	movs r2, #2
	bl ov91_0225E2E4
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0225D324
	movs r2, #0x12
	ldr r0, _0225D328 @ =0x00001E38
	ldrh r1, [r4]
	ldrsb r2, [r4, r2]
	ldr r3, [r5]
	adds r0, r5, r0
	bl ov91_0225D694
_0225D324:
	add sp, #0x28
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225D328: .4byte 0x00001E38
	thumb_func_end ov91_0225D2EC

	thumb_func_start ov91_0225D32C
ov91_0225D32C: @ 0x0225D32C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r2, #0
	adds r3, r5, #0
_0225D334:
	adds r0, r3, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #4
	bne _0225D35A
	movs r0, #0x44
	adds r4, r2, #0
	muls r4, r0, r4
	adds r0, r5, #0
	adds r0, #0x50
	adds r0, r0, r4
	bl ov91_0225E23C
	adds r5, #0x4c
	adds r0, r5, r4
	bl ov91_0225E400
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225D35A:
	adds r2, r2, #1
	adds r3, #0x44
	cmp r2, #0x60
	blt _0225D334
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov91_0225D32C

	thumb_func_start ov91_0225D368
ov91_0225D368: @ 0x0225D368
	adds r3, r1, #0
	ldr r1, _0225D378 @ =0x000086DC
	adds r2, r0, r1
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	bx lr
	.align 2, 0
_0225D378: .4byte 0x000086DC
	thumb_func_end ov91_0225D368

	thumb_func_start ov91_0225D37C
ov91_0225D37C: @ 0x0225D37C
	ldr r0, [r0, #0x18]
	bx lr
	thumb_func_end ov91_0225D37C

	thumb_func_start ov91_0225D380
ov91_0225D380: @ 0x0225D380
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, _0225D3B0 @ =0x00008780
	adds r3, r0, #0
	ldrh r2, [r3, r4]
	adds r0, r4, #2
	strh r2, [r3, r0]
	strh r1, [r3, r4]
	ldrh r0, [r3, r4]
	adds r2, r4, #4
	subs r1, r4, #4
	str r0, [sp]
	adds r0, r4, #0
	subs r0, #0x50
	adds r4, r4, #2
	adds r0, r3, r0
	ldr r1, [r3, r1]
	adds r2, r3, r2
	ldrh r3, [r3, r4]
	bl ov91_0225EED0
	add sp, #4
	pop {r3, r4, pc}
	nop
_0225D3B0: .4byte 0x00008780
	thumb_func_end ov91_0225D380

	thumb_func_start ov91_0225D3B4
ov91_0225D3B4: @ 0x0225D3B4
	ldr r3, _0225D3BC @ =0x000087CC
	adds r0, r0, r3
	ldr r3, _0225D3C0 @ =ov91_0225F3A0
	bx r3
	.align 2, 0
_0225D3BC: .4byte 0x000087CC
_0225D3C0: .4byte ov91_0225F3A0
	thumb_func_end ov91_0225D3B4

	thumb_func_start ov91_0225D3C4
ov91_0225D3C4: @ 0x0225D3C4
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r1]
	ldr r2, _0225D404 @ =0x00008784
	strb r0, [r4, r2]
	ldrb r3, [r1, #1]
	adds r0, r2, #1
	strb r3, [r4, r0]
	ldrb r3, [r1, #2]
	adds r0, r2, #2
	strb r3, [r4, r0]
	ldrb r1, [r1, #3]
	adds r0, r2, #3
	strb r1, [r4, r0]
	movs r1, #1
	adds r0, r2, #4
	str r1, [r4, r0]
	adds r1, r2, #0
	adds r0, r2, #0
	subs r1, #8
	subs r0, #0x54
	ldr r1, [r4, r1]
	adds r0, r4, r0
	adds r2, r4, r2
	bl ov91_0225EEBC
	ldr r1, _0225D408 @ =0x00008730
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov91_0225F008
	pop {r4, pc}
	.align 2, 0
_0225D404: .4byte 0x00008784
_0225D408: .4byte 0x00008730
	thumb_func_end ov91_0225D3C4

	thumb_func_start ov91_0225D40C
ov91_0225D40C: @ 0x0225D40C
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x18]
	adds r5, r0, #0
	adds r7, r2, #0
	adds r0, r3, #0
	adds r6, r1, #0
	lsls r2, r4, #0xc
	str r3, [sp]
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	adds r2, r0, #0
	subs r0, r7, r6
	movs r7, #2
	movs r3, #0
	lsls r7, r7, #0xa
	adds r2, r2, r7
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r2, r2, #0xc
	orrs r2, r1
	subs r2, r0, r2
	asrs r1, r2, #0x1f
	lsrs r0, r2, #0x13
	lsls r1, r1, #0xd
	orrs r1, r0
	lsls r0, r2, #0xd
	adds r0, r0, r7
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	adds r1, r4, #0
	muls r1, r4, r1
	lsls r1, r1, #0xc
	blx FUN_020CCBA0
	str r6, [r5]
	ldr r1, [sp]
	str r6, [r5, #4]
	str r1, [r5, #8]
	str r0, [r5, #0xc]
	movs r0, #0
	str r0, [r5, #0x10]
	str r4, [r5, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov91_0225D40C

	thumb_func_start ov91_0225D46C
ov91_0225D46C: @ 0x0225D46C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x10]
	ldr r0, [r5, #8]
	lsls r2, r6, #0xc
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsrs r4, r2, #0xc
	lsls r0, r1, #0x14
	adds r2, r6, #0
	orrs r4, r0
	ldr r0, [r5, #0xc]
	muls r2, r6, r2
	lsls r2, r2, #0xc
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r0, r0, r2
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	lsls r1, r2, #2
	blx FUN_020CCBA0
	ldr r1, [r5, #4]
	adds r0, r4, r0
	adds r0, r1, r0
	str r0, [r5]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	adds r0, r0, #1
	cmp r0, r1
	bgt _0225D4CC
	str r0, [r5, #0x10]
	movs r0, #0
	pop {r4, r5, r6, pc}
_0225D4CC:
	str r1, [r5, #0x10]
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov91_0225D46C

	thumb_func_start ov91_0225D4D4
ov91_0225D4D4: @ 0x0225D4D4
	push {r3, r4}
	lsls r4, r0, #5
	lsls r0, r2, #3
	ldr r2, _0225D4F8 @ =0x02261F8C
	lsls r1, r1, #7
	adds r2, r2, r1
	adds r2, r4, r2
	ldr r2, [r0, r2]
	str r2, [r3]
	ldr r2, _0225D4FC @ =0x02261F90
	adds r1, r2, r1
	adds r1, r4, r1
	ldr r1, [r0, r1]
	ldr r0, [sp, #8]
	str r1, [r0]
	pop {r3, r4}
	bx lr
	nop
_0225D4F8: .4byte 0x02261F8C
_0225D4FC: .4byte 0x02261F90
	thumb_func_end ov91_0225D4D4

	thumb_func_start ov91_0225D500
ov91_0225D500: @ 0x0225D500
	push {r3, r4, r5, lr}
	sub sp, #0x28
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	adds r4, r3, #0
	add r3, sp, #0
	strh r0, [r3]
	movs r0, #0
	strh r0, [r3, #2]
	subs r3, r1, r4
	lsrs r1, r3, #0x1f
	adds r1, r3, r1
	asrs r1, r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #4
	str r1, [sp, #4]
	add r1, sp, #0x28
	ldrh r1, [r1, #0x10]
	subs r2, r2, r1
	lsrs r1, r2, #0x1f
	adds r1, r2, r1
	asrs r1, r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #4
	str r0, [sp, #8]
	add r0, sp, #4
	str r1, [sp, #0xc]
	blx FUN_020CCF80
	ldr r1, _0225D5F8 @ =0x0001E200
	cmp r0, r1
	ble _0225D582
	add r0, sp, #4
	adds r1, r0, #0
	blx FUN_020CCFE0
	ldr r0, [sp, #4]
	ldr r2, _0225D5F8 @ =0x0001E200
	asrs r1, r0, #0x1f
	movs r3, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	ldr r0, [sp, #0xc]
	str r1, [sp, #4]
	ldr r2, _0225D5F8 @ =0x0001E200
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [sp, #0xc]
_0225D582:
	movs r0, #0x26
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	add r0, sp, #4
	blx FUN_020CCF80
	ldr r2, _0225D5FC @ =0x0000099A
	asrs r1, r0, #0x1f
	movs r3, #0
	str r0, [sp, #0x10]
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	add r0, sp, #4
	str r1, [sp, #0x10]
	adds r1, r0, #0
	blx FUN_020CCFE0
	lsls r0, r4, #0x10
	add r2, sp, #0x28
	movs r1, #0x10
	ldrsh r1, [r2, r1]
	asrs r0, r0, #0x10
	add r2, sp, #0x14
	bl ov91_02260400
	movs r0, #0
	str r0, [sp, #0x18]
	add r2, sp, #0
	add r0, sp, #0x14
	ldrh r2, [r2]
	ldr r3, [r5, #0x10]
	adds r1, r0, #0
	bl ov91_0226045C
	add r2, sp, #0
	add r0, sp, #4
	ldrh r2, [r2]
	ldr r3, [r5, #0x10]
	adds r1, r0, #0
	bl ov91_0226045C
	movs r0, #0
	str r0, [sp, #0x24]
	ldr r2, [sp, #0x3c]
	adds r0, r5, #0
	add r1, sp, #0
	bl ov91_0225E2E4
	add sp, #0x28
	pop {r3, r4, r5, pc}
	nop
_0225D5F8: .4byte 0x0001E200
_0225D5FC: .4byte 0x0000099A
	thumb_func_end ov91_0225D500

	thumb_func_start ov91_0225D600
ov91_0225D600: @ 0x0225D600
	ldr r1, [r0, #0x1c]
	cmp r1, #3
	blt _0225D60A
	movs r1, #2
	b _0225D60E
_0225D60A:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
_0225D60E:
	lsls r2, r1, #2
	ldr r1, _0225D624 @ =0x02261C34
	ldr r0, [r0]
	ldr r1, [r1, r2]
	cmp r0, #2
	bne _0225D61E
	lsls r0, r1, #1
	adds r1, r1, r0
_0225D61E:
	adds r0, r1, #0
	bx lr
	nop
_0225D624: .4byte 0x02261C34
	thumb_func_end ov91_0225D600

	thumb_func_start ov91_0225D628
ov91_0225D628: @ 0x0225D628
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r0, [r6, #0x1c]
	ldr r7, [sp, #0x58]
	str r0, [sp, #0x14]
	movs r0, #0x56
	lsls r0, r0, #2
	adds r0, r6, r0
	str r0, [sp, #0x18]
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x28]
	str r0, [sp, #0x2c]
	str r0, [sp, #0x30]
	movs r4, #0
	add r0, sp, #0x14
	strh r4, [r0, #0x20]
	movs r0, #1
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	str r4, [sp, #0x38]
	str r0, [sp, #0x3c]
	str r7, [sp, #0x40]
_0225D65A:
	ldr r0, [sp, #0x10]
	str r4, [sp]
	str r0, [sp, #4]
	ldr r3, [sp, #0xc]
	adds r0, r5, #0
	add r1, sp, #0x14
	adds r2, r6, #0
	str r7, [sp, #8]
	bl ov91_0225D6B8
	adds r4, r4, #1
	adds r5, #0x40
	cmp r4, #4
	blt _0225D65A
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov91_0225D628

	thumb_func_start ov91_0225D67C
ov91_0225D67C: @ 0x0225D67C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0225D682:
	adds r0, r5, #0
	bl ov91_0225D750
	adds r4, r4, #1
	adds r5, #0x40
	cmp r4, #4
	blt _0225D682
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov91_0225D67C

	thumb_func_start ov91_0225D694
ov91_0225D694: @ 0x0225D694
	push {r4, lr}
	lsls r4, r1, #6
	adds r0, r0, r4
	bl ov91_0225D768
	pop {r4, pc}
	thumb_func_end ov91_0225D694

	thumb_func_start ov91_0225D6A0
ov91_0225D6A0: @ 0x0225D6A0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0225D6A6:
	adds r0, r5, #0
	bl ov91_0225D84C
	adds r4, r4, #1
	adds r5, #0x40
	cmp r4, #4
	blt _0225D6A6
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov91_0225D6A0

	thumb_func_start ov91_0225D6B8
ov91_0225D6B8: @ 0x0225D6B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	ldr r6, [sp, #4]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	adds r5, r1, #0
	str r3, [sp, #8]
	str r0, [sp, #0x2c]
	movs r7, #0
	adds r4, r6, #0
_0225D6D0:
	add r0, sp, #0xc
	str r0, [sp]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	add r3, sp, #0x10
	bl ov91_0225D4D4
	ldr r0, [sp, #0x10]
	adds r3, r5, #0
	lsls r0, r0, #0xc
	str r0, [r5, #8]
	ldr r0, [sp, #0xc]
	adds r2, r6, #0
	lsls r0, r0, #0xc
	adds r3, #8
	str r0, [r5, #0xc]
	ldm r3!, {r0, r1}
	adds r2, #0x18
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	adds r0, r5, #0
	bl FUN_02024624
	str r0, [r4]
	movs r1, #2
	bl FUN_020248F0
	ldr r0, [r4]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0202484C
	movs r1, #6
	ldr r0, [r4]
	lsls r1, r1, #0xa
	bl FUN_02024868
	movs r0, #0
	str r0, [r4, #0xc]
	adds r7, r7, #1
	adds r6, #0xc
	adds r4, r4, #4
	cmp r7, #3
	blt _0225D6D0
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	cmp r1, r0
	bne _0225D744
	ldr r0, [sp, #4]
	movs r1, #1
	str r1, [r0, #0x3c]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0225D744:
	ldr r0, [sp, #4]
	movs r1, #0
	str r1, [r0, #0x3c]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov91_0225D6B8

	thumb_func_start ov91_0225D750
ov91_0225D750: @ 0x0225D750
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0225D756:
	ldr r0, [r5]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _0225D756
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov91_0225D750

	thumb_func_start ov91_0225D768
ov91_0225D768: @ 0x0225D768
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	movs r4, #0
	str r0, [sp]
	adds r0, r4, #0
	subs r0, r0, #1
	ldr r5, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r4, [sp, #0x10]
	str r0, [sp, #0x14]
	adds r6, r4, #0
_0225D782:
	ldr r0, [r5]
	bl FUN_020248B8
	cmp r0, #0
	bne _0225D794
	movs r0, #1
	str r6, [sp, #0x14]
	str r0, [sp, #0x10]
	b _0225D7B4
_0225D794:
	ldr r0, [r5]
	bl FUN_02024AF8
	adds r7, r0, #0
	ldr r0, [r5]
	adds r1, r7, #1
	bl FUN_02024ADC
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0225D7B4
	adds r0, r7, #1
	cmp r4, r0
	bhi _0225D7B4
	adds r4, r0, #0
	str r6, [sp, #0x14]
_0225D7B4:
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #3
	blt _0225D782
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bge _0225D7C6
	bl FUN_0202551C
_0225D7C6:
	ldr r0, [sp, #8]
	cmp r0, #3
	blo _0225D7D0
	movs r0, #2
	str r0, [sp, #8]
_0225D7D0:
	ldr r0, [sp, #0xc]
	cmp r0, #2
	beq _0225D7F2
	ldr r0, [sp]
	ldr r0, [r0, #0x3c]
	cmp r0, #1
	bne _0225D7E6
	ldr r0, [sp, #8]
	adds r0, r0, #2
	str r0, [sp, #8]
	b _0225D7EC
_0225D7E6:
	ldr r0, [sp, #8]
	adds r0, #8
	str r0, [sp, #8]
_0225D7EC:
	ldr r0, [sp, #4]
	adds r4, r0, #3
	b _0225D80A
_0225D7F2:
	ldr r0, [sp]
	ldr r0, [r0, #0x3c]
	cmp r0, #1
	bne _0225D802
	ldr r0, [sp, #8]
	adds r0, r0, #5
	str r0, [sp, #8]
	b _0225D808
_0225D802:
	ldr r0, [sp, #8]
	adds r0, #0xb
	str r0, [sp, #8]
_0225D808:
	movs r4, #7
_0225D80A:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #8]
	lsls r5, r0, #2
	ldr r0, [sp]
	ldr r0, [r0, r5]
	bl FUN_020248F0
	ldr r0, [sp]
	movs r1, #0
	adds r0, r0, r5
	str r1, [r0, #0xc]
	ldr r0, [sp]
	movs r1, #1
	ldr r0, [r0, r5]
	bl FUN_02024830
	ldr r0, [sp]
	ldr r1, [sp, #0x14]
	bl ov91_0225D884
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0, r5]
	bl FUN_02024ADC
	ldr r0, [sp]
	adds r1, r4, #0
	ldr r0, [r0, r5]
	bl FUN_02024A14
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov91_0225D768

	thumb_func_start ov91_0225D84C
ov91_0225D84C: @ 0x0225D84C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_0225D854:
	ldr r0, [r5]
	bl FUN_020248B8
	cmp r0, #1
	bne _0225D87A
	ldr r0, [r5, #0xc]
	adds r0, r0, #1
	str r0, [r5, #0xc]
	cmp r0, #0x10
	bls _0225D872
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov91_0225D8E0
	b _0225D87A
_0225D872:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov91_0225D884
_0225D87A:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _0225D854
	pop {r4, r5, r6, pc}
	thumb_func_end ov91_0225D84C

	thumb_func_start ov91_0225D884
ov91_0225D884: @ 0x0225D884
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r1, #0
	adds r5, r0, #0
	lsls r4, r6, #2
	adds r0, r5, r4
	ldr r0, [r0, #0xc]
	ldr r2, _0225D8DC @ =0xFFFF0000
	lsls r0, r0, #0xc
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x10
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r0, r0, r2
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	lsls r1, r2, #5
	blx FUN_020CCBA0
	adds r2, r0, #0
	movs r0, #0xc
	muls r0, r6, r0
	adds r6, r5, r0
	adds r6, #0x18
	add r3, sp, #0
	ldm r6!, {r0, r1}
	adds r7, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r6]
	adds r1, r7, #0
	str r0, [r3]
	ldr r0, [sp, #4]
	adds r0, r0, r2
	str r0, [sp, #4]
	ldr r0, [r5, r4]
	bl FUN_020247D4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225D8DC: .4byte 0xFFFF0000
	thumb_func_end ov91_0225D884

	thumb_func_start ov91_0225D8E0
ov91_0225D8E0: @ 0x0225D8E0
	ldr r3, _0225D8EC @ =FUN_02024830
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0
	bx r3
	nop
_0225D8EC: .4byte FUN_02024830
	thumb_func_end ov91_0225D8E0

	thumb_func_start ov91_0225D8F0
ov91_0225D8F0: @ 0x0225D8F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x58]
	adds r5, r2, #0
	str r1, [sp, #0x18]
	str r0, [sp, #0x58]
	ldr r4, [sp, #0x60]
	ldr r2, [sp, #0x14]
	str r3, [sp, #0x1c]
	movs r1, #0x1c
	movs r0, #0
_0225D908:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0225D908
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1c
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #0xa
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	ldr r0, [r0]
	adds r1, #0xc
	movs r2, #1
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0xe0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	movs r2, #0
	adds r0, #0xc
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	movs r0, #0x80
	adds r1, r4, #0
	bl FUN_02026354
	adds r6, r0, #0
	ldr r0, [sp, #0x18]
	movs r1, #0
	ldr r0, [r0, #8]
	adds r2, r6, #0
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DAF8 @ =0x0001020F
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	adds r3, r1, #0
	adds r0, #0xc
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [sp, #0x18]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x5c]
	ldr r2, [r2]
	movs r1, #0x12
	movs r3, #2
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x18]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x5c]
	ldr r2, [r2]
	adds r1, #0x12
	movs r3, #2
	bl FUN_02007B68
	movs r0, #0x80
	str r0, [sp]
	movs r2, #0
	ldr r0, [sp, #0x5c]
	movs r1, #0x13
	adds r3, r2, #0
	str r4, [sp, #4]
	bl FUN_02007B8C
	add r0, sp, #0x30
	bl FUN_0201D3C4
	movs r3, #0
	str r3, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r2, #2
	str r2, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	adds r0, #0xfb
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	add r1, sp, #0x30
	ldr r0, [r0]
	bl FUN_0201D40C
	movs r0, #1
	lsls r0, r0, #8
	str r0, [sp, #0x28]
	movs r0, #0x80
	adds r1, r4, #0
	bl FUN_02026354
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	movs r4, #0
	cmp r0, #0
	bls _0225DAD2
	ldr r0, [sp, #0x58]
	ldr r1, _0225DAFC @ =0x02261DAC
	lsls r0, r0, #7
	adds r1, r1, r0
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #5
	adds r6, r1, r0
_0225DA0E:
	ldr r0, [sp, #0x58]
	cmp r4, r0
	beq _0225DAC6
	adds r0, r6, #0
	subs r0, #0x20
	ldr r0, [r0]
	movs r1, #2
	str r0, [sp, #0x2c]
	adds r0, r6, #0
	subs r0, #0x1c
	ldr r7, [r0]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0x2c]
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	subs r2, r2, #1
	subs r3, r7, #1
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	ldr r0, [r0]
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201CA4C
	add r0, sp, #0x30
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [r5, #0x18]
	cmp r0, #1
	bne _0225DA5C
	ldr r0, _0225DB00 @ =0x0005060F
	str r0, [sp, #0x20]
	b _0225DA60
_0225DA5C:
	ldr r0, _0225DAF8 @ =0x0001020F
	str r0, [sp, #0x20]
_0225DA60:
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x24]
	bl FUN_02028F58
	ldr r1, [sp, #0x2c]
	add r0, sp, #0x30
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201EEA8
	lsls r1, r7, #0x18
	add r0, sp, #0x30
	lsrs r1, r1, #0x18
	bl FUN_0201EEAC
	add r0, sp, #0x30
	ldrh r1, [r0, #0xa]
	ldr r0, _0225DB04 @ =0xFFFF8000
	ands r0, r1
	ldr r1, [sp, #0x28]
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldr r1, _0225DB08 @ =0x00007FFF
	ands r1, r2
	orrs r1, r0
	add r0, sp, #0x30
	strh r1, [r0, #0xa]
	movs r0, #0
	ldr r1, [sp, #0x24]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	movs r3, #0x40
	str r0, [sp, #8]
	movs r0, #0
	subs r3, r3, r7
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x24]
	add r0, sp, #0x30
	movs r1, #0
	lsrs r3, r3, #1
	bl FUN_020200FC
	ldr r0, [sp, #0x28]
	adds r0, #0x10
	str r0, [sp, #0x28]
_0225DAC6:
	ldr r0, [sp, #0x1c]
	adds r4, r4, #1
	adds r6, #8
	adds r5, r5, #4
	cmp r4, r0
	blo _0225DA0E
_0225DAD2:
	ldr r0, [sp, #0x24]
	bl FUN_02026380
	add r0, sp, #0x30
	bl FUN_0201D520
	ldr r0, [sp, #0x14]
	movs r1, #0
	str r1, [r0, #4]
	movs r0, #2
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225DAF8: .4byte 0x0001020F
_0225DAFC: .4byte 0x02261DAC
_0225DB00: .4byte 0x0005060F
_0225DB04: .4byte 0xFFFF8000
_0225DB08: .4byte 0x00007FFF
	thumb_func_end ov91_0225D8F0

	thumb_func_start ov91_0225DB0C
ov91_0225DB0C: @ 0x0225DB0C
	ldr r3, _0225DB14 @ =FUN_0201D520
	adds r0, #0xc
	bx r3
	nop
_0225DB14: .4byte FUN_0201D520
	thumb_func_end ov91_0225DB0C

	thumb_func_start ov91_0225DB18
ov91_0225DB18: @ 0x0225DB18
	push {r4, lr}
	adds r4, r1, #0
	adds r0, #0xc
	movs r1, #0
	movs r2, #1
	movs r3, #4
	bl FUN_0200E580
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x6f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02258C8C
	pop {r4, pc}
	thumb_func_end ov91_0225DB18

	thumb_func_start ov91_0225DB44
ov91_0225DB44: @ 0x0225DB44
	push {r3, lr}
	movs r0, #0x6f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl FUN_02258CE0
	cmp r0, #1
	beq _0225DB58
	movs r0, #1
	pop {r3, pc}
_0225DB58:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov91_0225DB44

	thumb_func_start ov91_0225DB5C
ov91_0225DB5C: @ 0x0225DB5C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xc
	movs r1, #1
	bl FUN_0200E5D4
	adds r4, #0xc
	adds r0, r4, #0
	bl FUN_0201D8E4
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov91_0225DB5C

	thumb_func_start ov91_0225DB7C
ov91_0225DB7C: @ 0x0225DB7C
	push {r4, lr}
	movs r0, #0x13
	adds r4, r1, #0
	lsls r0, r0, #6
	adds r0, r4, r0
	movs r1, #1
	bl ov91_02260298
	ldr r0, _0225DBA8 @ =0x0000066C
	movs r1, #0x2d
	adds r0, r4, r0
	lsls r1, r1, #0xe
	bl FUN_02018198
	movs r0, #0x13
	lsls r0, r0, #6
	adds r0, r4, r0
	movs r1, #1
	bl ov91_02260334
	pop {r4, pc}
	nop
_0225DBA8: .4byte 0x0000066C
	thumb_func_end ov91_0225DB7C

	thumb_func_start ov91_0225DBAC
ov91_0225DBAC: @ 0x0225DBAC
	ldr r1, [r0, #4]
	adds r1, r1, #1
	str r1, [r0, #4]
	cmp r1, #8
	bge _0225DBBA
	movs r0, #1
	bx lr
_0225DBBA:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225DBAC

	thumb_func_start ov91_0225DBC0
ov91_0225DBC0: @ 0x0225DBC0
	movs r2, #0x13
	lsls r2, r2, #6
	ldr r3, _0225DBCC @ =ov91_022601C8
	adds r0, r0, r2
	bx r3
	nop
_0225DBCC: .4byte ov91_022601C8
	thumb_func_end ov91_0225DBC0

	thumb_func_start ov91_0225DBD0
ov91_0225DBD0: @ 0x0225DBD0
	movs r1, #0x4a
	movs r2, #0
	lsls r1, r1, #4
	str r2, [r0, r1]
	adds r1, r1, #4
	str r2, [r0, r1]
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225DBD0

	thumb_func_start ov91_0225DBE0
ov91_0225DBE0: @ 0x0225DBE0
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225DBE0

	thumb_func_start ov91_0225DBE4
ov91_0225DBE4: @ 0x0225DBE4
	movs r1, #0x13
	lsls r1, r1, #6
	adds r0, r0, r1
	ldr r3, _0225DBF0 @ =ov91_02260298
	movs r1, #5
	bx r3
	.align 2, 0
_0225DBF0: .4byte ov91_02260298
	thumb_func_end ov91_0225DBE4

	thumb_func_start ov91_0225DBF4
ov91_0225DBF4: @ 0x0225DBF4
	push {r3, lr}
	ldr r1, _0225DC1C @ =0x000004A4
	ldr r2, [r0, r1]
	adds r2, r2, #1
	str r2, [r0, r1]
	ldr r1, [r0, r1]
	cmp r1, #0x3c
	blo _0225DC18
	ldr r1, _0225DC20 @ =0x000006BC
	adds r0, r0, r1
	movs r1, #2
	lsls r1, r1, #0xc
	bl FUN_0201815C
	cmp r0, #1
	bne _0225DC18
	movs r0, #1
	pop {r3, pc}
_0225DC18:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_0225DC1C: .4byte 0x000004A4
_0225DC20: .4byte 0x000006BC
	thumb_func_end ov91_0225DBF4

	thumb_func_start ov91_0225DC24
ov91_0225DC24: @ 0x0225DC24
	push {r3, lr}
	movs r1, #0x6f
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl FUN_02258CE0
	cmp r0, #1
	bne _0225DC38
	movs r0, #1
	pop {r3, pc}
_0225DC38:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov91_0225DC24

	thumb_func_start ov91_0225DC3C
ov91_0225DC3C: @ 0x0225DC3C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	movs r0, #0
	strh r0, [r4, #6]
	ldr r1, _0225DCB4 @ =0x00007FFF
	adds r0, r4, #0
	bl ov91_0225DD50
	ldr r1, _0225DCB8 @ =0x00000E38
	adds r0, r4, #0
	bl ov91_0225DD24
	movs r0, #0
	strb r0, [r4]
	movs r0, #1
	strb r0, [r4, #1]
	movs r1, #0x32
	adds r0, r4, #0
	add r2, sp, #0
	lsls r1, r1, #0xe
	adds r0, #0x94
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #0x7b
	adds r0, #0x98
	str r1, [r0]
	movs r0, #5
	lsls r0, r0, #0x10
	ldr r5, _0225DCBC @ =0x02261C28
	str r0, [r4, #8]
	ldm r5!, {r0, r1}
	adds r3, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r5]
	str r0, [r2]
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	adds r2, #0x9c
	stm r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, _0225DCC0 @ =0x000009C4
	str r0, [r2]
	adds r0, r4, #0
	bl ov91_0225E09C
	add r3, sp, #0
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	adds r2, #0xd8
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r4, #0xe4
	str r0, [r4]
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0225DCB4: .4byte 0x00007FFF
_0225DCB8: .4byte 0x00000E38
_0225DCBC: .4byte 0x02261C28
_0225DCC0: .4byte 0x000009C4
	thumb_func_end ov91_0225DC3C

	thumb_func_start ov91_0225DCC4
ov91_0225DCC4: @ 0x0225DCC4
	push {r3, r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3]
	adds r4, r1, #0
	cmp r0, #1
	bne _0225DCD4
	movs r0, #0
	b _0225DCD6
_0225DCD4:
	movs r0, #1
_0225DCD6:
	strb r0, [r4, #1]
	ldr r1, [r3, #8]
	ldr r2, [r3, #0xc]
	ldr r3, [r3]
	adds r0, r4, #0
	lsls r5, r3, #2
	ldr r3, _0225DD1C @ =0x02261C58
	ldr r3, [r3, r5]
	blx r3
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov91_0225DD24
	ldrh r1, [r4, #4]
	adds r0, r4, #0
	bl ov91_0225E044
	str r0, [r4, #8]
	ldrh r1, [r4, #4]
	adds r0, r4, #0
	bl ov91_0225E070
	adds r1, r4, #0
	adds r1, #0xe4
	str r0, [r1]
	ldrh r2, [r4, #2]
	ldrh r1, [r4, #6]
	adds r0, r4, #0
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ov91_0225DD50
	pop {r3, r4, r5, pc}
	nop
_0225DD1C: .4byte 0x02261C58
	thumb_func_end ov91_0225DCC4

	thumb_func_start ov91_0225DD20
ov91_0225DD20: @ 0x0225DD20
	strb r1, [r0]
	bx lr
	thumb_func_end ov91_0225DD20

	thumb_func_start ov91_0225DD24
ov91_0225DD24: @ 0x0225DD24
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, #0xc
	strh r5, [r4, #4]
	blx FUN_020CAFEC
	asrs r0, r5, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	ldr r3, _0225DD4C @ =0x021094DC
	adds r2, r2, #1
	lsls r2, r2, #1
	adds r4, #0xc
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	adds r0, r4, #0
	bl FUN_020CB0D0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225DD4C: .4byte 0x021094DC
	thumb_func_end ov91_0225DD24

	thumb_func_start ov91_0225DD50
ov91_0225DD50: @ 0x0225DD50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #0x54
	strh r4, [r5, #2]
	blx FUN_020CAFEC
	adds r0, r5, #0
	adds r0, #0x30
	blx FUN_020CAFEC
	asrs r0, r4, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	ldr r3, _0225DE84 @ =0x021094DC
	adds r2, r2, #1
	lsls r2, r2, #1
	adds r0, r5, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	adds r0, #0x30
	bl FUN_020CB0EC
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r5, #0
	adds r0, #0xc
	adds r1, #0x30
	adds r2, #0x54
	blx FUN_020CB410
	adds r1, r5, #0
	adds r2, r5, #0
	ldr r0, _0225DE88 @ =0x02261C4C
	adds r1, #0x54
	adds r2, #0x78
	blx FUN_020CB630
	movs r0, #0
	adds r1, r5, #0
	adds r2, r5, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #8]
	adds r1, #0x54
	rsbs r0, r0, #0
	str r0, [sp, #0x10]
	add r0, sp, #8
	adds r2, #0x84
	blx FUN_020CB630
	adds r0, r5, #0
	adds r0, #0xb8
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0x9c
	ldr r0, [r0]
	adds r0, r1, r0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xbc
	ldr r0, [r0]
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0xa4
	ldr r1, [r0]
	movs r0, #5
	lsls r0, r0, #0x10
	adds r0, r1, r0
	str r0, [sp, #0x10]
	add r0, sp, #8
	adds r1, r5, #0
	adds r1, #0x30
	adds r2, r0, #0
	blx FUN_020CB630
	adds r1, r5, #0
	adds r1, #0x84
	add r0, sp, #8
	adds r2, r1, #0
	blx FUN_020CCD78
	adds r0, r5, #0
	adds r2, r5, #0
	adds r0, #0x80
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	adds r2, r5, #0
	adds r2, #0x84
	str r0, [sp, #4]
	ldr r2, [r2]
	ldr r0, [r5, #0x78]
	adds r6, r1, #0
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	str r0, [sp]
	adds r4, r1, #0
	adds r2, r5, #0
	adds r2, #0x88
	ldr r0, [r5, #0x7c]
	ldr r2, [r2]
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	adds r2, r1, #0
	movs r3, #2
	adds r7, r0, #0
	ldr r1, [sp, #4]
	movs r0, #0
	lsls r3, r3, #0xa
	adds r1, r1, r3
	adcs r6, r0
	lsls r3, r6, #0x14
	lsrs r1, r1, #0xc
	orrs r1, r3
	movs r3, #2
	ldr r6, [sp]
	lsls r3, r3, #0xa
	adds r3, r6, r3
	adcs r4, r0
	lsls r4, r4, #0x14
	lsrs r3, r3, #0xc
	orrs r3, r4
	movs r4, #2
	lsls r4, r4, #0xa
	adds r4, r7, r4
	adcs r2, r0
	lsls r0, r2, #0x14
	lsrs r2, r4, #0xc
	orrs r2, r0
	adds r0, r3, r2
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x90
	str r1, [r0]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r5, #0xd8
	adds r0, #0x9c
	adds r1, #0x30
	adds r2, r5, #0
	blx FUN_020CB630
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225DE84: .4byte 0x021094DC
_0225DE88: .4byte 0x02261C4C
	thumb_func_end ov91_0225DD50

	thumb_func_start ov91_0225DE8C
ov91_0225DE8C: @ 0x0225DE8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r4, r0, #0
	ldrb r0, [r4]
	adds r6, r1, #0
	adds r7, r3, #0
	movs r5, #0
	cmp r0, #0
	bne _0225DEA4
	add sp, #0x34
	adds r0, r5, #0
	pop {r4, r5, r6, r7, pc}
_0225DEA4:
	add r0, sp, #0x28
	str r0, [sp]
	add r0, sp, #0xc
	adds r3, r4, #0
	str r0, [sp, #4]
	adds r3, #0x90
	adds r1, r2, #0
	adds r2, r4, #0
	ldr r3, [r3]
	adds r0, r6, #0
	adds r2, #0x78
	bl ov91_02261208
	adds r0, r4, #0
	adds r0, #0x84
	adds r1, r6, #0
	add r2, sp, #0x1c
	blx FUN_020CCDAC
	add r0, sp, #0x1c
	blx FUN_020CCF80
	adds r6, r0, #0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	blt _0225DEFA
	movs r1, #1
	lsls r1, r1, #0xc
	cmp r0, r1
	bgt _0225DEFA
	ldr r1, [r4, #8]
	cmp r6, r1
	bgt _0225DEF4
	ldrb r1, [r4, #1]
	cmp r1, #1
	bne _0225DEF0
	movs r5, #1
	b _0225DEFA
_0225DEF0:
	movs r5, #2
	b _0225DEFA
_0225DEF4:
	add sp, #0x34
	movs r0, #2
	pop {r4, r5, r6, r7, pc}
_0225DEFA:
	cmp r0, #0
	ble _0225DFAA
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r6, r0
	bge _0225DFAA
	adds r2, r4, #0
	adds r2, #0x98
	ldr r2, [r2]
	subs r0, r0, r6
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r5, r2, #0xc
	orrs r5, r0
	add r0, sp, #0x1c
	add r1, sp, #0x10
	blx FUN_020CCFE0
	asrs r0, r5, #0x1f
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #8]
	asrs r1, r0, #0x1f
	adds r2, r5, #0
	blx FUN_020F2948
	adds r2, r0, #0
	movs r0, #2
	movs r3, #0
	lsls r0, r0, #0xa
	adds r0, r2, r0
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	str r0, [r7]
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #8]
	asrs r1, r0, #0x1f
	adds r2, r5, #0
	blx FUN_020F2948
	adds r2, r0, #0
	movs r0, #2
	movs r3, #0
	lsls r0, r0, #0xa
	adds r0, r2, r0
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	str r0, [r7, #4]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #8]
	asrs r1, r0, #0x1f
	adds r2, r5, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r7, #8]
	ldr r0, [r4, #8]
	subs r1, r6, r5
	cmp r1, r0
	bgt _0225DFA8
	ldrb r0, [r4, #1]
	cmp r0, #1
	bne _0225DFA4
	movs r5, #1
	b _0225DFAA
_0225DFA4:
	movs r5, #2
	b _0225DFAA
_0225DFA8:
	movs r5, #3
_0225DFAA:
	adds r0, r5, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225DE8C

	thumb_func_start ov91_0225DFB0
ov91_0225DFB0: @ 0x0225DFB0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	adds r5, r0, #0
	ldrb r0, [r5]
	adds r4, r1, #0
	cmp r0, #0
	bne _0225DFC4
	add sp, #0x24
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_0225DFC4:
	adds r1, r5, #0
	adds r1, #0xdc
	ldr r0, [r4, #4]
	ldr r2, [r1]
	cmp r2, r0
	bge _0225E03C
	adds r1, r5, #0
	adds r1, #0xe4
	ldr r1, [r1]
	adds r1, r2, r1
	cmp r1, r0
	ble _0225E03C
	adds r0, r5, #0
	adds r0, #0xd8
	ldr r0, [r0]
	movs r1, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r0, [r0]
	add r2, sp, #0x18
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [r4]
	str r0, [sp]
	ldr r0, [r4, #8]
	str r0, [sp, #8]
	str r1, [sp, #4]
	add r0, sp, #0xc
	add r1, sp, #0
	blx FUN_020CCDAC
	add r0, sp, #0x18
	blx FUN_020CCF80
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r1, [r4, #4]
	ldr r0, [r0]
	subs r0, r1, r0
	asrs r1, r0, #0xc
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r0, [r0]
	muls r0, r1, r0
	adds r1, r5, #0
	adds r1, #0xe4
	ldr r1, [r1]
	asrs r1, r1, #0xc
	blx FUN_020F2998
	adds r5, #0xcc
	ldr r1, [r5]
	subs r0, r1, r0
	cmp r6, r0
	bge _0225E03C
	add sp, #0x24
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0225E03C:
	movs r0, #0
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov91_0225DFB0

	thumb_func_start ov91_0225E044
ov91_0225E044: @ 0x0225E044
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	muls r0, r1, r0
	ldr r1, _0225E06C @ =0x0000FFFF
	blx FUN_020F2998
	movs r1, #0x5a
	subs r2, r1, r0
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	muls r0, r2, r0
	blx FUN_020F2998
	adds r4, #0xb0
	ldr r1, [r4]
	adds r0, r0, r1
	pop {r4, pc}
	.align 2, 0
_0225E06C: .4byte 0x0000FFFF
	thumb_func_end ov91_0225E044

	thumb_func_start ov91_0225E070
ov91_0225E070: @ 0x0225E070
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	muls r0, r1, r0
	ldr r1, _0225E098 @ =0x0000FFFF
	blx FUN_020F2998
	adds r1, r4, #0
	adds r1, #0xc4
	ldr r1, [r1]
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0x5a
	blx FUN_020F2998
	adds r4, #0xc0
	ldr r1, [r4]
	adds r0, r0, r1
	pop {r4, pc}
	.align 2, 0
_0225E098: .4byte 0x0000FFFF
	thumb_func_end ov91_0225E070

	thumb_func_start ov91_0225E09C
ov91_0225E09C: @ 0x0225E09C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0xa8
	movs r2, #0x1e
	adds r4, r1, #0
	str r1, [r0]
	asrs r6, r1, #0x1f
	adds r0, r4, #0
	adds r1, r6, #0
	lsls r2, r2, #0xc
	movs r3, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	adds r0, r5, #0
	adds r0, #0xac
	str r1, [r0]
	movs r2, #0x32
	adds r0, r4, #0
	adds r1, r6, #0
	lsls r2, r2, #0xc
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	adds r0, r5, #0
	adds r0, #0xb0
	str r1, [r0]
	movs r2, #5
	adds r0, r4, #0
	adds r1, r6, #0
	lsls r2, r2, #0x10
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r7, r2, #0xc
	orrs r7, r0
	adds r0, r5, #0
	adds r0, #0xb4
	str r7, [r0]
	adds r0, r5, #0
	adds r0, #0xb8
	movs r2, #0x37
	str r3, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	lsls r2, r2, #0xc
	blx FUN_020F2948
	adds r2, r0, #0
	movs r0, #2
	movs r3, #0
	lsls r0, r0, #0xa
	adds r0, r2, r0
	adcs r1, r3
	movs r2, #0x96
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	adds r1, r5, #0
	adds r1, #0xbc
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	lsls r2, r2, #0xc
	blx FUN_020F2948
	adds r2, r0, #0
	movs r0, #2
	movs r3, #0
	lsls r0, r0, #0xa
	adds r0, r2, r0
	adcs r1, r3
	movs r2, #0xf
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	adds r1, r5, #0
	adds r1, #0xc0
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	lsls r2, r2, #0xe
	blx FUN_020F2948
	adds r2, r0, #0
	movs r0, #2
	movs r3, #0
	lsls r0, r0, #0xa
	adds r0, r2, r0
	adcs r1, r3
	movs r2, #0x1e
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	adds r1, r5, #0
	adds r1, #0xc4
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xc8
	str r7, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	lsls r2, r2, #0xe
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	adds r0, r5, #0
	adds r0, #0xcc
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xcc
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc8
	ldr r0, [r0]
	movs r2, #6
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0xd0
	str r1, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	lsls r2, r2, #0xa
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	adds r5, #0xd4
	str r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225E09C

	thumb_func_start ov91_0225E1E0
ov91_0225E1E0: @ 0x0225E1E0
	strh r1, [r0, #6]
	bx lr
	thumb_func_end ov91_0225E1E0

	thumb_func_start ov91_0225E1E4
ov91_0225E1E4: @ 0x0225E1E4
	adds r0, #0xa4
	str r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225E1E4

	thumb_func_start ov91_0225E1EC
ov91_0225E1EC: @ 0x0225E1EC
	ldr r0, _0225E1F0 @ =0x00000E38
	bx lr
	.align 2, 0
_0225E1F0: .4byte 0x00000E38
	thumb_func_end ov91_0225E1EC

	thumb_func_start ov91_0225E1F4
ov91_0225E1F4: @ 0x0225E1F4
	ldr r0, _0225E1F8 @ =0x00003FFF
	bx lr
	.align 2, 0
_0225E1F8: .4byte 0x00003FFF
	thumb_func_end ov91_0225E1F4

	thumb_func_start ov91_0225E1FC
ov91_0225E1FC: @ 0x0225E1FC
	push {r3, lr}
	ldr r0, _0225E22C @ =0x000002EE
	subs r0, r1, r0
	movs r1, #0x32
	blx FUN_020F2BA4
	ldr r0, _0225E230 @ =0x0000638E
	muls r0, r1, r0
	movs r1, #0x32
	blx FUN_020F2998
	ldr r1, _0225E234 @ =0x000031C7
	cmp r0, r1
	ble _0225E220
	blx FUN_020F2998
	ldr r0, _0225E234 @ =0x000031C7
	subs r0, r0, r1
_0225E220:
	ldr r1, _0225E238 @ =0x00000E38
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, pc}
	nop
_0225E22C: .4byte 0x000002EE
_0225E230: .4byte 0x0000638E
_0225E234: .4byte 0x000031C7
_0225E238: .4byte 0x00000E38
	thumb_func_end ov91_0225E1FC

	thumb_func_start ov91_0225E23C
ov91_0225E23C: @ 0x0225E23C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5]
	adds r4, r1, #0
	ldr r2, _0225E290 @ =0x0000028F
	strh r0, [r4]
	ldrh r0, [r5, #2]
	movs r3, #0
	strh r0, [r4, #2]
	ldr r0, [r5, #4]
	strh r0, [r4, #4]
	ldr r0, [r5, #8]
	strh r0, [r4, #6]
	ldr r0, [r5, #0xc]
	strh r0, [r4, #8]
	ldr r0, [r5, #0x10]
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldr r0, [r5, #0x14]
	asrs r0, r0, #0xc
	strh r0, [r4, #0xa]
	ldr r0, [r5, #0x18]
	asrs r0, r0, #0xc
	strh r0, [r4, #0xc]
	ldr r0, [r5, #0x1c]
	asrs r0, r0, #0xc
	strh r0, [r4, #0xe]
	ldr r0, [r5, #0x20]
	strb r0, [r4, #0x12]
	ldr r0, [r5, #0x24]
	strb r0, [r4, #0x13]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225E290: .4byte 0x0000028F
	thumb_func_end ov91_0225E23C

	thumb_func_start ov91_0225E294
ov91_0225E294: @ 0x0225E294
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5]
	adds r4, r1, #0
	ldr r1, _0225E2E0 @ =0x0000028F
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	movs r0, #4
	ldrsh r0, [r5, r0]
	str r0, [r4, #4]
	movs r0, #6
	ldrsh r0, [r5, r0]
	str r0, [r4, #8]
	movs r0, #8
	ldrsh r0, [r5, r0]
	str r0, [r4, #0xc]
	movs r0, #0x10
	ldrsh r0, [r5, r0]
	blx FUN_020CCBA0
	str r0, [r4, #0x10]
	movs r0, #0xa
	ldrsh r0, [r5, r0]
	lsls r0, r0, #0xc
	str r0, [r4, #0x14]
	movs r0, #0xc
	ldrsh r0, [r5, r0]
	lsls r0, r0, #0xc
	str r0, [r4, #0x18]
	movs r0, #0xe
	ldrsh r0, [r5, r0]
	lsls r0, r0, #0xc
	str r0, [r4, #0x1c]
	ldrb r0, [r5, #0x13]
	str r0, [r4, #0x24]
	pop {r3, r4, r5, pc}
	nop
_0225E2E0: .4byte 0x0000028F
	thumb_func_end ov91_0225E294

	thumb_func_start ov91_0225E2E4
ov91_0225E2E4: @ 0x0225E2E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r6, r1, #0
	str r2, [sp]
	movs r1, #0
	adds r2, r4, #0
_0225E2F2:
	adds r0, r2, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225E34C
	movs r0, #0x44
	adds r5, r1, #0
	muls r5, r0, r5
	adds r3, r4, r5
	adds r7, r6, #0
	adds r3, #0x50
	movs r2, #5
_0225E30A:
	ldm r7!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0225E30A
	adds r1, r4, r5
	ldr r0, [sp]
	adds r1, #0x4c
	adds r2, r4, r5
	adds r6, #0x14
	strb r0, [r1]
	ldm r6!, {r0, r1}
	adds r2, #0x78
	stm r2!, {r0, r1}
	ldr r0, [r6]
	movs r1, #0
	str r0, [r2]
	adds r0, r4, r5
	adds r0, #0x4e
	strh r1, [r0]
	adds r0, r4, r5
	adds r0, #0x88
	str r1, [r0]
	ldr r0, _0225E3F0 @ =0x00001AB4
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0x14]
	adds r0, r4, r0
	adds r1, r1, r5
	bl ov91_02260728
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0225E34C:
	adds r1, r1, #1
	adds r2, #0x44
	cmp r1, #0x60
	blt _0225E2F2
	ldr r0, [sp]
	cmp r0, #1
	bne _0225E3EA
	movs r0, #0
	adds r2, r4, #0
_0225E35E:
	adds r1, r2, #0
	adds r1, #0x4c
	ldrb r1, [r1]
	cmp r1, #2
	beq _0225E36C
	cmp r1, #5
	bne _0225E3DE
_0225E36C:
	adds r5, r0, #0
	adds r0, r4, #0
	str r0, [sp, #8]
	adds r0, #0x4c
	movs r1, #0x44
	str r0, [sp, #8]
	muls r5, r1, r5
	ldr r0, _0225E3F0 @ =0x00001AB4
	ldr r1, [sp, #8]
	adds r0, r4, r0
	adds r1, r1, r5
	bl ov91_02260754
	adds r0, r4, #0
	str r0, [sp, #4]
	adds r0, #0x4c
	str r0, [sp, #4]
	adds r0, r0, r5
	bl ov91_0225E400
	adds r2, r4, r5
	mov ip, r6
	adds r2, #0x50
	movs r7, #5
_0225E39C:
	mov r3, ip
	ldm r3!, {r0, r1}
	mov ip, r3
	stm r2!, {r0, r1}
	subs r7, r7, #1
	bne _0225E39C
	ldr r1, [sp]
	ldr r0, [sp, #4]
	adds r2, r4, r5
	adds r6, #0x14
	strb r1, [r0, r5]
	ldm r6!, {r0, r1}
	adds r2, #0x78
	stm r2!, {r0, r1}
	ldr r0, [r6]
	movs r1, #0
	str r0, [r2]
	adds r0, r4, r5
	adds r0, #0x4e
	strh r1, [r0]
	adds r0, r4, r5
	adds r0, #0x88
	str r1, [r0]
	ldr r0, _0225E3F0 @ =0x00001AB4
	ldr r1, [sp, #8]
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0x14]
	adds r0, r4, r0
	adds r1, r1, r5
	bl ov91_02260728
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0225E3DE:
	adds r0, r0, #1
	adds r2, #0x44
	cmp r0, #0x60
	blt _0225E35E
	bl FUN_0202551C
_0225E3EA:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225E3F0: .4byte 0x00001AB4
	thumb_func_end ov91_0225E2E4

	thumb_func_start ov91_0225E3F4
ov91_0225E3F4: @ 0x0225E3F4
	movs r0, #1
	strb r0, [r1, #1]
	strh r2, [r1, #6]
	str r3, [r1, #0x24]
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225E3F4

	thumb_func_start ov91_0225E400
ov91_0225E400: @ 0x0225E400
	ldr r3, _0225E408 @ =FUN_020E5B44
	movs r1, #0
	movs r2, #0x44
	bx r3
	.align 2, 0
_0225E408: .4byte FUN_020E5B44
	thumb_func_end ov91_0225E400

	thumb_func_start ov91_0225E40C
ov91_0225E40C: @ 0x0225E40C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	movs r7, #0
	adds r6, r5, #0
	adds r4, #0x4c
_0225E418:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	adds r1, r0, #0
	adds r1, #0xff
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _0225E434
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov91_0225E45C
	b _0225E44E
_0225E434:
	cmp r0, #5
	bne _0225E442
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov91_0225E8BC
	b _0225E44E
_0225E442:
	cmp r0, #3
	bne _0225E44E
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov91_0225E9F4
_0225E44E:
	adds r7, r7, #1
	adds r6, #0x44
	adds r4, #0x44
	cmp r7, #0x60
	blt _0225E418
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov91_0225E40C

	thumb_func_start ov91_0225E45C
ov91_0225E45C: @ 0x0225E45C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r4, r1, #0
	ldrb r7, [r4]
	adds r5, r0, #0
	cmp r7, #1
	beq _0225E470
	cmp r7, #2
	beq _0225E470
	b _0225E5FA
_0225E470:
	ldr r0, [r4, #0x30]
	add r1, sp, #0x14
	str r0, [sp, #4]
	adds r0, r4, #0
	bl ov91_0225E728
	ldrb r0, [r4]
	cmp r0, #1
	bne _0225E496
	ldr r0, _0225E600 @ =0x000019CC
	adds r1, r4, #0
	adds r0, r5, r0
	adds r1, #0x2c
	add r2, sp, #0x14
	add r3, sp, #8
	bl ov91_0225DE8C
	adds r6, r0, #0
	b _0225E498
_0225E496:
	movs r6, #0
_0225E498:
	adds r0, r4, #0
	add r1, sp, #0x14
	bl ov91_0225EA54
	cmp r6, #3
	beq _0225E4A8
	cmp r6, #1
	bne _0225E4B0
_0225E4A8:
	adds r0, r4, #0
	add r1, sp, #8
	bl ov91_0225EA54
_0225E4B0:
	ldrh r0, [r4, #2]
	adds r0, r0, #1
	strh r0, [r4, #2]
	cmp r6, #1
	bne _0225E544
	adds r0, r5, #0
	bl ov91_0225D600
	ldr r1, [r5, #0x18]
	adds r1, r1, r0
	ldr r0, _0225E604 @ =0x0001869F
	str r1, [r5, #0x18]
	cmp r1, r0
	ble _0225E4CE
	str r0, [r5, #0x18]
_0225E4CE:
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _0225E4DA
	cmp r0, #1
	beq _0225E4E8
	b _0225E4F6
_0225E4DA:
	ldr r0, _0225E608 @ =0x00000582
	bl FUN_0200604C
	ldr r0, _0225E60C @ =0x00000583
	bl FUN_0200604C
	b _0225E502
_0225E4E8:
	ldr r0, _0225E608 @ =0x00000582
	bl FUN_0200604C
	ldr r0, _0225E610 @ =0x00000584
	bl FUN_0200604C
	b _0225E502
_0225E4F6:
	ldr r0, _0225E608 @ =0x00000582
	bl FUN_0200604C
	ldr r0, _0225E614 @ =0x00000585
	bl FUN_0200604C
_0225E502:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov91_0225E9E4
	ldr r0, _0225E618 @ =0x00001E38
	ldr r1, [r5, #0x14]
	ldr r2, [r5, #0x1c]
	ldr r3, [r5]
	adds r0, r5, r0
	bl ov91_0225D694
	ldr r0, [r5, #0x1c]
	cmp r0, #0x63
	bge _0225E522
	adds r0, r0, #1
	str r0, [r5, #0x1c]
_0225E522:
	ldr r2, [r5, #0x1c]
	ldr r0, _0225E61C @ =0x0000862C
	cmp r2, #3
	ldr r1, _0225E620 @ =0x00001AB4
	bne _0225E538
	adds r0, r5, r0
	adds r1, r5, r1
	bl ov91_02261808
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0225E538:
	adds r0, r5, r0
	adds r1, r5, r1
	bl ov91_022618B0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0225E544:
	ldr r0, _0225E600 @ =0x000019CC
	adds r1, r4, #0
	adds r0, r5, r0
	adds r1, #0x2c
	movs r6, #0
	bl ov91_0225DFB0
	cmp r0, #1
	bne _0225E56E
	movs r6, #1
	cmp r7, #1
	bne _0225E562
	ldr r0, _0225E624 @ =0x00000722
	bl FUN_0200604C
_0225E562:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov91_0225E7C4
	b _0225E5E6
_0225E56E:
	ldr r1, [r4, #0x30]
	ldr r0, _0225E628 @ =0xFFFCE000
	cmp r1, r0
	bgt _0225E5BE
	adds r0, r4, #0
	bl ov91_0225E990
	cmp r0, #0
	bne _0225E5A4
	ldr r1, _0225E628 @ =0xFFFCE000
	ldr r0, [sp, #4]
	movs r6, #1
	cmp r0, r1
	bgt _0225E598
	ldr r3, [r5, #0x1c]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov91_0225E3F4
	b _0225E5E6
_0225E598:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl ov91_0225E7C4
	b _0225E5E6
_0225E5A4:
	movs r0, #1
	ldr r1, [r4, #0x30]
	lsls r0, r0, #0xa
	cmp r1, r0
	bgt _0225E5E6
	ldr r3, [r5, #0x1c]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	movs r6, #1
	bl ov91_0225E3F4
	b _0225E5E6
_0225E5BE:
	adds r0, r4, #0
	bl ov91_0225E9C0
	cmp r0, #1
	bne _0225E5E6
	adds r0, r4, #0
	adds r0, #0x2c
	movs r6, #1
	add r1, sp, #0x14
	adds r2, r0, #0
	blx FUN_020CCDAC
	movs r0, #0
	adds r2, r6, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	lsls r3, r2, #0xa
	bl ov91_0225E7E8
_0225E5E6:
	cmp r6, #1
	bne _0225E5FA
	cmp r7, #1
	bne _0225E5FA
	movs r0, #0
	str r0, [r5, #0x1c]
	ldr r0, _0225E61C @ =0x0000862C
	adds r0, r5, r0
	bl ov91_02261890
_0225E5FA:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E600: .4byte 0x000019CC
_0225E604: .4byte 0x0001869F
_0225E608: .4byte 0x00000582
_0225E60C: .4byte 0x00000583
_0225E610: .4byte 0x00000584
_0225E614: .4byte 0x00000585
_0225E618: .4byte 0x00001E38
_0225E61C: .4byte 0x0000862C
_0225E620: .4byte 0x00001AB4
_0225E624: .4byte 0x00000722
_0225E628: .4byte 0xFFFCE000
	thumb_func_end ov91_0225E45C

	thumb_func_start ov91_0225E62C
ov91_0225E62C: @ 0x0225E62C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	movs r4, #0
	adds r5, #0x4c
_0225E636:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov91_0225E67C
	adds r4, r4, #1
	adds r5, #0x44
	cmp r4, #0x60
	blt _0225E636
	pop {r4, r5, r6, pc}
	thumb_func_end ov91_0225E62C

	thumb_func_start ov91_0225E648
ov91_0225E648: @ 0x0225E648
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	movs r6, #0
	adds r4, r7, #0
	adds r5, #0x4c
_0225E654:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225E666
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #2
	strb r0, [r1]
_0225E666:
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov91_0225E67C
	adds r6, r6, #1
	adds r4, #0x44
	adds r5, #0x44
	cmp r6, #0x60
	blt _0225E654
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov91_0225E648

	thumb_func_start ov91_0225E67C
ov91_0225E67C: @ 0x0225E67C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #1]
	adds r4, r1, #0
	cmp r0, #0
	beq _0225E6AA
	ldrb r0, [r5]
	cmp r0, #3
	bne _0225E69A
	ldrh r0, [r5, #6]
	cmp r0, #1
	bne _0225E69A
	movs r0, #4
	strb r0, [r5]
	b _0225E6A0
_0225E69A:
	adds r0, r5, #0
	bl ov91_0225E400
_0225E6A0:
	ldr r0, _0225E6AC @ =0x00001AB4
	adds r1, r5, #0
	adds r0, r4, r0
	bl ov91_02260754
_0225E6AA:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225E6AC: .4byte 0x00001AB4
	thumb_func_end ov91_0225E67C

	thumb_func_start ov91_0225E6B0
ov91_0225E6B0: @ 0x0225E6B0
	movs r3, #0
	movs r2, #2
_0225E6B4:
	adds r1, r0, #0
	adds r1, #0x4c
	ldrb r1, [r1]
	cmp r1, #1
	bne _0225E6C4
	adds r1, r0, #0
	adds r1, #0x4c
	strb r2, [r1]
_0225E6C4:
	adds r3, r3, #1
	adds r0, #0x44
	cmp r3, #0x60
	blt _0225E6B4
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225E6B0

	thumb_func_start ov91_0225E6D0
ov91_0225E6D0: @ 0x0225E6D0
	movs r2, #0
_0225E6D2:
	adds r1, r0, #0
	adds r1, #0x4c
	ldrb r1, [r1]
	cmp r1, #1
	beq _0225E6E8
	cmp r1, #2
	beq _0225E6E8
	cmp r1, #5
	beq _0225E6E8
	cmp r1, #3
	bne _0225E6EC
_0225E6E8:
	movs r0, #1
	bx lr
_0225E6EC:
	adds r2, r2, #1
	adds r0, #0x44
	cmp r2, #0x60
	blt _0225E6D2
	movs r0, #0
	bx lr
	thumb_func_end ov91_0225E6D0

	thumb_func_start ov91_0225E6F8
ov91_0225E6F8: @ 0x0225E6F8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #2]
	movs r2, #0x67
	lsls r2, r2, #4
	lsls r0, r0, #0xc
	asrs r1, r0, #0x1f
	movs r3, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	ldr r4, [r4, #0x14]
	orrs r1, r0
	subs r0, r4, r1
	bpl _0225E724
	adds r0, r3, #0
_0225E724:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov91_0225E6F8

	thumb_func_start ov91_0225E728
ov91_0225E728: @ 0x0225E728
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov91_0225E6F8
	adds r7, r0, #0
	ldr r0, [r5, #8]
	asrs r6, r7, #0x1f
	asrs r1, r0, #0x1f
	adds r2, r7, #0
	adds r3, r6, #0
	blx FUN_020F2948
	adds r2, r0, #0
	movs r0, #2
	movs r3, #0
	lsls r0, r0, #0xa
	adds r0, r2, r0
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	str r0, [r4]
	ldr r0, [r5, #0xc]
	adds r2, r7, #0
	asrs r1, r0, #0x1f
	adds r3, r6, #0
	blx FUN_020F2948
	adds r2, r0, #0
	movs r0, #2
	movs r3, #0
	lsls r0, r0, #0xa
	adds r0, r2, r0
	adcs r1, r3
	ldr r2, _0225E7BC @ =0xFFFFECCC
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	str r0, [r4, #4]
	ldrh r0, [r5, #2]
	asrs r3, r2, #0xd
	lsls r0, r0, #0xc
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r3, #2
	adds r2, r0, #0
	lsls r3, r3, #0xa
	adds r3, r2, r3
	ldr r2, _0225E7C0 @ =0x00000000
	ldr r0, [r4, #4]
	adcs r1, r2
	lsrs r2, r3, #0xc
	lsls r1, r1, #0x14
	orrs r2, r1
	adds r0, r0, r2
	str r0, [r4, #4]
	ldr r0, [r5, #0x10]
	adds r2, r7, #0
	asrs r1, r0, #0x1f
	adds r3, r6, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E7BC: .4byte 0xFFFFECCC
_0225E7C0: .4byte 0x00000000
	thumb_func_end ov91_0225E728

	thumb_func_start ov91_0225E7C4
ov91_0225E7C4: @ 0x0225E7C4
	push {r3, r4, lr}
	sub sp, #4
	cmp r2, #1
	bne _0225E7D0
	ldr r3, _0225E7E0 @ =0x00000D9A
	b _0225E7D2
_0225E7D0:
	ldr r3, _0225E7E4 @ =0x00000CCD
_0225E7D2:
	movs r4, #1
	str r4, [sp]
	bl ov91_0225E7E8
	add sp, #4
	pop {r3, r4, pc}
	nop
_0225E7E0: .4byte 0x00000D9A
_0225E7E4: .4byte 0x00000CCD
	thumb_func_end ov91_0225E7C4

	thumb_func_start ov91_0225E7E8
ov91_0225E7E8: @ 0x0225E7E8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r3, #0
	cmp r2, #0
	beq _0225E87E
	ldr r0, [r5, #8]
	rsbs r0, r0, #0
	str r0, [r5, #8]
	ldr r0, [r5, #0x10]
	rsbs r0, r0, #0
	str r0, [r5, #0x10]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0225E87E
	bl FUN_0201FDB8
	ldr r2, [r5, #0x10]
	adds r1, r0, #0
	cmp r2, #0
	bge _0225E816
	rsbs r0, r2, #0
	b _0225E818
_0225E816:
	adds r0, r2, #0
_0225E818:
	ldr r3, [r5, #8]
	cmp r3, #0
	bge _0225E822
	rsbs r6, r3, #0
	b _0225E824
_0225E822:
	adds r6, r3, #0
_0225E824:
	cmp r6, r0
	bgt _0225E854
	asrs r0, r2, #0x1f
	lsrs r3, r2, #0x14
	lsls r0, r0, #0xc
	lsls r6, r2, #0xc
	movs r2, #2
	orrs r0, r3
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r6, r2
	adcs r0, r3
	lsls r0, r0, #0x14
	lsrs r2, r2, #0xc
	orrs r2, r0
	movs r0, #1
	ands r0, r1
	cmp r0, #1
	bne _0225E850
	rsbs r0, r2, #0
	str r0, [r5, #8]
	b _0225E87E
_0225E850:
	str r2, [r5, #8]
	b _0225E87E
_0225E854:
	asrs r0, r3, #0x1f
	lsrs r2, r3, #0x14
	lsls r0, r0, #0xc
	orrs r0, r2
	movs r2, #2
	lsls r6, r3, #0xc
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r6, r2
	adcs r0, r3
	lsls r0, r0, #0x14
	lsrs r2, r2, #0xc
	orrs r2, r0
	movs r0, #1
	ands r0, r1
	cmp r0, #1
	bne _0225E87C
	rsbs r0, r2, #0
	str r0, [r5, #0x10]
	b _0225E87E
_0225E87C:
	str r2, [r5, #0x10]
_0225E87E:
	ldr r0, [r5, #0x14]
	asrs r3, r4, #0x1f
	asrs r1, r0, #0x1f
	adds r2, r4, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r5, #0x14]
	strh r3, [r5, #2]
	movs r0, #5
	strb r0, [r5]
	adds r0, r5, #0
	add r1, sp, #0
	bl ov91_0225E728
	adds r0, r5, #0
	add r1, sp, #0
	bl ov91_0225EA54
	ldrh r0, [r5, #2]
	adds r0, r0, #1
	strh r0, [r5, #2]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov91_0225E7E8

	thumb_func_start ov91_0225E8BC
ov91_0225E8BC: @ 0x0225E8BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r1, [r5]
	movs r6, #0
	cmp r1, #5
	bne _0225E980
	add r1, sp, #4
	ldr r7, [r5, #0x30]
	bl ov91_0225E728
	adds r0, r5, #0
	add r1, sp, #4
	bl ov91_0225EA54
	ldrh r0, [r5, #2]
	adds r1, r5, #0
	adds r1, #0x2c
	adds r0, r0, #1
	strh r0, [r5, #2]
	ldr r0, _0225E984 @ =0x000019CC
	adds r0, r4, r0
	bl ov91_0225DFB0
	cmp r0, #1
	bne _0225E8FE
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl ov91_0225E7C4
	b _0225E964
_0225E8FE:
	ldr r1, [r5, #0x30]
	ldr r0, _0225E988 @ =0xFFFCE000
	cmp r1, r0
	bgt _0225E93E
	adds r0, r5, #0
	bl ov91_0225E990
	cmp r0, #0
	bne _0225E926
	ldr r0, _0225E988 @ =0xFFFCE000
	cmp r7, r0
	bgt _0225E91A
	movs r6, #1
	b _0225E930
_0225E91A:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov91_0225E7C4
	b _0225E930
_0225E926:
	ldr r1, [r5, #0x30]
	ldr r0, _0225E98C @ =0xFFF9C000
	cmp r1, r0
	bgt _0225E930
	movs r6, #1
_0225E930:
	movs r0, #2
	ldr r1, [r5, #0x14]
	lsls r0, r0, #0xc
	cmp r1, r0
	bgt _0225E964
	movs r6, #1
	b _0225E964
_0225E93E:
	adds r0, r5, #0
	bl ov91_0225E9C0
	cmp r0, #1
	bne _0225E964
	adds r0, r5, #0
	adds r0, #0x2c
	add r1, sp, #4
	adds r2, r0, #0
	blx FUN_020CCDAC
	adds r0, r6, #0
	movs r2, #1
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	lsls r3, r2, #0xa
	bl ov91_0225E7E8
_0225E964:
	movs r0, #1
	ldr r1, [r5, #0x14]
	lsls r0, r0, #0xc
	cmp r1, r0
	bgt _0225E970
	movs r6, #1
_0225E970:
	cmp r6, #1
	bne _0225E980
	ldr r3, [r4, #0x1c]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl ov91_0225E3F4
_0225E980:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E984: .4byte 0x000019CC
_0225E988: .4byte 0xFFFCE000
_0225E98C: .4byte 0xFFF9C000
	thumb_func_end ov91_0225E8BC

	thumb_func_start ov91_0225E990
ov91_0225E990: @ 0x0225E990
	ldr r1, [r0, #0x40]
	movs r0, #0x2f
	lsls r0, r0, #0xe
	cmp r1, r0
	blt _0225E9A6
	movs r0, #0xf
	lsls r0, r0, #0x10
	cmp r1, r0
	bgt _0225E9A6
	movs r0, #1
	bx lr
_0225E9A6:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225E990

	thumb_func_start ov91_0225E9AC
ov91_0225E9AC: @ 0x0225E9AC
	ldr r1, [r0, #0x40]
	movs r0, #0x1e
	lsls r0, r0, #0xe
	cmp r1, r0
	bgt _0225E9BA
	movs r0, #1
	bx lr
_0225E9BA:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225E9AC

	thumb_func_start ov91_0225E9C0
ov91_0225E9C0: @ 0x0225E9C0
	movs r1, #0xf
	ldr r2, [r0, #0x40]
	lsls r1, r1, #0x10
	cmp r2, r1
	blt _0225E9D4
	ldr r0, [r0, #0x3c]
	cmp r0, #1
	bne _0225E9DE
	movs r0, #1
	bx lr
_0225E9D4:
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	bne _0225E9DE
	movs r1, #1
	str r1, [r0, #0x3c]
_0225E9DE:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225E9C0

	thumb_func_start ov91_0225E9E4
ov91_0225E9E4: @ 0x0225E9E4
	movs r2, #3
	strb r2, [r0]
	movs r2, #8
	strh r2, [r0, #0x38]
	ldr r1, [r1, #0x1c]
	strh r1, [r0, #0x3a]
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225E9E4

	thumb_func_start ov91_0225E9F4
ov91_0225E9F4: @ 0x0225E9F4
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r6, r1, #0
	add r1, sp, #0xc
	adds r5, r0, #0
	bl ov91_0225E728
	ldr r0, _0225EA50 @ =0x000019CC
	adds r1, r5, #0
	adds r0, r6, r0
	adds r1, #0x2c
	add r2, sp, #0xc
	add r3, sp, #0
	bl ov91_0225DE8C
	adds r4, r0, #0
	adds r0, r5, #0
	add r1, sp, #0xc
	bl ov91_0225EA54
	cmp r4, #3
	beq _0225EA24
	cmp r4, #1
	bne _0225EA2C
_0225EA24:
	adds r0, r5, #0
	add r1, sp, #0
	bl ov91_0225EA54
_0225EA2C:
	ldrh r0, [r5, #2]
	adds r0, r0, #1
	strh r0, [r5, #2]
	movs r0, #0x38
	ldrsh r1, [r5, r0]
	subs r1, r1, #1
	strh r1, [r5, #0x38]
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bgt _0225EA4C
	ldrh r3, [r5, #0x3a]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov91_0225E3F4
_0225EA4C:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225EA50: .4byte 0x000019CC
	thumb_func_end ov91_0225E9F4

	thumb_func_start ov91_0225EA54
ov91_0225EA54: @ 0x0225EA54
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x2c
	adds r2, r0, #0
	blx FUN_020CCD78
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x2c]
	str r0, [sp]
	ldr r0, [r4, #0x34]
	str r0, [sp, #8]
	add r0, sp, #0
	blx FUN_020CCF80
	str r0, [r4, #0x40]
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov91_0225EA54

	thumb_func_start ov91_0225EA7C
ov91_0225EA7C: @ 0x0225EA7C
	push {r3, lr}
	ldr r1, _0225EA94 @ =0x021D114C
	ldrh r1, [r1, #0x26]
	cmp r1, #0
	bne _0225EA8C
	bl ov91_0225EA98
	pop {r3, pc}
_0225EA8C:
	bl ov91_0225EC7C
	pop {r3, pc}
	nop
_0225EA94: .4byte 0x021D114C
	thumb_func_end ov91_0225EA7C

	thumb_func_start ov91_0225EA98
ov91_0225EA98: @ 0x0225EA98
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r5, r0, #0
	ldr r0, [r5, #0x20]
	movs r4, #0
	cmp r0, #0
	bne _0225EAB0
	ldr r0, [r5, #0x48]
	add sp, #0x30
	adds r0, r0, #1
	str r0, [r5, #0x48]
	pop {r4, r5, r6, pc}
_0225EAB0:
	adds r0, r5, #0
	adds r0, #0x20
	add r1, sp, #4
	bl ov91_0225EE48
	cmp r0, #0
	bne _0225EAC2
	bl FUN_0202551C
_0225EAC2:
	adds r0, r5, #0
	adds r0, #0x20
	add r1, sp, #0
	bl ov91_0225EE64
	cmp r0, #0
	bne _0225EAD4
	bl FUN_0202551C
_0225EAD4:
	adds r0, r5, #0
	adds r0, #0x20
	bl ov91_0225EE88
	adds r6, r0, #0
	cmp r6, #2
	bge _0225EAE4
	b _0225EC44
_0225EAE4:
	ldr r0, [r5, #0x14]
	add r1, sp, #0
	strh r0, [r1, #8]
	movs r3, #0
	strh r3, [r1, #0xa]
	movs r0, #4
	ldrsh r2, [r1, r0]
	ldrsh r0, [r1, r3]
	adds r1, r6, #0
	subs r0, r2, r0
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r0, r0, #4
	str r0, [sp, #0xc]
	add r1, sp, #0
	movs r0, #6
	ldrsh r2, [r1, r0]
	movs r0, #2
	ldrsh r0, [r1, r0]
	adds r1, r6, #0
	subs r0, r2, r0
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r0, r0, #4
	str r0, [sp, #0x14]
	movs r0, #0
	str r0, [sp, #0x10]
	add r0, sp, #0xc
	blx FUN_020CCF80
	movs r1, #2
	lsls r1, r1, #0xe
	cmp r0, r1
	bge _0225EB74
	cmp r0, #0
	beq _0225EB70
	add r0, sp, #0xc
	adds r1, r0, #0
	blx FUN_020CCFE0
	ldr r3, [sp, #0xc]
	asrs r1, r3, #0x1f
	lsrs r0, r3, #0x11
	lsls r2, r1, #0xf
	orrs r2, r0
	movs r0, #2
	lsls r3, r3, #0xf
	movs r1, #0
	lsls r0, r0, #0xa
	adds r3, r3, r0
	adcs r2, r1
	lsls r2, r2, #0x14
	lsrs r3, r3, #0xc
	orrs r3, r2
	ldr r2, [sp, #0x14]
	str r3, [sp, #0xc]
	asrs r3, r2, #0x1f
	lsrs r6, r2, #0x11
	lsls r3, r3, #0xf
	orrs r3, r6
	lsls r2, r2, #0xf
	adds r2, r2, r0
	adcs r3, r1
	lsls r0, r3, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [sp, #0x14]
	b _0225EBBC
_0225EB70:
	movs r4, #1
	b _0225EBBC
_0225EB74:
	ldr r1, _0225EC6C @ =0x0001E200
	cmp r0, r1
	ble _0225EBBC
	add r0, sp, #0xc
	adds r1, r0, #0
	blx FUN_020CCFE0
	ldr r0, [sp, #0xc]
	ldr r2, _0225EC6C @ =0x0001E200
	asrs r1, r0, #0x1f
	movs r3, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	ldr r0, [sp, #0x14]
	str r1, [sp, #0xc]
	ldr r2, _0225EC6C @ =0x0001E200
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [sp, #0x14]
_0225EBBC:
	cmp r4, #0
	bne _0225EC46
	movs r0, #0x26
	lsls r0, r0, #0xc
	str r0, [sp, #0x10]
	add r0, sp, #0xc
	blx FUN_020CCF80
	ldr r2, _0225EC70 @ =0x0000099A
	asrs r1, r0, #0x1f
	movs r3, #0
	str r0, [sp, #0x18]
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	add r0, sp, #0xc
	str r1, [sp, #0x18]
	adds r1, r0, #0
	blx FUN_020CCFE0
	add r2, sp, #0
	movs r0, #0
	movs r1, #2
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	add r2, sp, #0x1c
	bl ov91_02260400
	movs r0, #0
	str r0, [sp, #0x20]
	add r2, sp, #0
	add r0, sp, #0x1c
	ldrh r2, [r2, #8]
	ldr r3, [r5, #0x10]
	adds r1, r0, #0
	bl ov91_0226045C
	add r2, sp, #0
	add r0, sp, #0xc
	ldrh r2, [r2, #8]
	ldr r3, [r5, #0x10]
	adds r1, r0, #0
	bl ov91_0226045C
	ldr r0, [r5, #0x1c]
	cmp r0, #5
	blt _0225EC2E
	movs r0, #1
	str r0, [sp, #0x2c]
	b _0225EC32
_0225EC2E:
	movs r0, #0
	str r0, [sp, #0x2c]
_0225EC32:
	adds r0, r5, #0
	add r1, sp, #8
	movs r2, #1
	bl ov91_0225E2E4
	ldr r0, _0225EC74 @ =0x0000064F
	bl FUN_0200604C
	b _0225EC46
_0225EC44:
	movs r4, #1
_0225EC46:
	cmp r4, #1
	bne _0225EC5C
	add r3, sp, #0
	movs r1, #0
	movs r2, #2
	ldr r0, _0225EC78 @ =0x0000854C
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	adds r0, r5, r0
	bl ov91_02260E88
_0225EC5C:
	adds r0, r5, #0
	bl ov91_0225EE9C
	movs r0, #0
	str r0, [r5, #0x48]
	add sp, #0x30
	pop {r4, r5, r6, pc}
	nop
_0225EC6C: .4byte 0x0001E200
_0225EC70: .4byte 0x0000099A
_0225EC74: .4byte 0x0000064F
_0225EC78: .4byte 0x0000854C
	thumb_func_end ov91_0225EA98

	thumb_func_start ov91_0225EC7C
ov91_0225EC7C: @ 0x0225EC7C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x20]
	cmp r1, #0
	bne _0225ECA4
	bl ov91_0225ED6C
	cmp r0, #1
	bne _0225ECA4
	movs r0, #1
	str r0, [r4, #0x20]
	ldr r0, _0225ED5C @ =0x00008544
	adds r0, r4, r0
	bl ov91_02260CB4
	ldr r0, _0225ED60 @ =0x000021A8
	adds r0, r4, r0
	bl ov91_022614D4
_0225ECA4:
	ldr r0, [r4, #0x20]
	cmp r0, #1
	bne _0225ED56
	ldr r1, _0225ED64 @ =0x000086EC
	ldrh r0, [r4, r1]
	cmp r0, #1
	bne _0225ECDA
	adds r0, r1, #2
	ldrh r0, [r4, r0]
	add r2, sp, #0
	mov r3, sp
	strh r0, [r2]
	adds r0, r1, #4
	ldrh r0, [r4, r0]
	subs r3, r3, #4
	adds r4, #0x20
	strh r0, [r2, #2]
	ldrh r1, [r2]
	adds r0, r4, #0
	strh r1, [r3]
	ldrh r1, [r2, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov91_0225EDC8
	add sp, #4
	pop {r3, r4, pc}
_0225ECDA:
	cmp r0, #2
	blo _0225ED34
	adds r0, r1, #2
	ldrh r0, [r4, r0]
	add r2, sp, #0
	mov r3, sp
	strh r0, [r2]
	adds r0, r1, #4
	ldrh r0, [r4, r0]
	subs r3, r3, #4
	strh r0, [r2, #2]
	ldrh r1, [r2]
	adds r0, r4, #0
	adds r0, #0x20
	strh r1, [r3]
	ldrh r1, [r2, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov91_0225EDC8
	ldr r0, _0225ED64 @ =0x000086EC
	ldrh r1, [r4, r0]
	subs r1, r1, #1
	lsls r1, r1, #3
	adds r3, r4, r1
	adds r1, r0, #2
	ldrh r2, [r3, r1]
	add r1, sp, #0
	adds r0, r0, #4
	strh r2, [r1]
	ldrh r0, [r3, r0]
	mov r3, sp
	subs r3, r3, #4
	strh r0, [r1, #2]
	ldrh r2, [r1]
	adds r4, #0x20
	adds r0, r4, #0
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov91_0225EDC8
	add sp, #4
	pop {r3, r4, pc}
_0225ED34:
	ldr r0, _0225ED68 @ =0x021D114C
	mov r3, sp
	ldrh r2, [r0, #0x20]
	add r1, sp, #0
	subs r3, r3, #4
	strh r2, [r1]
	ldrh r0, [r0, #0x22]
	adds r4, #0x20
	strh r0, [r1, #2]
	ldrh r2, [r1]
	adds r0, r4, #0
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov91_0225EDC8
_0225ED56:
	add sp, #4
	pop {r3, r4, pc}
	nop
_0225ED5C: .4byte 0x00008544
_0225ED60: .4byte 0x000021A8
_0225ED64: .4byte 0x000086EC
_0225ED68: .4byte 0x021D114C
	thumb_func_end ov91_0225EC7C

	thumb_func_start ov91_0225ED6C
ov91_0225ED6C: @ 0x0225ED6C
	push {r3, lr}
	ldr r0, [r0, #0x48]
	cmp r0, #2
	bhs _0225ED78
	movs r0, #0
	pop {r3, pc}
_0225ED78:
	ldr r1, _0225EDA8 @ =0x021D114C
	movs r0, #0x80
	ldrh r2, [r1, #0x20]
	ldrh r1, [r1, #0x22]
	subs r3, r0, r2
	subs r0, #0xe0
	subs r2, r0, r1
	adds r1, r3, #0
	adds r0, r2, #0
	muls r1, r3, r1
	muls r0, r2, r0
	adds r0, r1, r0
	lsls r0, r0, #0xc
	blx FUN_020CCBEC
	asrs r1, r0, #0xc
	ldr r0, _0225EDAC @ =0x0000011E
	cmp r1, r0
	bgt _0225EDA2
	movs r0, #1
	pop {r3, pc}
_0225EDA2:
	movs r0, #0
	pop {r3, pc}
	nop
_0225EDA8: .4byte 0x021D114C
_0225EDAC: .4byte 0x0000011E
	thumb_func_end ov91_0225ED6C

	thumb_func_start ov91_0225EDB0
ov91_0225EDB0: @ 0x0225EDB0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r4, #4
	movs r1, #0
	movs r2, #0x20
	blx FUN_020E5B44
	movs r0, #0
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov91_0225EDB0

	thumb_func_start ov91_0225EDC8
ov91_0225EDC8: @ 0x0225EDC8
	push {r0, r1, r2, r3}
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r1, [r4, #0x26]
	adds r1, r1, #1
	lsrs r3, r1, #0x1f
	lsls r2, r1, #0x1d
	subs r2, r2, r3
	movs r1, #0x1d
	rors r2, r1
	ldrh r1, [r4, #0x24]
	adds r2, r3, r2
	cmp r2, r1
	bne _0225EDEC
	add r1, sp, #0
	bl ov91_0225EE18
_0225EDEC:
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #2
	adds r2, r4, r0
	add r0, sp, #0x10
	ldrh r1, [r0, #4]
	strh r1, [r2, #4]
	ldrh r0, [r0, #6]
	strh r0, [r2, #6]
	ldrh r0, [r4, #0x26]
	adds r0, r0, #1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1d
	subs r1, r1, r2
	movs r0, #0x1d
	rors r1, r0
	adds r0, r2, r1
	strh r0, [r4, #0x26]
	add sp, #4
	pop {r3, r4}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov91_0225EDC8

	thumb_func_start ov91_0225EE18
ov91_0225EE18: @ 0x0225EE18
	ldrh r3, [r0, #0x24]
	ldrh r2, [r0, #0x26]
	cmp r2, r3
	bne _0225EE24
	movs r0, #0
	bx lr
_0225EE24:
	lsls r2, r3, #2
	adds r3, r0, r2
	ldrh r2, [r3, #4]
	strh r2, [r1]
	ldrh r2, [r3, #6]
	strh r2, [r1, #2]
	ldrh r1, [r0, #0x24]
	adds r1, r1, #1
	lsrs r3, r1, #0x1f
	lsls r2, r1, #0x1d
	subs r2, r2, r3
	movs r1, #0x1d
	rors r2, r1
	adds r1, r3, r2
	strh r1, [r0, #0x24]
	movs r0, #1
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225EE18

	thumb_func_start ov91_0225EE48
ov91_0225EE48: @ 0x0225EE48
	ldrh r3, [r0, #0x24]
	ldrh r2, [r0, #0x26]
	cmp r2, r3
	bne _0225EE54
	movs r0, #0
	bx lr
_0225EE54:
	lsls r2, r3, #2
	adds r2, r0, r2
	ldrh r0, [r2, #4]
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #2]
	movs r0, #1
	bx lr
	thumb_func_end ov91_0225EE48

	thumb_func_start ov91_0225EE64
ov91_0225EE64: @ 0x0225EE64
	ldrh r3, [r0, #0x26]
	ldrh r2, [r0, #0x24]
	cmp r3, r2
	bne _0225EE70
	movs r0, #0
	bx lr
_0225EE70:
	subs r2, r3, #1
	bpl _0225EE76
	adds r2, #8
_0225EE76:
	lsls r2, r2, #2
	adds r2, r0, r2
	ldrh r0, [r2, #4]
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #2]
	movs r0, #1
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225EE64

	thumb_func_start ov91_0225EE88
ov91_0225EE88: @ 0x0225EE88
	ldrh r2, [r0, #0x26]
	ldrh r1, [r0, #0x24]
	cmp r1, r2
	bls _0225EE98
	movs r0, #8
	subs r0, r0, r1
	adds r0, r0, r2
	bx lr
_0225EE98:
	subs r0, r2, r1
	bx lr
	thumb_func_end ov91_0225EE88

	thumb_func_start ov91_0225EE9C
ov91_0225EE9C: @ 0x0225EE9C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x20
	bl ov91_0225EDB0
	ldr r0, _0225EEB8 @ =0x00008544
	adds r0, r4, r0
	bl ov91_02260D00
	pop {r4, pc}
	nop
_0225EEB8: .4byte 0x00008544
	thumb_func_end ov91_0225EE9C

	thumb_func_start ov91_0225EEBC
ov91_0225EEBC: @ 0x0225EEBC
	push {r3, lr}
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [r3, #0x48]
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0
	bl ov91_0225F05C
	pop {r3, pc}
	thumb_func_end ov91_0225EEBC

	thumb_func_start ov91_0225EED0
ov91_0225EED0: @ 0x0225EED0
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r0, #0
	adds r2, r3, #0
	adds r0, r4, #0
	adds r1, r6, #0
	add r3, sp, #0x18
	bl ov91_0225F05C
	add r2, sp, #0x30
	ldrh r2, [r2, #0x10]
	adds r0, r4, #0
	adds r1, r6, #0
	add r3, sp, #0
	bl ov91_0225F05C
	adds r2, r5, #0
	add r3, sp, #0x18
	adds r2, #0x18
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	add r3, sp, #0x18
	adds r2, r5, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r1, [sp]
	ldr r0, [sp, #0x18]
	subs r0, r1, r0
	str r0, [r5, #0x30]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x20]
	subs r0, r1, r0
	str r0, [r5, #0x38]
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x28]
	subs r0, r1, r0
	str r0, [r5, #0x40]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x2c]
	subs r0, r1, r0
	str r0, [r5, #0x44]
	ldr r2, [sp, #4]
	ldr r0, _0225EF6C @ =0x0000FFFF
	ldr r3, [sp, #0x1c]
	adds r0, r2, r0
	subs r1, r0, r3
	subs r0, r2, r3
	cmp r0, r1
	bge _0225EF4A
	str r0, [r5, #0x34]
	b _0225EF4C
_0225EF4A:
	str r1, [r5, #0x34]
_0225EF4C:
	ldr r2, [sp, #0xc]
	ldr r0, _0225EF6C @ =0x0000FFFF
	ldr r3, [sp, #0x24]
	adds r0, r2, r0
	subs r1, r0, r3
	subs r0, r2, r3
	cmp r0, r1
	bge _0225EF60
	str r0, [r5, #0x3c]
	b _0225EF62
_0225EF60:
	str r1, [r5, #0x3c]
_0225EF62:
	movs r0, #0
	str r0, [r5, #0x48]
	add sp, #0x30
	pop {r4, r5, r6, pc}
	nop
_0225EF6C: .4byte 0x0000FFFF
	thumb_func_end ov91_0225EED0

	thumb_func_start ov91_0225EF70
ov91_0225EF70: @ 0x0225EF70
	push {r3, r4}
	ldr r1, [r0, #0x48]
	cmp r1, #0x10
	blt _0225EF7E
	movs r0, #1
	pop {r3, r4}
	bx lr
_0225EF7E:
	adds r2, r1, #1
	str r2, [r0, #0x48]
	ldr r1, [r0, #0x30]
	ldr r3, [r0, #0x18]
	muls r2, r1, r2
	asrs r1, r2, #3
	lsrs r1, r1, #0x1c
	adds r1, r2, r1
	asrs r1, r1, #4
	adds r1, r3, r1
	str r1, [r0]
	ldr r2, [r0, #0x34]
	ldr r1, [r0, #0x48]
	adds r3, r2, #0
	muls r3, r1, r3
	asrs r1, r3, #3
	lsrs r1, r1, #0x1c
	adds r1, r3, r1
	ldr r4, [r0, #0x1c]
	asrs r1, r1, #4
	adds r1, r4, r1
	str r1, [r0, #4]
	ldr r2, [r0, #0x38]
	ldr r1, [r0, #0x48]
	adds r3, r2, #0
	muls r3, r1, r3
	asrs r1, r3, #3
	lsrs r1, r1, #0x1c
	adds r1, r3, r1
	ldr r4, [r0, #0x20]
	asrs r1, r1, #4
	adds r1, r4, r1
	str r1, [r0, #8]
	ldr r2, [r0, #0x3c]
	ldr r1, [r0, #0x48]
	adds r3, r2, #0
	muls r3, r1, r3
	asrs r1, r3, #3
	lsrs r1, r1, #0x1c
	adds r1, r3, r1
	ldr r4, [r0, #0x24]
	asrs r1, r1, #4
	adds r1, r4, r1
	str r1, [r0, #0xc]
	ldr r2, [r0, #0x40]
	ldr r1, [r0, #0x48]
	adds r3, r2, #0
	muls r3, r1, r3
	asrs r1, r3, #3
	lsrs r1, r1, #0x1c
	adds r1, r3, r1
	ldr r4, [r0, #0x28]
	asrs r1, r1, #4
	adds r1, r4, r1
	str r1, [r0, #0x10]
	ldr r2, [r0, #0x44]
	ldr r1, [r0, #0x48]
	adds r3, r2, #0
	muls r3, r1, r3
	asrs r1, r3, #3
	lsrs r1, r1, #0x1c
	adds r1, r3, r1
	ldr r4, [r0, #0x2c]
	asrs r1, r1, #4
	adds r1, r4, r1
	str r1, [r0, #0x14]
	movs r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov91_0225EF70

	thumb_func_start ov91_0225F008
ov91_0225F008: @ 0x0225F008
	ldr r3, _0225F00C @ =ov91_0225F010
	bx r3
	.align 2, 0
_0225F00C: .4byte ov91_0225F010
	thumb_func_end ov91_0225F008

	thumb_func_start ov91_0225F010
ov91_0225F010: @ 0x0225F010
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, [r4, #4]
	adds r5, r0, #0
	ldr r0, _0225F054 @ =0x000019CC
	lsls r1, r1, #0x10
	adds r0, r5, r0
	lsrs r1, r1, #0x10
	bl ov91_0225E1E0
	ldr r0, _0225F058 @ =0x00001AB4
	ldr r1, [r4, #8]
	adds r0, r5, r0
	bl ov91_0226137C
	ldr r1, [r4, #0xc]
	ldr r0, _0225F058 @ =0x00001AB4
	lsls r1, r1, #0x10
	adds r0, r5, r0
	lsrs r1, r1, #0x10
	bl ov91_02261384
	ldr r0, _0225F054 @ =0x000019CC
	ldr r1, [r4, #0x10]
	adds r0, r5, r0
	bl ov91_0225E1E4
	ldr r0, _0225F054 @ =0x000019CC
	ldr r1, [r4, #0x14]
	adds r0, r5, r0
	bl ov91_0225E09C
	pop {r3, r4, r5, pc}
	nop
_0225F054: .4byte 0x000019CC
_0225F058: .4byte 0x00001AB4
	thumb_func_end ov91_0225F010

	thumb_func_start ov91_0225F05C
ov91_0225F05C: @ 0x0225F05C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r6, r2, #0
	adds r7, r1, #0
	adds r4, r3, #0
	cmp r6, r0
	blo _0225F070
	bl FUN_0202551C
_0225F070:
	movs r0, #0x18
	ldr r1, [r5, #4]
	muls r0, r6, r0
	adds r3, r1, r0
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r4, #4]
	ldr r0, [r4, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r4, #0xc]
	ldrb r0, [r7]
	cmp r0, #0
	beq _0225F0B2
	adds r1, r6, #1
	movs r0, #6
	subs r2, r0, r1
	bpl _0225F0A6
	movs r2, #0
_0225F0A6:
	movs r0, #0x18
	ldr r1, [r5, #4]
	muls r0, r2, r0
	adds r0, r1, r0
	ldr r0, [r0, #0x14]
	str r0, [r4, #0x14]
_0225F0B2:
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _0225F0BE
	ldr r0, [r4, #4]
	rsbs r0, r0, #0
	str r0, [r4, #4]
_0225F0BE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225F05C

	thumb_func_start ov91_0225F0C0
ov91_0225F0C0: @ 0x0225F0C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	adds r4, r1, #0
	adds r6, r2, #0
	movs r1, #0
	movs r2, #0x40
	adds r5, r0, #0
	blx FUN_020E5B44
	movs r0, #0xc8
	adds r1, r6, #0
	bl FUN_02007688
	movs r1, #0x78
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r1, #0xd0
	ldr r0, [r4, r1]
	adds r1, r7, #0
	movs r2, #0x15
	movs r3, #0
	bl FUN_0200A3C8
	str r0, [r5]
	movs r1, #0x78
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	adds r1, #0xd4
	ldr r0, [r4, r1]
	adds r1, r7, #0
	movs r2, #0x14
	movs r3, #0
	bl FUN_0200A480
	str r0, [r5, #4]
	movs r1, #0x78
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r1, #0xd8
	ldr r0, [r4, r1]
	adds r1, r7, #0
	movs r2, #0x16
	movs r3, #0
	bl FUN_0200A540
	str r0, [r5, #8]
	movs r1, #0x78
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r1, #0xdc
	ldr r0, [r4, r1]
	adds r1, r7, #0
	movs r2, #0x17
	movs r3, #0
	bl FUN_0200A540
	str r0, [r5, #0xc]
	ldr r0, [r5]
	bl FUN_0200AE18
	cmp r0, #0
	bne _0225F154
	bl FUN_0202551C
_0225F154:
	ldr r0, [r5, #4]
	bl FUN_0200B00C
	cmp r0, #0
	bne _0225F162
	bl FUN_0202551C
_0225F162:
	ldr r0, [r5]
	bl FUN_0200A740
	ldr r0, [r5, #4]
	bl FUN_0200A740
	movs r1, #0x78
	adds r0, r1, #0
	adds r2, r1, #0
	str r1, [sp]
	subs r0, #0x79
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r2, #0xd0
	ldr r2, [r4, r2]
	adds r3, r1, #0
	str r2, [sp, #0x14]
	adds r2, r1, #0
	adds r2, #0xd4
	ldr r2, [r4, r2]
	str r2, [sp, #0x18]
	adds r2, r1, #0
	adds r2, #0xd8
	ldr r2, [r4, r2]
	str r2, [sp, #0x1c]
	adds r2, r1, #0
	adds r2, #0xdc
	ldr r2, [r4, r2]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r5, #0
	adds r0, #0x10
	adds r2, r1, #0
	bl FUN_02009D48
	ldr r0, [r4, #0x1c]
	str r0, [sp, #0x2c]
	adds r0, r5, #0
	adds r0, #0x10
	str r0, [sp, #0x30]
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [sp, #0x34]
	movs r0, #0x9e
	lsls r0, r0, #0xe
	str r0, [sp, #0x38]
	movs r0, #0
	str r0, [sp, #0x40]
	movs r0, #2
	str r0, [sp, #0x44]
	add r0, sp, #0x2c
	str r6, [sp, #0x48]
	bl FUN_02024714
	movs r1, #0
	str r0, [r5, #0x34]
	bl FUN_02024830
	adds r0, r7, #0
	bl FUN_0200770C
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225F0C0

	thumb_func_start ov91_0225F1E8
ov91_0225F1E8: @ 0x0225F1E8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r4, r1, #0
	bl FUN_02024758
	ldr r0, [r5]
	bl FUN_0200AEB0
	ldr r0, [r5, #4]
	bl FUN_0200B0A8
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5]
	bl FUN_0200A75C
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5, #4]
	bl FUN_0200A75C
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r5, #8]
	bl FUN_0200A75C
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5, #0xc]
	bl FUN_0200A75C
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x40
	blx FUN_020E5B44
	pop {r3, r4, r5, pc}
	thumb_func_end ov91_0225F1E8

	thumb_func_start ov91_0225F23C
ov91_0225F23C: @ 0x0225F23C
	adds r2, r0, #0
	movs r1, #1
	adds r2, #0x38
	strb r1, [r2]
	adds r2, r0, #0
	movs r3, #0
	adds r2, #0x3a
	strb r3, [r2]
	adds r2, r0, #0
	adds r2, #0x39
	strb r3, [r2]
	ldr r3, _0225F258 @ =FUN_02024830
	ldr r0, [r0, #0x34]
	bx r3
	.align 2, 0
_0225F258: .4byte FUN_02024830
	thumb_func_end ov91_0225F23C

	thumb_func_start ov91_0225F25C
ov91_0225F25C: @ 0x0225F25C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #3
	bhi _0225F36A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225F278: @ jump table
	.2byte _0225F280 - _0225F278 - 2 @ case 0
	.2byte _0225F2B2 - _0225F278 - 2 @ case 1
	.2byte _0225F340 - _0225F278 - 2 @ case 2
	.2byte _0225F352 - _0225F278 - 2 @ case 3
_0225F280:
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl FUN_020249D4
	ldr r0, _0225F37C @ =0x00008544
	adds r0, r5, r0
	bl ov91_02260CB4
	ldr r0, _0225F37C @ =0x00008544
	movs r1, #0x80
	adds r0, r5, r0
	movs r2, #0xb1
	bl ov91_02260CE0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x3b
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	adds r4, #0x3a
	adds r0, r0, #1
	strb r0, [r4]
	b _0225F36A
_0225F2B2:
	movs r1, #2
	ldr r0, [r4, #0x34]
	lsls r1, r1, #0xc
	bl FUN_020249B0
	ldr r0, [r4, #0x34]
	bl FUN_020249F8
	adds r6, r0, #0
	cmp r6, #0xa
	beq _0225F2CE
	cmp r6, #0xb
	beq _0225F2FA
	b _0225F32E
_0225F2CE:
	adds r0, r4, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225F32E
	movs r0, #0x40
	str r0, [sp]
	movs r0, #2
	movs r1, #0x80
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x60
	adds r3, r1, #0
	bl ov91_0225D500
	ldr r0, _0225F380 @ =0x0000064F
	bl FUN_0200604C
	movs r0, #1
	adds r4, #0x3b
	strb r0, [r4]
	b _0225F32E
_0225F2FA:
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x39
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #2
	blo _0225F31A
	movs r0, #3
	adds r4, #0x3a
	strb r0, [r4]
	b _0225F326
_0225F31A:
	adds r0, r4, #0
	movs r1, #2
	adds r0, #0x3a
	strb r1, [r0]
	movs r0, #0x10
	str r0, [r4, #0x3c]
_0225F326:
	ldr r0, _0225F37C @ =0x00008544
	adds r0, r5, r0
	bl ov91_02260D00
_0225F32E:
	ldr r2, _0225F384 @ =0x02261C84
	lsls r3, r6, #1
	ldr r0, _0225F37C @ =0x00008544
	ldrsh r2, [r2, r3]
	adds r0, r5, r0
	movs r1, #0x80
	bl ov91_02260CE0
	b _0225F36A
_0225F340:
	ldr r0, [r4, #0x3c]
	subs r0, r0, #1
	str r0, [r4, #0x3c]
	cmp r0, #0
	bgt _0225F36A
	movs r0, #0
	adds r4, #0x3a
	strb r0, [r4]
	b _0225F36A
_0225F352:
	adds r0, r5, #0
	bl ov91_0225E6D0
	cmp r0, #0
	bne _0225F36A
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl FUN_02024830
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225F36A:
	adds r0, r5, #0
	bl ov91_0225E40C
	adds r0, r5, #0
	bl ov91_0225E62C
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225F37C: .4byte 0x00008544
_0225F380: .4byte 0x0000064F
_0225F384: .4byte 0x02261C84
	thumb_func_end ov91_0225F25C

	thumb_func_start ov91_0225F388
ov91_0225F388: @ 0x0225F388
	adds r3, r0, #0
	movs r2, #0x18
	movs r1, #0
_0225F38E:
	strb r1, [r3]
	adds r3, r3, #1
	subs r2, r2, #1
	bne _0225F38E
	ldr r1, _0225F39C @ =0x0000FFFF
	str r1, [r0, #0x14]
	bx lr
	.align 2, 0
_0225F39C: .4byte 0x0000FFFF
	thumb_func_end ov91_0225F388

	thumb_func_start ov91_0225F3A0
ov91_0225F3A0: @ 0x0225F3A0
	push {r3, r4}
	lsls r3, r2, #2
	str r1, [r0, r3]
	movs r3, #1
	ldr r4, [r0, #0x10]
	lsls r3, r2
	orrs r3, r4
	str r3, [r0, #0x10]
	cmp r1, #0
	beq _0225F3CC
	ldr r4, [r0, #0x14]
	ldr r3, _0225F3D0 @ =0x0000FFFF
	cmp r4, r3
	beq _0225F3CA
	lsls r3, r4, #2
	ldr r3, [r0, r3]
	cmp r3, r1
	bhs _0225F3CC
	str r2, [r0, #0x14]
	pop {r3, r4}
	bx lr
_0225F3CA:
	str r2, [r0, #0x14]
_0225F3CC:
	pop {r3, r4}
	bx lr
	.align 2, 0
_0225F3D0: .4byte 0x0000FFFF
	thumb_func_end ov91_0225F3A0

	thumb_func_start ov91_0225F3D4
ov91_0225F3D4: @ 0x0225F3D4
	movs r1, #0
	str r1, [r0, #0x10]
	ldr r1, _0225F3E0 @ =0x0000FFFF
	str r1, [r0, #0x14]
	bx lr
	nop
_0225F3E0: .4byte 0x0000FFFF
	thumb_func_end ov91_0225F3D4

	thumb_func_start ov91_0225F3E4
ov91_0225F3E4: @ 0x0225F3E4
	ldr r0, [r0, #0x14]
	bx lr
	thumb_func_end ov91_0225F3E4

	thumb_func_start ov91_0225F3E8
ov91_0225F3E8: @ 0x0225F3E8
	push {r4, r5}
	movs r4, #0
	ldr r5, [r0, #0x10]
	adds r3, r4, #0
	movs r0, #1
_0225F3F2:
	adds r2, r0, #0
	lsls r2, r3
	tst r2, r5
	beq _0225F3FC
	adds r4, r4, #1
_0225F3FC:
	adds r3, r3, #1
	cmp r3, #4
	blt _0225F3F2
	cmp r1, r4
	bhi _0225F40C
	movs r0, #1
	pop {r4, r5}
	bx lr
_0225F40C:
	movs r0, #0
	pop {r4, r5}
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225F3E8

	thumb_func_start ov91_0225F414
ov91_0225F414: @ 0x0225F414
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0225F430 @ =0x02261D84
	add r3, sp, #0
	movs r2, #5
_0225F41E:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0225F41E
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_0225F430: .4byte 0x02261D84
	thumb_func_end ov91_0225F414

	thumb_func_start ov91_0225F434
ov91_0225F434: @ 0x0225F434
	push {r3, lr}
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r0, _0225F4A4 @ =0x04000008
	movs r1, #3
	ldrh r2, [r0]
	bics r2, r1
	movs r1, #2
	orrs r1, r2
	strh r1, [r0]
	adds r0, #0x58
	ldrh r2, [r0]
	ldr r1, _0225F4A8 @ =0xFFFFCFFD
	ands r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	adds r2, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _0225F4AC @ =0x0000CFFB
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
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	blx FUN_020CF82C
	movs r1, #0
	ldr r0, _0225F4B0 @ =0x00006B5A
	ldr r2, _0225F4B4 @ =0x00007FFF
	movs r3, #0x3f
	str r1, [sp]
	blx FUN_020CF910
	ldr r1, _0225F4B8 @ =0xBFFF0000
	ldr r0, _0225F4BC @ =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_0225F4A4: .4byte 0x04000008
_0225F4A8: .4byte 0xFFFFCFFD
_0225F4AC: .4byte 0x0000CFFB
_0225F4B0: .4byte 0x00006B5A
_0225F4B4: .4byte 0x00007FFF
_0225F4B8: .4byte 0xBFFF0000
_0225F4BC: .4byte 0x04000580
	thumb_func_end ov91_0225F434

	thumb_func_start ov91_0225F4C0
ov91_0225F4C0: @ 0x0225F4C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #4
	str r0, [sp]
	ldr r0, _0225F4F4 @ =ov91_0225F434
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	movs r1, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #1
	adds r3, r1, #0
	bl FUN_02026EB4
	str r0, [r5, #0x18]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r4, #0
	bl ov91_0225FD2C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225F4F4: .4byte ov91_0225F434
	thumb_func_end ov91_0225F4C0

	thumb_func_start ov91_0225F4F8
ov91_0225F4F8: @ 0x0225F4F8
	push {r4, lr}
	adds r4, r0, #0
	bl ov91_0225FDC8
	ldr r0, [r4, #0x18]
	bl FUN_02026F54
	pop {r4, pc}
	thumb_func_end ov91_0225F4F8

	thumb_func_start ov91_0225F508
ov91_0225F508: @ 0x0225F508
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0225F638 @ =0x000086CC
	movs r2, #0x20
	adds r0, r5, r0
	adds r4, r1, #0
	bl FUN_0201AC14
	bl ov91_0225F414
	ldr r0, _0225F63C @ =0x00001AB4
	ldr r1, [r5, #0x10]
	ldr r2, [r5, #0x14]
	adds r0, r5, r0
	adds r3, r4, #0
	bl ov91_0225F4C0
	ldr r0, _0225F63C @ =0x00001AB4
	adds r1, r4, #0
	adds r0, r5, r0
	bl ov91_0225F878
	ldr r0, _0225F63C @ =0x00001AB4
	adds r1, r4, #0
	adds r0, r5, r0
	bl ov91_0225FA9C
	ldr r0, _0225F63C @ =0x00001AB4
	adds r1, r4, #0
	adds r0, r5, r0
	bl ov91_0225FCD8
	movs r0, #0xbd
	adds r1, r4, #0
	bl FUN_02007688
	adds r6, r0, #0
	ldr r0, _0225F63C @ =0x00001AB4
	adds r1, r6, #0
	adds r0, r5, r0
	adds r2, r4, #0
	bl ov91_0225FB80
	ldr r0, [r5, #0x14]
	ldr r1, _0225F63C @ =0x00001AB4
	str r0, [sp]
	ldr r0, _0225F638 @ =0x000086CC
	str r4, [sp, #4]
	adds r0, r5, r0
	str r0, [sp, #8]
	ldr r0, _0225F640 @ =0x00001C54
	ldr r3, [r5, #0x10]
	adds r0, r5, r0
	adds r1, r5, r1
	adds r2, r6, #0
	bl ov91_02260F50
	ldr r0, _0225F644 @ =0x00001F74
	ldr r3, _0225F638 @ =0x000086CC
	adds r0, r5, r0
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, r3
	bl ov91_0225FF00
	ldr r0, _0225F63C @ =0x00001AB4
	adds r1, r6, #0
	adds r0, r5, r0
	adds r2, r4, #0
	bl ov91_022604F4
	ldr r0, _0225F63C @ =0x00001AB4
	ldr r1, _0225F648 @ =0x00008544
	ldr r2, [r5, #0x14]
	adds r0, r5, r0
	adds r1, r5, r1
	adds r3, r4, #0
	bl ov91_02260C48
	ldr r0, _0225F63C @ =0x00001AB4
	ldr r1, _0225F64C @ =0x0000854C
	ldr r2, [r5, #0x14]
	adds r0, r5, r0
	adds r1, r5, r1
	adds r3, r4, #0
	bl ov91_02260D14
	ldr r0, _0225F63C @ =0x00001AB4
	ldr r2, [r5, #0x14]
	adds r0, r5, r0
	adds r1, r6, #0
	adds r3, r4, #0
	bl ov91_0225FDE0
	ldr r0, [r5, #0x14]
	ldr r1, _0225F63C @ =0x00001AB4
	str r0, [sp]
	str r6, [sp, #4]
	str r4, [sp, #8]
	ldr r2, _0225F650 @ =0x0000877C
	ldr r0, _0225F654 @ =0x00001F38
	ldr r2, [r5, r2]
	ldr r3, [r5, #0x10]
	adds r0, r5, r0
	adds r1, r5, r1
	bl ov91_0225D8F0
	ldr r0, _0225F63C @ =0x00001AB4
	ldr r1, [r5, #0x10]
	ldr r2, [r5, #0x14]
	adds r0, r5, r0
	adds r3, r4, #0
	bl ov91_0225DBD0
	str r4, [sp]
	ldr r0, _0225F658 @ =0x00001E38
	ldr r1, _0225F63C @ =0x00001AB4
	ldr r2, [r5, #0x10]
	ldr r3, [r5, #0x14]
	adds r0, r5, r0
	adds r1, r5, r1
	bl ov91_0225D628
	ldr r1, [r5, #0x14]
	ldr r0, _0225F65C @ =0x000021A8
	lsls r1, r1, #0x18
	adds r0, r5, r0
	lsrs r1, r1, #0x18
	bl ov91_022613AC
	ldr r0, _0225F660 @ =0x0000862C
	ldr r1, _0225F63C @ =0x00001AB4
	adds r0, r5, r0
	adds r1, r5, r1
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov91_02261580
	adds r0, r6, #0
	bl FUN_0200770C
	ldr r0, _0225F664 @ =0x00001AD0
	adds r1, r4, #0
	ldr r0, [r5, r0]
	bl FUN_02258BD4
	ldr r1, _0225F668 @ =0x000021A4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0225F638: .4byte 0x000086CC
_0225F63C: .4byte 0x00001AB4
_0225F640: .4byte 0x00001C54
_0225F644: .4byte 0x00001F74
_0225F648: .4byte 0x00008544
_0225F64C: .4byte 0x0000854C
_0225F650: .4byte 0x0000877C
_0225F654: .4byte 0x00001F38
_0225F658: .4byte 0x00001E38
_0225F65C: .4byte 0x000021A8
_0225F660: .4byte 0x0000862C
_0225F664: .4byte 0x00001AD0
_0225F668: .4byte 0x000021A4
	thumb_func_end ov91_0225F508

	thumb_func_start ov91_0225F66C
ov91_0225F66C: @ 0x0225F66C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0225F71C @ =0x0000862C
	ldr r1, _0225F720 @ =0x00001AB4
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_02261790
	ldr r0, _0225F724 @ =0x00001E38
	ldr r1, _0225F720 @ =0x00001AB4
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_0225D67C
	ldr r0, _0225F720 @ =0x00001AB4
	ldr r1, [r4, #0x10]
	adds r0, r4, r0
	bl ov91_0225DBE0
	ldr r0, _0225F728 @ =0x00001F38
	ldr r1, _0225F720 @ =0x00001AB4
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_0225DB0C
	ldr r0, _0225F720 @ =0x00001AB4
	adds r0, r4, r0
	bl ov91_0225FEFC
	ldr r0, _0225F720 @ =0x00001AB4
	ldr r1, _0225F72C @ =0x0000854C
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_02260D80
	ldr r0, _0225F730 @ =0x00008544
	adds r0, r4, r0
	bl ov91_02260CA8
	ldr r0, _0225F720 @ =0x00001AB4
	adds r0, r4, r0
	bl ov91_0226066C
	ldr r0, _0225F734 @ =0x00001F74
	ldr r1, _0225F738 @ =0x000086CC
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov91_022600FC
	ldr r0, _0225F73C @ =0x00001C54
	ldr r1, _0225F720 @ =0x00001AB4
	ldr r2, _0225F738 @ =0x000086CC
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, r2
	bl ov91_02261070
	ldr r0, _0225F720 @ =0x00001AB4
	adds r0, r4, r0
	bl ov91_0225FC84
	ldr r0, _0225F740 @ =0x000021A4
	ldr r0, [r4, r0]
	bl FUN_02258C38
	ldr r0, _0225F720 @ =0x00001AB4
	adds r0, r4, r0
	bl ov91_0225FA60
	ldr r0, _0225F720 @ =0x00001AB4
	adds r0, r4, r0
	bl ov91_0225FB48
	ldr r0, _0225F720 @ =0x00001AB4
	adds r0, r4, r0
	bl ov91_0225FD0C
	ldr r0, _0225F720 @ =0x00001AB4
	adds r0, r4, r0
	bl ov91_0225F4F8
	ldr r0, _0225F744 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0225F748 @ =0x04001050
	strh r1, [r0]
	pop {r4, pc}
	nop
_0225F71C: .4byte 0x0000862C
_0225F720: .4byte 0x00001AB4
_0225F724: .4byte 0x00001E38
_0225F728: .4byte 0x00001F38
_0225F72C: .4byte 0x0000854C
_0225F730: .4byte 0x00008544
_0225F734: .4byte 0x00001F74
_0225F738: .4byte 0x000086CC
_0225F73C: .4byte 0x00001C54
_0225F740: .4byte 0x000021A4
_0225F744: .4byte 0x04000050
_0225F748: .4byte 0x04001050
	thumb_func_end ov91_0225F66C

	thumb_func_start ov91_0225F74C
ov91_0225F74C: @ 0x0225F74C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x13
	ldr r1, _0225F798 @ =0x000019CC
	lsls r0, r0, #6
	ldr r2, [r5]
	adds r0, r4, r0
	adds r1, r5, r1
	bl ov91_0226014C
	movs r0, #0x13
	ldr r1, _0225F798 @ =0x000019CC
	lsls r0, r0, #6
	ldr r2, [r5]
	adds r0, r4, r0
	adds r1, r5, r1
	bl ov91_022601AC
	ldr r0, _0225F79C @ =0x00006A90
	adds r0, r4, r0
	bl ov91_02260CC8
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov91_0225F7A8
	ldr r0, _0225F7A0 @ =0x000006F4
	adds r1, r4, #0
	adds r0, r4, r0
	bl ov91_022613C8
	ldr r0, _0225F7A4 @ =0x00006B78
	adds r0, r4, r0
	bl ov91_02261928
	pop {r3, r4, r5, pc}
	nop
_0225F798: .4byte 0x000019CC
_0225F79C: .4byte 0x00006A90
_0225F7A0: .4byte 0x000006F4
_0225F7A4: .4byte 0x00006B78
	thumb_func_end ov91_0225F74C

	thumb_func_start ov91_0225F7A8
ov91_0225F7A8: @ 0x0225F7A8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0225F868 @ =0x00006A98
	adds r4, r1, #0
	adds r0, r4, r0
	bl ov91_02260D98
	movs r0, #0xe1
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov91_0225D6A0
	bl FUN_02026E48
	adds r0, r4, #0
	bl ov91_0225FDD8
	movs r0, #0
	ldr r2, _0225F86C @ =0xFFFFF000
	adds r1, r0, #0
	adds r3, r0, #0
	blx FUN_020BF034
	ldr r1, _0225F870 @ =0x00007FFF
	movs r0, #0
	blx FUN_020BF070
	ldr r0, _0225F870 @ =0x00007FFF
	movs r2, #0
	adds r1, r0, #0
	blx FUN_020BF084
	ldr r0, _0225F870 @ =0x00007FFF
	movs r2, #0
	adds r1, r0, #0
	blx FUN_020BF0A8
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	movs r0, #0x1a
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov91_022610A8
	movs r2, #1
	movs r0, #0x12
	add r1, sp, #8
	str r2, [sp, #8]
	blx FUN_020C2528
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	movs r0, #0x13
	ldr r1, _0225F874 @ =0x000019CC
	lsls r0, r0, #6
	adds r0, r4, r0
	adds r1, r5, r1
	bl ov91_0226023C
	movs r2, #1
	movs r0, #0x12
	add r1, sp, #4
	str r2, [sp, #4]
	blx FUN_020C2528
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	ldr r1, [r5, #0x10]
	adds r0, r4, #0
	bl ov91_0226078C
	movs r2, #1
	movs r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	blx FUN_020C2528
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
	ldr r0, [r4, #0x1c]
	bl FUN_0202457C
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0225F868: .4byte 0x00006A98
_0225F86C: .4byte 0xFFFFF000
_0225F870: .4byte 0x00007FFF
_0225F874: .4byte 0x000019CC
	thumb_func_end ov91_0225F7A8

	thumb_func_start ov91_0225F878
ov91_0225F878: @ 0x0225F878
	push {r4, r5, r6, lr}
	sub sp, #0xc0
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201AC88
	add r3, sp, #0xb0
	ldr r6, _0225FA44 @ =0x02261C74
	str r0, [r5]
	adds r2, r3, #0
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r6, _0225FA48 @ =0x02261C9C
	add r3, sp, #0x94
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #1
	str r0, [r3]
	ldr r0, [r5]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	ldr r0, [r5]
	movs r1, #1
	bl FUN_0201CAE0
	ldr r6, _0225FA4C @ =0x02261CB8
	add r3, sp, #0x78
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #2
	str r0, [r3]
	ldr r0, [r5]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	ldr r0, [r5]
	movs r1, #2
	bl FUN_0201CAE0
	ldr r6, _0225FA50 @ =0x02261CD4
	add r3, sp, #0x5c
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #4
	str r0, [r3]
	ldr r0, [r5]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	ldr r0, [r5]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r6, _0225FA54 @ =0x02261CF0
	add r3, sp, #0x40
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #5
	str r0, [r3]
	ldr r0, [r5]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	ldr r0, [r5]
	movs r1, #5
	bl FUN_0201CAE0
	ldr r6, _0225FA58 @ =0x02261D0C
	add r3, sp, #0x24
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #6
	str r0, [r3]
	ldr r0, [r5]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	ldr r0, [r5]
	movs r1, #6
	bl FUN_0201CAE0
	ldr r6, _0225FA5C @ =0x02261D28
	add r3, sp, #8
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #7
	str r0, [r3]
	ldr r0, [r5]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #7
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	ldr r0, [r5]
	movs r1, #7
	bl FUN_0201CAE0
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
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
	movs r0, #0
	movs r1, #0xa0
	adds r2, r4, #0
	bl FUN_0200304C
	movs r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	movs r1, #1
	ldr r0, [r5]
	adds r2, r1, #0
	movs r3, #4
	bl FUN_0200E3DC
	add sp, #0xc0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225FA44: .4byte 0x02261C74
_0225FA48: .4byte 0x02261C9C
_0225FA4C: .4byte 0x02261CB8
_0225FA50: .4byte 0x02261CD4
_0225FA54: .4byte 0x02261CF0
_0225FA58: .4byte 0x02261D0C
_0225FA5C: .4byte 0x02261D28
	thumb_func_end ov91_0225F878

	thumb_func_start ov91_0225FA60
ov91_0225FA60: @ 0x0225FA60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [r4]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [r4]
	movs r1, #7
	bl FUN_0201BB4C
	ldr r0, [r4]
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov91_0225FA60

	thumb_func_start ov91_0225FA9C
ov91_0225FA9C: @ 0x0225FA9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r7, r0, #0
	adds r6, r1, #0
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x1f
	str r3, [sp, #0xc]
	adds r2, r0, #0
	str r6, [sp, #0x10]
	bl FUN_0200B150
	ldr r4, _0225FB40 @ =0x02261C64
	add r3, sp, #0x14
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r1, _0225FB44 @ =0x00200010
	adds r0, r2, #0
	adds r2, r1, #0
	str r6, [sp, #0x20]
	bl FUN_020215C0
	movs r0, #0x10
	adds r1, r6, #0
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	ldr r1, _0225FB44 @ =0x00200010
	movs r0, #1
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	adds r1, r7, #0
	movs r0, #0x80
	adds r1, #0x20
	adds r2, r6, #0
	bl FUN_02009F40
	str r0, [r7, #0x1c]
	adds r0, r7, #0
	movs r2, #2
	adds r0, #0x20
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r4, #0
	adds r5, r7, #0
_0225FB16:
	movs r0, #0x10
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0200A090
	movs r1, #0x52
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0225FB16
	movs r0, #8
	adds r1, r6, #0
	bl FUN_02013534
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r7, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225FB40: .4byte 0x02261C64
_0225FB44: .4byte 0x00200010
	thumb_func_end ov91_0225FA9C

	thumb_func_start ov91_0225FB48
ov91_0225FB48: @ 0x0225FB48
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020135AC
	ldr r0, [r5, #0x1c]
	bl FUN_02024504
	movs r6, #0x52
	movs r4, #0
	lsls r6, r6, #2
_0225FB62:
	ldr r0, [r5, r6]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0225FB62
	bl FUN_0202168C
	bl FUN_02022608
	bl FUN_0200B244
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov91_0225FB48

	thumb_func_start ov91_0225FB80
ov91_0225FB80: @ 0x0225FB80
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	adds r4, r2, #0
	movs r2, #0xc8
	adds r5, r0, #0
	str r2, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r4, [sp, #8]
	adds r2, #0x80
	ldr r0, [r5, r2]
	movs r2, #2
	movs r3, #0
	adds r6, r1, #0
	bl FUN_0200A3C8
	movs r1, #0x5f
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r1, #0xc8
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	adds r1, #0x84
	ldr r0, [r5, r1]
	adds r1, r6, #0
	movs r2, #3
	movs r3, #0
	bl FUN_0200A480
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r1, #0xc8
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r4, [sp, #8]
	adds r1, #0x88
	ldr r0, [r5, r1]
	adds r1, r6, #0
	movs r2, #1
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x61
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r1, #0xc8
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r2, #0
	str r4, [sp, #8]
	adds r1, #0x8c
	ldr r0, [r5, r1]
	adds r1, r6, #0
	adds r3, r2, #0
	bl FUN_0200A540
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0xc
	ldr r0, [r5, r1]
	bl FUN_0200AE18
	cmp r0, #0
	bne _0225FC14
	bl FUN_0202551C
_0225FC14:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0200B00C
	cmp r0, #0
	bne _0225FC26
	bl FUN_0202551C
_0225FC26:
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200A740
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0200A740
	movs r1, #0xc8
	adds r0, r1, #0
	adds r2, r1, #0
	str r1, [sp]
	subs r0, #0xc9
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r2, #0x80
	ldr r2, [r5, r2]
	adds r3, r1, #0
	str r2, [sp, #0x14]
	adds r2, r1, #0
	adds r2, #0x84
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	adds r2, r1, #0
	adds r2, #0x88
	ldr r2, [r5, r2]
	str r2, [sp, #0x1c]
	adds r2, r1, #0
	adds r2, #0x8c
	ldr r2, [r5, r2]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r1, #0
	adds r0, #0x90
	adds r0, r5, r0
	adds r2, r1, #0
	bl FUN_02009D48
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov91_0225FB80

	thumb_func_start ov91_0225FC84
ov91_0225FC84: @ 0x0225FC84
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200AEB0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0200B0A8
	movs r1, #0x52
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x34
	ldr r1, [r4, r1]
	bl FUN_0200A75C
	movs r1, #0x53
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x34
	ldr r1, [r4, r1]
	bl FUN_0200A75C
	movs r1, #0x15
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, #0x34
	ldr r1, [r4, r1]
	bl FUN_0200A75C
	movs r1, #0x55
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x34
	ldr r1, [r4, r1]
	bl FUN_0200A75C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov91_0225FC84

	thumb_func_start ov91_0225FCD8
ov91_0225FCD8: @ 0x0225FCD8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0200BD08
	str r0, [r5, #4]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xe6
	adds r3, r4, #0
	bl FUN_0200BAF8
	str r0, [r5, #8]
	movs r0, #0x80
	adds r1, r4, #0
	bl FUN_02026354
	str r0, [r5, #0xc]
	movs r0, #0x80
	adds r1, r4, #0
	bl FUN_02026354
	str r0, [r5, #0x10]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov91_0225FCD8

	thumb_func_start ov91_0225FD0C
ov91_0225FD0C: @ 0x0225FD0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_02026380
	ldr r0, [r4, #0xc]
	bl FUN_02026380
	ldr r0, [r4, #8]
	bl FUN_0200BB44
	ldr r0, [r4, #4]
	bl FUN_0200BDA0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov91_0225FD0C

	thumb_func_start ov91_0225FD2C
ov91_0225FD2C: @ 0x0225FD2C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r0, r3, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_02023114
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #0
	adds r2, r1, #4
	str r0, [r5, r2]
	adds r2, r1, #0
	adds r2, #8
	str r0, [r5, r2]
	adds r2, r1, #0
	adds r2, #0xc
	str r0, [r5, r2]
	ldr r3, _0225FDB8 @ =0x0000F112
	add r2, sp, #0xc
	strh r3, [r2]
	ldr r3, _0225FDBC @ =0x02261D5C
	lsls r4, r4, #3
	lsls r6, r6, #1
	adds r3, r3, r4
	ldrh r3, [r6, r3]
	strh r3, [r2, #2]
	strh r0, [r2, #4]
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	ldr r3, _0225FDC0 @ =0x00000FA4
	str r0, [sp, #8]
	adds r0, r1, #4
	ldr r1, _0225FDC4 @ =0x001D9000
	adds r0, r5, r0
	add r2, sp, #0xc
	bl FUN_02023254
	movs r1, #0
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x18]
	str r1, [sp, #0x14]
	str r1, [sp, #0x1c]
	movs r1, #0x19
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	add r0, sp, #0x14
	bl FUN_02023204
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0202313C
	movs r0, #0x32
	lsls r0, r0, #0xe
	lsrs r2, r0, #0xb
	movs r1, #0xfa
	ldr r2, [r5, r2]
	lsls r1, r1, #0xe
	bl FUN_02023240
	add sp, #0x20
	pop {r4, r5, r6, pc}
	nop
_0225FDB8: .4byte 0x0000F112
_0225FDBC: .4byte 0x02261D5C
_0225FDC0: .4byte 0x00000FA4
_0225FDC4: .4byte 0x001D9000
	thumb_func_end ov91_0225FD2C

	thumb_func_start ov91_0225FDC8
ov91_0225FDC8: @ 0x0225FDC8
	movs r1, #0x19
	lsls r1, r1, #4
	ldr r3, _0225FDD4 @ =FUN_02023120
	ldr r0, [r0, r1]
	bx r3
	nop
_0225FDD4: .4byte FUN_02023120
	thumb_func_end ov91_0225FDC8

	thumb_func_start ov91_0225FDD8
ov91_0225FDD8: @ 0x0225FDD8
	ldr r3, _0225FDDC @ =FUN_02023154
	bx r3
	.align 2, 0
_0225FDDC: .4byte FUN_02023154
	thumb_func_end ov91_0225FDD8

	thumb_func_start ov91_0225FDE0
ov91_0225FDE0: @ 0x0225FDE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r4, r3, #0
	str r0, [sp, #8]
	adds r6, r1, #0
	str r4, [sp, #0xc]
	adds r7, r2, #0
	ldr r2, [r5]
	adds r0, r6, #0
	movs r1, #0xc
	movs r3, #4
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r6, #0
	movs r1, #0xe
	movs r3, #7
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r6, #0
	movs r1, #0xf
	movs r3, #6
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r6, #0
	movs r1, #0x10
	movs r3, #5
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r6, #0
	movs r1, #0x11
	movs r3, #4
	bl FUN_02007B68
	movs r0, #6
	lsls r0, r0, #6
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	str r4, [sp, #4]
	bl FUN_02007B8C
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0225FEF8 @ =0x02261BEC
	movs r2, #0
	ldrb r0, [r0, r7]
	movs r1, #7
	adds r3, r2, #0
	str r0, [sp, #8]
	ldr r0, [r5]
	bl FUN_0201CA4C
	movs r0, #0x20
	str r0, [sp]
	lsls r4, r7, #1
	str r0, [sp, #4]
	adds r0, r4, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r2, #0
	ldr r0, [r5]
	movs r1, #6
	adds r3, r2, #0
	bl FUN_0201CA4C
	movs r0, #0x20
	str r0, [sp]
	movs r2, #0
	adds r4, r4, #1
	str r0, [sp, #4]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0201CA4C
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r2, #0
	ldr r0, [r5]
	movs r1, #4
	adds r3, r2, #0
	bl FUN_0201CA4C
	ldr r0, [r5]
	movs r1, #4
	bl FUN_0201BF7C
	ldr r0, [r5]
	movs r1, #5
	bl FUN_0201BF7C
	ldr r0, [r5]
	movs r1, #6
	bl FUN_0201BF7C
	ldr r0, [r5]
	movs r1, #7
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225FEF8: .4byte 0x02261BEC
	thumb_func_end ov91_0225FDE0

	thumb_func_start ov91_0225FEFC
ov91_0225FEFC: @ 0x0225FEFC
	bx lr
	.align 2, 0
	thumb_func_end ov91_0225FEFC

	thumb_func_start ov91_0225FF00
ov91_0225FF00: @ 0x0225FF00
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r2, [sp, #0x10]
	movs r2, #0x23
	str r1, [sp, #0xc]
	movs r1, #0
	lsls r2, r2, #4
	str r0, [sp, #8]
	str r3, [sp, #0x14]
	blx FUN_020E5B44
	movs r1, #0x5a
	ldr r0, [sp, #8]
	lsls r1, r1, #2
	ldr r6, _022600E4 @ =0x02261C04
	movs r7, #0
	adds r4, r0, r1
	adds r5, r0, #0
_0225FF24:
	ldrh r2, [r6]
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r0, r4, #0
	bl FUN_02018030
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_020181B0
	adds r0, r5, #0
	movs r1, #0
	bl FUN_020182A0
	movs r1, #0
	ldr r2, _022600E8 @ =0xFFEDE000
	adds r0, r5, #0
	adds r3, r1, #0
	bl FUN_020182A8
	movs r1, #6
	lsls r1, r1, #0xa
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_020182C4
	adds r7, r7, #1
	adds r6, r6, #2
	adds r4, #0x10
	adds r5, #0x78
	cmp r7, #3
	blt _0225FF24
	movs r0, #0
	str r0, [sp, #0x18]
	ldr r0, _022600EC @ =0x02261C1C
	movs r1, #0x66
	str r0, [sp, #0x28]
	ldr r0, _022600F0 @ =0x0226274C
	lsls r1, r1, #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #8]
	ldr r6, [sp, #8]
	adds r0, r0, r1
	str r0, [sp, #0x20]
	ldr r0, _022600F4 @ =0x022621AC
	str r0, [sp, #0x1c]
_0225FF82:
	ldr r0, [sp, #0x10]
	movs r2, #0x5a
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #8]
	lsls r2, r2, #2
	adds r2, r1, r2
	str r0, [sp, #4]
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x28]
	ldrb r1, [r1]
	ldrh r3, [r3]
	ldr r0, [sp, #0x20]
	lsls r1, r1, #4
	adds r1, r2, r1
	ldr r2, [sp, #0xc]
	bl FUN_020180BC
	ldr r0, [sp, #0x20]
	movs r1, #0
	bl FUN_02018198
	ldr r0, [sp, #0x24]
	movs r5, #0
	ldrb r0, [r0]
	lsls r1, r0, #4
	ldr r0, [sp, #8]
	adds r1, r0, r1
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r4, [r1, r0]
	cmp r4, #0
	beq _0225FFC8
	adds r4, #0x40
	b _0225FFCA
_0225FFC8:
	adds r4, r5, #0
_0225FFCA:
	cmp r4, #0
	bne _0225FFD2
	movs r7, #1
	b _0225FFE4
_0225FFD2:
	movs r7, #0
	b _0225FFE4
_0225FFD6:
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	adds r1, r5, #0
	blx FUN_020BE0E4
	adds r5, r5, #1
_0225FFE4:
	cmp r7, #0
	bne _02260004
	cmp r4, #0
	beq _02260000
	ldrb r0, [r4, #1]
	cmp r5, r0
	bhs _02260000
	ldrh r0, [r4, #6]
	adds r1, r4, r0
	ldrh r0, [r1, #2]
	adds r1, r1, r0
	lsls r0, r5, #4
	adds r0, r1, r0
	b _02260006
_02260000:
	movs r0, #0
	b _02260006
_02260004:
	movs r0, #0
_02260006:
	cmp r0, #0
	bne _0225FFD6
	ldr r5, [sp, #0x1c]
	movs r7, #0
_0226000E:
	cmp r4, #0
	beq _0226001E
	adds r0, r4, #0
	adds r1, r5, #0
	blx FUN_020C39D8
	adds r1, r0, #0
	b _02260022
_0226001E:
	movs r1, #0
	mvns r1, r1
_02260022:
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _02260034
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	blx FUN_020BE0A8
_02260034:
	adds r7, r7, #1
	adds r5, #0x10
	cmp r7, #0xf
	blt _0226000E
	ldr r0, [sp, #0x28]
	adds r6, #0x14
	adds r0, r0, #2
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	adds r0, r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	adds r0, #0x14
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	adds r0, #0xf0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #6
	blt _0225FF82
	ldr r0, _022600F8 @ =_02261BE8
	movs r4, #0x85
	ldrb r5, [r0]
	ldr r0, [sp, #0x10]
	lsls r4, r4, #2
	str r0, [sp]
	ldr r0, [sp, #0x14]
	adds r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #8]
	subs r2, #0xac
	adds r2, r1, r2
	lsls r1, r5, #4
	adds r1, r2, r1
	ldr r2, [sp, #0xc]
	adds r0, r0, r4
	movs r3, #0x20
	bl FUN_020180BC
	movs r0, #0x78
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, [sp, #8]
	adds r0, r0, r1
	ldr r1, [sp, #8]
	adds r1, r1, r4
	bl FUN_020181D4
	adds r2, r4, #0
	ldr r0, [sp, #8]
	movs r1, #4
	adds r2, #0x18
	strh r1, [r0, r2]
	movs r1, #0
	adds r2, r2, #2
	strh r1, [r0, r2]
	bl ov91_02260334
	ldr r0, [sp, #8]
	adds r2, r4, #0
	ldr r1, [sp, #8]
	subs r2, #0x2c
	adds r0, #0x78
	adds r1, r1, r2
	bl FUN_020181D4
	adds r1, r4, #0
	ldr r0, [sp, #8]
	subs r1, #0x2c
	adds r0, r0, r1
	movs r1, #0
	bl FUN_02018198
	ldr r0, [sp, #8]
	movs r1, #1
	adds r0, #0x78
	bl FUN_020182A0
	ldr r0, [sp, #8]
	movs r2, #4
	subs r1, r4, #4
	strh r2, [r0, r1]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_022600E4: .4byte 0x02261C04
_022600E8: .4byte 0xFFEDE000
_022600EC: .4byte 0x02261C1C
_022600F0: .4byte 0x0226274C
_022600F4: .4byte 0x022621AC
_022600F8: .4byte _02261BE8
	thumb_func_end ov91_0225FF00

	thumb_func_start ov91_022600FC
ov91_022600FC: @ 0x022600FC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	adds r6, r1, #0
	movs r4, #0
	adds r5, r7, r0
_0226010A:
	adds r0, r5, #0
	bl FUN_02018068
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _0226010A
	movs r0, #0x66
	lsls r0, r0, #2
	movs r5, #0
	adds r4, r7, r0
_02260120:
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020180F8
	adds r5, r5, #1
	adds r4, #0x14
	cmp r5, #6
	blt _02260120
	movs r0, #0x85
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r1, r6, #0
	bl FUN_020180F8
	movs r2, #0x23
	adds r0, r7, #0
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020E5B44
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov91_022600FC

	thumb_func_start ov91_0226014C
ov91_0226014C: @ 0x0226014C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl ov91_022601C8
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov91_022601F4
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov91_02260218
	cmp r4, #0
	beq _02260174
	cmp r4, #1
	beq _0226018E
	cmp r4, #2
	bne _022601A8
_02260174:
	adds r0, r5, #0
	movs r1, #1
	bl ov91_02260298
	ldrh r1, [r6, #4]
	adds r0, r5, #0
	bl ov91_02260254
	adds r0, r5, #0
	movs r1, #1
	bl ov91_02260334
	pop {r4, r5, r6, pc}
_0226018E:
	adds r0, r5, #0
	movs r1, #3
	bl ov91_02260298
	adds r0, r5, #0
	movs r1, #0
	bl ov91_02260334
	movs r1, #1
	adds r0, r5, #0
	lsls r1, r1, #0xc
	bl ov91_0226031C
_022601A8:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov91_0226014C

	thumb_func_start ov91_022601AC
ov91_022601AC: @ 0x022601AC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x66
	lsls r0, r0, #2
	movs r1, #1
	adds r0, r4, r0
	lsls r1, r1, #0xc
	bl FUN_02018124
	adds r0, r4, #0
	bl ov91_02260378
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov91_022601AC

	thumb_func_start ov91_022601C8
ov91_022601C8: @ 0x022601C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #0
_022601D0:
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	adds r1, #0xd8
	adds r2, #0xdc
	adds r3, #0xe0
	ldr r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]
	adds r0, r5, #0
	bl FUN_020182A8
	adds r6, r6, #1
	adds r5, #0x78
	cmp r6, #3
	blt _022601D0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov91_022601C8

	thumb_func_start ov91_022601F4
ov91_022601F4: @ 0x022601F4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r1, #2]
	movs r4, #0
	movs r7, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_02260202:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_020182E0
	adds r4, r4, #1
	adds r5, #0x78
	cmp r4, #3
	blt _02260202
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov91_022601F4

	thumb_func_start ov91_02260218
ov91_02260218: @ 0x02260218
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
_02260220:
	adds r0, r6, #0
	adds r0, #0xd4
	ldr r1, [r0]
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_020182C4
	adds r4, r4, #1
	adds r5, #0x78
	cmp r4, #3
	blt _02260220
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov91_02260218

	thumb_func_start ov91_0226023C
ov91_0226023C: @ 0x0226023C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_02260242:
	adds r0, r5, #0
	bl FUN_020181EC
	adds r4, r4, #1
	adds r5, #0x78
	cmp r4, #3
	blt _02260242
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov91_0226023C

	thumb_func_start ov91_02260254
ov91_02260254: @ 0x02260254
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02260290 @ =0x0000F222
	adds r4, r1, #0
	bl FUN_0201FD00
	adds r1, r0, #0
	ldr r0, _02260294 @ =0x00000E38
	subs r2, r4, r0
	movs r0, #0x5a
	muls r0, r2, r0
	blx FUN_020F2BA4
	movs r1, #0x2d
	lsls r1, r1, #0xe
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0x5a
	blx FUN_020F2998
	movs r1, #0x2d
	lsls r1, r1, #0xe
	subs r1, r1, r0
	movs r0, #0x6b
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_02018198
	pop {r3, r4, r5, pc}
	nop
_02260290: .4byte 0x0000F222
_02260294: .4byte 0x00000E38
	thumb_func_end ov91_02260254

	thumb_func_start ov91_02260298
ov91_02260298: @ 0x02260298
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #6
	blo _022602A6
	bl FUN_0202551C
_022602A6:
	movs r2, #0x21
	lsls r2, r2, #4
	ldrh r1, [r5, r2]
	cmp r1, r4
	beq _02260314
	ldr r0, _02260318 @ =0x0226274C
	subs r2, #0x78
	ldrb r3, [r0, r1]
	movs r0, #0x78
	muls r0, r3, r0
	adds r3, r5, r2
	movs r2, #0x14
	muls r2, r1, r2
	adds r0, r5, r0
	adds r1, r3, r2
	bl FUN_020181E0
	movs r0, #0x66
	lsls r0, r0, #2
	adds r6, r5, r0
	movs r0, #0x14
	adds r7, r4, #0
	muls r7, r0, r7
	ldr r0, _02260318 @ =0x0226274C
	ldrb r1, [r0, r4]
	movs r0, #0x78
	muls r0, r1, r0
	str r0, [sp]
	adds r0, r5, r0
	adds r1, r6, r7
	bl FUN_020181D4
	adds r0, r6, r7
	movs r1, #0
	bl FUN_02018198
	movs r0, #0x21
	lsls r0, r0, #4
	ldrh r1, [r5, r0]
	ldr r0, _02260318 @ =0x0226274C
	ldrb r1, [r0, r1]
	movs r0, #0x78
	muls r0, r1, r0
	adds r0, r5, r0
	movs r1, #0
	bl FUN_020182A0
	ldr r0, [sp]
	movs r1, #1
	adds r0, r5, r0
	bl FUN_020182A0
	movs r0, #0x21
	lsls r0, r0, #4
	strh r4, [r5, r0]
_02260314:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260318: .4byte 0x0226274C
	thumb_func_end ov91_02260298

	thumb_func_start ov91_0226031C
ov91_0226031C: @ 0x0226031C
	movs r2, #0x66
	lsls r2, r2, #2
	adds r3, r0, r2
	adds r2, #0x78
	ldrh r2, [r0, r2]
	movs r0, #0x14
	muls r0, r2, r0
	adds r0, r3, r0
	ldr r3, _02260330 @ =FUN_0201815C
	bx r3
	.align 2, 0
_02260330: .4byte FUN_0201815C
	thumb_func_end ov91_0226031C

	thumb_func_start ov91_02260334
ov91_02260334: @ 0x02260334
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, _02260360 @ =0x00000212
	adds r5, r0, #0
	ldrh r2, [r5, r1]
	cmp r2, r4
	beq _0226035C
	cmp r4, #1
	bne _02260350
	subs r1, #0x7a
	adds r1, r5, r1
	bl FUN_020181D4
	b _02260358
_02260350:
	subs r1, #0x7a
	adds r1, r5, r1
	bl FUN_020181E0
_02260358:
	ldr r0, _02260360 @ =0x00000212
	strh r4, [r5, r0]
_0226035C:
	pop {r3, r4, r5, pc}
	nop
_02260360: .4byte 0x00000212
	thumb_func_end ov91_02260334

	thumb_func_start ov91_02260364
ov91_02260364: @ 0x02260364
	ldr r2, _0226036C @ =0x0000022E
	strh r1, [r0, r2]
	bx lr
	nop
_0226036C: .4byte 0x0000022E
	thumb_func_end ov91_02260364

	thumb_func_start ov91_02260370
ov91_02260370: @ 0x02260370
	movs r2, #0x8b
	lsls r2, r2, #2
	strh r1, [r0, r2]
	bx lr
	thumb_func_end ov91_02260370

	thumb_func_start ov91_02260378
ov91_02260378: @ 0x02260378
	push {r3, r4, r5, lr}
	ldr r2, _022603F4 @ =0x0000022E
	adds r3, r0, #0
	ldrh r0, [r3, r2]
	cmp r0, #1
	bne _022603AA
	subs r0, r2, #6
	movs r1, #2
	ldr r0, [r3, r0]
	lsls r1, r1, #0xc
	adds r4, r0, r1
	movs r0, #0xa
	lsls r0, r0, #0xe
	cmp r4, r0
	bge _022603A2
	subs r0, r2, #6
	ldr r0, [r3, r0]
	adds r1, r0, r1
	subs r0, r2, #6
	str r1, [r3, r0]
	b _022603E4
_022603A2:
	lsrs r1, r1, #1
	subs r0, r2, #6
	str r1, [r3, r0]
	b _022603E4
_022603AA:
	subs r0, r2, #2
	ldrh r0, [r3, r0]
	cmp r0, #4
	bne _022603B6
	movs r0, #0
	b _022603B8
_022603B6:
	adds r0, r0, #1
_022603B8:
	lsls r2, r0, #1
	ldr r0, _022603F8 @ =0x02261C12
	movs r4, #0x8a
	ldrb r0, [r0, r2]
	lsls r4, r4, #2
	ldr r5, [r3, r4]
	lsls r1, r0, #0xc
	cmp r5, r1
	bge _022603CE
	str r1, [r3, r4]
	b _022603E4
_022603CE:
	movs r0, #2
	lsls r0, r0, #0xc
	adds r0, r5, r0
	ldr r5, _022603FC @ =0x02261C13
	ldrb r2, [r5, r2]
	lsls r2, r2, #0xc
	cmp r0, r2
	bge _022603E2
	str r0, [r3, r4]
	b _022603E4
_022603E2:
	str r1, [r3, r4]
_022603E4:
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r3, r1
	adds r1, #0x14
	ldr r1, [r3, r1]
	bl FUN_02018198
	pop {r3, r4, r5, pc}
	.align 2, 0
_022603F4: .4byte 0x0000022E
_022603F8: .4byte 0x02261C12
_022603FC: .4byte 0x02261C13
	thumb_func_end ov91_02260378

	thumb_func_start ov91_02260400
ov91_02260400: @ 0x02260400
	push {r3, r4}
	movs r3, #0xff
	subs r0, r3, r0
	movs r3, #0x96
	lsls r3, r3, #4
	adds r4, r0, #0
	muls r4, r3, r4
	lsls r0, r3, #7
	subs r0, r4, r0
	adds r4, r1, #0
	str r0, [r2]
	muls r4, r3, r4
	lsls r0, r3, #7
	subs r1, r4, r0
	ldr r0, _02260428 @ =0xFFED4000
	subs r0, r0, r1
	str r0, [r2, #8]
	pop {r3, r4}
	bx lr
	nop
_02260428: .4byte 0xFFED4000
	thumb_func_end ov91_02260400

	thumb_func_start ov91_0226042C
ov91_0226042C: @ 0x0226042C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0x4b
	ldr r0, [r5]
	lsls r1, r1, #0xc
	adds r0, r0, r1
	lsrs r1, r1, #7
	blx FUN_020F2998
	movs r1, #0xff
	subs r0, r1, r0
	strh r0, [r4]
	ldr r1, [r5, #8]
	ldr r0, _02260458 @ =0xFFF1F000
	subs r0, r0, r1
	movs r1, #0x96
	lsls r1, r1, #4
	blx FUN_020F2998
	strh r0, [r4, #2]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02260458: .4byte 0xFFF1F000
	thumb_func_end ov91_0226042C

	thumb_func_start ov91_0226045C
ov91_0226045C: @ 0x0226045C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r6, r0, #0
	add r0, sp, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	blx FUN_020CAFEC
	ldr r0, _0226049C @ =0x02261D3C
	lsls r2, r4, #3
	lsls r1, r5, #1
	adds r0, r0, r2
	ldrh r0, [r1, r0]
	ldr r3, _022604A0 @ =0x021094DC
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl FUN_020CB0EC
	adds r0, r6, #0
	add r1, sp, #0
	adds r2, r7, #0
	blx FUN_020CB630
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0226049C: .4byte 0x02261D3C
_022604A0: .4byte 0x021094DC
	thumb_func_end ov91_0226045C

	thumb_func_start ov91_022604A4
ov91_022604A4: @ 0x022604A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r6, r0, #0
	add r0, sp, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	blx FUN_020CAFEC
	ldr r0, _022604EC @ =0x02261D3C
	lsls r2, r4, #3
	lsls r1, r5, #1
	adds r0, r0, r2
	ldrh r0, [r1, r0]
	ldr r3, _022604F0 @ =0x021094DC
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl FUN_020CB0EC
	add r0, sp, #0
	adds r1, r0, #0
	blx FUN_020CB120
	adds r0, r6, #0
	add r1, sp, #0
	adds r2, r7, #0
	blx FUN_020CB630
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022604EC: .4byte 0x02261D3C
_022604F0: .4byte 0x021094DC
	thumb_func_end ov91_022604A4

	thumb_func_start ov91_022604F4
ov91_022604F4: @ 0x022604F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #0x30]
	ldr r0, _0226064C @ =0x000006FC
	ldr r4, _02260650 @ =0x02261BF0
	str r1, [sp, #0x2c]
	adds r7, r2, #0
	adds r6, r5, r0
_02260508:
	ldrb r2, [r4]
	ldr r1, [sp, #0x2c]
	adds r0, r6, #0
	adds r3, r7, #0
	bl FUN_02018030
	ldr r0, [sp, #0x30]
	adds r4, r4, #1
	adds r0, r0, #1
	adds r6, #0x10
	str r0, [sp, #0x30]
	cmp r0, #5
	blt _02260508
	ldr r0, _02260654 @ =0x0000074C
	ldr r1, [sp, #0x2c]
	adds r0, r5, r0
	movs r2, #0x2e
	adds r3, r7, #0
	bl FUN_02018030
	ldr r0, _02260658 @ =0x00000754
	movs r2, #0x1f
	ldr r0, [r5, r0]
	movs r1, #0
	lsls r2, r2, #0x10
	blx FUN_020C2C54
	movs r1, #0x64
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r7, [sp, #8]
	adds r1, #0xe4
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x2c]
	movs r2, #7
	movs r3, #0
	bl FUN_0200A3C8
	ldr r1, _0226065C @ =0x0000075C
	movs r2, #4
	str r0, [r5, r1]
	movs r1, #0x64
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r2, [sp, #8]
	str r7, [sp, #0xc]
	adds r1, #0xe8
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x2c]
	movs r3, #0
	bl FUN_0200A480
	movs r1, #0x76
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r1, #0x64
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r7, [sp, #8]
	adds r1, #0xec
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x2c]
	movs r2, #6
	movs r3, #0
	bl FUN_0200A540
	ldr r1, _02260660 @ =0x00000764
	movs r2, #5
	str r0, [r5, r1]
	movs r1, #0x64
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r7, [sp, #8]
	adds r1, #0xf0
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x2c]
	movs r3, #0
	bl FUN_0200A540
	ldr r1, _02260664 @ =0x00000768
	str r0, [r5, r1]
	subs r1, #0xc
	ldr r0, [r5, r1]
	bl FUN_0200AE18
	cmp r0, #0
	bne _022605C2
	bl FUN_0202551C
_022605C2:
	movs r0, #0x76
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200B00C
	cmp r0, #0
	bne _022605D4
	bl FUN_0202551C
_022605D4:
	ldr r0, _0226065C @ =0x0000075C
	ldr r0, [r5, r0]
	bl FUN_0200A740
	movs r0, #0x76
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200A740
	movs r1, #0x64
	adds r0, r1, #0
	adds r2, r1, #0
	str r1, [sp]
	subs r0, #0x65
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r2, #0xe4
	ldr r2, [r5, r2]
	adds r3, r1, #0
	str r2, [sp, #0x14]
	adds r2, r1, #0
	adds r2, #0xe8
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	adds r2, r1, #0
	adds r2, #0xec
	ldr r2, [r5, r2]
	str r2, [sp, #0x1c]
	adds r2, r1, #0
	adds r2, #0xf0
	ldr r2, [r5, r2]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, _02260668 @ =0x0000076C
	adds r2, r1, #0
	adds r0, r5, r0
	bl FUN_02009D48
	movs r0, #0x79
	lsls r0, r0, #4
	movs r6, #0
	adds r4, r5, r0
_02260630:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov91_022607C4
	movs r0, #0x42
	lsls r0, r0, #2
	adds r6, r6, #1
	adds r4, r4, r0
	cmp r6, #0x60
	blt _02260630
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0226064C: .4byte 0x000006FC
_02260650: .4byte 0x02261BF0
_02260654: .4byte 0x0000074C
_02260658: .4byte 0x00000754
_0226065C: .4byte 0x0000075C
_02260660: .4byte 0x00000764
_02260664: .4byte 0x00000768
_02260668: .4byte 0x0000076C
	thumb_func_end ov91_022604F4

	thumb_func_start ov91_0226066C
ov91_0226066C: @ 0x0226066C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x79
	lsls r0, r0, #4
	movs r7, #0x42
	movs r6, #0
	adds r4, r5, r0
	lsls r7, r7, #2
_0226067C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov91_02260830
	adds r6, r6, #1
	adds r4, r4, r7
	cmp r6, #0x60
	blt _0226067C
	ldr r0, _02260714 @ =0x0000075C
	ldr r0, [r5, r0]
	bl FUN_0200AEB0
	movs r0, #0x76
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200B0A8
	movs r0, #0x52
	ldr r1, _02260714 @ =0x0000075C
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl FUN_0200A75C
	movs r0, #0x53
	movs r1, #0x76
	lsls r0, r0, #2
	lsls r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl FUN_0200A75C
	movs r0, #0x15
	ldr r1, _02260718 @ =0x00000764
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl FUN_0200A75C
	movs r0, #0x55
	ldr r1, _0226071C @ =0x00000768
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl FUN_0200A75C
	ldr r0, _02260720 @ =0x000006FC
	movs r6, #0
	adds r4, r5, r0
_022606DE:
	adds r0, r4, #0
	bl FUN_02018068
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #5
	blt _022606DE
	ldr r0, _02260724 @ =0x0000074C
	adds r0, r5, r0
	bl FUN_02018068
	ldr r0, _02260720 @ =0x000006FC
	movs r1, #0
	adds r0, r5, r0
	movs r2, #0x94
	blx FUN_020E5B44
	movs r0, #0x79
	lsls r0, r0, #4
	movs r2, #0x63
	adds r0, r5, r0
	movs r1, #0
	lsls r2, r2, #8
	blx FUN_020E5B44
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260714: .4byte 0x0000075C
_02260718: .4byte 0x00000764
_0226071C: .4byte 0x00000768
_02260720: .4byte 0x000006FC
_02260724: .4byte 0x0000074C
	thumb_func_end ov91_0226066C

	thumb_func_start ov91_02260728
ov91_02260728: @ 0x02260728
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r7, r2, #0
	adds r6, r3, #0
	bl ov91_02260A50
	adds r1, r0, #0
	ldrh r0, [r4, #4]
	cmp r0, r6
	bne _0226074A
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl ov91_02260848
	pop {r3, r4, r5, r6, r7, pc}
_0226074A:
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov91_02260884
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov91_02260728

	thumb_func_start ov91_02260754
ov91_02260754: @ 0x02260754
	push {r4, r5, r6, lr}
	movs r3, #0x42
	ldr r4, _02260788 @ =0x00000888
	movs r2, #0
	adds r6, r0, #0
	lsls r3, r3, #2
_02260760:
	ldr r5, [r6, r4]
	cmp r5, r1
	bne _0226077A
	movs r1, #0x79
	lsls r1, r1, #4
	adds r1, r0, r1
	movs r0, #0x42
	lsls r0, r0, #2
	muls r0, r2, r0
	adds r0, r1, r0
	bl ov91_02260A2C
	pop {r4, r5, r6, pc}
_0226077A:
	adds r2, r2, #1
	adds r6, r6, r3
	cmp r2, #0x60
	blt _02260760
	bl FUN_0202551C
	pop {r4, r5, r6, pc}
	.align 2, 0
_02260788: .4byte 0x00000888
	thumb_func_end ov91_02260754

	thumb_func_start ov91_0226078C
ov91_0226078C: @ 0x0226078C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0x79
	lsls r0, r0, #4
	str r1, [sp]
	movs r6, #0
	adds r4, r7, #0
	adds r5, r7, r0
_0226079C:
	ldr r0, _022607C0 @ =0x00000888
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022607AE
	ldr r2, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov91_022608A8
_022607AE:
	movs r0, #0x42
	lsls r0, r0, #2
	adds r6, r6, #1
	adds r4, r4, r0
	adds r5, r5, r0
	cmp r6, #0x60
	blt _0226079C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022607C0: .4byte 0x00000888
	thumb_func_end ov91_0226078C

	thumb_func_start ov91_022607C4
ov91_022607C4: @ 0x022607C4
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r5, r0, #0
	add r3, sp, #0
	movs r0, #0
	adds r4, r1, #0
	adds r6, r3, #0
	adds r1, r0, #0
	stm r6!, {r0, r1}
	stm r6!, {r0, r1}
	stm r6!, {r0, r1}
	stm r6!, {r0, r1}
	stm r6!, {r0, r1}
	stm r6!, {r0, r1}
	ldr r0, [r5, #0x1c]
	str r0, [sp]
	ldr r0, _02260828 @ =0x0000076C
	str r2, [sp, #0x2c]
	adds r0, r5, r0
	str r0, [sp, #4]
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	movs r0, #0x20
	str r0, [sp, #0x24]
	movs r0, #2
	str r0, [sp, #0x28]
	adds r0, r3, #0
	bl FUN_02024624
	movs r1, #0
	str r0, [r4]
	bl FUN_02024830
	ldr r1, _0226082C @ =0x0000074C
	adds r0, r4, #0
	adds r0, #0x7c
	adds r1, r5, r1
	bl FUN_020181B0
	adds r4, #0x7c
	adds r0, r4, #0
	movs r1, #0
	bl FUN_020182A0
	add sp, #0x30
	pop {r4, r5, r6, pc}
	nop
_02260828: .4byte 0x0000076C
_0226082C: .4byte 0x0000074C
	thumb_func_end ov91_022607C4

	thumb_func_start ov91_02260830
ov91_02260830: @ 0x02260830
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4]
	bl FUN_02024758
	movs r2, #0x42
	adds r0, r4, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	pop {r4, pc}
	thumb_func_end ov91_02260830

	thumb_func_start ov91_02260848
ov91_02260848: @ 0x02260848
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r0, r5, #0
	adds r4, r2, #0
	adds r0, #0xf8
	str r4, [r0]
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0xf4
	str r1, [r0]
	movs r0, #0x41
	movs r1, #0
	lsls r0, r0, #2
	strh r1, [r5, r0]
	ldrh r1, [r4, #4]
	ldr r0, [r5]
	adds r6, r3, #0
	bl FUN_02024A14
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov91_02260A88
	ldr r0, [r5]
	movs r1, #1
	bl FUN_02024830
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov91_02260848

	thumb_func_start ov91_02260884
ov91_02260884: @ 0x02260884
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0xf8
	str r2, [r0]
	movs r0, #0x41
	movs r1, #0
	lsls r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, [r4]
	bl FUN_02024830
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov91_02260AF8
	pop {r3, r4, r5, pc}
	thumb_func_end ov91_02260884

	thumb_func_start ov91_022608A8
ov91_022608A8: @ 0x022608A8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r5, #0
	adds r1, #0xf4
	ldr r1, [r1]
	cmp r1, #1
	bne _022608CE
	adds r1, r5, #0
	adds r1, #0xf8
	ldr r1, [r1]
	bl ov91_02260A88
	cmp r0, #0
	bne _022608CE
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov91_02260AF8
_022608CE:
	adds r0, r5, #0
	adds r0, #0xf4
	ldr r0, [r0]
	cmp r0, #0
	bne _02260940
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r1, _02260944 @ =0x000006FC
	ldr r0, [r0]
	adds r1, r4, r1
	bl ov91_02260B48
	adds r1, r5, #0
	adds r1, #0xf8
	ldr r1, [r1]
	ldr r0, [r0, #8]
	ldrb r1, [r1]
	cmp r1, #5
	bne _022608FC
	ldr r1, _02260948 @ =0x00007FFF
	blx FUN_020C34D8
	b _02260902
_022608FC:
	ldr r1, _0226094C @ =0x00004A52
	blx FUN_020C34D8
_02260902:
	adds r0, r5, #0
	bl ov91_02260B5C
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r3, [r0]
	adds r0, r5, #4
	ldr r1, [r3, #0x2c]
	ldr r2, [r3, #0x30]
	ldr r3, [r3, #0x34]
	bl FUN_020182A8
	adds r0, r5, #4
	bl FUN_020181EC
	adds r0, r5, #0
	adds r0, #0x7c
	bl FUN_020182A4
	cmp r0, #1
	bne _02260940
	adds r0, r5, #0
	bl ov91_02260950
	adds r0, r5, #0
	adds r0, #0x7c
	bl FUN_020181EC
	adds r0, r5, #0
	bl ov91_02260A10
_02260940:
	pop {r3, r4, r5, pc}
	nop
_02260944: .4byte 0x000006FC
_02260948: .4byte 0x00007FFF
_0226094C: .4byte 0x00004A52
	thumb_func_end ov91_022608A8

	thumb_func_start ov91_02260950
ov91_02260950: @ 0x02260950
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0xf8
	ldr r0, [r0]
	bl ov91_0225E9AC
	cmp r0, #1
	bne _02260966
	ldr r4, _02260A08 @ =0xFFED4000
	b _0226097A
_02260966:
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	bl ov91_0225E990
	cmp r0, #0
	bne _02260978
	ldr r4, _02260A0C @ =0xFFFCD000
	b _0226097A
_02260978:
	ldr r4, _02260A08 @ =0xFFED4000
_0226097A:
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r3, [r0]
	adds r0, r5, #0
	ldr r1, [r3, #0x2c]
	ldr r3, [r3, #0x34]
	adds r0, #0x7c
	adds r2, r4, #0
	bl FUN_020182A8
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	movs r2, #0
	ldr r0, [r0, #0x30]
	subs r4, r0, r4
	asrs r6, r4, #0x1f
	lsrs r1, r4, #0x14
	lsls r0, r6, #0xc
	orrs r0, r1
	movs r1, #2
	lsls r3, r4, #0xc
	lsls r1, r1, #0xa
	adds r3, r3, r1
	adcs r0, r2
	lsls r1, r0, #0x14
	lsrs r0, r3, #0xc
	orrs r0, r1
	movs r1, #0x4b
	lsls r1, r1, #0xe
	blx FUN_020CCBA0
	movs r7, #1
	adds r3, r0, #0
	lsls r7, r7, #0xc
	adds r1, r3, r7
	adds r5, #0x7c
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r3, r7
	bl FUN_020182C4
	lsrs r0, r4, #0x10
	lsls r3, r6, #0x10
	orrs r3, r0
	lsls r2, r4, #0x10
	movs r1, #0
	lsrs r0, r7, #1
	adds r0, r2, r0
	adcs r3, r1
	lsls r1, r3, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	movs r1, #0x4b
	lsls r1, r1, #0xe
	blx FUN_020CCBA0
	asrs r1, r0, #0xc
	movs r0, #0x18
	subs r0, r0, r1
	str r0, [sp]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	str r0, [sp, #4]
	blx FUN_020BF0CC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260A08: .4byte 0xFFED4000
_02260A0C: .4byte 0xFFFCD000
	thumb_func_end ov91_02260950

	thumb_func_start ov91_02260A10
ov91_02260A10: @ 0x02260A10
	push {r3, lr}
	sub sp, #8
	movs r0, #0x1f
	str r0, [sp]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	str r0, [sp, #4]
	blx FUN_020BF0CC
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov91_02260A10

	thumb_func_start ov91_02260A2C
ov91_02260A2C: @ 0x02260A2C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	adds r0, #0xf8
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf4
	str r1, [r0]
	ldr r0, [r4]
	bl FUN_02024830
	adds r4, #0x7c
	adds r0, r4, #0
	movs r1, #0
	bl FUN_020182A0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov91_02260A2C

	thumb_func_start ov91_02260A50
ov91_02260A50: @ 0x02260A50
	push {r3, r4, r5, lr}
	movs r2, #0x42
	ldr r3, _02260A84 @ =0x00000888
	movs r1, #0
	adds r5, r0, #0
	lsls r2, r2, #2
_02260A5C:
	ldr r4, [r5, r3]
	cmp r4, #0
	bne _02260A72
	movs r2, #0x79
	lsls r2, r2, #4
	adds r2, r0, r2
	movs r0, #0x42
	lsls r0, r0, #2
	muls r0, r1, r0
	adds r0, r2, r0
	pop {r3, r4, r5, pc}
_02260A72:
	adds r1, r1, #1
	adds r5, r5, r2
	cmp r1, #0x60
	blt _02260A5C
	bl FUN_0202551C
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_02260A84: .4byte 0x00000888
	thumb_func_end ov91_02260A50

	thumb_func_start ov91_02260A88
ov91_02260A88: @ 0x02260A88
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0xf8
	ldr r6, [r0]
	add r5, sp, #4
	adds r6, #0x2c
	ldm r6!, {r0, r1}
	adds r3, r2, #0
	adds r2, r5, #0
	stm r5!, {r0, r1}
	ldr r0, [r6]
	adds r1, r2, #0
	str r0, [r5]
	adds r0, r2, #0
	adds r2, r4, #0
	adds r2, #0xf8
	ldr r2, [r2]
	ldrh r2, [r2, #4]
	bl ov91_022604A4
	add r0, sp, #4
	add r1, sp, #0
	bl ov91_0226042C
	add r1, sp, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r0, #2
	ldrsh r1, [r1, r0]
	lsls r0, r0, #0x14
	lsls r1, r1, #0xc
	adds r0, r1, r0
	str r2, [sp, #0xc]
	str r0, [sp, #8]
	ldr r0, [r4]
	add r1, sp, #4
	bl FUN_020247D4
	add r1, sp, #0
	movs r0, #0
	ldrsh r0, [r1, r0]
	cmp r0, #0
	blt _02260AEC
	movs r0, #2
	ldrsh r0, [r1, r0]
	cmp r0, #0
	bge _02260AF2
_02260AEC:
	add sp, #0x10
	movs r0, #0
	pop {r4, r5, r6, pc}
_02260AF2:
	movs r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov91_02260A88

	thumb_func_start ov91_02260AF8
ov91_02260AF8: @ 0x02260AF8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	movs r1, #0
	bl FUN_02024830
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0xf4
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r1, _02260B44 @ =0x000006FC
	ldr r0, [r0]
	adds r1, r4, r1
	bl ov91_02260B48
	adds r1, r0, #0
	adds r0, r5, #4
	bl FUN_020181B0
	adds r0, r5, #4
	movs r1, #1
	bl FUN_020182A0
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #1
	bne _02260B42
	adds r5, #0x7c
	adds r0, r5, #0
	movs r1, #1
	bl FUN_020182A0
_02260B42:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02260B44: .4byte 0x000006FC
	thumb_func_end ov91_02260AF8

	thumb_func_start ov91_02260B48
ov91_02260B48: @ 0x02260B48
	ldr r2, [r0, #0x28]
	cmp r2, #1
	bne _02260B52
	movs r0, #4
	b _02260B54
_02260B52:
	ldrh r0, [r0, #4]
_02260B54:
	lsls r0, r0, #4
	adds r0, r1, r0
	bx lr
	.align 2, 0
	thumb_func_end ov91_02260B48

	thumb_func_start ov91_02260B5C
ov91_02260B5C: @ 0x02260B5C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x41
	lsls r0, r0, #2
	ldrsh r1, [r5, r0]
	subs r1, r1, #1
	strh r1, [r5, r0]
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bge _02260BFA
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	bl ov91_0225E6F8
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r1, [r0]
	ldr r0, [r1, #0x10]
	ldr r1, [r1, #8]
	blx FUN_020CD5DC
	asrs r0, r0, #4
	lsls r4, r0, #1
	ldr r1, _02260C3C @ =0x0001E200
	lsls r0, r6, #9
	blx FUN_020F2998
	lsls r0, r0, #0x10
	lsrs r6, r0, #4
	asrs r7, r6, #0x1f
	ldr r0, _02260C40 @ =0x021094DC
	lsls r1, r4, #1
	ldrsh r0, [r0, r1]
	adds r2, r6, #0
	adds r3, r7, #0
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r0, r0, r2
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	asrs r1, r0, #0xc
	lsrs r0, r2, #2
	adds r1, r1, r0
	lsrs r0, r2, #3
	strh r1, [r5, r0]
	adds r0, r4, #1
	lsls r1, r0, #1
	ldr r0, _02260C40 @ =0x021094DC
	adds r2, r6, #0
	ldrsh r0, [r0, r1]
	adds r3, r7, #0
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r4, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r4, #0xc
	orrs r1, r0
	asrs r1, r1, #0xc
	lsrs r0, r2, #2
	adds r1, r1, r0
	ldr r0, _02260C44 @ =0x00000102
	strh r1, [r5, r0]
	movs r1, #8
	adds r0, r1, #0
	adds r0, #0xfc
	strh r1, [r5, r0]
_02260BFA:
	adds r0, r5, #0
	adds r0, #0xfc
	ldrh r2, [r0]
	movs r0, #1
	lsls r0, r0, #8
	ldrh r1, [r5, r0]
	adds r0, r0, #2
	adds r2, r2, r1
	adds r1, r5, #0
	adds r1, #0xfc
	strh r2, [r1]
	adds r1, r5, #0
	adds r1, #0xfe
	ldrh r1, [r1]
	ldrh r0, [r5, r0]
	movs r2, #0
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0xfe
	strh r1, [r0]
	adds r1, r5, #0
	adds r1, #0xfc
	ldrh r1, [r1]
	adds r0, r5, #4
	bl FUN_020182E0
	adds r0, r5, #4
	adds r5, #0xfe
	ldrh r1, [r5]
	movs r2, #2
	bl FUN_020182E0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02260C3C: .4byte 0x0001E200
_02260C40: .4byte 0x021094DC
_02260C44: .4byte 0x00000102
	thumb_func_end ov91_02260B5C

	thumb_func_start ov91_02260C48
ov91_02260C48: @ 0x02260C48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r6, r0, #0
	add r7, sp, #0
	adds r4, r2, #0
	movs r0, #0
	adds r5, r1, #0
	adds r2, r7, #0
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r6, #0x1c]
	str r0, [sp]
	ldr r0, _02260CA4 @ =0x0000076C
	str r3, [sp, #0x2c]
	adds r0, r6, r0
	str r0, [sp, #4]
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	movs r0, #0x20
	str r0, [sp, #0x24]
	movs r0, #2
	str r0, [sp, #0x28]
	adds r0, r7, #0
	bl FUN_02024624
	str r0, [r5, #4]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #4]
	adds r1, r4, #0
	bl FUN_02024A14
	movs r0, #0
	str r0, [r5]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260CA4: .4byte 0x0000076C
	thumb_func_end ov91_02260C48

	thumb_func_start ov91_02260CA8
ov91_02260CA8: @ 0x02260CA8
	ldr r3, _02260CB0 @ =FUN_02024758
	ldr r0, [r0, #4]
	bx r3
	nop
_02260CB0: .4byte FUN_02024758
	thumb_func_end ov91_02260CA8

	thumb_func_start ov91_02260CB4
ov91_02260CB4: @ 0x02260CB4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_02024830
	movs r0, #1
	str r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov91_02260CB4

	thumb_func_start ov91_02260CC8
ov91_02260CC8: @ 0x02260CC8
	push {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	beq _02260CDA
	ldr r2, _02260CDC @ =0x021D114C
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl ov91_02260CE0
_02260CDA:
	pop {r3, pc}
	.align 2, 0
_02260CDC: .4byte 0x021D114C
	thumb_func_end ov91_02260CC8

	thumb_func_start ov91_02260CE0
ov91_02260CE0: @ 0x02260CE0
	push {lr}
	sub sp, #0xc
	lsls r1, r1, #0xc
	str r1, [sp]
	movs r1, #2
	lsls r2, r2, #0xc
	lsls r1, r1, #0x14
	adds r1, r2, r1
	str r1, [sp, #4]
	ldr r0, [r0, #4]
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov91_02260CE0

	thumb_func_start ov91_02260D00
ov91_02260D00: @ 0x02260D00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0
	str r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov91_02260D00

	thumb_func_start ov91_02260D14
ov91_02260D14: @ 0x02260D14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	movs r4, #0
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	add r2, sp, #0
	adds r0, r4, #0
	adds r1, r4, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r7, #0x1c]
	str r0, [sp]
	ldr r0, _02260D7C @ =0x0000076C
	str r3, [sp, #0x2c]
	adds r0, r7, r0
	str r0, [sp, #4]
	movs r0, #9
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	movs r0, #0x20
	str r0, [sp, #0x24]
	movs r0, #2
	str r0, [sp, #0x28]
	adds r7, r4, #0
_02260D50:
	add r0, sp, #0
	bl FUN_02024624
	str r0, [r5, #4]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #4]
	movs r1, #1
	bl FUN_0202487C
	ldr r0, [r5, #4]
	adds r1, r6, #0
	bl FUN_02024A14
	str r7, [r5]
	adds r4, r4, #1
	adds r5, #0x1c
	cmp r4, #8
	blt _02260D50
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02260D7C: .4byte 0x0000076C
	thumb_func_end ov91_02260D14

	thumb_func_start ov91_02260D80
ov91_02260D80: @ 0x02260D80
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r4, #0
_02260D86:
	ldr r0, [r5, #4]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, #0x1c
	cmp r4, #8
	blt _02260D86
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov91_02260D80

	thumb_func_start ov91_02260D98
ov91_02260D98: @ 0x02260D98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r4, #0
	add r6, sp, #0x10
	add r7, sp, #0xc
_02260DA4:
	ldr r0, [r5]
	cmp r0, #1
	bne _02260E78
	ldr r0, [r5, #0x14]
	cmp r0, #0x10
	bge _02260DC4
	movs r1, #0x7d
	str r1, [sp]
	str r6, [sp, #4]
	movs r1, #0x10
	movs r2, #8
	movs r3, #0xbe
	str r7, [sp, #8]
	bl ov91_02260EE0
	b _02260DF2
_02260DC4:
	cmp r0, #0x1a
	bge _02260DDE
	movs r1, #0x8c
	str r1, [sp]
	str r6, [sp, #4]
	subs r0, #0x10
	movs r1, #0xa
	movs r2, #4
	movs r3, #0xb6
	str r7, [sp, #8]
	bl ov91_02260EE0
	b _02260DF2
_02260DDE:
	movs r1, #0xa0
	str r1, [sp]
	str r6, [sp, #4]
	subs r0, #0x1a
	movs r1, #6
	movs r2, #3
	movs r3, #0xb4
	str r7, [sp, #8]
	bl ov91_02260EE0
_02260DF2:
	ldr r0, [r5, #0x14]
	adds r1, r0, #1
	lsls r0, r1, #1
	str r1, [r5, #0x14]
	adds r1, r1, r0
	asrs r0, r1, #4
	lsrs r0, r0, #0x1b
	adds r0, r1, r0
	asrs r1, r0, #5
	movs r0, #9
	subs r0, r0, r1
	movs r1, #0xa
	lsls r0, r0, #0xc
	lsls r1, r1, #0xc
	blx FUN_020CCBA0
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	ldr r0, [r5, #4]
	add r1, sp, #0x14
	bl FUN_020247F4
	ldr r0, [r5, #0x18]
	ldr r1, [r5, #8]
	cmp r0, #0
	beq _02260E2E
	ldr r0, [sp, #0x10]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	b _02260E34
_02260E2E:
	ldr r0, [sp, #0x10]
	lsls r0, r0, #0xc
	subs r0, r1, r0
_02260E34:
	str r0, [r5, #8]
	ldr r0, [sp, #0xc]
	ldr r1, [r5, #0xc]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [r5, #0xc]
	adds r1, r5, #0
	ldr r0, [r5, #4]
	adds r1, #8
	bl FUN_020247D4
	ldr r1, [r5, #8]
	ldr r0, _02260E84 @ =0xFFFE0000
	cmp r1, r0
	blt _02260E6C
	movs r0, #0x12
	lsls r0, r0, #0x10
	cmp r1, r0
	bgt _02260E6C
	movs r0, #0x1e
	ldr r1, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r1, r0
	blt _02260E6C
	movs r0, #0x2e
	lsls r0, r0, #0x10
	cmp r1, r0
	ble _02260E78
_02260E6C:
	movs r0, #0
	str r0, [r5]
	ldr r0, [r5, #4]
	movs r1, #0
	bl FUN_02024830
_02260E78:
	adds r4, r4, #1
	adds r5, #0x1c
	cmp r4, #8
	blt _02260DA4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02260E84: .4byte 0xFFFE0000
	thumb_func_end ov91_02260D98

	thumb_func_start ov91_02260E88
ov91_02260E88: @ 0x02260E88
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r3, r4, #0
	adds r6, r0, #0
_02260E90:
	ldr r5, [r6]
	cmp r5, #0
	bne _02260E9E
	movs r4, #0x1c
	muls r4, r3, r4
	adds r4, r0, r4
	b _02260EA6
_02260E9E:
	adds r3, r3, #1
	adds r6, #0x1c
	cmp r3, #8
	blt _02260E90
_02260EA6:
	cmp r4, #0
	beq _02260EDC
	cmp r1, #0x80
	bge _02260EB2
	movs r0, #1
	b _02260EB4
_02260EB2:
	movs r0, #0
_02260EB4:
	str r0, [r4, #0x18]
	lsls r0, r1, #0xc
	str r0, [r4, #8]
	movs r0, #2
	lsls r1, r2, #0xc
	lsls r0, r0, #0x14
	adds r0, r1, r0
	str r0, [r4, #0xc]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #8
	bl FUN_020247D4
	movs r1, #1
	str r1, [r4]
	ldr r0, [r4, #4]
	bl FUN_02024830
	movs r0, #0
	str r0, [r4, #0x14]
_02260EDC:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov91_02260E88

	thumb_func_start ov91_02260EE0
ov91_02260EE0: @ 0x02260EE0
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	ldr r2, [sp, #0x10]
	adds r5, r3, #0
	subs r2, r2, r5
	muls r2, r0, r2
	adds r0, r2, #0
	blx FUN_020F2998
	adds r0, r5, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r6, #0
	bl FUN_0201FC30
	lsls r5, r4, #0xc
	asrs r4, r5, #0x1f
	asrs r1, r0, #0x1f
	adds r2, r5, #0
	adds r3, r4, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	ldr r0, [sp, #0x14]
	asrs r1, r1, #0xc
	str r1, [r0]
	adds r0, r6, #0
	bl FUN_0201FBB8
	asrs r1, r0, #0x1f
	adds r2, r5, #0
	adds r3, r4, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	ldr r0, [sp, #0x18]
	asrs r1, r1, #0xc
	str r1, [r0]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov91_02260EE0

	thumb_func_start ov91_02260F50
ov91_02260F50: @ 0x02260F50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #8]
	ldr r0, [sp, #0x40]
	movs r1, #0x5a
	str r0, [sp, #0x40]
	ldr r0, [sp, #8]
	str r2, [sp, #0xc]
	lsls r1, r1, #2
	adds r6, r0, r1
	subs r2, r3, #1
	adds r5, r0, #0
	lsls r0, r2, #1
	str r0, [sp, #0x14]
	ldr r1, _0226105C @ =0x02261D64
	lsls r0, r2, #3
	adds r0, r1, r0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	lsls r0, r0, #1
	movs r4, #0
	str r0, [sp, #0x1c]
_02260F7E:
	cmp r4, #0
	bne _02260F86
	movs r2, #0x24
	b _02260F94
_02260F86:
	cmp r4, #1
	bne _02260F8E
	movs r2, #0x25
	b _02260F94
_02260F8E:
	ldr r1, _02261060 @ =0x02261C0A
	ldr r0, [sp, #0x14]
	ldrh r2, [r1, r0]
_02260F94:
	ldr r1, [sp, #0xc]
	adds r0, r6, #0
	adds r3, r7, #0
	bl FUN_02018030
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_020181B0
	movs r1, #0
	ldr r2, _02261064 @ =0xFFF9E000
	adds r0, r5, #0
	adds r3, r1, #0
	bl FUN_020182A8
	movs r1, #6
	lsls r1, r1, #0xa
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_020182C4
	cmp r4, #1
	bne _02260FCC
	adds r0, r5, #0
	movs r1, #0
	bl FUN_020182A0
_02260FCC:
	cmp r4, #1
	bhi _02260FE0
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	adds r0, r5, #0
	ldrh r1, [r2, r1]
	movs r2, #1
	bl FUN_020182E0
	b _02260FF0
_02260FE0:
	movs r0, #0xb4
	bl FUN_0201FCD4
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #1
	bl FUN_020182E0
_02260FF0:
	adds r4, r4, #1
	adds r6, #0x10
	adds r5, #0x78
	cmp r4, #3
	blt _02260F7E
	movs r0, #0
	str r0, [sp, #0x10]
	movs r1, #0x66
	ldr r0, [sp, #8]
	lsls r1, r1, #2
	adds r5, r0, r1
	subs r1, #0x30
	adds r0, r0, r1
	ldr r6, _02261068 @ =0x02261BF8
	ldr r4, _0226106C @ =0x02261BFE
	str r0, [sp, #0x20]
_02261010:
	ldr r0, [sp, #0x40]
	str r7, [sp]
	str r0, [sp, #4]
	ldrh r1, [r4]
	ldrh r3, [r6]
	adds r0, r5, #0
	lsls r2, r1, #4
	ldr r1, [sp, #0x20]
	adds r1, r1, r2
	ldr r2, [sp, #0xc]
	bl FUN_020180BC
	ldrh r1, [r4]
	movs r0, #0x78
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #8]
	adds r1, r5, #0
	adds r0, r0, r2
	bl FUN_020181D4
	ldr r0, [sp, #0x10]
	adds r6, r6, #2
	adds r0, r0, #1
	adds r4, r4, #2
	adds r5, #0x14
	str r0, [sp, #0x10]
	cmp r0, #3
	blt _02261010
	movs r2, #1
	movs r1, #0x75
	ldr r0, [sp, #8]
	lsls r2, r2, #0xc
	lsls r1, r1, #2
	str r2, [r0, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0226105C: .4byte 0x02261D64
_02261060: .4byte 0x02261C0A
_02261064: .4byte 0xFFF9E000
_02261068: .4byte 0x02261BF8
_0226106C: .4byte 0x02261BFE
	thumb_func_end ov91_02260F50

	thumb_func_start ov91_02261070
ov91_02261070: @ 0x02261070
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0x66
	lsls r0, r0, #2
	adds r6, r2, #0
	movs r4, #0
	adds r5, r7, r0
_0226107E:
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_020180F8
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, #3
	blt _0226107E
	movs r0, #0x5a
	lsls r0, r0, #2
	movs r4, #0
	adds r5, r7, r0
_02261096:
	adds r0, r5, #0
	bl FUN_02018068
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _02261096
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov91_02261070

	thumb_func_start ov91_022610A8
ov91_022610A8: @ 0x022610A8
	push {r3, r4, r5, lr}
	movs r1, #0x66
	adds r4, r0, #0
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, #0x3c
	ldr r1, [r4, r1]
	bl FUN_02018124
	movs r0, #0x76
	lsls r0, r0, #2
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _022611B4
	adds r1, r0, #1
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _022610D6
	cmp r1, #1
	beq _02261128
	cmp r1, #2
	beq _0226116C
	b _02261194
_022610D6:
	adds r1, r0, #0
	adds r1, #8
	adds r2, r0, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r3, r2, r1
	movs r2, #0x33
	lsls r2, r2, #0xc
	cmp r3, r2
	bge _022610F2
	adds r2, r0, #4
	ldr r2, [r4, r2]
	adds r1, r2, r1
	b _022610F4
_022610F2:
	movs r1, #0
_022610F4:
	adds r0, r0, #4
	str r1, [r4, r0]
	movs r1, #0x1e
	lsls r1, r1, #4
	adds r0, r1, #0
	ldr r2, [r4, r1]
	subs r0, #0x46
	adds r3, r2, r0
	ldr r0, _022611C8 @ =0x000024CD
	cmp r3, r0
	bgt _02261114
	adds r0, r1, #0
	subs r0, #0x46
	adds r0, r2, r0
	str r0, [r4, r1]
	b _02261198
_02261114:
	str r0, [r4, r1]
	movs r2, #0x18
	subs r0, r1, #6
	strh r2, [r4, r0]
	subs r0, r1, #7
	ldrb r0, [r4, r0]
	adds r2, r0, #1
	subs r0, r1, #7
	strb r2, [r4, r0]
	b _02261198
_02261128:
	adds r1, r0, #0
	adds r1, #8
	adds r2, r0, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r3, r2, r1
	movs r2, #0x33
	lsls r2, r2, #0xc
	cmp r3, r2
	bge _02261144
	adds r2, r0, #4
	ldr r2, [r4, r2]
	adds r1, r2, r1
	b _02261146
_02261144:
	movs r1, #0
_02261146:
	adds r0, r0, #4
	str r1, [r4, r0]
	ldr r1, _022611CC @ =0x000001DA
	ldrsh r0, [r4, r1]
	subs r0, r0, #1
	strh r0, [r4, r1]
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _02261198
	subs r0, r1, #1
	ldrb r0, [r4, r0]
	adds r2, r0, #1
	subs r0, r1, #1
	strb r2, [r4, r0]
	movs r2, #0x33
	lsls r2, r2, #0xc
	adds r0, r1, #2
	str r2, [r4, r0]
	b _02261198
_0226116C:
	adds r1, r0, #4
	movs r2, #1
	ldr r1, [r4, r1]
	lsls r2, r2, #0xc
	adds r3, r1, r2
	movs r1, #0x19
	lsls r1, r1, #0xe
	cmp r3, r1
	bge _0226118A
	adds r1, r0, #4
	ldr r1, [r4, r1]
	adds r0, r0, #4
	adds r1, r1, r2
	str r1, [r4, r0]
	b _02261198
_0226118A:
	movs r1, #0x33
	lsls r1, r1, #0xc
	adds r0, r0, #4
	str r1, [r4, r0]
	b _02261198
_02261194:
	bl FUN_0202551C
_02261198:
	movs r1, #0x6b
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r1, #0x30
	ldr r1, [r4, r1]
	bl FUN_02018198
	movs r1, #7
	lsls r1, r1, #6
	adds r0, r4, r1
	adds r1, #0x1c
	ldr r1, [r4, r1]
	bl FUN_02018198
_022611B4:
	movs r5, #0
_022611B6:
	adds r0, r4, #0
	bl FUN_020181EC
	adds r5, r5, #1
	adds r4, #0x78
	cmp r5, #3
	blt _022611B6
	pop {r3, r4, r5, pc}
	nop
_022611C8: .4byte 0x000024CD
_022611CC: .4byte 0x000001DA
	thumb_func_end ov91_022610A8

	thumb_func_start ov91_022611D0
ov91_022611D0: @ 0x022611D0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl FUN_020182A0
	adds r0, r4, #0
	adds r0, #0x78
	movs r1, #1
	bl FUN_020182A0
	movs r0, #0x77
	lsls r0, r0, #2
	movs r3, #0
	movs r2, #1
	str r3, [r4, r0]
	lsls r2, r2, #0xc
	adds r1, r0, #4
	str r2, [r4, r1]
	subs r1, r0, #4
	movs r2, #1
	strb r2, [r4, r1]
	subs r0, r0, #3
	strb r3, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov91_022611D0

	thumb_func_start ov91_02261200
ov91_02261200: @ 0x02261200
	movs r2, #0x75
	lsls r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov91_02261200

	thumb_func_start ov91_02261208
ov91_02261208: @ 0x02261208
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	adds r4, r0, #0
	ldr r0, [sp, #0x68]
	ldr r6, [r2]
	str r0, [sp, #0x68]
	ldr r0, [r2, #4]
	ldr r7, [r2, #8]
	str r0, [sp, #0x2c]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x30]
	asrs r0, r6, #0x1f
	str r0, [sp, #0x34]
	adds r5, r1, #0
	asrs r0, r7, #0x1f
	str r0, [sp, #0x38]
	ldr r2, [r4]
	str r3, [sp]
	ldr r1, [sp, #0x34]
	adds r0, r6, #0
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	ldr r2, [r4, #4]
	str r0, [sp, #0x3c]
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	ldr r2, [r4, #8]
	str r1, [sp, #0x20]
	str r0, [sp, #0x40]
	ldr r1, [sp, #0x38]
	adds r0, r7, #0
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	ldr r2, [r5, #8]
	str r1, [sp, #0x18]
	str r0, [sp, #0x44]
	ldr r1, [sp, #0x38]
	adds r0, r7, #0
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	ldr r2, [r5]
	str r1, [sp, #0x10]
	str r0, [sp, #0x48]
	ldr r1, [sp, #0x34]
	adds r0, r6, #0
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	ldr r2, [r5, #4]
	str r0, [sp, #0x4c]
	adds r6, r1, #0
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	mov ip, r0
	movs r7, #2
	str r1, [sp, #8]
	ldr r0, [sp, #0x3c]
	lsls r7, r7, #0xa
	movs r1, #0
	adds r2, r0, r7
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x20]
	adcs r0, r1
	str r0, [sp, #0x28]
	lsls r0, r0, #0x14
	lsrs r2, r2, #0xc
	orrs r2, r0
	ldr r0, [sp, #0x40]
	adds r0, r0, r7
	adcs r3, r1
	str r3, [sp, #0x20]
	lsls r3, r3, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r3
	adds r2, r2, r0
	ldr r0, [sp, #0x44]
	ldr r3, [sp, #0x18]
	adds r0, r0, r7
	adcs r3, r1
	str r3, [sp, #0x18]
	lsls r3, r3, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r3
	adds r2, r2, r0
	ldr r0, [sp]
	subs r0, r0, r2
	ldr r2, [sp, #0x48]
	adds r3, r2, r7
	ldr r2, [sp, #0x10]
	adcs r2, r1
	str r2, [sp, #0x10]
	lsls r2, r2, #0x14
	lsrs r3, r3, #0xc
	orrs r3, r2
	ldr r2, [sp, #0x4c]
	adds r2, r2, r7
	adcs r6, r1
	lsls r6, r6, #0x14
	lsrs r2, r2, #0xc
	orrs r2, r6
	mov r6, ip
	adds r7, r6, r7
	ldr r6, [sp, #8]
	adcs r6, r1
	str r6, [sp, #8]
	lsls r1, r6, #0x14
	lsrs r6, r7, #0xc
	orrs r6, r1
	adds r1, r2, r6
	adds r1, r3, r1
	blx FUN_020CCBA0
	adds r6, r0, #0
	ldr r0, [r5]
	asrs r7, r6, #0x1f
	asrs r1, r0, #0x1f
	adds r2, r6, #0
	adds r3, r7, #0
	blx FUN_020F2948
	movs r3, #2
	adds r2, r0, #0
	lsls r3, r3, #0xa
	adds r3, r2, r3
	ldr r2, _02261378 @ =0x00000000
	ldr r0, [r4]
	adcs r1, r2
	lsrs r2, r3, #0xc
	lsls r1, r1, #0x14
	orrs r2, r1
	adds r1, r0, r2
	ldr r0, [sp, #0x68]
	adds r2, r6, #0
	str r1, [r0]
	ldr r0, [r5, #4]
	adds r3, r7, #0
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r3, #2
	adds r2, r0, #0
	lsls r3, r3, #0xa
	adds r3, r2, r3
	ldr r2, _02261378 @ =0x00000000
	ldr r0, [r4, #4]
	adcs r1, r2
	lsrs r2, r3, #0xc
	lsls r1, r1, #0x14
	orrs r2, r1
	adds r1, r0, r2
	ldr r0, [sp, #0x68]
	adds r2, r6, #0
	str r1, [r0, #4]
	ldr r0, [r5, #8]
	adds r3, r7, #0
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r3, #2
	ldr r2, [r4, #8]
	movs r4, #0
	lsls r3, r3, #0xa
	adds r3, r0, r3
	adcs r1, r4
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	orrs r1, r0
	ldr r0, [sp, #0x68]
	adds r1, r2, r1
	str r1, [r0]
	ldr r0, [sp, #0x6c]
	str r6, [r0]
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02261378: .4byte 0x00000000
	thumb_func_end ov91_02261208

	thumb_func_start ov91_0226137C
ov91_0226137C: @ 0x0226137C
	movs r2, #0x66
	lsls r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov91_0226137C

	thumb_func_start ov91_02261384
ov91_02261384: @ 0x02261384
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	movs r1, #0x19
	adds r5, r0, #0
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	add r0, sp, #0
	bl FUN_02023618
	add r0, sp, #0
	movs r1, #0x19
	strh r4, [r0]
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	add r0, sp, #0
	bl FUN_02023558
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov91_02261384

	thumb_func_start ov91_022613AC
ov91_022613AC: @ 0x022613AC
	movs r2, #0
	strb r2, [r0]
	strb r2, [r0, #1]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	strb r2, [r0, #4]
	strb r2, [r0, #5]
	strb r2, [r0, #6]
	strb r2, [r0, #7]
	movs r2, #2
	strh r2, [r0, #4]
	strb r1, [r0, #6]
	bx lr
	.align 2, 0
	thumb_func_end ov91_022613AC

	thumb_func_start ov91_022613C8
ov91_022613C8: @ 0x022613C8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4]
	adds r5, r1, #0
	cmp r0, #3
	bhi _022614CA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022613E2: @ jump table
	.2byte _022614CA - _022613E2 - 2 @ case 0
	.2byte _022613EA - _022613E2 - 2 @ case 1
	.2byte _02261406 - _022613E2 - 2 @ case 2
	.2byte _0226148E - _022613E2 - 2 @ case 3
_022613EA:
	movs r1, #4
	ldrsh r1, [r4, r1]
	ldrb r2, [r4, #6]
	adds r0, r5, #0
	subs r1, r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ov91_022614FC
	ldrh r0, [r4]
	adds r0, r0, #1
	strh r0, [r4]
	movs r0, #0
	strh r0, [r4, #2]
_02261406:
	movs r0, #2
	ldrsh r0, [r4, r0]
	cmp r0, #0x10
	blt _0226143E
	movs r0, #3
	strh r0, [r4]
	movs r0, #0
	strh r0, [r4, #2]
	movs r1, #4
	ldrsh r1, [r4, r1]
	ldrb r2, [r4, #6]
	adds r0, r5, #0
	bl ov91_022614FC
	movs r0, #0x10
	str r0, [sp]
	movs r1, #4
	ldrsh r2, [r4, r1]
	movs r3, #1
	adds r1, r3, #0
	lsls r1, r2
	ldr r0, _022614D0 @ =0x04001050
	movs r2, #8
	movs r3, #0
	blx FUN_020CF15C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0226143E:
	adds r0, r0, #1
	strh r0, [r4, #2]
	movs r0, #4
	ldrsh r2, [r4, r0]
	subs r5, r2, #2
	subs r6, r2, #1
	cmp r2, #0
	bge _02261450
	adds r2, r2, #3
_02261450:
	cmp r5, #0
	bge _02261456
	adds r5, r5, #3
_02261456:
	cmp r6, #0
	bge _0226145C
	adds r6, r6, #3
_0226145C:
	movs r0, #2
	ldrsh r0, [r4, r0]
	movs r4, #1
	lsls r1, r0, #4
	asrs r0, r1, #3
	lsrs r0, r0, #0x1c
	adds r0, r1, r0
	asrs r1, r0, #4
	movs r0, #0x10
	subs r3, r0, r1
	adds r1, r4, #0
	lsls r1, r2
	adds r2, r4, #0
	subs r0, r0, r3
	str r0, [sp]
	lsls r2, r5
	lsls r4, r6
	orrs r4, r2
	movs r2, #8
	ldr r0, _022614D0 @ =0x04001050
	orrs r2, r4
	blx FUN_020CF15C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0226148E:
	movs r0, #2
	ldrsh r1, [r4, r0]
	cmp r1, #8
	blt _022614A2
	movs r1, #0
	ldr r0, _022614D0 @ =0x04001050
	strh r1, [r4]
	strh r1, [r0]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_022614A2:
	adds r1, r1, #1
	strh r1, [r4, #2]
	ldrsh r0, [r4, r0]
	movs r5, #1
	lsls r1, r0, #4
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r3, r0, #3
	movs r0, #0x10
	subs r0, r0, r3
	str r0, [sp]
	movs r1, #4
	ldrsh r2, [r4, r1]
	adds r1, r5, #0
	ldr r0, _022614D0 @ =0x04001050
	lsls r1, r2
	movs r2, #8
	blx FUN_020CF15C
_022614CA:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_022614D0: .4byte 0x04001050
	thumb_func_end ov91_022613C8

	thumb_func_start ov91_022614D4
ov91_022614D4: @ 0x022614D4
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #7]
	adds r0, r0, #1
	strb r0, [r4, #7]
	ldrb r0, [r4, #7]
	cmp r0, #0xa
	blo _022614FA
	movs r0, #1
	strh r0, [r4]
	movs r0, #4
	ldrsh r0, [r4, r0]
	movs r1, #3
	adds r0, r0, #1
	blx FUN_020F2998
	strh r1, [r4, #4]
	movs r0, #0
	strb r0, [r4, #7]
_022614FA:
	pop {r4, pc}
	thumb_func_end ov91_022614D4

	thumb_func_start ov91_022614FC
ov91_022614FC: @ 0x022614FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	lsls r0, r2, #1
	str r1, [sp, #0xc]
	adds r1, r0, #2
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	lsls r0, r1, #0x18
	movs r4, #0
	lsrs r7, r0, #0x18
_02261516:
	ldr r0, [sp, #0xc]
	subs r5, r0, r4
	bpl _0226151E
	adds r5, r5, #3
_0226151E:
	movs r1, #2
	adds r0, r5, #4
	subs r1, r1, r4
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	cmp r4, #0
	bne _0226154E
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	adds r1, r5, #4
	lsls r1, r1, #0x18
	movs r2, #0
	ldr r0, [r6]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201CA4C
	b _02261568
_0226154E:
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	adds r1, r5, #4
	str r0, [sp, #8]
	lsls r1, r1, #0x18
	movs r2, #0
	ldr r0, [r6]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201CA4C
_02261568:
	adds r1, r5, #4
	lsls r1, r1, #0x18
	ldr r0, [r6]
	lsrs r1, r1, #0x18
	bl FUN_0201BF7C
	adds r4, r4, #1
	cmp r4, #3
	blt _02261516
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov91_022614FC

	thumb_func_start ov91_02261580
ov91_02261580: @ 0x02261580
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	adds r5, r0, #0
	adds r6, r3, #0
	adds r0, #0x9c
	adds r4, r1, #0
	str r6, [r0]
	movs r1, #0x8c
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r7, r2, #0
	str r6, [sp, #8]
	adds r1, #0xbc
	ldr r0, [r4, r1]
	adds r1, r7, #0
	movs r2, #0xa
	movs r3, #0
	bl FUN_0200A3C8
	str r0, [r5]
	movs r1, #0x8c
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	adds r1, #0xc0
	ldr r0, [r4, r1]
	adds r1, r7, #0
	movs r2, #0xb
	movs r3, #0
	bl FUN_0200A480
	str r0, [r5, #4]
	movs r1, #0x8c
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r1, #0xc4
	ldr r0, [r4, r1]
	adds r1, r7, #0
	movs r2, #9
	movs r3, #0
	bl FUN_0200A540
	str r0, [r5, #8]
	movs r1, #0x8c
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r1, #0xc8
	ldr r0, [r4, r1]
	adds r1, r7, #0
	movs r2, #8
	movs r3, #0
	bl FUN_0200A540
	str r0, [r5, #0xc]
	ldr r0, [r5]
	bl FUN_0200AE18
	cmp r0, #0
	bne _02261608
	bl FUN_0202551C
_02261608:
	ldr r0, [r5, #4]
	bl FUN_0200B00C
	cmp r0, #0
	bne _02261616
	bl FUN_0202551C
_02261616:
	ldr r0, [r5]
	bl FUN_0200A740
	ldr r0, [r5, #4]
	bl FUN_0200A740
	movs r1, #0x8c
	adds r0, r1, #0
	adds r2, r1, #0
	str r1, [sp]
	subs r0, #0x8d
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r2, #0xbc
	ldr r2, [r4, r2]
	adds r3, r1, #0
	str r2, [sp, #0x14]
	adds r2, r1, #0
	adds r2, #0xc0
	ldr r2, [r4, r2]
	str r2, [sp, #0x18]
	adds r2, r1, #0
	adds r2, #0xc4
	ldr r2, [r4, r2]
	str r2, [sp, #0x1c]
	adds r2, r1, #0
	adds r2, #0xc8
	ldr r2, [r4, r2]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r5, #0
	adds r0, #0x10
	adds r2, r1, #0
	bl FUN_02009D48
	ldr r0, [r4, #0x1c]
	str r0, [sp, #0x5c]
	adds r0, r5, #0
	adds r0, #0x10
	str r0, [sp, #0x60]
	ldr r0, _0226178C @ =0xFFFC0000
	str r6, [sp, #0x78]
	str r0, [sp, #0x64]
	movs r0, #3
	lsls r0, r0, #0x10
	str r0, [sp, #0x68]
	movs r0, #1
	str r0, [sp, #0x70]
	str r0, [sp, #0x74]
	add r0, sp, #0x5c
	bl FUN_02024714
	movs r1, #0
	str r0, [r5, #0x34]
	bl FUN_02024830
	movs r0, #0x10
	adds r1, r6, #0
	bl FUN_02026354
	str r0, [r5, #0x5c]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r1, r5, #0
	ldr r0, [r4]
	adds r1, #0x38
	movs r2, #3
	movs r3, #2
	bl FUN_0201D494
	adds r0, r5, #0
	adds r0, #0x38
	adds r1, r6, #0
	bl FUN_02013910
	movs r1, #1
	str r0, [r5, #0x4c]
	bl FUN_02013948
	movs r1, #1
	adds r3, r5, #0
	adds r2, r1, #0
	adds r3, #0x50
	bl FUN_02021AC8
	cmp r0, #1
	beq _022616D2
	bl FUN_0202551C
_022616D2:
	movs r1, #0x96
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	adds r1, #0xb6
	ldr r0, [r4, r1]
	movs r1, #0x10
	movs r2, #7
	movs r3, #0
	bl FUN_0200A234
	str r0, [r5, #0x60]
	bl FUN_0200B00C
	cmp r0, #0
	bne _022616FA
	bl FUN_0202551C
_022616FA:
	ldr r0, [r5, #0x60]
	bl FUN_0200A740
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	str r0, [sp, #0x2c]
	adds r0, r5, #0
	adds r0, #0x38
	str r0, [sp, #0x30]
	ldr r0, [r4, #0x1c]
	str r0, [sp, #0x34]
	ldr r0, [r5, #0x60]
	bl FUN_0200B0F8
	str r0, [sp, #0x38]
	ldr r0, [r5, #0x34]
	str r0, [sp, #0x3c]
	ldr r0, [r5, #0x54]
	str r0, [sp, #0x40]
	movs r0, #6
	mvns r0, r0
	str r0, [sp, #0x44]
	adds r0, r0, #2
	str r0, [sp, #0x48]
	movs r0, #0
	str r0, [sp, #0x4c]
	str r0, [sp, #0x50]
	movs r0, #1
	str r0, [sp, #0x54]
	str r6, [sp, #0x58]
	ldr r1, [r5, #0x4c]
	add r0, sp, #0x2c
	bl FUN_02013950
	movs r1, #0
	str r0, [r5, #0x48]
	bl FUN_020137C0
	adds r0, r5, #0
	adds r0, #0x38
	bl FUN_0201D520
	movs r2, #8
	adds r0, r5, #0
	movs r3, #9
	str r2, [sp]
	ldr r1, _0226178C @ =0xFFFC0000
	adds r0, #0x64
	lsls r2, r2, #0xe
	lsls r3, r3, #0xe
	bl ov91_0225D40C
	movs r0, #4
	movs r1, #3
	lsls r1, r1, #0x10
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x7c
	adds r2, r1, #0
	lsrs r3, r1, #2
	bl ov91_0225D40C
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x94
	strh r1, [r0]
	movs r0, #4
	adds r5, #0x96
	strh r0, [r5]
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0226178C: .4byte 0xFFFC0000
	thumb_func_end ov91_02261580

	thumb_func_start ov91_02261790
ov91_02261790: @ 0x02261790
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x48]
	adds r4, r1, #0
	bl FUN_020139C8
	ldr r0, [r5, #0x60]
	bl FUN_0200B0A8
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5, #0x60]
	bl FUN_0200A75C
	adds r0, r5, #0
	adds r0, #0x50
	bl FUN_02021B5C
	ldr r0, [r5, #0x4c]
	bl FUN_02013938
	ldr r0, [r5, #0x5c]
	bl FUN_02026380
	ldr r0, [r5, #0x34]
	bl FUN_02024758
	ldr r0, [r5]
	bl FUN_0200AEB0
	ldr r0, [r5, #4]
	bl FUN_0200B0A8
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5]
	bl FUN_0200A75C
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5, #4]
	bl FUN_0200A75C
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r5, #8]
	bl FUN_0200A75C
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5, #0xc]
	bl FUN_0200A75C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov91_02261790

	thumb_func_start ov91_02261808
ov91_02261808: @ 0x02261808
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #1
	adds r4, r1, #0
	str r0, [sp]
	adds r1, r2, #0
	movs r2, #2
	ldr r0, [r5, #0x5c]
	adds r3, r2, #0
	bl FUN_02026464
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r1, r5, #0
	ldr r0, [r4]
	adds r1, #0x38
	movs r2, #3
	movs r3, #2
	bl FUN_0201D494
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0226188C @ =0x000F0E00
	adds r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x5c]
	adds r0, #0x38
	bl FUN_020200FC
	adds r3, r5, #0
	adds r3, #0x9c
	adds r2, r5, #0
	ldr r0, [r5, #0x48]
	ldr r1, [r5, #0x4c]
	ldr r3, [r3]
	adds r2, #0x38
	bl FUN_020139D0
	adds r0, r5, #0
	adds r0, #0x38
	bl FUN_0201D520
	ldr r0, [r5, #0x48]
	movs r1, #1
	bl FUN_020137C0
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl FUN_02024830
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0x98
	strh r1, [r0]
	movs r0, #0
	adds r5, #0x9a
	strh r0, [r5]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0226188C: .4byte 0x000F0E00
	thumb_func_end ov91_02261808

	thumb_func_start ov91_02261890
ov91_02261890: @ 0x02261890
	adds r1, r0, #0
	adds r1, #0x98
	ldrh r1, [r1]
	cmp r1, #3
	beq _022618AC
	cmp r1, #2
	bne _022618A6
	adds r1, r0, #0
	movs r2, #0xc
	adds r1, #0x9a
	strh r2, [r1]
_022618A6:
	movs r1, #3
	adds r0, #0x98
	strh r1, [r0]
_022618AC:
	bx lr
	.align 2, 0
	thumb_func_end ov91_02261890

	thumb_func_start ov91_022618B0
ov91_022618B0: @ 0x022618B0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x98
	ldrh r0, [r0]
	adds r4, r1, #0
	cmp r0, #3
	beq _0226191E
	movs r0, #1
	str r0, [sp]
	adds r1, r2, #0
	movs r2, #2
	ldr r0, [r5, #0x5c]
	adds r3, r2, #0
	bl FUN_02026464
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r1, r5, #0
	ldr r0, [r4]
	adds r1, #0x38
	movs r2, #3
	movs r3, #2
	bl FUN_0201D494
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02261924 @ =0x000F0E00
	adds r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x5c]
	adds r0, #0x38
	bl FUN_020200FC
	adds r3, r5, #0
	adds r3, #0x9c
	adds r2, r5, #0
	ldr r0, [r5, #0x48]
	ldr r1, [r5, #0x4c]
	ldr r3, [r3]
	adds r2, #0x38
	bl FUN_020139D0
	adds r0, r5, #0
	adds r0, #0x38
	bl FUN_0201D520
	movs r0, #0
	adds r5, #0x96
	strh r0, [r5]
_0226191E:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02261924: .4byte 0x000F0E00
	thumb_func_end ov91_022618B0

	thumb_func_start ov91_02261928
ov91_02261928: @ 0x02261928
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x98
	ldrh r0, [r0]
	cmp r0, #3
	bhi _022619A0
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02261942: @ jump table
	.2byte _022619A0 - _02261942 - 2 @ case 0
	.2byte _0226194A - _02261942 - 2 @ case 1
	.2byte _022619A0 - _02261942 - 2 @ case 2
	.2byte _02261966 - _02261942 - 2 @ case 3
_0226194A:
	movs r0, #0x94
	ldrsh r0, [r4, r0]
	cmp r0, #8
	bge _0226195C
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x94
	strh r1, [r0]
	b _022619A0
_0226195C:
	adds r0, r4, #0
	movs r1, #2
	adds r0, #0x98
	strh r1, [r0]
	b _022619A0
_02261966:
	movs r0, #0x9a
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02261978
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x9a
	strh r1, [r0]
	b _022619A0
_02261978:
	movs r0, #0x94
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0226198A
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x94
	strh r1, [r0]
	b _022619A0
_0226198A:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x98
	strh r1, [r0]
	ldr r0, [r4, #0x48]
	bl FUN_020137C0
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl FUN_02024830
_022619A0:
	movs r1, #0x96
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bge _022619C0
	adds r2, r0, #1
	adds r0, r4, #0
	adds r0, #0x96
	strh r2, [r0]
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	adds r0, #0x8c
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x7c
	bl ov91_0225D46C
_022619C0:
	movs r0, #0x94
	ldrsh r0, [r4, r0]
	str r0, [r4, #0x74]
	adds r0, r4, #0
	adds r0, #0x64
	bl ov91_0225D46C
	ldr r0, [r4, #0x64]
	add r1, sp, #0
	str r0, [sp]
	ldr r0, [r4, #0x7c]
	str r0, [sp, #4]
	ldr r0, [r4, #0x34]
	bl FUN_020247D4
	ldr r0, [r4, #0x48]
	bl FUN_02013728
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov91_02261928

	thumb_func_start ov91_022619E8
ov91_022619E8: @ 0x022619E8
	movs r2, #0
	strh r2, [r0]
	movs r1, #1
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	ldr r3, _022619F8 @ =FUN_0200604C
	ldr r0, _022619FC @ =0x00000586
	bx r3
	.align 2, 0
_022619F8: .4byte FUN_0200604C
_022619FC: .4byte 0x00000586
	thumb_func_end ov91_022619E8

	thumb_func_start ov91_02261A00
ov91_02261A00: @ 0x02261A00
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	adds r5, r1, #0
	adds r6, r2, #0
	cmp r0, #0
	beq _02261B08
	ldrh r0, [r4]
	cmp r0, #5
	bhi _02261B08
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02261A22: @ jump table
	.2byte _02261A2E - _02261A22 - 2 @ case 0
	.2byte _02261A8E - _02261A22 - 2 @ case 1
	.2byte _02261AA8 - _02261A22 - 2 @ case 2
	.2byte _02261AD4 - _02261A22 - 2 @ case 3
	.2byte _02261AEE - _02261A22 - 2 @ case 4
	.2byte _02261B02 - _02261A22 - 2 @ case 5
_02261A2E:
	movs r0, #3
	ldrsb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, #3]
	ldrsb r1, [r4, r0]
	movs r0, #0x19
	lsls r0, r0, #0xc
	muls r0, r1, r0
	movs r1, #0x3a
	blx FUN_020F2998
	movs r1, #1
	adds r2, r0, #0
	lsls r1, r1, #0xc
	adds r0, r5, #0
	adds r1, r2, r1
	bl ov91_02261200
	movs r0, #3
	ldrsb r1, [r4, r0]
	movs r0, #0x96
	muls r0, r1, r0
	movs r1, #0x3a
	blx FUN_020F2998
	adds r2, r0, #0
	movs r0, #7
	adds r1, r0, #0
	adds r1, #0xf9
	adds r1, r2, r1
	bl FUN_0200596C
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0xc
	bne _02261A7C
	ldr r0, _02261B0C @ =0x00000587
	bl FUN_0200604C
_02261A7C:
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0x3a
	blt _02261B08
	ldrh r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strh r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02261A8E:
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #0
	movs r3, #0x3f
	bl FUN_0200B484
	ldrh r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strh r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02261AA8:
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #1
	bne _02261B08
	adds r0, r5, #0
	bl ov91_022611D0
	movs r1, #2
	adds r0, r5, #0
	lsls r1, r1, #0xc
	bl ov91_02261200
	adds r0, r6, #0
	movs r1, #1
	bl ov91_02260364
	ldrh r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strh r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02261AD4:
	movs r0, #1
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	movs r2, #0x10
	movs r3, #0x3f
	bl FUN_0200B484
	ldrh r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strh r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02261AEE:
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #1
	bne _02261B08
	ldrh r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strh r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02261B02:
	movs r0, #0
	strb r0, [r4, #2]
	strh r0, [r4]
_02261B08:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02261B0C: .4byte 0x00000587
	thumb_func_end ov91_02261A00

	thumb_func_start ov91_02261B10
ov91_02261B10: @ 0x02261B10
	movs r0, #7
	adds r1, r0, #0
	ldr r3, _02261B1C @ =FUN_0200596C
	adds r1, #0xf9
	bx r3
	nop
_02261B1C: .4byte FUN_0200596C
	thumb_func_end ov91_02261B10

	thumb_func_start ov91_02261B20
ov91_02261B20: @ 0x02261B20
	ldr r0, _02261B24 @ =0x02262754
	bx lr
	.align 2, 0
_02261B24: .4byte 0x02262754
	thumb_func_end ov91_02261B20

	thumb_func_start ov91_02261B28
ov91_02261B28: @ 0x02261B28
	movs r0, #8
	bx lr
	thumb_func_end ov91_02261B28

	thumb_func_start ov91_02261B2C
ov91_02261B2C: @ 0x02261B2C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov91_02261B20
	adds r4, r0, #0
	bl ov91_02261B28
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_0203410C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov91_02261B2C

	thumb_func_start ov91_02261B48
ov91_02261B48: @ 0x02261B48
	movs r0, #0
	bx lr
	thumb_func_end ov91_02261B48

	thumb_func_start ov91_02261B4C
ov91_02261B4C: @ 0x02261B4C
	adds r0, r3, #0
	ldr r3, _02261B54 @ =ov91_0225CA64
	bx r3
	nop
_02261B54: .4byte ov91_0225CA64
	thumb_func_end ov91_02261B4C

	thumb_func_start ov91_02261B58
ov91_02261B58: @ 0x02261B58
	adds r0, r3, #0
	ldr r3, _02261B60 @ =ov91_0225CA6C
	bx r3
	nop
_02261B60: .4byte ov91_0225CA6C
	thumb_func_end ov91_02261B58

	thumb_func_start ov91_02261B64
ov91_02261B64: @ 0x02261B64
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	adds r6, r3, #0
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl ov91_0225CA90
	bl FUN_0203769C
	cmp r0, #0
	bne _02261B88
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl ov91_0225CA74
_02261B88:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov91_02261B64

	thumb_func_start ov91_02261B8C
ov91_02261B8C: @ 0x02261B8C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r2]
	adds r0, r3, #0
	adds r2, r4, #0
	bl ov91_0225CA9C
	pop {r4, pc}
	thumb_func_end ov91_02261B8C

	thumb_func_start ov91_02261B9C
ov91_02261B9C: @ 0x02261B9C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r4, #0
	bl ov91_0225CABC
	pop {r4, pc}
	thumb_func_end ov91_02261B9C

	thumb_func_start ov91_02261BAC
ov91_02261BAC: @ 0x02261BAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r2]
	adds r0, r3, #0
	adds r2, r4, #0
	bl ov91_0225CAEC
	pop {r4, pc}
	thumb_func_end ov91_02261BAC

	thumb_func_start ov91_02261BBC
ov91_02261BBC: @ 0x02261BBC
	adds r0, r3, #0
	ldr r3, _02261BC4 @ =ov91_0225CB50
	bx r3
	nop
_02261BC4: .4byte ov91_0225CB50
	thumb_func_end ov91_02261BBC

	thumb_func_start ov91_02261BC8
ov91_02261BC8: @ 0x02261BC8
	push {r3, lr}
	ldr r1, [r2]
	cmp r0, #0
	bne _02261BD6
	adds r0, r3, #0
	bl ov91_0225CAE0
_02261BD6:
	pop {r3, pc}
	thumb_func_end ov91_02261BC8

	thumb_func_start ov91_02261BD8
ov91_02261BD8: @ 0x02261BD8
	movs r0, #0x14
	bx lr
	thumb_func_end ov91_02261BD8

	thumb_func_start ov91_02261BDC
ov91_02261BDC: @ 0x02261BDC
	movs r0, #0x10
	bx lr
	thumb_func_end ov91_02261BDC

	thumb_func_start ov91_02261BE0
ov91_02261BE0: @ 0x02261BE0
	movs r0, #4
	bx lr
	thumb_func_end ov91_02261BE0

	thumb_func_start ov91_02261BE4
ov91_02261BE4: @ 0x02261BE4
	movs r0, #4
	bx lr
	thumb_func_end ov91_02261BE4

	.rodata

_02261BE8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x0A, 0x0B
	.byte 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x00, 0x00, 0x00, 0x26, 0x00, 0x27, 0x00, 0x28, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x17, 0x00, 0x18, 0x00, 0x19, 0x00, 0x23, 0x00, 0x23, 0x00, 0x22, 0x00
	.byte 0x21, 0x00, 0x00, 0x00, 0x01, 0x0A, 0x0B, 0x14, 0x15, 0x1E, 0x1F, 0x28, 0x1A, 0x00, 0x1B, 0x00
	.byte 0x1C, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0xFA, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00, 0x2C, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x94, 0x02, 0x00, 0x00, 0xEE, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x40, 0x9C, 0x00, 0x00, 0x00, 0x00, 0x00, 0xED, 0xE1, 0x25, 0x02, 0xF5, 0xE1, 0x25, 0x02
	.byte 0xFD, 0xE1, 0x25, 0x02, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xB1, 0x00, 0xA7, 0x00, 0x93, 0x00, 0x89, 0x00, 0x7F, 0x00, 0x75, 0x00
	.byte 0x6B, 0x00, 0x61, 0x00, 0x57, 0x00, 0x4D, 0x00, 0x4D, 0x00, 0x4D, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1B, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0x55, 0xAA, 0xAA, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F
	.byte 0xFF, 0x3F, 0xFF, 0xBF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F, 0x54, 0xD5, 0xAA, 0x2A, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0xBF, 0xFF, 0x3F, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x32, 0x00, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x33, 0x00, 0x00, 0x00, 0x00, 0x70, 0x54, 0x6F, 0x72
	.byte 0x75, 0x73, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6E, 0x75, 0x6C, 0x6C
	.byte 0x31, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x37, 0x00, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x31, 0x33, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x33, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x31, 0x33, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6E, 0x75, 0x6C, 0x6C
	.byte 0x31, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x43, 0x79, 0x6C
	.byte 0x69, 0x6E, 0x64, 0x65, 0x72, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x43, 0x79, 0x6C
	.byte 0x69, 0x6E, 0x64, 0x65, 0x72, 0x35, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x33, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x54, 0x6F, 0x72
	.byte 0x75, 0x73, 0x31, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x54, 0x6F, 0x72
	.byte 0x75, 0x73, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x31, 0x33, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x38, 0x00, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x32, 0x00, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x33, 0x00, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x37, 0x00, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x31, 0x32, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x37, 0x00, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x31, 0x33, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x33, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6E, 0x75, 0x6C, 0x6C
	.byte 0x31, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x37, 0x00, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6C, 0x79
	.byte 0x53, 0x75, 0x72, 0x66, 0x61, 0x63, 0x65, 0x31, 0x33, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x33, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x53, 0x70, 0x68
	.byte 0x65, 0x72, 0x65, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02
	.byte 0x01, 0x00, 0x00, 0x00, 0x4D, 0x1B, 0x26, 0x02, 0x49, 0x1B, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x59, 0x1B, 0x26, 0x02, 0x49, 0x1B, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0x65, 0x1B, 0x26, 0x02
	.byte 0xD9, 0x1B, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0x8D, 0x1B, 0x26, 0x02, 0xE1, 0x1B, 0x26, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x9D, 0x1B, 0x26, 0x02, 0xDD, 0x1B, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0xC9, 0x1B, 0x26, 0x02, 0xE5, 0x1B, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0xAD, 0x1B, 0x26, 0x02
	.byte 0xE1, 0x1B, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0xBD, 0x1B, 0x26, 0x02, 0x49, 0x1B, 0x26, 0x02
	.byte 0x00, 0x00, 0x00, 0x00
	@ 0x022627B4
