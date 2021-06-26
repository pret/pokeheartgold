
	thumb_func_start ov67_021E5900
ov67_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	movs r2, #2
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x48
	lsls r2, r2, #0x10
	bl FUN_0201A910
	ldr r1, _021E5964 @ =0x000004AC
	adds r0, r4, #0
	movs r2, #0x48
	bl FUN_02007280
	ldr r2, _021E5964 @ =0x000004AC
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	ldrh r0, [r5, #4]
	strh r0, [r4, #8]
	ldrh r0, [r5, #6]
	strb r0, [r4, #0xa]
	ldr r0, [r5]
	bl FUN_02028EA8
	str r0, [r4, #0x18]
	ldr r0, [r5]
	bl FUN_0203107C
	str r0, [r4, #0x1c]
	ldr r0, [r5]
	bl FUN_0202D918
	str r0, [r4, #0x20]
	ldr r0, [r5]
	bl FUN_0202D928
	str r0, [r4, #0x24]
	movs r0, #0x48
	str r0, [r4]
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5964: .4byte 0x000004AC
	thumb_func_end ov67_021E5900

	thumb_func_start ov67_021E5968
ov67_021E5968: @ 0x021E5968
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_02007294
	ldr r0, [r4]
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov67_021E5968

	thumb_func_start ov67_021E5984
ov67_021E5984: @ 0x021E5984
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #8
	bhi _021E5A52
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E59A2: @ jump table
	.2byte _021E59B4 - _021E59A2 - 2 @ case 0
	.2byte _021E59C2 - _021E59A2 - 2 @ case 1
	.2byte _021E59DE - _021E59A2 - 2 @ case 2
	.2byte _021E59F8 - _021E59A2 - 2 @ case 3
	.2byte _021E5A00 - _021E59A2 - 2 @ case 4
	.2byte _021E5A08 - _021E59A2 - 2 @ case 5
	.2byte _021E5A18 - _021E59A2 - 2 @ case 6
	.2byte _021E5A36 - _021E59A2 - 2 @ case 7
	.2byte _021E5A44 - _021E59A2 - 2 @ case 8
_021E59B4:
	bl ov67_021E5A6C
	cmp r0, #0
	beq _021E5A52
	movs r0, #1
	str r0, [r4]
	b _021E5A52
_021E59C2:
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
	movs r0, #2
	str r0, [r4]
	b _021E5A52
_021E59DE:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5A52
	ldrh r0, [r5, #8]
	cmp r0, #0
	bne _021E59F2
	movs r0, #3
	str r0, [r4]
	b _021E5A52
_021E59F2:
	movs r0, #4
	str r0, [r4]
	b _021E5A52
_021E59F8:
	bl ov67_021E5C04
	str r0, [r4]
	b _021E5A52
_021E5A00:
	bl ov67_021E5C44
	str r0, [r4]
	b _021E5A52
_021E5A08:
	bl ov67_021E6A40
	cmp r0, #0
	bne _021E5A52
	ldr r0, _021E5A68 @ =0x0000049C
	ldr r0, [r5, r0]
	str r0, [r4]
	b _021E5A52
_021E5A18:
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
	movs r0, #7
	str r0, [r4]
	b _021E5A52
_021E5A36:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5A52
	movs r0, #8
	str r0, [r4]
	b _021E5A52
_021E5A44:
	bl ov67_021E5B44
	cmp r0, #0
	beq _021E5A52
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_021E5A52:
	ldr r0, [r4]
	cmp r0, #1
	blt _021E5A62
	cmp r0, #7
	bgt _021E5A62
	adds r0, r5, #0
	bl ov67_021E69D8
_021E5A62:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_021E5A68: .4byte 0x0000049C
	thumb_func_end ov67_021E5984

	thumb_func_start ov67_021E5A6C
ov67_021E5A6C: @ 0x021E5A6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #4
	bhi _021E5B24
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5A82: @ jump table
	.2byte _021E5A8C - _021E5A82 - 2 @ case 0
	.2byte _021E5AD6 - _021E5A82 - 2 @ case 1
	.2byte _021E5AE2 - _021E5A82 - 2 @ case 2
	.2byte _021E5AE8 - _021E5A82 - 2 @ case 3
	.2byte _021E5B14 - _021E5A82 - 2 @ case 4
_021E5A8C:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5B30 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5B34 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	ldr r2, _021E5B38 @ =0x04000304
	ldr r0, _021E5B3C @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	bl ov67_021E5BC0
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	adds r0, r4, #0
	bl ov67_021E5DA0
	b _021E5B24
_021E5AD6:
	bl ov67_021E5EB0
	adds r0, r4, #0
	bl ov67_021E60B4
	b _021E5B24
_021E5AE2:
	bl ov67_021E6820
	b _021E5B24
_021E5AE8:
	bl ov67_021E6008
	ldrh r0, [r4, #8]
	cmp r0, #0
	bne _021E5AFA
	adds r0, r4, #0
	bl ov67_021E6220
	b _021E5B24
_021E5AFA:
	adds r0, r4, #0
	bl ov67_021E63E8
	adds r0, r4, #0
	bl ov67_021E65C0
	adds r0, r4, #0
	bl ov67_021E681C
	adds r0, r4, #0
	bl ov67_021E6BC4
	b _021E5B24
_021E5B14:
	ldr r0, _021E5B40 @ =ov67_021E5BE0
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #0
	str r0, [r4, #4]
	movs r0, #1
	pop {r4, pc}
_021E5B24:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	pop {r4, pc}
	nop
_021E5B30: .4byte 0xFFFFE0FF
_021E5B34: .4byte 0x04001000
_021E5B38: .4byte 0x04000304
_021E5B3C: .4byte 0xFFFF7FFF
_021E5B40: .4byte ov67_021E5BE0
	thumb_func_end ov67_021E5A6C

	thumb_func_start ov67_021E5B44
ov67_021E5B44: @ 0x021E5B44
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021E5B54
	cmp r1, #1
	beq _021E5B7E
	b _021E5BAE
_021E5B54:
	ldrh r1, [r4, #8]
	cmp r1, #0
	beq _021E5B64
	bl ov67_021E6C04
	adds r0, r4, #0
	bl ov67_021E6474
_021E5B64:
	adds r0, r4, #0
	bl ov67_021E6990
	adds r0, r4, #0
	bl ov67_021E6080
	adds r0, r4, #0
	bl ov67_021E60F4
	adds r0, r4, #0
	bl ov67_021E5E84
	b _021E5BAE
_021E5B7E:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5BB8 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5BBC @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	str r0, [r4, #4]
	movs r0, #1
	pop {r4, pc}
_021E5BAE:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E5BB8: .4byte 0xFFFFE0FF
_021E5BBC: .4byte 0x04001000
	thumb_func_end ov67_021E5B44

	thumb_func_start ov67_021E5BC0
ov67_021E5BC0: @ 0x021E5BC0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5BDC @ =0x021E6E38
	add r3, sp, #0
	movs r2, #5
_021E5BCA:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5BCA
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E5BDC: .4byte 0x021E6E38
	thumb_func_end ov67_021E5BC0

	thumb_func_start ov67_021E5BE0
ov67_021E5BE0: @ 0x021E5BE0
	push {r4, lr}
	adds r4, r0, #0
	bl ov67_021E6A00
	ldr r0, [r4, #0x10]
	bl FUN_0201EEB4
	ldr r3, _021E5BFC @ =0x027E0000
	ldr r1, _021E5C00 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E5BFC: .4byte 0x027E0000
_021E5C00: .4byte 0x00003FF8
	thumb_func_end ov67_021E5BE0

	thumb_func_start ov67_021E5C04
ov67_021E5C04: @ 0x021E5C04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E5C34 @ =_021E6D4C
	bl FUN_02025320
	cmp r0, #1
	beq _021E5C1C
	ldr r0, _021E5C38 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r1, r0
	beq _021E5C30
_021E5C1C:
	ldr r0, _021E5C3C @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov67_021E6BB8
	ldr r0, _021E5C40 @ =0x0000049C
	movs r1, #6
	str r1, [r4, r0]
	movs r0, #5
_021E5C30:
	pop {r4, pc}
	nop
_021E5C34: .4byte _021E6D4C
_021E5C38: .4byte 0x021D110C
_021E5C3C: .4byte 0x000005DD
_021E5C40: .4byte 0x0000049C
	thumb_func_end ov67_021E5C04

	thumb_func_start ov67_021E5C44
ov67_021E5C44: @ 0x021E5C44
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E5D88 @ =0x000004A4
	ldr r0, [r4, r0]
	bl FUN_02019BE4
	cmp r0, #0xc
	bhi _021E5C58
	beq _021E5C72
	b _021E5CBE
_021E5C58:
	adds r0, r0, #4
	cmp r0, #3
	bhi _021E5CBE
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5C6A: @ jump table
	.2byte _021E5CCC - _021E5C6A - 2 @ case 0
	.2byte _021E5C88 - _021E5C6A - 2 @ case 1
	.2byte _021E5C72 - _021E5C6A - 2 @ case 2
	.2byte _021E5CCC - _021E5C6A - 2 @ case 3
_021E5C72:
	ldr r0, _021E5D8C @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov67_021E6BB8
	ldr r0, _021E5D90 @ =0x0000049C
	movs r1, #6
	str r1, [r4, r0]
	movs r0, #5
	pop {r4, pc}
_021E5C88:
	ldr r0, _021E5D94 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _021E5D98 @ =0x000004A8
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021E5CA8
	adds r0, r4, #0
	movs r1, #2
	bl ov67_021E6B6C
	ldr r0, _021E5D90 @ =0x0000049C
	movs r1, #4
	str r1, [r4, r0]
	movs r0, #5
	pop {r4, pc}
_021E5CA8:
	cmp r0, #2
	bne _021E5CCC
	adds r0, r4, #0
	movs r1, #3
	bl ov67_021E6B6C
	ldr r0, _021E5D90 @ =0x0000049C
	movs r1, #4
	str r1, [r4, r0]
	movs r0, #5
	pop {r4, pc}
_021E5CBE:
	bl FUN_02025358
	cmp r0, #1
	bne _021E5CCC
	ldr r0, _021E5D94 @ =0x000005DC
	bl FUN_0200604C
_021E5CCC:
	ldr r0, _021E5D9C @ =0x021E6D50
	bl FUN_02025224
	cmp r0, #0
	beq _021E5CDC
	cmp r0, #1
	beq _021E5D30
	b _021E5D84
_021E5CDC:
	movs r0, #0x4a
	lsls r0, r0, #4
	ldrh r1, [r4, r0]
	cmp r1, #0
	beq _021E5CEA
	subs r1, r1, #1
	b _021E5CEC
_021E5CEA:
	movs r1, #2
_021E5CEC:
	strh r1, [r4, r0]
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov67_021E6490
	ldr r0, _021E5D88 @ =0x000004A4
	ldr r0, [r4, r0]
	bl FUN_02019F74
	movs r1, #0x4a
	lsls r1, r1, #4
	ldrh r2, [r4, r1]
	movs r1, #0xc
	adds r3, r0, #0
	muls r1, r2, r1
	adds r0, r4, #0
	adds r1, r1, r3
	bl ov67_021E6688
	adds r0, r4, #0
	bl ov67_021E6530
	adds r0, r4, #0
	movs r1, #2
	bl ov67_021E6B6C
	ldr r0, _021E5D90 @ =0x0000049C
	movs r1, #4
	str r1, [r4, r0]
	movs r0, #5
	pop {r4, pc}
_021E5D30:
	movs r0, #0x4a
	lsls r0, r0, #4
	ldrh r1, [r4, r0]
	cmp r1, #2
	bhs _021E5D3E
	adds r1, r1, #1
	b _021E5D40
_021E5D3E:
	movs r1, #0
_021E5D40:
	strh r1, [r4, r0]
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov67_021E6490
	ldr r0, _021E5D88 @ =0x000004A4
	ldr r0, [r4, r0]
	bl FUN_02019F74
	movs r1, #0x4a
	lsls r1, r1, #4
	ldrh r2, [r4, r1]
	movs r1, #0xc
	adds r3, r0, #0
	muls r1, r2, r1
	adds r0, r4, #0
	adds r1, r1, r3
	bl ov67_021E6688
	adds r0, r4, #0
	bl ov67_021E6530
	adds r0, r4, #0
	movs r1, #3
	bl ov67_021E6B6C
	ldr r0, _021E5D90 @ =0x0000049C
	movs r1, #4
	str r1, [r4, r0]
	movs r0, #5
	pop {r4, pc}
_021E5D84:
	movs r0, #4
	pop {r4, pc}
	.align 2, 0
_021E5D88: .4byte 0x000004A4
_021E5D8C: .4byte 0x000005DD
_021E5D90: .4byte 0x0000049C
_021E5D94: .4byte 0x000005DC
_021E5D98: .4byte 0x000004A8
_021E5D9C: .4byte 0x021E6D50
	thumb_func_end ov67_021E5C44

	thumb_func_start ov67_021E5DA0
ov67_021E5DA0: @ 0x021E5DA0
	push {r3, r4, r5, lr}
	sub sp, #0x80
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0201AC88
	add r3, sp, #0x70
	ldr r5, _021E5E70 @ =0x021E6D5C
	str r0, [r4, #0x10]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E5E74 @ =0x021E6DA8
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
	ldr r0, [r4, #0x10]
	adds r3, r1, #0
	bl FUN_0201B1E4
	movs r0, #0
	ldr r3, [r4]
	movs r1, #0x20
	adds r2, r0, #0
	bl FUN_0201C1C4
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _021E5E78 @ =0x021E6DFC
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
	ldr r0, [r4, #0x10]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _021E5E7C @ =0x021E6DC4
	add r3, sp, #0x1c
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
	ldr r0, [r4, #0x10]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r3, [r4]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r0, [r4, #0x10]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _021E5E80 @ =0x021E6DE0
	add r3, sp, #0
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
	ldr r0, [r4, #0x10]
	movs r3, #0
	bl FUN_0201B1E4
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021E5E70: .4byte 0x021E6D5C
_021E5E74: .4byte 0x021E6DA8
_021E5E78: .4byte 0x021E6DFC
_021E5E7C: .4byte 0x021E6DC4
_021E5E80: .4byte 0x021E6DE0
	thumb_func_end ov67_021E5DA0

	thumb_func_start ov67_021E5E84
ov67_021E5E84: @ 0x021E5E84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov67_021E5E84

	thumb_func_start ov67_021E5EB0
ov67_021E5EB0: @ 0x021E5EB0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	cmp r0, #0
	bne _021E5F68
	ldr r1, [r4]
	movs r0, #0x76
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	ldr r1, [r4]
	adds r5, r0, #0
	str r1, [sp, #0xc]
	ldr r2, [r4, #0x10]
	movs r1, #4
	bl FUN_02007B44
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	movs r2, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #7
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	ldr r0, [r4]
	movs r1, #6
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x10]
	adds r0, r5, #0
	bl FUN_02007B68
	adds r0, r5, #0
	bl FUN_0200770C
	ldr r1, [r4]
	movs r0, #0xb7
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	ldr r1, [r4]
	movs r3, #5
	str r1, [sp, #0xc]
	ldr r2, [r4, #0x10]
	movs r1, #0x8e
	adds r5, r0, #0
	bl FUN_02007B44
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	movs r1, #0xc4
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #0x8d
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x10]
	adds r0, r5, #0
	movs r3, #5
	bl FUN_02007B68
	adds r0, r5, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E5F68:
	ldr r1, [r4]
	movs r0, #0x76
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	ldr r1, [r4]
	adds r5, r0, #0
	str r1, [sp, #0xc]
	ldr r2, [r4, #0x10]
	movs r1, #4
	bl FUN_02007B44
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	movs r2, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #7
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	ldr r0, [r4]
	movs r1, #5
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x10]
	adds r0, r5, #0
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #8
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x10]
	adds r0, r5, #0
	movs r3, #5
	bl FUN_02007B44
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	movs r1, #0xa
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #9
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x10]
	adds r0, r5, #0
	movs r3, #5
	bl FUN_02007B68
	adds r0, r5, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov67_021E5EB0

	thumb_func_start ov67_021E6008
ov67_021E6008: @ 0x021E6008
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #8]
	cmp r0, #0
	bne _021E6030
	adds r5, r6, #0
	ldr r4, _021E6078 @ =0x021E6E98
	movs r7, #0
	adds r5, #0x6c
_021E601A:
	ldr r0, [r6, #0x10]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r7, r7, #1
	adds r4, #8
	adds r5, #0x10
	cmp r7, #0xa
	blt _021E601A
	b _021E6054
_021E6030:
	adds r5, r6, #0
	ldr r4, _021E607C @ =0x021E7020
	movs r7, #0
	adds r5, #0x6c
_021E6038:
	ldr r0, [r6, #0x10]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r7, r7, #1
	adds r4, #8
	adds r5, #0x10
	cmp r7, #0x23
	blt _021E6038
_021E6054:
	ldr r1, [r6]
	movs r0, #4
	bl FUN_02002CEC
	movs r1, #0x1e
	ldr r2, [r6]
	movs r0, #0
	lsls r1, r1, #4
	bl FUN_02003030
	movs r1, #0x1e
	ldr r2, [r6]
	movs r0, #4
	lsls r1, r1, #4
	bl FUN_02003030
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6078: .4byte 0x021E6E98
_021E607C: .4byte 0x021E7020
	thumb_func_end ov67_021E6008

	thumb_func_start ov67_021E6080
ov67_021E6080: @ 0x021E6080
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #4
	bl FUN_02002DB4
	ldrh r0, [r5, #8]
	cmp r0, #0
	bne _021E6094
	movs r6, #0xa
	b _021E6096
_021E6094:
	movs r6, #0x23
_021E6096:
	movs r4, #0
	cmp r6, #0
	ble _021E60B2
	adds r5, #0x6c
_021E609E:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, r6
	blt _021E609E
_021E60B2:
	pop {r4, r5, r6, pc}
	thumb_func_end ov67_021E6080

	thumb_func_start ov67_021E60B4
ov67_021E60B4: @ 0x021E60B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0x1c
	bl FUN_0200BAF8
	str r0, [r4, #0x28]
	ldr r2, [r4]
	movs r0, #2
	movs r1, #0x40
	bl FUN_0200BD18
	str r0, [r4, #0x2c]
	movs r0, #2
	ldr r1, [r4]
	lsls r0, r0, #8
	bl FUN_02026354
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x28]
	movs r1, #0x21
	bl FUN_0200BBA0
	str r0, [r4, #0x64]
	ldr r0, [r4, #0x28]
	movs r1, #0x22
	bl FUN_0200BBA0
	str r0, [r4, #0x68]
	pop {r4, pc}
	thumb_func_end ov67_021E60B4

	thumb_func_start ov67_021E60F4
ov67_021E60F4: @ 0x021E60F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x68]
	bl FUN_02026380
	ldr r0, [r4, #0x64]
	bl FUN_02026380
	ldr r0, [r4, #0x30]
	bl FUN_02026380
	ldr r0, [r4, #0x2c]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x28]
	bl FUN_0200BB44
	pop {r4, pc}
	thumb_func_end ov67_021E60F4

	thumb_func_start ov67_021E6118
ov67_021E6118: @ 0x021E6118
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, [sp, #0x30]
	adds r7, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	cmp r0, #1
	bne _021E6136
	ldr r0, [sp, #0x28]
	movs r2, #0
	bl FUN_02002F30
	subs r5, r5, r0
	b _021E6146
_021E6136:
	cmp r0, #2
	bne _021E6146
	ldr r0, [sp, #0x28]
	movs r2, #0
	bl FUN_02002F30
	lsrs r0, r0, #1
	subs r5, r5, r0
_021E6146:
	str r4, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x28]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r6, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov67_021E6118

	thumb_func_start ov67_021E6164
ov67_021E6164: @ 0x021E6164
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x28]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r7, r3, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [sp, #0x24]
	adds r5, #0x6c
	str r0, [sp]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x20]
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	adds r1, r6, #0
	str r0, [sp, #8]
	lsls r0, r4, #4
	adds r0, r5, r0
	adds r2, r7, #0
	bl ov67_021E6118
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov67_021E6164

	thumb_func_start ov67_021E61A0
ov67_021E61A0: @ 0x021E61A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x28]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r6, r3, #0
	bl FUN_0200BBA0
	adds r7, r0, #0
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x30]
	adds r2, r7, #0
	bl FUN_0200CBBC
	ldr r0, [sp, #0x24]
	adds r1, r5, #0
	str r0, [sp]
	ldr r0, [sp, #0x28]
	adds r1, #0x6c
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x20]
	str r0, [sp, #8]
	lsls r0, r4, #4
	adds r0, r1, r0
	ldr r1, [r5, #0x30]
	adds r2, r6, #0
	bl ov67_021E6118
	adds r0, r7, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov67_021E61A0

	thumb_func_start ov67_021E61E8
ov67_021E61E8: @ 0x021E61E8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x6c
	bl FUN_0201EE90
	movs r1, #0
	adds r3, r0, #0
	str r1, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _021E621C @ =0x000F0100
	movs r2, #0x18
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r4, #0
	lsls r4, r3, #3
	lsrs r3, r4, #0x1f
	adds r3, r4, r3
	asrs r3, r3, #1
	bl ov67_021E6164
	add sp, #0x10
	pop {r4, pc}
	nop
_021E621C: .4byte 0x000F0100
	thumb_func_end ov67_021E61E8

	thumb_func_start ov67_021E6220
ov67_021E6220: @ 0x021E6220
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #0
	adds r4, #0x6c
	adds r7, r6, #0
_021E622E:
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #0xa
	blo _021E622E
	adds r0, r5, #0
	bl ov67_021E61E8
	adds r0, r5, #0
	adds r0, #0x7c
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	lsls r4, r3, #3
	str r0, [sp, #4]
	ldr r0, _021E63E0 @ =0x000F0200
	lsrs r3, r4, #0x1f
	adds r3, r4, r3
	str r0, [sp, #8]
	movs r2, #2
	adds r0, r5, #0
	movs r1, #1
	asrs r3, r3, #1
	str r2, [sp, #0xc]
	bl ov67_021E6164
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E63E4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #2
	movs r2, #5
	str r3, [sp, #0xc]
	bl ov67_021E6164
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E63E4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #8
	str r3, [sp, #0xc]
	bl ov67_021E6164
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E63E4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #4
	movs r2, #0xc
	bl ov67_021E6164
	ldr r0, [r5, #0x20]
	movs r1, #0xc
	movs r2, #0
	bl FUN_0202D5DC
	cmp r0, #0
	ldr r0, _021E63E4 @ =0x00010200
	bne _021E62D4
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #6
	movs r2, #9
	str r3, [sp, #0xc]
	bl ov67_021E6164
	b _021E62E8
_021E62D4:
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	str r3, [sp, #0xc]
	bl ov67_021E6164
_021E62E8:
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E63E4 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0xb
	bl ov67_021E6164
	ldr r0, [r5, #0x20]
	movs r1, #0
	bl FUN_0202D488
	movs r1, #0
	adds r2, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x2c]
	movs r3, #2
	bl FUN_0200BFCC
	adds r0, r5, #0
	adds r0, #0xbc
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E63E4 @ =0x00010200
	movs r1, #5
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r2, #0xe
	lsls r3, r3, #3
	bl ov67_021E61A0
	ldr r0, [r5, #0x1c]
	movs r1, #9
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x2c]
	movs r1, #0
	movs r3, #4
	bl FUN_0200BFCC
	adds r0, r5, #0
	adds r0, #0xdc
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E63E4 @ =0x00010200
	lsls r4, r3, #3
	lsrs r3, r4, #0x1f
	str r0, [sp, #8]
	movs r0, #2
	adds r3, r4, r3
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #7
	movs r2, #0xf
	asrs r3, r3, #1
	bl ov67_021E61A0
	ldr r0, [r5, #0x1c]
	movs r1, #8
	movs r2, #0xff
	bl FUN_020310BC
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x2c]
	movs r1, #0
	movs r3, #4
	bl FUN_0200BFCC
	adds r0, r5, #0
	adds r0, #0xfc
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E63E4 @ =0x00010200
	lsls r4, r3, #3
	lsrs r3, r4, #0x1f
	str r0, [sp, #8]
	movs r0, #2
	adds r3, r4, r3
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #9
	movs r2, #0xf
	asrs r3, r3, #1
	bl ov67_021E61A0
	movs r4, #0
	adds r5, #0x6c
_021E63CC:
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0xa
	blo _021E63CC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E63E0: .4byte 0x000F0200
_021E63E4: .4byte 0x00010200
	thumb_func_end ov67_021E6220

	thumb_func_start ov67_021E63E8
ov67_021E63E8: @ 0x021E63E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x24]
	ldr r1, [r7]
	bl FUN_0202D8E4
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa7
	ldr r5, [sp, #4]
	lsls r0, r0, #2
	adds r4, r7, r0
	adds r6, r5, #0
_021E6406:
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #8
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	strb r0, [r4, #4]
	ldrb r0, [r5, #0x12]
	movs r2, #8
	strb r0, [r4, #5]
	ldrb r0, [r5, #0x13]
	strb r0, [r4, #6]
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	strb r0, [r4, #7]
	adds r0, r5, #0
	adds r0, #0x18
	blx FUN_020D4A50
	ldr r1, [r7]
	movs r0, #8
	bl FUN_02026354
	str r0, [r4]
	ldrb r0, [r4, #7]
	cmp r0, #0
	ldr r0, [r4]
	beq _021E6454
	ldrb r1, [r4, #4]
	lsls r1, r1, #2
	adds r1, r7, r1
	ldr r1, [r1, #0x64]
	bl FUN_020263D4
	b _021E645A
_021E6454:
	adds r1, r6, #0
	bl FUN_020269A0
_021E645A:
	ldr r0, [sp]
	adds r4, #0x10
	adds r0, r0, #1
	adds r5, #0x22
	adds r6, #0x22
	str r0, [sp]
	cmp r0, #0x1e
	blt _021E6406
	ldr r0, [sp, #4]
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov67_021E63E8

	thumb_func_start ov67_021E6474
ov67_021E6474: @ 0x021E6474
	push {r4, r5, r6, lr}
	movs r6, #0xa7
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_021E647E:
	ldr r0, [r5, r6]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0x1e
	blt _021E647E
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov67_021E6474

	thumb_func_start ov67_021E6490
ov67_021E6490: @ 0x021E6490
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r1, _021E6528 @ =0x000004A2
	str r0, [sp, #0xc]
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _021E64A6
	movs r1, #0x47
	lsls r1, r1, #2
	ldr r0, [sp, #0xc]
	b _021E64AC
_021E64A6:
	movs r1, #0x77
	ldr r0, [sp, #0xc]
	lsls r1, r1, #2
_021E64AC:
	adds r5, r0, r1
	movs r1, #0x4a
	ldr r0, [sp, #0xc]
	lsls r1, r1, #4
	ldrh r1, [r0, r1]
	movs r0, #0xc
	movs r6, #0
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_021E64C0:
	lsls r7, r6, #4
	adds r0, r5, r7
	movs r1, #0
	bl FUN_0201D978
	cmp r4, #0x1e
	bhs _021E64FE
	ldr r0, [sp, #0xc]
	lsls r1, r4, #4
	adds r1, r0, r1
	movs r0, #0x2a
	lsls r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _021E64E2
	ldr r2, _021E652C @ =0x00070800
	b _021E64E6
_021E64E2:
	movs r2, #0xc1
	lsls r2, r2, #0xa
_021E64E6:
	movs r0, #0
	str r0, [sp]
	str r2, [sp, #4]
	movs r2, #0xa7
	str r0, [sp, #8]
	lsls r2, r2, #2
	ldr r1, [r1, r2]
	movs r2, #0
	adds r0, r5, r7
	adds r3, r2, #0
	bl ov67_021E6118
_021E64FE:
	adds r0, r5, r7
	bl FUN_0201D5C8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0xc
	blo _021E64C0
	ldr r1, _021E6528 @ =0x000004A2
	ldr r0, [sp, #0xc]
	ldrb r2, [r0, r1]
	movs r0, #1
	eors r2, r0
	ldr r0, [sp, #0xc]
	strb r2, [r0, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6528: .4byte 0x000004A2
_021E652C: .4byte 0x00070800
	thumb_func_end ov67_021E6490

	thumb_func_start ov67_021E6530
ov67_021E6530: @ 0x021E6530
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0xac
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	movs r2, #0x4a
	str r1, [sp]
	movs r3, #1
	str r3, [sp, #4]
	lsls r2, r2, #4
	ldrh r2, [r4, r2]
	ldr r0, [r4, #0x2c]
	adds r2, r2, #1
	bl FUN_0200BFCC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E65BC @ =0x00010200
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x14
	movs r3, #8
	bl ov67_021E61A0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E65BC @ =0x00010200
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #0x15
	movs r3, #0x10
	bl ov67_021E6164
	movs r1, #0
	str r1, [sp]
	movs r3, #1
	str r3, [sp, #4]
	ldr r0, [r4, #0x2c]
	movs r2, #3
	bl FUN_0200BFCC
	movs r1, #0
	str r1, [sp]
	ldr r0, _021E65BC @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x14
	movs r3, #0x18
	bl ov67_021E61A0
	adds r4, #0xac
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E65BC: .4byte 0x00010200
	thumb_func_end ov67_021E6530

	thumb_func_start ov67_021E65C0
ov67_021E65C0: @ 0x021E65C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
	adds r5, #0x6c
	adds r7, r4, #0
_021E65CE:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_0201D978
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	bls _021E65CE
	adds r0, r6, #0
	bl ov67_021E61E8
	ldr r0, [r6, #0x24]
	add r1, sp, #0x10
	bl FUN_0202D8D0
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	add r2, sp, #0x10
	ldrb r2, [r2]
	ldr r0, [r6, #0x2c]
	movs r3, #2
	bl FUN_0200BFCC
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6684 @ =0x000F0200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x11
	str r3, [sp, #0xc]
	bl ov67_021E61A0
	movs r0, #2
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	add r2, sp, #0x10
	ldrb r2, [r2, #1]
	ldr r0, [r6, #0x2c]
	movs r3, #3
	bl FUN_0200BFCC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6684 @ =0x000F0200
	movs r1, #2
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r2, #0x12
	movs r3, #0x3c
	str r1, [sp, #0xc]
	bl ov67_021E61A0
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6684 @ =0x000F0200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #3
	movs r2, #0x13
	str r3, [sp, #0xc]
	bl ov67_021E6164
	adds r4, r6, #0
	movs r5, #0
	adds r4, #0x6c
_021E665E:
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #3
	bls _021E665E
	adds r0, r6, #0
	bl ov67_021E6490
	adds r0, r6, #0
	movs r1, #0
	bl ov67_021E6688
	adds r0, r6, #0
	bl ov67_021E6530
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E6684: .4byte 0x000F0200
	thumb_func_end ov67_021E65C0

	thumb_func_start ov67_021E6688
ov67_021E6688: @ 0x021E6688
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	ldr r0, _021E680C @ =0x000004A3
	str r1, [sp, #0x10]
	ldrb r0, [r6, r0]
	cmp r0, #0
	bne _021E669C
	movs r7, #5
	b _021E669E
_021E669C:
	movs r7, #8
_021E669E:
	adds r1, r6, #0
	adds r1, #0x6c
	lsls r0, r7, #4
	adds r4, r1, r0
	movs r5, #0
_021E66A8:
	lsls r0, r5, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	blo _021E66A8
	ldr r0, [sp, #0x10]
	cmp r0, #0x1e
	blo _021E66C4
	b _021E67E8
_021E66C4:
	movs r2, #0x2a
	lsls r2, r2, #4
	lsls r5, r0, #4
	adds r0, r6, r2
	str r0, [sp, #0x14]
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r3, r6, r5
	subs r2, r2, #4
	ldr r2, [r3, r2]
	ldr r3, [sp, #0x14]
	ldr r0, [r6, #0x2c]
	ldrb r3, [r3, r5]
	movs r1, #0
	bl FUN_0200BE3C
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, r5]
	cmp r0, #0
	ldr r0, _021E6810 @ =0x00010200
	bne _021E6708
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0x16
	str r3, [sp, #0xc]
	bl ov67_021E61A0
	b _021E671C
_021E6708:
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0x17
	str r3, [sp, #0xc]
	bl ov67_021E61A0
_021E671C:
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6810 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #1
	movs r2, #0x1c
	str r3, [sp, #0xc]
	bl ov67_021E6164
	ldr r0, _021E6814 @ =0x000002A1
	adds r0, r6, r0
	ldrb r2, [r0, r5]
	str r0, [sp, #0x18]
	cmp r2, #0
	bne _021E6758
	movs r0, #0x10
	str r0, [sp]
	movs r3, #0
	ldr r0, _021E6810 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #1
	movs r2, #0x1f
	str r3, [sp, #0xc]
	bl ov67_021E6164
	b _021E6778
_021E6758:
	ldr r0, [r6, #0x2c]
	movs r1, #0
	bl FUN_0200C4B0
	movs r0, #0x10
	str r0, [sp]
	movs r3, #0
	ldr r0, _021E6810 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #1
	movs r2, #0x1d
	str r3, [sp, #0xc]
	bl ov67_021E61A0
_021E6778:
	ldr r0, _021E6818 @ =0x000002A2
	adds r1, r6, r5
	ldrb r3, [r1, r0]
	cmp r3, #0
	beq _021E67A6
	ldr r2, [sp, #0x18]
	ldr r0, [r6, #0x2c]
	ldrb r2, [r2, r5]
	movs r1, #0
	bl FUN_0200C4E8
	movs r0, #0x20
	str r0, [sp]
	movs r3, #0
	ldr r0, _021E6810 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #1
	movs r2, #0x1e
	str r3, [sp, #0xc]
	bl ov67_021E61A0
_021E67A6:
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6810 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #2
	movs r2, #0x20
	str r3, [sp, #0xc]
	bl ov67_021E6164
	movs r0, #0xa9
	lsls r0, r0, #2
	adds r0, r6, r0
	ldr r1, [r6]
	adds r0, r0, r5
	bl FUN_02015898
	adds r5, r0, #0
	movs r2, #0
	ldr r0, _021E6810 @ =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r5, #0
	movs r3, #0x10
	str r2, [sp, #8]
	bl ov67_021E6118
	adds r0, r5, #0
	bl FUN_02026380
_021E67E8:
	movs r5, #0
_021E67EA:
	lsls r0, r5, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	blo _021E67EA
	ldr r1, _021E680C @ =0x000004A3
	movs r0, #1
	ldrb r2, [r6, r1]
	eors r0, r2
	strb r0, [r6, r1]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021E680C: .4byte 0x000004A3
_021E6810: .4byte 0x00010200
_021E6814: .4byte 0x000002A1
_021E6818: .4byte 0x000002A2
	thumb_func_end ov67_021E6688

	thumb_func_start ov67_021E681C
ov67_021E681C: @ 0x021E681C
	bx lr
	.align 2, 0
	thumb_func_end ov67_021E681C

	thumb_func_start ov67_021E6820
ov67_021E6820: @ 0x021E6820
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	adds r5, r0, #0
	ldr r0, [r5]
	bl FUN_0200CF18
	ldr r1, _021E6974 @ =0x0000047C
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl FUN_0200CF38
	movs r7, #0x12
	lsls r7, r7, #6
	add r2, sp, #0x3c
	ldr r3, _021E6978 @ =0x021E6E18
	str r0, [r5, r7]
	ldm r3!, {r0, r1}
	adds r6, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	ldr r4, _021E697C @ =0x021E6D7C
	stm r2!, {r0, r1}
	add r3, sp, #0x28
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	adds r1, r6, #0
	str r0, [r3]
	subs r0, r7, #4
	ldr r0, [r5, r0]
	movs r3, #0x20
	bl FUN_0200CF70
	subs r1, r7, #4
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #4
	bl FUN_0200CFF4
	ldr r4, _021E6980 @ =0x021E6D90
	add r3, sp, #0x10
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r1, r7, #4
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200D3F8
	subs r0, r7, #4
	ldr r0, [r5, r0]
	bl FUN_0200CF6C
	movs r2, #2
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	ldr r1, [r5]
	movs r0, #0x76
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6984 @ =0x0000D158
	subs r1, r7, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _021E6984 @ =0x0000D158
	subs r1, r7, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #3
	bl FUN_0200D5D4
	movs r3, #1
	ldr r0, _021E6984 @ =0x0000D158
	str r3, [sp]
	subs r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _021E6984 @ =0x0000D158
	subs r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #2
	bl FUN_0200D71C
	adds r0, r4, #0
	bl FUN_0200770C
	ldr r6, _021E6988 @ =0x021E6F50
	movs r7, #0
	adds r4, r5, #0
_021E692C:
	ldr r0, _021E6974 @ =0x0000047C
	movs r1, #0x12
	lsls r1, r1, #6
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl FUN_0200D734
	ldr r1, _021E698C @ =0x00000484
	adds r7, r7, #1
	str r0, [r4, r1]
	adds r6, #0x34
	adds r4, r4, #4
	cmp r7, #4
	blo _021E692C
	ldrh r0, [r5, #8]
	cmp r0, #0
	bne _021E6968
	adds r0, r1, #0
	adds r0, #8
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x49
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
_021E6968:
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E6974: .4byte 0x0000047C
_021E6978: .4byte 0x021E6E18
_021E697C: .4byte 0x021E6D7C
_021E6980: .4byte 0x021E6D90
_021E6984: .4byte 0x0000D158
_021E6988: .4byte 0x021E6F50
_021E698C: .4byte 0x00000484
	thumb_func_end ov67_021E6820

	thumb_func_start ov67_021E6990
ov67_021E6990: @ 0x021E6990
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r7, _021E69D0 @ =0x00000484
	str r0, [sp]
	adds r5, r0, #0
	adds r6, r4, #0
_021E699C:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _021E69AA
	bl FUN_0200D9DC
	ldr r0, _021E69D0 @ =0x00000484
	str r6, [r5, r0]
_021E69AA:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _021E699C
	ldr r1, _021E69D4 @ =0x0000047C
	ldr r0, [sp]
	adds r2, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [sp]
	ldr r1, [r1, r2]
	bl FUN_0200D998
	ldr r1, _021E69D4 @ =0x0000047C
	ldr r0, [sp]
	ldr r0, [r0, r1]
	bl FUN_0200D108
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E69D0: .4byte 0x00000484
_021E69D4: .4byte 0x0000047C
	thumb_func_end ov67_021E6990

	thumb_func_start ov67_021E69D8
ov67_021E69D8: @ 0x021E69D8
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, _021E69FC @ =0x00000484
	movs r4, #0
	adds r5, r7, #0
_021E69E2:
	ldr r0, [r5, r6]
	bl FUN_0200DC18
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _021E69E2
	movs r0, #0x12
	lsls r0, r0, #6
	ldr r0, [r7, r0]
	bl FUN_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E69FC: .4byte 0x00000484
	thumb_func_end ov67_021E69D8

	thumb_func_start ov67_021E6A00
ov67_021E6A00: @ 0x021E6A00
	ldr r3, _021E6A04 @ =FUN_0200D034
	bx r3
	.align 2, 0
_021E6A04: .4byte FUN_0200D034
	thumb_func_end ov67_021E6A00

	thumb_func_start ov67_021E6A08
ov67_021E6A08: @ 0x021E6A08
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	ldr r2, _021E6A24 @ =0x00000484
	lsls r4, r1, #2
	adds r5, r0, r2
	ldr r0, [r5, r4]
	movs r1, #0
	bl FUN_0200DCC0
	ldr r0, [r5, r4]
	adds r1, r6, #0
	bl FUN_0200DC4C
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E6A24: .4byte 0x00000484
	thumb_func_end ov67_021E6A08

	thumb_func_start ov67_021E6A28
ov67_021E6A28: @ 0x021E6A28
	lsls r1, r1, #2
	adds r1, r0, r1
	ldr r0, _021E6A38 @ =0x00000484
	ldr r0, [r1, r0]
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _021E6A3C @ =FUN_0200DDB8
	bx r3
	.align 2, 0
_021E6A38: .4byte 0x00000484
_021E6A3C: .4byte FUN_0200DDB8
	thumb_func_end ov67_021E6A28

	thumb_func_start ov67_021E6A40
ov67_021E6A40: @ 0x021E6A40
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r3, _021E6B60 @ =0x00000496
	adds r4, r0, #0
	ldrb r0, [r4, r3]
	cmp r0, #0
	beq _021E6A58
	cmp r0, #1
	beq _021E6AC2
	cmp r0, #2
	beq _021E6B44
	b _021E6B5A
_021E6A58:
	subs r0, r3, #2
	ldrb r0, [r4, r0]
	lsls r1, r0, #0x1f
	lsrs r1, r1, #0x1f
	bne _021E6A7E
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r3, #0
	subs r0, #0x12
	ldr r0, [r1, r0]
	subs r1, r3, #1
	ldrb r1, [r4, r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bl FUN_0200DD10
	b _021E6AB8
_021E6A7E:
	adds r0, r3, #4
	ldrb r0, [r4, r0]
	subs r1, r3, #2
	adds r2, r3, #2
	str r0, [sp]
	adds r0, r3, #5
	ldrb r0, [r4, r0]
	str r0, [sp, #4]
	subs r0, r3, #1
	ldrb r0, [r4, r0]
	adds r3, r3, #3
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	lsls r1, r1, #0x18
	ldr r0, [r4, #0x10]
	lsrs r1, r1, #0x19
	bl FUN_0201CA4C
	ldr r1, _021E6B64 @ =0x00000494
	ldr r0, [r4, #0x10]
	ldrb r1, [r4, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	bl FUN_0201EFBC
_021E6AB8:
	ldr r0, _021E6B60 @ =0x00000496
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _021E6B5A
_021E6AC2:
	adds r0, r3, #1
	ldrb r0, [r4, r0]
	adds r1, r0, #1
	adds r0, r3, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #4
	bne _021E6B5A
	subs r0, r3, #2
	ldrb r0, [r4, r0]
	lsls r1, r0, #0x1f
	lsrs r1, r1, #0x1f
	bne _021E6AF8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r3, #0
	subs r0, #0x12
	ldr r0, [r1, r0]
	subs r1, r3, #1
	ldrb r1, [r4, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	bl FUN_0200DD10
	b _021E6B32
_021E6AF8:
	adds r0, r3, #4
	ldrb r0, [r4, r0]
	subs r1, r3, #2
	adds r2, r3, #2
	str r0, [sp]
	adds r0, r3, #5
	ldrb r0, [r4, r0]
	str r0, [sp, #4]
	subs r0, r3, #1
	ldrb r0, [r4, r0]
	adds r3, r3, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	lsls r1, r1, #0x18
	ldr r0, [r4, #0x10]
	lsrs r1, r1, #0x19
	bl FUN_0201CA4C
	ldr r1, _021E6B64 @ =0x00000494
	ldr r0, [r4, #0x10]
	ldrb r1, [r4, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	bl FUN_0201EFBC
_021E6B32:
	ldr r0, _021E6B68 @ =0x00000497
	movs r1, #0
	strb r1, [r4, r0]
	subs r1, r0, #1
	ldrb r1, [r4, r1]
	subs r0, r0, #1
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _021E6B5A
_021E6B44:
	adds r0, r3, #1
	ldrb r0, [r4, r0]
	adds r1, r0, #1
	adds r0, r3, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #2
	bne _021E6B5A
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_021E6B5A:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_021E6B60: .4byte 0x00000496
_021E6B64: .4byte 0x00000494
_021E6B68: .4byte 0x00000497
	thumb_func_end ov67_021E6A40

	thumb_func_start ov67_021E6B6C
ov67_021E6B6C: @ 0x021E6B6C
	push {r3, r4}
	ldr r4, _021E6BB4 @ =0x00000494
	lsls r1, r1, #0x18
	ldrb r3, [r0, r4]
	movs r2, #1
	lsrs r1, r1, #0x18
	bics r3, r2
	strb r3, [r0, r4]
	ldrb r2, [r0, r4]
	movs r3, #0xfe
	lsls r1, r1, #0x19
	bics r2, r3
	lsrs r1, r1, #0x18
	orrs r1, r2
	strb r1, [r0, r4]
	adds r1, r4, #1
	ldrb r2, [r0, r1]
	movs r1, #0xf
	bics r2, r1
	movs r1, #1
	orrs r2, r1
	adds r1, r4, #1
	strb r2, [r0, r1]
	ldrb r2, [r0, r1]
	movs r1, #0xf0
	bics r2, r1
	adds r1, r4, #1
	strb r2, [r0, r1]
	movs r2, #0
	adds r1, r4, #2
	strb r2, [r0, r1]
	adds r1, r4, #3
	strb r2, [r0, r1]
	pop {r3, r4}
	bx lr
	nop
_021E6BB4: .4byte 0x00000494
	thumb_func_end ov67_021E6B6C

	thumb_func_start ov67_021E6BB8
ov67_021E6BB8: @ 0x021E6BB8
	ldr r3, _021E6BC0 @ =ov67_021E6B6C
	movs r1, #1
	bx r3
	nop
_021E6BC0: .4byte ov67_021E6B6C
	thumb_func_end ov67_021E6BB8

	thumb_func_start ov67_021E6BC4
ov67_021E6BC4: @ 0x021E6BC4
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r1, _021E6BF4 @ =0x021E6EE8
	str r0, [sp, #8]
	ldr r0, _021E6BF8 @ =0x021E6E60
	ldr r2, _021E6BFC @ =0x021E6D6C
	adds r3, r4, #0
	bl FUN_02019BA4
	ldr r1, _021E6C00 @ =0x000004A4
	str r0, [r4, r1]
	adds r0, r4, #0
	movs r1, #0
	bl ov67_021E6C14
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E6BF4: .4byte 0x021E6EE8
_021E6BF8: .4byte 0x021E6E60
_021E6BFC: .4byte 0x021E6D6C
_021E6C00: .4byte 0x000004A4
	thumb_func_end ov67_021E6BC4

	thumb_func_start ov67_021E6C04
ov67_021E6C04: @ 0x021E6C04
	ldr r1, _021E6C0C @ =0x000004A4
	ldr r3, _021E6C10 @ =FUN_02019BDC
	ldr r0, [r0, r1]
	bx r3
	.align 2, 0
_021E6C0C: .4byte 0x000004A4
_021E6C10: .4byte FUN_02019BDC
	thumb_func_end ov67_021E6C04

	thumb_func_start ov67_021E6C14
ov67_021E6C14: @ 0x021E6C14
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021E6C58 @ =0x000004A4
	adds r4, r1, #0
	ldr r0, [r5, r0]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	add r3, sp, #0
	ldrb r2, [r3, #1]
	ldrb r3, [r3]
	adds r0, r5, #0
	movs r1, #0
	bl ov67_021E6A28
	cmp r4, #0xc
	bne _021E6C4A
	adds r0, r5, #0
	movs r1, #0
	movs r2, #2
	bl ov67_021E6A08
	pop {r3, r4, r5, pc}
_021E6C4A:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #7
	bl ov67_021E6A08
	pop {r3, r4, r5, pc}
	nop
_021E6C58: .4byte 0x000004A4
	thumb_func_end ov67_021E6C14

	thumb_func_start ov67_021E6C5C
ov67_021E6C5C: @ 0x021E6C5C
	bx lr
	.align 2, 0
	thumb_func_end ov67_021E6C5C

	thumb_func_start ov67_021E6C60
ov67_021E6C60: @ 0x021E6C60
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _021E6D1C @ =0x000004A8
	movs r1, #0
	adds r6, r2, #0
	str r1, [r5, r0]
	cmp r4, #2
	bne _021E6C76
	cmp r6, #0
	beq _021E6C8E
_021E6C76:
	cmp r4, #5
	bne _021E6C7E
	cmp r6, #3
	beq _021E6C8E
_021E6C7E:
	cmp r4, #8
	bne _021E6C86
	cmp r6, #6
	beq _021E6C8E
_021E6C86:
	cmp r4, #0xb
	bne _021E6CB2
	cmp r6, #9
	bne _021E6CB2
_021E6C8E:
	movs r0, #0x4a
	lsls r0, r0, #4
	ldrh r1, [r5, r0]
	cmp r1, #0
	beq _021E6C9C
	subs r1, r1, #1
	b _021E6C9E
_021E6C9C:
	movs r1, #2
_021E6C9E:
	strh r1, [r5, r0]
	adds r0, r5, #0
	bl ov67_021E6490
	adds r0, r5, #0
	bl ov67_021E6530
	ldr r0, _021E6D1C @ =0x000004A8
	movs r1, #1
	str r1, [r5, r0]
_021E6CB2:
	cmp r4, #0
	bne _021E6CBA
	cmp r6, #2
	beq _021E6CD2
_021E6CBA:
	cmp r4, #3
	bne _021E6CC2
	cmp r6, #5
	beq _021E6CD2
_021E6CC2:
	cmp r4, #6
	bne _021E6CCA
	cmp r6, #8
	beq _021E6CD2
_021E6CCA:
	cmp r4, #9
	bne _021E6CF6
	cmp r6, #0xb
	bne _021E6CF6
_021E6CD2:
	movs r0, #0x4a
	lsls r0, r0, #4
	ldrh r1, [r5, r0]
	cmp r1, #2
	bhs _021E6CE0
	adds r1, r1, #1
	b _021E6CE2
_021E6CE0:
	movs r1, #0
_021E6CE2:
	strh r1, [r5, r0]
	adds r0, r5, #0
	bl ov67_021E6490
	adds r0, r5, #0
	bl ov67_021E6530
	ldr r0, _021E6D1C @ =0x000004A8
	movs r1, #2
	str r1, [r5, r0]
_021E6CF6:
	cmp r4, #0xc
	bne _021E6CFE
	movs r1, #0x1e
	b _021E6D0A
_021E6CFE:
	movs r0, #0x4a
	lsls r0, r0, #4
	ldrh r1, [r5, r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r1, r4, r0
_021E6D0A:
	adds r0, r5, #0
	bl ov67_021E6688
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov67_021E6C14
	pop {r4, r5, r6, pc}
	nop
_021E6D1C: .4byte 0x000004A8
	thumb_func_end ov67_021E6C60

	thumb_func_start ov67_021E6D20
ov67_021E6D20: @ 0x021E6D20
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0xc
	bne _021E6D2E
	movs r1, #0x1e
	b _021E6D3A
_021E6D2E:
	movs r0, #0x4a
	lsls r0, r0, #4
	ldrh r1, [r5, r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r1, r4, r0
_021E6D3A:
	adds r0, r5, #0
	bl ov67_021E6688
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov67_021E6C14
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov67_021E6D20

	.rodata

_021E6D4C:
	.byte 0xA4, 0xBB, 0xC1, 0xFE
	.byte 0xA2, 0xBD, 0x12, 0x2D, 0xA2, 0xBD, 0x32, 0x4D, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5D, 0x6C, 0x1E, 0x02
	.byte 0x5D, 0x6C, 0x1E, 0x02, 0x61, 0x6C, 0x1E, 0x02, 0x21, 0x6D, 0x1E, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x38, 0x47, 0x15, 0x5A, 0x38, 0x47, 0x5D, 0xA2, 0x38, 0x47, 0xA5, 0xEA, 0x50, 0x5F, 0x15, 0x5A
	.byte 0x50, 0x5F, 0x5D, 0xA2, 0x50, 0x5F, 0xA5, 0xEA, 0x68, 0x77, 0x15, 0x5A, 0x68, 0x77, 0x5D, 0xA2
	.byte 0x68, 0x77, 0xA5, 0xEA, 0x80, 0x8F, 0x15, 0x5A, 0x80, 0x8F, 0x5D, 0xA2, 0x80, 0x8F, 0xA5, 0xEA
	.byte 0xA4, 0xBB, 0xC1, 0xFE, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x18, 0x15, 0x08, 0x02, 0x0F, 0x01, 0x00
	.byte 0x00, 0x05, 0x01, 0x16, 0x02, 0x0F, 0x11, 0x00, 0x00, 0x01, 0x06, 0x09, 0x04, 0x0F, 0x3D, 0x00
	.byte 0x00, 0x01, 0x0D, 0x09, 0x04, 0x0F, 0x61, 0x00, 0x00, 0x0B, 0x07, 0x06, 0x02, 0x0F, 0x85, 0x00
	.byte 0x00, 0x14, 0x07, 0x02, 0x02, 0x0F, 0x91, 0x00, 0x00, 0x0B, 0x0D, 0x07, 0x02, 0x0F, 0x95, 0x00
	.byte 0x00, 0x12, 0x0D, 0x0C, 0x02, 0x0F, 0xA3, 0x00, 0x00, 0x0B, 0x10, 0x06, 0x02, 0x0F, 0xBB, 0x00
	.byte 0x00, 0x12, 0x10, 0x0C, 0x02, 0x0F, 0xC7, 0x00, 0x38, 0x40, 0x00, 0x00, 0x00, 0x03, 0x02, 0x01
	.byte 0x80, 0x40, 0x00, 0x00, 0x01, 0x04, 0x00, 0x02, 0xC8, 0x40, 0x00, 0x00, 0x02, 0x05, 0x01, 0x00
	.byte 0x38, 0x58, 0x00, 0x00, 0x00, 0x06, 0x05, 0x04, 0x80, 0x58, 0x00, 0x00, 0x01, 0x07, 0x03, 0x05
	.byte 0xC8, 0x58, 0x00, 0x00, 0x02, 0x08, 0x04, 0x03, 0x38, 0x70, 0x00, 0x00, 0x03, 0x09, 0x08, 0x07
	.byte 0x80, 0x70, 0x00, 0x00, 0x04, 0x0A, 0x06, 0x08, 0xC8, 0x70, 0x00, 0x00, 0x05, 0x0B, 0x07, 0x06
	.byte 0x38, 0x88, 0x00, 0x00, 0x06, 0x0C, 0x0B, 0x0A, 0x80, 0x88, 0x00, 0x00, 0x07, 0x0C, 0x09, 0x0B
	.byte 0xC8, 0x88, 0x00, 0x00, 0x08, 0x0C, 0x0A, 0x09, 0xE0, 0xB0, 0x00, 0x00, 0x8B, 0x0C, 0x0C, 0x0C
	.byte 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00
	.byte 0x58, 0xD1, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00
	.byte 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00
	.byte 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x18, 0x15, 0x08, 0x02, 0x0F, 0x01, 0x00, 0x00, 0x05, 0x01, 0x08, 0x02, 0x0F, 0x11, 0x00
	.byte 0x00, 0x0D, 0x01, 0x0F, 0x02, 0x0F, 0x21, 0x00, 0x00, 0x05, 0x03, 0x16, 0x02, 0x0F, 0x3F, 0x00
	.byte 0x00, 0x0F, 0x15, 0x04, 0x02, 0x0F, 0x6B, 0x00, 0x04, 0x02, 0x07, 0x1C, 0x02, 0x0F, 0x01, 0x00
	.byte 0x04, 0x02, 0x0A, 0x1C, 0x06, 0x0F, 0x71, 0x00, 0x04, 0x02, 0x11, 0x1C, 0x06, 0x0F, 0xC1, 0x01
	.byte 0x04, 0x02, 0x07, 0x1C, 0x02, 0x0F, 0x39, 0x00, 0x04, 0x02, 0x0A, 0x1C, 0x06, 0x0F, 0x19, 0x01
	.byte 0x04, 0x02, 0x11, 0x1C, 0x06, 0x0F, 0x69, 0x02, 0x00, 0x03, 0x07, 0x08, 0x02, 0x0F, 0x73, 0x00
	.byte 0x00, 0x0C, 0x07, 0x08, 0x02, 0x0F, 0x83, 0x00, 0x00, 0x15, 0x07, 0x08, 0x02, 0x0F, 0x93, 0x00
	.byte 0x00, 0x03, 0x0A, 0x08, 0x02, 0x0F, 0xA3, 0x00, 0x00, 0x0C, 0x0A, 0x08, 0x02, 0x0F, 0xB3, 0x00
	.byte 0x00, 0x15, 0x0A, 0x08, 0x02, 0x0F, 0xC3, 0x00, 0x00, 0x03, 0x0D, 0x08, 0x02, 0x0F, 0xD3, 0x00
	.byte 0x00, 0x0C, 0x0D, 0x08, 0x02, 0x0F, 0xE3, 0x00, 0x00, 0x15, 0x0D, 0x08, 0x02, 0x0F, 0xF3, 0x00
	.byte 0x00, 0x03, 0x10, 0x08, 0x02, 0x0F, 0x03, 0x01, 0x00, 0x0C, 0x10, 0x08, 0x02, 0x0F, 0x13, 0x01
	.byte 0x00, 0x15, 0x10, 0x08, 0x02, 0x0F, 0x23, 0x01, 0x00, 0x03, 0x07, 0x08, 0x02, 0x0F, 0x33, 0x01
	.byte 0x00, 0x0C, 0x07, 0x08, 0x02, 0x0F, 0x43, 0x01, 0x00, 0x15, 0x07, 0x08, 0x02, 0x0F, 0x53, 0x01
	.byte 0x00, 0x03, 0x0A, 0x08, 0x02, 0x0F, 0x63, 0x01, 0x00, 0x0C, 0x0A, 0x08, 0x02, 0x0F, 0x73, 0x01
	.byte 0x00, 0x15, 0x0A, 0x08, 0x02, 0x0F, 0x83, 0x01, 0x00, 0x03, 0x0D, 0x08, 0x02, 0x0F, 0x93, 0x01
	.byte 0x00, 0x0C, 0x0D, 0x08, 0x02, 0x0F, 0xA3, 0x01, 0x00, 0x15, 0x0D, 0x08, 0x02, 0x0F, 0xB3, 0x01
	.byte 0x00, 0x03, 0x10, 0x08, 0x02, 0x0F, 0xC3, 0x01, 0x00, 0x0C, 0x10, 0x08, 0x02, 0x0F, 0xD3, 0x01
	.byte 0x00, 0x15, 0x10, 0x08, 0x02, 0x0F, 0xE3, 0x01
	@ 0x021E7138
