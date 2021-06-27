
	thumb_func_start ov39_02227060
ov39_02227060: @ 0x02227060
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r4, #0
	bl ov39_0222915C
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x5c
	bl FUN_020275C4
	adds r4, #0x5c
	strh r0, [r4]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov39_02227060

	thumb_func_start ov39_02227080
ov39_02227080: @ 0x02227080
	ldr r3, _02227084 @ =ov39_02229224
	bx r3
	.align 2, 0
_02227084: .4byte ov39_02229224
	thumb_func_end ov39_02227080

	thumb_func_start ov39_02227088
ov39_02227088: @ 0x02227088
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r2, #0
	movs r2, #0x67
	adds r5, r1, #0
	adds r7, r3, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020D4994
	ldr r1, [sp, #0x28]
	movs r0, #0x3c
	bl FUN_02026354
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_02073F00
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x14
	bl FUN_02026A68
	adds r0, r4, #0
	bl FUN_02026380
	movs r4, #0
	str r7, [sp, #0xc]
	str r7, [sp, #8]
_022270CA:
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02074014
	ldr r1, [sp, #0xc]
	adds r2, r4, #0
	strh r0, [r1, #0x28]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0
	bl FUN_02074014
	ldr r1, [sp, #8]
	adds r2, r4, #0
	str r0, [r1, #0x64]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #7
	bl FUN_02074014
	ldr r1, [sp, #8]
	adds r2, r4, #0
	adds r1, #0xdc
	str r0, [r1]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0xae
	bl FUN_02074014
	ldr r1, _02227180 @ =0x000001EE
	cmp r0, r1
	bne _02227130
	adds r0, r1, #0
	subs r0, #0x9a
	ldr r1, [r7, r0]
	movs r0, #1
	lsls r0, r4
	orrs r1, r0
	movs r0, #0x55
	lsls r0, r0, #2
	str r1, [r7, r0]
_02227130:
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0x70
	bl FUN_02074014
	movs r1, #0x56
	adds r2, r7, r4
	lsls r1, r1, #2
	strb r0, [r2, r1]
	ldr r0, [sp, #0xc]
	adds r4, r4, #1
	adds r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	adds r0, r0, #4
	str r0, [sp, #8]
	cmp r4, #0x1e
	blt _022270CA
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_02073E98
	ldr r2, _02227184 @ =0x00000176
	movs r1, #0
	strb r0, [r7, r2]
	adds r0, r2, #1
	strb r1, [r7, r0]
	ldr r0, [sp, #4]
	adds r1, r7, #0
	adds r2, #0x22
	bl FUN_020275C4
	movs r1, #0x66
	lsls r1, r1, #2
	strh r0, [r7, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02227180: .4byte 0x000001EE
_02227184: .4byte 0x00000176
	thumb_func_end ov39_02227088

	thumb_func_start ov39_02227188
ov39_02227188: @ 0x02227188
	push {r4, lr}
	ldr r3, _022271A0 @ =0x00000177
	adds r4, r1, #0
	strb r2, [r4, r3]
	adds r3, #0x21
	adds r2, r3, #0
	bl FUN_020275C4
	movs r1, #0x66
	lsls r1, r1, #2
	strh r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_022271A0: .4byte 0x00000177
	thumb_func_end ov39_02227188

	thumb_func_start ov39_022271A4
ov39_022271A4: @ 0x022271A4
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r5, r1, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x80
	blx FUN_020D4994
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x80
	blx FUN_020D4A50
	pop {r3, r4, r5, pc}
	thumb_func_end ov39_022271A4

	thumb_func_start ov39_022271C0
ov39_022271C0: @ 0x022271C0
	ldr r3, _022271C8 @ =FUN_020D4A50
	movs r2, #0x80
	bx r3
	nop
_022271C8: .4byte FUN_020D4A50
	thumb_func_end ov39_022271C0

	thumb_func_start ov39_022271CC
ov39_022271CC: @ 0x022271CC
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r5, r1, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	blx FUN_020D4994
	ldrb r0, [r5, #0x19]
	movs r1, #1
	strb r0, [r4]
	ldrb r0, [r5, #0x1a]
	strb r0, [r4, #1]
	ldrb r0, [r5, #0x15]
	strb r0, [r4, #2]
	ldrb r0, [r5, #0x16]
	strb r0, [r4, #3]
	ldrh r0, [r5, #0x1c]
	strh r0, [r4, #4]
	ldrb r0, [r4, #6]
	bics r0, r1
	ldrb r1, [r5, #0x1b]
	lsls r1, r1, #0x1f
	lsrs r2, r1, #0x1f
	movs r1, #1
	ands r1, r2
	orrs r0, r1
	strb r0, [r4, #6]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov39_022271CC

	thumb_func_start ov39_02227208
ov39_02227208: @ 0x02227208
	push {r4, r5, r6, lr}
	ldr r2, _022272E4 @ =0x00000414
	adds r4, r1, #0
	movs r1, #0
	adds r5, r0, #0
	blx FUN_020D4994
	movs r0, #0x51
	adds r3, r4, #0
	ldr r1, [r4, #4]
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r1, [r4, #8]
	adds r0, #0xc
	str r1, [r5]
	adds r3, #0xc
	adds r2, r5, r0
	movs r6, #5
_0222722C:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r6, r6, #1
	bne _0222722C
	ldr r0, [r3]
	movs r1, #0x53
	str r0, [r2]
	ldr r0, [r4, #0x3c]
	lsls r1, r1, #2
	str r0, [r5, #8]
	ldr r0, [r4, #0x38]
	ldr r2, _022272E8 @ =0x000059DC
	str r0, [r5, #4]
	movs r0, #0
	mvns r0, r0
	str r0, [r5, r1]
	movs r1, #0xfa
	lsls r1, r1, #2
	str r2, [r5, r1]
	adds r1, r1, #4
	str r2, [r5, r1]
	blx ov39_0222A2C0
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl FUN_0201AA8C
	movs r1, #0xed
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	mvns r0, r0
	blx ov39_0222A2C0
	adds r2, r0, #0
	movs r0, #0xed
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	blx FUN_020D4994
	movs r2, #0x32
	ldr r3, [r4, #4]
	movs r0, #0
	movs r1, #0x1b
	lsls r2, r2, #4
	bl FUN_0200BAF8
	movs r1, #0xfd
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r4, #4]
	bl FUN_0200BD08
	movs r1, #0xfe
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #1
	ldr r1, [r4, #4]
	lsls r0, r0, #8
	bl FUN_02026354
	movs r1, #0xff
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r4, #4]
	bl ov39_02227DEC
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r4]
	str r0, [r5, #0xc]
	movs r0, #7
	strb r0, [r5, #0x10]
	movs r0, #2
	strb r0, [r5, #0x11]
	adds r0, r5, #0
	adds r0, #0xc
	blx ov39_0222A110
	cmp r0, #1
	beq _022272D6
	bl GF_AssertFail
_022272D6:
	movs r1, #0xf1
	movs r0, #1
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0xc
	str r0, [r5, r1]
	pop {r4, r5, r6, pc}
	.align 2, 0
_022272E4: .4byte 0x00000414
_022272E8: .4byte 0x000059DC
	thumb_func_end ov39_02227208

	thumb_func_start ov39_022272EC
ov39_022272EC: @ 0x022272EC
	push {r4, lr}
	adds r4, r0, #0
	blx ov39_0222A130
	movs r0, #0xf1
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, #0x38
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0xfe
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	movs r0, #0xfd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	movs r0, #0xed
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	bl ov39_02227E3C
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov39_022272EC

	thumb_func_start ov39_02227334
ov39_02227334: @ 0x02227334
	push {r4, lr}
	adds r4, r0, #0
	blx ov39_0222A130
	movs r0, #0xf1
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov39_02227334

	thumb_func_start ov39_02227348
ov39_02227348: @ 0x02227348
	push {r4, lr}
	adds r4, r0, #0
	blx FUN_021EC210
	blx FUN_021EC8D8
	bl FUN_0203946C
	movs r0, #0xf2
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov39_02227348

	thumb_func_start ov39_02227364
ov39_02227364: @ 0x02227364
	push {r4, lr}
	movs r1, #0x3e
	adds r4, r0, #0
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	rsbs r0, r0, #0
	bl FUN_021E6A70
	movs r2, #0x3e
	lsls r2, r2, #4
	ldr r2, [r4, r2]
	adds r1, r0, #0
	adds r0, r4, #0
	rsbs r2, r2, #0
	bl ov39_02227D5C
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov39_02227364

	thumb_func_start ov39_0222738C
ov39_0222738C: @ 0x0222738C
	push {r3, lr}
	ldr r1, _022273AC @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #1
	tst r1, r2
	bne _0222739E
	movs r1, #2
	tst r1, r2
	beq _022273A8
_0222739E:
	movs r1, #0
	bl ov39_02227D50
	movs r0, #1
	pop {r3, pc}
_022273A8:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_022273AC: .4byte 0x021D110C
	thumb_func_end ov39_0222738C

	thumb_func_start ov39_022273B0
ov39_022273B0: @ 0x022273B0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022273C4
	movs r0, #0
	pop {r4, r5, r6, pc}
_022273C4:
	movs r2, #0x19
	lsls r2, r2, #4
	ldr r0, [r5]
	adds r1, r4, #0
	adds r2, r5, r2
	bl ov39_022271A4
	movs r2, #0x21
	lsls r2, r2, #4
	ldr r0, [r5]
	adds r1, r6, #0
	adds r2, r5, r2
	bl ov39_02227060
	ldr r0, _022273F0 @ =0x00000411
	movs r1, #0x3c
	strb r1, [r5, r0]
	ldr r1, _022273F4 @ =0x00004E20
	subs r0, #0x29
	str r1, [r5, r0]
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_022273F0: .4byte 0x00000411
_022273F4: .4byte 0x00004E20
	thumb_func_end ov39_022273B0

	thumb_func_start ov39_022273F8
ov39_022273F8: @ 0x022273F8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _0222740A
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222740A:
	movs r0, #0xeb
	lsls r0, r0, #2
	strh r4, [r5, r0]
	ldr r1, _0222741C @ =0x00004E21
	adds r0, #0x3c
	str r1, [r5, r0]
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0222741C: .4byte 0x00004E21
	thumb_func_end ov39_022273F8

	thumb_func_start ov39_02227420
ov39_02227420: @ 0x02227420
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _02227436
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02227436:
	movs r0, #0xeb
	lsls r0, r0, #2
	strb r4, [r5, r0]
	movs r2, #0x19
	lsls r2, r2, #4
	ldr r1, [sp, #0x18]
	adds r0, r0, #1
	strb r1, [r5, r0]
	ldr r0, [r5]
	adds r1, r6, #0
	adds r2, r5, r2
	bl ov39_022271A4
	movs r3, #0x51
	lsls r3, r3, #2
	ldr r0, [r5, r3]
	adds r3, #0xcc
	str r0, [sp]
	ldr r0, [r5]
	ldr r2, [sp, #0x18]
	adds r1, r7, #0
	adds r3, r5, r3
	bl ov39_02227088
	movs r1, #0x21
	lsls r1, r1, #4
	ldr r0, [r5]
	adds r1, r5, r1
	adds r2, r4, #0
	bl ov39_02227188
	ldr r0, _02227484 @ =0x00000411
	movs r1, #0x3c
	strb r1, [r5, r0]
	ldr r1, _02227488 @ =0x00005208
	subs r0, #0x29
	str r1, [r5, r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02227484: .4byte 0x00000411
_02227488: .4byte 0x00005208
	thumb_func_end ov39_02227420

	thumb_func_start ov39_0222748C
ov39_0222748C: @ 0x0222748C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _0222749E
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222749E:
	movs r0, #0xeb
	lsls r0, r0, #2
	strb r4, [r5, r0]
	ldr r1, _022274B0 @ =0x00005209
	adds r0, #0x3c
	str r1, [r5, r0]
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_022274B0: .4byte 0x00005209
	thumb_func_end ov39_0222748C

	thumb_func_start ov39_022274B4
ov39_022274B4: @ 0x022274B4
	push {r4, lr}
	adds r4, r0, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022274C4
	movs r0, #0
	pop {r4, pc}
_022274C4:
	movs r0, #0xfa
	ldr r1, _022274D0 @ =0x000055F0
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_022274D0: .4byte 0x000055F0
	thumb_func_end ov39_022274B4

	thumb_func_start ov39_022274D4
ov39_022274D4: @ 0x022274D4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022274E8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022274E8:
	ldr r0, [r5]
	bl FUN_02028EC0
	movs r1, #0x66
	lsls r1, r1, #2
	adds r1, r5, r1
	movs r2, #4
	blx FUN_020D4A50
	movs r2, #0x19
	lsls r2, r2, #4
	ldr r0, [r5]
	adds r1, r6, #0
	adds r2, r5, r2
	bl ov39_022271CC
	movs r0, #0x67
	lsls r0, r0, #2
	movs r6, #0
	adds r7, r5, #0
	adds r1, r0, #4
_02227512:
	ldr r3, [r4]
	ldr r2, [r4, #4]
	adds r6, r6, #1
	str r3, [r7, r0]
	str r2, [r7, r1]
	adds r4, #8
	adds r7, #8
	cmp r6, #3
	blt _02227512
	movs r0, #0xfa
	ldr r1, _02227530 @ =0x000055F1
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02227530: .4byte 0x000055F1
	thumb_func_end ov39_022274D4

	thumb_func_start ov39_02227534
ov39_02227534: @ 0x02227534
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _02227546
	movs r0, #0
	pop {r3, r4, r5, pc}
_02227546:
	bl FUN_0202FBCC
	subs r1, r0, #4
	ldr r0, _02227584 @ =0x00001D4C
	cmp r1, r0
	beq _02227556
	bl GF_AssertFail
_02227556:
	bl FUN_0202FC74
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5]
	bl FUN_02244B3C
	bl FUN_020307DC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	blx FUN_020D4A50
	ldr r0, _02227588 @ =0x00000411
	movs r1, #0x3c
	strb r1, [r5, r0]
	ldr r1, _0222758C @ =0x000059D8
	subs r0, #0x29
	str r1, [r5, r0]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_02227584: .4byte 0x00001D4C
_02227588: .4byte 0x00000411
_0222758C: .4byte 0x000059D8
	thumb_func_end ov39_02227534

	thumb_func_start ov39_02227590
ov39_02227590: @ 0x02227590
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022275A6
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022275A6:
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	movs r2, #0x10
	blx FUN_020D4994
	movs r1, #0x19
	lsls r1, r1, #4
	strh r4, [r5, r1]
	adds r0, r1, #2
	strb r6, [r5, r0]
	adds r0, r1, #3
	strb r7, [r5, r0]
	add r0, sp, #8
	ldrb r2, [r0, #0x10]
	adds r0, r1, #4
	strb r2, [r5, r0]
	adds r0, r1, #0
	subs r0, #0x50
	adds r1, #8
	str r0, [r5, r1]
	movs r0, #0x3f
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
	ldr r1, _022275E4 @ =0x000059D9
	subs r0, #8
	str r1, [r5, r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022275E4: .4byte 0x000059D9
	thumb_func_end ov39_02227590

	thumb_func_start ov39_022275E8
ov39_022275E8: @ 0x022275E8
	push {r4, lr}
	adds r4, r0, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022275F8
	movs r0, #0
	pop {r4, pc}
_022275F8:
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	movs r2, #0x10
	blx FUN_020D4994
	movs r0, #0x19
	ldr r1, _02227640 @ =0x0000FFFF
	lsls r0, r0, #4
	strh r1, [r4, r0]
	movs r1, #0xfe
	adds r0, r1, #0
	adds r0, #0x94
	strb r1, [r4, r0]
	movs r1, #0xff
	adds r0, r1, #0
	adds r0, #0x94
	strb r1, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x95
	strb r1, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x41
	adds r1, #0x99
	str r0, [r4, r1]
	movs r0, #0x3f
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
	ldr r1, _02227644 @ =0x000059D9
	subs r0, #8
	str r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
	nop
_02227640: .4byte 0x0000FFFF
_02227644: .4byte 0x000059D9
	thumb_func_end ov39_022275E8

	thumb_func_start ov39_02227648
ov39_02227648: @ 0x02227648
	push {r4, lr}
	adds r4, r0, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _02227658
	movs r0, #0
	pop {r4, pc}
_02227658:
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	movs r2, #0x10
	blx FUN_020D4994
	movs r0, #0x19
	ldr r1, _0222769C @ =0x0000FFFF
	lsls r0, r0, #4
	strh r1, [r4, r0]
	movs r1, #0xff
	adds r0, r1, #0
	adds r0, #0x93
	strb r1, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x94
	strb r1, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x95
	strb r1, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x41
	adds r1, #0x99
	str r0, [r4, r1]
	movs r0, #0x3f
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
	ldr r1, _022276A0 @ =0x000059D9
	subs r0, #8
	str r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0222769C: .4byte 0x0000FFFF
_022276A0: .4byte 0x000059D9
	thumb_func_end ov39_02227648

	thumb_func_start ov39_022276A4
ov39_022276A4: @ 0x022276A4
	push {r4, lr}
	adds r4, r0, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022276B4
	movs r0, #0
	pop {r4, pc}
_022276B4:
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	movs r2, #4
	blx FUN_020D4994
	movs r1, #5
	lsls r1, r1, #6
	adds r0, r1, #0
	adds r0, #0x50
	str r1, [r4, r0]
	movs r1, #0x3f
	movs r0, #1
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r2, _022276DC @ =0x000059D9
	subs r1, #8
	str r2, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_022276DC: .4byte 0x000059D9
	thumb_func_end ov39_022276A4

	thumb_func_start ov39_022276E0
ov39_022276E0: @ 0x022276E0
	push {r4, lr}
	adds r4, r0, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _022276F0
	movs r0, #0
	pop {r4, pc}
_022276F0:
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	movs r2, #4
	blx FUN_020D4994
	movs r1, #5
	lsls r1, r1, #6
	adds r0, r1, #0
	adds r0, #0x50
	str r1, [r4, r0]
	movs r0, #0x3f
	movs r1, #2
	lsls r0, r0, #4
	str r1, [r4, r0]
	ldr r1, _0222771C @ =0x000059D9
	subs r0, #8
	str r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
	nop
_0222771C: .4byte 0x000059D9
	thumb_func_end ov39_022276E0

	thumb_func_start ov39_02227720
ov39_02227720: @ 0x02227720
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _02227734
	movs r0, #0
	pop {r4, r5, r6, pc}
_02227734:
	movs r1, #0xeb
	lsls r1, r1, #2
	str r4, [r5, r1]
	adds r0, r1, #4
	str r6, [r5, r0]
	ldr r0, _02227748 @ =0x000059DA
	adds r1, #0x3c
	str r0, [r5, r1]
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_02227748: .4byte 0x000059DA
	thumb_func_end ov39_02227720

	thumb_func_start ov39_0222774C
ov39_0222774C: @ 0x0222774C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov39_02227DB8
	cmp r0, #0
	bne _02227760
	movs r0, #0
	pop {r4, r5, r6, pc}
_02227760:
	movs r1, #0xeb
	lsls r1, r1, #2
	str r4, [r5, r1]
	adds r0, r1, #4
	str r6, [r5, r0]
	ldr r0, _02227774 @ =0x000059DB
	adds r1, #0x3c
	str r0, [r5, r1]
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_02227774: .4byte 0x000059DB
	thumb_func_end ov39_0222774C

	thumb_func_start ov39_02227778
ov39_02227778: @ 0x02227778
	push {r4, lr}
	movs r1, #0xf1
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _02227836
	adds r0, r1, #0
	adds r0, #0x24
	ldr r2, [r4, r0]
	ldr r0, _022278C8 @ =0x000059DC
	cmp r2, r0
	beq _022277E4
	adds r0, r1, #0
	adds r0, #0x4d
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _022277AA
	adds r0, r1, #0
	adds r0, #0x4d
	ldrb r0, [r4, r0]
	adds r1, #0x4d
	subs r0, r0, #1
	strb r0, [r4, r1]
	b _022277E4
_022277AA:
	blx ov39_0222A13C
	cmp r0, #9
	bhi _022277E4
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022277BE: @ jump table
	.2byte _022277E4 - _022277BE - 2 @ case 0
	.2byte _022277D2 - _022277BE - 2 @ case 1
	.2byte _022277E4 - _022277BE - 2 @ case 2
	.2byte _022277E4 - _022277BE - 2 @ case 3
	.2byte _022277E4 - _022277BE - 2 @ case 4
	.2byte _022277E4 - _022277BE - 2 @ case 5
	.2byte _022277E4 - _022277BE - 2 @ case 6
	.2byte _022277D2 - _022277BE - 2 @ case 7
	.2byte _022277D2 - _022277BE - 2 @ case 8
	.2byte _022277D2 - _022277BE - 2 @ case 9
_022277D2:
	adds r0, r4, #0
	bl ov39_022278D4
	cmp r0, #1
	bne _022277E4
	movs r0, #0xfa
	ldr r1, _022278C8 @ =0x000059DC
	lsls r0, r0, #2
	str r1, [r4, r0]
_022277E4:
	adds r0, r4, #0
	bl ov39_02227A5C
	ldr r1, _022278CC @ =0x0000040C
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _02227836
	subs r1, #0xc
	adds r0, r4, #0
	adds r1, r4, r1
	blx r2
	cmp r0, #1
	bne _02227836
	ldr r0, _022278CC @ =0x0000040C
	movs r1, #0
	str r1, [r4, r0]
	subs r0, #0xc
	ldr r2, [r4, r0]
	cmp r2, #0
	beq _02227820
	movs r1, #0x15
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, #0x2c
	adds r1, r4, r1
	blx r2
	movs r0, #1
	movs r1, #0
	lsls r0, r0, #0xa
	str r1, [r4, r0]
_02227820:
	movs r0, #1
	lsls r0, r0, #0xa
	adds r0, r4, r0
	movs r1, #0
	movs r2, #0x10
	blx FUN_020D4994
	movs r0, #0xfb
	ldr r1, _022278C8 @ =0x000059DC
	lsls r0, r0, #2
	str r1, [r4, r0]
_02227836:
	movs r3, #0xef
	lsls r3, r3, #2
	ldr r0, [r4, r3]
	lsls r1, r0, #2
	ldr r0, _022278D0 @ =0x0222A8B4
	ldr r2, [r0, r1]
	cmp r2, #0
	beq _022278C2
	adds r1, r3, #0
	adds r3, r3, #4
	ldr r3, [r4, r3]
	adds r1, #0x10
	lsls r3, r3, #2
	ldr r2, [r2, r3]
	adds r0, r4, #0
	adds r1, r4, r1
	blx r2
	cmp r0, #0
	beq _022278C2
	cmp r0, #1
	beq _02227866
	cmp r0, #2
	beq _022278AC
	b _022278C2
_02227866:
	movs r0, #0xf3
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	movs r2, #0xc
	adds r1, r1, #1
	str r1, [r4, r0]
	adds r0, #0xc
	adds r0, r4, r0
	movs r1, #0
	blx FUN_020D4994
	movs r1, #0xef
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	lsls r2, r0, #2
	ldr r0, _022278D0 @ =0x0222A8B4
	ldr r2, [r0, r2]
	adds r0, r1, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	cmp r0, #0
	bne _022278C2
	movs r2, #0
	adds r0, r1, #4
	str r2, [r4, r0]
	str r2, [r4, r1]
	b _022278C2
_022278AC:
	movs r0, #0xf3
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	movs r0, #0xf
	movs r1, #0
	lsls r0, r0, #6
	str r1, [r4, r0]
_022278C2:
	movs r0, #1
	pop {r4, pc}
	nop
_022278C8: .4byte 0x000059DC
_022278CC: .4byte 0x0000040C
_022278D0: .4byte 0x0222A8B4
	thumb_func_end ov39_02227778

	thumb_func_start ov39_022278D4
ov39_022278D4: @ 0x022278D4
	push {r3, r4, r5, lr}
	movs r3, #0xfa
	adds r5, r0, #0
	lsls r3, r3, #2
	ldr r1, [r5, r3]
	ldr r2, _02227A4C @ =0x000055F0
	movs r4, #0
	cmp r1, r2
	bgt _0222790C
	bge _02227986
	ldr r0, _02227A50 @ =0x00005208
	cmp r1, r0
	bgt _02227904
	bge _0222795C
	ldr r2, _02227A54 @ =0x00004E21
	cmp r1, r2
	bgt _02227902
	subs r0, r2, #1
	cmp r1, r0
	blt _02227902
	beq _02227938
	cmp r1, r2
	beq _0222794A
_02227902:
	b _02227A34
_02227904:
	adds r0, r0, #1
	cmp r1, r0
	beq _02227974
	b _02227A34
_0222790C:
	ldr r0, _02227A58 @ =0x000059D8
	cmp r1, r0
	bgt _0222791C
	bge _022279A4
	adds r0, r2, #1
	cmp r1, r0
	beq _02227992
	b _02227A34
_0222791C:
	adds r2, r0, #3
	cmp r1, r2
	bgt _02227936
	adds r2, r0, #1
	cmp r1, r2
	blt _02227936
	beq _022279B6
	adds r2, r0, #2
	cmp r1, r2
	beq _02227A00
	adds r0, r0, #3
	cmp r1, r0
	beq _02227A1C
_02227936:
	b _02227A34
_02227938:
	movs r0, #0x19
	subs r3, #0x34
	lsls r0, r0, #4
	ldr r1, [r5, r3]
	adds r0, r5, r0
	blx ov39_0222A164
	adds r4, r0, #0
	b _02227A38
_0222794A:
	adds r0, r3, #0
	subs r0, #0x3c
	subs r3, #0x34
	ldrh r0, [r5, r0]
	ldr r1, [r5, r3]
	blx ov39_0222A1C0
	adds r4, r0, #0
	b _02227A38
_0222795C:
	adds r0, r3, #0
	subs r0, #0x3c
	movs r1, #0x19
	subs r3, #0x34
	lsls r1, r1, #4
	ldrb r0, [r5, r0]
	ldr r2, [r5, r3]
	adds r1, r5, r1
	blx ov39_0222A200
	adds r4, r0, #0
	b _02227A38
_02227974:
	adds r0, r3, #0
	subs r0, #0x3c
	subs r3, #0x34
	ldrb r0, [r5, r0]
	ldr r1, [r5, r3]
	blx ov39_0222A268
	adds r4, r0, #0
	b _02227A38
_02227986:
	subs r3, #0x34
	ldr r0, [r5, r3]
	blx ov39_0222A2CC
	adds r4, r0, #0
	b _02227A38
_02227992:
	movs r0, #0x19
	subs r3, #0x34
	lsls r0, r0, #4
	ldr r1, [r5, r3]
	adds r0, r5, r0
	blx ov39_0222A2EC
	adds r4, r0, #0
	b _02227A38
_022279A4:
	movs r0, #0x19
	lsls r0, r0, #4
	subs r3, #0x34
	ldr r0, [r5, r0]
	ldr r1, [r5, r3]
	blx ov39_0222A33C
	adds r4, r0, #0
	b _02227A38
_022279B6:
	adds r0, r3, #0
	adds r0, #8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _022279CA
	cmp r0, #1
	beq _022279DC
	cmp r0, #2
	beq _022279EE
	b _02227A38
_022279CA:
	movs r0, #0x19
	subs r3, #0x34
	lsls r0, r0, #4
	ldr r1, [r5, r3]
	adds r0, r5, r0
	blx ov39_0222A394
	adds r4, r0, #0
	b _02227A38
_022279DC:
	movs r0, #0x19
	subs r3, #0x34
	lsls r0, r0, #4
	ldr r1, [r5, r3]
	adds r0, r5, r0
	blx ov39_0222A3DC
	adds r4, r0, #0
	b _02227A38
_022279EE:
	movs r0, #0x19
	subs r3, #0x34
	lsls r0, r0, #4
	ldr r1, [r5, r3]
	adds r0, r5, r0
	blx ov39_0222A434
	adds r4, r0, #0
	b _02227A38
_02227A00:
	adds r0, r3, #0
	adds r1, r3, #0
	subs r0, #0x3c
	subs r1, #0x38
	subs r3, #0x34
	movs r2, #5
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r3, [r5, r3]
	lsls r2, r2, #6
	blx ov39_0222A48C
	adds r4, r0, #0
	b _02227A38
_02227A1C:
	adds r0, r3, #0
	adds r1, r3, #0
	subs r0, #0x3c
	subs r1, #0x38
	subs r3, #0x34
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r5, r3]
	blx ov39_0222A4C0
	adds r4, r0, #0
	b _02227A38
_02227A34:
	bl GF_AssertFail
_02227A38:
	cmp r4, #1
	bne _02227A46
	movs r0, #0xfa
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	adds r0, r0, #4
	str r1, [r5, r0]
_02227A46:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02227A4C: .4byte 0x000055F0
_02227A50: .4byte 0x00005208
_02227A54: .4byte 0x00004E21
_02227A58: .4byte 0x000059D8
	thumb_func_end ov39_022278D4

	thumb_func_start ov39_02227A5C
ov39_02227A5C: @ 0x02227A5C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xfb
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	ldr r0, _02227B0C @ =0x000059DC
	cmp r1, r0
	bne _02227A70
	movs r0, #1
	pop {r4, pc}
_02227A70:
	blx ov39_0222A13C
	movs r1, #0x52
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #4
	ldr r2, [r4, r1]
	ldr r0, [r4, r0]
	cmp r2, r0
	beq _02227B06
	cmp r2, #9
	bhi _02227AFC
	adds r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02227A94: @ jump table
	.2byte _02227AFC - _02227A94 - 2 @ case 0
	.2byte _02227AFC - _02227A94 - 2 @ case 1
	.2byte _02227AFC - _02227A94 - 2 @ case 2
	.2byte _02227AFC - _02227A94 - 2 @ case 3
	.2byte _02227AFC - _02227A94 - 2 @ case 4
	.2byte _02227AFC - _02227A94 - 2 @ case 5
	.2byte _02227AFC - _02227A94 - 2 @ case 6
	.2byte _02227AA8 - _02227A94 - 2 @ case 7
	.2byte _02227ACC - _02227A94 - 2 @ case 8
	.2byte _02227ADA - _02227A94 - 2 @ case 9
_02227AA8:
	adds r0, r1, #0
	movs r3, #1
	adds r0, #0x38
	str r3, [r4, r0]
	adds r0, r1, #0
	movs r2, #0
	adds r0, #0x3c
	str r2, [r4, r0]
	adds r0, r1, #0
	movs r2, #7
	adds r0, #0x40
	str r2, [r4, r0]
	adds r1, #0x34
	str r3, [r4, r1]
	ldr r1, _02227B10 @ =ov39_02227B58
	ldr r0, _02227B14 @ =0x0000040C
	str r1, [r4, r0]
	b _02227AFC
_02227ACC:
	ldr r1, _02227B18 @ =ov39_02227B1C
	ldr r0, _02227B14 @ =0x0000040C
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov39_02227B5C
	b _02227AFC
_02227ADA:
	adds r0, r1, #0
	movs r2, #0
	adds r0, #0x38
	str r2, [r4, r0]
	adds r1, #0x3c
	str r2, [r4, r1]
	blx ov39_0222A158
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #1
	subs r1, #0xc
	str r0, [r4, r1]
	ldr r1, _02227B10 @ =ov39_02227B58
	ldr r0, _02227B14 @ =0x0000040C
	str r1, [r4, r0]
_02227AFC:
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
_02227B06:
	movs r0, #1
	pop {r4, pc}
	nop
_02227B0C: .4byte 0x000059DC
_02227B10: .4byte ov39_02227B58
_02227B14: .4byte 0x0000040C
_02227B18: .4byte ov39_02227B1C
	thumb_func_end ov39_02227A5C

	thumb_func_start ov39_02227B1C
ov39_02227B1C: @ 0x02227B1C
	movs r0, #1
	bx lr
	thumb_func_end ov39_02227B1C

	thumb_func_start ov39_02227B20
ov39_02227B20: @ 0x02227B20
	movs r0, #1
	bx lr
	thumb_func_end ov39_02227B20

	thumb_func_start ov39_02227B24
ov39_02227B24: @ 0x02227B24
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	blx ov39_0222A2B4
	adds r2, r0, #0
	adds r0, r4, #6
	str r0, [sp]
	ldr r1, [r2, #4]
	ldr r0, [r5]
	ldr r2, [r2, #8]
	adds r3, r4, #4
	bl FUN_02244B70
	subs r0, r0, #2
	cmp r0, #1
	bhi _02227B4A
	movs r0, #1
	pop {r3, r4, r5, pc}
_02227B4A:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov39_02227B24

	thumb_func_start ov39_02227B50
ov39_02227B50: @ 0x02227B50
	movs r0, #1
	bx lr
	thumb_func_end ov39_02227B50

	thumb_func_start ov39_02227B54
ov39_02227B54: @ 0x02227B54
	movs r0, #1
	bx lr
	thumb_func_end ov39_02227B54

	thumb_func_start ov39_02227B58
ov39_02227B58: @ 0x02227B58
	movs r0, #1
	bx lr
	thumb_func_end ov39_02227B58

	thumb_func_start ov39_02227B5C
ov39_02227B5C: @ 0x02227B5C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #1
	blx ov39_0222A2B4
	adds r4, r0, #0
	blx ov39_0222A2A8
	movs r0, #0xfb
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	ldrh r0, [r4]
	cmp r1, r0
	beq _02227B7C
	bl GF_AssertFail
_02227B7C:
	movs r0, #1
	movs r1, #0
	lsls r0, r0, #0xa
	str r1, [r5, r0]
	ldrh r1, [r4]
	ldr r0, _02227D14 @ =0x00005209
	cmp r1, r0
	bgt _02227BAE
	bge _02227C34
	ldr r2, _02227D18 @ =0x00004E21
	cmp r1, r2
	bgt _02227BA6
	subs r0, r2, #1
	cmp r1, r0
	blt _02227BA2
	beq _02227BE4
	cmp r1, r2
	beq _02227C00
	b _02227CE6
_02227BA2:
	cmp r1, #0
	b _02227CE6
_02227BA6:
	subs r0, r0, #1
	cmp r1, r0
	beq _02227C18
	b _02227CE6
_02227BAE:
	ldr r0, _02227D1C @ =0x000055F1
	cmp r1, r0
	bgt _02227BBE
	bge _02227C64
	subs r0, r0, #1
	cmp r1, r0
	beq _02227C4C
	b _02227CE6
_02227BBE:
	ldr r0, _02227D20 @ =0x000059D8
	cmp r1, r0
	bgt _02227BC8
	beq _02227C7C
	b _02227CE6
_02227BC8:
	adds r2, r0, #3
	cmp r1, r2
	bgt _02227BE2
	adds r2, r0, #1
	cmp r1, r2
	blt _02227BE2
	beq _02227CA0
	adds r2, r0, #2
	cmp r1, r2
	beq _02227CB8
	adds r0, r0, #3
	cmp r1, r0
	beq _02227CD0
_02227BE2:
	b _02227CE6
_02227BE4:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov39_02227E48
	adds r6, r0, #0
	ldr r0, _02227D24 @ =0x00000154
	ldr r1, [r5, r0]
	ldr r0, _02227D28 @ =0x00000400
	str r1, [r5, r0]
	bne _02227CE6
	ldr r1, _02227D2C @ =ov39_02227B50
	adds r0, #0xc
	str r1, [r5, r0]
	b _02227CE6
_02227C00:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov39_02227E6C
	adds r6, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	movs r0, #1
	lsls r0, r0, #0xa
	str r1, [r5, r0]
	b _02227CE6
_02227C18:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov39_02227ECC
	adds r6, r0, #0
	ldr r0, _02227D30 @ =0x0000015C
	ldr r1, [r5, r0]
	ldr r0, _02227D28 @ =0x00000400
	str r1, [r5, r0]
	bne _02227CE6
	ldr r1, _02227D34 @ =ov39_02227B54
	adds r0, #0xc
	str r1, [r5, r0]
	b _02227CE6
_02227C34:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov39_02227EF4
	adds r6, r0, #0
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	movs r0, #1
	lsls r0, r0, #0xa
	str r1, [r5, r0]
	b _02227CE6
_02227C4C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov39_02227F60
	adds r6, r0, #0
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	movs r0, #1
	lsls r0, r0, #0xa
	str r1, [r5, r0]
	b _02227CE6
_02227C64:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov39_02227F84
	adds r6, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	movs r0, #1
	lsls r0, r0, #0xa
	str r1, [r5, r0]
	b _02227CE6
_02227C7C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov39_02227FC4
	adds r6, r0, #0
	ldr r0, _02227D38 @ =0x0000016C
	ldr r1, [r5, r0]
	ldr r0, _02227D28 @ =0x00000400
	str r1, [r5, r0]
	bne _02227C98
	ldr r1, _02227D3C @ =ov39_02227B20
	adds r0, #0xc
	str r1, [r5, r0]
	b _02227CE6
_02227C98:
	ldr r1, _02227D40 @ =ov39_02227B24
	adds r0, #0xc
	str r1, [r5, r0]
	b _02227CE6
_02227CA0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov39_02227FFC
	adds r6, r0, #0
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	movs r0, #1
	lsls r0, r0, #0xa
	str r1, [r5, r0]
	b _02227CE6
_02227CB8:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov39_022280B4
	adds r6, r0, #0
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	movs r0, #1
	lsls r0, r0, #0xa
	str r1, [r5, r0]
	b _02227CE6
_02227CD0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov39_02228120
	adds r6, r0, #0
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	movs r0, #1
	lsls r0, r0, #0xa
	str r1, [r5, r0]
_02227CE6:
	cmp r6, #0
	bne _02227D06
	movs r0, #6
	movs r1, #2
	lsls r0, r0, #6
	str r1, [r5, r0]
	ldrh r2, [r4]
	adds r1, r0, #4
	str r2, [r5, r1]
	adds r1, r0, #0
	ldrh r2, [r4, #2]
	adds r1, #8
	subs r0, r0, #4
	str r2, [r5, r1]
	movs r1, #1
	b _02227D0C
_02227D06:
	movs r0, #0x5f
	movs r1, #0
	lsls r0, r0, #2
_02227D0C:
	str r1, [r5, r0]
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_02227D14: .4byte 0x00005209
_02227D18: .4byte 0x00004E21
_02227D1C: .4byte 0x000055F1
_02227D20: .4byte 0x000059D8
_02227D24: .4byte 0x00000154
_02227D28: .4byte 0x00000400
_02227D2C: .4byte ov39_02227B50
_02227D30: .4byte 0x0000015C
_02227D34: .4byte ov39_02227B54
_02227D38: .4byte 0x0000016C
_02227D3C: .4byte ov39_02227B20
_02227D40: .4byte ov39_02227B24
	thumb_func_end ov39_02227B5C

	thumb_func_start ov39_02227D44
ov39_02227D44: @ 0x02227D44
	movs r2, #0x5f
	lsls r2, r2, #2
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, [r0]
	bx lr
	thumb_func_end ov39_02227D44

	thumb_func_start ov39_02227D50
ov39_02227D50: @ 0x02227D50
	push {r3, lr}
	adds r2, r0, #0
	ldr r0, [r2, #8]
	ldr r2, [r2, #4]
	blx r2
	pop {r3, pc}
	thumb_func_end ov39_02227D50

	thumb_func_start ov39_02227D5C
ov39_02227D5C: @ 0x02227D5C
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0
	adds r5, r1, #0
	mvns r0, r0
	cmp r5, r0
	bne _02227D6E
	movs r5, #0xb
_02227D6E:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xfe
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	movs r3, #5
	bl FUN_0200BFCC
	movs r0, #0xfd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	bl FUN_0200BBA0
	movs r1, #0xfe
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	movs r1, #0xff
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov39_02227D50
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov39_02227D5C

	thumb_func_start ov39_02227DB8
ov39_02227DB8: @ 0x02227DB8
	push {r4, lr}
	adds r4, r0, #0
	bl ov39_02227DE4
	cmp r0, #0
	bne _02227DDC
	movs r0, #0xfa
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	ldr r1, _02227DE0 @ =0x000059DC
	cmp r2, r1
	bne _02227DDC
	adds r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, r1
	bne _02227DDC
	movs r0, #1
	pop {r4, pc}
_02227DDC:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_02227DE0: .4byte 0x000059DC
	thumb_func_end ov39_02227DB8

	thumb_func_start ov39_02227DE4
ov39_02227DE4: @ 0x02227DE4
	movs r1, #0xef
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov39_02227DE4

	thumb_func_start ov39_02227DEC
ov39_02227DEC: @ 0x02227DEC
	push {r4, r5, r6, lr}
	movs r1, #2
	lsls r1, r1, #0xc
	bl FUN_0201AA8C
	adds r5, r0, #0
	movs r6, #2
	lsls r6, r6, #0xc
	movs r0, #0
	adds r1, r5, #0
	adds r2, r5, r6
	movs r3, #1
	blx FUN_020D2FF4
	adds r4, r0, #0
	movs r0, #0
	adds r1, r4, #0
	blx FUN_020D2C8C
	adds r2, r5, r6
	adds r4, #0x1f
	movs r0, #0x1f
	bics r4, r0
	adds r2, #0x1f
	bics r2, r0
	movs r0, #0
	adds r1, r4, #0
	blx FUN_020D30B0
	adds r1, r0, #0
	ldr r0, _02227E38 @ =0x0222AB80
	str r1, [r0]
	movs r0, #0
	blx FUN_020D2FC4
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	nop
_02227E38: .4byte 0x0222AB80
	thumb_func_end ov39_02227DEC

	thumb_func_start ov39_02227E3C
ov39_02227E3C: @ 0x02227E3C
	ldr r3, _02227E44 @ =FUN_020D309C
	movs r0, #0
	bx r3
	nop
_02227E44: .4byte FUN_020D309C
	thumb_func_end ov39_02227E3C

	thumb_func_start ov39_02227E48
ov39_02227E48: @ 0x02227E48
	ldrh r1, [r1, #2]
	movs r0, #0
	cmp r1, #5
	bhi _02227E6A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02227E5C: @ jump table
	.2byte _02227E68 - _02227E5C - 2 @ case 0
	.2byte _02227E6A - _02227E5C - 2 @ case 1
	.2byte _02227E6A - _02227E5C - 2 @ case 2
	.2byte _02227E6A - _02227E5C - 2 @ case 3
	.2byte _02227E6A - _02227E5C - 2 @ case 4
	.2byte _02227E6A - _02227E5C - 2 @ case 5
_02227E68:
	movs r0, #1
_02227E6A:
	bx lr
	thumb_func_end ov39_02227E48

	thumb_func_start ov39_02227E6C
ov39_02227E6C: @ 0x02227E6C
	ldrh r1, [r1, #2]
	movs r0, #0
	cmp r1, #3
	bhi _02227E8A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02227E80: @ jump table
	.2byte _02227E88 - _02227E80 - 2 @ case 0
	.2byte _02227E8A - _02227E80 - 2 @ case 1
	.2byte _02227E8A - _02227E80 - 2 @ case 2
	.2byte _02227E8A - _02227E80 - 2 @ case 3
_02227E88:
	movs r0, #1
_02227E8A:
	bx lr
	thumb_func_end ov39_02227E6C

	thumb_func_start ov39_02227E8C
ov39_02227E8C: @ 0x02227E8C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	blx ov39_0222A2B4
	adds r1, r0, #4
	ldr r0, [r0, #4]
	cmp r0, r4
	ble _02227EA0
	adds r0, r4, #0
_02227EA0:
	adds r3, r1, #4
	movs r2, #0
	cmp r0, #0
	ble _02227EB8
	adds r6, r5, #0
_02227EAA:
	adds r1, r3, #0
	adds r1, #0xc
	adds r2, r2, #1
	stm r6!, {r1}
	adds r3, #0xec
	cmp r2, r0
	blt _02227EAA
_02227EB8:
	cmp r2, r4
	bge _02227ECA
	lsls r1, r2, #2
	adds r3, r5, r1
	movs r1, #0
_02227EC2:
	adds r2, r2, #1
	stm r3!, {r1}
	cmp r2, r4
	blt _02227EC2
_02227ECA:
	pop {r4, r5, r6, pc}
	thumb_func_end ov39_02227E8C

	thumb_func_start ov39_02227ECC
ov39_02227ECC: @ 0x02227ECC
	ldrh r1, [r1, #2]
	movs r0, #0
	cmp r1, #6
	bhi _02227EF0
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02227EE0: @ jump table
	.2byte _02227EEE - _02227EE0 - 2 @ case 0
	.2byte _02227EF0 - _02227EE0 - 2 @ case 1
	.2byte _02227EF0 - _02227EE0 - 2 @ case 2
	.2byte _02227EF0 - _02227EE0 - 2 @ case 3
	.2byte _02227EF0 - _02227EE0 - 2 @ case 4
	.2byte _02227EF0 - _02227EE0 - 2 @ case 5
	.2byte _02227EF0 - _02227EE0 - 2 @ case 6
_02227EEE:
	movs r0, #1
_02227EF0:
	bx lr
	.align 2, 0
	thumb_func_end ov39_02227ECC

	thumb_func_start ov39_02227EF4
ov39_02227EF4: @ 0x02227EF4
	ldrh r1, [r1, #2]
	movs r0, #0
	cmp r1, #3
	bhi _02227F12
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02227F08: @ jump table
	.2byte _02227F10 - _02227F08 - 2 @ case 0
	.2byte _02227F12 - _02227F08 - 2 @ case 1
	.2byte _02227F12 - _02227F08 - 2 @ case 2
	.2byte _02227F12 - _02227F08 - 2 @ case 3
_02227F10:
	movs r0, #1
_02227F12:
	bx lr
	thumb_func_end ov39_02227EF4

	thumb_func_start ov39_02227F14
ov39_02227F14: @ 0x02227F14
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r5, r2, #0
	blx ov39_0222A2B4
	ldr r4, [r0, #4]
	adds r7, r0, #4
	cmp r4, r5
	ble _02227F2C
	adds r4, r5, #0
	bl GF_AssertFail
_02227F2C:
	adds r3, r7, #4
	movs r2, #0
	cmp r4, #0
	ble _02227F48
	movs r0, #0x8b
	adds r7, r6, #0
	lsls r0, r0, #2
_02227F3A:
	adds r1, r3, #0
	adds r1, #0x10
	adds r2, r2, #1
	stm r7!, {r1}
	adds r3, r3, r0
	cmp r2, r4
	blt _02227F3A
_02227F48:
	cmp r2, r5
	bge _02227F5A
	lsls r0, r2, #2
	adds r1, r6, r0
	movs r0, #0
_02227F52:
	adds r2, r2, #1
	stm r1!, {r0}
	cmp r2, r5
	blt _02227F52
_02227F5A:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov39_02227F14

	thumb_func_start ov39_02227F60
ov39_02227F60: @ 0x02227F60
	ldrh r1, [r1, #2]
	movs r0, #0
	cmp r1, #0
	beq _02227F70
	cmp r1, #1
	beq _02227F72
	cmp r1, #2
	bx lr
_02227F70:
	movs r0, #1
_02227F72:
	bx lr
	thumb_func_end ov39_02227F60

	thumb_func_start ov39_02227F74
ov39_02227F74: @ 0x02227F74
	push {r4, lr}
	adds r4, r1, #0
	blx ov39_0222A2B4
	adds r0, r0, #4
	str r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov39_02227F74

	thumb_func_start ov39_02227F84
ov39_02227F84: @ 0x02227F84
	ldrh r1, [r1, #2]
	movs r0, #0
	cmp r1, #5
	bhi _02227FA6
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02227F98: @ jump table
	.2byte _02227FA4 - _02227F98 - 2 @ case 0
	.2byte _02227FA6 - _02227F98 - 2 @ case 1
	.2byte _02227FA6 - _02227F98 - 2 @ case 2
	.2byte _02227FA6 - _02227F98 - 2 @ case 3
	.2byte _02227FA6 - _02227F98 - 2 @ case 4
	.2byte _02227FA6 - _02227F98 - 2 @ case 5
_02227FA4:
	movs r0, #1
_02227FA6:
	bx lr
	thumb_func_end ov39_02227F84

	thumb_func_start ov39_02227FA8
ov39_02227FA8: @ 0x02227FA8
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	blx ov39_0222A2B4
	adds r1, r0, #4
	ldr r0, _02227FC0 @ =0x00000558
	str r1, [r5]
	adds r0, r1, r0
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_02227FC0: .4byte 0x00000558
	thumb_func_end ov39_02227FA8

	thumb_func_start ov39_02227FC4
ov39_02227FC4: @ 0x02227FC4
	ldrh r1, [r1, #2]
	movs r0, #0
	cmp r1, #7
	bhi _02227FEA
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02227FD8: @ jump table
	.2byte _02227FE8 - _02227FD8 - 2 @ case 0
	.2byte _02227FEA - _02227FD8 - 2 @ case 1
	.2byte _02227FEA - _02227FD8 - 2 @ case 2
	.2byte _02227FEA - _02227FD8 - 2 @ case 3
	.2byte _02227FEA - _02227FD8 - 2 @ case 4
	.2byte _02227FEA - _02227FD8 - 2 @ case 5
	.2byte _02227FEA - _02227FD8 - 2 @ case 6
	.2byte _02227FEA - _02227FD8 - 2 @ case 7
_02227FE8:
	movs r0, #1
_02227FEA:
	bx lr
	thumb_func_end ov39_02227FC4

	thumb_func_start ov39_02227FEC
ov39_02227FEC: @ 0x02227FEC
	push {r3, lr}
	blx ov39_0222A2B4
	ldr r2, [r0, #4]
	ldr r1, [r0, #8]
	adds r0, r2, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov39_02227FEC

	thumb_func_start ov39_02227FFC
ov39_02227FFC: @ 0x02227FFC
	ldrh r1, [r1, #2]
	movs r0, #0
	cmp r1, #3
	bhi _0222801A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02228010: @ jump table
	.2byte _02228018 - _02228010 - 2 @ case 0
	.2byte _0222801A - _02228010 - 2 @ case 1
	.2byte _0222801A - _02228010 - 2 @ case 2
	.2byte _0222801A - _02228010 - 2 @ case 3
_02228018:
	movs r0, #1
_0222801A:
	bx lr
	thumb_func_end ov39_02227FFC

	thumb_func_start ov39_0222801C
ov39_0222801C: @ 0x0222801C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r2, [sp, #8]
	str r0, [sp]
	str r1, [sp, #4]
	blx ov39_0222A2B4
	ldr r1, [r0, #4]
	adds r4, r0, #4
	ldr r0, [sp, #8]
	str r1, [sp, #0xc]
	cmp r1, r0
	ble _0222803C
	str r0, [sp, #0xc]
	bl GF_AssertFail
_0222803C:
	ldr r0, [sp, #0xc]
	adds r5, r4, #4
	movs r6, #0
	cmp r0, #0
	ble _02228096
	ldr r4, [sp, #4]
_02228048:
	adds r2, r5, #0
	adds r2, #0xc
	adds r3, r2, #0
	str r2, [r4]
	adds r3, #0xd8
	ldr r3, [r3]
	ldr r0, [r5, #8]
	mov ip, r3
	adds r3, r2, #0
	adds r3, #0xdc
	ldr r3, [r3]
	adds r7, r0, #0
	eors r7, r3
	ldr r1, [r5, #4]
	mov r3, ip
	eors r3, r1
	orrs r3, r7
	beq _0222808A
	adds r3, r2, #0
	adds r3, #0xd8
	str r1, [r3]
	adds r2, #0xdc
	str r0, [r2]
	ldr r0, [sp]
	ldr r1, [r4]
	ldr r0, [r0]
	adds r1, #0x80
	movs r2, #0x58
	bl FUN_020275C4
	ldr r1, [r4]
	adds r1, #0xe0
	strh r0, [r1]
_0222808A:
	ldr r0, [sp, #0xc]
	adds r6, r6, #1
	adds r5, #0xf0
	adds r4, r4, #4
	cmp r6, r0
	blt _02228048
_02228096:
	ldr r0, [sp, #8]
	cmp r6, r0
	bge _022280AE
	ldr r0, [sp, #4]
	lsls r1, r6, #2
	adds r2, r0, r1
	movs r1, #0
_022280A4:
	ldr r0, [sp, #8]
	adds r6, r6, #1
	stm r2!, {r1}
	cmp r6, r0
	blt _022280A4
_022280AE:
	ldr r0, [sp, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov39_0222801C

	thumb_func_start ov39_022280B4
ov39_022280B4: @ 0x022280B4
	ldrh r1, [r1, #2]
	movs r0, #0
	cmp r1, #3
	bhi _022280D2
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022280C8: @ jump table
	.2byte _022280D0 - _022280C8 - 2 @ case 0
	.2byte _022280D2 - _022280C8 - 2 @ case 1
	.2byte _022280D2 - _022280C8 - 2 @ case 2
	.2byte _022280D2 - _022280C8 - 2 @ case 3
_022280D0:
	movs r0, #1
_022280D2:
	bx lr
	thumb_func_end ov39_022280B4

	thumb_func_start ov39_022280D4
ov39_022280D4: @ 0x022280D4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	blx ov39_0222A2B4
	adds r4, r0, #0
	adds r0, r4, #4
	adds r0, #0xc
	str r0, [r5]
	adds r0, r4, #4
	adds r0, #0xe4
	ldr r1, [r0]
	adds r0, r4, #4
	adds r0, #0xe8
	ldr r3, [r4, #8]
	ldr r2, [r4, #0xc]
	ldr r0, [r0]
	eors r1, r3
	eors r0, r2
	orrs r0, r1
	beq _0222811C
	adds r0, r4, #4
	adds r0, #0xe4
	str r3, [r0]
	adds r0, r4, #4
	adds r0, #0xe8
	str r2, [r0]
	ldr r1, [r5]
	ldr r0, [r6]
	adds r1, #0x80
	movs r2, #0x58
	bl FUN_020275C4
	ldr r1, [r5]
	adds r1, #0xe0
	strh r0, [r1]
_0222811C:
	ldr r0, [r4, #8]
	pop {r4, r5, r6, pc}
	thumb_func_end ov39_022280D4

	thumb_func_start ov39_02228120
ov39_02228120: @ 0x02228120
	ldrh r1, [r1, #2]
	movs r0, #0
	cmp r1, #3
	bhi _0222813E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02228134: @ jump table
	.2byte _0222813C - _02228134 - 2 @ case 0
	.2byte _0222813E - _02228134 - 2 @ case 1
	.2byte _0222813E - _02228134 - 2 @ case 2
	.2byte _0222813E - _02228134 - 2 @ case 3
_0222813C:
	movs r0, #1
_0222813E:
	bx lr
	thumb_func_end ov39_02228120

	thumb_func_start ov39_02228140
ov39_02228140: @ 0x02228140
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r1, #1
	lsls r1, r1, #0x1a
	ldr r0, [r1]
	ldr r2, _022282EC @ =0xFFFFE0FF
	ands r0, r2
	str r0, [r1]
	ldr r0, _022282F0 @ =0x04001000
	ldr r3, [r0]
	ands r2, r3
	str r2, [r0]
	ldr r3, [r1]
	ldr r2, _022282F4 @ =0xFFFF1FFF
	ands r3, r2
	str r3, [r1]
	ldr r3, [r0]
	adds r1, #0x50
	ands r2, r3
	str r2, [r0]
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x50
	strh r2, [r0]
	movs r2, #5
	movs r0, #3
	movs r1, #0x7c
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r1, #0xf6
	adds r0, r4, #0
	lsls r1, r1, #2
	movs r2, #0x7c
	bl FUN_02007280
	movs r2, #0xf6
	movs r1, #0
	lsls r2, r2, #2
	adds r5, r0, #0
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_020072A4
	str r0, [r5]
	movs r0, #0x7c
	bl FUN_0201AC88
	str r0, [r5, #4]
	movs r0, #0x40
	movs r1, #0x7c
	bl FUN_0202055C
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	ldr r0, [r5, #4]
	bl ov39_02228440
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	movs r0, #0xb
	movs r1, #0x40
	movs r2, #0x7c
	bl FUN_0200BD18
	str r0, [r5, #0x20]
	ldr r2, _022282F8 @ =0x00000307
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x7c
	bl FUN_0200BAF8
	str r0, [r5, #0x24]
	ldr r2, _022282FC @ =0x0000030A
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x7c
	bl FUN_0200BAF8
	movs r2, #0x32
	str r0, [r5, #0x28]
	movs r0, #0
	movs r1, #0x1b
	lsls r2, r2, #4
	movs r3, #0x7c
	bl FUN_0200BAF8
	str r0, [r5, #0x2c]
	movs r0, #0xb4
	movs r1, #0x7c
	bl FUN_02026354
	str r0, [r5, #0x34]
	movs r0, #1
	lsls r0, r0, #8
	movs r1, #0x7c
	bl FUN_02026354
	str r0, [r5, #0x3c]
	ldr r0, [r5, #0x24]
	movs r1, #0x1f
	bl FUN_0200BBA0
	str r0, [r5, #0x38]
	adds r0, r5, #0
	bl ov39_022285CC
	adds r0, r5, #0
	bl ov39_022288A0
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x7c
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, _02228300 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #1
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B50
	movs r0, #1
	bl FUN_02002B8C
	ldr r0, _02228304 @ =ov39_02228418
	adds r1, r5, #0
	bl FUN_0201A0FC
	ldr r1, [r5]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _022282B8
	bl FUN_0203A880
	adds r0, r5, #0
	movs r1, #0xd
	movs r2, #8
	bl ov39_02228B6C
	b _022282CA
_022282B8:
	ldr r0, [r1]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _022282C6
	movs r0, #1
	str r0, [r5, #8]
	b _022282CA
_022282C6:
	movs r0, #0
	str r0, [r5, #8]
_022282CA:
	ldr r0, [r5]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl FUN_02028EA8
	bl FUN_0202AD3C
	adds r1, r5, #0
	adds r1, #0x90
	str r0, [r1]
	ldr r0, [r5]
	movs r1, #0
	str r1, [r0, #0x7c]
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_022282EC: .4byte 0xFFFFE0FF
_022282F0: .4byte 0x04001000
_022282F4: .4byte 0xFFFF1FFF
_022282F8: .4byte 0x00000307
_022282FC: .4byte 0x0000030A
_02228300: .4byte 0x021D116C
_02228304: .4byte ov39_02228418
	thumb_func_end ov39_02228140

	thumb_func_start ov39_02228308
ov39_02228308: @ 0x02228308
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #0
	beq _02228322
	cmp r1, #1
	beq _02228330
	cmp r1, #2
	beq _0222835C
	b _02228368
_02228322:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _02228368
	movs r0, #1
	str r0, [r5]
	b _02228368
_02228330:
	ldr r6, [r4, #8]
	ldr r1, _0222836C @ =0x0222AA20
	lsls r2, r6, #2
	ldr r1, [r1, r2]
	blx r1
	ldr r1, [r4, #8]
	cmp r6, r1
	beq _02228352
	adds r1, r4, #0
	movs r2, #0
	adds r1, #0x94
	str r2, [r1]
	adds r1, r4, #0
	adds r1, #0x9c
	str r2, [r1]
	adds r4, #0x98
	str r2, [r4]
_02228352:
	cmp r0, #1
	bne _02228368
	movs r0, #2
	str r0, [r5]
	b _02228368
_0222835C:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _02228368
	movs r0, #1
	pop {r4, r5, r6, pc}
_02228368:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222836C: .4byte 0x0222AA20
	thumb_func_end ov39_02228308

	thumb_func_start ov39_02228370
ov39_02228370: @ 0x02228370
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	beq _02228394
	bl FUN_0200E390
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xa8
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xac
	str r1, [r0]
_02228394:
	ldr r0, [r4, #0x2c]
	bl FUN_0200BB44
	ldr r0, [r4, #0x28]
	bl FUN_0200BB44
	ldr r0, [r4, #0x24]
	bl FUN_0200BB44
	ldr r0, [r4, #0x20]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x38]
	bl FUN_02026380
	ldr r0, [r4, #0x3c]
	bl FUN_02026380
	ldr r0, [r4, #0x34]
	bl FUN_02026380
	adds r0, r4, #0
	bl ov39_02228948
	ldr r0, [r4, #4]
	bl FUN_0201AB0C
	ldr r0, [r4, #4]
	bl ov39_022285A8
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_020205AC
	bl FUN_02021238
	movs r0, #0
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B50
	movs r0, #0
	bl FUN_02002B8C
	bl FUN_0203A914
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x7c
	bl FUN_0201A9C4
	ldr r0, _02228414 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_02228414: .4byte 0x021D116C
	thumb_func_end ov39_02228370

	thumb_func_start ov39_02228418
ov39_02228418: @ 0x02228418
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0202061C
	bl FUN_0200B224
	ldr r0, [r4, #4]
	bl FUN_0201EEB4
	ldr r3, _02228438 @ =0x027E0000
	ldr r1, _0222843C @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_02228438: .4byte 0x027E0000
_0222843C: .4byte 0x00003FF8
	thumb_func_end ov39_02228418

	thumb_func_start ov39_02228440
ov39_02228440: @ 0x02228440
	push {r3, r4, r5, lr}
	sub sp, #0xa8
	adds r4, r0, #0
	bl FUN_02022C54
	bl FUN_02022CBC
	ldr r5, _02228598 @ =0x0222A8E4
	add r3, sp, #0x80
	movs r2, #5
_02228454:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02228454
	add r0, sp, #0x80
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
	ldr r5, _0222859C @ =0x0222A8D4
	add r3, sp, #0x70
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _022285A0 @ =0x0222A90C
	add r3, sp, #0x38
	movs r2, #7
_022284B4:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _022284B4
	movs r1, #0
	adds r0, r4, #0
	add r2, sp, #0x38
	adds r3, r1, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201BC8C
	movs r1, #0
	adds r0, r4, #0
	movs r2, #3
	adds r3, r1, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #1
	add r2, sp, #0x54
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r4, #0
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	ldr r5, _022285A4 @ =0x0222A944
	add r3, sp, #0
	movs r2, #7
_0222851A:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0222851A
	adds r0, r4, #0
	movs r1, #4
	add r2, sp, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r4, #0
	movs r1, #4
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #4
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #5
	add r2, sp, #0x1c
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r4, #0
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #5
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x7c
	bl FUN_0201C1C4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x7c
	bl FUN_0201C1C4
	add sp, #0xa8
	pop {r3, r4, r5, pc}
	nop
_02228598: .4byte 0x0222A8E4
_0222859C: .4byte 0x0222A8D4
_022285A0: .4byte 0x0222A90C
_022285A4: .4byte 0x0222A944
	thumb_func_end ov39_02228440

	thumb_func_start ov39_022285A8
ov39_022285A8: @ 0x022285A8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201BB4C
	pop {r4, pc}
	thumb_func_end ov39_022285A8

	thumb_func_start ov39_022285CC
ov39_022285CC: @ 0x022285CC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	ldr r4, [r0, #4]
	movs r0, #0x58
	movs r1, #0x7c
	bl FUN_02007688
	movs r2, #0
	str r2, [sp]
	movs r1, #0x7c
	str r1, [sp, #4]
	movs r1, #3
	adds r3, r2, #0
	str r0, [sp, #0x2c]
	bl FUN_02007B8C
	movs r3, #0
	str r3, [sp]
	movs r0, #0x7c
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	movs r1, #3
	movs r2, #4
	bl FUN_02007B8C
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x7c
	bl FUN_0200304C
	movs r1, #0x1a
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #0x7c
	bl FUN_0200304C
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl FUN_02028EA8
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x7c
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0xa
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	movs r0, #0x7c
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E3DC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7c
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	movs r1, #2
	adds r2, r4, #0
	movs r3, #1
	bl FUN_02007B44
	movs r1, #0
	movs r0, #6
	str r1, [sp]
	lsls r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x7c
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	movs r1, #6
	adds r2, r4, #0
	movs r3, #1
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7c
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	movs r1, #0xb
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007B44
	movs r1, #0
	movs r0, #6
	str r1, [sp]
	lsls r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x7c
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	movs r1, #0xc
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007B68
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201C2D8
	movs r0, #4
	movs r1, #0
	bl FUN_0201C2D8
	ldr r0, [sp, #0x10]
	movs r2, #0x33
	adds r0, #0xa8
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020D4994
	ldr r0, [sp, #0x2c]
	movs r1, #5
	add r2, sp, #0x38
	movs r3, #0x7c
	bl FUN_02007C48
	adds r4, r0, #0
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #0xc]
	adds r1, #0xb0
	movs r2, #0x80
	blx FUN_020D47B8
	ldr r0, [sp, #0x38]
	movs r2, #0x13
	ldr r1, [sp, #0x10]
	lsls r2, r2, #4
	adds r1, r1, r2
	ldr r0, [r0, #0xc]
	movs r2, #0x80
	blx FUN_020D47B8
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	movs r1, #0x13
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x10]
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x14]
	adds r0, #0xb0
	str r0, [sp, #0x14]
_02228722:
	movs r0, #0
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	adds r0, r0, #1
	lsls r1, r0, #5
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	str r0, [sp, #0x30]
_02228734:
	ldr r0, [sp, #0x24]
	cmp r0, #0x15
	blt _0222873E
	bl GF_AssertFail
_0222873E:
	ldr r0, [sp, #0x30]
	movs r7, #1
	adds r6, r0, #2
	ldr r0, [sp, #0x18]
	adds r4, r0, #2
	ldr r0, [sp, #0x14]
	adds r5, r0, #2
	ldr r0, [sp, #0x20]
	asrs r0, r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x34]
_02228756:
	adds r0, r6, #0
	adds r0, #0xb0
	ldrh r0, [r0]
	ldr r3, [sp, #0x34]
	adds r1, r4, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #1
	bl FUN_02003DE8
	adds r7, r7, #1
	adds r6, r6, #2
	adds r4, r4, #2
	adds r5, r5, #2
	cmp r7, #0x10
	blt _02228756
	ldr r0, [sp, #0x18]
	adds r0, #0x20
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	adds r0, r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	beq _022287A2
	movs r0, #3
	ldr r1, [sp, #0x20]
	lsls r0, r0, #8
	adds r1, r1, r0
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [sp, #0x20]
	cmp r1, r0
	blt _02228734
	str r0, [sp, #0x20]
	movs r0, #1
	str r0, [sp, #0x1c]
	b _02228734
_022287A2:
	ldr r0, [sp, #0x14]
	adds r0, #0x20
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	adds r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _02228722
	movs r1, #0x13
	ldr r0, [sp, #0x10]
	lsls r1, r1, #4
	adds r0, r0, r1
	movs r1, #0x2a
	lsls r1, r1, #4
	blx DC_FlushRange
	ldr r0, [sp, #0x10]
	movs r1, #1
	adds r0, #0xac
	str r1, [r0]
	movs r1, #0xf5
	ldr r0, [sp, #0x10]
	movs r2, #0
	lsls r1, r1, #2
	str r2, [r0, r1]
	ldr r1, [sp, #0x10]
	ldr r0, _022287F4 @ =ov39_022287F8
	adds r1, #0xa8
	movs r2, #0x14
	bl FUN_0200E33C
	ldr r1, [sp, #0x10]
	adds r1, #0xa8
	str r0, [r1]
	ldr r0, [sp, #0x2c]
	str r1, [sp, #0x10]
	bl FUN_0200770C
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_022287F4: .4byte ov39_022287F8
	thumb_func_end ov39_022285CC

	thumb_func_start ov39_022287F8
ov39_022287F8: @ 0x022287F8
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02228896
	ldr r1, _02228898 @ =0x0000032B
	movs r0, #1
	ldrb r2, [r4, r1]
	eors r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	tst r0, r2
	bne _02228896
	adds r0, r1, #1
	ldr r0, [r4, r0]
	cmp r0, #1
	bhi _0222882E
	subs r0, r1, #3
	ldrsh r0, [r4, r0]
	adds r2, r4, #0
	adds r2, #0x88
	lsls r0, r0, #5
	adds r0, r2, r0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020CFC6C
_0222882E:
	movs r0, #0xcb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222883C
	cmp r0, #2
	bne _02228852
_0222883C:
	movs r0, #0xca
	lsls r0, r0, #2
	ldrsh r0, [r4, r0]
	adds r1, r4, #0
	adds r1, #0x88
	lsls r0, r0, #5
	adds r0, r1, r0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020CFCC0
_02228852:
	ldr r0, _0222889C @ =0x0000032A
	ldrsb r1, [r4, r0]
	cmp r1, #0
	bne _0222887A
	subs r1, r0, #2
	ldrsh r1, [r4, r1]
	adds r2, r1, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0x15
	blt _02228896
	movs r2, #0x13
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r2, [r4, r0]
	movs r1, #1
	eors r1, r2
	strb r1, [r4, r0]
	pop {r4, pc}
_0222887A:
	subs r1, r0, #2
	ldrsh r1, [r4, r1]
	subs r2, r1, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bge _02228896
	movs r2, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r1, [r4, r0]
	eors r1, r2
	strb r1, [r4, r0]
_02228896:
	pop {r4, pc}
	.align 2, 0
_02228898: .4byte 0x0000032B
_0222889C: .4byte 0x0000032A
	thumb_func_end ov39_022287F8

	thumb_func_start ov39_022288A0
ov39_022288A0: @ 0x022288A0
	push {r3, r4, lr}
	sub sp, #0x14
	movs r3, #4
	adds r4, r0, #0
	str r3, [sp]
	movs r0, #0x17
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x94
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x64
	movs r2, #0
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	bl FUN_0201D978
	movs r0, #1
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x81
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x54
	movs r2, #0
	movs r3, #4
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0x54
	movs r1, #0
	bl FUN_0201D978
	movs r3, #1
	ldr r0, _02228944 @ =0x000F0E00
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	ldr r1, [r4, #0x38]
	adds r0, #0x54
	movs r2, #0
	bl ov39_0222899C
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x44
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	adds r4, #0x44
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_02228944: .4byte 0x000F0E00
	thumb_func_end ov39_022288A0

	thumb_func_start ov39_02228948
ov39_02228948: @ 0x02228948
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x44
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x54
	bl FUN_0201D520
	adds r4, #0x64
	adds r0, r4, #0
	bl FUN_0201D520
	pop {r4, pc}
	thumb_func_end ov39_02228948

	thumb_func_start ov39_02228964
ov39_02228964: @ 0x02228964
	push {r4, lr}
	adds r4, r0, #0
	cmp r3, #1
	beq _02228972
	cmp r3, #2
	beq _02228988
	b _02228996
_02228972:
	ldr r0, [sp, #0xc]
	movs r2, #0
	bl FUN_02002F30
	ldrb r1, [r4, #7]
	lsls r1, r1, #3
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r2, r0, #1
	b _02228996
_02228988:
	ldr r0, [sp, #0xc]
	movs r2, #0
	bl FUN_02002F30
	ldrb r1, [r4, #7]
	lsls r1, r1, #3
	subs r2, r1, r0
_02228996:
	adds r0, r2, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov39_02228964

	thumb_func_start ov39_0222899C
ov39_0222899C: @ 0x0222899C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r3, #0
	ldr r3, [sp, #0x24]
	adds r5, r0, #0
	str r3, [sp]
	movs r3, #1
	str r3, [sp, #4]
	ldr r3, [sp, #0x20]
	adds r6, r1, #0
	bl ov39_02228964
	adds r3, r0, #0
	str r4, [sp]
	movs r1, #0
	ldr r0, [sp, #0x24]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov39_0222899C

	thumb_func_start ov39_022289D0
ov39_022289D0: @ 0x022289D0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #1
	adds r6, r1, #0
	lsls r0, r0, #8
	movs r1, #0x7c
	bl FUN_02026354
	adds r4, r0, #0
	ldr r0, [r5, #0x2c]
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x20]
	ldr r1, [r5, #0x3c]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #1
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E580
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	adds r0, r5, #0
	ldr r2, [r5, #0x3c]
	adds r0, #0x64
	movs r1, #1
	bl FUN_020200A8
	movs r0, #0xff
	str r0, [r5, #0x40]
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov39_022289D0

	thumb_func_start ov39_02228A34
ov39_02228A34: @ 0x02228A34
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	adds r4, r1, #0
	mvns r0, r0
	cmp r4, r0
	bne _02228A46
	movs r4, #0xb
_02228A46:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x20]
	movs r1, #0
	movs r3, #5
	bl FUN_0200BFCC
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov39_022289D0
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov39_02228A34

	thumb_func_start ov39_02228A70
ov39_02228A70: @ 0x02228A70
	push {r3, lr}
	cmp r0, #0xff
	beq _02228A82
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02228A86
_02228A82:
	movs r0, #0
	pop {r3, pc}
_02228A86:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov39_02228A70

	thumb_func_start ov39_02228A8C
ov39_02228A8C: @ 0x02228A8C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x88
	ldr r0, [r0]
	cmp r0, #0
	bne _02228AA6
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #1
	bl FUN_0200F0AC
	adds r4, #0x88
	str r0, [r4]
_02228AA6:
	pop {r4, pc}
	thumb_func_end ov39_02228A8C

	thumb_func_start ov39_02228AA8
ov39_02228AA8: @ 0x02228AA8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x88
	ldr r0, [r0]
	cmp r0, #0
	beq _02228ABE
	bl FUN_0200F450
	movs r0, #0
	adds r4, #0x88
	str r0, [r4]
_02228ABE:
	pop {r4, pc}
	thumb_func_end ov39_02228AA8

	thumb_func_start ov39_02228AC0
ov39_02228AC0: @ 0x02228AC0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0x7c
	adds r4, r1, #0
	bl FUN_0201660C
	movs r1, #0
	movs r2, #0xe
	str r2, [sp, #0xc]
	str r5, [sp]
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0x19
	add r3, sp, #0
	strb r2, [r3, #0x10]
	movs r2, #0xa
	strb r2, [r3, #0x11]
	ldrb r4, [r3, #0x12]
	movs r2, #0xf
	adds r6, r0, #0
	bics r4, r2
	strb r4, [r3, #0x12]
	ldrb r4, [r3, #0x12]
	movs r2, #0xf0
	bics r4, r2
	strb r4, [r3, #0x12]
	strb r1, [r3, #0x13]
	add r1, sp, #0
	bl FUN_020166FC
	adds r0, r6, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov39_02228AC0

	thumb_func_start ov39_02228B04
ov39_02228B04: @ 0x02228B04
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r4, r3, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [r5, #0x20]
	ldr r1, [r5, #0x34]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0
	movs r2, #1
	movs r3, #0xa
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	adds r0, r5, #0
	ldr r2, [r5, #0x34]
	adds r0, #0x44
	movs r1, #1
	bl FUN_020200A8
	str r0, [r5, #0x40]
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x8c
	str r1, [r0]
	cmp r4, #0xff
	beq _02228B64
	cmp r4, #0
	bne _02228B68
_02228B64:
	movs r0, #0xff
	str r0, [r5, #0x40]
_02228B68:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov39_02228B04

	thumb_func_start ov39_02228B6C
ov39_02228B6C: @ 0x02228B6C
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bx lr
	.align 2, 0
	thumb_func_end ov39_02228B6C

	thumb_func_start ov39_02228B74
ov39_02228B74: @ 0x02228B74
	push {r3, lr}
	bl FUN_021E6A70
	cmp r0, #0xb
	bhi _02228BA6
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02228B8A: @ jump table
	.2byte _02228BA6 - _02228B8A - 2 @ case 0
	.2byte _02228BA2 - _02228B8A - 2 @ case 1
	.2byte _02228BA6 - _02228B8A - 2 @ case 2
	.2byte _02228BA6 - _02228B8A - 2 @ case 3
	.2byte _02228BA2 - _02228B8A - 2 @ case 4
	.2byte _02228BA2 - _02228B8A - 2 @ case 5
	.2byte _02228BA2 - _02228B8A - 2 @ case 6
	.2byte _02228BA2 - _02228B8A - 2 @ case 7
	.2byte _02228BA2 - _02228B8A - 2 @ case 8
	.2byte _02228BA2 - _02228B8A - 2 @ case 9
	.2byte _02228BA2 - _02228B8A - 2 @ case 10
	.2byte _02228BA2 - _02228B8A - 2 @ case 11
_02228BA2:
	movs r0, #1
	pop {r3, pc}
_02228BA6:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov39_02228B74

	thumb_func_start ov39_02228BAC
ov39_02228BAC: @ 0x02228BAC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x40]
	bl ov39_02228A70
	cmp r0, #1
	bne _02228BC2
	add sp, #4
	movs r0, #0
	pop {r3, r4, pc}
_02228BC2:
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r0, #4
	bhi _02228C6E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02228BD8: @ jump table
	.2byte _02228BE2 - _02228BD8 - 2 @ case 0
	.2byte _02228BF0 - _02228BD8 - 2 @ case 1
	.2byte _02228C12 - _02228BD8 - 2 @ case 2
	.2byte _02228C30 - _02228BD8 - 2 @ case 3
	.2byte _02228C6A - _02228BD8 - 2 @ case 4
_02228BE2:
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	adds r0, r0, #1
	str r0, [r4]
	b _02228C6E
_02228BF0:
	ldr r0, _02228C74 @ =0x00000F0F
	adds r3, r4, #0
	str r0, [sp]
	adds r3, #0x90
	ldr r1, [r4, #0x2c]
	ldr r3, [r3]
	adds r0, r4, #0
	movs r2, #0x11
	bl ov39_02228B04
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	adds r0, r0, #1
	str r0, [r4]
	b _02228C6E
_02228C12:
	movs r1, #0x8d
	ldr r0, [r4, #4]
	lsls r1, r1, #2
	bl ov39_02228AC0
	adds r1, r4, #0
	adds r1, #0x84
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	adds r0, r0, #1
	str r0, [r4]
	b _02228C6E
_02228C30:
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_020168F4
	cmp r0, #1
	bne _02228C56
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_02016624
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	adds r0, r0, #1
	str r0, [r4]
	b _02228C6E
_02228C56:
	cmp r0, #2
	bne _02228C6E
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	bl FUN_02016624
	movs r0, #8
	str r0, [r4, #8]
	b _02228C6E
_02228C6A:
	movs r0, #1
	str r0, [r4, #8]
_02228C6E:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02228C74: .4byte 0x00000F0F
	thumb_func_end ov39_02228BAC

	thumb_func_start ov39_02228C78
ov39_02228C78: @ 0x02228C78
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	beq _02228C90
	cmp r0, #1
	beq _02228CCC
	cmp r0, #2
	beq _02228CE4
	b _02228D00
_02228C90:
	ldr r0, [r4]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl FUN_02039418
	movs r0, #4
	bl FUN_0201A4BC
	bl FUN_0203A880
	ldr r0, _02228D08 @ =0x00000F0F
	adds r3, r4, #0
	str r0, [sp]
	adds r3, #0x90
	ldr r1, [r4, #0x28]
	ldr r3, [r3]
	adds r0, r4, #0
	movs r2, #1
	bl ov39_02228B04
	adds r0, r4, #0
	bl ov39_02228A8C
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	adds r0, r0, #1
	str r0, [r4]
	b _02228D00
_02228CCC:
	ldr r0, [r4, #0x40]
	bl ov39_02228A70
	cmp r0, #0
	bne _02228D00
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	adds r0, r0, #1
	str r0, [r4]
	b _02228D00
_02228CE4:
	ldr r0, [r4]
	movs r1, #2
	adds r0, #0x14
	movs r2, #1
	movs r3, #0x14
	blx FUN_021EC3F0
	movs r0, #2
	blx FUN_021EC454
	blx FUN_021EC4A4
	movs r0, #2
	str r0, [r4, #8]
_02228D00:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_02228D08: .4byte 0x00000F0F
	thumb_func_end ov39_02228C78

	thumb_func_start ov39_02228D0C
ov39_02228D0C: @ 0x02228D0C
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	blx FUN_021EC60C
	blx FUN_021EC5B4
	cmp r0, #0
	beq _02228D8A
	blx FUN_021EC724
	cmp r0, #8
	bhi _02228D6A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02228D32: @ jump table
	.2byte _02228D6A - _02228D32 - 2 @ case 0
	.2byte _02228D6A - _02228D32 - 2 @ case 1
	.2byte _02228D6A - _02228D32 - 2 @ case 2
	.2byte _02228D6A - _02228D32 - 2 @ case 3
	.2byte _02228D80 - _02228D32 - 2 @ case 4
	.2byte _02228D6A - _02228D32 - 2 @ case 5
	.2byte _02228D6A - _02228D32 - 2 @ case 6
	.2byte _02228D44 - _02228D32 - 2 @ case 7
	.2byte _02228D6A - _02228D32 - 2 @ case 8
_02228D44:
	add r0, sp, #8
	add r1, sp, #4
	blx FUN_021EC11C
	str r0, [r4, #0x14]
	ldr r0, [sp, #8]
	str r0, [r4, #0x18]
	ldr r0, [sp, #4]
	str r0, [r4, #0x1c]
	blx FUN_021EC210
	blx FUN_021EC8D8
	adds r0, r4, #0
	bl ov39_02228AA8
	movs r0, #6
	str r0, [r4, #8]
	b _02228D8A
_02228D6A:
	add r0, sp, #0
	blx FUN_021EC0FC
	adds r0, r4, #0
	bl ov39_02228AA8
	movs r0, #0xa
	str r0, [r4, #8]
	subs r0, #0xc
	str r0, [r4, #0x10]
	b _02228D8A
_02228D80:
	add r0, sp, #0xc
	blx FUN_021EC9E0
	movs r0, #3
	str r0, [r4, #8]
_02228D8A:
	movs r0, #0
	add sp, #0x48
	pop {r4, pc}
	thumb_func_end ov39_02228D0C

	thumb_func_start ov39_02228D90
ov39_02228D90: @ 0x02228D90
	push {r4, lr}
	adds r4, r0, #0
	blx FUN_021ECD04
	movs r0, #4
	str r0, [r4, #8]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov39_02228D90

	thumb_func_start ov39_02228DA0
ov39_02228DA0: @ 0x02228DA0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	blx FUN_021ECDC8
	cmp r0, #5
	bhi _02228E44
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02228DBA: @ jump table
	.2byte _02228DCC - _02228DBA - 2 @ case 0
	.2byte _02228E44 - _02228DBA - 2 @ case 1
	.2byte _02228E44 - _02228DBA - 2 @ case 2
	.2byte _02228DC6 - _02228DBA - 2 @ case 3
	.2byte _02228DCC - _02228DBA - 2 @ case 4
	.2byte _02228DCC - _02228DBA - 2 @ case 5
_02228DC6:
	movs r0, #5
	str r0, [r4, #8]
	b _02228E44
_02228DCC:
	adds r0, r4, #0
	bl ov39_02228AA8
	add r0, sp, #4
	add r1, sp, #0
	blx FUN_021EC11C
	str r0, [r4, #0x14]
	ldr r0, [sp, #4]
	str r0, [r4, #0x18]
	ldr r0, [sp]
	str r0, [r4, #0x1c]
	blx FUN_021EC210
	blx FUN_021EC8D8
	movs r0, #6
	str r0, [r4, #8]
	ldr r1, [sp]
	cmp r1, #7
	bhi _02228E32
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02228E02: @ jump table
	.2byte _02228E32 - _02228E02 - 2 @ case 0
	.2byte _02228E12 - _02228E02 - 2 @ case 1
	.2byte _02228E12 - _02228E02 - 2 @ case 2
	.2byte _02228E24 - _02228E02 - 2 @ case 3
	.2byte _02228E16 - _02228E02 - 2 @ case 4
	.2byte _02228E2E - _02228E02 - 2 @ case 5
	.2byte _02228E20 - _02228E02 - 2 @ case 6
	.2byte _02228E2E - _02228E02 - 2 @ case 7
_02228E12:
	str r0, [r4, #8]
	b _02228E32
_02228E16:
	blx FUN_021FA0D8
	movs r0, #6
	str r0, [r4, #8]
	b _02228E32
_02228E20:
	str r0, [r4, #8]
	b _02228E32
_02228E24:
	blx FUN_021ED9B4
	movs r0, #6
	str r0, [r4, #8]
	b _02228E32
_02228E2E:
	bl FUN_020399EC
_02228E32:
	ldr r1, [sp, #4]
	ldr r0, _02228E4C @ =0xFFFFB1E0
	cmp r1, r0
	bge _02228E44
	ldr r0, _02228E50 @ =0xFFFF8AD1
	cmp r1, r0
	blt _02228E44
	movs r0, #6
	str r0, [r4, #8]
_02228E44:
	movs r0, #0
	add sp, #8
	pop {r4, pc}
	nop
_02228E4C: .4byte 0xFFFFB1E0
_02228E50: .4byte 0xFFFF8AD1
	thumb_func_end ov39_02228DA0

	thumb_func_start ov39_02228E54
ov39_02228E54: @ 0x02228E54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl FUN_0202C6F4
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl FUN_02028D30
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_0202C08C
	adds r0, r4, #0
	bl FUN_02028DD8
	cmp r0, #0
	bne _02228E8E
	adds r0, r6, #0
	bl FUN_0203A040
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02028DDC
_02228E8E:
	adds r0, r4, #0
	bl FUN_02028DD8
	movs r0, #9
	str r0, [r5, #8]
	ldr r0, [r5]
	movs r1, #1
	str r1, [r0, #0x7c]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov39_02228E54

	thumb_func_start ov39_02228EA4
ov39_02228EA4: @ 0x02228EA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	rsbs r0, r0, #0
	bl FUN_021E6A70
	ldr r2, [r4, #0x18]
	adds r1, r0, #0
	adds r0, r4, #0
	rsbs r2, r2, #0
	bl ov39_02228A34
	movs r0, #7
	str r0, [r4, #8]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov39_02228EA4

	thumb_func_start ov39_02228EC8
ov39_02228EC8: @ 0x02228EC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02228F14 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	bne _02228EE4
	movs r0, #2
	tst r0, r1
	bne _02228EE4
	bl FUN_02025358
	cmp r0, #1
	bne _02228F0E
_02228EE4:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	bl FUN_0200E5D4
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x94
	str r1, [r0]
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	rsbs r0, r0, #0
	bl ov39_02228B74
	cmp r0, #1
	bne _02228F0A
	movs r0, #0
	str r0, [r4, #8]
	b _02228F0E
_02228F0A:
	movs r0, #8
	str r0, [r4, #8]
_02228F0E:
	movs r0, #0
	pop {r4, pc}
	nop
_02228F14: .4byte 0x021D110C
	thumb_func_end ov39_02228EC8

	thumb_func_start ov39_02228F18
ov39_02228F18: @ 0x02228F18
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #9
	beq _02228F28
	bl FUN_0203946C
_02228F28:
	bl FUN_0203A914
	adds r0, r4, #0
	bl ov39_02228AA8
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x7c
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov39_02228F18

	thumb_func_start ov39_02228F54
ov39_02228F54: @ 0x02228F54
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	movs r2, #0
	adds r0, #0xf
	cmp r0, #0x11
	bhi _02228FA2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02228F70: @ jump table
	.2byte _02228FA0 - _02228F70 - 2 @ case 0
	.2byte _02228F9C - _02228F70 - 2 @ case 1
	.2byte _02228FA2 - _02228F70 - 2 @ case 2
	.2byte _02228FA0 - _02228F70 - 2 @ case 3
	.2byte _02228FA2 - _02228F70 - 2 @ case 4
	.2byte _02228FA2 - _02228F70 - 2 @ case 5
	.2byte _02228FA2 - _02228F70 - 2 @ case 6
	.2byte _02228FA2 - _02228F70 - 2 @ case 7
	.2byte _02228FA2 - _02228F70 - 2 @ case 8
	.2byte _02228FA2 - _02228F70 - 2 @ case 9
	.2byte _02228FA0 - _02228F70 - 2 @ case 10
	.2byte _02228FA2 - _02228F70 - 2 @ case 11
	.2byte _02228FA0 - _02228F70 - 2 @ case 12
	.2byte _02228F9C - _02228F70 - 2 @ case 13
	.2byte _02228F98 - _02228F70 - 2 @ case 14
	.2byte _02228FA2 - _02228F70 - 2 @ case 15
	.2byte _02228F94 - _02228F70 - 2 @ case 16
	.2byte _02228F98 - _02228F70 - 2 @ case 17
_02228F94:
	movs r2, #0x96
	b _02228FA2
_02228F98:
	movs r2, #0x97
	b _02228FA2
_02228F9C:
	movs r2, #0x9c
	b _02228FA2
_02228FA0:
	movs r2, #0x9b
_02228FA2:
	ldr r0, _02228FC4 @ =0x00000F0F
	adds r3, r4, #0
	str r0, [sp]
	adds r3, #0x90
	ldr r1, [r4, #0x24]
	ldr r3, [r3]
	adds r0, r4, #0
	bl ov39_02228B04
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0xb
	bl ov39_02228B6C
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02228FC4: .4byte 0x00000F0F
	thumb_func_end ov39_02228F54

	thumb_func_start ov39_02228FC8
ov39_02228FC8: @ 0x02228FC8
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x94
	ldr r1, [r1]
	cmp r1, #3
	bhi _02229064
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02228FE4: @ jump table
	.2byte _02228FEC - _02228FE4 - 2 @ case 0
	.2byte _0222900C - _02228FE4 - 2 @ case 1
	.2byte _0222902C - _02228FE4 - 2 @ case 2
	.2byte _0222904C - _02228FE4 - 2 @ case 3
_02228FEC:
	ldr r1, _02229088 @ =0x00000F0F
	adds r3, r4, #0
	str r1, [sp]
	adds r3, #0x90
	ldr r1, [r4, #0x24]
	ldr r3, [r3]
	movs r2, #0xba
	bl ov39_02228B04
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	adds r0, r0, #1
	str r0, [r4]
	b _02229080
_0222900C:
	ldr r0, [r4, #0x40]
	bl ov39_02228A70
	cmp r0, #0
	bne _02229080
	bl FUN_0203946C
	blx FUN_021EC8D8
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	adds r0, r0, #1
	str r0, [r4]
	b _02229080
_0222902C:
	ldr r1, _02229088 @ =0x00000F0F
	adds r3, r4, #0
	str r1, [sp]
	adds r3, #0x90
	ldr r1, [r4, #0x24]
	ldr r3, [r3]
	movs r2, #0xbb
	bl ov39_02228B04
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	adds r0, r0, #1
	str r0, [r4]
	b _02229080
_0222904C:
	ldr r0, [r4, #0x40]
	bl ov39_02228A70
	cmp r0, #0
	bne _02229080
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	adds r0, r0, #1
	str r0, [r4]
	b _02229080
_02229064:
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x98
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	cmp r0, #0x1e
	ble _02229080
	movs r0, #8
	str r0, [r4, #8]
_02229080:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_02229088: .4byte 0x00000F0F
	thumb_func_end ov39_02228FC8

	thumb_func_start ov39_0222908C
ov39_0222908C: @ 0x0222908C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x40]
	bl ov39_02228A70
	cmp r0, #0
	bne _0222909E
	ldr r0, [r4, #0xc]
	str r0, [r4, #8]
_0222909E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov39_0222908C

	thumb_func_start ov39_022290A4
ov39_022290A4: @ 0x022290A4
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x40]
	bl ov39_02228A70
	cmp r0, #1
	bne _022290BA
	add sp, #4
	movs r0, #0
	pop {r3, r4, pc}
_022290BA:
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r0, #3
	bhi _02229152
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022290D0: @ jump table
	.2byte _022290D8 - _022290D0 - 2 @ case 0
	.2byte _022290FA - _022290D0 - 2 @ case 1
	.2byte _02229110 - _022290D0 - 2 @ case 2
	.2byte _02229136 - _022290D0 - 2 @ case 3
_022290D8:
	ldr r0, _02229158 @ =0x00000F0F
	adds r3, r4, #0
	str r0, [sp]
	adds r3, #0x90
	ldr r1, [r4, #0x2c]
	ldr r3, [r3]
	adds r0, r4, #0
	movs r2, #0x1a
	bl ov39_02228B04
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	adds r0, r0, #1
	str r0, [r4]
	b _02229152
_022290FA:
	blx FUN_021EC8D8
	bl FUN_0203946C
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	adds r0, r0, #1
	str r0, [r4]
	b _02229152
_02229110:
	bl FUN_0203A914
	ldr r0, _02229158 @ =0x00000F0F
	adds r3, r4, #0
	str r0, [sp]
	adds r3, #0x90
	ldr r1, [r4, #0x2c]
	ldr r3, [r3]
	adds r0, r4, #0
	movs r2, #0x1b
	bl ov39_02228B04
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r4, #0x94
	adds r0, r0, #1
	str r0, [r4]
	b _02229152
_02229136:
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x98
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	cmp r0, #0x1e
	ble _02229152
	ldr r0, [r4, #0xc]
	str r0, [r4, #8]
_02229152:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02229158: .4byte 0x00000F0F
	thumb_func_end ov39_022290A4

	thumb_func_start ov39_0222915C
ov39_0222915C: @ 0x0222915C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x60
	blx FUN_020D4994
	ldr r0, [r5]
	movs r1, #0
	str r0, [r4]
	ldr r0, [r5, #4]
	adds r2, r5, #0
	str r0, [r4, #4]
	ldr r0, [r5, #8]
	adds r3, r4, #0
	str r0, [r4, #8]
	ldrh r0, [r5, #0xc]
	strh r0, [r4, #0xc]
_02229182:
	ldrh r0, [r2, #0x24]
	adds r1, r1, #1
	adds r2, r2, #2
	strh r0, [r3, #0xe]
	adds r3, r3, #2
	cmp r1, #8
	blt _02229182
	movs r0, #0x34
	ldrsb r0, [r5, r0]
	movs r2, #0
	strb r0, [r4, #0x1e]
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	strb r0, [r4, #0x1f]
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x21
	strb r1, [r0]
	ldr r0, [r5, #0x3c]
	adds r1, r4, #0
	str r0, [r4, #0x24]
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r0, [r0]
	strh r0, [r4, #0x28]
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	strh r0, [r4, #0x2a]
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r0, [r0]
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	adds r0, #0x46
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	adds r0, r5, #0
	adds r0, #0x48
_022291E2:
	ldrb r6, [r0]
	adds r3, r1, #0
	adds r3, #0x30
	strb r6, [r3]
	adds r3, r1, #0
	ldrb r6, [r0, #1]
	adds r3, #0x31
	adds r2, r2, #1
	strb r6, [r3]
	adds r3, r1, #0
	ldrb r6, [r0, #2]
	adds r3, #0x32
	strb r6, [r3]
	adds r3, r1, #0
	ldrb r6, [r0, #3]
	adds r3, #0x33
	adds r0, r0, #4
	adds r1, r1, #4
	strb r6, [r3]
	cmp r2, #0xa
	blt _022291E2
	adds r0, r5, #0
	adds r0, #0x70
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x58
	adds r5, #0x71
	strb r1, [r0]
	ldrb r0, [r5]
	adds r4, #0x59
	strb r0, [r4]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov39_0222915C

	thumb_func_start ov39_02229224
ov39_02229224: @ 0x02229224
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	bl FUN_0202B994
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	blx FUN_020D4994
	ldr r0, [r5]
	movs r1, #0
	str r0, [r4]
	ldr r0, [r5, #4]
	adds r2, r5, #0
	str r0, [r4, #4]
	ldr r0, [r5, #8]
	adds r3, r4, #0
	str r0, [r4, #8]
	ldrh r0, [r5, #0xc]
	strh r0, [r4, #0xc]
_0222924E:
	ldrh r0, [r2, #0xe]
	adds r1, r1, #1
	adds r2, r2, #2
	strh r0, [r3, #0x24]
	adds r3, r3, #2
	cmp r1, #8
	blt _0222924E
	movs r0, #0x1e
	ldrsb r1, [r5, r0]
	adds r0, r4, #0
	adds r0, #0x34
	strb r1, [r0]
	adds r0, r4, #0
	ldrb r1, [r5, #0x1f]
	adds r0, #0x35
	movs r2, #0
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x36
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x37
	strb r1, [r0]
	ldr r0, [r5, #0x24]
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	ldrh r1, [r5, #0x28]
	adds r0, #0x40
	strh r1, [r0]
	adds r0, r4, #0
	ldrh r1, [r5, #0x2a]
	adds r0, #0x42
	strh r1, [r0]
	adds r0, r4, #0
	ldrh r1, [r5, #0x2c]
	adds r0, #0x44
	strh r1, [r0]
	adds r0, r4, #0
	ldrh r1, [r5, #0x2e]
	adds r0, #0x46
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
_022292B2:
	ldrb r6, [r0]
	adds r3, r1, #0
	adds r3, #0x48
	strb r6, [r3]
	adds r3, r1, #0
	ldrb r6, [r0, #1]
	adds r3, #0x49
	adds r2, r2, #1
	strb r6, [r3]
	adds r3, r1, #0
	ldrb r6, [r0, #2]
	adds r3, #0x4a
	strb r6, [r3]
	adds r3, r1, #0
	ldrb r6, [r0, #3]
	adds r3, #0x4b
	adds r0, r0, #4
	adds r1, r1, #4
	strb r6, [r3]
	cmp r2, #0xa
	blt _022292B2
	adds r0, r5, #0
	adds r0, #0x58
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x70
	strb r1, [r0]
	adds r5, #0x59
	adds r0, r4, #0
	ldrb r1, [r5]
	adds r0, #0x71
	movs r2, #0
	strb r1, [r0]
	ldr r0, _0222930C @ =0x0000FFFF
	adds r1, r4, #0
_022292F8:
	adds r2, r2, #1
	strh r0, [r1, #0xe]
	adds r1, r1, #2
	cmp r2, #0xb
	blt _022292F8
	movs r0, #0
	adds r4, #0x38
	strb r0, [r4]
	pop {r4, r5, r6, pc}
	nop
_0222930C: .4byte 0x0000FFFF
	thumb_func_end ov39_02229224

	arm_func_start ov39_02229310
ov39_02229310: @ 0x02229310
	push {r3, lr}
	bl ov39_02229408
	mov r0, #0
	ldr lr, _0222936C @ =0x0222AB84
	mov r1, r0
	mov r2, r0
	mov r3, r0
	mov ip, #9
_02229330:
	stm lr!, {r0, r1, r2, r3}
	stm lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02229330
	stm lr!, {r0, r1, r2, r3}
	stm lr, {r0, r1}
	ldr r1, _0222936C @ =0x0222AB84
	mov r2, #0
	str r2, [r1, #0x138]
	ldr r0, _02229370 @ =0x0222AD84
	strb r2, [r1, #0x140]
	strh r2, [r0, #0x40]
	bl ov39_0222993C
	bl ov39_02229970
	pop {r3, pc}
	.align 2, 0
_0222936C: .4byte 0x0222AB84
_02229370: .4byte 0x0222AD84
	arm_func_end ov39_02229310

	arm_func_start ov39_02229374
ov39_02229374: @ 0x02229374
	push {r4, r5, r6, lr}
	movs r5, r2
	mov r6, r0
	mov r4, r1
	beq _022293B4
	ldr lr, _022293FC @ =0x0222AB84
	mov ip, #0x13
_02229390:
	ldm r5!, {r0, r1, r2, r3}
	stm lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02229390
	ldm r5, {r0, r1}
	stm lr, {r0, r1}
	ldr r0, _022293FC @ =0x0222AB84
	mov r1, #0
	str r1, [r0, #0x138]
_022293B4:
	bl ov39_02229944
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, pc}
	bl ov39_02229924
	ldr r0, _02229400 @ =0x0222ACC4
	mov r1, r6
	bl FUN_020E959C
	ldr r1, _02229404 @ =0x0222AD84
	mov r2, #0
	ldr r0, _022293FC @ =0x0222AB84
	strh r4, [r1, #0x40]
	str r2, [r0, #0x258]
	sub r1, r2, #1
	str r1, [r0, #0x26c]
	bl ov39_02229408
	mov r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_022293FC: .4byte 0x0222AB84
_02229400: .4byte 0x0222ACC4
_02229404: .4byte 0x0222AD84
	arm_func_end ov39_02229374

	arm_func_start ov39_02229408
ov39_02229408: @ 0x02229408
	push {r3, lr}
	bl ov39_02229BA4
	ldr r0, _02229470 @ =0x0222AB84
	ldr r0, [r0, #0x258]
	cmp r0, #0
	beq _02229430
	bl ov39_022298E0
	ldr r0, _02229470 @ =0x0222AB84
	mov r1, #0
	str r1, [r0, #0x258]
_02229430:
	ldr r0, _02229470 @ =0x0222AB84
	mov r1, #0xf
	str r1, [r0, #0x244]
	mov r1, #0x1e
	str r1, [r0, #0x248]
	str r1, [r0, #0x24c]
	mov r2, #0
	str r2, [r0, #0x254]
	str r2, [r0, #0x25c]
	str r2, [r0, #0x260]
	str r2, [r0, #0x264]
	str r2, [r0, #0x268]
	mov r1, #1
	str r1, [r0, #0x13c]
	str r2, [r0, #0x250]
	pop {r3, pc}
	.align 2, 0
_02229470: .4byte 0x0222AB84
	arm_func_end ov39_02229408

	arm_func_start ov39_02229474
ov39_02229474: @ 0x02229474
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r5, #0
	ldr r4, _0222962C @ =0x0222AB84
	mov fp, #9
	mov sl, #7
	mov r6, #1
	mov r7, r5
_02229490:
	ldr r0, [r4, #0x13c]
	mov r8, r7
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022295E8
_022294A4: @ jump table
	b _022294CC @ case 0
	b _022294CC @ case 1
	b _022294D4 @ case 2
	b _02229508 @ case 3
	b _0222953C @ case 4
	b _02229570 @ case 5
	b _022295B8 @ case 6
	b _022294CC @ case 7
	b _022294CC @ case 8
	b _022294CC @ case 9
_022294CC:
	mov r8, r6
	b _022295E8
_022294D4:
	bl ov39_02229FCC
	cmp r0, #0
	bne _022294F8
	ldr r0, [r4, #0x250]
	mov r8, #1
	cmp r0, #0xd
	moveq sb, sl
	movne sb, fp
	b _022294FC
_022294F8:
	mov sb, #3
_022294FC:
	bl ov39_022298FC
	str sb, [r4, #0x13c]
	b _022295E8
_02229508:
	bl ov39_02229AD4
	cmp r0, #0
	bne _0222952C
	ldr r0, [r4, #0x250]
	mov r8, #1
	cmp r0, #0xd
	moveq sb, #7
	movne sb, #9
	b _02229530
_0222952C:
	mov sb, #4
_02229530:
	bl ov39_022298FC
	str sb, [r4, #0x13c]
	b _022295E8
_0222953C:
	bl ov39_02229BE4
	cmp r0, #0
	bne _02229560
	ldr r0, [r4, #0x250]
	mov r8, #1
	cmp r0, #0xd
	moveq sb, #7
	movne sb, #9
	b _02229564
_02229560:
	mov sb, #5
_02229564:
	bl ov39_022298FC
	str sb, [r4, #0x13c]
	b _022295E8
_02229570:
	bl ov39_02229D2C
	cmp r0, #0
	bne _02229594
	ldr r0, [r4, #0x250]
	mov r8, #1
	cmp r0, #0xd
	moveq sb, #7
	movne sb, #9
	b _02229598
_02229594:
	mov sb, #6
_02229598:
	ldr r0, [r4, #0x258]
	cmp r0, #0
	beq _022295AC
	bl ov39_022298E0
	str r5, [r4, #0x258]
_022295AC:
	bl ov39_022298FC
	str sb, [r4, #0x13c]
	b _022295E8
_022295B8:
	bl ov39_02229E40
	cmp r0, #0
	bne _022295D8
	ldr r0, [r4, #0x250]
	cmp r0, #0xd
	moveq sb, #7
	movne sb, #9
	b _022295DC
_022295D8:
	mov sb, #8
_022295DC:
	mov r8, #1
	bl ov39_022298FC
	str sb, [r4, #0x13c]
_022295E8:
	cmp r8, #0
	bne _02229624
	ldr r0, [r4, #0x268]
	cmp r0, #1
	bne _02229614
	ldr r0, _0222962C @ =0x0222AB84
	mov r1, #7
	str r1, [r0, #0x13c]
	mov r1, #0xd
	str r1, [r0, #0x250]
	b _02229624
_02229614:
	bl ov39_02229910
	mov r0, #1
	bl ov39_02229FC0
	b _02229490
_02229624:
	bl ov39_02229910
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0222962C: .4byte 0x0222AB84
	arm_func_end ov39_02229474

	arm_func_start ov39_02229630
ov39_02229630: @ 0x02229630
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov39_022298FC
	ldr r0, _02229818 @ =0x0222AB84
	ldr r0, [r0, #0x13c]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022296A8
_0222965C: @ jump table
	b _02229684 @ case 0
	b _022296A8 @ case 1
	b _02229684 @ case 2
	b _02229684 @ case 3
	b _02229684 @ case 4
	b _02229684 @ case 5
	b _02229684 @ case 6
	b _022296A4 @ case 7
	b _022296A4 @ case 8
	b _022296A4 @ case 9
_02229684:
	bl ov39_02229910
	ldr r0, _02229818 @ =0x0222AB84
	mov r1, #9
	str r1, [r0, #0x13c]
	mov r1, #1
	str r1, [r0, #0x250]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022296A4:
	bl ov39_02229408
_022296A8:
	bl ov39_02229910
	mov r0, r7
	bl ov39_0222A6DC
	ldr r2, _02229818 @ =0x0222AB84
	mvn r1, #0
	str r0, [r2, #0x25c]
	cmp r0, r1
	bne _022296E0
	mov r0, #9
	str r0, [r2, #0x13c]
	mov r0, #2
	str r0, [r2, #0x250]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022296E0:
	cmp r4, r1
	str r5, [r2, #0x260]
	addne r0, r4, #0x140
	strne r0, [sp]
	bne _02229728
	mov r0, r7
	bl ov39_0222A59C
	mvn r1, #0
	str r0, [sp]
	cmp r0, r1
	bne _02229728
	ldr r0, _02229818 @ =0x0222AB84
	mov r1, #9
	str r1, [r0, #0x13c]
	mov r1, #2
	str r1, [r0, #0x250]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02229728:
	ldr r0, [sp]
	bl ov39_022298CC
	ldr ip, _02229818 @ =0x0222AB84
	cmp r0, #0
	str r0, [ip, #0x258]
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r1, [sp]
	add r3, sp, #0
	str r1, [ip, #0x254]
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	mov r4, #0x13
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldr lr, [ip, #0x258]
	strh r7, [lr, #4]
	add r5, lr, #8
_02229780:
	ldm ip!, {r0, r1, r2, r3}
	stm r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _02229780
	ldm ip, {r0, r1}
	stm r5, {r0, r1}
	mov r0, #0
	strh r0, [lr, #6]
	ldr r2, [sp]
	mov r1, r6
	add r0, lr, #0x140
	sub r2, r2, #0x140
	bl FUN_020E5AD8
	ldr r0, _02229818 @ =0x0222AB84
	ldr r2, [r0, #0x258]
	ldr r1, [r0, #0x254]
	add r0, r2, #4
	sub r1, r1, #4
	add r2, r2, #4
	bl ov39_0222A4EC
	ldr r0, _02229818 @ =0x0222AB84
	mov r1, #2
	str r1, [r0, #0x13c]
	bl ov39_022298FC
	bl ov39_02229980
	cmp r0, #0
	bne _0222980C
	ldr r0, _02229818 @ =0x0222AB84
	mov r1, #9
	str r1, [r0, #0x13c]
	mov r1, #6
	str r1, [r0, #0x250]
	bl ov39_02229910
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222980C:
	bl ov39_02229910
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02229818: .4byte 0x0222AB84
	arm_func_end ov39_02229630

	arm_func_start ov39_0222981C
ov39_0222981C: @ 0x0222981C
	ldr r0, _02229828 @ =0x0222AB84
	ldr r0, [r0, #0x13c]
	bx lr
	.align 2, 0
_02229828: .4byte 0x0222AB84
	arm_func_end ov39_0222981C

	arm_func_start ov39_0222982C
ov39_0222982C: @ 0x0222982C
	push {r3, lr}
	bl ov39_022298FC
	bl ov39_0222981C
	cmp r0, #8
	beq _0222984C
	bl ov39_02229910
	mov r0, #0
	pop {r3, pc}
_0222984C:
	bl ov39_02229910
	ldr r0, _02229860 @ =0x0222AB84
	ldr r0, [r0, #0x260]
	add r0, r0, #4
	pop {r3, pc}
	.align 2, 0
_02229860: .4byte 0x0222AB84
	arm_func_end ov39_0222982C

	arm_func_start ov39_02229864
ov39_02229864: @ 0x02229864
	push {r3, lr}
	bl ov39_022298FC
	bl ov39_0222981C
	cmp r0, #8
	beq _02229884
	bl ov39_02229910
	mvn r0, #0
	pop {r3, pc}
_02229884:
	bl ov39_02229910
	ldr r0, _02229894 @ =0x0222AB84
	ldr r0, [r0, #0x25c]
	pop {r3, pc}
	.align 2, 0
_02229894: .4byte 0x0222AB84
	arm_func_end ov39_02229864

	arm_func_start ov39_02229898
ov39_02229898: @ 0x02229898
	push {r3, lr}
	bl ov39_022298FC
	bl ov39_0222981C
	cmp r0, #9
	beq _022298B8
	bl ov39_02229910
	mov r0, #0
	pop {r3, pc}
_022298B8:
	bl ov39_02229910
	ldr r0, _022298C8 @ =0x0222AB84
	ldr r0, [r0, #0x250]
	pop {r3, pc}
	.align 2, 0
_022298C8: .4byte 0x0222AB84
	arm_func_end ov39_02229898

	arm_func_start ov39_022298CC
ov39_022298CC: @ 0x022298CC
	ldr ip, _022298DC @ =0x021EC2A8
	mov r1, r0
	mov r0, #0
	bx ip
	.align 2, 0
_022298DC: .4byte 0x021EC2A8
	arm_func_end ov39_022298CC

	arm_func_start ov39_022298E0
ov39_022298E0: @ 0x022298E0
	push {r3, lr}
	movs r1, r0
	popeq {r3, pc}
	mov r0, #0
	mov r2, r0
	bl FUN_021EC2EC
	pop {r3, pc}
	arm_func_end ov39_022298E0

	arm_func_start ov39_022298FC
ov39_022298FC: @ 0x022298FC
	ldr ip, _02229908 @ =0x020D2618
	ldr r0, _0222990C @ =0x0222AEB8
	bx ip
	.align 2, 0
_02229908: .4byte 0x020D2618
_0222990C: .4byte 0x0222AEB8
	arm_func_end ov39_022298FC

	arm_func_start ov39_02229910
ov39_02229910: @ 0x02229910
	ldr ip, _0222991C @ =0x020D269C
	ldr r0, _02229920 @ =0x0222AEB8
	bx ip
	.align 2, 0
_0222991C: .4byte 0x020D269C
_02229920: .4byte 0x0222AEB8
	arm_func_end ov39_02229910

	arm_func_start ov39_02229924
ov39_02229924: @ 0x02229924
	push {r3, lr}
	ldr r0, _02229938 @ =0x0222AEB8
	bl FUN_020D2600
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_02229938: .4byte 0x0222AEB8
	arm_func_end ov39_02229924

	arm_func_start ov39_0222993C
ov39_0222993C: @ 0x0222993C
	mov r0, #1
	bx lr
	arm_func_end ov39_0222993C

	arm_func_start ov39_02229944
ov39_02229944: @ 0x02229944
	push {r3, lr}
	bl FUN_020D3438
	cmp r0, #0
	bne _02229958
	bl FUN_020D33C0
_02229958:
	ldr r0, _0222996C @ =0x0222AB84
	mov r1, #0x10
	str r1, [r0, #0x270]
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_0222996C: .4byte 0x0222AB84
	arm_func_end ov39_02229944

	arm_func_start ov39_02229970
ov39_02229970: @ 0x02229970
	bx lr
	arm_func_end ov39_02229970

	arm_func_start ov39_02229974
ov39_02229974: @ 0x02229974
	ldr ip, _0222997C @ =ov39_02229474
	bx ip
	.align 2, 0
_0222997C: .4byte ov39_02229474
	arm_func_end ov39_02229974

	arm_func_start ov39_02229980
ov39_02229980: @ 0x02229980
	push {r3, lr}
	sub sp, sp, #8
	mov r1, #0x800
	ldr r0, _022299C4 @ =0x0222AB84
	str r1, [sp]
	ldr ip, [r0, #0x270]
	ldr r0, _022299C8 @ =0x0222ADF8
	ldr r1, _022299CC @ =ov39_02229974
	ldr r3, _022299D0 @ =0x0222B6D0
	mov r2, #0
	str ip, [sp, #4]
	bl FUN_020D1AD4
	ldr r0, _022299C8 @ =0x0222ADF8
	bl FUN_020D1F34
	mov r0, #1
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_022299C4: .4byte 0x0222AB84
_022299C8: .4byte 0x0222ADF8
_022299CC: .4byte ov39_02229974
_022299D0: .4byte 0x0222B6D0
	arm_func_end ov39_02229980

	arm_func_start ov39_022299D4
ov39_022299D4: @ 0x022299D4
	ldrsb ip, [r0]
	mov r2, #0
	mov r3, r2
	cmp ip, #0
	beq _02229A50
	mov r1, r2
_022299EC:
	cmp ip, #0x30
	blt _02229A10
	cmp ip, #0x39
	bgt _02229A10
	add r2, r2, #1
	cmp r2, #4
	blt _02229A44
	mov r0, #0
	bx lr
_02229A10:
	cmp ip, #0x2e
	bne _02229A3C
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	add r3, r3, #1
	mov r2, r1
	cmp r3, #4
	blt _02229A44
	mov r0, r1
	bx lr
_02229A3C:
	mov r0, #0
	bx lr
_02229A44:
	ldrsb ip, [r0, #1]!
	cmp ip, #0
	bne _022299EC
_02229A50:
	cmp r3, #3
	bne _02229A64
	cmp r2, #0
	movne r0, #1
	bxne lr
_02229A64:
	mov r0, #0
	bx lr
	arm_func_end ov39_022299D4

	arm_func_start ov39_02229A6C
ov39_02229A6C: @ 0x02229A6C
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl ov39_022299D4
	cmp r0, #0
	bne _02229AC0
	mov r0, r5
	bl FUN_020A30D4
	cmp r0, #0
	beq _02229AB8
	ldr r0, [r0, #0xc]
	ldr r0, [r0]
	ldr r0, [r0]
	str r0, [sp]
	bl FUN_020A357C
	mov r1, r0
	mov r0, r4
	bl FUN_020E959C
	b _02229ACC
_02229AB8:
	mov r0, #0
	pop {r3, r4, r5, pc}
_02229AC0:
	mov r0, r4
	mov r1, r5
	bl FUN_020E959C
_02229ACC:
	mov r0, #1
	pop {r3, r4, r5, pc}
	arm_func_end ov39_02229A6C

	arm_func_start ov39_02229AD4
ov39_02229AD4: @ 0x02229AD4
	push {r3, lr}
	sub sp, sp, #0x10
	mov r0, #2
	mov r1, #1
	mov r2, #0
	bl FUN_020A2EAC
	ldr r2, _02229B9C @ =0x0222AB84
	mvn r1, #0
	str r0, [r2, #0x26c]
	cmp r0, r1
	bne _02229B14
	mov r0, #3
	str r0, [r2, #0x250]
	add sp, sp, #0x10
	mov r0, #0
	pop {r3, pc}
_02229B14:
	mov r1, #3
	mov r2, #0
	bl FUN_020A3354
	ldr r1, _02229B9C @ =0x0222AB84
	orr r2, r0, #4
	ldr r0, [r1, #0x26c]
	mov r1, #4
	bl FUN_020A3354
	cmp r0, #0
	bge _02229B54
	ldr r0, _02229B9C @ =0x0222AB84
	mov r1, #4
	str r1, [r0, #0x250]
	add sp, sp, #0x10
	mov r0, #0
	pop {r3, pc}
_02229B54:
	ldr r0, _02229BA0 @ =0x0222ACC4
	add r1, sp, #0
	bl ov39_02229A6C
	cmp r0, #0
	bne _02229B80
	ldr r0, _02229B9C @ =0x0222AB84
	mov r1, #5
	str r1, [r0, #0x250]
	add sp, sp, #0x10
	mov r0, #0
	pop {r3, pc}
_02229B80:
	add r0, sp, #0
	bl FUN_021FFA44
	ldr r1, _02229B9C @ =0x0222AB84
	str r0, [r1, #0x264]
	mov r0, #1
	add sp, sp, #0x10
	pop {r3, pc}
	.align 2, 0
_02229B9C: .4byte 0x0222AB84
_02229BA0: .4byte 0x0222ACC4
	arm_func_end ov39_02229AD4

	arm_func_start ov39_02229BA4
ov39_02229BA4: @ 0x02229BA4
	push {r3, lr}
	ldr r0, _02229BE0 @ =0x0222AB84
	mvn r1, #0
	ldr r0, [r0, #0x26c]
	cmp r0, r1
	popeq {r3, pc}
	mov r1, #2
	bl FUN_020A30BC
	ldr r0, _02229BE0 @ =0x0222AB84
	ldr r0, [r0, #0x26c]
	bl FUN_020A30C8
	ldr r0, _02229BE0 @ =0x0222AB84
	mvn r1, #0
	str r1, [r0, #0x26c]
	pop {r3, pc}
	.align 2, 0
_02229BE0: .4byte 0x0222AB84
	arm_func_end ov39_02229BA4

	arm_func_start ov39_02229BE4
ov39_02229BE4: @ 0x02229BE4
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r2, #8
	mov r1, #2
	ldr r0, _02229D20 @ =0x0222AD84
	strb r2, [sp]
	strb r1, [sp, #1]
	ldrh r1, [r0, #0x40]
	ldr r0, _02229D24 @ =0x0222AB84
	asr r2, r1, #8
	lsl r1, r1, #8
	and r2, r2, #0xff
	and r1, r1, #0xff00
	orr r1, r2, r1
	strh r1, [sp, #2]
	ldr r0, [r0, #0x264]
	str r0, [sp, #4]
	bl FUN_020D34B0
	ldr r2, _02229D28 @ =0x0007FD88
	mov r3, #0
	bl FUN_020F2900
	ldr r5, _02229D28 @ =0x0007FD88
	ldr sb, _02229D24 @ =0x0222AB84
	mov r7, r0
	mov r4, #0
	mov sl, #1
	add r6, sp, #0
	mvn r8, #0x19
_02229C54:
	ldr r0, [sb, #0x26c]
	mov r1, r6
	bl FUN_020A2F04
	cmp r0, #0
	bge _02229D14
	cmp r0, r8
	bne _02229CB4
	ldr r0, [sb, #0x244]
	cmp r0, #0
	beq _02229CD8
	bl FUN_020D34B0
	mov r2, r5
	mov r3, r4
	bl FUN_020F2900
	ldr r1, [sb, #0x244]
	subs r0, r0, r7
	cmp r0, r1
	blt _02229CD8
	ldr r0, _02229D24 @ =0x0222AB84
	mov r1, #0xa
	str r1, [r0, #0x250]
	add sp, sp, #8
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_02229CB4:
	mvn r1, #0x1d
	cmp r0, r1
	beq _02229D14
	ldr r0, _02229D24 @ =0x0222AB84
	mov r1, #7
	str r1, [r0, #0x250]
	add sp, sp, #8
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_02229CD8:
	bl ov39_022298FC
	ldr r0, [sb, #0x268]
	cmp r0, #1
	bne _02229D04
	ldr r0, _02229D24 @ =0x0222AB84
	mov r1, #0xd
	str r1, [r0, #0x250]
	bl ov39_02229910
	add sp, sp, #8
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_02229D04:
	bl ov39_02229910
	mov r0, sl
	bl ov39_02229FC0
	b _02229C54
_02229D14:
	mov r0, #1
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02229D20: .4byte 0x0222AD84
_02229D24: .4byte 0x0222AB84
_02229D28: .4byte 0x0007FD88
	arm_func_end ov39_02229BE4

	arm_func_start ov39_02229D2C
ov39_02229D2C: @ 0x02229D2C
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	bl FUN_020D34B0
	ldr r2, _02229E38 @ =0x0007FD88
	mov r3, sb
	bl FUN_020F2900
	ldr r7, _02229E38 @ =0x0007FD88
	ldr r5, _02229E3C @ =0x0222AB84
	mov sl, r0
	mov r8, sb
	mov r6, sb
	mov fp, #1
	mvn r4, #5
_02229D60:
	ldr r0, [r5, #0x254]
	ldr r1, [r5, #0x258]
	sub r2, r0, sb
	cmp r2, r0
	movgt r2, r0
	ldr r0, [r5, #0x26c]
	mov r3, r8
	add r1, r1, sb
	bl FUN_020A3014
	cmp r0, r4
	beq _02229DB8
	cmp r0, #0
	bge _02229DA8
	ldr r0, _02229E3C @ =0x0222AB84
	mov r1, #0xb
	str r1, [r0, #0x250]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02229DA8:
	ldr r1, [r5, #0x254]
	add sb, sb, r0
	cmp sb, r1
	beq _02229E30
_02229DB8:
	ldr r0, [r5, #0x248]
	cmp r0, #0
	beq _02229DF8
	bl FUN_020D34B0
	mov r2, r7
	mov r3, r6
	bl FUN_020F2900
	ldr r1, [r5, #0x248]
	subs r0, r0, sl
	cmp r0, r1
	blt _02229DF8
	ldr r0, _02229E3C @ =0x0222AB84
	mov r1, #0xb
	str r1, [r0, #0x250]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02229DF8:
	bl ov39_022298FC
	ldr r0, [r5, #0x268]
	cmp r0, #1
	bne _02229E20
	ldr r0, _02229E3C @ =0x0222AB84
	mov r1, #0xd
	str r1, [r0, #0x250]
	bl ov39_02229910
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02229E20:
	bl ov39_02229910
	mov r0, fp
	bl ov39_02229FC0
	b _02229D60
_02229E30:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02229E38: .4byte 0x0007FD88
_02229E3C: .4byte 0x0222AB84
	arm_func_end ov39_02229D2C

	arm_func_start ov39_02229E40
ov39_02229E40: @ 0x02229E40
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, #0
	sub r0, sl, #1
	str r0, [sp]
	bl FUN_020D34B0
	ldr r2, _02229FB8 @ =0x0007FD88
	mov r3, sl
	bl FUN_020F2900
	mvn r4, #0
	ldr fp, _02229FB8 @ =0x0007FD88
	ldr r6, _02229FBC @ =0x0222AB84
	mov sb, r0
	sub r5, r4, #5
	add r7, sp, #0
	mov r8, sl
_02229E7C:
	ldr r1, [r6, #0x260]
	ldr r2, [r6, #0x25c]
	ldr r0, [r6, #0x26c]
	mov r3, r8
	add r1, r1, sl
	sub r2, r2, sl
	bl FUN_020A2F60
	cmp r0, r5
	beq _02229F38
	cmp r0, #0
	bgt _02229EBC
	ldr r0, _02229FBC @ =0x0222AB84
	mov r1, #9
	str r1, [r0, #0x250]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02229EBC:
	add sl, sl, r0
	cmp sl, #4
	blo _02229EF8
	ldr r0, [sp]
	cmp r0, r4
	bne _02229EF8
	ldr r2, [r6, #0x260]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	strb r1, [r7]
	strb r0, [r7, #1]
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	strb r1, [r7, #2]
	strb r0, [r7, #3]
_02229EF8:
	ldr r0, [sp]
	cmp sl, r0
	bne _02229F38
	cmp r0, r4
	beq _02229F38
	ldr r0, _02229FBC @ =0x0222AB84
	sub r1, sl, #4
	ldr r2, [r0, #0x260]
	add r0, r2, #4
	add r2, r2, #4
	bl ov39_0222A544
	ldr r1, [sp]
	ldr r0, _02229FBC @ =0x0222AB84
	sub r1, r1, #4
	str r1, [r0, #0x25c]
	b _02229FB0
_02229F38:
	ldr r0, [r6, #0x24c]
	cmp r0, #0
	beq _02229F78
	bl FUN_020D34B0
	mov r2, fp
	mov r3, #0
	bl FUN_020F2900
	ldr r1, [r6, #0x24c]
	subs r0, r0, sb
	cmp r0, r1
	blt _02229F78
	ldr r0, _02229FBC @ =0x0222AB84
	mov r1, #0xc
	str r1, [r0, #0x250]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02229F78:
	bl ov39_022298FC
	ldr r0, [r6, #0x268]
	cmp r0, #1
	bne _02229FA0
	ldr r0, _02229FBC @ =0x0222AB84
	mov r1, #0xd
	str r1, [r0, #0x250]
	bl ov39_02229910
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02229FA0:
	bl ov39_02229910
	mov r0, #1
	bl ov39_02229FC0
	b _02229E7C
_02229FB0:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02229FB8: .4byte 0x0007FD88
_02229FBC: .4byte 0x0222AB84
	arm_func_end ov39_02229E40

	arm_func_start ov39_02229FC0
ov39_02229FC0: @ 0x02229FC0
	ldr ip, _02229FC8 @ =FUN_020D2108
	bx ip
	.align 2, 0
_02229FC8: .4byte FUN_020D2108
	arm_func_end ov39_02229FC0

	arm_func_start ov39_02229FCC
ov39_02229FCC: @ 0x02229FCC
	push {r4, r5, lr}
	sub sp, sp, #0x17c
	ldr r0, _0222A104 @ =0x0222AB84
	ldr r0, [r0, #0x138]
	cmp r0, #1
	addeq sp, sp, #0x17c
	moveq r0, #1
	popeq {r4, r5, pc}
	ldr r0, _0222A108 @ =0x0222AA58
	add r1, sp, #8
	bl FUN_021ECC6C
	cmp r0, #0
	bne _0222A018
	ldr r0, _0222A104 @ =0x0222AB84
	mov r1, #0xe
	str r1, [r0, #0x250]
	add sp, sp, #0x17c
	mov r0, #0
	pop {r4, r5, pc}
_0222A018:
	ldr r4, _0222A104 @ =0x0222AB84
	mov r5, #1
_0222A020:
	bl FUN_021ECCE0
	cmp r0, #3
	bne _0222A074
	ldr r4, _0222A10C @ =0x0222AB8A
	add r3, sp, #0x4d
	mov r2, #0x96
_0222A038:
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	add r3, r3, #2
	strb r1, [r4]
	strb r0, [r4, #1]
	add r4, r4, #2
	subs r2, r2, #1
	bne _0222A038
	ldrb r2, [r3]
	ldr r1, _0222A104 @ =0x0222AB84
	mov r0, #1
	strb r2, [r4]
	str r0, [r1, #0x138]
	add sp, sp, #0x17c
	pop {r4, r5, pc}
_0222A074:
	cmp r0, #4
	bne _0222A0A0
	add r0, sp, #0
	add r1, sp, #4
	bl FUN_021EC11C
	ldr r0, _0222A104 @ =0x0222AB84
	mov r1, #0xe
	str r1, [r0, #0x250]
	add sp, sp, #0x17c
	mov r0, #0
	pop {r4, r5, pc}
_0222A0A0:
	cmp r0, #5
	bne _0222A0C0
	ldr r0, _0222A104 @ =0x0222AB84
	mov r1, #0xe
	str r1, [r0, #0x250]
	add sp, sp, #0x17c
	mov r0, #0
	pop {r4, r5, pc}
_0222A0C0:
	bl ov39_022298FC
	ldr r0, [r4, #0x268]
	cmp r0, #1
	bne _0222A0EC
	ldr r0, _0222A104 @ =0x0222AB84
	mov r1, #0xd
	str r1, [r0, #0x250]
	bl ov39_02229910
	add sp, sp, #0x17c
	mov r0, #0
	pop {r4, r5, pc}
_0222A0EC:
	bl ov39_02229910
	mov r0, r5
	bl ov39_02229FC0
	b _0222A020
	arm_func_end ov39_02229FCC

	arm_func_start ov39_0222A0FC
ov39_0222A0FC: @ 0x0222A0FC
	add sp, sp, #0x17c
	pop {r4, r5, pc}
	.align 2, 0
_0222A104: .4byte 0x0222AB84
_0222A108: .4byte 0x0222AA58
_0222A10C: .4byte 0x0222AB8A
	arm_func_end ov39_0222A0FC

	arm_func_start ov39_0222A110
ov39_0222A110: @ 0x0222A110
	ldr ip, _0222A124 @ =ov39_02229374
	mov r2, r0
	ldr r0, _0222A128 @ =0x0222AA5C
	ldr r1, _0222A12C @ =0x00003070
	bx ip
	.align 2, 0
_0222A124: .4byte ov39_02229374
_0222A128: .4byte 0x0222AA5C
_0222A12C: .4byte 0x00003070
	arm_func_end ov39_0222A110

	arm_func_start ov39_0222A130
ov39_0222A130: @ 0x0222A130
	ldr ip, _0222A138 @ =ov39_02229310
	bx ip
	.align 2, 0
_0222A138: .4byte ov39_02229310
	arm_func_end ov39_0222A130

	arm_func_start ov39_0222A13C
ov39_0222A13C: @ 0x0222A13C
	push {r4, lr}
	bl ov39_022298FC
	bl ov39_0222981C
	mov r4, r0
	bl ov39_02229910
	mov r0, r4
	pop {r4, pc}
	arm_func_end ov39_0222A13C

	arm_func_start ov39_0222A158
ov39_0222A158: @ 0x0222A158
	ldr ip, _0222A160 @ =ov39_02229898
	bx ip
	.align 2, 0
_0222A160: .4byte ov39_02229898
	arm_func_end ov39_0222A158

	arm_func_start ov39_0222A164
ov39_0222A164: @ 0x0222A164
	push {r4, r5, r6, lr}
	sub sp, sp, #0xe0
	mov r6, r0
	add lr, sp, #0
	mov r5, r1
	mov r4, r6
	mov ip, #0xe
_0222A180:
	ldm r4!, {r0, r1, r2, r3}
	stm lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0222A180
	ldr r1, _0222A1B8 @ =0x0222AA78
	mov r0, r6
	bl ov39_0222A8AC
	ldr r0, _0222A1BC @ =0x00004E20
	add r1, sp, #0
	mov r2, r5
	mvn r3, #0
	bl ov39_02229630
	add sp, sp, #0xe0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222A1B8: .4byte 0x0222AA78
_0222A1BC: .4byte 0x00004E20
	arm_func_end ov39_0222A164

	arm_func_start ov39_0222A1C0
ov39_0222A1C0: @ 0x0222A1C0
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	mov lr, #0
	asr ip, r0, #0x1f
	str r0, [sp, #4]
	mov r2, r1
	ldr r0, _0222A1FC @ =0x00004E21
	add r1, sp, #0
	sub r3, lr, #1
	strh lr, [sp]
	strh lr, [sp, #2]
	str ip, [sp, #8]
	bl ov39_02229630
	add sp, sp, #0xc
	ldm sp!, {pc}
	.align 2, 0
_0222A1FC: .4byte 0x00004E21
	arm_func_end ov39_0222A1C0

	arm_func_start ov39_0222A200
ov39_0222A200: @ 0x0222A200
	push {r4, r5, r6, lr}
	sub sp, sp, #0x220
	mov r6, r1
	add lr, sp, #4
	mov r5, r2
	mov r4, r6
	str r0, [sp]
	mov ip, #0x21
_0222A220:
	ldm r4!, {r0, r1, r2, r3}
	stm lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0222A220
	ldm r4, {r0, r1, r2}
	stm lr, {r0, r1, r2}
	ldr r1, _0222A260 @ =0x0222AA78
	mov r0, r6
	bl ov39_0222A8AC
	ldr r0, _0222A264 @ =0x00005208
	add r1, sp, #0
	mov r2, r5
	mvn r3, #0
	bl ov39_02229630
	add sp, sp, #0x220
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222A260: .4byte 0x0222AA78
_0222A264: .4byte 0x00005208
	arm_func_end ov39_0222A200

	arm_func_start ov39_0222A268
ov39_0222A268: @ 0x0222A268
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	mov lr, #0
	asr ip, r0, #0x1f
	str r0, [sp, #4]
	mov r2, r1
	ldr r0, _0222A2A4 @ =0x00005209
	add r1, sp, #0
	sub r3, lr, #1
	strh lr, [sp]
	strh lr, [sp, #2]
	str ip, [sp, #8]
	bl ov39_02229630
	add sp, sp, #0xc
	ldm sp!, {pc}
	.align 2, 0
_0222A2A4: .4byte 0x00005209
	arm_func_end ov39_0222A268

	arm_func_start ov39_0222A2A8
ov39_0222A2A8: @ 0x0222A2A8
	ldr ip, _0222A2B0 @ =ov39_02229864
	bx ip
	.align 2, 0
_0222A2B0: .4byte ov39_02229864
	arm_func_end ov39_0222A2A8

	arm_func_start ov39_0222A2B4
ov39_0222A2B4: @ 0x0222A2B4
	ldr ip, _0222A2BC @ =ov39_0222982C
	bx ip
	.align 2, 0
_0222A2BC: .4byte ov39_0222982C
	arm_func_end ov39_0222A2B4

	arm_func_start ov39_0222A2C0
ov39_0222A2C0: @ 0x0222A2C0
	ldr ip, _0222A2C8 @ =ov39_0222A6DC
	bx ip
	.align 2, 0
_0222A2C8: .4byte ov39_0222A6DC
	arm_func_end ov39_0222A2C0

	arm_func_start ov39_0222A2CC
ov39_0222A2CC: @ 0x0222A2CC
	ldr ip, _0222A2E4 @ =ov39_02229630
	mov r1, #0
	mov r2, r0
	ldr r0, _0222A2E8 @ =0x000055F0
	sub r3, r1, #1
	bx ip
	.align 2, 0
_0222A2E4: .4byte ov39_02229630
_0222A2E8: .4byte 0x000055F0
	arm_func_end ov39_0222A2CC

	arm_func_start ov39_0222A2EC
ov39_0222A2EC: @ 0x0222A2EC
	push {r4, r5, lr}
	sub sp, sp, #0x24
	mov r5, r0
	mov r4, r1
	add lr, sp, #0
	ldm r5!, {r0, r1, r2, r3}
	mov ip, lr
	stm lr!, {r0, r1, r2, r3}
	ldm r5!, {r0, r1, r2, r3}
	stm lr!, {r0, r1, r2, r3}
	ldr r0, [r5]
	mov r1, ip
	str r0, [lr]
	ldr r0, _0222A338 @ =0x000055F1
	mov r2, r4
	mvn r3, #0
	bl ov39_02229630
	add sp, sp, #0x24
	pop {r4, r5, pc}
	.align 2, 0
_0222A338: .4byte 0x000055F1
	arm_func_end ov39_0222A2EC

	arm_func_start ov39_0222A33C
ov39_0222A33C: @ 0x0222A33C
	push {r4, r5, lr}
	sub sp, sp, #0x14c
	sub sp, sp, #0x1c00
	add lr, sp, #0
	mov r5, r0
	mov r4, r1
	mov ip, #0x1d4
_0222A358:
	ldm r5!, {r0, r1, r2, r3}
	stm lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0222A358
	ldm r5, {r0, r1, r2}
	stm lr, {r0, r1, r2}
	ldr r0, _0222A390 @ =0x000059D8
	add r1, sp, #0
	mov r2, r4
	mvn r3, #0
	bl ov39_02229630
	add sp, sp, #0x14c
	add sp, sp, #0x1c00
	pop {r4, r5, pc}
	.align 2, 0
_0222A390: .4byte 0x000059D8
	arm_func_end ov39_0222A33C

	arm_func_start ov39_0222A394
ov39_0222A394: @ 0x0222A394
	push {r3, r4, lr}
	sub sp, sp, #0x1c
	mov lr, #0
	add ip, sp, #4
	strh lr, [sp]
	mov r4, r1
	ldm r0, {r0, r1, r2, r3}
	stm ip, {r0, r1, r2, r3}
	ldr r0, _0222A3D8 @ =0x000059D9
	add r1, sp, #0
	mov r2, r4
	sub r3, lr, #1
	strh lr, [sp]
	strh lr, [sp, #2]
	bl ov39_02229630
	add sp, sp, #0x1c
	pop {r3, r4, pc}
	.align 2, 0
_0222A3D8: .4byte 0x000059D9
	arm_func_end ov39_0222A394

	arm_func_start ov39_0222A3DC
ov39_0222A3DC: @ 0x0222A3DC
	stmdb sp!, {lr}
	sub sp, sp, #0x1c
	mov r2, r1
	add r1, sp, #0
	mov ip, #0
	mov r3, #1
	str ip, [r1]
	strh r3, [sp]
	str ip, [r1, #4]
	str ip, [r1, #8]
	str ip, [r1, #0xc]
	str ip, [r1, #0x10]
	str ip, [r1, #0x14]
	str ip, [r1, #0x18]
	ldr ip, [r0]
	ldr r0, _0222A430 @ =0x000059D9
	sub r3, r3, #2
	str ip, [sp, #0xc]
	bl ov39_02229630
	add sp, sp, #0x1c
	ldm sp!, {pc}
	.align 2, 0
_0222A430: .4byte 0x000059D9
	arm_func_end ov39_0222A3DC

	arm_func_start ov39_0222A434
ov39_0222A434: @ 0x0222A434
	stmdb sp!, {lr}
	sub sp, sp, #0x1c
	mov r2, r1
	add r1, sp, #0
	mov ip, #0
	mov r3, #2
	str ip, [r1]
	strh r3, [sp]
	str ip, [r1, #4]
	str ip, [r1, #8]
	str ip, [r1, #0xc]
	str ip, [r1, #0x10]
	str ip, [r1, #0x14]
	str ip, [r1, #0x18]
	ldr ip, [r0]
	ldr r0, _0222A488 @ =0x000059D9
	sub r3, r3, #3
	str ip, [sp, #0xc]
	bl ov39_02229630
	add sp, sp, #0x1c
	ldm sp!, {pc}
	.align 2, 0
_0222A488: .4byte 0x000059D9
	arm_func_end ov39_0222A434

	arm_func_start ov39_0222A48C
ov39_0222A48C: @ 0x0222A48C
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r2, r3
	ldr r0, _0222A4BC @ =0x000059DA
	add r1, sp, #0
	mvn r3, #0
	bl ov39_02229630
	add sp, sp, #0xc
	ldm sp!, {pc}
	.align 2, 0
_0222A4BC: .4byte 0x000059DA
	arm_func_end ov39_0222A48C

	arm_func_start ov39_0222A4C0
ov39_0222A4C0: @ 0x0222A4C0
	push {r3, lr}
	sub sp, sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0222A4E8 @ =0x000059DB
	add r1, sp, #0
	mvn r3, #0
	bl ov39_02229630
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_0222A4E8: .4byte 0x000059DB
	arm_func_end ov39_0222A4C0

	arm_func_start ov39_0222A4EC
ov39_0222A4EC: @ 0x0222A4EC
	push {r3, r4, r5, lr}
	mov r5, #0
	cmp r1, #0
	pople {r3, r4, r5, pc}
	ldr lr, _0222A540 @ =0x0222AA7C
	mov ip, r5
_0222A504:
	cmp r5, #0
	moveq r4, ip
	beq _0222A524
	ldrb r4, [r0]
	add r3, r5, r1
	add r3, r4, r3
	and r3, r3, #0xff
	ldrb r4, [lr, r3]
_0222A524:
	ldrb r3, [r0, r5]
	add r5, r5, #1
	cmp r5, r1
	eor r3, r4, r3
	strb r3, [r2], #1
	blt _0222A504
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222A540: .4byte 0x0222AA7C
	arm_func_end ov39_0222A4EC

	arm_func_start ov39_0222A544
ov39_0222A544: @ 0x0222A544
	push {r3, r4, r5, lr}
	mov r5, #0
	cmp r1, #0
	pople {r3, r4, r5, pc}
	ldr lr, _0222A598 @ =0x0222AA7C
	mov ip, r5
_0222A55C:
	cmp r5, #0
	moveq r4, ip
	beq _0222A57C
	ldrb r4, [r0]
	add r3, r5, r1
	add r3, r4, r3
	and r3, r3, #0xff
	ldrb r4, [lr, r3]
_0222A57C:
	ldrb r3, [r2, r5]
	eor r3, r3, r4
	strb r3, [r2, r5]
	add r5, r5, #1
	cmp r5, r1
	blt _0222A55C
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222A598: .4byte 0x0222AA7C
	arm_func_end ov39_0222A544

	arm_func_start ov39_0222A59C
ov39_0222A59C: @ 0x0222A59C
	ldr r2, _0222A6C8 @ =0x00005209
	cmp r0, r2
	bgt _0222A5F4
	bge _0222A680
	sub r1, r2, #0x3e8
	cmp r0, r1
	bgt _0222A5E4
	ldr r1, _0222A6CC @ =0x00004E20
	cmp r0, r1
	blt _0222A5D8
	beq _0222A668
	add r1, r1, #1
	cmp r0, r1
	beq _0222A670
	b _0222A6B8
_0222A5D8:
	cmp r0, #0
	beq _0222A660
	b _0222A6B8
_0222A5E4:
	sub r1, r2, #1
	cmp r0, r1
	beq _0222A678
	b _0222A6B8
_0222A5F4:
	add r1, r2, #0x3e8
	cmp r0, r1
	bgt _0222A614
	bge _0222A690
	ldr r1, _0222A6D0 @ =0x000055F0
	cmp r0, r1
	beq _0222A688
	b _0222A6B8
_0222A614:
	ldr r2, _0222A6D4 @ =0x000059D8
	cmp r0, r2
	bgt _0222A628
	beq _0222A698
	b _0222A6B8
_0222A628:
	add r1, r2, #3
	cmp r0, r1
	bgt _0222A6B8
	add r1, r2, #1
	cmp r0, r1
	blt _0222A6B8
	beq _0222A6A0
	add r1, r2, #2
	cmp r0, r1
	beq _0222A6A8
	add r1, r2, #3
	cmp r0, r1
	beq _0222A6B0
	b _0222A6B8
_0222A660:
	mov r0, #0x400
	b _0222A6C0
_0222A668:
	mov r0, #0xe0
	b _0222A6C0
_0222A670:
	mov r0, #0xc
	b _0222A6C0
_0222A678:
	mov r0, #0x220
	b _0222A6C0
_0222A680:
	mov r0, #0xc
	b _0222A6C0
_0222A688:
	mov r0, #0
	b _0222A6C0
_0222A690:
	mov r0, #0x24
	b _0222A6C0
_0222A698:
	ldr r0, _0222A6D8 @ =0x00001D4C
	b _0222A6C0
_0222A6A0:
	mov r0, #0x1c
	b _0222A6C0
_0222A6A8:
	mov r0, #0xc
	b _0222A6C0
_0222A6B0:
	mov r0, #8
	b _0222A6C0
_0222A6B8:
	mvn r0, #0
	bx lr
_0222A6C0:
	add r0, r0, #0x140
	bx lr
	.align 2, 0
_0222A6C8: .4byte 0x00005209
_0222A6CC: .4byte 0x00004E20
_0222A6D0: .4byte 0x000055F0
_0222A6D4: .4byte 0x000059D8
_0222A6D8: .4byte 0x00001D4C
	arm_func_end ov39_0222A59C

	arm_func_start ov39_0222A6DC
ov39_0222A6DC: @ 0x0222A6DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	ldr r6, _0222A88C @ =0x0222A9AC
	add lr, sp, #0
	mov ip, r0
	mov r5, lr
	ldm r6!, {r0, r1, r2, r3}
	stm lr!, {r0, r1, r2, r3}
	ldm r6!, {r0, r1, r2, r3}
	stm lr!, {r0, r1, r2, r3}
	ldr r4, _0222A890 @ =0x00005209
	ldm r6, {r0, r1, r2, r3}
	stm lr, {r0, r1, r2, r3}
	cmp ip, r4
	bgt _0222A774
	bge _0222A83C
	ldr r1, _0222A894 @ =0x00004E20
	cmp ip, r1
	bgt _0222A750
	bge _0222A824
	cmp ip, #0
	bgt _0222A874
	mvn r6, #0
	cmp ip, r6
	blt _0222A874
	beq _0222A7E0
	cmp ip, #0
	beq _0222A81C
	b _0222A874
_0222A750:
	add r0, r1, #1
	cmp ip, r0
	bgt _0222A764
	beq _0222A82C
	b _0222A874
_0222A764:
	add r0, r1, #0x3e8
	cmp ip, r0
	beq _0222A834
	b _0222A874
_0222A774:
	add r0, r4, #0x3e8
	cmp ip, r0
	bgt _0222A794
	bge _0222A84C
	ldr r0, _0222A898 @ =0x000055F0
	cmp ip, r0
	beq _0222A844
	b _0222A874
_0222A794:
	ldr r1, _0222A89C @ =0x000059D8
	cmp ip, r1
	bgt _0222A7A8
	beq _0222A854
	b _0222A874
_0222A7A8:
	add r0, r1, #3
	cmp ip, r0
	bgt _0222A874
	add r0, r1, #1
	cmp ip, r0
	blt _0222A874
	beq _0222A85C
	add r0, r1, #2
	cmp ip, r0
	beq _0222A864
	add r0, r1, #3
	cmp ip, r0
	beq _0222A86C
	b _0222A874
_0222A7E0:
	mov r7, #0
	mov r4, r6
_0222A7E8:
	ldr r0, [r5, r7, lsl #2]
	cmp r0, r4
	beq _0222A808
	bl ov39_0222A6DC
	cmp r0, r6
	movgt r6, r0
	add r7, r7, #1
	b _0222A7E8
_0222A808:
	mvn r0, #0
	cmp r6, r0
	bne _0222A880
	add sp, sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
_0222A81C:
	mov r6, #0x400
	b _0222A880
_0222A824:
	mov r6, #8
	b _0222A880
_0222A82C:
	ldr r6, _0222A8A0 @ =0x0000093C
	b _0222A880
_0222A834:
	mov r6, #8
	b _0222A880
_0222A83C:
	ldr r6, _0222A8A4 @ =0x00002B74
	b _0222A880
_0222A844:
	mov r6, #4
	b _0222A880
_0222A84C:
	mov r6, #0x630
	b _0222A880
_0222A854:
	mov r6, #8
	b _0222A880
_0222A85C:
	ldr r6, _0222A8A8 @ =0x00001C24
	b _0222A880
_0222A864:
	sub r6, r1, #0x3c80
	b _0222A880
_0222A86C:
	mov r6, #0
	b _0222A880
_0222A874:
	add sp, sp, #0x30
	mvn r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222A880:
	add r0, r6, #8
	add sp, sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222A88C: .4byte 0x0222A9AC
_0222A890: .4byte 0x00005209
_0222A894: .4byte 0x00004E20
_0222A898: .4byte 0x000055F0
_0222A89C: .4byte 0x000059D8
_0222A8A0: .4byte 0x0000093C
_0222A8A4: .4byte 0x00002B74
_0222A8A8: .4byte 0x00001C24
	arm_func_end ov39_0222A6DC

	arm_func_start ov39_0222A8AC
ov39_0222A8AC: @ 0x0222A8AC
	bx lr
	arm_func_end ov39_0222A8AC

	.rodata

_0222A8B0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xA8, 0x22, 0x02, 0xB0, 0xA8, 0x22, 0x02
	.byte 0x49, 0x73, 0x22, 0x02, 0x35, 0x73, 0x22, 0x02, 0x65, 0x73, 0x22, 0x02, 0x8D, 0x73, 0x22, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1B, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x4E, 0x00, 0x00, 0x21, 0x4E, 0x00, 0x00, 0x08, 0x52, 0x00, 0x00, 0x09, 0x52, 0x00, 0x00
	.byte 0xF0, 0x55, 0x00, 0x00, 0xF1, 0x55, 0x00, 0x00, 0xD8, 0x59, 0x00, 0x00, 0xD9, 0x59, 0x00, 0x00
	.byte 0xDA, 0x59, 0x00, 0x00, 0xDB, 0x59, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

	.data

_0222AA20:
	.byte 0xAD, 0x8B, 0x22, 0x02, 0x79, 0x8C, 0x22, 0x02, 0x0D, 0x8D, 0x22, 0x02, 0x91, 0x8D, 0x22, 0x02
	.byte 0xA1, 0x8D, 0x22, 0x02, 0x55, 0x8E, 0x22, 0x02, 0xA5, 0x8E, 0x22, 0x02, 0xC9, 0x8E, 0x22, 0x02
	.byte 0x19, 0x8F, 0x22, 0x02, 0x19, 0x8F, 0x22, 0x02, 0x55, 0x8F, 0x22, 0x02, 0xC9, 0x8F, 0x22, 0x02
	.byte 0x8D, 0x90, 0x22, 0x02, 0xA5, 0x90, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x70, 0x6B, 0x67, 0x64
	.byte 0x73, 0x70, 0x72, 0x6F, 0x64, 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x2E, 0x63
	.byte 0x6F, 0x2E, 0x6A, 0x70, 0x00, 0x00, 0x00, 0x00, 0x2D, 0x2D, 0x00, 0x00, 0x93, 0x18, 0x33, 0x28
	.byte 0x0B, 0x07, 0x03, 0x82, 0x02, 0x43, 0x8A, 0x86, 0xDB, 0x38, 0x34, 0x19, 0xD6, 0xF9, 0x59, 0xB2
	.byte 0xAD, 0x6A, 0x7D, 0xBC, 0xEE, 0xE0, 0x3A, 0x3F, 0xCA, 0x4C, 0x25, 0x68, 0xF4, 0xA9, 0x5B, 0xF7
	.byte 0x22, 0x60, 0x5A, 0x6F, 0xFA, 0x1B, 0x79, 0xE9, 0x17, 0xB1, 0x00, 0x9C, 0xAA, 0x5E, 0x9D, 0xFF
	.byte 0xEA, 0xA0, 0x0D, 0x4B, 0x75, 0xF6, 0x61, 0x85, 0x5D, 0xBB, 0xDC, 0xFB, 0x64, 0x2E, 0x7A, 0xAB
	.byte 0xF1, 0xE8, 0x44, 0x0C, 0xB8, 0x8F, 0xA8, 0x0A, 0x8E, 0xBD, 0xE1, 0x3B, 0xFC, 0x3C, 0x9F, 0x1A
	.byte 0x56, 0xC5, 0xE2, 0xF5, 0x47, 0xD9, 0xD7, 0x8C, 0xCD, 0x97, 0xF0, 0x7B, 0x8B, 0xC3, 0x4F, 0x45
	.byte 0x04, 0x90, 0x81, 0x1E, 0x6B, 0xC9, 0xD3, 0x73, 0xC6, 0xE7, 0x24, 0xBA, 0x32, 0xF3, 0xC0, 0xEC
	.byte 0x57, 0xCC, 0xC4, 0xB6, 0xC1, 0xAE, 0xAF, 0x88, 0xF2, 0x84, 0xCE, 0x4A, 0x0F, 0x94, 0x41, 0xB4
	.byte 0x74, 0x2A, 0xD1, 0x70, 0x1C, 0xD4, 0xB0, 0xC2, 0x09, 0x08, 0x16, 0x9B, 0xB5, 0x8D, 0x2B, 0xD2
	.byte 0x89, 0xB7, 0x99, 0xA1, 0x30, 0x65, 0x54, 0x40, 0x96, 0x71, 0xFE, 0xBF, 0x31, 0x06, 0xE5, 0x14
	.byte 0xE6, 0xDA, 0x48, 0x26, 0xAC, 0x87, 0x9A, 0xD8, 0xA6, 0xEB, 0x92, 0xCF, 0xFD, 0x77, 0x1D, 0x21
	.byte 0x9E, 0x36, 0x35, 0x53, 0x3E, 0xD0, 0xD5, 0x62, 0x58, 0x5F, 0x63, 0x7C, 0x7E, 0x52, 0x29, 0x12
	.byte 0x2C, 0x78, 0x05, 0x91, 0x55, 0xE3, 0xA2, 0xB9, 0xF8, 0x50, 0x95, 0x13, 0x80, 0x7F, 0x11, 0x27
	.byte 0xCB, 0x37, 0x4E, 0x51, 0x15, 0xEF, 0xA7, 0x72, 0x4D, 0x83, 0x49, 0xA4, 0x69, 0xDE, 0x20, 0xA3
	.byte 0x67, 0xDF, 0x10, 0x42, 0x39, 0x6C, 0x2D, 0xC7, 0x23, 0xE4, 0xDD, 0xED, 0xBE, 0x66, 0xB3, 0x2F
	.byte 0x01, 0x6E, 0x6D, 0xC8, 0x1F, 0x98, 0xA5, 0x46, 0x76, 0x5C, 0x3D, 0x0E, 0x00, 0x00, 0x00, 0x00

	.bss

_0222AB80:
	.size 0xb60
