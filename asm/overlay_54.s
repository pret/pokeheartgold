
	thumb_func_start ov54_021E5900
ov54_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x26
	lsls r2, r0, #0x10
	bl FUN_0201A910
	movs r1, #0xcb
	adds r0, r4, #0
	lsls r1, r1, #2
	movs r2, #0x26
	bl FUN_02007280
	movs r2, #0xcb
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r0, [r5, #4]
	bl FUN_0202AD20
	ldrh r1, [r4, #0x18]
	movs r2, #0xf
	lsls r0, r0, #0x10
	bics r1, r2
	lsrs r2, r0, #0x10
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl FUN_0202AD74
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x1f
	ldrh r1, [r4, #0x18]
	movs r2, #0x40
	lsrs r0, r0, #0x19
	bics r1, r2
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl FUN_0202AD90
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x1f
	ldrh r1, [r4, #0x18]
	movs r2, #0x80
	lsrs r0, r0, #0x18
	bics r1, r2
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl FUN_0202AD58
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x1e
	ldrh r1, [r4, #0x18]
	movs r2, #0x30
	lsrs r0, r0, #0x1a
	bics r1, r2
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl FUN_0202ADAC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x1e
	ldrh r2, [r4, #0x18]
	ldr r1, _021E5A08 @ =0xFFFFFCFF
	lsrs r0, r0, #0x16
	ands r1, r2
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl FUN_0202ADCC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x1b
	ldrh r2, [r4, #0x18]
	ldr r1, _021E5A0C @ =0xFFFF83FF
	lsrs r0, r0, #0x11
	ands r1, r2
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #8]
	str r0, [r4, #0x20]
	ldr r0, [r5, #4]
	str r0, [r4, #0x1c]
	movs r0, #0x26
	str r0, [r4]
	ldr r0, [r5, #4]
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x20]
	bl FUN_020183F0
	movs r1, #0x32
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r1, [r4]
	movs r0, #0x28
	bl FUN_02026354
	movs r1, #0xc9
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5A08: .4byte 0xFFFFFCFF
_021E5A0C: .4byte 0xFFFF83FF
	thumb_func_end ov54_021E5900

	thumb_func_start ov54_021E5A10
ov54_021E5A10: @ 0x021E5A10
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _021E5AE2
	ldrh r0, [r4, #0x18]
	movs r1, #0xf
	bics r0, r1
	adds r1, r4, #0
	adds r1, #0x86
	ldrh r2, [r1]
	movs r1, #0xf
	ands r1, r2
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldrh r0, [r4, #0x18]
	movs r1, #0x40
	bics r0, r1
	adds r1, r4, #0
	adds r1, #0xda
	ldrh r1, [r1]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x19
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldrh r1, [r4, #0x18]
	movs r0, #0x80
	bics r1, r0
	ldr r0, _021E5B30 @ =0x0000012E
	ldrh r2, [r4, r0]
	lsls r2, r2, #0x1f
	lsrs r2, r2, #0x18
	orrs r1, r2
	strh r1, [r4, #0x18]
	ldrh r1, [r4, #0x18]
	movs r2, #0x30
	bics r1, r2
	adds r2, r0, #0
	adds r2, #0x54
	ldrh r2, [r4, r2]
	lsls r2, r2, #0x1e
	lsrs r2, r2, #0x1a
	orrs r1, r2
	strh r1, [r4, #0x18]
	ldrh r2, [r4, #0x18]
	ldr r1, _021E5B34 @ =0xFFFFFCFF
	ands r1, r2
	adds r2, r0, #0
	adds r2, #0xa8
	ldrh r2, [r4, r2]
	adds r0, #0xfc
	lsls r2, r2, #0x1e
	lsrs r2, r2, #0x16
	orrs r1, r2
	strh r1, [r4, #0x18]
	ldrh r0, [r4, r0]
	ldrh r2, [r4, #0x18]
	ldr r1, _021E5B38 @ =0xFFFF83FF
	lsls r0, r0, #0x1b
	ands r1, r2
	lsrs r0, r0, #0x11
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bl FUN_0202AD28
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	bl FUN_0202AD7C
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	bl FUN_0202AD98
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	bl FUN_0202AD60
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x1e
	bl FUN_0202ADB4
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1b
	bl FUN_0202ADD4
	b _021E5B08
_021E5AE2:
	cmp r0, #2
	bne _021E5B08
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	bl FUN_0200597C
	ldrh r1, [r4, #0x18]
	movs r0, #0
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x1e
	bl FUN_0202ACF4
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bl FUN_0202AD28
_021E5B08:
	movs r0, #0xc9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #1
	bl FUN_02002B34
	movs r0, #1
	bl FUN_02002B8C
	adds r0, r5, #0
	bl FUN_02007294
	ldr r0, [r4]
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5B30: .4byte 0x0000012E
_021E5B34: .4byte 0xFFFFFCFF
_021E5B38: .4byte 0xFFFF83FF
	thumb_func_end ov54_021E5A10

	thumb_func_start ov54_021E5B3C
ov54_021E5B3C: @ 0x021E5B3C
	push {r3, r4, lr}
	sub sp, #0xc
	bl FUN_02007290
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #5
	bls _021E5B4E
	b _021E5C58
_021E5B4E:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5B5A: @ jump table
	.2byte _021E5B66 - _021E5B5A - 2 @ case 0
	.2byte _021E5B9E - _021E5B5A - 2 @ case 1
	.2byte _021E5BB6 - _021E5B5A - 2 @ case 2
	.2byte _021E5BDE - _021E5B5A - 2 @ case 3
	.2byte _021E5C14 - _021E5B5A - 2 @ case 4
	.2byte _021E5C44 - _021E5B5A - 2 @ case 5
_021E5B66:
	bl ov54_021E5CE4
	cmp r0, #0
	bne _021E5B74
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_021E5B74:
	movs r0, #0
	str r0, [r4, #0xc]
	movs r1, #6
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r2, [r4]
	adds r3, r0, #0
	str r2, [sp, #8]
	adds r2, r1, #0
	bl FUN_0200FA24
	adds r0, r4, #0
	bl ov54_021E6BB8
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200D020
	b _021E5C58
_021E5B9E:
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200D020
	bl FUN_0200FB5C
	cmp r0, #0
	bne _021E5C58
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_021E5BB6:
	ldr r1, [r4, #0x10]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1e
	beq _021E5BCA
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200D020
	b _021E5C58
_021E5BCA:
	bl ov54_021E681C
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200D020
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_021E5BDE:
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200D020
	adds r0, r4, #0
	bl ov54_021E6C08
	cmp r0, #0
	bne _021E5C0E
	movs r0, #0
	str r0, [r4, #0xc]
	movs r1, #6
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r1, [r4]
	adds r2, r0, #0
	str r1, [sp, #8]
	adds r1, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	b _021E5C58
_021E5C0E:
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_021E5C14:
	movs r0, #0xca
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	bl FUN_02020094
	cmp r0, #0
	beq _021E5C2C
	movs r0, #0xca
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	bl FUN_020200A0
_021E5C2C:
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200D020
	bl FUN_0200FB5C
	cmp r0, #0
	bne _021E5C58
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_021E5C44:
	bl ov54_021E5DBC
	cmp r0, #0
	beq _021E5C52
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_021E5C52:
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_021E5C58:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov54_021E5B3C

	thumb_func_start ov54_021E5C64
ov54_021E5C64: @ 0x021E5C64
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5C80 @ =0x021E6CD8
	add r3, sp, #0
	movs r2, #5
_021E5C6E:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5C6E
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E5C80: .4byte 0x021E6CD8
	thumb_func_end ov54_021E5C64

	thumb_func_start ov54_021E5C84
ov54_021E5C84: @ 0x021E5C84
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x1f
	beq _021E5CB4
	ldr r0, _021E5CD4 @ =0x0000022A
	movs r1, #5
	ldrh r0, [r4, r0]
	movs r2, #0x6d
	movs r3, #0xf
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4]
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	bl FUN_0200E644
	ldr r1, [r4, #0x10]
	ldr r0, _021E5CD8 @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r4, #0x10]
_021E5CB4:
	bl FUN_0200D034
	blx FUN_020B62EC
	ldr r0, [r4, #0x14]
	bl FUN_0201EEB4
	ldr r3, _021E5CDC @ =0x027E0000
	ldr r1, _021E5CE0 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	add sp, #8
	pop {r4, pc}
	nop
_021E5CD4: .4byte 0x0000022A
_021E5CD8: .4byte 0xFFDFFFFF
_021E5CDC: .4byte 0x027E0000
_021E5CE0: .4byte 0x00003FF8
	thumb_func_end ov54_021E5C84

	thumb_func_start ov54_021E5CE4
ov54_021E5CE4: @ 0x021E5CE4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021E5CF8
	cmp r1, #1
	beq _021E5D48
	cmp r1, #2
	beq _021E5D62
	b _021E5D9C
_021E5CF8:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5DA8 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5DAC @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	bl ov54_021E5C64
	ldr r2, _021E5DB0 @ =0x04000304
	ldr r0, _021E5DB4 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	adds r0, r4, #0
	bl ov54_021E5E6C
	adds r0, r4, #0
	bl ov54_021E6A7C
	b _021E5D9C
_021E5D48:
	bl ov54_021E5F40
	ldr r3, [r4]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0x2d
	bl FUN_0200BAF8
	str r0, [r4, #0x28]
	adds r0, r4, #0
	bl ov54_021E6360
	b _021E5D9C
_021E5D62:
	bl ov54_021E6004
	adds r0, r4, #0
	bl ov54_021E6238
	ldr r1, [r4]
	movs r0, #0x20
	bl FUN_0202055C
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	bl FUN_0203A964
	adds r0, r4, #0
	bl ov54_021E6B5C
	ldr r0, _021E5DB8 @ =ov54_021E5C84
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #0
	movs r1, #1
	str r0, [r4, #8]
	bl FUN_0201BC28
	movs r0, #1
	pop {r4, pc}
_021E5D9C:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r4, pc}
	nop
_021E5DA8: .4byte 0xFFFFE0FF
_021E5DAC: .4byte 0x04001000
_021E5DB0: .4byte 0x04000304
_021E5DB4: .4byte 0xFFFF7FFF
_021E5DB8: .4byte ov54_021E5C84
	thumb_func_end ov54_021E5CE4

	thumb_func_start ov54_021E5DBC
ov54_021E5DBC: @ 0x021E5DBC
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021E5DCC
	cmp r0, #1
	beq _021E5E24
	b _021E5E56
_021E5DCC:
	bl FUN_020205AC
	ldr r0, [sp]
	bl ov54_021E6164
	ldr r6, [sp]
	movs r7, #0
_021E5DDA:
	adds r0, r6, #0
	adds r0, #0x84
	ldrh r0, [r0]
	movs r4, #0
	cmp r0, #0
	ble _021E5E00
	adds r5, r6, #0
_021E5DE8:
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r6, #0
	adds r0, #0x84
	ldrh r0, [r0]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r0
	blt _021E5DE8
_021E5E00:
	adds r7, r7, #1
	adds r6, #0x54
	cmp r7, #6
	blt _021E5DDA
	ldr r0, [sp]
	ldr r0, [r0, #0x28]
	bl FUN_0200BB44
	ldr r0, [sp]
	bl ov54_021E6000
	ldr r0, [sp]
	bl ov54_021E5F0C
	ldr r0, [sp]
	bl ov54_021E6B34
	b _021E5E56
_021E5E24:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5E64 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5E68 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	ldr r0, [sp]
	movs r1, #0
	str r1, [r0, #8]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E5E56:
	ldr r0, [sp]
	ldr r0, [r0, #8]
	adds r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #8]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E5E64: .4byte 0xFFFFE0FF
_021E5E68: .4byte 0x04001000
	thumb_func_end ov54_021E5DBC

	thumb_func_start ov54_021E5E6C
ov54_021E5E6C: @ 0x021E5E6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x9c
	adds r5, r0, #0
	ldr r0, [r5]
	bl FUN_0201AC88
	add r3, sp, #0
	ldr r4, _021E5F00 @ =0x021E6C48
	str r0, [r5, #0x14]
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r4, _021E5F04 @ =0x021E6E20
	add r3, sp, #0x10
	movs r2, #0x11
_021E5E94:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5E94
	ldr r0, [r4]
	ldr r4, _021E5F08 @ =0x021E6C58
	str r0, [r3]
	movs r7, #0
	add r6, sp, #0x10
_021E5EA6:
	ldr r1, [r4]
	ldr r0, [r5, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r1, [r4]
	ldr r0, [r5, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r7, r7, #1
	adds r6, #0x1c
	adds r4, r4, #4
	cmp r7, #5
	blt _021E5EA6
	movs r0, #0
	ldr r3, [r5]
	movs r1, #0x20
	adds r2, r0, #0
	bl FUN_0201C1C4
	ldr r3, [r5]
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r5]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r5]
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	add sp, #0x9c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E5F00: .4byte 0x021E6C48
_021E5F04: .4byte 0x021E6E20
_021E5F08: .4byte 0x021E6C58
	thumb_func_end ov54_021E5E6C

	thumb_func_start ov54_021E5F0C
ov54_021E5F0C: @ 0x021E5F0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov54_021E5F0C

	thumb_func_start ov54_021E5F40
ov54_021E5F40: @ 0x021E5F40
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x40
	str r0, [sp]
	ldr r0, [r4]
	movs r1, #3
	str r0, [sp, #4]
	movs r0, #0x48
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #8
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	movs r0, #0x48
	movs r3, #4
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #0x13
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	movs r0, #0x48
	movs r3, #4
	bl FUN_02007914
	movs r0, #0x40
	str r0, [sp]
	ldr r0, [r4]
	movs r2, #0
	str r0, [sp, #4]
	movs r0, #0x48
	movs r1, #2
	adds r3, r2, #0
	bl FUN_02007938
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r4]
	movs r1, #7
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	movs r0, #0x48
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #0x11
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	movs r0, #0x48
	movs r3, #2
	bl FUN_02007914
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r4]
	movs r1, #0x12
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	movs r0, #0x48
	bl FUN_02007914
	ldr r3, [r4, #0x10]
	ldr r0, [r4, #0x14]
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x1d
	lsls r4, r3, #2
	ldr r3, _021E5FFC @ =0x021E6C80
	movs r1, #0
	ldr r3, [r3, r4]
	movs r2, #3
	bl FUN_0201BC8C
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E5FFC: .4byte 0x021E6C80
	thumb_func_end ov54_021E5F40

	thumb_func_start ov54_021E6000
ov54_021E6000: @ 0x021E6000
	bx lr
	.align 2, 0
	thumb_func_end ov54_021E6000

	thumb_func_start ov54_021E6004
ov54_021E6004: @ 0x021E6004
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0xa
	str r0, [sp, #0x10]
	adds r1, r4, #0
	movs r2, #1
	ldr r0, [r4, #0x14]
	adds r1, #0x34
	adds r3, r2, #0
	bl FUN_0201D40C
	movs r0, #3
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #0x12
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x2e
	str r0, [sp, #0x10]
	adds r1, r4, #0
	movs r2, #1
	ldr r0, [r4, #0x14]
	adds r1, #0x44
	adds r3, r2, #0
	bl FUN_0201D40C
	movs r0, #0x15
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _021E615C @ =0x0000024A
	adds r1, r4, #0
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x14]
	adds r1, #0x64
	movs r2, #1
	movs r3, #0x18
	bl FUN_0201D40C
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #0x14]
	adds r1, #0x54
	movs r2, #5
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0x15
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _021E6160 @ =0x0000025F
	adds r1, r4, #0
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x14]
	adds r1, #0x74
	movs r2, #1
	movs r3, #0xf
	bl FUN_0201D40C
	ldrh r0, [r4, #0x18]
	movs r1, #5
	movs r2, #0x6d
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x1b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4]
	movs r3, #0xf
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	bl FUN_0200E644
	movs r1, #0x1a
	ldr r2, [r4]
	movs r0, #0
	lsls r1, r1, #4
	bl FUN_02003030
	movs r1, #0x1a
	ldr r2, [r4]
	movs r0, #4
	lsls r1, r1, #4
	bl FUN_02003030
	movs r1, #6
	ldr r2, [r4]
	movs r0, #0
	lsls r1, r1, #6
	bl FUN_0200304C
	movs r1, #6
	ldr r2, [r4]
	movs r0, #4
	lsls r1, r1, #6
	bl FUN_0200304C
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x74
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x54
	movs r1, #0xff
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x54
	bl FUN_0201D634
	adds r0, r4, #0
	adds r0, #0x44
	bl FUN_0201D634
	adds r0, r4, #0
	adds r0, #0x34
	bl FUN_0201D634
	adds r4, #0x54
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x6d
	movs r3, #0xf
	bl FUN_0200E998
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_021E615C: .4byte 0x0000024A
_021E6160: .4byte 0x0000025F
	thumb_func_end ov54_021E6004

	thumb_func_start ov54_021E6164
ov54_021E6164: @ 0x021E6164
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x44
	movs r1, #0
	bl FUN_0200E5D4
	adds r0, r5, #0
	adds r0, #0x54
	movs r1, #0
	bl FUN_0200E9BC
	movs r6, #0
	adds r5, #0x34
	adds r7, r6, #0
_021E6180:
	lsls r4, r6, #4
	adds r0, r5, r4
	bl FUN_0201D8C8
	adds r0, r5, r4
	adds r1, r7, #0
	bl FUN_0201D978
	adds r0, r5, r4
	bl FUN_0201D634
	adds r0, r5, r4
	bl FUN_0201D520
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #5
	blo _021E6180
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov54_021E6164

	thumb_func_start ov54_021E61A8
ov54_021E61A8: @ 0x021E61A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x24]
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_0202AD3C
	adds r7, r0, #0
	movs r0, #0xca
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	bl FUN_02020094
	cmp r0, #0
	beq _021E61D2
	movs r0, #0xca
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	bl FUN_020200A0
_021E61D2:
	ldr r1, _021E6230 @ =0x0000022A
	ldr r0, [r5, #0x28]
	ldrh r1, [r5, r1]
	adds r2, r4, #0
	adds r1, #0x28
	bl FUN_0200BB6C
	adds r0, r5, #0
	adds r0, #0x54
	movs r1, #0xff
	bl FUN_0201D978
	cmp r6, #0
	ldr r0, _021E6234 @ =0x0001020F
	beq _021E620C
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r5, #0x54
	str r1, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	movs r3, #4
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021E620C:
	movs r1, #0
	str r1, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	str r1, [sp, #0xc]
	adds r0, #0x54
	movs r1, #1
	adds r2, r4, #0
	movs r3, #4
	bl FUN_020200FC
	movs r1, #0xca
	lsls r1, r1, #2
	strb r0, [r5, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6230: .4byte 0x0000022A
_021E6234: .4byte 0x0001020F
	thumb_func_end ov54_021E61A8

	thumb_func_start ov54_021E6238
ov54_021E6238: @ 0x021E6238
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r1, [r6]
	movs r0, #0x28
	bl FUN_02026354
	adds r5, r0, #0
	ldr r0, [r6, #0x28]
	movs r1, #0
	adds r2, r5, #0
	bl FUN_0200BB6C
	movs r0, #5
	str r0, [sp]
	movs r1, #0
	ldr r0, _021E635C @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r0, #0x34
	adds r2, r5, #0
	movs r3, #2
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_020263AC
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov54_021E61A8
	adds r7, r6, #0
	movs r4, #0
	adds r7, #0x44
_021E6282:
	adds r0, r5, #0
	bl FUN_020263AC
	ldr r0, [r6, #0x28]
	adds r1, r4, #1
	adds r2, r5, #0
	bl FUN_0200BB6C
	movs r0, #0x18
	muls r0, r4, r0
	adds r0, r0, #5
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E635C @ =0x000F0200
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r2, r5, #0
	movs r3, #4
	bl FUN_020200FC
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #6
	blo _021E6282
	adds r0, r5, #0
	bl FUN_020263AC
	ldr r0, [r6, #0x28]
	movs r1, #8
	adds r2, r5, #0
	bl FUN_0200BB6C
	movs r0, #6
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E635C @ =0x000F0200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r0, #0x64
	adds r2, r5, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_020263AC
	ldr r0, [r6, #0x28]
	movs r1, #7
	adds r2, r5, #0
	bl FUN_0200BB6C
	movs r0, #6
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E635C @ =0x000F0200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r0, #0x74
	adds r2, r5, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	movs r4, #0
_021E6316:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov54_021E6418
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #7
	blo _021E6316
	adds r0, r6, #0
	adds r0, #0x34
	bl FUN_0201D578
	adds r0, r6, #0
	adds r0, #0x44
	bl FUN_0201D578
	adds r0, r6, #0
	adds r0, #0x64
	bl FUN_0201D578
	adds r0, r6, #0
	adds r0, #0x74
	bl FUN_0201D578
	adds r6, #0x54
	adds r0, r6, #0
	bl FUN_0201D578
	adds r0, r5, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E635C: .4byte 0x000F0200
	thumb_func_end ov54_021E6238

	thumb_func_start ov54_021E6360
ov54_021E6360: @ 0x021E6360
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r5, #0
	adds r6, r0, #0
	str r5, [sp, #4]
_021E636A:
	ldr r0, [sp, #4]
	ldr r2, [sp, #4]
	lsls r7, r0, #2
	ldr r0, _021E640C @ =0x021E6C9C
	movs r1, #0x54
	muls r1, r2, r1
	adds r1, r6, r1
	str r1, [sp]
	ldr r0, [r0, r7]
	adds r1, #0x84
	movs r4, #0
	strh r0, [r1]
	cmp r0, #0
	ble _021E63AE
_021E6386:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	adds r1, r5, #0
	lsrs r5, r0, #0x10
	ldr r0, [r6, #0x28]
	adds r1, #9
	bl FUN_0200BBA0
	ldr r1, [sp]
	lsls r2, r4, #2
	adds r1, r1, r2
	adds r1, #0x88
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _021E640C @ =0x021E6C9C
	ldr r0, [r0, r7]
	cmp r4, r0
	blt _021E6386
_021E63AE:
	ldr r0, [sp, #4]
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	cmp r0, #6
	blo _021E636A
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #0x1c
	lsrs r1, r0, #0x1c
	adds r0, r6, #0
	adds r0, #0x86
	strh r1, [r0]
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #0x19
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0xda
	strh r1, [r0]
	ldrh r0, [r6, #0x18]
	ldr r1, _021E6410 @ =0x0000012E
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	strh r0, [r6, r1]
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #0x1a
	lsrs r2, r0, #0x1e
	adds r0, r1, #0
	adds r0, #0x54
	strh r2, [r6, r0]
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #0x16
	lsrs r2, r0, #0x1e
	adds r0, r1, #0
	adds r0, #0xa8
	strh r2, [r6, r0]
	ldrh r0, [r6, #0x18]
	adds r1, #0xfc
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x1b
	strh r0, [r6, r1]
	ldr r0, _021E6414 @ =0x0000027E
	movs r1, #0
	strh r1, [r6, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E640C: .4byte 0x021E6C9C
_021E6410: .4byte 0x0000012E
_021E6414: .4byte 0x0000027E
	thumb_func_end ov54_021E6360

	thumb_func_start ov54_021E6418
ov54_021E6418: @ 0x021E6418
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r6, r1, #0
	str r0, [sp, #0x10]
	ldr r2, _021E65C0 @ =_021E6C30
	movs r1, #0x18
	adds r0, r6, #0
	muls r0, r1, r0
	adds r0, r0, #5
	str r0, [sp, #0x14]
	ldrsb r2, [r2, r6]
	lsls r0, r1, #4
	str r0, [sp]
	ldr r3, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r2, #0x6c
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	str r1, [sp, #4]
	adds r0, #0x44
	movs r1, #0
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	cmp r6, #5
	bhi _021E652E
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E645A: @ jump table
	.2byte _021E6508 - _021E645A - 2 @ case 0
	.2byte _021E652E - _021E645A - 2 @ case 1
	.2byte _021E652E - _021E645A - 2 @ case 2
	.2byte _021E64DE - _021E645A - 2 @ case 3
	.2byte _021E64F2 - _021E645A - 2 @ case 4
	.2byte _021E6466 - _021E645A - 2 @ case 5
_021E6466:
	ldr r4, [sp, #0x10]
	movs r0, #0x54
	adds r7, r6, #0
	muls r7, r0, r7
	adds r4, #0x86
	ldr r0, [sp, #0x10]
	ldrh r1, [r4, r7]
	adds r0, #0x88
	adds r5, r0, r7
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #6
	adds r2, r6, #0
	muls r2, r1, r2
	ldr r1, _021E65C4 @ =0x021E6D00
	lsrs r0, r0, #1
	ldrh r1, [r1, r2]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, [sp, #0x14]
	movs r1, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E65C8 @ =0x00010200
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldrh r2, [r4, r7]
	ldr r0, [sp, #0x10]
	lsls r2, r2, #2
	ldr r2, [r5, r2]
	adds r0, #0x44
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	adds r0, #0x44
	bl FUN_0201D578
	ldr r0, [sp, #0x10]
	movs r2, #0xc9
	lsls r2, r2, #2
	adds r1, r0, #0
	ldr r1, [r1, r2]
	movs r2, #1
	bl ov54_021E61A8
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #0x10]
	movs r0, #2
	lsls r0, r0, #0x14
	orrs r1, r0
	ldr r0, [sp, #0x10]
	add sp, #0x20
	str r1, [r0, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_021E64DE:
	movs r0, #0x54
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	adds r0, #0x86
	ldrh r0, [r0]
	bl FUN_0200597C
	b _021E652E
_021E64F2:
	movs r1, #0x54
	adds r2, r6, #0
	muls r2, r1, r2
	ldr r1, [sp, #0x10]
	movs r0, #0
	adds r1, r1, r2
	adds r1, #0x86
	ldrh r1, [r1]
	bl FUN_0202ACF4
	b _021E652E
_021E6508:
	movs r1, #0x54
	adds r2, r6, #0
	muls r2, r1, r2
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x10]
	adds r1, r1, r2
	adds r1, #0x86
	ldrh r1, [r1]
	ldr r0, [r0, #0x24]
	bl FUN_0202AD28
	ldr r0, [sp, #0x10]
	movs r2, #0xc9
	lsls r2, r2, #2
	adds r1, r0, #0
	ldr r1, [r1, r2]
	movs r2, #0
	bl ov54_021E61A8
_021E652E:
	movs r0, #0x54
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, [sp, #0x10]
	movs r4, #0
	adds r5, r0, r1
	adds r0, r5, #0
	adds r0, #0x84
	ldrh r0, [r0]
	cmp r0, #0
	bls _021E65B2
	bls _021E65B2
	movs r0, #6
	ldr r1, _021E65C4 @ =0x021E6D00
	muls r0, r6, r0
	adds r0, r1, r0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x1c]
	adds r0, #0x44
	str r0, [sp, #0x1c]
_021E6558:
	adds r0, r5, #0
	adds r0, #0x86
	ldrh r0, [r0]
	cmp r4, r0
	bne _021E6566
	ldr r6, _021E65C8 @ =0x00010200
	b _021E6568
_021E6566:
	ldr r6, _021E65CC @ =0x000F0200
_021E6568:
	lsls r7, r4, #2
	adds r1, r5, r7
	adds r1, #0x88
	movs r0, #0
	ldr r1, [r1]
	adds r2, r0, #0
	bl FUN_02002F30
	ldr r1, [sp, #0x18]
	lsls r2, r4, #1
	ldrh r1, [r1, r2]
	lsrs r0, r0, #1
	adds r2, r5, r7
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, [sp, #0x14]
	adds r2, #0x88
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r2, [r2]
	movs r1, #0
	bl FUN_020200FC
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x84
	ldrh r0, [r0]
	cmp r4, r0
	blo _021E6558
_021E65B2:
	ldr r0, [sp, #0x10]
	adds r0, #0x44
	str r0, [sp, #0x10]
	bl FUN_0201D578
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E65C0: .4byte _021E6C30
_021E65C4: .4byte 0x021E6D00
_021E65C8: .4byte 0x00010200
_021E65CC: .4byte 0x000F0200
	thumb_func_end ov54_021E6418

	thumb_func_start ov54_021E65D0
ov54_021E65D0: @ 0x021E65D0
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	adds r4, r3, #0
	cmp r1, #5
	bne _021E6600
	movs r1, #0
	mvns r1, r1
	cmp r4, r1
	bne _021E65F0
	movs r1, #0xbb
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #1
	bl FUN_020248F0
	b _021E6600
_021E65F0:
	cmp r4, #1
	bne _021E6600
	movs r1, #0x2f
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	movs r1, #1
	bl FUN_020248F0
_021E6600:
	cmp r4, #0
	ble _021E6612
	ldrh r0, [r5, #2]
	ldrh r1, [r5]
	adds r0, r0, r4
	blx FUN_020F2998
	strh r1, [r5, #2]
	pop {r3, r4, r5, pc}
_021E6612:
	bge _021E6622
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	adds r0, r0, r1
	subs r0, r0, #1
	blx FUN_020F2998
	strh r1, [r5, #2]
_021E6622:
	pop {r3, r4, r5, pc}
	thumb_func_end ov54_021E65D0

	thumb_func_start ov54_021E6624
ov54_021E6624: @ 0x021E6624
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r1, [r4, #0x10]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1d
	cmp r1, #6
	beq _021E6686
	ldr r3, _021E6810 @ =0x021D110C
	ldr r5, [r3, #0x48]
	movs r3, #0x10
	tst r3, r5
	beq _021E665C
	movs r3, #1
	bl ov54_021E65D0
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1d
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ov54_021E6418
	ldr r0, _021E6814 @ =0x000005DC
	bl FUN_0200604C
	b _021E667E
_021E665C:
	movs r3, #0x20
	tst r5, r3
	beq _021E667E
	subs r3, #0x21
	bl ov54_021E65D0
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1d
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ov54_021E6418
	ldr r0, _021E6814 @ =0x000005DC
	bl FUN_0200604C
_021E667E:
	adds r0, r4, #0
	bl ov54_021E6BB8
	b _021E66DC
_021E6686:
	ldr r2, _021E6810 @ =0x021D110C
	ldr r3, [r2, #0x48]
	movs r2, #0x20
	tst r2, r3
	beq _021E66B4
	adds r2, r4, #0
	movs r3, #0x54
	adds r2, #0x86
	muls r3, r1, r3
	ldrh r1, [r2, r3]
	cmp r1, #0
	bne _021E66DC
	movs r1, #1
	strh r1, [r2, r3]
	ldr r1, [r4, #0x10]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1d
	bl ov54_021E69D4
	ldr r0, _021E6814 @ =0x000005DC
	bl FUN_0200604C
	b _021E66DC
_021E66B4:
	movs r2, #0x10
	tst r2, r3
	beq _021E66DC
	adds r2, r4, #0
	movs r3, #0x54
	adds r2, #0x86
	muls r3, r1, r3
	ldrh r1, [r2, r3]
	cmp r1, #1
	bne _021E66DC
	movs r1, #0
	strh r1, [r2, r3]
	ldr r1, [r4, #0x10]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1d
	bl ov54_021E69D4
	ldr r0, _021E6814 @ =0x000005DC
	bl FUN_0200604C
_021E66DC:
	ldr r0, _021E6810 @ =0x021D110C
	movs r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021E6716
	ldr r0, [r4, #0x10]
	movs r1, #7
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1d
	adds r0, r0, #6
	blx FUN_020F2BA4
	ldr r2, [r4, #0x10]
	movs r0, #0x1c
	bics r2, r0
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1b
	adds r1, r2, #0
	orrs r1, r0
	str r1, [r4, #0x10]
	lsls r1, r1, #0x1b
	adds r0, r4, #0
	lsrs r1, r1, #0x1d
	bl ov54_021E69D4
	ldr r0, _021E6814 @ =0x000005DC
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
_021E6716:
	movs r1, #0x80
	tst r1, r0
	beq _021E674C
	ldr r0, [r4, #0x10]
	movs r1, #7
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1d
	adds r0, r0, #1
	blx FUN_020F2BA4
	ldr r2, [r4, #0x10]
	movs r0, #0x1c
	bics r2, r0
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1b
	adds r1, r2, #0
	orrs r1, r0
	str r1, [r4, #0x10]
	lsls r1, r1, #0x1b
	adds r0, r4, #0
	lsrs r1, r1, #0x1d
	bl ov54_021E69D4
	ldr r0, _021E6814 @ =0x000005DC
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
_021E674C:
	movs r1, #1
	tst r1, r0
	beq _021E67BA
	ldr r1, [r4, #0x10]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1d
	cmp r1, #6
	bne _021E67BA
	movs r0, #0x54
	muls r0, r1, r0
	adds r0, r4, r0
	adds r0, #0x86
	ldrh r0, [r0]
	cmp r0, #1
	ldr r0, [r4, #0x20]
	bne _021E6792
	movs r1, #0
	bl FUN_02018410
	ldr r0, _021E6818 @ =0x0000061A
	bl FUN_0200604C
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_020248F0
	ldr r1, [r4, #0x10]
	movs r0, #3
	bics r1, r0
	movs r0, #1
	orrs r0, r1
	str r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021E6792:
	movs r1, #0
	bl FUN_02018410
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_020248F0
	ldr r1, [r4, #0x10]
	movs r0, #3
	bics r1, r0
	movs r0, #2
	orrs r0, r1
	str r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021E67BA:
	movs r1, #2
	tst r0, r1
	beq _021E680E
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_02018410
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	ldr r0, [r4, #0x10]
	lsls r0, r0, #0x1b
	lsrs r1, r0, #0x1d
	cmp r1, #6
	bne _021E67F6
	movs r0, #0x54
	muls r0, r1, r0
	adds r0, r4, r0
	adds r0, #0x86
	ldrh r0, [r0]
	cmp r0, #0
	bne _021E67F6
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_020248F0
	b _021E6802
_021E67F6:
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_020248F0
_021E6802:
	ldr r1, [r4, #0x10]
	movs r0, #3
	bics r1, r0
	movs r0, #2
	orrs r0, r1
	str r0, [r4, #0x10]
_021E680E:
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6810: .4byte 0x021D110C
_021E6814: .4byte 0x000005DC
_021E6818: .4byte 0x0000061A
	thumb_func_end ov54_021E6624

	thumb_func_start ov54_021E681C
ov54_021E681C: @ 0x021E681C
	push {r3, r4, r5, lr}
	ldr r1, _021E69B8 @ =0x021D114C
	adds r4, r0, #0
	ldrh r1, [r1, #0x24]
	cmp r1, #0
	bne _021E682A
	b _021E6998
_021E682A:
	ldr r0, _021E69BC @ =0x021E6D68
	bl FUN_02025224
	movs r3, #0
	mvns r3, r3
	cmp r0, r3
	bne _021E683A
	b _021E69B4
_021E683A:
	cmp r0, #0xd
	beq _021E6844
	cmp r0, #0xe
	beq _021E68B0
	b _021E691E
_021E6844:
	ldr r1, [r4, #0x10]
	movs r2, #0x1c
	bics r1, r2
	lsls r2, r0, #3
	ldr r0, _021E69C0 @ =0x021E6DA8
	ldr r0, [r0, r2]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1b
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl ov54_021E6BB8
	adds r0, r4, #0
	bl ov54_021E6A64
	ldr r1, [r4, #0x10]
	movs r0, #3
	bics r1, r0
	movs r0, #1
	orrs r0, r1
	str r0, [r4, #0x10]
	ldr r0, _021E69C4 @ =0x0000061A
	bl FUN_0200604C
	movs r0, #0x32
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #0x20]
	bl FUN_02018410
	ldr r1, [r4, #0x10]
	movs r0, #1
	lsls r1, r1, #0x1b
	lsrs r2, r1, #0x1d
	movs r1, #0x54
	muls r1, r2, r1
	adds r1, r4, r1
	adds r1, #0x86
	strh r0, [r1]
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1d
	bl ov54_021E69D4
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
_021E68B0:
	ldr r1, [r4, #0x10]
	movs r2, #0x1c
	bics r1, r2
	lsls r2, r0, #3
	ldr r0, _021E69C0 @ =0x021E6DA8
	ldr r0, [r0, r2]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1b
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl ov54_021E6BB8
	adds r0, r4, #0
	bl ov54_021E6A64
	ldr r1, [r4, #0x10]
	movs r0, #3
	bics r1, r0
	movs r0, #2
	orrs r0, r1
	str r0, [r4, #0x10]
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #0x32
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #0x20]
	bl FUN_02018410
	ldr r1, [r4, #0x10]
	movs r0, #0
	lsls r1, r1, #0x1b
	lsrs r2, r1, #0x1d
	movs r1, #0x54
	muls r1, r2, r1
	adds r1, r4, r1
	adds r1, #0x86
	strh r0, [r1]
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1d
	bl ov54_021E69D4
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
_021E691E:
	lsls r5, r0, #3
	ldr r0, [r4, #0x10]
	movs r1, #0x1c
	bics r0, r1
	ldr r1, _021E69C0 @ =0x021E6DA8
	adds r2, r4, #0
	ldr r1, [r1, r5]
	adds r2, #0x84
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1b
	orrs r0, r1
	str r0, [r4, #0x10]
	lsls r0, r0, #0x1b
	lsrs r1, r0, #0x1d
	movs r0, #0x54
	muls r0, r1, r0
	adds r2, r2, r0
	ldr r0, _021E69C8 @ =0x021E6DAC
	ldr r0, [r0, r5]
	cmp r0, #3
	bne _021E6950
	adds r0, r4, #0
	bl ov54_021E65D0
	b _021E6960
_021E6950:
	cmp r0, #4
	bne _021E695E
	adds r0, r4, #0
	movs r3, #1
	bl ov54_021E65D0
	b _021E6960
_021E695E:
	strh r0, [r2, #2]
_021E6960:
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1d
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ov54_021E6418
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1d
	bl ov54_021E69D4
	adds r0, r4, #0
	bl ov54_021E6BB8
	adds r0, r4, #0
	bl ov54_021E6A64
	movs r0, #0x32
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _021E69CC @ =0x000005DC
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
_021E6998:
	ldr r1, _021E69D0 @ =0x021D110C
	ldr r1, [r1, #0x48]
	cmp r1, #0
	beq _021E69B4
	ldr r2, [r4, #0x10]
	adds r1, r4, #0
	lsls r2, r2, #0x1b
	lsrs r3, r2, #0x1d
	movs r2, #0x54
	adds r1, #0x84
	muls r2, r3, r2
	adds r1, r1, r2
	bl ov54_021E6624
_021E69B4:
	pop {r3, r4, r5, pc}
	nop
_021E69B8: .4byte 0x021D114C
_021E69BC: .4byte 0x021E6D68
_021E69C0: .4byte 0x021E6DA8
_021E69C4: .4byte 0x0000061A
_021E69C8: .4byte 0x021E6DAC
_021E69CC: .4byte 0x000005DC
_021E69D0: .4byte 0x021D110C
	thumb_func_end ov54_021E681C

	thumb_func_start ov54_021E69D4
ov54_021E69D4: @ 0x021E69D4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #6
	bne _021E6A28
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201BC28
	movs r0, #0x54
	muls r0, r4, r0
	adds r0, r5, r0
	adds r0, #0x86
	ldrh r0, [r0]
	cmp r0, #0
	bne _021E6A0E
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_020248F0
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
_021E6A0E:
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_020248F0
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
_021E6A28:
	ldr r3, [r5, #0x10]
	ldr r0, [r5, #0x14]
	lsls r3, r3, #0x1b
	lsrs r3, r3, #0x1d
	lsls r4, r3, #2
	ldr r3, _021E6A60 @ =0x021E6C80
	movs r1, #0
	ldr r3, [r3, r4]
	movs r2, #3
	bl FUN_0201BC8C
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_020248F0
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_020248F0
	movs r0, #0
	movs r1, #1
	bl FUN_0201BC28
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6A60: .4byte 0x021E6C80
	thumb_func_end ov54_021E69D4

	thumb_func_start ov54_021E6A64
ov54_021E6A64: @ 0x021E6A64
	push {r3, lr}
	ldr r0, [r0, #0x10]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1d
	cmp r0, #6
	bne _021E6A78
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201BC28
_021E6A78:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov54_021E6A64

	thumb_func_start ov54_021E6A7C
ov54_021E6A7C: @ 0x021E6A7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r4, r0, #0
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, [r4]
	bl FUN_0200CF18
	movs r1, #0x2d
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl FUN_0200CF38
	movs r7, #0xb5
	lsls r7, r7, #2
	add r2, sp, #0x24
	ldr r3, _021E6B28 @ =0x021E6CB8
	str r0, [r4, r7]
	ldm r3!, {r0, r1}
	adds r6, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	ldr r5, _021E6B2C @ =0x021E6C6C
	stm r2!, {r0, r1}
	add r3, sp, #0x10
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
	movs r2, #9
	bl FUN_0200CFF4
	ldr r3, _021E6B30 @ =0x021E6C38
	add r2, sp, #0
	movs r1, #7
_021E6AF2:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _021E6AF2
	movs r1, #0x2d
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0
	bl FUN_0200D294
	movs r0, #0x2d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200CF6C
	movs r2, #1
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_021E6B28: .4byte 0x021E6CB8
_021E6B2C: .4byte 0x021E6C6C
_021E6B30: .4byte 0x021E6C38
	thumb_func_end ov54_021E6A7C

	thumb_func_start ov54_021E6B34
ov54_021E6B34: @ 0x021E6B34
	push {r4, lr}
	movs r1, #0x2d
	adds r4, r0, #0
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_0200D0E4
	movs r0, #0x2d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200D108
	movs r0, #0xb5
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov54_021E6B34

	thumb_func_start ov54_021E6B5C
ov54_021E6B5C: @ 0x021E6B5C
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _021E6BB4 @ =0x021E6EAC
	adds r6, r0, #0
	movs r4, #0
_021E6B64:
	lsls r0, r4, #2
	adds r5, r6, r0
	movs r0, #0x2d
	movs r1, #0xb5
	lsls r0, r0, #4
	lsls r1, r1, #2
	movs r2, #0x28
	muls r2, r4, r2
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	adds r2, r7, r2
	bl FUN_0200D2B4
	movs r1, #0xb6
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_0200DD3C
	movs r0, #0xb6
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #9
	blo _021E6B64
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_02024830
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6BB4: .4byte 0x021E6EAC
	thumb_func_end ov54_021E6B5C

	thumb_func_start ov54_021E6BB8
ov54_021E6BB8: @ 0x021E6BB8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _021E6C04 @ =0x021E6D2C
	movs r7, #0
	adds r6, r5, #0
_021E6BC2:
	movs r0, #0xb6
	lsls r0, r0, #2
	add r1, sp, #0
	ldr r0, [r5, r0]
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE00
	adds r0, r6, #0
	adds r0, #0x86
	ldrh r0, [r0]
	add r2, sp, #0
	adds r3, r2, #0
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	add r0, sp, #0
	strh r1, [r0, #2]
	movs r1, #2
	movs r0, #0xb6
	ldrsh r1, [r2, r1]
	movs r2, #0
	lsls r0, r0, #2
	ldrsh r2, [r3, r2]
	ldr r0, [r5, r0]
	bl FUN_0200DD88
	adds r7, r7, #1
	adds r5, r5, #4
	adds r4, #0xc
	adds r6, #0x54
	cmp r7, #5
	blt _021E6BC2
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6C04: .4byte 0x021E6D2C
	thumb_func_end ov54_021E6BB8

	thumb_func_start ov54_021E6C08
ov54_021E6C08: @ 0x021E6C08
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024B68
	cmp r0, #0
	bne _021E6C2C
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024B68
	cmp r0, #0
	bne _021E6C2C
	movs r0, #0
	pop {r4, pc}
_021E6C2C:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov54_021E6C08

	.rodata

_021E6C30:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x16, 0x00, 0x17, 0x00, 0x15, 0x00, 0x14, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x4D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0xF8, 0xFF, 0xFF, 0xFF, 0xE0, 0xFF, 0xFF, 0xFF, 0xC8, 0xFF, 0xFF, 0xFF, 0xB0, 0xFF, 0xFF, 0xFF
	.byte 0x98, 0xFF, 0xFF, 0xFF, 0x80, 0xFF, 0xFF, 0xFF, 0x64, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x7C, 0x00, 0xAC, 0x00, 0xDC, 0x00, 0x7C, 0x00, 0xAC, 0x00, 0x00, 0x00, 0x84, 0x00, 0xD4, 0x00
	.byte 0x00, 0x00, 0x84, 0x00, 0xD4, 0x00, 0x00, 0x00, 0x84, 0x00, 0xD4, 0x00, 0x00, 0x00, 0xAC, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x70, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x2E, 0x70, 0x97, 0x1A, 0x2E, 0xA0, 0xC8
	.byte 0x1A, 0x2E, 0xD0, 0xF8, 0x32, 0x46, 0x70, 0x97, 0x32, 0x46, 0xA0, 0xC8, 0x4A, 0x5D, 0x70, 0xA7
	.byte 0x4A, 0x5D, 0xC0, 0xF7, 0x62, 0x75, 0x70, 0xA7, 0x62, 0x75, 0xC0, 0xF7, 0x7A, 0x8E, 0x70, 0xA7
	.byte 0x7A, 0x8E, 0xC0, 0xF7, 0x92, 0xA6, 0x6E, 0x96, 0x92, 0xA6, 0xD0, 0xFD, 0xAC, 0xBF, 0x80, 0xB4
	.byte 0xAC, 0xBF, 0xB7, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x70, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x70, 0x00, 0x48, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x60, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x70, 0x00, 0x78, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x73, 0x00, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xD5, 0x00, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xBC, 0x00, 0xAA, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x74, 0x00, 0xAA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

	@ 0x021E7014
