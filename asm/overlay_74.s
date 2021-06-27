
	thumb_func_start ov74_02227060
ov74_02227060: @ 0x02227060
	push {r4, lr}
	ldr r1, _02227090 @ =0x021D110C
	adds r4, r0, #0
	ldr r2, [r1, #0x48]
	ldr r0, _02227094 @ =0x00000CF3
	tst r0, r2
	beq _0222707A
	movs r0, #0x6b
	movs r2, #0
	lsls r0, r0, #2
	str r2, [r4, r0]
	ldr r0, [r1, #0x48]
	pop {r4, pc}
_0222707A:
	bl FUN_02025358
	cmp r0, #0
	beq _0222708C
	movs r1, #0x6b
	movs r0, #1
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
_0222708C:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_02227090: .4byte 0x021D110C
_02227094: .4byte 0x00000CF3
	thumb_func_end ov74_02227060

	thumb_func_start ov74_02227098
ov74_02227098: @ 0x02227098
	push {r3, r4}
	movs r3, #0
	adds r4, r3, #0
_0222709E:
	adds r2, r0, #0
	adds r2, #0xec
	ldr r2, [r2]
	cmp r2, #0
	beq _022270B6
	adds r2, r4, #0
	adds r4, r4, #1
	cmp r2, r1
	bne _022270B6
	adds r0, r3, #0
	pop {r3, r4}
	bx lr
_022270B6:
	adds r3, r3, #1
	adds r0, r0, #4
	cmp r3, #9
	blo _0222709E
	movs r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov74_02227098

	thumb_func_start ov74_022270C4
ov74_022270C4: @ 0x022270C4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	ldr r0, _02227158 @ =0x000005DC
	bne _02227106
	bl FUN_0200604C
	adds r0, r5, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0xec
	ldr r0, [r0]
	str r0, [r5, #0x58]
	cmp r0, #6
	bne _02227114
	blx FUN_020E10E8
	cmp r0, #1
	bne _02227114
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0xc
	beq _022270FE
	bl FUN_02038D64
_022270FE:
	movs r0, #0x4f
	bl FUN_020927D0
	b _02227114
_02227106:
	bl FUN_0200604C
	movs r0, #0
	str r0, [r5, #0x58]
	movs r0, #1
	bl ov74_02235390
_02227114:
	ldr r0, [r5, #0x58]
	cmp r0, #2
	bne _0222712E
	ldr r1, [r5, #0x40]
	movs r0, #0x80
	orrs r1, r0
	str r1, [r5, #0x40]
	movs r1, #1
	adds r0, #0xc8
	str r1, [r5, r0]
	movs r0, #6
	str r0, [r4]
	b _02227144
_0222712E:
	cmp r0, #7
	bne _02227138
	movs r0, #1
	bl ov74_02235390
_02227138:
	movs r0, #0
	movs r1, #7
	adds r2, r4, #0
	movs r3, #8
	bl ov74_0223539C
_02227144:
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0xd
	bne _02227152
	movs r1, #0xe
	str r1, [r5, r0]
_02227152:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_02227158: .4byte 0x000005DC
	thumb_func_end ov74_022270C4

	thumb_func_start ov74_0222715C
ov74_0222715C: @ 0x0222715C
	push {r3, r4}
	movs r4, #0
	adds r3, r4, #0
	cmp r1, #0
	ble _0222717A
_02227166:
	adds r2, r0, #0
	adds r2, #0xec
	ldr r2, [r2]
	cmp r2, #0
	beq _02227172
	adds r4, r4, #1
_02227172:
	adds r3, r3, #1
	adds r0, r0, #4
	cmp r3, r1
	blt _02227166
_0222717A:
	adds r0, r4, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov74_0222715C

	thumb_func_start ov74_02227180
ov74_02227180: @ 0x02227180
	push {r3, r4, r5, r6, r7, lr}
	adds r3, r1, #0
	ldr r1, _02227238 @ =0x021D110C
	adds r5, r0, #0
	ldr r2, [r1, #0x48]
	ldr r1, _0222723C @ =0x00000CF3
	movs r4, #0
	tst r1, r2
	beq _022271AA
	movs r7, #0x6b
	lsls r7, r7, #2
	ldr r1, [r5, r7]
	cmp r1, #1
	bne _022271AA
	str r4, [r5, r7]
	adds r5, #0x54
	ldrh r1, [r5]
	bl ov74_0222841C
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_022271AA:
	movs r0, #1
	tst r0, r2
	beq _022271BC
	adds r0, r5, #0
	adds r1, r3, #0
	movs r2, #0
	bl ov74_022270C4
	pop {r3, r4, r5, r6, r7, pc}
_022271BC:
	movs r0, #2
	tst r0, r2
	beq _022271CE
	adds r0, r5, #0
	adds r1, r3, #0
	movs r2, #1
	bl ov74_022270C4
	pop {r3, r4, r5, r6, r7, pc}
_022271CE:
	ldr r0, [r5, #0x48]
	cmp r0, #0
	beq _022271D8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022271D8:
	adds r0, r5, #0
	adds r0, #0x54
	ldrh r7, [r0]
	movs r1, #0x40
	adds r0, r2, #0
	tst r0, r1
	beq _02227210
	adds r0, r5, #0
	subs r1, #0x41
	bl ov74_02228698
	cmp r0, #0
	beq _02227226
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov74_0222715C
	adds r6, r0, #0
	cmp r6, #7
	bne _02227206
	movs r6, #3
	movs r4, #1
	b _02227226
_02227206:
	cmp r6, #3
	bne _02227226
	movs r6, #0
	movs r4, #1
	b _02227226
_02227210:
	movs r0, #0x80
	tst r0, r2
	beq _02227226
	adds r0, r5, #0
	movs r1, #1
	bl ov74_02228698
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x54
	ldrh r6, [r0]
_02227226:
	cmp r4, #0
	beq _02227232
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov74_022286F8
_02227232:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02227238: .4byte 0x021D110C
_0222723C: .4byte 0x00000CF3
	thumb_func_end ov74_02227180

	thumb_func_start ov74_02227240
ov74_02227240: @ 0x02227240
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r6, #0
	adds r5, r0, #0
	str r1, [sp, #4]
	adds r4, r2, #0
	mvns r6, r6
	movs r7, #0
	bl FUN_02025358
	cmp r0, #0
	bne _0222725E
	add sp, #0xc
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_0222725E:
	ldr r0, [r5, #0x48]
	cmp r0, #0
	bne _02227276
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _02227276
	ldr r0, _0222741C @ =_0223B2C0
	bl FUN_02025224
	adds r6, r0, #0
_02227276:
	cmp r6, #0
	bne _022272DA
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_020249A8
	lsrs r0, r0, #1
	beq _022272DA
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02024964
	adds r0, r5, #0
	adds r0, #0x54
	ldrh r0, [r0]
	cmp r0, #3
	bls _022272C6
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	movs r0, #3
	lsls r0, r0, #0x12
	cmp r1, r0
	ble _022272C6
	adds r0, r5, #0
	movs r1, #3
	bl ov74_02227098
	adds r1, r5, #0
	adds r1, #0x54
	strh r0, [r1]
	b _022272D4
_022272C6:
	adds r0, r5, #0
	movs r1, #0
	bl ov74_02227098
	adds r1, r5, #0
	adds r1, #0x54
	strh r0, [r1]
_022272D4:
	movs r7, #1
	str r7, [r4]
	b _02227328
_022272DA:
	cmp r6, #1
	bne _02227328
	movs r0, #0x69
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020249A8
	lsrs r0, r0, #1
	beq _02227328
	movs r0, #0x69
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x69
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02024964
	adds r0, r5, #0
	adds r0, #0x54
	ldrh r0, [r0]
	cmp r0, #3
	bhs _02227316
	adds r0, r5, #0
	movs r1, #3
	bl ov74_02227098
	b _0222731E
_02227316:
	adds r0, r5, #0
	movs r1, #7
	bl ov74_02227098
_0222731E:
	adds r1, r5, #0
	adds r1, #0x54
	strh r0, [r1]
	movs r7, #1
	str r7, [r4]
_02227328:
	cmp r7, #0
	beq _0222735A
	movs r0, #0x6b
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r1, r5, #0
	adds r1, #0x54
	ldrh r1, [r1]
	adds r0, r5, #0
	bl ov74_0222841C
	adds r1, r5, #0
	adds r1, #0x54
	ldrh r1, [r1]
	adds r0, r5, #0
	bl ov74_022286F8
	movs r0, #0x6d
	movs r1, #6
	lsls r0, r0, #2
	str r1, [r5, r0]
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0222735A:
	ldr r1, _02227420 @ =0x0000FFFE
	add r0, sp, #8
	strh r1, [r0]
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	ldr r2, _02227424 @ =0x021D114C
	asrs r6, r1, #0xb
	lsrs r6, r6, #0x14
	adds r6, r1, r6
	ldrh r3, [r2, #0x22]
	asrs r1, r6, #0xc
	adds r0, #0xc8
	adds r1, r3, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	cmp r3, r0
	blo _02227384
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_02227384:
	add r0, sp, #8
	str r0, [sp]
	ldrh r2, [r2, #0x20]
	ldr r0, [r5]
	movs r1, #0
	bl FUN_0201F2CC
	cmp r0, #0
	bne _0222739C
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0222739C:
	movs r0, #1
	str r0, [r4]
	ldr r0, _02227424 @ =0x021D114C
	movs r1, #0x30
	ldrh r0, [r0, #0x22]
	blx FUN_020F2998
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r2, [r5, r0]
	cmp r2, #0
	bne _022273C4
	cmp r1, #0
	beq _022273DA
	subs r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _022273DA
_022273C4:
	movs r0, #3
	lsls r0, r0, #0x12
	cmp r2, r0
	bne _022273D4
	adds r0, r1, #3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _022273DA
_022273D4:
	adds r0, r1, #7
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_022273DA:
	movs r0, #0x1b
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r1, r0
	blt _022273EA
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_022273EA:
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov74_02227098
	adds r1, r5, #0
	adds r1, #0x54
	strh r0, [r1]
	movs r0, #0x6b
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r1, r5, #0
	adds r1, #0x54
	ldrh r1, [r1]
	adds r0, r5, #0
	bl ov74_0222841C
	ldr r1, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl ov74_022270C4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222741C: .4byte _0223B2C0
_02227420: .4byte 0x0000FFFE
_02227424: .4byte 0x021D114C
	thumb_func_end ov74_02227240

	thumb_func_start ov74_02227428
ov74_02227428: @ 0x02227428
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	movs r2, #0
	str r2, [sp]
	add r2, sp, #0
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov74_02227240
	adds r6, r0, #0
	ldr r0, [sp]
	cmp r0, #0
	beq _02227460
	movs r0, #0x6b
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, #8
	ldr r0, [r5, r0]
	cmp r0, #6
	beq _0222745A
	adds r0, r5, #0
	movs r1, #0xff
	bl ov74_0222841C
_0222745A:
	add sp, #4
	adds r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_02227460:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov74_02227180
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov74_02227428

	thumb_func_start ov74_0222746C
ov74_0222746C: @ 0x0222746C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02025358
	cmp r0, #0
	bne _02227482
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_02227482:
	ldr r0, _022274C8 @ =0x0223B2CC
	bl FUN_02025224
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	bne _02227498
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_02227498:
	ldr r1, _022274CC @ =0x0000FFFE
	add r0, sp, #4
	strh r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r3, _022274D0 @ =0x021D114C
	ldr r0, [r5]
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	movs r1, #1
	bl FUN_0201F2CC
	cmp r0, #0
	bne _022274BA
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_022274BA:
	movs r0, #1
	str r0, [r4]
	cmp r6, #0
	beq _022274C4
	movs r0, #2
_022274C4:
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_022274C8: .4byte 0x0223B2CC
_022274CC: .4byte 0x0000FFFE
_022274D0: .4byte 0x021D114C
	thumb_func_end ov74_0222746C

	thumb_func_start ov74_022274D4
ov74_022274D4: @ 0x022274D4
	push {r3, r4, r5, lr}
	movs r1, #0
	str r1, [sp]
	add r1, sp, #0
	adds r4, r0, #0
	bl ov74_0222746C
	adds r5, r0, #0
	ldr r0, [sp]
	cmp r0, #0
	beq _022274FE
	movs r0, #0x6b
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0xff
	bl ov74_02228548
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
_022274FE:
	ldr r0, _02227574 @ =0x021D110C
	ldr r1, [r0, #0x48]
	cmp r1, #0
	bne _0222750A
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222750A:
	ldr r0, _02227578 @ =0x00000CF3
	tst r0, r1
	beq _0222752C
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	cmp r2, #1
	bne _0222752C
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r4, #0
	adds r4, #0x56
	ldrh r1, [r4]
	bl ov74_02228548
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222752C:
	movs r0, #0xc0
	tst r0, r1
	beq _02227556
	adds r0, r4, #0
	adds r0, #0x56
	ldrh r1, [r0]
	movs r0, #1
	eors r1, r0
	adds r0, r4, #0
	adds r0, #0x56
	strh r1, [r0]
	adds r0, r4, #0
	adds r4, #0x56
	ldrh r1, [r4]
	bl ov74_02228548
	ldr r0, _0222757C @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0
	pop {r3, r4, r5, pc}
_02227556:
	movs r0, #1
	adds r2, r1, #0
	tst r2, r0
	beq _0222756A
	adds r4, #0x56
	ldrh r1, [r4]
	cmp r1, #0
	beq _02227572
	movs r0, #2
	pop {r3, r4, r5, pc}
_0222756A:
	movs r0, #2
	tst r1, r0
	bne _02227572
	movs r0, #0
_02227572:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02227574: .4byte 0x021D110C
_02227578: .4byte 0x00000CF3
_0222757C: .4byte 0x000005DC
	thumb_func_end ov74_022274D4

	thumb_func_start ov74_02227580
ov74_02227580: @ 0x02227580
	movs r0, #0
	bx lr
	thumb_func_end ov74_02227580

	thumb_func_start ov74_02227584
ov74_02227584: @ 0x02227584
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	adds r5, r0, #0
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D3F0
	cmp r0, #0
	bne _022275FC
	movs r1, #0x63
	movs r0, #0
	adds r3, r5, #0
	lsls r1, r1, #2
_022275A0:
	ldr r2, [r3, r1]
	cmp r2, #1
	bne _022275F2
	lsls r1, r0, #2
	adds r3, r5, r1
	movs r1, #0x63
	adds r6, r0, #0
	movs r2, #0
	lsls r1, r1, #2
	str r2, [r3, r1]
	ldr r0, _02227630 @ =0x000003F7
	movs r3, #0x1c
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r1, r1, #4
	ldr r7, _02227634 @ =0x0223BBD4
	muls r6, r3, r6
	adds r4, r7, r6
	ldr r3, [r4, #0x10]
	add r0, sp, #8
	adds r1, r5, r1
	bl ov74_02235414
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	add r0, sp, #8
	movs r3, #1
	bl ov74_02235464
	ldr r0, [r4, #0x14]
	add r1, sp, #8
	str r0, [sp]
	ldr r0, [r5]
	ldr r2, [r7, r6]
	ldr r3, [r4, #4]
	bl ov74_02235568
	add sp, #0x5c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_022275F2:
	adds r0, r0, #1
	adds r3, r3, #4
	cmp r0, #1
	blt _022275A0
	b _0222762A
_022275FC:
	adds r0, r5, #0
	bl ov74_02227060
	movs r1, #3
	tst r0, r1
	beq _02227624
	ldr r0, _02227638 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
_02227624:
	add sp, #0x5c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0222762A:
	movs r0, #0
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02227630: .4byte 0x000003F7
_02227634: .4byte 0x0223BBD4
_02227638: .4byte 0x000005DC
	thumb_func_end ov74_02227584

	thumb_func_start ov74_0222763C
ov74_0222763C: @ 0x0222763C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl ov74_02233938
	movs r4, #0
	str r4, [r5, #0x24]
	cmp r0, #0
	bne _022276A6
	bl ov74_022339BC
	cmp r0, #4
	bhi _0222767E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02227662: @ jump table
	.2byte _0222766C - _02227662 - 2 @ case 0
	.2byte _02227670 - _02227662 - 2 @ case 1
	.2byte _02227674 - _02227662 - 2 @ case 2
	.2byte _02227678 - _02227662 - 2 @ case 3
	.2byte _0222767C - _02227662 - 2 @ case 4
_0222766C:
	movs r4, #2
	b _0222767E
_02227670:
	movs r4, #1
	b _0222767E
_02227674:
	movs r4, #5
	b _0222767E
_02227678:
	movs r4, #4
	b _0222767E
_0222767C:
	movs r4, #3
_0222767E:
	adds r0, r4, #0
	bl FUN_0201A4B0
	ldr r0, [r5, #8]
	bl FUN_0202A55C
	cmp r0, #0
	beq _022276A6
	bl ov74_022339C8
	ldr r1, _022276A8 @ =0x020F5670
	ldrb r1, [r1]
	cmp r1, r0
	bne _022276A6
	bl ov74_022339BC
	adds r0, r0, #1
	str r0, [r5, #0x24]
	bl ov74_02236074
_022276A6:
	pop {r3, r4, r5, pc}
	.align 2, 0
_022276A8: .4byte 0x020F5670
	thumb_func_end ov74_0222763C

	thumb_func_start ov74_022276AC
ov74_022276AC: @ 0x022276AC
	push {r4, lr}
	movs r1, #0x4f
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	subs r0, #0xa
	cmp r0, #4
	bhi _0222779A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022276C8: @ jump table
	.2byte _022276D2 - _022276C8 - 2 @ case 0
	.2byte _022276D8 - _022276C8 - 2 @ case 1
	.2byte _0222779A - _022276C8 - 2 @ case 2
	.2byte _0222770A - _022276C8 - 2 @ case 3
	.2byte _0222778E - _022276C8 - 2 @ case 4
_022276D2:
	movs r0, #0xb
	str r0, [r4, r1]
	pop {r4, pc}
_022276D8:
	ldr r0, [r4, #4]
	bl FUN_02038D28
	movs r1, #0x78
	adds r0, r1, #0
	adds r0, #0xc8
	str r1, [r4, r0]
	movs r0, #0xd
	adds r1, #0xc4
	str r0, [r4, r1]
	movs r0, #0
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x14]
	bl FUN_0202E014
	cmp r0, #1
	bne _0222779A
	ldr r1, [r4, #0x40]
	movs r0, #1
	orrs r1, r0
	str r1, [r4, #0x40]
	ldr r1, [r4, #0x44]
	orrs r0, r1
	str r0, [r4, #0x44]
	pop {r4, pc}
_0222770A:
	adds r1, #0xc
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _0222779A
	bl FUN_02038D80
	ldr r1, [r4, #0x40]
	bics r0, r1
	beq _02227770
	movs r2, #0x51
	lsls r2, r2, #2
	ldr r3, [r4, r2]
	cmp r3, #0xf
	bne _02227770
	adds r2, r2, #4
	ldr r2, [r4, r2]
	cmp r2, #0
	bne _02227770
	cmp r1, r0
	beq _02227770
	movs r2, #1
	adds r1, r0, #0
	str r2, [r4, #0x48]
	tst r1, r2
	beq _02227740
	str r2, [r4, #0x34]
	adds r0, r2, #0
_02227740:
	movs r1, #2
	adds r2, r0, #0
	tst r2, r1
	beq _0222774E
	movs r0, #1
	str r0, [r4, #0x2c]
	adds r0, r1, #0
_0222774E:
	movs r1, #4
	adds r2, r0, #0
	tst r2, r1
	beq _0222775C
	movs r0, #1
	str r0, [r4, #0x30]
	adds r0, r1, #0
_0222775C:
	movs r1, #3
	tst r1, r0
	beq _0222776A
	movs r1, #0x62
	movs r2, #1
	lsls r1, r1, #2
	str r2, [r4, r1]
_0222776A:
	ldr r1, [r4, #0x40]
	orrs r0, r1
	str r0, [r4, #0x40]
_02227770:
	movs r0, #5
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222779A
	bl FUN_02038D64
	movs r0, #0x4f
	movs r1, #0xc
	lsls r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
_0222778E:
	bl FUN_02038D64
	movs r0, #0x4f
	movs r1, #0xc
	lsls r0, r0, #2
	str r1, [r4, r0]
_0222779A:
	pop {r4, pc}
	thumb_func_end ov74_022276AC

	thumb_func_start ov74_0222779C
ov74_0222779C: @ 0x0222779C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	movs r1, #0x51
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	subs r2, #0xf
	cmp r2, #5
	bls _022277B0
	b _02227ABE
_022277B0:
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_022277BC: @ jump table
	.2byte _022277C8 - _022277BC - 2 @ case 0
	.2byte _022277F0 - _022277BC - 2 @ case 1
	.2byte _0222782E - _022277BC - 2 @ case 2
	.2byte _022279CA - _022277BC - 2 @ case 3
	.2byte _02227A26 - _022277BC - 2 @ case 4
	.2byte _02227A9E - _022277BC - 2 @ case 5
_022277C8:
	adds r0, r1, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _022277D6
	add sp, #0x70
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022277D6:
	adds r0, r1, #4
	ldr r0, [r4, r0]
	subs r2, r0, #1
	adds r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _022277EA
	movs r0, #0x10
	str r0, [r4, r1]
_022277EA:
	add sp, #0x70
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022277F0:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4f
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02227AC4 @ =0x000003F7
	movs r1, #1
	movs r3, #2
	bl FUN_0200E3DC
	movs r1, #1
	str r1, [sp]
	movs r0, #0x4f
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02227AC8 @ =0x000003EE
	movs r3, #3
	bl FUN_0200E3DC
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0201CAE0
	ldr r1, _02227ACC @ =0x00006B5A
	ldr r0, _02227AD0 @ =0x05000042
	strh r1, [r0]
	movs r0, #0x51
	movs r1, #0x11
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _02227ABE
_0222782E:
	ldr r0, _02227AC4 @ =0x000003F7
	adds r1, #0x10
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	add r0, sp, #0x1c
	adds r1, r4, r1
	movs r2, #0
	movs r3, #0x11
	bl ov74_02235414
	ldr r1, [r4, #0x40]
	ldr r0, [r4, #0x44]
	adds r6, r1, #0
	mvns r0, r0
	ands r6, r0
	movs r0, #1
	adds r1, r6, #0
	tst r1, r0
	beq _02227864
	ldr r1, [r4, #0x38]
	tst r0, r1
	beq _02227860
	ldr r5, _02227AD4 @ =0x0223BC30
	b _022278BC
_02227860:
	ldr r5, _02227AD8 @ =0x0223BC44
	b _022278BC
_02227864:
	movs r2, #2
	adds r1, r6, #0
	tst r1, r2
	beq _0222787A
	ldr r0, [r4, #0x38]
	tst r0, r2
	beq _02227876
	ldr r5, _02227ADC @ =0x0223BC58
	b _022278BC
_02227876:
	ldr r5, _02227AE0 @ =0x0223BC6C
	b _022278BC
_0222787A:
	movs r1, #0x80
	tst r1, r6
	beq _022278BC
	str r2, [sp, #0x1c]
	ldr r5, _02227AE4 @ =0x0223BC80
	ldr r2, [sp, #0x50]
	movs r1, #0x1b
	movs r3, #0x4f
	bl FUN_0200BAF8
	ldr r1, [r5, #0x10]
	adds r7, r0, #0
	bl FUN_0200BBA0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x10]
	movs r2, #0
	bl FUN_02003068
	ldr r1, [r5, #8]
	lsls r1, r1, #3
	subs r0, r1, r0
	lsrs r0, r0, #1
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_0200BB44
	movs r0, #4
	str r0, [sp, #0x40]
_022278BC:
	ldr r1, [r5, #8]
	ldr r2, [r5, #0xc]
	add r0, sp, #0x1c
	movs r3, #0x91
	bl ov74_02235464
	movs r0, #1
	str r0, [sp, #0x48]
	ldr r0, [r5, #0x10]
	add r1, sp, #0x1c
	str r0, [sp]
	ldr r0, [r4]
	ldr r2, [r5]
	ldr r3, [r5, #4]
	bl ov74_02235568
	ldr r0, [sp, #0x2c]
	bl FUN_0201EE98
	adds r7, r0, #0
	ldr r0, [sp, #0x2c]
	bl FUN_0201EE9C
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x2c]
	bl FUN_0201EE90
	adds r5, r0, #0
	ldr r0, [sp, #0x2c]
	bl FUN_0201EE94
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r3, [sp, #0x14]
	movs r1, #1
	adds r2, r7, #0
	bl FUN_0201CA4C
	movs r1, #0x80
	adds r0, r6, #0
	tst r0, r1
	beq _0222799C
	movs r0, #3
	tst r0, r6
	bne _0222799C
	adds r1, #0xe4
	adds r0, r4, r1
	movs r6, #0
	str r0, [sp, #0xc]
	movs r7, #1
_02227926:
	ldr r0, _02227AC4 @ =0x000003F7
	ldr r1, [sp, #0xc]
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	add r0, sp, #0x1c
	movs r2, #0
	movs r3, #0x11
	bl ov74_02235414
	adds r1, r6, #5
	movs r0, #0x14
	muls r0, r1, r0
	ldr r1, _02227AD4 @ =0x0223BC30
	str r0, [sp, #0x18]
	adds r5, r1, r0
	movs r0, #4
	str r0, [sp, #0x40]
	ldr r1, [r5, #8]
	ldr r2, [r5, #0xc]
	add r0, sp, #0x1c
	adds r3, r7, #0
	bl ov74_02235464
	movs r0, #1
	str r0, [sp, #0x48]
	ldr r0, [r5, #0x10]
	ldr r3, _02227AD4 @ =0x0223BC30
	str r0, [sp]
	ldr r2, [sp, #0x18]
	ldr r0, [r4]
	ldr r2, [r3, r2]
	ldr r3, [r5, #4]
	add r1, sp, #0x1c
	bl ov74_02235568
	ldr r0, [sp, #0xc]
	adds r6, r6, #1
	adds r0, #0x10
	adds r7, #0x48
	str r0, [sp, #0xc]
	cmp r6, #2
	blt _02227926
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x56
	strh r1, [r0]
	adds r0, r4, #0
	subs r1, r1, #1
	bl ov74_02228548
	movs r0, #0x51
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r1, #0x1e
	adds r0, #8
	str r1, [r4, r0]
	b _022279B0
_0222799C:
	ldr r0, [r4, #0x44]
	movs r1, #0x12
	orrs r0, r6
	str r0, [r4, #0x44]
	movs r0, #0x51
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r1, #0x1e
	adds r0, #8
	str r1, [r4, r0]
_022279B0:
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	b _02227ABE
_022279CA:
	adds r2, r1, #0
	adds r2, #8
	ldr r2, [r4, r2]
	cmp r2, #0
	beq _022279E2
	adds r0, r1, #0
	adds r0, #8
	ldr r0, [r4, r0]
	adds r1, #8
	subs r0, r0, #1
	str r0, [r4, r1]
	b _02227ABE
_022279E2:
	adds r1, #0x68
	ldr r5, [r4, r1]
	bl ov74_02227060
	adds r6, r0, #0
	movs r0, #3
	tst r0, r6
	beq _02227ABE
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r5, r0
	beq _02227A08
	adds r1, r4, #0
	adds r1, #0x54
	ldrh r1, [r1]
	adds r0, r4, #0
	bl ov74_0222841C
_02227A08:
	movs r0, #0x55
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0x51
	movs r1, #0x14
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, #0xc
	str r6, [r4, r0]
	ldr r0, _02227AE8 @ =0x000005DC
	bl FUN_0200604C
	b _02227ABE
_02227A26:
	adds r2, r1, #0
	adds r2, #8
	ldr r2, [r4, r2]
	cmp r2, #0
	beq _02227A4E
	adds r2, r1, #0
	adds r2, #8
	ldr r2, [r4, r2]
	subs r3, r2, #1
	adds r2, r1, #0
	adds r2, #8
	str r3, [r4, r2]
	adds r1, #8
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _02227ABE
	movs r1, #0
	bl ov74_02228548
	b _02227ABE
_02227A4E:
	bl ov74_022274D4
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov74_022288C4
	movs r0, #3
	tst r0, r5
	beq _02227ABE
	movs r0, #0x55
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0x59
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #0x5d
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D520
	adds r1, r4, #0
	adds r1, #0x54
	ldrh r1, [r1]
	adds r0, r4, #0
	bl ov74_0222841C
	movs r0, #0x51
	movs r1, #0x14
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, #0xc
	str r5, [r4, r0]
	ldr r0, _02227AE8 @ =0x000005DC
	bl FUN_0200604C
	b _02227ABE
_02227A9E:
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x51
	movs r1, #0xf
	lsls r0, r0, #2
	str r1, [r4, r0]
_02227ABE:
	movs r0, #1
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02227AC4: .4byte 0x000003F7
_02227AC8: .4byte 0x000003EE
_02227ACC: .4byte 0x00006B5A
_02227AD0: .4byte 0x05000042
_02227AD4: .4byte 0x0223BC30
_02227AD8: .4byte 0x0223BC44
_02227ADC: .4byte 0x0223BC58
_02227AE0: .4byte 0x0223BC6C
_02227AE4: .4byte 0x0223BC80
_02227AE8: .4byte 0x000005DC
	thumb_func_end ov74_0222779C

	thumb_func_start ov74_02227AEC
ov74_02227AEC: @ 0x02227AEC
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, r1
	beq _02227B74
	subs r1, r1, r0
	asrs r0, r1, #1
	lsrs r0, r0, #0x1e
	adds r0, r1, r0
	asrs r0, r0, #2
	asrs r2, r0, #0x1f
	adds r1, r0, #0
	eors r1, r2
	subs r2, r1, r2
	movs r1, #3
	lsls r1, r1, #0xe
	cmp r2, r1
	ble _02227B22
	cmp r0, #0
	ble _02227B20
	adds r0, r1, #0
	b _02227B22
_02227B20:
	ldr r0, _02227B78 @ =0xFFFF4000
_02227B22:
	movs r1, #0x4d
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	adds r0, r2, r0
	str r0, [r4, r1]
	adds r0, r1, #4
	ldr r0, [r4, r0]
	ldr r2, [r4, r1]
	subs r2, r0, r2
	asrs r3, r2, #0x1f
	eors r2, r3
	subs r3, r2, r3
	adds r2, r1, #0
	adds r2, #0xcc
	cmp r3, r2
	bge _02227B44
	str r0, [r4, r1]
_02227B44:
	movs r3, #0x4d
	lsls r3, r3, #2
	ldr r5, [r4, r3]
	ldr r0, [r4]
	asrs r3, r5, #0xb
	lsrs r3, r3, #0x14
	adds r3, r5, r3
	movs r1, #0
	movs r2, #3
	asrs r3, r3, #0xc
	bl FUN_0201F238
	movs r3, #0x4d
	lsls r3, r3, #2
	ldr r0, [r4]
	ldr r4, [r4, r3]
	movs r1, #2
	asrs r3, r4, #0xb
	lsrs r3, r3, #0x14
	adds r3, r4, r3
	movs r2, #3
	asrs r3, r3, #0xc
	bl FUN_0201F238
_02227B74:
	pop {r3, r4, r5, pc}
	nop
_02227B78: .4byte 0xFFFF4000
	thumb_func_end ov74_02227AEC

	thumb_func_start ov74_02227B7C
ov74_02227B7C: @ 0x02227B7C
	push {r3, r4, r5, lr}
	sub sp, #0x40
	ldr r5, _02227C9C @ =0x0223B2E8
	adds r4, r0, #0
	add r3, sp, #0x18
	movs r2, #5
_02227B88:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02227B88
	ldr r3, _02227CA0 @ =0x0223B2D8
	add r2, sp, #8
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	add r0, sp, #0x18
	bl FUN_02022BE8
	add r0, sp, #8
	bl FUN_0201ACB0
	ldr r2, _02227CA4 @ =0x04000304
	movs r3, #0xf
	ldrh r1, [r2]
	ldr r0, _02227CA8 @ =0xFFFF7FFF
	lsls r3, r3, #0xc
	ands r0, r1
	strh r0, [r2]
	movs r1, #0
	str r1, [sp]
	ldr r0, [r4]
	movs r2, #2
	bl ov74_02235308
	ldr r1, _02227CAC @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	movs r3, #0x4f
	bics r2, r0
	movs r0, #2
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	bl FUN_0201C1C4
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0201CAE0
	movs r0, #2
	lsls r0, r0, #0xe
	str r0, [sp]
	movs r1, #1
	movs r3, #0x36
	ldr r0, [r4]
	adds r2, r1, #0
	lsls r3, r3, #0xa
	bl ov74_02235308
	ldr r1, _02227CB0 @ =0x0400000A
	movs r0, #3
	ldrh r2, [r1]
	movs r3, #0x4f
	bics r2, r0
	movs r0, #1
	orrs r2, r0
	strh r2, [r1]
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0201CAE0
	movs r0, #0
	str r0, [sp]
	movs r1, #2
	movs r3, #0xe
	ldr r0, [r4]
	adds r2, r1, #0
	lsls r3, r3, #0xc
	bl ov74_02235308
	ldr r1, _02227CB4 @ =0x0400000C
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	strh r2, [r1]
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x4f
	bl FUN_0201C1C4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201CAE0
	bl FUN_02020080
	movs r0, #0
	movs r1, #0x20
	movs r2, #0x4f
	bl FUN_02003030
	movs r0, #0
	adds r1, r0, #0
	movs r2, #0x4f
	bl FUN_02003030
	movs r2, #5
	movs r1, #0
	lsls r2, r2, #0x18
	ldr r0, _02227CB8 @ =0x00006B5A
	strh r1, [r2]
	strh r0, [r2, #0x3e]
	str r1, [sp]
	movs r0, #0x4f
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02227CBC @ =0x000003F7
	movs r3, #2
	bl FUN_0200E3DC
	movs r0, #1
	str r0, [sp]
	movs r0, #0x4f
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02227CC0 @ =0x000003EE
	movs r1, #0
	movs r3, #3
	bl FUN_0200E3DC
	ldr r1, _02227CB8 @ =0x00006B5A
	ldr r0, _02227CC4 @ =0x05000042
	strh r1, [r0]
	add sp, #0x40
	pop {r3, r4, r5, pc}
	nop
_02227C9C: .4byte 0x0223B2E8
_02227CA0: .4byte 0x0223B2D8
_02227CA4: .4byte 0x04000304
_02227CA8: .4byte 0xFFFF7FFF
_02227CAC: .4byte 0x04000008
_02227CB0: .4byte 0x0400000A
_02227CB4: .4byte 0x0400000C
_02227CB8: .4byte 0x00006B5A
_02227CBC: .4byte 0x000003F7
_02227CC0: .4byte 0x000003EE
_02227CC4: .4byte 0x05000042
	thumb_func_end ov74_02227B7C

	thumb_func_start ov74_02227CC8
ov74_02227CC8: @ 0x02227CC8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl ov74_0223563C
	bl ov74_02235690
	movs r0, #0x2d
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0x2f
	movs r2, #0x2c
	movs r3, #0x2e
	bl ov74_02235728
	movs r0, #0
	movs r1, #0x1a
	str r0, [sp]
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0xec
	movs r3, #0x14
	bl ov74_02235930
	movs r1, #0x1a
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0202484C
	movs r0, #1
	movs r1, #0x69
	str r0, [sp]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	movs r0, #0
	movs r2, #0xec
	movs r3, #0xac
	bl ov74_02235930
	movs r1, #0x69
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x69
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0202484C
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov74_02227CC8

	thumb_func_start ov74_02227D48
ov74_02227D48: @ 0x02227D48
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x4f
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0x31
	movs r2, #0
	movs r3, #0x80
	bl FUN_02007938
	ldr r0, _02227D84 @ =0x000003E6
	movs r1, #0x30
	str r0, [sp]
	movs r0, #1
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x4f
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0x71
	movs r3, #2
	bl FUN_020078F0
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_02227D84: .4byte 0x000003E6
	thumb_func_end ov74_02227D48

	thumb_func_start ov74_02227D88
ov74_02227D88: @ 0x02227D88
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	movs r1, #2
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0201CC08
	ldr r1, _02227DD0 @ =0x000043E6
	cmp r7, #2
	bne _02227DA2
	adds r1, r1, #4
_02227DA2:
	lsls r2, r6, #5
	adds r3, r4, r2
	lsls r2, r3, #1
	adds r3, r3, #1
	strh r1, [r0, r2]
	adds r2, r1, #1
	lsls r3, r3, #1
	strh r2, [r0, r3]
	adds r2, r6, #1
	lsls r2, r2, #5
	adds r4, r4, r2
	adds r3, r1, #2
	lsls r2, r4, #1
	strh r3, [r0, r2]
	adds r2, r1, #3
	adds r1, r4, #1
	lsls r1, r1, #1
	strh r2, [r0, r1]
	ldr r0, [r5]
	movs r1, #2
	bl FUN_0201BF7C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02227DD0: .4byte 0x000043E6
	thumb_func_end ov74_02227D88

	thumb_func_start ov74_02227DD4
ov74_02227DD4: @ 0x02227DD4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	adds r6, r2, #0
	movs r1, #2
	bl FUN_0201CC08
	lsls r1, r6, #5
	adds r3, r4, r1
	movs r1, #0
	lsls r2, r3, #1
	strh r1, [r0, r2]
	adds r2, r3, #1
	lsls r2, r2, #1
	strh r1, [r0, r2]
	adds r2, r6, #1
	lsls r2, r2, #5
	adds r3, r4, r2
	lsls r2, r3, #1
	strh r1, [r0, r2]
	adds r2, r3, #1
	lsls r2, r2, #1
	strh r1, [r0, r2]
	ldr r0, [r5]
	movs r1, #2
	bl FUN_0201BF7C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov74_02227DD4

	thumb_func_start ov74_02227E10
ov74_02227E10: @ 0x02227E10
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r0, r2, #0
	adds r7, r3, #0
	ldr r2, [sp, #0x28]
	movs r3, #0x4f
	bl FUN_0200BC4C
	adds r5, r0, #0
	movs r0, #0
	movs r1, #2
	bl FUN_02002FAC
	adds r2, r0, #0
	movs r0, #0
	adds r1, r5, #0
	bl FUN_02002F30
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_0201EE90
	lsls r0, r0, #3
	adds r4, #0x20
	subs r3, r0, r4
	ldr r0, [sp, #0x2c]
	movs r1, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r7, [sp, #8]
	adds r0, r6, #0
	adds r2, r5, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_02227E10

	thumb_func_start ov74_02227E64
ov74_02227E64: @ 0x02227E64
	push {r3, lr}
	sub sp, #8
	adds r2, r1, #0
	cmp r2, #0x64
	blt _02227E74
	movs r3, #3
	movs r1, #0
	b _02227E82
_02227E74:
	cmp r2, #0xa
	blt _02227E7E
	movs r3, #3
	movs r1, #1
	b _02227E82
_02227E7E:
	movs r3, #2
	movs r1, #1
_02227E82:
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #0
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02227E64

	thumb_func_start ov74_02227E94
ov74_02227E94: @ 0x02227E94
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r2, [sp, #0x18]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r4, r3, #0
	ldr r2, _02228028 @ =0x000001BA
	movs r0, #1
	movs r1, #0x1b
	movs r3, #0x4f
	bl FUN_0200BAF8
	str r0, [sp, #0x24]
	movs r0, #0x4f
	bl FUN_0200BD08
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_02028F94
	cmp r0, #1
	bne _02227EC8
	ldr r0, _0222802C @ =0x0003040F
	str r0, [sp, #0x1c]
	b _02227ECC
_02227EC8:
	ldr r0, _02228030 @ =0x0007080F
	str r0, [sp, #0x1c]
_02227ECC:
	ldr r0, [sp, #0x14]
	ldr r1, _02228034 @ =0x0223BCC4
	lsls r0, r0, #4
	str r0, [sp, #0x20]
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x10]
	movs r2, #3
	ldr r0, [r0]
	adds r3, r4, #0
	bl ov74_02235568
	ldr r4, _02228038 @ =0x0223BBC4
	movs r6, #1
	movs r5, #0x10
_02227EEC:
	cmp r6, #4
	bne _02227EF8
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0x4c]
	cmp r0, #0
	beq _02227F28
_02227EF8:
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x24]
	ldr r2, [r4]
	movs r3, #0x4f
	bl FUN_0200BC4C
	adds r7, r0, #0
	str r5, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	adds r2, r7, #0
	ldr r0, [r0, #0x10]
	movs r3, #0x20
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
_02227F28:
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, #0x10
	cmp r6, #5
	blo _02227EEC
	ldr r2, [sp, #0x10]
	ldr r0, [sp, #0x28]
	ldr r2, [r2, #0xc]
	movs r1, #0
	bl FUN_0200BE48
	movs r0, #0x11
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, [r0, #0x10]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	bl ov74_02227E10
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0x10]
	bl FUN_0202CE24
	adds r1, r0, #0
	ldr r0, [sp, #0x28]
	bl ov74_02227E64
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0x10]
	bl FUN_0202CE28
	adds r2, r0, #0
	movs r3, #2
	ldr r0, [sp, #0x28]
	str r3, [sp]
	movs r1, #1
	str r1, [sp, #4]
	bl FUN_0200BFCC
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, [r0, #0x10]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	bl ov74_02227E10
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	ldr r0, [sp, #0x28]
	ldr r2, [r2, #0x50]
	movs r3, #2
	bl FUN_0200BFCC
	movs r0, #0x14
	str r0, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, [r0, #0x10]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	bl ov74_02227E10
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0x4c]
	cmp r0, #0
	beq _02227FEA
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #8]
	bl FUN_02029E84
	adds r1, r0, #0
	ldr r0, [sp, #0x28]
	bl ov74_02227E64
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, [r0, #0x10]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	bl ov74_02227E10
_02227FEA:
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x18]
	ldr r0, [sp, #0x18]
	ldr r2, [r2, #0x38]
	ldr r3, [r3, #0x3c]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x18
	ldr r0, [r0, #0x10]
	movs r1, #0
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0200E580
	ldr r1, _0222803C @ =0x0223BCBC
	ldr r0, [sp, #0x20]
	ldr r2, [r1, r0]
	ldr r0, [sp, #0x14]
	lsls r1, r0, #2
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	adds r0, #0xec
	str r2, [r0]
	ldr r0, [sp, #0x28]
	bl FUN_0200BDA0
	ldr r0, [sp, #0x24]
	bl FUN_0200BB44
	movs r0, #1
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02228028: .4byte 0x000001BA
_0222802C: .4byte 0x0003040F
_02228030: .4byte 0x0007080F
_02228034: .4byte 0x0223BCC4
_02228038: .4byte 0x0223BBC4
_0222803C: .4byte 0x0223BCBC
	thumb_func_end ov74_02227E94

	thumb_func_start ov74_02228040
ov74_02228040: @ 0x02228040
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r2, [r4, #0x24]
	adds r6, r3, #0
	cmp r2, #0
	bne _02228058
	add sp, #4
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_02228058:
	subs r2, r2, #1
	cmp r2, #4
	bhi _02228086
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0222806A: @ jump table
	.2byte _02228074 - _0222806A - 2 @ case 0
	.2byte _02228078 - _0222806A - 2 @ case 1
	.2byte _0222807C - _0222806A - 2 @ case 2
	.2byte _02228080 - _0222806A - 2 @ case 3
	.2byte _02228084 - _0222806A - 2 @ case 4
_02228074:
	movs r0, #4
	b _02228086
_02228078:
	movs r0, #5
	b _02228086
_0222807C:
	movs r0, #6
	b _02228086
_02228080:
	movs r0, #7
	b _02228086
_02228084:
	movs r0, #8
_02228086:
	str r0, [sp]
	ldr r0, [r4]
	movs r2, #3
	adds r3, r6, #0
	bl ov74_02235568
	adds r0, r4, #0
	movs r1, #0x17
	adds r2, r6, #0
	bl ov74_02227DD4
	ldr r0, _022280B0 @ =0x0223BCBC
	lsls r1, r5, #4
	ldr r1, [r0, r1]
	lsls r0, r5, #2
	adds r0, r4, r0
	adds r0, #0xec
	str r1, [r0]
	movs r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_022280B0: .4byte 0x0223BCBC
	thumb_func_end ov74_02228040

	thumb_func_start ov74_022280B4
ov74_022280B4: @ 0x022280B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r4, r1, #0
	adds r7, r3, #0
	str r2, [sp, #4]
	cmp r0, #0
	bne _022280FC
	ldr r0, [r5, #0x14]
	bl FUN_0202E014
	cmp r0, #1
	bne _022280D4
	movs r0, #1
	str r0, [r5, #0x34]
_022280D4:
	ldr r0, [r5, #4]
	bl FUN_02028D30
	bl FUN_02028DC8
	cmp r0, #1
	bne _022280E6
	movs r0, #1
	str r0, [r5, #0x34]
_022280E6:
	movs r0, #0x4f
	bl ov74_0223512C
	bl ov74_02235230
	cmp r0, #0
	beq _022280FC
	movs r0, #1
	str r0, [r5, #0x34]
	bl ov74_02236034
_022280FC:
	ldr r0, [r5, #0x34]
	cmp r0, #1
	bne _0222810C
	ldr r0, [r5, #0x4c]
	cmp r0, #0
	bne _0222810C
	movs r0, #0
	str r0, [r5, #0x34]
_0222810C:
	ldr r0, [r5, #0x34]
	cmp r0, #1
	bne _02228150
	ldr r0, _02228158 @ =0x0223BCC4
	lsls r6, r4, #4
	ldr r0, [r0, r6]
	ldr r1, [sp, #4]
	str r0, [sp]
	ldr r0, [r5]
	movs r2, #3
	adds r3, r7, #0
	bl ov74_02235568
	adds r0, r5, #0
	movs r1, #0x17
	adds r2, r7, #0
	bl ov74_02227DD4
	ldr r0, _0222815C @ =0x0223BCBC
	ldr r1, [r0, r6]
	lsls r0, r4, #2
	adds r0, r5, r0
	adds r0, #0xec
	str r1, [r0]
	ldr r1, [r5, #0x38]
	movs r0, #1
	orrs r0, r1
	str r0, [r5, #0x38]
	ldr r0, [r5, #0x14]
	bl FUN_0202E024
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02228150:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228158: .4byte 0x0223BCC4
_0222815C: .4byte 0x0223BCBC
	thumb_func_end ov74_022280B4

	thumb_func_start ov74_02228160
ov74_02228160: @ 0x02228160
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r4, r1, #0
	adds r7, r3, #0
	cmp r0, #1
	bne _022281B0
	ldr r0, [r5, #0x4c]
	cmp r0, #1
	bne _022281B0
	ldr r0, _022281B4 @ =0x0223BCC4
	lsls r6, r4, #4
	ldr r0, [r0, r6]
	adds r1, r2, #0
	str r0, [sp]
	ldr r0, [r5]
	movs r2, #3
	bl ov74_02235568
	adds r0, r5, #0
	movs r1, #0x17
	adds r2, r7, #0
	movs r3, #1
	bl ov74_02227D88
	lsls r1, r4, #2
	adds r2, r5, r1
	movs r1, #0x11
	movs r0, #1
	lsls r1, r1, #4
	str r0, [r2, r1]
	ldr r1, _022281B8 @ =0x0223BCBC
	adds r2, #0xec
	ldr r1, [r1, r6]
	str r1, [r2]
	ldr r2, [r5, #0x38]
	movs r1, #2
	orrs r1, r2
	str r1, [r5, #0x38]
	pop {r3, r4, r5, r6, r7, pc}
_022281B0:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022281B4: .4byte 0x0223BCC4
_022281B8: .4byte 0x0223BCBC
	thumb_func_end ov74_02228160

	thumb_func_start ov74_022281BC
ov74_022281BC: @ 0x022281BC
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r5, r1, #0
	adds r7, r3, #0
	cmp r0, #1
	bne _02228200
	ldr r0, _02228204 @ =0x0223BCC4
	lsls r6, r5, #4
	ldr r0, [r0, r6]
	adds r1, r2, #0
	str r0, [sp]
	ldr r0, [r4]
	movs r2, #3
	bl ov74_02235568
	lsls r5, r5, #2
	movs r0, #0x11
	movs r3, #1
	adds r1, r4, r5
	lsls r0, r0, #4
	str r3, [r1, r0]
	adds r0, r4, #0
	movs r1, #0x17
	adds r2, r7, #0
	bl ov74_02227D88
	ldr r0, _02228208 @ =0x0223BCBC
	ldr r1, [r0, r6]
	adds r0, r4, r5
	adds r0, #0xec
	str r1, [r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02228200:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02228204: .4byte 0x0223BCC4
_02228208: .4byte 0x0223BCBC
	thumb_func_end ov74_022281BC

	thumb_func_start ov74_0222820C
ov74_0222820C: @ 0x0222820C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, _0222824C @ =0x0223BCC4
	lsls r6, r4, #4
	ldr r0, [r0, r6]
	adds r1, r2, #0
	str r0, [sp]
	ldr r0, [r5]
	movs r2, #3
	adds r7, r3, #0
	bl ov74_02235568
	lsls r4, r4, #2
	movs r0, #0x11
	movs r3, #2
	adds r1, r5, r4
	lsls r0, r0, #4
	str r3, [r1, r0]
	adds r0, r5, #0
	movs r1, #0x17
	adds r2, r7, #0
	bl ov74_02227D88
	ldr r0, _02228250 @ =0x0223BCBC
	ldr r1, [r0, r6]
	adds r0, r5, r4
	adds r0, #0xec
	str r1, [r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222824C: .4byte 0x0223BCC4
_02228250: .4byte 0x0223BCBC
	thumb_func_end ov74_0222820C

	thumb_func_start ov74_02228254
ov74_02228254: @ 0x02228254
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r0, _02228288 @ =0x0223BCC4
	lsls r4, r6, #4
	ldr r0, [r0, r4]
	adds r1, r2, #0
	str r0, [sp]
	ldr r0, [r5]
	adds r7, r3, #0
	movs r2, #3
	bl ov74_02235568
	adds r0, r5, #0
	movs r1, #0x17
	adds r2, r7, #0
	bl ov74_02227DD4
	ldr r0, _0222828C @ =0x0223BCBC
	ldr r1, [r0, r4]
	lsls r0, r6, #2
	adds r0, r5, r0
	adds r0, #0xec
	str r1, [r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02228288: .4byte 0x0223BCC4
_0222828C: .4byte 0x0223BCBC
	thumb_func_end ov74_02228254

	thumb_func_start ov74_02228290
ov74_02228290: @ 0x02228290
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r0, _022282C4 @ =0x0223BCC4
	lsls r4, r6, #4
	ldr r0, [r0, r4]
	adds r1, r2, #0
	str r0, [sp]
	ldr r0, [r5]
	adds r7, r3, #0
	movs r2, #3
	bl ov74_02235568
	adds r0, r5, #0
	movs r1, #0x17
	adds r2, r7, #0
	bl ov74_02227DD4
	ldr r0, _022282C8 @ =0x0223BCBC
	ldr r1, [r0, r4]
	lsls r0, r6, #2
	adds r0, r5, r0
	adds r0, #0xec
	str r1, [r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022282C4: .4byte 0x0223BCC4
_022282C8: .4byte 0x0223BCBC
	thumb_func_end ov74_02228290

	thumb_func_start ov74_022282CC
ov74_022282CC: @ 0x022282CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	movs r1, #0x1b
	adds r7, r0, #0
	movs r0, #0
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	str r0, [r7, r1]
	str r0, [sp, #0x10]
	adds r0, r7, #0
	str r0, [sp, #8]
	adds r0, #0x5c
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r5, #1
	str r0, [sp, #0x14]
	adds r0, #0x20
	ldr r4, _02228410 @ =0x0223BCBC
	str r5, [r7, #0x20]
	str r7, [sp, #0x18]
	str r0, [sp, #0x14]
_022282F6:
	ldr r0, _02228414 @ =0x000003F7
	ldr r1, [sp, #8]
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r3, _02228418 @ =0x000001BA
	add r0, sp, #0x1c
	movs r2, #1
	bl ov74_02235414
	ldr r2, [r4, #4]
	ldr r3, [r7, #0x20]
	add r0, sp, #0x1c
	movs r1, #0x17
	bl ov74_02235464
	ldr r0, [r4, #0xc]
	mov ip, r0
	cmp r0, #0
	beq _02228398
	ldr r0, [sp, #0x18]
	adds r0, #0xec
	ldr r0, [r0]
	cmp r0, #0
	beq _0222837C
	ldr r0, [sp, #0x2c]
	movs r1, #3
	bl FUN_0201EEA8
	lsls r1, r5, #0x18
	ldr r0, [sp, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_0201EEAC
	ldr r2, [sp, #0x54]
	ldr r3, [sp, #0x58]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x18
	ldr r0, [sp, #0x2c]
	movs r1, #0
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0200E580
	movs r1, #0x11
	ldr r0, [sp, #0x18]
	lsls r1, r1, #4
	ldr r3, [r0, r1]
	cmp r3, #0
	beq _02228366
	adds r0, r7, #0
	movs r1, #0x17
	adds r2, r5, #0
	bl ov74_02227D88
	b _02228370
_02228366:
	adds r0, r7, #0
	movs r1, #0x17
	adds r2, r5, #0
	bl ov74_02227DD4
_02228370:
	ldr r0, [r4, #4]
	adds r0, r0, #2
	adds r5, r5, r0
	movs r0, #1
	str r0, [sp, #0xc]
	b _022283B6
_0222837C:
	ldr r1, [sp, #0x10]
	adds r0, r7, #0
	add r2, sp, #0x1c
	adds r3, r5, #0
	mov r6, ip
	blx r6
	cmp r0, #1
	bne _022283B6
	ldr r0, [r4, #4]
	adds r0, r0, #2
	adds r5, r5, r0
	movs r0, #1
	str r0, [sp, #0xc]
	b _022283B6
_02228398:
	ldr r0, [r4, #8]
	add r1, sp, #0x1c
	str r0, [sp]
	ldr r0, [r7]
	movs r2, #3
	adds r3, r5, #0
	bl ov74_02235568
	ldr r0, [sp, #0x18]
	ldr r1, [r4]
	adds r0, #0xec
	str r1, [r0]
	ldr r0, [r4, #4]
	adds r0, r0, #2
	adds r5, r5, r0
_022283B6:
	ldr r0, [sp, #0x14]
	ldr r1, [r4, #4]
	ldr r2, [r0]
	movs r0, #0x17
	muls r0, r1, r0
	adds r1, r2, r0
	ldr r0, [sp, #0x14]
	str r1, [r0]
	ldr r0, [sp, #0x18]
	adds r0, #0xec
	ldr r0, [r0]
	cmp r0, #0
	beq _022283DE
	movs r0, #0x1b
	lsls r0, r0, #4
	ldr r0, [r7, r0]
	adds r1, r0, #1
	movs r0, #0x1b
	lsls r0, r0, #4
	str r1, [r7, r0]
_022283DE:
	ldr r0, [sp, #8]
	adds r4, #0x10
	adds r0, #0x10
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	adds r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	adds r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #9
	bhs _022283F8
	b _022282F6
_022283F8:
	adds r0, r7, #0
	bl ov74_0222879C
	adds r0, r7, #0
	adds r7, #0x54
	ldrh r1, [r7]
	bl ov74_0222841C
	ldr r0, [sp, #0xc]
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228410: .4byte 0x0223BCBC
_02228414: .4byte 0x000003F7
_02228418: .4byte 0x000001BA
	thumb_func_end ov74_022282CC

	thumb_func_start ov74_0222841C
ov74_0222841C: @ 0x0222841C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r7, r0, #0
	adds r0, r1, #0
	adds r0, r0, #5
	str r0, [sp, #0x14]
	adds r0, r1, #0
	adds r4, r7, #0
	subs r0, r0, #5
	str r1, [sp, #0xc]
	movs r6, #0
	adds r4, #0x5c
	str r0, [sp, #0x10]
_02228436:
	adds r0, r4, #0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222852C
	cmp r6, #0
	bne _02228452
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r1, [r7, r0]
	movs r0, #6
	lsls r0, r0, #0x12
	cmp r1, r0
	beq _0222852C
_02228452:
	ldr r0, [sp, #0x10]
	cmp r6, r0
	blt _0222852C
	ldr r0, [sp, #0x14]
	cmp r6, r0
	bgt _0222852C
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	cmp r0, #1
	bne _022284A8
	ldr r2, _02228540 @ =0x000003EE
	adds r0, r4, #0
	movs r1, #1
	movs r3, #2
	bl FUN_0200E580
	adds r0, r4, #0
	bl FUN_0201EE98
	str r0, [sp, #0x18]
	adds r0, r4, #0
	bl FUN_0201EE9C
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	bl FUN_0201EE90
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201EE94
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [r7]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	movs r1, #0
	bl FUN_0201CA4C
	b _0222852C
_022284A8:
	ldr r0, [sp, #0xc]
	cmp r6, r0
	bne _022284EE
	ldr r2, _02228540 @ =0x000003EE
	adds r0, r4, #0
	movs r1, #1
	movs r3, #3
	bl FUN_0200E580
	adds r0, r4, #0
	bl FUN_0201EE98
	str r0, [sp, #0x20]
	adds r0, r4, #0
	bl FUN_0201EE9C
	str r0, [sp, #0x24]
	adds r0, r4, #0
	bl FUN_0201EE90
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201EE94
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [r7]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	movs r1, #0
	bl FUN_0201CA4C
	b _0222852C
_022284EE:
	ldr r2, _02228544 @ =0x000003F7
	adds r0, r4, #0
	movs r1, #1
	movs r3, #2
	bl FUN_0200E580
	adds r0, r4, #0
	bl FUN_0201EE98
	str r0, [sp, #0x28]
	adds r0, r4, #0
	bl FUN_0201EE9C
	str r0, [sp, #0x2c]
	adds r0, r4, #0
	bl FUN_0201EE90
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201EE94
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r7]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	movs r1, #0
	bl FUN_0201CA4C
_0222852C:
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #9
	blo _02228436
	ldr r0, [r7]
	movs r1, #0
	bl FUN_0201BF7C
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02228540: .4byte 0x000003EE
_02228544: .4byte 0x000003F7
	thumb_func_end ov74_0222841C

	thumb_func_start ov74_02228548
ov74_02228548: @ 0x02228548
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r6, r0, #0
	movs r0, #0x59
	lsls r0, r0, #2
	str r1, [sp, #0xc]
	movs r7, #0
	adds r4, r6, r0
_02228558:
	adds r0, r4, #0
	bl FUN_0201D3F0
	cmp r0, #0
	bne _02228564
	b _02228678
_02228564:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bge _022285AA
	ldr r2, _02228690 @ =0x000003F7
	adds r0, r4, #0
	movs r1, #1
	movs r3, #2
	bl FUN_0200E580
	adds r0, r4, #0
	bl FUN_0201EE98
	str r0, [sp, #0x10]
	adds r0, r4, #0
	bl FUN_0201EE9C
	str r0, [sp, #0x14]
	adds r0, r4, #0
	bl FUN_0201EE90
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201EE94
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r6]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	movs r1, #1
	bl FUN_0201CA4C
	b _02228678
_022285AA:
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #1
	bne _022285F4
	ldr r2, _02228694 @ =0x000003EE
	adds r0, r4, #0
	movs r1, #1
	movs r3, #2
	bl FUN_0200E580
	adds r0, r4, #0
	bl FUN_0201EE98
	str r0, [sp, #0x18]
	adds r0, r4, #0
	bl FUN_0201EE9C
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	bl FUN_0201EE90
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201EE94
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [r6]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	movs r1, #1
	bl FUN_0201CA4C
	b _02228678
_022285F4:
	ldr r0, [sp, #0xc]
	cmp r7, r0
	bne _0222863A
	ldr r2, _02228694 @ =0x000003EE
	adds r0, r4, #0
	movs r1, #1
	movs r3, #3
	bl FUN_0200E580
	adds r0, r4, #0
	bl FUN_0201EE98
	str r0, [sp, #0x20]
	adds r0, r4, #0
	bl FUN_0201EE9C
	str r0, [sp, #0x24]
	adds r0, r4, #0
	bl FUN_0201EE90
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201EE94
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [r6]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	movs r1, #1
	bl FUN_0201CA4C
	b _02228678
_0222863A:
	ldr r2, _02228690 @ =0x000003F7
	adds r0, r4, #0
	movs r1, #1
	movs r3, #2
	bl FUN_0200E580
	adds r0, r4, #0
	bl FUN_0201EE98
	str r0, [sp, #0x28]
	adds r0, r4, #0
	bl FUN_0201EE9C
	str r0, [sp, #0x2c]
	adds r0, r4, #0
	bl FUN_0201EE90
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201EE94
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r6]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	movs r1, #1
	bl FUN_0201CA4C
_02228678:
	adds r7, r7, #1
	adds r4, #0x10
	cmp r7, #2
	bge _02228682
	b _02228558
_02228682:
	ldr r0, [r6]
	movs r1, #1
	bl FUN_0201BF7C
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228690: .4byte 0x000003F7
_02228694: .4byte 0x000003EE
	thumb_func_end ov74_02228548

	thumb_func_start ov74_02228698
ov74_02228698: @ 0x02228698
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x54
	ldrh r6, [r0]
	movs r7, #8
	adds r3, r7, #0
	adds r4, r6, #0
	movs r0, #0
	subs r3, #9
_022286AA:
	adds r4, r4, r1
	cmp r4, r3
	bne _022286B2
	adds r4, r0, #0
_022286B2:
	cmp r4, #9
	bne _022286B8
	adds r4, r7, #0
_022286B8:
	cmp r4, r6
	beq _022286CE
	lsls r2, r4, #2
	adds r2, r5, r2
	adds r2, #0xec
	ldr r2, [r2]
	cmp r2, #0
	beq _022286AA
	ldr r0, _022286F4 @ =0x000005DC
	bl FUN_0200604C
_022286CE:
	adds r0, r5, #0
	adds r0, #0x54
	strh r4, [r0]
	adds r0, r5, #0
	adds r0, #0x54
	ldrh r1, [r0]
	cmp r1, r6
	beq _022286F0
	adds r0, r5, #0
	bl ov74_0222841C
	movs r0, #0x6d
	movs r1, #6
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022286F0:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022286F4: .4byte 0x000005DC
	thumb_func_end ov74_02228698

	thumb_func_start ov74_022286F8
ov74_022286F8: @ 0x022286F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x5c
	lsls r7, r1, #4
	adds r0, r6, r7
	bl FUN_0201EE9C
	subs r0, r0, #1
	lsls r4, r0, #3
	adds r0, r6, r7
	bl FUN_0201EE94
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	cmp r0, r4
	bgt _0222872C
	adds r0, #0xc0
	cmp r0, r4
	bgt _02228796
_0222872C:
	movs r0, #0x4e
	lsls r1, r4, #0xc
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov74_0222879C
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	movs r0, #6
	lsls r0, r0, #0x12
	cmp r1, r0
	bne _0222878C
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201C8C4
	ldr r0, [r5]
	movs r1, #0
	bl FUN_0201EFBC
	ldr r0, [r5]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0222878C:
	cmp r1, #0
	bne _02228796
	adds r0, r5, #0
	bl ov74_022282CC
_02228796:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov74_022286F8

	thumb_func_start ov74_0222879C
ov74_0222879C: @ 0x0222879C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #0x4e
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r1, [r0, r1]
	ldr r5, [sp]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r7, r0, #0xc
	adds r0, r7, #0
	str r0, [sp, #0xc]
	adds r0, #0xc0
	ldr r6, [sp, #4]
	adds r5, #0x5c
	str r0, [sp, #0xc]
_022287C6:
	adds r0, r5, #0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _022287F2
	adds r0, r5, #0
	bl FUN_0201EE9C
	subs r0, r0, #1
	lsls r4, r0, #3
	adds r0, r5, #0
	bl FUN_0201EE94
	cmp r7, r4
	ble _022287E8
	movs r0, #1
	str r0, [sp, #8]
_022287E8:
	ldr r0, [sp, #0xc]
	cmp r0, r4
	bgt _022287F2
	movs r0, #1
	str r0, [sp, #4]
_022287F2:
	adds r6, r6, #1
	adds r5, #0x10
	cmp r6, #9
	blo _022287C6
	movs r1, #0x1a
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [sp, #8]
	lsls r1, r1, #1
	bl FUN_020248F0
	movs r1, #0x1a
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_0202484C
	movs r1, #0x69
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	ldr r1, [sp, #4]
	lsls r1, r1, #1
	adds r1, r1, #1
	bl FUN_020248F0
	movs r1, #0x69
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_0202484C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_0222879C

	thumb_func_start ov74_0222883C
ov74_0222883C: @ 0x0222883C
	push {r3, r4, r5, r6, r7, lr}
	bl FUN_02007290
	movs r1, #0x1a
	adds r7, r0, #0
	lsls r1, r1, #4
	ldr r0, [r7, r1]
	cmp r0, #0
	bne _02228856
	adds r1, r1, #4
	ldr r1, [r7, r1]
	cmp r1, #0
	beq _02228868
_02228856:
	bl FUN_02024758
	movs r0, #0x69
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_02024758
	bl ov74_022359BC
_02228868:
	adds r5, r7, #0
	movs r6, #0
	adds r4, r7, #0
	adds r5, #0x5c
_02228870:
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	beq _02228882
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
_02228882:
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, #0x10
	cmp r6, #9
	blo _02228870
	ldr r0, [r7]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r7]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r7]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r2, _022288C0 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	ldr r0, [r7]
	bl FUN_0201AB0C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022288C0: .4byte 0x04000304
	thumb_func_end ov74_0222883C

	thumb_func_start ov74_022288C4
ov74_022288C4: @ 0x022288C4
	movs r1, #0x6a
	lsls r1, r1, #2
	ldr r2, [r0, r1]
	lsls r3, r2, #1
	ldr r2, _022288F0 @ =0x0223BBF0
	ldrh r2, [r2, r3]
	cmp r2, #0
	bne _022288D8
	movs r2, #0
	str r2, [r0, r1]
_022288D8:
	movs r1, #0x6a
	lsls r1, r1, #2
	ldr r3, [r0, r1]
	adds r2, r3, #1
	str r2, [r0, r1]
	ldr r0, _022288F0 @ =0x0223BBF0
	lsls r1, r3, #1
	ldrh r1, [r0, r1]
	ldr r0, _022288F4 @ =0x0500006C
	strh r1, [r0]
	bx lr
	nop
_022288F0: .4byte 0x0223BBF0
_022288F4: .4byte 0x0500006C
	thumb_func_end ov74_022288C4

	thumb_func_start ov74_022288F8
ov74_022288F8: @ 0x022288F8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0202061C
	bl FUN_0200B224
	adds r0, r4, #0
	bl FUN_0201EEB4
	ldr r3, _02228918 @ =0x027E0000
	ldr r1, _0222891C @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_02228918: .4byte 0x027E0000
_0222891C: .4byte 0x00003FF8
	thumb_func_end ov74_022288F8

	thumb_func_start ov74_02228920
ov74_02228920: @ 0x02228920
	push {r3, r4, r5, lr}
	movs r2, #1
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x4f
	lsls r2, r2, #0x12
	bl FUN_0201A910
	movs r1, #0x6e
	adds r0, r5, #0
	lsls r1, r1, #2
	movs r2, #0x4f
	bl FUN_02007280
	movs r2, #0x6e
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x4f
	bl FUN_0201AC88
	str r0, [r4]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	adds r0, r5, #0
	bl FUN_020072A4
	ldr r0, [r0, #8]
	str r0, [r4, #4]
	bl FUN_020270E4
	str r0, [r4, #0x14]
	movs r0, #0x4d
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #4]
	bl FUN_02028E9C
	str r0, [r4, #0xc]
	ldr r0, [r4, #4]
	bl FUN_0202A634
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	bl FUN_02028EC0
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	bl FUN_0202A5F4
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0xc]
	bl FUN_02028FF0
	str r0, [r4, #0x50]
	movs r0, #0x51
	movs r1, #0xf
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #0x4f
	bl ov74_022352A0
	ldr r0, [r4, #4]
	bl FUN_020274E0
	cmp r0, #0
	bne _022289C4
	movs r0, #0x61
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
_022289C4:
	movs r0, #0
	bl FUN_02005AF8
	movs r0, #0
	bl FUN_02004AD8
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_02228920

	thumb_func_start ov74_022289D4
ov74_022289D4: @ 0x022289D4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	adds r0, r0, #1
	str r0, [r4, #0x18]
	blx FUN_020E1134
	adds r0, r4, #0
	bl ov74_0222779C
	cmp r0, #1
	bne _02228A04
	adds r0, r4, #0
	bl ov74_022276AC
	adds r0, r4, #0
	bl ov74_02227AEC
	movs r0, #0
	pop {r4, r5, r6, pc}
_02228A04:
	adds r0, r4, #0
	bl ov74_022288C4
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _02228A18
	subs r1, r1, #1
	str r1, [r4, r0]
_02228A18:
	ldr r0, [r5]
	cmp r0, #9
	bls _02228A20
	b _02228B70
_02228A20:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02228A2C: @ jump table
	.2byte _02228A40 - _02228A2C - 2 @ case 0
	.2byte _02228A4C - _02228A2C - 2 @ case 1
	.2byte _02228A72 - _02228A2C - 2 @ case 2
	.2byte _02228A8A - _02228A2C - 2 @ case 3
	.2byte _02228AB8 - _02228A2C - 2 @ case 4
	.2byte _02228AFC - _02228A2C - 2 @ case 5
	.2byte _02228B32 - _02228A2C - 2 @ case 6
	.2byte _02228B5A - _02228A2C - 2 @ case 7
	.2byte _02228B64 - _02228A2C - 2 @ case 8
	.2byte _02228B6C - _02228A2C - 2 @ case 9
_02228A40:
	adds r0, r4, #0
	bl ov74_02227B7C
	movs r0, #1
	str r0, [r5]
	b _02228B70
_02228A4C:
	adds r0, r4, #0
	bl ov74_02227580
	cmp r0, #0
	bne _02228A5C
	movs r0, #3
	str r0, [r5]
	b _02228B70
_02228A5C:
	movs r0, #1
	movs r1, #2
	adds r2, r5, #0
	movs r3, #8
	bl ov74_0223539C
	movs r0, #5
	ldr r1, _02228B84 @ =0x00007D8C
	lsls r0, r0, #0x18
	strh r1, [r0]
	b _02228B70
_02228A72:
	adds r0, r4, #0
	bl ov74_02227584
	cmp r0, #0
	bne _02228B70
	movs r0, #0
	movs r1, #3
	adds r2, r5, #0
	movs r3, #8
	bl ov74_0223539C
	b _02228B70
_02228A8A:
	movs r0, #0x4f
	movs r1, #0xc
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, #0x48
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02228AAC
	movs r0, #2
	str r0, [r4, #0x58]
	movs r0, #0
	movs r1, #7
	adds r2, r5, #0
	movs r3, #8
	bl ov74_0223539C
	b _02228B70
_02228AAC:
	adds r0, r4, #0
	bl ov74_0222763C
	movs r0, #4
	str r0, [r5]
	b _02228B70
_02228AB8:
	adds r0, r4, #0
	bl ov74_02227CC8
	adds r0, r4, #0
	bl ov74_02227D48
	ldr r0, _02228B88 @ =ov74_022288F8
	ldr r1, [r4]
	bl FUN_0201A0FC
	adds r0, r4, #0
	bl ov74_022282CC
	adds r1, r4, #0
	adds r1, #0x54
	ldrh r1, [r1]
	adds r0, r4, #0
	bl ov74_0222841C
	movs r0, #1
	movs r1, #5
	adds r2, r5, #0
	movs r3, #8
	bl ov74_0223539C
	movs r0, #5
	ldr r1, _02228B84 @ =0x00007D8C
	lsls r0, r0, #0x18
	strh r1, [r0]
	movs r0, #0x4f
	movs r1, #0xa
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _02228B70
_02228AFC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov74_02227428
	ldr r0, [r4, #0x48]
	cmp r0, #1
	bne _02228B16
	adds r0, r4, #0
	bl ov74_022282CC
	movs r0, #0
	str r0, [r4, #0x48]
	b _02228B70
_02228B16:
	ldr r0, [r5]
	cmp r0, #5
	bne _02228B70
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _02228B70
	movs r1, #0
	str r1, [r4, r0]
	movs r1, #1
	subs r0, #0x40
	str r1, [r4, r0]
	b _02228B70
_02228B32:
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0xf
	bne _02228B70
	adds r0, #0xc
	ldr r1, [r4, r0]
	movs r0, #2
	tst r0, r1
	beq _02228B4C
	movs r0, #5
	str r0, [r5]
	b _02228B70
_02228B4C:
	movs r0, #0
	movs r1, #7
	adds r2, r5, #0
	movs r3, #8
	bl ov74_0223539C
	b _02228B70
_02228B5A:
	adds r0, r6, #0
	bl ov74_0222883C
	movs r0, #1
	pop {r4, r5, r6, pc}
_02228B64:
	adds r0, r5, #0
	bl ov74_022353FC
	b _02228B70
_02228B6C:
	movs r0, #1
	pop {r4, r5, r6, pc}
_02228B70:
	adds r0, r4, #0
	bl ov74_022276AC
	adds r0, r4, #0
	bl ov74_02227AEC
	bl ov74_022358BC
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02228B84: .4byte 0x00007D8C
_02228B88: .4byte ov74_022288F8
	thumb_func_end ov74_022289D4

	thumb_func_start ov74_02228B8C
ov74_02228B8C: @ 0x02228B8C
	push {r3, lr}
	ldr r0, [r0, #0x58]
	cmp r0, #9
	bhi _02228C22
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02228BA0: @ jump table
	.2byte _02228C1A - _02228BA0 - 2 @ case 0
	.2byte _02228BB4 - _02228BA0 - 2 @ case 1
	.2byte _02228BBE - _02228BA0 - 2 @ case 2
	.2byte _02228BFE - _02228BA0 - 2 @ case 3
	.2byte _02228BC8 - _02228BA0 - 2 @ case 4
	.2byte _02228BDC - _02228BA0 - 2 @ case 5
	.2byte _02228BD2 - _02228BA0 - 2 @ case 6
	.2byte _02228BE6 - _02228BA0 - 2 @ case 7
	.2byte _02228BEE - _02228BA0 - 2 @ case 8
	.2byte _02228C0C - _02228BA0 - 2 @ case 9
_02228BB4:
	ldr r0, _02228C24 @ =0x00000024
	ldr r1, _02228C28 @ =0x021E5C04
	bl FUN_02000EF4
	pop {r3, pc}
_02228BBE:
	ldr r0, _02228C24 @ =0x00000024
	ldr r1, _02228C2C @ =0x021E5C24
	bl FUN_02000EF4
	pop {r3, pc}
_02228BC8:
	ldr r0, _02228C30 @ =0x0000004A
	ldr r1, _02228C34 @ =0x0223B380
	bl FUN_02000EF4
	pop {r3, pc}
_02228BD2:
	ldr r0, _02228C30 @ =0x0000004A
	ldr r1, _02228C38 @ =0x0223B4D8
	bl FUN_02000EF4
	pop {r3, pc}
_02228BDC:
	ldr r0, _02228C30 @ =0x0000004A
	ldr r1, _02228C3C @ =0x0223B320
	bl FUN_02000EF4
	pop {r3, pc}
_02228BE6:
	ldr r0, _02228C40 @ =0x0223BD4C
	bl FUN_02027098
	pop {r3, pc}
_02228BEE:
	bl FUN_02005FA0
	movs r0, #0
	ldr r1, _02228C44 @ =0x021065C4
	mvns r0, r0
	bl FUN_02000EF4
	pop {r3, pc}
_02228BFE:
	bl FUN_02005FA0
	ldr r0, _02228C48 @ =0x00000070
	ldr r1, _02228C4C @ =0x021F5728
	bl FUN_02000EF4
	pop {r3, pc}
_02228C0C:
	bl FUN_02005FA0
	ldr r0, _02228C50 @ =0x0000004B
	ldr r1, _02228C54 @ =0x02249964
	bl FUN_02000EF4
	pop {r3, pc}
_02228C1A:
	ldr r0, _02228C58 @ =0x0000003C
	ldr r1, _02228C5C @ =0x021EAFE0
	bl FUN_02000EF4
_02228C22:
	pop {r3, pc}
	.align 2, 0
_02228C24: .4byte 0x00000024
_02228C28: .4byte 0x021E5C04
_02228C2C: .4byte 0x021E5C24
_02228C30: .4byte 0x0000004A
_02228C34: .4byte 0x0223B380
_02228C38: .4byte 0x0223B4D8
_02228C3C: .4byte 0x0223B320
_02228C40: .4byte 0x0223BD4C
_02228C44: .4byte 0x021065C4
_02228C48: .4byte 0x00000070
_02228C4C: .4byte 0x021F5728
_02228C50: .4byte 0x0000004B
_02228C54: .4byte 0x02249964
_02228C58: .4byte 0x0000003C
_02228C5C: .4byte 0x021EAFE0
	thumb_func_end ov74_02228B8C

	thumb_func_start ov74_02228C60
ov74_02228C60: @ 0x02228C60
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02007290
	bl ov74_02228B8C
	adds r0, r4, #0
	bl FUN_02007294
	movs r0, #0x4f
	bl FUN_0201A9C4
	movs r0, #0
	bl ov74_02236034
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_02228C60

	thumb_func_start ov74_02228C84
ov74_02228C84: @ 0x02228C84
	push {r3, r4}
	ldr r4, _02228CAC @ =0x0223BD68
	ldr r1, _02228CB0 @ =0x00000123
	movs r3, #0
_02228C8C:
	ldrh r2, [r4, #2]
	cmp r0, r2
	bne _02228C9C
	ldr r0, _02228CAC @ =0x0223BD68
	lsls r1, r3, #2
	ldrh r0, [r0, r1]
	pop {r3, r4}
	bx lr
_02228C9C:
	adds r3, r3, #1
	adds r4, r4, #4
	cmp r3, r1
	blo _02228C8C
	movs r0, #0x3f
	pop {r3, r4}
	bx lr
	nop
_02228CAC: .4byte 0x0223BD68
_02228CB0: .4byte 0x00000123
	thumb_func_end ov74_02228C84

	thumb_func_start ov74_02228CB4
ov74_02228CB4: @ 0x02228CB4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r1, _02228D1C @ =0x00002710
	adds r0, r4, #0
	blx FUN_020F2998
	adds r0, #0x30
	strh r0, [r5]
	ldr r1, _02228D1C @ =0x00002710
	adds r0, r4, #0
	blx FUN_020F2998
	adds r4, r1, #0
	movs r1, #0xfa
	adds r0, r4, #0
	lsls r1, r1, #2
	blx FUN_020F2998
	adds r0, #0x30
	movs r1, #0xfa
	strh r0, [r5, #2]
	adds r0, r4, #0
	lsls r1, r1, #2
	blx FUN_020F2998
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #0x64
	blx FUN_020F2998
	adds r0, #0x30
	strh r0, [r5, #4]
	adds r0, r4, #0
	movs r1, #0x64
	blx FUN_020F2998
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #0xa
	blx FUN_020F2998
	adds r0, #0x30
	strh r0, [r5, #6]
	adds r0, r4, #0
	movs r1, #0xa
	blx FUN_020F2998
	adds r4, r1, #0
	adds r4, #0x30
	strh r4, [r5, #8]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02228D1C: .4byte 0x00002710
	thumb_func_end ov74_02228CB4

	thumb_func_start ov74_02228D20
ov74_02228D20: @ 0x02228D20
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7, #0x10]
	bl FUN_02028F54
	ldr r5, _02228D58 @ =0x0223D080
	adds r4, r0, #0
	movs r6, #0
_02228D30:
	ldrh r0, [r4]
	bl ov74_02228C84
	strh r0, [r5]
	adds r6, r6, #1
	adds r4, r4, #2
	adds r5, r5, #2
	cmp r6, #8
	blt _02228D30
	ldr r0, [r7, #0x10]
	bl FUN_02028F88
	adds r1, r0, #0
	ldr r0, _02228D5C @ =0x0223D090
	bl ov74_02228CB4
	ldr r0, _02228D60 @ =0x0223D080
	movs r1, #0
	strh r1, [r0, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02228D58: .4byte 0x0223D080
_02228D5C: .4byte 0x0223D090
_02228D60: .4byte 0x0223D080
	thumb_func_end ov74_02228D20

	thumb_func_start ov74_02228D64
ov74_02228D64: @ 0x02228D64
	push {r3, r4, r5, lr}
	sub sp, #0x48
	ldr r5, _02228E90 @ =0x0223B340
	adds r4, r0, #0
	add r3, sp, #0x20
	movs r2, #5
_02228D70:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02228D70
	ldr r3, _02228E94 @ =0x0223B330
	add r2, sp, #0x10
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	add r0, sp, #0x20
	bl FUN_02022BE8
	add r0, sp, #0x10
	bl FUN_0201ACB0
	movs r1, #0
	str r1, [sp]
	movs r3, #0xf
	ldr r0, [r4, #4]
	movs r2, #1
	lsls r3, r3, #0xc
	bl ov74_02235308
	movs r0, #1
	lsls r0, r0, #0xe
	str r0, [sp]
	movs r1, #1
	movs r3, #0x3e
	ldr r0, [r4, #4]
	adds r2, r1, #0
	lsls r3, r3, #0xa
	bl ov74_02235308
	movs r0, #0
	str r0, [sp]
	movs r3, #0x1e
	ldr r0, [r4, #4]
	movs r1, #4
	movs r2, #1
	lsls r3, r3, #0xa
	bl ov74_02235308
	movs r0, #1
	lsls r0, r0, #0xe
	str r0, [sp]
	movs r3, #7
	ldr r0, [r4, #4]
	movs r1, #5
	movs r2, #1
	lsls r3, r3, #0xc
	bl ov74_02235308
	bl FUN_02020080
	movs r0, #0
	ldr r2, [r4]
	adds r1, r0, #0
	bl FUN_02003030
	movs r1, #0
	str r1, [sp]
	ldr r0, [r4]
	movs r2, #1
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	adds r3, r2, #0
	bl FUN_0200E3DC
	ldr r0, [r4, #0x14]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4]
	movs r1, #0
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	movs r2, #0xa
	movs r3, #2
	bl FUN_0200E644
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	movs r1, #0
	str r0, [sp, #4]
	movs r0, #0x71
	adds r3, r0, #0
	adds r2, r1, #0
	adds r3, #0x8f
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #5
	lsls r0, r0, #0xa
	movs r1, #1
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4]
	adds r3, r1, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	movs r0, #0x71
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	ldr r0, [r4]
	movs r1, #2
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	movs r0, #0x71
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	movs r2, #0
	ldr r0, [r4, #4]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201CA4C
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_0201BF7C
	adds r0, r4, #0
	bl ov74_02228E98
	add sp, #0x48
	pop {r3, r4, r5, pc}
	nop
_02228E90: .4byte 0x0223B340
_02228E94: .4byte 0x0223B330
	thumb_func_end ov74_02228D64

	thumb_func_start ov74_02228E98
ov74_02228E98: @ 0x02228E98
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	movs r2, #4
	adds r3, r2, #0
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0
	adds r3, #0xfc
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #5
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	ldr r0, [r4]
	movs r3, #4
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	movs r0, #0x71
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #2
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	movs r0, #0x71
	movs r3, #4
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	movs r2, #0
	ldr r0, [r4, #4]
	movs r1, #4
	adds r3, r2, #0
	bl FUN_0201CA4C
	ldr r0, [r4, #4]
	movs r1, #4
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_02228E98

	thumb_func_start ov74_02228F14
ov74_02228F14: @ 0x02228F14
	push {r3, r4, lr}
	sub sp, #0x5c
	adds r4, r0, #0
	adds r0, #0x18
	bl FUN_0201D3F0
	cmp r0, #0
	bne _02228F5E
	movs r0, #1
	str r0, [sp]
	adds r1, r4, #0
	str r0, [sp, #4]
	add r0, sp, #8
	adds r1, #0x18
	movs r2, #0
	movs r3, #0x11
	bl ov74_02235414
	movs r3, #0x51
	lsls r3, r3, #2
	ldr r3, [r4, r3]
	add r0, sp, #8
	movs r1, #0x16
	movs r2, #0x10
	bl ov74_02235464
	movs r0, #2
	str r0, [sp]
	ldr r0, [r4, #4]
	add r1, sp, #8
	movs r2, #5
	movs r3, #4
	bl ov74_02235568
	add sp, #0x5c
	movs r0, #1
	pop {r3, r4, pc}
_02228F5E:
	ldr r0, _02228F88 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _02228F80
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #0
	bl FUN_0200E5D4
	adds r4, #0x18
	adds r0, r4, #0
	bl FUN_0201D520
	add sp, #0x5c
	movs r0, #0
	pop {r3, r4, pc}
_02228F80:
	movs r0, #1
	add sp, #0x5c
	pop {r3, r4, pc}
	nop
_02228F88: .4byte 0x021D110C
	thumb_func_end ov74_02228F14

	thumb_func_start ov74_02228F8C
ov74_02228F8C: @ 0x02228F8C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x48
	adds r1, #0x28
	movs r2, #0
	movs r3, #0xf7
	bl ov74_02235414
	movs r3, #0x51
	lsls r3, r3, #2
	adds r0, r4, #0
	ldr r3, [r4, r3]
	adds r0, #0x48
	movs r1, #0x1b
	movs r2, #4
	bl ov74_02235464
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x48
	adds r2, r1, #0
	bl ov74_0223546C
	movs r0, #0x48
	str r0, [sp]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x48
	movs r2, #2
	movs r3, #0x13
	bl ov74_02235568
	adds r0, r4, #0
	adds r0, #0x48
	bl ov74_02235634
	movs r1, #0x51
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	movs r3, #0xf7
	adds r0, r2, r0
	str r0, [r4, r1]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x9c
	adds r1, #0x18
	movs r2, #0
	bl ov74_02235414
	movs r3, #0x51
	lsls r3, r3, #2
	adds r0, r4, #0
	ldr r3, [r4, r3]
	adds r0, #0x9c
	movs r1, #0x1e
	movs r2, #4
	bl ov74_02235464
	adds r0, r4, #0
	adds r0, #0x9c
	movs r1, #0
	movs r2, #1
	bl ov74_0223546C
	movs r0, #0xb
	str r0, [sp]
	adds r1, r4, #0
	movs r2, #1
	ldr r0, [r4, #4]
	adds r1, #0x9c
	adds r3, r2, #0
	bl ov74_02235568
	adds r0, r4, #0
	adds r0, #0x9c
	bl ov74_02235634
	movs r1, #0x51
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	adds r0, r2, r0
	str r0, [r4, r1]
	bl ov74_0223563C
	bl ov74_02235690
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0xe
	movs r2, #0xb
	movs r3, #0xd
	bl ov74_02235728
	movs r0, #1
	str r0, [sp]
	ldr r1, _02229080 @ =0x00003170
	movs r0, #0
	ldr r1, [r4, r1]
	movs r2, #0x80
	movs r3, #0x4c
	bl ov74_02235930
	ldr r1, _02229080 @ =0x00003170
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov74_02229084
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_02229080: .4byte 0x00003170
	thumb_func_end ov74_02228F8C

	thumb_func_start ov74_02229084
ov74_02229084: @ 0x02229084
	push {r3, r4, r5, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [r5]
	bl FUN_0200BD08
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xf0
	adds r1, #0x38
	movs r2, #0
	movs r3, #0xf7
	bl ov74_02235414
	movs r3, #0x51
	lsls r3, r3, #2
	adds r0, r5, #0
	ldr r3, [r5, r3]
	adds r0, #0xf0
	movs r1, #0x1a
	movs r2, #4
	bl ov74_02235464
	adds r0, r5, #0
	adds r0, #0xf0
	movs r1, #0
	movs r2, #1
	bl ov74_0223546C
	movs r0, #0x41
	lsls r0, r0, #2
	str r4, [r5, r0]
	ldr r2, [r5, #0x10]
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0200BE48
	ldr r0, [r5, #0x10]
	bl FUN_02028F88
	adds r2, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r1, #1
	adds r0, r4, #0
	movs r3, #5
	str r1, [sp, #4]
	bl FUN_0200BFCC
	movs r0, #0x44
	str r0, [sp]
	adds r1, r5, #0
	ldr r0, [r5, #4]
	adds r1, #0xf0
	movs r2, #3
	movs r3, #0xd
	bl ov74_02235568
	adds r1, r5, #0
	movs r0, #0
	adds r1, #0xf8
	str r0, [r1]
	movs r1, #1
	bl FUN_02002FAC
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0xf0
	movs r1, #0
	bl ov74_02235474
	movs r2, #0x46
	str r2, [sp]
	adds r1, r5, #0
	subs r2, #0x47
	ldr r0, [r5, #4]
	adds r1, #0xf0
	adds r3, r2, #0
	bl ov74_02235568
	add r0, sp, #0x10
	blx FUN_020D3C40
	add r0, sp, #0x10
	bl ov74_022311F4
	add r1, sp, #0x1c
	add r2, sp, #0x18
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	bl ov74_02231238
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x1c]
	adds r0, r4, #0
	movs r1, #0
	movs r3, #4
	bl FUN_0200BFCC
	movs r0, #2
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r2, [sp, #0x18]
	adds r0, r4, #0
	movs r3, #4
	bl FUN_0200BFCC
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0xfc
	str r1, [r0]
	movs r2, #0x47
	str r2, [sp]
	ldr r0, [r5, #4]
	adds r5, #0xf0
	subs r2, #0x48
	adds r1, r5, #0
	adds r3, r2, #0
	bl ov74_02235568
	adds r0, r4, #0
	bl FUN_0200BDA0
	add sp, #0x20
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov74_02229084

	thumb_func_start ov74_02229190
ov74_02229190: @ 0x02229190
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	bl ov74_022359BC
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_0201D3F0
	cmp r0, #1
	bne _022291D8
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x28
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #0x28
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x38
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #0x38
	bl FUN_0201D520
_022291D8:
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #4]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4, #4]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [r4, #4]
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov74_02229190

	thumb_func_start ov74_02229200
ov74_02229200: @ 0x02229200
	push {r3, r4, r5, lr}
	movs r3, #2
	ldr r2, _02229288 @ =0x000034DC
	movs r1, #0x53
	lsls r3, r3, #0x10
	adds r5, r0, #0
	bl ov74_022352D0
	adds r4, r0, #0
	movs r0, #0x53
	str r0, [r4]
	bl FUN_0201AC88
	str r0, [r4, #4]
	adds r0, r5, #0
	bl FUN_020072A4
	ldr r0, [r0, #8]
	str r0, [r4, #8]
	bl FUN_02028E9C
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	bl FUN_0202A634
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	bl FUN_02028EA8
	str r0, [r4, #0x14]
	ldr r0, [r4]
	bl ov74_022352A0
	ldr r0, [r4, #8]
	bl FUN_020270E4
	ldr r1, _0222928C @ =0x00003174
	movs r2, #0x53
	str r0, [r4, r1]
	movs r0, #9
	lsls r2, r2, #2
	str r0, [r4, r2]
	adds r0, r2, #0
	movs r1, #0x28
	subs r0, #8
	str r1, [r4, r0]
	adds r1, r2, #0
	movs r0, #0
	adds r1, #8
	str r0, [r4, r1]
	adds r1, r2, #0
	adds r1, #0x10
	str r0, [r4, r1]
	adds r2, #0xc
	str r0, [r4, r2]
	movs r2, #0x57
	movs r1, #0x59
	lsls r2, r2, #4
	bl FUN_0201A910
	ldr r1, _02229290 @ =0x0000047E
	movs r0, #9
	movs r2, #1
	bl FUN_02004EC4
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_02229288: .4byte 0x000034DC
_0222928C: .4byte 0x00003174
_02229290: .4byte 0x0000047E
	thumb_func_end ov74_02229200

	thumb_func_start ov74_02229294
ov74_02229294: @ 0x02229294
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r1, #0
	adds r6, r0, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #0xd
	bhi _022292FA
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022292B4: @ jump table
	.2byte _022292D0 - _022292B4 - 2 @ case 0
	.2byte _022292F2 - _022292B4 - 2 @ case 1
	.2byte _02229310 - _022292B4 - 2 @ case 2
	.2byte _02229362 - _022292B4 - 2 @ case 3
	.2byte _0222938E - _022292B4 - 2 @ case 4
	.2byte _022293CA - _022292B4 - 2 @ case 5
	.2byte _02229404 - _022292B4 - 2 @ case 6
	.2byte _02229434 - _022292B4 - 2 @ case 7
	.2byte _02229434 - _022292B4 - 2 @ case 8
	.2byte _02229434 - _022292B4 - 2 @ case 9
	.2byte _02229434 - _022292B4 - 2 @ case 10
	.2byte _0222941A - _022292B4 - 2 @ case 11
	.2byte _02229422 - _022292B4 - 2 @ case 12
	.2byte _0222942E - _022292B4 - 2 @ case 13
_022292D0:
	bl ov74_02228D64
	ldr r0, [r4, #0xc]
	bl FUN_0202A5F4
	cmp r0, #0
	bne _022292EC
	movs r0, #1
	adds r1, r0, #0
	adds r2, r5, #0
	movs r3, #0xd
	bl ov74_0223539C
	b _02229434
_022292EC:
	movs r0, #2
	str r0, [r5]
	b _02229434
_022292F2:
	bl ov74_02228F14
	cmp r0, #0
	beq _022292FC
_022292FA:
	b _02229434
_022292FC:
	movs r0, #1
	bl ov74_02235390
	movs r0, #0
	movs r1, #0xc
	adds r2, r5, #0
	movs r3, #0xd
	bl ov74_0223539C
	b _02229434
_02229310:
	bl ov74_02228F8C
	ldr r0, _02229440 @ =0x00003174
	ldr r0, [r4, r0]
	bl FUN_0202DE14
	cmp r0, #0
	bne _0222934C
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x98
	str r1, [r0]
	movs r0, #0x16
	str r0, [sp]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x48
	movs r2, #2
	movs r3, #0x13
	bl ov74_02235568
	ldr r1, _02229444 @ =0x0000317C
	adds r2, r5, #0
	str r0, [r4, r1]
	movs r0, #1
	movs r1, #3
	movs r3, #0xd
	bl ov74_0223539C
	b _02229434
_0222934C:
	movs r0, #0x53
	movs r1, #7
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #1
	movs r1, #4
	adds r2, r5, #0
	movs r3, #0xd
	bl ov74_0223539C
	b _02229434
_02229362:
	ldr r0, _02229444 @ =0x0000317C
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02229434
	ldr r0, _02229448 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r1, r0
	beq _02229434
	bl ov74_02235390
	movs r0, #0
	movs r1, #0xc
	adds r2, r5, #0
	movs r3, #0xd
	bl ov74_0223539C
	b _02229434
_0222938E:
	bl ov74_0222962C
	movs r1, #0x15
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #5
	bne _022293B2
	movs r0, #1
	bl ov74_02235390
	movs r0, #0
	movs r1, #0xc
	adds r2, r5, #0
	movs r3, #0xd
	bl ov74_0223539C
	b _02229434
_022293B2:
	cmp r0, #4
	bne _02229434
	movs r0, #1
	bl ov74_02235390
	movs r0, #0
	movs r1, #0xc
	adds r2, r5, #0
	movs r3, #0xd
	bl ov74_0223539C
	b _02229434
_022293CA:
	bl ov74_02228E98
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	movs r1, #0xc6
	lsls r1, r1, #6
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #0x53
	bl ov74_0222EC08
	movs r0, #1
	movs r1, #6
	adds r2, r5, #0
	movs r3, #0xd
	bl ov74_0223539C
	ldr r1, _0222944C @ =0x000032D2
	movs r0, #4
	ldrb r2, [r4, r1]
	bics r2, r0
	strb r2, [r4, r1]
	b _02229434
_02229404:
	ldr r0, _02229448 @ =0x021D110C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _02229434
	movs r0, #0
	movs r1, #0xb
	adds r2, r5, #0
	movs r3, #0xd
	bl ov74_0223539C
	b _02229434
_0222941A:
	movs r0, #0
	blx FUN_020D3B84
	b _02229434
_02229422:
	adds r0, r6, #0
	bl ov74_02229190
	add sp, #4
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0222942E:
	adds r0, r5, #0
	bl ov74_022353FC
_02229434:
	bl ov74_022358BC
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02229440: .4byte 0x00003174
_02229444: .4byte 0x0000317C
_02229448: .4byte 0x021D110C
_0222944C: .4byte 0x000032D2
	thumb_func_end ov74_02229294

	thumb_func_start ov74_02229450
ov74_02229450: @ 0x02229450
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x59
	bl FUN_0201A9C4
	ldr r0, _02229474 @ =0x0000003C
	ldr r1, _02229478 @ =0x021EAFE0
	bl FUN_02000EF4
	adds r0, r4, #0
	bl FUN_02007294
	movs r0, #0x53
	bl FUN_0201A9C4
	movs r0, #1
	pop {r4, pc}
	nop
_02229474: .4byte 0x0000003C
_02229478: .4byte 0x021EAFE0
	thumb_func_end ov74_02229450

	thumb_func_start ov74_0222947C
ov74_0222947C: @ 0x0222947C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r0, #0xc6
	lsls r0, r0, #6
	adds r4, r5, r0
	movs r2, #0xd6
	adds r0, r4, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020D4994
	ldr r3, [r5]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xf7
	bl FUN_0200BAF8
	adds r6, r0, #0
	ldr r0, [r5]
	bl FUN_0200BD08
	movs r1, #0xc6
	movs r2, #7
	lsls r1, r1, #6
	strh r2, [r5, r1]
	ldr r3, [r5]
	adds r1, r6, #0
	movs r2, #0x4e
	str r0, [sp]
	bl FUN_0200BC4C
	movs r1, #0x41
	lsls r1, r1, #2
	adds r7, r0, #0
	adds r1, r4, r1
	movs r2, #0x24
	bl FUN_02026A68
	adds r0, r7, #0
	bl FUN_02026380
	movs r0, #8
	bl ov74_02235A68
	adds r7, r0, #0
	movs r0, #7
	bl ov74_02235A68
	str r0, [sp, #4]
	movs r0, #0xc
	bl ov74_02235A68
	str r0, [sp, #8]
	movs r0, #0xa
	bl ov74_02235A68
	str r0, [sp, #0xc]
	movs r0, #0xb
	bl ov74_02235A68
	ldr r1, [sp, #0xc]
	movs r2, #0x53
	orrs r1, r0
	ldr r0, [sp, #8]
	lsls r2, r2, #2
	orrs r1, r0
	ldr r0, [sp, #4]
	movs r3, #1
	orrs r0, r1
	orrs r0, r7
	str r0, [r4, r2]
	movs r1, #1
	adds r0, r2, #4
	strh r1, [r4, r0]
	adds r0, r2, #6
	adds r1, r0, #0
	ldrb r1, [r4, r1]
	bics r1, r3
	adds r3, r0, #0
	strb r1, [r4, r3]
	adds r1, r0, #0
	ldrb r1, [r4, r1]
	movs r3, #2
	bics r1, r3
	adds r3, r0, #0
	strb r1, [r4, r3]
	adds r1, r0, #0
	ldrb r3, [r4, r1]
	movs r1, #4
	orrs r3, r1
	adds r1, r0, #0
	strb r3, [r4, r1]
	ldrb r3, [r4, r1]
	movs r1, #8
	orrs r3, r1
	adds r1, r0, #0
	strb r3, [r4, r1]
	ldrb r2, [r4, r0]
	movs r1, #0x20
	bics r2, r1
	strb r2, [r4, r0]
	ldr r0, [sp]
	ldr r3, [r5]
	adds r1, r6, #0
	movs r2, #0x4d
	bl FUN_0200BC4C
	movs r1, #0x55
	lsls r1, r1, #2
	adds r7, r0, #0
	adds r1, r4, r1
	movs r2, #0xfa
	bl FUN_02026A68
	adds r0, r7, #0
	bl FUN_02026380
	movs r0, #0xd2
	lsls r0, r0, #2
	movs r1, #0
	ldr r3, _022295C0 @ =0x000001EA
	strb r1, [r4, r0]
	adds r2, r0, #2
	strh r3, [r4, r2]
	adds r2, r0, #4
	strh r1, [r4, r2]
	adds r2, r0, #6
	strh r1, [r4, r2]
	adds r0, #8
	strb r1, [r4, r0]
	add r0, sp, #0x10
	bl FUN_02014780
	add r0, sp, #0x10
	blx FUN_020DC284
	movs r1, #0xd5
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [sp]
	bl FUN_0200BDA0
	adds r0, r6, #0
	bl FUN_0200BB44
	ldr r0, _022295C4 @ =0x00003174
	adds r1, r4, #0
	ldr r0, [r5, r0]
	movs r2, #3
	bl FUN_0202DC2C
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	ldr r0, [r5, #4]
	adds r1, r4, #0
	bl ov74_02235DC4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022295C0: .4byte 0x000001EA
_022295C4: .4byte 0x00003174
	thumb_func_end ov74_0222947C

	thumb_func_start ov74_022295C8
ov74_022295C8: @ 0x022295C8
	movs r2, #0x16
	lsls r2, r2, #4
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov74_022295C8

	thumb_func_start ov74_022295D0
ov74_022295D0: @ 0x022295D0
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r1, #0x16
	lsls r1, r1, #4
	adds r4, r3, #0
	ldr r3, [r0, r1]
	subs r3, r3, #1
	str r3, [r0, r1]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _022295F2
	bl ov74_02231008
	movs r0, #0x17
	str r0, [r5]
	movs r0, #0
	pop {r3, r4, r5, pc}
_022295F2:
	cmp r2, #0
	beq _0222960A
	bl ov74_02230FD4
	cmp r0, #0
	bne _0222960A
	bl ov74_02231008
	movs r0, #0x16
	str r0, [r5]
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222960A:
	cmp r4, #0
	beq _02229622
	ldr r0, _02229628 @ =0x021D110C
	ldr r0, [r0, #0x48]
	tst r0, r4
	beq _02229622
	bl ov74_02231008
	movs r0, #0x1a
	str r0, [r5]
	movs r0, #1
	pop {r3, r4, r5, pc}
_02229622:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_02229628: .4byte 0x021D110C
	thumb_func_end ov74_022295D0

	thumb_func_start ov74_0222962C
ov74_0222962C: @ 0x0222962C
	push {r3, r4, r5, lr}
	movs r5, #0x57
	lsls r5, r5, #2
	adds r4, r0, #0
	subs r0, r5, #4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02229652
	bl ov74_02230E7C
	movs r1, #3
	subs r0, r1, r0
	bl FUN_0203A930
	bl ov74_02230D28
	movs r0, #1
	bl ov74_022310B8
_02229652:
	ldr r0, [r4, r5]
	cmp r0, #0x1e
	bls _0222965A
	b _02229B52
_0222965A:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02229666: @ jump table
	.2byte _022296A4 - _02229666 - 2 @ case 0
	.2byte _022296BA - _02229666 - 2 @ case 1
	.2byte _022296E0 - _02229666 - 2 @ case 2
	.2byte _02229702 - _02229666 - 2 @ case 3
	.2byte _0222972C - _02229666 - 2 @ case 4
	.2byte _02229B52 - _02229666 - 2 @ case 5
	.2byte _02229B52 - _02229666 - 2 @ case 6
	.2byte _0222975E - _02229666 - 2 @ case 7
	.2byte _022297D4 - _02229666 - 2 @ case 8
	.2byte _022297F2 - _02229666 - 2 @ case 9
	.2byte _0222983C - _02229666 - 2 @ case 10
	.2byte _02229878 - _02229666 - 2 @ case 11
	.2byte _02229892 - _02229666 - 2 @ case 12
	.2byte _022298C6 - _02229666 - 2 @ case 13
	.2byte _02229908 - _02229666 - 2 @ case 14
	.2byte _02229928 - _02229666 - 2 @ case 15
	.2byte _02229940 - _02229666 - 2 @ case 16
	.2byte _0222995A - _02229666 - 2 @ case 17
	.2byte _022299B0 - _02229666 - 2 @ case 18
	.2byte _02229A38 - _02229666 - 2 @ case 19
	.2byte _02229A80 - _02229666 - 2 @ case 20
	.2byte _02229B52 - _02229666 - 2 @ case 21
	.2byte _02229AB4 - _02229666 - 2 @ case 22
	.2byte _02229AB8 - _02229666 - 2 @ case 23
	.2byte _02229B52 - _02229666 - 2 @ case 24
	.2byte _02229B52 - _02229666 - 2 @ case 25
	.2byte _02229B20 - _02229666 - 2 @ case 26
	.2byte _02229B52 - _02229666 - 2 @ case 27
	.2byte _02229AEC - _02229666 - 2 @ case 28
	.2byte _0222977A - _02229666 - 2 @ case 29
	.2byte _022297B8 - _02229666 - 2 @ case 30
_022296A4:
	adds r0, r4, #0
	bl ov74_02228D20
	bl FUN_02034D8C
	movs r0, #0x52
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	str r1, [r4, r5]
	b _02229B52
_022296BA:
	bl FUN_02034DB8
	cmp r0, #0
	beq _02229772
	movs r1, #0x5b
	lsls r1, r1, #2
	ldr r0, _022299FC @ =0x0223BD5C
	adds r1, r4, r1
	bl ov74_02230A84
	movs r0, #0x56
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	bl FUN_0203A880
	movs r0, #2
	str r0, [r4, r5]
	b _02229B52
_022296E0:
	bl ov74_02230D6C
	movs r1, #0x19
	adds r0, r4, #0
	lsls r1, r1, #6
	bl ov74_022295C8
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #0xa
	bl FUN_0200F0AC
	ldr r1, _02229A00 @ =0x000034D8
	str r0, [r4, r1]
	movs r0, #3
	str r0, [r4, r5]
	b _02229B52
_02229702:
	bl ov74_02230E94
	cmp r0, #0
	beq _0222971E
	subs r1, r0, #1
	movs r0, #0x59
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r1, _02229A04 @ =0x00000708
	adds r0, r4, #0
	bl ov74_022295C8
	movs r0, #4
	str r0, [r4, r5]
_0222971E:
	adds r0, r4, #0
	adds r1, r4, r5
	movs r2, #0
	movs r3, #2
	bl ov74_022295D0
	b _02229B52
_0222972C:
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov74_02230DB8
	cmp r0, #0
	beq _02229750
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov74_02230DF4
	movs r0, #7
	str r0, [r4, r5]
	movs r0, #0x16
	ldr r1, _02229A04 @ =0x00000708
	lsls r0, r0, #4
	str r1, [r4, r0]
_02229750:
	adds r0, r4, #0
	adds r1, r4, r5
	movs r2, #0
	movs r3, #2
	bl ov74_022295D0
	b _02229B52
_0222975E:
	adds r0, r4, #0
	adds r1, r4, r5
	movs r2, #0
	movs r3, #2
	bl ov74_022295D0
	bl ov74_02230FD4
	cmp r0, #0
	bne _02229774
_02229772:
	b _02229B52
_02229774:
	movs r0, #0x1d
	str r0, [r4, r5]
	b _02229B52
_0222977A:
	movs r0, #0x1f
	str r0, [sp]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x48
	movs r2, #2
	movs r3, #0x13
	bl ov74_02235568
	ldr r0, _02229A08 @ =0x00003170
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	ldr r0, _02229A00 @ =0x000034D8
	ldr r0, [r4, r0]
	bl FUN_0200F450
	ldr r0, _02229A00 @ =0x000034D8
	movs r1, #0
	str r1, [r4, r0]
	ldr r0, _02229A0C @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x16
	ldr r1, _02229A04 @ =0x00000708
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r0, #0x1e
	str r0, [r4, r5]
	b _02229B52
_022297B8:
	ldr r0, _02229A10 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _022297C6
	movs r0, #8
	str r0, [r4, r5]
_022297C6:
	adds r0, r4, #0
	adds r1, r4, r5
	movs r2, #1
	movs r3, #2
	bl ov74_022295D0
	b _02229B52
_022297D4:
	bl ov74_02230EB4
	movs r0, #9
	str r0, [r4, r5]
	movs r0, #0x16
	ldr r1, _02229A04 @ =0x00000708
	lsls r0, r0, #4
	str r1, [r4, r0]
	adds r0, r4, #0
	adds r1, r4, r5
	movs r2, #1
	movs r3, #2
	bl ov74_022295D0
	b _02229B52
_022297F2:
	bl ov74_02230F40
	cmp r0, #0
	beq _0222982E
	bl ov74_02230EE8
	movs r0, #0xa
	str r0, [r4, r5]
	movs r1, #0x32
	movs r0, #0x16
	lsls r1, r1, #6
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r0, #0x23
	str r0, [sp]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x48
	movs r2, #2
	movs r3, #0x13
	bl ov74_02235568
	ldr r0, _02229A0C @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _02229A00 @ =0x000034D8
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #1
	pop {r3, r4, r5, pc}
_0222982E:
	adds r0, r4, #0
	adds r1, r4, r5
	movs r2, #1
	movs r3, #2
	bl ov74_022295D0
	b _02229B52
_0222983C:
	bl ov74_02230F40
	cmp r0, #0
	beq _0222986A
	movs r0, #0x49
	str r0, [sp]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x48
	movs r2, #2
	movs r3, #0x13
	bl ov74_02235568
	ldr r0, _02229A08 @ =0x00003170
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_02024830
	adds r0, r4, #0
	bl ov74_02229084
	movs r0, #0xb
	str r0, [r4, r5]
_0222986A:
	adds r0, r4, #0
	adds r1, r4, r5
	movs r2, #1
	movs r3, #2
	bl ov74_022295D0
	b _02229B52
_02229878:
	ldr r0, _02229A14 @ =0x0223C1F4
	movs r1, #0x2a
	movs r2, #1
	bl ov74_02230F14
	movs r0, #0xc
	str r0, [r4, r5]
	movs r1, #0x32
	movs r0, #0x16
	lsls r1, r1, #6
	lsls r0, r0, #4
	str r1, [r4, r0]
	b _02229B52
_02229892:
	bl ov74_02230F6C
	cmp r0, #0
	beq _022298B8
	movs r0, #0xd
	str r0, [r4, r5]
	movs r0, #0x16
	movs r1, #0x3c
	lsls r0, r0, #4
	str r1, [r4, r0]
	movs r0, #0x49
	str r0, [sp]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x48
	movs r2, #2
	movs r3, #0x13
	bl ov74_02235568
_022298B8:
	adds r0, r4, #0
	adds r1, r4, r5
	movs r2, #1
	movs r3, #2
	bl ov74_022295D0
	b _02229B52
_022298C6:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02229938
	movs r0, #0x4a
	str r0, [sp]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x48
	movs r2, #2
	movs r3, #0x13
	bl ov74_02235568
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #0xa
	bl FUN_0200F0AC
	ldr r1, _02229A00 @ =0x000034D8
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov74_0222947C
	ldr r0, [r4, #8]
	bl ov74_022360A0
	movs r0, #0xe
	str r0, [r4, r5]
	b _02229B52
_02229908:
	bl ov74_022360B0
	cmp r0, #1
	bne _02229938
	movs r0, #0xf
	str r0, [r4, r5]
	blx FUN_020D3550
	movs r1, #0x36
	blx FUN_020F2998
	movs r0, #0x16
	adds r1, r1, #6
	lsls r0, r0, #4
	str r1, [r4, r0]
	b _02229B52
_02229928:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222993A
_02229938:
	b _02229B52
_0222993A:
	movs r0, #0x10
	str r0, [r4, r5]
	b _02229B52
_02229940:
	ldr r0, _02229A14 @ =0x0223C1F4
	movs r1, #0x2a
	movs r2, #2
	bl ov74_02230F14
	movs r0, #0x11
	str r0, [r4, r5]
	movs r1, #0x4b
	movs r0, #0x16
	lsls r1, r1, #4
	lsls r0, r0, #4
	str r1, [r4, r0]
	b _02229B52
_0222995A:
	bl ov74_02230F98
	cmp r0, #0
	beq _02229976
	bl ov74_02236128
	movs r0, #0x12
	str r0, [r4, r5]
	movs r1, #0x32
	movs r0, #0x16
	lsls r1, r1, #4
	lsls r0, r0, #4
	str r1, [r4, r0]
	b _02229B52
_02229976:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02229996
	bl ov74_02231008
	movs r0, #0x17
	movs r1, #0x78
	str r0, [r4, r5]
	adds r0, r1, #0
	adds r0, #0xe8
	str r1, [r4, r0]
_02229996:
	bl ov74_02230FD4
	cmp r0, #0
	bne _02229A48
	bl ov74_02231008
	movs r0, #0x16
	movs r1, #0x78
	str r0, [r4, r5]
	adds r0, r1, #0
	adds r0, #0xe8
	str r1, [r4, r0]
	b _02229B52
_022299B0:
	bl ov74_0223615C
	cmp r0, #3
	bne _022299CA
	bl ov74_02231008
	movs r0, #0x16
	movs r1, #0x78
	str r0, [r4, r5]
	adds r0, r1, #0
	adds r0, #0xe8
	str r1, [r4, r0]
	b _02229A18
_022299CA:
	bl ov74_0223615C
	cmp r0, #2
	beq _022299D8
	bl ov74_022360B0
	b _02229A18
_022299D8:
	bl ov74_02230F6C
	cmp r0, #0
	bne _022299E8
	bl ov74_02230FD4
	cmp r0, #0
	bne _02229A18
_022299E8:
	movs r0, #0x13
	str r0, [r4, r5]
	movs r0, #0x16
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r4, r0]
	bl ov74_02231008
	b _02229B52
	nop
_022299FC: .4byte 0x0223BD5C
_02229A00: .4byte 0x000034D8
_02229A04: .4byte 0x00000708
_02229A08: .4byte 0x00003170
_02229A0C: .4byte 0x000005DC
_02229A10: .4byte 0x021D110C
_02229A14: .4byte 0x0223C1F4
_02229A18:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02229A38
	bl ov74_02231008
	movs r0, #0x17
	str r0, [r4, r5]
	movs r0, #0x16
	movs r1, #0xa
	lsls r0, r0, #4
	str r1, [r4, r0]
_02229A38:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02229A4A
_02229A48:
	b _02229B52
_02229A4A:
	movs r0, #0x14
	str r0, [r4, r5]
	movs r0, #0x4b
	str r0, [sp]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x48
	movs r2, #2
	movs r3, #0x13
	bl ov74_02235568
	ldr r0, _02229B58 @ =0x00003170
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	ldr r0, _02229B5C @ =0x000034D8
	ldr r0, [r4, r0]
	bl FUN_0200F450
	ldr r0, _02229B60 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _02229B5C @ =0x000034D8
	movs r1, #0
	str r1, [r4, r0]
	b _02229B52
_02229A80:
	bl ov74_02231048
	cmp r0, #0
	beq _02229B52
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02229AA2
	bl FUN_02034DE0
	bl FUN_0203A914
	movs r0, #0x52
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_02229AA2:
	ldr r0, _02229B64 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _02229B52
	movs r0, #0x1b
	str r0, [r4, r5]
	movs r0, #4
	pop {r3, r4, r5, pc}
_02229AB4:
	movs r0, #0x17
	str r0, [r4, r5]
_02229AB8:
	movs r0, #0x4c
	str r0, [sp]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x48
	movs r2, #2
	movs r3, #0x13
	bl ov74_02235568
	ldr r0, _02229B58 @ =0x00003170
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	ldr r0, _02229B5C @ =0x000034D8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02229AE0
	bl FUN_0200F450
_02229AE0:
	ldr r0, _02229B5C @ =0x000034D8
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #0x1c
	str r0, [r4, r5]
	b _02229B52
_02229AEC:
	bl ov74_02231048
	cmp r0, #0
	beq _02229B52
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02229B0E
	bl FUN_02034DE0
	bl FUN_0203A914
	movs r0, #0x52
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_02229B0E:
	ldr r0, _02229B64 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _02229B52
	movs r0, #0
	blx FUN_020D3B84
	b _02229B52
_02229B20:
	bl ov74_02231048
	cmp r0, #0
	beq _02229B52
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02229B52
	bl FUN_02034DE0
	bl FUN_0203A914
	movs r0, #0x52
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _02229B5C @ =0x000034D8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02229B4E
	bl FUN_0200F450
_02229B4E:
	movs r0, #5
	pop {r3, r4, r5, pc}
_02229B52:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_02229B58: .4byte 0x00003170
_02229B5C: .4byte 0x000034D8
_02229B60: .4byte 0x000005DC
_02229B64: .4byte 0x021D110C
	thumb_func_end ov74_0222962C

	thumb_func_start ov74_02229B68
ov74_02229B68: @ 0x02229B68
	push {r4, lr}
	ldr r1, _02229BB8 @ =0x0223D0A4
	adds r4, r0, #0
	ldr r1, [r1]
	cmp r1, #0
	bne _02229BB4
	bl ov74_02229E14
	movs r1, #0xf5
	movs r0, #0xf
	lsls r1, r1, #2
	bl FUN_0201AA8C
	ldr r1, _02229BB8 @ =0x0223D0A4
	movs r2, #0xf5
	str r0, [r1]
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020D4994
	ldr r0, _02229BB8 @ =0x0223D0A4
	movs r1, #0x32
	ldr r0, [r0]
	movs r2, #0xa
	strh r1, [r0, #0x24]
	ldr r0, _02229BBC @ =ov74_02229CB8
	movs r1, #0
	bl FUN_0200E320
	ldr r1, _02229BB8 @ =0x0223D0A4
	ldr r2, [r1]
	str r0, [r2, #0x1c]
	ldr r0, [r1]
	str r4, [r0]
	ldr r0, [r1]
	adds r0, r0, #4
	bl FUN_0203778C
_02229BB4:
	pop {r4, pc}
	nop
_02229BB8: .4byte 0x0223D0A4
_02229BBC: .4byte ov74_02229CB8
	thumb_func_end ov74_02229B68

	thumb_func_start ov74_02229BC0
ov74_02229BC0: @ 0x02229BC0
	ldr r2, _02229BCC @ =0x0223D0A4
	ldr r3, [r2]
	str r0, [r3, #0x20]
	ldr r0, [r2]
	strh r1, [r0, #0x24]
	bx lr
	.align 2, 0
_02229BCC: .4byte 0x0223D0A4
	thumb_func_end ov74_02229BC0

	thumb_func_start ov74_02229BD0
ov74_02229BD0: @ 0x02229BD0
	push {r4, lr}
	bl FUN_0203769C
	bl FUN_020373B4
	cmp r0, #0
	beq _02229BFE
	movs r4, #0
	ldr r1, _02229C00 @ =0x0223D0A4
	ldr r0, _02229C04 @ =0x000003C1
	adds r3, r4, #0
_02229BE6:
	ldr r2, [r1]
	adds r2, r2, r4
	adds r4, r4, #1
	strb r3, [r2, r0]
	cmp r4, #0x10
	blt _02229BE6
	bl FUN_02034434
	ldr r0, _02229C08 @ =ov74_02229C0C
	movs r1, #0
	bl ov74_02229BC0
_02229BFE:
	pop {r4, pc}
	.align 2, 0
_02229C00: .4byte 0x0223D0A4
_02229C04: .4byte 0x000003C1
_02229C08: .4byte ov74_02229C0C
	thumb_func_end ov74_02229BD0

	thumb_func_start ov74_02229C0C
ov74_02229C0C: @ 0x02229C0C
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r6, _02229C40 @ =0x0223D0A4
	adds r5, r4, #0
_02229C14:
	ldr r0, [r6]
	adds r0, r0, r5
	ldr r0, [r0, #0x28]
	cmp r0, #0
	bne _02229C36
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl FUN_020373B4
	cmp r0, #1
	bne _02229C36
	adds r0, r4, #0
	bl FUN_02034818
	ldr r1, [r6]
	adds r1, r1, r5
	str r0, [r1, #0x28]
_02229C36:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x10
	blt _02229C14
	pop {r4, r5, r6, pc}
	.align 2, 0
_02229C40: .4byte 0x0223D0A4
	thumb_func_end ov74_02229C0C

	thumb_func_start ov74_02229C44
ov74_02229C44: @ 0x02229C44
	push {r3, lr}
	bl FUN_02034DB8
	cmp r0, #0
	beq _02229C56
	ldr r0, _02229C58 @ =ov74_02229C5C
	movs r1, #0
	bl ov74_02229BC0
_02229C56:
	pop {r3, pc}
	.align 2, 0
_02229C58: .4byte ov74_02229C5C
	thumb_func_end ov74_02229C44

	thumb_func_start ov74_02229C5C
ov74_02229C5C: @ 0x02229C5C
	bx lr
	.align 2, 0
	thumb_func_end ov74_02229C5C

	thumb_func_start ov74_02229C60
ov74_02229C60: @ 0x02229C60
	push {r3, lr}
	ldr r0, _02229C78 @ =0x0223D0A4
	ldr r0, [r0]
	adds r0, #0x27
	ldrb r0, [r0]
	bl FUN_02037E1C
	ldr r0, _02229C7C @ =ov74_02229C80
	movs r1, #0
	bl ov74_02229BC0
	pop {r3, pc}
	.align 2, 0
_02229C78: .4byte 0x0223D0A4
_02229C7C: .4byte ov74_02229C80
	thumb_func_end ov74_02229C60

	thumb_func_start ov74_02229C80
ov74_02229C80: @ 0x02229C80
	push {r3, lr}
	bl FUN_02037EC8
	cmp r0, #0
	beq _02229CA8
	ldr r0, _02229CAC @ =0x0223D0A4
	movs r2, #0
	ldr r1, [r0]
	movs r0, #0xf
	lsls r0, r0, #6
	strb r2, [r1, r0]
	bl FUN_02034434
	movs r0, #0xab
	bl FUN_02037AC0
	ldr r0, _02229CB0 @ =ov74_02229CB4
	movs r1, #0
	bl ov74_02229BC0
_02229CA8:
	pop {r3, pc}
	nop
_02229CAC: .4byte 0x0223D0A4
_02229CB0: .4byte ov74_02229CB4
	thumb_func_end ov74_02229C80

	thumb_func_start ov74_02229CB4
ov74_02229CB4: @ 0x02229CB4
	bx lr
	.align 2, 0
	thumb_func_end ov74_02229CB4

	thumb_func_start ov74_02229CB8
ov74_02229CB8: @ 0x02229CB8
	push {r3, lr}
	ldr r1, _02229CDC @ =0x0223D0A4
	ldr r2, [r1]
	cmp r2, #0
	bne _02229CC8
	bl FUN_0200E390
	pop {r3, pc}
_02229CC8:
	ldr r1, [r2, #0x20]
	cmp r1, #0
	beq _02229CD8
	adds r2, #0x26
	ldrb r0, [r2]
	cmp r0, #0
	bne _02229CD8
	blx r1
_02229CD8:
	pop {r3, pc}
	nop
_02229CDC: .4byte 0x0223D0A4
	thumb_func_end ov74_02229CB8

	thumb_func_start ov74_02229CE0
ov74_02229CE0: @ 0x02229CE0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_02037474
	cmp r0, #0
	bne _02229D06
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_02038114
	adds r0, r5, #0
	bl ov74_02229B68
	ldr r0, _02229D08 @ =ov74_02229BD0
	movs r1, #0
	bl ov74_02229BC0
_02229D06:
	pop {r4, r5, r6, pc}
	.align 2, 0
_02229D08: .4byte ov74_02229BD0
	thumb_func_end ov74_02229CE0

	thumb_func_start ov74_02229D0C
ov74_02229D0C: @ 0x02229D0C
	adds r3, r0, #0
	adds r2, r1, #0
	adds r1, r3, #0
	ldr r3, _02229D18 @ =FUN_02037088
	movs r0, #0x16
	bx r3
	.align 2, 0
_02229D18: .4byte FUN_02037088
	thumb_func_end ov74_02229D0C

	thumb_func_start ov74_02229D1C
ov74_02229D1C: @ 0x02229D1C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02037474
	cmp r0, #0
	bne _02229D48
	bl ov74_0222CD7C
	bl FUN_020072A4
	ldr r0, [r0, #8]
	adds r1, r4, #0
	bl FUN_02038148
	adds r0, r5, #0
	bl ov74_02229B68
	ldr r0, _02229D4C @ =ov74_02229C44
	movs r1, #0
	bl ov74_02229BC0
_02229D48:
	pop {r3, r4, r5, pc}
	nop
_02229D4C: .4byte ov74_02229C44
	thumb_func_end ov74_02229D1C

	thumb_func_start ov74_02229D50
ov74_02229D50: @ 0x02229D50
	ldr r1, _02229D60 @ =0x0223D0A4
	ldr r3, _02229D64 @ =ov74_02229BC0
	ldr r1, [r1]
	adds r1, #0x27
	strb r0, [r1]
	ldr r0, _02229D68 @ =ov74_02229C60
	movs r1, #0
	bx r3
	.align 2, 0
_02229D60: .4byte 0x0223D0A4
_02229D64: .4byte ov74_02229BC0
_02229D68: .4byte ov74_02229C60
	thumb_func_end ov74_02229D50

	thumb_func_start ov74_02229D6C
ov74_02229D6C: @ 0x02229D6C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_02229D72:
	adds r0, r4, #0
	bl FUN_020358D0
	adds r1, r0, #0
	beq _02229D92
	adds r0, #0x4c
	ldrh r0, [r0]
	cmp r0, #0
	beq _02229D92
	adds r5, #0x8c
	adds r0, r5, #0
	movs r2, #0x50
	blx FUN_020E5AD8
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_02229D92:
	adds r4, r4, #1
	cmp r4, #0x10
	blt _02229D72
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov74_02229D6C

	thumb_func_start ov74_02229DA0
ov74_02229DA0: @ 0x02229DA0
	ldr r1, _02229DB8 @ =0x0223D0A4
	ldr r2, [r1]
	adds r1, r2, #0
	adds r1, #0x27
	ldrb r1, [r1]
	cmp r1, r0
	bne _02229DB6
	movs r0, #0xf
	movs r1, #1
	lsls r0, r0, #6
	strb r1, [r2, r0]
_02229DB6:
	bx lr
	.align 2, 0
_02229DB8: .4byte 0x0223D0A4
	thumb_func_end ov74_02229DA0

	thumb_func_start ov74_02229DBC
ov74_02229DBC: @ 0x02229DBC
	ldr r0, _02229DC8 @ =0x0223D0A4
	ldr r1, [r0]
	movs r0, #0xf
	lsls r0, r0, #6
	ldrb r0, [r1, r0]
	bx lr
	.align 2, 0
_02229DC8: .4byte 0x0223D0A4
	thumb_func_end ov74_02229DBC

	thumb_func_start ov74_02229DCC
ov74_02229DCC: @ 0x02229DCC
	movs r0, #0xd6
	lsls r0, r0, #2
	bx lr
	.align 2, 0
	thumb_func_end ov74_02229DCC

	thumb_func_start ov74_02229DD4
ov74_02229DD4: @ 0x02229DD4
	ldr r0, _02229DDC @ =0x0223D0A4
	ldr r0, [r0]
	adds r0, #0x68
	bx lr
	.align 2, 0
_02229DDC: .4byte 0x0223D0A4
	thumb_func_end ov74_02229DD4

	thumb_func_start ov74_02229DE0
ov74_02229DE0: @ 0x02229DE0
	ldr r1, _02229DF0 @ =0x0223D0A4
	movs r2, #1
	ldr r1, [r1]
	adds r1, r1, r0
	ldr r0, _02229DF4 @ =0x000003C1
	strb r2, [r1, r0]
	bx lr
	nop
_02229DF0: .4byte 0x0223D0A4
_02229DF4: .4byte 0x000003C1
	thumb_func_end ov74_02229DE0

	thumb_func_start ov74_02229DF8
ov74_02229DF8: @ 0x02229DF8
	push {r3, lr}
	ldr r1, _02229E10 @ =0x0223D0A4
	movs r0, #0xf
	ldr r1, [r1]
	bl FUN_0201AB80
	ldr r0, _02229E10 @ =0x0223D0A4
	movs r1, #0
	str r1, [r0]
	bl FUN_02037E9C
	pop {r3, pc}
	.align 2, 0
_02229E10: .4byte 0x0223D0A4
	thumb_func_end ov74_02229DF8

	thumb_func_start ov74_02229E14
ov74_02229E14: @ 0x02229E14
	ldr r3, _02229E20 @ =FUN_0203410C
	adds r2, r0, #0
	ldr r0, _02229E24 @ =0x0223B368
	movs r1, #2
	bx r3
	nop
_02229E20: .4byte FUN_0203410C
_02229E24: .4byte 0x0223B368
	thumb_func_end ov74_02229E14

	thumb_func_start ov74_02229E28
ov74_02229E28: @ 0x02229E28
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #1
	ldr r0, _02229E5C @ =0x000029F0
	bne _02229E48
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02229E58
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #1
	bl FUN_0200F0AC
	ldr r1, _02229E5C @ =0x000029F0
	str r0, [r4, r1]
	pop {r4, pc}
_02229E48:
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02229E52
	bl FUN_0200F478
_02229E52:
	ldr r0, _02229E5C @ =0x000029F0
	movs r1, #0
	str r1, [r4, r0]
_02229E58:
	pop {r4, pc}
	nop
_02229E5C: .4byte 0x000029F0
	thumb_func_end ov74_02229E28

	thumb_func_start ov74_02229E60
ov74_02229E60: @ 0x02229E60
	ldr r3, _02229E64 @ =ov74_02229E28
	bx r3
	.align 2, 0
_02229E64: .4byte ov74_02229E28
	thumb_func_end ov74_02229E60

	thumb_func_start ov74_02229E68
ov74_02229E68: @ 0x02229E68
	push {r3, r4, r5, r6, r7, lr}
	bl FUN_02007290
	adds r7, r0, #0
	bl ov74_022359BC
	ldr r0, [r7, #0x7c]
	cmp r0, #0
	beq _02229E7E
	bl FUN_02014950
_02229E7E:
	ldr r0, [r7, #0x78]
	cmp r0, #0
	beq _02229E8C
	movs r1, #0
	adds r2, r1, #0
	bl FUN_02001434
_02229E8C:
	adds r0, r7, #0
	adds r0, #0x18
	bl FUN_0201D8C8
	adds r0, r7, #0
	adds r0, #0x18
	bl FUN_0201D520
	adds r0, r7, #0
	adds r0, #0x58
	bl FUN_0201D3F0
	cmp r0, #0
	beq _02229EB8
	adds r0, r7, #0
	adds r0, #0x58
	bl FUN_0201D8C8
	adds r0, r7, #0
	adds r0, #0x58
	bl FUN_0201D520
_02229EB8:
	adds r5, r7, #0
	movs r6, #0
	adds r4, r7, #0
	adds r5, #0x28
_02229EC0:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _02229ED2
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
_02229ED2:
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, #0x10
	cmp r6, #3
	blt _02229EC0
	ldr r0, [r7]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r7]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r7]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r7]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [r7]
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_02229E68

	thumb_func_start ov74_02229F04
ov74_02229F04: @ 0x02229F04
	push {r3, lr}
	sub sp, #8
	bl ov74_0223563C
	bl ov74_02235690
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0xe
	movs r2, #0xb
	movs r3, #0xd
	bl ov74_02235728
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov74_02229F04

	thumb_func_start ov74_02229F28
ov74_02229F28: @ 0x02229F28
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _02229F4E
	str r1, [sp]
	ldr r1, _02229F5C @ =0x000005C4
	movs r0, #0
	ldr r1, [r4, r1]
	movs r2, #0x80
	movs r3, #0x64
	bl ov74_02235930
	ldr r1, _02229F5C @ =0x000005C4
	add sp, #4
	str r0, [r4, r1]
	pop {r3, r4, pc}
_02229F4E:
	ldr r0, _02229F5C @ =0x000005C4
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02229F5C: .4byte 0x000005C4
	thumb_func_end ov74_02229F28

	thumb_func_start ov74_02229F60
ov74_02229F60: @ 0x02229F60
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0201D3F0
	cmp r0, #1
	bne _02229F76
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0200E5D4
_02229F76:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_02229F60

	thumb_func_start ov74_02229F78
ov74_02229F78: @ 0x02229F78
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0201D3F0
	cmp r0, #1
	bne _02229F8E
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0200E9BC
_02229F8E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_02229F78

	thumb_func_start ov74_02229F90
ov74_02229F90: @ 0x02229F90
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, _02229FE8 @ =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #2
	beq _02229FAE
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x18
	movs r2, #3
	bl ov74_0222AA18
_02229FAE:
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	bl ov74_02229F60
	ldr r0, _02229FE8 @ =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #2
	beq _02229FDE
	adds r0, r4, #0
	movs r1, #0xf
	bl ov74_02229D1C
	ldr r1, _02229FEC @ =0x00001C20
	ldr r0, _02229FF0 @ =0x00000434
	str r1, [r4, r0]
	bl FUN_0203A880
	adds r0, r4, #0
	movs r1, #1
	bl ov74_02229E28
	movs r0, #7
	pop {r3, r4, r5, pc}
_02229FDE:
	movs r0, #0x13
	adds r4, #0x84
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_02229FE8: .4byte 0x000015D4
_02229FEC: .4byte 0x00001C20
_02229FF0: .4byte 0x00000434
	thumb_func_end ov74_02229F90

	thumb_func_start ov74_02229FF4
ov74_02229FF4: @ 0x02229FF4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, #0x80
	ldr r1, [r0]
	cmp r1, #1
	bne _0222A00A
	movs r0, #0x31
	pop {r3, r4, r5, pc}
_0222A00A:
	subs r0, r1, #2
	cmp r0, #2
	bhi _0222A014
	movs r0, #0x31
	pop {r3, r4, r5, pc}
_0222A014:
	cmp r1, #5
	bne _0222A01C
	movs r0, #0x31
	pop {r3, r4, r5, pc}
_0222A01C:
	ldr r0, _0222A070 @ =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0222A02C
	ldr r0, _0222A074 @ =0x00000438
	ldr r0, [r4, r0]
	bl ov74_02229D50
_0222A02C:
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x18
	movs r2, #6
	bl ov74_0222AA18
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	bl ov74_02229F60
	ldr r0, _0222A070 @ =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0222A05A
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229F28
	adds r0, r4, #0
	movs r1, #1
	bl ov74_02229E28
_0222A05A:
	ldr r0, _0222A070 @ =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0222A06C
	movs r0, #0xab
	bl FUN_02037AC0
	movs r0, #9
	pop {r3, r4, r5, pc}
_0222A06C:
	movs r0, #0x15
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222A070: .4byte 0x000015D4
_0222A074: .4byte 0x00000438
	thumb_func_end ov74_02229FF4

	thumb_func_start ov74_0222A078
ov74_0222A078: @ 0x0222A078
	push {r3, r4, r5, r6, r7, lr}
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, _0222A0DC @ =0x000015D4
	adds r5, r4, #0
	adds r6, r4, #0
	ldr r0, [r4, r0]
	adds r5, #0xdc
	adds r6, #0x8c
	cmp r0, #1
	beq _0222A096
	cmp r0, #3
	beq _0222A0BC
	b _0222A0D6
_0222A096:
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	bl ov74_02229DD4
	movs r2, #0xd6
	adds r1, r0, #0
	adds r0, r5, #0
	lsls r2, r2, #2
	blx FUN_020E5AD8
	adds r0, r4, #0
	adds r4, #0xdc
	adds r0, #0x8c
	adds r1, r4, #0
	movs r2, #0x54
	bl ov74_02235F58
	b _0222A0D6
_0222A0BC:
	ldr r7, _0222A0E0 @ =0x000005D4
	movs r2, #0xd6
	adds r1, r4, r7
	adds r0, r5, #0
	adds r1, #0x50
	lsls r2, r2, #2
	blx FUN_020E5AD8
	adds r0, r6, #0
	adds r1, r4, r7
	movs r2, #0x50
	blx FUN_020E5AD8
_0222A0D6:
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222A0DC: .4byte 0x000015D4
_0222A0E0: .4byte 0x000005D4
	thumb_func_end ov74_0222A078

	thumb_func_start ov74_0222A0E4
ov74_0222A0E4: @ 0x0222A0E4
	push {r3, lr}
	ldrh r1, [r0]
	cmp r1, #3
	bgt _0222A0FC
	cmp r1, #1
	blt _0222A12C
	beq _0222A10E
	cmp r1, #2
	beq _0222A10E
	cmp r1, #3
	beq _0222A104
	b _0222A12C
_0222A0FC:
	cmp r1, #0xd
	bne _0222A12C
	movs r0, #1
	pop {r3, pc}
_0222A104:
	ldr r0, [r0, #8]
	cmp r0, #1
	bne _0222A12C
	movs r0, #1
	pop {r3, pc}
_0222A10E:
	adds r0, #8
	movs r1, #0x98
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #3
	blt _0222A120
	cmp r0, #0xe
	ble _0222A128
_0222A120:
	cmp r0, #0x41
	blt _0222A12C
	cmp r0, #0x47
	bgt _0222A12C
_0222A128:
	movs r0, #1
	pop {r3, pc}
_0222A12C:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov74_0222A0E4

	thumb_func_start ov74_0222A130
ov74_0222A130: @ 0x0222A130
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222A168 @ =0x000029EC
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _0222A142
	movs r1, #0
	subs r0, r0, #4
	str r1, [r4, r0]
_0222A142:
	bl ov74_022360B0
	subs r0, r0, #2
	cmp r0, #1
	bhi _0222A164
	adds r0, r4, #0
	adds r0, #0xdc
	bl ov74_0222A0E4
	cmp r0, #1
	beq _0222A15E
	ldr r0, _0222A16C @ =0x0000061A
	bl FUN_0200604C
_0222A15E:
	ldr r0, _0222A170 @ =0x000029E8
	movs r1, #0
	str r1, [r4, r0]
_0222A164:
	pop {r4, pc}
	nop
_0222A168: .4byte 0x000029EC
_0222A16C: .4byte 0x0000061A
_0222A170: .4byte 0x000029E8
	thumb_func_end ov74_0222A130

	thumb_func_start ov74_0222A174
ov74_0222A174: @ 0x0222A174
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r5, r0, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r4, #0x8c
	adds r5, #0xdc
	bl FUN_020072A4
	ldr r0, [r0, #8]
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x4e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	bne _0222A1A2
	movs r6, #0
	b _0222A1CE
_0222A1A2:
	movs r1, #0x35
	adds r2, r4, #0
	movs r0, #0
	lsls r1, r1, #4
	strb r0, [r5, r1]
	adds r2, #0x4e
	ldrb r2, [r2]
	movs r6, #1
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x1f
	bne _0222A1BC
	subs r1, #8
	strb r0, [r5, r1]
_0222A1BC:
	add r0, sp, #8
	bl FUN_02014780
	add r0, sp, #8
	blx FUN_020DC284
	movs r1, #0xd5
	lsls r1, r1, #2
	str r0, [r5, r1]
_0222A1CE:
	ldr r0, [sp]
	bl FUN_020270E4
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r1, [r1]
	adds r7, r0, #0
	bl FUN_0202DFAC
	adds r4, #0x4e
	ldrb r0, [r4]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0222A204
	ldrh r0, [r5]
	cmp r0, #3
	bne _0222A204
	ldr r1, [r5, #4]
	ldr r0, _0222A234 @ =0x00000215
	cmp r1, r0
	bne _0222A204
	adds r0, r7, #0
	adds r1, r5, #0
	bl FUN_0202DD48
	b _0222A21C
_0222A204:
	cmp r6, #0
	bne _0222A214
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #3
	bl FUN_0202DC2C
	b _0222A21C
_0222A214:
	adds r0, r7, #0
	adds r1, r5, #0
	bl FUN_0202DCAC
_0222A21C:
	ldr r0, [sp]
	bl ov74_022360A0
	ldr r1, _0222A238 @ =0x000029EC
	ldr r0, [sp, #4]
	movs r2, #0
	str r2, [r0, r1]
	ldr r2, _0222A23C @ =ov74_0222A130
	subs r1, r1, #4
	str r2, [r0, r1]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222A234: .4byte 0x00000215
_0222A238: .4byte 0x000029EC
_0222A23C: .4byte ov74_0222A130
	thumb_func_end ov74_0222A174

	thumb_func_start ov74_0222A240
ov74_0222A240: @ 0x0222A240
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	adds r4, r1, #0
	bl FUN_02007290
	cmp r4, #0
	bne _0222A254
	movs r5, #4
	b _0222A258
_0222A254:
	movs r5, #0
	mvns r5, r5
_0222A258:
	ldr r1, [r0, #0x48]
	adds r4, r0, #0
	adds r4, #0x48
	cmp r1, #0
	bne _0222A282
	movs r1, #0xa
	str r1, [sp]
	movs r1, #6
	str r1, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	movs r2, #0
	movs r1, #0x6b
	str r2, [sp, #0xc]
	lsls r1, r1, #2
	str r1, [sp, #0x10]
	ldr r0, [r0]
	adds r1, r4, #0
	movs r3, #0x17
	bl FUN_0201D40C
_0222A282:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #3
	bl FUN_0200E580
	ldr r1, _0222A2A0 @ =0x0223C260
	adds r0, r6, #0
	movs r2, #2
	adds r3, r4, #0
	str r5, [sp]
	bl ov74_0222A89C
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222A2A0: .4byte 0x0223C260
	thumb_func_end ov74_0222A240

	thumb_func_start ov74_0222A2A4
ov74_0222A2A4: @ 0x0222A2A4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, #0x48
	movs r1, #0
	bl ov74_02229F60
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl ov74_02229F60
	ldr r0, _0222A2DC @ =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0222A2D0
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
_0222A2D0:
	bl FUN_0203A914
	adds r0, r5, #0
	bl ov74_0222A5CC
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222A2DC: .4byte 0x000015D4
	thumb_func_end ov74_0222A2A4

	thumb_func_start ov74_0222A2E0
ov74_0222A2E0: @ 0x0222A2E0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	bl FUN_02007290
	adds r5, r0, #0
	bl ov74_02235230
	cmp r0, #0
	beq _0222A2F8
	movs r1, #2
	b _0222A2FA
_0222A2F8:
	movs r1, #1
_0222A2FA:
	ldr r0, _0222A354 @ =0x000015D4
	str r1, [r5, r0]
	adds r0, r5, #0
	adds r0, #0x38
	movs r1, #0
	bl ov74_02229F60
	adds r4, r5, #0
	ldr r0, [r5, #0x48]
	adds r4, #0x48
	cmp r0, #0
	bne _0222A332
	movs r0, #0xa
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r2, #0
	movs r0, #0x6b
	str r2, [sp, #0xc]
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r5]
	adds r1, r4, #0
	movs r3, #0x17
	bl FUN_0201D40C
_0222A332:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #3
	bl FUN_0200E580
	movs r2, #2
	ldr r1, _0222A358 @ =0x0223C250
	adds r0, r6, #0
	adds r3, r4, #0
	str r2, [sp]
	bl ov74_0222A89C
	movs r0, #5
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0222A354: .4byte 0x000015D4
_0222A358: .4byte 0x0223C250
	thumb_func_end ov74_0222A2E0

	thumb_func_start ov74_0222A35C
ov74_0222A35C: @ 0x0222A35C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, _0222A3C4 @ =0x000015D4
	movs r1, #4
	str r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #0
	bl ov74_02229F60
	adds r5, r4, #0
	ldr r0, [r4, #0x48]
	adds r5, #0x48
	cmp r0, #0
	bne _0222A3A2
	movs r0, #0xa
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r2, #0
	movs r0, #0x6b
	str r2, [sp, #0xc]
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r4]
	adds r1, r5, #0
	movs r3, #0x17
	bl FUN_0201D40C
_0222A3A2:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #3
	bl FUN_0200E580
	movs r0, #0x50
	str r0, [sp]
	ldr r1, _0222A3C8 @ =0x0223C220
	adds r0, r6, #0
	movs r2, #2
	adds r3, r5, #0
	bl ov74_0222A89C
	movs r0, #5
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222A3C4: .4byte 0x000015D4
_0222A3C8: .4byte 0x0223C220
	thumb_func_end ov74_0222A35C

	thumb_func_start ov74_0222A3CC
ov74_0222A3CC: @ 0x0222A3CC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, _0222A434 @ =0x000015D4
	movs r1, #3
	str r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #0
	bl ov74_02229F60
	adds r5, r4, #0
	ldr r0, [r4, #0x48]
	adds r5, #0x48
	cmp r0, #0
	bne _0222A412
	movs r0, #0xa
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r2, #0
	movs r0, #0x6b
	str r2, [sp, #0xc]
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r4]
	adds r1, r5, #0
	movs r3, #0x17
	bl FUN_0201D40C
_0222A412:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #3
	bl FUN_0200E580
	movs r0, #0x4f
	str r0, [sp]
	ldr r1, _0222A438 @ =0x0223C230
	adds r0, r6, #0
	movs r2, #2
	adds r3, r5, #0
	bl ov74_0222A89C
	movs r0, #5
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222A434: .4byte 0x000015D4
_0222A438: .4byte 0x0223C230
	thumb_func_end ov74_0222A3CC

	thumb_func_start ov74_0222A43C
ov74_0222A43C: @ 0x0222A43C
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r1, [r0, #0x48]
	adds r4, #0x48
	cmp r1, #0
	bne _0222A470
	movs r1, #0xa
	str r1, [sp]
	movs r1, #6
	str r1, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	movs r2, #0
	movs r1, #0x6b
	str r2, [sp, #0xc]
	lsls r1, r1, #2
	str r1, [sp, #0x10]
	ldr r0, [r0]
	adds r1, r4, #0
	movs r3, #0x17
	bl FUN_0201D40C
_0222A470:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #3
	bl FUN_0200E580
	movs r0, #4
	str r0, [sp]
	ldr r1, _0222A490 @ =0x0223C240
	adds r0, r5, #0
	movs r2, #2
	adds r3, r4, #0
	bl ov74_0222A89C
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_0222A490: .4byte 0x0223C240
	thumb_func_end ov74_0222A43C

	thumb_func_start ov74_0222A494
ov74_0222A494: @ 0x0222A494
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, #0x48
	movs r1, #0
	bl ov74_02229F60
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl ov74_02229F60
	bl FUN_0203A914
	ldr r0, _0222A4C8 @ =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0222A4C0
	bl ov74_02229DF8
_0222A4C0:
	adds r0, r5, #0
	bl ov74_0222A5CC
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222A4C8: .4byte 0x000015D4
	thumb_func_end ov74_0222A494

	thumb_func_start ov74_0222A4CC
ov74_0222A4CC: @ 0x0222A4CC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x18
	movs r2, #3
	bl ov74_0222AA18
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	bl ov74_02229F60
	adds r0, r4, #0
	movs r1, #1
	bl ov74_02229E28
	ldr r0, _0222A500 @ =0x0223D0A8
	movs r1, #0x25
	str r1, [r0, #0x10]
	movs r0, #0x20
	pop {r3, r4, r5, pc}
	nop
_0222A500: .4byte 0x0223D0A8
	thumb_func_end ov74_0222A4CC

	thumb_func_start ov74_0222A504
ov74_0222A504: @ 0x0222A504
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, #0x80
	ldr r0, [r0]
	subs r0, r0, #2
	cmp r0, #2
	bhi _0222A51C
	movs r0, #0x31
	pop {r3, r4, r5, pc}
_0222A51C:
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	bl ov74_02229F60
	adds r4, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #7
	bl ov74_0222AA18
	movs r0, #0x21
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov74_0222A504

	thumb_func_start ov74_0222A538
ov74_0222A538: @ 0x0222A538
	push {r3, lr}
	ldr r0, _0222A55C @ =0x0223D0A8
	ldr r0, [r0, #0x10]
	cmp r0, #0x28
	beq _0222A54A
	cmp r0, #0x29
	beq _0222A54A
	cmp r0, #0x30
	bne _0222A558
_0222A54A:
	bl ov74_022365FC
	cmp r0, #0
	beq _0222A558
	ldr r0, _0222A55C @ =0x0223D0A8
	movs r1, #0x2b
	str r1, [r0, #0x10]
_0222A558:
	movs r0, #0x24
	pop {r3, pc}
	.align 2, 0
_0222A55C: .4byte 0x0223D0A8
	thumb_func_end ov74_0222A538

	thumb_func_start ov74_0222A560
ov74_0222A560: @ 0x0222A560
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x18
	movs r2, #3
	bl ov74_0222AA18
	adds r0, r4, #0
	movs r1, #1
	bl ov74_02229E28
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	bl ov74_02229F60
	adds r0, r4, #0
	movs r1, #1
	bl ov74_02229E28
	movs r1, #1
	ldr r0, _0222A5A4 @ =0x000015E0
	lsls r1, r1, #0xc
	str r1, [r4, r0]
	ldr r0, _0222A5A8 @ =0x0000267C
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #0x1b
	pop {r3, r4, r5, pc}
	nop
_0222A5A4: .4byte 0x000015E0
_0222A5A8: .4byte 0x0000267C
	thumb_func_end ov74_0222A560

	thumb_func_start ov74_0222A5AC
ov74_0222A5AC: @ 0x0222A5AC
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02007290
	adds r0, #0x38
	movs r1, #0
	bl ov74_02229F60
	adds r0, r4, #0
	movs r1, #0xc4
	movs r2, #0
	bl ov74_0222A94C
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_0222A5AC

	thumb_func_start ov74_0222A5CC
ov74_0222A5CC: @ 0x0222A5CC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	bl FUN_02007290
	adds r5, r0, #0
	ldr r0, [r5, #4]
	bl FUN_020270E4
	ldr r0, _0222A648 @ =0x000005C8
	ldr r1, [r5, r0]
	cmp r1, #0x1e
	bne _0222A5F2
	movs r1, #1
	adds r0, r0, #4
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov74_0222CE10
_0222A5F2:
	adds r0, r5, #0
	adds r0, #0x28
	movs r1, #0
	bl ov74_02229F60
	adds r4, r5, #0
	ldr r0, [r5, #0x38]
	adds r4, #0x38
	cmp r0, #0
	bne _0222A626
	movs r0, #9
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	movs r2, #0
	movs r0, #0x49
	str r2, [sp, #0xc]
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r5]
	adds r1, r4, #0
	movs r3, #0xf
	bl FUN_0201D40C
_0222A626:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #3
	bl FUN_0200E580
	movs r0, #1
	str r0, [sp]
	ldr r1, _0222A64C @ =0x0223C2B0
	adds r0, r6, #0
	movs r2, #4
	adds r3, r4, #0
	bl ov74_0222A89C
	movs r0, #4
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222A648: .4byte 0x000005C8
_0222A64C: .4byte 0x0223C2B0
	thumb_func_end ov74_0222A5CC

	thumb_func_start ov74_0222A650
ov74_0222A650: @ 0x0222A650
	push {r4, lr}
	bl FUN_02007290
	ldr r1, _0222A680 @ =0x000005C8
	adds r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #0x1e
	bne _0222A66A
	movs r2, #1
	adds r1, r1, #4
	str r2, [r4, r1]
	bl ov74_0222CE10
_0222A66A:
	ldr r2, _0222A684 @ =0x000015D8
	movs r0, #0
	ldr r2, [r4, r2]
	movs r1, #0x36
	movs r3, #2
	bl ov74_0223539C
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	nop
_0222A680: .4byte 0x000005C8
_0222A684: .4byte 0x000015D8
	thumb_func_end ov74_0222A650

	thumb_func_start ov74_0222A688
ov74_0222A688: @ 0x0222A688
	push {r4, lr}
	bl FUN_02007290
	ldr r1, _0222A6B8 @ =0x000005C8
	adds r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #0x1e
	bne _0222A6A2
	movs r2, #1
	adds r1, r1, #4
	str r2, [r4, r1]
	bl ov74_0222CE10
_0222A6A2:
	ldr r2, _0222A6BC @ =0x000015D8
	movs r0, #0
	ldr r2, [r4, r2]
	movs r1, #0x37
	movs r3, #2
	bl ov74_0223539C
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	nop
_0222A6B8: .4byte 0x000005C8
_0222A6BC: .4byte 0x000015D8
	thumb_func_end ov74_0222A688

	thumb_func_start ov74_0222A6C0
ov74_0222A6C0: @ 0x0222A6C0
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, _0222A6F0 @ =0x000005C8
	ldr r1, [r4, r0]
	cmp r1, #0x1e
	bne _0222A6D6
	movs r1, #1
	adds r0, r0, #4
	str r1, [r4, r0]
_0222A6D6:
	movs r0, #1
	bl ov74_02235390
	ldr r2, _0222A6F4 @ =0x000015D8
	movs r0, #0
	ldr r2, [r4, r2]
	movs r1, #0x35
	movs r3, #2
	bl ov74_0223539C
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	.align 2, 0
_0222A6F0: .4byte 0x000005C8
_0222A6F4: .4byte 0x000015D8
	thumb_func_end ov74_0222A6C0

	thumb_func_start ov74_0222A6F8
ov74_0222A6F8: @ 0x0222A6F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r3, #0
	ldr r3, _0222A740 @ =0x0223B3A0
	adds r7, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	add r2, sp, #0
	ldm r3!, {r0, r1}
	mov ip, r2
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	lsrs r1, r6, #0xb
	str r0, [r2]
	add r0, sp, #0
	strb r1, [r0, #0x12]
	lsrs r1, r5, #0xe
	strb r1, [r0, #0x13]
	lsls r1, r4, #0x18
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	mov r2, ip
	movs r3, #0
	bl FUN_0201B1E4
	lsls r1, r4, #0x18
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222A740: .4byte 0x0223B3A0
	thumb_func_end ov74_0222A6F8

	thumb_func_start ov74_0222A744
ov74_0222A744: @ 0x0222A744
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r5, _0222A79C @ =0x0223B390
	add r3, sp, #0
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	movs r1, #0
	movs r2, #0xf
	adds r0, r4, #0
	lsls r2, r2, #0xc
	adds r3, r1, #0
	bl ov74_0222A6F8
	movs r1, #1
	movs r2, #0x3e
	adds r0, r4, #0
	lsls r2, r2, #0xa
	lsls r3, r1, #0xf
	bl ov74_0222A6F8
	movs r2, #0xe
	adds r0, r4, #0
	movs r1, #4
	lsls r2, r2, #0xa
	movs r3, #0
	bl ov74_0222A6F8
	movs r2, #0x1e
	movs r3, #1
	adds r0, r4, #0
	movs r1, #5
	lsls r2, r2, #0xa
	lsls r3, r3, #0xe
	bl ov74_0222A6F8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222A79C: .4byte 0x0223B390
	thumb_func_end ov74_0222A744

	thumb_func_start ov74_0222A7A0
ov74_0222A7A0: @ 0x0222A7A0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x20
	movs r2, #4
	str r0, [sp]
	movs r0, #0x54
	adds r3, r2, #0
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0
	adds r3, #0xfc
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #5
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #0x54
	str r0, [sp, #0xc]
	movs r0, #0x71
	adds r2, r4, #0
	movs r3, #5
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x54
	str r0, [sp, #0xc]
	movs r0, #0x71
	movs r1, #2
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #8
	movs r2, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0201CA4C
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_0222A7A0

	thumb_func_start ov74_0222A81C
ov74_0222A81C: @ 0x0222A81C
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x54
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0
	adds r3, r0, #0
	adds r2, r1, #0
	adds r3, #0x8f
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #5
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #0x54
	str r0, [sp, #0xc]
	movs r0, #0x71
	adds r2, r4, #0
	adds r3, r1, #0
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x54
	str r0, [sp, #0xc]
	movs r0, #0x71
	movs r1, #2
	adds r2, r4, #0
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #8
	movs r2, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201CA4C
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BF7C
	adds r0, r4, #0
	bl ov74_0222A7A0
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_0222A81C

	thumb_func_start ov74_0222A89C
ov74_0222A89C: @ 0x0222A89C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp]
	adds r5, r1, #0
	adds r7, r2, #0
	str r3, [sp, #4]
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r4, #0x7c]
	cmp r0, #0
	beq _0222A8B8
	bl FUN_02014950
_0222A8B8:
	adds r0, r7, #0
	movs r1, #0x54
	bl FUN_02014918
	str r0, [r4, #0x7c]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xf7
	movs r3, #0x54
	bl FUN_0200BAF8
	movs r6, #0
	str r0, [r4, #0x10]
	cmp r7, #0
	ble _0222A8EA
_0222A8D6:
	ldr r0, [r4, #0x7c]
	ldr r1, [r4, #0x10]
	ldr r2, [r5]
	ldr r3, [r5, #4]
	bl FUN_02014960
	adds r6, r6, #1
	adds r5, #8
	cmp r6, r7
	blt _0222A8D6
_0222A8EA:
	ldr r0, [r4, #0x10]
	bl FUN_0200BB44
	ldr r3, _0222A948 @ =0x0223C270
	add r2, sp, #8
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4, #0x7c]
	str r0, [sp, #8]
	add r0, sp, #8
	strh r7, [r0, #0x12]
	ldrh r1, [r0, #0x12]
	strh r1, [r0, #0x10]
	ldr r0, [sp, #4]
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _0222A922
	movs r1, #0
	adds r2, r1, #0
	bl FUN_02001434
_0222A922:
	movs r1, #0
	add r0, sp, #8
	adds r2, r1, #0
	movs r3, #0x54
	bl FUN_020011DC
	str r0, [r4, #0x78]
	movs r0, #0
	ldr r2, [sp, #0x40]
	mvns r0, r0
	cmp r2, r0
	beq _0222A944
	adds r4, #0x18
	ldr r0, [sp]
	adds r1, r4, #0
	bl ov74_0222AA18
_0222A944:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222A948: .4byte 0x0223C270
	thumb_func_end ov74_0222A89C

	thumb_func_start ov74_0222A94C
ov74_0222A94C: @ 0x0222A94C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp, #0x14]
	adds r7, r1, #0
	str r2, [sp, #0x20]
	bl FUN_02007290
	str r0, [sp, #0x1c]
	ldr r0, [r0, #4]
	movs r5, #0
	bl FUN_020270E4
	ldr r1, _0222AA10 @ =0x0223C220
	ldr r4, [sp, #0x1c]
	ldr r2, [r1, #0x70]
	ldr r1, [r1, #0x74]
	str r0, [sp, #0x18]
	adds r4, #0x28
	adds r5, r5, #1
	str r2, [sp, #0x24]
	str r1, [sp, #0x28]
	bl FUN_0202DED8
	cmp r0, #0
	beq _0222A992
	lsls r6, r5, #3
	add r0, sp, #0x24
	adds r1, r0, r6
	ldr r0, _0222AA10 @ =0x0223C220
	adds r5, r5, #1
	ldr r3, [r0, #0x78]
	ldr r2, [r0, #0x7c]
	add r0, sp, #0x24
	str r3, [r0, r6]
	str r2, [r1, #4]
_0222A992:
	ldr r0, [sp, #0x18]
	bl FUN_0202DEBC
	cmp r0, #0
	beq _0222A9B0
	lsls r6, r5, #3
	add r0, sp, #0x24
	adds r1, r0, r6
	ldr r0, _0222AA14 @ =0x0223C2A0
	adds r5, r5, #1
	ldr r3, [r0]
	ldr r2, [r0, #4]
	add r0, sp, #0x24
	str r3, [r0, r6]
	str r2, [r1, #4]
_0222A9B0:
	lsls r6, r5, #3
	add r0, sp, #0x24
	adds r1, r0, r6
	ldr r0, _0222AA14 @ =0x0223C2A0
	ldr r3, [r0, #8]
	ldr r2, [r0, #0xc]
	add r0, sp, #0x24
	str r3, [r0, r6]
	str r2, [r1, #4]
	ldr r0, [r4]
	cmp r0, #0
	bne _0222A9EE
	movs r0, #7
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	adds r0, r5, #1
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r2, #0
	lsls r0, r7, #0x10
	str r2, [sp, #0xc]
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	adds r1, r4, #0
	ldr r0, [r0]
	movs r3, #6
	bl FUN_0201D40C
_0222A9EE:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #3
	bl FUN_0200E580
	ldr r0, [sp, #0x20]
	add r1, sp, #0x24
	str r0, [sp]
	ldr r0, [sp, #0x14]
	adds r2, r5, #1
	adds r3, r4, #0
	bl ov74_0222A89C
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0222AA10: .4byte 0x0223C220
_0222AA14: .4byte 0x0223C2A0
	thumb_func_end ov74_0222A94C

	thumb_func_start ov74_0222AA18
ov74_0222AA18: @ 0x0222AA18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	adds r7, r2, #0
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xf7
	movs r3, #0x54
	bl FUN_0200BAF8
	str r0, [r4, #0x10]
	movs r0, #0x54
	bl FUN_0200BD08
	str r0, [r4, #0xc]
	movs r0, #1
	movs r1, #6
	bl FUN_02002FAC
	adds r1, r0, #0
	adds r0, r5, #0
	bl FUN_0201D978
	ldr r6, [r4, #0x14]
	cmp r6, #0
	bne _0222AA60
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	adds r2, r7, #0
	movs r3, #0x54
	bl FUN_0200BC4C
	adds r6, r0, #0
_0222AA60:
	movs r3, #0
	str r3, [sp]
	ldr r0, [r4, #0x68]
	movs r1, #1
	str r0, [sp, #4]
	ldr r0, _0222AAA8 @ =0x0001020F
	adds r2, r6, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, #0
	bl FUN_020200FC
	str r0, [r4, #0x6c]
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0222AA86
	adds r0, r6, #0
	bl FUN_02026380
_0222AA86:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	movs r3, #2
	bl FUN_0200E998
	ldr r0, [r4, #0x10]
	bl FUN_0200BB44
	ldr r0, [r4, #0xc]
	bl FUN_0200BDA0
	movs r0, #0xff
	str r0, [r4, #0x68]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222AAA8: .4byte 0x0001020F
	thumb_func_end ov74_0222AA18

	thumb_func_start ov74_0222AAAC
ov74_0222AAAC: @ 0x0222AAAC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r1, #0
	adds r6, r2, #0
	bl FUN_02007290
	movs r0, #0x25
	movs r1, #0x54
	bl FUN_02026354
	adds r1, r6, #0
	movs r2, #0x24
	adds r4, r0, #0
	bl FUN_02026A04
	movs r0, #0
	movs r1, #6
	bl FUN_02002FAC
	adds r1, r0, #0
	adds r0, r5, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222AB08 @ =0x0001020F
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x1f
	movs r3, #3
	bl FUN_0200E580
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222AB08: .4byte 0x0001020F
	thumb_func_end ov74_0222AAAC

	thumb_func_start ov74_0222AB0C
ov74_0222AB0C: @ 0x0222AB0C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl FUN_02007290
	ldr r0, [r0, #0x78]
	bl FUN_02001338
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _0222AB30
	adds r0, r0, #1
	cmp r4, r0
	beq _0222AB66
	b _0222AB4A
_0222AB30:
	ldr r0, _0222AB68 @ =0x000005DC
	bl FUN_0200604C
	cmp r6, #0
	beq _0222AB66
	adds r0, r7, #0
	blx r6
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222AB66
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222AB4A:
	ldr r0, _0222AB68 @ =0x000005DC
	bl FUN_0200604C
	cmp r4, #0
	beq _0222AB66
	ldr r0, _0222AB6C @ =0x0223D0A8
	str r4, [r0, #8]
	adds r0, r7, #0
	blx r4
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222AB66
	str r0, [r5]
_0222AB66:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222AB68: .4byte 0x000005DC
_0222AB6C: .4byte 0x0223D0A8
	thumb_func_end ov74_0222AB0C

	thumb_func_start ov74_0222AB70
ov74_0222AB70: @ 0x0222AB70
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02020080
	movs r0, #0
	adds r1, r0, #0
	movs r2, #0x54
	bl FUN_02003030
	movs r0, #0
	movs r1, #0x20
	movs r2, #0x54
	bl FUN_02003030
	ldr r0, [r4, #8]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x54
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r1, #0
	movs r2, #1
	movs r3, #2
	bl FUN_0200E644
	movs r0, #1
	str r0, [sp]
	movs r0, #0x54
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r1, #0
	movs r2, #0x1f
	movs r3, #3
	bl FUN_0200E3DC
	movs r0, #5
	ldr r1, _0222AC18 @ =0x00007D8C
	lsls r0, r0, #0x18
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_0201D3F0
	cmp r0, #0
	bne _0222ABF4
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r2, #0
	adds r1, r4, #0
	str r2, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r4]
	adds r1, #0x18
	movs r3, #2
	bl FUN_0201D40C
_0222ABF4:
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x18
	movs r2, #0
	bl ov74_0222AA18
	adds r0, r5, #0
	movs r1, #0xc4
	movs r2, #0
	bl ov74_0222A94C
	ldr r0, [r4]
	bl ov74_0222A81C
	movs r0, #1
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_0222AC18: .4byte 0x00007D8C
	thumb_func_end ov74_0222AB70

	thumb_func_start ov74_0222AC1C
ov74_0222AC1C: @ 0x0222AC1C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r1, _0222ACC8 @ =0x000015E0
	adds r0, r6, #0
	adds r1, r4, r1
	bl ov74_02236AE0
	cmp r0, #4
	bhi _0222ACC4
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222AC42: @ jump table
	.2byte _0222ACC4 - _0222AC42 - 2 @ case 0
	.2byte _0222AC4C - _0222AC42 - 2 @ case 1
	.2byte _0222AC78 - _0222AC42 - 2 @ case 2
	.2byte _0222AC78 - _0222AC42 - 2 @ case 3
	.2byte _0222AC8C - _0222AC42 - 2 @ case 4
_0222AC4C:
	ldr r1, _0222ACCC @ =0x00001658
	adds r0, r4, #0
	movs r2, #0xea
	adds r0, #0x8c
	adds r1, r4, r1
	lsls r2, r2, #2
	blx FUN_020E5AD8
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	adds r0, r4, #0
	movs r1, #0x1b
	adds r0, #0x84
	str r1, [r0]
	movs r0, #0x13
	str r0, [r5]
	ldr r0, _0222ACD0 @ =0x000015DC
	movs r1, #0
	str r1, [r4, r0]
	pop {r4, r5, r6, pc}
_0222AC78:
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	ldr r0, _0222ACD0 @ =0x000015DC
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #0x11
	str r0, [r5]
	pop {r4, r5, r6, pc}
_0222AC8C:
	movs r0, #0x9a
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201D8C8
	movs r0, #0x9a
	lsls r0, r0, #6
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0201CAE0
	ldr r0, _0222ACD4 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r6, #0
	movs r1, #0xc4
	movs r2, #0
	bl ov74_0222A94C
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #3
	str r0, [r5]
_0222ACC4:
	pop {r4, r5, r6, pc}
	nop
_0222ACC8: .4byte 0x000015E0
_0222ACCC: .4byte 0x00001658
_0222ACD0: .4byte 0x000015DC
_0222ACD4: .4byte 0x000005DC
	thumb_func_end ov74_0222AC1C

	thumb_func_start ov74_0222ACD8
ov74_0222ACD8: @ 0x0222ACD8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x5c
	adds r5, r0, #0
	ldr r0, _0222AD64 @ =0x0000266C
	ldr r4, [r5, r0]
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0222ACEC
	movs r4, #0xb
_0222ACEC:
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	ldr r0, [r5]
	movs r1, #0
	bl FUN_0201CAE0
	movs r0, #0x54
	bl FUN_0200BD08
	movs r1, #2
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r2, _0222AD68 @ =0x00002670
	movs r1, #0
	ldr r2, [r5, r2]
	movs r3, #5
	adds r6, r0, #0
	bl FUN_0200BFCC
	movs r0, #0x1f
	movs r1, #0x9a
	str r0, [sp]
	movs r0, #3
	lsls r1, r1, #6
	movs r3, #0x32
	str r0, [sp, #4]
	add r0, sp, #8
	adds r1, r5, r1
	movs r2, #1
	lsls r3, r3, #4
	bl ov74_02235414
	add r0, sp, #8
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x64
	bl ov74_02235464
	add r0, sp, #8
	movs r1, #0
	movs r2, #1
	bl ov74_0223546C
	str r6, [sp, #0x1c]
	str r4, [sp]
	movs r2, #4
	ldr r0, [r5]
	add r1, sp, #8
	adds r3, r2, #0
	bl ov74_02235568
	adds r0, r6, #0
	bl FUN_0200BDA0
	add sp, #0x5c
	pop {r3, r4, r5, r6, pc}
	nop
_0222AD64: .4byte 0x0000266C
_0222AD68: .4byte 0x00002670
	thumb_func_end ov74_0222ACD8

	thumb_func_start ov74_0222AD6C
ov74_0222AD6C: @ 0x0222AD6C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r1, r0, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #3
	bne _0222AD82
	movs r4, #0x16
	b _0222ADAC
_0222AD82:
	cmp r0, #4
	bne _0222AD8A
	movs r4, #0x1a
	b _0222ADAC
_0222AD8A:
	cmp r0, #2
	bne _0222AD92
	movs r4, #0x17
	b _0222ADAC
_0222AD92:
	cmp r0, #1
	bne _0222AD9A
	movs r4, #0x1c
	b _0222ADAC
_0222AD9A:
	cmp r0, #5
	bne _0222ADAC
	adds r0, r5, #0
	adds r1, #0x18
	movs r2, #9
	movs r3, #0x34
	bl ov74_0222ADBC
	pop {r3, r4, r5, pc}
_0222ADAC:
	adds r0, r5, #0
	adds r1, #0x18
	adds r2, r4, #0
	movs r3, #0x33
	bl ov74_0222ADBC
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov74_0222AD6C

	thumb_func_start ov74_0222ADBC
ov74_0222ADBC: @ 0x0222ADBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	adds r6, r1, #0
	adds r5, r2, #0
	adds r7, r3, #0
	bl FUN_02007290
	adds r4, r0, #0
	cmp r6, #0
	beq _0222AE16
	cmp r5, #0
	beq _0222AE16
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xf7
	movs r3, #0x54
	bl FUN_0200BAF8
	str r0, [sp, #4]
	movs r0, #0x54
	bl FUN_0200BD08
	ldr r1, [sp, #4]
	adds r2, r5, #0
	movs r3, #0x54
	str r0, [sp, #8]
	bl FUN_0200BC4C
	str r0, [r4, #0x14]
	movs r0, #1
	str r0, [r4, #0x68]
	ldr r0, [sp]
	adds r1, r6, #0
	adds r2, r5, #0
	bl ov74_0222AA18
	ldr r0, [sp, #8]
	str r7, [r4, #0x74]
	bl FUN_0200BDA0
	ldr r0, [sp, #4]
	bl FUN_0200BB44
	b _0222AE36
_0222AE16:
	ldr r0, [r4, #0x6c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0222AE36
	ldr r0, [r4, #0x14]
	bl FUN_02026380
	movs r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x68]
	add sp, #0xc
	ldr r0, [r4, #0x74]
	pop {r4, r5, r6, r7, pc}
_0222AE36:
	movs r0, #0x32
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov74_0222ADBC

	thumb_func_start ov74_0222AE3C
ov74_0222AE3C: @ 0x0222AE3C
	push {r3, lr}
	ldr r1, _0222AE68 @ =0x000015D4
	ldr r0, [r0, r1]
	cmp r0, #4
	bhi _0222AE64
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222AE52: @ jump table
	.2byte _0222AE64 - _0222AE52 - 2 @ case 0
	.2byte _0222AE5C - _0222AE52 - 2 @ case 1
	.2byte _0222AE64 - _0222AE52 - 2 @ case 2
	.2byte _0222AE64 - _0222AE52 - 2 @ case 3
	.2byte _0222AE64 - _0222AE52 - 2 @ case 4
_0222AE5C:
	bl ov74_02229DF8
	bl FUN_0203A914
_0222AE64:
	pop {r3, pc}
	nop
_0222AE68: .4byte 0x000015D4
	thumb_func_end ov74_0222AE3C

	thumb_func_start ov74_0222AE6C
ov74_0222AE6C: @ 0x0222AE6C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov74_0222CD88
	movs r0, #3
	movs r1, #0x54
	lsls r2, r0, #0x10
	bl FUN_0201A910
	ldr r1, _0222AF14 @ =0x000029F8
	adds r0, r5, #0
	movs r2, #0x54
	bl FUN_02007280
	ldr r2, _0222AF14 @ =0x000029F8
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x54
	bl FUN_0201AC88
	str r0, [r4]
	bl FUN_02022C54
	bl FUN_02022CBC
	bl ov74_0222FCA4
	ldr r0, [r4]
	bl ov74_0222A744
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	ldr r1, _0222AF18 @ =0x0000047E
	movs r0, #0xa
	movs r2, #1
	bl FUN_02004EC4
	movs r0, #0x54
	bl ov74_0223512C
	bl ov74_02235230
	cmp r0, #0
	beq _0222AEE8
	ldr r0, _0222AF1C @ =0x000015D4
	movs r1, #2
	str r1, [r4, r0]
	ldr r0, _0222AF20 @ =0x020F566C
	ldrb r0, [r0]
	bl FUN_0201A4B0
	movs r0, #1
	bl ov74_02236034
_0222AEE8:
	ldr r0, _0222AF24 @ =0x000005C8
	movs r1, #0x1d
	str r1, [r4, r0]
	adds r0, r5, #0
	bl FUN_020072A4
	ldr r0, [r0, #8]
	str r0, [r4, #4]
	bl FUN_02028EA8
	str r0, [r4, #8]
	movs r0, #0xff
	movs r2, #0x57
	str r0, [r4, #0x68]
	movs r0, #0
	movs r1, #0x59
	lsls r2, r2, #4
	bl FUN_0201A910
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0222AF14: .4byte 0x000029F8
_0222AF18: .4byte 0x0000047E
_0222AF1C: .4byte 0x000015D4
_0222AF20: .4byte 0x020F566C
_0222AF24: .4byte 0x000005C8
	thumb_func_end ov74_0222AE6C

	thumb_func_start ov74_0222AF28
ov74_0222AF28: @ 0x0222AF28
	push {r4, r5, lr}
	sub sp, #0x2c
	adds r4, r0, #0
	ldr r0, _0222B0C0 @ =0x00004E21
	movs r3, #1
	str r0, [sp]
	str r3, [sp, #4]
	movs r1, #0x54
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	adds r1, #0xd8
	ldr r0, [r0, r1]
	movs r1, #0x71
	movs r2, #0x2b
	bl FUN_0200A1D8
	str r0, [r4, #0x58]
	ldr r0, _0222B0C0 @ =0x00004E21
	movs r1, #0x54
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0xc]
	adds r1, #0xdc
	ldr r0, [r0, r1]
	movs r1, #0x71
	movs r2, #0x28
	movs r3, #0
	bl FUN_0200A234
	str r0, [r4, #0x5c]
	ldr r0, _0222B0C0 @ =0x00004E21
	movs r1, #0x54
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	adds r1, #0xe0
	ldr r0, [r0, r1]
	movs r1, #0x71
	movs r2, #0x2a
	movs r3, #1
	bl FUN_0200A294
	str r0, [r4, #0x60]
	ldr r0, _0222B0C0 @ =0x00004E21
	movs r1, #0x54
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	adds r1, #0xe4
	ldr r0, [r0, r1]
	movs r1, #0x71
	movs r2, #0x29
	movs r3, #1
	bl FUN_0200A294
	str r0, [r4, #0x64]
	ldr r0, _0222B0C4 @ =0x00004E22
	movs r1, #0x54
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	adds r1, #0xd8
	ldr r0, [r0, r1]
	movs r1, #0x71
	movs r2, #0x2b
	movs r3, #1
	bl FUN_0200A1D8
	str r0, [r4, #0x70]
	ldr r0, _0222B0C4 @ =0x00004E22
	movs r1, #0x54
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0xc]
	adds r1, #0xdc
	ldr r0, [r0, r1]
	movs r1, #0x71
	movs r2, #0x28
	movs r3, #0
	bl FUN_0200A234
	str r0, [r4, #0x74]
	ldr r0, _0222B0C4 @ =0x00004E22
	movs r1, #0x54
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	adds r1, #0xe0
	ldr r0, [r0, r1]
	movs r1, #0x71
	movs r2, #0x2a
	movs r3, #1
	bl FUN_0200A294
	str r0, [r4, #0x78]
	ldr r0, _0222B0C4 @ =0x00004E22
	movs r1, #0x54
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	adds r1, #0xe4
	ldr r0, [r0, r1]
	movs r1, #0x71
	movs r2, #0x29
	movs r3, #1
	bl FUN_0200A294
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x58]
	bl FUN_0200ACF0
	ldr r0, [r4, #0x70]
	bl FUN_0200ACF0
	ldr r0, [r4, #0x5c]
	bl FUN_0200B00C
	ldr r0, [r4, #0x74]
	bl FUN_0200B00C
	movs r0, #0
	movs r5, #0x4b
	ldr r2, [r4, #0xc]
	ldr r1, _0222B0C0 @ =0x00004E21
	mvns r0, r0
	str r1, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsls r5, r5, #2
	ldr r3, [r2, r5]
	str r3, [sp, #0x14]
	adds r3, r5, #4
	ldr r3, [r2, r3]
	str r3, [sp, #0x18]
	adds r3, r5, #0
	adds r3, #8
	ldr r3, [r2, r3]
	adds r5, #0xc
	str r3, [sp, #0x1c]
	ldr r2, [r2, r5]
	adds r3, r1, #0
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r4, #0
	adds r0, #0x10
	adds r2, r1, #0
	bl FUN_02009D48
	ldr r2, [r4, #0xc]
	ldr r1, _0222B0C4 @ =0x00004E22
	movs r0, #0
	movs r5, #0x4b
	adds r4, #0x10
	str r1, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsls r5, r5, #2
	ldr r3, [r2, r5]
	adds r4, #0x24
	str r3, [sp, #0x14]
	adds r3, r5, #4
	ldr r3, [r2, r3]
	str r3, [sp, #0x18]
	adds r3, r5, #0
	adds r3, #8
	ldr r3, [r2, r3]
	adds r5, #0xc
	str r3, [sp, #0x1c]
	ldr r2, [r2, r5]
	adds r3, r1, #0
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r4, #0
	adds r2, r1, #0
	bl FUN_02009D48
	add sp, #0x2c
	pop {r4, r5, pc}
	.align 2, 0
_0222B0C0: .4byte 0x00004E21
_0222B0C4: .4byte 0x00004E22
	thumb_func_end ov74_0222AF28

	thumb_func_start ov74_0222B0C8
ov74_0222B0C8: @ 0x0222B0C8
	push {r4, lr}
	sub sp, #0x30
	cmp r1, #1
	beq _0222B0D4
	movs r3, #1
	b _0222B0D6
_0222B0D4:
	movs r3, #0
_0222B0D6:
	ldr r2, [r0, #0xc]
	adds r0, #0x10
	ldr r2, [r2]
	str r2, [sp]
	movs r2, #0x24
	muls r2, r3, r2
	adds r0, r0, r2
	movs r3, #1
	lsls r3, r3, #0xc
	movs r2, #0
	str r0, [sp, #4]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	str r3, [sp, #0x18]
	str r3, [sp, #0x1c]
	add r0, sp, #0
	strh r2, [r0, #0x20]
	lsls r0, r3, #7
	str r0, [sp, #8]
	movs r0, #0xa
	lsls r2, r3, #5
	str r0, [sp, #0x24]
	movs r0, #0x54
	str r2, [sp, #0xc]
	str r1, [sp, #0x28]
	str r0, [sp, #0x2c]
	cmp r1, #2
	bne _0222B114
	lsls r0, r3, #8
	adds r0, r2, r0
	str r0, [sp, #0xc]
_0222B114:
	add r0, sp, #0
	bl FUN_02024624
	adds r4, r0, #0
	beq _0222B13C
	movs r1, #1
	bl FUN_0202484C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_02024A04
	adds r0, r4, #0
	movs r1, #0
	bl FUN_020248F0
	adds r0, r4, #0
	movs r1, #1
	bl FUN_02024830
_0222B13C:
	adds r0, r4, #0
	add sp, #0x30
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_0222B0C8

	thumb_func_start ov74_0222B144
ov74_0222B144: @ 0x0222B144
	push {r4, lr}
	movs r1, #1
	adds r4, r0, #0
	bl ov74_0222B0C8
	ldr r1, _0222B198 @ =0x00003014
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #2
	bl FUN_02024950
	ldr r0, _0222B198 @ =0x00003014
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_020249D4
	ldr r0, _0222B198 @ =0x00003014
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	ldr r0, _0222B198 @ =0x00003014
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024ADC
	ldr r0, _0222B198 @ =0x00003014
	movs r1, #2
	ldr r0, [r4, r0]
	bl FUN_0202487C
	ldr r0, _0222B198 @ =0x00003014
	ldr r0, [r4, r0]
	bl FUN_020248AC
	movs r1, #2
	lsls r1, r1, #0x12
	str r1, [r0]
	movs r1, #6
	lsls r1, r1, #0x10
	str r1, [r0, #4]
	pop {r4, pc}
	.align 2, 0
_0222B198: .4byte 0x00003014
	thumb_func_end ov74_0222B144

	thumb_func_start ov74_0222B19C
ov74_0222B19C: @ 0x0222B19C
	push {r4, lr}
	movs r1, #2
	adds r4, r0, #0
	bl ov74_0222B0C8
	ldr r1, _0222B1F0 @ =0x00003060
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #4
	bl FUN_02024950
	ldr r0, _0222B1F0 @ =0x00003060
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_020249D4
	ldr r0, _0222B1F0 @ =0x00003060
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	ldr r0, _0222B1F0 @ =0x00003060
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024ADC
	ldr r0, _0222B1F0 @ =0x00003060
	movs r1, #2
	ldr r0, [r4, r0]
	bl FUN_0202487C
	ldr r0, _0222B1F0 @ =0x00003060
	ldr r0, [r4, r0]
	bl FUN_020248AC
	movs r1, #2
	lsls r1, r1, #0x12
	str r1, [r0]
	lsls r1, r1, #1
	str r1, [r0, #4]
	pop {r4, pc}
	nop
_0222B1F0: .4byte 0x00003060
	thumb_func_end ov74_0222B19C

	thumb_func_start ov74_0222B1F4
ov74_0222B1F4: @ 0x0222B1F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222B208 @ =0x00003014
	ldr r0, [r4, r0]
	bl FUN_02024758
	ldr r0, _0222B208 @ =0x00003014
	movs r1, #0
	str r1, [r4, r0]
	pop {r4, pc}
	.align 2, 0
_0222B208: .4byte 0x00003014
	thumb_func_end ov74_0222B1F4

	thumb_func_start ov74_0222B20C
ov74_0222B20C: @ 0x0222B20C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222B220 @ =0x00003060
	ldr r0, [r4, r0]
	bl FUN_02024758
	ldr r0, _0222B220 @ =0x00003060
	movs r1, #0
	str r1, [r4, r0]
	pop {r4, pc}
	.align 2, 0
_0222B220: .4byte 0x00003060
	thumb_func_end ov74_0222B20C

	thumb_func_start ov74_0222B224
ov74_0222B224: @ 0x0222B224
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #2
	ldr r7, _0222B27C @ =0x00001854
	str r0, [sp]
	movs r4, #0
	adds r5, r0, #0
	lsls r6, r6, #0xc
_0222B232:
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	beq _0222B242
	adds r1, r6, #0
	bl FUN_020249B0
_0222B242:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0222B24E
	adds r1, r6, #0
	bl FUN_020249B0
_0222B24E:
	adds r4, r4, #1
	adds r5, #0x4c
	cmp r4, #0x50
	blt _0222B232
	ldr r1, _0222B280 @ =0x00003014
	ldr r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _0222B268
	movs r1, #2
	lsls r1, r1, #0xc
	bl FUN_020249B0
_0222B268:
	ldr r1, _0222B284 @ =0x00003060
	ldr r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _0222B27A
	movs r1, #2
	lsls r1, r1, #0xc
	bl FUN_020249B0
_0222B27A:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222B27C: .4byte 0x00001854
_0222B280: .4byte 0x00003014
_0222B284: .4byte 0x00003060
	thumb_func_end ov74_0222B224

	thumb_func_start ov74_0222B288
ov74_0222B288: @ 0x0222B288
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
	movs r7, #1
_0222B292:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov74_0222B0C8
	adds r1, r5, #0
	adds r1, #0x94
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02024950
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #0
	bl FUN_020249D4
	adds r4, r4, #1
	adds r5, #0x4c
	cmp r4, #0x50
	blt _0222B292
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov74_0222B288

	thumb_func_start ov74_0222B2C4
ov74_0222B2C4: @ 0x0222B2C4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
	adds r7, r4, #0
_0222B2CE:
	cmp r4, #0x14
	bge _0222B2FA
	adds r0, r6, #0
	movs r1, #1
	bl ov74_0222B0C8
	adds r1, r5, #0
	adds r1, #0x94
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02024950
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #0
	bl FUN_020249D4
	b _0222B300
_0222B2FA:
	adds r0, r5, #0
	adds r0, #0x94
	str r7, [r0]
_0222B300:
	adds r4, r4, #1
	adds r5, #0x4c
	cmp r4, #0x50
	blt _0222B2CE
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov74_0222B2C4

	thumb_func_start ov74_0222B30C
ov74_0222B30C: @ 0x0222B30C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _0222B340 @ =0x00001854
	movs r4, #0
	adds r5, r6, #0
_0222B316:
	adds r0, r6, #0
	movs r1, #2
	bl ov74_0222B0C8
	ldr r1, _0222B340 @ =0x00001854
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #5
	bl FUN_02024950
	ldr r0, [r5, r7]
	movs r1, #0
	bl FUN_020249D4
	adds r4, r4, #1
	adds r5, #0x4c
	cmp r4, #0x50
	blt _0222B316
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222B340: .4byte 0x00001854
	thumb_func_end ov74_0222B30C

	thumb_func_start ov74_0222B344
ov74_0222B344: @ 0x0222B344
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r5, r0, #0
	adds r6, r4, #0
_0222B34C:
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	beq _0222B36A
	bl FUN_02024758
	adds r0, r5, #0
	adds r0, #0x94
	str r6, [r0]
	adds r0, r5, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl FUN_0200E390
_0222B36A:
	adds r4, r4, #1
	adds r5, #0x4c
	cmp r4, #0x50
	blt _0222B34C
	pop {r4, r5, r6, pc}
	thumb_func_end ov74_0222B344

	thumb_func_start ov74_0222B374
ov74_0222B374: @ 0x0222B374
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r7, _0222B39C @ =0x00001890
	adds r5, r0, #0
	adds r6, r4, #0
_0222B37E:
	ldr r0, _0222B3A0 @ =0x00001854
	ldr r0, [r5, r0]
	bl FUN_02024758
	ldr r0, _0222B3A0 @ =0x00001854
	str r6, [r5, r0]
	ldr r0, [r5, r7]
	bl FUN_0200E390
	adds r4, r4, #1
	adds r5, #0x4c
	cmp r4, #0x50
	blt _0222B37E
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222B39C: .4byte 0x00001890
_0222B3A0: .4byte 0x00001854
	thumb_func_end ov74_0222B374

	thumb_func_start ov74_0222B3A4
ov74_0222B3A4: @ 0x0222B3A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xb8
	adds r5, r0, #0
	str r0, [sp]
	adds r0, #0x88
	ldr r3, _0222B5E8 @ =0x0223B3BC
	movs r4, #0
	add r7, sp, #0x64
	str r0, [sp]
	add r2, sp, #0x10
	movs r6, #0xa
_0222B3BA:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r6, r6, #1
	bne _0222B3BA
	ldr r0, [r3]
	str r0, [r2]
_0222B3C6:
	movs r2, #2
	adds r0, r5, #0
	movs r1, #6
	lsls r2, r2, #0x12
	adds r0, #0x98
	str r2, [r0]
	adds r0, r5, #0
	lsls r1, r1, #0x10
	adds r0, #0x9c
	str r1, [r0]
	adds r0, r5, #0
	lsrs r1, r2, #5
	adds r0, #0xa4
	str r1, [r0]
	movs r1, #5
	adds r0, r5, #0
	lsls r1, r1, #0xc
	adds r0, #0xa8
	str r1, [r0]
	lsrs r2, r4, #0x1f
	lsls r1, r4, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r5, #0
	adds r1, r2, r1
	adds r0, #0xb4
	str r1, [r0]
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0xbc
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0x8c
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #0xa
	blx FUN_020F2998
	adds r0, r0, #4
	cmp r0, #0
	ble _0222B42C
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0222B43A
_0222B42C:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0222B43A:
	blx FUN_020F2104
	adds r1, r5, #0
	adds r1, #0xa4
	str r0, [r1]
	cmp r4, #0x32
	ble _0222B462
	bl FUN_0201FD44
	movs r1, #5
	blx FUN_020F2998
	movs r0, #0x41
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r0, r1
	adds r0, r5, #0
	adds r0, #0xb8
	str r1, [r0]
	b _0222B4EC
_0222B462:
	cmp r4, #0x28
	ble _0222B47E
	bl FUN_0201FD44
	movs r1, #5
	blx FUN_020F2998
	adds r0, r4, #0
	adds r0, #0xfa
	adds r1, r0, r1
	adds r0, r5, #0
	adds r0, #0xb8
	str r1, [r0]
	b _0222B4EC
_0222B47E:
	cmp r4, #0x1e
	ble _0222B49A
	bl FUN_0201FD44
	movs r1, #5
	blx FUN_020F2998
	adds r0, r4, #0
	adds r0, #0xf0
	adds r1, r0, r1
	adds r0, r5, #0
	adds r0, #0xb8
	str r1, [r0]
	b _0222B4EC
_0222B49A:
	cmp r4, #0x19
	ble _0222B4B6
	bl FUN_0201FD44
	movs r1, #5
	blx FUN_020F2998
	adds r0, r4, #0
	adds r0, #0xe6
	adds r1, r0, r1
	adds r0, r5, #0
	adds r0, #0xb8
	str r1, [r0]
	b _0222B4EC
_0222B4B6:
	cmp r4, #0x14
	ble _0222B4D2
	bl FUN_0201FD44
	movs r1, #5
	blx FUN_020F2998
	adds r0, r4, #0
	adds r0, #0xdc
	adds r1, r0, r1
	adds r0, r5, #0
	adds r0, #0xb8
	str r1, [r0]
	b _0222B4EC
_0222B4D2:
	add r6, sp, #0x10
	add r3, sp, #0x64
	movs r2, #0xa
_0222B4D8:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0222B4D8
	ldr r0, [r6]
	str r0, [r3]
	adds r0, r5, #0
	ldr r1, [r7]
	adds r0, #0xb8
	str r1, [r0]
_0222B4EC:
	adds r0, r5, #0
	adds r0, #0xb8
	ldr r0, [r0]
	adds r1, r0, #1
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	blx FUN_020F0BD8
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _0222B5EC @ =0x66666666
	ldr r1, _0222B5F0 @ =0x3FE66666
	blx FUN_020F0C54
	blx FUN_020F0AA8
	adds r1, r5, #0
	adds r1, #0xb8
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xb8
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0xb8
	str r1, [r0]
	adds r0, r5, #0
	movs r1, #0xf
	adds r0, #0xc0
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc8
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0xcc
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl FUN_020248AC
	adds r3, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #4
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bl FUN_0201FD44
	movs r1, #0xe0
	blx FUN_020F2998
	adds r1, #0x10
	cmp r1, #0
	ble _0222B586
	bl FUN_0201FD44
	movs r1, #0xe0
	blx FUN_020F2998
	adds r1, #0x10
	lsls r0, r1, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0222B5A0
_0222B586:
	bl FUN_0201FD44
	movs r1, #0xe0
	blx FUN_020F2998
	adds r1, #0x10
	lsls r0, r1, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0222B5A0:
	blx FUN_020F2104
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	add r1, sp, #4
	bl FUN_020247D4
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	ldr r0, _0222B5F4 @ =ov74_0222BA48
	ldr r1, [sp]
	movs r2, #6
	bl FUN_0200E320
	adds r1, r5, #0
	adds r1, #0xd0
	str r0, [r1]
	ldr r0, [sp]
	adds r4, r4, #1
	adds r0, #0x4c
	adds r5, #0x4c
	adds r7, r7, #4
	str r0, [sp]
	cmp r4, #0x50
	bge _0222B5E4
	b _0222B3C6
_0222B5E4:
	add sp, #0xb8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222B5E8: .4byte 0x0223B3BC
_0222B5EC: .4byte 0x66666666
_0222B5F0: .4byte 0x3FE66666
_0222B5F4: .4byte ov74_0222BA48
	thumb_func_end ov74_0222B3A4

	thumb_func_start ov74_0222B5F8
ov74_0222B5F8: @ 0x0222B5F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r7, r5, #0
	movs r4, #0
	adds r7, #0x88
_0222B604:
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	bne _0222B610
	b _0222B74C
_0222B610:
	adds r1, r5, #0
	movs r0, #2
	adds r1, #0x98
	lsls r0, r0, #0x12
	str r0, [r1]
	adds r1, r5, #0
	movs r0, #6
	adds r1, #0x9c
	lsls r0, r0, #0x10
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0xa4
	lsrs r0, r0, #3
	str r0, [r1]
	adds r1, r5, #0
	movs r0, #1
	adds r1, #0xa8
	lsls r0, r0, #0xc
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0xb4
	movs r0, #0xff
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0xbc
	movs r0, #0
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x8c
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x90
	str r0, [r1]
	cmp r4, #0x1e
	ble _0222B66A
	bl FUN_0201FD44
	movs r1, #0xa
	blx FUN_020F2998
	adds r0, r5, #0
	adds r1, #0xf
	adds r0, #0xb8
	str r1, [r0]
	b _0222B6AC
_0222B66A:
	cmp r4, #0x14
	ble _0222B682
	bl FUN_0201FD44
	movs r1, #0xa
	blx FUN_020F2998
	adds r0, r5, #0
	adds r1, #0xa
	adds r0, #0xb8
	str r1, [r0]
	b _0222B6AC
_0222B682:
	cmp r4, #0xa
	ble _0222B69A
	bl FUN_0201FD44
	movs r1, #5
	blx FUN_020F2998
	adds r0, r5, #0
	adds r1, #0xa
	adds r0, #0xb8
	str r1, [r0]
	b _0222B6AC
_0222B69A:
	bl FUN_0201FD44
	movs r1, #5
	blx FUN_020F2998
	adds r0, r5, #0
	adds r1, r1, #5
	adds r0, #0xb8
	str r1, [r0]
_0222B6AC:
	adds r1, r5, #0
	adds r1, #0xb8
	movs r0, #0
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc8
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0xcc
	str r1, [r0]
	bl FUN_0201FD44
	movs r1, #0x5a
	lsls r1, r1, #2
	blx FUN_020F2998
	str r1, [sp]
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1b
	subs r1, r1, r2
	movs r0, #0x1b
	rors r1, r0
	ldr r0, [sp]
	adds r6, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, #0x40
	bl FUN_0201FCAC
	adds r1, r5, #0
	adds r1, #0x98
	ldr r1, [r1]
	muls r0, r6, r0
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [sp]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	adds r1, r5, #0
	adds r1, #0x9c
	ldr r1, [r1]
	muls r0, r6, r0
	adds r0, r1, r0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	add r1, sp, #4
	bl FUN_020247D4
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02024950
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	ldr r0, _0222B75C @ =ov74_0222BA48
	adds r1, r7, #0
	movs r2, #6
	bl FUN_0200E320
	adds r1, r5, #0
	adds r1, #0xd0
	str r0, [r1]
_0222B74C:
	adds r4, r4, #1
	adds r5, #0x4c
	adds r7, #0x4c
	cmp r4, #0x50
	bge _0222B758
	b _0222B604
_0222B758:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222B75C: .4byte ov74_0222BA48
	thumb_func_end ov74_0222B5F8

	thumb_func_start ov74_0222B760
ov74_0222B760: @ 0x0222B760
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0222B928 @ =0x00001848
	movs r4, #0
	adds r6, r5, r0
_0222B76C:
	movs r1, #2
	ldr r0, _0222B92C @ =0x00001858
	lsls r1, r1, #0x12
	str r1, [r5, r0]
	movs r1, #6
	lsls r1, r1, #0x12
	adds r0, r0, #4
	str r1, [r5, r0]
	movs r1, #1
	ldr r0, _0222B930 @ =0x00001864
	lsls r1, r1, #0xe
	str r1, [r5, r0]
	movs r1, #5
	lsls r1, r1, #0xc
	adds r0, r0, #4
	str r1, [r5, r0]
	lsrs r2, r4, #0x1f
	lsls r1, r4, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	adds r1, r0, #4
	ldr r0, _0222B934 @ =0x00001874
	str r1, [r5, r0]
	movs r1, #0
	adds r0, #8
	str r1, [r5, r0]
	ldr r0, _0222B938 @ =0x0000184C
	str r1, [r5, r0]
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	adds r1, r0, #2
	ldr r0, _0222B93C @ =0x00001884
	str r1, [r5, r0]
	adds r0, r4, #0
	movs r1, #0x1e
	blx FUN_020F2998
	adds r0, r0, #4
	cmp r0, #0
	ble _0222B7DE
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0222B7EC
_0222B7DE:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0222B7EC:
	blx FUN_020F2104
	ldr r1, _0222B930 @ =0x00001864
	cmp r4, #0x3c
	str r0, [r5, r1]
	ble _0222B812
	movs r0, #0x62
	movs r1, #5
	lsls r0, r0, #6
	str r1, [r5, r0]
	bl FUN_0201FD44
	movs r1, #0xa
	blx FUN_020F2998
	ldr r0, _0222B940 @ =0x00001878
	adds r1, #0x46
	str r1, [r5, r0]
	b _0222B8C0
_0222B812:
	cmp r4, #0x32
	ble _0222B830
	movs r0, #0x62
	movs r1, #5
	lsls r0, r0, #6
	str r1, [r5, r0]
	bl FUN_0201FD44
	movs r1, #0xa
	blx FUN_020F2998
	ldr r0, _0222B940 @ =0x00001878
	adds r1, #0x3c
	str r1, [r5, r0]
	b _0222B8C0
_0222B830:
	cmp r4, #0x28
	ble _0222B84E
	movs r0, #0x62
	movs r1, #5
	lsls r0, r0, #6
	str r1, [r5, r0]
	bl FUN_0201FD44
	movs r1, #5
	blx FUN_020F2998
	ldr r0, _0222B940 @ =0x00001878
	adds r1, #0x32
	str r1, [r5, r0]
	b _0222B8C0
_0222B84E:
	cmp r4, #0x1e
	ble _0222B86C
	movs r0, #0x62
	movs r1, #5
	lsls r0, r0, #6
	str r1, [r5, r0]
	bl FUN_0201FD44
	movs r1, #0xa
	blx FUN_020F2998
	ldr r0, _0222B940 @ =0x00001878
	adds r1, #0x28
	str r1, [r5, r0]
	b _0222B8C0
_0222B86C:
	cmp r4, #0x14
	ble _0222B88A
	movs r0, #0x62
	movs r1, #5
	lsls r0, r0, #6
	str r1, [r5, r0]
	bl FUN_0201FD44
	movs r1, #0xa
	blx FUN_020F2998
	ldr r0, _0222B940 @ =0x00001878
	adds r1, #0x1e
	str r1, [r5, r0]
	b _0222B8C0
_0222B88A:
	cmp r4, #0xa
	ble _0222B8A8
	movs r0, #0x62
	movs r1, #5
	lsls r0, r0, #6
	str r1, [r5, r0]
	bl FUN_0201FD44
	movs r1, #5
	blx FUN_020F2998
	ldr r0, _0222B940 @ =0x00001878
	adds r1, #0x14
	str r1, [r5, r0]
	b _0222B8C0
_0222B8A8:
	movs r0, #0x62
	movs r1, #5
	lsls r0, r0, #6
	str r1, [r5, r0]
	bl FUN_0201FD44
	movs r1, #5
	blx FUN_020F2998
	ldr r0, _0222B940 @ =0x00001878
	adds r1, #0xa
	str r1, [r5, r0]
_0222B8C0:
	movs r0, #0x62
	lsls r0, r0, #6
	ldr r1, [r5, r0]
	adds r0, #8
	str r1, [r5, r0]
	movs r0, #0x62
	lsls r0, r0, #6
	ldr r1, [r5, r0]
	adds r0, #0xc
	str r1, [r5, r0]
	ldr r0, _0222B944 @ =0x00001854
	ldr r0, [r5, r0]
	bl FUN_020248AC
	adds r3, r0, #0
	add r2, sp, #0
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r1, r7, #0
	str r0, [r2]
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #0x12
	str r0, [sp, #4]
	ldr r0, _0222B944 @ =0x00001854
	ldr r0, [r5, r0]
	bl FUN_020247D4
	ldr r0, _0222B944 @ =0x00001854
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_02024830
	ldr r0, _0222B948 @ =ov74_0222BA48
	adds r1, r6, #0
	movs r2, #6
	bl FUN_0200E320
	ldr r1, _0222B94C @ =0x00001890
	adds r4, r4, #1
	str r0, [r5, r1]
	adds r5, #0x4c
	adds r6, #0x4c
	cmp r4, #0x50
	bge _0222B924
	b _0222B76C
_0222B924:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222B928: .4byte 0x00001848
_0222B92C: .4byte 0x00001858
_0222B930: .4byte 0x00001864
_0222B934: .4byte 0x00001874
_0222B938: .4byte 0x0000184C
_0222B93C: .4byte 0x00001884
_0222B940: .4byte 0x00001878
_0222B944: .4byte 0x00001854
_0222B948: .4byte ov74_0222BA48
_0222B94C: .4byte 0x00001890
	thumb_func_end ov74_0222B760

	thumb_func_start ov74_0222B950
ov74_0222B950: @ 0x0222B950
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r5, r1, #0
	movs r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	str r1, [sp]
	str r1, [sp, #4]
	blx FUN_020F2178
	adds r1, r4, #0
	blx FUN_020F24C8
	str r0, [sp, #8]
	adds r0, r5, #0
	blx FUN_020F2178
	adds r1, r6, #0
	blx FUN_020F24C8
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	adds r1, r0, #0
	blx FUN_020F22DC
	adds r4, r0, #0
	ldr r0, [sp, #0xc]
	adds r1, r0, #0
	blx FUN_020F22DC
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020F1520
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020F1ACC
	ldr r0, _0222BA44 @ =0x45800000
	bls _0222B9B8
	adds r1, r4, #0
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0222B9C6
_0222B9B8:
	adds r1, r4, #0
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0222B9C6:
	blx FUN_020F2104
	blx FUN_020CCBEC
	blx FUN_020F2178
	ldr r1, _0222BA44 @ =0x45800000
	blx FUN_020F1CC8
	ldr r1, [sp, #0x30]
	adds r4, r0, #0
	blx FUN_020F1B90
	blo _0222B9FE
	add r1, sp, #0x18
	movs r0, #0x1c
	ldrsh r0, [r1, r0]
	blx FUN_020F2178
	adds r1, r4, #0
	blx FUN_020F1ACC
	bhi _0222B9FE
	movs r0, #0
	adds r1, r4, #0
	blx FUN_020F1BEC
	bne _0222BA04
_0222B9FE:
	add sp, #0x18
	movs r0, #0
	pop {r4, r5, r6, pc}
_0222BA04:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x30]
	blx FUN_020F22DC
	adds r1, r4, #0
	blx FUN_020F1CC8
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x30]
	blx FUN_020F22DC
	adds r1, r4, #0
	blx FUN_020F1CC8
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r1, [sp]
	blx FUN_020F1520
	ldr r1, [sp, #0x28]
	str r0, [r1]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #4]
	blx FUN_020F1520
	ldr r1, [sp, #0x2c]
	str r0, [r1]
	movs r0, #1
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_0222BA44: .4byte 0x45800000
	thumb_func_end ov74_0222B950

	thumb_func_start ov74_0222BA48
ov74_0222BA48: @ 0x0222BA48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r1, #0
	ldr r0, [r5, #0x30]
	cmp r0, #0
	ldr r0, [r5, #0xc]
	beq _0222BA66
	movs r1, #0
	bl FUN_020249D4
	ldr r0, [r5, #0x30]
	add sp, #0x24
	subs r0, r0, #1
	str r0, [r5, #0x30]
	pop {r4, r5, r6, r7, pc}
_0222BA66:
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r5, #0xc]
	bl FUN_020248AC
	adds r3, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x18
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #0x18]
	blx FUN_020F2178
	ldr r1, _0222BD90 @ =0x45800000
	blx FUN_020F1CC8
	adds r6, r0, #0
	ldr r0, [sp, #0x1c]
	blx FUN_020F2178
	ldr r1, _0222BD90 @ =0x45800000
	blx FUN_020F1CC8
	adds r7, r0, #0
	ldr r0, [r5, #0x1c]
	blx FUN_020F2178
	ldr r1, _0222BD90 @ =0x45800000
	blx FUN_020F1CC8
	adds r4, r0, #0
	ldr r0, [r5, #0x20]
	blx FUN_020F2178
	ldr r1, _0222BD90 @ =0x45800000
	blx FUN_020F1CC8
	blx FUN_020F2104
	add r1, sp, #0x14
	str r1, [sp]
	add r1, sp, #0x10
	str r1, [sp, #4]
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	lsls r0, r0, #4
	lsls r1, r1, #4
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov74_0222B950
	cmp r0, #0
	beq _0222BB5A
	ldr r0, [r5, #0x24]
	cmp r0, #0
	bne _0222BB5A
	ldr r0, [sp, #0x14]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _0222BD90 @ =0x45800000
	bls _0222BB00
	ldr r1, [sp, #0x14]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0222BB0E
_0222BB00:
	ldr r1, [sp, #0x14]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0222BB0E:
	blx FUN_020F2104
	ldr r1, [sp, #0x18]
	adds r0, r1, r0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _0222BD90 @ =0x45800000
	bls _0222BB36
	ldr r1, [sp, #0x10]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0222BB44
_0222BB36:
	ldr r1, [sp, #0x10]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0222BB44:
	blx FUN_020F2104
	ldr r1, [sp, #0x1c]
	adds r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0xc]
	add r1, sp, #0x18
	bl FUN_020247D4
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0222BB5A:
	ldr r0, [r5, #0x24]
	cmp r0, #0
	beq _0222BB68
	cmp r0, #1
	beq _0222BBDE
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0222BB68:
	ldr r1, [r5, #0x10]
	ldr r0, [sp, #0x18]
	subs r0, r1, r0
	cmp r0, #0
	ble _0222BB84
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0222BB92
_0222BB84:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0222BB92:
	adds r4, r0, #0
	ldr r1, [r5, #0x14]
	ldr r0, [sp, #0x1c]
	subs r0, r1, r0
	cmp r0, #0
	ble _0222BBB0
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0222BBBE
_0222BBB0:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0222BBBE:
	blx FUN_020F2104
	adds r6, r0, #0
	adds r0, r4, #0
	blx FUN_020F2104
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020CD5DC
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x24]
	add sp, #0x24
	adds r0, r0, #1
	str r0, [r5, #0x24]
	pop {r4, r5, r6, r7, pc}
_0222BBDE:
	ldr r0, [r5, #4]
	cmp r0, #0x14
	bge _0222BBEA
	adds r0, r0, #1
	str r0, [r5, #4]
	b _0222BBEE
_0222BBEA:
	movs r0, #1
	str r0, [r5, #8]
_0222BBEE:
	ldr r0, [r5, #0x28]
	adds r0, #8
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	bne _0222BC44
	ldr r0, [r5, #0x34]
	movs r1, #0x5a
	adds r0, #8
	lsls r1, r1, #2
	str r0, [r5, #0x34]
	blx FUN_020F2998
	lsls r0, r1, #0x10
	str r1, [r5, #0x34]
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	ldr r1, [r5, #0x38]
	muls r0, r1, r0
	asrs r0, r0, #0xc
	str r0, [r5, #0x40]
	ldr r0, [r5, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r1, [r5, #0x40]
	ldr r2, [r5, #0x10]
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x14]
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [sp, #0x1c]
	b _0222BEBC
_0222BC44:
	cmp r0, #1
	bne _0222BC92
	ldr r0, [r5, #0x34]
	movs r1, #0x5a
	adds r0, #8
	lsls r1, r1, #2
	str r0, [r5, #0x34]
	blx FUN_020F2998
	lsls r0, r1, #0x10
	str r1, [r5, #0x34]
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r1, [r5, #0x38]
	muls r0, r1, r0
	asrs r0, r0, #0xc
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r1, [r5, #0x40]
	ldr r2, [r5, #0x10]
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x14]
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [sp, #0x1c]
	b _0222BEBC
_0222BC92:
	cmp r0, #2
	bne _0222BCF0
	ldr r0, [r5, #0x34]
	movs r1, #0x5a
	adds r0, #8
	lsls r1, r1, #2
	str r0, [r5, #0x34]
	blx FUN_020F2998
	lsls r0, r1, #0x10
	str r1, [r5, #0x34]
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r1, [r5, #0x38]
	muls r0, r1, r0
	asrs r0, r0, #0xc
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r1, [r5, #0x40]
	ldr r3, [r5, #0x10]
	adds r2, r1, #0
	muls r2, r0, r2
	movs r0, #0
	mvns r0, r0
	muls r0, r2, r0
	adds r0, r3, r0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	ldr r1, [r5, #0x44]
	ldr r3, [r5, #0x14]
	adds r2, r1, #0
	muls r2, r0, r2
	movs r0, #0
	mvns r0, r0
	muls r0, r2, r0
	adds r0, r3, r0
	str r0, [sp, #0x1c]
	b _0222BEBC
_0222BCF0:
	cmp r0, #3
	bne _0222BD4E
	ldr r0, [r5, #0x34]
	movs r1, #0x5a
	adds r0, #8
	lsls r1, r1, #2
	str r0, [r5, #0x34]
	blx FUN_020F2998
	lsls r0, r1, #0x10
	str r1, [r5, #0x34]
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	ldr r1, [r5, #0x38]
	muls r0, r1, r0
	asrs r0, r0, #0xc
	str r0, [r5, #0x40]
	ldr r0, [r5, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r1, [r5, #0x40]
	ldr r3, [r5, #0x10]
	adds r2, r1, #0
	muls r2, r0, r2
	movs r0, #0
	mvns r0, r0
	muls r0, r2, r0
	adds r0, r3, r0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	ldr r1, [r5, #0x44]
	ldr r3, [r5, #0x14]
	adds r2, r1, #0
	muls r2, r0, r2
	movs r0, #0
	mvns r0, r0
	muls r0, r2, r0
	adds r0, r3, r0
	str r0, [sp, #0x1c]
	b _0222BEBC
_0222BD4E:
	cmp r0, #4
	bne _0222BD94
	ldr r1, [r5, #0x38]
	cmp r1, #0x60
	bge _0222BD5E
	ldr r0, [r5, #0x3c]
	adds r0, r1, r0
	str r0, [r5, #0x38]
_0222BD5E:
	ldr r0, [r5, #0x38]
	str r0, [r5, #0x40]
	ldr r0, [r5, #0x38]
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r1, [r5, #0x40]
	ldr r2, [r5, #0x10]
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x14]
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [sp, #0x1c]
	b _0222BEBC
	.align 2, 0
_0222BD90: .4byte 0x45800000
_0222BD94:
	cmp r0, #5
	bne _0222BDE6
	ldr r1, [r5, #0x38]
	cmp r1, #0x60
	bge _0222BDA4
	ldr r0, [r5, #0x3c]
	adds r0, r1, r0
	str r0, [r5, #0x38]
_0222BDA4:
	ldr r0, [r5, #0x38]
	str r0, [r5, #0x40]
	ldr r0, [r5, #0x38]
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	ldr r1, [r5, #0x40]
	ldr r3, [r5, #0x10]
	adds r2, r1, #0
	muls r2, r0, r2
	movs r0, #0
	mvns r0, r0
	muls r0, r2, r0
	adds r0, r3, r0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCC0
	ldr r1, [r5, #0x44]
	ldr r3, [r5, #0x14]
	adds r2, r1, #0
	muls r2, r0, r2
	movs r0, #0
	mvns r0, r0
	muls r0, r2, r0
	adds r0, r3, r0
	str r0, [sp, #0x1c]
	b _0222BEBC
_0222BDE6:
	movs r0, #0xa
	str r0, [r5, #4]
	movs r0, #2
	ldr r1, [r5, #0x1c]
	lsls r0, r0, #0xa
	adds r0, r1, r0
	str r0, [r5, #0x1c]
	ldr r0, [sp, #0x18]
	blx FUN_020F2178
	ldr r1, _0222BED4 @ =0x45800000
	blx FUN_020F1CC8
	adds r4, r0, #0
	ldr r0, [sp, #0x1c]
	blx FUN_020F2178
	ldr r1, _0222BED4 @ =0x45800000
	blx FUN_020F1CC8
	adds r6, r0, #0
	ldr r0, [r5, #0x1c]
	blx FUN_020F2178
	ldr r1, _0222BED4 @ =0x45800000
	blx FUN_020F1CC8
	add r1, sp, #0x14
	str r1, [sp]
	add r1, sp, #0x10
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	lsls r0, r0, #4
	lsls r1, r1, #4
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov74_0222B950
	cmp r0, #0
	beq _0222BEB8
	ldr r0, [sp, #0x14]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _0222BED4 @ =0x45800000
	bls _0222BE60
	ldr r1, [sp, #0x14]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0222BE6E
_0222BE60:
	ldr r1, [sp, #0x14]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0222BE6E:
	blx FUN_020F2104
	ldr r1, [sp, #0x18]
	adds r0, r1, r0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	movs r1, #0
	blx FUN_020F1ACC
	ldr r0, _0222BED4 @ =0x45800000
	bls _0222BE96
	ldr r1, [sp, #0x10]
	blx FUN_020F22DC
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0222BEA4
_0222BE96:
	ldr r1, [sp, #0x10]
	blx FUN_020F22DC
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0222BEA4:
	blx FUN_020F2104
	ldr r1, [sp, #0x1c]
	adds r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0xc]
	add r1, sp, #0x18
	bl FUN_020247D4
	b _0222BEBC
_0222BEB8:
	movs r0, #1
	str r0, [r5, #8]
_0222BEBC:
	movs r1, #0x5a
	ldr r0, [r5, #0x28]
	lsls r1, r1, #2
	blx FUN_020F2998
	str r1, [r5, #0x28]
	ldr r0, [r5, #0xc]
	add r1, sp, #0x18
	bl FUN_020247D4
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222BED4: .4byte 0x45800000
	thumb_func_end ov74_0222BA48

	thumb_func_start ov74_0222BED8
ov74_0222BED8: @ 0x0222BED8
	adds r3, r0, #0
	movs r2, #8
	ldrsb r2, [r3, r2]
	ldr r3, _0222BEE8 @ =FUN_020CF178
	ldr r0, _0222BEEC @ =0x04000050
	movs r1, #0x22
	bx r3
	nop
_0222BEE8: .4byte FUN_020CF178
_0222BEEC: .4byte 0x04000050
	thumb_func_end ov74_0222BED8

	thumb_func_start ov74_0222BEF0
ov74_0222BEF0: @ 0x0222BEF0
	adds r3, r0, #0
	movs r2, #8
	ldrsb r2, [r3, r2]
	ldr r3, _0222BF00 @ =FUN_020CF178
	ldr r0, _0222BF04 @ =0x04001050
	movs r1, #0x22
	bx r3
	nop
_0222BF00: .4byte FUN_020CF178
_0222BF04: .4byte 0x04001050
	thumb_func_end ov74_0222BEF0

	thumb_func_start ov74_0222BF08
ov74_0222BF08: @ 0x0222BF08
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_0222BED8
	adds r0, r4, #0
	bl ov74_0222BEF0
	pop {r4, pc}
	thumb_func_end ov74_0222BF08

	thumb_func_start ov74_0222BF18
ov74_0222BF18: @ 0x0222BF18
	push {r3, lr}
	movs r0, #1
	movs r1, #0
	bl FUN_0201C2D8
	movs r0, #5
	movs r1, #0
	bl FUN_0201C2D8
	pop {r3, pc}
	thumb_func_end ov74_0222BF18

	thumb_func_start ov74_0222BF2C
ov74_0222BF2C: @ 0x0222BF2C
	push {r4, lr}
	movs r4, #1
	cmp r1, #0
	beq _0222BF3E
	cmp r1, #1
	beq _0222BF6A
	cmp r1, #2
	beq _0222BF84
	b _0222BF98
_0222BF3E:
	movs r1, #8
	ldrsb r1, [r0, r1]
	cmp r1, #0
	ble _0222BF58
	subs r1, r1, r2
	cmp r1, #0
	ble _0222BF52
	strb r1, [r0, #8]
	movs r4, #0
	b _0222BF98
_0222BF52:
	movs r1, #0
	strb r1, [r0, #8]
	b _0222BF98
_0222BF58:
	bge _0222BF98
	adds r1, r1, r2
	bpl _0222BF64
	strb r1, [r0, #8]
	movs r4, #0
	b _0222BF98
_0222BF64:
	movs r1, #0
	strb r1, [r0, #8]
	b _0222BF98
_0222BF6A:
	movs r3, #8
	ldrsb r1, [r0, r3]
	subs r2, r1, r2
	adds r1, r3, #0
	subs r1, #0x18
	cmp r2, r1
	ble _0222BF7E
	strb r2, [r0, #8]
	movs r4, #0
	b _0222BF98
_0222BF7E:
	subs r3, #0x18
	strb r3, [r0, #8]
	b _0222BF98
_0222BF84:
	movs r1, #8
	ldrsb r1, [r0, r1]
	adds r1, r1, r2
	cmp r1, #0x10
	bge _0222BF94
	strb r1, [r0, #8]
	movs r4, #0
	b _0222BF98
_0222BF94:
	movs r1, #0x10
	strb r1, [r0, #8]
_0222BF98:
	bl ov74_0222BF08
	adds r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov74_0222BF2C

	thumb_func_start ov74_0222BFA0
ov74_0222BFA0: @ 0x0222BFA0
	push {r4, lr}
	movs r4, #1
	cmp r1, #0
	beq _0222BFB2
	cmp r1, #1
	beq _0222BFDE
	cmp r1, #2
	beq _0222BFF8
	b _0222C00C
_0222BFB2:
	movs r1, #8
	ldrsb r1, [r0, r1]
	cmp r1, #0
	ble _0222BFCC
	subs r1, r1, r2
	cmp r1, #0
	ble _0222BFC6
	strb r1, [r0, #8]
	movs r4, #0
	b _0222C00C
_0222BFC6:
	movs r1, #0
	strb r1, [r0, #8]
	b _0222C00C
_0222BFCC:
	bge _0222C00C
	adds r1, r1, r2
	bpl _0222BFD8
	strb r1, [r0, #8]
	movs r4, #0
	b _0222C00C
_0222BFD8:
	movs r1, #0
	strb r1, [r0, #8]
	b _0222C00C
_0222BFDE:
	movs r3, #8
	ldrsb r1, [r0, r3]
	subs r2, r1, r2
	adds r1, r3, #0
	subs r1, #0x18
	cmp r2, r1
	ble _0222BFF2
	strb r2, [r0, #8]
	movs r4, #0
	b _0222C00C
_0222BFF2:
	subs r3, #0x18
	strb r3, [r0, #8]
	b _0222C00C
_0222BFF8:
	movs r1, #8
	ldrsb r1, [r0, r1]
	adds r1, r1, r2
	cmp r1, #0x10
	bge _0222C008
	strb r1, [r0, #8]
	movs r4, #0
	b _0222C00C
_0222C008:
	movs r1, #0x10
	strb r1, [r0, #8]
_0222C00C:
	bl ov74_0222BED8
	adds r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov74_0222BFA0

	thumb_func_start ov74_0222C014
ov74_0222C014: @ 0x0222C014
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	strb r1, [r4, #8]
	bl ov74_0222BF08
	adds r0, r4, #0
	bl ov74_0222AF28
	adds r0, r4, #0
	bl ov74_0222B288
	adds r0, r4, #0
	bl ov74_0222B3A4
	adds r0, r4, #0
	bl ov74_0222B144
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_0222C014

	thumb_func_start ov74_0222C04C
ov74_0222C04C: @ 0x0222C04C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	ldr r1, [r4]
	cmp r1, #9
	bls _0222C058
	b _0222C2BC
_0222C058:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0222C064: @ jump table
	.2byte _0222C078 - _0222C064 - 2 @ case 0
	.2byte _0222C084 - _0222C064 - 2 @ case 1
	.2byte _0222C09A - _0222C064 - 2 @ case 2
	.2byte _0222C0FE - _0222C064 - 2 @ case 3
	.2byte _0222C126 - _0222C064 - 2 @ case 4
	.2byte _0222C17C - _0222C064 - 2 @ case 5
	.2byte _0222C19A - _0222C064 - 2 @ case 6
	.2byte _0222C222 - _0222C064 - 2 @ case 7
	.2byte _0222C294 - _0222C064 - 2 @ case 8
	.2byte _0222C2A8 - _0222C064 - 2 @ case 9
_0222C078:
	adds r0, r4, #0
	bl ov74_0222C014
	movs r0, #1
	str r0, [r4]
	b _0222C2D0
_0222C084:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #2
	bl ov74_0222BF2C
	cmp r0, #0
	bne _0222C094
	b _0222C2D0
_0222C094:
	movs r0, #2
	str r0, [r4]
	b _0222C2D0
_0222C09A:
	movs r5, #0
	movs r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r5, #0
_0222C0A4:
	adds r2, r1, #0
	adds r2, #0x90
	ldr r2, [r2]
	cmp r2, #0
	beq _0222C0B2
	adds r5, r5, #1
	b _0222C0B4
_0222C0B2:
	adds r6, r3, #0
_0222C0B4:
	adds r0, r0, #1
	adds r1, #0x4c
	cmp r0, #0x50
	blt _0222C0A4
	cmp r5, #0x32
	ble _0222C0CC
	ldr r0, _0222C2D8 @ =0x00003014
	movs r1, #4
	ldr r0, [r4, r0]
	bl FUN_02024950
	b _0222C0EA
_0222C0CC:
	cmp r5, #0x1e
	ble _0222C0DC
	ldr r0, _0222C2D8 @ =0x00003014
	movs r1, #3
	ldr r0, [r4, r0]
	bl FUN_02024950
	b _0222C0EA
_0222C0DC:
	cmp r5, #7
	ble _0222C0EA
	ldr r0, _0222C2D8 @ =0x00003014
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_02024830
_0222C0EA:
	cmp r6, #0
	bne _0222C0F2
	cmp r5, #0x4f
	bne _0222C1A8
_0222C0F2:
	movs r0, #3
	str r0, [r4]
	adds r0, r4, #0
	bl ov74_0222B344
	b _0222C2D0
_0222C0FE:
	ldr r0, _0222C2DC @ =0x000030A0
	ldr r0, [r4, r0]
	ldr r0, [r0]
	cmp r0, #2
	bne _0222C1A8
	adds r0, r4, #0
	bl ov74_0222B2C4
	adds r0, r4, #0
	bl ov74_0222B5F8
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	bl ov74_0222BF18
	movs r0, #4
	str r0, [r4]
	b _0222C2D0
_0222C126:
	movs r5, #0
	movs r6, #1
	adds r1, r5, #0
	adds r2, r4, #0
	adds r0, r5, #0
_0222C130:
	adds r3, r2, #0
	adds r3, #0x94
	ldr r3, [r3]
	cmp r3, #0
	beq _0222C14A
	adds r3, r2, #0
	adds r3, #0x90
	ldr r3, [r3]
	cmp r3, #0
	beq _0222C148
	adds r5, r5, #1
	b _0222C14A
_0222C148:
	adds r6, r0, #0
_0222C14A:
	adds r1, r1, #1
	adds r2, #0x4c
	cmp r1, #0x50
	blt _0222C130
	movs r1, #2
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov74_0222BFA0
	cmp r6, #0
	bne _0222C164
	cmp r5, #0x13
	bne _0222C1A8
_0222C164:
	ldr r0, _0222C2E0 @ =0x0000061A
	bl FUN_0200604C
	movs r0, #5
	str r0, [r4]
	adds r0, r4, #0
	bl ov74_0222B344
	adds r0, r4, #0
	bl ov74_0222B19C
	b _0222C2D0
_0222C17C:
	movs r1, #2
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov74_0222BFA0
	cmp r0, #0
	beq _0222C1A8
	adds r0, r4, #0
	movs r1, #1
	movs r2, #2
	bl ov74_0222BFA0
	movs r0, #6
	str r0, [r4]
	b _0222C2D0
_0222C19A:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #2
	bl ov74_0222BFA0
	cmp r0, #0
	bne _0222C1AA
_0222C1A8:
	b _0222C2D0
_0222C1AA:
	ldr r0, _0222C2D8 @ =0x00003014
	ldr r0, [r4, r0]
	bl FUN_020248AC
	adds r5, r0, #0
	ldr r0, _0222C2E4 @ =0x00003060
	ldr r0, [r4, r0]
	bl FUN_020248AC
	movs r1, #0xe
	ldr r2, [r5, #4]
	lsls r1, r1, #0x10
	cmp r2, r1
	bge _0222C1CE
	movs r1, #2
	lsls r1, r1, #0xe
	adds r1, r2, r1
	str r1, [r5, #4]
_0222C1CE:
	movs r1, #3
	ldr r2, [r5, #4]
	lsls r1, r1, #0x12
	subs r2, r2, r1
	cmp r2, #0
	ble _0222C2D0
	ldr r2, [r0, #4]
	lsls r1, r1, #1
	cmp r2, r1
	bge _0222C202
	movs r1, #2
	lsls r1, r1, #0xe
	adds r1, r2, r1
	str r1, [r0, #4]
	ldr r0, _0222C2E4 @ =0x00003060
	ldr r0, [r4, r0]
	bl FUN_020248B8
	cmp r0, #0
	bne _0222C2D0
	ldr r0, _0222C2E4 @ =0x00003060
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_02024830
	b _0222C2D0
_0222C202:
	movs r0, #7
	str r0, [r4]
	adds r0, r4, #0
	bl ov74_0222B1F4
	adds r0, r4, #0
	bl ov74_0222B30C
	adds r0, r4, #0
	bl ov74_0222B760
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	b _0222C2D0
_0222C222:
	movs r5, #0
	ldr r0, _0222C2E8 @ =0x00001850
	movs r6, #1
	adds r2, r5, #0
	adds r3, r4, #0
	adds r7, r5, #0
_0222C22E:
	ldr r1, [r3, r0]
	cmp r1, #0
	beq _0222C238
	adds r5, r5, #1
	b _0222C23A
_0222C238:
	adds r6, r7, #0
_0222C23A:
	adds r2, r2, #1
	adds r3, #0x4c
	cmp r2, #0x50
	blt _0222C22E
	cmp r5, #7
	ble _0222C250
	adds r0, r4, #0
	movs r1, #2
	movs r2, #1
	bl ov74_0222BF2C
_0222C250:
	cmp r5, #0x32
	ble _0222C260
	ldr r0, _0222C2E4 @ =0x00003060
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	b _0222C27E
_0222C260:
	cmp r5, #0x1e
	ble _0222C270
	ldr r0, _0222C2E4 @ =0x00003060
	movs r1, #2
	ldr r0, [r4, r0]
	bl FUN_02024950
	b _0222C27E
_0222C270:
	cmp r5, #7
	ble _0222C27E
	ldr r0, _0222C2E4 @ =0x00003060
	movs r1, #3
	ldr r0, [r4, r0]
	bl FUN_02024950
_0222C27E:
	cmp r6, #0
	beq _0222C2D0
	movs r0, #8
	str r0, [r4]
	adds r0, r4, #0
	bl ov74_0222B374
	adds r0, r4, #0
	bl ov74_0222B20C
	b _0222C2D0
_0222C294:
	adds r0, r4, #0
	movs r1, #2
	movs r2, #1
	bl ov74_0222BF2C
	cmp r0, #0
	beq _0222C2D0
	movs r0, #9
	str r0, [r4]
	b _0222C2D0
_0222C2A8:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #2
	bl ov74_0222BF2C
	cmp r0, #0
	beq _0222C2D0
	movs r0, #0xff
	str r0, [r4]
	b _0222C2D0
_0222C2BC:
	ldr r1, _0222C2DC @ =0x000030A0
	movs r2, #0
	ldr r1, [r4, r1]
	str r2, [r1]
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
_0222C2D0:
	adds r0, r4, #0
	bl ov74_0222B224
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222C2D8: .4byte 0x00003014
_0222C2DC: .4byte 0x000030A0
_0222C2E0: .4byte 0x0000061A
_0222C2E4: .4byte 0x00003060
_0222C2E8: .4byte 0x00001850
	thumb_func_end ov74_0222C04C

	thumb_func_start ov74_0222C2EC
ov74_0222C2EC: @ 0x0222C2EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	blx FUN_020E1134
	ldr r0, _0222C640 @ =0x000005C8
	ldr r0, [r4, r0]
	cmp r0, #0x1d
	beq _0222C30C
	adds r0, r4, #0
	bl ov74_0222CE10
_0222C30C:
	ldr r3, [r5]
	cmp r3, #0x3a
	bls _0222C316
	bl _0222CD3A
_0222C316:
	adds r0, r3, r3
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222C322: @ jump table
	.2byte _0222C398 - _0222C322 - 2 @ case 0
	.2byte _0222C3AA - _0222C322 - 2 @ case 1
	.2byte _0222C3C8 - _0222C322 - 2 @ case 2
	.2byte _0222C3D2 - _0222C322 - 2 @ case 3
	.2byte _0222C3E0 - _0222C322 - 2 @ case 4
	.2byte _0222C3EE - _0222C322 - 2 @ case 5
	.2byte _0222CD3A - _0222C322 - 2 @ case 6
	.2byte _0222C636 - _0222C322 - 2 @ case 7
	.2byte _0222C71C - _0222C322 - 2 @ case 8
	.2byte _0222C728 - _0222C322 - 2 @ case 9
	.2byte _0222C7E8 - _0222C322 - 2 @ case 10
	.2byte _0222C836 - _0222C322 - 2 @ case 11
	.2byte _0222C858 - _0222C322 - 2 @ case 12
	.2byte _0222C8E8 - _0222C322 - 2 @ case 13
	.2byte _0222C93E - _0222C322 - 2 @ case 14
	.2byte _0222C96A - _0222C322 - 2 @ case 15
	.2byte _0222C9AA - _0222C322 - 2 @ case 16
	.2byte _0222C9CC - _0222C322 - 2 @ case 17
	.2byte _0222CA04 - _0222C322 - 2 @ case 18
	.2byte _0222CA48 - _0222C322 - 2 @ case 19
	.2byte _0222CAEA - _0222C322 - 2 @ case 20
	.2byte _0222CAF6 - _0222C322 - 2 @ case 21
	.2byte _0222CAFC - _0222C322 - 2 @ case 22
	.2byte _0222CB32 - _0222C322 - 2 @ case 23
	.2byte _0222CB4C - _0222C322 - 2 @ case 24
	.2byte _0222CBC4 - _0222C322 - 2 @ case 25
	.2byte _0222CD3A - _0222C322 - 2 @ case 26
	.2byte _0222C3FC - _0222C322 - 2 @ case 27
	.2byte _0222CD3A - _0222C322 - 2 @ case 28
	.2byte _0222CD3A - _0222C322 - 2 @ case 29
	.2byte _0222CD3A - _0222C322 - 2 @ case 30
	.2byte _0222C4BA - _0222C322 - 2 @ case 31
	.2byte _0222C408 - _0222C322 - 2 @ case 32
	.2byte _0222C4CE - _0222C322 - 2 @ case 33
	.2byte _0222C570 - _0222C322 - 2 @ case 34
	.2byte _0222C54E - _0222C322 - 2 @ case 35
	.2byte _0222C612 - _0222C322 - 2 @ case 36
	.2byte _0222CD3A - _0222C322 - 2 @ case 37
	.2byte _0222CD3A - _0222C322 - 2 @ case 38
	.2byte _0222CD3A - _0222C322 - 2 @ case 39
	.2byte _0222CD3A - _0222C322 - 2 @ case 40
	.2byte _0222CD3A - _0222C322 - 2 @ case 41
	.2byte _0222CD3A - _0222C322 - 2 @ case 42
	.2byte _0222CD3A - _0222C322 - 2 @ case 43
	.2byte _0222CD3A - _0222C322 - 2 @ case 44
	.2byte _0222CD3A - _0222C322 - 2 @ case 45
	.2byte _0222CD3A - _0222C322 - 2 @ case 46
	.2byte _0222CD3A - _0222C322 - 2 @ case 47
	.2byte _0222CD3A - _0222C322 - 2 @ case 48
	.2byte _0222CBDE - _0222C322 - 2 @ case 49
	.2byte _0222CC02 - _0222C322 - 2 @ case 50
	.2byte _0222CC10 - _0222C322 - 2 @ case 51
	.2byte _0222CC2E - _0222C322 - 2 @ case 52
	.2byte _0222CC44 - _0222C322 - 2 @ case 53
	.2byte _0222CC58 - _0222C322 - 2 @ case 54
	.2byte _0222CC6A - _0222C322 - 2 @ case 55
	.2byte _0222CC7E - _0222C322 - 2 @ case 56
	.2byte _0222CCC0 - _0222C322 - 2 @ case 57
	.2byte _0222CD34 - _0222C322 - 2 @ case 58
_0222C398:
	movs r0, #0x54
	bl ov74_022352A0
	ldr r0, _0222C644 @ =0x000015D8
	str r5, [r4, r0]
	movs r0, #1
	str r0, [r5]
	bl _0222CD3A
_0222C3AA:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov74_0222AB70
	adds r0, r4, #0
	bl ov74_02229F04
	movs r0, #1
	movs r1, #3
	adds r2, r5, #0
	movs r3, #2
	bl ov74_0223539C
	bl _0222CD3A
_0222C3C8:
	adds r0, r5, #0
	bl ov74_022353FC
	bl _0222CD3A
_0222C3D2:
	ldr r2, _0222C648 @ =ov74_0222A6C0
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov74_0222AB0C
	bl _0222CD3A
_0222C3E0:
	ldr r2, _0222C64C @ =ov74_0222A5AC
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov74_0222AB0C
	bl _0222CD3A
_0222C3EE:
	ldr r2, _0222C650 @ =ov74_0222A2A4
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov74_0222AB0C
	bl _0222CD3A
_0222C3FC:
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov74_0222AC1C
	bl _0222CD3A
_0222C408:
	adds r0, r4, #0
	bl ov74_0222CEE0
	ldr r0, _0222C654 @ =0x0223D0A8
	ldr r0, [r0, #0x10]
	cmp r0, #0x2d
	bne _0222C4A0
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	adds r0, r6, #0
	bl ov74_0222A078
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x8c
	bl ov74_0222FD98
	adds r1, r4, #0
	adds r1, #0x80
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #1
	bne _0222C44C
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	movs r0, #0x31
	str r0, [r5]
	b _0222C4A0
_0222C44C:
	adds r0, r4, #0
	adds r0, #0x58
	bl FUN_0201D3F0
	cmp r0, #0
	bne _0222C47A
	movs r0, #2
	str r0, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r2, #0
	movs r0, #0x71
	adds r1, r4, #0
	str r2, [sp, #0xc]
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r4]
	adds r1, #0x58
	movs r3, #3
	bl FUN_0201D40C
_0222C47A:
	bl ov74_02236988
	adds r1, r4, #0
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, #0x58
	bl ov74_0222AAAC
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r2, #4
	bl ov74_0222AA18
	adds r0, r6, #0
	bl ov74_0222A43C
	movs r0, #0x1f
	str r0, [r5]
_0222C4A0:
	ldr r0, _0222C654 @ =0x0223D0A8
	ldr r0, [r0, #0x10]
	subs r0, #0x2e
	cmp r0, #1
	bls _0222C4AE
	bl _0222CD3A
_0222C4AE:
	bl ov74_0222CEC0
	movs r0, #0x11
	str r0, [r5]
	bl _0222CD3A
_0222C4BA:
	ldr r2, _0222C658 @ =ov74_0222A538
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov74_0222AB0C
	adds r0, r4, #0
	bl ov74_0222CEE0
	bl _0222CD3A
_0222C4CE:
	adds r0, r6, #0
	bl ov74_0222A078
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #1
	bl ov74_02229E28
	adds r0, r4, #0
	movs r1, #1
	bl ov74_02229F28
	adds r0, r7, #0
	bl ov74_0222A0E4
	cmp r0, #1
	bne _0222C53A
	adds r0, r6, #0
	bl ov74_0222A174
	ldr r0, _0222C65C @ =0x000029F4
	movs r1, #1
	str r1, [r4, r0]
	adds r0, r4, #0
	subs r1, r1, #2
	bl ov74_02229F28
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl ov74_02229F60
	ldr r1, _0222C660 @ =0x000030A4
	movs r0, #0x54
	bl FUN_0201AA8C
	ldr r2, _0222C660 @ =0x000030A4
	movs r1, #0
	adds r6, r0, #0
	blx FUN_020E5B44
	ldr r0, _0222C65C @ =0x000029F4
	adds r1, r4, r0
	ldr r0, _0222C664 @ =0x000030A0
	str r1, [r6, r0]
	bl ov74_02235708
	str r0, [r6, #0xc]
	ldr r0, _0222C668 @ =ov74_0222C04C
	adds r1, r6, #0
	movs r2, #5
	bl FUN_0200E320
	b _0222C548
_0222C53A:
	ldr r0, [r4]
	adds r1, r7, #0
	bl ov74_02235DC4
	adds r0, r6, #0
	bl ov74_0222A174
_0222C548:
	movs r0, #0x22
	str r0, [r5]
	b _0222CD3A
_0222C54E:
	ldr r0, _0222C65C @ =0x000029F4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222C5DC
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r2, #8
	movs r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	b _0222CD3A
_0222C570:
	bl ov74_0223615C
	adds r7, r0, #0
	cmp r7, #4
	bne _0222C57E
	bl ov74_02236128
_0222C57E:
	cmp r7, #2
	bne _0222C5D8
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov74_02229F28
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #0
	bl ov74_02229F78
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0201CAE0
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	adds r6, r4, #0
	adds r6, #0xdc
	adds r0, r6, #0
	bl ov74_0222A0E4
	cmp r0, #1
	bne _0222C5CC
	ldr r0, [r4]
	adds r1, r6, #0
	bl ov74_02235DC4
	ldr r0, _0222C65C @ =0x000029F4
	movs r1, #2
	str r1, [r4, r0]
	b _0222C5D2
_0222C5CC:
	ldr r0, _0222C66C @ =0x00000623
	bl FUN_0200604C
_0222C5D2:
	movs r0, #0x23
	str r0, [r5]
	b _0222CD3A
_0222C5D8:
	cmp r7, #3
	beq _0222C5DE
_0222C5DC:
	b _0222CD3A
_0222C5DE:
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov74_02229F28
	adds r0, r4, #0
	adds r0, #0xda
	ldrb r1, [r0]
	movs r0, #4
	movs r2, #0x1b
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0xda
	strb r1, [r0]
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222C612:
	adds r0, r4, #0
	bl ov74_0222CEE0
	ldr r0, _0222C654 @ =0x0223D0A8
	ldr r1, [r0, #0x10]
	adds r0, r1, #0
	subs r0, #0x2d
	cmp r0, #2
	bhi _0222C704
	cmp r1, #0x2f
	bne _0222C62C
	bl ov74_0222CEC0
_0222C62C:
	adds r0, r6, #0
	bl ov74_0222A494
	str r0, [r5]
	b _0222CD3A
_0222C636:
	adds r0, r4, #0
	bl ov74_02229D6C
	ldr r1, _0222C670 @ =0x00000438
	b _0222C674
	.align 2, 0
_0222C640: .4byte 0x000005C8
_0222C644: .4byte 0x000015D8
_0222C648: .4byte ov74_0222A6C0
_0222C64C: .4byte ov74_0222A5AC
_0222C650: .4byte ov74_0222A2A4
_0222C654: .4byte 0x0223D0A8
_0222C658: .4byte ov74_0222A538
_0222C65C: .4byte 0x000029F4
_0222C660: .4byte 0x000030A4
_0222C664: .4byte 0x000030A0
_0222C668: .4byte ov74_0222C04C
_0222C66C: .4byte 0x00000623
_0222C670: .4byte 0x00000438
_0222C674:
	str r0, [r4, r1]
	movs r0, #0
	ldr r1, [r4, r1]
	mvns r0, r0
	cmp r1, r0
	beq _0222C6EC
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x8c
	bl ov74_0222FD98
	adds r1, r4, #0
	adds r1, #0x80
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x58
	bl FUN_0201D3F0
	cmp r0, #0
	bne _0222C6C6
	movs r0, #2
	str r0, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r2, #0
	movs r0, #0x71
	adds r1, r4, #0
	str r2, [sp, #0xc]
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r4]
	adds r1, #0x58
	movs r3, #3
	bl FUN_0201D40C
_0222C6C6:
	adds r1, r4, #0
	adds r2, r4, #0
	adds r0, r6, #0
	adds r1, #0x58
	adds r2, #0x8c
	bl ov74_0222AAAC
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r2, #4
	bl ov74_0222AA18
	adds r0, r6, #0
	movs r1, #0
	bl ov74_0222A240
	movs r0, #8
	str r0, [r5]
_0222C6EC:
	ldr r0, _0222CA14 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	bne _0222C706
	ldr r0, _0222CA18 @ =0x00000434
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222C706
_0222C704:
	b _0222CD3A
_0222C706:
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	bl ov74_02229DF8
	bl FUN_0203A914
	movs r0, #0x11
	str r0, [r5]
	b _0222CD3A
_0222C71C:
	ldr r2, _0222CA1C @ =ov74_0222A494
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov74_0222AB0C
	b _0222CD3A
_0222C728:
	bl FUN_0203769C
	adds r7, r0, #0
	beq _0222C780
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	bl FUN_020373B4
	cmp r0, #0
	beq _0222C780
	movs r0, #0xab
	bl FUN_02037B38
	cmp r0, #1
	bne _0222C7B0
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	movs r0, #1
	adds r1, r0, #0
	bl FUN_020398D4
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r2, #7
	bl ov74_0222AA18
	adds r0, r4, #0
	movs r1, #1
	bl ov74_02229F28
	adds r0, r4, #0
	movs r1, #1
	bl ov74_02229E28
	movs r1, #0x96
	ldr r0, _0222CA18 @ =0x00000434
	lsls r1, r1, #2
	str r1, [r4, r0]
	movs r0, #0xa
	str r0, [r5]
	b _0222C7B0
_0222C780:
	cmp r7, #0
	beq _0222C7B0
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	bl FUN_020373B4
	cmp r0, #0
	bne _0222C7B0
	bl ov74_02229DF8
	bl FUN_0203A914
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov74_02229F28
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	movs r0, #0x10
	str r0, [r5]
	b _0222CD3A
_0222C7B0:
	ldr r0, _0222CA14 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	bne _0222C7C8
	ldr r0, _0222CA18 @ =0x00000434
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222C8B8
_0222C7C8:
	bl ov74_02229DF8
	bl FUN_0203A914
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov74_02229F28
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	movs r0, #0x11
	str r0, [r5]
	b _0222CD3A
_0222C7E8:
	bl ov74_02229DBC
	cmp r0, #0
	beq _0222C7F4
	movs r0, #0xb
	str r0, [r5]
_0222C7F4:
	bl FUN_0203769C
	ldr r1, _0222CA14 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #2
	tst r1, r2
	bne _0222C820
	ldr r1, _0222CA18 @ =0x00000434
	ldr r2, [r4, r1]
	subs r2, r2, #1
	str r2, [r4, r1]
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0222C820
	cmp r0, #0
	beq _0222C8B8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_020373B4
	cmp r0, #0
	bne _0222C8B8
_0222C820:
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	bl ov74_02229DF8
	bl FUN_0203A914
	movs r0, #0x11
	str r0, [r5]
	b _0222CD3A
_0222C836:
	adds r0, r6, #0
	bl ov74_0222A078
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov74_02235DC4
	movs r0, #0
	adds r1, r0, #0
	bl FUN_020398D4
	adds r0, r6, #0
	bl ov74_0222A174
	movs r0, #0xc
	str r0, [r5]
	b _0222CD3A
_0222C858:
	bl FUN_0203769C
	cmp r0, #0
	beq _0222C896
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_020373B4
	cmp r0, #0
	bne _0222C896
	bl ov74_02229DF8
	ldr r0, _0222CA20 @ =0x000029EC
	movs r1, #1
	str r1, [r4, r0]
	bl ov74_02236140
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	bl FUN_0203A914
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov74_02229F28
	movs r0, #0xe
	str r0, [r5]
	b _0222CD3A
_0222C896:
	bl ov74_0223615C
	cmp r0, #4
	bne _0222C8B0
	movs r0, #0x93
	bl FUN_02037AC0
	movs r0, #0xd
	str r0, [r5]
	ldr r0, _0222CA24 @ =0x0000043C
	movs r1, #0x78
	str r1, [r4, r0]
	b _0222CD3A
_0222C8B0:
	bl ov74_0223615C
	cmp r0, #3
	beq _0222C8BA
_0222C8B8:
	b _0222CD3A
_0222C8BA:
	bl ov74_02236140
	adds r0, r4, #0
	adds r0, #0xda
	ldrb r1, [r0]
	movs r0, #4
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0xda
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r2, #0x1b
	movs r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222C8E8:
	movs r0, #0x93
	bl FUN_02037B38
	cmp r0, #1
	bne _0222C902
	bl ov74_02236128
	ldr r0, _0222CA24 @ =0x0000043C
	movs r1, #0xa
	str r1, [r4, r0]
	movs r0, #0xf
	str r0, [r5]
	b _0222CD3A
_0222C902:
	ldr r0, _0222CA24 @ =0x0000043C
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222CA0C
	bl ov74_02236140
	adds r0, r4, #0
	adds r0, #0xda
	ldrb r1, [r0]
	movs r0, #4
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0xda
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r2, #0x1b
	movs r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222C93E:
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl ov74_02229F60
	adds r0, r4, #0
	adds r0, #0xda
	ldrb r1, [r0]
	movs r0, #4
	movs r2, #0x1d
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0xda
	strb r1, [r0]
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222C96A:
	ldr r0, _0222CA24 @ =0x0000043C
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222CA0C
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	bl ov74_02229DF8
	bl FUN_0203A914
	ldr r0, _0222CA28 @ =0x00000623
	bl FUN_0200604C
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov74_02229F28
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r2, #8
	movs r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222C9AA:
	ldr r0, _0222CA2C @ =0x000005DC
	bl FUN_0200604C
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r2, #0x19
	bl ov74_0222AA18
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl ov74_02229F60
	movs r0, #0x12
	str r0, [r5]
	b _0222CD3A
_0222C9CC:
	ldr r0, _0222CA30 @ =0x000015DC
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0222C9DA
	subs r1, r1, #1
	str r1, [r4, r0]
	b _0222CD3A
_0222C9DA:
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	ldr r0, _0222CA2C @ =0x000005DC
	bl FUN_0200604C
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r2, #0x18
	bl ov74_0222AA18
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl ov74_02229F60
	movs r0, #0x12
	str r0, [r5]
	b _0222CD3A
_0222CA04:
	ldr r0, _0222CA14 @ =0x021D110C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	bne _0222CA0E
_0222CA0C:
	b _0222CD3A
_0222CA0E:
	ldr r0, _0222CA2C @ =0x000005DC
	b _0222CA34
	nop
_0222CA14: .4byte 0x021D110C
_0222CA18: .4byte 0x00000434
_0222CA1C: .4byte ov74_0222A494
_0222CA20: .4byte 0x000029EC
_0222CA24: .4byte 0x0000043C
_0222CA28: .4byte 0x00000623
_0222CA2C: .4byte 0x000005DC
_0222CA30: .4byte 0x000015DC
_0222CA34:
	bl FUN_0200604C
	adds r0, r6, #0
	movs r1, #0xc4
	movs r2, #0
	bl ov74_0222A94C
	movs r0, #3
	str r0, [r5]
	b _0222CD3A
_0222CA48:
	ldr r0, _0222CD54 @ =0x000015DC
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0222CA56
	subs r1, r1, #1
	str r1, [r4, r0]
	b _0222CD3A
_0222CA56:
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	cmp r0, #0x1b
	beq _0222CA6C
	adds r0, r4, #0
	movs r1, #0xea
	adds r0, #0x8c
	lsls r1, r1, #2
	bl ov74_02235258
_0222CA6C:
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x8c
	bl ov74_0222FD98
	adds r1, r4, #0
	adds r1, #0x80
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #1
	bne _0222CA94
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	movs r0, #0x31
	str r0, [r5]
	b _0222CD3A
_0222CA94:
	adds r0, r4, #0
	adds r0, #0x58
	bl FUN_0201D3F0
	cmp r0, #0
	bne _0222CAC2
	movs r0, #2
	str r0, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r2, #0
	movs r0, #0x71
	adds r1, r4, #0
	str r2, [sp, #0xc]
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r4]
	adds r1, #0x58
	movs r3, #3
	bl FUN_0201D40C
_0222CAC2:
	adds r1, r4, #0
	adds r2, r4, #0
	adds r0, r6, #0
	adds r1, #0x58
	adds r2, #0x8c
	bl ov74_0222AAAC
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r2, #4
	bl ov74_0222AA18
	adds r0, r6, #0
	movs r1, #0
	bl ov74_0222A240
	movs r0, #0x14
	str r0, [r5]
	b _0222CD3A
_0222CAEA:
	ldr r2, _0222CD58 @ =ov74_0222A494
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov74_0222AB0C
	b _0222CD3A
_0222CAF6:
	movs r0, #0x16
	str r0, [r5]
	b _0222CD3A
_0222CAFC:
	adds r0, r6, #0
	bl ov74_0222A078
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov74_02235DC4
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r2, #7
	bl ov74_0222AA18
	adds r0, r4, #0
	movs r1, #1
	bl ov74_02229F28
	adds r0, r4, #0
	movs r1, #1
	bl ov74_02229E28
	ldr r0, _0222CD5C @ =0x0000043C
	movs r1, #0x3c
	str r1, [r4, r0]
	movs r0, #0x17
	str r0, [r5]
	b _0222CD3A
_0222CB32:
	ldr r0, _0222CD5C @ =0x0000043C
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222CC18
	adds r0, r6, #0
	bl ov74_0222A174
	movs r0, #0x18
	str r0, [r5]
	b _0222CD3A
_0222CB4C:
	bl ov74_0223615C
	cmp r0, #4
	bne _0222CB58
	bl ov74_02236128
_0222CB58:
	bl ov74_0223615C
	cmp r0, #2
	bne _0222CB90
	ldr r0, _0222CD5C @ =0x0000043C
	movs r1, #1
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02229E28
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov74_02229F28
	ldr r0, _0222CD60 @ =0x00000623
	bl FUN_0200604C
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r2, #8
	movs r3, #0x19
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222CB90:
	bl ov74_0223615C
	cmp r0, #3
	bne _0222CC18
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov74_02229F28
	adds r0, r4, #0
	adds r0, #0xda
	ldrb r1, [r0]
	movs r0, #4
	movs r2, #0x1b
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0xda
	strb r1, [r0]
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	movs r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222CBC4:
	ldr r0, _0222CD5C @ =0x0000043C
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _0222CC18
	movs r1, #1
	lsls r1, r1, #0x10
	str r1, [r4, r0]
	movs r0, #0x38
	str r0, [r5]
	b _0222CD3A
_0222CBDE:
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #5
	beq _0222CBEE
	adds r0, r4, #0
	bl ov74_0222AE3C
_0222CBEE:
	adds r0, r6, #0
	bl ov74_0222AD6C
	str r0, [r5]
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	bl ov74_02229F60
	b _0222CD3A
_0222CC02:
	movs r1, #0
	adds r0, r6, #0
	adds r2, r1, #0
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222CC10:
	ldr r0, _0222CD64 @ =0x021D110C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	bne _0222CC1A
_0222CC18:
	b _0222CD3A
_0222CC1A:
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl ov74_02229F60
	adds r0, r6, #0
	bl ov74_0222A5AC
	str r0, [r5]
	b _0222CD3A
_0222CC2E:
	adds r0, r6, #0
	movs r1, #1
	bl ov74_0222A240
	movs r0, #8
	str r0, [r5]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x80
	str r1, [r0]
	b _0222CD3A
_0222CC44:
	adds r0, r6, #0
	bl ov74_02229E68
	movs r0, #0x11
	movs r1, #0
	lsls r0, r0, #6
	str r1, [r4, r0]
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0222CC58:
	adds r0, r6, #0
	bl ov74_02229E68
	movs r1, #0x11
	movs r0, #1
	lsls r1, r1, #6
	add sp, #0x14
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_0222CC6A:
	adds r0, r6, #0
	bl ov74_02229E68
	movs r0, #0x11
	movs r1, #2
	lsls r0, r0, #6
	str r1, [r4, r0]
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0222CC7E:
	ldr r0, _0222CD64 @ =0x021D110C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _0222CD3A
	ldr r0, _0222CD68 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0xda
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0222CCAA
	ldr r2, _0222CD6C @ =0x000015D8
	movs r0, #0
	ldr r2, [r4, r2]
	movs r1, #0x39
	movs r3, #2
	bl ov74_0223539C
	b _0222CD3A
_0222CCAA:
	movs r0, #1
	bl ov74_02235390
	ldr r2, _0222CD6C @ =0x000015D8
	movs r0, #0
	ldr r2, [r4, r2]
	movs r1, #0x3a
	movs r3, #2
	bl ov74_0223539C
	b _0222CD3A
_0222CCC0:
	ldr r0, [r4]
	bl ov74_0222A7A0
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	adds r0, r4, #0
	adds r0, #0xda
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0222CD08
	adds r0, r4, #0
	adds r0, #0xdc
	ldrh r0, [r0]
	cmp r0, #3
	bne _0222CD08
	adds r0, r4, #0
	adds r0, #0xe0
	ldr r1, [r0]
	ldr r0, _0222CD70 @ =0x00000215
	cmp r1, r0
	bne _0222CD08
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0xdc
	movs r2, #0x54
	bl ov74_0222FC50
	b _0222CD14
_0222CD08:
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0xdc
	movs r2, #0x54
	bl ov74_0222EC08
_0222CD14:
	ldr r2, _0222CD6C @ =0x000015D8
	movs r0, #1
	ldr r2, [r4, r2]
	movs r1, #0x38
	movs r3, #2
	bl ov74_0223539C
	adds r0, r4, #0
	adds r0, #0xda
	ldrb r1, [r0]
	movs r0, #4
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0xda
	strb r1, [r0]
	b _0222CD3A
_0222CD34:
	movs r0, #0
	blx FUN_020D3B84
_0222CD3A:
	ldr r0, _0222CD74 @ =0x000029E8
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0222CD46
	adds r0, r4, #0
	blx r1
_0222CD46:
	ldr r0, _0222CD78 @ =0x000029F4
	ldr r0, [r4, r0]
	bl ov74_022358C8
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222CD54: .4byte 0x000015DC
_0222CD58: .4byte ov74_0222A494
_0222CD5C: .4byte 0x0000043C
_0222CD60: .4byte 0x00000623
_0222CD64: .4byte 0x021D110C
_0222CD68: .4byte 0x000005DC
_0222CD6C: .4byte 0x000015D8
_0222CD70: .4byte 0x00000215
_0222CD74: .4byte 0x000029E8
_0222CD78: .4byte 0x000029F4
	thumb_func_end ov74_0222C2EC

	thumb_func_start ov74_0222CD7C
ov74_0222CD7C: @ 0x0222CD7C
	ldr r0, _0222CD84 @ =0x0223D0A8
	ldr r0, [r0]
	bx lr
	nop
_0222CD84: .4byte 0x0223D0A8
	thumb_func_end ov74_0222CD7C

	thumb_func_start ov74_0222CD88
ov74_0222CD88: @ 0x0222CD88
	ldr r1, _0222CD90 @ =0x0223D0A8
	str r0, [r1]
	bx lr
	nop
_0222CD90: .4byte 0x0223D0A8
	thumb_func_end ov74_0222CD88

	thumb_func_start ov74_0222CD94
ov74_0222CD94: @ 0x0222CD94
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #0x11
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222CDB2
	ldr r0, _0222CDF8 @ =0x0000003C
	ldr r1, _0222CDFC @ =0x021EAFE0
	bl FUN_02000EF4
	b _0222CDCC
_0222CDB2:
	cmp r0, #1
	bne _0222CDC0
	ldr r0, _0222CE00 @ =0x0000004A
	ldr r1, _0222CE04 @ =0x0223B410
	bl FUN_02000EF4
	b _0222CDCC
_0222CDC0:
	cmp r0, #2
	bne _0222CDCC
	ldr r0, _0222CE00 @ =0x0000004A
	ldr r1, _0222CE08 @ =0x0223B420
	bl FUN_02000EF4
_0222CDCC:
	movs r0, #0x59
	bl FUN_0201A9C4
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x54
	bl FUN_0201A9C4
	ldr r0, _0222CE0C @ =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #2
	bne _0222CDEC
	movs r0, #0
	bl FUN_0201A4B0
_0222CDEC:
	movs r0, #0
	bl ov74_02236034
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0222CDF8: .4byte 0x0000003C
_0222CDFC: .4byte 0x021EAFE0
_0222CE00: .4byte 0x0000004A
_0222CE04: .4byte 0x0223B410
_0222CE08: .4byte 0x0223B420
_0222CE0C: .4byte 0x000015D4
	thumb_func_end ov74_0222CD94

	thumb_func_start ov74_0222CE10
ov74_0222CE10: @ 0x0222CE10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222CE64 @ =0x000005C8
	ldr r0, [r4, r0]
	cmp r0, #0x1c
	beq _0222CE26
	cmp r0, #0x1d
	beq _0222CE62
	cmp r0, #0x1e
	beq _0222CE3A
	pop {r4, pc}
_0222CE26:
	ldr r0, [r4, #4]
	bl FUN_02038D28
	ldr r0, _0222CE68 @ =0x000005CC
	movs r1, #0x78
	str r1, [r4, r0]
	movs r1, #0x1e
	subs r0, r0, #4
	str r1, [r4, r0]
	pop {r4, pc}
_0222CE3A:
	bl FUN_02038D80
	movs r1, #1
	tst r0, r1
	beq _0222CE4A
	movs r0, #0x5d
	lsls r0, r0, #4
	str r1, [r4, r0]
_0222CE4A:
	ldr r0, _0222CE68 @ =0x000005CC
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222CE62
	bl FUN_02038D64
	ldr r0, _0222CE64 @ =0x000005C8
	movs r1, #0x1d
	str r1, [r4, r0]
_0222CE62:
	pop {r4, pc}
	.align 2, 0
_0222CE64: .4byte 0x000005C8
_0222CE68: .4byte 0x000005CC
	thumb_func_end ov74_0222CE10

	thumb_func_start ov74_0222CE6C
ov74_0222CE6C: @ 0x0222CE6C
	cmp r0, #4
	bhi _0222CEB8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222CE7C: @ jump table
	.2byte _0222CE86 - _0222CE7C - 2 @ case 0
	.2byte _0222CE8E - _0222CE7C - 2 @ case 1
	.2byte _0222CE96 - _0222CE7C - 2 @ case 2
	.2byte _0222CE9E - _0222CE7C - 2 @ case 3
	.2byte _0222CEB2 - _0222CE7C - 2 @ case 4
_0222CE86:
	ldr r0, _0222CEBC @ =0x0223D0A8
	movs r1, #0x28
	str r1, [r0, #0x10]
	bx lr
_0222CE8E:
	ldr r0, _0222CEBC @ =0x0223D0A8
	movs r1, #0x29
	str r1, [r0, #0x10]
	bx lr
_0222CE96:
	ldr r0, _0222CEBC @ =0x0223D0A8
	movs r1, #0x2a
	str r1, [r0, #0x10]
	bx lr
_0222CE9E:
	ldr r0, _0222CEBC @ =0x0223D0A8
	ldr r1, [r0, #0x10]
	cmp r1, #0x2a
	bne _0222CEAC
	movs r1, #0x2c
	str r1, [r0, #0x10]
	bx lr
_0222CEAC:
	movs r1, #0x2f
	str r1, [r0, #0x10]
	bx lr
_0222CEB2:
	ldr r0, _0222CEBC @ =0x0223D0A8
	movs r1, #0x30
	str r1, [r0, #0x10]
_0222CEB8:
	bx lr
	nop
_0222CEBC: .4byte 0x0223D0A8
	thumb_func_end ov74_0222CE6C

	thumb_func_start ov74_0222CEC0
ov74_0222CEC0: @ 0x0222CEC0
	push {r3, lr}
	bl FUN_02034DE0
	ldr r0, _0222CEDC @ =0x0223D0A8
	ldr r0, [r0, #4]
	bl FUN_0201AB0C
	bl FUN_0203A914
	ldr r0, _0222CEDC @ =0x0223D0A8
	movs r1, #0
	str r1, [r0, #4]
	pop {r3, pc}
	nop
_0222CEDC: .4byte 0x0223D0A8
	thumb_func_end ov74_0222CEC0

	thumb_func_start ov74_0222CEE0
ov74_0222CEE0: @ 0x0222CEE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222CFEC @ =0x0223D0A8
	ldr r0, [r0, #0x10]
	cmp r0, #0x2c
	bne _0222CF06
	bl ov74_0222CEC0
	bl ov74_022368D4
	cmp r0, #0
	beq _0222CF00
	ldr r0, _0222CFEC @ =0x0223D0A8
	movs r1, #0x2d
	str r1, [r0, #0x10]
	b _0222CF06
_0222CF00:
	ldr r0, _0222CFEC @ =0x0223D0A8
	movs r1, #0x2e
	str r1, [r0, #0x10]
_0222CF06:
	ldr r0, _0222CFEC @ =0x0223D0A8
	ldr r0, [r0, #0x10]
	cmp r0, #0x25
	beq _0222CF22
	cmp r0, #0x26
	beq _0222CF22
	cmp r0, #0x27
	beq _0222CF22
	cmp r0, #0x28
	beq _0222CF22
	cmp r0, #0x29
	beq _0222CF22
	cmp r0, #0x2b
	bne _0222CF2E
_0222CF22:
	blx FUN_020DEF44
	movs r1, #3
	subs r0, r1, r0
	bl FUN_0203A930
_0222CF2E:
	ldr r1, _0222CFEC @ =0x0223D0A8
	ldr r0, [r1, #0x10]
	subs r0, #0x25
	cmp r0, #0xb
	bhi _0222CFA8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222CF44: @ jump table
	.2byte _0222CF5C - _0222CF44 - 2 @ case 0
	.2byte _0222CF68 - _0222CF44 - 2 @ case 1
	.2byte _0222CFA8 - _0222CF44 - 2 @ case 2
	.2byte _0222CFA8 - _0222CF44 - 2 @ case 3
	.2byte _0222CF9E - _0222CF44 - 2 @ case 4
	.2byte _0222CFA8 - _0222CF44 - 2 @ case 5
	.2byte _0222CFA8 - _0222CF44 - 2 @ case 6
	.2byte _0222CFA8 - _0222CF44 - 2 @ case 7
	.2byte _0222CFA8 - _0222CF44 - 2 @ case 8
	.2byte _0222CFA8 - _0222CF44 - 2 @ case 9
	.2byte _0222CFA6 - _0222CF44 - 2 @ case 10
	.2byte _0222CFA8 - _0222CF44 - 2 @ case 11
_0222CF5C:
	bl FUN_02034D8C
	ldr r0, _0222CFEC @ =0x0223D0A8
	movs r1, #0x26
	str r1, [r0, #0x10]
	b _0222CFA8
_0222CF68:
	bl FUN_02034DB8
	cmp r0, #1
	bne _0222CFA8
	ldr r0, _0222CFEC @ =0x0223D0A8
	movs r1, #0
	str r1, [r0, #0xc]
	bl ov74_02236980
	adds r1, r0, #0
	movs r0, #0x54
	bl FUN_0201AA8C
	adds r2, r0, #0
	ldr r0, _0222CFEC @ =0x0223D0A8
	ldr r1, _0222CFF0 @ =ov74_0222CE6C
	str r2, [r0, #4]
	ldr r0, _0222CFF4 @ =0x000005D4
	adds r0, r4, r0
	bl ov74_02236680
	ldr r0, _0222CFEC @ =0x0223D0A8
	movs r1, #0x27
	str r1, [r0, #0x10]
	bl FUN_0203A880
	b _0222CFA8
_0222CF9E:
	ldr r0, [r1, #0xc]
	adds r0, r0, #1
	str r0, [r1, #0xc]
	b _0222CFA8
_0222CFA6:
	pop {r4, pc}
_0222CFA8:
	ldr r0, _0222CFF8 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _0222CFE8
	ldr r0, _0222CFEC @ =0x0223D0A8
	ldr r0, [r0, #0x10]
	subs r0, #0x28
	cmp r0, #8
	bhi _0222CFE8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222CFC8: @ jump table
	.2byte _0222CFDA - _0222CFC8 - 2 @ case 0
	.2byte _0222CFDA - _0222CFC8 - 2 @ case 1
	.2byte _0222CFE8 - _0222CFC8 - 2 @ case 2
	.2byte _0222CFE8 - _0222CFC8 - 2 @ case 3
	.2byte _0222CFE8 - _0222CFC8 - 2 @ case 4
	.2byte _0222CFE8 - _0222CFC8 - 2 @ case 5
	.2byte _0222CFE8 - _0222CFC8 - 2 @ case 6
	.2byte _0222CFE8 - _0222CFC8 - 2 @ case 7
	.2byte _0222CFDA - _0222CFC8 - 2 @ case 8
_0222CFDA:
	bl ov74_022365FC
	cmp r0, #0
	beq _0222CFE8
	ldr r0, _0222CFEC @ =0x0223D0A8
	movs r1, #0x2b
	str r1, [r0, #0x10]
_0222CFE8:
	pop {r4, pc}
	nop
_0222CFEC: .4byte 0x0223D0A8
_0222CFF0: .4byte ov74_0222CE6C
_0222CFF4: .4byte 0x000005D4
_0222CFF8: .4byte 0x021D110C
	thumb_func_end ov74_0222CEE0

	thumb_func_start ov74_0222CFFC
ov74_0222CFFC: @ 0x0222CFFC
	push {r3, lr}
	sub sp, #8
	bl ov74_0222D024
	bl ov74_0223563C
	bl ov74_02235690
	movs r0, #0x11
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0x13
	movs r2, #0x10
	movs r3, #0x12
	bl ov74_02235728
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov74_0222CFFC

	thumb_func_start ov74_0222D024
ov74_0222D024: @ 0x0222D024
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222D088 @ =0x00002DC4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222D034
	bl FUN_02024758
_0222D034:
	ldr r0, _0222D08C @ =0x00002DC8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222D040
	bl FUN_02024758
_0222D040:
	ldr r0, _0222D08C @ =0x00002DC8
	movs r1, #0
	str r1, [r4, r0]
	ldr r2, [r4, r0]
	subs r1, r0, #4
	str r2, [r4, r1]
	adds r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222D058
	bl FUN_02024758
_0222D058:
	ldr r0, _0222D090 @ =0x00002DD0
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222D064
	bl FUN_02024758
_0222D064:
	ldr r0, _0222D094 @ =0x00002DD4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222D070
	bl FUN_02024758
_0222D070:
	ldr r1, _0222D094 @ =0x00002DD4
	movs r0, #0
	str r0, [r4, r1]
	ldr r2, [r4, r1]
	subs r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	subs r1, #8
	str r0, [r4, r1]
	bl ov74_022359BC
	pop {r4, pc}
	.align 2, 0
_0222D088: .4byte 0x00002DC4
_0222D08C: .4byte 0x00002DC8
_0222D090: .4byte 0x00002DD0
_0222D094: .4byte 0x00002DD4
	thumb_func_end ov74_0222D024

	thumb_func_start ov74_0222D098
ov74_0222D098: @ 0x0222D098
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0222D0E0 @ =0x00003D4C
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, r1]
	movs r1, #1
	str r1, [sp]
	ldr r1, _0222D0E4 @ =0x00002DC4
	movs r2, #0x48
	ldr r1, [r4, r1]
	movs r3, #0xa8
	bl ov74_02235930
	ldr r1, _0222D0E4 @ =0x00002DC4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #2
	bl FUN_02024A04
	movs r0, #0
	ldr r1, _0222D0E8 @ =0x00002DC8
	str r0, [sp]
	ldr r1, [r4, r1]
	movs r2, #0xb8
	movs r3, #0xa8
	bl ov74_02235930
	ldr r1, _0222D0E8 @ =0x00002DC8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #2
	bl FUN_02024A04
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0222D0E0: .4byte 0x00003D4C
_0222D0E4: .4byte 0x00002DC4
_0222D0E8: .4byte 0x00002DC8
	thumb_func_end ov74_0222D098

	thumb_func_start ov74_0222D0EC
ov74_0222D0EC: @ 0x0222D0EC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0201D3F0
	cmp r0, #1
	bne _0222D102
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0200E5D4
_0222D102:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_0222D0EC

	thumb_func_start ov74_0222D104
ov74_0222D104: @ 0x0222D104
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0201D3F0
	cmp r0, #1
	bne _0222D11A
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0200E9BC
_0222D11A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_0222D104

	thumb_func_start ov74_0222D11C
ov74_0222D11C: @ 0x0222D11C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	ldr r0, _0222D1C4 @ =0x00002BCC
	adds r4, r1, #0
	ldr r0, [r5, r0]
	adds r7, r2, #0
	str r3, [sp]
	cmp r0, #0
	beq _0222D134
	bl FUN_02014950
_0222D134:
	ldr r0, _0222D1C8 @ =0x00002BC8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222D144
	movs r1, #0
	adds r2, r1, #0
	bl FUN_02001434
_0222D144:
	adds r0, r7, #0
	movs r1, #0x55
	bl FUN_02014918
	ldr r1, _0222D1C4 @ =0x00002BCC
	movs r2, #0xf7
	str r0, [r5, r1]
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x55
	bl FUN_0200BAF8
	ldr r1, _0222D1CC @ =0x00002A04
	movs r6, #0
	str r0, [r5, r1]
	cmp r7, #0
	ble _0222D17E
_0222D166:
	ldr r0, _0222D1C4 @ =0x00002BCC
	ldr r1, _0222D1CC @ =0x00002A04
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	bl FUN_02014960
	adds r6, r6, #1
	adds r4, #8
	cmp r6, r7
	blt _0222D166
_0222D17E:
	ldr r0, _0222D1CC @ =0x00002A04
	ldr r0, [r5, r0]
	bl FUN_0200BB44
	ldr r4, _0222D1D0 @ =0x0223C320
	add r3, sp, #4
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, _0222D1C4 @ =0x00002BCC
	movs r1, #0
	ldr r0, [r5, r0]
	movs r3, #0x55
	str r0, [sp, #4]
	add r0, sp, #4
	strh r7, [r0, #0x10]
	ldr r0, [sp]
	str r0, [sp, #0x10]
	adds r0, r2, #0
	ldr r2, [sp, #0x38]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl FUN_020011DC
	ldr r1, _0222D1C8 @ =0x00002BC8
	str r0, [r5, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0222D1C4: .4byte 0x00002BCC
_0222D1C8: .4byte 0x00002BC8
_0222D1CC: .4byte 0x00002A04
_0222D1D0: .4byte 0x0223C320
	thumb_func_end ov74_0222D11C

	thumb_func_start ov74_0222D1D4
ov74_0222D1D4: @ 0x0222D1D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r7, r1, #0
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xf7
	movs r3, #0x55
	bl FUN_0200BAF8
	adds r4, r0, #0
	movs r0, #0x55
	bl FUN_0200BD08
	adds r6, r0, #0
	movs r0, #1
	movs r1, #6
	bl FUN_02002FAC
	adds r1, r0, #0
	adds r0, r5, #0
	bl FUN_0201D978
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r3, #0x55
	bl FUN_0200BC4C
	adds r7, r0, #0
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222D244 @ =0x00010200
	movs r1, #1
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r7, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_0201D578
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0200BB44
	adds r0, r6, #0
	bl FUN_0200BDA0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222D244: .4byte 0x00010200
	thumb_func_end ov74_0222D1D4

	thumb_func_start ov74_0222D248
ov74_0222D248: @ 0x0222D248
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x55
	movs r1, #0xf
	str r0, [sp, #4]
	movs r0, #0x71
	movs r2, #0
	lsls r3, r1, #5
	bl FUN_02007938
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x55
	movs r3, #6
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0x14
	movs r2, #0
	lsls r3, r3, #6
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x55
	str r0, [sp, #0xc]
	movs r0, #0x71
	movs r1, #0x15
	adds r2, r4, #0
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x55
	str r0, [sp, #0xc]
	movs r0, #0x71
	movs r1, #0x16
	adds r2, r4, #0
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #0xc
	movs r2, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201CA4C
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov74_0222D248

	thumb_func_start ov74_0222D2D4
ov74_0222D2D4: @ 0x0222D2D4
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	bl ov74_0222D448
	ldr r0, _0222D300 @ =0x00002BD0
	movs r1, #0x2f
	adds r0, r4, r0
	bl ov74_0222D1D4
	ldr r3, _0222D304 @ =0x00002BE0
	adds r0, r4, #0
	adds r1, r4, r3
	adds r3, #0x10
	ldr r3, [r4, r3]
	movs r2, #0xa
	bl ov74_0222D9E0
	movs r0, #0xe
	pop {r4, pc}
	nop
_0222D300: .4byte 0x00002BD0
_0222D304: .4byte 0x00002BE0
	thumb_func_end ov74_0222D2D4

	thumb_func_start ov74_0222D308
ov74_0222D308: @ 0x0222D308
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	bl ov74_0222D448
	ldr r1, _0222D34C @ =0x00002BA0
	ldr r0, [r4, r1]
	adds r1, #0x20
	ldr r1, [r4, r1]
	bl FUN_0202DEF8
	cmp r0, #1
	ldr r0, _0222D350 @ =0x00002BD0
	bne _0222D330
	adds r0, r4, r0
	movs r1, #0x3f
	bl ov74_0222D1D4
	b _0222D338
_0222D330:
	adds r0, r4, r0
	movs r1, #0x3e
	bl ov74_0222D1D4
_0222D338:
	ldr r3, _0222D354 @ =0x00002BE0
	adds r0, r4, #0
	adds r1, r4, r3
	adds r3, #0x10
	ldr r3, [r4, r3]
	movs r2, #9
	bl ov74_0222D9E0
	movs r0, #0xc
	pop {r4, pc}
	.align 2, 0
_0222D34C: .4byte 0x00002BA0
_0222D350: .4byte 0x00002BD0
_0222D354: .4byte 0x00002BE0
	thumb_func_end ov74_0222D308

	thumb_func_start ov74_0222D358
ov74_0222D358: @ 0x0222D358
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	bl ov74_0222D448
	ldr r0, _0222D400 @ =0x00002BD0
	movs r1, #0x40
	adds r0, r4, r0
	bl ov74_0222D1D4
	ldr r0, _0222D400 @ =0x00002BD0
	movs r1, #0x13
	adds r0, r4, r0
	bl FUN_0200F0AC
	ldr r1, _0222D404 @ =0x00003D50
	str r0, [r4, r1]
	ldr r1, _0222D408 @ =0x00002BA0
	ldr r0, [r4, r1]
	adds r1, #0x20
	ldr r1, [r4, r1]
	bl FUN_0202DEF8
	cmp r0, #1
	ldr r1, _0222D408 @ =0x00002BA0
	bne _0222D39A
	ldr r0, [r4, r1]
	adds r1, #0x20
	ldr r1, [r4, r1]
	bl FUN_0202DDB0
	b _0222D3A4
_0222D39A:
	ldr r0, [r4, r1]
	adds r1, #0x20
	ldr r1, [r4, r1]
	bl FUN_0202DDEC
_0222D3A4:
	ldr r0, _0222D40C @ =0x00002BA4
	ldr r0, [r4, r0]
	bl FUN_020273F0
	ldr r0, _0222D404 @ =0x00003D50
	ldr r0, [r4, r0]
	bl FUN_0200F450
	ldr r0, _0222D408 @ =0x00002BA0
	ldr r0, [r4, r0]
	bl FUN_0202DED8
	cmp r0, #0
	bne _0222D3C4
	movs r0, #0x1b
	pop {r4, pc}
_0222D3C4:
	movs r1, #0xaf
	lsls r1, r1, #6
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	bl ov74_0222DAF8
	movs r1, #0xaf
	lsls r1, r1, #6
	str r0, [r4, r1]
	adds r1, #0x10
	adds r0, r4, r1
	movs r1, #0x25
	bl ov74_0222D1D4
	ldr r3, _0222D410 @ =0x00002BE0
	adds r0, r4, #0
	adds r1, r4, r3
	adds r3, #0x10
	ldr r3, [r4, r3]
	movs r2, #8
	bl ov74_0222D9E0
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov74_0222D824
	movs r0, #5
	pop {r4, pc}
	.align 2, 0
_0222D400: .4byte 0x00002BD0
_0222D404: .4byte 0x00003D50
_0222D408: .4byte 0x00002BA0
_0222D40C: .4byte 0x00002BA4
_0222D410: .4byte 0x00002BE0
	thumb_func_end ov74_0222D358

	thumb_func_start ov74_0222D414
ov74_0222D414: @ 0x0222D414
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	bl ov74_0222D448
	ldr r0, _0222D440 @ =0x00002BD0
	movs r1, #0x25
	adds r0, r4, r0
	bl ov74_0222D1D4
	ldr r3, _0222D444 @ =0x00002BE0
	adds r0, r4, #0
	adds r1, r4, r3
	adds r3, #0x10
	ldr r3, [r4, r3]
	movs r2, #8
	bl ov74_0222D9E0
	movs r0, #5
	pop {r4, pc}
	nop
_0222D440: .4byte 0x00002BD0
_0222D444: .4byte 0x00002BE0
	thumb_func_end ov74_0222D414

	thumb_func_start ov74_0222D448
ov74_0222D448: @ 0x0222D448
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222D484 @ =0x00002BCC
	ldr r0, [r4, r0]
	bl FUN_02014950
	movs r1, #0
	ldr r0, _0222D484 @ =0x00002BCC
	adds r2, r1, #0
	str r1, [r4, r0]
	subs r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02001434
	ldr r0, _0222D488 @ =0x00002BC8
	movs r1, #0
	str r1, [r4, r0]
	adds r0, #0x18
	adds r0, r4, r0
	bl ov74_0222D0EC
	ldr r0, _0222D48C @ =0x00002BE0
	adds r0, r4, r0
	bl FUN_0201D8C8
	ldr r0, _0222D48C @ =0x00002BE0
	adds r0, r4, r0
	bl FUN_0201D520
	pop {r4, pc}
	.align 2, 0
_0222D484: .4byte 0x00002BCC
_0222D488: .4byte 0x00002BC8
_0222D48C: .4byte 0x00002BE0
	thumb_func_end ov74_0222D448

	thumb_func_start ov74_0222D490
ov74_0222D490: @ 0x0222D490
	movs r0, #1
	bx lr
	thumb_func_end ov74_0222D490

	thumb_func_start ov74_0222D494
ov74_0222D494: @ 0x0222D494
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, [r5]
	movs r0, #0x25
	adds r4, r2, #0
	bl FUN_02026354
	movs r1, #0xaf
	lsls r1, r1, #6
	ldr r2, [r5, r1]
	subs r1, #0xc
	lsls r2, r2, #2
	adds r2, r5, r2
	ldr r2, [r2, r1]
	movs r1, #0x41
	lsls r1, r1, #2
	adds r1, r2, r1
	movs r2, #0x24
	adds r6, r0, #0
	bl FUN_02026A04
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r4, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	adds r2, r6, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_0222D494

	thumb_func_start ov74_0222D4E4
ov74_0222D4E4: @ 0x0222D4E4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0xaf
	lsls r0, r0, #6
	adds r6, r1, #0
	ldr r1, [r4, r0]
	adds r5, r2, #0
	lsls r2, r1, #2
	adds r3, r4, r2
	adds r2, r0, #0
	subs r2, #0xc
	ldr r3, [r3, r2]
	ldr r2, _0222D558 @ =0x00000152
	ldrb r2, [r3, r2]
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x1f
	bne _0222D50C
	movs r2, #0x28
	b _0222D522
_0222D50C:
	subs r0, #0x20
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222D51C
	bl FUN_0202DEF8
	cmp r0, #1
	bne _0222D520
_0222D51C:
	movs r2, #0x26
	b _0222D522
_0222D520:
	movs r2, #0x27
_0222D522:
	movs r1, #0x2a
	lsls r1, r1, #8
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	ldr r3, [r4]
	bl FUN_0200BC4C
	adds r4, r0, #0
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r5, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	adds r2, r4, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0222D558: .4byte 0x00000152
	thumb_func_end ov74_0222D4E4

	thumb_func_start ov74_0222D55C
ov74_0222D55C: @ 0x0222D55C
	push {r4, lr}
	sub sp, #0x18
	movs r1, #0xaf
	adds r4, r0, #0
	lsls r1, r1, #6
	ldr r2, [r4, r1]
	subs r1, #0xc
	lsls r2, r2, #2
	adds r2, r4, r2
	ldr r2, [r2, r1]
	movs r1, #0xd5
	lsls r1, r1, #2
	ldr r1, [r2, r1]
	add r0, sp, #8
	blx FUN_020DC394
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x2a
	lsls r0, r0, #8
	movs r2, #0x7d
	ldr r3, [sp, #8]
	lsls r2, r2, #4
	adds r2, r3, r2
	ldr r0, [r4, r0]
	movs r1, #0
	movs r3, #4
	bl FUN_0200BFCC
	movs r0, #0x2a
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	ldr r2, [sp, #0xc]
	movs r1, #1
	bl FUN_0200CB1C
	movs r1, #2
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x2a
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	ldr r2, [sp, #0x10]
	adds r3, r1, #0
	bl FUN_0200BFCC
	movs r0, #1
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov74_0222D55C

	thumb_func_start ov74_0222D5C4
ov74_0222D5C4: @ 0x0222D5C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r7, r1, #0
	movs r0, #0xfb
	movs r1, #0x55
	adds r4, r2, #0
	bl FUN_02026354
	movs r1, #0xaf
	lsls r1, r1, #6
	ldr r2, [r5, r1]
	subs r1, #0xc
	lsls r2, r2, #2
	adds r2, r5, r2
	ldr r2, [r2, r1]
	movs r1, #0x55
	lsls r1, r1, #2
	adds r1, r2, r1
	movs r2, #0xfa
	adds r6, r0, #0
	bl FUN_02026A04
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r4, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	adds r2, r6, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_0222D5C4

	thumb_func_start ov74_0222D614
ov74_0222D614: @ 0x0222D614
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r3, r0, #0
	movs r0, #0xaf
	lsls r0, r0, #6
	adds r6, r1, #0
	ldr r1, [r3, r0]
	subs r0, #0xc
	lsls r1, r1, #2
	adds r1, r3, r1
	ldr r1, [r1, r0]
	movs r0, #0xd2
	lsls r0, r0, #2
	adds r5, r2, #0
	ldrb r2, [r1, r0]
	cmp r2, #0xff
	bne _0222D66C
	movs r1, #0x2a
	lsls r1, r1, #8
	ldr r0, [r3, r1]
	adds r1, r1, #4
	ldr r1, [r3, r1]
	movs r2, #0x34
	movs r3, #0x55
	bl FUN_0200BC4C
	adds r4, r0, #0
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r5, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	adds r2, r4, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	movs r0, #0
	pop {r4, r5, r6, pc}
_0222D66C:
	cmp r2, #0
	beq _0222D68A
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x2a
	lsls r0, r0, #8
	ldr r0, [r3, r0]
	movs r3, #3
	bl FUN_0200BFCC
	add sp, #0x10
	movs r0, #1
	pop {r4, r5, r6, pc}
_0222D68A:
	movs r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov74_0222D614

	thumb_func_start ov74_0222D690
ov74_0222D690: @ 0x0222D690
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	movs r0, #0
	adds r7, r1, #0
	adds r1, r0, #1
	ldr r0, _0222D764 @ =0x0223C2D0
	ldr r2, _0222D764 @ =0x0223C2D0
	ldr r0, [r0, #0x30]
	ldr r2, [r2, #0x34]
	str r0, [sp, #0x14]
	movs r0, #0xaf
	lsls r0, r0, #6
	str r2, [sp, #0x18]
	ldr r2, [r5, r0]
	subs r0, #0xc
	lsls r2, r2, #2
	adds r2, r5, r2
	ldr r2, [r2, r0]
	movs r0, #0xd2
	lsls r0, r0, #2
	ldrb r0, [r2, r0]
	adds r4, r1, #0
	add r6, sp, #0x14
	cmp r0, #0
	beq _0222D6D6
	ldr r0, _0222D764 @ =0x0223C2D0
	ldr r2, _0222D764 @ =0x0223C2D0
	ldr r0, [r0, #0x38]
	adds r4, r1, #1
	lsls r1, r1, #3
	ldr r2, [r2, #0x3c]
	adds r3, r6, r1
	str r0, [r6, r1]
	str r2, [r3, #4]
_0222D6D6:
	ldr r0, _0222D764 @ =0x0223C2D0
	ldr r2, _0222D764 @ =0x0223C2D0
	ldr r0, [r0, #0x40]
	lsls r1, r4, #3
	add r6, sp, #0x14
	str r0, [r6, r1]
	ldr r2, [r2, #0x44]
	adds r3, r6, r1
	adds r0, r4, #1
	lsls r1, r0, #3
	str r2, [r3, #4]
	ldr r0, _0222D764 @ =0x0223C2D0
	ldr r2, _0222D764 @ =0x0223C2D0
	ldr r0, [r0, #0x48]
	ldr r2, [r2, #0x4c]
	str r0, [r6, r1]
	adds r3, r6, r1
	ldr r0, _0222D768 @ =0x00002B9C
	str r2, [r3, #4]
	ldr r6, [r5, r0]
	adds r0, r7, #0
	bl FUN_0201D8C8
	adds r0, r7, #0
	bl FUN_0201D520
	adds r1, r4, #2
	movs r0, #4
	subs r0, r0, r1
	ldr r1, [r6, #8]
	lsls r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	ldr r1, [r6, #0xc]
	movs r2, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	ldr r1, [r6, #0x10]
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	ldr r0, _0222D76C @ =0x00002B98
	adds r1, r7, #0
	ldr r0, [r5, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, _0222D770 @ =0x000029FC
	ldr r3, [r6, #4]
	ldr r0, [r5, r0]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	add r1, sp, #0x14
	adds r2, r4, #2
	adds r3, r7, #0
	bl ov74_0222D11C
	movs r0, #1
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222D764: .4byte 0x0223C2D0
_0222D768: .4byte 0x00002B9C
_0222D76C: .4byte 0x00002B98
_0222D770: .4byte 0x000029FC
	thumb_func_end ov74_0222D690

	thumb_func_start ov74_0222D774
ov74_0222D774: @ 0x0222D774
	push {r3, lr}
	adds r3, r1, #0
	movs r1, #1
	str r1, [sp]
	ldr r1, _0222D788 @ =0x0223C2D0
	movs r2, #2
	bl ov74_0222D11C
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_0222D788: .4byte 0x0223C2D0
	thumb_func_end ov74_0222D774

	thumb_func_start ov74_0222D78C
ov74_0222D78C: @ 0x0222D78C
	push {r3, lr}
	adds r3, r1, #0
	movs r1, #0
	str r1, [sp]
	ldr r1, _0222D7A0 @ =0x0223C2F0
	movs r2, #2
	bl ov74_0222D11C
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_0222D7A0: .4byte 0x0223C2F0
	thumb_func_end ov74_0222D78C

	thumb_func_start ov74_0222D7A4
ov74_0222D7A4: @ 0x0222D7A4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0222D7C8 @ =0x00002BD0
	adds r4, r1, #0
	adds r0, r5, r0
	movs r1, #2
	bl ov74_0222D1D4
	movs r0, #0
	str r0, [sp]
	ldr r1, _0222D7CC @ =0x0223C2E0
	adds r0, r5, #0
	movs r2, #2
	adds r3, r4, #0
	bl ov74_0222D11C
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222D7C8: .4byte 0x00002BD0
_0222D7CC: .4byte 0x0223C2E0
	thumb_func_end ov74_0222D7A4

	thumb_func_start ov74_0222D7D0
ov74_0222D7D0: @ 0x0222D7D0
	push {r3, lr}
	sub sp, #8
	movs r3, #1
	str r3, [sp]
	movs r1, #0x2a
	str r3, [sp, #4]
	lsls r1, r1, #8
	ldr r0, [r0, r1]
	movs r1, #0
	adds r2, r1, #0
	bl FUN_0200BFCC
	movs r0, #1
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_0222D7D0

	thumb_func_start ov74_0222D7F0
ov74_0222D7F0: @ 0x0222D7F0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x55
	str r0, [sp, #8]
	adds r6, r2, #0
	movs r0, #0
	adds r4, r3, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	cmp r4, #0
	beq _0222D818
	movs r0, #0x1c
	str r0, [r4]
_0222D818:
	movs r0, #0xb1
	lsls r0, r0, #6
	str r6, [r5, r0]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov74_0222D7F0

	thumb_func_start ov74_0222D824
ov74_0222D824: @ 0x0222D824
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	ldr r3, [r5]
	str r2, [sp, #0x14]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xf7
	ldr r4, _0222D9C8 @ =0x0223C340
	bl FUN_0200BAF8
	ldr r1, _0222D9CC @ =0x00002A04
	str r0, [r5, r1]
	ldr r0, [r5]
	bl FUN_0200BD08
	movs r1, #0x2a
	lsls r1, r1, #8
	str r0, [r5, r1]
	ldr r1, _0222D9D0 @ =0x00002BC4
	ldr r0, [sp, #0x14]
	str r0, [r5, r1]
	ldr r1, [sp, #0x14]
	adds r0, r5, #0
	bl ov74_0222DB70
	movs r0, #0
	str r0, [sp, #0x30]
	ldr r0, _0222D9D4 @ =0x00002A08
	adds r7, r4, #0
	str r5, [sp, #0x1c]
	adds r6, r5, r0
_0222D864:
	ldr r1, [r7]
	ldr r0, [sp, #0x14]
	cmp r0, r1
	beq _0222D886
	cmp r1, #2
	beq _0222D886
	ldr r1, [sp, #0x1c]
	ldr r0, _0222D9D4 @ =0x00002A08
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0222D886
	adds r0, r6, #0
	bl FUN_0201D8C8
	adds r0, r6, #0
	bl FUN_0201D520
_0222D886:
	ldr r0, [sp, #0x1c]
	adds r7, #0x30
	adds r0, #0x10
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x30]
	adds r6, #0x10
	adds r0, r0, #1
	str r0, [sp, #0x30]
	cmp r0, #0x13
	blo _0222D864
	movs r0, #0x31
	str r0, [sp, #0x2c]
	movs r0, #0
	str r0, [sp, #0x18]
	ldr r0, _0222D9D4 @ =0x00002A08
	str r5, [sp, #0x24]
	str r5, [sp, #0x20]
	adds r6, r5, r0
_0222D8AA:
	ldr r1, [r4]
	ldr r0, [sp, #0x14]
	cmp r0, r1
	bne _0222D98A
	ldr r1, [sp, #0x24]
	ldr r0, _0222D9D4 @ =0x00002A08
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0222D8FA
	ldr r2, [sp, #0x2c]
	ldr r1, [sp, #0x20]
	ldr r0, _0222D9D8 @ =0x00002B48
	str r2, [r1, r0]
	ldr r0, [r4, #8]
	adds r1, r6, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	adds r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, _0222D9DC @ =0x000029FC
	ldr r3, [r4, #4]
	ldr r0, [r5, r0]
	lsls r3, r3, #0x18
	movs r2, #0
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
_0222D8FA:
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x1c]
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl FUN_02002FAC
	adds r1, r0, #0
	adds r0, r6, #0
	bl FUN_0201D978
	ldr r0, [r4, #0x18]
	ldr r3, [r4, #0x24]
	str r0, [sp, #0x28]
	ldr r2, [sp, #0x28]
	adds r0, r5, #0
	adds r1, r6, #0
	blx r3
	cmp r0, #1
	bne _0222D976
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _0222D976
	movs r0, #0x2a
	ldr r1, _0222D9CC @ =0x00002A04
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r3, [r5]
	bl FUN_0200BC4C
	adds r7, r0, #0
	movs r0, #0
	ldr r3, [r4, #0x28]
	mvns r0, r0
	cmp r3, r0
	bne _0222D956
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x14]
	adds r1, r7, #0
	movs r2, #0
	lsls r3, r3, #3
	bl FUN_020030A0
	adds r3, r0, #0
_0222D956:
	ldr r0, [r4, #0x2c]
	adds r2, r7, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [r4, #0x14]
	adds r0, r6, #0
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
_0222D976:
	adds r0, r6, #0
	bl FUN_0201D578
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x2c]
	adds r0, r0, r2
	str r0, [sp, #0x2c]
_0222D98A:
	ldr r0, [sp, #0x24]
	adds r4, #0x30
	adds r0, #0x10
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	adds r6, #0x10
	adds r0, r0, #4
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #0x13
	blo _0222D8AA
	ldr r0, _0222D9CC @ =0x00002A04
	ldr r0, [r5, r0]
	bl FUN_0200BB44
	movs r0, #0x2a
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	bl FUN_0200BDA0
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0222D9C2
	adds r0, r5, #0
	bl ov74_0222DCD4
_0222D9C2:
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0222D9C8: .4byte 0x0223C340
_0222D9CC: .4byte 0x00002A04
_0222D9D0: .4byte 0x00002BC4
_0222D9D4: .4byte 0x00002A08
_0222D9D8: .4byte 0x00002B48
_0222D9DC: .4byte 0x000029FC
	thumb_func_end ov74_0222D824

	thumb_func_start ov74_0222D9E0
ov74_0222D9E0: @ 0x0222D9E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r7, r3, #0
	movs r3, #0x30
	ldr r0, _0222DAE0 @ =0x0223C340
	muls r3, r2, r3
	adds r6, r1, #0
	adds r4, r0, r3
	ldr r0, [r6]
	cmp r0, #0
	bne _0222DA2A
	ldr r0, [r4, #8]
	movs r2, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, _0222DAE4 @ =0x000029FC
	ldr r3, [r4, #4]
	ldr r0, [r5, r0]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
_0222DA2A:
	ldr r1, [r4, #0x1c]
	adds r0, r6, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201D978
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0222DA58
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xf7
	movs r3, #0x55
	bl FUN_0200BAF8
	ldr r1, _0222DAE8 @ =0x00002A04
	str r0, [r5, r1]
	movs r0, #0x55
	bl FUN_0200BD08
	movs r1, #0x2a
	lsls r1, r1, #8
	str r0, [r5, r1]
_0222DA58:
	ldr r0, _0222DAEC @ =0x00002B98
	ldr r2, _0222DAF0 @ =0x00010200
	str r7, [r5, r0]
	adds r0, r0, #4
	str r4, [r5, r0]
	ldr r3, [r4, #0x24]
	adds r0, r5, #0
	adds r1, r6, #0
	blx r3
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _0222DAB2
	movs r1, #0x2a
	lsls r1, r1, #8
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r3, #0x55
	bl FUN_0200BC4C
	str r0, [sp, #0x14]
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	ldr r2, [sp, #0x14]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r1, [r4, #0x14]
	adds r0, r6, #0
	bl FUN_020200FC
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	ldr r0, _0222DAE8 @ =0x00002A04
	ldr r0, [r5, r0]
	bl FUN_0200BB44
	movs r0, #0x2a
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	bl FUN_0200BDA0
_0222DAB2:
	ldr r0, _0222DAF4 @ =0x00002BD0
	adds r0, r5, r0
	cmp r6, r0
	bne _0222DAC8
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x13
	movs r3, #0xa
	bl FUN_0200E998
	b _0222DAD4
_0222DAC8:
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0xe
	bl FUN_0200E580
_0222DAD4:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	muls r0, r1, r0
	adds r0, r7, r0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222DAE0: .4byte 0x0223C340
_0222DAE4: .4byte 0x000029FC
_0222DAE8: .4byte 0x00002A04
_0222DAEC: .4byte 0x00002B98
_0222DAF0: .4byte 0x00010200
_0222DAF4: .4byte 0x00002BD0
	thumb_func_end ov74_0222D9E0

	thumb_func_start ov74_0222DAF8
ov74_0222DAF8: @ 0x0222DAF8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r4, #0
_0222DB02:
	adds r4, r4, r6
	cmp r4, #3
	bne _0222DB0A
	movs r4, #0
_0222DB0A:
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0222DB14
	movs r4, #2
_0222DB14:
	cmp r7, r4
	beq _0222DB26
	ldr r0, _0222DB2C @ =0x00002BA0
	adds r1, r4, #0
	ldr r0, [r5, r0]
	bl FUN_0202DE90
	cmp r0, #0
	beq _0222DB02
_0222DB26:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DB2C: .4byte 0x00002BA0
	thumb_func_end ov74_0222DAF8

	thumb_func_start ov74_0222DB30
ov74_0222DB30: @ 0x0222DB30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r2, #0
	movs r2, #1
	adds r5, r0, #0
	str r2, [sp]
	adds r6, r3, #0
	ldr r3, [r5]
	movs r0, #0x71
	bl FUN_02007A44
	add r1, sp, #4
	adds r7, r0, #0
	blx FUN_020B71D8
	ldr r0, _0222DB6C @ =0x000029FC
	ldr r2, [sp, #4]
	lsls r1, r4, #0x18
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	adds r2, #0xc
	adds r3, r6, #0
	bl FUN_0201C0A8
	adds r0, r7, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DB6C: .4byte 0x000029FC
	thumb_func_end ov74_0222DB30

	thumb_func_start ov74_0222DB70
ov74_0222DB70: @ 0x0222DB70
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #1
	lsls r0, r0, #8
	str r0, [sp]
	ldr r0, [r5]
	movs r2, #0
	adds r4, r1, #0
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #3
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222DC5C @ =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	movs r0, #0x71
	movs r1, #6
	bl FUN_020078F0
	cmp r4, #0
	beq _0222DBB6
	cmp r4, #1
	beq _0222DBD6
	b _0222DBF4
_0222DBB6:
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222DC5C @ =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	movs r0, #0x71
	movs r1, #4
	bl FUN_02007914
	b _0222DBF4
_0222DBD6:
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222DC5C @ =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	movs r0, #0x71
	movs r1, #5
	bl FUN_02007914
_0222DBF4:
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r5]
	movs r1, #0
	str r0, [sp, #4]
	movs r0, #0x71
	adds r3, r0, #0
	adds r2, r1, #0
	adds r3, #0xef
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222DC5C @ =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	movs r0, #0x71
	movs r3, #3
	bl FUN_020078F0
	movs r2, #3
	adds r0, r5, #0
	movs r1, #2
	lsls r3, r2, #9
	bl ov74_0222DB30
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	ldr r0, _0222DC5C @ =0x000029FC
	movs r2, #0
	ldr r0, [r5, r0]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201CA4C
	ldr r0, _0222DC5C @ =0x000029FC
	movs r1, #3
	ldr r0, [r5, r0]
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222DC5C: .4byte 0x000029FC
	thumb_func_end ov74_0222DB70

	thumb_func_start ov74_0222DC60
ov74_0222DC60: @ 0x0222DC60
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl FUN_02007290
	ldr r1, _0222DCC8 @ =0x00002BC8
	ldr r0, [r0, r1]
	bl FUN_02001338
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _0222DC86
	adds r0, r0, #1
	cmp r4, r0
	beq _0222DCC4
	b _0222DCA0
_0222DC86:
	ldr r0, _0222DCCC @ =0x000005DC
	bl FUN_0200604C
	cmp r6, #0
	beq _0222DCC4
	adds r0, r7, #0
	blx r6
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222DCC4
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222DCA0:
	ldr r0, _0222DCCC @ =0x000005DC
	bl FUN_0200604C
	cmp r4, #0
	beq _0222DCC4
	cmp r4, #0x1f
	bhs _0222DCB2
	str r4, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222DCB2:
	ldr r0, _0222DCD0 @ =0x0223D0BC
	str r4, [r0]
	adds r0, r7, #0
	blx r4
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222DCC4
	str r0, [r5]
_0222DCC4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DCC8: .4byte 0x00002BC8
_0222DCCC: .4byte 0x000005DC
_0222DCD0: .4byte 0x0223D0BC
	thumb_func_end ov74_0222DC60

	thumb_func_start ov74_0222DCD4
ov74_0222DCD4: @ 0x0222DCD4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r1, _0222DDF0 @ =0x00002DCC
	adds r6, r0, #0
	ldr r0, [r6, r1]
	cmp r0, #0
	bne _0222DD34
	adds r0, r1, #4
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _0222DD34
	adds r1, #8
	ldr r0, [r6, r1]
	cmp r0, #0
	bne _0222DD34
	bl ov74_0223567C
	cmp r0, #1
	bne _0222DD00
	adds r0, r6, #0
	bl ov74_0222D024
_0222DD00:
	bl ov74_0223563C
	bl ov74_02235690
	movs r0, #0x1c
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0x1e
	movs r2, #0x1b
	movs r3, #0x1d
	bl ov74_02235728
	bl FUN_02074490
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, [r6]
	movs r2, #1
	str r0, [sp, #4]
	movs r0, #0x14
	movs r3, #0x60
	bl FUN_02007938
_0222DD34:
	movs r0, #0xb2
	movs r4, #0
	str r0, [sp, #0x10]
	str r4, [sp, #0xc]
	adds r5, r6, #0
	movs r7, #0x64
_0222DD40:
	movs r0, #0xaf
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	lsls r0, r0, #2
	adds r1, r6, r0
	ldr r0, _0222DDF4 @ =0x00002BB4
	ldr r0, [r1, r0]
	adds r1, r0, r4
	ldr r0, _0222DDF8 @ =0x0000034A
	ldrh r0, [r1, r0]
	str r0, [sp, #8]
	cmp r0, #0
	bne _0222DD6A
	ldr r0, _0222DDF0 @ =0x00002DCC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222DDD4
	movs r1, #0
	bl FUN_02024830
	b _0222DDD4
_0222DD6A:
	ldr r0, [sp, #0xc]
	ldr r1, _0222DDF0 @ =0x00002DCC
	adds r0, #0xa
	str r0, [sp]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x10]
	movs r0, #0
	movs r3, #0x10
	bl ov74_02235930
	ldr r1, _0222DDF0 @ =0x00002DCC
	str r0, [r5, r1]
	movs r1, #0
	ldr r0, [sp, #8]
	adds r2, r1, #0
	bl FUN_020741BC
	adds r1, r0, #0
	ldr r0, [r6]
	movs r2, #0
	str r0, [sp]
	movs r0, #0x14
	add r3, sp, #0x18
	bl FUN_020079BC
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r1, #2
	ldr r0, [r0, #0x14]
	lsls r1, r1, #8
	blx FUN_020D2894
	ldr r0, [sp, #0x18]
	movs r2, #2
	ldr r0, [r0, #0x14]
	lsls r1, r7, #5
	lsls r2, r2, #8
	blx FUN_020CFE74
	movs r1, #0
	ldr r0, [sp, #8]
	adds r2, r1, #0
	bl FUN_02074364
	adds r1, r0, #0
	ldr r0, _0222DDF0 @ =0x00002DCC
	adds r1, r1, #3
	ldr r0, [r5, r0]
	bl FUN_02024A14
	ldr r0, [sp, #0x14]
	bl FUN_0201AB0C
_0222DDD4:
	ldr r0, [sp, #0xc]
	adds r4, r4, #2
	adds r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r5, r5, #4
	adds r0, #0x19
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	adds r7, #0x10
	cmp r0, #3
	blt _0222DD40
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222DDF0: .4byte 0x00002DCC
_0222DDF4: .4byte 0x00002BB4
_0222DDF8: .4byte 0x0000034A
	thumb_func_end ov74_0222DCD4

	thumb_func_start ov74_0222DDFC
ov74_0222DDFC: @ 0x0222DDFC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0x55
	lsls r2, r0, #0x10
	bl FUN_0201A910
	ldr r1, _0222DE60 @ =0x00003D54
	adds r0, r4, #0
	movs r2, #0x55
	bl FUN_02007280
	ldr r2, _0222DE60 @ =0x00003D54
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x55
	bl FUN_0201AC88
	ldr r1, _0222DE64 @ =0x000029FC
	str r0, [r4, r1]
	movs r0, #0x55
	str r0, [r4]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0xaf
	movs r1, #2
	lsls r0, r0, #6
	str r1, [r4, r0]
	movs r1, #1
	adds r0, #0x7c
	str r1, [r4, r0]
	movs r0, #0x55
	bl ov74_022352A0
	movs r2, #0x57
	movs r0, #0
	movs r1, #0x59
	lsls r2, r2, #4
	bl FUN_0201A910
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0222DE60: .4byte 0x00003D54
_0222DE64: .4byte 0x000029FC
	thumb_func_end ov74_0222DDFC

	thumb_func_start ov74_0222DE68
ov74_0222DE68: @ 0x0222DE68
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02014AA0
	movs r0, #3
	lsls r0, r0, #0xa
	ldr r0, [r4, r0]
	bl FUN_02014A60
	ldr r1, _0222DE88 @ =0x04000010
	movs r2, #8
	movs r3, #1
	bl FUN_02014AB0
	pop {r4, pc}
	nop
_0222DE88: .4byte 0x04000010
	thumb_func_end ov74_0222DE68

	thumb_func_start ov74_0222DE8C
ov74_0222DE8C: @ 0x0222DE8C
	push {r3, r4, r5, lr}
	ldr r4, _0222DEE0 @ =0x00003130
	ldr r5, _0222DEE4 @ =0x00000C14
	adds r4, r0, r4
	adds r0, r5, #0
	str r1, [r4, r5]
	subs r0, #0xc
	str r2, [r4, r0]
	adds r0, r5, #0
	subs r0, #8
	subs r5, #0x14
	str r3, [r4, r0]
	ldr r0, [r4, r5]
	cmp r0, #0
	bne _0222DEBE
	movs r2, #6
	lsls r2, r2, #8
	movs r0, #0x55
	adds r1, r4, #0
	adds r2, r4, r2
	bl FUN_02014A08
	movs r1, #3
	lsls r1, r1, #0xa
	str r0, [r4, r1]
_0222DEBE:
	ldr r0, _0222DEE8 @ =0x00000C04
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222DED6
	movs r2, #1
	ldr r0, _0222DEEC @ =ov74_0222DE68
	adds r1, r4, #0
	lsls r2, r2, #0xa
	bl FUN_0200E33C
	ldr r1, _0222DEE8 @ =0x00000C04
	str r0, [r4, r1]
_0222DED6:
	movs r0, #0xc1
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r4, r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222DEE0: .4byte 0x00003130
_0222DEE4: .4byte 0x00000C14
_0222DEE8: .4byte 0x00000C04
_0222DEEC: .4byte ov74_0222DE68
	thumb_func_end ov74_0222DE8C

	thumb_func_start ov74_0222DEF0
ov74_0222DEF0: @ 0x0222DEF0
	push {r4, lr}
	ldr r1, _0222DF24 @ =0x00003130
	adds r4, r0, r1
	movs r0, #3
	lsls r0, r0, #0xa
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222DF04
	bl FUN_02014A38
_0222DF04:
	ldr r0, _0222DF28 @ =0x00000C04
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222DF10
	bl FUN_0200E390
_0222DF10:
	movs r0, #3
	movs r1, #0
	lsls r0, r0, #0xa
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	bl FUN_02014AA0
	pop {r4, pc}
	nop
_0222DF24: .4byte 0x00003130
_0222DF28: .4byte 0x00000C04
	thumb_func_end ov74_0222DEF0

	thumb_func_start ov74_0222DF2C
ov74_0222DF2C: @ 0x0222DF2C
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0222E034 @ =0x00003130
	movs r5, #0x15
	adds r4, r0, r1
	movs r0, #0xc1
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	lsls r5, r5, #0xe
	cmp r1, #0
	bne _0222DF44
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222DF44:
	adds r1, r0, #4
	ldr r1, [r4, r1]
	cmp r1, #1
	bne _0222DF92
	adds r1, r0, #0
	subs r1, #8
	ldr r2, [r4, r1]
	subs r1, r0, #4
	ldr r1, [r4, r1]
	adds r2, r2, r1
	adds r1, r0, #0
	subs r1, #8
	str r2, [r4, r1]
	subs r1, r0, #4
	ldr r2, [r4, r1]
	adds r1, r2, #0
	adds r2, r2, r1
	subs r1, r0, #4
	str r2, [r4, r1]
	adds r1, r0, #0
	subs r1, #8
	ldr r2, [r4, r1]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r2, r1, #0xc
	movs r1, #0xfa
	lsls r1, r1, #2
	cmp r2, r1
	ble _0222DFCC
	movs r2, #0
	adds r1, r0, #0
	str r2, [r4, r0]
	subs r1, #8
	str r2, [r4, r1]
	subs r0, r0, #4
	movs r5, #0xa8
	str r2, [r4, r0]
	b _0222DFCC
_0222DF92:
	adds r1, r0, #0
	subs r1, #8
	ldr r2, [r4, r1]
	subs r1, r0, #4
	ldr r1, [r4, r1]
	subs r2, r2, r1
	adds r1, r0, #0
	subs r1, #8
	str r2, [r4, r1]
	subs r1, r0, #4
	ldr r2, [r4, r1]
	lsrs r1, r2, #0x1f
	adds r1, r2, r1
	asrs r2, r1, #1
	subs r1, r0, #4
	str r2, [r4, r1]
	movs r2, #1
	ldr r1, [r4, r1]
	lsls r2, r2, #0xa
	cmp r1, r2
	bge _0222DFCC
	movs r1, #0
	lsls r3, r2, #2
	adds r2, r0, #0
	str r1, [r4, r0]
	subs r2, #8
	str r3, [r4, r2]
	subs r0, r0, #4
	str r1, [r4, r0]
_0222DFCC:
	movs r0, #3
	lsls r0, r0, #0xa
	ldr r0, [r4, r0]
	bl FUN_02014A4C
	adds r2, r0, #0
	movs r0, #0x54
	adds r3, r0, #0
	adds r3, #0xfc
_0222DFDE:
	asrs r1, r5, #0xb
	lsrs r1, r1, #0x14
	adds r1, r5, r1
	asrs r1, r1, #0xc
	bpl _0222DFEA
	movs r1, #0
_0222DFEA:
	cmp r1, #0xa8
	ble _0222DFF0
	movs r1, #0xa8
_0222DFF0:
	lsls r6, r3, #1
	adds r7, r2, r6
	subs r6, r1, r0
	strh r6, [r7, #6]
	ldrh r6, [r7, #6]
	subs r1, r0, r1
	adds r3, r3, #4
	strh r6, [r7, #2]
	movs r6, #0xa8
	subs r6, r6, r0
	lsls r6, r6, #3
	adds r6, r2, r6
	strh r1, [r6, #6]
	ldrh r1, [r6, #6]
	adds r0, r0, #1
	strh r1, [r6, #2]
	ldr r1, _0222E038 @ =0x00000C08
	ldr r1, [r4, r1]
	adds r5, r5, r1
	cmp r0, #0xa8
	blt _0222DFDE
	movs r1, #6
	adds r0, r2, #0
	lsls r1, r1, #8
	blx FUN_020D2894
	movs r0, #3
	lsls r0, r0, #0xa
	ldr r0, [r4, r0]
	bl FUN_02014A8C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E034: .4byte 0x00003130
_0222E038: .4byte 0x00000C08
	thumb_func_end ov74_0222DF2C

	thumb_func_start ov74_0222E03C
ov74_0222E03C: @ 0x0222E03C
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_022360B0
	subs r0, r0, #2
	cmp r0, #1
	bhi _0222E056
	ldr r0, _0222E058 @ =0x0000061A
	bl FUN_0200604C
	ldr r0, _0222E05C @ =0x00003D48
	movs r1, #0
	str r1, [r4, r0]
_0222E056:
	pop {r4, pc}
	.align 2, 0
_0222E058: .4byte 0x0000061A
_0222E05C: .4byte 0x00003D48
	thumb_func_end ov74_0222E03C

	thumb_func_start ov74_0222E060
ov74_0222E060: @ 0x0222E060
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xaf
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #3
	blt _0222E072
	bl FUN_0202551C
_0222E072:
	movs r0, #0x1b
	bl FUN_02028900
	movs r0, #0xaf
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	subs r0, #0xc
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r2, [r1, r0]
	movs r0, #0x35
	lsls r0, r0, #4
	ldrb r1, [r2, r0]
	cmp r1, #0xff
	beq _0222E094
	adds r1, r1, #1
	strb r1, [r2, r0]
_0222E094:
	movs r0, #0xaf
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	subs r0, #0xc
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r2, [r1, r0]
	movs r0, #0xd2
	lsls r0, r0, #2
	ldrb r1, [r2, r0]
	cmp r1, #0xff
	beq _0222E0B0
	subs r1, r1, #1
	strb r1, [r2, r0]
_0222E0B0:
	movs r0, #0x1b
	bl FUN_0202893C
	ldr r0, _0222E0C8 @ =0x00002BA4
	ldr r0, [r4, r0]
	bl ov74_022360A0
	ldr r1, _0222E0CC @ =ov74_0222E03C
	ldr r0, _0222E0D0 @ =0x00003D48
	str r1, [r4, r0]
	pop {r4, pc}
	nop
_0222E0C8: .4byte 0x00002BA4
_0222E0CC: .4byte ov74_0222E03C
_0222E0D0: .4byte 0x00003D48
	thumb_func_end ov74_0222E060

	thumb_func_start ov74_0222E0D4
ov74_0222E0D4: @ 0x0222E0D4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r2, #0
	ldr r2, _0222E1D4 @ =0x021D110C
	adds r6, r1, #0
	ldr r3, [r2, #0x48]
	ldr r1, _0222E1D8 @ =0x00003D4C
	adds r5, r0, #0
	movs r2, #0x10
	ldr r0, [r5, r1]
	tst r2, r3
	beq _0222E0F2
	cmp r0, #1
	beq _0222E0F2
	movs r2, #1
	str r2, [r5, r1]
_0222E0F2:
	ldr r1, _0222E1D4 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #0x20
	tst r1, r2
	beq _0222E108
	ldr r1, _0222E1D8 @ =0x00003D4C
	ldr r2, [r5, r1]
	cmp r2, #0
	beq _0222E108
	movs r2, #0
	str r2, [r5, r1]
_0222E108:
	ldr r1, _0222E1D8 @ =0x00003D4C
	ldr r1, [r5, r1]
	cmp r0, r1
	beq _0222E138
	cmp r1, #0
	bne _0222E118
	movs r1, #1
	b _0222E11A
_0222E118:
	movs r1, #0
_0222E11A:
	ldr r0, _0222E1DC @ =0x00002DC4
	ldr r0, [r5, r0]
	bl FUN_020248F0
	ldr r0, _0222E1D8 @ =0x00003D4C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222E12E
	movs r1, #1
	b _0222E130
_0222E12E:
	movs r1, #0
_0222E130:
	ldr r0, _0222E1E0 @ =0x00002DC8
	ldr r0, [r5, r0]
	bl FUN_020248F0
_0222E138:
	ldr r0, _0222E1D4 @ =0x021D110C
	movs r4, #0
	ldr r1, [r0, #0x48]
	movs r0, #2
	adds r2, r1, #0
	tst r2, r0
	beq _0222E14A
	adds r4, r0, #0
	b _0222E17A
_0222E14A:
	movs r0, #1
	ands r1, r0
	beq _0222E160
	cmp r6, #0
	beq _0222E160
	ldr r2, _0222E1D8 @ =0x00003D4C
	ldr r2, [r5, r2]
	cmp r2, #0
	bne _0222E160
	adds r4, r0, #0
	b _0222E17A
_0222E160:
	cmp r1, #0
	beq _0222E170
	ldr r0, _0222E1D8 @ =0x00003D4C
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0222E170
	movs r4, #2
	b _0222E17A
_0222E170:
	cmp r1, #0
	beq _0222E17A
	cmp r6, #0
	bne _0222E17A
	movs r4, #3
_0222E17A:
	cmp r4, #1
	bne _0222E1B2
	ldr r0, _0222E1E4 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0xab
	bl FUN_02037AC0
	movs r3, #0xa
	ldr r1, _0222E1E8 @ =0x00002C34
	movs r0, #1
	str r0, [r5, r1]
	movs r0, #0x16
	subs r1, #0x64
	str r0, [r7]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r2, #0x11
	lsls r3, r3, #6
	bl ov74_0222D9E0
	ldr r0, _0222E1EC @ =0x00002BD0
	movs r1, #0x13
	adds r0, r5, r0
	bl FUN_0200F0AC
	ldr r1, _0222E1F0 @ =0x00003D50
	str r0, [r5, r1]
_0222E1B2:
	cmp r4, #2
	bne _0222E1C6
	ldr r0, _0222E1E4 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x14
	bl ov74_0222EB28
_0222E1C6:
	cmp r4, #3
	bne _0222E1D0
	ldr r0, _0222E1E4 @ =0x000005DC
	bl FUN_0200604C
_0222E1D0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E1D4: .4byte 0x021D110C
_0222E1D8: .4byte 0x00003D4C
_0222E1DC: .4byte 0x00002DC4
_0222E1E0: .4byte 0x00002DC8
_0222E1E4: .4byte 0x000005DC
_0222E1E8: .4byte 0x00002C34
_0222E1EC: .4byte 0x00002BD0
_0222E1F0: .4byte 0x00003D50
	thumb_func_end ov74_0222E0D4

	thumb_func_start ov74_0222E1F4
ov74_0222E1F4: @ 0x0222E1F4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r6, r0, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #0x1e
	bls _0222E20A
	b _0222E79C
_0222E20A:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0222E216: @ jump table
	.2byte _0222E254 - _0222E216 - 2 @ case 0
	.2byte _0222E2C2 - _0222E216 - 2 @ case 1
	.2byte _0222E2D4 - _0222E216 - 2 @ case 2
	.2byte _0222E34A - _0222E216 - 2 @ case 3
	.2byte _0222E3C8 - _0222E216 - 2 @ case 4
	.2byte _0222E3F0 - _0222E216 - 2 @ case 5
	.2byte _0222E410 - _0222E216 - 2 @ case 6
	.2byte _0222E444 - _0222E216 - 2 @ case 7
	.2byte _0222E468 - _0222E216 - 2 @ case 8
	.2byte _0222E48E - _0222E216 - 2 @ case 9
	.2byte _0222E4BA - _0222E216 - 2 @ case 10
	.2byte _0222E4F4 - _0222E216 - 2 @ case 11
	.2byte _0222E518 - _0222E216 - 2 @ case 12
	.2byte _0222E744 - _0222E216 - 2 @ case 13
	.2byte _0222E524 - _0222E216 - 2 @ case 14
	.2byte _0222E530 - _0222E216 - 2 @ case 15
	.2byte _0222E540 - _0222E216 - 2 @ case 16
	.2byte _0222E54C - _0222E216 - 2 @ case 17
	.2byte _0222E58E - _0222E216 - 2 @ case 18
	.2byte _0222E5E8 - _0222E216 - 2 @ case 19
	.2byte _0222E646 - _0222E216 - 2 @ case 20
	.2byte _0222E652 - _0222E216 - 2 @ case 21
	.2byte _0222E6A2 - _0222E216 - 2 @ case 22
	.2byte _0222E68E - _0222E216 - 2 @ case 23
	.2byte _0222E6D6 - _0222E216 - 2 @ case 24
	.2byte _0222E6F2 - _0222E216 - 2 @ case 25
	.2byte _0222E734 - _0222E216 - 2 @ case 26
	.2byte _0222E76E - _0222E216 - 2 @ case 27
	.2byte _0222E77A - _0222E216 - 2 @ case 28
	.2byte _0222E78C - _0222E216 - 2 @ case 29
	.2byte _0222E79C - _0222E216 - 2 @ case 30
_0222E254:
	adds r0, r6, #0
	bl FUN_020072A4
	ldr r1, [r0, #8]
	ldr r0, _0222E5A4 @ =0x00002BA4
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	bl FUN_020270E4
	ldr r1, _0222E5A8 @ =0x00002BA0
	str r0, [r4, r1]
	adds r0, r1, #4
	ldr r0, [r4, r0]
	bl FUN_02028EA8
	ldr r1, _0222E5AC @ =0x00002BA8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl FUN_0202ADCC
	ldr r1, _0222E5B0 @ =0x00002BAC
	str r0, [r4, r1]
	subs r1, #0xc
	ldr r0, [r4, r1]
	movs r1, #0
	bl FUN_0202DBF4
	ldr r1, _0222E5B4 @ =0x00002BB4
	str r0, [r4, r1]
	subs r1, #0x14
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_0202DBF4
	ldr r1, _0222E5B8 @ =0x00002BB8
	str r0, [r4, r1]
	subs r1, #0x18
	ldr r0, [r4, r1]
	movs r1, #2
	bl FUN_0202DBF4
	ldr r1, _0222E5BC @ =0x00002BBC
	movs r2, #1
	str r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov74_0222DAF8
	movs r1, #0xaf
	lsls r1, r1, #6
	str r0, [r4, r1]
	movs r0, #1
	str r0, [r5]
	b _0222E79C
_0222E2C2:
	bl ov74_0222FCA4
	ldr r0, _0222E5C0 @ =0x000029FC
	ldr r0, [r4, r0]
	bl ov74_0222FCC4
	movs r0, #2
	str r0, [r5]
	b _0222E79C
_0222E2D4:
	bl FUN_02020080
	adds r0, r4, #0
	movs r1, #0
	bl ov74_0222DB70
	movs r1, #0x1e
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x55
	bl FUN_02003030
	movs r1, #0
	str r1, [sp]
	movs r0, #0x55
	str r0, [sp, #4]
	ldr r0, _0222E5C0 @ =0x000029FC
	movs r2, #1
	ldr r0, [r4, r0]
	movs r3, #0xd
	bl FUN_0200E3DC
	movs r0, #1
	str r0, [sp]
	movs r0, #0x55
	str r0, [sp, #4]
	ldr r0, _0222E5C0 @ =0x000029FC
	movs r1, #0
	ldr r0, [r4, r0]
	movs r2, #0xa
	movs r3, #0xe
	bl FUN_0200E3DC
	ldr r0, _0222E5B0 @ =0x00002BAC
	movs r1, #0
	ldr r0, [r4, r0]
	movs r2, #0x13
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x55
	str r0, [sp, #4]
	ldr r0, _0222E5C0 @ =0x000029FC
	movs r3, #0xa
	ldr r0, [r4, r0]
	bl FUN_0200E644
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov74_0222D824
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	adds r3, r5, #0
	bl ov74_0222D7F0
	b _0222E79C
_0222E34A:
	movs r1, #0xaf
	lsls r1, r1, #6
	ldr r6, [r4, r1]
	ldr r1, _0222E5C4 @ =0x021D110C
	movs r2, #0x40
	ldr r1, [r1, #0x48]
	adds r3, r1, #0
	tst r3, r2
	beq _0222E368
	adds r1, r6, #0
	subs r2, #0x41
	bl ov74_0222DAF8
	adds r6, r0, #0
	b _0222E3A4
_0222E368:
	movs r2, #0x80
	tst r2, r1
	beq _0222E37A
	adds r1, r6, #0
	movs r2, #1
	bl ov74_0222DAF8
	adds r6, r0, #0
	b _0222E3A4
_0222E37A:
	movs r0, #2
	tst r0, r1
	beq _0222E394
	ldr r0, _0222E5C8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x1d
	adds r3, r5, #0
	bl ov74_0222D7F0
	b _0222E3A4
_0222E394:
	movs r0, #1
	tst r0, r1
	beq _0222E3A4
	ldr r0, _0222E5C8 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #4
	str r0, [r5]
_0222E3A4:
	movs r0, #0xaf
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, r6
	bne _0222E3B0
	b _0222E79C
_0222E3B0:
	ldr r0, _0222E5CC @ =0x000005FF
	bl FUN_0200604C
	movs r0, #0xaf
	lsls r0, r0, #6
	str r6, [r4, r0]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov74_0222D824
	b _0222E79C
_0222E3C8:
	ldr r1, _0222E5D0 @ =0x00002BD0
	movs r3, #0xa
	adds r1, r4, r1
	movs r2, #7
	lsls r3, r3, #6
	bl ov74_0222D9E0
	ldr r3, _0222E5D4 @ =0x00002BF0
	movs r2, #8
	adds r1, r3, #0
	str r0, [r4, r3]
	subs r1, #0x10
	ldr r3, [r4, r3]
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov74_0222D9E0
	movs r0, #5
	str r0, [r5]
	b _0222E79C
_0222E3F0:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0
	bl ov74_0222DC60
	ldr r0, _0222E5C4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _0222E4C2
	ldr r0, _0222E5C8 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0xb
	str r0, [r5]
	b _0222E79C
_0222E410:
	ldr r0, _0222E5CC @ =0x000005FF
	bl FUN_0200604C
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	ldr r0, _0222E5D0 @ =0x00002BD0
	movs r1, #0
	adds r0, r4, r0
	bl ov74_0222D104
	ldr r0, _0222E5D8 @ =0x00002BE0
	movs r1, #0
	adds r0, r4, r0
	bl ov74_0222D0EC
	movs r1, #1
	adds r0, r4, #0
	lsls r2, r1, #0xc
	movs r3, #0x66
	bl ov74_0222DE8C
	movs r0, #7
	str r0, [r5]
	b _0222E79C
_0222E444:
	bl ov74_0222DF2C
	cmp r0, #0
	beq _0222E4C2
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov74_0222D824
	ldr r2, _0222E5DC @ =0x00708000
	adds r0, r4, #0
	movs r1, #0
	lsrs r3, r2, #1
	bl ov74_0222DE8C
	movs r0, #8
	str r0, [r5]
	b _0222E79C
_0222E468:
	bl ov74_0222DF2C
	ldr r0, _0222E5C4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _0222E4C2
	ldr r0, _0222E5CC @ =0x000005FF
	bl FUN_0200604C
	movs r1, #1
	adds r0, r4, #0
	lsls r2, r1, #0xc
	movs r3, #0x66
	bl ov74_0222DE8C
	movs r0, #9
	str r0, [r5]
	b _0222E79C
_0222E48E:
	bl ov74_0222DF2C
	cmp r0, #0
	beq _0222E4C2
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov74_0222D824
	ldr r2, _0222E5DC @ =0x00708000
	adds r0, r4, #0
	movs r1, #0
	lsrs r3, r2, #1
	bl ov74_0222DE8C
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0xa
	str r0, [r5]
	b _0222E79C
_0222E4BA:
	bl ov74_0222DF2C
	cmp r0, #0
	bne _0222E4C4
_0222E4C2:
	b _0222E79C
_0222E4C4:
	ldr r0, _0222E5D0 @ =0x00002BD0
	movs r1, #0
	adds r0, r4, r0
	movs r2, #0x13
	movs r3, #0xa
	bl FUN_0200E998
	ldr r0, _0222E5D8 @ =0x00002BE0
	movs r1, #0
	adds r0, r4, r0
	movs r2, #0xa
	movs r3, #0xe
	bl FUN_0200E580
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	adds r0, r4, #0
	bl ov74_0222DEF0
	movs r0, #5
	str r0, [r5]
	b _0222E79C
_0222E4F4:
	bl ov74_0222D448
	ldr r0, _0222E5D0 @ =0x00002BD0
	movs r1, #0
	adds r0, r4, r0
	bl ov74_0222D104
	ldr r0, _0222E5D0 @ =0x00002BD0
	adds r0, r4, r0
	bl FUN_0201D8C8
	ldr r0, _0222E5D0 @ =0x00002BD0
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #3
	str r0, [r5]
	b _0222E79C
_0222E518:
	ldr r2, _0222E5E0 @ =ov74_0222D414
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov74_0222DC60
	b _0222E79C
_0222E524:
	ldr r2, _0222E5E0 @ =ov74_0222D414
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov74_0222DC60
	b _0222E79C
_0222E530:
	ldr r1, _0222E5D8 @ =0x00002BE0
	ldr r2, _0222E5E4 @ =0x00010200
	adds r1, r4, r1
	bl ov74_0222D7A4
	movs r0, #0xe
	str r0, [r5]
	b _0222E79C
_0222E540:
	movs r1, #0
	movs r2, #0x11
	adds r3, r5, #0
	bl ov74_0222D7F0
	b _0222E79C
_0222E54C:
	bl ov74_0222D448
	ldr r0, _0222E5D0 @ =0x00002BD0
	movs r1, #0
	adds r0, r4, r0
	bl ov74_0222D104
	ldr r0, _0222E5D0 @ =0x00002BD0
	adds r0, r4, r0
	bl FUN_0201D8C8
	ldr r0, _0222E5D0 @ =0x00002BD0
	adds r0, r4, r0
	bl FUN_0201D520
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl ov74_0222D824
	ldr r0, _0222E5C0 @ =0x000029FC
	ldr r0, [r4, r0]
	bl ov74_0222D248
	adds r0, r4, #0
	bl ov74_0222CFFC
	adds r0, r4, #0
	bl ov74_0222D098
	movs r0, #0x12
	str r0, [r5]
	b _0222E79C
_0222E58E:
	bl ov74_0222E7EC
	bl FUN_0203A880
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x13
	adds r3, r5, #0
	bl ov74_0222D7F0
	b _0222E79C
	.align 2, 0
_0222E5A4: .4byte 0x00002BA4
_0222E5A8: .4byte 0x00002BA0
_0222E5AC: .4byte 0x00002BA8
_0222E5B0: .4byte 0x00002BAC
_0222E5B4: .4byte 0x00002BB4
_0222E5B8: .4byte 0x00002BB8
_0222E5BC: .4byte 0x00002BBC
_0222E5C0: .4byte 0x000029FC
_0222E5C4: .4byte 0x021D110C
_0222E5C8: .4byte 0x000005DC
_0222E5CC: .4byte 0x000005FF
_0222E5D0: .4byte 0x00002BD0
_0222E5D4: .4byte 0x00002BF0
_0222E5D8: .4byte 0x00002BE0
_0222E5DC: .4byte 0x00708000
_0222E5E0: .4byte ov74_0222D414
_0222E5E4: .4byte 0x00010200
_0222E5E8:
	movs r6, #0
	adds r0, r6, #0
	bl FUN_020373B4
	cmp r0, #0
	beq _0222E63A
	adds r0, r4, #0
	adds r0, #0x90
	bl FUN_020358B8
	ldr r1, _0222E7C0 @ =0x00002B08
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov74_0222E8B4
	adds r6, r0, #0
	bne _0222E62A
	ldr r0, _0222E7C4 @ =0x00002C30
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222E62A
	ldr r0, _0222E7C0 @ =0x00002B08
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0201D978
	ldr r0, _0222E7C0 @ =0x00002B08
	adds r0, r4, r0
	bl FUN_0201D578
	ldr r0, _0222E7C4 @ =0x00002C30
	movs r1, #0
	str r1, [r4, r0]
_0222E62A:
	ldr r1, _0222E7C8 @ =0x00002AF8
	adds r0, r4, #0
	adds r1, r4, r1
	adds r2, r6, #0
	bl ov74_0222EA88
	ldr r0, _0222E7C4 @ =0x00002C30
	str r6, [r4, r0]
_0222E63A:
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl ov74_0222E0D4
	b _0222E79C
_0222E646:
	movs r1, #0
	movs r2, #0x15
	adds r3, r5, #0
	bl ov74_0222D7F0
	b _0222E79C
_0222E652:
	bl ov74_0222D024
	ldr r0, _0222E7CC @ =0x00002BD0
	movs r1, #0
	adds r0, r4, r0
	bl ov74_0222D104
	ldr r0, _0222E7D0 @ =0x00002BE0
	movs r1, #0
	adds r0, r4, r0
	bl ov74_0222D0EC
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov74_0222D824
	movs r1, #0x1e
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x55
	bl FUN_02003030
	adds r0, r4, #0
	movs r1, #1
	movs r2, #4
	adds r3, r5, #0
	bl ov74_0222D7F0
	b _0222E79C
_0222E68E:
	bl FUN_02037D78
	cmp r0, #0
	beq _0222E698
	b _0222E79C
_0222E698:
	movs r0, #0xb1
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	str r0, [r5]
	b _0222E79C
_0222E6A2:
	ldr r0, _0222E7D4 @ =0x00002C34
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222E79C
	ldr r1, _0222E7D8 @ =0x00002DD8
	adds r0, r4, #0
	ldr r2, [r4]
	adds r0, #0x90
	adds r1, r4, r1
	bl ov74_02235ED0
	ldr r0, _0222E7D8 @ =0x00002DD8
	movs r1, #0xd6
	adds r0, r4, r0
	lsls r1, r1, #2
	bl ov74_02229D0C
	adds r0, r4, #0
	bl ov74_0222E060
	movs r0, #0x18
	str r0, [r5]
	b _0222E79C
_0222E6D6:
	bl ov74_0223615C
	cmp r0, #4
	bne _0222E79C
	movs r0, #0x93
	bl FUN_02037AC0
	movs r0, #1
	adds r1, r0, #0
	bl FUN_020398D4
	movs r0, #0x19
	str r0, [r5]
	b _0222E79C
_0222E6F2:
	bl ov74_0222E898
	cmp r0, #0
	beq _0222E704
	movs r0, #0x93
	bl FUN_02037B38
	cmp r0, #1
	bne _0222E79C
_0222E704:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_020398D4
	bl ov74_02236128
	ldr r1, _0222E7CC @ =0x00002BD0
	movs r3, #0xa
	adds r0, r4, #0
	adds r1, r4, r1
	movs r2, #0x12
	lsls r3, r3, #6
	bl ov74_0222D9E0
	ldr r0, _0222E7DC @ =0x00003D50
	ldr r0, [r4, r0]
	bl FUN_0200F450
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x1a
	bl ov74_0222EB28
	b _0222E79C
_0222E734:
	ldr r0, _0222E7E0 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _0222E79C
	movs r0, #0x14
	str r0, [r5]
	b _0222E79C
_0222E744:
	ldr r0, _0222E7E0 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _0222E79C
	ldr r0, _0222E7CC @ =0x00002BD0
	movs r1, #0
	adds r0, r4, r0
	bl ov74_0222D104
	ldr r0, _0222E7CC @ =0x00002BD0
	adds r0, r4, r0
	bl FUN_0201D8C8
	ldr r0, _0222E7CC @ =0x00002BD0
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #3
	str r0, [r5]
	b _0222E79C
_0222E76E:
	movs r1, #0
	movs r2, #0x1d
	adds r3, r5, #0
	bl ov74_0222D7F0
	b _0222E79C
_0222E77A:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0222E79C
	movs r0, #0xb1
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	str r0, [r5]
	b _0222E79C
_0222E78C:
	bl ov74_0222D024
	adds r0, r4, #0
	bl ov74_0222DEF0
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_0222E79C:
	ldr r0, _0222E7E4 @ =0x00002C44
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222E7A8
	bl FUN_0202457C
_0222E7A8:
	bl ov74_022358BC
	ldr r0, _0222E7E8 @ =0x00003D48
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0222E7B8
	adds r0, r4, #0
	blx r1
_0222E7B8:
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0222E7C0: .4byte 0x00002B08
_0222E7C4: .4byte 0x00002C30
_0222E7C8: .4byte 0x00002AF8
_0222E7CC: .4byte 0x00002BD0
_0222E7D0: .4byte 0x00002BE0
_0222E7D4: .4byte 0x00002C34
_0222E7D8: .4byte 0x00002DD8
_0222E7DC: .4byte 0x00003D50
_0222E7E0: .4byte 0x021D110C
_0222E7E4: .4byte 0x00002C44
_0222E7E8: .4byte 0x00003D48
	thumb_func_end ov74_0222E1F4

	thumb_func_start ov74_0222E7EC
ov74_0222E7EC: @ 0x0222E7EC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xaf
	lsls r0, r0, #6
	ldr r1, [r5, r0]
	movs r2, #0xd6
	lsls r1, r1, #2
	adds r1, r5, r1
	subs r0, #0xc
	ldr r4, [r1, r0]
	adds r0, r5, #0
	adds r0, #0xe0
	adds r1, r4, #0
	lsls r2, r2, #2
	blx FUN_020E5AD8
	movs r1, #0x41
	adds r0, r5, #0
	lsls r1, r1, #2
	adds r0, #0x90
	adds r1, r4, r1
	movs r2, #0x50
	blx FUN_020E5AD8
	ldr r0, _0222E854 @ =0x00000428
	movs r1, #0
	strb r1, [r5, r0]
	adds r0, r5, #0
	adds r0, #0xde
	ldrb r1, [r0]
	movs r0, #0x10
	movs r2, #0xf
	bics r1, r0
	adds r0, r5, #0
	adds r0, #0xde
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xde
	ldrb r1, [r0]
	movs r0, #0x20
	orrs r1, r0
	adds r0, r5, #0
	adds r0, #0xde
	strb r1, [r0]
	ldr r1, _0222E858 @ =0x00002BA4
	adds r0, r5, #4
	ldr r1, [r5, r1]
	bl ov74_02229CE0
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222E854: .4byte 0x00000428
_0222E858: .4byte 0x00002BA4
	thumb_func_end ov74_0222E7EC

	thumb_func_start ov74_0222E85C
ov74_0222E85C: @ 0x0222E85C
	push {r3, r4}
	ldr r3, [r0]
	ldr r1, [r0, #4]
	adds r2, r0, #0
	movs r4, #0
	cmp r1, r3
	bge _0222E870
	adds r3, r1, #0
	movs r4, #1
	adds r2, r0, #4
_0222E870:
	ldr r1, [r0, #8]
	cmp r1, r3
	bge _0222E87E
	adds r2, r0, #0
	adds r3, r1, #0
	movs r4, #2
	adds r2, #8
_0222E87E:
	ldr r1, [r0, #0xc]
	cmp r1, r3
	bge _0222E88A
	adds r2, r0, #0
	movs r4, #3
	adds r2, #0xc
_0222E88A:
	ldr r0, _0222E894 @ =0x3FFF0001
	str r0, [r2]
	adds r0, r4, #1
	pop {r3, r4}
	bx lr
	.align 2, 0
_0222E894: .4byte 0x3FFF0001
	thumb_func_end ov74_0222E85C

	thumb_func_start ov74_0222E898
ov74_0222E898: @ 0x0222E898
	push {r3, r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0222E89E:
	adds r0, r4, #0
	bl FUN_02034818
	cmp r0, #0
	beq _0222E8AA
	adds r5, r5, #1
_0222E8AA:
	adds r4, r4, #1
	cmp r4, #5
	blt _0222E89E
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_0222E898

	thumb_func_start ov74_0222E8B4
ov74_0222E8B4: @ 0x0222E8B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r5, r0, #0
	movs r6, #0
	movs r0, #1
	str r1, [sp, #0x10]
	adds r7, r6, #0
	str r0, [sp, #0x24]
	adds r4, r5, #4
_0222E8C6:
	ldr r0, [sp, #0x24]
	bl FUN_02034818
	cmp r0, #0
	bne _0222E8E8
	ldr r0, _0222EA70 @ =0x00002C08
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222E8DA
	adds r7, r7, #1
_0222E8DA:
	ldr r0, _0222EA70 @ =0x00002C08
	movs r1, #0
	str r1, [r4, r0]
	ldr r1, _0222EA74 @ =0x3FFF0001
	adds r0, #0x14
	str r1, [r4, r0]
	b _0222E910
_0222E8E8:
	ldr r1, _0222EA70 @ =0x00002C08
	ldr r1, [r4, r1]
	cmp r1, r0
	beq _0222E90E
	ldr r1, _0222EA70 @ =0x00002C08
	adds r7, r7, #1
	str r0, [r4, r1]
	adds r0, r1, #0
	adds r1, #0x34
	ldr r1, [r5, r1]
	adds r0, #0x34
	adds r2, r1, #1
	ldr r0, [r5, r0]
	ldr r1, _0222EA78 @ =0x00002C3C
	adds r6, r6, #1
	str r2, [r5, r1]
	subs r1, #0x20
	str r0, [r4, r1]
	b _0222E910
_0222E90E:
	adds r6, r6, #1
_0222E910:
	ldr r0, [sp, #0x24]
	adds r4, r4, #4
	adds r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #5
	blt _0222E8C6
	cmp r7, #0
	bne _0222E926
	add sp, #0x48
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E926:
	ldr r1, _0222EA7C @ =0x00002C20
	ldr r0, [r5, r1]
	str r0, [sp, #0x38]
	adds r0, r1, #4
	ldr r0, [r5, r0]
	str r0, [sp, #0x3c]
	adds r0, r1, #0
	adds r0, #8
	ldr r0, [r5, r0]
	adds r1, #0xc
	str r0, [sp, #0x40]
	ldr r0, [r5, r1]
	str r0, [sp, #0x44]
	add r0, sp, #0x38
	bl ov74_0222E85C
	str r0, [sp, #0x28]
	add r0, sp, #0x38
	bl ov74_0222E85C
	str r0, [sp, #0x2c]
	add r0, sp, #0x38
	bl ov74_0222E85C
	str r0, [sp, #0x30]
	add r0, sp, #0x38
	bl ov74_0222E85C
	str r0, [sp, #0x34]
	movs r0, #0x55
	bl FUN_0200BD08
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xf7
	movs r3, #0x55
	bl FUN_0200BAF8
	str r0, [sp, #0x1c]
	movs r5, #0
	ldr r0, [sp, #0x10]
	adds r1, r5, #0
	bl FUN_0201D978
	adds r0, r5, #0
	str r0, [sp, #0x14]
	cmp r6, #0
	ble _0222EA54
	add r0, sp, #0x28
	str r0, [sp, #0x18]
_0222E98C:
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	bl FUN_02034818
	adds r7, r0, #0
	beq _0222EA44
	adds r0, r4, #0
	movs r1, #0
	adds r2, r7, #0
	bl FUN_0200BE48
	ldr r1, [sp, #0x1c]
	adds r0, r4, #0
	movs r2, #0x36
	movs r3, #0x55
	bl FUN_0200BC4C
	str r0, [sp, #0x20]
	adds r0, r7, #0
	bl FUN_02028F94
	cmp r0, #0
	str r5, [sp]
	bne _0222E9D6
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EA80 @ =0x00050600
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x20]
	adds r3, r1, #0
	bl FUN_020200FC
	b _0222E9F0
_0222E9D6:
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0xc1
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r1, #0
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x20]
	adds r3, r1, #0
	bl FUN_020200FC
_0222E9F0:
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02028F84
	adds r2, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	lsls r2, r2, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	lsrs r2, r2, #0x10
	movs r3, #5
	bl FUN_0200BFCC
	ldr r1, [sp, #0x1c]
	adds r0, r4, #0
	movs r2, #0x37
	movs r3, #0x55
	bl FUN_0200BC4C
	adds r7, r0, #0
	str r5, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EA84 @ =0x000E0F00
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r2, r7, #0
	movs r3, #0x50
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	adds r5, #0x18
_0222EA44:
	ldr r0, [sp, #0x18]
	adds r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, r6
	blt _0222E98C
_0222EA54:
	cmp r6, #0
	beq _0222EA5E
	ldr r0, [sp, #0x10]
	bl FUN_0201D578
_0222EA5E:
	ldr r0, [sp, #0x1c]
	bl FUN_0200BB44
	adds r0, r4, #0
	bl FUN_0200BDA0
	adds r0, r6, #0
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222EA70: .4byte 0x00002C08
_0222EA74: .4byte 0x3FFF0001
_0222EA78: .4byte 0x00002C3C
_0222EA7C: .4byte 0x00002C20
_0222EA80: .4byte 0x00050600
_0222EA84: .4byte 0x000E0F00
	thumb_func_end ov74_0222E8B4

	thumb_func_start ov74_0222EA88
ov74_0222EA88: @ 0x0222EA88
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0222EB1C @ =0x00002BF4
	adds r4, r1, #0
	str r2, [r5, r0]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xf7
	movs r3, #0x55
	bl FUN_0200BAF8
	ldr r1, _0222EB20 @ =0x00002A04
	str r0, [r5, r1]
	movs r0, #0x55
	bl FUN_0200BD08
	movs r1, #0x2a
	lsls r1, r1, #8
	str r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	movs r3, #1
	str r3, [sp]
	movs r0, #0x2a
	ldr r2, _0222EB1C @ =0x00002BF4
	str r3, [sp, #4]
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	movs r1, #0
	bl FUN_0200BFCC
	movs r1, #0x2a
	lsls r1, r1, #8
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x39
	movs r3, #0x55
	bl FUN_0200BC4C
	adds r6, r0, #0
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EB24 @ =0x00010200
	movs r1, #1
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r2, r6, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_0201D578
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0222EB20 @ =0x00002A04
	ldr r0, [r5, r0]
	bl FUN_0200BB44
	movs r0, #0x2a
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	bl FUN_0200BDA0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222EB1C: .4byte 0x00002BF4
_0222EB20: .4byte 0x00002A04
_0222EB24: .4byte 0x00010200
	thumb_func_end ov74_0222EA88

	thumb_func_start ov74_0222EB28
ov74_0222EB28: @ 0x0222EB28
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov74_02229DF8
	bl FUN_0203A914
	movs r0, #0xb1
	lsls r0, r0, #6
	str r6, [r5, r0]
	movs r0, #0x17
	str r0, [r4]
	pop {r4, r5, r6, pc}
	thumb_func_end ov74_0222EB28

	thumb_func_start ov74_0222EB44
ov74_0222EB44: @ 0x0222EB44
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl FUN_02007290
	adds r7, r0, #0
	ldr r0, _0222EBF0 @ =0x00002A08
	movs r6, #0
	adds r4, r7, #0
	adds r5, r7, r0
_0222EB56:
	ldr r0, _0222EBF0 @ =0x00002A08
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222EB6A
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
_0222EB6A:
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, #0x10
	cmp r6, #0x13
	blo _0222EB56
	ldr r0, _0222EBF4 @ =0x00002BD0
	ldr r1, [r7, r0]
	cmp r1, #0
	beq _0222EB8A
	adds r0, r7, r0
	bl FUN_0201D8C8
	ldr r0, _0222EBF4 @ =0x00002BD0
	adds r0, r7, r0
	bl FUN_0201D520
_0222EB8A:
	ldr r0, _0222EBF8 @ =0x00002BE0
	ldr r1, [r7, r0]
	cmp r1, #0
	beq _0222EBA0
	adds r0, r7, r0
	bl FUN_0201D8C8
	ldr r0, _0222EBF8 @ =0x00002BE0
	adds r0, r7, r0
	bl FUN_0201D520
_0222EBA0:
	ldr r0, _0222EBFC @ =0x000029FC
	movs r1, #0
	ldr r0, [r7, r0]
	bl FUN_0201BB4C
	ldr r0, _0222EBFC @ =0x000029FC
	movs r1, #1
	ldr r0, [r7, r0]
	bl FUN_0201BB4C
	ldr r0, _0222EBFC @ =0x000029FC
	movs r1, #2
	ldr r0, [r7, r0]
	bl FUN_0201BB4C
	ldr r0, _0222EBFC @ =0x000029FC
	movs r1, #3
	ldr r0, [r7, r0]
	bl FUN_0201BB4C
	ldr r0, _0222EBFC @ =0x000029FC
	ldr r0, [r7, r0]
	bl FUN_0201AB0C
	ldr r0, _0222EC00 @ =0x0000004A
	ldr r1, _0222EC04 @ =0x0223B380
	bl FUN_02000EF4
	movs r0, #0x59
	bl FUN_0201A9C4
	ldr r0, [sp]
	bl FUN_02007294
	movs r0, #0x55
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EBF0: .4byte 0x00002A08
_0222EBF4: .4byte 0x00002BD0
_0222EBF8: .4byte 0x00002BE0
_0222EBFC: .4byte 0x000029FC
_0222EC00: .4byte 0x0000004A
_0222EC04: .4byte 0x0223B380
	thumb_func_end ov74_0222EB44

	thumb_func_start ov74_0222EC08
ov74_0222EC08: @ 0x0222EC08
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	bl ov74_0222FCC4
	ldr r1, _0222EC54 @ =0x00003D54
	adds r0, r5, #0
	bl FUN_0201AACC
	ldr r2, _0222EC54 @ =0x00003D54
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r0, _0222EC58 @ =0x000029FC
	movs r1, #0x1e
	str r6, [r4, r0]
	movs r0, #0
	lsls r1, r1, #4
	adds r2, r5, #0
	str r5, [r4]
	bl FUN_02003030
	ldr r0, _0222EC5C @ =0x00002BB4
	movs r2, #0
	str r7, [r4, r0]
	adds r0, #0xc
	str r2, [r4, r0]
	adds r0, r4, #0
	movs r1, #1
	bl ov74_0222D824
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EC54: .4byte 0x00003D54
_0222EC58: .4byte 0x000029FC
_0222EC5C: .4byte 0x00002BB4
	thumb_func_end ov74_0222EC08

	thumb_func_start ov74_0222EC60
ov74_0222EC60: @ 0x0222EC60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222ECC8 @ =0x00002D7C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222EC70
	bl FUN_02024758
_0222EC70:
	movs r0, #0xb6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222EC7E
	bl FUN_02024758
_0222EC7E:
	movs r0, #0xb6
	movs r1, #0
	lsls r0, r0, #6
	str r1, [r4, r0]
	ldr r2, [r4, r0]
	subs r1, r0, #4
	str r2, [r4, r1]
	adds r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222EC98
	bl FUN_02024758
_0222EC98:
	ldr r0, _0222ECCC @ =0x00002D88
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222ECA4
	bl FUN_02024758
_0222ECA4:
	ldr r0, _0222ECD0 @ =0x00002D8C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222ECB0
	bl FUN_02024758
_0222ECB0:
	ldr r1, _0222ECD0 @ =0x00002D8C
	movs r0, #0
	str r0, [r4, r1]
	ldr r2, [r4, r1]
	subs r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	subs r1, #8
	str r0, [r4, r1]
	bl ov74_022359BC
	pop {r4, pc}
	.align 2, 0
_0222ECC8: .4byte 0x00002D7C
_0222ECCC: .4byte 0x00002D88
_0222ECD0: .4byte 0x00002D8C
	thumb_func_end ov74_0222EC60

	thumb_func_start ov74_0222ECD4
ov74_0222ECD4: @ 0x0222ECD4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0201D3F0
	cmp r0, #1
	bne _0222ECEA
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0200E5D4
_0222ECEA:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_0222ECD4

	thumb_func_start ov74_0222ECEC
ov74_0222ECEC: @ 0x0222ECEC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0201D3F0
	cmp r0, #1
	bne _0222ED02
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0200E9BC
_0222ED02:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_0222ECEC

	thumb_func_start ov74_0222ED04
ov74_0222ED04: @ 0x0222ED04
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	movs r0, #0xaf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r4, r1, #0
	adds r7, r2, #0
	str r3, [sp]
	cmp r0, #0
	beq _0222ED1E
	bl FUN_02014950
_0222ED1E:
	ldr r0, _0222EDB4 @ =0x00002BBC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222ED2E
	movs r1, #0
	adds r2, r1, #0
	bl FUN_02001434
_0222ED2E:
	adds r0, r7, #0
	movs r1, #0x55
	bl FUN_02014918
	movs r1, #0xaf
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xf7
	movs r3, #0x55
	bl FUN_0200BAF8
	ldr r1, _0222EDB8 @ =0x00002A04
	movs r6, #0
	str r0, [r5, r1]
	cmp r7, #0
	ble _0222ED6C
_0222ED52:
	movs r0, #0xaf
	ldr r1, _0222EDB8 @ =0x00002A04
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	bl FUN_02014960
	adds r6, r6, #1
	adds r4, #8
	cmp r6, r7
	blt _0222ED52
_0222ED6C:
	ldr r0, _0222EDB8 @ =0x00002A04
	ldr r0, [r5, r0]
	bl FUN_0200BB44
	ldr r4, _0222EDBC @ =0x0223C6E0
	add r3, sp, #4
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	movs r0, #0xaf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0
	str r0, [sp, #4]
	add r0, sp, #4
	strh r7, [r0, #0x10]
	ldr r0, [sp]
	movs r3, #0x55
	str r0, [sp, #0x10]
	adds r0, r2, #0
	ldr r2, [sp, #0x38]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl FUN_020011DC
	ldr r1, _0222EDB4 @ =0x00002BBC
	str r0, [r5, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0222EDB4: .4byte 0x00002BBC
_0222EDB8: .4byte 0x00002A04
_0222EDBC: .4byte 0x0223C6E0
	thumb_func_end ov74_0222ED04

	thumb_func_start ov74_0222EDC0
ov74_0222EDC0: @ 0x0222EDC0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xaf
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_02014950
	movs r0, #0xaf
	movs r1, #0
	lsls r0, r0, #6
	str r1, [r4, r0]
	subs r0, r0, #4
	ldr r0, [r4, r0]
	adds r2, r1, #0
	bl FUN_02001434
	ldr r0, _0222EE00 @ =0x00002BBC
	movs r1, #0
	str r1, [r4, r0]
	adds r0, #0x18
	adds r0, r4, r0
	bl ov74_0222ECD4
	ldr r0, _0222EE04 @ =0x00002BD4
	adds r0, r4, r0
	bl FUN_0201D8C8
	ldr r0, _0222EE04 @ =0x00002BD4
	adds r0, r4, r0
	bl FUN_0201D520
	pop {r4, pc}
	.align 2, 0
_0222EE00: .4byte 0x00002BBC
_0222EE04: .4byte 0x00002BD4
	thumb_func_end ov74_0222EDC0

	thumb_func_start ov74_0222EE08
ov74_0222EE08: @ 0x0222EE08
	movs r0, #1
	bx lr
	thumb_func_end ov74_0222EE08

	thumb_func_start ov74_0222EE0C
ov74_0222EE0C: @ 0x0222EE0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, [r5]
	movs r0, #0x25
	adds r4, r2, #0
	bl FUN_02026354
	ldr r1, _0222EE54 @ =0x00002BB4
	adds r6, r0, #0
	ldr r2, [r5, r1]
	movs r1, #0x41
	lsls r1, r1, #2
	adds r1, r2, r1
	movs r2, #0x24
	bl FUN_02026A04
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r4, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	adds r2, r6, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EE54: .4byte 0x00002BB4
	thumb_func_end ov74_0222EE0C

	thumb_func_start ov74_0222EE58
ov74_0222EE58: @ 0x0222EE58
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r3, r0, #0
	ldr r0, _0222EEAC @ =0x00002BB4
	adds r6, r1, #0
	ldr r1, [r3, r0]
	movs r0, #0x35
	lsls r0, r0, #4
	ldrb r0, [r1, r0]
	adds r5, r2, #0
	cmp r0, #0
	bne _0222EE74
	movs r2, #0x51
	b _0222EE76
_0222EE74:
	movs r2, #0x52
_0222EE76:
	movs r1, #0x2a
	lsls r1, r1, #8
	ldr r0, [r3, r1]
	adds r1, r1, #4
	ldr r1, [r3, r1]
	ldr r3, [r3]
	bl FUN_0200BC4C
	adds r4, r0, #0
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r5, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	adds r2, r4, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0222EEAC: .4byte 0x00002BB4
	thumb_func_end ov74_0222EE58

	thumb_func_start ov74_0222EEB0
ov74_0222EEB0: @ 0x0222EEB0
	push {r4, lr}
	sub sp, #0x18
	ldr r1, _0222EF14 @ =0x00002BB4
	adds r4, r0, #0
	ldr r2, [r4, r1]
	movs r1, #0xd5
	lsls r1, r1, #2
	ldr r1, [r2, r1]
	add r0, sp, #8
	blx FUN_020DC394
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x2a
	lsls r0, r0, #8
	movs r2, #0x7d
	ldr r3, [sp, #8]
	lsls r2, r2, #4
	adds r2, r3, r2
	ldr r0, [r4, r0]
	movs r1, #0
	movs r3, #4
	bl FUN_0200BFCC
	movs r3, #2
	movs r0, #0x2a
	str r3, [sp]
	movs r1, #1
	str r1, [sp, #4]
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	ldr r2, [sp, #0xc]
	bl FUN_0200BFCC
	movs r1, #2
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x2a
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	ldr r2, [sp, #0x10]
	adds r3, r1, #0
	bl FUN_0200BFCC
	movs r0, #1
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
_0222EF14: .4byte 0x00002BB4
	thumb_func_end ov74_0222EEB0

	thumb_func_start ov74_0222EF18
ov74_0222EF18: @ 0x0222EF18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r7, r1, #0
	movs r0, #0xfb
	movs r1, #0x55
	adds r4, r2, #0
	bl FUN_02026354
	ldr r1, _0222EF60 @ =0x00002BB4
	adds r6, r0, #0
	ldr r2, [r5, r1]
	movs r1, #0x55
	lsls r1, r1, #2
	adds r1, r2, r1
	movs r2, #0xfa
	bl FUN_02026A04
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r4, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	adds r2, r6, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EF60: .4byte 0x00002BB4
	thumb_func_end ov74_0222EF18

	thumb_func_start ov74_0222EF64
ov74_0222EF64: @ 0x0222EF64
	movs r0, #0
	bx lr
	thumb_func_end ov74_0222EF64

	thumb_func_start ov74_0222EF68
ov74_0222EF68: @ 0x0222EF68
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	adds r5, r0, #0
	ldr r0, _0222EFE0 @ =0x0223C6D0
	adds r6, r1, #0
	ldr r1, [r0, #4]
	ldr r2, [r0]
	str r1, [sp, #0x18]
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	str r2, [sp, #0x14]
	str r0, [sp, #0x20]
	ldr r0, _0222EFE4 @ =0x00002B9C
	str r1, [sp, #0x1c]
	ldr r4, [r5, r0]
	adds r0, r6, #0
	bl FUN_0201D8C8
	adds r0, r6, #0
	bl FUN_0201D520
	ldr r0, [r4, #8]
	adds r1, r6, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #0xc]
	movs r2, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	ldr r0, _0222EFE8 @ =0x00002B98
	ldr r0, [r5, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, _0222EFEC @ =0x000029FC
	ldr r3, [r4, #4]
	ldr r0, [r5, r0]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	add r1, sp, #0x14
	movs r2, #2
	adds r3, r6, #0
	bl ov74_0222ED04
	movs r0, #1
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222EFE0: .4byte 0x0223C6D0
_0222EFE4: .4byte 0x00002B9C
_0222EFE8: .4byte 0x00002B98
_0222EFEC: .4byte 0x000029FC
	thumb_func_end ov74_0222EF68

	thumb_func_start ov74_0222EFF0
ov74_0222EFF0: @ 0x0222EFF0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x55
	str r0, [sp, #8]
	adds r6, r2, #0
	movs r0, #0
	adds r4, r3, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	cmp r4, #0
	beq _0222F018
	movs r0, #0x1c
	str r0, [r4]
_0222F018:
	ldr r0, _0222F020 @ =0x00002BF8
	str r6, [r5, r0]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222F020: .4byte 0x00002BF8
	thumb_func_end ov74_0222EFF0

	thumb_func_start ov74_0222F024
ov74_0222F024: @ 0x0222F024
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	ldr r3, [r5]
	str r2, [sp, #0x14]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xf7
	ldr r4, _0222F1A4 @ =0x0223C700
	bl FUN_0200BAF8
	ldr r1, _0222F1A8 @ =0x00002A04
	str r0, [r5, r1]
	ldr r0, [r5]
	bl FUN_0200BD08
	movs r1, #0x2a
	lsls r1, r1, #8
	str r0, [r5, r1]
	ldr r1, _0222F1AC @ =0x00002BB8
	ldr r0, [sp, #0x14]
	str r0, [r5, r1]
	ldr r1, [sp, #0x14]
	adds r0, r5, #0
	bl ov74_0222F314
	movs r0, #0
	str r0, [sp, #0x2c]
	ldr r0, _0222F1B0 @ =0x00002A08
	adds r7, r4, #0
	str r5, [sp, #0x1c]
	adds r6, r5, r0
_0222F064:
	ldr r1, [r7]
	ldr r0, [sp, #0x14]
	cmp r0, r1
	beq _0222F086
	cmp r1, #2
	beq _0222F086
	ldr r1, [sp, #0x1c]
	ldr r0, _0222F1B0 @ =0x00002A08
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0222F086
	adds r0, r6, #0
	bl FUN_0201D8C8
	adds r0, r6, #0
	bl FUN_0201D520
_0222F086:
	ldr r0, [sp, #0x1c]
	adds r7, #0x30
	adds r0, #0x10
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x2c]
	adds r6, #0x10
	adds r0, r0, #1
	str r0, [sp, #0x2c]
	cmp r0, #0xb
	blo _0222F064
	movs r0, #0
	str r0, [sp, #0x18]
	ldr r0, _0222F1B0 @ =0x00002A08
	movs r7, #0x31
	str r5, [sp, #0x24]
	str r5, [sp, #0x20]
	adds r6, r5, r0
_0222F0A8:
	ldr r1, [r4]
	ldr r0, [sp, #0x14]
	cmp r0, r1
	bne _0222F166
	ldr r1, [sp, #0x24]
	ldr r0, _0222F1B0 @ =0x00002A08
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0222F0F4
	ldr r1, [sp, #0x20]
	ldr r0, _0222F1B4 @ =0x00002B48
	movs r2, #0
	str r7, [r1, r0]
	ldr r0, [r4, #8]
	adds r1, r6, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, _0222F1B8 @ =0x000029FC
	ldr r3, [r4, #4]
	ldr r0, [r5, r0]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
_0222F0F4:
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x1c]
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl FUN_02002FAC
	adds r1, r0, #0
	adds r0, r6, #0
	bl FUN_0201D978
	ldr r0, [r4, #0x18]
	ldr r3, [r4, #0x24]
	str r0, [sp, #0x28]
	ldr r2, [sp, #0x28]
	adds r0, r5, #0
	adds r1, r6, #0
	blx r3
	cmp r0, #1
	bne _0222F158
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _0222F158
	movs r0, #0x2a
	ldr r1, _0222F1A8 @ =0x00002A04
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r3, [r5]
	bl FUN_0200BC4C
	str r0, [sp, #0x30]
	ldr r0, [r4, #0x2c]
	ldr r2, [sp, #0x30]
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [r4, #0x14]
	ldr r3, [r4, #0x28]
	adds r0, r6, #0
	bl FUN_020200FC
	ldr r0, [sp, #0x30]
	bl FUN_02026380
_0222F158:
	adds r0, r6, #0
	bl FUN_0201D578
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	muls r0, r1, r0
	adds r7, r7, r0
_0222F166:
	ldr r0, [sp, #0x24]
	adds r4, #0x30
	adds r0, #0x10
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	adds r6, #0x10
	adds r0, r0, #4
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #0xb
	blo _0222F0A8
	ldr r0, _0222F1A8 @ =0x00002A04
	ldr r0, [r5, r0]
	bl FUN_0200BB44
	movs r0, #0x2a
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	bl FUN_0200BDA0
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0222F19E
	adds r0, r5, #0
	bl ov74_0222F478
_0222F19E:
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0222F1A4: .4byte 0x0223C700
_0222F1A8: .4byte 0x00002A04
_0222F1AC: .4byte 0x00002BB8
_0222F1B0: .4byte 0x00002A08
_0222F1B4: .4byte 0x00002B48
_0222F1B8: .4byte 0x000029FC
	thumb_func_end ov74_0222F024

	thumb_func_start ov74_0222F1BC
ov74_0222F1BC: @ 0x0222F1BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r7, r3, #0
	movs r3, #0x30
	ldr r0, _0222F2BC @ =0x0223C700
	muls r3, r2, r3
	adds r6, r1, #0
	adds r4, r0, r3
	ldr r0, [r6]
	cmp r0, #0
	bne _0222F206
	ldr r0, [r4, #8]
	movs r2, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, _0222F2C0 @ =0x000029FC
	ldr r3, [r4, #4]
	ldr r0, [r5, r0]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
_0222F206:
	ldr r1, [r4, #0x1c]
	adds r0, r6, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201D978
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0222F234
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xf7
	movs r3, #0x55
	bl FUN_0200BAF8
	ldr r1, _0222F2C4 @ =0x00002A04
	str r0, [r5, r1]
	movs r0, #0x55
	bl FUN_0200BD08
	movs r1, #0x2a
	lsls r1, r1, #8
	str r0, [r5, r1]
_0222F234:
	ldr r0, _0222F2C8 @ =0x00002B98
	ldr r2, _0222F2CC @ =0x00010200
	str r7, [r5, r0]
	adds r0, r0, #4
	str r4, [r5, r0]
	ldr r3, [r4, #0x24]
	adds r0, r5, #0
	adds r1, r6, #0
	blx r3
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _0222F28E
	movs r1, #0x2a
	lsls r1, r1, #8
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r3, #0x55
	bl FUN_0200BC4C
	str r0, [sp, #0x14]
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	ldr r2, [sp, #0x14]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r1, [r4, #0x14]
	adds r0, r6, #0
	bl FUN_020200FC
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	ldr r0, _0222F2C4 @ =0x00002A04
	ldr r0, [r5, r0]
	bl FUN_0200BB44
	movs r0, #0x2a
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	bl FUN_0200BDA0
_0222F28E:
	ldr r0, _0222F2D0 @ =0x00002BC4
	adds r0, r5, r0
	cmp r6, r0
	bne _0222F2A4
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x13
	movs r3, #0xa
	bl FUN_0200E998
	b _0222F2B0
_0222F2A4:
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0xe
	bl FUN_0200E580
_0222F2B0:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	muls r0, r1, r0
	adds r0, r7, r0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222F2BC: .4byte 0x0223C700
_0222F2C0: .4byte 0x000029FC
_0222F2C4: .4byte 0x00002A04
_0222F2C8: .4byte 0x00002B98
_0222F2CC: .4byte 0x00010200
_0222F2D0: .4byte 0x00002BC4
	thumb_func_end ov74_0222F1BC

	thumb_func_start ov74_0222F2D4
ov74_0222F2D4: @ 0x0222F2D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r2, #0
	movs r2, #1
	adds r5, r0, #0
	str r2, [sp]
	adds r6, r3, #0
	ldr r3, [r5]
	movs r0, #0x71
	bl FUN_02007A44
	add r1, sp, #4
	adds r7, r0, #0
	blx FUN_020B71D8
	ldr r0, _0222F310 @ =0x000029FC
	ldr r2, [sp, #4]
	lsls r1, r4, #0x18
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	adds r2, #0xc
	adds r3, r6, #0
	bl FUN_0201C0A8
	adds r0, r7, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F310: .4byte 0x000029FC
	thumb_func_end ov74_0222F2D4

	thumb_func_start ov74_0222F314
ov74_0222F314: @ 0x0222F314
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #1
	lsls r0, r0, #8
	str r0, [sp]
	ldr r0, [r5]
	movs r2, #0
	adds r4, r1, #0
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #7
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222F400 @ =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	movs r0, #0x71
	movs r1, #0xa
	bl FUN_020078F0
	cmp r4, #0
	beq _0222F35A
	cmp r4, #1
	beq _0222F37A
	b _0222F398
_0222F35A:
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222F400 @ =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	movs r0, #0x71
	movs r1, #8
	bl FUN_02007914
	b _0222F398
_0222F37A:
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222F400 @ =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	movs r0, #0x71
	movs r1, #9
	bl FUN_02007914
_0222F398:
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r5]
	movs r1, #0
	str r0, [sp, #4]
	movs r0, #0x71
	adds r3, r0, #0
	adds r2, r1, #0
	adds r3, #0xef
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222F400 @ =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	movs r0, #0x71
	movs r3, #3
	bl FUN_020078F0
	movs r2, #3
	adds r0, r5, #0
	movs r1, #2
	lsls r3, r2, #9
	bl ov74_0222F2D4
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	ldr r0, _0222F400 @ =0x000029FC
	movs r2, #0
	ldr r0, [r5, r0]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201CA4C
	ldr r0, _0222F400 @ =0x000029FC
	movs r1, #3
	ldr r0, [r5, r0]
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222F400: .4byte 0x000029FC
	thumb_func_end ov74_0222F314

	thumb_func_start ov74_0222F404
ov74_0222F404: @ 0x0222F404
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl FUN_02007290
	ldr r1, _0222F46C @ =0x00002BBC
	ldr r0, [r0, r1]
	bl FUN_02001338
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _0222F42A
	adds r0, r0, #1
	cmp r4, r0
	beq _0222F468
	b _0222F444
_0222F42A:
	ldr r0, _0222F470 @ =0x000005DC
	bl FUN_0200604C
	cmp r6, #0
	beq _0222F468
	adds r0, r7, #0
	blx r6
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222F468
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222F444:
	ldr r0, _0222F470 @ =0x000005DC
	bl FUN_0200604C
	cmp r4, #0
	beq _0222F468
	cmp r4, #0x1f
	bhs _0222F456
	str r4, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222F456:
	ldr r0, _0222F474 @ =0x0223D0C0
	str r4, [r0]
	adds r0, r7, #0
	blx r4
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222F468
	str r0, [r5]
_0222F468:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F46C: .4byte 0x00002BBC
_0222F470: .4byte 0x000005DC
_0222F474: .4byte 0x0223D0C0
	thumb_func_end ov74_0222F404

	thumb_func_start ov74_0222F478
ov74_0222F478: @ 0x0222F478
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r1, _0222F58C @ =0x00002D84
	adds r7, r0, #0
	ldr r0, [r7, r1]
	cmp r0, #0
	bne _0222F4D8
	adds r0, r1, #4
	ldr r0, [r7, r0]
	cmp r0, #0
	bne _0222F4D8
	adds r1, #8
	ldr r0, [r7, r1]
	cmp r0, #0
	bne _0222F4D8
	bl ov74_0223567C
	cmp r0, #1
	bne _0222F4A4
	adds r0, r7, #0
	bl ov74_0222EC60
_0222F4A4:
	bl ov74_0223563C
	bl ov74_02235690
	movs r0, #0x1c
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0x1e
	movs r2, #0x1b
	movs r3, #0x1d
	bl ov74_02235728
	bl FUN_02074490
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, [r7]
	movs r2, #1
	str r0, [sp, #4]
	movs r0, #0x14
	movs r3, #0x60
	bl FUN_02007938
_0222F4D8:
	movs r0, #0xb2
	movs r4, #0
	str r0, [sp, #0x10]
	str r4, [sp, #0xc]
	adds r5, r7, #0
	movs r6, #0x64
_0222F4E4:
	ldr r0, _0222F590 @ =0x00002BB4
	ldr r0, [r7, r0]
	adds r1, r0, r4
	ldr r0, _0222F594 @ =0x0000034A
	ldrh r0, [r1, r0]
	str r0, [sp, #8]
	cmp r0, #0
	bne _0222F504
	ldr r0, _0222F58C @ =0x00002D84
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222F56E
	movs r1, #0
	bl FUN_02024830
	b _0222F56E
_0222F504:
	ldr r0, [sp, #0xc]
	ldr r1, _0222F58C @ =0x00002D84
	adds r0, #0xa
	str r0, [sp]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x10]
	movs r0, #0
	movs r3, #0x10
	bl ov74_02235930
	ldr r1, _0222F58C @ =0x00002D84
	str r0, [r5, r1]
	movs r1, #0
	ldr r0, [sp, #8]
	adds r2, r1, #0
	bl FUN_020741BC
	adds r1, r0, #0
	ldr r0, [r7]
	movs r2, #0
	str r0, [sp]
	movs r0, #0x14
	add r3, sp, #0x18
	bl FUN_020079BC
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r1, #2
	ldr r0, [r0, #0x14]
	lsls r1, r1, #8
	blx FUN_020D2894
	ldr r0, [sp, #0x18]
	movs r2, #2
	ldr r0, [r0, #0x14]
	lsls r1, r6, #5
	lsls r2, r2, #8
	blx FUN_020CFE74
	movs r1, #0
	ldr r0, [sp, #8]
	adds r2, r1, #0
	bl FUN_02074364
	adds r1, r0, #0
	ldr r0, _0222F58C @ =0x00002D84
	adds r1, r1, #3
	ldr r0, [r5, r0]
	bl FUN_02024A14
	ldr r0, [sp, #0x14]
	bl FUN_0201AB0C
_0222F56E:
	ldr r0, [sp, #0xc]
	adds r4, r4, #2
	adds r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r5, r5, #4
	adds r0, #0x19
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	adds r6, #0x10
	cmp r0, #3
	blt _0222F4E4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0222F58C: .4byte 0x00002D84
_0222F590: .4byte 0x00002BB4
_0222F594: .4byte 0x0000034A
	thumb_func_end ov74_0222F478

	thumb_func_start ov74_0222F598
ov74_0222F598: @ 0x0222F598
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0x55
	lsls r2, r0, #0x10
	bl FUN_0201A910
	ldr r1, _0222F5F4 @ =0x00003D0C
	adds r0, r4, #0
	movs r2, #0x55
	bl FUN_02007280
	ldr r2, _0222F5F4 @ =0x00003D0C
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x55
	bl FUN_0201AC88
	ldr r1, _0222F5F8 @ =0x000029FC
	str r0, [r4, r1]
	movs r0, #0x55
	str r0, [r4]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	ldr r0, _0222F5FC @ =0x00002BF4
	movs r1, #1
	str r1, [r4, r0]
	movs r0, #0x55
	bl ov74_022352A0
	movs r2, #0x57
	movs r0, #0
	movs r1, #0x59
	lsls r2, r2, #4
	bl FUN_0201A910
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0222F5F4: .4byte 0x00003D0C
_0222F5F8: .4byte 0x000029FC
_0222F5FC: .4byte 0x00002BF4
	thumb_func_end ov74_0222F598

	thumb_func_start ov74_0222F600
ov74_0222F600: @ 0x0222F600
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02014AA0
	movs r0, #3
	lsls r0, r0, #0xa
	ldr r0, [r4, r0]
	bl FUN_02014A60
	ldr r1, _0222F620 @ =0x04000010
	movs r2, #8
	movs r3, #1
	bl FUN_02014AB0
	pop {r4, pc}
	nop
_0222F620: .4byte 0x04000010
	thumb_func_end ov74_0222F600

	thumb_func_start ov74_0222F624
ov74_0222F624: @ 0x0222F624
	push {r3, r4, r5, lr}
	ldr r4, _0222F678 @ =0x000030E8
	ldr r5, _0222F67C @ =0x00000C14
	adds r4, r0, r4
	adds r0, r5, #0
	str r1, [r4, r5]
	subs r0, #0xc
	str r2, [r4, r0]
	adds r0, r5, #0
	subs r0, #8
	subs r5, #0x14
	str r3, [r4, r0]
	ldr r0, [r4, r5]
	cmp r0, #0
	bne _0222F656
	movs r2, #6
	lsls r2, r2, #8
	movs r0, #0x55
	adds r1, r4, #0
	adds r2, r4, r2
	bl FUN_02014A08
	movs r1, #3
	lsls r1, r1, #0xa
	str r0, [r4, r1]
_0222F656:
	ldr r0, _0222F680 @ =0x00000C04
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222F66E
	movs r2, #1
	ldr r0, _0222F684 @ =ov74_0222F600
	adds r1, r4, #0
	lsls r2, r2, #0xa
	bl FUN_0200E33C
	ldr r1, _0222F680 @ =0x00000C04
	str r0, [r4, r1]
_0222F66E:
	movs r0, #0xc1
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r4, r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222F678: .4byte 0x000030E8
_0222F67C: .4byte 0x00000C14
_0222F680: .4byte 0x00000C04
_0222F684: .4byte ov74_0222F600
	thumb_func_end ov74_0222F624

	thumb_func_start ov74_0222F688
ov74_0222F688: @ 0x0222F688
	push {r4, lr}
	ldr r1, _0222F6BC @ =0x000030E8
	adds r4, r0, r1
	movs r0, #3
	lsls r0, r0, #0xa
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222F69C
	bl FUN_02014A38
_0222F69C:
	ldr r0, _0222F6C0 @ =0x00000C04
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222F6A8
	bl FUN_0200E390
_0222F6A8:
	movs r0, #3
	movs r1, #0
	lsls r0, r0, #0xa
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	bl FUN_02014AA0
	pop {r4, pc}
	nop
_0222F6BC: .4byte 0x000030E8
_0222F6C0: .4byte 0x00000C04
	thumb_func_end ov74_0222F688

	thumb_func_start ov74_0222F6C4
ov74_0222F6C4: @ 0x0222F6C4
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0222F7CC @ =0x000030E8
	movs r5, #0x15
	adds r4, r0, r1
	movs r0, #0xc1
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	lsls r5, r5, #0xe
	cmp r1, #0
	bne _0222F6DC
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222F6DC:
	adds r1, r0, #4
	ldr r1, [r4, r1]
	cmp r1, #1
	bne _0222F72A
	adds r1, r0, #0
	subs r1, #8
	ldr r2, [r4, r1]
	subs r1, r0, #4
	ldr r1, [r4, r1]
	adds r2, r2, r1
	adds r1, r0, #0
	subs r1, #8
	str r2, [r4, r1]
	subs r1, r0, #4
	ldr r2, [r4, r1]
	adds r1, r2, #0
	adds r2, r2, r1
	subs r1, r0, #4
	str r2, [r4, r1]
	adds r1, r0, #0
	subs r1, #8
	ldr r2, [r4, r1]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r2, r1, #0xc
	movs r1, #0xfa
	lsls r1, r1, #2
	cmp r2, r1
	ble _0222F764
	movs r2, #0
	adds r1, r0, #0
	str r2, [r4, r0]
	subs r1, #8
	str r2, [r4, r1]
	subs r0, r0, #4
	movs r5, #0xa8
	str r2, [r4, r0]
	b _0222F764
_0222F72A:
	adds r1, r0, #0
	subs r1, #8
	ldr r2, [r4, r1]
	subs r1, r0, #4
	ldr r1, [r4, r1]
	subs r2, r2, r1
	adds r1, r0, #0
	subs r1, #8
	str r2, [r4, r1]
	subs r1, r0, #4
	ldr r2, [r4, r1]
	lsrs r1, r2, #0x1f
	adds r1, r2, r1
	asrs r2, r1, #1
	subs r1, r0, #4
	str r2, [r4, r1]
	movs r2, #1
	ldr r1, [r4, r1]
	lsls r2, r2, #0xa
	cmp r1, r2
	bge _0222F764
	movs r1, #0
	lsls r3, r2, #2
	adds r2, r0, #0
	str r1, [r4, r0]
	subs r2, #8
	str r3, [r4, r2]
	subs r0, r0, #4
	str r1, [r4, r0]
_0222F764:
	movs r0, #3
	lsls r0, r0, #0xa
	ldr r0, [r4, r0]
	bl FUN_02014A4C
	adds r2, r0, #0
	movs r0, #0x54
	adds r3, r0, #0
	adds r3, #0xfc
_0222F776:
	asrs r1, r5, #0xb
	lsrs r1, r1, #0x14
	adds r1, r5, r1
	asrs r1, r1, #0xc
	bpl _0222F782
	movs r1, #0
_0222F782:
	cmp r1, #0xa8
	ble _0222F788
	movs r1, #0xa8
_0222F788:
	lsls r6, r3, #1
	adds r7, r2, r6
	subs r6, r1, r0
	strh r6, [r7, #6]
	ldrh r6, [r7, #6]
	subs r1, r0, r1
	adds r3, r3, #4
	strh r6, [r7, #2]
	movs r6, #0xa8
	subs r6, r6, r0
	lsls r6, r6, #3
	adds r6, r2, r6
	strh r1, [r6, #6]
	ldrh r1, [r6, #6]
	adds r0, r0, #1
	strh r1, [r6, #2]
	ldr r1, _0222F7D0 @ =0x00000C08
	ldr r1, [r4, r1]
	adds r5, r5, r1
	cmp r0, #0xa8
	blt _0222F776
	movs r1, #6
	adds r0, r2, #0
	lsls r1, r1, #8
	blx FUN_020D2894
	movs r0, #3
	lsls r0, r0, #0xa
	ldr r0, [r4, r0]
	bl FUN_02014A8C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F7CC: .4byte 0x000030E8
_0222F7D0: .4byte 0x00000C08
	thumb_func_end ov74_0222F6C4

	thumb_func_start ov74_0222F7D4
ov74_0222F7D4: @ 0x0222F7D4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r6, r0, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #0x1e
	bls _0222F7EA
	b _0222FB2C
_0222F7EA:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0222F7F6: @ jump table
	.2byte _0222F834 - _0222F7F6 - 2 @ case 0
	.2byte _0222F874 - _0222F7F6 - 2 @ case 1
	.2byte _0222F886 - _0222F7F6 - 2 @ case 2
	.2byte _0222F8FC - _0222F7F6 - 2 @ case 3
	.2byte _0222F92E - _0222F7F6 - 2 @ case 4
	.2byte _0222F956 - _0222F7F6 - 2 @ case 5
	.2byte _0222F976 - _0222F7F6 - 2 @ case 6
	.2byte _0222F9AA - _0222F7F6 - 2 @ case 7
	.2byte _0222F9CE - _0222F7F6 - 2 @ case 8
	.2byte _0222F9F4 - _0222F7F6 - 2 @ case 9
	.2byte _0222FA20 - _0222F7F6 - 2 @ case 10
	.2byte _0222FA5A - _0222F7F6 - 2 @ case 11
	.2byte _0222FB2C - _0222F7F6 - 2 @ case 12
	.2byte _0222FAD6 - _0222F7F6 - 2 @ case 13
	.2byte _0222FB2C - _0222F7F6 - 2 @ case 14
	.2byte _0222FB2C - _0222F7F6 - 2 @ case 15
	.2byte _0222FB2C - _0222F7F6 - 2 @ case 16
	.2byte _0222FB2C - _0222F7F6 - 2 @ case 17
	.2byte _0222FB2C - _0222F7F6 - 2 @ case 18
	.2byte _0222FB2C - _0222F7F6 - 2 @ case 19
	.2byte _0222FA7E - _0222F7F6 - 2 @ case 20
	.2byte _0222FA8A - _0222F7F6 - 2 @ case 21
	.2byte _0222FB2C - _0222F7F6 - 2 @ case 22
	.2byte _0222FAC6 - _0222F7F6 - 2 @ case 23
	.2byte _0222FB2C - _0222F7F6 - 2 @ case 24
	.2byte _0222FB2C - _0222F7F6 - 2 @ case 25
	.2byte _0222FB2C - _0222F7F6 - 2 @ case 26
	.2byte _0222FB00 - _0222F7F6 - 2 @ case 27
	.2byte _0222FB0C - _0222F7F6 - 2 @ case 28
	.2byte _0222FB1C - _0222F7F6 - 2 @ case 29
	.2byte _0222FB2C - _0222F7F6 - 2 @ case 30
_0222F834:
	adds r0, r6, #0
	bl FUN_020072A4
	ldr r1, [r0, #8]
	ldr r0, _0222FB50 @ =0x00002BA4
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	bl FUN_020270E4
	ldr r1, _0222FB54 @ =0x00002BA0
	str r0, [r4, r1]
	adds r0, r1, #4
	ldr r0, [r4, r0]
	bl FUN_02028EA8
	ldr r1, _0222FB58 @ =0x00002BA8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl FUN_0202ADCC
	ldr r1, _0222FB5C @ =0x00002BAC
	str r0, [r4, r1]
	subs r1, #0xc
	ldr r0, [r4, r1]
	movs r1, #4
	bl FUN_0202DBF4
	ldr r1, _0222FB60 @ =0x00002BB4
	str r0, [r4, r1]
	movs r0, #1
	str r0, [r5]
	b _0222FB2C
_0222F874:
	bl ov74_0222FCA4
	ldr r0, _0222FB64 @ =0x000029FC
	ldr r0, [r4, r0]
	bl ov74_0222FCC4
	movs r0, #2
	str r0, [r5]
	b _0222FB2C
_0222F886:
	bl FUN_02020080
	adds r0, r4, #0
	movs r1, #0
	bl ov74_0222F314
	movs r1, #0x1e
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x55
	bl FUN_02003030
	movs r1, #0
	str r1, [sp]
	movs r0, #0x55
	str r0, [sp, #4]
	ldr r0, _0222FB64 @ =0x000029FC
	movs r2, #1
	ldr r0, [r4, r0]
	movs r3, #0xd
	bl FUN_0200E3DC
	movs r0, #1
	str r0, [sp]
	movs r0, #0x55
	str r0, [sp, #4]
	ldr r0, _0222FB64 @ =0x000029FC
	movs r1, #0
	ldr r0, [r4, r0]
	movs r2, #0xa
	movs r3, #0xe
	bl FUN_0200E3DC
	ldr r0, _0222FB5C @ =0x00002BAC
	movs r1, #0
	ldr r0, [r4, r0]
	movs r2, #0x13
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x55
	str r0, [sp, #4]
	ldr r0, _0222FB64 @ =0x000029FC
	movs r3, #0xa
	ldr r0, [r4, r0]
	bl FUN_0200E644
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov74_0222F024
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	adds r3, r5, #0
	bl ov74_0222EFF0
	b _0222FB2C
_0222F8FC:
	ldr r0, _0222FB68 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _0222F91A
	ldr r0, _0222FB6C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x1d
	adds r3, r5, #0
	bl ov74_0222EFF0
	b _0222FB2C
_0222F91A:
	movs r0, #1
	tst r0, r1
	bne _0222F922
	b _0222FB2C
_0222F922:
	ldr r0, _0222FB6C @ =0x000005DC
	bl FUN_0200604C
	movs r0, #4
	str r0, [r5]
	b _0222FB2C
_0222F92E:
	ldr r1, _0222FB70 @ =0x00002BC4
	movs r3, #0xa
	adds r1, r4, r1
	movs r2, #7
	lsls r3, r3, #6
	bl ov74_0222F1BC
	ldr r3, _0222FB74 @ =0x00002BE4
	movs r2, #8
	adds r1, r3, #0
	str r0, [r4, r3]
	subs r1, #0x10
	ldr r3, [r4, r3]
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov74_0222F1BC
	movs r0, #5
	str r0, [r5]
	b _0222FB2C
_0222F956:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0
	bl ov74_0222F404
	ldr r0, _0222FB68 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _0222FA28
	ldr r0, _0222FB6C @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0xb
	str r0, [r5]
	b _0222FB2C
_0222F976:
	ldr r0, _0222FB78 @ =0x000005FF
	bl FUN_0200604C
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	ldr r0, _0222FB70 @ =0x00002BC4
	movs r1, #0
	adds r0, r4, r0
	bl ov74_0222ECEC
	ldr r0, _0222FB7C @ =0x00002BD4
	movs r1, #0
	adds r0, r4, r0
	bl ov74_0222ECD4
	movs r1, #1
	adds r0, r4, #0
	lsls r2, r1, #0xc
	movs r3, #0x66
	bl ov74_0222F624
	movs r0, #7
	str r0, [r5]
	b _0222FB2C
_0222F9AA:
	bl ov74_0222F6C4
	cmp r0, #0
	beq _0222FA28
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov74_0222F024
	ldr r2, _0222FB80 @ =0x00708000
	adds r0, r4, #0
	movs r1, #0
	lsrs r3, r2, #1
	bl ov74_0222F624
	movs r0, #8
	str r0, [r5]
	b _0222FB2C
_0222F9CE:
	bl ov74_0222F6C4
	ldr r0, _0222FB68 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _0222FA28
	ldr r0, _0222FB78 @ =0x000005FF
	bl FUN_0200604C
	movs r1, #1
	adds r0, r4, #0
	lsls r2, r1, #0xc
	movs r3, #0x66
	bl ov74_0222F624
	movs r0, #9
	str r0, [r5]
	b _0222FB2C
_0222F9F4:
	bl ov74_0222F6C4
	cmp r0, #0
	beq _0222FA28
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov74_0222F024
	ldr r2, _0222FB80 @ =0x00708000
	adds r0, r4, #0
	movs r1, #0
	lsrs r3, r2, #1
	bl ov74_0222F624
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0xa
	str r0, [r5]
	b _0222FB2C
_0222FA20:
	bl ov74_0222F6C4
	cmp r0, #0
	bne _0222FA2A
_0222FA28:
	b _0222FB2C
_0222FA2A:
	ldr r0, _0222FB70 @ =0x00002BC4
	movs r1, #0
	adds r0, r4, r0
	movs r2, #0x13
	movs r3, #0xa
	bl FUN_0200E998
	ldr r0, _0222FB7C @ =0x00002BD4
	movs r1, #0
	adds r0, r4, r0
	movs r2, #0xa
	movs r3, #0xe
	bl FUN_0200E580
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	adds r0, r4, #0
	bl ov74_0222F688
	movs r0, #5
	str r0, [r5]
	b _0222FB2C
_0222FA5A:
	bl ov74_0222EDC0
	ldr r0, _0222FB70 @ =0x00002BC4
	movs r1, #0
	adds r0, r4, r0
	bl ov74_0222ECEC
	ldr r0, _0222FB70 @ =0x00002BC4
	adds r0, r4, r0
	bl FUN_0201D8C8
	ldr r0, _0222FB70 @ =0x00002BC4
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #3
	str r0, [r5]
	b _0222FB2C
_0222FA7E:
	movs r1, #0
	movs r2, #0x15
	adds r3, r5, #0
	bl ov74_0222EFF0
	b _0222FB2C
_0222FA8A:
	bl ov74_0222EC60
	ldr r0, _0222FB70 @ =0x00002BC4
	movs r1, #0
	adds r0, r4, r0
	bl ov74_0222ECEC
	ldr r0, _0222FB7C @ =0x00002BD4
	movs r1, #0
	adds r0, r4, r0
	bl ov74_0222ECD4
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov74_0222F024
	movs r1, #0x1e
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x55
	bl FUN_02003030
	adds r0, r4, #0
	movs r1, #1
	movs r2, #4
	adds r3, r5, #0
	bl ov74_0222EFF0
	b _0222FB2C
_0222FAC6:
	bl FUN_02037D78
	cmp r0, #0
	bne _0222FB2C
	ldr r0, _0222FB84 @ =0x00002BF8
	ldr r0, [r4, r0]
	str r0, [r5]
	b _0222FB2C
_0222FAD6:
	ldr r0, _0222FB68 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _0222FB2C
	ldr r0, _0222FB70 @ =0x00002BC4
	movs r1, #0
	adds r0, r4, r0
	bl ov74_0222ECEC
	ldr r0, _0222FB70 @ =0x00002BC4
	adds r0, r4, r0
	bl FUN_0201D8C8
	ldr r0, _0222FB70 @ =0x00002BC4
	adds r0, r4, r0
	bl FUN_0201D520
	movs r0, #3
	str r0, [r5]
	b _0222FB2C
_0222FB00:
	movs r1, #0
	movs r2, #0x1d
	adds r3, r5, #0
	bl ov74_0222EFF0
	b _0222FB2C
_0222FB0C:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0222FB2C
	ldr r0, _0222FB84 @ =0x00002BF8
	ldr r0, [r4, r0]
	str r0, [r5]
	b _0222FB2C
_0222FB1C:
	bl ov74_0222EC60
	adds r0, r4, #0
	bl ov74_0222F688
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_0222FB2C:
	ldr r0, _0222FB88 @ =0x00002BFC
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222FB38
	bl FUN_0202457C
_0222FB38:
	bl ov74_022358BC
	movs r0, #0x3d
	lsls r0, r0, #8
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0222FB4A
	adds r0, r4, #0
	blx r1
_0222FB4A:
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222FB50: .4byte 0x00002BA4
_0222FB54: .4byte 0x00002BA0
_0222FB58: .4byte 0x00002BA8
_0222FB5C: .4byte 0x00002BAC
_0222FB60: .4byte 0x00002BB4
_0222FB64: .4byte 0x000029FC
_0222FB68: .4byte 0x021D110C
_0222FB6C: .4byte 0x000005DC
_0222FB70: .4byte 0x00002BC4
_0222FB74: .4byte 0x00002BE4
_0222FB78: .4byte 0x000005FF
_0222FB7C: .4byte 0x00002BD4
_0222FB80: .4byte 0x00708000
_0222FB84: .4byte 0x00002BF8
_0222FB88: .4byte 0x00002BFC
	thumb_func_end ov74_0222F7D4

	thumb_func_start ov74_0222FB8C
ov74_0222FB8C: @ 0x0222FB8C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl FUN_02007290
	adds r7, r0, #0
	ldr r0, _0222FC38 @ =0x00002A08
	movs r6, #0
	adds r4, r7, #0
	adds r5, r7, r0
_0222FB9E:
	ldr r0, _0222FC38 @ =0x00002A08
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222FBB2
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
_0222FBB2:
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, #0x10
	cmp r6, #0xb
	blo _0222FB9E
	ldr r0, _0222FC3C @ =0x00002BC4
	ldr r1, [r7, r0]
	cmp r1, #0
	beq _0222FBD2
	adds r0, r7, r0
	bl FUN_0201D8C8
	ldr r0, _0222FC3C @ =0x00002BC4
	adds r0, r7, r0
	bl FUN_0201D520
_0222FBD2:
	ldr r0, _0222FC40 @ =0x00002BD4
	ldr r1, [r7, r0]
	cmp r1, #0
	beq _0222FBE8
	adds r0, r7, r0
	bl FUN_0201D8C8
	ldr r0, _0222FC40 @ =0x00002BD4
	adds r0, r7, r0
	bl FUN_0201D520
_0222FBE8:
	ldr r0, _0222FC44 @ =0x000029FC
	movs r1, #0
	ldr r0, [r7, r0]
	bl FUN_0201BB4C
	ldr r0, _0222FC44 @ =0x000029FC
	movs r1, #1
	ldr r0, [r7, r0]
	bl FUN_0201BB4C
	ldr r0, _0222FC44 @ =0x000029FC
	movs r1, #2
	ldr r0, [r7, r0]
	bl FUN_0201BB4C
	ldr r0, _0222FC44 @ =0x000029FC
	movs r1, #3
	ldr r0, [r7, r0]
	bl FUN_0201BB4C
	ldr r0, _0222FC44 @ =0x000029FC
	ldr r0, [r7, r0]
	bl FUN_0201AB0C
	ldr r0, _0222FC48 @ =0x0000004A
	ldr r1, _0222FC4C @ =0x0223B380
	bl FUN_02000EF4
	movs r0, #0x59
	bl FUN_0201A9C4
	ldr r0, [sp]
	bl FUN_02007294
	movs r0, #0x55
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FC38: .4byte 0x00002A08
_0222FC3C: .4byte 0x00002BC4
_0222FC40: .4byte 0x00002BD4
_0222FC44: .4byte 0x000029FC
_0222FC48: .4byte 0x0000004A
_0222FC4C: .4byte 0x0223B380
	thumb_func_end ov74_0222FB8C

	thumb_func_start ov74_0222FC50
ov74_0222FC50: @ 0x0222FC50
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	bl ov74_0222FCC4
	ldr r1, _0222FC98 @ =0x00003D0C
	adds r0, r5, #0
	bl FUN_0201AACC
	ldr r2, _0222FC98 @ =0x00003D0C
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r0, _0222FC9C @ =0x000029FC
	movs r1, #0x1e
	str r6, [r4, r0]
	movs r0, #0
	lsls r1, r1, #4
	adds r2, r5, #0
	str r5, [r4]
	bl FUN_02003030
	ldr r0, _0222FCA0 @ =0x00002BB4
	movs r1, #1
	str r7, [r4, r0]
	adds r0, r4, #0
	movs r2, #0
	bl ov74_0222F024
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FC98: .4byte 0x00003D0C
_0222FC9C: .4byte 0x000029FC
_0222FCA0: .4byte 0x00002BB4
	thumb_func_end ov74_0222FC50

	thumb_func_start ov74_0222FCA4
ov74_0222FCA4: @ 0x0222FCA4
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0222FCC0 @ =0x0223B4B0
	add r3, sp, #0
	movs r2, #5
_0222FCAE:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0222FCAE
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_0222FCC0: .4byte 0x0223B4B0
	thumb_func_end ov74_0222FCA4

	thumb_func_start ov74_0222FCC4
ov74_0222FCC4: @ 0x0222FCC4
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _0222FD84 @ =0x0223B430
	add r3, sp, #0x70
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _0222FD88 @ =0x0223B45C
	add r3, sp, #0x54
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
	adds r3, r1, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _0222FD8C @ =0x0223B494
	add r3, sp, #0x38
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #1
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _0222FD90 @ =0x0223B478
	add r3, sp, #0x1c
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
	ldr r5, _0222FD94 @ =0x0223B440
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
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_0222FD84: .4byte 0x0223B430
_0222FD88: .4byte 0x0223B45C
_0222FD8C: .4byte 0x0223B494
_0222FD90: .4byte 0x0223B478
_0222FD94: .4byte 0x0223B440
	thumb_func_end ov74_0222FCC4

	thumb_func_start ov74_0222FD98
ov74_0222FD98: @ 0x0222FD98
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	bl FUN_020270E4
	movs r1, #0
	ldr r4, [r5, #0x48]
	mvns r1, r1
	adds r6, r0, #0
	cmp r4, r1
	bne _0222FDCC
	adds r2, r5, #0
	adds r2, #0x4c
	ldrh r2, [r2]
	lsrs r1, r1, #0x10
	cmp r2, r1
	bne _0222FDCC
	bl FUN_0202DBB0
	adds r0, r7, #0
	movs r1, #0
	bl FUN_0202746C
	movs r0, #0
	blx FUN_020D3B84
_0222FDCC:
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	cmp r1, #0x64
	blo _0222FDE0
	cmp r1, #0x98
	bhi _0222FDE0
	movs r0, #0x46
	lsls r0, r0, #6
	orrs r4, r0
_0222FDE0:
	cmp r4, #0
	bne _0222FDE8
	movs r4, #0
	mvns r4, r4
_0222FDE8:
	movs r0, #0x80
	tst r0, r4
	bne _0222FDF2
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222FDF2:
	adds r0, r5, #0
	adds r0, #0x4e
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0222FE0E
	adds r0, r6, #0
	bl FUN_0202DF7C
	cmp r0, #1
	bne _0222FE0E
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0222FE0E:
	adds r0, r5, #0
	adds r0, #0x4e
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0222FE2A
	adds r0, r6, #0
	bl FUN_0202DE3C
	cmp r0, #0
	bne _0222FE2A
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0222FE2A:
	adds r0, r6, #0
	bl FUN_0202DE14
	cmp r0, #0
	bne _0222FE38
	movs r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0222FE38:
	adds r5, #0x4e
	ldrb r0, [r5]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0222FE48
	movs r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_0222FE48:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_0222FD98

	thumb_func_start ov74_0222FE4C
ov74_0222FE4C: @ 0x0222FE4C
	push {r3, lr}
	movs r0, #4
	bl ov74_02231070
	bl ov74_02231724
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_0222FE4C

	thumb_func_start ov74_0222FE5C
ov74_0222FE5C: @ 0x0222FE5C
	push {r3, lr}
	bl ov74_022311F4
	str r0, [sp]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_0222FE5C

	thumb_func_start ov74_0222FE68
ov74_0222FE68: @ 0x0222FE68
	push {r3, lr}
	bl ov74_02231214
	add r1, sp, #0
	strh r0, [r1]
	movs r0, #0
	ldrsh r0, [r1, r0]
	pop {r3, pc}
	thumb_func_end ov74_0222FE68

	thumb_func_start ov74_0222FE78
ov74_0222FE78: @ 0x0222FE78
	push {r4, lr}
	bl ov74_0223107C
	cmp r0, #0xc
	bne _0222FE9A
	bl ov74_0223105C
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _0222FE96
	bl ov74_02231724
	movs r0, #1
	str r0, [r4, #0x1c]
_0222FE96:
	movs r0, #1
	pop {r4, pc}
_0222FE9A:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_0222FE78

	thumb_func_start ov74_0222FEA0
ov74_0222FEA0: @ 0x0222FEA0
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_0223115C
	movs r3, #0
	adds r1, r3, #0
_0222FEAC:
	ldr r2, [r0]
	cmp r2, #0
	beq _0222FEBC
	ldrh r2, [r0, #6]
	cmp r4, r2
	bne _0222FEBC
	strb r1, [r0, #8]
	strb r1, [r0, #0xa]
_0222FEBC:
	adds r3, r3, #1
	adds r0, #0xc
	cmp r3, #8
	blt _0222FEAC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_0222FEA0

	thumb_func_start ov74_0222FEC8
ov74_0222FEC8: @ 0x0222FEC8
	push {r3, lr}
	bl ov74_0223115C
	adds r1, r0, #0
	adds r1, #0x62
	ldrh r3, [r1]
	movs r2, #1
	adds r1, r3, #0
	tst r1, r2
	beq _0222FEEE
	adds r1, r0, #0
	adds r1, #0x62
	ldrh r3, [r1]
	movs r1, #1
	adds r0, #0x62
	bics r3, r1
	strh r3, [r0]
	adds r0, r2, #0
	pop {r3, pc}
_0222FEEE:
	movs r1, #0x40
	adds r2, r3, #0
	tst r2, r1
	beq _0222FF08
	adds r1, r0, #0
	adds r1, #0x62
	ldrh r2, [r1]
	movs r1, #0x40
	adds r0, #0x62
	bics r2, r1
	strh r2, [r0]
	movs r0, #7
	pop {r3, pc}
_0222FF08:
	lsls r1, r1, #6
	tst r1, r3
	beq _0222FF20
	adds r1, r0, #0
	adds r1, #0x62
	ldrh r2, [r1]
	ldr r1, _0222FF24 @ =0xFFFFEFFF
	adds r0, #0x62
	ands r1, r2
	strh r1, [r0]
	movs r0, #0xd
	pop {r3, pc}
_0222FF20:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_0222FF24: .4byte 0xFFFFEFFF
	thumb_func_end ov74_0222FEC8

	thumb_func_start ov74_0222FF28
ov74_0222FF28: @ 0x0222FF28
	push {r4, lr}
	bl ov74_0223115C
	adds r4, r0, #0
	movs r1, #1
	adds r0, #0x60
	strb r1, [r0]
	blx FUN_020DEF24
	adds r1, r4, #0
	adds r1, #0x62
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x62
	ldrh r1, [r0]
	cmp r1, #0
	beq _0222FF52
	movs r0, #2
	lsls r0, r0, #0xe
	cmp r1, r0
	bne _0222FF56
_0222FF52:
	movs r0, #0
	pop {r4, pc}
_0222FF56:
	adds r0, r4, #0
	movs r1, #0x66
	adds r0, #0x61
	strb r1, [r0]
	movs r0, #0
	adds r4, #0x64
	strb r0, [r4]
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov74_0222FF28

	thumb_func_start ov74_0222FF68
ov74_0222FF68: @ 0x0222FF68
	push {r4, lr}
	bl ov74_02231054
	adds r4, r0, #0
	blx FUN_020DEFD4
	strh r0, [r4, #0x18]
	blx FUN_020DF250
	strh r0, [r4, #0xc]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_0222FF68

	thumb_func_start ov74_0222FF80
ov74_0222FF80: @ 0x0222FF80
	push {r4, lr}
	bl ov74_022310C4
	adds r4, r0, #0
	bl ov74_02231100
	str r0, [r4]
	bl ov74_02231054
	ldrh r0, [r0, #0x32]
	strh r0, [r4, #4]
	blx FUN_020DF064
	strh r0, [r4, #6]
	movs r0, #0xff
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xb]
	strb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	pop {r4, pc}
	thumb_func_end ov74_0222FF80

	thumb_func_start ov74_0222FFAC
ov74_0222FFAC: @ 0x0222FFAC
	push {r3, r4, r5, r6, r7, lr}
	bl ov74_022310C4
	adds r7, r0, #0
	blx FUN_020DEF24
	adds r3, r0, #0
	beq _0222FFF8
	ldrh r2, [r7, #4]
	movs r1, #0
	movs r0, #1
	mov ip, r2
	movs r4, #0x1c
_0222FFC6:
	lsrs r6, r2, #0x1f
	lsls r5, r2, #0x1c
	subs r5, r5, r6
	rors r5, r4
	adds r5, r6, r5
	adds r6, r0, #0
	lsls r6, r5
	adds r5, r3, #0
	tst r5, r6
	beq _0222FFF0
	mov r0, ip
	adds r0, r0, r1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1c
	subs r1, r1, r2
	movs r0, #0x1c
	rors r1, r0
	adds r0, r2, r1
	adds r0, r0, #1
	strh r0, [r7, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0222FFF0:
	adds r1, r1, #1
	adds r2, r2, #1
	cmp r1, #0x10
	blt _0222FFC6
_0222FFF8:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov74_0222FFAC

	thumb_func_start ov74_0222FFFC
ov74_0222FFFC: @ 0x0222FFFC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #4]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #8
	bne _02230014
	bl ov74_02231448
	bl ov74_0222FE4C
_02230014:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_0222FFFC

	thumb_func_start ov74_02230018
ov74_02230018: @ 0x02230018
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0223002C
	bl ov74_02231448
_0223002C:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_02230018

	thumb_func_start ov74_02230030
ov74_02230030: @ 0x02230030
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _02230066
	movs r0, #2
	bl ov74_02231070
	bl ov74_0223107C
	cmp r0, #0xc
	bne _02230052
	bl ov74_022314BC
	movs r0, #2
	bl ov74_02231070
	pop {r3, pc}
_02230052:
	bl ov74_022316E8
	cmp r0, #0
	bne _0223006E
	bl ov74_022314BC
	movs r0, #2
	bl ov74_02231070
	pop {r3, pc}
_02230066:
	bl ov74_02231448
	bl ov74_022314BC
_0223006E:
	pop {r3, pc}
	thumb_func_end ov74_02230030

	thumb_func_start ov74_02230070
ov74_02230070: @ 0x02230070
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _0223009A
	bl ov74_0223107C
	cmp r0, #0xc
	bne _02230092
	blx FUN_020DE458
	movs r0, #0xc
	bl ov74_02231070
	movs r0, #1
	bl ov74_0223113C
	pop {r3, pc}
_02230092:
	movs r0, #1
	bl ov74_02231070
	pop {r3, pc}
_0223009A:
	bl ov74_02231448
	movs r0, #4
	bl ov74_02231070
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02230070

	thumb_func_start ov74_022300A8
ov74_022300A8: @ 0x022300A8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #2]
	cmp r0, #0
	bne _02230106
	bl ov74_0223115C
	adds r4, r0, #0
	adds r0, #0x61
	ldrh r1, [r5, #0xa]
	ldrb r0, [r0]
	cmp r0, r1
	ble _022300D0
	adds r0, r4, #0
	adds r0, #0x61
	strb r1, [r0]
	adds r0, r4, #0
	ldrh r1, [r5, #8]
	adds r0, #0x64
	strb r1, [r0]
_022300D0:
	bl ov74_0222FEC8
	cmp r0, #0
	beq _022300E6
	bl ov74_022314DC
	cmp r0, #0
	bne _0223010E
	bl ov74_0222FE4C
	pop {r3, r4, r5, pc}
_022300E6:
	adds r4, #0x61
	ldrb r0, [r4]
	cmp r0, #0x66
	bhs _02230100
	bl ov74_0222FF68
	bl ov74_02231508
	cmp r0, #0
	bne _0223010E
	bl ov74_0222FE4C
	pop {r3, r4, r5, pc}
_02230100:
	bl ov74_0222FE4C
	pop {r3, r4, r5, pc}
_02230106:
	bl ov74_02231448
	bl ov74_0222FE4C
_0223010E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_022300A8

	thumb_func_start ov74_02230110
ov74_02230110: @ 0x02230110
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _0223012E
	bl ov74_0222FE78
	cmp r0, #0
	bne _02230136
	bl ov74_02231544
	cmp r0, #0
	bne _02230136
	bl ov74_0222FE4C
	pop {r3, pc}
_0223012E:
	bl ov74_02231448
	bl ov74_0222FE4C
_02230136:
	pop {r3, pc}
	thumb_func_end ov74_02230110

	thumb_func_start ov74_02230138
ov74_02230138: @ 0x02230138
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldrh r0, [r5, #8]
	bl ov74_0223144C
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _0223014C
	b _0223025E
_0223014C:
	bl ov74_0223115C
	adds r4, r0, #0
	movs r0, #8
	bl ov74_02231070
	bl ov74_0222FE78
	cmp r0, #0
	beq _02230162
	b _02230266
_02230162:
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #1
	bne _02230174
	adds r0, r4, #0
	movs r1, #2
	adds r0, #0x60
	strb r1, [r0]
_02230174:
	ldrh r0, [r5, #8]
	cmp r0, #7
	bgt _0223018C
	bge _022301AE
	cmp r0, #2
	bgt _02230266
	cmp r0, #0
	blt _02230266
	beq _02230194
	add sp, #0xc
	cmp r0, #2
	pop {r4, r5, pc}
_0223018C:
	cmp r0, #9
	beq _02230254
	add sp, #0xc
	pop {r4, r5, pc}
_02230194:
	bl ov74_02231670
	cmp r0, #0
	bne _022301A4
	bl ov74_0222FE4C
	add sp, #0xc
	pop {r4, r5, pc}
_022301A4:
	movs r0, #0
	bl ov74_0223110C
	add sp, #0xc
	pop {r4, r5, pc}
_022301AE:
	bl ov74_0223115C
	bl ov74_02231458
	adds r4, #0x60
	ldrb r0, [r4]
	cmp r0, #2
	bne _02230266
	adds r4, r5, #0
	adds r4, #0x14
	bl ov74_022311AC
	ldr r1, [r5, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, r0
	bne _02230266
	bl ov74_022311BC
	ldr r1, [r4]
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x1c
	cmp r1, r0
	bhi _02230266
	bl ov74_022311CC
	ldr r1, [r4, #4]
	lsrs r1, r1, #0x10
	cmp r1, r0
	bne _02230266
	bl ov74_0223115C
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0xa
	bl ov74_0222FE5C
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xa
	bl ov74_0222FE68
	add r1, sp, #0
	strh r0, [r1]
	ldrh r0, [r1]
	ldr r2, [sp, #8]
	adds r3, r4, #0
	strh r0, [r1, #2]
	movs r0, #0
_02230212:
	ldr r1, [r3]
	cmp r1, r2
	bne _0223022A
	movs r1, #0xc
	muls r1, r0, r1
	ldrh r0, [r5, #0x10]
	adds r1, r4, r1
	add sp, #0xc
	strh r0, [r1, #6]
	movs r0, #1
	strb r0, [r1, #0xa]
	pop {r4, r5, pc}
_0223022A:
	cmp r1, #0
	bne _02230248
	movs r1, #0xc
	muls r1, r0, r1
	str r2, [r4, r1]
	add r0, sp, #0
	ldrh r0, [r0, #2]
	adds r1, r4, r1
	add sp, #0xc
	strh r0, [r1, #4]
	ldrh r0, [r5, #0x10]
	strh r0, [r1, #6]
	movs r0, #1
	strb r0, [r1, #0xa]
	pop {r4, r5, pc}
_02230248:
	adds r0, r0, #1
	adds r3, #0xc
	cmp r0, #8
	blt _02230212
	add sp, #0xc
	pop {r4, r5, pc}
_02230254:
	ldrh r0, [r5, #0x10]
	bl ov74_0222FEA0
	add sp, #0xc
	pop {r4, r5, pc}
_0223025E:
	bl ov74_02231448
	bl ov74_0222FE4C
_02230266:
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov74_02230138

	thumb_func_start ov74_0223026C
ov74_0223026C: @ 0x0223026C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	str r0, [sp]
	bl ov74_02231154
	adds r7, r0, #0
	adds r0, r4, #4
	bl ov74_0222FE5C
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #4
	bl ov74_0222FE68
	add r2, sp, #4
	strh r0, [r2]
	ldrh r0, [r2]
	ldr r6, [sp, #0xc]
	adds r1, r7, #0
	strh r0, [r2, #2]
	ldrh r3, [r2, #2]
	movs r0, #0
_0223029A:
	ldr r2, [r1]
	adds r5, r1, #0
	adds r5, #0x34
	cmp r2, r6
	bne _022302B0
	ldrh r5, [r5]
	cmp r5, r3
	bne _022302B0
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022302B0:
	cmp r2, #0
	bne _022302FC
	movs r1, #0x38
	muls r1, r0, r1
	ldr r0, [sp, #0xc]
	adds r5, r4, #0
	str r0, [r7, r1]
	adds r0, r7, r1
	adds r5, #0x58
	adds r3, r0, #4
	movs r2, #0xc
_022302C6:
	ldrh r0, [r5]
	adds r5, r5, #2
	strh r0, [r3]
	adds r3, r3, #2
	subs r2, r2, #1
	bne _022302C6
	adds r3, r7, r1
	adds r4, #0x70
	adds r3, #0x1c
	movs r2, #0xc
_022302DA:
	ldrh r0, [r4]
	adds r4, r4, #2
	strh r0, [r3]
	adds r3, r3, #2
	subs r2, r2, #1
	bne _022302DA
	add r0, sp, #4
	ldrh r0, [r0, #2]
	adds r1, r7, r1
	strh r0, [r1, #0x34]
	ldr r0, [sp]
	adds r1, #0x36
	ldrh r0, [r0, #0x12]
	add sp, #0x10
	strb r0, [r1]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022302FC:
	adds r0, r0, #1
	adds r1, #0x38
	cmp r0, #8
	blt _0223029A
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov74_0223026C

	thumb_func_start ov74_0223030C
ov74_0223030C: @ 0x0223030C
	push {r3, lr}
	bl ov74_0222FFAC
	bl ov74_02231560
	cmp r0, #0
	bne _0223031E
	bl ov74_0222FE4C
_0223031E:
	pop {r3, pc}
	thumb_func_end ov74_0223030C

	thumb_func_start ov74_02230320
ov74_02230320: @ 0x02230320
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ov74_02231100
	adds r4, r0, #0
	bl ov74_02231154
	adds r5, r0, #0
	bl ov74_0222FE78
	cmp r0, #0
	beq _0223033C
	movs r0, #1
	pop {r4, r5, r6, pc}
_0223033C:
	movs r1, #0
	adds r2, r1, #0
	adds r3, r5, #0
_02230342:
	ldr r0, [r3]
	cmp r0, #0
	beq _0223034C
	movs r1, #1
	b _02230354
_0223034C:
	adds r2, r2, #1
	adds r3, #0x38
	cmp r2, #8
	blt _02230342
_02230354:
	cmp r1, #0
	beq _02230372
	movs r0, #7
	lsls r0, r0, #6
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _02230372
	bl ov74_0223161C
	cmp r0, #0
	bne _0223036E
	bl ov74_0222FE4C
_0223036E:
	movs r0, #1
	pop {r4, r5, r6, pc}
_02230372:
	adds r0, r4, #0
	movs r1, #0xc0
	blx FUN_020D285C
	bl ov74_02231154
	bl ov74_02231454
	ldrh r0, [r6, #0x36]
	cmp r0, #8
	blo _022303FC
	bl ov74_022311A0
	ldr r1, [r4, #0x44]
	cmp r1, r0
	bne _022303FC
	adds r5, r4, #0
	adds r5, #0x50
	bl ov74_022311AC
	ldr r1, [r4, #0x50]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, r0
	bne _022303FC
	bl ov74_022311BC
	ldr r1, [r5]
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x1c
	cmp r1, r0
	bhi _022303FC
	bl ov74_022311CC
	ldr r1, [r5, #4]
	lsrs r1, r1, #0x10
	cmp r1, r0
	bne _022303FC
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov74_0223026C
	cmp r0, #0
	beq _022303EC
	bl ov74_02231154
	ldr r1, _02230400 @ =0x000001C2
	ldrb r2, [r0, r1]
	adds r2, r2, #1
	strb r2, [r0, r1]
	ldrb r0, [r0, r1]
	cmp r0, #0x1c
	bls _022303FC
	bl ov74_0223161C
	cmp r0, #0
	bne _022303FC
	bl ov74_0222FE4C
	movs r0, #1
	pop {r4, r5, r6, pc}
_022303EC:
	bl ov74_0223161C
	cmp r0, #0
	bne _022303F8
	bl ov74_0222FE4C
_022303F8:
	movs r0, #1
	pop {r4, r5, r6, pc}
_022303FC:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02230400: .4byte 0x000001C2
	thumb_func_end ov74_02230320

	thumb_func_start ov74_02230404
ov74_02230404: @ 0x02230404
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _0223046A
	bl ov74_02231100
	bl ov74_02231450
	movs r0, #6
	bl ov74_02231070
	bl ov74_0222FE78
	cmp r0, #0
	bne _02230472
	bl ov74_02231094
	cmp r0, #1
	bne _02230444
	bl ov74_02231154
	ldr r2, _02230474 @ =0x000001C3
	movs r1, #0xf0
	ldrb r3, [r0, r2]
	bics r3, r1
	movs r1, #0x10
	orrs r1, r3
	strb r1, [r0, r2]
_02230444:
	ldrh r0, [r4, #8]
	cmp r0, #4
	beq _02230458
	cmp r0, #5
	bne _0223045E
	adds r0, r4, #0
	bl ov74_02230320
	cmp r0, #0
	bne _02230472
_02230458:
	bl ov74_0223030C
	pop {r4, pc}
_0223045E:
	ldrh r0, [r4, #2]
	bl ov74_02231448
	bl ov74_0222FE4C
	pop {r4, pc}
_0223046A:
	bl ov74_02231448
	bl ov74_0222FE4C
_02230472:
	pop {r4, pc}
	.align 2, 0
_02230474: .4byte 0x000001C3
	thumb_func_end ov74_02230404

	thumb_func_start ov74_02230478
ov74_02230478: @ 0x02230478
	push {r4, r5, r6, lr}
	sub sp, #8
	bl ov74_02231100
	adds r4, r0, #0
	bl ov74_02231154
	adds r6, r0, #0
	bl ov74_02231054
	bl ov74_0222FE78
	cmp r0, #0
	beq _0223049A
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_0223049A:
	adds r0, r4, #0
	movs r1, #0xc0
	blx FUN_020D285C
	bl ov74_02231154
	bl ov74_02231454
	ldrh r0, [r4, #0x3c]
	cmp r0, #8
	blo _02230514
	bl ov74_022311A0
	ldr r1, [r4, #0x44]
	cmp r1, r0
	bne _02230514
	adds r5, r4, #0
	adds r5, #0x50
	bl ov74_022311AC
	ldr r1, [r4, #0x50]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, r0
	bne _02230514
	bl ov74_022311BC
	ldr r1, [r5]
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x1c
	cmp r1, r0
	bhi _02230514
	bl ov74_022311CC
	ldr r1, [r5, #4]
	lsrs r1, r1, #0x10
	cmp r1, r0
	bne _02230514
	adds r0, r4, #4
	bl ov74_0222FE5C
	ldr r1, _0223051C @ =0x000001C3
	str r0, [sp]
	ldrb r1, [r6, r1]
	str r0, [sp, #4]
	lsls r1, r1, #0x1c
	lsrs r2, r1, #0x1c
	movs r1, #0x38
	muls r1, r2, r1
	ldr r1, [r6, r1]
	cmp r1, r0
	bne _02230514
	bl ov74_0223161C
	cmp r0, #0
	bne _0223050E
	bl ov74_0222FE4C
_0223050E:
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_02230514:
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0223051C: .4byte 0x000001C3
	thumb_func_end ov74_02230478

	thumb_func_start ov74_02230520
ov74_02230520: @ 0x02230520
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _02230580
	bl ov74_02231154
	ldr r2, _0223058C @ =0x000001C3
	movs r1, #0xf0
	ldrb r3, [r0, r2]
	bics r3, r1
	movs r1, #0x20
	orrs r1, r3
	strb r1, [r0, r2]
	movs r0, #6
	bl ov74_02231070
	bl ov74_0222FE78
	cmp r0, #0
	bne _02230588
	ldrh r0, [r4, #8]
	cmp r0, #4
	beq _02230562
	cmp r0, #5
	bne _02230574
	bl ov74_02230478
	cmp r0, #0
	bne _02230588
_02230562:
	bl ov74_0222FFAC
	bl ov74_02231584
	cmp r0, #0
	bne _02230588
	bl ov74_0222FE4C
	pop {r4, pc}
_02230574:
	ldrh r0, [r4, #2]
	bl ov74_02231448
	bl ov74_0222FE4C
	pop {r4, pc}
_02230580:
	bl ov74_02231448
	bl ov74_0222FE4C
_02230588:
	pop {r4, pc}
	nop
_0223058C: .4byte 0x000001C3
	thumb_func_end ov74_02230520

	thumb_func_start ov74_02230590
ov74_02230590: @ 0x02230590
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _022305D4
	movs r0, #7
	bl ov74_02231070
	bl ov74_0222FE78
	cmp r0, #0
	bne _022305DC
	bl ov74_02231094
	cmp r0, #1
	bne _022305DC
	bl ov74_02231154
	ldr r1, _022305E0 @ =0x000001C3
	ldrb r0, [r0, r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #2
	bne _022305DC
	bl ov74_02231638
	cmp r0, #0
	bne _022305CC
	bl ov74_0222FE4C
	pop {r3, pc}
_022305CC:
	movs r0, #3
	bl ov74_02231070
	pop {r3, pc}
_022305D4:
	bl ov74_02231448
	bl ov74_0222FE4C
_022305DC:
	pop {r3, pc}
	nop
_022305E0: .4byte 0x000001C3
	thumb_func_end ov74_02230590

	thumb_func_start ov74_022305E4
ov74_022305E4: @ 0x022305E4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _0223066A
	movs r0, #9
	bl ov74_02231070
	bl ov74_0222FE78
	cmp r0, #0
	bne _02230672
	ldrh r0, [r4, #8]
	cmp r0, #9
	bhi _0223065E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02230614: @ jump table
	.2byte _0223065E - _02230614 - 2 @ case 0
	.2byte _0223065E - _02230614 - 2 @ case 1
	.2byte _0223065E - _02230614 - 2 @ case 2
	.2byte _0223065E - _02230614 - 2 @ case 3
	.2byte _0223065E - _02230614 - 2 @ case 4
	.2byte _0223065E - _02230614 - 2 @ case 5
	.2byte _02230672 - _02230614 - 2 @ case 6
	.2byte _02230628 - _02230614 - 2 @ case 7
	.2byte _02230672 - _02230614 - 2 @ case 8
	.2byte _02230648 - _02230614 - 2 @ case 9
_02230628:
	ldrh r0, [r4, #0xa]
	bl ov74_0223110C
	movs r0, #1
	bl ov74_02231124
	movs r0, #0
	bl ov74_02231130
	bl ov74_02231670
	cmp r0, #0
	bne _02230672
	bl ov74_0222FE4C
	pop {r4, pc}
_02230648:
	bl ov74_02231118
	cmp r0, #0
	beq _02230656
	movs r0, #1
	bl ov74_02231130
_02230656:
	movs r0, #0
	bl ov74_02231124
	pop {r4, pc}
_0223065E:
	ldrh r0, [r4, #2]
	bl ov74_02231448
	bl ov74_0222FE4C
	pop {r4, pc}
_0223066A:
	bl ov74_02231448
	bl ov74_0222FE4C
_02230672:
	pop {r4, pc}
	thumb_func_end ov74_022305E4

	thumb_func_start ov74_02230674
ov74_02230674: @ 0x02230674
	push {r3, lr}
	bl ov74_02231094
	cmp r0, #1
	beq _022306AE
	cmp r0, #2
	bne _022306C6
	bl ov74_0222FF28
	cmp r0, #0
	beq _022306A8
	bl ov74_0222FEC8
	bl ov74_022314DC
	cmp r0, #0
	beq _022306A8
	bl ov74_0223115C
	movs r1, #1
	adds r0, #0x60
	strb r1, [r0]
	movs r0, #3
	bl ov74_02231070
	pop {r3, pc}
_022306A8:
	bl ov74_0222FE4C
	pop {r3, pc}
_022306AE:
	bl ov74_0222FF80
	bl ov74_02231560
	cmp r0, #0
	bne _022306C0
	bl ov74_0222FE4C
	pop {r3, pc}
_022306C0:
	movs r0, #3
	bl ov74_02231070
_022306C6:
	pop {r3, pc}
	thumb_func_end ov74_02230674

	thumb_func_start ov74_022306C8
ov74_022306C8: @ 0x022306C8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #4]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _02230702
	ldrh r0, [r4]
	cmp r0, #0xe
	bne _022306E6
	bl ov74_0222FE78
	cmp r0, #0
	bne _02230712
_022306E6:
	bl ov74_02231094
	cmp r0, #1
	beq _022306FA
	cmp r0, #2
	bne _02230712
	movs r0, #0xa
	bl ov74_02231070
	pop {r4, pc}
_022306FA:
	movs r0, #0xb
	bl ov74_02231070
	pop {r4, pc}
_02230702:
	cmp r0, #9
	beq _02230712
	cmp r0, #0xd
	beq _02230712
	cmp r0, #0xf
	beq _02230712
	bl ov74_0222FE4C
_02230712:
	pop {r4, pc}
	thumb_func_end ov74_022306C8

	thumb_func_start ov74_02230714
ov74_02230714: @ 0x02230714
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ov74_02231184
	adds r4, r0, #0
	ldrb r0, [r4, #0x19]
	cmp r0, #1
	bne _0223078A
	ldrh r1, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r5, [r4, #0xc]
	blx FUN_020D2894
	ldrh r2, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r1, [r4, #0xc]
	blx FUN_020D4A50
	bl ov74_022311AC
	ldr r1, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, r0
	bne _0223078A
	bl ov74_022311BC
	ldr r1, [r5]
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x1c
	cmp r1, r0
	bhi _0223078A
	ldr r0, [r4, #0xc]
	bl ov74_022313F0
	ldr r0, [r5, #8]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrb r0, [r4, #0x1c]
	cmp r1, r0
	bne _0223078A
	ldr r0, [r4, #0xc]
	bl ov74_0223145C
	ldr r0, [r4, #0xc]
	bl ov74_02231424
	cmp r0, #0
	beq _02230786
	ldr r0, [r5, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _02230786
	movs r0, #2
	strb r0, [r4, #0x19]
	pop {r4, r5, r6, pc}
_02230786:
	movs r0, #0
	strb r0, [r4, #0x19]
_0223078A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov74_02230714

	thumb_func_start ov74_0223078C
ov74_0223078C: @ 0x0223078C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ov74_02231184
	adds r4, r0, #0
	bl ov74_02231094
	cmp r0, #2
	bne _02230814
	ldrb r0, [r4, #0x19]
	cmp r0, #2
	beq _02230814
	ldrh r1, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r5, [r4, #0xc]
	blx FUN_020D2894
	ldrh r2, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r1, [r4, #0xc]
	blx FUN_020D4A50
	bl ov74_022311AC
	ldr r1, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, r0
	bne _02230814
	bl ov74_022311BC
	ldr r1, [r5]
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x1c
	cmp r1, r0
	bhi _02230814
	ldr r0, [r4, #0xc]
	bl ov74_022313F0
	ldr r0, [r5, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xfd
	bne _02230814
	bl ov74_0223115C
	ldrh r5, [r6, #0x12]
	movs r2, #0
	adds r3, r0, #0
_022307EE:
	ldrh r1, [r3, #6]
	cmp r5, r1
	bne _0223080C
	movs r1, #0xc
	muls r1, r2, r1
	adds r1, r0, r1
	movs r2, #1
	strb r2, [r1, #8]
	movs r0, #3
	strb r0, [r1, #9]
	movs r0, #0xb4
	strb r0, [r4, #0x1a]
	movs r0, #0
	strb r0, [r4, #0x19]
	pop {r4, r5, r6, pc}
_0223080C:
	adds r2, r2, #1
	adds r3, #0xc
	cmp r2, #8
	blt _022307EE
_02230814:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov74_0223078C

	thumb_func_start ov74_02230818
ov74_02230818: @ 0x02230818
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ov74_02231184
	adds r4, r0, #0
	ldrb r0, [r4, #0x1c]
	cmp r0, #0xfd
	bne _02230830
	adds r0, r6, #0
	bl ov74_0223078C
	pop {r4, r5, r6, pc}
_02230830:
	ldrb r0, [r4, #0x19]
	cmp r0, #1
	beq _0223083C
	ldrb r0, [r4, #0x19]
	cmp r0, #3
	bne _022308D8
_0223083C:
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	bne _022308D8
	ldrh r1, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r5, [r4, #0xc]
	blx FUN_020D2894
	ldrh r2, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r1, [r4, #0xc]
	blx FUN_020D4A50
	bl ov74_022311AC
	ldr r1, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, r0
	bne _022308D8
	bl ov74_022311BC
	ldr r1, [r5]
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x1c
	cmp r1, r0
	bhi _022308D8
	ldr r0, [r4, #0xc]
	bl ov74_022313F0
	ldr r0, [r5, #8]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrb r0, [r4, #0x1c]
	cmp r1, r0
	bne _022308D8
	ldr r0, [r4, #0xc]
	bl ov74_0223145C
	movs r0, #0
	strb r0, [r4, #0x19]
	ldr r0, [r4, #0xc]
	bl ov74_02231424
	cmp r0, #0
	beq _022308CA
	ldr r0, [r5, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xfd
	bne _022308AA
	adds r0, r6, #0
	bl ov74_0223078C
	b _022308BC
_022308AA:
	ldr r2, [r5, #0xc]
	ldr r1, [r4, #0xc]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	adds r0, r1, r0
	ldr r1, [r4, #4]
	lsrs r2, r2, #8
	blx FUN_020D4A50
_022308BC:
	ldr r1, [r5, #8]
	ldr r0, _022308DC @ =0xFFFF00FF
	ands r0, r1
	str r0, [r5, #8]
	movs r0, #4
	strb r0, [r4, #0x1b]
	pop {r4, r5, r6, pc}
_022308CA:
	ldr r1, [r5, #8]
	ldr r0, _022308DC @ =0xFFFF00FF
	ands r1, r0
	movs r0, #1
	lsls r0, r0, #8
	orrs r0, r1
	str r0, [r5, #8]
_022308D8:
	pop {r4, r5, r6, pc}
	nop
_022308DC: .4byte 0xFFFF00FF
	thumb_func_end ov74_02230818

	thumb_func_start ov74_022308E0
ov74_022308E0: @ 0x022308E0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #4]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _02230962
	ldrh r0, [r4, #4]
	cmp r0, #7
	beq _0223092A
	cmp r0, #9
	beq _02230938
	cmp r0, #0x15
	bne _02230962
	bl ov74_02231064
	cmp r0, #0xa
	beq _0223090A
	cmp r0, #0xb
	bne _02230962
_0223090A:
	bl ov74_02231184
	ldrb r0, [r0, #0x18]
	cmp r0, #1
	beq _0223091A
	cmp r0, #2
	beq _02230922
	pop {r4, pc}
_0223091A:
	adds r0, r4, #0
	bl ov74_02230714
	pop {r4, pc}
_02230922:
	adds r0, r4, #0
	bl ov74_02230818
	pop {r4, pc}
_0223092A:
	movs r0, #1
	bl ov74_02231124
	movs r0, #0
	bl ov74_02231130
	pop {r4, pc}
_02230938:
	bl ov74_02231118
	cmp r0, #0
	beq _02230946
	movs r0, #1
	bl ov74_02231130
_02230946:
	bl ov74_02231064
	cmp r0, #0xa
	beq _02230954
	cmp r0, #0xb
	beq _0223095C
	pop {r4, pc}
_02230954:
	ldrh r0, [r4, #0x12]
	bl ov74_0222FEA0
	pop {r4, pc}
_0223095C:
	movs r0, #0
	bl ov74_02231124
_02230962:
	pop {r4, pc}
	thumb_func_end ov74_022308E0

	thumb_func_start ov74_02230964
ov74_02230964: @ 0x02230964
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _0223097A
	bl ov74_0222FE78
	cmp r0, #0
	bne _02230984
	bl ov74_02230674
	pop {r3, pc}
_0223097A:
	bl ov74_02231448
	movs r0, #4
	bl ov74_02231070
_02230984:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02230964

	thumb_func_start ov74_02230988
ov74_02230988: @ 0x02230988
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _022309A0
	bl ov74_022314BC
	cmp r0, #0
	beq _022309A8
	movs r0, #2
	bl ov74_02231070
	pop {r3, pc}
_022309A0:
	bl ov74_02231448
	bl ov74_0222FE4C
_022309A8:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02230988

	thumb_func_start ov74_022309AC
ov74_022309AC: @ 0x022309AC
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _022309E2
	movs r0, #0
	bl ov74_0223110C
	bl ov74_0223107C
	cmp r0, #0xc
	bne _022309D2
	bl ov74_02231744
	cmp r0, #0
	beq _022309EC
	movs r0, #3
	bl ov74_02231070
	pop {r3, pc}
_022309D2:
	bl ov74_02231704
	cmp r0, #0
	beq _022309EC
	movs r0, #3
	bl ov74_02231070
	pop {r3, pc}
_022309E2:
	bl ov74_02231448
	movs r0, #4
	bl ov74_02231070
_022309EC:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022309AC

	thumb_func_start ov74_022309F0
ov74_022309F0: @ 0x022309F0
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _02230A06
	movs r0, #0xc
	bl ov74_02231070
	movs r0, #1
	bl ov74_0223113C
	pop {r3, pc}
_02230A06:
	bl ov74_02231448
	movs r0, #4
	bl ov74_02231070
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022309F0

	thumb_func_start ov74_02230A14
ov74_02230A14: @ 0x02230A14
	push {r3, lr}
	ldr r0, _02230A30 @ =ov74_0222FFFC
	blx FUN_020DEBA8
	cmp r0, #0
	beq _02230A2A
	movs r0, #4
	bl ov74_02231070
	movs r0, #0
	pop {r3, pc}
_02230A2A:
	movs r0, #1
	pop {r3, pc}
	nop
_02230A30: .4byte ov74_0222FFFC
	thumb_func_end ov74_02230A14

	thumb_func_start ov74_02230A34
ov74_02230A34: @ 0x02230A34
	push {r3, lr}
	bl ov74_02231064
	cmp r0, #0
	beq _02230A46
	cmp r0, #1
	beq _02230A46
	cmp r0, #2
	bne _02230A4A
_02230A46:
	bl ov74_022314A0
_02230A4A:
	pop {r3, pc}
	thumb_func_end ov74_02230A34

	thumb_func_start ov74_02230A4C
ov74_02230A4C: @ 0x02230A4C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov74_02231054
	ldrh r0, [r0, #0x34]
	cmp r4, r0
	bhi _02230A70
	adds r0, r5, #0
	adds r1, r4, #0
	blx FUN_020D2894
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov74_02231460
_02230A70:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov74_02230A4C

	thumb_func_start ov74_02230A74
ov74_02230A74: @ 0x02230A74
	movs r0, #0x17
	lsls r0, r0, #6
	bx lr
	.align 2, 0
	thumb_func_end ov74_02230A74

	thumb_func_start ov74_02230A7C
ov74_02230A7C: @ 0x02230A7C
	movs r0, #0x17
	lsls r0, r0, #6
	bx lr
	.align 2, 0
	thumb_func_end ov74_02230A7C

	thumb_func_start ov74_02230A84
ov74_02230A84: @ 0x02230A84
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	adds r5, r0, #0
	bl ov74_02231054
	bl ov74_0223105C
	adds r4, r0, #0
	movs r0, #0x1f
	adds r1, r7, #0
	ands r1, r0
	beq _02230AA2
	movs r0, #0x20
	subs r0, r0, r1
	adds r7, r7, r0
_02230AA2:
	movs r1, #0
	strb r1, [r4]
	strb r1, [r4, #1]
	strb r1, [r4, #2]
	movs r0, #4
	strb r0, [r4, #3]
	ldr r0, _02230BA8 @ =0x00400131
	str r0, [r4, #4]
	movs r0, #0xf
	strh r1, [r4, #0xc]
	lsls r0, r0, #8
	str r7, [r4, #0x34]
	adds r7, r7, r0
	str r7, [r4, #0x38]
	bl ov74_02230A74
	str r0, [r4, #0x2c]
	adds r7, r7, r0
	str r7, [r4, #0x3c]
	bl ov74_02230A7C
	adds r7, r7, r0
	str r0, [r4, #0x30]
	adds r0, r7, #0
	str r7, [r4, #0x28]
	adds r0, #0xc0
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x34]
	movs r1, #2
	adds r7, #0xe0
	blx FUN_020DE248
	bl ov74_02230A14
	str r0, [r4, #0x10]
	movs r2, #0
	str r2, [r4, #0x14]
	str r2, [r4, #0x18]
	str r2, [r4, #0x1c]
	str r2, [r4, #0x20]
	ldr r0, [r4, #0x40]
	movs r6, #0xff
	bics r0, r6
	adds r3, r0, #0
	movs r1, #0xf
	orrs r3, r1
	ldr r0, _02230BAC @ =0xFFFFF0FF
	adds r1, #0xf1
	ands r0, r3
	orrs r1, r0
	ldr r0, _02230BB0 @ =0xFFFF0FFF
	ands r1, r0
	movs r0, #1
	lsls r0, r0, #0xc
	orrs r0, r1
	str r0, [r4, #0x40]
	ldr r3, [r5]
	ldr r1, [r4, #0x44]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r3, r3, #0x18
	adds r0, r4, #0
	bics r1, r6
	lsrs r3, r3, #0x18
	orrs r3, r1
	ldr r1, _02230BAC @ =0xFFFFF0FF
	str r3, [r4, #0x44]
	ands r1, r3
	ldr r3, [r5]
	adds r0, #0x44
	lsls r3, r3, #0x14
	lsrs r3, r3, #0x1c
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x14
	orrs r3, r1
	ldr r1, _02230BB0 @ =0xFFFF0FFF
	str r3, [r4, #0x44]
	ands r1, r3
	ldr r3, [r5]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x1c
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x10
	orrs r1, r3
	str r1, [r4, #0x44]
	ldr r1, [r0]
	ldr r3, [r5]
	lsls r1, r1, #0x10
	lsrs r3, r3, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r3, #0x10
	orrs r1, r3
	str r1, [r0]
	ldr r0, [r5, #8]
	ldr r1, [r5, #4]
	adds r3, r4, #0
	b _02230B7C
_02230B64:
	ldrh r6, [r0]
	adds r5, r3, #0
	adds r5, #0x48
	strh r6, [r5]
	adds r5, r3, #0
	ldrh r6, [r1]
	adds r5, #0x60
	adds r3, r3, #2
	strh r6, [r5]
	adds r2, r2, #1
	adds r0, r0, #2
	adds r1, r1, #2
_02230B7C:
	cmp r0, #0
	beq _02230B84
	cmp r2, #0xc
	blo _02230B64
_02230B84:
	ldr r1, [r4, #0x40]
	ldr r0, [r4, #0x44]
	str r1, [r4, #0x78]
	str r0, [r4, #0x7c]
	bl ov74_02231194
	bl ov74_02231184
	str r7, [r0, #8]
	ldr r0, [r4, #0x2c]
	adds r7, r7, r0
	bl ov74_02231184
	str r7, [r0, #0xc]
	blx FUN_020DF250
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230BA8: .4byte 0x00400131
_02230BAC: .4byte 0xFFFFF0FF
_02230BB0: .4byte 0xFFFF0FFF
	thumb_func_end ov74_02230A84

	thumb_func_start ov74_02230BB4
ov74_02230BB4: @ 0x02230BB4
	push {r3, r4, r5, lr}
	bl ov74_02231184
	adds r4, r0, #0
	ldrb r0, [r4, #0x19]
	cmp r0, #1
	bne _02230BD2
	ldrb r0, [r4, #0x1a]
	subs r0, r0, #1
	strb r0, [r4, #0x1a]
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _02230C08
	movs r0, #0
	strb r0, [r4, #0x19]
_02230BD2:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	bne _02230C08
	bl ov74_02231260
	movs r1, #0x40
	subs r5, r1, r0
	ldrb r0, [r4, #0x1c]
	adds r2, r5, #0
	movs r3, #3
	str r0, [sp]
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	bl ov74_022312C0
	bl ov74_02231260
	adds r1, r0, #0
	ldr r0, [r4, #8]
	ldr r2, _02230C0C @ =0x0000FFFF
	adds r1, r5, r1
	bl ov74_02230A4C
	movs r0, #1
	strb r0, [r4, #0x19]
	movs r0, #0x3c
	strb r0, [r4, #0x1a]
_02230C08:
	pop {r3, r4, r5, pc}
	nop
_02230C0C: .4byte 0x0000FFFF
	thumb_func_end ov74_02230BB4

	thumb_func_start ov74_02230C10
ov74_02230C10: @ 0x02230C10
	push {r3, r4, r5, r6, r7, lr}
	bl ov74_02231184
	adds r4, r0, #0
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	bne _02230CC6
	ldrb r0, [r4, #0x1c]
	cmp r0, #0xfd
	bne _02230C88
	bl ov74_0223115C
	adds r5, r0, #0
	movs r1, #0
	adds r2, r5, #0
_02230C2E:
	ldrb r0, [r2, #9]
	cmp r0, #0
	beq _02230C6E
	adds r6, r1, #0
	movs r0, #0xc
	muls r6, r0, r6
	adds r0, r5, r6
	ldrh r0, [r0, #6]
	movs r1, #1
	movs r2, #0
	lsls r1, r0
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0xfd
	str r0, [sp]
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	adds r3, r2, #0
	bl ov74_022312C0
	bl ov74_02231260
	adds r1, r0, #0
	ldr r0, [r4, #8]
	adds r2, r7, #0
	bl ov74_02230A4C
	adds r5, #9
	ldrb r0, [r5, r6]
	subs r0, r0, #1
	strb r0, [r5, r6]
	pop {r3, r4, r5, r6, r7, pc}
_02230C6E:
	adds r1, r1, #1
	adds r2, #0xc
	cmp r1, #8
	blt _02230C2E
	ldrb r0, [r4, #0x1a]
	subs r0, r0, #1
	strb r0, [r4, #0x1a]
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _02230CC6
	movs r0, #2
	strb r0, [r4, #0x19]
	pop {r3, r4, r5, r6, r7, pc}
_02230C88:
	bl ov74_02231260
	bl ov74_02230A74
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #8]
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
	bne _02230CAA
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	bne _02230CA6
	movs r0, #2
	strb r0, [r4, #0x19]
	pop {r3, r4, r5, r6, r7, pc}
_02230CA6:
	subs r0, r0, #1
	strb r0, [r4, #0x1b]
_02230CAA:
	ldrb r0, [r4, #0x1c]
	movs r2, #0
	str r0, [sp]
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	bl ov74_022312C0
	bl ov74_02231260
	adds r1, r0, #0
	ldr r0, [r4, #8]
	ldr r2, _02230CC8 @ =0x0000FFFF
	bl ov74_02230A4C
_02230CC6:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02230CC8: .4byte 0x0000FFFF
	thumb_func_end ov74_02230C10

	thumb_func_start ov74_02230CCC
ov74_02230CCC: @ 0x02230CCC
	push {r3, lr}
	bl ov74_02231184
	ldrb r0, [r0, #0x18]
	cmp r0, #1
	beq _02230CDE
	cmp r0, #2
	beq _02230CE4
	pop {r3, pc}
_02230CDE:
	bl ov74_02230BB4
	pop {r3, pc}
_02230CE4:
	bl ov74_02230C10
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02230CCC

	thumb_func_start ov74_02230CEC
ov74_02230CEC: @ 0x02230CEC
	push {r4, lr}
	bl ov74_02231154
	adds r4, r0, #0
	bl ov74_02231064
	cmp r0, #6
	beq _02230D02
	cmp r0, #0xb
	beq _02230D12
	pop {r4, pc}
_02230D02:
	movs r0, #7
	lsls r0, r0, #6
	ldrh r1, [r4, r0]
	cmp r1, #0
	beq _02230D16
	subs r1, r1, #1
	strh r1, [r4, r0]
	pop {r4, pc}
_02230D12:
	bl ov74_02230CCC
_02230D16:
	pop {r4, pc}
	thumb_func_end ov74_02230CEC

	thumb_func_start ov74_02230D18
ov74_02230D18: @ 0x02230D18
	push {r3, lr}
	bl ov74_02231064
	cmp r0, #0xa
	bne _02230D26
	bl ov74_02230CCC
_02230D26:
	pop {r3, pc}
	thumb_func_end ov74_02230D18

	thumb_func_start ov74_02230D28
ov74_02230D28: @ 0x02230D28
	push {r3, lr}
	bl ov74_02231064
	cmp r0, #0xc
	beq _02230D6A
	bl ov74_0223107C
	cmp r0, #0xc
	bne _02230D48
	bl ov74_02231064
	cmp r0, #7
	bne _02230D6A
	bl ov74_02231724
	pop {r3, pc}
_02230D48:
	bl ov74_02231094
	cmp r0, #1
	beq _02230D56
	cmp r0, #2
	beq _02230D5C
	b _02230D62
_02230D56:
	bl ov74_02230CEC
	pop {r3, pc}
_02230D5C:
	bl ov74_02230D18
	pop {r3, pc}
_02230D62:
	bl ov74_0223105C
	bl ov74_02231064
_02230D6A:
	pop {r3, pc}
	thumb_func_end ov74_02230D28

	thumb_func_start ov74_02230D6C
ov74_02230D6C: @ 0x02230D6C
	push {r3, lr}
	bl ov74_02231164
	movs r0, #1
	bl ov74_022310A0
	bl ov74_02230A34
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02230D6C

	thumb_func_start ov74_02230D80
ov74_02230D80: @ 0x02230D80
	push {r4, lr}
	bl ov74_02231094
	movs r4, #0
	cmp r0, #1
	bne _02230DAE
	bl ov74_02231154
	ldr r1, _02230DB4 @ =0x000001C3
	ldrb r1, [r0, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	cmp r1, #1
	bne _02230DAE
	adds r2, r4, #0
_02230D9E:
	ldr r1, [r0]
	cmp r1, #0
	beq _02230DA6
	adds r4, r4, #1
_02230DA6:
	adds r2, r2, #1
	adds r0, #0x38
	cmp r2, #8
	blo _02230D9E
_02230DAE:
	adds r0, r4, #0
	pop {r4, pc}
	nop
_02230DB4: .4byte 0x000001C3
	thumb_func_end ov74_02230D80

	thumb_func_start ov74_02230DB8
ov74_02230DB8: @ 0x02230DB8
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_02231094
	cmp r0, #1
	bne _02230DEA
	bl ov74_02231064
	cmp r0, #7
	bne _02230DEA
	bl ov74_02231154
	ldr r1, _02230DF0 @ =0x000001C3
	ldrb r1, [r0, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	cmp r1, #1
	bne _02230DEA
	movs r1, #0x38
	muls r1, r4, r1
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02230DEA
	movs r0, #1
	pop {r4, pc}
_02230DEA:
	movs r0, #0
	pop {r4, pc}
	nop
_02230DF0: .4byte 0x000001C3
	thumb_func_end ov74_02230DB8

	thumb_func_start ov74_02230DF4
ov74_02230DF4: @ 0x02230DF4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov74_02231094
	cmp r0, #1
	bne _02230E3E
	bl ov74_02231064
	cmp r0, #7
	bne _02230E3E
	bl ov74_02231154
	ldr r2, _02230E40 @ =0x000001C3
	ldrb r3, [r0, r2]
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x1c
	cmp r1, #1
	bne _02230E3E
	movs r1, #0x38
	adds r5, r4, #0
	muls r5, r1, r5
	ldr r5, [r0, r5]
	cmp r5, #0
	beq _02230E3E
	movs r5, #0xf
	lsls r4, r4, #0x18
	bics r3, r5
	lsrs r5, r4, #0x18
	movs r4, #0xf
	ands r4, r5
	orrs r3, r4
	strb r3, [r0, r2]
	movs r2, #0x78
	lsls r1, r1, #3
	strh r2, [r0, r1]
	bl ov74_02231584
_02230E3E:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02230E40: .4byte 0x000001C3
	thumb_func_end ov74_02230DF4

	thumb_func_start ov74_02230E44
ov74_02230E44: @ 0x02230E44
	push {r4, lr}
	bl ov74_02231094
	movs r4, #0
	cmp r0, #2
	bne _02230E76
	bl ov74_0223115C
	adds r1, r0, #0
	adds r1, #0x60
	ldrb r1, [r1]
	cmp r1, #2
	bne _02230E76
	adds r2, r4, #0
_02230E60:
	ldr r1, [r0]
	cmp r1, #0
	beq _02230E6E
	ldrb r1, [r0, #0xa]
	cmp r1, #0
	beq _02230E6E
	adds r4, r4, #1
_02230E6E:
	adds r2, r2, #1
	adds r0, #0xc
	cmp r2, #8
	blo _02230E60
_02230E76:
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_02230E44

	thumb_func_start ov74_02230E7C
ov74_02230E7C: @ 0x02230E7C
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _02230E8C
	movs r0, #0
	pop {r3, pc}
_02230E8C:
	blx FUN_020DEF44
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02230E7C

	thumb_func_start ov74_02230E94
ov74_02230E94: @ 0x02230E94
	push {r3, lr}
	bl ov74_02231094
	cmp r0, #1
	beq _02230EA4
	cmp r0, #2
	beq _02230EAA
	b _02230EB0
_02230EA4:
	bl ov74_02230D80
	pop {r3, pc}
_02230EAA:
	bl ov74_02230E44
	pop {r3, pc}
_02230EB0:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov74_02230E94

	thumb_func_start ov74_02230EB4
ov74_02230EB4: @ 0x02230EB4
	push {r3, r4, r5, lr}
	bl ov74_02231184
	adds r5, r0, #0
	bl ov74_022311DC
	adds r4, r0, #0
	bl ov74_02231094
	cmp r0, #1
	bne _02230EE6
	movs r0, #1
	strb r0, [r5, #0x18]
	movs r1, #0
	strb r1, [r5, #0x19]
	adds r4, #8
	str r4, [r5]
	str r4, [r5, #4]
	str r1, [r5, #0x10]
	str r1, [r5, #0x14]
	movs r0, #0x78
	strb r0, [r5, #0x1a]
	strb r1, [r5, #0x1b]
	movs r0, #0xfd
	strb r0, [r5, #0x1c]
_02230EE6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_02230EB4

	thumb_func_start ov74_02230EE8
ov74_02230EE8: @ 0x02230EE8
	push {r4, lr}
	bl ov74_02231184
	adds r4, r0, #0
	bl ov74_022311DC
	movs r1, #1
	strb r1, [r4, #0x18]
	movs r1, #0
	strb r1, [r4, #0x19]
	adds r0, #8
	str r0, [r4]
	str r0, [r4, #4]
	movs r0, #0x30
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	movs r0, #0x78
	strb r0, [r4, #0x1a]
	strb r1, [r4, #0x1b]
	movs r0, #0xfe
	strb r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov74_02230EE8

	thumb_func_start ov74_02230F14
ov74_02230F14: @ 0x02230F14
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl ov74_02231184
	cmp r4, #0xf0
	bgt _02230F3E
	movs r1, #2
	strb r1, [r0, #0x18]
	movs r1, #3
	strb r1, [r0, #0x19]
	str r5, [r0]
	str r5, [r0, #4]
	str r6, [r0, #0x10]
	movs r2, #0
	str r2, [r0, #0x14]
	movs r1, #0x78
	strb r1, [r0, #0x1a]
	strb r2, [r0, #0x1b]
	strb r4, [r0, #0x1c]
_02230F3E:
	pop {r4, r5, r6, pc}
	thumb_func_end ov74_02230F14

	thumb_func_start ov74_02230F40
ov74_02230F40: @ 0x02230F40
	push {r3, lr}
	bl ov74_02231094
	cmp r0, #1
	beq _02230F4E
	cmp r0, #2
	bne _02230F68
_02230F4E:
	bl ov74_02231064
	cmp r0, #0xa
	beq _02230F5A
	cmp r0, #0xb
	bne _02230F68
_02230F5A:
	bl ov74_02231184
	ldrb r0, [r0, #0x19]
	cmp r0, #2
	bne _02230F68
	movs r0, #1
	pop {r3, pc}
_02230F68:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov74_02230F40

	thumb_func_start ov74_02230F6C
ov74_02230F6C: @ 0x02230F6C
	push {r3, lr}
	bl ov74_02231094
	cmp r0, #1
	beq _02230F7A
	cmp r0, #2
	bne _02230F94
_02230F7A:
	bl ov74_02231064
	cmp r0, #0xa
	beq _02230F86
	cmp r0, #0xb
	bne _02230F94
_02230F86:
	bl ov74_02231184
	ldrb r0, [r0, #0x19]
	cmp r0, #2
	bne _02230F94
	movs r0, #1
	pop {r3, pc}
_02230F94:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov74_02230F6C

	thumb_func_start ov74_02230F98
ov74_02230F98: @ 0x02230F98
	push {r3, lr}
	bl ov74_02231094
	cmp r0, #1
	beq _02230FA6
	cmp r0, #2
	bne _02230FD0
_02230FA6:
	bl ov74_02231064
	cmp r0, #0xa
	beq _02230FB2
	cmp r0, #0xb
	bne _02230FD0
_02230FB2:
	bl ov74_02231184
	ldrb r1, [r0, #0x19]
	cmp r1, #0
	bne _02230FD0
	ldr r1, [r0, #0xc]
	ldr r1, [r1, #8]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x18
	bne _02230FD0
	ldrb r0, [r0, #0x1b]
	cmp r0, #4
	bhs _02230FD0
	movs r0, #1
	pop {r3, pc}
_02230FD0:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov74_02230F98

	thumb_func_start ov74_02230FD4
ov74_02230FD4: @ 0x02230FD4
	push {r3, lr}
	bl ov74_02231094
	cmp r0, #2
	bne _02231000
	bl ov74_0223115C
	movs r2, #0
_02230FE4:
	ldr r1, [r0]
	cmp r1, #0
	beq _02230FF4
	ldrb r1, [r0, #0xa]
	cmp r1, #0
	beq _02230FF4
	movs r0, #1
	pop {r3, pc}
_02230FF4:
	adds r2, r2, #1
	adds r0, #0xc
	cmp r2, #8
	blt _02230FE4
	movs r0, #0
	pop {r3, pc}
_02231000:
	bl ov74_02231118
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02230FD4

	thumb_func_start ov74_02231008
ov74_02231008: @ 0x02231008
	push {r4, lr}
	movs r0, #0xc
	bl ov74_02231088
	bl ov74_02231064
	cmp r0, #0
	beq _02231022
	cmp r0, #1
	beq _02231022
	cmp r0, #9
	beq _0223102E
	pop {r4, pc}
_02231022:
	blx FUN_020DE458
	movs r0, #1
	bl ov74_0223113C
	pop {r4, pc}
_0223102E:
	bl ov74_02231118
	cmp r0, #0
	bne _02231044
	bl ov74_0223105C
	adds r4, r0, #0
	bl ov74_02231724
	movs r0, #1
	str r0, [r4, #0x1c]
_02231044:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_02231008

	thumb_func_start ov74_02231048
ov74_02231048: @ 0x02231048
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x20]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02231048

	thumb_func_start ov74_02231054
ov74_02231054: @ 0x02231054
	ldr r0, _02231058 @ =0x0223C920
	bx lr
	.align 2, 0
_02231058: .4byte 0x0223C920
	thumb_func_end ov74_02231054

	thumb_func_start ov74_0223105C
ov74_0223105C: @ 0x0223105C
	ldr r0, _02231060 @ =0x0223D0C4
	bx lr
	.align 2, 0
_02231060: .4byte 0x0223D0C4
	thumb_func_end ov74_0223105C

	thumb_func_start ov74_02231064
ov74_02231064: @ 0x02231064
	push {r3, lr}
	bl ov74_0223105C
	ldrb r0, [r0]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02231064

	thumb_func_start ov74_02231070
ov74_02231070: @ 0x02231070
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_0223105C
	strb r4, [r0]
	pop {r4, pc}
	thumb_func_end ov74_02231070

	thumb_func_start ov74_0223107C
ov74_0223107C: @ 0x0223107C
	push {r3, lr}
	bl ov74_0223105C
	ldrb r0, [r0, #1]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_0223107C

	thumb_func_start ov74_02231088
ov74_02231088: @ 0x02231088
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_0223105C
	strb r4, [r0, #1]
	pop {r4, pc}
	thumb_func_end ov74_02231088

	thumb_func_start ov74_02231094
ov74_02231094: @ 0x02231094
	push {r3, lr}
	bl ov74_0223105C
	ldrb r0, [r0, #2]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02231094

	thumb_func_start ov74_022310A0
ov74_022310A0: @ 0x022310A0
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_0223105C
	strb r4, [r0, #2]
	pop {r4, pc}
	thumb_func_end ov74_022310A0

	thumb_func_start ov74_022310AC
ov74_022310AC: @ 0x022310AC
	push {r3, lr}
	bl ov74_0223105C
	ldrb r0, [r0, #3]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022310AC

	thumb_func_start ov74_022310B8
ov74_022310B8: @ 0x022310B8
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_02231054
	strh r4, [r0, #0x32]
	pop {r4, pc}
	thumb_func_end ov74_022310B8

	thumb_func_start ov74_022310C4
ov74_022310C4: @ 0x022310C4
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x24]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022310C4

	thumb_func_start ov74_022310D0
ov74_022310D0: @ 0x022310D0
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x2c]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022310D0

	thumb_func_start ov74_022310DC
ov74_022310DC: @ 0x022310DC
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x30]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022310DC

	thumb_func_start ov74_022310E8
ov74_022310E8: @ 0x022310E8
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x38]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022310E8

	thumb_func_start ov74_022310F4
ov74_022310F4: @ 0x022310F4
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x3c]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022310F4

	thumb_func_start ov74_02231100
ov74_02231100: @ 0x02231100
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x28]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02231100

	thumb_func_start ov74_0223110C
ov74_0223110C: @ 0x0223110C
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_0223105C
	strh r4, [r0, #0xc]
	pop {r4, pc}
	thumb_func_end ov74_0223110C

	thumb_func_start ov74_02231118
ov74_02231118: @ 0x02231118
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x14]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02231118

	thumb_func_start ov74_02231124
ov74_02231124: @ 0x02231124
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_0223105C
	str r4, [r0, #0x14]
	pop {r4, pc}
	thumb_func_end ov74_02231124

	thumb_func_start ov74_02231130
ov74_02231130: @ 0x02231130
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_0223105C
	str r4, [r0, #0x18]
	pop {r4, pc}
	thumb_func_end ov74_02231130

	thumb_func_start ov74_0223113C
ov74_0223113C: @ 0x0223113C
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_0223105C
	str r4, [r0, #0x20]
	pop {r4, pc}
	thumb_func_end ov74_0223113C

	thumb_func_start ov74_02231148
ov74_02231148: @ 0x02231148
	push {r3, lr}
	bl ov74_0223105C
	adds r0, #0x90
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02231148

	thumb_func_start ov74_02231154
ov74_02231154: @ 0x02231154
	ldr r3, _02231158 @ =ov74_02231148
	bx r3
	.align 2, 0
_02231158: .4byte ov74_02231148
	thumb_func_end ov74_02231154

	thumb_func_start ov74_0223115C
ov74_0223115C: @ 0x0223115C
	ldr r3, _02231160 @ =ov74_02231148
	bx r3
	.align 2, 0
_02231160: .4byte ov74_02231148
	thumb_func_end ov74_0223115C

	thumb_func_start ov74_02231164
ov74_02231164: @ 0x02231164
	push {r4, lr}
	bl ov74_02231154
	movs r2, #0x71
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	movs r1, #0x46
	lsls r1, r1, #2
	adds r0, r1, #0
	adds r0, #0xa8
	strh r1, [r4, r0]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_02231164

	thumb_func_start ov74_02231184
ov74_02231184: @ 0x02231184
	push {r3, lr}
	bl ov74_0223105C
	movs r1, #0x95
	lsls r1, r1, #2
	adds r0, r0, r1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02231184

	thumb_func_start ov74_02231194
ov74_02231194: @ 0x02231194
	push {r3, lr}
	bl ov74_02231184
	movs r1, #0
	strb r1, [r0, #0x18]
	pop {r3, pc}
	thumb_func_end ov74_02231194

	thumb_func_start ov74_022311A0
ov74_022311A0: @ 0x022311A0
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #4]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022311A0

	thumb_func_start ov74_022311AC
ov74_022311AC: @ 0x022311AC
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x40]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022311AC

	thumb_func_start ov74_022311BC
ov74_022311BC: @ 0x022311BC
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x40]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1c
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022311BC

	thumb_func_start ov74_022311CC
ov74_022311CC: @ 0x022311CC
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x44]
	lsrs r0, r0, #0x10
	pop {r3, pc}
	thumb_func_end ov74_022311CC

	thumb_func_start ov74_022311D8
ov74_022311D8: @ 0x022311D8
	movs r0, #0x38
	bx lr
	thumb_func_end ov74_022311D8

	thumb_func_start ov74_022311DC
ov74_022311DC: @ 0x022311DC
	push {r3, lr}
	bl ov74_0223105C
	adds r0, #0x40
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022311DC

	thumb_func_start ov74_022311E8
ov74_022311E8: @ 0x022311E8
	push {r3, lr}
	bl ov74_0223105C
	adds r0, #0x78
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022311E8

	thumb_func_start ov74_022311F4
ov74_022311F4: @ 0x022311F4
	push {r3}
	sub sp, #4
	movs r2, #0
	str r2, [sp]
	add r3, sp, #0
_022311FE:
	adds r1, r0, r2
	ldrb r1, [r1, #2]
	adds r2, r2, #1
	strb r1, [r3]
	adds r3, r3, #1
	cmp r2, #4
	blo _022311FE
	ldr r0, [sp]
	add sp, #4
	pop {r3}
	bx lr
	thumb_func_end ov74_022311F4

	thumb_func_start ov74_02231214
ov74_02231214: @ 0x02231214
	push {r3}
	sub sp, #4
	movs r2, #0
	add r1, sp, #0
	strh r2, [r1]
	add r3, sp, #0
_02231220:
	ldrb r1, [r0, r2]
	adds r2, r2, #1
	strb r1, [r3]
	adds r3, r3, #1
	cmp r2, #2
	blo _02231220
	add r1, sp, #0
	movs r0, #0
	ldrsh r0, [r1, r0]
	add sp, #4
	pop {r3}
	bx lr
	thumb_func_end ov74_02231214

	thumb_func_start ov74_02231238
ov74_02231238: @ 0x02231238
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r1, _0223125C @ =0x00002710
	adds r6, r0, #0
	adds r4, r2, #0
	blx FUN_020F2BA4
	str r1, [r5]
	ldr r1, _0223125C @ =0x00002710
	adds r0, r6, #0
	blx FUN_020F2BA4
	ldr r1, _0223125C @ =0x00002710
	blx FUN_020F2BA4
	str r1, [r4]
	pop {r4, r5, r6, pc}
	nop
_0223125C: .4byte 0x00002710
	thumb_func_end ov74_02231238

	thumb_func_start ov74_02231260
ov74_02231260: @ 0x02231260
	movs r0, #0x10
	bx lr
	thumb_func_end ov74_02231260

	thumb_func_start ov74_02231264
ov74_02231264: @ 0x02231264
	push {r4, lr}
	ldr r0, _02231278 @ =0x04000006
	ldrh r4, [r0]
	blx FUN_020D34B0
	adds r1, r0, r4
	movs r0, #1
	bics r1, r0
	adds r0, r1, #1
	pop {r4, pc}
	.align 2, 0
_02231278: .4byte 0x04000006
	thumb_func_end ov74_02231264

	thumb_func_start ov74_0223127C
ov74_0223127C: @ 0x0223127C
	push {r4, r5, r6, r7}
	adds r3, r0, #0
	movs r0, #0
	lsrs r1, r1, #2
	beq _022312B2
	ldr r4, _022312B8 @ =0x00269EC3
_02231288:
	ldr r5, _022312BC @ =0x5D588B65
	ldr r6, _022312BC @ =0x5D588B65
	muls r5, r3, r5
	ldr r3, _022312B8 @ =0x00269EC3
	adds r0, r0, #1
	adds r3, r5, r3
	lsrs r5, r3, #0x10
	muls r6, r3, r6
	adds r3, r6, r4
	lsls r5, r5, #0x10
	lsrs r7, r3, #0x10
	lsrs r5, r5, #0x10
	lsls r7, r7, #0x10
	ldr r6, [r2]
	lsls r5, r5, #0x10
	lsrs r7, r7, #0x10
	orrs r5, r7
	eors r5, r6
	stm r2!, {r5}
	cmp r0, r1
	blo _02231288
_022312B2:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_022312B8: .4byte 0x00269EC3
_022312BC: .4byte 0x5D588B65
	thumb_func_end ov74_0223127C

	thumb_func_start ov74_022312C0
ov74_022312C0: @ 0x022312C0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	str r3, [sp]
	bl ov74_022311DC
	adds r4, r0, #0
	ldr r0, [r5]
	movs r1, #0xff
	bics r0, r1
	ldr r1, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	orrs r1, r0
	ldr r0, _022313E4 @ =0xFFFFF0FF
	str r1, [r5]
	ands r0, r1
	ldr r1, [r4]
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x1c
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x14
	orrs r1, r0
	ldr r0, _022313E8 @ =0xFFFF0FFF
	str r1, [r5]
	ands r0, r1
	ldr r1, [r4]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x1c
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x10
	orrs r0, r1
	str r0, [r5]
	bl ov74_02231264
	ldr r1, [r5]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r0, #0x10
	orrs r0, r1
	str r0, [r5]
	ldr r2, [r4, #4]
	ldr r1, [r5, #4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0xff
	lsls r2, r2, #0x18
	bics r1, r0
	lsrs r2, r2, #0x18
	orrs r2, r1
	ldr r1, _022313E4 @ =0xFFFFF0FF
	str r2, [r5, #4]
	ands r1, r2
	ldr r2, [r4, #4]
	lsls r2, r2, #0x14
	lsrs r2, r2, #0x1c
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x14
	orrs r2, r1
	ldr r1, _022313E8 @ =0xFFFF0FFF
	str r2, [r5, #4]
	ands r1, r2
	ldr r2, [r4, #4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x1c
	lsls r2, r2, #0x1c
	lsrs r2, r2, #0x10
	orrs r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [r5, #4]
	ldr r1, [r5, #8]
	bics r1, r0
	ldr r0, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r1, r0
	ldr r0, _022313EC @ =0xFFFF00FF
	ands r0, r1
	ldr r1, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	orrs r0, r1
	str r0, [r5, #8]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_020002D0
	ldr r1, [r5, #8]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	orrs r0, r1
	str r0, [r5, #8]
	bl ov74_02231260
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x18
	ldr r1, [r5, #0xc]
	movs r2, #0xff
	bics r1, r2
	lsrs r0, r0, #0x18
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r6, #8
	orrs r0, r1
	str r0, [r5, #0xc]
	cmp r6, #0
	beq _022313BE
	ldr r1, [r5, #0xc]
	adds r0, r7, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r1, r5, r1
	adds r2, r6, #0
	blx FUN_020D4A50
_022313BE:
	adds r0, r5, #0
	bl ov74_0223145C
	ldr r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1c
	cmp r0, #1
	bne _022313E2
	ldr r1, [r5, #0xc]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r1, r6, r1
	lsrs r0, r0, #0x10
	subs r1, r1, #4
	adds r2, r5, #4
	bl ov74_0223127C
_022313E2:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022313E4: .4byte 0xFFFFF0FF
_022313E8: .4byte 0xFFFF0FFF
_022313EC: .4byte 0xFFFF00FF
	thumb_func_end ov74_022312C0

	thumb_func_start ov74_022313F0
ov74_022313F0: @ 0x022313F0
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_022311DC
	ldr r0, [r4]
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x1c
	cmp r1, #1
	bne _02231420
	lsrs r0, r0, #0x10
	movs r1, #0xc
	adds r2, r4, #4
	bl ov74_0223127C
	ldr r1, [r4, #0xc]
	adds r4, #0x10
	lsls r2, r1, #0x18
	lsrs r2, r2, #0x18
	lsrs r1, r1, #8
	adds r1, r2, r1
	subs r1, #0x10
	adds r2, r4, #0
	bl ov74_0223127C
_02231420:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_022313F0

	thumb_func_start ov74_02231424
ov74_02231424: @ 0x02231424
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0xc]
	movs r0, #0
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	adds r1, r4, r1
	lsrs r2, r2, #8
	bl FUN_020002D0
	ldr r1, [r4, #8]
	lsrs r1, r1, #0x10
	cmp r1, r0
	bne _02231444
	movs r0, #1
	pop {r4, pc}
_02231444:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov74_02231424

	thumb_func_start ov74_02231448
ov74_02231448: @ 0x02231448
	bx lr
	.align 2, 0
	thumb_func_end ov74_02231448

	thumb_func_start ov74_0223144C
ov74_0223144C: @ 0x0223144C
	bx lr
	.align 2, 0
	thumb_func_end ov74_0223144C

	thumb_func_start ov74_02231450
ov74_02231450: @ 0x02231450
	bx lr
	.align 2, 0
	thumb_func_end ov74_02231450

	thumb_func_start ov74_02231454
ov74_02231454: @ 0x02231454
	bx lr
	.align 2, 0
	thumb_func_end ov74_02231454

	thumb_func_start ov74_02231458
ov74_02231458: @ 0x02231458
	bx lr
	.align 2, 0
	thumb_func_end ov74_02231458

	thumb_func_start ov74_0223145C
ov74_0223145C: @ 0x0223145C
	bx lr
	.align 2, 0
	thumb_func_end ov74_0223145C

	thumb_func_start ov74_02231460
ov74_02231460: @ 0x02231460
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	bl ov74_022310AC
	lsls r0, r0, #0x10
	lsls r3, r5, #0x10
	lsrs r0, r0, #0x10
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, _0223149C @ =ov74_02230018
	movs r1, #0
	adds r2, r6, #0
	lsrs r3, r3, #0x10
	blx FUN_020DFD7C
	cmp r0, #2
	beq _02231496
	bl ov74_02231448
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_02231496:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0223149C: .4byte ov74_02230018
	thumb_func_end ov74_02231460

	thumb_func_start ov74_022314A0
ov74_022314A0: @ 0x022314A0
	push {r3, lr}
	ldr r0, _022314B8 @ =ov74_02230030
	blx FUN_020DF2C4
	cmp r0, #2
	beq _022314B4
	bl ov74_02231448
	movs r0, #0
	pop {r3, pc}
_022314B4:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_022314B8: .4byte ov74_02230030
	thumb_func_end ov74_022314A0

	thumb_func_start ov74_022314BC
ov74_022314BC: @ 0x022314BC
	push {r3, lr}
	ldr r0, _022314D8 @ =ov74_02230070
	blx FUN_020DF338
	cmp r0, #2
	beq _022314D4
	bl ov74_02231448
	blx FUN_020D3F48
	movs r0, #0
	pop {r3, pc}
_022314D4:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_022314D8: .4byte ov74_02230070
	thumb_func_end ov74_022314BC

	thumb_func_start ov74_022314DC
ov74_022314DC: @ 0x022314DC
	push {r3, lr}
	adds r3, r0, #0
	movs r0, #0x1e
	str r0, [sp]
	lsls r3, r3, #0x10
	ldr r0, _02231504 @ =ov74_022300A8
	movs r1, #3
	movs r2, #0x11
	lsrs r3, r3, #0x10
	blx FUN_020E0EF4
	cmp r0, #2
	beq _022314FE
	bl ov74_02231448
	movs r0, #0
	pop {r3, pc}
_022314FE:
	movs r0, #1
	pop {r3, pc}
	nop
_02231504: .4byte ov74_022300A8
	thumb_func_end ov74_022314DC

	thumb_func_start ov74_02231508
ov74_02231508: @ 0x02231508
	push {r3, r4, r5, lr}
	bl ov74_02231054
	adds r5, r0, #0
	bl ov74_022311DC
	adds r4, r0, #0
	bl ov74_0223115C
	adds r0, #0x64
	ldrb r0, [r0]
	strh r0, [r5, #0x32]
	str r4, [r5]
	bl ov74_022311D8
	strh r0, [r5, #4]
	ldr r0, _02231540 @ =ov74_02230110
	adds r1, r5, #0
	blx FUN_020DF4F8
	cmp r0, #2
	beq _0223153C
	bl ov74_02231448
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223153C:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_02231540: .4byte ov74_02230110
	thumb_func_end ov74_02231508

	thumb_func_start ov74_02231544
ov74_02231544: @ 0x02231544
	push {r3, lr}
	ldr r0, _0223155C @ =ov74_02230138
	blx FUN_020DF680
	cmp r0, #2
	beq _02231558
	bl ov74_02231448
	movs r0, #0
	pop {r3, pc}
_02231558:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_0223155C: .4byte ov74_02230138
	thumb_func_end ov74_02231544

	thumb_func_start ov74_02231560
ov74_02231560: @ 0x02231560
	push {r3, lr}
	bl ov74_022310C4
	adds r1, r0, #0
	ldr r0, _02231580 @ =ov74_02230404
	blx FUN_020DF6D0
	cmp r0, #2
	beq _0223157A
	bl ov74_02231448
	movs r0, #0
	pop {r3, pc}
_0223157A:
	movs r0, #1
	pop {r3, pc}
	nop
_02231580: .4byte ov74_02230404
	thumb_func_end ov74_02231560

	thumb_func_start ov74_02231584
ov74_02231584: @ 0x02231584
	push {r3, r4, r5, lr}
	bl ov74_022310C4
	adds r4, r0, #0
	bl ov74_02231154
	ldr r2, _02231614 @ =0x000001C3
	movs r3, #0x38
	ldrb r1, [r0, r2]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r5, r1, #0
	muls r5, r3, r5
	adds r1, r0, r5
	adds r1, #0x34
	ldrb r1, [r1]
	strb r1, [r4, #8]
	ldrb r1, [r0, r2]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r5, r1, #0
	muls r5, r3, r5
	adds r1, r0, r5
	adds r1, #0x35
	ldrb r1, [r1]
	strb r1, [r4, #9]
	ldrb r1, [r0, r2]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r5, r1, #0
	muls r5, r3, r5
	ldrb r1, [r0, r5]
	strb r1, [r4, #0xa]
	ldrb r1, [r0, r2]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r5, r1, #0
	muls r5, r3, r5
	adds r1, r0, r5
	ldrb r1, [r1, #1]
	strb r1, [r4, #0xb]
	ldrb r1, [r0, r2]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r5, r1, #0
	muls r5, r3, r5
	adds r1, r0, r5
	ldrb r1, [r1, #2]
	strb r1, [r4, #0xc]
	ldrb r1, [r0, r2]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r2, r1, #0
	muls r2, r3, r2
	adds r0, r0, r2
	ldrb r0, [r0, #3]
	strb r0, [r4, #0xd]
	bl ov74_022310C4
	adds r1, r0, #0
	ldr r0, _02231618 @ =ov74_02230520
	blx FUN_020DF6D0
	cmp r0, #2
	beq _0223160E
	bl ov74_02231448
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223160E:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_02231614: .4byte 0x000001C3
_02231618: .4byte ov74_02230520
	thumb_func_end ov74_02231584

	thumb_func_start ov74_0223161C
ov74_0223161C: @ 0x0223161C
	push {r3, lr}
	ldr r0, _02231634 @ =ov74_02230590
	blx FUN_020DF90C
	cmp r0, #2
	beq _02231630
	bl ov74_02231448
	movs r0, #0
	pop {r3, pc}
_02231630:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_02231634: .4byte ov74_02230590
	thumb_func_end ov74_0223161C

	thumb_func_start ov74_02231638
ov74_02231638: @ 0x02231638
	push {r3, r4, lr}
	sub sp, #4
	bl ov74_022311E8
	adds r4, r0, #0
	bl ov74_02231100
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0223166C @ =ov74_022305E4
	adds r2, r4, #0
	movs r3, #1
	blx FUN_020DF94C
	cmp r0, #2
	beq _02231664
	bl ov74_02231448
	add sp, #4
	movs r0, #0
	pop {r3, r4, pc}
_02231664:
	movs r0, #1
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223166C: .4byte ov74_022305E4
	thumb_func_end ov74_02231638

	thumb_func_start ov74_02231670
ov74_02231670: @ 0x02231670
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _022316E0 @ =ov74_022308E0
	movs r0, #4
	movs r2, #0
	blx FUN_020DEBEC
	cmp r0, #0
	beq _0223168C
	bl ov74_02231448
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0223168C:
	bl ov74_02231054
	ldrh r0, [r0, #0x16]
	cmp r0, #0
	bne _0223169A
	movs r5, #1
	b _0223169C
_0223169A:
	movs r5, #0
_0223169C:
	bl ov74_022310F4
	adds r6, r0, #0
	bl ov74_022310DC
	adds r4, r0, #0
	bl ov74_022310E8
	adds r7, r0, #0
	bl ov74_022310D0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r2, r4, #0x10
	ldr r0, _022316E4 @ =ov74_022306C8
	adds r1, r6, #0
	lsrs r2, r2, #0x10
	adds r3, r7, #0
	blx FUN_020DFD14
	cmp r0, #2
	beq _022316DA
	bl ov74_02231448
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022316DA:
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022316E0: .4byte ov74_022308E0
_022316E4: .4byte ov74_022306C8
	thumb_func_end ov74_02231670

	thumb_func_start ov74_022316E8
ov74_022316E8: @ 0x022316E8
	push {r3, lr}
	ldr r0, _02231700 @ =ov74_02230964
	blx FUN_020DF378
	cmp r0, #2
	beq _022316FC
	bl ov74_02231448
	movs r0, #0
	pop {r3, pc}
_022316FC:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_02231700: .4byte ov74_02230964
	thumb_func_end ov74_022316E8

	thumb_func_start ov74_02231704
ov74_02231704: @ 0x02231704
	push {r3, lr}
	ldr r0, _02231720 @ =ov74_02230988
	blx FUN_020DF3B8
	cmp r0, #2
	beq _0223171C
	bl ov74_02231448
	blx FUN_020D3F48
	movs r0, #0
	pop {r3, pc}
_0223171C:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_02231720: .4byte ov74_02230988
	thumb_func_end ov74_02231704

	thumb_func_start ov74_02231724
ov74_02231724: @ 0x02231724
	push {r3, lr}
	ldr r0, _02231740 @ =ov74_022309AC
	blx FUN_020DF480
	cmp r0, #2
	beq _0223173C
	bl ov74_02231448
	blx FUN_020D3F48
	movs r0, #0
	pop {r3, pc}
_0223173C:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_02231740: .4byte ov74_022309AC
	thumb_func_end ov74_02231724

	thumb_func_start ov74_02231744
ov74_02231744: @ 0x02231744
	push {r3, lr}
	ldr r0, _02231760 @ =ov74_022309F0
	blx FUN_020DF4B8
	cmp r0, #2
	beq _0223175C
	bl ov74_02231448
	blx FUN_020D3F48
	movs r0, #0
	pop {r3, pc}
_0223175C:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_02231760: .4byte ov74_022309F0
	thumb_func_end ov74_02231744

	thumb_func_start ov74_02231764
ov74_02231764: @ 0x02231764
	cmp r0, #0
	bgt _0223176C
	movs r0, #1
	bx lr
_0223176C:
	cmp r0, #0xfb
	bgt _02231774
	movs r0, #0
	bx lr
_02231774:
	ldr r1, _0223178C @ =0x00000115
	cmp r0, r1
	bge _0223177E
	movs r0, #1
	bx lr
_0223177E:
	adds r1, #0x86
	cmp r0, r1
	ble _02231788
	movs r0, #1
	bx lr
_02231788:
	movs r0, #0
	bx lr
	.align 2, 0
_0223178C: .4byte 0x00000115
	thumb_func_end ov74_02231764

	thumb_func_start ov74_02231790
ov74_02231790: @ 0x02231790
	push {r4, lr}
	adds r4, r0, #0
	bl ov74_022339BC
	cmp r0, #4
	bhi _022317D0
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022317A8: @ jump table
	.2byte _022317B2 - _022317A8 - 2 @ case 0
	.2byte _022317B8 - _022317A8 - 2 @ case 1
	.2byte _022317BE - _022317A8 - 2 @ case 2
	.2byte _022317C4 - _022317A8 - 2 @ case 3
	.2byte _022317CA - _022317A8 - 2 @ case 4
_022317B2:
	movs r0, #2
	str r0, [r4]
	pop {r4, pc}
_022317B8:
	movs r0, #1
	str r0, [r4]
	pop {r4, pc}
_022317BE:
	movs r0, #5
	str r0, [r4]
	pop {r4, pc}
_022317C4:
	movs r0, #4
	str r0, [r4]
	pop {r4, pc}
_022317CA:
	movs r0, #3
	str r0, [r4]
	pop {r4, pc}
_022317D0:
	movs r0, #0
	mvns r0, r0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov74_02231790

	thumb_func_start ov74_022317D8
ov74_022317D8: @ 0x022317D8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r1, _0223192C @ =0x0000E890
	adds r5, r0, #0
	adds r4, r5, r1
	ldr r1, [r4]
	cmp r1, #9
	bls _022317EA
	b _02231924
_022317EA:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022317F6: @ jump table
	.2byte _0223180A - _022317F6 - 2 @ case 0
	.2byte _0223182A - _022317F6 - 2 @ case 1
	.2byte _02231842 - _022317F6 - 2 @ case 2
	.2byte _02231852 - _022317F6 - 2 @ case 3
	.2byte _02231862 - _022317F6 - 2 @ case 4
	.2byte _0223187E - _022317F6 - 2 @ case 5
	.2byte _02231892 - _022317F6 - 2 @ case 6
	.2byte _022318AE - _022317F6 - 2 @ case 7
	.2byte _022318DA - _022317F6 - 2 @ case 8
	.2byte _02231900 - _022317F6 - 2 @ case 9
_0223180A:
	bl ov74_0223195C
	ldr r0, [r5, #0x10]
	bl FUN_020270F8
	adds r5, r0, #0
	bl ov74_02233F68
	adds r1, r0, #0
	adds r0, r5, #0
	bl FUN_0202EC28
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02231924
_0223182A:
	blx FUN_020D34B0
	movs r2, #0x78
	movs r3, #0
	blx FUN_020F290C
	adds r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02231924
_02231842:
	ldr r0, [r4, #4]
	subs r0, r0, #1
	str r0, [r4, #4]
	bne _02231924
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02231924
_02231852:
	ldr r0, [r5, #0x10]
	movs r1, #2
	bl FUN_02027550
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02231924
_02231862:
	ldr r0, [r5, #0x10]
	bl FUN_02027564
	cmp r0, #3
	bne _02231872
	add sp, #0x10
	movs r0, #0xc
	pop {r3, r4, r5, pc}
_02231872:
	cmp r0, #1
	bne _02231924
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02231924
_0223187E:
	movs r0, #0
	adds r1, r0, #0
	add r2, sp, #0
	movs r3, #0x10
	blx FUN_020E219C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02231924
_02231892:
	bl ov74_02233E8C
	cmp r0, #0
	bne _022318A6
	movs r0, #1
	bl FUN_0201A4CC
	add sp, #0x10
	movs r0, #0xc
	pop {r3, r4, r5, pc}
_022318A6:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02231924
_022318AE:
	bl ov74_02233F14
	cmp r0, #9
	beq _02231924
	bl ov74_02233F14
	cmp r0, #0xb
	bne _022318C6
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02231924
_022318C6:
	bl ov74_02233ED4
	cmp r0, #8
	bne _02231924
	movs r0, #1
	bl FUN_0201A4CC
	add sp, #0x10
	movs r0, #0xc
	pop {r3, r4, r5, pc}
_022318DA:
	ldr r0, [r5, #0x10]
	bl FUN_02027564
	cmp r0, #3
	bne _022318EA
	add sp, #0x10
	movs r0, #0xc
	pop {r3, r4, r5, pc}
_022318EA:
	cmp r0, #2
	bne _022318DA
	bl ov74_02233ED4
	movs r0, #1
	bl FUN_0201A4BC
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02231924
_02231900:
	bl ov74_02233ED4
	cmp r0, #8
	bne _02231914
	movs r0, #1
	bl FUN_0201A4CC
	add sp, #0x10
	movs r0, #0xc
	pop {r3, r4, r5, pc}
_02231914:
	cmp r0, #0
	bne _02231924
	movs r0, #1
	bl FUN_0201A4CC
	add sp, #0x10
	movs r0, #0xb
	pop {r3, r4, r5, pc}
_02231924:
	movs r0, #0xa
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223192C: .4byte 0x0000E890
	thumb_func_end ov74_022317D8

	thumb_func_start ov74_02231930
ov74_02231930: @ 0x02231930
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	bl FUN_020270F8
	adds r4, r0, #0
	bl ov74_02233F68
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_0202EC28
	movs r0, #4
	bl FUN_0201A728
	ldr r0, [r5, #0x10]
	bl FUN_020273F0
	movs r0, #4
	bl FUN_0201A738
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_02231930

	thumb_func_start ov74_0223195C
ov74_0223195C: @ 0x0223195C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xf4
	adds r7, r0, #0
	ldr r0, [r7, #0x10]
	bl FUN_020270F8
	str r0, [sp]
	add r0, sp, #8
	bl FUN_02070DB0
	adds r6, r0, #0
	movs r4, #0
	adds r5, r7, #0
_02231976:
	ldr r0, _022319F4 @ =0x0000E880
	movs r1, #0x3d
	lsls r1, r1, #4
	ldr r0, [r7, r0]
	ldr r2, [r5, r1]
	movs r1, #0x96
	lsls r1, r1, #4
	adds r0, r0, #4
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0xf3
	lsls r1, r1, #2
	ldr r2, [r5, r1]
	movs r1, #0x50
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r6, #0
	bl ov74_02234A9C
	ldr r0, [sp]
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_0202EC14
	adds r4, r4, #1
	adds r5, #0xc
	cmp r4, #6
	blt _02231976
	movs r5, #0
	add r0, sp, #4
	strh r5, [r0]
	adds r4, r7, #0
	subs r6, r5, #1
_022319B8:
	movs r0, #0xf3
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	adds r0, r0, #4
	ldr r1, [r4, r0]
	cmp r2, r6
	beq _022319E6
	cmp r1, #0xe
	beq _022319E6
	ldr r0, _022319F4 @ =0x0000E880
	movs r3, #0x96
	ldr r0, [r7, r0]
	lsls r3, r3, #4
	muls r3, r1, r3
	adds r0, r0, #4
	movs r1, #0x50
	muls r1, r2, r1
	adds r0, r0, r3
	adds r0, r0, r1
	movs r1, #0xb
	add r2, sp, #4
	bl ov74_022348B0
_022319E6:
	adds r5, r5, #1
	adds r4, #0xc
	cmp r5, #6
	blt _022319B8
	add sp, #0xf4
	pop {r4, r5, r6, r7, pc}
	nop
_022319F4: .4byte 0x0000E880
	thumb_func_end ov74_0223195C

	thumb_func_start ov74_022319F8
ov74_022319F8: @ 0x022319F8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	tst r2, r0
	beq _02231A16
	movs r2, #0
	bl FUN_02002F30
	ldr r1, [r4, #0x10]
	lsls r1, r1, #3
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	pop {r4, pc}
_02231A16:
	ldr r0, [r4, #0x18]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_022319F8

	thumb_func_start ov74_02231A1C
ov74_02231A1C: @ 0x02231A1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r1, #0
	ldr r7, [r5, #0x44]
	adds r6, r0, #0
	adds r4, r2, #0
	cmp r7, #0
	bne _02231A2E
	movs r7, #0xff
_02231A2E:
	ldr r1, [r5]
	ldr r0, [r1]
	cmp r0, #0
	bne _02231A6C
	ldr r0, [r5, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r5, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r5, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x20]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x24]
	ldr r3, [r5, #8]
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	ldr r0, [r6, #0x20]
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
_02231A6C:
	movs r0, #2
	tst r0, r4
	bne _02231A7E
	ldr r1, [r5, #0x30]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201D978
_02231A7E:
	movs r0, #0
	ldr r1, [r5, #0x34]
	mvns r0, r0
	cmp r1, r0
	beq _02231B0E
	ldr r2, _02231BB0 @ =0x0000012D
	movs r0, #1
	movs r1, #0x1b
	movs r3, #0x4c
	bl FUN_0200BAF8
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x40]
	str r0, [sp, #0x14]
	cmp r0, #0
	bne _02231AA6
	movs r0, #0x4c
	bl FUN_0200BD08
	str r0, [sp, #0x14]
_02231AA6:
	ldr r0, _02231BB4 @ =0x00012608
	ldr r0, [r6, r0]
	bl FUN_020263AC
	ldr r0, _02231BB4 @ =0x00012608
	ldr r1, [r5, #0x34]
	ldr r0, [r6, r0]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	bl FUN_0200BBA0
	str r0, [sp, #0x20]
	ldr r1, _02231BB4 @ =0x00012608
	ldr r0, [sp, #0x14]
	ldr r1, [r6, r1]
	ldr r2, [sp, #0x20]
	bl FUN_0200CBBC
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	ldr r1, [sp, #0x1c]
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov74_022319F8
	adds r3, r0, #0
	ldr r0, [r5, #0x1c]
	ldr r2, [sp, #0x1c]
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #0x28]
	bl FUN_020200FC
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x40]
	cmp r0, #0
	bne _02231B02
	ldr r0, [sp, #0x14]
	bl FUN_0200BDA0
_02231B02:
	ldr r0, [sp, #0x18]
	bl FUN_0200BB44
	movs r0, #0
	mvns r0, r0
	str r0, [r5, #0x34]
_02231B0E:
	ldr r1, [r5, #0x38]
	cmp r1, #0
	beq _02231B4A
	ldr r0, _02231BB8 @ =0x0001260C
	movs r2, #0x40
	ldr r6, [r6, r0]
	adds r0, r6, #0
	bl FUN_02026A04
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov74_022319F8
	adds r3, r0, #0
	ldr r0, [r5, #0x1c]
	adds r2, r6, #0
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #0x28]
	bl FUN_020200FC
	str r0, [r5, #0x48]
	movs r0, #0
	str r0, [r5, #0x38]
_02231B4A:
	ldr r1, [r5, #0x3c]
	cmp r1, #0
	beq _02231B78
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov74_022319F8
	adds r3, r0, #0
	ldr r0, [r5, #0x1c]
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x3c]
	bl FUN_020200FC
	str r0, [r5, #0x48]
	movs r0, #0
	str r0, [r5, #0x3c]
_02231B78:
	movs r0, #4
	tst r0, r4
	bne _02231B84
	ldr r0, [r5]
	bl FUN_0201D578
_02231B84:
	movs r0, #8
	tst r0, r4
	beq _02231BAC
	movs r0, #0x10
	tst r0, r4
	ldr r0, [r5]
	beq _02231BA0
	ldr r2, _02231BBC @ =0x000003D2
	movs r1, #0
	movs r3, #0xd
	bl FUN_0200E998
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_02231BA0:
	movs r2, #0x3f
	movs r1, #0
	lsls r2, r2, #4
	movs r3, #0xe
	bl FUN_0200E580
_02231BAC:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02231BB0: .4byte 0x0000012D
_02231BB4: .4byte 0x00012608
_02231BB8: .4byte 0x0001260C
_02231BBC: .4byte 0x000003D2
	thumb_func_end ov74_02231A1C

	thumb_func_start ov74_02231BC0
ov74_02231BC0: @ 0x02231BC0
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _02231BEC @ =0x0223B4E8
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_020215A0
	movs r0, #0x14
	movs r1, #0x4c
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_02231BEC: .4byte 0x0223B4E8
	thumb_func_end ov74_02231BC0

	thumb_func_start ov74_02231BF0
ov74_02231BF0: @ 0x02231BF0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x4c
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	adds r1, r6, #0
	movs r0, #0x50
	adds r1, #0x2c
	movs r2, #0x4c
	bl FUN_02009F40
	str r0, [r6, #0x28]
	adds r0, r6, #0
	movs r2, #1
	adds r0, #0x2c
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r7, #0x55
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_02231C36:
	movs r0, #3
	adds r1, r4, #0
	movs r2, #0x4c
	bl FUN_0200A090
	str r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _02231C36
	movs r0, #0
	str r0, [sp]
	movs r3, #1
	str r3, [sp, #4]
	movs r0, #0x4c
	str r0, [sp, #8]
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0x71
	movs r2, #0x1e
	bl FUN_0200A1D8
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r6, r1]
	movs r3, #0
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x4c
	subs r1, #0x14
	str r0, [sp, #0xc]
	ldr r0, [r6, r1]
	movs r1, #0x71
	movs r2, #0x1b
	bl FUN_0200A234
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r6, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x4c
	subs r1, #0x14
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	movs r1, #0x71
	movs r2, #0x1d
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x5d
	lsls r1, r1, #2
	str r0, [r6, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x4c
	subs r1, #0x14
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	movs r1, #0x71
	movs r2, #0x1c
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r6, r1]
	subs r1, #0xc
	ldr r0, [r6, r1]
	bl FUN_0200ACF0
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_0200AF94
	bl FUN_02074490
	adds r1, r0, #0
	movs r0, #0
	movs r2, #1
	str r0, [sp]
	movs r0, #0x4c
	adds r3, r2, #0
	str r0, [sp, #4]
	movs r0, #0x14
	adds r3, #0xff
	bl FUN_02007938
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov74_02231BF0

	thumb_func_start ov74_02231CFC
ov74_02231CFC: @ 0x02231CFC
	push {lr}
	sub sp, #0x2c
	movs r1, #0
	str r1, [sp]
	subs r2, r1, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	movs r3, #0x55
	str r1, [sp, #0x10]
	lsls r3, r3, #2
	ldr r2, [r0, r3]
	str r2, [sp, #0x14]
	adds r2, r3, #4
	ldr r2, [r0, r2]
	str r2, [sp, #0x18]
	adds r2, r3, #0
	adds r2, #8
	ldr r2, [r0, r2]
	str r2, [sp, #0x1c]
	adds r2, r3, #0
	adds r2, #0xc
	ldr r2, [r0, r2]
	adds r3, #0x30
	str r2, [sp, #0x20]
	str r1, [sp, #0x24]
	adds r0, r0, r3
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp, #0x28]
	bl FUN_02009D48
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	add sp, #0x2c
	pop {pc}
	thumb_func_end ov74_02231CFC

	thumb_func_start ov74_02231D48
ov74_02231D48: @ 0x02231D48
	ldr r2, [r1, #0x28]
	str r2, [r0]
	movs r2, #0x61
	lsls r2, r2, #2
	adds r1, r1, r2
	str r1, [r0, #4]
	movs r2, #0
	movs r1, #1
	str r2, [r0, #0x10]
	lsls r1, r1, #0xc
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	strh r2, [r0, #0x20]
	movs r1, #0x14
	str r1, [r0, #0x24]
	str r3, [r0, #0x28]
	movs r1, #0x4c
	str r1, [r0, #0x2c]
	bx lr
	thumb_func_end ov74_02231D48

	thumb_func_start ov74_02231D70
ov74_02231D70: @ 0x02231D70
	ldr r3, _02231D8C @ =0x0000E880
	ldr r0, [r0, r3]
	adds r3, r0, #4
	movs r0, #0x96
	lsls r0, r0, #4
	muls r0, r1, r0
	adds r1, r3, r0
	movs r0, #0x50
	muls r0, r2, r0
	adds r0, r1, r0
	ldr r3, _02231D90 @ =ov74_02234530
	movs r1, #0xb
	movs r2, #0
	bx r3
	.align 2, 0
_02231D8C: .4byte 0x0000E880
_02231D90: .4byte ov74_02234530
	thumb_func_end ov74_02231D70

	thumb_func_start ov74_02231D94
ov74_02231D94: @ 0x02231D94
	ldr r3, _02231DB0 @ =0x0000E880
	ldr r0, [r0, r3]
	adds r3, r0, #4
	movs r0, #0x96
	lsls r0, r0, #4
	muls r0, r1, r0
	adds r1, r3, r0
	movs r0, #0x50
	muls r0, r2, r0
	adds r0, r1, r0
	ldr r3, _02231DB4 @ =ov74_02234530
	movs r1, #0x2d
	movs r2, #0
	bx r3
	.align 2, 0
_02231DB0: .4byte 0x0000E880
_02231DB4: .4byte ov74_02234530
	thumb_func_end ov74_02231D94

	thumb_func_start ov74_02231DB8
ov74_02231DB8: @ 0x02231DB8
	ldr r3, _02231DD4 @ =0x0000E880
	ldr r0, [r0, r3]
	adds r3, r0, #4
	movs r0, #0x96
	lsls r0, r0, #4
	muls r0, r1, r0
	adds r1, r3, r0
	movs r0, #0x50
	muls r0, r2, r0
	adds r0, r1, r0
	movs r1, #0
	ldr r3, _02231DD8 @ =ov74_02234530
	adds r2, r1, #0
	bx r3
	.align 2, 0
_02231DD4: .4byte 0x0000E880
_02231DD8: .4byte ov74_02234530
	thumb_func_end ov74_02231DB8

	thumb_func_start ov74_02231DDC
ov74_02231DDC: @ 0x02231DDC
	push {r4, r5}
	ldr r5, [sp, #8]
	lsrs r4, r5, #0x1f
	adds r4, r5, r4
	asrs r4, r4, #1
	subs r5, r2, r4
	strb r5, [r0]
	lsrs r5, r3, #0x1f
	adds r5, r3, r5
	asrs r5, r5, #1
	subs r3, r1, r5
	strb r3, [r0, #2]
	adds r2, r2, r4
	strb r2, [r0, #1]
	adds r1, r1, r5
	strb r1, [r0, #3]
	pop {r4, r5}
	bx lr
	thumb_func_end ov74_02231DDC

	thumb_func_start ov74_02231E00
ov74_02231E00: @ 0x02231E00
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	movs r1, #1
	adds r5, r0, #0
	adds r0, r3, #0
	lsls r1, r1, #0xc
	adds r7, r2, #0
	bl FUN_0201AACC
	adds r4, r0, #0
	beq _02231E34
	adds r1, r5, #0
	adds r2, r6, #0
	bl FUN_02007508
	adds r0, r4, #0
	adds r1, r7, #0
	blx FUN_020B70F4
	cmp r0, #0
	bne _02231E34
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02231E34:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_02231E00

	thumb_func_start ov74_02231E38
ov74_02231E38: @ 0x02231E38
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r3, #0
	adds r1, r6, #0
	bl FUN_0200778C
	adds r0, r4, #0
	adds r1, r5, #0
	blx FUN_020B70F4
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov74_02231E38

	thumb_func_start ov74_02231E54
ov74_02231E54: @ 0x02231E54
	push {r4, lr}
	adds r3, r1, #0
	movs r4, #0
	cmp r0, #0xc9
	beq _02231E66
	ldr r1, _02231EC0 @ =0x00000182
	cmp r0, r1
	beq _02231E90
	b _02231EBA
_02231E66:
	movs r4, #3
	lsls r0, r4, #8
	adds r2, r3, #0
	ands r0, r3
	lsrs r1, r0, #6
	lsls r0, r4, #0x18
	ands r2, r4
	ands r0, r3
	lsls r4, r4, #0x10
	ands r3, r4
	lsrs r0, r0, #0x12
	lsrs r3, r3, #0xc
	orrs r0, r3
	orrs r0, r1
	orrs r0, r2
	movs r1, #0x1c
	blx FUN_020F2BA4
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	b _02231EBA
_02231E90:
	cmp r2, #5
	bhi _02231EAC
	adds r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02231EA0: @ jump table
	.2byte _02231EAC - _02231EA0 - 2 @ case 0
	.2byte _02231EAC - _02231EA0 - 2 @ case 1
	.2byte _02231EAC - _02231EA0 - 2 @ case 2
	.2byte _02231EB8 - _02231EA0 - 2 @ case 3
	.2byte _02231EB0 - _02231EA0 - 2 @ case 4
	.2byte _02231EB4 - _02231EA0 - 2 @ case 5
_02231EAC:
	movs r4, #0
	b _02231EBA
_02231EB0:
	movs r4, #1
	b _02231EBA
_02231EB4:
	movs r4, #2
	b _02231EBA
_02231EB8:
	movs r4, #3
_02231EBA:
	adds r0, r4, #0
	pop {r4, pc}
	nop
_02231EC0: .4byte 0x00000182
	thumb_func_end ov74_02231E54

	thumb_func_start ov74_02231EC4
ov74_02231EC4: @ 0x02231EC4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r2, #0
	adds r7, r3, #0
	adds r5, r1, #0
	bl ov74_022349DC
	adds r1, r6, #0
	adds r2, r7, #0
	adds r4, r0, #0
	bl ov74_02231E54
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl FUN_020741BC
	adds r1, r0, #0
	movs r0, #0x14
	add r2, sp, #0
	movs r3, #0x4c
	bl ov74_02231E00
	adds r6, r0, #0
	ldr r0, [sp]
	movs r1, #2
	ldr r0, [r0, #0x14]
	lsls r1, r1, #8
	blx FUN_020D2894
	ldr r1, [sp, #0x18]
	ldr r0, [sp]
	lsls r1, r1, #4
	adds r1, #0x64
	movs r2, #2
	ldr r0, [r0, #0x14]
	lsls r1, r1, #5
	lsls r2, r2, #8
	blx FUN_020CFE74
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl FUN_02074364
	adds r1, r0, #0
	ldr r0, [sp, #0x1c]
	adds r1, #8
	bl FUN_02024A14
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_02231EC4

	thumb_func_start ov74_02231F30
ov74_02231F30: @ 0x02231F30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r1, #0
	ldr r1, _02231FAC @ =0x0223D338
	str r2, [sp]
	ldr r2, [r1]
	movs r1, #0x83
	adds r5, r3, #0
	lsls r1, r1, #2
	muls r1, r5, r1
	adds r4, r2, r1
	ldr r1, [sp, #0x20]
	adds r6, r0, #0
	cmp r1, #0
	beq _02231FA4
	bl ov74_02231764
	cmp r0, #0
	bne _02231F60
	adds r0, r6, #0
	bl ov74_022349DC
	adds r6, r0, #0
	b _02231F62
_02231F60:
	movs r6, #0
_02231F62:
	ldr r2, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_020741BC
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	add r1, sp, #4
	bl ov74_02231E38
	ldr r0, [sp, #4]
	adds r1, r4, #0
	movs r2, #2
	ldr r0, [r0, #0x14]
	adds r1, #0xc
	lsls r2, r2, #8
	blx FUN_020D48B4
	lsls r0, r5, #4
	adds r0, #0x64
	lsls r0, r0, #5
	str r0, [r4]
	ldr r0, [sp, #0x20]
	ldr r1, [sp]
	str r0, [r4, #8]
	adds r0, r6, #0
	adds r2, r7, #0
	bl FUN_02074364
	adds r0, #8
	add sp, #8
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02231FA4:
	movs r0, #0
	str r0, [r4, #8]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02231FAC: .4byte 0x0223D338
	thumb_func_end ov74_02231F30

	thumb_func_start ov74_02231FB0
ov74_02231FB0: @ 0x02231FB0
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02231FF0 @ =0x0223D338
	movs r6, #2
	lsls r6, r6, #8
	adds r7, r6, #0
	ldr r5, [r0]
	movs r4, #0
	adds r7, #0xc
_02231FC0:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02231FE4
	adds r0, r5, #0
	adds r0, #0xc
	adds r1, r6, #0
	blx FUN_020D2894
	adds r0, r5, #0
	ldr r1, [r5]
	adds r0, #0xc
	adds r2, r6, #0
	blx FUN_020CFE74
	ldr r0, [r5, #8]
	ldr r1, [r5, #4]
	bl FUN_02024A14
_02231FE4:
	adds r4, r4, #1
	adds r5, r5, r7
	cmp r4, #0x1e
	blt _02231FC0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02231FF0: .4byte 0x0223D338
	thumb_func_end ov74_02231FB0

	thumb_func_start ov74_02231FF4
ov74_02231FF4: @ 0x02231FF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r6, r0, #0
	movs r0, #0x14
	movs r1, #0x4c
	bl FUN_02007688
	movs r1, #1
	str r0, [sp, #0x10]
	movs r0, #0x4c
	lsls r1, r1, #0xc
	bl FUN_0201AACC
	movs r7, #0
	str r0, [sp, #0x14]
	str r7, [sp, #0xc]
	adds r5, r6, #0
_02232016:
	ldr r0, _02232140 @ =0x0000E880
	ldr r1, _02232144 @ =0x0000E884
	ldr r0, [r6, r0]
	ldr r2, [r6, r1]
	movs r1, #0x96
	lsls r1, r1, #4
	muls r1, r2, r1
	adds r0, r0, #4
	adds r1, r0, r1
	ldr r0, [sp, #0xc]
	movs r2, #0
	adds r0, r1, r0
	movs r1, #5
	bl ov74_02234530
	cmp r0, #0
	beq _022320DA
	ldr r1, _02232144 @ =0x0000E884
	adds r0, r6, #0
	ldr r1, [r6, r1]
	adds r2, r7, #0
	bl ov74_02231D70
	ldr r1, _02232144 @ =0x0000E884
	str r0, [sp, #0x1c]
	ldr r1, [r6, r1]
	adds r0, r6, #0
	adds r2, r7, #0
	bl ov74_02231D94
	ldr r1, _02232144 @ =0x0000E884
	str r0, [sp, #0x18]
	ldr r1, [r6, r1]
	adds r0, r6, #0
	adds r2, r7, #0
	bl ov74_02231DB8
	adds r4, r0, #0
	ldr r0, [sp, #0x1c]
	bl ov74_022349DC
	ldr r2, _02232148 @ =0x021D116C
	adds r1, r4, #0
	ldrb r2, [r2, #0xa]
	bl ov74_02231E54
	adds r4, r0, #0
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	adds r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	adds r3, r7, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	bl ov74_02231F30
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	ldr r0, _02232140 @ =0x0000E880
	ldr r1, _02232144 @ =0x0000E884
	ldr r0, [r6, r0]
	ldr r2, [r6, r1]
	movs r1, #0x96
	lsls r1, r1, #4
	muls r1, r2, r1
	adds r0, r0, #4
	adds r1, r0, r1
	ldr r0, [sp, #0xc]
	movs r2, #0
	adds r0, r1, r0
	movs r1, #0xc
	bl ov74_02234530
	cmp r0, #0
	beq _022320CC
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	b _0223210A
_022320CC:
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	b _0223210A
_022320DA:
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	adds r2, r4, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	adds r3, r7, #0
	bl ov74_02231F30
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
_0223210A:
	ldr r0, [sp, #0xc]
	adds r7, r7, #1
	adds r0, #0x50
	adds r5, #0xc
	str r0, [sp, #0xc]
	cmp r7, #0x1e
	bge _0223211A
	b _02232016
_0223211A:
	ldr r0, [sp, #0x14]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x10]
	bl FUN_0200770C
	ldr r1, _0223214C @ =ov74_02231FB0
	ldr r0, _02232150 @ =0x00012604
	str r1, [r6, r0]
	ldr r1, _02232144 @ =0x0000E884
	adds r0, r6, #0
	ldr r1, [r6, r1]
	bl ov74_02232678
	adds r0, r6, #0
	bl ov74_0223262C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02232140: .4byte 0x0000E880
_02232144: .4byte 0x0000E884
_02232148: .4byte 0x021D116C
_0223214C: .4byte ov74_02231FB0
_02232150: .4byte 0x00012604
	thumb_func_end ov74_02231FF4

	thumb_func_start ov74_02232154
ov74_02232154: @ 0x02232154
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	movs r2, #0x61
	adds r5, r0, #0
	lsls r2, r2, #2
	add r0, sp, #0x14
	adds r1, r5, #0
	adds r2, r5, r2
	movs r3, #1
	bl ov74_02231D48
	movs r0, #0x28
	str r0, [sp, #8]
	movs r0, #0x31
	movs r4, #0
	lsls r0, r0, #4
	str r4, [sp, #0xc]
	adds r7, r5, r0
_02232178:
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	movs r6, #0x1c
	lsls r0, r0, #0xc
	str r0, [sp, #4]
_02232184:
	movs r0, #0x1c
	str r0, [sp]
	ldr r2, [sp, #8]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #0x1c
	bl ov74_02231DDC
	lsls r0, r6, #0xc
	str r0, [sp, #0x1c]
	ldr r0, [sp, #4]
	str r0, [sp, #0x20]
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _022321B2
	add r0, sp, #0x14
	bl FUN_02024624
	movs r1, #0x6a
	lsls r1, r1, #2
	str r0, [r5, r1]
_022321B2:
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x6a
	lsls r0, r0, #2
	adds r1, r4, #0
	ldr r0, [r5, r0]
	adds r1, #0xa
	bl FUN_020248F0
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024A04
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x6a
	lsls r0, r0, #2
	adds r1, r4, #0
	ldr r0, [r5, r0]
	adds r1, #0x64
	bl FUN_02024ADC
	movs r0, #6
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp, #0x1c]
	movs r0, #3
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0x20]
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0223221C
	add r0, sp, #0x14
	bl FUN_02024624
	movs r1, #0x6b
	lsls r1, r1, #2
	str r0, [r5, r1]
_0223221C:
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x28
	bl FUN_020248F0
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024A04
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02024ADC
	adds r4, r4, #1
	adds r7, r7, #4
	adds r5, #0xc
	cmp r4, #0x1e
	beq _02232280
	ldr r0, [sp, #0x10]
	adds r6, #0x28
	adds r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #6
	blt _02232184
	ldr r0, [sp, #8]
	adds r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #5
	bge _02232280
	b _02232178
_02232280:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov74_02232154

	thumb_func_start ov74_02232284
ov74_02232284: @ 0x02232284
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r4, r2, #0
	movs r2, #0x61
	adds r6, r0, #0
	lsls r2, r2, #2
	adds r5, r1, #0
	adds r7, r3, #0
	add r0, sp, #0
	adds r1, r6, #0
	adds r2, r6, r2
	movs r3, #1
	bl ov74_02231D48
	lsls r0, r5, #0xc
	str r0, [sp, #8]
	lsls r0, r4, #0xc
	str r0, [sp, #0xc]
	movs r0, #0xa
	str r0, [sp, #0x24]
	add r0, sp, #0
	bl FUN_02024624
	adds r4, r0, #0
	movs r1, #1
	bl FUN_0202484C
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_020248F0
	adds r0, r4, #0
	movs r1, #1
	bl FUN_02024A04
	ldr r1, [sp, #0x48]
	adds r0, r4, #0
	bl FUN_02024830
	adds r0, r4, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_02232284

	thumb_func_start ov74_022322D8
ov74_022322D8: @ 0x022322D8
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0xe2
	lsls r0, r0, #2
	adds r0, r6, r0
	movs r1, #0xe4
	movs r2, #0xb0
	movs r3, #0x32
	bl ov74_02231DDC
	movs r0, #1
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xe4
	movs r2, #0xb0
	movs r3, #6
	bl ov74_02232284
	movs r1, #0xe6
	lsls r1, r1, #2
	str r0, [r6, r1]
	subs r1, #8
	adds r0, r6, r1
	movs r1, #0xb0
	movs r3, #0x20
	adds r2, r1, #0
	str r3, [sp]
	bl ov74_02231DDC
	movs r0, #1
	movs r1, #0xb0
	str r0, [sp]
	adds r0, r6, #0
	adds r2, r1, #0
	movs r3, #3
	bl ov74_02232284
	movs r1, #0xea
	lsls r1, r1, #2
	str r0, [r6, r1]
	subs r1, #0x1c
	movs r3, #0x20
	adds r0, r6, r1
	movs r1, #0x18
	movs r2, #0xb0
	str r3, [sp]
	bl ov74_02231DDC
	movs r0, #1
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0x18
	movs r2, #0xb0
	movs r3, #0
	bl ov74_02232284
	movs r1, #0xee
	lsls r1, r1, #2
	str r0, [r6, r1]
	movs r7, #0
	movs r0, #0xff
	subs r1, #0x24
	strb r0, [r6, r1]
	adds r4, r7, #0
	adds r5, r6, #0
_0223235E:
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x40
	movs r3, #9
	bl ov74_02232284
	movs r1, #0xf2
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r1, #0
	movs r0, #0xf3
	mvns r1, r1
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0xe
	adds r0, r0, #4
	str r1, [r5, r0]
	adds r7, r7, #1
	adds r4, #0x24
	adds r5, #0xc
	cmp r7, #6
	blt _0223235E
	movs r0, #0x41
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r6, r0]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_022322D8

	thumb_func_start ov74_02232398
ov74_02232398: @ 0x02232398
	push {r3, lr}
	ldr r3, _022323CC @ =0x0000E880
	ldr r2, [r0, r3]
	adds r3, r3, #4
	ldr r3, [r0, r3]
	movs r0, #0x96
	lsls r0, r0, #4
	adds r2, r2, #4
	muls r0, r3, r0
	adds r2, r2, r0
	movs r0, #0x50
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x41
	movs r2, #0
	bl ov74_02234530
	movs r1, #0x67
	lsls r1, r1, #2
	cmp r0, r1
	bne _022323C6
	movs r0, #1
	pop {r3, pc}
_022323C6:
	movs r0, #0
	pop {r3, pc}
	nop
_022323CC: .4byte 0x0000E880
	thumb_func_end ov74_02232398

	thumb_func_start ov74_022323D0
ov74_022323D0: @ 0x022323D0
	push {r3, r4, r5, r6, r7, lr}
	ldr r3, _0223241C @ =0x0000E880
	movs r5, #0
	ldr r2, [r0, r3]
	adds r3, r3, #4
	ldr r3, [r0, r3]
	movs r0, #0x96
	lsls r0, r0, #4
	adds r2, r2, #4
	muls r0, r3, r0
	adds r4, r2, r0
	movs r0, #0x50
	adds r6, r1, #0
	muls r6, r0, r6
	adds r7, r5, #0
_022323EE:
	adds r1, r5, #0
	adds r0, r4, r6
	adds r1, #0xd
	adds r2, r7, #0
	bl ov74_02234530
	ldr r3, _02232420 @ =0x0223C998
	adds r2, r0, #0
	movs r1, #0
_02232400:
	ldr r0, [r3]
	cmp r2, r0
	bne _0223240A
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223240A:
	adds r1, r1, #1
	adds r3, r3, #4
	cmp r1, #8
	blo _02232400
	adds r5, r5, #1
	cmp r5, #4
	blt _022323EE
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223241C: .4byte 0x0000E880
_02232420: .4byte 0x0223C998
	thumb_func_end ov74_022323D0

	thumb_func_start ov74_02232424
ov74_02232424: @ 0x02232424
	push {r3, lr}
	ldr r3, _02232468 @ =0x0000E880
	ldr r2, [r0, r3]
	adds r3, r3, #4
	ldr r3, [r0, r3]
	movs r0, #0x96
	lsls r0, r0, #4
	adds r2, r2, #4
	muls r0, r3, r0
	adds r2, r2, r0
	movs r0, #0x50
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0xc
	movs r2, #0
	bl ov74_02234530
	ldr r1, _0223246C @ =0x0223C9A8
	ldrh r1, [r1, #0x30]
	cmp r1, #0
	beq _02232462
	ldr r2, _02232470 @ =0x0223C9D8
_02232450:
	ldrh r1, [r2]
	cmp r0, r1
	bne _0223245A
	movs r0, #1
	pop {r3, pc}
_0223245A:
	adds r2, r2, #2
	ldrh r1, [r2]
	cmp r1, #0
	bne _02232450
_02232462:
	movs r0, #0
	pop {r3, pc}
	nop
_02232468: .4byte 0x0000E880
_0223246C: .4byte 0x0223C9A8
_02232470: .4byte 0x0223C9D8
	thumb_func_end ov74_02232424

	thumb_func_start ov74_02232474
ov74_02232474: @ 0x02232474
	push {r3, lr}
	ldr r3, _0223249C @ =0x0000E880
	ldr r2, [r0, r3]
	adds r3, r3, #4
	ldr r3, [r0, r3]
	movs r0, #0x96
	lsls r0, r0, #4
	adds r2, r2, #4
	muls r0, r3, r0
	adds r2, r2, r0
	movs r0, #0x50
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0xb
	movs r2, #0
	bl ov74_02234530
	bl ov74_02231764
	pop {r3, pc}
	.align 2, 0
_0223249C: .4byte 0x0000E880
	thumb_func_end ov74_02232474

	thumb_func_start ov74_022324A0
ov74_022324A0: @ 0x022324A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #0x6a
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [sp]
	adds r6, r1, #0
	movs r0, #0xc
	muls r0, r6, r0
	ldr r1, [sp]
	str r0, [sp, #4]
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022324CC
	bl FUN_020248B8
	cmp r0, #0
	bne _022324CC
	add sp, #0x14
	movs r0, #3
	pop {r4, r5, r6, r7, pc}
_022324CC:
	movs r5, #0
	movs r7, #0x3d
	mvns r5, r5
	movs r2, #0
	adds r3, r4, #0
	lsls r7, r7, #4
	b _022324F4
_022324DA:
	ldr r0, _02232628 @ =0x0000E884
	ldr r1, [r4, r0]
	ldr r0, [r3, r7]
	cmp r1, r0
	bne _022324F0
	movs r0, #0xf3
	lsls r0, r0, #2
	ldr r0, [r3, r0]
	cmp r6, r0
	bne _022324F0
	adds r5, r2, #0
_022324F0:
	adds r3, #0xc
	adds r2, r2, #1
_022324F4:
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _02232500
	cmp r2, #6
	blt _022324DA
_02232500:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov74_02232398
	cmp r0, #1
	bne _02232512
	add sp, #0x14
	movs r0, #4
	pop {r4, r5, r6, r7, pc}
_02232512:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov74_022323D0
	cmp r0, #1
	bne _02232524
	add sp, #0x14
	movs r0, #5
	pop {r4, r5, r6, r7, pc}
_02232524:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov74_02232424
	cmp r0, #1
	bne _02232536
	add sp, #0x14
	movs r0, #6
	pop {r4, r5, r6, r7, pc}
_02232536:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov74_02232474
	cmp r0, #1
	bne _02232548
	add sp, #0x14
	movs r0, #7
	pop {r4, r5, r6, r7, pc}
_02232548:
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _022325F0
	movs r0, #0x41
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #6
	bne _02232560
	add sp, #0x14
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_02232560:
	movs r5, #0
	movs r0, #0xf3
	adds r3, r4, #0
	lsls r0, r0, #2
	subs r1, r5, #1
_0223256A:
	ldr r2, [r3, r0]
	cmp r2, r1
	bne _022325E6
	ldr r1, [sp]
	ldr r0, [sp, #4]
	ldr r0, [r1, r0]
	bl FUN_020248AC
	adds r1, r0, #0
	movs r0, #0xc
	adds r7, r5, #0
	muls r7, r0, r7
	movs r0, #0xf2
	lsls r0, r0, #2
	adds r5, r4, r0
	ldr r0, [r5, r7]
	bl FUN_020247D4
	ldr r0, [r5, r7]
	bl FUN_020248AC
	adds r3, r0, #0
	add r2, sp, #8
	ldm r3!, {r0, r1}
	mov ip, r2
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #2
	str r0, [r2]
	ldr r0, [sp, #8]
	lsls r1, r1, #0xe
	subs r0, r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	lsrs r1, r1, #1
	subs r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [r5, r7]
	mov r1, ip
	bl FUN_020247D4
	ldr r0, [r5, r7]
	movs r1, #1
	bl FUN_02024830
	movs r1, #0xf3
	adds r3, r4, r7
	lsls r1, r1, #2
	ldr r0, _02232628 @ =0x0000E884
	str r6, [r3, r1]
	ldr r2, [r4, r0]
	adds r0, r1, #4
	str r2, [r3, r0]
	adds r0, r1, #0
	adds r0, #0x44
	ldr r0, [r4, r0]
	adds r1, #0x44
	adds r0, r0, #1
	str r0, [r4, r1]
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_022325E6:
	adds r5, r5, #1
	adds r3, #0xc
	cmp r5, #6
	blt _0223256A
	b _02232622
_022325F0:
	movs r0, #0xc
	adds r6, r5, #0
	muls r6, r0, r6
	movs r0, #0xf2
	adds r1, r4, r6
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	movs r2, #0
	movs r1, #0xf3
	mvns r2, r2
	adds r0, r4, r6
	lsls r1, r1, #2
	str r2, [r0, r1]
	adds r0, r1, #0
	adds r0, #0x44
	ldr r0, [r4, r0]
	adds r1, #0x44
	subs r0, r0, #1
	str r0, [r4, r1]
	add sp, #0x14
	movs r0, #2
	pop {r4, r5, r6, r7, pc}
_02232622:
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02232628: .4byte 0x0000E884
	thumb_func_end ov74_022324A0

	thumb_func_start ov74_0223262C
ov74_0223262C: @ 0x0223262C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
	subs r7, r4, #1
_02232636:
	movs r0, #0xf3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, r7
	beq _0223265C
	ldr r0, _02232674 @ =0x0000E884
	ldr r1, [r6, r0]
	movs r0, #0x3d
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r1, r0
	bne _0223265C
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	b _02232668
_0223265C:
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
_02232668:
	adds r4, r4, #1
	adds r5, #0xc
	cmp r4, #6
	blt _02232636
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232674: .4byte 0x0000E884
	thumb_func_end ov74_0223262C

	thumb_func_start ov74_02232678
ov74_02232678: @ 0x02232678
	push {r3, r4, r5, lr}
	sub sp, #0x60
	adds r5, r0, #0
	movs r0, #0
	adds r4, r1, #0
	add r3, sp, #0x14
	adds r1, r0, #0
	movs r2, #4
_02232688:
	stm r3!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02232688
	stm r3!, {r0, r1}
	str r0, [r3]
	ldr r0, _022326F0 @ =0x00000478
	adds r0, r5, r0
	str r0, [sp, #0x14]
	movs r0, #6
	str r0, [sp, #0x1c]
	movs r0, #0x15
	str r0, [sp, #0x20]
	movs r0, #0xd
	str r0, [sp, #0x24]
	movs r0, #2
	str r0, [sp, #0x28]
	subs r0, r0, #3
	str r0, [sp, #0x48]
	movs r0, #0
	str r0, [sp, #0x2c]
	str r0, [sp, #0x30]
	movs r0, #1
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	ldr r0, _022326F4 @ =0x00010200
	str r0, [sp, #0x40]
	movs r0, #0xa0
	str r0, [sp, #0x34]
	bl ov74_022339C8
	adds r3, r0, #0
	ldr r0, _022326F8 @ =0x0000E880
	movs r2, #9
	ldr r1, [r5, r0]
	ldr r0, _022326FC @ =0x00008344
	adds r1, r1, r0
	lsls r0, r4, #3
	adds r0, r4, r0
	adds r0, r1, r0
	add r1, sp, #0
	bl ov74_02236FB8
	add r0, sp, #0
	str r0, [sp, #0x4c]
	adds r0, r5, #0
	add r1, sp, #0x14
	movs r2, #1
	bl ov74_02231A1C
	add sp, #0x60
	pop {r3, r4, r5, pc}
	.align 2, 0
_022326F0: .4byte 0x00000478
_022326F4: .4byte 0x00010200
_022326F8: .4byte 0x0000E880
_022326FC: .4byte 0x00008344
	thumb_func_end ov74_02232678

	thumb_func_start ov74_02232700
ov74_02232700: @ 0x02232700
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x20]
	adds r6, r1, #0
	movs r1, #2
	bl FUN_0201CC08
	adds r4, r0, #0
	cmp r6, #0
	beq _02232724
	adds r0, r6, #0
	movs r1, #8
	movs r2, #0
	bl ov74_02234530
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	b _02232726
_02232724:
	movs r1, #0
_02232726:
	movs r2, #0
	movs r0, #1
_0223272A:
	adds r3, r1, #0
	tst r3, r0
	beq _02232736
	adds r6, r2, #0
	adds r6, #0x80
	b _0223273A
_02232736:
	adds r6, r2, #0
	adds r6, #0x60
_0223273A:
	adds r3, r4, #0
	adds r3, #0xd6
	lsls r1, r1, #0x17
	adds r2, r2, #1
	strh r6, [r3]
	lsrs r1, r1, #0x18
	adds r4, r4, #2
	cmp r2, #4
	blt _0223272A
	ldr r0, [r5, #0x20]
	movs r1, #2
	bl FUN_0201BF7C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov74_02232700

	thumb_func_start ov74_02232758
ov74_02232758: @ 0x02232758
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x78
	adds r5, r0, #0
	movs r0, #0
	adds r4, r1, #0
	add r3, sp, #0x2c
	adds r1, r0, #0
	movs r2, #4
_02232768:
	stm r3!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02232768
	stm r3!, {r0, r1}
	str r0, [r3]
	movs r1, #0x20
	str r1, [sp, #0x3c]
	movs r1, #1
	ldr r0, _02232908 @ =0x00000488
	str r1, [sp, #0x50]
	str r1, [sp, #0x54]
	movs r1, #0xbc
	str r1, [sp, #0x4c]
	ldr r1, _0223290C @ =0x000F0200
	adds r0, r5, r0
	str r1, [sp, #0x58]
	movs r1, #0x2c
	str r0, [sp, #0x2c]
	movs r0, #0
	str r1, [sp, #0x60]
	movs r1, #0x90
	movs r2, #4
	str r1, [sp, #0x44]
	str r0, [sp, #0x34]
	str r0, [sp, #0x38]
	str r0, [sp, #0x64]
	str r0, [sp, #0x48]
	adds r0, r5, #0
	add r1, sp, #0x2c
	str r2, [sp, #0x40]
	bl ov74_02231A1C
	movs r0, #0x2b
	str r0, [sp, #0x60]
	movs r0, #0x50
	str r0, [sp, #0x44]
	movs r0, #8
	str r0, [sp, #0x48]
	adds r0, r5, #0
	add r1, sp, #0x2c
	movs r2, #6
	bl ov74_02231A1C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov74_02232700
	cmp r4, #0
	bne _022327D6
	ldr r0, [sp, #0x2c]
	bl FUN_0201D578
	add sp, #0x78
	pop {r3, r4, r5, r6, r7, pc}
_022327D6:
	add r2, sp, #0x1c
	adds r0, r4, #0
	movs r1, #2
	adds r2, #2
	bl ov74_02234530
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0
	bl ov74_02234530
	adds r3, r0, #0
	add r0, sp, #0x1c
	adds r0, #2
	add r1, sp, #8
	movs r2, #0xb
	bl ov74_02236FB8
	add r0, sp, #8
	str r0, [sp, #0x64]
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x60]
	movs r0, #8
	str r0, [sp, #0x44]
	movs r0, #0
	str r0, [sp, #0x48]
	adds r0, r5, #0
	add r1, sp, #0x2c
	movs r2, #6
	bl ov74_02231A1C
	movs r0, #0x40
	movs r1, #0x4c
	bl FUN_02026354
	adds r6, r0, #0
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xed
	movs r3, #0x4c
	bl FUN_0200BAF8
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0
	bl ov74_02234530
	bl ov74_022349DC
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	adds r0, r7, #0
	adds r2, r6, #0
	bl FUN_0200BB6C
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x60]
	movs r0, #0x10
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	adds r0, r5, #0
	add r1, sp, #0x2c
	movs r2, #6
	str r6, [sp, #0x68]
	bl ov74_02231A1C
	adds r0, r7, #0
	bl FUN_0200BB44
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0
	bl ov74_02234530
	cmp r0, #0
	beq _022328B8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02077CB0
	adds r7, r0, #0
	movs r0, #0x40
	movs r1, #0x4c
	bl FUN_02026354
	lsls r1, r7, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x4c
	adds r6, r0, #0
	bl FUN_02077D40
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x60]
	movs r0, #0x98
	str r0, [sp, #0x44]
	movs r0, #0x10
	str r0, [sp, #0x48]
	adds r0, r5, #0
	add r1, sp, #0x2c
	movs r2, #6
	str r6, [sp, #0x68]
	bl ov74_02231A1C
	adds r0, r6, #0
	bl FUN_02026380
_022328B8:
	adds r0, r4, #0
	bl ov74_02234A0C
	adds r6, r0, #0
	movs r0, #0xa
	movs r1, #0x4c
	bl FUN_02026354
	movs r3, #1
	adds r1, r6, #0
	movs r2, #3
	adds r4, r0, #0
	str r3, [sp]
	bl FUN_02026464
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #0x60]
	movs r0, #0x64
	str r0, [sp, #0x44]
	movs r0, #8
	str r0, [sp, #0x48]
	adds r0, r5, #0
	add r1, sp, #0x2c
	movs r2, #2
	str r4, [sp, #0x68]
	bl ov74_02231A1C
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, [sp, #4]
	movs r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02006218
	add sp, #0x78
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232908: .4byte 0x00000488
_0223290C: .4byte 0x000F0200
	thumb_func_end ov74_02232758

	thumb_func_start ov74_02232910
ov74_02232910: @ 0x02232910
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x4c
	str r0, [sp, #8]
	adds r6, r2, #0
	movs r0, #0
	adds r4, r3, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	cmp r4, #0
	beq _02232938
	movs r0, #0x17
	str r0, [r4]
_02232938:
	str r6, [r5, #0x24]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov74_02232910

	thumb_func_start ov74_02232940
ov74_02232940: @ 0x02232940
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	adds r4, r3, #0
	str r0, [sp, #4]
	movs r0, #0x4c
	adds r6, r2, #0
	str r0, [sp, #8]
	ldr r3, _02232970 @ =0x00007FFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	cmp r4, #0
	beq _02232968
	movs r0, #0x17
	str r0, [r4]
_02232968:
	str r6, [r5, #0x24]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_02232970: .4byte 0x00007FFF
	thumb_func_end ov74_02232940

	thumb_func_start ov74_02232974
ov74_02232974: @ 0x02232974
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _02232A34 @ =0x0223B4F8
	add r3, sp, #0x70
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _02232A38 @ =0x0223B508
	add r3, sp, #0x54
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
	adds r3, r1, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _02232A3C @ =0x0223B524
	add r3, sp, #0x38
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #1
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _02232A40 @ =0x0223B540
	add r3, sp, #0x1c
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
	ldr r5, _02232A44 @ =0x0223B55C
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
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_02232A34: .4byte 0x0223B4F8
_02232A38: .4byte 0x0223B508
_02232A3C: .4byte 0x0223B524
_02232A40: .4byte 0x0223B540
_02232A44: .4byte 0x0223B55C
	thumb_func_end ov74_02232974

	thumb_func_start ov74_02232A48
ov74_02232A48: @ 0x02232A48
	push {r3, r4, r5, lr}
	sub sp, #0x38
	ldr r5, _02232AC0 @ =0x0223B578
	adds r4, r0, #0
	add r3, sp, #0x10
	movs r2, #5
_02232A54:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02232A54
	add r0, sp, #0x10
	bl FUN_02022BE8
	ldr r0, [r4, #0x20]
	bl ov74_02232974
	ldr r0, _02232AC4 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	bl FUN_02020080
	movs r1, #0x1e
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x4c
	bl FUN_02003030
	movs r0, #0xc0
	str r0, [sp]
	movs r0, #0x4c
	movs r2, #0
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0x17
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #5
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4c
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x20]
	movs r0, #0x71
	movs r1, #0x1a
	movs r3, #2
	bl FUN_020078F0
	movs r0, #2
	movs r1, #0x4c
	bl FUN_02002CEC
	add sp, #0x38
	pop {r3, r4, r5, pc}
	.align 2, 0
_02232AC0: .4byte 0x0223B578
_02232AC4: .4byte 0x021D116C
	thumb_func_end ov74_02232A48

	thumb_func_start ov74_02232AC8
ov74_02232AC8: @ 0x02232AC8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4c
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x20]
	movs r0, #0x71
	movs r1, #0x18
	movs r3, #2
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r2, #0
	ldr r1, [r4]
	ldr r0, _02232B14 @ =0x0223C960
	adds r3, r2, #0
	ldrb r0, [r0, r1]
	movs r1, #2
	str r0, [sp, #8]
	ldr r0, [r4, #0x20]
	bl FUN_0201CA4C
	ldr r0, [r4, #0x20]
	movs r1, #2
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_02232B14: .4byte 0x0223C960
	thumb_func_end ov74_02232AC8

	thumb_func_start ov74_02232B18
ov74_02232B18: @ 0x02232B18
	push {r4, lr}
	sub sp, #8
	movs r1, #7
	adds r4, r0, #0
	movs r0, #0
	lsls r1, r1, #6
	movs r2, #0x4c
	bl FUN_02003030
	movs r1, #0
	movs r2, #0x3f
	str r1, [sp]
	movs r0, #0x4c
	str r0, [sp, #4]
	ldr r0, [r4, #0x20]
	lsls r2, r2, #4
	movs r3, #0xe
	bl FUN_0200E3DC
	ldr r0, [r4, #0x1c]
	ldr r2, _02232BC0 @ =0x000003D2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x4c
	str r0, [sp, #4]
	ldr r0, [r4, #0x20]
	movs r1, #0
	movs r3, #0xd
	bl FUN_0200E644
	ldr r0, _02232BC4 @ =0x0000042C
	movs r1, #0
	adds r0, r4, r0
	movs r2, #0x4c
	blx FUN_020E5B44
	ldr r0, _02232BC8 @ =0x00000498
	movs r3, #0x1b
	adds r1, r0, #0
	adds r2, r4, r0
	subs r1, #0x6c
	str r2, [r4, r1]
	adds r1, r0, #0
	movs r2, #2
	subs r1, #0x64
	str r2, [r4, r1]
	adds r1, r0, #0
	movs r2, #1
	subs r1, #0x60
	str r2, [r4, r1]
	adds r1, r0, #0
	subs r1, #0x5c
	str r3, [r4, r1]
	adds r1, r0, #0
	movs r3, #4
	subs r1, #0x58
	str r3, [r4, r1]
	adds r3, r0, #0
	movs r1, #0
	subs r3, #0x48
	str r1, [r4, r3]
	adds r3, r0, #0
	subs r3, #0x44
	str r2, [r4, r3]
	adds r3, r0, #0
	subs r3, #0x4c
	str r2, [r4, r3]
	adds r2, r0, #0
	ldr r3, _02232BCC @ =0x0001020F
	subs r2, #0x40
	str r3, [r4, r2]
	adds r2, r0, #0
	ldr r3, _02232BD0 @ =0x000F020F
	subs r2, #0x3c
	str r3, [r4, r2]
	adds r2, r0, #0
	subs r2, #0x34
	str r1, [r4, r2]
	subs r0, #0x30
	str r1, [r4, r0]
	add sp, #8
	pop {r4, pc}
	nop
_02232BC0: .4byte 0x000003D2
_02232BC4: .4byte 0x0000042C
_02232BC8: .4byte 0x00000498
_02232BCC: .4byte 0x0001020F
_02232BD0: .4byte 0x000F020F
	thumb_func_end ov74_02232B18

	thumb_func_start ov74_02232BD4
ov74_02232BD4: @ 0x02232BD4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	adds r6, r0, #0
	movs r7, #0x6b
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_02232BE2:
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, r7]
	movs r1, #0
	bl FUN_02024830
	adds r5, r5, #1
	adds r4, #0xc
	cmp r5, #0x1e
	blt _02232BE2
	movs r7, #0xf2
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_02232C06:
	ldr r0, [r4, r7]
	movs r1, #0
	bl FUN_02024830
	adds r5, r5, #1
	adds r4, #0xc
	cmp r5, #6
	blt _02232C06
	movs r0, #0xe6
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xee
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_02024830
	movs r2, #0x61
	lsls r2, r2, #2
	add r0, sp, #0x1c
	adds r1, r6, #0
	adds r2, r6, r2
	movs r3, #1
	bl ov74_02231D48
	movs r0, #0x1c
	movs r7, #0
	str r0, [sp, #0x10]
	adds r4, r6, #0
	adds r5, r6, #0
_02232C54:
	ldr r0, [sp, #0x10]
	lsls r0, r0, #0xc
	str r0, [sp, #0x24]
	movs r0, #0x8e
	lsls r0, r0, #0xc
	str r0, [sp, #0x28]
	add r0, sp, #0x1c
	bl FUN_02024624
	ldr r1, _02232D94 @ =0x00000414
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, _02232D94 @ =0x00000414
	adds r1, r7, #0
	ldr r0, [r4, r0]
	adds r1, #0xa
	bl FUN_020248F0
	ldr r0, _02232D94 @ =0x00000414
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_02024A04
	ldr r0, _02232D94 @ =0x00000414
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_02024830
	movs r1, #0x3d
	movs r2, #0xf3
	lsls r1, r1, #4
	lsls r2, r2, #2
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	adds r0, r6, #0
	bl ov74_02231D70
	movs r1, #0x3d
	movs r2, #0xf3
	lsls r1, r1, #4
	lsls r2, r2, #2
	str r0, [sp, #0x14]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	adds r0, r6, #0
	bl ov74_02231D94
	movs r1, #0x3d
	movs r2, #0xf3
	lsls r1, r1, #4
	lsls r2, r2, #2
	str r0, [sp, #0x18]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	adds r0, r6, #0
	bl ov74_02231DB8
	adds r2, r0, #0
	ldr r0, _02232D94 @ =0x00000414
	str r7, [sp]
	ldr r0, [r4, r0]
	ldr r3, _02232D98 @ =0x021D116C
	str r0, [sp, #4]
	ldrb r3, [r3, #0xa]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl ov74_02231EC4
	ldr r0, [sp, #0x10]
	adds r7, r7, #1
	adds r0, #0x28
	str r0, [sp, #0x10]
	adds r4, r4, #4
	adds r5, #0xc
	cmp r7, #6
	blt _02232C54
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4c
	str r0, [sp, #0xc]
	ldr r2, [r6, #0x20]
	movs r0, #0x71
	movs r1, #0x19
	movs r3, #2
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r2, #0
	ldr r1, [r6]
	ldr r0, _02232D9C @ =0x0223C960
	adds r3, r2, #0
	ldrb r0, [r0, r1]
	movs r1, #2
	str r0, [sp, #8]
	ldr r0, [r6, #0x20]
	bl FUN_0201CA4C
	ldr r0, [r6, #0x20]
	movs r1, #2
	bl FUN_0201BF7C
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r1, #7
	movs r0, #0
	lsls r1, r1, #6
	movs r2, #0x4c
	bl FUN_02003030
	movs r1, #0
	movs r2, #0x3f
	str r1, [sp]
	movs r0, #0x4c
	str r0, [sp, #4]
	ldr r0, [r6, #0x20]
	lsls r2, r2, #4
	movs r3, #0xe
	bl FUN_0200E3DC
	ldr r0, [r6, #0x1c]
	ldr r2, _02232DA0 @ =0x000003D2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x4c
	str r0, [sp, #4]
	ldr r0, [r6, #0x20]
	movs r1, #0
	movs r3, #0xd
	bl FUN_0200E644
	adds r0, r6, #0
	bl ov74_02232B18
	movs r1, #0x46
	movs r0, #0xa
	lsls r1, r1, #4
	str r0, [r6, r1]
	subs r1, #0x34
	adds r0, r6, #0
	adds r1, r6, r1
	movs r2, #0x18
	bl ov74_02231A1C
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02232D94: .4byte 0x00000414
_02232D98: .4byte 0x021D116C
_02232D9C: .4byte 0x0223C960
_02232DA0: .4byte 0x000003D2
	thumb_func_end ov74_02232BD4

	thumb_func_start ov74_02232DA4
ov74_02232DA4: @ 0x02232DA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _02232DC0
	movs r1, #0
	bl FUN_0200E9BC
	adds r0, r4, #0
	bl FUN_0201D8C8
	adds r0, r4, #0
	bl FUN_0201D520
_02232DC0:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov74_02232DA4

	thumb_func_start ov74_02232DC4
ov74_02232DC4: @ 0x02232DC4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _02232E34 @ =0x00000414
	movs r4, #0
	adds r5, r6, #0
_02232DCE:
	ldr r0, [r5, r7]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _02232DCE
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	ldr r0, _02232E38 @ =0x00000498
	adds r0, r6, r0
	bl ov74_02232DA4
	movs r0, #0xe6
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xee
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xf3
	movs r5, #0
	lsls r0, r0, #2
	adds r4, r6, #0
	subs r3, r5, #1
	movs r2, #0xe
	adds r1, r0, #4
_02232E1E:
	str r3, [r4, r0]
	str r2, [r4, r1]
	adds r5, r5, #1
	adds r4, #0xc
	cmp r5, #6
	blt _02232E1E
	movs r0, #0x41
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r6, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02232E34: .4byte 0x00000414
_02232E38: .4byte 0x00000498
	thumb_func_end ov74_02232DC4

	thumb_func_start ov74_02232E3C
ov74_02232E3C: @ 0x02232E3C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r7, #0x6a
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_02232E50:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _02232E5A
	bl FUN_02024758
_02232E5A:
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02232E68
	bl FUN_02024758
_02232E68:
	adds r4, r4, #1
	adds r5, #0xc
	cmp r4, #0x1e
	blt _02232E50
	movs r7, #0xf2
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_02232E78:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02232E82
	bl FUN_02024758
_02232E82:
	adds r5, r5, #1
	adds r4, #0xc
	cmp r5, #6
	blt _02232E78
	movs r0, #0xe6
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02232E98
	bl FUN_02024758
_02232E98:
	movs r0, #0xee
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02232EA6
	bl FUN_02024758
_02232EA6:
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02232EB4
	bl FUN_02024758
_02232EB4:
	ldr r0, _02232F48 @ =0x00000478
	adds r0, r6, r0
	bl ov74_02232DA4
	ldr r0, _02232F4C @ =0x00000488
	adds r0, r6, r0
	bl ov74_02232DA4
	ldr r0, _02232F50 @ =0x00000498
	adds r0, r6, r0
	bl ov74_02232DA4
	movs r0, #2
	bl FUN_02002DB4
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	movs r7, #0x55
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_02232EEE:
	ldr r0, [r4, r7]
	bl FUN_0200A0D0
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #6
	blt _02232EEE
	ldr r0, [r6, #0x28]
	bl FUN_02024504
	movs r0, #0
	str r0, [r6, #0x28]
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	ldr r0, _02232F54 @ =0x0000E88C
	ldr r0, [r6, r0]
	bl FUN_02016624
	ldr r0, _02232F58 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	ldr r0, [r6, #0x20]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r6, #0x20]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r6, #0x20]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r6, #0x20]
	movs r1, #3
	bl FUN_0201BB4C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232F48: .4byte 0x00000478
_02232F4C: .4byte 0x00000488
_02232F50: .4byte 0x00000498
_02232F54: .4byte 0x0000E88C
_02232F58: .4byte 0x021D116C
	thumb_func_end ov74_02232E3C

	thumb_func_start ov74_02232F5C
ov74_02232F5C: @ 0x02232F5C
	push {lr}
	sub sp, #0x14
	ldr r1, [r0, #0x20]
	movs r3, #0
	str r1, [sp]
	movs r1, #2
	lsls r1, r1, #8
	str r1, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	str r3, [sp, #4]
	movs r1, #0x19
	add r2, sp, #0
	strb r1, [r2, #0x10]
	movs r1, #7
	strb r1, [r2, #0x11]
	strb r3, [r2, #0x13]
	ldrb r3, [r2, #0x12]
	movs r1, #0xf0
	bics r3, r1
	movs r1, #0x10
	orrs r1, r3
	strb r1, [r2, #0x12]
	ldr r1, _02232F98 @ =0x0000E88C
	ldr r0, [r0, r1]
	add r1, sp, #0
	bl FUN_020166FC
	add sp, #0x14
	pop {pc}
	.align 2, 0
_02232F98: .4byte 0x0000E88C
	thumb_func_end ov74_02232F5C

	thumb_func_start ov74_02232F9C
ov74_02232F9C: @ 0x02232F9C
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r5, r0, #0
	bl ov74_02233F84
	adds r4, r0, #0
	bl ov74_022339C8
	adds r3, r0, #0
	adds r0, r4, #0
	add r1, sp, #8
	movs r2, #8
	bl ov74_02236FB8
	movs r0, #0x4c
	bl FUN_0200BD08
	adds r4, r0, #0
	movs r0, #8
	movs r1, #0x4c
	bl FUN_02026354
	add r1, sp, #8
	adds r6, r0, #0
	bl FUN_020269A0
	movs r1, #1
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #0
	bl FUN_0200BE3C
	adds r0, r5, #0
	bl ov74_02232B18
	ldr r0, [r5]
	movs r2, #0x18
	lsls r1, r0, #2
	ldr r0, _02233020 @ =0x0223C980
	ldr r0, [r0, r1]
	movs r1, #0x46
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	adds r0, #0xc
	subs r1, #0x34
	str r4, [r5, r0]
	adds r0, r5, #0
	adds r1, r5, r1
	bl ov74_02231A1C
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0200BDA0
	adds r0, r5, #0
	bl ov74_02232F5C
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_02233020: .4byte 0x0223C980
	thumb_func_end ov74_02232F9C

	thumb_func_start ov74_02233024
ov74_02233024: @ 0x02233024
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02233054 @ =0x00012604
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02233038
	blx r0
	ldr r0, _02233054 @ =0x00012604
	movs r1, #0
	str r1, [r4, r0]
_02233038:
	bl FUN_0202061C
	bl FUN_0200B224
	ldr r0, [r4, #0x20]
	bl FUN_0201EEB4
	ldr r3, _02233058 @ =0x027E0000
	ldr r1, _0223305C @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_02233054: .4byte 0x00012604
_02233058: .4byte 0x027E0000
_0223305C: .4byte 0x00003FF8
	thumb_func_end ov74_02233024

	thumb_func_start ov74_02233060
ov74_02233060: @ 0x02233060
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	ldr r0, [r0, #0x10]
	bl FUN_020270F8
	movs r6, #0
	str r0, [sp, #8]
	str r6, [sp, #4]
	adds r7, r6, #0
_02233074:
	movs r4, #0
	adds r5, r4, #0
_02233078:
	ldr r1, [sp]
	ldr r0, _022330CC @ =0x0000E880
	movs r2, #0
	ldr r0, [r1, r0]
	movs r1, #5
	adds r0, r0, #4
	adds r0, r0, r7
	adds r0, r0, r5
	bl ov74_02234530
	cmp r0, #0
	beq _02233092
	adds r6, r6, #1
_02233092:
	adds r4, r4, #1
	adds r5, #0x50
	cmp r4, #0x1e
	blt _02233078
	movs r0, #0x96
	lsls r0, r0, #4
	adds r7, r7, r0
	ldr r0, [sp, #4]
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #0xe
	blt _02233074
	cmp r6, #6
	bge _022330B4
	add sp, #0xc
	movs r0, #5
	pop {r4, r5, r6, r7, pc}
_022330B4:
	ldr r0, [sp, #8]
	bl FUN_0202EC98
	cmp r0, #0
	beq _022330C4
	add sp, #0xc
	movs r0, #6
	pop {r4, r5, r6, r7, pc}
_022330C4:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022330CC: .4byte 0x0000E880
	thumb_func_end ov74_02233060

	thumb_func_start ov74_022330D0
ov74_022330D0: @ 0x022330D0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _0223310C
	bl ov74_02232B18
	movs r0, #1
	bl FUN_02002B8C
	ldr r0, _0223312C @ =0x0223C9B8
	lsls r1, r4, #2
	ldr r0, [r0, r1]
	movs r1, #0x46
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r1, #0x34
	movs r2, #1
	adds r0, #0x10
	str r2, [r5, r0]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r2, #0x18
	bl ov74_02231A1C
	movs r0, #0
	str r0, [r5, #4]
	b _02233126
_0223310C:
	ldr r0, _02233130 @ =0x00000474
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02233126
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #1
	pop {r3, r4, r5, pc}
_02233126:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223312C: .4byte 0x0223C9B8
_02233130: .4byte 0x00000474
	thumb_func_end ov74_022330D0

	thumb_func_start ov74_02233134
ov74_02233134: @ 0x02233134
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _02233170
	bl ov74_02232B18
	movs r0, #1
	bl FUN_02002B8C
	ldr r0, _02233194 @ =0x0223C9B8
	lsls r1, r4, #2
	ldr r0, [r0, r1]
	movs r1, #0x46
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r1, #0x34
	movs r2, #1
	adds r0, #0x10
	str r2, [r5, r0]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r2, #0x18
	bl ov74_02231A1C
	movs r0, #0
	str r0, [r5, #4]
	b _02233190
_02233170:
	ldr r0, _02233198 @ =0x00000474
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02233190
	adds r0, r5, #0
	bl ov74_02232F5C
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #1
	pop {r3, r4, r5, pc}
_02233190:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02233194: .4byte 0x0223C9B8
_02233198: .4byte 0x00000474
	thumb_func_end ov74_02233134

	thumb_func_start ov74_0223319C
ov74_0223319C: @ 0x0223319C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0
	ldr r2, [r5, #8]
	mvns r1, r1
	cmp r2, r1
	beq _022331DE
	bl ov74_02232B18
	movs r0, #1
	bl FUN_02002B8C
	movs r1, #0x46
	ldr r0, [r5, #8]
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	adds r0, #0x10
	subs r1, #0x34
	str r4, [r5, r0]
	adds r0, r5, #0
	adds r1, r5, r1
	movs r2, #0x18
	bl ov74_02231A1C
	movs r0, #0
	mvns r0, r0
	str r0, [r5, #8]
	ldr r0, _02233220 @ =0x000005DC
	bl FUN_0200604C
	b _0223321C
_022331DE:
	cmp r4, #0
	beq _022331FC
	ldr r0, _02233224 @ =0x00000474
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223321C
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #1
	pop {r3, r4, r5, pc}
_022331FC:
	ldr r0, _02233228 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	bne _0223320C
	ldr r0, _0223322C @ =0x021D110C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _0223321C
_0223320C:
	movs r0, #0
	bl FUN_02002B8C
	ldr r0, _02233220 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223321C:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02233220: .4byte 0x000005DC
_02233224: .4byte 0x00000474
_02233228: .4byte 0x021D114C
_0223322C: .4byte 0x021D110C
	thumb_func_end ov74_0223319C

	thumb_func_start ov74_02233230
ov74_02233230: @ 0x02233230
	push {r3, r4, r5, lr}
	movs r2, #0xe
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x4c
	lsls r2, r2, #0xe
	bl FUN_0201A910
	ldr r1, _022332D8 @ =0x00012610
	adds r0, r5, #0
	movs r2, #0x4c
	bl FUN_02007280
	ldr r2, _022332D8 @ =0x00012610
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x4c
	bl FUN_0201AC88
	str r0, [r4, #0x20]
	movs r0, #0x4c
	bl FUN_0201660C
	ldr r1, _022332DC @ =0x0000E88C
	str r0, [r4, r1]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	adds r0, r5, #0
	bl FUN_020072A4
	ldr r0, [r0, #8]
	str r0, [r4, #0x10]
	bl FUN_02028E9C
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	bl FUN_02028EA8
	str r0, [r4, #0x18]
	bl FUN_0202ADCC
	str r0, [r4, #0x1c]
	movs r0, #6
	lsls r0, r0, #6
	movs r1, #0x4c
	bl FUN_02026354
	ldr r1, _022332E0 @ =0x00012608
	str r0, [r4, r1]
	movs r0, #6
	lsls r0, r0, #6
	movs r1, #0x4c
	bl FUN_02026354
	ldr r1, _022332E4 @ =0x0001260C
	movs r2, #1
	str r0, [r4, r1]
	ldr r1, _022332E8 @ =0x0000047E
	movs r0, #9
	bl FUN_02004EC4
	blx FUN_020D3438
	cmp r0, #0
	bne _022332C6
	blx FUN_020D33C0
_022332C6:
	bl ov74_02236074
	ldr r0, _022332EC @ =0x0000E89C
	adds r1, r4, r0
	ldr r0, _022332F0 @ =0x0223D338
	str r1, [r0]
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_022332D8: .4byte 0x00012610
_022332DC: .4byte 0x0000E88C
_022332E0: .4byte 0x00012608
_022332E4: .4byte 0x0001260C
_022332E8: .4byte 0x0000047E
_022332EC: .4byte 0x0000E89C
_022332F0: .4byte 0x0223D338
	thumb_func_end ov74_02233230

	thumb_func_start ov74_022332F4
ov74_022332F4: @ 0x022332F4
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	blx FUN_020E1134
	blx FUN_020E10E8
	cmp r0, #1
	beq _02233312
	ldr r0, _02233618 @ =0x02111864
	ldr r0, [r0]
	cmp r0, #0
	beq _02233328
_02233312:
	ldr r0, _0223361C @ =0x0000E890
	ldr r0, [r4, r0]
	subs r0, r0, #3
	cmp r0, #1
	bhi _02233322
	ldr r0, [r4, #0x10]
	bl FUN_020275A4
_02233322:
	movs r0, #0x4c
	bl FUN_020927D0
_02233328:
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r5]
	cmp r0, #0x18
	bhi _02233424
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02233340: @ jump table
	.2byte _02233372 - _02233340 - 2 @ case 0
	.2byte _022333BA - _02233340 - 2 @ case 1
	.2byte _02233400 - _02233340 - 2 @ case 2
	.2byte _02233414 - _02233340 - 2 @ case 3
	.2byte _0223344E - _02233340 - 2 @ case 4
	.2byte _02233466 - _02233340 - 2 @ case 5
	.2byte _022334BC - _02233340 - 2 @ case 6
	.2byte _022334CE - _02233340 - 2 @ case 7
	.2byte _022334EC - _02233340 - 2 @ case 8
	.2byte _022334FE - _02233340 - 2 @ case 9
	.2byte _0223355C - _02233340 - 2 @ case 10
	.2byte _02233574 - _02233340 - 2 @ case 11
	.2byte _02233588 - _02233340 - 2 @ case 12
	.2byte _022335C8 - _02233340 - 2 @ case 13
	.2byte _022336F6 - _02233340 - 2 @ case 14
	.2byte _02233710 - _02233340 - 2 @ case 15
	.2byte _0223372C - _02233340 - 2 @ case 16
	.2byte _02233746 - _02233340 - 2 @ case 17
	.2byte _0223377C - _02233340 - 2 @ case 18
	.2byte _022337A2 - _02233340 - 2 @ case 19
	.2byte _0223380C - _02233340 - 2 @ case 20
	.2byte _02233818 - _02233340 - 2 @ case 21
	.2byte _0223385A - _02233340 - 2 @ case 22
	.2byte _0223387E - _02233340 - 2 @ case 23
	.2byte _0223388C - _02233340 - 2 @ case 24
_02233372:
	bl ov74_022339B0
	movs r0, #0x4b
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov74_02233938
	ldr r1, _02233620 @ =0x000004A8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _022333AE
	bl ov74_02233CE4
	ldr r1, _02233624 @ =0x000004AC
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _022333AA
	bl ov74_02233F4C
	ldr r1, _02233628 @ =0x0000E880
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	ldrb r2, [r0]
	adds r0, r1, #4
	str r2, [r4, r0]
	b _022333AE
_022333AA:
	movs r0, #1
	str r0, [r4, #4]
_022333AE:
	adds r0, r4, #0
	bl ov74_02231790
	movs r0, #1
	str r0, [r5]
	b _02233896
_022333BA:
	adds r0, r4, #0
	bl ov74_02232A48
	bl ov74_02231BC0
	adds r0, r4, #0
	bl ov74_02231BF0
	adds r0, r4, #0
	bl ov74_02231CFC
	adds r0, r4, #0
	bl ov74_022322D8
	ldr r0, _0223362C @ =ov74_02233024
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _022333FA
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xb
	adds r3, r5, #0
	bl ov74_02232910
	b _02233896
_022333FA:
	movs r0, #2
	str r0, [r5]
	b _02233896
_02233400:
	adds r0, r4, #0
	bl ov74_02232F9C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	adds r3, r5, #0
	bl ov74_02232910
	b _02233896
_02233414:
	ldr r0, _02233630 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _02233426
	cmp r0, #2
	beq _02233438
_02233424:
	b _02233896
_02233426:
	ldr r0, _02233630 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	movs r0, #0x22
	str r0, [r4, #8]
	movs r0, #4
	str r0, [r5]
	b _02233896
_02233438:
	ldr r0, _02233630 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x18
	adds r3, r5, #0
	bl ov74_02232940
	b _02233896
_0223344E:
	adds r0, r4, #0
	movs r1, #1
	bl ov74_0223319C
	cmp r0, #0
	beq _02233476
	adds r0, r4, #0
	bl ov74_02232F5C
	movs r0, #5
	str r0, [r5]
	b _02233896
_02233466:
	ldr r0, _02233630 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _02233478
	cmp r0, #2
	beq _022334A6
_02233476:
	b _02233896
_02233478:
	ldr r0, _02233630 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	bl ov74_02233060
	str r0, [r4, #4]
	cmp r0, #0
	beq _0223349E
	subs r0, r0, #3
	cmp r0, #1
	bhi _02233498
	movs r0, #8
	str r0, [r5]
	b _02233896
_02233498:
	movs r0, #0xb
	str r0, [r5]
	b _02233896
_0223349E:
	movs r0, #6
	str r0, [r4, #8]
	str r0, [r5]
	b _02233896
_022334A6:
	ldr r0, _02233630 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x18
	adds r3, r5, #0
	bl ov74_02232940
	b _02233896
_022334BC:
	adds r0, r4, #0
	movs r1, #1
	bl ov74_0223319C
	cmp r0, #0
	beq _0223350E
	movs r0, #7
	str r0, [r5]
	b _02233896
_022334CE:
	ldr r0, _02233634 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	bne _022334DE
	ldr r0, _02233638 @ =0x021D110C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _0223350E
_022334DE:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xc
	adds r3, r5, #0
	bl ov74_02232910
	b _02233896
_022334EC:
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl ov74_02233134
	cmp r0, #0
	beq _0223350E
	movs r0, #9
	str r0, [r5]
	b _02233896
_022334FE:
	ldr r0, _02233630 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _02233510
	cmp r0, #2
	beq _02233546
_0223350E:
	b _02233896
_02233510:
	ldr r0, _02233630 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	movs r1, #0x47
	lsls r1, r1, #4
	movs r2, #0
	adds r0, r1, #0
	str r2, [r4, r1]
	subs r1, #0x44
	movs r3, #0x28
	subs r0, #0x10
	str r3, [r4, r0]
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov74_02231A1C
	ldr r1, _0223363C @ =0x00000498
	adds r0, r4, r1
	subs r1, #0xc6
	bl FUN_0200F0AC
	ldr r1, _02233640 @ =0x0000E898
	str r0, [r4, r1]
	movs r0, #0xa
	str r0, [r5]
	b _02233896
_02233546:
	ldr r0, _02233630 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x18
	adds r3, r5, #0
	bl ov74_02232940
	b _02233896
_0223355C:
	adds r0, r4, #0
	bl ov74_02231930
	ldr r0, _02233640 @ =0x0000E898
	ldr r0, [r4, r0]
	bl FUN_0200F450
	movs r0, #7
	str r0, [r4, #4]
	movs r0, #0xb
	str r0, [r5]
	b _02233896
_02233574:
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl ov74_022330D0
	cmp r0, #0
	bne _02233582
	b _02233896
_02233582:
	movs r0, #0x16
	str r0, [r5]
	b _02233896
_02233588:
	ldr r0, _0223363C @ =0x00000498
	adds r0, r4, r0
	bl ov74_02232DA4
	adds r0, r4, #0
	bl ov74_02232AC8
	adds r0, r4, #0
	bl ov74_02232154
	adds r0, r4, #0
	bl ov74_02231FF4
	ldr r0, _0223362C @ =ov74_02233024
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02232758
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xd
	adds r3, r5, #0
	bl ov74_02232910
	b _02233896
_022335C8:
	movs r0, #0x31
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_02025224
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _022336A2
	cmp r6, #0x1e
	bge _02233698
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov74_022324A0
	cmp r0, #1
	bne _02233652
	ldr r2, _02233628 @ =0x0000E880
	adds r0, r4, #0
	ldr r1, [r4, r2]
	adds r2, r2, #4
	ldr r3, [r4, r2]
	movs r2, #0x96
	lsls r2, r2, #4
	adds r1, r1, #4
	muls r2, r3, r2
	adds r2, r1, r2
	movs r1, #0x50
	muls r1, r6, r1
	adds r1, r2, r1
	bl ov74_02232758
	movs r0, #0x41
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #6
	bne _022336A2
	ldr r0, _02233644 @ =0x0000E888
	b _02233648
	.align 2, 0
_02233618: .4byte 0x02111864
_0223361C: .4byte 0x0000E890
_02233620: .4byte 0x000004A8
_02233624: .4byte 0x000004AC
_02233628: .4byte 0x0000E880
_0223362C: .4byte ov74_02233024
_02233630: .4byte 0x0000E88C
_02233634: .4byte 0x021D114C
_02233638: .4byte 0x021D110C
_0223363C: .4byte 0x00000498
_02233640: .4byte 0x0000E898
_02233644: .4byte 0x0000E888
_02233648:
	movs r1, #0x2d
	str r1, [r4, r0]
	movs r0, #0xf
	str r0, [r5]
	b _02233896
_02233652:
	cmp r0, #2
	bne _02233660
	adds r0, r4, #0
	movs r1, #0
	bl ov74_02232758
	b _02233896
_02233660:
	cmp r0, #4
	bne _0223366E
	movs r0, #8
	str r0, [r4, #8]
	movs r0, #0xe
	str r0, [r5]
	b _02233896
_0223366E:
	cmp r0, #5
	bne _0223367C
	movs r0, #9
	str r0, [r4, #8]
	movs r0, #0xe
	str r0, [r5]
	b _02233896
_0223367C:
	cmp r0, #6
	bne _0223368A
	movs r0, #0x26
	str r0, [r4, #8]
	movs r0, #0xe
	str r0, [r5]
	b _02233896
_0223368A:
	cmp r0, #7
	bne _022336A2
	movs r0, #0x26
	str r0, [r4, #8]
	movs r0, #0xe
	str r0, [r5]
	b _02233896
_02233698:
	beq _022336E2
	cmp r6, #0x1f
	beq _022336A4
	cmp r6, #0x20
	beq _022336C2
_022336A2:
	b _02233896
_022336A4:
	ldr r0, _022338A4 @ =0x0000E884
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _022336B0
	movs r1, #0xd
	b _022336B2
_022336B0:
	subs r1, r1, #1
_022336B2:
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov74_02231FF4
	ldr r0, _022338A8 @ =0x000005DC
	bl FUN_0200604C
	b _02233896
_022336C2:
	ldr r0, _022338A4 @ =0x0000E884
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0xe
	bne _022336D4
	movs r1, #0
	str r1, [r4, r0]
_022336D4:
	adds r0, r4, #0
	bl ov74_02231FF4
	ldr r0, _022338A8 @ =0x000005DC
	bl FUN_0200604C
	b _02233896
_022336E2:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x18
	adds r3, r5, #0
	bl ov74_02232940
	ldr r0, _022338A8 @ =0x000005DC
	bl FUN_0200604C
	b _02233896
_022336F6:
	adds r0, r4, #0
	movs r1, #0
	bl ov74_0223319C
	cmp r0, #0
	beq _02233756
	ldr r0, _022338AC @ =0x00000498
	adds r0, r4, r0
	bl ov74_02232DA4
	movs r0, #0xd
	str r0, [r5]
	b _02233896
_02233710:
	ldr r0, _022338B0 @ =0x0000E888
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02233756
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x10
	adds r3, r5, #0
	bl ov74_02232910
	b _02233896
_0223372C:
	adds r0, r4, #0
	bl ov74_02232BD4
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x11
	adds r3, r5, #0
	bl ov74_02232910
	adds r0, r4, #0
	bl ov74_02232F5C
	b _02233896
_02233746:
	ldr r0, _022338B4 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _02233758
	cmp r0, #2
	beq _02233766
_02233756:
	b _02233896
_02233758:
	ldr r0, _022338B4 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	movs r0, #0x12
	str r0, [r5]
	b _02233896
_02233766:
	ldr r0, _022338B4 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	adds r3, r5, #0
	bl ov74_02232910
	b _02233896
_0223377C:
	movs r1, #0x46
	movs r0, #0xb
	lsls r1, r1, #4
	str r0, [r4, r1]
	subs r1, #0x34
	adds r0, r4, #0
	adds r1, r4, r1
	movs r2, #0
	bl ov74_02231A1C
	adds r0, r4, #0
	bl ov74_02232F5C
	ldr r0, _022338A8 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x13
	str r0, [r5]
	b _02233896
_022337A2:
	ldr r0, _022338B4 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _022337B4
	cmp r0, #2
	beq _022337F6
	b _02233896
_022337B4:
	ldr r0, [r4]
	movs r2, #0
	lsls r1, r0, #2
	ldr r0, _022338B8 @ =0x0223C968
	ldr r0, [r0, r1]
	movs r1, #0x46
	lsls r1, r1, #4
	str r0, [r4, r1]
	subs r1, #0x34
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov74_02231A1C
	ldr r0, _022338B4 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	ldr r0, _022338BC @ =0x0000E890
	movs r1, #0
	str r1, [r4, r0]
	ldr r1, _022338AC @ =0x00000498
	adds r0, r4, r1
	subs r1, #0xc6
	bl FUN_0200F0AC
	ldr r1, _022338C0 @ =0x0000E898
	str r0, [r4, r1]
	movs r0, #0x15
	str r0, [r5]
	movs r0, #4
	bl FUN_0201A728
	b _02233896
_022337F6:
	ldr r0, _022338B4 @ =0x0000E88C
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	adds r3, r5, #0
	bl ov74_02232910
	b _02233896
_0223380C:
	adds r0, r4, #0
	bl ov74_02232DC4
	movs r0, #0xc
	str r0, [r5]
	b _02233896
_02233818:
	adds r0, r4, #0
	bl ov74_022317D8
	adds r6, r0, #0
	cmp r6, #0xa
	beq _02233896
	ldr r0, _022338C0 @ =0x0000E898
	ldr r0, [r4, r0]
	bl FUN_0200F450
	ldr r0, _022338C4 @ =0x0000061A
	bl FUN_0200604C
	cmp r6, #0xb
	bne _0223383A
	movs r1, #0x1d
	b _0223383C
_0223383A:
	movs r1, #0x24
_0223383C:
	movs r0, #0x46
	lsls r0, r0, #4
	str r1, [r4, r0]
	ldr r1, _022338C8 @ =0x0000042C
	adds r0, r4, #0
	adds r1, r4, r1
	movs r2, #0
	bl ov74_02231A1C
	movs r0, #0x16
	str r0, [r5]
	movs r0, #4
	bl FUN_0201A738
	b _02233896
_0223385A:
	ldr r0, _022338CC @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	bne _0223386A
	ldr r0, _022338D0 @ =0x021D110C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _02233896
_0223386A:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x18
	adds r3, r5, #0
	bl ov74_02232940
	ldr r0, _022338A8 @ =0x000005DC
	bl FUN_0200604C
	b _02233896
_0223387E:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02233896
	ldr r0, [r4, #0x24]
	str r0, [r5]
	b _02233896
_0223388C:
	adds r0, r4, #0
	bl ov74_02232E3C
	movs r0, #1
	pop {r4, r5, r6, pc}
_02233896:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _022338A0
	bl FUN_0202457C
_022338A0:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_022338A4: .4byte 0x0000E884
_022338A8: .4byte 0x000005DC
_022338AC: .4byte 0x00000498
_022338B0: .4byte 0x0000E888
_022338B4: .4byte 0x0000E88C
_022338B8: .4byte 0x0223C968
_022338BC: .4byte 0x0000E890
_022338C0: .4byte 0x0000E898
_022338C4: .4byte 0x0000061A
_022338C8: .4byte 0x0000042C
_022338CC: .4byte 0x021D114C
_022338D0: .4byte 0x021D110C
	thumb_func_end ov74_022332F4

	thumb_func_start ov74_022338D4
ov74_022338D4: @ 0x022338D4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, _02233914 @ =0x00012608
	ldr r0, [r4, r0]
	bl FUN_02026380
	ldr r0, _02233918 @ =0x0001260C
	ldr r0, [r4, r0]
	bl FUN_02026380
	ldr r0, [r4, #0x20]
	bl FUN_0201AB0C
	ldr r0, _0223391C @ =0x0000003C
	ldr r1, _02233920 @ =0x021EAFE0
	bl FUN_02000EF4
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x4c
	bl FUN_0201A9C4
	movs r0, #0
	bl ov74_02236034
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_02233914: .4byte 0x00012608
_02233918: .4byte 0x0001260C
_0223391C: .4byte 0x0000003C
_02233920: .4byte 0x021EAFE0
	thumb_func_end ov74_022338D4

	thumb_func_start ov74_02233924
ov74_02233924: @ 0x02233924
	push {r3, lr}
	movs r0, #1
	blx FUN_020E1A3C
	cmp r0, #0
	bne _02233934
	movs r0, #1
	pop {r3, pc}
_02233934:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov74_02233924

	thumb_func_start ov74_02233938
ov74_02233938: @ 0x02233938
	push {r3, lr}
	ldr r1, _02233994 @ =0x0223D33C
	str r0, [r1, #8]
	ldr r0, _02233998 @ =0x0223CAFC
	ldr r0, [r0]
	cmp r0, #0
	beq _0223394A
	movs r0, #0xc
	pop {r3, pc}
_0223394A:
	ldr r0, _0223399C @ =0x0223B5A0
	movs r1, #0x1e
	bl ov74_022339D4
	cmp r0, #0
	bne _02233992
	ldr r0, _02233998 @ =0x0223CAFC
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0223397A
	movs r0, #0x89
	ldr r1, _022339A0 @ =0x0223D3BC
	lsls r0, r0, #4
	str r0, [r1, #0x20]
	movs r0, #0xeb
	lsls r0, r0, #6
	str r0, [r1, #0x24]
	ldr r2, _022339A4 @ =0x00001220
	ldr r0, _02233994 @ =0x0223D33C
	str r2, [r0, #0x68]
	movs r0, #9
	str r0, [r1, #0x30]
	b _02233984
_0223397A:
	ldr r0, _022339A8 @ =0x08000100
	ldr r1, _022339AC @ =0x0223D354
	movs r2, #0xfc
	blx FUN_020E140C
_02233984:
	bl ov74_02233924
	cmp r0, #0
	bne _02233990
	movs r0, #3
	pop {r3, pc}
_02233990:
	movs r0, #0
_02233992:
	pop {r3, pc}
	.align 2, 0
_02233994: .4byte 0x0223D33C
_02233998: .4byte 0x0223CAFC
_0223399C: .4byte 0x0223B5A0
_022339A0: .4byte 0x0223D3BC
_022339A4: .4byte 0x00001220
_022339A8: .4byte 0x08000100
_022339AC: .4byte 0x0223D354
	thumb_func_end ov74_02233938

	thumb_func_start ov74_022339B0
ov74_022339B0: @ 0x022339B0
	ldr r0, _022339B8 @ =0x0223CAFC
	movs r1, #0
	str r1, [r0]
	bx lr
	.align 2, 0
_022339B8: .4byte 0x0223CAFC
	thumb_func_end ov74_022339B0

	thumb_func_start ov74_022339BC
ov74_022339BC: @ 0x022339BC
	ldr r0, _022339C4 @ =0x0223CAFC
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	bx lr
	.align 2, 0
_022339C4: .4byte 0x0223CAFC
	thumb_func_end ov74_022339BC

	thumb_func_start ov74_022339C8
ov74_022339C8: @ 0x022339C8
	ldr r0, _022339D0 @ =0x0223CAFC
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	bx lr
	.align 2, 0
_022339D0: .4byte 0x0223CAFC
	thumb_func_end ov74_022339C8

	thumb_func_start ov74_022339D4
ov74_022339D4: @ 0x022339D4
	push {r3, r4, r5, lr}
	sub sp, #0xc0
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _02233A80 @ =0x0223CAFC
	movs r1, #0
	str r1, [r0]
	blx FUN_020E0FF0
	cmp r0, #0
	bne _022339F0
	add sp, #0xc0
	movs r0, #1
	pop {r3, r4, r5, pc}
_022339F0:
	blx FUN_020E1058
	movs r2, #0
	cmp r4, #0
	ble _02233A14
	adds r3, r5, #0
_022339FC:
	ldr r1, [r3]
	cmp r0, r1
	bne _02233A0C
	lsls r0, r2, #3
	adds r1, r5, r0
	ldr r0, _02233A80 @ =0x0223CAFC
	str r1, [r0]
	b _02233A14
_02233A0C:
	adds r2, r2, #1
	adds r3, #8
	cmp r2, r4
	blt _022339FC
_02233A14:
	ldr r0, _02233A80 @ =0x0223CAFC
	ldr r0, [r0]
	cmp r0, #0
	bne _02233A22
	add sp, #0xc0
	movs r0, #2
	pop {r3, r4, r5, pc}
_02233A22:
	movs r0, #1
	blx FUN_020E1678
	add r4, sp, #0
	movs r0, #2
	lsls r0, r0, #0x1a
	adds r1, r4, #0
	movs r2, #0xc0
	blx FUN_020E140C
	ldr r3, _02233A84 @ =0x0223CB04
	movs r2, #0
_02233A3A:
	adds r0, r4, r2
	ldrb r1, [r3]
	ldrb r0, [r0, #4]
	cmp r1, r0
	beq _02233A4A
	add sp, #0xc0
	movs r0, #4
	pop {r3, r4, r5, pc}
_02233A4A:
	adds r2, r2, #1
	adds r3, r3, #1
	cmp r2, #0x9c
	blo _02233A3A
	movs r2, #0
	movs r1, #0xa0
_02233A56:
	ldrb r0, [r4, r1]
	adds r1, r1, #1
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r1, #0xbc
	ble _02233A56
	adds r2, #0x19
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	adds r4, #0xbd
	lsrs r1, r0, #0x18
	ldrb r0, [r4]
	cmp r0, r1
	beq _02233A7A
	add sp, #0xc0
	movs r0, #4
	pop {r3, r4, r5, pc}
_02233A7A:
	movs r0, #0
	add sp, #0xc0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02233A80: .4byte 0x0223CAFC
_02233A84: .4byte 0x0223CB04
	thumb_func_end ov74_022339D4

	thumb_func_start ov74_02233A88
ov74_02233A88: @ 0x02233A88
	push {r3, r4}
	movs r2, #0
	lsrs r4, r1, #2
	adds r3, r2, #0
	cmp r4, #0
	ble _02233AA4
_02233A94:
	ldr r1, [r0]
	adds r0, r0, #4
	adds r2, r2, r1
	adds r1, r3, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	cmp r3, r4
	blt _02233A94
_02233AA4:
	lsrs r0, r2, #0x10
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4}
	bx lr
	thumb_func_end ov74_02233A88

	thumb_func_start ov74_02233AB8
ov74_02233AB8: @ 0x02233AB8
	push {r3, lr}
	lsls r0, r0, #0x10
	movs r3, #1
	adds r2, r1, #0
	lsrs r0, r0, #0x10
	movs r1, #0
	lsls r3, r3, #0xc
	blx FUN_020E219C
	pop {r3, pc}
	thumb_func_end ov74_02233AB8

	thumb_func_start ov74_02233ACC
ov74_02233ACC: @ 0x02233ACC
	cmp r0, #0
	bne _02233ADA
	ldr r0, _02233B00 @ =0x0223D3BC
	ldr r0, [r0, #0x20]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
_02233ADA:
	cmp r0, #4
	bne _02233AEE
	ldr r0, _02233B00 @ =0x0223D3BC
	ldr r1, [r0, #0x24]
	movs r0, #0xba
	lsls r0, r0, #6
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
_02233AEE:
	cmp r0, #0xd
	bne _02233AF8
	movs r0, #0x7d
	lsls r0, r0, #4
	bx lr
_02233AF8:
	movs r0, #0x3e
	lsls r0, r0, #6
	bx lr
	nop
_02233B00: .4byte 0x0223D3BC
	thumb_func_end ov74_02233ACC

	thumb_func_start ov74_02233B04
ov74_02233B04: @ 0x02233B04
	cmp r0, #0
	bne _02233B14
	ldr r0, _02233B54 @ =0x0223D33C
	ldr r1, [r0, #8]
	movs r0, #1
	lsls r0, r0, #0xc
	adds r0, r1, r0
	bx lr
_02233B14:
	cmp r0, #1
	blt _02233B32
	cmp r0, #4
	bgt _02233B32
	ldr r1, _02233B54 @ =0x0223D33C
	ldr r2, [r1, #8]
	movs r1, #2
	lsls r1, r1, #0xc
	adds r2, r2, r1
	subs r1, r0, #1
	movs r0, #0x3e
	lsls r0, r0, #6
	muls r0, r1, r0
	adds r0, r2, r0
	bx lr
_02233B32:
	cmp r0, #5
	blt _02233B50
	cmp r0, #0xe
	bge _02233B50
	ldr r1, _02233B54 @ =0x0223D33C
	ldr r2, [r1, #8]
	movs r1, #6
	lsls r1, r1, #0xc
	adds r2, r2, r1
	subs r1, r0, #5
	movs r0, #0x3e
	lsls r0, r0, #6
	muls r0, r1, r0
	adds r0, r2, r0
	bx lr
_02233B50:
	movs r0, #0
	bx lr
	.align 2, 0
_02233B54: .4byte 0x0223D33C
	thumb_func_end ov74_02233B04

	thumb_func_start ov74_02233B58
ov74_02233B58: @ 0x02233B58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r6, #0
	adds r5, r1, #0
	str r6, [sp, #4]
	adds r1, r2, #0
	str r6, [r1]
	ldr r1, _02233BEC @ =0x0223D33C
	adds r7, r0, #0
	str r6, [r1, #4]
	movs r1, #0xe
	str r2, [sp]
	adds r4, r6, #0
	muls r7, r1, r7
_02233B74:
	adds r0, r4, #0
	movs r1, #0xe
	blx FUN_020F2998
	adds r0, r1, r7
	adds r1, r5, #0
	bl ov74_02233AB8
	movs r1, #1
	adds r0, r5, #0
	lsls r1, r1, #0xc
	blx FUN_020D2894
	ldr r0, _02233BF0 @ =0x00000FF8
	ldr r1, [r5, r0]
	ldr r0, _02233BF4 @ =0x08012025
	cmp r1, r0
	bne _02233BC6
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _02233BF8 @ =0x00000FF4
	ldrh r0, [r5, r0]
	bl ov74_02233ACC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov74_02233A88
	ldr r1, _02233BFC @ =0x00000FF6
	ldrh r1, [r5, r1]
	cmp r1, r0
	bne _02233BC6
	ldr r0, _02233C00 @ =0x00000FFC
	ldr r1, [r5, r0]
	ldr r0, [sp]
	str r1, [r0]
	ldr r0, _02233BF8 @ =0x00000FF4
	ldrh r1, [r5, r0]
	movs r0, #1
	lsls r0, r1
	orrs r6, r0
_02233BC6:
	adds r4, r4, #1
	cmp r4, #0xe
	blt _02233B74
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02233BE4
	ldr r0, _02233C04 @ =0x00003FFF
	cmp r6, r0
	bne _02233BDE
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02233BDE:
	add sp, #8
	movs r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
_02233BE4:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02233BEC: .4byte 0x0223D33C
_02233BF0: .4byte 0x00000FF8
_02233BF4: .4byte 0x08012025
_02233BF8: .4byte 0x00000FF4
_02233BFC: .4byte 0x00000FF6
_02233C00: .4byte 0x00000FFC
_02233C04: .4byte 0x00003FFF
	thumb_func_end ov74_02233B58

	thumb_func_start ov74_02233C08
ov74_02233C08: @ 0x02233C08
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	movs r0, #0
	adds r1, r7, #0
	add r2, sp, #4
	bl ov74_02233B58
	adds r6, r0, #0
	movs r0, #1
	adds r1, r7, #0
	add r2, sp, #0
	bl ov74_02233B58
	cmp r6, #1
	bne _02233C80
	cmp r0, #1
	bne _02233C80
	movs r1, #0
	ldr r0, [sp, #4]
	mvns r1, r1
	cmp r0, r1
	bne _02233C40
	ldr r3, [sp]
	cmp r3, #0
	beq _02233C4E
_02233C40:
	cmp r0, #0
	bne _02233C66
	movs r1, #0
	ldr r3, [sp]
	mvns r1, r1
	cmp r3, r1
	bne _02233C66
_02233C4E:
	adds r2, r0, #1
	adds r1, r3, #1
	cmp r2, r1
	bhs _02233C5E
	str r3, [r4]
	movs r0, #1
	str r0, [r5]
	b _02233C7A
_02233C5E:
	str r0, [r4]
	movs r0, #0
	str r0, [r5]
	b _02233C7A
_02233C66:
	ldr r1, [sp]
	cmp r0, r1
	bhs _02233C74
	str r1, [r4]
	movs r0, #1
	str r0, [r5]
	b _02233C7A
_02233C74:
	str r0, [r4]
	movs r0, #0
	str r0, [r5]
_02233C7A:
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02233C80:
	cmp r6, #1
	bne _02233CA4
	cmp r0, #1
	beq _02233CA4
	ldr r1, [sp, #4]
	cmp r0, #0xff
	str r1, [r4]
	bne _02233C9A
	movs r0, #0
	str r0, [r5]
	add sp, #8
	movs r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
_02233C9A:
	movs r0, #0
	str r0, [r5]
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02233CA4:
	cmp r0, #1
	bne _02233CC6
	cmp r6, #1
	beq _02233CC6
	ldr r0, [sp]
	cmp r6, #0xff
	str r0, [r4]
	bne _02233CBE
	movs r0, #1
	str r0, [r5]
	add sp, #8
	movs r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
_02233CBE:
	movs r0, #1
	add sp, #8
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02233CC6:
	cmp r6, #0
	bne _02233CD8
	cmp r0, #0
	bne _02233CD8
	movs r0, #0
	str r0, [r4]
	add sp, #8
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02233CD8:
	movs r0, #0
	str r0, [r4]
	str r0, [r5]
	movs r0, #2
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_02233C08

	thumb_func_start ov74_02233CE4
ov74_02233CE4: @ 0x02233CE4
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02233D98 @ =0x0223D33C
	ldr r1, _02233D9C @ =0x0223D33C
	ldr r0, [r0, #8]
	ldr r2, _02233DA0 @ =0x0223D34C
	bl ov74_02233C08
	cmp r0, #1
	beq _02233D0E
	cmp r0, #0
	beq _02233D06
	cmp r0, #2
	beq _02233D0A
	cmp r0, #0xff
	bne _02233D0E
	movs r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_02233D06:
	movs r0, #7
	pop {r3, r4, r5, r6, r7, pc}
_02233D0A:
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_02233D0E:
	ldr r7, _02233D98 @ =0x0223D33C
	ldr r0, [r7]
	cmp r0, #1
	bhi _02233D92
	movs r6, #0
	ldr r5, [r7, #8]
	adds r4, r6, #0
_02233D1C:
	ldr r1, [r7]
	movs r0, #0xe
	muls r0, r1, r0
	adds r0, r4, r0
	adds r1, r5, #0
	bl ov74_02233AB8
	ldr r0, _02233DA4 @ =0x00000FF8
	ldr r1, [r5, r0]
	ldr r0, _02233DA8 @ =0x08012025
	cmp r1, r0
	bne _02233D7E
	ldr r0, _02233DAC @ =0x00000FF4
	ldrh r0, [r5, r0]
	bl ov74_02233ACC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov74_02233A88
	ldr r1, _02233DB0 @ =0x00000FF6
	ldrh r1, [r5, r1]
	cmp r1, r0
	bne _02233D7E
	ldr r0, _02233DB4 @ =0x00000FFC
	movs r1, #1
	ldr r0, [r5, r0]
	str r0, [r7, #0x10]
	ldr r0, _02233DAC @ =0x00000FF4
	ldrh r0, [r5, r0]
	lsls r1, r0
	orrs r6, r1
	bl ov74_02233ACC
	str r0, [sp]
	ldr r0, _02233DAC @ =0x00000FF4
	ldrh r0, [r5, r0]
	bl ov74_02233B04
	adds r1, r0, #0
	ldr r2, [sp]
	adds r0, r5, #0
	blx FUN_020D4808
	ldr r0, _02233DAC @ =0x00000FF4
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _02233D7E
	str r4, [r7, #0xc]
_02233D7E:
	adds r4, r4, #1
	cmp r4, #0xe
	blt _02233D1C
	ldr r0, _02233DB8 @ =0x00003FFF
	cmp r6, r0
	bne _02233D8E
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02233D8E:
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_02233D92:
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02233D98: .4byte 0x0223D33C
_02233D9C: .4byte 0x0223D33C
_02233DA0: .4byte 0x0223D34C
_02233DA4: .4byte 0x00000FF8
_02233DA8: .4byte 0x08012025
_02233DAC: .4byte 0x00000FF4
_02233DB0: .4byte 0x00000FF6
_02233DB4: .4byte 0x00000FFC
_02233DB8: .4byte 0x00003FFF
	thumb_func_end ov74_02233CE4

	thumb_func_start ov74_02233DBC
ov74_02233DBC: @ 0x02233DBC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _02233E38 @ =0x0223D33C
	movs r2, #1
	ldr r5, [r0, #8]
	str r2, [r0, #0x14]
	movs r0, #0
	adds r1, r5, #0
	lsls r2, r2, #0xc
	blx FUN_020D47EC
	adds r0, r6, #0
	bl ov74_02233ACC
	adds r4, r0, #0
	adds r0, r6, #0
	bl ov74_02233B04
	adds r1, r5, #0
	adds r2, r4, #0
	blx FUN_020D4808
	ldr r0, _02233E38 @ =0x0223D33C
	ldr r1, [r0, #0x10]
	ldr r0, _02233E3C @ =0x00000FFC
	str r1, [r5, r0]
	adds r1, r0, #0
	subs r1, #8
	strh r6, [r5, r1]
	ldr r1, _02233E40 @ =0x08012025
	subs r0, r0, #4
	str r1, [r5, r0]
	adds r0, r6, #0
	bl ov74_02233ACC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov74_02233A88
	ldr r1, _02233E44 @ =0x00000FF6
	strh r0, [r5, r1]
	ldr r0, _02233E38 @ =0x0223D33C
	movs r1, #0xe
	ldr r0, [r0, #0xc]
	adds r0, r6, r0
	adds r0, r0, #1
	blx FUN_020F2998
	ldr r0, _02233E48 @ =0x0223CAFC
	ldr r3, _02233E4C @ =ov74_02233E50
	ldr r2, [r0, #4]
	movs r0, #0xe
	muls r0, r2, r0
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #0
	movs r2, #4
	blx FUN_020E2200
	pop {r4, r5, r6, pc}
	nop
_02233E38: .4byte 0x0223D33C
_02233E3C: .4byte 0x00000FFC
_02233E40: .4byte 0x08012025
_02233E44: .4byte 0x00000FF6
_02233E48: .4byte 0x0223CAFC
_02233E4C: .4byte ov74_02233E50
	thumb_func_end ov74_02233DBC

	thumb_func_start ov74_02233E50
ov74_02233E50: @ 0x02233E50
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02233E7C
	ldr r1, _02233E88 @ =0x0223D33C
	ldr r0, [r1, #4]
	adds r0, r0, #1
	str r0, [r1, #4]
	cmp r0, #0xe
	blt _02233E6A
	movs r0, #0
	str r0, [r1, #4]
	str r0, [r1, #0x14]
	bx lr
_02233E6A:
	cmp r0, #0xd
	bne _02233E76
	movs r0, #2
	str r0, [r1, #0x14]
	movs r0, #0
	bx lr
_02233E76:
	movs r0, #3
	str r0, [r1, #0x14]
	b _02233E82
_02233E7C:
	ldr r0, _02233E88 @ =0x0223D33C
	movs r1, #4
	str r1, [r0, #0x14]
_02233E82:
	movs r0, #0
	bx lr
	nop
_02233E88: .4byte 0x0223D33C
	thumb_func_end ov74_02233E50

	thumb_func_start ov74_02233E8C
ov74_02233E8C: @ 0x02233E8C
	push {r3, lr}
	ldr r1, _02233ECC @ =0x0223D33C
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _02233EB2
	ldr r1, [r1]
	cmp r1, #1
	bne _02233EA2
	movs r2, #0
	ldr r1, _02233ED0 @ =0x0223CAFC
	b _02233EA6
_02233EA2:
	ldr r1, _02233ED0 @ =0x0223CAFC
	movs r2, #1
_02233EA6:
	str r2, [r1, #4]
	ldr r1, _02233ECC @ =0x0223D33C
	ldr r2, [r1, #0x10]
	adds r2, r2, #1
	str r2, [r1, #0x10]
	b _02233EB6
_02233EB2:
	movs r0, #0
	pop {r3, pc}
_02233EB6:
	ldr r1, _02233ED0 @ =0x0223CAFC
	ldr r1, [r1, #4]
	cmp r1, #0
	bge _02233EC2
	movs r0, #0
	pop {r3, pc}
_02233EC2:
	bl ov74_02233DBC
	movs r0, #1
	pop {r3, pc}
	nop
_02233ECC: .4byte 0x0223D33C
_02233ED0: .4byte 0x0223CAFC
	thumb_func_end ov74_02233E8C

	thumb_func_start ov74_02233ED4
ov74_02233ED4: @ 0x02233ED4
	push {r3, lr}
	ldr r1, _02233F10 @ =0x0223D33C
	ldr r0, [r1, #0x14]
	cmp r0, #4
	bhi _02233F0C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02233EEA: @ jump table
	.2byte _02233F0C - _02233EEA - 2 @ case 0
	.2byte _02233F04 - _02233EEA - 2 @ case 1
	.2byte _02233EF4 - _02233EEA - 2 @ case 2
	.2byte _02233EFE - _02233EEA - 2 @ case 3
	.2byte _02233F08 - _02233EEA - 2 @ case 4
_02233EF4:
	ldr r0, [r1, #4]
	bl ov74_02233DBC
	movs r0, #0
	pop {r3, pc}
_02233EFE:
	ldr r0, [r1, #4]
	bl ov74_02233DBC
_02233F04:
	movs r0, #0xa
	pop {r3, pc}
_02233F08:
	movs r0, #8
	pop {r3, pc}
_02233F0C:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_02233F10: .4byte 0x0223D33C
	thumb_func_end ov74_02233ED4

	thumb_func_start ov74_02233F14
ov74_02233F14: @ 0x02233F14
	ldr r0, _02233F48 @ =0x0223D33C
	ldr r0, [r0, #0x14]
	cmp r0, #4
	bhi _02233F42
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02233F28: @ jump table
	.2byte _02233F42 - _02233F28 - 2 @ case 0
	.2byte _02233F3A - _02233F28 - 2 @ case 1
	.2byte _02233F32 - _02233F28 - 2 @ case 2
	.2byte _02233F36 - _02233F28 - 2 @ case 3
	.2byte _02233F3E - _02233F28 - 2 @ case 4
_02233F32:
	movs r0, #0xb
	bx lr
_02233F36:
	movs r0, #0xa
	bx lr
_02233F3A:
	movs r0, #9
	bx lr
_02233F3E:
	movs r0, #8
	bx lr
_02233F42:
	movs r0, #0
	bx lr
	nop
_02233F48: .4byte 0x0223D33C
	thumb_func_end ov74_02233F14

	thumb_func_start ov74_02233F4C
ov74_02233F4C: @ 0x02233F4C
	ldr r0, _02233F58 @ =0x0223D33C
	ldr r1, [r0, #8]
	movs r0, #6
	lsls r0, r0, #0xc
	adds r0, r1, r0
	bx lr
	.align 2, 0
_02233F58: .4byte 0x0223D33C
	thumb_func_end ov74_02233F4C

	thumb_func_start ov74_02233F5C
ov74_02233F5C: @ 0x02233F5C
	ldr r3, _02233F64 @ =ov74_02233B04
	movs r0, #0
	bx r3
	nop
_02233F64: .4byte ov74_02233B04
	thumb_func_end ov74_02233F5C

	thumb_func_start ov74_02233F68
ov74_02233F68: @ 0x02233F68
	push {r3, lr}
	bl ov74_02233F5C
	ldrb r2, [r0, #0xb]
	ldrb r1, [r0, #0xa]
	lsls r3, r2, #8
	ldrb r2, [r0, #0xd]
	ldrb r0, [r0, #0xc]
	lsls r2, r2, #0x18
	lsls r0, r0, #0x10
	orrs r0, r2
	orrs r0, r3
	orrs r0, r1
	pop {r3, pc}
	thumb_func_end ov74_02233F68

	thumb_func_start ov74_02233F84
ov74_02233F84: @ 0x02233F84
	ldr r3, _02233F88 @ =ov74_02233F5C
	bx r3
	.align 2, 0
_02233F88: .4byte ov74_02233F5C
	thumb_func_end ov74_02233F84

	thumb_func_start ov74_02233F8C
ov74_02233F8C: @ 0x02233F8C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	movs r1, #0x18
	adds r5, r2, #0
	movs r6, #0
	blx FUN_020F2BA4
	cmp r1, #0x17
	bhi _02233FE2
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02233FAC: @ jump table
	.2byte _02233FDC - _02233FAC - 2 @ case 0
	.2byte _0223400E - _02233FAC - 2 @ case 1
	.2byte _0223403E - _02233FAC - 2 @ case 2
	.2byte _0223406E - _02233FAC - 2 @ case 3
	.2byte _0223409E - _02233FAC - 2 @ case 4
	.2byte _022340CE - _02233FAC - 2 @ case 5
	.2byte _022340FE - _02233FAC - 2 @ case 6
	.2byte _02234130 - _02233FAC - 2 @ case 7
	.2byte _02234160 - _02233FAC - 2 @ case 8
	.2byte _02234190 - _02233FAC - 2 @ case 9
	.2byte _022341C0 - _02233FAC - 2 @ case 10
	.2byte _022341F0 - _02233FAC - 2 @ case 11
	.2byte _02234220 - _02233FAC - 2 @ case 12
	.2byte _02234252 - _02233FAC - 2 @ case 13
	.2byte _02234282 - _02233FAC - 2 @ case 14
	.2byte _022342B2 - _02233FAC - 2 @ case 15
	.2byte _022342E2 - _02233FAC - 2 @ case 16
	.2byte _02234312 - _02233FAC - 2 @ case 17
	.2byte _02234342 - _02233FAC - 2 @ case 18
	.2byte _02234374 - _02233FAC - 2 @ case 19
	.2byte _022343A4 - _02233FAC - 2 @ case 20
	.2byte _022343D4 - _02233FAC - 2 @ case 21
	.2byte _02234404 - _02233FAC - 2 @ case 22
	.2byte _02234434 - _02233FAC - 2 @ case 23
_02233FDC:
	adds r4, #0x20
	cmp r5, #3
	bls _02233FE4
_02233FE2:
	b _02234462
_02233FE4:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02233FF0: @ jump table
	.2byte _02233FF8 - _02233FF0 - 2 @ case 0
	.2byte _02233FFC - _02233FF0 - 2 @ case 1
	.2byte _02234002 - _02233FF0 - 2 @ case 2
	.2byte _02234008 - _02233FF0 - 2 @ case 3
_02233FF8:
	adds r6, r4, #0
	b _02234462
_02233FFC:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234002:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_02234008:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_0223400E:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234104
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234020: @ jump table
	.2byte _02234028 - _02234020 - 2 @ case 0
	.2byte _0223402C - _02234020 - 2 @ case 1
	.2byte _02234032 - _02234020 - 2 @ case 2
	.2byte _02234038 - _02234020 - 2 @ case 3
_02234028:
	adds r6, r4, #0
	b _02234462
_0223402C:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234032:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_02234038:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_0223403E:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234104
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234050: @ jump table
	.2byte _02234058 - _02234050 - 2 @ case 0
	.2byte _0223405C - _02234050 - 2 @ case 1
	.2byte _02234062 - _02234050 - 2 @ case 2
	.2byte _02234068 - _02234050 - 2 @ case 3
_02234058:
	adds r6, r4, #0
	b _02234462
_0223405C:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_02234062:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234068:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_0223406E:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234104
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234080: @ jump table
	.2byte _02234088 - _02234080 - 2 @ case 0
	.2byte _0223408C - _02234080 - 2 @ case 1
	.2byte _02234092 - _02234080 - 2 @ case 2
	.2byte _02234098 - _02234080 - 2 @ case 3
_02234088:
	adds r6, r4, #0
	b _02234462
_0223408C:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_02234092:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234098:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_0223409E:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234104
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022340B0: @ jump table
	.2byte _022340B8 - _022340B0 - 2 @ case 0
	.2byte _022340BC - _022340B0 - 2 @ case 1
	.2byte _022340C2 - _022340B0 - 2 @ case 2
	.2byte _022340C8 - _022340B0 - 2 @ case 3
_022340B8:
	adds r6, r4, #0
	b _02234462
_022340BC:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_022340C2:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_022340C8:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_022340CE:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234104
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022340E0: @ jump table
	.2byte _022340E8 - _022340E0 - 2 @ case 0
	.2byte _022340EC - _022340E0 - 2 @ case 1
	.2byte _022340F2 - _022340E0 - 2 @ case 2
	.2byte _022340F8 - _022340E0 - 2 @ case 3
_022340E8:
	adds r6, r4, #0
	b _02234462
_022340EC:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_022340F2:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_022340F8:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_022340FE:
	adds r4, #0x20
	cmp r5, #3
	bls _02234106
_02234104:
	b _02234462
_02234106:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234112: @ jump table
	.2byte _0223411A - _02234112 - 2 @ case 0
	.2byte _02234120 - _02234112 - 2 @ case 1
	.2byte _02234124 - _02234112 - 2 @ case 2
	.2byte _0223412A - _02234112 - 2 @ case 3
_0223411A:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234120:
	adds r6, r4, #0
	b _02234462
_02234124:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_0223412A:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_02234130:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234226
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234142: @ jump table
	.2byte _0223414A - _02234142 - 2 @ case 0
	.2byte _02234150 - _02234142 - 2 @ case 1
	.2byte _02234154 - _02234142 - 2 @ case 2
	.2byte _0223415A - _02234142 - 2 @ case 3
_0223414A:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234150:
	adds r6, r4, #0
	b _02234462
_02234154:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_0223415A:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_02234160:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234226
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234172: @ jump table
	.2byte _0223417A - _02234172 - 2 @ case 0
	.2byte _02234180 - _02234172 - 2 @ case 1
	.2byte _02234184 - _02234172 - 2 @ case 2
	.2byte _0223418A - _02234172 - 2 @ case 3
_0223417A:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_02234180:
	adds r6, r4, #0
	b _02234462
_02234184:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_0223418A:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_02234190:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234226
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022341A2: @ jump table
	.2byte _022341AA - _022341A2 - 2 @ case 0
	.2byte _022341B0 - _022341A2 - 2 @ case 1
	.2byte _022341B4 - _022341A2 - 2 @ case 2
	.2byte _022341BA - _022341A2 - 2 @ case 3
_022341AA:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_022341B0:
	adds r6, r4, #0
	b _02234462
_022341B4:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_022341BA:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_022341C0:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234226
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022341D2: @ jump table
	.2byte _022341DA - _022341D2 - 2 @ case 0
	.2byte _022341E0 - _022341D2 - 2 @ case 1
	.2byte _022341E4 - _022341D2 - 2 @ case 2
	.2byte _022341EA - _022341D2 - 2 @ case 3
_022341DA:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_022341E0:
	adds r6, r4, #0
	b _02234462
_022341E4:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_022341EA:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_022341F0:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234226
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234202: @ jump table
	.2byte _0223420A - _02234202 - 2 @ case 0
	.2byte _02234210 - _02234202 - 2 @ case 1
	.2byte _02234214 - _02234202 - 2 @ case 2
	.2byte _0223421A - _02234202 - 2 @ case 3
_0223420A:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_02234210:
	adds r6, r4, #0
	b _02234462
_02234214:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_0223421A:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234220:
	adds r4, #0x20
	cmp r5, #3
	bls _02234228
_02234226:
	b _02234462
_02234228:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234234: @ jump table
	.2byte _0223423C - _02234234 - 2 @ case 0
	.2byte _02234242 - _02234234 - 2 @ case 1
	.2byte _02234248 - _02234234 - 2 @ case 2
	.2byte _0223424C - _02234234 - 2 @ case 3
_0223423C:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234242:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_02234248:
	adds r6, r4, #0
	b _02234462
_0223424C:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_02234252:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234348
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234264: @ jump table
	.2byte _0223426C - _02234264 - 2 @ case 0
	.2byte _02234272 - _02234264 - 2 @ case 1
	.2byte _02234278 - _02234264 - 2 @ case 2
	.2byte _0223427C - _02234264 - 2 @ case 3
_0223426C:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234272:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_02234278:
	adds r6, r4, #0
	b _02234462
_0223427C:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_02234282:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234348
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234294: @ jump table
	.2byte _0223429C - _02234294 - 2 @ case 0
	.2byte _022342A2 - _02234294 - 2 @ case 1
	.2byte _022342A8 - _02234294 - 2 @ case 2
	.2byte _022342AC - _02234294 - 2 @ case 3
_0223429C:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_022342A2:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_022342A8:
	adds r6, r4, #0
	b _02234462
_022342AC:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_022342B2:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234348
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022342C4: @ jump table
	.2byte _022342CC - _022342C4 - 2 @ case 0
	.2byte _022342D2 - _022342C4 - 2 @ case 1
	.2byte _022342D8 - _022342C4 - 2 @ case 2
	.2byte _022342DC - _022342C4 - 2 @ case 3
_022342CC:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_022342D2:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_022342D8:
	adds r6, r4, #0
	b _02234462
_022342DC:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_022342E2:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234348
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022342F4: @ jump table
	.2byte _022342FC - _022342F4 - 2 @ case 0
	.2byte _02234302 - _022342F4 - 2 @ case 1
	.2byte _02234308 - _022342F4 - 2 @ case 2
	.2byte _0223430C - _022342F4 - 2 @ case 3
_022342FC:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_02234302:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_02234308:
	adds r6, r4, #0
	b _02234462
_0223430C:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234312:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234348
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234324: @ jump table
	.2byte _0223432C - _02234324 - 2 @ case 0
	.2byte _02234332 - _02234324 - 2 @ case 1
	.2byte _02234338 - _02234324 - 2 @ case 2
	.2byte _0223433C - _02234324 - 2 @ case 3
_0223432C:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_02234332:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_02234338:
	adds r6, r4, #0
	b _02234462
_0223433C:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234342:
	adds r4, #0x20
	cmp r5, #3
	bls _0223434A
_02234348:
	b _02234462
_0223434A:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234356: @ jump table
	.2byte _0223435E - _02234356 - 2 @ case 0
	.2byte _02234364 - _02234356 - 2 @ case 1
	.2byte _0223436A - _02234356 - 2 @ case 2
	.2byte _02234370 - _02234356 - 2 @ case 3
_0223435E:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234364:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_0223436A:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_02234370:
	adds r6, r4, #0
	b _02234462
_02234374:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234462
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234386: @ jump table
	.2byte _0223438E - _02234386 - 2 @ case 0
	.2byte _02234394 - _02234386 - 2 @ case 1
	.2byte _0223439A - _02234386 - 2 @ case 2
	.2byte _022343A0 - _02234386 - 2 @ case 3
_0223438E:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234394:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_0223439A:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_022343A0:
	adds r6, r4, #0
	b _02234462
_022343A4:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234462
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022343B6: @ jump table
	.2byte _022343BE - _022343B6 - 2 @ case 0
	.2byte _022343C4 - _022343B6 - 2 @ case 1
	.2byte _022343CA - _022343B6 - 2 @ case 2
	.2byte _022343D0 - _022343B6 - 2 @ case 3
_022343BE:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_022343C4:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_022343CA:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_022343D0:
	adds r6, r4, #0
	b _02234462
_022343D4:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234462
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022343E6: @ jump table
	.2byte _022343EE - _022343E6 - 2 @ case 0
	.2byte _022343F4 - _022343E6 - 2 @ case 1
	.2byte _022343FA - _022343E6 - 2 @ case 2
	.2byte _02234400 - _022343E6 - 2 @ case 3
_022343EE:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_022343F4:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_022343FA:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_02234400:
	adds r6, r4, #0
	b _02234462
_02234404:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234462
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234416: @ jump table
	.2byte _0223441E - _02234416 - 2 @ case 0
	.2byte _02234424 - _02234416 - 2 @ case 1
	.2byte _0223442A - _02234416 - 2 @ case 2
	.2byte _02234430 - _02234416 - 2 @ case 3
_0223441E:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_02234424:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_0223442A:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234430:
	adds r6, r4, #0
	b _02234462
_02234434:
	adds r4, #0x20
	cmp r5, #3
	bhi _02234462
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234446: @ jump table
	.2byte _0223444E - _02234446 - 2 @ case 0
	.2byte _02234454 - _02234446 - 2 @ case 1
	.2byte _0223445A - _02234446 - 2 @ case 2
	.2byte _02234460 - _02234446 - 2 @ case 3
_0223444E:
	adds r6, r4, #0
	adds r6, #0x24
	b _02234462
_02234454:
	adds r6, r4, #0
	adds r6, #0x18
	b _02234462
_0223445A:
	adds r6, r4, #0
	adds r6, #0xc
	b _02234462
_02234460:
	adds r6, r4, #0
_02234462:
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov74_02233F8C

	thumb_func_start ov74_02234468
ov74_02234468: @ 0x02234468
	push {r3, r4}
	adds r4, r0, #0
	movs r3, #0
	adds r4, #0x20
_02234470:
	ldr r2, [r4]
	ldr r1, [r0, #4]
	adds r3, r3, #1
	eors r2, r1
	str r2, [r4]
	ldr r1, [r0]
	eors r1, r2
	stm r4!, {r1}
	cmp r3, #0xc
	blo _02234470
	pop {r3, r4}
	bx lr
	thumb_func_end ov74_02234468

	thumb_func_start ov74_02234488
ov74_02234488: @ 0x02234488
	push {r3, r4}
	adds r4, r0, #0
	movs r3, #0
	adds r4, #0x20
_02234490:
	ldr r2, [r4]
	ldr r1, [r0]
	adds r3, r3, #1
	eors r2, r1
	str r2, [r4]
	ldr r1, [r0, #4]
	eors r1, r2
	stm r4!, {r1}
	cmp r3, #0xc
	blo _02234490
	pop {r3, r4}
	bx lr
	thumb_func_end ov74_02234488

	thumb_func_start ov74_022344A8
ov74_022344A8: @ 0x022344A8
	push {r3, r4, r5, r6, r7, lr}
	adds r1, r0, #0
	movs r4, #0
	ldr r1, [r1]
	str r0, [sp]
	adds r2, r4, #0
	bl ov74_02233F8C
	adds r5, r0, #0
	ldr r0, [sp]
	movs r2, #1
	adds r1, r0, #0
	ldr r1, [r1]
	bl ov74_02233F8C
	adds r6, r0, #0
	ldr r0, [sp]
	movs r2, #2
	adds r1, r0, #0
	ldr r1, [r1]
	bl ov74_02233F8C
	adds r7, r0, #0
	ldr r0, [sp]
	movs r2, #3
	adds r1, r0, #0
	ldr r1, [r1]
	bl ov74_02233F8C
	adds r1, r4, #0
_022344E4:
	ldrh r2, [r5]
	adds r1, r1, #1
	adds r5, r5, #2
	adds r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	cmp r1, #6
	blt _022344E4
	movs r2, #0
_022344F6:
	ldrh r1, [r6]
	adds r2, r2, #1
	adds r6, r6, #2
	adds r1, r4, r1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	cmp r2, #6
	blt _022344F6
	movs r2, #0
_02234508:
	ldrh r1, [r7]
	adds r2, r2, #1
	adds r7, r7, #2
	adds r1, r4, r1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	cmp r2, #6
	blt _02234508
	movs r2, #0
_0223451A:
	ldrh r1, [r0]
	adds r2, r2, #1
	adds r0, r0, #2
	adds r1, r4, r1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	cmp r2, #6
	blt _0223451A
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov74_022344A8

	thumb_func_start ov74_02234530
ov74_02234530: @ 0x02234530
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r4, #0
	adds r6, r0, #0
	str r1, [sp]
	adds r7, r2, #0
	adds r5, r4, #0
	str r4, [sp, #0xc]
	str r4, [sp, #8]
	str r4, [sp, #4]
	cmp r1, #0xa
	ble _022345A6
	ldr r1, [r6]
	adds r2, r4, #0
	bl ov74_02233F8C
	str r0, [sp, #0xc]
	ldr r1, [r6]
	adds r0, r6, #0
	movs r2, #1
	bl ov74_02233F8C
	str r0, [sp, #8]
	ldr r1, [r6]
	adds r0, r6, #0
	movs r2, #2
	bl ov74_02233F8C
	str r0, [sp, #4]
	ldr r1, [r6]
	adds r0, r6, #0
	movs r2, #3
	bl ov74_02233F8C
	adds r5, r0, #0
	adds r0, r6, #0
	bl ov74_02234468
	adds r0, r6, #0
	bl ov74_022344A8
	ldrh r1, [r6, #0x1c]
	cmp r0, r1
	beq _022345A6
	ldrb r0, [r6, #0x13]
	movs r1, #1
	bics r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r6, #0x13]
	ldrb r1, [r6, #0x13]
	movs r0, #4
	orrs r0, r1
	strb r0, [r6, #0x13]
	movs r0, #1
	ldr r1, [r5, #4]
	lsls r0, r0, #0x1e
	orrs r0, r1
	str r0, [r5, #4]
_022345A6:
	ldr r0, [sp]
	cmp r0, #0x50
	bls _022345AE
	b _0223489C
_022345AE:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022345BA: @ jump table
	.2byte _0223465C - _022345BA - 2 @ case 0
	.2byte _02234660 - _022345BA - 2 @ case 1
	.2byte _02234664 - _022345BA - 2 @ case 2
	.2byte _02234684 - _022345BA - 2 @ case 3
	.2byte _02234688 - _022345BA - 2 @ case 4
	.2byte _02234690 - _022345BA - 2 @ case 5
	.2byte _02234698 - _022345BA - 2 @ case 6
	.2byte _022346A0 - _022345BA - 2 @ case 7
	.2byte _022346B4 - _022345BA - 2 @ case 8
	.2byte _022346B8 - _022345BA - 2 @ case 9
	.2byte _022346BC - _022345BA - 2 @ case 10
	.2byte _022346C0 - _022345BA - 2 @ case 11
	.2byte _022346D4 - _022345BA - 2 @ case 12
	.2byte _022346EC - _022345BA - 2 @ case 13
	.2byte _022346EC - _022345BA - 2 @ case 14
	.2byte _022346EC - _022345BA - 2 @ case 15
	.2byte _022346EC - _022345BA - 2 @ case 16
	.2byte _022346F8 - _022345BA - 2 @ case 17
	.2byte _022346F8 - _022345BA - 2 @ case 18
	.2byte _022346F8 - _022345BA - 2 @ case 19
	.2byte _022346F8 - _022345BA - 2 @ case 20
	.2byte _022346E0 - _022345BA - 2 @ case 21
	.2byte _02234728 - _022345BA - 2 @ case 22
	.2byte _0223472E - _022345BA - 2 @ case 23
	.2byte _02234734 - _022345BA - 2 @ case 24
	.2byte _022346DA - _022345BA - 2 @ case 25
	.2byte _02234704 - _022345BA - 2 @ case 26
	.2byte _0223470A - _022345BA - 2 @ case 27
	.2byte _02234710 - _022345BA - 2 @ case 28
	.2byte _02234716 - _022345BA - 2 @ case 29
	.2byte _0223471C - _022345BA - 2 @ case 30
	.2byte _02234722 - _022345BA - 2 @ case 31
	.2byte _022346E6 - _022345BA - 2 @ case 32
	.2byte _0223473A - _022345BA - 2 @ case 33
	.2byte _0223474C - _022345BA - 2 @ case 34
	.2byte _02234754 - _022345BA - 2 @ case 35
	.2byte _0223475C - _022345BA - 2 @ case 36
	.2byte _02234764 - _022345BA - 2 @ case 37
	.2byte _0223476C - _022345BA - 2 @ case 38
	.2byte _0223477A - _022345BA - 2 @ case 39
	.2byte _02234782 - _022345BA - 2 @ case 40
	.2byte _0223478A - _022345BA - 2 @ case 41
	.2byte _02234792 - _022345BA - 2 @ case 42
	.2byte _0223479A - _022345BA - 2 @ case 43
	.2byte _022347A2 - _022345BA - 2 @ case 44
	.2byte _022347AA - _022345BA - 2 @ case 45
	.2byte _022347B2 - _022345BA - 2 @ case 46
	.2byte _02234740 - _022345BA - 2 @ case 47
	.2byte _02234746 - _022345BA - 2 @ case 48
	.2byte _02234774 - _022345BA - 2 @ case 49
	.2byte _022347B8 - _022345BA - 2 @ case 50
	.2byte _022347C0 - _022345BA - 2 @ case 51
	.2byte _022347C8 - _022345BA - 2 @ case 52
	.2byte _022347D0 - _022345BA - 2 @ case 53
	.2byte _022347D8 - _022345BA - 2 @ case 54
	.2byte _0223489C - _022345BA - 2 @ case 55
	.2byte _0223489C - _022345BA - 2 @ case 56
	.2byte _0223489C - _022345BA - 2 @ case 57
	.2byte _0223489C - _022345BA - 2 @ case 58
	.2byte _0223489C - _022345BA - 2 @ case 59
	.2byte _0223489C - _022345BA - 2 @ case 60
	.2byte _0223489C - _022345BA - 2 @ case 61
	.2byte _0223489C - _022345BA - 2 @ case 62
	.2byte _0223489C - _022345BA - 2 @ case 63
	.2byte _0223489C - _022345BA - 2 @ case 64
	.2byte _0223484E - _022345BA - 2 @ case 65
	.2byte _0223486C - _022345BA - 2 @ case 66
	.2byte _022347E0 - _022345BA - 2 @ case 67
	.2byte _022347E8 - _022345BA - 2 @ case 68
	.2byte _022347F0 - _022345BA - 2 @ case 69
	.2byte _022347F8 - _022345BA - 2 @ case 70
	.2byte _02234800 - _022345BA - 2 @ case 71
	.2byte _02234808 - _022345BA - 2 @ case 72
	.2byte _02234810 - _022345BA - 2 @ case 73
	.2byte _02234818 - _022345BA - 2 @ case 74
	.2byte _02234820 - _022345BA - 2 @ case 75
	.2byte _02234828 - _022345BA - 2 @ case 76
	.2byte _02234830 - _022345BA - 2 @ case 77
	.2byte _02234838 - _022345BA - 2 @ case 78
	.2byte _02234840 - _022345BA - 2 @ case 79
	.2byte _02234848 - _022345BA - 2 @ case 80
_0223465C:
	ldr r4, [r6]
	b _0223489C
_02234660:
	ldr r4, [r6, #4]
	b _0223489C
_02234664:
	ldrb r0, [r6, #0x13]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _02234670
	movs r4, #0
	b _0223467E
_02234670:
	movs r4, #0
_02234672:
	adds r0, r6, r4
	ldrb r0, [r0, #8]
	strb r0, [r7, r4]
	adds r4, r4, #1
	cmp r4, #0xa
	blo _02234672
_0223467E:
	movs r0, #0xff
	strb r0, [r7, r4]
	b _0223489C
_02234684:
	ldrb r4, [r6, #0x12]
	b _0223489C
_02234688:
	ldrb r0, [r6, #0x13]
	lsls r0, r0, #0x1f
	lsrs r4, r0, #0x1f
	b _0223489C
_02234690:
	ldrb r0, [r6, #0x13]
	lsls r0, r0, #0x1e
	lsrs r4, r0, #0x1f
	b _0223489C
_02234698:
	ldrb r0, [r6, #0x13]
	lsls r0, r0, #0x1d
	lsrs r4, r0, #0x1f
	b _0223489C
_022346A0:
	movs r4, #0
_022346A2:
	adds r0, r6, r4
	ldrb r0, [r0, #0x14]
	strb r0, [r7, r4]
	adds r4, r4, #1
	cmp r4, #7
	blo _022346A2
	movs r0, #0xff
	strb r0, [r7, r4]
	b _0223489C
_022346B4:
	ldrb r4, [r6, #0x1b]
	b _0223489C
_022346B8:
	ldrh r4, [r6, #0x1c]
	b _0223489C
_022346BC:
	ldrh r4, [r6, #0x1e]
	b _0223489C
_022346C0:
	ldrb r0, [r6, #0x13]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _022346CE
	movs r4, #0x67
	lsls r4, r4, #2
	b _0223489C
_022346CE:
	ldr r0, [sp, #0xc]
	ldrh r4, [r0]
	b _0223489C
_022346D4:
	ldr r0, [sp, #0xc]
	ldrh r4, [r0, #2]
	b _0223489C
_022346DA:
	ldr r0, [sp, #0xc]
	ldr r4, [r0, #4]
	b _0223489C
_022346E0:
	ldr r0, [sp, #0xc]
	ldrb r4, [r0, #8]
	b _0223489C
_022346E6:
	ldr r0, [sp, #0xc]
	ldrb r4, [r0, #9]
	b _0223489C
_022346EC:
	ldr r0, [sp]
	subs r0, #0xd
	lsls r1, r0, #1
	ldr r0, [sp, #8]
	ldrh r4, [r0, r1]
	b _0223489C
_022346F8:
	ldr r1, [sp]
	ldr r0, [sp, #8]
	subs r1, #0x11
	adds r0, r0, r1
	ldrb r4, [r0, #8]
	b _0223489C
_02234704:
	ldr r0, [sp, #4]
	ldrb r4, [r0]
	b _0223489C
_0223470A:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #1]
	b _0223489C
_02234710:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #2]
	b _0223489C
_02234716:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #3]
	b _0223489C
_0223471C:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #4]
	b _0223489C
_02234722:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #5]
	b _0223489C
_02234728:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #6]
	b _0223489C
_0223472E:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #7]
	b _0223489C
_02234734:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #8]
	b _0223489C
_0223473A:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #9]
	b _0223489C
_02234740:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #0xa]
	b _0223489C
_02234746:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #0xb]
	b _0223489C
_0223474C:
	ldr r0, [r5]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _0223489C
_02234754:
	ldr r0, [r5]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x18
	b _0223489C
_0223475C:
	ldr r0, [r5]
	lsls r0, r0, #9
	lsrs r4, r0, #0x19
	b _0223489C
_02234764:
	ldr r0, [r5]
	lsls r0, r0, #5
	lsrs r4, r0, #0x1c
	b _0223489C
_0223476C:
	ldr r0, [r5]
	lsls r0, r0, #1
	lsrs r4, r0, #0x1c
	b _0223489C
_02234774:
	ldr r0, [r5]
	lsrs r4, r0, #0x1f
	b _0223489C
_0223477A:
	ldr r0, [r5, #4]
	lsls r0, r0, #0x1b
	lsrs r4, r0, #0x1b
	b _0223489C
_02234782:
	ldr r0, [r5, #4]
	lsls r0, r0, #0x16
	lsrs r4, r0, #0x1b
	b _0223489C
_0223478A:
	ldr r0, [r5, #4]
	lsls r0, r0, #0x11
	lsrs r4, r0, #0x1b
	b _0223489C
_02234792:
	ldr r0, [r5, #4]
	lsls r0, r0, #0xc
	lsrs r4, r0, #0x1b
	b _0223489C
_0223479A:
	ldr r0, [r5, #4]
	lsls r0, r0, #7
	lsrs r4, r0, #0x1b
	b _0223489C
_022347A2:
	ldr r0, [r5, #4]
	lsls r0, r0, #2
	lsrs r4, r0, #0x1b
	b _0223489C
_022347AA:
	ldr r0, [r5, #4]
	lsls r0, r0, #1
	lsrs r4, r0, #0x1f
	b _0223489C
_022347B2:
	ldr r0, [r5, #4]
	lsrs r4, r0, #0x1f
	b _0223489C
_022347B8:
	ldr r0, [r5, #8]
	lsls r0, r0, #0x1d
	lsrs r4, r0, #0x1d
	b _0223489C
_022347C0:
	ldr r0, [r5, #8]
	lsls r0, r0, #0x1a
	lsrs r4, r0, #0x1d
	b _0223489C
_022347C8:
	ldr r0, [r5, #8]
	lsls r0, r0, #0x17
	lsrs r4, r0, #0x1d
	b _0223489C
_022347D0:
	ldr r0, [r5, #8]
	lsls r0, r0, #0x14
	lsrs r4, r0, #0x1d
	b _0223489C
_022347D8:
	ldr r0, [r5, #8]
	lsls r0, r0, #0x11
	lsrs r4, r0, #0x1d
	b _0223489C
_022347E0:
	ldr r0, [r5, #8]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x1f
	b _0223489C
_022347E8:
	ldr r0, [r5, #8]
	lsls r0, r0, #0xf
	lsrs r4, r0, #0x1f
	b _0223489C
_022347F0:
	ldr r0, [r5, #8]
	lsls r0, r0, #0xe
	lsrs r4, r0, #0x1f
	b _0223489C
_022347F8:
	ldr r0, [r5, #8]
	lsls r0, r0, #0xd
	lsrs r4, r0, #0x1f
	b _0223489C
_02234800:
	ldr r0, [r5, #8]
	lsls r0, r0, #0xc
	lsrs r4, r0, #0x1f
	b _0223489C
_02234808:
	ldr r0, [r5, #8]
	lsls r0, r0, #0xb
	lsrs r4, r0, #0x1f
	b _0223489C
_02234810:
	ldr r0, [r5, #8]
	lsls r0, r0, #0xa
	lsrs r4, r0, #0x1f
	b _0223489C
_02234818:
	ldr r0, [r5, #8]
	lsls r0, r0, #9
	lsrs r4, r0, #0x1f
	b _0223489C
_02234820:
	ldr r0, [r5, #8]
	lsls r0, r0, #8
	lsrs r4, r0, #0x1f
	b _0223489C
_02234828:
	ldr r0, [r5, #8]
	lsls r0, r0, #7
	lsrs r4, r0, #0x1f
	b _0223489C
_02234830:
	ldr r0, [r5, #8]
	lsls r0, r0, #6
	lsrs r4, r0, #0x1f
	b _0223489C
_02234838:
	ldr r0, [r5, #8]
	lsls r0, r0, #5
	lsrs r4, r0, #0x1f
	b _0223489C
_02234840:
	ldr r0, [r5, #8]
	lsls r0, r0, #1
	lsrs r4, r0, #0x1c
	b _0223489C
_02234848:
	ldr r0, [r5, #8]
	lsrs r4, r0, #0x1f
	b _0223489C
_0223484E:
	ldr r0, [sp, #0xc]
	ldrh r4, [r0]
	cmp r4, #0
	beq _0223489C
	ldr r0, [r5, #4]
	lsls r0, r0, #1
	lsrs r0, r0, #0x1f
	bne _02234866
	ldrb r0, [r6, #0x13]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _0223489C
_02234866:
	movs r4, #0x67
	lsls r4, r4, #2
	b _0223489C
_0223486C:
	ldr r4, [r5, #4]
	lsls r0, r4, #2
	lsrs r0, r0, #0x1b
	lsls r5, r0, #0x19
	lsls r0, r4, #7
	lsrs r0, r0, #0x1b
	lsls r3, r0, #0x14
	lsls r0, r4, #0xc
	lsrs r0, r0, #0x1b
	lsls r2, r0, #0xf
	lsls r0, r4, #0x11
	lsrs r0, r0, #0x1b
	lsls r1, r0, #0xa
	lsls r0, r4, #0x1b
	lsls r4, r4, #0x16
	lsrs r4, r4, #0x1b
	lsrs r0, r0, #0x1b
	lsls r4, r4, #5
	orrs r0, r4
	orrs r0, r1
	orrs r0, r2
	orrs r0, r3
	adds r4, r5, #0
	orrs r4, r0
_0223489C:
	ldr r0, [sp]
	cmp r0, #0xa
	ble _022348A8
	adds r0, r6, #0
	bl ov74_02234488
_022348A8:
	adds r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov74_02234530

	thumb_func_start ov74_022348B0
ov74_022348B0: @ 0x022348B0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r4, r0, #0
	adds r5, r2, #0
	movs r7, #0
	cmp r6, #0xa
	ble _02234924
	ldr r1, [r4]
	adds r2, r7, #0
	bl ov74_02233F8C
	adds r7, r0, #0
	ldr r1, [r4]
	adds r0, r4, #0
	movs r2, #1
	bl ov74_02233F8C
	ldr r1, [r4]
	adds r0, r4, #0
	movs r2, #2
	bl ov74_02233F8C
	ldr r1, [r4]
	adds r0, r4, #0
	movs r2, #3
	bl ov74_02233F8C
	str r0, [sp]
	adds r0, r4, #0
	bl ov74_02234468
	adds r0, r4, #0
	bl ov74_022344A8
	ldrh r1, [r4, #0x1c]
	cmp r0, r1
	beq _02234924
	ldrb r1, [r4, #0x13]
	movs r0, #1
	bics r1, r0
	movs r0, #1
	orrs r0, r1
	strb r0, [r4, #0x13]
	ldrb r1, [r4, #0x13]
	movs r0, #4
	orrs r0, r1
	strb r0, [r4, #0x13]
	ldr r0, [sp]
	ldr r1, [r0, #4]
	movs r0, #1
	lsls r0, r0, #0x1e
	orrs r1, r0
	ldr r0, [sp]
	str r1, [r0, #4]
	adds r0, r4, #0
	bl ov74_02234488
	pop {r3, r4, r5, r6, r7, pc}
_02234924:
	cmp r6, #0xb
	bhi _022349C8
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02234934: @ jump table
	.2byte _022349C8 - _02234934 - 2 @ case 0
	.2byte _022349C8 - _02234934 - 2 @ case 1
	.2byte _0223494C - _02234934 - 2 @ case 2
	.2byte _0223495C - _02234934 - 2 @ case 3
	.2byte _02234962 - _02234934 - 2 @ case 4
	.2byte _02234974 - _02234934 - 2 @ case 5
	.2byte _02234986 - _02234934 - 2 @ case 6
	.2byte _02234998 - _02234934 - 2 @ case 7
	.2byte _022349C8 - _02234934 - 2 @ case 8
	.2byte _022349C8 - _02234934 - 2 @ case 9
	.2byte _022349C8 - _02234934 - 2 @ case 10
	.2byte _022349A8 - _02234934 - 2 @ case 11
_0223494C:
	movs r2, #0
_0223494E:
	ldrb r1, [r5, r2]
	adds r0, r4, r2
	adds r2, r2, #1
	strb r1, [r0, #8]
	cmp r2, #0xa
	blt _0223494E
	b _022349C8
_0223495C:
	ldrb r0, [r5]
	strb r0, [r4, #0x12]
	b _022349C8
_02234962:
	ldrb r0, [r4, #0x13]
	ldrb r2, [r5]
	movs r1, #1
	bics r0, r1
	movs r1, #1
	ands r1, r2
	orrs r0, r1
	strb r0, [r4, #0x13]
	b _022349C8
_02234974:
	ldrb r0, [r4, #0x13]
	movs r1, #2
	bics r0, r1
	ldrb r1, [r5]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1e
	orrs r0, r1
	strb r0, [r4, #0x13]
	b _022349C8
_02234986:
	ldrb r0, [r4, #0x13]
	movs r1, #4
	bics r0, r1
	ldrb r1, [r5]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1d
	orrs r0, r1
	strb r0, [r4, #0x13]
	b _022349C8
_02234998:
	movs r2, #0
_0223499A:
	ldrb r1, [r5, r2]
	adds r0, r4, r2
	adds r2, r2, #1
	strb r1, [r0, #0x14]
	cmp r2, #7
	blt _0223499A
	b _022349C8
_022349A8:
	ldrb r0, [r5, #1]
	ldrb r1, [r5]
	lsls r0, r0, #8
	adds r0, r1, r0
	strh r0, [r7]
	ldrh r0, [r7]
	ldrb r1, [r4, #0x13]
	cmp r0, #0
	beq _022349C2
	movs r0, #2
	orrs r0, r1
	strb r0, [r4, #0x13]
	b _022349C8
_022349C2:
	movs r0, #2
	bics r1, r0
	strb r1, [r4, #0x13]
_022349C8:
	cmp r6, #0xa
	ble _022349DA
	adds r0, r4, #0
	bl ov74_022344A8
	strh r0, [r4, #0x1c]
	adds r0, r4, #0
	bl ov74_02234488
_022349DA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_022348B0

	thumb_func_start ov74_022349DC
ov74_022349DC: @ 0x022349DC
	ldr r1, _02234A00 @ =0x00000115
	cmp r0, r1
	blt _022349FC
	ldr r3, _02234A04 @ =0x0223CC5C
	movs r2, #0
_022349E6:
	ldrh r1, [r3]
	cmp r0, r1
	bne _022349F4
	ldr r0, _02234A08 @ =0x0223CC5E
	lsls r1, r2, #2
	ldrh r0, [r0, r1]
	bx lr
_022349F4:
	adds r2, r2, #1
	adds r3, r3, #4
	cmp r2, #0x90
	blo _022349E6
_022349FC:
	bx lr
	nop
_02234A00: .4byte 0x00000115
_02234A04: .4byte 0x0223CC5C
_02234A08: .4byte 0x0223CC5E
	thumb_func_end ov74_022349DC

	thumb_func_start ov74_02234A0C
ov74_02234A0C: @ 0x02234A0C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0xb
	movs r2, #0
	bl ov74_02234530
	bl ov74_022349DC
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x19
	movs r2, #0
	bl ov74_02234530
	adds r1, r0, #0
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0206FDA8
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_02234A0C

	thumb_func_start ov74_02234A34
ov74_02234A34: @ 0x02234A34
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x2e
	movs r2, #0
	bl ov74_02234530
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0x19
	bl FUN_0206FBE8
	cmp r0, #0
	beq _02234A8E
	ldr r2, _02234A98 @ =0x0223CBA0
	movs r4, #0
_02234A62:
	ldrh r1, [r2]
	cmp r5, r1
	bne _02234A72
	adds r0, r5, #0
	movs r1, #0x18
	bl FUN_0206FBE8
	b _02234A7A
_02234A72:
	adds r4, r4, #1
	adds r2, r2, #2
	cmp r4, #0x5e
	blo _02234A62
_02234A7A:
	cmp r4, #0x5e
	bne _02234A96
	movs r1, #1
	tst r1, r6
	bne _02234A96
	adds r0, r5, #0
	movs r1, #0x18
	bl FUN_0206FBE8
	pop {r4, r5, r6, pc}
_02234A8E:
	adds r0, r5, #0
	movs r1, #0x18
	bl FUN_0206FBE8
_02234A96:
	pop {r4, r5, r6, pc}
	.align 2, 0
_02234A98: .4byte 0x0223CBA0
	thumb_func_end ov74_02234A34

	thumb_func_start ov74_02234A9C
ov74_02234A9C: @ 0x02234A9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r4, r1, #0
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_0206DD0C
	adds r0, r4, #0
	bl FUN_0206DDD8
	movs r1, #0
	str r0, [sp]
	adds r0, r6, #0
	adds r2, r1, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	bl ov74_022349DC
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #5
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	cmp r0, #0
	beq _02234AFE
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02077CB0
	str r0, [sp, #8]
_02234AFE:
	adds r0, r4, #0
	movs r1, #6
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #7
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x19
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #8
	add r2, sp, #8
	bl FUN_0206ED70
	movs r0, #0x46
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #9
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov74_02234A34
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0xa
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #8
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0xb
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #3
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0xc
	add r2, sp, #4
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x1a
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0xd
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x1b
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0xe
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x1c
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0xf
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x1d
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x10
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x1e
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x11
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x1f
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x12
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x16
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x13
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x17
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x14
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x18
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x15
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x21
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x16
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x2f
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x17
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x30
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x18
	add r2, sp, #8
	bl FUN_0206ED70
	movs r5, #0
	adds r7, r5, #0
_02234C8E:
	adds r1, r5, #0
	adds r0, r6, #0
	adds r1, #0xd
	movs r2, #0
	bl ov74_02234530
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, #0x36
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x15
	movs r2, #0
	bl ov74_02234530
	movs r1, #3
	lsls r1, r7
	str r0, [sp, #8]
	ands r0, r1
	lsrs r0, r7
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, #0x3e
	add r2, sp, #8
	bl FUN_0206ED70
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x42
	movs r2, #0
	bl FUN_0206E640
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, #0x3a
	add r2, sp, #8
	bl FUN_0206ED70
	adds r5, r5, #1
	adds r7, r7, #2
	cmp r5, #4
	blt _02234C8E
	adds r0, r6, #0
	movs r1, #0x27
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x46
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x47
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x29
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x48
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x2a
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x49
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x2b
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x4a
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x2c
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x4b
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x2d
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x4c
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x32
	movs r2, #0
	bl ov74_02234530
	adds r7, r0, #0
	cmp r7, #4
	bgt _02234DB2
	movs r5, #0
	cmp r7, #0
	ble _02234DB2
_02234D9C:
	movs r0, #1
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, #0x4e
	add r2, sp, #8
	bl FUN_0206ED70
	adds r5, r5, #1
	cmp r5, r7
	blt _02234D9C
_02234DB2:
	adds r0, r6, #0
	movs r1, #0x33
	movs r2, #0
	bl ov74_02234530
	adds r7, r0, #0
	cmp r7, #4
	bgt _02234DDE
	movs r5, #0
	cmp r7, #0
	ble _02234DDE
_02234DC8:
	movs r0, #1
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, #0x52
	add r2, sp, #8
	bl FUN_0206ED70
	adds r5, r5, #1
	cmp r5, r7
	blt _02234DC8
_02234DDE:
	adds r0, r6, #0
	movs r1, #0x34
	movs r2, #0
	bl ov74_02234530
	adds r7, r0, #0
	cmp r7, #4
	bgt _02234E0A
	movs r5, #0
	cmp r7, #0
	ble _02234E0A
_02234DF4:
	movs r0, #1
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, #0x56
	add r2, sp, #8
	bl FUN_0206ED70
	adds r5, r5, #1
	cmp r5, r7
	blt _02234DF4
_02234E0A:
	adds r0, r6, #0
	movs r1, #0x35
	movs r2, #0
	bl ov74_02234530
	adds r7, r0, #0
	cmp r7, #4
	bgt _02234E36
	movs r5, #0
	cmp r7, #0
	ble _02234E36
_02234E20:
	movs r0, #1
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, #0x5a
	add r2, sp, #8
	bl FUN_0206ED70
	adds r5, r5, #1
	cmp r5, r7
	blt _02234E20
_02234E36:
	adds r0, r6, #0
	movs r1, #0x36
	movs r2, #0
	bl ov74_02234530
	adds r7, r0, #0
	cmp r7, #4
	bgt _02234E62
	movs r5, #0
	cmp r7, #0
	ble _02234E62
_02234E4C:
	movs r0, #1
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, #0x5e
	add r2, sp, #8
	bl FUN_0206ED70
	adds r5, r5, #1
	cmp r5, r7
	blt _02234E4C
_02234E62:
	adds r0, r6, #0
	movs r1, #0x43
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x62
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x44
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x63
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x45
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x64
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x46
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x65
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x66
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x48
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x67
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x49
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x68
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x4a
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x69
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x4b
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x6a
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x4c
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x6b
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x4d
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x6c
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x4e
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x6d
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x50
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x6e
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r4, #0
	bl FUN_0206FF90
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x6f
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	cmp r0, #0xc9
	bne _02234FDE
	movs r1, #0
	adds r0, r6, #0
	adds r2, r1, #0
	bl ov74_02234530
	adds r3, r0, #0
	movs r7, #3
	lsls r0, r7, #8
	ands r0, r3
	lsrs r1, r0, #6
	lsls r0, r7, #0x18
	ands r0, r3
	lsrs r5, r0, #0x12
	lsls r0, r7, #0x10
	ands r0, r3
	lsrs r0, r0, #0xc
	adds r2, r3, #0
	orrs r0, r5
	orrs r0, r1
	ands r2, r7
	str r3, [sp, #8]
	orrs r0, r2
	movs r1, #0x1c
	blx FUN_020F2BA4
	str r1, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x70
	add r2, sp, #8
	bl FUN_0206ED70
_02234FDE:
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	ldr r1, _02235120 @ =0x00000182
	cmp r0, r1
	bne _0223502E
	ldr r0, _02235124 @ =0x021D116C
	ldrb r0, [r0, #0xa]
	cmp r0, #5
	bhi _0223500E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02235002: @ jump table
	.2byte _0223500E - _02235002 - 2 @ case 0
	.2byte _0223500E - _02235002 - 2 @ case 1
	.2byte _0223500E - _02235002 - 2 @ case 2
	.2byte _02235020 - _02235002 - 2 @ case 3
	.2byte _02235014 - _02235002 - 2 @ case 4
	.2byte _0223501A - _02235002 - 2 @ case 5
_0223500E:
	movs r0, #0
	str r0, [sp, #8]
	b _02235024
_02235014:
	movs r0, #1
	str r0, [sp, #8]
	b _02235024
_0223501A:
	movs r0, #2
	str r0, [sp, #8]
	b _02235024
_02235020:
	movs r0, #3
	str r0, [sp, #8]
_02235024:
	adds r0, r4, #0
	movs r1, #0x70
	add r2, sp, #8
	bl FUN_0206ED70
_0223502E:
	adds r0, r6, #0
	movs r1, #2
	add r2, sp, #0x24
	bl ov74_02234530
	ldr r3, [sp, #4]
	add r0, sp, #0x24
	add r1, sp, #0xc
	movs r2, #0xc
	bl ov74_02236FB8
	adds r0, r4, #0
	movs r1, #0x76
	add r2, sp, #0xc
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #3
	movs r2, #0
	bl ov74_02234530
	ldr r1, _02235128 @ =0x020F5670
	ldrb r1, [r1]
	cmp r1, r0
	beq _0223506E
	movs r0, #1
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x4d
	add r2, sp, #8
	bl FUN_0206ED70
_0223506E:
	adds r0, r6, #0
	movs r1, #0x25
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x7a
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #7
	add r2, sp, #0x24
	bl ov74_02234530
	ldr r3, [sp, #4]
	add r0, sp, #0x24
	add r1, sp, #0xc
	movs r2, #8
	bl ov74_02236FB8
	adds r0, r4, #0
	movs r1, #0x90
	add r2, sp, #0xc
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x23
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x99
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x22
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x9a
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x26
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x9b
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x24
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x9c
	add r2, sp, #8
	bl FUN_0206ED70
	adds r0, r6, #0
	movs r1, #0x31
	movs r2, #0
	bl ov74_02234530
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x9d
	add r2, sp, #8
	bl FUN_0206ED70
	ldr r1, [sp]
	adds r0, r4, #0
	bl FUN_0206DE00
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02235120: .4byte 0x00000182
_02235124: .4byte 0x021D116C
_02235128: .4byte 0x020F5670
	thumb_func_end ov74_02234A9C

	thumb_func_start ov74_0223512C
ov74_0223512C: @ 0x0223512C
	ldr r1, _02235134 @ =0x0223D450
	str r0, [r1]
	bx lr
	nop
_02235134: .4byte 0x0223D450
	thumb_func_end ov74_0223512C

	thumb_func_start ov74_02235138
ov74_02235138: @ 0x02235138
	adds r1, r0, #0
	ldr r0, _02235144 @ =0x0223D450
	ldr r3, _02235148 @ =FUN_0201AA8C
	ldr r0, [r0]
	bx r3
	nop
_02235144: .4byte 0x0223D450
_02235148: .4byte FUN_0201AA8C
	thumb_func_end ov74_02235138

	thumb_func_start ov74_0223514C
ov74_0223514C: @ 0x0223514C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x130
	blx FUN_020E1058
	lsrs r1, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r0, #0x10
	lsls r3, r0, #0x18
	lsrs r0, r0, #8
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #8
	lsrs r1, r1, #0x10
	orrs r0, r3
	orrs r0, r1
	adds r6, r2, #0
	orrs r6, r0
	ldr r0, _022351E0 @ =0x0223CE9C
	movs r4, #0
	ldr r0, [r0]
	cmp r0, #0
	bls _022351D6
	ldr r5, _022351E4 @ =0x0223CE9C
	add r7, sp, #0x80
_02235182:
	ldr r0, [r5]
	cmp r6, r0
	bne _022351CC
	movs r0, #1
	blx FUN_020E1678
	movs r0, #0x81
	ldr r2, _022351E8 @ =0x000004A8
	lsls r0, r0, #0x14
	adds r1, r7, #0
	blx FUN_020E138C
	ldr r0, _022351EC @ =0x08020000
	add r1, sp, #0
	movs r2, #0x80
	blx FUN_020E138C
	movs r0, #0
	blx FUN_020E1678
	ldr r0, _022351F0 @ =ov74_02235138
	ldr r1, _022351F4 @ =FUN_0201AB0C
	blx ov74_0223B214
	ldr r1, _022351E8 @ =0x000004A8
	ldr r3, _022351F8 @ =0x0223B690
	adds r0, r7, #0
	add r2, sp, #0
	blx ov74_022370E4
	cmp r0, #0
	beq _022351CC
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x130
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022351CC:
	adds r5, r5, #4
	ldr r0, [r5]
	adds r4, r4, #1
	cmp r4, r0
	blo _02235182
_022351D6:
	movs r0, #0
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x130
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022351E0: .4byte 0x0223CE9C
_022351E4: .4byte 0x0223CE9C
_022351E8: .4byte 0x000004A8
_022351EC: .4byte 0x08020000
_022351F0: .4byte ov74_02235138
_022351F4: .4byte FUN_0201AB0C
_022351F8: .4byte 0x0223B690
	thumb_func_end ov74_0223514C

	thumb_func_start ov74_022351FC
ov74_022351FC: @ 0x022351FC
	push {r3, lr}
	blx FUN_020E16E4
	blx FUN_020E0FF0
	cmp r0, #0
	bne _0223520E
	movs r0, #0
	pop {r3, pc}
_0223520E:
	blx FUN_020E10A0
	ldr r1, _0223522C @ =0x00003130
	cmp r0, r1
	beq _0223521C
	movs r0, #0
	pop {r3, pc}
_0223521C:
	bl ov74_0223514C
	cmp r0, #0
	beq _02235228
	movs r0, #1
	pop {r3, pc}
_02235228:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_0223522C: .4byte 0x00003130
	thumb_func_end ov74_022351FC

	thumb_func_start ov74_02235230
ov74_02235230: @ 0x02235230
	push {r3, lr}
	bl ov74_022351FC
	cmp r0, #0
	bne _0223523E
	movs r0, #0
	pop {r3, pc}
_0223523E:
	movs r0, #1
	blx FUN_020E1678
	movs r0, #0x81
	lsls r0, r0, #0x14
	add r1, sp, #0
	blx FUN_020E1570
	movs r0, #0
	blx FUN_020E1678
	ldr r0, [sp]
	pop {r3, pc}
	thumb_func_end ov74_02235230

	thumb_func_start ov74_02235258
ov74_02235258: @ 0x02235258
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov74_022351FC
	cmp r0, #0
	bne _0223526A
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223526A:
	cmp r4, #0
	bne _02235274
	bl ov74_02235230
	adds r4, r0, #0
_02235274:
	movs r0, #1
	blx FUN_020E1678
	ldr r0, _0223529C @ =0x08100100
	adds r1, r5, #0
	adds r2, r4, #0
	blx FUN_020E13E4
	adds r4, r0, #0
	movs r0, #0
	blx FUN_020E1678
	blx FUN_020E1134
	cmp r0, #0
	bne _02235298
	movs r0, #0
	pop {r3, r4, r5, pc}
_02235298:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223529C: .4byte 0x08100100
	thumb_func_end ov74_02235258

	thumb_func_start ov74_022352A0
ov74_022352A0: @ 0x022352A0
	push {r3, r4, r5, r6}
	adds r4, r0, #0
	movs r0, #0
	ldr r6, _022352C8 @ =0x0223D454
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	movs r5, #0x75
_022352B0:
	stm r6!, {r0, r1, r2, r3}
	stm r6!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _022352B0
	stm r6!, {r0, r1}
	ldr r0, _022352CC @ =0x0223D454
	movs r1, #1
	str r1, [r0, #4]
	str r4, [r0, #8]
	pop {r3, r4, r5, r6}
	bx lr
	nop
_022352C8: .4byte 0x0223D454
_022352CC: .4byte 0x0223D454
	thumb_func_end ov74_022352A0

	thumb_func_start ov74_022352D0
ov74_022352D0: @ 0x022352D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	adds r6, r1, #0
	movs r0, #3
	adds r2, r3, #0
	bl FUN_0201A910
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_02007280
	movs r1, #0
	adds r2, r4, #0
	adds r5, r0, #0
	blx FUN_020E5B44
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov74_022352D0

	thumb_func_start ov74_02235308
ov74_02235308: @ 0x02235308
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r5, _0223538C @ =0x0223B720
	adds r6, r3, #0
	adds r7, r0, #0
	adds r4, r1, #0
	ldm r5!, {r0, r1}
	add r3, sp, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	cmp r2, #4
	str r0, [r3]
	add r0, sp, #0
	strb r2, [r0, #0x10]
	bhi _02235362
	adds r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223533A: @ jump table
	.2byte _02235362 - _0223533A - 2 @ case 0
	.2byte _02235344 - _0223533A - 2 @ case 1
	.2byte _0223534C - _0223533A - 2 @ case 2
	.2byte _02235354 - _0223533A - 2 @ case 3
	.2byte _0223535C - _0223533A - 2 @ case 4
_02235344:
	movs r0, #2
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	b _02235362
_0223534C:
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	b _02235362
_02235354:
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	b _02235362
_0223535C:
	movs r0, #2
	lsls r0, r0, #0xc
	str r0, [sp, #8]
_02235362:
	lsrs r1, r6, #0xb
	add r0, sp, #0
	strb r1, [r0, #0x12]
	ldr r1, [sp, #0x30]
	add r2, sp, #0
	lsrs r1, r1, #0xe
	strb r1, [r0, #0x13]
	lsls r1, r4, #0x18
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	movs r3, #0
	bl FUN_0201B1E4
	lsls r1, r4, #0x18
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223538C: .4byte 0x0223B720
	thumb_func_end ov74_02235308

	thumb_func_start ov74_02235390
ov74_02235390: @ 0x02235390
	ldr r1, _02235398 @ =0x0223D454
	str r0, [r1, #0x10]
	bx lr
	nop
_02235398: .4byte 0x0223D454
	thumb_func_end ov74_02235390

	thumb_func_start ov74_0223539C
ov74_0223539C: @ 0x0223539C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp, #0xc]
	ldr r0, _022353F0 @ =0x0223D454
	adds r5, r1, #0
	ldr r0, [r0, #0x10]
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r7, _022353F4 @ =0x0223D454
	cmp r0, #0
	bne _022353CC
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r7, #8]
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	b _022353E4
_022353CC:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r7, #8]
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	ldr r3, _022353F8 @ =0x00007FFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
_022353E4:
	cmp r4, #0
	beq _022353EA
	str r6, [r4]
_022353EA:
	str r5, [r7, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022353F0: .4byte 0x0223D454
_022353F4: .4byte 0x0223D454
_022353F8: .4byte 0x00007FFF
	thumb_func_end ov74_0223539C

	thumb_func_start ov74_022353FC
ov74_022353FC: @ 0x022353FC
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _02235410 @ =0x0223D454
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223540E
	ldr r0, [r5, #0xc]
	str r0, [r4]
_0223540E:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02235410: .4byte 0x0223D454
	thumb_func_end ov74_022353FC

	thumb_func_start ov74_02235414
ov74_02235414: @ 0x02235414
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r6, r2, #0
	movs r1, #0
	movs r2, #0x54
	adds r5, r0, #0
	adds r7, r3, #0
	blx FUN_020E5B44
	movs r0, #1
	str r0, [r5, #4]
	str r0, [r5, #8]
	subs r0, r0, #2
	str r0, [r5, #0x4c]
	str r4, [r5, #0x10]
	str r6, [r5, #0x30]
	ldr r0, [sp, #0x18]
	str r7, [r5, #0x34]
	str r0, [r5, #0x38]
	ldr r0, [sp, #0x1c]
	movs r2, #0
	str r0, [r5, #0x3c]
	str r2, [r5, #0x2c]
	ldr r0, _02235460 @ =0x0001020F
	str r2, [r5, #0x40]
	str r0, [r5, #0x44]
	adds r0, r5, #0
	movs r1, #0xf
	adds r0, #0x48
	strb r1, [r0]
	str r2, [r5]
	str r2, [r5, #0x24]
	str r2, [r5, #0x20]
	str r2, [r5, #0x14]
	movs r0, #0xff
	str r0, [r5, #0x50]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02235460: .4byte 0x0001020F
	thumb_func_end ov74_02235414

	thumb_func_start ov74_02235464
ov74_02235464: @ 0x02235464
	str r1, [r0, #0x18]
	str r2, [r0, #0x1c]
	str r3, [r0, #0x28]
	bx lr
	thumb_func_end ov74_02235464

	thumb_func_start ov74_0223546C
ov74_0223546C: @ 0x0223546C
	str r1, [r0]
	str r2, [r0, #0x40]
	bx lr
	.align 2, 0
	thumb_func_end ov74_0223546C

	thumb_func_start ov74_02235474
ov74_02235474: @ 0x02235474
	str r1, [r0, #0x20]
	str r2, [r0, #0x24]
	bx lr
	.align 2, 0
	thumb_func_end ov74_02235474

	thumb_func_start ov74_0223547C
ov74_0223547C: @ 0x0223547C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	ldr r4, _02235564 @ =0x0223D454
	cmp r1, r0
	beq _0223555A
	ldr r0, [r5, #0x4c]
	cmp r0, r1
	beq _0223555A
	str r1, [r5, #0x4c]
	ldr r0, [r5, #8]
	cmp r0, #1
	bne _022354A6
	adds r1, r5, #0
	adds r1, #0x48
	ldrb r1, [r1]
	ldr r0, [r5, #0x10]
	bl FUN_0201D978
_022354A6:
	movs r0, #0
	ldr r1, [r5, #0x4c]
	mvns r0, r0
	cmp r1, r0
	beq _0223555A
	ldr r2, [r5, #0x34]
	ldr r3, [r4, #8]
	movs r0, #1
	movs r1, #0x1b
	bl FUN_0200BAF8
	ldr r6, [r5, #0x14]
	str r0, [sp, #0x10]
	cmp r6, #0
	bne _022354CC
	ldr r0, [r4, #8]
	bl FUN_0200BD08
	adds r6, r0, #0
_022354CC:
	ldr r1, [sp, #0x10]
	ldr r2, [r5, #0x4c]
	ldr r3, [r4, #8]
	adds r0, r6, #0
	bl FUN_0200BC4C
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _02235500
	ldr r0, [r5, #0x24]
	adds r2, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0x50]
	str r0, [sp, #4]
	ldr r0, [r5, #0x44]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x40]
	ldr r3, [r5, #0x20]
	bl FUN_020200FC
	adds r7, r0, #0
	b _02235542
_02235500:
	ldr r0, [r5, #0x40]
	movs r1, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02002FAC
	adds r2, r0, #0
	ldr r0, [r5, #0x40]
	adds r1, r4, #0
	bl FUN_02002F30
	adds r7, r0, #0
	ldr r0, [r5, #0x10]
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r3, r0, r7
	ldr r0, [r5, #0x24]
	adds r2, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0x50]
	str r0, [sp, #4]
	ldr r0, [r5, #0x44]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x40]
	bl FUN_020200FC
	adds r7, r0, #0
	movs r0, #0
	str r0, [r5, #0xc]
_02235542:
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _02235554
	adds r0, r6, #0
	bl FUN_0200BDA0
_02235554:
	ldr r0, [sp, #0x10]
	bl FUN_0200BB44
_0223555A:
	movs r0, #0xff
	str r0, [r5, #0x50]
	adds r0, r7, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02235564: .4byte 0x0223D454
	thumb_func_end ov74_0223547C

	thumb_func_start ov74_02235568
ov74_02235568: @ 0x02235568
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r4, r1, #0
	ldr r1, [r4, #0x10]
	adds r6, r2, #0
	ldr r2, [r1]
	adds r5, r3, #0
	cmp r2, #0
	bne _022355BA
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	ldr r2, [r4, #0x18]
	lsls r3, r6, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	ldr r2, [r4, #0x1c]
	lsrs r3, r3, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	ldr r2, [r4, #0x28]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x10]
	ldr r2, [r4, #0x2c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	bl ov74_0223547C
	adds r5, r0, #0
	b _022355E8
_022355BA:
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _022355CC
	adds r0, r1, #0
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201EEA8
_022355CC:
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _022355DE
	lsls r1, r5, #0x18
	ldr r0, [r4, #0x10]
	lsrs r1, r1, #0x18
	bl FUN_0201EEAC
_022355DE:
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	bl ov74_0223547C
	adds r5, r0, #0
_022355E8:
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _0223562E
	ldr r0, [r4]
	cmp r0, #0
	beq _022355FC
	cmp r0, #1
	beq _02235612
	cmp r0, #2
	b _02235628
_022355FC:
	ldr r2, [r4, #0x38]
	ldr r3, [r4, #0x3c]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x18
	ldr r0, [r4, #0x10]
	movs r1, #0
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0200E580
	b _0223562E
_02235612:
	ldr r2, [r4, #0x38]
	ldr r3, [r4, #0x3c]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x18
	ldr r0, [r4, #0x10]
	movs r1, #0
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0200E998
	b _0223562E
_02235628:
	ldr r0, [r4, #0x10]
	bl FUN_0201D578
_0223562E:
	adds r0, r5, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov74_02235568

	thumb_func_start ov74_02235634
ov74_02235634: @ 0x02235634
	ldr r1, [r0, #0x18]
	ldr r0, [r0, #0x1c]
	muls r0, r1, r0
	bx lr
	thumb_func_end ov74_02235634

	thumb_func_start ov74_0223563C
ov74_0223563C: @ 0x0223563C
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _02235674 @ =0x0223B710
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, _02235678 @ =0x0223D454
	movs r1, #0x10
	ldr r0, [r0, #8]
	str r0, [sp, #0xc]
	adds r0, r2, #0
	adds r2, r1, #0
	bl FUN_020215C0
	ldr r1, _02235678 @ =0x0223D454
	movs r0, #0x1e
	ldr r1, [r1, #8]
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_02235674: .4byte 0x0223B710
_02235678: .4byte 0x0223D454
	thumb_func_end ov74_0223563C

	thumb_func_start ov74_0223567C
ov74_0223567C: @ 0x0223567C
	ldr r0, _0223568C @ =0x0223D454
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _02235688
	movs r0, #1
	bx lr
_02235688:
	movs r0, #0
	bx lr
	.align 2, 0
_0223568C: .4byte 0x0223D454
	thumb_func_end ov74_0223567C

	thumb_func_start ov74_02235690
ov74_02235690: @ 0x02235690
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r6, _022356F8 @ =0x0223D454
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	ldr r2, _022356FC @ =0x0223D454
	str r3, [sp, #0xc]
	ldr r2, [r2, #8]
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	ldr r2, _022356FC @ =0x0223D454
	ldr r1, _02235700 @ =0x0223D48C
	ldr r2, [r2, #8]
	movs r0, #0x80
	bl FUN_02009F40
	ldr r1, _022356FC @ =0x0223D454
	movs r2, #1
	str r0, [r1, #0x34]
	ldr r0, _02235700 @ =0x0223D48C
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r1, #3
	movs r7, #0x16
	ldr r0, _02235704 @ =0x0223D654
	lsls r1, r1, #0x12
	str r1, [r0, #0x10]
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #4
_022356E0:
	ldr r2, [r6, #8]
	movs r0, #0x20
	adds r1, r4, #0
	bl FUN_0200A090
	str r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _022356E0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022356F8: .4byte 0x0223D454
_022356FC: .4byte 0x0223D454
_02235700: .4byte 0x0223D48C
_02235704: .4byte 0x0223D654
	thumb_func_end ov74_02235690

	thumb_func_start ov74_02235708
ov74_02235708: @ 0x02235708
	push {r4, lr}
	ldr r0, _02235720 @ =0x0223D454
	ldr r4, _02235724 @ =0x0223D454
	ldr r0, [r0, #0x34]
	cmp r0, #0
	bne _02235718
	bl FUN_0202551C
_02235718:
	adds r4, #0x34
	adds r0, r4, #0
	pop {r4, pc}
	nop
_02235720: .4byte 0x0223D454
_02235724: .4byte 0x0223D454
	thumb_func_end ov74_02235708

	thumb_func_start ov74_02235728
ov74_02235728: @ 0x02235728
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	ldr r4, [sp, #0x54]
	adds r6, r0, #0
	mov ip, r1
	str r2, [sp, #0x2c]
	str r3, [sp, #0x30]
	ldr r5, _02235894 @ =0x0223D454
	cmp r4, #0
	bne _02235740
	movs r7, #1
	b _02235742
_02235740:
	movs r7, #2
_02235742:
	movs r0, #1
	str r0, [sp, #0x34]
	cmp r6, #0x12
	bne _0223574E
	movs r0, #0
	str r0, [sp, #0x34]
_0223574E:
	movs r1, #0
	mvns r1, r1
	mov r0, ip
	cmp r0, r1
	beq _0223577C
	str r4, [sp]
	str r7, [sp, #4]
	ldr r0, [r5, #8]
	ldr r3, [sp, #0x34]
	str r0, [sp, #8]
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r6, #0
	mov r2, ip
	bl FUN_0200A1D8
	movs r1, #0x18
	muls r1, r4, r1
	adds r2, r5, r1
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r2, r1]
_0223577C:
	movs r1, #0
	ldr r0, [sp, #0x2c]
	mvns r1, r1
	cmp r0, r1
	beq _022357AE
	str r4, [sp]
	str r7, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	ldr r2, [sp, #0x2c]
	str r0, [sp, #0xc]
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x18
	muls r1, r4, r1
	adds r2, r5, r1
	movs r1, #0x5f
	lsls r1, r1, #2
	str r0, [r2, r1]
_022357AE:
	movs r1, #0
	ldr r0, [sp, #0x30]
	mvns r1, r1
	cmp r0, r1
	beq _022357DE
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	ldr r2, [sp, #0x30]
	str r0, [sp, #8]
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x34]
	adds r1, r6, #0
	bl FUN_0200A294
	movs r1, #0x18
	adds r2, r4, #0
	muls r2, r1, r2
	adds r2, r5, r2
	lsls r1, r1, #4
	str r0, [r2, r1]
_022357DE:
	movs r0, #0
	ldr r2, [sp, #0x50]
	mvns r0, r0
	cmp r2, r0
	beq _0223580C
	str r4, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	ldr r3, [sp, #0x34]
	str r0, [sp, #8]
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_0200A294
	movs r1, #0x18
	muls r1, r4, r1
	adds r2, r5, r1
	movs r1, #0x61
	lsls r1, r1, #2
	str r0, [r2, r1]
_0223580C:
	movs r0, #0x18
	adds r6, r4, #0
	muls r6, r0, r6
	movs r0, #0x5e
	adds r1, r5, r6
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_0200ACF0
	movs r0, #0x5f
	adds r1, r5, r6
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_0200B00C
	movs r0, #0
	movs r2, #0x16
	str r4, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsls r2, r2, #4
	ldr r1, [r5, r2]
	adds r3, r4, #0
	str r1, [sp, #0x14]
	adds r1, r2, #4
	ldr r1, [r5, r1]
	str r1, [sp, #0x18]
	adds r1, r2, #0
	adds r1, #8
	ldr r1, [r5, r1]
	str r1, [sp, #0x1c]
	adds r1, r2, #0
	adds r1, #0xc
	ldr r1, [r5, r1]
	adds r2, #0x48
	str r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	movs r0, #0x24
	adds r1, r5, r2
	muls r0, r4, r0
	adds r0, r1, r0
	adds r1, r4, #0
	adds r2, r4, #0
	bl FUN_02009D48
	cmp r4, #0
	bne _0223587E
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	b _02235886
_0223587E:
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
_02235886:
	ldr r0, _02235898 @ =ov74_02235A74
	movs r1, #0
	bl FUN_0201A0FC
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02235894: .4byte 0x0223D454
_02235898: .4byte ov74_02235A74
	thumb_func_end ov74_02235728

	thumb_func_start ov74_0223589C
ov74_0223589C: @ 0x0223589C
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _022358B4 @ =0x0223D48C
	adds r2, r4, #0
	bl FUN_02009FC8
	ldr r0, _022358B8 @ =0x0223D654
	str r4, [r0, #0x10]
	pop {r4, pc}
	nop
_022358B4: .4byte 0x0223D48C
_022358B8: .4byte 0x0223D654
	thumb_func_end ov74_0223589C

	thumb_func_start ov74_022358BC
ov74_022358BC: @ 0x022358BC
	ldr r3, _022358C4 @ =ov74_022358C8
	movs r0, #0
	bx r3
	nop
_022358C4: .4byte ov74_022358C8
	thumb_func_end ov74_022358BC

	thumb_func_start ov74_022358C8
ov74_022358C8: @ 0x022358C8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02235928 @ =0x0223D654
	ldr r4, _0223592C @ =0x0223D454
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0223591C
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _02235918
	subs r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_020248B8
	cmp r0, #0
	bne _022358FC
	cmp r5, #0
	bne _022358FC
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
_022358FC:
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020248AC
	movs r1, #6
	ldr r2, [r0, #4]
	lsls r1, r1, #0x12
	cmp r2, r1
	bge _0223591C
	lsrs r1, r1, #7
	adds r1, r2, r1
	str r1, [r0, #4]
	b _0223591C
_02235918:
	subs r1, r1, #1
	str r1, [r4, r0]
_0223591C:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _02235926
	bl FUN_0202457C
_02235926:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02235928: .4byte 0x0223D654
_0223592C: .4byte 0x0223D454
	thumb_func_end ov74_022358C8

	thumb_func_start ov74_02235930
ov74_02235930: @ 0x02235930
	push {r3, r4, r5, lr}
	sub sp, #0x30
	adds r4, r1, #0
	ldr r1, _022359B8 @ =0x0223D454
	bne _02235992
	ldr r4, [r1, #0x34]
	lsls r2, r2, #0xc
	str r4, [sp]
	movs r4, #0x6a
	lsls r4, r4, #2
	adds r5, r1, r4
	movs r4, #0x24
	muls r4, r0, r4
	adds r4, r5, r4
	str r4, [sp, #4]
	movs r4, #1
	lsls r4, r4, #0xc
	movs r5, #0
	str r5, [sp, #0x10]
	str r4, [sp, #0x14]
	str r4, [sp, #0x18]
	str r4, [sp, #0x1c]
	add r4, sp, #0
	strh r5, [r4, #0x20]
	str r2, [sp, #8]
	lsls r2, r3, #0xc
	str r2, [sp, #0xc]
	movs r2, #0xa
	str r2, [sp, #0x24]
	cmp r0, #0
	bne _02235972
	movs r2, #1
	b _02235974
_02235972:
	movs r2, #2
_02235974:
	ldr r0, [r1, #8]
	str r2, [sp, #0x28]
	str r0, [sp, #0x2c]
	cmp r2, #2
	bne _0223598A
	movs r0, #0x21
	lsls r0, r0, #4
	ldr r2, [sp, #0xc]
	ldr r0, [r1, r0]
	adds r0, r2, r0
	str r0, [sp, #0xc]
_0223598A:
	add r0, sp, #0
	bl FUN_02024624
	adds r4, r0, #0
_02235992:
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0202484C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_02024A04
	ldr r1, [sp, #0x40]
	adds r0, r4, #0
	bl FUN_020248F0
	adds r0, r4, #0
	movs r1, #1
	bl FUN_02024830
	adds r0, r4, #0
	add sp, #0x30
	pop {r3, r4, r5, pc}
	.align 2, 0
_022359B8: .4byte 0x0223D454
	thumb_func_end ov74_02235930

	thumb_func_start ov74_022359BC
ov74_022359BC: @ 0x022359BC
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02235A5C @ =0x0223D654
	ldr r4, _02235A60 @ =0x0223D454
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _022359DA
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024758
	movs r0, #0x82
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_022359DA:
	movs r1, #0x51
	ldr r0, _02235A64 @ =0x0223D488
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _022359EA
	bl FUN_0200AEB0
_022359EA:
	movs r1, #0x57
	ldr r0, _02235A64 @ =0x0223D488
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _022359FA
	bl FUN_0200AEB0
_022359FA:
	movs r1, #0x52
	ldr r0, _02235A64 @ =0x0223D488
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02235A0A
	bl FUN_0200B0A8
_02235A0A:
	movs r1, #0x16
	ldr r0, _02235A64 @ =0x0223D488
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02235A1A
	bl FUN_0200B0A8
_02235A1A:
	movs r4, #0
	movs r7, #0x4b
	ldr r5, _02235A64 @ =0x0223D488
	adds r6, r4, #0
	lsls r7, r7, #2
_02235A24:
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200A0D0
	str r6, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _02235A24
	ldr r0, _02235A64 @ =0x0223D488
	ldr r0, [r0]
	bl FUN_02024504
	ldr r0, _02235A64 @ =0x0223D488
	movs r1, #0
	str r1, [r0]
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02235A5C: .4byte 0x0223D654
_02235A60: .4byte 0x0223D454
_02235A64: .4byte 0x0223D488
	thumb_func_end ov74_022359BC

	thumb_func_start ov74_02235A68
ov74_02235A68: @ 0x02235A68
	movs r1, #1
	subs r0, #0xa
	lsls r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
	thumb_func_end ov74_02235A68

	thumb_func_start ov74_02235A74
ov74_02235A74: @ 0x02235A74
	push {r4, lr}
	ldr r0, _02235AB0 @ =0x0223E2D4
	ldr r4, _02235AB4 @ =0x0223D454
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _02235A8E
	ldr r1, _02235AB8 @ =0x00000EA4
	adds r0, r4, #0
	ldr r1, [r4, r1]
	blx r1
	ldr r0, _02235AB8 @ =0x00000EA4
	movs r1, #0
	str r1, [r4, r0]
_02235A8E:
	bl FUN_0202061C
	bl FUN_0200B224
	ldr r0, [r4]
	cmp r0, #0
	beq _02235AA0
	bl FUN_0201EEB4
_02235AA0:
	ldr r3, _02235ABC @ =0x027E0000
	ldr r1, _02235AC0 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_02235AB0: .4byte 0x0223E2D4
_02235AB4: .4byte 0x0223D454
_02235AB8: .4byte 0x00000EA4
_02235ABC: .4byte 0x027E0000
_02235AC0: .4byte 0x00003FF8
	thumb_func_end ov74_02235A74

	thumb_func_start ov74_02235AC4
ov74_02235AC4: @ 0x02235AC4
	push {r4}
	sub sp, #0x24
	ldr r4, _02235B10 @ =0x0223B73C
	add r3, sp, #0
	movs r2, #0x22
_02235ACE:
	ldrb r1, [r4]
	adds r4, r4, #1
	strb r1, [r3]
	adds r3, r3, #1
	subs r2, r2, #1
	bne _02235ACE
	add r1, sp, #0
	ldrb r2, [r1]
	movs r3, #0
	subs r1, r3, #1
	cmp r2, r1
	beq _02235B08
	add r4, sp, #0
	subs r1, r3, #1
_02235AEA:
	ldrb r2, [r4]
	cmp r0, r2
	bne _02235AFE
	add r0, sp, #0
	lsls r1, r3, #1
	adds r0, #1
	add sp, #0x24
	ldrb r0, [r0, r1]
	pop {r4}
	bx lr
_02235AFE:
	adds r4, r4, #2
	ldrb r2, [r4]
	adds r3, r3, #1
	cmp r2, r1
	bne _02235AEA
_02235B08:
	movs r0, #0
	add sp, #0x24
	pop {r4}
	bx lr
	.align 2, 0
_02235B10: .4byte 0x0223B73C
	thumb_func_end ov74_02235AC4

	thumb_func_start ov74_02235B14
ov74_02235B14: @ 0x02235B14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r1, #0
	str r0, [sp, #0x20]
	adds r0, r6, #0
	adds r5, r2, #0
	adds r7, r3, #0
	ldr r4, [sp, #0x44]
	bl FUN_0206FF88
	str r0, [sp, #0x24]
	adds r0, r6, #0
	bl FUN_0207003C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r0, r7, #0x18
	ldr r2, [sp, #0x24]
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0
	lsls r1, r5, #0x10
	lsls r2, r2, #0x18
	str r0, [sp, #8]
	adds r0, r4, #0
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x18
	movs r3, #2
	bl FUN_020701E4
	movs r1, #0
	adds r0, r6, #0
	adds r2, r1, #0
	bl FUN_0206E540
	movs r3, #0
	str r3, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [sp, #0x40]
	ldr r2, _02235BCC @ =0x0223D454
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	movs r0, #2
	str r0, [sp, #0x18]
	str r5, [sp, #0x1c]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	ldr r2, [r2, #8]
	bl FUN_02014494
	movs r1, #0x32
	ldr r0, [sp, #0x40]
	lsls r1, r1, #6
	blx FUN_020D2894
	ldr r0, [sp, #0x20]
	bl FUN_02024B1C
	movs r1, #2
	blx FUN_020B802C
	movs r2, #0x32
	adds r1, r0, #0
	lsls r2, r2, #6
	ldr r0, [sp, #0x40]
	adds r1, r1, r2
	blx FUN_020CFECC
	ldr r0, [sp, #0x20]
	bl FUN_02024B34
	movs r1, #2
	blx FUN_020B8078
	adds r3, r0, #0
	movs r0, #0x20
	str r0, [sp]
	ldr r0, _02235BCC @ =0x0223D454
	movs r2, #5
	ldr r0, [r0, #8]
	adds r3, #0x60
	str r0, [sp, #4]
	ldrh r0, [r4]
	ldrh r1, [r4, #4]
	bl FUN_02007938
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02235BCC: .4byte 0x0223D454
	thumb_func_end ov74_02235B14

	thumb_func_start ov74_02235BD0
ov74_02235BD0: @ 0x02235BD0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x25
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0x27
	movs r2, #0x24
	movs r3, #0x26
	bl ov74_02235728
	movs r1, #1
	movs r0, #0
	lsls r1, r1, #0x14
	bl ov74_0223589C
	movs r3, #0
	movs r1, #0x82
	str r3, [sp]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	movs r0, #1
	movs r2, #0x80
	bl ov74_02235930
	movs r1, #0x82
	lsls r1, r1, #2
	str r0, [r4, r1]
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov74_02235BD0

	thumb_func_start ov74_02235C10
ov74_02235C10: @ 0x02235C10
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0xc
	str r0, [sp]
	movs r0, #1
	adds r4, r1, #0
	adds r6, r2, #0
	str r0, [sp, #4]
	movs r0, #0x34
	movs r1, #0xa
	movs r2, #0
	movs r3, #0xb
	bl ov74_02235728
	movs r1, #1
	movs r0, #0
	lsls r1, r1, #0x14
	bl ov74_0223589C
	movs r0, #1
	movs r1, #0x82
	str r0, [sp]
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	movs r2, #0x80
	movs r3, #0
	bl ov74_02235930
	movs r2, #0x82
	lsls r2, r2, #2
	adds r6, #8
	str r0, [r5, r2]
	cmp r4, #7
	bgt _02235C68
	cmp r4, #1
	blt _02235CDA
	beq _02235C6C
	cmp r4, #2
	beq _02235CA2
	cmp r4, #7
	beq _02235CC0
	add sp, #8
	pop {r4, r5, r6, pc}
_02235C68:
	cmp r4, #0xd
	bne _02235CDA
_02235C6C:
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x85
	lsls r1, r1, #2
	adds r3, r0, #0
	adds r0, r5, r1
	str r0, [sp]
	ldr r0, _02235CE0 @ =0x00000E94
	subs r1, #0xc
	adds r0, r5, r0
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov74_02235B14
	add sp, #8
	pop {r4, r5, r6, pc}
_02235CA2:
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r5, r0
	str r0, [sp]
	ldr r0, _02235CE0 @ =0x00000E94
	adds r1, r6, #0
	adds r0, r5, r0
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	subs r2, #0x1a
	movs r3, #0
	bl ov74_02235B14
	add sp, #8
	pop {r4, r5, r6, pc}
_02235CC0:
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r5, r0
	str r0, [sp]
	ldr r0, _02235CE0 @ =0x00000E94
	adds r1, r6, #0
	adds r0, r5, r0
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	subs r2, #0x1a
	movs r3, #1
	bl ov74_02235B14
_02235CDA:
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02235CE0: .4byte 0x00000E94
	thumb_func_end ov74_02235C10

	thumb_func_start ov74_02235CE4
ov74_02235CE4: @ 0x02235CE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	cmp r1, #0xf
	bhi _02235D36
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02235CFA: @ jump table
	.2byte _02235D36 - _02235CFA - 2 @ case 0
	.2byte _02235D36 - _02235CFA - 2 @ case 1
	.2byte _02235D36 - _02235CFA - 2 @ case 2
	.2byte _02235D1A - _02235CFA - 2 @ case 3
	.2byte _02235D36 - _02235CFA - 2 @ case 4
	.2byte _02235D36 - _02235CFA - 2 @ case 5
	.2byte _02235D36 - _02235CFA - 2 @ case 6
	.2byte _02235D36 - _02235CFA - 2 @ case 7
	.2byte _02235D1E - _02235CFA - 2 @ case 8
	.2byte _02235D22 - _02235CFA - 2 @ case 9
	.2byte _02235D28 - _02235CFA - 2 @ case 10
	.2byte _02235D36 - _02235CFA - 2 @ case 11
	.2byte _02235D2C - _02235CFA - 2 @ case 12
	.2byte _02235D36 - _02235CFA - 2 @ case 13
	.2byte _02235D30 - _02235CFA - 2 @ case 14
	.2byte _02235D34 - _02235CFA - 2 @ case 15
_02235D1A:
	ldr r4, [r2, #4]
	b _02235D36
_02235D1E:
	ldr r4, _02235D90 @ =0x000001C6
	b _02235D36
_02235D22:
	movs r4, #0x71
	lsls r4, r4, #2
	b _02235D36
_02235D28:
	ldr r4, _02235D94 @ =0x000001C7
	b _02235D36
_02235D2C:
	ldr r4, _02235D98 @ =0x000001D3
	b _02235D36
_02235D30:
	ldr r4, _02235D9C @ =0x000001BA
	b _02235D36
_02235D34:
	ldr r4, _02235DA0 @ =0x000001F5
_02235D36:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl FUN_02077C18
	adds r7, r0, #0
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	movs r1, #2
	bl FUN_02077C18
	adds r4, r0, #0
	bl FUN_02077CE0
	adds r6, r0, #0
	bl FUN_02077CE4
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x12
	adds r1, r7, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov74_02235728
	movs r1, #1
	movs r0, #0
	lsls r1, r1, #0x14
	bl ov74_0223589C
	movs r3, #0
	movs r1, #0x82
	str r3, [sp]
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	movs r0, #1
	movs r2, #0x80
	bl ov74_02235930
	movs r1, #0x82
	lsls r1, r1, #2
	str r0, [r5, r1]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02235D90: .4byte 0x000001C6
_02235D94: .4byte 0x000001C7
_02235D98: .4byte 0x000001D3
_02235D9C: .4byte 0x000001BA
_02235DA0: .4byte 0x000001F5
	thumb_func_end ov74_02235CE4

	thumb_func_start ov74_02235DA4
ov74_02235DA4: @ 0x02235DA4
	push {r3, lr}
	sub sp, #8
	movs r1, #0xc0
	str r1, [sp]
	ldr r0, [r0, #8]
	movs r2, #4
	adds r3, r2, #0
	str r0, [sp, #4]
	movs r0, #0x71
	movs r1, #0x21
	adds r3, #0xfc
	bl FUN_02007938
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_02235DA4

	thumb_func_start ov74_02235DC4
ov74_02235DC4: @ 0x02235DC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r1, #0
	ldrh r4, [r6]
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov74_02235AC4
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #5
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _02235EC0 @ =0x0223D454
	movs r1, #0x22
	ldr r0, [r0, #8]
	adds r2, r5, #0
	str r0, [sp, #0xc]
	movs r0, #0x71
	movs r3, #5
	bl FUN_020078F0
	movs r2, #1
	ldr r3, _02235EC0 @ =0x0223D454
	str r2, [sp]
	ldr r3, [r3, #8]
	movs r0, #0x71
	movs r1, #0x23
	bl FUN_02007A44
	add r1, sp, #0x14
	str r0, [sp, #0x10]
	blx FUN_020B71D8
	ldr r2, [sp, #0x14]
	movs r3, #6
	adds r0, r5, #0
	movs r1, #5
	adds r2, #0xc
	lsls r3, r3, #8
	bl FUN_0201C0A8
	ldr r0, [sp, #0x10]
	bl FUN_0201AB0C
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	movs r2, #0
	adds r7, #8
	str r0, [sp, #4]
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0201CA4C
	adds r0, r5, #0
	movs r1, #5
	bl FUN_0201EFBC
	ldr r1, _02235EC4 @ =ov74_02235DA4
	ldr r0, _02235EC8 @ =0x0223E2D4
	cmp r4, #0xf
	str r1, [r0, #0x24]
	ldr r0, _02235EC0 @ =0x0223D454
	str r5, [r0]
	bhi _02235EAE
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02235E62: @ jump table
	.2byte _02235EAE - _02235E62 - 2 @ case 0
	.2byte _02235E98 - _02235E62 - 2 @ case 1
	.2byte _02235E98 - _02235E62 - 2 @ case 2
	.2byte _02235EA4 - _02235E62 - 2 @ case 3
	.2byte _02235E82 - _02235E62 - 2 @ case 4
	.2byte _02235E82 - _02235E62 - 2 @ case 5
	.2byte _02235E82 - _02235E62 - 2 @ case 6
	.2byte _02235E8E - _02235E62 - 2 @ case 7
	.2byte _02235EA4 - _02235E62 - 2 @ case 8
	.2byte _02235EA4 - _02235E62 - 2 @ case 9
	.2byte _02235EA4 - _02235E62 - 2 @ case 10
	.2byte _02235E82 - _02235E62 - 2 @ case 11
	.2byte _02235EA4 - _02235E62 - 2 @ case 12
	.2byte _02235E98 - _02235E62 - 2 @ case 13
	.2byte _02235EA4 - _02235E62 - 2 @ case 14
	.2byte _02235EA4 - _02235E62 - 2 @ case 15
_02235E82:
	ldr r0, _02235ECC @ =0x0223D454
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov74_02235BD0
	b _02235EAE
_02235E8E:
	movs r1, #0x83
	ldr r0, _02235ECC @ =0x0223D454
	movs r2, #0x78
	lsls r1, r1, #2
	str r2, [r0, r1]
_02235E98:
	ldr r0, _02235ECC @ =0x0223D454
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov74_02235C10
	b _02235EAE
_02235EA4:
	ldr r0, _02235ECC @ =0x0223D454
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov74_02235CE4
_02235EAE:
	movs r1, #0x82
	ldr r0, _02235ECC @ =0x0223D454
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_02024830
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02235EC0: .4byte 0x0223D454
_02235EC4: .4byte ov74_02235DA4
_02235EC8: .4byte 0x0223E2D4
_02235ECC: .4byte 0x0223D454
	thumb_func_end ov74_02235DC4

	thumb_func_start ov74_02235ED0
ov74_02235ED0: @ 0x02235ED0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r1, #0
	movs r1, #2
	adds r5, r0, #0
	adds r0, r2, #0
	lsls r1, r1, #8
	str r2, [sp]
	bl FUN_0201AA8C
	ldr r1, _02235F50 @ =0x0000A001
	adds r4, r0, #0
	blx FUN_020E389C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x50
	blx FUN_020E3A04
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_0201AB0C
	add r0, sp, #4
	blx FUN_020D3C40
	add r0, sp, #4
	ldrh r1, [r0, #2]
	movs r2, #0
	add r3, sp, #4
	strh r1, [r0, #6]
	ldr r1, _02235F54 @ =0x0000D679
	strh r6, [r0, #2]
_02235F12:
	ldrh r0, [r3]
	adds r2, r2, #1
	eors r0, r1
	strh r0, [r3]
	ldrh r1, [r3]
	adds r3, r3, #2
	cmp r2, #4
	blt _02235F12
	movs r1, #0x41
	ldr r0, [sp]
	lsls r1, r1, #2
	bl FUN_0201AA8C
	add r1, sp, #4
	movs r2, #8
	adds r4, r0, #0
	blx FUN_020A0598
	adds r5, #0x50
	movs r2, #0xd6
	adds r0, r4, #0
	adds r1, r5, #0
	lsls r2, r2, #2
	adds r3, r7, #0
	blx ov74_0223706C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02235F50: .4byte 0x0000A001
_02235F54: .4byte 0x0000D679
	thumb_func_end ov74_02235ED0

	thumb_func_start ov74_02235F58
ov74_02235F58: @ 0x02235F58
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r1, #0
	movs r1, #2
	adds r5, r0, #0
	adds r0, r2, #0
	lsls r1, r1, #8
	str r2, [sp]
	bl FUN_0201AA8C
	ldr r1, _02235FF0 @ =0x0000A001
	adds r4, r0, #0
	blx FUN_020E389C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x50
	blx FUN_020E3A04
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	bl FUN_02035754
	ldrb r2, [r0, #4]
	add r1, sp, #4
	movs r3, #0
	strb r2, [r1]
	ldrb r2, [r0, #5]
	strb r2, [r1, #1]
	ldrb r2, [r0, #6]
	strb r2, [r1, #2]
	ldrb r2, [r0, #7]
	strb r2, [r1, #3]
	ldrb r2, [r0, #8]
	strb r2, [r1, #4]
	ldrb r0, [r0, #9]
	strb r0, [r1, #5]
	add r0, sp, #4
	ldrh r2, [r0, #2]
	strh r2, [r0, #6]
	ldr r2, _02235FF4 @ =0x0000D679
	strh r6, [r0, #2]
_02235FB2:
	ldrh r0, [r1]
	adds r3, r3, #1
	eors r0, r2
	strh r0, [r1]
	ldrh r2, [r1]
	adds r1, r1, #2
	cmp r3, #4
	blt _02235FB2
	movs r1, #0x41
	ldr r0, [sp]
	lsls r1, r1, #2
	bl FUN_0201AA8C
	add r1, sp, #4
	movs r2, #8
	adds r4, r0, #0
	blx FUN_020A0598
	adds r5, #0x50
	movs r2, #0xd6
	adds r0, r4, #0
	adds r1, r5, #0
	lsls r2, r2, #2
	adds r3, r7, #0
	blx ov74_0223706C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02235FF0: .4byte 0x0000A001
_02235FF4: .4byte 0x0000D679
	thumb_func_end ov74_02235F58

	thumb_func_start ov74_02235FF8
ov74_02235FF8: @ 0x02235FF8
	push {r3, lr}
	cmp r2, #0
	beq _02236002
	cmp r2, #1
	pop {r3, pc}
_02236002:
	ldr r0, _0223600C @ =0x000005DC
	bl FUN_0200604C
	pop {r3, pc}
	nop
_0223600C: .4byte 0x000005DC
	thumb_func_end ov74_02235FF8

	thumb_func_start ov74_02236010
ov74_02236010: @ 0x02236010
	push {r3, lr}
	ldr r0, _02236030 @ =0x027FFFA8
	ldrh r1, [r0]
	movs r0, #2
	lsls r0, r0, #0xe
	ands r0, r1
	asrs r0, r0, #0xf
	bne _0223602C
	blx FUN_020E0FF0
	cmp r0, #0
	bne _0223602C
	blx FUN_020E1A14
_0223602C:
	pop {r3, pc}
	nop
_02236030: .4byte 0x027FFFA8
	thumb_func_end ov74_02236010

	thumb_func_start ov74_02236034
ov74_02236034: @ 0x02236034
	push {r3, lr}
	cmp r0, #1
	bne _0223605C
	ldr r1, _02236068 @ =0x04000208
	ldrh r0, [r1]
	movs r0, #0
	strh r0, [r1]
	lsrs r0, r1, #0xd
	ldr r1, _0223606C @ =ov74_02236010
	blx FUN_020D1004
	movs r0, #2
	lsls r0, r0, #0xc
	blx FUN_020D11D4
	ldr r1, _02236068 @ =0x04000208
	ldrh r0, [r1]
	movs r0, #1
	strh r0, [r1]
	pop {r3, pc}
_0223605C:
	movs r0, #2
	lsls r0, r0, #0xc
	blx FUN_020D1204
	pop {r3, pc}
	nop
_02236068: .4byte 0x04000208
_0223606C: .4byte ov74_02236010
	thumb_func_end ov74_02236034

	thumb_func_start ov74_02236070
ov74_02236070: @ 0x02236070
	bx lr
	.align 2, 0
	thumb_func_end ov74_02236070

	thumb_func_start ov74_02236074
ov74_02236074: @ 0x02236074
	push {r3, lr}
	ldr r1, _02236098 @ =0x04000208
	ldrh r0, [r1]
	movs r0, #0
	strh r0, [r1]
	lsrs r0, r1, #0xd
	ldr r1, _0223609C @ =ov74_02236070
	blx FUN_020D1004
	movs r0, #2
	lsls r0, r0, #0xc
	blx FUN_020D11D4
	ldr r1, _02236098 @ =0x04000208
	ldrh r0, [r1]
	movs r0, #1
	strh r0, [r1]
	pop {r3, pc}
	.align 2, 0
_02236098: .4byte 0x04000208
_0223609C: .4byte ov74_02236070
	thumb_func_end ov74_02236074

	thumb_func_start ov74_022360A0
ov74_022360A0: @ 0x022360A0
	ldr r1, _022360AC @ =0x0223D454
	str r0, [r1, #0x18]
	movs r0, #0
	str r0, [r1, #0x14]
	bx lr
	nop
_022360AC: .4byte 0x0223D454
	thumb_func_end ov74_022360A0

	thumb_func_start ov74_022360B0
ov74_022360B0: @ 0x022360B0
	push {r3, r4, r5, lr}
	ldr r0, _02236120 @ =0x0223D454
	ldr r4, _02236124 @ =0x0223D454
	ldr r0, [r0, #0x14]
	cmp r0, #4
	bhi _0223611C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022360C8: @ jump table
	.2byte _022360D2 - _022360C8 - 2 @ case 0
	.2byte _022360E8 - _022360C8 - 2 @ case 1
	.2byte _0223611C - _022360C8 - 2 @ case 2
	.2byte _0223611C - _022360C8 - 2 @ case 3
	.2byte _0223611C - _022360C8 - 2 @ case 4
_022360D2:
	movs r0, #4
	bl FUN_0201A728
	ldr r0, [r4, #0x18]
	movs r1, #2
	bl FUN_02027550
	ldr r0, [r4, #0x14]
	adds r0, r0, #1
	str r0, [r4, #0x14]
	b _0223611C
_022360E8:
	ldr r0, [r4, #0x18]
	bl FUN_02027564
	adds r5, r0, #0
	cmp r5, #3
	bne _022360FA
	movs r0, #3
	str r0, [r4, #0x14]
	b _0223610C
_022360FA:
	cmp r5, #2
	bne _02236104
	movs r0, #2
	str r0, [r4, #0x14]
	b _0223610C
_02236104:
	cmp r5, #1
	bne _0223610C
	movs r0, #4
	str r0, [r4, #0x14]
_0223610C:
	subs r0, r5, #2
	cmp r0, #1
	bhi _02236118
	movs r0, #4
	bl FUN_0201A738
_02236118:
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
_0223611C:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02236120: .4byte 0x0223D454
_02236124: .4byte 0x0223D454
	thumb_func_end ov74_022360B0

	thumb_func_start ov74_02236128
ov74_02236128: @ 0x02236128
	ldr r0, _02236138 @ =0x0223D454
	ldr r1, _0223613C @ =0x0223D454
	ldr r0, [r0, #0x14]
	cmp r0, #4
	bne _02236136
	movs r0, #1
	str r0, [r1, #0x14]
_02236136:
	bx lr
	.align 2, 0
_02236138: .4byte 0x0223D454
_0223613C: .4byte 0x0223D454
	thumb_func_end ov74_02236128

	thumb_func_start ov74_02236140
ov74_02236140: @ 0x02236140
	push {r3, lr}
	ldr r0, _02236158 @ =0x0223D454
	ldr r0, [r0, #0x18]
	bl FUN_020275A4
	ldr r0, _02236158 @ =0x0223D454
	movs r1, #3
	str r1, [r0, #0x14]
	movs r0, #4
	bl FUN_0201A738
	pop {r3, pc}
	.align 2, 0
_02236158: .4byte 0x0223D454
	thumb_func_end ov74_02236140

	thumb_func_start ov74_0223615C
ov74_0223615C: @ 0x0223615C
	ldr r0, _02236164 @ =0x0223D454
	ldr r0, [r0, #0x14]
	bx lr
	nop
_02236164: .4byte 0x0223D454
	thumb_func_end ov74_0223615C

	thumb_func_start ov74_02236168
ov74_02236168: @ 0x02236168
	push {r4, lr}
	ldr r1, _022361A4 @ =0x0223E2FC
	adds r4, r0, #0
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _02236184
	ldr r3, [r1]
	ldr r1, _022361A8 @ =0x00001150
	ldr r0, _022361AC @ =0x0223D00C
	ldr r1, [r3, r1]
	lsls r3, r1, #2
	ldr r1, _022361B0 @ =0x0223CFE4
	ldr r1, [r1, r3]
	blx r2
_02236184:
	ldr r3, _022361A4 @ =0x0223E2FC
	ldr r1, _022361A8 @ =0x00001150
	ldr r0, [r3]
	str r4, [r0, r1]
	ldr r2, [r3, #4]
	cmp r2, #0
	beq _022361A0
	ldr r3, [r3]
	ldr r0, _022361B4 @ =0x0223D014
	ldr r1, [r3, r1]
	lsls r3, r1, #2
	ldr r1, _022361B0 @ =0x0223CFE4
	ldr r1, [r1, r3]
	blx r2
_022361A0:
	pop {r4, pc}
	nop
_022361A4: .4byte 0x0223E2FC
_022361A8: .4byte 0x00001150
_022361AC: .4byte 0x0223D00C
_022361B0: .4byte 0x0223CFE4
_022361B4: .4byte 0x0223D014
	thumb_func_end ov74_02236168

	thumb_func_start ov74_022361B8
ov74_022361B8: @ 0x022361B8
	ldr r1, _022361CC @ =0x0223E2FC
	ldr r3, [r1]
	ldr r1, _022361D0 @ =0x00001150
	ldr r2, [r3, r1]
	subs r2, #9
	cmp r2, #1
	bls _022361CA
	adds r1, r1, #4
	str r0, [r3, r1]
_022361CA:
	bx lr
	.align 2, 0
_022361CC: .4byte 0x0223E2FC
_022361D0: .4byte 0x00001150
	thumb_func_end ov74_022361B8

	thumb_func_start ov74_022361D4
ov74_022361D4: @ 0x022361D4
	push {r4, lr}
	ldr r0, _02236240 @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _02236244 @ =0x00001150
	ldr r0, [r1, r0]
	cmp r0, #4
	bne _022361E6
	blx FUN_020D3F48
_022361E6:
	movs r0, #2
	bl ov74_02236168
	ldr r3, _02236240 @ =0x0223E2FC
	ldr r0, _02236248 @ =0x0000FFFF
	ldr r2, [r3]
	ldr r1, _0223624C @ =0x00000FCC
	strh r0, [r2, r1]
	subs r2, r1, #2
	ldr r4, [r3]
	subs r1, r1, #4
	strh r0, [r4, r2]
	ldr r2, [r3]
	strh r0, [r2, r1]
	bl ov74_02236258
	cmp r0, #0
	bne _02236224
	movs r0, #9
	bl ov74_02236168
	ldr r0, _02236240 @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _02236250 @ =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02236220
	movs r0, #4
	blx r1
_02236220:
	movs r0, #0
	pop {r4, pc}
_02236224:
	ldr r1, _02236240 @ =0x0223E2FC
	ldr r0, _02236254 @ =0x00001158
	ldr r2, [r1]
	movs r3, #2
	strh r3, [r2, r0]
	ldr r1, [r1]
	adds r0, #0x24
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _0223623C
	movs r0, #0
	blx r1
_0223623C:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_02236240: .4byte 0x0223E2FC
_02236244: .4byte 0x00001150
_02236248: .4byte 0x0000FFFF
_0223624C: .4byte 0x00000FCC
_02236250: .4byte 0x0000117C
_02236254: .4byte 0x00001158
	thumb_func_end ov74_022361D4

	thumb_func_start ov74_02236258
ov74_02236258: @ 0x02236258
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02236330 @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _02236334 @ =0x00001150
	ldr r0, [r1, r0]
	cmp r0, #2
	beq _0223626C
	blx FUN_020D3F48
	movs r0, #0
_0223626C:
	blx FUN_020DEF24
	adds r4, r0, #0
	movs r0, #2
	lsls r0, r0, #0xe
	cmp r4, r0
	bne _02236284
	movs r0, #3
	bl ov74_022361B8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02236284:
	cmp r4, #0
	bne _02236292
	movs r0, #0x16
	bl ov74_022361B8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02236292:
	ldr r0, _02236330 @ =0x0223E2FC
	ldr r2, [r0]
	ldr r0, _02236338 @ =0x00001176
	ldrh r1, [r2, r0]
	cmp r1, #0x10
	blo _022362D4
	subs r1, #0x10
	movs r5, #0
	movs r7, #0xd
	movs r6, #1
	b _022362BA
_022362A8:
	adds r0, r1, #1
	adds r1, r7, #0
	blx FUN_020F2998
	adds r0, r6, #0
	lsls r0, r1
	tst r0, r4
	bne _022362BE
	adds r5, r5, #1
_022362BA:
	cmp r5, #0xd
	blt _022362A8
_022362BE:
	ldr r2, _02236330 @ =0x0223E2FC
	adds r4, r1, #0
	ldr r3, [r2]
	ldr r0, _02236338 @ =0x00001176
	adds r4, #0x10
	strh r4, [r3, r0]
	adds r3, r1, #1
	ldr r1, [r2]
	ldr r0, _0223633C @ =0x00000FC4
	strh r3, [r1, r0]
	b _022362D8
_022362D4:
	ldr r0, _0223633C @ =0x00000FC4
	strh r1, [r2, r0]
_022362D8:
	ldr r2, _02236330 @ =0x0223E2FC
	ldr r0, _02236340 @ =0x00000FC6
	ldr r1, [r2]
	movs r3, #0xdc
	strh r3, [r1, r0]
	adds r1, r0, #0
	ldr r3, [r2]
	subs r1, #0xc6
	adds r1, r3, r1
	subs r0, r0, #6
	str r1, [r3, r0]
	ldr r1, [r2]
	ldr r0, _02236344 @ =0x00001158
	ldrh r0, [r1, r0]
	cmp r0, #3
	bne _0223630E
	movs r5, #0
	ldr r0, _02236348 @ =0x00001170
	ldr r1, _0223634C @ =0x00000FC8
	b _0223630A
_02236300:
	ldr r3, [r2]
	adds r4, r3, r5
	ldrb r3, [r4, r0]
	adds r5, r5, #1
	strb r3, [r4, r1]
_0223630A:
	cmp r5, #6
	blt _02236300
_0223630E:
	ldr r1, _02236330 @ =0x0223E2FC
	ldr r0, _02236350 @ =ov74_02236354
	ldr r2, [r1]
	movs r1, #0x3f
	lsls r1, r1, #6
	adds r1, r2, r1
	blx FUN_020DF6D0
	cmp r0, #2
	beq _0223632A
	bl ov74_022361B8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0223632A:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02236330: .4byte 0x0223E2FC
_02236334: .4byte 0x00001150
_02236338: .4byte 0x00001176
_0223633C: .4byte 0x00000FC4
_02236340: .4byte 0x00000FC6
_02236344: .4byte 0x00001158
_02236348: .4byte 0x00001170
_0223634C: .4byte 0x00000FC8
_02236350: .4byte ov74_02236354
	thumb_func_end ov74_02236258

	thumb_func_start ov74_02236354
ov74_02236354: @ 0x02236354
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0223637A
	bl ov74_022361B8
	movs r0, #9
	bl ov74_02236168
	ldr r0, _02236468 @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _0223646C @ =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02236466
	movs r0, #4
	blx r1
	pop {r3, r4, r5, pc}
_0223637A:
	ldr r0, _02236468 @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _02236470 @ =0x00001150
	ldr r0, [r1, r0]
	cmp r0, #2
	beq _022363A6
	bl ov74_0223648C
	cmp r0, #0
	bne _02236466
	movs r0, #9
	bl ov74_02236168
	ldr r0, _02236468 @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _0223646C @ =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02236466
	movs r0, #4
	blx r1
	pop {r3, r4, r5, pc}
_022363A6:
	ldrh r0, [r4, #8]
	cmp r0, #3
	beq _02236466
	cmp r0, #4
	beq _02236448
	cmp r0, #5
	bne _02236448
	movs r0, #0xf
	lsls r0, r0, #8
	adds r0, r1, r0
	movs r1, #0xc0
	blx FUN_020D285C
	ldrh r0, [r4, #0x36]
	cmp r0, #8
	blo _022363CE
	ldr r1, [r4, #0x3c]
	ldr r0, _02236474 @ =0x00400318
	cmp r1, r0
	beq _022363E0
_022363CE:
	ldr r0, _02236468 @ =0x0223E2FC
	ldr r3, [r0, #4]
	cmp r3, #0
	beq _02236448
	ldr r0, _02236478 @ =0x0223D018
	ldr r1, [r4, #0x3c]
	ldr r2, _02236474 @ =0x00400318
	blx r3
	b _02236448
_022363E0:
	ldr r1, _02236468 @ =0x0223E2FC
	ldrh r3, [r4, #0x12]
	ldr r2, [r1]
	ldr r0, _0223647C @ =0x0000116C
	str r3, [r2, r0]
	ldr r1, [r1]
	subs r0, #0x14
	ldrh r0, [r1, r0]
	cmp r0, #2
	bne _0223642C
	adds r0, r4, #0
	adds r0, #0x48
	bl ov74_022366E8
	ldr r2, _02236468 @ =0x0223E2FC
	ldr r1, _02236480 @ =0x00001170
	movs r0, #0
_02236402:
	adds r3, r4, r0
	ldrb r5, [r3, #0xa]
	ldr r3, [r2]
	adds r3, r3, r0
	adds r0, r0, #1
	strb r5, [r3, r1]
	cmp r0, #6
	blt _02236402
	ldr r1, _02236468 @ =0x0223E2FC
	ldr r0, _02236484 @ =0x00001176
	ldr r3, [r1]
	ldrh r2, [r3, r0]
	subs r2, #0xf
	strh r2, [r3, r0]
	ldr r1, [r1]
	adds r0, r0, #6
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _0223642C
	movs r0, #1
	blx r1
_0223642C:
	adds r4, #0x48
	adds r0, r4, #0
	bl ov74_02236768
	cmp r0, #0
	beq _02236448
	ldr r0, _02236468 @ =0x0223E2FC
	movs r2, #4
	ldr r1, [r0]
	ldr r0, _02236488 @ =0x00001158
	strh r2, [r1, r0]
	bl ov74_022365FC
	pop {r3, r4, r5, pc}
_02236448:
	bl ov74_02236258
	cmp r0, #0
	bne _02236466
	movs r0, #9
	bl ov74_02236168
	ldr r0, _02236468 @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _0223646C @ =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02236466
	movs r0, #4
	blx r1
_02236466:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02236468: .4byte 0x0223E2FC
_0223646C: .4byte 0x0000117C
_02236470: .4byte 0x00001150
_02236474: .4byte 0x00400318
_02236478: .4byte 0x0223D018
_0223647C: .4byte 0x0000116C
_02236480: .4byte 0x00001170
_02236484: .4byte 0x00001176
_02236488: .4byte 0x00001158
	thumb_func_end ov74_02236354

	thumb_func_start ov74_0223648C
ov74_0223648C: @ 0x0223648C
	push {r3, lr}
	ldr r0, _022364A4 @ =ov74_022364A8
	blx FUN_020DF90C
	cmp r0, #2
	beq _022364A0
	bl ov74_022361B8
	movs r0, #0
	pop {r3, pc}
_022364A0:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_022364A4: .4byte ov74_022364A8
	thumb_func_end ov74_0223648C

	thumb_func_start ov74_022364A8
ov74_022364A8: @ 0x022364A8
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _022364B6
	bl ov74_022361B8
	pop {r3, pc}
_022364B6:
	movs r0, #1
	bl ov74_02236168
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov74_022364A8

	thumb_func_start ov74_022364C0
ov74_022364C0: @ 0x022364C0
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _022364D0
	movs r0, #0xa
	bl ov74_02236168
	pop {r3, pc}
_022364D0:
	movs r0, #0
	bl ov74_02236168
	ldr r0, _022364E8 @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _022364EC @ =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _022364E6
	movs r0, #3
	blx r1
_022364E6:
	pop {r3, pc}
	.align 2, 0
_022364E8: .4byte 0x0223E2FC
_022364EC: .4byte 0x0000117C
	thumb_func_end ov74_022364C0

	thumb_func_start ov74_022364F0
ov74_022364F0: @ 0x022364F0
	push {r3, lr}
	ldr r0, _0223650C @ =0x0223E2FC
	movs r2, #0
	ldr r1, [r0]
	ldr r0, _02236510 @ =0x00001154
	str r2, [r1, r0]
	bl ov74_0223653C
	cmp r0, #0
	beq _02236508
	movs r0, #1
	pop {r3, pc}
_02236508:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_0223650C: .4byte 0x0223E2FC
_02236510: .4byte 0x00001154
	thumb_func_end ov74_022364F0

	thumb_func_start ov74_02236514
ov74_02236514: @ 0x02236514
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #8
	bne _02236532
	movs r0, #9
	bl ov74_02236168
	ldr r0, _02236534 @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _02236538 @ =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02236532
	movs r0, #4
	blx r1
_02236532:
	pop {r3, pc}
	.align 2, 0
_02236534: .4byte 0x0223E2FC
_02236538: .4byte 0x0000117C
	thumb_func_end ov74_02236514

	thumb_func_start ov74_0223653C
ov74_0223653C: @ 0x0223653C
	push {r3, lr}
	movs r0, #3
	bl ov74_02236168
	ldr r0, _02236568 @ =0x0223E2FC
	ldr r1, _0223656C @ =ov74_02236570
	ldr r0, [r0]
	movs r2, #2
	blx FUN_020DF3F8
	cmp r0, #2
	beq _02236562
	bl ov74_022361B8
	movs r0, #0xa
	bl ov74_02236168
	movs r0, #0
	pop {r3, pc}
_02236562:
	movs r0, #1
	pop {r3, pc}
	nop
_02236568: .4byte 0x0223E2FC
_0223656C: .4byte ov74_02236570
	thumb_func_end ov74_0223653C

	thumb_func_start ov74_02236570
ov74_02236570: @ 0x02236570
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _02236584
	bl ov74_022361B8
	movs r0, #0xa
	bl ov74_02236168
	pop {r3, pc}
_02236584:
	ldr r0, _022365A8 @ =ov74_02236514
	blx FUN_020DEBA8
	cmp r0, #0
	beq _0223659A
	bl ov74_022361B8
	movs r0, #0xa
	bl ov74_02236168
	pop {r3, pc}
_0223659A:
	movs r0, #1
	bl ov74_02236168
	bl ov74_022361D4
	pop {r3, pc}
	nop
_022365A8: .4byte ov74_02236514
	thumb_func_end ov74_02236570

	thumb_func_start ov74_022365AC
ov74_022365AC: @ 0x022365AC
	push {r3, lr}
	ldr r0, _022365EC @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _022365F0 @ =0x00001150
	ldr r0, [r1, r0]
	cmp r0, #1
	beq _022365BE
	blx FUN_020D3F48
_022365BE:
	movs r0, #3
	bl ov74_02236168
	ldr r0, _022365F4 @ =ov74_022364C0
	blx FUN_020DF4B8
	cmp r0, #2
	beq _022365E8
	movs r0, #9
	bl ov74_02236168
	ldr r0, _022365EC @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _022365F8 @ =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _022365E4
	movs r0, #4
	blx r1
_022365E4:
	movs r0, #0
	pop {r3, pc}
_022365E8:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_022365EC: .4byte 0x0223E2FC
_022365F0: .4byte 0x00001150
_022365F4: .4byte ov74_022364C0
_022365F8: .4byte 0x0000117C
	thumb_func_end ov74_022365AC

	thumb_func_start ov74_022365FC
ov74_022365FC: @ 0x022365FC
	push {r3, lr}
	ldr r0, _02236618 @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _0223661C @ =0x00001150
	ldr r0, [r1, r0]
	cmp r0, #1
	bne _02236610
	bl ov74_022365AC
	pop {r3, pc}
_02236610:
	bl ov74_02236620
	pop {r3, pc}
	nop
_02236618: .4byte 0x0223E2FC
_0223661C: .4byte 0x00001150
	thumb_func_end ov74_022365FC

	thumb_func_start ov74_02236620
ov74_02236620: @ 0x02236620
	push {r3, lr}
	movs r0, #3
	bl ov74_02236168
	ldr r0, _02236640 @ =ov74_02236644
	blx FUN_020DF480
	cmp r0, #2
	beq _0223663A
	bl ov74_022361B8
	movs r0, #0
	pop {r3, pc}
_0223663A:
	movs r0, #1
	pop {r3, pc}
	nop
_02236640: .4byte ov74_02236644
	thumb_func_end ov74_02236620

	thumb_func_start ov74_02236644
ov74_02236644: @ 0x02236644
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0223666C
	movs r0, #9
	bl ov74_02236168
	ldrh r0, [r4, #2]
	bl ov74_022361B8
	ldr r0, _02236678 @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _0223667C @ =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02236676
	movs r0, #4
	blx r1
	pop {r4, pc}
_0223666C:
	movs r0, #1
	bl ov74_02236168
	bl ov74_022365AC
_02236676:
	pop {r4, pc}
	.align 2, 0
_02236678: .4byte 0x0223E2FC
_0223667C: .4byte 0x0000117C
	thumb_func_end ov74_02236644

	thumb_func_start ov74_02236680
ov74_02236680: @ 0x02236680
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r2, #0x1f
	movs r0, #0x1f
	bics r2, r0
	ldr r4, _022366DC @ =0x0223E2FC
	ldr r3, _022366E0 @ =0x00001150
	str r2, [r4]
	movs r0, #0
	str r0, [r2, r3]
	adds r2, r3, #0
	ldr r5, [r4]
	movs r6, #1
	adds r2, #8
	strh r6, [r5, r2]
	adds r2, r3, #0
	ldr r5, [r4]
	adds r2, #0x28
	str r7, [r5, r2]
	adds r2, r3, #0
	ldr r5, [r4]
	adds r2, #0xc
	strh r0, [r5, r2]
	adds r2, r3, #0
	ldr r5, [r4]
	adds r2, #0xe
	strh r0, [r5, r2]
	adds r2, r3, #0
	ldr r5, [r4]
	adds r2, #0x2c
	str r1, [r5, r2]
	adds r2, r3, #0
	ldr r5, [r4]
	movs r1, #0x10
	adds r2, #0x26
	strh r1, [r5, r2]
	ldr r5, [r4]
	ldr r2, _022366E4 @ =0x00001048
	subs r1, #0x11
	str r0, [r5, r2]
	ldr r0, [r4]
	adds r3, #0x1c
	str r1, [r0, r3]
	bl ov74_022364F0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022366DC: .4byte 0x0223E2FC
_022366E0: .4byte 0x00001150
_022366E4: .4byte 0x00001048
	thumb_func_end ov74_02236680

	thumb_func_start ov74_022366E8
ov74_022366E8: @ 0x022366E8
	push {r4, r5, r6, lr}
	ldr r3, _02236758 @ =0x0223E2FC
	ldr r1, _0223675C @ =0x00001048
	ldr r2, [r3]
	movs r4, #0
	str r4, [r2, r1]
	ldr r1, [r3]
	ldr r2, _02236760 @ =0x00001158
	movs r4, #3
	strh r4, [r1, r2]
	ldrh r5, [r0]
	ldr r4, [r3]
	adds r1, r2, #2
	strh r5, [r4, r1]
	ldr r4, [r0, #4]
	adds r0, r2, #0
	ldr r1, [r3]
	adds r0, #8
	str r4, [r1, r0]
	ldr r4, [r3]
	adds r2, #8
	ldr r0, [r4, r2]
	movs r1, #0x68
	subs r0, r0, #1
	blx FUN_020F2BA4
	ldr r2, _02236764 @ =0x0000115C
	adds r0, r0, #1
	strh r0, [r4, r2]
	ldr r4, _02236758 @ =0x0223E2FC
	movs r0, #0
	ldr r3, [r4]
	adds r1, r2, #2
	strh r0, [r3, r1]
	adds r1, r2, #0
	ldr r3, [r4]
	adds r1, #8
	str r0, [r3, r1]
	ldr r1, [r4]
	ldrh r2, [r1, r2]
	cmp r2, #0
	ble _02236754
	movs r2, #0x46
	lsls r2, r2, #6
	adds r3, r2, #0
	adds r6, r0, #0
	subs r3, #0x24
_02236746:
	adds r1, r1, r0
	strb r6, [r1, r2]
	ldr r1, [r4]
	adds r0, r0, #1
	ldrh r5, [r1, r3]
	cmp r0, r5
	blt _02236746
_02236754:
	pop {r4, r5, r6, pc}
	nop
_02236758: .4byte 0x0223E2FC
_0223675C: .4byte 0x00001048
_02236760: .4byte 0x00001158
_02236764: .4byte 0x0000115C
	thumb_func_end ov74_022366E8

	thumb_func_start ov74_02236768
ov74_02236768: @ 0x02236768
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _02236884 @ =0x0223E2FC
	ldrh r1, [r4]
	ldr r3, [r0]
	ldr r0, _02236888 @ =0x0000115A
	ldrh r2, [r3, r0]
	cmp r2, r1
	bne _02236784
	adds r0, r0, #6
	ldr r1, [r3, r0]
	ldr r0, [r4, #4]
	cmp r1, r0
	beq _022367B0
_02236784:
	ldr r0, _02236884 @ =0x0223E2FC
	ldr r3, [r0]
	ldr r0, _0223688C @ =0x00001164
	ldr r2, [r3, r0]
	adds r1, r2, #1
	str r1, [r3, r0]
	cmp r2, #0x10
	blo _022367AC
	adds r0, r4, #0
	bl ov74_022366E8
	ldr r0, _02236884 @ =0x0223E2FC
	ldr r1, [r0]
	ldr r0, _02236890 @ =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _022367B0
	movs r0, #5
	blx r1
	b _022367B0
_022367AC:
	movs r0, #0
	pop {r3, r4, r5, pc}
_022367B0:
	ldrh r3, [r4, #2]
	ldr r0, _02236894 @ =0x0000FFFF
	cmp r3, r0
	bne _022367D8
	ldr r1, _02236884 @ =0x0223E2FC
	adds r4, #8
	ldr r2, [r1]
	movs r1, #0xfe
	lsls r1, r1, #4
	adds r1, r2, r1
	adds r0, r4, #0
	movs r2, #0x68
	blx FUN_020D4808
	ldr r0, _02236884 @ =0x0223E2FC
	movs r2, #1
	ldr r1, [r0]
	ldr r0, _02236898 @ =0x00001048
	str r2, [r1, r0]
	b _02236880
_022367D8:
	ldr r1, _02236884 @ =0x0223E2FC
	ldr r0, _0223689C @ =0x00001168
	ldr r2, [r1]
	str r3, [r2, r0]
	ldr r3, [r1]
	adds r1, r0, #0
	subs r1, #0xc
	ldrh r2, [r4, #2]
	ldrh r1, [r3, r1]
	cmp r2, r1
	blo _02236800
	adds r0, #0x14
	ldr r1, [r3, r0]
	cmp r1, #0
	beq _022367FA
	movs r0, #4
	blx r1
_022367FA:
	movs r0, #9
	bl ov74_02236168
_02236800:
	ldr r0, _02236884 @ =0x0223E2FC
	movs r2, #0x46
	ldr r1, [r0]
	lsls r2, r2, #6
	ldrh r3, [r4, #2]
	adds r5, r1, r2
	ldrb r1, [r5, r3]
	cmp r1, #0
	bne _02236880
	movs r1, #1
	strb r1, [r5, r3]
	ldr r5, [r0]
	adds r0, r2, #0
	subs r0, #0x24
	ldrh r0, [r5, r0]
	ldrh r1, [r4, #2]
	subs r0, r0, #1
	cmp r1, r0
	bne _02236844
	adds r3, r1, #0
	adds r1, r2, #0
	subs r1, #8
	subs r2, #0x20
	movs r0, #0x68
	ldr r1, [r5, r1]
	muls r3, r0, r3
	ldr r2, [r5, r2]
	adds r4, #8
	adds r0, r4, #0
	adds r1, r1, r3
	subs r2, r2, r3
	blx FUN_020D4808
	b _02236858
_02236844:
	adds r4, #8
	subs r2, #8
	adds r0, r4, #0
	ldr r4, [r5, r2]
	movs r2, #0x68
	adds r3, r1, #0
	muls r3, r2, r3
	adds r1, r4, r3
	blx FUN_020D4808
_02236858:
	ldr r1, _02236884 @ =0x0223E2FC
	ldr r0, _022368A0 @ =0x0000115E
	ldr r3, [r1]
	ldrh r2, [r3, r0]
	adds r2, r2, #1
	strh r2, [r3, r0]
	ldr r3, [r1]
	subs r1, r0, #2
	ldrh r2, [r3, r0]
	ldrh r1, [r3, r1]
	cmp r2, r1
	bne _02236880
	adds r0, #0x1e
	ldr r1, [r3, r0]
	cmp r1, #0
	beq _0223687C
	movs r0, #2
	blx r1
_0223687C:
	movs r0, #1
	pop {r3, r4, r5, pc}
_02236880:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02236884: .4byte 0x0223E2FC
_02236888: .4byte 0x0000115A
_0223688C: .4byte 0x00001164
_02236890: .4byte 0x0000117C
_02236894: .4byte 0x0000FFFF
_02236898: .4byte 0x00001048
_0223689C: .4byte 0x00001168
_022368A0: .4byte 0x0000115E
	thumb_func_end ov74_02236768

	thumb_func_start ov74_022368A4
ov74_022368A4: @ 0x022368A4
	push {r3, r4}
	movs r2, #0
	adds r3, r2, #0
	lsrs r1, r1, #1
	beq _022368CC
_022368AE:
	lsls r4, r3, #1
	ldrh r4, [r0, r4]
	adds r3, r3, #1
	lsls r3, r3, #0x10
	adds r2, r2, r4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r4, r2, #1
	asrs r2, r2, #0xf
	orrs r2, r4
	lsls r2, r2, #0x10
	lsrs r3, r3, #0x10
	lsrs r2, r2, #0x10
	cmp r3, r1
	blo _022368AE
_022368CC:
	adds r0, r2, #0
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov74_022368A4

	thumb_func_start ov74_022368D4
ov74_022368D4: @ 0x022368D4
	push {r4, lr}
	sub sp, #8
	ldr r0, _02236968 @ =0x0223E2FC
	add r1, sp, #0
	ldr r4, [r0]
	ldr r0, _0223696C @ =0x00001170
	adds r3, r4, r0
	ldrh r2, [r3]
	subs r0, #0x16
	strh r2, [r1]
	ldrh r2, [r3, #2]
	strh r2, [r1, #6]
	ldrh r2, [r3, #4]
	add r3, sp, #0
	strh r2, [r1, #4]
	ldrh r0, [r4, r0]
	ldr r2, _02236970 @ =0x00003FA2
	strh r0, [r1, #2]
	movs r1, #0
_022368FA:
	ldrh r0, [r3]
	adds r1, r1, #1
	eors r0, r2
	strh r0, [r3]
	ldrh r2, [r3]
	adds r3, r3, #2
	cmp r1, #4
	blt _022368FA
	ldr r0, _02236968 @ =0x0223E2FC
	movs r2, #8
	ldr r1, [r0]
	ldr r0, _02236974 @ =0x0000104C
	adds r0, r1, r0
	add r1, sp, #0
	blx FUN_020A0598
	ldr r0, _02236968 @ =0x0223E2FC
	ldr r2, _02236978 @ =0x00001178
	ldr r3, [r0]
	ldr r0, _02236974 @ =0x0000104C
	ldr r1, [r3, r2]
	subs r2, #0x18
	ldr r2, [r3, r2]
	adds r0, r3, r0
	adds r3, r1, #0
	blx ov74_0223706C
	ldr r1, _02236968 @ =0x0223E2FC
	ldr r2, _02236974 @ =0x0000104C
	ldr r1, [r1]
	movs r0, #0
	adds r1, r1, r2
	lsrs r2, r2, #4
	blx FUN_020D47EC
	ldr r0, _02236968 @ =0x0223E2FC
	ldr r1, _02236978 @ =0x00001178
	ldr r2, [r0]
	ldr r0, [r2, r1]
	subs r1, #0x18
	ldr r1, [r2, r1]
	bl ov74_022368A4
	ldr r1, _02236968 @ =0x0223E2FC
	ldr r2, [r1]
	ldr r1, _0223697C @ =0x0000115A
	ldrh r1, [r2, r1]
	cmp r1, r0
	bne _02236962
	add sp, #8
	movs r0, #1
	pop {r4, pc}
_02236962:
	movs r0, #0
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_02236968: .4byte 0x0223E2FC
_0223696C: .4byte 0x00001170
_02236970: .4byte 0x00003FA2
_02236974: .4byte 0x0000104C
_02236978: .4byte 0x00001178
_0223697C: .4byte 0x0000115A
	thumb_func_end ov74_022368D4

	thumb_func_start ov74_02236980
ov74_02236980: @ 0x02236980
	ldr r0, _02236984 @ =0x000016A0
	bx lr
	.align 2, 0
_02236984: .4byte 0x000016A0
	thumb_func_end ov74_02236980

	thumb_func_start ov74_02236988
ov74_02236988: @ 0x02236988
	ldr r0, _022369A0 @ =0x0223E2FC
	ldr r2, [r0]
	ldr r0, _022369A4 @ =0x00001048
	ldr r1, [r2, r0]
	cmp r1, #0
	beq _0223699A
	subs r0, #0x68
	adds r0, r2, r0
	bx lr
_0223699A:
	movs r0, #0
	bx lr
	nop
_022369A0: .4byte 0x0223E2FC
_022369A4: .4byte 0x00001048
	thumb_func_end ov74_02236988

	thumb_func_start ov74_022369A8
ov74_022369A8: @ 0x022369A8
	push {r3, lr}
	adds r1, #0x24
	movs r0, #0x1f
	bics r1, r0
	adds r1, #0x20
	movs r0, #0x54
	bl FUN_0201AA8C
	adds r2, r0, #0
	adds r2, #0x20
	movs r1, #0x1f
	bics r2, r1
	subs r1, r2, #4
	str r0, [r1]
	adds r0, r2, #0
	pop {r3, pc}
	thumb_func_end ov74_022369A8

	thumb_func_start ov74_022369C8
ov74_022369C8: @ 0x022369C8
	push {r3, lr}
	cmp r1, #0
	beq _022369D6
	subs r0, r1, #4
	ldr r0, [r0]
	bl FUN_0201AB0C
_022369D6:
	pop {r3, pc}
	thumb_func_end ov74_022369C8

	thumb_func_start ov74_022369D8
ov74_022369D8: @ 0x022369D8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r0, sp, #0
	add r1, sp, #4
	blx FUN_021EC11C
	ldr r0, [sp]
	ldr r1, [sp, #4]
	rsbs r0, r0, #0
	bl FUN_021E6A70
	ldr r2, _02236A20 @ =0x0000266C
	str r0, [r4, r2]
	ldr r0, [sp]
	rsbs r1, r0, #0
	adds r0, r2, #4
	str r1, [r4, r0]
	adds r0, r2, #0
	ldr r1, [sp, #4]
	adds r0, #8
	str r1, [r4, r0]
	subs r0, r2, #4
	movs r1, #1
	str r1, [r4, r0]
	ldr r0, _02236A24 @ =0x0223E304
	adds r2, #0x10
	str r1, [r0, #0x10]
	movs r1, #0
	adds r0, r4, #0
	str r1, [r4, r2]
	bl ov74_02229E60
	ldr r0, _02236A28 @ =0x0000100F
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_02236A20: .4byte 0x0000266C
_02236A24: .4byte 0x0223E304
_02236A28: .4byte 0x0000100F
	thumb_func_end ov74_022369D8

	thumb_func_start ov74_02236A2C
ov74_02236A2C: @ 0x02236A2C
	push {lr}
	sub sp, #0x3c
	blx FUN_021EC724
	cmp r0, #4
	beq _02236A40
	cmp r0, #7
	beq _02236A4C
	cmp r0, #8
	b _02236A4C
_02236A40:
	add r0, sp, #0
	blx FUN_021EC9E0
	add sp, #0x3c
	movs r0, #1
	pop {pc}
_02236A4C:
	movs r0, #0
	add sp, #0x3c
	pop {pc}
	.align 2, 0
	thumb_func_end ov74_02236A2C

	thumb_func_start ov74_02236A54
ov74_02236A54: @ 0x02236A54
	push {r3, r4}
	ldr r3, _02236A6C @ =0x0223E304
	movs r4, #0
	str r4, [r3]
	str r4, [r3, #0xc]
	ldr r3, _02236A70 @ =0x00001650
	str r2, [r0, r3]
	ldr r0, _02236A74 @ =0x00001012
	str r0, [r1]
	pop {r3, r4}
	bx lr
	nop
_02236A6C: .4byte 0x0223E304
_02236A70: .4byte 0x00001650
_02236A74: .4byte 0x00001012
	thumb_func_end ov74_02236A54

	thumb_func_start ov74_02236A78
ov74_02236A78: @ 0x02236A78
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	ldr r2, _02236A9C @ =0x0223E304
	movs r5, #0
	str r5, [r2, #4]
	str r1, [r2, #8]
	ldr r1, _02236AA0 @ =0x00001650
	str r3, [r0, r1]
	ldr r0, _02236AA4 @ =0x00001013
	str r0, [r4]
	ldr r0, _02236AA8 @ =ov74_02236ABC
	blx FUN_021ED308
	cmp r0, #0
	bne _02236A9A
	ldr r0, [sp, #0x10]
	str r0, [r4]
_02236A9A:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02236A9C: .4byte 0x0223E304
_02236AA0: .4byte 0x00001650
_02236AA4: .4byte 0x00001013
_02236AA8: .4byte ov74_02236ABC
	thumb_func_end ov74_02236A78

	thumb_func_start ov74_02236AAC
ov74_02236AAC: @ 0x02236AAC
	ldr r0, _02236AB8 @ =0x0223E304
	movs r2, #1
	str r2, [r0]
	str r1, [r0, #0xc]
	bx lr
	nop
_02236AB8: .4byte 0x0223E304
	thumb_func_end ov74_02236AAC

	thumb_func_start ov74_02236ABC
ov74_02236ABC: @ 0x02236ABC
	ldr r0, _02236AC4 @ =0x0223E304
	movs r1, #1
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_02236AC4: .4byte 0x0223E304
	thumb_func_end ov74_02236ABC

	thumb_func_start ov74_02236AC8
ov74_02236AC8: @ 0x02236AC8
	push {r3, lr}
	bl FUN_0203A914
	bl FUN_020394F4
	bl FUN_02091624
	bl FUN_020915C0
	bl FUN_02034DE0
	pop {r3, pc}
	thumb_func_end ov74_02236AC8

	thumb_func_start ov74_02236AE0
ov74_02236AE0: @ 0x02236AE0
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, _02236DE8 @ =0x0000267C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02236B00
	blx r0
	cmp r0, #1
	bne _02236B00
	adds r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
_02236B00:
	movs r3, #1
	ldr r0, [r5]
	lsls r3, r3, #0xc
	subs r0, r0, r3
	cmp r0, #0x13
	bls _02236B0E
	b _02236F0A
_02236B0E:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02236B1A: @ jump table
	.2byte _02236B42 - _02236B1A - 2 @ case 0
	.2byte _02236B5A - _02236B1A - 2 @ case 1
	.2byte _02236B76 - _02236B1A - 2 @ case 2
	.2byte _02236B9E - _02236B1A - 2 @ case 3
	.2byte _02236BE8 - _02236B1A - 2 @ case 4
	.2byte _02236C00 - _02236B1A - 2 @ case 5
	.2byte _02236C46 - _02236B1A - 2 @ case 6
	.2byte _02236C6A - _02236B1A - 2 @ case 7
	.2byte _02236CA0 - _02236B1A - 2 @ case 8
	.2byte _02236CC2 - _02236B1A - 2 @ case 9
	.2byte _02236CFE - _02236B1A - 2 @ case 10
	.2byte _02236D24 - _02236B1A - 2 @ case 11
	.2byte _02236DAA - _02236B1A - 2 @ case 12
	.2byte _02236DC8 - _02236B1A - 2 @ case 13
	.2byte _02236F0A - _02236B1A - 2 @ case 14
	.2byte _02236DE2 - _02236B1A - 2 @ case 15
	.2byte _02236E94 - _02236B1A - 2 @ case 16
	.2byte _02236E8A - _02236B1A - 2 @ case 17
	.2byte _02236EB0 - _02236B1A - 2 @ case 18
	.2byte _02236EE6 - _02236B1A - 2 @ case 19
_02236B42:
	bl FUN_02034D8C
	bl FUN_020915B0
	bl FUN_02091614
	movs r0, #3
	bl FUN_02039FD8
	ldr r0, _02236DEC @ =0x00001001
	str r0, [r5]
	b _02236F0A
_02236B5A:
	bl FUN_02034DB8
	cmp r0, #0
	beq _02236C3E
	ldr r0, _02236DF0 @ =ov74_022369A8
	ldr r1, _02236DF4 @ =ov74_022369C8
	blx FUN_021EC294
	ldr r0, [r4, #4]
	bl FUN_020394A0
	ldr r0, _02236DF8 @ =0x00001002
	str r0, [r5]
	b _02236F0A
_02236B76:
	ldr r0, _02236DFC @ =0x000015E8
	movs r1, #2
	adds r0, r4, r0
	movs r2, #1
	movs r3, #0x14
	blx FUN_021EC3F0
	movs r0, #2
	blx FUN_021EC454
	blx FUN_021EC4A4
	bl FUN_0203A880
	ldr r0, _02236E00 @ =0x00001003
	movs r1, #0
	str r0, [r5]
	ldr r0, _02236E04 @ =0x00002678
	str r1, [r4, r0]
	b _02236F0A
_02236B9E:
	blx FUN_021EC60C
	blx FUN_021EC5B4
	cmp r0, #0
	beq _02236BD6
	adds r0, r4, #0
	bl ov74_02236A2C
	cmp r0, #1
	bne _02236BCE
	ldr r0, _02236E04 @ =0x00002678
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02236BC8
	ldr r0, _02236E08 @ =0x0223E304
	movs r1, #3
	str r1, [r0, #8]
	ldr r0, _02236E0C @ =0x0000100D
	str r0, [r5]
	b _02236BD6
_02236BC8:
	ldr r0, _02236E10 @ =0x00001004
	str r0, [r5]
	b _02236BD6
_02236BCE:
	adds r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
_02236BD6:
	ldr r0, _02236E14 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _02236C3E
	ldr r0, _02236E04 @ =0x00002678
	movs r1, #1
	str r1, [r4, r0]
	b _02236F0A
_02236BE8:
	blx FUN_021ECD04
	cmp r0, #0
	bne _02236BFA
	adds r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236BFA:
	ldr r0, _02236E18 @ =0x00001005
	str r0, [r5]
	b _02236F0A
_02236C00:
	blx FUN_021ECDC8
	cmp r0, #3
	bne _02236C14
	ldr r0, _02236E1C @ =0x00001006
	ldr r1, _02236E20 @ =0x021ECB40
	str r0, [r5]
	ldr r0, _02236DE8 @ =0x0000267C
	str r1, [r4, r0]
	b _02236C34
_02236C14:
	cmp r0, #4
	bne _02236C26
	adds r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	blx FUN_021EC8D8
	b _02236C34
_02236C26:
	cmp r0, #5
	bne _02236C34
	ldr r0, _02236E08 @ =0x0223E304
	movs r1, #3
	str r1, [r0, #8]
	ldr r0, _02236E0C @ =0x0000100D
	str r0, [r5]
_02236C34:
	ldr r0, _02236E14 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	bne _02236C40
_02236C3E:
	b _02236F0A
_02236C40:
	blx FUN_021ECEC0
	b _02236F0A
_02236C46:
	ldr r0, _02236E24 @ =ov74_02236AAC
	ldr r1, _02236E28 @ =0x0223D038
	ldr r2, _02236E2C @ =0x0223D040
	blx FUN_021ED1F0
	cmp r0, #0
	bne _02236C5E
	adds r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236C5E:
	ldr r2, _02236E30 @ =0x00001007
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov74_02236A54
	b _02236F0A
_02236C6A:
	ldr r0, _02236E04 @ =0x00002678
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02236C82
	adds r3, #0xc
	adds r0, r4, #0
	movs r1, #3
	adds r2, r5, #0
	str r3, [sp]
	bl ov74_02236A78
	b _02236F0A
_02236C82:
	ldr r0, _02236E34 @ =0x0223D054
	adds r1, r0, #0
	adds r2, r0, #0
	blx FUN_021ED354
	cmp r0, #0
	bne _02236C9A
	adds r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236C9A:
	ldr r0, _02236E38 @ =0x00001008
	str r0, [r5]
	b _02236F0A
_02236CA0:
	ldr r0, _02236E3C @ =0x00001654
	adds r0, r4, r0
	blx FUN_021ED388
	cmp r0, #0
	bne _02236CB6
	adds r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236CB6:
	ldr r2, _02236E40 @ =0x00001009
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov74_02236A54
	b _02236F0A
_02236CC2:
	ldr r0, _02236E3C @ =0x00001654
	ldr r0, [r4, r0]
	cmp r0, #1
	beq _02236CDA
	adds r3, #0xd
	adds r0, r4, #0
	movs r1, #2
	adds r2, r5, #0
	str r3, [sp]
	bl ov74_02236A78
	b _02236F0A
_02236CDA:
	ldr r0, _02236E44 @ =0x0223E318
	movs r1, #0
	movs r2, #0xa
	blx FUN_021ED3AC
	cmp r0, #0
	bne _02236CF2
	adds r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236CF2:
	ldr r2, _02236E48 @ =0x0000100A
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov74_02236A54
	b _02236F0A
_02236CFE:
	ldr r1, _02236E4C @ =0x00001658
	ldr r0, _02236E44 @ =0x0223E318
	adds r1, r4, r1
	adds r2, r3, #0
	blx FUN_021ED3F4
	cmp r0, #0
	bne _02236D18
	adds r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236D18:
	ldr r0, _02236E50 @ =0x0000100B
	movs r1, #0
	str r0, [r5]
	ldr r0, _02236E54 @ =0x00002664
	str r1, [r4, r0]
	b _02236F0A
_02236D24:
	ldr r0, _02236E08 @ =0x0223E304
	ldr r1, [r0]
	cmp r1, #0
	bne _02236D72
	ldr r0, _02236E14 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _02236D46
	adds r3, #0xc
	adds r0, r4, #0
	movs r1, #3
	adds r2, r5, #0
	str r3, [sp]
	bl ov74_02236A78
	b _02236F0A
_02236D46:
	ldr r1, _02236E58 @ =0x0000265C
	adds r0, r4, r1
	adds r1, r1, #4
	adds r1, r4, r1
	blx FUN_021ED444
	cmp r0, #1
	bne _02236DD0
	ldr r1, _02236E58 @ =0x0000265C
	movs r0, #0x64
	ldr r2, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	muls r0, r2, r0
	blx FUN_020F2BA4
	ldr r1, _02236E54 @ =0x00002664
	ldr r2, [r4, r1]
	cmp r2, r0
	beq _02236DD0
	str r0, [r4, r1]
	b _02236F0A
_02236D72:
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _02236D82
	adds r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236D82:
	ldr r0, _02236E04 @ =0x00002678
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02236D9A
	adds r3, #0xd
	adds r0, r4, #0
	movs r1, #1
	adds r2, r5, #0
	str r3, [sp]
	bl ov74_02236A78
	b _02236F0A
_02236D9A:
	adds r3, #0xd
	adds r0, r4, #0
	movs r1, #3
	adds r2, r5, #0
	str r3, [sp]
	bl ov74_02236A78
	b _02236F0A
_02236DAA:
	blx FUN_021ED428
	cmp r0, #0
	bne _02236DB8
	ldr r0, _02236E0C @ =0x0000100D
	str r0, [r5]
	b _02236F0A
_02236DB8:
	ldr r0, _02236DE8 @ =0x0000267C
	movs r1, #0
	str r1, [r4, r0]
	bl ov74_02236AC8
	ldr r0, _02236E08 @ =0x0223E304
	ldr r0, [r0, #8]
	pop {r3, r4, r5, pc}
_02236DC8:
	blx FUN_021EC938
	cmp r0, #1
	beq _02236DD2
_02236DD0:
	b _02236F0A
_02236DD2:
	ldr r0, _02236DE8 @ =0x0000267C
	movs r1, #0
	str r1, [r4, r0]
	bl ov74_02236AC8
	ldr r0, _02236E08 @ =0x0223E304
	ldr r0, [r0, #8]
	pop {r3, r4, r5, pc}
_02236DE2:
	ldr r0, _02236E08 @ =0x0223E304
	b _02236E5C
	nop
_02236DE8: .4byte 0x0000267C
_02236DEC: .4byte 0x00001001
_02236DF0: .4byte ov74_022369A8
_02236DF4: .4byte ov74_022369C8
_02236DF8: .4byte 0x00001002
_02236DFC: .4byte 0x000015E8
_02236E00: .4byte 0x00001003
_02236E04: .4byte 0x00002678
_02236E08: .4byte 0x0223E304
_02236E0C: .4byte 0x0000100D
_02236E10: .4byte 0x00001004
_02236E14: .4byte 0x021D110C
_02236E18: .4byte 0x00001005
_02236E1C: .4byte 0x00001006
_02236E20: .4byte 0x021ECB40
_02236E24: .4byte ov74_02236AAC
_02236E28: .4byte 0x0223D038
_02236E2C: .4byte 0x0223D040
_02236E30: .4byte 0x00001007
_02236E34: .4byte 0x0223D054
_02236E38: .4byte 0x00001008
_02236E3C: .4byte 0x00001654
_02236E40: .4byte 0x00001009
_02236E44: .4byte 0x0223E318
_02236E48: .4byte 0x0000100A
_02236E4C: .4byte 0x00001658
_02236E50: .4byte 0x0000100B
_02236E54: .4byte 0x00002664
_02236E58: .4byte 0x0000265C
_02236E5C:
	ldr r0, [r0, #0x10]
	cmp r0, #1
	bne _02236F0A
	adds r0, r4, #0
	bl ov74_0222ACD8
	ldr r0, _02236F10 @ =0x00002674
	ldr r0, [r4, r0]
	subs r0, r0, #5
	cmp r0, #1
	bhi _02236E84
	ldr r3, _02236F14 @ =0x00001010
	adds r0, r4, #0
	str r3, [sp]
	movs r1, #3
	adds r2, r5, #0
	adds r3, r3, #1
	bl ov74_02236A78
	b _02236F0A
_02236E84:
	ldr r0, _02236F18 @ =0x00001011
	str r0, [r5]
	b _02236F0A
_02236E8A:
	blx FUN_021EC8D8
	ldr r0, _02236F14 @ =0x00001010
	str r0, [r5]
	b _02236F0A
_02236E94:
	ldr r0, _02236F1C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _02236F0A
	ldr r0, _02236F20 @ =0x0000267C
	movs r1, #0
	str r1, [r4, r0]
	blx FUN_021EC210
	bl ov74_02236AC8
	movs r0, #4
	pop {r3, r4, r5, pc}
_02236EB0:
	ldr r0, _02236F24 @ =0x0223E304
	ldr r1, [r0]
	cmp r1, #1
	bne _02236ED4
	movs r1, #0
	str r1, [r0]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _02236ECC
	adds r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236ECC:
	ldr r0, _02236F28 @ =0x00001650
	ldr r0, [r4, r0]
	str r0, [r5]
	b _02236F0A
_02236ED4:
	ldr r0, _02236F1C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _02236F0A
	ldr r0, _02236F2C @ =0x00002678
	movs r1, #1
	str r1, [r4, r0]
	b _02236F0A
_02236EE6:
	ldr r0, _02236F24 @ =0x0223E304
	ldr r1, [r0, #4]
	cmp r1, #1
	bne _02236EFA
	movs r1, #0
	str r1, [r0, #4]
	ldr r0, _02236F28 @ =0x00001650
	ldr r0, [r4, r0]
	str r0, [r5]
	b _02236F0A
_02236EFA:
	ldr r0, _02236F1C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _02236F0A
	ldr r0, _02236F2C @ =0x00002678
	movs r1, #1
	str r1, [r4, r0]
_02236F0A:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_02236F10: .4byte 0x00002674
_02236F14: .4byte 0x00001010
_02236F18: .4byte 0x00001011
_02236F1C: .4byte 0x021D110C
_02236F20: .4byte 0x0000267C
_02236F24: .4byte 0x0223E304
_02236F28: .4byte 0x00001650
_02236F2C: .4byte 0x00002678
	thumb_func_end ov74_02236AE0

	thumb_func_start ov74_02236F30
ov74_02236F30: @ 0x02236F30
	cmp r0, #1
	bne _02236F38
	movs r0, #1
	b _02236F3A
_02236F38:
	ldr r0, _02236F40 @ =0x000001DE
_02236F3A:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_02236F40: .4byte 0x000001DE
	thumb_func_end ov74_02236F30

	thumb_func_start ov74_02236F44
ov74_02236F44: @ 0x02236F44
	cmp r0, #7
	bhi _02236F64
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02236F54: @ jump table
	.2byte _02236F64 - _02236F54 - 2 @ case 0
	.2byte _02236F64 - _02236F54 - 2 @ case 1
	.2byte _02236F68 - _02236F54 - 2 @ case 2
	.2byte _02236F6E - _02236F54 - 2 @ case 3
	.2byte _02236F68 - _02236F54 - 2 @ case 4
	.2byte _02236F72 - _02236F54 - 2 @ case 5
	.2byte _02236F64 - _02236F54 - 2 @ case 6
	.2byte _02236F68 - _02236F54 - 2 @ case 7
_02236F64:
	movs r0, #0xea
	bx lr
_02236F68:
	movs r0, #0x6d
	lsls r0, r0, #2
	bx lr
_02236F6E:
	ldr r0, _02236F78 @ =0x000001B7
	bx lr
_02236F72:
	ldr r0, _02236F7C @ =0x000001B6
	bx lr
	nop
_02236F78: .4byte 0x000001B7
_02236F7C: .4byte 0x000001B6
	thumb_func_end ov74_02236F44

	thumb_func_start ov74_02236F80
ov74_02236F80: @ 0x02236F80
	cmp r0, #7
	bhi _02236FA0
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02236F90: @ jump table
	.2byte _02236FA0 - _02236F90 - 2 @ case 0
	.2byte _02236FA0 - _02236F90 - 2 @ case 1
	.2byte _02236FA4 - _02236F90 - 2 @ case 2
	.2byte _02236FA8 - _02236F90 - 2 @ case 3
	.2byte _02236FA4 - _02236F90 - 2 @ case 4
	.2byte _02236FAE - _02236F90 - 2 @ case 5
	.2byte _02236FA0 - _02236F90 - 2 @ case 6
	.2byte _02236FA4 - _02236F90 - 2 @ case 7
_02236FA0:
	movs r0, #0xeb
	bx lr
_02236FA4:
	ldr r0, _02236FB4 @ =0x000001B5
	bx lr
_02236FA8:
	movs r0, #0x6e
	lsls r0, r0, #2
	bx lr
_02236FAE:
	movs r0, #0x6d
	lsls r0, r0, #2
	bx lr
	.align 2, 0
_02236FB4: .4byte 0x000001B5
	thumb_func_end ov74_02236F80

	thumb_func_start ov74_02236FB8
ov74_02236FB8: @ 0x02236FB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r3, #0
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	cmp r5, #1
	beq _02236FCC
	movs r2, #1
	b _02236FCE
_02236FCC:
	movs r2, #0
_02236FCE:
	ldr r0, [sp, #8]
	movs r6, #0
	subs r0, r0, #1
	str r0, [sp, #0xc]
	beq _02237056
	ldr r1, _02237064 @ =0x0223B760
	lsls r0, r2, #1
	ldr r4, [sp, #4]
	adds r7, r1, r0
_02236FE0:
	ldr r0, [sp]
	ldrb r0, [r0, r6]
	cmp r0, #0xff
	beq _02237056
	cmp r0, #0xf7
	blo _0223701A
	ldr r0, [sp, #8]
	subs r3, r0, #1
	cmp r3, #0xa
	blo _02236FF6
	movs r3, #0xa
_02236FF6:
	movs r1, #0
	cmp r3, #0
	ble _0223700C
	movs r0, #0x6b
	ldr r2, [sp, #4]
	lsls r0, r0, #2
_02237002:
	adds r1, r1, #1
	strh r0, [r2]
	adds r2, r2, #2
	cmp r1, r3
	blt _02237002
_0223700C:
	ldr r0, [sp, #4]
	ldr r2, _02237068 @ =0x0000FFFF
	lsls r1, r1, #1
	strh r2, [r0, r1]
	add sp, #0x10
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0223701A:
	lsls r0, r0, #2
	ldrh r0, [r7, r0]
	cmp r0, #1
	beq _0223702C
	cmp r0, #0xea
	beq _02237036
	cmp r0, #0xeb
	beq _02237040
	b _0223704A
_0223702C:
	adds r0, r5, #0
	bl ov74_02236F30
	strh r0, [r4]
	b _0223704C
_02237036:
	adds r0, r5, #0
	bl ov74_02236F44
	strh r0, [r4]
	b _0223704C
_02237040:
	adds r0, r5, #0
	bl ov74_02236F80
	strh r0, [r4]
	b _0223704C
_0223704A:
	strh r0, [r4]
_0223704C:
	ldr r0, [sp, #0xc]
	adds r6, r6, #1
	adds r4, r4, #2
	cmp r6, r0
	blo _02236FE0
_02237056:
	ldr r2, _02237068 @ =0x0000FFFF
	ldr r0, [sp, #4]
	lsls r1, r6, #1
	strh r2, [r0, r1]
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02237064: .4byte 0x0223B760
_02237068: .4byte 0x0000FFFF
	thumb_func_end ov74_02236FB8

	arm_func_start ov74_0223706C
ov74_0223706C: @ 0x0223706C
	push {r4, r5, r6, r7, r8, sb, lr}
	ldrb r7, [r0]
	ldrb r6, [r0, #1]
	add r0, r0, #4
	mov lr, #0x1000000
	add r7, lr, r7, lsl #24
	lsl r6, r6, #0x18
	ldrb sb, [r0, r7, lsr #24]
	subs r2, r2, #1
	bmi _022370CC
_02237094:
	add r6, r6, sb, lsl #24
	subs r2, r2, #1
	ldrb r8, [r0, r6, lsr #24]
	ldrb r5, [r1], #1
	strb r8, [r0, r7, lsr #24]
	strb sb, [r0, r6, lsr #24]
	add r4, sb, r8
	and r4, r4, #0xff
	add r7, r7, lr
	ldrb r4, [r0, r4]
	ldrb sb, [r0, r7, lsr #24]
	eor r5, r5, r4
	strb r5, [r3], #1
	bge _02237094
_022370CC:
	sub r7, r7, lr
	lsr r7, r7, #0x18
	lsr r6, r6, #0x18
	strb r7, [r0, #-4]
	strb r6, [r0, #-3]
	pop {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov74_0223706C

	arm_func_start ov74_022370E4
ov74_022370E4: @ 0x022370E4
	push {r4, r5, lr}
	sub sp, sp, #0x14
	mov ip, r0
	mov r4, r1
	mov r5, r2
	mov r2, r4
	add r0, sp, #0
	mov r1, ip
	mov r4, r3
	bl FUN_020E3798
	add r0, sp, #0
	mov r1, r5
	mov r2, r4
	bl ov74_02237128
	add sp, sp, #0x14
	pop {r4, r5, lr}
	bx lr
	arm_func_end ov74_022370E4

	arm_func_start ov74_02237128
ov74_02237128: @ 0x02237128
	push {r4, lr}
	sub sp, sp, #0x120
	mov r3, #0
	str r3, [sp, #0x10]
	str r3, [sp, #0x18]
	str r2, [sp]
	mov r3, #0x80
	mov r4, r0
	mov r2, r1
	ldr ip, _02237224 @ =0x00010001
	str r3, [sp, #4]
	add r0, sp, #0x1c
	mov r1, #0x100
	str ip, [sp, #8]
	bl ov74_02237564
	mov r1, r0
	add r0, sp, #0x1c
	add r2, sp, #0xc
	add r3, sp, #0x10
	bl ov74_022373CC
	cmp r0, #0
	addeq sp, sp, #0x120
	moveq r0, #0
	popeq {r4, lr}
	bxeq lr
	add r1, sp, #0x14
	add r0, sp, #0x18
	str r1, [sp]
	str r0, [sp, #4]
	mov r2, #0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	mov r3, r2
	bl ov74_02237228
	cmp r0, #0
	addeq sp, sp, #0x120
	moveq r0, #0
	popeq {r4, lr}
	bxeq lr
	ldr r0, [sp, #0x18]
	cmp r0, #0x14
	addne sp, sp, #0x120
	movne r0, #0
	popne {r4, lr}
	bxne lr
	ldr r2, [sp, #0x14]
	mov r3, #0
_022371E4:
	ldrb r1, [r2]
	ldrb r0, [r4]
	cmp r1, r0
	addne sp, sp, #0x120
	movne r0, #0
	popne {r4, lr}
	bxne lr
	add r3, r3, #1
	cmp r3, #0x14
	add r4, r4, #1
	add r2, r2, #1
	blt _022371E4
	mov r0, #1
	add sp, sp, #0x120
	pop {r4, lr}
	bx lr
	.align 2, 0
_02237224: .4byte 0x00010001
	arm_func_end ov74_02237128

	arm_func_start ov74_02237228
ov74_02237228: @ 0x02237228
	push {r0, r1, r2, r3}
	push {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r2
	mov r4, r3
	add r0, sp, #0x10
	add r1, sp, #0x14
	mov r2, #0x30
	mov r3, #0
	bl ov74_02237490
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	add r0, sp, #0x10
	add r1, sp, #0x14
	mov r2, #0x30
	mov r3, #0
	bl ov74_02237490
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	add r0, sp, #0x10
	add r1, sp, #0x14
	add r3, sp, #0
	mov r2, #6
	bl ov74_02237490
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	cmp r5, #0
	ldrne r0, [sp, #0x10]
	strne r0, [r5]
	cmp r4, #0
	ldrne r0, [sp]
	strne r0, [r4]
	ldr r2, [sp]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r0, r0, r2
	str r0, [sp, #0x10]
	cmp r1, r2
	addlo sp, sp, #4
	movlo r0, #0
	poplo {r4, r5, lr}
	addlo sp, sp, #0x10
	bxlo lr
	sub ip, r1, r2
	add r0, sp, #0x10
	add r1, sp, #0x14
	add r3, sp, #0
	mov r2, #5
	str ip, [sp, #0x14]
	bl ov74_02237490
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r2, [sp]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r0, r0, r2
	str r0, [sp, #0x10]
	cmp r1, r2
	addlo sp, sp, #4
	movlo r0, #0
	poplo {r4, r5, lr}
	addlo sp, sp, #0x10
	bxlo lr
	sub ip, r1, r2
	add r0, sp, #0x10
	add r1, sp, #0x14
	add r3, sp, #0
	mov r2, #4
	str ip, [sp, #0x14]
	bl ov74_02237490
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r1, [sp, #0x20]
	cmp r1, #0
	ldrne r0, [sp, #0x10]
	strne r0, [r1]
	ldr r1, [sp, #0x24]
	cmp r1, #0
	ldrne r0, [sp]
	strne r0, [r1]
	mov r0, #1
	add sp, sp, #4
	pop {r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov74_02237228

	arm_func_start ov74_022373CC
ov74_022373CC: @ 0x022373CC
	stmdb sp!, {lr}
	sub sp, sp, #4
	cmp r1, #0xa
	addlo sp, sp, #4
	movlo r0, #0
	ldmlo sp!, {lr}
	bxlo lr
	ldrb ip, [r0]
	add lr, r0, r1
	cmp ip, #1
	addne sp, sp, #4
	movne r0, #0
	ldmne sp!, {lr}
	bxne lr
	add ip, r0, #1
	mov r1, #0
_0223740C:
	ldrb r0, [ip], #1
	cmp r0, #0xff
	addne sp, sp, #4
	movne r0, #0
	ldmne sp!, {lr}
	bxne lr
	add r1, r1, #1
	cmp r1, #8
	blt _0223740C
	cmp ip, lr
	beq _02237450
_02237438:
	ldrb r0, [ip]
	cmp r0, #0xff
	bne _02237450
	add ip, ip, #1
	cmp ip, lr
	bne _02237438
_02237450:
	cmp ip, lr
	addeq sp, sp, #4
	moveq r0, #0
	ldmeq sp!, {lr}
	bxeq lr
	ldrb r0, [ip]
	cmp r0, #0
	movne r0, #0
	addeq r0, ip, #1
	subeq r1, lr, r0
	streq r1, [r3]
	streq r0, [r2]
	moveq r0, #1
	add sp, sp, #4
	ldm sp!, {lr}
	bx lr
	arm_func_end ov74_022373CC

	arm_func_start ov74_02237490
ov74_02237490: @ 0x02237490
	push {r4, r5, r6, lr}
	ldr r5, [r0]
	mov r6, #0
	ldrb r4, [r5]
	add r5, r5, #1
	mov ip, r6
	cmp r4, r2
	ldr r2, [r1]
	movne r0, r6
	popne {r4, r5, r6, lr}
	bxne lr
	cmp r2, #1
	movlo r0, r6
	poplo {r4, r5, r6, lr}
	bxlo lr
	ldrb lr, [r5]
	sub r4, r2, #1
	ands r2, lr, #0x80
	beq _0223752C
	and r2, lr, #0x7f
	and lr, r2, #0xff
	add r2, lr, #1
	cmp r4, r2
	movlo r0, r6
	poplo {r4, r5, r6, lr}
	bxlo lr
	cmp r3, #0
	sub r6, r4, lr
	beq _02237524
	ldrb r2, [r5, #1]
	add r5, r5, #1
	and r4, r2, #0x7f
_02237510:
	sub r2, lr, #1
	add ip, r4, ip, lsl #7
	ands lr, r2, #0xff
	bne _02237510
	b _02237548
_02237524:
	add r5, r5, lr
	b _02237548
_0223752C:
	add r5, r5, #1
	cmp r4, #1
	mov ip, lr
	movlo r0, r6
	poplo {r4, r5, r6, lr}
	bxlo lr
	sub r6, r4, #1
_02237548:
	str r5, [r0]
	str r6, [r1]
	cmp r3, #0
	strne ip, [r3]
	mov r0, #1
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end ov74_02237490

	arm_func_start ov74_02237564
ov74_02237564: @ 0x02237564
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x58
	movs r6, r0
	mov r5, r1
	mov r8, r2
	mov r7, r3
	beq _02237594
	cmp r8, #0
	beq _02237594
	ldr r0, [sp, #0x70]
	cmp r0, #0
	bne _022375A4
_02237594:
	add sp, sp, #0x58
	mvn r0, #2
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
_022375A4:
	bl ov74_0223AFA4
	mov r4, r0
	add r0, sp, #4
	bl ov74_0223B024
	add r0, sp, #0x18
	bl ov74_0223B024
	add r0, sp, #0x2c
	bl ov74_0223B024
	add r0, sp, #0x40
	bl ov74_0223B024
	cmp r4, #0
	mvneq r5, #1
	beq _02237680
	add r2, sp, #4
	mov r0, r8
	mov r1, r7
	bl ov74_0223AC60
	cmp r0, #0
	mvneq r5, #1
	beq _02237680
	ldr r1, [sp, #0x78]
	add r0, sp, #0x2c
	bl ov74_0223AD74
	cmp r0, #0
	mvneq r5, #1
	beq _02237680
	ldr r0, [sp, #0x70]
	ldr r1, [sp, #0x74]
	add r2, sp, #0x40
	bl ov74_0223AC60
	cmp r0, #0
	mvneq r5, #1
	beq _02237680
	add r0, sp, #0x18
	add r1, sp, #4
	add r2, sp, #0x2c
	add r3, sp, #0x40
	str r4, [sp]
	bl ov74_022391B0
	cmp r0, #0
	mvneq r5, #1
	beq _02237680
	add r0, sp, #0x18
	bl ov74_0223B180
	add r1, r0, #7
	asr r0, r1, #2
	add r0, r1, r0, lsr #29
	asr r0, r0, #3
	cmp r0, r5
	mvngt r5, #0
	bgt _02237680
	add r0, sp, #0x18
	mov r1, r6
	bl ov74_0223ABE4
	mov r5, r0
_02237680:
	add r0, sp, #4
	bl ov74_0223B104
	add r0, sp, #0x18
	bl ov74_0223B104
	add r0, sp, #0x2c
	bl ov74_0223B104
	add r0, sp, #0x40
	bl ov74_0223B104
	cmp r4, #0
	beq _022376B0
	mov r0, r4
	bl ov74_0223AF34
_022376B0:
	mov r0, r5
	add sp, sp, #0x58
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end ov74_02237564

	arm_func_start ov74_022376C0
ov74_022376C0: @ 0x022376C0
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x7c
	mov r4, #0
	mov r5, r3
	mov r3, r4
	str r3, [sp, #0x34]
	ldr r3, [r5]
	str r0, [sp, #4]
	mov r0, r4
	ldr r3, [r3]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	ands r0, r3, #1
	ldr r0, [sp, #0xa0]
	str r4, [sp, #8]
	str r0, [sp, #0xa0]
	mov r7, r1
	mov r6, r2
	addeq sp, sp, #0x7c
	moveq r0, r4
	popeq {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	ldr r1, [r7, #4]
	ldr r0, [r0]
	cmp r1, #0
	str r0, [sp, #0xc]
	beq _02237744
	cmp r1, #1
	bne _02237760
	ldr r0, [r7]
	ldr r0, [r0]
	cmp r0, #0
	bne _02237760
_02237744:
	ldr r0, [sp, #4]
	mov r1, #0
	bl ov74_0223AD74
	add sp, sp, #0x7c
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_02237760:
	ldr r1, [r6, #4]
	cmp r1, #0
	beq _02237784
	cmp r1, #1
	bne _022377A0
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r0, #0
	bne _022377A0
_02237784:
	ldr r0, [sp, #4]
	mov r1, #1
	bl ov74_0223AD74
	add sp, sp, #0x7c
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_022377A0:
	cmp r1, #1
	bne _022377D4
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r0, #1
	bne _022377D4
	ldr r0, [sp, #4]
	mov r1, r7
	bl ov74_0223AE1C
	add sp, sp, #0x7c
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_022377D4:
	ldr r0, [sp, #0xa4]
	str r0, [sp, #0x18]
	cmp r0, #0
	bne _02237808
	bl ov74_02238858
	str r0, [sp, #0x18]
	cmp r0, #0
	beq _02237E64
	ldr r2, [sp, #0xa0]
	mov r1, r5
	bl ov74_0223888C
	cmp r0, #0
	beq _02237E64
_02237808:
	ldr r3, [sp, #0xa0]
	add r1, sp, #0x34
	mov r4, r3
	ldr r4, [r4, #0x10c]
	mov r0, r6
	mov r2, #0
	str r4, [sp, #0x1c]
	bl ov74_02238C20
	cmp r0, #0
	beq _02237E64
	ldr r0, [sp, #0xa0]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0xa0]
	str r1, [r0]
	ldr r0, [sp, #0x34]
	ldrb r1, [r0, #2]
	ldrb r0, [r0, #3]
	str r0, [sp, #0x10]
	add r0, r1, #0x3f
	bl FUN_020F2998
	ldr r1, [sp, #0x34]
	mov r4, r0
	add r0, r1, #4
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x18]
	ldr r3, [r7, #4]
	ldr sl, [r0, #0x24]
	cmp r3, sl
	bne _022378A0
	ldr r1, [r7]
	sub r2, sl, #1
	ldr r0, [r5]
	ldr r1, [r1, r2, lsl #2]
	ldr r0, [r0, r2, lsl #2]
	cmp r1, r0
	strlo r7, [sp, #0x14]
	blo _02237958
_022378A0:
	cmp r3, sl
	bge _02237914
	ldr r0, [sp, #0xa0]
	ldr r3, [r0]
	add r1, r0, #4
	add r2, r3, #1
	str r2, [r0]
	mov r0, #0x14
	mla r0, r3, r0, r1
	ldr r2, [r7, #4]
	mov r1, r0
	str r2, [r1, #4]
	mov r1, sl
	str r0, [sp, #0x14]
	bl ov74_0223B084
	ldr r0, [r7, #4]
	mov r2, #0
	cmp r0, #0
	ble _02237958
_022378EC:
	ldr r1, [r7]
	ldr r0, [sp, #0x14]
	ldr r1, [r1, r2, lsl #2]
	ldr r0, [r0]
	str r1, [r0, r2, lsl #2]
	ldr r0, [r7, #4]
	add r2, r2, #1
	cmp r2, r0
	blt _022378EC
	b _02237958
_02237914:
	ldr r0, [sp, #0xa0]
	mov r2, r5
	ldr r3, [r0]
	mov r1, r7
	add r5, r3, #1
	str r5, [r0]
	add r5, r0, #4
	mov r0, #0x14
	mla r0, r3, r0, r5
	ldr r3, [sp, #0xa0]
	str r0, [sp, #0x14]
	bl ov74_0223920C
	cmp r0, #0
	beq _02237E64
	ldr r0, [sp, #0x14]
	mov r1, sl
	bl ov74_0223B084
_02237958:
	ldr r0, [sp, #0xa0]
	ldr r3, [r0]
	ldr r0, [r6, #4]
	add r1, r3, #1
	mul r2, r0, r4
	ldr r0, [sp, #0xa0]
	lsl r4, r2, #1
	str r1, [r0]
	ldr r1, [r0]
	add r4, r4, #7
	add r2, r1, #1
	str r2, [r0]
	ldr r2, [sp, #0x10]
	ldr r0, [r0]
	mul r5, r2, sl
	asr r2, r4, #1
	add r2, r4, r2, lsr #30
	add r5, r5, r2, asr #2
	ldr r2, [sp, #0xa0]
	mov r6, #0x14
	add r2, r2, #4
	mla r8, r1, r6, r2
	mla r4, r3, r6, r2
	ldr r1, [sp, #0xa0]
	add r3, r0, #1
	mla r7, r0, r6, r2
	str r3, [r1]
	mov r0, r1
	ldr r0, [r0]
	mla r6, r0, r6, r2
	add r1, r0, #1
	ldr r0, [sp, #0xa0]
	str r1, [r0]
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	cmp sl, r0
	ldrle r0, [sp, #4]
	ble _022379FC
	ldr r0, [sp, #4]
	mov r1, sl
	bl ov74_0223AEB4
_022379FC:
	cmp r0, #0
	beq _02237E64
	ldr r0, [r8, #8]
	lsl r1, sl, #2
	cmp r1, r0
	movle r0, r8
	ble _02237A20
	mov r0, r8
	bl ov74_0223AEB4
_02237A20:
	cmp r0, #0
	beq _02237E64
	ldr r1, [r7, #8]
	lsl r0, sl, #1
	str r0, [sp, #0x24]
	cmp r0, r1
	movle r0, r7
	ble _02237A4C
	ldr r1, [sp, #0x24]
	mov r0, r7
	bl ov74_0223AEB4
_02237A4C:
	cmp r0, #0
	beq _02237E64
	ldr r0, [r4, #8]
	cmp r5, r0
	movle r0, r4
	ble _02237A70
	mov r1, r5
	mov r0, r4
	bl ov74_0223AEB4
_02237A70:
	cmp r0, #0
	beq _02237E64
	ldr r1, [r6, #8]
	ldr r0, [sp, #0x24]
	cmp r0, r1
	movle r0, r6
	ble _02237A98
	ldr r1, [sp, #0x24]
	mov r0, r6
	bl ov74_0223AEB4
_02237A98:
	cmp r0, #0
	beq _02237E64
	ldr r0, [sp, #0x18]
	ldr fp, [r8]
	ldr r8, [r7]
	ldr r6, [r6]
	ldr r1, [r4]
	ldr r7, [r0, #0x48]
	ldr r5, [r0, #0x20]
	ldr r3, [sp, #0x18]
	str r1, [sp, #0x38]
	str sl, [sp]
	ldr r1, [sp, #0x14]
	ldr r3, [r3, #0xc]
	ldr r1, [r1]
	mov r0, r6
	mov r2, sl
	bl ov74_022397E0
	str r7, [sp]
	ldr r0, [sp, #0x38]
	mov r1, r6
	mov r2, r5
	mov r3, sl
	bl ov74_02238E28
	ldr r0, [sp, #0x10]
	cmp r0, #1
	ble _02237BA0
	ldr r1, [sp, #0x38]
	mov r0, r6
	mov r2, sl
	mov r3, fp
	bl ov74_02238F68
	mov r0, fp
	mov r1, r6
	mov r2, r5
	mov r3, sl
	str r7, [sp]
	bl ov74_02238E28
	ldr r0, [sp, #0x10]
	mov r4, #1
	cmp r0, #1
	ble _02237BA0
	lsl r0, sl, #2
	str r0, [sp, #0x28]
	add sb, sp, #0x38
_02237B4C:
	sub r3, r4, #1
	ldr r2, [sb, r3, lsl #2]
	ldr r1, [sp, #0x28]
	mov r0, r6
	add r1, r2, r1
	str r1, [sb, r4, lsl #2]
	str sl, [sp]
	ldr r1, [sb, r3, lsl #2]
	mov r2, sl
	mov r3, fp
	bl ov74_022397E0
	str r7, [sp]
	ldr r0, [sb, r4, lsl #2]
	mov r1, r6
	mov r2, r5
	mov r3, sl
	bl ov74_02238E28
	ldr r0, [sp, #0x10]
	add r4, r4, #1
	cmp r4, r0
	blt _02237B4C
_02237BA0:
	ldr r3, [sp, #0x34]
	add r0, r3, #1
	str r0, [sp, #0x34]
	add r2, r0, #1
	ldrb r1, [r3]
	str r2, [sp, #0x34]
	ldrb sb, [r3, #1]
	cmp sb, #0xff
	bne _02237C20
	cmp r1, #0
	bne _02237C20
	add r0, r2, #1
	str r0, [sp, #0x34]
	ldrb r1, [r2]
	b _02237BF0
_02237BDC:
	add sb, sb, #0x100
	ldr r1, [sp, #0x34]
	add r1, r1, #2
	str r1, [sp, #0x34]
	ldrb r1, [r0, #1]
_02237BF0:
	ldr r0, [sp, #0x34]
	ldrb r2, [r0]
	cmp r2, #0xff
	bne _02237C08
	cmp r1, #0
	beq _02237BDC
_02237C08:
	ldr r2, [sp, #0x34]
	add r2, r2, #1
	str r2, [sp, #0x34]
	ldrb r0, [r0]
	add r0, r0, #1
	add sb, sb, r0
_02237C20:
	asr r2, r1, #1
	add r0, sp, #0x38
	ldr r0, [r0, r2, lsl #2]
	mov r1, r8
	lsl r2, sl, #2
	bl FUN_020D4A50
	cmp sb, #0
	beq _02237DF8
	mov r0, #0xff
	str r0, [sp, #0x2c]
	mov r0, #0
	str r0, [sp, #0x30]
_02237C50:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _02237C84
	mov r3, r0
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x20]
	ldr r3, [r3]
	blx r3
	cmp r0, #0
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	bne _02237E64
_02237C84:
	ldr r0, [sp, #0xa0]
	ldr r0, [r0, #0x108]
	ands r0, r0, #0x4000
	bne _02237E64
	cmp sb, #0
	ldr r4, [sp, #0x30]
	ble _02237CD8
_02237CA0:
	mov r0, r6
	mov r1, r8
	mov r2, sl
	mov r3, fp
	bl ov74_02238F68
	str r7, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, sl
	bl ov74_02238E28
	add r4, r4, #1
	cmp r4, sb
	blt _02237CA0
_02237CD8:
	ldr r2, [sp, #0x34]
	add r0, r2, #1
	str r0, [sp, #0x34]
	add r1, r0, #1
	ldrb r0, [r2]
	str r1, [sp, #0x34]
	ldrb sb, [r2, #1]
	cmp sb, #0xff
	bne _02237D58
	cmp r0, #0
	bne _02237D58
	add r0, r1, #1
	str r0, [sp, #0x34]
	ldrb r0, [r1]
	b _02237D28
_02237D14:
	add sb, sb, #0x100
	ldr r0, [sp, #0x34]
	add r0, r0, #2
	str r0, [sp, #0x34]
	ldrb r0, [r1, #1]
_02237D28:
	ldr r1, [sp, #0x34]
	ldrb r2, [r1]
	cmp r2, #0xff
	bne _02237D40
	cmp r0, #0
	beq _02237D14
_02237D40:
	ldr r2, [sp, #0x34]
	add r2, r2, #1
	str r2, [sp, #0x34]
	ldrb r1, [r1]
	add r1, r1, #1
	add sb, sb, r1
_02237D58:
	cmp r0, #0
	bne _02237D68
	cmp sb, #0
	beq _02237DF8
_02237D68:
	cmp sb, #0
	bne _02237D78
	cmp r0, #1
	beq _02237DB4
_02237D78:
	asr r1, r0, #1
	str sl, [sp]
	add r0, sp, #0x38
	ldr r3, [r0, r1, lsl #2]
	mov r0, r6
	mov r1, r8
	mov r2, sl
	bl ov74_022397E0
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, sl
	str r7, [sp]
	bl ov74_02238E28
	b _02237DF0
_02237DB4:
	ldr r0, [sp, #0x14]
	str sl, [sp]
	ldr r3, [r0]
	mov r0, r6
	mov r1, r8
	mov r2, sl
	bl ov74_022397E0
	ldr r0, [sp, #4]
	str r7, [sp]
	ldr r0, [r0]
	mov r1, r6
	mov r2, r5
	mov r3, sl
	bl ov74_02238E28
	b _02237E3C
_02237DF0:
	cmp sb, #0
	bne _02237C50
_02237DF8:
	ldr r0, [sp, #0x24]
	mov r2, sl
	cmp sl, r0
	bge _02237E20
	mov r1, #0
_02237E0C:
	ldr r0, [sp, #0x24]
	str r1, [r8, r2, lsl #2]
	add r2, r2, #1
	cmp r2, r0
	blt _02237E0C
_02237E20:
	ldr r0, [sp, #4]
	str r7, [sp]
	ldr r0, [r0]
	mov r1, r8
	mov r2, r5
	mov r3, sl
	bl ov74_02238E28
_02237E3C:
	ldr r0, [sp, #0xa0]
	ldr r0, [r0, #0x108]
	ands r0, r0, #0x4000
	bne _02237E64
	ldr r0, [sp, #4]
	mov r1, r0
	str sl, [r1, #4]
	bl ov74_0223B038
	mov r0, #1
	str r0, [sp, #8]
_02237E64:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _02237E8C
	ldr r3, [r0]
	mov r1, #0xff
	mvn r2, #0
	blx r3
	cmp r0, #0
	movne r0, #0
	strne r0, [sp, #8]
_02237E8C:
	ldr r0, [sp, #0xa4]
	cmp r0, #0
	bne _02237EA8
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _02237EA8
	bl ov74_022387DC
_02237EA8:
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #0xa0]
	ldr r0, [sp, #8]
	str r2, [r1]
	add sp, sp, #0x7c
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end ov74_022376C0

	arm_func_start ov74_02237EC4
ov74_02237EC4: @ 0x02237EC4
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18c
	mov sl, r0
	mov r0, #0
	str r0, [sp, #8]
	mov r5, r1
	ldr r1, [sp, #8]
	mov r0, r2
	str r2, [sp, #4]
	mov r4, r3
	str r1, [sp, #0xc]
	ldr sb, [sp, #0x1b0]
	bl ov74_0223B180
	ldr r1, [r5, #4]
	mov r8, r0
	cmp r1, #0
	beq _02237F20
	cmp r1, #1
	bne _02237F3C
	ldr r0, [r5]
	ldr r0, [r0]
	cmp r0, #0
	bne _02237F3C
_02237F20:
	mov r0, sl
	mov r1, #0
	bl ov74_0223AD74
	add sp, sp, #0x18c
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_02237F3C:
	ldr r0, [sp, #4]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _02237F64
	cmp r1, #1
	bne _02237F80
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	bne _02237F80
_02237F64:
	mov r0, sl
	mov r1, #1
	bl ov74_0223AD74
	add sp, sp, #0x18c
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_02237F80:
	cmp r1, #1
	bne _02237FB8
	ldr r0, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #1
	bne _02237FB8
	mov r0, sl
	mov r1, r5
	bl ov74_0223AE1C
	add sp, sp, #0x18c
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_02237FB8:
	add r0, sp, #0x18
	bl ov74_022387B4
	add r0, sp, #0x18
	mov r1, r4
	mov r2, sb
	bl ov74_0223873C
	cmp r0, #0
	ble _02238204
	add r0, sp, #0x4c
	bl ov74_0223B024
	ldr r2, [sb]
	add r1, sb, #4
	mov r0, #0x14
	mla r6, r2, r0, r1
	add r1, r2, #1
	str r1, [sb]
	mov r2, r4
	mov r4, #1
	add r0, sp, #0x4c
	mov r1, r5
	mov r3, sb
	str r4, [sp, #0xc]
	bl ov74_0223920C
	cmp r0, #0
	beq _02238204
	add r1, sp, #0x4c
	add r3, sp, #0x18
	mov r0, r6
	mov r2, r1
	str sb, [sp]
	bl ov74_02238690
	cmp r0, #0
	beq _02238204
	cmp r8, #0x11
	movle fp, r4
	ble _02238060
	cmp r8, #0x100
	movge fp, #5
	bge _02238060
	cmp r8, #0x80
	movge fp, #4
	movlt fp, #3
_02238060:
	sub r0, fp, #1
	mov r4, #1
	lsl r7, r4, r0
	cmp r7, #1
	ble _022380BC
	add r5, sp, #0x60
_02238078:
	mov r0, r5
	bl ov74_0223B024
	sub r3, r4, #1
	mov r2, #0x14
	add r1, sp, #0x4c
	mla r1, r3, r2, r1
	mov r0, r5
	mov r2, r6
	add r3, sp, #0x18
	str sb, [sp]
	bl ov74_02238690
	cmp r0, #0
	beq _02238204
	add r4, r4, #1
	cmp r4, r7
	add r5, r5, #0x14
	blt _02238078
_022380BC:
	mov r5, #1
	mov r0, sl
	mov r1, r5
	str r4, [sp, #0xc]
	sub r8, r8, #1
	bl ov74_0223AD74
	cmp r0, #0
	beq _02238204
	mov r0, r5
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
_022380EC:
	ldr r0, [sp, #4]
	mov r1, r8
	bl ov74_0223AA84
	cmp r0, #0
	bne _02238138
	cmp r5, #0
	bne _02238128
	mov r0, sl
	mov r1, sl
	mov r2, sl
	add r3, sp, #0x18
	str sb, [sp]
	bl ov74_02238690
	cmp r0, #0
	beq _02238204
_02238128:
	cmp r8, #0
	beq _022381FC
	sub r8, r8, #1
	b _022380EC
_02238138:
	ldr r6, [sp, #0x10]
	ldr r7, [sp, #0x14]
	cmp fp, #1
	mov r4, r6
	ble _0223817C
_0223814C:
	subs r1, r8, r4
	bmi _0223817C
	ldr r0, [sp, #4]
	bl ov74_0223AA84
	cmp r0, #0
	subne r0, r4, r7
	lslne r0, r6, r0
	movne r7, r4
	add r4, r4, #1
	orrne r6, r0, #1
	cmp r4, fp
	blt _0223814C
_0223817C:
	cmp r5, #0
	add r5, r7, #1
	bne _022381C0
	cmp r5, #0
	ldr r4, [sp, #0x14]
	ble _022381C0
_02238194:
	mov r0, sl
	mov r1, sl
	mov r2, sl
	add r3, sp, #0x18
	str sb, [sp]
	bl ov74_02238690
	cmp r0, #0
	beq _02238204
	add r4, r4, #1
	cmp r4, r5
	blt _02238194
_022381C0:
	asr r3, r6, #1
	mov r1, #0x14
	add r0, sp, #0x4c
	mla r2, r3, r1, r0
	mov r0, sl
	mov r1, sl
	add r3, sp, #0x18
	str sb, [sp]
	bl ov74_02238690
	cmp r0, #0
	beq _02238204
	add r0, r7, #1
	ldr r5, [sp, #0x14]
	subs r8, r8, r0
	bpl _022380EC
_022381FC:
	mov r0, #1
	str r0, [sp, #8]
_02238204:
	ldr r0, [sp, #0xc]
	ldr r1, [sb]
	cmp r0, #0
	sub r0, r1, #1
	str r0, [sb]
	mov r4, #0
	ble _02238240
	add r5, sp, #0x4c
_02238224:
	mov r0, r5
	bl ov74_0223B15C
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	cmp r4, r0
	add r5, r5, #0x14
	blt _02238224
_02238240:
	add r0, sp, #0x18
	bl ov74_02238780
	ldr r0, [sp, #8]
	add sp, sp, #0x18c
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end ov74_02237EC4

	arm_func_start ov74_02238258
ov74_02238258: @ 0x02238258
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #4
	movs r8, r2
	mov sl, r0
	mov sb, r1
	mov fp, #0
	mov r5, #2
	addeq sp, sp, #4
	mvneq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	mov r0, r8
	bl ov74_0223B1B4
	cmp r0, #0x20
	beq _022382AC
	mov r1, #1
	cmp sl, r1, lsl r0
	addhi sp, sp, #4
	movhi r0, fp
	pophi {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxhi lr
_022382AC:
	cmp sl, r8
	rsb r2, r0, #0x20
	subhs sl, sl, r8
	cmp r2, #0
	lslne r1, sl, r2
	rsbne r0, r2, #0x20
	orrne sl, r1, sb, lsr r0
	lslne r8, r8, r2
	ldr r4, _02238394 @ =0x0000FFFF
	lslne sb, sb, r2
	and r7, r4, r8, lsr #16
	and r6, r8, r4
_022382DC:
	lsr r0, sl, #0x10
	cmp r0, r7
	moveq r0, r4
	beq _022382F8
	mov r0, sl
	mov r1, r7
	bl FUN_020F2BA4
_022382F8:
	mul ip, r0, r7
	mul r3, r0, r6
	and r2, r4, sb, lsr #16
_02238304:
	mov lr, #0x10000
	sub r1, sl, ip
	rsb lr, lr, #0
	ands lr, r1, lr
	bne _02238330
	add r1, r2, r1, lsl #16
	cmp r3, r1
	subhi ip, ip, r7
	subhi r3, r3, r6
	subhi r0, r0, #1
	bhi _02238304
_02238330:
	mul r2, r0, r6
	and r1, r2, r4
	mul r3, r0, r7
	lsl r1, r1, #0x10
	cmp sb, r1
	add r2, r3, r2, lsr #16
	addlo r2, r2, #1
	cmp sl, r2
	addlo sl, sl, r8
	sub sb, sb, r1
	sublo r0, r0, #1
	sub r1, sl, r2
	subs r5, r5, #1
	beq _02238384
	and r2, r0, r4
	lsl r1, r1, #0x10
	and r0, sb, r4
	orr sl, r1, sb, lsr #16
	lsl fp, r2, #0x10
	lsl sb, r0, #0x10
	b _022382DC
_02238384:
	orr r0, fp, r0
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02238394: .4byte 0x0000FFFF
	arm_func_end ov74_02238258

	arm_func_start ov74_02238398
ov74_02238398: @ 0x02238398
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r8, r0
	add r0, sp, #4
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mvn r4, #0
	bl ov74_0223B024
	add r0, sp, #4
	mov r1, #0
	bl ov74_0223AD74
	add r0, sp, #4
	mov r1, r6
	bl ov74_0223AAF4
	cmp r0, #0
	beq _022383FC
	add r2, sp, #4
	mov r0, r8
	mov r3, r7
	mov r1, #0
	str r5, [sp]
	bl ov74_02239240
	cmp r0, #0
	movne r4, r6
_022383FC:
	add r0, sp, #4
	bl ov74_0223B104
	mov r0, r4
	add sp, sp, #0x18
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end ov74_02238398

	arm_func_start ov74_02238414
ov74_02238414: @ 0x02238414
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r6, [sp, #0x30]
	mov sb, r1
	ldr fp, [r6]
	movs sl, r0
	add r0, fp, #1
	str r0, [r6]
	ldr r7, [r6]
	add r4, r6, #4
	mov r0, #0x14
	mla r5, fp, r0, r4
	add ip, r7, #1
	mov r1, #0
	str r5, [sp, #4]
	mla r5, r7, r0, r4
	str ip, [r6]
	str r1, [sp]
	ldreq r1, [r6]
	mov r8, r2
	mlaeq sl, r1, r0, r4
	addeq r0, r1, #1
	streq r0, [r6]
	mov r7, r3
	cmp sb, #0
	bne _02238494
	ldr r2, [r6]
	add r1, r6, #4
	mov r0, #0x14
	mla sb, r2, r0, r1
	add r0, r2, #1
	str r0, [r6]
_02238494:
	mov r0, r8
	mov r1, r7
	bl ov74_0223AB90
	cmp r0, #0
	bge _022384D4
	mov r0, sl
	mov r1, #0
	bl ov74_0223AD74
	mov r0, sb
	mov r1, r8
	bl ov74_0223AE1C
	add sp, sp, #0xc
	str fp, [r6]
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_022384D4:
	mov r0, r8
	bl ov74_0223B180
	ldr r1, [r7, #0x28]
	mov r2, r0
	lsl r0, r1, #1
	cmp r0, r2
	movgt r2, r0
	suble r0, r2, r0
	movgt r4, #0
	addle r0, r0, r0, lsr #31
	asrle r4, r0, #1
	ldr r1, [r7, #0x2c]
	add r0, r2, r2, lsr #31
	asr r0, r0, #1
	cmp r2, r1
	str r0, [sp, #8]
	beq _0223852C
	mov r1, r7
	mov r3, r6
	add r0, r7, #0x14
	bl ov74_02238398
	str r0, [r7, #0x2c]
_0223852C:
	ldr r2, [sp, #8]
	ldr r0, [sp, #4]
	mov r1, r8
	sub r2, r2, r4
	bl ov74_0223A12C
	cmp r0, #0
	beq _0223867C
	ldr r1, [sp, #4]
	mov r0, r5
	mov r3, r6
	add r2, r7, #0x14
	bl ov74_02239904
	cmp r0, #0
	beq _0223867C
	ldr r2, [sp, #8]
	mov r0, sl
	mov r1, r5
	add r2, r2, r4
	bl ov74_0223A12C
	cmp r0, #0
	beq _0223867C
	mov r4, #0
	mov r0, r5
	mov r1, r7
	mov r2, sl
	mov r3, r6
	str r4, [sl, #0xc]
	bl ov74_02239904
	cmp r0, #0
	beq _0223867C
	mov r0, sb
	mov r1, r8
	mov r2, r5
	bl ov74_02239B48
	cmp r0, #0
	beq _0223867C
	mov r5, r4
	mov r0, sb
	mov r1, r7
	str r5, [sb, #0xc]
	bl ov74_0223AB90
	cmp r0, #0
	blt _02238628
	mov r4, #1
_022385DC:
	cmp r5, #2
	add r5, r5, #1
	bgt _0223867C
	mov r0, sb
	mov r1, sb
	mov r2, r7
	bl ov74_02239B48
	cmp r0, #0
	beq _0223867C
	mov r0, sl
	mov r1, r4
	bl ov74_0223A004
	cmp r0, #0
	beq _0223867C
	mov r0, sb
	mov r1, r7
	bl ov74_0223AB90
	cmp r0, #0
	bge _022385DC
_02238628:
	ldr r0, [sb, #4]
	mov r1, #1
	cmp r0, #0
	beq _02238654
	cmp r0, #1
	bne _02238650
	ldr r0, [sb]
	ldr r0, [r0]
	cmp r0, #0
	beq _02238654
_02238650:
	mov r1, #0
_02238654:
	cmp r1, #0
	movne r0, #0
	ldreq r0, [r8, #0xc]
	str r0, [sb, #0xc]
	mov r0, #1
	ldr r2, [r8, #0xc]
	ldr r1, [r7, #0xc]
	str r0, [sp]
	eor r0, r2, r1
	str r0, [sl, #0xc]
_0223867C:
	ldr r0, [sp]
	str fp, [r6]
	add sp, sp, #0xc
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end ov74_02238414

	arm_func_start ov74_02238690
ov74_02238690: @ 0x02238690
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r4, [sp, #0x20]
	mov ip, #0x14
	ldr r5, [r4]
	add lr, r4, #4
	mla r6, r5, ip, lr
	add ip, r5, #1
	mov r8, r0
	mov r7, r3
	str ip, [r4]
	cmp r2, #0
	mov r5, #0
	beq _02238700
	cmp r1, r2
	bne _022386E8
	mov r0, r6
	mov r2, r4
	bl ov74_02239054
	cmp r0, #0
	bne _02238704
	b _02238720
_022386E8:
	mov r0, r6
	mov r3, r4
	bl ov74_02239904
	cmp r0, #0
	bne _02238704
	b _02238720
_02238700:
	mov r6, r1
_02238704:
	mov r1, r8
	mov r2, r6
	mov r3, r7
	mov r0, #0
	str r4, [sp]
	bl ov74_02238414
	mov r5, #1
_02238720:
	ldr r1, [r4]
	mov r0, r5
	sub r1, r1, #1
	str r1, [r4]
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end ov74_02238690

	arm_func_start ov74_0223873C
ov74_0223873C: @ 0x0223873C
	push {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r0
	mov r4, r1
	bl ov74_0223AE1C
	add r0, r5, #0x14
	mov r1, #0
	bl ov74_0223AD74
	mov r0, r4
	bl ov74_0223B180
	str r0, [r5, #0x28]
	mov r0, #0
	str r0, [r5, #0x2c]
	mov r0, #1
	add sp, sp, #4
	pop {r4, r5, lr}
	bx lr
	arm_func_end ov74_0223873C

	arm_func_start ov74_02238780
ov74_02238780: @ 0x02238780
	push {r4, lr}
	mov r4, r0
	bl ov74_0223B104
	add r0, r4, #0x14
	bl ov74_0223B104
	ldr r0, [r4, #0x30]
	ands r0, r0, #1
	popeq {r4, lr}
	bxeq lr
	mov r0, r4
	bl ov74_0223B230
	pop {r4, lr}
	bx lr
	arm_func_end ov74_02238780

	arm_func_start ov74_022387B4
ov74_022387B4: @ 0x022387B4
	push {r4, lr}
	mov r4, r0
	bl ov74_0223B024
	add r0, r4, #0x14
	bl ov74_0223B024
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	pop {r4, lr}
	bx lr
	arm_func_end ov74_022387B4

	arm_func_start ov74_022387DC
ov74_022387DC: @ 0x022387DC
	push {r4, lr}
	mov r4, r0
	add r0, r4, #0xc
	bl ov74_0223B104
	add r0, r4, #0x20
	bl ov74_0223B104
	add r0, r4, #0x34
	bl ov74_0223B104
	ldr r0, [r4, #0x4c]
	ands r0, r0, #1
	popeq {r4, lr}
	bxeq lr
	mov r0, r4
	bl ov74_0223B230
	pop {r4, lr}
	bx lr
	arm_func_end ov74_022387DC

	arm_func_start ov74_0223881C
ov74_0223881C: @ 0x0223881C
	push {r4, lr}
	mov r4, r0
	mov r1, #0
	str r1, [r4]
	add r0, r4, #0xc
	str r1, [r4, #8]
	bl ov74_0223B024
	add r0, r4, #0x20
	bl ov74_0223B024
	add r0, r4, #0x34
	bl ov74_0223B024
	mov r0, #0
	str r0, [r4, #0x4c]
	pop {r4, lr}
	bx lr
	arm_func_end ov74_0223881C

	arm_func_start ov74_02238858
ov74_02238858: @ 0x02238858
	push {r4, lr}
	mov r0, #0x50
	bl ov74_0223B278
	movs r4, r0
	moveq r0, #0
	popeq {r4, lr}
	bxeq lr
	bl ov74_0223881C
	mov r1, #1
	mov r0, r4
	str r1, [r4, #0x4c]
	pop {r4, lr}
	bx lr
	arm_func_end ov74_02238858

	arm_func_start ov74_0223888C
ov74_0223888C: @ 0x0223888C
	push {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r6, r1
	ldr r3, [r6, #4]
	mov r7, r0
	cmp r3, #0
	mov r5, r2
	addeq sp, sp, #0x14
	moveq r0, #0
	popeq {r4, r5, r6, r7, lr}
	bxeq lr
	add r0, r7, #0x20
	add r4, r7, #0xc
	bl ov74_0223AE1C
	cmp r0, #0
	addeq sp, sp, #0x14
	moveq r0, #0
	popeq {r4, r5, r6, r7, lr}
	bxeq lr
	add r0, sp, #0
	bl ov74_0223B024
	mov r1, #1
	mov r0, r6
	str r1, [r7]
	bl ov74_0223B180
	add r1, r0, #0x1f
	asr r0, r1, #4
	add r0, r1, r0, lsr #27
	asr r2, r0, #5
	mov r0, r4
	mov r1, #0
	str r2, [r7, #8]
	bl ov74_0223AD74
	cmp r0, #0
	addeq sp, sp, #0x14
	moveq r0, #0
	popeq {r4, r5, r6, r7, lr}
	bxeq lr
	mov r0, r4
	mov r1, #0x20
	bl ov74_0223AAF4
	cmp r0, #0
	beq _02238A30
	ldr r0, [r6]
	ldr r4, [r0]
	mov r0, r4
	bl ov74_02238D94
	mov r1, r0
	add r0, sp, #0
	bl ov74_0223AD74
	cmp r0, #0
	beq _02238A30
	add r0, sp, #0
	mov r2, #0x20
	mov r1, r0
	bl ov74_0223A248
	cmp r0, #0
	beq _02238A30
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _022389A8
	cmp r0, #1
	bne _02238998
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #0
	beq _022389A8
_02238998:
	add r0, sp, #0
	mov r1, #1
	bl ov74_02239EA4
	b _022389BC
_022389A8:
	add r0, sp, #0
	mvn r1, #0
	bl ov74_0223AD74
	cmp r0, #0
	beq _02238A30
_022389BC:
	ldr r2, [sp, #4]
	cmp r2, #1
	ldrge r0, [sp]
	ldrge r1, [r0]
	movlt r1, #0
	cmp r2, #2
	ldrge r0, [sp]
	mov r2, r4
	ldrge r0, [r0, #4]
	movlt r0, #0
	bl ov74_02238258
	str r0, [r7, #0x48]
	add r0, r7, #0xc
	mov r1, #0
	bl ov74_0223AD74
	ldr r1, [r7, #8]
	add r0, r7, #0xc
	lsl r1, r1, #6
	bl ov74_0223AAF4
	cmp r0, #0
	beq _02238A30
	add r0, r7, #0xc
	mov r1, r0
	mov r3, r5
	add r2, r7, #0x20
	bl ov74_0223920C
	ldr r1, [r7, #8]
	add r0, r7, #0xc
	bl ov74_0223B084
_02238A30:
	add r0, sp, #0
	bl ov74_0223B104
	mov r0, #1
	add sp, sp, #0x14
	pop {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end ov74_0223888C

	arm_func_start ov74_02238A48
ov74_02238A48: @ 0x02238A48
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r4, r2
	mov r7, r1
	cmp r4, #6
	mov r5, r0
	movgt r4, #6
	mov r1, #1
	lsl r2, r1, r4
	ldr r0, [r7, #4]
	sub r2, r2, #1
	add r0, r4, r0, lsl #5
	ldr r3, _02238C1C @ =0x0223D058
	str r2, [sp]
	ldr r2, [r3, r4, lsl #2]
	mov r1, r4
	sub r0, r0, #1
	str r2, [sp, #4]
	mov r6, #0
	bl FUN_020F2998
	mov ip, #0
	lsl r0, r0, #1
	add r0, r0, #2
	mov r8, r6
	add r1, r5, r0
	strb r8, [r5, r0]
	strb r8, [r1, #-1]
	ldr r0, [r7]
	ldr r2, [r7, #4]
	ldr r7, [r0]
	add lr, r0, #4
	cmp r2, #1
	sub sb, r1, #2
	ldrgt r8, [lr], #4
	mov sl, r7
	mov r0, ip
	str ip, [sp, #8]
	mov r1, #0xff
	mov fp, ip
_02238AE4:
	ldr r3, [sp]
	and r3, sl, r3
	ldr sl, [sp, #4]
	ldrb sl, [sl, r3]
	cmp sl, #0
	beq _02238B44
	add ip, ip, sl
	add r6, r6, sl
	cmp r6, #0x20
	blo _02238B2C
	cmp r2, #1
	ble _02238B44
	sub r2, r2, #1
	mov r7, r8
	cmp r2, #1
	movle r8, fp
	ldrgt r8, [lr], #4
	sub r6, r6, #0x20
_02238B2C:
	cmp r6, #0
	moveq sl, r7
	lsrne sl, r7, r6
	rsbne r3, r6, #0x20
	orrne sl, sl, r8, lsl r3
	b _02238AE4
_02238B44:
	cmp r3, #0
	beq _02238BC8
	strb ip, [sb]
	strb r3, [sb, #-1]
	cmp ip, #0x100
	sub sb, sb, #2
	blo _02238B80
	cmp ip, #0x100
	blo _02238B80
_02238B68:
	strb r1, [sb]
	sub ip, ip, #0x100
	strb r0, [sb, #-1]
	sub sb, sb, #2
	cmp ip, #0x100
	bhs _02238B68
_02238B80:
	mov ip, r4
	add r6, r6, r4
	cmp r6, #0x20
	blo _02238BB0
	cmp r2, #1
	ble _02238BC8
	sub r2, r2, #1
	mov r7, r8
	cmp r2, #1
	ldrle r8, [sp, #8]
	sub r6, r6, #0x20
	ldrgt r8, [lr], #4
_02238BB0:
	cmp r6, #0
	moveq sl, r7
	lsrne sl, r7, r6
	rsbne r3, r6, #0x20
	orrne sl, sl, r8, lsl r3
	b _02238AE4
_02238BC8:
	add sb, sb, #1
	mov r0, #2
	b _02238BEC
_02238BD4:
	strb r2, [r5]
	ldrb r1, [sb, #1]
	add sb, sb, #2
	add r0, r0, #2
	strb r1, [r5, #1]
	add r5, r5, #2
_02238BEC:
	ldrb r2, [sb]
	cmp r2, #0
	bne _02238BD4
	ldrb r1, [sb, #1]
	cmp r1, #0
	bne _02238BD4
	mov r1, #0
	strb r1, [r5]
	strb r1, [r5, #1]
	add sp, sp, #0xc
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_02238C1C: .4byte 0x0223D058
	arm_func_end ov74_02238A48

	arm_func_start ov74_02238C20
ov74_02238C20: @ 0x02238C20
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #4
	ldr r5, [r3], #4
	mov r2, #0x14
	mla r4, r5, r2, r3
	mov sb, r0
	ldr r0, [sb, #4]
	mov r8, r1
	cmp r0, #0
	mov r5, #0
	lsl r1, r0, #5
	addeq sp, sp, #4
	moveq r0, r5
	popeq {r4, r5, r6, r7, r8, sb, lr}
	bxeq lr
	cmp r0, #1
	bne _02238CC0
	cmp r0, #1
	bne _02238C84
	ldr r2, [sb]
	ldr r1, _02238D84 @ =0x00010001
	ldr r2, [r2]
	cmp r2, r1
	ldreq r5, _02238D88 @ =0x0223BB3C
	beq _02238CB0
_02238C84:
	ldr r1, [sb]
	ldr r1, [r1]
	cmp r1, #0x11
	bne _02238CA0
	cmp r0, #1
	ldreq r5, _02238D8C @ =0x0223BB54
	beq _02238CB0
_02238CA0:
	cmp r1, #3
	bne _02238CB0
	cmp r0, #1
	ldreq r5, _02238D90 @ =0x0223BB48
_02238CB0:
	mov r7, #1
	mov r6, r7
	mov r1, #0x20
	b _02238CF0
_02238CC0:
	cmp r1, #0x100
	movge r7, #5
	movge r6, #0x10
	movge r1, #7
	bge _02238CF0
	cmp r1, #0x80
	movge r6, #8
	movge r1, r6
	movge r7, #4
	movlt r7, #3
	movlt r6, #4
	movlt r1, #0xb
_02238CF0:
	mul r1, r0, r1
	lsl r0, r1, #1
	add r1, r0, #7
	asr r0, r1, #1
	add r0, r1, r0, lsr #30
	cmp r5, #0
	asr r1, r0, #2
	bne _02238D6C
	ldr r0, [r4, #8]
	cmp r1, r0
	movle r0, r4
	ble _02238D28
	mov r0, r4
	bl ov74_0223AEB4
_02238D28:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, lr}
	bxeq lr
	ldr r5, [r4]
	mov r1, sb
	mov r2, r7
	add r0, r5, #4
	bl ov74_02238A48
	add r1, r0, #2
	asr r0, r1, #8
	strb r0, [r5]
	strb r1, [r5, #1]
	strb r7, [r5, #2]
	strb r6, [r5, #3]
	b _02238D70
_02238D6C:
	mov r1, #8
_02238D70:
	str r5, [r8]
	add r0, r1, #2
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_02238D84: .4byte 0x00010001
_02238D88: .4byte 0x0223BB3C
_02238D8C: .4byte 0x0223BB54
_02238D90: .4byte 0x0223BB48
	arm_func_end ov74_02238C20

	arm_func_start ov74_02238D94
ov74_02238D94: @ 0x02238D94
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	mov r1, sl
	rsb r0, sl, #0
	bl FUN_020F2BA4
	movs r8, r1
	mov r7, sl
	mov r5, #0
	mov r6, #1
	mvn r4, #0
	beq _02238DFC
_02238DC0:
	mov r0, r7
	mov r1, r8
	bl FUN_020F2BA4
	mov sb, r1
	mov r0, r7
	mov r1, r8
	bl FUN_020F2BA4
	mla r1, r0, r6, r5
	mov r5, r6
	mov r7, r8
	mov r6, r1
	mov r8, sb
	cmp sb, #0
	rsb r4, r4, #0
	bne _02238DC0
_02238DFC:
	cmp r4, #0
	sublt r5, sl, r5
	cmp r7, #1
	movne r1, #0
	bne _02238E1C
	mov r0, r5
	mov r1, sl
	bl FUN_020F2BA4
_02238E1C:
	mov r0, r1
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	arm_func_end ov74_02238D94

	arm_func_start ov74_02238E28
ov74_02238E28: @ 0x02238E28
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r7, r3
	mov sb, r1
	mov r6, #0
	mov sl, r0
	mov r8, r2
	mov r4, r6
	cmp r7, #0
	add r5, sb, r7, lsl #2
	ldr fp, [sp, #0x30]
	ble _02238EB8
	mov r0, #1
	str r6, [sp, #4]
	str r0, [sp]
_02238E64:
	ldr r1, [sb]
	mov r0, sb
	mul r3, r1, fp
	mov r1, r8
	mov r2, r7
	bl ov74_0223A8A4
	add r1, r0, r6
	ldr r0, [r5]
	cmp r1, r6
	ldrlo r6, [sp]
	add r0, r0, r1
	str r0, [r5]
	ldr r0, [r5]
	ldrhs r6, [sp, #4]
	cmp r0, r1
	add r4, r4, #1
	addlo r6, r6, #1
	cmp r4, r7
	add sb, sb, #4
	add r5, r5, #4
	blt _02238E64
_02238EB8:
	cmp r6, #0
	sub r2, r7, #1
	bne _02238F0C
	ldr r1, [sb, r2, lsl #2]
	ldr r0, [r8, r2, lsl #2]
	cmp r1, r0
	bne _02238EF8
	cmp r2, #0
	ble _02238EF8
_02238EDC:
	ldr r1, [sb, r2, lsl #2]
	ldr r0, [r8, r2, lsl #2]
	cmp r1, r0
	bne _02238EF8
	sub r2, r2, #1
	cmp r2, #0
	bgt _02238EDC
_02238EF8:
	ldr r1, [sb, r2, lsl #2]
	ldr r0, [r8, r2, lsl #2]
	cmp r1, r0
	movhs r6, #1
	movlo r6, #0
_02238F0C:
	cmp r6, #0
	beq _02238F34
	mov r0, sl
	mov r1, sb
	mov r2, r8
	mov r3, r7
	bl ov74_0223A34C
	add sp, sp, #0xc
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_02238F34:
	cmp r7, #0
	addle sp, sp, #0xc
	mov r1, #0
	pople {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxle lr
_02238F48:
	ldr r0, [sb, r1, lsl #2]
	str r0, [sl, r1, lsl #2]
	add r1, r1, #1
	cmp r1, r7
	blt _02238F48
	add sp, sp, #0xc
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end ov74_02238E28

	arm_func_start ov74_02238F68
ov74_02238F68: @ 0x02238F68
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #4
	mov fp, r2
	lsl r6, fp, #1
	mov sl, r0
	mov r7, fp
	mov sb, r1
	sub r7, r7, #1
	sub r2, r6, #1
	mov r0, #0
	str r0, [sl, r2, lsl #2]
	ldr r0, [sl, r2, lsl #2]
	str r3, [sp]
	mov r5, sb
	str r0, [sl]
	cmp r7, #0
	add r4, sl, #4
	ble _02238FD0
	add r5, r5, #4
	ldr r3, [sb]
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl ov74_0223A704
	str r0, [r4, r7, lsl #2]
	add r4, r4, #8
_02238FD0:
	sub r8, fp, #2
	cmp r8, #0
	ble _02239010
_02238FDC:
	mov r0, r5
	sub r7, r7, #1
	add r5, r5, #4
	ldr r3, [r0]
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl ov74_0223A8A4
	sub r8, r8, #1
	str r0, [r4, r7, lsl #2]
	cmp r8, #0
	add r4, r4, #8
	bgt _02238FDC
_02239010:
	mov r0, sl
	mov r1, sl
	mov r2, sl
	mov r3, r6
	bl ov74_0223A460
	ldr r0, [sp]
	mov r1, sb
	mov r2, fp
	bl ov74_0223A5B0
	ldr r2, [sp]
	mov r0, sl
	mov r1, sl
	mov r3, r6
	bl ov74_0223A460
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end ov74_02238F68

	arm_func_start ov74_02239054
ov74_02239054: @ 0x02239054
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x64
	ldr r5, [r2]
	mov sb, r0
	mov r8, r1
	cmp r8, sb
	add r3, r2, #4
	mov r2, #0x14
	movne r7, sb
	addeq r0, r5, #1
	mla r4, r5, r2, r3
	mlaeq r7, r0, r2, r3
	ldr r5, [r8, #4]
	cmp r5, #0
	movle r0, #0
	strle r0, [sb, #4]
	addle sp, sp, #0x64
	movle r0, #1
	pople {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r0, [r7, #8]
	lsl r6, r5, #1
	cmp r6, r0
	movle r0, r7
	ble _022390C4
	mov r0, r7
	mov r1, r6
	bl ov74_0223AEB4
_022390C4:
	cmp r0, #0
	addeq sp, sp, #0x64
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, lr}
	bxeq lr
	str r6, [r7, #4]
	mov r0, #0
	str r0, [r7, #0xc]
	cmp r5, #4
	bne _02239104
	ldr r0, [r7]
	ldr r1, [r8]
	add r3, sp, #0
	mov r2, #4
	bl ov74_02238F68
	b _02239168
_02239104:
	cmp r5, #8
	bne _02239124
	ldr r0, [r7]
	ldr r1, [r8]
	add r3, sp, #0x20
	mov r2, #8
	bl ov74_02238F68
	b _02239168
_02239124:
	ldr r0, [r4, #8]
	cmp r6, r0
	movle r0, r4
	ble _02239140
	mov r0, r4
	mov r1, r6
	bl ov74_0223AEB4
_02239140:
	cmp r0, #0
	addeq sp, sp, #0x64
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, lr}
	bxeq lr
	ldr r0, [r7]
	ldr r1, [r8]
	ldr r3, [r4]
	mov r2, r5
	bl ov74_02238F68
_02239168:
	cmp r6, #0
	ble _0223918C
	ldr r1, [r7]
	sub r0, r6, #1
	ldr r0, [r1, r0, lsl #2]
	cmp r0, #0
	ldreq r0, [r7, #4]
	subeq r0, r0, #1
	streq r0, [r7, #4]
_0223918C:
	cmp r7, sb
	beq _022391A0
	mov r0, sb
	mov r1, r7
	bl ov74_0223AE1C
_022391A0:
	mov r0, #1
	add sp, sp, #0x64
	pop {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end ov74_02239054

	arm_func_start ov74_022391B0
ov74_022391B0: @ 0x022391B0
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, [r3, #4]
	cmp ip, #0
	ble _022391F4
	ldr ip, [r3]
	ldr ip, [ip]
	ands ip, ip, #1
	beq _022391F4
	ldr lr, [sp, #0x10]
	mov ip, #0
	str lr, [sp]
	str ip, [sp, #4]
	bl ov74_022376C0
	add sp, sp, #0xc
	ldm sp!, {lr}
	bx lr
_022391F4:
	ldr ip, [sp, #0x10]
	str ip, [sp]
	bl ov74_02237EC4
	add sp, sp, #0xc
	ldm sp!, {lr}
	bx lr
	arm_func_end ov74_022391B0

	arm_func_start ov74_0223920C
ov74_0223920C: @ 0x0223920C
	stmdb sp!, {lr}
	sub sp, sp, #4
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #0
	bl ov74_02239240
	add sp, sp, #4
	ldm sp!, {lr}
	bx lr
	arm_func_end ov74_0223920C

	arm_func_start ov74_02239240
ov74_02239240: @ 0x02239240
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	mov r6, r3
	ldr r3, [r6, #4]
	mov r8, r0
	str r1, [sp]
	str r2, [sp, #4]
	cmp r3, #0
	ldr r4, [sp, #0x70]
	beq _02239280
	cmp r3, #1
	bne _02239290
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r0, #0
	bne _02239290
_02239280:
	add sp, sp, #0x4c
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_02239290:
	ldr r0, [sp, #4]
	mov r1, r6
	bl ov74_0223AB90
	cmp r0, #0
	bge _022392F0
	ldr r0, [sp]
	cmp r0, #0
	beq _022392CC
	ldr r1, [sp, #4]
	bl ov74_0223AE1C
	cmp r0, #0
	addeq sp, sp, #0x4c
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
_022392CC:
	cmp r8, #0
	beq _022392E0
	mov r0, r8
	mov r1, #0
	bl ov74_0223AD74
_022392E0:
	add sp, sp, #0x4c
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_022392F0:
	ldr r3, [r4]
	add r0, r4, #4
	mov r2, #0x14
	mla r1, r3, r2, r0
	mov r3, #0
	str r3, [r1, #0xc]
	ldr r5, [r4]
	str r1, [sp, #0x14]
	add r4, r5, #1
	mla r1, r4, r2, r0
	add r3, r5, #2
	str r1, [sp, #0x18]
	mla r1, r3, r2, r0
	cmp r8, #0
	str r1, [sp, #0x1c]
	addeq r1, r5, #3
	mlaeq r8, r1, r2, r0
	mov r0, r6
	bl ov74_0223B180
	lsr r1, r0, #0x1f
	rsb r0, r1, r0, lsl #27
	add r0, r1, r0, ror #27
	rsb r0, r0, #0x20
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #8]
	mov r1, r6
	bl ov74_0223A248
	cmp r0, #0
	addeq sp, sp, #0x4c
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	ldr r2, [sp, #8]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #4]
	ldr r3, [sp, #0x1c]
	mov r4, #0
	add r2, r2, #0x20
	str r4, [r3, #0xc]
	bl ov74_0223A248
	cmp r0, #0
	addeq sp, sp, #0x4c
	moveq r0, r4
	popeq {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	ldr r0, [sp, #0x18]
	mov r1, r4
	str r1, [r0, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #4]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x28]
	ldr r4, [r0, #4]
	add r0, sp, #0x38
	sub r1, r4, r1
	str r1, [sp, #0x10]
	bl ov74_0223B024
	ldr r0, [sp, #0x18]
	ldr r2, [r0]
	ldr r0, [sp, #0x28]
	sub r1, r0, #1
	ldr r0, [sp, #0x10]
	add r0, r2, r0, lsl #2
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x18]
	ldr r2, [r0, #8]
	ldr r0, [sp, #0x28]
	cmp r0, #1
	add r0, r2, #1
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x1c]
	moveq r5, #0
	ldr r2, [r0]
	ldr r0, [r2, r1, lsl #2]
	str r0, [sp, #0x24]
	ldrne r0, [sp, #0x28]
	subne r0, r0, #2
	ldrne r5, [r2, r0, lsl #2]
	ldr r0, [sp, #0x18]
	ldr r2, [r8, #8]
	ldr r1, [r0]
	sub r0, r4, #1
	add r7, r1, r0, lsl #2
	ldr r0, [sp, #0x10]
	add r1, r0, #1
	cmp r1, r2
	movle r0, r8
	ble _02239468
	mov r0, r8
	bl ov74_0223AEB4
_02239468:
	cmp r0, #0
	beq _022397CC
	ldr r0, [sp, #4]
	ldr r1, [r6, #0xc]
	ldr r3, [r0, #0xc]
	ldr r0, [sp, #0x10]
	sub r2, r0, #1
	eor r0, r3, r1
	str r0, [r8, #0xc]
	ldr r0, [sp, #0x10]
	str r0, [r8, #4]
	ldr r0, [sp, #0x28]
	ldr r3, [r8]
	add r1, r0, #1
	add r0, r3, r2, lsl #2
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	ldr r0, [r0, #8]
	cmp r1, r0
	ldrle r0, [sp, #0x14]
	ble _022394C4
	ldr r0, [sp, #0x14]
	bl ov74_0223AEB4
_022394C4:
	cmp r0, #0
	beq _022397CC
	ldr r1, [sp, #0x1c]
	add r0, sp, #0x38
	bl ov74_0223AB90
	cmp r0, #0
	blt _02239518
	add r0, sp, #0x38
	ldr r2, [sp, #0x1c]
	mov r1, r0
	bl ov74_02239B48
	cmp r0, #0
	beq _022397CC
	ldr r0, [sp, #0x20]
	mov r2, #1
	str r2, [r0]
	ldr r0, [r8, #4]
	ldr r1, [r8]
	sub r0, r0, #1
	str r2, [r1, r0, lsl #2]
	b _02239524
_02239518:
	ldr r0, [r8, #4]
	sub r0, r0, #1
	str r0, [r8, #4]
_02239524:
	ldr r0, [sp, #0x10]
	sub r1, r0, #1
	ldr r0, [sp, #0x20]
	cmp r1, #0
	sub r0, r0, #4
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0xc]
	ble _02239774
	ldr r8, _022397DC @ =0x0000FFFF
	cmp r1, #0
	and r0, r5, r8
	str r0, [sp, #0x2c]
	and r0, r8, r5, lsr #16
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x24]
	and r4, r0, r8
	ble _02239774
	and sb, r8, r0, lsr #16
	mvn r0, #0
	str r0, [sp, #0x34]
_02239578:
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	sub r1, r1, #4
	add r0, r0, #1
	str r0, [sp, #0x3c]
	str r1, [sp, #0x38]
	ldr fp, [r7]
	ldr r0, [sp, #0x24]
	ldr r5, [r7, #-4]
	cmp fp, r0
	ldreq r6, [sp, #0x34]
	beq _022395BC
	ldr r2, [sp, #0x24]
	mov r0, fp
	mov r1, r5
	bl ov74_02238258
	mov r6, r0
_022395BC:
	ldr r0, [sp, #0x2c]
	and r2, r6, r8
	mul ip, r0, r2
	ldr r0, [sp, #0x30]
	and lr, r8, r6, lsr #16
	ldr r1, [sp, #0x30]
	mul r0, r2, r0
	mul r3, r1, lr
	ldr r1, [sp, #0x2c]
	mul sl, sb, lr
	mla r1, lr, r1, r0
	cmp r1, r0
	addlo r3, r3, #0x10000
	and r0, r8, r1, lsr #16
	add r3, r3, r0
	and r0, r1, r8
	add ip, ip, r0, lsl #16
	cmp ip, r0, lsl #16
	mul r0, r2, sb
	mul r1, r4, r2
	mla r2, lr, r4, r0
	addlo r3, r3, #1
	cmp r2, r0
	addlo sl, sl, #0x10000
	and r0, r8, r2, lsr #16
	add sl, sl, r0
	and r0, r2, r8
	add r1, r1, r0, lsl #16
	cmp r1, r0, lsl #16
	addlo sl, sl, #1
	sub r1, r5, r1
	cmp r1, r5
	addhi sl, sl, #1
	subs r0, fp, sl
	bne _0223966C
	cmp r3, r1
	blo _0223966C
	cmp r3, r1
	bne _02239664
	ldr r0, [r7, #-8]
	cmp ip, r0
	bls _0223966C
_02239664:
	sub r6, r6, #1
	b _022395BC
_0223966C:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [sp, #0x28]
	mov r3, r6
	bl ov74_0223A704
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x28]
	ldr r3, [r1]
	ldr r1, [sp, #0x28]
	str r0, [r3, r2, lsl #2]
	add r1, r1, #1
	cmp r1, #0
	ble _022396CC
	ldr r0, [sp, #0x14]
	ldr r2, [r0]
_022396B0:
	sub r0, r1, #1
	ldr r0, [r2, r0, lsl #2]
	cmp r0, #0
	bne _022396CC
	sub r1, r1, #1
	cmp r1, #0
	bgt _022396B0
_022396CC:
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x14]
	str r1, [r0, #4]
	add r0, sp, #0x38
	mov r1, r0
	ldr r5, [sp, #0x3c]
	bl ov74_02239A04
	ldr r0, [sp, #0x18]
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x3c]
	add r0, r1, r0
	sub r1, r0, r5
	ldr r0, [sp, #0x18]
	str r1, [r0, #4]
	ldr r0, [sp, #0x44]
	cmp r0, #0
	beq _02239744
	add r0, sp, #0x38
	ldr r2, [sp, #0x1c]
	mov r1, r0
	sub r6, r6, #1
	ldr r5, [sp, #0x3c]
	bl ov74_02239DC8
	ldr r0, [sp, #0x18]
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x3c]
	sub r0, r0, r5
	add r1, r1, r0
	ldr r0, [sp, #0x18]
	str r1, [r0, #4]
_02239744:
	ldr r0, [sp, #0x20]
	sub r7, r7, #4
	str r6, [r0], #-4
	str r0, [sp, #0x20]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	sub r1, r0, #1
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _02239578
_02239774:
	ldr r0, [sp, #0x18]
	bl ov74_0223B038
	ldr r0, [sp]
	cmp r0, #0
	beq _022397BC
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	ldr r1, [sp, #0x18]
	add r2, r2, #0x20
	ldr r4, [r3, #0xc]
	bl ov74_0223A12C
	cmp r0, #0
	addeq sp, sp, #0x4c
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	ldr r0, [sp]
	str r4, [r0, #0xc]
_022397BC:
	add sp, sp, #0x4c
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_022397CC:
	mov r0, #0
	add sp, sp, #0x4c
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_022397DC: .4byte 0x0000FFFF
	arm_func_end ov74_02239240

	arm_func_start ov74_022397E0
ov74_022397E0: @ 0x022397E0
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #4
	ldr r5, [sp, #0x20]
	mov r7, r2
	mov sb, r0
	mov r8, r1
	mov r6, r3
	cmp r7, r5
	bge _0223981C
	mov r1, r7
	mov r0, r8
	mov r7, r5
	mov r8, r6
	mov r5, r1
	mov r6, r0
_0223981C:
	ldr r3, [r6]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	add r4, sb, r7, lsl #2
	bl ov74_0223A704
	str r0, [sb, r7, lsl #2]
_02239838:
	sub r0, r5, #1
	cmp r0, #0
	addle sp, sp, #4
	pople {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r3, [r6, #4]
	mov r1, r8
	mov r2, r7
	add r0, sb, #4
	bl ov74_0223A8A4
	sub r1, r5, #2
	cmp r1, #0
	addle sp, sp, #4
	str r0, [r4, #4]
	pople {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r3, [r6, #8]
	mov r1, r8
	mov r2, r7
	add r0, sb, #8
	bl ov74_0223A8A4
	sub r1, r5, #3
	cmp r1, #0
	addle sp, sp, #4
	str r0, [r4, #8]
	pople {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r3, [r6, #0xc]
	mov r1, r8
	mov r2, r7
	add r0, sb, #0xc
	bl ov74_0223A8A4
	sub r5, r5, #4
	cmp r5, #0
	addle sp, sp, #4
	str r0, [r4, #0xc]
	pople {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r3, [r6, #0x10]
	mov r1, r8
	mov r2, r7
	add r0, sb, #0x10
	bl ov74_0223A8A4
	str r0, [r4, #0x10]
	add r4, r4, #0x10
	add sb, sb, #0x10
	add r6, r6, #0x10
	b _02239838
	arm_func_end ov74_022397E0

	arm_func_start ov74_022398F8
ov74_022398F8: @ 0x022398F8
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end ov74_022398F8

	arm_func_start ov74_02239904
ov74_02239904: @ 0x02239904
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #4
	mov sb, r1
	ldr r6, [sb, #4]
	mov r8, r2
	mov sl, r0
	cmp r6, #0
	ldr r5, [r8, #4]
	beq _02239930
	cmp r5, #0
	bne _0223994C
_02239930:
	mov r0, sl
	mov r1, #0
	bl ov74_0223AD74
	add sp, sp, #4
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_0223994C:
	ldr r1, [sb, #0xc]
	ldr r0, [r8, #0xc]
	cmp sl, sb
	add r7, r6, r5
	eor fp, r1, r0
	beq _0223996C
	cmp sl, r8
	bne _02239984
_0223996C:
	ldr r0, [r3]
	add r2, r3, #4
	add r1, r0, #1
	mov r0, #0x14
	mla r4, r1, r0, r2
	b _02239988
_02239984:
	mov r4, sl
_02239988:
	ldr r0, [r4, #8]
	cmp r7, r0
	movle r0, r4
	ble _022399A4
	mov r0, r4
	mov r1, r7
	bl ov74_0223AEB4
_022399A4:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	str r7, [r4, #4]
	str r5, [sp]
	ldr r0, [r4]
	ldr r1, [sb]
	ldr r3, [r8]
	mov r2, r6
	bl ov74_022397E0
	mov r0, r4
	str fp, [sl, #0xc]
	bl ov74_0223B038
	cmp sl, r4
	beq _022399F4
	mov r0, sl
	mov r1, r4
	bl ov74_0223AE1C
_022399F4:
	mov r0, #1
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end ov74_02239904

	arm_func_start ov74_02239A04
ov74_02239A04: @ 0x02239A04
	push {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	mov r6, r1
	ldr r1, [r6, #0xc]
	mov r3, #0
	mov r7, r0
	mov r5, r2
	mov r4, r3
	cmp r1, #0
	beq _02239A4C
	ldr r0, [r5, #0xc]
	cmp r0, #0
	movne r0, r6
	moveq r3, #1
	movne r6, r5
	movne r5, r0
	moveq r4, r3
	b _02239A58
_02239A4C:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	movne r3, #1
_02239A58:
	cmp r3, #0
	beq _02239A8C
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov74_02239CAC
	cmp r0, #0
	moveq r0, #0
	add sp, sp, #4
	strne r4, [r7, #0xc]
	movne r0, #1
	pop {r4, r5, r6, r7, lr}
	bx lr
_02239A8C:
	ldr r0, [r5, #4]
	ldr r1, [r6, #4]
	cmp r1, r0
	movle r1, r0
	ldr r0, [r7, #8]
	cmp r1, r0
	movle r0, r7
	ble _02239AB4
	mov r0, r7
	bl ov74_0223AEB4
_02239AB4:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, r6, r7, lr}
	bxeq lr
	mov r0, r6
	mov r1, r5
	bl ov74_0223AB90
	cmp r0, #0
	bge _02239B0C
	mov r0, r7
	mov r1, r5
	mov r2, r6
	bl ov74_02239B48
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, r6, r7, lr}
	bxeq lr
	mov r0, #1
	str r0, [r7, #0xc]
	b _02239B38
_02239B0C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl ov74_02239B48
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, r6, r7, lr}
	bxeq lr
	mov r0, #0
	str r0, [r7, #0xc]
_02239B38:
	mov r0, #1
	add sp, sp, #4
	pop {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end ov74_02239A04

	arm_func_start ov74_02239B48
ov74_02239B48: @ 0x02239B48
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, r1
	mov r7, r2
	ldr r5, [r7, #4]
	ldr r6, [r8, #4]
	mov r4, r0
	cmp r6, r5
	movlt r0, #0
	poplt {r4, r5, r6, r7, r8, sb, sl, lr}
	bxlt lr
	ldr r1, [r4, #8]
	cmp r6, r1
	ble _02239B84
	mov r1, r6
	bl ov74_0223AEB4
_02239B84:
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
	mov r3, #0
	mov r0, r3
	cmp r5, #0
	ldr r2, [r8]
	ldr sb, [r7]
	ldr r1, [r4]
	ble _02239C04
	mov ip, r3
	mov r7, r3
	mov lr, #1
_02239BBC:
	cmp r3, #0
	ldr sl, [r2], #4
	ldr r8, [sb], #4
	beq _02239BE4
	cmp sl, r8
	movls r3, lr
	sub r8, sl, r8
	movhi r3, ip
	sub sl, r8, #1
	b _02239BF4
_02239BE4:
	cmp sl, r8
	movlo r3, lr
	movhs r3, r7
	sub sl, sl, r8
_02239BF4:
	add r0, r0, #1
	cmp r0, r5
	str sl, [r1], #4
	blt _02239BBC
_02239C04:
	cmp r3, #0
	beq _02239C34
	cmp r0, r6
	bge _02239C34
_02239C14:
	ldr r5, [r2], #4
	add r0, r0, #1
	sub r3, r5, #1
	cmp r5, r3
	str r3, [r1], #4
	bhi _02239C34
	cmp r0, r6
	blt _02239C14
_02239C34:
	cmp r1, r2
	beq _02239C94
_02239C3C:
	cmp r0, r6
	bge _02239C94
	ldr r5, [r2]
	add r3, r0, #1
	str r5, [r1]
	cmp r3, r6
	bge _02239C94
	ldr r5, [r2, #4]
	add r3, r0, #2
	str r5, [r1, #4]
	cmp r3, r6
	bge _02239C94
	ldr r5, [r2, #8]
	add r3, r0, #3
	str r5, [r1, #8]
	cmp r3, r6
	ldrlt r3, [r2, #0xc]
	add r0, r0, #4
	strlt r3, [r1, #0xc]
	addlt r2, r2, #0x10
	addlt r1, r1, #0x10
	blt _02239C3C
_02239C94:
	mov r0, r4
	str r6, [r4, #4]
	bl ov74_0223B038
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	arm_func_end ov74_02239B48

	arm_func_start ov74_02239CAC
ov74_02239CAC: @ 0x02239CAC
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #4
	mov r4, r1
	mov r8, r2
	ldr r2, [r4, #4]
	ldr r1, [r8, #4]
	mov sb, r0
	cmp r2, r1
	movlt r0, r4
	movlt r4, r8
	movlt r8, r0
	ldr r6, [r4, #4]
	ldr r0, [sb, #8]
	add r1, r6, #1
	cmp r1, r0
	ldr r7, [r8, #4]
	movle r0, sb
	ble _02239CFC
	mov r0, sb
	bl ov74_0223AEB4
_02239CFC:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, lr}
	bxeq lr
	str r6, [sb, #4]
	ldr r5, [r4]
	ldr r4, [sb]
	ldr r2, [r8]
	mov r0, r4
	mov r1, r5
	mov r3, r7
	bl ov74_0223A460
	cmp r0, #0
	add r4, r4, r7, lsl #2
	add r5, r5, r7, lsl #2
	beq _02239D94
	cmp r7, r6
	bge _02239D74
_02239D48:
	ldr r2, [r5], #4
	mov r3, r4
	add r1, r2, #1
	str r1, [r4], #4
	ldr r1, [r3]
	add r7, r7, #1
	cmp r1, r2
	movhs r0, #0
	bhs _02239D74
	cmp r7, r6
	blt _02239D48
_02239D74:
	cmp r7, r6
	blt _02239D94
	cmp r0, #0
	movne r0, #1
	strne r0, [r4], #4
	ldrne r0, [sb, #4]
	addne r0, r0, #1
	strne r0, [sb, #4]
_02239D94:
	cmp r4, r5
	beq _02239DB8
	cmp r7, r6
	bge _02239DB8
_02239DA4:
	ldr r0, [r5], #4
	add r7, r7, #1
	cmp r7, r6
	str r0, [r4], #4
	blt _02239DA4
_02239DB8:
	mov r0, #1
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end ov74_02239CAC

	arm_func_start ov74_02239DC8
ov74_02239DC8: @ 0x02239DC8
	push {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	ldr r2, [r5, #0xc]
	ldr r1, [r4, #0xc]
	mov r6, r0
	eors r0, r2, r1
	beq _02239E6C
	cmp r2, #0
	movne r0, r5
	movne r5, r4
	movne r4, r0
	mov r0, r5
	mov r1, r4
	bl ov74_0223AB90
	cmp r0, #0
	bge _02239E38
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl ov74_02239B48
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, lr}
	bxeq lr
	mov r0, #1
	str r0, [r6, #0xc]
	b _02239E60
_02239E38:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov74_02239B48
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, lr}
	bxeq lr
	mov r0, #0
	str r0, [r6, #0xc]
_02239E60:
	mov r0, #1
	pop {r4, r5, r6, lr}
	bx lr
_02239E6C:
	cmp r2, #0
	movne r0, #1
	strne r0, [r6, #0xc]
	moveq r0, #0
	streq r0, [r6, #0xc]
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl ov74_02239CAC
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end ov74_02239DC8

	arm_func_start ov74_02239EA4
ov74_02239EA4: @ 0x02239EA4
	push {r4, r5, lr}
	sub sp, sp, #4
	movs r4, r1
	mov r5, r0
	addeq sp, sp, #4
	moveq r0, #1
	popeq {r4, r5, lr}
	bxeq lr
	ldr r2, [r5, #0xc]
	cmp r2, #0
	beq _02239EF0
	mov r2, #0
	str r2, [r5, #0xc]
	bl ov74_0223A004
	mov r1, #1
	add sp, sp, #4
	str r1, [r5, #0xc]
	pop {r4, r5, lr}
	bx lr
_02239EF0:
	ldr r1, [r5, #4]
	cmp r1, #1
	bgt _02239F94
	cmp r1, #0
	bne _02239F4C
	ldr r1, [r5, #8]
	cmp r1, #1
	bge _02239F18
	mov r1, #1
	bl ov74_0223AEB4
_02239F18:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, lr}
	bxeq lr
	ldr r1, [r5]
	mov r0, #1
	str r4, [r1]
	str r0, [r5, #0xc]
	add sp, sp, #4
	str r0, [r5, #4]
	pop {r4, r5, lr}
	bx lr
_02239F4C:
	ldr r2, [r5]
	ldr r1, [r2]
	cmp r1, r4
	moveq r0, #0
	streq r0, [r5, #4]
	beq _02239F84
	cmp r1, r4
	subhi r0, r1, r4
	strhi r0, [r2]
	movls r0, #1
	strls r0, [r5, #0xc]
	ldrls r0, [r5]
	subls r1, r4, r1
	strls r1, [r0]
_02239F84:
	add sp, sp, #4
	mov r0, #1
	pop {r4, r5, lr}
	bx lr
_02239F94:
	mov r0, #0
	mov r1, #1
_02239F9C:
	ldr ip, [r5]
	lsl r3, r0, #2
	ldr r2, [ip, r0, lsl #2]
	cmp r2, r4
	ldrhs r1, [ip, r3]
	subhs r1, r1, r4
	strhs r1, [ip, r3]
	bhs _02239FD4
	ldr r2, [ip, r3]
	add r0, r0, #1
	sub r2, r2, r4
	mov r4, r1
	str r2, [ip, r3]
	b _02239F9C
_02239FD4:
	ldr r1, [r5]
	ldr r1, [r1, r3]
	cmp r1, #0
	bne _02239FF4
	ldr r1, [r5, #4]
	sub r1, r1, #1
	cmp r0, r1
	streq r1, [r5, #4]
_02239FF4:
	mov r0, #1
	add sp, sp, #4
	pop {r4, r5, lr}
	bx lr
	arm_func_end ov74_02239EA4

	arm_func_start ov74_0223A004
ov74_0223A004: @ 0x0223A004
	push {r4, r5, lr}
	sub sp, sp, #4
	movs r4, r1
	mov r5, r0
	addeq sp, sp, #4
	moveq r0, #1
	popeq {r4, r5, lr}
	bxeq lr
	ldr r2, [r5, #0xc]
	cmp r2, #0
	beq _0223A0AC
	ldr r2, [r5, #4]
	cmp r2, #1
	ble _0223A05C
	mov r2, #0
	str r2, [r5, #0xc]
	bl ov74_02239EA4
	mov r1, #1
	add sp, sp, #4
	str r1, [r5, #0xc]
	pop {r4, r5, lr}
	bx lr
_0223A05C:
	ldr r2, [r5]
	ldr r1, [r2]
	cmp r1, r4
	subhi r0, r1, r4
	strhi r0, [r2]
	bhi _0223A09C
	cmp r1, r4
	movhs r0, #0
	strhs r0, [r5, #0xc]
	strhs r0, [r5, #4]
	bhs _0223A09C
	mov r0, #0
	str r0, [r5, #0xc]
	ldr r0, [r5]
	sub r1, r4, r1
	str r1, [r0]
_0223A09C:
	add sp, sp, #4
	mov r0, #1
	pop {r4, r5, lr}
	bx lr
_0223A0AC:
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	add r1, r1, #1
	cmp r1, r2
	ble _0223A0C4
	bl ov74_0223AEB4
_0223A0C4:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, lr}
	bxeq lr
	ldr r1, [r5]
	ldr r0, [r5, #4]
	mov r3, #0
	str r3, [r1, r0, lsl #2]
	mov r0, #1
_0223A0EC:
	ldr r2, [r5]
	ldr r1, [r2, r3, lsl #2]
	add r1, r4, r1
	cmp r4, r1
	str r1, [r2, r3, lsl #2]
	movhi r4, r0
	addhi r3, r3, #1
	bhi _0223A0EC
	ldr r0, [r5, #4]
	cmp r3, r0
	addge r0, r0, #1
	strge r0, [r5, #4]
	mov r0, #1
	add sp, sp, #4
	pop {r4, r5, lr}
	bx lr
	arm_func_end ov74_0223A004

	arm_func_start ov74_0223A12C
ov74_0223A12C: @ 0x0223A12C
	push {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	asr r1, r2, #4
	lsr r3, r2, #0x1f
	add r1, r2, r1, lsr #27
	rsb r2, r3, r2, lsl #27
	add r4, r3, r2, ror #27
	ldr r2, [r7, #4]
	asr r6, r1, #5
	mov r8, r0
	cmp r6, r2
	rsb r5, r4, #0x20
	ble _0223A174
	mov r1, #0
	bl ov74_0223AD74
	mov r0, #1
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
_0223A174:
	cmp r8, r7
	beq _0223A1AC
	sub r1, r2, r6
	ldr r2, [r8, #8]
	add r1, r1, #2
	cmp r1, r2
	ble _0223A194
	bl ov74_0223AEB4
_0223A194:
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r0, [r7, #0xc]
	str r0, [r8, #0xc]
_0223A1AC:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	add r2, r0, r6, lsl #2
	ldr r0, [r8]
	sub r7, r1, r6
	mov r6, r2
	str r7, [r8, #4]
	cmp r4, #0
	bne _0223A1F4
	add r2, r7, #1
	cmp r2, #0
	ble _0223A234
_0223A1DC:
	ldr r1, [r6], #4
	sub r2, r2, #1
	cmp r2, #0
	str r1, [r0], #4
	bgt _0223A1DC
	b _0223A234
_0223A1F4:
	cmp r7, #1
	add r6, r2, #4
	ldr r3, [r2]
	mov r2, #1
	ble _0223A224
_0223A208:
	lsr r1, r3, r4
	ldr r3, [r6], #4
	add r2, r2, #1
	orr r1, r1, r3, lsl r5
	cmp r2, r7
	str r1, [r0], #4
	blt _0223A208
_0223A224:
	lsr r1, r3, r4
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
_0223A234:
	mov r0, r8
	bl ov74_0223B038
	mov r0, #1
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end ov74_0223A12C

	arm_func_start ov74_0223A248
ov74_0223A248: @ 0x0223A248
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, r1
	mov r7, r2
	asr r1, r7, #4
	mov r5, r0
	add r2, r7, r1, lsr #27
	ldr r1, [r4, #4]
	ldr r3, [r5, #8]
	add r1, r1, r2, asr #5
	add r1, r1, #1
	cmp r1, r3
	asr r6, r2, #5
	ble _0223A280
	bl ov74_0223AEB4
_0223A280:
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
	ldr r0, [r4, #0xc]
	lsr r1, r7, #0x1f
	str r0, [r5, #0xc]
	ldr r3, [r4, #4]
	rsb r0, r1, r7, lsl #27
	adds ip, r1, r0, ror #27
	ldr r2, [r4]
	ldr r0, [r5]
	add r1, r3, r6
	mov r3, #0
	str r3, [r0, r1, lsl #2]
	rsb r3, ip, #0x20
	bne _0223A2E8
	ldr r1, [r4, #4]
	subs r7, r1, #1
	bmi _0223A31C
_0223A2D0:
	ldr r3, [r2, r7, lsl #2]
	add r1, r6, r7
	str r3, [r0, r1, lsl #2]
	subs r7, r7, #1
	bpl _0223A2D0
	b _0223A31C
_0223A2E8:
	ldr r1, [r4, #4]
	subs r1, r1, #1
	bmi _0223A31C
_0223A2F4:
	add sb, r6, r1
	add r8, sb, #1
	ldr sl, [r2, r1, lsl #2]
	ldr lr, [r0, r8, lsl #2]
	lsl r7, sl, ip
	orr lr, lr, sl, lsr r3
	str lr, [r0, r8, lsl #2]
	str r7, [r0, sb, lsl #2]
	subs r1, r1, #1
	bpl _0223A2F4
_0223A31C:
	lsl r2, r6, #2
	mov r1, #0
	bl FUN_020D4994
	ldr r1, [r4, #4]
	mov r0, r5
	add r1, r1, r6
	add r1, r1, #1
	str r1, [r5, #4]
	bl ov74_0223B038
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	arm_func_end ov74_0223A248

	arm_func_start ov74_0223A34C
ov74_0223A34C: @ 0x0223A34C
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	cmp r3, #0
	movle r0, #0
	pople {r4, r5, r6, r7, r8, sb, sl, lr}
	bxle lr
	mov r6, #0
	mov r4, r6
	mov lr, r6
	mov ip, r6
	mov r7, r6
	mov r5, #1
_0223A378:
	ldr sl, [r1]
	ldr sb, [r2]
	sub r8, sl, sb
	sub r8, r8, r6
	str r8, [r0]
	cmp sl, sb
	beq _0223A3A0
	cmp sl, sb
	movlo r6, r5
	movhs r6, r4
_0223A3A0:
	sub r8, r3, #1
	cmp r8, #0
	ble _0223A454
	ldr sl, [r1, #4]
	ldr sb, [r2, #4]
	sub r8, sl, sb
	sub r8, r8, r6
	str r8, [r0, #4]
	cmp sl, sb
	beq _0223A3D4
	cmp sl, sb
	movlo r6, r5
	movhs r6, lr
_0223A3D4:
	sub r8, r3, #2
	cmp r8, #0
	ble _0223A454
	ldr sl, [r1, #8]
	ldr sb, [r2, #8]
	sub r8, sl, sb
	sub r8, r8, r6
	str r8, [r0, #8]
	cmp sl, sb
	beq _0223A408
	cmp sl, sb
	movlo r6, r5
	movhs r6, ip
_0223A408:
	sub r8, r3, #3
	cmp r8, #0
	ble _0223A454
	ldr sl, [r1, #0xc]
	ldr sb, [r2, #0xc]
	sub r8, sl, sb
	sub r8, r8, r6
	str r8, [r0, #0xc]
	cmp sl, sb
	beq _0223A43C
	cmp sl, sb
	movlo r6, r5
	movhs r6, r7
_0223A43C:
	sub r3, r3, #4
	cmp r3, #0
	addgt r1, r1, #0x10
	addgt r2, r2, #0x10
	addgt r0, r0, #0x10
	bgt _0223A378
_0223A454:
	mov r0, r6
	pop {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	arm_func_end ov74_0223A34C

	arm_func_start ov74_0223A460
ov74_0223A460: @ 0x0223A460
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	cmp r3, #0
	addle sp, sp, #0xc
	movle r0, #0
	pople {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxle lr
	mov ip, #0
	mov r7, ip
	mov r6, ip
	mov r5, ip
	mov r4, ip
	mov lr, ip
	mov fp, ip
	str ip, [sp]
	str ip, [sp, #4]
	mov r8, #1
_0223A4A4:
	ldr sb, [r1]
	add sl, sb, ip
	ldr sb, [r2]
	cmp sl, ip
	movlo ip, r8
	add sb, sl, sb
	movhs ip, r7
	cmp sb, sl
	movlo sl, r8
	movhs sl, r6
	str sb, [r0]
	sub sb, r3, #1
	add ip, ip, sl
	cmp sb, #0
	ble _0223A5A0
	ldr sb, [r1, #4]
	ldr sl, [r2, #4]
	add sb, sb, ip
	cmp sb, ip
	movlo ip, r8
	add sl, sb, sl
	movhs ip, r5
	cmp sl, sb
	movlo sb, r8
	movhs sb, r4
	add ip, ip, sb
	sub sb, r3, #2
	str sl, [r0, #4]
	cmp sb, #0
	ble _0223A5A0
	ldr sb, [r1, #8]
	ldr sl, [r2, #8]
	add sb, sb, ip
	cmp sb, ip
	movlo ip, r8
	add sl, sb, sl
	movhs ip, lr
	cmp sl, sb
	movlo sb, r8
	movhs sb, fp
	add ip, ip, sb
	sub sb, r3, #3
	str sl, [r0, #8]
	cmp sb, #0
	ble _0223A5A0
	ldr sb, [r1, #0xc]
	ldr sl, [r2, #0xc]
	add sb, sb, ip
	cmp sb, ip
	movlo ip, r8
	add sl, sb, sl
	ldrhs ip, [sp]
	cmp sl, sb
	movlo sb, r8
	ldrhs sb, [sp, #4]
	sub r3, r3, #4
	cmp r3, #0
	str sl, [r0, #0xc]
	add ip, ip, sb
	addgt r1, r1, #0x10
	addgt r2, r2, #0x10
	addgt r0, r0, #0x10
	bgt _0223A4A4
_0223A5A0:
	mov r0, ip
	add sp, sp, #0xc
	pop {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end ov74_0223A460

	arm_func_start ov74_0223A5B0
ov74_0223A5B0: @ 0x0223A5B0
	push {r4, r5, r6, r7, r8, lr}
	cmp r2, #0
	pople {r4, r5, r6, r7, r8, lr}
	bxle lr
	mov r3, #0x8000
	ldr lr, _0223A700 @ =0x0000FFFF
	rsb ip, r3, #0
_0223A5CC:
	ldr r5, [r1]
	mov r3, #0x8000
	and r4, r5, lr
	and r7, lr, r5, lsr #16
	mul r6, r4, r7
	mul r5, r4, r4
	and r4, r6, lr
	add r8, r5, r4, lsl #17
	rsb r3, r3, #0
	mul r5, r7, r7
	and r3, r6, r3
	add r3, r5, r3, lsr #15
	cmp r8, r4, lsl #17
	addlo r3, r3, #1
	str r8, [r0]
	str r3, [r0, #4]
	subs r3, r2, #1
	popeq {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r4, [r1, #4]
	and r7, lr, r4, lsr #16
	and r3, r4, lr
	mul r6, r3, r7
	mul r4, r3, r3
	and r3, r6, lr
	add r8, r4, r3, lsl #17
	mul r5, r7, r7
	and r4, r6, ip
	cmp r8, r3, lsl #17
	add r3, r5, r4, lsr #15
	addlo r3, r3, #1
	str r8, [r0, #8]
	str r3, [r0, #0xc]
	subs r3, r2, #2
	popeq {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r5, [r1, #8]
	mov r3, #0x8000
	and r4, r5, lr
	and r7, lr, r5, lsr #16
	mul r6, r4, r7
	mul r5, r4, r4
	and r4, r6, lr
	add r8, r5, r4, lsl #17
	rsb r3, r3, #0
	mul r5, r7, r7
	and r3, r6, r3
	add r3, r5, r3, lsr #15
	cmp r8, r4, lsl #17
	addlo r3, r3, #1
	str r8, [r0, #0x10]
	str r3, [r0, #0x14]
	subs r3, r2, #3
	popeq {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r5, [r1, #0xc]
	mov r3, #0x8000
	and r4, r5, lr
	and r7, lr, r5, lsr #16
	mul r6, r4, r7
	mul r5, r4, r4
	and r4, r6, lr
	add r8, r5, r4, lsl #17
	rsb r3, r3, #0
	mul r5, r7, r7
	and r3, r6, r3
	add r3, r5, r3, lsr #15
	cmp r8, r4, lsl #17
	addlo r3, r3, #1
	str r8, [r0, #0x18]
	subs r2, r2, #4
	str r3, [r0, #0x1c]
	addne r1, r1, #0x10
	addne r0, r0, #0x20
	bne _0223A5CC
	pop {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0223A700: .4byte 0x0000FFFF
	arm_func_end ov74_0223A5B0

	arm_func_start ov74_0223A704
ov74_0223A704: @ 0x0223A704
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #4
	cmp r2, #0
	mov r4, #0
	addle sp, sp, #4
	movle r0, r4
	pople {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r5, _0223A8A0 @ =0x0000FFFF
	and lr, r3, r5
	and ip, r5, r3, lsr #16
_0223A730:
	ldr r3, [r1]
	and r7, r5, r3, lsr #16
	mul r6, lr, r7
	and r3, r3, r5
	mla sb, ip, r3, r6
	mul r8, r3, lr
	mul r3, r7, ip
	cmp sb, r6
	and r6, sb, r5
	addlo r3, r3, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add r3, r3, r7
	add r6, r8, r4
	addlo r3, r3, #1
	cmp r6, r4
	addlo r3, r3, #1
	str r6, [r0]
	mov r4, r3
	subs r6, r2, #1
	beq _0223A890
	ldr r4, [r1, #4]
	and r7, r5, r4, lsr #16
	mul r6, lr, r7
	and r4, r4, r5
	mla sb, ip, r4, r6
	mul r8, r4, lr
	mul r4, r7, ip
	cmp sb, r6
	and r6, sb, r5
	addlo r4, r4, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add r4, r4, r7
	add r6, r8, r3
	addlo r4, r4, #1
	cmp r6, r3
	addlo r4, r4, #1
	str r6, [r0, #4]
	subs r3, r2, #2
	beq _0223A890
	ldr r3, [r1, #8]
	and r7, r5, r3, lsr #16
	mul r6, lr, r7
	and r3, r3, r5
	mla sb, ip, r3, r6
	mul r8, r3, lr
	mul r3, r7, ip
	cmp sb, r6
	and r6, sb, r5
	addlo r3, r3, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add r3, r3, r7
	add r6, r8, r4
	addlo r3, r3, #1
	cmp r6, r4
	addlo r3, r3, #1
	str r6, [r0, #8]
	mov r4, r3
	subs r6, r2, #3
	beq _0223A890
	ldr r4, [r1, #0xc]
	and r7, r5, r4, lsr #16
	mul r6, lr, r7
	and r4, r4, r5
	mla sb, ip, r4, r6
	mul r8, r4, lr
	mul r4, r7, ip
	cmp sb, r6
	and r6, sb, r5
	addlo r4, r4, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add r4, r4, r7
	add r6, r8, r3
	addlo r4, r4, #1
	cmp r6, r3
	addlo r4, r4, #1
	subs r2, r2, #4
	str r6, [r0, #0xc]
	addne r1, r1, #0x10
	addne r0, r0, #0x10
	bne _0223A730
_0223A890:
	mov r0, r4
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0223A8A0: .4byte 0x0000FFFF
	arm_func_end ov74_0223A704

	arm_func_start ov74_0223A8A4
ov74_0223A8A4: @ 0x0223A8A4
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #4
	cmp r2, #0
	mov ip, #0
	addle sp, sp, #4
	movle r0, ip
	pople {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r5, _0223AA80 @ =0x0000FFFF
	and r4, r3, r5
	and lr, r5, r3, lsr #16
_0223A8D0:
	ldr r3, [r1]
	and r7, r5, r3, lsr #16
	mul r6, r4, r7
	and r3, r3, r5
	mla sb, lr, r3, r6
	mul r8, r3, r4
	mul r3, r7, lr
	cmp sb, r6
	and r6, sb, r5
	addlo r3, r3, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add r3, r3, r7
	ldr r6, [r0]
	addlo r3, r3, #1
	add r7, r8, ip
	cmp r7, ip
	add r7, r7, r6
	addlo r3, r3, #1
	cmp r7, r6
	addlo r3, r3, #1
	mov ip, r3
	str r7, [r0]
	subs r6, r2, #1
	beq _0223AA70
	ldr ip, [r1, #4]
	and r7, r5, ip, lsr #16
	mul r6, r4, r7
	and ip, ip, r5
	mla sb, lr, ip, r6
	mul r8, ip, r4
	mul ip, r7, lr
	cmp sb, r6
	and r6, sb, r5
	addlo ip, ip, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add ip, ip, r7
	add r6, r8, r3
	addlo ip, ip, #1
	cmp r6, r3
	ldr r3, [r0, #4]
	addlo ip, ip, #1
	add r6, r6, r3
	cmp r6, r3
	addlo ip, ip, #1
	str r6, [r0, #4]
	subs r3, r2, #2
	beq _0223AA70
	ldr r3, [r1, #8]
	and r7, r5, r3, lsr #16
	mul r6, r4, r7
	and r3, r3, r5
	mla sb, lr, r3, r6
	mul r8, r3, r4
	mul r3, r7, lr
	cmp sb, r6
	and r6, sb, r5
	addlo r3, r3, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add r3, r3, r7
	ldr r6, [r0, #8]
	addlo r3, r3, #1
	add r7, r8, ip
	cmp r7, ip
	add r7, r7, r6
	addlo r3, r3, #1
	cmp r7, r6
	addlo r3, r3, #1
	mov ip, r3
	str r7, [r0, #8]
	subs r6, r2, #3
	beq _0223AA70
	ldr ip, [r1, #0xc]
	and r7, r5, ip, lsr #16
	mul r6, r4, r7
	and ip, ip, r5
	mla sb, lr, ip, r6
	mul r8, ip, r4
	mul ip, r7, lr
	cmp sb, r6
	and r6, sb, r5
	addlo ip, ip, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add ip, ip, r7
	add r6, r8, r3
	addlo ip, ip, #1
	cmp r6, r3
	ldr r3, [r0, #0xc]
	addlo ip, ip, #1
	add r6, r6, r3
	cmp r6, r3
	addlo ip, ip, #1
	subs r2, r2, #4
	str r6, [r0, #0xc]
	addne r1, r1, #0x10
	addne r0, r0, #0x10
	bne _0223A8D0
_0223AA70:
	mov r0, ip
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0223AA80: .4byte 0x0000FFFF
	arm_func_end ov74_0223A8A4

	arm_func_start ov74_0223AA84
ov74_0223AA84: @ 0x0223AA84
	stmdb sp!, {lr}
	sub sp, sp, #4
	cmp r1, #0
	addlt sp, sp, #4
	movlt r0, #0
	ldmlt sp!, {lr}
	bxlt lr
	asr r2, r1, #4
	add r2, r1, r2, lsr #27
	lsr r3, r1, #0x1f
	ldr ip, [r0, #4]
	asr lr, r2, #5
	cmp ip, lr
	rsb r1, r3, r1, lsl #27
	addle sp, sp, #4
	add r2, r3, r1, ror #27
	movle r0, #0
	ldmle sp!, {lr}
	bxle lr
	ldr r1, [r0]
	mov r0, #1
	lsl r2, r0, r2
	ldr r1, [r1, lr, lsl #2]
	ands r1, r2, r1
	moveq r0, #0
	add sp, sp, #4
	ldm sp!, {lr}
	bx lr
	arm_func_end ov74_0223AA84

	arm_func_start ov74_0223AAF4
ov74_0223AAF4: @ 0x0223AAF4
	push {r4, r5, r6, lr}
	mov r6, r0
	asr r2, r1, #4
	add r2, r1, r2, lsr #27
	lsr r3, r1, #0x1f
	rsb r1, r3, r1, lsl #27
	ldr r4, [r6, #4]
	asr r5, r2, #5
	cmp r4, r5
	add r4, r3, r1, ror #27
	bgt _0223AB74
	ldr r2, [r6, #8]
	add r1, r5, #1
	cmp r1, r2
	ble _0223AB34
	bl ov74_0223AEB4
_0223AB34:
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, lr}
	bxeq lr
	ldr r3, [r6, #4]
	add r2, r5, #1
	cmp r3, r2
	bge _0223AB6C
	mov r1, #0
_0223AB58:
	ldr r0, [r6]
	str r1, [r0, r3, lsl #2]
	add r3, r3, #1
	cmp r3, r2
	blt _0223AB58
_0223AB6C:
	add r0, r5, #1
	str r0, [r6, #4]
_0223AB74:
	ldr r2, [r6]
	mov r0, #1
	ldr r1, [r2, r5, lsl #2]
	orr r1, r1, r0, lsl r4
	str r1, [r2, r5, lsl #2]
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end ov74_0223AAF4

	arm_func_start ov74_0223AB90
ov74_0223AB90: @ 0x0223AB90
	ldr r3, [r0, #4]
	ldr r2, [r1, #4]
	subs r2, r3, r2
	movne r0, r2
	bxne lr
	subs r2, r3, #1
	ldr ip, [r0]
	ldr r3, [r1]
	bmi _0223ABDC
_0223ABB4:
	ldr r1, [ip, r2, lsl #2]
	ldr r0, [r3, r2, lsl #2]
	cmp r1, r0
	beq _0223ABD4
	cmp r1, r0
	movhi r0, #1
	mvnls r0, #0
	bx lr
_0223ABD4:
	subs r2, r2, #1
	bpl _0223ABB4
_0223ABDC:
	mov r0, #0
	bx lr
	arm_func_end ov74_0223AB90

	arm_func_start ov74_0223ABE4
ov74_0223ABE4: @ 0x0223ABE4
	push {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r0
	mov r4, r1
	bl ov74_0223B180
	add r1, r0, #7
	asr r0, r1, #2
	add r0, r1, r0, lsr #29
	asr r0, r0, #3
	cmp r0, #0
	addle sp, sp, #4
	sub ip, r0, #1
	pople {r4, r5, lr}
	bxle lr
_0223AC1C:
	lsr r3, ip, #0x1f
	asr r1, ip, #1
	rsb r2, r3, ip, lsl #30
	add r1, ip, r1, lsr #30
	add r2, r3, r2, ror #30
	ldr r3, [r5]
	asr r1, r1, #2
	ldr r3, [r3, r1, lsl #2]
	lsl r1, r2, #3
	lsr r1, r3, r1
	cmp ip, #0
	strb r1, [r4], #1
	sub ip, ip, #1
	bgt _0223AC1C
	add sp, sp, #4
	pop {r4, r5, lr}
	bx lr
	arm_func_end ov74_0223ABE4

	arm_func_start ov74_0223AC60
ov74_0223AC60: @ 0x0223AC60
	push {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	movs r5, r2
	mov r7, r0
	mov r6, r1
	bne _0223AC80
	bl ov74_0223AFD8
	mov r5, r0
_0223AC80:
	cmp r5, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, r6, r7, lr}
	bxeq lr
	cmp r6, #0
	mov r4, #0
	addeq sp, sp, #4
	moveq r0, r5
	streq r4, [r5, #4]
	popeq {r4, r5, r6, r7, lr}
	bxeq lr
	add r0, r6, #2
	lsl r2, r0, #3
	add r1, r2, #0x1f
	asr r0, r1, #4
	add r0, r1, r0, lsr #27
	ldr r1, [r5, #8]
	asr r0, r0, #5
	cmp r0, r1
	movle r0, r5
	ble _0223ACF0
	asr r0, r2, #4
	add r0, r2, r0, lsr #27
	asr r1, r0, #5
	mov r0, r5
	add r1, r1, #1
	bl ov74_0223AEB4
_0223ACF0:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, r6, r7, lr}
	bxeq lr
	sub r0, r6, #1
	lsr r1, r0, #2
	add ip, r1, #1
	cmp r6, #0
	str ip, [r5, #4]
	and r3, r0, #3
	sub r6, r6, #1
	beq _0223AD5C
	mov r1, #0
	mov r0, #3
_0223AD2C:
	ldrb r2, [r7], #1
	cmp r3, #0
	sub r3, r3, #1
	orr r4, r2, r4, lsl #8
	ldreq r2, [r5]
	subeq ip, ip, #1
	streq r4, [r2, ip, lsl #2]
	moveq r4, r1
	moveq r3, r0
	cmp r6, #0
	sub r6, r6, #1
	bne _0223AD2C
_0223AD5C:
	mov r0, r5
	bl ov74_0223B038
	mov r0, r5
	add sp, sp, #4
	pop {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end ov74_0223AC60

	arm_func_start ov74_0223AD74
ov74_0223AD74: @ 0x0223AD74
	push {r4, r5, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r2, [r4, #8]
	mov r5, r1
	cmp r2, #1
	bge _0223AD98
	mov r1, #2
	bl ov74_0223AEB4
_0223AD98:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, lr}
	bxeq lr
	mov r0, #0
	str r0, [r4, #0xc]
	str r0, [r4, #4]
	ldr r0, [r4]
	str r5, [r0]
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	strne r0, [r4, #4]
	mov r0, #1
	add sp, sp, #4
	pop {r4, r5, lr}
	bx lr
	arm_func_end ov74_0223AD74

	arm_func_start ov74_0223ADE4
ov74_0223ADE4: @ 0x0223ADE4
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _0223AE08
	ldr r2, [r4, #8]
	mov r1, #0
	lsl r2, r2, #2
	bl FUN_020D4994
_0223AE08:
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #0xc]
	pop {r4, lr}
	bx lr
	arm_func_end ov74_0223ADE4

	arm_func_start ov74_0223AE1C
ov74_0223AE1C: @ 0x0223AE1C
	push {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	addeq sp, sp, #4
	popeq {r4, r5, lr}
	bxeq lr
	ldr r1, [r4, #4]
	ldr r2, [r5, #8]
	cmp r1, r2
	ble _0223AE50
	bl ov74_0223AEB4
_0223AE50:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r4, r5, lr}
	bxeq lr
	ldr r2, [r4, #4]
	ldr r0, [r4]
	ldr r1, [r5]
	lsl r2, r2, #2
	bl FUN_020D4A50
	ldr r0, [r4, #4]
	str r0, [r5, #4]
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _0223AE9C
	ldr r1, [r5]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1]
_0223AE9C:
	ldr r1, [r4, #0xc]
	mov r0, r5
	str r1, [r5, #0xc]
	add sp, sp, #4
	pop {r4, r5, lr}
	bx lr
	arm_func_end ov74_0223AE1C

	arm_func_start ov74_0223AEB4
ov74_0223AEB4: @ 0x0223AEB4
	push {r4, r5, r6, lr}
	mov r5, r0
	ldr r0, [r5, #8]
	mov r4, r1
	cmp r4, r0
	ble _0223AF28
	ldr r0, [r5, #0x10]
	ands r0, r0, #2
	movne r0, #0
	popne {r4, r5, r6, lr}
	bxne lr
	add r0, r4, #1
	lsl r0, r0, #2
	bl ov74_0223B278
	movs r6, r0
	moveq r0, #0
	popeq {r4, r5, r6, lr}
	bxeq lr
	ldr r0, [r5]
	cmp r0, #0
	beq _0223AF20
	ldr r2, [r5, #4]
	mov r1, r6
	lsl r2, r2, #2
	bl FUN_020D4A50
	ldr r0, [r5]
	bl ov74_0223B230
_0223AF20:
	str r6, [r5]
	str r4, [r5, #8]
_0223AF28:
	mov r0, r5
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end ov74_0223AEB4

	arm_func_start ov74_0223AF34
ov74_0223AF34: @ 0x0223AF34
	push {r4, r5, r6, lr}
	mov r6, r0
	add r4, r6, #4
	mov r5, #0
_0223AF44:
	mov r0, r4
	bl ov74_0223B15C
	add r5, r5, #1
	cmp r5, #0xc
	add r4, r4, #0x14
	blt _0223AF44
	ldr r0, [r6, #0x108]
	ands r0, r0, #1
	popeq {r4, r5, r6, lr}
	bxeq lr
	mov r0, r6
	bl ov74_0223B230
	pop {r4, r5, r6, lr}
	bx lr
	arm_func_end ov74_0223AF34

	arm_func_start ov74_0223AF7C
ov74_0223AF7C: @ 0x0223AF7C
	push {r4, lr}
	mov r1, #0
	mov r2, #0x110
	mov r4, r0
	bl FUN_020D4994
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #0x108]
	pop {r4, lr}
	bx lr
	arm_func_end ov74_0223AF7C

	arm_func_start ov74_0223AFA4
ov74_0223AFA4: @ 0x0223AFA4
	push {r4, lr}
	mov r0, #0x110
	bl ov74_0223B278
	movs r4, r0
	moveq r0, #0
	popeq {r4, lr}
	bxeq lr
	bl ov74_0223AF7C
	mov r1, #1
	mov r0, r4
	str r1, [r4, #0x108]
	pop {r4, lr}
	bx lr
	arm_func_end ov74_0223AFA4

	arm_func_start ov74_0223AFD8
ov74_0223AFD8: @ 0x0223AFD8
	stmdb sp!, {lr}
	sub sp, sp, #4
	mov r0, #0x14
	bl ov74_0223B278
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeq sp!, {lr}
	bxeq lr
	mov r1, #1
	str r1, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	str r1, [r0]
	add sp, sp, #4
	ldm sp!, {lr}
	bx lr
	arm_func_end ov74_0223AFD8

	arm_func_start ov74_0223B024
ov74_0223B024: @ 0x0223B024
	ldr ip, _0223B034 @ =FUN_020D4994
	mov r1, #0
	mov r2, #0x14
	bx ip
	.align 2, 0
_0223B034: .4byte FUN_020D4994
	arm_func_end ov74_0223B024

	arm_func_start ov74_0223B038
ov74_0223B038: @ 0x0223B038
	ldr r3, [r0, #4]
	cmp r3, #0
	bxle lr
	ldr r2, [r0]
	sub r1, r3, #1
	cmp r3, #0
	add r3, r2, r1, lsl #2
	bxle lr
	add r2, r0, #4
_0223B05C:
	ldr r1, [r3], #-4
	cmp r1, #0
	bxne lr
	ldr r1, [r2]
	sub r1, r1, #1
	str r1, [r2]
	ldr r1, [r0, #4]
	cmp r1, #0
	bgt _0223B05C
	bx lr
	arm_func_end ov74_0223B038

	arm_func_start ov74_0223B084
ov74_0223B084: @ 0x0223B084
	push {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r0
	ldr r2, [r5, #4]
	mov r4, r1
	cmp r2, r4
	addge sp, sp, #4
	popge {r4, r5, lr}
	bxge lr
	ldr r2, [r5, #8]
	cmp r4, r2
	ble _0223B0B8
	bl ov74_0223AEB4
_0223B0B8:
	ldr r0, [r5]
	cmp r0, #0
	addeq sp, sp, #4
	popeq {r4, r5, lr}
	bxeq lr
	ldr r2, [r5, #4]
	cmp r2, r4
	addge sp, sp, #4
	popge {r4, r5, lr}
	bxge lr
	mov r1, #0
_0223B0E4:
	ldr r0, [r5]
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, r4
	blt _0223B0E4
	add sp, sp, #4
	pop {r4, r5, lr}
	bx lr
	arm_func_end ov74_0223B084

	arm_func_start ov74_0223B104
ov74_0223B104: @ 0x0223B104
	push {r4, lr}
	movs r4, r0
	popeq {r4, lr}
	bxeq lr
	ldr r0, [r4]
	cmp r0, #0
	beq _0223B130
	ldr r1, [r4, #0x10]
	ands r1, r1, #2
	bne _0223B130
	bl ov74_0223B230
_0223B130:
	ldr r0, [r4, #0x10]
	orr r0, r0, #0x8000
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x10]
	ands r0, r0, #1
	popeq {r4, lr}
	bxeq lr
	mov r0, r4
	bl ov74_0223B230
	pop {r4, lr}
	bx lr
	arm_func_end ov74_0223B104

	arm_func_start ov74_0223B15C
ov74_0223B15C: @ 0x0223B15C
	push {r4, lr}
	movs r4, r0
	popeq {r4, lr}
	bxeq lr
	bl ov74_0223ADE4
	mov r0, r4
	bl ov74_0223B104
	pop {r4, lr}
	bx lr
	arm_func_end ov74_0223B15C

	arm_func_start ov74_0223B180
ov74_0223B180: @ 0x0223B180
	push {r4, lr}
	ldr r1, [r0, #4]
	cmp r1, #0
	moveq r0, #0
	popeq {r4, lr}
	bxeq lr
	ldr r0, [r0]
	sub r4, r1, #1
	ldr r0, [r0, r4, lsl #2]
	bl ov74_0223B1B4
	add r0, r0, r4, lsl #5
	pop {r4, lr}
	bx lr
	arm_func_end ov74_0223B180

	arm_func_start ov74_0223B1B4
ov74_0223B1B4: @ 0x0223B1B4
	mov r1, #0x10000
	rsb r1, r1, #0
	ands r1, r0, r1
	beq _0223B1D4
	ands r1, r0, #0xff000000
	movne r2, #0x18
	moveq r2, #0x10
	b _0223B1E0
_0223B1D4:
	ands r1, r0, #0xff00
	movne r2, #8
	moveq r2, #0
_0223B1E0:
	lsr r1, r0, r2
	ands r0, r1, #0xf0
	ldreq r0, _0223B210 @ =0x0223BB60
	ldrsbeq r0, [r0, r1]
	addeq r0, r0, r2
	bxeq lr
	ldr r0, _0223B210 @ =0x0223BB60
	lsr r1, r1, #4
	ldrsb r0, [r0, r1]
	add r0, r0, r2
	add r0, r0, #4
	bx lr
	.align 2, 0
_0223B210: .4byte 0x0223BB60
	arm_func_end ov74_0223B1B4

	arm_func_start ov74_0223B214
ov74_0223B214: @ 0x0223B214
	ldr r3, _0223B228 @ =0x0223E9F8
	ldr r2, _0223B22C @ =0x0223E9FC
	str r0, [r3]
	str r1, [r2]
	bx lr
	.align 2, 0
_0223B228: .4byte 0x0223E9F8
_0223B22C: .4byte 0x0223E9FC
	arm_func_end ov74_0223B214

	arm_func_start ov74_0223B230
ov74_0223B230: @ 0x0223B230
	stmdb sp!, {lr}
	sub sp, sp, #4
	ldr r1, _0223B274 @ =0x0223E9FC
	mov r2, r0
	ldr r1, [r1]
	cmp r1, #0
	beq _0223B25C
	blx r1
	add sp, sp, #4
	ldm sp!, {lr}
	bx lr
_0223B25C:
	mov r0, #0
	mvn r1, #0
	bl FUN_020D2F5C
	add sp, sp, #4
	ldm sp!, {lr}
	bx lr
	.align 2, 0
_0223B274: .4byte 0x0223E9FC
	arm_func_end ov74_0223B230

	arm_func_start ov74_0223B278
ov74_0223B278: @ 0x0223B278
	stmdb sp!, {lr}
	sub sp, sp, #4
	ldr r1, _0223B2BC @ =0x0223E9F8
	mov r2, r0
	ldr r1, [r1]
	cmp r1, #0
	beq _0223B2A4
	blx r1
	add sp, sp, #4
	ldm sp!, {lr}
	bx lr
_0223B2A4:
	mov r0, #0
	mvn r1, #0
	bl FUN_020D2E54
	add sp, sp, #4
	ldm sp!, {lr}
	bx lr
	.align 2, 0
_0223B2BC: .4byte 0x0223E9F8
	arm_func_end ov74_0223B278

	.rodata

_0223B2C0:
	.byte 0x06, 0x22, 0xDE, 0xFA, 0x9E, 0xBA, 0xDE, 0xFA, 0xFF, 0x00, 0x00, 0x00, 0x70, 0x88, 0x20, 0xE0
	.byte 0x98, 0xB0, 0x20, 0xE0, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x21, 0x89, 0x22, 0x02, 0xD5, 0x89, 0x22, 0x02, 0x61, 0x8C, 0x22, 0x02, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x92, 0x22, 0x02, 0x95, 0x92, 0x22, 0x02, 0x51, 0x94, 0x22, 0x02, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0xA1, 0x9D, 0x22, 0x02, 0xCD, 0x9D, 0x22, 0x02
	.byte 0xD5, 0x9D, 0x22, 0x02, 0xE1, 0x9D, 0x22, 0x02, 0xC1, 0x42, 0x03, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x6D, 0xAE, 0x22, 0x02, 0xED, 0xC2, 0x22, 0x02, 0x95, 0xCD, 0x22, 0x02, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00
	.byte 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00
	.byte 0x96, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0xB4, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x00, 0x00, 0xB4, 0x00, 0x00, 0x00, 0xB4, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x00, 0x00
	.byte 0xD2, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x00, 0x00
	.byte 0xFD, 0xDD, 0x22, 0x02, 0xF5, 0xE1, 0x22, 0x02, 0x45, 0xEB, 0x22, 0x02, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x99, 0xF5, 0x22, 0x02, 0xD5, 0xF7, 0x22, 0x02, 0x8D, 0xFB, 0x22, 0x02, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x03, 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x31, 0x32, 0x23, 0x02, 0xF5, 0x32, 0x23, 0x02
	.byte 0xD5, 0x38, 0x23, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x4C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x02, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02
	.byte 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x41, 0x58, 0x56, 0x4A, 0x00, 0x00, 0x01, 0x00, 0x41, 0x58, 0x56, 0x45, 0x00, 0x00, 0x02, 0x00
	.byte 0x41, 0x58, 0x56, 0x46, 0x00, 0x00, 0x03, 0x00, 0x41, 0x58, 0x56, 0x44, 0x00, 0x00, 0x05, 0x00
	.byte 0x41, 0x58, 0x56, 0x53, 0x00, 0x00, 0x07, 0x00, 0x41, 0x58, 0x56, 0x49, 0x00, 0x00, 0x04, 0x00
	.byte 0x41, 0x58, 0x50, 0x4A, 0x00, 0x01, 0x01, 0x00, 0x41, 0x58, 0x50, 0x45, 0x00, 0x01, 0x02, 0x00
	.byte 0x41, 0x58, 0x50, 0x46, 0x00, 0x01, 0x03, 0x00, 0x41, 0x58, 0x50, 0x44, 0x00, 0x01, 0x05, 0x00
	.byte 0x41, 0x58, 0x50, 0x53, 0x00, 0x01, 0x07, 0x00, 0x41, 0x58, 0x50, 0x49, 0x00, 0x01, 0x04, 0x00
	.byte 0x42, 0x50, 0x52, 0x4A, 0x01, 0x03, 0x01, 0x00, 0x42, 0x50, 0x52, 0x45, 0x01, 0x03, 0x02, 0x00
	.byte 0x42, 0x50, 0x52, 0x46, 0x01, 0x03, 0x03, 0x00, 0x42, 0x50, 0x52, 0x44, 0x01, 0x03, 0x05, 0x00
	.byte 0x42, 0x50, 0x52, 0x53, 0x01, 0x03, 0x07, 0x00, 0x42, 0x50, 0x52, 0x49, 0x01, 0x03, 0x04, 0x00
	.byte 0x42, 0x50, 0x47, 0x4A, 0x01, 0x02, 0x01, 0x00, 0x42, 0x50, 0x47, 0x45, 0x01, 0x02, 0x02, 0x00
	.byte 0x42, 0x50, 0x47, 0x46, 0x01, 0x02, 0x03, 0x00, 0x42, 0x50, 0x47, 0x44, 0x01, 0x02, 0x05, 0x00
	.byte 0x42, 0x50, 0x47, 0x53, 0x01, 0x02, 0x07, 0x00, 0x42, 0x50, 0x47, 0x49, 0x01, 0x02, 0x04, 0x00
	.byte 0x42, 0x50, 0x45, 0x4A, 0x02, 0x04, 0x01, 0x00, 0x42, 0x50, 0x45, 0x45, 0x02, 0x04, 0x02, 0x00
	.byte 0x42, 0x50, 0x45, 0x46, 0x02, 0x04, 0x03, 0x00, 0x42, 0x50, 0x45, 0x44, 0x02, 0x04, 0x05, 0x00
	.byte 0x42, 0x50, 0x45, 0x53, 0x02, 0x04, 0x07, 0x00, 0x42, 0x50, 0x45, 0x49, 0x02, 0x04, 0x04, 0x00
	.byte 0xC8, 0x7E, 0x66, 0x71, 0x46, 0x0B, 0xE6, 0x6F, 0x17, 0x8A, 0x5C, 0x7D, 0xEA, 0xE1, 0x93, 0xFD
	.byte 0xEE, 0xFA, 0x99, 0x84, 0xFE, 0x35, 0x02, 0xB9, 0x7F, 0x4F, 0xF1, 0x19, 0x74, 0xA2, 0x0F, 0x65
	.byte 0x8A, 0x9C, 0x44, 0x81, 0x0C, 0x1F, 0x94, 0xE4, 0xC0, 0xB6, 0xD7, 0x20, 0xEE, 0x11, 0x9A, 0x8D
	.byte 0x27, 0x33, 0x9B, 0x7B, 0x02, 0xE9, 0x33, 0x11, 0xDC, 0xCF, 0x72, 0xD9, 0xA8, 0x78, 0x12, 0x8C
	.byte 0x3B, 0x60, 0xD5, 0x24, 0xB8, 0xD9, 0xFC, 0x8D, 0x15, 0xBA, 0x0B, 0x90, 0xA3, 0xBD, 0x3A, 0xE4
	.byte 0x01, 0x18, 0xBA, 0xF9, 0x65, 0xA5, 0x15, 0x37, 0xDC, 0x7A, 0x48, 0x5C, 0x3A, 0x55, 0x35, 0x43
	.byte 0xE2, 0xC6, 0x66, 0xBA, 0x21, 0xEA, 0x67, 0x2E, 0xA8, 0x29, 0x03, 0xD7, 0x1F, 0x0F, 0xC6, 0xDE
	.byte 0x1B, 0xE2, 0xA1, 0xCA, 0x21, 0x51, 0xFE, 0xB9, 0x68, 0x17, 0x3C, 0xEB, 0x04, 0x54, 0xE0, 0xBD
	.byte 0x28, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01
	.byte 0x02, 0x01, 0x03, 0x02, 0x04, 0x03, 0x05, 0x02, 0x06, 0x02, 0x07, 0x00, 0x08, 0x05, 0x09, 0x05
	.byte 0x0A, 0x05, 0x0B, 0x04, 0x0C, 0x05, 0x0D, 0x05, 0x0E, 0x02, 0x0F, 0x02, 0xFF, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x03, 0x00, 0x03, 0x00, 0x05, 0x00, 0x05, 0x00, 0x07, 0x00, 0x07, 0x00
	.byte 0x09, 0x00, 0x09, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x0E, 0x00
	.byte 0x10, 0x00, 0x10, 0x00, 0x12, 0x00, 0x12, 0x00, 0x14, 0x00, 0x14, 0x00, 0x16, 0x00, 0x16, 0x00
	.byte 0x18, 0x00, 0x18, 0x00, 0x1A, 0x00, 0x1A, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x1E, 0x00, 0x1E, 0x00
	.byte 0x20, 0x00, 0x20, 0x00, 0x22, 0x00, 0x22, 0x00, 0x25, 0x00, 0x25, 0x00, 0x27, 0x00, 0x27, 0x00
	.byte 0x29, 0x00, 0x29, 0x00, 0x2B, 0x00, 0x2B, 0x00, 0x2C, 0x00, 0x2C, 0x00, 0x2D, 0x00, 0x2D, 0x00
	.byte 0x2E, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x30, 0x00, 0x33, 0x00, 0x33, 0x00
	.byte 0x36, 0x00, 0x36, 0x00, 0x39, 0x00, 0x39, 0x00, 0x3C, 0x00, 0x3C, 0x00, 0x3F, 0x00, 0x3F, 0x00
	.byte 0x40, 0x00, 0x40, 0x00, 0x41, 0x00, 0x41, 0x00, 0x42, 0x00, 0x42, 0x00, 0x43, 0x00, 0x43, 0x00
	.byte 0x45, 0x00, 0x45, 0x00, 0x47, 0x00, 0x47, 0x00, 0x49, 0x00, 0x49, 0x00, 0x4A, 0x00, 0x4A, 0x00
	.byte 0x4B, 0x00, 0x4B, 0x00, 0x4C, 0x00, 0x4C, 0x00, 0x4D, 0x00, 0x4D, 0x00, 0x4E, 0x00, 0x4E, 0x00
	.byte 0x4F, 0x00, 0x4F, 0x00, 0x50, 0x00, 0x50, 0x00, 0x51, 0x00, 0x51, 0x00, 0x02, 0x00, 0x02, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x06, 0x00, 0x06, 0x00, 0x08, 0x00, 0x08, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x44, 0x00, 0x44, 0x00, 0x46, 0x00, 0x46, 0x00, 0x48, 0x00, 0x48, 0x00, 0x0D, 0x00, 0x0D, 0x00
	.byte 0x0F, 0x00, 0x0F, 0x00, 0x11, 0x00, 0x11, 0x00, 0x13, 0x00, 0x13, 0x00, 0x15, 0x00, 0x15, 0x00
	.byte 0x17, 0x00, 0x17, 0x00, 0x19, 0x00, 0x19, 0x00, 0x1B, 0x00, 0x1B, 0x00, 0x1D, 0x00, 0x1D, 0x00
	.byte 0x1F, 0x00, 0x1F, 0x00, 0x21, 0x00, 0x21, 0x00, 0x23, 0x00, 0x23, 0x00, 0x26, 0x00, 0x26, 0x00
	.byte 0x28, 0x00, 0x28, 0x00, 0x2A, 0x00, 0x2A, 0x00, 0x31, 0x00, 0x31, 0x00, 0x34, 0x00, 0x34, 0x00
	.byte 0x37, 0x00, 0x37, 0x00, 0x3A, 0x00, 0x3A, 0x00, 0x3D, 0x00, 0x3D, 0x00, 0x32, 0x00, 0x32, 0x00
	.byte 0x35, 0x00, 0x35, 0x00, 0x38, 0x00, 0x38, 0x00, 0x3B, 0x00, 0x3B, 0x00, 0x3E, 0x00, 0x3E, 0x00
	.byte 0x24, 0x00, 0x24, 0x00, 0x53, 0x00, 0x53, 0x00, 0x55, 0x00, 0x55, 0x00, 0x57, 0x00, 0x57, 0x00
	.byte 0x59, 0x00, 0x59, 0x00, 0x5B, 0x00, 0x5B, 0x00, 0x5C, 0x00, 0x5C, 0x00, 0x5E, 0x00, 0x5E, 0x00
	.byte 0x60, 0x00, 0x60, 0x00, 0x62, 0x00, 0x62, 0x00, 0x64, 0x00, 0x64, 0x00, 0x66, 0x00, 0x66, 0x00
	.byte 0x68, 0x00, 0x68, 0x00, 0x6A, 0x00, 0x6A, 0x00, 0x6C, 0x00, 0x6C, 0x00, 0x6E, 0x00, 0x6E, 0x00
	.byte 0x70, 0x00, 0x70, 0x00, 0x72, 0x00, 0x72, 0x00, 0x75, 0x00, 0x75, 0x00, 0x77, 0x00, 0x77, 0x00
	.byte 0x79, 0x00, 0x79, 0x00, 0x7B, 0x00, 0x7B, 0x00, 0x7C, 0x00, 0x7C, 0x00, 0x7D, 0x00, 0x7D, 0x00
	.byte 0x7E, 0x00, 0x7E, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x80, 0x00, 0x80, 0x00, 0x83, 0x00, 0x83, 0x00
	.byte 0x86, 0x00, 0x86, 0x00, 0x89, 0x00, 0x89, 0x00, 0x8C, 0x00, 0x8C, 0x00, 0x8F, 0x00, 0x8F, 0x00
	.byte 0x90, 0x00, 0x90, 0x00, 0x91, 0x00, 0x91, 0x00, 0x92, 0x00, 0x92, 0x00, 0x93, 0x00, 0x93, 0x00
	.byte 0x95, 0x00, 0x95, 0x00, 0x97, 0x00, 0x97, 0x00, 0x99, 0x00, 0x99, 0x00, 0x9A, 0x00, 0x9A, 0x00
	.byte 0x9B, 0x00, 0x9B, 0x00, 0x9C, 0x00, 0x9C, 0x00, 0x9D, 0x00, 0x9D, 0x00, 0x9E, 0x00, 0x9E, 0x00
	.byte 0x9F, 0x00, 0x9F, 0x00, 0xA0, 0x00, 0xA0, 0x00, 0xA1, 0x00, 0xA1, 0x00, 0x52, 0x00, 0x52, 0x00
	.byte 0x54, 0x00, 0x54, 0x00, 0x56, 0x00, 0x56, 0x00, 0x58, 0x00, 0x58, 0x00, 0x5A, 0x00, 0x5A, 0x00
	.byte 0x94, 0x00, 0x94, 0x00, 0x96, 0x00, 0x96, 0x00, 0x98, 0x00, 0x98, 0x00, 0x5D, 0x00, 0x5D, 0x00
	.byte 0x5F, 0x00, 0x5F, 0x00, 0x61, 0x00, 0x61, 0x00, 0x63, 0x00, 0x63, 0x00, 0x65, 0x00, 0x65, 0x00
	.byte 0x67, 0x00, 0x67, 0x00, 0x69, 0x00, 0x69, 0x00, 0x6B, 0x00, 0x6B, 0x00, 0x6D, 0x00, 0x6D, 0x00
	.byte 0x6F, 0x00, 0x6F, 0x00, 0x71, 0x00, 0x71, 0x00, 0x73, 0x00, 0x73, 0x00, 0x76, 0x00, 0x76, 0x00
	.byte 0x78, 0x00, 0x78, 0x00, 0x7A, 0x00, 0x7A, 0x00, 0x81, 0x00, 0x81, 0x00, 0x84, 0x00, 0x84, 0x00
	.byte 0x87, 0x00, 0x87, 0x00, 0x8A, 0x00, 0x8A, 0x00, 0x8D, 0x00, 0x8D, 0x00, 0x82, 0x00, 0x82, 0x00
	.byte 0x85, 0x00, 0x85, 0x00, 0x88, 0x00, 0x88, 0x00, 0x8B, 0x00, 0x8B, 0x00, 0x8E, 0x00, 0x8E, 0x00
	.byte 0x74, 0x00, 0x74, 0x00, 0xA2, 0x00, 0x21, 0x01, 0xA3, 0x00, 0x22, 0x01, 0xA4, 0x00, 0x23, 0x01
	.byte 0xA5, 0x00, 0x24, 0x01, 0xA6, 0x00, 0x25, 0x01, 0xA7, 0x00, 0x26, 0x01, 0xA8, 0x00, 0x27, 0x01
	.byte 0xA9, 0x00, 0x28, 0x01, 0xAA, 0x00, 0x29, 0x01, 0xAB, 0x00, 0x2A, 0x01, 0xE1, 0x00, 0xAB, 0x01
	.byte 0xE2, 0x00, 0xAC, 0x01, 0xE4, 0x00, 0xAE, 0x01, 0xF1, 0x00, 0xBE, 0x01, 0xE6, 0x00, 0xB0, 0x01
	.byte 0xE5, 0x00, 0xAF, 0x01, 0xEA, 0x00, 0xEA, 0x00, 0xEB, 0x00, 0xEB, 0x00, 0xE8, 0x00, 0xB2, 0x01
	.byte 0xE9, 0x00, 0xB3, 0x01, 0xEE, 0x00, 0xBB, 0x01, 0xEF, 0x00, 0xBC, 0x01, 0x12, 0x01, 0x12, 0x01
	.byte 0xE3, 0x00, 0xAD, 0x01, 0xF2, 0x00, 0x76, 0x01, 0xE7, 0x00, 0xB1, 0x01, 0xAC, 0x00, 0x2B, 0x01
	.byte 0xAD, 0x00, 0x2C, 0x01, 0xAE, 0x00, 0x2D, 0x01, 0xAF, 0x00, 0x2E, 0x01, 0xB0, 0x00, 0x2F, 0x01
	.byte 0xB1, 0x00, 0x30, 0x01, 0xB2, 0x00, 0x31, 0x01, 0xB3, 0x00, 0x32, 0x01, 0xB4, 0x00, 0x33, 0x01
	.byte 0xB5, 0x00, 0x34, 0x01, 0xB6, 0x00, 0x35, 0x01, 0xB7, 0x00, 0x36, 0x01, 0xB8, 0x00, 0x37, 0x01
	.byte 0xB9, 0x00, 0x38, 0x01, 0xBA, 0x00, 0x39, 0x01, 0xBB, 0x00, 0x3A, 0x01, 0xBC, 0x00, 0x3B, 0x01
	.byte 0xBD, 0x00, 0x3C, 0x01, 0xBE, 0x00, 0x3D, 0x01, 0xBF, 0x00, 0x3E, 0x01, 0xC0, 0x00, 0x3F, 0x01
	.byte 0xC1, 0x00, 0x40, 0x01, 0xC2, 0x00, 0x41, 0x01, 0xC3, 0x00, 0x42, 0x01, 0xC4, 0x00, 0x43, 0x01
	.byte 0xC5, 0x00, 0x44, 0x01, 0xC6, 0x00, 0x45, 0x01, 0xC7, 0x00, 0x46, 0x01, 0xC8, 0x00, 0x47, 0x01
	.byte 0xC9, 0x00, 0x48, 0x01, 0xCA, 0x00, 0x49, 0x01, 0xCB, 0x00, 0x4A, 0x01, 0xCC, 0x00, 0x4B, 0x01
	.byte 0xCD, 0x00, 0x4C, 0x01, 0xCE, 0x00, 0x4D, 0x01, 0xCF, 0x00, 0x4E, 0x01, 0xD0, 0x00, 0x4F, 0x01
	.byte 0xD1, 0x00, 0x50, 0x01, 0xD2, 0x00, 0x51, 0x01, 0xD3, 0x00, 0x52, 0x01, 0xD4, 0x00, 0x53, 0x01
	.byte 0xD5, 0x00, 0x54, 0x01, 0xD6, 0x00, 0x55, 0x01, 0xD7, 0x00, 0x56, 0x01, 0xD8, 0x00, 0x57, 0x01
	.byte 0xD9, 0x00, 0x58, 0x01, 0xDA, 0x00, 0x59, 0x01, 0xDB, 0x00, 0x5A, 0x01, 0xDC, 0x00, 0x5B, 0x01
	.byte 0xDD, 0x00, 0x5C, 0x01, 0xDE, 0x00, 0x5D, 0x01, 0xDF, 0x00, 0x5E, 0x01, 0x1F, 0x01, 0x1F, 0x01
	.byte 0xF6, 0x00, 0xC4, 0x01, 0x63, 0x01, 0x63, 0x01, 0x75, 0x01, 0x75, 0x01, 0x7B, 0x01, 0x7B, 0x01
	.byte 0x83, 0x01, 0x83, 0x01, 0x95, 0x01, 0x95, 0x01, 0x9B, 0x01, 0x9B, 0x01, 0x00, 0x08, 0x01, 0x01
	.byte 0x01, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x01, 0x01, 0x01, 0x04, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x02, 0x02, 0x03, 0x03, 0x03, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04
	.byte 0x06, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x05, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00

	.data

_0223BBC0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x20, 0x03, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x81, 0x53, 0x83, 0x53, 0x85, 0x53, 0x87, 0x53, 0x89, 0x53, 0x8B, 0x53, 0x8D, 0x53, 0x8F, 0x53
	.byte 0x91, 0x53, 0x93, 0x53, 0x95, 0x53, 0x97, 0x53, 0x99, 0x53, 0x9B, 0x53, 0x9D, 0x53, 0x9F, 0x53
	.byte 0x9D, 0x53, 0x9B, 0x53, 0x99, 0x53, 0x97, 0x53, 0x95, 0x53, 0x93, 0x53, 0x91, 0x53, 0x8F, 0x53
	.byte 0x8D, 0x53, 0x8B, 0x53, 0x89, 0x53, 0x87, 0x53, 0x85, 0x53, 0x83, 0x53, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x95, 0x7E, 0x22, 0x02, 0x02, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x55, 0x82, 0x22, 0x02, 0x04, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xB5, 0x80, 0x22, 0x02, 0x05, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x61, 0x81, 0x22, 0x02, 0x06, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x41, 0x80, 0x22, 0x02, 0x07, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0xBD, 0x81, 0x22, 0x02, 0x08, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x82, 0x22, 0x02, 0x09, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x91, 0x82, 0x22, 0x02, 0x64, 0x61, 0x74, 0x61
	.byte 0x2F, 0x65, 0x6F, 0x6F, 0x2E, 0x64, 0x61, 0x74, 0x00, 0x00, 0x00, 0x00, 0x16, 0x01, 0x15, 0x00
	.byte 0x90, 0xD0, 0x23, 0x02, 0x80, 0xD0, 0x23, 0x02, 0x00, 0x00, 0xFF, 0xFF, 0x21, 0x00, 0xE1, 0x00
	.byte 0x23, 0x00, 0xC0, 0x01, 0x25, 0x00, 0xD2, 0x01, 0x27, 0x00, 0xEA, 0x00, 0x28, 0x00, 0xEB, 0x00
	.byte 0x29, 0x00, 0xBF, 0x01, 0x2A, 0x00, 0xBD, 0x01, 0x2B, 0x00, 0xAD, 0x01, 0x2C, 0x00, 0xBE, 0x01
	.byte 0x2E, 0x00, 0xB1, 0x01, 0x30, 0x00, 0xA2, 0x00, 0x31, 0x00, 0xA3, 0x00, 0x32, 0x00, 0xA4, 0x00
	.byte 0x33, 0x00, 0xA5, 0x00, 0x34, 0x00, 0xA6, 0x00, 0x35, 0x00, 0xA7, 0x00, 0x36, 0x00, 0xA8, 0x00
	.byte 0x37, 0x00, 0xA9, 0x00, 0x38, 0x00, 0xAA, 0x00, 0x39, 0x00, 0xAB, 0x00, 0x3A, 0x00, 0xC4, 0x01
	.byte 0x3B, 0x00, 0xC5, 0x01, 0x3C, 0x00, 0xEC, 0x00, 0x3E, 0x00, 0xED, 0x00, 0x3F, 0x00, 0xAC, 0x01
	.byte 0x41, 0x00, 0xAC, 0x00, 0x42, 0x00, 0xAD, 0x00, 0x43, 0x00, 0xAE, 0x00, 0x44, 0x00, 0xAF, 0x00
	.byte 0x45, 0x00, 0xB0, 0x00, 0x46, 0x00, 0xB1, 0x00, 0x47, 0x00, 0xB2, 0x00, 0x48, 0x00, 0xB3, 0x00
	.byte 0x49, 0x00, 0xB4, 0x00, 0x4A, 0x00, 0xB5, 0x00, 0x4B, 0x00, 0xB6, 0x00, 0x4C, 0x00, 0xB7, 0x00
	.byte 0x4D, 0x00, 0xB8, 0x00, 0x4E, 0x00, 0xB9, 0x00, 0x4F, 0x00, 0xBA, 0x00, 0x50, 0x00, 0xBB, 0x00
	.byte 0x51, 0x00, 0xBC, 0x00, 0x52, 0x00, 0xBD, 0x00, 0x53, 0x00, 0xBE, 0x00, 0x54, 0x00, 0xBF, 0x00
	.byte 0x55, 0x00, 0xC0, 0x00, 0x56, 0x00, 0xC1, 0x00, 0x57, 0x00, 0xC2, 0x00, 0x58, 0x00, 0xC3, 0x00
	.byte 0x59, 0x00, 0xC4, 0x00, 0x5A, 0x00, 0xC5, 0x00, 0x61, 0x00, 0xC6, 0x00, 0x62, 0x00, 0xC7, 0x00
	.byte 0x63, 0x00, 0xC8, 0x00, 0x64, 0x00, 0xC9, 0x00, 0x65, 0x00, 0xCA, 0x00, 0x66, 0x00, 0xCB, 0x00
	.byte 0x67, 0x00, 0xCC, 0x00, 0x68, 0x00, 0xCD, 0x00, 0x69, 0x00, 0xCE, 0x00, 0x6A, 0x00, 0xCF, 0x00
	.byte 0x6B, 0x00, 0xD0, 0x00, 0x6C, 0x00, 0xD1, 0x00, 0x6D, 0x00, 0xD2, 0x00, 0x6E, 0x00, 0xD3, 0x00
	.byte 0x6F, 0x00, 0xD4, 0x00, 0x70, 0x00, 0xD5, 0x00, 0x71, 0x00, 0xD6, 0x00, 0x72, 0x00, 0xD7, 0x00
	.byte 0x73, 0x00, 0xD8, 0x00, 0x74, 0x00, 0xD9, 0x00, 0x75, 0x00, 0xDA, 0x00, 0x76, 0x00, 0xDB, 0x00
	.byte 0x77, 0x00, 0xDC, 0x00, 0x78, 0x00, 0xDD, 0x00, 0x79, 0x00, 0xDE, 0x00, 0x7A, 0x00, 0xDF, 0x00
	.byte 0x81, 0x00, 0x02, 0x00, 0x82, 0x00, 0x03, 0x00, 0x83, 0x00, 0x04, 0x00, 0x84, 0x00, 0x05, 0x00
	.byte 0x85, 0x00, 0x06, 0x00, 0x86, 0x00, 0x07, 0x00, 0x87, 0x00, 0x08, 0x00, 0x88, 0x00, 0x09, 0x00
	.byte 0x89, 0x00, 0x0A, 0x00, 0x8A, 0x00, 0x0B, 0x00, 0x8B, 0x00, 0x0C, 0x00, 0x8C, 0x00, 0x0D, 0x00
	.byte 0x8D, 0x00, 0x0E, 0x00, 0x8E, 0x00, 0x0F, 0x00, 0x8F, 0x00, 0x10, 0x00, 0x90, 0x00, 0x11, 0x00
	.byte 0x91, 0x00, 0x12, 0x00, 0x92, 0x00, 0x13, 0x00, 0x93, 0x00, 0x14, 0x00, 0x94, 0x00, 0x15, 0x00
	.byte 0x95, 0x00, 0x16, 0x00, 0x96, 0x00, 0x17, 0x00, 0x97, 0x00, 0x18, 0x00, 0x98, 0x00, 0x19, 0x00
	.byte 0x99, 0x00, 0x1A, 0x00, 0x9A, 0x00, 0x1B, 0x00, 0x9B, 0x00, 0x1C, 0x00, 0x9C, 0x00, 0x1D, 0x00
	.byte 0x9D, 0x00, 0x1E, 0x00, 0x9E, 0x00, 0x1F, 0x00, 0x9F, 0x00, 0x20, 0x00, 0xA0, 0x00, 0x21, 0x00
	.byte 0xA1, 0x00, 0x22, 0x00, 0xA2, 0x00, 0x23, 0x00, 0xA3, 0x00, 0x24, 0x00, 0xA4, 0x00, 0x25, 0x00
	.byte 0xA5, 0x00, 0x26, 0x00, 0xA6, 0x00, 0x27, 0x00, 0xA7, 0x00, 0x28, 0x00, 0xA8, 0x00, 0x29, 0x00
	.byte 0xA9, 0x00, 0x2A, 0x00, 0xAA, 0x00, 0x2B, 0x00, 0xAB, 0x00, 0x2C, 0x00, 0xAC, 0x00, 0x2D, 0x00
	.byte 0xAD, 0x00, 0x2E, 0x00, 0xAE, 0x00, 0x2F, 0x00, 0xAF, 0x00, 0x30, 0x00, 0xB0, 0x00, 0x31, 0x00
	.byte 0xB1, 0x00, 0x32, 0x00, 0xB2, 0x00, 0x33, 0x00, 0xB3, 0x00, 0x34, 0x00, 0xB4, 0x00, 0x35, 0x00
	.byte 0xB5, 0x00, 0x36, 0x00, 0xB6, 0x00, 0x37, 0x00, 0xB7, 0x00, 0x38, 0x00, 0xB8, 0x00, 0x39, 0x00
	.byte 0xB9, 0x00, 0x3A, 0x00, 0xBA, 0x00, 0x3B, 0x00, 0xBB, 0x00, 0x3C, 0x00, 0xBC, 0x00, 0x3D, 0x00
	.byte 0xBD, 0x00, 0x3E, 0x00, 0xBE, 0x00, 0x3F, 0x00, 0xBF, 0x00, 0x40, 0x00, 0xC0, 0x00, 0x41, 0x00
	.byte 0xC1, 0x00, 0x42, 0x00, 0xC2, 0x00, 0x43, 0x00, 0xC3, 0x00, 0x44, 0x00, 0xC4, 0x00, 0x45, 0x00
	.byte 0xC5, 0x00, 0x46, 0x00, 0xC6, 0x00, 0x47, 0x00, 0xC7, 0x00, 0x48, 0x00, 0xC8, 0x00, 0x49, 0x00
	.byte 0xC9, 0x00, 0x4A, 0x00, 0xCA, 0x00, 0x4B, 0x00, 0xCB, 0x00, 0x4C, 0x00, 0xCC, 0x00, 0x4D, 0x00
	.byte 0xCD, 0x00, 0x4E, 0x00, 0xCF, 0x00, 0x4F, 0x00, 0xD2, 0x00, 0x50, 0x00, 0xD3, 0x00, 0x51, 0x00
	.byte 0xE1, 0x00, 0x52, 0x00, 0xE2, 0x00, 0x53, 0x00, 0xE3, 0x00, 0x54, 0x00, 0xE4, 0x00, 0x55, 0x00
	.byte 0xE5, 0x00, 0x56, 0x00, 0xE6, 0x00, 0x57, 0x00, 0xE7, 0x00, 0x58, 0x00, 0xE8, 0x00, 0x59, 0x00
	.byte 0xE9, 0x00, 0x5A, 0x00, 0xEA, 0x00, 0x5B, 0x00, 0xEB, 0x00, 0x5C, 0x00, 0xEC, 0x00, 0x5D, 0x00
	.byte 0xED, 0x00, 0x5E, 0x00, 0xEE, 0x00, 0x5F, 0x00, 0xEF, 0x00, 0x60, 0x00, 0xF0, 0x00, 0x61, 0x00
	.byte 0xF1, 0x00, 0x62, 0x00, 0xF2, 0x00, 0x63, 0x00, 0xF3, 0x00, 0x64, 0x00, 0xF4, 0x00, 0x65, 0x00
	.byte 0xF5, 0x00, 0x66, 0x00, 0xF6, 0x00, 0x67, 0x00, 0xF7, 0x00, 0x68, 0x00, 0xF8, 0x00, 0x69, 0x00
	.byte 0xF9, 0x00, 0x6A, 0x00, 0xFA, 0x00, 0x6B, 0x00, 0xFB, 0x00, 0x6C, 0x00, 0xFC, 0x00, 0x6D, 0x00
	.byte 0xFD, 0x00, 0x6E, 0x00, 0xFE, 0x00, 0x6F, 0x00, 0xFF, 0x00, 0x70, 0x00, 0x00, 0x01, 0x71, 0x00
	.byte 0x01, 0x01, 0x72, 0x00, 0x02, 0x01, 0x73, 0x00, 0x03, 0x01, 0x74, 0x00, 0x04, 0x01, 0x75, 0x00
	.byte 0x05, 0x01, 0x76, 0x00, 0x06, 0x01, 0x77, 0x00, 0x07, 0x01, 0x78, 0x00, 0x08, 0x01, 0x79, 0x00
	.byte 0x09, 0x01, 0x7A, 0x00, 0x0A, 0x01, 0x7B, 0x00, 0x0B, 0x01, 0x7C, 0x00, 0x0C, 0x01, 0x7D, 0x00
	.byte 0x0D, 0x01, 0x7E, 0x00, 0x0E, 0x01, 0x7F, 0x00, 0x0F, 0x01, 0x80, 0x00, 0x10, 0x01, 0x81, 0x00
	.byte 0x11, 0x01, 0x82, 0x00, 0x12, 0x01, 0x83, 0x00, 0x13, 0x01, 0x84, 0x00, 0x14, 0x01, 0x85, 0x00
	.byte 0x15, 0x01, 0x86, 0x00, 0x16, 0x01, 0x87, 0x00, 0x17, 0x01, 0x88, 0x00, 0x18, 0x01, 0x89, 0x00
	.byte 0x19, 0x01, 0x8A, 0x00, 0x1A, 0x01, 0x8B, 0x00, 0x1B, 0x01, 0x8C, 0x00, 0x1C, 0x01, 0x8D, 0x00
	.byte 0x1D, 0x01, 0x8E, 0x00, 0x1E, 0x01, 0x8F, 0x00, 0x1F, 0x01, 0x90, 0x00, 0x20, 0x01, 0x91, 0x00
	.byte 0x21, 0x01, 0x92, 0x00, 0x22, 0x01, 0x93, 0x00, 0x23, 0x01, 0x94, 0x00, 0x24, 0x01, 0x95, 0x00
	.byte 0x25, 0x01, 0x96, 0x00, 0x26, 0x01, 0x97, 0x00, 0x27, 0x01, 0x98, 0x00, 0x28, 0x01, 0x99, 0x00
	.byte 0x29, 0x01, 0x9A, 0x00, 0x2A, 0x01, 0x9B, 0x00, 0x2B, 0x01, 0x9C, 0x00, 0x2C, 0x01, 0x9D, 0x00
	.byte 0x2D, 0x01, 0x9E, 0x00, 0x2F, 0x01, 0x9F, 0x00, 0x32, 0x01, 0xA0, 0x00, 0x33, 0x01, 0xA1, 0x00
	.byte 0x40, 0x01, 0xEA, 0x00, 0x41, 0x01, 0xEB, 0x00, 0x42, 0x01, 0xE8, 0x00, 0x43, 0x01, 0xE9, 0x00
	.byte 0x46, 0x01, 0xE6, 0x00, 0x47, 0x01, 0xE5, 0x00, 0x48, 0x01, 0xEE, 0x00, 0x49, 0x01, 0xEF, 0x00
	.byte 0x4A, 0x01, 0xE4, 0x00, 0x4B, 0x01, 0x12, 0x01, 0x4D, 0x01, 0x1C, 0x01, 0x4E, 0x01, 0x1E, 0x01
	.byte 0x4F, 0x01, 0x1D, 0x01, 0x50, 0x01, 0x1B, 0x01, 0x7C, 0x01, 0x9F, 0x01, 0x7D, 0x01, 0xA0, 0x01
	.byte 0x80, 0x01, 0x5F, 0x01, 0x81, 0x01, 0x60, 0x01, 0x82, 0x01, 0x61, 0x01, 0x84, 0x01, 0x63, 0x01
	.byte 0x87, 0x01, 0x66, 0x01, 0x89, 0x01, 0x68, 0x01, 0x8A, 0x01, 0x69, 0x01, 0x8B, 0x01, 0x6A, 0x01
	.byte 0x8C, 0x01, 0x6B, 0x01, 0x8D, 0x01, 0x6C, 0x01, 0x8E, 0x01, 0x6D, 0x01, 0x8F, 0x01, 0x6E, 0x01
	.byte 0x93, 0x01, 0x72, 0x01, 0x94, 0x01, 0x73, 0x01, 0x96, 0x01, 0x75, 0x01, 0x9A, 0x01, 0x79, 0x01
	.byte 0x9B, 0x01, 0x7A, 0x01, 0x9C, 0x01, 0x7B, 0x01, 0x9F, 0x01, 0x7E, 0x01, 0xA0, 0x01, 0x7F, 0x01
	.byte 0xA1, 0x01, 0x80, 0x01, 0xA2, 0x01, 0x81, 0x01, 0xA4, 0x01, 0x83, 0x01, 0xA7, 0x01, 0x86, 0x01
	.byte 0xA9, 0x01, 0x88, 0x01, 0xAA, 0x01, 0x89, 0x01, 0xAB, 0x01, 0x8A, 0x01, 0xAC, 0x01, 0x8B, 0x01
	.byte 0xAD, 0x01, 0x8C, 0x01, 0xAE, 0x01, 0x8D, 0x01, 0xAF, 0x01, 0x8E, 0x01, 0xB3, 0x01, 0x92, 0x01
	.byte 0xB4, 0x01, 0x93, 0x01, 0xB6, 0x01, 0x95, 0x01, 0xBA, 0x01, 0x99, 0x01, 0xBB, 0x01, 0x9A, 0x01
	.byte 0xBC, 0x01, 0x9B, 0x01, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x61, 0xA5, 0x22, 0x02, 0x13, 0x00, 0x00, 0x00, 0xA5, 0xA2, 0x22, 0x02
	.byte 0x12, 0x00, 0x00, 0x00, 0xCD, 0xA4, 0x22, 0x02, 0x13, 0x00, 0x00, 0x00, 0xA5, 0xA2, 0x22, 0x02
	.byte 0x12, 0x00, 0x00, 0x00, 0x05, 0xA5, 0x22, 0x02, 0x13, 0x00, 0x00, 0x00, 0x39, 0xA5, 0x22, 0x02
	.byte 0x12, 0x00, 0x00, 0x00, 0x91, 0x9F, 0x22, 0x02, 0x13, 0x00, 0x00, 0x00, 0xA5, 0xA2, 0x22, 0x02
	.byte 0x12, 0x00, 0x00, 0x00, 0xF5, 0x9F, 0x22, 0x02, 0x13, 0x00, 0x00, 0x00, 0x95, 0xA4, 0x22, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0xF9, 0x5F, 0x23, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x00, 0x0C, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0xCD, 0xA5, 0x22, 0x02, 0x0D, 0x00, 0x00, 0x00, 0x51, 0xA6, 0x22, 0x02
	.byte 0x15, 0x00, 0x00, 0x00, 0x89, 0xA6, 0x22, 0x02, 0x0E, 0x00, 0x00, 0x00, 0xC1, 0xA6, 0x22, 0x02
	.byte 0x0F, 0x00, 0x00, 0x00, 0xE1, 0xA2, 0x22, 0x02, 0x14, 0x00, 0x00, 0x00, 0xCD, 0xA3, 0x22, 0x02
	.byte 0x10, 0x00, 0x00, 0x00, 0x5D, 0xA3, 0x22, 0x02, 0x11, 0x00, 0x00, 0x00, 0xAD, 0xA5, 0x22, 0x02
	.byte 0x41, 0x00, 0x00, 0x00, 0x59, 0xD3, 0x22, 0x02, 0x42, 0x00, 0x00, 0x00, 0x15, 0xD4, 0x22, 0x02
	.byte 0x41, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x15, 0xD4, 0x22, 0x02
	.byte 0x41, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x15, 0xD4, 0x22, 0x02
	.byte 0x2B, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0xD5, 0xD2, 0x22, 0x02
	.byte 0x2D, 0x00, 0x00, 0x00, 0x09, 0xD3, 0x22, 0x02, 0x2E, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF9, 0x5F, 0x23, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x00, 0x0C, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x25, 0x00, 0x00, 0x00, 0x91, 0xD4, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x29, 0x00, 0x00, 0x00, 0x91, 0xD4, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0xE5, 0xD4, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x95, 0xD4, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x32, 0x00, 0x00, 0x00, 0x5D, 0xD5, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0xC5, 0xD5, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x2A, 0x00, 0x00, 0x00, 0x15, 0xD6, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x25, 0x00, 0x00, 0x00, 0x91, 0xD4, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x91, 0xD6, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x75, 0xD7, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x8D, 0xD7, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0E, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x35, 0x00, 0x00, 0x00, 0x91, 0xD4, 0x22, 0x02, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0E, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x38, 0x00, 0x00, 0x00, 0x91, 0xD4, 0x22, 0x02, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0E, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x3A, 0x00, 0x00, 0x00, 0x91, 0xD4, 0x22, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0E, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x3B, 0x00, 0x00, 0x00, 0x91, 0xD4, 0x22, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x39, 0x00, 0x00, 0x00, 0xD1, 0xD7, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x91, 0xD4, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x3C, 0x00, 0x00, 0x00, 0x91, 0xD4, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x3D, 0x00, 0x00, 0x00, 0x91, 0xD4, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF9, 0x5F, 0x23, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x00, 0x0C, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x25, 0x00, 0x00, 0x00, 0x09, 0xEE, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x29, 0x00, 0x00, 0x00, 0x09, 0xEE, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x59, 0xEE, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x0D, 0xEE, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x32, 0x00, 0x00, 0x00, 0xB1, 0xEE, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x19, 0xEF, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x2A, 0x00, 0x00, 0x00, 0x65, 0xEF, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x25, 0x00, 0x00, 0x00, 0x09, 0xEE, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x69, 0xEF, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x01, 0x40, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x01, 0x03, 0x04, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x39, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x94, 0x00, 0x00, 0x00, 0xF9, 0x00, 0x00, 0x00
	.byte 0x7F, 0x00, 0x00, 0x00, 0x23, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x05, 0x00, 0x34, 0x00, 0x35, 0x00, 0x36, 0x00
	.byte 0x37, 0x00, 0x38, 0x00, 0x39, 0x00, 0x3A, 0x00, 0x3B, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3E, 0x00
	.byte 0x48, 0x00, 0x52, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A, 0x00, 0x5B, 0x00, 0x5C, 0x00
	.byte 0x63, 0x00, 0x64, 0x00, 0x65, 0x00, 0x66, 0x00, 0x69, 0x00, 0x70, 0x00, 0x71, 0x00, 0x72, 0x00
	.byte 0x73, 0x00, 0x74, 0x00, 0x75, 0x00, 0x76, 0x00, 0x77, 0x00, 0x78, 0x00, 0x79, 0x00, 0x7A, 0x00
	.byte 0x7B, 0x00, 0x7C, 0x00, 0x7D, 0x00, 0x7E, 0x00, 0x7F, 0x00, 0x80, 0x00, 0x81, 0x00, 0x82, 0x00
	.byte 0x83, 0x00, 0x84, 0x00, 0xB0, 0x00, 0xB1, 0x00, 0xB2, 0x00, 0xE2, 0x00, 0xE3, 0x00, 0xE4, 0x00
	.byte 0xE5, 0x00, 0xE6, 0x00, 0xE7, 0x00, 0xE8, 0x00, 0xE9, 0x00, 0xEA, 0x00, 0xEB, 0x00, 0xEC, 0x00
	.byte 0xED, 0x00, 0xEE, 0x00, 0xEF, 0x00, 0xF0, 0x00, 0xF1, 0x00, 0xF2, 0x00, 0xF3, 0x00, 0xF4, 0x00
	.byte 0xF5, 0x00, 0xF6, 0x00, 0xF7, 0x00, 0xF8, 0x00, 0xF9, 0x00, 0xFA, 0x00, 0xFB, 0x00, 0xFC, 0x00
	.byte 0xFD, 0x00, 0x03, 0x01, 0x04, 0x01, 0x05, 0x01, 0x06, 0x01, 0x07, 0x01, 0x08, 0x01, 0x09, 0x01
	.byte 0x0A, 0x01, 0x0B, 0x01, 0x0C, 0x01, 0x0D, 0x01, 0x0E, 0x01, 0x0F, 0x01, 0x10, 0x01, 0x11, 0x01
	.byte 0x12, 0x01, 0x13, 0x01, 0x14, 0x01, 0x15, 0x01, 0x16, 0x01, 0x17, 0x01, 0x18, 0x01, 0x19, 0x01
	.byte 0x1A, 0x01, 0x1B, 0x01, 0x1C, 0x01, 0x1D, 0x01, 0x1E, 0x01, 0x1F, 0x01, 0x20, 0x01, 0x53, 0x01
	.byte 0x54, 0x01, 0x55, 0x01, 0x56, 0x01, 0x57, 0x01, 0x58, 0x01, 0x59, 0x01, 0x5A, 0x01, 0x5B, 0x01
	.byte 0x5C, 0x01, 0x5D, 0x01, 0x5E, 0x01, 0x5F, 0x01, 0x60, 0x01, 0x61, 0x01, 0x62, 0x01, 0x63, 0x01
	.byte 0x64, 0x01, 0x65, 0x01, 0x66, 0x01, 0x67, 0x01, 0x68, 0x01, 0x69, 0x01, 0x6A, 0x01, 0x6B, 0x01
	.byte 0x6C, 0x01, 0x6D, 0x01, 0x6E, 0x01, 0x6F, 0x01, 0x70, 0x01, 0x71, 0x01, 0x72, 0x01, 0x73, 0x01
	.byte 0x74, 0x01, 0x75, 0x01, 0x76, 0x01, 0x77, 0x01, 0x78, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x24, 0xFF, 0xAE, 0x51, 0x69, 0x9A, 0xA2, 0x21, 0x3D, 0x84, 0x82, 0x0A
	.byte 0x84, 0xE4, 0x09, 0xAD, 0x11, 0x24, 0x8B, 0x98, 0xC0, 0x81, 0x7F, 0x21, 0xA3, 0x52, 0xBE, 0x19
	.byte 0x93, 0x09, 0xCE, 0x20, 0x10, 0x46, 0x4A, 0x4A, 0xF8, 0x27, 0x31, 0xEC, 0x58, 0xC7, 0xE8, 0x33
	.byte 0x82, 0xE3, 0xCE, 0xBF, 0x85, 0xF4, 0xDF, 0x94, 0xCE, 0x4B, 0x09, 0xC1, 0x94, 0x56, 0x8A, 0xC0
	.byte 0x13, 0x72, 0xA7, 0xFC, 0x9F, 0x84, 0x4D, 0x73, 0xA3, 0xCA, 0x9A, 0x61, 0x58, 0x97, 0xA3, 0x27
	.byte 0xFC, 0x03, 0x98, 0x76, 0x23, 0x1D, 0xC7, 0x61, 0x03, 0x04, 0xAE, 0x56, 0xBF, 0x38, 0x84, 0x00
	.byte 0x40, 0xA7, 0x0E, 0xFD, 0xFF, 0x52, 0xFE, 0x03, 0x6F, 0x95, 0x30, 0xF1, 0x97, 0xFB, 0xC0, 0x85
	.byte 0x60, 0xD6, 0x80, 0x25, 0xA9, 0x63, 0xBE, 0x03, 0x01, 0x4E, 0x38, 0xE2, 0xF9, 0xA2, 0x34, 0xFF
	.byte 0xBB, 0x3E, 0x03, 0x44, 0x78, 0x00, 0x90, 0xCB, 0x88, 0x11, 0x3A, 0x94, 0x65, 0xC0, 0x7C, 0x63
	.byte 0x87, 0xF0, 0x3C, 0xAF, 0xD6, 0x25, 0xE4, 0x8B, 0x38, 0x0A, 0xAC, 0x72, 0x21, 0xD4, 0xF8, 0x07
	.byte 0x10, 0x00, 0x11, 0x00, 0x12, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x20, 0x00, 0x21, 0x00
	.byte 0x22, 0x00, 0x23, 0x00, 0x24, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x31, 0x00, 0x34, 0x00
	.byte 0x35, 0x00, 0x38, 0x00, 0x39, 0x00, 0x42, 0x00, 0x43, 0x00, 0x44, 0x00, 0x56, 0x00, 0x57, 0x00
	.byte 0x5A, 0x00, 0x5B, 0x00, 0x60, 0x00, 0x61, 0x00, 0x6A, 0x00, 0x6B, 0x00, 0x72, 0x00, 0x73, 0x00
	.byte 0x74, 0x00, 0x75, 0x00, 0x7A, 0x00, 0x7B, 0x00, 0x7C, 0x00, 0x7F, 0x00, 0x80, 0x00, 0x85, 0x00
	.byte 0x86, 0x00, 0x87, 0x00, 0x88, 0x00, 0x89, 0x00, 0xAD, 0x00, 0xBB, 0x00, 0xBC, 0x00, 0xBD, 0x00
	.byte 0xBF, 0x00, 0xC0, 0x00, 0xC4, 0x00, 0xC5, 0x00, 0xC6, 0x00, 0xD2, 0x00, 0xD4, 0x00, 0xD5, 0x00
	.byte 0xD8, 0x00, 0xD9, 0x00, 0xDC, 0x00, 0xDD, 0x00, 0xDF, 0x00, 0xE0, 0x00, 0xE6, 0x00, 0xE9, 0x00
	.byte 0xEA, 0x00, 0xEB, 0x00, 0xEC, 0x00, 0xED, 0x00, 0xEE, 0x00, 0xF1, 0x00, 0x05, 0x01, 0x06, 0x01
	.byte 0x07, 0x01, 0x08, 0x01, 0x1D, 0x01, 0x1E, 0x01, 0x2C, 0x01, 0x2D, 0x01, 0x2E, 0x01, 0x3A, 0x01
	.byte 0x42, 0x01, 0x43, 0x01, 0x47, 0x01, 0x53, 0x01, 0x54, 0x01, 0x61, 0x01, 0x62, 0x01, 0x65, 0x01
	.byte 0x67, 0x01, 0x69, 0x01, 0x6A, 0x01, 0x6B, 0x01, 0x6C, 0x01, 0x6D, 0x01, 0x15, 0x01, 0xFC, 0x00
	.byte 0x16, 0x01, 0xFD, 0x00, 0x17, 0x01, 0xFE, 0x00, 0x18, 0x01, 0xFF, 0x00, 0x19, 0x01, 0x00, 0x01
	.byte 0x1A, 0x01, 0x01, 0x01, 0x1B, 0x01, 0x02, 0x01, 0x1C, 0x01, 0x03, 0x01, 0x1D, 0x01, 0x04, 0x01
	.byte 0x1E, 0x01, 0x05, 0x01, 0x1F, 0x01, 0x06, 0x01, 0x20, 0x01, 0x07, 0x01, 0x21, 0x01, 0x08, 0x01
	.byte 0x22, 0x01, 0x09, 0x01, 0x23, 0x01, 0x0A, 0x01, 0x24, 0x01, 0x0B, 0x01, 0x25, 0x01, 0x0C, 0x01
	.byte 0x26, 0x01, 0x0D, 0x01, 0x27, 0x01, 0x0E, 0x01, 0x28, 0x01, 0x0F, 0x01, 0x29, 0x01, 0x10, 0x01
	.byte 0x2A, 0x01, 0x11, 0x01, 0x2B, 0x01, 0x12, 0x01, 0x2C, 0x01, 0x13, 0x01, 0x2D, 0x01, 0x22, 0x01
	.byte 0x2E, 0x01, 0x23, 0x01, 0x2F, 0x01, 0x24, 0x01, 0x30, 0x01, 0x14, 0x01, 0x31, 0x01, 0x15, 0x01
	.byte 0x32, 0x01, 0x1D, 0x01, 0x33, 0x01, 0x1E, 0x01, 0x34, 0x01, 0x47, 0x01, 0x35, 0x01, 0x16, 0x01
	.byte 0x36, 0x01, 0x17, 0x01, 0x37, 0x01, 0x1B, 0x01, 0x38, 0x01, 0x1C, 0x01, 0x39, 0x01, 0x40, 0x01
	.byte 0x3A, 0x01, 0x41, 0x01, 0x3B, 0x01, 0x2C, 0x01, 0x3C, 0x01, 0x2D, 0x01, 0x3D, 0x01, 0x60, 0x01
	.byte 0x3E, 0x01, 0x57, 0x01, 0x3F, 0x01, 0x58, 0x01, 0x40, 0x01, 0x2B, 0x01, 0x41, 0x01, 0x44, 0x01
	.byte 0x42, 0x01, 0x2E, 0x01, 0x43, 0x01, 0x53, 0x01, 0x44, 0x01, 0x54, 0x01, 0x45, 0x01, 0x72, 0x01
	.byte 0x46, 0x01, 0x55, 0x01, 0x47, 0x01, 0x56, 0x01, 0x48, 0x01, 0x5D, 0x01, 0x49, 0x01, 0x5E, 0x01
	.byte 0x4A, 0x01, 0x3E, 0x01, 0x4B, 0x01, 0x3F, 0x01, 0x4C, 0x01, 0x48, 0x01, 0x4D, 0x01, 0x49, 0x01
	.byte 0x4E, 0x01, 0x4A, 0x01, 0x4F, 0x01, 0x28, 0x01, 0x50, 0x01, 0x29, 0x01, 0x51, 0x01, 0x35, 0x01
	.byte 0x52, 0x01, 0x36, 0x01, 0x53, 0x01, 0x42, 0x01, 0x54, 0x01, 0x43, 0x01, 0x55, 0x01, 0x6B, 0x01
	.byte 0x56, 0x01, 0x6C, 0x01, 0x57, 0x01, 0x6D, 0x01, 0x58, 0x01, 0x4B, 0x01, 0x59, 0x01, 0x4C, 0x01
	.byte 0x5A, 0x01, 0x69, 0x01, 0x5B, 0x01, 0x6A, 0x01, 0x5C, 0x01, 0x51, 0x01, 0x5D, 0x01, 0x52, 0x01
	.byte 0x5E, 0x01, 0x2A, 0x01, 0x5F, 0x01, 0x45, 0x01, 0x60, 0x01, 0x46, 0x01, 0x61, 0x01, 0x37, 0x01
	.byte 0x62, 0x01, 0x38, 0x01, 0x63, 0x01, 0x2F, 0x01, 0x64, 0x01, 0x33, 0x01, 0x65, 0x01, 0x34, 0x01
	.byte 0x66, 0x01, 0x4D, 0x01, 0x67, 0x01, 0x4E, 0x01, 0x68, 0x01, 0x68, 0x01, 0x69, 0x01, 0x63, 0x01
	.byte 0x6A, 0x01, 0x64, 0x01, 0x6B, 0x01, 0x3B, 0x01, 0x6C, 0x01, 0x1F, 0x01, 0x6D, 0x01, 0x20, 0x01
	.byte 0x6E, 0x01, 0x21, 0x01, 0x6F, 0x01, 0x3C, 0x01, 0x70, 0x01, 0x3D, 0x01, 0x71, 0x01, 0x65, 0x01
	.byte 0x72, 0x01, 0x25, 0x01, 0x73, 0x01, 0x26, 0x01, 0x74, 0x01, 0x27, 0x01, 0x75, 0x01, 0x6E, 0x01
	.byte 0x76, 0x01, 0x6F, 0x01, 0x77, 0x01, 0x70, 0x01, 0x78, 0x01, 0x67, 0x01, 0x79, 0x01, 0x61, 0x01
	.byte 0x7A, 0x01, 0x62, 0x01, 0x7B, 0x01, 0x50, 0x01, 0x7C, 0x01, 0x4F, 0x01, 0x7D, 0x01, 0x71, 0x01
	.byte 0x7E, 0x01, 0x30, 0x01, 0x7F, 0x01, 0x31, 0x01, 0x80, 0x01, 0x32, 0x01, 0x81, 0x01, 0x5F, 0x01
	.byte 0x82, 0x01, 0x39, 0x01, 0x83, 0x01, 0x3A, 0x01, 0x84, 0x01, 0x59, 0x01, 0x85, 0x01, 0x5A, 0x01
	.byte 0x86, 0x01, 0x5B, 0x01, 0x87, 0x01, 0x5C, 0x01, 0x88, 0x01, 0x18, 0x01, 0x89, 0x01, 0x19, 0x01
	.byte 0x8A, 0x01, 0x1A, 0x01, 0x8B, 0x01, 0x73, 0x01, 0x8C, 0x01, 0x74, 0x01, 0x8D, 0x01, 0x75, 0x01
	.byte 0x8E, 0x01, 0x76, 0x01, 0x8F, 0x01, 0x77, 0x01, 0x90, 0x01, 0x78, 0x01, 0x91, 0x01, 0x79, 0x01
	.byte 0x92, 0x01, 0x7A, 0x01, 0x93, 0x01, 0x7B, 0x01, 0x94, 0x01, 0x7E, 0x01, 0x95, 0x01, 0x7F, 0x01
	.byte 0x96, 0x01, 0x80, 0x01, 0x97, 0x01, 0x7C, 0x01, 0x98, 0x01, 0x7D, 0x01, 0x99, 0x01, 0x81, 0x01
	.byte 0x9A, 0x01, 0x82, 0x01, 0x9B, 0x01, 0x66, 0x01, 0x9C, 0x01, 0x9C, 0x01, 0x9D, 0x01, 0x9D, 0x01
	.byte 0x9E, 0x01, 0x9E, 0x01, 0x9F, 0x01, 0x9F, 0x01, 0xA0, 0x01, 0xA0, 0x01, 0xA1, 0x01, 0xA1, 0x01
	.byte 0xA2, 0x01, 0xA2, 0x01, 0xA3, 0x01, 0xA3, 0x01, 0xA4, 0x01, 0xA4, 0x01, 0x45, 0x42, 0x35, 0x42
	.byte 0x45, 0x43, 0x35, 0x42, 0x45, 0x44, 0x35, 0x42, 0x45, 0x45, 0x35, 0x42, 0x45, 0x46, 0x35, 0x42
	.byte 0x45, 0x47, 0x35, 0x42, 0x45, 0x48, 0x35, 0x42, 0x45, 0x49, 0x35, 0x42, 0x45, 0x4A, 0x35, 0x42
	.byte 0x45, 0x4B, 0x35, 0x42, 0x45, 0x4C, 0x35, 0x42, 0x45, 0x4D, 0x35, 0x42, 0x45, 0x50, 0x35, 0x42
	.byte 0x45, 0x51, 0x35, 0x42, 0x45, 0x52, 0x35, 0x42, 0x45, 0x53, 0x35, 0x42, 0x45, 0x54, 0x35, 0x42
	.byte 0x45, 0x55, 0x35, 0x42, 0x45, 0x56, 0x35, 0x42, 0x45, 0x57, 0x35, 0x42, 0x00, 0x00, 0x00, 0x00
	.byte 0x6D, 0x79, 0x77, 0x68, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x49, 0x44
	.byte 0x4C, 0x45, 0x00, 0x00, 0x6D, 0x79, 0x77, 0x68, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54
	.byte 0x45, 0x5F, 0x42, 0x55, 0x53, 0x59, 0x00, 0x00, 0x6D, 0x79, 0x77, 0x68, 0x5F, 0x53, 0x59, 0x53
	.byte 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x53, 0x54, 0x4F, 0x50, 0x00, 0x00, 0x6D, 0x79, 0x77, 0x68
	.byte 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x45, 0x52, 0x52, 0x4F, 0x52, 0x00
	.byte 0x6D, 0x79, 0x77, 0x68, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x53, 0x43
	.byte 0x41, 0x4E, 0x4E, 0x49, 0x4E, 0x47, 0x00, 0x00, 0x6D, 0x79, 0x77, 0x68, 0x5F, 0x53, 0x59, 0x53
	.byte 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x43, 0x4F, 0x4E, 0x4E, 0x45, 0x43, 0x54, 0x45, 0x44, 0x00
	.byte 0x6D, 0x79, 0x77, 0x68, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x4B, 0x45
	.byte 0x59, 0x53, 0x48, 0x41, 0x52, 0x49, 0x4E, 0x47, 0x00, 0x00, 0x00, 0x00, 0x6D, 0x79, 0x77, 0x68
	.byte 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x44, 0x41, 0x54, 0x41, 0x53, 0x48
	.byte 0x41, 0x52, 0x49, 0x4E, 0x47, 0x00, 0x00, 0x00, 0x6D, 0x79, 0x77, 0x68, 0x5F, 0x53, 0x59, 0x53
	.byte 0x53, 0x54, 0x41, 0x54, 0x45, 0x5F, 0x43, 0x4F, 0x4E, 0x4E, 0x45, 0x43, 0x54, 0x5F, 0x46, 0x41
	.byte 0x49, 0x4C, 0x00, 0x00, 0x6D, 0x79, 0x77, 0x68, 0x5F, 0x53, 0x59, 0x53, 0x53, 0x54, 0x41, 0x54
	.byte 0x45, 0x5F, 0x4D, 0x45, 0x41, 0x53, 0x55, 0x52, 0x45, 0x43, 0x48, 0x41, 0x4E, 0x4E, 0x45, 0x4C
	.byte 0x00, 0x00, 0x00, 0x00, 0x18, 0xCF, 0x23, 0x02, 0xF0, 0xCE, 0x23, 0x02, 0x40, 0xCF, 0x23, 0x02
	.byte 0x04, 0xCF, 0x23, 0x02, 0x58, 0xCF, 0x23, 0x02, 0x8C, 0xCF, 0x23, 0x02, 0x70, 0xCF, 0x23, 0x02
	.byte 0xC4, 0xCF, 0x23, 0x02, 0xA8, 0xCF, 0x23, 0x02, 0x2C, 0xCF, 0x23, 0x02, 0x25, 0x73, 0x20, 0x2D
	.byte 0x3E, 0x20, 0x00, 0x00, 0x25, 0x73, 0x0A, 0x00, 0x6E, 0x6F, 0x74, 0x20, 0x6D, 0x79, 0x20, 0x70
	.byte 0x61, 0x72, 0x65, 0x6E, 0x74, 0x20, 0x67, 0x67, 0x69, 0x64, 0x20, 0x28, 0x25, 0x64, 0x20, 0x21
	.byte 0x3D, 0x20, 0x25, 0x64, 0x29, 0x0A, 0x00, 0x00, 0x49, 0x50, 0x47, 0x45, 0x00, 0x00, 0x00, 0x00
	.byte 0x4B, 0x35, 0x57, 0x66, 0x50, 0x45, 0x77, 0x39, 0x54, 0x33, 0x63, 0x76, 0x71, 0x7A, 0x48, 0x61
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAF, 0xBB, 0x23, 0x02, 0xAE, 0xBB, 0x23, 0x02
	.byte 0xAC, 0xBB, 0x23, 0x02, 0xA8, 0xBB, 0x23, 0x02, 0xA0, 0xBB, 0x23, 0x02, 0x90, 0xBB, 0x23, 0x02
	.byte 0x70, 0xBB, 0x23, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_0223D080:
	.space 0x1980
