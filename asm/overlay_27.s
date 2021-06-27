
	thumb_func_start ov27_02259F80
ov27_02259F80: @ 0x02259F80
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r2, #0
	adds r6, r0, #0
	str r1, [sp, #0x10]
	ldr r2, _0225A170 @ =0x00018D00
	movs r0, #3
	movs r1, #8
	bl FUN_0201A910
	movs r0, #0
	blx FUN_020CDA64
	movs r0, #0x80
	blx FUN_020CE650
	movs r0, #1
	lsls r0, r0, #8
	blx FUN_020CE6F8
	ldr r2, _0225A174 @ =0x04001000
	ldr r0, _0225A178 @ =0xFFCFFFEF
	ldr r1, [r2]
	movs r3, #0
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r2]
	ldr r2, _0225A17C @ =0x0225D000
	adds r0, r6, #0
	movs r1, #4
	bl FUN_0201B1E4
	ldr r2, _0225A180 @ =0x0225D01C
	adds r0, r6, #0
	movs r1, #5
	movs r3, #0
	bl FUN_0201B1E4
	movs r1, #0x15
	ldr r0, _0225A184 @ =ov27_0225A320
	lsls r1, r1, #6
	movs r2, #0xa
	movs r3, #8
	bl FUN_02007200
	adds r7, r0, #0
	bl FUN_0201F988
	adds r4, r0, #0
	str r7, [r4, #8]
	movs r0, #0
	str r0, [r4]
	ldr r0, [sp, #0x10]
	str r6, [r4, #4]
	str r0, [r4, #0xc]
	adds r0, r5, #0
	str r5, [r4, #0x10]
	bl ov27_0225BD50
	ldr r3, _0225A188 @ =0x0000051C
	adds r2, r0, #0
	ldr r1, [r4, r3]
	movs r0, #0x1e
	bics r1, r0
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1b
	orrs r0, r1
	str r0, [r4, r3]
	ldr r1, [r4, r3]
	movs r0, #0x20
	bics r1, r0
	str r1, [r4, r3]
	movs r3, #0x3f
	lsls r3, r3, #4
	adds r0, r4, r3
	str r0, [sp]
	adds r2, r3, #0
	subs r2, #0x20
	subs r3, #0x10
	ldr r1, [r4]
	adds r0, r6, #0
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov27_0225AC00
	movs r0, #4
	movs r1, #8
	bl FUN_02002CEC
	movs r0, #8
	bl FUN_0200BD08
	ldr r1, _0225A18C @ =0x000004AC
	movs r2, #0xc4
	str r0, [r4, r1]
	movs r0, #0
	movs r1, #0x1b
	movs r3, #8
	bl FUN_0200BAF8
	ldr r1, _0225A190 @ =0x000004A8
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov27_0225C10C
	adds r1, r5, #0
	adds r1, #0xd3
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov27_0225C1AC
	str r0, [r4, #0x14]
	adds r0, r4, #0
	bl ov27_0225C1EC
	adds r0, r4, #0
	bl ov27_0225AD0C
	adds r0, r4, #0
	bl ov27_0225B010
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	adds r1, #0xd2
	ldrb r1, [r1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	bl ov27_0225BB6C
	movs r3, #0
	str r3, [sp]
	movs r2, #0x3d
	ldr r0, _0225A194 @ =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	lsls r2, r2, #4
	adds r0, r4, r2
	str r3, [sp, #0xc]
	adds r2, #0xe4
	ldr r2, [r4, r2]
	movs r1, #4
	bl FUN_020200FC
	movs r1, #0
	movs r2, #0x3e
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225A194 @ =0x000F0100
	lsls r2, r2, #4
	str r0, [sp, #8]
	adds r0, r4, r2
	str r1, [sp, #0xc]
	adds r2, #0xe4
	ldr r2, [r4, r2]
	adds r3, r1, #0
	bl FUN_020200FC
	adds r0, r4, #0
	bl ov27_0225BCE8
	adds r0, r4, #0
	bl ov27_0225BC84
	adds r0, r4, #0
	movs r1, #1
	bl ov27_0225A690
	adds r0, r4, #0
	bl ov27_0225C0E0
	movs r0, #0x52
	lsls r0, r0, #4
	adds r0, r4, r0
	adds r1, r4, #0
	bl ov27_0225BDDC
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_020183F0
	cmp r0, #0
	bne _0225A102
	adds r0, r5, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x80
	adds r5, #0xd2
	bics r1, r0
	strb r1, [r5]
	b _0225A11A
_0225A102:
	adds r0, r5, #0
	bl FUN_02050590
	cmp r0, #0
	bne _0225A11A
	adds r0, r5, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x80
	adds r5, #0xd2
	orrs r0, r1
	strb r0, [r5]
_0225A11A:
	adds r0, r4, #0
	bl ov27_0225A714
	cmp r0, #0
	bne _0225A12A
	add sp, #0x14
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_0225A12A:
	adds r0, r4, #0
	bl ov27_0225A7FC
	ldr r0, [r4, #0x18]
	bl FUN_0202457C
	ldr r2, _0225A174 @ =0x04001000
	ldr r0, _0225A198 @ =0xFFFF1FFF
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	adds r0, r7, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225A170: .4byte 0x00018D00
_0225A174: .4byte 0x04001000
_0225A178: .4byte 0xFFCFFFEF
_0225A17C: .4byte 0x0225D000
_0225A180: .4byte 0x0225D01C
_0225A184: .4byte ov27_0225A320
_0225A188: .4byte 0x0000051C
_0225A18C: .4byte 0x000004AC
_0225A190: .4byte 0x000004A8
_0225A194: .4byte 0x000F0100
_0225A198: .4byte 0xFFFF1FFF
	thumb_func_end ov27_02259F80

	thumb_func_start ov27_0225A19C
ov27_0225A19C: @ 0x0225A19C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	adds r0, r1, #0
	str r1, [sp, #4]
	bl FUN_0201F988
	adds r6, r0, #0
	ldr r1, _0225A2B0 @ =0x0000007B
	movs r0, #0
	blx FS_LoadOverlay
	ldr r0, _0225A2B4 @ =ov27_0225C238
	blx FUN_0225F430
	cmp r0, #0
	beq _0225A1C8
	movs r1, #0xfa
	movs r0, #3
	lsls r1, r1, #2
	bl FUN_0201AACC
_0225A1C8:
	movs r0, #0x52
	lsls r0, r0, #4
	adds r0, r6, r0
	bl ov27_0225BEB0
	ldr r0, _0225A2B8 @ =0x000004A8
	ldr r0, [r6, r0]
	bl FUN_0200BB44
	ldr r0, _0225A2BC @ =0x000004AC
	ldr r0, [r6, r0]
	bl FUN_0200BDA0
	movs r7, #0x55
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_0225A1EA:
	ldr r0, [r5, r7]
	bl FUN_0200AEB0
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0xb
	blt _0225A1EA
	movs r7, #0x56
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_0225A200:
	ldr r0, [r4, r7]
	bl FUN_0200B0A8
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #0xb
	blt _0225A200
	movs r7, #0x51
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_0225A216:
	ldr r0, [r4, r7]
	bl FUN_0200A0D0
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #4
	blt _0225A216
	ldr r0, _0225A2C0 @ =ov27_0225C248
	blx FUN_0225F598
	cmp r0, #0
	bne _0225A238
	movs r1, #0xfa
	movs r0, #3
	lsls r1, r1, #2
	bl FUN_0201AACC
_0225A238:
	ldr r0, [r6, #0x18]
	bl FUN_02024504
	movs r0, #0x3f
	lsls r0, r0, #4
	movs r5, #0
	adds r4, r6, r0
_0225A246:
	adds r0, r4, #0
	bl FUN_0201D520
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #8
	blt _0225A246
	movs r0, #0x3e
	lsls r0, r0, #4
	adds r0, r6, r0
	bl FUN_0201D520
	movs r0, #0x3d
	lsls r0, r0, #4
	adds r0, r6, r0
	bl FUN_0201D520
	adds r0, r6, #0
	bl ov27_0225BC34
	movs r0, #4
	bl FUN_02002DB4
	ldr r0, [sp, #4]
	bl FUN_02007234
	ldr r0, [sp]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [sp]
	movs r1, #4
	bl FUN_0201BB4C
	movs r0, #8
	bl FUN_0201A9C4
	ldr r0, _0225A2C4 @ =ov27_0225C24C
	blx FUN_0225F688
	cmp r0, #0
	bne _0225A2A4
	movs r1, #0xfa
	movs r0, #3
	lsls r1, r1, #2
	bl FUN_0201AACC
_0225A2A4:
	ldr r1, _0225A2B0 @ =0x0000007B
	movs r0, #0
	blx FS_UnloadOverlay
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225A2B0: .4byte 0x0000007B
_0225A2B4: .4byte ov27_0225C238
_0225A2B8: .4byte 0x000004A8
_0225A2BC: .4byte 0x000004AC
_0225A2C0: .4byte ov27_0225C248
_0225A2C4: .4byte ov27_0225C24C
	thumb_func_end ov27_0225A19C

	thumb_func_start ov27_0225A2C8
ov27_0225A2C8: @ 0x0225A2C8
	movs r0, #1
	bx lr
	thumb_func_end ov27_0225A2C8

	thumb_func_start ov27_0225A2CC
ov27_0225A2CC: @ 0x0225A2CC
	push {r4, lr}
	bl FUN_0201F988
	adds r4, r0, #0
	bne _0225A2DA
	bl GF_AssertFail
_0225A2DA:
	ldr r1, _0225A2E8 @ =0x0000051C
	movs r0, #0x20
	ldr r2, [r4, r1]
	orrs r0, r2
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_0225A2E8: .4byte 0x0000051C
	thumb_func_end ov27_0225A2CC

	thumb_func_start ov27_0225A2EC
ov27_0225A2EC: @ 0x0225A2EC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_0201F988
	adds r4, r0, #0
	bne _0225A2FC
	bl GF_AssertFail
_0225A2FC:
	cmp r5, #1
	beq _0225A308
	cmp r5, #2
	beq _0225A308
	bl GF_AssertFail
_0225A308:
	ldr r1, _0225A31C @ =0x0000051C
	movs r0, #0xc0
	ldr r2, [r4, r1]
	bics r2, r0
	lsls r0, r5, #0x1e
	lsrs r0, r0, #0x18
	orrs r0, r2
	str r0, [r4, r1]
	pop {r3, r4, r5, pc}
	nop
_0225A31C: .4byte 0x0000051C
	thumb_func_end ov27_0225A2EC

	thumb_func_start ov27_0225A320
ov27_0225A320: @ 0x0225A320
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	ldr r0, [r5, #0x10]
	bl ov27_0225A89C
	adds r4, r0, #0
	ldr r0, [r5, #0x10]
	bl FUN_0203E13C
	adds r6, r0, #0
	ldr r0, [r5, #0x10]
	adds r0, #0xd2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	beq _0225A366
	cmp r6, #0
	beq _0225A35E
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225A35E
	ldr r2, [r5, #0x10]
	adds r0, r2, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x80
	adds r2, #0xd2
	bics r1, r0
	strb r1, [r2]
	b _0225A36E
_0225A35E:
	ldr r0, _0225A45C @ =0x04001050
	movs r1, #0
	strh r1, [r0]
	b _0225A36E
_0225A366:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov27_0225A8E8
_0225A36E:
	ldr r0, _0225A460 @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	beq _0225A38A
	ldr r0, [r5, #0x14]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #2
	bl FUN_02024950
_0225A38A:
	ldr r0, _0225A460 @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _0225A3AE
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_020248F0
	ldr r1, _0225A460 @ =0x0000051C
	movs r0, #0xc0
	ldr r2, [r5, r1]
	bics r2, r0
	str r2, [r5, r1]
	b _0225A3C8
_0225A3AE:
	cmp r0, #2
	bne _0225A3C8
	movs r0, #0x3b
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_020248F0
	ldr r1, _0225A460 @ =0x0000051C
	movs r0, #0xc0
	ldr r2, [r5, r1]
	bics r2, r0
	str r2, [r5, r1]
_0225A3C8:
	ldr r0, [r5, #0x10]
	bl FUN_02050590
	cmp r0, #0
	beq _0225A3DA
	adds r0, r5, #0
	bl ov27_0225A7FC
	b _0225A412
_0225A3DA:
	ldr r0, [r5, #0x10]
	adds r0, #0xd2
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	cmp r0, #2
	bne _0225A3FE
	adds r0, r5, #0
	bl ov27_0225A86C
	ldr r2, [r5, #0x10]
	adds r0, r2, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x3f
	adds r2, #0xd2
	bics r1, r0
	strb r1, [r2]
_0225A3FE:
	cmp r6, #0
	beq _0225A408
	adds r0, r5, #0
	bl ov27_0225A66C
_0225A408:
	cmp r4, #0
	bne _0225A412
	adds r0, r5, #0
	bl ov27_0225B4D8
_0225A412:
	ldr r0, _0225A464 @ =0x0225CECC
	bl FUN_02025204
	adds r6, r0, #0
	ldr r0, _0225A464 @ =0x0225CECC
	bl FUN_02025224
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov27_0225A530
	ldr r0, _0225A460 @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _0225A44A
	adds r0, r5, #0
	bl ov27_0225A4D0
	cmp r0, #0
	beq _0225A44A
	cmp r4, #0
	bne _0225A44A
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov27_0225A48C
_0225A44A:
	movs r0, #0x52
	lsls r0, r0, #4
	adds r0, r5, r0
	bl ov27_0225BDFC
	ldr r0, [r5, #0x18]
	bl FUN_0202457C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225A45C: .4byte 0x04001050
_0225A460: .4byte 0x0000051C
_0225A464: .4byte 0x0225CECC
	thumb_func_end ov27_0225A320

	thumb_func_start ov27_0225A468
ov27_0225A468: @ 0x0225A468
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	lsls r2, r4, #2
	movs r1, #0xb
	subs r1, r1, r2
	bl FUN_020248F0
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #3
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
	thumb_func_end ov27_0225A468

	thumb_func_start ov27_0225A48C
ov27_0225A48C: @ 0x0225A48C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	cmp r1, #0
	bne _0225A4B6
	ldr r0, [r5, #0x10]
	bl FUN_0205CA1C
	adds r6, r0, #0
	bl FUN_0205CB38
	adds r4, r0, #0
	movs r1, #1
	eors r4, r1
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov27_0225A468
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0205CB40
_0225A4B6:
	pop {r4, r5, r6, pc}
	thumb_func_end ov27_0225A48C

	thumb_func_start ov27_0225A4B8
ov27_0225A4B8: @ 0x0225A4B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_0205CA1C
	bl FUN_0205CB38
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov27_0225A468
	pop {r4, pc}
	thumb_func_end ov27_0225A4B8

	thumb_func_start ov27_0225A4D0
ov27_0225A4D0: @ 0x0225A4D0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov27_0225BDC8
	adds r4, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x40]
	bl FUN_0205C700
	cmp r0, #1
	beq _0225A4F2
	ldr r0, [r5, #0x10]
	adds r0, #0xd2
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	beq _0225A4F4
_0225A4F2:
	movs r4, #0
_0225A4F4:
	cmp r4, #0
	beq _0225A512
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	b _0225A52A
_0225A512:
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
_0225A52A:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov27_0225A4D0

	thumb_func_start ov27_0225A530
ov27_0225A530: @ 0x0225A530
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_020249A8
	adds r6, r0, #0
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_020248B8
	cmp r0, #0
	beq _0225A58C
	cmp r4, #1
	bne _0225A570
	bl FUN_02025358
	cmp r0, #0
	beq _0225A570
	ldr r0, _0225A590 @ =0x021D110C
	movs r1, #1
	str r1, [r0, #0x5c]
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #6
	bl FUN_020248F0
	pop {r4, r5, r6, pc}
_0225A570:
	cmp r4, #1
	bne _0225A580
	cmp r6, #6
	bne _0225A580
	ldr r0, _0225A590 @ =0x021D110C
	movs r1, #1
	str r1, [r0, #0x5c]
	pop {r4, r5, r6, pc}
_0225A580:
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #5
	bl FUN_020248F0
_0225A58C:
	pop {r4, r5, r6, pc}
	nop
_0225A590: .4byte 0x021D110C
	thumb_func_end ov27_0225A530

	thumb_func_start ov27_0225A594
ov27_0225A594: @ 0x0225A594
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x10]
	adds r0, r4, #0
	bl ov27_0225BD44
	cmp r0, #0
	beq _0225A5A8
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0225A5A8:
	adds r0, r4, #0
	bl FUN_0203E13C
	cmp r0, #0
	bne _0225A5E6
	adds r0, r4, #0
	bl FUN_0205CA1C
	bl FUN_0205C6DC
	adds r7, r0, #0
	bl FUN_0205F330
	adds r6, r0, #0
	adds r0, r7, #0
	bl FUN_0205F25C
	subs r0, #0xbc
	cmp r0, #1
	bhi _0225A5DC
	cmp r6, #1
	bne _0225A5D8
	movs r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0225A5D8:
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0225A5DC:
	movs r0, #0x51
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #4
	bne _0225A61A
_0225A5E6:
	adds r0, r4, #0
	bl FUN_021E7F54
	adds r5, r0, #0
	cmp r5, #1
	bne _0225A618
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_0203DBF8
	ldr r0, [sp]
	bl FUN_0205F27C
	bl FUN_021F6BD0
	cmp r0, #0
	bne _0225A616
	ldr r0, [sp]
	bl FUN_0205F25C
	bl FUN_021F6BB0
	cmp r0, #0
	beq _0225A618
_0225A616:
	movs r5, #0
_0225A618:
	adds r0, r5, #0
_0225A61A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov27_0225A594

	thumb_func_start ov27_0225A61C
ov27_0225A61C: @ 0x0225A61C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x3d
	lsls r0, r0, #4
	adds r4, r1, #0
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r6, _0225A664 @ =0x0225D108
	movs r3, #0
	ldrb r4, [r6, r4]
	str r3, [sp]
	movs r2, #0x3d
	lsls r4, r4, #2
	ldr r0, _0225A668 @ =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	lsls r2, r2, #4
	adds r0, r5, r2
	str r3, [sp, #0xc]
	adds r4, r5, r4
	adds r2, #0xe0
	ldr r2, [r4, r2]
	movs r1, #4
	bl FUN_020200FC
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225A664: .4byte 0x0225D108
_0225A668: .4byte 0x000F0100
	thumb_func_end ov27_0225A61C

	thumb_func_start ov27_0225A66C
ov27_0225A66C: @ 0x0225A66C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov27_0225A594
	adds r4, r0, #0
	movs r0, #0x51
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, r4
	beq _0225A68E
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov27_0225A61C
	movs r0, #0x51
	lsls r0, r0, #4
	str r4, [r5, r0]
_0225A68E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov27_0225A66C

	thumb_func_start ov27_0225A690
ov27_0225A690: @ 0x0225A690
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _0225A6C0
	ldr r2, _0225A710 @ =0x0000051C
	movs r1, #1
	ldr r3, [r4, r2]
	bics r3, r1
	movs r1, #1
	orrs r1, r3
	str r1, [r4, r2]
	bl ov27_0225A4D0
	adds r0, r4, #0
	movs r1, #1
	bl ov27_0225A9C0
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	pop {r4, pc}
_0225A6C0:
	ldr r1, _0225A710 @ =0x0000051C
	movs r0, #1
	ldr r2, [r4, r1]
	bics r2, r0
	movs r0, #0x3d
	lsls r0, r0, #4
	str r2, [r4, r1]
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x3d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D578
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #0
	bl ov27_0225A9C0
	pop {r4, pc}
	nop
_0225A710: .4byte 0x0000051C
	thumb_func_end ov27_0225A690

	thumb_func_start ov27_0225A714
ov27_0225A714: @ 0x0225A714
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _0225A722
	bl GF_AssertFail
_0225A722:
	ldr r4, [r5, #0x10]
	ldr r6, [r5, #0xc]
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	cmp r0, #4
	bne _0225A75C
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_020183F0
	cmp r0, #0
	bne _0225A74C
	adds r0, r5, #0
	movs r1, #1
	bl ov27_0225A8E8
	b _0225A7AC
_0225A74C:
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x3f
	adds r4, #0xd2
	bics r1, r0
	strb r1, [r4]
	b _0225A7AC
_0225A75C:
	cmp r0, #3
	bne _0225A7AC
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_020183F0
	cmp r0, #1
	bne _0225A792
	movs r0, #1
	strh r0, [r6]
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x3f
	bics r1, r0
	adds r0, r4, #0
	adds r0, #0xd2
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x80
	adds r4, #0xd2
	orrs r0, r1
	strb r0, [r4]
	b _0225A7AC
_0225A792:
	ldr r1, [r5, #0x14]
	adds r0, r5, #0
	bl ov27_0225B398
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x3f
	adds r4, #0xd2
	bics r1, r0
	movs r0, #1
	orrs r0, r1
	strb r0, [r4]
_0225A7AC:
	movs r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ov27_0225A714

	thumb_func_start ov27_0225A7B0
ov27_0225A7B0: @ 0x0225A7B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_0203DF8C
	cmp r0, #1
	bne _0225A7C4
	adds r0, r4, #0
	bl ov27_0225A66C
_0225A7C4:
	ldr r0, _0225A7D8 @ =0x0000051C
	ldr r0, [r4, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	bne _0225A7D4
	adds r0, r4, #0
	bl ov27_0225AAD4
_0225A7D4:
	pop {r4, pc}
	nop
_0225A7D8: .4byte 0x0000051C
	thumb_func_end ov27_0225A7B0

	thumb_func_start ov27_0225A7DC
ov27_0225A7DC: @ 0x0225A7DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #7
	blt _0225A7EA
	bl GF_AssertFail
_0225A7EA:
	ldr r1, [r4, #0x14]
	adds r0, r4, #0
	bl ov27_0225B398
	adds r0, r4, #0
	movs r1, #0
	bl ov27_0225A690
	pop {r4, pc}
	thumb_func_end ov27_0225A7DC

	thumb_func_start ov27_0225A7FC
ov27_0225A7FC: @ 0x0225A7FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x10]
	adds r2, r1, #0
	adds r2, #0xd2
	ldrb r2, [r2]
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x1a
	cmp r2, #4
	bhi _0225A866
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0225A81C: @ jump table
	.2byte _0225A826 - _0225A81C - 2 @ case 0
	.2byte _0225A82C - _0225A81C - 2 @ case 1
	.2byte _0225A846 - _0225A81C - 2 @ case 2
	.2byte _0225A866 - _0225A81C - 2 @ case 3
	.2byte _0225A866 - _0225A81C - 2 @ case 4
_0225A826:
	bl ov27_0225A7B0
	pop {r4, pc}
_0225A82C:
	bl ov27_0225A7DC
	ldr r2, [r4, #0x10]
	adds r0, r2, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x3f
	adds r2, #0xd2
	bics r1, r0
	movs r0, #2
	orrs r0, r1
	strb r0, [r2]
	pop {r4, pc}
_0225A846:
	ldr r0, [r1, #0x6c]
	cmp r0, #0
	beq _0225A86A
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225A86A
	adds r0, r4, #0
	bl ov27_0225B4D8
	cmp r0, #0
	beq _0225A86A
	adds r0, r4, #0
	bl ov27_0225B404
	pop {r4, pc}
_0225A866:
	bl GF_AssertFail
_0225A86A:
	pop {r4, pc}
	thumb_func_end ov27_0225A7FC

	thumb_func_start ov27_0225A86C
ov27_0225A86C: @ 0x0225A86C
	push {r4, lr}
	adds r4, r0, #0
	bl ov27_0225A594
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov27_0225A61C
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov27_0225B398
	movs r0, #0x3d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D578
	adds r0, r4, #0
	movs r1, #1
	bl ov27_0225A690
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov27_0225A86C

	thumb_func_start ov27_0225A89C
ov27_0225A89C: @ 0x0225A89C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225A8E0
	ldr r0, [r4, #0x6c]
	cmp r0, #0
	beq _0225A8E0
	adds r0, r4, #0
	adds r0, #0xd2
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	bne _0225A8E0
	adds r0, r4, #0
	bl FUN_0203E13C
	cmp r0, #0
	beq _0225A8E0
	adds r0, r4, #0
	bl ov27_0225BD44
	cmp r0, #0
	bne _0225A8E0
	adds r0, r4, #0
	bl FUN_020407AC
	cmp r0, #0
	bne _0225A8E0
	bl FUN_02058AA0
	cmp r0, #0
	beq _0225A8E4
_0225A8E0:
	movs r0, #1
	pop {r4, pc}
_0225A8E4:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov27_0225A89C

	thumb_func_start ov27_0225A8E8
ov27_0225A8E8: @ 0x0225A8E8
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	cmp r1, #0
	beq _0225A9AE
	ldr r1, _0225A9B8 @ =0x0000051C
	ldr r1, [r4, r1]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1c
	cmp r1, #5
	bne _0225A912
	ldr r1, [r4, #0x10]
	adds r1, #0xd2
	ldrb r1, [r1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	bne _0225A912
	movs r1, #0
	mvns r1, r1
	bl ov27_0225B398
_0225A912:
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	movs r0, #0xed
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	movs r0, #0x3b
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	movs r0, #0xee
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024B78
	ldr r0, [r4, #0x10]
	adds r0, #0xd2
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	beq _0225A974
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r1, [r4, #0x14]
	adds r0, r4, r0
	bl ov27_0225B4AC
	b _0225A982
_0225A974:
	movs r0, #0x39
	lsls r0, r0, #4
	movs r1, #0
	adds r0, r4, r0
	mvns r1, r1
	bl ov27_0225B4AC
_0225A982:
	ldr r0, _0225A9B8 @ =0x0000051C
	ldr r0, [r4, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	cmp r0, #2
	bne _0225A99A
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024B78
_0225A99A:
	movs r0, #9
	str r0, [sp]
	ldr r0, _0225A9BC @ =0x04001050
	movs r1, #0
	movs r2, #0x23
	movs r3, #6
	blx FUN_020CF15C
	add sp, #4
	pop {r3, r4, pc}
_0225A9AE:
	ldr r0, _0225A9BC @ =0x04001050
	movs r1, #0
	strh r1, [r0]
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0225A9B8: .4byte 0x0000051C
_0225A9BC: .4byte 0x04001050
	thumb_func_end ov27_0225A8E8

	thumb_func_start ov27_0225A9C0
ov27_0225A9C0: @ 0x0225A9C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov27_0225BDAC
	cmp r0, #0
	bne _0225A9D0
	movs r4, #0
_0225A9D0:
	cmp r4, #0
	beq _0225AA2E
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_0207879C
	adds r4, r0, #0
	bl FUN_020781C4
	cmp r0, #0
	beq _0225A9EA
	movs r6, #1
	b _0225A9EC
_0225A9EA:
	movs r6, #0
_0225A9EC:
	adds r0, r4, #0
	bl FUN_020781D0
	cmp r0, #0
	beq _0225A9FA
	movs r4, #1
	b _0225A9FC
_0225A9FA:
	movs r4, #0
_0225A9FC:
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_02024830
	movs r0, #0xed
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_02024830
	movs r0, #0x3b
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02024830
	movs r0, #0xee
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02024830
	pop {r4, r5, r6, pc}
_0225AA2E:
	movs r0, #0xeb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xed
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x3b
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xee
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	pop {r4, r5, r6, pc}
	thumb_func_end ov27_0225A9C0

	thumb_func_start ov27_0225AA60
ov27_0225AA60: @ 0x0225AA60
	push {r3, r4}
	movs r4, #0
	adds r3, r4, #0
	cmp r1, #0
	ble _0225AA74
_0225AA6A:
	ldrb r2, [r0, r3]
	adds r3, r3, #1
	adds r4, r4, r2
	cmp r3, r1
	blt _0225AA6A
_0225AA74:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4}
	bx lr
	thumb_func_end ov27_0225AA60

	thumb_func_start ov27_0225AA7C
ov27_0225AA7C: @ 0x0225AA7C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _0225AACC @ =0x00000514
	movs r4, #0
	adds r5, r6, #0
_0225AA86:
	movs r0, #0x39
	adds r1, r6, r4
	lsls r0, r0, #4
	ldrb r1, [r1, r7]
	ldr r0, [r5, r0]
	bl FUN_02024830
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #7
	blt _0225AA86
	ldr r0, _0225AAD0 @ =0x0000050C
	movs r1, #1
	strb r1, [r6, r0]
	adds r0, r6, #0
	bl ov27_0225BDC8
	cmp r0, #0
	bne _0225AACA
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_02024830
	ldr r0, _0225AAD0 @ =0x0000050C
	movs r1, #0
	strb r1, [r6, r0]
_0225AACA:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225AACC: .4byte 0x00000514
_0225AAD0: .4byte 0x0000050C
	thumb_func_end ov27_0225AA7C

	thumb_func_start ov27_0225AAD4
ov27_0225AAD4: @ 0x0225AAD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0225ABF4 @ =0x00000514
	movs r1, #7
	adds r0, r5, r0
	bl ov27_0225AA60
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x3f
	lsls r0, r0, #4
	adds r0, r5, r0
	ldr r4, _0225ABF8 @ =0x0225CF10
	movs r6, #0
	adds r7, r5, #0
	str r0, [sp, #0xc]
_0225AAF6:
	ldr r0, [r5, #0x10]
	adds r1, r6, #0
	bl FUN_0203C3CC
	cmp r0, #1
	bne _0225AB62
	ldr r0, _0225ABF4 @ =0x00000514
	adds r1, r5, r6
	ldrb r0, [r1, r0]
	str r1, [sp]
	cmp r0, #0
	bne _0225AB62
	ldrh r0, [r4]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	ldrh r0, [r4]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	ldrh r1, [r4, #2]
	bl FUN_020248F0
	ldrb r0, [r4, #4]
	lsls r1, r0, #4
	ldr r0, [sp, #0xc]
	adds r0, r0, r1
	bl FUN_0201D578
	ldr r1, [sp]
	ldr r0, _0225ABF4 @ =0x00000514
	movs r2, #1
	strb r2, [r1, r0]
	adds r1, r2, #0
	subs r0, #0xa4
	strb r1, [r7, r0]
	ldr r0, [r5, #0x10]
	adds r1, r0, #0
	adds r1, #0xd2
	ldrb r2, [r1]
	movs r1, #0x80
	adds r0, #0xd2
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [sp, #8]
	adds r0, r0, #1
	str r0, [sp, #8]
_0225AB62:
	adds r6, r6, #1
	adds r4, r4, #6
	adds r7, #8
	cmp r6, #7
	blt _0225AAF6
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0225AB8E
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0225AB8E
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x3e
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D578
_0225AB8E:
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	cmp r1, r0
	beq _0225ABB2
	ldr r0, [r5, #0x10]
	movs r1, #0
	adds r0, #0xd3
	strb r1, [r0]
	ldr r1, [r5, #0x10]
	adds r0, r5, #0
	adds r1, #0xd3
	ldrb r1, [r1]
	bl ov27_0225C1AC
	str r0, [r5, #0x14]
	adds r0, r5, #0
	bl ov27_0225C1EC
_0225ABB2:
	adds r0, r5, #0
	bl ov27_0225BDC8
	cmp r0, #1
	bne _0225ABEE
	ldr r0, _0225ABFC @ =0x0000050C
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _0225ABEE
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0xa
	bl FUN_020248F0
	ldr r0, _0225ABFC @ =0x0000050C
	movs r1, #1
	strb r1, [r5, r0]
_0225ABEE:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225ABF4: .4byte 0x00000514
_0225ABF8: .4byte 0x0225CF10
_0225ABFC: .4byte 0x0000050C
	thumb_func_end ov27_0225AAD4

	thumb_func_start ov27_0225AC00
ov27_0225AC00: @ 0x0225AC00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #0x14]
	adds r4, r1, #0
	movs r0, #0xc
	muls r4, r0, r4
	movs r0, #0
	str r0, [sp]
	ldr r1, _0225ACFC @ =0x0225CEF0
	str r0, [sp, #4]
	movs r0, #1
	adds r5, r2, #0
	str r0, [sp, #8]
	movs r0, #8
	adds r6, r3, #0
	str r0, [sp, #0xc]
	ldr r1, [r1, r4]
	ldr r2, [sp, #0x14]
	movs r0, #0xe
	movs r3, #4
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	ldr r1, _0225AD00 @ =0x0225CEF4
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r1, [r1, r4]
	ldr r2, [sp, #0x14]
	movs r0, #0xe
	movs r3, #4
	bl FUN_02007914
	movs r0, #2
	ldr r1, _0225AD04 @ =0x0225CEEC
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	ldr r1, [r1, r4]
	movs r0, #0xe
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	movs r0, #0x14
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r0, #0xd2
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	adds r1, r5, #0
	movs r2, #5
	movs r3, #0x18
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r0, #0xe2
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	adds r1, r6, #0
	movs r2, #5
	movs r3, #9
	bl FUN_0201D40C
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r4, _0225AD08 @ =0x0225D074
	ldr r5, [sp, #0x30]
	movs r7, #0
	movs r6, #0xf6
_0225ACB8:
	ldr r0, [r4, #4]
	adds r1, r5, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	movs r2, #5
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r7, r7, #1
	adds r6, #0x12
	adds r4, #8
	adds r5, #0x10
	cmp r7, #8
	blt _0225ACB8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225ACFC: .4byte 0x0225CEF0
_0225AD00: .4byte 0x0225CEF4
_0225AD04: .4byte 0x0225CEEC
_0225AD08: .4byte 0x0225D074
	thumb_func_end ov27_0225AC00

	thumb_func_start ov27_0225AD0C
ov27_0225AD0C: @ 0x0225AD0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r1, r5, #0
	movs r0, #0x10
	adds r1, #0x1c
	movs r2, #8
	bl FUN_02009F40
	str r0, [r5, #0x18]
	adds r0, r5, #0
	movs r2, #1
	adds r0, #0x1c
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r7, #0x51
	movs r6, #0
	adds r4, r5, #0
	lsls r7, r7, #2
_0225AD36:
	movs r0, #0xb
	adds r1, r6, #0
	movs r2, #8
	bl FUN_0200A090
	str r0, [r4, r7]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _0225AD36
	movs r0, #0x55
	lsls r0, r0, #2
	movs r4, #0
	adds r6, r5, r0
_0225AD52:
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_02028E9C
	bl FUN_02028F94
	adds r7, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_0207879C
	adds r1, r4, #0
	adds r1, #0x64
	str r1, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0225AE84 @ =0x0000051C
	movs r1, #0x51
	ldr r0, [r5, r0]
	lsls r1, r1, #2
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	adds r1, r5, r1
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov27_0225AEA8
	adds r4, r4, #1
	adds r6, #0x10
	cmp r4, #0xb
	blt _0225AD52
	movs r1, #0x64
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #8
	adds r1, #0xe8
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xe
	movs r2, #0x10
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x57
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r1, #0x64
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #8
	adds r1, #0xec
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xe
	movs r2, #0x11
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x16
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r1, #0x65
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #8
	adds r1, #0xe7
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xe
	movs r2, #0x44
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r1, #0x65
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #8
	adds r1, #0xeb
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xe
	movs r2, #0x45
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r1, #0x66
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #8
	adds r1, #0xe6
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xe
	movs r2, #0x36
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x5f
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r1, #0x66
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #8
	adds r1, #0xea
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	movs r1, #0xe
	movs r2, #0x37
	movs r3, #1
	bl FUN_0200A294
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #0xe
	adds r1, r0, #0
	add r2, sp, #0x10
	movs r3, #8
	bl FUN_020079F4
	adds r4, r0, #0
	ldr r0, [sp, #0x10]
	movs r1, #0x40
	ldr r0, [r0, #0xc]
	blx DC_FlushRange
	ldr r0, [sp, #0x10]
	ldr r1, _0225AE88 @ =0x000004CC
	ldr r0, [r0, #0xc]
	adds r1, r5, r1
	movs r2, #0x40
	blx FUN_020D48B4
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225AE84: .4byte 0x0000051C
_0225AE88: .4byte 0x000004CC
	thumb_func_end ov27_0225AD0C

	thumb_func_start ov27_0225AE8C
ov27_0225AE8C: @ 0x0225AE8C
	cmp r0, #1
	bne _0225AE94
	movs r0, #5
	bx lr
_0225AE94:
	cmp r0, #3
	bne _0225AE9E
	movs r0, #0x7d
	lsls r0, r0, #2
	bx lr
_0225AE9E:
	ldr r0, _0225AEA4 @ =0x000001F3
	bx lr
	nop
_0225AEA4: .4byte 0x000001F3
	thumb_func_end ov27_0225AE8C

	thumb_func_start ov27_0225AEA8
ov27_0225AEA8: @ 0x0225AEA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	mov ip, r0
	ldr r0, [sp, #0x44]
	str r1, [sp, #0x10]
	lsls r1, r0, #3
	ldr r0, _0225B004 @ =0x0225CFC8
	adds r5, r3, #0
	adds r0, r0, r1
	ldrb r1, [r5, r0]
	movs r0, #1
	movs r6, #0xe
	adds r4, r2, #0
	movs r2, #0x12
	ldr r7, [sp, #0x40]
	str r6, [sp, #0x20]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x18]
	cmp r1, #0xd
	beq _0225AF22
	cmp r1, #2
	bne _0225AEDE
	ldr r0, [sp, #0x3c]
	cmp r0, #1
	bne _0225AEDE
	movs r2, #0x1b
	b _0225AF22
_0225AEDE:
	ldr r0, _0225B008 @ =0x0225CF94
	lsls r1, r1, #2
	ldrh r2, [r0, r1]
	ldr r0, _0225B00C @ =0x0000FFFF
	cmp r2, r0
	bne _0225AF22
	mov r0, ip
	bl FUN_0206DB28
	str r0, [sp, #0x14]
	cmp r0, #0
	bne _0225AEFA
	bl GF_AssertFail
_0225AEFA:
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, #0x17]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _0225AF20
	movs r0, #0
	str r0, [sp, #0x1c]
	movs r0, #3
	movs r6, #0x14
	str r0, [sp, #0x18]
	bl FUN_02074490
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	ldr r0, [r0, #0x10]
	bl FUN_020741B0
	adds r2, r0, #0
	b _0225AF22
_0225AF20:
	movs r2, #0x12
_0225AF22:
	cmp r5, #7
	bne _0225AF4A
	movs r0, #0
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	movs r6, #0x12
	bl FUN_020781C4
	movs r1, #2
	bl FUN_02077C18
	str r0, [sp, #0x20]
	adds r0, r7, #0
	bl FUN_020781C4
	movs r1, #1
	bl FUN_02077C18
	adds r2, r0, #0
	b _0225AFAC
_0225AF4A:
	cmp r5, #8
	bne _0225AF72
	movs r0, #0
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	movs r6, #0x12
	bl FUN_020781D0
	movs r1, #2
	bl FUN_02077C18
	str r0, [sp, #0x20]
	adds r0, r7, #0
	bl FUN_020781D0
	movs r1, #1
	bl FUN_02077C18
	adds r2, r0, #0
	b _0225AFAC
_0225AF72:
	cmp r5, #9
	bne _0225AF82
	movs r0, #7
	str r0, [sp, #0x20]
	movs r0, #4
	movs r2, #0x46
	str r0, [sp, #0x18]
	b _0225AFAC
_0225AF82:
	cmp r5, #0xa
	bne _0225AFAC
	ldr r0, [sp, #0x44]
	bl ov27_0225AE8C
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	movs r1, #2
	movs r6, #0x12
	bl FUN_02077C18
	str r0, [sp, #0x20]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl FUN_02077C18
	adds r2, r0, #0
_0225AFAC:
	ldr r0, [sp, #0x38]
	ldr r3, [sp, #0x1c]
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	adds r1, r6, #0
	ldr r0, [r0]
	bl FUN_0200A1D8
	str r0, [r4]
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	adds r1, r6, #0
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	movs r3, #0
	ldr r0, [r0, #4]
	bl FUN_0200A234
	str r0, [r4, #4]
	ldr r0, [r4]
	bl FUN_0200ADA4
	ldr r0, [r4]
	bl FUN_0200A740
	ldr r0, [r4, #4]
	bl FUN_0200B00C
	ldr r0, [r4, #4]
	bl FUN_0200A740
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0225B004: .4byte 0x0225CFC8
_0225B008: .4byte 0x0225CF94
_0225B00C: .4byte 0x0000FFFF
	thumb_func_end ov27_0225AEA8

	thumb_func_start ov27_0225B010
ov27_0225B010: @ 0x0225B010
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	adds r5, r0, #0
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r4, _0225B350 @ =0x0225CF3C
	movs r7, #0
	adds r6, r5, r0
_0225B020:
	ldr r3, [r4]
	movs r0, #0
	str r3, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r7, #0
	str r0, [sp, #0x14]
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, #0x64
	str r0, [sp, #0x18]
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r1, #0
	str r0, [sp, #0x1c]
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	str r0, [sp, #0x20]
	movs r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r6, #0
	bl FUN_02009D48
	adds r7, r7, #1
	adds r4, r4, #4
	adds r6, #0x24
	cmp r7, #0xb
	blt _0225B020
	ldr r0, [r5, #0x18]
	add r1, sp, #0x3c
	str r0, [sp, #0x3c]
	movs r0, #0x81
	lsls r0, r0, #2
	adds r7, r5, r0
	movs r0, #0
	str r0, [sp, #0x2c]
	str r0, [sp, #0x4c]
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x2c]
	str r7, [sp, #0x40]
	strh r0, [r1, #0x20]
	movs r0, #1
	str r0, [sp, #0x60]
	movs r0, #2
	str r0, [sp, #0x64]
	movs r0, #8
	ldr r6, _0225B354 @ =0x0225D038
	str r0, [sp, #0x68]
	adds r4, r5, #0
_0225B0A0:
	ldrh r0, [r6]
	str r7, [sp, #0x40]
	cmp r0, #0
	beq _0225B0BA
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225B0C8
_0225B0BA:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225B0C8:
	blx FUN_020F2104
	str r0, [sp, #0x44]
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _0225B0E6
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225B0F4
_0225B0E6:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225B0F4:
	blx FUN_020F2104
	movs r1, #1
	lsls r1, r1, #0x14
	adds r0, r0, r1
	str r0, [sp, #0x48]
	add r0, sp, #0x3c
	bl FUN_02024624
	movs r1, #0x39
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024A04
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202487C
	ldr r0, [sp, #0x2c]
	adds r7, #0x24
	adds r0, r0, #1
	adds r6, r6, #4
	adds r4, r4, #4
	str r0, [sp, #0x2c]
	cmp r0, #9
	blt _0225B0A0
	movs r0, #9
	str r0, [sp, #0x30]
	movs r0, #0xd2
	lsls r0, r0, #2
	adds r4, r5, #0
	movs r7, #0x3f
	adds r0, r5, r0
	ldr r6, _0225B358 @ =0x0225D05C
	adds r4, #0x24
	lsls r7, r7, #0x18
	str r0, [sp, #0x38]
_0225B154:
	ldr r0, [sp, #0x38]
	str r0, [sp, #0x40]
	ldrh r0, [r6]
	cmp r0, #0
	beq _0225B16E
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F1520
	b _0225B17A
_0225B16E:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r7, #0
	blx FUN_020F24C8
_0225B17A:
	blx FUN_020F2104
	str r0, [sp, #0x44]
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _0225B196
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r7, #0
	blx FUN_020F1520
	b _0225B1A2
_0225B196:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r7, #0
	blx FUN_020F24C8
_0225B1A2:
	blx FUN_020F2104
	movs r1, #1
	lsls r1, r1, #0x14
	adds r0, r0, r1
	str r0, [sp, #0x48]
	add r0, sp, #0x3c
	bl FUN_02024624
	movs r1, #0x39
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_02024A04
	ldr r0, [sp, #0x30]
	adds r6, r6, #4
	adds r0, r0, #1
	adds r4, r4, #4
	str r0, [sp, #0x30]
	cmp r0, #0xf
	blt _0225B154
	ldr r0, _0225B35C @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1b
	lsrs r1, r0, #0x1c
	subs r0, r1, #1
	cmp r0, #2
	bhi _0225B27E
	cmp r1, #1
	bne _0225B1F6
	movs r0, #0x90
	str r0, [sp, #0x34]
	b _0225B200
_0225B1F6:
	subs r0, r1, #2
	cmp r0, #1
	bhi _0225B200
	movs r0, #0x68
	str r0, [sp, #0x34]
_0225B200:
	movs r0, #0xdb
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp, #0x40]
	movs r0, #0x19
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x34]
	cmp r0, #0
	ble _0225B238
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225B246
_0225B238:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225B246:
	blx FUN_020F2104
	movs r1, #1
	lsls r1, r1, #0x14
	adds r0, r0, r1
	str r0, [sp, #0x48]
	add r0, sp, #0x3c
	bl FUN_02024624
	movs r1, #0xf3
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0xf3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024A04
	movs r0, #0xf3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	bl FUN_020248F0
_0225B27E:
	ldr r0, _0225B35C @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	cmp r0, #2
	bne _0225B2D2
	ldr r0, [r5, #0x10]
	bl FUN_0206DB28
	adds r4, r0, #0
	bne _0225B298
	bl GF_AssertFail
_0225B298:
	ldrb r0, [r4, #0x17]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _0225B2E2
	movs r0, #0xea
	lsls r0, r0, #2
	movs r3, #1
	ldr r0, [r5, r0]
	movs r1, #0x68
	movs r2, #0x88
	lsls r3, r3, #0x14
	bl FUN_0200DDC4
	ldr r0, [r4, #0x10]
	bl FUN_02074484
	adds r1, r0, #0
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02024AA8
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	bl FUN_020248F0
	b _0225B2E2
_0225B2D2:
	cmp r0, #3
	bne _0225B2E2
	movs r0, #0xea
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
_0225B2E2:
	movs r0, #0xed
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_020248F0
	movs r0, #0xee
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #8
	bl FUN_020248F0
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_020248F0
	movs r0, #0xf
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #5
	bl FUN_020248F0
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0xc
	bl FUN_020248F0
	movs r0, #0xf2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xf1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024A04
	adds r0, r5, #0
	bl ov27_0225A4B8
	adds r0, r5, #0
	movs r1, #1
	bl ov27_0225A9C0
	adds r0, r5, #0
	bl ov27_0225AA7C
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	nop
_0225B350: .4byte 0x0225CF3C
_0225B354: .4byte 0x0225D038
_0225B358: .4byte 0x0225D05C
_0225B35C: .4byte 0x0000051C
	thumb_func_end ov27_0225B010

	thumb_func_start ov27_0225B360
ov27_0225B360: @ 0x0225B360
	push {r3, r4, r5, r6}
	movs r5, #0xc
	muls r5, r0, r5
	ldr r6, _0225B394 @ =0x0225D0B4
	lsls r0, r1, #1
	movs r4, #0
	adds r5, r6, r5
	adds r0, r1, r0
	mvns r4, r4
	movs r3, #0
	adds r5, r5, r0
_0225B376:
	ldrb r1, [r5]
	lsls r0, r1, #3
	ldrb r0, [r2, r0]
	cmp r0, #0
	beq _0225B384
	adds r4, r1, #0
	b _0225B38C
_0225B384:
	adds r3, r3, #1
	adds r5, r5, #1
	cmp r3, #3
	blt _0225B376
_0225B38C:
	adds r0, r4, #0
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0225B394: .4byte 0x0225D0B4
	thumb_func_end ov27_0225B360

	thumb_func_start ov27_0225B398
ov27_0225B398: @ 0x0225B398
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	str r1, [sp]
	cmp r1, #7
	blt _0225B3A6
	bl GF_AssertFail
_0225B3A6:
	ldr r0, _0225B3F0 @ =0x000004CC
	movs r4, #0
	adds r5, r4, #0
	adds r7, r6, r0
_0225B3AE:
	ldr r0, _0225B3F4 @ =0x0000051C
	ldr r0, [r6, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	lsls r1, r0, #3
	ldr r0, _0225B3F8 @ =0x0225CFC8
	adds r0, r0, r1
	ldrb r1, [r4, r0]
	ldr r0, _0225B3FC @ =0x0225CF94
	lsls r2, r1, #2
	ldrh r0, [r0, r2]
	movs r2, #0
	cmp r1, #0xd
	beq _0225B3E4
	ldr r1, _0225B400 @ =0x0000FFFF
	cmp r0, r1
	beq _0225B3E4
	ldr r0, [sp]
	cmp r4, r0
	bne _0225B3D8
	movs r2, #0x10
_0225B3D8:
	lsls r0, r2, #1
	adds r0, r7, r0
	adds r1, r5, #0
	movs r2, #0x20
	blx FUN_020CFD70
_0225B3E4:
	adds r4, r4, #1
	adds r5, #0x20
	cmp r4, #7
	blt _0225B3AE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225B3F0: .4byte 0x000004CC
_0225B3F4: .4byte 0x0000051C
_0225B3F8: .4byte 0x0225CFC8
_0225B3FC: .4byte 0x0225CF94
_0225B400: .4byte 0x0000FFFF
	thumb_func_end ov27_0225B398

	thumb_func_start ov27_0225B404
ov27_0225B404: @ 0x0225B404
	push {r3, r4, r5, lr}
	ldr r1, _0225B4A8 @ =0x021D110C
	adds r5, r0, #0
	ldr r1, [r1, #0x48]
	movs r4, #0
	movs r2, #0x40
	mvns r4, r4
	ldr r0, [r5, #0x14]
	tst r2, r1
	beq _0225B41C
	movs r4, #0
	b _0225B438
_0225B41C:
	movs r2, #0x80
	tst r2, r1
	beq _0225B426
	movs r4, #1
	b _0225B438
_0225B426:
	movs r2, #0x20
	tst r2, r1
	beq _0225B430
	movs r4, #2
	b _0225B438
_0225B430:
	movs r2, #0x10
	tst r1, r2
	beq _0225B438
	movs r4, #3
_0225B438:
	cmp r4, #0
	blt _0225B448
	movs r2, #0x47
	lsls r2, r2, #4
	adds r1, r4, #0
	adds r2, r5, r2
	bl ov27_0225B360
_0225B448:
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0225B4A6
	ldr r1, [r5, #0x14]
	cmp r1, r0
	beq _0225B4A6
	str r0, [r5, #0x14]
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	cmp r4, #1
	bhi _0225B478
	ldr r0, [r5, #0x14]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #3
	bl FUN_020248F0
	b _0225B490
_0225B478:
	subs r0, r4, #2
	cmp r0, #1
	bhi _0225B490
	ldr r0, [r5, #0x14]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_020248F0
_0225B490:
	ldr r1, [r5, #0x14]
	adds r0, r5, #0
	bl ov27_0225B398
	ldr r1, [r5, #0x14]
	adds r0, r5, #0
	bl ov27_0225C170
	ldr r1, [r5, #0x10]
	adds r1, #0xd3
	strb r0, [r1]
_0225B4A6:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225B4A8: .4byte 0x021D110C
	thumb_func_end ov27_0225B404

	thumb_func_start ov27_0225B4AC
ov27_0225B4AC: @ 0x0225B4AC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	movs r7, #1
_0225B4B6:
	ldr r0, [r5]
	cmp r0, #0
	beq _0225B4CE
	cmp r6, r4
	beq _0225B4C8
	adds r1, r7, #0
	bl FUN_02024B78
	b _0225B4CE
_0225B4C8:
	movs r1, #0
	bl FUN_02024B78
_0225B4CE:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #9
	blt _0225B4B6
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov27_0225B4AC

	thumb_func_start ov27_0225B4D8
ov27_0225B4D8: @ 0x0225B4D8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x40]
	bl FUN_0205C6D4
	cmp r0, #0
	bne _0225B4F2
	ldr r0, _0225B624 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0xf0
	tst r0, r1
	beq _0225B4F6
_0225B4F2:
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B4F6:
	ldr r0, _0225B628 @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	cmp r0, #5
	bne _0225B53E
	bl FUN_0203769C
	adds r4, r0, #0
	bl FUN_02058740
	cmp r0, #0
	beq _0225B53A
	bl FUN_02058258
	cmp r0, #0
	beq _0225B53A
	bl FUN_02056EE0
	cmp r0, #0
	beq _0225B53A
	bl FUN_02057A0C
	cmp r0, #0
	beq _0225B53A
	adds r0, r4, #0
	bl FUN_02057F18
	cmp r0, #0
	bne _0225B53A
	bl FUN_02037958
	cmp r0, #0
	beq _0225B53E
_0225B53A:
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B53E:
	bl FUN_0200FB5C
	cmp r0, #0
	bne _0225B54A
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B54A:
	ldr r0, _0225B628 @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0225B55A
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B55A:
	ldr r0, _0225B62C @ =0x0225CF68
	bl FUN_02025224
	adds r4, r0, #0
	cmp r4, #0
	ble _0225B57E
	cmp r4, #8
	bge _0225B57E
	subs r0, r4, #1
	lsls r0, r0, #3
	adds r1, r5, r0
	movs r0, #0x47
	lsls r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0225B57E
	movs r0, #0
	pop {r4, r5, r6, pc}
_0225B57E:
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_0207879C
	adds r6, r0, #0
	adds r0, r4, #0
	subs r0, #8
	cmp r0, #1
	bhi _0225B5AC
	ldr r0, _0225B628 @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _0225B59E
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B59E:
	adds r0, r5, #0
	bl ov27_0225BDAC
	cmp r0, #0
	bne _0225B5AC
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B5AC:
	cmp r4, #8
	bne _0225B5BE
	adds r0, r6, #0
	bl FUN_020781C4
	cmp r0, #0
	bne _0225B5D0
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B5BE:
	cmp r4, #9
	bne _0225B5D0
	adds r0, r6, #0
	bl FUN_020781D0
	cmp r0, #0
	bne _0225B5D0
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225B5D0:
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _0225B620
	cmp r4, #0
	bne _0225B5E4
	ldr r0, [r5, #0xc]
	movs r1, #1
	strh r1, [r0]
	b _0225B61C
_0225B5E4:
	subs r1, r4, #1
	lsls r0, r1, #2
	adds r2, r5, r0
	movs r0, #0x39
	lsls r0, r0, #4
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225B61C
	cmp r4, #8
	bge _0225B60E
	str r1, [r5, #0x14]
	adds r0, r5, #0
	bl ov27_0225C170
	ldr r1, [r5, #0x10]
	adds r1, #0xd3
	strb r0, [r1]
	ldr r1, [r5, #0x14]
	adds r0, r5, #0
	bl ov27_0225B398
_0225B60E:
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov27_0225C170
	adds r1, r0, #2
	ldr r0, [r5, #0xc]
	strh r1, [r0]
_0225B61C:
	movs r0, #0
	pop {r4, r5, r6, pc}
_0225B620:
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225B624: .4byte 0x021D110C
_0225B628: .4byte 0x0000051C
_0225B62C: .4byte 0x0225CF68
	thumb_func_end ov27_0225B4D8

	thumb_func_start ov27_0225B630
ov27_0225B630: @ 0x0225B630
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r7, r0, #0
	str r1, [sp, #0x10]
	ldr r6, [r7]
	bl FUN_0201EE98
	adds r5, r0, #0
	adds r0, r7, #0
	bl FUN_0201EE9C
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_0201EE90
	str r0, [sp, #0x14]
	adds r0, r7, #0
	bl FUN_0201EE94
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	beq _0225B666
	cmp r0, #2
	bne _0225B664
	b _0225B8C2
_0225B664:
	b _0225BB1E
_0225B666:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #3
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0xa9
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #2
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0xaa
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #1
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0xab
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x14]
	lsls r3, r5, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0xac
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	ldr r0, [sp, #0x14]
	movs r1, #5
	adds r7, r5, r0
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r7, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r2, #0xad
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #3
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0x64
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #2
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0x65
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #1
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0x66
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r7, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0x68
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #3
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0x84
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #2
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0x85
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #1
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0x86
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r7, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0x88
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	ldr r0, [sp, #0x18]
	subs r3, r5, #3
	adds r4, r4, r0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0xa4
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #2
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0xa5
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #1
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0xa6
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x14]
	lsls r3, r5, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0xa7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r7, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0xa8
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	b _0225BB22
_0225B8C2:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #3
	str r0, [sp, #8]
	movs r0, #0
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #2
	str r0, [sp, #8]
	movs r0, #0
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #1
	str r0, [sp, #8]
	movs r0, #0
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x14]
	lsls r3, r5, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	ldr r0, [sp, #0x14]
	movs r1, #5
	adds r7, r5, r0
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r7, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r2, #0
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #3
	str r0, [sp, #8]
	movs r0, #0
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #2
	str r0, [sp, #8]
	movs r0, #0
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #1
	str r0, [sp, #8]
	movs r0, #0
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r7, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #3
	str r0, [sp, #8]
	movs r0, #0
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #2
	str r0, [sp, #8]
	movs r0, #0
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #1
	str r0, [sp, #8]
	movs r0, #0
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r7, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	ldr r0, [sp, #0x18]
	subs r3, r5, #3
	adds r4, r4, r0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #2
	str r0, [sp, #8]
	movs r0, #0
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	subs r3, r5, #1
	str r0, [sp, #8]
	movs r0, #0
	lsls r3, r3, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x14]
	lsls r3, r5, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #2
	lsls r3, r7, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	b _0225BB22
_0225BB1E:
	bl GF_AssertFail
_0225BB22:
	adds r0, r6, #0
	movs r1, #4
	bl FUN_0201EFBC
	adds r0, r6, #0
	movs r1, #5
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov27_0225B630

	thumb_func_start ov27_0225BB38
ov27_0225BB38: @ 0x0225BB38
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r1, #0
	ldr r1, _0225BB68 @ =0x0225CEC4
	lsls r2, r2, #2
	ldr r4, [r1, r2]
	adds r5, r0, #0
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r4, [sp, #8]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #3
	str r1, [sp, #0xc]
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0225BB68: .4byte 0x0225CEC4
	thumb_func_end ov27_0225BB38

	thumb_func_start ov27_0225BB6C
ov27_0225BB6C: @ 0x0225BB6C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_02028E9C
	adds r2, r0, #0
	ldr r0, _0225BC10 @ =0x000004AC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BE48
	ldr r7, _0225BC14 @ =0x0225CFC8
	movs r4, #0
	adds r6, r5, #0
_0225BB8A:
	ldr r0, _0225BC18 @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	lsls r0, r0, #3
	adds r0, r7, r0
	ldrb r2, [r4, r0]
	cmp r2, #0xd
	beq _0225BBBA
	lsls r3, r2, #2
	ldr r2, _0225BC1C @ =0x0225CF94
	ldr r0, _0225BC10 @ =0x000004AC
	adds r2, r2, r3
	ldrh r2, [r2, #2]
	ldr r1, _0225BC20 @ =0x000004A8
	ldr r0, [r5, r0]
	lsls r2, r2, #0x11
	ldr r1, [r5, r1]
	lsrs r2, r2, #0x11
	movs r3, #8
	bl FUN_0200BC4C
	ldr r1, _0225BC24 @ =0x00000474
	str r0, [r6, r1]
_0225BBBA:
	adds r4, r4, #1
	adds r6, #8
	cmp r4, #7
	blt _0225BB8A
	ldr r4, _0225BC28 @ =0x0225CED8
	movs r7, #0
	adds r6, r5, #0
_0225BBC8:
	ldr r0, _0225BC20 @ =0x000004A8
	ldr r1, [r4]
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	movs r1, #0x4b
	lsls r1, r1, #4
	str r0, [r6, r1]
	adds r7, r7, #1
	adds r4, r4, #4
	adds r6, r6, #4
	cmp r7, #5
	blt _0225BBC8
	subs r1, r1, #4
	ldr r0, [r5, r1]
	subs r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0xc
	movs r3, #8
	bl FUN_0200BC4C
	ldr r1, _0225BC2C @ =0x000004C4
	movs r2, #0xd
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #0x18
	subs r1, #0x1c
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	movs r3, #8
	bl FUN_0200BC4C
	ldr r1, _0225BC30 @ =0x000004C8
	str r0, [r5, r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225BC10: .4byte 0x000004AC
_0225BC14: .4byte 0x0225CFC8
_0225BC18: .4byte 0x0000051C
_0225BC1C: .4byte 0x0225CF94
_0225BC20: .4byte 0x000004A8
_0225BC24: .4byte 0x00000474
_0225BC28: .4byte 0x0225CED8
_0225BC2C: .4byte 0x000004C4
_0225BC30: .4byte 0x000004C8
	thumb_func_end ov27_0225BB6C

	thumb_func_start ov27_0225BC34
ov27_0225BC34: @ 0x0225BC34
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0225BC78 @ =0x000004C8
	ldr r0, [r5, r0]
	bl FUN_02026380
	ldr r0, _0225BC7C @ =0x000004C4
	ldr r0, [r5, r0]
	bl FUN_02026380
	movs r7, #0x4b
	movs r6, #0
	adds r4, r5, #0
	lsls r7, r7, #4
_0225BC50:
	ldr r0, [r4, r7]
	bl FUN_02026380
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #5
	blt _0225BC50
	ldr r6, _0225BC80 @ =0x00000474
	movs r4, #0
_0225BC62:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _0225BC6C
	bl FUN_02026380
_0225BC6C:
	adds r4, r4, #1
	adds r5, #8
	cmp r4, #7
	blt _0225BC62
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225BC78: .4byte 0x000004C8
_0225BC7C: .4byte 0x000004C4
_0225BC80: .4byte 0x00000474
	thumb_func_end ov27_0225BC34

	thumb_func_start ov27_0225BC84
ov27_0225BC84: @ 0x0225BC84
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	movs r7, #0
	str r0, [sp]
	adds r4, r7, #0
	add r5, sp, #4
_0225BC90:
	ldr r0, [sp]
	adds r1, r4, #0
	ldr r0, [r0, #0x10]
	bl FUN_0203C3CC
	adds r4, r4, #1
	stm r5!, {r0}
	cmp r4, #8
	blt _0225BC90
	movs r1, #0x3f
	ldr r0, [sp]
	lsls r1, r1, #4
	movs r6, #0
	add r4, sp, #4
	adds r5, r0, r1
_0225BCAE:
	ldr r0, [r4]
	cmp r0, #0
	beq _0225BCBC
	adds r0, r5, #0
	bl FUN_0201D578
	adds r7, r7, #1
_0225BCBC:
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, #0x10
	cmp r6, #8
	blt _0225BCAE
	cmp r7, #0
	beq _0225BCE4
	movs r1, #0xf2
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #1
	bl FUN_02024830
	movs r1, #0x3e
	ldr r0, [sp]
	lsls r1, r1, #4
	adds r0, r0, r1
	bl FUN_0201D578
_0225BCE4:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov27_0225BC84

	thumb_func_start ov27_0225BCE8
ov27_0225BCE8: @ 0x0225BCE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #4
	movs r6, #0
	adds r4, r5, r0
_0225BCF6:
	ldr r0, _0225BD3C @ =0x00000474
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0225BD2C
	movs r0, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0x48
	subs r3, r1, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225BD40 @ =0x000E0200
	lsrs r7, r3, #0x1f
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r2, _0225BD3C @ =0x00000474
	adds r7, r3, r7
	ldr r2, [r5, r2]
	adds r0, r4, #0
	movs r1, #0
	asrs r3, r7, #1
	bl FUN_020200FC
_0225BD2C:
	adds r6, r6, #1
	adds r5, #8
	adds r4, #0x10
	cmp r6, #7
	blt _0225BCF6
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225BD3C: .4byte 0x00000474
_0225BD40: .4byte 0x000E0200
	thumb_func_end ov27_0225BCE8

	thumb_func_start ov27_0225BD44
ov27_0225BD44: @ 0x0225BD44
	adds r0, #0xd2
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
	thumb_func_end ov27_0225BD44

	thumb_func_start ov27_0225BD50
ov27_0225BD50: @ 0x0225BD50
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_020503D0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02067584
	cmp r0, #0
	beq _0225BD6A
	movs r0, #6
	pop {r3, r4, r5, pc}
_0225BD6A:
	adds r0, r5, #0
	bl FUN_02066860
	cmp r0, #0
	beq _0225BD78
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225BD78:
	adds r0, r5, #0
	bl FUN_02066870
	cmp r0, #0
	beq _0225BD86
	movs r0, #2
	pop {r3, r4, r5, pc}
_0225BD86:
	adds r0, r5, #0
	bl FUN_020668A0
	cmp r0, #0
	beq _0225BD94
	movs r0, #3
	pop {r3, r4, r5, pc}
_0225BD94:
	ldr r0, [r4, #0x18]
	cmp r0, #3
	bne _0225BD9E
	movs r0, #4
	pop {r3, r4, r5, pc}
_0225BD9E:
	ldr r0, [r4, #0x70]
	cmp r0, #3
	bne _0225BDA8
	movs r0, #5
	pop {r3, r4, r5, pc}
_0225BDA8:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov27_0225BD50

	thumb_func_start ov27_0225BDAC
ov27_0225BDAC: @ 0x0225BDAC
	ldr r1, _0225BDC4 @ =0x0000051C
	ldr r0, [r0, r1]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	subs r0, r0, #2
	cmp r0, #4
	bls _0225BDBE
	movs r0, #1
	bx lr
_0225BDBE:
	movs r0, #0
	bx lr
	nop
_0225BDC4: .4byte 0x0000051C
	thumb_func_end ov27_0225BDAC

	thumb_func_start ov27_0225BDC8
ov27_0225BDC8: @ 0x0225BDC8
	push {r3, lr}
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_0203B9C4
	bl FUN_0203B9B4
	bl FUN_0205C7C8
	pop {r3, pc}
	thumb_func_end ov27_0225BDC8

	thumb_func_start ov27_0225BDDC
ov27_0225BDDC: @ 0x0225BDDC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_02092DEC
	str r0, [r5, #4]
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [r5, #8]
	ldr r0, [r4, #4]
	str r0, [r5]
	movs r0, #0
	str r0, [r5, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov27_0225BDDC

	thumb_func_start ov27_0225BDFC
ov27_0225BDFC: @ 0x0225BDFC
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5, #4]
	bl FUN_02092E08
	ldr r1, [r5, #0x1c]
	cmp r1, #0
	bne _0225BE8A
	cmp r0, #1
	bne _0225BEAA
	cmp r1, #0
	bne _0225BEAA
	ldr r0, [r5, #4]
	movs r1, #8
	bl FUN_02251E74
	adds r4, r0, #0
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	asrs r1, r0, #2
	lsrs r1, r1, #0x1d
	adds r1, r0, r1
	asrs r0, r1, #3
	adds r1, r0, #2
	cmp r1, #9
	ble _0225BE3A
	movs r1, #9
_0225BE3A:
	movs r0, #0x13
	str r0, [sp]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r0, #0xc0
	str r0, [sp, #0x10]
	adds r1, r5, #0
	ldr r0, [r5]
	adds r1, #0xc
	movs r2, #5
	movs r3, #0xb
	bl FUN_0201D40C
	adds r0, r5, #0
	adds r0, #0xc
	movs r1, #1
	bl ov27_0225B630
	adds r0, r5, #0
	adds r0, #0xc
	adds r1, r4, #0
	movs r2, #1
	bl ov27_0225BB38
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, [r5, #8]
	movs r1, #5
	bl FUN_02024950
	movs r0, #1
	add sp, #0x14
	str r0, [r5, #0x1c]
	pop {r4, r5, pc}
_0225BE8A:
	cmp r0, #0
	ldr r0, [r5, #8]
	beq _0225BE9A
	movs r1, #5
	bl FUN_02024950
	add sp, #0x14
	pop {r4, r5, pc}
_0225BE9A:
	movs r1, #0
	bl FUN_02024950
	adds r0, r5, #0
	bl ov27_0225BEB0
	movs r0, #0
	str r0, [r5, #0x1c]
_0225BEAA:
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov27_0225BDFC

	thumb_func_start ov27_0225BEB0
ov27_0225BEB0: @ 0x0225BEB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0225BED4
	adds r0, r4, #0
	adds r0, #0xc
	movs r1, #2
	bl ov27_0225B630
	adds r0, r4, #0
	adds r0, #0xc
	bl FUN_0201D8C8
	adds r4, #0xc
	adds r0, r4, #0
	bl FUN_0201D520
_0225BED4:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov27_0225BEB0

	thumb_func_start ov27_0225BED8
ov27_0225BED8: @ 0x0225BED8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r5, [sp, #0x44]
	adds r4, r0, #0
	str r3, [sp]
	add r0, sp, #0x28
	adds r7, r1, #0
	ldrb r1, [r0, #0x10]
	adds r6, r2, #0
	movs r2, #5
	str r1, [sp, #4]
	ldrb r0, [r0, #0x14]
	add r1, sp, #0x14
	adds r3, r6, #0
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x40]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	bl FUN_0201D40C
	add r0, sp, #0x14
	movs r1, #0
	bl FUN_0201D978
	ldr r1, _0225BF7C @ =0x000004AC
	adds r2, r7, #0
	ldr r0, [r4, r1]
	subs r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #8
	bl FUN_0200BC4C
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _0225BF48
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	add r1, sp, #0x28
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #3
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0xf
	asrs r5, r0, #0x10
_0225BF48:
	add r1, sp, #0x28
	movs r0, #0x20
	ldrsh r0, [r1, r0]
	movs r1, #0
	adds r2, r4, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225BF80 @ =0x000E0200
	adds r3, r5, #0
	str r0, [sp, #8]
	add r0, sp, #0x14
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	add r0, sp, #0x14
	bl FUN_0201D578
	add r0, sp, #0x14
	bl FUN_0201D520
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225BF7C: .4byte 0x000004AC
_0225BF80: .4byte 0x000E0200
	thumb_func_end ov27_0225BED8

	thumb_func_start ov27_0225BF84
ov27_0225BF84: @ 0x0225BF84
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r4, r1, #0
	movs r1, #0
	adds r5, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225BFC4 @ =0x000004AC
	adds r6, r2, #0
	adds r2, r3, #0
	ldr r0, [r5, r0]
	movs r3, #2
	bl FUN_0200BFCC
	movs r0, #6
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _0225BFC8 @ =0x00000186
	movs r1, #0x1f
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov27_0225BED8
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0225BFC4: .4byte 0x000004AC
_0225BFC8: .4byte 0x00000186
	thumb_func_end ov27_0225BF84

	thumb_func_start ov27_0225BFCC
ov27_0225BFCC: @ 0x0225BFCC
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r1, #0x10]
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0
	adds r2, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0225C014 @ =0x000004AC
	movs r3, #3
	ldr r0, [r4, r0]
	bl FUN_0200BFCC
	movs r0, #6
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _0225C018 @ =0x00000192
	movs r1, #0x21
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r2, #0xc
	movs r3, #0x15
	bl ov27_0225BED8
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_0225C014: .4byte 0x000004AC
_0225C018: .4byte 0x00000192
	thumb_func_end ov27_0225BFCC

	thumb_func_start ov27_0225C01C
ov27_0225C01C: @ 0x0225C01C
	push {lr}
	sub sp, #0x14
	movs r1, #9
	str r1, [sp]
	movs r2, #2
	movs r1, #0x5d
	str r2, [sp, #4]
	lsls r1, r1, #2
	str r1, [sp, #8]
	subs r1, r2, #3
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	movs r1, #0x20
	movs r2, #0xb
	movs r3, #0x15
	bl ov27_0225BED8
	add sp, #0x14
	pop {pc}
	thumb_func_end ov27_0225C01C

	thumb_func_start ov27_0225C044
ov27_0225C044: @ 0x0225C044
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_0203B9C4
	bl FUN_0203B9B8
	adds r3, r0, #0
	ldrh r3, [r3]
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0x13
	bl ov27_0225BF84
	adds r0, r4, #0
	bl ov27_0225C01C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov27_0225C044

	thumb_func_start ov27_0225C06C
ov27_0225C06C: @ 0x0225C06C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_020558BC
	adds r3, r0, #0
	movs r1, #0xe
	lsls r3, r3, #0x10
	adds r0, r4, #0
	adds r2, r1, #0
	lsrs r3, r3, #0x10
	bl ov27_0225BF84
	pop {r4, pc}
	thumb_func_end ov27_0225C06C

	thumb_func_start ov27_0225C088
ov27_0225C088: @ 0x0225C088
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	bl FUN_0206DB28
	adds r4, r0, #0
	bne _0225C09A
	bl GF_AssertFail
_0225C09A:
	adds r0, r4, #0
	bl FUN_0206DB30
	adds r3, r0, #0
	movs r1, #0xe
	ldrh r3, [r3]
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov27_0225BF84
	ldrb r0, [r4, #0x17]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _0225C0BE
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov27_0225BFCC
_0225C0BE:
	ldrb r1, [r4, #0x17]
	movs r0, #0xea
	lsls r0, r0, #2
	lsls r1, r1, #0x1f
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x1f
	bl FUN_02024830
	ldr r0, _0225C0DC @ =0x0000051A
	movs r1, #0
	strb r1, [r5, r0]
	subs r0, #0x7a
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_0225C0DC: .4byte 0x0000051A
	thumb_func_end ov27_0225C088

	thumb_func_start ov27_0225C0E0
ov27_0225C0E0: @ 0x0225C0E0
	push {r3, lr}
	ldr r1, _0225C108 @ =0x0000051C
	ldr r1, [r0, r1]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1c
	cmp r1, #1
	bne _0225C0F4
	bl ov27_0225C044
	pop {r3, pc}
_0225C0F4:
	cmp r1, #2
	bne _0225C0FE
	bl ov27_0225C088
	pop {r3, pc}
_0225C0FE:
	cmp r1, #3
	bne _0225C106
	bl ov27_0225C06C
_0225C106:
	pop {r3, pc}
	.align 2, 0
_0225C108: .4byte 0x0000051C
	thumb_func_end ov27_0225C0E0

	thumb_func_start ov27_0225C10C
ov27_0225C10C: @ 0x0225C10C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, _0225C160 @ =0x0225CFC8
	movs r4, #0
	adds r6, r5, #0
_0225C116:
	ldr r0, _0225C164 @ =0x0000051C
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1c
	lsls r0, r0, #3
	adds r0, r7, r0
	ldrb r1, [r4, r0]
	cmp r1, #0xd
	beq _0225C14C
	cmp r1, #7
	bge _0225C13A
	ldr r0, [r5, #0x10]
	bl FUN_0203C3CC
	ldr r1, _0225C168 @ =0x00000514
	adds r2, r5, r4
	strb r0, [r2, r1]
	b _0225C14C
_0225C13A:
	ldr r0, _0225C16C @ =0x0225CF94
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	adds r1, r5, r4
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x1f
	ldr r0, _0225C168 @ =0x00000514
	strb r2, [r1, r0]
_0225C14C:
	ldr r0, _0225C168 @ =0x00000514
	adds r1, r5, r4
	ldrb r1, [r1, r0]
	subs r0, #0xa4
	adds r4, r4, #1
	strb r1, [r6, r0]
	adds r6, #8
	cmp r4, #7
	blt _0225C116
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225C160: .4byte 0x0225CFC8
_0225C164: .4byte 0x0000051C
_0225C168: .4byte 0x00000514
_0225C16C: .4byte 0x0225CF94
	thumb_func_end ov27_0225C10C

	thumb_func_start ov27_0225C170
ov27_0225C170: @ 0x0225C170
	push {r3, r4, r5, lr}
	movs r4, #0
	subs r2, r1, #7
	mvns r4, r4
	cmp r2, #1
	bhi _0225C180
	adds r0, r1, #0
	pop {r3, r4, r5, pc}
_0225C180:
	adds r3, r1, #1
	movs r5, #0
	cmp r3, #0
	ble _0225C19C
	movs r1, #0x47
	lsls r1, r1, #4
_0225C18C:
	ldrb r2, [r0, r1]
	cmp r2, #0
	beq _0225C194
	adds r4, r4, #1
_0225C194:
	adds r5, r5, #1
	adds r0, #8
	cmp r5, r3
	blt _0225C18C
_0225C19C:
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0225C1A8
	bl GF_AssertFail
_0225C1A8:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov27_0225C170

	thumb_func_start ov27_0225C1AC
ov27_0225C1AC: @ 0x0225C1AC
	push {r4, r5, r6, r7}
	movs r5, #0
	movs r6, #0
	movs r2, #0x47
	mvns r5, r5
	adds r4, r6, #0
	adds r7, r0, #0
	lsls r2, r2, #4
_0225C1BC:
	ldrb r3, [r7, r2]
	cmp r3, #0
	beq _0225C1CC
	cmp r1, r6
	bne _0225C1CA
	adds r5, r4, #0
	b _0225C1D4
_0225C1CA:
	adds r6, r6, #1
_0225C1CC:
	adds r4, r4, #1
	adds r7, #8
	cmp r4, #7
	blt _0225C1BC
_0225C1D4:
	movs r1, #0
	mvns r1, r1
	cmp r5, r1
	bne _0225C1E4
	ldr r0, [r0, #0x10]
	movs r5, #0
	adds r0, #0xd3
	strb r5, [r0]
_0225C1E4:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
	thumb_func_end ov27_0225C1AC

	thumb_func_start ov27_0225C1EC
ov27_0225C1EC: @ 0x0225C1EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0225C1FA
	bl GF_AssertFail
_0225C1FA:
	ldr r0, [r4, #0x14]
	lsls r0, r0, #3
	adds r1, r4, r0
	movs r0, #0x47
	lsls r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0225C236
	movs r0, #0x47
	movs r2, #0
	adds r3, r4, #0
	lsls r0, r0, #4
_0225C212:
	ldrb r1, [r3, r0]
	cmp r1, #0
	beq _0225C22E
	ldr r0, [r4, #0x10]
	adds r0, #0xd3
	strb r2, [r0]
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	adds r1, #0xd3
	ldrb r1, [r1]
	bl ov27_0225C1AC
	str r0, [r4, #0x14]
	pop {r4, pc}
_0225C22E:
	adds r2, r2, #1
	adds r3, #8
	cmp r2, #7
	blt _0225C212
_0225C236:
	pop {r4, pc}
	thumb_func_end ov27_0225C1EC

	thumb_func_start ov27_0225C238
ov27_0225C238: @ 0x0225C238
	ldr r3, _0225C244 @ =FUN_0201AACC
	movs r1, #0xfa
	movs r0, #3
	lsls r1, r1, #2
	bx r3
	nop
_0225C244: .4byte FUN_0201AACC
	thumb_func_end ov27_0225C238

	thumb_func_start ov27_0225C248
ov27_0225C248: @ 0x0225C248
	bx lr
	.align 2, 0
	thumb_func_end ov27_0225C248

	thumb_func_start ov27_0225C24C
ov27_0225C24C: @ 0x0225C24C
	bx lr
	.align 2, 0
	thumb_func_end ov27_0225C24C

	thumb_func_start ov27_0225C250
ov27_0225C250: @ 0x0225C250
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r7, r1, #0
	movs r0, #3
	str r2, [sp]
	movs r1, #8
	lsls r2, r0, #0xf
	str r3, [sp, #4]
	bl FUN_0201A910
	movs r0, #0
	blx FUN_020CDA64
	movs r0, #0x80
	blx FUN_020CE650
	movs r0, #1
	lsls r0, r0, #8
	blx FUN_020CE6F8
	ldr r2, _0225C37C @ =0x04001000
	ldr r0, _0225C380 @ =0xFFCFFFEF
	ldr r1, [r2]
	movs r3, #0
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r2]
	ldr r2, _0225C384 @ =0x0225D370
	adds r0, r5, #0
	movs r1, #4
	bl FUN_0201B1E4
	ldr r2, _0225C388 @ =0x0225D38C
	adds r0, r5, #0
	movs r1, #5
	movs r3, #0
	bl FUN_0201B1E4
	ldr r2, _0225C38C @ =0x0225D3A8
	adds r0, r5, #0
	movs r1, #6
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	adds r3, r0, #0
	bl FUN_0201C1C4
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	movs r3, #4
	bl FUN_0201C1C4
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	movs r3, #4
	bl FUN_0201C1C4
	adds r0, r5, #0
	movs r1, #4
	bl FUN_0201CAE0
	adds r0, r5, #0
	movs r1, #5
	bl FUN_0201CAE0
	movs r1, #0xe9
	ldr r0, _0225C390 @ =ov27_0225C434
	lsls r1, r1, #2
	movs r2, #0xa
	movs r3, #8
	bl FUN_02007200
	adds r6, r0, #0
	bl FUN_0201F988
	adds r4, r0, #0
	str r6, [r4, #0x1c]
	movs r0, #0
	str r0, [r4, #0x14]
	str r5, [r4, #0x18]
	ldr r1, [sp]
	str r7, [r4, #0x20]
	str r1, [r4, #0x24]
	str r0, [r4, #0x48]
	ldr r1, [sp, #4]
	str r0, [r4]
	str r1, [r4, #4]
	movs r1, #0xe7
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r1, r1, #4
	str r0, [r4, r1]
	str r0, [r4, #0x34]
	str r0, [r4, #0x44]
	movs r0, #4
	movs r1, #8
	bl FUN_02002CEC
	ldr r1, [r4, #0x24]
	adds r0, r4, #0
	adds r1, #0xd2
	ldrb r1, [r1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	bl ov27_0225C914
	adds r0, r4, #0
	bl ov27_0225C4AC
	adds r0, r4, #0
	bl ov27_0225C72C
	adds r0, r4, #0
	movs r1, #0
	bl ov27_0225C80C
	ldr r2, _0225C37C @ =0x04001000
	ldr r0, _0225C394 @ =0xFFFF1FFF
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #1
	bl FUN_02002B8C
	adds r0, r6, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225C37C: .4byte 0x04001000
_0225C380: .4byte 0xFFCFFFEF
_0225C384: .4byte 0x0225D370
_0225C388: .4byte 0x0225D38C
_0225C38C: .4byte 0x0225D3A8
_0225C390: .4byte ov27_0225C434
_0225C394: .4byte 0xFFFF1FFF
	thumb_func_end ov27_0225C250

	thumb_func_start ov27_0225C398
ov27_0225C398: @ 0x0225C398
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	adds r0, r1, #0
	str r1, [sp, #4]
	bl FUN_0201F988
	adds r7, r0, #0
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_0200AEB0
	movs r0, #0xd6
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_0200B0A8
	movs r6, #0xd1
	movs r4, #0
	adds r5, r7, #0
	lsls r6, r6, #2
_0225C3C4:
	ldr r0, [r5, r6]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0225C3C4
	movs r0, #0x86
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_02024504
	movs r0, #0
	bl FUN_02002B8C
	adds r0, r7, #0
	bl ov27_0225C930
	movs r0, #4
	bl FUN_02002DB4
	ldr r0, [sp, #4]
	bl FUN_02007234
	ldr r0, [sp]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [sp]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [sp]
	movs r1, #4
	bl FUN_0201BB4C
	movs r0, #8
	bl FUN_0201A9C4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov27_0225C398

	thumb_func_start ov27_0225C418
ov27_0225C418: @ 0x0225C418
	movs r0, #1
	bx lr
	thumb_func_end ov27_0225C418

	thumb_func_start ov27_0225C41C
ov27_0225C41C: @ 0x0225C41C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_0201F988
	movs r1, #0xe7
	lsls r1, r1, #2
	str r5, [r0, r1]
	adds r1, r1, #4
	str r4, [r0, r1]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov27_0225C41C

	thumb_func_start ov27_0225C434
ov27_0225C434: @ 0x0225C434
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x24]
	bl FUN_02050590
	cmp r0, #0
	bne _0225C46C
	ldr r0, [r4, #0x24]
	adds r1, r0, #0
	adds r1, #0xd2
	ldrb r1, [r1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	cmp r1, #2
	bne _0225C464
	adds r1, r0, #0
	adds r1, #0xd2
	ldrb r2, [r1]
	movs r1, #0x3f
	adds r0, #0xd2
	bics r2, r1
	movs r1, #3
	orrs r1, r2
	strb r1, [r0]
_0225C464:
	ldr r0, _0225C4A4 @ =0x04001050
	movs r1, #0
	strh r1, [r0]
	b _0225C496
_0225C46C:
	ldr r1, [r4]
	adds r0, r4, #0
	lsls r2, r1, #2
	ldr r1, _0225C4A8 @ =0x0225D4D4
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #1
	bne _0225C496
	ldr r2, [r4, #0x24]
	adds r0, r2, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x3f
	adds r2, #0xd2
	bics r1, r0
	strb r1, [r2]
	movs r1, #0
	ldr r0, [r4, #0x24]
	adds r2, r1, #0
	bl FUN_021F6A9C
_0225C496:
	movs r0, #0x86
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0202457C
	pop {r4, pc}
	nop
_0225C4A4: .4byte 0x04001050
_0225C4A8: .4byte 0x0225D4D4
	thumb_func_end ov27_0225C434

	thumb_func_start ov27_0225C4AC
ov27_0225C4AC: @ 0x0225C4AC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0xef
	movs r1, #8
	bl FUN_02007688
	movs r1, #0
	ldr r2, _0225C53C @ =0x04001050
	adds r3, r1, #0
	strh r1, [r2]
	movs r2, #0xa0
	str r2, [sp]
	movs r2, #8
	str r2, [sp, #4]
	movs r2, #4
	adds r4, r0, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	adds r0, r4, #0
	movs r1, #1
	movs r3, #6
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	adds r0, r4, #0
	movs r1, #9
	movs r3, #6
	bl FUN_02007B68
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #9
	movs r2, #0
	add r3, sp, #0x10
	bl FUN_02007C2C
	ldr r3, [sp, #0x10]
	adds r6, r0, #0
	adds r2, r3, #0
	ldr r0, [r5, #0x18]
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r5, #0x18]
	movs r1, #6
	bl FUN_0201EFBC
	adds r0, r6, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0225C53C: .4byte 0x04001050
	thumb_func_end ov27_0225C4AC

	thumb_func_start ov27_0225C540
ov27_0225C540: @ 0x0225C540
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0xef
	movs r1, #8
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	ldr r2, [r5, #0x18]
	movs r1, #1
	movs r3, #4
	adds r4, r0, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	adds r0, r4, #0
	movs r1, #0xa
	movs r3, #4
	bl FUN_02007B68
	adds r0, r4, #0
	bl FUN_0200770C
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r0, #0x80
	str r0, [sp, #0x10]
	adds r1, r5, #0
	ldr r0, [r5, #0x18]
	adds r1, #0x28
	movs r2, #5
	movs r3, #0xc
	bl FUN_0201D40C
	movs r0, #0xe
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r0, #0x90
	str r0, [sp, #0x10]
	adds r1, r5, #0
	ldr r0, [r5, #0x18]
	adds r1, #0x38
	movs r2, #5
	movs r3, #0xc
	bl FUN_0201D40C
	adds r0, r5, #0
	ldr r1, [r5, #0x4c]
	adds r0, #0x28
	movs r2, #0x2e
	bl ov27_0225C8D0
	adds r0, r5, #0
	ldr r1, [r5, #0x4c]
	adds r0, #0x38
	movs r2, #0x2f
	bl ov27_0225C8D0
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov27_0225C540

	thumb_func_start ov27_0225C5E4
ov27_0225C5E4: @ 0x0225C5E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r0, [r4, #0x18]
	movs r1, #5
	bl FUN_0201CAE0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0225C606
	adds r0, r4, #0
	adds r0, #0x28
	bl FUN_0201D520
_0225C606:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0225C614
	adds r4, #0x38
	adds r0, r4, #0
	bl FUN_0201D520
_0225C614:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov27_0225C5E4

	thumb_func_start ov27_0225C618
ov27_0225C618: @ 0x0225C618
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_021EEF58
	adds r7, r0, #0
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_021EEF60
	adds r6, r0, #0
	movs r0, #0xef
	movs r1, #8
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	movs r1, #1
	ldr r2, [r2, #0x18]
	movs r3, #4
	adds r4, r0, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, r4, #0
	ldr r2, [r2, #0x18]
	adds r1, r6, #0
	movs r3, #4
	bl FUN_02007B68
	adds r0, r4, #0
	bl FUN_0200770C
	movs r0, #0
	str r0, [sp, #0x14]
	cmp r6, #0
	ble _0225C6A6
	adds r4, r0, #0
	ldr r5, [sp, #0x10]
	subs r0, r6, #2
	lsls r0, r0, #2
	adds r5, #0x54
	str r0, [sp, #0x18]
_0225C686:
	ldr r3, _0225C6F0 @ =0x0225D4B8
	ldr r2, [sp, #0x18]
	ldr r0, [sp, #0x10]
	ldr r2, [r3, r2]
	ldr r0, [r0, #0x18]
	adds r1, r5, #0
	adds r2, r2, r4
	bl FUN_0201D4F8
	ldr r0, [sp, #0x14]
	adds r4, #8
	adds r0, r0, #1
	adds r5, #0x10
	str r0, [sp, #0x14]
	cmp r0, r6
	blt _0225C686
_0225C6A6:
	movs r5, #0
	cmp r6, #0
	ble _0225C6E4
	ldr r4, [sp, #0x10]
	adds r4, #0x54
_0225C6B0:
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225C6F4 @ =0x00020100
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r7]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r5, r5, #1
	adds r4, #0x10
	adds r7, #8
	cmp r5, r6
	blt _0225C6B0
_0225C6E4:
	movs r1, #0x85
	ldr r0, [sp, #0x10]
	lsls r1, r1, #2
	str r6, [r0, r1]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225C6F0: .4byte 0x0225D4B8
_0225C6F4: .4byte 0x00020100
	thumb_func_end ov27_0225C618

	thumb_func_start ov27_0225C6F8
ov27_0225C6F8: @ 0x0225C6F8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_021EEF60
	adds r6, r0, #0
	ldr r0, [r5, #0x18]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r0, [r5, #0x18]
	movs r1, #5
	bl FUN_0201CAE0
	movs r4, #0
	cmp r6, #0
	ble _0225C72A
	adds r5, #0x54
_0225C71C:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, r6
	blt _0225C71C
_0225C72A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov27_0225C6F8

	thumb_func_start ov27_0225C72C
ov27_0225C72C: @ 0x0225C72C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r1, #0x87
	adds r6, r0, #0
	lsls r1, r1, #2
	movs r0, #0x15
	adds r1, r6, r1
	movs r2, #8
	bl FUN_02009F40
	movs r1, #0x86
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r0, r1, #4
	movs r2, #1
	adds r0, r6, r0
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r7, #0xd1
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_0225C75C:
	movs r0, #0xa
	adds r1, r4, #0
	movs r2, #8
	bl FUN_0200A090
	str r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0225C75C
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	movs r0, #0xd1
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0xef
	movs r2, #0xc
	movs r3, #0
	bl FUN_0200A1D8
	movs r1, #0xd5
	lsls r1, r1, #2
	str r0, [r6, r1]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #8
	subs r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r6, r1]
	movs r1, #0xef
	movs r2, #0xb
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0xd6
	lsls r1, r1, #2
	str r0, [r6, r1]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #8
	subs r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	movs r1, #0xef
	movs r2, #0xd
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0xd7
	lsls r1, r1, #2
	str r0, [r6, r1]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #8
	subs r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	movs r1, #0xef
	movs r2, #0xe
	movs r3, #0
	bl FUN_0200A294
	movs r1, #0x36
	lsls r1, r1, #4
	str r0, [r6, r1]
	subs r1, #0xc
	ldr r0, [r6, r1]
	bl FUN_0200ADA4
	movs r0, #0xd6
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200B00C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov27_0225C72C

	thumb_func_start ov27_0225C80C
ov27_0225C80C: @ 0x0225C80C
	push {r4, r5, lr}
	sub sp, #0x5c
	adds r4, r1, #0
	movs r1, #0xa
	adds r5, r0, #0
	adds r0, r1, #0
	str r1, [sp]
	subs r0, #0xb
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	movs r0, #0xd1
	str r2, [sp, #0x10]
	lsls r0, r0, #2
	ldr r3, [r5, r0]
	str r3, [sp, #0x14]
	adds r3, r0, #4
	ldr r3, [r5, r3]
	str r3, [sp, #0x18]
	adds r3, r0, #0
	adds r3, #8
	ldr r3, [r5, r3]
	str r3, [sp, #0x1c]
	adds r3, r0, #0
	adds r3, #0xc
	ldr r3, [r5, r3]
	adds r0, #0x20
	str r3, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	adds r0, r5, r0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02009D48
	movs r0, #0x86
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0225C8C8 @ =0x0225D118
	lsls r2, r4, #2
	ldrh r1, [r1, r2]
	str r0, [sp, #0x2c]
	movs r0, #0xd9
	lsls r1, r1, #0xc
	str r1, [sp, #0x34]
	ldr r1, _0225C8CC @ =0x0225D11A
	lsls r0, r0, #2
	ldrh r2, [r1, r2]
	movs r1, #1
	lsls r1, r1, #8
	adds r2, r2, r1
	lsls r1, r1, #4
	adds r0, r5, r0
	str r0, [sp, #0x30]
	movs r0, #0
	lsls r2, r2, #0xc
	str r0, [sp, #0x3c]
	str r2, [sp, #0x38]
	str r1, [sp, #0x40]
	str r1, [sp, #0x44]
	str r1, [sp, #0x48]
	add r1, sp, #0x2c
	strh r0, [r1, #0x20]
	movs r0, #1
	str r0, [sp, #0x50]
	movs r0, #2
	str r0, [sp, #0x54]
	movs r0, #8
	str r0, [sp, #0x58]
	add r0, sp, #0x2c
	bl FUN_02024624
	movs r1, #0xe2
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #1
	bl FUN_020248F0
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	add sp, #0x5c
	pop {r4, r5, pc}
	.align 2, 0
_0225C8C8: .4byte 0x0225D118
_0225C8CC: .4byte 0x0225D11A
	thumb_func_end ov27_0225C80C

	thumb_func_start ov27_0225C8D0
ov27_0225C8D0: @ 0x0225C8D0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225C910 @ =0x00020100
	movs r1, #4
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r4, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225C910: .4byte 0x00020100
	thumb_func_end ov27_0225C8D0

	thumb_func_start ov27_0225C914
ov27_0225C914: @ 0x0225C914
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	bl FUN_0200BD08
	str r0, [r4, #0x50]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xbf
	movs r3, #8
	bl FUN_0200BAF8
	str r0, [r4, #0x4c]
	pop {r4, pc}
	thumb_func_end ov27_0225C914

	thumb_func_start ov27_0225C930
ov27_0225C930: @ 0x0225C930
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl FUN_0200BB44
	ldr r0, [r4, #0x50]
	bl FUN_0200BDA0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov27_0225C930

	thumb_func_start ov27_0225C944
ov27_0225C944: @ 0x0225C944
	movs r1, #1
	str r1, [r0]
	movs r0, #0
	bx lr
	thumb_func_end ov27_0225C944

	thumb_func_start ov27_0225C94C
ov27_0225C94C: @ 0x0225C94C
	push {r4, lr}
	movs r1, #0xe5
	adds r4, r0, #0
	movs r2, #0
	lsls r1, r1, #2
	str r2, [r4, r1]
	bl ov27_0225C540
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r1, #0xe5
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov27_0225CCE0
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_020248F0
	movs r0, #4
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov27_0225C94C

	thumb_func_start ov27_0225C988
ov27_0225C988: @ 0x0225C988
	push {r3, lr}
	bl ov27_0225CD94
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov27_0225C988

	thumb_func_start ov27_0225C994
ov27_0225C994: @ 0x0225C994
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024B68
	cmp r0, #0
	bne _0225C9C6
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	bl ov27_0225C5E4
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	ldr r0, [r4, #4]
	strh r1, [r0]
	movs r0, #6
	str r0, [r4]
_0225C9C6:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov27_0225C994

	thumb_func_start ov27_0225C9CC
ov27_0225C9CC: @ 0x0225C9CC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov27_0225C9CC

	thumb_func_start ov27_0225C9E4
ov27_0225C9E4: @ 0x0225C9E4
	ldr r1, [r0, #0x10]
	adds r1, r1, #1
	str r1, [r0, #0x10]
	cmp r1, #0x14
	ble _0225C9F2
	movs r0, #1
	bx lr
_0225C9F2:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov27_0225C9E4

	thumb_func_start ov27_0225C9F8
ov27_0225C9F8: @ 0x0225C9F8
	ldr r0, _0225CA0C @ =0x021D114C
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	beq _0225CA06
	ldr r0, _0225CA10 @ =0x021D110C
	movs r1, #1
	str r1, [r0, #0x5c]
_0225CA06:
	movs r0, #0
	bx lr
	nop
_0225CA0C: .4byte 0x021D114C
_0225CA10: .4byte 0x021D110C
	thumb_func_end ov27_0225C9F8

	thumb_func_start ov27_0225CA14
ov27_0225CA14: @ 0x0225CA14
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #8
	str r1, [r4]
	movs r1, #0xe5
	movs r2, #0
	lsls r1, r1, #2
	str r2, [r4, r1]
	bl ov27_0225C618
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r1, #0x85
	movs r2, #0xe5
	lsls r1, r1, #2
	lsls r2, r2, #2
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r0, r4, #0
	bl ov27_0225CD18
	movs r1, #0xe7
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225CA5A
	adds r0, r1, #4
	subs r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	blx r2
_0225CA5A:
	ldr r1, _0225CA64 @ =0x0000EEEE
	ldr r0, [r4, #4]
	strh r1, [r0]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0225CA64: .4byte 0x0000EEEE
	thumb_func_end ov27_0225CA14

	thumb_func_start ov27_0225CA68
ov27_0225CA68: @ 0x0225CA68
	push {r3, r4}
	subs r1, r1, #2
	lsls r4, r1, #2
	ldr r1, _0225CA94 @ =0x0225D480
	ldr r3, [r0]
	ldr r4, [r1, r4]
	lsls r1, r3, #2
	adds r1, r4, r1
	ldrsb r2, [r2, r1]
	movs r1, #0
	mvns r1, r1
	cmp r2, r1
	beq _0225CA86
	cmp r3, r2
	bne _0225CA8C
_0225CA86:
	movs r0, #0
	pop {r3, r4}
	bx lr
_0225CA8C:
	str r2, [r0]
	movs r0, #1
	pop {r3, r4}
	bx lr
	.align 2, 0
_0225CA94: .4byte 0x0225D480
	thumb_func_end ov27_0225CA68

	thumb_func_start ov27_0225CA98
ov27_0225CA98: @ 0x0225CA98
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x85
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	subs r0, r0, #2
	lsls r1, r0, #2
	ldr r0, _0225CC84 @ =0x0225D49C
	ldr r0, [r0, r1]
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0225CAF6
	movs r2, #0xe5
	lsls r2, r2, #2
	str r0, [r4, r2]
	movs r1, #0x85
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r0, r4, #0
	bl ov27_0225CD18
	ldr r0, _0225CC88 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #9
	movs r1, #0x85
	str r0, [r4]
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov27_0225CD74
	movs r1, #0xe7
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225CB60
	adds r0, r1, #4
	subs r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	blx r2
	b _0225CC80
_0225CAF6:
	ldr r0, _0225CC8C @ =0x021D110C
	movs r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _0225CB44
	movs r1, #0x85
	movs r0, #0xe5
	lsls r1, r1, #2
	lsls r0, r0, #2
	ldr r1, [r4, r1]
	adds r0, r4, r0
	movs r2, #0
	bl ov27_0225CA68
	cmp r0, #0
	beq _0225CB60
	movs r1, #0x85
	movs r2, #0xe5
	lsls r1, r1, #2
	lsls r2, r2, #2
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r0, r4, #0
	bl ov27_0225CD18
	ldr r0, _0225CC88 @ =0x000005DC
	bl FUN_0200604C
	movs r1, #0xe7
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225CB60
	adds r0, r1, #4
	subs r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	blx r2
	b _0225CC80
_0225CB44:
	movs r1, #0x80
	tst r1, r0
	beq _0225CB90
	movs r1, #0x85
	movs r0, #0xe5
	lsls r1, r1, #2
	lsls r0, r0, #2
	ldr r1, [r4, r1]
	adds r0, r4, r0
	movs r2, #1
	bl ov27_0225CA68
	cmp r0, #0
	bne _0225CB62
_0225CB60:
	b _0225CC80
_0225CB62:
	movs r1, #0x85
	movs r2, #0xe5
	lsls r1, r1, #2
	lsls r2, r2, #2
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r0, r4, #0
	bl ov27_0225CD18
	ldr r0, _0225CC88 @ =0x000005DC
	bl FUN_0200604C
	movs r1, #0xe7
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225CC80
	adds r0, r1, #4
	subs r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	blx r2
	b _0225CC80
_0225CB90:
	movs r1, #0x20
	tst r1, r0
	beq _0225CBDA
	movs r1, #0x85
	movs r0, #0xe5
	lsls r1, r1, #2
	lsls r0, r0, #2
	ldr r1, [r4, r1]
	adds r0, r4, r0
	movs r2, #2
	bl ov27_0225CA68
	cmp r0, #0
	beq _0225CC80
	movs r1, #0x85
	movs r2, #0xe5
	lsls r1, r1, #2
	lsls r2, r2, #2
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r0, r4, #0
	bl ov27_0225CD18
	ldr r0, _0225CC88 @ =0x000005DC
	bl FUN_0200604C
	movs r1, #0xe7
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225CC80
	adds r0, r1, #4
	subs r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	blx r2
	b _0225CC80
_0225CBDA:
	movs r1, #0x10
	tst r1, r0
	beq _0225CC24
	movs r1, #0x85
	movs r0, #0xe5
	lsls r1, r1, #2
	lsls r0, r0, #2
	ldr r1, [r4, r1]
	adds r0, r4, r0
	movs r2, #3
	bl ov27_0225CA68
	cmp r0, #0
	beq _0225CC80
	movs r1, #0x85
	movs r2, #0xe5
	lsls r1, r1, #2
	lsls r2, r2, #2
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r0, r4, #0
	bl ov27_0225CD18
	ldr r0, _0225CC88 @ =0x000005DC
	bl FUN_0200604C
	movs r1, #0xe7
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225CC80
	adds r0, r1, #4
	subs r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	blx r2
	b _0225CC80
_0225CC24:
	movs r1, #1
	tst r1, r0
	beq _0225CC42
	movs r1, #0x85
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov27_0225CD74
	movs r0, #9
	str r0, [r4]
	ldr r0, _0225CC88 @ =0x000005DC
	bl FUN_0200604C
	b _0225CC80
_0225CC42:
	movs r1, #2
	tst r0, r1
	beq _0225CC80
	ldr r0, [r4, #0xc]
	bl FUN_021EF00C
	cmp r0, #0
	beq _0225CC80
	movs r1, #0x85
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	movs r2, #0xe5
	subs r0, r0, #1
	lsls r2, r2, #2
	str r0, [r4, r2]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r0, r4, #0
	bl ov27_0225CD18
	movs r1, #0x85
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov27_0225CD74
	movs r0, #9
	str r0, [r4]
	ldr r0, _0225CC88 @ =0x000005DC
	bl FUN_0200604C
_0225CC80:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0225CC84: .4byte 0x0225D49C
_0225CC88: .4byte 0x000005DC
_0225CC8C: .4byte 0x021D110C
	thumb_func_end ov27_0225CA98

	thumb_func_start ov27_0225CC90
ov27_0225CC90: @ 0x0225CC90
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024B68
	cmp r0, #0
	bne _0225CCB8
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	bl ov27_0225C6F8
	movs r0, #0xa
	str r0, [r4]
_0225CCB8:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov27_0225CC90

	thumb_func_start ov27_0225CCBC
ov27_0225CCBC: @ 0x0225CCBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_021EEF58
	movs r1, #0xe5
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r4, #4]
	strh r1, [r0]
	movs r0, #1
	str r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov27_0225CCBC

	thumb_func_start ov27_0225CCE0
ov27_0225CCE0: @ 0x0225CCE0
	push {lr}
	sub sp, #0xc
	lsls r2, r1, #2
	ldr r1, _0225CD10 @ =0x0225D118
	ldrh r1, [r1, r2]
	lsls r1, r1, #0xc
	str r1, [sp]
	ldr r1, _0225CD14 @ =0x0225D11A
	ldrh r2, [r1, r2]
	movs r1, #1
	lsls r1, r1, #8
	adds r1, r2, r1
	lsls r1, r1, #0xc
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #0xe2
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {pc}
	.align 2, 0
_0225CD10: .4byte 0x0225D118
_0225CD14: .4byte 0x0225D11A
	thumb_func_end ov27_0225CCE0

	thumb_func_start ov27_0225CD18
ov27_0225CD18: @ 0x0225CD18
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r0, r2, #1
	subs r3, r1, #2
	adds r2, r2, r0
	adds r1, r3, #0
	movs r0, #0x18
	muls r1, r0, r1
	ldr r3, _0225CD68 @ =0x0225D3C4
	adds r0, #0xe8
	adds r3, r3, r1
	ldrb r3, [r2, r3]
	lsls r3, r3, #0xc
	str r3, [sp]
	ldr r3, _0225CD6C @ =0x0225D3C5
	adds r3, r3, r1
	ldrb r3, [r2, r3]
	adds r0, r3, r0
	lsls r0, r0, #0xc
	ldr r3, _0225CD70 @ =0x0225D3C6
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0xe2
	adds r1, r3, r1
	lsls r0, r0, #2
	ldrb r1, [r2, r1]
	ldr r0, [r4, r0]
	bl FUN_020248F0
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0225CD68: .4byte 0x0225D3C4
_0225CD6C: .4byte 0x0225D3C5
_0225CD70: .4byte 0x0225D3C6
	thumb_func_end ov27_0225CD18

	thumb_func_start ov27_0225CD74
ov27_0225CD74: @ 0x0225CD74
	movs r2, #0xe2
	lsls r2, r2, #2
	ldr r0, [r0, r2]
	subs r2, r1, #2
	movs r1, #0x18
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _0225CD8C @ =0x0225D3C6
	ldrb r1, [r1, r3]
	ldr r3, _0225CD90 @ =FUN_020248F0
	adds r1, r1, #2
	bx r3
	.align 2, 0
_0225CD8C: .4byte 0x0225D3C6
_0225CD90: .4byte FUN_020248F0
	thumb_func_end ov27_0225CD74

	thumb_func_start ov27_0225CD94
ov27_0225CD94: @ 0x0225CD94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0225CEA0 @ =0x0225D120
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0225CDFE
	cmp r0, #0
	bne _0225CDD2
	movs r1, #0xe5
	movs r0, #0
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov27_0225CCE0
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_020248F0
	ldr r0, _0225CEA4 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #5
	str r0, [r4]
	b _0225CE9C
_0225CDD2:
	cmp r0, #1
	bne _0225CE9C
	movs r1, #0xe5
	movs r0, #1
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov27_0225CCE0
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_020248F0
	ldr r0, _0225CEA4 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #5
	str r0, [r4]
	b _0225CE9C
_0225CDFE:
	ldr r0, _0225CEA8 @ =0x021D110C
	movs r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _0225CE2A
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0225CE18
	ldr r0, _0225CEA4 @ =0x000005DC
	bl FUN_0200604C
_0225CE18:
	movs r1, #0xe5
	movs r0, #0
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov27_0225CCE0
	b _0225CE9C
_0225CE2A:
	movs r1, #0x80
	tst r1, r0
	beq _0225CE52
	movs r0, #0xe5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225CE40
	ldr r0, _0225CEA4 @ =0x000005DC
	bl FUN_0200604C
_0225CE40:
	movs r1, #0xe5
	movs r0, #1
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov27_0225CCE0
	b _0225CE9C
_0225CE52:
	movs r2, #1
	adds r1, r0, #0
	tst r1, r2
	beq _0225CE72
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_020248F0
	movs r0, #5
	str r0, [r4]
	ldr r0, _0225CEA4 @ =0x000005DC
	bl FUN_0200604C
	b _0225CE9C
_0225CE72:
	movs r1, #2
	tst r0, r1
	beq _0225CE9C
	movs r1, #0xe5
	lsls r1, r1, #2
	str r2, [r4, r1]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov27_0225CCE0
	movs r0, #0xe2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_020248F0
	ldr r0, _0225CEA4 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #5
	str r0, [r4]
_0225CE9C:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0225CEA0: .4byte 0x0225D120
_0225CEA4: .4byte 0x000005DC
_0225CEA8: .4byte 0x021D110C
	thumb_func_end ov27_0225CD94

	thumb_func_start ov27_0225CEAC
ov27_0225CEAC: @ 0x0225CEAC
	push {r4, lr}
	adds r4, r0, #0
	bl ov27_0225C5E4
	adds r0, r4, #0
	bl ov27_0225C9CC
	pop {r4, pc}
	thumb_func_end ov27_0225CEAC

	.rodata

_0225CEBC:
	.byte 0x07, 0x04, 0x02, 0x05
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0x07, 0x0E, 0x00, 0x03, 0x04, 0x05, 0x00, 0x56, 0x86, 0xB8, 0xFC
	.byte 0x90, 0xBC, 0xA8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x04, 0x00
	.byte 0x02, 0x00, 0x03, 0x00, 0x04, 0x00, 0x03, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x05, 0x00
	.byte 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x04, 0x00, 0x06, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00
	.byte 0x65, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x10, 0x08, 0xA0, 0x16, 0x36, 0x10, 0x4C
	.byte 0x3E, 0x5E, 0x10, 0x4C, 0x66, 0x86, 0x10, 0x4C, 0x8E, 0xAE, 0x10, 0x4C, 0x16, 0x36, 0x60, 0x9C
	.byte 0x3E, 0x5E, 0x60, 0x9C, 0x66, 0x86, 0x60, 0x9C, 0x08, 0x27, 0xCB, 0xFF, 0x2E, 0x4D, 0xCB, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x80, 0x15, 0x00, 0x01, 0x80, 0x18, 0x00, 0x02, 0x80
	.byte 0x1E, 0x00, 0x0E, 0x80, 0x21, 0x00, 0x03, 0x80, 0x24, 0x00, 0x04, 0x80, 0x27, 0x00, 0x05, 0x80
	.byte 0x2A, 0x00, 0x08, 0x80, 0x12, 0x00, 0x20, 0x00, 0x12, 0x00, 0x20, 0x00, 0xFF, 0xFF, 0x20, 0x00
	.byte 0x2D, 0x00, 0x22, 0x80, 0x30, 0x00, 0x23, 0x80, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x0D
	.byte 0x07, 0x00, 0x01, 0x02, 0x03, 0x04, 0x06, 0x08, 0x07, 0x00, 0x01, 0x03, 0x04, 0x06, 0x0A, 0x0D
	.byte 0x07, 0x00, 0x01, 0x03, 0x04, 0x06, 0x09, 0x0D, 0x0B, 0x00, 0x01, 0x02, 0x0C, 0x04, 0x06, 0x0D
	.byte 0x01, 0x02, 0x04, 0x06, 0x0D, 0x0D, 0x0D, 0x0D, 0x01, 0x04, 0x06, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0D, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x16, 0x00, 0x18, 0x00, 0x3E, 0x00
	.byte 0x18, 0x00, 0x66, 0x00, 0x18, 0x00, 0x8E, 0x00, 0x68, 0x00, 0x16, 0x00, 0x68, 0x00, 0x3E, 0x00
	.byte 0x68, 0x00, 0x66, 0x00, 0xDC, 0x00, 0x0B, 0x00, 0xDC, 0x00, 0x33, 0x00, 0xC8, 0x00, 0x08, 0x00
	.byte 0xC8, 0x00, 0x30, 0x00, 0xB8, 0x00, 0x56, 0x00, 0xA8, 0x00, 0x90, 0x00, 0xD2, 0x00, 0x5E, 0x00
	.byte 0x36, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x00, 0x00, 0x03, 0x02, 0x01, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x04, 0x00, 0x00
	.byte 0x00, 0x03, 0x02, 0x02, 0x03, 0x00, 0x05, 0x01, 0x00, 0x05, 0x01, 0x00, 0x01, 0x00, 0x03, 0x03
	.byte 0x00, 0x01, 0x06, 0x02, 0x00, 0x06, 0x02, 0x00, 0x02, 0x01, 0x00, 0x00, 0x01, 0x02, 0x06, 0x03
	.byte 0x00, 0x06, 0x03, 0x00, 0x06, 0x05, 0x04, 0x05, 0x06, 0x04, 0x00, 0x04, 0x00, 0x00, 0x04, 0x00
	.byte 0x04, 0x06, 0x05, 0x06, 0x04, 0x05, 0x01, 0x05, 0x00, 0x01, 0x05, 0x00, 0x05, 0x04, 0x06, 0x04
	.byte 0x05, 0x06, 0x02, 0x06, 0x00, 0x02, 0x06, 0x00, 0x01, 0x00, 0x01, 0x03, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0xFF, 0xFF, 0x00, 0x01, 0xFF, 0xFF, 0x80, 0x00, 0x48, 0x00, 0x80, 0x00, 0x78, 0x00
	.byte 0x32, 0x5C, 0x03, 0xFB, 0x63, 0x8C, 0x03, 0xFB, 0xFF, 0x00, 0x00, 0x00, 0x32, 0x5C, 0x03, 0xFB
	.byte 0x63, 0x8C, 0x03, 0xFB, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01, 0xFF, 0xFF, 0x00, 0x02, 0xFF, 0xFF
	.byte 0x01, 0x02, 0xFF, 0xFF, 0x00, 0x01, 0xFF, 0xFF, 0x00, 0x02, 0xFF, 0xFF, 0x01, 0x03, 0xFF, 0xFF
	.byte 0x02, 0x03, 0xFF, 0xFF, 0x1B, 0x44, 0x03, 0xFB, 0x4A, 0x73, 0x03, 0xFB, 0x7B, 0xA4, 0x03, 0xFB
	.byte 0xFF, 0x00, 0x00, 0x00, 0x05, 0x02, 0x08, 0x1C, 0x02, 0x04, 0x80, 0x00, 0x05, 0x02, 0x0E, 0x1C
	.byte 0x02, 0x04, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x01, 0x01, 0x03, 0x00, 0x01, 0x00, 0x04, 0x02, 0x03
	.byte 0x01, 0x04, 0x02, 0x03, 0x03, 0x04, 0xFF, 0xFF, 0x02, 0x2B, 0x03, 0xFB, 0x34, 0x5C, 0x03, 0xFB
	.byte 0x63, 0x8C, 0x03, 0xFB, 0x94, 0xBC, 0x03, 0xFB, 0xFF, 0x00, 0x00, 0x00, 0x19, 0x44, 0x03, 0x7B
	.byte 0x19, 0x44, 0x83, 0xFC, 0x4B, 0x73, 0x03, 0x7B, 0x4B, 0x73, 0x83, 0xFC, 0x7B, 0xA3, 0x83, 0xFC
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x04, 0x02, 0x03
	.byte 0x01, 0x05, 0x02, 0x03, 0x02, 0x04, 0x04, 0x05, 0x03, 0x05, 0x04, 0x05, 0x05, 0x02, 0x05, 0x1C
	.byte 0x02, 0x04, 0x80, 0x00, 0x05, 0x02, 0x0B, 0x1C, 0x02, 0x04, 0xB8, 0x00, 0x05, 0x02, 0x11, 0x1C
	.byte 0x02, 0x04, 0xF0, 0x00, 0x19, 0x44, 0x03, 0x7B, 0x19, 0x44, 0x83, 0xFC, 0x4B, 0x73, 0x03, 0x7B
	.byte 0x4B, 0x73, 0x83, 0xFC, 0x7B, 0xA3, 0x03, 0x7B, 0x7B, 0xA3, 0x83, 0xFC, 0xFF, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x01, 0x01, 0x03, 0x00, 0x01, 0x00, 0x04, 0x02, 0x03, 0x01, 0x05, 0x02, 0x03
	.byte 0x02, 0x06, 0x04, 0x05, 0x03, 0x06, 0x04, 0x05, 0x05, 0x06, 0xFF, 0xFF, 0x03, 0x2C, 0x03, 0x7B
	.byte 0x03, 0x2C, 0x83, 0xFC, 0x33, 0x5B, 0x03, 0x7B, 0x33, 0x5B, 0x83, 0xFC, 0x64, 0x8B, 0x03, 0x7B
	.byte 0x64, 0x8B, 0x83, 0xFC, 0x93, 0xBC, 0x83, 0xFC, 0xFF, 0x00, 0x00, 0x00, 0x05, 0x02, 0x02, 0x1C
	.byte 0x02, 0x04, 0x80, 0x00, 0x05, 0x02, 0x08, 0x1C, 0x02, 0x04, 0xB8, 0x00, 0x05, 0x02, 0x0E, 0x1C
	.byte 0x02, 0x04, 0xF0, 0x00, 0x05, 0x02, 0x14, 0x1C, 0x02, 0x04, 0x28, 0x01, 0x00, 0x02, 0x00, 0x01
	.byte 0x00, 0x03, 0x00, 0x01, 0x00, 0x04, 0x02, 0x03, 0x01, 0x05, 0x02, 0x03, 0x02, 0x06, 0x04, 0x05
	.byte 0x03, 0x07, 0x04, 0x05, 0x04, 0x06, 0x06, 0x07, 0x05, 0x07, 0x06, 0x07, 0x03, 0x2C, 0x03, 0x7B
	.byte 0x03, 0x2C, 0x83, 0xFC, 0x33, 0x5B, 0x03, 0x7B, 0x33, 0x5B, 0x83, 0xFC, 0x64, 0x8B, 0x03, 0x7B
	.byte 0x64, 0x8B, 0x83, 0xFC, 0x93, 0xBC, 0x03, 0x7B, 0x93, 0xBC, 0x83, 0xFC, 0xFF, 0x00, 0x00, 0x00
	.byte 0x05, 0x02, 0x04, 0x0D, 0x04, 0x04, 0x80, 0x00, 0x05, 0x12, 0x04, 0x0D, 0x04, 0x04, 0xB4, 0x00
	.byte 0x05, 0x02, 0x0A, 0x0D, 0x04, 0x04, 0xE8, 0x00, 0x05, 0x12, 0x0A, 0x0D, 0x04, 0x04, 0x1C, 0x01
	.byte 0x05, 0x12, 0x10, 0x0D, 0x04, 0x04, 0x50, 0x01, 0x05, 0x02, 0x04, 0x0C, 0x04, 0x04, 0x80, 0x00
	.byte 0x05, 0x12, 0x04, 0x0C, 0x04, 0x04, 0xB0, 0x00, 0x05, 0x02, 0x0A, 0x0C, 0x04, 0x04, 0xE0, 0x00
	.byte 0x05, 0x12, 0x0A, 0x0C, 0x04, 0x04, 0x10, 0x01, 0x05, 0x02, 0x10, 0x0C, 0x04, 0x04, 0x40, 0x01
	.byte 0x05, 0x12, 0x10, 0x0C, 0x04, 0x04, 0x70, 0x01, 0x05, 0x02, 0x01, 0x0C, 0x04, 0x04, 0x80, 0x00
	.byte 0x05, 0x12, 0x01, 0x0C, 0x04, 0x04, 0xB0, 0x00, 0x05, 0x02, 0x07, 0x0C, 0x04, 0x04, 0xE0, 0x00
	.byte 0x05, 0x12, 0x07, 0x0C, 0x04, 0x04, 0x10, 0x01, 0x05, 0x02, 0x0D, 0x0C, 0x04, 0x04, 0x40, 0x01
	.byte 0x05, 0x12, 0x0D, 0x0C, 0x04, 0x04, 0x70, 0x01, 0x05, 0x12, 0x13, 0x0C, 0x04, 0x04, 0xA0, 0x01
	.byte 0x05, 0x02, 0x01, 0x0C, 0x04, 0x04, 0x80, 0x00, 0x05, 0x12, 0x01, 0x0C, 0x04, 0x04, 0xB0, 0x00
	.byte 0x05, 0x02, 0x07, 0x0C, 0x04, 0x04, 0xE0, 0x00, 0x05, 0x12, 0x07, 0x0C, 0x04, 0x04, 0x10, 0x01
	.byte 0x05, 0x02, 0x0D, 0x0C, 0x04, 0x04, 0x40, 0x01, 0x05, 0x12, 0x0D, 0x0C, 0x04, 0x04, 0x70, 0x01
	.byte 0x05, 0x02, 0x13, 0x0C, 0x04, 0x04, 0xA0, 0x01, 0x05, 0x12, 0x13, 0x0C, 0x04, 0x04, 0xD0, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0C, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x48, 0x01, 0x80, 0x78, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x30, 0x01, 0x80
	.byte 0x60, 0x01, 0x80, 0x90, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x18, 0x01, 0x80, 0x48, 0x01, 0x80, 0x78, 0x01, 0x80, 0xA8, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x30, 0x00, 0xC0
	.byte 0x30, 0x00, 0x40, 0x60, 0x00, 0xC0, 0x60, 0x00, 0xC0, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x30, 0x00, 0xC0, 0x30, 0x00, 0x40, 0x60, 0x00, 0xC0, 0x60, 0x00
	.byte 0x40, 0x90, 0x00, 0xC0, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x18, 0x00, 0xC0
	.byte 0x18, 0x00, 0x40, 0x48, 0x00, 0xC0, 0x48, 0x00, 0x40, 0x78, 0x00, 0xC0, 0x78, 0x00, 0xC0, 0xA8
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x18, 0x00, 0xC0, 0x18, 0x00, 0x40, 0x48, 0x00, 0xC0, 0x48, 0x00
	.byte 0x40, 0x78, 0x00, 0xC0, 0x78, 0x00, 0x40, 0xA8, 0x00, 0xC0, 0xA8, 0x00

	.data

_0225D480:
	.byte 0x10, 0xD1, 0x25, 0x02, 0x38, 0xD1, 0x25, 0x02, 0x44, 0xD1, 0x25, 0x02, 0x74, 0xD1, 0x25, 0x02
	.byte 0xB4, 0xD1, 0x25, 0x02, 0x00, 0xD2, 0x25, 0x02, 0x5C, 0xD2, 0x25, 0x02, 0x2C, 0xD1, 0x25, 0x02
	.byte 0x54, 0xD1, 0x25, 0x02, 0x88, 0xD1, 0x25, 0x02, 0x9C, 0xD1, 0x25, 0x02, 0xE4, 0xD1, 0x25, 0x02
	.byte 0x1C, 0xD2, 0x25, 0x02, 0x7C, 0xD2, 0x25, 0x02, 0x64, 0xD1, 0x25, 0x02, 0xCC, 0xD1, 0x25, 0x02
	.byte 0x3C, 0xD2, 0x25, 0x02, 0xA0, 0xD2, 0x25, 0x02, 0xC8, 0xD2, 0x25, 0x02, 0xF8, 0xD2, 0x25, 0x02
	.byte 0x30, 0xD3, 0x25, 0x02, 0x45, 0xC9, 0x25, 0x02, 0xF9, 0xC9, 0x25, 0x02, 0xE5, 0xC9, 0x25, 0x02
	.byte 0x4D, 0xC9, 0x25, 0x02, 0x89, 0xC9, 0x25, 0x02, 0x95, 0xC9, 0x25, 0x02, 0xCD, 0xC9, 0x25, 0x02
	.byte 0x15, 0xCA, 0x25, 0x02, 0x99, 0xCA, 0x25, 0x02, 0x91, 0xCC, 0x25, 0x02, 0xBD, 0xCC, 0x25, 0x02
	.byte 0xAD, 0xCE, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
