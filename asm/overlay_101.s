
	thumb_func_start ov101_021E7740
ov101_021E7740: @ 0x021E7740
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	adds r5, r0, #0
	ldr r0, _021E7790 @ =0x0000001A
	movs r1, #2
	bl FUN_02006FF8
	movs r0, #3
	movs r1, #0x5b
	lsls r2, r0, #0x10
	bl FUN_0201A910
	ldr r1, _021E7794 @ =0x000009F4
	adds r0, r4, #0
	movs r2, #0x5b
	bl FUN_02007280
	ldr r2, _021E7794 @ =0x000009F4
	adds r4, r0, #0
	movs r1, #0
	blx FUN_020E5B44
	str r5, [r4, #0x10]
	movs r0, #0x5b
	str r0, [r4]
	adds r0, r4, #0
	bl ov101_021E78EC
	movs r0, #0x85
	ldr r1, _021E7798 @ =0x021F7372
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r1, #0x64
	adds r0, r1, #0
	adds r0, #0xd2
	strb r1, [r4, r0]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7790: .4byte 0x0000001A
_021E7794: .4byte 0x000009F4
_021E7798: .4byte 0x021F7372
	thumb_func_end ov101_021E7740

	thumb_func_start ov101_021E779C
ov101_021E779C: @ 0x021E779C
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	cmp r1, #0xd
	bhi _021E782E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E77B6: @ jump table
	.2byte _021E77D2 - _021E77B6 - 2 @ case 0
	.2byte _021E77DA - _021E77B6 - 2 @ case 1
	.2byte _021E77E2 - _021E77B6 - 2 @ case 2
	.2byte _021E782E - _021E77B6 - 2 @ case 3
	.2byte _021E77EA - _021E77B6 - 2 @ case 4
	.2byte _021E77F2 - _021E77B6 - 2 @ case 5
	.2byte _021E77FA - _021E77B6 - 2 @ case 6
	.2byte _021E7802 - _021E77B6 - 2 @ case 7
	.2byte _021E780A - _021E77B6 - 2 @ case 8
	.2byte _021E7812 - _021E77B6 - 2 @ case 9
	.2byte _021E781A - _021E77B6 - 2 @ case 10
	.2byte _021E7822 - _021E77B6 - 2 @ case 11
	.2byte _021E782E - _021E77B6 - 2 @ case 12
	.2byte _021E782A - _021E77B6 - 2 @ case 13
_021E77D2:
	bl ov101_021E7B90
	str r0, [r4]
	b _021E782E
_021E77DA:
	bl ov101_021E7BB4
	str r0, [r4]
	b _021E782E
_021E77E2:
	bl ov101_021E7C10
	str r0, [r4]
	b _021E782E
_021E77EA:
	bl ov101_021E7D50
	str r0, [r4]
	b _021E782E
_021E77F2:
	bl ov101_021E7E28
	str r0, [r4]
	b _021E782E
_021E77FA:
	bl ov101_021E7E98
	str r0, [r4]
	b _021E782E
_021E7802:
	bl ov101_021E7F20
	str r0, [r4]
	b _021E782E
_021E780A:
	bl ov101_021E7C38
	str r0, [r4]
	b _021E782E
_021E7812:
	bl ov101_021E7C4C
	str r0, [r4]
	b _021E782E
_021E781A:
	bl ov101_021E7D28
	str r0, [r4]
	b _021E782E
_021E7822:
	bl ov101_021E7D3C
	str r0, [r4]
	b _021E782E
_021E782A:
	movs r0, #1
	pop {r4, pc}
_021E782E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021E779C

	thumb_func_start ov101_021E7834
ov101_021E7834: @ 0x021E7834
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov101_021E7B54
	ldr r0, [r4, #0x38]
	bl FUN_0203B0C8
	ldr r2, [r4, #0x10]
	ldr r0, [r2, #0x1c]
	cmp r0, #6
	beq _021E7858
	ldrb r1, [r2, #5]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2, #5]
_021E7858:
	ldr r4, [r4]
	adds r0, r5, #0
	bl FUN_02007294
	adds r0, r4, #0
	bl FUN_0201A9C4
	ldr r0, _021E7870 @ =0x0000001A
	bl FUN_02006F7C
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7870: .4byte 0x0000001A
	thumb_func_end ov101_021E7834

	thumb_func_start ov101_021E7874
ov101_021E7874: @ 0x021E7874
	push {r3, r4}
	sub sp, #8
	ldr r3, _021E78AC @ =_021F7358
	add r2, sp, #0
	ldrh r4, [r3, #6]
	add r1, sp, #0
	strh r4, [r2]
	ldrh r4, [r3, #8]
	ldrh r3, [r3, #0xa]
	strh r4, [r2, #2]
	strh r3, [r2, #4]
	movs r3, #0
_021E788C:
	ldrh r2, [r1]
	cmp r0, r2
	bne _021E789A
	add sp, #8
	movs r0, #1
	pop {r3, r4}
	bx lr
_021E789A:
	adds r3, r3, #1
	adds r1, r1, #2
	cmp r3, #3
	blo _021E788C
	movs r0, #0
	add sp, #8
	pop {r3, r4}
	bx lr
	nop
_021E78AC: .4byte _021F7358
	thumb_func_end ov101_021E7874

	thumb_func_start ov101_021E78B0
ov101_021E78B0: @ 0x021E78B0
	push {r3, r4}
	sub sp, #0x10
	ldr r4, _021E78E8 @ =0x021F7364
	add r3, sp, #0
	movs r2, #7
_021E78BA:
	ldrh r1, [r4]
	adds r4, r4, #2
	strh r1, [r3]
	adds r3, r3, #2
	subs r2, r2, #1
	bne _021E78BA
	movs r2, #0
	add r3, sp, #0
_021E78CA:
	ldrh r1, [r3]
	cmp r0, r1
	bne _021E78D8
	add sp, #0x10
	movs r0, #1
	pop {r3, r4}
	bx lr
_021E78D8:
	adds r2, r2, #1
	adds r3, r3, #2
	cmp r2, #7
	blo _021E78CA
	movs r0, #0
	add sp, #0x10
	pop {r3, r4}
	bx lr
	.align 2, 0
_021E78E8: .4byte 0x021F7364
	thumb_func_end ov101_021E78B0

	thumb_func_start ov101_021E78EC
ov101_021E78EC: @ 0x021E78EC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x10]
	ldr r2, _021E7B3C @ =ov101_021EB338
	str r5, [r1, #0x64]
	ldr r1, [r5, #0x10]
	str r2, [r1, #0x5c]
	ldr r2, _021E7B40 @ =ov101_021EB2FC
	ldr r1, [r5, #0x10]
	str r2, [r1, #0x60]
	bl ov101_021ED4E0
	ldr r0, [r5, #0x10]
	ldrb r0, [r0, #4]
	cmp r0, #4
	beq _021E7936
	movs r0, #0
	strb r0, [r5, #0xc]
	ldr r0, [r5, #0x10]
	movs r1, #2
	strb r1, [r0, #4]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x28]
	bl FUN_0202EEA4
	movs r3, #0x4e
	lsls r3, r3, #2
	ldrb r1, [r5, r3]
	movs r2, #1
	lsls r0, r0, #0x18
	bics r1, r2
	lsrs r2, r0, #0x18
	movs r0, #1
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, r3]
	b _021E799A
_021E7936:
	movs r0, #1
	strb r0, [r5, #0xc]
	ldr r3, [r5, #0x10]
	adds r2, r5, #0
	adds r3, #0x3c
	adds r2, #0x14
	movs r1, #0xe
_021E7944:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _021E7944
	movs r1, #0x4e
	lsls r1, r1, #2
	ldrb r3, [r5, r1]
	ldrb r2, [r5, #0x15]
	movs r0, #1
	bics r3, r0
	movs r0, #1
	ands r0, r2
	orrs r0, r3
	strb r0, [r5, r1]
	ldrh r1, [r5, #0x2e]
	ldr r0, _021E7B44 @ =0x0000FFFF
	cmp r1, r0
	beq _021E798C
	ldrh r1, [r5, #0x2c]
	adds r0, r5, #0
	bl ov101_021ED614
	cmp r0, #0
	bne _021E7980
	ldrh r1, [r5, #0x2c]
	adds r0, r5, #0
	bl ov101_021ED64C
_021E7980:
	ldrh r1, [r5, #0x16]
	ldrh r2, [r5, #0x2e]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov101_021ED79C
_021E798C:
	ldr r0, [r5, #0x10]
	movs r1, #0
	adds r0, #0x38
	strb r1, [r0]
	ldr r0, [r5, #0x10]
	movs r1, #2
	strb r1, [r0, #4]
_021E799A:
	movs r1, #0x4e
	lsls r1, r1, #2
	ldrb r2, [r5, r1]
	movs r0, #0x10
	bics r2, r0
	strb r2, [r5, r1]
	ldrb r2, [r5, r1]
	movs r0, #0xe
	bics r2, r0
	strb r2, [r5, r1]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x28]
	bl FUN_0202EE70
	movs r2, #0x4e
	lsls r2, r2, #2
	lsls r0, r0, #0x1e
	ldrb r3, [r5, r2]
	movs r1, #0x60
	lsrs r0, r0, #0x19
	bics r3, r1
	orrs r0, r3
	strb r0, [r5, r2]
	ldr r0, [r5]
	bl FUN_0203B094
	str r0, [r5, #0x38]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x24]
	bl FUN_0202ED88
	movs r1, #0x49
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5]
	bl FUN_02095EF8
	movs r1, #0x4a
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x28]
	bl FUN_0202EF44
	movs r1, #0x4b
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x28]
	bl FUN_0202EEC0
	movs r2, #0x13
	lsls r2, r2, #4
	strb r0, [r5, r2]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x20]
	adds r0, #0x22
	ldrb r1, [r0]
	adds r0, r2, #0
	subs r0, #0x28
	strh r1, [r5, r0]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x20]
	adds r0, #0x23
	ldrb r0, [r0]
	adds r1, r0, #2
	adds r0, r2, #0
	subs r0, #0x26
	strh r1, [r5, r0]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x20]
	ldrh r1, [r0, #0x10]
	adds r0, r2, #0
	subs r0, #0x24
	strh r1, [r5, r0]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x20]
	ldrb r1, [r0, #7]
	adds r0, r2, #0
	subs r0, #0x22
	strh r1, [r5, r0]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x20]
	adds r0, #0x22
	ldrb r1, [r0]
	adds r0, r2, #0
	subs r0, #0x20
	strh r1, [r5, r0]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x20]
	adds r0, #0x23
	ldrb r0, [r0]
	adds r1, r0, #2
	adds r0, r2, #0
	subs r0, #0x1e
	strh r1, [r5, r0]
	movs r1, #1
	adds r0, r1, #0
	adds r0, #0xff
	strh r1, [r5, r0]
	adds r0, r2, #0
	subs r0, #0x2c
	strh r1, [r5, r0]
	adds r0, r2, #0
	adds r0, #8
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1e
	lsls r1, r0, #1
	ldr r0, _021E7B48 @ =_021F7358
	ldrh r1, [r0, r1]
	adds r0, r2, #0
	subs r0, #0x2e
	strh r1, [r5, r0]
	movs r1, #0x11
	adds r0, r1, #0
	adds r0, #0xf5
	strh r1, [r5, r0]
	movs r1, #8
	adds r0, r2, #1
	strb r1, [r5, r0]
	adds r0, r2, #2
	strb r1, [r5, r0]
	movs r1, #0
	adds r0, r2, #3
	strb r1, [r5, r0]
	adds r0, r2, #0
	adds r0, #0xd
	ldrb r0, [r5, r0]
	movs r1, #2
	adds r2, #0xd
	orrs r0, r1
	strb r0, [r5, r2]
	ldr r0, [r5, #0x10]
	movs r2, #0xf
	ldr r0, [r0, #0x2c]
	bl FUN_02066930
	ldr r3, _021E7B4C @ =0x0000013D
	movs r2, #1
	ldrb r1, [r5, r3]
	lsls r0, r0, #0x18
	bics r1, r2
	lsrs r2, r0, #0x18
	movs r0, #1
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, r3]
	subs r3, #0x31
	ldrh r0, [r5, r3]
	bl ov101_021E7874
	ldr r3, _021E7B4C @ =0x0000013D
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1f
	ldrb r1, [r5, r3]
	movs r2, #4
	lsrs r0, r0, #0x1d
	bics r1, r2
	orrs r0, r1
	strb r0, [r5, r3]
	subs r3, #0x31
	ldrh r0, [r5, r3]
	bl ov101_021E78B0
	ldr r3, _021E7B4C @ =0x0000013D
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1f
	ldrb r1, [r5, r3]
	movs r2, #8
	lsrs r0, r0, #0x1c
	bics r1, r2
	orrs r0, r1
	strb r0, [r5, r3]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x24]
	bl FUN_0202D9C4
	movs r4, #0
	adds r6, r0, #0
	adds r7, r4, #0
_021E7B0A:
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	bl FUN_0202DA28
	cmp r0, #0
	beq _021E7B2E
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	bl FUN_0202DA54
	movs r1, #1
	bl FUN_0202DA6C
	ldr r1, _021E7B50 @ =0x000009E8
	strh r0, [r5, r1]
	b _021E7B32
_021E7B2E:
	ldr r0, _021E7B50 @ =0x000009E8
	strh r7, [r5, r0]
_021E7B32:
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #4
	blt _021E7B0A
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E7B3C: .4byte ov101_021EB338
_021E7B40: .4byte ov101_021EB2FC
_021E7B44: .4byte 0x0000FFFF
_021E7B48: .4byte _021F7358
_021E7B4C: .4byte 0x0000013D
_021E7B50: .4byte 0x000009E8
	thumb_func_end ov101_021E78EC

	thumb_func_start ov101_021E7B54
ov101_021E7B54: @ 0x021E7B54
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02095F68
	ldr r0, [r4, #0x10]
	movs r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0x10]
	str r1, [r0, #0x60]
	adds r0, r4, #0
	bl ov101_021ED5AC
	movs r1, #0x4e
	lsls r1, r1, #2
	ldrb r1, [r4, r1]
	ldr r0, [r4, #0x10]
	lsls r1, r1, #0x1f
	ldr r0, [r0, #0x28]
	lsrs r1, r1, #0x1f
	bl FUN_0202EEA8
	pop {r4, pc}
	thumb_func_end ov101_021E7B54

	thumb_func_start ov101_021E7B90
ov101_021E7B90: @ 0x021E7B90
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021E7FF4
	cmp r0, #0
	bne _021E7BA0
	movs r0, #0
	pop {r4, pc}
_021E7BA0:
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	beq _021E7BAE
	movs r0, #6
	pop {r4, pc}
_021E7BAE:
	movs r0, #4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021E7B90

	thumb_func_start ov101_021E7BB4
ov101_021E7BB4: @ 0x021E7BB4
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	add r1, sp, #0
	adds r4, r0, #0
	bl ov101_021EB5DC
	ldr r1, [sp]
	cmp r1, #0
	bne _021E7BE4
	ldr r0, [r4, #0x10]
	bl FUN_021E5900
	ldr r0, [r4, #0x10]
	ldrb r1, [r0, #6]
	cmp r1, #1
	bne _021E7BDE
	bl FUN_021E59CC
	b _021E7BE4
_021E7BDE:
	adds r0, r4, #0
	bl ov101_021EB568
_021E7BE4:
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x1c]
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021E7C0A
	cmp r0, #4
	beq _021E7BFE
	cmp r0, #7
	bne _021E7C04
	add sp, #4
	movs r0, #8
	pop {r3, r4, pc}
_021E7BFE:
	add sp, #4
	movs r0, #5
	pop {r3, r4, pc}
_021E7C04:
	add sp, #4
	movs r0, #7
	pop {r3, r4, pc}
_021E7C0A:
	movs r0, #1
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov101_021E7BB4

	thumb_func_start ov101_021E7C10
ov101_021E7C10: @ 0x021E7C10
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021E8070
	cmp r0, #0
	bne _021E7C20
	movs r0, #2
	pop {r4, pc}
_021E7C20:
	ldr r2, [r4, #0x10]
	adds r4, #0x14
	adds r2, #0x3c
	movs r1, #0xe
_021E7C28:
	ldrh r0, [r4]
	adds r4, r4, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _021E7C28
	movs r0, #0xd
	pop {r4, pc}
	thumb_func_end ov101_021E7C10

	thumb_func_start ov101_021E7C38
ov101_021E7C38: @ 0x021E7C38
	push {r3, lr}
	bl ov101_021E80B4
	cmp r0, #0
	beq _021E7C46
	movs r0, #9
	pop {r3, pc}
_021E7C46:
	movs r0, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov101_021E7C38

	thumb_func_start ov101_021E7C4C
ov101_021E7C4C: @ 0x021E7C4C
	push {r3, r4, r5, lr}
	movs r1, #0
	str r1, [sp]
	movs r1, #0x4f
	adds r5, r0, #0
	lsls r1, r1, #2
	ldrb r1, [r5, r1]
	movs r4, #0
	mvns r4, r4
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	beq _021E7C6E
	cmp r1, #1
	beq _021E7C78
	cmp r1, #2
	beq _021E7C8C
	b _021E7C9E
_021E7C6E:
	add r1, sp, #0
	bl ov101_021ECC58
	adds r4, r0, #0
	b _021E7C9E
_021E7C78:
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0xc]
	cmp r1, #0
	beq _021E7C9E
	bl ov101_021ECF98
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	b _021E7C9E
_021E7C8C:
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0xc]
	cmp r1, #0
	beq _021E7C9E
	bl ov101_021ED2C0
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
_021E7C9E:
	ldr r0, [sp]
	cmp r0, #0
	ldr r0, [r5, #0x10]
	beq _021E7CC4
	ldr r0, [r0, #0xc]
	cmp r0, #1
	beq _021E7CB2
	adds r0, r5, #0
	bl ov101_021EB364
_021E7CB2:
	ldr r0, [r5, #0x10]
	movs r1, #1
	str r1, [r0, #0xc]
	cmp r4, #0
	blt _021E7CC0
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_021E7CC0:
	movs r0, #9
	pop {r3, r4, r5, pc}
_021E7CC4:
	bl FUN_021E5900
	cmp r0, #0
	beq _021E7CE6
	ldr r0, [r5, #0x10]
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #0x10]
	cmp r1, r0
	beq _021E7CE6
	adds r0, r5, #0
	bl ov101_021EB378
	ldr r0, _021E7D24 @ =0x0000093F
	bl FUN_0200604C
	movs r0, #9
	pop {r3, r4, r5, pc}
_021E7CE6:
	movs r0, #0x4f
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	beq _021E7CFC
	cmp r0, #1
	beq _021E7D06
	cmp r0, #2
	beq _021E7D10
	b _021E7D18
_021E7CFC:
	adds r0, r5, #0
	bl ov101_021ECAF0
	adds r4, r0, #0
	b _021E7D18
_021E7D06:
	adds r0, r5, #0
	bl ov101_021ECEA8
	adds r4, r0, #0
	b _021E7D18
_021E7D10:
	adds r0, r5, #0
	bl ov101_021ED158
	adds r4, r0, #0
_021E7D18:
	cmp r4, #0
	bge _021E7D1E
	movs r4, #9
_021E7D1E:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E7D24: .4byte 0x0000093F
	thumb_func_end ov101_021E7C4C

	thumb_func_start ov101_021E7D28
ov101_021E7D28: @ 0x021E7D28
	push {r3, lr}
	bl ov101_021E818C
	cmp r0, #0
	beq _021E7D36
	movs r0, #1
	pop {r3, pc}
_021E7D36:
	movs r0, #0xa
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov101_021E7D28

	thumb_func_start ov101_021E7D3C
ov101_021E7D3C: @ 0x021E7D3C
	ldr r3, [r0, #0x10]
	movs r1, #0x80
	ldrb r2, [r3, #5]
	bics r2, r1
	strb r2, [r3, #5]
	ldr r0, [r0, #0x10]
	movs r1, #6
	str r1, [r0, #0x1c]
	movs r0, #5
	bx lr
	thumb_func_end ov101_021E7D3C

	thumb_func_start ov101_021E7D50
ov101_021E7D50: @ 0x021E7D50
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021E7D62
	cmp r0, #1
	beq _021E7E04
	b _021E7E22
_021E7D62:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _021E7D96
	movs r4, #0
	movs r6, #1
_021E7D82:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #4
	blt _021E7D82
	b _021E7DAA
_021E7D96:
	movs r4, #0
	movs r6, #1
_021E7D9A:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #8
	blt _021E7D9A
_021E7DAA:
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0x10]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x40
	movs r3, #0xc0
	bl FUN_02003E5C
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x78]
	bl FUN_0200398C
	ldr r0, [r5, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021E7E22
_021E7E04:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E7E22
	movs r0, #0
	str r0, [r5, #4]
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _021E7E1C
	add sp, #0xc
	movs r0, #9
	pop {r3, r4, r5, r6, pc}
_021E7E1C:
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_021E7E22:
	movs r0, #4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov101_021E7D50

	thumb_func_start ov101_021E7E28
ov101_021E7E28: @ 0x021E7E28
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021E7E3A
	cmp r0, #1
	beq _021E7E5A
	b _021E7E90
_021E7E3A:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021E7E90
_021E7E5A:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E7E90
	movs r4, #0
	adds r6, r4, #0
_021E7E66:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #8
	blt _021E7E66
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	movs r0, #2
	pop {r3, r4, r5, r6, pc}
_021E7E90:
	movs r0, #5
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021E7E28

	thumb_func_start ov101_021E7E98
ov101_021E7E98: @ 0x021E7E98
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _021E7EAC
	cmp r1, #1
	beq _021E7EE2
	cmp r1, #2
	beq _021E7F02
	b _021E7F16
_021E7EAC:
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	ldr r0, _021E7F1C @ =0x00000135
	movs r4, #0
	strb r4, [r5, r0]
	movs r6, #1
_021E7EBE:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #3
	blt _021E7EBE
	movs r0, #0
	movs r1, #0xe
	movs r2, #1
	bl FUN_0200B4F0
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021E7F16
_021E7EE2:
	movs r1, #0
	bl ov101_021E9CD4
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021E9E90
	cmp r4, #0
	beq _021E7F16
	cmp r0, #0
	beq _021E7F16
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021E7F16
_021E7F02:
	ldr r0, [r5, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r0, #0
	str r0, [r5, #4]
	str r0, [r5, #0x30]
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E7F16:
	movs r0, #6
	pop {r4, r5, r6, pc}
	nop
_021E7F1C: .4byte 0x00000135
	thumb_func_end ov101_021E7E98

	thumb_func_start ov101_021E7F20
ov101_021E7F20: @ 0x021E7F20
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _021E7F36
	cmp r1, #1
	beq _021E7F6C
	cmp r1, #2
	beq _021E7F8C
	b _021E7FEA
_021E7F36:
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r4, #0
	movs r6, #1
_021E7F44:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #3
	blt _021E7F44
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021E9D74
	ldr r0, _021E7FF0 @ =0x00000135
	movs r1, #0
	strb r1, [r5, r0]
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021E7FEA
_021E7F6C:
	movs r1, #1
	bl ov101_021E9CD4
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021E9E90
	cmp r4, #0
	beq _021E7FEA
	cmp r0, #0
	beq _021E7FEA
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021E7FEA
_021E7F8C:
	movs r0, #0x10
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0x10]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x40
	movs r3, #0xc0
	bl FUN_02003E5C
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x78]
	bl FUN_0200398C
	movs r4, #0
	adds r6, r4, #0
_021E7FC2:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #3
	blt _021E7FC2
	ldr r0, [r5, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r0, #0
	str r0, [r5, #4]
	str r0, [r5, #0x30]
	add sp, #8
	movs r0, #2
	pop {r4, r5, r6, pc}
_021E7FEA:
	movs r0, #7
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E7FF0: .4byte 0x00000135
	thumb_func_end ov101_021E7F20

	thumb_func_start ov101_021E7FF4
ov101_021E7FF4: @ 0x021E7FF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #3
	bhi _021E8062
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E800A: @ jump table
	.2byte _021E8012 - _021E800A - 2 @ case 0
	.2byte _021E8018 - _021E800A - 2 @ case 1
	.2byte _021E802E - _021E800A - 2 @ case 2
	.2byte _021E8044 - _021E800A - 2 @ case 3
_021E8012:
	bl ov101_021E8264
	b _021E8062
_021E8018:
	ldr r1, [r4, #0x10]
	ldrb r1, [r1, #8]
	bl ov101_021E8370
	adds r0, r4, #0
	bl ov101_021E84FC
	adds r0, r4, #0
	bl ov101_021E85A8
	b _021E8062
_021E802E:
	bl ov101_021E886C
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	ldrb r1, [r1, #8]
	bl ov101_021E8790
	adds r0, r4, #0
	bl ov101_021E8E34
	b _021E8062
_021E8044:
	ldrb r1, [r4, #0xc]
	cmp r1, #1
	bne _021E8050
	bl ov101_021E90A8
	b _021E8054
_021E8050:
	bl ov101_021E8E58
_021E8054:
	ldr r1, _021E806C @ =ov101_021E9270
	ldr r0, [r4, #0x10]
	str r1, [r0, #0x58]
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021E8062:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E806C: .4byte ov101_021E9270
	thumb_func_end ov101_021E7FF4

	thumb_func_start ov101_021E8070
ov101_021E8070: @ 0x021E8070
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x10]
	movs r2, #0
	str r2, [r1, #0x58]
	ldr r1, [r4, #0x10]
	ldr r1, [r1, #0x1c]
	cmp r1, #6
	bne _021E808C
	bl ov101_021E8774
	adds r0, r4, #0
	bl ov101_021E8E20
_021E808C:
	adds r0, r4, #0
	bl ov101_021E8E4C
	adds r0, r4, #0
	bl ov101_021E88A8
	adds r0, r4, #0
	bl ov101_021E862C
	adds r0, r4, #0
	bl ov101_021E857C
	adds r0, r4, #0
	bl ov101_021E84B8
	adds r0, r4, #0
	bl ov101_021E8354
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov101_021E8070

	thumb_func_start ov101_021E80B4
ov101_021E80B4: @ 0x021E80B4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #4
	bhi _021E817C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E80CC: @ jump table
	.2byte _021E80D6 - _021E80CC - 2 @ case 0
	.2byte _021E80FC - _021E80CC - 2 @ case 1
	.2byte _021E8120 - _021E80CC - 2 @ case 2
	.2byte _021E814C - _021E80CC - 2 @ case 3
	.2byte _021E8162 - _021E80CC - 2 @ case 4
_021E80D6:
	bl ov101_021E933C
	adds r0, r4, #0
	movs r1, #1
	bl ov101_021E9D74
	movs r1, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #3
	adds r3, r1, #0
	bl FUN_0200FA24
	b _021E817C
_021E80FC:
	bl FUN_0200FB5C
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #1
	bl ov101_021E9E90
	cmp r5, #0
	beq _021E8112
	cmp r0, #0
	bne _021E8118
_021E8112:
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_021E8118:
	adds r0, r4, #0
	bl ov101_021E8E3C
	b _021E817C
_021E8120:
	movs r1, #1
	bl ov101_021E9264
	adds r0, r4, #0
	bl ov101_021E90A8
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #3
	movs r3, #0
	bl FUN_0200FA24
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021E9FDC
	b _021E817C
_021E814C:
	bl FUN_0200FB5C
	cmp r0, #0
	bne _021E815A
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_021E815A:
	ldr r0, _021E8188 @ =0x00000944
	bl FUN_0200604C
	b _021E817C
_021E8162:
	movs r1, #0
	bl ov101_021EA0D8
	cmp r0, #0
	bne _021E8172
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_021E8172:
	movs r0, #0
	str r0, [r4, #8]
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_021E817C:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_021E8188: .4byte 0x00000944
	thumb_func_end ov101_021E80B4

	thumb_func_start ov101_021E818C
ov101_021E818C: @ 0x021E818C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #4
	bhi _021E8254
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E81A4: @ jump table
	.2byte _021E81AE - _021E81A4 - 2 @ case 0
	.2byte _021E81BC - _021E81A4 - 2 @ case 1
	.2byte _021E81E6 - _021E81A4 - 2 @ case 2
	.2byte _021E8202 - _021E81A4 - 2 @ case 3
	.2byte _021E822E - _021E81A4 - 2 @ case 4
_021E81AE:
	movs r1, #1
	bl ov101_021E9FDC
	ldr r0, _021E8260 @ =0x00000944
	bl FUN_0200604C
	b _021E8254
_021E81BC:
	movs r1, #1
	bl ov101_021EA0D8
	cmp r0, #0
	bne _021E81CC
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_021E81CC:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	str r0, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #3
	adds r3, r1, #0
	bl FUN_0200FA24
	b _021E8254
_021E81E6:
	bl FUN_0200FB5C
	cmp r0, #0
	bne _021E81F4
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_021E81F4:
	adds r0, r4, #0
	bl ov101_021E8774
	adds r0, r4, #0
	bl ov101_021E8E20
	b _021E8254
_021E8202:
	movs r1, #0
	bl ov101_021E9264
	adds r0, r4, #0
	bl ov101_021E8E58
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021E9D74
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #3
	movs r3, #0
	bl FUN_0200FA24
	b _021E8254
_021E822E:
	bl FUN_0200FB5C
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021E9E90
	cmp r5, #0
	beq _021E8244
	cmp r0, #0
	bne _021E824A
_021E8244:
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_021E824A:
	movs r0, #0
	str r0, [r4, #8]
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_021E8254:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_021E8260: .4byte 0x00000944
	thumb_func_end ov101_021E818C

	thumb_func_start ov101_021E8264
ov101_021E8264: @ 0x021E8264
	push {r4, r5, r6, r7, lr}
	sub sp, #0xac
	adds r5, r0, #0
	movs r0, #1
	movs r1, #5
	movs r2, #0
	blx FUN_020CD9FC
	ldr r4, _021E8350 @ =0x021F7D10
	add r3, sp, #4
	movs r2, #0x15
_021E827A:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E827A
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x74]
	add r2, sp, #4
	bl FUN_0201AD0C
	movs r0, #0
	str r0, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	add r2, sp, #0x20
	adds r3, r1, #0
	bl FUN_0201AD0C
	movs r0, #0
	str r0, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #3
	ldr r0, [r0, #0x74]
	add r2, sp, #0x3c
	movs r3, #2
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #5
	ldr r0, [r0, #0x74]
	add r2, sp, #0x58
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #6
	ldr r0, [r0, #0x74]
	add r2, sp, #0x74
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #7
	ldr r0, [r0, #0x74]
	add r2, sp, #0x90
	bl FUN_0201AD0C
	movs r4, #0
	movs r6, #0x40
	adds r7, r4, #0
_021E82EC:
	ldr r0, [r5, #0x10]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	ldr r3, [r5]
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0201C1C4
	ldr r0, [r5, #0x10]
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r4, #5
	lsls r0, r0, #0x18
	ldr r3, [r5]
	lsrs r0, r0, #0x18
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r0, [r5, #0x10]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201BF7C
	ldr r0, [r5, #0x10]
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201BF7C
	adds r4, r4, #1
	cmp r4, #3
	blt _021E82EC
	add sp, #0xac
	pop {r4, r5, r6, r7, pc}
	nop
_021E8350: .4byte 0x021F7D10
	thumb_func_end ov101_021E8264

	thumb_func_start ov101_021E8354
ov101_021E8354: @ 0x021E8354
	push {r3, lr}
	ldr r0, [r0, #0x10]
	bl FUN_021E5CA4
	movs r1, #0
	ldr r0, _021E836C @ =0x04000050
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp]
	blx FUN_020CF15C
	pop {r3, pc}
	.align 2, 0
_021E836C: .4byte 0x04000050
	thumb_func_end ov101_021E8354

	thumb_func_start ov101_021E8370
ov101_021E8370: @ 0x021E8370
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, [r5]
	movs r0, #0x90
	bl FUN_02007688
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x1a
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	adds r2, r4, #0
	movs r3, #0x90
	bl FUN_0208820C
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	adds r2, r4, #0
	movs r3, #0x90
	bl FUN_0208820C
	adds r0, r6, #0
	adds r0, #0x32
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	adds r2, r4, #0
	movs r3, #0x90
	bl FUN_0208820C
	movs r0, #0xc
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	adds r2, r4, #0
	movs r3, #0x90
	bl FUN_0208820C
	ldr r0, [r5]
	movs r3, #0x5b
	adds r1, r6, #0
	lsls r3, r3, #2
	str r0, [sp]
	adds r0, r4, #0
	adds r1, #0x38
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	movs r3, #0x55
	lsls r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	adds r3, #0x1c
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	movs r3, #0x56
	lsls r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	adds r3, #0x1c
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	movs r3, #0x57
	lsls r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	adds r1, r6, #0
	adds r3, #0x1c
	str r0, [sp]
	adds r0, r4, #0
	adds r1, #0x20
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	movs r3, #0x16
	lsls r3, r3, #4
	str r0, [r5, r3]
	ldr r0, [r5]
	adds r1, r6, #0
	adds r3, #0x1c
	str r0, [sp]
	adds r0, r4, #0
	adds r1, #0x26
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	movs r3, #0x59
	lsls r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	adds r6, #0x2c
	adds r3, #0x1c
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	movs r1, #0x5a
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_0200770C
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021E8370

	thumb_func_start ov101_021E84B8
ov101_021E84B8: @ 0x021E84B8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021E84B8

	thumb_func_start ov101_021E84FC
ov101_021E84FC: @ 0x021E84FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r4, _021E8574 @ =0x021F7B64
	movs r6, #0
	adds r5, r7, r0
_021E850C:
	ldrb r0, [r4, #2]
	adds r1, r5, #0
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #4]
	str r0, [sp, #8]
	ldrb r0, [r4, #5]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x10]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r0, #0x74]
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #7
	ble _021E850C
	movs r0, #0x81
	lsls r0, r0, #2
	adds r0, r7, r0
	bl FUN_0201D3C4
	ldr r0, _021E8578 @ =0x000003C5
	movs r1, #0x81
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r7, #0x10]
	lsls r1, r1, #2
	ldr r0, [r0, #0x74]
	adds r1, r7, r1
	movs r2, #0xb
	movs r3, #2
	bl FUN_0201D494
	movs r0, #0x81
	lsls r0, r0, #2
	adds r0, r7, r0
	movs r1, #0
	bl FUN_0201D9B0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E8574: .4byte 0x021F7B64
_021E8578: .4byte 0x000003C5
	thumb_func_end ov101_021E84FC

	thumb_func_start ov101_021E857C
ov101_021E857C: @ 0x021E857C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x61
	lsls r0, r0, #2
	movs r4, #0
	adds r5, r6, r0
_021E8588:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #8
	blt _021E8588
	movs r0, #0x81
	lsls r0, r0, #2
	adds r0, r6, r0
	bl FUN_0201D520
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021E857C

	thumb_func_start ov101_021E85A8
ov101_021E85A8: @ 0x021E85A8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x1b
	adds r2, r1, #0
	ldr r3, [r4]
	movs r0, #0
	adds r2, #0xf6
	bl FUN_0200BAF8
	adds r1, r4, #0
	adds r1, #0x88
	str r0, [r1]
	ldr r2, [r4]
	movs r0, #2
	movs r1, #0x5b
	bl FUN_0200BD18
	adds r1, r4, #0
	adds r1, #0x8c
	str r0, [r1]
	ldr r1, [r4]
	movs r0, #0x5b
	bl FUN_02026354
	adds r1, r4, #0
	adds r1, #0x90
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200BBA0
	adds r1, r4, #0
	adds r1, #0x9c
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200BBA0
	adds r1, r4, #0
	adds r1, #0xa0
	str r0, [r1]
	ldr r1, [r4]
	movs r0, #0x28
	bl FUN_02026354
	adds r1, r4, #0
	adds r1, #0xa4
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200BBA0
	adds r1, r4, #0
	adds r1, #0xb4
	str r0, [r1]
	movs r0, #2
	adds r4, #0xb8
	strb r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021E85A8

	thumb_func_start ov101_021E862C
ov101_021E862C: @ 0x021E862C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xb4
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_0200BDA0
	adds r4, #0x88
	ldr r0, [r4]
	bl FUN_0200BB44
	pop {r4, pc}
	thumb_func_end ov101_021E862C

	thumb_func_start ov101_021E8674
ov101_021E8674: @ 0x021E8674
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #2
	ldr r4, [r0, #8]
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5]
	lsls r1, r1, #8
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	movs r2, #9
	str r0, [sp, #8]
	adds r0, r1, #0
	adds r0, #0x28
	ldr r0, [r4, r0]
	str r0, [sp, #0xc]
	adds r0, r1, #0
	adds r0, #0x50
	ldr r0, [r4, r0]
	adds r1, #0x78
	str r0, [sp, #0x10]
	ldr r0, [r4, r1]
	ldr r1, _021E8768 @ =0x021F7C04
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x7c]
	bl FUN_021E7014
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5]
	movs r1, #0x2a
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	movs r2, #8
	str r0, [sp, #8]
	adds r0, r1, #0
	adds r0, #0x28
	ldr r0, [r4, r0]
	str r0, [sp, #0xc]
	adds r0, r1, #0
	adds r0, #0x50
	ldr r0, [r4, r0]
	adds r1, #0x78
	str r0, [sp, #0x10]
	ldr r0, [r4, r1]
	ldr r1, _021E876C @ =0x021F7BA4
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x7c]
	bl FUN_021E7014
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5]
	movs r1, #0x2a
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	movs r2, #1
	str r0, [sp, #8]
	adds r0, r1, #0
	adds r0, #0x28
	ldr r0, [r4, r0]
	str r0, [sp, #0xc]
	adds r0, r1, #0
	adds r0, #0x50
	ldr r0, [r4, r0]
	adds r1, #0x78
	str r0, [sp, #0x10]
	ldr r0, [r4, r1]
	ldr r1, _021E8770 @ =0x021F7B30
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x7c]
	bl FUN_021E7014
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E7128
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E7128
	ldr r0, [r5, #0x10]
	movs r1, #3
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E7128
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	ldr r0, [r5, #0x10]
	bne _021E8758
	ldrh r2, [r5, #0x16]
	ldr r0, [r0, #0x7c]
	movs r1, #1
	lsls r2, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl FUN_021E72F8
	add sp, #0x18
	pop {r3, r4, r5, pc}
_021E8758:
	ldr r0, [r0, #0x7c]
	movs r1, #1
	movs r2, #0
	bl FUN_021E72F8
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_021E8768: .4byte 0x021F7C04
_021E876C: .4byte 0x021F7BA4
_021E8770: .4byte 0x021F7B30
	thumb_func_end ov101_021E8674

	thumb_func_start ov101_021E8774
ov101_021E8774: @ 0x021E8774
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021E877A:
	ldr r0, [r5, #0x10]
	adds r1, r4, #1
	lsls r1, r1, #0x10
	ldr r0, [r0, #0x7c]
	lsrs r1, r1, #0x10
	bl FUN_021E70A4
	adds r4, r4, #1
	cmp r4, #3
	blt _021E877A
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021E8774

	thumb_func_start ov101_021E8790
ov101_021E8790: @ 0x021E8790
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, [r5]
	movs r0, #0x90
	bl FUN_02007688
	adds r4, r0, #0
	movs r1, #0
	movs r0, #7
	adds r2, r6, #0
	str r1, [sp]
	lsls r0, r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	adds r1, r4, #0
	adds r2, #0x14
	bl FUN_02003220
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #6
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	adds r6, #0xe
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_02003220
	movs r0, #2
	str r0, [sp]
	movs r0, #0x16
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	adds r1, r4, #0
	bl FUN_02003220
	movs r0, #3
	str r0, [sp]
	movs r0, #0x16
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	adds r1, r4, #0
	bl FUN_02003220
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r0, #0x10
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0x10]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x40
	movs r3, #0xc0
	bl FUN_02003E5C
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x78]
	bl FUN_0200398C
	ldr r0, [r5, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021E8790

	thumb_func_start ov101_021E886C
ov101_021E886C: @ 0x021E886C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	movs r1, #2
	bl FUN_021E6978
	ldr r1, [r4]
	movs r0, #0x6f
	bl FUN_021E6E20
	adds r1, r4, #0
	adds r1, #0x84
	str r0, [r1]
	ldr r0, [r4, #0x10]
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_0200CF6C
	movs r2, #0xf
	movs r1, #0
	lsls r2, r2, #0x10
	bl FUN_02009FC8
	ldr r1, [r4]
	movs r0, #4
	bl FUN_02013534
	str r0, [r4, #0x3c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021E886C

	thumb_func_start ov101_021E88A8
ov101_021E88A8: @ 0x021E88A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_0200CF6C
	movs r2, #3
	movs r1, #0
	lsls r2, r2, #0x12
	bl FUN_02009FC8
	ldr r0, [r4, #0x3c]
	bl FUN_020135AC
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6E58
	ldr r0, [r4, #0x10]
	bl FUN_021E69C8
	pop {r4, pc}
	thumb_func_end ov101_021E88A8

	thumb_func_start ov101_021E88D8
ov101_021E88D8: @ 0x021E88D8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r6, #0
	ldr r0, [r0, #8]
	movs r7, #0x15
	str r0, [sp]
	adds r4, r0, #0
_021E88EA:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8A74 @ =0x021F7DB8
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	lsrs r2, r6, #0x1f
	lsls r3, r6, #0x1f
	subs r3, r3, r2
	movs r1, #0x1f
	rors r3, r1
	adds r3, r2, r3
	adds r2, r6, r2
	movs r1, #0x68
	muls r1, r3, r1
	asrs r2, r2, #1
	adds r3, r2, #0
	muls r3, r7, r3
	adds r1, #0x20
	adds r3, #0xcb
	lsls r1, r1, #0x10
	lsls r2, r3, #0x10
	ldr r0, [r4, #0x20]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_0200DD3C
	adds r6, r6, #1
	adds r4, #0x28
	cmp r6, #4
	blt _021E88EA
	ldr r1, [r5, #0x10]
	ldr r2, _021E8A78 @ =0x021F7DE0
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	ldr r0, [sp]
	movs r1, #0
	adds r0, #0xc0
	ldr r0, [r0]
	bl FUN_0200DD3C
	ldr r1, [r5, #0x10]
	ldr r2, _021E8A7C @ =0x021F7E08
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	ldr r1, [r5, #0x10]
	ldr r2, _021E8A80 @ =0x021F7E30
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	movs r7, #0
	ldr r6, [sp]
	adds r4, r7, #0
_021E89AE:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8A84 @ =0x021F7E58
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	cmp r7, #0
	ble _021E89E2
	adds r0, r4, #0
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E89F0
_021E89E2:
	adds r0, r4, #0
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E89F0:
	blx FUN_020F2104
	adds r1, r0, #0
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_020249B0
	movs r0, #1
	lsls r0, r0, #0xc
	adds r7, r7, #1
	adds r4, r4, r0
	adds r6, #0x28
	cmp r7, #4
	blt _021E89AE
	movs r4, #0
	movs r7, #0x28
_021E8A12:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	ldr r0, [sp]
	muls r1, r7, r1
	adds r6, r0, r1
	ldr r0, [r6, #0x20]
	adds r1, r6, #4
	adds r2, r6, #6
	bl FUN_0200DE00
	ldr r0, [r6, #0x20]
	movs r1, #0
	bl FUN_02024830
	adds r4, r4, #1
	cmp r4, #0xb
	blt _021E8A12
	ldr r0, [sp]
	movs r1, #1
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_0202484C
	movs r1, #0x11
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_0202484C
	movs r1, #0x11
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0x20]
	ldrb r1, [r1, #7]
	bl FUN_020249D4
	ldr r0, [sp]
	movs r1, #2
	adds r0, #0xe8
	str r0, [sp]
	ldr r0, [r0]
	bl FUN_0202487C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8A74: .4byte 0x021F7DB8
_021E8A78: .4byte 0x021F7DE0
_021E8A7C: .4byte 0x021F7E08
_021E8A80: .4byte 0x021F7E30
_021E8A84: .4byte 0x021F7E58
	thumb_func_end ov101_021E88D8

	thumb_func_start ov101_021E8A88
ov101_021E8A88: @ 0x021E8A88
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r6, #0
	ldr r7, [r0, #8]
_021E8A94:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8AE0 @ =0x021F7B3C
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	movs r1, #0x28
	muls r1, r0, r1
	adds r4, r7, r1
	ldr r0, [r4, #0x20]
	adds r1, r4, #4
	adds r2, r4, #6
	bl FUN_0200DE00
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_0202484C
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x64
	blo _021E8A94
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8AE0: .4byte 0x021F7B3C
	thumb_func_end ov101_021E8A88

	thumb_func_start ov101_021E8AE4
ov101_021E8AE4: @ 0x021E8AE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r5, r0, #0
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r1, [r5]
	adds r0, r5, r0
	bl FUN_02013910
	movs r1, #1
	str r0, [r5, #0x40]
	bl FUN_02013948
	movs r1, #0
	str r0, [sp, #0x14]
	adds r2, r5, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E8BB4 @ =0x00010200
	adds r2, #0xa0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsrs r0, r0, #7
	ldr r2, [r2]
	adds r0, r5, r0
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, [r5, #0x3c]
	str r0, [sp, #0x18]
	movs r0, #0x81
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x10]
	adds r0, #0x90
	ldr r0, [r0]
	bl FUN_0200E2B0
	str r0, [sp, #0x20]
	ldr r0, [r5, #0x10]
	movs r1, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl FUN_0200D934
	str r0, [sp, #0x24]
	movs r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x38]
	movs r0, #3
	str r0, [sp, #0x3c]
	movs r0, #4
	str r0, [sp, #0x30]
	subs r0, #0xa
	str r0, [sp, #0x34]
	movs r0, #1
	str r0, [sp, #0x40]
	ldr r0, [r5]
	adds r7, r5, #0
	ldr r6, [sp, #0x10]
	str r0, [sp, #0x44]
	adds r7, #0x48
	adds r4, r5, #0
_021E8B66:
	movs r1, #1
	ldr r0, [sp, #0x14]
	adds r2, r1, #0
	adds r3, r7, #0
	bl FUN_02021AC8
	ldr r0, [r4, #0x4c]
	str r0, [sp, #0x2c]
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r1, r0, r6
	movs r0, #0x3e
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	str r0, [sp, #0x28]
	ldr r1, [r5, #0x40]
	add r0, sp, #0x18
	bl FUN_02013950
	str r0, [r4, #0x44]
	movs r1, #0
	bl FUN_020137C0
	ldr r0, [r4, #0x44]
	movs r1, #7
	bl FUN_02013850
	ldr r0, [sp, #0x10]
	adds r7, #0x10
	adds r0, r0, #1
	adds r4, #0x10
	adds r6, #0x28
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _021E8B66
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E8BB4: .4byte 0x00010200
	thumb_func_end ov101_021E8AE4

	thumb_func_start ov101_021E8BB8
ov101_021E8BB8: @ 0x021E8BB8
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0
	adds r5, r0, #0
	str r0, [sp]
	adds r4, r0, #0
	adds r5, #0x48
	adds r7, r6, #0
_021E8BC6:
	ldr r0, [r4, #0x44]
	bl FUN_020139C8
	adds r0, r5, #0
	bl FUN_02021B5C
	str r7, [r4, #0x44]
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, #0x10
	cmp r6, #4
	blt _021E8BC6
	ldr r0, [sp]
	ldr r0, [r0, #0x40]
	bl FUN_02013938
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021E8BB8

	thumb_func_start ov101_021E8BE8
ov101_021E8BE8: @ 0x021E8BE8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r1, [r5, #0x10]
	ldr r7, [r0, #8]
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _021E8E00 @ =0x021F7C70
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	movs r1, #0x6f
	movs r0, #0x80
	lsls r1, r1, #2
	strh r0, [r7, r1]
	adds r0, r1, #2
	movs r2, #0x6c
	adds r1, #0x1c
	strh r2, [r7, r0]
	ldr r0, [r7, r1]
	movs r1, #1
	bl FUN_02024830
	movs r6, #0
_021E8C2A:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8E04 @ =0x021F7C98
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	movs r0, #0x28
	muls r0, r6, r0
	adds r4, r7, r0
	movs r0, #0x79
	movs r1, #0
	lsls r0, r0, #2
	strh r1, [r4, r0]
	adds r0, r0, #2
	strh r1, [r4, r0]
	movs r0, #2
	lsls r0, r0, #8
	lsrs r2, r6, #0x1f
	lsls r3, r6, #0x1e
	subs r3, r3, r2
	movs r1, #0x1e
	rors r3, r1
	adds r1, r2, r3
	ldr r0, [r4, r0]
	adds r1, r1, #5
	bl FUN_020248F0
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024A04
	ldr r0, _021E8E08 @ =0x000001E2
	movs r1, #1
	strh r1, [r4, r0]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #8
	blo _021E8C2A
	movs r6, #0xd
	movs r4, #0
	lsls r6, r6, #6
_021E8CAC:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8E0C @ =0x021F7CC0
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	movs r0, #0x28
	muls r0, r4, r0
	adds r3, r7, r0
	lsrs r2, r4, #0x1f
	lsls r1, r4, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	movs r1, #0x68
	muls r1, r0, r1
	movs r0, #0xc9
	adds r1, #0x20
	lsls r0, r0, #2
	strh r1, [r3, r0]
	lsrs r0, r4, #1
	movs r1, #0x15
	muls r1, r0, r1
	ldr r0, _021E8E10 @ =0x00000326
	adds r1, #0x20
	strh r1, [r3, r0]
	ldr r0, [r3, r6]
	movs r1, #0
	bl FUN_02024A04
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	blo _021E8CAC
	movs r6, #0x3e
	movs r4, #0
	lsls r6, r6, #4
_021E8D0C:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8E14 @ =0x021F7CE8
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	movs r0, #0x28
	muls r0, r4, r0
	adds r3, r7, r0
	lsrs r2, r4, #0x1f
	lsls r1, r4, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	movs r1, #0x68
	muls r1, r0, r1
	movs r0, #0xf1
	adds r1, #0x28
	lsls r0, r0, #2
	strh r1, [r3, r0]
	lsrs r0, r4, #1
	movs r1, #0x15
	muls r1, r0, r1
	ldr r0, _021E8E18 @ =0x000003C6
	adds r1, #0x1f
	strh r1, [r3, r0]
	ldr r0, [r3, r6]
	movs r1, #0
	bl FUN_02024A04
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	blo _021E8D0C
	movs r4, #0
_021E8D68:
	ldr r1, [r5, #0x10]
	ldr r2, _021E8E0C @ =0x021F7CC0
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	movs r0, #0x28
	muls r0, r4, r0
	adds r6, r7, r0
	movs r0, #0x18
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _021E8E1C @ =0x00000464
	adds r1, #0x28
	strh r1, [r6, r0]
	movs r1, #0x84
	adds r0, r0, #2
	strh r1, [r6, r0]
	movs r0, #0x12
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	adds r1, r4, #0
	bl FUN_020249D4
	movs r0, #0x12
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_02024A04
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #8
	blo _021E8D68
	movs r4, #0x14
_021E8DC2:
	movs r0, #0x28
	muls r0, r4, r0
	adds r6, r7, r0
	ldr r0, [r6, #0x20]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r6, #0x20]
	movs r1, #0
	bl FUN_0202484C
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x23
	bls _021E8DC2
	movs r0, #0x76
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r1, #1
	bl FUN_0202484C
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6E84
	adds r0, r5, #0
	bl ov101_021E8AE4
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E8E00: .4byte 0x021F7C70
_021E8E04: .4byte 0x021F7C98
_021E8E08: .4byte 0x000001E2
_021E8E0C: .4byte 0x021F7CC0
_021E8E10: .4byte 0x00000326
_021E8E14: .4byte 0x021F7CE8
_021E8E18: .4byte 0x000003C6
_021E8E1C: .4byte 0x00000464
	thumb_func_end ov101_021E8BE8

	thumb_func_start ov101_021E8E20
ov101_021E8E20: @ 0x021E8E20
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021E8BB8
	adds r4, #0x84
	ldr r0, [r4]
	movs r1, #0xb
	bl FUN_021E6F34
	pop {r4, pc}
	thumb_func_end ov101_021E8E20

	thumb_func_start ov101_021E8E34
ov101_021E8E34: @ 0x021E8E34
	ldr r3, _021E8E38 @ =ov101_021E88D8
	bx r3
	.align 2, 0
_021E8E38: .4byte ov101_021E88D8
	thumb_func_end ov101_021E8E34

	thumb_func_start ov101_021E8E3C
ov101_021E8E3C: @ 0x021E8E3C
	ldr r3, _021E8E48 @ =FUN_021E6F34
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #0xb
	bx r3
	nop
_021E8E48: .4byte FUN_021E6F34
	thumb_func_end ov101_021E8E3C

	thumb_func_start ov101_021E8E4C
ov101_021E8E4C: @ 0x021E8E4C
	ldr r3, _021E8E54 @ =FUN_021E6EF4
	adds r0, #0x84
	ldr r0, [r0]
	bx r3
	.align 2, 0
_021E8E54: .4byte FUN_021E6EF4
	thumb_func_end ov101_021E8E4C

	thumb_func_start ov101_021E8E58
ov101_021E8E58: @ 0x021E8E58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #5
	ldr r0, [r0, #8]
	movs r2, #0
	str r0, [sp, #0x1c]
	movs r0, #1
	blx FUN_020CD9FC
	movs r4, #0
	movs r6, #3
	movs r7, #2
_021E8E76:
	ldr r0, [r5, #0x10]
	adds r1, r4, #2
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0201B1F4
	ldr r0, [r5, #0x10]
	adds r1, r4, #2
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	movs r2, #2
	movs r3, #4
	bl FUN_0201B1F4
	ldr r0, [r5, #0x10]
	adds r1, r4, #2
	lsls r1, r1, #0x18
	movs r2, #0
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	adds r1, r4, #2
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r4, r4, #1
	cmp r4, #2
	blt _021E8E76
	movs r0, #6
	str r0, [sp]
	ldr r0, _021E909C @ =0x04000050
	movs r1, #4
	movs r2, #8
	movs r3, #0xa
	blx FUN_020CF15C
	movs r0, #0
	movs r1, #1
	bl FUN_0201BC28
	movs r4, #0
	movs r6, #3
	adds r7, r4, #0
_021E8EE2:
	ldr r0, [r5, #0x10]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	ldr r0, [r5, #0x10]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	movs r2, #0
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0201BC8C
	adds r4, r4, #1
	cmp r4, #3
	blt _021E8EE2
	ldr r1, _021E90A0 @ =ov101_021EB338
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x5c]
	ldr r1, _021E90A4 @ =ov101_021EB2FC
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x60]
	adds r0, r5, #0
	bl ov101_021E990C
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0xc8
	bl ov101_021E9B70
	movs r0, #0x5e
	lsls r0, r0, #2
	movs r2, #0
	ldr r0, [r5, r0]
	movs r1, #0x20
	str r1, [sp]
	movs r1, #0x14
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	adds r3, r2, #0
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #1
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	adds r0, r5, #0
	bl ov101_021EAF40
	movs r2, #0x4e
	lsls r2, r2, #2
	ldrb r2, [r5, r2]
	adds r0, r5, #0
	movs r1, #1
	lsls r2, r2, #0x1f
	lsrs r2, r2, #0x1f
	bl ov101_021EB38C
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x20
	str r1, [sp]
	movs r1, #0x11
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	movs r3, #7
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #6
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	movs r3, #0x46
	lsls r3, r3, #2
	adds r2, r3, #0
	adds r1, r5, r3
	subs r2, #8
	subs r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	adds r0, r5, #0
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021EA794
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021EAD90
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021EB1E0
	adds r0, r5, #0
	bl ov101_021E8A88
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021EA238
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021EA608
	ldr r1, [r5, #0x10]
	ldrb r0, [r1, #6]
	cmp r0, #1
	ldr r0, [r1, #0x7c]
	bne _021E9020
	movs r1, #0
	movs r2, #1
	bl FUN_021E7128
	ldr r0, [sp, #0x1c]
	movs r1, #0
	adds r0, #0xe8
	str r0, [sp, #0x1c]
	ldr r0, [r0]
	bl FUN_02024830
	b _021E9036
_021E9020:
	movs r1, #0
	adds r2, r1, #0
	bl FUN_021E7128
	ldr r0, [sp, #0x1c]
	movs r1, #1
	adds r0, #0xe8
	str r0, [sp, #0x1c]
	ldr r0, [r0]
	bl FUN_02024830
_021E9036:
	ldr r0, [r5, #0x10]
	bl FUN_021E5DC8
	adds r2, r0, #0
	ldr r0, [r5, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E72F8
	ldr r0, [r5, #0x10]
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	beq _021E905A
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021E9D74
_021E905A:
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6E84
	ldr r0, [r5, #0x10]
	movs r1, #5
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #7
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #3
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E909C: .4byte 0x04000050
_021E90A0: .4byte ov101_021EB338
_021E90A4: .4byte ov101_021EB2FC
	thumb_func_end ov101_021E8E58

	thumb_func_start ov101_021E90A8
ov101_021E90A8: @ 0x021E90A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	movs r1, #0
	adds r5, r0, #0
	movs r0, #1
	adds r2, r1, #0
	blx FUN_020CD9FC
	movs r4, #0
	movs r6, #3
	adds r7, r4, #0
_021E90BE:
	ldr r0, [r5, #0x10]
	adds r1, r4, #2
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0201B1F4
	ldr r0, [r5, #0x10]
	adds r1, r4, #2
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	movs r2, #2
	movs r3, #0
	bl FUN_0201B1F4
	ldr r0, [r5, #0x10]
	adds r1, r4, #2
	lsls r1, r1, #0x18
	movs r2, #0
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201B1F4
	ldr r0, [r5, #0x10]
	adds r1, r4, #2
	lsls r1, r1, #0x18
	movs r2, #0
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	adds r1, r4, #2
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r4, r4, #1
	cmp r4, #2
	blt _021E90BE
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201BC28
	movs r1, #0
	ldr r0, _021E9258 @ =0x04000050
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp]
	blx FUN_020CF15C
	movs r4, #0
_021E9136:
	ldr r0, [r5, #0x10]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r4, r4, #1
	cmp r4, #3
	blt _021E9136
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x20
	str r1, [sp]
	movs r1, #0xe
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	movs r2, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	adds r3, r2, #0
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	movs r0, #6
	lsls r0, r0, #6
	movs r2, #0
	ldr r0, [r5, r0]
	movs r1, #0x20
	str r1, [sp]
	movs r1, #0x18
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	adds r3, r2, #0
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #3
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	movs r0, #2
	movs r1, #1
	bl FUN_0201BC28
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #3
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl ov101_021E8BE8
	adds r0, r5, #0
	bl ov101_021E8674
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021EA608
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _021E922A
	ldrh r2, [r5, #0x1c]
	ldrh r3, [r5, #0x1e]
	movs r1, #0x46
	lsls r1, r1, #2
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	adds r0, r5, #0
	adds r1, r5, r1
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021EA794
	ldr r1, [r5, #0x10]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	ldr r0, [r1, #0x7c]
	beq _021E9222
	movs r1, #1
	adds r2, r1, #0
	bl FUN_021E7128
	b _021E922A
_021E9222:
	movs r1, #1
	movs r2, #0
	bl FUN_021E7128
_021E922A:
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021EAE54
	movs r1, #0x4f
	lsls r1, r1, #2
	ldrb r2, [r5, r1]
	movs r0, #0x7f
	bics r2, r0
	strb r2, [r5, r1]
	ldrb r2, [r5, r1]
	movs r0, #0x80
	bics r2, r0
	strb r2, [r5, r1]
	ldr r1, _021E925C @ =ov101_021EB378
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x5c]
	ldr r1, _021E9260 @ =ov101_021EB364
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x60]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021E9258: .4byte 0x04000050
_021E925C: .4byte ov101_021EB378
_021E9260: .4byte ov101_021EB364
	thumb_func_end ov101_021E90A8

	thumb_func_start ov101_021E9264
ov101_021E9264: @ 0x021E9264
	cmp r1, #0
	bne _021E926E
	movs r1, #0
	strh r1, [r0, #0x16]
	strb r1, [r0, #0xc]
_021E926E:
	bx lr
	thumb_func_end ov101_021E9264

	thumb_func_start ov101_021E9270
ov101_021E9270: @ 0x021E9270
	push {r3, lr}
	movs r0, #0x4e
	lsls r0, r0, #2
	ldrb r0, [r1, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	beq _021E9286
	adds r0, r1, #0
	adds r1, #0xc8
	bl ov101_021E9B70
_021E9286:
	pop {r3, pc}
	thumb_func_end ov101_021E9270

	thumb_func_start ov101_021E9288
ov101_021E9288: @ 0x021E9288
	movs r1, #0x4e
	lsls r1, r1, #2
	ldrb r1, [r0, r1]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	beq _021E92F0
	adds r1, r0, #0
	adds r1, #0xcc
	ldr r2, [r1]
	adds r1, r0, #0
	adds r1, #0xdc
	ldr r1, [r1]
	adds r2, r2, r1
	subs r2, #8
	asrs r1, r2, #3
	lsrs r1, r1, #0x1c
	adds r1, r2, r1
	asrs r1, r1, #4
	adds r2, r1, #1
	adds r1, r0, #0
	adds r1, #0xf0
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0xc8
	ldr r2, [r1]
	adds r1, r0, #0
	adds r1, #0xd8
	ldr r1, [r1]
	adds r2, r2, r1
	subs r2, #8
	asrs r1, r2, #3
	lsrs r1, r1, #0x1c
	adds r1, r2, r1
	asrs r1, r1, #4
	adds r2, r1, #1
	adds r1, r0, #0
	adds r1, #0xf4
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0xf0
	ldrh r1, [r1]
	adds r2, r1, #7
	adds r1, r0, #0
	adds r1, #0xf2
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0xf4
	ldrh r1, [r1]
	adds r0, #0xf6
	adds r1, #0xb
	strh r1, [r0]
	bx lr
_021E92F0:
	adds r1, r0, #0
	adds r1, #0xcc
	ldr r1, [r1]
	rsbs r2, r1, #0
	asrs r1, r2, #2
	lsrs r1, r1, #0x1d
	adds r1, r2, r1
	asrs r1, r1, #3
	adds r2, r1, #1
	adds r1, r0, #0
	adds r1, #0xf0
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0xc8
	ldr r2, [r1]
	asrs r1, r2, #2
	lsrs r1, r1, #0x1d
	adds r1, r2, r1
	asrs r1, r1, #3
	adds r2, r1, #1
	adds r1, r0, #0
	adds r1, #0xf4
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0xf0
	ldrh r2, [r1]
	adds r1, r0, #0
	adds r1, #0xf2
	adds r2, #0x10
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0xf4
	ldrh r1, [r1]
	adds r1, #0x17
	adds r0, #0xf6
	strh r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov101_021E9288

	thumb_func_start ov101_021E933C
ov101_021E933C: @ 0x021E933C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x14
	movs r1, #0
	movs r2, #0x1c
	blx FUN_020D4994
	ldr r0, _021E93CC @ =0x0000FFFF
	movs r1, #0x4e
	strh r0, [r4, #0x2e]
	movs r0, #1
	lsls r1, r1, #2
	strb r0, [r4, #0x14]
	ldrb r0, [r4, r1]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	strb r0, [r4, #0x15]
	adds r0, r1, #0
	subs r0, #0x28
	ldrsh r0, [r4, r0]
	subs r1, #0x26
	strh r0, [r4, #0x1c]
	ldrsh r0, [r4, r1]
	strh r0, [r4, #0x1e]
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r1, [r0, #8]
	movs r0, #0xcc
	ldrsh r0, [r1, r0]
	strh r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r1, [r0, #8]
	movs r0, #0xce
	ldrsh r0, [r1, r0]
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	adds r0, #0xc8
	ldr r0, [r0]
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	adds r0, #0xcc
	ldr r0, [r0]
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	adds r0, #0xd8
	ldr r0, [r0]
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	adds r0, #0xdc
	ldr r0, [r0]
	strh r0, [r4, #0x26]
	adds r0, r4, #0
	adds r0, #0xf0
	ldrh r0, [r0]
	strb r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0xf2
	ldrh r0, [r0]
	strb r0, [r4, #0x19]
	adds r0, r4, #0
	adds r0, #0xf4
	ldrh r0, [r0]
	strb r0, [r4, #0x1a]
	adds r0, r4, #0
	adds r0, #0xf6
	ldrh r0, [r0]
	strb r0, [r4, #0x1b]
	pop {r4, pc}
	nop
_021E93CC: .4byte 0x0000FFFF
	thumb_func_end ov101_021E933C

	thumb_func_start ov101_021E93D0
ov101_021E93D0: @ 0x021E93D0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x1c]
	movs r0, #0x11
	lsls r0, r0, #4
	strh r1, [r4, r0]
	ldrh r1, [r4, #0x1e]
	adds r0, r0, #2
	movs r2, #0x1c
	strh r1, [r4, r0]
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, #0xcc
	strh r1, [r0]
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, #0xce
	strh r1, [r0]
	movs r0, #0x28
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0x2a
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xcc
	str r1, [r0]
	movs r0, #0x24
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xd8
	str r1, [r0]
	movs r0, #0x26
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xdc
	str r1, [r0]
	adds r0, r4, #0
	ldrb r1, [r4, #0x18]
	adds r0, #0xf0
	strh r1, [r0]
	adds r0, r4, #0
	ldrb r1, [r4, #0x19]
	adds r0, #0xf2
	strh r1, [r0]
	adds r0, r4, #0
	ldrb r1, [r4, #0x1a]
	adds r0, #0xf4
	strh r1, [r0]
	adds r0, r4, #0
	ldrb r1, [r4, #0x1b]
	adds r0, #0xf6
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x14
	movs r1, #0
	blx FUN_020D4994
	ldr r0, _021E9460 @ =0x0000FFFF
	strh r0, [r4, #0x2e]
	movs r0, #0
	strb r0, [r4, #0x14]
	pop {r4, pc}
	.align 2, 0
_021E9460: .4byte 0x0000FFFF
	thumb_func_end ov101_021E93D0

	thumb_func_start ov101_021E9464
ov101_021E9464: @ 0x021E9464
	push {r3, r4, r5, r6}
	ldr r6, _021E94BC @ =0x00000132
	adds r5, r1, #0
	adds r1, r2, #0
	ldrb r2, [r0, r6]
	adds r4, r3, #0
	ldr r3, [sp, #0x10]
	subs r2, r5, r2
	subs r5, r6, #1
	ldrb r5, [r0, r5]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r1, r1, r5
	adds r5, r6, #6
	ldrb r0, [r0, r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021E94A4
	asrs r0, r2, #3
	lsrs r0, r0, #0x1c
	adds r0, r2, r0
	asrs r0, r0, #4
	strh r0, [r4]
	asrs r0, r1, #3
	lsrs r0, r0, #0x1c
	adds r0, r1, r0
	asrs r0, r0, #4
	strh r0, [r3]
	pop {r3, r4, r5, r6}
	bx lr
_021E94A4:
	asrs r0, r2, #2
	lsrs r0, r0, #0x1d
	adds r0, r2, r0
	asrs r0, r0, #3
	strh r0, [r4]
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	strh r0, [r3]
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
_021E94BC: .4byte 0x00000132
	thumb_func_end ov101_021E9464

	thumb_func_start ov101_021E94C0
ov101_021E94C0: @ 0x021E94C0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0x11
	adds r1, r6, #0
	lsls r0, r0, #4
	adds r1, #0xf4
	ldrsh r2, [r6, r0]
	ldrh r1, [r1]
	subs r1, r2, r1
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	adds r1, r0, #2
	ldrsh r2, [r6, r1]
	adds r1, r6, #0
	adds r1, #0xf0
	ldrh r1, [r1]
	subs r1, r2, r1
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r1, [r6, r1]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r1, #3
	lsls r2, r1, #2
	adds r1, r0, #0
	adds r1, #0x22
	ldrb r7, [r6, r1]
	adds r1, r5, #0
	adds r0, #0x21
	ldrb r5, [r6, r0]
	adds r0, r4, #0
	muls r1, r3, r1
	muls r0, r3, r0
	adds r1, r7, r1
	adds r0, r5, r0
	adds r1, r2, r1
	adds r6, #0x84
	adds r2, r2, r0
	ldr r0, [r6]
	ldr r3, [r0, #8]
	adds r3, #0xc8
	strh r1, [r3, #4]
	strh r2, [r3, #6]
	movs r1, #4
	movs r2, #6
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r3, #0x20]
	bl FUN_0200DD88
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021E94C0

	thumb_func_start ov101_021E9530
ov101_021E9530: @ 0x021E9530
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r0, #0
	adds r7, r2, #0
	adds r5, r3, #0
	cmp r1, #0
	beq _021E959A
	movs r1, #0x10
	str r1, [sp, #4]
	add r1, sp, #0x14
	str r1, [sp]
	ldr r1, [sp, #4]
	add r2, sp, #0x20
	movs r3, #0x14
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	add r3, sp, #0x14
	adds r3, #2
	bl ov101_021E9464
	add r0, sp, #0x14
	ldrh r1, [r0, #2]
	ldrh r3, [r0]
	movs r0, #4
	movs r2, #5
	str r1, [sp, #0xc]
	subs r1, r2, r1
	subs r0, r0, r3
	lsls r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r2, r1, #0x10
	asrs r0, r0, #0x10
	subs r1, r5, r3
	mov ip, r0
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #7
	subs r0, r0, r3
	adds r1, r5, r0
	mov r0, ip
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, [sp, #0xc]
	movs r1, #0xb
	subs r0, r7, r0
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	ldr r0, [sp, #0xc]
	b _021E9606
_021E959A:
	movs r0, #8
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xc8
	ldr r1, [r0]
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	adds r0, r0, #1
	subs r1, r7, r0
	add r0, sp, #0x14
	strh r1, [r0, #2]
	adds r1, r4, #0
	adds r1, #0xcc
	ldr r2, [r1]
	asrs r1, r2, #2
	lsrs r1, r1, #0x1d
	adds r1, r2, r1
	asrs r1, r1, #3
	adds r1, r1, #1
	subs r1, r5, r1
	strh r1, [r0]
	ldrh r1, [r0, #2]
	ldrh r3, [r0]
	ldr r0, [sp, #4]
	movs r2, #0xb
	str r1, [sp, #0x10]
	subs r1, r2, r1
	subs r0, r0, r3
	lsls r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r2, r1, #0x10
	asrs r0, r0, #0x10
	subs r1, r5, r3
	mov ip, r0
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x10
	subs r0, r0, r3
	adds r1, r5, r0
	mov r0, ip
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	subs r0, r7, r0
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	ldr r0, [sp, #0x10]
_021E9606:
	subs r0, r1, r0
	adds r0, r7, r0
	movs r7, #0x41
	subs r0, r0, r2
	lsls r7, r7, #2
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldrh r1, [r4, r7]
	ldr r0, [sp, #8]
	cmp r0, r1
	bge _021E963E
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	mov r0, ip
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov ip, r0
	ldr r0, [sp, #8]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	subs r0, r6, r1
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	b _021E9666
_021E963E:
	adds r0, r7, #2
	ldrh r0, [r4, r0]
	cmp r6, r0
	ble _021E9666
	subs r0, r6, r0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	mov r0, ip
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov ip, r0
	subs r0, r6, r1
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, [sp, #8]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
_021E9666:
	movs r1, #1
	lsls r1, r1, #8
	ldrh r0, [r4, r1]
	cmp r3, r0
	bge _021E968A
	subs r0, r3, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r2, r0
	lsls r1, r1, #0x10
	asrs r2, r1, #0x10
	subs r1, r3, r0
	subs r0, r5, r0
	lsls r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r3, r1, #0x10
	asrs r5, r0, #0x10
	b _021E96AA
_021E968A:
	adds r0, r1, #2
	ldrh r0, [r4, r0]
	cmp r5, r0
	ble _021E96AA
	subs r0, r5, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r2, r0
	lsls r1, r1, #0x10
	asrs r2, r1, #0x10
	subs r1, r5, r0
	subs r0, r3, r0
	lsls r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r5, r1, #0x10
	asrs r3, r0, #0x10
_021E96AA:
	adds r1, r4, #0
	ldr r0, [sp, #8]
	adds r1, #0xf0
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0xf2
	strh r6, [r0]
	adds r0, r4, #0
	adds r0, #0xf4
	strh r3, [r0]
	adds r0, r4, #0
	adds r0, #0xf6
	strh r5, [r0]
	ldr r0, [sp, #4]
	muls r0, r2, r0
	rsbs r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xf8
	strh r1, [r0]
	ldr r0, [sp, #4]
	mov r1, ip
	muls r0, r1, r0
	rsbs r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xfa
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc8
	ldr r1, [r0]
	movs r0, #0xf8
	ldrsh r0, [r4, r0]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0xfc
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xcc
	ldr r1, [r0]
	movs r0, #0xfa
	ldrsh r0, [r4, r0]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0xfe
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc8
	ldr r0, [r0]
	cmp r0, #0
	ble _021E971E
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E972C
_021E971E:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E972C:
	blx FUN_020F2104
	adds r1, r4, #0
	adds r1, #0xe8
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xcc
	ldr r0, [r0]
	cmp r0, #0
	ble _021E9752
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E9760
_021E9752:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E9760:
	blx FUN_020F2104
	adds r1, r4, #0
	adds r1, #0xec
	str r0, [r1]
	ldr r0, _021E9844 @ =0x0000013A
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E9784
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E9792
_021E9784:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E9792:
	adds r5, r0, #0
	movs r0, #0xf8
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _021E97AE
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E97BC
_021E97AE:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E97BC:
	blx FUN_020F2104
	adds r6, r0, #0
	adds r0, r5, #0
	blx FUN_020F2104
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020CCBA0
	adds r1, r4, #0
	adds r1, #0xe0
	str r0, [r1]
	ldr r0, _021E9844 @ =0x0000013A
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E97F0
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E97FE
_021E97F0:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E97FE:
	adds r5, r0, #0
	movs r0, #0xfa
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _021E981A
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E9828
_021E981A:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E9828:
	blx FUN_020F2104
	adds r6, r0, #0
	adds r0, r5, #0
	blx FUN_020F2104
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020CCBA0
	adds r4, #0xe4
	str r0, [r4]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E9844: .4byte 0x0000013A
	thumb_func_end ov101_021E9530

	thumb_func_start ov101_021E9848
ov101_021E9848: @ 0x021E9848
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	movs r1, #0x4e
	adds r4, r0, #0
	lsls r1, r1, #2
	ldrb r1, [r4, r1]
	adds r6, r2, #0
	mov lr, r3
	lsls r1, r1, #0x1f
	ldr r0, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	lsrs r1, r1, #0x1f
	add r2, sp, #8
	bne _021E98B2
	movs r1, #0x10
	ldrsh r1, [r2, r1]
	movs r2, #0x4e
	lsls r2, r2, #2
	subs r2, r2, #7
	ldrb r2, [r4, r2]
	subs r1, r1, r2
	asrs r2, r1, #3
	lsrs r2, r2, #0x1c
	adds r2, r1, r2
	lsls r1, r2, #0x14
	movs r2, #0x4e
	lsls r2, r2, #2
	subs r2, r2, #6
	ldrb r3, [r4, r2]
	mov r2, lr
	lsrs r1, r1, #0x18
	subs r3, r2, r3
	asrs r2, r3, #3
	lsrs r2, r2, #0x1c
	adds r2, r3, r2
	lsls r2, r2, #0x14
	lsrs r2, r2, #0x18
	cmp r2, #5
	bhi _021E989C
	lsls r2, r7, #3
	adds r2, #8
	b _021E989E
_021E989C:
	lsls r2, r7, #3
_021E989E:
	str r2, [r0]
	cmp r1, #4
	bls _021E98AC
	lsls r0, r6, #3
	adds r0, #8
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_021E98AC:
	lsls r0, r6, #3
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_021E98B2:
	movs r1, #0x10
	ldrsh r1, [r2, r1]
	movs r2, #0x4e
	lsls r2, r2, #2
	subs r2, r2, #7
	ldrb r2, [r4, r2]
	subs r1, r1, r2
	asrs r2, r1, #2
	lsrs r2, r2, #0x1d
	adds r2, r1, r2
	asrs r1, r2, #3
	lsrs r3, r1, #0x1f
	lsls r1, r1, #0x1f
	subs r1, r1, r3
	movs r2, #0x1f
	rors r1, r2
	movs r2, #0x4e
	lsls r2, r2, #2
	adds r1, r3, r1
	subs r2, r2, #6
	ldrb r3, [r4, r2]
	mov r2, lr
	lsls r1, r1, #0x18
	subs r3, r2, r3
	asrs r2, r3, #2
	lsrs r2, r2, #0x1d
	adds r2, r3, r2
	asrs r2, r2, #3
	lsrs r4, r2, #0x1f
	lsls r3, r2, #0x1f
	subs r3, r3, r4
	movs r2, #0x1f
	rors r3, r2
	adds r2, r4, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r2, r7, r2
	lsls r2, r2, #3
	lsrs r1, r1, #0x18
	str r2, [r0]
	adds r0, r6, r1
	lsls r0, r0, #3
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov101_021E9848

	thumb_func_start ov101_021E990C
ov101_021E990C: @ 0x021E990C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r4, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r5, [r0, #8]
	movs r0, #0x4e
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021E992A
	movs r7, #2
	movs r6, #0x10
	b _021E992E
_021E992A:
	movs r7, #1
	movs r6, #8
_021E992E:
	cmp r7, #0
	beq _021E9946
	lsls r0, r7, #0xc
	str r0, [sp, #0xc]
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E9956
_021E9946:
	lsls r0, r7, #0xc
	str r0, [sp, #0xc]
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E9956:
	blx FUN_020F2104
	adds r1, r4, #0
	adds r1, #0xd0
	str r0, [r1]
	cmp r7, #0
	beq _021E9976
	ldr r0, [sp, #0xc]
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E9984
_021E9976:
	ldr r0, [sp, #0xc]
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E9984:
	blx FUN_020F2104
	adds r1, r4, #0
	adds r1, #0xd4
	str r0, [r1]
	lsls r0, r6, #0xf
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	beq _021E99A2
	adds r0, r4, #0
	bl ov101_021E93D0
	b _021E9ABC
_021E99A2:
	movs r1, #0
	str r1, [sp]
	movs r3, #0x11
	str r1, [sp, #4]
	lsls r3, r3, #4
	ldrh r2, [r4, r3]
	adds r3, r3, #2
	ldrh r3, [r4, r3]
	adds r0, r4, #0
	bl ov101_021E9530
	movs r0, #0xfc
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xc8
	str r1, [r0]
	movs r1, #0xfe
	adds r0, r4, #0
	ldrsh r2, [r4, r1]
	adds r0, #0xcc
	str r2, [r0]
	adds r0, r1, #0
	adds r0, #0x12
	ldrsh r0, [r4, r0]
	mov ip, r0
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r3, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xf4
	ldrh r2, [r0]
	mov r0, ip
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r3, r0
	adds r0, r0, #4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x18]
	adds r0, r1, #0
	adds r0, #0x14
	ldrsh r3, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x33
	ldrb r2, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xf0
	ldrh r0, [r0]
	adds r1, #0x3a
	subs r0, r3, r0
	lsls r0, r0, #3
	adds r0, r2, r0
	adds r0, r0, #4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x14]
	ldrb r0, [r4, r1]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021E9AAC
	ldr r0, [sp, #0x18]
	mov r2, ip
	str r0, [sp]
	ldr r0, [sp, #0x14]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #1
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x10
	bl ov101_021E9530
	ldr r0, [sp, #0x14]
	movs r2, #0x11
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0xd8
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xdc
	str r0, [sp, #8]
	lsls r2, r2, #4
	ldrh r1, [r4, r2]
	adds r2, r2, #2
	ldrh r2, [r4, r2]
	ldr r3, [sp, #0x18]
	adds r0, r4, #0
	bl ov101_021E9848
	movs r0, #0xfc
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xc8
	str r1, [r0]
	movs r2, #0xfe
	adds r0, r4, #0
	ldrsh r1, [r4, r2]
	adds r0, #0xcc
	str r1, [r0]
	adds r1, r2, #0
	adds r1, #0x12
	ldrsh r3, [r4, r1]
	adds r1, r4, #0
	adds r1, #0xf4
	adds r0, r2, #0
	ldrh r1, [r1]
	adds r0, #0x34
	ldrb r0, [r4, r0]
	subs r1, r3, r1
	muls r1, r6, r1
	adds r1, r0, r1
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x18]
	adds r0, r2, #0
	adds r0, #0x33
	adds r2, #0x14
	ldrb r1, [r4, r0]
	ldrsh r0, [r4, r2]
	adds r2, r4, #0
	adds r2, #0xf0
	ldrh r2, [r2]
	subs r0, r0, r2
	muls r0, r6, r0
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x14]
_021E9AAC:
	adds r1, r5, #0
	ldr r0, [sp, #0x18]
	adds r1, #0xcc
	strh r0, [r1]
	adds r1, r5, #0
	ldr r0, [sp, #0x14]
	adds r1, #0xce
	strh r0, [r1]
_021E9ABC:
	ldr r1, _021E9B68 @ =0x00000112
	ldrsh r0, [r4, r1]
	subs r1, r1, #2
	ldrsh r2, [r4, r1]
	adds r1, r5, #0
	adds r1, #0xd4
	strh r2, [r1]
	adds r1, r5, #0
	adds r1, #0xd6
	strh r0, [r1]
	cmp r7, #0
	beq _021E9AE6
	ldr r0, [sp, #0xc]
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E9AF4
_021E9AE6:
	ldr r0, [sp, #0xc]
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E9AF4:
	blx FUN_020F2104
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x24]
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	add r1, sp, #0x1c
	bl FUN_020247F4
	ldr r3, _021E9B6C @ =0x00000131
	adds r2, r4, #0
	adds r0, r3, #0
	subs r0, #0x27
	adds r2, #0xf0
	ldrsh r0, [r4, r0]
	ldrh r2, [r2]
	ldrb r1, [r4, r3]
	subs r0, r0, r2
	adds r2, r3, #0
	subs r2, #0x29
	muls r0, r6, r0
	ldrsh r7, [r4, r2]
	adds r2, r4, #0
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	adds r2, #0xf4
	ldrh r2, [r2]
	adds r1, r0, r1
	adds r0, r3, #1
	subs r2, r7, r2
	ldrb r0, [r4, r0]
	muls r2, r6, r2
	adds r2, r0, r2
	ldr r0, [sp, #0x10]
	adds r2, r0, r2
	adds r0, r5, #0
	adds r0, #0xf4
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0xf6
	strh r1, [r0]
	adds r0, r3, #0
	subs r0, #0x27
	subs r3, #0x29
	ldrsh r2, [r4, r0]
	adds r0, r5, #0
	ldrsh r1, [r4, r3]
	adds r0, #0xfc
	adds r5, #0xfe
	strh r1, [r0]
	strh r2, [r5]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9B68: .4byte 0x00000112
_021E9B6C: .4byte 0x00000131
	thumb_func_end ov101_021E990C

	thumb_func_start ov101_021E9B70
ov101_021E9B70: @ 0x021E9B70
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r1, #0
	adds r4, r0, #0
	ldr r0, [r6, #8]
	blx FUN_020CCBB0
	adds r5, r0, #0
	ldr r0, [r6, #0xc]
	blx FUN_020CCBB0
	str r5, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	str r5, [sp, #0xc]
	str r0, [sp, #0x10]
_021E9B90:
	movs r3, #0x4d
	lsls r3, r3, #2
	ldr r0, [r4, #0x10]
	adds r1, r5, #2
	lsls r1, r1, #0x18
	ldrsb r3, [r4, r3]
	ldr r7, [r6]
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	movs r2, #0
	adds r3, r7, r3
	bl FUN_0201BC8C
	ldr r3, _021E9BF0 @ =0x00000133
	ldr r0, [r4, #0x10]
	adds r1, r5, #2
	lsls r1, r1, #0x18
	ldrsb r3, [r4, r3]
	ldr r7, [r6, #4]
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	movs r2, #3
	adds r3, r7, r3
	bl FUN_0201BC8C
	ldr r0, [r6, #0x14]
	adds r1, r5, #2
	str r0, [sp]
	ldr r0, [r4, #0x10]
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	ldr r3, [r6, #0x10]
	lsrs r1, r1, #0x18
	add r2, sp, #4
	bl FUN_0201BE7C
	adds r5, r5, #1
	cmp r5, #2
	blt _021E9B90
	movs r1, #0x4e
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x80
	bics r2, r0
	strb r2, [r4, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021E9BF0: .4byte 0x00000133
	thumb_func_end ov101_021E9B70

	thumb_func_start ov101_021E9BF4
ov101_021E9BF4: @ 0x021E9BF4
	push {r4, r5, r6, r7}
	adds r3, r1, #0
	adds r1, r0, #0
	adds r1, #0x84
	ldr r1, [r1]
	movs r4, #0xf4
	ldr r1, [r1, #8]
	ldrsh r4, [r1, r4]
	adds r5, r4, r3
	adds r4, r1, #0
	adds r4, #0xf4
	strh r5, [r4]
	movs r5, #0xf6
	ldrsh r4, [r1, r5]
	adds r5, #0x43
	adds r6, r4, r2
	adds r4, r1, #0
	adds r4, #0xf6
	strh r6, [r4]
	ldrb r4, [r0, r5]
	lsls r4, r4, #0x1c
	lsrs r4, r4, #0x1f
	beq _021E9C3A
	movs r4, #0xcc
	ldrsh r4, [r1, r4]
	adds r5, r4, r3
	adds r4, r1, #0
	adds r4, #0xcc
	strh r5, [r4]
	movs r4, #0xce
	ldrsh r4, [r1, r4]
	adds r5, r4, r2
	adds r4, r1, #0
	adds r4, #0xce
	strh r5, [r4]
_021E9C3A:
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _021E9C6E
	ldr r0, _021E9CC8 @ =0x0000025E
	movs r5, #0
_021E9C44:
	movs r4, #0x28
	muls r4, r5, r4
	movs r6, #0x97
	adds r4, r1, r4
	lsls r6, r6, #2
	ldrsh r6, [r4, r6]
	adds r7, r6, r3
	movs r6, #0x97
	lsls r6, r6, #2
	strh r7, [r4, r6]
	adds r6, r6, #2
	ldrsh r6, [r4, r6]
	adds r6, r6, r2
	strh r6, [r4, r0]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	cmp r5, #0x1b
	blo _021E9C44
	pop {r4, r5, r6, r7}
	bx lr
_021E9C6E:
	ldr r0, _021E9CCC @ =0x0000011E
	movs r5, #0
_021E9C72:
	movs r4, #0x28
	muls r4, r5, r4
	movs r6, #0x47
	adds r4, r1, r4
	lsls r6, r6, #2
	ldrsh r6, [r4, r6]
	adds r7, r6, r3
	movs r6, #0x47
	lsls r6, r6, #2
	strh r7, [r4, r6]
	adds r6, r6, #2
	ldrsh r6, [r4, r6]
	adds r6, r6, r2
	strh r6, [r4, r0]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	cmp r5, #4
	blo _021E9C72
	ldr r0, _021E9CD0 @ =0x000001BE
	movs r5, #0
_021E9C9C:
	movs r4, #0x28
	muls r4, r5, r4
	movs r6, #0x6f
	adds r4, r1, r4
	lsls r6, r6, #2
	ldrsh r6, [r4, r6]
	adds r7, r6, r3
	movs r6, #0x6f
	lsls r6, r6, #2
	strh r7, [r4, r6]
	adds r6, r6, #2
	ldrsh r6, [r4, r6]
	adds r6, r6, r2
	strh r6, [r4, r0]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	cmp r5, #0x64
	blo _021E9C9C
	pop {r4, r5, r6, r7}
	bx lr
	nop
_021E9CC8: .4byte 0x0000025E
_021E9CCC: .4byte 0x0000011E
_021E9CD0: .4byte 0x000001BE
	thumb_func_end ov101_021E9BF4

	thumb_func_start ov101_021E9CD4
ov101_021E9CD4: @ 0x021E9CD4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _021E9D70 @ =0x00000135
	ldrb r2, [r4, r0]
	cmp r2, #0x10
	bls _021E9CE8
	add sp, #8
	movs r0, #1
	pop {r4, pc}
_021E9CE8:
	cmp r1, #0
	bne _021E9D28
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	ldr r0, _021E9D70 @ =0x00000135
	movs r2, #0x40
	ldrb r1, [r4, r0]
	movs r0, #0x10
	movs r3, #0xc0
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x78]
	bl FUN_02003E5C
	b _021E9D52
_021E9D28:
	str r2, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	ldr r0, _021E9D70 @ =0x00000135
	movs r1, #2
	ldrb r0, [r4, r0]
	movs r2, #0x40
	movs r3, #0xc0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x78]
	bl FUN_02003E5C
_021E9D52:
	ldr r0, _021E9D70 @ =0x00000135
	ldrb r1, [r4, r0]
	cmp r1, #0x10
	blo _021E9D64
	adds r1, r1, #2
	strb r1, [r4, r0]
	add sp, #8
	movs r0, #1
	pop {r4, pc}
_021E9D64:
	adds r1, r1, #2
	strb r1, [r4, r0]
	movs r0, #0
	add sp, #8
	pop {r4, pc}
	nop
_021E9D70: .4byte 0x00000135
	thumb_func_end ov101_021E9CD4

	thumb_func_start ov101_021E9D74
ov101_021E9D74: @ 0x021E9D74
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r2, _021E9E7C @ =0x04001040
	ldr r0, [r0, #8]
	ldr r3, _021E9E80 @ =0x000040C0
	str r0, [sp]
	movs r0, #0xff
	strh r0, [r2]
	adds r4, r2, #0
	strh r3, [r2, #4]
	lsls r0, r0, #8
	strh r0, [r2, #2]
	strh r3, [r2, #6]
	adds r4, #0xa
	ldrh r6, [r4]
	movs r3, #0x3f
	movs r0, #0x11
	bics r6, r3
	orrs r0, r6
	strh r0, [r4]
	adds r0, r2, #0
	adds r0, #8
	ldrh r4, [r0]
	subs r2, #0x40
	bics r4, r3
	movs r3, #0x1f
	orrs r4, r3
	strh r4, [r0]
	ldrh r6, [r0]
	ldr r4, _021E9E84 @ =0xFFFFC0FF
	lsls r3, r3, #8
	ands r4, r6
	orrs r3, r4
	strh r3, [r0]
	ldr r3, [r2]
	ldr r0, _021E9E88 @ =0xFFFF1FFF
	ands r3, r0
	movs r0, #6
	lsls r0, r0, #0xc
	orrs r0, r3
	str r0, [r2]
	cmp r1, #0
	bne _021E9E4A
	movs r6, #3
	adds r7, r6, #0
	movs r4, #0
	subs r7, #0x83
_021E9DD6:
	ldr r0, [r5, #0x10]
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0201BC8C
	adds r0, r4, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #3
	blt _021E9DD6
	ldr r2, [sp]
	ldr r1, _021E9E8C @ =0x0000014B
	movs r3, #0
	movs r7, #0x15
_021E9E02:
	lsrs r0, r3, #0x1f
	lsls r6, r3, #0x1f
	subs r6, r6, r0
	movs r4, #0x1f
	rors r6, r4
	adds r6, r0, r6
	adds r0, r3, r0
	movs r4, #0x68
	muls r4, r6, r4
	adds r4, #0x20
	asrs r0, r0, #1
	strh r4, [r2, #4]
	adds r4, r0, #0
	muls r4, r7, r4
	adds r0, r4, r1
	strh r0, [r2, #6]
	adds r3, r3, #1
	adds r2, #0x28
	cmp r3, #4
	blt _021E9E02
	ldr r0, [sp]
	movs r1, #0x10
	adds r0, #0xa4
	strh r1, [r0]
	ldr r0, [sp]
	movs r1, #0x46
	adds r0, #0xa6
	lsls r1, r1, #2
	str r0, [sp]
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6E84
	b _021E9E74
_021E9E4A:
	ldr r0, [r5, #0x10]
	movs r1, #5
	ldr r0, [r0, #0x74]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	movs r1, #6
	ldr r0, [r0, #0x74]
	movs r2, #5
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	movs r1, #7
	ldr r0, [r0, #0x74]
	movs r2, #5
	movs r3, #0
	bl FUN_0201BC8C
_021E9E74:
	movs r0, #0
	str r0, [r5, #0x34]
	str r0, [r5, #0x30]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E9E7C: .4byte 0x04001040
_021E9E80: .4byte 0x000040C0
_021E9E84: .4byte 0xFFFFC0FF
_021E9E88: .4byte 0xFFFF1FFF
_021E9E8C: .4byte 0x0000014B
	thumb_func_end ov101_021E9D74

	thumb_func_start ov101_021E9E90
ov101_021E9E90: @ 0x021E9E90
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	adds r6, r1, #0
	ldr r4, [r0, #8]
	ldr r0, [r5, #0x30]
	cmp r0, #0
	beq _021E9EA6
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E9EA6:
	cmp r6, #0
	ldr r0, [r5, #0x10]
	bne _021E9EE8
	ldr r0, [r0, #0x74]
	movs r1, #5
	movs r2, #4
	movs r3, #0x20
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	movs r1, #6
	ldr r0, [r0, #0x74]
	movs r2, #4
	movs r3, #0x20
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	movs r1, #7
	ldr r0, [r0, #0x74]
	movs r2, #4
	movs r3, #0x20
	bl FUN_0201BC8C
	movs r2, #0
	movs r0, #6
_021E9ED8:
	ldrsh r1, [r4, r0]
	adds r2, r2, #1
	subs r1, #0x20
	strh r1, [r4, #6]
	adds r4, #0x28
	cmp r2, #4
	ble _021E9ED8
	b _021E9F22
_021E9EE8:
	movs r1, #5
	ldr r0, [r0, #0x74]
	adds r2, r1, #0
	movs r3, #0x20
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	movs r1, #6
	ldr r0, [r0, #0x74]
	movs r2, #5
	movs r3, #0x20
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	movs r1, #7
	ldr r0, [r0, #0x74]
	movs r2, #5
	movs r3, #0x20
	bl FUN_0201BC8C
	movs r2, #0
	movs r0, #6
_021E9F14:
	ldrsh r1, [r4, r0]
	adds r2, r2, #1
	adds r1, #0x20
	strh r1, [r4, #6]
	adds r4, #0x28
	cmp r2, #4
	ble _021E9F14
_021E9F22:
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6E84
	ldr r0, [r5, #0x34]
	adds r0, r0, #1
	str r0, [r5, #0x34]
	cmp r0, #4
	bge _021E9F3A
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E9F3A:
	movs r4, #0
	movs r0, #1
	str r4, [r5, #0x34]
	str r0, [r5, #0x30]
	cmp r6, #1
	bne _021E9F8A
	adds r6, r4, #0
	movs r7, #3
_021E9F4A:
	adds r0, r4, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	ldr r0, [r5, #0x10]
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	ldr r0, [r5, #0x10]
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r2, r7, #0
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	adds r4, r4, #1
	cmp r4, #3
	blt _021E9F4A
_021E9F8A:
	ldr r0, _021E9FD0 @ =0x04001000
	ldr r1, _021E9FD4 @ =0xFFFF1FFF
	ldr r2, [r0]
	adds r4, r0, #0
	ands r1, r2
	str r1, [r0]
	adds r1, r0, #0
	movs r2, #0
	adds r1, #0x40
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0x44
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0x42
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0x46
	strh r2, [r1]
	adds r4, #0x48
	ldrh r1, [r4]
	movs r2, #0x3f
	adds r0, #0x4a
	bics r1, r2
	strh r1, [r4]
	ldrh r3, [r4]
	ldr r1, _021E9FD8 @ =0xFFFFC0FF
	ands r1, r3
	strh r1, [r4]
	ldrh r1, [r0]
	bics r1, r2
	strh r1, [r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9FD0: .4byte 0x04001000
_021E9FD4: .4byte 0xFFFF1FFF
_021E9FD8: .4byte 0xFFFFC0FF
	thumb_func_end ov101_021E9E90

	thumb_func_start ov101_021E9FDC
ov101_021E9FDC: @ 0x021E9FDC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r4, _021EA0CC @ =0x04000040
	ldr r0, [r0, #8]
	adds r6, r1, #0
	str r0, [sp]
	movs r0, #0xff
	strh r0, [r4]
	movs r1, #0x70
	strh r1, [r4, #4]
	lsls r0, r0, #8
	strh r0, [r4, #2]
	strh r1, [r4, #6]
	adds r1, r4, #0
	adds r3, r4, #0
	adds r1, #0xa
	ldrh r2, [r1]
	movs r0, #0x3f
	movs r7, #0x18
	bics r2, r0
	orrs r2, r7
	adds r3, #8
	strh r2, [r1]
	ldrh r1, [r3]
	subs r4, #0x40
	bics r1, r0
	movs r0, #0x1f
	orrs r1, r0
	strh r1, [r3]
	ldrh r2, [r3]
	ldr r1, _021EA0D0 @ =0xFFFFC0FF
	lsls r0, r0, #8
	ands r1, r2
	orrs r0, r1
	strh r0, [r3]
	ldr r1, [r4]
	ldr r0, _021EA0D4 @ =0xFFFF1FFF
	ands r1, r0
	lsls r0, r7, #0xa
	orrs r0, r1
	str r0, [r4]
	cmp r6, #0
	bne _021EA094
	movs r4, #0
	movs r6, #3
	movs r7, #0x70
_021EA03C:
	ldr r0, [r5, #0x10]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0201BC8C
	adds r4, r4, #1
	cmp r4, #2
	blt _021EA03C
	movs r1, #0x32
	ldr r0, [sp]
	lsls r1, r1, #4
	adds r2, r0, r1
	movs r3, #0x14
	movs r0, #6
_021EA060:
	ldrsh r1, [r2, r0]
	adds r3, r3, #1
	subs r1, #0x70
	strh r1, [r2, #6]
	adds r2, #0x28
	cmp r3, #0x1b
	ble _021EA060
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6E84
	movs r6, #0
	adds r4, r5, #0
	movs r7, #4
_021EA07E:
	movs r2, #5
	ldr r0, [r4, #0x44]
	adds r1, r7, #0
	mvns r2, r2
	bl FUN_020136B4
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #4
	blt _021EA07E
	b _021EA0C4
_021EA094:
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x74]
	movs r2, #5
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	movs r2, #5
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r1, [r0, #8]
	movs r0, #0x76
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
_021EA0C4:
	movs r0, #0
	str r0, [r5, #0x34]
	str r0, [r5, #0x30]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EA0CC: .4byte 0x04000040
_021EA0D0: .4byte 0xFFFFC0FF
_021EA0D4: .4byte 0xFFFF1FFF
	thumb_func_end ov101_021E9FDC

	thumb_func_start ov101_021EA0D8
ov101_021EA0D8: @ 0x021EA0D8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	str r1, [sp]
	adds r0, #0x84
	ldr r0, [r0]
	ldr r4, [r0, #8]
	ldr r0, [r5, #0x30]
	cmp r0, #0
	beq _021EA0EE
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EA0EE:
	ldr r0, [sp]
	cmp r0, #0
	ldr r0, [r5, #0x10]
	bne _021EA12A
	ldr r0, [r0, #0x74]
	movs r1, #1
	movs r2, #5
	movs r3, #0x1c
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	movs r2, #5
	movs r3, #0x1c
	bl FUN_0201BC8C
	movs r0, #0x32
	lsls r0, r0, #4
	adds r3, r4, r0
	movs r2, #0x14
	movs r0, #6
_021EA11A:
	ldrsh r1, [r3, r0]
	adds r2, r2, #1
	adds r1, #0x1c
	strh r1, [r3, #6]
	adds r3, #0x28
	cmp r2, #0x1b
	ble _021EA11A
	b _021EA15C
_021EA12A:
	ldr r0, [r0, #0x74]
	movs r1, #1
	movs r2, #4
	movs r3, #0x1c
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	movs r2, #4
	movs r3, #0x1c
	bl FUN_0201BC8C
	movs r0, #0x32
	lsls r0, r0, #4
	adds r2, r4, r0
	movs r3, #0x14
	movs r0, #6
_021EA14E:
	ldrsh r1, [r2, r0]
	adds r3, r3, #1
	subs r1, #0x1c
	strh r1, [r2, #6]
	adds r2, #0x28
	cmp r3, #0x1b
	ble _021EA14E
_021EA15C:
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6E84
	movs r6, #0
	adds r4, r5, #0
	movs r7, #4
_021EA16C:
	movs r2, #5
	ldr r0, [r4, #0x44]
	adds r1, r7, #0
	mvns r2, r2
	bl FUN_020136B4
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #4
	blt _021EA16C
	ldr r0, [r5, #0x34]
	adds r0, r0, #1
	str r0, [r5, #0x34]
	cmp r0, #4
	bge _021EA18E
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021EA18E:
	movs r4, #0
	str r4, [r5, #0x34]
	movs r0, #1
	str r0, [r5, #0x30]
	ldr r0, [sp]
	cmp r0, #1
	bne _021EA1BE
_021EA19C:
	ldr r0, [r5, #0x10]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	ldr r0, [r5, #0x10]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	adds r4, r4, #1
	cmp r4, #2
	blt _021EA19C
_021EA1BE:
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _021EA230 @ =0xFFFF1FFF
	adds r4, r0, #0
	ands r1, r2
	str r1, [r0]
	adds r1, r0, #0
	movs r2, #0
	adds r1, #0x40
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0x44
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0x42
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0x46
	strh r2, [r1]
	adds r4, #0x48
	ldrh r1, [r4]
	movs r2, #0x3f
	adds r0, #0x4a
	bics r1, r2
	strh r1, [r4]
	ldrh r3, [r4]
	ldr r1, _021EA234 @ =0xFFFFC0FF
	ands r1, r3
	strh r1, [r4]
	ldrh r1, [r0]
	bics r1, r2
	strh r1, [r0]
	ldr r0, [sp]
	cmp r0, #0
	bne _021EA22C
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r1, [r0, #8]
	movs r0, #0x76
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	ldr r1, [r5, #0x10]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	beq _021EA22C
	ldr r0, [r1, #0x7c]
	movs r1, #1
	adds r2, r1, #0
	bl FUN_021E7128
_021EA22C:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EA230: .4byte 0xFFFF1FFF
_021EA234: .4byte 0xFFFFC0FF
	thumb_func_end ov101_021EA0D8

	thumb_func_start ov101_021EA238
ov101_021EA238: @ 0x021EA238
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x4e
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	adds r6, r1, #0
	movs r7, #0
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x18
	str r0, [sp]
_021EA260:
	movs r0, #0x85
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	lsls r0, r7, #4
	adds r1, r1, r0
	ldr r0, _021EA4C4 @ =0x00000132
	adds r3, r4, #0
	adds r3, #0xf4
	ldrb r2, [r4, r0]
	ldrb r0, [r1, #2]
	ldrh r3, [r3]
	ldrh r5, [r1, #4]
	subs r3, r0, r3
	ldr r0, [sp, #4]
	muls r3, r0, r3
	ldr r0, [sp]
	adds r2, r2, r3
	adds r0, r0, r2
	lsls r2, r5, #0x14
	lsrs r3, r2, #0x1c
	ldr r2, [sp, #8]
	muls r2, r3, r2
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, _021EA4C8 @ =0x00000131
	adds r3, r4, #0
	adds r3, #0xf0
	ldrb r2, [r4, r0]
	ldrb r0, [r1, #3]
	ldrh r3, [r3]
	subs r3, r0, r3
	ldr r0, [sp, #4]
	muls r3, r0, r3
	ldr r0, [sp]
	adds r2, r2, r3
	adds r0, r0, r2
	lsls r2, r5, #0x10
	lsrs r3, r2, #0x1c
	ldr r2, [sp, #8]
	muls r2, r3, r2
	adds r0, r0, r2
	adds r2, r7, #0
	adds r2, #0xb
	lsls r0, r0, #0x10
	lsls r2, r2, #0x10
	asrs r0, r0, #0x10
	lsrs r2, r2, #0x10
	cmp r6, #0
	beq _021EA2D0
	cmp r6, #1
	beq _021EA340
	cmp r6, #2
	beq _021EA360
	b _021EA386
_021EA2D0:
	adds r5, r2, #0
	adds r2, r4, #0
	adds r2, #0x84
	ldr r2, [r2]
	movs r3, #0x28
	ldr r2, [r2, #8]
	muls r5, r3, r5
	adds r3, r2, r5
	ldr r2, [sp, #0xc]
	strh r2, [r3, #4]
	adds r2, r4, #0
	adds r2, #0x84
	ldr r2, [r2]
	ldr r2, [r2, #8]
	adds r2, r2, r5
	strh r0, [r2, #6]
	ldrh r1, [r1]
	adds r0, r4, #0
	bl ov101_021ED614
	cmp r0, #0
	beq _021EA31E
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #1
	ldr r0, [r0, #8]
	adds r0, r0, r5
	ldr r0, [r0, #0x20]
	bl FUN_02024830
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r1, r0, r5
	movs r0, #1
	strb r0, [r1, #1]
	b _021EA386
_021EA31E:
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #0
	ldr r0, [r0, #8]
	adds r0, r0, r5
	ldr r0, [r0, #0x20]
	bl FUN_02024830
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r1, r0, r5
	movs r0, #0
	strb r0, [r1, #1]
	b _021EA386
_021EA340:
	movs r1, #0x28
	muls r1, r2, r1
	adds r2, r4, #0
	adds r2, #0x84
	ldr r2, [r2]
	ldr r2, [r2, #8]
	adds r3, r2, r1
	ldr r2, [sp, #0xc]
	strh r2, [r3, #8]
	adds r2, r4, #0
	adds r2, #0x84
	ldr r2, [r2]
	ldr r2, [r2, #8]
	adds r1, r2, r1
	strh r0, [r1, #0xa]
	b _021EA386
_021EA360:
	movs r0, #0x28
	adds r5, r2, #0
	muls r5, r0, r5
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #0
	ldr r0, [r0, #8]
	adds r0, r0, r5
	ldr r0, [r0, #0x20]
	bl FUN_02024830
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r1, r0, r5
	movs r0, #0
	strb r0, [r1, #1]
_021EA386:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0x64
	bhs _021EA392
	b _021EA260
_021EA392:
	movs r7, #0
_021EA394:
	adds r0, r7, #7
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r7, #1
	adds r1, r4, r0
	ldr r0, _021EA4CC @ =0x000009E8
	ldrh r1, [r1, r0]
	cmp r1, #0
	bne _021EA3CC
	adds r1, r4, #0
	adds r1, #0x84
	ldr r1, [r1]
	movs r0, #0x28
	ldr r1, [r1, #8]
	muls r0, r5, r0
	adds r2, r1, r0
	movs r1, #0
	strb r1, [r2, #1]
	adds r1, r4, #0
	adds r1, #0x84
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r0, r1, r0
	ldr r0, [r0, #0x20]
	movs r1, #0
	bl FUN_02024830
	b _021EA4B2
_021EA3CC:
	adds r0, r4, #0
	bl ov101_021EA758
	ldr r1, _021EA4C4 @ =0x00000132
	adds r3, r4, #0
	adds r3, #0xf4
	ldrb r2, [r4, r1]
	ldrb r1, [r0, #2]
	ldrh r3, [r3]
	subs r3, r1, r3
	ldr r1, [sp, #4]
	muls r3, r1, r3
	ldr r1, [sp]
	adds r2, r2, r3
	adds r3, r1, r2
	ldrh r1, [r0, #4]
	ldrb r0, [r0, #3]
	mov ip, r1
	lsls r1, r1, #0x14
	lsrs r2, r1, #0x1c
	ldr r1, [sp, #8]
	muls r1, r2, r1
	adds r1, r3, r1
	ldr r2, _021EA4C8 @ =0x00000131
	lsls r1, r1, #0x10
	ldrb r3, [r4, r2]
	adds r2, r4, #0
	adds r2, #0xf0
	ldrh r2, [r2]
	asrs r1, r1, #0x10
	subs r2, r0, r2
	ldr r0, [sp, #4]
	muls r2, r0, r2
	ldr r0, [sp]
	adds r2, r3, r2
	adds r0, r0, r2
	mov r2, ip
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x1c
	ldr r2, [sp, #8]
	muls r2, r3, r2
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r6, #0
	beq _021EA432
	cmp r6, #1
	beq _021EA470
	cmp r6, #2
	beq _021EA48E
	b _021EA4B2
_021EA432:
	adds r3, r4, #0
	adds r3, #0x84
	ldr r3, [r3]
	movs r2, #0x28
	ldr r3, [r3, #8]
	muls r2, r5, r2
	adds r3, r3, r2
	strh r1, [r3, #4]
	adds r1, r4, #0
	adds r1, #0x84
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r1, r1, r2
	strh r0, [r1, #6]
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r1, r0, r2
	movs r0, #1
	strb r0, [r1, #1]
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #1
	ldr r0, [r0, #8]
	adds r0, r0, r2
	ldr r0, [r0, #0x20]
	bl FUN_02024830
	b _021EA4B2
_021EA470:
	adds r3, r4, #0
	adds r3, #0x84
	ldr r3, [r3]
	movs r2, #0x28
	ldr r3, [r3, #8]
	muls r2, r5, r2
	adds r3, r3, r2
	strh r1, [r3, #8]
	adds r1, r4, #0
	adds r1, #0x84
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r1, r1, r2
	strh r0, [r1, #0xa]
	b _021EA4B2
_021EA48E:
	adds r1, r4, #0
	adds r1, #0x84
	ldr r1, [r1]
	movs r0, #0x28
	ldr r1, [r1, #8]
	muls r0, r5, r0
	adds r2, r1, r0
	movs r1, #0
	strb r1, [r2, #1]
	adds r1, r4, #0
	adds r1, #0x84
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r0, r1, r0
	ldr r0, [r0, #0x20]
	movs r1, #0
	bl FUN_02024830
_021EA4B2:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #4
	bhs _021EA4BE
	b _021EA394
_021EA4BE:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA4C4: .4byte 0x00000132
_021EA4C8: .4byte 0x00000131
_021EA4CC: .4byte 0x000009E8
	thumb_func_end ov101_021EA238

	thumb_func_start ov101_021EA4D0
ov101_021EA4D0: @ 0x021EA4D0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	str r1, [sp]
	movs r7, #0
_021EA4D8:
	movs r0, #0xe
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _021EA5FC @ =0x021F79B4
	adds r3, r5, #0
	adds r6, r0, r1
	ldrb r4, [r6, #0xa]
	adds r3, #0xf4
	ldrh r3, [r3]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1c
	lsls r0, r0, #0x12
	asrs r2, r0, #0x10
	ldr r0, _021EA600 @ =0x00000132
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #6]
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r1, r0
	adds r0, r2, r0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	lsls r0, r4, #0x18
	ldrb r3, [r6, #7]
	lsrs r0, r0, #0x1c
	lsls r0, r0, #0x12
	adds r4, r3, #2
	adds r3, r5, #0
	adds r3, #0xf0
	asrs r1, r0, #0x10
	ldr r0, _021EA604 @ =0x00000131
	ldrh r3, [r3]
	ldrb r0, [r5, r0]
	subs r3, r4, r3
	lsls r3, r3, #3
	adds r0, r0, r3
	adds r0, r1, r0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	adds r0, r7, #0
	adds r0, #0xf
	lsls r0, r0, #0x10
	ldr r3, [sp]
	lsrs r0, r0, #0x10
	cmp r3, #0
	beq _021EA540
	cmp r3, #1
	beq _021EA5B8
	adds r1, r3, #0
	cmp r1, #2
	beq _021EA5D6
	b _021EA5EC
_021EA540:
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r3, #0x28
	ldr r0, [r0, #8]
	muls r4, r3, r4
	adds r0, r0, r4
	strh r2, [r0, #4]
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r0, r4
	strh r1, [r0, #6]
	ldr r0, [r5, #0x10]
	ldrb r2, [r6, #4]
	ldr r0, [r0, #0x2c]
	movs r1, #2
	bl FUN_02066930
	cmp r0, #0
	beq _021EA582
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #1
	ldr r0, [r0, #8]
	adds r0, r0, r4
	ldr r0, [r0, #0x20]
	bl FUN_02024830
	b _021EA594
_021EA582:
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #0
	ldr r0, [r0, #8]
	adds r0, r0, r4
	ldr r0, [r0, #0x20]
	bl FUN_02024830
_021EA594:
	ldrh r1, [r6, #2]
	ldrb r2, [r6, #6]
	ldrb r3, [r6, #7]
	adds r0, r5, #0
	bl ov101_021EA804
	cmp r0, #0
	beq _021EA5EC
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #0xa
	ldr r0, [r0, #8]
	adds r0, r0, r4
	ldr r0, [r0, #0x20]
	bl FUN_020248F0
	b _021EA5EC
_021EA5B8:
	movs r3, #0x28
	muls r3, r0, r3
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r0, r3
	strh r2, [r0, #8]
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r0, r3
	strh r1, [r0, #0xa]
	b _021EA5EC
_021EA5D6:
	adds r1, r5, #0
	adds r1, #0x84
	ldr r1, [r1]
	ldr r2, [r1, #8]
	movs r1, #0x28
	muls r1, r0, r1
	adds r0, r2, r1
	ldr r0, [r0, #0x20]
	movs r1, #0
	bl FUN_02024830
_021EA5EC:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0x1b
	bhs _021EA5F8
	b _021EA4D8
_021EA5F8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA5FC: .4byte 0x021F79B4
_021EA600: .4byte 0x00000132
_021EA604: .4byte 0x00000131
	thumb_func_end ov101_021EA4D0

	thumb_func_start ov101_021EA608
ov101_021EA608: @ 0x021EA608
	push {r4, r5, r6, lr}
	adds r0, #0x84
	ldr r0, [r0]
	cmp r1, #0
	ldr r5, [r0, #8]
	bne _021EA648
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x46
	lsls r0, r0, #2
	movs r4, #7
	adds r5, r5, r0
	movs r6, #0
_021EA636:
	ldr r0, [r5, #0x20]
	adds r1, r6, #0
	bl FUN_02024830
	adds r4, r4, #1
	adds r5, #0x28
	cmp r4, #0xa
	ble _021EA636
	pop {r4, r5, r6, pc}
_021EA648:
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021EA608

	thumb_func_start ov101_021EA664
ov101_021EA664: @ 0x021EA664
	cmp r1, #0xae
	bgt _021EA67A
	bge _021EA68E
	cmp r1, #0x98
	bgt _021EA6B8
	cmp r1, #0x97
	blt _021EA6B8
	beq _021EA68E
	cmp r1, #0x98
	beq _021EA68E
	b _021EA6B8
_021EA67A:
	ldr r3, _021EA6BC @ =0x00000133
	cmp r1, r3
	bgt _021EA684
	beq _021EA6AA
	b _021EA6B8
_021EA684:
	adds r2, r3, #0
	adds r2, #0xd6
	cmp r1, r2
	beq _021EA69C
	b _021EA6B8
_021EA68E:
	ldr r1, _021EA6C0 @ =0x0000013D
	ldrb r0, [r0, r1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	bne _021EA6B8
	movs r0, #1
	bx lr
_021EA69C:
	adds r3, #0xa
	ldrb r0, [r0, r3]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	bne _021EA6B8
	movs r0, #1
	bx lr
_021EA6AA:
	adds r3, #0xa
	ldrb r0, [r0, r3]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	bne _021EA6B8
	movs r0, #1
	bx lr
_021EA6B8:
	movs r0, #0
	bx lr
	.align 2, 0
_021EA6BC: .4byte 0x00000133
_021EA6C0: .4byte 0x0000013D
	thumb_func_end ov101_021EA664

	thumb_func_start ov101_021EA6C4
ov101_021EA6C4: @ 0x021EA6C4
	ldr r0, [r1]
	cmp r0, #0
	bne _021EA6CE
	movs r0, #0
	bx lr
_021EA6CE:
	ldrh r1, [r0]
	ldr r0, _021EA6E4 @ =0x00000209
	cmp r1, r0
	beq _021EA6DC
	subs r0, #0xd6
	cmp r1, r0
	bne _021EA6E0
_021EA6DC:
	movs r0, #0
	bx lr
_021EA6E0:
	movs r0, #1
	bx lr
	.align 2, 0
_021EA6E4: .4byte 0x00000209
	thumb_func_end ov101_021EA6C4

	thumb_func_start ov101_021EA6E8
ov101_021EA6E8: @ 0x021EA6E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, _021EA754 @ =0x00000136
	str r0, [sp]
	ldrb r0, [r0, r4]
	adds r3, r1, #0
	movs r1, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _021EA74C
	ldr r0, [sp]
	adds r4, #0xde
	ldr r0, [r0, r4]
	mov ip, r0
_021EA704:
	lsls r4, r1, #4
	mov r0, ip
	adds r4, r0, r4
	ldrb r0, [r4, #2]
	cmp r3, r0
	blo _021EA740
	ldrb r6, [r4, #3]
	cmp r2, r6
	blo _021EA740
	ldrh r7, [r4, #4]
	lsls r5, r7, #0x1c
	lsrs r5, r5, #0x1c
	adds r0, r0, r5
	cmp r3, r0
	bge _021EA740
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x1c
	adds r0, r6, r0
	cmp r2, r0
	bge _021EA740
	ldrh r1, [r4]
	ldr r0, [sp]
	bl ov101_021EA664
	cmp r0, #0
	beq _021EA73A
	movs r4, #0
_021EA73A:
	add sp, #8
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_021EA740:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _021EA704
_021EA74C:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA754: .4byte 0x00000136
	thumb_func_end ov101_021EA6E8

	thumb_func_start ov101_021EA758
ov101_021EA758: @ 0x021EA758
	push {r4, r5, r6, lr}
	ldr r3, _021EA790 @ =0x00000136
	movs r2, #0
	ldrb r5, [r0, r3]
	cmp r5, #0
	ble _021EA78C
	adds r3, #0xde
	ldr r3, [r0, r3]
_021EA768:
	lsls r6, r2, #4
	adds r4, r3, r6
	ldrh r6, [r3, r6]
	cmp r6, r1
	bne _021EA782
	adds r1, r6, #0
	bl ov101_021EA664
	cmp r0, #0
	beq _021EA77E
	movs r4, #0
_021EA77E:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_021EA782:
	adds r2, r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, r5
	blt _021EA768
_021EA78C:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021EA790: .4byte 0x00000136
	thumb_func_end ov101_021EA758

	thumb_func_start ov101_021EA794
ov101_021EA794: @ 0x021EA794
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r2, #0
	adds r7, r3, #0
	adds r5, r1, #0
	adds r1, r4, #0
	adds r2, r7, #0
	adds r6, r0, #0
	bl ov101_021EA6E8
	str r0, [r5]
	movs r0, #0x4e
	lsls r0, r0, #2
	ldrb r0, [r6, r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1e
	bne _021EA7C4
	cmp r4, #0x19
	bne _021EA7BC
	cmp r7, #0xa
	beq _021EA7C4
_021EA7BC:
	cmp r4, #0x16
	blo _021EA7C4
	movs r0, #0
	str r0, [r5]
_021EA7C4:
	ldr r0, [r5]
	cmp r0, #0
	bne _021EA7CE
	movs r0, #0
	b _021EA7DC
_021EA7CE:
	movs r1, #0x46
	lsls r1, r1, #2
	ldr r1, [r6, r1]
	adds r0, r6, #0
	ldrh r1, [r1]
	bl ov101_021ED614
_021EA7DC:
	str r0, [r5, #4]
	strh r4, [r5, #8]
	strh r7, [r5, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021EA794

	thumb_func_start ov101_021EA7E4
ov101_021EA7E4: @ 0x021EA7E4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	bl FUN_021E5C50
	ldrb r1, [r4, #0xe]
	cmp r1, #1
	beq _021EA7FA
	cmp r0, r1
	bne _021EA7FE
_021EA7FA:
	movs r0, #1
	pop {r4, pc}
_021EA7FE:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EA7E4

	thumb_func_start ov101_021EA804
ov101_021EA804: @ 0x021EA804
	push {r3, lr}
	cmp r1, #0x3a
	beq _021EA80E
	cmp r1, #0x1e
	bne _021EA812
_021EA80E:
	movs r0, #1
	pop {r3, pc}
_021EA812:
	adds r1, r2, #0
	adds r2, r3, #0
	bl ov101_021EA7E4
	pop {r3, pc}
	thumb_func_end ov101_021EA804

	thumb_func_start ov101_021EA81C
ov101_021EA81C: @ 0x021EA81C
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _021EA870 @ =0x021F79B4
	str r0, [sp]
	adds r5, r1, #0
	adds r6, r2, #0
	movs r7, #0
_021EA828:
	ldrb r0, [r4, #6]
	cmp r5, r0
	blt _021EA860
	ldrb r2, [r4, #0xa]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	adds r0, r0, r1
	cmp r5, r0
	bge _021EA860
	ldrb r1, [r4, #7]
	cmp r6, r1
	blt _021EA860
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x1c
	adds r0, r1, r0
	cmp r6, r0
	bge _021EA860
	ldr r0, [sp]
	ldrb r2, [r4, #4]
	ldr r0, [r0, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x2c]
	bl FUN_02066930
	cmp r0, #0
	beq _021EA860
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_021EA860:
	adds r7, r7, #1
	adds r4, #0xe
	cmp r7, #0x1b
	blt _021EA828
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA870: .4byte 0x021F79B4
	thumb_func_end ov101_021EA81C

	thumb_func_start ov101_021EA874
ov101_021EA874: @ 0x021EA874
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	bl ov101_021EA81C
	cmp r0, #0
	blt _021EA89C
	movs r1, #0xe
	muls r1, r0, r1
	ldr r0, _021EA8A4 @ =0x021F79B6
	adds r2, r6, #0
	ldrh r4, [r0, r1]
	adds r0, r5, #0
	adds r3, r7, #0
	adds r1, r4, #0
	bl ov101_021EA804
	cmp r0, #0
	bne _021EA8A0
_021EA89C:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021EA8A0:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EA8A4: .4byte 0x021F79B6
	thumb_func_end ov101_021EA874

	thumb_func_start ov101_021EA8A8
ov101_021EA8A8: @ 0x021EA8A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r1, #0
	subs r1, r3, #2
	str r1, [sp, #4]
	adds r7, r2, #0
	ldr r2, [sp, #4]
	adds r1, r7, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r5, r0, #0
	str r3, [sp]
	bl ov101_021EA81C
	adds r6, r0, #0
	bpl _021EA902
	ldr r3, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov101_021EA794
	movs r0, #0xf
	ldrsb r2, [r5, r0]
	cmp r2, #0
	blt _021EA8FA
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	adds r2, #0xf
	ldr r1, [r0, #8]
	movs r0, #0x28
	muls r0, r2, r0
	adds r0, r1, r0
	ldr r0, [r0, #0x20]
	movs r1, #0xa
	bl FUN_020248F0
	movs r0, #0
	mvns r0, r0
	strb r0, [r5, #0xf]
_021EA8FA:
	movs r0, #0
	add sp, #0xc
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_021EA902:
	movs r0, #0xe
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, _021EA98C @ =0x021F79B4
	strh r7, [r4, #8]
	ldrh r0, [r0, r1]
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r1, [sp, #8]
	strh r0, [r4, #0xa]
	adds r0, r5, #0
	bl ov101_021EA758
	str r0, [r4]
	movs r0, #0xf
	ldrsb r1, [r5, r0]
	cmp r1, r6
	beq _021EA97C
	cmp r1, #0
	blt _021EA948
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	adds r1, #0xf
	movs r2, #0x28
	muls r2, r1, r2
	ldr r0, [r0, #8]
	movs r1, #0xa
	adds r0, r0, r2
	ldr r0, [r0, #0x20]
	bl FUN_020248F0
	movs r0, #0
	mvns r0, r0
	strb r0, [r5, #0xf]
_021EA948:
	ldr r1, [sp, #8]
	ldr r3, [sp, #4]
	lsls r1, r1, #0x10
	lsls r3, r3, #0x10
	adds r0, r5, #0
	lsrs r1, r1, #0x10
	adds r2, r7, #0
	lsrs r3, r3, #0x10
	bl ov101_021EA804
	cmp r0, #0
	beq _021EA97C
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	adds r1, r6, #0
	ldr r2, [r0, #8]
	adds r1, #0xf
	movs r0, #0x28
	muls r0, r1, r0
	adds r0, r2, r0
	ldr r0, [r0, #0x20]
	movs r1, #0xb
	bl FUN_020248F0
	strb r6, [r5, #0xf]
_021EA97C:
	ldr r1, [sp, #8]
	adds r0, r5, #0
	bl ov101_021ED614
	str r0, [r4, #4]
	ldr r0, [sp, #8]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021EA98C: .4byte 0x021F79B4
	thumb_func_end ov101_021EA8A8

	thumb_func_start ov101_021EA990
ov101_021EA990: @ 0x021EA990
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl FUN_02014830
	movs r1, #0x13
	lsls r1, r1, #4
	ldrb r1, [r5, r1]
	movs r4, #0
	cmp r1, #0
	ble _021EAA06
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_021EA9AA:
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r3, #0x14
	ldrb r1, [r0, r4]
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r2, [r5, r0]
	muls r3, r1, r3
	ldr r0, [r2, #4]
	adds r3, r0, r3
	ldrh r0, [r3, #6]
	cmp r0, r6
	bne _021EA9FA
	ldrb r0, [r3, #1]
	cmp r0, #0
	bne _021EA9FA
	adds r0, r1, #0
	ldr r1, [r5, #0x10]
	adds r3, r7, #0
	ldr r1, [r1, #0x24]
	bl FUN_020932A4
	cmp r0, #0
	beq _021EA9E0
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EA9E0:
	movs r1, #0x4b
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	movs r0, #0x49
	lsls r0, r0, #2
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl FUN_0202F128
	cmp r0, #0
	beq _021EA9FA
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EA9FA:
	movs r0, #0x13
	lsls r0, r0, #4
	ldrb r0, [r5, r0]
	adds r4, r4, #1
	cmp r4, r0
	blt _021EA9AA
_021EAA06:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov101_021EA990

	thumb_func_start ov101_021EAA0C
ov101_021EAA0C: @ 0x021EAA0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	str r1, [sp, #0x1c]
	ldr r4, [r0, #8]
	movs r0, #0x46
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp, #0x30]
	ldr r0, [r0]
	str r2, [sp, #0x20]
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	ldr r0, [r0, #4]
	str r0, [sp, #0x28]
	adds r0, r5, #0
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_020263AC
	movs r0, #0x61
	lsls r0, r0, #2
	movs r7, #0
	adds r6, r5, r0
_021EAA40:
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0201D978
	adds r7, r7, #1
	adds r6, #0x10
	cmp r7, #3
	blo _021EAA40
	movs r0, #4
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021EAD88 @ =0x00010200
	adds r2, #0x85
	str r0, [sp, #8]
	adds r0, r5, r2
	ldr r2, [sp, #0x20]
	movs r1, #0
	lsls r2, r2, #2
	adds r2, r5, r2
	str r1, [sp, #0xc]
	adds r2, #0x9c
	ldr r2, [r2]
	movs r3, #2
	bl FUN_020200FC
	ldrb r0, [r5, #0xd]
	cmp r0, #0
	bne _021EAA9C
	ldr r1, [sp, #0x30]
	adds r0, r5, #0
	bl ov101_021EA6C4
	cmp r0, #0
	bne _021EAA92
	adds r0, r5, #0
	movs r1, #0
	movs r2, #2
	bl ov101_021EB38C
	b _021EAA9C
_021EAA92:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov101_021EB38C
_021EAA9C:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bne _021EAAA4
	b _021EAC2E
_021EAAA4:
	adds r2, r5, #0
	adds r2, #0xa4
	ldrh r0, [r0]
	ldr r1, [r5]
	ldr r2, [r2]
	bl ov101_021EB560
	ldrb r0, [r5, #0xd]
	cmp r0, #2
	bne _021EAABC
	movs r0, #1
	b _021EAABE
_021EAABC:
	movs r0, #0
_021EAABE:
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021EAD88 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r2, #0x95
	adds r0, r5, r2
	adds r2, r5, #0
	str r1, [sp, #0xc]
	adds r2, #0xa4
	ldr r2, [r2]
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _021EAB48
	movs r0, #0x61
	lsls r0, r0, #2
	movs r6, #0
	adds r4, r5, r0
_021EAAEA:
	adds r0, r4, #0
	bl FUN_0201D578
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #1
	bls _021EAAEA
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #8
	str r1, [sp]
	movs r1, #7
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r2, #0x17
	movs r3, #0xb
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #6
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	ldr r0, [r5, #0x10]
	movs r1, #5
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #6
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
_021EAB48:
	ldr r0, [sp, #0x2c]
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _021EAB56
	movs r1, #8
	subs r6, r0, #1
	b _021EAB5A
_021EAB56:
	movs r1, #0
	adds r6, r1, #0
_021EAB5A:
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r2, #8
	str r2, [sp]
	movs r2, #7
	str r2, [sp, #4]
	adds r2, r0, #0
	adds r2, #0xc
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r2, #0x17
	movs r3, #0xb
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #6
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #7
	str r1, [sp]
	adds r2, r0, #0
	str r1, [sp, #4]
	adds r2, #0xc
	str r2, [sp, #8]
	movs r2, #3
	ands r2, r6
	adds r3, r2, #0
	muls r3, r1, r3
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsrs r2, r6, #2
	adds r3, r2, #0
	muls r3, r1, r3
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	movs r3, #0xb
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r2, #0x18
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl FUN_020263AC
	ldr r1, [sp, #0x2c]
	adds r0, r5, #0
	adds r2, r5, #0
	adds r0, #0x88
	adds r2, #0x90
	ldrb r1, [r1, #6]
	ldr r0, [r0]
	ldr r2, [r2]
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021EAD88 @ =0x00010200
	adds r2, #0xa5
	str r0, [sp, #8]
	adds r0, r5, r2
	adds r2, r5, #0
	str r1, [sp, #0xc]
	adds r2, #0x90
	ldr r2, [r2]
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r1, [sp, #0x2c]
	adds r0, r5, #0
	ldrh r1, [r1]
	bl ov101_021EA990
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	bl FUN_02024830
	b _021EAC72
_021EAC2E:
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #8
	str r1, [sp]
	movs r1, #7
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r2, #0x17
	movs r3, #0xb
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #6
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
_021EAC72:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _021EAD2A
	movs r0, #0x6d
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x71
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r7, [sp, #0x28]
	movs r6, #0
	str r0, [sp, #0x34]
_021EAC9C:
	ldr r0, [sp, #0x28]
	adds r0, r0, r6
	str r0, [sp, #0x24]
	ldrb r0, [r0, #4]
	cmp r0, #0xf
	ldr r0, [r4, #0x20]
	beq _021EACBC
	movs r1, #1
	bl FUN_02024830
	ldr r1, [sp, #0x24]
	ldr r0, [r4, #0x20]
	ldrb r1, [r1, #4]
	bl FUN_020249D4
	b _021EACC2
_021EACBC:
	movs r1, #0
	bl FUN_02024830
_021EACC2:
	ldrh r2, [r7, #8]
	ldr r0, _021EAD8C @ =0x0000FFFF
	cmp r2, r0
	beq _021EAD1E
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200C528
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r5, #0
	adds r0, #0x8c
	adds r1, #0x90
	adds r2, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200CBBC
	adds r2, r5, #0
	lsrs r1, r6, #1
	movs r0, #0x15
	muls r0, r1, r0
	adds r0, r0, #2
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0xc1
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #1
	ands r0, r6
	adds r0, r0, #3
	lsls r1, r0, #4
	ldr r0, [sp, #0x34]
	adds r2, #0x90
	adds r0, r0, r1
	ldr r2, [r2]
	movs r1, #0
	movs r3, #4
	bl FUN_020200FC
_021EAD1E:
	adds r6, r6, #1
	adds r4, #0x28
	adds r7, r7, #2
	cmp r6, #4
	blo _021EAC9C
	b _021EAD4E
_021EAD2A:
	movs r0, #0x61
	lsls r0, r0, #2
	movs r6, #0
	adds r7, r5, r0
_021EAD32:
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_02024830
	adds r0, r6, #3
	lsls r0, r0, #4
	adds r0, r7, r0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #0x28
	cmp r6, #4
	blo _021EAD32
_021EAD4E:
	movs r0, #0x61
	lsls r0, r0, #2
	movs r6, #0
	adds r4, r5, r0
_021EAD56:
	adds r0, r4, #0
	bl FUN_0201D578
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #4
	bls _021EAD56
	ldr r0, [r5, #0x10]
	movs r1, #5
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #6
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #7
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EAD88: .4byte 0x00010200
_021EAD8C: .4byte 0x0000FFFF
	thumb_func_end ov101_021EAA0C

	thumb_func_start ov101_021EAD90
ov101_021EAD90: @ 0x021EAD90
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0x11
	adds r5, r0, #0
	lsls r1, r1, #4
	ldrh r0, [r5, r1]
	adds r1, r1, #2
	ldrsh r1, [r5, r1]
	subs r1, r1, #2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FUN_021E5C50
	adds r3, r0, #0
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	asrs r3, r2, #1
	movs r2, #1
	adds r0, r5, #0
	adds r1, r4, #0
	eors r2, r3
	bl ov101_021EAA0C
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021EAD90

	thumb_func_start ov101_021EADC0
ov101_021EADC0: @ 0x021EADC0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _021EAE50 @ =0x0000FFFF
	adds r6, r1, #0
	cmp r2, r0
	bne _021EADDE
	lsls r0, r6, #4
	adds r0, r5, r0
	ldr r0, [r0, #0x44]
	movs r1, #0
	bl FUN_020137C0
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021EADDE:
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200C528
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r5, #0
	adds r0, #0x8c
	adds r1, #0x90
	adds r2, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200CBBC
	movs r0, #0x81
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D9B0
	movs r1, #0
	adds r2, r5, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0xc1
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	movs r0, #0x81
	lsls r0, r0, #2
	str r1, [sp, #0xc]
	adds r2, #0x90
	ldr r2, [r2]
	adds r0, r5, r0
	adds r3, r1, #0
	bl FUN_020200FC
	adds r4, r5, #0
	movs r2, #0x81
	lsls r2, r2, #2
	adds r4, #0x44
	lsls r6, r6, #4
	ldr r0, [r4, r6]
	ldr r1, [r5, #0x40]
	ldr r3, [r5]
	adds r2, r5, r2
	bl FUN_020139D0
	ldr r0, [r4, r6]
	movs r1, #1
	bl FUN_020137C0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_021EAE50: .4byte 0x0000FFFF
	thumb_func_end ov101_021EADC0

	thumb_func_start ov101_021EAE54
ov101_021EAE54: @ 0x021EAE54
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r4, [r0, #8]
	movs r0, #0x46
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r5, [r0]
	ldr r0, [r0, #4]
	cmp r1, #0
	str r0, [sp, #0x10]
	beq _021EAEBE
	adds r0, r7, #0
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_020263AC
	movs r0, #0x7d
	lsls r0, r0, #2
	adds r0, r7, r0
	movs r1, #0
	bl FUN_0201D978
	adds r2, r7, #0
	adds r2, #0xa4
	ldrh r0, [r5]
	ldr r1, [r7]
	ldr r2, [r2]
	bl ov101_021EB560
	movs r0, #5
	str r0, [sp]
	movs r1, #0
	adds r2, r7, #0
	ldr r0, _021EAF38 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7d
	lsls r0, r0, #2
	str r1, [sp, #0xc]
	adds r2, #0xa4
	ldr r2, [r2]
	adds r0, r7, r0
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, [r7, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
_021EAEBE:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _021EAEEA
	movs r6, #0xd
	movs r5, #0
	lsls r6, r6, #6
_021EAECA:
	ldr r0, [r4, r6]
	movs r1, #0
	bl FUN_02024830
	lsls r1, r5, #0x18
	ldr r2, _021EAF3C @ =0x0000FFFF
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	bl ov101_021EADC0
	adds r5, r5, #1
	adds r4, #0x28
	cmp r5, #4
	blo _021EAECA
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_021EAEEA:
	movs r5, #0
	adds r6, r0, #0
_021EAEEE:
	ldr r0, [sp, #0x10]
	adds r0, r0, r5
	ldrb r1, [r0, #4]
	cmp r1, #0xf
	bne _021EAF06
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	b _021EAF1C
_021EAF06:
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_020249D4
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
_021EAF1C:
	ldrh r2, [r6, #8]
	lsls r1, r5, #0x18
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	bl ov101_021EADC0
	adds r5, r5, #1
	adds r4, #0x28
	adds r6, r6, #2
	cmp r5, #4
	blo _021EAEEE
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021EAF38: .4byte 0x00010200
_021EAF3C: .4byte 0x0000FFFF
	thumb_func_end ov101_021EAE54

	thumb_func_start ov101_021EAF40
ov101_021EAF40: @ 0x021EAF40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x2f
	str r1, [sp]
	movs r1, #0x14
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	movs r2, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	adds r3, r2, #0
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #3
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	movs r0, #0x4e
	lsls r0, r0, #2
	ldrb r1, [r5, r0]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1e
	beq _021EAF8E
	cmp r1, #1
	beq _021EAFC6
	b _021EAFFA
_021EAF8E:
	adds r0, #0x38
	ldr r0, [r5, r0]
	movs r1, #6
	str r1, [sp]
	movs r1, #0x14
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0x30
	str r1, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	movs r2, #0x16
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #3
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	b _021EAFFA
_021EAFC6:
	adds r0, #0x38
	ldr r0, [r5, r0]
	movs r1, #3
	str r1, [sp]
	movs r2, #0x14
	str r2, [sp, #4]
	adds r2, r0, #0
	adds r2, #0xc
	str r2, [sp, #8]
	movs r2, #0x36
	str r2, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	ldrh r2, [r0]
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r2, #0x1d
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
_021EAFFA:
	ldr r4, _021EB1D8 @ =0x021F79B4
	movs r7, #0
_021EAFFE:
	ldrh r0, [r4]
	cmp r0, #0x4b
	beq _021EB08E
	ldrb r0, [r4, #5]
	cmp r0, #0xff
	beq _021EB08E
	movs r0, #0x4e
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bhs _021EB024
	ldrb r0, [r4, #6]
	ldrb r1, [r4, #7]
	bl FUN_021E5C50
	cmp r0, #0
	beq _021EB08E
_021EB024:
	ldr r0, [r5, #0x10]
	ldrb r2, [r4, #4]
	ldr r0, [r0, #0x2c]
	movs r1, #2
	bl FUN_02066930
	cmp r0, #0
	bne _021EB08E
	ldrb r1, [r4, #0xb]
	movs r0, #0x17
	lsls r0, r0, #4
	lsls r1, r1, #0x1c
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x1c
	str r1, [sp]
	ldrb r1, [r4, #0xb]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	ldrb r1, [r4, #8]
	str r1, [sp, #0xc]
	ldrb r1, [r4, #9]
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #3
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldrb r6, [r4, #0xc]
	ldrb r2, [r4, #6]
	ldr r0, [r5, #0x10]
	lsls r3, r6, #0x1c
	lsrs r3, r3, #0x1c
	subs r2, r2, r3
	lsls r6, r6, #0x18
	lsls r2, r2, #0x18
	ldrb r3, [r4, #7]
	lsrs r6, r6, #0x1c
	ldr r0, [r0, #0x74]
	subs r3, r3, r6
	adds r3, r3, #2
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201C4EC
_021EB08E:
	adds r7, r7, #1
	adds r4, #0xe
	cmp r7, #0x1b
	blt _021EAFFE
	ldr r0, _021EB1DC @ =0x0000013D
	ldrb r1, [r5, r0]
	lsls r2, r1, #0x1e
	lsrs r2, r2, #0x1f
	beq _021EB0E0
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	bne _021EB158
	adds r0, #0x33
	ldr r0, [r5, r0]
	movs r1, #5
	str r1, [sp]
	movs r1, #6
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0x30
	str r1, [sp, #0xc]
	movs r1, #0x1b
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r2, #1
	movs r3, #9
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #3
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	b _021EB158
_021EB0E0:
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	beq _021EB120
	adds r0, #0x33
	ldr r0, [r5, r0]
	movs r1, #5
	str r1, [sp]
	movs r1, #6
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0x29
	str r1, [sp, #0xc]
	movs r1, #0x14
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r2, #1
	movs r3, #9
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #3
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	b _021EB158
_021EB120:
	adds r0, #0x33
	ldr r0, [r5, r0]
	movs r1, #5
	str r1, [sp]
	movs r1, #6
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0x29
	str r1, [sp, #0xc]
	movs r1, #0x1b
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r2, #1
	movs r3, #9
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #3
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
_021EB158:
	ldr r0, _021EB1DC @ =0x0000013D
	ldrb r1, [r5, r0]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	beq _021EB198
	adds r0, #0x33
	ldr r0, [r5, r0]
	movs r1, #3
	str r1, [sp]
	movs r2, #4
	str r2, [sp, #4]
	adds r2, r0, #0
	adds r2, #0xc
	str r2, [sp, #8]
	movs r2, #0x37
	str r2, [sp, #0xc]
	movs r2, #0x14
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	movs r3, #1
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r2, #0x13
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
_021EB198:
	ldr r0, _021EB1DC @ =0x0000013D
	ldrb r1, [r5, r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1f
	beq _021EB1D4
	adds r0, #0x33
	ldr r0, [r5, r0]
	movs r1, #3
	str r1, [sp]
	adds r2, r0, #0
	str r1, [sp, #4]
	adds r2, #0xc
	str r2, [sp, #8]
	movs r2, #0x37
	str r2, [sp, #0xc]
	movs r2, #0x18
	str r2, [sp, #0x10]
	ldrh r3, [r0]
	lsls r3, r3, #0x15
	lsrs r3, r3, #0x18
	str r3, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r3, #0xf
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
_021EB1D4:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021EB1D8: .4byte 0x021F79B4
_021EB1DC: .4byte 0x0000013D
	thumb_func_end ov101_021EAF40

	thumb_func_start ov101_021EB1E0
ov101_021EB1E0: @ 0x021EB1E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldrb r0, [r5, #0xd]
	cmp r0, #1
	beq _021EB2CA
	cmp r1, #0
	beq _021EB1FA
	movs r1, #0x46
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _021EB218
_021EB1FA:
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201CAE0
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, _021EB2D0 @ =0x00000152
	movs r1, #0
	add sp, #0x20
	strh r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_021EB218:
	ldrh r2, [r0]
	adds r0, r1, #0
	adds r0, #0x3a
	ldrh r0, [r5, r0]
	cmp r2, r0
	beq _021EB2CA
	adds r1, #0x3a
	strh r2, [r5, r1]
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201CAE0
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r0, _021EB2D4 @ =0x00000136
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _021EB2C0
	ldr r4, [sp, #0x1c]
_021EB240:
	movs r0, #0x85
	lsls r0, r0, #2
	ldr r2, [r5, r0]
	subs r0, #0xfc
	ldr r0, [r5, r0]
	ldrh r1, [r0]
	ldrh r0, [r2, r4]
	cmp r1, r0
	bne _021EB2AE
	adds r0, r2, r4
	ldrb r3, [r0, #0xe]
	ldrb r1, [r0, #0xf]
	adds r2, r3, #0
	muls r2, r1, r2
	cmp r2, #9
	ldrb r2, [r0, #2]
	blt _021EB272
	ldrb r6, [r0, #3]
	subs r2, r2, #1
	lsls r2, r2, #0x10
	subs r6, r6, #1
	lsls r6, r6, #0x10
	lsrs r2, r2, #0x10
	lsrs r7, r6, #0x10
	b _021EB274
_021EB272:
	ldrb r7, [r0, #3]
_021EB274:
	movs r6, #0x17
	lsls r6, r6, #4
	ldr r6, [r5, r6]
	lsls r2, r2, #0x18
	str r3, [sp]
	str r1, [sp, #4]
	adds r1, r6, #0
	adds r1, #0xc
	str r1, [sp, #8]
	ldrb r1, [r0, #0xc]
	lsls r3, r7, #0x18
	lsrs r2, r2, #0x18
	str r1, [sp, #0xc]
	ldrb r0, [r0, #0xd]
	movs r1, #2
	lsrs r3, r3, #0x18
	str r0, [sp, #0x10]
	ldrh r0, [r6]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r6, #2]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
_021EB2AE:
	ldr r0, [sp, #0x1c]
	adds r4, #0x10
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	ldr r0, _021EB2D4 @ =0x00000136
	ldrb r1, [r5, r0]
	ldr r0, [sp, #0x1c]
	cmp r0, r1
	blt _021EB240
_021EB2C0:
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
_021EB2CA:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EB2D0: .4byte 0x00000152
_021EB2D4: .4byte 0x00000136
	thumb_func_end ov101_021EB1E0

	thumb_func_start ov101_021EB2D8
ov101_021EB2D8: @ 0x021EB2D8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #0
	ldr r0, [r0, #8]
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_02024830
	ldr r1, _021EB2F8 @ =0x00000139
	movs r0, #8
	ldrb r2, [r4, r1]
	bics r2, r0
	strb r2, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_021EB2F8: .4byte 0x00000139
	thumb_func_end ov101_021EB2D8

	thumb_func_start ov101_021EB2FC
ov101_021EB2FC: @ 0x021EB2FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	adds r2, r1, #0
	bl FUN_021E7128
	adds r0, r4, #0
	bl ov101_021E94C0
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #1
	ldr r0, [r0, #8]
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #1
	bl ov101_021EB1E0
	movs r0, #2
	movs r1, #1
	bl FUN_0201BC28
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EB2FC

	thumb_func_start ov101_021EB338
ov101_021EB338: @ 0x021EB338
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021E94C0
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #1
	ldr r0, [r0, #8]
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_02024830
	ldr r1, _021EB360 @ =0x00000139
	movs r0, #8
	ldrb r2, [r4, r1]
	bics r2, r0
	strb r2, [r4, r1]
	pop {r4, pc}
	nop
_021EB360: .4byte 0x00000139
	thumb_func_end ov101_021EB338

	thumb_func_start ov101_021EB364
ov101_021EB364: @ 0x021EB364
	ldr r0, [r0, #0x10]
	ldr r3, _021EB370 @ =FUN_021E7128
	ldr r0, [r0, #0x7c]
	ldr r1, _021EB374 @ =0x0000FFFF
	movs r2, #0
	bx r3
	.align 2, 0
_021EB370: .4byte FUN_021E7128
_021EB374: .4byte 0x0000FFFF
	thumb_func_end ov101_021EB364

	thumb_func_start ov101_021EB378
ov101_021EB378: @ 0x021EB378
	ldr r0, [r0, #0x10]
	ldr r3, _021EB384 @ =FUN_021E7128
	ldr r0, [r0, #0x7c]
	ldr r1, _021EB388 @ =0x0000FFFF
	movs r2, #1
	bx r3
	.align 2, 0
_021EB384: .4byte FUN_021E7128
_021EB388: .4byte 0x0000FFFF
	thumb_func_end ov101_021EB378

	thumb_func_start ov101_021EB38C
ov101_021EB38C: @ 0x021EB38C
	push {r3, r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	cmp r1, #0
	bne _021EB3D8
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r3, #6
	str r3, [sp]
	movs r1, #7
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	adds r1, r2, #0
	muls r1, r3, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	movs r1, #0x15
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r2, #0x1a
	movs r3, #2
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #1
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	b _021EB41A
_021EB3D8:
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r3, #6
	str r3, [sp]
	movs r1, #9
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	adds r1, r2, #0
	muls r1, r3, r1
	adds r1, #0x12
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	movs r1, #0x15
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r2, #0x1a
	movs r3, #0xb
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #1
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
_021EB41A:
	ldr r0, [r4, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end ov101_021EB38C

	thumb_func_start ov101_021EB428
ov101_021EB428: @ 0x021EB428
	push {r4, r5, lr}
	sub sp, #0x24
	adds r5, r0, #0
	adds r4, r1, #0
	add r0, sp, #0xc
	movs r1, #0
	movs r2, #0x18
	blx FUN_020D4994
	ldr r0, _021EB4C0 @ =0x021F7E80
	add r2, sp, #0xc
	ldrh r3, [r0]
	add r1, sp, #0xc
	strh r3, [r2]
	ldrh r3, [r0, #2]
	strh r3, [r2, #2]
	ldrh r3, [r0, #4]
	strh r3, [r2, #4]
	ldrh r3, [r0, #6]
	strh r3, [r2, #6]
	ldrh r3, [r0, #8]
	ldrh r0, [r0, #0xa]
	strh r3, [r2, #8]
	strh r0, [r2, #0xa]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	str r0, [sp, #0x1c]
	movs r0, #2
	strb r0, [r2, #0x14]
	cmp r4, #8
	blo _021EB472
	cmp r4, #0xf
	bls _021EB49A
_021EB472:
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [r5, #0x10]
	adds r0, r5, #0
	ldr r2, [r2, #0xc]
	adds r0, #0xbc
	lsls r2, r2, #0x18
	ldr r0, [r0]
	add r1, sp, #0xc
	lsrs r2, r2, #0x18
	movs r3, #0xb
	bl FUN_020185FC
	adds r5, #0xc4
	add sp, #0x24
	str r0, [r5]
	pop {r4, r5, pc}
_021EB49A:
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [r5, #0x10]
	adds r0, r5, #0
	ldr r2, [r2, #0xc]
	adds r0, #0xbc
	lsls r2, r2, #0x18
	ldr r0, [r0]
	lsrs r2, r2, #0x18
	movs r3, #3
	bl FUN_020185FC
	adds r5, #0xc4
	str r0, [r5]
	add sp, #0x24
	pop {r4, r5, pc}
	.align 2, 0
_021EB4C0: .4byte 0x021F7E80
	thumb_func_end ov101_021EB428

	thumb_func_start ov101_021EB4C4
ov101_021EB4C4: @ 0x021EB4C4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x7d
	lsls r0, r0, #2
	adds r4, r1, #0
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	cmp r4, #0
	bge _021EB4FC
	movs r1, #0
	str r1, [sp]
	ldr r0, _021EB55C @ =0x00030200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7d
	lsls r0, r0, #2
	adds r0, r5, r0
	str r1, [sp, #0xc]
	adds r5, #0xa8
	ldr r2, [r5]
	movs r3, #8
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021EB4FC:
	adds r2, r5, #0
	adds r2, #0xa4
	lsls r0, r4, #0x10
	ldr r1, [r5]
	ldr r2, [r2]
	lsrs r0, r0, #0x10
	bl ov101_021EB560
	movs r1, #0
	adds r2, r5, #0
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x8c
	adds r2, #0xa4
	ldr r0, [r0]
	ldr r2, [r2]
	adds r3, r1, #0
	bl FUN_0200BE3C
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r5, #0
	adds r0, #0x8c
	adds r1, #0x90
	adds r2, #0xac
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	ldr r0, _021EB55C @ =0x00030200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7d
	lsls r0, r0, #2
	adds r0, r5, r0
	str r1, [sp, #0xc]
	adds r5, #0x90
	ldr r2, [r5]
	movs r3, #8
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EB55C: .4byte 0x00030200
	thumb_func_end ov101_021EB4C4

	thumb_func_start ov101_021EB560
ov101_021EB560: @ 0x021EB560
	ldr r3, _021EB564 @ =FUN_02068F98
	bx r3
	.align 2, 0
_021EB564: .4byte FUN_02068F98
	thumb_func_end ov101_021EB560

	thumb_func_start ov101_021EB568
ov101_021EB568: @ 0x021EB568
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021EB5D4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _021EB5B6
	ldr r0, _021EB5D8 @ =0x00000139
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	bne _021EB5B6
	ldr r0, [r4, #0x10]
	movs r2, #1
	strb r2, [r0, #6]
	ldr r0, [r4, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E7128
	ldr r0, [r4, #0x10]
	bl FUN_021E5DC8
	adds r2, r0, #0
	ldr r0, [r4, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E72F8
	adds r0, r4, #0
	bl ov101_021EB2D8
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
_021EB5B6:
	adds r0, r4, #0
	bl ov101_021EB818
	cmp r0, #7
	beq _021EB5D0
	adds r0, r4, #0
	bl ov101_021EC304
	adds r0, r4, #0
	bl ov101_021EC778
	movs r0, #0
	mvns r0, r0
_021EB5D0:
	pop {r4, pc}
	nop
_021EB5D4: .4byte 0x021D110C
_021EB5D8: .4byte 0x00000139
	thumb_func_end ov101_021EB568

	thumb_func_start ov101_021EB5DC
ov101_021EB5DC: @ 0x021EB5DC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r1, _021EB650 @ =0x00000139
	movs r0, #0
	ldrb r1, [r5, r1]
	mvns r0, r0
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1f
	bne _021EB5F6
	ldr r0, [r5, #0x10]
	bl FUN_021E5924
_021EB5F6:
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021EB604
	movs r1, #1
	str r1, [r4]
	pop {r4, r5, r6, pc}
_021EB604:
	ldr r0, _021EB650 @ =0x00000139
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	bne _021EB640
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021EBA44
	adds r6, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021EB630
	ldr r1, [r5, #0x10]
	ldrb r0, [r1, #6]
	cmp r0, #1
	bne _021EB630
	movs r0, #0
	strb r0, [r1, #6]
	adds r0, r5, #0
	bl ov101_021EB2FC
_021EB630:
	cmp r6, #7
	bne _021EB638
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_021EB638:
	adds r0, r5, #0
	bl ov101_021EC778
	b _021EB64C
_021EB640:
	movs r0, #1
	str r0, [r4]
	adds r0, r5, #0
	bl ov101_021EC0AC
	adds r6, r0, #0
_021EB64C:
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021EB650: .4byte 0x00000139
	thumb_func_end ov101_021EB5DC

	thumb_func_start ov101_021EB654
ov101_021EB654: @ 0x021EB654
	push {r3, r4, r5, r6}
	adds r2, r0, #0
	ldr r0, _021EB778 @ =0x021D110C
	movs r4, #0
	ldr r5, [r0, #0x44]
	adds r0, r2, #0
	adds r0, #0x84
	ldr r0, [r0]
	adds r3, r5, #0
	ldr r1, [r0, #8]
	movs r0, #0x40
	adds r1, #0xc8
	tst r3, r0
	beq _021EB6A0
	adds r6, r0, #0
	adds r3, r0, #0
	adds r6, #0xc4
	adds r3, #0xd2
	ldrh r6, [r2, r6]
	ldrsh r3, [r2, r3]
	adds r6, r6, #1
	cmp r3, r6
	ble _021EB6D6
	adds r3, r0, #0
	adds r3, #0xd2
	ldrsh r3, [r2, r3]
	subs r4, r3, #1
	adds r3, r0, #0
	adds r3, #0xd2
	strh r4, [r2, r3]
	adds r3, r0, #0
	adds r3, #0xfb
	ldrb r3, [r2, r3]
	movs r4, #1
	adds r0, #0xfb
	orrs r3, r4
	strb r3, [r2, r0]
	b _021EB6D6
_021EB6A0:
	movs r0, #0x80
	adds r3, r5, #0
	tst r3, r0
	beq _021EB6D6
	adds r3, r0, #0
	adds r3, #0x92
	ldrsh r6, [r2, r3]
	adds r3, r0, #0
	adds r3, #0x86
	ldrh r3, [r2, r3]
	cmp r6, r3
	bge _021EB6D6
	adds r3, r0, #0
	adds r3, #0x92
	ldrsh r3, [r2, r3]
	adds r4, r3, #1
	adds r3, r0, #0
	adds r3, #0x92
	strh r4, [r2, r3]
	adds r3, r0, #0
	adds r3, #0xbb
	ldrb r4, [r2, r3]
	movs r3, #2
	adds r0, #0xbb
	orrs r3, r4
	strb r3, [r2, r0]
	movs r4, #1
_021EB6D6:
	movs r0, #0x20
	adds r3, r5, #0
	tst r3, r0
	beq _021EB70A
	adds r3, r0, #0
	adds r3, #0xf0
	ldrsh r5, [r2, r3]
	adds r3, r0, #0
	adds r3, #0xe0
	ldrh r3, [r2, r3]
	adds r3, r3, #1
	cmp r5, r3
	ble _021EB73A
	adds r3, r0, #0
	adds r3, #0xf0
	ldrsh r3, [r2, r3]
	adds r0, #0xf0
	subs r3, r3, #1
	strh r3, [r2, r0]
	ldr r3, _021EB77C @ =0x0000013B
	movs r0, #4
	ldrb r4, [r2, r3]
	orrs r0, r4
	strb r0, [r2, r3]
	movs r4, #1
	b _021EB73A
_021EB70A:
	movs r6, #0x10
	adds r3, r5, #0
	tst r3, r6
	beq _021EB73A
	adds r3, r0, #0
	adds r3, #0xf0
	adds r6, #0xf2
	ldrsh r5, [r2, r3]
	ldrh r3, [r2, r6]
	subs r3, r3, #1
	cmp r5, r3
	bge _021EB73A
	adds r3, r0, #0
	adds r3, #0xf0
	ldrsh r3, [r2, r3]
	adds r0, #0xf0
	adds r3, r3, #1
	strh r3, [r2, r0]
	ldr r3, _021EB77C @ =0x0000013B
	movs r0, #8
	ldrb r4, [r2, r3]
	orrs r0, r4
	strb r0, [r2, r3]
	movs r4, #1
_021EB73A:
	cmp r4, #0
	beq _021EB772
	ldr r3, _021EB780 @ =0x0000013A
	movs r0, #2
	strb r0, [r2, r3]
	subs r0, r3, #1
	ldrb r4, [r2, r0]
	movs r0, #1
	bics r4, r0
	adds r5, r4, #0
	movs r0, #1
	orrs r5, r0
	subs r4, r3, #1
	strb r5, [r2, r4]
	ldrb r5, [r2, r4]
	movs r4, #4
	orrs r5, r4
	subs r4, r3, #1
	strb r5, [r2, r4]
	adds r4, r3, #0
	ldrh r5, [r1, #4]
	subs r4, #0x26
	subs r3, #0x24
	strh r5, [r2, r4]
	ldrh r1, [r1, #6]
	strh r1, [r2, r3]
	pop {r3, r4, r5, r6}
	bx lr
_021EB772:
	movs r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
_021EB778: .4byte 0x021D110C
_021EB77C: .4byte 0x0000013B
_021EB780: .4byte 0x0000013A
	thumb_func_end ov101_021EB654

	thumb_func_start ov101_021EB784
ov101_021EB784: @ 0x021EB784
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	cmp r1, #0
	bge _021EB796
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r4, pc}
_021EB796:
	ldr r2, [r4, #0x10]
	movs r3, #5
	str r3, [r2, #0x1c]
	ldr r2, [r4, #0x10]
	ldr r2, [r2, #0x20]
	strh r1, [r2, #0x20]
	movs r1, #0x11
	lsls r1, r1, #4
	ldr r2, [r4, #0x10]
	ldrsh r3, [r4, r1]
	ldr r2, [r2, #0x20]
	adds r1, r1, #2
	str r3, [r2, #0x18]
	ldrsh r1, [r4, r1]
	subs r2, r1, #2
	ldr r1, [r4, #0x10]
	ldr r1, [r1, #0x20]
	str r2, [r1, #0x1c]
	ldr r1, [r4, #0x10]
	ldr r1, [r1, #0xc]
	cmp r1, #1
	bne _021EB7DA
	add r1, sp, #4
	str r1, [sp]
	ldr r3, _021EB814 @ =0x021D114C
	movs r1, #0x20
	movs r2, #0x22
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r3, sp, #4
	adds r3, #2
	bl ov101_021E9464
	b _021EB7F6
_021EB7DA:
	adds r1, r4, #0
	adds r1, #0x84
	ldr r1, [r1]
	movs r2, #0xce
	ldr r3, [r1, #8]
	add r1, sp, #4
	str r1, [sp]
	movs r1, #0xcc
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r3, sp, #4
	adds r3, #2
	bl ov101_021E9464
_021EB7F6:
	movs r1, #0x46
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	ldrh r1, [r1]
	bl ov101_021EB4C4
	add r1, sp, #4
	ldrh r1, [r1, #2]
	adds r0, r4, #0
	bl ov101_021EB428
	movs r0, #8
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_021EB814: .4byte 0x021D114C
	thumb_func_end ov101_021EB784

	thumb_func_start ov101_021EB818
ov101_021EB818: @ 0x021EB818
	push {r3, r4, r5, lr}
	ldr r2, _021EB938 @ =0x021D110C
	adds r4, r0, #0
	ldr r1, [r2, #0x48]
	ldr r2, [r2, #0x44]
	cmp r2, #0
	beq _021EB83C
	ldr r2, _021EB93C @ =0x00000139
	ldrb r5, [r4, r2]
	lsls r3, r5, #0x1f
	lsrs r3, r3, #0x1f
	bne _021EB83C
	lsls r3, r5, #0x1e
	lsrs r3, r3, #0x1f
	bne _021EB83C
	lsls r3, r5, #0x1d
	lsrs r3, r3, #0x1f
	beq _021EB842
_021EB83C:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EB842:
	movs r3, #1
	lsls r3, r3, #0xa
	adds r5, r1, #0
	tst r5, r3
	beq _021EB8D0
	subs r1, r2, #1
	ldrb r5, [r4, r1]
	movs r3, #1
	adds r1, r5, #0
	bics r1, r3
	lsls r3, r5, #0x1f
	lsrs r3, r3, #0x1f
	movs r5, #1
	eors r3, r5
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ands r3, r5
	orrs r3, r1
	subs r1, r2, #1
	strb r3, [r4, r1]
	movs r3, #4
	adds r1, r2, #1
	strb r3, [r4, r1]
	adds r1, r4, #0
	adds r1, #0xdc
	str r1, [sp]
	adds r1, r2, #0
	subs r1, #0x29
	subs r2, #0x27
	adds r3, r4, #0
	ldrh r1, [r4, r1]
	ldrh r2, [r4, r2]
	adds r3, #0xd8
	bl ov101_021EC49C
	ldr r2, _021EB93C @ =0x00000139
	movs r0, #1
	ldrb r3, [r4, r2]
	adds r1, r5, #0
	bics r3, r0
	adds r0, r3, #0
	orrs r0, r1
	strb r0, [r4, r2]
	ldrb r3, [r4, r2]
	movs r0, #2
	orrs r0, r3
	strb r0, [r4, r2]
	subs r2, r2, #1
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	lsls r2, r2, #0x1f
	lsrs r2, r2, #0x1f
	bl ov101_021EB38C
	movs r0, #0x4e
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _021EB8C4
	ldr r0, _021EB940 @ =0x00000943
	bl FUN_0200604C
	b _021EB8CA
_021EB8C4:
	ldr r0, _021EB944 @ =0x00000949
	bl FUN_0200604C
_021EB8CA:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EB8D0:
	lsls r3, r3, #1
	tst r1, r3
	beq _021EB8FC
	subs r2, #0x21
	adds r1, r4, r2
	bl ov101_021EA6C4
	cmp r0, #0
	bne _021EB8E8
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EB8E8:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl ov101_021EB38C
	ldr r0, _021EB948 @ =0x00000941
	bl FUN_0200604C
	movs r0, #7
	pop {r3, r4, r5, pc}
_021EB8FC:
	bl ov101_021EB654
	cmp r0, #0
	beq _021EB932
	movs r3, #0x46
	lsls r3, r3, #2
	adds r2, r3, #0
	adds r1, r4, r3
	subs r2, #8
	subs r3, r3, #6
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	adds r0, r4, #0
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021EA794
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021EAD90
	adds r0, r4, #0
	movs r1, #1
	bl ov101_021EB1E0
_021EB932:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EB938: .4byte 0x021D110C
_021EB93C: .4byte 0x00000139
_021EB940: .4byte 0x00000943
_021EB944: .4byte 0x00000949
_021EB948: .4byte 0x00000941
	thumb_func_end ov101_021EB818

	thumb_func_start ov101_021EB94C
ov101_021EB94C: @ 0x021EB94C
	push {r3, r4, r5, lr}
	ldr r2, _021EBA38 @ =0x021D110C
	adds r4, r0, #0
	ldr r1, [r2, #0x48]
	ldr r2, [r2, #0x44]
	cmp r2, #0
	beq _021EB96A
	ldr r3, _021EBA3C @ =0x00000139
	ldrb r2, [r4, r3]
	lsls r5, r2, #0x1f
	lsrs r5, r5, #0x1f
	bne _021EB96A
	lsls r2, r2, #0x1d
	lsrs r2, r2, #0x1f
	beq _021EB970
_021EB96A:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EB970:
	movs r2, #1
	tst r2, r1
	beq _021EB9AC
	ldrb r2, [r4, #0xd]
	cmp r2, #1
	bne _021EB9AC
	adds r1, r3, #0
	subs r3, #0x27
	ldrsh r2, [r4, r3]
	subs r1, #0x29
	ldrh r1, [r4, r1]
	subs r2, r2, #2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl ov101_021EA874
	adds r5, r0, #0
	cmp r5, #0
	ble _021EB9A6
	ldr r0, _021EBA40 @ =0x00000941
	bl FUN_0200604C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov101_021EB784
	pop {r3, r4, r5, pc}
_021EB9A6:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EB9AC:
	movs r0, #2
	tst r0, r1
	beq _021EB9BE
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #4
	pop {r3, r4, r5, pc}
_021EB9BE:
	adds r0, r4, #0
	bl ov101_021EB654
	cmp r0, #0
	bne _021EB9CE
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EB9CE:
	ldrb r0, [r4, #0xd]
	cmp r0, #2
	bne _021EBA04
	movs r3, #0x46
	lsls r3, r3, #2
	adds r2, r3, #0
	adds r1, r4, r3
	subs r2, #8
	subs r3, r3, #6
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	adds r0, r4, #0
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021EA794
	adds r0, r4, #0
	movs r1, #1
	bl ov101_021EAD90
	adds r0, r4, #0
	movs r1, #1
	bl ov101_021EB1E0
	b _021EBA32
_021EBA04:
	movs r3, #0x46
	lsls r3, r3, #2
	adds r2, r3, #0
	adds r1, r4, r3
	subs r2, #8
	subs r3, r3, #6
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	adds r0, r4, #0
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021EA8A8
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021EAD90
	adds r0, r4, #0
	movs r1, #1
	bl ov101_021EB1E0
_021EBA32:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EBA38: .4byte 0x021D110C
_021EBA3C: .4byte 0x00000139
_021EBA40: .4byte 0x00000941
	thumb_func_end ov101_021EB94C

	thumb_func_start ov101_021EBA44
ov101_021EBA44: @ 0x021EBA44
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0202534C
	cmp r0, #0
	bne _021EBA5C
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021EBA5C:
	ldr r0, _021EBBF8 @ =0x00000139
	ldrb r0, [r5, r0]
	lsls r1, r0, #0x1f
	lsrs r1, r1, #0x1f
	bne _021EBA6C
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _021EBA74
_021EBA6C:
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021EBA74:
	ldr r0, _021EBBFC @ =0x021F7EAC
	bl FUN_02025224
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _021EBB48
	movs r0, #1
	str r0, [r4]
	adds r0, r5, #0
	bl ov101_021E94C0
	cmp r6, #0
	bne _021EBAC0
	movs r1, #0x46
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r1, r5, r1
	bl ov101_021EA6C4
	cmp r0, #0
	bne _021EBAAA
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021EBAAA:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	bl ov101_021EB38C
	ldr r0, _021EBC00 @ =0x00000941
	bl FUN_0200604C
	add sp, #8
	movs r0, #7
	pop {r4, r5, r6, pc}
_021EBAC0:
	movs r2, #0x4e
	lsls r2, r2, #2
	ldrb r3, [r5, r2]
	movs r1, #1
	adds r0, r3, #0
	bics r0, r1
	lsls r1, r3, #0x1f
	lsrs r1, r1, #0x1f
	movs r3, #1
	eors r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ands r1, r3
	orrs r0, r1
	strb r0, [r5, r2]
	movs r1, #4
	adds r0, r2, #2
	strb r1, [r5, r0]
	adds r1, r2, #0
	adds r0, r5, #0
	adds r0, #0xdc
	str r0, [sp]
	subs r1, #0x28
	subs r2, #0x26
	adds r3, r5, #0
	ldrh r1, [r5, r1]
	ldrh r2, [r5, r2]
	adds r0, r5, #0
	adds r3, #0xd8
	bl ov101_021EC49C
	ldr r2, _021EBBF8 @ =0x00000139
	movs r0, #1
	ldrb r3, [r5, r2]
	movs r1, #1
	bics r3, r0
	adds r0, r3, #0
	orrs r0, r1
	strb r0, [r5, r2]
	ldrb r3, [r5, r2]
	movs r0, #2
	orrs r0, r3
	strb r0, [r5, r2]
	subs r2, r2, #1
	ldrb r2, [r5, r2]
	adds r0, r5, #0
	lsls r2, r2, #0x1f
	lsrs r2, r2, #0x1f
	bl ov101_021EB38C
	movs r0, #0x4e
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _021EBB3A
	ldr r0, _021EBC04 @ =0x00000943
	bl FUN_0200604C
	b _021EBB40
_021EBB3A:
	ldr r0, _021EBC08 @ =0x00000949
	bl FUN_0200604C
_021EBB40:
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021EBB48:
	ldr r0, _021EBC0C @ =0x021F7EA4
	bl FUN_02025320
	cmp r0, #0
	bne _021EBB5A
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021EBB5A:
	movs r1, #1
	add r0, sp, #4
	strh r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r3, _021EBC10 @ =0x021D114C
	ldr r0, [r5, #0x10]
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	ldr r0, [r0, #0x74]
	bl FUN_0201F2CC
	cmp r0, #0
	bne _021EBB7E
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021EBB7E:
	ldr r0, _021EBC14 @ =0x00000945
	bl FUN_0200604C
	movs r2, #0x11
	lsls r2, r2, #4
	adds r1, r5, r2
	adds r2, r2, #2
	adds r0, r5, #0
	adds r2, r5, r2
	bl ov101_021EC980
	movs r3, #0x46
	lsls r3, r3, #2
	adds r2, r3, #0
	adds r1, r5, r3
	subs r2, #8
	subs r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	adds r0, r5, #0
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021EA794
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021EAD90
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021EB1E0
	ldr r2, _021EBC10 @ =0x021D114C
	ldr r0, _021EBC18 @ =0x00000142
	ldrh r1, [r2, #0x20]
	strh r1, [r5, r0]
	ldrsh r3, [r5, r0]
	adds r1, r0, #4
	strh r3, [r5, r1]
	adds r1, r0, #2
	ldrh r2, [r2, #0x22]
	adds r0, r0, #6
	strh r2, [r5, r1]
	ldrsh r1, [r5, r1]
	strh r1, [r5, r0]
	adds r0, r5, #0
	bl ov101_021EBDEC
	ldr r1, _021EBBF8 @ =0x00000139
	movs r0, #8
	ldrb r2, [r5, r1]
	orrs r0, r2
	strb r0, [r5, r1]
	movs r0, #1
	str r0, [r4]
	subs r0, r0, #2
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021EBBF8: .4byte 0x00000139
_021EBBFC: .4byte 0x021F7EAC
_021EBC00: .4byte 0x00000941
_021EBC04: .4byte 0x00000943
_021EBC08: .4byte 0x00000949
_021EBC0C: .4byte 0x021F7EA4
_021EBC10: .4byte 0x021D114C
_021EBC14: .4byte 0x00000945
_021EBC18: .4byte 0x00000142
	thumb_func_end ov101_021EBA44

	thumb_func_start ov101_021EBC1C
ov101_021EBC1C: @ 0x021EBC1C
	push {r3, r4, r5, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0202534C
	cmp r0, #0
	bne _021EBC34
	movs r0, #0
	add sp, #0x20
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EBC34:
	ldr r0, _021EBDD0 @ =0x00000139
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021EBC46
	movs r0, #0
	add sp, #0x20
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EBC46:
	ldr r0, _021EBDD4 @ =0x021F7E94
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021EBCAE
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #8
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r2, #0x18
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	movs r3, #0x14
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #1
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl ov101_021E94C0
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #1
	str r0, [r4]
	add sp, #0x20
	movs r0, #4
	pop {r3, r4, r5, pc}
_021EBCAE:
	ldr r0, _021EBDD8 @ =0x021F7EA8
	bl FUN_02025320
	cmp r0, #0
	bne _021EBCC0
	movs r0, #0
	add sp, #0x20
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EBCC0:
	movs r1, #1
	add r0, sp, #0x1c
	strh r1, [r0]
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r3, _021EBDDC @ =0x021D114C
	ldr r0, [r5, #0x10]
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	ldr r0, [r0, #0x74]
	bl FUN_0201F2CC
	cmp r0, #0
	bne _021EBCE4
	movs r0, #0
	add sp, #0x20
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EBCE4:
	ldr r0, _021EBDE0 @ =0x00000945
	bl FUN_0200604C
	movs r0, #1
	str r0, [r4]
	ldrb r0, [r5, #0xd]
	cmp r0, #2
	bne _021EBD34
	movs r2, #0x11
	lsls r2, r2, #4
	adds r1, r5, r2
	adds r2, r2, #2
	adds r0, r5, #0
	adds r2, r5, r2
	bl ov101_021EC980
	movs r3, #0x46
	lsls r3, r3, #2
	adds r2, r3, #0
	adds r1, r5, r3
	subs r2, #8
	subs r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	adds r0, r5, #0
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021EA794
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021EAD90
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021EB1E0
	b _021EBDA0
_021EBD34:
	movs r2, #0x11
	lsls r2, r2, #4
	adds r1, r5, r2
	adds r2, r2, #2
	adds r0, r5, #0
	adds r2, r5, r2
	bl ov101_021EC980
	movs r3, #0x46
	lsls r3, r3, #2
	adds r2, r3, #0
	adds r1, r5, r3
	subs r2, #8
	subs r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	adds r0, r5, #0
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021EA8A8
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021EAD90
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021EB1E0
	movs r2, #0x11
	lsls r2, r2, #4
	ldrh r1, [r5, r2]
	adds r2, r2, #2
	ldrsh r2, [r5, r2]
	adds r0, r5, #0
	subs r2, r2, #2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl ov101_021EA874
	adds r4, r0, #0
	cmp r4, #0
	ble _021EBDA0
	ldr r0, _021EBDE4 @ =0x00000941
	bl FUN_0200604C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021EB784
	add sp, #0x20
	pop {r3, r4, r5, pc}
_021EBDA0:
	ldr r2, _021EBDDC @ =0x021D114C
	ldr r0, _021EBDE8 @ =0x00000142
	ldrh r1, [r2, #0x20]
	strh r1, [r5, r0]
	ldrsh r3, [r5, r0]
	adds r1, r0, #4
	strh r3, [r5, r1]
	ldrh r2, [r2, #0x22]
	adds r1, r0, #2
	adds r0, r0, #6
	strh r2, [r5, r1]
	ldrsh r1, [r5, r1]
	strh r1, [r5, r0]
	adds r0, r5, #0
	bl ov101_021EBDEC
	ldr r1, _021EBDD0 @ =0x00000139
	movs r0, #8
	ldrb r2, [r5, r1]
	orrs r2, r0
	strb r2, [r5, r1]
	subs r0, #9
	add sp, #0x20
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EBDD0: .4byte 0x00000139
_021EBDD4: .4byte 0x021F7E94
_021EBDD8: .4byte 0x021F7EA8
_021EBDDC: .4byte 0x021D114C
_021EBDE0: .4byte 0x00000945
_021EBDE4: .4byte 0x00000941
_021EBDE8: .4byte 0x00000142
	thumb_func_end ov101_021EBC1C

	thumb_func_start ov101_021EBDEC
ov101_021EBDEC: @ 0x021EBDEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	movs r0, #0x4e
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x1f
	lsrs r1, r0, #0x1f
	beq _021EBE08
	movs r0, #0xc
	str r0, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #8]
	b _021EBE10
_021EBE08:
	movs r0, #0x18
	str r0, [sp, #0xc]
	movs r0, #0x11
	str r0, [sp, #8]
_021EBE10:
	adds r0, r1, #1
	lsls r0, r0, #0x1b
	lsrs r5, r0, #0x18
	ldr r0, _021EBF28 @ =0x021D114C
	ldrh r1, [r0, #0x20]
	ldr r0, _021EBF2C @ =0x00000132
	ldrb r0, [r4, r0]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	lsls r0, r5, #0x17
	lsrs r6, r0, #0x18
	ldr r0, [sp]
	adds r1, r5, #0
	blx FUN_020F2998
	subs r0, r1, r6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, _021EBF28 @ =0x021D114C
	ldrh r1, [r0, #0x22]
	ldr r0, _021EBF30 @ =0x00000131
	ldrb r0, [r4, r0]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	adds r0, r7, #0
	adds r1, r5, #0
	blx FUN_020F2998
	subs r0, r1, r6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r7, #0
	adds r1, r5, #0
	blx FUN_020F2998
	ldr r1, _021EBF34 @ =0x00000112
	lsls r0, r0, #0x10
	ldrsh r7, [r4, r1]
	asrs r0, r0, #0x10
	subs r1, r7, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #0x18]
	ldr r1, [sp, #8]
	subs r1, r1, #1
	subs r0, r1, r0
	adds r0, r7, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r1, r5, #0
	blx FUN_020F2998
	lsls r0, r0, #0x10
	movs r2, #0x11
	asrs r0, r0, #0x10
	lsls r2, r2, #4
	ldr r3, [sp, #0xc]
	mov ip, r0
	ldrsh r1, [r4, r2]
	subs r3, r3, #1
	mov r6, ip
	subs r3, r3, r6
	subs r2, #0xc
	ldrh r6, [r4, r2]
	subs r0, r1, r0
	adds r3, r1, r3
	lsls r0, r0, #0x10
	lsls r3, r3, #0x10
	ldr r2, [sp, #0x18]
	asrs r0, r0, #0x10
	asrs r3, r3, #0x10
	cmp r2, r6
	bge _021EBEB6
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	str r2, [sp, #0x18]
_021EBEB6:
	movs r2, #1
	lsls r2, r2, #8
	ldrh r2, [r4, r2]
	cmp r0, r2
	bge _021EBEC4
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
_021EBEC4:
	ldr r2, _021EBF38 @ =0x00000106
	ldrh r6, [r4, r2]
	ldr r2, [sp, #4]
	cmp r2, r6
	ble _021EBED4
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	str r2, [sp, #4]
_021EBED4:
	ldr r2, _021EBF3C @ =0x00000102
	ldrh r2, [r4, r2]
	cmp r3, r2
	ble _021EBEE0
	lsls r2, r2, #0x10
	asrs r3, r2, #0x10
_021EBEE0:
	ldr r2, [sp, #0x18]
	adds r6, r5, #0
	subs r2, r7, r2
	muls r6, r2, r6
	ldr r2, [sp, #0x10]
	subs r0, r1, r0
	adds r6, r2, r6
	ldr r2, _021EBF40 @ =0x0000014A
	strh r6, [r4, r2]
	ldr r2, [sp, #4]
	adds r6, r5, #0
	subs r2, r2, r7
	muls r6, r2, r6
	ldr r2, [sp, #0x10]
	adds r2, r2, r6
	ldr r6, _021EBF40 @ =0x0000014A
	adds r6, r6, #2
	strh r2, [r4, r6]
	adds r2, r5, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x14]
	adds r2, r0, r2
	ldr r0, _021EBF40 @ =0x0000014A
	adds r0, r0, #4
	strh r2, [r4, r0]
	subs r0, r3, r1
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r0, _021EBF40 @ =0x0000014A
	adds r0, r0, #6
	strh r1, [r4, r0]
	movs r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021EBF28: .4byte 0x021D114C
_021EBF2C: .4byte 0x00000132
_021EBF30: .4byte 0x00000131
_021EBF34: .4byte 0x00000112
_021EBF38: .4byte 0x00000106
_021EBF3C: .4byte 0x00000102
_021EBF40: .4byte 0x0000014A
	thumb_func_end ov101_021EBDEC

	thumb_func_start ov101_021EBF44
ov101_021EBF44: @ 0x021EBF44
	push {r3, r4}
	adds r3, r0, #0
	adds r3, #0xf6
	ldrh r3, [r3]
	adds r2, r0, #0
	adds r2, #0xf4
	subs r3, r3, r1
	ldrh r2, [r2]
	subs r3, r3, #1
	lsls r3, r3, #0x10
	asrs r4, r3, #0x10
	movs r3, #0x11
	subs r2, r2, r1
	lsls r3, r3, #4
	adds r2, r2, #1
	lsls r2, r2, #0x10
	ldrsh r3, [r0, r3]
	asrs r2, r2, #0x10
	cmp r3, r2
	blt _021EBF76
	cmp r4, r3
	blt _021EBF76
	adds r0, r1, #0
	pop {r3, r4}
	bx lr
_021EBF76:
	cmp r3, r2
	bgt _021EBF86
	subs r0, r2, r3
	adds r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r3, r4}
	bx lr
_021EBF86:
	cmp r3, r4
	blt _021EBF92
	subs r0, r3, r4
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_021EBF92:
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov101_021EBF44

	thumb_func_start ov101_021EBF98
ov101_021EBF98: @ 0x021EBF98
	push {r4, lr}
	cmp r1, #0
	ble _021EBFC4
	adds r3, r0, #0
	adds r3, #0xf4
	ldrh r4, [r3]
	movs r3, #1
	lsls r3, r3, #8
	ldrh r3, [r0, r3]
	subs r3, r4, r3
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	cmp r3, #0
	bgt _021EBFB8
	movs r0, #0
	pop {r4, pc}
_021EBFB8:
	cmp r3, r2
	bge _021EBFEC
	adds r1, r3, #0
	bl ov101_021EBF44
	pop {r4, pc}
_021EBFC4:
	ldr r3, _021EBFF4 @ =0x00000102
	ldrh r4, [r0, r3]
	adds r3, r0, #0
	adds r3, #0xf6
	ldrh r3, [r3]
	subs r3, r4, r3
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	cmp r3, #0
	bgt _021EBFDC
	movs r0, #0
	pop {r4, pc}
_021EBFDC:
	cmp r3, r2
	bge _021EBFEC
	rsbs r1, r3, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ov101_021EBF44
	pop {r4, pc}
_021EBFEC:
	bl ov101_021EBF44
	pop {r4, pc}
	nop
_021EBFF4: .4byte 0x00000102
	thumb_func_end ov101_021EBF98

	thumb_func_start ov101_021EBFF8
ov101_021EBFF8: @ 0x021EBFF8
	push {r3, r4}
	adds r2, r0, #0
	adds r2, #0xf0
	ldrh r2, [r2]
	subs r2, r2, r1
	adds r2, r2, #1
	lsls r2, r2, #0x10
	asrs r3, r2, #0x10
	adds r2, r0, #0
	adds r2, #0xf2
	ldrh r2, [r2]
	subs r2, r2, r1
	lsls r2, r2, #0x10
	asrs r4, r2, #0x10
	ldr r2, _021EC048 @ =0x00000112
	ldrsh r2, [r0, r2]
	cmp r2, r3
	blt _021EC026
	cmp r4, r2
	blt _021EC026
	adds r0, r1, #0
	pop {r3, r4}
	bx lr
_021EC026:
	cmp r2, r3
	bgt _021EC036
	subs r0, r3, r2
	adds r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r3, r4}
	bx lr
_021EC036:
	cmp r2, r4
	blt _021EC042
	subs r0, r2, r4
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_021EC042:
	pop {r3, r4}
	bx lr
	nop
_021EC048: .4byte 0x00000112
	thumb_func_end ov101_021EBFF8

	thumb_func_start ov101_021EC04C
ov101_021EC04C: @ 0x021EC04C
	push {r4, lr}
	cmp r1, #0
	ble _021EC078
	adds r3, r0, #0
	adds r3, #0xf0
	ldrh r4, [r3]
	movs r3, #0x41
	lsls r3, r3, #2
	ldrh r3, [r0, r3]
	subs r3, r4, r3
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	cmp r3, #0
	bgt _021EC06C
	movs r0, #0
	pop {r4, pc}
_021EC06C:
	cmp r3, r2
	bge _021EC0A0
	adds r1, r3, #0
	bl ov101_021EBFF8
	pop {r4, pc}
_021EC078:
	ldr r3, _021EC0A8 @ =0x00000106
	ldrh r4, [r0, r3]
	adds r3, r0, #0
	adds r3, #0xf2
	ldrh r3, [r3]
	subs r3, r4, r3
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	cmp r3, #0
	bgt _021EC090
	movs r0, #0
	pop {r4, pc}
_021EC090:
	cmp r3, r2
	bge _021EC0A0
	rsbs r1, r3, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ov101_021EBFF8
	pop {r4, pc}
_021EC0A0:
	bl ov101_021EBFF8
	pop {r4, pc}
	nop
_021EC0A8: .4byte 0x00000106
	thumb_func_end ov101_021EC04C

	thumb_func_start ov101_021EC0AC
ov101_021EC0AC: @ 0x021EC0AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r1, _021EC2F4 @ =0x021D114C
	adds r5, r0, #0
	movs r0, #0x20
	ldrsh r0, [r1, r0]
	str r0, [sp, #8]
	movs r0, #0x22
	ldrsh r0, [r1, r0]
	str r0, [sp]
	movs r0, #0x4e
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x1f
	lsrs r2, r0, #0x1f
	lsls r1, r2, #3
	adds r1, #8
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0xf
	asrs r0, r0, #0x10
	str r0, [sp, #0x14]
	cmp r2, #0
	beq _021EC0E2
	movs r0, #9
	str r0, [sp, #0x10]
	b _021EC0E6
_021EC0E2:
	movs r0, #5
	str r0, [sp, #0x10]
_021EC0E6:
	ldr r2, _021EC2F8 @ =0x0000013A
	ldrb r0, [r5, r2]
	cmp r0, #0
	beq _021EC142
	adds r0, r5, #0
	adds r0, #0xc8
	ldr r1, [r0]
	adds r0, r2, #4
	ldrsh r0, [r5, r0]
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0xc8
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xcc
	ldr r1, [r0]
	adds r0, r2, #6
	ldrsh r0, [r5, r0]
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0xcc
	str r1, [r0]
	adds r1, r2, #4
	adds r2, r2, #6
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	adds r0, r5, #0
	bl ov101_021E9BF4
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6E84
	movs r0, #0x4e
	lsls r0, r0, #2
	ldrb r2, [r5, r0]
	movs r1, #0x80
	add sp, #0x20
	orrs r2, r1
	strb r2, [r5, r0]
	movs r0, #0
	adds r1, #0xba
	strb r0, [r5, r1]
	subs r0, r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EC142:
	bl FUN_0202534C
	cmp r0, #0
	bne _021EC15C
	ldr r1, _021EC2FC @ =0x00000139
	movs r0, #8
	ldrb r2, [r5, r1]
	add sp, #0x20
	bics r2, r0
	movs r0, #0
	strb r2, [r5, r1]
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021EC15C:
	ldr r1, _021EC300 @ =0x00000142
	ldr r0, [sp, #8]
	ldrsh r2, [r5, r1]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r1, #2
	ldrsh r1, [r5, r0]
	ldr r0, [sp]
	str r6, [sp, #0xc]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	str r4, [sp, #4]
	cmp r6, #0
	bge _021EC186
	movs r0, #0
	mvns r0, r0
	muls r0, r6, r0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
_021EC186:
	cmp r4, #0
	bge _021EC194
	movs r0, #0
	mvns r0, r0
	muls r0, r4, r0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
_021EC194:
	ldr r1, [sp, #0x10]
	adds r0, r6, #0
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r1, [sp, #0x10]
	adds r0, r4, #0
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	blx FUN_020F2998
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x1c]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	blx FUN_020F2998
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x18]
	cmp r6, #1
	bge _021EC1D8
	cmp r4, #1
	bge _021EC1D8
	movs r0, #0
	add sp, #0x20
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021EC1D8:
	movs r0, #5
	movs r7, #0
	lsls r0, r0, #6
	strh r7, [r5, r0]
	ldrsh r1, [r5, r0]
	subs r0, r0, #2
	cmp r6, #0
	strh r1, [r5, r0]
	ble _021EC248
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	blx FUN_020F2998
	adds r1, r0, #0
	lsls r1, r1, #0x10
	adds r0, r5, #0
	asrs r1, r1, #0x10
	adds r2, r6, #0
	bl ov101_021EBF98
	adds r7, r0, #0
	beq _021EC248
	adds r1, r5, #0
	ldr r0, [sp, #0x14]
	adds r1, #0xc8
	ldr r1, [r1]
	muls r0, r7, r0
	subs r2, r1, r0
	adds r1, r5, #0
	adds r1, #0xc8
	str r2, [r1]
	adds r1, r5, #0
	adds r1, #0xf6
	ldrh r1, [r1]
	movs r3, #1
	subs r2, r1, r7
	adds r1, r5, #0
	adds r1, #0xf6
	strh r2, [r1]
	adds r1, r5, #0
	adds r1, #0xf4
	ldrh r1, [r1]
	subs r2, r1, r7
	adds r1, r5, #0
	adds r1, #0xf4
	strh r2, [r1]
	ldr r2, [sp, #8]
	ldr r1, [sp, #0x1c]
	subs r2, r2, r1
	ldr r1, _021EC300 @ =0x00000142
	strh r2, [r5, r1]
	adds r2, r1, #0
	subs r2, #8
	strb r3, [r5, r2]
	subs r1, r1, #4
	strh r0, [r5, r1]
_021EC248:
	cmp r4, #0
	ble _021EC2AE
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	blx FUN_020F2998
	adds r1, r0, #0
	lsls r1, r1, #0x10
	adds r0, r5, #0
	asrs r1, r1, #0x10
	adds r2, r4, #0
	bl ov101_021EC04C
	adds r2, r0, #0
	beq _021EC2B0
	adds r1, r5, #0
	ldr r0, [sp, #0x14]
	adds r1, #0xcc
	ldr r1, [r1]
	muls r0, r2, r0
	subs r3, r1, r0
	adds r1, r5, #0
	adds r1, #0xcc
	str r3, [r1]
	adds r1, r5, #0
	adds r1, #0xf2
	ldrh r1, [r1]
	movs r4, #1
	subs r3, r1, r2
	adds r1, r5, #0
	adds r1, #0xf2
	strh r3, [r1]
	adds r1, r5, #0
	adds r1, #0xf0
	ldrh r1, [r1]
	subs r3, r1, r2
	adds r1, r5, #0
	adds r1, #0xf0
	strh r3, [r1]
	ldr r3, [sp]
	ldr r1, [sp, #0x18]
	subs r3, r3, r1
	movs r1, #0x51
	lsls r1, r1, #2
	strh r3, [r5, r1]
	adds r3, r1, #0
	subs r3, #0xa
	strb r4, [r5, r3]
	subs r1, r1, #4
	strh r0, [r5, r1]
	b _021EC2B0
_021EC2AE:
	movs r2, #0
_021EC2B0:
	cmp r7, #0
	bne _021EC2B8
	cmp r2, #0
	beq _021EC2EA
_021EC2B8:
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x14]
	muls r1, r7, r1
	muls r3, r2, r3
	lsls r1, r1, #0x10
	lsls r2, r3, #0x10
	adds r0, r5, #0
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov101_021E9BF4
	adds r0, r5, #0
	bl ov101_021EC944
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6E84
	movs r1, #0x4e
	lsls r1, r1, #2
	ldrb r2, [r5, r1]
	movs r0, #0x80
	orrs r0, r2
	strb r0, [r5, r1]
_021EC2EA:
	movs r0, #0
	mvns r0, r0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EC2F4: .4byte 0x021D114C
_021EC2F8: .4byte 0x0000013A
_021EC2FC: .4byte 0x00000139
_021EC300: .4byte 0x00000142
	thumb_func_end ov101_021EC0AC

	thumb_func_start ov101_021EC304
ov101_021EC304: @ 0x021EC304
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r7, [sp, #8]
	ldr r4, [r0, #8]
	ldr r0, _021EC488 @ =0x00000139
	adds r4, #0xc8
	ldrb r1, [r5, r0]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	bne _021EC328
	b _021EC484
_021EC328:
	subs r0, r0, #1
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021EC336
	movs r6, #8
	b _021EC338
_021EC336:
	movs r6, #4
_021EC338:
	add r0, sp, #0xc
	movs r2, #0x45
	str r0, [sp]
	lsls r2, r2, #2
	ldrsh r1, [r5, r2]
	adds r2, r2, #2
	add r3, sp, #0xc
	ldrsh r2, [r5, r2]
	adds r0, r5, #0
	adds r3, #2
	bl ov101_021E9464
	ldr r0, _021EC48C @ =0x0000013B
	movs r2, #1
	ldrb r1, [r5, r0]
	tst r2, r1
	beq _021EC378
	add r0, sp, #0xc
	ldrh r0, [r0]
	cmp r0, #1
	bhi _021EC36E
	subs r0, r7, r6
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	movs r0, #1
	str r0, [sp, #8]
	b _021EC3A6
_021EC36E:
	movs r0, #6
	ldrsh r0, [r4, r0]
	subs r0, r0, r6
	strh r0, [r4, #6]
	b _021EC3A6
_021EC378:
	movs r2, #2
	tst r1, r2
	beq _021EC3A6
	subs r0, r0, #3
	ldrb r0, [r5, r0]
	add r1, sp, #0xc
	ldrh r1, [r1]
	lsls r0, r0, #0x1f
	lsrs r2, r0, #0x1f
	ldr r0, _021EC490 @ =0x021F7E8E
	ldrb r0, [r0, r2]
	cmp r1, r0
	blt _021EC39E
	adds r0, r7, r6
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	movs r0, #1
	str r0, [sp, #8]
	b _021EC3A6
_021EC39E:
	movs r0, #6
	ldrsh r0, [r4, r0]
	adds r0, r0, r6
	strh r0, [r4, #6]
_021EC3A6:
	ldr r0, _021EC48C @ =0x0000013B
	movs r3, #4
	ldrb r0, [r5, r0]
	adds r1, r0, #0
	tst r1, r3
	beq _021EC3D2
	add r0, sp, #0xc
	ldrh r0, [r0, #2]
	cmp r0, #1
	bhi _021EC3CA
	ldr r0, [sp, #4]
	subs r0, r0, r6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	b _021EC404
_021EC3CA:
	ldrsh r0, [r4, r3]
	subs r0, r0, r6
	strh r0, [r4, #4]
	b _021EC404
_021EC3D2:
	movs r1, #8
	tst r0, r1
	beq _021EC404
	add r0, sp, #0xc
	ldrh r2, [r0, #2]
	ldr r0, _021EC48C @ =0x0000013B
	subs r0, r0, #3
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x1f
	lsrs r1, r0, #0x1f
	ldr r0, _021EC494 @ =0x021F7E8C
	ldrb r0, [r0, r1]
	cmp r2, r0
	blt _021EC3FE
	ldr r0, [sp, #4]
	adds r0, r0, r6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	b _021EC404
_021EC3FE:
	ldrsh r0, [r4, r3]
	adds r0, r0, r6
	strh r0, [r4, #4]
_021EC404:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _021EC44E
	movs r1, #0x4e
	lsls r1, r1, #2
	ldrb r2, [r5, r1]
	movs r0, #0x80
	orrs r0, r2
	strb r0, [r5, r1]
	adds r0, r5, #0
	adds r0, #0xc8
	ldr r1, [r0]
	ldr r0, [sp, #4]
	rsbs r2, r7, #0
	adds r1, r1, r0
	adds r0, r5, #0
	adds r0, #0xc8
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xcc
	ldr r0, [r0]
	lsls r2, r2, #0x10
	adds r1, r0, r7
	adds r0, r5, #0
	adds r0, #0xcc
	str r1, [r0]
	ldr r1, [sp, #4]
	adds r0, r5, #0
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov101_021E9BF4
	adds r0, r5, #0
	bl ov101_021EC944
_021EC44E:
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6E84
	ldr r0, _021EC498 @ =0x0000013A
	ldrb r1, [r5, r0]
	subs r1, r1, #1
	strb r1, [r5, r0]
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021EC484
	adds r0, r5, #0
	bl ov101_021E9288
	ldr r1, _021EC488 @ =0x00000139
	movs r0, #1
	ldrb r2, [r5, r1]
	bics r2, r0
	strb r2, [r5, r1]
	ldrb r2, [r5, r1]
	movs r0, #4
	bics r2, r0
	strb r2, [r5, r1]
	movs r2, #0
	adds r0, r1, #2
	strb r2, [r5, r0]
_021EC484:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EC488: .4byte 0x00000139
_021EC48C: .4byte 0x0000013B
_021EC490: .4byte 0x021F7E8E
_021EC494: .4byte 0x021F7E8C
_021EC498: .4byte 0x0000013A
	thumb_func_end ov101_021EC304

	thumb_func_start ov101_021EC49C
ov101_021EC49C: @ 0x021EC49C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r1, [sp, #8]
	ldr r1, [sp, #0x40]
	adds r6, r0, #0
	str r1, [sp, #0x40]
	adds r1, r6, #0
	str r3, [sp, #0x10]
	movs r3, #0x4e
	str r2, [sp, #0xc]
	adds r1, #0x84
	ldr r1, [r1]
	lsls r3, r3, #2
	ldr r4, [r1, #8]
	ldrb r1, [r6, r3]
	str r4, [sp, #0x1c]
	adds r4, #0xc8
	lsls r1, r1, #0x1f
	lsrs r2, r1, #0x1f
	adds r1, r2, #1
	lsls r1, r1, #0x1b
	lsrs r7, r1, #0x18
	lsls r1, r7, #0x17
	lsrs r5, r1, #0x18
	movs r1, #4
	ldrsh r1, [r4, r1]
	str r1, [sp]
	movs r1, #6
	ldrsh r1, [r4, r1]
	str r1, [sp, #4]
	adds r1, r2, #0
	adds r2, r3, #0
	subs r2, #0x28
	subs r3, #0x26
	ldrh r2, [r6, r2]
	ldrh r3, [r6, r3]
	bl ov101_021E9530
	movs r3, #0x4e
	lsls r3, r3, #2
	ldrb r0, [r6, r3]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _021EC54C
	movs r0, #6
	subs r1, r3, #7
	ldrsh r0, [r4, r0]
	ldrb r1, [r6, r1]
	subs r2, r3, #6
	ldrb r2, [r6, r2]
	subs r0, r0, r1
	asrs r1, r0, #3
	lsrs r1, r1, #0x1c
	adds r1, r0, r1
	lsls r0, r1, #0x14
	movs r1, #4
	ldrsh r1, [r4, r1]
	lsrs r0, r0, #0x18
	subs r1, r1, r2
	asrs r2, r1, #3
	lsrs r2, r2, #0x1c
	adds r2, r1, r2
	lsls r1, r2, #0x14
	lsrs r1, r1, #0x18
	cmp r1, #5
	bhi _021EC52A
	ldr r1, [sp, #8]
	lsls r2, r1, #3
	adds r2, #8
	ldr r1, [sp, #0x10]
	b _021EC530
_021EC52A:
	ldr r1, [sp, #8]
	lsls r2, r1, #3
	ldr r1, [sp, #0x10]
_021EC530:
	str r2, [r1]
	cmp r0, #4
	bls _021EC542
	ldr r0, [sp, #0xc]
	lsls r1, r0, #3
	ldr r0, [sp, #0x40]
	adds r1, #8
	str r1, [r0]
	b _021EC5A4
_021EC542:
	ldr r0, [sp, #0xc]
	lsls r1, r0, #3
	ldr r0, [sp, #0x40]
	str r1, [r0]
	b _021EC5A4
_021EC54C:
	movs r0, #6
	subs r1, r3, #7
	ldrsh r0, [r4, r0]
	ldrb r1, [r6, r1]
	subs r0, r0, r1
	asrs r1, r0, #2
	lsrs r1, r1, #0x1d
	adds r1, r0, r1
	asrs r0, r1, #3
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #4
	subs r1, r3, #6
	ldrsh r0, [r4, r0]
	ldrb r1, [r6, r1]
	subs r0, r0, r1
	asrs r1, r0, #2
	lsrs r1, r1, #0x1d
	adds r1, r0, r1
	asrs r0, r1, #3
	lsrs r1, r0, #0x1f
	lsls r3, r0, #0x1f
	subs r3, r3, r1
	movs r0, #0x1f
	rors r3, r0
	adds r0, r1, r3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [sp, #8]
	adds r0, r0, r1
	lsls r1, r0, #3
	ldr r0, [sp, #0x10]
	str r1, [r0]
	ldr r0, [sp, #0xc]
	adds r0, r0, r2
	lsls r1, r0, #3
	ldr r0, [sp, #0x40]
	str r1, [r0]
_021EC5A4:
	adds r0, r6, #0
	adds r0, #0xf4
	ldr r3, _021EC770 @ =0x00000132
	ldrh r1, [r0]
	ldr r0, [sp, #8]
	ldrb r2, [r6, r3]
	subs r0, r0, r1
	muls r0, r7, r0
	adds r0, r2, r0
	adds r0, r5, r0
	strh r0, [r4, #8]
	subs r0, r3, #1
	ldrb r2, [r6, r0]
	adds r0, r6, #0
	adds r0, #0xf0
	ldrh r1, [r0]
	ldr r0, [sp, #0xc]
	subs r0, r0, r1
	muls r0, r7, r0
	adds r0, r2, r0
	adds r0, r5, r0
	strh r0, [r4, #0xa]
	ldr r0, [sp, #0x1c]
	adds r2, r6, #0
	adds r0, #0xfc
	adds r2, #0xf4
	ldrh r0, [r0]
	ldrh r2, [r2]
	ldrb r1, [r6, r3]
	subs r0, r0, r2
	muls r0, r7, r0
	adds r0, r1, r0
	adds r1, r5, r0
	ldr r0, [sp, #0x1c]
	adds r0, #0xf8
	strh r1, [r0]
	ldr r1, [sp, #0x1c]
	subs r0, r3, #1
	adds r1, #0xfe
	ldrh r2, [r1]
	adds r1, r6, #0
	adds r1, #0xf0
	ldrh r1, [r1]
	ldrb r0, [r6, r0]
	subs r1, r2, r1
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r5, r0
	ldr r0, [sp, #0x1c]
	adds r0, #0xfa
	strh r1, [r0]
	adds r0, r6, #0
	movs r1, #1
	bl ov101_021EA238
	adds r0, r6, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r7, #5
	ldrh r0, [r0, #2]
	cmp r0, #5
	bhi _021EC622
	b _021EC76C
_021EC622:
	movs r4, #0x3f
	lsls r4, r4, #0x18
_021EC626:
	ldr r0, _021EC774 @ =0x0000013A
	ldrb r0, [r6, r0]
	cmp r0, #0
	beq _021EC640
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020F1520
	str r0, [sp, #0x18]
	b _021EC64E
_021EC640:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r4, #0
	blx FUN_020F24C8
	str r0, [sp, #0x18]
_021EC64E:
	movs r0, #0x28
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, [sp, #0x1c]
	adds r5, r0, r1
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r0, #4
	ldrsh r0, [r5, r0]
	subs r0, r1, r0
	cmp r0, #0
	ble _021EC676
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020F1520
	b _021EC682
_021EC676:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r4, #0
	blx FUN_020F24C8
_021EC682:
	blx FUN_020F2104
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	blx FUN_020F2104
	adds r1, r0, #0
	ldr r0, [sp, #0x24]
	blx FUN_020CCBA0
	str r0, [r5, #0x18]
	ldr r0, _021EC774 @ =0x0000013A
	ldrb r0, [r6, r0]
	cmp r0, #0
	beq _021EC6B2
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020F1520
	str r0, [sp, #0x14]
	b _021EC6C0
_021EC6B2:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r4, #0
	blx FUN_020F24C8
	str r0, [sp, #0x14]
_021EC6C0:
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	movs r0, #6
	ldrsh r0, [r5, r0]
	subs r0, r1, r0
	cmp r0, #0
	ble _021EC6DE
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020F1520
	b _021EC6EA
_021EC6DE:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r4, #0
	blx FUN_020F24C8
_021EC6EA:
	blx FUN_020F2104
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x14]
	blx FUN_020F2104
	adds r1, r0, #0
	ldr r0, [sp, #0x28]
	blx FUN_020CCBA0
	str r0, [r5, #0x1c]
	movs r0, #6
	ldrsh r0, [r5, r0]
	str r0, [sp, #0x20]
	movs r0, #4
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _021EC71E
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020F1520
	b _021EC72A
_021EC71E:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r4, #0
	blx FUN_020F24C8
_021EC72A:
	blx FUN_020F2104
	str r0, [r5, #0x10]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	ble _021EC746
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020F1520
	b _021EC752
_021EC746:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r4, #0
	blx FUN_020F24C8
_021EC752:
	blx FUN_020F2104
	str r0, [r5, #0x14]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r6, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r7, r0
	bhs _021EC76C
	b _021EC626
_021EC76C:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021EC770: .4byte 0x00000132
_021EC774: .4byte 0x0000013A
	thumb_func_end ov101_021EC49C

	thumb_func_start ov101_021EC778
ov101_021EC778: @ 0x021EC778
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x84
	ldr r1, _021EC918 @ =0x00000139
	ldr r0, [r0]
	ldrb r2, [r4, r1]
	ldr r6, [r0, #8]
	adds r0, r6, #0
	lsls r2, r2, #0x1e
	adds r0, #0xc8
	lsrs r2, r2, #0x1f
	bne _021EC794
	b _021EC914
_021EC794:
	subs r1, r1, #1
	ldrb r1, [r4, r1]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	beq _021EC7BA
	adds r1, r4, #0
	adds r1, #0xd0
	movs r2, #1
	ldr r1, [r1]
	lsls r2, r2, #0xa
	adds r3, r1, r2
	adds r1, r4, #0
	adds r1, #0xd0
	str r3, [r1]
	adds r1, r4, #0
	adds r1, #0xd4
	ldr r1, [r1]
	adds r2, r1, r2
	b _021EC7D4
_021EC7BA:
	adds r1, r4, #0
	adds r1, #0xd0
	movs r2, #1
	ldr r1, [r1]
	lsls r2, r2, #0xa
	subs r3, r1, r2
	adds r1, r4, #0
	adds r1, #0xd0
	str r3, [r1]
	adds r1, r4, #0
	adds r1, #0xd4
	ldr r1, [r1]
	subs r2, r1, r2
_021EC7D4:
	adds r1, r4, #0
	adds r1, #0xd4
	str r2, [r1]
	adds r1, r4, #0
	adds r1, #0xd0
	ldr r1, [r1]
	str r1, [sp]
	movs r1, #1
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	adds r1, r4, #0
	adds r1, #0xd4
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r0, [r0, #0x20]
	add r1, sp, #0
	bl FUN_020247F4
	ldr r0, _021EC91C @ =0x0000013A
	ldrb r1, [r4, r0]
	subs r1, r1, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021EC870
	movs r0, #0xfc
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xfe
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xcc
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r5, #5
	ldrh r0, [r0, #2]
	cmp r0, #5
	bls _021EC856
	movs r7, #0xa
_021EC82A:
	movs r0, #0x28
	muls r0, r5, r0
	adds r0, r6, r0
	movs r1, #0xa
	movs r2, #8
	ldrsh r1, [r0, r1]
	ldrsh r2, [r0, r2]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldrsh r2, [r0, r7]
	adds r1, r5, #0
	bl ov101_021EC920
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r5, r0
	blo _021EC82A
_021EC856:
	ldr r1, _021EC918 @ =0x00000139
	movs r0, #1
	ldrb r2, [r4, r1]
	bics r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	movs r0, #2
	bics r2, r0
	strb r2, [r4, r1]
	movs r2, #0
	adds r0, r1, #2
	strb r2, [r4, r0]
	b _021EC8FE
_021EC870:
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe0
	ldr r0, [r0]
	movs r5, #5
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0xe8
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xec
	ldr r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0xec
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	asrs r1, r0, #0xc
	adds r0, r4, #0
	adds r0, #0xc8
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	asrs r1, r0, #0xc
	adds r0, r4, #0
	adds r0, #0xcc
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r0, #5
	bls _021EC8FE
	movs r7, #0x28
_021EC8C4:
	adds r0, r5, #0
	muls r0, r7, r0
	adds r0, r6, r0
	ldr r2, [r0, #0x10]
	ldr r1, [r0, #0x18]
	adds r1, r2, r1
	str r1, [r0, #0x10]
	ldr r2, [r0, #0x14]
	ldr r1, [r0, #0x1c]
	adds r1, r2, r1
	str r1, [r0, #0x14]
	lsls r1, r1, #4
	asrs r2, r1, #0x10
	ldr r1, [r0, #0x10]
	asrs r1, r1, #0xc
	strh r1, [r0, #4]
	adds r1, r5, #0
	strh r2, [r0, #6]
	bl ov101_021EC920
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r5, r0
	blo _021EC8C4
_021EC8FE:
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6E84
	movs r1, #0x4e
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x80
	orrs r0, r2
	strb r0, [r4, r1]
_021EC914:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021EC918: .4byte 0x00000139
_021EC91C: .4byte 0x0000013A
	thumb_func_end ov101_021EC778

	thumb_func_start ov101_021EC920
ov101_021EC920: @ 0x021EC920
	push {r3, lr}
	ldrb r1, [r0, #1]
	cmp r1, #0
	beq _021EC942
	cmp r2, #0xd8
	bgt _021EC930
	cmp r2, #0
	bge _021EC93A
_021EC930:
	ldr r0, [r0, #0x20]
	movs r1, #0
	bl FUN_02024830
	pop {r3, pc}
_021EC93A:
	ldr r0, [r0, #0x20]
	movs r1, #1
	bl FUN_02024830
_021EC942:
	pop {r3, pc}
	thumb_func_end ov101_021EC920

	thumb_func_start ov101_021EC944
ov101_021EC944: @ 0x021EC944
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x84
	ldr r1, [r0]
	ldrb r0, [r6, #0xd]
	ldr r5, [r1, #8]
	cmp r0, #0
	bne _021EC97E
	ldrh r0, [r1, #2]
	movs r4, #5
	cmp r0, #5
	bls _021EC97E
	movs r7, #6
_021EC95E:
	movs r0, #0x28
	muls r0, r4, r0
	adds r0, r5, r0
	ldrsh r2, [r0, r7]
	adds r1, r4, #0
	bl ov101_021EC920
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r6, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r4, r0
	blo _021EC95E
_021EC97E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021EC944

	thumb_func_start ov101_021EC980
ov101_021EC980: @ 0x021EC980
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r2, [sp, #4]
	movs r2, #0x4e
	lsls r2, r2, #2
	adds r5, r0, #0
	ldrb r0, [r5, r2]
	subs r4, r2, #6
	str r1, [sp]
	lsls r0, r0, #0x1f
	lsrs r1, r0, #0x1f
	lsls r0, r1, #2
	ldr r3, _021ECA28 @ =0x021F7E9C
	subs r2, r2, #7
	adds r6, r3, r0
	adds r1, r1, #1
	lsls r1, r1, #3
	ldr r3, _021ECA2C @ =0x021D114C
	str r0, [sp, #0xc]
	ldrh r0, [r3, #0x20]
	ldrb r4, [r5, r4]
	ldrh r3, [r3, #0x22]
	ldrb r2, [r5, r2]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	subs r2, r3, r2
	lsls r2, r2, #0x10
	asrs r0, r0, #0x10
	str r1, [sp, #8]
	asrs r4, r2, #0x10
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	ldr r1, [sp, #8]
	adds r0, r4, #0
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r1, _021ECA28 @ =0x021F7E9C
	ldr r0, [sp, #0xc]
	ldrb r0, [r1, r0]
	cmp r4, r0
	bge _021EC9DC
	adds r4, r0, #0
_021EC9DC:
	ldrb r0, [r6, #1]
	cmp r4, r0
	ble _021EC9E4
	adds r4, r0, #0
_021EC9E4:
	ldrb r0, [r6, #2]
	cmp r7, r0
	bge _021EC9EC
	adds r7, r0, #0
_021EC9EC:
	ldrb r0, [r6, #3]
	cmp r7, r0
	ble _021EC9F4
	adds r7, r0, #0
_021EC9F4:
	adds r1, r5, #0
	adds r1, #0xf0
	adds r0, r5, #0
	ldrh r1, [r1]
	adds r0, #0xf4
	ldrh r0, [r0]
	adds r1, r4, r1
	lsls r1, r1, #0x10
	adds r0, r7, r0
	asrs r4, r1, #0x10
	lsls r0, r0, #0x10
	ldr r1, [sp]
	asrs r0, r0, #0x10
	cmp r1, #0
	beq _021ECA14
	strh r0, [r1]
_021ECA14:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _021ECA1C
	strh r4, [r0]
_021ECA1C:
	adds r0, r5, #0
	bl ov101_021E94C0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021ECA28: .4byte 0x021F7E9C
_021ECA2C: .4byte 0x021D114C
	thumb_func_end ov101_021EC980

	thumb_func_start ov101_021ECA30
ov101_021ECA30: @ 0x021ECA30
	push {r3, r4}
	movs r2, #0x47
	lsls r2, r2, #2
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _021ECA40
	cmp r1, #8
	blo _021ECA46
_021ECA40:
	movs r0, #0
	pop {r3, r4}
	bx lr
_021ECA46:
	lsrs r4, r1, #0x1f
	lsls r3, r1, #0x1f
	subs r3, r3, r4
	movs r2, #0x1f
	rors r3, r2
	adds r2, r4, r3
	bne _021ECA64
	lsrs r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	cmp r0, #0xf
	beq _021ECA78
	movs r0, #1
	pop {r3, r4}
	bx lr
_021ECA64:
	lsrs r1, r1, #1
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	ldr r0, _021ECA80 @ =0x0000FFFF
	cmp r1, r0
	beq _021ECA78
	movs r0, #1
	pop {r3, r4}
	bx lr
_021ECA78:
	movs r0, #0
	pop {r3, r4}
	bx lr
	nop
_021ECA80: .4byte 0x0000FFFF
	thumb_func_end ov101_021ECA30

	thumb_func_start ov101_021ECA84
ov101_021ECA84: @ 0x021ECA84
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	movs r0, #0x4f
	lsls r0, r0, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1f
	ldrb r2, [r4, r0]
	movs r3, #0x80
	lsrs r1, r1, #0x18
	bics r2, r3
	orrs r1, r2
	strb r1, [r4, r0]
	adds r1, r0, #0
	adds r1, #0x40
	ldr r1, [r4, r1]
	movs r3, #8
	adds r5, r1, #0
	str r3, [sp]
	movs r2, #5
	str r2, [sp, #4]
	adds r5, #0xc
	str r5, [sp, #8]
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	adds r0, #0xe
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	movs r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r1]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r1, #2]
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	ldr r0, [r4, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov101_021ECA84

	thumb_func_start ov101_021ECAF0
ov101_021ECAF0: @ 0x021ECAF0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _021ECC48 @ =0x021D110C
	movs r1, #2
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021ECB16
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C @ =0x0000FFFF
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E7128
	movs r0, #0xa
	pop {r3, r4, r5, pc}
_021ECB16:
	movs r1, #1
	tst r1, r0
	beq _021ECBE2
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x7c]
	bl FUN_021E7334
	adds r5, r0, #0
	ldr r0, _021ECC50 @ =0x00000941
	bl FUN_0200604C
	cmp r5, #8
	bne _021ECB40
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C @ =0x0000FFFF
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E7128
	movs r0, #0xa
	pop {r3, r4, r5, pc}
_021ECB40:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov101_021ECA30
	cmp r0, #0
	beq _021ECB8C
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C @ =0x0000FFFF
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E7414
	ldr r0, [r4, #0x10]
	movs r1, #3
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E72F8
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C @ =0x0000FFFF
	ldr r0, [r0, #0x7c]
	movs r2, #1
	bl FUN_021E7128
	adds r0, r4, #0
	movs r1, #1
	bl ov101_021ECA84
	movs r1, #0x4f
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x7f
	bics r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r4, r1]
	subs r0, r0, #3
	pop {r3, r4, r5, pc}
_021ECB8C:
	lsrs r2, r5, #0x1f
	lsls r1, r5, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r1, r2, r1
	bne _021ECBD2
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C @ =0x0000FFFF
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E7414
	ldr r0, [r4, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E72F8
	ldr r0, [r4, #0x10]
	ldr r1, _021ECC4C @ =0x0000FFFF
	ldr r0, [r0, #0x7c]
	movs r2, #1
	bl FUN_021E7128
	movs r1, #0x4f
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x7f
	bics r2, r0
	movs r0, #1
	orrs r2, r0
	strb r2, [r4, r1]
	subs r0, r0, #2
	pop {r3, r4, r5, pc}
_021ECBD2:
	lsrs r1, r5, #1
	strh r1, [r4, #0x16]
	adds r0, #0xf9
	ldr r0, [r4, r0]
	ldrh r0, [r0]
	strh r0, [r4, #0x2c]
	movs r0, #0xb
	pop {r3, r4, r5, pc}
_021ECBE2:
	movs r1, #0x20
	tst r1, r0
	beq _021ECBFA
	ldr r0, _021ECC54 @ =0x0000093F
	bl FUN_0200604C
	ldr r0, [r4, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E73AC
	b _021ECC40
_021ECBFA:
	movs r1, #0x10
	tst r1, r0
	beq _021ECC12
	ldr r0, _021ECC54 @ =0x0000093F
	bl FUN_0200604C
	ldr r0, [r4, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	bl FUN_021E73AC
	b _021ECC40
_021ECC12:
	movs r1, #0x40
	tst r1, r0
	beq _021ECC2A
	ldr r0, _021ECC54 @ =0x0000093F
	bl FUN_0200604C
	ldr r0, [r4, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x7c]
	bl FUN_021E73AC
	b _021ECC40
_021ECC2A:
	movs r1, #0x80
	tst r0, r1
	beq _021ECC40
	ldr r0, _021ECC54 @ =0x0000093F
	bl FUN_0200604C
	ldr r0, [r4, #0x10]
	movs r1, #3
	ldr r0, [r0, #0x7c]
	bl FUN_021E73AC
_021ECC40:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	nop
_021ECC48: .4byte 0x021D110C
_021ECC4C: .4byte 0x0000FFFF
_021ECC50: .4byte 0x00000941
_021ECC54: .4byte 0x0000093F
	thumb_func_end ov101_021ECAF0

	thumb_func_start ov101_021ECC58
ov101_021ECC58: @ 0x021ECC58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	adds r6, r1, #0
	ldr r7, [r0, #8]
	bl FUN_0202534C
	cmp r0, #0
	bne _021ECC76
	movs r0, #0
	add sp, #0x1c
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_021ECC76:
	ldr r0, _021ECE44 @ =0x00000139
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021ECC88
	movs r0, #0
	add sp, #0x1c
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_021ECC88:
	ldr r0, _021ECE48 @ =0x021F7EF4
	bl FUN_02025224
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _021ECC9A
	b _021ECE3E
_021ECC9A:
	movs r1, #1
	str r1, [r6]
	cmp r4, #0x10
	bne _021ECCF4
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	str r1, [sp]
	movs r1, #5
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #7
	str r1, [sp, #0xc]
	movs r1, #0x10
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r2, #0x17
	movs r3, #8
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	add sp, #0x1c
	movs r0, #0xa
	pop {r4, r5, r6, r7, pc}
_021ECCF4:
	cmp r4, #8
	blt _021ECD3C
	ldr r0, _021ECE44 @ =0x00000139
	movs r3, #0xf0
	ldrb r2, [r5, r0]
	bics r2, r3
	adds r3, r4, #0
	subs r3, #8
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x18
	orrs r2, r3
	strb r2, [r5, r0]
	adds r2, r0, #3
	ldrb r3, [r5, r2]
	movs r2, #0x7f
	adds r0, r0, #3
	bics r3, r2
	adds r2, r3, #0
	orrs r2, r1
	strb r2, [r5, r0]
	adds r4, #0x14
	movs r0, #0x28
	muls r0, r4, r0
	adds r0, r7, r0
	ldr r0, [r0, #0x20]
	bl FUN_0200DD60
	ldr r0, _021ECE4C @ =0x00000947
	bl FUN_0200604C
	movs r0, #0
	add sp, #0x1c
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_021ECD3C:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov101_021ECA30
	cmp r0, #0
	beq _021ECE12
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	lsls r0, r0, #0xf
	lsrs r6, r0, #0x10
	lsrs r2, r4, #0x1f
	lsls r0, r4, #0x1f
	subs r0, r0, r2
	movs r1, #0x1f
	rors r0, r1
	adds r0, r2, r0
	bne _021ECD92
	ldr r2, _021ECE44 @ =0x00000139
	movs r1, #0xf0
	ldrb r0, [r5, r2]
	bics r0, r1
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x18
	orrs r0, r1
	strb r0, [r5, r2]
	movs r1, #0
	adds r0, r2, #7
	strh r1, [r5, r0]
	ldrsh r1, [r5, r0]
	adds r0, r2, #5
	adds r6, #0x14
	strh r1, [r5, r0]
	movs r0, #0x28
	muls r0, r6, r0
	adds r0, r7, r0
	ldr r0, [r0, #0x20]
	movs r1, #1
	bl FUN_0200DD60
	b _021ECDF4
_021ECD92:
	ldr r0, _021ECE44 @ =0x00000139
	movs r3, #0xf0
	ldrb r2, [r5, r0]
	bics r2, r3
	adds r3, r6, #4
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x18
	orrs r2, r3
	strb r2, [r5, r0]
	lsrs r2, r6, #0x1f
	lsls r0, r6, #0x1f
	subs r0, r0, r2
	rors r0, r1
	adds r1, r2, r0
	adds r2, r1, #0
	ldr r1, _021ECE50 @ =0x021D114C
	movs r0, #0x68
	muls r2, r0, r2
	ldrh r3, [r1, #0x20]
	adds r2, #0x28
	subs r3, r2, r3
	adds r2, r0, #0
	adds r2, #0xd6
	strh r3, [r5, r2]
	lsrs r2, r6, #1
	movs r3, #0x15
	muls r3, r2, r3
	ldrh r1, [r1, #0x22]
	adds r3, #0x1f
	adds r0, #0xd8
	subs r1, r3, r1
	strh r1, [r5, r0]
	adds r1, r6, #0
	adds r1, #0x18
	movs r0, #0x28
	muls r0, r1, r0
	adds r0, r7, r0
	ldr r0, [r0, #0x20]
	movs r1, #1
	bl FUN_0200DD60
	lsls r0, r6, #4
	adds r0, r5, r0
	ldr r0, [r0, #0x44]
	movs r1, #0
	bl FUN_02013820
_021ECDF4:
	movs r1, #0x4f
	lsls r1, r1, #2
	ldrb r2, [r5, r1]
	movs r0, #0x7f
	bics r2, r0
	movs r0, #2
	orrs r0, r2
	strb r0, [r5, r1]
	ldr r0, _021ECE4C @ =0x00000947
	bl FUN_0200604C
	movs r0, #0
	add sp, #0x1c
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_021ECE12:
	lsrs r2, r4, #0x1f
	lsls r1, r4, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r1, r2, r1
	cmp r1, #1
	bne _021ECE3C
	adds r2, r4, r2
	asrs r1, r2, #1
	strh r1, [r5, #0x16]
	adds r0, #0xf9
	ldr r0, [r5, r0]
	ldrh r0, [r0]
	strh r0, [r5, #0x2c]
	ldr r0, _021ECE54 @ =0x00000941
	bl FUN_0200604C
	add sp, #0x1c
	movs r0, #0xb
	pop {r4, r5, r6, r7, pc}
_021ECE3C:
	subs r0, #0x20
_021ECE3E:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021ECE44: .4byte 0x00000139
_021ECE48: .4byte 0x021F7EF4
_021ECE4C: .4byte 0x00000947
_021ECE50: .4byte 0x021D114C
_021ECE54: .4byte 0x00000941
	thumb_func_end ov101_021ECC58

	thumb_func_start ov101_021ECE58
ov101_021ECE58: @ 0x021ECE58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E73C8
	ldr r0, [r4, #0x10]
	ldr r1, _021ECEA4 @ =0x0000FFFF
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E7128
	ldr r0, [r4, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	bl FUN_021E733C
	adds r2, r0, #0
	ldr r0, [r4, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	bl FUN_021E72F8
	ldr r0, [r4, #0x10]
	ldr r1, _021ECEA4 @ =0x0000FFFF
	ldr r0, [r0, #0x7c]
	movs r2, #1
	bl FUN_021E7414
	movs r1, #0x4f
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x7f
	bics r2, r0
	strb r2, [r4, r1]
	pop {r4, pc}
	nop
_021ECEA4: .4byte 0x0000FFFF
	thumb_func_end ov101_021ECE58

	thumb_func_start ov101_021ECEA8
ov101_021ECEA8: @ 0x021ECEA8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _021ECF8C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _021ECF06
	ldr r0, _021ECF90 @ =0x00000941
	bl FUN_0200604C
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x7c]
	bl FUN_021E7334
	adds r6, r0, #0
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	bl FUN_021E733C
	movs r1, #0x47
	lsls r1, r1, #2
	adds r4, r0, #0
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _021ECEEE
	subs r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r5, #0
	ldrh r1, [r1]
	bl ov101_021ED64C
	movs r1, #0x47
	lsls r1, r1, #2
	str r0, [r5, r1]
_021ECEEE:
	movs r0, #0x47
	lsls r0, r0, #2
	lsls r1, r4, #0x17
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	bl ov101_021ED750
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021EAE54
_021ECF06:
	ldr r0, _021ECF8C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _021ECF24
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov101_021ECE58
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021ECF24:
	bl FUN_02025358
	cmp r0, #0
	beq _021ECF54
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov101_021ECE58
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	beq _021ECF4E
	adds r0, r5, #0
	bl ov101_021EB364
	ldr r0, [r5, #0x10]
	movs r1, #1
	str r1, [r0, #0xc]
_021ECF4E:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021ECF54:
	ldr r0, _021ECF8C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0x20
	tst r0, r1
	beq _021ECF70
	ldr r0, _021ECF94 @ =0x0000093F
	bl FUN_0200604C
	ldr r0, [r5, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E73AC
	b _021ECF86
_021ECF70:
	movs r0, #0x10
	tst r0, r1
	beq _021ECF86
	ldr r0, _021ECF94 @ =0x0000093F
	bl FUN_0200604C
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	bl FUN_021E73AC
_021ECF86:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021ECF8C: .4byte 0x021D110C
_021ECF90: .4byte 0x00000941
_021ECF94: .4byte 0x0000093F
	thumb_func_end ov101_021ECEA8

	thumb_func_start ov101_021ECF98
ov101_021ECF98: @ 0x021ECF98
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_0202534C
	cmp r0, #0
	beq _021ECFA6
	b _021ED0C8
_021ECFA6:
	ldr r2, _021ED100 @ =0x021D114C
	ldr r0, _021ED104 @ =0x021F7EB8
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl FUN_0202539C
	adds r5, r0, #0
	ldr r0, _021ED108 @ =0x00000948
	bl FUN_0200604C
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _021ED028
	ldr r0, _021ED10C @ =0x00000139
	adds r1, r4, #0
	ldrb r0, [r4, r0]
	adds r1, #0x84
	ldr r1, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	adds r2, r0, #0
	ldr r3, [r1, #8]
	adds r2, #0x1c
	movs r1, #0x28
	muls r1, r2, r1
	adds r2, r3, r1
	movs r1, #0x18
	muls r1, r0, r1
	adds r1, #0x28
	strh r1, [r2, #4]
	movs r0, #0x84
	strh r0, [r2, #6]
	movs r1, #4
	movs r3, #6
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl FUN_0200DD88
	ldr r1, _021ED10C @ =0x00000139
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	adds r0, #0x84
	ldr r0, [r0]
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x1c
	ldr r0, [r0, #8]
	adds r2, #0x1c
	movs r1, #0x28
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r0, [r0, #0x20]
	movs r1, #4
	bl FUN_0200DD60
	movs r1, #0x4f
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x7f
	bics r2, r0
	movs r0, #0
	strb r2, [r4, r1]
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021ED028:
	movs r1, #0x47
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021ED044
	subs r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, #0
	ldrh r1, [r1]
	bl ov101_021ED64C
	movs r1, #0x47
	lsls r1, r1, #2
	str r0, [r4, r1]
_021ED044:
	movs r2, #0x47
	lsls r2, r2, #2
	ldr r0, [r4, r2]
	adds r2, #0x1d
	ldrb r2, [r4, r2]
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1c
	bl ov101_021ED750
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021EAE54
	ldr r0, _021ED10C @ =0x00000139
	adds r1, r4, #0
	ldrb r0, [r4, r0]
	adds r1, #0x84
	ldr r1, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	adds r2, r0, #0
	ldr r3, [r1, #8]
	adds r2, #0x1c
	movs r1, #0x28
	muls r1, r2, r1
	adds r2, r3, r1
	movs r1, #0x18
	muls r1, r0, r1
	adds r1, #0x28
	strh r1, [r2, #4]
	movs r0, #0x84
	strh r0, [r2, #6]
	movs r1, #4
	movs r3, #6
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl FUN_0200DD88
	ldr r1, _021ED10C @ =0x00000139
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	adds r0, #0x84
	ldr r0, [r0]
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x1c
	ldr r0, [r0, #8]
	adds r2, #0x1c
	movs r1, #0x28
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r0, [r0, #0x20]
	movs r1, #4
	bl FUN_0200DD60
	movs r1, #0x4f
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x7f
	bics r2, r0
	movs r0, #0
	strb r2, [r4, r1]
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021ED0C8:
	ldr r2, _021ED10C @ =0x00000139
	adds r1, r4, #0
	ldrb r2, [r4, r2]
	adds r1, #0x84
	ldr r0, _021ED100 @ =0x021D114C
	ldr r1, [r1]
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x1c
	ldrh r3, [r0, #0x22]
	ldr r1, [r1, #8]
	adds r4, #0x1c
	movs r2, #0x28
	muls r2, r4, r2
	adds r2, r1, r2
	ldrh r0, [r0, #0x20]
	movs r1, #4
	strh r0, [r2, #4]
	strh r3, [r2, #6]
	movs r3, #6
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl FUN_0200DD88
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	nop
_021ED100: .4byte 0x021D114C
_021ED104: .4byte 0x021F7EB8
_021ED108: .4byte 0x00000948
_021ED10C: .4byte 0x00000139
	thumb_func_end ov101_021ECF98

	thumb_func_start ov101_021ED110
ov101_021ED110: @ 0x021ED110
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	bne _021ED126
	movs r0, #0x47
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r2, #0
	bl ov101_021ED760
	b _021ED132
_021ED126:
	movs r0, #0x47
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r2, #0
	bl ov101_021ED7B0
_021ED132:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _021ED14E
	movs r1, #0x47
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov101_021ED6B8
	movs r0, #0x47
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_021ED14E:
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021EAE54
	pop {r4, pc}
	thumb_func_end ov101_021ED110

	thumb_func_start ov101_021ED158
ov101_021ED158: @ 0x021ED158
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _021ED1FC @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _021ED1A0
	ldr r0, _021ED200 @ =0x00000946
	bl FUN_0200604C
	ldr r0, [r4, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	bl FUN_021E733C
	adds r2, r0, #0
	lsrs r5, r2, #0x1f
	lsls r3, r2, #0x1f
	lsls r2, r2, #0x17
	subs r3, r3, r5
	movs r1, #0x1f
	rors r3, r1
	adds r1, r5, r3
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl ov101_021ED110
	adds r0, r4, #0
	bl ov101_021ECE58
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021ECA84
_021ED1A0:
	ldr r0, _021ED1FC @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _021ED1C2
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov101_021ECE58
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021ECA84
	b _021ED1F4
_021ED1C2:
	bl FUN_02025358
	cmp r0, #0
	beq _021ED1F4
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov101_021ECE58
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021ECA84
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	beq _021ED1F4
	adds r0, r4, #0
	bl ov101_021EB364
	ldr r0, [r4, #0x10]
	movs r1, #1
	str r1, [r0, #0xc]
_021ED1F4:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	nop
_021ED1FC: .4byte 0x021D110C
_021ED200: .4byte 0x00000946
	thumb_func_end ov101_021ED158

	thumb_func_start ov101_021ED204
ov101_021ED204: @ 0x021ED204
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	cmp r1, #4
	ldr r5, [r0, #8]
	bhs _021ED25C
	ldr r0, _021ED2BC @ =0x00000139
	movs r1, #0x28
	ldrb r0, [r6, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	adds r2, r0, #0
	adds r2, #0x14
	adds r4, r2, #0
	lsrs r6, r0, #0x1f
	lsls r3, r0, #0x1f
	subs r3, r3, r6
	movs r2, #0x1f
	rors r3, r2
	muls r4, r1, r4
	adds r3, r6, r3
	movs r2, #0x68
	muls r2, r3, r2
	lsrs r3, r0, #1
	movs r0, #0x15
	muls r0, r3, r0
	adds r1, r5, #4
	adds r2, #0x20
	strh r2, [r1, r4]
	adds r2, r5, #6
	adds r0, #0x20
	strh r0, [r2, r4]
	adds r5, #0x20
	ldrsh r1, [r1, r4]
	ldrsh r2, [r2, r4]
	ldr r0, [r5, r4]
	bl FUN_0200DD88
	ldr r0, [r5, r4]
	movs r1, #4
	bl FUN_0200DD60
	pop {r3, r4, r5, r6, r7, pc}
_021ED25C:
	subs r0, r1, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x18
	adds r4, r1, #0
	movs r0, #0x28
	muls r4, r0, r4
	lsrs r3, r7, #0x1f
	lsls r2, r7, #0x1f
	subs r2, r2, r3
	movs r0, #0x1f
	rors r2, r0
	adds r2, r3, r2
	movs r0, #0x68
	muls r0, r2, r0
	adds r1, r5, #4
	adds r0, #0x28
	strh r0, [r1, r4]
	adds r2, r5, #6
	lsrs r3, r7, #1
	movs r0, #0x15
	muls r0, r3, r0
	adds r0, #0x1f
	strh r0, [r2, r4]
	adds r5, #0x20
	ldrsh r1, [r1, r4]
	ldrsh r2, [r2, r4]
	ldr r0, [r5, r4]
	bl FUN_0200DD88
	ldr r0, [r5, r4]
	movs r1, #4
	bl FUN_0200DD60
	movs r1, #4
	adds r2, r1, #0
	adds r6, #0x44
	lsls r4, r7, #4
	ldr r0, [r6, r4]
	subs r2, #0xa
	bl FUN_020136B4
	ldr r0, [r6, r4]
	movs r1, #3
	bl FUN_02013820
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021ED2BC: .4byte 0x00000139
	thumb_func_end ov101_021ED204

	thumb_func_start ov101_021ED2C0
ov101_021ED2C0: @ 0x021ED2C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl FUN_0202534C
	cmp r0, #0
	beq _021ED2CE
	b _021ED3F8
_021ED2CE:
	ldr r2, _021ED480 @ =0x021D114C
	ldr r0, _021ED484 @ =0x021F7ECC
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl FUN_0202539C
	adds r2, r0, #0
	cmp r2, #8
	bne _021ED330
	ldr r0, _021ED488 @ =0x00000139
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x1c
	lsrs r5, r2, #0x1f
	lsls r3, r2, #0x1e
	lsls r1, r2, #0x16
	subs r3, r3, r5
	movs r2, #0x1e
	rors r3, r2
	adds r2, r5, r3
	lsls r2, r2, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl ov101_021ED110
	ldr r1, _021ED488 @ =0x00000139
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	bl ov101_021ED204
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021ECA84
	ldr r0, _021ED48C @ =0x00000946
	bl FUN_0200604C
	movs r1, #0x4f
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x7f
	bics r2, r0
	movs r0, #0
	strb r2, [r4, r1]
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021ED330:
	movs r0, #0
	mvns r0, r0
	cmp r2, r0
	beq _021ED352
	ldr r3, _021ED488 @ =0x00000139
	asrs r0, r2, #1
	ldrb r1, [r4, r3]
	lsrs r0, r0, #0x1e
	adds r0, r2, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	asrs r0, r0, #2
	lsrs r5, r1, #2
	cmp r5, r0
	bne _021ED352
	cmp r1, r2
	bne _021ED378
_021ED352:
	ldr r1, _021ED488 @ =0x00000139
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	bl ov101_021ED204
	ldr r0, _021ED490 @ =0x00000948
	bl FUN_0200604C
	movs r1, #0x4f
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x7f
	bics r2, r0
	movs r0, #0
	strb r2, [r4, r1]
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021ED378:
	cmp r0, #0
	bne _021ED3A4
	subs r3, #0x1d
	lsrs r5, r1, #0x1f
	lsls r1, r1, #0x1e
	ldr r0, [r4, r3]
	subs r1, r1, r5
	movs r3, #0x1e
	rors r1, r3
	adds r1, r5, r1
	lsrs r5, r2, #0x1f
	lsls r2, r2, #0x1e
	subs r2, r2, r5
	rors r2, r3
	adds r2, r5, r2
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl ov101_021ED780
	b _021ED3CA
_021ED3A4:
	subs r3, #0x1d
	lsrs r5, r1, #0x1f
	lsls r1, r1, #0x1e
	ldr r0, [r4, r3]
	subs r1, r1, r5
	movs r3, #0x1e
	rors r1, r3
	adds r1, r5, r1
	lsrs r5, r2, #0x1f
	lsls r2, r2, #0x1e
	subs r2, r2, r5
	rors r2, r3
	adds r2, r5, r2
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl ov101_021ED7D8
_021ED3CA:
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021EAE54
	ldr r1, _021ED488 @ =0x00000139
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	bl ov101_021ED204
	ldr r0, _021ED490 @ =0x00000948
	bl FUN_0200604C
	movs r1, #0x4f
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x7f
	bics r2, r0
	movs r0, #0
	strb r2, [r4, r1]
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021ED3F8:
	ldr r0, _021ED480 @ =0x021D114C
	movs r5, #5
	lsls r5, r5, #6
	ldrh r2, [r0, #0x22]
	ldrsh r1, [r4, r5]
	adds r3, r2, r1
	subs r2, r5, #7
	ldrb r2, [r4, r2]
	adds r1, r4, #0
	adds r1, #0x84
	ldr r1, [r1]
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x1c
	ldr r1, [r1, #8]
	adds r6, #0x14
	movs r2, #0x28
	muls r2, r6, r2
	adds r2, r1, r2
	ldrh r1, [r0, #0x20]
	subs r0, r5, #2
	ldrsh r0, [r4, r0]
	adds r0, r1, r0
	strh r0, [r2, #4]
	strh r3, [r2, #6]
	movs r1, #4
	movs r3, #6
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl FUN_0200DD88
	subs r0, r5, #7
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #4
	blo _021ED454
	subs r0, r0, #4
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #4
	adds r2, r1, #0
	ldr r0, [r0, #0x44]
	subs r2, #0xa
	bl FUN_020136B4
_021ED454:
	movs r0, #0x4f
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	ldr r2, _021ED480 @ =0x021D114C
	lsls r0, r0, #0x18
	ldrh r1, [r2, #0x20]
	lsrs r5, r0, #0x1f
	ldrh r2, [r2, #0x22]
	ldr r0, _021ED494 @ =0x021F7EEC
	bl FUN_020253F0
	cmp r5, r0
	beq _021ED478
	movs r1, #1
	adds r0, r4, #0
	eors r1, r5
	bl ov101_021ECA84
_021ED478:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
	nop
_021ED480: .4byte 0x021D114C
_021ED484: .4byte 0x021F7ECC
_021ED488: .4byte 0x00000139
_021ED48C: .4byte 0x00000946
_021ED490: .4byte 0x00000948
_021ED494: .4byte 0x021F7EEC
	thumb_func_end ov101_021ED2C0

	thumb_func_start ov101_021ED498
ov101_021ED498: @ 0x021ED498
	movs r1, #0
	strb r1, [r0, #0x13]
	movs r1, #0xff
	strb r1, [r0, #0x12]
	ldrb r1, [r0, #0x12]
	ldr r3, _021ED4AC @ =FUN_0202F3DC
	strb r1, [r0, #0x11]
	strb r1, [r0, #0x10]
	bx r3
	nop
_021ED4AC: .4byte FUN_0202F3DC
	thumb_func_end ov101_021ED498

	thumb_func_start ov101_021ED4B0
ov101_021ED4B0: @ 0x021ED4B0
	push {r3, r4}
	ldr r3, _021ED4DC @ =0x0000022B
	movs r4, #0
	movs r2, #0x14
_021ED4B8:
	adds r1, r4, #0
	muls r1, r2, r1
	adds r1, r0, r1
	ldrb r1, [r1, r3]
	cmp r1, #0
	bne _021ED4CA
	adds r0, r4, #0
	pop {r3, r4}
	bx lr
_021ED4CA:
	adds r1, r4, #1
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r4, #0x64
	blo _021ED4B8
	movs r0, #0xff
	pop {r3, r4}
	bx lr
	nop
_021ED4DC: .4byte 0x0000022B
	thumb_func_end ov101_021ED4B0

	thumb_func_start ov101_021ED4E0
ov101_021ED4E0: @ 0x021ED4E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x28]
	bl FUN_0202EDF4
	str r0, [sp]
	ldr r0, _021ED5A0 @ =0x000009F1
	movs r1, #0xff
	strb r1, [r5, r0]
	ldrb r1, [r5, r0]
	subs r0, r0, #1
	movs r4, #0
	strb r1, [r5, r0]
	movs r0, #0x86
	lsls r0, r0, #2
	adds r6, r5, r0
	movs r7, #0x14
_021ED506:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r6, r0
	bl ov101_021ED498
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x64
	blo _021ED506
	movs r0, #0x86
	lsls r0, r0, #2
	movs r6, #0
	adds r0, r5, r0
	adds r7, r6, #0
	str r0, [sp, #4]
_021ED526:
	ldr r0, [sp]
	adds r1, r7, #0
	bl FUN_0202F4E8
	cmp r0, #0
	beq _021ED596
	movs r0, #0x14
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, [sp, #4]
	adds r2, r7, #0
	adds r4, r0, r1
	ldr r0, [sp]
	adds r1, r4, #0
	bl FUN_0202F514
	strb r6, [r4, #0x10]
	movs r0, #1
	strb r0, [r4, #0x13]
	movs r0, #0x9f
	lsls r0, r0, #4
	ldrb r0, [r5, r0]
	cmp r0, #0xff
	bne _021ED56A
	ldrb r1, [r4, #0x10]
	movs r0, #0x9f
	lsls r0, r0, #4
	strb r1, [r5, r0]
	ldrb r1, [r4, #0x10]
	adds r0, r0, #1
	strb r1, [r5, r0]
	movs r0, #0xff
	strb r0, [r4, #0x11]
	b _021ED586
_021ED56A:
	ldr r0, _021ED5A0 @ =0x000009F1
	ldr r1, _021ED5A0 @ =0x000009F1
	ldrb r0, [r5, r0]
	strb r0, [r4, #0x11]
	ldrb r2, [r5, r1]
	movs r1, #0x14
	ldrb r0, [r4, #0x10]
	muls r1, r2, r1
	adds r2, r5, r1
	ldr r1, _021ED5A4 @ =0x0000022A
	strb r0, [r2, r1]
	ldrb r1, [r4, #0x10]
	ldr r0, _021ED5A0 @ =0x000009F1
	strb r1, [r5, r0]
_021ED586:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0x64
	blo _021ED526
_021ED596:
	ldr r0, _021ED5A8 @ =0x000009F2
	strb r6, [r5, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021ED5A0: .4byte 0x000009F1
_021ED5A4: .4byte 0x0000022A
_021ED5A8: .4byte 0x000009F2
	thumb_func_end ov101_021ED4E0

	thumb_func_start ov101_021ED5AC
ov101_021ED5AC: @ 0x021ED5AC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7, #0x10]
	ldr r0, [r0, #0x28]
	bl FUN_0202EDF4
	adds r6, r0, #0
	movs r0, #0x9f
	lsls r0, r0, #4
	ldrb r0, [r7, r0]
	movs r5, #0
	cmp r0, #0xff
	beq _021ED5EE
	movs r1, #0x86
	lsls r1, r1, #2
	adds r1, r7, r1
	str r1, [sp]
_021ED5CE:
	movs r1, #0x14
	muls r1, r0, r1
	ldr r0, [sp]
	adds r2, r5, #0
	adds r4, r0, r1
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #1
	bl FUN_0202F53C
	ldrb r0, [r4, #0x12]
	cmp r0, #0xff
	bne _021ED5CE
_021ED5EE:
	ldr r0, _021ED610 @ =0x000009F2
	ldrb r0, [r7, r0]
	cmp r5, r0
	bhs _021ED60C
	ldr r4, _021ED610 @ =0x000009F2
_021ED5F8:
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0202F500
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r7, r4]
	cmp r5, r0
	blo _021ED5F8
_021ED60C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021ED610: .4byte 0x000009F2
	thumb_func_end ov101_021ED5AC

	thumb_func_start ov101_021ED614
ov101_021ED614: @ 0x021ED614
	push {r4, r5}
	cmp r1, #0
	bgt _021ED620
	movs r0, #0
	pop {r4, r5}
	bx lr
_021ED620:
	movs r2, #0x9f
	lsls r2, r2, #4
	ldrb r5, [r0, r2]
	cmp r5, #0xff
	beq _021ED644
	movs r2, #0x86
	lsls r2, r2, #2
	adds r4, r0, r2
	movs r2, #0x14
_021ED632:
	adds r3, r5, #0
	muls r3, r2, r3
	adds r0, r4, r3
	ldr r3, [r4, r3]
	cmp r3, r1
	beq _021ED646
	ldrb r5, [r0, #0x12]
	cmp r5, #0xff
	bne _021ED632
_021ED644:
	movs r0, #0
_021ED646:
	pop {r4, r5}
	bx lr
	.align 2, 0
	thumb_func_end ov101_021ED614

	thumb_func_start ov101_021ED64C
ov101_021ED64C: @ 0x021ED64C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov101_021ED614
	cmp r0, #0
	bne _021ED6B6
	adds r0, r5, #0
	bl ov101_021ED4B0
	cmp r0, #0xff
	bne _021ED66C
	bl FUN_0202551C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021ED66C:
	movs r1, #0x86
	lsls r1, r1, #2
	movs r3, #0x14
	adds r7, r0, #0
	adds r2, r5, r1
	muls r7, r3, r7
	adds r3, r2, r7
	strb r0, [r3, #0x10]
	movs r6, #1
	strb r6, [r3, #0x13]
	str r4, [r2, r7]
	movs r2, #0x9f
	lsls r2, r2, #4
	ldrb r4, [r5, r2]
	cmp r4, #0xff
	bne _021ED69C
	adds r1, r2, #1
	strb r0, [r5, r1]
	adds r0, r1, #0
	ldrb r0, [r5, r0]
	strb r0, [r5, r2]
	movs r0, #0xff
	strb r0, [r3, #0x11]
	b _021ED6B4
_021ED69C:
	adds r4, r2, #1
	ldrb r6, [r5, r4]
	movs r4, #0x14
	adds r1, #0x12
	muls r4, r6, r4
	adds r4, r5, r4
	strb r0, [r4, r1]
	adds r1, r2, #1
	ldrb r1, [r5, r1]
	strb r1, [r3, #0x11]
	adds r1, r2, #1
	strb r0, [r5, r1]
_021ED6B4:
	adds r0, r3, #0
_021ED6B6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021ED64C

	thumb_func_start ov101_021ED6B8
ov101_021ED6B8: @ 0x021ED6B8
	push {r4, r5, r6, lr}
	adds r3, r1, #0
	bne _021ED6C2
	movs r0, #0
	pop {r4, r5, r6, pc}
_021ED6C2:
	movs r1, #0x9f
	lsls r1, r1, #4
	ldrb r4, [r3, #0x10]
	ldrb r2, [r0, r1]
	cmp r4, r2
	bne _021ED6FE
	ldrb r5, [r3, #0x12]
	cmp r5, #0xff
	bne _021ED6E0
	movs r4, #0xff
	adds r2, r1, #1
	strb r4, [r0, r2]
	ldrb r2, [r0, r2]
	strb r2, [r0, r1]
	b _021ED742
_021ED6E0:
	movs r4, #0x14
	adds r2, r5, #0
	muls r2, r4, r2
	adds r5, r0, r2
	movs r2, #0x8a
	lsls r2, r2, #2
	ldrb r5, [r5, r2]
	strb r5, [r0, r1]
	ldrb r5, [r3, #0x12]
	movs r1, #0xff
	muls r4, r5, r4
	adds r4, r0, r4
	adds r0, r2, #1
	strb r1, [r4, r0]
	b _021ED742
_021ED6FE:
	adds r2, r1, #1
	ldrb r2, [r0, r2]
	cmp r4, r2
	bne _021ED726
	ldrb r4, [r3, #0x11]
	movs r5, #0x14
	movs r2, #0xff
	adds r6, r4, #0
	muls r6, r5, r6
	ldr r4, _021ED74C @ =0x0000022A
	adds r6, r0, r6
	strb r2, [r6, r4]
	ldrb r2, [r3, #0x11]
	adds r1, r1, #1
	muls r5, r2, r5
	adds r5, r0, r5
	subs r2, r4, #2
	ldrb r2, [r5, r2]
	strb r2, [r0, r1]
	b _021ED742
_021ED726:
	ldrb r2, [r3, #0x11]
	ldrb r1, [r3, #0x12]
	movs r4, #0x14
	adds r5, r2, #0
	muls r5, r4, r5
	ldr r2, _021ED74C @ =0x0000022A
	adds r5, r0, r5
	strb r1, [r5, r2]
	ldrb r5, [r3, #0x12]
	ldrb r1, [r3, #0x11]
	muls r4, r5, r4
	adds r4, r0, r4
	subs r0, r2, #1
	strb r1, [r4, r0]
_021ED742:
	adds r0, r3, #0
	bl ov101_021ED498
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_021ED74C: .4byte 0x0000022A
	thumb_func_end ov101_021ED6B8

	thumb_func_start ov101_021ED750
ov101_021ED750: @ 0x021ED750
	cmp r0, #0
	bne _021ED758
	movs r0, #0
	bx lr
_021ED758:
	adds r0, r0, r1
	strb r2, [r0, #4]
	movs r0, #1
	bx lr
	thumb_func_end ov101_021ED750

	thumb_func_start ov101_021ED760
ov101_021ED760: @ 0x021ED760
	push {r3, lr}
	cmp r0, #0
	bne _021ED76A
	movs r0, #0
	pop {r3, pc}
_021ED76A:
	movs r2, #0xf
	adds r1, r0, r1
	strb r2, [r1, #4]
	bl FUN_0202F400
	cmp r0, #0
	beq _021ED77C
	movs r0, #1
	pop {r3, pc}
_021ED77C:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov101_021ED760

	thumb_func_start ov101_021ED780
ov101_021ED780: @ 0x021ED780
	push {r3, r4}
	cmp r0, #0
	bne _021ED78C
	movs r0, #0
	pop {r3, r4}
	bx lr
_021ED78C:
	adds r4, r0, #4
	ldrb r3, [r4, r1]
	ldrb r0, [r4, r2]
	strb r0, [r4, r1]
	strb r3, [r4, r2]
	movs r0, #1
	pop {r3, r4}
	bx lr
	thumb_func_end ov101_021ED780

	thumb_func_start ov101_021ED79C
ov101_021ED79C: @ 0x021ED79C
	cmp r0, #0
	bne _021ED7A4
	movs r0, #0
	bx lr
_021ED7A4:
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r2, [r0, #8]
	movs r0, #1
	bx lr
	.align 2, 0
	thumb_func_end ov101_021ED79C

	thumb_func_start ov101_021ED7B0
ov101_021ED7B0: @ 0x021ED7B0
	push {r3, lr}
	cmp r0, #0
	bne _021ED7BA
	movs r0, #0
	pop {r3, pc}
_021ED7BA:
	lsls r1, r1, #1
	ldr r2, _021ED7D4 @ =0x0000FFFF
	adds r1, r0, r1
	strh r2, [r1, #8]
	bl FUN_0202F400
	cmp r0, #0
	beq _021ED7CE
	movs r0, #1
	pop {r3, pc}
_021ED7CE:
	movs r0, #0
	pop {r3, pc}
	nop
_021ED7D4: .4byte 0x0000FFFF
	thumb_func_end ov101_021ED7B0

	thumb_func_start ov101_021ED7D8
ov101_021ED7D8: @ 0x021ED7D8
	push {r3, r4}
	cmp r0, #0
	bne _021ED7E4
	movs r0, #0
	pop {r3, r4}
	bx lr
_021ED7E4:
	adds r0, #8
	lsls r4, r1, #1
	lsls r2, r2, #1
	ldrh r3, [r0, r4]
	ldrh r1, [r0, r2]
	strh r1, [r0, r4]
	strh r3, [r0, r2]
	movs r0, #1
	pop {r3, r4}
	bx lr
	thumb_func_end ov101_021ED7D8

	thumb_func_start ov101_021ED7F8
ov101_021ED7F8: @ 0x021ED7F8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	adds r5, r0, #0
	ldr r0, _021ED8A4 @ =0x00000064
	movs r1, #2
	bl FUN_02006FF8
	ldr r0, _021ED8A8 @ =0x0000001A
	movs r1, #2
	bl FUN_02006FF8
	movs r2, #1
	movs r0, #3
	movs r1, #0x5b
	lsls r2, r2, #0x12
	bl FUN_0201A910
	ldr r1, _021ED8AC @ =0x000009F4
	adds r0, r4, #0
	movs r2, #0x5b
	bl FUN_02007280
	ldr r2, _021ED8AC @ =0x000009F4
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x5b
	movs r1, #0xcc
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0xcc
	str r0, [r4, #0x10]
	blx FUN_020E5B44
	movs r1, #0x5b
	str r1, [r4]
	ldr r0, [r4, #0x10]
	str r1, [r0]
	ldr r0, [r4, #0x10]
	str r5, [r0, #0x20]
	ldr r1, [r4, #0x10]
	ldr r0, [r1, #0x20]
	ldr r0, [r0, #0x24]
	str r0, [r1, #0x24]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl FUN_0202ED7C
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x28]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl FUN_020503D0
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x2c]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl FUN_02028EA8
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl FUN_02028E9C
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x34]
	adds r0, r4, #0
	bl ov101_021ED980
	movs r0, #0x85
	ldr r1, _021ED8B0 @ =0x021F7372
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r1, #0x64
	adds r0, r1, #0
	adds r0, #0xd2
	strb r1, [r4, r0]
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021ED8A4: .4byte 0x00000064
_021ED8A8: .4byte 0x0000001A
_021ED8AC: .4byte 0x000009F4
_021ED8B0: .4byte 0x021F7372
	thumb_func_end ov101_021ED7F8

	thumb_func_start ov101_021ED8B4
ov101_021ED8B4: @ 0x021ED8B4
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	cmp r1, #0xd
	bhi _021ED91E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021ED8CE: @ jump table
	.2byte _021ED8EA - _021ED8CE - 2 @ case 0
	.2byte _021ED8F2 - _021ED8CE - 2 @ case 1
	.2byte _021ED8FA - _021ED8CE - 2 @ case 2
	.2byte _021ED91E - _021ED8CE - 2 @ case 3
	.2byte _021ED90A - _021ED8CE - 2 @ case 4
	.2byte _021ED912 - _021ED8CE - 2 @ case 5
	.2byte _021ED91E - _021ED8CE - 2 @ case 6
	.2byte _021ED91E - _021ED8CE - 2 @ case 7
	.2byte _021ED91E - _021ED8CE - 2 @ case 8
	.2byte _021ED91E - _021ED8CE - 2 @ case 9
	.2byte _021ED91E - _021ED8CE - 2 @ case 10
	.2byte _021ED91E - _021ED8CE - 2 @ case 11
	.2byte _021ED902 - _021ED8CE - 2 @ case 12
	.2byte _021ED91A - _021ED8CE - 2 @ case 13
_021ED8EA:
	bl ov101_021EDB1C
	str r0, [r4]
	b _021ED91E
_021ED8F2:
	bl ov101_021EDB30
	str r0, [r4]
	b _021ED91E
_021ED8FA:
	bl ov101_021EDBD4
	str r0, [r4]
	b _021ED91E
_021ED902:
	bl ov101_021EDBFC
	str r0, [r4]
	b _021ED91E
_021ED90A:
	bl ov101_021EDC04
	str r0, [r4]
	b _021ED91E
_021ED912:
	bl ov101_021EDC70
	str r0, [r4]
	b _021ED91E
_021ED91A:
	movs r0, #1
	pop {r4, pc}
_021ED91E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021ED8B4

	thumb_func_start ov101_021ED924
ov101_021ED924: @ 0x021ED924
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov101_021EDAF8
	ldr r0, [r4, #0x38]
	bl FUN_0203B0C8
	ldr r2, [r4, #0x10]
	ldr r0, [r2, #0x1c]
	cmp r0, #6
	beq _021ED948
	ldrb r1, [r2, #5]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2, #5]
_021ED948:
	ldr r0, [r4, #0x10]
	movs r1, #0
	movs r2, #0xcc
	blx FUN_020D4994
	ldr r0, [r4, #0x10]
	bl FUN_0201AB0C
	ldr r4, [r4]
	adds r0, r5, #0
	bl FUN_02007294
	adds r0, r4, #0
	bl FUN_0201A9C4
	ldr r0, _021ED978 @ =0x0000001A
	bl FUN_02006F7C
	ldr r0, _021ED97C @ =0x00000064
	bl FUN_02006F7C
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021ED978: .4byte 0x0000001A
_021ED97C: .4byte 0x00000064
	thumb_func_end ov101_021ED924

	thumb_func_start ov101_021ED980
ov101_021ED980: @ 0x021ED980
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x10]
	str r4, [r1, #0x64]
	ldr r2, [r4, #0x10]
	ldr r1, [r2, #0x20]
	ldrb r1, [r1, #1]
	str r1, [r2, #0xc]
	ldr r1, [r4, #0x10]
	ldr r2, _021EDAE8 @ =ov101_021EB338
	ldr r1, [r1, #0x20]
	ldrb r1, [r1]
	adds r1, r1, #1
	strb r1, [r4, #0xd]
	ldr r1, [r4, #0x10]
	str r2, [r1, #0x5c]
	ldr r2, _021EDAEC @ =ov101_021EB2FC
	ldr r1, [r4, #0x10]
	str r2, [r1, #0x60]
	bl ov101_021ED4E0
	movs r1, #0x4e
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x10
	bics r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	movs r0, #0xe
	bics r2, r0
	strb r2, [r4, r1]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x28]
	bl FUN_0202EE70
	movs r2, #0x4e
	lsls r2, r2, #2
	lsls r0, r0, #0x1e
	ldrb r3, [r4, r2]
	movs r1, #0x60
	lsrs r0, r0, #0x19
	bics r3, r1
	orrs r0, r3
	strb r0, [r4, r2]
	ldr r0, [r4]
	bl FUN_0203B094
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl FUN_0202ED88
	movs r1, #0x49
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	bl FUN_02095EF8
	movs r1, #0x4a
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x10]
	ldr r1, [r4]
	ldr r0, [r0, #0x28]
	bl FUN_0202EF44
	movs r1, #0x4b
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x28]
	bl FUN_0202EEC0
	movs r2, #0x13
	lsls r2, r2, #4
	strb r0, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	adds r0, #0x22
	ldrb r1, [r0]
	adds r0, r2, #0
	subs r0, #0x28
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	adds r0, #0x23
	ldrb r0, [r0]
	adds r1, r0, #2
	adds r0, r2, #0
	subs r0, #0x26
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	ldrh r1, [r0, #0x10]
	adds r0, r2, #0
	subs r0, #0x24
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	ldrb r1, [r0, #7]
	adds r0, r2, #0
	subs r0, #0x22
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	adds r0, #0x22
	ldrb r1, [r0]
	adds r0, r2, #0
	subs r0, #0x20
	strh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x20]
	adds r0, #0x23
	ldrb r0, [r0]
	adds r1, r0, #2
	adds r0, r2, #0
	subs r0, #0x1e
	strh r1, [r4, r0]
	movs r1, #1
	adds r0, r1, #0
	adds r0, #0xff
	strh r1, [r4, r0]
	adds r0, r2, #0
	subs r0, #0x2c
	strh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #8
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1e
	lsls r1, r0, #1
	ldr r0, _021EDAF0 @ =0x021F7F3C
	ldrh r1, [r0, r1]
	adds r0, r2, #0
	subs r0, #0x2e
	strh r1, [r4, r0]
	movs r1, #0x11
	adds r0, r1, #0
	adds r0, #0xf5
	strh r1, [r4, r0]
	movs r1, #0x20
	adds r0, r2, #2
	strb r1, [r4, r0]
	movs r1, #8
	adds r0, r2, #1
	strb r1, [r4, r0]
	movs r1, #0
	adds r0, r2, #3
	strb r1, [r4, r0]
	subs r1, #0x18
	adds r0, r2, #4
	strb r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xd
	ldrb r0, [r4, r0]
	movs r1, #2
	adds r2, #0xd
	orrs r0, r1
	strb r0, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r2, #0xf
	ldr r0, [r0, #0x2c]
	bl FUN_02066930
	ldr r3, _021EDAF4 @ =0x0000013D
	movs r2, #1
	ldrb r1, [r4, r3]
	lsls r0, r0, #0x18
	bics r1, r2
	lsrs r2, r0, #0x18
	movs r0, #1
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, r3]
	ldr r0, [r4, #0x10]
	bl FUN_021E5C80
	strb r0, [r4, #0xe]
	pop {r4, pc}
	nop
_021EDAE8: .4byte ov101_021EB338
_021EDAEC: .4byte ov101_021EB2FC
_021EDAF0: .4byte 0x021F7F3C
_021EDAF4: .4byte 0x0000013D
	thumb_func_end ov101_021ED980

	thumb_func_start ov101_021EDAF8
ov101_021EDAF8: @ 0x021EDAF8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02095F68
	ldr r0, [r4, #0x10]
	movs r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0x10]
	str r1, [r0, #0x60]
	pop {r4, pc}
	thumb_func_end ov101_021EDAF8

	thumb_func_start ov101_021EDB1C
ov101_021EDB1C: @ 0x021EDB1C
	push {r3, lr}
	bl ov101_021EDCE0
	cmp r0, #0
	beq _021EDB2A
	movs r0, #4
	pop {r3, pc}
_021EDB2A:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov101_021EDB1C

	thumb_func_start ov101_021EDB30
ov101_021EDB30: @ 0x021EDB30
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	ldr r1, _021EDBC8 @ =0x00000139
	adds r4, r0, #0
	ldrb r1, [r4, r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1f
	bne _021EDB4C
	add r1, sp, #0
	bl ov101_021EBC1C
	b _021EDB54
_021EDB4C:
	bl ov101_021EC0AC
	movs r1, #1
	str r1, [sp]
_021EDB54:
	ldr r1, [sp]
	cmp r1, #0
	beq _021EDB84
	ldr r1, [r4, #0x10]
	movs r2, #1
	str r2, [r1, #0xc]
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x1c]
	subs r1, r2, #2
	cmp r0, r1
	beq _021EDB7E
	cmp r0, #4
	beq _021EDB78
	cmp r0, #8
	bne _021EDB7E
	add sp, #4
	movs r0, #0xc
	pop {r3, r4, pc}
_021EDB78:
	add sp, #4
	movs r0, #5
	pop {r3, r4, pc}
_021EDB7E:
	add sp, #4
	movs r0, #1
	pop {r3, r4, pc}
_021EDB84:
	ldr r0, _021EDBCC @ =0x021D110C
	ldr r1, [r0, #0x48]
	ldr r0, _021EDBD0 @ =0x00000CF3
	tst r0, r1
	beq _021EDB94
	ldr r0, [r4, #0x10]
	movs r1, #0
	str r1, [r0, #0xc]
_021EDB94:
	adds r0, r4, #0
	bl ov101_021EB94C
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x1c]
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021EDBBA
	cmp r0, #4
	beq _021EDBB4
	cmp r0, #8
	bne _021EDBBA
	add sp, #4
	movs r0, #0xc
	pop {r3, r4, pc}
_021EDBB4:
	add sp, #4
	movs r0, #5
	pop {r3, r4, pc}
_021EDBBA:
	adds r0, r4, #0
	bl ov101_021EC304
	movs r0, #1
	add sp, #4
	pop {r3, r4, pc}
	nop
_021EDBC8: .4byte 0x00000139
_021EDBCC: .4byte 0x021D110C
_021EDBD0: .4byte 0x00000CF3
	thumb_func_end ov101_021EDB30

	thumb_func_start ov101_021EDBD4
ov101_021EDBD4: @ 0x021EDBD4
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021EDDB0
	cmp r0, #0
	bne _021EDBE4
	movs r0, #2
	pop {r4, pc}
_021EDBE4:
	ldr r2, [r4, #0x10]
	adds r4, #0x14
	adds r2, #0x3c
	movs r1, #0xe
_021EDBEC:
	ldrh r0, [r4]
	adds r4, r4, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _021EDBEC
	movs r0, #0xd
	pop {r4, pc}
	thumb_func_end ov101_021EDBD4

	thumb_func_start ov101_021EDBFC
ov101_021EDBFC: @ 0x021EDBFC
	ldr r3, _021EDC00 @ =ov101_021EDDF4
	bx r3
	.align 2, 0
_021EDC00: .4byte ov101_021EDDF4
	thumb_func_end ov101_021EDBFC

	thumb_func_start ov101_021EDC04
ov101_021EDC04: @ 0x021EDC04
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EDC16
	cmp r0, #1
	beq _021EDC58
	b _021EDC6A
_021EDC16:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r4, #0
	movs r6, #1
_021EDC30:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #8
	blt _021EDC30
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021EDC6A
_021EDC58:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021EDC6A
	movs r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_021EDC6A:
	movs r0, #4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov101_021EDC04

	thumb_func_start ov101_021EDC70
ov101_021EDC70: @ 0x021EDC70
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EDC82
	cmp r0, #1
	beq _021EDCA2
	b _021EDCD8
_021EDC82:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021EDCD8
_021EDCA2:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021EDCD8
	movs r4, #0
	adds r6, r4, #0
_021EDCAE:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #8
	blt _021EDCAE
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	movs r0, #2
	pop {r3, r4, r5, r6, pc}
_021EDCD8:
	movs r0, #5
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021EDC70

	thumb_func_start ov101_021EDCE0
ov101_021EDCE0: @ 0x021EDCE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #4
	bhi _021EDD94
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021EDCF6: @ jump table
	.2byte _021EDD00 - _021EDCF6 - 2 @ case 0
	.2byte _021EDD94 - _021EDCF6 - 2 @ case 1
	.2byte _021EDD50 - _021EDCF6 - 2 @ case 2
	.2byte _021EDD68 - _021EDCF6 - 2 @ case 3
	.2byte _021EDD7A - _021EDCF6 - 2 @ case 4
_021EDD00:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021EDDA0 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021EDDA4 @ =0x04001000
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
	bl FUN_020210BC
	movs r0, #2
	bl FUN_02021148
	b _021EDD94
_021EDD50:
	bl ov101_021EDE4C
	adds r0, r4, #0
	bl ov101_021EDFF8
	adds r0, r4, #0
	bl ov101_021EE1C4
	adds r0, r4, #0
	bl ov101_021EE230
	b _021EDD94
_021EDD68:
	bl ov101_021EE394
	adds r0, r4, #0
	bl ov101_021EE410
	adds r0, r4, #0
	bl ov101_021EE350
	b _021EDD94
_021EDD7A:
	bl ov101_021EE670
	ldr r0, _021EDDA8 @ =0x021E65F5
	ldr r1, [r4, #0x10]
	bl FUN_0201A0FC
	ldr r1, _021EDDAC @ =ov101_021E9270
	ldr r0, [r4, #0x10]
	str r1, [r0, #0x58]
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021EDD94:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r4, pc}
	nop
_021EDDA0: .4byte 0xFFFFE0FF
_021EDDA4: .4byte 0x04001000
_021EDDA8: .4byte 0x021E65F5
_021EDDAC: .4byte ov101_021E9270
	thumb_func_end ov101_021EDCE0

	thumb_func_start ov101_021EDDB0
ov101_021EDDB0: @ 0x021EDDB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x10]
	movs r2, #0
	str r2, [r1, #0x58]
	bl ov101_021EE380
	adds r0, r4, #0
	bl ov101_021EE664
	adds r0, r4, #0
	bl ov101_021EE3D8
	adds r0, r4, #0
	bl ov101_021EE2E8
	adds r0, r4, #0
	bl ov101_021EE210
	adds r0, r4, #0
	bl ov101_021EE190
	adds r0, r4, #0
	bl ov101_021EDF54
	bl FUN_02021238
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EDDB0

	thumb_func_start ov101_021EDDF4
ov101_021EDDF4: @ 0x021EDDF4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0xc4
	ldr r0, [r0]
	bl FUN_020186A4
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _021EDE46
	adds r0, r5, #0
	adds r0, #0xc4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x27
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x19
	bl FUN_02018680
	ldr r1, [r5, #0x10]
	ldr r0, [r1, #0xc]
	cmp r4, r0
	beq _021EDE28
	str r4, [r1, #0xc]
_021EDE28:
	cmp r6, #0
	bne _021EDE38
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x20]
	str r1, [r0, #0x14]
	movs r0, #5
	pop {r4, r5, r6, pc}
_021EDE38:
	movs r1, #0
	adds r0, r5, #0
	mvns r1, r1
	bl ov101_021EB4C4
	movs r0, #1
	pop {r4, r5, r6, pc}
_021EDE46:
	movs r0, #0xc
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021EDDF4

	thumb_func_start ov101_021EDE4C
ov101_021EDE4C: @ 0x021EDE4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xf0
	adds r5, r0, #0
	bl FUN_021E5FDC
	ldr r0, [r5]
	bl FUN_0201AC88
	ldr r1, [r5, #0x10]
	ldr r2, _021EDF44 @ =0x04000304
	str r0, [r1, #0x74]
	ldrh r1, [r2]
	ldr r0, _021EDF48 @ =0xFFFF7FFF
	ldr r4, _021EDF4C @ =0x021F7F44
	ands r0, r1
	strh r0, [r2]
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r4, _021EDF50 @ =0x021F7F9C
	add r3, sp, #0x10
	movs r2, #0x1c
_021EDE84:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021EDE84
	ldr r0, [r5, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x74]
	add r2, sp, #0x10
	adds r3, r1, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x74]
	add r2, sp, #0x2c
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	add r2, sp, #0x48
	adds r3, r1, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0x10]
	movs r1, #3
	ldr r0, [r0, #0x74]
	add r2, sp, #0x64
	movs r3, #2
	bl FUN_0201B1E4
	ldr r0, [r5, #0x10]
	movs r1, #4
	ldr r0, [r0, #0x74]
	add r2, sp, #0x80
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0x10]
	movs r1, #5
	ldr r0, [r0, #0x74]
	add r2, sp, #0x9c
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0x10]
	movs r1, #6
	ldr r0, [r0, #0x74]
	add r2, sp, #0xb8
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0x10]
	movs r1, #7
	ldr r0, [r0, #0x74]
	add r2, sp, #0xd4
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #0xf
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0xf
	movs r1, #0
	bl FUN_02022CC8
	movs r4, #0
	movs r6, #0x20
	adds r7, r4, #0
_021EDF12:
	ldr r0, [r5, #0x10]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	lsls r0, r4, #0x18
	ldr r3, [r5]
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0201C1C4
	ldr r0, [r5, #0x10]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	adds r4, r4, #1
	cmp r4, #8
	blt _021EDF12
	add sp, #0xf0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EDF44: .4byte 0x04000304
_021EDF48: .4byte 0xFFFF7FFF
_021EDF4C: .4byte 0x021F7F44
_021EDF50: .4byte 0x021F7F9C
	thumb_func_end ov101_021EDE4C

	thumb_func_start ov101_021EDF54
ov101_021EDF54: @ 0x021EDF54
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #7
	ldr r3, [r4]
	movs r0, #1
	lsls r1, r1, #6
	movs r2, #0
	bl FUN_0201C290
	movs r1, #6
	ldr r3, [r4]
	movs r0, #5
	lsls r1, r1, #6
	movs r2, #0
	bl FUN_0201C290
	ldr r0, [r4, #0x10]
	movs r1, #7
	ldr r0, [r0, #0x74]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #6
	ldr r0, [r0, #0x74]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #5
	ldr r0, [r0, #0x74]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #4
	ldr r0, [r0, #0x74]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #3
	ldr r0, [r0, #0x74]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x74]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x74]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201AB0C
	ldr r2, _021EDFEC @ =0x04000304
	ldr r0, _021EDFF0 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	movs r1, #0
	ldr r0, _021EDFF4 @ =0x04000050
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp]
	blx FUN_020CF15C
	add sp, #4
	pop {r3, r4, pc}
	nop
_021EDFEC: .4byte 0x04000304
_021EDFF0: .4byte 0xFFFF7FFF
_021EDFF4: .4byte 0x04000050
	thumb_func_end ov101_021EDF54

	thumb_func_start ov101_021EDFF8
ov101_021EDFF8: @ 0x021EDFF8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x90
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #0x42
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	adds r2, r4, #0
	movs r3, #0x90
	bl FUN_0208820C
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	adds r2, r4, #0
	movs r3, #0x90
	bl FUN_0208820C
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	adds r2, r4, #0
	movs r3, #0x90
	bl FUN_0208820C
	movs r0, #0x44
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	adds r2, r4, #0
	movs r3, #0x90
	bl FUN_0208820C
	movs r0, #0xc
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	adds r2, r4, #0
	movs r3, #0x90
	bl FUN_0208820C
	movs r0, #0x3f
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	adds r2, r4, #0
	movs r3, #0x90
	bl FUN_0208820C
	movs r0, #0x3e
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	adds r2, r4, #0
	movs r3, #0x90
	bl FUN_0208820C
	movs r0, #0x41
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	adds r2, r4, #0
	movs r3, #0x90
	bl FUN_0208820C
	ldr r0, [r5]
	movs r3, #0x5b
	lsls r3, r3, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x45
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	movs r3, #0x55
	lsls r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	adds r3, #0x1c
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	movs r3, #0x56
	lsls r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	adds r3, #0x1c
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	movs r3, #0x57
	lsls r3, r3, #2
	str r0, [r5, r3]
	ldr r0, [r5]
	adds r3, #0x1c
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x43
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	movs r1, #0x16
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_0200770C
	ldr r0, [r5, #0x10]
	movs r1, #4
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r1, [r5]
	movs r0, #4
	bl FUN_02002CEC
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov101_021EDFF8

	thumb_func_start ov101_021EE190
ov101_021EE190: @ 0x021EE190
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #4
	bl FUN_02002DB4
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov101_021EE190

	thumb_func_start ov101_021EE1C4
ov101_021EE1C4: @ 0x021EE1C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r4, _021EE20C @ =0x021F7F54
	movs r6, #0
	adds r5, r7, r0
_021EE1D4:
	ldrb r0, [r4, #2]
	adds r1, r5, #0
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #4]
	str r0, [sp, #8]
	ldrb r0, [r4, #5]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x10]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r0, #0x74]
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #9
	blt _021EE1D4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021EE20C: .4byte 0x021F7F54
	thumb_func_end ov101_021EE1C4

	thumb_func_start ov101_021EE210
ov101_021EE210: @ 0x021EE210
	push {r3, r4, r5, lr}
	movs r1, #0x61
	lsls r1, r1, #2
	movs r4, #0
	adds r5, r0, r1
_021EE21A:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #9
	blt _021EE21A
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021EE210

	thumb_func_start ov101_021EE230
ov101_021EE230: @ 0x021EE230
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x1b
	adds r2, r1, #0
	ldr r3, [r4]
	movs r0, #0
	adds r2, #0xf6
	bl FUN_0200BAF8
	adds r1, r4, #0
	adds r1, #0x88
	str r0, [r1]
	ldr r2, [r4]
	movs r0, #2
	movs r1, #0x5b
	bl FUN_0200BD18
	adds r1, r4, #0
	adds r1, #0x8c
	str r0, [r1]
	ldr r1, [r4]
	movs r0, #0x5b
	bl FUN_02026354
	adds r1, r4, #0
	adds r1, #0x90
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200BBA0
	adds r1, r4, #0
	adds r1, #0x9c
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200BBA0
	adds r1, r4, #0
	adds r1, #0xa0
	str r0, [r1]
	ldr r1, [r4]
	movs r0, #0x28
	bl FUN_02026354
	adds r1, r4, #0
	adds r1, #0xa4
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #4
	bl FUN_0200BBA0
	adds r1, r4, #0
	adds r1, #0xa8
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #5
	bl FUN_0200BBA0
	adds r1, r4, #0
	adds r1, #0xac
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #6
	bl FUN_0200BBA0
	adds r1, r4, #0
	adds r1, #0xb0
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200BBA0
	adds r1, r4, #0
	adds r1, #0xb4
	str r0, [r1]
	movs r0, #2
	adds r4, #0xb8
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021EE230

	thumb_func_start ov101_021EE2E8
ov101_021EE2E8: @ 0x021EE2E8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xb4
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_0200BDA0
	adds r4, #0x88
	ldr r0, [r4]
	bl FUN_0200BB44
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EE2E8

	thumb_func_start ov101_021EE350
ov101_021EE350: @ 0x021EE350
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #2
	bl FUN_02014918
	adds r1, r5, #0
	adds r1, #0xc0
	str r0, [r1]
	movs r4, #0
_021EE364:
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xc0
	adds r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #7
	adds r3, r4, #0
	bl FUN_02014960
	adds r4, r4, #1
	cmp r4, #2
	blt _021EE364
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021EE350

	thumb_func_start ov101_021EE380
ov101_021EE380: @ 0x021EE380
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xc0
	ldr r0, [r0]
	bl FUN_02014950
	movs r0, #0
	adds r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021EE380

	thumb_func_start ov101_021EE394
ov101_021EE394: @ 0x021EE394
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_021E6914
	ldr r0, [r4, #0x10]
	movs r1, #2
	bl FUN_021E6978
	ldr r1, [r4]
	movs r0, #0x2a
	bl FUN_021E6E20
	adds r1, r4, #0
	adds r1, #0x84
	str r0, [r1]
	ldr r0, [r4, #0x10]
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_0200CF6C
	movs r2, #0xf
	movs r1, #0
	lsls r2, r2, #0x10
	bl FUN_02009FC8
	ldr r1, [r4, #0x10]
	ldr r0, [r4]
	ldr r1, [r1, #0x78]
	bl FUN_02018424
	adds r4, #0xbc
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021EE394

	thumb_func_start ov101_021EE3D8
ov101_021EE3D8: @ 0x021EE3D8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xbc
	ldr r0, [r0]
	bl FUN_02018474
	ldr r0, [r4, #0x10]
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_0200CF6C
	movs r2, #3
	movs r1, #0
	lsls r2, r2, #0x12
	bl FUN_02009FC8
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6E58
	ldr r0, [r4, #0x10]
	bl FUN_021E69C8
	ldr r0, [r4, #0x10]
	bl FUN_021E6950
	pop {r4, pc}
	thumb_func_end ov101_021EE3D8

	thumb_func_start ov101_021EE410
ov101_021EE410: @ 0x021EE410
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r6, #0
	ldr r0, [r0, #8]
	movs r7, #0x15
	str r0, [sp]
	adds r4, r0, #0
_021EE422:
	ldr r1, [r5, #0x10]
	ldr r2, _021EE64C @ =0x021F807C
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	lsrs r2, r6, #0x1f
	lsls r3, r6, #0x1f
	subs r3, r3, r2
	movs r1, #0x1f
	rors r3, r1
	adds r3, r2, r3
	adds r2, r6, r2
	movs r1, #0x68
	muls r1, r3, r1
	asrs r2, r2, #1
	adds r3, r2, #0
	muls r3, r7, r3
	adds r1, #0x20
	adds r3, #0xcb
	lsls r1, r1, #0x10
	lsls r2, r3, #0x10
	ldr r0, [r4, #0x20]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_0200DD3C
	adds r6, r6, #1
	adds r4, #0x28
	cmp r6, #4
	blt _021EE422
	ldr r1, [r5, #0x10]
	ldr r2, _021EE650 @ =0x021F80A4
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	ldr r0, [sp]
	movs r1, #0
	adds r0, #0xc0
	ldr r0, [r0]
	bl FUN_0200DD3C
	ldr r1, [r5, #0x10]
	ldr r2, _021EE654 @ =0x021F80CC
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	ldr r1, [r5, #0x10]
	ldr r2, _021EE658 @ =0x021F80F4
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	movs r7, #0
	ldr r6, [sp]
	adds r4, r7, #0
_021EE4E6:
	ldr r1, [r5, #0x10]
	ldr r2, _021EE65C @ =0x021F811C
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	cmp r7, #0
	ble _021EE51A
	adds r0, r4, #0
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021EE528
_021EE51A:
	adds r0, r4, #0
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021EE528:
	blx FUN_020F2104
	adds r1, r0, #0
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_020249B0
	movs r0, #1
	lsls r0, r0, #0xc
	adds r7, r7, #1
	adds r4, r4, r0
	adds r6, #0x28
	cmp r7, #4
	blt _021EE4E6
	ldr r7, _021EE64C @ =0x021F807C
	movs r6, #0
_021EE54A:
	ldr r1, [r5, #0x10]
	adds r3, r6, #5
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	movs r2, #0x28
	muls r2, r3, r2
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r7, r2
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, [sp]
	adds r4, r0, r1
	ldr r0, [r4, #0x20]
	adds r1, r4, #4
	adds r2, r4, #6
	bl FUN_0200DE00
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_0200DD3C
	ldr r0, [r4, #0x20]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_02024830
	adds r6, r6, #1
	cmp r6, #4
	blt _021EE54A
	movs r6, #0
	movs r7, #0x28
_021EE5A2:
	ldr r1, [r5, #0x10]
	ldr r2, _021EE660 @ =0x021F81E4
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6EC4
	adds r1, r0, #0
	ldr r0, [sp]
	muls r1, r7, r1
	adds r4, r0, r1
	ldr r0, [r4, #0x20]
	adds r1, r4, #4
	adds r2, r4, #6
	bl FUN_0200DE00
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_0202484C
	adds r6, r6, #1
	cmp r6, #0x1b
	blt _021EE5A2
	movs r4, #0
	movs r7, #0x28
_021EE5EC:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	ldr r0, [sp]
	muls r1, r7, r1
	adds r6, r0, r1
	ldr r0, [r6, #0x20]
	adds r1, r6, #4
	adds r2, r6, #6
	bl FUN_0200DE00
	ldr r0, [r6, #0x20]
	movs r1, #0
	bl FUN_02024830
	adds r4, r4, #1
	cmp r4, #0xb
	blt _021EE5EC
	ldr r0, [sp]
	movs r1, #1
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_0202484C
	movs r1, #0x11
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_0202484C
	movs r1, #0x11
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0x20]
	ldrb r1, [r1, #7]
	bl FUN_020249D4
	ldr r0, [sp]
	movs r1, #2
	adds r0, #0xe8
	str r0, [sp]
	ldr r0, [r0]
	bl FUN_0202487C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EE64C: .4byte 0x021F807C
_021EE650: .4byte 0x021F80A4
_021EE654: .4byte 0x021F80CC
_021EE658: .4byte 0x021F80F4
_021EE65C: .4byte 0x021F811C
_021EE660: .4byte 0x021F81E4
	thumb_func_end ov101_021EE410

	thumb_func_start ov101_021EE664
ov101_021EE664: @ 0x021EE664
	ldr r3, _021EE66C @ =FUN_021E6EF4
	adds r0, #0x84
	ldr r0, [r0]
	bx r3
	.align 2, 0
_021EE66C: .4byte FUN_021E6EF4
	thumb_func_end ov101_021EE664

	thumb_func_start ov101_021EE670
ov101_021EE670: @ 0x021EE670
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r0, #0x84
	ldr r0, [r0]
	movs r1, #4
	ldr r0, [r0, #8]
	movs r2, #8
	str r0, [sp, #0x1c]
	movs r0, #6
	str r0, [sp]
	ldr r0, _021EE8D8 @ =0x04000050
	movs r3, #0xa
	blx FUN_020CF15C
	movs r4, #0
	movs r6, #3
	adds r7, r4, #0
_021EE694:
	ldr r0, [r5, #0x10]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	ldr r0, [r5, #0x10]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	movs r2, #0
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0201BC8C
	adds r4, r4, #1
	cmp r4, #3
	blt _021EE694
	ldr r1, _021EE8DC @ =ov101_021EB338
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x5c]
	ldr r1, _021EE8E0 @ =ov101_021EB2FC
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x60]
	adds r0, r5, #0
	bl ov101_021E990C
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0xc8
	bl ov101_021E9B70
	movs r0, #0x5e
	lsls r0, r0, #2
	movs r2, #0
	ldr r0, [r5, r0]
	movs r1, #0x20
	str r1, [sp]
	movs r1, #0x18
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	adds r3, r2, #0
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #1
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	adds r0, r5, #0
	bl ov101_021EAF40
	movs r0, #0
	mvns r0, r0
	strb r0, [r5, #0xf]
	ldrb r0, [r5, #0xd]
	cmp r0, #2
	bne _021EE7BC
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x20
	str r1, [sp]
	movs r1, #6
	adds r2, r0, #0
	str r1, [sp, #4]
	adds r2, #0xc
	str r2, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	movs r3, #8
	str r3, [sp, #0x10]
	ldrh r4, [r0]
	lsls r4, r4, #0x15
	lsrs r4, r4, #0x18
	str r4, [sp, #0x14]
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	movs r3, #0x46
	lsls r3, r3, #2
	adds r2, r3, #0
	adds r1, r5, r3
	subs r2, #8
	subs r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	adds r0, r5, #0
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021EA794
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021EAD90
	ldr r0, [r5, #0x10]
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r0, #0x74]
	movs r1, #5
	subs r3, #0x54
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r0, #0x74]
	movs r1, #6
	subs r3, #0x54
	bl FUN_0201BC8C
	ldr r0, [r5, #0x10]
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r0, #0x74]
	movs r1, #7
	subs r3, #0x54
	bl FUN_0201BC8C
	b _021EE82A
_021EE7BC:
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021EA4D0
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x20
	str r1, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	movs r3, #8
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #6
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	movs r3, #0x46
	lsls r3, r3, #2
	adds r2, r3, #0
	adds r1, r5, r3
	subs r2, #8
	subs r3, r3, #6
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	adds r0, r5, #0
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021EA8A8
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021EAD90
	movs r1, #0
	adds r0, r5, #0
	mvns r1, r1
	bl ov101_021EB4C4
_021EE82A:
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021EB1E0
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021EA608
	adds r1, r5, #0
	adds r1, #0xb0
	ldr r1, [r1]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x30
	subs r1, r0, r1
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0xf
	movs r1, #0
	asrs r3, r0, #0x10
	str r1, [sp]
	adds r2, r5, #0
	ldr r0, _021EE8E4 @ =0x00030100
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0x81
	adds r2, #0xb0
	lsls r0, r0, #2
	ldr r2, [r2]
	adds r0, r5, r0
	movs r1, #4
	bl FUN_020200FC
	ldr r0, [sp, #0x1c]
	movs r1, #1
	adds r0, #0xe8
	str r0, [sp, #0x1c]
	ldr r0, [r0]
	bl FUN_02024830
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_021E6E84
	ldr r0, [r5, #0x10]
	movs r1, #4
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #5
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #7
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #0
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #1
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0x10]
	movs r1, #3
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EE8D8: .4byte 0x04000050
_021EE8DC: .4byte ov101_021EB338
_021EE8E0: .4byte ov101_021EB2FC
_021EE8E4: .4byte 0x00030100
	thumb_func_end ov101_021EE670

	thumb_func_start ov101_021EE8E8
ov101_021EE8E8: @ 0x021EE8E8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	movs r2, #2
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x5b
	lsls r2, r2, #0x10
	bl FUN_0201A910
	adds r0, r4, #0
	movs r1, #0x4c
	movs r2, #0x5b
	bl FUN_02007280
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x4c
	blx FUN_020E5B44
	str r5, [r4, #0xc]
	movs r0, #0x5b
	str r0, [r4]
	adds r0, r4, #0
	bl ov101_021EE9D0
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021EE8E8

	thumb_func_start ov101_021EE924
ov101_021EE924: @ 0x021EE924
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	cmp r1, #9
	bhi _021EE99E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021EE93E: @ jump table
	.2byte _021EE952 - _021EE93E - 2 @ case 0
	.2byte _021EE95A - _021EE93E - 2 @ case 1
	.2byte _021EE962 - _021EE93E - 2 @ case 2
	.2byte _021EE96A - _021EE93E - 2 @ case 3
	.2byte _021EE972 - _021EE93E - 2 @ case 4
	.2byte _021EE97A - _021EE93E - 2 @ case 5
	.2byte _021EE982 - _021EE93E - 2 @ case 6
	.2byte _021EE98A - _021EE93E - 2 @ case 7
	.2byte _021EE992 - _021EE93E - 2 @ case 8
	.2byte _021EE99A - _021EE93E - 2 @ case 9
_021EE952:
	bl ov101_021EEA4C
	str r0, [r4]
	b _021EE99E
_021EE95A:
	bl ov101_021EEA70
	str r0, [r4]
	b _021EE99E
_021EE962:
	bl ov101_021EEAC4
	str r0, [r4]
	b _021EE99E
_021EE96A:
	bl ov101_021EEAD8
	str r0, [r4]
	b _021EE99E
_021EE972:
	bl ov101_021EEAE0
	str r0, [r4]
	b _021EE99E
_021EE97A:
	bl ov101_021EEAF4
	str r0, [r4]
	b _021EE99E
_021EE982:
	bl ov101_021EEBA4
	str r0, [r4]
	b _021EE99E
_021EE98A:
	bl ov101_021EEC04
	str r0, [r4]
	b _021EE99E
_021EE992:
	bl ov101_021EEC8C
	str r0, [r4]
	b _021EE99E
_021EE99A:
	movs r0, #1
	pop {r4, pc}
_021EE99E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EE924

	thumb_func_start ov101_021EE9A4
ov101_021EE9A4: @ 0x021EE9A4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov101_021EEA2C
	ldr r2, [r4, #0xc]
	movs r0, #0x80
	ldrb r1, [r2, #5]
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r4, [r4]
	adds r0, r5, #0
	bl FUN_02007294
	adds r0, r4, #0
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021EE9A4

	thumb_func_start ov101_021EE9D0
ov101_021EE9D0: @ 0x021EE9D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _021EEA20 @ =ov101_021EF4B0
	str r4, [r0, #0x64]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl FUN_0202EE7C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x19
	ldrh r2, [r4, #0x12]
	ldr r1, _021EEA24 @ =0xFFFF01FF
	lsrs r0, r0, #0x10
	ands r1, r2
	orrs r0, r1
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl FUN_0202EE98
	ldrh r1, [r4, #0x12]
	ldr r2, _021EEA28 @ =0xFFFFFE00
	adds r3, r1, #0
	lsrs r1, r2, #0x17
	ands r3, r2
	ands r0, r1
	orrs r0, r3
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0x12]
	adds r1, r0, #0
	ands r1, r2
	movs r0, #0xff
	orrs r0, r1
	strh r0, [r4, #0x12]
	pop {r4, pc}
	nop
_021EEA20: .4byte ov101_021EF4B0
_021EEA24: .4byte 0xFFFF01FF
_021EEA28: .4byte 0xFFFFFE00
	thumb_func_end ov101_021EE9D0

	thumb_func_start ov101_021EEA2C
ov101_021EEA2C: @ 0x021EEA2C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x12]
	ldr r0, [r4, #0xc]
	lsls r1, r1, #0x10
	ldr r0, [r0, #0x28]
	lsrs r1, r1, #0x19
	bl FUN_0202EE84
	ldr r0, [r4, #0xc]
	movs r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x60]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EEA2C

	thumb_func_start ov101_021EEA4C
ov101_021EEA4C: @ 0x021EEA4C
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021EED44
	cmp r0, #0
	bne _021EEA5C
	movs r0, #0
	pop {r4, pc}
_021EEA5C:
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	beq _021EEA6A
	movs r0, #7
	pop {r4, pc}
_021EEA6A:
	movs r0, #5
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EEA4C

	thumb_func_start ov101_021EEA70
ov101_021EEA70: @ 0x021EEA70
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021EF7D4
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021EEA9A
	ldr r0, [r4, #0xc]
	bl FUN_021E5900
	ldr r0, [r4, #0xc]
	ldrb r1, [r0, #6]
	cmp r1, #1
	bne _021EEA94
	bl FUN_021E59CC
	b _021EEA9A
_021EEA94:
	adds r0, r4, #0
	bl ov101_021EF6E4
_021EEA9A:
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021EEAC0
	cmp r0, #4
	beq _021EEAAC
	cmp r0, #8
	beq _021EEAB4
	b _021EEAB8
_021EEAAC:
	ldr r1, [r4, #0xc]
	str r0, [r1, #0x1c]
	movs r0, #6
	pop {r4, pc}
_021EEAB4:
	movs r0, #3
	pop {r4, pc}
_021EEAB8:
	ldr r1, [r4, #0xc]
	str r0, [r1, #0x1c]
	movs r0, #8
	pop {r4, pc}
_021EEAC0:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov101_021EEA70

	thumb_func_start ov101_021EEAC4
ov101_021EEAC4: @ 0x021EEAC4
	push {r3, lr}
	bl ov101_021EED98
	cmp r0, #0
	beq _021EEAD2
	movs r0, #9
	pop {r3, pc}
_021EEAD2:
	movs r0, #2
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov101_021EEAC4

	thumb_func_start ov101_021EEAD8
ov101_021EEAD8: @ 0x021EEAD8
	ldr r3, _021EEADC @ =ov101_021EEDC4
	bx r3
	.align 2, 0
_021EEADC: .4byte ov101_021EEDC4
	thumb_func_end ov101_021EEAD8

	thumb_func_start ov101_021EEAE0
ov101_021EEAE0: @ 0x021EEAE0
	push {r3, lr}
	bl ov101_021EEE80
	cmp r0, #0
	beq _021EEAEE
	movs r0, #1
	pop {r3, pc}
_021EEAEE:
	movs r0, #4
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov101_021EEAE0

	thumb_func_start ov101_021EEAF4
ov101_021EEAF4: @ 0x021EEAF4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EEB06
	cmp r0, #1
	beq _021EEB8A
	b _021EEB9C
_021EEB06:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r4, #0
	movs r6, #1
_021EEB20:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #8
	blt _021EEB20
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x40
	movs r3, #0xc0
	bl FUN_02003E5C
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl FUN_0200398C
	ldr r0, [r5, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021EEB9C
_021EEB8A:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021EEB9C
	movs r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_021EEB9C:
	movs r0, #5
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021EEAF4

	thumb_func_start ov101_021EEBA4
ov101_021EEBA4: @ 0x021EEBA4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EEBB6
	cmp r0, #1
	beq _021EEBD6
	b _021EEBFC
_021EEBB6:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021EEBFC
_021EEBD6:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021EEBFC
	movs r4, #0
	adds r6, r4, #0
_021EEBE2:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #8
	blt _021EEBE2
	movs r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	movs r0, #2
	pop {r3, r4, r5, r6, pc}
_021EEBFC:
	movs r0, #6
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021EEBA4

	thumb_func_start ov101_021EEC04
ov101_021EEC04: @ 0x021EEC04
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EEC18
	cmp r0, #1
	beq _021EEC5E
	cmp r0, #2
	beq _021EEC72
	b _021EEC88
_021EEC18:
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r0, #0
	movs r1, #0xe
	movs r2, #1
	bl FUN_0200B4F0
	movs r6, #1
	movs r4, #0
	adds r7, r6, #0
_021EEC32:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r0, r4, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #3
	blt _021EEC32
	ldr r0, [r5, #0xc]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021EEC88
_021EEC5E:
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_021E5D3C
	cmp r0, #0
	beq _021EEC88
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021EEC88
_021EEC72:
	ldr r0, [r5, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	ldr r0, [r5, #0xc]
	movs r1, #0
	strb r1, [r0, #9]
	str r1, [r5, #4]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EEC88:
	movs r0, #7
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021EEC04

	thumb_func_start ov101_021EEC8C
ov101_021EEC8C: @ 0x021EEC8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EECA2
	cmp r0, #1
	beq _021EECBA
	cmp r0, #2
	beq _021EECCE
	b _021EED3C
_021EECA2:
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	ldr r0, [r5, #0xc]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021EED3C
_021EECBA:
	ldr r0, [r5, #0xc]
	movs r1, #1
	bl FUN_021E5D3C
	cmp r0, #0
	beq _021EED3C
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021EED3C
_021EECCE:
	movs r0, #0x10
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x40
	movs r3, #0xc0
	bl FUN_02003E5C
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl FUN_0200398C
	movs r4, #0
	adds r6, r4, #0
	adds r7, r4, #0
_021EED06:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r0, r4, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #3
	blt _021EED06
	ldr r0, [r5, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	ldr r0, [r5, #0xc]
	movs r1, #0
	strb r1, [r0, #9]
	add sp, #8
	str r1, [r5, #4]
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021EED3C:
	movs r0, #8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov101_021EEC8C

	thumb_func_start ov101_021EED44
ov101_021EED44: @ 0x021EED44
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021EED54
	cmp r1, #1
	beq _021EED6E
	b _021EED8C
_021EED54:
	bl ov101_021EEF0C
	adds r0, r4, #0
	bl ov101_021EEFE8
	adds r0, r4, #0
	bl ov101_021EF00C
	adds r0, r4, #0
	movs r1, #1
	bl ov101_021EF26C
	b _021EED8C
_021EED6E:
	bl ov101_021EF03C
	adds r0, r4, #0
	bl ov101_021EF0E0
	adds r0, r4, #0
	bl ov101_021EF130
	adds r0, r4, #0
	bl ov101_021EF17C
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021EED8C:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EED44

	thumb_func_start ov101_021EED98
ov101_021EED98: @ 0x021EED98
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021EF16C
	adds r0, r4, #0
	bl ov101_021EF120
	adds r0, r4, #0
	bl ov101_021EF0C8
	adds r0, r4, #0
	bl ov101_021EF028
	adds r0, r4, #0
	bl ov101_021EEFFC
	adds r0, r4, #0
	bl ov101_021EEFDC
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EED98

	thumb_func_start ov101_021EEDC4
ov101_021EEDC4: @ 0x021EEDC4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	bl FUN_020186A4
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _021EEE0A
	ldr r0, [r5, #0x40]
	bl FUN_02018674
	ldr r1, [r5, #0xc]
	str r0, [r1, #0xc]
	ldr r0, [r5, #0x40]
	bl FUN_02018680
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov101_021EF5A4
	ldr r0, [r5, #0xc]
	ldr r1, _021EEE10 @ =0x0000FFFF
	ldr r0, [r0, #0x7c]
	movs r2, #1
	bl FUN_021E7414
	cmp r4, #0
	bne _021EEE06
	movs r0, #4
	pop {r3, r4, r5, pc}
_021EEE06:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021EEE0A:
	movs r0, #3
	pop {r3, r4, r5, pc}
	nop
_021EEE10: .4byte 0x0000FFFF
	thumb_func_end ov101_021EEDC4

	thumb_func_start ov101_021EEE14
ov101_021EEE14: @ 0x021EEE14
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021EF260
	ldrh r1, [r4, #0x12]
	ldr r0, _021EEE7C @ =0xFFFF01FF
	ands r1, r0
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x10
	orrs r0, r1
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x19
	ldr r0, [r4, #0xc]
	strb r1, [r0, #8]
	ldrh r1, [r4, #0x12]
	ldr r0, [r4, #0xc]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x19
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_021E5EB4
	ldrh r1, [r4, #0x12]
	ldr r0, [r4, #0xc]
	lsls r1, r1, #0x10
	adds r0, #0x94
	lsrs r1, r1, #0x19
	lsls r1, r1, #0x18
	ldr r0, [r0]
	lsrs r1, r1, #0x18
	bl FUN_021E6A58
	adds r0, r4, #0
	bl ov101_021EF1D8
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021EF26C
	adds r0, r4, #0
	bl ov101_021EF414
	ldrh r1, [r4, #0x12]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x19
	bl ov101_021EF384
	pop {r4, pc}
	.align 2, 0
_021EEE7C: .4byte 0xFFFF01FF
	thumb_func_end ov101_021EEE14

	thumb_func_start ov101_021EEE80
ov101_021EEE80: @ 0x021EEE80
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _021EEF00
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EEE98: @ jump table
	.2byte _021EEEA0 - _021EEE98 - 2 @ case 0
	.2byte _021EEEB8 - _021EEE98 - 2 @ case 1
	.2byte _021EEECE - _021EEE98 - 2 @ case 2
	.2byte _021EEEE8 - _021EEE98 - 2 @ case 3
_021EEEA0:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r1, [r4]
	movs r3, #0
	str r1, [sp, #8]
	movs r1, #4
	adds r2, r1, #0
	bl FUN_0200FA24
	b _021EEF00
_021EEEB8:
	bl FUN_0200FB5C
	cmp r0, #0
	bne _021EEEC6
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_021EEEC6:
	adds r0, r4, #0
	bl ov101_021EEE14
	b _021EEF00
_021EEECE:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r1, #3
	str r0, [sp, #8]
	movs r0, #2
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	b _021EEF00
_021EEEE8:
	bl FUN_0200FB5C
	cmp r0, #0
	bne _021EEEF6
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_021EEEF6:
	movs r0, #0
	str r0, [r4, #8]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_021EEF00:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov101_021EEE80

	thumb_func_start ov101_021EEF0C
ov101_021EEF0C: @ 0x021EEF0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xac
	movs r1, #0
	adds r5, r0, #0
	movs r0, #1
	adds r2, r1, #0
	blx FUN_020CD9FC
	ldr r4, _021EEFD8 @ =0x021F8254
	add r3, sp, #4
	movs r2, #0x15
_021EEF22:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021EEF22
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x74]
	add r2, sp, #4
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x74]
	add r2, sp, #0x20
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #3
	ldr r0, [r0, #0x74]
	add r2, sp, #0x3c
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #5
	ldr r0, [r0, #0x74]
	add r2, sp, #0x58
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #6
	ldr r0, [r0, #0x74]
	add r2, sp, #0x74
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #7
	ldr r0, [r0, #0x74]
	add r2, sp, #0x90
	bl FUN_0201AD0C
	movs r4, #0
	movs r6, #0x20
	adds r7, r4, #0
_021EEF90:
	ldr r0, [r5, #0xc]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	ldr r3, [r5]
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0201C1C4
	ldr r0, [r5, #0xc]
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r4, #5
	lsls r0, r0, #0x18
	ldr r3, [r5]
	lsrs r0, r0, #0x18
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	adds r4, r4, #1
	cmp r4, #3
	blt _021EEF90
	add sp, #0xac
	pop {r4, r5, r6, r7, pc}
	nop
_021EEFD8: .4byte 0x021F8254
	thumb_func_end ov101_021EEF0C

	thumb_func_start ov101_021EEFDC
ov101_021EEFDC: @ 0x021EEFDC
	ldr r3, _021EEFE4 @ =FUN_021E5CA4
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021EEFE4: .4byte FUN_021E5CA4
	thumb_func_end ov101_021EEFDC

	thumb_func_start ov101_021EEFE8
ov101_021EEFE8: @ 0x021EEFE8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #4
	bl FUN_02002CEC
	adds r0, r4, #0
	bl ov101_021EF1D8
	pop {r4, pc}
	thumb_func_end ov101_021EEFE8

	thumb_func_start ov101_021EEFFC
ov101_021EEFFC: @ 0x021EEFFC
	push {r3, lr}
	bl ov101_021EF260
	movs r0, #4
	bl FUN_02002DB4
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov101_021EEFFC

	thumb_func_start ov101_021EF00C
ov101_021EF00C: @ 0x021EF00C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_021E6978
	ldr r1, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, [r1, #0x78]
	bl FUN_02018424
	str r0, [r4, #0x38]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EF00C

	thumb_func_start ov101_021EF028
ov101_021EF028: @ 0x021EF028
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	bl FUN_02018474
	ldr r0, [r4, #0xc]
	bl FUN_021E69C8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EF028

	thumb_func_start ov101_021EF03C
ov101_021EF03C: @ 0x021EF03C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r4, _021EF0C4 @ =0x021F82FC
	movs r7, #0
	adds r5, r6, #0
_021EF046:
	ldr r1, [r6, #0xc]
	adds r2, r4, #0
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	str r0, [r5, #0x14]
	movs r1, #1
	bl FUN_0200DD3C
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x14]
	movs r1, #1
	bl FUN_0202484C
	adds r7, r7, #1
	adds r4, #0x28
	adds r5, r5, #4
	cmp r7, #4
	ble _021EF046
	adds r4, r6, #0
	ldr r7, _021EF0C4 @ =0x021F82FC
	movs r5, #5
	adds r4, #0x14
_021EF082:
	ldr r1, [r6, #0xc]
	subs r3, r5, #5
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	movs r2, #0x28
	muls r2, r3, r2
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r7, r2
	bl FUN_0200D2B4
	str r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0200DD3C
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0200DD60
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0202484C
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #8
	ble _021EF082
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EF0C4: .4byte 0x021F82FC
	thumb_func_end ov101_021EF03C

	thumb_func_start ov101_021EF0C8
ov101_021EF0C8: @ 0x021EF0C8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021EF0CE:
	ldr r0, [r5, #0x14]
	bl FUN_0200D018
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #9
	blt _021EF0CE
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021EF0C8

	thumb_func_start ov101_021EF0E0
ov101_021EF0E0: @ 0x021EF0E0
	push {r4, lr}
	sub sp, #0x18
	movs r3, #0
	adds r4, r0, #0
	str r3, [sp]
	ldr r0, [r4]
	ldr r1, _021EF11C @ =0x021F820C
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	movs r2, #6
	str r0, [sp, #8]
	ldr r0, [r4, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x20]
	str r0, [sp, #0x14]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x7c]
	bl FUN_021E7014
	ldr r0, [r4, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E7128
	add sp, #0x18
	pop {r4, pc}
	nop
_021EF11C: .4byte 0x021F820C
	thumb_func_end ov101_021EF0E0

	thumb_func_start ov101_021EF120
ov101_021EF120: @ 0x021EF120
	ldr r0, [r0, #0xc]
	ldr r3, _021EF12C @ =FUN_021E70A4
	ldr r0, [r0, #0x7c]
	movs r1, #1
	bx r3
	nop
_021EF12C: .4byte FUN_021E70A4
	thumb_func_end ov101_021EF120

	thumb_func_start ov101_021EF130
ov101_021EF130: @ 0x021EF130
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #2
	bl FUN_02014918
	str r0, [r5, #0x3c]
	movs r1, #0x1b
	adds r2, r1, #0
	ldr r3, [r5]
	movs r0, #0
	adds r2, #0xf3
	bl FUN_0200BAF8
	adds r6, r0, #0
	movs r4, #0
_021EF150:
	ldr r0, [r5, #0x3c]
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl FUN_02014960
	adds r4, r4, #1
	cmp r4, #2
	blt _021EF150
	adds r0, r6, #0
	bl FUN_0200BB44
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021EF130

	thumb_func_start ov101_021EF16C
ov101_021EF16C: @ 0x021EF16C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl FUN_02014950
	movs r0, #0
	str r0, [r4, #0x3c]
	pop {r4, pc}
	thumb_func_end ov101_021EF16C

	thumb_func_start ov101_021EF17C
ov101_021EF17C: @ 0x021EF17C
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021EF414
	ldr r1, [r4, #0xc]
	ldrb r0, [r1, #6]
	cmp r0, #1
	ldr r0, [r1, #0x7c]
	bne _021EF1B6
	movs r1, #0
	movs r2, #1
	bl FUN_021E7128
	ldr r0, [r4, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E7128
	ldr r0, [r4, #0xc]
	bl FUN_021E5DC8
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E72F8
	pop {r4, pc}
_021EF1B6:
	movs r1, #0
	adds r2, r1, #0
	bl FUN_021E7128
	ldr r0, [r4, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	adds r2, r1, #0
	bl FUN_021E7128
	ldr r0, [r4, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E72F8
	pop {r4, pc}
	thumb_func_end ov101_021EF17C

	thumb_func_start ov101_021EF1D8
ov101_021EF1D8: @ 0x021EF1D8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x91
	bl FUN_02007688
	adds r4, r0, #0
	ldrh r0, [r5, #0x12]
	adds r2, r4, #0
	movs r3, #0x91
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x19
	adds r0, #0xa
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl FUN_0208820C
	ldrh r0, [r5, #0x12]
	adds r2, r4, #0
	movs r3, #0x91
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x19
	adds r0, #0x10
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl FUN_0208820C
	ldr r0, [r5]
	adds r3, r5, #0
	str r0, [sp]
	ldrh r1, [r5, #0x12]
	adds r0, r4, #0
	movs r2, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x19
	adds r1, #0x16
	adds r3, #0x48
	bl FUN_02007C2C
	str r0, [r5, #0x44]
	adds r0, r4, #0
	bl FUN_0200770C
	ldr r0, [r5, #0xc]
	movs r1, #3
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov101_021EF1D8

	thumb_func_start ov101_021EF260
ov101_021EF260: @ 0x021EF260
	ldr r3, _021EF268 @ =FUN_0201AB0C
	ldr r0, [r0, #0x44]
	bx r3
	nop
_021EF268: .4byte FUN_0201AB0C
	thumb_func_end ov101_021EF260

	thumb_func_start ov101_021EF26C
ov101_021EF26C: @ 0x021EF26C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, [r5]
	movs r0, #0x91
	bl FUN_02007688
	adds r4, r0, #0
	movs r1, #0
	movs r0, #7
	str r1, [sp]
	lsls r0, r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldrh r2, [r5, #0x12]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x19
	ldr r0, [r0, #0x78]
	adds r1, r4, #0
	adds r2, r2, #4
	bl FUN_02003220
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #6
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldrh r2, [r5, #0x12]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x19
	ldr r0, [r0, #0x78]
	adds r1, r4, #0
	adds r2, r2, #4
	bl FUN_02003220
	cmp r6, #0
	beq _021EF304
	movs r0, #2
	str r0, [sp]
	movs r0, #0x16
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	adds r1, r4, #0
	bl FUN_02003220
	movs r0, #3
	str r0, [sp]
	movs r0, #0x16
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	adds r1, r4, #0
	bl FUN_02003220
_021EF304:
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	cmp r6, #0
	beq _021EF33E
	movs r0, #0x10
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x40
	movs r3, #0xc0
	bl FUN_02003E5C
	b _021EF366
_021EF33E:
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r3, #1
	ldr r0, [r0, #0x78]
	adds r2, r1, #0
	lsls r3, r3, #8
	bl FUN_02003E5C
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #2
	adds r3, r1, #0
	ldr r0, [r0, #0x78]
	adds r3, #0xfe
	bl FUN_02003E5C
_021EF366:
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl FUN_0200398C
	ldr r0, [r5, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021EF26C

	thumb_func_start ov101_021EF384
ov101_021EF384: @ 0x021EF384
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r6, r1, #0
	ldrh r1, [r5, #0x12]
	ldr r0, _021EF410 @ =0xFFFF01FF
	ands r1, r0
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x10
	orrs r0, r1
	strh r0, [r5, #0x12]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201CAE0
	adds r0, r6, #0
	movs r1, #3
	ldr r4, [r5, #0x48]
	blx FUN_020F2998
	adds r7, r1, #0
	adds r0, r6, #0
	movs r1, #3
	blx FUN_020F2998
	adds r3, r0, #0
	movs r0, #9
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xc
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldrh r0, [r4]
	movs r2, #0xa
	muls r2, r7, r2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r4, #2]
	lsls r4, r3, #3
	adds r3, r3, r4
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	adds r2, r2, #2
	adds r3, r3, #2
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	ldr r0, [r0, #0x74]
	movs r1, #2
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201C4EC
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021EF410: .4byte 0xFFFF01FF
	thumb_func_end ov101_021EF384

	thumb_func_start ov101_021EF414
ov101_021EF414: @ 0x021EF414
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r7, r0, #0
	movs r4, #1
	movs r6, #0
_021EF41E:
	ldrh r0, [r7, #0x12]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x17
	tst r0, r4
	beq _021EF42A
	b _021EF48A
_021EF42A:
	adds r0, r6, #0
	movs r1, #3
	ldr r5, [r7, #0x48]
	blx FUN_020F2998
	str r1, [sp, #0x1c]
	adds r0, r6, #0
	movs r1, #3
	blx FUN_020F2998
	mov ip, r0
	movs r0, #6
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xc
	str r0, [sp, #8]
	movs r0, #6
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldrh r0, [r5]
	ldr r3, [sp, #0x1c]
	movs r2, #0xa
	muls r2, r3, r2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r5, #2]
	mov r3, ip
	lsls r5, r3, #3
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	mov r3, ip
	str r0, [sp, #0x18]
	ldr r0, [r7, #0xc]
	adds r3, r3, r5
	adds r2, r2, #3
	adds r3, r3, #3
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	ldr r0, [r0, #0x74]
	movs r1, #3
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201C4EC
_021EF48A:
	lsls r0, r4, #0x11
	adds r6, r6, #1
	lsrs r4, r0, #0x10
	cmp r6, #6
	blt _021EF41E
	ldr r0, [r7, #0xc]
	movs r1, #3
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldrh r1, [r7, #0x12]
	adds r0, r7, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x19
	bl ov101_021EF384
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov101_021EF414

	thumb_func_start ov101_021EF4B0
ov101_021EF4B0: @ 0x021EF4B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	movs r2, #0xff
	bl FUN_021E72F8
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	adds r2, r1, #0
	bl FUN_021E7128
	ldr r0, [r4, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	adds r2, r1, #0
	bl FUN_021E7128
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EF4B0

	thumb_func_start ov101_021EF4DC
ov101_021EF4DC: @ 0x021EF4DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0
	strb r1, [r0, #6]
	ldr r0, [r4, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	movs r2, #0xff
	bl FUN_021E72F8
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	adds r2, r1, #0
	bl FUN_021E7128
	ldr r0, [r4, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x7c]
	adds r2, r1, #0
	bl FUN_021E7128
	pop {r4, pc}
	thumb_func_end ov101_021EF4DC

	thumb_func_start ov101_021EF50C
ov101_021EF50C: @ 0x021EF50C
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r5, r0, #0
	adds r4, r1, #0
	add r0, sp, #0x10
	movs r1, #0
	movs r2, #0x18
	strb r4, [r5, #0x11]
	blx FUN_020D4994
	ldr r2, _021EF590 @ =0x021F83C4
	add r0, sp, #0x10
	ldrh r3, [r2]
	ldr r6, _021EF594 @ =0x021F83D0
	add r1, sp, #0x10
	strh r3, [r0]
	ldrh r3, [r2, #2]
	strh r3, [r0, #2]
	ldrh r3, [r2, #4]
	strh r3, [r0, #4]
	ldrh r3, [r2, #6]
	strh r3, [r0, #6]
	ldrh r3, [r2, #8]
	ldrh r2, [r2, #0xa]
	strh r3, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r2, [r5, #0x3c]
	str r2, [sp, #0x1c]
	ldr r2, [r5, #0xc]
	ldr r2, [r2, #0x74]
	str r2, [sp, #0x20]
	movs r2, #2
	strb r2, [r0, #0x14]
	lsls r0, r4, #1
	adds r3, r4, r0
	ldr r0, _021EF598 @ =0x021F83D1
	ldrb r0, [r0, r3]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021EF59C @ =0x021F83D2
	ldrb r0, [r0, r3]
	ldrb r3, [r6, r3]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	ldr r0, [r5, #0x38]
	ldr r2, [r2, #0xc]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl FUN_02018620
	str r0, [r5, #0x40]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl ov101_021EF5A4
	ldr r0, [r5, #0xc]
	ldr r1, _021EF5A0 @ =0x0000FFFF
	ldr r0, [r0, #0x7c]
	movs r2, #0
	bl FUN_021E7414
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.align 2, 0
_021EF590: .4byte 0x021F83C4
_021EF594: .4byte 0x021F83D0
_021EF598: .4byte 0x021F83D1
_021EF59C: .4byte 0x021F83D2
_021EF5A0: .4byte 0x0000FFFF
	thumb_func_end ov101_021EF50C

	thumb_func_start ov101_021EF5A4
ov101_021EF5A4: @ 0x021EF5A4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	cmp r2, #0
	beq _021EF680
	ldr r1, _021EF6B8 @ =0x04000048
	movs r3, #0x3f
	ldrh r2, [r1]
	movs r5, #0x1f
	bics r2, r3
	orrs r2, r5
	strh r2, [r1]
	ldrh r6, [r1]
	ldr r2, _021EF6BC @ =0xFFFFC0FF
	ands r6, r2
	lsls r2, r5, #8
	orrs r2, r6
	strh r2, [r1]
	ldrh r2, [r1, #2]
	bics r2, r3
	adds r3, r2, #0
	orrs r3, r5
	movs r2, #0x20
	orrs r2, r3
	strh r2, [r1, #2]
	ldr r6, [r0, #0x40]
	adds r0, r6, #0
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r5, r0, #3
	adds r0, r6, #0
	adds r6, #0x26
	ldrb r6, [r6]
	adds r0, #0x29
	ldrb r0, [r0]
	adds r6, r6, #2
	lsls r6, r6, #3
	lsls r3, r0, #3
	lsls r2, r5, #8
	movs r0, #0xff
	adds r5, r5, r6
	lsls r0, r0, #8
	lsls r5, r5, #0x18
	ands r2, r0
	lsrs r5, r5, #0x18
	orrs r5, r2
	adds r2, r1, #0
	subs r2, #8
	strh r5, [r2]
	lsls r2, r3, #8
	adds r3, #0x38
	ands r2, r0
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	subs r0, r1, #4
	strh r2, [r0]
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	movs r0, #0x50
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r2, #0
	adds r0, #0x18
	lsls r1, r0, #8
	movs r0, #0xff
	lsls r0, r0, #8
	adds r2, #0x48
	ands r1, r0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	orrs r1, r0
	ldr r0, _021EF6C0 @ =0x04000042
	strh r1, [r0]
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	movs r1, #0x48
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r2, #0
	adds r0, #0x18
	lsls r1, r0, #8
	movs r0, #0xff
	lsls r0, r0, #8
	adds r2, #0x40
	ands r1, r0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	orrs r1, r0
	ldr r0, _021EF6C4 @ =0x04000046
	adds r3, r0, #0
	strh r1, [r0]
	subs r3, #0x46
	ldr r2, [r3]
	ldr r1, _021EF6C8 @ =0xFFFF1FFF
	adds r0, #0xa
	ands r2, r1
	movs r1, #6
	lsls r1, r1, #0xc
	orrs r1, r2
	str r1, [r3]
	movs r1, #0x1f
	adds r2, r1, #0
	subs r2, #0x27
	blx FUN_020CF178
	pop {r4, r5, r6, pc}
_021EF680:
	ldr r0, _021EF6B8 @ =0x04000048
	movs r2, #0x3f
	ldrh r1, [r0]
	bics r1, r2
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _021EF6BC @ =0xFFFFC0FF
	ands r1, r3
	strh r1, [r0]
	ldrh r1, [r0, #2]
	adds r3, r0, #0
	subs r3, #0x48
	bics r1, r2
	strh r1, [r0, #2]
	ldr r2, [r3]
	ldr r1, _021EF6C8 @ =0xFFFF1FFF
	adds r0, #8
	ands r1, r2
	str r1, [r3]
	movs r1, #0x1f
	movs r2, #0
	blx FUN_020CF178
	ldr r0, _021EF6CC @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	pop {r4, r5, r6, pc}
	nop
_021EF6B8: .4byte 0x04000048
_021EF6BC: .4byte 0xFFFFC0FF
_021EF6C0: .4byte 0x04000042
_021EF6C4: .4byte 0x04000046
_021EF6C8: .4byte 0xFFFF1FFF
_021EF6CC: .4byte 0x04000050
	thumb_func_end ov101_021EF5A4

	thumb_func_start ov101_021EF6D0
ov101_021EF6D0: @ 0x021EF6D0
	movs r2, #1
	ldrh r0, [r0, #0x12]
	lsls r2, r1
	lsls r1, r2, #0x10
	lsls r0, r0, #0x17
	lsrs r1, r1, #0x10
	lsrs r0, r0, #0x17
	ands r0, r1
	bx lr
	.align 2, 0
	thumb_func_end ov101_021EF6D0

	thumb_func_start ov101_021EF6E4
ov101_021EF6E4: @ 0x021EF6E4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _021EF7C8 @ =0x021D110C
	movs r2, #2
	ldr r0, [r0, #0x48]
	adds r1, r0, #0
	tst r1, r2
	beq _021EF730
	ldr r0, [r4, #0xc]
	movs r1, #1
	strb r1, [r0, #6]
	ldr r0, [r4, #0xc]
	movs r2, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E7128
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	movs r2, #1
	bl FUN_021E7128
	ldr r0, [r4, #0xc]
	bl FUN_021E5DC8
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E72F8
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EF730:
	movs r1, #1
	adds r3, r0, #0
	tst r3, r1
	beq _021EF766
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x7c]
	bl FUN_021E7334
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov101_021EF6D0
	cmp r0, #0
	bne _021EF754
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EF754:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov101_021EF50C
	ldr r0, _021EF7CC @ =0x00000941
	bl FUN_0200604C
	movs r0, #8
	pop {r3, r4, r5, pc}
_021EF766:
	movs r3, #0x20
	tst r3, r0
	beq _021EF77E
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E73AC
	ldr r0, _021EF7D0 @ =0x0000093F
	bl FUN_0200604C
	b _021EF7C2
_021EF77E:
	movs r3, #0x10
	tst r3, r0
	beq _021EF794
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x7c]
	bl FUN_021E73AC
	ldr r0, _021EF7D0 @ =0x0000093F
	bl FUN_0200604C
	b _021EF7C2
_021EF794:
	movs r1, #0x40
	tst r1, r0
	beq _021EF7AC
	ldr r0, [r4, #0xc]
	adds r1, r2, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E73AC
	ldr r0, _021EF7D0 @ =0x0000093F
	bl FUN_0200604C
	b _021EF7C2
_021EF7AC:
	movs r1, #0x80
	tst r0, r1
	beq _021EF7C2
	ldr r0, [r4, #0xc]
	movs r1, #3
	ldr r0, [r0, #0x7c]
	bl FUN_021E73AC
	ldr r0, _021EF7D0 @ =0x0000093F
	bl FUN_0200604C
_021EF7C2:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EF7C8: .4byte 0x021D110C
_021EF7CC: .4byte 0x00000941
_021EF7D0: .4byte 0x0000093F
	thumb_func_end ov101_021EF6E4

	thumb_func_start ov101_021EF7D4
ov101_021EF7D4: @ 0x021EF7D4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_021E5924
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021EF83C
	ldr r0, _021EF840 @ =0x021F83E4
	bl FUN_02025224
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _021EF83C
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov101_021EF6D0
	cmp r0, #0
	bne _021EF80A
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EF80A:
	ldr r0, [r5, #0xc]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _021EF818
	adds r0, r5, #0
	bl ov101_021EF4DC
_021EF818:
	ldr r0, [r5, #0xc]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x7c]
	lsrs r1, r1, #0x18
	bl FUN_021E73C8
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov101_021EF50C
	ldr r0, _021EF844 @ =0x00000941
	bl FUN_0200604C
	ldr r0, [r5, #0xc]
	movs r1, #1
	str r1, [r0, #0xc]
	movs r0, #8
_021EF83C:
	pop {r3, r4, r5, pc}
	nop
_021EF840: .4byte 0x021F83E4
_021EF844: .4byte 0x00000941
	thumb_func_end ov101_021EF7D4

	thumb_func_start ov101_021EF848
ov101_021EF848: @ 0x021EF848
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x5b
	lsls r2, r0, #0x10
	bl FUN_0201A910
	movs r1, #0x51
	adds r0, r4, #0
	lsls r1, r1, #4
	movs r2, #0x5b
	bl FUN_02007280
	movs r2, #0x51
	adds r4, r0, #0
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020E5B44
	movs r1, #0
	str r5, [r4, #0xc]
	movs r0, #0x5b
	str r0, [r4]
	movs r0, #0x37
	adds r2, r1, #0
	bl FUN_02004EC4
	adds r0, r4, #0
	bl ov101_021EF96C
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021EF848

	thumb_func_start ov101_021EF890
ov101_021EF890: @ 0x021EF890
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	cmp r1, #0xe
	bhi _021EF93C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021EF8AA: @ jump table
	.2byte _021EF8C8 - _021EF8AA - 2 @ case 0
	.2byte _021EF8D0 - _021EF8AA - 2 @ case 1
	.2byte _021EF8D8 - _021EF8AA - 2 @ case 2
	.2byte _021EF900 - _021EF8AA - 2 @ case 3
	.2byte _021EF910 - _021EF8AA - 2 @ case 4
	.2byte _021EF8F8 - _021EF8AA - 2 @ case 5
	.2byte _021EF908 - _021EF8AA - 2 @ case 6
	.2byte _021EF8E0 - _021EF8AA - 2 @ case 7
	.2byte _021EF8E8 - _021EF8AA - 2 @ case 8
	.2byte _021EF8F0 - _021EF8AA - 2 @ case 9
	.2byte _021EF918 - _021EF8AA - 2 @ case 10
	.2byte _021EF920 - _021EF8AA - 2 @ case 11
	.2byte _021EF928 - _021EF8AA - 2 @ case 12
	.2byte _021EF930 - _021EF8AA - 2 @ case 13
	.2byte _021EF938 - _021EF8AA - 2 @ case 14
_021EF8C8:
	bl ov101_021EFA24
	str r0, [r4]
	b _021EF93C
_021EF8D0:
	bl ov101_021EFA48
	str r0, [r4]
	b _021EF93C
_021EF8D8:
	bl ov101_021EFAA4
	str r0, [r4]
	b _021EF93C
_021EF8E0:
	bl ov101_021EFAB8
	str r0, [r4]
	b _021EF93C
_021EF8E8:
	bl ov101_021EFAC0
	str r0, [r4]
	b _021EF93C
_021EF8F0:
	bl ov101_021EFAC8
	str r0, [r4]
	b _021EF93C
_021EF8F8:
	bl ov101_021EFAD0
	str r0, [r4]
	b _021EF93C
_021EF900:
	bl ov101_021EFADC
	str r0, [r4]
	b _021EF93C
_021EF908:
	bl ov101_021EFAE8
	str r0, [r4]
	b _021EF93C
_021EF910:
	bl ov101_021EFB08
	str r0, [r4]
	b _021EF93C
_021EF918:
	bl ov101_021EFB4C
	str r0, [r4]
	b _021EF93C
_021EF920:
	bl ov101_021EFB70
	str r0, [r4]
	b _021EF93C
_021EF928:
	bl ov101_021EFBD0
	str r0, [r4]
	b _021EF93C
_021EF930:
	bl ov101_021EFC58
	str r0, [r4]
	b _021EF93C
_021EF938:
	movs r0, #1
	pop {r4, pc}
_021EF93C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov101_021EF890

	thumb_func_start ov101_021EF940
ov101_021EF940: @ 0x021EF940
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov101_021EFA04
	ldr r2, [r4, #0xc]
	movs r0, #0x80
	ldrb r1, [r2, #5]
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r4, [r4]
	adds r0, r5, #0
	bl FUN_02007294
	adds r0, r4, #0
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021EF940

	thumb_func_start ov101_021EF96C
ov101_021EF96C: @ 0x021EF96C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _021EFA00 @ =ov101_021F0944
	str r4, [r0, #0x64]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl FUN_0202EE7C
	strb r0, [r4, #0x11]
	ldr r0, [r4, #0xc]
	ldr r1, [r4]
	ldr r0, [r0, #0x28]
	bl FUN_0202EF44
	adds r1, r4, #0
	adds r1, #0xd0
	str r0, [r1]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl FUN_0202EEC0
	adds r1, r4, #0
	adds r1, #0xcd
	strb r0, [r1]
	adds r0, r4, #0
	bl ov101_021F0D6C
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrb r0, [r0]
	cmp r0, #1
	bne _021EF9E6
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0xcb
	strb r1, [r0]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	adds r0, #0xc8
	strb r1, [r0]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrb r1, [r0, #5]
	adds r0, r4, #0
	adds r0, #0xc9
	strb r1, [r0]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrb r1, [r0, #6]
	adds r0, r4, #0
	adds r0, #0xca
	strb r1, [r0]
	ldr r0, [r4, #0xc]
	movs r1, #0
	strb r1, [r0, #6]
	pop {r4, pc}
_021EF9E6:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xcb
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc8
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc9
	strb r1, [r0]
	adds r4, #0xca
	strb r1, [r4]
	pop {r4, pc}
	.align 2, 0
_021EFA00: .4byte ov101_021F0944
	thumb_func_end ov101_021EF96C

	thumb_func_start ov101_021EFA04
ov101_021EFA04: @ 0x021EFA04
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F0D90
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl FUN_0201AB0C
	ldr r0, [r4, #0xc]
	movs r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x60]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EFA04

	thumb_func_start ov101_021EFA24
ov101_021EFA24: @ 0x021EFA24
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021EFD20
	cmp r0, #0
	bne _021EFA34
	movs r0, #0
	pop {r4, pc}
_021EFA34:
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	beq _021EFA42
	movs r0, #0xc
	pop {r4, pc}
_021EFA42:
	movs r0, #0xa
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EFA24

	thumb_func_start ov101_021EFA48
ov101_021EFA48: @ 0x021EFA48
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F0C4C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021EFA78
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _021EFA64
	ldr r0, [r4, #0xc]
	bl FUN_021E5900
_021EFA64:
	ldr r0, [r4, #0xc]
	ldrb r1, [r0, #6]
	cmp r1, #1
	bne _021EFA72
	bl FUN_021E59CC
	b _021EFA78
_021EFA72:
	adds r0, r4, #0
	bl ov101_021F0BA0
_021EFA78:
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021EFA9E
	cmp r0, #4
	beq _021EFA8A
	cmp r0, #8
	beq _021EFA92
	b _021EFA96
_021EFA8A:
	ldr r1, [r4, #0xc]
	str r0, [r1, #0x1c]
	movs r0, #0xb
	pop {r4, pc}
_021EFA92:
	movs r0, #7
	pop {r4, pc}
_021EFA96:
	ldr r1, [r4, #0xc]
	str r0, [r1, #0x1c]
	movs r0, #0xd
	pop {r4, pc}
_021EFA9E:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EFA48

	thumb_func_start ov101_021EFAA4
ov101_021EFAA4: @ 0x021EFAA4
	push {r3, lr}
	bl ov101_021EFD7C
	cmp r0, #0
	beq _021EFAB2
	movs r0, #0xe
	pop {r3, pc}
_021EFAB2:
	movs r0, #2
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov101_021EFAA4

	thumb_func_start ov101_021EFAB8
ov101_021EFAB8: @ 0x021EFAB8
	ldr r3, _021EFABC @ =ov101_021EFDB4
	bx r3
	.align 2, 0
_021EFABC: .4byte ov101_021EFDB4
	thumb_func_end ov101_021EFAB8

	thumb_func_start ov101_021EFAC0
ov101_021EFAC0: @ 0x021EFAC0
	ldr r3, _021EFAC4 @ =ov101_021EFE1C
	bx r3
	.align 2, 0
_021EFAC4: .4byte ov101_021EFE1C
	thumb_func_end ov101_021EFAC0

	thumb_func_start ov101_021EFAC8
ov101_021EFAC8: @ 0x021EFAC8
	ldr r3, _021EFACC @ =ov101_021EFEC8
	bx r3
	.align 2, 0
_021EFACC: .4byte ov101_021EFEC8
	thumb_func_end ov101_021EFAC8

	thumb_func_start ov101_021EFAD0
ov101_021EFAD0: @ 0x021EFAD0
	push {r3, lr}
	bl ov101_021EFFBC
	movs r0, #3
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov101_021EFAD0

	thumb_func_start ov101_021EFADC
ov101_021EFADC: @ 0x021EFADC
	push {r3, lr}
	bl ov101_021EFFC8
	movs r0, #6
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov101_021EFADC

	thumb_func_start ov101_021EFAE8
ov101_021EFAE8: @ 0x021EFAE8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xc4
	ldr r0, [r0]
	bl ov101_021F26F8
	cmp r0, #0
	bne _021EFAFC
	movs r0, #6
	pop {r4, pc}
_021EFAFC:
	adds r0, r4, #0
	bl ov101_021F003C
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EFAE8

	thumb_func_start ov101_021EFB08
ov101_021EFB08: @ 0x021EFB08
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F00BC
	cmp r0, #0
	bne _021EFB18
	movs r0, #4
	pop {r4, pc}
_021EFB18:
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x48
	bl FUN_0201D578
	adds r0, r4, #0
	adds r0, #0x58
	bl FUN_0201D578
	movs r0, #0
	bl FUN_02002B8C
	adds r0, r4, #0
	bl ov101_021F0B84
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov101_021EFB08

	thumb_func_start ov101_021EFB4C
ov101_021EFB4C: @ 0x021EFB4C
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021EFF14
	cmp r0, #0
	beq _021EFB6C
	movs r0, #0
	str r0, [r4, #4]
	adds r4, #0xcb
	ldrb r0, [r4]
	cmp r0, #0
	beq _021EFB68
	movs r0, #3
	pop {r4, pc}
_021EFB68:
	movs r0, #1
	pop {r4, pc}
_021EFB6C:
	movs r0, #0xa
	pop {r4, pc}
	thumb_func_end ov101_021EFB4C

	thumb_func_start ov101_021EFB70
ov101_021EFB70: @ 0x021EFB70
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EFB82
	cmp r0, #1
	beq _021EFBA2
	b _021EFBC8
_021EFB82:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021EFBC8
_021EFBA2:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021EFBC8
	movs r4, #0
	adds r6, r4, #0
_021EFBAE:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #8
	blt _021EFBAE
	movs r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	movs r0, #2
	pop {r3, r4, r5, r6, pc}
_021EFBC8:
	movs r0, #0xb
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021EFB70

	thumb_func_start ov101_021EFBD0
ov101_021EFBD0: @ 0x021EFBD0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EFBE4
	cmp r0, #1
	beq _021EFC2A
	cmp r0, #2
	beq _021EFC3E
	b _021EFC54
_021EFBE4:
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r0, #0
	movs r1, #0xe
	movs r2, #1
	bl FUN_0200B4F0
	movs r6, #1
	movs r4, #0
	adds r7, r6, #0
_021EFBFE:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r0, r4, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #3
	blt _021EFBFE
	ldr r0, [r5, #0xc]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021EFC54
_021EFC2A:
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_021E5D3C
	cmp r0, #0
	beq _021EFC54
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021EFC54
_021EFC3E:
	ldr r0, [r5, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	ldr r0, [r5, #0xc]
	movs r1, #0
	strb r1, [r0, #9]
	str r1, [r5, #4]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EFC54:
	movs r0, #0xc
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021EFBD0

	thumb_func_start ov101_021EFC58
ov101_021EFC58: @ 0x021EFC58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #3
	bhi _021EFD1A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EFC70: @ jump table
	.2byte _021EFC78 - _021EFC70 - 2 @ case 0
	.2byte _021EFC90 - _021EFC70 - 2 @ case 1
	.2byte _021EFCA4 - _021EFC70 - 2 @ case 2
	.2byte _021EFD02 - _021EFC70 - 2 @ case 3
_021EFC78:
	ldr r0, [r4, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	ldr r0, [r4, #0xc]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021EFD1A
_021EFC90:
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_021E5D3C
	cmp r0, #0
	beq _021EFD1A
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021EFD1A
_021EFCA4:
	movs r0, #0x10
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0xc]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x40
	movs r3, #0xc0
	bl FUN_02003E5C
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x78]
	bl FUN_0200398C
	movs r5, #0
	adds r6, r5, #0
	adds r7, r5, #0
_021EFCDC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r0, r5, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	bl FUN_0201BC28
	adds r5, r5, #1
	cmp r5, #3
	blt _021EFCDC
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021EFD1A
_021EFD02:
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	ldr r0, [r4, #0xc]
	movs r1, #0
	strb r1, [r0, #9]
	add sp, #8
	str r1, [r4, #4]
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021EFD1A:
	movs r0, #0xd
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021EFC58

	thumb_func_start ov101_021EFD20
ov101_021EFD20: @ 0x021EFD20
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021EFD30
	cmp r1, #1
	beq _021EFD54
	b _021EFD72
_021EFD30:
	bl ov101_021F017C
	adds r0, r4, #0
	bl ov101_021F0284
	adds r0, r4, #0
	bl ov101_021F0578
	adds r0, r4, #0
	bl ov101_021F05EC
	adds r0, r4, #0
	bl ov101_021F072C
	adds r0, r4, #0
	bl ov101_021F0388
	b _021EFD72
_021EFD54:
	bl ov101_021F075C
	adds r0, r4, #0
	bl ov101_021F0880
	adds r0, r4, #0
	bl ov101_021F0694
	adds r0, r4, #0
	bl ov101_021F0900
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021EFD72:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov101_021EFD20

	thumb_func_start ov101_021EFD7C
ov101_021EFD7C: @ 0x021EFD7C
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F08DC
	adds r0, r4, #0
	bl ov101_021F0720
	adds r0, r4, #0
	bl ov101_021F0864
	adds r0, r4, #0
	bl ov101_021F0748
	adds r0, r4, #0
	bl ov101_021F0658
	adds r0, r4, #0
	bl ov101_021F05CC
	adds r0, r4, #0
	bl ov101_021F0370
	adds r0, r4, #0
	bl ov101_021F0260
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021EFD7C

	thumb_func_start ov101_021EFDB4
ov101_021EFDB4: @ 0x021EFDB4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021EFE18 @ =0x00000504
	ldr r0, [r5, r0]
	bl FUN_020186A4
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _021EFE14
	ldr r0, _021EFE18 @ =0x00000504
	ldr r0, [r5, r0]
	bl FUN_02018674
	ldr r1, [r5, #0xc]
	str r0, [r1, #0xc]
	ldr r0, _021EFE18 @ =0x00000504
	ldr r0, [r5, r0]
	bl FUN_02018680
	cmp r4, #1
	bne _021EFDF8
	adds r0, r5, #0
	adds r0, #0xe0
	bl ov101_021F1804
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #1
	bl ov101_021F09B0
	movs r0, #8
	pop {r3, r4, r5, pc}
_021EFDF8:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov101_021F0ACC
	cmp r4, #0
	bne _021EFE0A
	movs r0, #5
	pop {r3, r4, r5, pc}
_021EFE0A:
	adds r0, r5, #0
	bl ov101_021F0B84
	movs r0, #1
	pop {r3, r4, r5, pc}
_021EFE14:
	movs r0, #7
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EFE18: .4byte 0x00000504
	thumb_func_end ov101_021EFDB4

	thumb_func_start ov101_021EFE1C
ov101_021EFE1C: @ 0x021EFE1C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _021EFEC0 @ =0x00000504
	ldr r0, [r4, r0]
	bl FUN_020186A4
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _021EFE36
	movs r0, #8
	pop {r3, r4, r5, pc}
_021EFE36:
	ldr r0, _021EFEC0 @ =0x00000504
	ldr r0, [r4, r0]
	bl FUN_02018674
	ldr r1, [r4, #0xc]
	str r0, [r1, #0xc]
	ldr r0, _021EFEC0 @ =0x00000504
	ldr r0, [r4, r0]
	bl FUN_02018680
	cmp r5, #4
	bhi _021EFEAC
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EFE5A: @ jump table
	.2byte _021EFE64 - _021EFE5A - 2 @ case 0
	.2byte _021EFE64 - _021EFE5A - 2 @ case 1
	.2byte _021EFE64 - _021EFE5A - 2 @ case 2
	.2byte _021EFE82 - _021EFE5A - 2 @ case 3
	.2byte _021EFEAC - _021EFE5A - 2 @ case 4
_021EFE64:
	lsls r1, r5, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov101_021F0EB0
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov101_021F0ACC
	adds r0, r4, #0
	bl ov101_021F0B84
	movs r0, #1
	pop {r3, r4, r5, pc}
_021EFE82:
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov101_021F0ACC
	adds r0, r4, #0
	adds r0, #0xe0
	movs r1, #1
	bl ov101_021F13C8
	adds r0, r4, #0
	adds r0, #0xe0
	movs r1, #0xff
	movs r2, #0
	bl ov101_021F1290
	ldr r1, _021EFEC4 @ =ov101_021F0978
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x5c]
	movs r0, #9
	pop {r3, r4, r5, pc}
_021EFEAC:
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov101_021F0ACC
	adds r0, r4, #0
	bl ov101_021F0B84
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EFEC0: .4byte 0x00000504
_021EFEC4: .4byte ov101_021F0978
	thumb_func_end ov101_021EFE1C

	thumb_func_start ov101_021EFEC8
ov101_021EFEC8: @ 0x021EFEC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021EFED8
	cmp r1, #1
	beq _021EFEE0
	b _021EFF0A
_021EFED8:
	bl ov101_021F0CE4
	str r0, [r4, #8]
	b _021EFF0A
_021EFEE0:
	adds r0, #0xe0
	movs r1, #0
	bl ov101_021F13C8
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov101_021F0ACC
	adds r0, r4, #0
	adds r0, #0xe0
	movs r1, #1
	bl ov101_021F1338
	ldr r1, _021EFF10 @ =ov101_021F0944
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x5c]
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021EFF0A:
	movs r0, #9
	pop {r4, pc}
	nop
_021EFF10: .4byte ov101_021F0944
	thumb_func_end ov101_021EFEC8

	thumb_func_start ov101_021EFF14
ov101_021EFF14: @ 0x021EFF14
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _021EFF26
	cmp r0, #1
	beq _021EFFA4
	b _021EFFB6
_021EFF26:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	adds r0, r5, #0
	adds r0, #0xcb
	ldrb r0, [r0]
	cmp r0, #0
	beq _021EFF6C
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r2, #0xb0
	ldr r0, [r0, #0x78]
	movs r3, #0x30
	bl FUN_02003E5C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x40
	movs r3, #0xc0
	bl FUN_02003E5C
_021EFF6C:
	adds r1, r5, #0
	adds r1, #0xcb
	ldrb r1, [r1]
	adds r0, r5, #0
	bl ov101_021F0464
	movs r4, #0
	movs r6, #1
_021EFF7C:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #8
	blt _021EFF7C
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, [r5, #8]
	adds r0, r0, #1
	str r0, [r5, #8]
	b _021EFFB6
_021EFFA4:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021EFFB6
	movs r0, #0
	str r0, [r5, #8]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_021EFFB6:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov101_021EFF14

	thumb_func_start ov101_021EFFBC
ov101_021EFFBC: @ 0x021EFFBC
	push {r3, lr}
	movs r1, #1
	bl ov101_021F0464
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov101_021EFFBC

	thumb_func_start ov101_021EFFC8
ov101_021EFFC8: @ 0x021EFFC8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0xcb
	ldrb r2, [r0]
	cmp r2, #0
	beq _021F0004
	adds r0, r5, #0
	adds r0, #0xca
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r3, r5, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, #0xc8
	adds r3, #0xc9
	adds r0, #0xc4
	ldrb r1, [r1]
	ldrb r3, [r3]
	ldr r0, [r0]
	bl ov101_021F1F64
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0xcb
	strb r1, [r0]
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x20]
	strb r1, [r0]
	b _021F001A
_021F0004:
	movs r3, #0
	adds r1, r5, #0
	adds r0, r5, #0
	str r3, [sp]
	adds r1, #0xc8
	adds r0, #0xc4
	ldrb r1, [r1]
	ldr r0, [r0]
	bl ov101_021F1F64
	adds r4, r0, #0
_021F001A:
	cmp r4, #0
	beq _021F0026
	adds r5, #0xc4
	ldr r0, [r5]
	bl ov101_021F1FF4
_021F0026:
	movs r0, #1
	bl FUN_02002B8C
	ldr r0, _021F0038 @ =0x021F8400
	bl FUN_02002C20
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021F0038: .4byte 0x021F8400
	thumb_func_end ov101_021EFFC8

	thumb_func_start ov101_021F003C
ov101_021F003C: @ 0x021F003C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x48
	bl FUN_0201D578
	adds r0, r4, #0
	adds r0, #0x58
	bl FUN_0201D578
	movs r0, #0
	bl FUN_02002B8C
	bl FUN_02002C40
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021F0464
	adds r0, r4, #0
	bl ov101_021F0B84
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F003C

	thumb_func_start ov101_021F0080
ov101_021F0080: @ 0x021F0080
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x20]
	adds r1, #0x21
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	ldr r0, _021F00B4 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	ldr r2, [r4, #0x20]
	adds r0, #0x48
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, _021F00B8 @ =0x000005F3
	bl FUN_0200604C
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021F00B4: .4byte 0x00010200
_021F00B8: .4byte 0x000005F3
	thumb_func_end ov101_021F0080

	thumb_func_start ov101_021F00BC
ov101_021F00BC: @ 0x021F00BC
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #3
	bhi _021F0136
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F00D4: @ jump table
	.2byte _021F00DC - _021F00D4 - 2 @ case 0
	.2byte _021F0106 - _021F00D4 - 2 @ case 1
	.2byte _021F011E - _021F00D4 - 2 @ case 2
	.2byte _021F011E - _021F00D4 - 2 @ case 3
_021F00DC:
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x20]
	adds r1, #0x21
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	ldr r0, _021F0170 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	ldr r2, [r4, #0x20]
	adds r0, #0x48
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, _021F0174 @ =0x000005DC
	bl FUN_0200604C
	b _021F0162
_021F0106:
	ldr r0, _021F0174 @ =0x000005DC
	bl FUN_02006184
	cmp r0, #0
	beq _021F0116
	add sp, #0x10
	movs r0, #0
	pop {r4, pc}
_021F0116:
	adds r0, r4, #0
	bl ov101_021F0080
	b _021F0162
_021F011E:
	ldr r0, _021F0178 @ =0x000005F3
	bl FUN_02006184
	cmp r0, #0
	beq _021F012E
	add sp, #0x10
	movs r0, #0
	pop {r4, pc}
_021F012E:
	adds r0, r4, #0
	bl ov101_021F0080
	b _021F0162
_021F0136:
	ldr r0, _021F0178 @ =0x000005F3
	bl FUN_02006184
	cmp r0, #0
	beq _021F0146
	add sp, #0x10
	movs r0, #0
	pop {r4, pc}
_021F0146:
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x48
	bl FUN_0201D578
	movs r0, #0
	str r0, [r4, #8]
	add sp, #0x10
	movs r0, #1
	pop {r4, pc}
_021F0162:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_021F0170: .4byte 0x00010200
_021F0174: .4byte 0x000005DC
_021F0178: .4byte 0x000005F3
	thumb_func_end ov101_021F00BC

	thumb_func_start ov101_021F017C
ov101_021F017C: @ 0x021F017C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xac
	movs r1, #0
	adds r5, r0, #0
	movs r0, #1
	adds r2, r1, #0
	blx FUN_020CD9FC
	ldr r4, _021F025C @ =0x021F8440
	add r3, sp, #4
	movs r2, #0x15
_021F0192:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021F0192
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x74]
	add r2, sp, #4
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x74]
	add r2, sp, #0x20
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #3
	ldr r0, [r0, #0x74]
	add r2, sp, #0x3c
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #5
	ldr r0, [r0, #0x74]
	add r2, sp, #0x58
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #6
	ldr r0, [r0, #0x74]
	add r2, sp, #0x74
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #7
	ldr r0, [r0, #0x74]
	add r2, sp, #0x90
	bl FUN_0201AD0C
	movs r4, #0
	movs r6, #0x20
	adds r7, r4, #0
_021F0200:
	ldr r0, [r5, #0xc]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	ldr r3, [r5]
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0201C1C4
	ldr r0, [r5, #0xc]
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r4, #5
	lsls r0, r0, #0x18
	ldr r3, [r5]
	lsrs r0, r0, #0x18
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	adds r4, r4, #1
	cmp r4, #3
	blt _021F0200
	movs r0, #0
	movs r1, #1
	bl FUN_0201BB68
	ldr r0, [r5, #0xc]
	movs r1, #3
	ldr r0, [r0, #0x74]
	adds r2, r1, #0
	movs r3, #0x20
	bl FUN_0201BC8C
	add sp, #0xac
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021F025C: .4byte 0x021F8440
	thumb_func_end ov101_021F017C

	thumb_func_start ov101_021F0260
ov101_021F0260: @ 0x021F0260
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201BB68
	ldr r0, [r4, #0xc]
	movs r1, #3
	ldr r0, [r0, #0x74]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r4, #0xc]
	bl FUN_021E5CA4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F0260

	thumb_func_start ov101_021F0284
ov101_021F0284: @ 0x021F0284
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #4
	bl FUN_02002CEC
	ldr r1, [r5]
	movs r0, #0x92
	bl FUN_02007688
	adds r4, r0, #0
	ldrb r0, [r5, #0x11]
	adds r2, r4, #0
	movs r3, #0x92
	adds r0, #0x1c
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl FUN_0208820C
	ldrb r0, [r5, #0x11]
	adds r2, r4, #0
	movs r3, #0x92
	adds r0, #0x10
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl FUN_0208820C
	ldrb r0, [r5, #0x11]
	adds r2, r4, #0
	movs r3, #0x92
	adds r0, #0x16
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl FUN_0208820C
	ldr r0, [r5]
	ldr r3, _021F0368 @ =0x0000050C
	str r0, [sp]
	ldrb r1, [r5, #0x11]
	adds r0, r4, #0
	movs r2, #0
	adds r1, #0x22
	adds r3, r5, r3
	bl FUN_02007C2C
	ldr r1, _021F036C @ =0x00000508
	movs r2, #0
	str r0, [r5, r1]
	adds r0, r1, #4
	ldr r0, [r5, r0]
	movs r1, #0x20
	str r1, [sp]
	movs r1, #0x14
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	adds r3, r2, #0
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	adds r0, r4, #0
	bl FUN_0200770C
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0xc]
	movs r1, #7
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
_021F0368: .4byte 0x0000050C
_021F036C: .4byte 0x00000508
	thumb_func_end ov101_021F0284

	thumb_func_start ov101_021F0370
ov101_021F0370: @ 0x021F0370
	push {r3, lr}
	ldr r1, _021F0384 @ =0x00000508
	ldr r0, [r0, r1]
	bl FUN_0201AB0C
	movs r0, #4
	bl FUN_02002DB4
	pop {r3, pc}
	nop
_021F0384: .4byte 0x00000508
	thumb_func_end ov101_021F0370

	thumb_func_start ov101_021F0388
ov101_021F0388: @ 0x021F0388
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x92
	bl FUN_02007688
	adds r4, r0, #0
	movs r1, #0
	movs r0, #7
	str r1, [sp]
	lsls r0, r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldrb r2, [r5, #0x11]
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	adds r1, r4, #0
	adds r2, #0xa
	bl FUN_02003220
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #6
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldrb r2, [r5, #0x11]
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	adds r1, r4, #0
	adds r2, r2, #4
	bl FUN_02003220
	movs r0, #2
	str r0, [sp]
	movs r0, #0x16
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	adds r1, r4, #0
	bl FUN_02003220
	movs r0, #3
	str r0, [sp]
	movs r0, #0x16
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	adds r1, r4, #0
	bl FUN_02003220
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r0, #0x10
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x40
	movs r3, #0xc0
	bl FUN_02003E5C
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl FUN_0200398C
	ldr r0, [r5, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F0388

	thumb_func_start ov101_021F0464
ov101_021F0464: @ 0x021F0464
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0xbc
	ldr r0, [r0]
	adds r4, r1, #0
	bl FUN_02024830
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x58
	movs r1, #0
	bl FUN_0201D978
	cmp r4, #0
	beq _021F0508
	movs r0, #8
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xb0
	bl FUN_02003E5C
	movs r0, #8
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r2, #0xe0
	ldr r0, [r0, #0x78]
	movs r3, #0x20
	bl FUN_02003E5C
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x60
	movs r3, #0x20
	bl FUN_02003E5C
	movs r0, #8
	str r0, [sp]
	movs r2, #0
	str r2, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r3, #0x40
	bl FUN_02003E5C
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0xc8
	adds r0, #0xc4
	ldrb r1, [r1]
	ldr r0, [r0]
	bl ov101_021F1EE8
	movs r1, #0
	adds r2, r0, #0
	str r1, [sp]
	ldr r0, _021F0574 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x58
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	b _021F0552
_021F0508:
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r2, #0xe0
	ldr r0, [r0, #0x78]
	movs r3, #0x20
	bl FUN_02003E5C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x40
	movs r3, #0xc0
	bl FUN_02003E5C
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r3, #0x40
	bl FUN_02003E5C
_021F0552:
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl FUN_0200398C
	ldr r0, [r5, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021F0574: .4byte 0x00010200
	thumb_func_end ov101_021F0464

	thumb_func_start ov101_021F0578
ov101_021F0578: @ 0x021F0578
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	adds r5, r7, #0
	ldr r4, _021F05C4 @ =0x021F8420
	movs r6, #0
	adds r5, #0x48
_021F0586:
	ldrb r0, [r4, #2]
	adds r1, r5, #0
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #4]
	str r0, [sp, #8]
	ldrb r0, [r4, #5]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	str r0, [sp, #0x10]
	ldr r0, [r7, #0xc]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r0, #0x74]
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #4
	blt _021F0586
	ldr r0, _021F05C8 @ =0x000003E1
	bl FUN_020027F0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021F05C4: .4byte 0x021F8420
_021F05C8: .4byte 0x000003E1
	thumb_func_end ov101_021F0578

	thumb_func_start ov101_021F05CC
ov101_021F05CC: @ 0x021F05CC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r5, #0x48
_021F05D4:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #4
	blt _021F05D4
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F05CC

	thumb_func_start ov101_021F05EC
ov101_021F05EC: @ 0x021F05EC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x1b
	adds r2, r1, #0
	ldr r3, [r6]
	movs r0, #0
	adds r2, #0xf4
	bl FUN_0200BAF8
	str r0, [r6, #0x14]
	ldr r2, [r6]
	movs r0, #2
	movs r1, #0x20
	bl FUN_0200BD18
	str r0, [r6, #0x18]
	movs r0, #0xa
	ldr r1, [r6]
	lsls r0, r0, #6
	bl FUN_02026354
	str r0, [r6, #0x1c]
	movs r0, #0xa
	ldr r1, [r6]
	lsls r0, r0, #6
	bl FUN_02026354
	str r0, [r6, #0x20]
	movs r4, #0
	adds r5, r6, #0
_021F0628:
	adds r1, r4, #0
	ldr r0, [r6, #0x14]
	adds r1, #0x14
	bl FUN_0200BBA0
	str r0, [r5, #0x24]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blt _021F0628
	ldr r0, [r6, #0xc]
	ldr r0, [r0, #0x30]
	bl FUN_0202AD3C
	adds r6, #0x44
	strb r0, [r6]
	movs r0, #1
	bl FUN_02002BA8
	movs r0, #1
	bl FUN_02002B34
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021F05EC

	thumb_func_start ov101_021F0658
ov101_021F0658: @ 0x021F0658
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_021F0660:
	ldr r0, [r5, #0x24]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blt _021F0660
	ldr r0, [r6, #0x20]
	bl FUN_02026380
	ldr r0, [r6, #0x1c]
	bl FUN_02026380
	ldr r0, [r6, #0x18]
	bl FUN_0200BDA0
	ldr r0, [r6, #0x14]
	bl FUN_0200BB44
	movs r0, #0
	bl FUN_02002BA8
	movs r0, #0
	bl FUN_02002B34
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F0658

	thumb_func_start ov101_021F0694
ov101_021F0694: @ 0x021F0694
	push {r3, r4, lr}
	sub sp, #0x3c
	adds r4, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x3c
	blx FUN_020D4994
	ldr r0, [r4]
	str r0, [sp]
	ldr r0, [r4, #0xc]
	adds r0, #0xc
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xbc
	ldr r0, [r0]
	str r4, [sp, #0xc]
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x74]
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r0, #0x48
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r0, #0x58
	str r0, [sp, #0x18]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x78]
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r1, [r0]
	add r0, sp, #0x20
	strb r1, [r0, #0x18]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrh r1, [r0, #0x10]
	add r0, sp, #0
	strh r1, [r0, #0x34]
	ldr r1, [r4, #0xc]
	ldr r1, [r1, #0x20]
	ldrh r1, [r1, #0x12]
	strh r1, [r0, #0x36]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x24]
	str r0, [sp, #0x20]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x24]
	bl FUN_0202ED88
	str r0, [sp, #0x24]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x34]
	str r0, [sp, #0x28]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x2c]
	str r0, [sp, #0x2c]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x24]
	bl FUN_02028D3C
	str r0, [sp, #0x30]
	add r0, sp, #0
	bl ov101_021F1D74
	adds r4, #0xc4
	str r0, [r4]
	add sp, #0x3c
	pop {r3, r4, pc}
	thumb_func_end ov101_021F0694

	thumb_func_start ov101_021F0720
ov101_021F0720: @ 0x021F0720
	ldr r3, _021F0728 @ =ov101_021F1E80
	adds r0, #0xc4
	ldr r0, [r0]
	bx r3
	.align 2, 0
_021F0728: .4byte ov101_021F1E80
	thumb_func_end ov101_021F0720

	thumb_func_start ov101_021F072C
ov101_021F072C: @ 0x021F072C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #3
	bl FUN_021E6978
	ldr r1, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, [r1, #0x78]
	bl FUN_02018424
	adds r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021F072C

	thumb_func_start ov101_021F0748
ov101_021F0748: @ 0x021F0748
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xc0
	ldr r0, [r0]
	bl FUN_02018474
	ldr r0, [r4, #0xc]
	bl FUN_021E69C8
	pop {r4, pc}
	thumb_func_end ov101_021F0748

	thumb_func_start ov101_021F075C
ov101_021F075C: @ 0x021F075C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r4, _021F0858 @ =0x021F84E8
	movs r7, #0
	adds r5, r6, #0
_021F0766:
	ldr r1, [r6, #0xc]
	adds r2, r4, #0
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r5, #0
	adds r1, #0x88
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DD3C
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0202484C
	adds r7, r7, #1
	adds r4, #0x28
	adds r5, r5, #4
	cmp r7, #5
	ble _021F0766
	adds r4, r6, #0
	movs r7, #6
	adds r4, #0x18
	movs r5, #0x90
_021F07B4:
	ldr r1, [r6, #0xc]
	ldr r2, _021F085C @ =0x021F85D8
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r4, #0
	adds r1, #0x88
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DD3C
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DD60
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0202484C
	adds r0, r4, #0
	adds r2, r5, #0
	adds r0, #0x88
	subs r2, #0x80
	lsls r2, r2, #0x10
	ldr r0, [r0]
	movs r1, #0xc
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, #0x18
	cmp r7, #0xc
	ble _021F07B4
	ldr r1, [r6, #0xc]
	ldr r2, _021F0860 @ =0x021F8600
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	adds r1, r6, #0
	adds r1, #0xbc
	str r0, [r1]
	adds r0, r6, #0
	adds r0, #0xbc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DD3C
	adds r0, r6, #0
	adds r0, #0xbc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	adds r6, #0xbc
	ldr r0, [r6]
	movs r1, #0
	bl FUN_0202484C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F0858: .4byte 0x021F84E8
_021F085C: .4byte 0x021F85D8
_021F0860: .4byte 0x021F8600
	thumb_func_end ov101_021F075C

	thumb_func_start ov101_021F0864
ov101_021F0864: @ 0x021F0864
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021F086A:
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	bl FUN_0200D018
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xe
	blt _021F086A
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F0864

	thumb_func_start ov101_021F0880
ov101_021F0880: @ 0x021F0880
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0
	ldr r5, _021F08D4 @ =0x021F8404
	str r0, [sp]
	adds r6, r7, #0
_021F088C:
	ldrb r0, [r5]
	ldr r1, [r7]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	bl FUN_02014918
	ldr r1, _021F08D8 @ =0x000004E8
	movs r4, #0
	str r0, [r6, r1]
	ldrb r0, [r5]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	cmp r0, #0
	ble _021F08C4
_021F08A8:
	ldr r0, _021F08D8 @ =0x000004E8
	ldrb r2, [r5, #1]
	ldr r0, [r6, r0]
	ldr r1, [r7, #0x14]
	adds r2, r2, r4
	adds r3, r4, #0
	bl FUN_02014960
	ldrb r0, [r5]
	adds r4, r4, #1
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	cmp r4, r0
	blt _021F08A8
_021F08C4:
	ldr r0, [sp]
	adds r5, r5, #4
	adds r0, r0, #1
	adds r6, r6, #4
	str r0, [sp]
	cmp r0, #7
	blt _021F088C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F08D4: .4byte 0x021F8404
_021F08D8: .4byte 0x000004E8
	thumb_func_end ov101_021F0880

	thumb_func_start ov101_021F08DC
ov101_021F08DC: @ 0x021F08DC
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r7, _021F08FC @ =0x000004E8
	adds r5, r0, #0
	adds r6, r4, #0
_021F08E6:
	ldr r0, _021F08FC @ =0x000004E8
	ldr r0, [r5, r0]
	bl FUN_02014950
	str r6, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #7
	blt _021F08E6
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F08FC: .4byte 0x000004E8
	thumb_func_end ov101_021F08DC

	thumb_func_start ov101_021F0900
ov101_021F0900: @ 0x021F0900
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F0990
	ldr r1, [r4, #0xc]
	ldrb r0, [r1, #6]
	cmp r0, #0
	ldr r0, [r1, #0x7c]
	bne _021F091C
	movs r1, #0
	adds r2, r1, #0
	bl FUN_021E7128
	pop {r4, pc}
_021F091C:
	movs r1, #0
	movs r2, #1
	bl FUN_021E7128
	ldr r0, [r4, #0xc]
	bl FUN_021E5DC8
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E72F8
	adds r4, #0xe0
	adds r0, r4, #0
	movs r1, #0xff
	movs r2, #0
	bl ov101_021F1290
	pop {r4, pc}
	thumb_func_end ov101_021F0900

	thumb_func_start ov101_021F0944
ov101_021F0944: @ 0x021F0944
	ldr r3, _021F0950 @ =ov101_021F1290
	adds r0, #0xe0
	movs r1, #0xff
	movs r2, #1
	bx r3
	nop
_021F0950: .4byte ov101_021F1290
	thumb_func_end ov101_021F0944

	thumb_func_start ov101_021F0954
ov101_021F0954: @ 0x021F0954
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0
	strb r1, [r0, #6]
	adds r0, r4, #0
	adds r0, #0xe0
	movs r1, #0xff
	movs r2, #1
	bl ov101_021F1290
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	adds r2, r1, #0
	bl FUN_021E7128
	pop {r4, pc}
	thumb_func_end ov101_021F0954

	thumb_func_start ov101_021F0978
ov101_021F0978: @ 0x021F0978
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xe0
	bl ov101_021F1804
	adds r4, #0xe0
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl ov101_021F1364
	pop {r4, pc}
	thumb_func_end ov101_021F0978

	thumb_func_start ov101_021F0990
ov101_021F0990: @ 0x021F0990
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F0F48
	adds r0, r4, #0
	bl ov101_021F11B0
	adds r0, r4, #0
	adds r4, #0xe0
	movs r2, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov101_021F11E0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F0990

	thumb_func_start ov101_021F09B0
ov101_021F09B0: @ 0x021F09B0
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r5, r0, #0
	adds r0, #0xcc
	strb r1, [r0]
	adds r4, r2, #0
	add r0, sp, #0x18
	movs r1, #0
	movs r2, #0x18
	blx FUN_020D4994
	ldr r0, _021F0A74 @ =0x021F8628
	add r2, sp, #0x18
	ldrh r3, [r0]
	add r1, sp, #0x18
	strh r3, [r2]
	ldrh r3, [r0, #2]
	strh r3, [r2, #2]
	ldrh r3, [r0, #4]
	strh r3, [r2, #4]
	ldrh r3, [r0, #6]
	strh r3, [r2, #6]
	ldrh r3, [r0, #8]
	ldrh r0, [r0, #0xa]
	strh r3, [r2, #8]
	strh r0, [r2, #0xa]
	lsls r3, r4, #2
	ldr r0, _021F0A78 @ =0x000004E8
	adds r6, r5, r3
	ldr r0, [r6, r0]
	str r0, [sp, #0x24]
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x74]
	str r0, [sp, #0x28]
	ldr r0, _021F0A7C @ =0x021F8404
	ldrb r6, [r0, r3]
	lsls r6, r6, #0x1d
	lsrs r6, r6, #0x1d
	strb r6, [r2, #0x14]
	cmp r4, #1
	bne _021F0A36
	ldr r2, _021F0A80 @ =0x021F8407
	ldr r4, _021F0A84 @ =0x021F8406
	ldrb r2, [r2, r3]
	str r2, [sp]
	ldrb r0, [r0, r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, _021F0A88 @ =ov101_021F0A94
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r0, #1
	str r0, [sp, #0x14]
	ldr r2, [r5, #0xc]
	adds r0, r5, #0
	ldr r2, [r2, #0xc]
	adds r0, #0xc0
	lsls r2, r2, #0x18
	ldrb r3, [r4, r3]
	ldr r0, [r0]
	lsrs r2, r2, #0x18
	bl FUN_02018648
	b _021F0A68
_021F0A36:
	ldr r2, _021F0A80 @ =0x021F8407
	ldr r4, _021F0A84 @ =0x021F8406
	ldrb r2, [r2, r3]
	str r2, [sp]
	ldrb r0, [r0, r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, _021F0A8C @ =ov101_021F0AB8
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	movs r0, #1
	str r0, [sp, #0x14]
	ldr r2, [r5, #0xc]
	adds r0, r5, #0
	ldr r2, [r2, #0xc]
	adds r0, #0xc0
	lsls r2, r2, #0x18
	ldrb r3, [r4, r3]
	ldr r0, [r0]
	lsrs r2, r2, #0x18
	bl FUN_02018648
_021F0A68:
	ldr r1, _021F0A90 @ =0x00000504
	str r0, [r5, r1]
	ldr r0, _021F0A90 @ =0x00000504
	ldr r0, [r5, r0]
	add sp, #0x30
	pop {r4, r5, r6, pc}
	.align 2, 0
_021F0A74: .4byte 0x021F8628
_021F0A78: .4byte 0x000004E8
_021F0A7C: .4byte 0x021F8404
_021F0A80: .4byte 0x021F8407
_021F0A84: .4byte 0x021F8406
_021F0A88: .4byte ov101_021F0A94
_021F0A8C: .4byte ov101_021F0AB8
_021F0A90: .4byte 0x00000504
	thumb_func_end ov101_021F09B0

	thumb_func_start ov101_021F0A94
ov101_021F0A94: @ 0x021F0A94
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	cmp r3, #0
	beq _021F0AA4
	ldr r0, _021F0AB4 @ =0x00000941
	bl FUN_0200604C
_021F0AA4:
	adds r1, r5, #3
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov101_021F0ACC
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F0AB4: .4byte 0x00000941
	thumb_func_end ov101_021F0A94

	thumb_func_start ov101_021F0AB8
ov101_021F0AB8: @ 0x021F0AB8
	push {r3, lr}
	cmp r3, #0
	beq _021F0AC4
	ldr r0, _021F0AC8 @ =0x00000941
	bl FUN_0200604C
_021F0AC4:
	pop {r3, pc}
	nop
_021F0AC8: .4byte 0x00000941
	thumb_func_end ov101_021F0AB8

	thumb_func_start ov101_021F0ACC
ov101_021F0ACC: @ 0x021F0ACC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r2, #0
	beq _021F0B48
	ldr r0, _021F0B7C @ =0x0000050C
	movs r1, #0x20
	ldr r0, [r5, r0]
	movs r2, #0
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	movs r1, #0x18
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r3, #0x14
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #1
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x74]
	bl FUN_0201C4EC
	adds r0, r5, #0
	adds r0, #0x78
	movs r1, #5
	bl FUN_0201D978
	adds r4, r5, #0
	movs r0, #0
	adds r4, #0x24
	lsls r6, r6, #2
	ldr r1, [r4, r6]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #1
	lsls r1, r1, #8
	subs r0, r1, r0
	movs r1, #0
	lsrs r3, r0, #1
	str r1, [sp]
	ldr r0, _021F0B80 @ =0x00030205
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r4, r6]
	adds r0, #0x78
	bl FUN_020200FC
	b _021F0B6C
_021F0B48:
	adds r0, #0x78
	bl FUN_0201D8E4
	movs r0, #0x14
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	movs r2, #0
	ldr r0, [r0, #0x74]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201C8C4
_021F0B6C:
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	nop
_021F0B7C: .4byte 0x0000050C
_021F0B80: .4byte 0x00030205
	thumb_func_end ov101_021F0ACC

	thumb_func_start ov101_021F0B84
ov101_021F0B84: @ 0x021F0B84
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xe0
	bl ov101_021F1808
	adds r0, r4, #0
	adds r0, #0xe0
	movs r1, #1
	bl ov101_021F1338
	adds r0, r4, #0
	bl ov101_021F0944
	pop {r4, pc}
	thumb_func_end ov101_021F0B84

	thumb_func_start ov101_021F0BA0
ov101_021F0BA0: @ 0x021F0BA0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021F0C44 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _021F0BF2
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _021F0BF2
	ldr r0, [r4, #0xc]
	movs r1, #1
	strb r1, [r0, #6]
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	movs r2, #1
	bl FUN_021E7128
	ldr r0, [r4, #0xc]
	bl FUN_021E5DC8
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E72F8
	adds r4, #0xe0
	adds r0, r4, #0
	movs r1, #0xff
	movs r2, #0
	bl ov101_021F1290
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
_021F0BF2:
	adds r0, r4, #0
	adds r0, #0xe0
	bl ov101_021F1408
	cmp r0, #0
	blt _021F0C3E
	movs r1, #0xc
	muls r1, r0, r1
	adds r0, r4, r1
	adds r0, #0xf4
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc8
	strb r1, [r0]
	ldr r0, _021F0C48 @ =0x00000941
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0xe0
	movs r1, #0
	bl ov101_021F1338
	adds r0, r4, #0
	adds r0, #0xe0
	bl ov101_021F1804
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl ov101_021F09B0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl ov101_021F0ACC
	movs r0, #8
	pop {r4, pc}
_021F0C3E:
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	.align 2, 0
_021F0C44: .4byte 0x021D110C
_021F0C48: .4byte 0x00000941
	thumb_func_end ov101_021F0BA0

	thumb_func_start ov101_021F0C4C
ov101_021F0C4C: @ 0x021F0C4C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x10]
	cmp r0, #0
	bne _021F0C6C
	ldr r0, [r5, #0xc]
	bl FUN_021E5924
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021F0C6C
	ldr r1, [r5, #0xc]
	movs r2, #1
	str r2, [r1, #0xc]
	pop {r3, r4, r5, pc}
_021F0C6C:
	adds r0, r5, #0
	adds r0, #0xe0
	bl ov101_021F16A8
	adds r4, r0, #0
	bmi _021F0CD8
	ldr r0, [r5, #0xc]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _021F0C86
	adds r0, r5, #0
	bl ov101_021F0954
_021F0C86:
	cmp r4, #0
	bne _021F0C90
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021F0C90:
	subs r1, r4, #1
	movs r0, #0xc
	muls r0, r1, r0
	adds r0, r5, r0
	adds r0, #0xf4
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc8
	strb r1, [r0]
	ldr r0, _021F0CE0 @ =0x00000941
	bl FUN_0200604C
	adds r0, r5, #0
	adds r0, #0xe0
	movs r1, #0
	bl ov101_021F1338
	adds r0, r5, #0
	adds r0, #0xe0
	bl ov101_021F1804
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	bl ov101_021F09B0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	bl ov101_021F0ACC
	ldr r0, [r5, #0xc]
	movs r1, #1
	str r1, [r0, #0xc]
	movs r0, #8
	pop {r3, r4, r5, pc}
_021F0CD8:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	nop
_021F0CE0: .4byte 0x00000941
	thumb_func_end ov101_021F0C4C

	thumb_func_start ov101_021F0CE4
ov101_021F0CE4: @ 0x021F0CE4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0xe0
	add r1, sp, #0
	bl ov101_021F1768
	adds r4, r0, #0
	ldr r0, [sp]
	cmp r0, #0
	bne _021F0D16
	ldrb r0, [r5, #0x10]
	cmp r0, #0
	bne _021F0D0A
	ldr r0, [r5, #0xc]
	bl FUN_021E5900
_021F0D0A:
	adds r0, r5, #0
	adds r0, #0xe0
	bl ov101_021F1564
	adds r4, r0, #0
	b _021F0D1C
_021F0D16:
	ldr r0, [r5, #0xc]
	movs r1, #1
	str r1, [r0, #0xc]
_021F0D1C:
	cmp r4, #0
	bge _021F0D24
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F0D24:
	adds r0, r5, #0
	adds r0, #0xe2
	ldrb r2, [r0]
	cmp r4, r2
	bne _021F0D32
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F0D32:
	movs r1, #0xc
	muls r1, r2, r1
	adds r1, r5, r1
	adds r1, #0xf0
	lsls r2, r4, #0x18
	ldr r1, [r1]
	adds r0, r5, #0
	lsrs r2, r2, #0x18
	bl ov101_021F0E0C
	adds r0, r5, #0
	adds r0, #0xe2
	strb r4, [r0]
	adds r0, r5, #0
	bl ov101_021F11B0
	adds r2, r5, #0
	adds r1, r5, #0
	adds r0, r5, #0
	adds r2, #0xe3
	adds r5, #0xe1
	ldrb r2, [r2]
	ldrb r3, [r5]
	adds r1, #0xe0
	bl ov101_021F11E0
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F0CE4

	thumb_func_start ov101_021F0D6C
ov101_021F0D6C: @ 0x021F0D6C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0xcd
	ldrb r2, [r1]
	movs r1, #0xc
	ldr r0, [r4]
	muls r1, r2, r1
	bl FUN_0201AA8C
	adds r1, r4, #0
	adds r1, #0xd4
	str r0, [r1]
	adds r0, r4, #0
	bl ov101_021F1840
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F0D6C

	thumb_func_start ov101_021F0D90
ov101_021F0D90: @ 0x021F0D90
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0xd8
	ldr r1, [r1]
	movs r0, #0
	ldrb r2, [r1, #1]
	adds r1, r4, #0
	adds r1, #0xd0
	ldr r1, [r1]
	adds r0, r0, #1
	strb r2, [r1]
	adds r1, r4, #0
	adds r1, #0xd8
	ldr r2, [r1]
	lsls r0, r0, #0x18
	ldr r1, [r2, #8]
	lsrs r0, r0, #0x18
	cmp r1, r2
	beq _021F0DD6
_021F0DB8:
	adds r3, r4, #0
	adds r3, #0xd0
	ldrb r5, [r1, #1]
	adds r2, r0, #0
	ldr r3, [r3]
	adds r0, r0, #1
	strb r5, [r3, r2]
	adds r2, r4, #0
	adds r2, #0xd8
	lsls r0, r0, #0x18
	ldr r1, [r1, #8]
	ldr r2, [r2]
	lsrs r0, r0, #0x18
	cmp r1, r2
	bne _021F0DB8
_021F0DD6:
	adds r2, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, r4, #0
	adds r2, #0xcd
	adds r1, #0xd0
	ldrb r2, [r2]
	ldr r0, [r0, #0x28]
	ldr r1, [r1]
	bl FUN_0202EF70
	adds r2, r4, #0
	adds r2, #0xcd
	adds r0, r4, #0
	ldrb r3, [r2]
	adds r0, #0xd4
	movs r2, #0xc
	ldr r0, [r0]
	movs r1, #0
	muls r2, r3, r2
	blx FUN_020D4994
	adds r4, #0xd4
	ldr r0, [r4]
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F0D90

	thumb_func_start ov101_021F0E0C
ov101_021F0E0C: @ 0x021F0E0C
	push {r3, r4, r5, r6}
	ldr r5, [r1, #8]
	ldr r4, [r1, #4]
	movs r3, #0
	str r5, [r4, #8]
	ldr r5, [r1, #4]
	ldr r4, [r1, #8]
	str r5, [r4, #4]
	adds r4, r0, #0
	adds r4, #0xd8
	ldr r4, [r4]
	cmp r1, r4
	bne _021F0E2E
	adds r4, r0, #0
	ldr r5, [r1, #8]
	adds r4, #0xd8
	str r5, [r4]
_021F0E2E:
	adds r4, r0, #0
	adds r4, #0xdc
	ldr r4, [r4]
	cmp r1, r4
	bne _021F0E40
	adds r4, r0, #0
	ldr r5, [r1, #4]
	adds r4, #0xdc
	str r5, [r4]
_021F0E40:
	adds r4, r0, #0
	adds r4, #0xcd
	ldrb r4, [r4]
	subs r4, r4, #1
	cmp r2, r4
	bne _021F0E76
	adds r2, r0, #0
	adds r2, #0xdc
	ldr r2, [r2]
	str r2, [r1, #4]
	adds r2, r0, #0
	adds r2, #0xdc
	ldr r2, [r2]
	ldr r2, [r2, #8]
	str r2, [r1, #8]
	adds r2, r0, #0
	adds r2, #0xdc
	ldr r2, [r2]
	str r1, [r2, #8]
	adds r2, r0, #0
	adds r2, #0xd8
	ldr r2, [r2]
	adds r0, #0xdc
	str r1, [r2, #4]
	str r1, [r0]
	pop {r3, r4, r5, r6}
	bx lr
_021F0E76:
	adds r4, r0, #0
	adds r4, #0xd8
	ldr r6, [r4]
	adds r4, r6, #0
_021F0E7E:
	adds r5, r3, #0
	adds r3, r3, #1
	cmp r5, r2
	beq _021F0E8A
	ldr r4, [r4, #8]
	b _021F0EA6
_021F0E8A:
	str r4, [r1, #8]
	ldr r2, [r4, #4]
	str r2, [r1, #4]
	str r1, [r2, #8]
	adds r2, r0, #0
	str r1, [r4, #4]
	adds r2, #0xd8
	ldr r2, [r2]
	cmp r4, r2
	bne _021F0EAA
	adds r0, #0xd8
	str r1, [r0]
	pop {r3, r4, r5, r6}
	bx lr
_021F0EA6:
	cmp r4, r6
	bne _021F0E7E
_021F0EAA:
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
	thumb_func_end ov101_021F0E0C

	thumb_func_start ov101_021F0EB0
ov101_021F0EB0: @ 0x021F0EB0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0xc4
	ldr r0, [r0]
	movs r3, #0
	adds r0, #0x84
	ldr r2, [r0]
	adds r0, r6, #0
	adds r0, #0xcd
	ldrb r0, [r0]
	subs r4, r0, #1
	cmp r4, #0
	ble _021F0F10
	adds r2, r2, r1
_021F0ECC:
	cmp r4, r3
	ble _021F0F02
_021F0ED0:
	adds r0, r6, #0
	adds r0, #0xd0
	ldr r7, [r0]
	movs r0, #0x14
	ldrb r5, [r7, r4]
	ldrb r1, [r3, r7]
	muls r0, r5, r0
	mov ip, r5
	movs r5, #0x14
	muls r5, r1, r5
	adds r0, r2, r0
	adds r5, r2, r5
	ldrb r0, [r0, #0x10]
	ldrb r5, [r5, #0x10]
	cmp r0, r5
	bhs _021F0EFC
	mov r0, ip
	strb r0, [r3, r7]
	adds r0, r6, #0
	adds r0, #0xd0
	ldr r0, [r0]
	strb r1, [r0, r4]
_021F0EFC:
	subs r4, r4, #1
	cmp r4, r3
	bgt _021F0ED0
_021F0F02:
	adds r0, r6, #0
	adds r0, #0xcd
	ldrb r0, [r0]
	adds r3, r3, #1
	subs r4, r0, #1
	cmp r3, r4
	blt _021F0ECC
_021F0F10:
	adds r0, r6, #0
	bl ov101_021F1840
	adds r0, r6, #0
	bl ov101_021F11B0
	adds r0, r6, #0
	adds r2, r6, #0
	movs r1, #0
	adds r0, #0xe1
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0xe1
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0xe3
	strb r1, [r0]
	adds r1, r6, #0
	adds r0, r6, #0
	adds r2, #0xe3
	adds r6, #0xe1
	ldrb r2, [r2]
	ldrb r3, [r6]
	adds r1, #0xe0
	bl ov101_021F11E0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov101_021F0EB0

	thumb_func_start ov101_021F0F48
ov101_021F0F48: @ 0x021F0F48
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xe0
	ldr r2, _021F11AC @ =0x00000408
	adds r0, r4, #0
	movs r1, #0
	blx FUN_020D4994
	adds r6, r4, #0
	movs r7, #0
	adds r6, #0xc
_021F0F60:
	adds r0, r6, #0
	bl ov101_021F18E0
	adds r7, r7, #1
	adds r6, #0xc
	cmp r7, #0x4b
	blt _021F0F60
	adds r0, r5, #0
	adds r0, #0xcd
	ldrb r0, [r0]
	movs r1, #0x39
	lsls r1, r1, #4
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x68
	str r0, [r4, r1]
	adds r0, r5, #0
	adds r0, #0xc4
	ldr r2, [r0]
	adds r0, r1, #0
	adds r0, #0x6c
	str r2, [r4, r0]
	ldrb r2, [r4, #6]
	movs r0, #1
	movs r6, #0
	bics r2, r0
	adds r0, r1, #0
	strb r2, [r4, #6]
	ldr r2, [r5, #0xc]
	adds r0, #0x70
	adds r2, #0xc
	str r2, [r4, r0]
	adds r0, r5, #0
	adds r0, #0x10
	adds r1, #0x74
	str r0, [r4, r1]
	movs r1, #0xf3
	adds r2, r5, #0
	adds r3, r4, #0
	lsls r1, r1, #2
_021F0FB0:
	adds r0, r2, #0
	adds r0, #0x98
	ldr r0, [r0]
	adds r6, r6, #1
	str r0, [r3, r1]
	adds r2, r2, #4
	adds r3, r3, #4
	cmp r6, #2
	blt _021F0FB0
	movs r1, #0xf5
	movs r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	lsls r1, r1, #2
_021F0FCC:
	adds r0, r2, #0
	adds r0, #0xa0
	ldr r0, [r0]
	adds r6, r6, #1
	str r0, [r3, r1]
	adds r2, r2, #4
	adds r3, r3, #4
	cmp r6, #6
	blt _021F0FCC
	movs r1, #0xfb
	movs r3, #0
	adds r2, r4, #0
	lsls r1, r1, #2
_021F0FE6:
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	adds r3, r3, #1
	str r0, [r2, r1]
	adds r5, r5, #4
	adds r2, r2, #4
	cmp r3, #4
	blt _021F0FE6
	movs r3, #0xe5
	lsls r3, r3, #2
	movs r2, #1
	strb r2, [r4, r3]
	movs r1, #9
	adds r0, r3, #1
	strb r1, [r4, r0]
	movs r1, #2
	adds r0, r3, #2
	strb r1, [r4, r0]
	movs r0, #3
	adds r5, r3, #3
	strb r0, [r4, r5]
	adds r6, r3, #4
	movs r5, #4
	strb r5, [r4, r6]
	adds r5, r3, #0
	movs r6, #0xb
	adds r5, #0xa
	strb r6, [r4, r5]
	adds r6, r3, #5
	movs r5, #5
	strb r5, [r4, r6]
	movs r5, #0xa
	adds r6, r3, #6
	strb r5, [r4, r6]
	adds r7, r3, #7
	movs r6, #6
	strb r6, [r4, r7]
	adds r7, r3, #0
	adds r7, #8
	movs r6, #7
	strb r6, [r4, r7]
	adds r7, r3, #0
	adds r7, #9
	movs r6, #8
	strb r6, [r4, r7]
	adds r6, r3, #0
	adds r6, #0xb
	strb r5, [r4, r6]
	adds r5, r3, #1
	adds r7, r3, #2
	ldrb r6, [r4, r5]
	ldrb r5, [r4, r3]
	ldrb r7, [r4, r7]
	lsls r5, r5, #0x18
	lsls r7, r7, #0x18
	lsrs r5, r5, #8
	lsrs r7, r7, #0x10
	orrs r5, r7
	orrs r6, r5
	adds r5, r3, #0
	adds r5, #0xc
	str r6, [r4, r5]
	adds r5, r3, #6
	ldrb r6, [r4, r5]
	adds r5, r3, #5
	adds r7, r3, #7
	ldrb r5, [r4, r5]
	ldrb r7, [r4, r7]
	lsls r5, r5, #0x18
	lsls r7, r7, #0x18
	lsrs r5, r5, #8
	lsrs r7, r7, #0x10
	orrs r5, r7
	orrs r6, r5
	adds r5, r3, #0
	adds r5, #0x10
	str r6, [r4, r5]
	adds r5, r3, #1
	ldrb r6, [r4, r5]
	adds r5, r3, #3
	adds r7, r3, #4
	ldrb r5, [r4, r5]
	ldrb r7, [r4, r7]
	lsls r5, r5, #0x18
	lsls r7, r7, #0x18
	lsrs r5, r5, #8
	lsrs r7, r7, #0x10
	orrs r5, r7
	orrs r6, r5
	adds r5, r3, #0
	adds r5, #0x14
	str r6, [r4, r5]
	adds r5, r3, #6
	ldrb r6, [r4, r5]
	adds r5, r3, #0
	adds r7, r3, #0
	adds r5, #8
	adds r7, #9
	ldrb r5, [r4, r5]
	ldrb r7, [r4, r7]
	lsls r5, r5, #0x18
	lsls r7, r7, #0x18
	lsrs r5, r5, #8
	lsrs r7, r7, #0x10
	orrs r5, r7
	orrs r6, r5
	adds r5, r3, #0
	adds r5, #0x18
	str r6, [r4, r5]
	adds r5, r3, #0
	adds r5, #0x1c
	strb r2, [r4, r5]
	adds r2, r3, #0
	movs r5, #0xc
	adds r2, #0x1d
	strb r5, [r4, r2]
	adds r2, r3, #0
	adds r2, #0x1e
	strb r1, [r4, r2]
	adds r1, r3, #0
	adds r1, #0x1f
	strb r0, [r4, r1]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r1, #0x20
	movs r0, #4
	strb r0, [r4, r1]
	adds r0, r3, #0
	movs r1, #0xe
	adds r0, #0x26
	strb r1, [r4, r0]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #5
	strb r0, [r4, r1]
	adds r1, r3, #0
	movs r0, #0xd
	adds r1, #0x22
	strb r0, [r4, r1]
	adds r2, #0x23
	movs r1, #6
	strb r1, [r4, r2]
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #7
	strb r1, [r4, r2]
	adds r2, r3, #0
	adds r2, #0x25
	movs r1, #8
	strb r1, [r4, r2]
	adds r1, r3, #0
	adds r1, #0x27
	strb r0, [r4, r1]
	adds r1, r3, #0
	adds r1, #0x1c
	ldrb r1, [r4, r1]
	adds r0, r3, #0
	adds r0, #0x1d
	lsls r1, r1, #0x18
	lsrs r2, r1, #8
	adds r1, r3, #0
	adds r1, #0x1e
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	orrs r1, r2
	orrs r1, r0
	adds r0, r3, #0
	adds r0, #0x28
	str r1, [r4, r0]
	adds r1, r3, #0
	adds r1, #0x21
	ldrb r1, [r4, r1]
	adds r0, r3, #0
	adds r0, #0x22
	lsls r1, r1, #0x18
	lsrs r2, r1, #8
	adds r1, r3, #0
	adds r1, #0x23
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	orrs r1, r2
	orrs r1, r0
	adds r0, r3, #0
	adds r0, #0x2c
	str r1, [r4, r0]
	adds r1, r3, #0
	adds r1, #0x1f
	ldrb r1, [r4, r1]
	adds r0, r3, #0
	adds r0, #0x1d
	lsls r1, r1, #0x18
	lsrs r2, r1, #8
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	orrs r1, r2
	orrs r1, r0
	adds r0, r3, #0
	adds r0, #0x30
	str r1, [r4, r0]
	adds r1, r3, #0
	adds r1, #0x24
	ldrb r1, [r4, r1]
	adds r0, r3, #0
	adds r0, #0x22
	lsls r1, r1, #0x18
	lsrs r2, r1, #8
	adds r1, r3, #0
	adds r1, #0x25
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	adds r3, #0x34
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	orrs r1, r2
	orrs r0, r1
	str r0, [r4, r3]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F11AC: .4byte 0x00000408
	thumb_func_end ov101_021F0F48

	thumb_func_start ov101_021F11B0
ov101_021F11B0: @ 0x021F11B0
	push {r3, r4}
	adds r3, r0, #0
	adds r1, r0, #0
	adds r0, #0xe0
	adds r1, #0xd8
	ldr r2, [r1]
	ldrb r0, [r0]
	adds r3, #0xe0
	movs r1, #0
	cmp r0, #0
	ble _021F11DC
	adds r4, r3, #0
_021F11C8:
	strb r1, [r4, #0xc]
	ldrb r0, [r2, #1]
	adds r1, r1, #1
	strb r0, [r4, #0x14]
	str r2, [r4, #0x10]
	ldrb r0, [r3]
	ldr r2, [r2, #8]
	adds r4, #0xc
	cmp r1, r0
	blt _021F11C8
_021F11DC:
	pop {r3, r4}
	bx lr
	thumb_func_end ov101_021F11B0

	thumb_func_start ov101_021F11E0
ov101_021F11E0: @ 0x021F11E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r2, [sp, #8]
	adds r5, r1, #0
	str r3, [sp, #0xc]
	str r0, [sp, #4]
	ldrb r1, [r5]
	ldr r0, [sp, #8]
	cmp r0, r1
	blo _021F11F8
	movs r0, #0
	str r0, [sp, #8]
_021F11F8:
	adds r0, r5, #0
	bl ov101_021F19E4
	movs r6, #0
	strb r6, [r5, #5]
	ldr r0, [sp, #8]
	adds r7, r6, #0
	strb r0, [r5, #3]
	movs r0, #0xff
	strb r0, [r5, #2]
	ldr r4, [sp, #8]
_021F120E:
	ldrb r0, [r5]
	cmp r4, r0
	blt _021F121C
	subs r0, r4, #1
	strb r0, [r5, #4]
	strb r6, [r5, #5]
	b _021F1238
_021F121C:
	adds r1, r6, #1
	lsls r1, r1, #0x18
	lsls r2, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	adds r3, r7, #0
	str r7, [sp]
	bl ov101_021F1A40
	adds r6, r6, #1
	adds r4, r4, #1
	cmp r6, #6
	blt _021F120E
_021F1238:
	ldrb r0, [r5, #5]
	cmp r0, #0
	bne _021F1248
	strb r6, [r5, #5]
	ldr r0, [sp, #8]
	subs r1, r6, #1
	adds r0, r1, r0
	strb r0, [r5, #4]
_021F1248:
	ldrb r1, [r5, #5]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _021F1254
	movs r0, #0
	str r0, [sp, #0xc]
_021F1254:
	ldr r0, [sp, #0xc]
	strb r0, [r5, #1]
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0201D578
	adds r0, r5, #0
	bl ov101_021F1B48
	ldr r0, [sp, #4]
	adds r0, #0xcb
	str r0, [sp, #4]
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F1282
	ldr r1, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #0
	bl ov101_021F1290
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F1282:
	ldr r1, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #1
	bl ov101_021F1290
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F11E0

	thumb_func_start ov101_021F1290
ov101_021F1290: @ 0x021F1290
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	str r1, [sp]
	cmp r2, #0
	beq _021F12B4
	movs r7, #0xfb
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_021F12A2:
	ldr r0, [r5, r7]
	movs r1, #1
	bl FUN_02024830
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021F12A2
	b _021F12CC
_021F12B4:
	movs r7, #0xfb
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_021F12BC:
	ldr r0, [r4, r7]
	movs r1, #0
	bl FUN_02024830
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #4
	blt _021F12BC
_021F12CC:
	ldr r0, [sp]
	cmp r0, #6
	blo _021F12D6
	ldrb r0, [r6, #1]
	str r0, [sp]
_021F12D6:
	ldrb r1, [r6, #5]
	ldrb r0, [r6, #1]
	cmp r0, r1
	blo _021F12E6
	subs r0, r1, #1
	strb r0, [r6, #1]
	ldrb r0, [r6, #1]
	str r0, [sp]
_021F12E6:
	ldr r0, [sp]
	movs r1, #0x18
	adds r4, r0, #0
	muls r4, r1, r4
	adds r5, r4, #0
	movs r0, #0xfb
	adds r5, #8
	lsls r0, r0, #2
	lsls r2, r5, #0x10
	ldr r0, [r6, r0]
	movs r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	movs r0, #0x3f
	adds r4, #0x1e
	lsls r0, r0, #4
	lsls r2, r4, #0x10
	ldr r0, [r6, r0]
	movs r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	movs r0, #0xfd
	lsls r0, r0, #2
	lsls r2, r5, #0x10
	ldr r0, [r6, r0]
	movs r1, #0xe0
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	movs r0, #0xfe
	lsls r0, r0, #2
	lsls r2, r4, #0x10
	ldr r0, [r6, r0]
	movs r1, #0xe0
	asrs r2, r2, #0x10
	bl FUN_0200DD88
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov101_021F1290

	thumb_func_start ov101_021F1338
ov101_021F1338: @ 0x021F1338
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0xfb
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	lsls r7, r7, #2
_021F1344:
	movs r0, #0xfb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_0202484C
	ldr r0, [r5, r7]
	movs r1, #1
	bl FUN_02024830
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021F1344
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov101_021F1338

	thumb_func_start ov101_021F1364
ov101_021F1364: @ 0x021F1364
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	cmp r2, #0
	beq _021F13AE
	ldrb r0, [r5, #5]
	movs r6, #0
	cmp r0, #0
	ble _021F13C6
	adds r4, r5, #0
_021F1378:
	movs r0, #0xf5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	cmp r7, r6
	bne _021F1396
	movs r0, #0xf5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #7
	bl FUN_020248F0
	b _021F13A2
_021F1396:
	movs r0, #0xf5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #6
	bl FUN_020248F0
_021F13A2:
	ldrb r0, [r5, #5]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blt _021F1378
	pop {r3, r4, r5, r6, r7, pc}
_021F13AE:
	movs r4, #0
	movs r6, #0xf5
	adds r7, r4, #0
	lsls r6, r6, #2
_021F13B6:
	ldr r0, [r5, r6]
	adds r1, r7, #0
	bl FUN_02024830
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _021F13B6
_021F13C6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F1364

	thumb_func_start ov101_021F13C8
ov101_021F13C8: @ 0x021F13C8
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	ldrb r2, [r4, #6]
	bne _021F13F2
	movs r1, #0xfe
	bics r2, r1
	strb r2, [r4, #6]
	movs r1, #0xff
	movs r2, #0
	bl ov101_021F1364
	adds r0, r4, #0
	bl ov101_021F1808
	ldrb r1, [r4, #1]
	adds r0, r4, #0
	movs r2, #1
	bl ov101_021F1290
	pop {r4, pc}
_021F13F2:
	movs r1, #0xfe
	bics r2, r1
	movs r1, #2
	orrs r1, r2
	strb r1, [r4, #6]
	ldrb r1, [r4, #1]
	movs r2, #1
	bl ov101_021F1364
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F13C8

	thumb_func_start ov101_021F1408
ov101_021F1408: @ 0x021F1408
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r1, [r5, #7]
	lsls r2, r1, #0x1f
	lsrs r2, r2, #0x1f
	beq _021F141E
	bl ov101_021F1D44
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F141E:
	lsls r2, r1, #0x18
	lsrs r2, r2, #0x1b
	beq _021F143C
	movs r0, #0xf8
	bics r1, r0
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x18
	orrs r0, r1
	strb r0, [r5, #7]
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F143C:
	ldrb r6, [r5, #3]
	ldrb r1, [r5, #1]
	ldr r7, _021F1558 @ =0x021D110C
	movs r3, #1
	adds r1, r6, r1
	lsls r1, r1, #0x18
	ldr r2, [r7, #0x48]
	lsrs r4, r1, #0x18
	adds r1, r2, #0
	tst r1, r3
	beq _021F146E
	strb r4, [r5, #2]
	str r3, [sp]
	ldrb r1, [r5, #1]
	ldrb r2, [r5, #2]
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov101_021F1A40
	ldr r0, _021F155C @ =0x00000941
	bl FUN_0200604C
	ldrb r0, [r5, #2]
	pop {r3, r4, r5, r6, r7, pc}
_021F146E:
	ldr r3, [r7, #0x4c]
	movs r0, #0x40
	adds r1, r3, #0
	tst r1, r0
	beq _021F14BC
	cmp r4, #0
	bne _021F1480
	subs r0, #0x41
	pop {r3, r4, r5, r6, r7, pc}
_021F1480:
	ldr r0, _021F1560 @ =0x0000093F
	bl FUN_0200604C
	ldrb r0, [r5, #1]
	cmp r0, #0
	bne _021F149E
	cmp r4, #0
	beq _021F1498
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021F1B94
_021F1498:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F149E:
	subs r0, r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	adds r0, r5, #0
	movs r2, #1
	bl ov101_021F1290
	ldrb r1, [r5, #7]
	movs r0, #0xf8
	bics r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r5, #7]
	subs r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
_021F14BC:
	movs r0, #0x80
	adds r1, r3, #0
	tst r1, r0
	beq _021F1510
	ldrb r1, [r5]
	subs r1, r1, #1
	cmp r4, r1
	blt _021F14D0
	subs r0, #0x81
	pop {r3, r4, r5, r6, r7, pc}
_021F14D0:
	ldr r0, _021F1560 @ =0x0000093F
	bl FUN_0200604C
	ldrb r0, [r5, #1]
	cmp r0, #5
	bne _021F14F2
	ldrb r0, [r5]
	subs r0, r0, #1
	cmp r4, r0
	bge _021F14EC
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021F1B94
_021F14EC:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F14F2:
	adds r0, r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	adds r0, r5, #0
	movs r2, #1
	bl ov101_021F1290
	ldrb r1, [r5, #7]
	movs r0, #0xf8
	bics r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r5, #7]
	subs r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
_021F1510:
	movs r0, #0x20
	tst r0, r2
	beq _021F152E
	cmp r6, #0
	beq _021F1528
	ldr r0, _021F1560 @ =0x0000093F
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021F1C98
_021F1528:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F152E:
	movs r0, #0x10
	adds r1, r2, #0
	tst r1, r0
	beq _021F1552
	ldrb r0, [r5]
	adds r1, r6, #6
	cmp r1, r0
	bge _021F154C
	ldr r0, _021F1560 @ =0x0000093F
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021F1C98
_021F154C:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F1552:
	subs r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F1558: .4byte 0x021D110C
_021F155C: .4byte 0x00000941
_021F1560: .4byte 0x0000093F
	thumb_func_end ov101_021F1408

	thumb_func_start ov101_021F1564
ov101_021F1564: @ 0x021F1564
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrb r1, [r5, #7]
	lsls r2, r1, #0x1f
	lsrs r2, r2, #0x1f
	beq _021F157A
	bl ov101_021F1D44
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F157A:
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x1b
	beq _021F1598
	movs r0, #0xf8
	bics r1, r0
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x18
	orrs r0, r1
	strb r0, [r5, #7]
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F1598:
	ldrb r2, [r5, #3]
	ldrb r0, [r5, #1]
	ldr r3, _021F16A0 @ =0x021D110C
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, [r3, #0x48]
	movs r0, #1
	tst r0, r1
	beq _021F15B0
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_021F15B0:
	movs r0, #2
	tst r0, r1
	beq _021F15BA
	ldrb r0, [r5, #2]
	pop {r4, r5, r6, pc}
_021F15BA:
	ldr r6, [r3, #0x4c]
	movs r0, #0x40
	adds r3, r6, #0
	tst r3, r0
	beq _021F1608
	cmp r4, #0
	bne _021F15CC
	subs r0, #0x41
	pop {r4, r5, r6, pc}
_021F15CC:
	ldr r0, _021F16A4 @ =0x0000093F
	bl FUN_0200604C
	ldrb r0, [r5, #1]
	cmp r0, #0
	bne _021F15EA
	cmp r4, #0
	beq _021F15E4
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021F1B94
_021F15E4:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F15EA:
	subs r0, r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	adds r0, r5, #0
	movs r2, #1
	bl ov101_021F1364
	ldrb r1, [r5, #7]
	movs r0, #0xf8
	bics r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r5, #7]
	subs r0, #0x11
	pop {r4, r5, r6, pc}
_021F1608:
	movs r0, #0x80
	adds r3, r6, #0
	tst r3, r0
	beq _021F165C
	ldrb r1, [r5]
	subs r1, r1, #1
	cmp r4, r1
	blt _021F161C
	subs r0, #0x81
	pop {r4, r5, r6, pc}
_021F161C:
	ldr r0, _021F16A4 @ =0x0000093F
	bl FUN_0200604C
	ldrb r0, [r5, #1]
	cmp r0, #5
	bne _021F163E
	ldrb r0, [r5]
	subs r0, r0, #1
	cmp r4, r0
	bge _021F1638
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021F1B94
_021F1638:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F163E:
	adds r0, r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	adds r0, r5, #0
	movs r2, #1
	bl ov101_021F1364
	ldrb r1, [r5, #7]
	movs r0, #0xf8
	bics r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r5, #7]
	subs r0, #0x11
	pop {r4, r5, r6, pc}
_021F165C:
	movs r0, #0x20
	tst r0, r1
	beq _021F167A
	cmp r2, #0
	beq _021F1674
	ldr r0, _021F16A4 @ =0x0000093F
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021F1C98
_021F1674:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F167A:
	movs r0, #0x10
	tst r1, r0
	beq _021F169C
	ldrb r0, [r5]
	adds r1, r2, #6
	cmp r1, r0
	bge _021F1696
	ldr r0, _021F16A4 @ =0x0000093F
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021F1C98
_021F1696:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F169C:
	subs r0, #0x11
	pop {r4, r5, r6, pc}
	.align 2, 0
_021F16A0: .4byte 0x021D110C
_021F16A4: .4byte 0x0000093F
	thumb_func_end ov101_021F1564

	thumb_func_start ov101_021F16A8
ov101_021F16A8: @ 0x021F16A8
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r1, [r4, #7]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	beq _021F16C2
	bl ov101_021F1D44
	movs r0, #0
	add sp, #4
	mvns r0, r0
	pop {r3, r4, pc}
_021F16C2:
	ldr r0, _021F175C @ =0x021F8634
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021F16D6
	add sp, #4
	adds r0, r1, #0
	pop {r3, r4, pc}
_021F16D6:
	cmp r0, #6
	bge _021F1714
	ldrb r1, [r4, #5]
	cmp r0, r1
	bge _021F1714
	strb r0, [r4, #1]
	ldrb r1, [r4, #3]
	movs r3, #1
	adds r0, r1, r0
	strb r0, [r4, #2]
	str r3, [sp]
	ldrb r1, [r4, #1]
	ldrb r2, [r4, #2]
	adds r0, r4, #0
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov101_021F1A40
	ldrb r1, [r4, #1]
	adds r0, r4, #0
	movs r2, #1
	bl ov101_021F1290
	ldr r0, _021F1760 @ =0x00000941
	bl FUN_0200604C
	ldrb r0, [r4, #2]
	add sp, #4
	adds r0, r0, #1
	pop {r3, r4, pc}
_021F1714:
	cmp r0, #6
	bne _021F1732
	ldrb r1, [r4, #3]
	cmp r1, #0
	beq _021F1732
	adds r0, r4, #0
	movs r1, #1
	bl ov101_021F1C98
	ldr r0, _021F1764 @ =0x0000093F
	bl FUN_0200604C
	add sp, #4
	movs r0, #0
	pop {r3, r4, pc}
_021F1732:
	cmp r0, #7
	bne _021F1754
	ldrb r0, [r4, #3]
	adds r1, r0, #6
	ldrb r0, [r4]
	cmp r1, r0
	bge _021F1754
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021F1C98
	ldr r0, _021F1764 @ =0x0000093F
	bl FUN_0200604C
	add sp, #4
	movs r0, #0
	pop {r3, r4, pc}
_021F1754:
	movs r0, #0
	mvns r0, r0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021F175C: .4byte 0x021F8634
_021F1760: .4byte 0x00000941
_021F1764: .4byte 0x0000093F
	thumb_func_end ov101_021F16A8

	thumb_func_start ov101_021F1768
ov101_021F1768: @ 0x021F1768
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldrb r1, [r5, #7]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	beq _021F1780
	bl ov101_021F1D44
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F1780:
	ldr r0, _021F17F8 @ =0x021F8658
	bl FUN_02025224
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _021F17F4
	cmp r4, #6
	bge _021F17AC
	ldrb r0, [r5, #5]
	cmp r4, r0
	bge _021F17AC
	ldr r0, _021F17FC @ =0x00000941
	strb r4, [r5, #1]
	bl FUN_0200604C
	movs r0, #1
	str r0, [r6]
	ldrb r0, [r5, #3]
	adds r0, r0, r4
	pop {r4, r5, r6, pc}
_021F17AC:
	cmp r4, #6
	bne _021F17CC
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _021F17CC
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021F1C98
	ldr r0, _021F1800 @ =0x0000093F
	bl FUN_0200604C
	movs r0, #1
	str r0, [r6]
	subs r0, r0, #2
	pop {r4, r5, r6, pc}
_021F17CC:
	cmp r4, #7
	bne _021F17F0
	ldrb r0, [r5, #3]
	adds r1, r0, #6
	ldrb r0, [r5]
	cmp r1, r0
	bge _021F17F0
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021F1C98
	ldr r0, _021F1800 @ =0x0000093F
	bl FUN_0200604C
	movs r0, #1
	str r0, [r6]
	subs r0, r0, #2
	pop {r4, r5, r6, pc}
_021F17F0:
	movs r0, #0
	mvns r0, r0
_021F17F4:
	pop {r4, r5, r6, pc}
	nop
_021F17F8: .4byte 0x021F8658
_021F17FC: .4byte 0x00000941
_021F1800: .4byte 0x0000093F
	thumb_func_end ov101_021F1768

	thumb_func_start ov101_021F1804
ov101_021F1804: @ 0x021F1804
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end ov101_021F1804

	thumb_func_start ov101_021F1808
ov101_021F1808: @ 0x021F1808
	push {r3, lr}
	ldrb r2, [r0, #2]
	movs r1, #0xff
	strb r1, [r0, #2]
	ldrb r3, [r0, #3]
	cmp r2, r3
	blo _021F182E
	ldrb r1, [r0, #4]
	cmp r1, r2
	blo _021F182E
	movs r1, #1
	str r1, [sp]
	subs r1, r2, r3
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r3, #0
	bl ov101_021F1A40
_021F182E:
	pop {r3, pc}
	thumb_func_end ov101_021F1808

	thumb_func_start ov101_021F1830
ov101_021F1830: @ 0x021F1830
	movs r2, #0
	strb r2, [r0]
	movs r1, #0xff
	strb r1, [r0, #1]
	str r2, [r0, #8]
	str r2, [r0, #4]
	bx lr
	.align 2, 0
	thumb_func_end ov101_021F1830

	thumb_func_start ov101_021F1840
ov101_021F1840: @ 0x021F1840
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r0, #0xdc
	str r6, [r0]
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0xd8
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xcd
	ldrb r0, [r0]
	cmp r0, #0
	ble _021F18C4
	adds r7, r6, #0
_021F1862:
	adds r0, r5, #0
	adds r0, #0xd4
	ldr r0, [r0]
	adds r4, r0, r7
	str r0, [sp]
	adds r0, r4, #0
	bl ov101_021F1830
	ldr r0, [sp]
	strb r6, [r0, r7]
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r0, [r0]
	ldrb r0, [r0, r6]
	strb r0, [r4, #1]
	adds r0, r5, #0
	adds r0, #0xd8
	ldr r0, [r0]
	cmp r0, #0
	bne _021F1890
	adds r0, r5, #0
	adds r0, #0xd8
	str r4, [r0]
_021F1890:
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	cmp r0, #0
	bne _021F18A0
	adds r0, r5, #0
	adds r0, #0xdc
	str r4, [r0]
_021F18A0:
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	adds r6, r6, #1
	str r0, [r4, #4]
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	adds r7, #0xc
	str r4, [r0, #8]
	adds r0, r5, #0
	adds r0, #0xdc
	str r4, [r0]
	adds r0, r5, #0
	adds r0, #0xcd
	ldrb r0, [r0]
	cmp r6, r0
	blt _021F1862
_021F18C4:
	adds r0, r5, #0
	adds r0, #0xd8
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	str r1, [r0, #8]
	adds r0, r5, #0
	adds r0, #0xdc
	adds r5, #0xd8
	ldr r1, [r0]
	ldr r0, [r5]
	str r1, [r0, #4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F1840

	thumb_func_start ov101_021F18E0
ov101_021F18E0: @ 0x021F18E0
	movs r1, #0
	strb r1, [r0]
	str r1, [r0, #4]
	bx lr
	thumb_func_end ov101_021F18E0

	thumb_func_start ov101_021F18E8
ov101_021F18E8: @ 0x021F18E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, r1, #0
	movs r1, #0xe5
	movs r4, #0x1c
	muls r4, r2, r4
	lsls r1, r1, #2
	adds r7, r3, #0
	adds r3, r5, r1
	adds r4, r3, r4
	movs r2, #0x18
	adds r3, r0, #0
	muls r3, r2, r3
	lsls r0, r3, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0xd8
	str r0, [sp]
	str r2, [sp, #4]
	subs r0, r1, #4
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	movs r2, #0
	adds r3, r6, #0
	bl FUN_0201DA74
	movs r0, #0x52
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0x39
	lsls r0, r0, #4
	ldrb r1, [r4, #1]
	ldr r0, [r5, r0]
	movs r2, #8
	adds r3, r6, #0
	bl FUN_0201DA74
	movs r0, #0x7e
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0x39
	lsls r0, r0, #4
	ldrb r1, [r4, #6]
	ldr r0, [r5, r0]
	movs r2, #0x5a
	adds r3, r6, #0
	bl FUN_0201DA74
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x39
	lsls r0, r0, #4
	adds r3, r6, #1
	lsls r3, r3, #0x10
	ldrb r1, [r4, #0xb]
	ldr r0, [r5, r0]
	movs r2, #1
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	movs r0, #2
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0x39
	lsls r0, r0, #4
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	movs r2, #8
	adds r3, r6, #0
	bl FUN_0201DA74
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x39
	adds r3, r6, #0
	lsls r0, r0, #4
	adds r3, #9
	lsls r3, r3, #0x10
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	movs r2, #9
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x39
	adds r3, r6, #0
	lsls r0, r0, #4
	adds r3, #0xd
	lsls r3, r3, #0x10
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	movs r2, #9
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x39
	lsls r0, r0, #4
	adds r6, #0x11
	lsls r3, r6, #0x10
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	movs r2, #9
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	cmp r7, #0
	beq _021F19DE
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0201D578
_021F19DE:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov101_021F18E8

	thumb_func_start ov101_021F19E4
ov101_021F19E4: @ 0x021F19E4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrb r0, [r6, #6]
	movs r4, #0
	movs r7, #1
	lsls r0, r0, #0x1f
	lsrs r5, r0, #0x1f
_021F19F2:
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	adds r2, r5, #0
	movs r3, #0
	bl ov101_021F18E8
	adds r0, r5, #0
	eors r0, r7
	lsls r0, r0, #0x18
	adds r4, r4, #1
	lsrs r5, r0, #0x18
	cmp r4, #8
	blt _021F19F2
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F19E4

	thumb_func_start ov101_021F1A10
ov101_021F1A10: @ 0x021F1A10
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021F1A2E
	lsrs r2, r1, #0x1f
	lsls r1, r1, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r1, r2, r1
	movs r0, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
_021F1A2E:
	lsrs r2, r1, #0x1f
	lsls r1, r1, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	thumb_func_end ov101_021F1A10

	thumb_func_start ov101_021F1A40
ov101_021F1A40: @ 0x021F1A40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	adds r7, r2, #0
	movs r2, #0xc
	adds r5, r0, #0
	str r3, [sp, #0x14]
	adds r3, r5, #0
	adds r3, #0xc
	muls r2, r7, r2
	adds r4, r3, r2
	bl ov101_021F1A10
	adds r2, r0, #0
	movs r0, #0xe5
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x1c
	muls r0, r2, r0
	adds r6, r1, r0
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	movs r3, #0
	bl ov101_021F18E8
	ldr r0, [sp, #0x10]
	movs r1, #0x18
	muls r1, r0, r1
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _021F1A88
	ldrb r0, [r5, #2]
	cmp r7, r0
	bne _021F1ADE
_021F1A88:
	movs r0, #0xff
	adds r7, r1, #2
	lsls r0, r0, #2
	ldrb r1, [r4, #8]
	ldr r0, [r5, r0]
	bl ov101_021F1EE8
	adds r2, r0, #0
	str r7, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6, #0x14]
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r3, #0x10
	bl FUN_020200FC
	movs r0, #0xff
	lsls r0, r0, #2
	ldrb r1, [r4, #8]
	ldr r0, [r5, r0]
	bl ov101_021F1F18
	adds r2, r0, #0
	str r7, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6, #0x18]
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0x39
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r3, #0x5e
	bl FUN_020200FC
	b _021F1B32
_021F1ADE:
	movs r0, #0xff
	adds r7, r1, #2
	lsls r0, r0, #2
	ldrb r1, [r4, #8]
	ldr r0, [r5, r0]
	bl ov101_021F1EE8
	adds r2, r0, #0
	str r7, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6, #0xc]
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r3, #0x10
	bl FUN_020200FC
	movs r0, #0xff
	lsls r0, r0, #2
	ldrb r1, [r4, #8]
	ldr r0, [r5, r0]
	bl ov101_021F1F18
	adds r2, r0, #0
	str r7, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6, #0x10]
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0x39
	str r1, [sp, #0xc]
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r3, #0x5e
	bl FUN_020200FC
_021F1B32:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _021F1B42
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0201D578
_021F1B42:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov101_021F1A40

	thumb_func_start ov101_021F1B48
ov101_021F1B48: @ 0x021F1B48
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _021F1B60
	movs r0, #0xf3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	b _021F1B6C
_021F1B60:
	movs r0, #0xf3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
_021F1B6C:
	ldrb r0, [r4, #3]
	adds r1, r0, #6
	ldrb r0, [r4]
	cmp r1, r0
	bge _021F1B84
	movs r0, #0x3d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	pop {r4, pc}
_021F1B84:
	movs r0, #0x3d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F1B48

	thumb_func_start ov101_021F1B94
ov101_021F1B94: @ 0x021F1B94
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	beq _021F1BC0
	ldrb r1, [r4, #3]
	cmp r1, #1
	bhs _021F1BA6
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F1BA6:
	subs r1, r1, #1
	strb r1, [r4, #3]
	movs r1, #1
	str r1, [sp]
	movs r1, #0
	ldrb r2, [r4, #3]
	adds r3, r1, #0
	bl ov101_021F1A40
	ldrb r0, [r4, #4]
	subs r0, r0, #1
	strb r0, [r4, #4]
	b _021F1BE6
_021F1BC0:
	ldrb r1, [r4]
	ldrb r2, [r4, #4]
	subs r1, r1, #1
	cmp r2, r1
	blt _021F1BCE
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F1BCE:
	adds r1, r2, #1
	strb r1, [r4, #4]
	movs r1, #1
	str r1, [sp]
	ldrb r2, [r4, #4]
	movs r1, #7
	movs r3, #0
	bl ov101_021F1A40
	ldrb r0, [r4, #3]
	adds r0, r0, #1
	strb r0, [r4, #3]
_021F1BE6:
	ldrb r1, [r4, #7]
	movs r0, #0xf8
	movs r2, #1
	bics r1, r0
	strb r1, [r4, #7]
	ldrb r1, [r4, #7]
	movs r0, #2
	bics r1, r0
	lsls r0, r5, #0x1f
	lsrs r0, r0, #0x1e
	orrs r0, r1
	strb r0, [r4, #7]
	ldrb r0, [r4, #7]
	movs r1, #1
	bics r0, r2
	orrs r0, r1
	strb r0, [r4, #7]
	ldr r0, _021F1C30 @ =0x00000404
	ldr r0, [r4, r0]
	strb r1, [r0]
	ldrb r3, [r4, #6]
	adds r0, r3, #0
	bics r0, r2
	lsls r2, r3, #0x1f
	lsrs r2, r2, #0x1f
	eors r2, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ands r1, r2
	orrs r0, r1
	strb r0, [r4, #6]
	adds r0, r4, #0
	bl ov101_021F1B48
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021F1C30: .4byte 0x00000404
	thumb_func_end ov101_021F1B94

	thumb_func_start ov101_021F1C34
ov101_021F1C34: @ 0x021F1C34
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #7]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _021F1C52
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	movs r2, #8
	movs r3, #0
	bl FUN_0201EC48
	b _021F1C62
_021F1C52:
	movs r0, #0x39
	lsls r0, r0, #4
	movs r1, #0
	ldr r0, [r4, r0]
	movs r2, #8
	adds r3, r1, #0
	bl FUN_0201EC48
_021F1C62:
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201D578
	ldrb r0, [r4, #7]
	movs r2, #0xf8
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x1b
	adds r3, r1, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r3, r3, #0x1b
	bics r0, r2
	lsrs r3, r3, #0x18
	orrs r0, r3
	strb r0, [r4, #7]
	cmp r1, #2
	blo _021F1C92
	ldrb r0, [r4, #7]
	bics r0, r2
	strb r0, [r4, #7]
	movs r0, #1
	pop {r4, pc}
_021F1C92:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F1C34

	thumb_func_start ov101_021F1C98
ov101_021F1C98: @ 0x021F1C98
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldrb r3, [r4, #8]
	movs r2, #0x70
	bics r3, r2
	strb r3, [r4, #8]
	ldrb r3, [r4, #7]
	movs r2, #4
	orrs r2, r3
	strb r2, [r4, #7]
	ldrb r3, [r4, #7]
	movs r2, #2
	bics r3, r2
	lsls r2, r1, #0x1f
	lsrs r2, r2, #0x1e
	orrs r2, r3
	strb r2, [r4, #7]
	ldrb r5, [r4, #7]
	movs r2, #1
	movs r3, #1
	bics r5, r2
	adds r2, r5, #0
	orrs r2, r3
	strb r2, [r4, #7]
	ldr r2, _021F1CE4 @ =0x00000404
	ldr r2, [r4, r2]
	strb r3, [r2]
	bl ov101_021F1B94
	cmp r0, #0
	bne _021F1CDE
	ldrb r1, [r4, #8]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r4, #8]
_021F1CDE:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F1CE4: .4byte 0x00000404
	thumb_func_end ov101_021F1C98

	thumb_func_start ov101_021F1CE8
ov101_021F1CE8: @ 0x021F1CE8
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F1C34
	cmp r0, #0
	bne _021F1CF8
	movs r0, #0
	pop {r4, pc}
_021F1CF8:
	ldrb r1, [r4, #8]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x1f
	bne _021F1D2A
	lsls r0, r1, #0x19
	movs r2, #0x70
	lsrs r0, r0, #0x1d
	bics r1, r2
	adds r2, r0, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x1d
	lsrs r2, r2, #0x19
	orrs r1, r2
	strb r1, [r4, #8]
	cmp r0, #5
	bhs _021F1D2A
	ldrb r1, [r4, #7]
	adds r0, r4, #0
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	bl ov101_021F1B94
	cmp r0, #0
	bne _021F1D3E
_021F1D2A:
	ldrb r1, [r4, #8]
	movs r0, #0x70
	bics r1, r0
	strb r1, [r4, #8]
	ldrb r1, [r4, #7]
	movs r0, #4
	bics r1, r0
	strb r1, [r4, #7]
	movs r0, #1
	pop {r4, pc}
_021F1D3E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F1CE8

	thumb_func_start ov101_021F1D44
ov101_021F1D44: @ 0x021F1D44
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #7]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	beq _021F1D56
	bl ov101_021F1CE8
	b _021F1D5A
_021F1D56:
	bl ov101_021F1C34
_021F1D5A:
	cmp r0, #0
	beq _021F1D6E
	ldr r0, _021F1D70 @ =0x00000404
	movs r1, #0
	ldr r0, [r4, r0]
	strb r1, [r0]
	ldrb r1, [r4, #7]
	movs r0, #1
	bics r1, r0
	strb r1, [r4, #7]
_021F1D6E:
	pop {r4, pc}
	.align 2, 0
_021F1D70: .4byte 0x00000404
	thumb_func_end ov101_021F1D44

	thumb_func_start ov101_021F1D74
ov101_021F1D74: @ 0x021F1D74
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0xdc
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0xdc
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [r5]
	str r0, [r4]
	ldr r0, [r5]
	bl FUN_02095EF8
	adds r1, r4, #0
	adds r1, #0x80
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	adds r0, #0x84
	str r1, [r0]
	ldr r0, [r5, #0xc]
	str r0, [r4, #4]
	ldr r0, [r5, #4]
	str r0, [r4, #0x3c]
	ldr r0, [r5, #8]
	str r0, [r4, #0x40]
	ldr r0, [r5, #0x10]
	str r0, [r4, #8]
	ldr r0, [r5, #0x14]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x18]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x1c]
	str r0, [r4, #0x18]
	ldr r0, [r5, #0x20]
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x24]
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x28]
	str r0, [r4, #0x24]
	ldr r0, [r5, #0x2c]
	str r0, [r4, #0x28]
	ldr r0, [r5, #0x30]
	str r0, [r4, #0x2c]
	ldrh r0, [r5, #0x34]
	strh r0, [r4, #0x30]
	ldrh r0, [r5, #0x36]
	adds r5, #0x38
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	ldrb r1, [r5]
	adds r0, #0x34
	strb r1, [r0]
	ldr r0, [r4, #0x24]
	bl FUN_02028F94
	adds r1, r4, #0
	adds r1, #0x36
	strb r0, [r1]
	movs r1, #0x1b
	adds r2, r1, #0
	ldr r3, [r4]
	movs r0, #0
	adds r2, #0xf4
	bl FUN_0200BAF8
	str r0, [r4, #0x44]
	movs r2, #0xa
	ldr r3, [r4]
	movs r0, #0
	movs r1, #0x1b
	lsls r2, r2, #6
	bl FUN_0200BAF8
	str r0, [r4, #0x48]
	ldr r2, [r4]
	movs r0, #0x10
	movs r1, #0x25
	bl FUN_0200BD18
	str r0, [r4, #0x50]
	ldr r0, _021F1E7C @ =0x00000439
	ldr r1, [r4]
	bl FUN_02026354
	str r0, [r4, #0x54]
	ldr r0, _021F1E7C @ =0x00000439
	ldr r1, [r4]
	bl FUN_02026354
	str r0, [r4, #0x64]
	ldr r1, [r4]
	movs r0, #0x10
	bl FUN_02026354
	str r0, [r4, #0x58]
	ldr r1, [r4]
	movs r0, #0x2c
	bl FUN_02026354
	str r0, [r4, #0x5c]
	ldr r0, [r4, #0x44]
	movs r1, #0x1d
	bl FUN_0200BBA0
	str r0, [r4, #0x60]
	movs r6, #0
	adds r5, r4, #0
_021F1E58:
	adds r1, r6, #0
	ldr r0, [r4, #0x44]
	adds r1, #0x1e
	bl FUN_0200BBA0
	str r0, [r5, #0x68]
	adds r1, r6, #0
	ldr r0, [r4, #0x44]
	adds r1, #0x21
	bl FUN_0200BBA0
	str r0, [r5, #0x74]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #3
	blt _021F1E58
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021F1E7C: .4byte 0x00000439
	thumb_func_end ov101_021F1D74

	thumb_func_start ov101_021F1E80
ov101_021F1E80: @ 0x021F1E80
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_021F1E88:
	ldr r0, [r5, #0x68]
	bl FUN_02026380
	ldr r0, [r5, #0x74]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _021F1E88
	ldr r0, [r6, #0x60]
	bl FUN_02026380
	ldr r0, [r6, #0x5c]
	bl FUN_02026380
	ldr r0, [r6, #0x58]
	bl FUN_02026380
	ldr r0, [r6, #0x64]
	bl FUN_02026380
	ldr r0, [r6, #0x54]
	bl FUN_02026380
	ldr r0, [r6, #0x50]
	bl FUN_0200BDA0
	ldr r0, [r6, #0x48]
	bl FUN_0200BB44
	ldr r0, [r6, #0x44]
	bl FUN_0200BB44
	adds r0, r6, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02095F68
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xdc
	blx FUN_020D4994
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F1E80

	thumb_func_start ov101_021F1EE8
ov101_021F1EE8: @ 0x021F1EE8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	cmp r1, #0x4b
	blo _021F1EF2
	movs r1, #0
_021F1EF2:
	adds r0, r1, #0
	bl FUN_02095FEC
	adds r2, r0, #0
	ldr r3, [r5]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	ldr r2, [r5, #0x58]
	adds r4, r0, #0
	movs r1, #0
	bl FUN_0200BB6C
	adds r0, r4, #0
	bl FUN_0200BB44
	ldr r0, [r5, #0x58]
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F1EE8

	thumb_func_start ov101_021F1F18
ov101_021F1F18: @ 0x021F1F18
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0x4b
	blo _021F1F22
	movs r1, #0
_021F1F22:
	adds r0, r4, #0
	adds r0, #0x84
	ldr r2, [r0]
	movs r0, #0x14
	muls r0, r1, r0
	adds r0, r2, r0
	ldrb r2, [r0, #3]
	cmp r2, #0xc8
	bne _021F1F3C
	ldr r0, [r4, #0x5c]
	bl FUN_020263AC
	b _021F1F60
_021F1F3C:
	cmp r2, #0xc9
	blo _021F1F4E
	subs r2, #0xa3
	adds r1, r2, #0
	ldr r0, [r4, #0x44]
	ldr r2, [r4, #0x5c]
	bl FUN_0200BB6C
	b _021F1F60
_021F1F4E:
	ldr r0, [r4, #0x50]
	movs r1, #0
	bl FUN_0200C2D4
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x5c]
	ldr r2, [r4, #0x60]
	bl FUN_0200CBBC
_021F1F60:
	ldr r0, [r4, #0x5c]
	pop {r4, pc}
	thumb_func_end ov101_021F1F18

	thumb_func_start ov101_021F1F64
ov101_021F1F64: @ 0x021F1F64
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	adds r6, r1, #0
	adds r7, r2, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x54
	str r3, [sp]
	blx FUN_020D4994
	cmp r6, #0x4b
	blo _021F1F8C
	bl FUN_0202551C
	movs r0, #0xff
	str r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1F8C:
	cmp r7, #0
	ldrh r0, [r5, #0x30]
	beq _021F1FA2
	bl FUN_0203B4A8
	cmp r0, #0
	bne _021F1FB2
	movs r0, #0xff
	str r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1FA2:
	bl FUN_0203B48C
	cmp r0, #0
	bne _021F1FB2
	movs r0, #0xff
	str r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1FB2:
	strb r6, [r4, #0x18]
	adds r5, #0x84
	movs r0, #0x14
	ldr r1, [r5]
	muls r0, r6, r0
	adds r0, r1, r0
	str r0, [r4, #0x10]
	strb r7, [r4, #0x19]
	ldr r0, [sp]
	adds r1, r4, #0
	strb r0, [r4, #0x1a]
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	adds r1, #0x38
	strh r0, [r4, #0x1c]
	ldrb r0, [r4, #0x19]
	str r0, [r4]
	adds r0, r4, #0
	adds r0, #0x28
	bl FUN_02014708
	ldr r0, [r4, #0x38]
	bl FUN_0201485C
	adds r1, r4, #0
	adds r1, #0x23
	strb r0, [r1]
	movs r0, #0
	strh r0, [r4, #0x20]
	strh r0, [r4, #0x1e]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov101_021F1F64

	thumb_func_start ov101_021F1FF4
ov101_021F1FF4: @ 0x021F1FF4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r4, r5, #0
	movs r1, #0
	adds r4, #0x88
	bl FUN_0201D978
	ldr r0, [r5, #0xc]
	bl FUN_0201D5C8
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #1]
	cmp r0, #0xf
	bhi _021F20F2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F201E: @ jump table
	.2byte _021F203E - _021F201E - 2 @ case 0
	.2byte _021F204A - _021F201E - 2 @ case 1
	.2byte _021F2056 - _021F201E - 2 @ case 2
	.2byte _021F2062 - _021F201E - 2 @ case 3
	.2byte _021F20B6 - _021F201E - 2 @ case 4
	.2byte _021F206E - _021F201E - 2 @ case 5
	.2byte _021F20CE - _021F201E - 2 @ case 6
	.2byte _021F207A - _021F201E - 2 @ case 7
	.2byte _021F2092 - _021F201E - 2 @ case 8
	.2byte _021F2086 - _021F201E - 2 @ case 9
	.2byte _021F209E - _021F201E - 2 @ case 10
	.2byte _021F20AA - _021F201E - 2 @ case 11
	.2byte _021F20C2 - _021F201E - 2 @ case 12
	.2byte _021F20DA - _021F201E - 2 @ case 13
	.2byte _021F20E6 - _021F201E - 2 @ case 14
	.2byte _021F20F2 - _021F201E - 2 @ case 15
_021F203E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F2B80
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F204A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F27E4
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F2056:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F2A28
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F2062:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F30AC
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F206E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F3518
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F207A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F35C4
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F2086:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F388C
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F2092:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F36F4
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F209E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F3AA4
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20AA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F3C8C
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20B6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F342C
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20C2:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F3EA8
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20CE:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F3530
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20DA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F410C
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20E6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F4274
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20F2:
	movs r0, #0
	strh r0, [r4, #0x20]
	strh r0, [r4, #0x1e]
_021F20F8:
	ldrh r0, [r4, #0x20]
	cmp r0, #2
	bhi _021F210A
	ldrh r1, [r4, #0x1e]
	movs r0, #6
	ldr r2, _021F210C @ =0x021F8B7C
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [r4, #0x14]
_021F210A:
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F210C: .4byte 0x021F8B7C
	thumb_func_end ov101_021F1FF4

	thumb_func_start ov101_021F2110
ov101_021F2110: @ 0x021F2110
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	bl FUN_02095FEC
	adds r2, r0, #0
	ldr r3, [r4]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	ldr r2, [r4, #0x24]
	movs r1, #0
	bl FUN_0200BE48
	adds r1, r4, #0
	adds r1, #0xa0
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov101_021F1EE8
	movs r1, #1
	str r1, [sp]
	movs r3, #2
	str r3, [sp, #4]
	adds r2, r0, #0
	ldr r0, [r4, #0x50]
	bl FUN_0200BE3C
	ldrh r0, [r4, #0x30]
	bl FUN_0203B36C
	adds r2, r0, #0
	ldr r0, [r4, #0x50]
	movs r1, #2
	bl FUN_0200C278
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	bl FUN_0203B36C
	adds r2, r0, #0
	ldr r0, [r4, #0x50]
	movs r1, #3
	bl FUN_0200C278
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov101_021F2110

	thumb_func_start ov101_021F217C
ov101_021F217C: @ 0x021F217C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021F219C @ =0x021F8400
	bl FUN_02025320
	cmp r0, #0
	beq _021F2198
	ldr r0, [r4, #0x40]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, [r4, #0x40]
	bl FUN_02024964
_021F2198:
	pop {r4, pc}
	nop
_021F219C: .4byte 0x021F8400
	thumb_func_end ov101_021F217C

	thumb_func_start ov101_021F21A0
ov101_021F21A0: @ 0x021F21A0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r4, #0
	adds r1, #0x36
	ldrb r1, [r1]
	ldrb r1, [r2, r1]
	ldr r2, [r4, #0x64]
	bl FUN_0200BB6C
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x54]
	ldr r2, [r4, #0x64]
	bl FUN_0200CBBC
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	adds r0, r4, #0
	str r1, [sp]
	adds r0, #0x34
	ldrb r0, [r0]
	adds r3, r1, #0
	str r0, [sp, #4]
	ldr r0, _021F21EC @ =0x00010200
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0xc]
	ldr r2, [r4, #0x54]
	bl FUN_020200FC
	adds r4, #0x35
	strb r0, [r4]
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021F21EC: .4byte 0x00010200
	thumb_func_end ov101_021F21A0

	thumb_func_start ov101_021F21F0
ov101_021F21F0: @ 0x021F21F0
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x37
	strb r2, [r4]
	adds r2, r0, #0
	adds r2, #0x38
	strb r3, [r2]
	adds r2, r0, #0
	adds r2, #0x37
	bl ov101_021F21A0
	pop {r4, pc}
	thumb_func_end ov101_021F21F0

	thumb_func_start ov101_021F2208
ov101_021F2208: @ 0x021F2208
	adds r3, r0, #0
	adds r3, #0x37
	strb r2, [r3]
	adds r3, r0, #0
	adds r3, #0x38
	strb r2, [r3]
	adds r2, r0, #0
	ldr r3, _021F221C @ =ov101_021F21A0
	adds r2, #0x37
	bx r3
	.align 2, 0
_021F221C: .4byte ov101_021F21A0
	thumb_func_end ov101_021F2208

	thumb_func_start ov101_021F2220
ov101_021F2220: @ 0x021F2220
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F217C
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	bl FUN_02020094
	cmp r0, #0
	beq _021F223A
	movs r0, #0
	pop {r4, pc}
_021F223A:
	bl FUN_02002C04
	adds r4, #0xaa
	strb r0, [r4]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F2220

	thumb_func_start ov101_021F2248
ov101_021F2248: @ 0x021F2248
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r4, r0, #0
	ldrh r0, [r5, #2]
	adds r6, r4, #0
	adds r6, #0x88
	lsls r1, r0, #0x1c
	lsrs r1, r1, #0x1c
	cmp r1, #5
	bhi _021F2304
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F226A: @ jump table
	.2byte _021F2304 - _021F226A - 2 @ case 0
	.2byte _021F22BC - _021F226A - 2 @ case 1
	.2byte _021F22BC - _021F226A - 2 @ case 2
	.2byte _021F2276 - _021F226A - 2 @ case 3
	.2byte _021F2284 - _021F226A - 2 @ case 4
	.2byte _021F22D8 - _021F226A - 2 @ case 5
_021F2276:
	ldrb r1, [r6, #0x18]
	ldr r0, [r4, #0x20]
	movs r2, #1
	bl FUN_0202F0C4
	add sp, #8
	pop {r4, r5, r6, pc}
_021F2284:
	ldrh r2, [r5, #4]
	cmp r2, #0x95
	bne _021F229C
	bl FUN_0201FDB8
	movs r1, #0xa
	blx FUN_020F2BA4
	adds r1, #0x95
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	b _021F22B0
_021F229C:
	cmp r2, #4
	bne _021F22B0
	bl FUN_0201FDB8
	movs r1, #3
	blx FUN_020F2BA4
	adds r0, r1, #2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_021F22B0:
	ldrb r1, [r6, #0x18]
	ldr r0, [r4, #0x20]
	bl FUN_0202F100
	add sp, #8
	pop {r4, r5, r6, pc}
_021F22BC:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	ldr r0, [r4, #0x28]
	beq _021F22CE
	ldrh r1, [r5, #4]
	bl FUN_02050408
	add sp, #8
	pop {r4, r5, r6, pc}
_021F22CE:
	ldrh r1, [r5, #4]
	bl FUN_02050430
	add sp, #8
	pop {r4, r5, r6, pc}
_021F22D8:
	bl FUN_0201FD44
	ldrh r1, [r5, #2]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x14
	blx FUN_020F2998
	ldrh r2, [r5, #4]
	ldr r0, [r4, #0x4c]
	adds r1, r2, r1
	ldr r2, [r4, #0x54]
	bl FUN_0200BB6C
	movs r0, #1
	str r0, [sp]
	movs r3, #2
	str r3, [sp, #4]
	ldr r0, [r4, #0x50]
	ldr r2, [r4, #0x54]
	movs r1, #4
	bl FUN_0200BE3C
_021F2304:
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F2248

	thumb_func_start ov101_021F2308
ov101_021F2308: @ 0x021F2308
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	movs r1, #2
	movs r2, #1
	bl ov101_021F0ACC
	ldr r0, [r5, #4]
	movs r1, #0
	adds r2, r4, #0
	bl ov101_021F09B0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x40]
	movs r1, #0
	bl FUN_02024830
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021F2384
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F2308

	thumb_func_start ov101_021F2338
ov101_021F2338: @ 0x021F2338
	ldr r3, _021F2340 @ =FUN_020186A4
	ldr r0, [r0, #0x14]
	bx r3
	nop
_021F2340: .4byte FUN_020186A4
	thumb_func_end ov101_021F2338

	thumb_func_start ov101_021F2344
ov101_021F2344: @ 0x021F2344
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	bl FUN_02018674
	ldr r1, [r4, #0x3c]
	str r0, [r1]
	ldr r0, [r4, #0x14]
	bl FUN_02018680
	movs r1, #0
	ldr r0, [r4, #4]
	adds r2, r1, #0
	bl ov101_021F0ACC
	ldr r0, [r4, #0x40]
	movs r1, #1
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #0
	bl ov101_021F2384
	pop {r4, pc}
	thumb_func_end ov101_021F2344

	thumb_func_start ov101_021F2374
ov101_021F2374: @ 0x021F2374
	movs r1, #6
	ldr r2, _021F2380 @ =0x021F8B7C
	muls r1, r0, r1
	adds r0, r2, r1
	bx lr
	nop
_021F2380: .4byte 0x021F8B7C
	thumb_func_end ov101_021F2374

	thumb_func_start ov101_021F2384
ov101_021F2384: @ 0x021F2384
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	cmp r1, #0
	beq _021F23B0
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r2, #0x10
	ldr r0, [r4, #0x18]
	adds r3, r2, #0
	bl FUN_02003E5C
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0x18]
	movs r2, #0xa0
	movs r3, #0x10
	bl FUN_02003E5C
	b _021F23D4
_021F23B0:
	movs r0, #8
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0x10
	ldr r0, [r4, #0x18]
	adds r3, r2, #0
	bl FUN_02003E5C
	movs r0, #8
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r0, [r4, #0x18]
	movs r2, #0xa0
	movs r3, #0x10
	bl FUN_02003E5C
_021F23D4:
	ldr r0, [r4, #0x18]
	movs r1, #1
	bl FUN_02003B50
	ldr r0, [r4, #0x18]
	bl FUN_0200398C
	ldr r0, [r4, #0x18]
	movs r1, #0
	bl FUN_02003B50
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F2384

	thumb_func_start ov101_021F23F0
ov101_021F23F0: @ 0x021F23F0
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F217C
	ldr r0, _021F2430 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _021F2412
	ldr r0, _021F2434 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0
	adds r4, #0xaa
	strb r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021F2412:
	ldr r0, _021F2438 @ =0x021F8400
	bl FUN_02025320
	cmp r0, #0
	beq _021F242A
	ldr r0, _021F2434 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	adds r4, #0xaa
	strb r0, [r4]
	pop {r4, pc}
_021F242A:
	movs r0, #0
	pop {r4, pc}
	nop
_021F2430: .4byte 0x021D110C
_021F2434: .4byte 0x000005DC
_021F2438: .4byte 0x021F8400
	thumb_func_end ov101_021F23F0

	thumb_func_start ov101_021F243C
ov101_021F243C: @ 0x021F243C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bne _021F2450
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_0201D978
_021F2450:
	cmp r6, #0
	ldr r0, _021F2490 @ =0x00010200
	bne _021F2472
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	lsls r2, r4, #2
	str r1, [sp, #0xc]
	adds r2, r5, r2
	ldr r0, [r5, #0xc]
	ldr r2, [r2, #0x68]
	adds r3, r1, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021F2472:
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	lsls r2, r4, #2
	str r1, [sp, #0xc]
	adds r2, r5, r2
	ldr r0, [r5, #0xc]
	ldr r2, [r2, #0x74]
	adds r3, r1, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021F2490: .4byte 0x00010200
	thumb_func_end ov101_021F243C

	thumb_func_start ov101_021F2494
ov101_021F2494: @ 0x021F2494
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	bl ov101_021F217C
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021F24B0
	cmp r0, #1
	beq _021F24C6
	cmp r0, #2
	beq _021F24EA
	b _021F2500
_021F24B0:
	ldr r0, _021F250C @ =0x00000878
	bl FUN_0200604C
	ldr r2, [r4, #8]
	adds r0, r5, #0
	lsls r2, r2, #0x18
	movs r1, #0
	lsrs r2, r2, #0x18
	bl ov101_021F243C
	b _021F2500
_021F24C6:
	ldr r0, _021F250C @ =0x00000878
	bl FUN_02006184
	cmp r0, #0
	beq _021F24D4
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F24D4:
	ldr r0, _021F250C @ =0x00000878
	bl FUN_0200604C
	ldr r2, [r4, #8]
	adds r0, r5, #0
	lsls r2, r2, #0x18
	movs r1, #0
	lsrs r2, r2, #0x18
	bl ov101_021F243C
	b _021F2500
_021F24EA:
	ldr r0, _021F250C @ =0x00000878
	bl FUN_02006184
	cmp r0, #0
	beq _021F24F8
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F24F8:
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F2500:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F250C: .4byte 0x00000878
	thumb_func_end ov101_021F2494

	thumb_func_start ov101_021F2510
ov101_021F2510: @ 0x021F2510
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	bl ov101_021F217C
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _021F258A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F252E: @ jump table
	.2byte _021F2536 - _021F252E - 2 @ case 0
	.2byte _021F2550 - _021F252E - 2 @ case 1
	.2byte _021F2550 - _021F252E - 2 @ case 2
	.2byte _021F2572 - _021F252E - 2 @ case 3
_021F2536:
	ldr r0, _021F2594 @ =0x0000087A
	bl FUN_0200604C
	ldr r2, [r4, #8]
	adds r0, r5, #0
	lsls r2, r2, #0x18
	movs r1, #1
	lsrs r2, r2, #0x18
	bl ov101_021F243C
	movs r0, #0
	strh r0, [r4, #0x24]
	b _021F258A
_021F2550:
	ldrh r1, [r4, #0x24]
	adds r0, r1, #1
	strh r0, [r4, #0x24]
	cmp r1, #0xa
	bhs _021F255E
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F255E:
	movs r0, #0
	strh r0, [r4, #0x24]
	ldr r2, [r4, #8]
	adds r0, r5, #0
	lsls r2, r2, #0x18
	movs r1, #1
	lsrs r2, r2, #0x18
	bl ov101_021F243C
	b _021F258A
_021F2572:
	ldrh r1, [r4, #0x24]
	adds r0, r1, #1
	strh r0, [r4, #0x24]
	cmp r1, #0xa
	bhs _021F2580
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F2580:
	movs r0, #0
	strh r0, [r4, #0x24]
	str r0, [r4, #8]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F258A:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F2594: .4byte 0x0000087A
	thumb_func_end ov101_021F2510

	thumb_func_start ov101_021F2598
ov101_021F2598: @ 0x021F2598
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	bl ov101_021F217C
	ldr r2, [r4, #8]
	cmp r2, #3
	bhi _021F2608
	adds r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F25B6: @ jump table
	.2byte _021F25BE - _021F25B6 - 2 @ case 0
	.2byte _021F25D0 - _021F25B6 - 2 @ case 1
	.2byte _021F25D0 - _021F25B6 - 2 @ case 2
	.2byte _021F25F0 - _021F25B6 - 2 @ case 3
_021F25BE:
	lsls r2, r2, #0x18
	adds r0, r5, #0
	movs r1, #0
	lsrs r2, r2, #0x18
	bl ov101_021F243C
	movs r0, #0
	strh r0, [r4, #0x24]
	b _021F2608
_021F25D0:
	ldrh r1, [r4, #0x24]
	adds r0, r1, #1
	strh r0, [r4, #0x24]
	cmp r1, #0xa
	bhs _021F25DE
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F25DE:
	movs r1, #0
	strh r1, [r4, #0x24]
	ldr r2, [r4, #8]
	adds r0, r5, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl ov101_021F243C
	b _021F2608
_021F25F0:
	ldrh r1, [r4, #0x24]
	adds r0, r1, #1
	strh r0, [r4, #0x24]
	cmp r1, #0xa
	bhs _021F25FE
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F25FE:
	movs r0, #0
	strh r0, [r4, #0x24]
	str r0, [r4, #8]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F2608:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F2598

	thumb_func_start ov101_021F2614
ov101_021F2614: @ 0x021F2614
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	bl ov101_021F217C
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021F262C
	cmp r0, #1
	beq _021F265C
	b _021F2672
_021F262C:
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	ldrb r1, [r4, #0x19]
	lsls r2, r0, #1
	movs r0, #6
	muls r0, r1, r0
	adds r0, r2, r0
	ldr r1, [r4, #0x10]
	lsls r0, r0, #0x10
	ldrb r2, [r1, #0xc]
	lsrs r3, r0, #0x10
	movs r1, #0xc
	ldr r0, _021F267C @ =0x021F962C
	muls r1, r2, r1
	adds r6, r0, r1
	ldrb r2, [r6, r3]
	adds r3, r3, #1
	ldrb r3, [r6, r3]
	ldr r1, [r5, #0x48]
	adds r0, r5, #0
	bl ov101_021F21F0
	b _021F2672
_021F265C:
	adds r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F266A
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F266A:
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, r5, r6, pc}
_021F2672:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021F267C: .4byte 0x021F962C
	thumb_func_end ov101_021F2614

	thumb_func_start ov101_021F2680
ov101_021F2680: @ 0x021F2680
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	ldr r6, [r4, #0x14]
	cmp r1, #3
	bhi _021F26EC
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F269C: @ jump table
	.2byte _021F26A4 - _021F269C - 2 @ case 0
	.2byte _021F26C0 - _021F269C - 2 @ case 1
	.2byte _021F26CC - _021F269C - 2 @ case 2
	.2byte _021F26D6 - _021F269C - 2 @ case 3
_021F26A4:
	bl ov101_021F2110
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov101_021F2248
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0xc]
	cmp r0, #0xff
	bne _021F26EC
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021F26EC
_021F26C0:
	bl ov101_021F2614
	cmp r0, #0
	bne _021F26EC
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F26CC:
	ldr r1, [r5, #0x4c]
	adds r2, r6, #0
	bl ov101_021F21A0
	b _021F26EC
_021F26D6:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F26E2
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F26E2:
	ldr r0, [r5, #0x4c]
	bl FUN_0200BB44
	movs r0, #1
	pop {r4, r5, r6, pc}
_021F26EC:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021F2680

	thumb_func_start ov101_021F26F8
ov101_021F26F8: @ 0x021F26F8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x88
	movs r3, #1
	adds r4, r5, #0
	ldr r1, [r1]
	lsls r3, r3, #8
	adds r4, #0x88
	cmp r1, r3
	bgt _021F2732
	bge _021F279C
	cmp r1, #3
	bgt _021F272C
	cmp r1, #0
	blt _021F27D4
	adds r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_021F2724: @ jump table
	.2byte _021F2744 - _021F2724 - 2 @ case 0
	.2byte _021F2750 - _021F2724 - 2 @ case 1
	.2byte _021F276E - _021F2724 - 2 @ case 2
	.2byte _021F277A - _021F2724 - 2 @ case 3
_021F272C:
	cmp r1, #0xff
	beq _021F278E
	b _021F27D4
_021F2732:
	adds r2, r3, #1
	cmp r1, r2
	bgt _021F273C
	beq _021F27B4
	b _021F27D4
_021F273C:
	adds r2, r3, #2
	cmp r1, r2
	beq _021F27C0
	b _021F27D4
_021F2744:
	bl ov101_021F2494
	cmp r0, #0
	bne _021F27D4
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F2750:
	ldrh r1, [r4, #0x20]
	lsls r2, r1, #2
	ldr r1, _021F27E0 @ =0x021F867C
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #0
	bne _021F2762
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F2762:
	adds r0, r4, #0
	adds r0, #0x22
	ldrb r1, [r0]
	ldr r0, [r5, #0x3c]
	str r1, [r0]
	b _021F27D4
_021F276E:
	bl ov101_021F23F0
	cmp r0, #0
	bne _021F27D4
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F277A:
	bl ov101_021F2510
	cmp r0, #0
	bne _021F2786
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F2786:
	movs r0, #0
	str r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F278E:
	adds r0, r5, #0
	bl ov101_021F2598
	cmp r0, #0
	bne _021F27D4
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F279C:
	bl ov101_021F2510
	cmp r0, #0
	bne _021F27A8
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F27A8:
	ldr r1, [r5, #0x44]
	adds r0, r5, #0
	movs r2, #0x25
	bl ov101_021F2208
	b _021F27D4
_021F27B4:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F27D4
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F27C0:
	bl ov101_021F23F0
	cmp r0, #0
	bne _021F27CC
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F27CC:
	movs r0, #0
	str r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F27D4:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F27E0: .4byte 0x021F867C
	thumb_func_end ov101_021F26F8

	thumb_func_start ov101_021F27E4
ov101_021F27E4: @ 0x021F27E4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0
	strh r0, [r4, #0x20]
	ldrb r1, [r4, #0x1a]
	cmp r1, #2
	bne _021F2804
	ldr r0, [r5, #0x28]
	movs r1, #0xa7
	bl FUN_02050408
	movs r0, #4
	strh r0, [r4, #0x20]
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F2804:
	ldr r1, [r4, #0x10]
	ldrh r2, [r1, #6]
	ldrh r1, [r5, #0x30]
	cmp r2, r1
	bne _021F2812
	movs r0, #0x17
	pop {r3, r4, r5, pc}
_021F2812:
	ldrb r1, [r4, #0x19]
	cmp r1, #0
	beq _021F281E
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x1c]
	pop {r3, r4, r5, pc}
_021F281E:
	ldr r0, [r5, #0x28]
	movs r1, #0x79
	bl FUN_020503DC
	cmp r0, #0
	bne _021F282E
	movs r0, #0x19
	pop {r3, r4, r5, pc}
_021F282E:
	ldr r0, [r5, #0x28]
	movs r1, #0xa7
	bl FUN_020503DC
	cmp r0, #0
	bne _021F283E
	movs r0, #0x1a
	pop {r3, r4, r5, pc}
_021F283E:
	movs r0, #4
	strh r0, [r4, #0x20]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F27E4

	thumb_func_start ov101_021F2848
ov101_021F2848: @ 0x021F2848
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #4
	bls _021F285A
	b _021F29BE
_021F285A:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F2866: @ jump table
	.2byte _021F2870 - _021F2866 - 2 @ case 0
	.2byte _021F28FC - _021F2866 - 2 @ case 1
	.2byte _021F292A - _021F2866 - 2 @ case 2
	.2byte _021F2940 - _021F2866 - 2 @ case 3
	.2byte _021F2958 - _021F2866 - 2 @ case 4
_021F2870:
	bl ov101_021F2110
	movs r1, #0
	ldr r0, [r5, #0x20]
	adds r2, r1, #0
	bl FUN_0202F14C
	str r0, [r4, #0x44]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	ldr r2, [r4, #0x44]
	movs r1, #0xa
	movs r3, #6
	bl FUN_0200BFCC
	ldr r0, [r5, #0x28]
	bl FUN_02066794
	adds r1, r4, #0
	adds r1, #0x4d
	ldrb r1, [r1]
	movs r2, #1
	lsls r0, r0, #0x18
	bics r1, r2
	lsrs r2, r0, #0x18
	movs r0, #1
	ands r0, r2
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	ldr r0, [r5, #0x20]
	bl FUN_0202F240
	adds r1, r4, #0
	adds r1, #0x4d
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1f
	ldrb r1, [r1]
	movs r2, #2
	lsrs r0, r0, #0x1e
	bics r1, r2
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	cmp r0, #2
	bne _021F28E4
	movs r0, #2
	str r0, [r4, #4]
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F28E4:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F29E8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	lsrs r2, r2, #0x18
	bl ov101_021F2208
	b _021F29DA
_021F28FC:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F290A
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F290A:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _021F29DA
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #0x15
	bl ov101_021F2208
	movs r0, #0xff
	str r0, [r4, #4]
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F292A:
	adds r1, r4, #0
	bl ov101_021F29F8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	lsrs r2, r2, #0x18
	bl ov101_021F2208
	b _021F29DA
_021F2940:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F294E
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F294E:
	adds r0, r5, #0
	movs r1, #2
	bl ov101_021F2308
	b _021F29DA
_021F2958:
	bl ov101_021F2338
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	bne _021F296C
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F296C:
	adds r0, r5, #0
	bl ov101_021F2344
	cmp r6, #0
	bne _021F2992
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r1, [r0]
	movs r0, #2
	movs r2, #0x19
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	bl ov101_021F2208
	b _021F29AC
_021F2992:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r1, [r0]
	movs r0, #2
	movs r2, #0x1a
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	bl ov101_021F2208
_021F29AC:
	adds r1, r4, #0
	adds r1, #0x4d
	ldrb r1, [r1]
	ldr r0, [r5, #0x28]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	bl FUN_0206677C
	b _021F29DA
_021F29BE:
	adds r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F29CE
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F29CE:
	ldr r0, [r5, #0x4c]
	bl FUN_0200BB44
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_021F29DA:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021F2848

	thumb_func_start ov101_021F29E8
ov101_021F29E8: @ 0x021F29E8
	push {r3, lr}
	ldrh r0, [r0, #0x30]
	bl FUN_0203B3A8
	adds r0, r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, pc}
	thumb_func_end ov101_021F29E8

	thumb_func_start ov101_021F29F8
ov101_021F29F8: @ 0x021F29F8
	ldrb r0, [r1, #0x1a]
	cmp r0, #2
	bne _021F2A02
	movs r0, #0x16
	bx lr
_021F2A02:
	adds r0, r1, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	ldr r0, [r1, #0x44]
	beq _021F2A1C
	cmp r0, #0
	beq _021F2A18
	movs r0, #0x17
	bx lr
_021F2A18:
	movs r0, #0x1b
	bx lr
_021F2A1C:
	cmp r0, #0
	beq _021F2A24
	movs r0, #0x18
	bx lr
_021F2A24:
	movs r0, #0x1c
	bx lr
	thumb_func_end ov101_021F29F8

	thumb_func_start ov101_021F2A28
ov101_021F2A28: @ 0x021F2A28
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4, #0x1a]
	cmp r0, #2
	bne _021F2A48
	ldrh r0, [r4, #0x1c]
	lsls r1, r0, #1
	ldr r0, _021F2B70 @ =0x021F86BC
	ldrb r0, [r0, r1]
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x1c]
	lsls r1, r0, #1
	ldr r0, _021F2B74 @ =0x021F86BD
	ldrb r0, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_021F2A48:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F2A56
	movs r0, #0
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x1c]
	pop {r3, r4, r5, r6, r7, pc}
_021F2A56:
	movs r0, #0
	strh r0, [r4, #0x20]
	ldr r0, [r5, #0x24]
	bl FUN_02028FF0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F2A72
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F2A72:
	ldr r0, [r5, #0x28]
	movs r1, #0xee
	bl FUN_020503DC
	cmp r0, #0
	bne _021F2A82
	movs r0, #8
	pop {r3, r4, r5, r6, r7, pc}
_021F2A82:
	ldr r0, [r5, #0x28]
	movs r1, #0x79
	bl FUN_020503DC
	cmp r0, #0
	bne _021F2A92
	movs r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_021F2A92:
	ldr r0, [r5, #0x28]
	movs r1, #0x9f
	bl FUN_020503DC
	cmp r0, #0
	bne _021F2AA2
	movs r0, #0xa
	pop {r3, r4, r5, r6, r7, pc}
_021F2AA2:
	ldr r0, [r5, #0x28]
	movs r1, #0x70
	bl FUN_020503DC
	cmp r0, #0
	bne _021F2AB2
	movs r0, #0xb
	pop {r3, r4, r5, r6, r7, pc}
_021F2AB2:
	ldr r0, [r5, #0x28]
	ldr r1, _021F2B78 @ =0x00000983
	bl FUN_020503DC
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r5, #0x28]
	ldr r1, _021F2B7C @ =0x0000011A
	bl FUN_020503DC
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r7, #7
	bhs _021F2AF6
	cmp r6, #0
	bne _021F2AD6
	movs r0, #0xc
	pop {r3, r4, r5, r6, r7, pc}
_021F2AD6:
	cmp r4, #0
	beq _021F2AF2
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	adds r0, #0xe
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F2AF2:
	movs r0, #0xd
	pop {r3, r4, r5, r6, r7, pc}
_021F2AF6:
	ldr r0, [r5, #0x28]
	bl FUN_02066E58
	cmp r0, #0
	beq _021F2B04
	movs r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F2B04:
	cmp r7, #8
	bhs _021F2B0C
	movs r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
_021F2B0C:
	ldr r0, [r5, #0x28]
	bl FUN_02066614
	cmp r0, #0
	bne _021F2B1A
	movs r0, #0x12
	pop {r3, r4, r5, r6, r7, pc}
_021F2B1A:
	ldr r0, [r5, #0x28]
	movs r1, #0xf2
	bl FUN_020503DC
	cmp r0, #0
	bne _021F2B2A
	movs r0, #0x13
	pop {r3, r4, r5, r6, r7, pc}
_021F2B2A:
	cmp r4, #0
	bne _021F2B3A
	cmp r6, #0
	beq _021F2B36
	movs r0, #0xd
	pop {r3, r4, r5, r6, r7, pc}
_021F2B36:
	movs r0, #0xc
	pop {r3, r4, r5, r6, r7, pc}
_021F2B3A:
	ldr r0, [r5, #0x28]
	movs r1, #0x65
	bl FUN_020503DC
	cmp r0, #0
	beq _021F2B58
	bl FUN_0201FD44
	movs r1, #3
	blx FUN_020F2998
	adds r1, #0x14
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F2B58:
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	adds r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F2B70: .4byte 0x021F86BC
_021F2B74: .4byte 0x021F86BD
_021F2B78: .4byte 0x00000983
_021F2B7C: .4byte 0x0000011A
	thumb_func_end ov101_021F2A28

	thumb_func_start ov101_021F2B80
ov101_021F2B80: @ 0x021F2B80
	push {r3, r4, r5, lr}
	movs r2, #0
	strh r2, [r1, #0x20]
	ldrb r2, [r1, #0x18]
	ldr r3, _021F2BBC @ =0x021F968C
	lsls r4, r2, #4
	movs r2, #6
	muls r2, r4, r2
	ldrb r4, [r1, #0x19]
	cmp r4, #0
	beq _021F2BA2
	adds r1, r3, r2
	adds r1, #0x30
	movs r2, #8
	bl ov101_021F2BC0
	pop {r3, r4, r5, pc}
_021F2BA2:
	ldr r5, [r1, #0x10]
	ldrh r1, [r0, #0x30]
	ldrh r4, [r5, #6]
	cmp r4, r1
	bne _021F2BB0
	ldrh r0, [r5, #0xa]
	pop {r3, r4, r5, pc}
_021F2BB0:
	adds r1, r3, r2
	movs r2, #8
	bl ov101_021F2BC0
	pop {r3, r4, r5, pc}
	nop
_021F2BBC: .4byte 0x021F968C
	thumb_func_end ov101_021F2B80

	thumb_func_start ov101_021F2BC0
ov101_021F2BC0: @ 0x021F2BC0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	str r0, [sp]
	adds r0, #0x88
	adds r7, r2, #0
	str r0, [sp]
	adds r4, r1, #0
	movs r6, #0
	cmp r7, #0
	ble _021F2C5C
_021F2BD4:
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _021F2C5C
	cmp r0, #0
	beq _021F2C5C
	cmp r0, #8
	bhi _021F2C3C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F2BEE: @ jump table
	.2byte _021F2C3C - _021F2BEE - 2 @ case 0
	.2byte _021F2C3C - _021F2BEE - 2 @ case 1
	.2byte _021F2C00 - _021F2BEE - 2 @ case 2
	.2byte _021F2C1E - _021F2BEE - 2 @ case 3
	.2byte _021F2C28 - _021F2BEE - 2 @ case 4
	.2byte _021F2C32 - _021F2BEE - 2 @ case 5
	.2byte _021F2C3C - _021F2BEE - 2 @ case 6
	.2byte _021F2C0A - _021F2BEE - 2 @ case 7
	.2byte _021F2C14 - _021F2BEE - 2 @ case 8
_021F2C00:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F2CB8
	b _021F2C44
_021F2C0A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F2D48
	b _021F2C44
_021F2C14:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F2D90
	b _021F2C44
_021F2C1E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F2D10
	b _021F2C44
_021F2C28:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F2DC8
	b _021F2C44
_021F2C32:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F2DE8
	b _021F2C44
_021F2C3C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F2CAC
_021F2C44:
	cmp r0, #0
	beq _021F2C52
	ldrh r1, [r4, #2]
	ldr r0, [sp]
	strh r1, [r0, #0x20]
	ldrh r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
_021F2C52:
	adds r6, r6, #1
	adds r1, r4, #0
	adds r4, r4, #6
	cmp r6, r7
	blt _021F2BD4
_021F2C5C:
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _021F2C66
	cmp r0, #0
	bne _021F2C6E
_021F2C66:
	ldr r1, [sp]
	movs r0, #0
	strh r0, [r1, #0x20]
	pop {r3, r4, r5, r6, r7, pc}
_021F2C6E:
	ldrh r2, [r1, #2]
	ldr r0, [sp]
	strh r2, [r0, #0x20]
	ldrh r0, [r1, #4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F2BC0

	thumb_func_start ov101_021F2C78
ov101_021F2C78: @ 0x021F2C78
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_0201FDB8
	adds r5, r0, #0
	bl FUN_0201FDB8
	adds r2, r5, #0
	eors r2, r0
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r2, #8
	eors r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x64
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bgt _021F2CA8
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F2CA8:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F2C78

	thumb_func_start ov101_021F2CAC
ov101_021F2CAC: @ 0x021F2CAC
	ldr r3, _021F2CB4 @ =ov101_021F2C78
	ldrb r0, [r1, #1]
	bx r3
	nop
_021F2CB4: .4byte ov101_021F2C78
	thumb_func_end ov101_021F2CAC

	thumb_func_start ov101_021F2CB8
ov101_021F2CB8: @ 0x021F2CB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x88
	adds r4, r1, #0
	ldrb r1, [r6, #0x18]
	ldr r0, [r5, #0x20]
	bl FUN_0202F0E8
	cmp r0, #0
	beq _021F2CD2
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F2CD2:
	ldrb r1, [r6, #0x18]
	ldr r0, [r5, #0x20]
	bl FUN_0202F128
	cmp r0, #0
	beq _021F2CE2
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F2CE2:
	ldr r0, [r5, #0x28]
	movs r1, #0xc6
	bl FUN_020503DC
	cmp r0, #0
	bne _021F2D08
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _021F2D08
	ldrh r0, [r4, #4]
	bl ov101_021F2374
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #3
	bne _021F2D08
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F2D08:
	ldrb r0, [r4, #1]
	bl ov101_021F2C78
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F2CB8

	thumb_func_start ov101_021F2D10
ov101_021F2D10: @ 0x021F2D10
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r0, #0x28]
	movs r1, #0xc6
	adds r4, #0x88
	bl FUN_020503DC
	cmp r0, #0
	bne _021F2D28
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F2D28:
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #0x34]
	ldrb r0, [r2, #0xd]
	cmp r1, r0
	bne _021F2D3C
	adds r4, #0x23
	ldrb r1, [r4]
	ldrb r0, [r2, #0xe]
	cmp r1, r0
	beq _021F2D40
_021F2D3C:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F2D40:
	ldrb r0, [r5, #1]
	bl ov101_021F2C78
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F2D10

	thumb_func_start ov101_021F2D48
ov101_021F2D48: @ 0x021F2D48
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x28]
	adds r6, r1, #0
	adds r4, r5, #0
	movs r1, #0xc6
	adds r4, #0x88
	bl FUN_020503DC
	cmp r0, #0
	bne _021F2D62
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F2D62:
	ldr r0, [r4, #0x10]
	ldrh r0, [r0, #6]
	cmp r0, #0x60
	bne _021F2D78
	ldr r0, [r5, #0x28]
	bl FUN_02066870
	cmp r0, #0
	beq _021F2D78
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F2D78:
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	bl FUN_0202F0E8
	cmp r0, #0
	bne _021F2D88
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F2D88:
	ldrb r0, [r6, #1]
	bl ov101_021F2C78
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F2D48

	thumb_func_start ov101_021F2D90
ov101_021F2D90: @ 0x021F2D90
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	ldr r0, [r4, #0x10]
	adds r6, r1, #0
	ldrh r0, [r0, #6]
	cmp r0, #0x60
	bne _021F2DB0
	ldr r0, [r5, #0x28]
	bl FUN_02066870
	cmp r0, #0
	beq _021F2DB0
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F2DB0:
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	bl FUN_0202F128
	cmp r0, #0
	bne _021F2DC0
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F2DC0:
	ldrb r0, [r6, #1]
	bl ov101_021F2C78
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F2D90

	thumb_func_start ov101_021F2DC8
ov101_021F2DC8: @ 0x021F2DC8
	push {r3, lr}
	adds r0, #0xbc
	ldr r0, [r0]
	cmp r0, #2
	beq _021F2DDA
	cmp r0, #4
	beq _021F2DDA
	cmp r0, #6
	bne _021F2DE2
_021F2DDA:
	ldrb r0, [r1, #1]
	bl ov101_021F2C78
	pop {r3, pc}
_021F2DE2:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov101_021F2DC8

	thumb_func_start ov101_021F2DE8
ov101_021F2DE8: @ 0x021F2DE8
	push {r4, lr}
	ldr r0, [r0, #0x28]
	adds r4, r1, #0
	bl FUN_02066E58
	cmp r0, #0
	beq _021F2DFE
	ldrb r0, [r4, #1]
	bl ov101_021F2C78
	pop {r4, pc}
_021F2DFE:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F2DE8

	thumb_func_start ov101_021F2E04
ov101_021F2E04: @ 0x021F2E04
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc4
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_0203B324
	cmp r0, #0
	bne _021F2E1C
	add sp, #0xc4
	movs r0, #0x13
	pop {r3, r4, r5, r6, pc}
_021F2E1C:
	add r0, sp, #0
	adds r1, r6, #0
	bl FUN_0203B88C
	cmp r5, #0xb
	bne _021F2E4A
	cmp r4, #2
	bne _021F2E34
	add r0, sp, #0xc0
	ldrh r1, [r0]
	add r0, sp, #0x80
	strh r1, [r0, #0x22]
_021F2E34:
	bl FUN_0201FD44
	movs r1, #5
	blx FUN_020F2998
	add r0, sp, #0x94
	lsls r1, r1, #2
	adds r0, #2
	add sp, #0xc4
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, r6, pc}
_021F2E4A:
	cmp r4, #0
	beq _021F2E60
	cmp r4, #1
	beq _021F2E58
	cmp r4, #2
	beq _021F2E5C
	b _021F2E60
_021F2E58:
	add r4, sp, #0x2c
	b _021F2E62
_021F2E5C:
	add r4, sp, #0x44
	b _021F2E62
_021F2E60:
	add r4, sp, #0x14
_021F2E62:
	bl FUN_0201FD44
	movs r1, #0xc
	blx FUN_020F2998
	lsls r0, r1, #1
	ldrh r0, [r4, r0]
	add sp, #0xc4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov101_021F2E04

	thumb_func_start ov101_021F2E74
ov101_021F2E74: @ 0x021F2E74
	push {r3, r4, r5, lr}
	sub sp, #0x40
	adds r4, r1, #0
	add r1, sp, #0xc
	adds r5, r0, #0
	bl FUN_020735D8
	adds r0, r4, #0
	movs r1, #0x6c
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x6c
	blx FUN_020D4994
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_020735E8
	add r1, sp, #0
	ldrb r0, [r1, #0xc]
	cmp r0, #3
	bhi _021F2F28
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F2EB0: @ jump table
	.2byte _021F2EB8 - _021F2EB0 - 2 @ case 0
	.2byte _021F2ED4 - _021F2EB0 - 2 @ case 1
	.2byte _021F2EF0 - _021F2EB0 - 2 @ case 2
	.2byte _021F2F0C - _021F2EB0 - 2 @ case 3
_021F2EB8:
	ldrb r5, [r1, #0xf]
	movs r2, #0
	cmp r5, #0
	ble _021F2F34
	adds r1, r4, #0
	add r3, sp, #0
_021F2EC4:
	ldrh r0, [r1, #4]
	adds r2, r2, #1
	adds r1, #8
	strh r0, [r3]
	adds r3, r3, #2
	cmp r2, r5
	blt _021F2EC4
	b _021F2F34
_021F2ED4:
	ldrb r3, [r1, #0xf]
	movs r5, #0
	cmp r3, #0
	ble _021F2F34
	adds r1, r4, #0
	add r2, sp, #0
_021F2EE0:
	ldrh r0, [r1, #4]
	adds r5, r5, #1
	adds r1, #0x10
	strh r0, [r2]
	adds r2, r2, #2
	cmp r5, r3
	blt _021F2EE0
	b _021F2F34
_021F2EF0:
	ldrb r3, [r1, #0xf]
	movs r5, #0
	cmp r3, #0
	ble _021F2F34
	adds r1, r4, #0
	add r2, sp, #0
_021F2EFC:
	ldrh r0, [r1, #4]
	adds r5, r5, #1
	adds r1, #0xa
	strh r0, [r2]
	adds r2, r2, #2
	cmp r5, r3
	blt _021F2EFC
	b _021F2F34
_021F2F0C:
	ldrb r3, [r1, #0xf]
	movs r5, #0
	cmp r3, #0
	ble _021F2F34
	adds r1, r4, #0
	add r2, sp, #0
_021F2F18:
	ldrh r0, [r1, #4]
	adds r5, r5, #1
	adds r1, #0x12
	strh r0, [r2]
	adds r2, r2, #2
	cmp r5, r3
	blt _021F2F18
	b _021F2F34
_021F2F28:
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x40
	movs r0, #0x13
	pop {r3, r4, r5, pc}
_021F2F34:
	adds r0, r4, #0
	bl FUN_0201AB0C
	bl FUN_0201FD44
	add r1, sp, #0
	ldrb r1, [r1, #0xf]
	blx FUN_020F2998
	lsls r1, r1, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	add sp, #0x40
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F2E74

	thumb_func_start ov101_021F2F50
ov101_021F2F50: @ 0x021F2F50
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F2F68
	cmp r1, #1
	beq _021F2FB8
	cmp r1, #2
	beq _021F2FC4
	b _021F2FDA
_021F2F68:
	bl ov101_021F2110
	ldrh r0, [r4, #0x1e]
	bl ov101_021F2374
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov101_021F2248
	ldr r0, [r4, #0x10]
	ldr r1, [r5]
	ldrh r0, [r0, #4]
	bl ov101_021F2E74
	adds r2, r0, #0
	ldr r0, [r5, #0x50]
	movs r1, #0xa
	bl FUN_0200BEE8
	ldr r1, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0x23
	ldrh r0, [r1, #6]
	ldrb r1, [r1, #3]
	ldrb r2, [r2]
	bl ov101_021F2E04
	adds r2, r0, #0
	ldr r0, [r5, #0x50]
	movs r1, #0xb
	bl FUN_0200BEE8
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0xc]
	cmp r0, #0xff
	bne _021F2FF0
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021F2FF0
_021F2FB8:
	bl ov101_021F2614
	cmp r0, #0
	bne _021F2FF0
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F2FC4:
	ldrh r0, [r4, #0x1e]
	bl ov101_021F2374
	adds r3, r0, #0
	ldrb r2, [r3]
	ldrb r3, [r3, #1]
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	bl ov101_021F21F0
	b _021F2FF0
_021F2FDA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F2FE6
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F2FE6:
	ldr r0, [r5, #0x4c]
	bl FUN_0200BB44
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F2FF0:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F2F50

	thumb_func_start ov101_021F2FFC
ov101_021F2FFC: @ 0x021F2FFC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3014
	cmp r1, #1
	beq _021F3036
	cmp r1, #2
	beq _021F3042
	b _021F308A
_021F3014:
	bl ov101_021F2110
	ldrh r0, [r4, #0x1e]
	bl ov101_021F2374
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov101_021F2248
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0xc]
	cmp r0, #0xff
	bne _021F30A0
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021F30A0
_021F3036:
	bl ov101_021F2614
	cmp r0, #0
	bne _021F30A0
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3042:
	bl FUN_0201FD44
	movs r1, #0xb
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	ldrh r0, [r4, #0x1e]
	bl ov101_021F2374
	ldrb r3, [r0, #1]
	ldrb r2, [r0]
	cmp r2, r3
	bne _021F306E
	adds r2, r2, r5
	lsls r2, r2, #0x18
	ldr r1, [r6, #0x4c]
	adds r0, r6, #0
	lsrs r2, r2, #0x18
	bl ov101_021F2208
	b _021F30A0
_021F306E:
	lsls r0, r5, #0x19
	lsrs r5, r0, #0x18
	adds r3, r3, r5
	adds r2, r2, r5
	adds r3, r3, #1
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	ldr r1, [r6, #0x4c]
	adds r0, r6, #0
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021F21F0
	b _021F30A0
_021F308A:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3096
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3096:
	ldr r0, [r6, #0x4c]
	bl FUN_0200BB44
	movs r0, #1
	pop {r4, r5, r6, pc}
_021F30A0:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021F2FFC

	thumb_func_start ov101_021F30AC
ov101_021F30AC: @ 0x021F30AC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0
	strh r0, [r4, #0x20]
	ldr r0, [r5, #0x1c]
	bl FUN_0202A634
	ldrb r1, [r4, #0x1a]
	adds r6, r0, #0
	cmp r1, #2
	bne _021F30CC
	movs r0, #0
	strh r0, [r4, #0x20]
	movs r0, #0x52
	pop {r4, r5, r6, pc}
_021F30CC:
	ldrb r1, [r4, #0x19]
	cmp r1, #0
	beq _021F30F4
	bl FUN_02029E0C
	movs r1, #0x32
	blx FUN_020F2998
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bne _021F30E6
	movs r0, #1
	b _021F30EC
_021F30E6:
	cmp r0, #9
	bls _021F30EC
	movs r0, #9
_021F30EC:
	adds r0, #0x44
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6, pc}
_021F30F4:
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3102
	movs r0, #0x44
	pop {r4, r5, r6, pc}
_021F3102:
	ldr r0, [r5, #0x28]
	ldr r1, _021F3134 @ =0x00000988
	bl FUN_020503DC
	cmp r0, #0
	beq _021F3112
	movs r0, #0x51
	pop {r4, r5, r6, pc}
_021F3112:
	adds r0, r6, #0
	bl FUN_0202A55C
	cmp r0, #0
	bne _021F312C
	ldr r0, [r5, #0x28]
	ldr r1, _021F3138 @ =0x00000987
	bl FUN_020503DC
	cmp r0, #0
	beq _021F312C
	movs r0, #0x50
	pop {r4, r5, r6, pc}
_021F312C:
	movs r0, #5
	strh r0, [r4, #0x20]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021F3134: .4byte 0x00000988
_021F3138: .4byte 0x00000987
	thumb_func_end ov101_021F30AC

	thumb_func_start ov101_021F313C
ov101_021F313C: @ 0x021F313C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #5
	bls _021F314E
	b _021F33E8
_021F314E:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F315A: @ jump table
	.2byte _021F3166 - _021F315A - 2 @ case 0
	.2byte _021F31E0 - _021F315A - 2 @ case 1
	.2byte _021F31FA - _021F315A - 2 @ case 2
	.2byte _021F3250 - _021F315A - 2 @ case 3
	.2byte _021F332E - _021F315A - 2 @ case 4
	.2byte _021F33C0 - _021F315A - 2 @ case 5
_021F3166:
	bl ov101_021F2110
	ldr r0, [r5, #0x1c]
	bl FUN_0202A634
	adds r6, r0, #0
	bl FUN_0202A55C
	adds r1, r4, #0
	adds r1, #0x4d
	ldrb r1, [r1]
	movs r2, #1
	lsls r0, r0, #0x18
	bics r1, r2
	lsrs r2, r0, #0x18
	movs r0, #1
	ands r0, r2
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	adds r0, r6, #0
	bl FUN_02029F60
	adds r1, r4, #0
	adds r1, #0x4d
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1f
	ldrb r1, [r1]
	movs r2, #2
	lsrs r0, r0, #0x1e
	bics r1, r2
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	adds r0, r6, #0
	bl FUN_02029F48
	adds r1, r4, #0
	adds r1, #0x4d
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1f
	ldrb r1, [r1]
	movs r2, #4
	lsrs r0, r0, #0x1d
	bics r1, r2
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	str r6, [r4, #0x50]
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #0xd
	movs r3, #0xe
	bl ov101_021F21F0
	b _021F3418
_021F31E0:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F31EE
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_021F31EE:
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #0xf
	bl ov101_021F2208
	b _021F3418
_021F31FA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3208
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_021F3208:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021F3234
	ldr r0, [r5, #0x28]
	ldr r1, _021F3424 @ =0x00000987
	bl FUN_020503DC
	cmp r0, #0
	beq _021F322A
	adds r0, r4, #0
	movs r1, #2
	adds r0, #0x4a
	strb r1, [r0]
	b _021F323C
_021F322A:
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x4a
	strb r1, [r0]
	b _021F323C
_021F3234:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x4a
	strb r1, [r0]
_021F323C:
	adds r1, r4, #0
	adds r1, #0x4a
	ldrb r1, [r1]
	adds r0, r5, #0
	adds r1, r1, #3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov101_021F2308
	b _021F3418
_021F3250:
	bl ov101_021F2338
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	bne _021F3264
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_021F3264:
	adds r0, r5, #0
	bl ov101_021F2344
	cmp r6, #0
	bne _021F329C
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #2
	bne _021F328A
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r1, [r0]
	movs r0, #8
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	b _021F32D0
_021F328A:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r1, [r0]
	movs r0, #8
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	b _021F32D0
_021F329C:
	cmp r6, #1
	bne _021F32BC
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #1
	bne _021F32BC
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r1, [r0]
	movs r0, #8
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	b _021F32D0
_021F32BC:
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #0x15
	bl ov101_021F2208
	movs r0, #0xff
	str r0, [r4, #4]
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_021F32D0:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	ldr r0, [r4, #0x50]
	bne _021F32EC
	bl FUN_02029EF4
	adds r7, r0, #0
	ldr r0, [r4, #0x50]
	bl FUN_02029EA0
	b _021F32F8
_021F32EC:
	bl FUN_02029E48
	adds r7, r0, #0
	ldr r0, [r4, #0x50]
	bl FUN_02029E0C
_021F32F8:
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	movs r1, #5
	adds r2, r7, #0
	movs r3, #3
	bl FUN_0200BFCC
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	movs r1, #6
	adds r2, r6, #0
	movs r3, #3
	bl FUN_0200BFCC
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #0x14
	bl ov101_021F2208
	b _021F3418
_021F332E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F333C
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_021F333C:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	movs r6, #0
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	ldr r0, [r4, #0x50]
	bne _021F3376
	bl FUN_02029FAC
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r1, [r1]
	add r2, sp, #8
	bl FUN_0205BBD0
	adds r7, r0, #0
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _021F339E
	ldr r0, [r5, #0x28]
	ldr r1, _021F3424 @ =0x00000987
	bl FUN_02050408
	movs r6, #1
	b _021F339E
_021F3376:
	bl FUN_02029F74
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r1, [r1]
	add r2, sp, #8
	bl FUN_0205BC78
	adds r7, r0, #0
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	beq _021F339E
	ldr r0, [r5, #0x28]
	ldr r1, _021F3428 @ =0x00000988
	bl FUN_02050408
	movs r6, #1
_021F339E:
	add r0, sp, #8
	ldrh r0, [r0]
	bl FUN_02006B24
	lsls r2, r7, #0x18
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	lsrs r2, r2, #0x18
	bl ov101_021F2208
	cmp r6, #0
	beq _021F3418
	movs r0, #0xff
	str r0, [r4, #4]
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_021F33C0:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F33CE
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_021F33CE:
	bl FUN_02006BCC
	cmp r0, #0
	beq _021F33DC
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_021F33DC:
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #0x15
	bl ov101_021F2208
	b _021F3418
_021F33E8:
	adds r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F33F8
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_021F33F8:
	ldr r0, [r4, #4]
	cmp r0, #0xff
	bne _021F340C
	bl FUN_02006BCC
	cmp r0, #0
	beq _021F340C
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_021F340C:
	ldr r0, [r5, #0x4c]
	bl FUN_0200BB44
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_021F3418:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021F3424: .4byte 0x00000987
_021F3428: .4byte 0x00000988
	thumb_func_end ov101_021F313C

	thumb_func_start ov101_021F342C
ov101_021F342C: @ 0x021F342C
	movs r3, #0
	strh r3, [r1, #0x20]
	ldr r2, [r1, #0x10]
	ldrh r0, [r0, #0x30]
	ldrh r2, [r2, #6]
	cmp r2, r0
	bne _021F343E
	movs r0, #0x53
	bx lr
_021F343E:
	movs r0, #0xc
	strh r0, [r1, #0x20]
	adds r0, r3, #0
	bx lr
	.align 2, 0
	thumb_func_end ov101_021F342C

	thumb_func_start ov101_021F3448
ov101_021F3448: @ 0x021F3448
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F345E
	cmp r1, #1
	beq _021F3486
	b _021F34E8
_021F345E:
	bl ov101_021F2110
	ldr r0, [r5, #0x28]
	ldr r1, _021F3510 @ =0x00000127
	bl FUN_020503DC
	cmp r0, #0
	beq _021F347A
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #6
	bl ov101_021F2208
	b _021F3502
_021F347A:
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #2
	bl ov101_021F2208
	b _021F3502
_021F3486:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3494
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F3494:
	ldr r0, [r5, #0x1c]
	bl FUN_02031B14
	adds r6, r0, #0
	bl FUN_02031BD0
	adds r7, r0, #0
	bne _021F34A8
	movs r2, #5
	b _021F34DE
_021F34A8:
	ldr r0, [r5, #0x28]
	ldr r1, _021F3514 @ =0x00000AA2
	bl FUN_020503DC
	cmp r0, #0
	beq _021F34B8
	movs r2, #4
	b _021F34DE
_021F34B8:
	adds r0, r6, #0
	bl FUN_02031BD4
	adds r2, r0, #0
	ldr r0, [r5, #0x50]
	movs r1, #0xa
	bl FUN_0200C0CC
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	movs r1, #0xb
	adds r2, r7, #0
	movs r3, #2
	bl FUN_0200BFCC
	movs r2, #3
_021F34DE:
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	bl ov101_021F2208
	b _021F3502
_021F34E8:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F34F6
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F34F6:
	ldr r0, [r5, #0x4c]
	bl FUN_0200BB44
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F3502:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3510: .4byte 0x00000127
_021F3514: .4byte 0x00000AA2
	thumb_func_end ov101_021F3448

	thumb_func_start ov101_021F3518
ov101_021F3518: @ 0x021F3518
	movs r2, #0
	strh r2, [r1, #0x20]
	ldr r1, [r1, #0x10]
	ldrh r0, [r0, #0x30]
	ldrh r1, [r1, #6]
	cmp r1, r0
	bne _021F352A
	movs r0, #0x54
	bx lr
_021F352A:
	movs r0, #0x55
	bx lr
	.align 2, 0
	thumb_func_end ov101_021F3518

	thumb_func_start ov101_021F3530
ov101_021F3530: @ 0x021F3530
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0
	strh r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3548
	movs r0, #0x56
	pop {r4, r5, r6, pc}
_021F3548:
	ldr r0, [r5, #0x20]
	bl FUN_0202F284
	adds r1, r4, #0
	adds r1, #0x4a
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #1
	bls _021F3562
	movs r0, #0x57
	pop {r4, r5, r6, pc}
_021F3562:
	bne _021F3568
	movs r0, #0x58
	pop {r4, r5, r6, pc}
_021F3568:
	ldr r0, [r5, #0x20]
	bl FUN_0202F274
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	beq _021F3584
	ldr r0, [r5, #0x20]
	movs r1, #0x10
	bl FUN_0202F0E8
	cmp r0, #0
	bne _021F3584
	movs r0, #0x57
	pop {r4, r5, r6, pc}
_021F3584:
	ldr r0, [r4, #0x38]
	bl FUN_02014844
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0xfe
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _021F359C
	movs r0, #0x5b
	pop {r4, r5, r6, pc}
_021F359C:
	cmp r6, #0
	bne _021F35B2
	ldr r0, [r5, #0x20]
	movs r1, #1
	bl FUN_0202F254
	ldr r0, [r5, #0x20]
	movs r1, #0x10
	movs r2, #1
	bl FUN_0202F0C4
_021F35B2:
	adds r4, #0x23
	ldrb r0, [r4]
	cmp r0, #1
	bne _021F35BE
	movs r0, #0x5a
	pop {r4, r5, r6, pc}
_021F35BE:
	movs r0, #0x59
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021F3530

	thumb_func_start ov101_021F35C4
ov101_021F35C4: @ 0x021F35C4
	ldrb r2, [r1, #0x19]
	cmp r2, #0
	beq _021F35D2
	movs r0, #0
	strh r0, [r1, #0x20]
	movs r0, #0x5d
	bx lr
_021F35D2:
	ldr r2, [r1, #0x10]
	ldrh r0, [r0, #0x30]
	ldrh r2, [r2, #6]
	cmp r2, r0
	bne _021F35E4
	movs r0, #0
	strh r0, [r1, #0x20]
	movs r0, #0x5c
	bx lr
_021F35E4:
	movs r0, #3
	strh r0, [r1, #0x20]
	movs r0, #0
	bx lr
	thumb_func_end ov101_021F35C4

	thumb_func_start ov101_021F35EC
ov101_021F35EC: @ 0x021F35EC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x88
	ldr r1, [r5, #4]
	cmp r1, #4
	bhi _021F36E6
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F3608: @ jump table
	.2byte _021F3612 - _021F3608 - 2 @ case 0
	.2byte _021F3618 - _021F3608 - 2 @ case 1
	.2byte _021F3634 - _021F3608 - 2 @ case 2
	.2byte _021F36B2 - _021F3608 - 2 @ case 3
	.2byte _021F36CC - _021F3608 - 2 @ case 4
_021F3612:
	bl ov101_021F2110
	b _021F36E6
_021F3618:
	bl ov101_021F2614
	cmp r0, #0
	bne _021F3626
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3626:
	ldr r1, [r4, #0x4c]
	adds r0, r4, #0
	movs r2, #3
	movs r3, #4
	bl ov101_021F21F0
	b _021F36E6
_021F3634:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3642
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3642:
	ldr r0, [r4, #0x1c]
	bl FUN_020270D8
	adds r6, r0, #0
	bl FUN_02073D4C
	adds r1, r0, #0
	ldr r2, [r4, #0x54]
	adds r0, r6, #0
	bl FUN_02073F00
	movs r0, #1
	str r0, [sp]
	movs r3, #2
	str r3, [sp, #4]
	ldr r0, [r4, #0x50]
	ldr r2, [r4, #0x54]
	movs r1, #0xa
	bl FUN_0200BE3C
	adds r0, r6, #0
	bl FUN_02073DFC
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0x50]
	movs r1, #0xb
	adds r2, r6, #0
	movs r3, #3
	bl FUN_0200BFCC
	cmp r6, #0
	bne _021F3696
	ldr r1, [r4, #0x4c]
	adds r0, r4, #0
	movs r2, #9
	bl ov101_021F2208
	b _021F36E6
_021F3696:
	bl FUN_0201FD44
	movs r1, #3
	blx FUN_020F2998
	adds r2, r1, #0
	adds r2, r2, #5
	lsls r2, r2, #0x18
	ldr r1, [r4, #0x4c]
	adds r0, r4, #0
	lsrs r2, r2, #0x18
	bl ov101_021F2208
	b _021F36E6
_021F36B2:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F36C0
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F36C0:
	ldr r1, [r4, #0x4c]
	adds r0, r4, #0
	movs r2, #8
	bl ov101_021F2208
	b _021F36E6
_021F36CC:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F36DA
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F36DA:
	ldr r0, [r4, #0x4c]
	bl FUN_0200BB44
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_021F36E6:
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021F35EC

	thumb_func_start ov101_021F36F4
ov101_021F36F4: @ 0x021F36F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp]
	adds r7, r0, #0
	ldr r0, [sp]
	movs r1, #0
	strh r1, [r0, #0x20]
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	beq _021F3720
	ldr r0, [r7, #0x28]
	ldr r1, _021F3794 @ =0x00000992
	bl FUN_020503DC
	cmp r0, #0
	beq _021F371A
	add sp, #8
	movs r0, #0x60
	pop {r3, r4, r5, r6, r7, pc}
_021F371A:
	add sp, #8
	movs r0, #0x5f
	pop {r3, r4, r5, r6, r7, pc}
_021F3720:
	ldr r0, [r7, #0x1c]
	bl FUN_020293D4
	ldr r1, [sp]
	str r0, [sp, #4]
	str r0, [r1, #0x50]
	adds r0, r1, #0
	adds r4, r1, #0
	movs r5, #0
	adds r0, #0x4a
	strb r5, [r0]
	adds r4, #0x4a
_021F3738:
	ldr r0, [sp, #4]
	adds r1, r5, #0
	bl FUN_020292DC
	adds r6, r0, #0
	bl FUN_020292E4
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	cmp r0, #0
	beq _021F376A
	adds r0, r6, #0
	bl FUN_020292E4
	adds r2, r0, #0
	adds r1, r5, #0
	ldr r0, [r7, #0x50]
	adds r1, #0xa
	bl FUN_0200BF8C
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_021F376A:
	adds r5, r5, #1
	cmp r5, #2
	blt _021F3738
	ldr r0, [sp]
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #2
	bne _021F3786
	ldr r0, [sp, #4]
	bl FUN_0206D02C
	ldr r1, [sp]
	adds r1, #0x48
	strh r0, [r1]
_021F3786:
	ldr r0, [sp]
	movs r1, #7
	strh r1, [r0, #0x20]
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3794: .4byte 0x00000992
	thumb_func_end ov101_021F36F4

	thumb_func_start ov101_021F3798
ov101_021F3798: @ 0x021F3798
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #3
	bhi _021F386A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F37B2: @ jump table
	.2byte _021F37BA - _021F37B2 - 2 @ case 0
	.2byte _021F37CA - _021F37B2 - 2 @ case 1
	.2byte _021F3830 - _021F37B2 - 2 @ case 2
	.2byte _021F3852 - _021F37B2 - 2 @ case 3
_021F37BA:
	bl ov101_021F2110
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #2
	bl ov101_021F2208
	b _021F3882
_021F37CA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F37D6
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F37D6:
	ldr r0, [r4, #0x50]
	bl FUN_020292F8
	cmp r0, #0
	beq _021F37F0
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #3
	bl ov101_021F2208
	movs r0, #0xff
	str r0, [r4, #4]
	b _021F382C
_021F37F0:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F380A
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #4
	bl ov101_021F2208
	movs r0, #3
	str r0, [r4, #4]
	b _021F382C
_021F380A:
	cmp r0, #1
	bne _021F381E
	movs r0, #3
	str r0, [r4, #4]
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #5
	bl ov101_021F2208
	b _021F382C
_021F381E:
	movs r0, #2
	str r0, [r4, #4]
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #6
	bl ov101_021F2208
_021F382C:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F3830:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F383C
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F383C:
	adds r2, r4, #0
	adds r2, #0x48
	ldrh r2, [r2]
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	adds r2, r2, #7
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl ov101_021F2208
	b _021F3882
_021F3852:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F385E
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F385E:
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #0xb
	bl ov101_021F2208
	b _021F3882
_021F386A:
	adds r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3878
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F3878:
	ldr r0, [r5, #0x4c]
	bl FUN_0200BB44
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F3882:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F3798

	thumb_func_start ov101_021F388C
ov101_021F388C: @ 0x021F388C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	movs r1, #0
	strh r1, [r5, #0x20]
	ldr r1, [r5, #0x10]
	ldrh r2, [r1, #6]
	ldrh r1, [r0, #0x30]
	cmp r2, r1
	bne _021F38A2
	movs r0, #0x61
	pop {r3, r4, r5, r6, r7, pc}
_021F38A2:
	ldr r0, [r0, #0x1c]
	bl FUN_020293D4
	adds r6, r5, #0
	str r0, [sp]
	str r0, [r5, #0x50]
	adds r0, r5, #0
	movs r4, #0
	adds r0, #0x4a
	strb r4, [r0]
	adds r6, #0x4a
_021F38B8:
	ldr r0, [sp]
	adds r1, r4, #0
	bl FUN_020292DC
	adds r7, r0, #0
	bl FUN_020292E4
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	cmp r0, #0
	beq _021F38E4
	ldrb r0, [r6]
	adds r0, r0, #1
	strb r0, [r6]
	adds r0, r7, #0
	bl FUN_0206C0E8
	adds r1, r5, r4
	adds r1, #0x4b
	b _021F38EA
_021F38E4:
	adds r1, r5, r4
	adds r1, #0x4b
	movs r0, #0
_021F38EA:
	adds r4, r4, #1
	strb r0, [r1]
	cmp r4, #2
	blt _021F38B8
	movs r0, #6
	strh r0, [r5, #0x20]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov101_021F388C

	thumb_func_start ov101_021F38FC
ov101_021F38FC: @ 0x021F38FC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #4
	bls _021F390E
	b _021F3A7A
_021F390E:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F391A: @ jump table
	.2byte _021F3924 - _021F391A - 2 @ case 0
	.2byte _021F3936 - _021F391A - 2 @ case 1
	.2byte _021F396E - _021F391A - 2 @ case 2
	.2byte _021F3A02 - _021F391A - 2 @ case 3
	.2byte _021F3A4A - _021F391A - 2 @ case 4
_021F3924:
	bl ov101_021F2110
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #3
	movs r3, #4
	bl ov101_021F21F0
	b _021F3A96
_021F3936:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3944
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3944:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F3962
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #0xa
	bl ov101_021F2208
	movs r0, #0xff
	str r0, [r4, #4]
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3962:
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #5
	bl ov101_021F2208
	b _021F3A96
_021F396E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F397C
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F397C:
	adds r0, r4, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F399E
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	movs r6, #0
	cmp r0, #0
	bne _021F3998
	movs r0, #4
	str r0, [r4, #4]
	b _021F39C4
_021F3998:
	movs r0, #3
	str r0, [r4, #4]
	b _021F39C4
_021F399E:
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F39B0
	movs r0, #4
	movs r6, #1
	str r0, [r4, #4]
	b _021F39C4
_021F39B0:
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #9
	bl ov101_021F2208
	movs r0, #0xff
	str r0, [r4, #4]
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F39C4:
	ldr r0, [r4, #0x50]
	adds r1, r6, #0
	bl FUN_020292DC
	bl FUN_020292E4
	adds r2, r0, #0
	ldr r0, [r5, #0x50]
	movs r1, #0xa
	bl FUN_0200BF8C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, r6
	str r0, [sp, #4]
	adds r2, #0x4b
	ldrb r2, [r2]
	ldr r0, [r5, #0x50]
	movs r1, #0xb
	movs r3, #3
	bl FUN_0200BFCC
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #6
	bl ov101_021F2208
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3A02:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3A10
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3A10:
	ldr r0, [r4, #0x50]
	movs r1, #1
	bl FUN_020292DC
	bl FUN_020292E4
	adds r2, r0, #0
	ldr r0, [r5, #0x50]
	movs r1, #0xa
	bl FUN_0200BF8C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	str r0, [sp, #4]
	adds r2, #0x4c
	ldrb r2, [r2]
	ldr r0, [r5, #0x50]
	movs r1, #0xb
	movs r3, #3
	bl FUN_0200BFCC
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #6
	bl ov101_021F2208
	b _021F3A96
_021F3A4A:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3A58
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3A58:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #1
	bne _021F3A6E
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #8
	bl ov101_021F2208
	b _021F3A96
_021F3A6E:
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #9
	bl ov101_021F2208
	b _021F3A96
_021F3A7A:
	adds r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3A8A
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3A8A:
	ldr r0, [r5, #0x4c]
	bl FUN_0200BB44
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_021F3A96:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021F38FC

	thumb_func_start ov101_021F3AA4
ov101_021F3AA4: @ 0x021F3AA4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0
	strh r0, [r4, #0x20]
	ldr r0, [r5, #0x28]
	bl FUN_02066614
	adds r1, r4, #0
	adds r1, #0x4d
	ldrb r1, [r1]
	movs r2, #1
	lsls r0, r0, #0x18
	bics r1, r2
	lsrs r2, r0, #0x18
	movs r0, #1
	ands r0, r2
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	ldr r0, [r4, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov101_021F3C60
	adds r1, r4, #0
	adds r1, #0x4a
	strb r0, [r1]
	ldr r0, [r5, #0x28]
	bl FUN_02066E58
	cmp r0, #0
	beq _021F3AEC
	movs r0, #0x63
	pop {r3, r4, r5, pc}
_021F3AEC:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F3AFA
	movs r0, #9
	strh r0, [r4, #0x20]
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F3AFA:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #3
	bne _021F3B08
	movs r0, #0x64
	pop {r3, r4, r5, pc}
_021F3B08:
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3B16
	movs r0, #0x62
	pop {r3, r4, r5, pc}
_021F3B16:
	movs r0, #8
	strh r0, [r4, #0x20]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F3AA4

	thumb_func_start ov101_021F3B20
ov101_021F3B20: @ 0x021F3B20
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3B34
	cmp r1, #1
	beq _021F3B56
	b _021F3B7E
_021F3B34:
	bl ov101_021F2110
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	ldr r1, [r5, #0x4c]
	lsls r3, r0, #1
	adds r2, r3, #3
	adds r3, r3, #4
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	adds r0, r5, #0
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021F21F0
	b _021F3B94
_021F3B56:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3B62
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F3B62:
	bl FUN_0201FD44
	movs r1, #3
	blx FUN_020F2998
	adds r2, r1, #0
	adds r2, #0xa
	lsls r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	lsrs r2, r2, #0x18
	bl ov101_021F2208
	b _021F3B94
_021F3B7E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3B8A
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F3B8A:
	ldr r0, [r5, #0x4c]
	bl FUN_0200BB44
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F3B94:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F3B20

	thumb_func_start ov101_021F3BA0
ov101_021F3BA0: @ 0x021F3BA0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3BB4
	cmp r1, #1
	beq _021F3BD8
	b _021F3C3E
_021F3BB4:
	bl ov101_021F2110
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	ldr r1, [r6, #0x4c]
	lsls r3, r0, #1
	adds r2, r3, #0
	adds r2, #0xf
	adds r3, #0x10
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	adds r0, r6, #0
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021F21F0
	b _021F3C54
_021F3BD8:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3BE4
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3BE4:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #3
	bne _021F3BFA
	ldr r1, [r6, #0x4c]
	adds r0, r6, #0
	movs r2, #0x24
	bl ov101_021F2208
	b _021F3C54
_021F3BFA:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r1, r0, #0x1f
	lsls r0, r1, #1
	adds r0, r1, r0
	adds r0, #0xb
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl FUN_0201FD44
	adds r1, r5, #0
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xd
	bne _021F3C2E
	ldr r1, [r6, #0x4c]
	adds r0, r6, #0
	movs r2, #0x22
	movs r3, #0x23
	bl ov101_021F21F0
	b _021F3C54
_021F3C2E:
	adds r2, #0x15
	lsls r2, r2, #0x18
	ldr r1, [r6, #0x4c]
	adds r0, r6, #0
	lsrs r2, r2, #0x18
	bl ov101_021F2208
	b _021F3C54
_021F3C3E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3C4A
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3C4A:
	ldr r0, [r6, #0x4c]
	bl FUN_0200BB44
	movs r0, #1
	pop {r4, r5, r6, pc}
_021F3C54:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021F3BA0

	thumb_func_start ov101_021F3C60
ov101_021F3C60: @ 0x021F3C60
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02095FF8
	cmp r0, #0
	beq _021F3C70
	movs r0, #3
	pop {r4, pc}
_021F3C70:
	cmp r4, #3
	bls _021F3C7C
	cmp r4, #0xa
	bhs _021F3C7C
	movs r0, #0
	pop {r4, pc}
_021F3C7C:
	cmp r4, #9
	bls _021F3C88
	cmp r4, #0x14
	bhs _021F3C88
	movs r0, #1
	pop {r4, pc}
_021F3C88:
	movs r0, #2
	pop {r4, pc}
	thumb_func_end ov101_021F3C60

	thumb_func_start ov101_021F3C8C
ov101_021F3C8C: @ 0x021F3C8C
	ldrb r2, [r1, #0x19]
	cmp r2, #0
	beq _021F3C9A
	movs r0, #0xb
	strh r0, [r1, #0x20]
	movs r0, #0
	bx lr
_021F3C9A:
	ldr r2, [r1, #0x10]
	ldrh r3, [r2, #6]
	ldrh r2, [r0, #0x30]
	cmp r3, r2
	bne _021F3CB4
	movs r2, #0
	strh r2, [r1, #0x20]
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r1, r0, #1
	ldr r0, _021F3CBC @ =0x021F86C8
	ldrh r0, [r0, r1]
	bx lr
_021F3CB4:
	movs r0, #0xa
	strh r0, [r1, #0x20]
	movs r0, #0
	bx lr
	.align 2, 0
_021F3CBC: .4byte 0x021F86C8
	thumb_func_end ov101_021F3C8C

	thumb_func_start ov101_021F3CC0
ov101_021F3CC0: @ 0x021F3CC0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3CD8
	cmp r1, #1
	beq _021F3CDE
	cmp r1, #2
	beq _021F3CF2
	b _021F3D14
_021F3CD8:
	bl ov101_021F2110
	b _021F3D2A
_021F3CDE:
	adds r2, r4, #0
	adds r2, #0x23
	ldrb r2, [r2]
	ldr r1, [r5, #0x4c]
	adds r2, r2, #4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl ov101_021F2208
	b _021F3D2A
_021F3CF2:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3CFE
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F3CFE:
	ldrh r0, [r5, #0x32]
	bl ov101_021F3E74
	adds r2, r0, #0
	lsls r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	lsrs r2, r2, #0x18
	bl ov101_021F2208
	b _021F3D2A
_021F3D14:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3D20
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F3D20:
	ldr r0, [r5, #0x4c]
	bl FUN_0200BB44
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F3D2A:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F3CC0

	thumb_func_start ov101_021F3D34
ov101_021F3D34: @ 0x021F3D34
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x1c]
	movs r4, #0
	bl FUN_0202ED7C
	bl FUN_0202EE70
	adds r6, r0, #0
	movs r1, #1
	add r0, sp, #0
	strb r1, [r0]
	ldr r0, [r5, #0x28]
	movs r1, #2
	movs r2, #0x19
	bl FUN_02066930
	cmp r0, #0
	beq _021F3D62
	movs r1, #1
	add r0, sp, #0
	strb r1, [r0, #1]
_021F3D62:
	cmp r6, #0
	beq _021F3D6C
	movs r1, #1
	add r0, sp, #0
	strb r1, [r0, #2]
_021F3D6C:
	cmp r6, #1
	bls _021F3D76
	movs r1, #1
	add r0, sp, #0
	strb r1, [r0, #3]
_021F3D76:
	ldr r0, [r5]
	movs r1, #0x49
	bl FUN_0201AACC
	movs r1, #0
	movs r2, #0x49
	adds r5, r0, #0
	blx FUN_020D4994
	ldr r3, _021F3DC4 @ =0x021F8760
	movs r1, #0
	add r0, sp, #0
_021F3D8E:
	ldrb r2, [r3]
	ldrb r2, [r0, r2]
	cmp r2, #0
	beq _021F3DA0
	adds r2, r4, #0
	adds r4, r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	strb r1, [r5, r2]
_021F3DA0:
	adds r1, r1, #1
	adds r3, r3, #1
	cmp r1, #0x49
	blt _021F3D8E
	bl FUN_0201FD44
	adds r1, r4, #0
	blx FUN_020F2998
	ldrb r4, [r5, r1]
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r4, #0x56
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021F3DC4: .4byte 0x021F8760
	thumb_func_end ov101_021F3D34

	thumb_func_start ov101_021F3DC8
ov101_021F3DC8: @ 0x021F3DC8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3DE0
	cmp r1, #1
	beq _021F3DE6
	cmp r1, #2
	beq _021F3DFA
	b _021F3E54
_021F3DE0:
	bl ov101_021F2110
	b _021F3E6A
_021F3DE6:
	adds r2, r4, #0
	adds r2, #0x23
	ldrb r2, [r2]
	ldr r1, [r5, #0x4c]
	adds r2, r2, #7
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl ov101_021F2208
	b _021F3E6A
_021F3DFA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3E06
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F3E06:
	bl FUN_0201FD44
	movs r1, #0xfa
	lsls r1, r1, #2
	blx FUN_020F2998
	movs r0, #0x7d
	lsls r0, r0, #2
	cmp r1, r0
	bge _021F3E42
	bl FUN_0201FD44
	movs r1, #0xe1
	lsls r1, r1, #2
	blx FUN_020F2998
	adds r0, r1, #0
	movs r1, #0x4b
	lsls r1, r1, #2
	blx FUN_020F2998
	adds r2, r0, #0
	adds r2, #0xa
	lsls r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	lsrs r2, r2, #0x18
	bl ov101_021F2208
	b _021F3E6A
_021F3E42:
	adds r0, r5, #0
	bl ov101_021F3D34
	adds r2, r0, #0
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	bl ov101_021F2208
	b _021F3E6A
_021F3E54:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3E60
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F3E60:
	ldr r0, [r5, #0x4c]
	bl FUN_0200BB44
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F3E6A:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F3DC8

	thumb_func_start ov101_021F3E74
ov101_021F3E74: @ 0x021F3E74
	push {r3, lr}
	ldr r3, _021F3EA4 @ =0x021F86CC
	movs r2, #0
_021F3E7A:
	ldrh r1, [r3]
	cmp r0, r1
	bne _021F3E88
	adds r2, #0xd
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	pop {r3, pc}
_021F3E88:
	adds r2, r2, #1
	adds r3, r3, #2
	cmp r2, #0x49
	blt _021F3E7A
	bl FUN_0201FD44
	movs r1, #3
	blx FUN_020F2998
	adds r1, #0xa
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	pop {r3, pc}
	nop
_021F3EA4: .4byte 0x021F86CC
	thumb_func_end ov101_021F3E74

	thumb_func_start ov101_021F3EA8
ov101_021F3EA8: @ 0x021F3EA8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x24]
	adds r4, r1, #0
	bl FUN_02028FF0
	cmp r0, #0x10
	blt _021F3EC8
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r1, [r0]
	movs r0, #1
	bics r1, r0
	movs r0, #1
	orrs r1, r0
	b _021F3ED2
_021F3EC8:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r1, [r0]
	movs r0, #1
	bics r1, r0
_021F3ED2:
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	bl FUN_0202F0E8
	adds r1, r4, #0
	adds r1, #0x4d
	ldrb r2, [r1]
	lsls r0, r0, #0x18
	movs r1, #2
	lsrs r0, r0, #0x18
	bics r2, r1
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1e
	adds r1, r2, #0
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F3F06
	movs r0, #0xe
	b _021F3F08
_021F3F06:
	movs r0, #0xd
_021F3F08:
	strh r0, [r4, #0x20]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F3EA8

	thumb_func_start ov101_021F3F10
ov101_021F3F10: @ 0x021F3F10
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #3
	bls _021F3F20
	b _021F4042
_021F3F20:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F3F2C: @ jump table
	.2byte _021F3F34 - _021F3F2C - 2 @ case 0
	.2byte _021F3F60 - _021F3F2C - 2 @ case 1
	.2byte _021F3FD6 - _021F3F2C - 2 @ case 2
	.2byte _021F3FEC - _021F3F2C - 2 @ case 3
_021F3F34:
	bl ov101_021F2110
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3F54
	movs r0, #0xff
	str r0, [r4, #4]
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #1
	bl ov101_021F2208
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3F54:
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #2
	bl ov101_021F2208
	b _021F405A
_021F3F60:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3F6C
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3F6C:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r1, r0, #0x1f
	lsrs r1, r1, #0x1f
	bne _021F3F8A
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #3
	bl ov101_021F2208
	movs r0, #0xff
	str r0, [r4, #4]
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3F8A:
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _021F3FA2
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #9
	bl ov101_021F2208
	movs r0, #0xff
	str r0, [r4, #4]
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3FA2:
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #0x34]
	ldrb r0, [r2, #0xd]
	cmp r1, r0
	bne _021F3FB8
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldrb r0, [r2, #0xe]
	cmp r1, r0
	beq _021F3FCA
_021F3FB8:
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #4
	bl ov101_021F2208
	movs r0, #0xff
	str r0, [r4, #4]
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3FCA:
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #5
	bl ov101_021F2208
	b _021F405A
_021F3FD6:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3FE2
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3FE2:
	adds r0, r5, #0
	movs r1, #6
	bl ov101_021F2308
	b _021F405A
_021F3FEC:
	bl ov101_021F2338
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	bne _021F3FFE
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F3FFE:
	adds r0, r5, #0
	bl ov101_021F2344
	cmp r6, #0
	beq _021F4014
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #7
	bl ov101_021F2208
	b _021F405A
_021F4014:
	ldrb r1, [r4, #0x18]
	adds r0, r5, #0
	bl ov101_021F40E8
	cmp r0, #0
	beq _021F4036
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #6
	bl ov101_021F2208
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	movs r2, #1
	bl FUN_0202F0C4
	b _021F405A
_021F4036:
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #8
	bl ov101_021F2208
	b _021F405A
_021F4042:
	adds r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F4050
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F4050:
	ldr r0, [r5, #0x4c]
	bl FUN_0200BB44
	movs r0, #1
	pop {r4, r5, r6, pc}
_021F405A:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F3F10

	thumb_func_start ov101_021F4064
ov101_021F4064: @ 0x021F4064
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F4078
	cmp r1, #1
	beq _021F4088
	b _021F40C8
_021F4078:
	bl ov101_021F2110
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #0xa
	bl ov101_021F2208
	b _021F40DE
_021F4088:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F4094
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F4094:
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	beq _021F40AC
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #0xb
	bl ov101_021F2208
	b _021F40DE
_021F40AC:
	bl FUN_0201FD44
	movs r1, #3
	blx FUN_020F2998
	adds r2, r1, #0
	adds r2, #0xc
	lsls r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	lsrs r2, r2, #0x18
	bl ov101_021F2208
	b _021F40DE
_021F40C8:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F40D4
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F40D4:
	ldr r0, [r5, #0x4c]
	bl FUN_0200BB44
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F40DE:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F4064

	thumb_func_start ov101_021F40E8
ov101_021F40E8: @ 0x021F40E8
	push {r4, lr}
	movs r4, #0
	cmp r1, #0x12
	beq _021F40FE
	ldr r0, [r0, #0x20]
	movs r1, #0x12
	bl FUN_0202F0E8
	cmp r0, #0
	beq _021F40FE
	adds r4, r4, #1
_021F40FE:
	cmp r4, #5
	bge _021F4106
	movs r0, #1
	pop {r4, pc}
_021F4106:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F40E8

	thumb_func_start ov101_021F410C
ov101_021F410C: @ 0x021F410C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0
	strh r0, [r4, #0x20]
	ldrb r0, [r4, #0x1a]
	cmp r0, #2
	bne _021F4120
	movs r0, #0x8d
	pop {r4, r5, r6, pc}
_021F4120:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F419A
	ldr r0, [r5, #0x1c]
	bl FUN_0202F57C
	ldrh r1, [r4, #0x1c]
	adds r6, r0, #0
	cmp r1, #0
	bgt _021F4138
	beq _021F4154
	b _021F4186
_021F4138:
	subs r1, #0x8e
	cmp r1, #4
	bhi _021F4186
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F414A: @ jump table
	.2byte _021F415C - _021F414A - 2 @ case 0
	.2byte _021F4168 - _021F414A - 2 @ case 1
	.2byte _021F4168 - _021F414A - 2 @ case 2
	.2byte _021F417E - _021F414A - 2 @ case 3
	.2byte _021F417E - _021F414A - 2 @ case 4
_021F4154:
	movs r0, #0xf
	strh r0, [r4, #0x20]
	movs r0, #0
	pop {r4, r5, r6, pc}
_021F415C:
	ldr r0, [r5, #0x28]
	movs r1, #4
	bl FUN_02066E84
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F4168:
	movs r1, #1
	bl FUN_0202F730
	ldr r0, [r5, #0x1c]
	bl FUN_02028EC0
	adds r1, r0, #0
	adds r0, r6, #0
	bl FUN_0202F784
	b _021F418E
_021F417E:
	movs r1, #4
	bl FUN_0202F730
	b _021F418E
_021F4186:
	movs r0, #0x9a
	strh r0, [r4, #0x1c]
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F418E:
	ldr r0, [r5, #0x28]
	movs r1, #7
	bl FUN_02066E84
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F419A:
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F41A8
	movs r0, #0x8c
	pop {r4, r5, r6, pc}
_021F41A8:
	ldr r0, [r5, #0x28]
	bl FUN_02066E74
	adds r0, #0x93
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021F410C

	thumb_func_start ov101_021F41B8
ov101_021F41B8: @ 0x021F41B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	str r1, [sp]
	adds r1, #0x88
	str r1, [sp]
	ldr r1, [r1, #4]
	cmp r1, #0
	bne _021F424A
	bl ov101_021F2110
	ldr r0, [r5, #0x20]
	ldr r2, [r5]
	add r1, sp, #4
	bl FUN_0202F340
	add r7, sp, #4
	adds r6, r0, #0
	ldrb r0, [r7]
	cmp r0, #0
	bne _021F41F2
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #0x26
	movs r3, #0x27
	bl ov101_021F21F0
	b _021F4242
_021F41F2:
	cmp r0, #6
	blo _021F4204
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	movs r2, #0x18
	movs r3, #0x19
	bl ov101_021F21F0
	b _021F4242
_021F4204:
	movs r4, #0
	cmp r0, #0
	bls _021F4222
_021F420A:
	ldrb r2, [r6, r4]
	adds r1, r4, #0
	ldr r0, [r5, #0x50]
	adds r1, #0xa
	bl FUN_0200CA94
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r7]
	cmp r4, r0
	blo _021F420A
_021F4222:
	subs r0, r0, #1
	lsls r1, r0, #1
	add r0, sp, #4
	strb r1, [r0]
	ldrb r3, [r0]
	ldr r1, [r5, #0x4c]
	adds r0, r5, #0
	adds r2, r3, #0
	adds r2, #0xe
	adds r3, #0xf
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov101_021F21F0
_021F4242:
	adds r0, r6, #0
	bl FUN_0201AB0C
	b _021F4264
_021F424A:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F4258
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F4258:
	ldr r0, [r5, #0x4c]
	bl FUN_0200BB44
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F4264:
	ldr r0, [sp]
	ldr r0, [r0, #4]
	adds r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F41B8

	thumb_func_start ov101_021F4274
ov101_021F4274: @ 0x021F4274
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	movs r0, #0
	strh r0, [r7, #0x20]
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	bne _021F42A4
	ldr r0, [r5, #0x28]
	bl FUN_02066E58
	cmp r0, #0
	beq _021F4292
	movs r0, #0x9c
	pop {r3, r4, r5, r6, r7, pc}
_021F4292:
	bl FUN_0201FD44
	movs r1, #3
	blx FUN_020F2998
	adds r1, #0xac
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F42A4:
	ldr r0, [r5, #0x24]
	bl FUN_02028FF0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r5, #0x24]
	movs r1, #2
	bl FUN_02028F98
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov101_021F42E4
	ldr r1, _021F42E0 @ =0x0000FFFF
	cmp r0, r1
	bne _021F42DE
	cmp r4, #0
	bne _021F42D4
	movs r0, #0xa9
	pop {r3, r4, r5, r6, r7, pc}
_021F42D4:
	cmp r6, #0x10
	bhs _021F42DC
	movs r0, #0xaa
	pop {r3, r4, r5, r6, r7, pc}
_021F42DC:
	movs r0, #0xab
_021F42DE:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F42E0: .4byte 0x0000FFFF
	thumb_func_end ov101_021F4274

	thumb_func_start ov101_021F42E4
ov101_021F42E4: @ 0x021F42E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x28]
	ldr r1, _021F445C @ =0x00000998
	adds r4, r2, #0
	adds r6, r3, #0
	bl FUN_020503DC
	cmp r0, #0
	bne _021F42FC
	ldr r0, _021F4460 @ =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F42FC:
	ldr r0, [r5, #0x28]
	ldr r1, _021F445C @ =0x00000998
	bl FUN_02050430
	cmp r4, #0x10
	blo _021F4324
	ldr r0, [r5, #0x28]
	ldr r1, _021F4464 @ =0x000009A4
	bl FUN_020503DC
	cmp r0, #0
	bne _021F4320
	ldr r0, [r5, #0x28]
	ldr r1, _021F4464 @ =0x000009A4
	bl FUN_02050408
	movs r0, #0xa8
	pop {r4, r5, r6, pc}
_021F4320:
	ldr r0, _021F4460 @ =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4324:
	ldr r0, [r5, #0x24]
	movs r1, #0xd
	bl FUN_02028F98
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F434C
	ldr r1, _021F4468 @ =0x000009A3
	bl FUN_020503DC
	cmp r0, #0
	bne _021F4348
	ldr r0, [r5, #0x28]
	ldr r1, _021F4468 @ =0x000009A3
	bl FUN_02050408
	movs r0, #0xa7
	pop {r4, r5, r6, pc}
_021F4348:
	ldr r0, _021F4460 @ =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F434C:
	movs r1, #0xf9
	bl FUN_020503DC
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F4372
	ldr r1, _021F446C @ =0x000009A2
	bl FUN_020503DC
	cmp r0, #0
	bne _021F436E
	ldr r0, [r5, #0x28]
	ldr r1, _021F446C @ =0x000009A2
	bl FUN_02050408
	movs r0, #0xa6
	pop {r4, r5, r6, pc}
_021F436E:
	ldr r0, _021F4460 @ =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4372:
	movs r1, #0x87
	bl FUN_020503DC
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F4398
	ldr r1, _021F4470 @ =0x000009A1
	bl FUN_020503DC
	cmp r0, #0
	bne _021F4394
	ldr r0, [r5, #0x28]
	ldr r1, _021F4470 @ =0x000009A1
	bl FUN_02050408
	movs r0, #0xa5
	pop {r4, r5, r6, pc}
_021F4394:
	ldr r0, _021F4460 @ =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4398:
	movs r1, #2
	movs r2, #5
	bl FUN_02066930
	cmp r0, #0
	beq _021F43A8
	movs r0, #0xa4
	pop {r4, r5, r6, pc}
_021F43A8:
	ldr r0, [r5, #0x28]
	bl FUN_02066614
	cmp r0, #0
	beq _021F43CE
	ldr r0, [r5, #0x28]
	ldr r1, _021F4474 @ =0x000009A5
	bl FUN_020503DC
	cmp r0, #0
	bne _021F43CA
	ldr r0, [r5, #0x28]
	ldr r1, _021F4474 @ =0x000009A5
	bl FUN_02050408
	movs r0, #0xa3
	pop {r4, r5, r6, pc}
_021F43CA:
	ldr r0, _021F4460 @ =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F43CE:
	ldr r0, [r5, #0x24]
	movs r1, #7
	bl FUN_02028F98
	cmp r0, #0
	beq _021F43DE
	movs r0, #0xa2
	pop {r4, r5, r6, pc}
_021F43DE:
	ldr r0, [r5, #0x28]
	movs r1, #0xc6
	bl FUN_020503DC
	cmp r0, #0
	beq _021F43EE
	movs r0, #0xa1
	pop {r4, r5, r6, pc}
_021F43EE:
	ldr r0, [r5, #0x28]
	movs r1, #0xca
	bl FUN_020503DC
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F441A
	movs r1, #0x9a
	lsls r1, r1, #4
	bl FUN_020503DC
	cmp r0, #0
	bne _021F4416
	movs r1, #0x9a
	ldr r0, [r5, #0x28]
	lsls r1, r1, #4
	bl FUN_02050408
	movs r0, #0xa0
	pop {r4, r5, r6, pc}
_021F4416:
	ldr r0, _021F4460 @ =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F441A:
	ldr r1, _021F4478 @ =0x0000096A
	bl FUN_020503DC
	cmp r0, #0
	beq _021F4440
	ldr r0, [r5, #0x28]
	ldr r1, _021F447C @ =0x0000099F
	bl FUN_020503DC
	cmp r0, #0
	bne _021F443C
	ldr r0, [r5, #0x28]
	ldr r1, _021F447C @ =0x0000099F
	bl FUN_02050408
	movs r0, #0x9f
	pop {r4, r5, r6, pc}
_021F443C:
	ldr r0, _021F4460 @ =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4440:
	ldr r0, [r5, #0x24]
	movs r1, #3
	bl FUN_02028F98
	cmp r0, #0
	beq _021F4450
	movs r0, #0x9e
	pop {r4, r5, r6, pc}
_021F4450:
	cmp r6, #0
	beq _021F4458
	movs r0, #0x9d
	pop {r4, r5, r6, pc}
_021F4458:
	ldr r0, _021F4460 @ =0x0000FFFF
	pop {r4, r5, r6, pc}
	.align 2, 0
_021F445C: .4byte 0x00000998
_021F4460: .4byte 0x0000FFFF
_021F4464: .4byte 0x000009A4
_021F4468: .4byte 0x000009A3
_021F446C: .4byte 0x000009A2
_021F4470: .4byte 0x000009A1
_021F4474: .4byte 0x000009A5
_021F4478: .4byte 0x0000096A
_021F447C: .4byte 0x0000099F
	thumb_func_end ov101_021F42E4

	thumb_func_start ov101_021F4480
ov101_021F4480: @ 0x021F4480
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	movs r2, #2
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x5b
	lsls r2, r2, #0x10
	bl FUN_0201A910
	adds r0, r4, #0
	movs r1, #0x6c
	movs r2, #0x5b
	bl FUN_02007280
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x6c
	blx FUN_020E5B44
	str r5, [r4, #0xc]
	movs r0, #0x5b
	str r0, [r4]
	adds r0, r4, #0
	bl ov101_021F4558
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F4480

	thumb_func_start ov101_021F44BC
ov101_021F44BC: @ 0x021F44BC
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	cmp r1, #9
	bhi _021F4526
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F44D6: @ jump table
	.2byte _021F44EA - _021F44D6 - 2 @ case 0
	.2byte _021F44F2 - _021F44D6 - 2 @ case 1
	.2byte _021F44FA - _021F44D6 - 2 @ case 2
	.2byte _021F4526 - _021F44D6 - 2 @ case 3
	.2byte _021F4526 - _021F44D6 - 2 @ case 4
	.2byte _021F4502 - _021F44D6 - 2 @ case 5
	.2byte _021F450A - _021F44D6 - 2 @ case 6
	.2byte _021F4512 - _021F44D6 - 2 @ case 7
	.2byte _021F451A - _021F44D6 - 2 @ case 8
	.2byte _021F4522 - _021F44D6 - 2 @ case 9
_021F44EA:
	bl ov101_021F46C8
	str r0, [r4]
	b _021F4526
_021F44F2:
	bl ov101_021F46EC
	str r0, [r4]
	b _021F4526
_021F44FA:
	bl ov101_021F4750
	str r0, [r4]
	b _021F4526
_021F4502:
	bl ov101_021F4764
	str r0, [r4]
	b _021F4526
_021F450A:
	bl ov101_021F4824
	str r0, [r4]
	b _021F4526
_021F4512:
	bl ov101_021F4888
	str r0, [r4]
	b _021F4526
_021F451A:
	bl ov101_021F4928
	str r0, [r4]
	b _021F4526
_021F4522:
	movs r0, #1
	pop {r4, pc}
_021F4526:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F44BC

	thumb_func_start ov101_021F452C
ov101_021F452C: @ 0x021F452C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov101_021F45D4
	ldr r2, [r4, #0xc]
	movs r0, #0x80
	ldrb r1, [r2, #5]
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r4, [r4]
	adds r0, r5, #0
	bl FUN_02007294
	adds r0, r4, #0
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F452C

	thumb_func_start ov101_021F4558
ov101_021F4558: @ 0x021F4558
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _021F45CC @ =ov101_021F4FCC
	str r4, [r0, #0x64]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x5c]
	ldr r1, _021F45D0 @ =ov101_021F4FDC
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x60]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl FUN_0202EE7C
	adds r1, r4, #0
	adds r1, #0x25
	strb r0, [r1]
	ldr r0, [r4, #0xc]
	adds r1, r4, #0
	adds r2, r4, #0
	ldr r0, [r0, #0x28]
	adds r1, #0x28
	adds r2, #0x2a
	bl FUN_0202EEB4
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r1, [r0]
	movs r0, #0xe0
	bics r1, r0
	movs r0, #0x60
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, r4, #0
	bl ov101_021F4634
	adds r1, r4, #0
	adds r1, #0x26
	ldrb r2, [r1]
	movs r1, #0xf
	bics r2, r1
	movs r1, #0xf
	ands r0, r1
	adds r1, r2, #0
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x26
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0xff
	adds r0, #0x27
	strb r1, [r0]
	bl FUN_02004A90
	strh r0, [r4, #0x2c]
	pop {r4, pc}
	.align 2, 0
_021F45CC: .4byte ov101_021F4FCC
_021F45D0: .4byte ov101_021F4FDC
	thumb_func_end ov101_021F4558

	thumb_func_start ov101_021F45D4
ov101_021F45D4: @ 0x021F45D4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x28
	movs r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	ldr r0, [r0, #0x28]
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl FUN_0202EEAC
	ldr r0, [r4, #0xc]
	movs r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x60]
	pop {r4, pc}
	thumb_func_end ov101_021F45D4

	thumb_func_start ov101_021F45FC
ov101_021F45FC: @ 0x021F45FC
	push {r4, r5}
	ldr r5, _021F462C @ =0x021F87AC
	movs r2, #0
	ldrb r3, [r5, r1]
	cmp r3, #0
	ble _021F4624
	ldr r3, _021F4630 @ =0x021FB2C0
	lsls r4, r1, #2
	ldrb r1, [r5, r1]
	ldr r4, [r3, r4]
_021F4610:
	ldrh r3, [r4]
	cmp r0, r3
	bne _021F461C
	movs r0, #1
	pop {r4, r5}
	bx lr
_021F461C:
	adds r2, r2, #1
	adds r4, r4, #2
	cmp r2, r1
	blt _021F4610
_021F4624:
	movs r0, #0
	pop {r4, r5}
	bx lr
	nop
_021F462C: .4byte 0x021F87AC
_021F4630: .4byte 0x021FB2C0
	thumb_func_end ov101_021F45FC

	thumb_func_start ov101_021F4634
ov101_021F4634: @ 0x021F4634
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrh r5, [r0, #0x10]
	adds r0, r5, #0
	bl FUN_0203B4C4
	cmp r0, #0
	bne _021F464C
	movs r0, #3
	pop {r3, r4, r5, pc}
_021F464C:
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021F45FC
	cmp r0, #0
	beq _021F465C
	movs r0, #4
	pop {r3, r4, r5, pc}
_021F465C:
	adds r0, r5, #0
	bl FUN_0203B3C8
	cmp r0, #0
	beq _021F4690
	ldr r0, [r4, #0xc]
	movs r1, #0x46
	ldr r0, [r0, #0x2c]
	lsls r1, r1, #2
	bl FUN_020503DC
	cmp r0, #0
	bne _021F467A
	movs r0, #3
	pop {r3, r4, r5, pc}
_021F467A:
	ldr r0, [r4, #0xc]
	ldr r1, _021F46C4 @ =0x0000011F
	ldr r0, [r0, #0x2c]
	bl FUN_020503DC
	cmp r0, #0
	beq _021F468C
	movs r0, #2
	pop {r3, r4, r5, pc}
_021F468C:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F4690:
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021F45FC
	cmp r0, #0
	beq _021F46AE
	ldr r0, [r4, #0xc]
	movs r1, #0xca
	ldr r0, [r0, #0x2c]
	bl FUN_020503DC
	cmp r0, #0
	bne _021F46AE
	movs r0, #6
	pop {r3, r4, r5, pc}
_021F46AE:
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x2c]
	bl FUN_02066E58
	cmp r0, #0
	beq _021F46BE
	movs r0, #5
	pop {r3, r4, r5, pc}
_021F46BE:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F46C4: .4byte 0x0000011F
	thumb_func_end ov101_021F4634

	thumb_func_start ov101_021F46C8
ov101_021F46C8: @ 0x021F46C8
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F49F8
	cmp r0, #0
	bne _021F46D8
	movs r0, #0
	pop {r4, pc}
_021F46D8:
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	beq _021F46E6
	movs r0, #7
	pop {r4, pc}
_021F46E6:
	movs r0, #5
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F46C8

	thumb_func_start ov101_021F46EC
ov101_021F46EC: @ 0x021F46EC
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	add r1, sp, #0
	adds r4, r0, #0
	bl ov101_021F5468
	ldr r1, [sp]
	cmp r1, #0
	bne _021F471C
	ldr r0, [r4, #0xc]
	bl FUN_021E5900
	ldr r0, [r4, #0xc]
	ldrb r1, [r0, #6]
	cmp r1, #1
	bne _021F4716
	bl FUN_021E59CC
	b _021F471C
_021F4716:
	adds r0, r4, #0
	bl ov101_021F5304
_021F471C:
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021F4748
	cmp r0, #4
	beq _021F472E
	cmp r0, #8
	beq _021F4738
	b _021F473E
_021F472E:
	ldr r1, [r4, #0xc]
	add sp, #4
	str r0, [r1, #0x1c]
	movs r0, #6
	pop {r3, r4, pc}
_021F4738:
	add sp, #4
	movs r0, #3
	pop {r3, r4, pc}
_021F473E:
	ldr r1, [r4, #0xc]
	add sp, #4
	str r0, [r1, #0x1c]
	movs r0, #8
	pop {r3, r4, pc}
_021F4748:
	movs r0, #1
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F46EC

	thumb_func_start ov101_021F4750
ov101_021F4750: @ 0x021F4750
	push {r3, lr}
	bl ov101_021F4A4C
	cmp r0, #0
	beq _021F475E
	movs r0, #9
	pop {r3, pc}
_021F475E:
	movs r0, #2
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov101_021F4750

	thumb_func_start ov101_021F4764
ov101_021F4764: @ 0x021F4764
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021F4776
	cmp r0, #1
	beq _021F4804
	b _021F481C
_021F4776:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r4, #0
	movs r6, #1
_021F4790:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #8
	blt _021F4790
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x40
	movs r3, #0xc0
	bl FUN_02003E5C
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl FUN_0200398C
	ldr r0, [r5, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	bl FUN_02004A90
	movs r1, #6
	bl FUN_02005EB4
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021F481C
_021F4804:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021F481C
	adds r0, r5, #0
	bl ov101_021F5090
	movs r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_021F481C:
	movs r0, #5
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021F4764

	thumb_func_start ov101_021F4824
ov101_021F4824: @ 0x021F4824
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021F4836
	cmp r0, #1
	beq _021F4856
	b _021F4882
_021F4836:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021F4882
_021F4856:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021F4882
	adds r0, r5, #0
	bl ov101_021F5048
	movs r4, #0
	adds r6, r4, #0
_021F4868:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #8
	blt _021F4868
	movs r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	movs r0, #2
	pop {r3, r4, r5, r6, pc}
_021F4882:
	movs r0, #6
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov101_021F4824

	thumb_func_start ov101_021F4888
ov101_021F4888: @ 0x021F4888
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021F489C
	cmp r0, #1
	beq _021F48E4
	cmp r0, #2
	beq _021F4904
	b _021F4922
_021F489C:
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021F50F0
	ldr r0, [r5, #0xc]
	movs r4, #0
	strb r4, [r0, #9]
	movs r6, #1
_021F48B6:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #3
	blt _021F48B6
	movs r0, #0
	movs r1, #0xe
	movs r2, #1
	bl FUN_0200B4F0
	bl FUN_02004A90
	movs r1, #6
	bl FUN_02005EB4
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021F4922
_021F48E4:
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_021E5D3C
	cmp r0, #0
	beq _021F4922
	adds r0, r5, #0
	movs r1, #0
	bl ov101_021F51C0
	cmp r0, #0
	beq _021F4922
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021F4922
_021F4904:
	ldr r0, [r5, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	ldr r0, [r5, #0xc]
	movs r1, #0
	strb r1, [r0, #9]
	adds r0, r5, #0
	bl ov101_021F5090
	movs r0, #0
	str r0, [r5, #4]
	movs r0, #1
	pop {r4, r5, r6, pc}
_021F4922:
	movs r0, #7
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov101_021F4888

	thumb_func_start ov101_021F4928
ov101_021F4928: @ 0x021F4928
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _021F493E
	cmp r1, #1
	beq _021F495C
	cmp r1, #2
	beq _021F497C
	b _021F49F0
_021F493E:
	movs r1, #1
	bl ov101_021F50F0
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	ldr r0, [r5, #0xc]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021F49F0
_021F495C:
	ldr r0, [r5, #0xc]
	movs r1, #1
	bl FUN_021E5D3C
	cmp r0, #0
	beq _021F49F0
	adds r0, r5, #0
	movs r1, #1
	bl ov101_021F51C0
	cmp r0, #0
	beq _021F49F0
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _021F49F0
_021F497C:
	movs r0, #0x10
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x40
	movs r3, #0xc0
	bl FUN_02003E5C
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl FUN_0200398C
	adds r0, r5, #0
	bl ov101_021F5048
	movs r4, #0
	adds r6, r4, #0
	adds r7, r4, #0
_021F49BA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	adds r0, r4, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #3
	blt _021F49BA
	ldr r0, [r5, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	ldr r0, [r5, #0xc]
	movs r1, #0
	strb r1, [r0, #9]
	add sp, #8
	str r1, [r5, #4]
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021F49F0:
	movs r0, #8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov101_021F4928

	thumb_func_start ov101_021F49F8
ov101_021F49F8: @ 0x021F49F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021F4A08
	cmp r1, #1
	beq _021F4A26
	b _021F4A3E
_021F4A08:
	bl ov101_021F4AEC
	adds r0, r4, #0
	bl ov101_021F4BC8
	adds r0, r4, #0
	bl ov101_021F4DC8
	adds r0, r4, #0
	bl ov101_021F4E6C
	adds r0, r4, #0
	bl ov101_021F4CE8
	b _021F4A3E
_021F4A26:
	bl ov101_021F4E84
	adds r0, r4, #0
	bl ov101_021F4F00
	ldr r1, _021F4A48 @ =ov101_021F50D8
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x58]
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021F4A3E:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021F4A48: .4byte ov101_021F50D8
	thumb_func_end ov101_021F49F8

	thumb_func_start ov101_021F4A4C
ov101_021F4A4C: @ 0x021F4A4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021F4A60
	cmp r1, #1
	beq _021F4AA0
	cmp r1, #2
	beq _021F4ABE
	b _021F4AE8
_021F4A60:
	movs r1, #0x28
	movs r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	movs r3, #0
	bl ov101_021F54AC
	cmp r0, #0xff
	beq _021F4A88
	ldr r1, [r4, #0x60]
	adds r0, r1, #0
	adds r0, #0x66
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	bne _021F4A88
	adds r1, #0x59
	ldrb r0, [r1]
	cmp r0, #0xb
	bne _021F4A92
_021F4A88:
	movs r0, #0
	movs r1, #4
	bl FUN_02005F50
	b _021F4A98
_021F4A92:
	movs r0, #2
	str r0, [r4, #8]
	b _021F4AE8
_021F4A98:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _021F4AE8
_021F4AA0:
	bl FUN_02005F88
	cmp r0, #0
	bne _021F4AE8
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrh r0, [r0, #2]
	bl FUN_02005D48
	bl FUN_0203E354
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _021F4AE8
_021F4ABE:
	ldr r1, [r4, #0xc]
	movs r2, #0
	str r2, [r1, #0x58]
	bl ov101_021F4EE8
	adds r0, r4, #0
	bl ov101_021F4E78
	adds r0, r4, #0
	bl ov101_021F4E48
	adds r0, r4, #0
	bl ov101_021F4CD8
	adds r0, r4, #0
	bl ov101_021F4BBC
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021F4AE8:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov101_021F4A4C

	thumb_func_start ov101_021F4AEC
ov101_021F4AEC: @ 0x021F4AEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xac
	movs r1, #0
	adds r5, r0, #0
	movs r0, #1
	adds r2, r1, #0
	blx FUN_020CD9FC
	ldr r4, _021F4BB8 @ =0x021F87F4
	add r3, sp, #4
	movs r2, #0x15
_021F4B02:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021F4B02
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x74]
	add r2, sp, #4
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x74]
	add r2, sp, #0x20
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #3
	ldr r0, [r0, #0x74]
	add r2, sp, #0x3c
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #5
	ldr r0, [r0, #0x74]
	add r2, sp, #0x58
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #6
	ldr r0, [r0, #0x74]
	add r2, sp, #0x74
	bl FUN_0201AD0C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #7
	ldr r0, [r0, #0x74]
	add r2, sp, #0x90
	bl FUN_0201AD0C
	movs r4, #0
	movs r6, #0x20
	adds r7, r4, #0
_021F4B70:
	ldr r0, [r5, #0xc]
	adds r1, r4, #1
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	ldr r3, [r5]
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0201C1C4
	ldr r0, [r5, #0xc]
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r4, #5
	lsls r0, r0, #0x18
	ldr r3, [r5]
	lsrs r0, r0, #0x18
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	adds r4, r4, #1
	cmp r4, #3
	blt _021F4B70
	add sp, #0xac
	pop {r4, r5, r6, r7, pc}
	nop
_021F4BB8: .4byte 0x021F87F4
	thumb_func_end ov101_021F4AEC

	thumb_func_start ov101_021F4BBC
ov101_021F4BBC: @ 0x021F4BBC
	ldr r3, _021F4BC4 @ =FUN_021E5CA4
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021F4BC4: .4byte FUN_021E5CA4
	thumb_func_end ov101_021F4BBC

	thumb_func_start ov101_021F4BC8
ov101_021F4BC8: @ 0x021F4BC8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #4
	bl FUN_02002CEC
	ldr r1, [r5]
	movs r0, #0x93
	bl FUN_02007688
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r2, r4, #0
	movs r3, #0x93
	adds r0, #0x10
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl FUN_0208820C
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r2, r4, #0
	movs r3, #0x93
	adds r0, #0x22
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl FUN_0208820C
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r2, r4, #0
	movs r3, #0x93
	adds r0, #0x16
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	lsls r0, r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl FUN_0208820C
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r2, r4, #0
	movs r3, #0x93
	adds r0, #0x1c
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	lsls r0, r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl FUN_0208820C
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r2, r4, #0
	movs r3, #0x93
	adds r0, #0x28
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	lsls r0, r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl FUN_0208820C
	ldr r0, [r5]
	adds r1, r5, #0
	str r0, [sp]
	adds r1, #0x25
	ldrb r1, [r1]
	adds r3, r5, #0
	adds r0, r4, #0
	adds r1, #0x16
	movs r2, #0
	adds r3, #0x68
	bl FUN_02007C2C
	str r0, [r5, #0x64]
	adds r0, r4, #0
	bl FUN_0200770C
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	ldr r0, [r5, #0xc]
	movs r1, #7
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov101_021F4BC8

	thumb_func_start ov101_021F4CD8
ov101_021F4CD8: @ 0x021F4CD8
	push {r3, lr}
	ldr r0, [r0, #0x64]
	bl FUN_0201AB0C
	movs r0, #4
	bl FUN_02002DB4
	pop {r3, pc}
	thumb_func_end ov101_021F4CD8

	thumb_func_start ov101_021F4CE8
ov101_021F4CE8: @ 0x021F4CE8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x93
	bl FUN_02007688
	adds r4, r0, #0
	movs r1, #0
	movs r0, #7
	adds r2, r5, #0
	str r1, [sp]
	lsls r0, r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	adds r2, #0x25
	ldr r0, [r5, #0xc]
	ldrb r2, [r2]
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	adds r1, r4, #0
	adds r2, #0xa
	bl FUN_02003220
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #6
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r2, r5, #0
	adds r2, #0x25
	ldr r0, [r5, #0xc]
	ldrb r2, [r2]
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	adds r1, r4, #0
	adds r2, r2, #4
	bl FUN_02003220
	movs r0, #2
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #6
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	adds r1, r4, #0
	bl FUN_02003220
	movs r0, #3
	str r0, [sp]
	lsls r0, r0, #7
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	adds r1, r4, #0
	bl FUN_02003220
	ldr r0, [r5, #0xc]
	movs r1, #1
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	movs r0, #0x10
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	adds r2, r1, #0
	ldr r0, [r0, #0x78]
	movs r3, #0xe0
	bl FUN_02003E5C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x78]
	movs r2, #0x40
	movs r3, #0xc0
	bl FUN_02003E5C
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl FUN_0200398C
	ldr r0, [r5, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x78]
	bl FUN_02003B50
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F4CE8

	thumb_func_start ov101_021F4DC8
ov101_021F4DC8: @ 0x021F4DC8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	adds r5, r7, #0
	ldr r4, _021F4E40 @ =0x021F87DC
	movs r6, #0
	adds r5, #0x30
_021F4DD6:
	ldrb r0, [r4, #2]
	adds r1, r5, #0
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #4]
	str r0, [sp, #8]
	ldrb r0, [r4, #5]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	str r0, [sp, #0x10]
	ldr r0, [r7, #0xc]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r0, #0x74]
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #3
	blt _021F4DD6
	ldr r4, [r7, #0xc]
	ldr r5, [r4, #0x20]
	ldrh r0, [r5, #0x10]
	bl FUN_0203B3C8
	adds r3, r0, #0
	adds r0, r7, #0
	adds r0, #0x30
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x50
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r0, #0x40
	str r0, [sp, #8]
	ldr r0, _021F4E44 @ =0x00010200
	str r0, [sp, #0xc]
	ldr r0, [r7]
	str r0, [sp, #0x10]
	ldrh r1, [r5, #0x10]
	ldrh r2, [r5, #0x12]
	ldr r0, [r4, #0x24]
	bl ov101_021F57B8
	str r0, [r7, #0x60]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021F4E40: .4byte 0x021F87DC
_021F4E44: .4byte 0x00010200
	thumb_func_end ov101_021F4DC8

	thumb_func_start ov101_021F4E48
ov101_021F4E48: @ 0x021F4E48
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x60]
	bl ov101_021F58A0
	movs r4, #0
	adds r5, #0x30
_021F4E56:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _021F4E56
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F4E48

	thumb_func_start ov101_021F4E6C
ov101_021F4E6C: @ 0x021F4E6C
	ldr r3, _021F4E74 @ =FUN_021E6978
	ldr r0, [r0, #0xc]
	movs r1, #1
	bx r3
	.align 2, 0
_021F4E74: .4byte FUN_021E6978
	thumb_func_end ov101_021F4E6C

	thumb_func_start ov101_021F4E78
ov101_021F4E78: @ 0x021F4E78
	ldr r3, _021F4E80 @ =FUN_021E69C8
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021F4E80: .4byte FUN_021E69C8
	thumb_func_end ov101_021F4E78

	thumb_func_start ov101_021F4E84
ov101_021F4E84: @ 0x021F4E84
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _021F4EE4 @ =0x021F889C
	movs r6, #0
	adds r5, r7, #0
_021F4E8E:
	ldr r1, [r7, #0xc]
	adds r2, r4, #0
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D2B4
	str r0, [r5, #0x10]
	movs r1, #1
	bl FUN_0200DD3C
	ldr r0, [r5, #0x10]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x10]
	movs r1, #1
	bl FUN_0202484C
	adds r6, r6, #1
	adds r4, #0x28
	adds r5, r5, #4
	cmp r6, #5
	blt _021F4E8E
	ldr r0, [r7, #0x20]
	movs r1, #3
	bl FUN_0200DD3C
	ldr r0, [r7, #0x20]
	movs r1, #1
	bl FUN_02024830
	movs r1, #0x28
	movs r2, #0x2a
	ldrsh r1, [r7, r1]
	ldrsh r2, [r7, r2]
	ldr r0, [r7, #0x20]
	bl FUN_0200DD88
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F4EE4: .4byte 0x021F889C
	thumb_func_end ov101_021F4E84

	thumb_func_start ov101_021F4EE8
ov101_021F4EE8: @ 0x021F4EE8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021F4EEE:
	ldr r0, [r5, #0x10]
	bl FUN_0200D018
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #5
	blt _021F4EEE
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F4EE8

	thumb_func_start ov101_021F4F00
ov101_021F4F00: @ 0x021F4F00
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	ldrb r0, [r1, #6]
	cmp r0, #1
	ldr r0, [r1, #0x7c]
	bne _021F4F2A
	movs r1, #0
	movs r2, #1
	bl FUN_021E7128
	ldr r0, [r4, #0xc]
	bl FUN_021E5DC8
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E72F8
	pop {r4, pc}
_021F4F2A:
	movs r1, #0
	adds r2, r1, #0
	bl FUN_021E7128
	pop {r4, pc}
	thumb_func_end ov101_021F4F00

	thumb_func_start ov101_021F4F34
ov101_021F4F34: @ 0x021F4F34
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r2, #4
	bhs _021F4F7A
	ldr r0, [r5, #0x68]
	movs r1, #4
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r1, #0x18
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsls r3, r2, #1
	ldr r2, _021F4FC4 @ =0x021FB2C8
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	ldr r6, _021F4FC8 @ =0x021FB2C9
	ldrb r2, [r2, r3]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	ldrb r3, [r6, r3]
	ldr r0, [r0, #0x74]
	movs r1, #2
	bl FUN_0201C4EC
_021F4F7A:
	cmp r4, #4
	bhs _021F4FB6
	ldr r0, [r5, #0x68]
	movs r2, #4
	str r2, [sp]
	adds r1, r0, #0
	str r2, [sp, #4]
	adds r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	movs r1, #0x18
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsls r3, r4, #1
	ldr r2, _021F4FC4 @ =0x021FB2C8
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	ldr r4, _021F4FC8 @ =0x021FB2C9
	ldrb r2, [r2, r3]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	ldrb r3, [r4, r3]
	ldr r0, [r0, #0x74]
	movs r1, #2
	bl FUN_0201C4EC
_021F4FB6:
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0, #0x74]
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021F4FC4: .4byte 0x021FB2C8
_021F4FC8: .4byte 0x021FB2C9
	thumb_func_end ov101_021F4F34

	thumb_func_start ov101_021F4FCC
ov101_021F4FCC: @ 0x021F4FCC
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r2, [r1]
	movs r1, #0x1e
	adds r0, #0x24
	bics r2, r1
	strb r2, [r0]
	bx lr
	thumb_func_end ov101_021F4FCC

	thumb_func_start ov101_021F4FDC
ov101_021F4FDC: @ 0x021F4FDC
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r2, [r1]
	movs r1, #0x1e
	ldr r3, _021F4FFC @ =FUN_021E7128
	bics r2, r1
	adds r1, r0, #0
	adds r1, #0x24
	strb r2, [r1]
	ldr r2, [r0, #0xc]
	movs r1, #0
	strb r1, [r2, #6]
	ldr r0, [r0, #0xc]
	adds r2, r1, #0
	ldr r0, [r0, #0x7c]
	bx r3
	.align 2, 0
_021F4FFC: .4byte FUN_021E7128
	thumb_func_end ov101_021F4FDC

	thumb_func_start ov101_021F5000
ov101_021F5000: @ 0x021F5000
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x26
	ldrb r0, [r0]
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x1e
	bne _021F5044
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #2
	ldr r0, [r4, #0x60]
	bne _021F5026
	adds r1, r4, #0
	adds r1, #0x27
	ldrb r1, [r1]
	movs r2, #0
	bl ov101_021F5970
	b _021F5032
_021F5026:
	adds r1, r4, #0
	adds r1, #0x27
	ldrb r1, [r1]
	movs r2, #1
	bl ov101_021F5970
_021F5032:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r1, [r0]
	movs r0, #0xc0
	adds r4, #0x26
	bics r1, r0
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r4]
_021F5044:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F5000

	thumb_func_start ov101_021F5048
ov101_021F5048: @ 0x021F5048
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x26
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	beq _021F508E
	ldr r0, [r4, #0x60]
	bl ov101_021F5A50
	adds r0, r4, #0
	adds r0, #0x50
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x40
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x50
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x40
	bl FUN_0201D5C8
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r1, [r0]
	movs r0, #0xc0
	adds r4, #0x26
	bics r1, r0
	strb r1, [r4]
_021F508E:
	pop {r4, pc}
	thumb_func_end ov101_021F5048

	thumb_func_start ov101_021F5090
ov101_021F5090: @ 0x021F5090
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0x28
	movs r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	add r3, sp, #0
	bl ov101_021F54AC
	adds r1, r4, #0
	adds r1, #0x27
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r1, [r0]
	movs r0, #0x30
	bics r1, r0
	add r0, sp, #0
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1a
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x26
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x27
	ldrb r0, [r0]
	cmp r0, #8
	bhs _021F50D4
	adds r0, r4, #0
	bl ov101_021F5000
_021F50D4:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov101_021F5090

	thumb_func_start ov101_021F50D8
ov101_021F50D8: @ 0x021F50D8
	push {r3, lr}
	adds r0, r1, #0
	adds r0, #0x26
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	beq _021F50EC
	ldr r0, [r1, #0x60]
	bl ov101_021F5B94
_021F50EC:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov101_021F50D8

	thumb_func_start ov101_021F50F0
ov101_021F50F0: @ 0x021F50F0
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _021F51AC @ =0x04001040
	adds r5, r0, #0
	movs r0, #0xff
	strh r0, [r2]
	ldr r3, _021F51B0 @ =0x000070C0
	adds r4, r2, #0
	strh r3, [r2, #4]
	lsls r0, r0, #8
	strh r0, [r2, #2]
	strh r3, [r2, #6]
	adds r4, #0xa
	ldrh r6, [r4]
	movs r3, #0x3f
	movs r0, #0x11
	bics r6, r3
	orrs r0, r6
	strh r0, [r4]
	adds r0, r2, #0
	adds r0, #8
	ldrh r4, [r0]
	subs r2, #0x40
	bics r4, r3
	movs r3, #0x1f
	orrs r4, r3
	strh r4, [r0]
	ldrh r6, [r0]
	ldr r4, _021F51B4 @ =0xFFFFC0FF
	lsls r3, r3, #8
	ands r4, r6
	orrs r3, r4
	strh r3, [r0]
	ldr r3, [r2]
	ldr r0, _021F51B8 @ =0xFFFF1FFF
	ands r3, r0
	movs r0, #6
	lsls r0, r0, #0xc
	orrs r0, r3
	str r0, [r2]
	cmp r1, #0
	bne _021F5170
	movs r6, #3
	adds r7, r6, #0
	movs r4, #0
	subs r7, #0x53
_021F514A:
	ldr r0, [r5, #0xc]
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0201BC8C
	adds r0, r4, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl FUN_0201BC28
	adds r4, r4, #1
	cmp r4, #3
	blt _021F514A
	b _021F519A
_021F5170:
	ldr r0, [r5, #0xc]
	movs r1, #5
	ldr r0, [r0, #0x74]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #0xc]
	movs r1, #6
	ldr r0, [r0, #0x74]
	movs r2, #5
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #0xc]
	movs r1, #7
	ldr r0, [r0, #0x74]
	movs r2, #5
	movs r3, #0
	bl FUN_0201BC8C
_021F519A:
	ldrh r1, [r5, #0x2e]
	ldr r0, _021F51BC @ =0xFFFF8000
	ands r1, r0
	strh r1, [r5, #0x2e]
	ldrh r1, [r5, #0x2e]
	subs r0, r0, #1
	ands r0, r1
	strh r0, [r5, #0x2e]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F51AC: .4byte 0x04001040
_021F51B0: .4byte 0x000070C0
_021F51B4: .4byte 0xFFFFC0FF
_021F51B8: .4byte 0xFFFF1FFF
_021F51BC: .4byte 0xFFFF8000
	thumb_func_end ov101_021F50F0

	thumb_func_start ov101_021F51C0
ov101_021F51C0: @ 0x021F51C0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2e]
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1f
	beq _021F51D2
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F51D2:
	cmp r4, #0
	ldr r0, [r5, #0xc]
	bne _021F5202
	ldr r0, [r0, #0x74]
	movs r1, #5
	movs r2, #4
	movs r3, #0xa
	bl FUN_0201BC8C
	ldr r0, [r5, #0xc]
	movs r1, #6
	ldr r0, [r0, #0x74]
	movs r2, #4
	movs r3, #0xa
	bl FUN_0201BC8C
	ldr r0, [r5, #0xc]
	movs r1, #7
	ldr r0, [r0, #0x74]
	movs r2, #4
	movs r3, #0xa
	bl FUN_0201BC8C
	b _021F522A
_021F5202:
	movs r1, #5
	ldr r0, [r0, #0x74]
	adds r2, r1, #0
	movs r3, #0xa
	bl FUN_0201BC8C
	ldr r0, [r5, #0xc]
	movs r1, #6
	ldr r0, [r0, #0x74]
	movs r2, #5
	movs r3, #0xa
	bl FUN_0201BC8C
	ldr r0, [r5, #0xc]
	movs r1, #7
	ldr r0, [r0, #0x74]
	movs r2, #5
	movs r3, #0xa
	bl FUN_0201BC8C
_021F522A:
	ldrh r3, [r5, #0x2e]
	adds r1, r5, #0
	ldr r2, _021F52F4 @ =0xFFFF8000
	adds r0, r3, #0
	lsls r3, r3, #0x11
	lsrs r3, r3, #0x11
	adds r3, r3, #1
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	lsrs r3, r2, #0x11
	ands r0, r2
	ands r3, r6
	orrs r0, r3
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x2e]
	adds r1, #0x2e
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x11
	cmp r0, #8
	bhs _021F5256
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F5256:
	ldrh r0, [r1]
	ands r0, r2
	strh r0, [r1]
	ldrh r2, [r1]
	movs r0, #2
	lsls r0, r0, #0xe
	orrs r0, r2
	strh r0, [r1]
	cmp r4, #1
	bne _021F52B0
	movs r4, #0
	adds r6, r4, #0
	movs r7, #3
_021F5270:
	adds r0, r4, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl FUN_0201BC28
	ldr r0, [r5, #0xc]
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	ldr r0, [r5, #0xc]
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	adds r2, r7, #0
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #0xc]
	adds r1, r4, #5
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	adds r4, r4, #1
	cmp r4, #3
	blt _021F5270
_021F52B0:
	ldr r0, _021F52F8 @ =0x04001000
	ldr r1, _021F52FC @ =0xFFFF1FFF
	ldr r2, [r0]
	adds r4, r0, #0
	ands r1, r2
	str r1, [r0]
	adds r1, r0, #0
	movs r2, #0
	adds r1, #0x40
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0x44
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0x42
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0x46
	strh r2, [r1]
	adds r4, #0x48
	ldrh r1, [r4]
	movs r2, #0x3f
	adds r0, #0x4a
	bics r1, r2
	strh r1, [r4]
	ldrh r3, [r4]
	ldr r1, _021F5300 @ =0xFFFFC0FF
	ands r1, r3
	strh r1, [r4]
	ldrh r1, [r0]
	bics r1, r2
	strh r1, [r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F52F4: .4byte 0xFFFF8000
_021F52F8: .4byte 0x04001000
_021F52FC: .4byte 0xFFFF1FFF
_021F5300: .4byte 0xFFFFC0FF
	thumb_func_end ov101_021F51C0

	thumb_func_start ov101_021F5304
ov101_021F5304: @ 0x021F5304
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _021F545C @ =0x021D110C
	movs r4, #0
	ldr r2, [r1, #0x48]
	movs r3, #2
	adds r5, r0, #0
	adds r6, r4, #0
	tst r3, r2
	beq _021F5344
	ldr r0, [r5, #0xc]
	movs r2, #1
	strb r2, [r0, #6]
	ldr r0, [r5, #0xc]
	adds r1, r4, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E7128
	ldr r0, [r5, #0xc]
	bl FUN_021E5DC8
	adds r2, r0, #0
	ldr r0, [r5, #0xc]
	adds r1, r4, #0
	ldr r0, [r0, #0x7c]
	bl FUN_021E72F8
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	subs r0, r4, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F5344:
	movs r3, #1
	tst r2, r3
	beq _021F53A4
	adds r1, r5, #0
	adds r1, #0x24
	ldrb r1, [r1]
	movs r3, #0xe0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x1d
	adds r1, r5, #0
	adds r1, #0x24
	ldrb r1, [r1]
	bics r1, r3
	adds r3, r2, #1
	lsrs r6, r3, #0x1f
	lsls r4, r3, #0x1e
	subs r4, r4, r6
	movs r3, #0x1e
	rors r4, r3
	adds r3, r6, r4
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r3, r3, #0x1d
	lsrs r3, r3, #0x18
	orrs r3, r1
	adds r1, r5, #0
	adds r1, #0x24
	strb r3, [r1]
	adds r1, r5, #0
	adds r1, #0x24
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	bl ov101_021F4F34
	adds r0, r5, #0
	adds r5, #0x24
	ldrb r1, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1d
	bl ov101_021F5780
	ldr r0, _021F5460 @ =0x0000093F
	bl FUN_0200604C
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F53A4:
	ldr r0, [r1, #0x44]
	movs r1, #0x20
	adds r2, r0, #0
	tst r2, r1
	beq _021F53B2
	adds r4, r1, #0
	subs r4, #0x22
_021F53B2:
	movs r1, #0x10
	tst r1, r0
	beq _021F53BA
	movs r4, #2
_021F53BA:
	movs r1, #0x40
	adds r2, r0, #0
	tst r2, r1
	beq _021F53C6
	adds r6, r1, #0
	subs r6, #0x42
_021F53C6:
	movs r1, #0x80
	tst r0, r1
	beq _021F53CE
	movs r6, #2
_021F53CE:
	cmp r4, #0
	bne _021F53DC
	cmp r6, #0
	bne _021F53DC
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F53DC:
	movs r0, #0x28
	ldrsh r7, [r5, r0]
	movs r0, #0x2a
	ldrsh r0, [r5, r0]
	adds r1, r7, r4
	str r0, [sp]
	ldr r0, _021F5464 @ =0x021F8968
	ldr r2, [sp]
	bl FUN_020253F0
	cmp r0, #0
	beq _021F53FC
	movs r0, #0x28
	ldrsh r0, [r5, r0]
	adds r0, r0, r4
	strh r0, [r5, #0x28]
_021F53FC:
	movs r2, #0x2a
	movs r1, #0x28
	ldrsh r2, [r5, r2]
	ldrsh r1, [r5, r1]
	ldr r0, _021F5464 @ =0x021F8968
	adds r2, r2, r6
	bl FUN_020253F0
	cmp r0, #0
	beq _021F5418
	movs r0, #0x2a
	ldrsh r0, [r5, r0]
	adds r0, r0, r6
	strh r0, [r5, #0x2a]
_021F5418:
	movs r0, #0x28
	ldrsh r1, [r5, r0]
	cmp r1, r7
	bne _021F542A
	movs r0, #0x2a
	ldrsh r2, [r5, r0]
	ldr r0, [sp]
	cmp r2, r0
	beq _021F5434
_021F542A:
	movs r2, #0x2a
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #0x20]
	bl FUN_0200DD88
_021F5434:
	adds r2, r5, #0
	adds r2, #0x24
	ldrb r2, [r2]
	adds r0, r5, #0
	movs r1, #4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1d
	bl ov101_021F4F34
	movs r1, #0x28
	movs r2, #0x2a
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	adds r0, r5, #0
	bl ov101_021F56B4
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F545C: .4byte 0x021D110C
_021F5460: .4byte 0x0000093F
_021F5464: .4byte 0x021F8968
	thumb_func_end ov101_021F5304

	thumb_func_start ov101_021F5468
ov101_021F5468: @ 0x021F5468
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r2, #0
	str r2, [r4]
	adds r2, r5, #0
	adds r2, #0x24
	ldrb r2, [r2]
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x1c
	beq _021F5488
	movs r1, #1
	str r1, [r4]
	bl ov101_021F5650
	pop {r4, r5, r6, pc}
_021F5488:
	bl ov101_021F5524
	adds r6, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021F54A8
	ldr r0, [r5, #0xc]
	movs r1, #1
	str r1, [r0, #0xc]
	ldr r0, [r5, #0xc]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _021F54A8
	adds r0, r5, #0
	bl ov101_021F4FDC
_021F54A8:
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F5468

	thumb_func_start ov101_021F54AC
ov101_021F54AC: @ 0x021F54AC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x26
	ldrb r0, [r0]
	adds r4, r3, #0
	lsls r0, r0, #0x1c
	lsrs r3, r0, #0x1a
	ldr r0, _021F5520 @ =0x021FB2D0
	ldr r0, [r0, r3]
	bl FUN_0202539C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021F54D6
	movs r2, #0xff
	cmp r4, #0
	beq _021F551A
	movs r0, #0
	strb r0, [r4]
	b _021F551A
_021F54D6:
	adds r5, #0x26
	ldrb r1, [r5]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	cmp r1, #6
	bhi _021F550A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F54EE: @ jump table
	.2byte _021F54FC - _021F54EE - 2 @ case 0
	.2byte _021F54FC - _021F54EE - 2 @ case 1
	.2byte _021F54FC - _021F54EE - 2 @ case 2
	.2byte _021F54FC - _021F54EE - 2 @ case 3
	.2byte _021F550A - _021F54EE - 2 @ case 4
	.2byte _021F5502 - _021F54EE - 2 @ case 5
	.2byte _021F5506 - _021F54EE - 2 @ case 6
_021F54FC:
	lsls r1, r0, #0x17
	lsrs r2, r1, #0x18
	b _021F550C
_021F5502:
	movs r2, #6
	b _021F550C
_021F5506:
	movs r2, #7
	b _021F550C
_021F550A:
	movs r2, #5
_021F550C:
	cmp r4, #0
	beq _021F551A
	movs r1, #1
	ands r1, r0
	movs r0, #2
	subs r0, r0, r1
	strb r0, [r4]
_021F551A:
	adds r0, r2, #0
	pop {r3, r4, r5, pc}
	nop
_021F5520: .4byte 0x021FB2D0
	thumb_func_end ov101_021F54AC

	thumb_func_start ov101_021F5524
ov101_021F5524: @ 0x021F5524
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02025358
	cmp r0, #0
	bne _021F553C
	movs r0, #0
	add sp, #4
	mvns r0, r0
	pop {r3, r4, r5, r6, pc}
_021F553C:
	ldr r0, [r5, #0xc]
	bl FUN_021E5924
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021F5552
	movs r1, #1
	add sp, #4
	str r1, [r4]
	pop {r3, r4, r5, r6, pc}
_021F5552:
	ldr r0, _021F5640 @ =0x021F8984
	bl FUN_02025224
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _021F55A8
	adds r2, r5, #0
	adds r2, #0x24
	ldrb r2, [r2]
	lsls r1, r6, #0x18
	adds r0, r5, #0
	lsls r2, r2, #0x18
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x1d
	bl ov101_021F4F34
	lsls r1, r6, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov101_021F5780
	ldr r0, _021F5644 @ =0x0000093F
	bl FUN_0200604C
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	movs r1, #0xe0
	adds r5, #0x24
	bics r0, r1
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x18
	orrs r0, r1
	strb r0, [r5]
	movs r0, #1
	str r0, [r4]
	add sp, #4
	subs r0, r0, #2
	pop {r3, r4, r5, r6, pc}
_021F55A8:
	ldr r2, _021F5648 @ =0x021D114C
	ldr r0, _021F564C @ =0x021F8968
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl FUN_020253F0
	cmp r0, #0
	bne _021F55C0
	movs r0, #0
	add sp, #4
	mvns r0, r0
	pop {r3, r4, r5, r6, pc}
_021F55C0:
	movs r0, #0xfe
	add r1, sp, #0
	strb r0, [r1]
	movs r0, #8
	strb r0, [r1, #3]
	movs r0, #0x28
	ldrsh r0, [r5, r0]
	ldr r2, _021F5648 @ =0x021D114C
	strb r0, [r1, #1]
	movs r0, #0x2a
	ldrsh r0, [r5, r0]
	strb r0, [r1, #2]
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	add r0, sp, #0
	bl FUN_020253F0
	cmp r0, #0
	beq _021F5636
	ldr r0, _021F5648 @ =0x021D114C
	movs r2, #0x2a
	ldrh r1, [r0, #0x20]
	strh r1, [r5, #0x28]
	ldrh r0, [r0, #0x22]
	movs r1, #0x28
	strh r0, [r5, #0x2a]
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #0x20]
	bl FUN_0200DD88
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r1, [r0]
	movs r0, #0x1e
	adds r2, r5, #0
	bics r1, r0
	movs r0, #2
	orrs r1, r0
	adds r0, r5, #0
	adds r0, #0x24
	strb r1, [r0]
	movs r0, #1
	str r0, [r4]
	adds r2, #0x24
	ldrb r2, [r2]
	adds r0, r5, #0
	movs r1, #4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1d
	bl ov101_021F4F34
	movs r1, #0x28
	movs r2, #0x2a
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	adds r0, r5, #0
	bl ov101_021F56B4
_021F5636:
	movs r0, #0
	mvns r0, r0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021F5640: .4byte 0x021F8984
_021F5644: .4byte 0x0000093F
_021F5648: .4byte 0x021D114C
_021F564C: .4byte 0x021F8968
	thumb_func_end ov101_021F5524

	thumb_func_start ov101_021F5650
ov101_021F5650: @ 0x021F5650
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0202534C
	cmp r0, #0
	bne _021F5670
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r1, [r0]
	movs r0, #0x1e
	adds r4, #0x24
	bics r1, r0
	movs r0, #0
	strb r1, [r4]
	mvns r0, r0
	pop {r4, pc}
_021F5670:
	ldr r2, _021F56AC @ =0x021D114C
	ldr r0, _021F56B0 @ =0x021F8968
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl FUN_020253F0
	cmp r0, #0
	beq _021F56A6
	ldr r0, _021F56AC @ =0x021D114C
	movs r2, #0x2a
	ldrh r1, [r0, #0x20]
	strh r1, [r4, #0x28]
	ldrh r0, [r0, #0x22]
	movs r1, #0x28
	strh r0, [r4, #0x2a]
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x20]
	bl FUN_0200DD88
	movs r1, #0x28
	movs r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	adds r0, r4, #0
	bl ov101_021F56B4
_021F56A6:
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	.align 2, 0
_021F56AC: .4byte 0x021D114C
_021F56B0: .4byte 0x021F8968
	thumb_func_end ov101_021F5650

	thumb_func_start ov101_021F56B4
ov101_021F56B4: @ 0x021F56B4
	push {r3, r4, r5, lr}
	movs r4, #0
	add r3, sp, #0
	strb r4, [r3]
	add r3, sp, #0
	adds r5, r0, #0
	bl ov101_021F54AC
	adds r4, r0, #0
	cmp r4, #0xff
	bne _021F5700
	adds r0, r5, #0
	adds r0, #0x26
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	beq _021F56E6
	adds r0, r5, #0
	bl ov101_021F5048
	bl FUN_02004A90
	movs r1, #0
	bl FUN_02005EB4
_021F56E6:
	adds r0, r5, #0
	adds r0, #0x26
	ldrb r1, [r0]
	movs r0, #0x30
	bics r1, r0
	adds r0, r5, #0
	adds r0, #0x26
	strb r1, [r0]
	movs r0, #0xff
	adds r5, #0x27
	strb r0, [r5]
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F5700:
	adds r0, r5, #0
	adds r0, #0x27
	ldrb r0, [r0]
	cmp r4, r0
	bne _021F574C
	add r0, sp, #0
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x26
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _021F5748
	cmp r1, #2
	ldr r0, [r5, #0x60]
	bne _021F572A
	movs r1, #0
	bl ov101_021F5A9C
	b _021F5730
_021F572A:
	movs r1, #1
	bl ov101_021F5A9C
_021F5730:
	adds r0, r5, #0
	adds r0, #0x26
	ldrb r1, [r0]
	movs r0, #0x30
	adds r5, #0x26
	bics r1, r0
	add r0, sp, #0
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1a
	orrs r0, r1
	strb r0, [r5]
_021F5748:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F574C:
	cmp r0, #0xff
	beq _021F5756
	adds r0, r5, #0
	bl ov101_021F5048
_021F5756:
	adds r0, r5, #0
	adds r0, #0x27
	strb r4, [r0]
	adds r0, r5, #0
	adds r0, #0x26
	ldrb r1, [r0]
	movs r0, #0x30
	bics r1, r0
	add r0, sp, #0
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1a
	orrs r1, r0
	adds r0, r5, #0
	adds r0, #0x26
	strb r1, [r0]
	adds r0, r5, #0
	bl ov101_021F5000
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F56B4

	thumb_func_start ov101_021F5780
ov101_021F5780: @ 0x021F5780
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021F57B0 @ =0x021F89B5
	lsls r1, r1, #3
	ldrb r0, [r0, r1]
	movs r2, #0x2a
	strh r0, [r4, #0x28]
	ldr r0, _021F57B4 @ =0x021F89B6
	ldrb r0, [r0, r1]
	movs r1, #0x28
	strh r0, [r4, #0x2a]
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x20]
	bl FUN_0200DD88
	movs r1, #0x28
	movs r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	adds r0, r4, #0
	bl ov101_021F56B4
	pop {r4, pc}
	.align 2, 0
_021F57B0: .4byte 0x021F89B5
_021F57B4: .4byte 0x021F89B6
	thumb_func_end ov101_021F5780

	thumb_func_start ov101_021F57B8
ov101_021F57B8: @ 0x021F57B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp]
	bl FUN_0203B9C4
	adds r4, r0, #0
	bl FUN_0203B9B4
	str r0, [sp, #4]
	adds r0, r4, #0
	bl FUN_0203B980
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	movs r1, #0x74
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x74
	blx FUN_020D4994
	str r5, [r4, #4]
	strh r6, [r4, #8]
	adds r0, r4, #0
	strh r7, [r4, #0xa]
	adds r0, #0x66
	ldrb r0, [r0]
	movs r1, #4
	ldr r3, [sp, #0x30]
	bics r0, r1
	ldr r1, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1d
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x66
	strb r1, [r0]
	ldr r0, [sp, #0x20]
	str r0, [r4, #0xc]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x28]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x2c]
	str r0, [r4, #0x18]
	lsrs r1, r0, #0x10
	adds r0, r4, #0
	adds r0, #0x5b
	strb r1, [r0]
	ldr r0, [r4, #0x18]
	lsrs r1, r0, #8
	adds r0, r4, #0
	adds r0, #0x5d
	strb r1, [r0]
	adds r0, r4, #0
	ldr r1, [r4, #0x18]
	adds r0, #0x5c
	strb r1, [r0]
	movs r1, #0x1b
	adds r2, r1, #0
	str r3, [r4]
	movs r0, #0
	adds r2, #0xf2
	bl FUN_0200BAF8
	str r0, [r4, #0x20]
	ldr r2, [r4]
	movs r0, #8
	movs r1, #0x33
	bl FUN_0200BD18
	str r0, [r4, #0x44]
	ldr r1, [r4]
	movs r0, #0x33
	bl FUN_02026354
	str r0, [r4, #0x48]
	ldr r1, [r4]
	movs r0, #0x33
	bl FUN_02026354
	str r0, [r4, #0x4c]
	ldr r1, [r4]
	movs r0, #0x33
	bl FUN_02026354
	str r0, [r4, #0x50]
	ldr r0, _021F589C @ =0x00000547
	ldr r1, [r4]
	bl FUN_02026354
	str r0, [r4, #0x6c]
	ldr r0, _021F589C @ =0x00000547
	ldr r1, [r4]
	bl FUN_02026354
	str r0, [r4, #0x70]
	ldr r0, [sp, #4]
	bl FUN_0205C7EC
	cmp r0, #1
	beq _021F5896
	ldr r0, [sp, #8]
	movs r1, #0
	strh r1, [r0]
_021F5896:
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021F589C: .4byte 0x00000547
	thumb_func_end ov101_021F57B8

	thumb_func_start ov101_021F58A0
ov101_021F58A0: @ 0x021F58A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x70]
	bl FUN_02026380
	ldr r0, [r4, #0x6c]
	bl FUN_02026380
	ldr r0, [r4, #0x50]
	bl FUN_02026380
	ldr r0, [r4, #0x4c]
	bl FUN_02026380
	ldr r0, [r4, #0x48]
	bl FUN_02026380
	ldr r0, [r4, #0x44]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x20]
	bl FUN_0200BB44
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x74
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov101_021F58A0

	thumb_func_start ov101_021F58E0
ov101_021F58E0: @ 0x021F58E0
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #8
	blt _021F58EC
	movs r5, #0
_021F58EC:
	adds r0, r4, #0
	adds r0, #0x66
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	beq _021F590A
	adds r0, r4, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r0, #0x10
	adds r4, #0x66
	bics r1, r0
	strb r1, [r4]
	movs r0, #0xb
	pop {r3, r4, r5, pc}
_021F590A:
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x28
	adds r1, #0x38
	bl FUN_02014708
	cmp r5, #7
	bhi _021F596C
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F5926: @ jump table
	.2byte _021F5936 - _021F5926 - 2 @ case 0
	.2byte _021F593A - _021F5926 - 2 @ case 1
	.2byte _021F593E - _021F5926 - 2 @ case 2
	.2byte _021F594C - _021F5926 - 2 @ case 3
	.2byte _021F595C - _021F5926 - 2 @ case 4
	.2byte _021F5960 - _021F5926 - 2 @ case 5
	.2byte _021F5964 - _021F5926 - 2 @ case 6
	.2byte _021F5968 - _021F5926 - 2 @ case 7
_021F5936:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F593A:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F593E:
	ldr r1, [r4, #0x38]
	movs r0, #1
	ands r0, r1
	adds r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F594C:
	ldr r0, [r4, #0x38]
	movs r1, #3
	blx FUN_020F2BA4
	adds r0, r1, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F595C:
	movs r0, #7
	pop {r3, r4, r5, pc}
_021F5960:
	movs r0, #8
	pop {r3, r4, r5, pc}
_021F5964:
	movs r0, #9
	pop {r3, r4, r5, pc}
_021F5968:
	movs r0, #0xa
	pop {r3, r4, r5, pc}
_021F596C:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F58E0

	thumb_func_start ov101_021F5970
ov101_021F5970: @ 0x021F5970
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x66
	adds r4, r2, #0
	ldrb r2, [r0]
	movs r0, #1
	bics r2, r0
	adds r0, r5, #0
	adds r0, #0x66
	strb r2, [r0]
	cmp r1, #8
	blt _021F598A
	movs r1, #0
_021F598A:
	adds r0, r5, #0
	adds r0, #0x58
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x59
	ldrb r2, [r0]
	cmp r2, #0xb
	beq _021F59A0
	adds r0, r5, #0
	adds r0, #0x5a
	strb r2, [r0]
_021F59A0:
	adds r0, r5, #0
	bl ov101_021F58E0
	adds r1, r5, #0
	adds r1, #0x59
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x5e
	strb r1, [r0]
	adds r0, r5, #0
	movs r2, #0x2d
	adds r0, #0x68
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x67
	strb r1, [r0]
	adds r0, r5, #0
	movs r2, #8
	adds r0, #0x6a
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x69
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x66
	ldrb r0, [r0]
	movs r2, #2
	bics r0, r2
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x1f
	lsrs r2, r2, #0x1e
	orrs r2, r0
	adds r0, r5, #0
	adds r0, #0x66
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x66
	ldrb r2, [r0]
	movs r0, #8
	bics r2, r0
	adds r0, r5, #0
	adds r0, #0x66
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x5f
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x59
	ldrb r2, [r0]
	cmp r2, #0xb
	beq _021F5A16
	adds r0, r5, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, r2
	beq _021F5A16
	str r1, [r5, #0x54]
_021F5A16:
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r2, [r0]
	ldr r0, [r5, #0xc]
	lsls r1, r2, #4
	orrs r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201D978
	ldr r0, [r5, #0xc]
	bl FUN_0201D578
	adds r1, r5, #0
	adds r1, #0x59
	ldrb r2, [r1]
	movs r1, #0xc
	adds r0, r5, #0
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _021F5A4C @ =0x021F8A04
	ldr r1, [r1, r3]
	blx r1
	adds r0, r5, #0
	bl ov101_021F5C44
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F5A4C: .4byte 0x021F8A04
	thumb_func_end ov101_021F5970

	thumb_func_start ov101_021F5A50
ov101_021F5A50: @ 0x021F5A50
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	beq _021F5A6C
	adds r1, r4, #0
	adds r1, #0x59
	ldrb r2, [r1]
	movs r1, #0xc
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _021F5A98 @ =0x021F8A0C
	ldr r1, [r1, r3]
	blx r1
_021F5A6C:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrb r2, [r0]
	ldr r0, [r4, #0xc]
	lsls r1, r2, #4
	orrs r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201D978
	ldr r0, [r4, #0xc]
	bl FUN_0201D578
	adds r0, r4, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r0, #0x10
	adds r4, #0x66
	bics r1, r0
	strb r1, [r4]
	pop {r4, pc}
	nop
_021F5A98: .4byte 0x021F8A0C
	thumb_func_end ov101_021F5A50

	thumb_func_start ov101_021F5A9C
ov101_021F5A9C: @ 0x021F5A9C
	adds r2, r0, #0
	adds r2, #0x66
	ldrb r3, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #2
	lsls r1, r1, #0x1f
	bics r3, r2
	lsrs r1, r1, #0x1e
	orrs r1, r3
	adds r0, #0x66
	strb r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov101_021F5A9C

	thumb_func_start ov101_021F5AB8
ov101_021F5AB8: @ 0x021F5AB8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x67
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x68
	ldrb r0, [r0]
	cmp r1, r0
	bhs _021F5ADA
	adds r0, r4, #0
	adds r0, #0x67
	ldrb r0, [r0]
	adds r4, #0x67
	adds r0, r0, #1
	strb r0, [r4]
	movs r0, #0
	pop {r4, pc}
_021F5ADA:
	adds r0, r4, #0
	adds r0, #0x69
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F5AF6
	movs r1, #0
	ldr r0, [r4, #0xc]
	movs r2, #2
	adds r3, r1, #0
	bl FUN_0201EC48
	ldr r0, [r4, #0xc]
	bl FUN_0201D578
_021F5AF6:
	adds r0, r4, #0
	adds r0, #0x69
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x69
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x69
	strb r1, [r0]
	cmp r2, #8
	bhs _021F5B12
	movs r0, #0
	pop {r4, pc}
_021F5B12:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x69
	strb r1, [r0]
	adds r4, #0x67
	strb r1, [r4]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F5AB8

	thumb_func_start ov101_021F5B24
ov101_021F5B24: @ 0x021F5B24
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	ldr r0, [r4, #0xc]
	movs r2, #2
	adds r3, r1, #0
	bl FUN_0201EC48
	ldr r0, [r4, #0xc]
	bl FUN_0201D578
	adds r0, r4, #0
	adds r0, #0x69
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x69
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x69
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x6a
	ldrb r0, [r0]
	cmp r2, r0
	bhs _021F5B5C
	movs r0, #0
	pop {r4, pc}
_021F5B5C:
	movs r0, #0
	adds r4, #0x69
	strb r0, [r4]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F5B24

	thumb_func_start ov101_021F5B68
ov101_021F5B68: @ 0x021F5B68
	adds r1, r0, #0
	adds r1, #0x67
	ldrb r3, [r1]
	adds r1, r0, #0
	adds r1, #0x67
	ldrb r1, [r1]
	adds r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x67
	strb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x68
	ldrb r1, [r1]
	cmp r3, r1
	bhs _021F5B8A
	movs r0, #0
	bx lr
_021F5B8A:
	movs r1, #0
	adds r0, #0x67
	strb r1, [r0]
	movs r0, #1
	bx lr
	thumb_func_end ov101_021F5B68

	thumb_func_start ov101_021F5B94
ov101_021F5B94: @ 0x021F5B94
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldrb r1, [r1]
	cmp r1, #3
	bhi _021F5C38
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F5BAE: @ jump table
	.2byte _021F5BB6 - _021F5BAE - 2 @ case 0
	.2byte _021F5BCE - _021F5BAE - 2 @ case 1
	.2byte _021F5BFE - _021F5BAE - 2 @ case 2
	.2byte _021F5C14 - _021F5BAE - 2 @ case 3
_021F5BB6:
	adds r1, r4, #0
	adds r1, #0x59
	ldrb r2, [r1]
	movs r1, #0xc
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _021F5C3C @ =0x021F8A08
	ldr r1, [r1, r3]
	blx r1
	adds r4, #0x5e
	strb r0, [r4]
	pop {r4, pc}
_021F5BCE:
	adds r1, r4, #0
	adds r1, #0x59
	ldrb r2, [r1]
	movs r1, #0xc
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _021F5C40 @ =0x021F8A0C
	ldr r1, [r1, r3]
	blx r1
	adds r0, r4, #0
	movs r1, #0x10
	adds r0, #0x6a
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0xf
	adds r0, #0x68
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	adds r4, #0x5e
	adds r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_021F5BFE:
	bl ov101_021F5B24
	cmp r0, #0
	beq _021F5C38
	adds r0, r4, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	adds r4, #0x5e
	adds r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_021F5C14:
	bl ov101_021F5B68
	cmp r0, #0
	beq _021F5C38
	adds r2, r4, #0
	adds r2, #0x66
	adds r1, r4, #0
	ldrb r2, [r2]
	adds r1, #0x58
	ldrb r1, [r1]
	lsls r2, r2, #0x1e
	adds r0, r4, #0
	lsrs r2, r2, #0x1f
	bl ov101_021F5970
	movs r0, #0
	adds r4, #0x5e
	strb r0, [r4]
_021F5C38:
	pop {r4, pc}
	nop
_021F5C3C: .4byte 0x021F8A08
_021F5C40: .4byte 0x021F8A0C
	thumb_func_end ov101_021F5B94

	thumb_func_start ov101_021F5C44
ov101_021F5C44: @ 0x021F5C44
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021F5C9C @ =0x00010200
	adds r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x4c]
	bl FUN_020200FC
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021F5C9C @ =0x00010200
	adds r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x50]
	bl FUN_020200FC
	ldr r0, [r4, #0x10]
	bl FUN_0201D5C8
	ldr r0, [r4, #0x14]
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	nop
_021F5C9C: .4byte 0x00010200
	thumb_func_end ov101_021F5C44

	thumb_func_start ov101_021F5CA0
ov101_021F5CA0: @ 0x021F5CA0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x66
	ldrb r0, [r0]
	adds r4, r1, #0
	adds r6, r2, #0
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _021F5CBE
	adds r0, r4, #0
	movs r1, #0x46
	bl FUN_020268EC
_021F5CBE:
	lsls r0, r6, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r5, #0x18]
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0xc]
	adds r2, r4, #0
	adds r3, r1, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F5CA0

	thumb_func_start ov101_021F5CDC
ov101_021F5CDC: @ 0x021F5CDC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x66
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _021F5CFE
	adds r0, r4, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r0, #1
	bics r1, r0
	movs r0, #1
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x66
	strb r1, [r0]
_021F5CFE:
	adds r0, r4, #0
	adds r0, #0x62
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x62
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x62
	strb r1, [r0]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x6c]
	bl FUN_02026860
	ldr r1, [r4, #0x48]
	adds r0, r4, #0
	movs r2, #1
	bl ov101_021F5CA0
	ldr r0, [r4, #0xc]
	bl FUN_0201D578
	adds r0, r4, #0
	adds r0, #0x62
	adds r4, #0x63
	ldrb r1, [r0]
	ldrb r0, [r4]
	cmp r1, r0
	blo _021F5D3C
	movs r0, #1
	pop {r4, pc}
_021F5D3C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov101_021F5CDC

	thumb_func_start ov101_021F5D40
ov101_021F5D40: @ 0x021F5D40
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x65
	strb r2, [r0]
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x70]
	bl FUN_0200BB6C
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x70]
	bl FUN_0200CBBC
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x62
	strb r1, [r0]
	ldr r0, [r4, #0x6c]
	bl FUN_02026820
	adds r1, r4, #0
	adds r1, #0x63
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x64
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x62
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x62
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x62
	strb r1, [r0]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x6c]
	bl FUN_02026860
	adds r2, r4, #0
	adds r2, #0x66
	ldrb r2, [r2]
	ldr r1, [r4, #0x48]
	adds r0, r4, #0
	lsls r2, r2, #0x1f
	lsrs r2, r2, #0x1f
	bl ov101_021F5CA0
	ldr r0, [r4, #0xc]
	bl FUN_0201D578
	adds r0, r4, #0
	adds r0, #0x62
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x63
	ldrb r0, [r0]
	cmp r1, r0
	blo _021F5DC2
	movs r0, #5
	adds r4, #0x64
	strb r0, [r4]
	pop {r4, pc}
_021F5DC2:
	adds r0, r4, #0
	adds r0, #0x66
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _021F5DD6
	movs r0, #1
	adds r4, #0x64
	strb r0, [r4]
	pop {r4, pc}
_021F5DD6:
	movs r0, #3
	adds r4, #0x64
	strb r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F5D40

	thumb_func_start ov101_021F5DE0
ov101_021F5DE0: @ 0x021F5DE0
	ldr r3, _021F5DE8 @ =ov101_021F5D40
	movs r2, #0
	bx r3
	nop
_021F5DE8: .4byte ov101_021F5D40
	thumb_func_end ov101_021F5DE0

	thumb_func_start ov101_021F5DEC
ov101_021F5DEC: @ 0x021F5DEC
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F5DE0
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x65
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r0, #8
	adds r4, #0x66
	orrs r0, r1
	strb r0, [r4]
	movs r0, #0
	bl FUN_02004A08
	ldr r0, _021F5E18 @ =0x0000044A
	bl FUN_020049D0
	pop {r4, pc}
	.align 2, 0
_021F5E18: .4byte 0x0000044A
	thumb_func_end ov101_021F5DEC

	thumb_func_start ov101_021F5E1C
ov101_021F5E1C: @ 0x021F5E1C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	ldrb r1, [r1]
	cmp r1, #6
	bhi _021F5EB0
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F5E36: @ jump table
	.2byte _021F5EB0 - _021F5E36 - 2 @ case 0
	.2byte _021F5E7E - _021F5E36 - 2 @ case 1
	.2byte _021F5E44 - _021F5E36 - 2 @ case 2
	.2byte _021F5E6E - _021F5E36 - 2 @ case 3
	.2byte _021F5E8E - _021F5E36 - 2 @ case 4
	.2byte _021F5E9E - _021F5E36 - 2 @ case 5
	.2byte _021F5EA6 - _021F5E36 - 2 @ case 6
_021F5E44:
	bl ov101_021F5CDC
	cmp r0, #0
	beq _021F5E66
	adds r0, r4, #0
	adds r0, #0x65
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F5E5E
	movs r0, #6
	adds r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E5E:
	movs r0, #4
	adds r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E66:
	movs r0, #3
	adds r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E6E:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F5EB0
	movs r0, #2
	adds r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E7E:
	bl ov101_021F5B68
	cmp r0, #0
	beq _021F5EB0
	movs r0, #2
	adds r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E8E:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F5EB0
	movs r0, #6
	adds r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E9E:
	bl ov101_021F5B68
	cmp r0, #0
	beq _021F5EB0
_021F5EA6:
	movs r0, #0
	adds r4, #0x64
	strb r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021F5EB0:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov101_021F5E1C

	thumb_func_start ov101_021F5EB4
ov101_021F5EB4: @ 0x021F5EB4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5f
	ldrb r1, [r1]
	cmp r1, #0
	beq _021F5EC8
	cmp r1, #1
	beq _021F5EDE
	b _021F5EF0
_021F5EC8:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F5EF0
	adds r0, r4, #0
	adds r0, #0x5f
	ldrb r0, [r0]
	adds r4, #0x5f
	adds r0, r0, #1
	strb r0, [r4]
	b _021F5EF0
_021F5EDE:
	bl FUN_02004A38
	cmp r0, #0
	bne _021F5EF0
	movs r0, #0
	adds r4, #0x5f
	strb r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021F5EF0:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov101_021F5EB4

	thumb_func_start ov101_021F5EF4
ov101_021F5EF4: @ 0x021F5EF4
	push {r4, lr}
	ldr r4, [r0, #0x1c]
	cmp r1, #4
	bne _021F5F1A
	bl FUN_0201FD44
	ldr r1, _021F5F34 @ =0x000061A8
	blx FUN_020F2998
	adds r0, r1, #0
	movs r1, #0xfa
	lsls r1, r1, #2
	blx FUN_020F2998
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r2, r1, #1
	ldr r0, _021F5F38 @ =0x021F8A9C
	b _021F5F1E
_021F5F1A:
	ldr r0, _021F5F3C @ =0x021F8A94
	lsls r2, r1, #1
_021F5F1E:
	ldrb r3, [r4, #4]
	ldrh r0, [r0, r2]
	movs r2, #0xfe
	lsls r1, r1, #0x19
	bics r3, r2
	lsrs r1, r1, #0x18
	orrs r1, r3
	strb r1, [r4, #4]
	bl FUN_020049D0
	pop {r4, pc}
	.align 2, 0
_021F5F34: .4byte 0x000061A8
_021F5F38: .4byte 0x021F8A9C
_021F5F3C: .4byte 0x021F8A94
	thumb_func_end ov101_021F5EF4

	thumb_func_start ov101_021F5F40
ov101_021F5F40: @ 0x021F5F40
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0x38
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x38
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [r5, #4]
	bl FUN_0202A634
	bl FUN_0202A55C
	ldrb r1, [r4, #4]
	movs r2, #1
	lsls r0, r0, #0x18
	bics r1, r2
	lsrs r2, r0, #0x18
	movs r0, #1
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #4]
	adds r0, r4, #0
	adds r0, #0xc
	add r1, sp, #0
	bl FUN_02014708
	ldr r0, [r4, #0x18]
	strb r0, [r4, #6]
	ldrb r0, [r4, #6]
	adds r0, r0, #3
	strb r0, [r4, #5]
	ldrb r0, [r4, #6]
	cmp r0, #6
	bhi _021F6006
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F5F9A: @ jump table
	.2byte _021F5FA8 - _021F5F9A - 2 @ case 0
	.2byte _021F5FCC - _021F5F9A - 2 @ case 1
	.2byte _021F5FEA - _021F5F9A - 2 @ case 2
	.2byte _021F5FD2 - _021F5F9A - 2 @ case 3
	.2byte _021F5FF0 - _021F5F9A - 2 @ case 4
	.2byte _021F5FCC - _021F5F9A - 2 @ case 5
	.2byte _021F5FEA - _021F5F9A - 2 @ case 6
_021F5FA8:
	ldr r0, [r5, #4]
	bl FUN_0207879C
	ldr r1, _021F603C @ =0x000001F6
	ldr r3, [r4]
	movs r2, #1
	bl FUN_020784B0
	cmp r0, #0
	beq _021F5FC2
	movs r0, #4
	strb r0, [r4, #7]
	b _021F6006
_021F5FC2:
	movs r0, #0
	strb r0, [r4, #7]
	movs r0, #0xc
	strb r0, [r4, #5]
	b _021F6006
_021F5FCC:
	movs r0, #0
	strb r0, [r4, #7]
	b _021F6006
_021F5FD2:
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021F5FE4
	movs r0, #2
	strb r0, [r4, #7]
	movs r0, #0xa
	strb r0, [r4, #5]
	b _021F6006
_021F5FE4:
	movs r0, #0
	strb r0, [r4, #7]
	b _021F6006
_021F5FEA:
	movs r0, #1
	strb r0, [r4, #7]
	b _021F6006
_021F5FF0:
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021F6002
	movs r0, #3
	strb r0, [r4, #7]
	movs r0, #0xb
	strb r0, [r4, #5]
	b _021F6006
_021F6002:
	movs r0, #1
	strb r0, [r4, #7]
_021F6006:
	adds r0, r5, #0
	str r4, [r5, #0x1c]
	movs r1, #0
	adds r0, #0x61
	strb r1, [r0]
	adds r0, r5, #0
	bl ov101_021F6114
	bl FUN_02004A90
	movs r1, #0
	bl FUN_02005EB4
	ldrb r1, [r4, #7]
	adds r0, r5, #0
	bl ov101_021F5EF4
	adds r0, r5, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r0, #1
	adds r5, #0x66
	bics r1, r0
	strb r1, [r5]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_021F603C: .4byte 0x000001F6
	thumb_func_end ov101_021F5F40

	thumb_func_start ov101_021F6040
ov101_021F6040: @ 0x021F6040
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F613C
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #0x38
	blx FUN_020D4994
	ldr r0, [r4, #0x1c]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F6040

	thumb_func_start ov101_021F6060
ov101_021F6060: @ 0x021F6060
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrb r1, [r4, #8]
	cmp r1, #4
	bhi _021F610E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F607A: @ jump table
	.2byte _021F6084 - _021F607A - 2 @ case 0
	.2byte _021F6092 - _021F607A - 2 @ case 1
	.2byte _021F60A2 - _021F607A - 2 @ case 2
	.2byte _021F60BA - _021F607A - 2 @ case 3
	.2byte _021F6100 - _021F607A - 2 @ case 4
_021F6084:
	movs r1, #2
	bl ov101_021F5DE0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _021F610E
_021F6092:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F610E
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _021F610E
_021F60A2:
	adds r0, r4, #0
	adds r0, #0x1c
	bl FUN_02014780
	ldrb r1, [r4, #5]
	adds r0, r5, #0
	bl ov101_021F5DE0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _021F610E
_021F60BA:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F610E
	add r0, sp, #0
	bl FUN_02014780
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x24]
	cmp r1, r0
	bne _021F60E0
	ldr r0, [r4, #0x14]
	cmp r1, r0
	bne _021F60E0
	movs r0, #2
	strb r0, [r4, #8]
	add sp, #0x10
	movs r0, #0
	pop {r3, r4, r5, pc}
_021F60E0:
	adds r0, r5, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r0, #8
	adds r5, #0x66
	orrs r0, r1
	strb r0, [r5]
	bl FUN_02004A90
	movs r1, #0x1e
	bl FUN_02005EB4
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _021F610E
_021F6100:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F610E
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F610E:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F6060

	thumb_func_start ov101_021F6114
ov101_021F6114: @ 0x021F6114
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0x1a
	ldr r3, [r4]
	movs r0, #0
	movs r1, #0x1b
	lsls r2, r2, #4
	bl FUN_0200BAF8
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	movs r1, #0
	bl FUN_0200BB6C
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	movs r1, #1
	bl FUN_0200BB6C
	pop {r4, pc}
	thumb_func_end ov101_021F6114

	thumb_func_start ov101_021F613C
ov101_021F613C: @ 0x021F613C
	ldr r3, _021F6144 @ =FUN_0200BB44
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6144: .4byte FUN_0200BB44
	thumb_func_end ov101_021F613C

	thumb_func_start ov101_021F6148
ov101_021F6148: @ 0x021F6148
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #4
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #4
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	str r4, [r5, #0x1c]
	bl ov101_021F61A4
	bl FUN_02004A90
	movs r1, #1
	bl FUN_02005EB4
	ldr r0, _021F617C @ =0x0000044E
	bl FUN_020049D0
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F617C: .4byte 0x0000044E
	thumb_func_end ov101_021F6148

	thumb_func_start ov101_021F6180
ov101_021F6180: @ 0x021F6180
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F61CC
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #4
	blx FUN_020D4994
	ldr r0, [r4, #0x1c]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F6180

	thumb_func_start ov101_021F61A0
ov101_021F61A0: @ 0x021F61A0
	movs r0, #0
	bx lr
	thumb_func_end ov101_021F61A0

	thumb_func_start ov101_021F61A4
ov101_021F61A4: @ 0x021F61A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _021F61C8 @ =0x000001A1
	ldr r3, [r4]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	movs r1, #0
	bl FUN_0200BB6C
	ldr r0, [r4, #0x50]
	bl FUN_020263AC
	pop {r4, pc}
	nop
_021F61C8: .4byte 0x000001A1
	thumb_func_end ov101_021F61A4

	thumb_func_start ov101_021F61CC
ov101_021F61CC: @ 0x021F61CC
	ldr r3, _021F61D4 @ =FUN_0200BB44
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F61D4: .4byte FUN_0200BB44
	thumb_func_end ov101_021F61CC

	thumb_func_start ov101_021F61D8
ov101_021F61D8: @ 0x021F61D8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #4
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #4
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	str r4, [r5, #0x1c]
	bl ov101_021F6234
	bl FUN_02004A90
	movs r1, #1
	bl FUN_02005EB4
	ldr r0, _021F620C @ =0x0000044D
	bl FUN_020049D0
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F620C: .4byte 0x0000044D
	thumb_func_end ov101_021F61D8

	thumb_func_start ov101_021F6210
ov101_021F6210: @ 0x021F6210
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F625C
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #4
	blx FUN_020D4994
	ldr r0, [r4, #0x1c]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F6210

	thumb_func_start ov101_021F6230
ov101_021F6230: @ 0x021F6230
	movs r0, #0
	bx lr
	thumb_func_end ov101_021F6230

	thumb_func_start ov101_021F6234
ov101_021F6234: @ 0x021F6234
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _021F6258 @ =0x0000019A
	ldr r3, [r4]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	movs r1, #0
	bl FUN_0200BB6C
	ldr r0, [r4, #0x50]
	bl FUN_020263AC
	pop {r4, pc}
	nop
_021F6258: .4byte 0x0000019A
	thumb_func_end ov101_021F6234

	thumb_func_start ov101_021F625C
ov101_021F625C: @ 0x021F625C
	ldr r3, _021F6264 @ =FUN_0200BB44
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6264: .4byte FUN_0200BB44
	thumb_func_end ov101_021F625C

	thumb_func_start ov101_021F6268
ov101_021F6268: @ 0x021F6268
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #8
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #8
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	str r4, [r5, #0x1c]
	bl ov101_021F62F4
	bl FUN_02004A90
	movs r1, #1
	bl FUN_02005EB4
	movs r0, #0
	strb r0, [r4, #4]
	ldr r0, _021F62A0 @ =0x0000049E
	bl FUN_020049D0
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F62A0: .4byte 0x0000049E
	thumb_func_end ov101_021F6268

	thumb_func_start ov101_021F62A4
ov101_021F62A4: @ 0x021F62A4
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F6320
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #8
	blx FUN_020D4994
	ldr r0, [r4, #0x1c]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F62A4

	thumb_func_start ov101_021F62C4
ov101_021F62C4: @ 0x021F62C4
	push {r4, lr}
	ldr r4, [r0, #0x1c]
	ldrb r1, [r4, #4]
	cmp r1, #0
	beq _021F62D4
	cmp r1, #1
	beq _021F62E2
	b _021F62EE
_021F62D4:
	movs r1, #2
	bl ov101_021F5DE0
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _021F62EE
_021F62E2:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F62EE
	movs r0, #0
	strb r0, [r4, #4]
_021F62EE:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F62C4

	thumb_func_start ov101_021F62F4
ov101_021F62F4: @ 0x021F62F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _021F631C @ =0x000001A2
	ldr r3, [r4]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	movs r1, #0
	bl FUN_0200BB6C
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	movs r1, #1
	bl FUN_0200BB6C
	pop {r4, pc}
	nop
_021F631C: .4byte 0x000001A2
	thumb_func_end ov101_021F62F4

	thumb_func_start ov101_021F6320
ov101_021F6320: @ 0x021F6320
	ldr r3, _021F6328 @ =FUN_0200BB44
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6328: .4byte FUN_0200BB44
	thumb_func_end ov101_021F6320

	thumb_func_start ov101_021F632C
ov101_021F632C: @ 0x021F632C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #8
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #8
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	str r4, [r5, #0x1c]
	bl ov101_021F6420
	bl FUN_02004A90
	movs r1, #0
	bl FUN_02005EB4
	ldr r0, _021F6360 @ =0x00000495
	bl FUN_020049D0
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6360: .4byte 0x00000495
	thumb_func_end ov101_021F632C

	thumb_func_start ov101_021F6364
ov101_021F6364: @ 0x021F6364
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	bne _021F6372
	movs r0, #0
	pop {r4, pc}
_021F6372:
	bl ov101_021F6470
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #8
	blx FUN_020D4994
	ldr r0, [r4, #0x1c]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov101_021F6364

	thumb_func_start ov101_021F638C
ov101_021F638C: @ 0x021F638C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #4
	bhi _021F641C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F63A4: @ jump table
	.2byte _021F63AE - _021F63A4 - 2 @ case 0
	.2byte _021F63BC - _021F63A4 - 2 @ case 1
	.2byte _021F63DA - _021F63A4 - 2 @ case 2
	.2byte _021F63EA - _021F63A4 - 2 @ case 3
	.2byte _021F6402 - _021F63A4 - 2 @ case 4
_021F63AE:
	movs r1, #2
	bl ov101_021F5DE0
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F641C
_021F63BC:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F641C
	ldrh r1, [r4, #6]
	adds r0, r5, #0
	adds r1, r1, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ov101_021F5DE0
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F641C
_021F63DA:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F641C
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F641C
_021F63EA:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F641C
	adds r0, r5, #0
	movs r1, #3
	bl ov101_021F5DEC
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F641C
_021F6402:
	bl ov101_021F5EB4
	cmp r0, #0
	beq _021F641C
	adds r0, r5, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r0, #0x10
	adds r5, #0x66
	orrs r0, r1
	strb r0, [r5]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F641C:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F638C

	thumb_func_start ov101_021F6420
ov101_021F6420: @ 0x021F6420
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldr r2, _021F646C @ =0x0000019D
	ldr r3, [r5]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	movs r1, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x50]
	movs r1, #1
	bl FUN_0200BB6C
	bl FUN_0201FD44
	movs r1, #0x16
	blx FUN_020F2998
	strh r1, [r4, #6]
	ldrh r1, [r4, #6]
	ldr r0, [r5, #0x54]
	cmp r1, r0
	bne _021F6464
	adds r0, r1, #1
	movs r1, #0x16
	blx FUN_020F2998
	strh r1, [r4, #6]
_021F6464:
	ldrh r0, [r4, #6]
	str r0, [r5, #0x54]
	pop {r3, r4, r5, pc}
	nop
_021F646C: .4byte 0x0000019D
	thumb_func_end ov101_021F6420

	thumb_func_start ov101_021F6470
ov101_021F6470: @ 0x021F6470
	ldr r3, _021F6478 @ =FUN_0200BB44
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6478: .4byte FUN_0200BB44
	thumb_func_end ov101_021F6470

	thumb_func_start ov101_021F647C
ov101_021F647C: @ 0x021F647C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0x34
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x34
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r0, #0x10
	bics r1, r0
	adds r0, r5, #0
	adds r0, #0x66
	strb r1, [r0]
	adds r0, r5, #0
	str r4, [r5, #0x1c]
	bl ov101_021F6514
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov101_021F647C

	thumb_func_start ov101_021F64B0
ov101_021F64B0: @ 0x021F64B0
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F6614
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #0x34
	blx FUN_020D4994
	ldr r0, [r4, #0x1c]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F64B0

	thumb_func_start ov101_021F64D0
ov101_021F64D0: @ 0x021F64D0
	push {r4, lr}
	ldr r4, [r0, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #0
	beq _021F64E4
	cmp r1, #1
	beq _021F64F4
	cmp r1, #2
	beq _021F6504
	b _021F6510
_021F64E4:
	ldrh r1, [r4, #6]
	movs r2, #1
	bl ov101_021F5D40
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6510
_021F64F4:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F6510
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6510
_021F6504:
	bl ov101_021F5B68
	cmp r0, #0
	beq _021F6510
	movs r0, #1
	pop {r4, pc}
_021F6510:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov101_021F64D0

	thumb_func_start ov101_021F6514
ov101_021F6514: @ 0x021F6514
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r2, #0x67
	ldr r4, [r5, #0x1c]
	ldr r3, [r5]
	adds r0, r6, #0
	movs r1, #0x1b
	lsls r2, r2, #2
	bl FUN_0200BAF8
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	adds r1, r6, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x50]
	bl FUN_020263AC
	adds r0, r4, #0
	adds r0, #8
	adds r1, r6, #0
	movs r2, #8
	blx FUN_020D4994
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r6, #0
	movs r2, #0x24
	blx FUN_020D4994
	ldr r0, [r5, #4]
	bl FUN_020503D0
	movs r1, #1
	strb r1, [r4, #8]
	adds r7, r0, #0
	movs r1, #0x6b
	bl FUN_020503DC
	strb r0, [r4, #9]
	adds r0, r7, #0
	movs r1, #2
	movs r2, #0x10
	bl FUN_02066930
	strb r0, [r4, #0xa]
	adds r0, r7, #0
	movs r1, #2
	movs r2, #0x12
	bl FUN_02066930
	strb r0, [r4, #0xb]
	adds r0, r7, #0
	movs r1, #2
	movs r2, #0x11
	bl FUN_02066930
	strb r0, [r4, #0xc]
	adds r0, r7, #0
	movs r1, #2
	movs r2, #5
	bl FUN_02066930
	strb r0, [r4, #0xe]
	ldr r1, _021F660C @ =0x00000964
	adds r0, r7, #0
	bl FUN_020503DC
	movs r1, #0x46
	strb r0, [r4, #0xd]
	adds r0, r7, #0
	lsls r1, r1, #2
	bl FUN_020503DC
	ldr r7, _021F6610 @ =0x021F8AD0
	strb r0, [r4, #0xf]
	adds r1, r6, #0
_021F65B0:
	lsls r0, r1, #1
	adds r0, r1, r0
	adds r2, r7, r0
	ldrb r0, [r7, r0]
	adds r0, r4, r0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _021F65EE
	ldrb r0, [r2, #2]
	cmp r0, #0xff
	beq _021F65D0
	adds r3, r5, #0
	adds r3, #0x58
	ldrb r3, [r3]
	cmp r0, r3
	bne _021F65EE
_021F65D0:
	adds r0, r5, #0
	adds r0, #0x66
	ldrb r0, [r0]
	ldrb r2, [r2, #1]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	adds r0, r0, #1
	tst r0, r2
	beq _021F65EE
	adds r0, r6, #0
	adds r2, r6, #1
	lsls r2, r2, #0x18
	adds r0, r4, r0
	lsrs r6, r2, #0x18
	strb r1, [r0, #0x10]
_021F65EE:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x24
	blo _021F65B0
	bl FUN_0201FD44
	adds r1, r6, #0
	blx FUN_020F2998
	adds r0, r4, r1
	ldrb r0, [r0, #0x10]
	adds r0, r0, #2
	strh r0, [r4, #6]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F660C: .4byte 0x00000964
_021F6610: .4byte 0x021F8AD0
	thumb_func_end ov101_021F6514

	thumb_func_start ov101_021F6614
ov101_021F6614: @ 0x021F6614
	ldr r3, _021F661C @ =FUN_0200BB44
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F661C: .4byte FUN_0200BB44
	thumb_func_end ov101_021F6614

	thumb_func_start ov101_021F6620
ov101_021F6620: @ 0x021F6620
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0x20
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x20
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	str r4, [r5, #0x1c]
	bl ov101_021F6710
	bl FUN_02004A90
	movs r1, #0
	bl FUN_02005EB4
	ldr r0, _021F6654 @ =0x00000495
	bl FUN_020049D0
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6654: .4byte 0x00000495
	thumb_func_end ov101_021F6620

	thumb_func_start ov101_021F6658
ov101_021F6658: @ 0x021F6658
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F6800
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #0x20
	blx FUN_020D4994
	ldr r0, [r4, #0x1c]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F6658

	thumb_func_start ov101_021F6678
ov101_021F6678: @ 0x021F6678
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #4
	bhi _021F670C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F6690: @ jump table
	.2byte _021F669A - _021F6690 - 2 @ case 0
	.2byte _021F66A8 - _021F6690 - 2 @ case 1
	.2byte _021F66CA - _021F6690 - 2 @ case 2
	.2byte _021F66DA - _021F6690 - 2 @ case 3
	.2byte _021F66F2 - _021F6690 - 2 @ case 4
_021F669A:
	movs r1, #2
	bl ov101_021F5DE0
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F670C
_021F66A8:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F670C
	ldrh r1, [r4, #6]
	adds r0, r5, #0
	adds r1, r4, r1
	ldrb r1, [r1, #0x10]
	adds r1, r1, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ov101_021F5DE0
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F670C
_021F66CA:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F670C
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F670C
_021F66DA:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F670C
	adds r0, r5, #0
	movs r1, #3
	bl ov101_021F5DEC
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F670C
_021F66F2:
	bl ov101_021F5EB4
	cmp r0, #0
	beq _021F670C
	adds r0, r5, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r0, #0x10
	adds r5, #0x66
	orrs r0, r1
	strb r0, [r5]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F670C:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F6678

	thumb_func_start ov101_021F6710
ov101_021F6710: @ 0x021F6710
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r5, [r6, #0x1c]
	ldr r2, _021F67F8 @ =0x000001A3
	ldr r3, [r6]
	adds r0, r4, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	str r0, [r6, #0x24]
	ldr r2, [r6, #0x4c]
	adds r1, r4, #0
	bl FUN_0200BB6C
	ldr r0, [r6, #0x24]
	ldr r2, [r6, #0x50]
	movs r1, #1
	bl FUN_0200BB6C
	adds r0, r5, #0
	adds r0, #8
	adds r1, r4, #0
	movs r2, #8
	blx FUN_020D4994
	adds r0, r5, #0
	adds r0, #0x10
	adds r1, r4, #0
	movs r2, #0xd
	blx FUN_020D4994
	ldr r0, [r6, #4]
	bl FUN_020503D0
	adds r7, r0, #0
	ldr r0, [r6, #4]
	bl FUN_02028E9C
	str r0, [sp]
	movs r0, #1
	strb r0, [r5, #8]
	adds r0, r7, #0
	movs r1, #0x7b
	bl FUN_020503DC
	strb r0, [r5, #9]
	ldr r0, [sp]
	movs r1, #2
	bl FUN_02028F98
	strb r0, [r5, #0xa]
	adds r0, r7, #0
	movs r1, #0xc6
	bl FUN_020503DC
	strb r0, [r5, #0xb]
	ldr r0, [sp]
	bl FUN_02028FF0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #8
	blo _021F6794
	movs r0, #1
	strb r0, [r5, #0xc]
_021F6794:
	cmp r1, #9
	blo _021F679C
	movs r0, #1
	strb r0, [r5, #0xd]
_021F679C:
	cmp r1, #0x10
	blo _021F67A4
	movs r0, #1
	strb r0, [r5, #0xf]
_021F67A4:
	adds r0, r7, #0
	movs r1, #2
	movs r2, #5
	bl FUN_02066930
	strb r0, [r5, #0xe]
	ldr r0, _021F67FC @ =0x021F8B3C
	movs r1, #0
_021F67B4:
	ldrb r2, [r0, r1]
	adds r2, r5, r2
	ldrb r2, [r2, #8]
	cmp r2, #0
	beq _021F67CA
	adds r2, r4, #0
	adds r3, r4, #1
	lsls r3, r3, #0x18
	adds r2, r5, r2
	lsrs r4, r3, #0x18
	strb r1, [r2, #0x10]
_021F67CA:
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0xd
	blo _021F67B4
	bl FUN_0201FD44
	adds r1, r4, #0
	blx FUN_020F2998
	strh r1, [r5, #6]
	ldrh r1, [r5, #6]
	ldr r0, [r6, #0x54]
	cmp r1, r0
	bne _021F67F2
	adds r0, r1, #1
	adds r1, r4, #0
	blx FUN_020F2998
	strh r1, [r5, #6]
_021F67F2:
	ldrh r0, [r5, #6]
	str r0, [r6, #0x54]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F67F8: .4byte 0x000001A3
_021F67FC: .4byte 0x021F8B3C
	thumb_func_end ov101_021F6710

	thumb_func_start ov101_021F6800
ov101_021F6800: @ 0x021F6800
	ldr r3, _021F6808 @ =FUN_0200BB44
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6808: .4byte FUN_0200BB44
	thumb_func_end ov101_021F6800

	thumb_func_start ov101_021F680C
ov101_021F680C: @ 0x021F680C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #8
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #8
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	str r4, [r5, #0x1c]
	bl ov101_021F6904
	bl FUN_02004A90
	movs r1, #0
	bl FUN_02005EB4
	movs r0, #0x45
	lsls r0, r0, #4
	bl FUN_020049D0
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F680C

	thumb_func_start ov101_021F6840
ov101_021F6840: @ 0x021F6840
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F699C
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #8
	blx FUN_020D4994
	ldr r0, [r4, #0x1c]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F6840

	thumb_func_start ov101_021F6860
ov101_021F6860: @ 0x021F6860
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #4
	bhi _021F68FC
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F6878: @ jump table
	.2byte _021F6882 - _021F6878 - 2 @ case 0
	.2byte _021F6890 - _021F6878 - 2 @ case 1
	.2byte _021F68BA - _021F6878 - 2 @ case 2
	.2byte _021F68CA - _021F6878 - 2 @ case 3
	.2byte _021F68E2 - _021F6878 - 2 @ case 4
_021F6882:
	movs r1, #2
	bl ov101_021F5DE0
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F6890:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F68FC
	ldrh r1, [r4, #6]
	adds r0, r5, #0
	bl ov101_021F5DE0
	ldrh r0, [r4, #6]
	cmp r0, #4
	bne _021F68B2
	ldr r0, [r5, #4]
	bl FUN_020503D0
	ldr r1, _021F6900 @ =0x00000AB6
	bl FUN_02050408
_021F68B2:
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F68BA:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F68FC
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F68CA:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F68FC
	adds r0, r5, #0
	movs r1, #3
	bl ov101_021F5DEC
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F68E2:
	bl ov101_021F5EB4
	cmp r0, #0
	beq _021F68FC
	adds r0, r5, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r0, #0x10
	adds r5, #0x66
	orrs r0, r1
	strb r0, [r5]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F68FC:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F6900: .4byte 0x00000AB6
	thumb_func_end ov101_021F6860

	thumb_func_start ov101_021F6904
ov101_021F6904: @ 0x021F6904
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldr r2, _021F6998 @ =0x0000019B
	ldr r3, [r5]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	movs r1, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x50]
	movs r1, #1
	bl FUN_0200BB6C
	ldr r0, [r5, #4]
	bl FUN_0207879C
	movs r1, #0x76
	ldr r3, [r5]
	lsls r1, r1, #2
	movs r2, #1
	bl FUN_020784B0
	cmp r0, #0
	beq _021F6946
	movs r0, #4
	b _021F6948
_021F6946:
	movs r0, #5
_021F6948:
	strh r0, [r4, #6]
	ldr r3, [r5]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0x42
	bl FUN_0200BAF8
	adds r4, r0, #0
	ldr r0, [r5, #4]
	bl FUN_020503D0
	bl FUN_02066ECC
	movs r1, #0x1e
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r4, #0
	adds r1, #0x28
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r3, #2
	str r3, [sp, #4]
	ldr r0, [r5, #0x44]
	movs r1, #0
	adds r2, r6, #0
	bl FUN_0200BE3C
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0200BB44
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_021F6998: .4byte 0x0000019B
	thumb_func_end ov101_021F6904

	thumb_func_start ov101_021F699C
ov101_021F699C: @ 0x021F699C
	ldr r3, _021F69A4 @ =FUN_0200BB44
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F69A4: .4byte FUN_0200BB44
	thumb_func_end ov101_021F699C

	thumb_func_start ov101_021F69A8
ov101_021F69A8: @ 0x021F69A8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0x24
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x24
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	str r4, [r5, #0x1c]
	bl ov101_021F6AAC
	bl FUN_02004A90
	movs r1, #0
	bl FUN_02005EB4
	ldr r0, _021F69DC @ =0x00000494
	bl FUN_020049D0
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F69DC: .4byte 0x00000494
	thumb_func_end ov101_021F69A8

	thumb_func_start ov101_021F69E0
ov101_021F69E0: @ 0x021F69E0
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F6B7C
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #0x24
	blx FUN_020D4994
	ldr r0, [r4, #0x1c]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F69E0

	thumb_func_start ov101_021F6A00
ov101_021F6A00: @ 0x021F6A00
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #5
	bhi _021F6AA8
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F6A18: @ jump table
	.2byte _021F6A24 - _021F6A18 - 2 @ case 0
	.2byte _021F6A32 - _021F6A18 - 2 @ case 1
	.2byte _021F6A40 - _021F6A18 - 2 @ case 2
	.2byte _021F6A54 - _021F6A18 - 2 @ case 3
	.2byte _021F6A76 - _021F6A18 - 2 @ case 4
	.2byte _021F6A8E - _021F6A18 - 2 @ case 5
_021F6A24:
	movs r1, #2
	bl ov101_021F5DE0
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A32:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F6AA8
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
_021F6A40:
	ldrb r1, [r4, #9]
	adds r0, r5, #0
	adds r1, r4, r1
	ldrb r1, [r1, #6]
	bl ov101_021F5DE0
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A54:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F6AA8
	ldrb r0, [r4, #9]
	adds r0, r0, #1
	strb r0, [r4, #9]
	ldrb r0, [r4, #9]
	cmp r0, #3
	bhs _021F6A6E
	movs r0, #2
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A6E:
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A76:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F6AA8
	adds r0, r5, #0
	movs r1, #3
	bl ov101_021F5DEC
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A8E:
	bl ov101_021F5EB4
	cmp r0, #0
	beq _021F6AA8
	adds r0, r5, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r0, #0x10
	adds r5, #0x66
	orrs r0, r1
	strb r0, [r5]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F6AA8:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F6A00

	thumb_func_start ov101_021F6AAC
ov101_021F6AAC: @ 0x021F6AAC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldr r2, _021F6B74 @ =0x0000019F
	ldr r3, [r5]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	movs r1, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x50]
	movs r1, #1
	bl FUN_0200BB6C
	adds r0, r4, #0
	adds r0, #0xa
	movs r1, #0
	movs r2, #5
	blx FUN_020D4994
	adds r0, r4, #0
	adds r0, #0xf
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, [r5, #4]
	bl FUN_020503D0
	movs r1, #1
	strb r1, [r4, #0xa]
	adds r5, r0, #0
	movs r1, #2
	movs r2, #0xf
	bl FUN_02066930
	strb r0, [r4, #0xb]
	adds r0, r5, #0
	movs r1, #2
	movs r2, #0x13
	bl FUN_02066930
	strb r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #2
	movs r2, #0x15
	bl FUN_02066930
	strb r0, [r4, #0xd]
	adds r0, r5, #0
	movs r1, #2
	movs r2, #5
	bl FUN_02066930
	movs r6, #0
	strb r0, [r4, #0xe]
	ldr r1, _021F6B78 @ =0x021F8B4C
	adds r0, r6, #0
_021F6B2A:
	ldrb r2, [r1]
	adds r2, r4, r2
	ldrb r2, [r2, #0xa]
	cmp r2, #0
	beq _021F6B3A
	adds r2, r4, r6
	adds r6, r6, #1
	strb r0, [r2, #0xf]
_021F6B3A:
	adds r0, r0, #1
	adds r1, r1, #1
	cmp r0, #0x14
	blt _021F6B2A
	movs r5, #0
_021F6B44:
	bl FUN_0201FD44
	adds r1, r6, #0
	blx FUN_020F2998
	adds r0, r4, r1
	ldrb r0, [r0, #0xf]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	adds r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov101_021F6B88
	cmp r0, #0
	bne _021F6B44
	adds r0, r4, r5
	adds r5, r5, #1
	strb r7, [r0, #6]
	cmp r5, #3
	blt _021F6B44
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F6B74: .4byte 0x0000019F
_021F6B78: .4byte 0x021F8B4C
	thumb_func_end ov101_021F6AAC

	thumb_func_start ov101_021F6B7C
ov101_021F6B7C: @ 0x021F6B7C
	ldr r3, _021F6B84 @ =FUN_0200BB44
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6B84: .4byte FUN_0200BB44
	thumb_func_end ov101_021F6B7C

	thumb_func_start ov101_021F6B88
ov101_021F6B88: @ 0x021F6B88
	push {r3, r4}
	movs r4, #0
	cmp r2, #0
	ble _021F6BA4
_021F6B90:
	adds r3, r0, r4
	ldrb r3, [r3, #6]
	cmp r1, r3
	bne _021F6B9E
	movs r0, #1
	pop {r3, r4}
	bx lr
_021F6B9E:
	adds r4, r4, #1
	cmp r4, r2
	blt _021F6B90
_021F6BA4:
	movs r0, #0
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov101_021F6B88

	thumb_func_start ov101_021F6BAC
ov101_021F6BAC: @ 0x021F6BAC
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
	str r4, [r5, #0x1c]
	bl ov101_021F6CB0
	bl FUN_02004A90
	movs r1, #0
	bl FUN_02005EB4
	ldr r0, _021F6BE0 @ =0x00000493
	bl FUN_020049D0
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6BE0: .4byte 0x00000493
	thumb_func_end ov101_021F6BAC

	thumb_func_start ov101_021F6BE4
ov101_021F6BE4: @ 0x021F6BE4
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F6D0C
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	ldr r0, [r4, #0x1c]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F6BE4

	thumb_func_start ov101_021F6C04
ov101_021F6C04: @ 0x021F6C04
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #5
	bhi _021F6CAC
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F6C1C: @ jump table
	.2byte _021F6C28 - _021F6C1C - 2 @ case 0
	.2byte _021F6C36 - _021F6C1C - 2 @ case 1
	.2byte _021F6C44 - _021F6C1C - 2 @ case 2
	.2byte _021F6C58 - _021F6C1C - 2 @ case 3
	.2byte _021F6C7A - _021F6C1C - 2 @ case 4
	.2byte _021F6C92 - _021F6C1C - 2 @ case 5
_021F6C28:
	movs r1, #2
	bl ov101_021F5DE0
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C36:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F6CAC
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
_021F6C44:
	ldrb r1, [r4, #9]
	adds r0, r5, #0
	adds r1, r4, r1
	ldrb r1, [r1, #6]
	bl ov101_021F5DE0
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C58:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F6CAC
	ldrb r0, [r4, #9]
	adds r0, r0, #1
	strb r0, [r4, #9]
	ldrb r0, [r4, #9]
	cmp r0, #3
	bhs _021F6C72
	movs r0, #2
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C72:
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C7A:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F6CAC
	adds r0, r5, #0
	movs r1, #3
	bl ov101_021F5DEC
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C92:
	bl ov101_021F5EB4
	cmp r0, #0
	beq _021F6CAC
	adds r0, r5, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r0, #0x10
	adds r5, #0x66
	orrs r0, r1
	strb r0, [r5]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F6CAC:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F6C04

	thumb_func_start ov101_021F6CB0
ov101_021F6CB0: @ 0x021F6CB0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r2, #0x69
	ldr r5, [r4, #0x1c]
	ldr r3, [r4]
	movs r0, #0
	movs r1, #0x1b
	lsls r2, r2, #2
	bl FUN_0200BAF8
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	movs r1, #0
	bl FUN_0200BB6C
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	movs r1, #1
	bl FUN_0200BB6C
	movs r4, #0
	movs r7, #0x1c
_021F6CDC:
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r0, r0, #0x1c
	subs r0, r0, r1
	rors r0, r7
	adds r0, r1, r0
	adds r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	lsrs r2, r2, #0x18
	bl ov101_021F6D18
	cmp r0, #0
	bne _021F6CDC
	adds r0, r5, r4
	adds r4, r4, #1
	strb r6, [r0, #6]
	cmp r4, #3
	blt _021F6CDC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F6CB0

	thumb_func_start ov101_021F6D0C
ov101_021F6D0C: @ 0x021F6D0C
	ldr r3, _021F6D14 @ =FUN_0200BB44
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6D14: .4byte FUN_0200BB44
	thumb_func_end ov101_021F6D0C

	thumb_func_start ov101_021F6D18
ov101_021F6D18: @ 0x021F6D18
	push {r3, r4}
	movs r4, #0
	cmp r2, #0
	ble _021F6D34
_021F6D20:
	adds r3, r0, r4
	ldrb r3, [r3, #6]
	cmp r1, r3
	bne _021F6D2E
	movs r0, #1
	pop {r3, r4}
	bx lr
_021F6D2E:
	adds r4, r4, #1
	cmp r4, r2
	blt _021F6D20
_021F6D34:
	movs r0, #0
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov101_021F6D18

	thumb_func_start ov101_021F6D3C
ov101_021F6D3C: @ 0x021F6D3C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x95
	ldr r0, [r5]
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0x95
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	str r4, [r5, #0x1c]
	bl ov101_021F6F14
	bl FUN_02004A90
	movs r1, #0
	bl FUN_02005EB4
	ldr r0, _021F6D74 @ =0x0000044F
	bl FUN_020049D0
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6D74: .4byte 0x0000044F
	thumb_func_end ov101_021F6D3C

	thumb_func_start ov101_021F6D78
ov101_021F6D78: @ 0x021F6D78
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F6FC0
	movs r2, #0x95
	ldr r0, [r4, #0x1c]
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020D4994
	ldr r0, [r4, #0x1c]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov101_021F6D78

	thumb_func_start ov101_021F6D98
ov101_021F6D98: @ 0x021F6D98
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r4, [r6, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #7
	bhi _021F6DD8
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F6DB2: @ jump table
	.2byte _021F6DC2 - _021F6DB2 - 2 @ case 0
	.2byte _021F6DD0 - _021F6DB2 - 2 @ case 1
	.2byte _021F6E10 - _021F6DB2 - 2 @ case 2
	.2byte _021F6E1E - _021F6DB2 - 2 @ case 3
	.2byte _021F6E56 - _021F6DB2 - 2 @ case 4
	.2byte _021F6EB2 - _021F6DB2 - 2 @ case 5
	.2byte _021F6ED8 - _021F6DB2 - 2 @ case 6
	.2byte _021F6EF0 - _021F6DB2 - 2 @ case 7
_021F6DC2:
	movs r1, #2
	bl ov101_021F5DE0
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6DD0:
	bl ov101_021F5E1C
	cmp r0, #0
	bne _021F6DDA
_021F6DD8:
	b _021F6F0C
_021F6DDA:
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _021F6DE6
	movs r0, #3
	strh r0, [r4, #4]
	b _021F6F0C
_021F6DE6:
	ldrh r0, [r4, #8]
	bl FUN_0203B36C
	adds r2, r0, #0
	ldr r0, [r6, #0x44]
	movs r1, #0
	bl FUN_0200C278
	ldrh r2, [r4, #6]
	ldr r0, [r6, #0x44]
	movs r1, #1
	bl FUN_0200BEE8
	adds r0, r6, #0
	movs r1, #0x20
	bl ov101_021F5DE0
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6E10:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F6F0C
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
_021F6E1E:
	movs r2, #0x25
	lsls r2, r2, #4
	ldrb r2, [r4, r2]
	ldr r0, [r6, #0x44]
	movs r1, #0
	lsls r2, r2, #2
	adds r2, r4, r2
	ldrh r2, [r2, #0x10]
	bl FUN_0200C278
	movs r2, #0x25
	lsls r2, r2, #4
	ldrb r2, [r4, r2]
	ldr r0, [r6, #0x44]
	movs r1, #1
	lsls r2, r2, #2
	adds r2, r4, r2
	ldrh r2, [r2, #0x12]
	bl FUN_0200BEE8
	adds r0, r6, #0
	movs r1, #4
	bl ov101_021F5DE0
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6E56:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F6F0C
	movs r5, #0
	str r5, [sp, #8]
	adds r7, r5, #0
_021F6E64:
	movs r1, #0x25
	lsls r1, r1, #4
	ldrb r1, [r4, r1]
	ldr r0, [r6, #0x24]
	ldr r2, [r6, #0x48]
	lsls r1, r1, #2
	adds r1, r4, r1
	adds r1, r5, r1
	ldrh r1, [r1, #0x24]
	adds r1, r1, #6
	adds r1, r7, r1
	bl FUN_0200BB6C
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r0, [r6, #0x44]
	ldr r2, [r6, #0x48]
	adds r1, r1, #2
	movs r3, #1
	bl FUN_0200BE3C
	ldr r0, [sp, #8]
	adds r5, r5, #2
	adds r0, r0, #1
	adds r7, #0xd
	str r0, [sp, #8]
	cmp r0, #2
	blt _021F6E64
	adds r0, r6, #0
	movs r1, #5
	bl ov101_021F5DE0
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6EB2:
	bl ov101_021F5E1C
	cmp r0, #0
	beq _021F6F0C
	movs r0, #0x25
	lsls r0, r0, #4
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #5
	bhs _021F6ED0
	movs r0, #3
	strh r0, [r4, #4]
	b _021F6F0C
_021F6ED0:
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6ED8:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F6F0C
	adds r0, r6, #0
	movs r1, #3
	bl ov101_021F5DEC
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6EF0:
	bl ov101_021F5EB4
	cmp r0, #0
	beq _021F6F0C
	adds r0, r6, #0
	adds r0, #0x66
	ldrb r1, [r0]
	movs r0, #0x10
	adds r6, #0x66
	orrs r0, r1
	strb r0, [r6]
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_021F6F0C:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov101_021F6D98

	thumb_func_start ov101_021F6F14
ov101_021F6F14: @ 0x021F6F14
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x1c]
	ldr r2, _021F6FBC @ =0x0000019E
	ldr r3, [r4]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	movs r1, #0
	bl FUN_0200BB6C
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	movs r1, #1
	bl FUN_0200BB6C
	ldr r0, [r4, #4]
	bl FUN_0202D9C4
	adds r6, r0, #0
	bl FUN_0202D9E0
	cmp r0, #0
	beq _021F6F5C
	adds r0, r6, #0
	movs r1, #2
	bl FUN_0202D9A8
	adds r1, r5, #0
	adds r1, #8
	adds r2, r5, #6
	bl FUN_02097F9C
_021F6F5C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov101_021F6FCC
	bl FUN_0201FD44
	movs r1, #3
	blx FUN_020F2998
	adds r0, r1, #1
	lsls r6, r0, #1
	bl FUN_0201FD44
	movs r1, #0xd
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
	bl FUN_0201FD44
	movs r1, #0xd
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	str r0, [sp]
_021F6F92:
	strh r7, [r5, #0x24]
	adds r0, r7, r6
	movs r1, #0xd
	strh r4, [r5, #0x26]
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, r6
	movs r1, #0xd
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp]
	adds r5, r5, #4
	adds r0, r0, #1
	str r0, [sp]
	cmp r0, #5
	blt _021F6F92
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F6FBC: .4byte 0x0000019E
	thumb_func_end ov101_021F6F14

	thumb_func_start ov101_021F6FC0
ov101_021F6FC0: @ 0x021F6FC0
	ldr r3, _021F6FC8 @ =FUN_0200BB44
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6FC8: .4byte FUN_0200BB44
	thumb_func_end ov101_021F6FC0

	thumb_func_start ov101_021F6FCC
ov101_021F6FCC: @ 0x021F6FCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, [r7, #4]
	adds r5, r1, #0
	bl FUN_0202A634
	str r0, [sp, #8]
	ldr r0, [r7, #4]
	bl FUN_020503D0
	movs r1, #2
	movs r2, #0x19
	bl FUN_02066930
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #0x4b
	adds r0, #0x38
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020D4994
	movs r0, #0x59
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	movs r2, #0x76
	blx FUN_020D4994
	ldr r0, _021F70E8 @ =0x000001DA
	movs r1, #0
	adds r0, r5, r0
	movs r2, #0x76
	blx FUN_020D4994
	movs r4, #0
	strh r4, [r5, #0xa]
	strh r4, [r5, #0xc]
	adds r6, r5, #0
	strh r4, [r5, #0xe]
	adds r6, #0xa
_021F7020:
	adds r0, r4, #0
	bl FUN_0203B324
	cmp r0, #0
	beq _021F707C
	adds r0, r4, #0
	bl FUN_0203B3C8
	adds r1, r7, #0
	adds r1, #0x66
	ldrb r1, [r1]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1f
	cmp r1, r0
	bne _021F707C
	ldr r2, _021F70EC @ =0x021F8B60
	movs r1, #0
_021F7042:
	ldrh r0, [r2]
	cmp r4, r0
	beq _021F7050
	adds r1, r1, #1
	adds r2, r2, #2
	cmp r1, #0xe
	blo _021F7042
_021F7050:
	cmp r1, #0xe
	blo _021F707C
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _021F7062
	cmp r4, #0x97
	beq _021F707C
	cmp r4, #0x98
	beq _021F707C
_021F7062:
	ldrh r0, [r6]
	ldrh r1, [r5, #0xa]
	adds r0, r0, #1
	strh r0, [r6]
	lsls r0, r1, #1
	adds r0, r5, r0
	strh r4, [r0, #0x38]
	ldrh r0, [r5, #0xa]
	cmp r0, #0x96
	blo _021F707C
	bl FUN_0202551C
	b _021F7086
_021F707C:
	movs r0, #0x87
	adds r4, r4, #1
	lsls r0, r0, #2
	cmp r4, r0
	blt _021F7020
_021F7086:
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
_021F708C:
	movs r0, #0
	strh r0, [r5, #0xc]
	strh r0, [r5, #0xe]
	ldr r0, [sp]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_021F7098:
	bl FUN_0201FD44
	ldrh r1, [r5, #0xa]
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0xf
	adds r6, r5, r0
	ldrh r0, [r6, #0x38]
	bl FUN_0203B36C
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl ov101_021F70F0
	cmp r0, #0
	bne _021F7098
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	strh r7, [r0, #0x10]
	ldrh r2, [r6, #0x38]
	adds r0, r5, #0
	bl ov101_021F7174
	ldr r1, [sp, #4]
	strh r0, [r1, #0x12]
	adds r0, r1, #0
	adds r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r0, r0, #1
	str r0, [sp]
	cmp r0, #5
	blt _021F708C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F70E8: .4byte 0x000001DA
_021F70EC: .4byte 0x021F8B60
	thumb_func_end ov101_021F6FCC

	thumb_func_start ov101_021F70F0
ov101_021F70F0: @ 0x021F70F0
	push {r3, r4}
	movs r4, #0
	cmp r2, #0
	ble _021F710C
_021F70F8:
	ldrh r3, [r0, #0x10]
	cmp r1, r3
	bne _021F7104
	movs r0, #1
	pop {r3, r4}
	bx lr
_021F7104:
	adds r4, r4, #1
	adds r0, r0, #4
	cmp r4, r2
	blt _021F70F8
_021F710C:
	movs r0, #0
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov101_021F70F0

	thumb_func_start ov101_021F7114
ov101_021F7114: @ 0x021F7114
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	beq _021F7168
	ldr r0, _021F716C @ =0x000001ED
	cmp r4, r0
	bhi _021F7168
	ldrh r6, [r5, #0xc]
	movs r2, #0
	cmp r6, #0
	ble _021F713E
	adds r3, r5, #0
	subs r0, #0x89
_021F7130:
	ldrh r1, [r3, r0]
	cmp r4, r1
	beq _021F7168
	adds r2, r2, #1
	adds r3, r3, #2
	cmp r2, r6
	blt _021F7130
_021F713E:
	ldrh r0, [r5, #0xc]
	adds r0, r0, #1
	strh r0, [r5, #0xc]
	lsls r0, r6, #1
	adds r1, r5, r0
	movs r0, #0x59
	lsls r0, r0, #2
	strh r4, [r1, r0]
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_02029FF8
	cmp r0, #0
	bne _021F7168
	ldrh r1, [r5, #0xe]
	adds r0, r1, #1
	strh r0, [r5, #0xe]
	lsls r0, r1, #1
	adds r1, r5, r0
	ldr r0, _021F7170 @ =0x000001DA
	strh r4, [r1, r0]
_021F7168:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F716C: .4byte 0x000001ED
_021F7170: .4byte 0x000001DA
	thumb_func_end ov101_021F7114

	thumb_func_start ov101_021F7174
ov101_021F7174: @ 0x021F7174
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc4
	adds r5, r0, #0
	adds r4, r1, #0
	add r0, sp, #0
	adds r1, r2, #0
	bl FUN_0203B88C
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F71BA
	movs r7, #0
	add r6, sp, #0
_021F7190:
	ldrh r2, [r6, #0x14]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F7114
	ldrh r2, [r6, #0x2c]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F7114
	adds r2, r6, #0
	adds r2, #0x44
	ldrh r2, [r2]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F7114
	adds r7, r7, #1
	adds r6, r6, #2
	cmp r7, #0xc
	blt _021F7190
_021F71BA:
	add r0, sp, #0
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _021F71DC
	movs r7, #0
	add r6, sp, #0
_021F71C6:
	adds r2, r6, #0
	adds r2, #0x66
	ldrh r2, [r2]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F7114
	adds r7, r7, #1
	adds r6, r6, #4
	cmp r7, #5
	blt _021F71C6
_021F71DC:
	add r0, sp, #0
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _021F71FE
	movs r7, #0
	add r6, sp, #0
_021F71E8:
	adds r2, r6, #0
	adds r2, #0x7a
	ldrh r2, [r2]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F7114
	adds r7, r7, #1
	adds r6, r6, #4
	cmp r7, #2
	blt _021F71E8
_021F71FE:
	add r0, sp, #0
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _021F7220
	movs r7, #0
	add r6, sp, #0
_021F720A:
	adds r2, r6, #0
	adds r2, #0x82
	ldrh r2, [r2]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F7114
	adds r7, r7, #1
	adds r6, r6, #4
	cmp r7, #5
	blt _021F720A
_021F7220:
	add r0, sp, #0
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _021F7242
	movs r7, #0
	add r6, sp, #0
_021F722C:
	adds r2, r6, #0
	adds r2, #0x96
	ldrh r2, [r2]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F7114
	adds r7, r7, #1
	adds r6, r6, #4
	cmp r7, #5
	blt _021F722C
_021F7242:
	add r0, sp, #0
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _021F7264
	movs r7, #0
	add r6, sp, #0
_021F724E:
	adds r2, r6, #0
	adds r2, #0xaa
	ldrh r2, [r2]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F7114
	adds r7, r7, #1
	adds r6, r6, #4
	cmp r7, #5
	blt _021F724E
_021F7264:
	add r0, sp, #0xc0
	ldrh r2, [r0]
	cmp r2, #0
	beq _021F7274
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov101_021F7114
_021F7274:
	ldrh r0, [r5, #0xe]
	cmp r0, #0
	beq _021F7292
	cmp r0, #1
	bne _021F72AA
	bl FUN_0201FD44
	movs r1, #0xfa
	lsls r1, r1, #2
	blx FUN_020F2998
	movs r0, #0x7d
	lsls r0, r0, #2
	cmp r1, r0
	bge _021F72AA
_021F7292:
	bl FUN_0201FD44
	ldrh r1, [r5, #0xc]
	blx FUN_020F2998
	lsls r0, r1, #1
	adds r1, r5, r0
	movs r0, #0x59
	lsls r0, r0, #2
	add sp, #0xc4
	ldrh r0, [r1, r0]
	pop {r4, r5, r6, r7, pc}
_021F72AA:
	bl FUN_0201FD44
	ldrh r1, [r5, #0xe]
	blx FUN_020F2998
	lsls r0, r1, #1
	adds r1, r5, r0
	ldr r0, _021F72C0 @ =0x000001DA
	ldrh r0, [r1, r0]
	add sp, #0xc4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021F72C0: .4byte 0x000001DA
	thumb_func_end ov101_021F7174

	thumb_func_start ov101_021F72C4
ov101_021F72C4: @ 0x021F72C4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #8
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #8
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	str r4, [r5, #0x1c]
	bl ov101_021F7324
	bl FUN_02004A90
	movs r1, #1
	bl FUN_02005EB4
	movs r0, #0
	strb r0, [r4, #4]
	ldr r0, _021F72FC @ =0x00000445
	bl FUN_020049D0
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F72FC: .4byte 0x00000445
	thumb_func_end ov101_021F72C4

	thumb_func_start ov101_021F7300
ov101_021F7300: @ 0x021F7300
	push {r4, lr}
	adds r4, r0, #0
	bl ov101_021F734C
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #8
	blx FUN_020D4994
	ldr r0, [r4, #0x1c]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov101_021F7300

	thumb_func_start ov101_021F7320
ov101_021F7320: @ 0x021F7320
	movs r0, #0
	bx lr
	thumb_func_end ov101_021F7320

	thumb_func_start ov101_021F7324
ov101_021F7324: @ 0x021F7324
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _021F7348 @ =0x00000199
	ldr r3, [r4]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	movs r1, #0
	bl FUN_0200BB6C
	ldr r0, [r4, #0x50]
	bl FUN_020263AC
	pop {r4, pc}
	nop
_021F7348: .4byte 0x00000199
	thumb_func_end ov101_021F7324

	thumb_func_start ov101_021F734C
ov101_021F734C: @ 0x021F734C
	ldr r3, _021F7354 @ =FUN_0200BB44
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F7354: .4byte FUN_0200BB44
	thumb_func_end ov101_021F734C

	.rodata

_021F7358:
	.byte 0x1A, 0x00, 0x1D, 0x00, 0x2D, 0x00, 0x09, 0x02
	.byte 0x0A, 0x02, 0x0B, 0x02, 0x33, 0x01, 0x34, 0x01, 0x35, 0x01, 0x36, 0x01, 0x37, 0x01, 0x48, 0x01
	.byte 0x49, 0x01, 0x09, 0x02, 0x13, 0x02, 0x33, 0xC0, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x33, 0x01, 0x18, 0x10, 0x33, 0xC0, 0x45, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x78, 0x00, 0x15, 0x06, 0x11, 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28
	.byte 0x01, 0x01, 0x7B, 0x00, 0x11, 0x0A, 0x11, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x28
	.byte 0x01, 0x01, 0x7B, 0x00, 0x13, 0x0C, 0x11, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x2C
	.byte 0x01, 0x01, 0x7B, 0x00, 0x14, 0x08, 0x11, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x28
	.byte 0x01, 0x01, 0x6E, 0x00, 0x0F, 0x09, 0x11, 0x00, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28
	.byte 0x01, 0x01, 0x63, 0x00, 0x0E, 0x0F, 0x11, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x2C
	.byte 0x01, 0x01, 0x72, 0x00, 0x0D, 0x10, 0x11, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28
	.byte 0x01, 0x01, 0x75, 0x00, 0x0B, 0x10, 0x11, 0x00, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x2D
	.byte 0x01, 0x01, 0x60, 0x00, 0x0A, 0x08, 0x22, 0x44, 0x2B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x25
	.byte 0x02, 0x02, 0x6F, 0x00, 0x0C, 0x06, 0x11, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28
	.byte 0x01, 0x01, 0x07, 0x00, 0x0B, 0x06, 0x11, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28
	.byte 0x01, 0x01, 0x77, 0x00, 0x0E, 0x07, 0x11, 0x00, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28
	.byte 0x01, 0x01, 0x79, 0x00, 0x07, 0x0D, 0x11, 0x00, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x2E
	.byte 0x01, 0x01, 0x7E, 0x00, 0x17, 0x0E, 0x11, 0x00, 0x3D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x28
	.byte 0x01, 0x01, 0x7C, 0x00, 0x1C, 0x09, 0x21, 0x40, 0x3B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x25
	.byte 0x01, 0x02, 0x93, 0x00, 0x20, 0x07, 0x11, 0x00, 0x3E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x29
	.byte 0x01, 0x01, 0x6A, 0x00, 0x20, 0x06, 0x11, 0x00, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x28
	.byte 0x01, 0x01, 0x6A, 0x00, 0x2A, 0x0B, 0x11, 0x00, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x2B
	.byte 0x01, 0x01, 0x6B, 0x00, 0x24, 0x05, 0x11, 0x00, 0x22, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x28
	.byte 0x01, 0x01, 0x91, 0x00, 0x28, 0x05, 0x11, 0x00, 0x23, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28
	.byte 0x01, 0x01, 0x6C, 0x00, 0x2C, 0x06, 0x11, 0x00, 0x24, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x29
	.byte 0x01, 0x01, 0xE9, 0x01, 0x2C, 0x07, 0x11, 0x00, 0x43, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x2A
	.byte 0x01, 0x01, 0x92, 0x00, 0x23, 0x11, 0x11, 0x00, 0x26, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x28
	.byte 0x01, 0x01, 0x10, 0x01, 0x06, 0x08, 0x22, 0x44, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x25
	.byte 0x02, 0x02, 0xDF, 0x01, 0x25, 0x0E, 0x11, 0x00, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28
	.byte 0x01, 0x01, 0xDC, 0x00, 0x09, 0x0A, 0x11, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28
	.byte 0x01, 0x01, 0x31, 0x00, 0x20, 0x0D, 0x11, 0x00, 0x0A, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20
	.byte 0x03, 0x03, 0x32, 0x00, 0x1F, 0x09, 0x22, 0x44, 0x0B, 0x02, 0x00, 0x00, 0x00, 0x00, 0x23, 0x20
	.byte 0x04, 0x04, 0x33, 0x00, 0x20, 0x04, 0x22, 0x44, 0x0C, 0x03, 0x00, 0x00, 0x00, 0x00, 0x23, 0x20
	.byte 0x04, 0x04, 0x34, 0x00, 0x28, 0x05, 0x22, 0x84, 0x0D, 0x04, 0x00, 0x00, 0x00, 0x00, 0x12, 0x20
	.byte 0x04, 0x04, 0x35, 0x00, 0x2C, 0x09, 0x11, 0x00, 0x0E, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20
	.byte 0x03, 0x03, 0x36, 0x00, 0x28, 0x0B, 0x22, 0x44, 0x0F, 0x06, 0x00, 0x00, 0x00, 0x00, 0x23, 0x20
	.byte 0x04, 0x04, 0x37, 0x00, 0x25, 0x09, 0x22, 0x44, 0x10, 0x07, 0x00, 0x00, 0x00, 0x00, 0x23, 0x20
	.byte 0x04, 0x04, 0x38, 0x00, 0x25, 0x0E, 0x22, 0x84, 0x11, 0x08, 0x00, 0x00, 0x00, 0x00, 0x12, 0x20
	.byte 0x04, 0x04, 0x39, 0x00, 0x20, 0x11, 0x11, 0x00, 0x12, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20
	.byte 0x03, 0x03, 0x3B, 0x00, 0x28, 0x08, 0x22, 0x44, 0x14, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x23, 0x20
	.byte 0x04, 0x04, 0x3C, 0x00, 0x15, 0x0E, 0x11, 0x00, 0x15, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20
	.byte 0x03, 0x03, 0x43, 0x00, 0x10, 0x0E, 0x12, 0x04, 0x16, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x20
	.byte 0x04, 0x03, 0x49, 0x00, 0x0E, 0x09, 0x22, 0x84, 0x17, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x20
	.byte 0x04, 0x04, 0x4A, 0x00, 0x0C, 0x10, 0x11, 0x00, 0x18, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x16, 0x20
	.byte 0x04, 0x03, 0x4B, 0x00, 0x05, 0x0C, 0x21, 0x40, 0x19, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x03, 0x20
	.byte 0x03, 0x04, 0x4C, 0x00, 0x09, 0x0C, 0x23, 0x48, 0x1A, 0x10, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x20
	.byte 0x05, 0x04, 0x4D, 0x00, 0x08, 0x09, 0x22, 0x04, 0x1B, 0x11, 0x00, 0x00, 0x00, 0x00, 0x06, 0x20
	.byte 0x04, 0x04, 0x4E, 0x00, 0x0B, 0x06, 0x22, 0x84, 0x1C, 0x12, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x20
	.byte 0x04, 0x04, 0x57, 0x00, 0x10, 0x07, 0x11, 0x00, 0x1D, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20
	.byte 0x03, 0x03, 0x59, 0x00, 0x14, 0x06, 0x22, 0x84, 0x1F, 0x14, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x20
	.byte 0x04, 0x04, 0x3A, 0x00, 0x1C, 0x08, 0x11, 0x00, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28
	.byte 0x01, 0x01, 0x58, 0x00, 0x0F, 0x03, 0x23, 0x48, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x20
	.byte 0x05, 0x04, 0x5A, 0x00, 0x19, 0x0A, 0x11, 0x00, 0x39, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x28
	.byte 0x01, 0x01, 0x08, 0x00, 0x0D, 0x0A, 0x21, 0x40, 0x2D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x20
	.byte 0x03, 0x04, 0xAE, 0x00, 0x02, 0x0A, 0x22, 0x44, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x25
	.byte 0x02, 0x02, 0x09, 0x00, 0x20, 0x0B, 0x21, 0x40, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x2E
	.byte 0x01, 0x02, 0x0A, 0x00, 0x20, 0x08, 0x11, 0x00, 0x47, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x2A
	.byte 0x01, 0x01, 0x0B, 0x00, 0x22, 0x05, 0x12, 0x04, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x28
	.byte 0x02, 0x01, 0x0C, 0x00, 0x25, 0x05, 0x13, 0x04, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x28
	.byte 0x03, 0x01, 0x0D, 0x00, 0x28, 0x07, 0x11, 0x00, 0x4A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x2C
	.byte 0x01, 0x01, 0x0E, 0x00, 0x28, 0x0A, 0x11, 0x00, 0x4B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x2C
	.byte 0x01, 0x01, 0x0F, 0x00, 0x27, 0x09, 0x11, 0x00, 0x4C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x2C
	.byte 0x01, 0x01, 0x10, 0x00, 0x2A, 0x09, 0x12, 0x04, 0x4D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1B, 0x2C
	.byte 0x02, 0x01, 0x11, 0x00, 0x2A, 0x06, 0x12, 0x04, 0x4E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1D, 0x29
	.byte 0x02, 0x01, 0x12, 0x00, 0x2C, 0x08, 0x11, 0x00, 0x4F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x2B
	.byte 0x01, 0x01, 0x13, 0x00, 0x2B, 0x0B, 0x11, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1D, 0x2B
	.byte 0x01, 0x01, 0x14, 0x00, 0x2C, 0x0A, 0x31, 0x40, 0x51, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x2A
	.byte 0x01, 0x03, 0x15, 0x00, 0x2A, 0x0D, 0x13, 0x04, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x2D
	.byte 0x03, 0x01, 0x16, 0x00, 0x2A, 0x0E, 0x21, 0x40, 0x53, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x2E
	.byte 0x01, 0x02, 0x17, 0x00, 0x27, 0x0F, 0x13, 0x0C, 0x54, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x2F
	.byte 0x03, 0x01, 0x18, 0x00, 0x23, 0x0A, 0x12, 0x04, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x28
	.byte 0x02, 0x01, 0x19, 0x00, 0x23, 0x0B, 0x41, 0xC0, 0x56, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x29
	.byte 0x01, 0x04, 0x1A, 0x00, 0x23, 0x0F, 0x12, 0x04, 0x57, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x2D
	.byte 0x02, 0x01, 0x5B, 0x00, 0x25, 0x10, 0x21, 0x40, 0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x2D
	.byte 0x01, 0x02, 0x5C, 0x00, 0x21, 0x11, 0x14, 0x08, 0x59, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x2E
	.byte 0x04, 0x01, 0x5D, 0x00, 0x20, 0x0E, 0x31, 0xC0, 0x5A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x2D
	.byte 0x01, 0x03, 0x1B, 0x00, 0x1D, 0x0A, 0x12, 0x04, 0x5B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x15, 0x28
	.byte 0x02, 0x01, 0x1C, 0x00, 0x29, 0x04, 0x11, 0x00, 0x5D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x2A
	.byte 0x01, 0x01, 0x1D, 0x00, 0x29, 0x03, 0x14, 0x0C, 0x5E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x29
	.byte 0x04, 0x01, 0x1E, 0x00, 0x1C, 0x0B, 0x41, 0xC0, 0x5F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x29
	.byte 0x01, 0x04, 0x1F, 0x00, 0x16, 0x0E, 0x16, 0x0F, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x2C
	.byte 0x06, 0x01, 0x20, 0x00, 0x1A, 0x0A, 0x12, 0x04, 0x61, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x28
	.byte 0x02, 0x01, 0x21, 0x00, 0x12, 0x0E, 0x13, 0x0C, 0x62, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x2E
	.byte 0x03, 0x01, 0x22, 0x00, 0x11, 0x0B, 0x31, 0x40, 0x63, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x29
	.byte 0x01, 0x03, 0x23, 0x00, 0x10, 0x0A, 0x12, 0x01, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x28
	.byte 0x01, 0x01, 0x24, 0x00, 0x0E, 0x0B, 0x41, 0xC0, 0x65, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x28
	.byte 0x01, 0x04, 0x25, 0x00, 0x0E, 0x10, 0x11, 0x00, 0x66, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x2D
	.byte 0x01, 0x01, 0x26, 0x00, 0x0B, 0x0E, 0x31, 0x40, 0x67, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x2B
	.byte 0x01, 0x02, 0x27, 0x00, 0x0B, 0x0A, 0x21, 0x40, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x2D
	.byte 0x01, 0x02, 0x28, 0x00, 0x0B, 0x09, 0x13, 0x04, 0x69, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x2C
	.byte 0x03, 0x01, 0x29, 0x00, 0x0C, 0x08, 0x11, 0x00, 0x6A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x2B
	.byte 0x01, 0x01, 0x2A, 0x00, 0x09, 0x07, 0x12, 0x04, 0x6B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x28
	.byte 0x02, 0x01, 0x2B, 0x00, 0x08, 0x07, 0x21, 0x40, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28
	.byte 0x01, 0x02, 0x5E, 0x00, 0x07, 0x0A, 0x21, 0x40, 0x6D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x2A
	.byte 0x01, 0x02, 0x5F, 0x00, 0x06, 0x0C, 0x22, 0x04, 0x6E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C
	.byte 0x02, 0x02, 0x2C, 0x00, 0x0D, 0x07, 0x13, 0x02, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x2A
	.byte 0x03, 0x01, 0x2D, 0x00, 0x10, 0x05, 0x21, 0x40, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x28
	.byte 0x01, 0x02, 0x2E, 0x00, 0x11, 0x07, 0x13, 0x08, 0x71, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x2A
	.byte 0x03, 0x01, 0x2F, 0x00, 0x14, 0x09, 0x41, 0x80, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x29
	.byte 0x01, 0x04, 0x30, 0x00, 0x13, 0x0D, 0x21, 0x00, 0x73, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x2D
	.byte 0x01, 0x01, 0x97, 0x00, 0x02, 0x0D, 0x23, 0x48, 0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x29
	.byte 0x03, 0x02, 0x98, 0x00, 0x02, 0x0C, 0x12, 0x04, 0x75, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x28
	.byte 0x02, 0x01, 0x00, 0x00, 0x31, 0x00, 0x31, 0x00, 0x00, 0x00, 0x20, 0x0B, 0x00, 0x14, 0x11, 0x33
	.byte 0x11, 0x00, 0x32, 0x00, 0x32, 0x00, 0x01, 0x01, 0x1F, 0x07, 0x05, 0x14, 0x22, 0x44, 0x11, 0x00
	.byte 0x33, 0x00, 0x33, 0x00, 0x02, 0x02, 0x20, 0x02, 0x0A, 0x14, 0x22, 0x44, 0x11, 0x00, 0x34, 0x00
	.byte 0x34, 0x00, 0x03, 0x03, 0x28, 0x03, 0x0F, 0x14, 0x22, 0x44, 0x11, 0x00, 0x35, 0x00, 0x35, 0x00
	.byte 0x04, 0x04, 0x2C, 0x07, 0x14, 0x14, 0x11, 0x33, 0x11, 0x00, 0x36, 0x00, 0x36, 0x00, 0x05, 0x05
	.byte 0x28, 0x09, 0x19, 0x14, 0x22, 0x44, 0x11, 0x00, 0x37, 0x00, 0x37, 0x00, 0x06, 0x06, 0x25, 0x07
	.byte 0x1E, 0x14, 0x22, 0x44, 0x11, 0x00, 0x38, 0x00, 0x38, 0x00, 0x07, 0x07, 0x25, 0x0C, 0x23, 0x14
	.byte 0x22, 0x44, 0x11, 0x00, 0x39, 0x00, 0x39, 0x00, 0x08, 0x08, 0x20, 0x0F, 0x00, 0x18, 0x11, 0x33
	.byte 0x11, 0x00, 0x3A, 0x00, 0x3A, 0x00, 0x09, 0xFF, 0x1C, 0x06, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x3B, 0x00, 0x3B, 0x00, 0x0A, 0x09, 0x28, 0x06, 0x05, 0x18, 0x22, 0x44, 0x11, 0x00, 0x3C, 0x00
	.byte 0x3C, 0x00, 0x0B, 0x0A, 0x15, 0x0C, 0x0B, 0x19, 0x11, 0x11, 0x00, 0x00, 0x43, 0x00, 0x43, 0x00
	.byte 0x0C, 0x0B, 0x10, 0x0C, 0x0F, 0x18, 0x12, 0x34, 0x11, 0x00, 0x49, 0x00, 0x49, 0x00, 0x0D, 0x0C
	.byte 0x0E, 0x07, 0x14, 0x18, 0x22, 0x43, 0x10, 0x00, 0x4A, 0x00, 0x4A, 0x00, 0x0E, 0x0D, 0x0C, 0x0E
	.byte 0x19, 0x18, 0x12, 0x34, 0x11, 0x00, 0x4B, 0x00, 0x4B, 0x00, 0x0F, 0x0E, 0x05, 0x0A, 0x1E, 0x18
	.byte 0x21, 0x43, 0x11, 0x00, 0x4C, 0x00, 0x4C, 0x00, 0x10, 0x0F, 0x09, 0x0A, 0x23, 0x18, 0x23, 0x45
	.byte 0x11, 0x00, 0x4D, 0x00, 0x4D, 0x00, 0x11, 0x10, 0x08, 0x07, 0x00, 0x1C, 0x22, 0x44, 0x11, 0x00
	.byte 0x4E, 0x00, 0x4E, 0x00, 0x12, 0x11, 0x0B, 0x04, 0x05, 0x1C, 0x22, 0x44, 0x11, 0x00, 0x57, 0x00
	.byte 0x57, 0x00, 0x13, 0x12, 0x10, 0x05, 0x0A, 0x1C, 0x11, 0x33, 0x11, 0x00, 0x59, 0x00, 0x59, 0x00
	.byte 0x15, 0x13, 0x14, 0x04, 0x0F, 0x1C, 0x22, 0x44, 0x11, 0x00, 0x58, 0x00, 0x58, 0x00, 0x14, 0xFF
	.byte 0x0F, 0x01, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x5A, 0x00, 0x16, 0xFF, 0x19, 0x08
	.byte 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0xAE, 0x00, 0xAE, 0x00, 0x1E, 0xFF, 0x02, 0x08, 0x00, 0x00
	.byte 0x22, 0x00, 0x00, 0x00, 0x10, 0x01, 0x9B, 0x01, 0x1B, 0xFF, 0x06, 0x06, 0x00, 0x00, 0x22, 0x00
	.byte 0x00, 0x00, 0x60, 0x00, 0x18, 0x01, 0x23, 0xFF, 0x0A, 0x06, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00
	.byte 0x7C, 0x00, 0x1E, 0x00, 0x21, 0xFF, 0x1C, 0x07, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x48, 0x54, 0xEE, 0x12, 0xF4, 0x06, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x01, 0x08, 0x05, 0x03, 0x01, 0xF0, 0x03, 0x05, 0x03, 0x0C, 0x0C
	.byte 0x02, 0x01, 0xD8, 0x03, 0x05, 0x01, 0x0E, 0x1C, 0x04, 0x01, 0x68, 0x03, 0x05, 0x05, 0x12, 0x0B
	.byte 0x05, 0x01, 0x31, 0x03, 0x05, 0x12, 0x12, 0x0B, 0x05, 0x01, 0xFA, 0x02, 0x05, 0x05, 0x14, 0x0B
	.byte 0x02, 0x01, 0xE4, 0x02, 0x05, 0x12, 0x16, 0x0B, 0x02, 0x01, 0xCE, 0x02, 0x01, 0x03, 0x00, 0x0C
	.byte 0x03, 0x0A, 0xDB, 0x03, 0x00, 0x00, 0x07, 0x01, 0xFF, 0xFF, 0x28, 0x84, 0xF8, 0x08, 0xF8, 0x08
	.byte 0x01, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0x40, 0x84, 0xF8, 0x08, 0xF8, 0x08, 0x02, 0x00, 0x01, 0x03
	.byte 0xFF, 0xFF, 0x58, 0x84, 0xF8, 0x08, 0xF8, 0x08, 0x03, 0x00, 0x02, 0x04, 0xFF, 0xFF, 0x70, 0x84
	.byte 0xF8, 0x08, 0xF8, 0x08, 0x04, 0x00, 0x03, 0x05, 0xFF, 0xFF, 0x88, 0x84, 0xF8, 0x08, 0xF8, 0x08
	.byte 0x05, 0x00, 0x04, 0x06, 0xFF, 0xFF, 0xA0, 0x84, 0xF8, 0x08, 0xF8, 0x08, 0x06, 0x00, 0x05, 0x07
	.byte 0xFF, 0xFF, 0xB8, 0x84, 0xF8, 0x08, 0xF8, 0x08, 0x07, 0x00, 0x06, 0x00, 0xFF, 0xFF, 0xD0, 0x84
	.byte 0xF8, 0x08, 0xF8, 0x08, 0x00, 0x00, 0x03, 0x01, 0x04, 0x04, 0x20, 0x20, 0xFA, 0x06, 0xFA, 0x06
	.byte 0x01, 0x00, 0x00, 0x02, 0x05, 0x05, 0x28, 0x1F, 0x06, 0x50, 0xFA, 0x06, 0x02, 0x00, 0x01, 0x03
	.byte 0x06, 0x06, 0x88, 0x20, 0xFA, 0x06, 0xFA, 0x06, 0x03, 0x00, 0x02, 0x00, 0x08, 0x07, 0x90, 0x1F
	.byte 0x06, 0x50, 0xFA, 0x06, 0x04, 0x00, 0x07, 0x05, 0x00, 0x00, 0x20, 0x35, 0xFA, 0x06, 0xFA, 0x06
	.byte 0x05, 0x00, 0x04, 0x06, 0x01, 0x01, 0x28, 0x34, 0x06, 0x50, 0xFA, 0x06, 0x06, 0x00, 0x05, 0x07
	.byte 0x02, 0x02, 0x88, 0x35, 0xFA, 0x06, 0xFA, 0x06, 0x07, 0x00, 0x06, 0x04, 0x03, 0x08, 0x90, 0x34
	.byte 0x06, 0x50, 0xFA, 0x06, 0x08, 0x00, 0xFF, 0xFF, 0x07, 0x03, 0xD0, 0x54, 0xF0, 0x10, 0xF7, 0x03
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x01, 0x1A, 0x04
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x01, 0x16, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x98, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x80, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x60, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x1C, 0x00, 0x01, 0x00, 0x40, 0x00, 0x16, 0x0A, 0x10, 0x07
	.byte 0xFF, 0x00, 0x00, 0x00, 0x98, 0xB8, 0xC2, 0xFE, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x10, 0x01, 0x16
	.byte 0x01, 0x07, 0x01, 0x0A, 0x08, 0x98, 0x08, 0xC8, 0x10, 0x90, 0x28, 0xE0, 0x10, 0x40, 0xD8, 0xF8
	.byte 0x58, 0x98, 0xD8, 0xF8, 0xFF, 0x00, 0x00, 0x00, 0x18, 0x2C, 0x18, 0x28, 0x18, 0x2C, 0x80, 0x90
	.byte 0x2C, 0x40, 0x18, 0x28, 0x2C, 0x40, 0x80, 0x90, 0xFF, 0x00, 0x00, 0x00, 0x18, 0x2C, 0x18, 0x28
	.byte 0x18, 0x2C, 0x80, 0x90, 0x2C, 0x40, 0x18, 0x28, 0x2C, 0x40, 0x80, 0x90, 0x18, 0x2C, 0x28, 0x80
	.byte 0x18, 0x2C, 0x90, 0xE8, 0x2C, 0x40, 0x28, 0x80, 0x2C, 0x40, 0x90, 0xE8, 0x44, 0x60, 0x2C, 0x64
	.byte 0xFF, 0x00, 0x00, 0x00, 0x18, 0x2C, 0x18, 0x28, 0x18, 0x2C, 0x28, 0x80, 0x18, 0x2C, 0x80, 0x90
	.byte 0x18, 0x2C, 0x90, 0xE8, 0x2C, 0x40, 0x18, 0x28, 0x2C, 0x40, 0x28, 0x80, 0x2C, 0x40, 0x80, 0x90
	.byte 0x2C, 0x40, 0x90, 0xE8, 0x7C, 0x8C, 0x20, 0x30, 0x7C, 0x8C, 0x38, 0x48, 0x7C, 0x8C, 0x50, 0x60
	.byte 0x7C, 0x8C, 0x68, 0x78, 0x7C, 0x8C, 0x80, 0x90, 0x7C, 0x8C, 0x98, 0xA8, 0x7C, 0x8C, 0xB0, 0xC0
	.byte 0x7C, 0x8C, 0xC8, 0xD8, 0x40, 0x68, 0xC0, 0xE8, 0xFF, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x1D, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x01, 0x08, 0x05, 0x03, 0x01, 0xF0, 0x03, 0x05, 0x03, 0x0B, 0x0C
	.byte 0x02, 0x01, 0xD8, 0x03, 0x05, 0x01, 0x0E, 0x1C, 0x04, 0x01, 0x68, 0x03, 0x05, 0x05, 0x12, 0x0B
	.byte 0x05, 0x01, 0x31, 0x03, 0x05, 0x12, 0x12, 0x0B, 0x05, 0x01, 0xFA, 0x02, 0x05, 0x05, 0x14, 0x0B
	.byte 0x02, 0x01, 0xE4, 0x02, 0x05, 0x12, 0x16, 0x0B, 0x02, 0x01, 0xCE, 0x02, 0x00, 0x00, 0x15, 0x19
	.byte 0x02, 0x0A, 0x5C, 0x00, 0x00, 0x19, 0x15, 0x06, 0x02, 0x0A, 0x8E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x01, 0x1A, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x01, 0x16, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x90, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x60, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x60, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01
	.byte 0x03, 0x03, 0x30, 0x2C, 0xEA, 0x16, 0xEE, 0x12, 0x01, 0x00, 0x00, 0x02, 0x04, 0x04, 0x80, 0x2C
	.byte 0xEA, 0x16, 0xEE, 0x12, 0x02, 0x00, 0x01, 0x00, 0x05, 0x05, 0xD0, 0x2C, 0xEA, 0x16, 0xEE, 0x12
	.byte 0x03, 0x00, 0x05, 0x04, 0x00, 0x00, 0x30, 0x74, 0xEA, 0x16, 0xEE, 0x12, 0x04, 0x00, 0x03, 0x05
	.byte 0x01, 0x01, 0x80, 0x74, 0xEA, 0x16, 0xEE, 0x12, 0x05, 0x00, 0x04, 0x03, 0x02, 0x02, 0xD0, 0x74
	.byte 0xEA, 0x16, 0xEE, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x0A, 0x01, 0x01, 0x1C, 0x00, 0x01, 0x00, 0x40, 0x00
	.byte 0x0A, 0x02, 0x00, 0x14, 0x02, 0x00, 0x16, 0x02, 0x02, 0x0A, 0x0B, 0x00, 0x14, 0x0B, 0x00, 0x16
	.byte 0x0B, 0x02, 0x00, 0x00, 0x18, 0x40, 0x18, 0x48, 0x18, 0x40, 0x68, 0x98, 0x18, 0x40, 0xB8, 0xE8
	.byte 0x60, 0x88, 0x18, 0x48, 0x60, 0x88, 0x68, 0x98, 0x60, 0x88, 0xB8, 0xE8, 0xFF, 0x00, 0x00, 0x00
	.byte 0x88, 0xB8, 0x08, 0xF8, 0x83, 0x00, 0x0D, 0x09, 0x85, 0x03, 0x0D, 0x03, 0xB2, 0x08, 0x07, 0x0B
	.byte 0xB2, 0x0A, 0x07, 0x0B, 0xB3, 0x0C, 0x07, 0x09, 0xB2, 0x0F, 0x07, 0x0B, 0x82, 0x12, 0x0D, 0x0B
	.byte 0x06, 0x02, 0x13, 0x1B, 0x04, 0x01, 0x75, 0x03, 0x06, 0x04, 0x10, 0x09, 0x02, 0x01, 0x63, 0x03
	.byte 0x03, 0x01, 0x02, 0x1B, 0x18, 0x02, 0x77, 0x01, 0x01, 0x00, 0x15, 0x20, 0x02, 0x0A, 0xBF, 0x03
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x9C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x0D, 0x00, 0x00, 0x04, 0x03
	.byte 0xA4, 0x03, 0xA0, 0x00, 0x08, 0x20, 0x08, 0xE0, 0x20, 0x38, 0x08, 0xE0, 0x38, 0x50, 0x08, 0xE0
	.byte 0x50, 0x68, 0x08, 0xE0, 0x68, 0x80, 0x08, 0xE0, 0x80, 0x98, 0x08, 0xE0, 0x08, 0x50, 0xE0, 0xF8
	.byte 0x50, 0x98, 0xE0, 0xF8, 0xFF, 0x00, 0x00, 0x00, 0x08, 0x18, 0x04, 0x24, 0x20, 0x30, 0x04, 0x24
	.byte 0x38, 0x48, 0x04, 0x24, 0x50, 0x60, 0x04, 0x24, 0x68, 0x78, 0x04, 0x24, 0x80, 0x90, 0x04, 0x24
	.byte 0x08, 0x50, 0xE0, 0xF8, 0x50, 0x98, 0xE0, 0xF8, 0xFF, 0x00, 0x00, 0x00, 0x81, 0x26, 0x1F, 0x02
	.byte 0x51, 0x2F, 0x1F, 0x02, 0xFD, 0x2F, 0x1F, 0x02, 0xED, 0x35, 0x1F, 0x02, 0x49, 0x28, 0x1F, 0x02
	.byte 0x3D, 0x31, 0x1F, 0x02, 0xFD, 0x38, 0x1F, 0x02, 0x99, 0x37, 0x1F, 0x02, 0x21, 0x3B, 0x1F, 0x02
	.byte 0xA1, 0x3B, 0x1F, 0x02, 0xC1, 0x3C, 0x1F, 0x02, 0xC9, 0x3D, 0x1F, 0x02, 0x49, 0x34, 0x1F, 0x02
	.byte 0x11, 0x3F, 0x1F, 0x02, 0x65, 0x40, 0x1F, 0x02, 0xB9, 0x41, 0x1F, 0x02, 0x00, 0x02, 0x00, 0x03
	.byte 0x00, 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x00, 0x66, 0x00, 0x65, 0x00, 0x09, 0x00, 0x0A, 0x00
	.byte 0x0B, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x11, 0x00, 0x12, 0x00
	.byte 0x13, 0x00, 0x14, 0x00, 0x15, 0x00, 0x16, 0x00, 0x17, 0x00, 0x18, 0x00, 0x19, 0x00, 0x1A, 0x00
	.byte 0x5B, 0x00, 0x5C, 0x00, 0x5D, 0x00, 0x1B, 0x00, 0x1C, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00
	.byte 0x20, 0x00, 0x21, 0x00, 0x22, 0x00, 0x23, 0x00, 0x24, 0x00, 0x25, 0x00, 0x26, 0x00, 0x27, 0x00
	.byte 0x28, 0x00, 0x29, 0x00, 0x2A, 0x00, 0x2B, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x2C, 0x00, 0x2D, 0x00
	.byte 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x97, 0x00, 0x98, 0x00, 0x31, 0x00, 0x32, 0x00, 0x33, 0x00
	.byte 0x34, 0x00, 0x35, 0x00, 0x36, 0x00, 0x37, 0x00, 0x38, 0x00, 0x39, 0x00, 0x3A, 0x00, 0x3B, 0x00
	.byte 0x3C, 0x00, 0x43, 0x00, 0x49, 0x00, 0x4A, 0x00, 0x4B, 0x00, 0x4C, 0x00, 0x4D, 0x00, 0x4E, 0x00
	.byte 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A, 0x00, 0x60, 0x00, 0x71, 0x00, 0xAE, 0x00, 0x00, 0x00
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x02, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x03
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x11, 0x00, 0x00
	.byte 0x3B, 0x01, 0x43, 0x01, 0xEA, 0x01, 0xEB, 0x01, 0xEC, 0x01, 0x57, 0x00, 0x85, 0x00, 0x8C, 0x00
	.byte 0x8C, 0x01, 0x8D, 0x01, 0xF6, 0x00, 0x70, 0x01, 0x74, 0x00, 0xF7, 0x00, 0xF8, 0x00, 0xF9, 0x00
	.byte 0x2D, 0x00, 0x8E, 0x00, 0xF5, 0x00, 0x58, 0x00, 0x26, 0x01, 0x27, 0x01, 0x06, 0x02, 0x13, 0x1C
	.byte 0x04, 0x00, 0x8F, 0x03, 0x06, 0x04, 0x10, 0x0E, 0x02, 0x00, 0x73, 0x03, 0x01, 0x05, 0x01, 0x16
	.byte 0x02, 0x00, 0xD3, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFE, 0x80, 0x5C, 0x34, 0xFE, 0x80, 0x5C, 0x26
	.byte 0xFE, 0x80, 0x5C, 0x34, 0xFF, 0x00, 0x00, 0x00, 0xFE, 0x80, 0x5C, 0x04, 0xFE, 0x80, 0x5C, 0x10
	.byte 0xFF, 0x00, 0x00, 0x00, 0x30, 0x4C, 0x10, 0x30, 0x30, 0x4C, 0xD0, 0xF0, 0x70, 0x8C, 0x10, 0x30
	.byte 0x70, 0x8C, 0xD0, 0xF0, 0xFF, 0x00, 0x00, 0x00, 0xFE, 0x70, 0x4C, 0x04, 0xFE, 0x70, 0x4C, 0x10
	.byte 0xFE, 0x98, 0x4C, 0x04, 0xFE, 0x98, 0x4C, 0x14, 0xFE, 0x60, 0x6C, 0x04, 0xFE, 0x60, 0x6C, 0x10
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFE, 0x70, 0x4C, 0x04, 0xFE, 0x70, 0x4C, 0x10, 0xFE, 0x98, 0x4C, 0x04
	.byte 0xFE, 0x98, 0x4C, 0x14, 0xFE, 0x60, 0x6C, 0x04, 0xFE, 0x60, 0x6C, 0x10, 0xFE, 0x88, 0x74, 0x04
	.byte 0xFE, 0x88, 0x74, 0x14, 0xFF, 0x00, 0x00, 0x00, 0xFE, 0x70, 0x4C, 0x04, 0xFE, 0x70, 0x4C, 0x10
	.byte 0xFE, 0x98, 0x4C, 0x04, 0xFE, 0x98, 0x4C, 0x14, 0xFE, 0x60, 0x6C, 0x04, 0xFE, 0x60, 0x6C, 0x10
	.byte 0xFE, 0x88, 0x74, 0x04, 0xFE, 0x88, 0x74, 0x14, 0xFE, 0x80, 0x30, 0x04, 0xFE, 0x80, 0x30, 0x08
	.byte 0xFF, 0x00, 0x00, 0x00, 0x41, 0x5F, 0x1F, 0x02, 0x61, 0x60, 0x1F, 0x02, 0x41, 0x60, 0x1F, 0x02
	.byte 0x3D, 0x6D, 0x1F, 0x02, 0x99, 0x6D, 0x1F, 0x02, 0x79, 0x6D, 0x1F, 0x02, 0x21, 0x66, 0x1F, 0x02
	.byte 0x79, 0x66, 0x1F, 0x02, 0x59, 0x66, 0x1F, 0x02, 0x2D, 0x63, 0x1F, 0x02, 0x8D, 0x63, 0x1F, 0x02
	.byte 0x65, 0x63, 0x1F, 0x02, 0x0D, 0x68, 0x1F, 0x02, 0x61, 0x68, 0x1F, 0x02, 0x41, 0x68, 0x1F, 0x02
	.byte 0xAD, 0x6B, 0x1F, 0x02, 0x05, 0x6C, 0x1F, 0x02, 0xE5, 0x6B, 0x1F, 0x02, 0xA9, 0x69, 0x1F, 0x02
	.byte 0x01, 0x6A, 0x1F, 0x02, 0xE1, 0x69, 0x1F, 0x02, 0x49, 0x61, 0x1F, 0x02, 0xA1, 0x61, 0x1F, 0x02
	.byte 0x81, 0x61, 0x1F, 0x02, 0xD9, 0x61, 0x1F, 0x02, 0x31, 0x62, 0x1F, 0x02, 0x11, 0x62, 0x1F, 0x02
	.byte 0x69, 0x62, 0x1F, 0x02, 0xC5, 0x62, 0x1F, 0x02, 0xA5, 0x62, 0x1F, 0x02, 0xC5, 0x72, 0x1F, 0x02
	.byte 0x21, 0x73, 0x1F, 0x02, 0x01, 0x73, 0x1F, 0x02, 0x7D, 0x64, 0x1F, 0x02, 0xD1, 0x64, 0x1F, 0x02
	.byte 0xB1, 0x64, 0x1F, 0x02, 0x4C, 0x04, 0x4B, 0x04, 0x91, 0x04, 0x92, 0x04, 0xC2, 0x04, 0xC4, 0x04
	.byte 0xCC, 0x04, 0xCD, 0x04, 0x1A, 0x05, 0x25, 0x05, 0x26, 0x05, 0x27, 0x05, 0x28, 0x05, 0x29, 0x05
	.byte 0x2A, 0x05, 0x2B, 0x05, 0x2C, 0x05, 0x2D, 0x05, 0x2E, 0x05, 0x2F, 0x05, 0x34, 0x05, 0x24, 0x05
	.byte 0x1E, 0x05, 0x23, 0x05, 0x20, 0x05, 0x1F, 0x05, 0x22, 0x05, 0xC6, 0x04, 0xFF, 0x04, 0x00, 0x00
	.byte 0x00, 0x03, 0xFF, 0x00, 0x03, 0xFF, 0x00, 0x03, 0xFF, 0x00, 0x03, 0xFF, 0x00, 0x03, 0xFF, 0x00
	.byte 0x01, 0xFF, 0x00, 0x01, 0xFF, 0x00, 0x01, 0xFF, 0x00, 0x01, 0xFF, 0x00, 0x03, 0x02, 0x00, 0x03
	.byte 0x02, 0x01, 0x03, 0xFF, 0x01, 0x03, 0xFF, 0x01, 0x03, 0xFF, 0x01, 0x03, 0xFF, 0x02, 0x01, 0x03
	.byte 0x02, 0x01, 0x03, 0x02, 0x01, 0x03, 0x02, 0x01, 0x02, 0x02, 0x01, 0x02, 0x02, 0x03, 0x02, 0x03
	.byte 0x03, 0x02, 0x03, 0x01, 0x03, 0x04, 0x03, 0x01, 0x04, 0x03, 0x01, 0x04, 0x03, 0x01, 0x04, 0x03
	.byte 0x01, 0x04, 0x03, 0x01, 0x04, 0x03, 0x01, 0x05, 0x03, 0x03, 0x06, 0x02, 0x03, 0x06, 0x02, 0x03
	.byte 0x06, 0x02, 0x03, 0x06, 0x02, 0x03, 0x06, 0x02, 0x03, 0x07, 0x03, 0x03, 0x00, 0x00, 0x01, 0x02
	.byte 0x03, 0x04, 0x05, 0x06, 0x06, 0x06, 0x07, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x01, 0x02, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04
	.byte 0xC1, 0x01, 0x01, 0x02, 0xE7, 0x01, 0x3B, 0x01, 0xEA, 0x01, 0xEB, 0x01, 0xEC, 0x01, 0xED, 0x00
	.byte 0xEE, 0x00, 0xEF, 0x00, 0xF2, 0x00, 0xF3, 0x00, 0x2A, 0x01, 0x65, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x21, 0x22, 0x00, 0x00, 0x00, 0x00, 0x23, 0x24
	.byte 0x00, 0x00, 0x00, 0x00, 0x25, 0x26, 0x00, 0x00, 0x00, 0x00, 0x27, 0x28, 0x00, 0x00, 0x00, 0x00
	.byte 0x29, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x2B, 0x2C, 0x00, 0x00, 0x00, 0x00, 0x03, 0x04, 0x00, 0x00
	.byte 0x00, 0x00, 0x05, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0E, 0x00, 0x00, 0x00, 0x00
	.byte 0x0F, 0x10, 0x00, 0x00, 0x00, 0x00, 0x11, 0x12, 0x00, 0x00, 0x00, 0x00, 0x13, 0x14, 0x00, 0x00
	.byte 0x00, 0x00, 0x15, 0x16, 0x00, 0x00, 0x00, 0x00, 0x17, 0x18, 0x00, 0x00, 0x00, 0x00, 0x19, 0x1A
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x1D, 0x1E, 0x00, 0x00, 0x00, 0x00
	.byte 0x1F, 0x20, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x03, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x1D, 0x1D
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x16, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00
	.byte 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D
	.byte 0x14, 0x00, 0x95, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x10, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00
	.byte 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x15, 0x15, 0x00, 0x00
	.byte 0x00, 0x00, 0x13, 0x13, 0x13, 0x00, 0x00, 0x00, 0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x95, 0x00, 0x17, 0x00, 0x16, 0x16, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x03, 0x03, 0x12, 0x00, 0x89, 0x09
	.byte 0x04, 0x04, 0x12, 0x00, 0x8A, 0x09, 0x05, 0x05, 0x12, 0x00, 0x8B, 0x09, 0x06, 0x06, 0x12, 0x00
	.byte 0x8C, 0x09, 0x07, 0x07, 0x12, 0x00, 0x8D, 0x09, 0x08, 0x08, 0x12, 0x00, 0x8E, 0x09, 0x09, 0x09
	.byte 0x12, 0x00, 0x8F, 0x09, 0x0A, 0x0A, 0x12, 0x00, 0x90, 0x09, 0x0B, 0x0B, 0x12, 0x00, 0x91, 0x09
	.byte 0x16, 0x17, 0x00, 0x00, 0x00, 0x00, 0x18, 0x19, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x1A, 0x00, 0x00
	.byte 0x00, 0x00, 0x1B, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x03, 0x03, 0x12, 0x00, 0x84, 0x09
	.byte 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00
	.byte 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0B, 0x12, 0x00, 0x85, 0x09
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x12, 0x00, 0x92, 0x09, 0x0D, 0x0D, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0E
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x03, 0x03, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x03, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00
	.byte 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x15, 0x15, 0x13, 0x00, 0x00, 0x00
	.byte 0x16, 0x17, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x00, 0x00, 0x00, 0x00, 0x14, 0x14, 0x13, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00
	.byte 0x15, 0x15, 0x00, 0x00, 0x00, 0x00, 0x16, 0x16, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00
	.byte 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x15, 0x15, 0x13, 0x00, 0x00, 0x00
	.byte 0x16, 0x16, 0x00, 0x00, 0x00, 0x00, 0x17, 0x17, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x13, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00
	.byte 0x00, 0x00, 0x08, 0x08, 0x13, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x09, 0x00, 0x00
	.byte 0x00, 0x00, 0x0A, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x1B
	.byte 0x00, 0x00, 0x00, 0x00, 0x1C, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x1F, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x21, 0x00, 0x00, 0x00, 0x00, 0x22, 0x23, 0x00, 0x00, 0x00, 0x00, 0x24, 0x25, 0x00, 0x00
	.byte 0x00, 0x00, 0x26, 0x27, 0x00, 0x00, 0x00, 0x00, 0x28, 0x29, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x09, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x0F, 0x00, 0x00
	.byte 0x00, 0x00, 0x10, 0x11, 0x00, 0x00, 0x00, 0x00, 0x12, 0x13, 0x00, 0x00, 0x00, 0x00, 0x14, 0x15
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x17, 0x00, 0x00, 0x00, 0x00, 0x18, 0x19, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x1F, 0x00, 0x00
	.byte 0x00, 0x00, 0x20, 0x21, 0x00, 0x00, 0x00, 0x00, 0x22, 0x23, 0x00, 0x00, 0x00, 0x00, 0x24, 0x25
	.byte 0x00, 0x00, 0x00, 0x00, 0x26, 0x26, 0x00, 0x00, 0x00, 0x00, 0x27, 0x27, 0x00, 0x00, 0x00, 0x00
	.byte 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0C, 0x00, 0x00
	.byte 0x00, 0x00, 0x0D, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0B, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00
	.byte 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00
	.byte 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x14, 0x00
	.byte 0x5C, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D, 0x00, 0x00
	.byte 0x00, 0x00, 0x0E, 0x0E, 0x14, 0x00, 0x5B, 0x00, 0x0F, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00
	.byte 0x00, 0x00, 0x0D, 0x0D, 0x14, 0x00, 0x55, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0F
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x14, 0x00, 0x52, 0x00, 0x0D, 0x0D
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x14, 0x00, 0x53, 0x00, 0x0D, 0x0D
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x14, 0x00
	.byte 0x5C, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x0C, 0x0C, 0x14, 0x00, 0x54, 0x00, 0x0D, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0B, 0x13, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x07, 0x08, 0x65, 0x00
	.byte 0x10, 0x00, 0x0D, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x0E, 0x14, 0x00, 0x3F, 0x00, 0x0F, 0x0F
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x14, 0x00, 0x04, 0x00, 0x0D, 0x0D
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00
	.byte 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D, 0x14, 0x00
	.byte 0x95, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00
	.byte 0x00, 0x00, 0x0D, 0x0D, 0x14, 0x00, 0x95, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00
	.byte 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00
	.byte 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A
	.byte 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00
	.byte 0x0D, 0x0D, 0x14, 0x00, 0x50, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00
	.byte 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D, 0x14, 0x00, 0x6B, 0x00, 0x0E, 0x0E, 0x00, 0x00
	.byte 0x00, 0x00, 0x05, 0x05, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x13, 0x00, 0x00, 0x00
	.byte 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x11, 0x11, 0x13, 0x00, 0x00, 0x00, 0x12, 0x12
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0x13, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00
	.byte 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C
	.byte 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D, 0x14, 0x00, 0x6E, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0D, 0x14, 0x00, 0x6C, 0x00
	.byte 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00
	.byte 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A
	.byte 0x13, 0x00, 0x00, 0x00, 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00
	.byte 0x0D, 0x0D, 0x14, 0x00, 0x6D, 0x00, 0x0E, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x08, 0x08
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x09, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x13, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03
	.byte 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13
	.byte 0x14, 0x15, 0x16, 0x17, 0x48, 0x48, 0x49, 0x49, 0x4A, 0x4A, 0x48, 0x48, 0x49, 0x49, 0x4A, 0x4A
	.byte 0x4B, 0x4B, 0x4C, 0x4C, 0x4D, 0x4D, 0x4B, 0x4B, 0x4C, 0x4C, 0x4D, 0x4D, 0x18, 0x19, 0x1A, 0x1B
	.byte 0x1C, 0x1D, 0x1E, 0x1F, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x2B
	.byte 0x2C, 0x2D, 0x2E, 0x2F, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x3B
	.byte 0x3C, 0x3D, 0x3E, 0x3F, 0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x22, 0x00, 0x03, 0x64, 0x00, 0x00, 0x21, 0x00, 0x01, 0x64, 0x01, 0x00, 0x23, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x3C, 0x00, 0x00
	.byte 0x21, 0x00, 0x01, 0x28, 0x01, 0x00, 0x1E, 0x00, 0x01, 0x28, 0x01, 0x00, 0x1F, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0x20, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x33, 0x00, 0x03, 0x64, 0x00, 0x00, 0x32, 0x00, 0x01, 0x64, 0x00, 0x00, 0x34, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0x32, 0x00, 0x01, 0x28, 0x01, 0x00, 0x2F, 0x00, 0x01, 0x28, 0x01, 0x00, 0x30, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0x31, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x3A, 0x00, 0x03, 0x64, 0x00, 0x00, 0x39, 0x00, 0x01, 0x1E, 0x01, 0x00, 0x3C, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x19, 0x00, 0x00
	.byte 0x38, 0x00, 0x02, 0x19, 0x00, 0x00, 0x39, 0x00, 0x01, 0x64, 0x02, 0x00, 0x3B, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x29, 0x00, 0x08, 0x64, 0x00, 0x00, 0x2C, 0x00, 0x03, 0x64, 0x00, 0x00, 0x28, 0x00, 0x04, 0x64
	.byte 0x00, 0x00, 0x2D, 0x00, 0x01, 0x64, 0x00, 0x00, 0x2A, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0x2C, 0x00, 0x07, 0x64, 0x00, 0x00, 0x29, 0x00, 0x02, 0x32, 0x00, 0x00, 0x2B, 0x00, 0x02, 0x32
	.byte 0x00, 0x00, 0x28, 0x00, 0x01, 0x28, 0x01, 0x00, 0x26, 0x00, 0x01, 0x28, 0x01, 0x00, 0x27, 0x00
	.byte 0x01, 0x64, 0x01, 0x00, 0x25, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x42, 0x00, 0x03, 0x64, 0x00, 0x00, 0x41, 0x00, 0x01, 0x64, 0x00, 0x00, 0x43, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0x41, 0x00, 0x01, 0x28, 0x01, 0x00, 0x3E, 0x00, 0x01, 0x28, 0x01, 0x00, 0x3F, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0x40, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x6E, 0x00, 0x03, 0x64, 0x00, 0x00, 0x6D, 0x00, 0x01, 0x64, 0x00, 0x00, 0x6F, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x19, 0x00, 0x00
	.byte 0x6D, 0x00, 0x01, 0x64, 0x02, 0x00, 0x6C, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x76, 0x00, 0x03, 0x64, 0x00, 0x00, 0x74, 0x00, 0x01, 0x64, 0x00, 0x00, 0x77, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x19, 0x00, 0x00
	.byte 0x74, 0x00, 0x01, 0x64, 0x02, 0x00, 0x75, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x7E, 0x00, 0x03, 0x64, 0x00, 0x00, 0x7D, 0x00, 0x01, 0x64, 0x00, 0x00, 0x7F, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x19, 0x00, 0x00
	.byte 0x7D, 0x00, 0x01, 0x64, 0x02, 0x00, 0x7C, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x84, 0x00, 0x03, 0x64, 0x00, 0x00, 0x83, 0x00, 0x01, 0x64, 0x00, 0x00, 0x85, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0x83, 0x00, 0x01, 0x32, 0x01, 0x00, 0x81, 0x00, 0x01, 0x64, 0x01, 0x00, 0x82, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x8A, 0x00, 0x03, 0x64, 0x00, 0x00, 0x89, 0x00, 0x01, 0x64, 0x00, 0x00, 0x8B, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0x89, 0x00, 0x01, 0x32, 0x01, 0x00, 0x87, 0x00, 0x01, 0x64, 0x01, 0x00, 0x88, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xC2, 0x00, 0x03, 0x64, 0x00, 0x00, 0xC1, 0x00, 0x01, 0x64, 0x00, 0x00, 0xC3, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x3C, 0x00, 0x00
	.byte 0xC1, 0x00, 0x01, 0x32, 0x01, 0x00, 0xBF, 0x00, 0x01, 0x64, 0x01, 0x00, 0xC0, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xC9, 0x00, 0x03, 0x64, 0x00, 0x00, 0xC8, 0x00, 0x01, 0x64, 0x00, 0x00, 0xCA, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0xC8, 0x00, 0x01, 0x28, 0x01, 0x00, 0xC5, 0x00, 0x01, 0x28, 0x01, 0x00, 0xC6, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0xC7, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xD0, 0x00, 0x03, 0x64, 0x00, 0x00, 0xCF, 0x00, 0x01, 0x64, 0x00, 0x00, 0xD1, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0xCF, 0x00, 0x01, 0x28, 0x01, 0x00, 0xCC, 0x00, 0x01, 0x28, 0x01, 0x00, 0xCD, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0xCE, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xD7, 0x00, 0x03, 0x64, 0x00, 0x00, 0xD6, 0x00, 0x01, 0x64, 0x00, 0x00, 0xD8, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0xD6, 0x00, 0x01, 0x1E, 0x01, 0x00, 0xD3, 0x00, 0x01, 0x1E, 0x01, 0x00, 0xD4, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0xD5, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xDD, 0x00, 0x03, 0x64, 0x00, 0x00, 0xDC, 0x00, 0x01, 0x64, 0x00, 0x00, 0xDE, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x3C, 0x00, 0x00
	.byte 0xDC, 0x00, 0x01, 0x32, 0x01, 0x00, 0xDA, 0x00, 0x01, 0x64, 0x01, 0x00, 0xDB, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xE3, 0x00, 0x03, 0x32, 0x00, 0x00, 0xE2, 0x00, 0x01, 0x64, 0x00, 0x00, 0xE4, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x3C, 0x00, 0x00
	.byte 0xE2, 0x00, 0x01, 0x32, 0x01, 0x00, 0xE0, 0x00, 0x01, 0x64, 0x01, 0x00, 0xE1, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xEA, 0x00, 0x03, 0x32, 0x00, 0x00, 0xE9, 0x00, 0x01, 0x64, 0x00, 0x00, 0xEB, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x3C, 0x00, 0x00
	.byte 0xE9, 0x00, 0x01, 0x28, 0x01, 0x00, 0xE7, 0x00, 0x01, 0x28, 0x01, 0x00, 0xE8, 0x00, 0x01, 0x64
	.byte 0x01, 0x00, 0xE6, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0xF1, 0x00, 0x01, 0x64, 0x00, 0x00, 0xEF, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x19, 0x00, 0x00
	.byte 0xF0, 0x00, 0x01, 0x32, 0x01, 0x00, 0xED, 0x00, 0x01, 0x64, 0x01, 0x00, 0xEE, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xF7, 0x00, 0x08, 0x64, 0x00, 0x00, 0xFA, 0x00, 0x03, 0x64, 0x00, 0x00, 0xF6, 0x00, 0x01, 0x64
	.byte 0x00, 0x00, 0xF8, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xF7, 0x00, 0x08, 0x64, 0x00, 0x00, 0xFA, 0x00, 0x02, 0x1E, 0x00, 0x00, 0xF9, 0x00, 0x02, 0x1E
	.byte 0x00, 0x00, 0xF6, 0x00, 0x01, 0x1E, 0x01, 0x00, 0xF4, 0x00, 0x01, 0x1E, 0x01, 0x00, 0xF5, 0x00
	.byte 0x01, 0x64, 0x01, 0x00, 0xF3, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x64, 0x00, 0x00
	.byte 0x03, 0x01, 0x07, 0x64, 0x00, 0x00, 0xFF, 0x00, 0x08, 0x64, 0x00, 0x00, 0x02, 0x01, 0x03, 0x64
	.byte 0x00, 0x00, 0xFE, 0x00, 0x01, 0x64, 0x00, 0x00, 0x00, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x64, 0x00, 0x00
	.byte 0x03, 0x01, 0x07, 0x64, 0x00, 0x00, 0xFF, 0x00, 0x08, 0x64, 0x00, 0x00, 0x02, 0x01, 0x02, 0x1E
	.byte 0x00, 0x00, 0xFE, 0x00, 0x02, 0x0A, 0x00, 0x00, 0x01, 0x01, 0x01, 0x32, 0x01, 0x00, 0xFC, 0x00
	.byte 0x01, 0x64, 0x01, 0x00, 0xFD, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x08, 0x01, 0x08, 0x64, 0x00, 0x00, 0x0B, 0x01, 0x03, 0x64, 0x00, 0x00, 0x07, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x09, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0A, 0x00, 0x00
	.byte 0x0A, 0x01, 0x02, 0x1E, 0x00, 0x00, 0x07, 0x01, 0x01, 0x32, 0x01, 0x00, 0x06, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x05, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x10, 0x01, 0x08, 0x64, 0x00, 0x00, 0x13, 0x01, 0x03, 0x64, 0x00, 0x00, 0x0F, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x11, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0A, 0x00, 0x00
	.byte 0x12, 0x01, 0x02, 0x1E, 0x00, 0x00, 0x0F, 0x01, 0x07, 0x64, 0x00, 0x00, 0x10, 0x01, 0x08, 0x64
	.byte 0x00, 0x00, 0x13, 0x01, 0x01, 0x32, 0x01, 0x00, 0x0D, 0x01, 0x01, 0x64, 0x01, 0x00, 0x0E, 0x01
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0x19, 0x01, 0x04, 0x64, 0x00, 0x00, 0x1A, 0x01, 0x01, 0x64, 0x00, 0x00, 0x17, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x19, 0x00, 0x00
	.byte 0x18, 0x01, 0x04, 0x64, 0x00, 0x00, 0x1A, 0x01, 0x01, 0x32, 0x01, 0x00, 0x15, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x16, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x1F, 0x01, 0x08, 0x64, 0x00, 0x00, 0x22, 0x01, 0x03, 0x64, 0x00, 0x00, 0x1E, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x20, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x1E, 0x01, 0x02, 0x0A, 0x00, 0x00, 0x21, 0x01, 0x01, 0x32, 0x01, 0x00, 0x1C, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x1D, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0x2B, 0x01, 0x07, 0x64, 0x00, 0x00, 0x27, 0x01, 0x03, 0x64, 0x00, 0x00, 0x26, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x29, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x19, 0x00, 0x00
	.byte 0x28, 0x01, 0x02, 0x1E, 0x00, 0x00, 0x26, 0x01, 0x02, 0x0A, 0x00, 0x00, 0x2A, 0x01, 0x01, 0x32
	.byte 0x01, 0x00, 0x24, 0x01, 0x01, 0x64, 0x01, 0x00, 0x25, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x30, 0x01, 0x08, 0x64, 0x00, 0x00, 0x33, 0x01, 0x03, 0x64, 0x00, 0x00, 0x2F, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x31, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x32, 0x00, 0x00
	.byte 0x2F, 0x01, 0x02, 0x32, 0x00, 0x00, 0x32, 0x01, 0x01, 0x32, 0x01, 0x00, 0x2D, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x2E, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x39, 0x01, 0x03, 0x64, 0x00, 0x00, 0x38, 0x01, 0x01, 0x64, 0x00, 0x00, 0x3A, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x38, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x35, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x36, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x37, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x40, 0x01, 0x03, 0x64, 0x00, 0x00, 0x3F, 0x01, 0x01, 0x64, 0x00, 0x00, 0x41, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x3F, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x3C, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x3D, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x3E, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x47, 0x01, 0x03, 0x64, 0x00, 0x00, 0x46, 0x01, 0x04, 0x64, 0x00, 0x00, 0x49, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x48, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x32, 0x00, 0x00
	.byte 0x49, 0x01, 0x02, 0x1E, 0x00, 0x00, 0x46, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x43, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0x44, 0x01, 0x01, 0x64, 0x01, 0x00, 0x45, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x4F, 0x01, 0x03, 0x64, 0x00, 0x00, 0x4E, 0x01, 0x01, 0x64, 0x00, 0x00, 0x50, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x4E, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x4B, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x4C, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x4D, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x56, 0x01, 0x08, 0x64, 0x00, 0x00, 0x59, 0x01, 0x03, 0x64, 0x00, 0x00, 0x55, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x57, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x55, 0x01, 0x02, 0x32, 0x00, 0x00, 0x58, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x52, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0x53, 0x01, 0x01, 0x64, 0x01, 0x00, 0x54, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x5F, 0x01, 0x08, 0x64, 0x00, 0x00, 0x62, 0x01, 0x03, 0x64, 0x00, 0x00, 0x5E, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x60, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x5E, 0x01, 0x02, 0x32, 0x00, 0x00, 0x61, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x5B, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0x5C, 0x01, 0x01, 0x64, 0x01, 0x00, 0x5D, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x68, 0x01, 0x03, 0x64, 0x00, 0x00, 0x67, 0x01, 0x01, 0x64, 0x00, 0x00, 0x69, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x67, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x64, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x65, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x66, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x6F, 0x01, 0x03, 0x64, 0x00, 0x00, 0x6E, 0x01, 0x01, 0x64, 0x00, 0x00, 0x70, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x6E, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x6B, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x6C, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x6D, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x76, 0x01, 0x03, 0x64, 0x00, 0x00, 0x75, 0x01, 0x01, 0x64, 0x00, 0x00, 0x77, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x75, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x72, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x73, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x74, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x7D, 0x01, 0x03, 0x64, 0x00, 0x00, 0x7C, 0x01, 0x01, 0x64, 0x00, 0x00, 0x7E, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x7C, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x79, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x7A, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x7B, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0x87, 0x01, 0x07, 0x64, 0x00, 0x00, 0x84, 0x01, 0x03, 0x64, 0x00, 0x00, 0x83, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x85, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x83, 0x01, 0x02, 0x0A, 0x00, 0x00, 0x86, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x80, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0x81, 0x01, 0x01, 0x64, 0x01, 0x00, 0x82, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0x90, 0x01, 0x07, 0x64, 0x00, 0x00, 0x8D, 0x01, 0x03, 0x64, 0x00, 0x00, 0x8C, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0x8E, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x8C, 0x01, 0x02, 0x0A, 0x00, 0x00, 0x8F, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x89, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0x8A, 0x01, 0x01, 0x64, 0x01, 0x00, 0x8B, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x96, 0x01, 0x03, 0x64, 0x00, 0x00, 0x95, 0x01, 0x01, 0x64, 0x00, 0x00, 0x97, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0x95, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x92, 0x01, 0x01, 0x1E, 0x01, 0x00, 0x93, 0x01, 0x01, 0x64
	.byte 0x01, 0x00, 0x94, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0x9E, 0x01, 0x03, 0x64, 0x00, 0x00, 0x9D, 0x01, 0x01, 0x64, 0x00, 0x00, 0x9F, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x19, 0x00, 0x00
	.byte 0x99, 0x01, 0x02, 0x1E, 0x00, 0x00, 0x9D, 0x01, 0x01, 0x14, 0x01, 0x00, 0x9A, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0x9B, 0x01, 0x01, 0x64, 0x01, 0x00, 0x9C, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xA3, 0x01, 0x03, 0x64, 0x00, 0x00, 0xA2, 0x01, 0x01, 0x14, 0x00, 0x00, 0xA4, 0x01, 0x01, 0x64
	.byte 0x02, 0x00, 0xA1, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0xA2, 0x01, 0x01, 0x64, 0x02, 0x00, 0xA1, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xAA, 0x01, 0x08, 0x64, 0x00, 0x00, 0xAD, 0x01, 0x03, 0x64, 0x00, 0x00, 0xA9, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0xAB, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0A, 0x00, 0x00
	.byte 0xAC, 0x01, 0x02, 0x1E, 0x00, 0x00, 0xA9, 0x01, 0x01, 0x1E, 0x01, 0x00, 0xA6, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0xA7, 0x01, 0x01, 0x64, 0x01, 0x00, 0xA8, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0xB6, 0x01, 0x07, 0x64, 0x00, 0x00, 0xB3, 0x01, 0x03, 0x64, 0x00, 0x00, 0xB2, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0xB4, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0xB2, 0x01, 0x02, 0x0A, 0x00, 0x00, 0xB5, 0x01, 0x01, 0x1E, 0x01, 0x00, 0xAF, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0xB0, 0x01, 0x01, 0x64, 0x01, 0x00, 0xB1, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x64, 0x00, 0x00
	.byte 0xBF, 0x01, 0x07, 0x64, 0x00, 0x00, 0xBC, 0x01, 0x03, 0x64, 0x00, 0x00, 0xBB, 0x01, 0x01, 0x64
	.byte 0x00, 0x00, 0xBD, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0xBB, 0x01, 0x02, 0x0A, 0x00, 0x00, 0xBE, 0x01, 0x01, 0x1E, 0x01, 0x00, 0xB8, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0xB9, 0x01, 0x01, 0x64, 0x01, 0x00, 0xBA, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x64, 0x00, 0x00
	.byte 0xC6, 0x01, 0x03, 0x64, 0x00, 0x00, 0xC5, 0x01, 0x01, 0x64, 0x00, 0x00, 0xC7, 0x01, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x1E, 0x00, 0x00
	.byte 0xC5, 0x01, 0x01, 0x0F, 0x00, 0x00, 0xC1, 0x01, 0x01, 0x1E, 0x01, 0x00, 0xC2, 0x01, 0x01, 0x1E
	.byte 0x01, 0x00, 0xC3, 0x01, 0x01, 0x64, 0x01, 0x00, 0xC4, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_021FB2C0:
	.byte 0xB0, 0x87, 0x1F, 0x02, 0xBA, 0x87, 0x1F, 0x02, 0x02, 0x06, 0x1A, 0x06, 0x02, 0x0E, 0x1A, 0x0E
	.byte 0xB4, 0x89, 0x1F, 0x02, 0x98, 0x89, 0x1F, 0x02, 0xD8, 0x89, 0x1F, 0x02, 0x64, 0x89, 0x1F, 0x02
	.byte 0x78, 0x89, 0x1F, 0x02, 0x6C, 0x89, 0x1F, 0x02, 0x6C, 0x89, 0x1F, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x021FB300
