
	thumb_func_start ov17_02201BC0
ov17_02201BC0: @ 0x02201BC0
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
	ldr r0, _02201C08 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _02201C0C @ =0x04001000
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
_02201C08: .4byte 0xFFFFE0FF
_02201C0C: .4byte 0x04001000
	thumb_func_end ov17_02201BC0

	thumb_func_start ov17_02201C10
ov17_02201C10: @ 0x02201C10
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r1, [r5]
	adds r6, r0, #0
	cmp r1, #0
	beq _02201C22
	cmp r1, #1
	beq _02201C64
	b _02201C74
_02201C22:
	bl ov17_02201BC0
	movs r2, #2
	movs r0, #3
	movs r1, #0x83
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r1, #0x6b
	adds r0, r6, #0
	lsls r1, r1, #2
	movs r2, #0x83
	bl FUN_02007280
	movs r2, #0x6b
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x83
	str r0, [r4]
	adds r0, r6, #0
	bl FUN_020072A4
	str r0, [r4, #4]
	adds r0, r4, #0
	bl ov17_02201D30
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02201C74
_02201C64:
	bl FUN_02007290
	bl ov17_02201DF0
	cmp r0, #0
	beq _02201C74
	movs r0, #1
	pop {r4, r5, r6, pc}
_02201C74:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov17_02201C10

	thumb_func_start ov17_02201C78
ov17_02201C78: @ 0x02201C78
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #9
	bhi _02201CF4
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02201C94: @ jump table
	.2byte _02201CA8 - _02201C94 - 2 @ case 0
	.2byte _02201CB0 - _02201C94 - 2 @ case 1
	.2byte _02201CB8 - _02201C94 - 2 @ case 2
	.2byte _02201CC0 - _02201C94 - 2 @ case 3
	.2byte _02201CC8 - _02201C94 - 2 @ case 4
	.2byte _02201CD0 - _02201C94 - 2 @ case 5
	.2byte _02201CD8 - _02201C94 - 2 @ case 6
	.2byte _02201CE0 - _02201C94 - 2 @ case 7
	.2byte _02201CE8 - _02201C94 - 2 @ case 8
	.2byte _02201CF0 - _02201C94 - 2 @ case 9
_02201CA8:
	bl ov17_02201E50
	str r0, [r4]
	b _02201CF4
_02201CB0:
	bl ov17_02201EA8
	str r0, [r4]
	b _02201CF4
_02201CB8:
	bl ov17_02201EFC
	str r0, [r4]
	b _02201CF4
_02201CC0:
	bl ov17_02201F18
	str r0, [r4]
	b _02201CF4
_02201CC8:
	bl ov17_02201FE8
	str r0, [r4]
	b _02201CF4
_02201CD0:
	bl ov17_02202094
	str r0, [r4]
	b _02201CF4
_02201CD8:
	bl ov17_02202184
	str r0, [r4]
	b _02201CF4
_02201CE0:
	bl ov17_02202320
	str r0, [r4]
	b _02201CF4
_02201CE8:
	bl ov17_02202378
	str r0, [r4]
	b _02201CF4
_02201CF0:
	movs r0, #1
	pop {r3, r4, r5, pc}
_02201CF4:
	movs r0, #0x4d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200D020
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov17_02201C78

	thumb_func_start ov17_02201D04
ov17_02201D04: @ 0x02201D04
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov17_02201E3C
	cmp r0, #0
	bne _02201D1A
	movs r0, #0
	pop {r3, r4, r5, pc}
_02201D1A:
	adds r0, r4, #0
	bl ov17_02201DD8
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x83
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02201D04

	thumb_func_start ov17_02201D30
ov17_02201D30: @ 0x02201D30
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	bl FUN_020183F0
	str r0, [r5, #0x74]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl FUN_02028EA8
	adds r4, r0, #0
	bl FUN_0202AD3C
	adds r1, r5, #0
	adds r1, #0x78
	strb r0, [r1]
	adds r0, r4, #0
	bl FUN_0202ADCC
	adds r1, r5, #0
	adds r1, #0x79
	strb r0, [r1]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl FUN_0207879C
	str r0, [r5, #0xc]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl FUN_0202CF54
	str r0, [r5, #0x10]
	ldr r0, [r5]
	bl FUN_022014A0
	str r0, [r5, #0x1c]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl FUN_0202A978
	str r0, [r5, #0x14]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl FUN_0202A988
	str r0, [r5, #0x18]
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	beq _02201DA6
	ldrb r1, [r1, #0x15]
	b _02201DA8
_02201DA6:
	movs r1, #0
_02201DA8:
	adds r0, r5, #0
	adds r0, #0x7c
	strb r1, [r0]
	adds r0, r5, #0
	bl ov17_022023B0
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	bl FUN_022018F0
	adds r1, r5, #0
	adds r1, #0x82
	strh r0, [r1]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	bl FUN_0220191C
	adds r1, r5, #0
	adds r1, #0x84
	strh r0, [r1]
	adds r0, r5, #0
	bl ov17_0220387C
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02201D30

	thumb_func_start ov17_02201DD8
ov17_02201DD8: @ 0x02201DD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_0201AB0C
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x74]
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	bl FUN_02018410
	pop {r4, pc}
	thumb_func_end ov17_02201DD8

	thumb_func_start ov17_02201DF0
ov17_02201DF0: @ 0x02201DF0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x70
	ldrh r1, [r1]
	cmp r1, #0
	beq _02201E04
	cmp r1, #1
	beq _02201E16
	b _02201E38
_02201E04:
	bl ov17_022024CC
	adds r0, r4, #0
	adds r0, #0x70
	ldrh r0, [r0]
	adds r4, #0x70
	adds r0, r0, #1
	strh r0, [r4]
	b _02201E38
_02201E16:
	bl ov17_02202528
	bl FUN_020210BC
	movs r0, #1
	bl FUN_02021148
	movs r1, #0
	movs r0, #0x45
	adds r2, r1, #0
	bl FUN_02004EC4
	movs r0, #0
	adds r4, #0x70
	strh r0, [r4]
	movs r0, #1
	pop {r4, pc}
_02201E38:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov17_02201DF0

	thumb_func_start ov17_02201E3C
ov17_02201E3C: @ 0x02201E3C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02021238
	adds r0, r4, #0
	bl ov17_02202500
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov17_02201E3C

	thumb_func_start ov17_02201E50
ov17_02201E50: @ 0x02201E50
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x70
	ldrh r0, [r0]
	cmp r0, #0
	beq _02201E64
	cmp r0, #1
	beq _02201E88
	b _02201EA2
_02201E64:
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
	adds r0, #0x70
	ldrh r0, [r0]
	adds r4, #0x70
	adds r0, r0, #1
	strh r0, [r4]
	b _02201EA2
_02201E88:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02201EA2
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x70
	strh r1, [r0]
	adds r0, r4, #0
	bl ov17_02202440
	add sp, #0xc
	pop {r3, r4, pc}
_02201EA2:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov17_02201E50

	thumb_func_start ov17_02201EA8
ov17_02201EA8: @ 0x02201EA8
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x70
	ldrh r0, [r0]
	cmp r0, #0
	beq _02201EBC
	cmp r0, #1
	beq _02201EE2
	b _02201EF6
_02201EBC:
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
	adds r0, #0x70
	ldrh r0, [r0]
	adds r4, #0x70
	adds r0, r0, #1
	strh r0, [r4]
	b _02201EF6
_02201EE2:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02201EF6
	movs r0, #0
	adds r4, #0x70
	strh r0, [r4]
	add sp, #0xc
	movs r0, #9
	pop {r3, r4, pc}
_02201EF6:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov17_02201EA8

	thumb_func_start ov17_02201EFC
ov17_02201EFC: @ 0x02201EFC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov17_02203A34
	adds r4, r0, #0
	cmp r4, #2
	bne _02201F12
	adds r0, r5, #0
	movs r1, #1
	bl ov17_022037C8
_02201F12:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov17_02201EFC

	thumb_func_start ov17_02201F18
ov17_02201F18: @ 0x02201F18
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x70
	ldrh r1, [r1]
	cmp r1, #0
	beq _02201F2C
	cmp r1, #1
	beq _02201F58
	b _02201FE4
_02201F2C:
	movs r1, #0
	bl ov17_022029C8
	adds r2, r4, #0
	adds r2, #0x7c
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r1, #4
	movs r3, #1
	bl ov17_02202944
	adds r0, r4, #0
	movs r1, #0
	bl ov17_02202910
	adds r0, r4, #0
	adds r0, #0x70
	ldrh r0, [r0]
	adds r4, #0x70
	adds r0, r0, #1
	strh r0, [r4]
	b _02201FE4
_02201F58:
	bl ov17_02202A50
	movs r2, #0
	mvns r2, r2
	cmp r0, r2
	beq _02201FE4
	adds r1, r4, #0
	movs r3, #0
	adds r1, #0x70
	strh r3, [r1]
	cmp r0, #2
	beq _02201F76
	subs r1, r3, #2
	cmp r0, r1
	bne _02201F8E
_02201F76:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	movs r3, #1
	bl ov17_02202944
	adds r0, r4, #0
	movs r1, #1
	bl ov17_02202910
	movs r0, #2
	pop {r3, r4, r5, pc}
_02201F8E:
	adds r1, r4, #0
	adds r1, #0x7c
	ldrb r5, [r1]
	ldr r1, [r4, #4]
	lsrs r2, r2, #0x10
	strb r5, [r1, #0x15]
	ldr r1, [r4, #4]
	cmp r0, #0
	strh r2, [r1, #0x16]
	bne _02201FC2
	adds r0, r4, #0
	adds r0, #0x84
	ldrh r0, [r0]
	cmp r0, #0
	bne _02201FBA
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	bl ov17_02202944
	movs r0, #8
	pop {r3, r4, r5, pc}
_02201FBA:
	ldr r0, [r4, #4]
	movs r1, #1
	strb r1, [r0, #0x14]
	b _02201FE0
_02201FC2:
	adds r0, r4, #0
	adds r0, #0x82
	ldrh r0, [r0]
	cmp r0, #0
	bne _02201FDA
	adds r0, r4, #0
	movs r1, #1
	movs r2, #4
	bl ov17_02202944
	movs r0, #8
	pop {r3, r4, r5, pc}
_02201FDA:
	ldr r0, [r4, #4]
	movs r1, #2
	strb r1, [r0, #0x14]
_02201FE0:
	movs r0, #1
	pop {r3, r4, r5, pc}
_02201FE4:
	movs r0, #3
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02201F18

	thumb_func_start ov17_02201FE8
ov17_02201FE8: @ 0x02201FE8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x70
	ldrh r1, [r1]
	cmp r1, #0
	beq _02201FFC
	cmp r1, #1
	beq _02202028
	b _02202090
_02201FFC:
	movs r1, #1
	bl ov17_022029C8
	adds r2, r4, #0
	adds r2, #0x7c
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r1, #5
	movs r3, #1
	bl ov17_02202944
	adds r0, r4, #0
	movs r1, #0
	bl ov17_02202910
	adds r0, r4, #0
	adds r0, #0x70
	ldrh r0, [r0]
	adds r4, #0x70
	adds r0, r0, #1
	strh r0, [r4]
	b _02202090
_02202028:
	bl ov17_02202A50
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _02202090
	adds r2, r4, #0
	movs r3, #0
	adds r2, #0x70
	strh r3, [r2]
	cmp r0, #1
	beq _02202046
	subs r2, r3, #2
	cmp r0, r2
	bne _0220205E
_02202046:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	movs r3, #1
	bl ov17_02202944
	adds r0, r4, #0
	movs r1, #1
	bl ov17_02202910
	movs r0, #2
	pop {r4, pc}
_0220205E:
	adds r0, r4, #0
	adds r0, #0x82
	ldrh r0, [r0]
	cmp r0, #0
	bne _02202076
	adds r0, r4, #0
	movs r1, #1
	movs r2, #4
	bl ov17_02202944
	movs r0, #8
	pop {r4, pc}
_02202076:
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r2, [r0]
	ldr r0, [r4, #4]
	lsrs r1, r1, #0x10
	strb r2, [r0, #0x15]
	ldr r0, [r4, #4]
	strh r1, [r0, #0x16]
	ldr r0, [r4, #4]
	movs r1, #2
	strb r1, [r0, #0x14]
	movs r0, #1
	pop {r4, pc}
_02202090:
	movs r0, #4
	pop {r4, pc}
	thumb_func_end ov17_02201FE8

	thumb_func_start ov17_02202094
ov17_02202094: @ 0x02202094
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x70
	ldrh r1, [r1]
	cmp r1, #0
	beq _022020AC
	cmp r1, #1
	beq _022020E2
	cmp r1, #2
	beq _02202130
	b _02202152
_022020AC:
	movs r1, #2
	bl ov17_022029C8
	adds r0, r4, #0
	movs r1, #0
	bl ov17_02202910
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r2, [r0]
	movs r1, #0x14
	adds r0, r4, #0
	muls r1, r2, r1
	adds r1, r4, r1
	adds r1, #0x21
	ldrb r1, [r1]
	movs r3, #1
	adds r1, r1, #5
	bl ov17_02202944
	adds r0, r4, #0
	adds r0, #0x70
	ldrh r0, [r0]
	adds r4, #0x70
	adds r0, r0, #1
	strh r0, [r4]
	b _02202180
_022020E2:
	bl ov17_02202A50
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _02202180
	cmp r0, #1
	beq _022020F8
	subs r1, r1, #1
	cmp r0, r1
	bne _02202116
_022020F8:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x70
	strh r1, [r0]
	adds r0, r4, #0
	movs r2, #4
	movs r3, #1
	bl ov17_02202944
	adds r0, r4, #0
	movs r1, #1
	bl ov17_02202910
	movs r0, #2
	pop {r4, pc}
_02202116:
	adds r0, r4, #0
	movs r1, #3
	movs r2, #4
	movs r3, #0
	bl ov17_02202944
	adds r0, r4, #0
	adds r0, #0x70
	ldrh r0, [r0]
	adds r4, #0x70
	adds r0, r0, #1
	strh r0, [r4]
	b _02202180
_02202130:
	bl ov17_022025B8
	cmp r0, #0
	beq _02202180
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl ov17_02202944
	adds r0, r4, #0
	adds r0, #0x70
	ldrh r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x70
	strh r1, [r0]
_02202152:
	adds r0, r4, #0
	bl ov17_02202460
	cmp r0, #0
	beq _02202180
	adds r0, r4, #0
	bl ov17_022028B8
	adds r0, r4, #0
	movs r1, #1
	bl ov17_02202910
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	movs r3, #1
	bl ov17_02202944
	movs r0, #0
	adds r4, #0x70
	strh r0, [r4]
	movs r0, #2
	pop {r4, pc}
_02202180:
	movs r0, #5
	pop {r4, pc}
	thumb_func_end ov17_02202094

	thumb_func_start ov17_02202184
ov17_02202184: @ 0x02202184
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x70
	ldrh r1, [r1]
	cmp r1, #5
	bhi _022021E2
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0220219E: @ jump table
	.2byte _022021AA - _0220219E - 2 @ case 0
	.2byte _022021D6 - _0220219E - 2 @ case 1
	.2byte _02202262 - _0220219E - 2 @ case 2
	.2byte _02202288 - _0220219E - 2 @ case 3
	.2byte _022022B4 - _0220219E - 2 @ case 4
	.2byte _022022DA - _0220219E - 2 @ case 5
_022021AA:
	movs r1, #3
	bl ov17_022029C8
	adds r2, r4, #0
	adds r2, #0x7c
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r1, #0xa
	movs r3, #1
	bl ov17_02202944
	adds r0, r4, #0
	movs r1, #0
	bl ov17_02202910
	adds r0, r4, #0
	adds r0, #0x70
	ldrh r0, [r0]
	adds r4, #0x70
	adds r0, r0, #1
	strh r0, [r4]
	b _02202316
_022021D6:
	bl ov17_02202A50
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _022021E4
_022021E2:
	b _02202316
_022021E4:
	cmp r0, #1
	beq _022021EE
	subs r1, r1, #1
	cmp r0, r1
	bne _0220220C
_022021EE:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x70
	strh r1, [r0]
	adds r0, r4, #0
	movs r2, #4
	movs r3, #1
	bl ov17_02202944
	adds r0, r4, #0
	movs r1, #1
	bl ov17_02202910
	movs r0, #2
	pop {r3, r4, r5, pc}
_0220220C:
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r1, [r0]
	adds r2, r4, #0
	movs r0, #0x14
	adds r2, #0x20
	muls r0, r1, r0
	adds r5, r2, r0
	ldrb r0, [r2, r0]
	bl FUN_022018B4
	adds r1, r0, #0
	ldrb r2, [r5, #5]
	ldr r0, [r4, #0xc]
	ldr r3, [r4]
	bl FUN_02078384
	cmp r0, #0
	beq _02202244
	adds r0, r4, #0
	movs r1, #3
	adds r0, #0x70
	strh r1, [r0]
	adds r0, r4, #0
	movs r1, #0
	bl ov17_02202900
	b _02202316
_02202244:
	adds r2, r4, #0
	adds r2, #0x7c
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r1, #0x10
	movs r3, #0
	bl ov17_02202944
	adds r0, r4, #0
	adds r0, #0x70
	ldrh r0, [r0]
	adds r4, #0x70
	adds r0, r0, #1
	strh r0, [r4]
	b _02202316
_02202262:
	bl ov17_02202460
	cmp r0, #0
	beq _02202316
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x70
	strh r1, [r0]
	adds r0, r4, #0
	movs r2, #4
	movs r3, #1
	bl ov17_02202944
	adds r0, r4, #0
	movs r1, #1
	bl ov17_02202910
	movs r0, #2
	pop {r3, r4, r5, pc}
_02202288:
	bl ov17_0220279C
	cmp r0, #0
	beq _02202316
	adds r2, r4, #0
	adds r2, #0x7c
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r1, #0xe
	movs r3, #0
	bl ov17_02202944
	ldr r0, _0220231C @ =0x000004A9
	bl FUN_02006B24
	adds r0, r4, #0
	adds r0, #0x70
	ldrh r0, [r0]
	adds r4, #0x70
	adds r0, r0, #1
	strh r0, [r4]
	b _02202316
_022022B4:
	bl FUN_02006BCC
	cmp r0, #0
	bne _02202316
	adds r2, r4, #0
	adds r2, #0x7c
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r1, #0xf
	movs r3, #0
	bl ov17_02202944
	adds r0, r4, #0
	adds r0, #0x70
	ldrh r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x70
	strh r1, [r0]
_022022DA:
	adds r0, r4, #0
	bl ov17_02202460
	cmp r0, #0
	beq _02202316
	adds r0, r4, #0
	bl ov17_02202B98
	adds r0, r4, #0
	bl ov17_022028B8
	adds r0, r4, #0
	movs r1, #1
	bl ov17_02202910
	adds r0, r4, #0
	movs r1, #1
	bl ov17_02202900
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	movs r3, #1
	bl ov17_02202944
	movs r0, #0
	adds r4, #0x70
	strh r0, [r4]
	movs r0, #2
	pop {r3, r4, r5, pc}
_02202316:
	movs r0, #6
	pop {r3, r4, r5, pc}
	nop
_0220231C: .4byte 0x000004A9
	thumb_func_end ov17_02202184

	thumb_func_start ov17_02202320
ov17_02202320: @ 0x02202320
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x70
	ldrh r1, [r1]
	cmp r1, #0
	beq _02202334
	cmp r1, #1
	beq _02202348
	b _0220236E
_02202334:
	ldr r0, _02202374 @ =0x00000888
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x70
	ldrh r0, [r0]
	adds r4, #0x70
	adds r0, r0, #1
	strh r0, [r4]
	b _0220236E
_02202348:
	bl ov17_02202460
	cmp r0, #0
	beq _0220236E
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	movs r3, #1
	bl ov17_02202944
	adds r0, r4, #0
	movs r1, #1
	bl ov17_02202910
	movs r0, #0
	adds r4, #0x70
	strh r0, [r4]
	movs r0, #2
	pop {r4, pc}
_0220236E:
	movs r0, #7
	pop {r4, pc}
	nop
_02202374: .4byte 0x00000888
	thumb_func_end ov17_02202320

	thumb_func_start ov17_02202378
ov17_02202378: @ 0x02202378
	push {r4, lr}
	adds r4, r0, #0
	bl ov17_02202460
	cmp r0, #0
	beq _0220239C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	movs r3, #1
	bl ov17_02202944
	adds r0, r4, #0
	movs r1, #1
	bl ov17_02202910
	movs r0, #2
	pop {r4, pc}
_0220239C:
	movs r0, #8
	pop {r4, pc}
	thumb_func_end ov17_02202378

	thumb_func_start ov17_022023A0
ov17_022023A0: @ 0x022023A0
	cmp r0, #0x5f
	blo _022023A8
	cmp r0, #0x63
	bls _022023AC
_022023A8:
	movs r0, #0
	bx lr
_022023AC:
	movs r0, #1
	bx lr
	thumb_func_end ov17_022023A0

	thumb_func_start ov17_022023B0
ov17_022023B0: @ 0x022023B0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	adds r0, #0x7b
	strb r1, [r0]
	ldr r0, [r4, #4]
	ldrb r2, [r0, #0x14]
	cmp r2, #0
	beq _02202438
	ldrh r0, [r0, #0x16]
	ldr r1, _0220243C @ =0x0000FFFF
	cmp r0, r1
	beq _02202438
	cmp r2, #1
	bne _022023F6
	bl ov17_022023A0
	cmp r0, #0
	beq _02202438
	ldr r0, [r4, #4]
	ldrh r0, [r0, #0x16]
	bl FUN_022018E4
	adds r1, r4, #0
	adds r1, #0x7c
	adds r2, r0, #0
	ldrb r1, [r1]
	ldr r0, [r4, #0x14]
	bl FUN_0220165C
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x7b
	strb r1, [r0]
	b _0220242A
_022023F6:
	cmp r2, #2
	bne _0220242A
	bl FUN_020780E4
	cmp r0, #0
	beq _02202438
	ldr r0, [r4, #4]
	ldrh r0, [r0, #0x16]
	bl FUN_022018C4
	adds r1, r4, #0
	adds r1, #0x7c
	adds r3, r0, #0
	ldrb r1, [r1]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x1c]
	bl FUN_02201610
	ldr r0, [r4, #0x10]
	movs r1, #5
	bl FUN_0202D0FC
	adds r0, r4, #0
	movs r1, #2
	adds r0, #0x7b
	strb r1, [r0]
_0220242A:
	ldr r1, [r4, #4]
	ldr r0, [r4, #0xc]
	ldrh r1, [r1, #0x16]
	ldr r3, [r4]
	movs r2, #1
	bl FUN_02078434
_02202438:
	pop {r4, pc}
	nop
_0220243C: .4byte 0x0000FFFF
	thumb_func_end ov17_022023B0

	thumb_func_start ov17_02202440
ov17_02202440: @ 0x02202440
	ldr r3, [r0, #4]
	movs r1, #0
	ldrb r2, [r3, #0x14]
	strb r1, [r3, #0x14]
	cmp r2, #0
	bne _02202450
	movs r0, #2
	bx lr
_02202450:
	adds r0, #0x7b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0220245C
	movs r0, #7
	bx lr
_0220245C:
	movs r0, #2
	bx lr
	thumb_func_end ov17_02202440

	thumb_func_start ov17_02202460
ov17_02202460: @ 0x02202460
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02025358
	cmp r0, #0
	beq _02202478
	ldr r0, _022024C0 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	str r0, [r4, #0x74]
	pop {r4, pc}
_02202478:
	ldr r0, _022024C4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	ldr r0, _022024C8 @ =0x00000CF3
	tst r0, r1
	beq _02202486
	movs r0, #0
	str r0, [r4, #0x74]
_02202486:
	ldr r0, _022024C4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _0220249A
	ldr r0, _022024C0 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	pop {r4, pc}
_0220249A:
	adds r0, r4, #0
	adds r0, #0x7a
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x7a
	ldrb r0, [r0]
	adds r4, #0x7a
	subs r0, r0, #1
	strb r0, [r4]
	cmp r1, #0
	bne _022024BA
	ldr r0, _022024C0 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	pop {r4, pc}
_022024BA:
	movs r0, #0
	pop {r4, pc}
	nop
_022024C0: .4byte 0x000005DC
_022024C4: .4byte 0x021D110C
_022024C8: .4byte 0x00000CF3
	thumb_func_end ov17_02202460

	thumb_func_start ov17_022024CC
ov17_022024CC: @ 0x022024CC
	push {r4, lr}
	adds r4, r0, #0
	bl ov17_02202C4C
	adds r0, r4, #0
	bl ov17_02202E28
	adds r0, r4, #0
	bl ov17_02202F0C
	adds r0, r4, #0
	bl ov17_02202FC4
	adds r0, r4, #0
	bl ov17_02203030
	adds r0, r4, #0
	bl ov17_02203278
	ldr r0, _022024FC @ =ov17_02202BF8
	adds r1, r4, #0
	bl FUN_0201A0FC
	pop {r4, pc}
	.align 2, 0
_022024FC: .4byte ov17_02202BF8
	thumb_func_end ov17_022024CC

	thumb_func_start ov17_02202500
ov17_02202500: @ 0x02202500
	push {r4, lr}
	adds r4, r0, #0
	bl ov17_02203290
	adds r0, r4, #0
	bl ov17_02203084
	adds r0, r4, #0
	bl ov17_02203004
	adds r0, r4, #0
	bl ov17_02202F7C
	adds r0, r4, #0
	bl ov17_02202EFC
	adds r0, r4, #0
	bl ov17_02202DD0
	pop {r4, pc}
	thumb_func_end ov17_02202500

	thumb_func_start ov17_02202528
ov17_02202528: @ 0x02202528
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0
	bl ov17_02202850
	adds r0, r4, #0
	bl ov17_022028B8
	adds r0, r4, #0
	adds r0, #0x7b
	ldrb r0, [r0]
	cmp r0, #0
	beq _02202580
	cmp r0, #1
	beq _0220254C
	cmp r0, #2
	beq _02202566
	b _02202580
_0220254C:
	adds r2, r4, #0
	adds r2, #0x7c
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r1, #0xb
	movs r3, #1
	bl ov17_02202944
	adds r0, r4, #0
	movs r1, #0
	bl ov17_02202910
	b _02202594
_02202566:
	adds r2, r4, #0
	adds r2, #0x7c
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r1, #0xc
	movs r3, #1
	bl ov17_02202944
	adds r0, r4, #0
	movs r1, #0
	bl ov17_02202910
	b _02202594
_02202580:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	movs r3, #1
	bl ov17_02202944
	adds r0, r4, #0
	movs r1, #1
	bl ov17_02202910
_02202594:
	adds r0, r4, #0
	movs r1, #0
	bl ov17_022037C8
	movs r5, #0
_0220259E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov17_02203404
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov17_02202A84
	adds r5, r5, #1
	cmp r5, #4
	blt _0220259E
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov17_02202528

	thumb_func_start ov17_022025B8
ov17_022025B8: @ 0x022025B8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x72
	ldrh r1, [r1]
	cmp r1, #4
	bhi _02202662
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022025D2: @ jump table
	.2byte _022025DC - _022025D2 - 2 @ case 0
	.2byte _0220264C - _022025D2 - 2 @ case 1
	.2byte _022026A2 - _022025D2 - 2 @ case 2
	.2byte _02202718 - _022025D2 - 2 @ case 3
	.2byte _0220274E - _022025D2 - 2 @ case 4
_022025DC:
	adds r0, #0x7c
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x80
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0xff
	adds r0, #0x81
	strb r1, [r0]
	adds r1, #0x6d
	ldr r0, [r4, r1]
	adds r1, r4, #0
	adds r1, #0x80
	ldrb r2, [r1]
	movs r1, #0x1b
	muls r1, r2, r1
	adds r1, #0x1f
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x38
	bl FUN_0200DD88
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #8
	bl FUN_020248F0
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024964
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x7f
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x72
	ldrh r0, [r0]
	adds r4, #0x72
	adds r0, r0, #1
	strh r0, [r4]
	b _02202792
_0220264C:
	adds r0, #0x7f
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x7f
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x7f
	strb r1, [r0]
	cmp r2, #0xf
	bhs _02202664
_02202662:
	b _02202792
_02202664:
	ldr r0, _02202798 @ =0x00000889
	bl FUN_0200604C
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024964
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #9
	bl FUN_020248F0
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x7f
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x72
	ldrh r0, [r0]
	adds r4, #0x72
	adds r0, r0, #1
	strh r0, [r4]
	b _02202792
_022026A2:
	adds r1, r4, #0
	adds r1, #0x7f
	ldrb r3, [r1]
	adds r1, r4, #0
	adds r1, #0x7f
	ldrb r1, [r1]
	adds r2, r1, #1
	adds r1, r4, #0
	adds r1, #0x7f
	strb r2, [r1]
	cmp r3, #0
	bne _022026C4
	adds r1, r4, #0
	adds r1, #0x80
	ldrb r1, [r1]
	bl ov17_02202B58
_022026C4:
	adds r0, r4, #0
	adds r0, #0x7f
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _022026D6
	adds r0, r4, #0
	bl ov17_02203A54
	b _02202792
_022026D6:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x7f
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x81
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _02202704
	ldr r0, _02202798 @ =0x00000889
	movs r1, #2
	bl FUN_02006154
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #8
	bl FUN_020248F0
	movs r0, #4
	adds r4, #0x72
	strh r0, [r4]
	b _02202792
_02202704:
	adds r0, r4, #0
	bl ov17_0220351C
	adds r0, r4, #0
	adds r0, #0x72
	ldrh r0, [r0]
	adds r4, #0x72
	adds r0, r0, #1
	strh r0, [r4]
	b _02202792
_02202718:
	adds r0, #0x7d
	ldrb r0, [r0]
	cmp r0, #0
	bne _02202792
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x7f
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x81
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x80
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0xff
	adds r0, #0x81
	strb r1, [r0]
	adds r1, #0x69
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #2
	adds r4, #0x72
	strh r0, [r4]
	b _02202792
_0220274E:
	adds r1, r4, #0
	adds r1, #0x7f
	ldrb r3, [r1]
	adds r1, r4, #0
	adds r1, #0x7f
	ldrb r1, [r1]
	adds r2, r1, #1
	adds r1, r4, #0
	adds r1, #0x7f
	strb r2, [r1]
	cmp r3, #0xf
	blo _02202792
	bl ov17_0220387C
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0202484C
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x7f
	strb r1, [r0]
	adds r4, #0x72
	strh r1, [r4]
	movs r0, #1
	pop {r4, pc}
_02202792:
	movs r0, #0
	pop {r4, pc}
	nop
_02202798: .4byte 0x00000889
	thumb_func_end ov17_022025B8

	thumb_func_start ov17_0220279C
ov17_0220279C: @ 0x0220279C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x72
	ldrh r1, [r1]
	cmp r1, #0
	beq _022027B4
	cmp r1, #1
	beq _022027EA
	cmp r1, #2
	beq _02202834
	b _0220284C
_022027B4:
	adds r1, r4, #0
	adds r1, #0x7c
	ldrb r1, [r1]
	bl ov17_02203460
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r1, [r0]
	movs r0, #0x14
	muls r0, r1, r0
	adds r0, r4, r0
	adds r0, #0x25
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x7e
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x7f
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x72
	ldrh r0, [r0]
	adds r4, #0x72
	adds r0, r0, #1
	strh r0, [r4]
	b _0220284C
_022027EA:
	adds r1, r4, #0
	adds r1, #0x7f
	ldrb r1, [r1]
	cmp r1, #0
	bne _0220280E
	bl ov17_02203638
	adds r0, r4, #0
	adds r0, #0x7e
	ldrb r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x7e
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #8
	adds r0, #0x7f
	strb r1, [r0]
_0220280E:
	adds r0, r4, #0
	adds r0, #0x7f
	ldrb r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x7f
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x7e
	ldrb r0, [r0]
	cmp r0, #0
	bne _0220284C
	adds r0, r4, #0
	adds r0, #0x72
	ldrh r0, [r0]
	adds r4, #0x72
	adds r0, r0, #1
	strh r0, [r4]
	b _0220284C
_02202834:
	adds r0, #0x7d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0220284C
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x7f
	strb r1, [r0]
	adds r4, #0x72
	strh r1, [r4]
	movs r0, #1
	pop {r4, pc}
_0220284C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov17_0220279C

	thumb_func_start ov17_02202850
ov17_02202850: @ 0x02202850
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020248F0
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024964
	adds r0, r4, #0
	adds r0, #0xfc
	movs r1, #0
	bl FUN_0201D978
	adds r1, r4, #0
	adds r1, #0xa8
	ldr r1, [r1]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	movs r1, #0
	adds r3, r0, #0
	adds r2, r4, #0
	movs r5, #0x30
	subs r3, r5, r3
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022028B4 @ =0x00010200
	adds r2, #0xa8
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	ldr r2, [r2]
	adds r0, #0xfc
	movs r1, #4
	lsrs r3, r3, #1
	bl FUN_020200FC
	adds r4, #0xfc
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_022028B4: .4byte 0x00010200
	thumb_func_end ov17_02202850

	thumb_func_start ov17_022028B8
ov17_022028B8: @ 0x022028B8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x7c
	ldrb r4, [r0]
	movs r0, #0x5a
	movs r1, #0x1b
	adds r2, r4, #1
	muls r1, r2, r1
	lsls r0, r0, #2
	lsls r1, r1, #0x10
	ldr r0, [r5, r0]
	asrs r1, r1, #0x10
	movs r2, #0x60
	bl FUN_0200DD88
	movs r0, #0x14
	muls r0, r4, r0
	adds r0, r5, r0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #3
	bls _022028F2
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
_022028F2:
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_022028B8

	thumb_func_start ov17_02202900
ov17_02202900: @ 0x02202900
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r3, _0220290C @ =FUN_02024830
	ldr r0, [r0, r2]
	bx r3
	nop
_0220290C: .4byte FUN_02024830
	thumb_func_end ov17_02202900

	thumb_func_start ov17_02202910
ov17_02202910: @ 0x02202910
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r6, r1, #0
	bl FUN_0202484C
	movs r4, #0
_02202922:
	ldr r0, [r5, #0x30]
	cmp r0, #0
	beq _02202938
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	cmp r1, #2
	blo _02202938
	adds r1, r6, #0
	bl FUN_0202484C
_02202938:
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, #4
	blt _02202922
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov17_02202910

	thumb_func_start ov17_02202944
ov17_02202944: @ 0x02202944
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r1, #0
	adds r5, r0, #0
	adds r7, r3, #0
	str r2, [sp, #0x10]
	cmp r6, #0
	bne _02202958
	movs r0, #0x43
	b _0220295A
_02202958:
	movs r0, #0x47
_0220295A:
	lsls r0, r0, #2
	adds r4, r5, r0
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	cmp r7, #0
	beq _02202994
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0x20
	movs r1, #0
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	adds r0, r5, #0
	str r1, [sp, #0xc]
	adds r0, #0x88
	ldr r0, [r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0xd
	bl FUN_0200E998
_02202994:
	ldr r2, [sp, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov17_022036FC
	movs r3, #0
	adds r2, r5, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r2, #0xa4
	ldr r2, [r2]
	adds r0, r4, #0
	movs r1, #1
	bl FUN_020200A8
	adds r0, r4, #0
	bl FUN_0201D5C8
	movs r0, #0x3c
	adds r5, #0x7a
	strb r0, [r5]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov17_02202944

	thumb_func_start ov17_022029C8
ov17_022029C8: @ 0x022029C8
	push {r4, r5, lr}
	sub sp, #0x24
	adds r5, r0, #0
	adds r4, r1, #0
	add r0, sp, #0xc
	movs r1, #0
	movs r2, #0x18
	blx FUN_020D4994
	ldr r0, _02202A48 @ =0x02203D60
	add r2, sp, #0xc
	ldrh r3, [r0, #0xc]
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
	lsls r0, r4, #2
	adds r3, r5, r0
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r3, r0]
	lsls r3, r4, #3
	str r0, [sp, #0x18]
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	str r0, [sp, #0x1c]
	ldr r0, _02202A4C @ =0x02203E88
	ldr r0, [r0, r3]
	movs r3, #0xf
	strb r0, [r2, #0x14]
	ldrb r2, [r2, #0x14]
	lsls r0, r2, #1
	adds r2, r2, r0
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	ldr r2, [r5, #0x74]
	adds r0, #0x8c
	lsls r2, r2, #0x18
	ldr r0, [r0]
	lsrs r2, r2, #0x18
	bl FUN_020185FC
	movs r1, #0x6a
	lsls r1, r1, #2
	str r0, [r5, r1]
	add sp, #0x24
	pop {r4, r5, pc}
	.align 2, 0
_02202A48: .4byte 0x02203D60
_02202A4C: .4byte 0x02203E88
	thumb_func_end ov17_022029C8

	thumb_func_start ov17_02202A50
ov17_02202A50: @ 0x02202A50
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020186A4
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _02202A80
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02018674
	str r0, [r5, #0x74]
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02018680
	adds r0, r4, #0
_02202A80:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov17_02202A50

	thumb_func_start ov17_02202A84
ov17_02202A84: @ 0x02202A84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r1, #0
	adds r5, r0, #0
	movs r0, #0x14
	adds r7, r6, #0
	muls r7, r0, r7
	adds r0, r5, #0
	adds r0, #0x20
	adds r4, r0, r7
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _02202AA8
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02202AA8
	bl FUN_02024758
_02202AA8:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _02202AC8
	movs r0, #0
	str r0, [r4, #0x10]
	adds r0, r6, #3
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	bl FUN_020249D4
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
_02202AC8:
	ldr r0, _02202B54 @ =0x02203EA8
	add r1, sp, #0
	movs r2, #0x28
	blx FUN_020D4A50
	adds r0, r6, #1
	movs r1, #0x1b
	adds r2, r0, #0
	muls r2, r1, r2
	add r1, sp, #0
	strh r2, [r1, #4]
	ldrb r2, [r4, #1]
	cmp r2, #1
	beq _02202AEA
	cmp r2, #2
	beq _02202AF0
	b _02202AF6
_02202AEA:
	movs r0, #5
	strh r0, [r1, #0xa]
	b _02202AFE
_02202AF0:
	movs r0, #6
	strh r0, [r1, #0xa]
	b _02202AFE
_02202AF6:
	str r0, [sp]
	ldrb r0, [r4, #1]
	subs r0, r0, #3
	strh r0, [r1, #0xa]
_02202AFE:
	movs r1, #0x13
	lsls r1, r1, #4
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	add r2, sp, #0
	bl FUN_0200D2B4
	str r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02024830
	ldrb r0, [r4, #1]
	cmp r0, #1
	ldr r0, [r4, #0x10]
	bne _02202B32
	movs r1, #0
	bl FUN_0202484C
	adds r1, r5, r7
	adds r1, #0x2a
	ldrb r1, [r1]
	ldr r0, [r4, #0x10]
	bl FUN_020249D4
	b _02202B38
_02202B32:
	movs r1, #1
	bl FUN_0202484C
_02202B38:
	adds r0, r6, #3
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r5, r7
	adds r1, #0x2a
	ldrb r1, [r1]
	bl FUN_020249D4
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02202B54: .4byte 0x02203EA8
	thumb_func_end ov17_02202A84

	thumb_func_start ov17_02202B58
ov17_02202B58: @ 0x02202B58
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r6, r1, #0
	movs r0, #0x14
	adds r2, #0x20
	muls r0, r6, r0
	adds r4, r2, r0
	ldr r0, [r5, #0x14]
	bl FUN_02201644
	adds r0, r5, #0
	bl ov17_0220387C
	adds r0, r6, #3
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	bl FUN_020249D4
	ldrb r0, [r4, #1]
	cmp r0, #1
	bne _02202B94
	ldrb r1, [r4, #0xa]
	ldr r0, [r4, #0x10]
	bl FUN_020249D4
_02202B94:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov17_02202B58

	thumb_func_start ov17_02202B98
ov17_02202B98: @ 0x02202B98
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x7c
	ldrb r1, [r0]
	adds r6, r5, #0
	movs r0, #0x14
	adds r7, r1, #0
	muls r7, r0, r7
	adds r6, #0x20
	ldr r0, [r5, #0x14]
	adds r4, r6, r7
	bl FUN_02201674
	ldrb r0, [r6, r7]
	bl FUN_022018B4
	adds r1, r0, #0
	ldrb r2, [r4, #5]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	bl FUN_02078398
	adds r0, r5, #0
	bl ov17_0220387C
	ldr r0, [r4, #0x10]
	bl FUN_02024758
	movs r0, #0
	str r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	adds r0, r0, #3
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	bl FUN_020249D4
	ldr r0, [r5, #0x10]
	movs r1, #0
	bl FUN_0202D1C0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov17_02202B98

	thumb_func_start ov17_02202BF8
ov17_02202BF8: @ 0x02202BF8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02202C0A
	bl FUN_0200D034
_02202C0A:
	blx FUN_020B62EC
	adds r4, #0x88
	ldr r0, [r4]
	bl FUN_0201EEB4
	ldr r3, _02202C24 @ =0x027E0000
	ldr r1, _02202C28 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_02202C24: .4byte 0x027E0000
_02202C28: .4byte 0x00003FF8
	thumb_func_end ov17_02202BF8

	thumb_func_start ov17_02202C2C
ov17_02202C2C: @ 0x02202C2C
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _02202C48 @ =0x02203ED0
	add r3, sp, #0
	movs r2, #5
_02202C36:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02202C36
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_02202C48: .4byte 0x02203ED0
	thumb_func_end ov17_02202C2C

	thumb_func_start ov17_02202C4C
ov17_02202C4C: @ 0x02202C4C
	push {r4, r5, lr}
	sub sp, #0x9c
	adds r4, r0, #0
	bl ov17_02202C2C
	ldr r0, [r4]
	bl FUN_0201AC88
	adds r1, r4, #0
	adds r1, #0x88
	add r3, sp, #0x8c
	ldr r5, _02202DB0 @ =0x02203D88
	str r0, [r1]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r2, _02202DB4 @ =0x04000304
	ldr r0, _02202DB8 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r5, _02202DBC @ =0x02203E30
	add r3, sp, #0x70
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
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _02202DC0 @ =0x02203DDC
	add r3, sp, #0x54
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
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #7
	bl FUN_0201CAE0
	ldr r5, _02202DC4 @ =0x02203DF8
	add r3, sp, #0x38
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
	adds r0, #0x88
	ldr r0, [r0]
	adds r3, r1, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _02202DC8 @ =0x02203E14
	add r3, sp, #0x1c
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
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #2
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _02202DCC @ =0x02203E4C
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
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
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
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #3
	movs r1, #0x40
	movs r2, #0
	bl FUN_0201C1C4
	add sp, #0x9c
	pop {r4, r5, pc}
	.align 2, 0
_02202DB0: .4byte 0x02203D88
_02202DB4: .4byte 0x04000304
_02202DB8: .4byte 0xFFFF7FFF
_02202DBC: .4byte 0x02203E30
_02202DC0: .4byte 0x02203DDC
_02202DC4: .4byte 0x02203DF8
_02202DC8: .4byte 0x02203E14
_02202DCC: .4byte 0x02203E4C
	thumb_func_end ov17_02202C4C

	thumb_func_start ov17_02202DD0
ov17_02202DD0: @ 0x02202DD0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #7
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #4
	bl FUN_0201BB4C
	adds r4, #0x88
	ldr r0, [r4]
	bl FUN_0201AB0C
	ldr r2, _02202E24 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_02202E24: .4byte 0x04000304
	thumb_func_end ov17_02202DD0

	thumb_func_start ov17_02202E28
ov17_02202E28: @ 0x02202E28
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0xda
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
	adds r2, r5, #0
	str r0, [sp, #0xc]
	adds r2, #0x88
	ldr r2, [r2]
	adds r0, r4, #0
	movs r1, #4
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	adds r2, r5, #0
	str r0, [sp, #0xc]
	adds r2, #0x88
	ldr r2, [r2]
	adds r0, r4, #0
	movs r1, #5
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
	adds r2, r5, #0
	str r0, [sp, #0xc]
	adds r2, #0x88
	ldr r2, [r2]
	adds r0, r4, #0
	movs r1, #1
	movs r3, #7
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	adds r2, r5, #0
	str r0, [sp, #0xc]
	adds r2, #0x88
	ldr r2, [r2]
	adds r0, r4, #0
	movs r1, #2
	movs r3, #7
	bl FUN_02007B68
	movs r0, #0x65
	lsls r0, r0, #2
	str r4, [r5, r0]
	adds r0, r5, #0
	adds r0, #0x79
	ldrb r0, [r0]
	movs r1, #0
	movs r2, #1
	str r0, [sp]
	ldr r0, [r5]
	movs r3, #0xd
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	bl FUN_0200E644
	movs r1, #6
	ldr r2, [r5]
	movs r0, #0
	lsls r1, r1, #6
	bl FUN_0200304C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02202E28

	thumb_func_start ov17_02202EFC
ov17_02202EFC: @ 0x02202EFC
	movs r1, #0x65
	lsls r1, r1, #2
	ldr r3, _02202F08 @ =FUN_0200770C
	ldr r0, [r0, r1]
	bx r3
	nop
_02202F08: .4byte FUN_0200770C
	thumb_func_end ov17_02202EFC

	thumb_func_start ov17_02202F0C
ov17_02202F0C: @ 0x02202F0C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6]
	movs r0, #4
	bl FUN_02002CEC
	ldr r3, [r6]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xf8
	bl FUN_0200BAF8
	adds r1, r6, #0
	adds r1, #0x9c
	str r0, [r1]
	movs r0, #0x10
	ldr r2, [r6]
	adds r1, r0, #0
	bl FUN_0200BD18
	adds r1, r6, #0
	adds r1, #0xa0
	str r0, [r1]
	ldr r1, [r6]
	movs r0, #0x80
	bl FUN_02026354
	adds r1, r6, #0
	adds r1, #0xa4
	str r0, [r1]
	adds r0, r6, #0
	adds r0, #0x9c
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200BBA0
	adds r1, r6, #0
	adds r1, #0xa8
	str r0, [r1]
	movs r4, #0
	adds r5, r6, #0
_02202F5E:
	adds r0, r6, #0
	adds r0, #0x9c
	ldr r0, [r0]
	adds r1, r4, #6
	bl FUN_0200BBA0
	adds r1, r5, #0
	adds r1, #0xb0
	adds r4, r4, #1
	adds r5, r5, #4
	str r0, [r1]
	cmp r4, #0x11
	blt _02202F5E
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov17_02202F0C

	thumb_func_start ov17_02202F7C
ov17_02202F7C: @ 0x02202F7C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_02202F84:
	adds r0, r5, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x11
	blt _02202F84
	adds r0, r6, #0
	adds r0, #0xa8
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r6, #0
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r6, #0
	adds r0, #0xa0
	ldr r0, [r0]
	bl FUN_0200BDA0
	adds r6, #0x9c
	ldr r0, [r6]
	bl FUN_0200BB44
	movs r0, #4
	bl FUN_02002DB4
	pop {r4, r5, r6, pc}
	thumb_func_end ov17_02202F7C

	thumb_func_start ov17_02202FC4
ov17_02202FC4: @ 0x02202FC4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	ldr r4, _02203000 @ =0x02203DC4
	movs r6, #0
	adds r5, #0xfc
_02202FD0:
	adds r0, r7, #0
	adds r0, #0x88
	ldr r0, [r0]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #3
	blt _02202FD0
	ldr r0, [r7]
	bl FUN_0201660C
	movs r1, #0x4b
	lsls r1, r1, #2
	str r0, [r7, r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02203000: .4byte 0x02203DC4
	thumb_func_end ov17_02202FC4

	thumb_func_start ov17_02203004
ov17_02203004: @ 0x02203004
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	movs r4, #0
	adds r5, #0xfc
_0220300E:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _0220300E
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02016624
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov17_02203004

	thumb_func_start ov17_02203030
ov17_02203030: @ 0x02203030
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0
	ldr r5, _02203080 @ =0x02203E88
	str r0, [sp]
	adds r6, r7, #0
_0220303C:
	ldr r0, [r5]
	ldr r1, [r7]
	bl FUN_02014918
	movs r1, #0x66
	lsls r1, r1, #2
	str r0, [r6, r1]
	ldr r0, [r5]
	movs r4, #0
	cmp r0, #0
	ble _02203070
_02203052:
	ldr r2, [r5, #4]
	movs r0, #0x66
	adds r1, r7, #0
	lsls r0, r0, #2
	adds r1, #0x9c
	ldrb r2, [r2, r4]
	ldr r0, [r6, r0]
	ldr r1, [r1]
	adds r3, r4, #0
	bl FUN_02014960
	ldr r0, [r5]
	adds r4, r4, #1
	cmp r4, r0
	blt _02203052
_02203070:
	ldr r0, [sp]
	adds r5, #8
	adds r0, r0, #1
	adds r6, r6, #4
	str r0, [sp]
	cmp r0, #4
	blt _0220303C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02203080: .4byte 0x02203E88
	thumb_func_end ov17_02203030

	thumb_func_start ov17_02203084
ov17_02203084: @ 0x02203084
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	movs r7, #0x66
	adds r5, r0, #0
	adds r6, r4, #0
	lsls r7, r7, #2
_02203090:
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02014950
	str r6, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02203090
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov17_02203084

	thumb_func_start ov17_022030A8
ov17_022030A8: @ 0x022030A8
	push {r3, r4, r5, lr}
	sub sp, #0x28
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #0x20
	bl FUN_0202055C
	ldr r0, [r4]
	bl FUN_0200CF18
	movs r1, #0x13
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	ldr r1, _0220320C @ =0x02203E68
	ldr r2, _02203210 @ =0x02203D98
	movs r3, #8
	bl FUN_0200CF70
	ldr r0, [r4]
	bl FUN_0200B2E0
	ldr r0, [r4]
	bl FUN_0200B2E8
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200CF38
	movs r1, #0x4d
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r0, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x19
	bl FUN_0200CFF4
	movs r3, #0
	movs r1, #0x13
	str r3, [sp]
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _02203214 @ =0x02203D78
	bl FUN_0200D2A4
	ldr r1, [r4]
	movs r0, #0x12
	bl FUN_02007688
	movs r2, #0x19
	lsls r2, r2, #4
	str r0, [r4, r2]
	ldr r5, _02203218 @ =0x02203DAC
	add r3, sp, #0x10
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	subs r2, #0x60
	stm r3!, {r0, r1}
	ldr r0, [r4, r2]
	bl FUN_0200CF38
	movs r1, #0x4e
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, sp, #0x10
	bl FUN_0200D3F8
	movs r0, #0x4d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200E2B0
	adds r1, r0, #0
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200E2B4
	movs r0, #0x95
	movs r1, #1
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x13
	str r0, [sp, #4]
	movs r0, #0xfa
	lsls r2, r2, #4
	lsls r0, r0, #4
	adds r1, r2, #0
	str r0, [sp, #8]
	ldr r0, [r4, r2]
	adds r1, #8
	adds r2, #0x60
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl FUN_0200D504
	movs r0, #0x95
	movs r1, #2
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r2, #0x13
	str r0, [sp, #8]
	movs r0, #0xfa
	lsls r2, r2, #4
	lsls r0, r0, #4
	adds r1, r2, #0
	str r0, [sp, #0xc]
	ldr r0, [r4, r2]
	adds r1, #8
	adds r2, #0x60
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl FUN_0200D5D4
	bl FUN_02077CE0
	adds r3, r0, #0
	movs r0, #0
	movs r2, #0x13
	str r0, [sp]
	movs r0, #0xfa
	lsls r2, r2, #4
	lsls r0, r0, #4
	adds r1, r2, #0
	str r0, [sp, #4]
	ldr r0, [r4, r2]
	adds r1, #8
	adds r2, #0x60
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl FUN_0200D6EC
	bl FUN_02077CE4
	adds r3, r0, #0
	movs r0, #0
	movs r2, #0x13
	str r0, [sp]
	movs r0, #0xfa
	lsls r2, r2, #4
	lsls r0, r0, #4
	adds r1, r2, #0
	str r0, [sp, #4]
	ldr r0, [r4, r2]
	adds r1, #8
	adds r2, #0x60
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl FUN_0200D71C
	ldr r0, [r4]
	movs r1, #0
	bl FUN_02018424
	adds r4, #0x8c
	str r0, [r4]
	add sp, #0x28
	pop {r3, r4, r5, pc}
	.align 2, 0
_0220320C: .4byte 0x02203E68
_02203210: .4byte 0x02203D98
_02203214: .4byte 0x02203D78
_02203218: .4byte 0x02203DAC
	thumb_func_end ov17_022030A8

	thumb_func_start ov17_0220321C
ov17_0220321C: @ 0x0220321C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_02018474
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200770C
	movs r1, #0x13
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, #8
	ldr r1, [r4, r1]
	bl FUN_0200D998
	movs r1, #0x13
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_0200D0E4
	movs r1, #0x4e
	lsls r1, r1, #2
	movs r2, #0
	str r2, [r4, r1]
	subs r0, r1, #4
	subs r1, #8
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	bl FUN_0200D108
	movs r0, #0x13
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
	bl FUN_020205AC
	ldr r0, [r4]
	bl FUN_0200B2E0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov17_0220321C

	thumb_func_start ov17_02203278
ov17_02203278: @ 0x02203278
	push {r4, lr}
	adds r4, r0, #0
	bl ov17_022030A8
	adds r0, r4, #0
	bl ov17_022032AC
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	pop {r4, pc}
	thumb_func_end ov17_02203278

	thumb_func_start ov17_02203290
ov17_02203290: @ 0x02203290
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	bl ov17_022033E4
	adds r0, r4, #0
	bl ov17_0220321C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov17_02203290

	thumb_func_start ov17_022032AC
ov17_022032AC: @ 0x022032AC
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _022033D4 @ =0x02203EF8
	movs r7, #0
	adds r5, r4, #0
_022032B6:
	movs r0, #0x13
	movs r1, #0x4d
	lsls r0, r0, #4
	lsls r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	adds r2, r6, #0
	bl FUN_0200D2B4
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	adds r7, r7, #1
	adds r6, #0x28
	adds r5, r5, #4
	cmp r7, #1
	ble _022032B6
	movs r1, #0x13
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _022033D8 @ =0x02203F48
	bl FUN_0200D2B4
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0202484C
	movs r6, #0
	adds r7, r6, #0
	str r4, [sp]
_0220331E:
	adds r0, r6, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r5, r4, r0
	movs r0, #0x13
	movs r1, #0x4d
	lsls r0, r0, #4
	lsls r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _022033DC @ =0x02203F70
	bl FUN_0200D2B4
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	adds r1, r7, #0
	adds r1, #0x1b
	lsls r1, r1, #0x10
	ldr r0, [r5, r0]
	asrs r1, r1, #0x10
	movs r2, #0x63
	bl FUN_0200DD88
	ldr r1, [sp]
	movs r0, #0x59
	adds r1, #0x2a
	lsls r0, r0, #2
	ldrb r1, [r1]
	ldr r0, [r5, r0]
	bl FUN_020249D4
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0202484C
	adds r0, r6, #7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r5, r4, r0
	movs r0, #0x13
	movs r1, #0x4d
	lsls r0, r0, #4
	lsls r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _022033E0 @ =0x02203F98
	bl FUN_0200D2B4
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	adds r1, r7, #0
	adds r1, #0x1b
	lsls r1, r1, #0x10
	ldr r0, [r5, r0]
	asrs r1, r1, #0x10
	movs r2, #0x58
	bl FUN_0200DD88
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, [sp]
	adds r6, r6, #1
	adds r0, #0x14
	adds r7, #0x1b
	str r0, [sp]
	cmp r6, #4
	blt _0220331E
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022033D4: .4byte 0x02203EF8
_022033D8: .4byte 0x02203F48
_022033DC: .4byte 0x02203F70
_022033E0: .4byte 0x02203F98
	thumb_func_end ov17_022032AC

	thumb_func_start ov17_022033E4
ov17_022033E4: @ 0x022033E4
	push {r4, r5, r6, lr}
	movs r6, #0x59
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_022033EE:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _022033F8
	bl FUN_02024758
_022033F8:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xb
	blt _022033EE
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov17_022033E4

	thumb_func_start ov17_02203404
ov17_02203404: @ 0x02203404
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x14
	muls r0, r6, r0
	adds r0, r5, r0
	adds r0, #0x20
	ldrb r4, [r0]
	cmp r4, #0
	beq _02203420
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_02203420:
	movs r0, #0
	movs r2, #0x13
	str r0, [sp]
	adds r0, r6, #1
	lsls r2, r2, #4
	str r0, [sp, #4]
	adds r1, r2, #4
	ldr r0, [r5, r2]
	adds r2, #0x64
	adds r3, r4, #0
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	adds r3, #0x4c
	bl FUN_0200E2B8
	movs r0, #0
	movs r2, #0x13
	str r0, [sp]
	adds r0, r6, #1
	lsls r2, r2, #4
	str r0, [sp, #4]
	adds r1, r2, #4
	ldr r0, [r5, r2]
	adds r2, #0x64
	adds r4, #0xc
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	adds r3, r4, #0
	bl FUN_0200E2EC
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov17_02203404

	thumb_func_start ov17_02203460
ov17_02203460: @ 0x02203460
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x14
	muls r0, r1, r0
	adds r0, r5, r0
	adds r0, #0x20
	ldrb r0, [r0]
	bl FUN_022018B4
	movs r1, #1
	adds r4, r0, #0
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	movs r2, #0x13
	str r0, [sp]
	movs r0, #0xfa
	lsls r2, r2, #4
	lsls r0, r0, #4
	adds r1, r2, #0
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	adds r1, #8
	adds r2, #0x60
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200E2B8
	adds r0, r4, #0
	movs r1, #2
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	movs r2, #0x13
	str r0, [sp]
	movs r0, #0xfa
	lsls r2, r2, #4
	lsls r0, r0, #4
	adds r1, r2, #0
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	adds r1, #8
	adds r2, #0x60
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200E2EC
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02203460

	thumb_func_start ov17_022034C8
ov17_022034C8: @ 0x022034C8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x34
	blx FUN_020D4994
	add r0, sp, #0
	strh r4, [r0]
	strh r6, [r0, #2]
	movs r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	movs r0, #2
	str r0, [sp, #0x2c]
	movs r0, #0xfa
	lsls r0, r0, #4
	str r1, [sp, #0xc]
	str r1, [sp, #0x30]
	movs r1, #1
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	subs r0, r1, #2
	movs r1, #0x13
	lsls r1, r1, #4
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, [r5, r1]
	adds r1, #8
	ldr r1, [r5, r1]
	add r2, sp, #0
	bl FUN_0200D734
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov17_022034C8

	thumb_func_start ov17_0220351C
ov17_0220351C: @ 0x0220351C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0xc
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0xc
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	str r5, [r4]
	adds r0, #0x80
	ldrb r0, [r0]
	strb r0, [r4, #6]
	adds r0, r5, #0
	adds r0, #0x81
	ldrb r0, [r0]
	strb r0, [r4, #7]
	adds r0, r5, #0
	adds r0, #0x81
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x80
	ldrb r0, [r0]
	subs r0, r1, r0
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	ble _02203560
	movs r0, #1
	strb r0, [r4, #9]
	b _0220356C
_02203560:
	movs r0, #0
	mvns r0, r0
	strb r0, [r4, #9]
	rsbs r0, r1, #0
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
_0220356C:
	movs r0, #0x1b
	muls r0, r1, r0
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	asrs r0, r1, #1
	lsrs r0, r0, #0x1e
	adds r0, r1, r0
	asrs r0, r0, #2
	strb r0, [r4, #8]
	adds r0, r5, #0
	adds r0, #0x80
	ldrb r0, [r0]
	adds r1, r4, #0
	movs r2, #0
	strb r0, [r4, #0xa]
	ldr r0, _022035A0 @ =ov17_022035A4
	bl FUN_0200E320
	adds r0, r5, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	adds r5, #0x7d
	adds r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
	nop
_022035A0: .4byte ov17_022035A4
	thumb_func_end ov17_0220351C

	thumb_func_start ov17_022035A4
ov17_022035A4: @ 0x022035A4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	movs r1, #9
	ldrsb r1, [r5, r1]
	adds r7, r0, #0
	movs r0, #0x5b
	lsls r1, r1, #0x12
	ldr r4, [r5]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	asrs r1, r1, #0x10
	movs r2, #0
	bl FUN_0200DEA0
	movs r0, #0x5b
	lsls r0, r0, #2
	add r1, sp, #0
	ldr r0, [r4, r0]
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE00
	add r1, sp, #0
	movs r0, #2
	ldrsh r0, [r1, r0]
	movs r1, #0x1b
	subs r0, #0x1f
	blx FUN_020F2998
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r0, [r5, #0xa]
	cmp r6, r0
	beq _022035F8
	ldrb r0, [r5, #7]
	cmp r6, r0
	beq _022035F8
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov17_02202B58
	strb r6, [r5, #0xa]
_022035F8:
	ldrb r0, [r5, #8]
	subs r0, r0, #1
	strb r0, [r5, #8]
	ldrb r0, [r5, #8]
	cmp r0, #0
	bne _02203634
	ldrb r2, [r5, #7]
	movs r1, #0x1b
	movs r0, #0x5b
	muls r1, r2, r1
	lsls r0, r0, #2
	adds r1, #0x1f
	lsls r1, r1, #0x10
	ldr r0, [r4, r0]
	asrs r1, r1, #0x10
	movs r2, #0x38
	bl FUN_0200DD88
	adds r0, r4, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	adds r4, #0x7d
	subs r0, r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r7, #0
	bl FUN_0200E390
_02203634:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov17_022035A4

	thumb_func_start ov17_02203638
ov17_02203638: @ 0x02203638
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0xc
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0xc
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	str r5, [r4]
	adds r0, #0x7c
	ldrb r0, [r0]
	adds r1, r4, #0
	movs r2, #0
	strb r0, [r4, #6]
	ldr r0, _02203670 @ =ov17_02203674
	bl FUN_0200E320
	adds r0, r5, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	adds r5, #0x7d
	adds r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02203670: .4byte ov17_02203674
	thumb_func_end ov17_02203638

	thumb_func_start ov17_02203674
ov17_02203674: @ 0x02203674
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	ldrb r0, [r5, #4]
	ldr r4, [r5]
	cmp r0, #0
	beq _0220368C
	cmp r0, #1
	beq _022036BA
	cmp r0, #2
	beq _022036D6
	pop {r4, r5, r6, pc}
_0220368C:
	adds r0, r4, #0
	adds r4, #0x7e
	ldrb r3, [r4]
	ldrb r2, [r5, #6]
	movs r1, #0x1b
	adds r3, r3, #2
	muls r1, r2, r1
	adds r1, #0x23
	lsls r1, r1, #0x10
	lsls r3, r3, #0x18
	asrs r1, r1, #0x10
	movs r2, #0x50
	lsrs r3, r3, #0x18
	bl ov17_022034C8
	str r0, [r5, #8]
	ldr r0, _022036F8 @ =0x000005DD
	bl FUN_0200604C
	ldrb r0, [r5, #4]
	adds r0, r0, #1
	strb r0, [r5, #4]
	pop {r4, r5, r6, pc}
_022036BA:
	movs r1, #2
	ldr r0, [r5, #8]
	subs r2, r1, #4
	bl FUN_0200DED0
	ldrb r1, [r5, #5]
	adds r0, r1, #1
	strb r0, [r5, #5]
	cmp r1, #8
	blo _022036F4
	ldrb r0, [r5, #4]
	adds r0, r0, #1
	strb r0, [r5, #4]
	pop {r4, r5, r6, pc}
_022036D6:
	ldr r0, [r5, #8]
	bl FUN_0200D9DC
	adds r0, r4, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	adds r4, #0x7d
	subs r0, r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_0200E390
_022036F4:
	pop {r4, r5, r6, pc}
	nop
_022036F8: .4byte 0x000005DD
	thumb_func_end ov17_02203674

	thumb_func_start ov17_022036FC
ov17_022036FC: @ 0x022036FC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r4, #0
	movs r0, #0x14
	adds r1, #0x20
	muls r0, r2, r0
	adds r6, r1, r0
	cmp r5, #0x10
	bhi _02203794
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0220371E: @ jump table
	.2byte _02203794 - _0220371E - 2 @ case 0
	.2byte _02203794 - _0220371E - 2 @ case 1
	.2byte _02203794 - _0220371E - 2 @ case 2
	.2byte _02203794 - _0220371E - 2 @ case 3
	.2byte _02203794 - _0220371E - 2 @ case 4
	.2byte _02203740 - _0220371E - 2 @ case 5
	.2byte _0220376C - _0220371E - 2 @ case 6
	.2byte _0220376C - _0220371E - 2 @ case 7
	.2byte _0220376C - _0220371E - 2 @ case 8
	.2byte _0220376C - _0220371E - 2 @ case 9
	.2byte _02203756 - _0220371E - 2 @ case 10
	.2byte _02203740 - _0220371E - 2 @ case 11
	.2byte _0220376C - _0220371E - 2 @ case 12
	.2byte _02203794 - _0220371E - 2 @ case 13
	.2byte _02203756 - _0220371E - 2 @ case 14
	.2byte _0220376C - _0220371E - 2 @ case 15
	.2byte _0220376C - _0220371E - 2 @ case 16
_02203740:
	ldrb r0, [r6, #4]
	bl FUN_022018D4
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0200C0CC
	b _022037AA
_02203756:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xa0
	ldrb r2, [r6, #5]
	ldr r0, [r0]
	movs r1, #1
	movs r3, #2
	bl FUN_0200BFCC
_0220376C:
	ldrb r0, [r6]
	ldr r1, [r4]
	bl FUN_02078108
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	adds r2, r6, #0
	adds r3, r1, #0
	bl FUN_0200BE3C
	adds r0, r6, #0
	bl FUN_02026380
	b _022037AA
_02203794:
	lsls r1, r5, #2
	adds r0, r4, #0
	adds r1, r4, r1
	adds r0, #0xa4
	adds r1, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_020263D4
	add sp, #8
	pop {r4, r5, r6, pc}
_022037AA:
	lsls r2, r5, #2
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, r2
	adds r0, #0xa0
	adds r1, #0xa4
	adds r2, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200CBBC
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov17_022036FC

	thumb_func_start ov17_022037C8
ov17_022037C8: @ 0x022037C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r4, r0, #0
	adds r7, r1, #0
	add r0, sp, #0x38
	add r1, sp, #0x1c
	bl FUN_02014708
	add r0, sp, #0x38
	add r1, sp, #0x1c
	blx FUN_020DC330
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [r4, #0x18]
	add r1, sp, #0x28
	add r2, sp, #0x10
	bl FUN_02201820
	add r0, sp, #0x28
	add r1, sp, #0x10
	blx FUN_020DC330
	subs r2, r5, r0
	mov ip, r6
	mov r2, ip
	sbcs r2, r1
	bge _02203828
	add r2, sp, #0x1c
	ldm r2!, {r0, r1}
	add r3, sp, #4
	stm r3!, {r0, r1}
	ldr r0, [r2]
	mov r5, sp
	subs r5, #0xc
	str r0, [r3]
	add r3, sp, #0x38
	adds r2, r5, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4, #0x18]
	ldm r5!, {r1, r2, r3}
	bl FUN_022017FC
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
_02203828:
	subs r0, r5, r0
	sbcs r6, r1
	adds r1, r6, #0
	movs r2, #0x3c
	movs r3, #0
	blx FUN_020F2750
	adds r2, r0, #0
	beq _02203876
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x1c]
	bl FUN_02201760
	adds r0, r4, #0
	bl ov17_0220387C
	add r2, sp, #0x1c
	mov r5, sp
	ldm r2!, {r0, r1}
	add r3, sp, #4
	stm r3!, {r0, r1}
	ldr r0, [r2]
	subs r5, #0xc
	str r0, [r3]
	add r3, sp, #0x38
	adds r2, r5, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4, #0x18]
	ldm r5!, {r1, r2, r3}
	bl FUN_022017FC
	cmp r7, #0
	beq _02203876
	adds r0, r4, #0
	bl ov17_02203928
_02203876:
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov17_022037C8

	thumb_func_start ov17_0220387C
ov17_0220387C: @ 0x0220387C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_02203884:
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r1, [r0]
	ldr r0, [r6, #0x14]
	adds r1, r4, #0
	bl FUN_022015BC
	adds r1, r5, #0
	adds r1, #0x20
	strb r0, [r1]
	ldr r0, [r6, #0x14]
	adds r1, r4, #0
	bl FUN_022015B0
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
	ldr r0, [r6, #0x14]
	adds r1, r4, #0
	bl FUN_022015EC
	adds r1, r5, #0
	adds r1, #0x22
	strb r0, [r1]
	ldr r0, [r6, #0x14]
	adds r1, r4, #0
	bl FUN_022015E0
	adds r1, r5, #0
	adds r1, #0x23
	strb r0, [r1]
	ldr r0, [r6, #0x14]
	adds r1, r4, #0
	bl FUN_02201650
	adds r1, r5, #0
	adds r1, #0x24
	strb r0, [r1]
	ldr r0, [r6, #0x14]
	adds r1, r4, #0
	bl FUN_02201668
	adds r1, r5, #0
	adds r1, #0x25
	strb r0, [r1]
	ldr r0, [r6, #0x14]
	adds r1, r4, #0
	bl FUN_022015F8
	strh r0, [r5, #0x26]
	ldr r0, [r6, #0x14]
	adds r1, r4, #0
	bl FUN_02201604
	strh r0, [r5, #0x28]
	ldr r0, [r6, #0x14]
	adds r1, r4, #0
	bl FUN_022015C4
	adds r1, r5, #0
	adds r1, #0x2a
	adds r4, r4, #1
	adds r5, #0x14
	strb r0, [r1]
	cmp r4, #4
	blt _02203884
	pop {r4, r5, r6, pc}
	thumb_func_end ov17_0220387C

	thumb_func_start ov17_02203928
ov17_02203928: @ 0x02203928
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r7, r0, #0
	str r0, [sp]
	movs r6, #0
	adds r4, #0x20
	adds r5, r0, #0
	adds r7, #0x7d
_0220393A:
	ldrb r1, [r4, #0xa]
	ldrb r0, [r4, #0xd]
	cmp r1, r0
	beq _0220395A
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_020249D4
	ldrb r0, [r4, #1]
	cmp r0, #1
	bne _0220395A
	ldrb r1, [r4, #0xa]
	ldr r0, [r4, #0x10]
	bl FUN_020249D4
_0220395A:
	ldrb r1, [r4, #1]
	ldrb r0, [r4, #0xc]
	cmp r1, r0
	beq _0220398E
	ldr r0, [sp]
	movs r1, #8
	ldr r0, [r0]
	bl FUN_0201AA8C
	str r0, [sp, #4]
	movs r1, #0
	movs r2, #8
	blx FUN_020D4994
	ldr r1, [sp]
	ldr r0, [sp, #4]
	movs r2, #0
	str r1, [r0]
	strb r6, [r0, #4]
	ldr r0, _0220399C @ =ov17_022039A0
	ldr r1, [sp, #4]
	bl FUN_0200E320
	ldrb r0, [r7]
	adds r0, r0, #1
	strb r0, [r7]
_0220398E:
	adds r6, r6, #1
	adds r4, #0x14
	adds r5, r5, #4
	cmp r6, #4
	blt _0220393A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0220399C: .4byte ov17_022039A0
	thumb_func_end ov17_02203928

	thumb_func_start ov17_022039A0
ov17_022039A0: @ 0x022039A0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	ldrb r0, [r5, #6]
	ldr r4, [r5]
	cmp r0, #0
	beq _022039B4
	cmp r0, #1
	beq _022039D6
	pop {r4, r5, r6, pc}
_022039B4:
	ldrb r0, [r5, #4]
	adds r0, r0, #7
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	ldr r0, _02203A30 @ =0x00000569
	bl FUN_0200604C
	ldrb r0, [r5, #6]
	adds r0, r0, #1
	strb r0, [r5, #6]
	pop {r4, r5, r6, pc}
_022039D6:
	ldrb r1, [r5, #5]
	adds r0, r1, #1
	strb r0, [r5, #5]
	cmp r1, #0xf
	bne _022039FA
	ldrb r1, [r5, #4]
	adds r0, r4, #0
	bl ov17_02202A84
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r1, [r0]
	ldrb r0, [r5, #4]
	cmp r1, r0
	bne _022039FA
	adds r0, r4, #0
	bl ov17_022028B8
_022039FA:
	ldrb r0, [r5, #5]
	cmp r0, #0x1e
	blo _02203A2C
	ldrb r0, [r5, #4]
	adds r0, r0, #7
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	adds r4, #0x7d
	subs r0, r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_0200E390
_02203A2C:
	pop {r4, r5, r6, pc}
	nop
_02203A30: .4byte 0x00000569
	thumb_func_end ov17_022039A0

	thumb_func_start ov17_02203A34
ov17_02203A34: @ 0x02203A34
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	add r1, sp, #0
	adds r4, r0, #0
	bl ov17_02203B68
	ldr r1, [sp]
	cmp r1, #0
	bne _02203A50
	adds r0, r4, #0
	bl ov17_02203AD4
_02203A50:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov17_02203A34

	thumb_func_start ov17_02203A54
ov17_02203A54: @ 0x02203A54
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	add r1, sp, #0
	adds r4, r0, #0
	bl ov17_02203C20
	ldr r1, [sp]
	cmp r1, #0
	bne _02203A70
	adds r0, r4, #0
	bl ov17_02203B88
_02203A70:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov17_02203A54

	thumb_func_start ov17_02203A74
ov17_02203A74: @ 0x02203A74
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #5
	bhi _02203AB0
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02203A88: @ jump table
	.2byte _02203A94 - _02203A88 - 2 @ case 0
	.2byte _02203A94 - _02203A88 - 2 @ case 1
	.2byte _02203A94 - _02203A88 - 2 @ case 2
	.2byte _02203A94 - _02203A88 - 2 @ case 3
	.2byte _02203AA2 - _02203A88 - 2 @ case 4
	.2byte _02203AB0 - _02203A88 - 2 @ case 5
_02203A94:
	ldr r0, _02203AD0 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov17_022028B8
	b _02203ACC
_02203AA2:
	adds r4, #0x7d
	ldrb r1, [r4]
	cmp r1, #0
	bne _02203ACC
	bl ov17_02203D00
	pop {r4, pc}
_02203AB0:
	adds r0, r4, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	cmp r0, #0
	bne _02203ACC
	ldr r0, _02203AD0 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	bl ov17_02202850
	movs r0, #1
	pop {r4, pc}
_02203ACC:
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
_02203AD0: .4byte 0x000005DC
	thumb_func_end ov17_02203A74

	thumb_func_start ov17_02203AD4
ov17_02203AD4: @ 0x02203AD4
	push {r4, lr}
	ldr r1, _02203B60 @ =0x021D110C
	movs r3, #0
	ldr r2, [r1, #0x48]
	ldr r1, _02203B64 @ =0x00000CF3
	tst r1, r2
	beq _02203AE4
	str r3, [r0, #0x74]
_02203AE4:
	ldr r1, _02203B60 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #2
	tst r1, r2
	beq _02203AF6
	movs r1, #5
	bl ov17_02203A74
	pop {r4, pc}
_02203AF6:
	movs r1, #1
	adds r4, r2, #0
	tst r4, r1
	beq _02203B06
	movs r1, #4
	bl ov17_02203A74
	pop {r4, pc}
_02203B06:
	movs r4, #0x20
	tst r4, r2
	beq _02203B2A
	adds r2, r0, #0
	adds r2, #0x7c
	ldrb r2, [r2]
	adds r2, r2, #3
	lsrs r4, r2, #0x1f
	lsls r3, r2, #0x1e
	subs r3, r3, r4
	movs r2, #0x1e
	rors r3, r2
	adds r2, r0, #0
	adds r3, r4, r3
	adds r2, #0x7c
	strb r3, [r2]
	adds r3, r1, #0
	b _02203B4C
_02203B2A:
	movs r4, #0x10
	tst r2, r4
	beq _02203B4C
	adds r2, r0, #0
	adds r2, #0x7c
	ldrb r2, [r2]
	adds r2, r2, #1
	lsrs r4, r2, #0x1f
	lsls r3, r2, #0x1e
	subs r3, r3, r4
	movs r2, #0x1e
	rors r3, r2
	adds r2, r0, #0
	adds r3, r4, r3
	adds r2, #0x7c
	strb r3, [r2]
	adds r3, r1, #0
_02203B4C:
	cmp r3, #0
	beq _02203B5C
	adds r1, r0, #0
	adds r1, #0x7c
	ldrb r1, [r1]
	bl ov17_02203A74
	pop {r4, pc}
_02203B5C:
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
_02203B60: .4byte 0x021D110C
_02203B64: .4byte 0x00000CF3
	thumb_func_end ov17_02203AD4

	thumb_func_start ov17_02203B68
ov17_02203B68: @ 0x02203B68
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov17_02203CC8
	adds r1, r0, #0
	bpl _02203B7A
	movs r0, #2
	pop {r3, r4, r5, pc}
_02203B7A:
	movs r0, #1
	str r0, [r4]
	str r0, [r5, #0x74]
	adds r0, r5, #0
	bl ov17_02203A74
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02203B68

	thumb_func_start ov17_02203B88
ov17_02203B88: @ 0x02203B88
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x81
	ldrb r1, [r1]
	movs r0, #0
	cmp r1, #0xff
	bne _02203C16
	ldr r1, _02203C18 @ =0x021D110C
	ldr r2, [r1, #0x48]
	ldr r1, _02203C1C @ =0x00000CF3
	tst r1, r2
	beq _02203BA4
	str r0, [r4, #0x74]
_02203BA4:
	ldr r1, _02203C18 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #0x20
	tst r1, r2
	beq _02203BCC
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	adds r0, r0, #3
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r4, #0
	adds r1, r2, r1
	adds r0, #0x7c
	strb r1, [r0]
	movs r0, #1
	b _02203BEE
_02203BCC:
	movs r1, #0x10
	tst r1, r2
	beq _02203BEE
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	adds r0, r0, #1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r4, #0
	adds r1, r2, r1
	adds r0, #0x7c
	strb r1, [r0]
	movs r0, #1
_02203BEE:
	cmp r0, #0
	beq _02203C14
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x81
	strb r1, [r0]
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0202484C
	adds r0, r4, #0
	bl ov17_022028B8
	movs r0, #1
	pop {r4, pc}
_02203C14:
	movs r0, #0
_02203C16:
	pop {r4, pc}
	.align 2, 0
_02203C18: .4byte 0x021D110C
_02203C1C: .4byte 0x00000CF3
	thumb_func_end ov17_02203B88

	thumb_func_start ov17_02203C20
ov17_02203C20: @ 0x02203C20
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r5, #0
	adds r1, #0x81
	ldrb r1, [r1]
	cmp r1, #0xff
	beq _02203C34
	movs r0, #0
	pop {r3, r4, r5, pc}
_02203C34:
	bl ov17_02203C78
	cmp r0, #0
	blt _02203C46
	adds r1, r5, #0
	adds r1, #0x7c
	ldrb r1, [r1]
	cmp r1, r0
	bne _02203C4A
_02203C46:
	movs r0, #0
	pop {r3, r4, r5, pc}
_02203C4A:
	movs r1, #1
	str r1, [r4]
	str r1, [r5, #0x74]
	adds r1, r5, #0
	adds r1, #0x7c
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x7c
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x81
	strb r1, [r0]
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0202484C
	adds r0, r5, #0
	bl ov17_022028B8
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02203C20

	thumb_func_start ov17_02203C78
ov17_02203C78: @ 0x02203C78
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
	movs r4, #0x10
	add r6, sp, #0
_02203C82:
	strb r4, [r6, #2]
	ldrb r0, [r6, #2]
	adds r0, #0x16
	strb r0, [r6, #3]
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #3
	bhs _02203C9E
	movs r0, #0x58
	strb r0, [r6]
	ldrb r0, [r6]
	adds r0, #0x18
	b _02203CA6
_02203C9E:
	movs r0, #0x48
	strb r0, [r6]
	ldrb r0, [r6]
	adds r0, #0x20
_02203CA6:
	strb r0, [r6, #1]
	add r0, sp, #0
	bl FUN_02025320
	cmp r0, #0
	beq _02203CB6
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_02203CB6:
	adds r7, r7, #1
	adds r4, #0x1c
	adds r5, #0x14
	cmp r7, #4
	blt _02203C82
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov17_02203C78

	thumb_func_start ov17_02203CC8
ov17_02203CC8: @ 0x02203CC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02203CFC @ =0x02203FC0
	bl FUN_02025320
	cmp r0, #0
	beq _02203CDA
	movs r0, #5
	pop {r4, pc}
_02203CDA:
	adds r0, r4, #0
	bl ov17_02203C78
	cmp r0, #0
	blt _02203CF4
	adds r1, r4, #0
	adds r1, #0x7c
	strb r0, [r1]
	adds r0, r4, #0
	bl ov17_022028B8
	movs r0, #4
	pop {r4, pc}
_02203CF4:
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	nop
_02203CFC: .4byte 0x02203FC0
	thumb_func_end ov17_02203CC8

	thumb_func_start ov17_02203D00
ov17_02203D00: @ 0x02203D00
	adds r2, r0, #0
	adds r0, #0x7c
	ldrb r1, [r0]
	movs r0, #0x14
	adds r2, #0x20
	muls r0, r1, r0
	adds r2, r2, r0
	ldrb r1, [r2, #1]
	cmp r1, #5
	bgt _02203D30
	cmp r1, #0
	blt _02203D4A
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02203D24: @ jump table
	.2byte _02203D34 - _02203D24 - 2 @ case 0
	.2byte _02203D42 - _02203D24 - 2 @ case 1
	.2byte _02203D42 - _02203D24 - 2 @ case 2
	.2byte _02203D42 - _02203D24 - 2 @ case 3
	.2byte _02203D42 - _02203D24 - 2 @ case 4
	.2byte _02203D46 - _02203D24 - 2 @ case 5
_02203D30:
	cmp r1, #0xff
	b _02203D4A
_02203D34:
	ldrb r0, [r2, #4]
	cmp r0, #0
	beq _02203D3E
	movs r0, #4
	bx lr
_02203D3E:
	movs r0, #3
	bx lr
_02203D42:
	movs r0, #5
	bx lr
_02203D46:
	movs r0, #6
	bx lr
_02203D4A:
	movs r0, #2
	bx lr
	.align 2, 0
	thumb_func_end ov17_02203D00
_02203D50:
	.byte 0x02, 0x01, 0x00, 0x00, 0x05, 0x01, 0x00, 0x00, 0x03, 0x01, 0x00, 0x00, 0x04, 0x03, 0x01, 0x00
	.byte 0x00, 0x02, 0x01, 0x00, 0x00, 0x04, 0x03, 0x00, 0x00, 0x06, 0x05, 0x00, 0x03, 0x04, 0x00, 0x0B
	.byte 0x00, 0x00, 0x3A, 0x00, 0x1F, 0x00, 0x54, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x1D, 0x00, 0x1C, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x4F, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x19, 0x15, 0x06, 0x02, 0x09, 0xA2, 0x01, 0x00, 0x02, 0x13, 0x13
	.byte 0x04, 0x0C, 0xCA, 0x00, 0x00, 0x02, 0x13, 0x1B, 0x04, 0x0C, 0x36, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x5C, 0x3D, 0x20, 0x02
	.byte 0x02, 0x00, 0x00, 0x00, 0x58, 0x3D, 0x20, 0x02, 0x02, 0x00, 0x00, 0x00, 0x50, 0x3D, 0x20, 0x02
	.byte 0x02, 0x00, 0x00, 0x00, 0x54, 0x3D, 0x20, 0x02, 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x60, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x38, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x63, 0x00, 0x00, 0x00, 0x04, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x58, 0x00
	.byte 0x00, 0x00, 0x07, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xA0, 0xC0, 0xC0, 0x00
