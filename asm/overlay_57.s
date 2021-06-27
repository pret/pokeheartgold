
	thumb_func_start ov57_022378C0
ov57_022378C0: @ 0x022378C0
	push {r3, lr}
	ldr r0, _022378D4 @ =0x00000006
	movs r1, #2
	bl FUN_02006FF8
	ldr r0, _022378D8 @ =0x00000007
	movs r1, #2
	bl FUN_02006FF8
	pop {r3, pc}
	.align 2, 0
_022378D4: .4byte 0x00000006
_022378D8: .4byte 0x00000007
	thumb_func_end ov57_022378C0

	thumb_func_start ov57_022378DC
ov57_022378DC: @ 0x022378DC
	push {r3, r4, r5, r6, r7, lr}
	movs r2, #2
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x34
	lsls r2, r2, #0x12
	bl FUN_0201A910
	movs r1, #0x46
	adds r0, r5, #0
	lsls r1, r1, #4
	movs r2, #0x34
	bl FUN_02007280
	movs r2, #0x46
	movs r1, #0
	lsls r2, r2, #4
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r0, r5, #0
	bl FUN_020072A4
	str r0, [r4]
	movs r0, #0xb4
	movs r1, #0x34
	bl FUN_02007688
	ldr r1, _02237AE4 @ =0x0000045C
	str r0, [r4, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x2c]
	bl FUN_020183F0
	ldr r1, _02237AE8 @ =0x0000040C
	str r0, [r4, r1]
	movs r0, #0x34
	bl FUN_0206DD2C
	ldr r1, _02237AEC @ =0x00000458
	movs r2, #0xff
	str r0, [r4, r1]
	adds r0, r4, #0
	adds r0, #0xd4
	str r2, [r0]
	movs r5, #0
	subs r1, #0x10
	str r5, [r4, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl FUN_0202CD74
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1d
	subs r1, r1, r2
	movs r0, #0x1d
	rors r1, r0
	adds r0, r2, r1
	beq _02237954
	movs r5, #1
_02237954:
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl FUN_0202CD74
	asrs r1, r0, #2
	lsrs r1, r1, #0x1d
	adds r1, r0, r1
	asrs r0, r1, #3
	adds r1, r5, r0
	ldr r0, _02237AF0 @ =0x0000044C
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0xa
	ble _02237974
	movs r1, #0xa
	str r1, [r4, r0]
_02237974:
	ldr r0, [r4]
	bl ov57_02237E78
	movs r1, #0xfb
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	bl ov57_02237E78
	movs r1, #0x3f
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl FUN_0202CC54
	str r0, [r4, #0x64]
	movs r6, #0
	adds r5, r4, #0
	movs r7, #0xff
_0223799C:
	ldr r0, [r4]
	adds r1, r6, #0
	ldr r0, [r0, #0x20]
	bl FUN_0202CBF4
	str r7, [r5, #4]
	str r0, [r5, #8]
	adds r6, r6, #1
	adds r5, #8
	cmp r6, #0xc
	blt _0223799C
	movs r5, #0
	adds r6, r5, #0
	movs r7, #0xa2
_022379B8:
	ldr r0, [r4]
	adds r0, r0, r6
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _022379D6
	adds r1, r7, #0
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _022379D6
	lsls r0, r0, #3
	adds r0, r4, r0
	subs r0, r0, #4
	str r5, [r0]
_022379D6:
	adds r5, r5, #1
	adds r6, r6, #4
	cmp r5, #6
	blt _022379B8
	movs r0, #0x34
	bl ov57_02237CA8
	bl ov57_0223BB5C
	bl ov57_02238B28
	movs r1, #0x96
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x34
	bl FUN_0201AC88
	adds r1, r4, #0
	adds r1, #0xe4
	str r0, [r1]
	movs r0, #0x40
	movs r1, #0x34
	bl FUN_0202055C
	movs r0, #0x34
	bl FUN_020030E8
	adds r1, r4, #0
	adds r1, #0xe8
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02003B50
	adds r0, r4, #0
	adds r0, #0xe8
	movs r2, #2
	ldr r0, [r0]
	movs r1, #0
	lsls r2, r2, #8
	movs r3, #0x34
	bl FUN_02003120
	adds r0, r4, #0
	adds r0, #0xe8
	movs r1, #1
	ldr r0, [r0]
	lsls r2, r1, #9
	movs r3, #0x34
	bl FUN_02003120
	adds r0, r4, #0
	adds r0, #0xe8
	movs r1, #2
	ldr r0, [r0]
	lsls r2, r1, #8
	movs r3, #0x34
	bl FUN_02003120
	adds r0, r4, #0
	adds r0, #0xe8
	movs r2, #2
	ldr r0, [r0]
	movs r1, #3
	lsls r2, r2, #8
	movs r3, #0x34
	bl FUN_02003120
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	bl ov57_02237CEC
	bl ov57_02238BCC
	movs r0, #0x34
	bl FUN_02007FD4
	movs r1, #0x71
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x34
	movs r1, #1
	movs r2, #0
	bl FUN_02016EDC
	movs r1, #0xa1
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	bl FUN_0202ADCC
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xe4
	adds r1, #0xe8
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r5, #0
	bl ov57_022395B8
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xe4
	adds r1, #0xe8
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r5, #0
	bl ov57_02239670
	adds r0, r4, #0
	adds r0, #0xd4
	bl ov57_02239058
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	adds r0, r4, #0
	bl ov57_0223BB84
	ldr r0, _02237AF4 @ =ov57_02237E38
	adds r1, r4, #0
	bl FUN_0201A0FC
	adds r0, r4, #0
	bl ov57_022386F0
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02237AE4: .4byte 0x0000045C
_02237AE8: .4byte 0x0000040C
_02237AEC: .4byte 0x00000458
_02237AF0: .4byte 0x0000044C
_02237AF4: .4byte ov57_02237E38
	thumb_func_end ov57_022378DC

	thumb_func_start ov57_02237AF8
ov57_02237AF8: @ 0x02237AF8
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	bl ov57_0223A0E0
	cmp r0, #0
	bne _02237B0C
	movs r0, #1
	pop {r4, pc}
_02237B0C:
	movs r0, #0x71
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02008120
	bl ov57_02238C0C
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov57_02237AF8

	thumb_func_start ov57_02237B20
ov57_02237B20: @ 0x02237B20
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
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
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #7
	bl FUN_0201BB4C
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02003150
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02003150
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #2
	bl FUN_02003150
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #3
	bl FUN_02003150
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_02003104
	movs r1, #0xfb
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	ldr r0, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov57_02237E80
	ldr r0, _02237C94 @ =0x00000458
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl ov57_022383AC
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026CAC
	movs r0, #0x71
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02008524
	movs r0, #0xa1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02016F2C
	adds r0, r4, #0
	bl ov57_02238714
	adds r0, r4, #0
	adds r0, #0xd4
	bl ov57_022390F4
	bl FUN_020205AC
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026F54
	movs r0, #0x34
	bl ov57_02237CDC
	ldr r0, _02237C98 @ =0x0000045C
	ldr r0, [r4, r0]
	bl FUN_0200770C
	ldr r0, [r4]
	ldr r1, _02237C9C @ =0x0000040C
	ldr r0, [r0, #0x2c]
	ldr r1, [r4, r1]
	bl FUN_02018410
	adds r0, r5, #0
	bl FUN_02007294
	bl FUN_02021238
	movs r0, #0x34
	bl FUN_0201A9C4
	ldr r0, _02237CA0 @ =0x00000006
	bl FUN_02006F7C
	ldr r0, _02237CA4 @ =0x00000007
	bl FUN_02006F7C
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_02237C94: .4byte 0x00000458
_02237C98: .4byte 0x0000045C
_02237C9C: .4byte 0x0000040C
_02237CA0: .4byte 0x00000006
_02237CA4: .4byte 0x00000007
	thumb_func_end ov57_02237B20

	thumb_func_start ov57_02237CA8
ov57_02237CA8: @ 0x02237CA8
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
	ldr r0, _02237CD4 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _02237CD8 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_02237CD4: .4byte 0xFFFFE0FF
_02237CD8: .4byte 0x04001000
	thumb_func_end ov57_02237CA8

	thumb_func_start ov57_02237CDC
ov57_02237CDC: @ 0x02237CDC
	push {r3, lr}
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	pop {r3, pc}
	thumb_func_end ov57_02237CDC

	thumb_func_start ov57_02237CEC
ov57_02237CEC: @ 0x02237CEC
	push {r4, r5, lr}
	sub sp, #0xfc
	adds r4, r0, #0
	bl FUN_02022C54
	ldr r5, _02237E24 @ =0x0223BC90
	add r3, sp, #0x10
	movs r2, #5
_02237CFC:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02237CFC
	add r0, sp, #0x10
	bl FUN_02022BE8
	movs r1, #6
	movs r2, #2
	movs r0, #0
	lsls r1, r1, #0x18
	lsls r2, r2, #0x12
	blx FUN_020D47EC
	movs r1, #0x62
	movs r2, #2
	movs r0, #0
	lsls r1, r1, #0x14
	lsls r2, r2, #0x10
	blx FUN_020D47EC
	movs r1, #0x19
	movs r2, #1
	movs r0, #0
	lsls r1, r1, #0x16
	lsls r2, r2, #0x12
	blx FUN_020D47EC
	movs r1, #0x66
	movs r2, #2
	movs r0, #0
	lsls r1, r1, #0x14
	lsls r2, r2, #0x10
	blx FUN_020D47EC
	ldr r5, _02237E28 @ =_0223BC80
	add r3, sp, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _02237E2C @ =0x0223BCB8
	add r3, sp, #0xa8
	movs r2, #0xa
_02237D5C:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02237D5C
	ldr r0, [r5]
	movs r1, #1
	str r0, [r3]
	adds r0, r4, #0
	add r2, sp, #0xa8
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #2
	add r2, sp, #0xc4
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #3
	add r2, sp, #0xe0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201CAE0
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	ldr r1, _02237E30 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	movs r0, #1
	orrs r2, r0
	strh r2, [r1]
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r5, _02237E34 @ =0x0223BD0C
	add r3, sp, #0x38
	movs r2, #0xe
_02237DBE:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02237DBE
	adds r0, r4, #0
	movs r1, #4
	add r2, sp, #0x38
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #5
	add r2, sp, #0x54
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #6
	add r2, sp, #0x70
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #7
	add r2, sp, #0x8c
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201CAE0
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201CAE0
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201CAE0
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	add sp, #0xfc
	pop {r4, r5, pc}
	nop
_02237E24: .4byte 0x0223BC90
_02237E28: .4byte _0223BC80
_02237E2C: .4byte 0x0223BCB8
_02237E30: .4byte 0x04000008
_02237E34: .4byte 0x0223BD0C
	thumb_func_end ov57_02237CEC

	thumb_func_start ov57_02237E38
ov57_02237E38: @ 0x02237E38
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x71
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02009418
	bl FUN_0200D034
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_0200398C
	adds r4, #0xe4
	ldr r0, [r4]
	bl FUN_0201EEB4
	bl FUN_0202061C
	ldr r3, _02237E70 @ =0x027E0000
	ldr r1, _02237E74 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_02237E70: .4byte 0x027E0000
_02237E74: .4byte 0x00003FF8
	thumb_func_end ov57_02237E38

	thumb_func_start ov57_02237E78
ov57_02237E78: @ 0x02237E78
	adds r0, #0x30
	ldrb r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov57_02237E78

	thumb_func_start ov57_02237E80
ov57_02237E80: @ 0x02237E80
	adds r0, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov57_02237E80

	thumb_func_start ov57_02237E88
ov57_02237E88: @ 0x02237E88
	adds r0, #0x31
	strb r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov57_02237E88

	thumb_func_start ov57_02237E90
ov57_02237E90: @ 0x02237E90
	adds r3, r2, #0
	subs r3, #0xa
	strb r3, [r0]
	adds r3, r1, #0
	subs r3, #0xa
	strb r3, [r0, #2]
	adds r2, #0xa
	strb r2, [r0, #1]
	adds r1, #0xa
	strb r1, [r0, #3]
	bx lr
	.align 2, 0
	thumb_func_end ov57_02237E90

	thumb_func_start ov57_02237EA8
ov57_02237EA8: @ 0x02237EA8
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #2]
	movs r1, #0xc0
	strb r1, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #3]
	bx lr
	thumb_func_end ov57_02237EA8

	thumb_func_start ov57_02237EB8
ov57_02237EB8: @ 0x02237EB8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	beq _02237F0C
	cmp r2, #1
	bne _02237EE8
	ldr r3, _02237F10 @ =0x021D114C
	movs r1, #0x20
	movs r2, #0x22
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	adds r0, r4, #0
	bl FUN_0200DDB8
	add r1, sp, #0
	adds r0, r4, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	adds r0, r5, #0
	bl ov57_02237EA8
	pop {r3, r4, r5, pc}
_02237EE8:
	add r1, sp, #0
	adds r0, r4, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	add r3, sp, #0
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	adds r0, r5, #0
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl ov57_02237E90
_02237F0C:
	pop {r3, r4, r5, pc}
	nop
_02237F10: .4byte 0x021D114C
	thumb_func_end ov57_02237EB8

	thumb_func_start ov57_02237F14
ov57_02237F14: @ 0x02237F14
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	adds r7, r4, #0
	movs r6, #0xd5
	adds r5, r0, #0
	subs r7, #0x38
	lsls r6, r6, #2
_02237F22:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _02237F30
	adds r1, r7, #0
	movs r2, #0x10
	bl FUN_0200DED0
_02237F30:
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #8
	blt _02237F22
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov57_02237F14

	thumb_func_start ov57_02237F3C
ov57_02237F3C: @ 0x02237F3C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xfb
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r6, #0
	lsls r0, r0, #3
	adds r0, r7, r0
	ldr r4, [r0, #8]
	adds r5, r7, #0
_02237F50:
	ldrb r1, [r4]
	cmp r1, #0
	beq _02237F8E
	movs r0, #0x35
	lsls r0, r0, #4
	strb r1, [r5, r0]
	ldrb r1, [r4, #1]
	adds r0, r0, #1
	strb r1, [r5, r0]
	ldrb r1, [r4, #2]
	ldr r0, _02237FA8 @ =0x00000352
	strb r1, [r5, r0]
	lsls r1, r6, #0x18
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	bl ov57_02238260
	movs r0, #0xd6
	movs r1, #0xd5
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	movs r2, #0
	bl ov57_02237EB8
	movs r0, #0xd3
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _02237F9A
_02237F8E:
	movs r0, #0xd3
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r0, #4
	strb r1, [r5, r0]
_02237F9A:
	adds r6, r6, #1
	adds r4, r4, #3
	adds r5, #0x10
	cmp r6, #8
	blt _02237F50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02237FA8: .4byte 0x00000352
	thumb_func_end ov57_02237F3C

	thumb_func_start ov57_02237FAC
ov57_02237FAC: @ 0x02237FAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0xd3
	movs r4, #0
	adds r3, r6, #0
	lsls r0, r0, #2
_02237FBA:
	ldr r2, [r3, r0]
	cmp r2, #1
	beq _0223801A
	movs r0, #0x45
	adds r1, r6, r1
	lsls r0, r0, #4
	ldrb r2, [r1, r0]
	lsls r5, r4, #4
	movs r0, #0x35
	adds r1, r6, r5
	lsls r0, r0, #4
	strb r2, [r1, r0]
	adds r1, r0, #1
	adds r7, r6, r1
	movs r1, #0xbe
	adds r0, r0, #2
	strb r1, [r7, r5]
	adds r0, r6, r0
	movs r1, #0x46
	strb r1, [r0, r5]
	str r0, [sp]
	add r0, sp, #8
	add r1, sp, #4
	bl FUN_02025364
	ldr r0, [sp, #8]
	strb r0, [r7, r5]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	strb r1, [r0, r5]
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	bl ov57_02238260
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	bl ov57_02238044
	movs r0, #0xd3
	movs r2, #1
	adds r1, r6, r5
	lsls r0, r0, #2
	str r2, [r1, r0]
	add sp, #0xc
	adds r0, r4, #0
	pop {r4, r5, r6, r7, pc}
_0223801A:
	adds r4, r4, #1
	adds r3, #0x10
	cmp r4, #8
	blt _02237FBA
	movs r0, #0xff
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov57_02237FAC

	thumb_func_start ov57_02238028
ov57_02238028: @ 0x02238028
	movs r1, #0xd3
	movs r3, #0
	lsls r1, r1, #2
_0223802E:
	ldr r2, [r0, r1]
	cmp r2, #1
	beq _02238038
	movs r0, #1
	bx lr
_02238038:
	adds r3, r3, #1
	adds r0, #0x10
	cmp r3, #8
	blt _0223802E
	movs r0, #0
	bx lr
	thumb_func_end ov57_02238028

	thumb_func_start ov57_02238044
ov57_02238044: @ 0x02238044
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0xd3
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	lsls r7, r7, #2
_02238050:
	ldr r0, [r5, r7]
	cmp r0, #1
	bne _02238090
	cmp r4, r6
	bne _02238068
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DD68
	b _02238090
_02238068:
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200DD7C
	adds r1, r0, #0
	bne _02238084
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r1, #1
	bl FUN_0200DD68
	b _02238090
_02238084:
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r1, #2
	bl FUN_0200DD68
_02238090:
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #8
	blt _02238050
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov57_02238044

	thumb_func_start ov57_0223809C
ov57_0223809C: @ 0x0223809C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r1, #0
	adds r1, r0, #0
	adds r1, #0xdc
	ldr r4, [r1]
	adds r1, r0, #0
	adds r1, #0xe0
	ldr r5, [r1]
	movs r1, #0x57
	str r1, [sp]
	movs r1, #6
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	movs r1, #2
	str r1, [sp, #0x10]
	ldr r1, _02238124 @ =0x0000520E
	adds r6, r2, #0
	str r1, [sp, #0x14]
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #3
	adds r2, r4, #0
	adds r3, r5, #0
	bl FUN_0200D644
	adds r0, r7, #0
	bl FUN_02091054
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _02238128 @ =0x00004E20
	adds r1, r5, #0
	adds r0, r6, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r2, #0x57
	bl FUN_0200D4A4
	movs r0, #1
	str r0, [sp]
	ldr r0, _0223812C @ =0x00005616
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x57
	movs r3, #0x26
	bl FUN_0200D6D4
	movs r0, #1
	str r0, [sp]
	ldr r0, _02238130 @ =0x000059FC
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x57
	movs r3, #0x24
	bl FUN_0200D704
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238124: .4byte 0x0000520E
_02238128: .4byte 0x00004E20
_0223812C: .4byte 0x00005616
_02238130: .4byte 0x000059FC
	thumb_func_end ov57_0223809C

	thumb_func_start ov57_02238134
ov57_02238134: @ 0x02238134
	push {r4, r5, r6, r7, lr}
	sub sp, #0x74
	movs r1, #0xa2
	lsls r1, r1, #2
	str r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _02238146
	b _02238254
_02238146:
	ldr r0, [sp]
	movs r7, #0
	str r7, [r0, r1]
	add r4, sp, #0x54
	add r5, sp, #0x34
	adds r6, r0, #0
_02238152:
	movs r0, #0xff
	str r0, [r4]
	str r0, [r5]
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0223816A
	bl FUN_0200DD7C
	str r0, [r4]
	str r7, [r5]
_0223816A:
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, r5, #4
	adds r6, #0x10
	cmp r7, #8
	blt _02238152
	movs r0, #0
	mov ip, r0
_0223817A:
	mov r0, ip
	movs r3, #7
	cmp r0, #7
	bge _022381AA
	add r4, sp, #0x70
	add r5, sp, #0x50
_02238186:
	subs r7, r4, #4
	ldr r2, [r4]
	ldr r0, [r7]
	cmp r0, r2
	blt _0223819E
	ldr r1, [r5]
	subs r6, r5, #4
	str r0, [r4]
	ldr r0, [r6]
	str r0, [r5]
	str r2, [r7]
	str r1, [r6]
_0223819E:
	subs r3, r3, #1
	mov r0, ip
	subs r4, r4, #4
	subs r5, r5, #4
	cmp r3, r0
	bgt _02238186
_022381AA:
	mov r0, ip
	adds r0, r0, #1
	mov ip, r0
	cmp r0, #7
	blt _0223817A
	movs r3, #0x35
	lsls r3, r3, #4
	ldr r0, [sp]
	movs r2, #0
	add r1, sp, #0x1c
	adds r4, r3, #1
	adds r5, r3, #2
_022381C2:
	ldrb r6, [r0, r3]
	adds r2, r2, #1
	strb r6, [r1]
	ldrb r6, [r0, r4]
	strb r6, [r1, #1]
	ldrb r6, [r0, r5]
	adds r0, #0x10
	strb r6, [r1, #2]
	adds r1, r1, #3
	cmp r2, #8
	blt _022381C2
	add r3, sp, #0x1c
	add r2, sp, #4
	movs r1, #0x18
_022381DE:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _022381DE
	ldr r5, [sp]
	movs r6, #0
	add r4, sp, #0x34
	add r7, sp, #4
_022381F2:
	ldr r1, [r4]
	cmp r1, #0xff
	bne _0223820A
	movs r0, #0x35
	movs r1, #0
	lsls r0, r0, #4
	strb r1, [r5, r0]
	adds r0, r0, #1
	strb r1, [r5, r0]
	ldr r0, _02238258 @ =0x00000352
	strb r1, [r5, r0]
	b _0223824A
_0223820A:
	lsls r0, r1, #1
	adds r0, r1, r0
	ldrb r1, [r7, r0]
	movs r0, #0x35
	lsls r0, r0, #4
	strb r1, [r5, r0]
	ldr r1, [r4]
	lsls r0, r1, #1
	adds r0, r1, r0
	adds r0, r7, r0
	ldrb r1, [r0, #1]
	ldr r0, _0223825C @ =0x00000351
	strb r1, [r5, r0]
	ldr r1, [r4]
	lsls r0, r1, #1
	adds r0, r1, r0
	adds r0, r7, r0
	ldrb r1, [r0, #2]
	ldr r0, _02238258 @ =0x00000352
	strb r1, [r5, r0]
	ldr r0, [r4]
	lsls r1, r0, #4
	ldr r0, [sp]
	adds r1, r0, r1
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0223824A
	adds r1, r6, #0
	bl FUN_0200DD68
_0223824A:
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, #0x10
	cmp r6, #8
	blt _022381F2
_02238254:
	add sp, #0x74
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02238258: .4byte 0x00000352
_0223825C: .4byte 0x00000351
	thumb_func_end ov57_02238134

	thumb_func_start ov57_02238260
ov57_02238260: @ 0x02238260
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r1, #0
	adds r1, r0, #0
	adds r1, #0xdc
	ldr r7, [r1]
	adds r1, r0, #0
	adds r1, #0xe0
	ldr r6, [r1]
	movs r1, #0xd3
	lsls r1, r1, #2
	adds r2, r0, r1
	lsls r1, r5, #4
	adds r4, r2, r1
	ldr r1, [r2, r1]
	cmp r1, #1
	bne _0223828C
	bl GF_AssertFail
	add sp, #0x34
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0223828C:
	ldrb r1, [r4, #4]
	adds r2, r5, #0
	bl ov57_0223809C
	ldrb r1, [r4, #5]
	add r0, sp, #0
	strh r1, [r0]
	ldrb r1, [r4, #6]
	strh r1, [r0, #2]
	movs r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #1
	str r0, [sp, #0x2c]
	subs r0, r0, #2
	str r1, [sp, #0xc]
	str r1, [sp, #0x30]
	str r1, [sp, #8]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldrb r0, [r4, #4]
	bl FUN_02091054
	ldr r0, _022382E8 @ =0x00004E20
	adds r1, r6, #0
	adds r0, r5, r0
	str r0, [sp, #0x14]
	ldr r0, _022382EC @ =0x0000520E
	add r2, sp, #0
	str r0, [sp, #0x18]
	ldr r0, _022382F0 @ =0x00005616
	str r0, [sp, #0x1c]
	ldr r0, _022382F4 @ =0x000059FC
	str r0, [sp, #0x20]
	adds r0, r7, #0
	bl FUN_0200D734
	str r0, [r4, #8]
	bl FUN_0200DC18
	movs r0, #1
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_022382E8: .4byte 0x00004E20
_022382EC: .4byte 0x0000520E
_022382F0: .4byte 0x00005616
_022382F4: .4byte 0x000059FC
	thumb_func_end ov57_02238260

	thumb_func_start ov57_022382F8
ov57_022382F8: @ 0x022382F8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r2, #0
	adds r6, r1, #0
	movs r1, #0xd3
	adds r4, r0, #0
	lsls r7, r5, #4
	adds r3, r4, r7
	lsls r1, r1, #2
	ldr r2, [r3, r1]
	cmp r2, #0
	bne _02238312
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02238312:
	cmp r6, #3
	bhi _022383A2
	adds r2, r6, r6
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_02238322: @ jump table
	.2byte _0223832A - _02238322 - 2 @ case 0
	.2byte _0223836A - _02238322 - 2 @ case 1
	.2byte _02238340 - _02238322 - 2 @ case 2
	.2byte _0223836A - _02238322 - 2 @ case 3
_0223832A:
	adds r1, r4, #0
	adds r1, #0xd4
	ldr r1, [r1]
	cmp r1, #0xff
	bne _022383A6
	adds r4, #0xd4
	adds r1, r5, #0
	str r5, [r4]
	bl ov57_02238044
	b _022383A6
_02238340:
	adds r0, #0xd4
	ldr r0, [r0]
	cmp r0, r5
	bne _022383A6
	adds r0, r1, #0
	adds r0, #0xc
	adds r1, #8
	ldr r0, [r3, r0]
	ldr r1, [r3, r1]
	movs r2, #1
	bl ov57_02237EB8
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_0223848C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_02238508
	b _022383A6
_0223836A:
	adds r1, r4, #0
	adds r1, #0xd4
	ldr r1, [r1]
	cmp r1, #0xff
	bne _022383A6
	adds r1, r5, #0
	bl ov57_022383F8
	movs r1, #0xd6
	adds r2, r4, r7
	lsls r1, r1, #2
	adds r6, r0, #0
	ldr r0, [r2, r1]
	subs r1, r1, #4
	ldr r1, [r2, r1]
	movs r2, #0
	bl ov57_02237EB8
	cmp r6, #0
	bne _0223839A
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_02238438
_0223839A:
	movs r0, #0xff
	adds r4, #0xd4
	str r0, [r4]
	b _022383A6
_022383A2:
	bl GF_AssertFail
_022383A6:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov57_022382F8

	thumb_func_start ov57_022383AC
ov57_022383AC: @ 0x022383AC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0xd3
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_022383B8:
	ldr r0, [r5, r7]
	cmp r0, #1
	bne _022383C6
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov57_02238438
_022383C6:
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #8
	blt _022383B8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_022383AC

	thumb_func_start ov57_022383D0
ov57_022383D0: @ 0x022383D0
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0xd3
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	lsls r7, r7, #2
_022383DC:
	ldr r0, [r5, r7]
	cmp r0, #1
	bne _022383EE
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_0200DCE8
_022383EE:
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #8
	blt _022383DC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_022383D0

	thumb_func_start ov57_022383F8
ov57_022383F8: @ 0x022383F8
	push {r3, lr}
	lsls r1, r1, #4
	adds r2, r0, r1
	movs r0, #0xd3
	lsls r0, r0, #2
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _0223840C
	movs r0, #1
	pop {r3, pc}
_0223840C:
	adds r0, #8
	ldr r0, [r2, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	add r2, sp, #0
	movs r0, #2
	movs r1, #0
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	movs r2, #0xbe
	movs r3, #0x46
	bl FUN_022344E4
	cmp r0, #0x3c
	bgt _02238434
	movs r0, #1
	pop {r3, pc}
_02238434:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov57_022383F8

	thumb_func_start ov57_02238438
ov57_02238438: @ 0x02238438
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x35
	adds r7, r1, #0
	lsls r0, r0, #4
	lsls r4, r7, #4
	adds r6, r5, r0
	ldrb r0, [r6, r4]
	bl FUN_02091054
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r1, _02238488 @ =0x00004E20
	ldr r0, [r0]
	adds r1, r7, r1
	bl FUN_0200D958
	movs r0, #0xd5
	lsls r0, r0, #2
	adds r7, r5, r0
	ldr r0, [r7, r4]
	bl FUN_0200D9DC
	movs r1, #0
	movs r2, #0xd3
	lsls r2, r2, #2
	str r1, [r7, r4]
	adds r3, r5, r4
	str r1, [r3, r2]
	strb r1, [r6, r4]
	adds r0, r2, #5
	strb r1, [r3, r0]
	adds r0, r2, #6
	adds r2, #0xc
	strb r1, [r3, r0]
	ldr r0, [r3, r2]
	adds r2, r1, #0
	bl ov57_02237E90
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02238488: .4byte 0x00004E20
	thumb_func_end ov57_02238438

	thumb_func_start ov57_0223848C
ov57_0223848C: @ 0x0223848C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ov57_022383F8
	cmp r0, #0
	bne _022384AC
	lsls r0, r5, #4
	adds r1, r4, r0
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_0200E0FC
	pop {r3, r4, r5, pc}
_022384AC:
	lsls r0, r5, #4
	adds r1, r4, r0
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200E0FC
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov57_0223848C

	thumb_func_start ov57_022384C0
ov57_022384C0: @ 0x022384C0
	push {r4, r5, r6, r7}
	movs r2, #0xfb
	lsls r2, r2, #2
	ldr r2, [r0, r2]
	ldr r4, _02238504 @ =0x00000351
	lsls r2, r2, #3
	adds r2, r0, r2
	ldr r2, [r2, #8]
	movs r1, #0
	adds r3, r4, #1
	subs r5, r4, #1
_022384D6:
	ldrb r7, [r0, r5]
	ldrb r6, [r2]
	cmp r7, r6
	bne _022384EE
	ldrb r7, [r0, r4]
	ldrb r6, [r2, #1]
	cmp r7, r6
	bne _022384EE
	ldrb r7, [r0, r3]
	ldrb r6, [r2, #2]
	cmp r7, r6
	beq _022384F4
_022384EE:
	movs r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_022384F4:
	adds r1, r1, #1
	adds r2, r2, #3
	adds r0, #0x10
	cmp r1, #8
	blt _022384D6
	movs r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_02238504: .4byte 0x00000351
	thumb_func_end ov57_022384C0

	thumb_func_start ov57_02238508
ov57_02238508: @ 0x02238508
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #4
	movs r0, #0xd5
	adds r1, r5, r4
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	add r2, sp, #0
	movs r0, #2
	ldrsh r1, [r2, r0]
	ldr r0, _02238538 @ =0x00000351
	adds r3, r5, r4
	strb r1, [r3, r0]
	movs r1, #0
	ldrsh r1, [r2, r1]
	adds r0, r0, #1
	strb r1, [r3, r0]
	pop {r3, r4, r5, pc}
	nop
_02238538: .4byte 0x00000351
	thumb_func_end ov57_02238508

	thumb_func_start ov57_0223853C
ov57_0223853C: @ 0x0223853C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	movs r3, #0x35
	adds r7, r0, #0
	lsls r3, r3, #4
	movs r0, #0
	adds r1, r7, #0
	add r2, sp, #0
	adds r4, r3, #1
	adds r5, r3, #2
_02238550:
	ldrb r6, [r1, r3]
	adds r0, r0, #1
	strb r6, [r2]
	ldrb r6, [r1, r4]
	strb r6, [r2, #1]
	ldrb r6, [r1, r5]
	adds r1, #0x10
	strb r6, [r2, #2]
	adds r2, r2, #3
	cmp r0, #8
	blt _02238550
	ldr r0, [r7]
	movs r2, #0xfb
	lsls r2, r2, #2
	ldr r0, [r0, #0x20]
	ldr r2, [r7, r2]
	add r1, sp, #0
	bl FUN_0202CC0C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov57_0223853C

	thumb_func_start ov57_0223857C
ov57_0223857C: @ 0x0223857C
	push {r3, r4, r5, r6}
	movs r3, #0x35
	lsls r3, r3, #4
	movs r2, #0
	adds r4, r3, #1
	adds r5, r3, #2
_02238588:
	ldrb r6, [r1, r3]
	adds r2, r2, #1
	strb r6, [r0]
	ldrb r6, [r1, r4]
	strb r6, [r0, #1]
	ldrb r6, [r1, r5]
	adds r1, #0x10
	strb r6, [r0, #2]
	adds r0, r0, #3
	cmp r2, #8
	blt _02238588
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
	thumb_func_end ov57_0223857C

	thumb_func_start ov57_022385A4
ov57_022385A4: @ 0x022385A4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, r1, #0
	add r1, sp, #0
	adds r4, r2, #0
	adds r1, #2
	add r2, sp, #0
	adds r6, r3, #0
	bl FUN_0200DE44
	add r1, sp, #0
	movs r0, #0
	ldrsh r2, [r1, r0]
	subs r2, r2, r6
	strb r2, [r5]
	ldrsh r0, [r1, r0]
	adds r0, r0, r6
	strb r0, [r5, #1]
	movs r0, #2
	ldrsh r2, [r1, r0]
	subs r2, r2, r4
	strb r2, [r5, #2]
	ldrsh r0, [r1, r0]
	adds r0, r0, r4
	strb r0, [r5, #3]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov57_022385A4

	thumb_func_start ov57_022385DC
ov57_022385DC: @ 0x022385DC
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0x3a
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0xe4
	adds r1, r4, #0
	movs r2, #1
	ldr r0, [r0]
	adds r1, #0xec
	adds r3, r2, #0
	bl ov57_02239814
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r1, #0x3a
	adds r0, r4, #0
	str r1, [sp, #0xc]
	adds r0, #0xe4
	adds r1, #0xe2
	movs r2, #1
	ldr r0, [r0]
	adds r1, r4, r1
	adds r3, r2, #0
	bl ov57_02239814
	movs r0, #0x15
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r1, #0x76
	adds r0, r4, #0
	str r1, [sp, #0xc]
	adds r0, #0xe4
	adds r1, #0x96
	ldr r0, [r0]
	adds r1, r4, r1
	movs r2, #1
	movs r3, #0x17
	bl ov57_02239814
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov57_022385DC

	thumb_func_start ov57_0223864C
ov57_0223864C: @ 0x0223864C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xec
	bl FUN_0201D520
	movs r0, #0x47
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	pop {r4, pc}
	thumb_func_end ov57_0223864C

	thumb_func_start ov57_0223866C
ov57_0223866C: @ 0x0223866C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	cmp r1, #0
	beq _022386DC
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xb
	movs r3, #0x34
	bl FUN_0200BAF8
	movs r1, #0x11
	adds r6, r0, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0
	bl FUN_02002F30
	movs r1, #0x40
	subs r3, r1, r0
	movs r2, #0
	str r2, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	ldr r0, _022386EC @ =0x00010F00
	adds r1, #0xd
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	adds r0, r5, r1
	movs r1, #4
	adds r2, r4, #0
	lsrs r3, r3, #1
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_0200BB44
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
_022386DC:
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D8E4
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_022386EC: .4byte 0x00010F00
	thumb_func_end ov57_0223866C

	thumb_func_start ov57_022386F0
ov57_022386F0: @ 0x022386F0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #2
	movs r1, #0x34
	bl FUN_02013534
	movs r1, #0x97
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #2
	movs r1, #0x34
	bl FUN_02002CEC
	movs r0, #4
	movs r1, #0x34
	bl FUN_02002CEC
	pop {r4, pc}
	thumb_func_end ov57_022386F0

	thumb_func_start ov57_02238714
ov57_02238714: @ 0x02238714
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #4
	bl FUN_02002DB4
	movs r0, #2
	bl FUN_02002DB4
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02013660
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_02021B5C
	movs r0, #0x99
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02013660
	movs r0, #0x9d
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_02021B5C
	movs r0, #0x97
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020135AC
	pop {r4, pc}
	thumb_func_end ov57_02238714

	thumb_func_start ov57_02238758
ov57_02238758: @ 0x02238758
	push {r3, lr}
	sub sp, #0x18
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	ldr r0, _02238790 @ =0x00007530
	adds r2, r3, #0
	str r0, [sp, #0x14]
	adds r0, r3, #0
	adds r0, #0xe8
	adds r2, #0xdc
	adds r3, #0xe0
	ldr r0, [r0]
	ldr r2, [r2]
	ldr r3, [r3]
	movs r1, #3
	bl FUN_0200D644
	add sp, #0x18
	pop {r3, pc}
	.align 2, 0
_02238790: .4byte 0x00007530
	thumb_func_end ov57_02238758

	thumb_func_start ov57_02238794
ov57_02238794: @ 0x02238794
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ov57_02238758
	movs r1, #0
	adds r0, r4, #0
	movs r2, #0x68
	movs r3, #0xa5
	str r1, [sp]
	bl ov57_022387E0
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xc0
	movs r3, #0xa5
	bl ov57_022387E0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov57_02238794

	thumb_func_start ov57_022387C0
ov57_022387C0: @ 0x022387C0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_020137C0
	movs r0, #0x99
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_020137C0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov57_022387C0

	thumb_func_start ov57_022387E0
ov57_022387E0: @ 0x022387E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	adds r5, r0, #0
	adds r4, r1, #0
	str r2, [sp, #0x10]
	adds r7, r3, #0
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xb
	movs r3, #0x34
	bl FUN_0200BAF8
	adds r1, r4, #5
	str r0, [sp, #0x14]
	bl FUN_0200BBA0
	str r0, [sp, #0x18]
	add r0, sp, #0x1c
	bl FUN_0201D3C4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	add r1, sp, #0x1c
	movs r2, #0xa
	movs r3, #2
	bl FUN_0201D494
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022388DC @ =0x000F0D02
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	add r0, sp, #0x1c
	movs r1, #2
	str r3, [sp, #0xc]
	bl FUN_020200FC
	add r0, sp, #0x1c
	movs r1, #2
	movs r2, #0x34
	bl FUN_02013688
	movs r3, #0x9a
	lsls r3, r3, #2
	movs r1, #0xc
	adds r6, r4, #0
	muls r6, r1, r6
	adds r3, r5, r3
	movs r1, #1
	movs r2, #2
	adds r3, r3, r6
	bl FUN_02021AC8
	movs r0, #0x97
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	str r0, [sp, #0x2c]
	add r0, sp, #0x1c
	str r0, [sp, #0x30]
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r0, [r0]
	bl FUN_0200E2B0
	str r0, [sp, #0x34]
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r0, [r0]
	ldr r1, _022388E0 @ =0x00007530
	bl FUN_0200D934
	str r0, [sp, #0x38]
	movs r2, #0
	movs r0, #0x9b
	str r2, [sp, #0x3c]
	adds r1, r5, r6
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	str r0, [sp, #0x40]
	ldr r1, [sp, #0x18]
	movs r0, #2
	bl FUN_02002F30
	lsrs r1, r0, #1
	ldr r0, [sp, #0x10]
	adds r7, #0xc0
	subs r0, r0, r1
	str r0, [sp, #0x44]
	movs r0, #1
	str r0, [sp, #0x4c]
	movs r0, #0x28
	str r0, [sp, #0x50]
	movs r0, #2
	str r0, [sp, #0x54]
	movs r0, #0x34
	str r0, [sp, #0x58]
	movs r0, #0x26
	lsls r0, r0, #4
	adds r5, r5, r0
	str r7, [sp, #0x48]
	lsls r4, r4, #2
	add r0, sp, #0x2c
	bl FUN_020135D8
	str r0, [r5, r4]
	ldr r0, [r5, r4]
	ldr r1, [sp, #0x70]
	bl FUN_020138E0
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	ldr r0, [sp, #0x14]
	bl FUN_0200BB44
	add r0, sp, #0x1c
	bl FUN_0201D520
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022388DC: .4byte 0x000F0D02
_022388E0: .4byte 0x00007530
	thumb_func_end ov57_022387E0

	thumb_func_start ov57_022388E4
ov57_022388E4: @ 0x022388E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp]
	adds r3, r0, #0
	adds r5, r0, #0
	movs r0, #0x45
	lsls r0, r0, #4
_022388F8:
	adds r2, r7, r3
	adds r3, r3, #1
	strb r5, [r2, r0]
	cmp r3, #8
	blt _022388F8
	lsls r0, r1, #3
	str r0, [sp, #8]
_02238906:
	movs r6, #0
	adds r4, r7, #0
_0223890A:
	ldr r0, [r4, #8]
	adds r1, r5, #0
	bl FUN_0202CC60
	cmp r0, #0
	bne _0223891E
	adds r6, r6, #1
	adds r4, #8
	cmp r6, #0xc
	blt _0223890A
_0223891E:
	adds r1, r7, r5
	adds r1, #0x80
	ldrb r1, [r1]
	cmp r1, #0
	bne _0223892C
	cmp r0, #1
	bne _0223894E
_0223892C:
	ldr r0, [sp]
	adds r1, r0, #1
	ldr r0, [sp, #8]
	str r1, [sp]
	cmp r1, r0
	ble _0223894E
	ldr r0, [sp, #4]
	adds r2, r5, #1
	adds r1, r7, r0
	movs r0, #0x45
	lsls r0, r0, #4
	strb r2, [r1, r0]
	ldr r0, [sp, #4]
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #8
	bge _02238954
_0223894E:
	adds r5, r5, #1
	cmp r5, #0x51
	blt _02238906
_02238954:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov57_022388E4

	thumb_func_start ov57_02238958
ov57_02238958: @ 0x02238958
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r7, r0, #0
	adds r0, #0xdc
	ldr r6, [r0]
	adds r0, r7, #0
	adds r0, #0xe0
	ldr r5, [r0]
	adds r0, r7, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r4, #0
	str r0, [sp, #0x18]
_02238972:
	movs r0, #0x45
	adds r1, r7, r4
	lsls r0, r0, #4
	ldrb r0, [r1, r0]
	bl FUN_02091054
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _022389F0 @ =0x000061A8
	adds r1, r5, #0
	adds r0, r4, r0
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r2, #0x57
	bl FUN_0200D4A4
	adds r4, r4, #1
	cmp r4, #8
	blt _02238972
	movs r0, #0x57
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	ldr r0, _022389F4 @ =0x00006597
	movs r1, #3
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	adds r2, r6, #0
	adds r3, r5, #0
	bl FUN_0200D644
	movs r0, #1
	str r0, [sp]
	ldr r0, _022389F8 @ =0x0000699D
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0x57
	movs r3, #0x25
	bl FUN_0200D6D4
	movs r0, #1
	str r0, [sp]
	ldr r0, _022389FC @ =0x00006D83
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0x57
	movs r3, #0x23
	bl FUN_0200D704
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022389F0: .4byte 0x000061A8
_022389F4: .4byte 0x00006597
_022389F8: .4byte 0x0000699D
_022389FC: .4byte 0x00006D83
	thumb_func_end ov57_02238958

	thumb_func_start ov57_02238A00
ov57_02238A00: @ 0x02238A00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	adds r5, r0, #0
	adds r0, #0xdc
	ldr r0, [r0]
	movs r4, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r7, [r0]
	add r0, sp, #4
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	strh r4, [r0, #0x26]
	movs r0, #0x3c
	str r0, [sp, #0x2c]
	movs r0, #2
	str r0, [sp, #0x34]
	movs r0, #1
	str r0, [sp, #0x50]
	subs r0, r0, #2
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	ldr r0, _02238AA8 @ =0x00006597
	str r4, [sp, #0x54]
	str r0, [sp, #0x3c]
	ldr r0, _02238AAC @ =0x0000699D
	str r4, [sp, #0x30]
	str r0, [sp, #0x40]
	ldr r0, _02238AB0 @ =0x00006D83
	str r0, [sp, #0x44]
	ldr r0, _02238AB4 @ =0x00000414
	adds r6, r5, r0
_02238A44:
	ldr r0, _02238AB8 @ =0x000061A8
	adds r1, r7, #0
	adds r0, r4, r0
	str r0, [sp, #0x38]
	ldr r0, [sp]
	add r2, sp, #0x24
	bl FUN_0200D734
	adds r4, r4, #1
	stm r6!, {r0}
	cmp r4, #8
	blt _02238A44
	ldr r3, _02238ABC @ =0x0223BDD4
	add r2, sp, #4
	movs r1, #0x10
_02238A62:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _02238A62
	ldr r7, _02238AB4 @ =0x00000414
	movs r6, #0
	add r4, sp, #4
_02238A74:
	movs r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, _02238AB4 @ =0x00000414
	movs r1, #0
	subs r2, r2, #1
	lsls r2, r2, #0x10
	ldrsh r1, [r4, r1]
	ldr r0, [r5, r0]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r0, _02238AB4 @ =0x00000414
	ldr r0, [r5, r0]
	bl FUN_0200DC18
	ldr r0, [r5, r7]
	movs r1, #0
	bl FUN_0200DCC0
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #8
	blt _02238A74
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02238AA8: .4byte 0x00006597
_02238AAC: .4byte 0x0000699D
_02238AB0: .4byte 0x00006D83
_02238AB4: .4byte 0x00000414
_02238AB8: .4byte 0x000061A8
_02238ABC: .4byte 0x0223BDD4
	thumb_func_end ov57_02238A00

	thumb_func_start ov57_02238AC0
ov57_02238AC0: @ 0x02238AC0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _02238AE8 @ =0x00000414
	movs r4, #0
	adds r5, r6, #0
_02238ACA:
	adds r0, r6, #0
	adds r0, #0xe0
	ldr r1, _02238AEC @ =0x000061A8
	ldr r0, [r0]
	adds r1, r4, r1
	bl FUN_0200D958
	ldr r0, [r5, r7]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blt _02238ACA
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02238AE8: .4byte 0x00000414
_02238AEC: .4byte 0x000061A8
	thumb_func_end ov57_02238AC0

	thumb_func_start ov57_02238AF0
ov57_02238AF0: @ 0x02238AF0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x38
	muls r0, r1, r0
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	lsls r0, r1, #4
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r4, #0
_02238B06:
	movs r0, #0xd3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02238B1E
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_0200DED0
_02238B1E:
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #8
	blt _02238B06
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_02238AF0

	thumb_func_start ov57_02238B28
ov57_02238B28: @ 0x02238B28
	push {r3, lr}
	sub sp, #8
	movs r2, #2
	movs r1, #0
	ldr r0, _02238B44 @ =ov57_02238B48
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0x34
	adds r3, r1, #0
	bl FUN_02026EB4
	add sp, #8
	pop {r3, pc}
	nop
_02238B44: .4byte ov57_02238B48
	thumb_func_end ov57_02238B28

	thumb_func_start ov57_02238B48
ov57_02238B48: @ 0x02238B48
	push {r3, lr}
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r0, _02238BB4 @ =0x04000008
	movs r1, #3
	ldrh r2, [r0]
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	strh r1, [r0]
	adds r0, #0x58
	ldrh r2, [r0]
	ldr r1, _02238BB8 @ =0xFFFFCFFD
	ands r2, r1
	strh r2, [r0]
	adds r2, r1, #2
	ldrh r3, [r0]
	adds r1, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _02238BBC @ =0x0000CFFB
	ands r3, r2
	strh r3, [r0]
	ldrh r3, [r0]
	subs r2, #0x1c
	ands r3, r1
	movs r1, #8
	orrs r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	ands r1, r2
	strh r1, [r0]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	blx FUN_020CF82C
	movs r0, #0
	ldr r2, _02238BC0 @ =0x00007FFF
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r1, _02238BC4 @ =0xBFFF0000
	ldr r0, _02238BC8 @ =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_02238BB4: .4byte 0x04000008
_02238BB8: .4byte 0xFFFFCFFD
_02238BBC: .4byte 0x0000CFFB
_02238BC0: .4byte 0x00007FFF
_02238BC4: .4byte 0xBFFF0000
_02238BC8: .4byte 0x04000580
	thumb_func_end ov57_02238B48

	thumb_func_start ov57_02238BCC
ov57_02238BCC: @ 0x02238BCC
	push {r3, r4, r5, lr}
	ldr r3, _02238C04 @ =0x02110924
	movs r0, #2
	movs r1, #0
	ldr r3, [r3]
	lsls r0, r0, #0xe
	adds r2, r1, #0
	blx r3
	ldr r3, _02238C08 @ =0x0211092C
	movs r1, #0
	adds r4, r0, #0
	ldr r3, [r3]
	movs r0, #0x80
	adds r2, r1, #0
	blx r3
	adds r5, r0, #0
	cmp r4, #0
	bne _02238BF4
	bl GF_AssertFail
_02238BF4:
	cmp r5, #0
	bne _02238BFC
	bl GF_AssertFail
_02238BFC:
	bl FUN_02014DA0
	pop {r3, r4, r5, pc}
	nop
_02238C04: .4byte 0x02110924
_02238C08: .4byte 0x0211092C
	thumb_func_end ov57_02238BCC

	thumb_func_start ov57_02238C0C
ov57_02238C0C: @ 0x02238C0C
	push {r3, lr}
	bl FUN_02026E48
	bl FUN_0201543C
	cmp r0, #0
	ble _02238C22
	bl FUN_02026E48
	blx FUN_020B7350
_02238C22:
	bl FUN_02015460
	movs r0, #1
	movs r1, #0
	bl FUN_02026E50
	pop {r3, pc}
	thumb_func_end ov57_02238C0C

	thumb_func_start ov57_02238C30
ov57_02238C30: @ 0x02238C30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r7, r3, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x58]
	adds r0, r7, #0
	bl ov57_0223A0A8
	cmp r0, #3
	bhi _02238CA2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02238C50: @ jump table
	.2byte _02238C58 - _02238C50 - 2 @ case 0
	.2byte _02238C68 - _02238C50 - 2 @ case 1
	.2byte _02238C7C - _02238C50 - 2 @ case 2
	.2byte _02238C90 - _02238C50 - 2 @ case 3
_02238C58:
	movs r0, #0
	str r0, [sp, #0x18]
	movs r0, #4
	str r0, [sp, #0x1c]
	movs r0, #1
	movs r4, #6
	str r0, [sp, #0x20]
	b _02238CA2
_02238C68:
	movs r0, #2
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	movs r0, #4
	str r0, [sp, #0x20]
	movs r0, #1
	movs r4, #8
	str r0, [sp, #0x24]
	b _02238CA2
_02238C7C:
	movs r0, #3
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	movs r0, #4
	str r0, [sp, #0x20]
	movs r0, #1
	movs r4, #8
	str r0, [sp, #0x24]
	b _02238CA2
_02238C90:
	movs r0, #2
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	movs r0, #4
	str r0, [sp, #0x20]
	movs r0, #1
	movs r4, #8
	str r0, [sp, #0x24]
_02238CA2:
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	movs r1, #0x34
	str r0, [sp, #0x14]
	bl FUN_02014918
	movs r1, #0x6f
	lsls r1, r1, #2
	str r0, [r7, r1]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xb
	movs r3, #0x34
	bl FUN_0200BAF8
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	movs r6, #0
	cmp r0, #0
	ble _02238D04
	add r5, sp, #0x18
_02238CCE:
	ldr r1, [r5]
	ldr r0, [sp, #0x10]
	lsls r2, r1, #3
	ldr r1, _02238D74 @ =0x0223BECC
	ldr r1, [r1, r2]
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r2, [r5]
	movs r0, #0x6f
	lsls r3, r2, #3
	ldr r2, _02238D74 @ =0x0223BECC
	lsls r0, r0, #2
	adds r2, r2, r3
	ldr r0, [r7, r0]
	ldr r2, [r2, #4]
	adds r1, r4, #0
	bl FUN_02014980
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, [sp, #0x14]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _02238CCE
_02238D04:
	ldr r0, [sp, #0x10]
	bl FUN_0200BB44
	add r0, sp, #0x28
	movs r1, #0
	movs r2, #0x18
	blx FUN_020D4994
	ldr r2, _02238D78 @ =0x0223BD7C
	add r0, sp, #0x18
	ldrh r3, [r2]
	add r1, sp, #0x28
	strh r3, [r0, #0x10]
	ldrh r3, [r2, #2]
	strh r3, [r0, #0x12]
	ldrh r3, [r2, #4]
	strh r3, [r0, #0x14]
	ldrh r3, [r2, #6]
	strh r3, [r0, #0x16]
	ldrh r3, [r2, #8]
	ldrh r2, [r2, #0xa]
	strh r3, [r0, #0x18]
	strh r2, [r0, #0x1a]
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r2, [r7, r0]
	adds r0, #0x8c
	str r2, [sp, #0x34]
	ldr r2, [sp, #0xc]
	str r2, [sp, #0x38]
	ldr r2, [sp, #0x14]
	lsls r3, r2, #1
	strb r2, [r1, #0x14]
	adds r3, r2, r3
	movs r2, #0x17
	subs r2, r2, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #8
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	ldr r2, _02238D7C @ =0x0000040C
	ldr r0, [r7, r0]
	ldr r2, [r7, r2]
	movs r3, #0x16
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl FUN_020185FC
	movs r1, #0x93
	lsls r1, r1, #2
	str r0, [r7, r1]
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02238D74: .4byte 0x0223BECC
_02238D78: .4byte 0x0223BD7C
_02238D7C: .4byte 0x0000040C
	thumb_func_end ov57_02238C30

	thumb_func_start ov57_02238D80
ov57_02238D80: @ 0x02238D80
	push {r4, lr}
	movs r1, #0x93
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r0, #0x27
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x19
	ldr r0, _02238DA8 @ =0x0000040C
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	bl FUN_02018680
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02014950
	pop {r4, pc}
	.align 2, 0
_02238DA8: .4byte 0x0000040C
	thumb_func_end ov57_02238D80

	thumb_func_start ov57_02238DAC
ov57_02238DAC: @ 0x02238DAC
	push {r4, r5}
	lsrs r5, r0, #0x1f
	lsls r4, r0, #0x1e
	subs r4, r4, r5
	movs r3, #0x1e
	rors r4, r3
	adds r4, r5, r4
	movs r3, #0x38
	muls r3, r4, r3
	adds r3, #0x28
	strh r3, [r1]
	asrs r1, r0, #2
	movs r0, #0x35
	muls r0, r1, r0
	adds r0, #0x1b
	strh r0, [r2]
	pop {r4, r5}
	bx lr
	thumb_func_end ov57_02238DAC

	thumb_func_start ov57_02238DD0
ov57_02238DD0: @ 0x02238DD0
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r1, r0, #0
	adds r1, #0xdc
	ldr r4, [r1]
	adds r1, r0, #0
	adds r1, #0xe0
	adds r0, #0xe8
	ldr r5, [r1]
	ldr r6, [r0]
	bl FUN_02074490
	movs r1, #0x14
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0xfa
	lsls r0, r0, #6
	str r0, [sp, #0x14]
	adds r0, r6, #0
	movs r1, #2
	adds r2, r4, #0
	adds r3, r5, #0
	bl FUN_0200D644
	bl FUN_0207449C
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _02238E40 @ =0x00004268
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x14
	bl FUN_0200D6D4
	bl FUN_020744A8
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _02238E44 @ =0x00004650
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x14
	bl FUN_0200D704
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.align 2, 0
_02238E40: .4byte 0x00004268
_02238E44: .4byte 0x00004650
	thumb_func_end ov57_02238DD0

	thumb_func_start ov57_02238E48
ov57_02238E48: @ 0x02238E48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	adds r5, r0, #0
	ldr r1, [r5]
	movs r6, #0
	ldr r0, [r1]
	cmp r0, #0
	ble _02238F36
	str r6, [sp, #0xc]
	adds r4, r5, #0
_02238E5C:
	ldr r0, [sp, #0xc]
	adds r0, r1, r0
	ldr r7, [r0, #4]
	adds r0, r7, #0
	bl FUN_020741B0
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _02238F3C @ =0x00003A98
	adds r1, r5, #0
	adds r0, r6, r0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xdc
	adds r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	movs r2, #0x14
	bl FUN_0200E188
	movs r1, #0
	add r0, sp, #0x18
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	movs r0, #0xa
	str r0, [sp, #0x20]
	adds r0, r1, #0
	str r0, [sp, #0x24]
	movs r0, #1
	str r0, [sp, #0x28]
	movs r0, #2
	str r0, [sp, #0x44]
	adds r0, r1, #0
	str r0, [sp, #0x48]
	ldr r0, _02238F3C @ =0x00003A98
	add r2, sp, #0x18
	adds r0, r6, r0
	str r0, [sp, #0x2c]
	movs r0, #0xfa
	lsls r0, r0, #6
	str r0, [sp, #0x30]
	ldr r0, _02238F40 @ =0x00004268
	str r0, [sp, #0x34]
	ldr r0, _02238F44 @ =0x00004650
	str r0, [sp, #0x38]
	subs r0, r1, #1
	str r0, [sp, #0x3c]
	subs r0, r1, #1
	str r0, [sp, #0x40]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xdc
	adds r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D734
	movs r1, #0xc9
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r7, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0x10]
	adds r0, r7, #0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #0
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl FUN_02074364
	adds r1, r0, #0
	movs r0, #0xc9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl FUN_02024AA8
	movs r0, #0xc9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DC4C
	ldr r0, [sp, #0xc]
	ldr r1, [r5]
	adds r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [r1]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blt _02238E5C
_02238F36:
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_02238F3C: .4byte 0x00003A98
_02238F40: .4byte 0x00004268
_02238F44: .4byte 0x00004650
	thumb_func_end ov57_02238E48

	thumb_func_start ov57_02238F48
ov57_02238F48: @ 0x02238F48
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6]
	movs r4, #0
	ldr r0, [r0]
	cmp r0, #0
	ble _02238F70
	movs r7, #0xc9
	adds r5, r6, #0
	lsls r7, r7, #2
_02238F5C:
	ldr r0, [r5, r7]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r6]
	adds r4, r4, #1
	ldr r0, [r0]
	adds r5, r5, #4
	cmp r4, r0
	blt _02238F5C
_02238F70:
	movs r5, #0
	adds r4, r6, #0
_02238F74:
	ldr r7, [r4, #4]
	cmp r7, #0xff
	beq _02238FB8
	add r1, sp, #0
	adds r0, r5, #0
	adds r1, #2
	add r2, sp, #0
	bl ov57_02238DAC
	add r2, sp, #0
	movs r1, #2
	ldrsh r1, [r2, r1]
	adds r3, r2, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	lsls r0, r7, #2
	adds r7, r6, r0
	movs r0, #0xc9
	lsls r0, r0, #2
	subs r1, #0x10
	adds r2, #0xc
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r7, r0]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	movs r0, #0xc9
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r1, #1
	bl FUN_0200DCE8
_02238FB8:
	adds r5, r5, #1
	adds r4, #8
	cmp r5, #0xc
	blt _02238F74
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov57_02238F48

	thumb_func_start ov57_02238FC4
ov57_02238FC4: @ 0x02238FC4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6]
	movs r4, #0
	ldr r0, [r0]
	cmp r0, #0
	ble _02238FEA
	movs r7, #0xc9
	adds r5, r6, #0
	lsls r7, r7, #2
_02238FD8:
	ldr r0, [r5, r7]
	bl FUN_0200DC18
	ldr r0, [r6]
	adds r4, r4, #1
	ldr r0, [r0]
	adds r5, r5, #4
	cmp r4, r0
	blt _02238FD8
_02238FEA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_02238FC4

	thumb_func_start ov57_02238FEC
ov57_02238FEC: @ 0x02238FEC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6]
	movs r4, #0
	ldr r0, [r0]
	cmp r0, #0
	ble _02239012
	movs r7, #0xc9
	adds r5, r6, #0
	lsls r7, r7, #2
_02239000:
	ldr r0, [r5, r7]
	bl FUN_0200D9DC
	ldr r0, [r6]
	adds r4, r4, #1
	ldr r0, [r0]
	adds r5, r5, #4
	cmp r4, r0
	blt _02239000
_02239012:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_02238FEC

	thumb_func_start ov57_02239014
ov57_02239014: @ 0x02239014
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	adds r4, r7, #0
	adds r5, r7, #0
_0223901E:
	ldr r0, [r4, #8]
	bl ov57_0223A07C
	movs r1, #0x29
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #0xa3
	ldr r1, [r4, #4]
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0223904C
	movs r0, #0xa3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0xff
	beq _0223904C
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov57_0223BC4C
_0223904C:
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0xc
	cmp r6, #0xc
	blt _0223901E
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_02239014

	thumb_func_start ov57_02239058
ov57_02239058: @ 0x02239058
	push {r3, r4, r5, r6, lr}
	sub sp, #0x4c
	adds r4, r0, #0
	movs r0, #0x34
	bl FUN_0200CF18
	add r2, sp, #0x2c
	ldr r5, _022390E8 @ =0x0223BDB4
	str r0, [r4, #8]
	ldm r5!, {r0, r1}
	adds r3, r2, #0
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	ldr r6, _022390EC @ =0x0223BD88
	stm r2!, {r0, r1}
	add r5, sp, #0x18
	ldm r6!, {r0, r1}
	adds r2, r5, #0
	stm r5!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r5!, {r0, r1}
	ldr r0, [r6]
	adds r1, r3, #0
	str r0, [r5]
	ldr r0, [r4, #8]
	movs r3, #0x20
	bl FUN_0200CF70
	ldr r3, _022390F0 @ =0x0223BD9C
	add r2, sp, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4, #8]
	bl FUN_0200CF38
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	movs r2, #0x80
	bl FUN_0200CFF4
	cmp r0, #0
	bne _022390C2
	bl GF_AssertFail
_022390C2:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r2, sp, #0
	bl FUN_0200D3F8
	cmp r0, #0
	bne _022390D4
	bl GF_AssertFail
_022390D4:
	ldr r1, [r4, #0x14]
	movs r0, #0x34
	bl FUN_02018424
	movs r1, #0x5d
	lsls r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x4c
	pop {r3, r4, r5, r6, pc}
	nop
_022390E8: .4byte 0x0223BDB4
_022390EC: .4byte 0x0223BD88
_022390F0: .4byte 0x0223BD9C
	thumb_func_end ov57_02239058

	thumb_func_start ov57_022390F4
ov57_022390F4: @ 0x022390F4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02018474
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	bl FUN_0200D998
	ldr r0, [r4, #8]
	bl FUN_0200D108
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov57_022390F4

	thumb_func_start ov57_02239114
ov57_02239114: @ 0x02239114
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	adds r4, r1, #0
	str r0, [sp, #4]
	ldr r0, _02239178 @ =0x0000AFC8
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xdc
	adds r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #0
	movs r3, #0xe
	bl FUN_0200D504
	movs r0, #1
	str r0, [sp]
	ldr r0, _0223917C @ =0x0000B798
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xdc
	adds r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #0
	movs r3, #0x10
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _02239180 @ =0x0000BB80
	adds r2, r4, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xdc
	adds r5, #0xe0
	ldr r0, [r0]
	ldr r1, [r5]
	movs r3, #0xf
	bl FUN_0200D71C
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02239178: .4byte 0x0000AFC8
_0223917C: .4byte 0x0000B798
_02239180: .4byte 0x0000BB80
	thumb_func_end ov57_02239114

	thumb_func_start ov57_02239184
ov57_02239184: @ 0x02239184
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	ldr r4, _02239208 @ =0x0223BE18
	adds r6, r0, #0
	add r3, sp, #0
	movs r2, #6
_02239190:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02239190
	movs r7, #0
	add r4, sp, #0
	adds r5, r6, #0
_0223919E:
	ldr r1, [r4]
	add r0, sp, #0
	strh r1, [r0, #0x30]
	ldr r1, [r4, #4]
	add r2, sp, #0x30
	strh r1, [r0, #0x32]
	movs r1, #0
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x36]
	movs r0, #0x28
	str r0, [sp, #0x38]
	movs r0, #2
	str r0, [sp, #0x3c]
	str r0, [sp, #0x40]
	movs r0, #1
	str r0, [sp, #0x5c]
	adds r0, r1, #0
	str r0, [sp, #0x60]
	ldr r0, _0223920C @ =0x0000AFC8
	str r0, [sp, #0x44]
	ldr r0, _02239210 @ =0x00006594
	str r0, [sp, #0x48]
	ldr r0, _02239214 @ =0x0000B798
	str r0, [sp, #0x4c]
	ldr r0, _02239218 @ =0x0000BB80
	str r0, [sp, #0x50]
	subs r0, r1, #1
	str r0, [sp, #0x54]
	subs r0, r1, #1
	str r0, [sp, #0x58]
	adds r0, r6, #0
	adds r1, r6, #0
	adds r0, #0xdc
	adds r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D734
	movs r1, #0xcf
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	ldr r1, [r4, #8]
	bl FUN_0200E0C0
	adds r7, r7, #1
	adds r4, #0xc
	adds r5, r5, #4
	cmp r7, #4
	blt _0223919E
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02239208: .4byte 0x0223BE18
_0223920C: .4byte 0x0000AFC8
_02239210: .4byte 0x00006594
_02239214: .4byte 0x0000B798
_02239218: .4byte 0x0000BB80
	thumb_func_end ov57_02239184

	thumb_func_start ov57_0223921C
ov57_0223921C: @ 0x0223921C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0xd8
	ldr r0, [r0]
	cmp r0, #0
	beq _0223923C
	movs r6, #0xcf
	movs r4, #0
	lsls r6, r6, #2
_0223922E:
	ldr r0, [r5, r6]
	bl FUN_0200DC18
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0223922E
_0223923C:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov57_0223921C

	thumb_func_start ov57_02239240
ov57_02239240: @ 0x02239240
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0xcf
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	lsls r7, r7, #2
_0223924C:
	ldr r0, [r5, r7]
	adds r1, r6, #0
	bl FUN_0200DCE8
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0223924C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov57_02239240

	thumb_func_start ov57_02239260
ov57_02239260: @ 0x02239260
	push {r4, r5, r6, lr}
	movs r6, #0xcf
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_0223926A:
	ldr r0, [r5, r6]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0223926A
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov57_02239260

	thumb_func_start ov57_0223927C
ov57_0223927C: @ 0x0223927C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r2, #0
	movs r2, #1
	str r2, [sp]
	ldr r2, [sp, #0x3c]
	ldr r4, [sp, #0x48]
	str r2, [sp, #4]
	ldr r2, _022392F0 @ =0x00002AF8
	adds r5, r0, #0
	adds r2, r3, r2
	str r2, [sp, #8]
	adds r2, r4, #0
	adds r6, r1, #0
	bl FUN_0200D504
	ldr r0, [sp, #0x30]
	str r4, [sp]
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r1, [sp, #0x44]
	adds r2, r5, #0
	str r1, [sp, #0xc]
	ldr r1, [sp, #0x3c]
	adds r3, r6, #0
	str r1, [sp, #0x10]
	ldr r1, _022392F0 @ =0x00002AF8
	adds r0, r0, r1
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x40]
	adds r0, r7, #0
	bl FUN_0200D68C
	movs r0, #1
	str r0, [sp]
	ldr r3, [sp, #0x34]
	ldr r0, _022392F0 @ =0x00002AF8
	adds r1, r6, #0
	adds r0, r3, r0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r3, [sp, #0x38]
	ldr r0, _022392F0 @ =0x00002AF8
	adds r1, r6, #0
	adds r0, r3, r0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	bl FUN_0200D71C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022392F0: .4byte 0x00002AF8
	thumb_func_end ov57_0223927C

	thumb_func_start ov57_022392F4
ov57_022392F4: @ 0x022392F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	adds r5, r0, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #0x13
	str r0, [sp, #4]
	movs r0, #0x12
	adds r4, r1, #0
	str r0, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	str r1, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r5, #0
	str r4, [sp, #0x18]
	adds r0, #0xdc
	adds r1, #0xe0
	adds r2, #0xe8
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	movs r3, #0x11
	bl ov57_0223927C
	movs r0, #5
	str r0, [sp]
	movs r0, #0x22
	str r0, [sp, #4]
	movs r0, #0x21
	str r0, [sp, #8]
	movs r1, #1
	adds r2, r5, #0
	str r1, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r5, #0
	str r4, [sp, #0x18]
	adds r0, #0xdc
	adds r1, #0xe0
	adds r2, #0xe8
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	movs r3, #0x20
	bl ov57_0223927C
	movs r6, #0
	adds r4, r5, #0
	add r7, sp, #0x1c
_02239362:
	movs r0, #0
	strh r0, [r7, #8]
	strh r0, [r7, #0xa]
	strh r0, [r7, #0xc]
	movs r0, #0x29
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r1, r5, #0
	strh r0, [r7, #0xe]
	movs r0, #0x28
	subs r0, r0, r6
	str r0, [sp, #0x2c]
	movs r0, #0
	str r0, [sp, #0x30]
	movs r0, #1
	str r0, [sp, #0x34]
	movs r0, #2
	str r0, [sp, #0x50]
	movs r0, #0
	str r0, [sp, #0x54]
	ldr r0, _022394A0 @ =0x00002B09
	adds r1, #0xe0
	str r0, [sp, #0x38]
	subs r0, #0xe
	str r0, [sp, #0x3c]
	ldr r0, _022394A4 @ =0x00002B0B
	add r2, sp, #0x24
	str r0, [sp, #0x40]
	subs r0, r0, #1
	str r0, [sp, #0x44]
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D734
	movs r1, #0xa5
	lsls r1, r1, #2
	str r0, [r4, r1]
	add r1, sp, #0x20
	adds r0, r6, #0
	adds r1, #2
	add r2, sp, #0x20
	bl ov57_02238DAC
	movs r0, #0xa5
	movs r1, #6
	movs r2, #4
	lsls r0, r0, #2
	ldrsh r1, [r7, r1]
	ldrsh r2, [r7, r2]
	ldr r0, [r4, r0]
	bl FUN_0200DDB8
	adds r6, r6, #1
	adds r4, #0xc
	cmp r6, #0xc
	blt _02239362
	movs r1, #0
	add r0, sp, #0x1c
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	movs r0, #0x14
	str r0, [sp, #0x2c]
	movs r0, #1
	str r1, [sp, #0x30]
	str r1, [sp, #0x54]
	ldr r1, _022394A8 @ =0x00002B18
	str r0, [sp, #0x34]
	adds r0, r1, #0
	subs r0, #0x1b
	str r0, [sp, #0x3c]
	adds r0, r1, #2
	movs r2, #2
	str r0, [sp, #0x40]
	adds r0, r1, #1
	str r0, [sp, #0x44]
	subs r0, r2, #3
	str r1, [sp, #0x38]
	adds r1, r5, #0
	str r2, [sp, #0x50]
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	adds r0, r5, #0
	adds r0, #0xdc
	adds r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0x24
	bl FUN_0200D734
	movs r1, #0xc7
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xdc
	adds r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0x24
	bl FUN_0200D734
	movs r1, #0x32
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r1, #0xcc
	ldr r0, [r5, r1]
	add r1, sp, #0x1c
	adds r1, #2
	add r2, sp, #0x1c
	bl ov57_02238DAC
	movs r0, #0xc7
	lsls r0, r0, #2
	add r3, sp, #0x1c
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r5, r0]
	bl FUN_0200DDB8
	movs r0, #0x32
	lsls r0, r0, #4
	add r3, sp, #0x1c
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r5, r0]
	bl FUN_0200DDB8
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x19
	bl FUN_0200DD68
	movs r0, #0xc7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DC4C
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DC4C
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022394A0: .4byte 0x00002B09
_022394A4: .4byte 0x00002B0B
_022394A8: .4byte 0x00002B18
	thumb_func_end ov57_022392F4

	thumb_func_start ov57_022394AC
ov57_022394AC: @ 0x022394AC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov57_02239014
	adds r0, r5, #0
	bl ov57_02238F48
	movs r7, #0x29
	lsls r7, r7, #4
	movs r4, #0
	adds r6, r7, #4
_022394C2:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _022394CE
	ldr r1, [r5, r7]
	bl FUN_0200DC4C
_022394CE:
	adds r4, r4, #1
	adds r5, #0xc
	cmp r4, #0xc
	blt _022394C2
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_022394AC

	thumb_func_start ov57_022394D8
ov57_022394D8: @ 0x022394D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	lsls r6, r1, #3
	adds r0, r5, r6
	ldr r0, [r0, #4]
	lsls r4, r2, #3
	str r1, [sp]
	adds r1, r5, r4
	ldr r7, [r1, #4]
	cmp r0, #0xff
	beq _02239504
	adds r1, r2, #1
	str r1, [sp, #0xc]
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r0, [r0, #4]
	movs r1, #0xa2
	add r2, sp, #0xc
	bl FUN_0206EC40
_02239504:
	cmp r7, #0xff
	beq _0223951E
	ldr r0, [sp]
	add r2, sp, #8
	adds r0, r0, #1
	str r0, [sp, #8]
	ldr r1, [r5]
	lsls r0, r7, #2
	adds r0, r1, r0
	ldr r0, [r0, #4]
	movs r1, #0xa2
	bl FUN_0206EC40
_0223951E:
	adds r2, r5, #4
	ldr r1, [r2, r6]
	ldr r0, [r2, r4]
	adds r7, r5, #0
	str r0, [r2, r6]
	str r1, [r2, r4]
	adds r7, #8
	ldr r0, [r7, r6]
	add r1, sp, #0x10
	bl FUN_0202CBDC
	adds r0, r5, #0
	str r0, [sp, #4]
	adds r0, #8
	str r0, [sp, #4]
	ldr r0, [r0, r4]
	ldr r1, [r7, r6]
	bl FUN_0202CBDC
	ldr r1, [sp, #4]
	add r0, sp, #0x10
	ldr r1, [r1, r4]
	bl FUN_0202CBDC
	adds r0, r5, #0
	bl ov57_022394AC
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_022394D8

	thumb_func_start ov57_02239558
ov57_02239558: @ 0x02239558
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0xa5
	movs r4, #0
	adds r5, r7, #0
	lsls r6, r6, #2
_02239564:
	ldr r0, [r5, r6]
	bl FUN_0200DC18
	adds r4, r4, #1
	adds r5, #0xc
	cmp r4, #0xc
	blt _02239564
	movs r0, #0xc7
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_0200DC18
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r0, [r7, r0]
	bl FUN_0200DC18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_02239558

	thumb_func_start ov57_02239588
ov57_02239588: @ 0x02239588
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0xa5
	movs r4, #0
	adds r5, r7, #0
	lsls r6, r6, #2
_02239594:
	ldr r0, [r5, r6]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, #0xc
	cmp r4, #0xc
	blt _02239594
	movs r0, #0xc7
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_0200D9DC
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r0, [r7, r0]
	bl FUN_0200D9DC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_02239588

	thumb_func_start ov57_022395B8
ov57_022395B8: @ 0x022395B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	movs r0, #0x34
	str r1, [sp, #0x10]
	str r0, [sp]
	movs r0, #0x57
	movs r1, #8
	movs r2, #1
	add r3, sp, #0x18
	bl FUN_020079BC
	ldr r1, [sp, #0x18]
	str r0, [sp, #0x14]
	ldr r7, [r1, #0x14]
	ldr r1, [r1, #0x10]
	adds r0, r7, #0
	blx DC_FlushRange
	ldr r5, _0223966C @ =0x0223BDF4
	movs r4, #0
_022395E2:
	adds r0, r4, #1
	str r0, [sp]
	ldr r2, [r5]
	adds r0, r6, #0
	lsls r2, r2, #5
	movs r1, #1
	adds r2, r7, r2
	movs r3, #0x20
	bl FUN_0201C0C0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #9
	blo _022395E2
	ldr r0, [sp, #0x14]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [sp]
	movs r1, #0x20
	str r1, [sp, #4]
	movs r0, #0xc0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	movs r1, #0x57
	movs r2, #2
	movs r3, #0x34
	bl FUN_0200319C
	movs r0, #0
	str r0, [sp]
	movs r0, #0x34
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #0xd
	bl FUN_0200E3DC
	bl FUN_0200E3D8
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xd0
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	movs r1, #0x26
	movs r3, #0x34
	bl FUN_02003200
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xe0
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	movs r1, #0x10
	movs r2, #8
	movs r3, #0x34
	bl FUN_02003200
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223966C: .4byte 0x0223BDF4
	thumb_func_end ov57_022395B8

	thumb_func_start ov57_02239670
ov57_02239670: @ 0x02239670
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r2, #0
	adds r4, r1, #0
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #0x34
	str r1, [sp, #4]
	movs r1, #4
	movs r2, #1
	movs r3, #0xf
	adds r5, r0, #0
	bl FUN_0200E644
	adds r0, r6, #0
	bl FUN_0200E640
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xc0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x26
	movs r3, #0x34
	bl FUN_02003200
	movs r0, #0
	str r0, [sp]
	movs r0, #0x34
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #4
	movs r2, #0x1f
	movs r3, #0xd
	bl FUN_0200E3DC
	bl FUN_0200E3D8
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xd0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x26
	movs r3, #0x34
	bl FUN_02003200
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xe0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #8
	movs r3, #0x34
	bl FUN_02003200
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x30
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #8
	movs r3, #0x34
	bl FUN_02003200
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xb0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x57
	movs r2, #0
	movs r3, #0x34
	bl FUN_02003200
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov57_02239670

	thumb_func_start ov57_02239728
ov57_02239728: @ 0x02239728
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r3, #0
	beq _0223974E
	cmp r1, #0
	bne _02239744
	movs r1, #1
	adds r2, r1, #0
	movs r3, #0xc
	bl FUN_0200E580
	b _0223974E
_02239744:
	movs r1, #1
	adds r2, r1, #0
	movs r3, #0xc
	bl FUN_0200E998
_0223974E:
	ldr r0, _022397AC @ =0x0000FFFF
	cmp r5, r0
	bne _02239766
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02239766:
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xb
	movs r3, #0x34
	bl FUN_0200BAF8
	adds r1, r5, #0
	adds r6, r0, #0
	bl FUN_0200BBA0
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r0, r4, #0
	adds r2, r5, #0
	adds r3, r1, #0
	str r1, [sp, #8]
	bl FUN_020200A8
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_0200BB44
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_022397AC: .4byte 0x0000FFFF
	thumb_func_end ov57_02239728

	thumb_func_start ov57_022397B0
ov57_022397B0: @ 0x022397B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r1, #0
	adds r7, r0, #0
	adds r0, r5, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl FUN_0201D3C4
	ldr r0, [sp, #0x28]
	lsls r2, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	lsls r3, r6, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	adds r1, r5, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	lsrs r2, r2, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r7, #0
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #0xc
	bl FUN_0200E998
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov57_022397B0

	thumb_func_start ov57_02239814
ov57_02239814: @ 0x02239814
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r1, #0
	adds r7, r0, #0
	adds r0, r5, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl FUN_0201D3C4
	ldr r0, [sp, #0x28]
	lsls r2, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	lsls r3, r6, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	adds r1, r5, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	lsrs r2, r2, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r7, #0
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0201D978
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov57_02239814

	thumb_func_start ov57_02239868
ov57_02239868: @ 0x02239868
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r1, #0
	adds r7, r0, #0
	adds r0, r5, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl FUN_0201D3C4
	ldr r0, [sp, #0x28]
	lsls r2, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	lsls r3, r6, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	adds r1, r5, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	lsrs r2, r2, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r7, #0
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov57_02239868

	thumb_func_start ov57_022398C4
ov57_022398C4: @ 0x022398C4
	push {r3, r4, lr}
	sub sp, #0x14
	movs r1, #2
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0xa6
	str r1, [sp, #0xc]
	movs r0, #0xb
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r0, #0xe4
	adds r1, #0x96
	ldr r0, [r0]
	adds r1, r4, r1
	movs r2, #6
	movs r3, #3
	bl ov57_02239868
	movs r1, #2
	str r1, [sp]
	movs r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0xae
	str r1, [sp, #0xc]
	movs r0, #0xb
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r0, #0xe4
	adds r1, #0x9e
	ldr r0, [r0]
	adds r1, r4, r1
	movs r2, #6
	movs r3, #0xa
	bl ov57_02239868
	movs r0, #5
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r1, #0xb6
	str r1, [sp, #0xc]
	movs r0, #0xb
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r0, #0xe4
	adds r1, #0xa6
	ldr r0, [r0]
	adds r1, r4, r1
	movs r2, #6
	movs r3, #3
	bl ov57_02239868
	movs r0, #5
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r1, #0xbe
	str r1, [sp, #0xc]
	movs r0, #0xb
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r0, #0xe4
	adds r1, #0xae
	ldr r0, [r0]
	adds r1, r4, r1
	movs r2, #6
	movs r3, #0xa
	bl ov57_02239868
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r1, #0xc6
	str r1, [sp, #0xc]
	movs r0, #0xb
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r0, #0xe4
	adds r1, #0xb6
	ldr r0, [r0]
	adds r1, r4, r1
	movs r2, #6
	movs r3, #3
	bl ov57_02239868
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r1, #0xce
	str r1, [sp, #0xc]
	movs r0, #0xb
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r0, #0xe4
	adds r1, #0xbe
	ldr r0, [r0]
	adds r1, r4, r1
	movs r2, #6
	movs r3, #0xa
	bl ov57_02239868
	movs r2, #0xb
	str r2, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r1, #0xd6
	str r1, [sp, #0xc]
	adds r0, r4, #0
	str r2, [sp, #0x10]
	adds r0, #0xe4
	adds r1, #0xc6
	ldr r0, [r0]
	adds r1, r4, r1
	movs r2, #6
	movs r3, #3
	bl ov57_02239868
	movs r2, #0xb
	str r2, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r1, #0xde
	str r1, [sp, #0xc]
	adds r0, r4, #0
	str r2, [sp, #0x10]
	adds r0, #0xe4
	adds r1, #0xce
	ldr r0, [r0]
	adds r1, r4, r1
	movs r2, #6
	movs r3, #0xa
	bl ov57_02239868
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov57_022398C4

	thumb_func_start ov57_022399F8
ov57_022399F8: @ 0x022399F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	adds r5, r7, #0
	adds r5, #0xec
	movs r6, #5
	adds r5, #0x50
_02239A06:
	ldr r0, _02239A84 @ =0x0000044B
	adds r1, r7, r6
	ldrb r0, [r1, r0]
	str r0, [sp, #0x10]
	cmp r0, #0
	bne _02239A22
	adds r0, r5, #0
	movs r1, #0xee
	bl FUN_0201D978
	adds r0, r5, #0
	bl FUN_0201D5C8
	b _02239A76
_02239A22:
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x64
	movs r1, #0x34
	bl FUN_02026354
	ldr r1, [sp, #0x10]
	adds r4, r0, #0
	ldr r0, [r7, #0x64]
	subs r1, r1, #1
	bl FUN_0202CC5C
	adds r1, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #3
	movs r3, #1
	bl FUN_02026464
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02239A88 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #7
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r4, #0
	bl FUN_02026380
_02239A76:
	adds r6, r6, #1
	adds r5, #0x10
	cmp r6, #0xd
	blt _02239A06
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02239A84: .4byte 0x0000044B
_02239A88: .4byte 0x00010200
	thumb_func_end ov57_022399F8

	thumb_func_start ov57_02239A8C
ov57_02239A8C: @ 0x02239A8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	adds r0, r1, #5
	lsls r4, r0, #4
	movs r0, #0x45
	adds r1, r6, r1
	lsls r0, r0, #4
	adds r5, r6, #0
	ldrb r7, [r1, r0]
	adds r5, #0xec
	cmp r7, #0
	bne _02239AB8
	adds r0, r5, r4
	movs r1, #0xee
	bl FUN_0201D978
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02239AB8:
	adds r0, r5, r4
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x64
	movs r1, #0x34
	bl FUN_02026354
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x64]
	subs r1, r7, #1
	bl FUN_0202CC5C
	adds r1, r0, #0
	movs r3, #1
	ldr r0, [sp, #0x10]
	movs r2, #3
	str r3, [sp]
	bl FUN_02026464
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02239B08 @ =0x00010200
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	adds r0, r5, r4
	movs r3, #7
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, r4
	bl FUN_0201D5C8
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02239B08: .4byte 0x00010200
	thumb_func_end ov57_02239A8C

	thumb_func_start ov57_02239B0C
ov57_02239B0C: @ 0x02239B0C
	push {r3, r4, r5, lr}
	adds r0, #0xec
	adds r5, r0, #0
	movs r4, #5
	adds r5, #0x50
_02239B16:
	adds r0, r5, #0
	bl FUN_0201D8E4
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0xd
	blt _02239B16
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_02239B0C

	thumb_func_start ov57_02239B2C
ov57_02239B2C: @ 0x02239B2C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r1, #0
	ldr r1, _02239B90 @ =0x0000FFFF
	adds r4, r0, #0
	cmp r5, r1
	bne _02239B4A
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02239B4A:
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xf
	movs r3, #0x34
	bl FUN_0200BAF8
	adds r1, r5, #0
	adds r6, r0, #0
	bl FUN_0200BBA0
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r0, r4, #0
	adds r2, r5, #0
	adds r3, r1, #0
	str r1, [sp, #8]
	bl FUN_020200A8
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_0200BB44
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02239B90: .4byte 0x0000FFFF
	thumb_func_end ov57_02239B2C

	thumb_func_start ov57_02239B94
ov57_02239B94: @ 0x02239B94
	push {r3, lr}
	bl FUN_02022D24
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	pop {r3, pc}
	thumb_func_end ov57_02239B94

	thumb_func_start ov57_02239BAC
ov57_02239BAC: @ 0x02239BAC
	push {lr}
	sub sp, #0xc
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x34
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov57_02239BAC

	thumb_func_start ov57_02239BCC
ov57_02239BCC: @ 0x02239BCC
	push {lr}
	sub sp, #0xc
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x34
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	add sp, #0xc
	pop {pc}
	thumb_func_end ov57_02239BCC

	thumb_func_start ov57_02239BEC
ov57_02239BEC: @ 0x02239BEC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x34
	adds r2, r5, #0
	adds r4, r1, #0
	str r0, [sp, #0xc]
	adds r2, #0xe4
	ldr r2, [r2]
	adds r0, r4, #0
	movs r1, #8
	movs r3, #2
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x34
	adds r2, r5, #0
	str r0, [sp, #0xc]
	adds r2, #0xe4
	ldr r2, [r2]
	adds r0, r4, #0
	movs r1, #0xc
	movs r3, #2
	bl FUN_02007B68
	movs r1, #0
	str r1, [sp]
	movs r0, #0x60
	str r0, [sp, #4]
	adds r0, r5, #0
	str r1, [sp, #8]
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0x57
	movs r2, #2
	movs r3, #0x34
	bl FUN_02003200
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x34
	adds r2, r5, #0
	str r0, [sp, #0xc]
	adds r2, #0xe4
	ldr r2, [r2]
	adds r0, r4, #0
	movs r1, #9
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x34
	str r0, [sp, #0xc]
	adds r5, #0xe4
	ldr r2, [r5]
	adds r0, r4, #0
	movs r1, #0xd
	movs r3, #3
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_02239BEC

	thumb_func_start ov57_02239C88
ov57_02239C88: @ 0x02239C88
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x34
	adds r2, r5, #0
	adds r4, r1, #0
	str r0, [sp, #0xc]
	adds r2, #0xe4
	ldr r2, [r2]
	adds r0, r4, #0
	movs r1, #7
	movs r3, #5
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x34
	adds r2, r5, #0
	str r0, [sp, #0xc]
	adds r2, #0xe4
	ldr r2, [r2]
	adds r0, r4, #0
	movs r1, #0xb
	movs r3, #5
	bl FUN_02007B68
	movs r2, #1
	str r2, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	movs r0, #0
	adds r5, #0xe8
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0x57
	movs r3, #0x34
	bl FUN_02003200
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_02239C88

	thumb_func_start ov57_02239CE8
ov57_02239CE8: @ 0x02239CE8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x34
	adds r2, r5, #0
	adds r4, r1, #0
	str r0, [sp, #0xc]
	adds r2, #0xe4
	movs r1, #7
	ldr r2, [r2]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x34
	adds r2, r5, #0
	str r0, [sp, #0xc]
	adds r2, #0xe4
	ldr r2, [r2]
	adds r0, r4, #0
	movs r1, #0xa
	movs r3, #7
	bl FUN_02007B68
	movs r2, #1
	str r2, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	movs r0, #0
	adds r5, #0xe8
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0x57
	movs r3, #0x34
	bl FUN_02003200
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_02239CE8

	thumb_func_start ov57_02239D48
ov57_02239D48: @ 0x02239D48
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r5, r1, #0
	adds r1, r0, #0
	adds r1, #0xdc
	ldr r6, [r1]
	adds r1, r0, #0
	adds r1, #0xe0
	ldr r4, [r1]
	movs r1, #4
	str r5, [sp]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #3
	str r1, [sp, #0xc]
	movs r2, #2
	str r2, [sp, #0x10]
	ldr r2, _02239E80 @ =0x00006594
	adds r0, #0xe8
	str r2, [sp, #0x14]
	ldr r0, [r0]
	adds r2, r6, #0
	adds r3, r4, #0
	bl FUN_0200D68C
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _02239E84 @ =0x000061C2
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r5, #0
	movs r3, #0x1a
	bl FUN_0200D504
	movs r0, #1
	str r0, [sp]
	ldr r0, _02239E88 @ =0x00006994
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r5, #0
	movs r3, #0x1c
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _02239E8C @ =0x00006D7B
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r5, #0
	movs r3, #0x1b
	bl FUN_0200D71C
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _02239E90 @ =0x000061C5
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r5, #0
	movs r3, #0x1d
	bl FUN_0200D504
	movs r0, #1
	str r0, [sp]
	ldr r0, _02239E94 @ =0x00006997
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r5, #0
	movs r3, #0x1f
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _02239E98 @ =0x00006D7E
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r5, #0
	movs r3, #0x1e
	bl FUN_0200D71C
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _02239E9C @ =0x000061BC
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r5, #0
	movs r3, #0x14
	bl FUN_0200D504
	movs r0, #1
	str r0, [sp]
	ldr r0, _02239EA0 @ =0x0000698E
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r5, #0
	movs r3, #0x16
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _02239EA4 @ =0x00006D75
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r5, #0
	movs r3, #0x15
	bl FUN_0200D71C
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _02239EA8 @ =0x000088CF
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r5, #0
	movs r3, #0x17
	bl FUN_0200D504
	movs r0, #1
	str r0, [sp]
	ldr r0, _02239EAC @ =0x00006991
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r5, #0
	movs r3, #0x19
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _02239EB0 @ =0x00006D78
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r5, #0
	movs r3, #0x18
	bl FUN_0200D71C
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.align 2, 0
_02239E80: .4byte 0x00006594
_02239E84: .4byte 0x000061C2
_02239E88: .4byte 0x00006994
_02239E8C: .4byte 0x00006D7B
_02239E90: .4byte 0x000061C5
_02239E94: .4byte 0x00006997
_02239E98: .4byte 0x00006D7E
_02239E9C: .4byte 0x000061BC
_02239EA0: .4byte 0x0000698E
_02239EA4: .4byte 0x00006D75
_02239EA8: .4byte 0x000088CF
_02239EAC: .4byte 0x00006991
_02239EB0: .4byte 0x00006D78
	thumb_func_end ov57_02239D48

	thumb_func_start ov57_02239EB4
ov57_02239EB4: @ 0x02239EB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xa0
	adds r7, r0, #0
	adds r0, #0xdc
	ldr r6, [r0]
	adds r0, r7, #0
	adds r0, #0xe0
	ldr r5, [r0]
	ldr r0, _02239FF4 @ =0x00000414
	movs r1, #0
	add r2, sp, #0x6c
	strh r1, [r2]
	strh r1, [r2, #2]
	strh r1, [r2, #4]
	adds r4, r7, r0
	strh r1, [r2, #6]
	movs r0, #0x3c
	str r0, [sp, #0x74]
	movs r0, #2
	str r0, [sp, #0x7c]
	movs r0, #1
	str r1, [sp, #0x9c]
	subs r1, r0, #2
	str r0, [sp, #0x98]
	str r0, [sp, #0x78]
	ldr r0, _02239FF8 @ =0x000061C2
	str r1, [sp, #0x90]
	str r0, [sp, #0x80]
	ldr r0, _02239FFC @ =0x00006594
	str r1, [sp, #0x94]
	str r0, [sp, #0x84]
	ldr r0, _0223A000 @ =0x00006994
	adds r1, r5, #0
	str r0, [sp, #0x88]
	ldr r0, _0223A004 @ =0x00006D7B
	str r0, [sp, #0x8c]
	adds r0, r6, #0
	bl FUN_0200D734
	str r0, [r4, #0x20]
	ldr r0, _0223A008 @ =0x000061C5
	adds r1, r5, #0
	str r0, [sp, #0x80]
	ldr r0, _02239FFC @ =0x00006594
	add r2, sp, #0x6c
	str r0, [sp, #0x84]
	ldr r0, _0223A00C @ =0x00006997
	str r0, [sp, #0x88]
	ldr r0, _0223A010 @ =0x00006D7E
	str r0, [sp, #0x8c]
	adds r0, r6, #0
	bl FUN_0200D734
	str r0, [r4, #0x24]
	movs r0, #1
	str r0, [sp, #0x98]
	str r0, [sp, #0x78]
	ldr r0, _0223A014 @ =0x000088CF
	adds r1, r5, #0
	str r0, [sp, #0x80]
	ldr r0, _02239FFC @ =0x00006594
	add r2, sp, #0x6c
	str r0, [sp, #0x84]
	ldr r0, _0223A018 @ =0x00006991
	str r0, [sp, #0x88]
	ldr r0, _0223A01C @ =0x00006D78
	str r0, [sp, #0x8c]
	adds r0, r6, #0
	bl FUN_0200D734
	str r0, [r4, #0x28]
	movs r0, #1
	str r0, [sp, #0x98]
	movs r0, #0
	str r0, [sp, #0x78]
	ldr r0, _0223A020 @ =0x000061BC
	adds r1, r5, #0
	str r0, [sp, #0x80]
	ldr r0, _02239FFC @ =0x00006594
	add r2, sp, #0x6c
	str r0, [sp, #0x84]
	ldr r0, _0223A024 @ =0x0000698E
	str r0, [sp, #0x88]
	ldr r0, _0223A028 @ =0x00006D75
	str r0, [sp, #0x8c]
	adds r0, r6, #0
	bl FUN_0200D734
	str r0, [r4, #0x2c]
	adds r0, r6, #0
	adds r1, r5, #0
	add r2, sp, #0x6c
	bl FUN_0200D734
	ldr r3, _0223A02C @ =0x0223BE48
	str r0, [r4, #0x30]
	add r2, sp, #0x38
	movs r1, #0x1a
_02239F78:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _02239F78
	ldr r3, _0223A030 @ =0x0223BE7C
	add r2, sp, #4
	movs r1, #0x1a
_02239F8A:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _02239F8A
	movs r0, #8
	str r0, [sp]
	movs r0, #0x1f
	adds r4, r7, #0
	lsls r0, r0, #4
	adds r7, r7, r0
	add r6, sp, #0x58
	adds r4, #0x20
	add r5, sp, #0x24
	adds r7, #0x20
_02239FAA:
	ldr r0, _02239FF4 @ =0x00000414
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r4, r0]
	bl FUN_0200DDB8
	ldr r0, _02239FF4 @ =0x00000414
	ldr r0, [r4, r0]
	bl FUN_0200DC18
	ldr r0, _02239FF4 @ =0x00000414
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0200DCC0
	ldr r1, _02239FF4 @ =0x00000414
	movs r2, #0
	movs r3, #2
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	ldr r1, [r4, r1]
	adds r0, r7, #0
	bl ov57_022385A4
	ldr r0, [sp]
	adds r6, r6, #4
	adds r0, r0, #1
	adds r4, r4, #4
	adds r5, r5, #4
	adds r7, r7, #4
	str r0, [sp]
	cmp r0, #0xd
	blt _02239FAA
	add sp, #0xa0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02239FF4: .4byte 0x00000414
_02239FF8: .4byte 0x000061C2
_02239FFC: .4byte 0x00006594
_0223A000: .4byte 0x00006994
_0223A004: .4byte 0x00006D7B
_0223A008: .4byte 0x000061C5
_0223A00C: .4byte 0x00006997
_0223A010: .4byte 0x00006D7E
_0223A014: .4byte 0x000088CF
_0223A018: .4byte 0x00006991
_0223A01C: .4byte 0x00006D78
_0223A020: .4byte 0x000061BC
_0223A024: .4byte 0x0000698E
_0223A028: .4byte 0x00006D75
_0223A02C: .4byte 0x0223BE48
_0223A030: .4byte 0x0223BE7C
	thumb_func_end ov57_02239EB4

	thumb_func_start ov57_0223A034
ov57_0223A034: @ 0x0223A034
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _0223A054 @ =0x00000414
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
_0223A03E:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223A04A
	adds r1, r6, #0
	bl FUN_0200DCE8
_0223A04A:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xd
	blt _0223A03E
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223A054: .4byte 0x00000414
	thumb_func_end ov57_0223A034

	thumb_func_start ov57_0223A058
ov57_0223A058: @ 0x0223A058
	bx lr
	.align 2, 0
	thumb_func_end ov57_0223A058

	thumb_func_start ov57_0223A05C
ov57_0223A05C: @ 0x0223A05C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0223A078 @ =0x00000414
	movs r4, #8
	adds r5, #0x20
_0223A066:
	ldr r0, [r5, r6]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xd
	blt _0223A066
	pop {r4, r5, r6, pc}
	nop
_0223A078: .4byte 0x00000414
	thumb_func_end ov57_0223A05C

	thumb_func_start ov57_0223A07C
ov57_0223A07C: @ 0x0223A07C
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0
	adds r6, r0, #0
	adds r5, r7, #0
	adds r4, r7, #0
_0223A086:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0202CC30
	bl FUN_0202CC48
	cmp r0, #0
	beq _0223A098
	adds r5, r5, #1
_0223A098:
	adds r4, r4, #1
	cmp r4, #8
	blt _0223A086
	cmp r5, #0
	beq _0223A0A4
	movs r7, #1
_0223A0A4:
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_0223A07C

	thumb_func_start ov57_0223A0A8
ov57_0223A0A8: @ 0x0223A0A8
	movs r2, #0xc
	muls r2, r1, r2
	adds r1, r0, r2
	movs r0, #0xa3
	lsls r0, r0, #2
	ldr r2, [r1, r0]
	adds r0, r0, #4
	ldr r0, [r1, r0]
	cmp r2, #0xff
	bne _0223A0C4
	cmp r0, #0
	bne _0223A0C4
	movs r0, #0
	bx lr
_0223A0C4:
	cmp r2, #0xff
	bne _0223A0D0
	cmp r0, #1
	bne _0223A0D0
	movs r0, #1
	bx lr
_0223A0D0:
	cmp r2, #0xff
	beq _0223A0DC
	cmp r0, #1
	bne _0223A0DC
	movs r0, #2
	bx lr
_0223A0DC:
	movs r0, #3
	bx lr
	thumb_func_end ov57_0223A0A8

	thumb_func_start ov57_0223A0E0
ov57_0223A0E0: @ 0x0223A0E0
	push {r3, r4, r5, lr}
	movs r1, #0xfd
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	lsls r2, r1, #2
	ldr r1, _0223A100 @ =0x0223BEB8
	ldr r1, [r1, r2]
	blx r1
	adds r4, #0xe0
	adds r5, r0, #0
	ldr r0, [r4]
	bl FUN_0200D020
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223A100: .4byte 0x0223BEB8
	thumb_func_end ov57_0223A0E0

	thumb_func_start ov57_0223A104
ov57_0223A104: @ 0x0223A104
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #6
	bls _0223A114
	b _0223A300
_0223A114:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223A120: @ jump table
	.2byte _0223A12E - _0223A120 - 2 @ case 0
	.2byte _0223A226 - _0223A120 - 2 @ case 1
	.2byte _0223A236 - _0223A120 - 2 @ case 2
	.2byte _0223A248 - _0223A120 - 2 @ case 3
	.2byte _0223A256 - _0223A120 - 2 @ case 4
	.2byte _0223A2C0 - _0223A120 - 2 @ case 5
	.2byte _0223A2D0 - _0223A120 - 2 @ case 6
_0223A12E:
	movs r0, #0x57
	movs r1, #0x34
	bl FUN_02007688
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov57_02238DD0
	adds r0, r4, #0
	bl ov57_02238E48
	adds r0, r4, #0
	bl ov57_02238F48
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_02239BEC
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_02239C88
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_02239CE8
	adds r0, r4, #0
	bl ov57_02239014
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_022392F4
	adds r0, r4, #0
	bl ov57_022385DC
	adds r0, r4, #0
	bl ov57_02237F3C
	adds r0, r4, #0
	movs r1, #1
	bl ov57_022383D0
	adds r0, r4, #0
	bl ov57_02237F14
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_02239D48
	adds r0, r4, #0
	bl ov57_02239EB4
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_02239114
	adds r0, r4, #0
	bl ov57_02239184
	adds r0, r4, #0
	bl ov57_0223B75C
	adds r0, r4, #0
	bl ov57_0223B78C
	ldr r1, _0223A310 @ =0x00000448
	adds r0, r4, #0
	ldr r1, [r4, r1]
	bl ov57_022388E4
	adds r0, r4, #0
	bl ov57_02238958
	adds r0, r4, #0
	bl ov57_02238A00
	adds r0, r4, #0
	movs r1, #0
	bl ov57_0223A034
	adds r0, r4, #0
	movs r1, #0
	bl ov57_02239240
	adds r0, r4, #0
	bl ov57_02238794
	adds r0, r4, #0
	movs r1, #0
	bl ov57_022387C0
	movs r0, #0x47
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #3
	movs r2, #7
	movs r3, #0
	bl ov57_02239728
	bl ov57_02239B94
	adds r0, r4, #0
	movs r1, #0
	bl ov57_0223B948
	adds r0, r4, #0
	movs r1, #1
	bl ov57_0223866C
	ldr r2, _0223A314 @ =0x04000304
	ldr r0, _0223A318 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	adds r0, r5, #0
	bl FUN_0200770C
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223A300
_0223A226:
	bl ov57_02239BAC
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223A300
_0223A236:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223A300
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_0223A248:
	adds r0, r4, #0
	bl ov57_0223B180
	movs r1, #0xff
	lsls r1, r1, #2
	str r0, [r4, r1]
	b _0223A300
_0223A256:
	movs r0, #0x93
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020186A4
	adds r1, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r1, r0
	beq _0223A272
	adds r0, r0, #1
	cmp r1, r0
	beq _0223A300
	b _0223A292
_0223A272:
	adds r0, r4, #0
	bl ov57_0223B700
	movs r0, #0x47
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #3
	movs r2, #7
	movs r3, #0
	bl ov57_02239728
	movs r0, #0xff
	movs r1, #3
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0223A300
_0223A292:
	cmp r1, #0
	beq _0223A300
	adds r0, r4, #0
	blx r1
	cmp r0, #1
	beq _0223A2A6
	adds r0, r4, #0
	bl ov57_0223B700
	b _0223A300
_0223A2A6:
	movs r0, #0x47
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #3
	movs r2, #7
	movs r3, #0
	bl ov57_02239728
	movs r0, #0xff
	movs r1, #3
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0223A300
_0223A2C0:
	bl ov57_02239BCC
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223A300
_0223A2D0:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223A300
	adds r0, r4, #0
	bl ov57_0223864C
	adds r0, r4, #0
	bl ov57_02239588
	adds r0, r4, #0
	bl ov57_02238FEC
	adds r0, r4, #0
	bl ov57_0223A05C
	adds r0, r4, #0
	bl ov57_02239260
	adds r0, r4, #0
	bl ov57_02238AC0
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223A300:
	adds r0, r4, #0
	bl ov57_02238FC4
	adds r0, r4, #0
	bl ov57_02239558
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223A310: .4byte 0x00000448
_0223A314: .4byte 0x04000304
_0223A318: .4byte 0xFFFF7FFF
	thumb_func_end ov57_0223A104

	thumb_func_start ov57_0223A31C
ov57_0223A31C: @ 0x0223A31C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r1, #0xff
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0xb
	bhi _0223A406
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223A338: @ jump table
	.2byte _0223A350 - _0223A338 - 2 @ case 0
	.2byte _0223A406 - _0223A338 - 2 @ case 1
	.2byte _0223A406 - _0223A338 - 2 @ case 2
	.2byte _0223A406 - _0223A338 - 2 @ case 3
	.2byte _0223A35C - _0223A338 - 2 @ case 4
	.2byte _0223A368 - _0223A338 - 2 @ case 5
	.2byte _0223A374 - _0223A338 - 2 @ case 6
	.2byte _0223A3EC - _0223A338 - 2 @ case 7
	.2byte _0223A406 - _0223A338 - 2 @ case 8
	.2byte _0223A406 - _0223A338 - 2 @ case 9
	.2byte _0223A406 - _0223A338 - 2 @ case 10
	.2byte _0223A3F8 - _0223A338 - 2 @ case 11
_0223A350:
	bl ov57_0223A6B8
	movs r1, #0xff
	lsls r1, r1, #2
	str r0, [r4, r1]
	b _0223A406
_0223A35C:
	bl ov57_0223B620
	movs r1, #0xff
	lsls r1, r1, #2
	str r0, [r4, r1]
	b _0223A406
_0223A368:
	bl ov57_0223AB58
	movs r1, #0xff
	lsls r1, r1, #2
	str r0, [r4, r1]
	b _0223A406
_0223A374:
	movs r1, #0
	adds r0, #0xec
	movs r2, #0xc
	adds r3, r1, #0
	bl ov57_02239728
	movs r0, #0x41
	movs r1, #0x14
	lsls r0, r0, #4
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov57_022384C0
	cmp r0, #1
	bne _0223A39A
	movs r0, #0xa2
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
_0223A39A:
	adds r0, r4, #0
	bl ov57_0223853C
	adds r0, r4, #0
	bl ov57_022394AC
	ldr r0, [r4]
	ldr r0, [r0, #0x28]
	bl FUN_0202CF54
	movs r1, #7
	bl FUN_0202D1C0
	movs r0, #0xfb
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r2, r4, r0
	movs r0, #0xa3
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	cmp r0, #0xff
	beq _0223A3E2
	ldr r2, [r4]
	lsls r0, r0, #2
	adds r0, r2, r0
	ldr r5, [r0, #4]
	ldr r0, [r2, #0x20]
	bl FUN_0202CBF4
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0xab
	bl FUN_0206EC40
_0223A3E2:
	movs r0, #0xff
	movs r1, #0xb
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0223A406
_0223A3EC:
	bl ov57_0223A8FC
	movs r1, #0xff
	lsls r1, r1, #2
	str r0, [r4, r1]
	b _0223A406
_0223A3F8:
	bl ov57_0223A7DC
	cmp r0, #0
	beq _0223A406
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223A406:
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #4
	beq _0223A414
	cmp r0, #0
	bne _0223A4DE
_0223A414:
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r5, [r0]
	cmp r5, #0xff
	bne _0223A42A
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026CC4
	b _0223A4DE
_0223A42A:
	add r0, sp, #4
	add r1, sp, #0
	bl FUN_02025364
	movs r1, #0xff
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #4
	beq _0223A43E
	movs r0, #0
_0223A43E:
	cmp r0, #0
	beq _0223A484
	lsls r6, r5, #4
	movs r0, #0x35
	adds r1, r4, r6
	lsls r0, r0, #4
	ldrb r0, [r1, r0]
	bl FUN_0209106C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xec
	bl ov57_02239B2C
	movs r0, #0xd5
	ldr r2, [sp]
	adds r1, r4, r6
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, [sp, #4]
	lsls r2, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_0223848C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_02238508
	b _0223A4DE
_0223A484:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_022383F8
	lsls r6, r5, #4
	movs r2, #0xd6
	adds r1, r4, r6
	lsls r2, r2, #2
	adds r7, r0, #0
	ldr r0, [r1, r2]
	subs r2, r2, #4
	ldr r1, [r1, r2]
	movs r2, #0
	bl ov57_02237EB8
	cmp r7, #0
	bne _0223A4C6
	movs r1, #0x35
	ldr r0, [r4]
	adds r2, r4, r6
	lsls r1, r1, #4
	ldrb r1, [r2, r1]
	ldr r0, [r0, #0x20]
	movs r2, #1
	bl FUN_0202CCEC
	adds r0, r4, #0
	bl ov57_022399F8
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_02238438
_0223A4C6:
	ldr r0, _0223A4FC @ =0x000005EA
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xff
	adds r0, #0xd4
	str r1, [r0]
	adds r0, r4, #0
	ldr r1, _0223A500 @ =0x0000FFFF
	adds r0, #0xec
	bl ov57_02239B2C
_0223A4DE:
	adds r0, r4, #0
	bl ov57_0223A058
	adds r0, r4, #0
	bl ov57_0223921C
	adds r0, r4, #0
	bl ov57_02238FC4
	adds r0, r4, #0
	bl ov57_02239558
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223A4FC: .4byte 0x000005EA
_0223A500: .4byte 0x0000FFFF
	thumb_func_end ov57_0223A31C

	thumb_func_start ov57_0223A504
ov57_0223A504: @ 0x0223A504
	push {r4, lr}
	movs r1, #0xff
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0223A51C
	cmp r2, #1
	beq _0223A53E
	cmp r2, #2
	beq _0223A560
	b _0223A594
_0223A51C:
	subs r1, #0x10
	ldr r1, [r4, r1]
	bl ov57_0223BC4C
	adds r0, r4, #0
	adds r0, #0xec
	movs r1, #0
	movs r2, #9
	movs r3, #1
	bl ov57_02239728
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223A594
_0223A53E:
	bl ov57_0223B12C
	ldr r0, _0223A5A4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	ldr r0, _0223A5A8 @ =0x00000CF3
	tst r0, r1
	bne _0223A554
	bl FUN_02025358
	cmp r0, #0
	beq _0223A594
_0223A554:
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223A594
_0223A560:
	movs r1, #0
	movs r2, #0xff
	adds r3, r1, #0
	bl ov57_0223B828
	adds r0, r4, #0
	adds r0, #0xec
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r4, #0
	adds r0, #0xec
	bl FUN_0201D8E4
	adds r0, r4, #0
	movs r1, #1
	bl ov57_0223866C
	movs r0, #0x47
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #3
	movs r2, #7
	movs r3, #0
	bl ov57_02239728
_0223A594:
	adds r0, r4, #0
	bl ov57_02238FC4
	adds r0, r4, #0
	bl ov57_02239558
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0223A5A4: .4byte 0x021D110C
_0223A5A8: .4byte 0x00000CF3
	thumb_func_end ov57_0223A504

	thumb_func_start ov57_0223A5AC
ov57_0223A5AC: @ 0x0223A5AC
	push {r4, lr}
	movs r1, #0xff
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #3
	bhi _0223A69C
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0223A5C6: @ jump table
	.2byte _0223A5CE - _0223A5C6 - 2 @ case 0
	.2byte _0223A616 - _0223A5C6 - 2 @ case 1
	.2byte _0223A624 - _0223A5C6 - 2 @ case 2
	.2byte _0223A644 - _0223A5C6 - 2 @ case 3
_0223A5CE:
	subs r1, #0xe0
	ldr r0, [r4, r1]
	movs r1, #0x19
	bl FUN_0200DD68
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x14
	bl FUN_0200DD68
	movs r0, #0xc7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DC4C
	movs r0, #0x47
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #3
	movs r2, #0xa
	movs r3, #0
	bl ov57_02239728
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_0223A616:
	adds r0, r4, #0
	bl ov57_0223B308
	movs r1, #0xff
	lsls r1, r1, #2
	str r0, [r4, r1]
	b _0223A69C
_0223A624:
	bl ov57_0223B12C
	ldr r0, _0223A6AC @ =0x021D110C
	ldr r1, [r0, #0x48]
	ldr r0, _0223A6B0 @ =0x00000CF3
	tst r0, r1
	bne _0223A63A
	bl FUN_02025358
	cmp r0, #0
	beq _0223A69C
_0223A63A:
	movs r0, #0xff
	movs r1, #3
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0223A69C
_0223A644:
	subs r1, #0xe0
	ldr r0, [r4, r1]
	movs r1, #0x14
	bl FUN_0200DD68
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x19
	bl FUN_0200DD68
	movs r1, #0
	adds r0, r4, #0
	movs r2, #0xff
	adds r3, r1, #0
	bl ov57_0223B828
	movs r0, #0xc7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DC4C
	adds r0, r4, #0
	adds r0, #0xec
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r4, #0
	adds r0, #0xec
	bl FUN_0201D8E4
	adds r0, r4, #0
	movs r1, #1
	bl ov57_0223866C
	movs r0, #0x47
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #3
	movs r2, #7
	movs r3, #0
	bl ov57_02239728
_0223A69C:
	adds r0, r4, #0
	bl ov57_02238FC4
	adds r0, r4, #0
	bl ov57_02239558
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0223A6AC: .4byte 0x021D110C
_0223A6B0: .4byte 0x00000CF3
	thumb_func_end ov57_0223A5AC

	thumb_func_start ov57_0223A6B4
ov57_0223A6B4: @ 0x0223A6B4
	movs r0, #0
	bx lr
	thumb_func_end ov57_0223A6B4

	thumb_func_start ov57_0223A6B8
ov57_0223A6B8: @ 0x0223A6B8
	push {r4, lr}
	ldr r1, _0223A7C4 @ =0x00000404
	adds r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0223A6CE
	cmp r1, #1
	beq _0223A708
	cmp r1, #2
	beq _0223A7A6
	b _0223A7C0
_0223A6CE:
	movs r1, #0
	bl ov57_0223B948
	adds r0, r4, #0
	bl ov57_022398C4
	adds r0, r4, #0
	bl ov57_022399F8
	adds r0, r4, #0
	bl ov57_0223B75C
	adds r0, r4, #0
	bl ov57_0223B78C
	movs r0, #0xa2
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #0x41
	lsls r0, r0, #4
	str r1, [r4, r0]
	bl ov57_02239BCC
	ldr r0, _0223A7C4 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223A7C0
_0223A708:
	bl ov57_0223B940
	cmp r0, #1
	beq _0223A7C0
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223A7C0
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #7
	movs r1, #1
	bl FUN_0201BB68
	adds r0, r4, #0
	movs r1, #1
	bl ov57_0223A034
	adds r0, r4, #0
	movs r1, #1
	bl ov57_02239240
	adds r0, r4, #0
	movs r1, #1
	bl ov57_022387C0
	adds r0, r4, #0
	movs r1, #1
	bl ov57_02238AF0
	ldr r0, _0223A7C8 @ =0x00000434
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0200DCC0
	ldr r0, _0223A7CC @ =0x00000438
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0200DCC0
	ldr r0, _0223A7D0 @ =0x0000043C
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0200DCC0
	movs r0, #3
	movs r1, #1
	bl FUN_0201BB68
	movs r0, #0x47
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8C8
	adds r0, r4, #0
	ldr r2, _0223A7D4 @ =0x0000FFFF
	adds r0, #0xec
	movs r1, #0
	movs r3, #1
	bl ov57_02239728
	ldr r2, _0223A7D8 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	bl ov57_02239BAC
	ldr r0, _0223A7C4 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223A7C0
_0223A7A6:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223A7C0
	adds r0, r4, #0
	movs r1, #1
	bl ov57_0223B948
	ldr r0, _0223A7C4 @ =0x00000404
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #4
	pop {r4, pc}
_0223A7C0:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0223A7C4: .4byte 0x00000404
_0223A7C8: .4byte 0x00000434
_0223A7CC: .4byte 0x00000438
_0223A7D0: .4byte 0x0000043C
_0223A7D4: .4byte 0x0000FFFF
_0223A7D8: .4byte 0x04000304
	thumb_func_end ov57_0223A6B8

	thumb_func_start ov57_0223A7DC
ov57_0223A7DC: @ 0x0223A7DC
	push {r4, lr}
	ldr r1, _0223A8F0 @ =0x00000404
	adds r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0223A7F2
	cmp r2, #1
	beq _0223A820
	cmp r2, #2
	beq _0223A8B4
	b _0223A8EC
_0223A7F2:
	adds r0, r1, #0
	adds r0, #0xc
	ldr r0, [r4, r0]
	cmp r0, #0
	ble _0223A80C
	adds r0, r1, #0
	adds r0, #0xc
	ldr r0, [r4, r0]
	adds r1, #0xc
	subs r0, r0, #1
	str r0, [r4, r1]
	movs r0, #0
	pop {r4, pc}
_0223A80C:
	movs r0, #0
	adds r1, #0xc
	str r0, [r4, r1]
	bl ov57_02239BCC
	ldr r0, _0223A8F0 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223A8EC
_0223A820:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223A8EC
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #3
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #7
	movs r1, #3
	bl FUN_0201BB68
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	adds r0, r4, #0
	movs r1, #0
	bl ov57_0223A034
	adds r0, r4, #0
	movs r1, #0
	bl ov57_02239240
	adds r0, r4, #0
	movs r1, #0
	bl ov57_022387C0
	adds r0, r4, #0
	adds r0, #0xec
	movs r1, #1
	bl FUN_0200E5D4
	movs r0, #0x47
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #3
	movs r2, #7
	movs r3, #0
	bl ov57_02239728
	movs r0, #0x47
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D578
	adds r0, r4, #0
	movs r1, #1
	bl ov57_0223866C
	ldr r2, _0223A8F4 @ =0x04000304
	ldr r1, _0223A8F8 @ =0xFFFF7FFF
	ldrh r0, [r2]
	ands r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	asrs r1, r1, #0x10
	bl ov57_02238AF0
	adds r0, r4, #0
	movs r1, #0
	bl ov57_0223B948
	bl ov57_02239BAC
	ldr r0, _0223A8F0 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223A8EC
_0223A8B4:
	bl ov57_0223B940
	cmp r0, #1
	beq _0223A8EC
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223A8EC
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r1, #0
	adds r0, r4, #0
	movs r2, #0xff
	adds r3, r1, #0
	bl ov57_0223B828
	adds r0, r4, #0
	bl ov57_02239B0C
	ldr r0, _0223A8F0 @ =0x00000404
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
_0223A8EC:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0223A8F0: .4byte 0x00000404
_0223A8F4: .4byte 0x04000304
_0223A8F8: .4byte 0xFFFF7FFF
	thumb_func_end ov57_0223A7DC

	thumb_func_start ov57_0223A8FC
ov57_0223A8FC: @ 0x0223A8FC
	push {r4, r5, lr}
	sub sp, #0x24
	ldr r1, _0223AB44 @ =0x00000404
	adds r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #5
	bhi _0223A986
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223A916: @ jump table
	.2byte _0223A922 - _0223A916 - 2 @ case 0
	.2byte _0223A97A - _0223A916 - 2 @ case 1
	.2byte _0223AA20 - _0223A916 - 2 @ case 2
	.2byte _0223AA30 - _0223A916 - 2 @ case 3
	.2byte _0223AA98 - _0223A916 - 2 @ case 4
	.2byte _0223AAD2 - _0223A916 - 2 @ case 5
_0223A922:
	bl ov57_022384C0
	cmp r0, #0
	bne _0223A930
	add sp, #0x24
	movs r0, #0xb
	pop {r4, r5, pc}
_0223A930:
	movs r3, #0
	str r3, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r0, r4, #0
	str r3, [sp, #8]
	adds r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AB48 @ =0x0000080B
	movs r1, #2
	bl FUN_02003370
	movs r3, #0
	str r3, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r0, r4, #0
	str r3, [sp, #8]
	adds r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AB4C @ =0x0000FFFF
	movs r1, #8
	bl FUN_02003370
	adds r0, r4, #0
	movs r1, #0
	bl ov57_0223B948
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	ldr r0, _0223AB44 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223AB3C
_0223A97A:
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_02003B44
	cmp r0, #0
	beq _0223A988
_0223A986:
	b _0223AB3C
_0223A988:
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02003B50
	movs r0, #1
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r2, #4
	adds r0, r4, #0
	str r2, [sp, #8]
	movs r1, #0x3a
	str r1, [sp, #0xc]
	adds r0, #0xe4
	adds r1, #0xf2
	ldr r0, [r0]
	adds r1, r4, r1
	movs r3, #2
	bl ov57_022397B0
	add r0, sp, #0x10
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	add r2, sp, #0x10
	str r0, [sp, #0x10]
	movs r0, #4
	str r0, [sp, #0x14]
	movs r0, #0xe6
	str r0, [sp, #0x18]
	movs r0, #5
	str r0, [sp, #0x1c]
	movs r0, #0x19
	strb r0, [r2, #0x10]
	movs r0, #6
	strb r0, [r2, #0x11]
	ldrb r0, [r2, #0x12]
	movs r1, #0xf
	bics r0, r1
	ldr r1, _0223AB50 @ =0x0000040C
	ldr r1, [r4, r1]
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r1, #0xf
	ands r1, r3
	orrs r0, r1
	strb r0, [r2, #0x12]
	movs r0, #0x34
	bl FUN_0201660C
	movs r1, #0x91
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, sp, #0x10
	bl FUN_020166FC
	movs r0, #0x4b
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #4
	movs r2, #0xe
	movs r3, #0
	bl ov57_02239728
	ldr r0, _0223AB44 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223AB3C
_0223AA20:
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	ldr r0, _0223AB44 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_0223AA30:
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020168F4
	adds r5, r0, #0
	beq _0223AB3C
	cmp r5, #1
	beq _0223AA46
	cmp r5, #2
	bne _0223AB3C
_0223AA46:
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020169C0
	ldr r1, _0223AB50 @ =0x0000040C
	str r0, [r4, r1]
	subs r0, r1, #4
	str r5, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02003B50
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020169CC
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r0, #0x4b
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #0x4b
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _0223AB44 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223AB3C
_0223AA98:
	movs r0, #0xa
	str r0, [sp]
	movs r3, #0
	str r3, [sp, #4]
	adds r0, r4, #0
	str r3, [sp, #8]
	adds r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AB48 @ =0x0000080B
	movs r1, #2
	bl FUN_02003370
	movs r0, #0xa
	str r0, [sp]
	movs r3, #0
	str r3, [sp, #4]
	adds r0, r4, #0
	str r3, [sp, #8]
	adds r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AB4C @ =0x0000FFFF
	movs r1, #8
	bl FUN_02003370
	ldr r0, _0223AB44 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223AB3C
_0223AAD2:
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_02003B44
	cmp r0, #0
	bne _0223AB3C
	ldr r0, _0223AB54 @ =0x00000408
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223AB26
	cmp r0, #1
	beq _0223AAF0
	cmp r0, #2
	beq _0223AB22
	b _0223AB26
_0223AAF0:
	adds r0, r4, #0
	bl ov57_0223B774
	adds r0, r4, #0
	bl ov57_0223B7A8
	adds r0, r4, #0
	bl ov57_022399F8
	adds r0, r4, #0
	bl ov57_022383AC
	adds r0, r4, #0
	bl ov57_02237F3C
	adds r0, r4, #0
	movs r1, #1
	bl ov57_022383D0
	movs r0, #0x41
	movs r1, #0x14
	lsls r0, r0, #4
	movs r5, #6
	str r1, [r4, r0]
	b _0223AB28
_0223AB22:
	movs r5, #4
	b _0223AB28
_0223AB26:
	movs r5, #7
_0223AB28:
	adds r0, r4, #0
	movs r1, #1
	bl ov57_0223B948
	ldr r0, _0223AB44 @ =0x00000404
	movs r1, #0
	str r1, [r4, r0]
	add sp, #0x24
	adds r0, r5, #0
	pop {r4, r5, pc}
_0223AB3C:
	movs r0, #7
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_0223AB44: .4byte 0x00000404
_0223AB48: .4byte 0x0000080B
_0223AB4C: .4byte 0x0000FFFF
_0223AB50: .4byte 0x0000040C
_0223AB54: .4byte 0x00000408
	thumb_func_end ov57_0223A8FC

	thumb_func_start ov57_0223AB58
ov57_0223AB58: @ 0x0223AB58
	push {r4, r5, lr}
	sub sp, #0x84
	ldr r1, _0223AE90 @ =0x00000404
	adds r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #7
	bls _0223AB68
	b _0223AE4C
_0223AB68:
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0223AB74: @ jump table
	.2byte _0223AB84 - _0223AB74 - 2 @ case 0
	.2byte _0223ABF6 - _0223AB74 - 2 @ case 1
	.2byte _0223AC4A - _0223AB74 - 2 @ case 2
	.2byte _0223ACAC - _0223AB74 - 2 @ case 3
	.2byte _0223ACF6 - _0223AB74 - 2 @ case 4
	.2byte _0223AD38 - _0223AB74 - 2 @ case 5
	.2byte _0223AD7A - _0223AB74 - 2 @ case 6
	.2byte _0223ADE2 - _0223AB74 - 2 @ case 7
_0223AB84:
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r3, #0
	str r3, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r0, r4, #0
	str r3, [sp, #8]
	adds r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AE94 @ =0x0000080B
	movs r1, #2
	bl FUN_02003370
	movs r3, #0
	str r3, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r0, r4, #0
	str r3, [sp, #8]
	adds r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AE98 @ =0x0000FFFF
	movs r1, #8
	bl FUN_02003370
	adds r0, r4, #0
	movs r1, #0
	bl ov57_0223B948
	ldr r0, _0223AE9C @ =0x00000408
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov57_0223B7C4
	adds r0, r4, #0
	bl ov57_0223B950
	adds r0, r4, #0
	movs r1, #1
	bl ov57_0223BB38
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xec
	movs r2, #0xd
	adds r3, r1, #0
	bl ov57_02239728
	ldr r0, _0223AE90 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223ABF6:
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_02003B44
	cmp r0, #0
	beq _0223AC04
	b _0223AE88
_0223AC04:
	movs r0, #0x34
	str r0, [sp, #0x60]
	movs r1, #1
	movs r2, #0
	movs r0, #0xff
	str r0, [sp, #0x68]
	adds r0, r4, #0
	str r1, [sp, #0x5c]
	str r1, [sp, #0x74]
	str r2, [sp, #0x64]
	str r2, [sp, #0x70]
	adds r0, #0xdc
	ldr r0, [r0]
	movs r1, #0x9b
	str r0, [sp, #0x78]
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #0x7c]
	ldr r0, _0223AEA0 @ =0x00000458
	ldr r0, [r4, r0]
	bl FUN_0206E540
	str r0, [sp, #0x6c]
	add r0, sp, #0x5c
	bl FUN_02233DB8
	movs r1, #0x95
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _0223AE90 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223AC4A:
	add r2, sp, #0x38
	movs r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r0, [r2, #8]
	movs r0, #1
	str r0, [sp, #0x38]
	adds r0, r1, #0
	adds r0, #0x54
	ldr r0, [r4, r0]
	subs r1, #0x18
	str r0, [sp, #0x40]
	ldr r0, [r4, r1]
	adds r1, r4, #0
	adds r0, r0, #1
	str r0, [sp, #0xc]
	add r0, sp, #0x44
	bl ov57_0223857C
	ldr r0, _0223AEA0 @ =0x00000458
	movs r1, #0xa2
	ldr r0, [r4, r0]
	add r2, sp, #0xc
	bl FUN_0206EC40
	ldr r0, _0223AEA0 @ =0x00000458
	movs r1, #0xab
	ldr r0, [r4, r0]
	add r2, sp, #0x44
	bl FUN_0206EC40
	movs r0, #0x34
	add r1, sp, #0x38
	bl FUN_02232694
	movs r1, #0x25
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl FUN_022329B0
	ldr r0, _0223AE90 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	movs r1, #0
	adds r0, r0, #4
	str r1, [r4, r0]
	b _0223AE88
_0223ACAC:
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02232A04
	cmp r0, #1
	bne _0223AD64
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02233EA0
	cmp r0, #1
	bne _0223AD64
	adds r0, r4, #0
	bl ov57_0223BA40
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02232A44
	adds r0, r4, #0
	movs r1, #0
	bl ov57_0223BB38
	adds r0, r4, #0
	bl ov57_0223BA1C
	ldr r0, _0223AEA4 @ =0x000006C5
	bl FUN_0200604C
	ldr r0, _0223AE90 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223ACF6:
	bl ov57_0223BA40
	adds r5, r0, #0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02233E88
	cmp r0, #0
	bne _0223AD64
	cmp r5, #0
	bne _0223AD64
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02233ECC
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	bl ov57_0223B9C8
	ldr r0, _0223AE9C @ =0x00000408
	movs r1, #0
	str r1, [r4, r0]
	subs r1, r0, #4
	ldr r1, [r4, r1]
	subs r0, r0, #4
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223AD38:
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02232A54
	cmp r0, #0
	bne _0223AD64
	movs r0, #0xa1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02017068
	cmp r0, #1
	bne _0223AD64
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020085DC
	cmp r0, #0
	beq _0223AD66
_0223AD64:
	b _0223AE88
_0223AD66:
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02232AB8
	ldr r0, _0223AE90 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223AD7A:
	adds r0, r1, #4
	ldr r0, [r4, r0]
	adds r2, r0, #1
	adds r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	blt _0223AE88
	adds r0, r1, #4
	movs r2, #0
	str r2, [r4, r0]
	movs r0, #0x34
	movs r3, #1
	str r0, [sp, #0x14]
	movs r0, #5
	str r0, [sp, #0x18]
	movs r0, #0xff
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	str r3, [sp, #0x10]
	str r2, [sp, #0x24]
	str r3, [sp, #0x28]
	adds r0, #0xdc
	ldr r0, [r0]
	adds r1, #0x54
	str r0, [sp, #0x2c]
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #0x30]
	ldr r0, [r4, r1]
	movs r1, #0x9b
	bl FUN_0206E540
	str r0, [sp, #0x20]
	add r0, sp, #0x10
	bl FUN_02233DB8
	movs r1, #0x95
	lsls r1, r1, #2
	str r0, [r4, r1]
	bl ov57_0223BB5C
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	ldr r0, _0223AE90 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223ADE2:
	bl ov57_0223BABC
	adds r5, r0, #0
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02233E88
	cmp r0, #0
	bne _0223AE88
	cmp r5, #0
	bne _0223AE88
	movs r0, #0xa
	str r0, [sp]
	movs r3, #0
	str r3, [sp, #4]
	adds r0, r4, #0
	str r3, [sp, #8]
	adds r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AE94 @ =0x0000080B
	movs r1, #2
	bl FUN_02003370
	movs r0, #0xa
	str r0, [sp]
	movs r3, #0
	str r3, [sp, #4]
	adds r0, r4, #0
	str r3, [sp, #8]
	adds r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AE98 @ =0x0000FFFF
	movs r1, #8
	bl FUN_02003370
	adds r0, r4, #0
	movs r1, #1
	bl ov57_0223BB38
	adds r0, r4, #0
	bl ov57_0223BB4C
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02233ECC
	ldr r0, _0223AE90 @ =0x00000404
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223AE4C:
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_02003B44
	cmp r0, #0
	bne _0223AE88
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	movs r1, #1
	bl ov57_0223B948
	movs r1, #0
	ldr r0, _0223AE90 @ =0x00000404
	movs r2, #4
	str r1, [r4, r0]
	subs r0, #8
	str r2, [r4, r0]
	adds r4, #0xec
	ldr r2, _0223AE98 @ =0x0000FFFF
	adds r0, r4, #0
	adds r3, r1, #0
	bl ov57_02239728
	add sp, #0x84
	movs r0, #4
	pop {r4, r5, pc}
_0223AE88:
	movs r0, #5
	add sp, #0x84
	pop {r4, r5, pc}
	nop
_0223AE90: .4byte 0x00000404
_0223AE94: .4byte 0x0000080B
_0223AE98: .4byte 0x0000FFFF
_0223AE9C: .4byte 0x00000408
_0223AEA0: .4byte 0x00000458
_0223AEA4: .4byte 0x000006C5
	thumb_func_end ov57_0223AB58

	thumb_func_start ov57_0223AEA8
ov57_0223AEA8: @ 0x0223AEA8
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0xd8
	ldr r0, [r0]
	adds r6, r1, #0
	cmp r0, #0
	bne _0223AEBC
	b _0223B100
_0223AEBC:
	cmp r5, #0x14
	bls _0223AEC2
	b _0223B0FC
_0223AEC2:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223AECE: @ jump table
	.2byte _0223B036 - _0223AECE - 2 @ case 0
	.2byte _0223B036 - _0223AECE - 2 @ case 1
	.2byte _0223B036 - _0223AECE - 2 @ case 2
	.2byte _0223B036 - _0223AECE - 2 @ case 3
	.2byte _0223B036 - _0223AECE - 2 @ case 4
	.2byte _0223B036 - _0223AECE - 2 @ case 5
	.2byte _0223B036 - _0223AECE - 2 @ case 6
	.2byte _0223B036 - _0223AECE - 2 @ case 7
	.2byte _0223AEF8 - _0223AECE - 2 @ case 8
	.2byte _0223AF42 - _0223AECE - 2 @ case 9
	.2byte _0223AF90 - _0223AECE - 2 @ case 10
	.2byte _0223AFBE - _0223AECE - 2 @ case 11
	.2byte _0223AFFC - _0223AECE - 2 @ case 12
	.2byte _0223B0CC - _0223AECE - 2 @ case 13
	.2byte _0223B0CC - _0223AECE - 2 @ case 14
	.2byte _0223B0CC - _0223AECE - 2 @ case 15
	.2byte _0223B0CC - _0223AECE - 2 @ case 16
	.2byte _0223B0CC - _0223AECE - 2 @ case 17
	.2byte _0223B0CC - _0223AECE - 2 @ case 18
	.2byte _0223B0CC - _0223AECE - 2 @ case 19
	.2byte _0223B0CC - _0223AECE - 2 @ case 20
_0223AEF8:
	cmp r6, #0
	bne _0223AF36
	ldr r1, _0223B104 @ =0x00000448
	ldr r0, [r4, r1]
	cmp r0, #0
	ble _0223AF06
	b _0223AF0A
_0223AF06:
	adds r0, r1, #4
	ldr r0, [r4, r0]
_0223AF0A:
	subs r0, r0, #1
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov57_02238AC0
	ldr r1, _0223B104 @ =0x00000448
	adds r0, r4, #0
	ldr r1, [r4, r1]
	bl ov57_022388E4
	adds r0, r4, #0
	bl ov57_02238958
	adds r0, r4, #0
	bl ov57_02238A00
	adds r0, r4, #0
	bl ov57_022399F8
	ldr r0, _0223B108 @ =0x000006C4
	bl FUN_0200604C
_0223AF36:
	ldr r0, _0223B10C @ =0x00000434
	adds r1, r6, #0
	ldr r0, [r4, r0]
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223AF42:
	cmp r6, #0
	bne _0223AF84
	ldr r1, _0223B104 @ =0x00000448
	ldr r0, [r4, r1]
	adds r0, r0, #1
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	blx FUN_020F2998
	ldr r0, _0223B104 @ =0x00000448
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov57_02238AC0
	ldr r1, _0223B104 @ =0x00000448
	adds r0, r4, #0
	ldr r1, [r4, r1]
	bl ov57_022388E4
	adds r0, r4, #0
	bl ov57_02238958
	adds r0, r4, #0
	bl ov57_02238A00
	adds r0, r4, #0
	bl ov57_022399F8
	ldr r0, _0223B108 @ =0x000006C4
	bl FUN_0200604C
_0223AF84:
	ldr r0, _0223B110 @ =0x00000438
	adds r1, r6, #0
	ldr r0, [r4, r0]
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223AF90:
	cmp r6, #0
	bne _0223AFB2
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #5
	beq _0223AFA8
	movs r1, #5
	str r1, [r4, r0]
	ldr r0, _0223B114 @ =0x000005DD
	bl FUN_0200604C
_0223AFA8:
	ldr r0, _0223B118 @ =0x0000043C
	movs r1, #0
	ldr r0, [r4, r0]
	bl ov57_0223B90C
_0223AFB2:
	ldr r0, _0223B118 @ =0x0000043C
	adds r1, r6, #0
	ldr r0, [r4, r0]
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223AFBE:
	cmp r6, #0
	bne _0223AFEE
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #6
	beq _0223AFDE
	movs r1, #6
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0
	bl ov57_0223B948
	ldr r0, _0223B11C @ =0x000005E2
	bl FUN_0200604C
_0223AFDE:
	movs r0, #0x11
	movs r1, #0x26
	lsls r0, r0, #6
	lsls r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl ov57_0223B90C
_0223AFEE:
	movs r0, #0x11
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	adds r1, r6, #0
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223AFFC:
	cmp r6, #0
	bne _0223B02A
	movs r0, #0xff
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #7
	beq _0223B01C
	movs r1, #7
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0
	bl ov57_0223B948
	ldr r0, _0223B114 @ =0x000005DD
	bl FUN_0200604C
_0223B01C:
	ldr r0, _0223B120 @ =0x00000444
	movs r1, #0x99
	lsls r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl ov57_0223B90C
_0223B02A:
	ldr r0, _0223B120 @ =0x00000444
	adds r1, r6, #0
	ldr r0, [r4, r0]
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223B036:
	cmp r6, #0
	bne _0223B100
	adds r0, r4, #0
	bl ov57_02238028
	cmp r0, #0
	bne _0223B05A
	ldr r0, _0223B124 @ =0x000005F2
	bl FUN_0200604C
	adds r4, #0xec
	movs r1, #0
	adds r0, r4, #0
	movs r2, #0xf
	adds r3, r1, #0
	bl ov57_02239728
	pop {r4, r5, r6, pc}
_0223B05A:
	movs r0, #0x45
	lsls r0, r0, #4
	adds r6, r4, r0
	ldrb r1, [r6, r5]
	cmp r1, #0
	beq _0223B0B0
	ldr r0, [r4, #0x64]
	subs r1, r1, #1
	bl FUN_0202CC5C
	cmp r0, #0
	beq _0223B0B0
	lsls r1, r5, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov57_02237FAC
	adds r1, r4, #0
	adds r1, #0xd4
	str r0, [r1]
	ldrb r0, [r6, r5]
	bl FUN_0209106C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xec
	bl ov57_02239B2C
	ldr r0, [r4]
	movs r2, #0
	ldrb r1, [r6, r5]
	ldr r0, [r0, #0x20]
	mvns r2, r2
	bl FUN_0202CCAC
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov57_02239A8C
	ldr r0, _0223B128 @ =0x000005EB
	bl FUN_0200604C
	pop {r4, r5, r6, pc}
_0223B0B0:
	ldrb r0, [r6, r5]
	cmp r0, #0
	beq _0223B100
	ldr r0, _0223B124 @ =0x000005F2
	bl FUN_0200604C
	adds r4, #0xec
	movs r1, #0
	adds r0, r4, #0
	movs r2, #0x10
	adds r3, r1, #0
	bl ov57_02239728
	pop {r4, r5, r6, pc}
_0223B0CC:
	cmp r6, #0
	bne _0223B100
	subs r5, #0xd
	lsls r2, r5, #0x18
	adds r0, r4, #0
	lsrs r2, r2, #0x18
	bl ov57_022382F8
	lsls r0, r5, #4
	adds r1, r4, r0
	movs r0, #0x35
	lsls r0, r0, #4
	ldrb r0, [r1, r0]
	bl FUN_0209106C
	adds r4, #0xec
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov57_02239B2C
	ldr r0, _0223B128 @ =0x000005EB
	bl FUN_0200604C
	pop {r4, r5, r6, pc}
_0223B0FC:
	bl GF_AssertFail
_0223B100:
	pop {r4, r5, r6, pc}
	nop
_0223B104: .4byte 0x00000448
_0223B108: .4byte 0x000006C4
_0223B10C: .4byte 0x00000434
_0223B110: .4byte 0x00000438
_0223B114: .4byte 0x000005DD
_0223B118: .4byte 0x0000043C
_0223B11C: .4byte 0x000005E2
_0223B120: .4byte 0x00000444
_0223B124: .4byte 0x000005F2
_0223B128: .4byte 0x000005EB
	thumb_func_end ov57_0223AEA8

	thumb_func_start ov57_0223B12C
ov57_0223B12C: @ 0x0223B12C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223B178 @ =0x0000040C
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0223B156
	bl FUN_0202534C
	cmp r0, #0
	beq _0223B144
	movs r0, #0
	pop {r4, pc}
_0223B144:
	ldr r0, _0223B17C @ =0x021D110C
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _0223B174
	ldr r0, _0223B178 @ =0x0000040C
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
_0223B156:
	ldr r0, _0223B17C @ =0x021D110C
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _0223B162
	movs r0, #0
	pop {r4, pc}
_0223B162:
	bl FUN_0202534C
	cmp r0, #0
	beq _0223B174
	ldr r0, _0223B178 @ =0x0000040C
	movs r1, #1
	str r1, [r4, r0]
	movs r0, #0
	pop {r4, pc}
_0223B174:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0223B178: .4byte 0x0000040C
_0223B17C: .4byte 0x021D110C
	thumb_func_end ov57_0223B12C

	thumb_func_start ov57_0223B180
ov57_0223B180: @ 0x0223B180
	push {r4, lr}
	adds r4, r0, #0
	bl ov57_0223B12C
	ldr r0, _0223B1A0 @ =0x0000040C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223B198
	adds r0, r4, #0
	bl ov57_0223B288
	pop {r4, pc}
_0223B198:
	adds r0, r4, #0
	bl ov57_0223B2EC
	pop {r4, pc}
	.align 2, 0
_0223B1A0: .4byte 0x0000040C
	thumb_func_end ov57_0223B180

	thumb_func_start ov57_0223B1A4
ov57_0223B1A4: @ 0x0223B1A4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0xc
	beq _0223B1B4
	cmp r4, #0xd
	beq _0223B1C6
	b _0223B1FA
_0223B1B4:
	ldr r0, _0223B27C @ =0x000005DD
	bl FUN_0200604C
	ldr r0, [r5]
	movs r1, #0
	bl ov57_02237E88
	movs r0, #5
	pop {r3, r4, r5, pc}
_0223B1C6:
	movs r0, #0x47
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #3
	movs r2, #8
	movs r3, #0
	bl ov57_02239728
	movs r0, #0xfb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r5, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	adds r1, #0xfc
	movs r2, #1
	adds r3, r5, #0
	bl ov57_02238C30
	ldr r0, _0223B280 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #4
	pop {r3, r4, r5, pc}
_0223B1FA:
	bl ov57_02238134
	adds r0, r5, #0
	bl ov57_0223853C
	adds r0, r5, #0
	bl ov57_022394AC
	movs r0, #0xfb
	lsls r0, r0, #2
	str r4, [r5, r0]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	bl ov57_0223B504
	adds r0, r5, #0
	bl ov57_022383AC
	adds r0, r5, #0
	bl ov57_02237F3C
	adds r0, r5, #0
	movs r1, #1
	bl ov57_022383D0
	adds r0, r5, #0
	bl ov57_02237F14
	ldr r0, _0223B284 @ =0x0000040C
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0223B244
	ldr r0, _0223B280 @ =0x000005DC
	bl FUN_0200604C
	b _0223B278
_0223B244:
	movs r0, #0x47
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #3
	movs r2, #8
	movs r3, #0
	bl ov57_02239728
	movs r0, #0xfb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r5, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	adds r1, #0xfc
	movs r2, #1
	adds r3, r5, #0
	bl ov57_02238C30
	ldr r0, _0223B280 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #4
	pop {r3, r4, r5, pc}
_0223B278:
	movs r0, #3
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223B27C: .4byte 0x000005DD
_0223B280: .4byte 0x000005DC
_0223B284: .4byte 0x0000040C
	thumb_func_end ov57_0223B1A4

	thumb_func_start ov57_0223B288
ov57_0223B288: @ 0x0223B288
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, _0223B2E8 @ =0x021D110C
	movs r1, #2
	ldr r3, [r2, #0x48]
	adds r4, r0, #0
	tst r1, r3
	beq _0223B2A2
	movs r1, #0xc
	bl ov57_0223B1A4
	add sp, #4
	pop {r3, r4, pc}
_0223B2A2:
	movs r1, #1
	tst r1, r3
	beq _0223B2B2
	movs r1, #0xd
	bl ov57_0223B1A4
	add sp, #4
	pop {r3, r4, pc}
_0223B2B2:
	ldr r1, [r2, #0x4c]
	movs r0, #0xf0
	tst r0, r1
	bne _0223B2C0
	add sp, #4
	movs r0, #3
	pop {r3, r4, pc}
_0223B2C0:
	movs r0, #0xfb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [sp]
	add r0, sp, #0
	bl ov57_0223B478
	cmp r0, #0
	bne _0223B2D8
	add sp, #4
	movs r0, #3
	pop {r3, r4, pc}
_0223B2D8:
	ldr r1, [sp]
	adds r0, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov57_0223B1A4
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223B2E8: .4byte 0x021D110C
	thumb_func_end ov57_0223B288

	thumb_func_start ov57_0223B2EC
ov57_0223B2EC: @ 0x0223B2EC
	push {r4, lr}
	adds r4, r0, #0
	bl ov57_0223B578
	adds r1, r0, #0
	bpl _0223B2FC
	movs r0, #3
	pop {r4, pc}
_0223B2FC:
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov57_0223B1A4
	pop {r4, pc}
	thumb_func_end ov57_0223B2EC

	thumb_func_start ov57_0223B308
ov57_0223B308: @ 0x0223B308
	push {r4, lr}
	adds r4, r0, #0
	bl ov57_0223B12C
	ldr r0, _0223B328 @ =0x0000040C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223B320
	adds r0, r4, #0
	bl ov57_0223B3F8
	pop {r4, pc}
_0223B320:
	adds r0, r4, #0
	bl ov57_0223B45C
	pop {r4, pc}
	.align 2, 0
_0223B328: .4byte 0x0000040C
	thumb_func_end ov57_0223B308

	thumb_func_start ov57_0223B32C
ov57_0223B32C: @ 0x0223B32C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r2, [r4, r0]
	subs r0, r0, #4
	ldr r3, [r4, r0]
	cmp r3, r2
	bne _0223B340
	movs r1, #0
_0223B340:
	cmp r1, #0
	beq _0223B36E
	adds r0, r4, #0
	adds r1, r3, #0
	bl ov57_022394D8
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov57_0223B504
	adds r4, #0xec
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xb
	movs r3, #1
	bl ov57_02239728
	ldr r0, _0223B39C @ =0x000005DC
	bl FUN_0200604C
	movs r0, #2
	pop {r4, pc}
_0223B36E:
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0xc7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DC4C
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov57_0223B504
	ldr r0, _0223B3A0 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #3
	pop {r4, pc}
	nop
_0223B39C: .4byte 0x000005DC
_0223B3A0: .4byte 0x000005DD
	thumb_func_end ov57_0223B32C

	thumb_func_start ov57_0223B3A4
ov57_0223B3A4: @ 0x0223B3A4
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0xc
	beq _0223B3B2
	cmp r1, #0xd
	beq _0223B3BA
	b _0223B3C2
_0223B3B2:
	movs r1, #0
	bl ov57_0223B32C
	pop {r4, pc}
_0223B3BA:
	movs r1, #1
	bl ov57_0223B32C
	pop {r4, pc}
_0223B3C2:
	movs r2, #0x3f
	lsls r2, r2, #4
	str r1, [r4, r2]
	movs r1, #1
	movs r2, #0
	bl ov57_0223B504
	ldr r0, _0223B3F0 @ =0x0000040C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223B3E0
	ldr r0, _0223B3F4 @ =0x000005DC
	bl FUN_0200604C
	b _0223B3EA
_0223B3E0:
	adds r0, r4, #0
	movs r1, #1
	bl ov57_0223B32C
	pop {r4, pc}
_0223B3EA:
	movs r0, #1
	pop {r4, pc}
	nop
_0223B3F0: .4byte 0x0000040C
_0223B3F4: .4byte 0x000005DC
	thumb_func_end ov57_0223B3A4

	thumb_func_start ov57_0223B3F8
ov57_0223B3F8: @ 0x0223B3F8
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, _0223B458 @ =0x021D110C
	movs r1, #2
	ldr r3, [r2, #0x48]
	adds r4, r0, #0
	tst r1, r3
	beq _0223B412
	movs r1, #0xc
	bl ov57_0223B3A4
	add sp, #4
	pop {r3, r4, pc}
_0223B412:
	movs r1, #1
	tst r3, r1
	beq _0223B422
	movs r1, #0xd
	bl ov57_0223B3A4
	add sp, #4
	pop {r3, r4, pc}
_0223B422:
	ldr r2, [r2, #0x4c]
	movs r0, #0xf0
	tst r0, r2
	bne _0223B430
	add sp, #4
	adds r0, r1, #0
	pop {r3, r4, pc}
_0223B430:
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	str r0, [sp]
	add r0, sp, #0
	bl ov57_0223B478
	cmp r0, #0
	bne _0223B448
	add sp, #4
	movs r0, #1
	pop {r3, r4, pc}
_0223B448:
	ldr r1, [sp]
	adds r0, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov57_0223B3A4
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223B458: .4byte 0x021D110C
	thumb_func_end ov57_0223B3F8

	thumb_func_start ov57_0223B45C
ov57_0223B45C: @ 0x0223B45C
	push {r4, lr}
	adds r4, r0, #0
	bl ov57_0223B578
	adds r1, r0, #0
	bpl _0223B46C
	movs r0, #1
	pop {r4, pc}
_0223B46C:
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov57_0223B3A4
	pop {r4, pc}
	thumb_func_end ov57_0223B45C

	thumb_func_start ov57_0223B478
ov57_0223B478: @ 0x0223B478
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223B500 @ =0x021D110C
	movs r1, #0x10
	ldr r0, [r0, #0x4c]
	tst r1, r0
	beq _0223B496
	ldr r0, [r4]
	movs r1, #0xc
	adds r0, r0, #1
	str r0, [r4]
	blx FUN_020F2998
	str r1, [r4]
	b _0223B4FC
_0223B496:
	movs r1, #0x20
	tst r1, r0
	beq _0223B4AE
	ldr r0, [r4]
	cmp r0, #0
	ble _0223B4A8
	subs r0, r0, #1
	str r0, [r4]
	b _0223B4FC
_0223B4A8:
	movs r0, #0xb
	str r0, [r4]
	b _0223B4FC
_0223B4AE:
	movs r1, #0x40
	tst r1, r0
	beq _0223B4D2
	ldr r1, [r4]
	asrs r0, r1, #1
	lsrs r0, r0, #0x1e
	adds r0, r1, r0
	asrs r0, r0, #2
	beq _0223B4CE
	subs r0, r1, #4
	movs r1, #0xc
	str r0, [r4]
	blx FUN_020F2998
	str r1, [r4]
	b _0223B4FC
_0223B4CE:
	movs r0, #0
	pop {r4, pc}
_0223B4D2:
	movs r1, #0x80
	tst r0, r1
	beq _0223B4F8
	ldr r1, [r4]
	asrs r0, r1, #1
	lsrs r0, r0, #0x1e
	adds r0, r1, r0
	asrs r0, r0, #2
	cmp r0, #2
	beq _0223B4F4
	adds r0, r1, #4
	movs r1, #0xc
	str r0, [r4]
	blx FUN_020F2998
	str r1, [r4]
	b _0223B4FC
_0223B4F4:
	movs r0, #0
	pop {r4, pc}
_0223B4F8:
	movs r0, #0
	pop {r4, pc}
_0223B4FC:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0223B500: .4byte 0x021D110C
	thumb_func_end ov57_0223B478

	thumb_func_start ov57_0223B504
ov57_0223B504: @ 0x0223B504
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r4, #0
	str r2, [sp]
	cmp r1, #0
	bne _0223B514
	movs r4, #1
_0223B514:
	movs r0, #0xfb
	lsls r0, r0, #2
	lsls r6, r1, #2
	adds r7, r5, r0
	add r1, sp, #4
	ldr r0, [r7, r6]
	adds r1, #2
	add r2, sp, #4
	bl ov57_02238DAC
	movs r0, #0xc7
	adds r1, r5, r6
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r3, sp, #4
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl FUN_0200DDB8
	ldr r0, [sp]
	cmp r0, #1
	bne _0223B572
	movs r0, #0xfb
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, [r7, r6]
	lsls r4, r4, #2
	str r0, [r1, r4]
	ldr r0, [r1, r4]
	add r1, sp, #4
	adds r1, #2
	add r2, sp, #4
	bl ov57_02238DAC
	movs r0, #0xc7
	adds r1, r5, r4
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r3, sp, #4
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl FUN_0200DDB8
_0223B572:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov57_0223B504

	thumb_func_start ov57_0223B578
ov57_0223B578: @ 0x0223B578
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #4]
	bl FUN_02025358
	cmp r0, #0
	bne _0223B58E
	movs r0, #0
	add sp, #0x18
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0223B58E:
	movs r0, #0xfe
	add r6, sp, #0x10
	strb r0, [r6, #2]
	movs r0, #0x18
	add r7, sp, #0x10
	str r0, [sp, #8]
	strb r0, [r6, #5]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r7, #2
_0223B5A2:
	ldr r0, [sp, #8]
	movs r4, #0
	strb r0, [r6, #4]
	movs r5, #0x28
_0223B5AA:
	adds r0, r7, #0
	strb r5, [r6, #3]
	bl FUN_02025320
	cmp r0, #0
	beq _0223B5C0
	ldr r0, [sp, #0xc]
	add sp, #0x18
	lsls r0, r0, #2
	adds r0, r4, r0
	pop {r3, r4, r5, r6, r7, pc}
_0223B5C0:
	adds r4, r4, #1
	adds r5, #0x38
	cmp r4, #4
	blt _0223B5AA
	ldr r0, [sp, #8]
	adds r0, #0x38
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #3
	blt _0223B5A2
	ldr r0, _0223B618 @ =0x0223BEB0
	bl FUN_02025224
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _0223B614
	lsrs r1, r0, #0x16
	add r0, sp, #0x10
	strh r1, [r0]
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r3, _0223B61C @ =0x021D114C
	adds r0, #0xe4
	ldrh r2, [r3, #0x20]
	str r0, [sp, #4]
	ldrh r3, [r3, #0x22]
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0201F2CC
	cmp r0, #0
	bne _0223B610
	movs r4, #0
	mvns r4, r4
	b _0223B612
_0223B610:
	adds r4, #0xc
_0223B612:
	adds r0, r4, #0
_0223B614:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223B618: .4byte 0x0223BEB0
_0223B61C: .4byte 0x021D114C
	thumb_func_end ov57_0223B578

	thumb_func_start ov57_0223B620
ov57_0223B620: @ 0x0223B620
	push {r4, lr}
	adds r4, r0, #0
	bl ov57_0223B12C
	ldr r0, _0223B6D8 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _0223B668
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0xff
	beq _0223B646
	ldr r0, _0223B6DC @ =0x000005F2
	bl FUN_0200604C
	movs r0, #4
	pop {r4, pc}
_0223B646:
	adds r0, r4, #0
	movs r1, #0
	bl ov57_0223B948
	ldr r0, _0223B6E0 @ =0x000005E2
	bl FUN_0200604C
	movs r0, #0x11
	movs r1, #0x26
	lsls r0, r0, #6
	lsls r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl ov57_0223B90C
	movs r0, #6
	pop {r4, pc}
_0223B668:
	movs r0, #2
	tst r0, r1
	beq _0223B6A2
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0xff
	beq _0223B682
	ldr r0, _0223B6DC @ =0x000005F2
	bl FUN_0200604C
	movs r0, #4
	pop {r4, pc}
_0223B682:
	adds r0, r4, #0
	movs r1, #0
	bl ov57_0223B948
	ldr r0, _0223B6E4 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, _0223B6E8 @ =0x00000444
	movs r1, #0x99
	lsls r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl ov57_0223B90C
	movs r0, #7
	pop {r4, pc}
_0223B6A2:
	movs r0, #3
	lsls r0, r0, #0xa
	tst r0, r1
	beq _0223B6D2
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0xff
	beq _0223B6BE
	ldr r0, _0223B6DC @ =0x000005F2
	bl FUN_0200604C
	movs r0, #4
	pop {r4, pc}
_0223B6BE:
	ldr r0, _0223B6E4 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, _0223B6EC @ =0x0000043C
	movs r1, #0
	ldr r0, [r4, r0]
	bl ov57_0223B90C
	movs r0, #5
	pop {r4, pc}
_0223B6D2:
	movs r0, #4
	pop {r4, pc}
	nop
_0223B6D8: .4byte 0x021D110C
_0223B6DC: .4byte 0x000005F2
_0223B6E0: .4byte 0x000005E2
_0223B6E4: .4byte 0x000005DD
_0223B6E8: .4byte 0x00000444
_0223B6EC: .4byte 0x0000043C
	thumb_func_end ov57_0223B620

	thumb_func_start ov57_0223B6F0
ov57_0223B6F0: @ 0x0223B6F0
	push {r3, lr}
	movs r1, #1
	movs r2, #0
	movs r3, #3
	bl ov57_0223B828
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov57_0223B6F0

	thumb_func_start ov57_0223B700
ov57_0223B700: @ 0x0223B700
	push {r4, lr}
	adds r4, r0, #0
	bl ov57_02238D80
	adds r0, r4, #0
	movs r1, #1
	bl ov57_0223866C
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov57_0223B700

	thumb_func_start ov57_0223B714
ov57_0223B714: @ 0x0223B714
	push {r4, lr}
	adds r4, r0, #0
	bl ov57_02238134
	adds r0, r4, #0
	bl ov57_0223853C
	adds r0, r4, #0
	bl ov57_022394AC
	ldr r0, [r4]
	movs r1, #1
	bl ov57_02237E88
	movs r0, #0xff
	movs r1, #5
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov57_0223B714

	thumb_func_start ov57_0223B73C
ov57_0223B73C: @ 0x0223B73C
	push {r3, lr}
	movs r1, #2
	movs r2, #0
	movs r3, #3
	bl ov57_0223B828
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov57_0223B73C

	thumb_func_start ov57_0223B74C
ov57_0223B74C: @ 0x0223B74C
	push {r3, lr}
	movs r1, #3
	movs r2, #0
	adds r3, r1, #0
	bl ov57_0223B828
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov57_0223B74C

	thumb_func_start ov57_0223B75C
ov57_0223B75C: @ 0x0223B75C
	adds r1, r0, #0
	movs r0, #0xfb
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldr r3, _0223B770 @ =FUN_0202CBDC
	lsls r0, r0, #3
	adds r0, r1, r0
	ldr r0, [r0, #8]
	adds r1, #0x68
	bx r3
	.align 2, 0
_0223B770: .4byte FUN_0202CBDC
	thumb_func_end ov57_0223B75C

	thumb_func_start ov57_0223B774
ov57_0223B774: @ 0x0223B774
	movs r1, #0xfb
	adds r2, r0, #0
	lsls r1, r1, #2
	ldr r1, [r2, r1]
	ldr r3, _0223B788 @ =FUN_0202CBDC
	lsls r1, r1, #3
	adds r1, r2, r1
	adds r0, #0x68
	ldr r1, [r1, #8]
	bx r3
	.align 2, 0
_0223B788: .4byte FUN_0202CBDC
	thumb_func_end ov57_0223B774

	thumb_func_start ov57_0223B78C
ov57_0223B78C: @ 0x0223B78C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0223B792:
	ldr r0, [r5, #0x64]
	adds r1, r4, #0
	bl FUN_0202CC5C
	adds r1, r5, r4
	adds r1, #0x80
	adds r4, r4, #1
	strb r0, [r1]
	cmp r4, #0x51
	blt _0223B792
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_0223B78C

	thumb_func_start ov57_0223B7A8
ov57_0223B7A8: @ 0x0223B7A8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0223B7AE:
	adds r2, r5, r4
	adds r2, #0x80
	ldrb r2, [r2]
	ldr r0, [r5, #0x64]
	adds r1, r4, #0
	bl FUN_0202CCA8
	adds r4, r4, #1
	cmp r4, #0x51
	blt _0223B7AE
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_0223B7A8

	thumb_func_start ov57_0223B7C4
ov57_0223B7C4: @ 0x0223B7C4
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0xfb
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	lsls r0, r0, #3
	adds r0, r5, r0
	ldr r0, [r0, #4]
	cmp r0, #0xff
	beq _0223B7EA
	ldr r2, [r5]
	lsls r0, r0, #2
	adds r0, r2, r0
	adds r1, #0x6c
	ldr r0, [r0, #4]
	ldr r1, [r5, r1]
	bl FUN_0207188C
	pop {r3, r4, r5, r6, r7, pc}
_0223B7EA:
	ldr r1, [r5]
	movs r6, #0
	ldr r0, [r1]
	cmp r0, #0
	ble _0223B820
	adds r4, r6, #0
_0223B7F6:
	adds r0, r1, r4
	ldr r7, [r0, #4]
	movs r1, #0x4c
	adds r0, r7, #0
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0223B814
	ldr r1, _0223B824 @ =0x00000458
	adds r0, r7, #0
	ldr r1, [r5, r1]
	bl FUN_0207188C
	pop {r3, r4, r5, r6, r7, pc}
_0223B814:
	ldr r1, [r5]
	adds r6, r6, #1
	ldr r0, [r1]
	adds r4, r4, #4
	cmp r6, r0
	blt _0223B7F6
_0223B820:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223B824: .4byte 0x00000458
	thumb_func_end ov57_0223B7C4

	thumb_func_start ov57_0223B828
ov57_0223B828: @ 0x0223B828
	push {r3, r4}
	cmp r2, #0xff
	bne _0223B83A
	movs r2, #1
	lsls r2, r2, #0xa
	ldr r4, [r0, r2]
	subs r2, r2, #4
	str r4, [r0, r2]
	b _0223B840
_0223B83A:
	movs r4, #0xff
	lsls r4, r4, #2
	str r2, [r0, r4]
_0223B840:
	movs r2, #0xfd
	lsls r2, r2, #2
	str r1, [r0, r2]
	adds r1, r2, #0
	adds r1, #0xc
	str r3, [r0, r1]
	movs r1, #0
	adds r2, #0x10
	str r1, [r0, r2]
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov57_0223B828

	thumb_func_start ov57_0223B858
ov57_0223B858: @ 0x0223B858
	push {r3, lr}
	cmp r1, #3
	bhi _0223B88A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223B86A: @ jump table
	.2byte _0223B872 - _0223B86A - 2 @ case 0
	.2byte _0223B882 - _0223B86A - 2 @ case 1
	.2byte _0223B87A - _0223B86A - 2 @ case 2
	.2byte _0223B882 - _0223B86A - 2 @ case 3
_0223B872:
	movs r1, #1
	bl FUN_0200DCC0
	pop {r3, pc}
_0223B87A:
	movs r1, #2
	bl FUN_0200DCC0
	pop {r3, pc}
_0223B882:
	movs r1, #0
	bl FUN_0200DCC0
	pop {r3, pc}
_0223B88A:
	bl GF_AssertFail
	pop {r3, pc}
	thumb_func_end ov57_0223B858

	thumb_func_start ov57_0223B890
ov57_0223B890: @ 0x0223B890
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r5, #0
	beq _0223B8B4
	add r1, sp, #4
	add r2, sp, #0
	bl FUN_02013794
	ldr r1, [sp, #4]
	ldr r2, [sp]
	adds r0, r5, #0
	adds r1, r1, r4
	adds r2, r2, r6
	bl FUN_020136B4
_0223B8B4:
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov57_0223B890

	thumb_func_start ov57_0223B8B8
ov57_0223B8B8: @ 0x0223B8B8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	beq _0223B8CA
	cmp r0, #6
	beq _0223B8E4
	b _0223B904
_0223B8CA:
	movs r1, #0
	ldr r0, [r4, #8]
	subs r2, r1, #1
	bl ov57_0223B890
	ldr r0, [r4, #4]
	movs r1, #2
	bl FUN_0200DCC0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0223B8E4:
	ldr r0, [r4, #8]
	movs r1, #0
	movs r2, #2
	bl ov57_0223B890
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0200DCC0
	adds r0, r5, #0
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
_0223B904:
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov57_0223B8B8

	thumb_func_start ov57_0223B90C
ov57_0223B90C: @ 0x0223B90C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #0x34
	movs r1, #0xc
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r0, #1
	str r0, [r4]
	movs r1, #0
	str r6, [r4, #4]
	adds r0, r5, #0
	subs r2, r1, #1
	str r5, [r4, #8]
	bl ov57_0223B890
	movs r2, #0xfa
	ldr r0, _0223B93C @ =ov57_0223B8B8
	adds r1, r4, #0
	lsls r2, r2, #2
	bl FUN_0200E320
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223B93C: .4byte ov57_0223B8B8
	thumb_func_end ov57_0223B90C

	thumb_func_start ov57_0223B940
ov57_0223B940: @ 0x0223B940
	movs r1, #0xa
	lsls r1, r1, #6
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov57_0223B940

	thumb_func_start ov57_0223B948
ov57_0223B948: @ 0x0223B948
	adds r0, #0xd8
	str r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov57_0223B948

	thumb_func_start ov57_0223B950
ov57_0223B950: @ 0x0223B950
	push {r4, r5, r6, lr}
	sub sp, #0x48
	ldr r1, _0223B9BC @ =0x00000458
	adds r5, r0, #0
	ldr r1, [r5, r1]
	add r0, sp, #0x38
	movs r2, #2
	bl FUN_02070124
	ldr r0, _0223B9BC @ =0x00000458
	movs r1, #5
	ldr r0, [r5, r0]
	movs r2, #0
	bl FUN_0206E540
	adds r4, r0, #0
	ldr r0, _0223B9BC @ =0x00000458
	movs r1, #2
	ldr r0, [r5, r0]
	bl FUN_0207083C
	adds r6, r0, #0
	movs r0, #0x73
	lsls r0, r0, #2
	str r6, [r5, r0]
	ldr r0, _0223B9C0 @ =0x0000045C
	lsls r2, r4, #0x10
	ldr r0, [r5, r0]
	add r1, sp, #0x10
	lsrs r2, r2, #0x10
	movs r3, #1
	bl FUN_02072914
	ldr r0, _0223B9C4 @ =0xFFFFFD80
	adds r6, #0x30
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	movs r0, #0x71
	str r1, [sp, #0xc]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0x38
	movs r2, #0xc0
	adds r3, r6, #0
	bl FUN_020085EC
	movs r1, #0x72
	lsls r1, r1, #2
	str r0, [r5, r1]
	add sp, #0x48
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223B9BC: .4byte 0x00000458
_0223B9C0: .4byte 0x0000045C
_0223B9C4: .4byte 0xFFFFFD80
	thumb_func_end ov57_0223B950

	thumb_func_start ov57_0223B9C8
ov57_0223B9C8: @ 0x0223B9C8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0223BA14 @ =0x00000458
	movs r1, #5
	ldr r0, [r5, r0]
	movs r2, #0
	bl FUN_0206E540
	adds r4, r0, #0
	ldr r0, _0223BA14 @ =0x00000458
	ldr r0, [r5, r0]
	bl FUN_0206FDFC
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02008550
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r2, #0xa1
	str r0, [sp, #8]
	ldr r0, _0223BA18 @ =0x0000045C
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	subs r2, #0xbc
	lsls r3, r4, #0x10
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	lsrs r3, r3, #0x10
	bl FUN_0207294C
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0223BA14: .4byte 0x00000458
_0223BA18: .4byte 0x0000045C
	thumb_func_end ov57_0223B9C8

	thumb_func_start ov57_0223BA1C
ov57_0223BA1C: @ 0x0223BA1C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xc
	movs r2, #0
	bl FUN_020087A4
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xd
	movs r2, #0
	bl FUN_020087A4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov57_0223BA1C

	thumb_func_start ov57_0223BA40
ov57_0223BA40: @ 0x0223BA40
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xc
	bl FUN_02008A78
	movs r1, #1
	lsls r1, r1, #8
	cmp r0, r1
	bne _0223BA5C
	movs r0, #0
	pop {r4, pc}
_0223BA5C:
	adds r1, #0xc8
	ldr r0, [r4, r1]
	movs r1, #0xc
	bl FUN_02008A78
	movs r2, #1
	lsls r2, r2, #8
	cmp r0, r2
	blt _0223BA8E
	adds r0, r2, #0
	adds r0, #0xc8
	ldr r0, [r4, r0]
	movs r1, #0xc
	bl FUN_020087A4
	movs r0, #0x72
	lsls r0, r0, #2
	movs r1, #0xd
	adds r2, r1, #0
	ldr r0, [r4, r0]
	adds r2, #0xf3
	bl FUN_020087A4
	movs r0, #0
	pop {r4, pc}
_0223BA8E:
	adds r2, #0xc8
	ldr r0, [r4, r2]
	movs r1, #0xc
	movs r2, #0x20
	bl FUN_02008C2C
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xd
	movs r2, #0x20
	bl FUN_02008C2C
	movs r1, #0x72
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_0200914C
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov57_0223BA40

	thumb_func_start ov57_0223BABC
ov57_0223BABC: @ 0x0223BABC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xc
	bl FUN_02008A78
	cmp r0, #0
	bne _0223BAD4
	movs r0, #0
	pop {r4, pc}
_0223BAD4:
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xc
	bl FUN_02008A78
	cmp r0, #0
	bgt _0223BB04
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xc
	movs r2, #0
	bl FUN_020087A4
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xd
	movs r2, #0
	bl FUN_020087A4
	movs r0, #0
	pop {r4, pc}
_0223BB04:
	movs r0, #0x72
	lsls r0, r0, #2
	movs r1, #0xc
	adds r2, r1, #0
	ldr r0, [r4, r0]
	subs r2, #0x2c
	bl FUN_02008C2C
	movs r0, #0x72
	lsls r0, r0, #2
	movs r1, #0xd
	adds r2, r1, #0
	ldr r0, [r4, r0]
	subs r2, #0x2d
	bl FUN_02008C2C
	movs r1, #0x72
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_0200914C
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov57_0223BABC

	thumb_func_start ov57_0223BB38
ov57_0223BB38: @ 0x0223BB38
	adds r2, r1, #0
	movs r1, #0x72
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	ldr r3, _0223BB48 @ =FUN_020087A4
	movs r1, #6
	bx r3
	nop
_0223BB48: .4byte FUN_020087A4
	thumb_func_end ov57_0223BB38

	thumb_func_start ov57_0223BB4C
ov57_0223BB4C: @ 0x0223BB4C
	movs r1, #0x72
	lsls r1, r1, #2
	ldr r3, _0223BB58 @ =FUN_02008780
	ldr r0, [r0, r1]
	bx r3
	nop
_0223BB58: .4byte FUN_02008780
	thumb_func_end ov57_0223BB4C

	thumb_func_start ov57_0223BB5C
ov57_0223BB5C: @ 0x0223BB5C
	push {r3, lr}
	movs r1, #0
	movs r3, #0x1f
	ldr r0, _0223BB7C @ =0x04000050
	adds r2, r1, #0
	str r3, [sp]
	blx FUN_020CF15C
	movs r1, #0
	movs r3, #0x1f
	ldr r0, _0223BB80 @ =0x04001050
	adds r2, r1, #0
	str r3, [sp]
	blx FUN_020CF15C
	pop {r3, pc}
	.align 2, 0
_0223BB7C: .4byte 0x04000050
_0223BB80: .4byte 0x04001050
	thumb_func_end ov57_0223BB5C

	thumb_func_start ov57_0223BB84
ov57_0223BB84: @ 0x0223BB84
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #4]
	add r1, sp, #0x10
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	movs r7, #0x1f
	lsls r7, r7, #4
	strb r0, [r1, #3]
	ldr r1, _0223BC40 @ =0x0223BEF4
	ldr r2, [sp, #4]
	adds r3, r7, #1
	adds r4, r7, #2
	adds r5, r7, #3
_0223BBA4:
	ldrb r6, [r1]
	adds r0, r0, #1
	strb r6, [r2, r7]
	ldrb r6, [r1, #1]
	strb r6, [r2, r3]
	ldrb r6, [r1, #2]
	strb r6, [r2, r4]
	ldrb r6, [r1, #3]
	adds r1, r1, #4
	strb r6, [r2, r5]
	adds r2, r2, #4
	cmp r0, #0xd
	blt _0223BBA4
	cmp r0, #0x15
	bge _0223BC1E
	movs r3, #0x1f
	ldr r2, [sp, #4]
	lsls r3, r3, #4
	adds r2, r2, r3
	lsls r4, r0, #2
	ldr r1, [sp, #4]
	ldr r3, [sp, #4]
	adds r1, r1, r4
	adds r2, r2, r4
	lsls r4, r0, #4
	add r5, sp, #0xc
	adds r3, r3, r4
	ldrb r4, [r5, #4]
	strb r4, [r5]
	ldrb r4, [r5, #5]
	strb r4, [r5, #1]
	ldrb r4, [r5, #6]
	strb r4, [r5, #2]
	ldrb r4, [r5, #7]
	strb r4, [r5, #3]
	ldrb r4, [r5, #2]
	ldrb r6, [r5]
	ldrb r7, [r5, #1]
	str r4, [sp, #8]
	ldrb r4, [r5, #3]
	mov ip, r4
_0223BBF6:
	movs r4, #0x1f
	lsls r4, r4, #4
	strb r6, [r1, r4]
	adds r4, r4, #1
	strb r7, [r1, r4]
	ldr r5, _0223BC44 @ =0x000001F2
	ldr r4, [sp, #8]
	adds r0, r0, #1
	strb r4, [r1, r5]
	adds r5, r5, #1
	mov r4, ip
	strb r4, [r1, r5]
	movs r4, #0xa2
	lsls r4, r4, #2
	str r2, [r3, r4]
	adds r1, r1, #4
	adds r2, r2, #4
	adds r3, #0x10
	cmp r0, #0x15
	blt _0223BBF6
_0223BC1E:
	movs r0, #0x34
	str r0, [sp]
	movs r1, #0x1f
	ldr r0, [sp, #4]
	lsls r1, r1, #4
	adds r0, r0, r1
	ldr r2, _0223BC48 @ =ov57_0223AEA8
	ldr r3, [sp, #4]
	movs r1, #0x15
	bl FUN_02026C44
	movs r2, #0x7b
	ldr r1, [sp, #4]
	lsls r2, r2, #2
	str r0, [r1, r2]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223BC40: .4byte 0x0223BEF4
_0223BC44: .4byte 0x000001F2
_0223BC48: .4byte ov57_0223AEA8
	thumb_func_end ov57_0223BB84

	thumb_func_start ov57_0223BC4C
ov57_0223BC4C: @ 0x0223BC4C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	adds r4, r5, #4
	lsls r6, r1, #3
	str r0, [sp]
	ldr r0, [r4, r6]
	cmp r0, #0xff
	beq _0223BC70
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r0, [r0, #4]
	movs r1, #0xa2
	add r2, sp, #0
	bl FUN_0206EC40
_0223BC70:
	movs r0, #0xff
	str r0, [r4, r6]
	adds r0, r5, #0
	bl ov57_022394AC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov57_0223BC4C

	.rodata

_0223BC80:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x03, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x06, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0C, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x0B
	.byte 0x00, 0x00, 0x86, 0x00, 0x1F, 0x00, 0x5A, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x13, 0x00, 0x17, 0x00, 0x4B, 0x00, 0x17, 0x00, 0x13, 0x00, 0x2F, 0x00
	.byte 0x4B, 0x00, 0x2F, 0x00, 0x13, 0x00, 0x47, 0x00, 0x4B, 0x00, 0x47, 0x00, 0x13, 0x00, 0x5F, 0x00
	.byte 0x4B, 0x00, 0x5F, 0x00, 0x18, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00
	.byte 0x49, 0x00, 0x00, 0x00, 0x4B, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0xF0, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x00, 0x17, 0x00, 0x14, 0x00, 0x2F, 0x00
	.byte 0x14, 0x00, 0x47, 0x00, 0x14, 0x00, 0x5F, 0x00, 0x4C, 0x00, 0x17, 0x00, 0x4C, 0x00, 0x2F, 0x00
	.byte 0x4C, 0x00, 0x47, 0x00, 0x4C, 0x00, 0x5F, 0x00, 0x1B, 0x00, 0x7C, 0x00, 0x43, 0x00, 0x7C, 0x00
	.byte 0x20, 0x00, 0xAB, 0x00, 0x68, 0x00, 0xAB, 0x00, 0xC0, 0x00, 0xAB, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x0D, 0x00, 0x0A, 0x00
	.byte 0x0D, 0x00, 0x0A, 0x00, 0x10, 0x00, 0x0C, 0x00, 0x1C, 0x00, 0x0C, 0x00, 0x1C, 0x00, 0x0C, 0x00
	.byte 0xA8, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x05, 0xA1, 0x23, 0x02, 0x1D, 0xA3, 0x23, 0x02
	.byte 0x05, 0xA5, 0x23, 0x02, 0xAD, 0xA5, 0x23, 0x02, 0xB5, 0xA6, 0x23, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0xF1, 0xB6, 0x23, 0x02, 0x01, 0x00, 0x00, 0x00, 0x01, 0xB7, 0x23, 0x02, 0x02, 0x00, 0x00, 0x00
	.byte 0x15, 0xB7, 0x23, 0x02, 0x03, 0x00, 0x00, 0x00, 0x3D, 0xB7, 0x23, 0x02, 0x04, 0x00, 0x00, 0x00
	.byte 0x4D, 0xB7, 0x23, 0x02, 0x10, 0x20, 0x08, 0x18, 0x10, 0x20, 0x40, 0x50, 0x28, 0x38, 0x08, 0x18
	.byte 0x28, 0x38, 0x40, 0x50, 0x40, 0x50, 0x08, 0x18, 0x40, 0x50, 0x40, 0x50, 0x58, 0x68, 0x08, 0x18
	.byte 0x58, 0x68, 0x40, 0x50, 0x68, 0x80, 0x08, 0x30, 0x68, 0x80, 0x38, 0x60, 0xA8, 0xBC, 0x12, 0x4D
	.byte 0xA8, 0xBC, 0x61, 0x9C, 0xA8, 0xBC, 0xB2, 0xED

	.sinit

	.word ov57_022378C0
