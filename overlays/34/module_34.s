
	thumb_func_start ov34_0225D520
ov34_0225D520: @ 0x0225D520
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x1c]
	movs r1, #0xdb
	bl FUN_0200BBA0
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	ldr r0, _0225D554 @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x9d
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r4, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225D554: .4byte 0x000F0200
	thumb_func_end ov34_0225D520

	thumb_func_start ov34_0225D558
ov34_0225D558: @ 0x0225D558
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0225D59C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	lsls r0, r0, #0xa
	tst r0, r1
	beq _0225D576
	ldr r0, [r4, #0xc]
	bl FUN_021F6B10
	cmp r0, #1
	bne _0225D576
	movs r0, #3
	str r0, [r4]
_0225D576:
	adds r0, r4, #0
	bl ov34_0225E58C
	adds r0, r4, #0
	bl ov34_0225E4F8
	adds r0, r4, #0
	bl ov34_0225DE04
	adds r0, r4, #0
	bl ov34_0225E164
	adds r0, r4, #0
	bl ov34_0225DD04
	adds r0, r4, #0
	bl ov34_0225E630
	pop {r4, pc}
	.align 2, 0
_0225D59C: .4byte 0x021D110C
	thumb_func_end ov34_0225D558

	thumb_func_start ov34_0225D5A0
ov34_0225D5A0: @ 0x0225D5A0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0xc]
	ldr r5, [r4, #0x14]
	adds r1, r0, #0
	adds r1, #0x84
	ldr r1, [r1]
	cmp r1, #0
	beq _0225D5F4
	ldr r1, [r4]
	cmp r1, #5
	bhi _0225D5F4
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225D5C4: @ jump table
	.2byte _0225D5F4 - _0225D5C4 - 2 @ case 0
	.2byte _0225D5F4 - _0225D5C4 - 2 @ case 1
	.2byte _0225D5D0 - _0225D5C4 - 2 @ case 2
	.2byte _0225D5E8 - _0225D5C4 - 2 @ case 3
	.2byte _0225D5F4 - _0225D5C4 - 2 @ case 4
	.2byte _0225D5F4 - _0225D5C4 - 2 @ case 5
_0225D5D0:
	bl FUN_02050590
	cmp r0, #0
	bne _0225D5E0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov34_0225D558
_0225D5E0:
	ldr r0, [r4, #0x28]
	bl FUN_0202457C
	pop {r3, r4, r5, pc}
_0225D5E8:
	movs r1, #0
	adds r2, r1, #0
	bl FUN_021F6A9C
	movs r0, #4
	str r0, [r4]
_0225D5F4:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov34_0225D5A0

	thumb_func_start ov34_0225D5F8
ov34_0225D5F8: @ 0x0225D5F8
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r4, r0, #0
	movs r2, #0
	adds r0, r1, #0
	str r2, [r4, r1]
	subs r0, #0x10
	strh r2, [r4, r0]
	adds r0, r1, #0
	subs r0, #0xe
	strh r2, [r4, r0]
	adds r0, r1, #0
	subs r0, #0xc
	strh r2, [r4, r0]
	subs r1, #0xa
	movs r0, #4
	strh r2, [r4, r1]
	bl FUN_0200BD08
	str r0, [r4, #0x18]
	ldr r2, _0225D64C @ =0x000002E2
	movs r0, #0
	movs r1, #0x1b
	movs r3, #4
	bl FUN_0200BAF8
	str r0, [r4, #0x1c]
	movs r0, #4
	adds r3, r4, #0
	str r0, [sp]
	movs r0, #0x49
	movs r1, #3
	movs r2, #1
	adds r3, #0x24
	bl FUN_020079D8
	str r0, [r4, #0x20]
	add sp, #4
	pop {r3, r4, pc}
	nop
_0225D64C: .4byte 0x000002E2
	thumb_func_end ov34_0225D5F8

	thumb_func_start ov34_0225D650
ov34_0225D650: @ 0x0225D650
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r7, r0, #0
	movs r0, #0xa0
	str r0, [sp, #0x24]
	movs r0, #0xd0
	str r0, [sp, #0x20]
	movs r0, #5
	str r0, [sp, #0x1c]
	ldr r0, _0225D774 @ =0x00000265
	adds r5, r1, #0
	str r2, [sp, #0x14]
	movs r4, #0
	movs r6, #3
	str r0, [sp, #0x18]
_0225D66E:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	adds r2, r4, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x18
	str r0, [sp, #0x10]
	adds r0, r7, #0
	adds r1, r5, #0
	lsrs r2, r2, #0x18
	movs r3, #1
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	bl FUN_0201D578
	ldr r0, [sp, #0x1c]
	adds r2, r4, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	adds r1, r5, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x18
	str r0, [sp, #0x10]
	adds r0, r7, #0
	adds r1, #0x10
	lsrs r2, r2, #0x18
	movs r3, #2
	bl FUN_0201D40C
	adds r0, r5, #0
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x10
	bl FUN_0201D578
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	adds r2, r4, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	lsls r2, r2, #0x18
	str r0, [sp, #0x10]
	adds r0, r7, #0
	adds r1, #0x20
	lsrs r2, r2, #0x18
	movs r3, #0xc
	bl FUN_0201D40C
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x20
	bl FUN_0201D578
	ldr r0, [sp, #0x24]
	adds r4, r4, #1
	adds r0, #0x10
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	adds r6, r6, #7
	adds r0, #0x87
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	adds r5, #0x38
	adds r0, r0, #7
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	adds r0, #0x1e
	str r0, [sp, #0x18]
	cmp r4, #3
	blt _0225D66E
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, _0225D778 @ =0x000002BF
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x10]
	adds r0, r7, #0
	movs r2, #4
	movs r3, #8
	bl FUN_0201D40C
	ldr r0, [sp, #0x14]
	movs r1, #0
	bl FUN_0201D978
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D774: .4byte 0x00000265
_0225D778: .4byte 0x000002BF
	thumb_func_end ov34_0225D650

	thumb_func_start ov34_0225D77C
ov34_0225D77C: @ 0x0225D77C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	bl FUN_0201D520
	movs r4, #0
_0225D788:
	adds r0, r5, #0
	adds r0, #0x10
	bl FUN_0201D520
	adds r0, r5, #0
	bl FUN_0201D520
	adds r0, r5, #0
	adds r0, #0x20
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x38
	cmp r4, #3
	blt _0225D788
	pop {r3, r4, r5, pc}
	thumb_func_end ov34_0225D77C

	thumb_func_start ov34_0225D7A8
ov34_0225D7A8: @ 0x0225D7A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0xaa
	movs r2, #4
	ldr r0, _0225D874 @ =ov34_0225D5A0
	lsls r1, r1, #2
	adds r3, r2, #0
	bl FUN_02007200
	adds r6, r0, #0
	bl FUN_0201F988
	adds r4, r0, #0
	str r5, [r4, #0xc]
	ldr r0, [r5, #8]
	str r0, [r4, #0x14]
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	str r0, [r4, #4]
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl FUN_02028E9C
	str r0, [r4, #0x10]
	movs r0, #2
	movs r1, #0xa9
	str r0, [r4]
	lsls r1, r1, #2
	str r6, [r4, r1]
	adds r5, #0x84
	ldr r2, [r5]
	ldr r0, _0225D878 @ =0x000004DC
	subs r1, #0x34
	ldr r0, [r2, r0]
	str r0, [r4, r1]
	ldr r0, [r4, #0x14]
	bl ov34_0225D924
	adds r0, r4, #0
	bl ov34_0225D5F8
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	adds r0, r4, #0
	bl ov34_0225E56C
	adds r0, r4, #0
	movs r1, #1
	bl ov34_0225E5DC
	adds r0, r4, #0
	bl ov34_0225DA50
	adds r0, r4, #0
	bl ov34_0225DB20
	movs r0, #1
	movs r1, #4
	bl FUN_02002D40
	movs r2, #0x72
	lsls r2, r2, #2
	adds r1, r4, r2
	adds r2, #0xac
	ldr r0, [r4, #0x14]
	adds r2, r4, r2
	bl ov34_0225D650
	adds r0, r4, #0
	bl ov34_0225D520
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
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
	adds r0, r4, #0
	bl ov34_0225E560
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225D874: .4byte ov34_0225D5A0
_0225D878: .4byte 0x000004DC
	thumb_func_end ov34_0225D7A8

	thumb_func_start ov34_0225D87C
ov34_0225D87C: @ 0x0225D87C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6]
	subs r0, r0, #2
	cmp r0, #2
	bhi _0225D8F8
	ldr r0, [r6, #0x14]
	str r0, [sp]
	movs r0, #5
	str r0, [r6]
	movs r0, #1
	bl FUN_02002D7C
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	movs r7, #0x55
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_0225D8B2:
	ldr r0, [r5, r7]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0225D8B2
	ldr r0, [r6, #0x28]
	bl FUN_02024504
	ldr r0, [r6, #0x1c]
	bl FUN_0200BB44
	ldr r0, [r6, #0x18]
	bl FUN_0200BDA0
	movs r1, #0x72
	lsls r1, r1, #2
	adds r0, r6, r1
	adds r1, #0xac
	adds r1, r6, r1
	bl ov34_0225D77C
	ldr r0, [sp]
	bl ov34_0225D900
	ldr r0, [r6, #0x20]
	bl FUN_0201AB0C
	movs r0, #0xa9
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02007234
	pop {r3, r4, r5, r6, r7, pc}
_0225D8F8:
	bl FUN_0202551C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov34_0225D87C

	thumb_func_start ov34_0225D900
ov34_0225D900: @ 0x0225D900
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201BB4C
	pop {r4, pc}
	thumb_func_end ov34_0225D900

	thumb_func_start ov34_0225D924
ov34_0225D924: @ 0x0225D924
	push {r3, r4, r5, lr}
	sub sp, #0x80
	adds r4, r0, #0
	bl ov34_0225D900
	ldr r5, _0225DA40 @ =0x0225E714
	add r3, sp, #0x64
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
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	ldr r5, _0225DA44 @ =0x0225E6F8
	add r3, sp, #0x48
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
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	ldr r5, _0225DA48 @ =0x0225E6C0
	add r3, sp, #0x2c
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
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201CAE0
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	ldr r5, _0225DA4C @ =0x0225E6DC
	add r3, sp, #0x10
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
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #8
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #0x60
	movs r1, #0
	str r0, [sp]
	movs r2, #4
	movs r0, #0x49
	adds r3, r1, #0
	str r2, [sp, #4]
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #5
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r0, #0x49
	movs r1, #2
	adds r2, r4, #0
	movs r3, #7
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r1, #4
	movs r0, #0x49
	adds r2, r4, #0
	movs r3, #7
	str r1, [sp, #0xc]
	bl FUN_02007914
	movs r0, #4
	movs r1, #0
	bl FUN_0205B4EC
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_0225DA40: .4byte 0x0225E714
_0225DA44: .4byte 0x0225E6F8
_0225DA48: .4byte 0x0225E6C0
_0225DA4C: .4byte 0x0225E6DC
	thumb_func_end ov34_0225D924

	thumb_func_start ov34_0225DA50
ov34_0225DA50: @ 0x0225DA50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r1, r6, #0
	movs r0, #0xa
	adds r1, #0x2c
	movs r2, #4
	bl FUN_02009F40
	movs r7, #0x55
	str r0, [r6, #0x28]
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_0225DA6C:
	movs r0, #1
	adds r1, r4, #0
	movs r2, #4
	bl FUN_0200A090
	str r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0225DA6C
	ldr r0, _0225DB1C @ =0x000003E7
	movs r1, #0x49
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r2, #5
	movs r3, #1
	bl FUN_0200A1D8
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r6, r1]
	ldr r0, _0225DB1C @ =0x000003E7
	movs r2, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r2, [sp, #8]
	movs r0, #4
	subs r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r6, r1]
	movs r1, #0x49
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x5a
	lsls r1, r1, #2
	str r0, [r6, r1]
	ldr r0, _0225DB1C @ =0x000003E7
	subs r1, #0xc
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	movs r1, #0x49
	movs r2, #6
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r6, r1]
	ldr r0, _0225DB1C @ =0x000003E7
	subs r1, #0xc
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	movs r1, #0x49
	movs r2, #7
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r6, r1]
	subs r1, #0xc
	ldr r0, [r6, r1]
	bl FUN_0200ADA4
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200B00C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225DB1C: .4byte 0x000003E7
	thumb_func_end ov34_0225DA50

	thumb_func_start ov34_0225DB20
ov34_0225DB20: @ 0x0225DB20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	ldr r1, _0225DBF8 @ =0x000003E7
	adds r5, r0, #0
	movs r0, #0
	str r1, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r3, #0x55
	str r0, [sp, #0x10]
	lsls r3, r3, #2
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
	adds r3, #0x20
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r5, r3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02009D48
	ldr r0, [r5, #0x28]
	movs r4, #0
	str r0, [sp, #0x2c]
	movs r0, #0x5d
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp, #0x30]
	movs r0, #1
	lsls r0, r0, #0xc
	movs r7, #0x3f
	str r4, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r4, [r0, #0x20]
	movs r0, #2
	str r0, [sp, #0x54]
	movs r0, #4
	ldr r6, _0225DBFC @ =0x0225E6A0
	str r4, [sp, #0x50]
	str r0, [sp, #0x58]
	lsls r7, r7, #0x18
_0225DB94:
	movs r0, #0x3a
	lsls r0, r0, #0xe
	str r0, [sp, #0x34]
	ldr r0, [r6]
	cmp r0, #0
	ble _0225DBB0
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F1520
	b _0225DBBC
_0225DBB0:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r7, #0
	blx FUN_020F24C8
_0225DBBC:
	blx FUN_020F2104
	movs r1, #3
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl FUN_02024624
	movs r1, #0x66
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_020248F0
	adds r4, r4, #1
	adds r6, r6, #4
	adds r5, r5, #4
	cmp r4, #3
	blt _0225DB94
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225DBF8: .4byte 0x000003E7
_0225DBFC: .4byte 0x0225E6A0
	thumb_func_end ov34_0225DB20

	thumb_func_start ov34_0225DC00
ov34_0225DC00: @ 0x0225DC00
	adds r1, r1, #1
	cmp r1, #0x1e
	bne _0225DC08
	movs r1, #0
_0225DC08:
	adds r0, r1, #0
	bx lr
	thumb_func_end ov34_0225DC00

	thumb_func_start ov34_0225DC0C
ov34_0225DC0C: @ 0x0225DC0C
	adds r0, r0, r1
	cmp r0, #0x1e
	blt _0225DC14
	subs r0, #0x1e
_0225DC14:
	bx lr
	.align 2, 0
	thumb_func_end ov34_0225DC0C

	thumb_func_start ov34_0225DC18
ov34_0225DC18: @ 0x0225DC18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r7, r1, #0
	adds r5, r0, #0
	movs r0, #0x38
	adds r4, r7, #0
	muls r4, r0, r4
	movs r0, #0x7e
	lsls r0, r0, #2
	adds r6, r2, #0
	adds r1, r5, r0
	ldr r0, [r6, #0x10]
	movs r3, #7
	str r0, [r1, r4]
	movs r0, #0x20
	str r0, [sp]
	str r3, [sp, #4]
	ldr r2, [r5, #0x24]
	adds r2, #0xc
	str r2, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r2, [r1, r4]
	movs r1, #0x18
	muls r1, r2, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x10]
	adds r1, r3, #0
	muls r3, r7, r3
	str r0, [sp, #0x14]
	movs r0, #0x30
	adds r3, r3, #2
	str r0, [sp, #0x18]
	lsls r3, r3, #0x18
	ldr r0, [r5, #0x14]
	movs r2, #0
	lsrs r3, r3, #0x18
	bl FUN_0201C4EC
	movs r0, #0x72
	lsls r0, r0, #2
	adds r7, r5, r0
	adds r0, r7, r4
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x76
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp, #0x1c]
	adds r0, r0, r4
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x7a
	lsls r0, r0, #2
	adds r5, r5, r0
	adds r0, r5, r4
	movs r1, #0
	bl FUN_0201D978
	movs r1, #1
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DCFC @ =0x000F0200
	movs r3, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r6]
	adds r0, r7, r4
	bl FUN_020200FC
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DD00 @ =0x00010200
	movs r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r2, [r6, #4]
	adds r0, r0, r4
	bl FUN_020200FC
	adds r0, r7, r4
	bl FUN_0201D5C8
	ldr r0, [sp, #0x1c]
	adds r0, r0, r4
	bl FUN_0201D5C8
	ldr r2, [r6, #8]
	cmp r2, #0
	beq _0225DCF0
	movs r1, #1
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DCFC @ =0x000F0200
	movs r3, #0
	str r0, [sp, #8]
	adds r0, r5, r4
	str r3, [sp, #0xc]
	bl FUN_020200FC
_0225DCF0:
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225DCFC: .4byte 0x000F0200
_0225DD00: .4byte 0x00010200
	thumb_func_end ov34_0225DC18

	thumb_func_start ov34_0225DD04
ov34_0225DD04: @ 0x0225DD04
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x27
	adds r5, r0, #0
	lsls r1, r1, #4
	adds r0, r1, #0
	ldr r2, [r5, r1]
	adds r1, #0x18
	adds r0, #0xdc
	ldrh r1, [r5, r1]
	ldr r0, [r2, r0]
	bl ov34_0225DC0C
	adds r6, r0, #0
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	adds r0, #0xd8
	ldr r7, [r1, r0]
	cmp r7, #3
	ble _0225DD2E
	movs r7, #3
_0225DD2E:
	movs r0, #0xa2
	lsls r0, r0, #2
	ldrh r1, [r5, r0]
	adds r0, r0, #4
	ldr r0, [r5, r0]
	cmp r1, r0
	beq _0225DD4C
	adds r0, r5, #0
	bl ov34_0225E560
	movs r0, #0xa2
	lsls r0, r0, #2
	ldrh r1, [r5, r0]
	adds r0, r0, #4
	str r1, [r5, r0]
_0225DD4C:
	movs r0, #0xa5
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0225DDB6
	movs r4, #0
	cmp r7, #0
	ble _0225DD84
_0225DD5C:
	movs r2, #0x27
	lsls r2, r2, #4
	movs r3, #0x1c
	ldr r2, [r5, r2]
	muls r3, r6, r3
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r2, r3
	bl ov34_0225DC18
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl ov34_0225DC00
	adds r4, r4, #1
	adds r6, r0, #0
	cmp r4, r7
	blt _0225DD5C
_0225DD84:
	ldr r0, [r5, #0x14]
	movs r1, #7
	bl FUN_0201CC08
	movs r1, #6
	lsls r1, r1, #8
	blx FUN_020D2894
	ldr r0, [r5, #0x14]
	movs r1, #7
	bl FUN_0201CC08
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r3, #6
	ldr r0, [r5, #0x14]
	movs r1, #7
	lsls r3, r3, #8
	bl FUN_0201BF94
	movs r0, #0xa5
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_0225DDB6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov34_0225DD04

	thumb_func_start ov34_0225DDB8
ov34_0225DDB8: @ 0x0225DDB8
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0x3a
	lsls r0, r0, #0xe
	str r0, [sp]
	cmp r1, #0
	ble _0225DDDA
	lsls r0, r1, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225DDE8
_0225DDDA:
	lsls r0, r1, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225DDE8:
	blx FUN_020F2104
	movs r1, #3
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov34_0225DDB8

	thumb_func_start ov34_0225DE04
ov34_0225DE04: @ 0x0225DE04
	push {r4, lr}
	movs r1, #0x27
	adds r4, r0, #0
	lsls r1, r1, #4
	adds r0, r1, #0
	ldr r2, [r4, r1]
	adds r0, #0xd8
	ldr r2, [r2, r0]
	adds r0, r1, #0
	adds r0, #0x14
	strh r2, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x14
	ldrh r0, [r4, r0]
	cmp r0, #3
	bls _0225DE42
	adds r0, r1, #0
	adds r0, #0x16
	ldrh r0, [r4, r0]
	cmp r0, #3
	bhi _0225DE42
	adds r0, r1, #0
	movs r2, #1
	adds r0, #0x1a
	strh r2, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x14
	ldrh r0, [r4, r0]
	adds r1, #0x18
	subs r0, r0, #3
	strh r0, [r4, r1]
_0225DE42:
	movs r1, #0x1a
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, #0xea
	ldrh r1, [r4, r1]
	bl FUN_02024830
	ldr r0, _0225DE90 @ =0x0000028A
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _0225DE84
	adds r0, r4, #0
	bl ov34_0225E5E4
	cmp r0, #1
	bne _0225DE84
	movs r1, #0xa2
	lsls r1, r1, #2
	ldrh r2, [r4, r1]
	subs r1, r1, #4
	ldrh r1, [r4, r1]
	movs r0, #0x60
	muls r0, r2, r0
	subs r1, r1, #3
	blx FUN_020F2998
	adds r1, r0, #0
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	adds r1, #0x30
	bl ov34_0225DDB8
_0225DE84:
	movs r0, #0xa1
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	adds r0, r0, #2
	strh r1, [r4, r0]
	pop {r4, pc}
	.align 2, 0
_0225DE90: .4byte 0x0000028A
	thumb_func_end ov34_0225DE04

	thumb_func_start ov34_0225DE94
ov34_0225DE94: @ 0x0225DE94
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0225E00C @ =0x0225E730
	bl FUN_02025204
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov34_0225E5D4
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r7, r0
	beq _0225DEDA
	cmp r7, #6
	bhi _0225DF5E
	adds r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225DEC0: @ jump table
	.2byte _0225DECE - _0225DEC0 - 2 @ case 0
	.2byte _0225DF00 - _0225DEC0 - 2 @ case 1
	.2byte _0225DF5E - _0225DEC0 - 2 @ case 2
	.2byte _0225DF5E - _0225DEC0 - 2 @ case 3
	.2byte _0225DF5E - _0225DEC0 - 2 @ case 4
	.2byte _0225DF36 - _0225DEC0 - 2 @ case 5
	.2byte _0225DF40 - _0225DEC0 - 2 @ case 6
_0225DECE:
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov34_0225E5EC
	cmp r5, #1
	beq _0225DEDC
_0225DEDA:
	b _0225E006
_0225DEDC:
	movs r0, #0xa2
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _0225DEF6
	ldr r0, _0225E010 @ =0x000005E5
	bl FUN_0200604C
	movs r0, #0xa2
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	subs r1, r1, #1
	strh r1, [r4, r0]
_0225DEF6:
	movs r0, #0x71
	subs r1, r7, #2
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0225E006
_0225DF00:
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov34_0225E5EC
	cmp r5, #1
	bne _0225E006
	movs r0, #0xa2
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	subs r0, r0, #4
	ldrh r0, [r4, r0]
	subs r0, r0, #3
	cmp r1, r0
	bge _0225DF2C
	ldr r0, _0225E010 @ =0x000005E5
	bl FUN_0200604C
	movs r0, #0xa2
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
_0225DF2C:
	movs r0, #0x71
	subs r1, r7, #2
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0225E006
_0225DF36:
	movs r0, #0x71
	subs r1, r7, #2
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0225E006
_0225DF40:
	ldr r0, _0225E014 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _0225E006
	ldr r0, [r4, #0xc]
	bl FUN_021F6B10
	cmp r0, #1
	bne _0225E006
	ldr r0, _0225E018 @ =0x000005FC
	bl FUN_0200604C
	movs r0, #3
	str r0, [r4]
	b _0225E006
_0225DF5E:
	ldr r0, _0225E014 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _0225E006
	movs r2, #0x27
	lsls r2, r2, #4
	adds r1, r2, #0
	ldr r0, [r4, r2]
	adds r1, #0xd8
	ldr r3, [r0, r1]
	subs r1, r7, #1
	cmp r3, r1
	blt _0225DFFE
	adds r1, r2, #0
	adds r1, #0xdc
	adds r2, #0x18
	ldr r0, [r0, r1]
	ldrh r1, [r4, r2]
	adds r1, r1, r7
	subs r1, r1, #2
	bl ov34_0225DC0C
	movs r1, #0x1c
	movs r5, #0
	muls r1, r0, r1
	adds r6, r5, #0
	str r1, [sp]
_0225DF94:
	adds r0, r5, #0
	bl FUN_02035754
	cmp r0, #0
	beq _0225DFD0
	ldr r1, [r4, #4]
	adds r0, #0x50
	adds r1, r1, r6
	ldrb r1, [r1, #0xd]
	cmp r1, #2
	bne _0225DFD0
	movs r1, #0x27
	lsls r1, r1, #4
	ldr r2, [r4, r1]
	ldr r1, [sp]
	ldr r0, [r0]
	adds r1, r1, r2
	ldr r1, [r1, #0xc]
	cmp r0, r1
	bne _0225DFD0
	ldr r0, _0225E010 @ =0x000005E5
	bl FUN_0200604C
	movs r1, #0x18
	ldr r2, [r4, #4]
	muls r1, r5, r1
	movs r0, #1
	adds r1, r2, r1
	strb r0, [r1, #0xf]
	b _0225DFD8
_0225DFD0:
	adds r5, r5, #1
	adds r6, #0x18
	cmp r5, #0xa
	blt _0225DF94
_0225DFD8:
	bl FUN_02035784
	bl FUN_02028F84
	movs r1, #0x27
	lsls r1, r1, #4
	ldr r2, [r4, r1]
	ldr r1, [sp]
	adds r1, r2, r1
	ldr r1, [r1, #0xc]
	cmp r1, r0
	bne _0225DFFE
	ldr r0, _0225E010 @ =0x000005E5
	bl FUN_0200604C
	ldr r1, [r4, #4]
	ldr r0, _0225E01C @ =0x000004BF
	movs r2, #1
	strb r2, [r1, r0]
_0225DFFE:
	movs r0, #0x71
	subs r1, r7, #2
	lsls r0, r0, #2
	str r1, [r4, r0]
_0225E006:
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E00C: .4byte 0x0225E730
_0225E010: .4byte 0x000005E5
_0225E014: .4byte 0x021D114C
_0225E018: .4byte 0x000005FC
_0225E01C: .4byte 0x000004BF
	thumb_func_end ov34_0225DE94

	thumb_func_start ov34_0225E020
ov34_0225E020: @ 0x0225E020
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, _0225E0E0 @ =0x0225E6AC
	bl FUN_02025204
	movs r1, #0
	mvns r1, r1
	str r0, [sp]
	cmp r0, r1
	beq _0225E0D0
	cmp r0, #0
	bne _0225E09A
	adds r0, r7, #0
	movs r1, #0
	bl ov34_0225E5DC
	add r0, sp, #8
	add r1, sp, #4
	bl FUN_02025364
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r7, r0]
	ldr r1, [sp, #4]
	bl ov34_0225DDB8
	movs r0, #0xa1
	lsls r0, r0, #2
	ldrh r0, [r7, r0]
	cmp r0, #3
	bls _0225E0D8
	subs r4, r0, #2
	movs r0, #0x60
	adds r1, r4, #0
	blx FUN_020F2998
	movs r1, #0
	cmp r4, #0
	ble _0225E0D8
	ldr r5, [sp, #4]
	adds r2, r1, #0
	adds r3, r1, #0
_0225E076:
	adds r6, r2, #0
	adds r6, #0x30
	cmp r5, r6
	blo _0225E08E
	adds r6, r3, r0
	adds r6, #0x30
	cmp r5, r6
	bhs _0225E08E
	movs r0, #0xa2
	lsls r0, r0, #2
	strh r1, [r7, r0]
	b _0225E0D8
_0225E08E:
	adds r1, r1, #1
	adds r2, r2, r0
	adds r3, r3, r0
	cmp r1, r4
	blt _0225E076
	b _0225E0D8
_0225E09A:
	movs r1, #0x27
	lsls r1, r1, #4
	adds r0, r1, #0
	ldr r2, [r7, r1]
	adds r0, #0xd8
	ldr r2, [r2, r0]
	ldr r0, [sp]
	cmp r2, r0
	blt _0225E0D8
	adds r0, r1, #0
	subs r0, #0xac
	ldr r2, [r7, r0]
	ldr r0, [sp]
	subs r3, r0, #1
	cmp r2, r3
	bne _0225E0D8
	subs r1, #0x74
	adds r2, r7, r1
	movs r0, #0x38
	adds r1, r3, #0
	muls r1, r0, r1
	ldr r0, [r2, r1]
	cmp r0, #5
	bge _0225E0D8
	adds r0, r0, #1
	str r0, [r2, r1]
	b _0225E0D8
_0225E0D0:
	adds r0, r7, #0
	movs r1, #1
	bl ov34_0225E5DC
_0225E0D8:
	ldr r0, [sp]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225E0E0: .4byte 0x0225E6AC
	thumb_func_end ov34_0225E020

	thumb_func_start ov34_0225E0E4
ov34_0225E0E4: @ 0x0225E0E4
	push {r4, lr}
	ldr r1, _0225E15C @ =0x021D110C
	adds r4, r0, #0
	ldr r3, [r1, #0x44]
	movs r1, #2
	lsls r1, r1, #8
	adds r2, r3, #0
	tst r2, r1
	beq _0225E126
	movs r1, #0
	bl ov34_0225E5EC
	ldr r0, _0225E15C @ =0x021D110C
	movs r1, #2
	ldr r0, [r0, #0x4c]
	lsls r1, r1, #8
	tst r0, r1
	beq _0225E158
	adds r0, r1, #0
	adds r0, #0x88
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _0225E158
	adds r0, r1, #0
	adds r0, #0x88
	ldrh r0, [r4, r0]
	adds r1, #0x88
	subs r0, r0, #1
	strh r0, [r4, r1]
	ldr r0, _0225E160 @ =0x000005E5
	bl FUN_0200604C
	pop {r4, pc}
_0225E126:
	lsrs r1, r1, #1
	tst r1, r3
	beq _0225E158
	movs r1, #1
	bl ov34_0225E5EC
	ldr r0, _0225E15C @ =0x021D110C
	ldr r1, [r0, #0x4c]
	movs r0, #1
	lsls r0, r0, #8
	tst r0, r1
	beq _0225E158
	movs r0, #0xa2
	lsls r0, r0, #2
	subs r1, r0, #4
	ldrh r1, [r4, r1]
	ldrh r2, [r4, r0]
	subs r1, r1, #3
	cmp r2, r1
	bge _0225E158
	adds r1, r2, #1
	strh r1, [r4, r0]
	ldr r0, _0225E160 @ =0x000005E5
	bl FUN_0200604C
_0225E158:
	pop {r4, pc}
	nop
_0225E15C: .4byte 0x021D110C
_0225E160: .4byte 0x000005E5
	thumb_func_end ov34_0225E0E4

	thumb_func_start ov34_0225E164
ov34_0225E164: @ 0x0225E164
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r4, #0
	mvns r4, r4
	bl FUN_02050590
	cmp r0, #0
	bne _0225E19A
	adds r0, r5, #0
	bl ov34_0225DE94
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov34_0225E020
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	bne _0225E19A
	cmp r4, r0
	bne _0225E19A
	adds r0, r5, #0
	bl ov34_0225E0E4
_0225E19A:
	movs r2, #0x27
	lsls r2, r2, #4
	adds r0, r2, #0
	ldr r1, [r5, r2]
	adds r0, #0xd8
	ldr r0, [r1, r0]
	subs r3, r4, #1
	str r0, [sp]
	adds r0, r2, #0
	adds r0, #0x20
	adds r0, r5, r0
	str r0, [sp, #4]
	subs r2, #0xa8
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x24]
	adds r2, r5, r2
	bl ov34_0225E1C4
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov34_0225E164

	thumb_func_start ov34_0225E1C4
ov34_0225E1C4: @ 0x0225E1C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x40]
	str r1, [sp, #0x20]
	adds r5, r2, #0
	movs r1, #0
	str r0, [sp, #0x40]
	ldr r4, [sp, #0x44]
	cmp r0, #3
	ble _0225E1DE
	movs r0, #3
	str r0, [sp, #0x40]
_0225E1DE:
	ldr r2, [sp, #0x40]
	movs r0, #0
	cmp r2, #0
	ble _0225E204
	adds r2, r5, #0
_0225E1E8:
	cmp r3, r0
	beq _0225E1F6
	ldr r6, [r2, #0x34]
	cmp r6, #0
	beq _0225E1F6
	subs r6, r6, #1
	str r6, [r2, #0x34]
_0225E1F6:
	ldr r6, [r2, #0x34]
	adds r0, r0, #1
	adds r1, r1, r6
	ldr r6, [sp, #0x40]
	adds r2, #0x38
	cmp r0, r6
	blt _0225E1E8
_0225E204:
	cmp r1, #0
	bne _0225E214
	ldr r0, [r4]
	cmp r0, #0
	bne _0225E214
	add sp, #0x28
	str r1, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225E214:
	ldr r0, [sp, #0x40]
	str r1, [r4]
	movs r4, #0
	cmp r0, #0
	ble _0225E28A
	ldr r0, [sp, #0x20]
	movs r7, #2
	adds r0, #0xc
	str r0, [sp, #0x20]
_0225E226:
	ldr r1, [r5, #0x34]
	lsls r3, r7, #0x18
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [sp, #0x24]
	movs r0, #0x20
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	lsrs r3, r3, #0x18
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	ldr r1, [r5, #0x30]
	lsls r2, r0, #3
	movs r0, #0x18
	muls r0, r1, r0
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	movs r0, #0x20
	str r0, [sp, #0x14]
	movs r0, #0x30
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	movs r1, #7
	movs r2, #0
	bl FUN_0201C4EC
	ldr r3, [sp, #0x24]
	adds r1, r4, #4
	lsls r6, r3, #2
	ldr r3, _0225E2B8 @ =_0225E694
	lsls r1, r1, #0x18
	ldr r0, [sp, #0x1c]
	ldr r3, [r3, r6]
	lsrs r1, r1, #0x18
	movs r2, #3
	bl FUN_0201BC8C
	ldr r0, [sp, #0x40]
	adds r4, r4, #1
	adds r5, #0x38
	adds r7, r7, #7
	cmp r4, r0
	blt _0225E226
_0225E28A:
	ldr r0, [sp, #0x1c]
	movs r1, #7
	bl FUN_0201CC08
	movs r1, #6
	lsls r1, r1, #8
	blx FUN_020D2894
	ldr r0, [sp, #0x1c]
	movs r1, #7
	bl FUN_0201CC08
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r3, #6
	ldr r0, [sp, #0x1c]
	movs r1, #7
	lsls r3, r3, #8
	bl FUN_0201BF94
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E2B8: .4byte _0225E694
	thumb_func_end ov34_0225E1C4

	thumb_func_start ov34_0225E2BC
ov34_0225E2BC: @ 0x0225E2BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r4, #0
	ldr r0, [sp, #0x28]
	adds r5, r1, #0
	adds r7, r2, #0
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	bl FUN_02028F84
	cmp r5, r0
	beq _0225E2E0
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0202B01C
	adds r4, r0, #0
_0225E2E0:
	cmp r4, #0
	ble _0225E340
	cmp r4, #1
	bne _0225E2F4
	ldr r2, [sp, #0x28]
	adds r0, r7, #0
	movs r1, #0
	bl FUN_0200BE48
	b _0225E332
_0225E2F4:
	cmp r4, #2
	blt _0225E332
	subs r5, r4, #2
	movs r0, #0xa
	movs r1, #0x57
	bl FUN_02026354
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0202AEF8
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_020269A0
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0202AF00
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r2, r4, #0
	adds r3, r1, #0
	bl FUN_0200BE3C
	adds r0, r4, #0
	bl FUN_02026380
_0225E332:
	ldr r1, [sp, #8]
	adds r0, r7, #0
	movs r2, #0xd0
	movs r3, #0x57
	bl FUN_0200BC4C
	str r0, [sp, #0xc]
_0225E340:
	ldr r0, [sp, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov34_0225E2BC

	thumb_func_start ov34_0225E348
ov34_0225E348: @ 0x0225E348
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r2, #0
	ldr r2, [r7, #4]
	ldr r0, _0225E424 @ =0x000004D8
	str r1, [sp, #4]
	movs r1, #0x27
	ldr r0, [r2, r0]
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	adds r0, r1, #0
	ldr r4, [r7, r1]
	adds r0, #0xd8
	ldr r0, [r4, r0]
	str r3, [sp, #8]
	cmp r0, #0x1e
	bne _0225E370
	adds r1, #0xdc
	b _0225E372
_0225E370:
	adds r1, #0xd8
_0225E372:
	adds r5, r4, r1
	ldr r1, [r5]
	movs r0, #0x1c
	muls r0, r1, r0
	adds r0, r4, r0
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0225E386
	bl FUN_02026380
_0225E386:
	ldr r1, [r5]
	movs r0, #0x1c
	muls r0, r1, r0
	adds r0, r4, r0
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0225E398
	bl FUN_02026380
_0225E398:
	ldr r0, [sp, #8]
	bl FUN_02028F54
	adds r1, r0, #0
	ldr r2, [r5]
	movs r0, #0x1c
	muls r0, r2, r0
	ldr r0, [r4, r0]
	bl FUN_020269A0
	ldr r0, [r5]
	movs r1, #0x1c
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r4, r2
	ldrh r2, [r6]
	strh r2, [r0, #0x14]
	ldrh r2, [r6, #2]
	strh r2, [r0, #0x16]
	ldrh r2, [r6, #4]
	strh r2, [r0, #0x18]
	ldrh r2, [r6, #6]
	strh r2, [r0, #0x1a]
	ldr r0, [r5]
	muls r1, r0, r1
	ldr r0, [sp, #4]
	adds r1, r4, r1
	str r0, [r1, #0xc]
	ldr r0, [sp, #8]
	bl FUN_02028F94
	ldr r2, [r5]
	movs r1, #0x1c
	muls r1, r2, r1
	adds r1, r4, r1
	str r0, [r1, #0x10]
	adds r0, r6, #0
	movs r1, #0x57
	bl FUN_02015898
	ldr r2, [r5]
	movs r1, #0x1c
	muls r1, r2, r1
	adds r1, r4, r1
	str r0, [r1, #4]
	ldr r0, [r7, #0x10]
	ldr r1, [sp, #4]
	str r0, [sp]
	ldr r0, [sp, #0xc]
	ldr r2, [r7, #0x18]
	ldr r3, [r7, #0x1c]
	bl ov34_0225E2BC
	ldr r2, [r5]
	movs r1, #0x1c
	muls r1, r2, r1
	adds r1, r4, r1
	str r0, [r1, #8]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	movs r0, #0xd3
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0x1e
	bne _0225E420
	movs r1, #0
	str r1, [r4, r0]
_0225E420:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E424: .4byte 0x000004D8
	thumb_func_end ov34_0225E348

	thumb_func_start ov34_0225E428
ov34_0225E428: @ 0x0225E428
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, r1, #0
	str r1, [sp]
	adds r7, r2, #0
	bl FUN_02015920
	cmp r0, #0
	bne _0225E43E
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225E43E:
	movs r1, #0x27
	lsls r1, r1, #4
	ldr r0, [r6, r1]
	adds r1, #0xd8
	ldr r1, [r0, r1]
	movs r4, #0
	cmp r1, #0
	ble _0225E478
	adds r5, r4, #0
_0225E450:
	adds r1, r0, r5
	ldr r0, [r1, #0xc]
	cmp r7, r0
	bne _0225E464
	ldr r0, [sp]
	adds r1, #0x14
	bl FUN_020159EC
	cmp r0, #0
	bne _0225E478
_0225E464:
	movs r0, #0x27
	lsls r0, r0, #4
	movs r1, #0xd2
	ldr r0, [r6, r0]
	lsls r1, r1, #2
	ldr r1, [r0, r1]
	adds r4, r4, #1
	adds r5, #0x1c
	cmp r4, r1
	blt _0225E450
_0225E478:
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r1, [r6, r0]
	adds r0, #0xd8
	ldr r0, [r1, r0]
	cmp r4, r0
	beq _0225E48E
	cmp r0, #0
	beq _0225E48E
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225E48E:
	movs r0, #0x1c
	muls r0, r4, r0
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r7, r0
	beq _0225E4A2
	ldr r0, [sp]
	adds r1, #0x14
	bl FUN_020159EC
_0225E4A2:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov34_0225E428

	thumb_func_start ov34_0225E4A8
ov34_0225E4A8: @ 0x0225E4A8
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	movs r1, #0xa2
	adds r4, r0, #0
	lsls r1, r1, #2
	ldrh r0, [r4, r1]
	subs r1, r1, #4
	ldrh r1, [r4, r1]
	movs r5, #0
	subs r1, r1, #3
	cmp r0, r1
	bne _0225E4C2
	movs r5, #1
_0225E4C2:
	adds r1, r3, #0
	adds r0, r4, #0
	adds r3, r6, #0
	bl ov34_0225E348
	ldr r1, _0225E4F4 @ =0x0000028A
	ldrh r0, [r4, r1]
	cmp r0, #0
	beq _0225E4EA
	cmp r5, #0
	beq _0225E4EA
	adds r0, r1, #0
	subs r0, #0x1a
	ldr r2, [r4, r0]
	adds r0, r1, #0
	adds r0, #0xbe
	ldr r0, [r2, r0]
	subs r2, r0, #3
	subs r0, r1, #2
	strh r2, [r4, r0]
_0225E4EA:
	adds r0, r4, #0
	bl ov34_0225E560
	pop {r4, r5, r6, pc}
	nop
_0225E4F4: .4byte 0x0000028A
	thumb_func_end ov34_0225E4A8

	thumb_func_start ov34_0225E4F8
ov34_0225E4F8: @ 0x0225E4F8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_02050590
	cmp r0, #0
	bne _0225E55C
	movs r4, #0
_0225E508:
	adds r0, r4, #0
	bl FUN_02035754
	adds r2, r0, #0
	beq _0225E53A
	adds r6, r2, #0
	adds r6, #0x50
	adds r7, r6, #0
	adds r7, #8
	ldr r2, [r2, #0x50]
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov34_0225E428
	cmp r0, #0
	beq _0225E53A
	adds r0, r4, #0
	bl FUN_02035798
	adds r1, r0, #0
	ldr r3, [r6]
	adds r0, r5, #0
	adds r2, r7, #0
	bl ov34_0225E4A8
_0225E53A:
	adds r4, r4, #1
	cmp r4, #0x10
	blt _0225E508
	ldr r0, [r5, #8]
	bl FUN_0205AA84
	adds r4, r0, #0
	beq _0225E55C
	ldr r0, [r5, #0x10]
	bl FUN_02028F84
	adds r3, r0, #0
	ldr r1, [r5, #0x10]
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov34_0225E4A8
_0225E55C:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov34_0225E4F8

	thumb_func_start ov34_0225E560
ov34_0225E560: @ 0x0225E560
	movs r1, #0xa5
	movs r2, #1
	lsls r1, r1, #2
	str r2, [r0, r1]
	bx lr
	.align 2, 0
	thumb_func_end ov34_0225E560

	thumb_func_start ov34_0225E56C
ov34_0225E56C: @ 0x0225E56C
	movs r1, #0xa6
	movs r2, #0
	lsls r1, r1, #2
	strb r2, [r0, r1]
	movs r3, #8
	adds r2, r1, #2
	strb r3, [r0, r2]
	movs r3, #4
	adds r2, r1, #3
	strb r3, [r0, r2]
	adds r2, r1, #2
	ldrb r2, [r0, r2]
	adds r1, r1, #1
	strb r2, [r0, r1]
	bx lr
	.align 2, 0
	thumb_func_end ov34_0225E56C

	thumb_func_start ov34_0225E58C
ov34_0225E58C: @ 0x0225E58C
	movs r2, #0xa6
	movs r1, #0
	lsls r2, r2, #2
	strb r1, [r0, r2]
	ldr r1, _0225E5D0 @ =0x021D114C
	ldrh r3, [r1, #0x24]
	cmp r3, #0
	beq _0225E5A2
	movs r1, #1
	strb r1, [r0, r2]
	bx lr
_0225E5A2:
	ldrh r1, [r1, #0x26]
	cmp r1, #0
	beq _0225E5C6
	adds r1, r2, #1
	ldrsb r1, [r0, r1]
	subs r3, r1, #1
	adds r1, r2, #1
	strb r3, [r0, r1]
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _0225E5CE
	movs r1, #1
	strb r1, [r0, r2]
	adds r1, r2, #3
	ldrb r3, [r0, r1]
	adds r1, r2, #1
	strb r3, [r0, r1]
	bx lr
_0225E5C6:
	adds r1, r2, #2
	ldrb r3, [r0, r1]
	adds r1, r2, #1
	strb r3, [r0, r1]
_0225E5CE:
	bx lr
	.align 2, 0
_0225E5D0: .4byte 0x021D114C
	thumb_func_end ov34_0225E58C

	thumb_func_start ov34_0225E5D4
ov34_0225E5D4: @ 0x0225E5D4
	movs r1, #0xa6
	lsls r1, r1, #2
	ldrb r0, [r0, r1]
	bx lr
	thumb_func_end ov34_0225E5D4

	thumb_func_start ov34_0225E5DC
ov34_0225E5DC: @ 0x0225E5DC
	movs r2, #0xa7
	lsls r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov34_0225E5DC

	thumb_func_start ov34_0225E5E4
ov34_0225E5E4: @ 0x0225E5E4
	movs r1, #0xa7
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov34_0225E5E4

	thumb_func_start ov34_0225E5EC
ov34_0225E5EC: @ 0x0225E5EC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0x66
	adds r5, r1, #0
	lsls r0, r0, #2
	adds r4, r7, r0
	lsls r6, r5, #2
	ldr r0, [r4, r6]
	bl FUN_020249F8
	str r0, [sp]
	ldr r0, [r4, r6]
	bl FUN_020249A8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, [sp]
	cmp r0, #0
	bne _0225E618
	adds r0, r5, #4
	cmp r1, r0
	beq _0225E620
_0225E618:
	ldr r0, [r4, r6]
	adds r1, r5, #4
	bl FUN_020248F0
_0225E620:
	lsls r0, r5, #1
	adds r1, r7, r0
	movs r0, #0x2a
	movs r2, #1
	lsls r0, r0, #4
	strh r2, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov34_0225E5EC

	thumb_func_start ov34_0225E630
ov34_0225E630: @ 0x0225E630
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #0
	adds r7, r6, #0
_0225E63A:
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020249F8
	movs r0, #0x2a
	lsls r0, r0, #4
	ldrh r0, [r4, r0]
	cmp r0, #1
	bne _0225E662
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0202484C
	movs r0, #0x2a
	lsls r0, r0, #4
	strh r7, [r4, r0]
	b _0225E688
_0225E662:
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020248C0
	cmp r0, #0
	bne _0225E688
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_020249D4
_0225E688:
	adds r6, r6, #1
	adds r5, r5, #4
	adds r4, r4, #2
	cmp r6, #2
	blt _0225E63A
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov34_0225E630

	.rodata

_0225E694:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x30, 0x90, 0xE8, 0x00
	.byte 0x10, 0x48, 0x00, 0xE8, 0x48, 0x80, 0x00, 0xE8, 0x80, 0xB8, 0x00, 0xE8, 0xFF, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0E, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0C, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x20, 0xE8, 0xF8, 0xA0, 0x20, 0xE8, 0xF8, 0x10, 0x48, 0x00, 0xE8, 0x48, 0x80, 0x00, 0xE8
	.byte 0x80, 0xB8, 0x00, 0xE8, 0x30, 0x90, 0xE8, 0x00, 0x00, 0x0F, 0x00, 0xE8, 0xFF, 0x00, 0x00, 0x00
