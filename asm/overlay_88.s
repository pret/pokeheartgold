
	thumb_func_start ov88_02258800
ov88_02258800: @ 0x02258800
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl FUN_020072A4
	movs r2, #5
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x72
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r1, #0x27
	adds r0, r4, #0
	lsls r1, r1, #4
	movs r2, #0x72
	bl FUN_02007280
	movs r2, #0x27
	movs r1, #0
	lsls r2, r2, #4
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r0, [r5]
	movs r1, #0x72
	str r0, [r4]
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	adds r0, r4, #0
	adds r0, #8
	bl ov88_02258ABC
	movs r0, #0x53
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #8
	movs r2, #0x72
	bl ov88_02258D64
	ldr r0, [r4, #4]
	adds r1, r4, #0
	str r0, [sp]
	ldr r0, [r5, #8]
	movs r2, #0x72
	str r0, [sp, #4]
	str r2, [sp, #8]
	adds r0, r2, #0
	adds r0, #0xe2
	adds r2, #0xda
	ldr r3, [r4]
	adds r0, r4, r0
	adds r1, #8
	adds r2, r4, r2
	bl ov88_02258EA8
	ldr r0, [r5, #8]
	adds r1, r4, #0
	str r0, [sp]
	movs r2, #0x72
	str r2, [sp, #4]
	adds r0, r2, #0
	adds r0, #0xee
	adds r2, #0xda
	ldr r3, [r4]
	adds r0, r4, r0
	adds r1, #8
	adds r2, r4, r2
	bl ov88_022590C0
	movs r0, #0x59
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #8
	movs r2, #0x72
	bl ov88_022592EC
	movs r0, #2
	lsls r0, r0, #8
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #8
	movs r2, #0x72
	bl ov88_0225967C
	ldr r0, _022588C0 @ =ov88_02258A64
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_022588C0: .4byte ov88_02258A64
	thumb_func_end ov88_02258800

	thumb_func_start ov88_022588C4
ov88_022588C4: @ 0x022588C4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_020072A4
	adds r6, r0, #0
	ldr r0, [r5]
	cmp r0, #4
	bls _022588E2
	b _022589EA
_022588E2:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022588EE: @ jump table
	.2byte _022588F8 - _022588EE - 2 @ case 0
	.2byte _0225891E - _022588EE - 2 @ case 1
	.2byte _0225892E - _022588EE - 2 @ case 2
	.2byte _022589BC - _022588EE - 2 @ case 3
	.2byte _022589DC - _022588EE - 2 @ case 4
_022588F8:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x72
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r6, #8]
	movs r1, #1
	bl FUN_0222A520
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022589EA
_0225891E:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _022589EA
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022589EA
_0225892E:
	ldr r0, _022589F8 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	bne _0225894A
	ldr r0, [r6, #8]
	bl FUN_0222A330
	cmp r0, #1
	beq _0225894A
	bl FUN_0222D844
	cmp r0, #1
	bne _02258960
_0225894A:
	ldr r0, [r6, #8]
	bl FUN_0222A330
	cmp r0, #1
	bne _0225895A
	ldr r0, [r6, #8]
	bl FUN_0222A4A8
_0225895A:
	movs r0, #3
	str r0, [r5]
	b _022589EA
_02258960:
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r1, [r4]
	ldr r2, [r4, #4]
	adds r0, r4, r0
	bl ov88_02258EFC
	cmp r0, #1
	bne _0225897E
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r4, r0
	movs r1, #1
	bl ov88_02259818
_0225897E:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r1, [r4]
	adds r0, r4, r0
	bl ov88_022590D8
	cmp r0, #1
	bne _0225899A
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r4, r0
	movs r1, #2
	bl ov88_02259818
_0225899A:
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r1, [r4]
	ldr r2, [r6, #8]
	adds r0, r4, r0
	movs r3, #0x72
	bl ov88_02259404
	cmp r0, #1
	bne _022589EA
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r4, r0
	movs r1, #3
	bl ov88_02259818
	b _022589EA
_022589BC:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x72
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _022589EA
_022589DC:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _022589EA
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_022589EA:
	ldr r1, [r6, #8]
	adds r0, r4, #0
	bl ov88_02258A70
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_022589F8: .4byte 0x021D110C
	thumb_func_end ov88_022588C4

	thumb_func_start ov88_022589FC
ov88_022589FC: @ 0x022589FC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_020072A4
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r4, r0
	bl ov88_022597DC
	movs r0, #0x55
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov88_02258EF8
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov88_022590D4
	movs r0, #0x59
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov88_022593D0
	movs r0, #0x53
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov88_02258D84
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	adds r4, #8
	adds r0, r4, #0
	bl ov88_02258AF4
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x72
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov88_022589FC

	thumb_func_start ov88_02258A64
ov88_02258A64: @ 0x02258A64
	ldr r3, _02258A6C @ =ov88_02258B20
	adds r0, #8
	bx r3
	nop
_02258A6C: .4byte ov88_02258B20
	thumb_func_end ov88_02258A64

	thumb_func_start ov88_02258A70
ov88_02258A70: @ 0x02258A70
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0x55
	adds r5, r0, #0
	lsls r1, r1, #2
	adds r0, r5, r1
	subs r1, #8
	adds r2, r5, #0
	adds r1, r5, r1
	adds r2, #8
	bl ov88_02258F60
	movs r1, #0x16
	str r4, [sp]
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0x14
	adds r2, r5, #0
	ldr r3, [r5]
	adds r1, r5, r1
	adds r2, #8
	bl ov88_02259104
	movs r0, #0x59
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov88_022594E0
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r5, r0
	bl ov88_02259800
	adds r5, #8
	adds r0, r5, #0
	bl ov88_02258B14
	pop {r3, r4, r5, pc}
	thumb_func_end ov88_02258A70

	thumb_func_start ov88_02258ABC
ov88_02258ABC: @ 0x02258ABC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xc6
	adds r4, r1, #0
	bl FUN_02007688
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #0x30
	adds r1, r4, #0
	bl FUN_0202055C
	ldr r0, _02258AF0 @ =0x02259958
	bl FUN_02022BE8
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov88_02258B34
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov88_02258C98
	pop {r3, r4, r5, pc}
	nop
_02258AF0: .4byte 0x02259958
	thumb_func_end ov88_02258ABC

	thumb_func_start ov88_02258AF4
ov88_02258AF4: @ 0x02258AF4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0200770C
	bl FUN_020205AC
	adds r0, r4, #0
	bl ov88_02258C60
	adds r0, r4, #0
	bl ov88_02258D38
	pop {r4, pc}
	thumb_func_end ov88_02258AF4

	thumb_func_start ov88_02258B14
ov88_02258B14: @ 0x02258B14
	ldr r3, _02258B1C @ =FUN_0202457C
	ldr r0, [r0, #4]
	bx r3
	nop
_02258B1C: .4byte FUN_0202457C
	thumb_func_end ov88_02258B14

	thumb_func_start ov88_02258B20
ov88_02258B20: @ 0x02258B20
	push {r3, lr}
	ldr r0, [r0]
	bl FUN_0201EEB4
	bl FUN_0200B224
	bl FUN_0202061C
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov88_02258B20

	thumb_func_start ov88_02258B34
ov88_02258B34: @ 0x02258B34
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, _02258C50 @ =0x02259934
	adds r7, r1, #0
	bl FUN_0201ACB0
	adds r0, r7, #0
	bl FUN_0201AC88
	str r0, [r5]
	ldr r0, _02258C54 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #0
	ldr r6, _02258C58 @ =0x022599C0
	ldr r4, _02258C5C @ =0x02259944
	str r0, [sp, #0x10]
_02258B5C:
	ldr r1, [r4]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4]
	movs r1, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	adds r3, r7, #0
	bl FUN_0201C1C4
	ldr r1, [r4]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	ldr r0, [sp, #0x10]
	adds r6, #0x1c
	adds r0, r0, #1
	adds r4, r4, #4
	str r0, [sp, #0x10]
	cmp r0, #5
	blt _02258B5C
	movs r1, #0
	str r1, [sp]
	movs r0, #5
	str r7, [sp, #4]
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02007B8C
	movs r1, #5
	movs r0, #0
	lsls r1, r1, #6
	adds r2, r7, #0
	bl FUN_0200304C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #5
	str r7, [sp, #0xc]
	lsls r0, r0, #6
	movs r1, #1
	ldr r0, [r5, r0]
	ldr r2, [r5]
	adds r3, r1, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #5
	str r7, [sp, #0xc]
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5]
	movs r1, #3
	movs r3, #1
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #5
	str r7, [sp, #0xc]
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5]
	movs r1, #4
	movs r3, #2
	bl FUN_02007B68
	movs r1, #0
	str r1, [sp]
	movs r0, #5
	str r7, [sp, #4]
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r2, #4
	adds r3, r1, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #5
	str r7, [sp, #0xc]
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5]
	movs r1, #2
	movs r3, #4
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #5
	str r7, [sp, #0xc]
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5]
	movs r1, #6
	movs r3, #4
	bl FUN_02007B68
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02258C50: .4byte 0x02259934
_02258C54: .4byte 0x021D116C
_02258C58: .4byte 0x022599C0
_02258C5C: .4byte 0x02259944
	thumb_func_end ov88_02258B34

	thumb_func_start ov88_02258C60
ov88_02258C60: @ 0x02258C60
	push {r4, r5, r6, lr}
	ldr r5, _02258C90 @ =0x02259944
	adds r6, r0, #0
	movs r4, #0
_02258C68:
	ldr r1, [r5]
	ldr r0, [r6]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB4C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #5
	blt _02258C68
	ldr r0, [r6]
	bl FUN_0201AB0C
	ldr r0, _02258C94 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	pop {r4, r5, r6, pc}
	nop
_02258C90: .4byte 0x02259944
_02258C94: .4byte 0x021D116C
	thumb_func_end ov88_02258C60

	thumb_func_start ov88_02258C98
ov88_02258C98: @ 0x02258C98
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
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
	ldr r0, _02258D30 @ =0x02259914
	ldr r1, _02258D34 @ =0x00200010
	movs r2, #0x10
	bl FUN_020215C0
	movs r0, #0x20
	adds r1, r6, #0
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	ldr r1, _02258D34 @ =0x00200010
	movs r0, #1
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	adds r1, r5, #0
	movs r0, #0x20
	adds r1, #8
	adds r2, r6, #0
	bl FUN_02009F40
	str r0, [r5, #4]
	adds r0, r5, #0
	movs r2, #1
	adds r0, #8
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r7, #0x13
	movs r4, #0
	lsls r7, r7, #4
_02258D04:
	movs r0, #0x20
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0200A090
	str r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02258D04
	bl FUN_0203A880
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02258D30: .4byte 0x02259914
_02258D34: .4byte 0x00200010
	thumb_func_end ov88_02258C98

	thumb_func_start ov88_02258D38
ov88_02258D38: @ 0x02258D38
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	bl FUN_02024504
	movs r6, #0x13
	movs r4, #0
	lsls r6, r6, #4
_02258D48:
	ldr r0, [r5, r6]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02258D48
	bl FUN_0202168C
	bl FUN_02022608
	bl FUN_0200B244
	pop {r4, r5, r6, pc}
	thumb_func_end ov88_02258D38

	thumb_func_start ov88_02258D64
ov88_02258D64: @ 0x02258D64
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #5
	str r2, [sp]
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	movs r1, #5
	movs r2, #0
	adds r3, r4, #4
	bl FUN_02007C2C
	str r0, [r4]
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov88_02258D64

	thumb_func_start ov88_02258D84
ov88_02258D84: @ 0x02258D84
	ldr r3, _02258D8C @ =FUN_0201AB0C
	ldr r0, [r0]
	bx r3
	nop
_02258D8C: .4byte FUN_0201AB0C
	thumb_func_end ov88_02258D84

	thumb_func_start ov88_02258D90
ov88_02258D90: @ 0x02258D90
	push {r3, r4, lr}
	sub sp, #0x1c
	ldr r0, [r0, #4]
	adds r4, r1, #0
	movs r1, #1
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	adds r1, r2, #6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	adds r2, r3, #5
	lsls r2, r2, #0x18
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	add r3, sp, #0x18
	movs r1, #3
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldrb r3, [r3, #0x10]
	ldr r0, [r4]
	lsrs r2, r2, #0x18
	lsls r3, r3, #1
	adds r3, r3, #4
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201C4EC
	ldr r0, [r4]
	movs r1, #3
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end ov88_02258D90

	thumb_func_start ov88_02258DE8
ov88_02258DE8: @ 0x02258DE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [sp, #0x38]
	movs r1, #3
	adds r7, r2, #0
	adds r6, r3, #0
	blx FUN_020F2BA4
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x38]
	movs r1, #3
	blx FUN_020F2BA4
	ldr r1, [sp, #0x44]
	cmp r1, #0
	beq _02258E0E
	adds r0, r0, #2
_02258E0E:
	ldr r1, [sp, #0x3c]
	cmp r1, #1
	bne _02258E16
	adds r0, r0, #1
_02258E16:
	ldr r1, [r4, #4]
	lsls r2, r6, #1
	adds r6, r2, #4
	movs r2, #2
	str r2, [sp]
	str r2, [sp, #4]
	adds r2, r1, #0
	adds r2, #0xc
	str r2, [sp, #8]
	ldr r2, [sp, #0x1c]
	lsls r0, r0, #0x19
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	ldrh r0, [r1]
	lsls r4, r7, #1
	adds r4, #0x15
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r1, #2]
	lsls r2, r4, #0x18
	lsls r3, r6, #0x18
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	movs r1, #3
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201C4EC
	ldr r0, [sp, #0x48]
	cmp r0, #0
	beq _02258E7C
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	lsls r2, r4, #0x18
	lsls r3, r6, #0x18
	ldr r0, [r5]
	movs r1, #3
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201CA4C
	b _02258E9A
_02258E7C:
	ldr r0, [sp, #0x40]
	cmp r0, #0
	beq _02258E9A
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #3
	str r1, [sp, #8]
	lsls r2, r4, #0x18
	lsls r3, r6, #0x18
	ldr r0, [r5]
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201CA4C
_02258E9A:
	ldr r0, [r5]
	movs r1, #3
	bl FUN_0201EFBC
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov88_02258DE8

	thumb_func_start ov88_02258EA8
ov88_02258EA8: @ 0x02258EA8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [sp, #0x1c]
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0222AD4C
	movs r1, #0
	strb r1, [r5]
	movs r1, #0x3c
	str r0, [sp]
	blx FUN_020F2BA4
	adds r0, r0, #1
	strb r0, [r5, #1]
	movs r0, #0
	strb r0, [r5, #2]
	ldr r0, [sp]
	movs r1, #0x28
	blx FUN_020F2BA4
	str r0, [r5, #8]
	movs r0, #1
	strb r0, [r5, #4]
	movs r0, #0
	strh r0, [r5, #6]
	strb r0, [r5, #5]
	ldr r2, [sp, #0x18]
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov88_02258EFC
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov88_02258F60
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov88_02258EA8

	thumb_func_start ov88_02258EF8
ov88_02258EF8: @ 0x02258EF8
	bx lr
	.align 2, 0
	thumb_func_end ov88_02258EF8

	thumb_func_start ov88_02258EFC
ov88_02258EFC: @ 0x02258EFC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r1, #0
	add r1, sp, #8
	adds r6, r2, #0
	movs r4, #0
	bl FUN_0222DCF4
	cmp r0, #0
	bne _02258F18
	add sp, #0xc
	adds r0, r4, #0
	pop {r3, r4, r5, r6, pc}
_02258F18:
	ldrb r0, [r5, #4]
	cmp r0, #1
	bne _02258F26
	adds r0, r4, #0
	strb r0, [r5, #4]
	movs r4, #1
	strb r4, [r5, #5]
_02258F26:
	adds r0, r6, #0
	add r1, sp, #8
	add r2, sp, #4
	bl FUN_0222D594
	add r0, sp, #4
	adds r1, r5, #0
	add r2, sp, #0
	bl FUN_0222D594
	add r0, sp, #0
	ldrb r2, [r0, #2]
	ldr r1, [r5, #8]
	cmp r2, r1
	bhs _02258F50
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _02258F50
	ldrb r0, [r0]
	cmp r0, #0
	beq _02258F58
_02258F50:
	movs r4, #1
	strb r4, [r5, #5]
	ldr r0, [sp, #4]
	str r0, [r5]
_02258F58:
	adds r0, r4, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov88_02258EFC

	thumb_func_start ov88_02258F60
ov88_02258F60: @ 0x02258F60
	push {r3, lr}
	ldrb r3, [r0, #4]
	cmp r3, #1
	bne _02258F6E
	bl ov88_02258F74
	pop {r3, pc}
_02258F6E:
	bl ov88_02258F88
	pop {r3, pc}
	thumb_func_end ov88_02258F60

	thumb_func_start ov88_02258F74
ov88_02258F74: @ 0x02258F74
	ldrh r1, [r0, #6]
	adds r1, r1, #1
	strh r1, [r0, #6]
	ldrh r1, [r0, #6]
	cmp r1, #0x10
	bls _02258F84
	movs r1, #0
	strh r1, [r0, #6]
_02258F84:
	bx lr
	.align 2, 0
	thumb_func_end ov88_02258F74

	thumb_func_start ov88_02258F88
ov88_02258F88: @ 0x02258F88
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r4, r0, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	ldrb r1, [r4, #1]
	movs r0, #0x3c
	ldrb r2, [r4, #2]
	muls r0, r1, r0
	ldrb r1, [r4]
	adds r2, r2, r0
	movs r0, #0xe1
	lsls r0, r0, #4
	muls r0, r1, r0
	ldr r1, [r4, #8]
	adds r0, r2, r0
	blx FUN_020F2BA4
	ldrb r1, [r4, #5]
	adds r5, r0, #0
	cmp r1, #0
	beq _02259036
	movs r2, #0
	strh r2, [r4, #6]
	strb r2, [r4, #5]
	movs r0, #4
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	str r2, [sp, #0xc]
	ldr r0, [r0]
	movs r1, #3
	movs r3, #5
	bl FUN_0201C8C4
	ldr r0, [sp, #0x14]
	movs r1, #3
	ldr r0, [r0]
	bl FUN_0201EFBC
	movs r0, #0
	str r0, [sp, #0x1c]
_02258FE2:
	ldr r0, [sp, #0x1c]
	movs r1, #3
	subs r6, r1, r0
	movs r0, #0xa
	adds r7, r6, #0
	muls r7, r0, r7
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0
	str r0, [sp, #0x20]
_02258FF6:
	movs r0, #9
	subs r3, r0, r4
	adds r0, r3, r7
	cmp r0, r5
	blo _02259022
	cmp r0, r5
	bne _02259008
	movs r2, #1
	b _02259012
_02259008:
	cmp r6, #3
	bne _02259010
	movs r2, #2
	b _02259012
_02259010:
	movs r2, #0
_02259012:
	ldr r0, [sp, #0x20]
	lsls r3, r3, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsrs r3, r3, #0x18
	bl ov88_02258D90
_02259022:
	adds r4, r4, #1
	cmp r4, #0xa
	blt _02258FF6
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #4
	blt _02258FE2
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_02259036:
	cmp r5, #0x28
	bhs _022590B8
	ldrh r1, [r4, #6]
	adds r1, r1, #1
	strh r1, [r4, #6]
	ldrh r6, [r4, #6]
	movs r1, #0x1b
	lsrs r3, r6, #0x1f
	lsls r2, r6, #0x1b
	subs r2, r2, r3
	rors r2, r1
	movs r1, #0xa
	adds r7, r3, r2
	blx FUN_020F2BA4
	str r1, [sp, #0x18]
	adds r0, r5, #0
	movs r1, #0xa
	blx FUN_020F2BA4
	cmp r7, #0
	bne _0225909E
	ldr r2, [r4, #8]
	movs r1, #0x1e
	muls r1, r2, r1
	lsrs r4, r1, #2
	movs r2, #6
	movs r5, #0
_0225906E:
	adds r1, r5, #1
	adds r3, r4, #0
	muls r3, r1, r3
	cmp r3, r6
	bls _02259080
	ldr r1, _022590BC @ =0x02259924
	lsls r2, r5, #2
	ldr r2, [r1, r2]
	b _02259086
_02259080:
	adds r5, r1, #0
	cmp r1, #4
	blt _0225906E
_02259086:
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x18]
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsrs r3, r3, #0x18
	bl ov88_02258D90
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0225909E:
	cmp r7, #0x10
	bne _022590B8
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x18]
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	movs r2, #3
	lsrs r3, r3, #0x18
	bl ov88_02258D90
_022590B8:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022590BC: .4byte 0x02259924
	thumb_func_end ov88_02258F88

	thumb_func_start ov88_022590C0
ov88_022590C0: @ 0x022590C0
	push {r3, lr}
	movs r0, #0
	str r0, [sp]
	adds r0, r2, #0
	adds r2, r3, #0
	ldr r3, [sp, #8]
	bl ov88_0225918C
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov88_022590C0

	thumb_func_start ov88_022590D4
ov88_022590D4: @ 0x022590D4
	bx lr
	.align 2, 0
	thumb_func_end ov88_022590D4

	thumb_func_start ov88_022590D8
ov88_022590D8: @ 0x022590D8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	movs r5, #0
	bl FUN_0222DD38
	cmp r0, #0
	beq _022590FE
	cmp r0, #1
	beq _022590F2
	cmp r0, #2
	beq _022590F8
	b _022590FE
_022590F2:
	movs r5, #1
	strh r5, [r4, #2]
	b _022590FE
_022590F8:
	movs r0, #3
	strh r0, [r4, #2]
	movs r5, #1
_022590FE:
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov88_022590D8

	thumb_func_start ov88_02259104
ov88_02259104: @ 0x02259104
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #4
	bhi _02259186
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225911C: @ jump table
	.2byte _02259186 - _0225911C - 2 @ case 0
	.2byte _02259126 - _0225911C - 2 @ case 1
	.2byte _02259132 - _0225911C - 2 @ case 2
	.2byte _02259158 - _0225911C - 2 @ case 3
	.2byte _02259164 - _0225911C - 2 @ case 4
_02259126:
	movs r0, #2
	strh r0, [r4, #2]
	movs r0, #0
	add sp, #4
	strh r0, [r4]
	pop {r3, r4, pc}
_02259132:
	movs r0, #0
	ldrsh r0, [r4, r0]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, [sp, #0x10]
	bl ov88_02259244
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4]
	ldrsh r1, [r4, r0]
	cmp r1, #0x20
	blt _02259186
	add sp, #4
	strh r0, [r4, #2]
	pop {r3, r4, pc}
_02259158:
	movs r0, #4
	strh r0, [r4, #2]
	movs r0, #0
	add sp, #4
	strh r0, [r4]
	pop {r3, r4, pc}
_02259164:
	movs r0, #0
	ldrsh r0, [r4, r0]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, [sp, #0x10]
	bl ov88_02259264
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4]
	ldrsh r1, [r4, r0]
	cmp r1, #0x20
	blt _02259186
	strh r0, [r4, #2]
_02259186:
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov88_02259104

	thumb_func_start ov88_0225918C
ov88_0225918C: @ 0x0225918C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #0x14]
	movs r0, #4
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #8
	adds r6, r2, #0
	str r0, [sp, #8]
	movs r2, #0
	str r3, [sp, #0x1c]
	str r2, [sp, #0xc]
	adds r0, r1, #0
	str r1, [sp, #0x18]
	ldr r0, [r0]
	movs r1, #3
	movs r3, #0x15
	ldr r7, [sp, #0x50]
	bl FUN_0201C8C4
	movs r5, #0
	str r5, [sp, #0x2c]
_022591BA:
	ldr r0, [sp, #0x2c]
	movs r4, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x34]
_022591C4:
	adds r0, r6, #0
	adds r1, r4, r5
	bl FUN_0222DCFC
	cmp r0, #0
	beq _0225922E
	adds r0, r6, #0
	adds r1, r4, r5
	bl FUN_0222DD08
	str r0, [sp, #0x28]
	adds r0, r6, #0
	adds r1, r4, r5
	bl FUN_0222DD14
	str r0, [sp, #0x24]
	adds r0, r6, #0
	adds r1, r4, r5
	bl FUN_0222DD20
	str r0, [sp, #0x20]
	adds r0, r6, #0
	adds r1, r4, r5
	bl FUN_0222DD2C
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x1c]
	adds r1, r4, r5
	bl FUN_0222AB28
	cmp r7, #2
	bne _0225920E
	ldr r1, [sp, #0x30]
	cmp r1, #1
	bne _0225920E
	movs r1, #0
	b _02259210
_0225920E:
	adds r1, r7, #0
_02259210:
	str r1, [sp]
	ldr r1, [sp, #0x28]
	lsls r2, r4, #0x18
	str r1, [sp, #4]
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x34]
	str r1, [sp, #8]
	ldr r1, [sp, #0x20]
	lsrs r2, r2, #0x18
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl ov88_02258DE8
_0225922E:
	adds r4, r4, #1
	cmp r4, #5
	blt _022591C4
	ldr r0, [sp, #0x2c]
	adds r5, r5, #5
	adds r0, r0, #1
	str r0, [sp, #0x2c]
	cmp r0, #4
	blt _022591BA
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov88_0225918C

	thumb_func_start ov88_02259244
ov88_02259244: @ 0x02259244
	push {r3, r4, r5, lr}
	ldr r5, [sp, #0x10]
	movs r4, #7
	tst r4, r5
	bne _02259262
	lsrs r5, r5, #3
	movs r4, #1
	tst r4, r5
	bne _0225925A
	movs r4, #2
	b _0225925C
_0225925A:
	movs r4, #0
_0225925C:
	str r4, [sp]
	bl ov88_0225918C
_02259262:
	pop {r3, r4, r5, pc}
	thumb_func_end ov88_02259244

	thumb_func_start ov88_02259264
ov88_02259264: @ 0x02259264
	push {r3, r4, r5, lr}
	ldr r5, [sp, #0x10]
	movs r4, #7
	tst r4, r5
	bne _0225927E
	lsrs r4, r5, #3
	movs r5, #1
	tst r4, r5
	beq _02259278
	movs r5, #0
_02259278:
	str r5, [sp]
	bl ov88_0225918C
_0225927E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov88_02259264

	thumb_func_start ov88_02259280
ov88_02259280: @ 0x02259280
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp]
	movs r4, #0
_0225928C:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl FUN_0222DDE4
	adds r1, r0, #0
	cmp r1, #0x14
	beq _022592B0
	ldr r0, [sp]
	bl FUN_0222AB28
	cmp r0, #1
	bne _022592AC
	movs r0, #9
	strb r0, [r5, r4]
	b _022592B0
_022592AC:
	movs r0, #5
	strb r0, [r5, r4]
_022592B0:
	adds r4, r4, #1
	cmp r4, #4
	blt _0225928C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov88_02259280

	thumb_func_start ov88_022592B8
ov88_022592B8: @ 0x022592B8
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	lsls r6, r2, #5
	ldr r7, [r1, #0xc]
	str r0, [sp]
	adds r5, r4, #0
	adds r6, #0xa
_022592C6:
	ldr r2, [sp]
	movs r0, #0xf
	ldrb r2, [r2, r4]
	adds r1, r6, r5
	movs r3, #4
	lsls r2, r2, #1
	adds r2, #0xe0
	adds r2, r7, r2
	bl FUN_020205D8
	cmp r0, #0
	bne _022592E2
	bl GF_AssertFail
_022592E2:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _022592C6
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov88_022592B8

	thumb_func_start ov88_022592EC
ov88_022592EC: @ 0x022592EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	movs r7, #3
	adds r5, r0, #0
	ldr r6, _022593C4 @ =_02259904
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	str r2, [sp, #0x1c]
	movs r4, #0
	str r0, [sp, #0x20]
	lsls r7, r7, #8
	adds r5, #0x60
_02259304:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r2, r4, #0
	bl ov88_02259508
	ldrb r0, [r6]
	adds r1, r5, #0
	movs r2, #3
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	adds r0, r4, #7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	movs r3, #1
	ldr r0, [r0]
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	bl FUN_0201D5C8
	ldr r0, [sp, #0x20]
	adds r4, r4, #1
	adds r0, #0x20
	str r0, [sp, #0x20]
	adds r7, #0x3c
	adds r6, r6, #1
	adds r5, #0x10
	cmp r4, #3
	blt _02259304
	movs r0, #1
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #8
	bl FUN_02026354
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x14]
	adds r1, #0x90
	str r0, [r1]
	movs r1, #5
	ldr r0, [sp, #0x18]
	lsls r1, r1, #6
	ldr r0, [r0, r1]
	ldr r3, [sp, #0x1c]
	movs r1, #0
	adds r2, #0x98
	bl FUN_02007C48
	ldr r1, [sp, #0x14]
	movs r2, #4
	adds r1, #0x94
	str r0, [r1]
	ldr r1, [sp, #0x14]
	movs r0, #0
	adds r1, #0x98
	ldr r1, [r1]
	movs r3, #0xfa
	ldr r1, [r1, #0xc]
	adds r1, #0xee
	bl FUN_0201C260
	ldr r1, [sp, #0x14]
	ldr r3, _022593C8 @ =0x0000011A
	adds r1, #0x98
	ldr r1, [r1]
	movs r0, #0
	ldr r1, [r1, #0xc]
	movs r2, #4
	adds r1, #0xee
	bl FUN_0201C260
	ldr r1, [sp, #0x14]
	ldr r3, _022593CC @ =0x0000013A
	adds r1, #0x98
	str r1, [sp, #0x14]
	ldr r1, [r1]
	movs r0, #0
	ldr r1, [r1, #0xc]
	movs r2, #4
	adds r1, #0xee
	bl FUN_0201C260
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022593C4: .4byte _02259904
_022593C8: .4byte 0x0000011A
_022593CC: .4byte 0x0000013A
	thumb_func_end ov88_022592EC

	thumb_func_start ov88_022593D0
ov88_022593D0: @ 0x022593D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl FUN_02026380
	adds r4, r5, #0
	movs r6, #0
	adds r4, #0x60
_022593EC:
	adds r0, r4, #0
	bl FUN_0201D520
	adds r0, r5, #0
	bl ov88_0225954C
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, #0x20
	cmp r6, #3
	blt _022593EC
	pop {r4, r5, r6, pc}
	thumb_func_end ov88_022593D0

	thumb_func_start ov88_02259404
ov88_02259404: @ 0x02259404
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	add r1, sp, #0x14
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl FUN_0222AB38
	movs r0, #2
	adds r4, r6, #0
	ldr r7, _022594DC @ =0x02259910
	str r0, [sp, #0xc]
	adds r4, #0x40
_02259422:
	ldrb r0, [r4]
	cmp r0, #0
	beq _02259458
	adds r0, r4, #0
	bl ov88_022595E4
	cmp r0, #1
	bne _02259458
	ldr r0, [sp, #0xc]
	adds r1, r0, #1
	cmp r1, #3
	bge _02259452
	adds r0, r6, #0
	adds r0, #0x98
	ldr r0, [r0]
	adds r3, r4, #0
	str r0, [sp]
	lsls r0, r1, #5
	ldr r1, [r4, #8]
	ldr r2, [r7, #4]
	adds r0, r6, r0
	adds r3, #0x1c
	bl ov88_02259560
_02259452:
	adds r0, r4, #0
	bl ov88_022595DC
_02259458:
	ldr r0, [sp, #0xc]
	subs r4, #0x20
	subs r7, r7, #4
	subs r0, r0, #1
	str r0, [sp, #0xc]
	bpl _02259422
	ldrb r0, [r6]
	cmp r0, #0
	bne _022594D6
	adds r0, r5, #0
	bl FUN_0222DD44
	cmp r0, #1
	bne _022594D6
	add r7, sp, #0x14
_02259476:
	adds r0, r5, #0
	bl FUN_0222DD5C
	adds r4, r0, #0
	ldr r0, [sp, #8]
	adds r3, r6, #0
	str r0, [sp]
	adds r3, #0x90
	ldr r3, [r3]
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl FUN_0222DD78
	cmp r0, #1
	bne _022594C6
	ldr r3, [sp, #4]
	add r0, sp, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl ov88_02259280
	adds r0, r6, #0
	adds r0, #0x98
	ldr r0, [r0]
	movs r2, #0x15
	str r0, [sp]
	adds r0, r6, #0
	adds r6, #0x90
	ldr r1, [r6]
	lsls r2, r2, #4
	add r3, sp, #0x10
	bl ov88_02259560
	adds r0, r5, #0
	bl FUN_0222DCE8
	add sp, #0x28
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022594C6:
	adds r0, r5, #0
	bl FUN_0222DCE8
	adds r0, r5, #0
	bl FUN_0222DD44
	cmp r0, #1
	beq _02259476
_022594D6:
	movs r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022594DC: .4byte 0x02259910
	thumb_func_end ov88_02259404

	thumb_func_start ov88_022594E0
ov88_022594E0: @ 0x022594E0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	movs r7, #0
	adds r4, #0x60
	adds r5, r6, #0
_022594EC:
	ldrb r0, [r6]
	cmp r0, #1
	bne _022594FA
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov88_022595F8
_022594FA:
	adds r7, r7, #1
	adds r6, #0x20
	adds r4, #0x10
	adds r5, #0x20
	cmp r7, #3
	blt _022594EC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov88_022594E0

	thumb_func_start ov88_02259508
ov88_02259508: @ 0x02259508
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0
	strb r0, [r5]
	strh r0, [r5, #2]
	movs r0, #1
	adds r4, r1, #0
	adds r6, r2, #0
	lsls r0, r0, #8
	adds r1, r3, #0
	bl FUN_02026354
	str r0, [r5, #8]
	adds r0, r6, #7
	strb r0, [r5, #1]
	movs r3, #0
	adds r5, #0xc
	str r3, [sp]
	movs r0, #0xb4
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #7
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r4]
	adds r1, r5, #0
	movs r2, #3
	bl FUN_0201D40C
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov88_02259508

	thumb_func_start ov88_0225954C
ov88_0225954C: @ 0x0225954C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02026380
	adds r4, #0xc
	adds r0, r4, #0
	bl FUN_0201D520
	pop {r4, pc}
	thumb_func_end ov88_0225954C

	thumb_func_start ov88_02259560
ov88_02259560: @ 0x02259560
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #8]
	adds r7, r1, #0
	adds r6, r2, #0
	adds r4, r3, #0
	bl FUN_020263D4
	movs r0, #1
	strb r0, [r5]
	movs r2, #0
	strh r2, [r5, #2]
	strh r6, [r5, #4]
	adds r1, r7, #0
	bl FUN_02002F30
	strh r0, [r5, #6]
	movs r0, #1
	ldrh r1, [r5, #6]
	lsls r0, r0, #8
	adds r0, r1, r0
	strh r0, [r5, #6]
	movs r0, #0x5a
	ldrh r1, [r5, #6]
	lsls r0, r0, #4
	cmp r1, r0
	bls _0225959C
	bl GF_AssertFail
_0225959C:
	adds r0, r5, #0
	adds r0, #0xc
	movs r1, #0
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r5, #0
	ldr r2, [r5, #8]
	adds r0, #0xc
	movs r1, #1
	bl FUN_020200A8
	ldrb r0, [r4]
	ldr r1, [sp, #0x20]
	strb r0, [r5, #0x1c]
	ldrb r0, [r4, #1]
	strb r0, [r5, #0x1d]
	ldrb r0, [r4, #2]
	strb r0, [r5, #0x1e]
	ldrb r0, [r4, #3]
	strb r0, [r5, #0x1f]
	adds r0, r5, #0
	ldrb r2, [r5, #1]
	adds r0, #0x1c
	bl ov88_022592B8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov88_02259560

	thumb_func_start ov88_022595DC
ov88_022595DC: @ 0x022595DC
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov88_022595DC

	thumb_func_start ov88_022595E4
ov88_022595E4: @ 0x022595E4
	ldrh r1, [r0, #2]
	movs r3, #1
	adds r2, r1, #1
	ldrh r1, [r0, #4]
	cmp r2, r1
	bgt _022595F4
	strh r2, [r0, #2]
	movs r3, #0
_022595F4:
	adds r0, r3, #0
	bx lr
	thumb_func_end ov88_022595E4

	thumb_func_start ov88_022595F8
ov88_022595F8: @ 0x022595F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	ldrh r0, [r5, #6]
	str r1, [sp, #0x1c]
	str r0, [sp, #0x20]
	ldrh r1, [r5, #2]
	ldr r0, [sp, #0x20]
	muls r0, r1, r0
	ldrh r1, [r5, #4]
	blx FUN_020F2998
	adds r4, r0, #0
	movs r0, #1
	lsls r0, r0, #8
	cmp r4, r0
	bge _02259622
	movs r0, #0xff
	subs r7, r0, r4
	movs r6, #0
	b _02259630
_02259622:
	subs r6, r4, r0
	ldr r0, [sp, #0x20]
	movs r7, #0
	subs r4, r0, r4
	cmp r4, #0xff
	ble _02259630
	movs r4, #0xff
_02259630:
	movs r0, #0xff
	str r0, [sp]
	movs r1, #0
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201DA74
	movs r0, #0x5a
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #0x10
	lsls r1, r7, #0x10
	lsls r2, r6, #0x10
	str r0, [sp, #4]
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	movs r3, #0
	lsls r1, r4, #0x10
	str r3, [sp, #0xc]
	lsrs r1, r1, #0x10
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xf
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	ldr r1, [r5, #0x18]
	lsrs r2, r2, #0x10
	bl FUN_0201DA04
	ldr r0, [sp, #0x1c]
	bl FUN_0201D5C8
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov88_022595F8

	thumb_func_start ov88_0225967C
ov88_0225967C: @ 0x0225967C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	str r1, [sp, #0x18]
	str r2, [sp, #0x1c]
	movs r1, #0
	movs r2, #0x70
	str r0, [sp, #0x14]
	blx FUN_020E5B44
	ldr r2, _022597CC @ =0x000002F5
	ldr r3, [sp, #0x1c]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	str r0, [sp, #0x38]
	ldr r1, [sp, #0x1c]
	movs r0, #0x80
	bl FUN_02026354
	str r0, [sp, #0x34]
	movs r0, #0
	str r0, [sp, #0x3c]
	ldr r0, _022597D0 @ =0x02259A68
	ldr r5, _022597D4 @ =0x02259980
	str r0, [sp, #0x28]
	ldr r0, _022597D8 @ =0x02259A60
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0x20]
	adds r0, #0x40
	str r0, [sp, #0x20]
_022596BC:
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	ldrh r1, [r1]
	ldr r0, [sp, #0x20]
	ldr r2, [r2]
	bl ov88_0225983C
	ldrb r0, [r5, #1]
	ldr r1, [sp, #0x14]
	movs r2, #0
	str r0, [sp]
	ldrb r0, [r5, #2]
	str r0, [sp, #4]
	ldrb r0, [r5, #3]
	str r0, [sp, #8]
	ldrb r0, [r5, #6]
	str r0, [sp, #0xc]
	ldrh r0, [r5, #4]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	ldrb r3, [r5]
	ldr r0, [r0]
	bl FUN_0201D40C
	ldr r0, [sp, #0x14]
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x34]
	bl FUN_0200BB6C
	ldr r0, [sp, #0x34]
	bl FUN_02026820
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	ldrb r6, [r5, #8]
	bl FUN_02026800
	ldr r1, [sp, #0x1c]
	adds r0, r0, #1
	bl FUN_02026354
	adds r4, r0, #0
	ldr r0, [sp, #0x30]
	movs r7, #0
	cmp r0, #0
	bls _0225978A
_02259720:
	ldr r1, [sp, #0x34]
	adds r0, r4, #0
	adds r2, r7, #0
	bl FUN_02026860
	ldrb r0, [r5, #9]
	cmp r0, #0
	beq _0225973A
	cmp r0, #1
	beq _02259740
	cmp r0, #2
	beq _02259756
	b _02259766
_0225973A:
	ldrb r0, [r5, #7]
	str r0, [sp, #0x2c]
	b _02259766
_02259740:
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02003068
	adds r0, r0, #1
	ldrb r1, [r5, #7]
	lsrs r0, r0, #1
	subs r0, r1, r0
	str r0, [sp, #0x2c]
	b _02259766
_02259756:
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02003068
	ldrb r1, [r5, #7]
	subs r0, r1, r0
	str r0, [sp, #0x2c]
_02259766:
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	ldr r3, [sp, #0x2c]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	movs r1, #0
	adds r2, r4, #0
	bl FUN_020200FC
	ldr r0, [sp, #0x30]
	adds r7, r7, #1
	adds r6, #0x10
	cmp r7, r0
	blo _02259720
_0225978A:
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, [sp, #0x14]
	bl FUN_0201D5C8
	ldr r0, [sp, #0x28]
	adds r5, #0x10
	adds r0, r0, #4
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	adds r0, r0, #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	adds r0, #0xc
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	adds r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x3c]
	adds r0, r0, #1
	str r0, [sp, #0x3c]
	cmp r0, #4
	blt _022596BC
	ldr r0, [sp, #0x34]
	bl FUN_02026380
	ldr r0, [sp, #0x38]
	bl FUN_0200BB44
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022597CC: .4byte 0x000002F5
_022597D0: .4byte 0x02259A68
_022597D4: .4byte 0x02259980
_022597D8: .4byte 0x02259A60
	thumb_func_end ov88_0225967C

	thumb_func_start ov88_022597DC
ov88_022597DC: @ 0x022597DC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	movs r6, #0
	adds r4, #0x40
_022597E6:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r0, r4, #0
	bl ov88_0225985C
	adds r6, r6, #1
	adds r5, #0x10
	adds r4, #0xc
	cmp r6, #4
	blt _022597E6
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov88_022597DC

	thumb_func_start ov88_02259800
ov88_02259800: @ 0x02259800
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r5, #0x40
_02259808:
	adds r0, r5, #0
	bl ov88_02259884
	adds r4, r4, #1
	adds r5, #0xc
	cmp r4, #4
	blt _02259808
	pop {r3, r4, r5, pc}
	thumb_func_end ov88_02259800

	thumb_func_start ov88_02259818
ov88_02259818: @ 0x02259818
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #4
	blo _02259826
	bl GF_AssertFail
_02259826:
	cmp r4, #0
	bne _0225982E
	bl GF_AssertFail
_0225982E:
	movs r0, #0xc
	adds r5, #0x40
	muls r0, r4, r0
	adds r0, r5, r0
	bl ov88_02259878
	pop {r3, r4, r5, pc}
	thumb_func_end ov88_02259818

	thumb_func_start ov88_0225983C
ov88_0225983C: @ 0x0225983C
	movs r3, #0
	strb r3, [r0]
	strb r3, [r0, #1]
	strb r3, [r0, #2]
	strb r3, [r0, #3]
	strb r3, [r0, #4]
	strb r3, [r0, #5]
	strb r3, [r0, #6]
	strb r3, [r0, #7]
	strb r3, [r0, #8]
	strb r3, [r0, #9]
	strb r3, [r0, #0xa]
	strb r3, [r0, #0xb]
	strh r1, [r0, #6]
	str r2, [r0, #8]
	bx lr
	thumb_func_end ov88_0225983C

	thumb_func_start ov88_0225985C
ov88_0225985C: @ 0x0225985C
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	bx lr
	thumb_func_end ov88_0225985C

	thumb_func_start ov88_02259878
ov88_02259878: @ 0x02259878
	movs r1, #1
	strh r1, [r0]
	movs r1, #0
	strh r1, [r0, #2]
	bx lr
	.align 2, 0
	thumb_func_end ov88_02259878

	thumb_func_start ov88_02259884
ov88_02259884: @ 0x02259884
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0x1c
	bls _02259894
	movs r0, #0
	strh r0, [r4]
_02259894:
	ldrh r0, [r4]
	cmp r0, #0
	beq _02259900
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _022598AA
	ldr r0, [r4, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0200604C
_022598AA:
	ldrh r0, [r4, #2]
	cmp r0, #2
	bhs _022598BA
	lsls r1, r0, #4
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r3, r0, #1
	b _022598D0
_022598BA:
	cmp r0, #0xe
	bhs _022598C2
	movs r3, #0x10
	b _022598D0
_022598C2:
	subs r0, #0xe
	lsls r0, r0, #4
	movs r1, #0xe
	blx FUN_020F2998
	movs r1, #0x10
	subs r3, r1, r0
_022598D0:
	movs r1, #0xe
	add r0, sp, #4
	strh r1, [r0]
	movs r0, #0x19
	lsls r3, r3, #0x18
	str r0, [sp]
	add r0, sp, #4
	adds r1, r4, #4
	movs r2, #1
	lsrs r3, r3, #0x18
	bl FUN_02003DE8
	adds r0, r4, #4
	movs r1, #2
	blx DC_FlushRange
	ldrh r1, [r4, #6]
	adds r0, r4, #4
	movs r2, #2
	blx FUN_020CFC6C
	ldrh r0, [r4, #2]
	adds r0, r0, #1
	strh r0, [r4, #2]
_02259900:
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov88_02259884

	.rodata

_02259904:
	.byte 0x0F, 0x12, 0x15, 0x00, 0x50, 0x01, 0x00, 0x00, 0x20, 0x01, 0x00, 0x00
	.byte 0xF0, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x72, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x14, 0x08, 0x01, 0x00, 0x0A, 0x50, 0x06, 0x01, 0x00, 0x00, 0x00, 0x04, 0x03, 0x00
	.byte 0x00, 0x06, 0x06, 0x03, 0xA1, 0x00, 0x07, 0x10, 0x04, 0x01, 0x00, 0x00, 0x00, 0x0E, 0x0D, 0x00
	.byte 0x0F, 0x06, 0x06, 0x05, 0xB3, 0x00, 0x07, 0x18, 0x04, 0x01, 0x00, 0x00, 0x00, 0x0E, 0x0D, 0x00
	.byte 0x04, 0x0C, 0x12, 0x03, 0xD1, 0x00, 0x07, 0x04, 0x04, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x0D, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1A, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_02259A60:
	.byte 0x00, 0x00, 0x18, 0x00, 0x1A, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0xDD, 0x05, 0x00, 0x00
	.byte 0xE4, 0x05, 0x00, 0x00, 0xE3, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x02259A80
