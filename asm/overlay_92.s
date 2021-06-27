
	thumb_func_start ov92_0225C540
ov92_0225C540: @ 0x0225C540
	push {r4, lr}
	ldr r1, [r2]
	ldr r0, [r2, #4]
	adds r4, r3, #0
	str r1, [r4, #0x14]
	str r0, [r4, #0x18]
	bl FUN_0201FD38
	adds r0, r4, #0
	bl ov92_0225D8D4
	pop {r4, pc}
	thumb_func_end ov92_0225C540

	thumb_func_start ov92_0225C558
ov92_0225C558: @ 0x0225C558
	adds r0, r3, #0
	ldr r3, _0225C560 @ =ov92_0225D8DC
	bx r3
	nop
_0225C560: .4byte ov92_0225D8DC
	thumb_func_end ov92_0225C558

	thumb_func_start ov92_0225C564
ov92_0225C564: @ 0x0225C564
	ldr r1, [r3, #4]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r2, [r2]
	ldr r0, _0225C574 @ =0x00002B9C
	str r2, [r1, r0]
	bx lr
	nop
_0225C574: .4byte 0x00002B9C
	thumb_func_end ov92_0225C564

	thumb_func_start ov92_0225C578
ov92_0225C578: @ 0x0225C578
	lsls r0, r0, #3
	ldr r1, [r2]
	adds r0, r3, r0
	str r1, [r0, #0x24]
	bx lr
	.align 2, 0
	thumb_func_end ov92_0225C578

	thumb_func_start ov92_0225C584
ov92_0225C584: @ 0x0225C584
	bx lr
	.align 2, 0
	thumb_func_end ov92_0225C584

	thumb_func_start ov92_0225C588
ov92_0225C588: @ 0x0225C588
	movs r0, #0
	bx lr
	thumb_func_end ov92_0225C588

	thumb_func_start ov92_0225C58C
ov92_0225C58C: @ 0x0225C58C
	movs r0, #8
	bx lr
	thumb_func_end ov92_0225C58C

	thumb_func_start ov92_0225C590
ov92_0225C590: @ 0x0225C590
	movs r0, #4
	bx lr
	thumb_func_end ov92_0225C590

	thumb_func_start ov92_0225C594
ov92_0225C594: @ 0x0225C594
	movs r0, #8
	bx lr
	thumb_func_end ov92_0225C594

	thumb_func_start ov92_0225C598
ov92_0225C598: @ 0x0225C598
	movs r0, #0x20
	bx lr
	thumb_func_end ov92_0225C598

	thumb_func_start ov92_0225C59C
ov92_0225C59C: @ 0x0225C59C
	ldr r0, _0225C5A0 @ =_0226383C
	bx lr
	.align 2, 0
_0225C5A0: .4byte _0226383C
	thumb_func_end ov92_0225C59C

	thumb_func_start ov92_0225C5A4
ov92_0225C5A4: @ 0x0225C5A4
	movs r0, #5
	bx lr
	thumb_func_end ov92_0225C5A4

	thumb_func_start ov92_0225C5A8
ov92_0225C5A8: @ 0x0225C5A8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov92_0225C59C
	adds r4, r0, #0
	bl ov92_0225C5A4
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_0203410C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov92_0225C5A8

	thumb_func_start ov92_0225C5C4
ov92_0225C5C4: @ 0x0225C5C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xb8
	adds r5, r0, #0
	bl FUN_0201FD2C
	adds r1, r5, #0
	adds r1, #0x80
	str r0, [r1]
	adds r0, r5, #0
	bl ov92_0225D3CC
	ldr r0, _0225C934 @ =ov92_0225D894
	adds r1, r5, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r0, #0x20
	movs r1, #0x71
	bl FUN_0202055C
	ldr r1, _0225C938 @ =0x00200010
	movs r0, #1
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	bl FUN_0203A880
	movs r0, #0x71
	bl FUN_0203A4AC
	add r1, sp, #0x24
	adds r4, r0, #0
	blx FUN_020B7140
	movs r0, #0x20
	str r0, [sp]
	ldr r1, [sp, #0x24]
	ldr r0, [r5, #0x5c]
	ldr r1, [r1, #0xc]
	movs r2, #2
	movs r3, #0xe0
	bl FUN_0200316C
	adds r0, r4, #0
	bl FUN_0201AB0C
	bl FUN_020347A0
	adds r4, r0, #0
	bl FUN_0203769C
	str r0, [r5, #0x44]
	adds r0, r5, #0
	bl ov92_0225C5A8
	adds r0, r5, #0
	bl ov92_0225D8C4
	cmp r0, #1
	bne _0225C64E
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x48
	bl ov92_0225EB40
	str r0, [r5]
_0225C64E:
	adds r2, r5, #0
	ldr r1, [r5, #0x44]
	adds r0, r4, #0
	adds r2, #0x48
	bl ov92_0225EB88
	str r0, [r5, #4]
	ldrb r2, [r5, #0x14]
	ldr r1, _0225C93C @ =0x00002BB4
	str r2, [r0, r1]
	adds r0, r5, #0
	adds r0, #0x80
	ldr r3, [r0]
	ldr r2, [r5, #4]
	subs r0, r1, #4
	str r3, [r2, r0]
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	adds r0, r5, #0
	bl ov92_0225E9B4
	adds r0, r5, #0
	bl ov92_0225E3C4
	ldr r1, [r5, #4]
	adds r0, r5, #0
	bl ov92_0225E6A4
	ldr r0, [r5, #4]
	bl ov92_0225DE70
	ldr r0, [r5, #4]
	bl ov92_0225DE08
	ldr r0, [r5, #4]
	bl ov92_0225E820
	ldr r0, [r5, #4]
	bl ov92_0225E93C
	ldr r1, [r5, #0x44]
	adds r0, r5, #0
	bl ov92_0226077C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov92_0225E130
	ldr r4, _0225C940 @ =0x02263A14
	add r3, sp, #0x38
	movs r2, #0x10
_0225C6BA:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0225C6BA
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r4, [sp, #0xc]
	add r0, sp, #0x38
	str r0, [sp, #8]
	adds r0, r5, #0
	str r0, [sp, #0x10]
	adds r0, #0x6c
	adds r7, r4, #0
	adds r6, r4, #0
	str r0, [sp, #0x10]
_0225C6D8:
	movs r0, #0xb5
	ldr r2, [sp, #8]
	ldr r1, [r5, #4]
	lsls r0, r0, #4
	adds r0, r1, r0
	ldr r1, [r5, #0x48]
	ldr r2, [r2]
	adds r0, r0, r4
	bl ov92_0225D9A8
	movs r0, #0xb5
	ldr r1, [r5, #4]
	lsls r0, r0, #4
	adds r0, r1, r0
	ldrb r1, [r5, #0x14]
	adds r0, r0, r4
	bl ov92_0225D9B4
	ldr r1, [r5, #4]
	movs r0, #0x71
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r2, _0225C944 @ =0x00000BC8
	str r0, [sp, #4]
	ldr r0, _0225C948 @ =0x00000BD8
	ldr r3, [sp, #8]
	adds r0, r1, r0
	adds r1, r1, r2
	ldr r2, [r5, #0x48]
	ldr r3, [r3, #4]
	adds r0, r0, r4
	adds r1, r1, r4
	bl FUN_020180BC
	movs r0, #0xb5
	ldr r1, [r5, #4]
	lsls r0, r0, #4
	adds r0, r1, r0
	ldr r2, _0225C948 @ =0x00000BD8
	adds r0, r0, r4
	adds r1, r1, r2
	adds r1, r1, r4
	bl FUN_020181D4
	ldr r1, [r5, #4]
	ldr r0, _0225C948 @ =0x00000BD8
	adds r0, r1, r0
	adds r0, r0, r4
	movs r1, #0
	bl FUN_02018198
	movs r0, #0xb5
	ldr r1, [r5, #4]
	lsls r0, r0, #4
	adds r0, r1, r0
	adds r0, r0, r4
	movs r1, #0
	bl FUN_020182A0
	ldrb r0, [r5, #0x14]
	ldr r1, [sp, #0xc]
	cmp r0, #0
	ldr r0, [sp, #0xc]
	lsls r2, r1, #0x1f
	lsrs r0, r0, #0x1f
	subs r2, r2, r0
	movs r1, #0x1f
	rors r2, r1
	adds r0, r0, r2
	beq _0225C7A6
	cmp r7, #0
	ble _0225C77A
	adds r0, r6, #0
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225C788
_0225C77A:
	adds r0, r6, #0
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225C788:
	ldr r1, [r5, #4]
	adds r1, r1, r4
	str r1, [sp, #0x14]
	blx FUN_020F2104
	movs r1, #0xd3
	ldr r2, [sp, #0x14]
	lsls r1, r1, #4
	ldr r1, [r2, r1]
	adds r2, r1, r0
	movs r0, #0xd3
	ldr r1, [sp, #0x14]
	lsls r0, r0, #4
	str r2, [r1, r0]
	b _0225C7E6
_0225C7A6:
	cmp r7, #0
	ble _0225C7BC
	adds r0, r6, #0
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225C7CA
_0225C7BC:
	adds r0, r6, #0
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225C7CA:
	ldr r1, [r5, #4]
	adds r1, r1, r4
	str r1, [sp, #0x18]
	blx FUN_020F2104
	movs r1, #0xd3
	ldr r2, [sp, #0x18]
	lsls r1, r1, #4
	ldr r1, [r2, r1]
	subs r2, r1, r0
	movs r0, #0xd3
	ldr r1, [sp, #0x18]
	lsls r0, r0, #4
	str r2, [r1, r0]
_0225C7E6:
	ldr r0, [sp, #0xc]
	cmp r0, #8
	bge _0225C830
	adds r1, r0, #1
	movs r0, #5
	muls r0, r1, r0
	cmp r0, #0
	ble _0225C808
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225C816
_0225C808:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225C816:
	ldr r1, [r5, #4]
	adds r1, r1, r4
	str r1, [sp, #0x1c]
	blx FUN_020F2104
	ldr r2, [sp, #0x1c]
	ldr r1, _0225C94C @ =0x00000D38
	ldr r1, [r2, r1]
	adds r2, r1, r0
	ldr r1, [sp, #0x1c]
	ldr r0, _0225C94C @ =0x00000D38
	str r2, [r1, r0]
	b _0225C86C
_0225C830:
	cmp r7, #0
	ble _0225C846
	adds r0, r6, #0
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225C854
_0225C846:
	adds r0, r6, #0
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225C854:
	ldr r1, [r5, #4]
	adds r1, r1, r4
	str r1, [sp, #0x20]
	blx FUN_020F2104
	ldr r2, [sp, #0x20]
	ldr r1, _0225C94C @ =0x00000D38
	ldr r1, [r2, r1]
	subs r2, r1, r0
	ldr r1, [sp, #0x20]
	ldr r0, _0225C94C @ =0x00000D38
	str r2, [r1, r0]
_0225C86C:
	ldr r0, [sp, #8]
	adds r7, r7, #5
	adds r0, #8
	str r0, [sp, #8]
	movs r0, #0x83
	lsls r0, r0, #2
	adds r4, r4, r0
	movs r0, #5
	lsls r0, r0, #0xc
	adds r6, r6, r0
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #8
	bge _0225C88C
	b _0225C6D8
_0225C88C:
	ldr r1, [r5, #4]
	ldr r0, _0225C950 @ =0x00000944
	movs r2, #0x47
	adds r0, r1, r0
	ldr r1, [r5, #0x48]
	bl ov92_0225D9A8
	ldr r1, [r5, #4]
	ldr r0, _0225C950 @ =0x00000944
	adds r0, r1, r0
	ldrb r1, [r5, #0x14]
	bl ov92_0225D9B4
	ldr r1, [r5, #4]
	ldr r0, _0225C950 @ =0x00000944
	adds r0, r1, r0
	movs r1, #0
	bl FUN_020182A0
	ldr r3, _0225C954 @ =0x022638A0
	add r2, sp, #0x28
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r1, [r5, #0x44]
	adds r0, r5, #0
	bl ov92_0226077C
	lsls r1, r0, #2
	add r0, sp, #0x28
	ldr r2, [r0, r1]
	movs r0, #0x45
	ldr r1, [r5, #4]
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r1, [r5, #0x48]
	bl ov92_0225D9A8
	movs r0, #0x45
	ldr r1, [r5, #4]
	lsls r0, r0, #2
	adds r0, r1, r0
	ldrb r1, [r5, #0x14]
	bl ov92_0225D9B4
	movs r0, #0x32
	ldr r1, [r5, #4]
	lsls r0, r0, #4
	adds r0, r1, r0
	ldr r1, [r5, #0x48]
	movs r2, #0x33
	bl ov92_0225D9A8
	ldr r1, [r5, #4]
	ldr r0, _0225C958 @ =0x0000052C
	movs r2, #0x39
	adds r0, r1, r0
	ldr r1, [r5, #0x48]
	bl ov92_0225D9A8
	ldr r1, [r5, #4]
	ldr r0, _0225C95C @ =0x00000738
	movs r2, #0x37
	adds r0, r1, r0
	ldr r1, [r5, #0x48]
	bl ov92_0225D9A8
	movs r0, #0x32
	ldr r1, [r5, #4]
	lsls r0, r0, #4
	adds r0, r1, r0
	ldrb r1, [r5, #0x14]
	bl ov92_0225D9B4
	ldr r1, [r5, #4]
	ldr r0, _0225C958 @ =0x0000052C
	adds r0, r1, r0
	ldrb r1, [r5, #0x14]
	bl ov92_0225D9B4
	ldr r1, [r5, #4]
	ldr r0, _0225C95C @ =0x00000738
	b _0225C960
	.align 2, 0
_0225C934: .4byte ov92_0225D894
_0225C938: .4byte 0x00200010
_0225C93C: .4byte 0x00002BB4
_0225C940: .4byte 0x02263A14
_0225C944: .4byte 0x00000BC8
_0225C948: .4byte 0x00000BD8
_0225C94C: .4byte 0x00000D38
_0225C950: .4byte 0x00000944
_0225C954: .4byte 0x022638A0
_0225C958: .4byte 0x0000052C
_0225C95C: .4byte 0x00000738
_0225C960:
	adds r0, r1, r0
	ldrb r1, [r5, #0x14]
	bl ov92_0225D9B4
	movs r6, #0x32
	ldr r4, [r5, #4]
	movs r0, #0x71
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x6c
	lsls r6, r6, #4
	str r0, [sp, #4]
	adds r0, r4, r6
	adds r1, r4, r6
	ldr r2, [r5, #0x48]
	adds r0, #0x88
	adds r1, #0x78
	movs r3, #0x35
	bl FUN_020180BC
	adds r0, r4, r6
	adds r1, r0, #0
	adds r1, #0x88
	bl FUN_020181D4
	adds r0, r4, r6
	adds r0, #0x88
	movs r1, #0
	bl FUN_02018198
	movs r0, #0x71
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x6c
	str r0, [sp, #4]
	adds r0, r4, r6
	adds r1, r4, r6
	ldr r2, [r5, #0x48]
	adds r0, #0x9c
	adds r1, #0x78
	movs r3, #0x34
	bl FUN_020180BC
	adds r0, r4, r6
	adds r0, #0x9c
	movs r1, #0
	bl FUN_02018198
	movs r0, #0x71
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x6c
	str r0, [sp, #4]
	adds r0, r4, r6
	adds r1, r4, r6
	ldr r2, [r5, #0x48]
	adds r0, #0xb0
	adds r1, #0x78
	movs r3, #0x3a
	bl FUN_020180BC
	adds r0, r4, r6
	adds r0, #0xb0
	movs r1, #0
	bl FUN_02018198
	ldr r4, [r5, #4]
	movs r0, #0x71
	str r0, [sp]
	adds r0, r5, #0
	ldr r6, _0225CAA0 @ =0x0000052C
	adds r0, #0x6c
	str r0, [sp, #4]
	adds r0, r4, r6
	adds r1, r4, r6
	ldr r2, [r5, #0x48]
	adds r0, #0x88
	adds r1, #0x78
	movs r3, #0x38
	bl FUN_020180BC
	adds r0, r4, r6
	adds r1, r0, #0
	adds r1, #0x88
	bl FUN_020181D4
	adds r0, r4, r6
	adds r0, #0x88
	movs r1, #0
	bl FUN_02018198
	ldr r4, [r5, #4]
	movs r0, #0x71
	str r0, [sp]
	adds r0, r5, #0
	ldr r6, _0225CAA4 @ =0x00000738
	adds r0, #0x6c
	str r0, [sp, #4]
	adds r0, r4, r6
	adds r1, r4, r6
	ldr r2, [r5, #0x48]
	adds r0, #0x88
	adds r1, #0x78
	movs r3, #0x36
	bl FUN_020180BC
	adds r0, r4, r6
	adds r1, r0, #0
	adds r1, #0x88
	bl FUN_020181D4
	adds r0, r4, r6
	adds r0, #0x88
	movs r1, #0
	bl FUN_02018198
	ldrb r0, [r5, #0x14]
	cmp r0, #0
	beq _0225CA6C
	movs r1, #0xbe
	ldr r0, _0225CAA8 @ =0xFFFF8000
	ldr r2, [r5, #4]
	lsls r1, r1, #2
	str r0, [r2, r1]
	ldr r2, [r5, #4]
	ldr r1, _0225CAAC @ =0x00000504
	str r0, [r2, r1]
	adds r1, r6, #0
	ldr r2, [r5, #4]
	subs r1, #0x28
	str r0, [r2, r1]
	ldr r2, [r5, #4]
	ldr r1, _0225CAB0 @ =0x0000091C
	str r0, [r2, r1]
_0225CA6C:
	ldr r0, [r5, #0x54]
	bl FUN_0200E2B0
	movs r1, #0x71
	bl FUN_02258BD4
	adds r1, r5, #0
	adds r1, #0x84
	str r0, [r1]
	movs r1, #2
	ldr r0, [r5, #0x5c]
	movs r2, #0
	lsls r3, r1, #8
	bl FUN_020032A4
	adds r5, #0x88
	ldr r0, [r5]
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	beq _0225CA9A
	movs r0, #0x71
	bl FUN_021E69A8
_0225CA9A:
	add sp, #0xb8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225CAA0: .4byte 0x0000052C
_0225CAA4: .4byte 0x00000738
_0225CAA8: .4byte 0xFFFF8000
_0225CAAC: .4byte 0x00000504
_0225CAB0: .4byte 0x0000091C
	thumb_func_end ov92_0225C5C4

	thumb_func_start ov92_0225CAB4
ov92_0225CAB4: @ 0x0225CAB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r2, #0x65
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0x71
	lsls r2, r2, #0xc
	bl FUN_0201A910
	adds r0, r4, #0
	movs r1, #0xd0
	movs r2, #0x71
	bl FUN_02007280
	movs r1, #0
	movs r2, #0xd0
	str r0, [sp, #4]
	blx FUN_020E5B44
	adds r0, r4, #0
	bl FUN_020072A4
	ldr r1, [sp, #4]
	ldr r6, [sp, #4]
	adds r1, #0x88
	str r0, [r1]
	movs r4, #0
	adds r5, r6, #0
	movs r7, #0xff
_0225CAEE:
	adds r0, r6, #0
	adds r0, #0xbc
	str r7, [r0]
	adds r0, r4, #0
	bl FUN_02034818
	cmp r0, #0
	beq _0225CB06
	adds r0, r5, #0
	adds r0, #0xbc
	str r4, [r0]
	adds r5, r5, #4
_0225CB06:
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #4
	blt _0225CAEE
	ldr r0, [sp, #4]
	adds r0, #0x88
	ldr r3, [r0]
	ldr r0, [sp, #4]
	str r3, [sp]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x34]
	adds r0, #0x8c
	ldr r3, [r3, #0x3c]
	str r0, [sp, #4]
	bl FUN_02258800
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov92_0225CAB4

	thumb_func_start ov92_0225CB2C
ov92_0225CB2C: @ 0x0225CB2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0
	bne _0225CBC6
	cmp r6, #0
	bne _0225CBC6
	ldr r3, _0225CC48 @ =0x00001FD4
	movs r0, #0
	movs r2, #0xc3
	str r0, [r5, r3]
	adds r1, r3, #4
	lsls r2, r2, #2
	str r0, [r5, r1]
	ldr r1, [r5, r2]
	cmp r1, #0
	beq _0225CB82
	movs r0, #0x45
	lsls r0, r0, #2
	movs r1, #0xfe
	adds r0, r5, r0
	lsls r1, r1, #0x16
	bl ov92_02260628
	ldr r4, _0225CC4C @ =0x02263884
	add r3, sp, #0x18
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #0x4d
	str r0, [r3]
	adds r0, r2, #0
	ldr r2, _0225CC50 @ =0x00001FC8
	lsls r1, r1, #4
	adds r1, r5, r1
	adds r2, r5, r2
	blx FUN_020CBE9C
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0225CB82:
	adds r1, r2, #4
	str r0, [r5, r1]
	adds r2, #8
	str r0, [r5, r2]
	adds r1, r3, #4
	ldr r2, [r5, r1]
	ldr r1, [r5, r3]
	ldr r3, _0225CC54 @ =0x3FF0A3D7
	str r2, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r3, r1, #0
	bl ov92_02260428
	ldr r0, _0225CC58 @ =0x00001FD8
	ldr r2, [r5, r0]
	subs r0, r0, #4
	ldr r1, [r5, r0]
	ldr r0, _0225CC5C @ =0x3E6147AE
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	adds r3, r1, #0
	bl ov92_02260428
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0225CBC6:
	ldr r0, _0225CC60 @ =0x00001FCC
	movs r1, #0x28
	ldr r0, [r5, r0]
	asrs r7, r0, #0xc
	movs r0, #0x64
	subs r0, r0, r7
	blx FUN_020F2998
	blx FUN_020F2178
	ldr r0, _0225CC48 @ =0x00001FD4
	cmp r7, #0x5f
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _0225CBEA
	str r4, [r5, r0]
	adds r0, r0, #4
	str r6, [r5, r0]
_0225CBEA:
	ldr r3, _0225CC58 @ =0x00001FD8
	adds r1, r4, #0
	ldr r0, [r5, r3]
	subs r3, r3, #4
	str r0, [sp]
	movs r0, #1
	lsls r0, r0, #0x1e
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x45
	lsls r0, r0, #2
	ldr r3, [r5, r3]
	adds r0, r5, r0
	adds r2, r6, #0
	bl ov92_02260428
	ldr r3, _0225CC64 @ =0x02263878
	add r2, sp, #0xc
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #0x4d
	str r0, [r2]
	ldr r2, _0225CC50 @ =0x00001FC8
	lsls r1, r1, #4
	adds r0, r7, #0
	adds r1, r5, r1
	adds r2, r5, r2
	blx FUN_020CBE9C
	ldr r0, _0225CC68 @ =0x0000058A
	bl FUN_02006184
	cmp r0, #0
	bne _0225CC3A
	ldr r0, _0225CC68 @ =0x0000058A
	bl FUN_0200604C
_0225CC3A:
	ldr r0, _0225CC48 @ =0x00001FD4
	str r4, [r5, r0]
	adds r0, r0, #4
	str r6, [r5, r0]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0225CC48: .4byte 0x00001FD4
_0225CC4C: .4byte 0x02263884
_0225CC50: .4byte 0x00001FC8
_0225CC54: .4byte 0x3FF0A3D7
_0225CC58: .4byte 0x00001FD8
_0225CC5C: .4byte 0x3E6147AE
_0225CC60: .4byte 0x00001FCC
_0225CC64: .4byte 0x02263878
_0225CC68: .4byte 0x0000058A
	thumb_func_end ov92_0225CB2C

	thumb_func_start ov92_0225CC6C
ov92_0225CC6C: @ 0x0225CC6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xcc
	ldr r3, _0225CDEC @ =0x02263A94
	adds r5, r0, #0
	add r2, sp, #0xc
	movs r1, #0x60
_0225CC78:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _0225CC78
	adds r0, r5, #0
	adds r0, #0xf0
	ldr r0, [r0]
	bl FUN_0200DCD4
	adds r7, r0, #0
	ldr r1, [r5, #0xc]
	movs r0, #0xc
	muls r0, r1, r0
	adds r0, r7, r0
	lsls r1, r0, #2
	add r0, sp, #0xc
	ldrsh r4, [r0, r1]
	add r0, sp, #0xc
	adds r0, #2
	ldrsh r6, [r0, r1]
	cmp r4, #0
	bne _0225CCB8
	cmp r6, #0
	bne _0225CCB8
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov92_0225CB2C
	b _0225CCF0
_0225CCB8:
	adds r1, r4, #0
	adds r2, r6, #0
	adds r0, r5, #0
	adds r1, #0x80
	adds r2, #0x80
	bl ov92_0225CB2C
	cmp r4, #0
	beq _0225CCDE
	adds r4, #0x58
	adds r6, #0x80
	lsls r1, r4, #0x10
	lsls r2, r6, #0x10
	adds r0, r5, #0
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov92_02260A38
	b _0225CCF0
_0225CCDE:
	adds r4, #0x80
	adds r6, #0x80
	lsls r1, r4, #0x10
	lsls r2, r6, #0x10
	adds r0, r5, #0
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov92_02260A38
_0225CCF0:
	cmp r7, #0
	bne _0225CD00
	ldr r0, [r5, #8]
	cmp r0, r7
	beq _0225CD00
	ldr r0, [r5, #0xc]
	adds r0, r0, #1
	str r0, [r5, #0xc]
_0225CD00:
	str r7, [r5, #8]
	ldr r0, [r5, #0xc]
	cmp r0, #2
	bne _0225CD76
	adds r0, r5, #0
	adds r0, #0xf0
	ldr r0, [r0]
	bl FUN_0200DC64
	cmp r0, #2
	beq _0225CD76
	adds r0, r5, #0
	adds r0, #0xf0
	ldr r0, [r0]
	movs r1, #0x80
	movs r2, #0x64
	bl FUN_0200DDB8
	adds r0, r5, #0
	adds r0, #0xf0
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0200DC58
	movs r0, #0xa9
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov92_022630E8
	movs r0, #0xad
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov92_022630E8
	movs r3, #5
	movs r1, #0
	ldr r0, _0225CDF0 @ =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	movs r3, #4
	mvns r3, r3
	movs r1, #0
	ldr r0, _0225CDF0 @ =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
_0225CD76:
	ldr r0, [r5, #0xc]
	cmp r0, #3
	bne _0225CDDC
	cmp r7, #0xb
	bne _0225CDDC
	movs r1, #0
	str r1, [r5, #8]
	adds r0, r5, #0
	str r1, [r5, #0xc]
	adds r0, #0xf0
	ldr r0, [r0]
	bl FUN_0200DCE8
	movs r0, #0xa9
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov92_022630E8
	movs r0, #0xad
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov92_022630E8
	movs r3, #5
	movs r1, #0
	ldr r0, _0225CDF0 @ =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	movs r3, #4
	mvns r3, r3
	movs r1, #0
	ldr r0, _0225CDF0 @ =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	add sp, #0xcc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0225CDDC:
	adds r5, #0xf0
	ldr r0, [r5]
	bl FUN_0200DC24
	movs r0, #0
	add sp, #0xcc
	pop {r4, r5, r6, r7, pc}
	nop
_0225CDEC: .4byte 0x02263A94
_0225CDF0: .4byte 0x3F4CCCCD
	thumb_func_end ov92_0225CC6C

	thumb_func_start ov92_0225CDF4
ov92_0225CDF4: @ 0x0225CDF4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov92_0225D8E4
	cmp r0, #0
	beq _0225CE18
	cmp r0, #1
	beq _0225CE10
	cmp r0, #2
	beq _0225CE14
	b _0225CE18
_0225CE10:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225CE14:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225CE18:
	ldr r0, [r7]
	cmp r0, #0x14
	bls _0225CE20
	b _0225D1B8
_0225CE20:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225CE2C: @ jump table
	.2byte _0225CE56 - _0225CE2C - 2 @ case 0
	.2byte _0225CE74 - _0225CE2C - 2 @ case 1
	.2byte _0225CE8C - _0225CE2C - 2 @ case 2
	.2byte _0225CEBE - _0225CE2C - 2 @ case 3
	.2byte _0225CEDC - _0225CE2C - 2 @ case 4
	.2byte _0225CEEE - _0225CE2C - 2 @ case 5
	.2byte _0225CF0E - _0225CE2C - 2 @ case 6
	.2byte _0225CF44 - _0225CE2C - 2 @ case 7
	.2byte _0225CF52 - _0225CE2C - 2 @ case 8
	.2byte _0225CF6A - _0225CE2C - 2 @ case 9
	.2byte _0225CF92 - _0225CE2C - 2 @ case 10
	.2byte _0225CFE6 - _0225CE2C - 2 @ case 11
	.2byte _0225D00E - _0225CE2C - 2 @ case 12
	.2byte _0225D026 - _0225CE2C - 2 @ case 13
	.2byte _0225D068 - _0225CE2C - 2 @ case 14
	.2byte _0225D096 - _0225CE2C - 2 @ case 15
	.2byte _0225D0AA - _0225CE2C - 2 @ case 16
	.2byte _0225D0C6 - _0225CE2C - 2 @ case 17
	.2byte _0225D12A - _0225CE2C - 2 @ case 18
	.2byte _0225D194 - _0225CE2C - 2 @ case 19
	.2byte _0225D1B8 - _0225CE2C - 2 @ case 20
_0225CE56:
	adds r0, r4, #0
	adds r0, #0x8c
	movs r1, #0x71
	bl FUN_02258920
	adds r1, r4, #0
	adds r1, #0x9c
	str r0, [r1]
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CE74:
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_022589BC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #2
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CE8C:
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_022589CC
	strb r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_02258938
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x9c
	str r1, [r0]
	adds r0, r4, #0
	bl ov92_0225C5C4
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CEBE:
	movs r0, #0x1b
	bl ov92_0225D868
	adds r5, r0, #0
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl ov92_0225E1A8
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CEDC:
	bl FUN_0200FB5C
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #5
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CEEE:
	ldr r0, [r4, #4]
	bl ov92_0225E070
	ldr r0, [r4, #4]
	bl ov92_0226156C
	ldr r0, [r4, #4]
	bl ov92_02261B18
	adds r0, r4, #0
	movs r1, #1
	movs r2, #6
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CF0E:
	ldr r0, [r4, #4]
	bl ov92_0225CC6C
	adds r5, r0, #0
	beq _0225CF36
	adds r0, r4, #0
	bl ov92_0225D8C4
	cmp r0, #1
	bne _0225CF36
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	adds r1, r4, #0
	str r0, [r4, #0x18]
	movs r0, #0x16
	adds r1, #0x14
	movs r2, #8
	bl FUN_02037030
_0225CF36:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CF44:
	ldr r1, [r4, #8]
	adds r0, r4, #0
	movs r2, #8
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CF52:
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_02258C8C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #9
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CF6A:
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_02258CE0
	adds r5, r0, #0
	beq _0225CF84
	ldr r0, [r4, #4]
	bl ov92_0225E360
	ldr r0, [r4, #4]
	bl ov92_0225E100
_0225CF84:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CF92:
	ldr r5, [r4, #0xc]
	cmp r5, #0
	beq _0225CFA8
	ldr r1, [r4, #4]
	ldr r0, _0225D1E4 @ =0x00002AE4
	ldr r1, [r1, r0]
	movs r0, #0x4b
	lsls r0, r0, #4
	cmp r1, r0
	bge _0225CFA8
	movs r5, #0
_0225CFA8:
	cmp r5, #0
	bne _0225CFD8
	adds r0, r4, #0
	bl ov92_0225D8C4
	cmp r0, #1
	bne _0225CFD2
	ldr r0, [r4]
	bl ov92_0225EB70
	cmp r0, #0
	bne _0225CFD2
	ldr r0, _0225D1E8 @ =0x00000589
	movs r1, #0
	bl FUN_02006154
	movs r1, #0
	movs r0, #0x17
	adds r2, r1, #0
	bl FUN_02037030
_0225CFD2:
	ldr r0, [r4, #4]
	bl ov92_0225FC2C
_0225CFD8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xb
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225CFE6:
	ldr r0, _0225D1EC @ =0x0000058B
	movs r1, #0
	bl FUN_02006154
	ldr r0, _0225D1E8 @ =0x00000589
	movs r1, #0
	bl FUN_02006154
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_02258CB0
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xc
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D00E:
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_02258CE0
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0xd
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D026:
	ldr r1, [r4, #4]
	ldr r0, _0225D1F0 @ =0x00002AF0
	ldr r0, [r1, r0]
	movs r1, #0xa
	blx FUN_020F2998
	movs r1, #0x64
	muls r1, r0, r1
	ldr r0, _0225D1F4 @ =0x000186A0
	str r1, [r4, #0x1c]
	cmp r1, r0
	blo _0225D040
	str r0, [r4, #0x1c]
_0225D040:
	ldr r1, [r4, #4]
	ldr r0, _0225D1F8 @ =0x00002B94
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0225D04E
	movs r0, #1
	str r0, [r4, #0x1c]
_0225D04E:
	adds r1, r4, #0
	movs r0, #0x19
	adds r1, #0x1c
	movs r2, #8
	bl FUN_02037030
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xe
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D068:
	movs r1, #0
	adds r0, r1, #0
	adds r3, r1, #0
	adds r5, r4, #0
_0225D070:
	ldr r2, [r5, #0x24]
	cmp r2, #0
	beq _0225D078
	adds r0, r0, #1
_0225D078:
	adds r3, r3, #1
	adds r5, #8
	cmp r3, #4
	blt _0225D070
	ldr r2, [r4, #4]
	ldr r2, [r2, #4]
	cmp r0, r2
	bne _0225D08A
	movs r1, #1
_0225D08A:
	adds r0, r4, #0
	movs r2, #0xf
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D096:
	movs r0, #0x1a
	bl ov92_0225D868
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x10
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D0AA:
	bl FUN_0200FB5C
	adds r5, r0, #0
	beq _0225D0B8
	adds r0, r4, #0
	bl ov92_0225D1FC
_0225D0B8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x11
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D0C6:
	movs r6, #0
	adds r5, r4, #0
_0225D0CA:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov92_0226077C
	cmp r0, #0xff
	beq _0225D0F2
	lsls r0, r0, #2
	adds r1, r4, r0
	ldr r2, [r5, #0x24]
	adds r1, #0xa0
	str r2, [r1]
	adds r1, r4, r0
	adds r1, #0xa0
	ldr r1, [r1]
	cmp r1, #1
	bhi _0225D0F2
	adds r1, r4, r0
	adds r1, #0xa0
	movs r0, #0
	str r0, [r1]
_0225D0F2:
	adds r6, r6, #1
	adds r5, #8
	cmp r6, #4
	blt _0225D0CA
	adds r1, r4, #0
	adds r1, #0x94
	ldrb r1, [r1]
	adds r0, r4, #0
	adds r0, #0xa0
	bl FUN_02258AA8
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x8c
	adds r1, #0xa0
	movs r2, #0x71
	bl FUN_022589EC
	adds r1, r4, #0
	adds r1, #0xb8
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x12
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D12A:
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	bl FUN_02258AA0
	adds r5, r0, #0
	beq _0225D186
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	bl FUN_02258AA4
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	bl FUN_02258A04
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xb8
	str r1, [r0]
	cmp r6, #0
	beq _0225D186
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0xcc
	str r1, [r0]
	adds r0, r4, #0
	bl ov92_0225D344
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	adds r3, r7, #0
	bl ov92_0225D88C
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	beq _0225D1CA
	bl FUN_021E6A4C
	b _0225D1CA
_0225D186:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x13
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D194:
	movs r0, #0x1b
	bl FUN_02037AC0
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	beq _0225D1AA
	bl FUN_021E6A4C
_0225D1AA:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	adds r3, r7, #0
	bl ov92_0225D88C
	b _0225D1CA
_0225D1B8:
	movs r0, #0x1b
	bl FUN_02037B38
	cmp r0, #1
	bne _0225D1C6
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225D1C6:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225D1CA:
	ldr r0, [r7]
	cmp r0, #3
	blt _0225D1E0
	cmp r0, #0x10
	bge _0225D1E0
	ldr r0, [r4, #4]
	bl ov92_0225E008
	adds r0, r4, #0
	bl ov92_0225DA40
_0225D1E0:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225D1E4: .4byte 0x00002AE4
_0225D1E8: .4byte 0x00000589
_0225D1EC: .4byte 0x0000058B
_0225D1F0: .4byte 0x00002AF0
_0225D1F4: .4byte 0x000186A0
_0225D1F8: .4byte 0x00002B94
	thumb_func_end ov92_0225CDF4

	thumb_func_start ov92_0225D1FC
ov92_0225D1FC: @ 0x0225D1FC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_020205AC
	bl FUN_02021238
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_0201FD38
	ldr r0, [r5, #4]
	bl ov92_0225E03C
	ldr r0, [r5, #4]
	bl ov92_0225DEF0
	ldr r0, [r5, #4]
	bl ov92_0225DF40
	ldr r0, [r5, #4]
	bl ov92_0225E918
	ldr r0, [r5, #4]
	bl ov92_0225E9A8
	movs r0, #0x45
	ldr r1, [r5, #4]
	lsls r0, r0, #2
	adds r0, r1, r0
	bl ov92_0225DA2C
	movs r0, #0x32
	ldr r1, [r5, #4]
	lsls r0, r0, #4
	adds r0, r1, r0
	bl ov92_0225DA2C
	ldr r1, [r5, #4]
	ldr r0, _0225D32C @ =0x0000052C
	adds r0, r1, r0
	bl ov92_0225DA2C
	ldr r1, [r5, #4]
	ldr r0, _0225D330 @ =0x00000738
	adds r0, r1, r0
	bl ov92_0225DA2C
	ldr r1, [r5, #4]
	ldr r0, _0225D334 @ =0x00000944
	adds r0, r1, r0
	bl ov92_0225DA2C
	movs r0, #0xea
	ldr r1, [r5, #4]
	lsls r0, r0, #2
	adds r0, r1, r0
	adds r1, r5, #0
	adds r1, #0x6c
	bl FUN_020180F8
	movs r0, #0xef
	ldr r1, [r5, #4]
	lsls r0, r0, #2
	adds r0, r1, r0
	adds r1, r5, #0
	adds r1, #0x6c
	bl FUN_020180F8
	movs r0, #0x3d
	ldr r1, [r5, #4]
	lsls r0, r0, #4
	adds r0, r1, r0
	adds r1, r5, #0
	adds r1, #0x6c
	bl FUN_020180F8
	ldr r1, [r5, #4]
	ldr r0, _0225D338 @ =0x000005B4
	adds r0, r1, r0
	adds r1, r5, #0
	adds r1, #0x6c
	bl FUN_020180F8
	movs r0, #0x1f
	ldr r1, [r5, #4]
	lsls r0, r0, #6
	adds r0, r1, r0
	adds r1, r5, #0
	adds r1, #0x6c
	bl FUN_020180F8
	movs r7, #0
	adds r6, r5, #0
	adds r4, r7, #0
	adds r6, #0x6c
_0225D2C8:
	movs r0, #0xb5
	ldr r1, [r5, #4]
	lsls r0, r0, #4
	adds r0, r1, r0
	adds r0, r0, r4
	bl ov92_0225DA2C
	ldr r1, [r5, #4]
	ldr r0, _0225D33C @ =0x00000BD8
	adds r0, r1, r0
	adds r0, r0, r4
	adds r1, r6, #0
	bl FUN_020180F8
	ldr r1, [r5, #4]
	ldr r0, _0225D340 @ =0x00000BEC
	adds r0, r1, r0
	adds r0, r0, r4
	adds r1, r6, #0
	bl FUN_020180F8
	movs r0, #0x83
	lsls r0, r0, #2
	adds r7, r7, #1
	adds r4, r4, r0
	cmp r7, #8
	blt _0225D2C8
	adds r0, r5, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_02258C38
	adds r0, r5, #0
	bl ov92_0225D49C
	adds r0, r5, #0
	bl ov92_0225D8C4
	cmp r0, #1
	bne _0225D31E
	ldr r0, [r5]
	bl ov92_0225EB68
_0225D31E:
	ldr r0, [r5, #4]
	bl ov92_0225ED60
	movs r0, #0
	str r0, [r5]
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225D32C: .4byte 0x0000052C
_0225D330: .4byte 0x00000738
_0225D334: .4byte 0x00000944
_0225D338: .4byte 0x000005B4
_0225D33C: .4byte 0x00000BD8
_0225D340: .4byte 0x00000BEC
	thumb_func_end ov92_0225D1FC

	thumb_func_start ov92_0225D344
ov92_0225D344: @ 0x0225D344
	movs r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	str r1, [r0, #0x10]
	adds r2, r0, #0
	strb r1, [r0, #0x1c]
	adds r2, #0x1c
	strb r1, [r2, #1]
	strb r1, [r2, #2]
	strb r1, [r2, #3]
	strb r1, [r2, #4]
	strb r1, [r2, #5]
	strb r1, [r2, #6]
	strb r1, [r2, #7]
	ldr r3, _0225D368 @ =FUN_020E5B44
	adds r0, #0x24
	movs r2, #0x20
	bx r3
	.align 2, 0
_0225D368: .4byte FUN_020E5B44
	thumb_func_end ov92_0225D344

	thumb_func_start ov92_0225D36C
ov92_0225D36C: @ 0x0225D36C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r1, [r5]
	adds r6, r0, #0
	cmp r1, #0
	bne _0225D3AC
	bl FUN_02007290
	bl ov92_0225D8E4
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_02007294
	movs r0, #0x71
	bl FUN_0201A9C4
	movs r0, #0
	movs r1, #1
	bl FUN_020398D4
	cmp r4, #0
	beq _0225D39E
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225D39E:
	movs r0, #0xe7
	bl FUN_02037AC0
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0225D3C8
_0225D3AC:
	movs r0, #0xe7
	bl FUN_02037B38
	cmp r0, #1
	beq _0225D3C4
	bl FUN_02037454
	adds r4, r0, #0
	bl FUN_020347A0
	cmp r4, r0
	bge _0225D3C8
_0225D3C4:
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225D3C8:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov92_0225D36C

	thumb_func_start ov92_0225D3CC
ov92_0225D3CC: @ 0x0225D3CC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0xc1
	movs r1, #0x71
	bl FUN_02007688
	str r0, [r4, #0x48]
	movs r0, #0xbd
	movs r1, #0x71
	bl FUN_02007688
	str r0, [r4, #0x4c]
	movs r0, #0x71
	bl FUN_0201AC88
	str r0, [r4, #0x58]
	movs r0, #0x71
	bl FUN_020030E8
	str r0, [r4, #0x5c]
	movs r0, #4
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r0, #0x71
	movs r2, #1
	adds r3, r1, #0
	bl FUN_02026EB4
	str r0, [r4, #0x60]
	movs r0, #0x71
	bl FUN_02023114
	str r0, [r4, #0x64]
	adds r0, r4, #0
	bl ov92_0225DD88
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl FUN_02003B50
	movs r2, #2
	ldr r0, [r4, #0x5c]
	movs r1, #0
	lsls r2, r2, #8
	movs r3, #0x71
	bl FUN_02003120
	movs r1, #1
	ldr r0, [r4, #0x5c]
	lsls r2, r1, #9
	movs r3, #0x71
	bl FUN_02003120
	movs r1, #2
	ldr r0, [r4, #0x5c]
	lsls r2, r1, #8
	movs r3, #0x71
	bl FUN_02003120
	movs r2, #2
	ldr r0, [r4, #0x5c]
	movs r1, #3
	lsls r2, r2, #8
	movs r3, #0x71
	bl FUN_02003120
	ldr r0, [r4, #0x58]
	bl ov92_0225D594
	adds r0, r4, #0
	bl ov92_0225D7CC
	ldr r0, _0225D490 @ =0x04000060
	ldr r1, _0225D494 @ =0xFFFFCFFF
	ldrh r2, [r0]
	adds r3, r2, #0
	ands r3, r1
	movs r2, #8
	orrs r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	ands r2, r1
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r0]
	ldr r0, _0225D498 @ =0x022638B0
	blx FUN_020CF8E4
	adds r4, #0x6c
	adds r0, r4, #0
	movs r1, #0x71
	movs r2, #0x20
	bl FUN_0201AC14
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_0225D490: .4byte 0x04000060
_0225D494: .4byte 0xFFFFCFFF
_0225D498: .4byte 0x022638B0
	thumb_func_end ov92_0225D3CC

	thumb_func_start ov92_0225D49C
ov92_0225D49C: @ 0x0225D49C
	push {r4, lr}
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
	ldr r0, [r4, #0x58]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r4, #0x58]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x58]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0x58]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x58]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4, #0x58]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [r4, #0x58]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [r4, #0x58]
	movs r1, #7
	bl FUN_0201BB4C
	ldr r0, [r4, #0x58]
	bl FUN_0201AB0C
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl FUN_02003150
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl FUN_02003150
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl FUN_02003150
	ldr r0, [r4, #0x5c]
	movs r1, #3
	bl FUN_02003150
	ldr r0, [r4, #0x5c]
	bl FUN_02003104
	ldr r0, [r4, #0x48]
	bl FUN_0200770C
	ldr r0, [r4, #0x4c]
	bl FUN_0200770C
	ldr r0, [r4, #0x60]
	bl FUN_02026F54
	ldr r0, [r4, #0x64]
	bl FUN_02023120
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x54]
	bl FUN_0200D998
	ldr r0, [r4, #0x50]
	bl FUN_0200D108
	ldr r0, _0225D588 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	ldr r2, _0225D58C @ =0x04000060
	ldr r0, _0225D590 @ =0x0000CFF7
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	pop {r4, pc}
	.align 2, 0
_0225D588: .4byte 0x021D116C
_0225D58C: .4byte 0x04000060
_0225D590: .4byte 0x0000CFF7
	thumb_func_end ov92_0225D49C

	thumb_func_start ov92_0225D594
ov92_0225D594: @ 0x0225D594
	push {r4, r5, lr}
	sub sp, #0x11c
	adds r4, r0, #0
	bl FUN_02022C54
	ldr r5, _0225D7B0 @ =0x02263890
	add r3, sp, #0x2c
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _0225D7B4 @ =0x0226390C
	add r3, sp, #4
	movs r2, #5
_0225D5B8:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0225D5B8
	add r0, sp, #4
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
	ldr r5, _0225D7B8 @ =0x02263934
	add r3, sp, #0xac
	movs r2, #0xe
_0225D604:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0225D604
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x71
	bl FUN_0201C1C4
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x71
	bl FUN_0201C1C4
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x71
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #1
	add r2, sp, #0xc8
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #2
	add r2, sp, #0xe4
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #3
	add r2, sp, #0x100
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201CAE0
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	ldr r5, _0225D7BC @ =0x022639A4
	add r3, sp, #0x3c
	movs r2, #0xe
_0225D67A:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0225D67A
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x71
	bl FUN_0201C1C4
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x71
	bl FUN_0201C1C4
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x71
	bl FUN_0201C1C4
	movs r0, #7
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x71
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #4
	add r2, sp, #0x3c
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #5
	add r2, sp, #0x58
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #6
	add r2, sp, #0x74
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #7
	add r2, sp, #0x90
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
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x71
	bl FUN_0201C1C4
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x71
	bl FUN_0201C1C4
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x71
	bl FUN_0201C1C4
	movs r0, #7
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x71
	bl FUN_0201C1C4
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
	ldr r0, _0225D7C0 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #0xa
	str r0, [sp]
	ldr r0, _0225D7C4 @ =0x04000050
	movs r1, #0
	movs r2, #0x1e
	movs r3, #7
	blx FUN_020CF15C
	movs r0, #0xa
	str r0, [sp]
	ldr r0, _0225D7C8 @ =0x04001050
	movs r1, #0
	movs r2, #0x11
	movs r3, #7
	blx FUN_020CF15C
	add sp, #0x11c
	pop {r4, r5, pc}
	.align 2, 0
_0225D7B0: .4byte 0x02263890
_0225D7B4: .4byte 0x0226390C
_0225D7B8: .4byte 0x02263934
_0225D7BC: .4byte 0x022639A4
_0225D7C0: .4byte 0x021D116C
_0225D7C4: .4byte 0x04000050
_0225D7C8: .4byte 0x04001050
	thumb_func_end ov92_0225D594

	thumb_func_start ov92_0225D7CC
ov92_0225D7CC: @ 0x0225D7CC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x4c
	adds r4, r0, #0
	movs r0, #0x71
	bl FUN_0200CF18
	add r2, sp, #0x2c
	ldr r5, _0225D85C @ =0x022638EC
	str r0, [r4, #0x50]
	ldm r5!, {r0, r1}
	adds r3, r2, #0
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	ldr r6, _0225D860 @ =0x022638C0
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
	ldr r0, [r4, #0x50]
	movs r3, #0x20
	bl FUN_0200CF70
	ldr r3, _0225D864 @ =0x022638D4
	add r2, sp, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4, #0x50]
	bl FUN_0200CF38
	str r0, [r4, #0x54]
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x54]
	movs r2, #0xff
	bl FUN_0200CFF4
	cmp r0, #0
	bne _0225D836
	bl GF_AssertFail
_0225D836:
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x54]
	add r2, sp, #0
	bl FUN_0200D3F8
	cmp r0, #0
	bne _0225D848
	bl GF_AssertFail
_0225D848:
	ldr r0, [r4, #0x50]
	bl FUN_0200CF6C
	movs r2, #1
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	add sp, #0x4c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0225D85C: .4byte 0x022638EC
_0225D860: .4byte 0x022638C0
_0225D864: .4byte 0x022638D4
	thumb_func_end ov92_0225D7CC

	thumb_func_start ov92_0225D868
ov92_0225D868: @ 0x0225D868
	push {lr}
	sub sp, #0xc
	adds r1, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x71
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov92_0225D868

	thumb_func_start ov92_0225D88C
ov92_0225D88C: @ 0x0225D88C
	cmp r1, #0
	beq _0225D892
	str r2, [r3]
_0225D892:
	bx lr
	thumb_func_end ov92_0225D88C

	thumb_func_start ov92_0225D894
ov92_0225D894: @ 0x0225D894
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0202061C
	bl FUN_0200D034
	ldr r0, [r4, #0x5c]
	bl FUN_0200398C
	ldr r0, [r4, #0x58]
	bl FUN_0201EEB4
	ldr r3, _0225D8BC @ =0x027E0000
	ldr r1, _0225D8C0 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_0225D8BC: .4byte 0x027E0000
_0225D8C0: .4byte 0x00003FF8
	thumb_func_end ov92_0225D894

	thumb_func_start ov92_0225D8C4
ov92_0225D8C4: @ 0x0225D8C4
	ldr r0, [r0, #0x44]
	cmp r0, #0
	bne _0225D8CE
	movs r0, #1
	bx lr
_0225D8CE:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov92_0225D8C4

	thumb_func_start ov92_0225D8D4
ov92_0225D8D4: @ 0x0225D8D4
	movs r1, #1
	str r1, [r0, #8]
	bx lr
	.align 2, 0
	thumb_func_end ov92_0225D8D4

	thumb_func_start ov92_0225D8DC
ov92_0225D8DC: @ 0x0225D8DC
	movs r1, #1
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
	thumb_func_end ov92_0225D8DC

	thumb_func_start ov92_0225D8E4
ov92_0225D8E4: @ 0x0225D8E4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x8c
	bl FUN_02258B54
	cmp r0, #1
	bne _0225D96A
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225D916
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0225D908
	bl FUN_0200FB70
_0225D908:
	movs r0, #0
	bl FUN_0200FC20
	movs r0, #1
	adds r4, #0x7c
	strb r0, [r4]
	pop {r4, pc}
_0225D916:
	adds r0, r4, #0
	adds r0, #0x8c
	bl FUN_02258B98
	cmp r0, #0
	bne _0225D926
	movs r0, #1
	pop {r4, pc}
_0225D926:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0225D93C
	bl ov92_0225E360
	ldr r0, [r4, #4]
	bl ov92_0225E100
	adds r0, r4, #0
	bl ov92_0225D1FC
_0225D93C:
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	cmp r0, #0
	beq _0225D952
	bl FUN_02258A04
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xb8
	str r1, [r0]
_0225D952:
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	beq _0225D966
	bl FUN_02258938
	movs r0, #0
	adds r4, #0x9c
	str r0, [r4]
_0225D966:
	movs r0, #2
	pop {r4, pc}
_0225D96A:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov92_0225D8E4

	thumb_func_start ov92_0225D970
ov92_0225D970: @ 0x0225D970
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x6c]
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r0, #0
	beq _0225D9A4
	blx FUN_020BEF98
	movs r0, #0x1c
	adds r1, r6, #0
	movs r2, #3
	blx FUN_020C2528
	movs r0, #0x19
	adds r1, r4, #0
	movs r2, #0xc
	blx FUN_020C2528
	adds r0, r5, #0
	adds r0, #0x60
	blx FUN_020BF004
	adds r0, r5, #0
	blx FUN_020BFCC8
_0225D9A4:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov92_0225D970

	thumb_func_start ov92_0225D9A8
ov92_0225D9A8: @ 0x0225D9A8
	push {r3, lr}
	adds r0, #0x78
	movs r3, #0x71
	bl FUN_02018030
	pop {r3, pc}
	thumb_func_end ov92_0225D9A8

	thumb_func_start ov92_0225D9B4
ov92_0225D9B4: @ 0x0225D9B4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r4, #0
	adds r1, #0x78
	bl FUN_020181B0
	movs r1, #0
	ldr r2, _0225DA28 @ =0xFFFEC000
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_020182A8
	cmp r5, #0
	bne _0225D9E2
	movs r1, #1
	lsls r1, r1, #0xc
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_020182C4
	b _0225D9F0
_0225D9E2:
	movs r1, #6
	lsls r1, r1, #0xa
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_020182C4
_0225D9F0:
	adds r0, r4, #0
	movs r1, #1
	bl FUN_020182A0
	movs r2, #0x1e
	lsls r2, r2, #4
	movs r0, #0
	ldr r3, _0225DA28 @ =0xFFFEC000
	str r0, [r4, r2]
	adds r1, r2, #4
	str r3, [r4, r1]
	adds r1, r2, #0
	adds r1, #8
	str r0, [r4, r1]
	adds r1, r2, #0
	adds r1, #0x1c
	str r0, [r4, r1]
	adds r1, r2, #0
	adds r1, #0x20
	str r0, [r4, r1]
	adds r1, r2, #0
	adds r1, #0xc
	str r0, [r4, r1]
	movs r0, #1
	adds r2, #0x10
	str r0, [r4, r2]
	pop {r3, r4, r5, pc}
	nop
_0225DA28: .4byte 0xFFFEC000
	thumb_func_end ov92_0225D9B4

	thumb_func_start ov92_0225DA2C
ov92_0225DA2C: @ 0x0225DA2C
	movs r1, #0x1f
	ldr r3, _0225DA3C @ =FUN_02018068
	movs r2, #0
	lsls r1, r1, #4
	str r2, [r0, r1]
	adds r0, #0x78
	bx r3
	nop
_0225DA3C: .4byte FUN_02018068
	thumb_func_end ov92_0225DA2C

	thumb_func_start ov92_0225DA40
ov92_0225DA40: @ 0x0225DA40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	bl FUN_02026E48
	bl FUN_02023154
	ldr r4, _0225DD04 @ =0x02263B68
	add r3, sp, #0x18
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r4]
	adds r1, r2, #0
	str r0, [r3]
	adds r0, r2, #0
	blx FUN_020CCFE0
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	movs r0, #0
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	blx FUN_020BF034
	ldr r1, _0225DD08 @ =0x00007FFF
	movs r0, #0
	blx FUN_020BF070
	ldr r0, _0225DD08 @ =0x00007FFF
	movs r2, #0
	adds r1, r0, #0
	blx FUN_020BF084
	ldr r0, _0225DD08 @ =0x00007FFF
	movs r2, #0
	adds r1, r0, #0
	blx FUN_020BF0A8
	movs r7, #0
	adds r4, r7, #0
_0225DA9C:
	movs r0, #0xb5
	ldr r1, [r5, #4]
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	adds r6, r0, r4
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	movs r1, #0x1b
	movs r2, #0x1e
	lsls r1, r1, #4
	lsls r2, r2, #4
	adds r0, r6, #0
	adds r1, r6, r1
	adds r2, r6, r2
	bl ov92_0225D970
	movs r0, #1
	str r0, [sp, #0x14]
	movs r0, #0x12
	add r1, sp, #0x14
	movs r2, #1
	blx FUN_020C2528
	ldr r1, [r5, #4]
	ldr r0, _0225DD0C @ =0x00000BD8
	adds r0, r1, r0
	movs r1, #1
	adds r0, r0, r4
	lsls r1, r1, #0xc
	bl FUN_02018124
	movs r0, #0x83
	lsls r0, r0, #2
	adds r7, r7, #1
	adds r4, r4, r0
	cmp r7, #8
	blt _0225DA9C
	ldr r1, [r5, #4]
	subs r0, #0xfc
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225DB00
	cmp r0, #1
	beq _0225DB40
	cmp r0, #2
	beq _0225DB74
	b _0225DBA8
_0225DB00:
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #1
	bl FUN_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD10 @ =0x0000052C
	adds r0, r1, r0
	movs r1, #0
	bl FUN_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD14 @ =0x00000738
	adds r0, r1, r0
	movs r1, #0
	bl FUN_020182A0
	movs r0, #0xea
	ldr r1, [r5, #4]
	lsls r0, r0, #2
	adds r2, r1, r0
	ldr r0, _0225DD18 @ =0x00000514
	ldr r1, [r1, r0]
	movs r0, #0x14
	muls r0, r1, r0
	movs r1, #1
	adds r0, r2, r0
	lsls r1, r1, #0xc
	bl FUN_02018124
	b _0225DBA8
_0225DB40:
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD10 @ =0x0000052C
	adds r0, r1, r0
	movs r1, #1
	bl FUN_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD14 @ =0x00000738
	adds r0, r1, r0
	movs r1, #0
	bl FUN_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD1C @ =0x000005B4
	adds r0, r1, r0
	movs r1, #1
	lsls r1, r1, #0xc
	bl FUN_0201815C
	b _0225DBA8
_0225DB74:
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD10 @ =0x0000052C
	adds r0, r1, r0
	movs r1, #0
	bl FUN_020182A0
	ldr r1, [r5, #4]
	ldr r0, _0225DD14 @ =0x00000738
	adds r0, r1, r0
	movs r1, #1
	bl FUN_020182A0
	movs r0, #0x1f
	ldr r1, [r5, #4]
	lsls r0, r0, #6
	adds r0, r1, r0
	movs r1, #1
	lsls r1, r1, #0xc
	bl FUN_0201815C
_0225DBA8:
	movs r0, #0x32
	ldr r1, [r5, #4]
	lsls r0, r0, #4
	adds r4, r1, r0
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r1, [r1, r0]
	adds r0, #0xfc
	adds r6, r1, #0
	movs r1, #0
	muls r6, r0, r6
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	movs r2, #0x1b
	lsls r2, r2, #4
	adds r1, r4, r2
	adds r2, #0x30
	adds r0, r4, r6
	adds r2, r4, r2
	bl ov92_0225D970
	movs r2, #1
	str r2, [sp, #0x10]
	movs r0, #0x12
	add r1, sp, #0x10
	blx FUN_020C2528
	movs r0, #0x45
	ldr r1, [r5, #4]
	lsls r0, r0, #2
	adds r4, r1, r0
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	movs r2, #0x1b
	lsls r2, r2, #4
	adds r1, r4, r2
	adds r2, #0x30
	adds r0, r4, #0
	adds r2, r4, r2
	bl ov92_0225D970
	movs r2, #1
	str r2, [sp, #0xc]
	movs r0, #0x12
	add r1, sp, #0xc
	blx FUN_020C2528
	ldr r1, [r5, #4]
	ldr r0, _0225DD20 @ =0x00000944
	adds r4, r1, r0
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	movs r2, #0x1b
	lsls r2, r2, #4
	adds r1, r4, r2
	adds r2, #0x30
	adds r0, r4, #0
	adds r2, r4, r2
	bl ov92_0225D970
	movs r2, #1
	str r2, [sp, #8]
	movs r0, #0x12
	add r1, sp, #8
	blx FUN_020C2528
	ldr r1, [r5, #4]
	ldr r0, _0225DD24 @ =0x00001FAC
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225DCA6
	ldr r0, _0225DD28 @ =0x00001DBC
	adds r4, r1, r0
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	movs r2, #0x1b
	lsls r2, r2, #4
	adds r1, r4, r2
	adds r2, #0x30
	adds r0, r4, #0
	adds r2, r4, r2
	bl ov92_0225D970
	movs r2, #1
	str r2, [sp, #4]
	movs r0, #0x12
	add r1, sp, #4
	blx FUN_020C2528
	ldr r1, [r5, #4]
	ldr r0, _0225DD2C @ =0x00001FA8
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225DCA6
	ldr r0, _0225DD30 @ =0x00001E44
	adds r0, r1, r0
	movs r1, #1
	lsls r1, r1, #0xc
	bl FUN_0201815C
	adds r4, r0, #0
	ldr r1, [r5, #4]
	ldr r0, _0225DD34 @ =0x00001E58
	adds r0, r1, r0
	movs r1, #1
	lsls r1, r1, #0xc
	bl FUN_0201815C
	cmp r4, #0
	beq _0225DCA6
	cmp r0, #0
	beq _0225DCA6
	ldr r1, [r5, #4]
	ldr r0, _0225DD2C @ =0x00001FA8
	movs r2, #0
	str r2, [r1, r0]
_0225DCA6:
	ldr r1, [r5, #4]
	ldr r0, _0225DD38 @ =0x00001DA0
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225DCF0
	ldr r0, _0225DD3C @ =0x00001BB0
	adds r4, r1, r0
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	movs r2, #0x1b
	lsls r2, r2, #4
	adds r1, r4, r2
	adds r2, #0x30
	adds r0, r4, #0
	adds r2, r4, r2
	bl ov92_0225D970
	movs r2, #1
	str r2, [sp]
	movs r0, #0x12
	add r1, sp, #0
	blx FUN_020C2528
	ldr r1, [r5, #4]
	ldr r0, _0225DD40 @ =0x00001D9C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225DCF0
	ldr r0, _0225DD44 @ =0x00001C4C
	adds r0, r1, r0
	movs r1, #1
	lsls r1, r1, #0xc
	bl FUN_02018124
_0225DCF0:
	movs r0, #0
	movs r1, #1
	bl FUN_02026E50
	ldr r0, [r5, #0x54]
	bl FUN_0200D020
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0225DD04: .4byte 0x02263B68
_0225DD08: .4byte 0x00007FFF
_0225DD0C: .4byte 0x00000BD8
_0225DD10: .4byte 0x0000052C
_0225DD14: .4byte 0x00000738
_0225DD18: .4byte 0x00000514
_0225DD1C: .4byte 0x000005B4
_0225DD20: .4byte 0x00000944
_0225DD24: .4byte 0x00001FAC
_0225DD28: .4byte 0x00001DBC
_0225DD2C: .4byte 0x00001FA8
_0225DD30: .4byte 0x00001E44
_0225DD34: .4byte 0x00001E58
_0225DD38: .4byte 0x00001DA0
_0225DD3C: .4byte 0x00001BB0
_0225DD40: .4byte 0x00001D9C
_0225DD44: .4byte 0x00001C4C
	thumb_func_end ov92_0225DA40

	thumb_func_start ov92_0225DD48
ov92_0225DD48: @ 0x0225DD48
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0225DD84 @ =0x00000514
	adds r4, r1, #0
	ldr r1, [r5, r0]
	cmp r4, r1
	beq _0225DD82
	movs r2, #0x32
	lsls r2, r2, #4
	adds r0, r5, r2
	adds r2, #0x88
	adds r3, r5, r2
	movs r2, #0x14
	muls r2, r1, r2
	adds r1, r3, r2
	bl FUN_020181E0
	ldr r0, _0225DD84 @ =0x00000514
	movs r1, #0x32
	lsls r1, r1, #4
	str r4, [r5, r0]
	adds r0, r5, r1
	adds r1, #0x88
	adds r2, r5, r1
	movs r1, #0x14
	muls r1, r4, r1
	adds r1, r2, r1
	bl FUN_020181D4
_0225DD82:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225DD84: .4byte 0x00000514
	thumb_func_end ov92_0225DD48

	thumb_func_start ov92_0225DD88
ov92_0225DD88: @ 0x0225DD88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r6, _0225DDD0 @ =0x02263B5C
	adds r4, r0, #0
	ldm r6!, {r0, r1}
	add r5, sp, #8
	adds r2, r5, #0
	stm r5!, {r0, r1}
	ldr r0, [r6]
	adds r1, r2, #0
	movs r2, #0xb6
	add r7, sp, #0x14
	movs r3, #0
	str r3, [r7]
	str r3, [r7, #4]
	str r3, [r7, #8]
	str r0, [r5]
	str r3, [sp]
	ldr r0, [r4, #0x64]
	lsls r2, r2, #4
	str r0, [sp, #4]
	adds r0, r7, #0
	bl FUN_02023308
	movs r1, #0xfa
	ldr r0, _0225DDD4 @ =0xFFC18000
	ldr r2, [r4, #0x64]
	lsls r1, r1, #0xe
	bl FUN_02023240
	ldr r0, [r4, #0x64]
	bl FUN_0202313C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225DDD0: .4byte 0x02263B5C
_0225DDD4: .4byte 0xFFC18000
	thumb_func_end ov92_0225DD88

	thumb_func_start ov92_0225DDD8
ov92_0225DDD8: @ 0x0225DDD8
	push {r3, r4}
	strh r1, [r0]
	strh r2, [r0, #2]
	movs r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	movs r2, #2
	str r2, [r0, #0x2c]
	str r1, [r0, #0x30]
	ldr r1, [sp, #8]
	ldr r4, [sp, #0xc]
	str r1, [r0, #0xc]
	str r4, [r0, #0x14]
	str r4, [r0, #0x18]
	str r4, [r0, #0x1c]
	str r4, [r0, #0x20]
	subs r1, r2, #3
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov92_0225DDD8

	thumb_func_start ov92_0225DE08
ov92_0225DE08: @ 0x0225DE08
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	ldr r1, [r0, #0x14]
	str r0, [sp, #8]
	ldr r0, [r1, #8]
	movs r6, #0
	ldr r7, [r1, #0xc]
	ldr r5, [sp, #8]
	str r0, [sp, #0xc]
	adds r4, r6, #0
_0225DE1C:
	movs r0, #3
	str r0, [sp]
	ldr r0, _0225DE6C @ =0x0000232E
	lsls r1, r4, #0x10
	str r0, [sp, #4]
	add r0, sp, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x14
	movs r3, #1
	bl ov92_0225DDD8
	ldr r0, [sp, #0xc]
	adds r1, r7, #0
	add r2, sp, #0x10
	bl FUN_0200D734
	movs r1, #3
	str r0, [r5, #0x40]
	bl FUN_0200DD24
	adds r0, r6, #0
	movs r1, #0xb
	blx FUN_020F2998
	ldr r0, [r5, #0x40]
	adds r1, r1, #1
	bl FUN_0200DC4C
	adds r6, r6, #1
	adds r4, #8
	adds r5, r5, #4
	cmp r6, #0x24
	blt _0225DE1C
	movs r1, #0
	ldr r0, [sp, #8]
	adds r2, r1, #0
	bl ov92_0225DF0C
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225DE6C: .4byte 0x0000232E
	thumb_func_end ov92_0225DE08

	thumb_func_start ov92_0225DE70
ov92_0225DE70: @ 0x0225DE70
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r5, r0, #0
	ldr r1, [r5, #0x14]
	add r4, sp, #0xc
	ldr r0, [r1, #8]
	ldr r7, [r1, #0xc]
	ldr r1, _0225DEE8 @ =0x02263B54
	str r0, [sp, #8]
	ldrh r2, [r1]
	add r0, sp, #0xc
	movs r6, #0
	strh r2, [r0]
	ldrh r2, [r1, #2]
	strh r2, [r0, #2]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
_0225DE96:
	movs r0, #1
	str r0, [sp]
	ldr r0, _0225DEEC @ =0x0000232C
	movs r1, #0
	str r0, [sp, #4]
	ldrsh r1, [r4, r1]
	add r0, sp, #0x14
	movs r2, #0xe0
	movs r3, #1
	bl ov92_0225DDD8
	movs r0, #0
	str r0, [sp, #0x40]
	movs r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	add r2, sp, #0x14
	bl FUN_0200D734
	adds r1, r5, #0
	adds r1, #0xd0
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl FUN_0200DC24
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DD24
	adds r6, r6, #1
	adds r4, r4, #2
	adds r5, r5, #4
	cmp r6, #4
	blt _0225DE96
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225DEE8: .4byte 0x02263B54
_0225DEEC: .4byte 0x0000232C
	thumb_func_end ov92_0225DE70

	thumb_func_start ov92_0225DEF0
ov92_0225DEF0: @ 0x0225DEF0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0225DEF6:
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0225DEF6
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov92_0225DEF0

	thumb_func_start ov92_0225DF0C
ov92_0225DF0C: @ 0x0225DF0C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
_0225DF14:
	ldr r0, [r5, #0x40]
	adds r1, r6, #0
	bl FUN_0200DCE8
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x24
	blt _0225DF14
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov92_0225DF0C

	thumb_func_start ov92_0225DF28
ov92_0225DF28: @ 0x0225DF28
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0225DF2E:
	ldr r0, [r5, #0x40]
	bl FUN_0200DC24
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x24
	blt _0225DF2E
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov92_0225DF28

	thumb_func_start ov92_0225DF40
ov92_0225DF40: @ 0x0225DF40
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0225DF46:
	ldr r0, [r5, #0x40]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x24
	blt _0225DF46
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov92_0225DF40

	thumb_func_start ov92_0225DF58
ov92_0225DF58: @ 0x0225DF58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r4, _0225DFA0 @ =0x02263BCC
	adds r6, r2, #0
	add r2, sp, #0
	adds r5, r0, #0
	adds r3, r1, #0
	adds r7, r2, #0
	ldm r4!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r2!, {r0, r1}
	lsls r0, r3, #1
	adds r0, r5, r0
	adds r0, #0xf4
	lsls r4, r6, #3
	ldrh r0, [r0]
	ldr r1, [r7, r4]
	lsls r6, r0, #2
	adds r0, r5, r6
	ldr r0, [r0, #0x1c]
	bl FUN_0200DC4C
	adds r0, r5, r6
	add r1, sp, #4
	ldr r0, [r0, #0x28]
	ldr r1, [r1, r4]
	bl FUN_0200DC4C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225DFA0: .4byte 0x02263BCC
	thumb_func_end ov92_0225DF58

	thumb_func_start ov92_0225DFA4
ov92_0225DFA4: @ 0x0225DFA4
	push {r4, r5, r6, lr}
	sub sp, #0x20
	ldr r3, _0225E004 @ =0x02263B8C
	add r2, sp, #0
	adds r5, r0, #0
	adds r4, r1, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	lsls r0, r4, #1
	adds r0, r5, r0
	adds r0, #0xf4
	ldrh r0, [r0]
	lsls r6, r0, #2
	adds r0, r5, r6
	ldr r0, [r0, #0x1c]
	bl FUN_0200DC64
	adds r4, r0, #0
	adds r0, r5, r6
	ldr r0, [r0, #0x28]
	bl FUN_0200DC64
	movs r2, #0
	add r3, sp, #0
_0225DFE0:
	ldr r1, [r3]
	cmp r4, r1
	bne _0225DFF2
	ldr r1, [r3, #4]
	cmp r0, r1
	bne _0225DFF2
	add sp, #0x20
	adds r0, r2, #0
	pop {r4, r5, r6, pc}
_0225DFF2:
	adds r2, r2, #1
	adds r3, #8
	cmp r2, #4
	blt _0225DFE0
	bl GF_AssertFail
	movs r0, #0
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225E004: .4byte 0x02263B8C
	thumb_func_end ov92_0225DFA4

	thumb_func_start ov92_0225E008
ov92_0225E008: @ 0x0225E008
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #4]
	movs r4, #0
	cmp r0, #0
	ble _0225E038
	adds r5, r6, #0
_0225E016:
	ldr r0, [r6]
	cmp r4, r0
	beq _0225E030
	ldr r0, [r5, #0x1c]
	bl FUN_0200DC24
	ldr r0, [r5, #0x28]
	bl FUN_0200DC24
	ldr r0, [r5, #0x34]
	bl FUN_0200DC24
	adds r5, r5, #4
_0225E030:
	ldr r0, [r6, #4]
	adds r4, r4, #1
	cmp r4, r0
	blt _0225E016
_0225E038:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov92_0225E008

	thumb_func_start ov92_0225E03C
ov92_0225E03C: @ 0x0225E03C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #4]
	movs r4, #0
	cmp r0, #0
	ble _0225E06C
	adds r5, r6, #0
_0225E04A:
	ldr r0, [r6]
	cmp r4, r0
	beq _0225E064
	ldr r0, [r5, #0x1c]
	bl FUN_0200D9DC
	ldr r0, [r5, #0x28]
	bl FUN_0200D9DC
	ldr r0, [r5, #0x34]
	bl FUN_0200D9DC
	adds r5, r5, #4
_0225E064:
	ldr r0, [r6, #4]
	adds r4, r4, #1
	cmp r4, r0
	blt _0225E04A
_0225E06C:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov92_0225E03C

	thumb_func_start ov92_0225E070
ov92_0225E070: @ 0x0225E070
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, _0225E0FC @ =0x00001FE0
	adds r0, r5, r0
	bl FUN_0201D3C4
	movs r1, #0x13
	str r1, [sp]
	movs r0, #0x1c
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	lsls r0, r1, #4
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x14]
	ldr r1, _0225E0FC @ =0x00001FE0
	ldr r0, [r0, #0x10]
	adds r1, r5, r1
	movs r2, #7
	movs r3, #2
	bl FUN_0201D40C
	ldr r0, _0225E0FC @ =0x00001FE0
	movs r1, #0xff
	adds r0, r5, r0
	bl FUN_0201D978
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xeb
	movs r3, #0x71
	bl FUN_0200BAF8
	movs r1, #0
	adds r6, r0, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r1, #0
	ldr r0, _0225E0FC @ =0x00001FE0
	str r1, [sp]
	str r1, [sp, #4]
	adds r0, r5, r0
	adds r2, r4, #0
	adds r3, r1, #0
	str r1, [sp, #8]
	bl FUN_020200A8
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_0200BB44
	ldr r0, _0225E0FC @ =0x00001FE0
	movs r1, #0
	adds r0, r5, r0
	movs r2, #0xb4
	movs r3, #0xd
	bl FUN_0200E580
	ldr r0, _0225E0FC @ =0x00001FE0
	adds r0, r5, r0
	bl FUN_0201D578
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0225E0FC: .4byte 0x00001FE0
	thumb_func_end ov92_0225E070

	thumb_func_start ov92_0225E100
ov92_0225E100: @ 0x0225E100
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0225E12C @ =0x00001FE0
	adds r0, r4, r0
	bl FUN_0201D3F0
	cmp r0, #1
	bne _0225E12A
	ldr r0, _0225E12C @ =0x00001FE0
	movs r1, #1
	adds r0, r4, r0
	bl FUN_0200E5D4
	ldr r0, _0225E12C @ =0x00001FE0
	adds r0, r4, r0
	bl FUN_0201D8C8
	ldr r0, _0225E12C @ =0x00001FE0
	adds r0, r4, r0
	bl FUN_0201D520
_0225E12A:
	pop {r4, pc}
	.align 2, 0
_0225E12C: .4byte 0x00001FE0
	thumb_func_end ov92_0225E100

	thumb_func_start ov92_0225E130
ov92_0225E130: @ 0x0225E130
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r0, [r7, #0x5c]
	movs r4, #0
	str r0, [sp, #0x10]
	movs r0, #0x14
	ldr r2, _0225E184 @ =0x02264020
	muls r0, r1, r0
	adds r5, r4, #0
	adds r6, r2, r0
_0225E146:
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	adds r0, r4, #1
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r7, #4]
	movs r2, #0x49
	ldr r1, [r0, #4]
	movs r0, #0x50
	muls r0, r1, r0
	adds r0, r6, r0
	adds r0, r5, r0
	subs r0, #0x4c
	ldr r0, [r0]
	movs r1, #0xc1
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	movs r3, #0x71
	bl FUN_0200319C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0225E146
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225E184: .4byte 0x02264020
	thumb_func_end ov92_0225E130

	thumb_func_start ov92_0225E188
ov92_0225E188: @ 0x0225E188
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	adds r2, r0, #0
	bl FUN_02002F30
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r1, r0, r4
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov92_0225E188

	thumb_func_start ov92_0225E1A8
ov92_0225E1A8: @ 0x0225E1A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	str r0, [sp, #0x18]
	movs r0, #1
	lsls r0, r0, #8
	adds r5, r1, #0
	ldr r3, _0225E350 @ =0x02263BEC
	str r0, [sp, #0x24]
	add r2, sp, #0x34
	movs r1, #0x24
_0225E1BC:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _0225E1BC
	ldr r0, [r5, #4]
	cmp r0, #2
	beq _0225E1D8
	cmp r0, #3
	beq _0225E1F4
	cmp r0, #4
	beq _0225E210
	b _0225E22C
_0225E1D8:
	ldr r2, [r5, #0x14]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	ldr r0, [r2]
	ldr r2, [r2, #0x10]
	movs r1, #0x4f
	movs r3, #7
	bl FUN_02007B68
	b _0225E230
_0225E1F4:
	ldr r2, [r5, #0x14]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	ldr r0, [r2]
	ldr r2, [r2, #0x10]
	movs r1, #0x50
	movs r3, #7
	bl FUN_02007B68
	b _0225E230
_0225E210:
	ldr r2, [r5, #0x14]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	ldr r0, [r2]
	ldr r2, [r2, #0x10]
	movs r1, #0x51
	movs r3, #7
	bl FUN_02007B68
	b _0225E230
_0225E22C:
	bl GF_AssertFail
_0225E230:
	ldr r0, [r5, #4]
	movs r6, #0
	cmp r0, #0
	bgt _0225E23A
	b _0225E34C
_0225E23A:
	ldr r0, _0225E354 @ =0x00001FF0
	str r6, [sp, #0x1c]
	adds r4, r5, r0
	ldr r0, [sp, #0x18]
	adds r0, #0x8c
	str r0, [sp, #0x18]
_0225E246:
	ldr r0, [r5]
	cmp r6, r0
	beq _0225E342
	ldr r0, [sp, #0x18]
	adds r1, r6, #0
	bl FUN_022588A4
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x18]
	adds r1, r6, #0
	bl FUN_022588CC
	str r0, [sp, #0x2c]
	adds r0, r4, #0
	bl FUN_0201D3C4
	ldr r1, [r5, #4]
	movs r0, #0x18
	adds r2, r1, #0
	muls r2, r0, r2
	add r0, sp, #0x34
	adds r1, r0, r2
	ldr r0, [sp, #0x1c]
	movs r2, #7
	adds r7, r1, r0
	movs r0, #0x2b
	mvns r0, r0
	ldrsh r0, [r7, r0]
	adds r3, r2, #0
	subs r3, #0x37
	str r0, [sp, #0x20]
	movs r0, #0x29
	mvns r0, r0
	ldrsh r0, [r7, r0]
	adds r1, r4, #0
	str r0, [sp, #0x30]
	movs r0, #0x2d
	mvns r0, r0
	ldrsh r0, [r7, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrsh r3, [r7, r3]
	ldr r0, [r5, #0x14]
	lsls r3, r3, #0x18
	ldr r0, [r0, #0x10]
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x30]
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x24]
	movs r1, #0xff
	adds r0, r0, r2
	str r0, [sp, #0x24]
	adds r0, r4, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x2c]
	movs r1, #0x71
	bl FUN_02028F68
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov92_0225E188
	adds r3, r0, #0
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _0225E312
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0225E358 @ =0x0005060F
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r2, r7, #0
	bl FUN_02020150
	b _0225E32E
_0225E312:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0225E35C @ =0x0001020F
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r2, r7, #0
	bl FUN_02020150
_0225E32E:
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0201D578
	ldr r0, [sp, #0x1c]
	adds r4, #0x10
	adds r0, #8
	str r0, [sp, #0x1c]
_0225E342:
	ldr r0, [r5, #4]
	adds r6, r6, #1
	cmp r6, r0
	bge _0225E34C
	b _0225E246
_0225E34C:
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225E350: .4byte 0x02263BEC
_0225E354: .4byte 0x00001FF0
_0225E358: .4byte 0x0005060F
_0225E35C: .4byte 0x0001020F
	thumb_func_end ov92_0225E1A8

	thumb_func_start ov92_0225E360
ov92_0225E360: @ 0x0225E360
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, [r6, #4]
	movs r4, #0
	cmp r0, #0
	ble _0225E3A2
	ldr r0, _0225E3C0 @ =0x00001FF0
	movs r7, #1
	adds r5, r6, r0
_0225E374:
	ldr r0, [r6]
	cmp r4, r0
	beq _0225E39A
	adds r0, r5, #0
	bl FUN_0201D3F0
	cmp r0, #1
	bne _0225E398
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_0200E5D4
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
_0225E398:
	adds r5, #0x10
_0225E39A:
	ldr r0, [r6, #4]
	adds r4, r4, #1
	cmp r4, r0
	blt _0225E374
_0225E3A2:
	ldr r2, [r6, #0x14]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	ldr r0, [r2]
	ldr r2, [r2, #0x10]
	movs r1, #0x4e
	movs r3, #7
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E3C0: .4byte 0x00001FF0
	thumb_func_end ov92_0225E360

	thumb_func_start ov92_0225E3C4
ov92_0225E3C4: @ 0x0225E3C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r4, [r0, #0x48]
	ldr r5, [r0, #0x54]
	ldr r6, [r0, #0x50]
	ldr r7, [r0, #0x5c]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _0225E688 @ =0x00002328
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x54
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E688 @ =0x00002328
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x53
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E688 @ =0x00002328
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x52
	bl FUN_0200D71C
	str r4, [sp]
	movs r0, #0x55
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	ldr r0, _0225E688 @ =0x00002328
	movs r1, #3
	str r0, [sp, #0x14]
	adds r0, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl FUN_0200D68C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225E68C @ =0x0000232B
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x1d
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E68C @ =0x0000232B
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x1c
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E68C @ =0x0000232B
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x1b
	bl FUN_0200D71C
	str r4, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225E68C @ =0x0000232B
	movs r1, #2
	str r0, [sp, #0x14]
	adds r0, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl FUN_0200D68C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225E690 @ =0x0000232C
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0xd
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E690 @ =0x0000232C
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0xc
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E690 @ =0x0000232C
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0xb
	bl FUN_0200D71C
	str r4, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225E690 @ =0x0000232C
	movs r1, #2
	str r0, [sp, #0x14]
	adds r0, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl FUN_0200D68C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225E694 @ =0x0000232D
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x15
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E694 @ =0x0000232D
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x14
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E694 @ =0x0000232D
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x13
	bl FUN_0200D71C
	str r4, [sp]
	movs r0, #0x16
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225E694 @ =0x0000232D
	movs r1, #2
	str r0, [sp, #0x14]
	adds r0, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl FUN_0200D68C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225E698 @ =0x0000232E
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x11
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E698 @ =0x0000232E
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x10
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E698 @ =0x0000232E
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0xf
	bl FUN_0200D71C
	str r4, [sp]
	movs r0, #0x12
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225E698 @ =0x0000232E
	movs r1, #2
	str r0, [sp, #0x14]
	adds r0, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl FUN_0200D68C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225E69C @ =0x0000232A
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x19
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E69C @ =0x0000232A
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x18
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E69C @ =0x0000232A
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x17
	bl FUN_0200D71C
	str r4, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r0, _0225E69C @ =0x0000232A
	movs r1, #2
	str r0, [sp, #0x14]
	adds r0, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl FUN_0200D68C
	movs r0, #0xc8
	movs r1, #0x71
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225E6A0 @ =0x0000232F
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x15
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E6A0 @ =0x0000232F
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x16
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E6A0 @ =0x0000232F
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x17
	bl FUN_0200D71C
	str r4, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r0, _0225E6A0 @ =0x0000232F
	adds r2, r6, #0
	str r0, [sp, #0x14]
	adds r0, r7, #0
	adds r3, r5, #0
	bl FUN_0200D68C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E688: .4byte 0x00002328
_0225E68C: .4byte 0x0000232B
_0225E690: .4byte 0x0000232C
_0225E694: .4byte 0x0000232D
_0225E698: .4byte 0x0000232E
_0225E69C: .4byte 0x0000232A
_0225E6A0: .4byte 0x0000232F
	thumb_func_end ov92_0225E3C4

	thumb_func_start ov92_0225E6A4
ov92_0225E6A4: @ 0x0225E6A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	adds r6, r1, #0
	ldr r1, [r6, #0x14]
	str r0, [sp, #8]
	ldr r0, [r1, #8]
	movs r4, #0
	str r0, [sp, #0x18]
	ldr r0, [r1, #0xc]
	str r4, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [r6, #4]
	cmp r0, #0
	bgt _0225E6C2
	b _0225E7D8
_0225E6C2:
	str r6, [sp, #0xc]
	adds r7, r4, #0
	adds r5, r6, #0
_0225E6C8:
	ldr r1, [sp, #0xc]
	movs r0, #0xff
	adds r1, #0xf4
	strh r0, [r1]
	ldr r0, [r6]
	cmp r4, r0
	beq _0225E7C8
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r1, #0xf4
	strh r0, [r1]
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E7DC @ =0x00002328
	movs r2, #6
	str r0, [sp, #4]
	ldr r1, [r6, #4]
	add r0, sp, #0x1c
	muls r2, r1, r2
	ldr r1, _0225E7E0 @ =0x02263B74
	movs r3, #2
	adds r1, r1, r2
	adds r2, r7, r1
	movs r1, #5
	mvns r1, r1
	ldrsh r1, [r2, r1]
	movs r2, #0xf0
	bl ov92_0225DDD8
	movs r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x1c
	bl FUN_0200D734
	str r0, [r5, #0x1c]
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E7DC @ =0x00002328
	movs r2, #6
	str r0, [sp, #4]
	ldr r1, [r6, #4]
	add r0, sp, #0x1c
	muls r2, r1, r2
	ldr r1, _0225E7E0 @ =0x02263B74
	movs r3, #2
	adds r1, r1, r2
	adds r2, r7, r1
	movs r1, #5
	mvns r1, r1
	ldrsh r1, [r2, r1]
	movs r2, #0xf0
	bl ov92_0225DDD8
	movs r0, #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x1c
	bl FUN_0200D734
	str r0, [r5, #0x28]
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl ov92_0226077C
	adds r1, r0, #0
	ldr r0, [r5, #0x28]
	bl FUN_0200DD24
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E7DC @ =0x00002328
	movs r2, #6
	str r0, [sp, #4]
	ldr r1, [r6, #4]
	add r0, sp, #0x1c
	muls r2, r1, r2
	ldr r1, _0225E7E0 @ =0x02263B74
	movs r3, #2
	adds r1, r1, r2
	adds r2, r7, r1
	movs r1, #5
	mvns r1, r1
	ldrsh r1, [r2, r1]
	movs r2, #0xf0
	bl ov92_0225DDD8
	movs r0, #3
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x1c
	bl FUN_0200D734
	str r0, [r5, #0x34]
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl ov92_0226077C
	adds r1, r0, #0
	ldr r0, [r5, #0x34]
	bl FUN_0200DD24
	ldr r0, [r5, #0x34]
	movs r1, #5
	bl FUN_0200DC4C
	ldr r0, [r5, #0x1c]
	bl FUN_0200DC24
	ldr r0, [r5, #0x28]
	bl FUN_0200DC24
	ldr r0, [r5, #0x34]
	bl FUN_0200DC24
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov92_0225DF58
	ldr r0, [sp, #0x10]
	adds r7, r7, #2
	adds r0, r0, #1
	adds r5, r5, #4
	str r0, [sp, #0x10]
_0225E7C8:
	ldr r0, [sp, #0xc]
	adds r4, r4, #1
	adds r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [r6, #4]
	cmp r4, r0
	bge _0225E7D8
	b _0225E6C8
_0225E7D8:
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E7DC: .4byte 0x00002328
_0225E7E0: .4byte 0x02263B74
	thumb_func_end ov92_0225E6A4

	thumb_func_start ov92_0225E7E4
ov92_0225E7E4: @ 0x0225E7E4
	push {r4, r5, lr}
	sub sp, #0x3c
	ldr r0, [r0, #0x14]
	movs r3, #1
	ldr r4, [r0, #8]
	ldr r5, [r0, #0xc]
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E81C @ =0x0000232B
	str r0, [sp, #4]
	add r0, sp, #8
	bl ov92_0225DDD8
	movs r0, #0
	str r0, [sp, #0x34]
	str r0, [sp, #0x10]
	adds r0, r4, #0
	adds r1, r5, #0
	add r2, sp, #8
	bl FUN_0200D734
	adds r4, r0, #0
	bl FUN_0200DC24
	adds r0, r4, #0
	add sp, #0x3c
	pop {r4, r5, pc}
	nop
_0225E81C: .4byte 0x0000232B
	thumb_func_end ov92_0225E7E4

	thumb_func_start ov92_0225E820
ov92_0225E820: @ 0x0225E820
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	add r7, sp, #0xc
	ldr r6, [r0, #8]
	ldr r4, [r0, #0xc]
	movs r0, #0
	str r0, [sp, #8]
_0225E832:
	movs r0, #4
	str r0, [sp]
	ldr r0, _0225E910 @ =0x0000232A
	movs r1, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r2, r1, #0
	movs r3, #1
	bl ov92_0225DDD8
	movs r0, #2
	str r0, [sp, #0x38]
	movs r0, #0x14
	str r0, [sp, #0x14]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0200D734
	adds r1, r5, #0
	adds r1, #0xe8
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DC4C
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_0200DC18
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #4
	bl FUN_0200DD24
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200E0FC
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0
	str r0, [sp]
	ldr r0, _0225E914 @ =0x00002328
	movs r1, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r2, r1, #0
	movs r3, #2
	bl ov92_0225DDD8
	movs r0, #2
	str r0, [sp, #0x38]
	movs r0, #0x14
	str r0, [sp, #0x14]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0200D734
	adds r1, r5, #0
	adds r1, #0xe0
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r0, [r0]
	movs r1, #6
	bl FUN_0200DC4C
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r0, [r0]
	bl FUN_0200DC18
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DD24
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200E0FC
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [sp, #8]
	adds r5, r5, #4
	adds r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #2
	blt _0225E832
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E910: .4byte 0x0000232A
_0225E914: .4byte 0x00002328
	thumb_func_end ov92_0225E820

	thumb_func_start ov92_0225E918
ov92_0225E918: @ 0x0225E918
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0225E91E:
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_0200D9DC
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r0, [r0]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _0225E91E
	pop {r3, r4, r5, pc}
	thumb_func_end ov92_0225E918

	thumb_func_start ov92_0225E93C
ov92_0225E93C: @ 0x0225E93C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x3c
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	movs r1, #0x80
	ldr r6, [r0, #8]
	ldr r4, [r0, #0xc]
	movs r0, #7
	str r0, [sp]
	ldr r0, _0225E9A4 @ =0x0000232F
	adds r2, r1, #0
	str r0, [sp, #4]
	add r0, sp, #8
	movs r3, #1
	bl ov92_0225DDD8
	movs r0, #0
	str r0, [sp, #0x34]
	str r0, [sp, #0x10]
	adds r0, r6, #0
	adds r1, r4, #0
	add r2, sp, #8
	bl FUN_0200D734
	adds r1, r5, #0
	adds r1, #0xf0
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xf0
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DC4C
	adds r0, r5, #0
	adds r0, #0xf0
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DCE8
	adds r0, r5, #0
	adds r0, #0xf0
	ldr r0, [r0]
	bl FUN_0200DC18
	adds r5, #0xf0
	ldr r0, [r5]
	movs r1, #7
	bl FUN_0200DD24
	add sp, #0x3c
	pop {r3, r4, r5, r6, pc}
	nop
_0225E9A4: .4byte 0x0000232F
	thumb_func_end ov92_0225E93C

	thumb_func_start ov92_0225E9A8
ov92_0225E9A8: @ 0x0225E9A8
	ldr r3, _0225E9B0 @ =FUN_0200D9DC
	adds r0, #0xf0
	ldr r0, [r0]
	bx r3
	.align 2, 0
_0225E9B0: .4byte FUN_0200D9DC
	thumb_func_end ov92_0225E9A8

	thumb_func_start ov92_0225E9B4
ov92_0225E9B4: @ 0x0225E9B4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, [r0, #0x58]
	ldr r4, [r0, #0x48]
	ldr r6, [r0, #0x5c]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x48
	adds r2, r5, #0
	movs r3, #4
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x4b
	adds r2, r5, #0
	movs r3, #5
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x4a
	adds r2, r5, #0
	movs r3, #4
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x4c
	adds r2, r5, #0
	movs r3, #5
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x4d
	adds r2, r5, #0
	movs r3, #6
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x4e
	adds r2, r5, #0
	movs r3, #7
	bl FUN_02007B68
	movs r0, #1
	str r0, [sp]
	movs r0, #0xa0
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #0xc1
	movs r2, #0x49
	movs r3, #0x71
	bl FUN_02003200
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #5
	adds r2, r5, #0
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #8
	adds r2, r5, #0
	movs r3, #1
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #7
	adds r2, r5, #0
	movs r3, #3
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #9
	adds r2, r5, #0
	movs r3, #1
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x71
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xa
	adds r2, r5, #0
	movs r3, #2
	bl FUN_02007B68
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r6, #0
	movs r1, #0xc1
	movs r2, #6
	movs r3, #0x71
	bl FUN_02003200
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xe0
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #0x10
	movs r2, #8
	movs r3, #0x71
	bl FUN_02003200
	bl FUN_0200E3D8
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xd0
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #0x26
	movs r3, #0x71
	bl FUN_02003200
	movs r0, #0
	str r0, [sp]
	movs r0, #0x71
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #7
	movs r2, #0xb4
	movs r3, #0xd
	bl FUN_0200E3DC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov92_0225E9B4

	thumb_func_start ov92_0225EB40
ov92_0225EB40: @ 0x0225EB40
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x71
	movs r1, #0x10
	bl FUN_0201AA8C
	adds r3, r0, #0
	movs r2, #0x10
	movs r1, #0
_0225EB54:
	strb r1, [r3]
	adds r3, r3, #1
	subs r2, r2, #1
	bne _0225EB54
	movs r1, #0x4b
	str r5, [r0, #4]
	lsls r1, r1, #4
	strh r1, [r0, #8]
	str r4, [r0, #0xc]
	pop {r3, r4, r5, pc}
	thumb_func_end ov92_0225EB40

	thumb_func_start ov92_0225EB68
ov92_0225EB68: @ 0x0225EB68
	ldr r3, _0225EB6C @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_0225EB6C: .4byte FUN_0201AB0C
	thumb_func_end ov92_0225EB68

	thumb_func_start ov92_0225EB70
ov92_0225EB70: @ 0x0225EB70
	movs r1, #8
	ldrsh r2, [r0, r1]
	subs r2, r2, #1
	strh r2, [r0, #8]
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _0225EB82
	movs r0, #1
	bx lr
_0225EB82:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov92_0225EB70

	thumb_func_start ov92_0225EB88
ov92_0225EB88: @ 0x0225EB88
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r1, _0225EBD4 @ =0x00002BBC
	movs r0, #0x71
	adds r7, r2, #0
	bl FUN_0201AA8C
	ldr r2, _0225EBD4 @ =0x00002BBC
	adds r4, r0, #0
	movs r1, #0
	blx FUN_020E5B44
	str r5, [r4, #4]
	ldr r3, _0225EBD8 @ =0x00002BB8
	str r6, [r4]
	movs r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	str r7, [r4, #0x14]
	adds r1, r3, #0
	str r0, [r4, r3]
	subs r1, #0xcc
	ldr r2, [r4, r1]
	ldr r1, _0225EBDC @ =0x00002228
	str r2, [r4, r1]
	adds r2, r3, #0
	subs r2, #0xcc
	adds r2, r4, r2
	adds r1, r1, #4
	str r2, [r4, r1]
	subs r3, #0x24
	str r0, [r4, r3]
	adds r0, r4, #0
	bl ov92_0225EBE0
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225EBD4: .4byte 0x00002BBC
_0225EBD8: .4byte 0x00002BB8
_0225EBDC: .4byte 0x00002228
	thumb_func_end ov92_0225EB88

	thumb_func_start ov92_0225EBE0
ov92_0225EBE0: @ 0x0225EBE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r2, _0225ED44 @ =0x00001FC8
	adds r7, r0, #0
	movs r0, #0
	movs r3, #0x19
	str r0, [r7, r2]
	adds r1, r2, #4
	lsls r3, r3, #0xe
	str r3, [r7, r1]
	adds r2, #8
	movs r3, #0x31
	ldr r1, _0225ED48 @ =0x0000051C
	str r0, [r7, r2]
	str r0, [r7, r1]
	adds r2, r1, #4
	str r0, [r7, r2]
	lsls r3, r3, #4
	str r0, [r7, r3]
	adds r2, r3, #4
	str r0, [r7, r2]
	subs r1, r1, #4
	str r0, [r7, r1]
	subs r1, r3, #4
	subs r3, #0x6c
	str r0, [r7, r1]
	adds r0, r7, r3
	bl ov92_022630E8
	movs r0, #0xad
	lsls r0, r0, #2
	adds r0, r7, r0
	bl ov92_022630E8
	movs r0, #0x4b
	lsls r0, r0, #4
	adds r0, r7, r0
	bl ov92_022630E8
	movs r0, #0x13
	lsls r0, r0, #6
	adds r0, r7, r0
	bl ov92_022630E8
	ldr r0, _0225ED4C @ =0x00000AD4
	adds r0, r7, r0
	bl ov92_022630E8
	ldr r0, _0225ED50 @ =0x00000AE4
	adds r0, r7, r0
	bl ov92_022630E8
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xce
	lsls r0, r0, #4
	adds r6, r7, r0
	adds r0, #0x10
	adds r4, r7, r0
	movs r0, #0xb5
	lsls r0, r0, #4
	adds r5, r7, r0
_0225EC5C:
	adds r0, r6, #0
	bl ov92_022630E8
	adds r0, r4, #0
	bl ov92_022630E8
	movs r0, #5
	str r0, [sp]
	ldr r0, _0225ED54 @ =0x3F4CCCCD
	movs r1, #0
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #5
	bl ov92_02260428
	movs r1, #0
	movs r0, #4
	mvns r0, r0
	str r0, [sp]
	ldr r0, _0225ED54 @ =0x3F4CCCCD
	adds r2, r1, #0
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	subs r3, r1, #5
	bl ov92_02260428
	movs r0, #0x83
	lsls r0, r0, #2
	adds r6, r6, r0
	adds r4, r4, r0
	adds r5, r5, r0
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #8
	blt _0225EC5C
	movs r3, #5
	ldr r0, _0225ED58 @ =0x3FF0A3D7
	str r3, [sp]
	str r0, [sp, #4]
	movs r1, #0
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	movs r3, #4
	mvns r3, r3
	movs r1, #0
	ldr r0, _0225ED58 @ =0x3FF0A3D7
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	movs r3, #5
	movs r1, #0
	ldr r0, _0225ED54 @ =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r7, r0
	adds r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	movs r3, #4
	mvns r3, r3
	movs r1, #0
	ldr r0, _0225ED54 @ =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r7, r0
	adds r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	movs r3, #5
	movs r1, #0
	ldr r0, _0225ED58 @ =0x3FF0A3D7
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0225ED5C @ =0x00000944
	adds r2, r1, #0
	adds r0, r7, r0
	str r1, [sp, #8]
	bl ov92_02260428
	movs r3, #4
	mvns r3, r3
	movs r1, #0
	ldr r0, _0225ED54 @ =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0225ED5C @ =0x00000944
	adds r2, r1, #0
	adds r0, r7, r0
	str r1, [sp, #8]
	bl ov92_02260428
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225ED44: .4byte 0x00001FC8
_0225ED48: .4byte 0x0000051C
_0225ED4C: .4byte 0x00000AD4
_0225ED50: .4byte 0x00000AE4
_0225ED54: .4byte 0x3F4CCCCD
_0225ED58: .4byte 0x3FF0A3D7
_0225ED5C: .4byte 0x00000944
	thumb_func_end ov92_0225EBE0

	thumb_func_start ov92_0225ED60
ov92_0225ED60: @ 0x0225ED60
	ldr r3, _0225ED64 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_0225ED64: .4byte FUN_0201AB0C
	thumb_func_end ov92_0225ED60

	thumb_func_start ov92_0225ED68
ov92_0225ED68: @ 0x0225ED68
	ldr r1, _0225ED7C @ =0x00001FCC
	ldr r0, [r0, r1]
	asrs r0, r0, #0xc
	cmp r0, #0x2d
	bgt _0225ED76
	movs r0, #1
	bx lr
_0225ED76:
	movs r0, #0
	bx lr
	nop
_0225ED7C: .4byte 0x00001FCC
	thumb_func_end ov92_0225ED68

	thumb_func_start ov92_0225ED80
ov92_0225ED80: @ 0x0225ED80
	push {r3, lr}
	ldr r1, _0225EDB0 @ =0x00001FCC
	ldr r1, [r0, r1]
	asrs r1, r1, #0xc
	cmp r1, #0x4b
	bge _0225ED98
	cmp r1, #0x3d
	ble _0225ED98
	movs r1, #1
	bl ov92_0225DD48
	pop {r3, pc}
_0225ED98:
	cmp r1, #0x3c
	bge _0225EDA8
	cmp r1, #0x2e
	ble _0225EDA8
	movs r1, #2
	bl ov92_0225DD48
	pop {r3, pc}
_0225EDA8:
	movs r1, #0
	bl ov92_0225DD48
	pop {r3, pc}
	.align 2, 0
_0225EDB0: .4byte 0x00001FCC
	thumb_func_end ov92_0225ED80

	thumb_func_start ov92_0225EDB4
ov92_0225EDB4: @ 0x0225EDB4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x71
	movs r1, #0x30
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x30
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r1, r5, #0
	adds r1, #0xf4
	lsls r0, r6, #1
	ldrh r2, [r1, r0]
	lsls r2, r2, #2
	adds r2, r5, r2
	ldr r2, [r2, #0x1c]
	str r2, [r4, #0xc]
	ldrh r0, [r1, r0]
	movs r2, #1
	adds r1, r4, #0
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x28]
	lsls r2, r2, #0xc
	str r0, [r4, #0x10]
	movs r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	ldr r0, [r5, #0x14]
	str r0, [r4, #0x2c]
	ldr r0, _0225EE00 @ =ov92_0225F254
	bl FUN_0200E320
	pop {r4, r5, r6, pc}
	nop
_0225EE00: .4byte ov92_0225F254
	thumb_func_end ov92_0225EDB4

	thumb_func_start ov92_0225EE04
ov92_0225EE04: @ 0x0225EE04
	push {r3, r4, r5, lr}
	ldr r2, _0225EE54 @ =0x000029D0
	adds r3, r0, r2
	movs r2, #0x44
	muls r2, r1, r2
	adds r3, r3, r2
	ldr r2, [r3, #0x30]
	cmp r2, #1
	beq _0225EE52
	ldr r4, _0225EE58 @ =0x00002BB4
	ldr r2, [r0, r4]
	subs r4, #0xac
	str r2, [r3, #0x40]
	movs r2, #1
	adds r5, r0, r4
	lsls r4, r1, #2
	str r2, [r3, #0x30]
	adds r4, r5, r4
	str r4, [r3, #0x2c]
	ldr r4, [r4]
	lsls r1, r1, #1
	adds r1, r0, r1
	str r4, [r3, #0x28]
	adds r1, #0xf4
	ldrh r1, [r1]
	lsls r2, r2, #0xc
	lsls r1, r1, #2
	adds r1, r0, r1
	ldr r1, [r1, #0x34]
	str r1, [r3, #0xc]
	movs r1, #0
	str r1, [r3]
	str r1, [r3, #4]
	ldr r0, [r0, #0x14]
	adds r1, r3, #0
	str r0, [r3, #0x3c]
	ldr r0, _0225EE5C @ =ov92_0225F338
	bl FUN_0200E320
_0225EE52:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225EE54: .4byte 0x000029D0
_0225EE58: .4byte 0x00002BB4
_0225EE5C: .4byte ov92_0225F338
	thumb_func_end ov92_0225EE04

	thumb_func_start ov92_0225EE60
ov92_0225EE60: @ 0x0225EE60
	push {r3, lr}
	ldr r2, _0225EEA8 @ =0x000029D0
	adds r3, r0, r2
	movs r2, #0x44
	muls r2, r1, r2
	adds r1, r3, r2
	ldr r2, [r1, #0x30]
	cmp r2, #1
	beq _0225EEA4
	ldr r3, _0225EEAC @ =0x00002BB4
	ldr r2, [r0, r3]
	subs r3, #0xc8
	str r2, [r1, #0x40]
	movs r2, #1
	str r2, [r1, #0x30]
	adds r3, r0, r3
	str r3, [r1, #0x2c]
	ldr r3, [r3]
	lsls r2, r2, #0xc
	str r3, [r1, #0x28]
	ldr r3, _0225EEB0 @ =0x00001BB0
	adds r3, r0, r3
	str r3, [r1, #0x34]
	ldr r3, _0225EEB4 @ =0x00001DBC
	adds r3, r0, r3
	str r3, [r1, #0x38]
	movs r3, #0
	str r3, [r1]
	str r3, [r1, #4]
	ldr r0, [r0, #0x14]
	str r0, [r1, #0x3c]
	ldr r0, _0225EEB8 @ =ov92_0225F530
	bl FUN_0200E320
_0225EEA4:
	pop {r3, pc}
	nop
_0225EEA8: .4byte 0x000029D0
_0225EEAC: .4byte 0x00002BB4
_0225EEB0: .4byte 0x00001BB0
_0225EEB4: .4byte 0x00001DBC
_0225EEB8: .4byte ov92_0225F530
	thumb_func_end ov92_0225EE60

	thumb_func_start ov92_0225EEBC
ov92_0225EEBC: @ 0x0225EEBC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x71
	movs r1, #0x7c
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x7c
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x11
	lsls r0, r0, #4
	adds r1, r5, r0
	str r1, [r4, #0xc]
	movs r1, #0x32
	lsls r1, r1, #4
	adds r1, r5, r1
	adds r0, r0, #4
	adds r2, r4, #0
	str r1, [r4, #0x10]
	adds r0, r5, r0
	str r0, [r4, #0x14]
	ldr r0, _0225EF3C @ =0x00001FC8
	adds r2, #0x20
	adds r3, r5, r0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #0
	str r0, [r2]
	ldr r0, _0225EF40 @ =0x00002BB4
	ldr r0, [r5, r0]
	str r0, [r4, #0x74]
	ldr r0, [r5, #0x14]
	str r0, [r4, #0x78]
	adds r0, r5, #0
	bl ov92_0225DD48
	movs r0, #0xea
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_02018198
	ldr r0, _0225EF44 @ =0x000005B4
	movs r1, #0
	adds r0, r5, r0
	bl FUN_02018198
	movs r0, #0x1f
	lsls r0, r0, #6
	adds r0, r5, r0
	movs r1, #0
	bl FUN_02018198
	movs r2, #1
	ldr r0, _0225EF48 @ =ov92_0225EF4C
	adds r1, r4, #0
	lsls r2, r2, #0xc
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	nop
_0225EF3C: .4byte 0x00001FC8
_0225EF40: .4byte 0x00002BB4
_0225EF44: .4byte 0x000005B4
_0225EF48: .4byte ov92_0225EF4C
	thumb_func_end ov92_0225EEBC

	thumb_func_start ov92_0225EF4C
ov92_0225EF4C: @ 0x0225EF4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r6, r0, #0
	ldr r0, [r4, #0x28]
	lsls r0, r0, #4
	asrs r5, r0, #0x10
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225EF6C
	ldr r0, [r4, #0x78]
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225EF7C
_0225EF6C:
	adds r0, r6, #0
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0225EF7C:
	ldr r0, [r4]
	cmp r0, #3
	bls _0225EF84
	b _0225F1DE
_0225EF84:
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225EF90: @ jump table
	.2byte _0225EF98 - _0225EF90 - 2 @ case 0
	.2byte _0225F04A - _0225EF90 - 2 @ case 1
	.2byte _0225F166 - _0225EF90 - 2 @ case 2
	.2byte _0225F1AA - _0225EF90 - 2 @ case 3
_0225EF98:
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x10]
	cmp r0, #0
	bne _0225EFEC
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	movs r2, #3
	adds r0, r4, #0
	lsls r2, r2, #0xe
	adds r0, #0x44
	adds r2, r1, r2
	movs r3, #4
	bl ov92_02260860
	cmp r5, #0
	ldr r1, [r4, #0x10]
	ble _0225EFD4
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	movs r2, #1
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x5c
	adds r2, r1, r2
	movs r3, #4
	bl ov92_02260860
	b _0225F036
_0225EFD4:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	movs r2, #1
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x5c
	subs r2, r1, r2
	movs r3, #4
	bl ov92_02260860
	b _0225F036
_0225EFEC:
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	movs r2, #3
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x44
	adds r2, r1, r2
	movs r3, #8
	bl ov92_02260860
	cmp r5, #0
	ldr r1, [r4, #0x10]
	ble _0225F020
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	movs r2, #1
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x5c
	subs r2, r1, r2
	movs r3, #8
	bl ov92_02260860
	b _0225F036
_0225F020:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	movs r2, #1
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x5c
	adds r2, r1, r2
	movs r3, #4
	bl ov92_02260860
_0225F036:
	ldr r0, _0225F240 @ =0x0000060A
	bl FUN_0200604C
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F04A:
	adds r0, r4, #0
	adds r0, #0x44
	bl ov92_02260870
	adds r7, r0, #0
	adds r0, r4, #0
	adds r0, #0x5c
	bl ov92_02260870
	adds r6, r0, #0
	movs r0, #0x79
	ldr r2, [r4, #0x44]
	ldr r1, [r4, #0x10]
	lsls r0, r0, #2
	str r2, [r1, r0]
	adds r1, r0, #4
	ldr r3, [r4, #0x5c]
	ldr r2, [r4, #0x10]
	cmp r7, #0
	str r3, [r2, r1]
	beq _0225F078
	cmp r6, #0
	bne _0225F07A
_0225F078:
	b _0225F23A
_0225F07A:
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _0225F114
	ldr r1, [r4, #0xc]
	movs r2, #1
	str r2, [r1]
	ldr r1, [r4, #0x10]
	subs r0, #0x54
	adds r0, r1, r0
	bl ov92_022630E8
	movs r0, #0x1a
	ldr r1, [r4, #0x10]
	lsls r0, r0, #4
	adds r0, r1, r0
	bl ov92_022630E8
	movs r3, #5
	movs r1, #0
	ldr r0, _0225F244 @ =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	bl ov92_02260428
	movs r3, #4
	mvns r3, r3
	movs r1, #0
	ldr r0, _0225F244 @ =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	bl ov92_02260428
	movs r0, #0x79
	movs r2, #3
	ldr r1, [r4, #0x10]
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x44
	subs r2, r1, r2
	movs r3, #8
	bl ov92_02260860
	cmp r5, #0
	ldr r1, [r4, #0x10]
	ble _0225F0FC
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	movs r2, #1
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x5c
	adds r2, r1, r2
	movs r3, #8
	bl ov92_02260860
	b _0225F15C
_0225F0FC:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	movs r2, #1
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x5c
	subs r2, r1, r2
	movs r3, #8
	bl ov92_02260860
	b _0225F15C
_0225F114:
	ldr r1, [r4, #0x10]
	movs r2, #3
	ldr r1, [r1, r0]
	adds r0, r4, #0
	lsls r2, r2, #0xe
	adds r0, #0x44
	subs r2, r1, r2
	movs r3, #4
	bl ov92_02260860
	cmp r5, #0
	ldr r1, [r4, #0x10]
	ble _0225F146
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	movs r2, #1
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x5c
	subs r2, r1, r2
	movs r3, #4
	bl ov92_02260860
	b _0225F15C
_0225F146:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	movs r2, #1
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x5c
	adds r2, r1, r2
	movs r3, #4
	bl ov92_02260860
_0225F15C:
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F166:
	adds r0, r4, #0
	adds r0, #0x44
	bl ov92_02260870
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x5c
	bl ov92_02260870
	movs r1, #0x79
	ldr r3, [r4, #0x44]
	ldr r2, [r4, #0x10]
	lsls r1, r1, #2
	str r3, [r2, r1]
	adds r1, r1, #4
	ldr r3, [r4, #0x5c]
	ldr r2, [r4, #0x10]
	cmp r5, #0
	str r3, [r2, r1]
	beq _0225F23A
	cmp r0, #0
	beq _0225F23A
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0225F1A0
	movs r0, #0x63
	lsls r0, r0, #4
	bl FUN_0200604C
_0225F1A0:
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F1AA:
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _0225F1D6
	ldr r0, [r4, #8]
	cmp r0, #8
	bne _0225F1BC
	ldr r0, _0225F248 @ =0x0000058D
	bl FUN_0200604C
_0225F1BC:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x28
	blt _0225F23A
	ldr r0, [r4, #0xc]
	movs r1, #2
	str r1, [r0]
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F1D6:
	adds r0, r0, #1
	add sp, #0xc
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F1DE:
	ldr r0, [r4, #4]
	cmp r0, #0
	ldr r0, [r4, #8]
	bne _0225F208
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x2d
	blt _0225F23A
	ldr r0, [r4, #0xc]
	movs r1, #0
	str r1, [r0]
	ldr r0, _0225F240 @ =0x0000060A
	bl FUN_0200604C
	movs r0, #0
	str r0, [r4]
	ldr r0, [r4, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, r7, pc}
_0225F208:
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	blt _0225F23A
	ldr r0, [r4, #0x74]
	cmp r0, #0
	beq _0225F21A
	ldr r2, _0225F24C @ =0xFFFF8000
	b _0225F21C
_0225F21A:
	ldr r2, _0225F250 @ =0xFFFEC000
_0225F21C:
	movs r0, #0x79
	ldr r1, [r4, #0x10]
	lsls r0, r0, #2
	str r2, [r1, r0]
	movs r0, #0x7a
	ldr r1, [r4, #0x10]
	movs r2, #0
	lsls r0, r0, #2
	str r2, [r1, r0]
	adds r0, r6, #0
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
_0225F23A:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225F240: .4byte 0x0000060A
_0225F244: .4byte 0x3F4CCCCD
_0225F248: .4byte 0x0000058D
_0225F24C: .4byte 0xFFFF8000
_0225F250: .4byte 0xFFFEC000
	thumb_func_end ov92_0225EF4C

	thumb_func_start ov92_0225F254
ov92_0225F254: @ 0x0225F254
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_0200DCD4
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225F274
	ldr r0, [r4, #0x2c]
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225F284
_0225F274:
	adds r0, r5, #0
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0225F284:
	ldr r0, [r4]
	cmp r0, #0
	beq _0225F290
	cmp r0, #1
	beq _0225F2D4
	b _0225F300
_0225F290:
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	add r1, sp, #0xc
	add r2, sp, #8
	bl FUN_0200DF2C
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0225F2B8
	movs r2, #2
	adds r0, r4, #0
	ldr r1, [sp, #8]
	lsls r2, r2, #0x10
	adds r0, #0x14
	adds r2, r1, r2
	movs r3, #0x10
	bl ov92_02260860
	b _0225F2CA
_0225F2B8:
	movs r2, #2
	adds r0, r4, #0
	ldr r1, [sp, #8]
	lsls r2, r2, #0x10
	adds r0, #0x14
	subs r2, r1, r2
	movs r3, #4
	bl ov92_02260860
_0225F2CA:
	ldr r0, [r4]
	add sp, #0x10
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225F2D4:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov92_02260870
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	add r1, sp, #4
	add r2, sp, #0
	bl FUN_0200DF2C
	ldr r0, [r4, #0xc]
	ldr r1, [sp, #4]
	ldr r2, [r4, #0x14]
	bl FUN_0200DF08
	cmp r5, #0
	beq _0225F332
	ldr r0, [r4]
	add sp, #0x10
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225F300:
	ldr r0, [r4, #4]
	cmp r0, #0
	ldr r0, [r4, #8]
	bne _0225F31E
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x23
	blt _0225F332
	ldr r0, [r4, #4]
	add sp, #0x10
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225F31E:
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	blt _0225F332
	adds r0, r5, #0
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
_0225F332:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov92_0225F254

	thumb_func_start ov92_0225F338
ov92_0225F338: @ 0x0225F338
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225F352
	ldr r0, [r4, #0x3c]
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225F360
_0225F352:
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r5, #0
	bl FUN_0200E390
	add sp, #8
	pop {r3, r4, r5, pc}
_0225F360:
	ldr r0, [r4]
	cmp r0, #5
	bls _0225F368
	b _0225F4F2
_0225F368:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225F374: @ jump table
	.2byte _0225F380 - _0225F374 - 2 @ case 0
	.2byte _0225F3F4 - _0225F374 - 2 @ case 1
	.2byte _0225F426 - _0225F374 - 2 @ case 2
	.2byte _0225F43C - _0225F374 - 2 @ case 3
	.2byte _0225F46C - _0225F374 - 2 @ case 4
	.2byte _0225F4BC - _0225F374 - 2 @ case 5
_0225F380:
	ldr r0, [r4, #0xc]
	movs r1, #7
	bl FUN_0200DC4C
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0200DD68
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r4, #0xc]
	add r1, sp, #4
	add r2, sp, #0
	bl FUN_0200E060
	ldr r0, [sp]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _0225F524 @ =0x45800000
	bls _0225F3C0
	ldr r1, [sp]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225F3CE
_0225F3C0:
	ldr r1, [sp]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225F3CE:
	blx FUN_020F2104
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #2
	adds r0, #0x10
	lsls r2, r2, #0xc
	movs r3, #2
	bl ov92_02260860
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0xc]
	ldr r1, [r1]
	subs r1, r1, #1
	bl FUN_0200DD24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0225F3F4:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov92_02260870
	adds r5, r0, #0
	ldr r0, [r4, #0x10]
	blx FUN_020F2178
	ldr r1, _0225F524 @ =0x45800000
	blx FUN_020F1CC8
	adds r2, r0, #0
	movs r1, #0xfe
	ldr r0, [r4, #0xc]
	lsls r1, r1, #0x16
	bl FUN_0200E024
	cmp r5, #0
	bne _0225F41C
	b _0225F520
_0225F41C:
	ldr r0, [r4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225F426:
	adds r0, r4, #0
	movs r1, #2
	ldr r2, _0225F528 @ =0x00000666
	adds r0, #0x10
	lsls r1, r1, #0xc
	movs r3, #4
	bl ov92_02260860
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0225F43C:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov92_02260870
	adds r5, r0, #0
	ldr r0, [r4, #0x10]
	blx FUN_020F2178
	ldr r1, _0225F524 @ =0x45800000
	blx FUN_020F1CC8
	adds r2, r0, #0
	movs r1, #0xfe
	ldr r0, [r4, #0xc]
	lsls r1, r1, #0x16
	bl FUN_0200E024
	cmp r5, #0
	beq _0225F520
	ldr r0, [r4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225F46C:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x28]
	ldr r0, [r0]
	cmp r1, r0
	beq _0225F47C
	movs r0, #0
	str r0, [r4]
	b _0225F4A6
_0225F47C:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0225F492
	adds r0, r4, #0
	ldr r1, _0225F528 @ =0x00000666
	ldr r2, _0225F52C @ =0x00000CCD
	adds r0, #0x10
	movs r3, #2
	bl ov92_02260860
	b _0225F4A0
_0225F492:
	ldr r1, _0225F52C @ =0x00000CCD
	adds r0, r4, #0
	adds r0, #0x10
	lsrs r2, r1, #1
	movs r3, #4
	bl ov92_02260860
_0225F4A0:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0225F4A6:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	cmp r0, #0
	bne _0225F520
	movs r0, #0xff
	add sp, #8
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225F4BC:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov92_02260870
	adds r5, r0, #0
	ldr r0, [r4, #0x10]
	blx FUN_020F2178
	ldr r1, _0225F524 @ =0x45800000
	blx FUN_020F1CC8
	adds r2, r0, #0
	movs r1, #0xfe
	ldr r0, [r4, #0xc]
	lsls r1, r1, #0x16
	bl FUN_0200E024
	cmp r5, #0
	beq _0225F520
	movs r0, #4
	str r0, [r4]
	ldr r1, [r4, #4]
	movs r0, #1
	eors r0, r1
	add sp, #8
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0225F4F2:
	movs r1, #0xfe
	lsls r1, r1, #0x16
	ldr r0, [r4, #0xc]
	adds r2, r1, #0
	bl FUN_0200E024
	ldr r0, [r4, #0xc]
	movs r1, #5
	bl FUN_0200DC4C
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_0200DD68
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0200DF98
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r5, #0
	bl FUN_0200E390
_0225F520:
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225F524: .4byte 0x45800000
_0225F528: .4byte 0x00000666
_0225F52C: .4byte 0x00000CCD
	thumb_func_end ov92_0225F338

	thumb_func_start ov92_0225F530
ov92_0225F530: @ 0x0225F530
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r7, r0, #0
	ldr r6, [r4, #0x34]
	ldr r5, [r4, #0x38]
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225F550
	ldr r2, [r4, #0x3c]
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225F59A
_0225F550:
	adds r0, r6, #0
	bl ov92_0225DA2C
	adds r0, r5, #0
	bl ov92_0225DA2C
	ldr r1, [r4, #0x3c]
	adds r0, r6, #0
	adds r0, #0x88
	adds r1, #0x24
	bl FUN_020180F8
	ldr r1, [r4, #0x3c]
	adds r6, #0x9c
	adds r0, r6, #0
	adds r1, #0x24
	bl FUN_020180F8
	ldr r1, [r4, #0x3c]
	adds r0, r5, #0
	adds r0, #0x88
	adds r1, #0x24
	bl FUN_020180F8
	ldr r1, [r4, #0x3c]
	adds r5, #0x9c
	adds r0, r5, #0
	adds r1, #0x24
	bl FUN_020180F8
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r7, #0
	bl FUN_0200E390
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0225F59A:
	ldr r0, [r4, #0x2c]
	ldr r1, [r0]
	subs r3, r1, #1
	bmi _0225F5A6
	cmp r3, #4
	ble _0225F5A8
_0225F5A6:
	movs r3, #0
_0225F5A8:
	ldr r0, [r4]
	cmp r0, #5
	bls _0225F5B0
	b _0225F81E
_0225F5B0:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225F5BC: @ jump table
	.2byte _0225F5C8 - _0225F5BC - 2 @ case 0
	.2byte _0225F5E8 - _0225F5BC - 2 @ case 1
	.2byte _0225F69C - _0225F5BC - 2 @ case 2
	.2byte _0225F6BC - _0225F5BC - 2 @ case 3
	.2byte _0225F798 - _0225F5BC - 2 @ case 4
	.2byte _0225F7C4 - _0225F5BC - 2 @ case 5
_0225F5C8:
	ldr r1, [r2]
	ldr r2, _0225F868 @ =0x02263CD0
	lsls r3, r3, #3
	ldr r2, [r2, r3]
	adds r0, r6, #0
	bl ov92_0225D9A8
	ldr r1, [r4, #0x40]
	adds r0, r6, #0
	bl ov92_0225D9B4
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F5E8:
	movs r0, #0x71
	str r0, [sp]
	adds r0, r2, #0
	adds r0, #0x24
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r6, #0
	ldr r2, [r2]
	adds r0, #0x88
	adds r1, #0x78
	movs r3, #0x27
	bl FUN_020180BC
	adds r1, r6, #0
	ldr r2, [r4, #0x3c]
	movs r0, #0x71
	str r0, [sp]
	adds r0, r2, #0
	adds r0, #0x24
	str r0, [sp, #4]
	adds r0, r6, #0
	ldr r2, [r2]
	adds r0, #0x9c
	adds r1, #0x78
	movs r3, #0x28
	bl FUN_020180BC
	adds r1, r6, #0
	adds r0, r6, #0
	adds r1, #0x88
	bl FUN_020181D4
	adds r1, r6, #0
	adds r0, r6, #0
	adds r1, #0x9c
	bl FUN_020181D4
	adds r0, r6, #0
	adds r0, #0x88
	movs r1, #0
	bl FUN_02018198
	adds r0, r6, #0
	adds r0, #0x9c
	movs r1, #0
	bl FUN_02018198
	adds r0, r6, #0
	movs r1, #0
	bl FUN_020182A0
	movs r0, #0x7b
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r6, r0]
	subs r0, #0x5c
	adds r0, r6, r0
	bl ov92_022630E8
	movs r0, #0x1a
	lsls r0, r0, #4
	adds r0, r6, r0
	bl ov92_022630E8
	movs r3, #5
	movs r1, #0
	ldr r0, _0225F86C @ =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	movs r3, #4
	mvns r3, r3
	movs r1, #0
	ldr r0, _0225F86C @ =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r6, #0
	adds r2, r1, #0
	bl ov92_02260428
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F69C:
	ldr r1, [r2]
	ldr r2, _0225F870 @ =0x02263CD4
	lsls r3, r3, #3
	ldr r2, [r2, r3]
	adds r0, r5, #0
	bl ov92_0225D9A8
	ldr r1, [r4, #0x40]
	adds r0, r5, #0
	bl ov92_0225D9B4
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F6BC:
	movs r0, #0x71
	str r0, [sp]
	adds r0, r2, #0
	adds r0, #0x24
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r5, #0
	ldr r2, [r2]
	adds r0, #0x88
	adds r1, #0x78
	movs r3, #0x29
	bl FUN_020180BC
	adds r1, r5, #0
	ldr r2, [r4, #0x3c]
	movs r0, #0x71
	str r0, [sp]
	adds r0, r2, #0
	adds r0, #0x24
	str r0, [sp, #4]
	adds r0, r5, #0
	ldr r2, [r2]
	adds r0, #0x9c
	adds r1, #0x78
	movs r3, #0x2a
	bl FUN_020180BC
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x88
	bl FUN_020181D4
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x9c
	bl FUN_020181D4
	adds r0, r5, #0
	adds r0, #0x88
	movs r1, #0
	bl FUN_02018198
	adds r0, r5, #0
	adds r0, #0x9c
	movs r1, #0
	bl FUN_02018198
	adds r0, r5, #0
	movs r1, #1
	bl FUN_020182A0
	movs r0, #0x7b
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r5, r0]
	subs r0, #0x5c
	adds r0, r5, r0
	bl ov92_022630E8
	movs r0, #0x1a
	lsls r0, r0, #4
	adds r0, r5, r0
	bl ov92_022630E8
	movs r3, #5
	movs r1, #0
	ldr r0, _0225F86C @ =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r1, #0
	str r1, [sp, #8]
	bl ov92_02260428
	movs r3, #4
	mvns r3, r3
	movs r1, #0
	ldr r0, _0225F86C @ =0x3F4CCCCD
	str r3, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov92_02260428
	ldr r0, [r4, #0x40]
	cmp r0, #0
	beq _0225F78E
	movs r1, #0
	ldr r2, _0225F874 @ =0xFFFF8000
	adds r0, r6, #0
	adds r3, r1, #0
	bl FUN_020182A8
	movs r1, #0
	ldr r2, _0225F874 @ =0xFFFF8000
	adds r0, r5, #0
	adds r3, r1, #0
	bl FUN_020182A8
	movs r0, #0x79
	ldr r1, _0225F874 @ =0xFFFF8000
	lsls r0, r0, #2
	str r1, [r6, r0]
	str r1, [r5, r0]
_0225F78E:
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F798:
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225F864
	adds r0, r6, #0
	movs r1, #1
	bl FUN_020182A0
	adds r0, r5, #0
	movs r1, #0
	bl FUN_020182A0
	movs r0, #0x7b
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r6, r0]
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F7C4:
	cmp r1, #0
	bne _0225F7CE
	movs r0, #0xff
	str r0, [r4]
	b _0225F814
_0225F7CE:
	ldr r0, [r4, #0x28]
	cmp r0, r1
	beq _0225F814
	adds r0, r6, #0
	bl ov92_0225DA2C
	adds r0, r5, #0
	bl ov92_0225DA2C
	ldr r1, [r4, #0x3c]
	adds r0, r6, #0
	adds r0, #0x88
	adds r1, #0x24
	bl FUN_020180F8
	ldr r1, [r4, #0x3c]
	adds r6, #0x9c
	adds r0, r6, #0
	adds r1, #0x24
	bl FUN_020180F8
	ldr r1, [r4, #0x3c]
	adds r0, r5, #0
	adds r0, #0x88
	adds r1, #0x24
	bl FUN_020180F8
	ldr r1, [r4, #0x3c]
	adds r5, #0x9c
	adds r0, r5, #0
	adds r1, #0x24
	bl FUN_020180F8
	movs r0, #0
	str r0, [r4]
_0225F814:
	ldr r0, [r4, #0x2c]
	add sp, #0xc
	ldr r0, [r0]
	str r0, [r4, #0x28]
	pop {r4, r5, r6, r7, pc}
_0225F81E:
	adds r0, r6, #0
	bl ov92_0225DA2C
	adds r0, r5, #0
	bl ov92_0225DA2C
	ldr r1, [r4, #0x3c]
	adds r0, r6, #0
	adds r0, #0x88
	adds r1, #0x24
	bl FUN_020180F8
	ldr r1, [r4, #0x3c]
	adds r6, #0x9c
	adds r0, r6, #0
	adds r1, #0x24
	bl FUN_020180F8
	ldr r1, [r4, #0x3c]
	adds r0, r5, #0
	adds r0, #0x88
	adds r1, #0x24
	bl FUN_020180F8
	ldr r1, [r4, #0x3c]
	adds r5, #0x9c
	adds r0, r5, #0
	adds r1, #0x24
	bl FUN_020180F8
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r7, #0
	bl FUN_0200E390
_0225F864:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225F868: .4byte 0x02263CD0
_0225F86C: .4byte 0x3F4CCCCD
_0225F870: .4byte 0x02263CD4
_0225F874: .4byte 0xFFFF8000
	thumb_func_end ov92_0225F530

	thumb_func_start ov92_0225F878
ov92_0225F878: @ 0x0225F878
	push {r3, r4}
	sub sp, #8
	ldr r3, _0225F8A8 @ =0x02263C34
	add r2, sp, #0
	ldrh r4, [r3, #0x10]
	add r1, sp, #0
	strh r4, [r2]
	ldrh r4, [r3, #0x12]
	strh r4, [r2, #2]
	ldrh r4, [r3, #0x14]
	ldrh r3, [r3, #0x16]
	strh r4, [r2, #4]
	strh r3, [r2, #6]
	ldr r3, _0225F8AC @ =0x00002AF0
	subs r2, r3, #4
	ldr r2, [r0, r2]
	ldr r4, [r0, r3]
	lsls r2, r2, #1
	ldrh r1, [r1, r2]
	adds r1, r4, r1
	str r1, [r0, r3]
	add sp, #8
	pop {r3, r4}
	bx lr
	.align 2, 0
_0225F8A8: .4byte 0x02263C34
_0225F8AC: .4byte 0x00002AF0
	thumb_func_end ov92_0225F878

	thumb_func_start ov92_0225F8B0
ov92_0225F8B0: @ 0x0225F8B0
	push {r3, r4}
	sub sp, #8
	ldr r3, _0225F8E4 @ =0x02263C34
	add r1, sp, #0
	ldrh r4, [r3, #0x18]
	add r2, sp, #0
	strh r4, [r1]
	ldrh r4, [r3, #0x1a]
	strh r4, [r1, #2]
	ldrh r4, [r3, #0x1c]
	ldrh r3, [r3, #0x1e]
	strh r4, [r1, #4]
	ldr r4, _0225F8E8 @ =0x00002AF0
	strh r3, [r1, #6]
	subs r3, r4, #4
	ldr r3, [r0, r3]
	ldr r1, [r0, r4]
	subs r3, r3, #1
	lsls r3, r3, #1
	ldrh r2, [r2, r3]
	adds r1, r1, r2
	str r1, [r0, r4]
	add sp, #8
	pop {r3, r4}
	bx lr
	nop
_0225F8E4: .4byte 0x02263C34
_0225F8E8: .4byte 0x00002AF0
	thumb_func_end ov92_0225F8B0

	thumb_func_start ov92_0225F8EC
ov92_0225F8EC: @ 0x0225F8EC
	ldr r2, _0225F958 @ =0x00002B18
	ldr r1, _0225F95C @ =0x0000010D
	ldr r3, [r0, r2]
	cmp r3, r1
	bgt _0225F906
	bge _0225F926
	cmp r3, #0
	bgt _0225F900
	beq _0225F946
	b _0225F94C
_0225F900:
	cmp r3, #0x77
	beq _0225F91E
	b _0225F94C
_0225F906:
	ldr r1, _0225F960 @ =0x00000239
	cmp r3, r1
	bgt _0225F916
	bge _0225F936
	subs r1, #0x96
	cmp r3, r1
	beq _0225F92E
	b _0225F94C
_0225F916:
	adds r1, #0x96
	cmp r3, r1
	beq _0225F93E
	b _0225F94C
_0225F91E:
	movs r1, #1
	subs r2, #0x30
	str r1, [r0, r2]
	b _0225F94C
_0225F926:
	movs r1, #2
	subs r2, #0x30
	str r1, [r0, r2]
	b _0225F94C
_0225F92E:
	movs r1, #3
	subs r2, #0x30
	str r1, [r0, r2]
	b _0225F94C
_0225F936:
	movs r1, #4
	subs r2, #0x30
	str r1, [r0, r2]
	b _0225F94C
_0225F93E:
	movs r1, #5
	subs r2, #0x30
	str r1, [r0, r2]
	b _0225F94C
_0225F946:
	movs r1, #0
	subs r2, #0x30
	str r1, [r0, r2]
_0225F94C:
	ldr r2, _0225F958 @ =0x00002B18
	ldr r3, _0225F964 @ =ov92_0225F968
	ldr r1, [r0, r2]
	subs r2, #0x2c
	adds r2, r0, r2
	bx r3
	.align 2, 0
_0225F958: .4byte 0x00002B18
_0225F95C: .4byte 0x0000010D
_0225F960: .4byte 0x00000239
_0225F964: .4byte ov92_0225F968
	thumb_func_end ov92_0225F8EC

	thumb_func_start ov92_0225F968
ov92_0225F968: @ 0x0225F968
	ldr r0, _0225F9B8 @ =0x00000257
	cmp r1, r0
	bgt _0225F980
	bge _0225F998
	cmp r1, #0
	bgt _0225F978
	beq _0225F9B0
	b _0225F9B4
_0225F978:
	lsrs r0, r0, #1
	cmp r1, r0
	beq _0225F992
	b _0225F9B4
_0225F980:
	ldr r0, _0225F9BC @ =0x00000383
	cmp r1, r0
	bgt _0225F98A
	beq _0225F9A0
	b _0225F9B4
_0225F98A:
	ldr r0, _0225F9C0 @ =0x000004AF
	cmp r1, r0
	beq _0225F9A8
	b _0225F9B4
_0225F992:
	movs r0, #1
	str r0, [r2]
	bx lr
_0225F998:
	movs r0, #2
	str r0, [r2]
	movs r0, #1
	bx lr
_0225F9A0:
	movs r0, #3
	str r0, [r2]
	movs r0, #1
	bx lr
_0225F9A8:
	movs r0, #4
	str r0, [r2]
	movs r0, #1
	bx lr
_0225F9B0:
	movs r0, #0
	str r0, [r2]
_0225F9B4:
	movs r0, #0
	bx lr
	.align 2, 0
_0225F9B8: .4byte 0x00000257
_0225F9BC: .4byte 0x00000383
_0225F9C0: .4byte 0x000004AF
	thumb_func_end ov92_0225F968

	thumb_func_start ov92_0225F9C4
ov92_0225F9C4: @ 0x0225F9C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #4]
	movs r4, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _0225FAA0
	ldr r0, _0225FAA4 @ =0x00002B08
	adds r7, r5, #0
	adds r0, r5, r0
	str r0, [sp]
	adds r6, r5, #0
_0225F9DE:
	ldr r0, [r5]
	cmp r4, r0
	beq _0225FA8E
	ldr r0, _0225FAA8 @ =0x00002B9C
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _0225F9F6
	cmp r0, #1
	beq _0225FA36
	cmp r0, #2
	beq _0225FA76
	b _0225FA8E
_0225F9F6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov92_0225DFA4
	cmp r0, #1
	beq _0225FA0C
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl ov92_0225DF58
_0225FA0C:
	movs r1, #0x2b
	lsls r1, r1, #8
	ldrsh r1, [r6, r1]
	ldr r2, [sp]
	adds r0, r5, #0
	bl ov92_0225F968
	cmp r0, #0
	beq _0225FA26
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov92_0225EE04
_0225FA26:
	movs r0, #0x2b
	lsls r0, r0, #8
	ldrsh r0, [r6, r0]
	adds r1, r0, #1
	movs r0, #0x2b
	lsls r0, r0, #8
	strh r1, [r6, r0]
	b _0225FA8E
_0225FA36:
	ldr r0, _0225FAAC @ =0x00002AFE
	movs r1, #0
	strh r1, [r5, r0]
	adds r0, r0, #2
	strh r1, [r6, r0]
	ldr r0, _0225FAA4 @ =0x00002B08
	str r1, [r7, r0]
	ldr r0, _0225FAB0 @ =0x000021A4
	str r1, [r5, r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov92_0225DFA4
	cmp r0, #3
	beq _0225FA8E
	ldr r0, _0225FAB4 @ =0x00002BB8
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225FA8E
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl ov92_0225DF58
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov92_0225EDB4
	ldr r0, _0225FAB4 @ =0x00002BB8
	movs r1, #1
	str r1, [r5, r0]
	b _0225FA8E
_0225FA76:
	ldr r0, _0225FAB4 @ =0x00002BB8
	movs r1, #0
	str r1, [r5, r0]
	subs r0, #0xba
	strh r1, [r5, r0]
	movs r0, #0x2b
	lsls r0, r0, #8
	strh r1, [r6, r0]
	adds r0, #8
	str r1, [r7, r0]
	ldr r0, _0225FAA8 @ =0x00002B9C
	str r1, [r7, r0]
_0225FA8E:
	ldr r0, [sp]
	adds r4, r4, #1
	adds r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r7, r7, #4
	adds r6, r6, #2
	cmp r4, r0
	blt _0225F9DE
_0225FAA0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225FAA4: .4byte 0x00002B08
_0225FAA8: .4byte 0x00002B9C
_0225FAAC: .4byte 0x00002AFE
_0225FAB0: .4byte 0x000021A4
_0225FAB4: .4byte 0x00002BB8
	thumb_func_end ov92_0225F9C4

	thumb_func_start ov92_0225FAB8
ov92_0225FAB8: @ 0x0225FAB8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0225FC1C @ =0x00002B9C
	ldr r2, [r4]
	adds r3, r4, r1
	lsls r2, r2, #2
	ldr r5, [r3, r2]
	cmp r5, #3
	bls _0225FACC
	b _0225FC18
_0225FACC:
	adds r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	add pc, r5
_0225FAD8: @ jump table
	.2byte _0225FAE0 - _0225FAD8 - 2 @ case 0
	.2byte _0225FB52 - _0225FAD8 - 2 @ case 1
	.2byte _0225FB8C - _0225FAD8 - 2 @ case 2
	.2byte _0225FBEA - _0225FAD8 - 2 @ case 3
_0225FAE0:
	movs r1, #0
	bl ov92_0225ED68
	cmp r0, #0
	beq _0225FB28
	ldr r0, _0225FC20 @ =0x00002AFC
	movs r1, #0
	strh r1, [r4, r0]
	adds r0, r4, #0
	bl ov92_0225EEBC
	adds r0, r4, #0
	bl ov92_0225FEB4
	ldr r0, [r4]
	ldr r1, _0225FC1C @ =0x00002B9C
	lsls r0, r0, #2
	movs r2, #1
	adds r0, r4, r0
	str r2, [r0, r1]
	adds r2, r4, r1
	ldr r1, [r4]
	movs r0, #0x18
	lsls r1, r1, #2
	adds r1, r2, r1
	movs r2, #4
	bl FUN_02037030
	ldr r0, _0225FC24 @ =0x00002B18
	movs r1, #0
	str r1, [r4, r0]
	subs r0, #0x1a
	strh r1, [r4, r0]
	ldr r0, _0225FC28 @ =0x000021A4
	str r1, [r4, r0]
	pop {r3, r4, r5, pc}
_0225FB28:
	adds r0, r4, #0
	bl ov92_0225ED80
	adds r0, r4, #0
	bl ov92_0225FC9C
	adds r0, r4, #0
	bl ov92_0225FF1C
	adds r0, r4, #0
	bl ov92_0225F878
	movs r0, #0x2b
	lsls r0, r0, #8
	adds r2, r4, r0
	ldr r0, [r4]
	lsls r1, r0, #1
	ldrsh r0, [r2, r1]
	adds r0, r0, #1
	strh r0, [r2, r1]
	pop {r3, r4, r5, pc}
_0225FB52:
	adds r0, r1, #0
	subs r0, #0xa0
	ldrsh r0, [r4, r0]
	adds r2, r0, #1
	adds r0, r1, #0
	subs r0, #0xa0
	strh r2, [r4, r0]
	adds r0, r1, #0
	subs r0, #0xa0
	ldrsh r0, [r4, r0]
	cmp r0, #0x5a
	blt _0225FB74
	ldr r0, [r4]
	movs r2, #2
	lsls r0, r0, #2
	adds r0, r4, r0
	str r2, [r0, r1]
_0225FB74:
	ldr r1, _0225FC24 @ =0x00002B18
	movs r2, #0
	adds r0, r1, #0
	str r2, [r4, r1]
	subs r0, #0x1a
	strh r2, [r4, r0]
	ldr r0, [r4]
	subs r1, #0x18
	lsls r0, r0, #1
	adds r0, r4, r0
	strh r2, [r0, r1]
	pop {r3, r4, r5, pc}
_0225FB8C:
	adds r0, r1, #0
	subs r0, #0xa0
	ldrsh r0, [r4, r0]
	cmp r0, #0
	beq _0225FBE4
	adds r2, r1, #0
	movs r0, #0
	subs r2, #0x84
	str r0, [r4, r2]
	adds r2, r1, #0
	subs r2, #0x9e
	strh r0, [r4, r2]
	adds r2, r1, #0
	subs r2, #0xa0
	strh r0, [r4, r2]
	ldr r2, [r4]
	lsls r2, r2, #1
	adds r3, r4, r2
	adds r2, r1, #0
	subs r2, #0x9c
	strh r0, [r3, r2]
	adds r0, r1, #0
	subs r0, #0xa4
	ldr r2, [r4, r0]
	adds r0, r1, #0
	subs r0, #0xa8
	ldr r0, [r4, r0]
	cmp r2, r0
	beq _0225FBCA
	subs r1, #0xa8
	str r2, [r4, r1]
_0225FBCA:
	adds r0, r4, #0
	bl ov92_0225EBE0
	ldr r1, _0225FC1C @ =0x00002B9C
	movs r0, #0x18
	adds r2, r4, r1
	ldr r1, [r4]
	lsls r1, r1, #2
	adds r1, r2, r1
	movs r2, #4
	bl FUN_02037030
	pop {r3, r4, r5, pc}
_0225FBE4:
	movs r0, #0
	str r0, [r3, r2]
	pop {r3, r4, r5, pc}
_0225FBEA:
	adds r2, r1, #0
	subs r2, #0xa0
	ldrsh r2, [r4, r2]
	adds r3, r2, #1
	adds r2, r1, #0
	subs r2, #0xa0
	strh r3, [r4, r2]
	adds r2, r1, #0
	subs r2, #0xa0
	ldrsh r2, [r4, r2]
	cmp r2, #0x1d
	blo _0225FC18
	movs r2, #0
	subs r1, #0xa0
	strh r2, [r4, r1]
	bl ov92_0225EBE0
	ldr r0, [r4]
	movs r2, #0
	lsls r0, r0, #2
	adds r1, r4, r0
	ldr r0, _0225FC1C @ =0x00002B9C
	str r2, [r1, r0]
_0225FC18:
	pop {r3, r4, r5, pc}
	nop
_0225FC1C: .4byte 0x00002B9C
_0225FC20: .4byte 0x00002AFC
_0225FC24: .4byte 0x00002B18
_0225FC28: .4byte 0x000021A4
	thumb_func_end ov92_0225FAB8

	thumb_func_start ov92_0225FC2C
ov92_0225FC2C: @ 0x0225FC2C
	push {r4, lr}
	ldr r1, _0225FC90 @ =0x00002AE4
	adds r4, r0, #0
	ldr r2, [r4, r1]
	movs r1, #0x4b
	lsls r1, r1, #4
	cmp r2, r1
	bge _0225FC8C
	bl ov92_0225FAB8
	adds r0, r4, #0
	bl ov92_0225F9C4
	adds r0, r4, #0
	bl ov92_0225F8EC
	cmp r0, #1
	bne _0225FC64
	ldr r1, [r4]
	adds r0, r4, #0
	bl ov92_0225EE60
	adds r0, r4, #0
	bl ov92_0225F8B0
	ldr r0, _0225FC94 @ =0x0000058C
	bl FUN_0200604C
_0225FC64:
	adds r0, r4, #0
	bl ov92_0225FEE4
	ldr r1, _0225FC98 @ =0x00002B18
	ldr r0, [r4, r1]
	adds r0, r0, #1
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0x34
	ldr r0, [r4, r0]
	adds r2, r0, #1
	adds r0, r1, #0
	subs r0, #0x34
	str r2, [r4, r0]
	adds r0, r1, #0
	subs r0, #0x1a
	ldrsh r0, [r4, r0]
	subs r1, #0x1a
	adds r0, r0, #1
	strh r0, [r4, r1]
_0225FC8C:
	pop {r4, pc}
	nop
_0225FC90: .4byte 0x00002AE4
_0225FC94: .4byte 0x0000058C
_0225FC98: .4byte 0x00002B18
	thumb_func_end ov92_0225FC2C

	thumb_func_start ov92_0225FC9C
ov92_0225FC9C: @ 0x0225FC9C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	add r0, sp, #0x10
	add r1, sp, #0xc
	bl FUN_02025364
	ldr r0, _0225FE78 @ =0x00002B84
	movs r1, #0
	str r1, [r5, r0]
	adds r0, #0x30
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0225FCC4
	ldr r0, _0225FE7C @ =0x02263C3C
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl FUN_0202539C
	b _0225FCCE
_0225FCC4:
	ldr r0, _0225FE80 @ =0x02263C34
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl FUN_0202539C
_0225FCCE:
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0225FD72
	ldr r3, _0225FE84 @ =0x00001FD4
	movs r0, #0
	movs r2, #0xc3
	str r0, [r5, r3]
	adds r1, r3, #4
	lsls r2, r2, #2
	str r0, [r5, r1]
	ldr r1, [r5, r2]
	cmp r1, #0
	beq _0225FD2E
	movs r0, #0x45
	lsls r0, r0, #2
	movs r1, #0xfe
	adds r0, r5, r0
	lsls r1, r1, #0x16
	bl ov92_02260628
	movs r0, #0x32
	lsls r0, r0, #4
	movs r1, #0x3f
	adds r0, r5, r0
	lsls r1, r1, #0x18
	bl ov92_02260628
	ldr r4, _0225FE88 @ =0x02263C5C
	add r3, sp, #0x20
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #0x4d
	str r0, [r3]
	adds r0, r2, #0
	ldr r2, _0225FE8C @ =0x00001FC8
	lsls r1, r1, #4
	adds r1, r5, r1
	adds r2, r5, r2
	blx FUN_020CBE9C
	ldr r0, _0225FE78 @ =0x00002B84
	movs r1, #1
	add sp, #0x2c
	str r1, [r5, r0]
	pop {r3, r4, r5, r6, pc}
_0225FD2E:
	adds r1, r2, #4
	str r0, [r5, r1]
	adds r2, #8
	str r0, [r5, r2]
	adds r1, r3, #4
	ldr r2, [r5, r1]
	ldr r1, [r5, r3]
	ldr r3, _0225FE90 @ =0x3FF0A3D7
	str r2, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r3, r1, #0
	bl ov92_02260428
	ldr r0, _0225FE94 @ =0x00001FD8
	ldr r2, [r5, r0]
	subs r0, r0, #4
	ldr r1, [r5, r0]
	ldr r0, _0225FE98 @ =0x3E6147AE
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	adds r3, r1, #0
	bl ov92_02260428
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
_0225FD72:
	ldr r0, _0225FE9C @ =0x00001FCC
	movs r1, #0x28
	ldr r0, [r5, r0]
	asrs r4, r0, #0xc
	movs r0, #0x64
	subs r0, r0, r4
	blx FUN_020F2998
	blx FUN_020F2178
	adds r6, r0, #0
	cmp r4, #0x5f
	blt _0225FD8E
	ldr r6, _0225FEA0 @ =0x3DCCCCCD
_0225FD8E:
	adds r0, r6, #0
	blx FUN_020F2080
	ldr r2, _0225FEA4 @ =0xC28F5C29
	ldr r3, _0225FEA8 @ =0x3FCC28F5
	blx FUN_020F1744
	blo _0225FDA2
	ldr r4, _0225FE98 @ =0x3E6147AE
	b _0225FDBA
_0225FDA2:
	adds r0, r6, #0
	blx FUN_020F2080
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _0225FEA4 @ =0xC28F5C29
	ldr r1, _0225FEA8 @ =0x3FCC28F5
	blx FUN_020F116C
	blx FUN_020F09A4
	adds r4, r0, #0
_0225FDBA:
	ldr r0, _0225FE84 @ =0x00001FD4
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _0225FDCC
	ldr r1, [sp, #0x10]
	str r1, [r5, r0]
	ldr r1, [sp, #0xc]
	adds r0, r0, #4
	str r1, [r5, r0]
_0225FDCC:
	ldr r3, _0225FE94 @ =0x00001FD8
	ldr r0, [r5, r3]
	subs r3, r3, #4
	str r0, [sp]
	movs r0, #1
	lsls r0, r0, #0x1e
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x45
	lsls r0, r0, #2
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	ldr r3, [r5, r3]
	adds r0, r5, r0
	bl ov92_02260428
	ldr r3, _0225FE94 @ =0x00001FD8
	ldr r0, [r5, r3]
	subs r3, r3, #4
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	ldr r3, [r5, r3]
	adds r0, r5, r0
	bl ov92_02260428
	ldr r4, _0225FEAC @ =0x02263C68
	add r3, sp, #0x14
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #0x4d
	str r0, [r3]
	adds r0, r2, #0
	ldr r2, _0225FE8C @ =0x00001FC8
	lsls r1, r1, #4
	adds r1, r5, r1
	adds r2, r5, r2
	blx FUN_020CBE9C
	ldr r0, _0225FE78 @ =0x00002B84
	movs r2, #1
	adds r1, r0, #0
	str r2, [r5, r0]
	adds r1, #0x10
	ldr r1, [r5, r1]
	cmp r1, #0
	bne _0225FE3E
	adds r0, #0x10
	str r2, [r5, r0]
_0225FE3E:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0225FE66
	ldr r0, _0225FEB0 @ =0x0000058A
	bl FUN_02006184
	cmp r0, #0
	bne _0225FE54
	ldr r0, _0225FEB0 @ =0x0000058A
	bl FUN_0200604C
_0225FE54:
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	adds r0, r5, #0
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov92_02260A38
_0225FE66:
	ldr r1, [sp, #0x10]
	ldr r0, _0225FE84 @ =0x00001FD4
	str r1, [r5, r0]
	ldr r1, [sp, #0xc]
	adds r0, r0, #4
	str r1, [r5, r0]
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	nop
_0225FE78: .4byte 0x00002B84
_0225FE7C: .4byte 0x02263C3C
_0225FE80: .4byte 0x02263C34
_0225FE84: .4byte 0x00001FD4
_0225FE88: .4byte 0x02263C5C
_0225FE8C: .4byte 0x00001FC8
_0225FE90: .4byte 0x3FF0A3D7
_0225FE94: .4byte 0x00001FD8
_0225FE98: .4byte 0x3E6147AE
_0225FE9C: .4byte 0x00001FCC
_0225FEA0: .4byte 0x3DCCCCCD
_0225FEA4: .4byte 0xC28F5C29
_0225FEA8: .4byte 0x3FCC28F5
_0225FEAC: .4byte 0x02263C68
_0225FEB0: .4byte 0x0000058A
	thumb_func_end ov92_0225FC9C

	thumb_func_start ov92_0225FEB4
ov92_0225FEB4: @ 0x0225FEB4
	ldr r2, _0225FEE0 @ =0x00002B20
	movs r3, #0
	adds r1, r2, #0
	strh r3, [r0, r2]
	subs r1, #0x40
	str r3, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x64
	str r3, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x68
	str r3, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x6c
	str r3, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x70
	str r3, [r0, r1]
	subs r2, #0x34
	str r3, [r0, r2]
	bx lr
	nop
_0225FEE0: .4byte 0x00002B20
	thumb_func_end ov92_0225FEB4

	thumb_func_start ov92_0225FEE4
ov92_0225FEE4: @ 0x0225FEE4
	ldr r2, _0225FF14 @ =0x00002AFE
	ldrsh r1, [r0, r2]
	cmp r1, #0x95
	blt _0225FF12
	adds r1, r2, #0
	subs r1, #0xa
	ldr r3, [r0, r1]
	cmp r3, #8
	beq _0225FF12
	subs r1, r2, #6
	str r3, [r0, r1]
	adds r1, r2, #0
	subs r1, #0xa
	ldr r1, [r0, r1]
	adds r3, r1, #1
	adds r1, r2, #0
	subs r1, #0xa
	str r3, [r0, r1]
	movs r1, #0
	strh r1, [r0, r2]
	ldr r1, _0225FF18 @ =0x000021A4
	movs r2, #1
	str r2, [r0, r1]
_0225FF12:
	bx lr
	.align 2, 0
_0225FF14: .4byte 0x00002AFE
_0225FF18: .4byte 0x000021A4
	thumb_func_end ov92_0225FEE4

	thumb_func_start ov92_0225FF1C
ov92_0225FF1C: @ 0x0225FF1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	ldr r1, _0226023C @ =0x02263C34
	adds r5, r0, #0
	ldrh r3, [r1, #0x20]
	add r0, sp, #0x18
	add r2, sp, #0x18
	strh r3, [r0]
	ldrh r3, [r1, #0x22]
	strh r3, [r0, #2]
	ldrh r3, [r1, #0x24]
	ldrh r1, [r1, #0x26]
	strh r3, [r0, #4]
	strh r1, [r0, #6]
	ldr r1, _02260240 @ =0x00002AE0
	ldr r0, [r5, r1]
	adds r0, r0, #1
	str r0, [r5, r1]
	adds r0, r1, #0
	adds r0, #0x40
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bne _0225FF4C
	b _02260090
_0225FF4C:
	adds r0, r1, #0
	adds r0, #0x42
	ldrsh r0, [r5, r0]
	cmp r0, #9
	bge _0225FFC4
	cmp r0, #8
	bgt _0225FFAE
	adds r0, r1, #0
	adds r0, #0x74
	ldr r7, [r5, r0]
	adds r0, r1, #0
	adds r0, #0x8c
	adds r1, #0x74
	ldr r6, [r5, r0]
	adds r0, r5, r1
	bl ov92_022607F8
	str r0, [sp, #0x10]
	ldr r0, _02260244 @ =0x00002B6C
	adds r0, r5, r0
	bl ov92_022607F8
	ldr r2, _02260248 @ =0x00002B54
	ldr r1, [r5, r2]
	adds r2, #0x18
	subs r1, r1, r7
	lsls r1, r1, #4
	asrs r1, r1, #0x10
	str r1, [sp, #0xc]
	ldr r1, [r5, r2]
	subs r1, r1, r6
	lsls r1, r1, #4
	asrs r4, r1, #0x10
	ldr r1, [sp, #0x10]
	cmp r1, #1
	beq _0225FF98
	cmp r0, #1
	bne _02260028
_0225FF98:
	ldr r1, _02260248 @ =0x00002B54
	ldr r0, [r5, r1]
	subs r0, r0, r7
	str r0, [r5, r1]
	adds r0, r1, #0
	adds r0, #0x18
	ldr r0, [r5, r0]
	adds r1, #0x18
	subs r0, r0, r6
	str r0, [r5, r1]
	b _02260028
_0225FFAE:
	adds r0, r1, #0
	adds r0, #0x74
	ldr r0, [r5, r0]
	adds r1, #0x8c
	lsls r0, r0, #4
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	lsls r0, r0, #4
	asrs r4, r0, #0x10
	b _02260028
_0225FFC4:
	adds r0, r1, #0
	adds r0, #0x44
	ldr r7, [r5, r0]
	adds r0, r1, #0
	adds r0, #0x5c
	adds r1, #0x44
	ldr r6, [r5, r0]
	adds r0, r5, r1
	bl ov92_022607F8
	str r0, [sp, #0x14]
	ldr r0, _0226024C @ =0x00002B3C
	adds r0, r5, r0
	bl ov92_022607F8
	ldr r2, _02260250 @ =0x00002B24
	ldr r1, [r5, r2]
	adds r2, #0x18
	subs r1, r1, r7
	lsls r1, r1, #4
	asrs r1, r1, #0x10
	str r1, [sp, #0xc]
	ldr r1, [r5, r2]
	subs r1, r1, r6
	lsls r1, r1, #4
	asrs r4, r1, #0x10
	ldr r1, [sp, #0x14]
	cmp r1, #1
	beq _02260002
	cmp r0, #1
	bne _02260028
_02260002:
	ldr r0, _02260254 @ =0x00002B88
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02260028
	movs r1, #1
	str r1, [r5, r0]
	adds r1, r0, #0
	subs r1, #0x64
	ldr r1, [r5, r1]
	subs r2, r1, r7
	adds r1, r0, #0
	subs r1, #0x64
	str r2, [r5, r1]
	adds r1, r0, #0
	subs r1, #0x4c
	ldr r1, [r5, r1]
	subs r0, #0x4c
	subs r1, r1, r6
	str r1, [r5, r0]
_02260028:
	ldr r0, _02260258 @ =0x3FF0A3D7
	str r4, [sp]
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r0, #0x45
	lsls r0, r0, #2
	ldr r3, [sp, #0xc]
	adds r0, r5, r0
	adds r2, r1, #0
	bl ov92_02260428
	movs r1, #0
	ldr r0, _0226025C @ =0x3F4CCCCD
	str r4, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r3, [sp, #0xc]
	adds r0, r5, r0
	adds r2, r1, #0
	bl ov92_02260428
	cmp r0, #0
	beq _0226007A
	ldr r4, _02260260 @ =0x02263C8C
	add r3, sp, #0x38
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #0x4d
	str r0, [r3]
	adds r0, r2, #0
	ldr r2, _02260264 @ =0x00001FC8
	lsls r1, r1, #4
	adds r1, r5, r1
	adds r2, r5, r2
	blx FUN_020CBE9C
_0226007A:
	ldr r0, _02260268 @ =0x00002B22
	add sp, #0x44
	ldrsh r1, [r5, r0]
	adds r1, r1, #1
	strh r1, [r5, r0]
	subs r1, r0, #2
	ldrsh r1, [r5, r1]
	subs r0, r0, #2
	subs r1, r1, #1
	strh r1, [r5, r0]
	pop {r4, r5, r6, r7, pc}
_02260090:
	ldr r0, [r5, r1]
	adds r1, #0xc
	ldr r1, [r5, r1]
	lsls r1, r1, #1
	ldrsh r1, [r2, r1]
	blx FUN_020F2998
	cmp r1, #0
	bne _022600AE
	ldr r0, _02260240 @ =0x00002AE0
	movs r1, #0
	str r1, [r5, r0]
	movs r1, #1
	adds r0, #0xac
	str r1, [r5, r0]
_022600AE:
	ldr r1, _0226026C @ =0x00002B84
	ldr r2, [r5, r1]
	cmp r2, #0
	bne _02260124
	adds r0, r1, #4
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _02260124
	adds r0, r1, #0
	subs r0, #0x48
	ldr r0, [r5, r0]
	subs r1, #0x60
	lsls r0, r0, #4
	asrs r4, r0, #0x10
	ldr r0, [r5, r1]
	movs r1, #0
	lsls r0, r0, #4
	asrs r6, r0, #0x10
	ldr r0, _02260258 @ =0x3FF0A3D7
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r6, #0
	str r1, [sp, #8]
	bl ov92_02260428
	movs r1, #0
	ldr r0, _0226025C @ =0x3F4CCCCD
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r6, #0
	str r1, [sp, #8]
	bl ov92_02260428
	cmp r0, #0
	beq _02260194
	ldr r4, _02260270 @ =0x02263C74
	add r3, sp, #0x2c
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #0x4d
	str r0, [r3]
	adds r0, r2, #0
	ldr r2, _02260264 @ =0x00001FC8
	lsls r1, r1, #4
	adds r1, r5, r1
	adds r2, r5, r2
	blx FUN_020CBE9C
	b _02260194
_02260124:
	cmp r2, #1
	bne _02260194
	ldr r1, _02260254 @ =0x00002B88
	ldr r0, [r5, r1]
	cmp r0, #1
	bne _02260194
	adds r0, r1, #0
	subs r0, #0x4c
	ldr r0, [r5, r0]
	subs r1, #0x64
	lsls r0, r0, #4
	asrs r4, r0, #0x10
	ldr r0, [r5, r1]
	movs r1, #0
	lsls r0, r0, #4
	asrs r6, r0, #0x10
	ldr r0, _02260258 @ =0x3FF0A3D7
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r6, #0
	str r1, [sp, #8]
	bl ov92_02260428
	movs r1, #0
	ldr r0, _0226025C @ =0x3F4CCCCD
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r6, #0
	str r1, [sp, #8]
	bl ov92_02260428
	cmp r0, #0
	beq _02260194
	ldr r4, _02260274 @ =0x02263C80
	add r3, sp, #0x20
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #0x4d
	str r0, [r3]
	adds r0, r2, #0
	ldr r2, _02260264 @ =0x00001FC8
	lsls r1, r1, #4
	adds r1, r5, r1
	adds r2, r5, r2
	blx FUN_020CBE9C
_02260194:
	ldr r1, _02260278 @ =0x00002B90
	ldr r0, [r5, r1]
	cmp r0, #0
	beq _022601AE
	subs r0, r1, #4
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _022601AC
	subs r1, #8
	ldr r0, [r5, r1]
	cmp r0, #1
	beq _022601AE
_022601AC:
	b _02260408
_022601AE:
	bl FUN_0201FD2C
	adds r4, r0, #0
	bl FUN_0201FD44
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_0201FD38
	adds r0, r6, #0
	movs r1, #0x64
	blx FUN_020F2BA4
	ldr r0, _0226027C @ =0x00002AEC
	adds r4, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0
	lsls r7, r0, #5
	ldr r0, _02260280 @ =0x02263D88
	adds r3, r1, #0
	ldr r2, [r0, r7]
	ldr r0, _02260284 @ =0x02263D84
	adds r0, r0, r7
_022601DC:
	cmp r4, r2
	blt _022601EE
	adds r6, r3, r0
	ldr r6, [r6, #0xc]
	adds r1, r1, #1
	adds r2, r2, r6
	adds r3, #8
	cmp r1, #3
	blt _022601DC
_022601EE:
	ldr r0, _02260284 @ =0x02263D84
	lsls r1, r1, #3
	adds r0, r0, r7
	ldr r6, [r1, r0]
	ldr r1, _02260264 @ =0x00001FC8
	ldr r0, [r5, r1]
	adds r1, #8
	lsls r0, r0, #4
	ldr r1, [r5, r1]
	asrs r7, r0, #0x10
	lsls r0, r1, #4
	asrs r0, r0, #0x10
	cmp r1, #0
	bne _02260224
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r0, r0, #0x1f
	subs r0, r0, r1
	movs r4, #0x1f
	rors r0, r4
	adds r0, r1, r0
	beq _02260220
	movs r4, #1
	b _02260236
_02260220:
	subs r4, #0x20
	b _02260236
_02260224:
	cmp r0, #0
	blt _0226022C
	movs r0, #1
	b _02260230
_0226022C:
	movs r0, #0
	mvns r0, r0
_02260230:
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
_02260236:
	ldr r0, _02260264 @ =0x00001FC8
	b _02260288
	nop
_0226023C: .4byte 0x02263C34
_02260240: .4byte 0x00002AE0
_02260244: .4byte 0x00002B6C
_02260248: .4byte 0x00002B54
_0226024C: .4byte 0x00002B3C
_02260250: .4byte 0x00002B24
_02260254: .4byte 0x00002B88
_02260258: .4byte 0x3FF0A3D7
_0226025C: .4byte 0x3F4CCCCD
_02260260: .4byte 0x02263C8C
_02260264: .4byte 0x00001FC8
_02260268: .4byte 0x00002B22
_0226026C: .4byte 0x00002B84
_02260270: .4byte 0x02263C74
_02260274: .4byte 0x02263C80
_02260278: .4byte 0x00002B90
_0226027C: .4byte 0x00002AEC
_02260280: .4byte 0x02263D88
_02260284: .4byte 0x02263D84
_02260288:
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _022602A8
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r0, r0, #0x1f
	subs r0, r0, r2
	movs r1, #0x1f
	rors r0, r1
	adds r0, r2, r0
	beq _022602A4
	movs r1, #1
	b _022602C2
_022602A4:
	subs r1, #0x20
	b _022602C2
_022602A8:
	cmp r7, #0
	blt _022602B0
	movs r1, #1
	b _022602B4
_022602B0:
	movs r1, #0
	mvns r1, r1
_022602B4:
	cmp r4, #0
	bge _022602C2
	movs r0, #0
	mvns r0, r0
	muls r0, r1, r0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
_022602C2:
	ldr r0, _0226040C @ =0x00002AEC
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _022602CC
	movs r1, #0
_022602CC:
	adds r0, r6, #0
	muls r0, r1, r0
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	adds r0, r6, #0
	muls r0, r4, r0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #0x14
	adds r2, r1, #0
	muls r2, r0, r2
	muls r0, r4, r0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r0, _02260410 @ =0x00002B98
	lsls r1, r2, #0x10
	strh r7, [r5, r0]
	adds r0, r0, #2
	asrs r1, r1, #0x10
	strh r6, [r5, r0]
	cmp r1, #0
	ble _0226030A
	lsls r0, r1, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02260318
_0226030A:
	lsls r0, r1, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02260318:
	blx FUN_020F2104
	adds r2, r0, #0
	movs r0, #8
	str r0, [sp]
	ldr r0, _02260414 @ =0x00002B54
	movs r1, #0
	adds r0, r5, r0
	adds r3, r1, #0
	bl ov92_02260798
	cmp r4, #0
	ble _02260344
	lsls r0, r4, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02260352
_02260344:
	lsls r0, r4, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02260352:
	blx FUN_020F2104
	adds r2, r0, #0
	movs r0, #8
	str r0, [sp]
	ldr r0, _02260418 @ =0x00002B6C
	movs r1, #0
	adds r0, r5, r0
	adds r3, r1, #0
	bl ov92_02260798
	cmp r7, #0
	ble _0226037E
	lsls r0, r7, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0226038C
_0226037E:
	lsls r0, r7, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0226038C:
	blx FUN_020F2104
	adds r2, r0, #0
	movs r0, #0xc
	str r0, [sp]
	ldr r0, _0226041C @ =0x00002B24
	movs r1, #0
	adds r0, r5, r0
	adds r3, r1, #0
	bl ov92_02260798
	cmp r6, #0
	ble _022603B8
	lsls r0, r6, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022603C6
_022603B8:
	lsls r0, r6, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022603C6:
	blx FUN_020F2104
	adds r2, r0, #0
	movs r0, #0xc
	str r0, [sp]
	ldr r0, _02260420 @ =0x00002B3C
	movs r1, #0
	adds r0, r5, r0
	adds r3, r1, #0
	bl ov92_02260798
	ldr r0, _02260424 @ =0x00002B20
	movs r1, #0x16
	strh r1, [r5, r0]
	movs r1, #0
	adds r2, r0, #2
	strh r1, [r5, r2]
	subs r2, r0, #4
	strh r7, [r5, r2]
	subs r2, r0, #2
	strh r6, [r5, r2]
	adds r2, r0, #0
	adds r2, #0x64
	str r1, [r5, r2]
	adds r2, r0, #0
	adds r2, #0x6c
	str r1, [r5, r2]
	adds r2, r0, #0
	adds r2, #0x68
	str r1, [r5, r2]
	movs r1, #1
	adds r0, #0x70
	str r1, [r5, r0]
_02260408:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0226040C: .4byte 0x00002AEC
_02260410: .4byte 0x00002B98
_02260414: .4byte 0x00002B54
_02260418: .4byte 0x00002B6C
_0226041C: .4byte 0x00002B24
_02260420: .4byte 0x00002B3C
_02260424: .4byte 0x00002B20
	thumb_func_end ov92_0225FF1C

	thumb_func_start ov92_02260428
ov92_02260428: @ 0x02260428
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	adds r5, r0, #0
	ldr r0, [sp, #0x64]
	adds r4, r1, #0
	adds r6, r3, #0
	adds r7, r2, #0
	blx FUN_020F2080
	str r0, [sp, #0x10]
	subs r0, r4, r6
	str r1, [sp, #4]
	blx FUN_020F0BD8
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _02260610 @ =0x147AE148
	ldr r1, _02260614 @ =0x3F7547AE
	blx FUN_020F0C54
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #4]
	blx FUN_020F0C54
	blx FUN_020F09A4
	adds r6, r0, #0
	ldr r0, [sp, #0x64]
	blx FUN_020F2080
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x60]
	adds r4, r1, #0
	subs r0, r7, r0
	blx FUN_020F0BD8
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _02260618 @ =0x55555555
	ldr r1, _0226061C @ =0x3F755555
	blx FUN_020F0C54
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, [sp, #0x14]
	adds r1, r4, #0
	blx FUN_020F0C54
	blx FUN_020F09A4
	adds r4, r0, #0
	ldr r0, [sp, #0x68]
	cmp r0, #0
	beq _022604DC
	movs r0, #0x7f
	lsls r0, r0, #2
	str r6, [r5, r0]
	adds r1, r0, #4
	str r4, [r5, r1]
	subs r1, r0, #4
	movs r2, #8
	str r2, [r5, r1]
	subs r0, r0, #4
	ldr r0, [r5, r0]
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	blx FUN_020F1CC8
	movs r1, #0x81
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0xc
	ldr r0, [r5, r1]
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	blx FUN_020F1CC8
	movs r1, #0x82
	lsls r1, r1, #2
	str r0, [r5, r1]
_022604DC:
	adds r0, r6, #0
	adds r1, r6, #0
	blx FUN_020F22DC
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r4, #0
	blx FUN_020F22DC
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F1520
	movs r1, #0
	adds r7, r0, #0
	blx FUN_020F1ACC
	ldr r0, _02260620 @ =0x45800000
	bls _02260514
	adds r1, r7, #0
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02260522
_02260514:
	adds r1, r7, #0
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02260522:
	blx FUN_020F2104
	blx FUN_020CCBEC
	adds r7, r0, #0
	blx FUN_020F2178
	ldr r1, _02260620 @ =0x45800000
	blx FUN_020F1CC8
	str r0, [sp, #0x18]
	blx FUN_020F2080
	adds r2, r0, #0
	movs r0, #0
	adds r3, r1, #0
	adds r1, r0, #0
	blx FUN_020F1A40
	beq _0226060A
	adds r0, r7, #0
	blx FUN_020CD4B0
	str r0, [sp, #0x1c]
	str r1, [sp, #0xc]
	adds r0, r7, #0
	blx FUN_020CD548
	str r0, [sp, #0x20]
	adds r7, r1, #0
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0xc]
	blx FUN_020F2208
	ldr r1, _02260624 @ =0x4F800000
	blx FUN_020F1CC8
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	adds r1, r7, #0
	blx FUN_020F2208
	ldr r1, _02260624 @ =0x4F800000
	blx FUN_020F1CC8
	adds r7, r0, #0
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x18]
	blx FUN_020F1CC8
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	str r7, [sp, #0x3c]
	blx FUN_020F22DC
	str r0, [sp, #0x40]
	ldr r1, [sp, #0x28]
	adds r0, r6, #0
	blx FUN_020F22DC
	movs r2, #0x19
	str r0, [sp, #0x44]
	movs r0, #0
	lsls r2, r2, #4
	str r0, [sp, #0x48]
	adds r0, r5, r2
	adds r2, #0x10
	add r1, sp, #0x3c
	adds r2, r5, r2
	bl ov92_02263108
	movs r1, #0x15
	lsls r1, r1, #4
	adds r0, r5, r1
	adds r1, #0x40
	adds r1, r5, r1
	bl ov92_022632E8
	movs r1, #0x1a
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0x10
	adds r1, r5, r1
	bl ov92_022630F8
	movs r1, #0x15
	lsls r1, r1, #4
	adds r0, r5, r1
	adds r1, #0x60
	adds r1, r5, r1
	bl ov92_02263824
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r5, r0
	bl ov92_0226325C
	movs r7, #0x19
	lsls r7, r7, #4
	add r3, sp, #0x2c
	adds r4, r5, r7
	adds r6, r0, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r1, r2, #0
	adds r0, r5, r7
	adds r2, r6, #0
	bl ov92_022632B4
	add sp, #0x4c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0226060A:
	movs r0, #0
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02260610: .4byte 0x147AE148
_02260614: .4byte 0x3F7547AE
_02260618: .4byte 0x55555555
_0226061C: .4byte 0x3F755555
_02260620: .4byte 0x45800000
_02260624: .4byte 0x4F800000
	thumb_func_end ov92_02260428

	thumb_func_start ov92_02260628
ov92_02260628: @ 0x02260628
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	movs r1, #0x7f
	lsls r1, r1, #2
	adds r5, r0, #0
	adds r0, r1, #4
	ldr r4, [r5, r1]
	ldr r0, [r5, r0]
	adds r1, #8
	str r0, [sp]
	ldr r1, [r5, r1]
	adds r0, r4, #0
	blx FUN_020F24C8
	movs r1, #0x7f
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #4
	adds r1, #0xc
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	blx FUN_020F24C8
	movs r1, #2
	lsls r1, r1, #8
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #8
	ldr r0, [r5, r0]
	subs r1, #8
	subs r0, r0, #1
	str r0, [r5, r1]
	adds r0, r4, #0
	adds r1, r4, #0
	blx FUN_020F22DC
	adds r6, r0, #0
	ldr r0, [sp]
	adds r1, r0, #0
	blx FUN_020F22DC
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020F1520
	movs r1, #0
	adds r6, r0, #0
	blx FUN_020F1ACC
	ldr r0, _02260774 @ =0x45800000
	bls _022606A0
	adds r1, r6, #0
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022606AE
_022606A0:
	adds r1, r6, #0
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022606AE:
	blx FUN_020F2104
	blx FUN_020CCBEC
	adds r6, r0, #0
	blx FUN_020F2178
	ldr r1, _02260774 @ =0x45800000
	blx FUN_020F1CC8
	str r0, [sp, #4]
	blx FUN_020F2080
	adds r2, r0, #0
	movs r0, #0
	adds r3, r1, #0
	adds r1, r0, #0
	blx FUN_020F1A40
	beq _0226076E
	adds r0, r6, #0
	blx FUN_020CD4B0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r7, r1, #0
	blx FUN_020CD548
	str r0, [sp, #0xc]
	adds r6, r1, #0
	ldr r0, [sp, #8]
	adds r1, r7, #0
	blx FUN_020F2208
	ldr r1, _02260778 @ =0x4F800000
	blx FUN_020F1CC8
	adds r7, r0, #0
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	blx FUN_020F2208
	ldr r1, _02260778 @ =0x4F800000
	blx FUN_020F1CC8
	adds r6, r0, #0
	ldr r1, [sp, #4]
	adds r0, r7, #0
	blx FUN_020F1CC8
	adds r7, r0, #0
	ldr r0, [sp]
	adds r1, r7, #0
	str r6, [sp, #0x10]
	blx FUN_020F22DC
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r1, r7, #0
	blx FUN_020F22DC
	movs r2, #0x19
	str r0, [sp, #0x18]
	movs r0, #0
	lsls r2, r2, #4
	str r0, [sp, #0x1c]
	adds r0, r5, r2
	adds r2, #0x10
	add r1, sp, #0x10
	adds r2, r5, r2
	bl ov92_02263108
	movs r1, #0x15
	lsls r1, r1, #4
	adds r0, r5, r1
	adds r1, #0x40
	adds r1, r5, r1
	bl ov92_022632E8
	movs r1, #0x1a
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0x10
	adds r1, r5, r1
	bl ov92_022630F8
	movs r1, #0x15
	lsls r1, r1, #4
	adds r0, r5, r1
	adds r1, #0x60
	adds r1, r5, r1
	bl ov92_02263824
	add sp, #0x20
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0226076E:
	movs r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02260774: .4byte 0x45800000
_02260778: .4byte 0x4F800000
	thumb_func_end ov92_02260628

	thumb_func_start ov92_0226077C
ov92_0226077C: @ 0x0226077C
	movs r3, #0
_0226077E:
	adds r2, r0, #0
	adds r2, #0xbc
	ldr r2, [r2]
	cmp r1, r2
	bne _0226078C
	adds r0, r3, #0
	bx lr
_0226078C:
	adds r3, r3, #1
	adds r0, r0, #4
	cmp r3, #4
	blt _0226077E
	movs r0, #0xff
	bx lr
	thumb_func_end ov92_0226077C

	thumb_func_start ov92_02260798
ov92_02260798: @ 0x02260798
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
	thumb_func_end ov92_02260798

	thumb_func_start ov92_022607F8
ov92_022607F8: @ 0x022607F8
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
	bgt _02260858
	str r0, [r5, #0x10]
	movs r0, #0
	pop {r4, r5, r6, pc}
_02260858:
	str r1, [r5, #0x10]
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov92_022607F8

	thumb_func_start ov92_02260860
ov92_02260860: @ 0x02260860
	str r1, [r0]
	str r1, [r0, #4]
	subs r1, r2, r1
	str r1, [r0, #0xc]
	movs r1, #0
	str r1, [r0, #0x10]
	str r3, [r0, #0x14]
	bx lr
	thumb_func_end ov92_02260860

	thumb_func_start ov92_02260870
ov92_02260870: @ 0x02260870
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r2, [r5, #0x14]
	ldr r0, [r5, #0x10]
	cmp r0, r2
	blt _02260880
	movs r4, #1
	b _02260888
_02260880:
	adds r2, r0, #0
	adds r0, r0, #1
	str r0, [r5, #0x10]
	movs r4, #0
_02260888:
	ldr r0, [r5, #0xc]
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
	ldr r1, [r5, #0x14]
	lsls r1, r1, #0xc
	blx FUN_020CCBA0
	ldr r1, [r5, #4]
	adds r0, r0, r1
	str r0, [r5]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov92_02260870

	thumb_func_start ov92_022608B8
ov92_022608B8: @ 0x022608B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x74
	ldr r3, _02260A28 @ =0x02263E70
	adds r6, r0, #0
	movs r0, #1
	str r1, [sp, #4]
	str r0, [sp, #0x18]
	add r2, sp, #0x3c
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r3, _02260A2C @ =0x02263E88
	add r2, sp, #0x24
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	bl FUN_0200FB5C
	cmp r0, #0
	beq _022608FA
	ldr r0, [sp, #4]
	adds r0, #0xa4
	ldr r0, [r0]
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _0226091C
_022608FA:
	ldr r5, [sp, #4]
	movs r4, #0
_022608FE:
	ldr r0, [r5, #8]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _022608FE
	ldr r0, [sp, #4]
	movs r1, #0
	str r1, [r0]
	adds r0, r6, #0
	bl FUN_0200E390
	add sp, #0x74
	pop {r4, r5, r6, r7, pc}
_0226091C:
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0226092A
	cmp r0, #1
	beq _02260994
	b _02260A06
_0226092A:
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r7, sp, #0x3c
	adds r6, r0, #0
	adds r5, r0, #0
	str r0, [sp, #0x10]
	adds r6, #0x14
	add r4, sp, #0x24
	adds r5, #0x2c
_0226093E:
	ldr r0, [sp, #0x10]
	add r1, sp, #0x20
	ldr r0, [r0, #8]
	add r2, sp, #0x1c
	bl FUN_0200DF2C
	ldr r1, [sp, #0x20]
	movs r0, #8
	str r0, [sp]
	ldr r2, [r7]
	ldr r3, _02260A30 @ =0x000004CD
	adds r0, r6, #0
	adds r2, r1, r2
	bl ov92_02260798
	ldr r1, [sp, #0x1c]
	movs r0, #8
	str r0, [sp]
	ldr r2, [r4]
	ldr r3, _02260A34 @ =0x00000333
	adds r0, r5, #0
	adds r2, r1, r2
	bl ov92_02260798
	ldr r0, [sp, #0x10]
	adds r7, r7, #4
	adds r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	adds r6, #0x30
	adds r0, r0, #1
	adds r4, r4, #4
	adds r5, #0x30
	str r0, [sp, #8]
	cmp r0, #3
	blt _0226093E
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	adds r1, r0, #1
	ldr r0, [sp, #4]
	add sp, #0x74
	str r1, [r0, #4]
	pop {r4, r5, r6, r7, pc}
_02260994:
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	ldr r7, [sp, #4]
	ldr r6, [sp, #4]
	str r0, [sp, #0x14]
	adds r0, #0x14
	str r0, [sp, #0x14]
	add r4, sp, #0x54
	adds r7, #0x2c
	adds r5, r6, #0
_022609AA:
	ldr r0, [sp, #0x14]
	bl ov92_022607F8
	str r0, [r4]
	adds r0, r7, #0
	bl ov92_022607F8
	str r0, [r4, #4]
	ldr r0, [r5, #8]
	ldr r1, [r6, #0x14]
	ldr r2, [r6, #0x2c]
	bl FUN_0200DF08
	ldr r0, [r4]
	cmp r0, #0
	beq _022609D0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _022609D4
_022609D0:
	movs r0, #0
	str r0, [sp, #0x18]
_022609D4:
	ldr r0, [r5, #8]
	bl FUN_0200DC18
	ldr r0, [sp, #0x14]
	adds r4, #8
	adds r0, #0x30
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	adds r7, #0x30
	adds r0, r0, #1
	adds r6, #0x30
	adds r5, r5, #4
	str r0, [sp, #0xc]
	cmp r0, #3
	blt _022609AA
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _02260A24
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	adds r1, r0, #1
	ldr r0, [sp, #4]
	add sp, #0x74
	str r1, [r0, #4]
	pop {r4, r5, r6, r7, pc}
_02260A06:
	ldr r4, [sp, #4]
	movs r5, #0
_02260A0A:
	ldr r0, [r4, #8]
	bl FUN_0200D9DC
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #3
	blt _02260A0A
	ldr r0, [sp, #4]
	movs r1, #0
	str r1, [r0]
	adds r0, r6, #0
	bl FUN_0200E390
_02260A24:
	add sp, #0x74
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02260A28: .4byte 0x02263E70
_02260A2C: .4byte 0x02263E88
_02260A30: .4byte 0x000004CD
_02260A34: .4byte 0x00000333
	thumb_func_end ov92_022608B8

	thumb_func_start ov92_02260A38
ov92_02260A38: @ 0x02260A38
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, [sp]
	ldr r1, _02260AD0 @ =0x00002490
	adds r5, r2, #0
	movs r0, #0
_02260A48:
	ldr r2, [r3, r1]
	cmp r2, #1
	beq _02260AC4
	movs r1, #0xa8
	muls r1, r0, r1
	str r1, [sp, #0xc]
	ldr r1, [sp]
	movs r7, #0
	ldr r3, [r1, #0x14]
	adds r2, r1, #0
	ldr r1, [sp, #0xc]
	adds r6, r7, #0
	adds r4, r2, r1
	ldr r2, _02260AD4 @ =0x00002534
	adds r1, r2, #0
	str r3, [r4, r2]
	subs r1, #0xa0
	str r7, [r4, r1]
	ldr r1, [sp]
	subs r2, #0xa4
	adds r1, r1, r2
	str r1, [sp, #0x10]
	adds r2, r1, #0
	ldr r1, [sp, #0xc]
	movs r3, #1
	str r3, [r2, r1]
	adds r1, r0, #1
	ldr r0, [sp, #4]
	muls r1, r0, r1
	str r1, [sp, #8]
_02260A84:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	adds r2, r5, #0
	bl ov92_0225E7E4
	ldr r1, _02260AD8 @ =0x00002498
	str r0, [r4, r1]
	ldr r0, [sp, #8]
	adds r1, r6, r5
	adds r0, r0, r1
	movs r1, #3
	blx FUN_020F2998
	ldr r0, _02260AD8 @ =0x00002498
	ldr r0, [r4, r0]
	bl FUN_0200DC4C
	adds r7, r7, #1
	adds r4, r4, #4
	adds r6, r6, r5
	cmp r7, #3
	blt _02260A84
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r0, _02260ADC @ =ov92_022608B8
	adds r1, r2, r1
	movs r2, #1
	lsls r2, r2, #0xc
	bl FUN_0200E320
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02260AC4:
	adds r0, r0, #1
	adds r3, #0xa8
	cmp r0, #8
	blt _02260A48
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02260AD0: .4byte 0x00002490
_02260AD4: .4byte 0x00002534
_02260AD8: .4byte 0x00002498
_02260ADC: .4byte ov92_022608B8
	thumb_func_end ov92_02260A38

	thumb_func_start ov92_02260AE0
ov92_02260AE0: @ 0x02260AE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r4, r0, #0
	ldr r0, [r1]
	str r1, [sp]
	ldr r5, [r0, #0x14]
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02260AFC
	adds r5, #0x34
	ldrb r0, [r5]
	cmp r0, #1
	bne _02260B14
_02260AFC:
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0, #0x10]
	str r1, [r0]
	adds r0, r4, #0
	bl FUN_0200E390
	ldr r0, [sp]
	bl FUN_0201AB0C
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
_02260B14:
	ldr r0, [sp]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02260B28
	cmp r0, #1
	beq _02260B36
	cmp r0, #2
	bne _02260B26
	b _02260D86
_02260B26:
	b _022610BE
_02260B28:
	ldr r0, [sp]
	movs r1, #0
	str r1, [r0, #0xc]
	ldr r0, [r0, #4]
	adds r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
_02260B36:
	ldr r3, _02260E74 @ =0x02263E5C
	add r2, sp, #0x1c
	movs r1, #0xa
_02260B3C:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _02260B3C
	ldr r0, [sp]
	movs r5, #0
	ldr r0, [r0, #0xc]
	movs r6, #0x3f
	lsls r1, r0, #2
	add r0, sp, #0x1c
	ldrsh r0, [r0, r1]
	str r5, [sp, #0xc]
	lsls r6, r6, #0x18
	str r0, [sp, #0x18]
	add r0, sp, #0x1c
	adds r0, #2
	ldrsh r0, [r0, r1]
	str r0, [sp, #0x14]
	ldr r0, [sp]
	str r5, [r0, #8]
	adds r4, r0, #0
	ldr r0, [sp, #0x18]
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	lsls r0, r0, #0xc
	str r0, [sp, #4]
_02260B76:
	lsrs r2, r5, #0x1f
	lsls r1, r5, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r4, #0
	adds r1, r2, r1
	adds r0, #0x3a
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #3
	blx FUN_020F2998
	adds r7, r1, #0
	movs r0, #6
	subs r0, r0, r7
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	adds r0, r4, #0
	adds r0, #0x42
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x44
	strh r1, [r0]
	ldr r0, [sp]
	ldr r1, [r0]
	ldr r0, [sp, #0xc]
	adds r0, r1, r0
	ldr r0, [r0, #0x40]
	movs r1, #3
	str r0, [r4, #0x14]
	adds r0, r5, #0
	blx FUN_020F2998
	movs r1, #0x1e
	muls r1, r0, r1
	str r1, [r4, #0x3c]
	adds r0, r1, #0
	movs r1, #0x5a
	lsls r1, r1, #2
	blx FUN_020F2998
	str r1, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0
	strh r0, [r1]
	lsls r0, r7, #1
	rsbs r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x46
	strh r1, [r0]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _02260BF4
	ldr r0, [sp, #8]
	blx FUN_020F21C0
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020F1520
	b _02260C00
_02260BF4:
	ldr r0, [sp, #8]
	blx FUN_020F21C0
	adds r1, r6, #0
	blx FUN_020F24C8
_02260C00:
	blx FUN_020F2104
	str r0, [r4, #0x20]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _02260C1C
	ldr r0, [sp, #4]
	blx FUN_020F21C0
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020F1520
	b _02260C28
_02260C1C:
	ldr r0, [sp, #4]
	blx FUN_020F21C0
	adds r1, r6, #0
	blx FUN_020F24C8
_02260C28:
	blx FUN_020F2104
	str r0, [r4, #0x24]
	movs r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r0, [r4, #0x28]
	adds r1, r4, #0
	str r0, [r4, #0x2c]
	adds r1, #0x38
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x39
	movs r0, #1
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x3b
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r4, #0x3c]
	cmp r0, #0xb4
	bne _02260C60
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #2
	strb r0, [r1]
_02260C60:
	ldr r1, [r4, #0x3c]
	ldr r0, _02260E78 @ =0x0000010E
	cmp r1, r0
	blt _02260C74
	cmp r1, #0x5a
	bgt _02260C74
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
_02260C74:
	movs r0, #0x42
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02260C8C
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020F1520
	b _02260C98
_02260C8C:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r6, #0
	blx FUN_020F24C8
_02260C98:
	blx FUN_020F2104
	adds r7, r0, #0
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	asrs r1, r0, #0x1f
	asrs r3, r7, #0x1f
	adds r2, r7, #0
	blx FUN_020F2948
	movs r2, #2
	lsls r2, r2, #0xa
	adds r2, r0, r2
	ldr r0, _02260E7C @ =0x00000000
	adcs r1, r0
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r4, #0x30]
	movs r0, #0x44
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02260CDC
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020F1520
	b _02260CE8
_02260CDC:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r6, #0
	blx FUN_020F24C8
_02260CE8:
	blx FUN_020F2104
	adds r7, r0, #0
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	asrs r1, r0, #0x1f
	asrs r3, r7, #0x1f
	adds r2, r7, #0
	blx FUN_020F2948
	movs r2, #2
	lsls r2, r2, #0xa
	adds r2, r0, r2
	ldr r0, _02260E7C @ =0x00000000
	adcs r1, r0
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r4, #0x34]
	movs r0, #0x40
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02260D2C
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020F1520
	b _02260D38
_02260D2C:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r6, #0
	blx FUN_020F24C8
_02260D38:
	blx FUN_020F2104
	ldr r1, [r4, #0x1c]
	adds r0, r1, r0
	str r0, [r4, #0x1c]
	ldr r2, [r4, #0x28]
	ldr r1, [r4, #0x20]
	mov ip, r0
	adds r1, r2, r1
	ldr r7, [r4, #0x30]
	ldr r3, [r4, #0x18]
	adds r1, r7, r1
	adds r1, r3, r1
	ldr r3, [r4, #0x2c]
	ldr r2, [r4, #0x24]
	ldr r7, [r4, #0x34]
	adds r2, r3, r2
	adds r2, r7, r2
	mov r3, ip
	adds r2, r3, r2
	movs r3, #0xe
	ldr r0, [r4, #0x14]
	lsls r3, r3, #0x10
	bl FUN_0200DF44
	ldr r0, [sp, #0xc]
	adds r5, r5, #1
	adds r0, r0, #4
	adds r4, #0x34
	str r0, [sp, #0xc]
	cmp r5, #0x24
	bge _02260D7A
	b _02260B76
_02260D7A:
	ldr r0, [sp]
	ldr r0, [r0, #4]
	adds r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	b _022610D6
_02260D86:
	ldr r0, [sp]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02260DA4
	adds r1, r0, #1
	ldr r0, [sp]
	movs r2, #0
	str r1, [r0, #8]
	ldr r0, [r0]
	movs r1, #1
	bl ov92_0225DF0C
	ldr r0, _02260E80 @ =0x0000058B
	bl FUN_0200604C
_02260DA4:
	ldr r0, [sp]
	ldr r0, [r0, #8]
	cmp r0, #0x1e
	ble _02260DD0
	ldr r0, [sp]
	movs r1, #1
	str r1, [r0, #4]
	ldr r0, [r0, #0xc]
	ldr r1, [sp]
	adds r0, r0, #1
	str r0, [r1, #0xc]
	movs r1, #5
	blx FUN_020F2998
	ldr r0, [sp]
	movs r2, #1
	str r1, [r0, #0xc]
	ldr r0, [r0]
	movs r1, #0
	bl ov92_0225DF0C
	b _022610A8
_02260DD0:
	adds r1, r0, #1
	ldr r0, [sp]
	movs r4, #0x3f
	str r1, [r0, #8]
	movs r0, #0
	ldr r5, [sp]
	str r0, [sp, #0x10]
	lsls r4, r4, #0x18
_02260DE0:
	movs r0, #0x46
	ldrsh r0, [r5, r0]
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
	movs r0, #0x46
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bge _02260DF6
	b _0226109A
_02260DF6:
	adds r0, r5, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	adds r0, #0xa
	cmp r1, r0
	blt _02260EAE
	cmp r1, r0
	bne _02260E0E
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl FUN_0200DC4C
_02260E0E:
	movs r0, #0x46
	ldrsh r1, [r5, r0]
	adds r0, r5, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	adds r0, #0x12
	cmp r1, r0
	bne _02260E28
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	b _02260E46
_02260E28:
	lsrs r2, r1, #0x1f
	lsls r1, r1, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	beq _02260E46
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #1
	eors r1, r0
	adds r0, r5, #0
	adds r0, #0x39
	strb r1, [r0]
_02260E46:
	adds r1, r5, #0
	adds r1, #0x39
	ldrb r1, [r1]
	ldr r0, [r5, #0x14]
	bl FUN_0200DCE8
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _02260E66
	cmp r0, #1
	beq _02260E6C
	cmp r0, #2
	beq _02260E88
	b _02260E8E
_02260E66:
	ldr r0, _02260E84 @ =0xFFFFF000
	str r0, [r5, #0x28]
	b _02260E8E
_02260E6C:
	movs r0, #0
	str r0, [r5, #0x28]
	b _02260E8E
	nop
_02260E74: .4byte 0x02263E5C
_02260E78: .4byte 0x0000010E
_02260E7C: .4byte 0x00000000
_02260E80: .4byte 0x0000058B
_02260E84: .4byte 0xFFFFF000
_02260E88:
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [r5, #0x28]
_02260E8E:
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x3b
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	movs r1, #3
	blx FUN_020F2998
	adds r0, r5, #0
	adds r0, #0x3b
	strb r1, [r0]
_02260EAE:
	movs r0, #0x46
	ldrsh r1, [r5, r0]
	cmp r1, #5
	ble _02260EF6
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _02260EE8
	cmp r0, #1
	beq _02260ED8
	cmp r0, #2
	bne _02260EF6
	adds r0, r1, #5
	movs r1, #6
	blx FUN_020F2998
	adds r1, r5, #0
	adds r1, #0x40
	strh r0, [r1]
	b _02260EF6
_02260ED8:
	adds r0, r1, #5
	movs r1, #6
	blx FUN_020F2998
	adds r1, r5, #0
	adds r1, #0x40
	strh r0, [r1]
	b _02260EF6
_02260EE8:
	adds r0, r1, #5
	movs r1, #7
	blx FUN_020F2998
	adds r1, r5, #0
	adds r1, #0x40
	strh r0, [r1]
_02260EF6:
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _02260F54
	cmp r0, #1
	beq _02260F2E
	cmp r0, #2
	bne _02260F2E
	movs r0, #0x46
	ldrsh r0, [r5, r0]
	movs r1, #0x1e
	adds r2, r0, #5
	subs r2, r1, r2
	asrs r1, r2, #2
	lsrs r1, r1, #0x1d
	adds r1, r2, r1
	adds r2, r0, #7
	movs r0, #0x1e
	subs r2, r0, r2
	asrs r0, r2, #2
	lsrs r0, r0, #0x1d
	adds r0, r2, r0
	lsls r1, r1, #0xd
	lsls r0, r0, #0xd
	asrs r1, r1, #0x10
	asrs r0, r0, #0x10
	b _02260F78
_02260F2E:
	movs r0, #0x46
	ldrsh r0, [r5, r0]
	movs r1, #0x1e
	adds r2, r0, #5
	subs r2, r1, r2
	asrs r1, r2, #2
	lsrs r1, r1, #0x1d
	adds r1, r2, r1
	adds r2, r0, #6
	movs r0, #0x1e
	subs r2, r0, r2
	asrs r0, r2, #2
	lsrs r0, r0, #0x1d
	adds r0, r2, r0
	lsls r1, r1, #0xd
	lsls r0, r0, #0xd
	asrs r1, r1, #0x10
	asrs r0, r0, #0x10
	b _02260F78
_02260F54:
	movs r0, #0x46
	ldrsh r0, [r5, r0]
	movs r1, #0x1e
	adds r2, r0, #5
	subs r2, r1, r2
	asrs r1, r2, #2
	lsrs r1, r1, #0x1d
	adds r1, r2, r1
	adds r2, r0, #4
	movs r0, #0x1e
	subs r2, r0, r2
	asrs r0, r2, #2
	lsrs r0, r0, #0x1d
	adds r0, r2, r0
	lsls r1, r1, #0xd
	lsls r0, r0, #0xd
	asrs r1, r1, #0x10
	asrs r0, r0, #0x10
_02260F78:
	cmp r1, #0
	ble _02260F84
	movs r2, #0x42
	ldrsh r2, [r5, r2]
	adds r2, r2, r1
	b _02260F8A
_02260F84:
	movs r1, #0x42
	ldrsh r1, [r5, r1]
	adds r2, r1, #1
_02260F8A:
	adds r1, r5, #0
	adds r1, #0x42
	strh r2, [r1]
	cmp r0, #0
	ble _02260F9C
	movs r1, #0x44
	ldrsh r1, [r5, r1]
	adds r1, r1, r0
	b _02260FA2
_02260F9C:
	movs r0, #0x44
	ldrsh r0, [r5, r0]
	adds r1, r0, #1
_02260FA2:
	adds r0, r5, #0
	adds r0, #0x44
	strh r1, [r0]
	movs r0, #0x42
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _02260FC0
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020F1520
	b _02260FCC
_02260FC0:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r4, #0
	blx FUN_020F24C8
_02260FCC:
	blx FUN_020F2104
	adds r6, r0, #0
	ldr r0, [r5, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r2, #2
	lsls r2, r2, #0xa
	adds r2, r0, r2
	ldr r0, _022610E4 @ =0x00000000
	adcs r1, r0
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r5, #0x30]
	movs r0, #0x44
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _02261010
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020F1520
	b _0226101C
_02261010:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r4, #0
	blx FUN_020F24C8
_0226101C:
	blx FUN_020F2104
	adds r6, r0, #0
	ldr r0, [r5, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r2, #2
	lsls r2, r2, #0xa
	adds r2, r0, r2
	ldr r0, _022610E4 @ =0x00000000
	adcs r1, r0
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r5, #0x34]
	movs r0, #0x40
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _02261060
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020F1520
	b _0226106C
_02261060:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r4, #0
	blx FUN_020F24C8
_0226106C:
	blx FUN_020F2104
	ldr r1, [r5, #0x1c]
	adds r7, r1, r0
	str r7, [r5, #0x1c]
	ldr r2, [r5, #0x28]
	ldr r1, [r5, #0x20]
	ldr r3, [r5, #0x30]
	adds r1, r2, r1
	adds r1, r3, r1
	ldr r6, [r5, #0x18]
	ldr r3, [r5, #0x2c]
	ldr r2, [r5, #0x24]
	adds r1, r6, r1
	adds r2, r3, r2
	ldr r6, [r5, #0x34]
	movs r3, #0xe
	adds r2, r6, r2
	ldr r0, [r5, #0x14]
	adds r2, r7, r2
	lsls r3, r3, #0x10
	bl FUN_0200DF44
_0226109A:
	ldr r0, [sp, #0x10]
	adds r5, #0x34
	adds r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #0x24
	bge _022610A8
	b _02260DE0
_022610A8:
	ldr r0, [sp]
	ldr r0, [r0, #0x10]
	ldr r0, [r0]
	cmp r0, #0
	beq _022610D6
	ldr r0, [sp]
	ldr r0, [r0, #4]
	adds r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	b _022610D6
_022610BE:
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0]
	adds r2, r1, #0
	bl ov92_0225DF0C
	ldr r0, [sp]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0200E390
_022610D6:
	ldr r0, [sp]
	ldr r0, [r0]
	bl ov92_0225DF28
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022610E4: .4byte 0x00000000
	thumb_func_end ov92_02260AE0

	thumb_func_start ov92_022610E8
ov92_022610E8: @ 0x022610E8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r1, _02261110 @ =0x00000764
	movs r0, #0x71
	bl FUN_0201AA8C
	adds r1, r0, #0
	movs r2, #1
	str r5, [r1]
	movs r0, #0
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, _02261114 @ =ov92_02260AE0
	lsls r2, r2, #0xc
	str r4, [r1, #0x10]
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	nop
_02261110: .4byte 0x00000764
_02261114: .4byte ov92_02260AE0
	thumb_func_end ov92_022610E8

	thumb_func_start ov92_02261118
ov92_02261118: @ 0x02261118
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r4, #8]
	ldr r5, [r4, #0xc]
	ldr r6, [r4, #0x14]
	ldr r7, [r4, #0x10]
	cmp r1, #0
	beq _02261206
	ldr r1, [r4]
	cmp r1, #3
	bhi _022611FA
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0226113C: @ jump table
	.2byte _02261144 - _0226113C - 2 @ case 0
	.2byte _0226118A - _0226113C - 2 @ case 1
	.2byte _0226119C - _0226113C - 2 @ case 2
	.2byte _022611B4 - _0226113C - 2 @ case 3
_02261144:
	ldr r0, [r5]
	cmp r0, #4
	bge _02261150
	adds r0, r0, #1
	str r0, [r5]
	b _0226115A
_02261150:
	movs r0, #4
	str r0, [r5]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0226115A:
	movs r1, #0
	str r1, [sp]
	ldr r4, [r5]
	ldr r3, [r6]
	adds r0, r7, #0
	adds r3, r4, r3
	lsls r3, r3, #0x18
	movs r2, #1
	lsrs r3, r3, #0x18
	bl FUN_02003EA4
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	ldr r4, [r5]
	ldr r3, [r6]
	adds r0, r7, #0
	adds r3, r4, r3
	lsls r3, r3, #0x18
	adds r2, r1, #0
	lsrs r3, r3, #0x18
	bl FUN_02003EA4
	pop {r3, r4, r5, r6, r7, pc}
_0226118A:
	movs r1, #1
	bl FUN_020182A0
	movs r0, #0
	str r0, [r4, #0x28]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0226119C:
	ldr r0, [r4, #0x50]
	cmp r0, #1
	bne _02261206
	ldr r0, [r4, #0x28]
	adds r0, r0, #1
	str r0, [r4, #0x28]
	cmp r0, #0xf
	blt _02261206
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_022611B4:
	ldr r0, [r5]
	cmp r0, #0
	ble _022611C0
	subs r0, r0, #1
	str r0, [r5]
	b _022611CA
_022611C0:
	movs r0, #0
	str r0, [r5]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_022611CA:
	movs r1, #0
	str r1, [sp]
	ldr r4, [r5]
	ldr r3, [r6]
	adds r0, r7, #0
	adds r3, r4, r3
	lsls r3, r3, #0x18
	movs r2, #1
	lsrs r3, r3, #0x18
	bl FUN_02003EA4
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	ldr r4, [r5]
	ldr r3, [r6]
	adds r0, r7, #0
	adds r3, r4, r3
	lsls r3, r3, #0x18
	adds r2, r1, #0
	lsrs r3, r3, #0x18
	bl FUN_02003EA4
	pop {r3, r4, r5, r6, r7, pc}
_022611FA:
	movs r1, #0
	str r1, [r4, #0x50]
	str r1, [r4, #4]
	str r1, [r4]
	bl FUN_020182A0
_02261206:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov92_02261118

	thumb_func_start ov92_02261208
ov92_02261208: @ 0x02261208
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r5, r0, #0
	ldr r0, _02261354 @ =0x02263E04
	add r3, sp, #0x20
	ldrh r1, [r0]
	add r6, sp, #0x14
	ldr r2, _02261358 @ =0x02263E3C
	strh r1, [r6, #4]
	ldrh r1, [r0, #2]
	adds r4, r3, #0
	add r7, sp, #0x18
	strh r1, [r6, #6]
	ldrh r1, [r0, #4]
	ldrh r0, [r0, #6]
	strh r1, [r6, #8]
	strh r0, [r6, #0xa]
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _0226123A
	b _0226134E
_0226123A:
	ldr r0, [r5]
	cmp r0, #0
	beq _0226124A
	cmp r0, #1
	beq _022612BA
	cmp r0, #2
	beq _022612D2
	b _02261332
_0226124A:
	movs r0, #0
	str r0, [sp, #0x10]
	str r5, [sp, #8]
_02261250:
	ldr r0, [sp, #8]
	ldr r0, [r0, #8]
	str r0, [sp, #0xc]
	cmp r0, #0
	beq _02261284
	add r1, sp, #0x14
	adds r1, #2
	add r2, sp, #0x14
	bl FUN_0200DE44
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldrsh r0, [r7, r0]
	cmp r1, r0
	ble _02261284
	subs r0, r1, #6
	strh r0, [r6]
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [sp, #0xc]
	bl FUN_0200DDB8
	movs r0, #0
	str r0, [r4]
_02261284:
	ldr r0, [sp, #8]
	adds r7, r7, #2
	adds r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	adds r4, r4, #4
	adds r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _02261250
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0226133A
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _0226133A
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _0226133A
	beq _0226133A
	movs r0, #0
	str r0, [r5, #0x28]
	str r0, [r5, #0x50]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0226133A
_022612BA:
	ldr r0, [r5, #0x50]
	cmp r0, #1
	bne _0226133A
	ldr r0, [r5, #0x28]
	adds r0, r0, #1
	str r0, [r5, #0x28]
	cmp r0, #0xf
	blt _0226133A
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0226133A
_022612D2:
	movs r0, #0
	str r0, [sp, #4]
	adds r7, r5, #0
_022612D8:
	ldr r0, [r7, #8]
	str r0, [sp]
	cmp r0, #0
	beq _02261308
	add r1, sp, #0x14
	adds r1, #2
	add r2, sp, #0x14
	bl FUN_0200DE44
	movs r0, #0
	ldrsh r0, [r6, r0]
	cmp r0, #0xe0
	bge _02261308
	adds r0, r0, #6
	strh r0, [r6]
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [sp]
	bl FUN_0200DDB8
	movs r0, #0
	str r0, [r4]
_02261308:
	ldr r0, [sp, #4]
	adds r7, r7, #4
	adds r0, r0, #1
	adds r4, r4, #4
	str r0, [sp, #4]
	cmp r0, #4
	blt _022612D8
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0226133A
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _0226133A
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _0226133A
	beq _0226133A
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0226133A
_02261332:
	movs r0, #0
	str r0, [r5, #0x50]
	str r0, [r5, #4]
	str r0, [r5]
_0226133A:
	movs r4, #0
_0226133C:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02261346
	bl FUN_0200DC24
_02261346:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0226133C
_0226134E:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02261354: .4byte 0x02263E04
_02261358: .4byte 0x02263E3C
	thumb_func_end ov92_02261208

	thumb_func_start ov92_0226135C
ov92_0226135C: @ 0x0226135C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _022613EE
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #0
	beq _02261374
	cmp r0, #1
	beq _022613AE
	b _022613CE
_02261374:
	movs r7, #0
	ldr r4, [sp]
	adds r5, r7, #0
_0226137A:
	ldr r6, [r4, #8]
	adds r0, r5, #0
	movs r1, #0x28
	blx FUN_020F2998
	adds r0, r6, #0
	adds r0, #0x88
	bl FUN_02018198
	adds r0, r6, #0
	movs r1, #1
	bl FUN_020182A0
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, #0x14
	cmp r7, #8
	blt _0226137A
	ldr r0, [sp]
	movs r1, #0
	str r1, [r0, #0x4c]
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp]
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
_022613AE:
	ldr r0, [sp]
	ldr r0, [r0, #0x50]
	cmp r0, #1
	bne _022613EE
	ldr r0, [sp]
	ldr r0, [r0, #0x4c]
	adds r1, r0, #1
	ldr r0, [sp]
	cmp r1, #0xf
	str r1, [r0, #0x4c]
	blt _022613EE
	ldr r0, [r0]
	adds r1, r0, #1
	ldr r0, [sp]
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
_022613CE:
	movs r5, #0
	ldr r4, [sp]
	adds r6, r5, #0
_022613D4:
	ldr r0, [r4, #8]
	adds r1, r6, #0
	bl FUN_020182A0
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #8
	blt _022613D4
	ldr r0, [sp]
	movs r1, #0
	str r1, [r0, #0x50]
	str r1, [r0, #4]
	str r1, [r0]
_022613EE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov92_0226135C

	thumb_func_start ov92_022613F0
ov92_022613F0: @ 0x022613F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02261446
	ldr r0, [r4]
	cmp r0, #0
	beq _02261406
	cmp r0, #1
	beq _0226141C
	b _02261438
_02261406:
	adds r1, r4, #0
	ldr r0, [r4, #8]
	adds r1, #0x54
	bl ov92_022610E8
	movs r0, #0
	str r0, [r4, #0x28]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0226141C:
	ldr r0, [r4, #0x50]
	cmp r0, #1
	bne _02261446
	ldr r0, [r4, #0x28]
	adds r0, r0, #1
	str r0, [r4, #0x28]
	cmp r0, #0xf
	blt _02261446
	movs r0, #1
	str r0, [r4, #0x54]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_02261438:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _02261446
	movs r0, #0
	str r0, [r4, #0x50]
	str r0, [r4, #4]
	str r0, [r4]
_02261446:
	pop {r4, pc}
	thumb_func_end ov92_022613F0

	thumb_func_start ov92_02261448
ov92_02261448: @ 0x02261448
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x99
	adds r4, r1, #0
	lsls r0, r0, #2
	ldr r5, [r4, r0]
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02261464
	adds r5, #0x34
	ldrb r0, [r5]
	cmp r0, #1
	bne _0226146C
_02261464:
	adds r0, r6, #0
	bl FUN_0200E390
	pop {r4, r5, r6, pc}
_0226146C:
	ldr r0, [r4, #4]
	ldr r0, [r0]
	cmp r0, #5
	bhi _02261508
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02261480: @ jump table
	.2byte _02261508 - _02261480 - 2 @ case 0
	.2byte _022614F8 - _02261480 - 2 @ case 1
	.2byte _022614D8 - _02261480 - 2 @ case 2
	.2byte _022614BE - _02261480 - 2 @ case 3
	.2byte _022614A0 - _02261480 - 2 @ case 4
	.2byte _0226148C - _02261480 - 2 @ case 5
_0226148C:
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _022614A0
	movs r1, #1
	str r1, [r4, r0]
	movs r1, #0
	adds r0, #0x4c
	str r1, [r4, r0]
_022614A0:
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _022614BE
	ldr r0, _02261564 @ =0x0000060E
	bl FUN_0200604C
	movs r0, #0x5d
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r1, #0
	adds r0, #0x4c
	str r1, [r4, r0]
_022614BE:
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	cmp r0, #0
	bne _022614D8
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0xfc
	str r1, [r0]
	movs r0, #0x52
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_022614D8:
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	cmp r0, #0
	bne _022614F8
	ldr r0, _02261568 @ =0x00000589
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x84
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xd0
	str r1, [r0]
_022614F8:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _02261530
	movs r0, #1
	str r0, [r4, #0xc]
	movs r0, #0
	str r0, [r4, #0x58]
	b _02261530
_02261508:
	ldr r1, [r4]
	cmp r0, r1
	beq _02261530
	movs r2, #1
	adds r0, r4, #0
	movs r1, #0x52
	str r2, [r4, #0x58]
	adds r0, #0xd0
	lsls r1, r1, #2
	str r2, [r0]
	adds r0, r1, #0
	str r2, [r4, r1]
	adds r0, #0x78
	str r2, [r4, r0]
	adds r1, #0xf0
	str r2, [r4, r1]
	ldr r0, _02261568 @ =0x00000589
	movs r1, #0
	bl FUN_02006154
_02261530:
	adds r0, r4, #0
	adds r0, #8
	bl ov92_02261118
	adds r0, r4, #0
	adds r0, #0x80
	bl ov92_02261208
	adds r0, r4, #0
	adds r0, #0xf8
	bl ov92_0226135C
	movs r0, #0x17
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov92_02261208
	movs r0, #0x7a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov92_022613F0
	ldr r0, [r4, #4]
	ldr r0, [r0]
	str r0, [r4]
	pop {r4, r5, r6, pc}
	.align 2, 0
_02261564: .4byte 0x0000060E
_02261568: .4byte 0x00000589
	thumb_func_end ov92_02261448

	thumb_func_start ov92_0226156C
ov92_0226156C: @ 0x0226156C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x14]
	ldr r0, _022616BC @ =0x0000248C
	movs r6, #0
	str r1, [r4, r0]
	ldr r0, _022616C0 @ =0x00002AE8
	adds r1, r4, r0
	ldr r0, _022616C4 @ =0x0000222C
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	ldr r2, [r1]
	subs r1, r0, #4
	adds r0, r0, #4
	str r2, [r4, r1]
	adds r5, r4, r0
_0226158E:
	movs r1, #0
	str r1, [r5]
	str r1, [r5, #4]
	cmp r6, #4
	bhi _0226163C
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022615A4: @ jump table
	.2byte _022615AE - _022615A4 - 2 @ case 0
	.2byte _022615CA - _022615A4 - 2 @ case 1
	.2byte _02261624 - _022615A4 - 2 @ case 2
	.2byte _0226163E - _022615A4 - 2 @ case 3
	.2byte _02261698 - _022615A4 - 2 @ case 4
_022615AE:
	ldr r0, _022616C8 @ =0x00000944
	adds r0, r4, r0
	str r0, [r5, #8]
	movs r0, #0x42
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r0, #4
	str r1, [r5, #0xc]
	adds r0, r4, r0
	str r0, [r5, #0x14]
	ldr r0, [r4, #0x14]
	ldr r0, [r0, #0x14]
	str r0, [r5, #0x10]
	b _0226169A
_022615CA:
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	add r2, sp, #4
	str r0, [r5, #8]
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	str r0, [r5, #0xc]
	str r1, [r5, #0x10]
	adds r0, r4, #0
	str r1, [r5, #0x14]
	adds r0, #0xd0
	add r1, sp, #4
	ldr r0, [r0]
	adds r1, #2
	bl FUN_0200DE44
	adds r0, r4, #0
	adds r0, #0xd0
	add r2, sp, #0
	movs r1, #6
	ldrsh r1, [r2, r1]
	ldr r0, [r0]
	movs r2, #0xe0
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xd4
	add r1, sp, #4
	ldr r0, [r0]
	adds r1, #2
	add r2, sp, #4
	bl FUN_0200DE44
	adds r0, r4, #0
	adds r0, #0xd4
	add r2, sp, #0
	movs r1, #6
	ldrsh r1, [r2, r1]
	ldr r0, [r0]
	movs r2, #0xe0
	bl FUN_0200DDB8
	b _0226169A
_02261624:
	movs r0, #0xb5
	lsls r0, r0, #4
	adds r2, r4, r0
	movs r0, #0x83
	adds r3, r5, #0
	lsls r0, r0, #2
_02261630:
	adds r1, r1, #1
	str r2, [r3, #8]
	adds r2, r2, r0
	adds r3, r3, #4
	cmp r1, #8
	blt _02261630
_0226163C:
	b _0226169A
_0226163E:
	str r1, [r5, #8]
	adds r0, r4, #0
	str r1, [r5, #0xc]
	adds r0, #0xd8
	ldr r0, [r0]
	add r1, sp, #0
	str r0, [r5, #0x10]
	adds r0, r4, #0
	adds r0, #0xdc
	ldr r0, [r0]
	adds r1, #2
	str r0, [r5, #0x14]
	adds r0, r4, #0
	adds r0, #0xd8
	ldr r0, [r0]
	add r2, sp, #0
	bl FUN_0200DE44
	adds r0, r4, #0
	adds r0, #0xd8
	add r2, sp, #0
	movs r1, #2
	ldrsh r1, [r2, r1]
	ldr r0, [r0]
	movs r2, #0xe0
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xdc
	add r1, sp, #0
	ldr r0, [r0]
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	adds r0, r4, #0
	adds r0, #0xdc
	add r2, sp, #0
	movs r1, #2
	ldrsh r1, [r2, r1]
	ldr r0, [r0]
	movs r2, #0xe0
	bl FUN_0200DDB8
	b _0226169A
_02261698:
	str r4, [r5, #8]
_0226169A:
	adds r6, r6, #1
	adds r5, #0x78
	cmp r6, #5
	bge _022616A4
	b _0226158E
_022616A4:
	ldr r1, _022616CC @ =0x00002228
	movs r2, #1
	ldr r0, _022616D0 @ =ov92_02261448
	adds r1, r4, r1
	lsls r2, r2, #0xc
	bl FUN_0200E320
	ldr r1, _022616D4 @ =0x00002488
	str r0, [r4, r1]
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_022616BC: .4byte 0x0000248C
_022616C0: .4byte 0x00002AE8
_022616C4: .4byte 0x0000222C
_022616C8: .4byte 0x00000944
_022616CC: .4byte 0x00002228
_022616D0: .4byte ov92_02261448
_022616D4: .4byte 0x00002488
	thumb_func_end ov92_0226156C

	thumb_func_start ov92_022616D8
ov92_022616D8: @ 0x022616D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	movs r1, #0x57
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	str r0, [sp, #8]
	adds r0, r1, #4
	ldr r0, [r5, r0]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02261700
	cmp r0, #1
	beq _0226173E
	cmp r0, #2
	beq _022617E2
	b _022617F0
_02261700:
	adds r1, #0x24
	movs r2, #0xa
	adds r0, r5, r1
	movs r1, #0
	lsls r2, r2, #0xe
	movs r3, #0xa
	bl ov92_02260860
	movs r0, #0x66
	lsls r0, r0, #2
	movs r2, #5
	adds r0, r5, r0
	movs r1, #0
	lsls r2, r2, #0x10
	movs r3, #0xa
	bl ov92_02260860
	movs r0, #0x1b
	lsls r0, r0, #4
	ldr r2, _0226184C @ =0xFFFB0000
	adds r0, r5, r0
	movs r1, #0
	movs r3, #0xa
	bl ov92_02260860
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	adds r1, r1, #1
	str r1, [r5, r0]
	b _022617F0
_0226173E:
	adds r1, #0x24
	movs r7, #0
	adds r6, r5, r1
	add r4, sp, #0xc
_02261746:
	adds r0, r6, #0
	bl ov92_02260870
	adds r7, r7, #1
	adds r6, #0x18
	stm r4!, {r0}
	cmp r7, #3
	blt _02261746
	movs r0, #0x5f
	lsls r0, r0, #2
	movs r2, #3
	ldr r0, [r5, r0]
	lsls r3, r2, #7
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	movs r1, #7
	asrs r3, r3, #0xc
	bl FUN_0201F238
	movs r3, #0x5f
	lsls r3, r3, #2
	ldr r0, [r5, r3]
	adds r3, #0x1c
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	movs r1, #5
	movs r2, #0
	asrs r3, r3, #0xc
	bl FUN_0201F238
	movs r3, #0x5f
	lsls r3, r3, #2
	ldr r0, [r5, r3]
	adds r3, #0x34
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	movs r1, #6
	movs r2, #0
	asrs r3, r3, #0xc
	bl FUN_0201F238
	movs r3, #0x5f
	lsls r3, r3, #2
	ldr r0, [r5, r3]
	adds r3, #0x1c
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	movs r1, #1
	movs r2, #0
	asrs r3, r3, #0xc
	bl FUN_0201F238
	movs r3, #0x5f
	lsls r3, r3, #2
	ldr r0, [r5, r3]
	adds r3, #0x34
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	movs r1, #2
	movs r2, #0
	asrs r3, r3, #0xc
	bl FUN_0201F238
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _022617F0
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _022617F0
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _022617F0
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	adds r1, r1, #1
	str r1, [r5, r0]
	b _022617F0
_022617E2:
	adds r0, r1, #0
	movs r2, #1
	adds r0, #0x1c
	str r2, [r5, r0]
	movs r0, #0
	adds r1, #0x14
	str r0, [r5, r1]
_022617F0:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	cmp r0, #6
	bge _022617FE
	adds r1, r0, #1
	ldr r0, [sp, #4]
	b _02261802
_022617FE:
	ldr r0, [sp, #4]
	movs r1, #6
_02261802:
	str r1, [r0]
	movs r1, #0
	ldr r3, [sp, #8]
	str r1, [sp]
	ldr r4, [r3]
	ldr r3, [sp, #4]
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r3, [r3]
	ldr r0, [r5, r0]
	adds r3, r4, r3
	lsls r3, r3, #0x18
	ldr r0, [r0, #0x14]
	movs r2, #1
	lsrs r3, r3, #0x18
	bl FUN_02003EA4
	movs r0, #0
	str r0, [sp]
	ldr r3, [sp, #8]
	movs r0, #0x5f
	ldr r4, [r3]
	ldr r3, [sp, #4]
	lsls r0, r0, #2
	ldr r3, [r3]
	ldr r0, [r5, r0]
	adds r3, r4, r3
	movs r1, #1
	lsls r3, r3, #0x18
	ldr r0, [r0, #0x14]
	adds r2, r1, #0
	lsrs r3, r3, #0x18
	bl FUN_02003EA4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226184C: .4byte 0xFFFB0000
	thumb_func_end ov92_022616D8

	thumb_func_start ov92_02261850
ov92_02261850: @ 0x02261850
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	movs r1, #0x57
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	str r0, [sp, #8]
	adds r0, r1, #4
	ldr r0, [r5, r0]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r0, #0x14
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02261878
	cmp r0, #1
	beq _022618B6
	cmp r0, #2
	beq _0226195A
	b _02261966
_02261878:
	adds r1, #0x24
	adds r0, r5, r1
	movs r1, #0xa
	lsls r1, r1, #0xe
	movs r2, #0
	movs r3, #0xa
	bl ov92_02260860
	movs r0, #0x66
	lsls r0, r0, #2
	movs r1, #5
	adds r0, r5, r0
	lsls r1, r1, #0x10
	movs r2, #0
	movs r3, #0xa
	bl ov92_02260860
	movs r0, #0x1b
	lsls r0, r0, #4
	ldr r1, _022619C0 @ =0xFFFB0000
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0xa
	bl ov92_02260860
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	adds r1, r1, #1
	str r1, [r5, r0]
	b _02261966
_022618B6:
	adds r1, #0x24
	movs r7, #0
	adds r6, r5, r1
	add r4, sp, #0xc
_022618BE:
	adds r0, r6, #0
	bl ov92_02260870
	adds r7, r7, #1
	adds r6, #0x18
	stm r4!, {r0}
	cmp r7, #3
	blt _022618BE
	movs r0, #0x5f
	lsls r0, r0, #2
	movs r2, #3
	ldr r0, [r5, r0]
	lsls r3, r2, #7
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	movs r1, #7
	asrs r3, r3, #0xc
	bl FUN_0201F238
	movs r3, #0x5f
	lsls r3, r3, #2
	ldr r0, [r5, r3]
	adds r3, #0x1c
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	movs r1, #5
	movs r2, #0
	asrs r3, r3, #0xc
	bl FUN_0201F238
	movs r3, #0x5f
	lsls r3, r3, #2
	ldr r0, [r5, r3]
	adds r3, #0x34
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	movs r1, #6
	movs r2, #0
	asrs r3, r3, #0xc
	bl FUN_0201F238
	movs r3, #0x5f
	lsls r3, r3, #2
	ldr r0, [r5, r3]
	adds r3, #0x1c
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	movs r1, #1
	movs r2, #0
	asrs r3, r3, #0xc
	bl FUN_0201F238
	movs r3, #0x5f
	lsls r3, r3, #2
	ldr r0, [r5, r3]
	adds r3, #0x34
	ldr r3, [r5, r3]
	ldr r0, [r0, #0x10]
	movs r1, #2
	movs r2, #0
	asrs r3, r3, #0xc
	bl FUN_0201F238
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02261966
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _02261966
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _02261966
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	adds r1, r1, #1
	str r1, [r5, r0]
	b _02261966
_0226195A:
	adds r0, r1, #0
	movs r2, #0
	adds r0, #0x1c
	str r2, [r5, r0]
	adds r1, #0x14
	str r2, [r5, r1]
_02261966:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	cmp r0, #4
	ble _02261974
	subs r1, r0, #1
	ldr r0, [sp, #4]
	b _02261978
_02261974:
	ldr r0, [sp, #4]
	movs r1, #0
_02261978:
	str r1, [r0]
	movs r1, #0
	ldr r3, [sp, #8]
	str r1, [sp]
	ldr r4, [r3]
	ldr r3, [sp, #4]
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r3, [r3]
	ldr r0, [r5, r0]
	adds r3, r4, r3
	lsls r3, r3, #0x18
	ldr r0, [r0, #0x14]
	movs r2, #1
	lsrs r3, r3, #0x18
	bl FUN_02003EA4
	movs r0, #0
	str r0, [sp]
	ldr r3, [sp, #8]
	movs r0, #0x5f
	ldr r4, [r3]
	ldr r3, [sp, #4]
	lsls r0, r0, #2
	ldr r3, [r3]
	ldr r0, [r5, r0]
	adds r3, r4, r3
	movs r1, #1
	lsls r3, r3, #0x18
	ldr r0, [r0, #0x14]
	adds r2, r1, #0
	lsrs r3, r3, #0x18
	bl FUN_02003EA4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022619C0: .4byte 0xFFFB0000
	thumb_func_end ov92_02261850

	thumb_func_start ov92_022619C4
ov92_022619C4: @ 0x022619C4
	cmp r0, #0xa
	bhi _02261A12
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022619D4: @ jump table
	.2byte _02261A12 - _022619D4 - 2 @ case 0
	.2byte _022619EA - _022619D4 - 2 @ case 1
	.2byte _022619EE - _022619D4 - 2 @ case 2
	.2byte _022619F2 - _022619D4 - 2 @ case 3
	.2byte _022619F6 - _022619D4 - 2 @ case 4
	.2byte _022619FA - _022619D4 - 2 @ case 5
	.2byte _022619FE - _022619D4 - 2 @ case 6
	.2byte _02261A02 - _022619D4 - 2 @ case 7
	.2byte _02261A06 - _022619D4 - 2 @ case 8
	.2byte _02261A0A - _022619D4 - 2 @ case 9
	.2byte _02261A0E - _022619D4 - 2 @ case 10
_022619EA:
	movs r0, #0x1c
	bx lr
_022619EE:
	movs r0, #0xe
	bx lr
_022619F2:
	movs r0, #0xc
	bx lr
_022619F6:
	movs r0, #0xa
	bx lr
_022619FA:
	movs r0, #9
	bx lr
_022619FE:
	movs r0, #0x20
	bx lr
_02261A02:
	movs r0, #0xe
	bx lr
_02261A06:
	movs r0, #0xc
	bx lr
_02261A0A:
	movs r0, #0xb
	bx lr
_02261A0E:
	movs r0, #0xb
	bx lr
_02261A12:
	movs r0, #9
	bx lr
	.align 2, 0
	thumb_func_end ov92_022619C4

	thumb_func_start ov92_02261A18
ov92_02261A18: @ 0x02261A18
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x56
	adds r6, r1, #0
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	ldr r4, [r0]
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02261A3C
	movs r1, #0x5f
	lsls r1, r1, #2
	ldr r0, [r6, r1]
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _02261A44
_02261A3C:
	adds r0, r5, #0
	bl FUN_0200E390
	pop {r3, r4, r5, r6, r7, pc}
_02261A44:
	adds r0, r1, #0
	subs r0, #8
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02261AD8
	subs r0, r1, #4
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _02261A5C
	adds r0, r6, #0
	bl ov92_022616D8
_02261A5C:
	movs r1, #0x59
	lsls r1, r1, #2
	ldr r0, [r6, r1]
	cmp r0, #0
	bne _02261AF2
	cmp r4, #0
	beq _02261AF2
	cmp r4, #8
	bge _02261AF2
	adds r2, r4, #0
	movs r0, #0x28
	muls r2, r0, r2
	str r2, [sp]
	ldr r2, _02261B04 @ =0x02263EA0
	ldr r3, [sp]
	movs r7, #0
	ldr r3, [r2, r3]
	ldr r4, _02261B08 @ =0x02263EA4
	str r3, [r6, r1]
	adds r3, r1, #4
	str r7, [r6, r3]
	ldr r3, [sp]
	lsls r0, r0, #3
	ldr r3, [r4, r3]
	adds r5, r6, #0
	subs r3, r3, #1
	str r3, [r6, r0]
	ldr r3, _02261B0C @ =0x02263EA8
	ldr r0, [sp]
	ldr r3, [r3, r0]
	adds r0, r1, #0
	subs r0, #0x20
	str r3, [r6, r0]
	adds r0, r3, #5
	subs r1, #0x1c
	str r0, [r6, r1]
	ldr r0, [sp]
	adds r4, r2, r0
_02261AA8:
	ldr r1, [r4, #0xc]
	ldr r0, [r5]
	adds r1, r1, #4
	bl FUN_0200DD24
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, [r4, #0x18]
	bl FUN_0200DD24
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, #0x50
	cmp r7, #2
	blt _02261AA8
	ldr r1, _02261B10 @ =0x02263EC4
	ldr r0, [sp]
	ldr r2, _02261B14 @ =0x00001001
	ldr r0, [r1, r0]
	adds r1, r6, #0
	bl FUN_0200E320
	b _02261AF2
_02261AD8:
	bne _02261AF2
	adds r0, r1, #0
	subs r0, #0x18
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _02261AF2
	subs r0, r1, #4
	ldr r0, [r6, r0]
	cmp r0, #1
	bne _02261AF2
	adds r0, r6, #0
	bl ov92_02261850
_02261AF2:
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	cmp r1, #0
	beq _02261B00
	subs r1, r1, #1
	str r1, [r6, r0]
_02261B00:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02261B04: .4byte 0x02263EA0
_02261B08: .4byte 0x02263EA4
_02261B0C: .4byte 0x02263EA8
_02261B10: .4byte 0x02263EC4
_02261B14: .4byte 0x00001001
	thumb_func_end ov92_02261A18

	thumb_func_start ov92_02261B18
ov92_02261B18: @ 0x02261B18
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _02261B8C @ =0x00002AF4
	ldr r6, _02261B90 @ =0x00002030
	adds r1, r4, r0
	ldr r0, _02261B94 @ =0x00002188
	str r1, [r4, r0]
	movs r1, #0x42
	lsls r1, r1, #2
	adds r3, r4, r1
	adds r2, r0, #4
	str r3, [r4, r2]
	adds r1, r1, #4
	adds r2, r4, r1
	adds r1, r0, #0
	adds r1, #8
	str r2, [r4, r1]
	adds r1, r0, #0
	ldr r2, [r4, #0x14]
	adds r1, #0x24
	str r2, [r4, r1]
	adds r2, r0, #0
	movs r1, #0
	adds r2, #0xc
	str r1, [r4, r2]
	adds r2, r0, #0
	adds r2, #0x18
	str r1, [r4, r2]
	adds r0, #0x1c
	str r1, [r4, r0]
	adds r0, r6, #0
	adds r2, r4, #0
	adds r3, r4, #0
	adds r0, #0xa0
_02261B5C:
	adds r5, r2, #0
	adds r5, #0xe8
	ldr r5, [r5]
	adds r1, r1, #1
	str r5, [r3, r6]
	adds r5, r2, #0
	adds r5, #0xe0
	ldr r5, [r5]
	adds r2, r2, #4
	str r5, [r3, r0]
	adds r3, #0x50
	cmp r1, #2
	blt _02261B5C
	ldr r1, _02261B90 @ =0x00002030
	movs r2, #1
	ldr r0, _02261B98 @ =ov92_02261A18
	adds r1, r4, r1
	lsls r2, r2, #0xc
	bl FUN_0200E320
	ldr r1, _02261B9C @ =0x00002184
	str r0, [r4, r1]
	pop {r4, r5, r6, pc}
	nop
_02261B8C: .4byte 0x00002AF4
_02261B90: .4byte 0x00002030
_02261B94: .4byte 0x00002188
_02261B98: .4byte ov92_02261A18
_02261B9C: .4byte 0x00002184
	thumb_func_end ov92_02261B18

	thumb_func_start ov92_02261BA0
ov92_02261BA0: @ 0x02261BA0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02261BBE
	movs r1, #0x5f
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #1
	bne _02261BC8
_02261BBE:
	adds r0, r5, #0
	bl FUN_0200E390
	add sp, #8
	pop {r4, r5, r6, pc}
_02261BC8:
	adds r0, r1, #0
	subs r0, #0x14
	ldr r0, [r4, r0]
	cmp r0, #4
	bls _02261BD4
	b _02261E74
_02261BD4:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02261BE0: @ jump table
	.2byte _02261BEA - _02261BE0 - 2 @ case 0
	.2byte _02261D5A - _02261BE0 - 2 @ case 1
	.2byte _02261DA2 - _02261BE0 - 2 @ case 2
	.2byte _02261DE8 - _02261BE0 - 2 @ case 3
	.2byte _02261E2E - _02261BE0 - 2 @ case 4
_02261BEA:
	movs r0, #0
	strh r0, [r4, #8]
	movs r0, #0x80
	strh r0, [r4, #0x14]
	movs r0, #0xa0
	strh r0, [r4, #0x16]
	movs r0, #0x40
	str r0, [r4, #0x18]
	movs r0, #0x18
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0200DCE8
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xa8
	strh r1, [r0]
	adds r0, r4, #0
	movs r1, #0x80
	adds r0, #0xb4
	strh r1, [r0]
	adds r0, r4, #0
	movs r1, #0xa0
	adds r0, #0xb6
	strh r1, [r0]
	adds r0, r4, #0
	movs r1, #0x40
	adds r0, #0xb8
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #0x18
	adds r0, #0xbc
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r3, #1
	ldr r0, [r4]
	add r1, sp, #4
	add r2, sp, #0
	lsls r3, r3, #0x14
	bl FUN_0200DF70
	ldrh r0, [r4, #8]
	bl FUN_0201FCAC
	movs r1, #0x14
	ldrsh r1, [r4, r1]
	lsls r2, r1, #0xc
	ldr r1, [r4, #0x18]
	muls r0, r1, r0
	adds r5, r2, r0
	ldrh r0, [r4, #8]
	bl FUN_0201FCC0
	movs r1, #0x16
	ldrsh r1, [r4, r1]
	movs r3, #1
	lsls r3, r3, #0x14
	lsls r2, r1, #0xc
	ldr r1, [r4, #0x1c]
	muls r0, r1, r0
	adds r6, r2, r0
	ldr r0, [r4]
	adds r1, r5, #0
	adds r2, r6, #0
	bl FUN_0200DF44
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov92_022619C4
	movs r2, #0x2d
	adds r3, r0, #0
	adds r0, r4, #0
	lsls r2, r2, #0xe
	adds r0, #0x20
	adds r1, r5, #0
	adds r2, r5, r2
	bl ov92_02260860
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov92_022619C4
	movs r2, #6
	adds r3, r0, #0
	adds r0, r4, #0
	lsls r2, r2, #0xe
	adds r0, #0x38
	adds r1, r6, #0
	subs r2, r6, r2
	bl ov92_02260860
	adds r0, r4, #0
	adds r0, #0xa0
	movs r3, #1
	ldr r0, [r0]
	add r1, sp, #4
	add r2, sp, #0
	lsls r3, r3, #0x14
	bl FUN_0200DF70
	adds r0, r4, #0
	adds r0, #0xa8
	ldrh r0, [r0]
	bl FUN_0201FCAC
	movs r1, #0xb4
	ldrsh r1, [r4, r1]
	lsls r2, r1, #0xc
	adds r1, r4, #0
	adds r1, #0xb8
	ldr r1, [r1]
	muls r0, r1, r0
	adds r6, r2, r0
	adds r0, r4, #0
	adds r0, #0xa8
	ldrh r0, [r0]
	bl FUN_0201FCC0
	movs r1, #0xb6
	ldrsh r1, [r4, r1]
	movs r3, #1
	lsls r3, r3, #0x14
	lsls r2, r1, #0xc
	adds r1, r4, #0
	adds r1, #0xbc
	ldr r1, [r1]
	muls r0, r1, r0
	subs r5, r2, r0
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	adds r1, r6, #0
	adds r2, r5, #0
	bl FUN_0200DF44
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov92_022619C4
	movs r2, #0x2d
	adds r3, r0, #0
	adds r0, r4, #0
	lsls r2, r2, #0xe
	adds r0, #0xc0
	adds r1, r6, #0
	subs r2, r6, r2
	bl ov92_02260860
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov92_022619C4
	movs r2, #6
	adds r3, r0, #0
	adds r0, r4, #0
	lsls r2, r2, #0xe
	adds r0, #0xd8
	adds r1, r5, #0
	adds r2, r5, r2
	bl ov92_02260860
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02261D5A:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #1
	bl ov92_022620D0
	movs r1, #0x52
	lsls r1, r1, #2
	adds r5, r0, #0
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ov92_02262018
	cmp r5, #0
	beq _02261E7A
	cmp r0, #0
	beq _02261E7A
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	add sp, #8
	adds r1, r1, #1
	str r1, [r4, r0]
	pop {r4, r5, r6, pc}
_02261DA2:
	subs r1, #0x38
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #3
	bl ov92_02261E88
	movs r1, #0x52
	lsls r1, r1, #2
	adds r5, r0, #0
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #2
	bl ov92_02261E88
	cmp r5, #0
	beq _02261E7A
	cmp r0, #0
	beq _02261E7A
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	add sp, #8
	adds r1, r1, #1
	str r1, [r4, r0]
	pop {r4, r5, r6, pc}
_02261DE8:
	subs r1, #0x38
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #2
	bl ov92_02261F60
	movs r1, #0x52
	lsls r1, r1, #2
	adds r5, r0, #0
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ov92_02262018
	cmp r5, #0
	beq _02261E7A
	cmp r0, #0
	beq _02261E7A
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	add sp, #8
	adds r1, r1, #1
	str r1, [r4, r0]
	pop {r4, r5, r6, pc}
_02261E2E:
	subs r1, #0x38
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #1
	bl ov92_022620D0
	movs r1, #0x52
	lsls r1, r1, #2
	adds r5, r0, #0
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #2
	bl ov92_02261E88
	cmp r5, #0
	beq _02261E7A
	cmp r0, #0
	beq _02261E7A
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	add sp, #8
	adds r1, r1, #1
	str r1, [r4, r0]
	pop {r4, r5, r6, pc}
_02261E74:
	adds r0, r5, #0
	bl FUN_0200E390
_02261E7A:
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov92_02261BA0

	thumb_func_start ov92_02261E80
ov92_02261E80: @ 0x02261E80
	movs r1, #0
	str r1, [r0, #4]
	bx lr
	.align 2, 0
	thumb_func_end ov92_02261E80

	thumb_func_start ov92_02261E88
ov92_02261E88: @ 0x02261E88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r0, #0
	beq _02261EA0
	cmp r0, #1
	beq _02261F28
	b _02261F52
_02261EA0:
	movs r3, #1
	ldr r0, [r5]
	add r1, sp, #4
	add r2, sp, #0
	lsls r3, r3, #0x14
	bl FUN_0200DF70
	cmp r6, #0
	bne _02261ECE
	adds r0, r4, #0
	ldr r6, [sp, #4]
	bl ov92_022619C4
	movs r2, #0x2d
	adds r3, r0, #0
	adds r0, r5, #0
	lsls r2, r2, #0xe
	adds r0, #0x20
	adds r1, r6, #0
	subs r2, r6, r2
	bl ov92_02260860
	b _02261EE8
_02261ECE:
	adds r0, r4, #0
	ldr r6, [sp, #4]
	bl ov92_022619C4
	movs r2, #0x2d
	adds r3, r0, #0
	adds r0, r5, #0
	lsls r2, r2, #0xe
	adds r0, #0x20
	adds r1, r6, #0
	adds r2, r6, r2
	bl ov92_02260860
_02261EE8:
	cmp r7, #2
	bne _02261F08
	adds r0, r4, #0
	ldr r6, [sp]
	bl ov92_022619C4
	movs r2, #6
	adds r3, r0, #0
	adds r0, r5, #0
	lsls r2, r2, #0xe
	adds r0, #0x38
	adds r1, r6, #0
	subs r2, r6, r2
	bl ov92_02260860
	b _02261F22
_02261F08:
	adds r0, r4, #0
	ldr r6, [sp]
	bl ov92_022619C4
	movs r2, #6
	adds r3, r0, #0
	adds r0, r5, #0
	lsls r2, r2, #0xe
	adds r0, #0x38
	adds r1, r6, #0
	adds r2, r6, r2
	bl ov92_02260860
_02261F22:
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
_02261F28:
	adds r0, r5, #0
	adds r0, #0x20
	bl ov92_02260870
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x38
	bl ov92_02260870
	movs r3, #1
	ldr r0, [r5]
	ldr r1, [r5, #0x20]
	ldr r2, [r5, #0x38]
	lsls r3, r3, #0x14
	bl FUN_0200DF44
	cmp r4, #0
	beq _02261F58
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02261F52:
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02261F58:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov92_02261E88

	thumb_func_start ov92_02261F60
ov92_02261F60: @ 0x02261F60
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	adds r6, r3, #0
	cmp r0, #0
	beq _02261F74
	cmp r0, #1
	beq _02261FE4
	b _0226200C
_02261F74:
	cmp r2, #0
	bne _02261F92
	adds r0, r4, #0
	bl ov92_022619C4
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x4d
	movs r2, #2
	adds r0, #0x20
	lsls r1, r1, #0xe
	lsls r2, r2, #0x12
	bl ov92_02260860
	b _02261FA8
_02261F92:
	adds r0, r4, #0
	bl ov92_022619C4
	adds r3, r0, #0
	adds r0, r5, #0
	movs r2, #2
	ldr r1, _02262014 @ =0xFFFC2000
	adds r0, #0x20
	lsls r2, r2, #0x12
	bl ov92_02260860
_02261FA8:
	cmp r6, #2
	bne _02261FC6
	adds r0, r4, #0
	bl ov92_022619C4
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0x22
	adds r0, #0x38
	lsls r1, r1, #0x10
	lsls r2, r2, #0xe
	bl ov92_02260860
	b _02261FDE
_02261FC6:
	adds r0, r4, #0
	bl ov92_022619C4
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0x2e
	adds r0, #0x38
	lsls r1, r1, #0x10
	lsls r2, r2, #0xe
	bl ov92_02260860
_02261FDE:
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
_02261FE4:
	adds r0, r5, #0
	adds r0, #0x20
	bl ov92_02260870
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x38
	bl ov92_02260870
	movs r3, #1
	ldr r0, [r5]
	ldr r1, [r5, #0x20]
	ldr r2, [r5, #0x38]
	lsls r3, r3, #0x14
	bl FUN_0200DF44
	cmp r4, #0
	beq _02262010
	movs r0, #1
	pop {r4, r5, r6, pc}
_0226200C:
	movs r0, #1
	pop {r4, r5, r6, pc}
_02262010:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02262014: .4byte 0xFFFC2000
	thumb_func_end ov92_02261F60

	thumb_func_start ov92_02262018
ov92_02262018: @ 0x02262018
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	adds r6, r3, #0
	cmp r0, #0
	beq _0226202C
	cmp r0, #1
	beq _0226209C
	b _022620C4
_0226202C:
	cmp r2, #0
	bne _0226204A
	adds r0, r4, #0
	bl ov92_022619C4
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x4d
	movs r2, #2
	adds r0, #0x20
	lsls r1, r1, #0xe
	lsls r2, r2, #0x12
	bl ov92_02260860
	b _02262060
_0226204A:
	adds r0, r4, #0
	bl ov92_022619C4
	adds r3, r0, #0
	adds r0, r5, #0
	movs r2, #2
	ldr r1, _022620CC @ =0xFFFC2000
	adds r0, #0x20
	lsls r2, r2, #0x12
	bl ov92_02260860
_02262060:
	cmp r6, #2
	bne _0226207E
	adds r0, r4, #0
	bl ov92_022619C4
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0x12
	adds r0, #0x38
	lsls r1, r1, #0x10
	lsls r2, r2, #0xe
	bl ov92_02260860
	b _02262096
_0226207E:
	adds r0, r4, #0
	bl ov92_022619C4
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0x1e
	adds r0, #0x38
	lsls r1, r1, #0x10
	lsls r2, r2, #0xe
	bl ov92_02260860
_02262096:
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
_0226209C:
	adds r0, r5, #0
	adds r0, #0x20
	bl ov92_02260870
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x38
	bl ov92_02260870
	movs r3, #1
	ldr r0, [r5]
	ldr r1, [r5, #0x20]
	ldr r2, [r5, #0x38]
	lsls r3, r3, #0x14
	bl FUN_0200DF44
	cmp r4, #0
	beq _022620C8
	movs r0, #1
	pop {r4, r5, r6, pc}
_022620C4:
	movs r0, #1
	pop {r4, r5, r6, pc}
_022620C8:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_022620CC: .4byte 0xFFFC2000
	thumb_func_end ov92_02262018

	thumb_func_start ov92_022620D0
ov92_022620D0: @ 0x022620D0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #4]
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r0, #0
	beq _022620E6
	cmp r0, #1
	beq _022620F2
	b _02262196
_022620E6:
	movs r0, #0
	str r0, [r4, #0x10]
	strh r0, [r4, #8]
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
_022620F2:
	adds r0, r1, #0
	bl ov92_022619C4
	adds r1, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	blx FUN_020F2998
	movs r1, #8
	ldrsh r2, [r4, r1]
	adds r0, r2, r0
	strh r0, [r4, #8]
	movs r0, #0x5a
	ldrsh r1, [r4, r1]
	lsls r0, r0, #2
	cmp r1, r0
	blt _02262118
	movs r0, #0
	strh r0, [r4, #8]
_02262118:
	movs r3, #1
	ldr r0, [r4]
	add r1, sp, #4
	add r2, sp, #0
	lsls r3, r3, #0x14
	bl FUN_0200DF70
	cmp r5, #0
	ldrh r0, [r4, #8]
	bne _02262144
	bl FUN_0201FCAC
	movs r1, #0x14
	ldrsh r1, [r4, r1]
	lsls r2, r1, #0xc
	ldr r1, [r4, #0x18]
	muls r0, r1, r0
	subs r5, r2, r0
	ldrh r0, [r4, #8]
	bl FUN_0201FCC0
	b _0226215A
_02262144:
	bl FUN_0201FCAC
	movs r1, #0x14
	ldrsh r1, [r4, r1]
	lsls r2, r1, #0xc
	ldr r1, [r4, #0x18]
	muls r0, r1, r0
	adds r5, r2, r0
	ldrh r0, [r4, #8]
	bl FUN_0201FCC0
_0226215A:
	movs r1, #0x16
	ldrsh r1, [r4, r1]
	movs r3, #1
	lsls r3, r3, #0x14
	lsls r2, r1, #0xc
	ldr r1, [r4, #0x1c]
	muls r0, r1, r0
	subs r2, r2, r0
	ldr r0, [r4]
	adds r1, r5, #0
	bl FUN_0200DF44
	movs r0, #8
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _0226219C
	ldr r0, [r4, #0x10]
	adds r0, r0, #1
	str r0, [r4, #0x10]
	cmp r0, r6
	blt _02262190
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #1
	pop {r4, r5, r6, pc}
_02262190:
	movs r0, #1
	str r0, [r4, #4]
	b _0226219C
_02262196:
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_0226219C:
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov92_022620D0

	thumb_func_start ov92_022621A4
ov92_022621A4: @ 0x022621A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r3, _022621FC @ =0x02263E1C
	add r2, sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	bl FUN_0200FB5C
	cmp r0, #0
	beq _022621CE
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, #0x34
	ldrb r1, [r1]
	cmp r1, #1
	bne _022621D8
_022621CE:
	adds r0, r5, #0
	bl FUN_0200E390
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_022621D8:
	adds r1, r0, #0
	subs r1, #0x14
	ldr r1, [r4, r1]
	cmp r1, #4
	bls _022621E4
	b _0226253E
_022621E4:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022621F0: @ jump table
	.2byte _02262200 - _022621F0 - 2 @ case 0
	.2byte _02262338 - _022621F0 - 2 @ case 1
	.2byte _022623BA - _022621F0 - 2 @ case 2
	.2byte _02262436 - _022621F0 - 2 @ case 3
	.2byte _022624B2 - _022621F0 - 2 @ case 4
	.2byte _022668B2 - _022621F0 - 2 @ case 5
_022621FC: .4byte 0x02263E1C
_02262200:
	subs r0, #0x3c
	ldr r0, [r4, r0]
	movs r1, #0
	str r1, [sp]
	cmp r0, #0
	ble _02262308
	adds r5, r4, #0
_0226220E:
	movs r0, #0
	strh r0, [r5, #8]
	movs r0, #0x80
	strh r0, [r5, #0x14]
	movs r0, #0xa0
	strh r0, [r5, #0x16]
	movs r0, #0x40
	str r0, [r5, #0x18]
	movs r0, #0x18
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	movs r1, #1
	bl FUN_0200DCE8
	adds r1, r5, #0
	adds r1, #0xa8
	movs r0, #0
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0xb4
	movs r0, #0x80
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0xb6
	movs r0, #0xa0
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0xb8
	movs r0, #0x40
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0xbc
	movs r0, #0x18
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r3, #1
	ldr r0, [r5]
	add r1, sp, #8
	add r2, sp, #4
	lsls r3, r3, #0x14
	bl FUN_0200DF70
	ldrh r0, [r5, #8]
	bl FUN_0201FCAC
	movs r1, #0x14
	ldrsh r1, [r5, r1]
	lsls r6, r1, #0xc
	ldr r1, [r5, #0x18]
	adds r7, r1, #0
	muls r7, r0, r7
	ldrh r0, [r5, #8]
	bl FUN_0201FCC0
	movs r1, #0x16
	ldrsh r1, [r5, r1]
	lsls r3, r1, #0xc
	ldr r1, [r5, #0x1c]
	adds r2, r1, #0
	muls r2, r0, r2
	adds r2, r3, r2
	movs r3, #1
	ldr r0, [r5]
	adds r1, r6, r7
	lsls r3, r3, #0x14
	bl FUN_0200DF44
	adds r0, r5, #0
	adds r0, #0xa0
	movs r3, #1
	ldr r0, [r0]
	add r1, sp, #8
	add r2, sp, #4
	lsls r3, r3, #0x14
	bl FUN_0200DF70
	adds r0, r5, #0
	adds r0, #0xa8
	ldrh r0, [r0]
	bl FUN_0201FCAC
	movs r1, #0xb4
	ldrsh r1, [r5, r1]
	lsls r6, r1, #0xc
	adds r1, r5, #0
	adds r1, #0xb8
	ldr r1, [r1]
	adds r7, r1, #0
	muls r7, r0, r7
	adds r0, r5, #0
	adds r0, #0xa8
	ldrh r0, [r0]
	bl FUN_0201FCC0
	movs r1, #0xb6
	adds r2, r5, #0
	ldrsh r1, [r5, r1]
	adds r2, #0xbc
	ldr r2, [r2]
	lsls r1, r1, #0xc
	muls r0, r2, r0
	subs r2, r1, r0
	adds r0, r5, #0
	adds r0, #0xa0
	movs r3, #1
	ldr r0, [r0]
	adds r1, r6, r7
	lsls r3, r3, #0x14
	bl FUN_0200DF44
	ldr r0, [sp]
	adds r5, #0x50
	adds r0, r0, #1
	str r0, [sp]
	movs r0, #5
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	ldr r0, [sp]
	cmp r0, r1
	blt _0226220E
_02262308:
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02262338:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #3
	bl ov92_02261E88
	movs r1, #0x51
	str r0, [sp, #0xc]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xf0
	movs r2, #0
	movs r3, #2
	bl ov92_02261F60
	movs r1, #0x52
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ov92_02262018
	movs r2, #1
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _0226240C
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _0226240C
	cmp r0, #0
	beq _0226240C
	cmp r2, #0
	beq _0226240C
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_022623BA:
	movs r3, #1
	movs r1, #0x51
	adds r0, r4, #0
	str r3, [sp, #0xc]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, #0xf0
	movs r2, #0
	bl ov92_022620D0
	movs r1, #0x52
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #2
	bl ov92_02261E88
	movs r1, #0x52
	str r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0x50
	movs r2, #1
	movs r3, #3
	bl ov92_02262018
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _0226240C
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _0226240C
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _0226240C
	cmp r0, #0
	bne _0226240E
_0226240C:
	b _02262544
_0226240E:
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02262436:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #2
	bl ov92_02261F60
	movs r1, #0x51
	str r0, [sp, #0xc]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xf0
	movs r2, #0
	movs r3, #3
	bl ov92_02261E88
	movs r2, #1
	movs r1, #0x52
	str r0, [sp, #0x10]
	adds r0, r4, #0
	str r2, [sp, #0x14]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, #0x50
	movs r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _02262544
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262544
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _02262544
	cmp r0, #0
	beq _02262544
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_022624B2:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #1
	bl ov92_022620D0
	movs r2, #1
	movs r1, #0x52
	str r0, [sp, #0xc]
	adds r0, r4, #0
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, #0x50
	movs r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _02262544
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262544
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _02262544
	cmp r0, #0
	beq _02262544
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	movs r1, #0x53
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #1
	beq _0226252A
	adds r0, r0, #1
	str r0, [r4, r1]
	movs r0, #1
	adds r1, #0x1c
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_0226252A:
	movs r0, #0
	str r0, [r4, r1]
	adds r0, r1, #0
	adds r0, #0x1c
	ldr r0, [r4, r0]
	adds r1, #0x1c
	adds r0, r0, #1
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_0226253E:
	adds r0, r5, #0
	bl FUN_0200E390
_02262544:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov92_022621A4

	thumb_func_start ov92_02262548
ov92_02262548: @ 0x02262548
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r3, _022625A0 @ =0x02263E0C
	add r2, sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02262572
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, #0x34
	ldrb r1, [r1]
	cmp r1, #1
	bne _0226257C
_02262572:
	adds r0, r5, #0
	bl FUN_0200E390
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_0226257C:
	adds r1, r0, #0
	subs r1, #0x14
	ldr r1, [r4, r1]
	cmp r1, #4
	bls _02262588
	b _022628E4
_02262588:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02262594: @ jump table
	.2byte _022625A4 - _02262594 - 2 @ case 0
	.2byte _022626DC - _02262594 - 2 @ case 1
	.2byte _0226275E - _02262594 - 2 @ case 2
	.2byte _022627DC - _02262594 - 2 @ case 3
	.2byte _02262858 - _02262594 - 2 @ case 4
	.2byte _02266C56 - _02262594 - 2 @ case 5
_022625A0: .4byte 0x02263E0C
_022625A4:
	subs r0, #0x3c
	ldr r0, [r4, r0]
	movs r1, #0
	str r1, [sp]
	cmp r0, #0
	ble _022626AC
	adds r5, r4, #0
_022625B2:
	movs r0, #0
	strh r0, [r5, #8]
	movs r0, #0x80
	strh r0, [r5, #0x14]
	movs r0, #0xa0
	strh r0, [r5, #0x16]
	movs r0, #0x40
	str r0, [r5, #0x18]
	movs r0, #0x18
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	movs r1, #1
	bl FUN_0200DCE8
	adds r1, r5, #0
	adds r1, #0xa8
	movs r0, #0
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0xb4
	movs r0, #0x80
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0xb6
	movs r0, #0xa0
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0xb8
	movs r0, #0x40
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0xbc
	movs r0, #0x18
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r3, #1
	ldr r0, [r5]
	add r1, sp, #8
	add r2, sp, #4
	lsls r3, r3, #0x14
	bl FUN_0200DF70
	ldrh r0, [r5, #8]
	bl FUN_0201FCAC
	movs r1, #0x14
	ldrsh r1, [r5, r1]
	lsls r6, r1, #0xc
	ldr r1, [r5, #0x18]
	adds r7, r1, #0
	muls r7, r0, r7
	ldrh r0, [r5, #8]
	bl FUN_0201FCC0
	movs r1, #0x16
	ldrsh r1, [r5, r1]
	lsls r3, r1, #0xc
	ldr r1, [r5, #0x1c]
	adds r2, r1, #0
	muls r2, r0, r2
	adds r2, r3, r2
	movs r3, #1
	ldr r0, [r5]
	adds r1, r6, r7
	lsls r3, r3, #0x14
	bl FUN_0200DF44
	adds r0, r5, #0
	adds r0, #0xa0
	movs r3, #1
	ldr r0, [r0]
	add r1, sp, #8
	add r2, sp, #4
	lsls r3, r3, #0x14
	bl FUN_0200DF70
	adds r0, r5, #0
	adds r0, #0xa8
	ldrh r0, [r0]
	bl FUN_0201FCAC
	movs r1, #0xb4
	ldrsh r1, [r5, r1]
	lsls r6, r1, #0xc
	adds r1, r5, #0
	adds r1, #0xb8
	ldr r1, [r1]
	adds r7, r1, #0
	muls r7, r0, r7
	adds r0, r5, #0
	adds r0, #0xa8
	ldrh r0, [r0]
	bl FUN_0201FCC0
	movs r1, #0xb6
	adds r2, r5, #0
	ldrsh r1, [r5, r1]
	adds r2, #0xbc
	ldr r2, [r2]
	lsls r1, r1, #0xc
	muls r0, r2, r0
	subs r2, r1, r0
	adds r0, r5, #0
	adds r0, #0xa0
	movs r3, #1
	ldr r0, [r0]
	adds r1, r6, r7
	lsls r3, r3, #0x14
	bl FUN_0200DF44
	ldr r0, [sp]
	adds r5, #0x50
	adds r0, r0, #1
	str r0, [sp]
	movs r0, #5
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	ldr r0, [sp]
	cmp r0, r1
	blt _022625B2
_022626AC:
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_022626DC:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #3
	bl ov92_02261E88
	movs r1, #0x51
	str r0, [sp, #0xc]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xf0
	movs r2, #0
	movs r3, #2
	bl ov92_02261F60
	movs r1, #0x52
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ov92_02262018
	movs r2, #1
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _022627B2
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _022627B2
	cmp r0, #0
	beq _022627B2
	cmp r2, #0
	beq _022627B2
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_0226275E:
	movs r0, #1
	movs r1, #0x51
	str r0, [sp, #0xc]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xf0
	movs r2, #0
	movs r3, #2
	bl ov92_022620D0
	movs r1, #0x52
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #2
	bl ov92_02261E88
	movs r1, #0x52
	str r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0x50
	movs r2, #1
	movs r3, #3
	bl ov92_02262018
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _022627B2
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _022627B2
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _022627B2
	cmp r0, #0
	bne _022627B4
_022627B2:
	b _022628EA
_022627B4:
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_022627DC:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #2
	bl ov92_02261F60
	movs r1, #0x51
	str r0, [sp, #0xc]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xf0
	movs r2, #0
	movs r3, #3
	bl ov92_02261E88
	movs r2, #1
	movs r1, #0x52
	str r0, [sp, #0x10]
	adds r0, r4, #0
	str r2, [sp, #0x14]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, #0x50
	movs r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _022628EA
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _022628EA
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _022628EA
	cmp r0, #0
	beq _022628EA
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02262858:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #2
	bl ov92_022620D0
	movs r2, #1
	movs r1, #0x52
	str r0, [sp, #0xc]
	adds r0, r4, #0
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, #0x50
	movs r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _022628EA
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _022628EA
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _022628EA
	cmp r0, #0
	beq _022628EA
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	movs r1, #0x53
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #1
	beq _022628D0
	adds r0, r0, #1
	str r0, [r4, r1]
	movs r0, #1
	adds r1, #0x1c
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_022628D0:
	movs r0, #0
	str r0, [r4, r1]
	adds r0, r1, #0
	adds r0, #0x1c
	ldr r0, [r4, r0]
	adds r1, #0x1c
	adds r0, r0, #1
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_022628E4:
	adds r0, r5, #0
	bl FUN_0200E390
_022628EA:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov92_02262548

	thumb_func_start ov92_022628F0
ov92_022628F0: @ 0x022628F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r3, _0226294C @ =0x02263E2C
	add r2, sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0226291A
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, #0x34
	ldrb r1, [r1]
	cmp r1, #1
	bne _02262924
_0226291A:
	adds r0, r5, #0
	bl FUN_0200E390
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_02262924:
	adds r1, r0, #0
	subs r1, #0x14
	ldr r1, [r4, r1]
	cmp r1, #6
	bls _02262930
	b _02262CE2
_02262930:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0226293C: @ jump table
	.2byte _02262950 - _0226293C - 2 @ case 0
	.2byte _02262A88 - _0226293C - 2 @ case 1
	.2byte _02262B0A - _0226293C - 2 @ case 2
	.2byte _02262B84 - _0226293C - 2 @ case 3
	.2byte _02262BB0 - _0226293C - 2 @ case 4
	.2byte _02262C2C - _0226293C - 2 @ case 5
	.2byte _02262C96 - _0226293C - 2 @ case 6
	.2byte _02266FFE - _0226293C - 2 @ case 7
_0226294C: .4byte 0x02263E2C
_02262950:
	subs r0, #0x3c
	ldr r0, [r4, r0]
	movs r1, #0
	str r1, [sp]
	cmp r0, #0
	ble _02262A58
	adds r5, r4, #0
_0226295E:
	movs r0, #0
	strh r0, [r5, #8]
	movs r0, #0x80
	strh r0, [r5, #0x14]
	movs r0, #0xa0
	strh r0, [r5, #0x16]
	movs r0, #0x40
	str r0, [r5, #0x18]
	movs r0, #0x18
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	movs r1, #1
	bl FUN_0200DCE8
	adds r1, r5, #0
	adds r1, #0xa8
	movs r0, #0
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0xb4
	movs r0, #0x80
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0xb6
	movs r0, #0xa0
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0xb8
	movs r0, #0x40
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0xbc
	movs r0, #0x18
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r3, #1
	ldr r0, [r5]
	add r1, sp, #8
	add r2, sp, #4
	lsls r3, r3, #0x14
	bl FUN_0200DF70
	ldrh r0, [r5, #8]
	bl FUN_0201FCAC
	movs r1, #0x14
	ldrsh r1, [r5, r1]
	lsls r6, r1, #0xc
	ldr r1, [r5, #0x18]
	adds r7, r1, #0
	muls r7, r0, r7
	ldrh r0, [r5, #8]
	bl FUN_0201FCC0
	movs r1, #0x16
	ldrsh r1, [r5, r1]
	lsls r3, r1, #0xc
	ldr r1, [r5, #0x1c]
	adds r2, r1, #0
	muls r2, r0, r2
	adds r2, r3, r2
	movs r3, #1
	ldr r0, [r5]
	adds r1, r6, r7
	lsls r3, r3, #0x14
	bl FUN_0200DF44
	adds r0, r5, #0
	adds r0, #0xa0
	movs r3, #1
	ldr r0, [r0]
	add r1, sp, #8
	add r2, sp, #4
	lsls r3, r3, #0x14
	bl FUN_0200DF70
	adds r0, r5, #0
	adds r0, #0xa8
	ldrh r0, [r0]
	bl FUN_0201FCAC
	movs r1, #0xb4
	ldrsh r1, [r5, r1]
	lsls r6, r1, #0xc
	adds r1, r5, #0
	adds r1, #0xb8
	ldr r1, [r1]
	adds r7, r1, #0
	muls r7, r0, r7
	adds r0, r5, #0
	adds r0, #0xa8
	ldrh r0, [r0]
	bl FUN_0201FCC0
	movs r1, #0xb6
	adds r2, r5, #0
	ldrsh r1, [r5, r1]
	adds r2, #0xbc
	ldr r2, [r2]
	lsls r1, r1, #0xc
	muls r0, r2, r0
	subs r2, r1, r0
	adds r0, r5, #0
	adds r0, #0xa0
	movs r3, #1
	ldr r0, [r0]
	adds r1, r6, r7
	lsls r3, r3, #0x14
	bl FUN_0200DF44
	ldr r0, [sp]
	adds r5, #0x50
	adds r0, r0, #1
	str r0, [sp]
	movs r0, #5
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	ldr r0, [sp]
	cmp r0, r1
	blt _0226295E
_02262A58:
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02262A88:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #3
	bl ov92_02261E88
	movs r1, #0x51
	str r0, [sp, #0xc]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xf0
	movs r2, #0
	movs r3, #2
	bl ov92_02261F60
	movs r1, #0x52
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ov92_02262018
	movs r2, #1
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _02262B9C
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262B9C
	cmp r0, #0
	beq _02262B9C
	cmp r2, #0
	beq _02262B9C
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02262B0A:
	movs r3, #1
	movs r1, #0x51
	adds r0, r4, #0
	str r3, [sp, #0xc]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, #0xf0
	movs r2, #0
	bl ov92_022620D0
	movs r1, #0x52
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #2
	bl ov92_02261E88
	movs r1, #0x52
	str r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0x50
	movs r2, #1
	movs r3, #3
	bl ov92_02262018
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _02262B9C
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262B9C
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _02262B9C
	cmp r0, #0
	beq _02262B9C
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02262B84:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #1
	ldr r1, [r4, r1]
	adds r0, #0xf0
	adds r3, r2, #0
	bl ov92_022620D0
	str r0, [sp, #0x10]
	cmp r0, #0
	bne _02262B9E
_02262B9C:
	b _02262CE8
_02262B9E:
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02262BB0:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #2
	bl ov92_02261F60
	movs r1, #0x51
	str r0, [sp, #0xc]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xf0
	movs r2, #0
	movs r3, #3
	bl ov92_02261E88
	movs r2, #1
	movs r1, #0x52
	str r0, [sp, #0x10]
	adds r0, r4, #0
	str r2, [sp, #0x14]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, #0x50
	movs r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _02262CE8
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262CE8
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _02262CE8
	cmp r0, #0
	beq _02262CE8
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02262C2C:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #1
	bl ov92_022620D0
	movs r2, #1
	movs r1, #0x52
	str r0, [sp, #0xc]
	adds r0, r4, #0
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, #0x50
	movs r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _02262CE8
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262CE8
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _02262CE8
	cmp r0, #0
	beq _02262CE8
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02262C96:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #1
	ldr r1, [r4, r1]
	adds r0, #0xa0
	adds r3, r2, #0
	bl ov92_022620D0
	str r0, [sp, #0xc]
	cmp r0, #0
	beq _02262CE8
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	movs r1, #0x53
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #1
	beq _02262CCE
	adds r0, r0, #1
	str r0, [r4, r1]
	movs r0, #1
	adds r1, #0x1c
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_02262CCE:
	movs r0, #0
	str r0, [r4, r1]
	adds r0, r1, #0
	adds r0, #0x1c
	ldr r0, [r4, r0]
	adds r1, #0x1c
	adds r0, r0, #1
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_02262CE2:
	adds r0, r5, #0
	bl FUN_0200E390
_02262CE8:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov92_022628F0

	thumb_func_start ov92_02262CEC
ov92_02262CEC: @ 0x02262CEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r3, _02262D48 @ =0x02263E4C
	add r2, sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02262D16
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, #0x34
	ldrb r1, [r1]
	cmp r1, #1
	bne _02262D20
_02262D16:
	adds r0, r5, #0
	bl FUN_0200E390
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_02262D20:
	adds r1, r0, #0
	subs r1, #0x14
	ldr r1, [r4, r1]
	cmp r1, #6
	bls _02262D2C
	b _022630DE
_02262D2C:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02262D38: @ jump table
	.2byte _02262D4C - _02262D38 - 2 @ case 0
	.2byte _02262E84 - _02262D38 - 2 @ case 1
	.2byte _02262F06 - _02262D38 - 2 @ case 2
	.2byte _02262F80 - _02262D38 - 2 @ case 3
	.2byte _02262FAC - _02262D38 - 2 @ case 4
	.2byte _02263028 - _02262D38 - 2 @ case 5
	.2byte _02263092 - _02262D38 - 2 @ case 6
	.2byte _022673FA - _02262D38 - 2 @ case 7
_02262D48: .4byte 0x02263E4C
_02262D4C:
	subs r0, #0x3c
	ldr r0, [r4, r0]
	movs r1, #0
	str r1, [sp]
	cmp r0, #0
	ble _02262E54
	adds r5, r4, #0
_02262D5A:
	movs r0, #0
	strh r0, [r5, #8]
	movs r0, #0x80
	strh r0, [r5, #0x14]
	movs r0, #0xa0
	strh r0, [r5, #0x16]
	movs r0, #0x40
	str r0, [r5, #0x18]
	movs r0, #0x18
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	movs r1, #1
	bl FUN_0200DCE8
	adds r1, r5, #0
	adds r1, #0xa8
	movs r0, #0
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0xb4
	movs r0, #0x80
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0xb6
	movs r0, #0xa0
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0xb8
	movs r0, #0x40
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0xbc
	movs r0, #0x18
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r3, #1
	ldr r0, [r5]
	add r1, sp, #8
	add r2, sp, #4
	lsls r3, r3, #0x14
	bl FUN_0200DF70
	ldrh r0, [r5, #8]
	bl FUN_0201FCAC
	movs r1, #0x14
	ldrsh r1, [r5, r1]
	lsls r6, r1, #0xc
	ldr r1, [r5, #0x18]
	adds r7, r1, #0
	muls r7, r0, r7
	ldrh r0, [r5, #8]
	bl FUN_0201FCC0
	movs r1, #0x16
	ldrsh r1, [r5, r1]
	lsls r3, r1, #0xc
	ldr r1, [r5, #0x1c]
	adds r2, r1, #0
	muls r2, r0, r2
	adds r2, r3, r2
	movs r3, #1
	ldr r0, [r5]
	adds r1, r6, r7
	lsls r3, r3, #0x14
	bl FUN_0200DF44
	adds r0, r5, #0
	adds r0, #0xa0
	movs r3, #1
	ldr r0, [r0]
	add r1, sp, #8
	add r2, sp, #4
	lsls r3, r3, #0x14
	bl FUN_0200DF70
	adds r0, r5, #0
	adds r0, #0xa8
	ldrh r0, [r0]
	bl FUN_0201FCAC
	movs r1, #0xb4
	ldrsh r1, [r5, r1]
	lsls r6, r1, #0xc
	adds r1, r5, #0
	adds r1, #0xb8
	ldr r1, [r1]
	adds r7, r1, #0
	muls r7, r0, r7
	adds r0, r5, #0
	adds r0, #0xa8
	ldrh r0, [r0]
	bl FUN_0201FCC0
	movs r1, #0xb6
	adds r2, r5, #0
	ldrsh r1, [r5, r1]
	adds r2, #0xbc
	ldr r2, [r2]
	lsls r1, r1, #0xc
	muls r0, r2, r0
	subs r2, r1, r0
	adds r0, r5, #0
	adds r0, #0xa0
	movs r3, #1
	ldr r0, [r0]
	adds r1, r6, r7
	lsls r3, r3, #0x14
	bl FUN_0200DF44
	ldr r0, [sp]
	adds r5, #0x50
	adds r0, r0, #1
	str r0, [sp]
	movs r0, #5
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	ldr r0, [sp]
	cmp r0, r1
	blt _02262D5A
_02262E54:
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02262E84:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #3
	bl ov92_02261E88
	movs r1, #0x51
	str r0, [sp, #0xc]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xf0
	movs r2, #0
	movs r3, #2
	bl ov92_02261F60
	movs r1, #0x52
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #3
	bl ov92_02262018
	movs r2, #1
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _02262F98
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262F98
	cmp r0, #0
	beq _02262F98
	cmp r2, #0
	beq _02262F98
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	ldr r0, [r4, #0x50]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02262F06:
	movs r3, #1
	movs r1, #0x51
	adds r0, r4, #0
	str r3, [sp, #0xc]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, #0xf0
	movs r2, #0
	bl ov92_022620D0
	movs r1, #0x52
	str r0, [sp, #0x10]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #2
	bl ov92_02261E88
	movs r1, #0x52
	str r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0x50
	movs r2, #1
	movs r3, #3
	bl ov92_02262018
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _02262F98
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _02262F98
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _02262F98
	cmp r0, #0
	beq _02262F98
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02262F80:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #1
	ldr r1, [r4, r1]
	adds r0, #0xf0
	adds r3, r2, #0
	bl ov92_022620D0
	str r0, [sp, #0x10]
	cmp r0, #0
	bne _02262F9A
_02262F98:
	b _022630E4
_02262F9A:
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02262FAC:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #2
	bl ov92_02261F60
	movs r1, #0x51
	str r0, [sp, #0xc]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xf0
	movs r2, #0
	movs r3, #3
	bl ov92_02261E88
	movs r2, #1
	movs r1, #0x52
	str r0, [sp, #0x10]
	adds r0, r4, #0
	str r2, [sp, #0x14]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, #0x50
	movs r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _022630E4
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _022630E4
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _022630E4
	cmp r0, #0
	beq _022630E4
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02263028:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xa0
	movs r2, #0
	movs r3, #1
	bl ov92_022620D0
	movs r2, #1
	movs r1, #0x52
	str r0, [sp, #0xc]
	adds r0, r4, #0
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, #0x50
	movs r3, #2
	bl ov92_02261E88
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x18]
	cmp r1, #0
	beq _022630E4
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _022630E4
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _022630E4
	cmp r0, #0
	beq _022630E4
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0xf0
	bl ov92_02261E80
	adds r0, r4, #0
	bl ov92_02261E80
	adds r0, r4, #0
	adds r0, #0x50
	bl ov92_02261E80
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02263092:
	movs r1, #0x51
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #1
	ldr r1, [r4, r1]
	adds r0, #0xa0
	adds r3, r2, #0
	bl ov92_022620D0
	str r0, [sp, #0xc]
	cmp r0, #0
	beq _022630E4
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov92_02261E80
	movs r1, #0x53
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #8
	beq _022630CA
	adds r0, r0, #1
	str r0, [r4, r1]
	movs r0, #1
	adds r1, #0x1c
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_022630CA:
	movs r0, #0
	str r0, [r4, r1]
	adds r0, r1, #0
	adds r0, #0x1c
	ldr r0, [r4, r0]
	adds r1, #0x1c
	adds r0, r0, #1
	add sp, #0x1c
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_022630DE:
	adds r0, r5, #0
	bl FUN_0200E390
_022630E4:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov92_02262CEC

	thumb_func_start ov92_022630E8
ov92_022630E8: @ 0x022630E8
	movs r1, #0xfe
	lsls r1, r1, #0x16
	str r1, [r0]
	movs r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov92_022630E8

	thumb_func_start ov92_022630F8
ov92_022630F8: @ 0x022630F8
	adds r3, r0, #0
	adds r2, r1, #0
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	bx lr
	.align 2, 0
	thumb_func_end ov92_022630F8

	thumb_func_start ov92_02263108
ov92_02263108: @ 0x02263108
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r1, [r4]
	blx FUN_020F22DC
	adds r7, r0, #0
	ldr r0, [r5, #4]
	ldr r1, [r4, #4]
	blx FUN_020F22DC
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F24C8
	adds r7, r0, #0
	ldr r0, [r5, #8]
	ldr r1, [r4, #8]
	blx FUN_020F22DC
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F24C8
	adds r7, r0, #0
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0xc]
	blx FUN_020F22DC
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F24C8
	str r0, [r6]
	ldr r0, [r5, #8]
	ldr r1, [r4, #0xc]
	blx FUN_020F22DC
	adds r7, r0, #0
	ldr r0, [r5]
	ldr r1, [r4, #4]
	blx FUN_020F22DC
	str r0, [sp]
	ldr r0, [r5, #4]
	ldr r1, [r4]
	blx FUN_020F22DC
	adds r1, r0, #0
	ldr r0, [sp]
	blx FUN_020F1520
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F1520
	adds r7, r0, #0
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #8]
	blx FUN_020F22DC
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F24C8
	str r0, [r6, #4]
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #4]
	blx FUN_020F22DC
	adds r7, r0, #0
	ldr r0, [r5, #8]
	ldr r1, [r4]
	blx FUN_020F22DC
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r4, #8]
	blx FUN_020F22DC
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	ldr r1, [r4, #0xc]
	blx FUN_020F22DC
	adds r1, r0, #0
	ldr r0, [sp, #8]
	blx FUN_020F24C8
	adds r1, r0, #0
	ldr r0, [sp, #4]
	blx FUN_020F1520
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F1520
	str r0, [r6, #8]
	ldr r0, [r5, #0xc]
	ldr r1, [r4]
	blx FUN_020F22DC
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r4, #0xc]
	blx FUN_020F22DC
	adds r7, r0, #0
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	blx FUN_020F22DC
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F1520
	adds r7, r0, #0
	ldr r0, [r5, #8]
	ldr r1, [r4, #4]
	blx FUN_020F22DC
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F24C8
	adds r1, r0, #0
	ldr r0, [sp, #0xc]
	blx FUN_020F1520
	str r0, [r6, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov92_02263108

	thumb_func_start ov92_02263218
ov92_02263218: @ 0x02263218
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r1, r0, #0
	blx FUN_020F1520
	adds r4, r0, #0
	ldr r0, [r5, #8]
	adds r1, r0, #0
	blx FUN_020F1520
	adds r6, r0, #0
	ldr r0, [r5]
	adds r1, r0, #0
	blx FUN_020F22DC
	adds r7, r0, #0
	ldr r0, [r5, #4]
	adds r1, r0, #0
	blx FUN_020F1520
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F1520
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020F1520
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020F1520
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov92_02263218

	thumb_func_start ov92_0226325C
ov92_0226325C: @ 0x0226325C
	push {r4, lr}
	adds r4, r0, #0
	bl ov92_02263218
	movs r1, #0
	blx FUN_020F1ACC
	bls _02263286
	adds r0, r4, #0
	bl ov92_02263218
	adds r1, r0, #0
	ldr r0, _022632B0 @ =0x45800000
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0226329C
_02263286:
	adds r0, r4, #0
	bl ov92_02263218
	adds r1, r0, #0
	ldr r0, _022632B0 @ =0x45800000
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0226329C:
	blx FUN_020F2104
	blx FUN_020CCBEC
	blx FUN_020F2178
	ldr r1, _022632B0 @ =0x45800000
	blx FUN_020F1CC8
	pop {r4, pc}
	.align 2, 0
_022632B0: .4byte 0x45800000
	thumb_func_end ov92_0226325C

	thumb_func_start ov92_022632B4
ov92_022632B4: @ 0x022632B4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	ldr r0, [r4]
	adds r1, r6, #0
	blx FUN_020F1CC8
	str r0, [r5]
	ldr r0, [r4, #4]
	adds r1, r6, #0
	blx FUN_020F1CC8
	str r0, [r5, #4]
	ldr r0, [r4, #8]
	adds r1, r6, #0
	blx FUN_020F1CC8
	str r0, [r5, #8]
	ldr r0, [r4, #0xc]
	adds r1, r6, #0
	blx FUN_020F1CC8
	str r0, [r5, #0xc]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov92_022632B4

	thumb_func_start ov92_022632E8
ov92_022632E8: @ 0x022632E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [r5, #4]
	adds r1, r0, #0
	blx FUN_020F22DC
	blx FUN_020F2080
	adds r3, r1, #0
	movs r1, #1
	adds r2, r0, #0
	movs r0, #0
	lsls r1, r1, #0x1e
	blx FUN_020F0C54
	blx FUN_020F09A4
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	adds r1, r0, #0
	blx FUN_020F22DC
	blx FUN_020F2080
	adds r3, r1, #0
	movs r1, #1
	adds r2, r0, #0
	movs r0, #0
	lsls r1, r1, #0x1e
	blx FUN_020F0C54
	blx FUN_020F09A4
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	adds r1, r0, #0
	blx FUN_020F22DC
	blx FUN_020F2080
	adds r3, r1, #0
	movs r1, #1
	adds r2, r0, #0
	movs r0, #0
	lsls r1, r1, #0x1e
	blx FUN_020F0C54
	blx FUN_020F09A4
	adds r6, r0, #0
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	blx FUN_020F22DC
	blx FUN_020F2080
	adds r3, r1, #0
	movs r1, #1
	adds r2, r0, #0
	movs r0, #0
	lsls r1, r1, #0x1e
	blx FUN_020F0C54
	blx FUN_020F09A4
	str r0, [sp, #0x10]
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	blx FUN_020F22DC
	blx FUN_020F2080
	adds r3, r1, #0
	movs r1, #1
	adds r2, r0, #0
	movs r0, #0
	lsls r1, r1, #0x1e
	blx FUN_020F0C54
	blx FUN_020F09A4
	str r0, [sp, #0x14]
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #4]
	blx FUN_020F22DC
	blx FUN_020F2080
	adds r3, r1, #0
	movs r1, #1
	adds r2, r0, #0
	movs r0, #0
	lsls r1, r1, #0x1e
	blx FUN_020F0C54
	blx FUN_020F09A4
	str r0, [sp, #0x18]
	ldr r0, [r5, #4]
	ldr r1, [r5]
	blx FUN_020F22DC
	blx FUN_020F2080
	adds r3, r1, #0
	movs r1, #1
	adds r2, r0, #0
	movs r0, #0
	lsls r1, r1, #0x1e
	blx FUN_020F0C54
	blx FUN_020F09A4
	str r0, [sp, #0x1c]
	ldr r0, [r5, #8]
	ldr r1, [r5]
	blx FUN_020F22DC
	blx FUN_020F2080
	adds r3, r1, #0
	movs r1, #1
	adds r2, r0, #0
	movs r0, #0
	lsls r1, r1, #0x1e
	blx FUN_020F0C54
	blx FUN_020F09A4
	adds r7, r0, #0
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	blx FUN_020F22DC
	blx FUN_020F2080
	adds r3, r1, #0
	movs r1, #1
	adds r2, r0, #0
	movs r0, #0
	lsls r1, r1, #0x1e
	blx FUN_020F0C54
	blx FUN_020F09A4
	adds r5, r0, #0
	ldr r0, [sp, #0xc]
	blx FUN_020F2080
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r1, _022634F4 @ =0x3FF00000
	movs r0, #0
	blx FUN_020F116C
	str r0, [sp, #0x20]
	str r1, [sp, #4]
	adds r0, r6, #0
	blx FUN_020F2080
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #4]
	blx FUN_020F116C
	blx FUN_020F09A4
	str r0, [r4]
	ldr r0, [sp, #0x10]
	adds r1, r5, #0
	blx FUN_020F1520
	str r0, [r4, #4]
	ldr r0, [sp, #0x18]
	adds r1, r7, #0
	blx FUN_020F24C8
	str r0, [r4, #8]
	movs r0, #0
	str r0, [r4, #0xc]
	ldr r0, [sp, #0x10]
	adds r1, r5, #0
	blx FUN_020F24C8
	str r0, [r4, #0x10]
	adds r0, r6, #0
	blx FUN_020F2080
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r1, _022634F4 @ =0x3FF00000
	movs r0, #0
	blx FUN_020F116C
	adds r6, r0, #0
	ldr r0, [sp, #8]
	adds r5, r1, #0
	blx FUN_020F2080
	adds r2, r0, #0
	adds r3, r1, #0
	adds r0, r6, #0
	adds r1, r5, #0
	blx FUN_020F116C
	blx FUN_020F09A4
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	blx FUN_020F1520
	str r0, [r4, #0x18]
	movs r0, #0
	str r0, [r4, #0x1c]
	ldr r0, [sp, #0x18]
	adds r1, r7, #0
	blx FUN_020F1520
	str r0, [r4, #0x20]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	blx FUN_020F24C8
	str r0, [r4, #0x24]
	ldr r0, [sp, #8]
	blx FUN_020F2080
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r1, _022634F4 @ =0x3FF00000
	movs r0, #0
	blx FUN_020F116C
	adds r6, r0, #0
	ldr r0, [sp, #0xc]
	adds r5, r1, #0
	blx FUN_020F2080
	adds r2, r0, #0
	adds r3, r1, #0
	adds r0, r6, #0
	adds r1, r5, #0
	blx FUN_020F116C
	blx FUN_020F09A4
	str r0, [r4, #0x28]
	movs r0, #0
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	str r0, [r4, #0x38]
	movs r0, #0xfe
	lsls r0, r0, #0x16
	str r0, [r4, #0x3c]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_022634F4: .4byte 0x3FF00000
	thumb_func_end ov92_022632E8

	thumb_func_start ov92_022634F8
ov92_022634F8: @ 0x022634F8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _0226351C
	ldr r1, [r5]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0226352A
_0226351C:
	ldr r1, [r5]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0226352A:
	blx FUN_020F2104
	str r0, [r4]
	ldr r0, [r5, #4]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _0226354E
	ldr r1, [r5, #4]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0226355C
_0226354E:
	ldr r1, [r5, #4]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0226355C:
	blx FUN_020F2104
	str r0, [r4, #4]
	ldr r0, [r5, #8]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _02263580
	ldr r1, [r5, #8]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0226358E
_02263580:
	ldr r1, [r5, #8]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0226358E:
	blx FUN_020F2104
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _022635B2
	ldr r1, [r5, #0xc]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022635C0
_022635B2:
	ldr r1, [r5, #0xc]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022635C0:
	blx FUN_020F2104
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x10]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _022635E4
	ldr r1, [r5, #0x10]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022635F2
_022635E4:
	ldr r1, [r5, #0x10]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022635F2:
	blx FUN_020F2104
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x14]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _02263616
	ldr r1, [r5, #0x14]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02263624
_02263616:
	ldr r1, [r5, #0x14]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02263624:
	blx FUN_020F2104
	str r0, [r4, #0x14]
	ldr r0, [r5, #0x18]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _02263648
	ldr r1, [r5, #0x18]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02263656
_02263648:
	ldr r1, [r5, #0x18]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02263656:
	blx FUN_020F2104
	str r0, [r4, #0x18]
	ldr r0, [r5, #0x1c]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _0226367A
	ldr r1, [r5, #0x1c]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02263688
_0226367A:
	ldr r1, [r5, #0x1c]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02263688:
	blx FUN_020F2104
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x20]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _022636AC
	ldr r1, [r5, #0x20]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022636BA
_022636AC:
	ldr r1, [r5, #0x20]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022636BA:
	blx FUN_020F2104
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x24]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _022636DE
	ldr r1, [r5, #0x24]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022636EC
_022636DE:
	ldr r1, [r5, #0x24]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022636EC:
	blx FUN_020F2104
	str r0, [r4, #0x24]
	ldr r0, [r5, #0x28]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _02263710
	ldr r1, [r5, #0x28]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0226371E
_02263710:
	ldr r1, [r5, #0x28]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0226371E:
	blx FUN_020F2104
	str r0, [r4, #0x28]
	ldr r0, [r5, #0x2c]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _02263742
	ldr r1, [r5, #0x2c]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02263750
_02263742:
	ldr r1, [r5, #0x2c]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02263750:
	blx FUN_020F2104
	str r0, [r4, #0x2c]
	ldr r0, [r5, #0x30]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _02263774
	ldr r1, [r5, #0x30]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02263782
_02263774:
	ldr r1, [r5, #0x30]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02263782:
	blx FUN_020F2104
	str r0, [r4, #0x30]
	ldr r0, [r5, #0x34]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _022637A6
	ldr r1, [r5, #0x34]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022637B4
_022637A6:
	ldr r1, [r5, #0x34]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022637B4:
	blx FUN_020F2104
	str r0, [r4, #0x34]
	ldr r0, [r5, #0x38]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _022637D8
	ldr r1, [r5, #0x38]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022637E6
_022637D8:
	ldr r1, [r5, #0x38]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022637E6:
	blx FUN_020F2104
	str r0, [r4, #0x38]
	ldr r0, [r5, #0x3c]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _02263820 @ =0x45800000
	bls _0226380A
	ldr r1, [r5, #0x3c]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02263818
_0226380A:
	ldr r1, [r5, #0x3c]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02263818:
	blx FUN_020F2104
	str r0, [r4, #0x3c]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02263820: .4byte 0x45800000
	thumb_func_end ov92_022634F8

	thumb_func_start ov92_02263824
ov92_02263824: @ 0x02263824
	push {r4, lr}
	sub sp, #0x40
	adds r4, r1, #0
	add r1, sp, #0
	bl ov92_022634F8
	add r0, sp, #0
	adds r1, r4, #0
	blx FUN_020CC070
	add sp, #0x40
	pop {r4, pc}
	thumb_func_end ov92_02263824

	.rodata

_0226383C:
	.byte 0x41, 0xC5, 0x25, 0x02
	.byte 0x8D, 0xC5, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x59, 0xC5, 0x25, 0x02, 0x89, 0xC5, 0x25, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x65, 0xC5, 0x25, 0x02, 0x91, 0xC5, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x79, 0xC5, 0x25, 0x02, 0x95, 0xC5, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x85, 0xC5, 0x25, 0x02
	.byte 0x99, 0xC5, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00
	.byte 0x10, 0x00, 0x10, 0x00, 0x80, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x05, 0x05, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x07, 0x05
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x09, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x16, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x17, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x19, 0x01
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x1B, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x31, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x31, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x31, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x31, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD8, 0xFF, 0x00, 0x00, 0xE2, 0xFF
	.byte 0x00, 0x00, 0xEC, 0xFF, 0x00, 0x00, 0xF6, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00
	.byte 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD8, 0xFF, 0x00, 0x00, 0xE2, 0xFF
	.byte 0x00, 0x00, 0xEC, 0xFF, 0x00, 0x00, 0xF6, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00
	.byte 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0xB4, 0x00, 0x18, 0x00, 0xE8, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF, 0xFF
	.byte 0x00, 0xF0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x55, 0x00, 0xAA, 0x00, 0x00, 0x00, 0x40, 0x00, 0x80, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x08, 0x00
	.byte 0x08, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x08, 0x00, 0x08, 0x00, 0x02, 0x00, 0x13, 0x00, 0x08, 0x00
	.byte 0x08, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08, 0x00
	.byte 0x08, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x08, 0x00, 0x08, 0x00, 0x02, 0x00, 0x17, 0x00, 0x08, 0x00
	.byte 0x08, 0x00, 0x02, 0x00, 0xFE, 0x80, 0x80, 0x30, 0xFF, 0x00, 0x00, 0x00, 0xFE, 0x80, 0x80, 0x40
	.byte 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00, 0xBC, 0x02, 0x78, 0x05
	.byte 0x34, 0x08, 0xF0, 0x0A, 0x78, 0x00, 0x5A, 0x00, 0x3C, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x40, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x40, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00
	.byte 0x29, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
	.byte 0xFE, 0xFF, 0xFE, 0xFF, 0xFE, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x03, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x06, 0x00, 0x06, 0x00, 0x07, 0x00, 0x07, 0x00, 0x08, 0x00, 0x08, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00
	.byte 0x25, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xEE, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFD, 0xFF, 0xFD, 0xFF, 0xFE, 0xFF, 0xFE, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xEE, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x28, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0xBC, 0x00, 0xBC, 0x00, 0xB4, 0x00, 0xB4, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x3A, 0x00
	.byte 0xE6, 0x00, 0x30, 0x00, 0x80, 0x00, 0x20, 0x00, 0x28, 0x00, 0x40, 0x00, 0xB4, 0x00, 0x30, 0x00
	.byte 0x00, 0xB0, 0xFF, 0xFF, 0x00, 0x30, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xD0, 0xFF, 0xFF
	.byte 0x00, 0x30, 0x00, 0x00, 0x00, 0xE0, 0xFF, 0xFF, 0x00, 0x40, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00
	.byte 0x00, 0xC0, 0xFF, 0xFF, 0x00, 0xB0, 0xFF, 0xFF, 0x00, 0xD0, 0xFF, 0xFF, 0x00, 0x20, 0x00, 0x00
	.byte 0x96, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA1, 0x1B, 0x26, 0x02
	.byte 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xA5, 0x21, 0x26, 0x02, 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA5, 0x21, 0x26, 0x02
	.byte 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x49, 0x25, 0x26, 0x02, 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x49, 0x25, 0x26, 0x02
	.byte 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF1, 0x28, 0x26, 0x02, 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xED, 0x2C, 0x26, 0x02
	.byte 0x96, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xED, 0x2C, 0x26, 0x02

	.data

_02264020:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02264160:
	@ 0x02264160
