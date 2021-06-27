
	thumb_func_start ov47_02258800
ov47_02258800: @ 0x02258800
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	bl FUN_020072A4
	movs r2, #5
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x81
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r1, #0xa3
	adds r0, r4, #0
	lsls r1, r1, #2
	movs r2, #0x81
	bl FUN_02007280
	movs r2, #0xa3
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r1, [r5]
	adds r0, r4, #0
	movs r2, #0x81
	bl ov47_02258A1C
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r1, [r5, #4]
	adds r0, r4, r0
	movs r2, #0x81
	bl ov47_02258C70
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r2, [r5]
	adds r0, r4, r0
	adds r1, r4, #0
	movs r3, #0x81
	bl ov47_02259228
	ldr r0, [r5, #8]
	cmp r0, #2
	blt _02258862
	bl GF_AssertFail
_02258862:
	movs r1, #0x81
	str r1, [sp]
	adds r3, r5, #0
	ldr r5, [r5, #8]
	adds r0, r1, #0
	lsls r6, r5, #2
	ldr r5, _02258890 @ =0x02259FB0
	adds r0, #0xf7
	adds r1, #0xc3
	ldr r5, [r5, r6]
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, r4, #0
	blx r5
	ldr r0, _02258894 @ =ov47_02258A14
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02258890: .4byte 0x02259FB0
_02258894: .4byte ov47_02258A14
	thumb_func_end ov47_02258800

	thumb_func_start ov47_02258898
ov47_02258898: @ 0x02258898
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02007290
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_020072A4
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #4
	bhi _02258996
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022588C0: @ jump table
	.2byte _022588CA - _022588C0 - 2 @ case 0
	.2byte _022588F0 - _022588C0 - 2 @ case 1
	.2byte _02258900 - _022588C0 - 2 @ case 2
	.2byte _0225895E - _022588C0 - 2 @ case 3
	.2byte _0225897E - _022588C0 - 2 @ case 4
_022588CA:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x81
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5, #4]
	movs r1, #1
	bl FUN_0222A520
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258996
_022588F0:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _02258996
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258996
_02258900:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _02258930
	ldr r0, [r5, #4]
	bl FUN_0222A330
	cmp r0, #1
	bne _02258920
	ldr r0, [r5, #4]
	bl FUN_0222A4A8
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258996
_02258920:
	bl FUN_0222D844
	cmp r0, #1
	bne _02258930
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258996
_02258930:
	movs r1, #0x81
	str r5, [sp]
	str r1, [sp, #4]
	ldr r5, [r5, #8]
	adds r0, r1, #0
	lsls r6, r5, #2
	ldr r5, _022589A4 @ =0x02259FA8
	movs r3, #0x9a
	adds r0, #0xf7
	adds r1, #0xc3
	lsls r3, r3, #2
	ldr r5, [r5, r6]
	adds r0, r7, r0
	adds r1, r7, r1
	adds r2, r7, #0
	adds r3, r7, r3
	blx r5
	cmp r0, #1
	bne _02258996
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258996
_0225895E:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x81
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258996
_0225897E:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _02258996
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r0, r7, r0
	bl ov47_022593A0
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02258996:
	adds r0, r7, #0
	bl ov47_02258A80
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022589A4: .4byte 0x02259FA8
	thumb_func_end ov47_02258898

	thumb_func_start ov47_022589A8
ov47_022589A8: @ 0x022589A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_020072A4
	adds r6, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	ldr r3, [r6, #8]
	movs r1, #0x5e
	lsls r6, r3, #2
	ldr r3, _02258A10 @ =0x02259FA0
	lsls r1, r1, #2
	adds r0, r4, r1
	subs r1, #0x34
	ldr r3, [r3, r6]
	adds r1, r4, r1
	adds r2, r4, #0
	blx r3
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x81
	bl ov47_02259278
	movs r0, #0x51
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov47_02258CC0
	adds r0, r4, #0
	bl ov47_02258A60
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x81
	bl FUN_0201A9C4
	movs r0, #0
	bl FUN_0200616C
	movs r0, #1
	pop {r4, r5, r6, pc}
	nop
_02258A10: .4byte 0x02259FA0
	thumb_func_end ov47_022589A8

	thumb_func_start ov47_02258A14
ov47_02258A14: @ 0x02258A14
	ldr r3, _02258A18 @ =ov47_02258A8C
	bx r3
	.align 2, 0
_02258A18: .4byte ov47_02258A8C
	thumb_func_end ov47_02258A14

	thumb_func_start ov47_02258A1C
ov47_02258A1C: @ 0x02258A1C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	adds r0, r1, #0
	bl FUN_02028EA8
	adds r6, r0, #0
	movs r0, #0xd1
	adds r1, r4, #0
	bl FUN_02007688
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #0x20
	adds r1, r4, #0
	bl FUN_0202055C
	ldr r0, _02258A5C @ =0x02259EC0
	bl FUN_02022BE8
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov47_02258AA0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov47_02258BB4
	pop {r4, r5, r6, pc}
	nop
_02258A5C: .4byte 0x02259EC0
	thumb_func_end ov47_02258A1C

	thumb_func_start ov47_02258A60
ov47_02258A60: @ 0x02258A60
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0200770C
	bl FUN_020205AC
	adds r0, r4, #0
	bl ov47_02258B8C
	adds r0, r4, #0
	bl ov47_02258C44
	pop {r4, pc}
	thumb_func_end ov47_02258A60

	thumb_func_start ov47_02258A80
ov47_02258A80: @ 0x02258A80
	ldr r3, _02258A88 @ =FUN_0202457C
	ldr r0, [r0, #4]
	bx r3
	nop
_02258A88: .4byte FUN_0202457C
	thumb_func_end ov47_02258A80

	thumb_func_start ov47_02258A8C
ov47_02258A8C: @ 0x02258A8C
	push {r3, lr}
	ldr r0, [r0]
	bl FUN_0201EEB4
	bl FUN_0200B224
	bl FUN_0202061C
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov47_02258A8C

	thumb_func_start ov47_02258AA0
ov47_02258AA0: @ 0x02258AA0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, _02258B7C @ =0x02259E48
	adds r7, r2, #0
	str r1, [sp, #0x10]
	bl FUN_0201ACB0
	adds r0, r7, #0
	bl FUN_0201AC88
	str r0, [r5]
	ldr r0, _02258B80 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #0
	ldr r6, _02258B84 @ =0x02259F18
	ldr r4, _02258B88 @ =0x02259E68
	str r0, [sp, #0x14]
_02258ACA:
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
	ldr r0, [sp, #0x14]
	adds r6, #0x1c
	adds r0, r0, #1
	adds r4, r4, #4
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _02258ACA
	movs r0, #0
	movs r1, #0x80
	adds r2, r7, #0
	bl FUN_0200304C
	ldr r0, [sp, #0x10]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r7, [sp, #4]
	movs r1, #1
	ldr r0, [r5]
	adds r2, r1, #0
	movs r3, #5
	bl FUN_0200E644
	movs r0, #0
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [r5]
	movs r1, #1
	movs r2, #0x1f
	movs r3, #6
	bl FUN_0200E3DC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldr r2, [r5]
	movs r0, #0xc6
	movs r1, #2
	movs r3, #4
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldr r2, [r5]
	movs r0, #0xc6
	movs r1, #6
	movs r3, #4
	bl FUN_02007914
	movs r1, #0
	str r1, [sp]
	movs r0, #0xc6
	movs r2, #4
	adds r3, r1, #0
	str r7, [sp, #4]
	bl FUN_02007938
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02258B7C: .4byte 0x02259E48
_02258B80: .4byte 0x021D116C
_02258B84: .4byte 0x02259F18
_02258B88: .4byte 0x02259E68
	thumb_func_end ov47_02258AA0

	thumb_func_start ov47_02258B8C
ov47_02258B8C: @ 0x02258B8C
	push {r4, r5, r6, lr}
	ldr r5, _02258BB0 @ =0x02259E68
	adds r6, r0, #0
	movs r4, #0
_02258B94:
	ldr r1, [r5]
	ldr r0, [r6]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB4C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02258B94
	ldr r0, [r6]
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
_02258BB0: .4byte 0x02259E68
	thumb_func_end ov47_02258B8C

	thumb_func_start ov47_02258BB4
ov47_02258BB4: @ 0x02258BB4
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
	movs r1, #0x10
	ldr r0, _02258C40 @ =0x02259E58
	adds r2, r1, #0
	bl FUN_020215C0
	movs r0, #0x20
	adds r1, r6, #0
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	movs r0, #1
	movs r1, #0x10
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	adds r1, r5, #0
	movs r0, #0x20
	adds r1, #8
	adds r2, r6, #0
	bl FUN_02009F40
	movs r7, #0x13
	str r0, [r5, #4]
	movs r4, #0
	lsls r7, r7, #4
_02258C12:
	movs r0, #0x20
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0200A090
	str r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02258C12
	bl FUN_0203A880
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02258C40: .4byte 0x02259E58
	thumb_func_end ov47_02258BB4

	thumb_func_start ov47_02258C44
ov47_02258C44: @ 0x02258C44
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	bl FUN_02024504
	movs r6, #0x13
	movs r4, #0
	lsls r6, r6, #4
_02258C54:
	ldr r0, [r5, r6]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02258C54
	bl FUN_0202168C
	bl FUN_02022608
	bl FUN_0200B244
	pop {r4, r5, r6, pc}
	thumb_func_end ov47_02258C44

	thumb_func_start ov47_02258C70
ov47_02258C70: @ 0x02258C70
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _02258CBC @ =0x02259E9C
	str r0, [sp]
	adds r7, r2, #0
	str r1, [r0, #0x30]
	movs r6, #0
	adds r5, r0, #0
_02258C7E:
	ldr r2, [r4]
	movs r0, #0
	movs r1, #0x1b
	adds r3, r7, #0
	bl FUN_0200BAF8
	adds r6, r6, #1
	adds r4, r4, #4
	stm r5!, {r0}
	cmp r6, #9
	blt _02258C7E
	adds r0, r7, #0
	bl FUN_0200BD08
	ldr r1, [sp]
	str r0, [r1, #0x24]
	movs r0, #1
	lsls r0, r0, #8
	adds r1, r7, #0
	bl FUN_02026354
	ldr r1, [sp]
	str r0, [r1, #0x28]
	movs r0, #1
	lsls r0, r0, #8
	adds r1, r7, #0
	bl FUN_02026354
	ldr r1, [sp]
	str r0, [r1, #0x2c]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02258CBC: .4byte 0x02259E9C
	thumb_func_end ov47_02258C70

	thumb_func_start ov47_02258CC0
ov47_02258CC0: @ 0x02258CC0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_02258CC8:
	ldr r0, [r5]
	bl FUN_0200BB44
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #9
	blt _02258CC8
	ldr r0, [r6, #0x24]
	bl FUN_0200BDA0
	ldr r0, [r6, #0x28]
	bl FUN_02026380
	ldr r0, [r6, #0x2c]
	bl FUN_02026380
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov47_02258CC0

	thumb_func_start ov47_02258CEC
ov47_02258CEC: @ 0x02258CEC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #9
	blo _02258CFC
	bl GF_AssertFail
_02258CFC:
	lsls r0, r4, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x2c]
	adds r1, r6, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	bl FUN_0200CBBC
	ldr r0, [r5, #0x28]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov47_02258CEC

	thumb_func_start ov47_02258D18
ov47_02258D18: @ 0x02258D18
	push {r4, lr}
	adds r2, r1, #0
	adds r4, r0, #0
	cmp r2, #0x3c
	blo _02258D2A
	bhs _02258D28
	bl GF_AssertFail
_02258D28:
	movs r2, #0
_02258D2A:
	cmp r2, #0x32
	bhs _02258D38
	adds r0, r4, #0
	movs r1, #1
	bl ov47_02258CEC
	pop {r4, pc}
_02258D38:
	adds r0, r4, #0
	movs r1, #2
	subs r2, #0x32
	bl ov47_02258CEC
	pop {r4, pc}
	thumb_func_end ov47_02258D18

	thumb_func_start ov47_02258D44
ov47_02258D44: @ 0x02258D44
	push {r3, r4, r5, lr}
	adds r3, r1, #0
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r3, #0x3c
	blo _02258D58
	bhs _02258D56
	bl GF_AssertFail
_02258D56:
	movs r3, #0
_02258D58:
	cmp r3, #0x32
	bhs _02258D68
	adds r0, r4, #0
	adds r1, r5, #3
	adds r2, r3, #0
	bl ov47_02258CEC
	pop {r3, r4, r5, pc}
_02258D68:
	subs r3, #0x32
	adds r0, r4, #0
	adds r1, r5, #6
	adds r2, r3, #0
	bl ov47_02258CEC
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov47_02258D44

	thumb_func_start ov47_02258D78
ov47_02258D78: @ 0x02258D78
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r2, #0
	adds r5, r0, #0
	adds r0, r7, #0
	adds r4, r1, #0
	bl FUN_02028ED0
	adds r6, r0, #0
	ldr r0, [r5, #0x30]
	bl FUN_0222A5C0
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0222A844
	ldr r0, [r5, #0x24]
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0200BE48
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov47_02258D78

	thumb_func_start ov47_02258DA8
ov47_02258DA8: @ 0x02258DA8
	push {r3, lr}
	ldr r3, [sp, #8]
	bl ov47_02258DD0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov47_02258DA8

	thumb_func_start ov47_02258DB4
ov47_02258DB4: @ 0x02258DB4
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	bl ov47_02258F48
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov47_02258DB4

	thumb_func_start ov47_02258DC8
ov47_02258DC8: @ 0x02258DC8
	ldr r3, _02258DCC @ =ov47_0225912C
	bx r3
	.align 2, 0
_02258DCC: .4byte ov47_0225912C
	thumb_func_end ov47_02258DC8

	thumb_func_start ov47_02258DD0
ov47_02258DD0: @ 0x02258DD0
	push {r4, r5, r6, lr}
	sub sp, #0x70
	adds r5, r0, #0
	movs r0, #0x80
	str r0, [sp]
	adds r6, r3, #0
	adds r4, r2, #0
	movs r2, #0
	str r6, [sp, #4]
	adds r0, #0xc0
	ldr r0, [r4, r0]
	movs r1, #0xc7
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	movs r0, #5
	str r6, [sp, #0xc]
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	ldr r2, [r4]
	movs r1, #0xc8
	bl FUN_02007B44
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	movs r0, #5
	str r6, [sp, #0xc]
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	ldr r2, [r4]
	movs r1, #0xc9
	bl FUN_02007B68
	movs r0, #0x14
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #0x13
	str r6, [sp, #8]
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, #0x10
	ldr r1, [r4, r1]
	movs r2, #0xcd
	movs r3, #0
	bl FUN_0200A3C8
	str r0, [r5, #0x18]
	movs r0, #0x14
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r1, #0x4d
	str r6, [sp, #0xc]
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0xc
	ldr r1, [r4, r1]
	movs r2, #0xcc
	movs r3, #0
	bl FUN_0200A480
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	bl FUN_0200ADA4
	cmp r0, #0
	bne _02258E6C
	bl GF_AssertFail
_02258E6C:
	ldr r0, [r5, #0x1c]
	bl FUN_0200B00C
	cmp r0, #0
	bne _02258E7A
	bl GF_AssertFail
_02258E7A:
	ldr r0, [r5, #0x18]
	bl FUN_0200A740
	ldr r0, [r5, #0x1c]
	bl FUN_0200A740
	movs r0, #0x14
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r1, #0x4e
	str r6, [sp, #8]
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #8
	ldr r1, [r4, r1]
	movs r2, #0xce
	movs r3, #0
	bl FUN_0200A540
	str r0, [r5, #0x20]
	movs r0, #0x14
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r1, #0x4f
	str r6, [sp, #8]
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0xcf
	movs r3, #0
	bl FUN_0200A540
	str r0, [r5, #0x24]
	movs r0, #0
	add r2, sp, #0x2c
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	movs r1, #0x14
	adds r2, r1, #0
	str r1, [sp]
	subs r2, #0x15
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	movs r2, #0x13
	str r0, [sp, #0x10]
	lsls r2, r2, #4
	ldr r3, [r4, r2]
	str r3, [sp, #0x14]
	adds r3, r2, #4
	ldr r3, [r4, r3]
	str r3, [sp, #0x18]
	adds r3, r2, #0
	adds r3, #8
	ldr r3, [r4, r3]
	adds r2, #0xc
	str r3, [sp, #0x1c]
	ldr r2, [r4, r2]
	adds r3, r1, #0
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x4c
	adds r2, r1, #0
	bl FUN_02009D48
	ldr r0, [r4, #4]
	str r0, [sp, #0x2c]
	add r0, sp, #0x4c
	str r0, [sp, #0x30]
	movs r0, #0
	str r0, [sp, #0x40]
	movs r0, #1
	str r0, [sp, #0x44]
	add r0, sp, #0x2c
	str r6, [sp, #0x48]
	bl FUN_02024714
	movs r1, #0
	str r0, [r5, #0x14]
	bl FUN_02024830
	ldr r0, [r4]
	ldr r2, _02258F44 @ =0x02259E40
	adds r1, r5, #0
	bl FUN_0201D4F8
	adds r5, #0x2c
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl ov47_02259C8C
	add sp, #0x70
	pop {r4, r5, r6, pc}
	.align 2, 0
_02258F44: .4byte 0x02259E40
	thumb_func_end ov47_02258DD0

	thumb_func_start ov47_02258F48
ov47_02258F48: @ 0x02258F48
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	ldrh r3, [r4, #0x28]
	adds r6, r1, #0
	cmp r3, #0xa
	bls _02258F58
	b _02259114
_02258F58:
	adds r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_02258F64: @ jump table
	.2byte _02258F7A - _02258F64 - 2 @ case 0
	.2byte _02258F96 - _02258F64 - 2 @ case 1
	.2byte _02258FA6 - _02258F64 - 2 @ case 2
	.2byte _02258FC8 - _02258F64 - 2 @ case 3
	.2byte _02258FEE - _02258F64 - 2 @ case 4
	.2byte _02259016 - _02258F64 - 2 @ case 5
	.2byte _0225906E - _02258F64 - 2 @ case 6
	.2byte _022590A4 - _02258F64 - 2 @ case 7
	.2byte _022590D4 - _02258F64 - 2 @ case 8
	.2byte _022590FA - _02258F64 - 2 @ case 9
	.2byte _02259104 - _02258F64 - 2 @ case 10
_02258F7A:
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x5e
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	movs r0, #1
	strh r0, [r4, #0x2a]
	movs r0, #0xa
	strh r0, [r4, #0x28]
	b _02259118
_02258F96:
	adds r1, r2, #0
	ldr r2, [sp, #0x14]
	adds r0, r5, #0
	bl ov47_02259404
	movs r0, #2
	strh r0, [r4, #0x28]
	b _02259118
_02258FA6:
	ldr r1, [sp, #0x14]
	adds r0, r5, #0
	bl ov47_02259430
	cmp r0, #0
	beq _02258FBC
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _02258FC2
	b _02259118
_02258FBC:
	movs r0, #3
	strh r0, [r4, #0x28]
	b _02259118
_02258FC2:
	movs r0, #9
	strh r0, [r4, #0x28]
	b _02259118
_02258FC8:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bne _02258FD2
	movs r2, #0x5c
	b _02258FD4
_02258FD2:
	movs r2, #0x5d
_02258FD4:
	adds r0, r6, #0
	movs r1, #0
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	movs r0, #4
	strh r0, [r4, #0x2a]
	movs r0, #0xa
	strh r0, [r4, #0x28]
	b _02259118
_02258FEE:
	bl ov47_0225916C
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	bl ov47_02259D40
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_02259318
	adds r0, r4, #0
	bl ov47_022591F8
	adds r0, r4, #0
	bl ov47_0225921C
	movs r0, #5
	strh r0, [r4, #0x28]
	b _02259118
_02259016:
	ldr r0, _0225911C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _0225902E
	ldr r0, _02259120 @ =0x000005DC
	bl FUN_0200604C
	ldrh r0, [r4, #0x28]
	adds r0, r0, #1
	strh r0, [r4, #0x28]
	b _02259118
_0225902E:
	movs r0, #0x40
	tst r0, r1
	beq _0225904A
	ldr r0, [r4, #0x10]
	subs r0, r0, #1
	bmi _02259066
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	ldr r0, [r4, #0x10]
	subs r0, r0, #1
	str r0, [r4, #0x10]
	b _02259066
_0225904A:
	movs r0, #0x80
	tst r0, r1
	beq _02259066
	ldr r0, [r4, #0x10]
	adds r0, r0, #1
	cmp r0, #3
	bge _02259066
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	ldr r0, [r4, #0x10]
	adds r0, r0, #1
	str r0, [r4, #0x10]
_02259066:
	adds r0, r4, #0
	bl ov47_022591F8
	b _02259118
_0225906E:
	ldr r0, [sp, #0x10]
	ldr r1, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r2, [r4, #0x10]
	bl FUN_0222A7DC
	ldr r0, [r4, #0x10]
	bl FUN_0222F4D4
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x60
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_02259318
	adds r0, r5, #0
	bl ov47_02259384
	ldr r0, _02259124 @ =0x0000057D
	bl FUN_0200604C
	movs r0, #7
	strh r0, [r4, #0x28]
	b _02259118
_022590A4:
	bl FUN_0222F524
	cmp r0, #1
	beq _02259118
	ldr r0, _02259128 @ =0x000005E4
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov47_022593A0
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x61
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	movs r0, #8
	strh r0, [r4, #0x2a]
	movs r0, #0xa
	strh r0, [r4, #0x28]
	b _02259118
_022590D4:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bne _022590DE
	movs r2, #0x62
	b _022590E0
_022590DE:
	movs r2, #0x63
_022590E0:
	adds r0, r6, #0
	movs r1, #0
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	movs r0, #9
	strh r0, [r4, #0x2a]
	movs r0, #0xa
	strh r0, [r4, #0x28]
	b _02259118
_022590FA:
	adds r0, r5, #0
	bl ov47_022593CC
	movs r0, #1
	pop {r4, r5, r6, pc}
_02259104:
	adds r0, r5, #0
	bl ov47_022593B4
	cmp r0, #1
	bne _02259118
	ldrh r0, [r4, #0x2a]
	strh r0, [r4, #0x28]
	b _02259118
_02259114:
	bl GF_AssertFail
_02259118:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225911C: .4byte 0x021D110C
_02259120: .4byte 0x000005DC
_02259124: .4byte 0x0000057D
_02259128: .4byte 0x000005E4
	thumb_func_end ov47_02258F48

	thumb_func_start ov47_0225912C
ov47_0225912C: @ 0x0225912C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x2c
	adds r4, r2, #0
	bl ov47_02259D24
	adds r0, r5, #0
	bl FUN_0201D520
	ldr r0, [r5, #0x14]
	bl FUN_02024758
	ldr r0, [r5, #0x18]
	bl FUN_0200AEB0
	ldr r0, [r5, #0x1c]
	bl FUN_0200B0A8
	movs r7, #0x13
	movs r6, #0
	lsls r7, r7, #4
_02259156:
	ldr r0, [r4, r7]
	ldr r1, [r5, #0x18]
	bl FUN_0200A75C
	adds r6, r6, #1
	adds r5, r5, #4
	adds r4, r4, #4
	cmp r6, #4
	blt _02259156
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov47_0225912C

	thumb_func_start ov47_0225916C
ov47_0225916C: @ 0x0225916C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r4, #0
	movs r2, #0
	bl ov47_02259D58
	movs r3, #0
	adds r2, r0, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022591F4 @ =0x00010200
	movs r1, #1
	str r0, [sp, #8]
	adds r0, r5, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r4, #0
	movs r2, #1
	bl ov47_02259D58
	adds r2, r0, #0
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022591F4 @ =0x00010200
	movs r3, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r4, #0
	movs r2, #2
	bl ov47_02259D58
	adds r2, r0, #0
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022591F4 @ =0x00010200
	movs r3, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_022591F4: .4byte 0x00010200
	thumb_func_end ov47_0225916C

	thumb_func_start ov47_022591F8
ov47_022591F8: @ 0x022591F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_02024830
	ldr r2, [r4, #0x10]
	movs r1, #0xc
	ldr r3, _02259218 @ =0x02259E78
	muls r1, r2, r1
	ldr r0, [r4, #0x14]
	adds r1, r3, r1
	bl FUN_020247D4
	pop {r4, pc}
	nop
_02259218: .4byte 0x02259E78
	thumb_func_end ov47_022591F8

	thumb_func_start ov47_0225921C
ov47_0225921C: @ 0x0225921C
	ldr r3, _02259224 @ =FUN_0202484C
	ldr r0, [r0, #0x14]
	movs r1, #1
	bx r3
	.align 2, 0
_02259224: .4byte FUN_0202484C
	thumb_func_end ov47_0225921C

	thumb_func_start ov47_02259228
ov47_02259228: @ 0x02259228
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r1]
	adds r1, r5, #0
	adds r4, r2, #0
	adds r6, r3, #0
	adds r1, #8
	movs r2, #1
	movs r3, #2
	bl FUN_0201D40C
	adds r0, r5, #0
	adds r0, #8
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #1
	lsls r0, r0, #8
	adds r1, r6, #0
	bl FUN_02026354
	str r0, [r5, #0x18]
	adds r0, r4, #0
	bl FUN_02028EA8
	bl FUN_0202AD3C
	str r0, [r5, #4]
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov47_02259228

	thumb_func_start ov47_02259278
ov47_02259278: @ 0x02259278
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _02259296
	ldr r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_02259296:
	adds r0, r5, #0
	bl ov47_022593A0
	ldr r0, [r5, #0x18]
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #8
	bl FUN_0201D520
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov47_02259448
	pop {r3, r4, r5, pc}
	thumb_func_end ov47_02259278

	thumb_func_start ov47_022592B4
ov47_022592B4: @ 0x022592B4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _022592D4
	ldr r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_022592D4:
	adds r0, r5, #0
	adds r0, #8
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [r5, #0x18]
	adds r1, r4, #0
	bl FUN_020263D4
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #4]
	movs r1, #1
	str r0, [sp, #4]
	ldr r0, _02259314 @ =0x0001020F
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x18]
	adds r0, #8
	bl FUN_020200FC
	str r0, [r5]
	adds r5, #8
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #5
	bl FUN_0200E998
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_02259314: .4byte 0x0001020F
	thumb_func_end ov47_022592B4

	thumb_func_start ov47_02259318
ov47_02259318: @ 0x02259318
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _02259338
	ldr r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_02259338:
	adds r0, r5, #0
	adds r0, #8
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [r5, #0x18]
	adds r1, r4, #0
	bl FUN_020263D4
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02259380 @ =0x0001020F
	movs r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x18]
	adds r0, #8
	bl FUN_020200FC
	adds r0, r5, #0
	movs r1, #1
	adds r0, #8
	adds r2, r1, #0
	movs r3, #5
	bl FUN_0200E998
	adds r5, #8
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02259380: .4byte 0x0001020F
	thumb_func_end ov47_02259318

	thumb_func_start ov47_02259384
ov47_02259384: @ 0x02259384
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02259392
	bl GF_AssertFail
_02259392:
	adds r0, r4, #0
	adds r0, #8
	movs r1, #1
	bl FUN_0200F0AC
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov47_02259384

	thumb_func_start ov47_022593A0
ov47_022593A0: @ 0x022593A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _022593B2
	bl FUN_0200F450
	movs r0, #0
	str r0, [r4, #0x1c]
_022593B2:
	pop {r4, pc}
	thumb_func_end ov47_022593A0

	thumb_func_start ov47_022593B4
ov47_022593B4: @ 0x022593B4
	push {r3, lr}
	ldr r0, [r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _022593C8
	movs r0, #1
	pop {r3, pc}
_022593C8:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov47_022593B4

	thumb_func_start ov47_022593CC
ov47_022593CC: @ 0x022593CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _022593E8
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_022593E8:
	adds r0, r4, #0
	bl ov47_022593A0
	adds r0, r4, #0
	adds r0, #8
	movs r1, #1
	bl FUN_0200E9BC
	adds r4, #8
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov47_022593CC

	thumb_func_start ov47_02259404
ov47_02259404: @ 0x02259404
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x20]
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r0, #0
	beq _02259418
	bl GF_AssertFail
_02259418:
	str r6, [sp]
	ldr r0, [r4]
	ldr r1, _0225942C @ =_02259E38
	movs r2, #0x1f
	movs r3, #6
	bl FUN_02001FC8
	str r0, [r5, #0x20]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0225942C: .4byte _02259E38
	thumb_func_end ov47_02259404

	thumb_func_start ov47_02259430
ov47_02259430: @ 0x02259430
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _02259446
	movs r1, #0
	str r1, [r4, #0x20]
_02259446:
	pop {r4, pc}
	thumb_func_end ov47_02259430

	thumb_func_start ov47_02259448
ov47_02259448: @ 0x02259448
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0225945A
	bl FUN_02001FFC
	movs r0, #0
	str r0, [r4, #0x20]
_0225945A:
	pop {r4, pc}
	thumb_func_end ov47_02259448

	thumb_func_start ov47_0225945C
ov47_0225945C: @ 0x0225945C
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	bl ov47_02259488
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov47_0225945C

	thumb_func_start ov47_0225946C
ov47_0225946C: @ 0x0225946C
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	bl ov47_02259578
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov47_0225946C

	thumb_func_start ov47_02259480
ov47_02259480: @ 0x02259480
	ldr r3, _02259484 @ =ov47_02259968
	bx r3
	.align 2, 0
_02259484: .4byte ov47_02259968
	thumb_func_end ov47_02259480

	thumb_func_start ov47_02259488
ov47_02259488: @ 0x02259488
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x30]
	movs r1, #0x80
	str r1, [sp]
	adds r6, r2, #0
	adds r1, #0xc0
	str r0, [sp, #0x30]
	str r0, [sp, #4]
	ldr r0, [r6, r1]
	movs r2, #0
	str r3, [sp, #0x18]
	movs r1, #0xc7
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, [sp, #0x30]
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	ldr r2, [r6]
	movs r1, #0xc8
	bl FUN_02007B44
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, [sp, #0x30]
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	ldr r2, [r6]
	movs r1, #0xca
	bl FUN_02007B68
	ldr r4, _02259574 @ =0x02259EE8
	ldr r5, [sp, #0x10]
	movs r7, #0
_022594E6:
	ldr r0, [r6]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r7, r7, #1
	adds r4, #8
	adds r5, #0x10
	cmp r7, #6
	blt _022594E6
	movs r3, #0xc1
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	movs r2, #0x6d
	lsls r3, r3, #0xa
	bl ov47_0225999C
	ldr r0, [sp, #0x30]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	movs r1, #0xc8
	movs r2, #0
	adds r3, #0x84
	bl FUN_02007C10
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x30]
	adds r1, #0x80
	str r0, [r1]
	ldr r0, [sp, #0x10]
	movs r1, #1
	adds r0, #0x88
	bl ov47_02259C8C
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x30]
	adds r0, #0xa8
	movs r1, #0
	bl ov47_02259C8C
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #4]
	adds r1, #0xc8
	bl FUN_0222B21C
	cmp r0, #0
	bne _02259564
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x10]
	ldr r1, [r1, #4]
	adds r0, #0xc8
	bl ov47_02259DCC
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #4]
	adds r1, #0xc8
	bl FUN_0222B1FC
_02259564:
	ldr r0, [sp, #0x10]
	adds r0, #0xdc
	str r0, [sp, #0x10]
	bl ov47_02259D74
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02259574: .4byte 0x02259EE8
	thumb_func_end ov47_02259488

	thumb_func_start ov47_02259578
ov47_02259578: @ 0x02259578
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r2, [sp, #0x14]
	ldr r2, [sp, #0x44]
	adds r4, r0, #0
	str r2, [sp, #0x44]
	adds r2, r4, #0
	adds r2, #0x60
	ldrh r2, [r2]
	adds r7, r1, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x40]
	cmp r2, #0x16
	bls _02259596
	b _02259944
_02259596:
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_022595A2: @ jump table
	.2byte _022595D0 - _022595A2 - 2 @ case 0
	.2byte _022595FE - _022595A2 - 2 @ case 1
	.2byte _0225961C - _022595A2 - 2 @ case 2
	.2byte _0225964A - _022595A2 - 2 @ case 3
	.2byte _02259678 - _022595A2 - 2 @ case 4
	.2byte _022596CE - _022595A2 - 2 @ case 5
	.2byte _022596E0 - _022595A2 - 2 @ case 6
	.2byte _02259720 - _022595A2 - 2 @ case 7
	.2byte _02259744 - _022595A2 - 2 @ case 8
	.2byte _0225976A - _022595A2 - 2 @ case 9
	.2byte _0225978A - _022595A2 - 2 @ case 10
	.2byte _022597A6 - _022595A2 - 2 @ case 11
	.2byte _022597C4 - _022595A2 - 2 @ case 12
	.2byte _022597D4 - _022595A2 - 2 @ case 13
	.2byte _02259802 - _022595A2 - 2 @ case 14
	.2byte _02259820 - _022595A2 - 2 @ case 15
	.2byte _0225984E - _022595A2 - 2 @ case 16
	.2byte _0225987C - _022595A2 - 2 @ case 17
	.2byte _022598DC - _022595A2 - 2 @ case 18
	.2byte _022598EE - _022595A2 - 2 @ case 19
	.2byte _02259900 - _022595A2 - 2 @ case 20
	.2byte _02259922 - _022595A2 - 2 @ case 21
	.2byte _0225992E - _022595A2 - 2 @ case 22
_022595D0:
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #0
	bne _022595DC
	movs r2, #0x67
	b _022595DE
_022595DC:
	movs r2, #0x69
_022595DE:
	adds r0, r7, #0
	movs r1, #0
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x62
	strh r1, [r0]
	movs r0, #0x16
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_022595FE:
	adds r0, #0x88
	bl ov47_02259D40
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	adds r0, r4, #0
	movs r1, #2
	adds r0, #0x62
	strh r1, [r0]
	movs r0, #0x16
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_0225961C:
	ldr r0, _02259950 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	bne _02259628
	b _02259948
_02259628:
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x68
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	adds r0, r4, #0
	movs r1, #3
	adds r0, #0x62
	strh r1, [r0]
	movs r0, #0x16
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_0225964A:
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #0
	bne _02259656
	movs r2, #0x6b
	b _02259658
_02259656:
	movs r2, #0x6c
_02259658:
	adds r0, r7, #0
	movs r1, #0
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	adds r0, r4, #0
	movs r1, #4
	adds r0, #0x62
	strh r1, [r0]
	movs r0, #0x16
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_02259678:
	ldr r0, [r6, #4]
	bl FUN_0222A5C0
	add r1, sp, #0x20
	bl FUN_0222AB0C
	ldr r0, [r6, #4]
	bl FUN_0222A53C
	adds r1, r0, #0
	ldr r0, [r6, #4]
	bl FUN_0222AB28
	add r1, sp, #0x20
	str r1, [sp]
	ldr r1, [sp, #0x44]
	ldr r3, [sp, #0x14]
	str r1, [sp, #4]
	ldr r1, _02259954 @ =0x00090A00
	adds r2, r7, #0
	str r1, [sp, #8]
	ldr r1, _02259958 @ =0x000D0E00
	str r1, [sp, #0xc]
	adds r1, r4, #0
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r1, #0x88
	bl ov47_022599F0
	adds r1, r4, #0
	ldr r2, [sp, #0x14]
	adds r0, r4, #0
	adds r1, #0xc8
	movs r3, #1
	bl ov47_02259B30
	ldr r0, _0225995C @ =0x000005D7
	bl FUN_0200604C
	movs r0, #5
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_022596CE:
	ldr r1, [sp, #0x14]
	bl ov47_02259B74
	cmp r0, #1
	bne _02259758
	movs r0, #6
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_022596E0:
	ldr r0, _02259950 @ =0x021D110C
	movs r1, #1
	ldr r0, [r0, #0x48]
	tst r0, r1
	beq _02259758
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r2, [r0]
	subs r0, r1, #2
	cmp r2, r0
	beq _022596FE
	movs r0, #7
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_022596FE:
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x70
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	adds r0, r4, #0
	movs r1, #0x14
	adds r0, #0x62
	strh r1, [r0]
	movs r0, #0x16
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_02259720:
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x6f
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_02259318
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x44]
	adds r0, r5, #0
	bl ov47_02259404
	movs r0, #8
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_02259744:
	ldr r1, [sp, #0x44]
	adds r0, r5, #0
	bl ov47_02259430
	cmp r0, #0
	beq _0225975A
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _02259762
_02259758:
	b _02259948
_0225975A:
	movs r0, #9
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_02259762:
	movs r0, #0x14
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_0225976A:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x44]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0xa
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_0225978A:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0225982A
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x44]
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov47_02259C3C
	movs r0, #0xb
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_022597A6:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	ldr r0, [sp, #0x44]
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0xc
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_022597C4:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0225982A
	movs r0, #0xd
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_022597D4:
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	bne _022597E0
	movs r2, #0x71
	b _022597E2
_022597E0:
	movs r2, #0x73
_022597E2:
	adds r0, r7, #0
	movs r1, #0
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	adds r0, r4, #0
	movs r1, #0xe
	adds r0, #0x62
	strh r1, [r0]
	movs r0, #0x16
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_02259802:
	adds r0, #0xa8
	bl ov47_02259D40
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	adds r0, r4, #0
	movs r1, #0xf
	adds r0, #0x62
	strh r1, [r0]
	movs r0, #0x16
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_02259820:
	ldr r0, _02259950 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	bne _0225982C
_0225982A:
	b _02259948
_0225982C:
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x72
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	adds r0, r4, #0
	movs r1, #0x10
	adds r0, #0x62
	strh r1, [r0]
	movs r0, #0x16
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_0225984E:
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	bne _0225985A
	movs r2, #0x75
	b _0225985C
_0225985A:
	movs r2, #0x76
_0225985C:
	adds r0, r7, #0
	movs r1, #0
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	adds r0, r4, #0
	movs r1, #0x11
	adds r0, #0x62
	strh r1, [r0]
	movs r0, #0x16
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_0225987C:
	ldr r0, [r6]
	bl FUN_020318E8
	adds r5, r0, #0
	bl FUN_020318F4
	str r0, [sp, #0x18]
	adds r0, r5, #0
	bl FUN_020318F8
	str r0, [sp, #0x1c]
	ldr r0, [r6, #4]
	bl FUN_0222A53C
	adds r1, r0, #0
	ldr r0, [r6, #4]
	bl FUN_0222AB28
	add r1, sp, #0x18
	str r1, [sp]
	ldr r1, [sp, #0x44]
	ldr r3, [sp, #0x14]
	str r1, [sp, #4]
	ldr r1, _02259960 @ =0x000B0C00
	adds r2, r7, #0
	str r1, [sp, #8]
	ldr r1, _02259964 @ =0x000F0E00
	str r1, [sp, #0xc]
	adds r1, r4, #0
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r1, #0xa8
	bl ov47_022599F0
	adds r1, r4, #0
	ldr r2, [sp, #0x14]
	adds r0, r4, #0
	adds r1, #0xdc
	movs r3, #2
	bl ov47_02259B30
	ldr r0, _0225995C @ =0x000005D7
	bl FUN_0200604C
	movs r0, #0x12
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_022598DC:
	ldr r1, [sp, #0x14]
	bl ov47_02259B74
	cmp r0, #1
	bne _02259948
	movs r0, #0x13
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_022598EE:
	ldr r0, _02259950 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _02259948
	movs r0, #0x14
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_02259900:
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x78
	bl ov47_02258CEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov47_022592B4
	adds r0, r4, #0
	movs r1, #0x15
	adds r0, #0x62
	strh r1, [r0]
	movs r0, #0x16
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_02259922:
	adds r0, r5, #0
	bl ov47_022593CC
	add sp, #0x28
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225992E:
	adds r0, r5, #0
	bl ov47_022593B4
	cmp r0, #1
	bne _02259948
	adds r0, r4, #0
	adds r0, #0x62
	ldrh r0, [r0]
	adds r4, #0x60
	strh r0, [r4]
	b _02259948
_02259944:
	bl GF_AssertFail
_02259948:
	movs r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02259950: .4byte 0x021D110C
_02259954: .4byte 0x00090A00
_02259958: .4byte 0x000D0E00
_0225995C: .4byte 0x000005D7
_02259960: .4byte 0x000B0C00
_02259964: .4byte 0x000F0E00
	thumb_func_end ov47_02259578

	thumb_func_start ov47_02259968
ov47_02259968: @ 0x02259968
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x88
	bl ov47_02259D24
	adds r0, r5, #0
	adds r0, #0xa8
	bl ov47_02259D24
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r0, r5, #0
	movs r4, #0
	adds r0, #0x80
	str r4, [r0]
_0225998C:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #6
	blt _0225998C
	pop {r3, r4, r5, pc}
	thumb_func_end ov47_02259968

	thumb_func_start ov47_0225999C
ov47_0225999C: @ 0x0225999C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r1, #0
	adds r7, r2, #0
	movs r1, #0
	adds r5, r0, #0
	adds r4, r3, #0
	bl FUN_0201D978
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl ov47_02258CEC
	adds r6, r0, #0
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r4, #0x90
	movs r0, #0
	subs r3, r4, r3
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	lsrs r3, r3, #1
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov47_0225999C

	thumb_func_start ov47_022599F0
ov47_022599F0: @ 0x022599F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r6, r0, #0
	str r1, [sp, #0x20]
	adds r0, #0x10
	movs r1, #0
	str r2, [sp, #0x10]
	ldr r7, [sp, #0x38]
	ldr r4, [sp, #0x40]
	bl FUN_0201D978
	adds r0, r6, #0
	adds r0, #0x50
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	movs r2, #0
	bl ov47_02259D58
	movs r3, #0
	adds r2, r0, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	adds r0, r6, #0
	str r4, [sp, #8]
	adds r0, #0x10
	movs r1, #1
	str r3, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	movs r2, #1
	bl ov47_02259D58
	adds r2, r0, #0
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	adds r0, r6, #0
	str r4, [sp, #8]
	movs r3, #0
	adds r0, #0x10
	movs r1, #1
	str r3, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	movs r2, #2
	bl ov47_02259D58
	adds r2, r0, #0
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	adds r0, r6, #0
	str r4, [sp, #8]
	movs r3, #0
	adds r0, #0x10
	movs r1, #1
	str r3, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x20]
	ldr r1, [r7]
	ldr r0, [r0, #4]
	cmp r1, r0
	bne _02259B1C
	ldr r0, [r7, #4]
	cmp r0, #3
	bhs _02259B1C
	ldr r0, [sp, #0x48]
	cmp r0, #1
	bne _02259A96
	ldr r0, [sp, #0x44]
	str r0, [sp, #0x14]
	b _02259A98
_02259A96:
	str r4, [sp, #0x14]
_02259A98:
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x3c]
	movs r1, #0
	bl ov47_02258D78
	ldr r0, [sp, #0x10]
	movs r1, #0
	movs r2, #0x6e
	bl ov47_02258CEC
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	movs r0, #1
	movs r2, #0
	bl FUN_02002F30
	str r0, [sp, #0x1c]
	movs r1, #0
	ldr r3, [sp, #0x1c]
	movs r5, #0x60
	subs r5, r5, r3
	lsrs r3, r5, #0x1f
	adds r3, r5, r3
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	adds r0, r6, #0
	str r1, [sp, #0xc]
	adds r0, #0x50
	movs r1, #1
	asrs r3, r3, #1
	bl FUN_020200FC
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	ldr r2, [r7, #4]
	bl ov47_02259D58
	adds r5, r0, #0
	movs r0, #1
	adds r1, r5, #0
	movs r2, #0
	bl FUN_02002F30
	movs r1, #0
	adds r3, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r4, #0x68
	subs r4, r4, r3
	lsrs r3, r4, #0x1f
	adds r3, r4, r3
	adds r0, r6, #0
	asrs r3, r3, #1
	str r1, [sp, #0xc]
	adds r0, #0x50
	movs r1, #1
	adds r2, r5, #0
	adds r3, #0x60
	bl FUN_020200FC
_02259B1C:
	adds r0, r6, #0
	adds r0, #0x50
	bl FUN_0201D5C8
	adds r6, #0x10
	adds r0, r6, #0
	bl FUN_0201D5C8
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov47_022599F0

	thumb_func_start ov47_02259B30
ov47_02259B30: @ 0x02259B30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	lsls r0, r3, #0x18
	movs r4, #0
	lsrs r0, r0, #0x18
	str r1, [sp]
	str r4, [r6, #0x64]
	adds r5, r6, #0
	str r0, [sp, #4]
_02259B44:
	movs r0, #0
	str r0, [r5, #0x68]
	ldr r0, [sp]
	adds r1, r4, #0
	movs r2, #0x50
	bl ov47_02259DA4
	str r0, [r5, #0x74]
	adds r0, r4, #2
	lsls r7, r0, #4
	ldr r1, [sp, #4]
	adds r0, r6, r7
	bl FUN_0201EEB0
	adds r0, r6, r7
	movs r1, #0
	bl FUN_0201D978
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _02259B44
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov47_02259B30

	thumb_func_start ov47_02259B74
ov47_02259B74: @ 0x02259B74
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r6, r0, #0
	ldr r0, [r6, #0x64]
	cmp r0, #0x14
	blt _02259B86
	add sp, #0x2c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02259B86:
	adds r1, r0, #1
	movs r0, #0x50
	str r1, [r6, #0x64]
	muls r0, r1, r0
	movs r1, #0x14
	blx FUN_020F2998
	str r0, [sp, #0x24]
	movs r0, #0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r6, [sp, #0x18]
_02259B9E:
	ldr r0, [sp, #0x18]
	ldr r2, [r0, #0x74]
	ldr r0, [r0, #0x68]
	cmp r0, r2
	bne _02259BB0
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	b _02259C18
_02259BB0:
	ldr r1, [sp, #0x24]
	cmp r2, r1
	blt _02259BBE
	subs r4, r1, r0
	adds r2, r1, #0
	ldr r1, [sp, #0x18]
	b _02259BC2
_02259BBE:
	ldr r1, [sp, #0x18]
	subs r4, r2, r0
_02259BC2:
	movs r5, #0
	str r2, [r1, #0x68]
	cmp r4, #0
	ble _02259C0C
	ldr r1, [sp, #0x20]
	adds r0, r0, #4
	adds r1, r1, #2
	lsls r7, r1, #4
	str r0, [sp, #0x28]
_02259BD4:
	movs r0, #1
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	adds r1, r6, #0
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0x10
	str r0, [sp, #0x14]
	adds r1, #0x84
	ldr r1, [r1]
	adds r0, r6, r7
	ldr r1, [r1, #0x14]
	movs r2, #0xf7
	movs r3, #0x10
	bl FUN_0201D9D8
	adds r5, r5, #1
	cmp r5, r4
	blt _02259BD4
_02259C0C:
	ldr r0, [sp, #0x20]
	adds r0, r0, #2
	lsls r0, r0, #4
	adds r0, r6, r0
	bl FUN_0201D5C8
_02259C18:
	ldr r0, [sp, #0x18]
	adds r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	adds r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #3
	blt _02259B9E
	ldr r0, [sp, #0x1c]
	cmp r0, #3
	bne _02259C34
	add sp, #0x2c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02259C34:
	movs r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov47_02259B74

	thumb_func_start ov47_02259C3C
ov47_02259C3C: @ 0x02259C3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	adds r7, r0, #0
	str r4, [sp, #8]
	movs r0, #5
	str r3, [sp, #0xc]
	lsls r0, r0, #6
	ldr r0, [r2, r0]
	str r1, [sp, #0x10]
	ldr r2, [r2]
	movs r1, #0xcb
	adds r3, r4, #0
	bl FUN_02007B68
	adds r5, r7, #0
	adds r6, r4, #0
_02259C62:
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_0201D978
	adds r0, r5, #0
	bl FUN_0201D578
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #6
	blt _02259C62
	ldr r1, [sp, #0x10]
	ldr r3, _02259C88 @ =0x00050600
	adds r0, r7, #0
	movs r2, #0x77
	bl ov47_0225999C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02259C88: .4byte 0x00050600
	thumb_func_end ov47_02259C3C

	thumb_func_start ov47_02259C8C
ov47_02259C8C: @ 0x02259C8C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #1
	adds r7, r2, #0
	str r1, [sp]
	lsls r0, r0, #8
	adds r1, r7, #0
	bl FUN_02026354
	str r0, [r5, #0x10]
	movs r6, #0
	adds r4, r5, #0
_02259CA4:
	movs r0, #1
	lsls r0, r0, #8
	adds r1, r7, #0
	bl FUN_02026354
	str r0, [r4, #0x14]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #3
	blt _02259CA4
	ldr r0, [sp]
	cmp r0, #1
	bne _02259CC2
	movs r6, #0
	b _02259CC4
_02259CC2:
	movs r6, #4
_02259CC4:
	adds r0, r6, #2
	bl FUN_0222F544
	str r0, [r5, #8]
	adds r0, r6, #1
	bl FUN_0222F544
	str r0, [r5]
	adds r0, r6, #0
	bl FUN_0222F544
	str r0, [r5, #4]
	adds r0, r6, #3
	bl FUN_0222F544
	str r0, [r5, #0xc]
	cmp r0, #1
	bne _02259D20
	adds r0, r6, #0
	bl FUN_0222F628
	adds r4, r0, #0
	bne _02259CF6
	bl GF_AssertFail
_02259CF6:
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	bl FUN_020269A0
	movs r4, #0
	adds r7, r6, #1
_02259D02:
	adds r0, r7, r4
	bl FUN_0222F628
	adds r6, r0, #0
	bne _02259D10
	bl GF_AssertFail
_02259D10:
	ldr r0, [r5, #0x14]
	adds r1, r6, #0
	bl FUN_020269A0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _02259D02
_02259D20:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov47_02259C8C

	thumb_func_start ov47_02259D24
ov47_02259D24: @ 0x02259D24
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	bl FUN_02026380
	movs r4, #0
_02259D30:
	ldr r0, [r5, #0x14]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _02259D30
	pop {r3, r4, r5, pc}
	thumb_func_end ov47_02259D24

	thumb_func_start ov47_02259D40
ov47_02259D40: @ 0x02259D40
	push {r3, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	cmp r0, #0
	bne _02259D54
	adds r0, r1, #0
	ldr r1, [r2]
	bl ov47_02258D18
	pop {r3, pc}
_02259D54:
	ldr r0, [r2, #0x10]
	pop {r3, pc}
	thumb_func_end ov47_02259D40

	thumb_func_start ov47_02259D58
ov47_02259D58: @ 0x02259D58
	push {r3, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	cmp r0, #0
	bne _02259D6C
	adds r0, r1, #0
	ldr r1, [r3]
	bl ov47_02258D44
	pop {r3, pc}
_02259D6C:
	lsls r0, r2, #2
	adds r0, r3, r0
	ldr r0, [r0, #0x14]
	pop {r3, pc}
	thumb_func_end ov47_02259D58

	thumb_func_start ov47_02259D74
ov47_02259D74: @ 0x02259D74
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	str r6, [r5, #0xc]
	adds r4, r5, #0
	str r6, [r5, #0x10]
	adds r4, #0xc
	adds r7, r6, #0
_02259D84:
	adds r0, r6, #0
	adds r0, #8
	bl FUN_0222F544
	str r0, [r5]
	ldr r1, [r4]
	ldr r2, [r4, #4]
	adds r0, r1, r0
	adcs r2, r7
	str r0, [r4]
	adds r6, r6, #1
	adds r5, r5, #4
	str r2, [r4, #4]
	cmp r6, #3
	blt _02259D84
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov47_02259D74

	thumb_func_start ov47_02259DA4
ov47_02259DA4: @ 0x02259DA4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #3
	blo _02259DB4
	bl GF_AssertFail
_02259DB4:
	lsls r2, r4, #2
	movs r1, #0
	ldr r2, [r5, r2]
	adds r0, r6, #0
	adds r3, r1, #0
	blx FUN_020F2948
	ldr r2, [r5, #0xc]
	ldr r3, [r5, #0x10]
	blx FUN_020F2900
	pop {r4, r5, r6, pc}
	thumb_func_end ov47_02259DA4

	thumb_func_start ov47_02259DCC
ov47_02259DCC: @ 0x02259DCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	str r1, [sp]
	adds r2, r6, #0
	movs r1, #0x14
	movs r0, #0
_02259DDA:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _02259DDA
	adds r4, r6, #0
	movs r5, #0
	adds r4, #0xc
_02259DE8:
	ldr r0, [sp]
	adds r1, r5, #0
	bl FUN_0222A578
	adds r7, r0, #0
	beq _02259E2A
	bl FUN_0222AA54
	str r0, [sp, #4]
	adds r0, r7, #0
	add r1, sp, #8
	bl FUN_0222AB0C
	ldr r1, [sp, #4]
	movs r0, #0
	bl FUN_0222F6B0
	cmp r0, #1
	bne _02259E2A
	ldr r0, [sp, #0xc]
	cmp r0, #3
	bhs _02259E2A
	lsls r1, r0, #2
	ldr r0, [r6, r1]
	adds r0, r0, #1
	str r0, [r6, r1]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	adds r2, r0, #1
	ldr r0, _02259E34 @ =0x00000000
	str r2, [r4]
	adcs r1, r0
	str r1, [r4, #4]
_02259E2A:
	adds r5, r5, #1
	cmp r5, #0x14
	blt _02259DE8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02259E34: .4byte 0x00000000
	thumb_func_end ov47_02259DCC

	.rodata

_02259E38:
	.byte 0x01, 0x19, 0x0D, 0x06, 0x04, 0x04, 0x94, 0x00
	.byte 0x02, 0x0B, 0x07, 0x0F, 0x08, 0x03, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x80, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x04, 0x00, 0x00, 0x80, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x04, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x03, 0x00, 0x00
	.byte 0xF9, 0x02, 0x00, 0x00, 0xFD, 0x02, 0x00, 0x00, 0xF6, 0x02, 0x00, 0x00, 0xF7, 0x02, 0x00, 0x00
	.byte 0xF8, 0x02, 0x00, 0x00, 0xFA, 0x02, 0x00, 0x00, 0xFB, 0x02, 0x00, 0x00, 0xFC, 0x02, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x07, 0x01, 0x12, 0x03, 0x03, 0x01, 0x00
	.byte 0x02, 0x05, 0x05, 0x0C, 0x09, 0x03, 0x37, 0x00, 0x02, 0x11, 0x05, 0x0B, 0x02, 0x04, 0xA3, 0x00
	.byte 0x02, 0x11, 0x08, 0x0B, 0x02, 0x04, 0xB9, 0x00, 0x02, 0x11, 0x0B, 0x0B, 0x02, 0x04, 0xCF, 0x00
	.byte 0x02, 0x03, 0x0F, 0x19, 0x02, 0x03, 0xE5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_02259FA0:
	.byte 0xC9, 0x8D, 0x25, 0x02, 0x81, 0x94, 0x25, 0x02, 0xB5, 0x8D, 0x25, 0x02, 0x6D, 0x94, 0x25, 0x02
	.byte 0xA9, 0x8D, 0x25, 0x02, 0x5D, 0x94, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x02259FC0
