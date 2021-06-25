
	thumb_func_start ov53_021E5900
ov53_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	sub sp, #8
	movs r2, #1
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x50
	lsls r2, r2, #0x12
	bl FUN_0201A910
	movs r1, #6
	adds r0, r5, #0
	lsls r1, r1, #6
	movs r2, #0x50
	bl FUN_02007280
	movs r2, #6
	movs r1, #0
	lsls r2, r2, #6
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x50
	str r0, [r4]
	adds r0, r5, #0
	bl FUN_020072A4
	ldr r0, [r0, #8]
	str r0, [r4, #4]
	bl FUN_02028EA8
	movs r1, #0
	str r0, [r4, #8]
	str r1, [r4, #0xc]
	str r1, [r4, #0x10]
	str r1, [r4, #0x14]
	ldr r0, [r4, #8]
	adds r2, r1, #0
	str r0, [sp]
	movs r0, #0x50
	movs r3, #7
	str r1, [sp, #4]
	bl FUN_020830D8
	movs r1, #0x12
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, #8]
	movs r2, #0
	str r0, [sp]
	movs r0, #0x50
	movs r1, #3
	movs r3, #7
	str r2, [sp, #4]
	bl FUN_020830D8
	movs r2, #0x49
	lsls r2, r2, #2
	adds r1, r2, #0
	str r0, [r4, r2]
	movs r0, #0
	adds r1, #0x58
	str r0, [r4, r1]
	adds r2, #0x18
	str r0, [r4, r2]
	bl FUN_02002B8C
	ldr r1, [r4]
	movs r0, #4
	bl FUN_02002CEC
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov53_021E5900

	thumb_func_start ov53_021E5994
ov53_021E5994: @ 0x021E5994
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	movs r6, #0
	cmp r1, #5
	bls _021E59AA
	b _021E5B22
_021E59AA:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E59B6: @ jump table
	.2byte _021E59C2 - _021E59B6 - 2 @ case 0
	.2byte _021E5A56 - _021E59B6 - 2 @ case 1
	.2byte _021E5AA4 - _021E59B6 - 2 @ case 2
	.2byte _021E5AD4 - _021E59B6 - 2 @ case 3
	.2byte _021E5B06 - _021E59B6 - 2 @ case 4
	.2byte _021E5B20 - _021E59B6 - 2 @ case 5
_021E59C2:
	adds r0, r6, #0
	adds r1, r6, #0
	bl FUN_0200FBF4
	movs r0, #1
	adds r1, r6, #0
	bl FUN_0200FBF4
	adds r0, r6, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	adds r0, r6, #0
	adds r1, r0, #0
	bl FUN_0201A120
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5B3C @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5B40 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	adds r0, r4, #0
	bl ov53_021E5BDC
	adds r0, r4, #0
	bl ov53_021E5E6C
	ldr r0, [r4, #0x18]
	movs r1, #4
	bl FUN_0201CAE0
	adds r0, r4, #0
	bl ov53_021E7F24
	adds r0, r4, #0
	bl ov53_021E8014
	movs r0, #0xe
	str r0, [sp]
	ldr r0, [r4]
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r1, #0xe8
	ldr r0, [r4, #0x18]
	ldr r1, [r1]
	movs r2, #6
	movs r3, #4
	bl ov53_021E80F4
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _021E5B44 @ =ov53_021E5BCC
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_02022D24
	movs r0, #1
	str r0, [r5]
	b _021E5B22
_021E5A56:
	bl ov53_021E7ECC
	adds r0, r4, #0
	bl ov53_021E6F9C
	cmp r0, #1
	bne _021E5A80
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #2
	str r0, [r5]
_021E5A80:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021E5B22
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #3
	str r0, [r5]
	b _021E5B22
_021E5AA4:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E5B22
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov53_021E814C
	adds r0, r4, #0
	bl ov53_021E7FEC
	adds r0, r4, #0
	bl ov53_021E5EB8
	adds r0, r4, #0
	bl ov53_021E5DE0
	adds r0, r6, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r6, #1
	b _021E5B22
_021E5AD4:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E5B22
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov53_021E814C
	adds r0, r4, #0
	bl ov53_021E7FEC
	adds r0, r4, #0
	bl ov53_021E5EB8
	adds r0, r4, #0
	bl ov53_021E5DE0
	adds r0, r6, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #4
	str r0, [r5]
	b _021E5B22
_021E5B06:
	ldr r0, [r4, #0x14]
	bl FUN_020072A8
	cmp r0, #1
	bne _021E5B22
	ldr r0, [r4, #0x14]
	bl FUN_02007278
	adds r0, r6, #0
	str r0, [r4, #0x14]
	movs r0, #5
	str r0, [r5]
	b _021E5B22
_021E5B20:
	str r6, [r5]
_021E5B22:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _021E5B34
	adds r4, #0xd4
	ldr r0, [r4]
	cmp r0, #0
	beq _021E5B34
	bl FUN_0200D020
_021E5B34:
	adds r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021E5B3C: .4byte 0xFFFFE0FF
_021E5B40: .4byte 0x04001000
_021E5B44: .4byte ov53_021E5BCC
	thumb_func_end ov53_021E5994

	thumb_func_start ov53_021E5B48
ov53_021E5B48: @ 0x021E5B48
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #4
	ldr r5, [r4]
	bl FUN_02002DB4
	ldr r0, [r4, #4]
	bl FUN_02028E9C
	movs r1, #0x12
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	ldr r1, [r1, #0x18]
	bl FUN_02028F44
	ldr r0, [r4, #4]
	bl FUN_02028E9C
	movs r1, #0x12
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	ldr r1, [r1, #4]
	bl FUN_02028F90
	ldr r0, [r4, #4]
	bl FUN_0202A954
	movs r1, #0x49
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	ldr r1, [r1, #0x18]
	bl FUN_0202A9B0
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0208311C
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0208311C
	adds r0, r6, #0
	bl FUN_02007294
	adds r0, r5, #0
	bl FUN_0201A9C4
	ldr r0, _021E5BC4 @ =0x00000024
	ldr r1, _021E5BC8 @ =0x021E5C14
	bl FUN_02000EF4
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #1
	pop {r4, r5, r6, pc}
	nop
_021E5BC4: .4byte 0x00000024
_021E5BC8: .4byte 0x021E5C14
	thumb_func_end ov53_021E5B48

	thumb_func_start ov53_021E5BCC
ov53_021E5BCC: @ 0x021E5BCC
	push {r3, lr}
	ldr r0, [r0, #0x18]
	bl FUN_0201EEB4
	bl FUN_0200D034
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov53_021E5BCC

	thumb_func_start ov53_021E5BDC
ov53_021E5BDC: @ 0x021E5BDC
	push {r3, r4, r5, lr}
	sub sp, #0x78
	ldr r5, _021E5DC8 @ =0x021E8628
	adds r4, r0, #0
	add r3, sp, #0x50
	movs r2, #5
_021E5BE8:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5BE8
	add r0, sp, #0x50
	bl FUN_02022BE8
	ldr r0, [r4]
	bl FUN_0201AC88
	add r3, sp, #0x40
	ldr r5, _021E5DCC @ =0x021E8548
	str r0, [r4, #0x18]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E5DD0 @ =0x021E85CC
	add r3, sp, #0x24
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
	movs r0, #0xf
	strb r0, [r2, #0x12]
	movs r0, #6
	strb r0, [r2, #0x13]
	ldr r0, [r4, #0x18]
	adds r3, r1, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x18]
	movs r1, #0
	bl FUN_0201CAE0
	movs r0, #0xe
	add r2, sp, #0x24
	strb r0, [r2, #0x12]
	movs r0, #5
	strb r0, [r2, #0x13]
	ldr r0, [r4, #0x18]
	movs r1, #1
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x18]
	movs r1, #1
	bl FUN_0201CAE0
	movs r0, #0xd
	add r2, sp, #0x24
	strb r0, [r2, #0x12]
	movs r0, #4
	strb r0, [r2, #0x13]
	ldr r0, [r4, #0x18]
	movs r1, #2
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x18]
	movs r1, #2
	bl FUN_0201CAE0
	movs r0, #0xc
	add r2, sp, #0x24
	strb r0, [r2, #0x12]
	movs r1, #3
	strb r1, [r2, #0x13]
	ldr r0, [r4, #0x18]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x18]
	movs r1, #3
	bl FUN_0201CAE0
	movs r1, #0
	str r1, [sp]
	ldr r0, [r4]
	ldr r2, _021E5DD4 @ =0x000003E2
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	movs r3, #4
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	ldr r0, [r4]
	ldr r2, _021E5DD8 @ =0x000003D9
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	movs r3, #3
	bl FUN_0200E3DC
	ldr r2, [r4]
	movs r0, #0
	movs r1, #0xa0
	bl FUN_02003030
	ldr r2, [r4]
	movs r0, #0
	movs r1, #0xc0
	bl FUN_0200304C
	ldr r5, _021E5DDC @ =0x021E85E8
	add r3, sp, #8
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #0xf
	str r0, [r3]
	add r0, sp, #8
	strb r1, [r0, #0x12]
	movs r1, #6
	strb r1, [r0, #0x13]
	ldr r0, [r4, #0x18]
	movs r1, #4
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x18]
	movs r1, #4
	bl FUN_0201CAE0
	movs r1, #0xe
	add r0, sp, #8
	strb r1, [r0, #0x12]
	movs r1, #5
	strb r1, [r0, #0x13]
	ldr r0, [r4, #0x18]
	add r2, sp, #8
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x18]
	movs r1, #5
	bl FUN_0201CAE0
	movs r1, #0xd
	add r0, sp, #8
	strb r1, [r0, #0x12]
	movs r1, #4
	strb r1, [r0, #0x13]
	ldr r0, [r4, #0x18]
	movs r1, #6
	add r2, sp, #8
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x18]
	movs r1, #6
	bl FUN_0201CAE0
	movs r1, #0xc
	add r0, sp, #8
	strb r1, [r0, #0x12]
	movs r1, #3
	strb r1, [r0, #0x13]
	ldr r0, [r4, #0x18]
	movs r1, #7
	add r2, sp, #8
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x18]
	movs r1, #7
	bl FUN_0201CAE0
	movs r0, #7
	movs r1, #3
	bl FUN_0201BB68
	movs r1, #7
	ldr r2, [r4]
	movs r0, #4
	lsls r1, r1, #6
	bl FUN_02003030
	ldr r3, [r4]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201BC28
	movs r0, #1
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #2
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #3
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #4
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #5
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #6
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #7
	movs r1, #0
	bl FUN_0201BC28
	adds r0, r4, #0
	bl ov53_021E65E0
	movs r0, #0x4a
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	add sp, #0x78
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5DC8: .4byte 0x021E8628
_021E5DCC: .4byte 0x021E8548
_021E5DD0: .4byte 0x021E85CC
_021E5DD4: .4byte 0x000003E2
_021E5DD8: .4byte 0x000003D9
_021E5DDC: .4byte 0x021E85E8
	thumb_func_end ov53_021E5BDC

	thumb_func_start ov53_021E5DE0
ov53_021E5DE0: @ 0x021E5DE0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201BC28
	movs r0, #1
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #2
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #3
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #4
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #5
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #6
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #7
	movs r1, #0
	bl FUN_0201BC28
	ldr r0, [r4, #0x18]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r4, #0x18]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x18]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0x18]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x18]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4, #0x18]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [r4, #0x18]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [r4, #0x18]
	movs r1, #7
	bl FUN_0201BB4C
	ldr r0, [r4, #0x18]
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov53_021E5DE0

	thumb_func_start ov53_021E5E6C
ov53_021E5E6C: @ 0x021E5E6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xdb
	bl FUN_0200BAF8
	movs r1, #1
	lsls r1, r1, #8
	str r0, [r4, r1]
	bl FUN_02020080
	movs r0, #0
	ldr r3, [r4]
	adds r1, r0, #0
	movs r2, #6
	bl FUN_020163E0
	movs r1, #0x45
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	bl FUN_0200BD08
	movs r1, #0x46
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	movs r2, #0
	subs r0, #0x14
	str r2, [r4, r0]
	subs r1, #0x10
	str r2, [r4, r1]
	adds r4, #0x80
	str r2, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov53_021E5E6C

	thumb_func_start ov53_021E5EB8
ov53_021E5EB8: @ 0x021E5EB8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x46
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	movs r0, #0x45
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020164C4
	movs r0, #1
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	pop {r4, pc}
	thumb_func_end ov53_021E5EB8

	thumb_func_start ov53_021E5EDC
ov53_021E5EDC: @ 0x021E5EDC
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r3, r0, #0
	adds r6, r2, #0
	movs r7, #0
	cmp r4, #0x65
	bgt _021E5F0A
	bge _021E5F32
	cmp r4, #6
	bhi _021E5F0E
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5EFC: @ jump table
	.2byte _021E5F0E - _021E5EFC - 2 @ case 0
	.2byte _021E5F14 - _021E5EFC - 2 @ case 1
	.2byte _021E5F1A - _021E5EFC - 2 @ case 2
	.2byte _021E5F0E - _021E5EFC - 2 @ case 3
	.2byte _021E5F20 - _021E5EFC - 2 @ case 4
	.2byte _021E5F26 - _021E5EFC - 2 @ case 5
	.2byte _021E5F2C - _021E5EFC - 2 @ case 6
_021E5F0A:
	cmp r4, #0x66
	beq _021E5F38
_021E5F0E:
	movs r1, #1
	movs r0, #0
	b _021E5F3C
_021E5F14:
	movs r1, #2
	adds r0, r7, #0
	b _021E5F3C
_021E5F1A:
	movs r1, #4
	adds r0, r7, #0
	b _021E5F3C
_021E5F20:
	movs r1, #1
	adds r0, r1, #0
	b _021E5F3C
_021E5F26:
	movs r1, #2
	movs r0, #1
	b _021E5F3C
_021E5F2C:
	movs r1, #4
	movs r0, #1
	b _021E5F3C
_021E5F32:
	movs r1, #0x10
	adds r0, r7, #0
	b _021E5F3C
_021E5F38:
	movs r1, #0x10
	movs r0, #1
_021E5F3C:
	movs r5, #0x4a
	lsls r5, r5, #2
	ldr r2, [r3, r5]
	cmp r2, #3
	bls _021E5F48
	b _021E60BE
_021E5F48:
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_021E5F54: @ jump table
	.2byte _021E5F5C - _021E5F54 - 2 @ case 0
	.2byte _021E5FDC - _021E5F54 - 2 @ case 1
	.2byte _021E6034 - _021E5F54 - 2 @ case 2
	.2byte _021E60B0 - _021E5F54 - 2 @ case 3
_021E5F5C:
	cmp r6, #0
	bne _021E5FC8
	movs r6, #0
	adds r2, r5, #4
	str r6, [r3, r2]
	adds r2, r5, #0
	movs r6, #0x10
	adds r2, #8
	str r6, [r3, r2]
	movs r2, #1
	str r2, [r3, r5]
	cmp r0, #0
	bne _021E5F8C
	adds r0, r5, #0
	adds r0, #8
	ldr r0, [r3, r0]
	adds r5, r5, #4
	str r0, [sp]
	ldr r0, _021E60C4 @ =0x04000050
	ldr r3, [r3, r5]
	movs r2, #0xe
	blx FUN_020CF15C
	b _021E5FA0
_021E5F8C:
	adds r0, r5, #0
	adds r0, #8
	ldr r0, [r3, r0]
	adds r5, r5, #4
	str r0, [sp]
	ldr r0, _021E60C8 @ =0x04001050
	ldr r3, [r3, r5]
	movs r2, #0xe
	blx FUN_020CF15C
_021E5FA0:
	cmp r4, #0x65
	bne _021E5FAE
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	b _021E60BE
_021E5FAE:
	cmp r4, #0x66
	bne _021E5FBC
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	b _021E60BE
_021E5FBC:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl FUN_0201BC28
	b _021E60BE
_021E5FC8:
	movs r1, #0x10
	adds r0, r5, #4
	str r1, [r3, r0]
	adds r0, r5, #0
	movs r1, #0
	adds r0, #8
	str r1, [r3, r0]
	movs r0, #2
	str r0, [r3, r5]
	b _021E60BE
_021E5FDC:
	adds r2, r5, #0
	adds r2, #8
	ldr r2, [r3, r2]
	cmp r2, #0
	beq _021E602E
	adds r2, r5, #4
	ldr r2, [r3, r2]
	adds r4, r2, #1
	adds r2, r5, #4
	str r4, [r3, r2]
	adds r2, r5, #0
	adds r2, #8
	ldr r2, [r3, r2]
	subs r4, r2, #1
	adds r2, r5, #0
	adds r2, #8
	str r4, [r3, r2]
	cmp r0, #0
	bne _021E6018
	adds r0, r5, #0
	adds r0, #8
	ldr r0, [r3, r0]
	adds r4, r5, #4
	str r0, [sp]
	ldr r0, _021E60C4 @ =0x04000050
	ldr r3, [r3, r4]
	movs r2, #0xe
	blx FUN_020CF15C
	b _021E60BE
_021E6018:
	adds r0, r5, #0
	adds r0, #8
	ldr r0, [r3, r0]
	adds r4, r5, #4
	str r0, [sp]
	ldr r0, _021E60C8 @ =0x04001050
	ldr r3, [r3, r4]
	movs r2, #0xe
	blx FUN_020CF15C
	b _021E60BE
_021E602E:
	movs r0, #3
	str r0, [r3, r5]
	b _021E60BE
_021E6034:
	adds r2, r5, #4
	ldr r2, [r3, r2]
	cmp r2, #0
	beq _021E6084
	adds r2, r5, #4
	ldr r2, [r3, r2]
	subs r4, r2, #1
	adds r2, r5, #4
	str r4, [r3, r2]
	adds r2, r5, #0
	adds r2, #8
	ldr r2, [r3, r2]
	adds r4, r2, #1
	adds r2, r5, #0
	adds r2, #8
	str r4, [r3, r2]
	cmp r0, #0
	bne _021E606E
	adds r0, r5, #0
	adds r0, #8
	ldr r0, [r3, r0]
	adds r4, r5, #4
	str r0, [sp]
	ldr r0, _021E60C4 @ =0x04000050
	ldr r3, [r3, r4]
	movs r2, #0xe
	blx FUN_020CF15C
	b _021E60BE
_021E606E:
	adds r0, r5, #0
	adds r0, #8
	ldr r0, [r3, r0]
	adds r4, r5, #4
	str r0, [sp]
	ldr r0, _021E60C8 @ =0x04001050
	ldr r3, [r3, r4]
	movs r2, #0xe
	blx FUN_020CF15C
	b _021E60BE
_021E6084:
	movs r0, #3
	str r0, [r3, r5]
	cmp r4, #0x65
	bne _021E6096
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022C60
	b _021E60BE
_021E6096:
	cmp r4, #0x66
	bne _021E60A4
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022CC8
	b _021E60BE
_021E60A4:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl FUN_0201BC28
	b _021E60BE
_021E60B0:
	ldr r0, _021E60C4 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r0, _021E60C8 @ =0x04001050
	movs r7, #1
	strh r1, [r0]
	str r1, [r3, r5]
_021E60BE:
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E60C4: .4byte 0x04000050
_021E60C8: .4byte 0x04001050
	thumb_func_end ov53_021E5EDC

	thumb_func_start ov53_021E60CC
ov53_021E60CC: @ 0x021E60CC
	movs r2, #0x4f
	lsls r2, r2, #2
	ldr r3, [r0, r2]
	cmp r3, r1
	bge _021E60DE
	adds r1, r3, #1
	str r1, [r0, r2]
	movs r0, #0
	bx lr
_021E60DE:
	movs r1, #0
	str r1, [r0, r2]
	movs r0, #1
	bx lr
	.align 2, 0
	thumb_func_end ov53_021E60CC

	thumb_func_start ov53_021E60E8
ov53_021E60E8: @ 0x021E60E8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	lsls r0, r2, #0x18
	adds r4, r1, #0
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsls r1, r4, #0x18
	movs r2, #0
	ldr r0, [r5, #0x18]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201CA4C
	lsls r1, r4, #0x18
	ldr r0, [r5, #0x18]
	lsrs r1, r1, #0x18
	bl FUN_0201BF7C
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov53_021E60E8

	thumb_func_start ov53_021E611C
ov53_021E611C: @ 0x021E611C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r1, #0
	movs r1, #0x41
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	movs r4, #0
	cmp r0, #0
	beq _021E613C
	cmp r0, #1
	beq _021E621C
	cmp r0, #2
	bne _021E613A
	b _021E6240
_021E613A:
	b _021E6274
_021E613C:
	adds r1, r5, #0
	ldr r0, [r5, #0x18]
	ldr r2, _021E627C @ =0x021E8500
	adds r1, #0x2c
	bl FUN_0201D4F8
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	adds r0, #0x2c
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	adds r0, r5, #0
	ldr r2, _021E6280 @ =0x000003E2
	adds r0, #0x2c
	adds r1, r4, #0
	movs r3, #4
	bl FUN_0200E998
	movs r0, #1
	bl FUN_02002B34
	adds r0, r4, #0
	bl FUN_02002B50
	movs r0, #1
	ldr r1, [r5]
	lsls r0, r0, #0xa
	bl FUN_02026354
	adds r6, r0, #0
	movs r0, #1
	ldr r1, [r5]
	lsls r0, r0, #0xa
	bl FUN_02026354
	movs r1, #0x11
	lsls r1, r1, #4
	str r0, [r5, r1]
	subs r1, #0x10
	ldr r0, [r5, r1]
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_0200BB6C
	movs r3, #0x46
	movs r0, #1
	lsls r3, r3, #2
	str r0, [sp]
	movs r0, #2
	adds r2, r3, #0
	str r0, [sp, #4]
	adds r2, #8
	ldr r0, [r5, r3]
	ldr r2, [r5, r2]
	adds r3, #0x1c
	ldrh r3, [r5, r3]
	ldr r2, [r2, #0x18]
	adds r1, r4, #0
	bl FUN_0200BE3C
	movs r1, #1
	movs r2, #0x46
	str r1, [sp]
	movs r0, #2
	lsls r2, r2, #2
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	adds r2, #0xc
	ldr r2, [r5, r2]
	adds r3, r4, #0
	ldr r2, [r2, #0x18]
	bl FUN_0200BE3C
	movs r1, #0x46
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	subs r1, #8
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, [r5, #8]
	bl FUN_0202AD3C
	adds r3, r4, #0
	str r3, [sp]
	str r0, [sp, #4]
	movs r2, #0x11
	adds r0, r5, #0
	str r3, [sp, #8]
	lsls r2, r2, #4
	ldr r2, [r5, r2]
	adds r0, #0x2c
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0x43
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #1
	subs r1, #8
	str r0, [r5, r1]
	b _021E6274
_021E621C:
	adds r1, #8
	ldr r0, [r5, r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _021E6274
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02026380
	movs r0, #0x41
	movs r1, #2
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _021E6274
_021E6240:
	cmp r2, #0
	bne _021E625E
	ldr r0, _021E6284 @ =0x021D110C
	ldr r2, [r0, #0x48]
	movs r0, #1
	ands r0, r2
	cmp r0, #1
	bne _021E6260
	ldr r0, _021E6288 @ =0x000005DC
	adds r1, #0x68
	str r4, [r5, r1]
	bl FUN_0200604C
	movs r4, #1
	b _021E6260
_021E625E:
	movs r4, #1
_021E6260:
	cmp r4, #0
	beq _021E6274
	adds r0, r5, #0
	adds r0, #0x2c
	bl FUN_0201D520
	movs r0, #0x41
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_021E6274:
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E627C: .4byte 0x021E8500
_021E6280: .4byte 0x000003E2
_021E6284: .4byte 0x021D110C
_021E6288: .4byte 0x000005DC
	thumb_func_end ov53_021E611C

	thumb_func_start ov53_021E628C
ov53_021E628C: @ 0x021E628C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r1, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	movs r1, #0x42
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r5, r2, #0
	adds r7, r3, #0
	ldr r6, [sp, #0x38]
	cmp r1, #5
	bls _021E62AA
	b _021E6490
_021E62AA:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E62B6: @ jump table
	.2byte _021E62C2 - _021E62B6 - 2 @ case 0
	.2byte _021E63F6 - _021E62B6 - 2 @ case 1
	.2byte _021E6406 - _021E62B6 - 2 @ case 2
	.2byte _021E6428 - _021E62B6 - 2 @ case 3
	.2byte _021E6460 - _021E62B6 - 2 @ case 4
	.2byte _021E6476 - _021E62B6 - 2 @ case 5
_021E62C2:
	ldr r0, [sp, #0x14]
	adds r1, r0, #0
	bl FUN_0201BC28
	movs r0, #1
	ldr r1, [r4]
	lsls r0, r0, #0xa
	bl FUN_02026354
	movs r2, #0x11
	lsls r2, r2, #4
	str r0, [r4, r2]
	adds r0, r2, #0
	subs r0, #0x10
	ldr r0, [r4, r0]
	ldr r1, [sp, #0x10]
	ldr r2, [r4, r2]
	bl FUN_0200BB6C
	ldr r0, _021E6498 @ =0x0000FFFF
	cmp r7, r0
	bne _021E6304
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02026820
	lsls r1, r0, #1
	movs r0, #0x18
	subs r1, r0, r1
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r7, r0, #1
_021E6304:
	ldr r0, _021E6498 @ =0x0000FFFF
	cmp r6, r0
	bne _021E6316
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02026820
	lsls r6, r0, #1
_021E6316:
	cmp r5, #3
	bhi _021E63E2
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E6326: @ jump table
	.2byte _021E6384 - _021E6326 - 2 @ case 0
	.2byte _021E632E - _021E6326 - 2 @ case 1
	.2byte _021E6384 - _021E6326 - 2 @ case 2
	.2byte _021E6384 - _021E6326 - 2 @ case 3
_021E632E:
	ldr r1, _021E649C @ =_021E84F8
	add r0, sp, #0x18
	ldrh r3, [r1, #0x28]
	add r2, sp, #0x18
	strh r3, [r0]
	ldrh r3, [r1, #0x2a]
	strh r3, [r0, #2]
	ldrh r3, [r1, #0x2c]
	ldrh r1, [r1, #0x2e]
	strh r3, [r0, #4]
	strh r1, [r0, #6]
	strb r7, [r0, #2]
	strb r6, [r0, #4]
	adds r1, r4, #0
	ldr r0, [r4, #0x18]
	adds r1, #0x1c
	bl FUN_0201D4F8
	movs r1, #0
	movs r0, #0xc0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x1c
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201DA74
	movs r1, #0
	str r1, [sp]
	movs r2, #0x11
	ldr r0, _021E64A0 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	str r1, [sp, #0xc]
	lsls r2, r2, #4
	ldr r2, [r4, r2]
	adds r0, #0x1c
	adds r3, r1, #0
	bl FUN_020200FC
	b _021E63E2
_021E6384:
	ldr r1, _021E649C @ =_021E84F8
	add r0, sp, #0x18
	ldrh r2, [r1, #0x30]
	cmp r5, #3
	strh r2, [r0]
	ldrh r2, [r1, #0x32]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x34]
	ldrh r1, [r1, #0x36]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	strb r7, [r0, #2]
	strb r6, [r0, #4]
	bne _021E63A6
	ldrb r1, [r0, #1]
	adds r1, r1, #4
	strb r1, [r0, #1]
_021E63A6:
	adds r1, r4, #0
	ldr r0, [r4, #0x18]
	adds r1, #0x1c
	add r2, sp, #0x18
	bl FUN_0201D4F8
	movs r1, #0
	movs r0, #0xc0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x1c
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201DA74
	movs r1, #0
	str r1, [sp]
	movs r2, #0x11
	ldr r0, _021E64A4 @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	str r1, [sp, #0xc]
	lsls r2, r2, #4
	ldr r2, [r4, r2]
	adds r0, #0x1c
	adds r3, r1, #0
	bl FUN_020200FC
_021E63E2:
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x42
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _021E6490
_021E63F6:
	adds r0, #0x1c
	bl FUN_0201D578
	movs r0, #0x42
	movs r1, #2
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _021E6490
_021E6406:
	ldr r1, [sp, #0x14]
	adds r2, r1, #0
	bl ov53_021E5EDC
	cmp r0, #1
	bne _021E6490
	movs r0, #0x42
	movs r1, #3
	lsls r0, r0, #2
	str r1, [r4, r0]
	cmp r5, #2
	bne _021E6490
	movs r1, #4
	str r1, [r4, r0]
	movs r0, #1
	str r0, [sp, #0x14]
	b _021E6490
_021E6428:
	ldr r0, _021E64A8 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	ands r0, r1
	cmp r0, #1
	beq _021E643C
	movs r0, #2
	ands r0, r1
	cmp r0, #2
	bne _021E6490
_021E643C:
	ldr r0, _021E64AC @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021E6448
	movs r1, #1
	b _021E644A
_021E6448:
	movs r1, #0
_021E644A:
	movs r0, #0x5b
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _021E64B0 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x42
	movs r1, #4
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _021E6490
_021E6460:
	ldr r1, [sp, #0x14]
	movs r2, #1
	bl ov53_021E5EDC
	cmp r0, #1
	bne _021E6490
	movs r0, #0x42
	movs r1, #5
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _021E6490
_021E6476:
	adds r0, #0x1c
	bl FUN_0201D520
	ldr r0, [r4, #0x18]
	movs r1, #0
	bl FUN_0201CAE0
	movs r0, #0x42
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #1
	str r0, [sp, #0x14]
_021E6490:
	ldr r0, [sp, #0x14]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6498: .4byte 0x0000FFFF
_021E649C: .4byte _021E84F8
_021E64A0: .4byte 0x00010200
_021E64A4: .4byte 0x000F0200
_021E64A8: .4byte 0x021D110C
_021E64AC: .4byte 0x021D114C
_021E64B0: .4byte 0x000005DC
	thumb_func_end ov53_021E628C

	thumb_func_start ov53_021E64B4
ov53_021E64B4: @ 0x021E64B4
	push {r3, lr}
	ldr r3, _021E64C0 @ =0x0000FFFF
	str r3, [sp]
	bl ov53_021E628C
	pop {r3, pc}
	.align 2, 0
_021E64C0: .4byte 0x0000FFFF
	thumb_func_end ov53_021E64B4

	thumb_func_start ov53_021E64C4
ov53_021E64C4: @ 0x021E64C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r7, r0, #0
	ldr r0, [sp, #0x48]
	str r1, [sp, #0x28]
	str r2, [sp, #0x2c]
	str r3, [sp, #0x30]
	str r0, [sp, #0x48]
	str r0, [r7, #0x7c]
	cmp r0, #2
	bne _021E64DE
	movs r0, #4
	str r0, [sp, #0x10]
_021E64DE:
	ldr r0, [sp, #0x48]
	cmp r0, #3
	bne _021E64E8
	movs r0, #8
	str r0, [sp, #0x10]
_021E64E8:
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x48]
	cmp r0, #0
	ble _021E65A6
	add r0, sp, #0x28
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x48]
	adds r4, r7, #0
	subs r1, r0, #2
	movs r0, #0x18
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, _021E65AC @ =0x021E8680
	adds r4, #0x3c
	adds r0, r0, r2
	str r0, [sp, #0x18]
	str r0, [sp, #0x14]
_021E650C:
	movs r0, #1
	ldr r1, [r7]
	lsls r0, r0, #0xa
	bl FUN_02026354
	adds r6, r0, #0
	movs r0, #1
	ldr r1, [sp, #0x24]
	lsls r0, r0, #8
	ldr r0, [r7, r0]
	ldr r1, [r1]
	adds r2, r6, #0
	bl FUN_0200BB6C
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	str r0, [sp, #0x20]
	ldr r0, [r7, #0x18]
	ldr r2, [sp, #0x18]
	adds r1, r4, #0
	bl FUN_0201D4F8
	movs r1, #0
	movs r0, #0xc0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201DA74
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x14]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _021E65B0 @ =0x000F0100
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r3, #3]
	adds r0, r4, #0
	adds r2, r6, #0
	lsls r5, r3, #3
	ldr r3, [sp, #0x20]
	subs r5, r5, r3
	lsrs r3, r5, #0x1f
	adds r3, r5, r3
	asrs r3, r3, #1
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_0201D578
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, [sp, #0x24]
	adds r4, #0x10
	adds r0, r0, #4
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	adds r0, #8
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	adds r0, #8
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	adds r1, r0, #1
	ldr r0, [sp, #0x48]
	str r1, [sp, #0x1c]
	cmp r1, r0
	blt _021E650C
_021E65A6:
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021E65AC: .4byte 0x021E8680
_021E65B0: .4byte 0x000F0100
	thumb_func_end ov53_021E64C4

	thumb_func_start ov53_021E65B4
ov53_021E65B4: @ 0x021E65B4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x7c]
	movs r4, #0
	cmp r0, #0
	ble _021E65D4
	adds r5, r6, #0
	adds r5, #0x3c
_021E65C4:
	adds r0, r5, #0
	bl FUN_0201D520
	ldr r0, [r6, #0x7c]
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, r0
	blt _021E65C4
_021E65D4:
	ldr r0, [r6, #0x18]
	movs r1, #0
	bl FUN_0201CAE0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov53_021E65B4

	thumb_func_start ov53_021E65E0
ov53_021E65E0: @ 0x021E65E0
	push {r4, r5, lr}
	sub sp, #0x14
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r5, r0, #0
	str r1, [sp, #8]
	ldr r0, [r5]
	movs r3, #3
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	movs r0, #0x78
	bl FUN_020078F0
	movs r0, #0
	ldr r3, [r5]
	movs r1, #0x20
	adds r2, r0, #0
	bl FUN_0201C1C4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0x20
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	movs r0, #0x78
	movs r3, #7
	bl FUN_020078F0
	ldr r0, _021E66A0 @ =0x020F566C
	ldrb r0, [r0]
	cmp r0, #7
	bne _021E662E
	movs r1, #1
	movs r4, #0x1e
	b _021E6632
_021E662E:
	movs r1, #2
	movs r4, #0x1f
_021E6632:
	movs r0, #0x60
	str r0, [sp]
	ldr r0, [r5]
	movs r2, #0
	str r0, [sp, #4]
	movs r0, #0x78
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0xa0
	str r0, [sp]
	ldr r0, [r5]
	adds r1, r4, #0
	str r0, [sp, #4]
	movs r0, #0x78
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	ldr r3, [r5]
	movs r0, #0x78
	adds r1, r4, #0
	add r2, sp, #0x10
	bl FUN_020079F4
	ldr r1, [sp, #0x10]
	ldr r1, [r1, #0xc]
	ldrh r2, [r1, #0x18]
	ldr r1, _021E66A4 @ =0x00000136
	strh r2, [r5, r1]
	bl FUN_0201AB0C
	adds r0, r5, #0
	movs r1, #1
	bl ov53_021E66A8
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov53_021E66E8
	adds r0, r5, #0
	movs r1, #0
	bl ov53_021E67C4
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201C2D8
	movs r0, #4
	movs r1, #0
	bl FUN_0201C2D8
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_021E66A0: .4byte 0x020F566C
_021E66A4: .4byte 0x00000136
	thumb_func_end ov53_021E65E0

	thumb_func_start ov53_021E66A8
ov53_021E66A8: @ 0x021E66A8
	push {r4, r5, r6, lr}
	sub sp, #0x28
	ldr r6, _021E66E4 @ =0x021E856C
	add r5, sp, #0x10
	adds r4, r0, #0
	adds r3, r1, #0
	adds r2, r5, #0
	ldm r6!, {r0, r1}
	stm r5!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r5!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r5!, {r0, r1}
	cmp r3, #6
	bge _021E66E0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	lsls r1, r3, #2
	str r0, [sp, #0xc]
	ldr r1, [r2, r1]
	ldr r2, [r4, #0x18]
	movs r0, #0x78
	movs r3, #3
	bl FUN_02007914
_021E66E0:
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E66E4: .4byte 0x021E856C
	thumb_func_end ov53_021E66A8

	thumb_func_start ov53_021E66E8
ov53_021E66E8: @ 0x021E66E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	ldr r6, _021E67C0 @ =0x021E86F0
	adds r4, r2, #0
	adds r5, r0, #0
	adds r7, r1, #0
	add r3, sp, #0x10
	movs r2, #0xa
_021E66F8:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E66F8
	cmp r7, #0
	beq _021E675C
	cmp r4, #0xc
	bge _021E675C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	lsls r6, r7, #3
	str r0, [sp, #0xc]
	add r1, sp, #0x10
	ldr r1, [r1, r6]
	ldr r2, [r5, #0x18]
	movs r0, #0x78
	movs r3, #1
	bl FUN_020078F0
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r5]
	add r1, sp, #0x14
	str r0, [sp, #4]
	ldr r1, [r1, r6]
	movs r0, #0x78
	movs r2, #0
	movs r3, #0xe0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #9
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	movs r0, #0x78
	movs r3, #1
	bl FUN_02007914
	adds r0, r5, #0
	movs r1, #1
	movs r2, #7
	bl ov53_021E60E8
_021E675C:
	cmp r4, #0
	beq _021E67BA
	cmp r4, #0xc
	bge _021E67BA
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	lsls r4, r4, #3
	str r0, [sp, #0xc]
	add r1, sp, #0x10
	ldr r1, [r1, r4]
	ldr r2, [r5, #0x18]
	movs r0, #0x78
	movs r3, #2
	bl FUN_020078F0
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r5]
	add r1, sp, #0x14
	str r0, [sp, #4]
	movs r0, #0x78
	adds r3, r0, #0
	ldr r1, [r1, r4]
	movs r2, #0
	adds r3, #0x88
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #9
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	movs r0, #0x78
	movs r3, #2
	bl FUN_02007914
	adds r0, r5, #0
	movs r1, #2
	movs r2, #8
	bl ov53_021E60E8
_021E67BA:
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E67C0: .4byte 0x021E86F0
	thumb_func_end ov53_021E66E8

	thumb_func_start ov53_021E67C4
ov53_021E67C4: @ 0x021E67C4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	ldr r6, _021E6820 @ =0x021E8558
	add r3, sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	adds r2, r3, #0
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	cmp r4, #5
	str r0, [r3]
	bge _021E681C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	lsls r1, r4, #2
	str r0, [sp, #0xc]
	ldr r1, [r2, r1]
	ldr r2, [r5, #0x18]
	movs r0, #0x78
	movs r3, #7
	bl FUN_02007914
	cmp r4, #1
	bne _021E680E
	adds r0, r5, #0
	movs r1, #7
	movs r2, #3
	bl ov53_021E60E8
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
_021E680E:
	cmp r4, #2
	bne _021E681C
	adds r0, r5, #0
	movs r1, #7
	movs r2, #2
	bl ov53_021E60E8
_021E681C:
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E6820: .4byte 0x021E8558
	thumb_func_end ov53_021E67C4

	thumb_func_start ov53_021E6824
ov53_021E6824: @ 0x021E6824
	push {r4, r5, r6, lr}
	sub sp, #0x28
	ldr r4, _021E6904 @ =0x021E8584
	add r3, sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	lsls r4, r6, #3
	str r0, [sp, #0xc]
	ldr r1, [r2, r4]
	ldr r2, [r5, #0x18]
	movs r0, #0x78
	movs r3, #6
	bl FUN_02007914
	adds r0, r5, #0
	movs r1, #6
	movs r2, #7
	bl ov53_021E60E8
	movs r0, #0x60
	str r0, [sp]
	ldr r0, [r5]
	movs r1, #0x21
	str r0, [sp, #4]
	movs r0, #0x78
	movs r2, #4
	movs r3, #0xe0
	bl FUN_02007938
	ldr r3, [r5]
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	add r1, sp, #0x14
	str r0, [sp, #0xc]
	ldr r1, [r1, r4]
	ldr r2, [r5, #0x18]
	movs r0, #0x78
	movs r3, #6
	bl FUN_020078F0
	ldr r0, [r5, #0x18]
	movs r1, #5
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	cmp r6, #1
	bne _021E6900
	movs r0, #0x4d
	lsls r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	ldr r0, [r5, #0x18]
	bne _021E68DE
	movs r1, #4
	movs r2, #0
	movs r3, #0x88
	bl FUN_0201F238
	ldr r0, [r5, #0x18]
	movs r1, #6
	movs r2, #0
	movs r3, #0x88
	bl FUN_0201F238
	ldr r0, [r5, #0x18]
	movs r1, #5
	movs r2, #0
	movs r3, #0x88
	bl FUN_0201F238
	add sp, #0x28
	pop {r4, r5, r6, pc}
_021E68DE:
	movs r2, #0
	movs r1, #4
	adds r3, r2, #0
	bl FUN_0201F238
	movs r2, #0
	ldr r0, [r5, #0x18]
	movs r1, #6
	adds r3, r2, #0
	bl FUN_0201F238
	movs r2, #0
	ldr r0, [r5, #0x18]
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0201F238
_021E6900:
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E6904: .4byte 0x021E8584
	thumb_func_end ov53_021E6824

	thumb_func_start ov53_021E6908
ov53_021E6908: @ 0x021E6908
	lsls r2, r1, #4
	ldr r1, _021E6924 @ =0x021E86B4
	movs r3, #0
	strb r3, [r0, #3]
	ldr r1, [r1, r2]
	strb r3, [r0]
	strb r1, [r0, #1]
	strb r3, [r0, #6]
	strb r3, [r0, #4]
	movs r1, #0x10
	strb r1, [r0, #5]
	strb r3, [r0, #2]
	bx lr
	nop
_021E6924: .4byte 0x021E86B4
	thumb_func_end ov53_021E6908

	thumb_func_start ov53_021E6928
ov53_021E6928: @ 0x021E6928
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r3, _021E6980 @ =0x021E86B4
	movs r2, #0x16
	lsls r1, r1, #4
	adds r4, r0, #0
	movs r0, #0
	lsls r2, r2, #4
	ldr r5, [r3, r1]
	strb r0, [r4, r2]
	adds r3, r2, #1
	strb r5, [r4, r3]
	adds r3, r2, #4
	strb r0, [r4, r3]
	movs r3, #0x10
	adds r2, r2, #5
	strb r3, [r4, r2]
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r2, _021E6984 @ =0x021E86B0
	str r0, [sp, #0xc]
	ldr r1, [r2, r1]
	ldr r2, [r4, #0x18]
	movs r0, #0x78
	movs r3, #5
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #0x2a
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x18]
	movs r0, #0x78
	movs r3, #5
	bl FUN_020078F0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E6980: .4byte 0x021E86B4
_021E6984: .4byte 0x021E86B0
	thumb_func_end ov53_021E6928

	thumb_func_start ov53_021E6988
ov53_021E6988: @ 0x021E6988
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	movs r7, #0
	adds r4, r1, #0
	ldr r3, _021E6B80 @ =0x021E8650
	adds r5, r0, #0
	mvns r7, r7
	add r2, sp, #0
	movs r1, #0x30
_021E699A:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _021E699A
	ldr r6, _021E6B84 @ =0x00000166
	ldrb r0, [r5, r6]
	cmp r0, #0
	beq _021E69C2
	adds r0, r0, #1
	strb r0, [r5, r6]
	ldrb r0, [r5, r6]
	cmp r0, #0x14
	bls _021E69DE
	movs r0, #0
	strb r0, [r5, r6]
	subs r0, r6, #3
	ldrb r7, [r5, r0]
	b _021E6B30
_021E69C2:
	ldr r0, _021E6B88 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021E6A22
	add r1, sp, #0
	lsls r0, r4, #4
	adds r0, r1, r0
	bl FUN_02025224
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	bne _021E69E0
_021E69DE:
	b _021E6B30
_021E69E0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov53_021E6928
	movs r0, #5
	movs r1, #1
	bl FUN_0201BC28
	ldr r0, _021E6B8C @ =0x00000163
	movs r3, #0xc
	strb r6, [r5, r0]
	muls r3, r4, r3
	ldr r4, _021E6B8C @ =0x00000163
	ldr r6, _021E6B90 @ =0x021E8604
	ldrb r4, [r5, r4]
	adds r3, r6, r3
	ldr r0, [r5, #0x18]
	lsls r4, r4, #2
	ldr r3, [r4, r3]
	movs r1, #5
	movs r2, #3
	bl FUN_0201F238
	ldr r0, _021E6B84 @ =0x00000166
	movs r1, #1
	strb r1, [r5, r0]
	movs r1, #2
	subs r0, r0, #1
	strb r1, [r5, r0]
	ldr r0, _021E6B94 @ =0x000005DC
	bl FUN_0200604C
	b _021E6B30
_021E6A22:
	subs r0, r6, #4
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021E6A52
	ldr r0, _021E6B98 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0xc3
	tst r0, r1
	beq _021E6B30
	ldr r0, _021E6B94 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov53_021E6928
	movs r0, #5
	movs r1, #1
	bl FUN_0201BC28
	movs r1, #1
	subs r0, r6, #4
	strb r1, [r5, r0]
	b _021E6B30
_021E6A52:
	ldr r0, _021E6B98 @ =0x021D110C
	movs r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021E6A90
	subs r0, r6, #3
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _021E6B30
	subs r0, r6, #3
	ldrb r0, [r5, r0]
	movs r3, #0xc
	muls r3, r4, r3
	subs r1, r0, #1
	subs r0, r6, #3
	strb r1, [r5, r0]
	subs r4, r6, #3
	ldrb r4, [r5, r4]
	ldr r0, [r5, #0x18]
	movs r1, #5
	lsls r6, r4, #2
	ldr r4, _021E6B90 @ =0x021E8604
	movs r2, #3
	adds r3, r4, r3
	ldr r3, [r6, r3]
	bl FUN_0201F238
	ldr r0, _021E6B94 @ =0x000005DC
	bl FUN_0200604C
	b _021E6B30
_021E6A90:
	movs r3, #0x80
	adds r1, r0, #0
	tst r1, r3
	beq _021E6ADA
	adds r1, r3, #0
	adds r0, r3, #0
	adds r1, #0xe1
	adds r0, #0xe3
	ldrb r1, [r5, r1]
	ldrb r0, [r5, r0]
	subs r1, r1, #1
	cmp r0, r1
	beq _021E6B30
	adds r0, r3, #0
	adds r0, #0xe3
	ldrb r0, [r5, r0]
	movs r6, #0xc
	muls r6, r4, r6
	adds r1, r0, #1
	adds r0, r3, #0
	adds r0, #0xe3
	strb r1, [r5, r0]
	adds r3, #0xe3
	ldrb r3, [r5, r3]
	ldr r4, _021E6B90 @ =0x021E8604
	ldr r0, [r5, #0x18]
	lsls r3, r3, #2
	adds r4, r4, r6
	ldr r3, [r3, r4]
	movs r1, #5
	movs r2, #3
	bl FUN_0201F238
	ldr r0, _021E6B94 @ =0x000005DC
	bl FUN_0200604C
	b _021E6B30
_021E6ADA:
	movs r2, #1
	adds r1, r0, #0
	tst r1, r2
	beq _021E6AF2
	strb r2, [r5, r6]
	movs r0, #2
	adds r3, #0xe5
	strb r0, [r5, r3]
	ldr r0, _021E6B94 @ =0x000005DC
	bl FUN_0200604C
	b _021E6B30
_021E6AF2:
	movs r1, #2
	tst r0, r1
	beq _021E6B30
	adds r0, r3, #0
	adds r0, #0xe1
	ldrb r0, [r5, r0]
	subs r1, r0, #1
	adds r0, r3, #0
	adds r0, #0xe3
	strb r1, [r5, r0]
	adds r1, r3, #0
	strb r2, [r5, r6]
	movs r6, #0xc
	muls r6, r4, r6
	ldr r4, _021E6B90 @ =0x021E8604
	adds r1, #0xe5
	movs r0, #2
	strb r0, [r5, r1]
	adds r3, #0xe3
	ldrb r3, [r5, r3]
	adds r4, r4, r6
	ldr r0, [r5, #0x18]
	lsls r3, r3, #2
	ldr r3, [r3, r4]
	movs r1, #5
	movs r2, #3
	bl FUN_0201F238
	ldr r0, _021E6B94 @ =0x000005DC
	bl FUN_0200604C
_021E6B30:
	ldr r0, _021E6B84 @ =0x00000166
	ldrb r1, [r5, r0]
	cmp r1, #0
	beq _021E6B78
	subs r1, r0, #2
	ldrb r1, [r5, r1]
	adds r2, r1, #1
	subs r1, r0, #2
	strb r2, [r5, r1]
	ldrb r2, [r5, r1]
	subs r1, r0, #1
	ldrb r1, [r5, r1]
	cmp r2, r1
	bls _021E6B78
	adds r1, r0, #1
	ldrb r2, [r5, r1]
	movs r1, #1
	adds r3, r2, #0
	eors r3, r1
	adds r2, r0, #1
	strb r3, [r5, r2]
	subs r3, r0, #2
	movs r2, #0
	strb r2, [r5, r3]
	adds r0, r0, #1
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _021E6B70
	movs r0, #5
	bl FUN_0201BC28
	b _021E6B78
_021E6B70:
	movs r0, #5
	adds r1, r2, #0
	bl FUN_0201BC28
_021E6B78:
	adds r0, r7, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6B80: .4byte 0x021E8650
_021E6B84: .4byte 0x00000166
_021E6B88: .4byte 0x021D114C
_021E6B8C: .4byte 0x00000163
_021E6B90: .4byte 0x021E8604
_021E6B94: .4byte 0x000005DC
_021E6B98: .4byte 0x021D110C
	thumb_func_end ov53_021E6988

	thumb_func_start ov53_021E6B9C
ov53_021E6B9C: @ 0x021E6B9C
	push {r3, r4}
	movs r2, #0x1f
	adds r4, r0, #0
	asrs r3, r0, #5
	ands r4, r2
	ands r3, r2
	asrs r0, r0, #0xa
	adds r4, r4, r1
	adds r3, r3, r1
	adds r0, r0, r1
	cmp r4, #0x1f
	ble _021E6BB8
	adds r4, r2, #0
	b _021E6BBE
_021E6BB8:
	cmp r4, #0
	bge _021E6BBE
	movs r4, #0
_021E6BBE:
	cmp r3, #0x1f
	ble _021E6BC6
	movs r3, #0x1f
	b _021E6BCC
_021E6BC6:
	cmp r3, #0
	bge _021E6BCC
	movs r3, #0
_021E6BCC:
	cmp r0, #0x1f
	ble _021E6BD4
	movs r0, #0x1f
	b _021E6BDA
_021E6BD4:
	cmp r0, #0
	bge _021E6BDA
	movs r0, #0
_021E6BDA:
	lsls r1, r0, #0xa
	lsls r0, r3, #5
	orrs r0, r1
	orrs r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov53_021E6B9C

	thumb_func_start ov53_021E6BEC
ov53_021E6BEC: @ 0x021E6BEC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _021E6C9C @ =0x00000163
	adds r6, r1, #0
	ldrb r0, [r5, r0]
	movs r4, #0
	movs r1, #1
	cmp r0, #0
	beq _021E6C06
	cmp r0, #1
	beq _021E6C06
	adds r1, r4, #0
_021E6C06:
	cmp r1, #0
	bne _021E6C0E
	bl FUN_0202551C
_021E6C0E:
	cmp r6, #0
	bne _021E6C2E
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r2, [r5, r0]
	adds r1, r2, #1
	str r1, [r5, r0]
	movs r0, #0xa
	muls r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	lsls r0, r0, #3
	asrs r4, r0, #0xc
	b _021E6C36
_021E6C2E:
	movs r0, #0x5a
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_021E6C36:
	ldr r0, _021E6CA0 @ =0x00000136
	lsls r1, r4, #0x18
	ldrh r0, [r5, r0]
	asrs r1, r1, #0x18
	bl ov53_021E6B9C
	add r1, sp, #0
	strh r0, [r1]
	ldr r0, _021E6CA4 @ =0x00001CFF
	movs r1, #0
	bl ov53_021E6B9C
	add r1, sp, #0
	strh r0, [r1, #2]
	ldr r3, _021E6C9C @ =0x00000163
	movs r0, #6
	ldrb r3, [r5, r3]
	add r1, sp, #0
	movs r2, #4
	lsls r4, r3, #2
	ldr r3, _021E6CA8 @ =0x021E8508
	ldr r3, [r3, r4]
	lsls r3, r3, #0x11
	lsrs r3, r3, #0x10
	bl FUN_0201C260
	ldr r0, _021E6CA0 @ =0x00000136
	add r1, sp, #0
	ldrh r2, [r5, r0]
	adds r0, #0x2d
	strh r2, [r1]
	ldr r2, _021E6CAC @ =0x0000739B
	strh r2, [r1, #2]
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021E6C82
	movs r3, #1
	b _021E6C84
_021E6C82:
	movs r3, #0
_021E6C84:
	lsls r4, r3, #2
	ldr r3, _021E6CA8 @ =0x021E8508
	movs r0, #6
	ldr r3, [r3, r4]
	add r1, sp, #0
	lsls r3, r3, #0x11
	movs r2, #4
	lsrs r3, r3, #0x10
	bl FUN_0201C260
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E6C9C: .4byte 0x00000163
_021E6CA0: .4byte 0x00000136
_021E6CA4: .4byte 0x00001CFF
_021E6CA8: .4byte 0x021E8508
_021E6CAC: .4byte 0x0000739B
	thumb_func_end ov53_021E6BEC

	thumb_func_start ov53_021E6CB0
ov53_021E6CB0: @ 0x021E6CB0
	push {r3, lr}
	ldr r1, _021E6CD8 @ =0x00000136
	movs r2, #4
	ldrh r1, [r0, r1]
	add r0, sp, #0
	movs r3, #0x18
	strh r1, [r0]
	ldr r1, _021E6CDC @ =0x0000739B
	strh r1, [r0, #2]
	movs r0, #6
	add r1, sp, #0
	bl FUN_0201C260
	movs r0, #6
	add r1, sp, #0
	movs r2, #4
	movs r3, #0x1c
	bl FUN_0201C260
	pop {r3, pc}
	.align 2, 0
_021E6CD8: .4byte 0x00000136
_021E6CDC: .4byte 0x0000739B
	thumb_func_end ov53_021E6CB0

	thumb_func_start ov53_021E6CE0
ov53_021E6CE0: @ 0x021E6CE0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	ldr r3, _021E6DD8 @ =0x021E8530
	adds r5, r0, #0
	movs r4, #0
	add r2, sp, #0
	movs r1, #0xc
_021E6CEE:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _021E6CEE
	ldr r0, _021E6DDC @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021E6D38
	add r0, sp, #0
	bl FUN_02025224
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _021E6DD0
	ldr r0, _021E6DE0 @ =0x00000163
	movs r1, #1
	strb r6, [r5, r0]
	adds r2, r0, #3
	strb r1, [r5, r2]
	movs r2, #2
	adds r0, r0, #2
	strb r2, [r5, r0]
	adds r0, r5, #0
	bl ov53_021E6BEC
	ldr r0, _021E6DE4 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x5f
	lsls r0, r0, #2
	str r6, [r5, r0]
	movs r4, #1
	b _021E6DD0
_021E6D38:
	ldr r0, _021E6DE8 @ =0x00000162
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021E6D5E
	ldr r0, _021E6DEC @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0x31
	tst r0, r1
	beq _021E6DD0
	ldr r0, _021E6DE4 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _021E6DE8 @ =0x00000162
	movs r1, #1
	strb r1, [r5, r0]
	adds r0, r5, #0
	bl ov53_021E6BEC
	b _021E6DD0
_021E6D5E:
	adds r0, r5, #0
	movs r1, #0
	bl ov53_021E6BEC
	ldr r0, _021E6DEC @ =0x021D110C
	movs r1, #0x20
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021E6D84
	ldr r0, _021E6DE0 @ =0x00000163
	ldrb r1, [r5, r0]
	cmp r1, #0
	beq _021E6DD0
	subs r1, r1, #1
	strb r1, [r5, r0]
	ldr r0, _021E6DE4 @ =0x000005DC
	bl FUN_0200604C
	b _021E6DD0
_021E6D84:
	movs r1, #0x10
	tst r1, r0
	beq _021E6DA4
	ldr r0, _021E6DE0 @ =0x00000163
	subs r1, r0, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r5, r0]
	subs r1, r1, #1
	cmp r2, r1
	beq _021E6DD0
	adds r1, r2, #1
	strb r1, [r5, r0]
	ldr r0, _021E6DE4 @ =0x000005DC
	bl FUN_0200604C
	b _021E6DD0
_021E6DA4:
	movs r1, #1
	tst r0, r1
	beq _021E6DD0
	ldr r0, _021E6DE8 @ =0x00000162
	movs r2, #0
	strb r2, [r5, r0]
	adds r2, r0, #4
	strb r1, [r5, r2]
	movs r2, #2
	adds r0, r0, #3
	strb r2, [r5, r0]
	adds r0, r5, #0
	bl ov53_021E6BEC
	ldr r0, _021E6DE4 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _021E6DE0 @ =0x00000163
	movs r4, #1
	ldrb r1, [r5, r0]
	adds r0, #0x19
	str r1, [r5, r0]
_021E6DD0:
	adds r0, r4, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021E6DD8: .4byte 0x021E8530
_021E6DDC: .4byte 0x021D114C
_021E6DE0: .4byte 0x00000163
_021E6DE4: .4byte 0x000005DC
_021E6DE8: .4byte 0x00000162
_021E6DEC: .4byte 0x021D110C
	thumb_func_end ov53_021E6CE0

	thumb_func_start ov53_021E6DF0
ov53_021E6DF0: @ 0x021E6DF0
	movs r1, #5
	movs r2, #0
	lsls r1, r1, #6
	str r2, [r0, r1]
	adds r1, r1, #4
	str r2, [r0, r1]
	bx lr
	.align 2, 0
	thumb_func_end ov53_021E6DF0

	thumb_func_start ov53_021E6E00
ov53_021E6E00: @ 0x021E6E00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	movs r1, #0x51
	adds r2, r0, #0
	lsls r1, r1, #2
	ldr r0, [r2, r1]
	movs r7, #0
	cmp r0, #0
	beq _021E6E16
	subs r0, r0, #1
	b _021E6E22
_021E6E16:
	subs r0, r1, #4
	ldr r0, [r2, r0]
	adds r3, r0, #1
	subs r0, r1, #4
	str r3, [r2, r0]
	movs r0, #8
_021E6E22:
	movs r3, #0x4d
	lsls r3, r3, #2
	str r0, [r2, r1]
	ldrh r0, [r2, r3]
	cmp r0, #0
	bne _021E6E34
	ldr r6, _021E6E74 @ =0x021E859C
	add r5, sp, #0x28
	b _021E6E38
_021E6E34:
	ldr r6, _021E6E78 @ =0x021E85B4
	add r5, sp, #0x10
_021E6E38:
	adds r4, r5, #0
	ldm r6!, {r0, r1}
	stm r5!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r5!, {r0, r1}
	ldm r6!, {r0, r1}
	adds r3, #0xc
	stm r5!, {r0, r1}
	ldr r0, [r2, r3]
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0xff
	bne _021E6E56
	movs r7, #1
	b _021E6E6C
_021E6E56:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r2]
	movs r3, #1
	str r0, [sp, #0xc]
	ldr r2, [r2, #0x18]
	movs r0, #0x78
	bl FUN_020078F0
_021E6E6C:
	adds r0, r7, #0
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6E74: .4byte 0x021E859C
_021E6E78: .4byte 0x021E85B4
	thumb_func_end ov53_021E6E00

	thumb_func_start ov53_021E6E7C
ov53_021E6E7C: @ 0x021E6E7C
	push {r3, r4, lr}
	sub sp, #0x1c
	add r0, sp, #0xc
	add r1, sp, #0
	movs r4, #1
	bl FUN_02014708
	ldr r0, [sp]
	ldr r3, [sp, #4]
	movs r1, #0x64
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r3, r2
	lsls r1, r1, #2
	cmp r0, r1
	blo _021E6EA2
	ldr r1, _021E6EE4 @ =0x00000423
	cmp r0, r1
	bls _021E6EDC
_021E6EA2:
	ldr r1, _021E6EE8 @ =0x0000044C
	cmp r0, r1
	blo _021E6EB2
	ldr r1, _021E6EEC @ =0x00000617
	cmp r0, r1
	bhi _021E6EB2
	movs r4, #2
	b _021E6EDC
_021E6EB2:
	movs r1, #0x19
	lsls r1, r1, #6
	cmp r0, r1
	blo _021E6EC4
	ldr r1, _021E6EF0 @ =0x00000743
	cmp r0, r1
	bhi _021E6EC4
	movs r4, #3
	b _021E6EDC
_021E6EC4:
	ldr r1, _021E6EF4 @ =0x0000076C
	cmp r0, r1
	blo _021E6ED4
	ldr r1, _021E6EF8 @ =0x00000937
	cmp r0, r1
	bhi _021E6ED4
	movs r4, #4
	b _021E6EDC
_021E6ED4:
	ldr r1, _021E6EFC @ =0x00000167
	cmp r0, r1
	bhi _021E6EDC
	movs r4, #5
_021E6EDC:
	adds r0, r4, #0
	add sp, #0x1c
	pop {r3, r4, pc}
	nop
_021E6EE4: .4byte 0x00000423
_021E6EE8: .4byte 0x0000044C
_021E6EEC: .4byte 0x00000617
_021E6EF0: .4byte 0x00000743
_021E6EF4: .4byte 0x0000076C
_021E6EF8: .4byte 0x00000937
_021E6EFC: .4byte 0x00000167
	thumb_func_end ov53_021E6E7C

	thumb_func_start ov53_021E6F00
ov53_021E6F00: @ 0x021E6F00
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0x5d
	lsls r0, r0, #2
	ldrh r3, [r4, r0]
	cmp r3, #0
	beq _021E6F18
	cmp r3, #1
	beq _021E6F2C
	cmp r3, #2
	beq _021E6F7E
	b _021E6F86
_021E6F18:
	movs r1, #1
	strh r1, [r4, r0]
	movs r1, #6
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _021E6F8C @ =0x021E853C
	adds r0, r0, #2
	ldrsh r1, [r1, r3]
	strh r1, [r4, r0]
	b _021E6F86
_021E6F2C:
	movs r3, #6
	muls r3, r2, r3
	ldr r2, _021E6F90 @ =0x021E8540
	adds r5, r0, #2
	ldrsh r2, [r2, r3]
	ldrsh r5, [r4, r5]
	adds r6, r5, r2
	adds r5, r0, #2
	strh r6, [r4, r5]
	cmp r2, #0
	ble _021E6F58
	ldr r2, _021E6F94 @ =0x021E853E
	ldrsh r3, [r2, r3]
	adds r2, r5, #0
	ldrsh r2, [r4, r2]
	cmp r2, r3
	blt _021E6F6C
	adds r2, r5, #0
	strh r3, [r4, r2]
	movs r2, #2
	strh r2, [r4, r0]
	b _021E6F6C
_021E6F58:
	ldr r2, _021E6F94 @ =0x021E853E
	ldrsh r3, [r2, r3]
	adds r2, r5, #0
	ldrsh r2, [r4, r2]
	cmp r2, r3
	bgt _021E6F6C
	adds r2, r5, #0
	strh r3, [r4, r2]
	movs r2, #2
	strh r2, [r4, r0]
_021E6F6C:
	ldr r3, _021E6F98 @ =0x00000176
	lsls r1, r1, #0x18
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x18]
	lsrs r1, r1, #0x18
	movs r2, #0
	bl FUN_0201BC8C
	b _021E6F86
_021E6F7E:
	movs r1, #0
	strh r1, [r4, r0]
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E6F86:
	movs r0, #0
	pop {r4, r5, r6, pc}
	nop
_021E6F8C: .4byte 0x021E853C
_021E6F90: .4byte 0x021E8540
_021E6F94: .4byte 0x021E853E
_021E6F98: .4byte 0x00000176
	thumb_func_end ov53_021E6F00

	thumb_func_start ov53_021E6F9C
ov53_021E6F9C: @ 0x021E6F9C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	movs r5, #0
	cmp r1, #0x7e
	bls _021E6FAE
	bl _021E7CF8
_021E6FAE:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E6FBA: @ jump table
	.2byte _021E70B8 - _021E6FBA - 2 @ case 0
	.2byte _021E7138 - _021E6FBA - 2 @ case 1
	.2byte _021E7154 - _021E6FBA - 2 @ case 2
	.2byte _021E7188 - _021E6FBA - 2 @ case 3
	.2byte _021E719C - _021E6FBA - 2 @ case 4
	.2byte _021E71CE - _021E6FBA - 2 @ case 5
	.2byte _021E71EE - _021E6FBA - 2 @ case 6
	.2byte _021E70E4 - _021E6FBA - 2 @ case 7
	.2byte _021E7226 - _021E6FBA - 2 @ case 8
	.2byte _021E7274 - _021E6FBA - 2 @ case 9
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 10
	.2byte _021E7284 - _021E6FBA - 2 @ case 11
	.2byte _021E7298 - _021E6FBA - 2 @ case 12
	.2byte _021E72AC - _021E6FBA - 2 @ case 13
	.2byte _021E72C0 - _021E6FBA - 2 @ case 14
	.2byte _021E72D4 - _021E6FBA - 2 @ case 15
	.2byte _021E72F0 - _021E6FBA - 2 @ case 16
	.2byte _021E7304 - _021E6FBA - 2 @ case 17
	.2byte _021E7320 - _021E6FBA - 2 @ case 18
	.2byte _021E733C - _021E6FBA - 2 @ case 19
	.2byte _021E735C - _021E6FBA - 2 @ case 20
	.2byte _021E7378 - _021E6FBA - 2 @ case 21
	.2byte _021E739C - _021E6FBA - 2 @ case 22
	.2byte _021E73B0 - _021E6FBA - 2 @ case 23
	.2byte _021E73E2 - _021E6FBA - 2 @ case 24
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 25
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 26
	.2byte _021E7414 - _021E6FBA - 2 @ case 27
	.2byte _021E7440 - _021E6FBA - 2 @ case 28
	.2byte _021E7456 - _021E6FBA - 2 @ case 29
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 30
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 31
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 32
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 33
	.2byte _021E7484 - _021E6FBA - 2 @ case 34
	.2byte _021E74CE - _021E6FBA - 2 @ case 35
	.2byte _021E74DE - _021E6FBA - 2 @ case 36
	.2byte _021E74F2 - _021E6FBA - 2 @ case 37
	.2byte _021E7504 - _021E6FBA - 2 @ case 38
	.2byte _021E7516 - _021E6FBA - 2 @ case 39
	.2byte _021E7528 - _021E6FBA - 2 @ case 40
	.2byte _021E753A - _021E6FBA - 2 @ case 41
	.2byte _021E754C - _021E6FBA - 2 @ case 42
	.2byte _021E756A - _021E6FBA - 2 @ case 43
	.2byte _021E7590 - _021E6FBA - 2 @ case 44
	.2byte _021E75E8 - _021E6FBA - 2 @ case 45
	.2byte _021E760C - _021E6FBA - 2 @ case 46
	.2byte _021E762A - _021E6FBA - 2 @ case 47
	.2byte _021E7672 - _021E6FBA - 2 @ case 48
	.2byte _021E7682 - _021E6FBA - 2 @ case 49
	.2byte _021E7694 - _021E6FBA - 2 @ case 50
	.2byte _021E76A8 - _021E6FBA - 2 @ case 51
	.2byte _021E76DE - _021E6FBA - 2 @ case 52
	.2byte _021E771C - _021E6FBA - 2 @ case 53
	.2byte _021E775E - _021E6FBA - 2 @ case 54
	.2byte _021E77A2 - _021E6FBA - 2 @ case 55
	.2byte _021E77B4 - _021E6FBA - 2 @ case 56
	.2byte _021E77C6 - _021E6FBA - 2 @ case 57
	.2byte _021E77D8 - _021E6FBA - 2 @ case 58
	.2byte _021E77E8 - _021E6FBA - 2 @ case 59
	.2byte _021E77FA - _021E6FBA - 2 @ case 60
	.2byte _021E7818 - _021E6FBA - 2 @ case 61
	.2byte _021E7842 - _021E6FBA - 2 @ case 62
	.2byte _021E7850 - _021E6FBA - 2 @ case 63
	.2byte _021E7892 - _021E6FBA - 2 @ case 64
	.2byte _021E78AA - _021E6FBA - 2 @ case 65
	.2byte _021E78C2 - _021E6FBA - 2 @ case 66
	.2byte _021E7920 - _021E6FBA - 2 @ case 67
	.2byte _021E794C - _021E6FBA - 2 @ case 68
	.2byte _021E797C - _021E6FBA - 2 @ case 69
	.2byte _021E79AC - _021E6FBA - 2 @ case 70
	.2byte _021E79DE - _021E6FBA - 2 @ case 71
	.2byte _021E7A3C - _021E6FBA - 2 @ case 72
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 73
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 74
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 75
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 76
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 77
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 78
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 79
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 80
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 81
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 82
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 83
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 84
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 85
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 86
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 87
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 88
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 89
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 90
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 91
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 92
	.2byte _021E7A52 - _021E6FBA - 2 @ case 93
	.2byte _021E7A64 - _021E6FBA - 2 @ case 94
	.2byte _021E7A76 - _021E6FBA - 2 @ case 95
	.2byte _021E7AA4 - _021E6FBA - 2 @ case 96
	.2byte _021E7B30 - _021E6FBA - 2 @ case 97
	.2byte _021E7B50 - _021E6FBA - 2 @ case 98
	.2byte _021E7B6E - _021E6FBA - 2 @ case 99
	.2byte _021E7BA0 - _021E6FBA - 2 @ case 100
	.2byte _021E7BBE - _021E6FBA - 2 @ case 101
	.2byte _021E7C20 - _021E6FBA - 2 @ case 102
	.2byte _021E7C2E - _021E6FBA - 2 @ case 103
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 104
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 105
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 106
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 107
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 108
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 109
	.2byte _021E7C40 - _021E6FBA - 2 @ case 110
	.2byte _021E7C5E - _021E6FBA - 2 @ case 111
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 112
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 113
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 114
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 115
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 116
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 117
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 118
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 119
	.2byte _021E7C6C - _021E6FBA - 2 @ case 120
	.2byte _021E7CB4 - _021E6FBA - 2 @ case 121
	.2byte _021E7CF8 - _021E6FBA - 2 @ case 122
	.2byte _021E7CC0 - _021E6FBA - 2 @ case 123
	.2byte _021E7CC6 - _021E6FBA - 2 @ case 124
	.2byte _021E7CD8 - _021E6FBA - 2 @ case 125
	.2byte _021E7CEE - _021E6FBA - 2 @ case 126
_021E70B8:
	movs r0, #6
	adds r1, r5, #0
	bl FUN_0201BC28
	movs r1, #0x3f
	movs r0, #2
	lsls r1, r1, #4
	movs r2, #1
	bl FUN_02004EC4
	movs r0, #0x3f
	lsls r0, r0, #4
	adds r1, r5, #0
	bl FUN_02005EB4
	ldr r0, _021E7408 @ =0x000003F1
	bl FUN_02005D48
	movs r0, #7
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E70E4:
	adds r1, r5, #0
	bl ov53_021E6824
	adds r0, r4, #0
	movs r1, #1
	bl ov53_021E66A8
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov53_021E67C4
	movs r0, #3
	movs r1, #1
	bl FUN_0201BC28
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #4
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #7
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7138:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E71F6
	adds r0, r4, #0
	movs r1, #0x28
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E71F6
	movs r0, #2
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7154:
	movs r1, #7
	movs r2, #2
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E71F6
	movs r0, #6
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #3
	str r0, [r4, #0xc]
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x2c
	movs r2, #0x2d
	movs r3, #0x2e
	bl ov53_021E64C4
	ldr r0, _021E740C @ =0x00000162
	adds r1, r5, #0
	strb r1, [r4, r0]
	adds r0, r0, #1
	strb r1, [r4, r0]
	bl _021E7CF8
_021E7188:
	adds r1, r5, #0
	bl ov53_021E6988
	subs r1, r5, #1
	cmp r0, r1
	beq _021E71F6
	movs r0, #4
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E719C:
	movs r1, #7
	movs r2, #2
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E71F6
	adds r0, r4, #0
	bl ov53_021E65B4
	movs r0, #4
	adds r1, r5, #0
	bl FUN_0201BC28
	movs r0, #6
	adds r1, r5, #0
	bl FUN_0201BC28
	movs r0, #5
	adds r1, r5, #0
	bl FUN_0201BC28
	movs r0, #5
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E71CE:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r5, #0
	adds r3, r5, #0
	bl FUN_0200FA24
	movs r0, #6
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E71EE:
	bl FUN_0200FB5C
	cmp r0, #1
	beq _021E71FA
_021E71F6:
	bl _021E7CF8
_021E71FA:
	ldr r0, _021E7410 @ =0x00000163
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E720E
	cmp r0, #1
	beq _021E7216
	cmp r0, #2
	beq _021E721E
	bl _021E7CF8
_021E720E:
	movs r0, #8
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7216:
	movs r0, #0x22
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E721E:
	movs r0, #0x2c
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7226:
	ldr r0, [r4, #0x18]
	movs r1, #4
	bl FUN_0201CAE0
	adds r0, r4, #0
	movs r1, #1
	bl ov53_021E66A8
	adds r0, r4, #0
	movs r1, #1
	bl ov53_021E67C4
	adds r0, r4, #0
	movs r1, #1
	bl ov53_021E7E08
	movs r0, #4
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #7
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #9
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7274:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E7348
	movs r0, #0xb
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7284:
	movs r1, #9
	adds r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	movs r0, #0xc
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7298:
	movs r1, #0xa
	adds r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	movs r0, #0xd
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E72AC:
	movs r1, #0xb
	adds r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	movs r0, #0xe
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E72C0:
	movs r1, #0xc
	adds r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	movs r0, #0xf
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E72D4:
	movs r1, #0x17
	movs r2, #2
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #0x10
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E72F0:
	movs r1, #0x19
	adds r2, r5, #0
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7348
	movs r0, #0x11
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7304:
	movs r1, #0xd
	adds r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	adds r0, r4, #0
	movs r1, #2
	bl ov53_021E66A8
	movs r0, #0x12
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7320:
	movs r1, #0xe
	movs r2, #3
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	adds r0, r4, #0
	movs r1, #1
	bl ov53_021E66A8
	movs r0, #0x13
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E733C:
	movs r1, #0xf
	adds r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	beq _021E734C
_021E7348:
	bl _021E7CF8
_021E734C:
	adds r0, r4, #0
	movs r1, #3
	bl ov53_021E66A8
	movs r0, #0x14
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E735C:
	movs r1, #0x10
	movs r2, #3
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7462
	adds r0, r4, #0
	movs r1, #4
	bl ov53_021E66A8
	movs r0, #0x15
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7378:
	movs r1, #0x11
	movs r2, #3
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7462
	movs r0, #0x16
	str r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0201BC28
	adds r0, r4, #0
	movs r1, #1
	bl ov53_021E66A8
	bl _021E7CF8
_021E739C:
	movs r1, #0x1a
	movs r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7462
	movs r0, #0x17
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E73B0:
	adds r1, r5, #0
	bl ov53_021E7E08
	ldr r0, [r4, #0x18]
	movs r1, #4
	bl FUN_0201CAE0
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #7
	bl ov53_021E816C
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xdb
	movs r2, #0x3d
	movs r3, #0x3e
	bl ov53_021E81F4
	movs r0, #0x18
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E73E2:
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov53_021E8248
	cmp r0, #1
	beq _021E73F8
	cmp r0, #2
	beq _021E7400
	bl _021E7CF8
_021E73F8:
	movs r0, #0x1b
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7400:
	movs r0, #0x1d
	str r0, [r4, #0xc]
	bl _021E7CF8
	.align 2, 0
_021E7408: .4byte 0x000003F1
_021E740C: .4byte 0x00000162
_021E7410: .4byte 0x00000163
_021E7414:
	movs r1, #6
	movs r2, #1
	bl ov53_021E5EDC
	cmp r0, #1
	bne _021E7462
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0x1c
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7440:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E7462
	adds r0, r4, #0
	bl ov53_021E7D58
	movs r0, #7
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7456:
	movs r1, #6
	movs r2, #1
	bl ov53_021E5EDC
	cmp r0, #1
	beq _021E7466
_021E7462:
	bl _021E7CF8
_021E7466:
	adds r0, r4, #0
	movs r1, #3
	bl ov53_021E7E08
	movs r0, #6
	adds r1, r5, #0
	bl FUN_0201BC28
	adds r0, r4, #0
	bl ov53_021E7D58
	movs r0, #8
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7484:
	movs r1, #5
	bl ov53_021E66A8
	adds r0, r4, #0
	movs r1, #2
	bl ov53_021E67C4
	adds r0, r4, #0
	bl ov53_021E7D58
	adds r0, r4, #0
	movs r1, #1
	bl ov53_021E7E08
	movs r0, #4
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #7
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0x23
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E74CE:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E7572
	movs r0, #0x24
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E74DE:
	movs r1, #0x1c
	movs r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	movs r0, #0x25
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E74F2:
	movs r1, #0x1d
	movs r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	movs r0, #0x26
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7504:
	movs r1, #0x1e
	movs r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	movs r0, #0x27
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7516:
	movs r1, #0x1f
	movs r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	movs r0, #0x28
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7528:
	movs r1, #0x20
	movs r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	movs r0, #0x29
	str r0, [r4, #0xc]
	b _021E7CF8
_021E753A:
	movs r1, #0x21
	movs r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	movs r0, #0x2a
	str r0, [r4, #0xc]
	b _021E7CF8
_021E754C:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r5, #0
	adds r3, r5, #0
	bl FUN_0200FA24
	movs r0, #0x2b
	str r0, [r4, #0xc]
	b _021E7CF8
_021E756A:
	bl FUN_0200FB5C
	cmp r0, #1
	beq _021E7574
_021E7572:
	b _021E7CF8
_021E7574:
	adds r0, r4, #0
	bl ov53_021E7D58
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov53_021E7E08
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #7
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7590:
	bl ov53_021E7D58
	adds r0, r4, #0
	movs r1, #1
	bl ov53_021E7E08
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov53_021E66A8
	ldr r0, [r4, #0x18]
	movs r1, #5
	bl FUN_0201CAE0
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #3
	adds r1, r5, #0
	bl FUN_0201BC28
	movs r0, #4
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #7
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #0x2d
	str r0, [r4, #0xc]
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	b _021E7CF8
_021E75E8:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E76A0
	adds r0, r4, #0
	movs r1, #0x28
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E76A0
	movs r0, #0x2e
	str r0, [r4, #0xc]
	bl ov53_021E6E7C
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r4, r1]
	b _021E7CF8
_021E760C:
	movs r1, #0x17
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E76A0
	adds r0, r5, #0
	movs r1, #6
	bl FUN_02005F50
	movs r0, #0x2f
	str r0, [r4, #0xc]
	b _021E7CF8
_021E762A:
	bl FUN_02005F88
	cmp r0, #0
	bne _021E76A0
	ldr r0, _021E7938 @ =0x000003F1
	adds r1, r5, #0
	bl FUN_02005EB4
	ldr r0, _021E793C @ =0x000003F2
	bl FUN_02005D48
	adds r0, r4, #0
	movs r1, #1
	adds r2, r5, #0
	bl ov53_021E66E8
	movs r0, #3
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BC28
	adds r1, r5, #0
	movs r0, #1
	adds r2, r1, #0
	str r0, [sp]
	movs r0, #0x10
	subs r2, #0x10
	movs r3, #0x1a
	bl FUN_0200B484
	movs r0, #0x30
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7672:
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #0
	beq _021E76A0
	movs r0, #0x31
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7682:
	movs r1, #6
	movs r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E76A0
	movs r0, #0x32
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7694:
	movs r1, #1
	adds r2, r5, #0
	bl ov53_021E6F00
	cmp r0, #1
	beq _021E76A2
_021E76A0:
	b _021E7CF8
_021E76A2:
	movs r0, #0x33
	str r0, [r4, #0xc]
	b _021E7CF8
_021E76A8:
	movs r1, #0x22
	movs r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E77AC
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	movs r1, #3
	bl FUN_020248F0
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	movs r1, #5
	bl FUN_02024A14
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x34
	str r0, [r4, #0xc]
	b _021E7CF8
_021E76DE:
	movs r1, #0x1e
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E77AC
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	movs r3, #0x1b
	bl FUN_0200B484
	movs r0, #2
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	movs r3, #0x1d
	bl FUN_0200B484
	ldr r0, _021E7940 @ =0x00000706
	bl FUN_0200604C
	movs r0, #5
	adds r1, r5, #0
	lsls r0, r0, #6
	str r1, [r4, r0]
	movs r0, #0x35
	str r0, [r4, #0xc]
	b _021E7CF8
_021E771C:
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #1
	bne _021E77AC
	movs r0, #2
	bl FUN_0200B5C0
	cmp r0, #1
	bne _021E77AC
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	movs r1, #1
	bl FUN_020248F0
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	movs r1, #4
	bl FUN_02024A14
	movs r2, #5
	movs r1, #0x10
	lsls r2, r2, #6
	str r1, [r4, r2]
	ldr r0, _021E7944 @ =0x04000050
	ldr r2, [r4, r2]
	blx FUN_020CF178
	movs r0, #0x36
	str r0, [r4, #0xc]
	b _021E7CF8
_021E775E:
	adds r0, #0xec
	ldr r0, [r0]
	bl FUN_02024B68
	cmp r0, #0
	bne _021E77AC
	movs r2, #5
	lsls r2, r2, #6
	ldr r0, [r4, r2]
	movs r1, #0x10
	subs r0, r0, #1
	str r0, [r4, r2]
	ldr r0, _021E7944 @ =0x04000050
	ldr r2, [r4, r2]
	blx FUN_020CF178
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E77AC
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	movs r1, #2
	bl FUN_020248F0
	movs r0, #0xb7
	adds r1, r5, #0
	bl FUN_02006218
	movs r0, #0x37
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77A2:
	movs r1, #0x28
	bl ov53_021E60CC
	cmp r0, #1
	beq _021E77AE
_021E77AC:
	b _021E7CF8
_021E77AE:
	movs r0, #0x38
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77B4:
	movs r1, #0x23
	movs r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E78B2
	movs r0, #0x39
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77C6:
	movs r1, #0x65
	movs r2, #1
	bl ov53_021E5EDC
	cmp r0, #1
	bne _021E78B2
	movs r0, #0x3a
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77D8:
	movs r1, #0x1e
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E78B2
	movs r0, #0x3b
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77E8:
	movs r1, #1
	adds r2, r1, #0
	bl ov53_021E6F00
	cmp r0, #1
	bne _021E78B2
	movs r0, #0x3c
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77FA:
	movs r1, #0x24
	movs r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E78B2
	movs r0, #0x3d
	str r0, [r4, #0xc]
	ldr r0, _021E7948 @ =0x00000163
	adds r1, r5, #0
	strb r1, [r4, r0]
	movs r1, #2
	subs r0, r0, #2
	strb r1, [r4, r0]
	b _021E7CF8
_021E7818:
	movs r1, #0x25
	movs r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E78B2
	movs r0, #0x3e
	str r0, [r4, #0xc]
	movs r0, #6
	str r0, [sp]
	adds r1, r5, #0
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #4
	adds r3, r1, #0
	bl FUN_0200FA24
	b _021E7CF8
_021E7842:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E78B2
	movs r0, #0x3f
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7850:
	adds r1, r5, #0
	bl ov53_021E7E08
	movs r0, #4
	adds r1, r5, #0
	bl FUN_0201BC28
	adds r0, r4, #0
	movs r1, #4
	bl ov53_021E67C4
	adds r0, r4, #0
	movs r1, #2
	bl ov53_021E80B8
	ldr r0, [r4, #0x18]
	movs r1, #6
	bl FUN_0201CAE0
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #4
	adds r3, r5, #0
	bl FUN_0200FA24
	movs r0, #0x40
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7892:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E78B2
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, #0x19
	strb r1, [r4, r0]
	movs r0, #0x41
	str r0, [r4, #0xc]
	b _021E7CF8
_021E78AA:
	bl ov53_021E6CE0
	cmp r0, #0
	bne _021E78B4
_021E78B2:
	b _021E7CF8
_021E78B4:
	movs r0, #0x42
	str r0, [r4, #0xc]
	ldr r0, _021E7948 @ =0x00000163
	ldrb r1, [r4, r0]
	subs r0, #0x2f
	strh r1, [r4, r0]
	b _021E7CF8
_021E78C2:
	str r5, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x17
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	ldr r3, _021E7948 @ =0x00000163
	movs r2, #1
	ldrb r3, [r4, r3]
	ldr r0, [r4, #0x18]
	movs r1, #7
	eors r3, r2
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	ldr r0, [r4, #0x18]
	movs r1, #6
	bl FUN_0201BF7C
	ldr r0, [r4, #0x18]
	movs r1, #7
	bl FUN_0201BF7C
	ldr r0, [r4, #0x18]
	movs r1, #4
	bl FUN_0201CAE0
	movs r1, #0x4d
	lsls r1, r1, #2
	ldrh r1, [r4, r1]
	adds r0, r4, #0
	bl ov53_021E80B8
	movs r0, #0x4d
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #0
	bne _021E7914
	movs r1, #0x26
	b _021E7916
_021E7914:
	movs r1, #0x27
_021E7916:
	adds r0, #0x3c
	str r1, [r4, r0]
	movs r0, #0x43
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7920:
	movs r1, #0x17
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E79B8
	movs r0, #0x44
	str r0, [r4, #0xc]
	b _021E7CF8
	nop
_021E7938: .4byte 0x000003F1
_021E793C: .4byte 0x000003F2
_021E7940: .4byte 0x00000706
_021E7944: .4byte 0x04000050
_021E7948: .4byte 0x00000163
_021E794C:
	movs r0, #0x16
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #1
	bl ov53_021E6908
	adds r0, r4, #0
	movs r1, #1
	bl ov53_021E6824
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #0x30
	adds r3, r5, #0
	bl ov53_021E64C4
	movs r0, #0x45
	str r0, [r4, #0xc]
	ldr r0, _021E7C80 @ =0x00000163
	adds r1, r5, #0
	strb r1, [r4, r0]
	b _021E7CF8
_021E797C:
	movs r0, #4
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #6
	movs r1, #1
	bl FUN_0201BC28
	movs r1, #0x4d
	lsls r1, r1, #2
	ldrh r1, [r4, r1]
	adds r0, r4, #0
	adds r1, r1, #1
	bl ov53_021E6988
	subs r1, r5, #1
	cmp r0, r1
	beq _021E79B8
	adds r0, r4, #0
	bl ov53_021E65B4
	movs r0, #0x46
	str r0, [r4, #0xc]
	b _021E7CF8
_021E79AC:
	ldr r0, _021E7C80 @ =0x00000163
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E79BA
	cmp r0, #1
	beq _021E79C0
_021E79B8:
	b _021E7CF8
_021E79BA:
	movs r0, #0x5d
	str r0, [r4, #0xc]
	b _021E7CF8
_021E79C0:
	movs r0, #0x47
	str r0, [r4, #0xc]
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	adds r1, r5, #0
	str r0, [sp, #8]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r5, #0
	bl FUN_0200FA24
	b _021E7CF8
_021E79DE:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E7A6E
	movs r0, #5
	adds r1, r5, #0
	bl FUN_0201BC28
	movs r0, #6
	adds r1, r5, #0
	bl FUN_0201BC28
	adds r0, r4, #0
	movs r1, #3
	bl ov53_021E80B8
	adds r0, r4, #0
	movs r1, #1
	bl ov53_021E67C4
	ldr r0, [r4, #0x18]
	movs r1, #4
	bl FUN_0201CAE0
	adds r2, r5, #0
	ldr r0, [r4, #0x18]
	movs r1, #4
	adds r3, r2, #0
	bl FUN_0201F238
	adds r0, r4, #0
	bl ov53_021E6CB0
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #4
	adds r3, r5, #0
	bl FUN_0200FA24
	movs r0, #0x48
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7A3C:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E7A6E
	adds r0, r4, #0
	movs r1, #1
	bl ov53_021E7E08
	movs r0, #0x3d
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7A52:
	movs r1, #0x28
	movs r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7A6E
	movs r0, #0x5e
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7A64:
	movs r1, #0x28
	bl ov53_021E60CC
	cmp r0, #0
	bne _021E7A70
_021E7A6E:
	b _021E7CF8
_021E7A70:
	movs r0, #0x5f
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7A76:
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x18]
	bl FUN_020263AC
	movs r1, #0x4d
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r2, [r4, r1]
	subs r0, #0x14
	ldr r0, [r4, r0]
	subs r1, #0x14
	str r2, [r0, #4]
	ldr r0, _021E7C84 @ =0x02102610
	ldr r1, [r4, r1]
	ldr r2, [r4]
	bl FUN_0200724C
	str r0, [r4, #0x14]
	movs r0, #0x60
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7AA4:
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BC28
	movs r0, #3
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #4
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #7
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #6
	movs r1, #1
	bl FUN_0201BC28
	adds r2, r5, #0
	ldr r0, [r4, #0x18]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r4, #0
	bl ov53_021E7D04
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0x61
	str r0, [r4, #0xc]
	adds r0, r4, #0
	movs r1, #1
	adds r2, r5, #0
	bl ov53_021E66E8
	movs r1, #0x4d
	lsls r1, r1, #2
	ldrh r1, [r4, r1]
	adds r0, r4, #0
	bl ov53_021E80B8
	movs r0, #0x4d
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #0
	bne _021E7B28
	movs r1, #0x29
	adds r0, #0x3c
	str r1, [r4, r0]
	b _021E7CF8
_021E7B28:
	movs r1, #0x2a
	adds r0, #0x3c
	str r1, [r4, r0]
	b _021E7CF8
_021E7B30:
	movs r1, #0x17
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7B7A
	movs r0, #0x62
	str r0, [r4, #0xc]
	adds r0, #0xfe
	adds r0, r4, r0
	movs r1, #1
	bl ov53_021E6908
	b _021E7CF8
_021E7B50:
	movs r1, #0x4d
	lsls r1, r1, #2
	ldrh r1, [r4, r1]
	adds r1, r1, #1
	bl ov53_021E6988
	subs r1, r5, #1
	cmp r0, r1
	beq _021E7B7A
	adds r0, r4, #0
	bl ov53_021E65B4
	movs r0, #0x63
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7B6E:
	ldr r0, _021E7C80 @ =0x00000163
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E7B7C
	cmp r0, #1
	beq _021E7B82
_021E7B7A:
	b _021E7CF8
_021E7B7C:
	movs r0, #0x64
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7B82:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	adds r1, r5, #0
	str r0, [sp, #8]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r5, #0
	bl FUN_0200FA24
	movs r0, #0x47
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7BA0:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	adds r1, r5, #0
	str r0, [sp, #8]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r5, #0
	bl FUN_0200FA24
	movs r0, #0x65
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7BBE:
	bl FUN_0200FB5C
	cmp r0, #1
	beq _021E7BC8
	b _021E7CF8
_021E7BC8:
	movs r0, #6
	adds r1, r5, #0
	bl FUN_0201BC28
	movs r0, #5
	adds r1, r5, #0
	bl FUN_0201BC28
	adds r0, r4, #0
	movs r1, #1
	bl ov53_021E67C4
	adds r0, r4, #0
	movs r1, #3
	bl ov53_021E80B8
	ldr r0, [r4, #0x18]
	movs r1, #4
	bl FUN_0201CAE0
	adds r2, r5, #0
	ldr r0, [r4, #0x18]
	movs r1, #4
	adds r3, r2, #0
	bl FUN_0201F238
	adds r0, r4, #0
	movs r1, #1
	bl ov53_021E7E08
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #4
	adds r3, r5, #0
	bl FUN_0200FA24
	movs r0, #0x66
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C20:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E7CF8
	movs r0, #0x67
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C2E:
	movs r1, #0x2b
	movs r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7CF8
	movs r0, #0x6e
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C40:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r5, #0
	adds r3, r5, #0
	bl FUN_0200FA24
	movs r0, #0x6f
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C5E:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E7CF8
	movs r0, #0x78
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C6C:
	movs r1, #0x4d
	lsls r1, r1, #2
	ldrh r1, [r4, r1]
	cmp r1, #0
	bne _021E7C88
	movs r1, #2
	adds r2, r5, #0
	bl ov53_021E66E8
	b _021E7C90
	.align 2, 0
_021E7C80: .4byte 0x00000163
_021E7C84: .4byte 0x02102610
_021E7C88:
	movs r1, #6
	adds r2, r5, #0
	bl ov53_021E66E8
_021E7C90:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0x79
	str r0, [r4, #0xc]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201BC28
	b _021E7CF8
_021E7CB4:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E7CC0
	movs r0, #0x7b
	str r0, [r4, #0xc]
_021E7CC0:
	movs r0, #0x7c
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7CC6:
	adds r1, r5, #0
	bl ov53_021E7E08
	adds r0, r4, #0
	bl ov53_021E6DF0
	movs r0, #0x7d
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7CD8:
	movs r1, #0x1e
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E7CF8
	ldr r0, _021E7D00 @ =0x00000918
	bl FUN_0200604C
	movs r0, #0x7e
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7CEE:
	bl ov53_021E6E00
	cmp r0, #1
	bne _021E7CF8
	movs r5, #1
_021E7CF8:
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E7D00: .4byte 0x00000918
	thumb_func_end ov53_021E6F9C

	thumb_func_start ov53_021E7D04
ov53_021E7D04: @ 0x021E7D04
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r1, #1
	bl ov53_021E6824
	adds r0, r4, #0
	movs r1, #4
	bl ov53_021E67C4
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #0x30
	movs r3, #0
	bl ov53_021E64C4
	movs r1, #0
	movs r3, #0x4d
	str r1, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x17
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r3, r3, #2
	ldrh r3, [r4, r3]
	movs r2, #1
	ldr r0, [r4, #0x18]
	eors r3, r2
	lsls r3, r3, #0x1c
	movs r1, #7
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	ldr r0, [r4, #0x18]
	movs r1, #7
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov53_021E7D04

	thumb_func_start ov53_021E7D58
ov53_021E7D58: @ 0x021E7D58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	movs r1, #0
	bl FUN_0201CAE0
	ldr r0, [r4, #0x18]
	movs r1, #4
	bl FUN_0201CAE0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov53_021E7D58

	thumb_func_start ov53_021E7D70
ov53_021E7D70: @ 0x021E7D70
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #1
	ldr r1, [r5]
	lsls r0, r0, #0xa
	bl FUN_02026354
	adds r6, r0, #0
	movs r0, #1
	lsls r0, r0, #8
	adds r4, r5, #0
	ldr r0, [r5, r0]
	movs r1, #0x3c
	adds r2, r6, #0
	adds r4, #0x6c
	bl FUN_0200BB6C
	ldr r0, [r5, #0x18]
	ldr r2, _021E7DD4 @ =0x021E8518
	adds r1, r4, #0
	bl FUN_0201D4F8
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E7DD8 @ =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #4
	adds r2, r6, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_0201D578
	adds r0, r4, #0
	bl FUN_0201D520
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E7DD4: .4byte 0x021E8518
_021E7DD8: .4byte 0x000F0100
	thumb_func_end ov53_021E7D70

	thumb_func_start ov53_021E7DDC
ov53_021E7DDC: @ 0x021E7DDC
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x6c
	ldr r0, [r0, #0x18]
	ldr r2, _021E7E04 @ =0x021E8518
	adds r1, r4, #0
	bl FUN_0201D4F8
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	bl FUN_0201D578
	adds r0, r4, #0
	bl FUN_0201D520
	pop {r4, pc}
	nop
_021E7E04: .4byte 0x021E8518
	thumb_func_end ov53_021E7DDC

	thumb_func_start ov53_021E7E08
ov53_021E7E08: @ 0x021E7E08
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _021E7E16
	bl FUN_0202551C
_021E7E16:
	cmp r5, #3
	bhi _021E7E8E
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E7E26: @ jump table
	.2byte _021E7E2E - _021E7E26 - 2 @ case 0
	.2byte _021E7E52 - _021E7E26 - 2 @ case 1
	.2byte _021E7E76 - _021E7E26 - 2 @ case 2
	.2byte _021E7E82 - _021E7E26 - 2 @ case 3
_021E7E2E:
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	bl FUN_020248B8
	cmp r0, #1
	beq _021E7E40
	bl FUN_0202551C
_021E7E40:
	adds r0, r4, #0
	bl ov53_021E7DDC
	adds r4, #0xe4
	ldr r0, [r4]
	movs r1, #0
	bl FUN_02024830
	pop {r3, r4, r5, pc}
_021E7E52:
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	bl FUN_020248B8
	cmp r0, #0
	beq _021E7E64
	bl FUN_0202551C
_021E7E64:
	adds r0, r4, #0
	bl ov53_021E7D70
	adds r4, #0xe4
	ldr r0, [r4]
	movs r1, #1
	bl FUN_02024830
	pop {r3, r4, r5, pc}
_021E7E76:
	adds r4, #0xe4
	ldr r0, [r4]
	movs r1, #1
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
_021E7E82:
	adds r4, #0xe4
	ldr r0, [r4]
	movs r1, #0
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
_021E7E8E:
	bl FUN_0202551C
	pop {r3, r4, r5, pc}
	thumb_func_end ov53_021E7E08

	thumb_func_start ov53_021E7E94
ov53_021E7E94: @ 0x021E7E94
	push {r3, lr}
	adds r0, #0xe4
	ldr r0, [r0]
	bl FUN_020249A8
	cmp r0, #1
	bne _021E7EA6
	movs r0, #1
	pop {r3, pc}
_021E7EA6:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov53_021E7E94

	thumb_func_start ov53_021E7EAC
ov53_021E7EAC: @ 0x021E7EAC
	push {r4, lr}
	adds r4, r0, #0
	bne _021E7EB6
	bl FUN_0202551C
_021E7EB6:
	adds r4, #0xe4
	ldr r0, [r4]
	bl FUN_020248B8
	cmp r0, #1
	bne _021E7EC6
	movs r0, #1
	pop {r4, pc}
_021E7EC6:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov53_021E7EAC

	thumb_func_start ov53_021E7ECC
ov53_021E7ECC: @ 0x021E7ECC
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov53_021E7EAC
	cmp r0, #0
	beq _021E7F18
	ldr r0, _021E7F1C @ =0x021E8510
	bl FUN_02025204
	adds r5, r0, #0
	bne _021E7EFA
	bl FUN_02025358
	cmp r0, #0
	beq _021E7EFA
	ldr r0, _021E7F20 @ =0x021D110C
	movs r1, #1
	str r1, [r0, #0x5c]
	adds r0, r4, #0
	movs r1, #2
	bl ov53_021E7E08
	pop {r3, r4, r5, pc}
_021E7EFA:
	cmp r5, #0
	bne _021E7F10
	adds r0, r4, #0
	bl ov53_021E7E94
	cmp r0, #0
	beq _021E7F10
	ldr r0, _021E7F20 @ =0x021D110C
	movs r1, #1
	str r1, [r0, #0x5c]
	pop {r3, r4, r5, pc}
_021E7F10:
	adds r0, r4, #0
	movs r1, #3
	bl ov53_021E7E08
_021E7F18:
	pop {r3, r4, r5, pc}
	nop
_021E7F1C: .4byte 0x021E8510
_021E7F20: .4byte 0x021D110C
	thumb_func_end ov53_021E7ECC

	thumb_func_start ov53_021E7F24
ov53_021E7F24: @ 0x021E7F24
	push {r3, r4, r5, r6, lr}
	sub sp, #0x44
	adds r4, r0, #0
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x20
	movs r1, #0x50
	bl FUN_0202055C
	movs r0, #0x50
	bl FUN_0200CF18
	adds r1, r4, #0
	adds r1, #0xd0
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl FUN_0200CF38
	adds r1, r4, #0
	adds r1, #0xd4
	add r2, sp, #0x24
	ldr r5, _021E7FE0 @ =0x021E8764
	str r0, [r1]
	ldm r5!, {r0, r1}
	adds r3, r2, #0
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	ldr r6, _021E7FE4 @ =0x021E8750
	stm r2!, {r0, r1}
	add r5, sp, #0x10
	ldm r6!, {r0, r1}
	adds r2, r5, #0
	stm r5!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r5!, {r0, r1}
	ldr r0, [r6]
	adds r1, r3, #0
	str r0, [r5]
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	movs r3, #0x20
	bl FUN_0200CF70
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xd0
	adds r1, #0xd4
	ldr r0, [r0]
	ldr r1, [r1]
	movs r2, #0xa
	bl FUN_0200CFF4
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl FUN_0200CF6C
	movs r2, #3
	movs r1, #0
	lsls r2, r2, #0x12
	bl FUN_02009FC8
	ldr r3, _021E7FE8 @ =0x021E8740
	add r2, sp, #0
	movs r1, #7
_021E7FC0:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _021E7FC0
	adds r0, r4, #0
	adds r0, #0xd0
	adds r4, #0xd4
	ldr r0, [r0]
	ldr r1, [r4]
	add r2, sp, #0
	bl FUN_0200D294
	add sp, #0x44
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E7FE0: .4byte 0x021E8764
_021E7FE4: .4byte 0x021E8750
_021E7FE8: .4byte 0x021E8740
	thumb_func_end ov53_021E7F24

	thumb_func_start ov53_021E7FEC
ov53_021E7FEC: @ 0x021E7FEC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, #0xd0
	adds r1, #0xd4
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D0E4
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl FUN_0200D108
	bl FUN_020205AC
	movs r0, #0
	adds r4, #0xd4
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov53_021E7FEC

	thumb_func_start ov53_021E8014
ov53_021E8014: @ 0x021E8014
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, _021E80B4 @ =0x021E8784
	adds r5, r0, #0
	movs r4, #0
	movs r7, #0x28
_021E801E:
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xd0
	adds r1, #0xd4
	adds r2, r4, #0
	muls r2, r7, r2
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r6, r2
	bl FUN_0200D2B4
	lsls r1, r4, #2
	adds r1, r5, r1
	adds r1, #0xd8
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #6
	blo _021E801E
	adds r0, r5, #0
	adds r0, #0xd8
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #1
	bl FUN_02024A04
	adds r0, r5, #0
	adds r0, #0xec
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0202484C
	adds r0, r5, #0
	adds r0, #0xec
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0202487C
	adds r5, #0xec
	ldr r0, [r5]
	movs r1, #0
	bl FUN_02024830
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E80B4: .4byte 0x021E8784
	thumb_func_end ov53_021E8014

	thumb_func_start ov53_021E80B8
ov53_021E80B8: @ 0x021E80B8
	push {r3, r4, r5, lr}
	movs r2, #0
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r1, #0
	bne _021E80C8
	movs r2, #1
	b _021E80DC
_021E80C8:
	cmp r1, #1
	bne _021E80D0
	movs r4, #1
	b _021E80DC
_021E80D0:
	cmp r1, #2
	bne _021E80DA
	movs r2, #1
	adds r4, r2, #0
	b _021E80DC
_021E80DA:
	cmp r1, #3
_021E80DC:
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	adds r1, r2, #0
	bl FUN_02024830
	adds r5, #0xe0
	ldr r0, [r5]
	adds r1, r4, #0
	bl FUN_02024830
	pop {r3, r4, r5, pc}
	thumb_func_end ov53_021E80B8

	thumb_func_start ov53_021E80F4
ov53_021E80F4: @ 0x021E80F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp]
	cmp r5, #0
	bne _021E8108
	bl FUN_0202551C
_021E8108:
	ldr r0, [sp, #0x24]
	movs r1, #0x3c
	str r0, [sp, #4]
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x3c
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [sp, #0x24]
	str r0, [r4]
	str r5, [r4, #0xc]
	str r6, [r4, #0x10]
	ldr r0, [sp]
	strb r7, [r4, #0x19]
	strb r0, [r4, #0x1a]
	ldr r0, [sp, #0x20]
	strb r0, [r4, #0x18]
	ldr r0, [sp, #4]
	bl FUN_0200BD08
	str r0, [r4, #0x14]
	adds r0, r6, #0
	movs r1, #1
	bl FUN_0202484C
	adds r0, r4, #0
	bl ov53_021E82BC
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov53_021E80F4

	thumb_func_start ov53_021E814C
ov53_021E814C: @ 0x021E814C
	push {r4, lr}
	adds r4, r0, #0
	bne _021E8156
	bl FUN_0202551C
_021E8156:
	adds r0, r4, #0
	bl ov53_021E8310
	ldr r0, [r4, #0x14]
	bl FUN_0200BDA0
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov53_021E814C

	thumb_func_start ov53_021E816C
ov53_021E816C: @ 0x021E816C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r4, [r5]
	ldrb r6, [r5, #0x19]
	adds r7, r1, #0
	movs r0, #0xef
	adds r1, r4, #0
	bl FUN_02007688
	movs r1, #0x20
	str r1, [sp]
	movs r1, #0
	movs r2, #4
	lsls r3, r7, #5
	str r0, [sp, #0x10]
	str r4, [sp, #4]
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r2, [r5, #0xc]
	movs r1, #1
	adds r3, r6, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r2, [r5, #0xc]
	movs r1, #0xa
	adds r3, r6, #0
	bl FUN_02007B68
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r2, #0
	ldr r0, [r5, #0xc]
	adds r1, r6, #0
	adds r3, r2, #0
	bl FUN_0201CA4C
	ldr r0, [r5, #0xc]
	adds r1, r6, #0
	bl FUN_0201BF7C
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0201BC28
	ldr r0, [sp, #0x10]
	bl FUN_0200770C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov53_021E816C

	thumb_func_start ov53_021E81F4
ov53_021E81F4: @ 0x021E81F4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r5, #0
	adds r6, r3, #0
	adds r1, #0x1c
	adds r3, r4, #0
	bl ov53_021E8330
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x2c
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov53_021E8330
	ldrb r1, [r5, #0x1b]
	movs r0, #0xf
	bics r1, r0
	strb r1, [r5, #0x1b]
	ldrb r1, [r5, #0x1b]
	movs r0, #0xf0
	bics r1, r0
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r5, #0x1b]
	adds r0, r5, #0
	bl ov53_021E8390
	ldrb r0, [r5, #0x19]
	movs r1, #1
	bl FUN_0201BC28
	ldrb r0, [r5, #0x1a]
	movs r1, #1
	bl FUN_0201BC28
	ldr r0, [r5, #0x10]
	movs r1, #1
	bl FUN_02024830
	pop {r4, r5, r6, pc}
	thumb_func_end ov53_021E81F4

	thumb_func_start ov53_021E8248
ov53_021E8248: @ 0x021E8248
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #0x1b]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	beq _021E825A
	cmp r1, #1
	beq _021E827E
	b _021E82B2
_021E825A:
	bl ov53_021E83D4
	cmp r0, #0
	beq _021E82B6
	ldrb r2, [r4, #0x1b]
	movs r1, #0xf
	adds r0, r2, #0
	bics r0, r1
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #0xf
	ands r1, r2
	orrs r0, r1
	strb r0, [r4, #0x1b]
	b _021E82B6
_021E827E:
	bl ov53_021E84D4
	cmp r0, #0
	beq _021E82B6
	ldrb r0, [r4, #0x1b]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	bne _021E8292
	bl FUN_0202551C
_021E8292:
	ldrb r0, [r4, #0x19]
	movs r1, #0
	bl FUN_0201BC28
	ldrb r0, [r4, #0x1a]
	movs r1, #0
	bl FUN_0201BC28
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_02024830
	ldrb r0, [r4, #0x1b]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	pop {r4, pc}
_021E82B2:
	bl FUN_0202551C
_021E82B6:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov53_021E8248

	thumb_func_start ov53_021E82BC
ov53_021E82BC: @ 0x021E82BC
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bne _021E82C8
	bl FUN_0202551C
_021E82C8:
	movs r0, #8
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldrb r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x1c
	str r0, [sp, #0xc]
	movs r0, #0x50
	str r0, [sp, #0x10]
	ldrb r2, [r4, #0x1a]
	ldr r0, [r4, #0xc]
	movs r3, #4
	bl FUN_0201D40C
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldrb r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x2c
	str r0, [sp, #0xc]
	movs r0, #0x80
	str r0, [sp, #0x10]
	ldrb r2, [r4, #0x1a]
	ldr r0, [r4, #0xc]
	movs r3, #4
	bl FUN_0201D40C
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov53_021E82BC

	thumb_func_start ov53_021E8310
ov53_021E8310: @ 0x021E8310
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bne _021E831A
	bl FUN_0202551C
_021E831A:
	movs r4, #0
	adds r5, #0x1c
_021E831E:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #2
	blt _021E831E
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov53_021E8310

	thumb_func_start ov53_021E8330
ov53_021E8330: @ 0x021E8330
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r2, #0
	adds r2, r3, #0
	adds r4, r1, #0
	ldr r3, [r5]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	adds r7, r0, #0
	ldr r0, [r5, #0x14]
	ldr r3, [r5]
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_0200BC4C
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E838C @ =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #4
	adds r2, r5, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_0201D578
	adds r0, r7, #0
	bl FUN_0200BB44
	adds r0, r5, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E838C: .4byte 0x000F0100
	thumb_func_end ov53_021E8330

	thumb_func_start ov53_021E8390
ov53_021E8390: @ 0x021E8390
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _021E839E
	bl FUN_0202551C
_021E839E:
	ldrb r0, [r5, #0x1b]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #1
	beq _021E83AE
	cmp r0, #2
	beq _021E83B2
	b _021E83B6
_021E83AE:
	movs r4, #0
	b _021E83BA
_021E83B2:
	movs r4, #1
	b _021E83BA
_021E83B6:
	bl FUN_0202551C
_021E83BA:
	ldr r1, _021E83CC @ =0x021E8874
	lsls r3, r4, #2
	ldr r2, _021E83D0 @ =0x021E8876
	ldrsh r1, [r1, r3]
	ldrsh r2, [r2, r3]
	ldr r0, [r5, #0x10]
	bl FUN_0200DD88
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E83CC: .4byte 0x021E8874
_021E83D0: .4byte 0x021E8876
	thumb_func_end ov53_021E8390

	thumb_func_start ov53_021E83D4
ov53_021E83D4: @ 0x021E83D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _021E84C8 @ =0x021E887C
	movs r4, #0
	bl FUN_02025224
	adds r6, r0, #0
	subs r0, r4, #1
	cmp r6, r0
	beq _021E841E
	ldr r0, _021E84CC @ =0x000005DC
	bl FUN_0200604C
	cmp r6, #0
	beq _021E83F8
	cmp r6, #1
	beq _021E8408
	b _021E8418
_021E83F8:
	ldrb r1, [r5, #0x1b]
	movs r0, #0xf0
	movs r4, #1
	bics r1, r0
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r5, #0x1b]
	b _021E84AA
_021E8408:
	ldrb r1, [r5, #0x1b]
	movs r0, #0xf0
	movs r4, #1
	bics r1, r0
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r5, #0x1b]
	b _021E84AA
_021E8418:
	bl FUN_0202551C
	b _021E84AA
_021E841E:
	ldr r0, _021E84D0 @ =0x021D110C
	movs r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021E844A
	ldrb r1, [r5, #0x1b]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #1
	beq _021E84AA
	movs r0, #0xf0
	bics r1, r0
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r5, #0x1b]
	adds r0, r5, #0
	bl ov53_021E8390
	ldr r0, _021E84CC @ =0x000005DC
	bl FUN_0200604C
	b _021E84AA
_021E844A:
	movs r1, #0x80
	tst r1, r0
	beq _021E8472
	ldrb r1, [r5, #0x1b]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #2
	beq _021E84AA
	movs r0, #0xf0
	bics r1, r0
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r5, #0x1b]
	adds r0, r5, #0
	bl ov53_021E8390
	ldr r0, _021E84CC @ =0x000005DC
	bl FUN_0200604C
	b _021E84AA
_021E8472:
	movs r2, #1
	adds r1, r0, #0
	tst r1, r2
	beq _021E8496
	ldrb r0, [r5, #0x1b]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	bne _021E8492
	bl FUN_0202551C
	ldrb r1, [r5, #0x1b]
	movs r0, #0xf0
	bics r1, r0
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r5, #0x1b]
_021E8492:
	movs r4, #1
	b _021E84AA
_021E8496:
	movs r1, #2
	tst r0, r1
	beq _021E84AA
	ldrb r1, [r5, #0x1b]
	movs r0, #0xf0
	adds r4, r2, #0
	bics r1, r0
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r5, #0x1b]
_021E84AA:
	cmp r4, #0
	beq _021E84C2
	adds r0, r5, #0
	bl ov53_021E8390
	ldr r0, [r5, #0x10]
	movs r1, #3
	bl FUN_020248F0
	ldr r0, _021E84CC @ =0x000005DC
	bl FUN_0200604C
_021E84C2:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_021E84C8: .4byte 0x021E887C
_021E84CC: .4byte 0x000005DC
_021E84D0: .4byte 0x021D110C
	thumb_func_end ov53_021E83D4

	thumb_func_start ov53_021E84D4
ov53_021E84D4: @ 0x021E84D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_020249A8
	cmp r0, #3
	beq _021E84E6
	bl FUN_0202551C
_021E84E6:
	ldr r0, [r4, #0x10]
	bl FUN_02024B68
	cmp r0, #0
	bne _021E84F4
	movs r0, #1
	pop {r4, pc}
_021E84F4:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov53_021E84D4

	.rodata

_021E84F8:
	.byte 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x13, 0x1B, 0x04, 0x06, 0x6D, 0x03, 0x0C, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x90, 0xBF, 0xA8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x04, 0x18, 0x14, 0x07, 0x02, 0x0E, 0xA3, 0x00
	.byte 0x00, 0x04, 0x00, 0x18, 0x18, 0x05, 0x2D, 0x01, 0x00, 0x04, 0x00, 0x18, 0x18, 0x05, 0x2D, 0x01
	.byte 0x19, 0xAD, 0x12, 0x6F, 0x19, 0xAD, 0x90, 0xEF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCC, 0xFF
	.byte 0xFE, 0xFF, 0xCC, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x25, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC7, 0x01, 0x00, 0x00, 0x8F, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xAF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xAF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x32, 0x32, 0xD5, 0x4C, 0x6A, 0x32, 0xD5, 0x84, 0xA2, 0x32, 0xD5, 0xFF, 0x00, 0x00, 0x00
	.byte 0x1A, 0x53, 0x8A, 0xFD, 0x6C, 0xA4, 0x8A, 0xFD, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x53, 0x0A, 0x7D, 0x6C, 0xA4, 0x0A, 0x7D, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x02, 0x06, 0x0D, 0x03, 0x0E, 0x01, 0x00, 0x04, 0x02, 0x10, 0x0D, 0x03, 0x0E, 0x36, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x07, 0x03, 0x12, 0x03, 0x0E, 0x01, 0x00
	.byte 0x04, 0x07, 0x0A, 0x12, 0x03, 0x0E, 0x37, 0x00, 0x04, 0x07, 0x11, 0x12, 0x03, 0x0E, 0x6D, 0x00
	.byte 0x31, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x1A, 0x00, 0x1B, 0x00, 0x19, 0x00, 0x18, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x4E, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x48, 0x00, 0x80, 0x00, 0x78, 0x00, 0x32, 0x5C, 0x03, 0xFB
	.byte 0x63, 0x8C, 0x03, 0xFB, 0xFF, 0x00, 0x00, 0x00
	@ 0x021E8888
