
	thumb_func_start ov24_022598C0
ov24_022598C0: @ 0x022598C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #3
	movs r1, #0xc0
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0xc0
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #3
	str r0, [r4]
	ldr r0, [r5, #0xc]
	str r0, [r4, #4]
	movs r0, #0x14
	strh r0, [r4, #0x18]
	ldr r0, [r4]
	bl FUN_0206DD2C
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	bl FUN_0202A634
	bl FUN_0202A55C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1f
	ldrb r1, [r4, #0x17]
	movs r2, #2
	lsrs r0, r0, #0x1e
	bics r1, r2
	orrs r0, r1
	strb r0, [r4, #0x17]
	adds r0, r4, #0
	strb r6, [r4, #0x16]
	bl ov24_02259BB4
	adds r0, r4, #0
	bl ov24_02259CC0
	adds r0, r4, #0
	bl ov24_02259DF0
	adds r0, r5, #0
	bl FUN_02055418
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov24_022598C0

	thumb_func_start ov24_02259928
ov24_02259928: @ 0x02259928
	push {r4, lr}
	adds r4, r0, #0
	bl ov24_02259C10
	ldr r0, [r4, #0x10]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov24_02259928

	thumb_func_start ov24_02259940
ov24_02259940: @ 0x02259940
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	movs r2, #5
	adds r1, #0xac
	adds r5, r4, #0
	strb r2, [r1]
	ldr r1, [r4, #0x10]
	adds r5, #0xac
	bl ov24_02259E60
	strh r0, [r5, #2]
	ldr r0, [r4, #0x10]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r5, #6]
	movs r1, #0
_02259966:
	adds r0, r4, r1
	adds r0, #0xb8
	strb r1, [r0]
	adds r1, r1, #1
	cmp r1, #6
	blt _02259966
	movs r6, #0
_02259974:
	adds r0, r4, r6
	adds r0, #0xb8
	ldrb r0, [r0]
	movs r1, #0xc
	adds r2, r6, #1
	muls r1, r0, r1
	mov ip, r0
	adds r0, r4, r1
	adds r0, #0x72
	adds r3, r6, #0
	ldrh r5, [r0]
	cmp r2, #6
	bge _022599AE
	movs r7, #0xc
_02259990:
	adds r0, r4, r2
	adds r0, #0xb8
	ldrb r0, [r0]
	adds r1, r0, #0
	muls r1, r7, r1
	adds r0, r4, r1
	adds r0, #0x72
	ldrh r0, [r0]
	cmp r0, r5
	blt _022599A8
	adds r3, r2, #0
	adds r5, r0, #0
_022599A8:
	adds r2, r2, #1
	cmp r2, #6
	blt _02259990
_022599AE:
	adds r0, r4, r3
	adds r0, #0xb8
	ldrb r1, [r0]
	adds r0, r4, r6
	adds r0, #0xb8
	strb r1, [r0]
	adds r1, r4, r3
	adds r1, #0xb8
	mov r0, ip
	adds r6, r6, #1
	strb r0, [r1]
	cmp r6, #5
	blt _02259974
	ldrb r1, [r4, #0x17]
	movs r0, #0xfc
	movs r2, #0
	bics r1, r0
	movs r0, #0xc
	orrs r0, r1
	strb r0, [r4, #0x17]
_022599D6:
	adds r0, r4, r2
	adds r0, #0xb8
	ldrb r0, [r0]
	cmp r0, #5
	bne _022599F4
	ldrb r1, [r4, #0x17]
	movs r0, #0xfc
	bics r1, r0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	orrs r0, r1
	strb r0, [r4, #0x17]
	b _022599FA
_022599F4:
	adds r2, r2, #1
	cmp r2, #3
	blt _022599D6
_022599FA:
	ldrb r0, [r4, #0x17]
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x1a
	beq _02259A0C
	cmp r1, #1
	beq _02259A34
	cmp r1, #2
	beq _02259A3A
	b _02259A40
_02259A0C:
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _02259A22
	bl FUN_0201FD44
	movs r1, #0xa
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	b _02259A24
_02259A22:
	movs r0, #0
_02259A24:
	cmp r0, #6
	bhs _02259A2E
	adds r0, #0x50
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
_02259A2E:
	adds r0, #0x65
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
_02259A34:
	movs r0, #0xe5
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
_02259A3A:
	movs r0, #0x9e
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
_02259A40:
	ldr r0, _02259A48 @ =0x00000127
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02259A48: .4byte 0x00000127
	thumb_func_end ov24_02259940

	thumb_func_start ov24_02259A4C
ov24_02259A4C: @ 0x02259A4C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r2, #0
	adds r2, r0, r3
	adds r2, #0xb8
	ldrb r4, [r2]
	adds r6, r1, #0
	adds r1, r0, #0
	movs r2, #0xc
	adds r1, #0x70
	muls r2, r4, r2
	adds r4, r1, r2
	ldrb r1, [r0, #0x17]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1a
	cmp r3, r1
	bne _02259A80
	ldr r0, [r0, #4]
	bl FUN_02028E9C
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0200BE48
	b _02259AB4
_02259A80:
	ldrb r1, [r4]
	adds r0, r6, #0
	adds r1, #0x4e
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r3, #2
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	str r3, [sp, #4]
	bl FUN_0200BE3C
	adds r0, r6, #0
	bl FUN_02026380
	ldrb r2, [r4]
	adds r0, r5, #0
	movs r1, #2
	lsls r3, r2, #1
	ldr r2, _02259AD8 @ =_02259F28
	ldrh r2, [r2, r3]
	bl FUN_0200C2D4
_02259AB4:
	ldrh r2, [r4, #6]
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200BEE8
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #3
	ldrh r2, [r4, #2]
	adds r0, r5, #0
	adds r3, r1, #0
	bl FUN_0200BFCC
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02259AD8: .4byte _02259F28
	thumb_func_end ov24_02259A4C

	thumb_func_start ov24_02259ADC
ov24_02259ADC: @ 0x02259ADC
	movs r3, #0
_02259ADE:
	adds r2, r0, #0
	adds r2, #0x70
	ldrb r2, [r2]
	cmp r1, r2
	bne _02259AEC
	movs r0, #1
	bx lr
_02259AEC:
	adds r3, r3, #1
	adds r0, #0xc
	cmp r3, #5
	blt _02259ADE
	movs r0, #0
	bx lr
	thumb_func_end ov24_02259ADC

	thumb_func_start ov24_02259AF8
ov24_02259AF8: @ 0x02259AF8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrb r0, [r5, #0x17]
	adds r4, r1, #0
	adds r6, r2, #0
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _02259B10
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02259B10:
	ldr r1, [r5]
	movs r0, #0xc
	bl FUN_02026354
	adds r7, r0, #0
	ldr r0, [r5, #0x10]
	movs r1, #0x77
	adds r2, r7, #0
	bl FUN_0206E540
	movs r0, #1
	str r0, [sp]
	movs r3, #2
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	str r3, [sp, #4]
	bl FUN_0200BE3C
	adds r0, r7, #0
	bl FUN_02026380
	ldrb r0, [r5, #0x15]
	cmp r0, #6
	blo _02259B48
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02259B48:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov24_02259AF8

	thumb_func_start ov24_02259B50
ov24_02259B50: @ 0x02259B50
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	movs r1, #8
	bl FUN_0201AACC
	adds r6, r0, #0
	bl FUN_0201FD44
	movs r1, #0x64
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0
	adds r2, r5, #0
_02259B70:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r3, r0
	bge _02259B82
	adds r1, r1, #1
	adds r2, #8
	cmp r1, #0xa
	blt _02259B70
_02259B82:
	lsls r7, r1, #3
	adds r1, r5, r7
	ldrh r0, [r1, #0x20]
	adds r5, #0x22
	adds r1, #0x23
	str r0, [r6]
	ldrb r1, [r1]
	ldrb r0, [r5, r7]
	subs r0, r1, r0
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl FUN_0201FD44
	adds r1, r4, #0
	blx FUN_020F2998
	ldrb r0, [r5, r7]
	adds r0, r0, r1
	strh r0, [r6, #4]
	movs r0, #0
	strh r0, [r6, #6]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov24_02259B50

	thumb_func_start ov24_02259BB4
ov24_02259BB4: @ 0x02259BB4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	bl FUN_020744BC
	str r0, [r5, #8]
	ldr r0, [r5, #4]
	bl FUN_02074904
	str r0, [r5, #0xc]
	ldr r1, [r5, #8]
	bl FUN_020748B8
	ldr r0, [r5, #0xc]
	bl FUN_02074640
	strb r0, [r5, #0x15]
	ldr r0, [r5, #4]
	bl FUN_0205BD64
	strb r0, [r5, #0x14]
	ldrb r0, [r5, #0x15]
	movs r4, #0
	subs r0, r0, #1
	cmp r0, #0
	ble _02259C0C
	movs r7, #1
	adds r6, r4, #0
_02259BEC:
	ldrb r0, [r5, #0x14]
	cmp r4, r0
	ldr r0, [r5, #0xc]
	bge _02259BFC
	adds r1, r6, #0
	bl FUN_0207456C
	b _02259C02
_02259BFC:
	adds r1, r7, #0
	bl FUN_0207456C
_02259C02:
	ldrb r0, [r5, #0x15]
	adds r4, r4, #1
	subs r0, r0, #1
	cmp r4, r0
	blt _02259BEC
_02259C0C:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov24_02259BB4

	thumb_func_start ov24_02259C10
ov24_02259C10: @ 0x02259C10
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0206DD2C
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_02074644
	adds r1, r5, #0
	bl FUN_0207188C
	ldr r0, [r4, #0xc]
	add r1, sp, #0
	movs r2, #0
	bl FUN_02074670
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	bl FUN_020748B8
	ldrb r1, [r4, #0x14]
	ldr r0, [r4, #0xc]
	adds r2, r5, #0
	bl FUN_02074740
	ldrb r2, [r4, #0x14]
	ldr r0, [r4, #0xc]
	add r1, sp, #0
	bl FUN_020746BC
	adds r0, r5, #0
	bl FUN_0201AB0C
	ldr r0, [r4, #8]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #8]
	ldrb r0, [r4, #0x17]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _02259C92
	ldrb r0, [r4, #0x15]
	cmp r0, #6
	blo _02259C8A
	ldr r0, [r4, #4]
	bl FUN_020270D8
	adds r5, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_02070DB0
	adds r1, r0, #0
	adds r0, r5, #0
	bl FUN_02073BB8
	add sp, #8
	pop {r3, r4, r5, pc}
_02259C8A:
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	bl FUN_02074524
_02259C92:
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov24_02259C10

	thumb_func_start ov24_02259C98
ov24_02259C98: @ 0x02259C98
	push {r3, r4}
	movs r4, #0
	cmp r2, #0
	ble _02259CB8
_02259CA0:
	adds r3, r0, #0
	adds r3, #0x70
	ldrb r3, [r3]
	cmp r1, r3
	bne _02259CB0
	movs r0, #1
	pop {r3, r4}
	bx lr
_02259CB0:
	adds r4, r4, #1
	adds r0, #0xc
	cmp r4, r2
	blt _02259CA0
_02259CB8:
	movs r0, #0
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov24_02259C98

	thumb_func_start ov24_02259CC0
ov24_02259CC0: @ 0x02259CC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	adds r5, r0, #0
	add r0, sp, #0x10
	blx FUN_020D7F98
	ldr r1, _02259DEC @ =0x02259F40
	add r0, sp, #0x10
	blx FUN_020D8278
	cmp r0, #0
	bne _02259CE0
	bl FUN_0202551C
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
_02259CE0:
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x34]
	subs r4, r1, r0
	ldr r0, [r5]
	adds r1, r4, #0
	bl FUN_0201AACC
	str r0, [sp, #0xc]
	ldr r0, [r5]
	movs r1, #8
	bl FUN_0201AACC
	adds r6, r0, #0
	ldr r1, [sp, #0xc]
	add r0, sp, #0x10
	adds r2, r4, #0
	blx FUN_020D83CC
	movs r2, #0
	adds r3, r5, #0
	movs r1, #0xff
_02259D0A:
	adds r0, r3, #0
	adds r0, #0x70
	adds r2, r2, #1
	adds r3, #0xc
	strb r1, [r0]
	cmp r2, #5
	blt _02259D0A
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	str r0, [sp, #4]
	adds r0, #0x74
	adds r7, r5, #0
	str r0, [sp, #4]
_02259D26:
	bl FUN_0201FD44
	movs r1, #0xa
	blx FUN_020F2998
	ldr r2, [sp]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	lsls r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	lsrs r2, r2, #0x18
	bl ov24_02259C98
	cmp r0, #0
	bne _02259D26
	adds r0, r7, #0
	adds r0, #0x70
	strb r4, [r0]
	adds r0, r7, #0
	adds r0, #0x70
	ldrb r0, [r0]
	movs r4, #0
	adds r2, r4, #0
	lsls r1, r0, #6
	ldr r0, [sp, #0xc]
	adds r0, r0, r1
	str r0, [sp, #8]
	adds r3, r0, #0
_02259D60:
	ldrb r0, [r3]
	cmp r0, #0
	beq _02259D6E
	ldrb r0, [r5, #0x17]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _02259D7E
_02259D6E:
	ldrb r1, [r3, #1]
	cmp r1, #7
	bhs _02259D7A
	ldrb r0, [r5, #0x16]
	cmp r0, r1
	bne _02259D7E
_02259D7A:
	strb r2, [r6, r4]
	adds r4, r4, #1
_02259D7E:
	adds r2, r2, #1
	adds r3, #8
	cmp r2, #8
	blt _02259D60
	bl FUN_0201FD44
	adds r1, r4, #0
	blx FUN_020F2998
	ldrb r0, [r6, r1]
	movs r2, #8
	lsls r1, r0, #3
	ldr r0, [sp, #8]
	adds r0, r0, r1
	ldr r1, [sp, #4]
	blx FUN_020D4A50
	adds r0, r7, #0
	adds r0, #0x7a
	ldrh r4, [r0]
	bl FUN_0201FD44
	lsls r1, r4, #1
	blx FUN_020F2998
	subs r0, r1, r4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	adds r0, r7, #0
	adds r0, #0x78
	ldrh r0, [r0]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r0, #0x72
	strh r1, [r0]
	ldr r0, [sp, #4]
	adds r7, #0xc
	adds r0, #0xc
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r0, r0, #1
	str r0, [sp]
	cmp r0, #5
	blt _02259D26
	adds r0, r6, #0
	bl FUN_0201AB0C
	ldr r0, [sp, #0xc]
	bl FUN_0201AB0C
	add r0, sp, #0x10
	blx FUN_020D82C0
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02259DEC: .4byte 0x02259F40
	thumb_func_end ov24_02259CC0

	thumb_func_start ov24_02259DF0
ov24_02259DF0: @ 0x02259DF0
	push {r4, r5, r6, lr}
	sub sp, #0x48
	adds r5, r0, #0
	add r0, sp, #0
	blx FUN_020D7F98
	ldr r1, _02259E5C @ =0x02259F60
	add r0, sp, #0
	blx FUN_020D8278
	cmp r0, #0
	bne _02259E10
	bl FUN_0202551C
	add sp, #0x48
	pop {r4, r5, r6, pc}
_02259E10:
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x24]
	subs r6, r1, r0
	ldr r0, [r5]
	adds r1, r6, #0
	bl FUN_0201AACC
	adds r4, r0, #0
	add r0, sp, #0
	adds r1, r4, #0
	adds r2, r6, #0
	blx FUN_020D83CC
	ldrb r0, [r5, #0x17]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _02259E38
	ldrb r0, [r5, #0x16]
	lsrs r1, r0, #1
	b _02259E3A
_02259E38:
	movs r1, #0
_02259E3A:
	movs r0, #0xa
	muls r0, r1, r0
	lsls r0, r0, #3
	adds r5, #0x20
	adds r0, r4, r0
	adds r1, r5, #0
	movs r2, #0x50
	blx FUN_020D4A50
	adds r0, r4, #0
	bl FUN_0201AB0C
	add r0, sp, #0
	blx FUN_020D82C0
	add sp, #0x48
	pop {r4, r5, r6, pc}
	.align 2, 0
_02259E5C: .4byte 0x02259F60
	thumb_func_end ov24_02259DF0

	thumb_func_start ov24_02259E60
ov24_02259E60: @ 0x02259E60
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x17]
	movs r7, #0
	adds r6, r1, #0
	lsls r0, r0, #0x1f
	adds r5, r7, #0
	lsrs r0, r0, #0x1f
	bne _02259E76
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_02259E76:
	adds r0, r6, #0
	movs r1, #5
	adds r2, r7, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r1, r7, #0
	adds r3, r4, #0
_02259E88:
	ldrh r0, [r3, #0x20]
	cmp r2, r0
	bne _02259EA4
	adds r0, r4, #0
	lsls r1, r1, #3
	adds r0, #0x20
	adds r5, r0, r1
	adds r0, r4, r1
	adds r0, #0x25
	ldrb r0, [r0]
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _02259EAC
_02259EA4:
	adds r1, r1, #1
	adds r3, #8
	cmp r1, #0xa
	blt _02259E88
_02259EAC:
	cmp r5, #0
	bne _02259EB8
	bl FUN_0202551C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02259EB8:
	adds r0, r6, #0
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x64
	muls r1, r0, r1
	adds r0, r1, #0
	ldrb r1, [r5, #3]
	blx FUN_020F2BA4
	adds r0, r7, r0
	lsls r0, r0, #0x10
	movs r4, #0
	lsrs r7, r0, #0x10
	adds r5, r4, #0
_02259ED8:
	adds r1, r5, #0
	adds r0, r6, #0
	adds r1, #0x46
	movs r2, #0
	bl FUN_0206E540
	adds r0, r4, r0
	lsls r0, r0, #0x10
	adds r5, r5, #1
	lsrs r4, r0, #0x10
	cmp r5, #6
	blt _02259ED8
	movs r0, #0x64
	muls r0, r4, r0
	movs r1, #0xba
	blx FUN_020F2998
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r6, #0
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #0
	movs r0, #0x64
	muls r0, r4, r0
	blx FUN_020F2BA4
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov24_02259E60

	.rodata

_02259F28:
	.byte 0x06, 0x00, 0x06, 0x00, 0x19, 0x00, 0x14, 0x00
	.byte 0x06, 0x00, 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x02, 0x00, 0x3C, 0x00

	.data

_02259F40:
	.byte 0x64, 0x61, 0x74, 0x61, 0x2F, 0x6D, 0x75, 0x73, 0x68, 0x69, 0x2F, 0x6D, 0x75, 0x73, 0x68, 0x69
	.byte 0x5F, 0x74, 0x72, 0x61, 0x69, 0x6E, 0x65, 0x72, 0x2E, 0x62, 0x69, 0x6E, 0x00, 0x00, 0x00, 0x00
	.byte 0x64, 0x61, 0x74, 0x61, 0x2F, 0x6D, 0x75, 0x73, 0x68, 0x69, 0x2F, 0x6D, 0x75, 0x73, 0x68, 0x69
	.byte 0x5F, 0x65, 0x6E, 0x63, 0x6F, 0x75, 0x6E, 0x74, 0x2E, 0x62, 0x69, 0x6E, 0x00, 0x00, 0x00, 0x00
	@ 0x02259F80
