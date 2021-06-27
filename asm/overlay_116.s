
	thumb_func_start ov116_0225F020
ov116_0225F020: @ 0x0225F020
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldrh r0, [r4, #8]
	ldr r1, [r5, #0x24]
	bl FUN_02023494
	ldr r0, [r4]
	ldr r1, [r5, #0x24]
	bl FUN_020235D4
	ldrh r1, [r4, #4]
	add r0, sp, #0
	strh r1, [r0]
	ldrh r1, [r4, #6]
	strh r1, [r0, #2]
	movs r1, #0
	strh r1, [r0, #4]
	ldr r1, [r5, #0x24]
	add r0, sp, #0
	bl FUN_02023558
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov116_0225F020

	thumb_func_start ov116_0225F054
ov116_0225F054: @ 0x0225F054
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r6, r0, #0
	ldr r0, [r4]
	ldr r5, [r4, #0xc]
	cmp r0, #7
	bls _0225F066
	b _0225F1A6
_0225F066:
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225F072: @ jump table
	.2byte _0225F082 - _0225F072 - 2 @ case 0
	.2byte _0225F0BA - _0225F072 - 2 @ case 1
	.2byte _0225F0D2 - _0225F072 - 2 @ case 2
	.2byte _0225F0E0 - _0225F072 - 2 @ case 3
	.2byte _0225F104 - _0225F072 - 2 @ case 4
	.2byte _0225F140 - _0225F072 - 2 @ case 5
	.2byte _0225F162 - _0225F072 - 2 @ case 6
	.2byte _0225F178 - _0225F072 - 2 @ case 7
_0225F082:
	movs r0, #4
	movs r1, #0x10
	bl FUN_0201AA8C
	str r0, [r4, #0xc]
	movs r2, #0x10
	movs r1, #0
_0225F090:
	strb r1, [r0]
	adds r0, r0, #1
	subs r2, r2, #1
	bne _0225F090
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225F0BA:
	movs r0, #1
	movs r1, #0x10
	str r0, [sp]
	adds r2, r1, #0
	adds r3, r4, #4
	bl FUN_021EFCF8
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225F0D2:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _0225F1A6
	adds r0, r0, #1
	add sp, #0xc
	str r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225F0E0:
	movs r0, #3
	movs r1, #0xf
	bl FUN_021F467C
	movs r2, #0
	str r0, [r5]
	movs r0, #0xc
	adds r1, r2, #0
	muls r1, r0, r1
	ldr r0, _0225F1AC @ =0x0225F3B6
	str r2, [r5, #8]
	ldrh r0, [r0, r1]
	add sp, #0xc
	str r0, [r5, #0xc]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225F104:
	ldr r0, [r5, #0xc]
	subs r0, r0, #1
	str r0, [r5, #0xc]
	bpl _0225F1A6
	ldr r2, [r5, #8]
	movs r1, #0xc
	ldr r3, _0225F1B0 @ =0x0225F3AC
	muls r1, r2, r1
	ldr r0, [r4, #0x10]
	adds r1, r3, r1
	bl ov116_0225F020
	ldr r0, [r5, #8]
	adds r2, r0, #1
	str r2, [r5, #8]
	cmp r2, #0x10
	blo _0225F130
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225F130:
	movs r0, #0xc
	adds r1, r2, #0
	muls r1, r0, r1
	ldr r0, _0225F1AC @ =0x0225F3B6
	add sp, #0xc
	ldrh r0, [r0, r1]
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, pc}
_0225F140:
	movs r0, #0xa
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	movs r1, #0
	str r0, [sp, #8]
	ldr r3, _0225F1B4 @ =0x00007FFF
	movs r0, #3
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225F162:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225F1A6
	movs r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0225F178:
	ldr r1, _0225F1B4 @ =0x00007FFF
	movs r0, #1
	bl FUN_0200FBF4
	adds r0, r5, #0
	bl FUN_021F46DC
	ldr r0, _0225F1B8 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r1, [r4, #0x14]
	cmp r1, #0
	beq _0225F196
	movs r0, #1
	str r0, [r1]
_0225F196:
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_021EFCDC
	ldr r1, _0225F1B4 @ =0x00007FFF
	movs r0, #1
	bl FUN_0200FBF4
_0225F1A6:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0225F1AC: .4byte 0x0225F3B6
_0225F1B0: .4byte 0x0225F3AC
_0225F1B4: .4byte 0x00007FFF
_0225F1B8: .4byte 0x04000050
	thumb_func_end ov116_0225F054

	thumb_func_start ov116_0225F1BC
ov116_0225F1BC: @ 0x0225F1BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r7, r0, #0
	ldr r0, [r4]
	adds r6, r2, #0
	ldr r5, [r4, #0xc]
	cmp r0, #9
	bhi _0225F240
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225F1DA: @ jump table
	.2byte _0225F1EE - _0225F1DA - 2 @ case 0
	.2byte _0225F222 - _0225F1DA - 2 @ case 1
	.2byte _0225F23A - _0225F1DA - 2 @ case 2
	.2byte _0225F24A - _0225F1DA - 2 @ case 3
	.2byte _0225F276 - _0225F1DA - 2 @ case 4
	.2byte _0225F2A0 - _0225F1DA - 2 @ case 5
	.2byte _0225F2CE - _0225F1DA - 2 @ case 6
	.2byte _0225F2F0 - _0225F1DA - 2 @ case 7
	.2byte _0225F312 - _0225F1DA - 2 @ case 8
	.2byte _0225F328 - _0225F1DA - 2 @ case 9
_0225F1EE:
	movs r0, #4
	movs r1, #0x38
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x38
	str r0, [r4, #0xc]
	blx FUN_020E5B44
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F222:
	movs r0, #1
	movs r1, #0x10
	str r0, [sp]
	adds r2, r1, #0
	adds r3, r4, #4
	bl FUN_021EFCF8
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F23A:
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _0225F242
_0225F240:
	b _0225F356
_0225F242:
	adds r0, r0, #1
	add sp, #0xc
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F24A:
	ldrh r0, [r6, #0x10]
	ldrh r1, [r6, #0x12]
	bl FUN_021F467C
	str r0, [r5]
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl FUN_0202360C
	ldr r2, [r6, #4]
	adds r1, r0, #0
	adds r5, #8
	ldrb r3, [r6]
	adds r0, r5, #0
	adds r2, r1, r2
	bl FUN_021EFE34
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F276:
	adds r0, r5, #0
	adds r0, #8
	bl FUN_021EFE44
	adds r7, r0, #0
	ldr r0, [r5, #8]
	ldr r1, [r4, #0x10]
	lsls r0, r0, #0x10
	ldr r1, [r1, #0x24]
	lsrs r0, r0, #0x10
	bl FUN_02023494
	cmp r7, #1
	bne _0225F356
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	ldrb r0, [r6, #1]
	str r0, [r5, #0x34]
	pop {r4, r5, r6, r7, pc}
_0225F2A0:
	ldr r0, [r5, #0x34]
	subs r0, r0, #1
	str r0, [r5, #0x34]
	bpl _0225F356
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	bl FUN_02023614
	adds r1, r0, #0
	ldrb r0, [r6, #2]
	adds r5, #0x1c
	str r0, [sp]
	ldr r2, [r6, #8]
	ldr r3, [r6, #0xc]
	adds r0, r5, #0
	adds r2, r1, r2
	bl FUN_021EFEC8
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F2CE:
	adds r0, r5, #0
	adds r0, #0x1c
	bl FUN_021EFF28
	ldr r1, [r4, #0x10]
	adds r6, r0, #0
	ldr r0, [r5, #0x1c]
	ldr r1, [r1, #0x24]
	bl FUN_020235D4
	cmp r6, #1
	bne _0225F356
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F2F0:
	ldrb r0, [r6, #3]
	movs r1, #0
	ldr r3, _0225F35C @ =0x00007FFF
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F312:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225F356
	movs r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_0225F328:
	ldr r1, _0225F35C @ =0x00007FFF
	movs r0, #1
	bl FUN_0200FBF4
	adds r0, r5, #0
	bl FUN_021F46DC
	ldr r0, _0225F360 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r1, [r4, #0x14]
	cmp r1, #0
	beq _0225F346
	movs r0, #1
	str r0, [r1]
_0225F346:
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_021EFCDC
	ldr r1, _0225F35C @ =0x00007FFF
	movs r0, #1
	bl FUN_0200FBF4
_0225F356:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225F35C: .4byte 0x00007FFF
_0225F360: .4byte 0x04000050
	thumb_func_end ov116_0225F1BC

	thumb_func_start ov116_0225F364
ov116_0225F364: @ 0x0225F364
	ldr r3, _0225F36C @ =ov116_0225F1BC
	ldr r2, _0225F370 @ =_0225F384
	bx r3
	nop
_0225F36C: .4byte ov116_0225F1BC
_0225F370: .4byte _0225F384
	thumb_func_end ov116_0225F364

	thumb_func_start ov116_0225F374
ov116_0225F374: @ 0x0225F374
	ldr r3, _0225F37C @ =ov116_0225F1BC
	ldr r2, _0225F380 @ =0x0225F398
	bx r3
	nop
_0225F37C: .4byte ov116_0225F1BC
_0225F380: .4byte 0x0225F398
	thumb_func_end ov116_0225F374

	.rodata

_0225F384:
	.byte 0x28, 0x05, 0x08, 0x3C, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC0, 0xD6, 0xFF
	.byte 0x00, 0x08, 0x00, 0x00, 0x05, 0x00, 0x0D, 0x00, 0x28, 0x05, 0x08, 0x3C, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0xA0, 0xDD, 0xFF, 0x00, 0x08, 0x00, 0x00, 0x05, 0x00, 0x0D, 0x00, 0xC1, 0xAE, 0x29, 0x00
	.byte 0x02, 0xD6, 0x00, 0x00, 0xC1, 0x05, 0x04, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0x02, 0xCF, 0x00, 0xFF
	.byte 0x01, 0x06, 0x04, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0x02, 0xE6, 0x00, 0x10, 0x91, 0x06, 0x04, 0x00
	.byte 0xC1, 0xAE, 0x29, 0x00, 0x02, 0xD6, 0x00, 0x0A, 0x11, 0x07, 0x03, 0x00, 0xC1, 0xAE, 0x29, 0x00
	.byte 0x02, 0xE1, 0x00, 0xF0, 0x80, 0x07, 0x03, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0x02, 0xC6, 0x00, 0x00
	.byte 0x51, 0x07, 0x03, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0x02, 0xE0, 0x00, 0xF0, 0x00, 0x08, 0x03, 0x00
	.byte 0xC1, 0xAE, 0x29, 0x00, 0x02, 0xD6, 0x00, 0x00, 0x02, 0x08, 0x03, 0x00, 0xC1, 0xAE, 0x29, 0x00
	.byte 0x02, 0xD0, 0x00, 0x10, 0x00, 0x08, 0x03, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0x02, 0xD9, 0x00, 0xF5
	.byte 0x51, 0x07, 0x03, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0x02, 0xD0, 0x00, 0x0A, 0xC1, 0x04, 0x02, 0x00
	.byte 0xC1, 0xAE, 0x29, 0x00, 0x02, 0xE0, 0x00, 0xF0, 0xC1, 0x03, 0x02, 0x00, 0xC1, 0xAE, 0x29, 0x00
	.byte 0x02, 0xD0, 0x00, 0xF0, 0x50, 0x06, 0x01, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0x02, 0xE0, 0x00, 0xA0
	.byte 0x41, 0x02, 0x01, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0xA2, 0xE1, 0x00, 0x05, 0x00, 0x05, 0x01, 0x00
	.byte 0xC1, 0xAE, 0x29, 0x00, 0x02, 0xD6, 0x00, 0x00, 0x41, 0x02, 0x01, 0x00
	@ 0x0225F46C
