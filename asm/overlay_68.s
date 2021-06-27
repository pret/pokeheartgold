
	thumb_func_start ov68_021E5900
ov68_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	movs r2, #9
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x42
	lsls r2, r2, #0xe
	bl FUN_0201A910
	movs r1, #0x77
	adds r0, r5, #0
	lsls r1, r1, #2
	movs r2, #0x42
	bl FUN_02007280
	movs r2, #0x77
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r0, r5, #0
	bl FUN_020072A4
	str r0, [r4]
	adds r0, r4, #0
	bl ov68_021E5A58
	ldr r1, [r4]
	adds r0, r4, #0
	ldrh r1, [r1, #0x14]
	movs r2, #3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov68_021E73A4
	movs r0, #0x1b
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov68_021E7424
	ldr r0, _021E5964 @ =ov68_021E5B6C
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5964: .4byte ov68_021E5B6C
	thumb_func_end ov68_021E5900

	thumb_func_start ov68_021E5968
ov68_021E5968: @ 0x021E5968
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #0xf
	bhi _021E5A22
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5984: @ jump table
	.2byte _021E59A4 - _021E5984 - 2 @ case 0
	.2byte _021E59AC - _021E5984 - 2 @ case 1
	.2byte _021E59B4 - _021E5984 - 2 @ case 2
	.2byte _021E59BC - _021E5984 - 2 @ case 3
	.2byte _021E59C4 - _021E5984 - 2 @ case 4
	.2byte _021E59CC - _021E5984 - 2 @ case 5
	.2byte _021E59D4 - _021E5984 - 2 @ case 6
	.2byte _021E59DC - _021E5984 - 2 @ case 7
	.2byte _021E59E4 - _021E5984 - 2 @ case 8
	.2byte _021E59EC - _021E5984 - 2 @ case 9
	.2byte _021E59F0 - _021E5984 - 2 @ case 10
	.2byte _021E59F8 - _021E5984 - 2 @ case 11
	.2byte _021E5A02 - _021E5984 - 2 @ case 12
	.2byte _021E5A0C - _021E5984 - 2 @ case 13
	.2byte _021E5A14 - _021E5984 - 2 @ case 14
	.2byte _021E5A1C - _021E5984 - 2 @ case 15
_021E59A4:
	bl ov68_021E5F50
	str r0, [r4]
	b _021E5A22
_021E59AC:
	bl ov68_021E5F68
	str r0, [r4]
	b _021E5A22
_021E59B4:
	bl ov68_021E6058
	str r0, [r4]
	b _021E5A22
_021E59BC:
	bl ov68_021E6078
	str r0, [r4]
	b _021E5A22
_021E59C4:
	bl ov68_021E60D8
	str r0, [r4]
	b _021E5A22
_021E59CC:
	bl ov68_021E614C
	str r0, [r4]
	b _021E5A22
_021E59D4:
	bl ov68_021E61A0
	str r0, [r4]
	b _021E5A22
_021E59DC:
	bl ov68_021E61B8
	str r0, [r4]
	b _021E5A22
_021E59E4:
	bl ov68_021E61EC
	str r0, [r4]
	b _021E5A22
_021E59EC:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E59F0:
	bl ov68_021E74C0
	str r0, [r4]
	b _021E5A22
_021E59F8:
	bl ov68_021E74D8
	str r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E5A02:
	bl ov68_021E7568
	str r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E5A0C:
	bl ov68_021E7AD8
	str r0, [r4]
	b _021E5A22
_021E5A14:
	bl ov68_021E7B6C
	str r0, [r4]
	b _021E5A22
_021E5A1C:
	bl ov68_021E7B8C
	str r0, [r4]
_021E5A22:
	movs r0, #0x55
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov68_021E734C
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200D020
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov68_021E5968

	thumb_func_start ov68_021E5A3C
ov68_021E5A3C: @ 0x021E5A3C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02007290
	bl ov68_021E5B14
	adds r0, r4, #0
	bl FUN_02007294
	movs r0, #0x42
	bl FUN_0201A9C4
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov68_021E5A3C

	thumb_func_start ov68_021E5A58
ov68_021E5A58: @ 0x021E5A58
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5B08 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5B0C @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #1
	bl FUN_02002B8C
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl FUN_020183F0
	movs r1, #0x6d
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x42
	bl FUN_0201AC88
	str r0, [r4, #4]
	movs r0, #0x6e
	movs r1, #0x42
	bl FUN_02007688
	adds r5, r0, #0
	bl ov68_021E5BA0
	ldr r0, [r4, #4]
	bl ov68_021E5BC0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov68_021E5D24
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov68_021E7178
	adds r0, r4, #0
	bl ov68_021E7288
	adds r0, r4, #0
	bl ov68_021E5EBC
	adds r0, r4, #0
	bl ov68_021E5E48
	adds r0, r4, #0
	bl ov68_021E6820
	adds r0, r4, #0
	bl ov68_021E6204
	adds r0, r4, #0
	bl ov68_021E6320
	adds r0, r4, #0
	bl ov68_021E75C0
	movs r0, #0
	movs r1, #0x42
	bl FUN_020880CC
	ldr r0, _021E5B10 @ =ov68_021E5B6C
	adds r1, r4, #0
	bl FUN_0201A0FC
	adds r0, r5, #0
	bl FUN_0200770C
	pop {r3, r4, r5, pc}
	nop
_021E5B08: .4byte 0xFFFFE0FF
_021E5B0C: .4byte 0x04001000
_021E5B10: .4byte ov68_021E5B6C
	thumb_func_end ov68_021E5A58

	thumb_func_start ov68_021E5B14
ov68_021E5B14: @ 0x021E5B14
	push {r4, lr}
	adds r4, r0, #0
	bl ov68_021E7604
	adds r0, r4, #0
	bl ov68_021E68C4
	adds r0, r4, #0
	bl ov68_021E5E94
	adds r0, r4, #0
	bl ov68_021E5E38
	ldr r0, [r4, #4]
	bl ov68_021E5CD8
	adds r0, r4, #0
	bl ov68_021E5F18
	movs r0, #0x55
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov68_021E7388
	adds r0, r4, #0
	bl ov68_021E6E84
	ldr r0, [r4]
	movs r1, #0x6d
	lsls r1, r1, #2
	ldr r0, [r0, #0xc]
	ldr r1, [r4, r1]
	bl FUN_02018410
	movs r0, #0
	bl FUN_02002B8C
	bl FUN_020205AC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	pop {r4, pc}
	thumb_func_end ov68_021E5B14

	thumb_func_start ov68_021E5B6C
ov68_021E5B6C: @ 0x021E5B6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl FUN_0201EEB4
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02009418
	bl FUN_0202061C
	bl FUN_0200D034
	ldr r3, _021E5B98 @ =0x027E0000
	ldr r1, _021E5B9C @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E5B98: .4byte 0x027E0000
_021E5B9C: .4byte 0x00003FF8
	thumb_func_end ov68_021E5B6C

	thumb_func_start ov68_021E5BA0
ov68_021E5BA0: @ 0x021E5BA0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5BBC @ =0x021E7D14
	add r3, sp, #0
	movs r2, #5
_021E5BAA:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5BAA
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E5BBC: .4byte 0x021E7D14
	thumb_func_end ov68_021E5BA0

	thumb_func_start ov68_021E5BC0
ov68_021E5BC0: @ 0x021E5BC0
	push {r4, r5, lr}
	sub sp, #0x9c
	ldr r5, _021E5CC0 @ =0x021E7BF8
	add r3, sp, #0x8c
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E5CC4 @ =0x021E7C60
	add r3, sp, #0x70
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _021E5CC8 @ =0x021E7C44
	add r3, sp, #0x54
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
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	ldr r5, _021E5CCC @ =0x021E7C7C
	add r3, sp, #0x38
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
	ldr r5, _021E5CD0 @ =0x021E7C98
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201CAE0
	ldr r5, _021E5CD4 @ =0x021E7CB4
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201CAE0
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x42
	bl FUN_0201C1C4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x42
	bl FUN_0201C1C4
	add sp, #0x9c
	pop {r4, r5, pc}
	nop
_021E5CC0: .4byte 0x021E7BF8
_021E5CC4: .4byte 0x021E7C60
_021E5CC8: .4byte 0x021E7C44
_021E5CCC: .4byte 0x021E7C7C
_021E5CD0: .4byte 0x021E7C98
_021E5CD4: .4byte 0x021E7CB4
	thumb_func_end ov68_021E5BC0

	thumb_func_start ov68_021E5CD8
ov68_021E5CD8: @ 0x021E5CD8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1d
	movs r1, #0
	bl FUN_02022CC8
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201BB4C
	movs r0, #0x42
	adds r1, r4, #0
	bl FUN_0201AB80
	ldr r2, _021E5D20 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	pop {r4, pc}
	.align 2, 0
_021E5D20: .4byte 0x04000304
	thumb_func_end ov68_021E5CD8

	thumb_func_start ov68_021E5D24
ov68_021E5D24: @ 0x021E5D24
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	adds r4, r1, #0
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	movs r1, #0x42
	adds r2, r4, #0
	movs r3, #0x6e
	bl FUN_0208820C
	movs r0, #4
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	lsls r0, r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	movs r1, #0x42
	adds r2, r4, #0
	movs r3, #0x6e
	bl FUN_0208820C
	movs r1, #0
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, [r5, #4]
	movs r1, #0x42
	adds r2, r4, #0
	movs r3, #0x6e
	bl FUN_0208820C
	movs r0, #1
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	movs r1, #0x42
	adds r2, r4, #0
	movs r3, #0x6e
	bl FUN_0208820C
	movs r0, #2
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	lsls r0, r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	movs r1, #0x42
	adds r2, r4, #0
	movs r3, #0x6e
	bl FUN_0208820C
	movs r1, #0
	str r1, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, [r5, #4]
	movs r1, #0x42
	adds r2, r4, #0
	movs r3, #0x6e
	bl FUN_0208820C
	movs r3, #0x71
	movs r0, #0x42
	lsls r3, r3, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	movs r1, #7
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #4
	movs r2, #0x42
	bl FUN_0200304C
	movs r1, #0x1e
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x42
	bl FUN_02003030
	movs r1, #0x1e
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #0x42
	bl FUN_02003030
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x42
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	movs r1, #4
	movs r2, #0x3d
	movs r3, #0xd
	bl FUN_0200E644
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov68_021E5D24

	thumb_func_start ov68_021E5E38
ov68_021E5E38: @ 0x021E5E38
	movs r1, #7
	lsls r1, r1, #6
	ldr r3, _021E5E44 @ =FUN_0201AB0C
	ldr r0, [r0, r1]
	bx r3
	nop
_021E5E44: .4byte FUN_0201AB0C
	thumb_func_end ov68_021E5E38

	thumb_func_start ov68_021E5E48
ov68_021E5E48: @ 0x021E5E48
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #4
	movs r1, #0x42
	bl FUN_02002CEC
	adds r5, r7, #0
	ldr r4, _021E5E90 @ =0x021E7DFC
	movs r6, #0
	adds r5, #8
_021E5E5C:
	ldr r0, [r7, #4]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #0xf
	blo _021E5E5C
	adds r0, r7, #0
	adds r0, #0x88
	bl FUN_0201D8E4
	movs r0, #0x42
	bl FUN_0201660C
	movs r1, #0x46
	lsls r1, r1, #2
	str r0, [r7, r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5E90: .4byte 0x021E7DFC
	thumb_func_end ov68_021E5E48

	thumb_func_start ov68_021E5E94
ov68_021E5E94: @ 0x021E5E94
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x46
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r5, #0
	adds r4, #8
_021E5EA6:
	adds r0, r4, #0
	bl FUN_0201D520
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #0xf
	blo _021E5EA6
	movs r0, #4
	bl FUN_02002DB4
	pop {r3, r4, r5, pc}
	thumb_func_end ov68_021E5E94

	thumb_func_start ov68_021E5EBC
ov68_021E5EBC: @ 0x021E5EBC
	push {r4, lr}
	ldr r2, _021E5F14 @ =0x000002EB
	adds r4, r0, #0
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x42
	bl FUN_0200BAF8
	adds r1, r4, #0
	adds r1, #0xf8
	str r0, [r1]
	movs r0, #0x42
	bl FUN_0200BD08
	adds r1, r4, #0
	adds r1, #0xfc
	str r0, [r1]
	movs r0, #1
	lsls r0, r0, #8
	movs r1, #0x42
	bl FUN_02026354
	movs r1, #1
	lsls r1, r1, #8
	str r0, [r4, r1]
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r0, [r0]
	movs r1, #0x19
	bl FUN_0200BBA0
	movs r1, #0x41
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r0, [r0]
	movs r1, #0x1f
	bl FUN_0200BBA0
	movs r1, #0x42
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_021E5F14: .4byte 0x000002EB
	thumb_func_end ov68_021E5EBC

	thumb_func_start ov68_021E5F18
ov68_021E5F18: @ 0x021E5F18
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xf8
	ldr r0, [r0]
	bl FUN_0200BB44
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	bl FUN_0200BDA0
	movs r0, #1
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x41
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026380
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov68_021E5F18

	thumb_func_start ov68_021E5F50
ov68_021E5F50: @ 0x021E5F50
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E5F64
	movs r0, #0x1b
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	pop {r4, pc}
_021E5F64:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov68_021E5F50

	thumb_func_start ov68_021E5F68
ov68_021E5F68: @ 0x021E5F68
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02019F74
	movs r1, #0x73
	lsls r1, r1, #2
	strh r0, [r4, r1]
	subs r0, r1, #4
	ldr r0, [r4, r0]
	bl FUN_02019D18
	movs r1, #2
	adds r5, r0, #0
	mvns r1, r1
	cmp r5, r1
	bhi _021E5FB8
	bhs _021E604E
	cmp r5, #7
	bhi _021E5FB0
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5FA0: @ jump table
	.2byte _021E5FC8 - _021E5FA0 - 2 @ case 0
	.2byte _021E5FC8 - _021E5FA0 - 2 @ case 1
	.2byte _021E5FC8 - _021E5FA0 - 2 @ case 2
	.2byte _021E5FC8 - _021E5FA0 - 2 @ case 3
	.2byte _021E604E - _021E5FA0 - 2 @ case 4
	.2byte _021E604E - _021E5FA0 - 2 @ case 5
	.2byte _021E601E - _021E5FA0 - 2 @ case 6
	.2byte _021E603E - _021E5FA0 - 2 @ case 7
_021E5FB0:
	movs r0, #3
	mvns r0, r0
	cmp r5, r0
	b _021E604E
_021E5FB8:
	adds r0, r1, #1
	cmp r5, r0
	bhi _021E5FC2
	beq _021E601E
	b _021E604E
_021E5FC2:
	adds r0, r1, #2
	cmp r5, r0
	b _021E604E
_021E5FC8:
	bl FUN_02025358
	cmp r0, #0
	ldr r0, [r4]
	bne _021E5FF6
	ldrh r0, [r0, #0x16]
	adds r1, r0, r5
	movs r0, #0x6e
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r1, r0
	bhs _021E604E
	ldr r0, _021E6054 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov68_021E7A18
	adds r0, r4, #0
	bl ov68_021E7B94
	pop {r3, r4, r5, pc}
_021E5FF6:
	ldrh r0, [r0, #0x16]
	adds r1, r0, r5
	movs r0, #0x6e
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r1, r0
	bhs _021E6014
	ldr r0, _021E6054 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov68_021E7A18
	b _021E604E
_021E6014:
	adds r0, r4, #0
	movs r1, #5
	bl ov68_021E7A18
	b _021E604E
_021E601E:
	ldr r0, _021E6054 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #5
	bl ov68_021E7A18
	adds r0, r4, #0
	movs r1, #0
	bl ov68_021E7898
	adds r0, r4, #0
	movs r1, #0xe
	bl ov68_021E7A90
	pop {r3, r4, r5, pc}
_021E603E:
	ldr r0, _021E6054 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xf
	bl ov68_021E7AB4
	pop {r3, r4, r5, pc}
_021E604E:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E6054: .4byte 0x000005DD
	thumb_func_end ov68_021E5F68

	thumb_func_start ov68_021E6058
ov68_021E6058: @ 0x021E6058
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E6074 @ =0x000001B9
	ldrb r0, [r4, r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021E6070
	movs r0, #0x1b
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	pop {r4, pc}
_021E6070:
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
_021E6074: .4byte 0x000001B9
	thumb_func_end ov68_021E6058

	thumb_func_start ov68_021E6078
ov68_021E6078: @ 0x021E6078
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, [r4, #4]
	movs r3, #0x6d
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r1, #0x1a
	add r0, sp, #0
	strb r1, [r0, #0x10]
	movs r1, #0xa
	strb r1, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	movs r2, #0xf
	lsls r3, r3, #2
	bics r1, r2
	ldr r2, [r4, r3]
	subs r3, #0x9c
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	movs r2, #0xf
	ands r2, r5
	orrs r1, r2
	strb r1, [r0, #0x12]
	ldrb r2, [r0, #0x12]
	movs r1, #0xf0
	bics r2, r1
	strb r2, [r0, #0x12]
	ldr r0, [r4, r3]
	add r1, sp, #0
	bl FUN_020166FC
	movs r0, #1
	bl ov68_021E7BC8
	movs r0, #4
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov68_021E6078

	thumb_func_start ov68_021E60D8
ov68_021E60D8: @ 0x021E60D8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x46
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021E60F0
	cmp r0, #2
	beq _021E6108
	b _021E6120
_021E60F0:
	ldr r1, _021E6140 @ =0x000001BA
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	lsls r2, r1, #3
	ldr r1, _021E6144 @ =0x021E7D3C
	ldr r1, [r1, r2]
	blx r1
	adds r4, r0, #0
	movs r0, #0
	bl ov68_021E7BC8
	b _021E6124
_021E6108:
	ldr r1, _021E6140 @ =0x000001BA
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	lsls r2, r1, #3
	ldr r1, _021E6148 @ =0x021E7D40
	ldr r1, [r1, r2]
	blx r1
	adds r4, r0, #0
	movs r0, #0
	bl ov68_021E7BC8
	b _021E6124
_021E6120:
	movs r0, #4
	pop {r3, r4, r5, pc}
_021E6124:
	movs r0, #0x46
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020169C0
	movs r1, #0x6d
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0x9c
	ldr r0, [r5, r1]
	bl FUN_020169CC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6140: .4byte 0x000001BA
_021E6144: .4byte 0x021E7D3C
_021E6148: .4byte 0x021E7D40
	thumb_func_end ov68_021E60D8

	thumb_func_start ov68_021E614C
ov68_021E614C: @ 0x021E614C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ov68_021E6BEC
	str r0, [sp]
	ldr r1, [r4]
	add r2, sp, #0
	ldr r0, [r1]
	ldrb r1, [r1, #0x1b]
	adds r1, #0x36
	bl FUN_0206EC40
	movs r0, #0
	str r0, [sp]
	ldr r1, [r4]
	add r2, sp, #0
	ldr r0, [r1]
	ldrb r1, [r1, #0x1b]
	adds r1, #0x3e
	bl FUN_0206EC40
	adds r0, r4, #0
	bl ov68_021E6BEC
	movs r1, #0
	bl FUN_0207332C
	str r0, [sp]
	ldr r1, [r4]
	add r2, sp, #0
	ldr r0, [r1]
	ldrb r1, [r1, #0x1b]
	adds r1, #0x3a
	bl FUN_0206EC40
	ldr r0, [r4]
	movs r1, #0
	strb r1, [r0, #0x1a]
	movs r0, #8
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov68_021E614C

	thumb_func_start ov68_021E61A0
ov68_021E61A0: @ 0x021E61A0
	push {r4, lr}
	movs r1, #6
	adds r4, r0, #0
	bl ov68_021E6C14
	movs r0, #0x1b
	movs r1, #5
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov68_021E61A0

	thumb_func_start ov68_021E61B8
ov68_021E61B8: @ 0x021E61B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	ldrb r1, [r1, #0x1b]
	cmp r1, #4
	bhs _021E61CE
	movs r1, #0xa
	bl ov68_021E6C14
	movs r1, #4
	b _021E61D6
_021E61CE:
	movs r1, #7
	bl ov68_021E6C14
	movs r1, #3
_021E61D6:
	ldr r0, _021E61E8 @ =0x000001BA
	strb r1, [r4, r0]
	movs r0, #0x1b
	movs r1, #3
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r0, #2
	pop {r4, pc}
	nop
_021E61E8: .4byte 0x000001BA
	thumb_func_end ov68_021E61B8

	thumb_func_start ov68_021E61EC
ov68_021E61EC: @ 0x021E61EC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0x42
	bl FUN_020880CC
	movs r0, #0x1b
	movs r1, #9
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov68_021E61EC

	thumb_func_start ov68_021E6204
ov68_021E6204: @ 0x021E6204
	push {r4, lr}
	adds r4, r0, #0
	bl ov68_021E6BEC
	adds r1, r0, #0
	ldr r0, _021E6230 @ =0x0000FFFF
	cmp r1, r0
	beq _021E621C
	adds r0, r4, #0
	bl ov68_021E68D4
	b _021E6226
_021E621C:
	movs r1, #1
	adds r0, r4, #0
	mvns r1, r1
	bl ov68_021E68D4
_021E6226:
	adds r0, r4, #0
	bl ov68_021E70BC
	pop {r4, pc}
	nop
_021E6230: .4byte 0x0000FFFF
	thumb_func_end ov68_021E6204

	thumb_func_start ov68_021E6234
ov68_021E6234: @ 0x021E6234
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [sp, #0x28]
	adds r4, r1, #0
	adds r7, r2, #0
	str r3, [sp, #0x10]
	cmp r0, #0
	beq _021E6250
	cmp r0, #1
	beq _021E6254
	cmp r0, #2
	beq _021E627E
	b _021E62AA
_021E6250:
	movs r3, #0
	b _021E62AA
_021E6254:
	movs r1, #1
	lsls r1, r1, #8
	ldr r1, [r5, r1]
	adds r0, r7, #0
	movs r2, #0
	bl FUN_02002F30
	lsls r0, r0, #0x18
	adds r1, r5, #0
	lsrs r6, r0, #0x18
	adds r1, #8
	lsls r0, r4, #4
	adds r0, r1, r0
	bl FUN_0201EE90
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x18
	subs r0, r0, r6
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _021E62AA
_021E627E:
	movs r1, #1
	lsls r1, r1, #8
	ldr r1, [r5, r1]
	adds r0, r7, #0
	movs r2, #0
	bl FUN_02002F30
	lsls r0, r0, #0x18
	adds r1, r5, #0
	lsrs r6, r0, #0x18
	adds r1, #8
	lsls r0, r4, #4
	adds r0, r1, r0
	bl FUN_0201EE90
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x18
	subs r1, r0, r6
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0x17
	lsrs r3, r0, #0x18
_021E62AA:
	add r0, sp, #0x18
	ldrb r0, [r0, #0x14]
	adds r1, r5, #0
	movs r2, #0xff
	str r0, [sp]
	str r2, [sp, #4]
	ldr r0, [sp, #0x10]
	adds r2, r2, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r1, #8
	lsls r0, r4, #4
	adds r0, r1, r0
	ldr r2, [r5, r2]
	adds r1, r7, #0
	bl FUN_020200FC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov68_021E6234

	thumb_func_start ov68_021E62D4
ov68_021E62D4: @ 0x021E62D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0xf8
	ldr r0, [r0]
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	movs r1, #0
	adds r2, r6, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xfc
	ldr r0, [r0]
	adds r3, r7, #0
	bl FUN_0200BFCC
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0xfc
	lsls r1, r1, #8
	ldr r0, [r0]
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov68_021E62D4

	thumb_func_start ov68_021E6320
ov68_021E6320: @ 0x021E6320
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	movs r1, #0x24
	adds r2, r1, #0
	adds r5, r0, #0
	adds r0, #0xf8
	adds r2, #0xdc
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r2, #0
	str r2, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r3, _021E666C @ =0x00010200
	adds r0, r5, #0
	movs r1, #7
	bl ov68_021E6234
	adds r0, r5, #0
	adds r0, #0x78
	bl FUN_0201D5C8
	movs r1, #0x23
	adds r0, r5, #0
	adds r2, r1, #0
	adds r0, #0xf8
	adds r2, #0xdd
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r0, #2
	str r0, [sp]
	movs r2, #4
	ldr r3, _021E6670 @ =0x000F0E00
	adds r0, r5, #0
	movs r1, #8
	str r2, [sp, #4]
	bl ov68_021E6234
	movs r1, #0x22
	adds r0, r5, #0
	adds r2, r1, #0
	adds r0, #0xf8
	adds r2, #0xde
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r0, #2
	str r0, [sp]
	movs r2, #4
	ldr r3, _021E6670 @ =0x000F0E00
	adds r0, r5, #0
	movs r1, #9
	str r2, [sp, #4]
	bl ov68_021E6234
	adds r0, r5, #0
	adds r0, #0x98
	bl FUN_0201D5C8
	movs r1, #0x16
	adds r0, r5, #0
	adds r2, r1, #0
	adds r0, #0xf8
	adds r2, #0xea
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	ldr r3, _021E6670 @ =0x000F0E00
	adds r0, r5, #0
	adds r2, r1, #0
	str r1, [sp, #4]
	bl ov68_021E6234
	adds r0, r5, #0
	adds r0, #8
	bl FUN_0201D5C8
	movs r1, #0x17
	adds r0, r5, #0
	adds r2, r1, #0
	adds r0, #0xf8
	adds r2, #0xe9
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r2, #0
	str r2, [sp]
	ldr r3, _021E6670 @ =0x000F0E00
	adds r0, r5, #0
	movs r1, #1
	str r2, [sp, #4]
	bl ov68_021E6234
	adds r0, r5, #0
	adds r0, #0x18
	bl FUN_0201D5C8
	movs r1, #0x18
	adds r0, r5, #0
	adds r2, r1, #0
	adds r0, #0xf8
	adds r2, #0xe8
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r2, #0
	str r2, [sp]
	ldr r3, _021E6670 @ =0x000F0E00
	adds r0, r5, #0
	movs r1, #2
	str r2, [sp, #4]
	bl ov68_021E6234
	adds r0, r5, #0
	adds r0, #0x28
	bl FUN_0201D5C8
	movs r0, #1
	lsls r0, r0, #8
	movs r1, #0x42
	bl FUN_02026354
	str r0, [sp, #0x20]
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	ldr r2, [sp, #0x20]
	movs r1, #0x27
	bl FUN_0200BB6C
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200BF8C
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0xfc
	lsls r1, r1, #8
	ldr r0, [r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x20]
	bl FUN_0200CBBC
	movs r2, #0
	str r2, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r3, _021E666C @ =0x00010200
	adds r0, r5, #0
	movs r1, #0xc
	bl ov68_021E6234
	adds r0, r5, #0
	adds r0, #0xc8
	bl FUN_0201D5C8
	ldr r2, _021E6674 @ =0x000002EE
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x42
	bl FUN_0200BAF8
	str r0, [sp, #0x1c]
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02070DB0
	str r0, [sp, #0x18]
	adds r0, r5, #0
	movs r4, #0
	str r0, [sp, #0x24]
	adds r0, #0xd8
	adds r7, r5, #0
	str r4, [sp, #0x10]
	movs r6, #0x10
	str r0, [sp, #0x24]
_021E64A2:
	adds r1, r4, #0
	ldr r0, [sp, #0x18]
	adds r1, #0x36
	movs r2, #0
	bl FUN_0206E640
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	bne _021E64C4
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r1, #0
	bl FUN_0200DCE8
	b _021E659C
_021E64C4:
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r1, #1
	bl FUN_0200DCE8
	adds r2, r4, #4
	lsls r2, r2, #0x10
	ldr r1, [sp, #0x14]
	adds r0, r5, #0
	lsrs r2, r2, #0x10
	bl ov68_021E7028
	movs r2, #1
	lsls r2, r2, #8
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x14]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r3, _021E6670 @ =0x000F0E00
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xd
	movs r2, #0
	bl ov68_021E6234
	movs r2, #0x41
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E666C @ =0x00010200
	lsls r2, r2, #2
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	ldr r2, [r5, r2]
	movs r1, #0
	movs r3, #0x10
	bl FUN_020200FC
	adds r1, r4, #0
	ldr r0, [sp, #0x18]
	adds r1, #0x3a
	movs r2, #0
	bl FUN_0206E640
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0
	movs r3, #2
	bl FUN_0200BFCC
	adds r1, r4, #0
	ldr r0, [sp, #0x18]
	adds r1, #0x42
	movs r2, #0
	bl FUN_0206E640
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #1
	movs r3, #2
	bl FUN_0200BFCC
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0x42
	adds r0, #0xfc
	lsls r1, r1, #8
	lsls r2, r2, #2
	ldr r0, [r0]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r2, #1
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E666C @ =0x00010200
	lsls r2, r2, #8
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	ldr r2, [r5, r2]
	movs r1, #0
	movs r3, #0x2d
	bl FUN_020200FC
_021E659C:
	ldr r0, [sp, #0x10]
	adds r4, r4, #1
	adds r0, #0x20
	adds r7, r7, #4
	adds r6, #0x20
	str r0, [sp, #0x10]
	cmp r4, #4
	bhs _021E65AE
	b _021E64A2
_021E65AE:
	adds r0, r5, #0
	adds r0, #0xd8
	bl FUN_0201D5C8
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	ldr r2, [sp, #0x20]
	movs r1, #0x25
	bl FUN_0200BB6C
	adds r0, r5, #0
	adds r0, #0xfc
	ldr r0, [r0]
	ldr r2, [sp, #0x18]
	movs r1, #0
	bl FUN_0200BF1C
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0xfc
	lsls r1, r1, #8
	ldr r0, [r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x20]
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E666C @ =0x00010200
	adds r2, r2, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, r2]
	adds r0, #0xe8
	adds r3, r1, #0
	bl FUN_020200FC
	adds r0, r5, #0
	adds r0, #0xf8
	ldr r0, [r0]
	ldr r2, [sp, #0x20]
	movs r1, #0x26
	bl FUN_0200BB6C
	ldr r0, [sp, #0x18]
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E640
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0xfc
	lsls r1, r1, #8
	ldr r0, [r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x20]
	bl FUN_0200CBBC
	movs r0, #1
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r3, _021E666C @ =0x00010200
	adds r0, r5, #0
	movs r1, #0xe
	movs r2, #0
	bl ov68_021E6234
	adds r5, #0xe8
	adds r0, r5, #0
	bl FUN_0201D5C8
	ldr r0, [sp, #0x1c]
	bl FUN_0200BB44
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E666C: .4byte 0x00010200
_021E6670: .4byte 0x000F0E00
_021E6674: .4byte 0x000002EE
	thumb_func_end ov68_021E6320

	thumb_func_start ov68_021E6678
ov68_021E6678: @ 0x021E6678
	push {r3, r4}
	ldr r0, [r0]
	ldr r1, _021E669C @ =0x0000FFFF
	ldr r4, [r0, #0x10]
	movs r0, #1
	movs r3, #0
	lsls r0, r0, #8
_021E6686:
	ldrh r2, [r4]
	cmp r2, r1
	beq _021E6694
	adds r3, r3, #1
	adds r4, r4, #2
	cmp r3, r0
	blo _021E6686
_021E6694:
	adds r0, r3, #0
	pop {r3, r4}
	bx lr
	nop
_021E669C: .4byte 0x0000FFFF
	thumb_func_end ov68_021E6678

	thumb_func_start ov68_021E66A0
ov68_021E66A0: @ 0x021E66A0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	movs r0, #0x71
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r6, r1, #0
	str r3, [sp]
	adds r5, r2, #0
	add r1, sp, #0x20
	ldrb r2, [r1, #0x10]
	adds r3, r5, #0
	str r2, [sp, #4]
	adds r2, r0, #0
	adds r2, #0xc
	str r2, [sp, #8]
	ldrb r2, [r1, #0x14]
	str r2, [sp, #0xc]
	ldrb r1, [r1, #0x18]
	adds r2, r6, #0
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #7
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4, #4]
	bl FUN_0201C4EC
	ldr r0, [r4, #4]
	movs r1, #7
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov68_021E66A0

	thumb_func_start ov68_021E66F0
ov68_021E66F0: @ 0x021E66F0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r3, r1, r2
	movs r1, #0x6e
	adds r5, r0, #0
	lsls r1, r1, #2
	ldrb r1, [r5, r1]
	lsls r4, r2, #5
	cmp r3, r1
	blt _021E6720
	movs r3, #4
	lsls r2, r2, #2
	adds r2, r2, #4
	lsls r2, r2, #0x18
	str r3, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r3, [sp, #8]
	lsrs r2, r2, #0x18
	movs r3, #0x10
	bl ov68_021E66A0
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021E6720:
	str r4, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E67D8 @ =0x000F0E00
	movs r1, #0
	str r0, [sp, #8]
	lsls r6, r3, #3
	adds r0, r5, #0
	str r1, [sp, #0xc]
	adds r2, #0x11
	ldr r2, [r5, r2]
	adds r0, #0xa8
	ldr r2, [r2, r6]
	adds r3, r1, #0
	bl FUN_020200FC
	adds r0, r4, #0
	adds r0, #0x10
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E67DC @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	str r1, [sp, #0xc]
	adds r2, r2, #5
	ldr r2, [r5, r2]
	adds r0, #0xa8
	movs r3, #0x10
	bl FUN_020200FC
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	adds r0, r0, r6
	ldr r0, [r0, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0207332C
	adds r6, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0
	adds r2, r6, #0
	movs r3, #2
	bl FUN_0200BFCC
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	adds r0, r5, #0
	str r1, [sp, #4]
	adds r0, #0xfc
	ldr r0, [r0]
	adds r2, r6, #0
	movs r3, #2
	bl FUN_0200BFCC
	movs r2, #1
	adds r0, r5, #0
	lsls r2, r2, #8
	adds r0, #0xfc
	ldr r1, [r5, r2]
	adds r2, #8
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	adds r4, #0x10
	str r4, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E67DC @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	str r1, [sp, #0xc]
	adds r2, r2, #1
	ldr r2, [r5, r2]
	adds r0, #0xa8
	movs r3, #0x2d
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E67D8: .4byte 0x000F0E00
_021E67DC: .4byte 0x00010200
	thumb_func_end ov68_021E66F0

	thumb_func_start ov68_021E67E0
ov68_021E67E0: @ 0x021E67E0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0xa8
	movs r1, #0
	bl FUN_0201D978
	movs r4, #0
_021E67EE:
	ldr r1, [r5]
	lsls r2, r4, #0x18
	ldrh r1, [r1, #0x16]
	adds r0, r5, #0
	lsrs r2, r2, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov68_021E66F0
	adds r4, r4, #1
	cmp r4, #4
	blo _021E67EE
	adds r0, r5, #0
	adds r0, #0xa8
	bl FUN_0201D5C8
	ldr r0, [r5, #4]
	movs r1, #7
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl ov68_021E70BC
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov68_021E67E0

	thumb_func_start ov68_021E6820
ov68_021E6820: @ 0x021E6820
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov68_021E6678
	movs r1, #0x6e
	lsls r1, r1, #2
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	movs r1, #0x42
	bl FUN_02014918
	movs r1, #0x11
	lsls r1, r1, #4
	str r0, [r5, r1]
	ldr r2, _021E68B8 @ =0x000002EE
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x42
	bl FUN_0200BAF8
	adds r7, r0, #0
	movs r0, #0x6e
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	movs r4, #0
	cmp r0, #0
	bls _021E689A
	adds r6, r4, #0
_021E6858:
	ldr r0, [r5]
	ldr r0, [r0, #0x10]
	ldrh r2, [r0, r6]
	ldr r0, _021E68BC @ =0x0000FFFF
	cmp r2, r0
	beq _021E6874
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r7, #0
	adds r3, r2, #0
	bl FUN_02014960
	b _021E688C
_021E6874:
	movs r0, #0x11
	adds r1, r5, #0
	lsls r0, r0, #4
	adds r1, #0xf8
	movs r2, #0x20
	adds r3, r2, #0
	ldr r0, [r5, r0]
	ldr r1, [r1]
	subs r3, #0x22
	bl FUN_02014960
	b _021E689A
_021E688C:
	movs r0, #0x6e
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	adds r4, r4, #1
	adds r6, r6, #2
	cmp r4, r0
	blo _021E6858
_021E689A:
	adds r0, r7, #0
	bl FUN_0200BB44
	ldr r0, _021E68C0 @ =0x000001BB
	movs r1, #0
	strb r1, [r5, r0]
	ldr r1, [r5]
	adds r0, r0, #1
	ldrh r1, [r1, #0x14]
	strb r1, [r5, r0]
	adds r0, r5, #0
	bl ov68_021E67E0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E68B8: .4byte 0x000002EE
_021E68BC: .4byte 0x0000FFFF
_021E68C0: .4byte 0x000001BB
	thumb_func_end ov68_021E6820

	thumb_func_start ov68_021E68C4
ov68_021E68C4: @ 0x021E68C4
	movs r1, #0x11
	lsls r1, r1, #4
	ldr r3, _021E68D0 @ =FUN_02014950
	ldr r0, [r0, r1]
	bx r3
	nop
_021E68D0: .4byte FUN_02014950
	thumb_func_end ov68_021E68C4

	thumb_func_start ov68_021E68D4
ov68_021E68D4: @ 0x021E68D4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #0x58
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x38
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _021E69EE
	adds r0, r4, #0
	movs r1, #2
	bl FUN_02073314
	adds r2, r0, #0
	cmp r2, #1
	bhi _021E692E
	movs r1, #0x21
	adds r0, r5, #0
	adds r2, r1, #0
	adds r0, #0xf8
	adds r2, #0xdf
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	b _021E693C
_021E692E:
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x1d
	movs r3, #3
	bl ov68_021E62D4
_021E693C:
	movs r0, #1
	str r0, [sp]
	movs r2, #0
	ldr r3, _021E6A24 @ =0x00010200
	adds r0, r5, #0
	movs r1, #3
	str r2, [sp, #4]
	bl ov68_021E6234
	adds r0, r4, #0
	movs r1, #4
	bl FUN_02073314
	adds r2, r0, #0
	bne _021E696E
	movs r1, #0x21
	adds r0, r5, #0
	adds r2, r1, #0
	adds r0, #0xf8
	adds r2, #0xdf
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	b _021E697C
_021E696E:
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x1e
	movs r3, #3
	bl ov68_021E62D4
_021E697C:
	movs r0, #1
	str r0, [sp]
	movs r2, #0
	ldr r3, _021E6A24 @ =0x00010200
	adds r0, r5, #0
	movs r1, #4
	str r2, [sp, #4]
	bl ov68_021E6234
	ldr r2, _021E6A28 @ =0x000002ED
	movs r0, #1
	movs r1, #0x1b
	movs r3, #0x42
	bl FUN_0200BAF8
	movs r2, #1
	lsls r2, r2, #8
	ldr r2, [r5, r2]
	adds r1, r4, #0
	adds r6, r0, #0
	bl FUN_0200BB6C
	movs r2, #0
	str r2, [sp]
	ldr r3, _021E6A24 @ =0x00010200
	adds r0, r5, #0
	movs r1, #5
	str r2, [sp, #4]
	bl ov68_021E6234
	adds r0, r6, #0
	bl FUN_0200BB44
	lsls r1, r4, #0x10
	adds r0, r5, #0
	lsrs r1, r1, #0x10
	bl ov68_021E7124
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DCE8
	adds r0, r5, #0
	adds r0, #8
	bl FUN_0201D5C8
	adds r0, r5, #0
	adds r0, #0x18
	bl FUN_0201D5C8
	adds r0, r5, #0
	adds r0, #0x28
	bl FUN_0201D5C8
	b _021E6A06
_021E69EE:
	adds r0, r5, #0
	adds r0, #8
	bl FUN_0201D8E4
	adds r0, r5, #0
	adds r0, #0x18
	bl FUN_0201D8E4
	adds r0, r5, #0
	adds r0, #0x28
	bl FUN_0201D8E4
_021E6A06:
	adds r0, r5, #0
	adds r0, #0x58
	bl FUN_0201D5C8
	adds r0, r5, #0
	adds r0, #0x38
	bl FUN_0201D5C8
	adds r5, #0x48
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E6A24: .4byte 0x00010200
_021E6A28: .4byte 0x000002ED
	thumb_func_end ov68_021E68D4

	thumb_func_start ov68_021E6A2C
ov68_021E6A2C: @ 0x021E6A2C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0xa
	bls _021E6A38
	b _021E6BB0
_021E6A38:
	adds r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E6A44: @ jump table
	.2byte _021E6A5A - _021E6A44 - 2 @ case 0
	.2byte _021E6A72 - _021E6A44 - 2 @ case 1
	.2byte _021E6A86 - _021E6A44 - 2 @ case 2
	.2byte _021E6A9E - _021E6A44 - 2 @ case 3
	.2byte _021E6ACA - _021E6A44 - 2 @ case 4
	.2byte _021E6AF6 - _021E6A44 - 2 @ case 5
	.2byte _021E6B22 - _021E6A44 - 2 @ case 6
	.2byte _021E6B4E - _021E6A44 - 2 @ case 7
	.2byte _021E6B62 - _021E6A44 - 2 @ case 8
	.2byte _021E6B8E - _021E6A44 - 2 @ case 9
	.2byte _021E6B9E - _021E6A44 - 2 @ case 10
_021E6A5A:
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200BF8C
	b _021E6BB0
_021E6A72:
	bl ov68_021E6BEC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200BFF0
	b _021E6BB0
_021E6A86:
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200BF8C
	b _021E6BB0
_021E6A9E:
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200BF8C
	adds r0, r4, #0
	bl ov68_021E6BEC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200BFF0
	b _021E6BB0
_021E6ACA:
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200BF8C
	adds r0, r4, #0
	bl ov68_021E6BEC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200BFF0
	b _021E6BB0
_021E6AF6:
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200BF8C
	adds r0, r4, #0
	bl ov68_021E6BFC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200BFF0
	b _021E6BB0
_021E6B22:
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200BF8C
	adds r0, r4, #0
	bl ov68_021E6BEC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200BFF0
	b _021E6BB0
_021E6B4E:
	bl ov68_021E6BEC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200BFF0
	b _021E6BB0
_021E6B62:
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200BF8C
	adds r0, r4, #0
	bl ov68_021E6BEC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200BFF0
	b _021E6BB0
_021E6B8E:
	ldr r2, [r4]
	adds r0, #0xfc
	ldr r0, [r0]
	ldr r2, [r2, #4]
	movs r1, #2
	bl FUN_0200BE48
	b _021E6BB0
_021E6B9E:
	bl ov68_021E6BFC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200BFF0
_021E6BB0:
	ldr r1, [r4]
	adds r0, r4, #0
	ldrb r2, [r1, #0x19]
	adds r0, #0xf8
	movs r1, #0x2c
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _021E6BE8 @ =0x021E7DA4
	lsls r2, r5, #2
	adds r1, r1, r3
	ldr r0, [r0]
	ldr r1, [r2, r1]
	bl FUN_0200BBA0
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0xfc
	lsls r1, r1, #8
	ldr r0, [r0]
	ldr r1, [r4, r1]
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6BE8: .4byte 0x021E7DA4
	thumb_func_end ov68_021E6A2C

	thumb_func_start ov68_021E6BEC
ov68_021E6BEC: @ 0x021E6BEC
	ldr r0, [r0]
	ldr r2, [r0, #0x10]
	ldrh r1, [r0, #0x16]
	ldrh r0, [r0, #0x14]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldrh r0, [r2, r0]
	bx lr
	thumb_func_end ov68_021E6BEC

	thumb_func_start ov68_021E6BFC
ov68_021E6BFC: @ 0x021E6BFC
	push {r3, lr}
	ldr r1, [r0]
	movs r2, #0
	ldr r0, [r1]
	ldrb r1, [r1, #0x1b]
	adds r1, #0x36
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov68_021E6BFC

	thumb_func_start ov68_021E6C14
ov68_021E6C14: @ 0x021E6C14
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, #0x68
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #0
	movs r2, #0x3d
	movs r3, #0xd
	bl FUN_0200E998
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov68_021E6A2C
	movs r0, #1
	bl FUN_02002B34
	ldr r0, [r4]
	ldr r0, [r0, #8]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6C6C @ =ov68_021E6C8C
	movs r1, #1
	adds r2, r1, #0
	str r0, [sp, #8]
	adds r2, #0xff
	adds r0, r4, #0
	ldr r2, [r4, r2]
	adds r0, #0x68
	bl FUN_020200A8
	ldr r1, _021E6C70 @ =0x000001B9
	strb r0, [r4, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E6C6C: .4byte ov68_021E6C8C
_021E6C70: .4byte 0x000001B9
	thumb_func_end ov68_021E6C14

	thumb_func_start ov68_021E6C74
ov68_021E6C74: @ 0x021E6C74
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x68
	movs r1, #1
	bl FUN_0200E9BC
	adds r4, #0x68
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov68_021E6C74

	thumb_func_start ov68_021E6C8C
ov68_021E6C8C: @ 0x021E6C8C
	push {r3, lr}
	cmp r1, #5
	bhi _021E6CD0
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E6C9E: @ jump table
	.2byte _021E6CD0 - _021E6C9E - 2 @ case 0
	.2byte _021E6CAA - _021E6C9E - 2 @ case 1
	.2byte _021E6CB0 - _021E6C9E - 2 @ case 2
	.2byte _021E6CB6 - _021E6C9E - 2 @ case 3
	.2byte _021E6CBE - _021E6C9E - 2 @ case 4
	.2byte _021E6CC8 - _021E6C9E - 2 @ case 5
_021E6CAA:
	bl FUN_02006198
	pop {r3, pc}
_021E6CB0:
	bl FUN_02006BCC
	pop {r3, pc}
_021E6CB6:
	ldr r0, _021E6CD4 @ =0x000005E6
	bl FUN_0200604C
	b _021E6CD0
_021E6CBE:
	movs r0, #0x4a
	lsls r0, r0, #4
	bl FUN_02006B24
	b _021E6CD0
_021E6CC8:
	ldr r0, _021E6CD4 @ =0x000005E6
	bl FUN_02006184
	pop {r3, pc}
_021E6CD0:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_021E6CD4: .4byte 0x000005E6
	thumb_func_end ov68_021E6C8C

	thumb_func_start ov68_021E6CD8
ov68_021E6CD8: @ 0x021E6CD8
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r5, r0, #0
	adds r6, r4, #0
_021E6CE0:
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0]
	adds r1, #0x36
	adds r2, r6, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _021E6CFC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _021E6CE0
_021E6CFC:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov68_021E6CD8

	thumb_func_start ov68_021E6D00
ov68_021E6D00: @ 0x021E6D00
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #3
	bl ov68_021E6C14
	adds r0, r4, #0
	bl ov68_021E6CD8
	ldr r1, [r4]
	strb r0, [r1, #0x1b]
	movs r0, #0x1b
	movs r1, #5
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r0, #2
	pop {r4, pc}
	thumb_func_end ov68_021E6D00

	thumb_func_start ov68_021E6D20
ov68_021E6D20: @ 0x021E6D20
	push {r4, lr}
	adds r4, r0, #0
	bl ov68_021E6C74
	ldr r0, _021E6D3C @ =0x000001CE
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _021E6D38
	adds r0, r4, #0
	movs r1, #5
	bl ov68_021E7A18
_021E6D38:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_021E6D3C: .4byte 0x000001CE
	thumb_func_end ov68_021E6D20

	thumb_func_start ov68_021E6D40
ov68_021E6D40: @ 0x021E6D40
	ldr r0, [r0]
	movs r1, #1
	strb r1, [r0, #0x1a]
	movs r0, #8
	bx lr
	.align 2, 0
	thumb_func_end ov68_021E6D40

	thumb_func_start ov68_021E6D4C
ov68_021E6D4C: @ 0x021E6D4C
	push {r3, lr}
	bl ov68_021E6C74
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov68_021E6D4C

	thumb_func_start ov68_021E6D58
ov68_021E6D58: @ 0x021E6D58
	movs r1, #0x1b
	movs r2, #0xa
	lsls r1, r1, #4
	str r2, [r0, r1]
	movs r0, #0
	bx lr
	thumb_func_end ov68_021E6D58

	thumb_func_start ov68_021E6D64
ov68_021E6D64: @ 0x021E6D64
	push {r4, lr}
	movs r1, #7
	adds r4, r0, #0
	bl ov68_021E6C14
	ldr r0, _021E6D7C @ =0x000001BA
	movs r1, #3
	strb r1, [r4, r0]
	subs r0, #0xa
	str r1, [r4, r0]
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
_021E6D7C: .4byte 0x000001BA
	thumb_func_end ov68_021E6D64

	thumb_func_start ov68_021E6D80
ov68_021E6D80: @ 0x021E6D80
	push {r4, lr}
	movs r1, #8
	adds r4, r0, #0
	bl ov68_021E6C14
	movs r0, #0x1b
	movs r1, #8
	lsls r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4]
	movs r1, #1
	strb r1, [r0, #0x1a]
	movs r0, #2
	pop {r4, pc}
	thumb_func_end ov68_021E6D80

	thumb_func_start ov68_021E6D9C
ov68_021E6D9C: @ 0x021E6D9C
	push {r4, lr}
	movs r1, #4
	adds r4, r0, #0
	bl ov68_021E6C14
	ldr r1, _021E6DB4 @ =0x000001BA
	movs r0, #2
	strb r0, [r4, r1]
	movs r2, #3
	subs r1, #0xa
	str r2, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_021E6DB4: .4byte 0x000001BA
	thumb_func_end ov68_021E6D9C

	thumb_func_start ov68_021E6DB8
ov68_021E6DB8: @ 0x021E6DB8
	push {r4, lr}
	movs r1, #5
	adds r4, r0, #0
	bl ov68_021E6C14
	movs r0, #0x1b
	movs r1, #6
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov68_021E6DB8

	thumb_func_start ov68_021E6DD0
ov68_021E6DD0: @ 0x021E6DD0
	movs r1, #0x1b
	movs r2, #0xa
	lsls r1, r1, #4
	str r2, [r0, r1]
	movs r0, #0
	bx lr
	thumb_func_end ov68_021E6DD0

	thumb_func_start ov68_021E6DDC
ov68_021E6DDC: @ 0x021E6DDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	ldr r3, _021E6E78 @ =0x021E7C2C
	add r2, sp, #0x34
	adds r4, r0, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r0, #0x40
	movs r1, #0x42
	bl FUN_0202055C
	movs r0, #0x42
	bl FUN_0200CF18
	movs r1, #0x47
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl FUN_0200CF38
	movs r7, #0x12
	lsls r7, r7, #4
	add r2, sp, #0x14
	ldr r3, _021E6E7C @ =0x021E7CD0
	str r0, [r4, r7]
	ldm r3!, {r0, r1}
	adds r6, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	ldr r5, _021E6E80 @ =0x021E7C18
	stm r2!, {r0, r1}
	add r3, sp, #0
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	adds r1, r6, #0
	str r0, [r3]
	subs r0, r7, #4
	ldr r0, [r4, r0]
	movs r3, #0x20
	bl FUN_0200CF70
	subs r1, r7, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0xc
	bl FUN_0200CFF4
	subs r1, r7, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0x34
	bl FUN_0200D3F8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_021E6E78: .4byte 0x021E7C2C
_021E6E7C: .4byte 0x021E7CD0
_021E6E80: .4byte 0x021E7C18
	thumb_func_end ov68_021E6DDC

	thumb_func_start ov68_021E6E84
ov68_021E6E84: @ 0x021E6E84
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0x49
	movs r4, #0
	adds r5, r7, #0
	lsls r6, r6, #2
_021E6E90:
	ldr r0, [r5, r6]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xc
	blo _021E6E90
	movs r1, #0x47
	lsls r1, r1, #2
	ldr r0, [r7, r1]
	adds r1, r1, #4
	ldr r1, [r7, r1]
	bl FUN_0200D998
	movs r0, #0x47
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_0200D108
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov68_021E6E84

	thumb_func_start ov68_021E6EB8
ov68_021E6EB8: @ 0x021E6EB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	adds r6, r1, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _021E7014 @ =0x0000B8A8
	movs r1, #0x47
	lsls r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #6
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _021E7018 @ =0x0000B8A9
	movs r1, #0x47
	lsls r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #0xb
	bl FUN_0200D504
	ldr r4, _021E701C @ =0x0000B8AB
	adds r7, r4, #4
_021E6F00:
	cmp r4, r7
	str r4, [sp]
	bhs _021E6F1C
	movs r0, #0x47
	movs r1, #0x12
	lsls r0, r0, #2
	lsls r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	movs r2, #2
	movs r3, #0
	bl FUN_020776B8
	b _021E6F30
_021E6F1C:
	movs r0, #0x47
	movs r1, #0x12
	lsls r0, r0, #2
	lsls r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	movs r2, #1
	movs r3, #0
	bl FUN_020776B8
_021E6F30:
	ldr r0, _021E7020 @ =0x0000B8B2
	adds r4, r4, #1
	cmp r4, r0
	bls _021E6F00
	movs r1, #0x47
	subs r0, #8
	lsls r1, r1, #2
	str r0, [sp]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #2
	movs r3, #0
	bl FUN_02077834
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, _021E7014 @ =0x0000B8A8
	movs r1, #0x47
	lsls r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #5
	bl FUN_0200D5D4
	movs r1, #0x47
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	ldr r3, _021E7018 @ =0x0000B8A9
	movs r2, #2
	bl FUN_020776EC
	movs r1, #0x47
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	ldr r3, _021E7024 @ =0x0000B8AA
	movs r2, #1
	bl FUN_020776EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E7014 @ =0x0000B8A8
	movs r1, #0x47
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #7
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E7018 @ =0x0000B8A9
	movs r1, #0x47
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #0xa
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E7014 @ =0x0000B8A8
	movs r1, #0x47
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #8
	bl FUN_0200D71C
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E7018 @ =0x0000B8A9
	movs r1, #0x47
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #9
	bl FUN_0200D71C
	movs r1, #0x47
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r2, _021E7024 @ =0x0000B8AA
	ldr r1, [r5, r1]
	adds r3, r2, #0
	bl FUN_0207775C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7014: .4byte 0x0000B8A8
_021E7018: .4byte 0x0000B8A9
_021E701C: .4byte 0x0000B8AB
_021E7020: .4byte 0x0000B8B2
_021E7024: .4byte 0x0000B8AA
	thumb_func_end ov68_021E6EB8

	thumb_func_start ov68_021E7028
ov68_021E7028: @ 0x021E7028
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r2, #0
	ldrb r0, [r0, #0x18]
	cmp r0, #0
	bne _021E7044
	adds r0, r1, #0
	movs r1, #3
	bl FUN_02073314
	adds r6, r0, #0
	b _021E7050
_021E7044:
	adds r0, r1, #0
	movs r1, #0xb
	bl FUN_02073314
	adds r6, r0, #0
	adds r6, #0x12
_021E7050:
	bl FUN_020776B4
	adds r7, r0, #0
	adds r0, r6, #0
	bl FUN_02077678
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, _021E70B8 @ =0x0000B8AB
	movs r1, #0x47
	adds r0, r4, r0
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r7, #0
	bl FUN_0200E248
	cmp r4, #4
	bhs _021E709A
	adds r0, r6, #0
	bl FUN_0207769C
	adds r1, r0, #0
	adds r0, r4, #4
	lsls r0, r0, #2
	adds r2, r5, r0
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	adds r1, r1, #4
	bl FUN_0200DD10
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E709A:
	adds r0, r6, #0
	bl FUN_0207769C
	adds r1, r0, #0
	adds r0, r4, #4
	lsls r0, r0, #2
	adds r2, r5, r0
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	bl FUN_0200DD10
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E70B8: .4byte 0x0000B8AB
	thumb_func_end ov68_021E7028

	thumb_func_start ov68_021E70BC
ov68_021E70BC: @ 0x021E70BC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r4, #0
	movs r7, #0x28
	adds r5, r6, #0
_021E70C6:
	movs r0, #0x4d
	lsls r0, r0, #2
	lsls r2, r7, #0x10
	ldr r0, [r5, r0]
	movs r1, #0x16
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r0, [r6]
	ldrh r0, [r0, #0x16]
	adds r1, r0, r4
	movs r0, #0x6e
	lsls r0, r0, #2
	ldrb r0, [r6, r0]
	cmp r1, r0
	blo _021E70F4
	movs r0, #0x4d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	b _021E7116
_021E70F4:
	movs r0, #0x4d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r2, [r6]
	adds r0, r6, #0
	ldr r1, [r2, #0x10]
	ldrh r2, [r2, #0x16]
	adds r2, r2, r4
	lsls r2, r2, #1
	ldrh r1, [r1, r2]
	lsls r2, r4, #0x10
	lsrs r2, r2, #0x10
	bl ov68_021E7028
_021E7116:
	adds r4, r4, #1
	adds r7, #0x20
	adds r5, r5, #4
	cmp r4, #4
	blo _021E70C6
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov68_021E70BC

	thumb_func_start ov68_021E7124
ov68_021E7124: @ 0x021E7124
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, r1, #0
	movs r1, #1
	bl FUN_02073314
	adds r4, r0, #0
	bl FUN_02077830
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_02077800
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, _021E7174 @ =0x0000B8AA
	movs r1, #0x47
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl FUN_0200E248
	adds r0, r4, #0
	bl FUN_02077818
	adds r1, r0, #0
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r1, #4
	bl FUN_0200DD10
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E7174: .4byte 0x0000B8AA
	thumb_func_end ov68_021E7124

	thumb_func_start ov68_021E7178
ov68_021E7178: @ 0x021E7178
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	bl ov68_021E6DDC
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov68_021E6EB8
	ldr r4, _021E71C0 @ =0x021E7E74
	movs r7, #0
	adds r5, r6, #0
_021E7190:
	movs r0, #0x47
	movs r1, #0x12
	lsls r0, r0, #2
	lsls r1, r1, #4
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	adds r2, r4, #0
	bl FUN_0200D734
	movs r1, #0x49
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DC78
	adds r7, r7, #1
	adds r4, #0x34
	adds r5, r5, #4
	cmp r7, #0xc
	blo _021E7190
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E71C0: .4byte 0x021E7E74
	thumb_func_end ov68_021E7178

	thumb_func_start ov68_021E71C4
ov68_021E71C4: @ 0x021E71C4
	push {r4, r5, lr}
	sub sp, #0x1c
	ldr r5, _021E721C @ =0x021E7BEC
	adds r4, r0, #0
	adds r2, r1, #0
	ldm r5!, {r0, r1}
	add r3, sp, #0x10
	stm r3!, {r0, r1}
	ldr r0, [r5]
	add r1, sp, #8
	str r0, [r3]
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	adds r0, r2, #0
	bl FUN_02023114
	str r0, [r4]
	movs r1, #1
	str r1, [sp]
	ldr r0, [r4]
	ldr r3, _021E7220 @ =0x000005C1
	str r0, [sp, #4]
	add r0, sp, #0x10
	lsls r1, r1, #0x10
	add r2, sp, #8
	bl FUN_020232BC
	movs r1, #0x19
	ldr r2, [r4]
	movs r0, #0
	lsls r1, r1, #0xe
	bl FUN_02023240
	ldr r0, [r4]
	bl FUN_02023234
	ldr r0, [r4]
	bl FUN_0202313C
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
_021E721C: .4byte 0x021E7BEC
_021E7220: .4byte 0x000005C1
	thumb_func_end ov68_021E71C4

	thumb_func_start ov68_021E7224
ov68_021E7224: @ 0x021E7224
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r2, #0
	bl FUN_02007FD4
	str r0, [r5, #4]
	add r0, sp, #0x10
	adds r1, r4, #0
	movs r2, #2
	bl FUN_02070124
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #4]
	add r1, sp, #0x10
	movs r2, #0x34
	movs r3, #0x80
	bl FUN_020085EC
	str r0, [r5, #0x18]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x1c
	bl FUN_0206FBC4
	adds r3, r0, #0
	movs r2, #1
	ldr r0, [r5, #0x18]
	movs r1, #0x23
	eors r2, r3
	bl FUN_020087A4
	add sp, #0x20
	pop {r4, r5, r6, pc}
	thumb_func_end ov68_021E7224

	thumb_func_start ov68_021E7288
ov68_021E7288: @ 0x021E7288
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	blx FUN_020C2698
	blx FUN_020CF564
	blx FUN_020CF704
	ldr r1, _021E7330 @ =0x04000060
	ldr r2, _021E7334 @ =0xFFFFCFFD
	ldrh r0, [r1]
	ands r0, r2
	strh r0, [r1]
	ldrh r3, [r1]
	ldr r0, _021E7338 @ =0x0000CFFB
	ands r3, r0
	strh r3, [r1]
	adds r3, r2, #2
	ldrh r5, [r1]
	adds r2, r2, #2
	subs r0, #0x1c
	ands r5, r3
	movs r3, #8
	orrs r3, r5
	strh r3, [r1]
	ldrh r3, [r1]
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r1]
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	blx FUN_020CF82C
	movs r0, #0
	ldr r2, _021E733C @ =0x00007FFF
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r1, _021E7340 @ =0x04000540
	movs r0, #2
	str r0, [r1]
	ldr r0, _021E7344 @ =0xBFFF0000
	movs r2, #0x1c
	str r0, [r1, #0x40]
	movs r0, #0x55
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	blx FUN_020D4994
	movs r0, #0x55
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x42
	bl ov68_021E71C4
	ldr r1, [r4]
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r0, r4, r0
	movs r2, #0x42
	bl ov68_021E7224
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r1, _021E7348 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	movs r0, #1
	orrs r0, r2
	strh r0, [r1]
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7330: .4byte 0x04000060
_021E7334: .4byte 0xFFFFCFFD
_021E7338: .4byte 0x0000CFFB
_021E733C: .4byte 0x00007FFF
_021E7340: .4byte 0x04000540
_021E7344: .4byte 0xBFFF0000
_021E7348: .4byte 0x04000008
	thumb_func_end ov68_021E7288

	thumb_func_start ov68_021E734C
ov68_021E734C: @ 0x021E734C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02026E48
	bl FUN_02023154
	ldr r2, _021E7380 @ =0x04000440
	movs r3, #0
	adds r1, r2, #0
	str r3, [r2]
	adds r1, #0x14
	str r3, [r1]
	movs r0, #2
	str r0, [r2]
	str r3, [r1]
	blx FUN_020BEF98
	blx FUN_020B7350
	ldr r0, [r4, #4]
	bl FUN_02008120
	ldr r0, _021E7384 @ =0x04000540
	movs r1, #1
	str r1, [r0]
	pop {r4, pc}
	.align 2, 0
_021E7380: .4byte 0x04000440
_021E7384: .4byte 0x04000540
	thumb_func_end ov68_021E734C

	thumb_func_start ov68_021E7388
ov68_021E7388: @ 0x021E7388
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_02023120
	ldr r0, [r4, #4]
	bl FUN_02008524
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x1c
	blx FUN_020D4994
	pop {r4, pc}
	thumb_func_end ov68_021E7388

	thumb_func_start ov68_021E73A4
ov68_021E73A4: @ 0x021E73A4
	push {r3, r4, r5, lr}
	adds r3, r1, #0
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r3, #4
	bhs _021E73D2
	movs r0, #0x4b
	lsls r2, r3, #5
	lsls r0, r0, #2
	adds r2, #0x20
	lsls r2, r2, #0x10
	ldr r0, [r4, r0]
	movs r1, #0
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCC0
	b _021E7414
_021E73D2:
	cmp r3, #6
	bhs _021E73FA
	movs r0, #0x4b
	lsls r0, r0, #2
	subs r2, r3, #4
	movs r1, #0x28
	muls r1, r2, r1
	lsls r1, r1, #0x10
	ldr r0, [r4, r0]
	asrs r1, r1, #0x10
	movs r2, #0xa8
	bl FUN_0200DDB8
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCC0
	b _021E7414
_021E73FA:
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xc0
	movs r2, #0xa0
	bl FUN_0200DDB8
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_0200DCC0
_021E7414:
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	bl FUN_0200DD10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov68_021E73A4

	thumb_func_start ov68_021E7424
ov68_021E7424: @ 0x021E7424
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _021E7442
	cmp r7, #0
	beq _021E7442
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r4, #1
	bl FUN_0200DCAC
	b _021E7444
_021E7442:
	movs r4, #0
_021E7444:
	ldr r0, [r5]
	ldrh r0, [r0, #0x16]
	adds r2, r0, #4
	movs r0, #0x6e
	lsls r0, r0, #2
	ldrb r1, [r5, r0]
	cmp r2, r1
	bge _021E7460
	subs r0, #0x94
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200DC4C
	b _021E746A
_021E7460:
	subs r0, #0x94
	ldr r0, [r5, r0]
	adds r1, r4, #2
	bl FUN_0200DC4C
_021E746A:
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200DC78
	cmp r6, #1
	bne _021E748C
	cmp r7, #0
	beq _021E748C
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r4, #1
	bl FUN_0200DCAC
	b _021E748E
_021E748C:
	movs r4, #0
_021E748E:
	ldr r0, [r5]
	ldrh r0, [r0, #0x16]
	cmp r0, #0
	beq _021E74A4
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #4
	bl FUN_0200DC4C
	b _021E74B0
_021E74A4:
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #6
	bl FUN_0200DC4C
_021E74B0:
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200DC78
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov68_021E7424

	thumb_func_start ov68_021E74C0
ov68_021E74C0: @ 0x021E74C0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0x42
	bl FUN_020880CC
	movs r0, #0x1b
	movs r1, #0xb
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov68_021E74C0

	thumb_func_start ov68_021E74D8
ov68_021E74D8: @ 0x021E74D8
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, _021E7560 @ =_021E7BE8
	add r1, sp, #0
	ldrb r3, [r2]
	ldrb r2, [r2, #1]
	adds r4, r0, #0
	strb r3, [r1]
	strb r2, [r1, #1]
	bl ov68_021E5B14
	ldr r0, [r4]
	movs r1, #0x17
	ldr r0, [r0]
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4]
	ldr r2, [r0, #8]
	adds r0, r1, #4
	str r2, [r4, r0]
	adds r0, r1, #0
	movs r2, #0
	adds r0, #0x11
	strb r2, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x14
	strb r2, [r4, r0]
	movs r0, #1
	adds r1, #0x13
	strb r0, [r4, r1]
	adds r0, r4, #0
	bl ov68_021E6BEC
	movs r1, #0x62
	lsls r1, r1, #2
	strh r0, [r4, r1]
	movs r2, #2
	subs r0, r1, #6
	strb r2, [r4, r0]
	adds r0, r1, #0
	movs r2, #1
	adds r0, #0x14
	str r2, [r4, r0]
	adds r0, r1, #0
	movs r2, #0
	adds r0, #0x10
	str r2, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x18
	subs r1, #0x18
	str r2, [r4, r0]
	adds r0, r4, r1
	add r1, sp, #0
	bl FUN_02089D40
	movs r1, #0x17
	lsls r1, r1, #4
	ldr r0, _021E7564 @ =0x02103A1C
	adds r1, r4, r1
	movs r2, #0x42
	bl FUN_0200724C
	movs r1, #0x6b
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0xc
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021E7560: .4byte _021E7BE8
_021E7564: .4byte 0x02103A1C
	thumb_func_end ov68_021E74D8

	thumb_func_start ov68_021E7568
ov68_021E7568: @ 0x021E7568
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020072A8
	cmp r0, #0
	beq _021E75B6
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02007278
	adds r0, r4, #0
	bl ov68_021E5A58
	ldr r1, [r4]
	adds r0, r4, #0
	ldrh r1, [r1, #0x14]
	bl ov68_021E7A18
	ldr r1, [r4]
	adds r0, r4, #0
	ldrh r1, [r1, #0x14]
	movs r2, #3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov68_021E73A4
	ldr r0, _021E75BC @ =0x00000186
	ldr r1, [r4]
	ldrb r2, [r4, r0]
	adds r0, #0x2a
	strb r2, [r1, #0x1b]
	movs r1, #7
	str r1, [r4, r0]
	movs r0, #0
	pop {r4, pc}
_021E75B6:
	movs r0, #0xc
	pop {r4, pc}
	nop
_021E75BC: .4byte 0x00000186
	thumb_func_end ov68_021E7568

	thumb_func_start ov68_021E75C0
ov68_021E75C0: @ 0x021E75C0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x42
	str r0, [sp, #8]
	ldr r0, _021E75F8 @ =0x021E7CF0
	ldr r1, _021E75FC @ =0x021E7D64
	ldr r2, _021E7600 @ =0x021E7C08
	adds r3, r4, #0
	bl FUN_02019BA4
	movs r1, #0x72
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	movs r1, #0
	bl ov68_021E7898
	adds r0, r4, #0
	bl ov68_021E7910
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E75F8: .4byte 0x021E7CF0
_021E75FC: .4byte 0x021E7D64
_021E7600: .4byte 0x021E7C08
	thumb_func_end ov68_021E75C0

	thumb_func_start ov68_021E7604
ov68_021E7604: @ 0x021E7604
	movs r1, #0x72
	lsls r1, r1, #2
	ldr r3, _021E7610 @ =FUN_02019BDC
	ldr r0, [r0, r1]
	bx r3
	nop
_021E7610: .4byte FUN_02019BDC
	thumb_func_end ov68_021E7604

	thumb_func_start ov68_021E7614
ov68_021E7614: @ 0x021E7614
	bx lr
	.align 2, 0
	thumb_func_end ov68_021E7614

	thumb_func_start ov68_021E7618
ov68_021E7618: @ 0x021E7618
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #0
	adds r6, r2, #0
	bl ov68_021E7898
	adds r0, r5, #0
	movs r1, #5
	bl ov68_021E7A18
	cmp r4, #3
	bgt _021E766A
	ldr r0, _021E7738 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, [r5]
	strh r4, [r0, #0x14]
	ldr r0, [r5]
	ldrh r1, [r0, #0x16]
	ldrh r0, [r0, #0x14]
	adds r1, r1, r0
	movs r0, #0x6e
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r1, r0
	bge _021E765E
	adds r0, r5, #0
	bl ov68_021E6BEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov68_021E68D4
	b _021E7728
_021E765E:
	movs r1, #1
	adds r0, r5, #0
	mvns r1, r1
	bl ov68_021E68D4
	b _021E7728
_021E766A:
	cmp r4, #6
	bne _021E7722
	cmp r6, #3
	bne _021E76C2
	ldr r0, [r5]
	ldrh r0, [r0, #0x16]
	adds r1, r0, #4
	movs r0, #0x6e
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r1, r0
	bge _021E76C2
	ldr r0, _021E7738 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0x72
	lsls r0, r0, #2
	movs r4, #3
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02019F7C
	ldr r1, [r5]
	ldrh r0, [r1, #0x16]
	adds r0, r0, #1
	strh r0, [r1, #0x16]
	adds r0, r5, #0
	bl ov68_021E67E0
	adds r0, r5, #0
	bl ov68_021E6BEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov68_021E68D4
	adds r0, r5, #0
	bl ov68_021E7910
	adds r0, r5, #0
	movs r1, #1
	bl ov68_021E797C
	b _021E7728
_021E76C2:
	cmp r6, #0
	bne _021E7710
	ldr r0, [r5]
	ldrh r0, [r0, #0x16]
	cmp r0, #0
	beq _021E7700
	ldr r0, _021E7738 @ =0x000005DD
	bl FUN_0200604C
	ldr r1, [r5]
	ldrh r0, [r1, #0x16]
	subs r0, r0, #1
	strh r0, [r1, #0x16]
	adds r0, r5, #0
	bl ov68_021E67E0
	adds r0, r5, #0
	bl ov68_021E6BEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov68_021E68D4
	adds r0, r5, #0
	bl ov68_021E7910
	movs r1, #0
	adds r0, r5, #0
	mvns r1, r1
	bl ov68_021E797C
_021E7700:
	movs r0, #0x72
	lsls r0, r0, #2
	movs r4, #0
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02019F7C
	b _021E7728
_021E7710:
	ldr r0, _021E7738 @ =0x000005DD
	bl FUN_0200604C
	movs r1, #1
	adds r0, r5, #0
	mvns r1, r1
	bl ov68_021E68D4
	b _021E7728
_021E7722:
	ldr r0, _021E7738 @ =0x000005DD
	bl FUN_0200604C
_021E7728:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #3
	bl ov68_021E73A4
	pop {r4, r5, r6, pc}
	nop
_021E7738: .4byte 0x000005DD
	thumb_func_end ov68_021E7618

	thumb_func_start ov68_021E773C
ov68_021E773C: @ 0x021E773C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #3
	bgt _021E7792
	ldr r1, [r5]
	strh r4, [r1, #0x14]
	ldr r2, [r5]
	ldrh r1, [r2, #0x16]
	ldrh r2, [r2, #0x14]
	adds r3, r1, r2
	movs r2, #0x6e
	lsls r2, r2, #2
	ldrb r2, [r5, r2]
	cmp r3, r2
	bge _021E7778
	bl ov68_021E7A18
	adds r0, r5, #0
	movs r1, #1
	bl ov68_021E7898
	adds r0, r5, #0
	bl ov68_021E6BEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov68_021E68D4
	b _021E7884
_021E7778:
	movs r1, #5
	bl ov68_021E7A18
	adds r0, r5, #0
	movs r1, #0
	bl ov68_021E7898
	movs r1, #1
	adds r0, r5, #0
	mvns r1, r1
	bl ov68_021E68D4
	b _021E7884
_021E7792:
	cmp r4, #4
	bne _021E77E8
	ldr r0, _021E7894 @ =0x000005DD
	bl FUN_0200604C
	ldr r1, [r5]
	ldrh r0, [r1, #0x16]
	ldrh r4, [r1, #0x14]
	adds r0, r0, #1
	strh r0, [r1, #0x16]
	adds r0, r5, #0
	bl ov68_021E6BEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov68_021E68D4
	adds r0, r5, #0
	bl ov68_021E67E0
	adds r0, r5, #0
	movs r1, #5
	bl ov68_021E7A18
	adds r0, r5, #0
	movs r1, #0
	bl ov68_021E7898
	adds r0, r5, #0
	bl ov68_021E7910
	adds r0, r5, #0
	movs r1, #1
	bl ov68_021E797C
	movs r0, #0x72
	lsls r0, r0, #2
	lsls r1, r4, #0x18
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	b _021E7884
_021E77E8:
	cmp r4, #5
	bne _021E7840
	ldr r0, _021E7894 @ =0x000005DD
	bl FUN_0200604C
	ldr r1, [r5]
	ldrh r0, [r1, #0x16]
	ldrh r4, [r1, #0x14]
	subs r0, r0, #1
	strh r0, [r1, #0x16]
	adds r0, r5, #0
	bl ov68_021E6BEC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov68_021E68D4
	adds r0, r5, #0
	bl ov68_021E67E0
	adds r0, r5, #0
	movs r1, #5
	bl ov68_021E7A18
	adds r0, r5, #0
	movs r1, #0
	bl ov68_021E7898
	adds r0, r5, #0
	bl ov68_021E7910
	movs r1, #0
	adds r0, r5, #0
	mvns r1, r1
	bl ov68_021E797C
	movs r0, #0x72
	lsls r0, r0, #2
	lsls r1, r4, #0x18
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	b _021E7884
_021E7840:
	cmp r4, #6
	bne _021E786E
	movs r1, #5
	bl ov68_021E7A18
	adds r0, r5, #0
	movs r1, #0
	bl ov68_021E7898
	movs r0, #0x73
	lsls r0, r0, #2
	ldrh r1, [r5, r0]
	cmp r1, #6
	beq _021E7884
	ldr r1, [r5]
	subs r0, r0, #4
	ldrh r4, [r1, #0x14]
	ldr r0, [r5, r0]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	b _021E7884
_021E786E:
	cmp r4, #7
	bne _021E7884
	ldr r0, [r5]
	ldrh r4, [r0, #0x14]
	movs r0, #0x72
	lsls r0, r0, #2
	lsls r1, r4, #0x18
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
_021E7884:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #3
	bl ov68_021E73A4
	pop {r3, r4, r5, pc}
	nop
_021E7894: .4byte 0x000005DD
	thumb_func_end ov68_021E773C

	thumb_func_start ov68_021E7898
ov68_021E7898: @ 0x021E7898
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r1, #1
	bne _021E78D6
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #7
	bl FUN_02019FF8
	adds r0, r4, #0
	adds r0, #0x88
	bl FUN_0201D5C8
	movs r0, #4
	str r0, [sp]
	movs r3, #8
	str r3, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #0x14
	bl ov68_021E66A0
	ldr r0, _021E790C @ =0x000001CE
	movs r1, #1
	add sp, #0xc
	strh r1, [r4, r0]
	pop {r3, r4, pc}
_021E78D6:
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #7
	bl FUN_02019FD0
	adds r0, r4, #0
	adds r0, #0x88
	bl FUN_0201D8E4
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #0x14
	movs r3, #8
	bl ov68_021E66A0
	movs r1, #0
	ldr r0, _021E790C @ =0x000001CE
	strh r1, [r4, r0]
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_021E790C: .4byte 0x000001CE
	thumb_func_end ov68_021E7898

	thumb_func_start ov68_021E7910
ov68_021E7910: @ 0x021E7910
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x6e
	lsls r0, r0, #2
	ldrb r1, [r4, r0]
	cmp r1, #4
	bhs _021E7936
	adds r0, #0x10
	ldr r0, [r4, r0]
	movs r1, #4
	bl FUN_02019FD0
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #5
	bl FUN_02019FD0
	pop {r4, pc}
_021E7936:
	ldr r1, [r4]
	ldrh r1, [r1, #0x16]
	cmp r1, #0
	bne _021E794A
	adds r0, #0x10
	ldr r0, [r4, r0]
	movs r1, #5
	bl FUN_02019FD0
	b _021E7954
_021E794A:
	adds r0, #0x10
	ldr r0, [r4, r0]
	movs r1, #5
	bl FUN_02019FF8
_021E7954:
	ldr r0, [r4]
	ldrh r0, [r0, #0x16]
	adds r2, r0, #4
	movs r0, #0x6e
	lsls r0, r0, #2
	ldrb r1, [r4, r0]
	cmp r2, r1
	blt _021E7970
	adds r0, #0x10
	ldr r0, [r4, r0]
	movs r1, #4
	bl FUN_02019FD0
	pop {r4, pc}
_021E7970:
	adds r0, #0x10
	ldr r0, [r4, r0]
	movs r1, #4
	bl FUN_02019FF8
	pop {r4, pc}
	thumb_func_end ov68_021E7910

	thumb_func_start ov68_021E797C
ov68_021E797C: @ 0x021E797C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x4a
	lsls r0, r0, #2
	adds r4, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DC78
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DC78
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCC0
	cmp r4, #0
	ldr r0, [r5]
	ble _021E79EA
	ldrh r0, [r0, #0x16]
	adds r2, r0, #4
	movs r0, #0x6e
	lsls r0, r0, #2
	ldrb r1, [r5, r0]
	cmp r2, r1
	bge _021E79D2
	subs r0, #0x94
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DC4C
	b _021E79DC
_021E79D2:
	subs r0, #0x94
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0200DC4C
_021E79DC:
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #4
	bl FUN_0200DC4C
	pop {r3, r4, r5, pc}
_021E79EA:
	ldrh r0, [r0, #0x16]
	cmp r0, #0
	bne _021E79FE
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #7
	bl FUN_0200DC4C
	b _021E7A0A
_021E79FE:
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #5
	bl FUN_0200DC4C
_021E7A0A:
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DC4C
	pop {r3, r4, r5, pc}
	thumb_func_end ov68_021E797C

	thumb_func_start ov68_021E7A18
ov68_021E7A18: @ 0x021E7A18
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r7, r1, #0
	movs r6, #0
	movs r4, #4
_021E7A24:
	cmp r6, r7
	bne _021E7A44
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #8
	lsls r2, r4, #0x18
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #0
	lsrs r2, r2, #0x18
	movs r3, #0x10
	bl ov68_021E66A0
	b _021E7A82
_021E7A44:
	movs r0, #0x6e
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r6, r0
	blo _021E7A6A
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	lsls r2, r4, #0x18
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #0
	lsrs r2, r2, #0x18
	movs r3, #0x10
	bl ov68_021E66A0
	b _021E7A82
_021E7A6A:
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	lsls r2, r4, #0x18
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #0
	lsrs r2, r2, #0x18
	movs r3, #0x10
	bl ov68_021E66A0
_021E7A82:
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blo _021E7A24
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov68_021E7A18

	thumb_func_start ov68_021E7A90
ov68_021E7A90: @ 0x021E7A90
	movs r2, #0x1d
	lsls r2, r2, #4
	adds r2, r0, r2
	movs r0, #0x18
	strb r0, [r2]
	movs r0, #0x14
	strb r0, [r2, #1]
	movs r0, #8
	strb r0, [r2, #2]
	movs r0, #4
	strb r0, [r2, #3]
	movs r0, #0
	strh r0, [r2, #4]
	strh r0, [r2, #6]
	str r1, [r2, #8]
	movs r0, #0xd
	bx lr
	.align 2, 0
	thumb_func_end ov68_021E7A90

	thumb_func_start ov68_021E7AB4
ov68_021E7AB4: @ 0x021E7AB4
	movs r2, #0x1d
	lsls r2, r2, #4
	adds r2, r0, r2
	movs r0, #0xf
	strb r0, [r2]
	movs r0, #0x14
	strb r0, [r2, #1]
	movs r0, #8
	strb r0, [r2, #2]
	movs r0, #4
	strb r0, [r2, #3]
	movs r0, #0
	strh r0, [r2, #4]
	strh r0, [r2, #6]
	str r1, [r2, #8]
	movs r0, #0xd
	bx lr
	.align 2, 0
	thumb_func_end ov68_021E7AB4

	thumb_func_start ov68_021E7AD8
ov68_021E7AD8: @ 0x021E7AD8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x1d
	lsls r0, r0, #4
	adds r4, r5, r0
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _021E7AF4
	cmp r0, #1
	beq _021E7B1A
	cmp r0, #2
	beq _021E7B52
	b _021E7B64
_021E7AF4:
	ldrb r0, [r4, #2]
	movs r1, #7
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r5, #4]
	bl FUN_0201CA4C
	ldr r0, [r5, #4]
	movs r1, #7
	bl FUN_0201EFBC
	ldrh r0, [r4, #6]
	adds r0, r0, #1
	strh r0, [r4, #6]
	b _021E7B64
_021E7B1A:
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	ldrh r0, [r4, #4]
	cmp r0, #4
	bne _021E7B64
	ldrb r0, [r4, #2]
	movs r1, #7
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r5, #4]
	bl FUN_0201CA4C
	ldr r0, [r5, #4]
	movs r1, #7
	bl FUN_0201EFBC
	movs r0, #0
	strh r0, [r4, #4]
	ldrh r0, [r4, #6]
	adds r0, r0, #1
	strh r0, [r4, #6]
	b _021E7B64
_021E7B52:
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	ldrh r0, [r4, #4]
	cmp r0, #2
	bne _021E7B64
	add sp, #0xc
	ldr r0, [r4, #8]
	pop {r4, r5, pc}
_021E7B64:
	movs r0, #0xd
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov68_021E7AD8

	thumb_func_start ov68_021E7B6C
ov68_021E7B6C: @ 0x021E7B6C
	push {r4, lr}
	movs r1, #2
	adds r4, r0, #0
	bl ov68_021E6C14
	ldr r0, _021E7B88 @ =0x000001BA
	movs r1, #1
	strb r1, [r4, r0]
	movs r1, #3
	subs r0, #0xa
	str r1, [r4, r0]
	movs r0, #2
	pop {r4, pc}
	nop
_021E7B88: .4byte 0x000001BA
	thumb_func_end ov68_021E7B6C

	thumb_func_start ov68_021E7B8C
ov68_021E7B8C: @ 0x021E7B8C
	ldr r3, _021E7B90 @ =ov68_021E7B94
	bx r3
	.align 2, 0
_021E7B90: .4byte ov68_021E7B94
	thumb_func_end ov68_021E7B8C

	thumb_func_start ov68_021E7B94
ov68_021E7B94: @ 0x021E7B94
	push {r4, lr}
	adds r4, r0, #0
	bl ov68_021E6CD8
	cmp r0, #4
	bhs _021E7BAC
	adds r0, r4, #0
	movs r1, #1
	bl ov68_021E6C14
	movs r1, #0
	b _021E7BB6
_021E7BAC:
	adds r0, r4, #0
	movs r1, #4
	bl ov68_021E6C14
	movs r1, #2
_021E7BB6:
	ldr r0, _021E7BC4 @ =0x000001BA
	strb r1, [r4, r0]
	movs r1, #3
	subs r0, #0xa
	str r1, [r4, r0]
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
_021E7BC4: .4byte 0x000001BA
	thumb_func_end ov68_021E7B94

	thumb_func_start ov68_021E7BC8
ov68_021E7BC8: @ 0x021E7BC8
	push {r3, lr}
	cmp r0, #1
	ldr r0, _021E7BE4 @ =0x04001050
	bne _021E7BDC
	movs r1, #0x1e
	adds r2, r1, #0
	subs r2, #0x26
	blx FUN_020CF178
	pop {r3, pc}
_021E7BDC:
	movs r1, #0
	strh r1, [r0]
	pop {r3, pc}
	nop
_021E7BE4: .4byte 0x04001050
	thumb_func_end ov68_021E7BC8

	.rodata

_021E7BE8:
	.byte 0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x15, 0x76, 0x1E, 0x02, 0x15, 0x76, 0x1E, 0x02
	.byte 0x19, 0x76, 0x1E, 0x02, 0x3D, 0x77, 0x1E, 0x02, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1C, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x20, 0x3F, 0x00, 0x7F, 0x40, 0x5F, 0x00, 0x7F, 0x60, 0x7F, 0x00, 0x7F, 0x80, 0x9F, 0x00, 0x7F
	.byte 0xA8, 0xBF, 0x00, 0x27, 0xA8, 0xBF, 0x28, 0x4F, 0xA6, 0xBF, 0xC0, 0xFF, 0xA6, 0xBF, 0x78, 0xB7
	.byte 0xFF, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x6D, 0x1E, 0x02
	.byte 0x21, 0x6D, 0x1E, 0x02, 0x41, 0x6D, 0x1E, 0x02, 0x4D, 0x6D, 0x1E, 0x02, 0x59, 0x6D, 0x1E, 0x02
	.byte 0x65, 0x6D, 0x1E, 0x02, 0x81, 0x6D, 0x1E, 0x02, 0x9D, 0x6D, 0x1E, 0x02, 0xB9, 0x6D, 0x1E, 0x02
	.byte 0xD1, 0x6D, 0x1E, 0x02, 0x28, 0x34, 0x00, 0x00, 0x06, 0x01, 0x00, 0x00, 0x50, 0x3C, 0x00, 0x00
	.byte 0x00, 0x02, 0x01, 0x01, 0x28, 0x54, 0x00, 0x00, 0x01, 0x03, 0x02, 0x02, 0x50, 0x5C, 0x00, 0x00
	.byte 0x02, 0x06, 0x03, 0x03, 0x28, 0x74, 0x00, 0x00, 0x04, 0x04, 0x04, 0x04, 0x50, 0x7C, 0x00, 0x00
	.byte 0x05, 0x05, 0x05, 0x05, 0xE0, 0xA8, 0x00, 0x00, 0x03, 0x06, 0x06, 0x06, 0xE0, 0xA8, 0x00, 0x00
	.byte 0x07, 0x07, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x06, 0x11, 0x04, 0x06
	.byte 0x02, 0x0F, 0x5B, 0x00, 0x06, 0x11, 0x06, 0x06, 0x02, 0x0F, 0x67, 0x00, 0x06, 0x11, 0x08, 0x08
	.byte 0x02, 0x0F, 0x73, 0x00, 0x06, 0x1C, 0x06, 0x03, 0x02, 0x0F, 0x83, 0x00, 0x06, 0x1C, 0x08, 0x03
	.byte 0x02, 0x0F, 0x89, 0x00, 0x06, 0x11, 0x0A, 0x0F, 0x0A, 0x0F, 0x8F, 0x00, 0x04, 0x02, 0x13, 0x1B
	.byte 0x04, 0x0E, 0x25, 0x01, 0x06, 0x01, 0x00, 0x1E, 0x03, 0x0F, 0x91, 0x01, 0x06, 0x0F, 0x15, 0x08
	.byte 0x03, 0x0F, 0xEB, 0x01, 0x06, 0x18, 0x15, 0x08, 0x03, 0x0F, 0x03, 0x02, 0x06, 0x05, 0x04, 0x0A
	.byte 0x10, 0x0F, 0x1B, 0x02, 0x04, 0x17, 0x0D, 0x07, 0x04, 0x0E, 0xBB, 0x02, 0x02, 0x01, 0x00, 0x14
	.byte 0x03, 0x0F, 0x01, 0x00, 0x02, 0x13, 0x05, 0x0A, 0x10, 0x0F, 0x3D, 0x00, 0x02, 0x02, 0x05, 0x09
	.byte 0x08, 0x0F, 0xDD, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00
	.byte 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x04, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00
	.byte 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xEC, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00
	.byte 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xAB, 0xB8, 0x00, 0x00, 0xA9, 0xB8, 0x00, 0x00
	.byte 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xAC, 0xB8, 0x00, 0x00
	.byte 0xA9, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x68, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xAD, 0xB8, 0x00, 0x00, 0xA9, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xAE, 0xB8, 0x00, 0x00, 0xA9, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00
	.byte 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x86, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAF, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00
	.byte 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x86, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB0, 0xB8, 0x00, 0x00
	.byte 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x86, 0x00, 0x70, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xB1, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x86, 0x00, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xB2, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00
	.byte 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	@ 0x021E80E4
