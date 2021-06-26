
	thumb_func_start ov78_021E5900
ov78_021E5900: @ 0x021E5900
	push {r3, r4, r5, r6, r7, lr}
	movs r2, #2
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x52
	lsls r2, r2, #0x10
	bl FUN_0201A910
	adds r0, r5, #0
	movs r1, #0x5c
	movs r2, #0x52
	bl FUN_02007280
	movs r1, #0
	movs r2, #0x5c
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r0, r5, #0
	bl FUN_020072A4
	adds r5, r0, #0
	ldr r0, [r5]
	bl FUN_0205BD64
	adds r6, r0, #0
	cmp r5, #0
	bne _021E593C
	bl FUN_0202551C
_021E593C:
	ldr r0, [r5]
	cmp r0, #0
	bne _021E5946
	bl FUN_0202551C
_021E5946:
	ldr r0, [r5]
	bl FUN_02074904
	adds r7, r0, #0
	movs r0, #0x52
	str r0, [r4]
	ldr r0, [r5]
	str r0, [r4, #8]
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	bl FUN_02028E9C
	str r0, [r4, #0xc]
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_02074644
	str r0, [r4, #0x10]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A120
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E59E0 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E59E4 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	adds r0, r4, #0
	bl ov78_021E5BAC
	adds r0, r4, #0
	bl ov78_021E5D94
	ldr r0, _021E59E8 @ =ov78_021E5B60
	adds r1, r4, #0
	bl FUN_0201A0FC
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _021E59D6
	adds r0, r4, #0
	bl ov78_021E628C
	adds r0, r4, #0
	bl ov78_021E636C
_021E59D6:
	bl FUN_02022D24
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E59E0: .4byte 0xFFFFE0FF
_021E59E4: .4byte 0x04001000
_021E59E8: .4byte ov78_021E5B60
	thumb_func_end ov78_021E5900

	thumb_func_start ov78_021E59EC
ov78_021E59EC: @ 0x021E59EC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	movs r6, #0
	cmp r1, #5
	bls _021E5A02
	b _021E5B14
_021E5A02:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5A0E: @ jump table
	.2byte _021E5A1A - _021E5A0E - 2 @ case 0
	.2byte _021E5A76 - _021E5A0E - 2 @ case 1
	.2byte _021E5A8A - _021E5A0E - 2 @ case 2
	.2byte _021E5AA6 - _021E5A0E - 2 @ case 3
	.2byte _021E5AD0 - _021E5A0E - 2 @ case 4
	.2byte _021E5B0A - _021E5A0E - 2 @ case 5
_021E5A1A:
	bl ov78_021E5E44
	adds r0, r4, #0
	bl ov78_021E5EA4
	adds r0, r4, #0
	bl ov78_021E6068
	adds r0, r6, #0
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
	movs r0, #5
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
	adds r0, r6, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	str r0, [r5]
	b _021E5B14
_021E5A76:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E5B14
	adds r0, r6, #0
	adds r4, #0x42
	strh r0, [r4]
	movs r0, #2
	str r0, [r5]
	b _021E5B14
_021E5A8A:
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x3c
	bhs _021E5AA0
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r4, #0x42
	adds r0, r0, #1
	strh r0, [r4]
	b _021E5B14
_021E5AA0:
	movs r0, #3
	str r0, [r5]
	b _021E5B14
_021E5AA6:
	movs r1, #0x40
	ldrsh r2, [r4, r1]
	adds r1, r6, #0
	subs r1, #0xc0
	cmp r2, r1
	ble _021E5ABE
	subs r1, r2, #4
	adds r4, #0x40
	strh r1, [r4]
	bl ov78_021E5E54
	b _021E5B14
_021E5ABE:
	adds r1, r6, #0
	subs r1, #0xc0
	adds r4, #0x40
	strh r1, [r4]
	bl ov78_021E5E54
	movs r0, #4
	str r0, [r5]
	b _021E5B14
_021E5AD0:
	ldr r0, _021E5B1C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	ands r0, r1
	cmp r0, #1
	beq _021E5AEC
	movs r0, #2
	ands r0, r1
	cmp r0, #2
	beq _021E5AEC
	ldr r0, _021E5B20 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021E5B14
_021E5AEC:
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
	movs r0, #5
	str r0, [r5]
	b _021E5B14
_021E5B0A:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E5B14
	movs r6, #1
_021E5B14:
	adds r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021E5B1C: .4byte 0x021D110C
_021E5B20: .4byte 0x021D114C
	thumb_func_end ov78_021E59EC

	thumb_func_start ov78_021E5B24
ov78_021E5B24: @ 0x021E5B24
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r1, [r4, #4]
	ldr r5, [r4]
	cmp r1, #2
	bne _021E5B3A
	bl ov78_021E6338
_021E5B3A:
	adds r0, r4, #0
	bl ov78_021E5E24
	adds r0, r4, #0
	bl ov78_021E5D18
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	adds r0, r6, #0
	bl FUN_02007294
	adds r0, r5, #0
	bl FUN_0201A9C4
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov78_021E5B24

	thumb_func_start ov78_021E5B60
ov78_021E5B60: @ 0x021E5B60
	push {r4, lr}
	adds r4, r0, #0
	bne _021E5B6A
	bl FUN_0202551C
_021E5B6A:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _021E5B74
	bl FUN_0202551C
_021E5B74:
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _021E5B8E
	ldr r0, [r4, #0x48]
	cmp r0, #0
	bne _021E5B84
	bl FUN_0202551C
_021E5B84:
	ldr r0, [r4, #0x48]
	bl FUN_0200D020
	bl FUN_0200D034
_021E5B8E:
	ldr r0, [r4, #0x14]
	bl FUN_0201EEB4
	ldr r3, _021E5BA4 @ =0x027E0000
	ldr r1, _021E5BA8 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E5BA4: .4byte 0x027E0000
_021E5BA8: .4byte 0x00003FF8
	thumb_func_end ov78_021E5B60

	thumb_func_start ov78_021E5BAC
ov78_021E5BAC: @ 0x021E5BAC
	push {r4, r5, lr}
	sub sp, #0x54
	ldr r5, _021E5D0C @ =0x021E6858
	adds r4, r0, #0
	add r3, sp, #0x2c
	movs r2, #5
_021E5BB8:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5BB8
	add r0, sp, #0x2c
	bl FUN_02022BE8
	ldr r0, [r4]
	bl FUN_0201AC88
	add r3, sp, #0x1c
	ldr r5, _021E5D10 @ =0x021E67E0
	str r0, [r4, #0x14]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E5D14 @ =0x021E681C
	add r3, sp, #0
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
	add r0, sp, #0
	strb r1, [r0, #0x12]
	movs r3, #4
	strb r3, [r0, #0x13]
	lsls r3, r3, #0xa
	str r3, [sp, #8]
	movs r3, #2
	strb r3, [r0, #0x10]
	ldr r0, [r4, #0x14]
	adds r3, r1, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0201CAE0
	movs r2, #2
	add r0, sp, #0
	strb r2, [r0, #0x12]
	strb r2, [r0, #0x13]
	lsls r1, r2, #0xb
	str r1, [sp, #8]
	strb r2, [r0, #0x10]
	ldr r0, [r4, #0x14]
	movs r1, #1
	add r2, sp, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0201CAE0
	movs r1, #4
	add r0, sp, #0
	strb r1, [r0, #0x12]
	movs r2, #1
	strb r2, [r0, #0x13]
	lsls r1, r2, #0xb
	str r1, [sp, #8]
	strb r2, [r0, #0x10]
	ldr r0, [r4, #0x14]
	movs r1, #3
	add r2, sp, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #3
	bl FUN_0201CAE0
	movs r1, #4
	movs r3, #0
	add r0, sp, #0
	strb r3, [r0, #0x12]
	strb r1, [r0, #0x13]
	lsls r2, r1, #0xa
	str r2, [sp, #8]
	movs r2, #2
	strb r2, [r0, #0x10]
	ldr r0, [r4, #0x14]
	add r2, sp, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #4
	bl FUN_0201CAE0
	movs r2, #2
	add r0, sp, #0
	strb r2, [r0, #0x12]
	strb r2, [r0, #0x13]
	lsls r1, r2, #0xb
	str r1, [sp, #8]
	strb r2, [r0, #0x10]
	ldr r0, [r4, #0x14]
	movs r1, #5
	add r2, sp, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #5
	bl FUN_0201CAE0
	movs r1, #4
	add r0, sp, #0
	strb r1, [r0, #0x12]
	movs r2, #1
	strb r2, [r0, #0x13]
	lsls r1, r2, #0xb
	str r1, [sp, #8]
	strb r2, [r0, #0x10]
	ldr r0, [r4, #0x14]
	movs r1, #7
	add r2, sp, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x14]
	movs r1, #7
	bl FUN_0201CAE0
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
	add sp, #0x54
	pop {r4, r5, pc}
	.align 2, 0
_021E5D0C: .4byte 0x021E6858
_021E5D10: .4byte 0x021E67E0
_021E5D14: .4byte 0x021E681C
	thumb_func_end ov78_021E5BAC

	thumb_func_start ov78_021E5D18
ov78_021E5D18: @ 0x021E5D18
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
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	movs r1, #7
	bl FUN_0201BB4C
	ldr r0, [r4, #0x14]
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov78_021E5D18

	thumb_func_start ov78_021E5D94
ov78_021E5D94: @ 0x021E5D94
	push {r4, lr}
	sub sp, #0x10
	ldr r1, _021E5E20 @ =_021E67D8
	adds r4, r0, #0
	ldrh r2, [r1]
	add r0, sp, #8
	strh r2, [r0]
	ldrh r2, [r1, #2]
	strh r2, [r0, #2]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	bl FUN_02020080
	ldr r3, [r4]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #4
	bl FUN_0200BAF8
	str r0, [r4, #0x38]
	ldr r0, [r4]
	bl FUN_0200BD08
	str r0, [r4, #0x3c]
	movs r1, #0
	add r0, sp, #8
	strb r1, [r0]
	adds r1, r4, #0
	ldr r0, [r4, #0x14]
	adds r1, #0x18
	add r2, sp, #8
	bl FUN_0201D4F8
	movs r1, #0
	movs r0, #1
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xc0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x18
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201DA74
	movs r1, #4
	add r0, sp, #8
	strb r1, [r0]
	adds r1, r4, #0
	ldr r0, [r4, #0x14]
	adds r1, #0x28
	add r2, sp, #8
	bl FUN_0201D4F8
	movs r1, #0
	movs r0, #1
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0xc0
	adds r4, #0x28
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201DA74
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E5E20: .4byte _021E67D8
	thumb_func_end ov78_021E5D94

	thumb_func_start ov78_021E5E24
ov78_021E5E24: @ 0x021E5E24
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x28
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x18
	bl FUN_0201D520
	ldr r0, [r4, #0x3c]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x38]
	bl FUN_0200BB44
	pop {r4, pc}
	thumb_func_end ov78_021E5E24

	thumb_func_start ov78_021E5E44
ov78_021E5E44: @ 0x021E5E44
	adds r1, r0, #0
	ldr r3, _021E5E50 @ =ov78_021E5E54
	movs r2, #0
	adds r1, #0x40
	strh r2, [r1]
	bx r3
	.align 2, 0
_021E5E50: .4byte ov78_021E5E54
	thumb_func_end ov78_021E5E44

	thumb_func_start ov78_021E5E54
ov78_021E5E54: @ 0x021E5E54
	push {r4, lr}
	adds r4, r0, #0
	movs r3, #0x40
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x14]
	movs r1, #1
	movs r2, #3
	bl FUN_0201F238
	movs r3, #0x40
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x14]
	movs r1, #5
	movs r2, #3
	adds r3, #0xc0
	bl FUN_0201F238
	movs r3, #0x40
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x14]
	movs r1, #0
	movs r2, #3
	bl FUN_0201F238
	movs r3, #0x40
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x14]
	movs r1, #4
	movs r2, #3
	adds r3, #0xc0
	bl FUN_0201F238
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _021E5EA0
	adds r0, r4, #0
	bl ov78_021E652C
_021E5EA0:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov78_021E5E54

	thumb_func_start ov78_021E5EA4
ov78_021E5EA4: @ 0x021E5EA4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _021E5EC4
	movs r0, #3
	str r0, [sp, #0x18]
	movs r0, #9
	str r0, [sp, #0x14]
	movs r0, #0xc
	movs r7, #0xf
	str r0, [sp, #0x10]
	movs r6, #0
	movs r4, #6
	b _021E5EEE
_021E5EC4:
	cmp r0, #1
	bne _021E5EDC
	movs r0, #4
	str r0, [sp, #0x18]
	movs r0, #0xa
	str r0, [sp, #0x14]
	movs r0, #0xd
	movs r7, #0x10
	str r0, [sp, #0x10]
	movs r6, #1
	movs r4, #7
	b _021E5EEE
_021E5EDC:
	movs r0, #5
	str r0, [sp, #0x18]
	movs r0, #0xb
	str r0, [sp, #0x14]
	movs r0, #0xe
	movs r7, #0x11
	str r0, [sp, #0x10]
	movs r6, #2
	movs r4, #8
_021E5EEE:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	adds r1, r7, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	movs r0, #0x7e
	movs r3, #3
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	movs r0, #0x7e
	movs r3, #3
	bl FUN_020078F0
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r5]
	movs r2, #0
	str r0, [sp, #4]
	ldr r1, [sp, #0x14]
	movs r0, #0x7e
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	adds r1, r7, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	movs r0, #0x7e
	movs r3, #7
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	movs r0, #0x7e
	movs r3, #7
	bl FUN_020078F0
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, [sp, #0x14]
	str r0, [sp, #4]
	movs r0, #0x7e
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [sp, #0x10]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	movs r0, #0x7e
	movs r3, #1
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r2, #0
	ldr r0, [r5, #0x14]
	adds r3, r2, #0
	bl FUN_0201CA4C
	ldr r0, [r5, #0x14]
	movs r1, #1
	bl FUN_0201BF7C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	adds r1, r6, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	movs r0, #0x7e
	movs r3, #1
	bl FUN_020078F0
	movs r3, #0x20
	str r3, [sp]
	ldr r0, [r5]
	adds r1, r4, #0
	str r0, [sp, #4]
	movs r0, #0x7e
	movs r2, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [sp, #0x10]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	movs r0, #0x7e
	movs r3, #5
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r2, #0
	ldr r0, [r5, #0x14]
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0201CA4C
	ldr r0, [r5, #0x14]
	movs r1, #5
	bl FUN_0201BF7C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	adds r1, r6, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	movs r0, #0x7e
	movs r3, #5
	bl FUN_020078F0
	movs r3, #0x20
	str r3, [sp]
	ldr r0, [r5]
	adds r1, r4, #0
	str r0, [sp, #4]
	movs r0, #0x7e
	movs r2, #4
	bl FUN_02007938
	movs r0, #0
	ldr r3, [r5]
	movs r1, #0x20
	adds r2, r0, #0
	bl FUN_0201C1C4
	ldr r3, [r5]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r2, [r5]
	movs r0, #0
	movs r1, #0x40
	bl FUN_02003030
	ldr r2, [r5]
	movs r0, #4
	movs r1, #0x40
	bl FUN_02003030
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov78_021E5EA4

	thumb_func_start ov78_021E6068
ov78_021E6068: @ 0x021E6068
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r0, #2
	ldr r1, [r5]
	lsls r0, r0, #8
	bl FUN_02026354
	adds r6, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #2
	bne _021E608C
	movs r0, #0
	str r0, [sp, #0x18]
	movs r7, #0x24
	str r0, [sp, #0x14]
	movs r4, #0x38
	b _021E6096
_021E608C:
	movs r0, #0x30
	movs r4, #0x40
	str r0, [sp, #0x18]
	movs r7, #0x20
	str r4, [sp, #0x14]
_021E6096:
	movs r0, #2
	ldr r1, [r5]
	lsls r0, r0, #8
	bl FUN_02026354
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	cmp r0, #2
	bne _021E60D0
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _021E60B2
	bl FUN_0202551C
_021E60B2:
	ldr r0, [r5, #0x10]
	bl FUN_02070DB0
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x38]
	ldr r2, [sp, #0x10]
	movs r1, #4
	bl FUN_0200BB6C
	ldr r0, [r5, #0x3c]
	ldr r2, [sp, #0x1c]
	movs r1, #1
	bl FUN_0200BF8C
	b _021E60DA
_021E60D0:
	ldr r0, [r5, #0x38]
	ldr r2, [sp, #0x10]
	movs r1, #0
	bl FUN_0200BB6C
_021E60DA:
	ldr r0, [r5, #0x3c]
	ldr r2, [r5, #0xc]
	movs r1, #0
	bl FUN_0200BE48
	ldr r0, [r5, #0x3c]
	ldr r2, [sp, #0x10]
	adds r1, r6, #0
	bl FUN_0200CBBC
	str r7, [sp]
	movs r1, #0
	ldr r0, _021E61C0 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	ldr r3, [sp, #0x18]
	str r1, [sp, #0xc]
	adds r0, #0x18
	adds r2, r6, #0
	bl FUN_020200FC
	str r7, [sp]
	movs r1, #0
	ldr r0, _021E61C0 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	ldr r3, [sp, #0x18]
	adds r0, #0x28
	adds r2, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _021E612E
	movs r1, #1
	b _021E6138
_021E612E:
	cmp r0, #1
	bne _021E6136
	movs r1, #2
	b _021E6138
_021E6136:
	movs r1, #5
_021E6138:
	ldr r0, [r5, #0x38]
	adds r2, r6, #0
	bl FUN_0200BB6C
	str r4, [sp]
	movs r1, #0
	ldr r0, _021E61C0 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	ldr r3, [sp, #0x14]
	str r1, [sp, #0xc]
	adds r0, #0x18
	adds r2, r6, #0
	bl FUN_020200FC
	str r4, [sp]
	movs r1, #0
	ldr r0, _021E61C0 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	ldr r3, [sp, #0x14]
	str r1, [sp, #0xc]
	adds r0, #0x28
	adds r2, r6, #0
	bl FUN_020200FC
	ldr r0, [r5, #4]
	cmp r0, #2
	beq _021E61B4
	ldr r0, [r5, #0x38]
	movs r1, #3
	adds r2, r6, #0
	bl FUN_0200BB6C
	movs r0, #0x90
	str r0, [sp]
	movs r1, #0
	ldr r0, _021E61C0 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x18
	adds r2, r6, #0
	movs r3, #0x8a
	str r1, [sp, #0xc]
	bl FUN_020200FC
	movs r0, #0x90
	str r0, [sp]
	movs r1, #0
	ldr r0, _021E61C0 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r5, #0x28
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #0x8a
	str r1, [sp, #0xc]
	bl FUN_020200FC
_021E61B4:
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E61C0: .4byte 0x00010200
	thumb_func_end ov78_021E6068

	thumb_func_start ov78_021E61C4
ov78_021E61C4: @ 0x021E61C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r4, _021E6210 @ =0x021E6880
	adds r6, r2, #0
	adds r5, r3, #0
	adds r7, r0, #0
	mov ip, r1
	add r3, sp, #0
	movs r2, #6
_021E61D6:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E61D6
	ldr r0, [r4]
	add r1, sp, #0
	str r0, [r3]
	strh r6, [r1]
	strh r5, [r1, #2]
	add r0, sp, #0x38
	ldrb r2, [r0, #0x14]
	movs r3, #3
	lsls r3, r3, #0x12
	str r2, [sp, #8]
	ldrb r0, [r0, #0x10]
	add r2, sp, #0
	strh r0, [r1, #6]
	adds r0, r7, #0
	mov r1, ip
	bl FUN_0200D740
	movs r1, #0
	adds r4, r0, #0
	bl FUN_0200DC78
	adds r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021E6210: .4byte 0x021E6880
	thumb_func_end ov78_021E61C4

	thumb_func_start ov78_021E6214
ov78_021E6214: @ 0x021E6214
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r4, _021E624C @ =0x021E68B4
	adds r6, r2, #0
	adds r5, r3, #0
	adds r7, r0, #0
	mov ip, r1
	add r3, sp, #0
	movs r2, #6
_021E6226:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6226
	ldr r0, [r4]
	mov r1, ip
	str r0, [r3]
	add r0, sp, #0
	strh r6, [r0]
	movs r3, #3
	strh r5, [r0, #2]
	adds r0, r7, #0
	add r2, sp, #0
	lsls r3, r3, #0x12
	bl FUN_0200D740
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021E624C: .4byte 0x021E68B4
	thumb_func_end ov78_021E6214

	thumb_func_start ov78_021E6250
ov78_021E6250: @ 0x021E6250
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r4, _021E6288 @ =0x021E68E8
	adds r6, r2, #0
	adds r5, r3, #0
	adds r7, r0, #0
	mov ip, r1
	add r3, sp, #0
	movs r2, #6
_021E6262:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6262
	ldr r0, [r4]
	mov r1, ip
	str r0, [r3]
	add r0, sp, #0
	strh r6, [r0]
	movs r3, #3
	strh r5, [r0, #2]
	adds r0, r7, #0
	add r2, sp, #0
	lsls r3, r3, #0x12
	bl FUN_0200D740
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021E6288: .4byte 0x021E68E8
	thumb_func_end ov78_021E6250

	thumb_func_start ov78_021E628C
ov78_021E628C: @ 0x021E628C
	push {r4, r5, r6, lr}
	sub sp, #0x50
	adds r5, r0, #0
	ldr r0, [r5]
	bl FUN_0200CF18
	str r0, [r5, #0x44]
	bl FUN_0200CF38
	add r2, sp, #0x30
	ldr r3, _021E632C @ =0x021E6838
	str r0, [r5, #0x48]
	ldm r3!, {r0, r1}
	adds r4, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	ldr r6, _021E6330 @ =0x021E67F0
	stm r2!, {r0, r1}
	add r3, sp, #0x1c
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	adds r1, r4, #0
	str r0, [r3]
	movs r3, #0x20
	str r3, [sp, #0x1c]
	ldr r0, [r5, #0x44]
	bl FUN_0200CF70
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	movs r2, #0x20
	bl FUN_0200CFF4
	ldr r4, _021E6334 @ =0x021E6804
	add r3, sp, #4
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	bl FUN_0200D3F8
	ldr r0, [r5, #0x44]
	bl FUN_0200CF6C
	movs r2, #3
	movs r1, #0
	lsls r2, r2, #0x12
	bl FUN_02009FC8
	ldr r0, [r5, #0x10]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	bl FUN_0206A304
	adds r2, r0, #0
	add r0, sp, #0
	movs r1, #0x8d
	bl FUN_02007508
	add r0, sp, #0
	ldrb r0, [r0, #1]
	str r0, [r5, #0x58]
	add sp, #0x50
	pop {r4, r5, r6, pc}
	nop
_021E632C: .4byte 0x021E6838
_021E6330: .4byte 0x021E67F0
_021E6334: .4byte 0x021E6804
	thumb_func_end ov78_021E628C

	thumb_func_start ov78_021E6338
ov78_021E6338: @ 0x021E6338
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x44]
	ldr r7, [r5, #0x48]
	movs r4, #0
_021E6342:
	ldr r0, [r5, #0x4c]
	cmp r0, #0
	bne _021E634C
	bl FUN_0202551C
_021E634C:
	ldr r0, [r5, #0x4c]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _021E6342
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_0200D998
	adds r0, r6, #0
	bl FUN_0200D108
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov78_021E6338

	thumb_func_start ov78_021E636C
ov78_021E636C: @ 0x021E636C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, [r5]
	ldr r7, [r5, #0x44]
	ldr r4, [r5, #0x48]
	movs r0, #0xa2
	bl FUN_02007688
	adds r6, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #0x41
	bl FUN_0200D5D4
	movs r1, #0
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #0x42
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #0x43
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #0x44
	bl FUN_0200D71C
	adds r0, r6, #0
	bl FUN_0200770C
	ldr r1, [r5]
	movs r0, #0x7e
	bl FUN_02007688
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r3, #0x12
	bl FUN_0200D5D4
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r2, [sp, #0x10]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r3, #0x13
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r3, #0x14
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r3, #0x15
	bl FUN_0200D71C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r3, #0x12
	bl FUN_0200D5D4
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r6, [r5, #0x58]
	ldr r2, [sp, #0x10]
	lsls r3, r6, #1
	adds r3, r6, r3
	adds r0, r7, #0
	adds r1, r4, #0
	adds r3, #0x13
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r6, [r5, #0x58]
	ldr r2, [sp, #0x10]
	lsls r3, r6, #1
	adds r3, r6, r3
	adds r0, r7, #0
	adds r1, r4, #0
	adds r3, #0x14
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r1, r4, #0
	ldr r4, [r5, #0x58]
	ldr r2, [sp, #0x10]
	lsls r3, r4, #1
	adds r3, r4, r3
	adds r0, r7, #0
	adds r3, #0x15
	bl FUN_0200D71C
	ldr r0, [sp, #0x10]
	bl FUN_0200770C
	movs r0, #7
	str r0, [sp]
	movs r2, #0
	str r2, [sp, #4]
	ldr r4, _021E6528 @ =0x021E6920
	movs r3, #6
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	bl ov78_021E61C4
	str r0, [r5, #0x4c]
	movs r2, #4
	movs r3, #6
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	bl ov78_021E6250
	str r0, [r5, #0x50]
	movs r2, #8
	movs r3, #0xa
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	bl ov78_021E6214
	str r0, [r5, #0x54]
	ldr r0, [r5, #0x4c]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x50]
	ldr r1, [r5, #0xc]
	ldr r0, [r0]
	ldr r2, [r5]
	bl ov78_021E6664
	ldr r0, [r5, #0x54]
	ldr r1, [r5, #0x10]
	ldr r0, [r0]
	ldr r2, [r5]
	ldr r3, [r5, #0x58]
	bl ov78_021E66D4
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021E6528: .4byte 0x021E6920
	thumb_func_end ov78_021E636C

	thumb_func_start ov78_021E652C
ov78_021E652C: @ 0x021E652C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r5, _021E6568 @ =0x021E6920
	movs r6, #0
	adds r4, r7, #0
_021E6536:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _021E6540
	bl FUN_0202551C
_021E6540:
	movs r2, #2
	movs r3, #0x40
	ldrsh r2, [r5, r2]
	ldrsh r3, [r7, r3]
	movs r1, #0
	ldrsh r1, [r5, r1]
	subs r2, r2, r3
	lsls r2, r2, #0x10
	movs r3, #3
	ldr r0, [r4, #0x4c]
	asrs r2, r2, #0x10
	lsls r3, r3, #0x12
	bl FUN_0200DDF4
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #3
	blt _021E6536
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6568: .4byte 0x021E6920
	thumb_func_end ov78_021E652C

	thumb_func_start ov78_021E656C
ov78_021E656C: @ 0x021E656C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r4, r3, #0
	bl FUN_02024B60
	cmp r0, #3
	beq _021E6582
	bl FUN_0202551C
_021E6582:
	adds r0, r5, #0
	adds r1, r6, #0
	blx FUN_020D2894
	adds r0, r7, #0
	bl FUN_02024B1C
	movs r1, #1
	adds r7, r0, #0
	blx FUN_020B802C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r1, r1, r4
	adds r2, r6, #0
	blx FUN_020CFE74
	adds r0, r7, #0
	movs r1, #2
	blx FUN_020B802C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r1, r1, r4
	adds r2, r6, #0
	blx FUN_020CFECC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov78_021E656C

	thumb_func_start ov78_021E65BC
ov78_021E65BC: @ 0x021E65BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r1, #0
	adds r4, r3, #0
	movs r1, #0
	adds r6, r0, #0
	str r2, [sp, #0xc]
	bl FUN_0200DCE0
	movs r0, #0x51
	adds r1, r4, #0
	bl FUN_02007688
	adds r1, r5, #0
	adds r2, r4, #0
	str r0, [sp, #0x10]
	bl FUN_0200771C
	str r0, [sp, #0x14]
	blx FUN_020C3B50
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	movs r1, #2
	adds r7, r5, r0
	adds r0, r4, #0
	lsls r1, r1, #8
	bl FUN_0201AACC
	movs r1, #4
	str r1, [sp]
	movs r2, #0
	adds r4, r0, #0
	str r1, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0xc]
	adds r3, r2, #0
	lsls r0, r0, #9
	adds r0, r7, r0
	bl FUN_020145B4
	movs r2, #2
	adds r0, r6, #0
	adds r1, r4, #0
	lsls r2, r2, #8
	movs r3, #0
	bl ov78_021E656C
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_02024B60
	ldr r4, [r5, #0x38]
	movs r1, #0x20
	adds r0, r5, r4
	blx FUN_020D2894
	adds r0, r6, #0
	bl FUN_02024B34
	adds r0, r5, r4
	movs r1, #0x40
	movs r2, #0x20
	blx FUN_020CFD18
	adds r0, r5, r4
	movs r1, #0x40
	movs r2, #0x20
	blx FUN_020CFD70
	ldr r0, [sp, #0x14]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x10]
	bl FUN_0200770C
	adds r0, r6, #0
	movs r1, #1
	bl FUN_0200DCE0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov78_021E65BC

	thumb_func_start ov78_021E6664
ov78_021E6664: @ 0x021E6664
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r4, r2, #0
	bl FUN_02028F94
	cmp r0, #0
	bne _021E6678
	movs r1, #0x45
	b _021E667A
_021E6678:
	movs r1, #0x46
_021E667A:
	adds r0, r5, #0
	movs r2, #0x15
	adds r3, r4, #0
	bl ov78_021E65BC
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov78_021E6664

	thumb_func_start ov78_021E6688
ov78_021E6688: @ 0x021E6688
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r5, #0
	ble _021E669A
	ldr r1, _021E66CC @ =0x000001ED
	cmp r5, r1
	ble _021E669E
_021E669A:
	movs r4, #1
	b _021E66C6
_021E669E:
	bl FUN_0206A304
	ldr r1, _021E66D0 @ =0x00000129
	adds r4, r0, r1
	adds r0, r5, #0
	bl FUN_0206A338
	cmp r0, #0
	beq _021E66B8
	cmp r7, #1
	bne _021E66C6
	adds r4, r4, #1
	b _021E66C6
_021E66B8:
	adds r0, r5, #0
	bl FUN_0206A310
	cmp r6, r0
	ble _021E66C4
	movs r6, #0
_021E66C4:
	adds r4, r4, r6
_021E66C6:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E66CC: .4byte 0x000001ED
_021E66D0: .4byte 0x00000129
	thumb_func_end ov78_021E6688

	thumb_func_start ov78_021E66D4
ov78_021E66D4: @ 0x021E66D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r4, r1, #0
	adds r7, r0, #0
	str r2, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	adds r5, r3, #0
	bl FUN_0206E540
	str r0, [sp, #0x20]
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_0206FF88
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	bl FUN_0207003C
	str r0, [sp, #0x18]
	cmp r5, #0
	beq _021E6714
	movs r4, #2
	lsls r4, r4, #0xa
	movs r5, #8
	b _021E671A
_021E6714:
	movs r4, #2
	lsls r4, r4, #8
	movs r5, #4
_021E671A:
	ldr r1, [sp, #0xc]
	movs r0, #0x51
	bl FUN_02007688
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	lsls r1, r6, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x18
	bl FUN_02070438
	cmp r0, #0
	bne _021E6738
	movs r6, #0
_021E6738:
	lsls r1, r6, #0x10
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	lsrs r1, r1, #0x10
	bl ov78_021E6688
	adds r1, r0, #0
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0xc]
	bl FUN_0200771C
	str r0, [sp, #0x10]
	blx FUN_020C3B50
	ldr r1, [r0, #0x14]
	str r0, [sp, #0x24]
	adds r6, r0, r1
	ldr r0, [sp, #0xc]
	adds r1, r4, #0
	bl FUN_0201AACC
	str r5, [sp]
	str r5, [sp, #4]
	movs r2, #0
	str r0, [sp, #0x28]
	str r0, [sp, #8]
	lsls r0, r4, #1
	adds r0, r6, r0
	adds r1, r5, #0
	adds r3, r2, #0
	bl FUN_020145B4
	ldr r1, [sp, #0x28]
	adds r0, r7, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov78_021E656C
	ldr r0, [sp, #0x28]
	bl FUN_0201AB0C
	adds r0, r7, #0
	bl FUN_02024B60
	ldr r0, [sp, #0x24]
	ldr r1, [r0, #0x38]
	adds r4, r0, r1
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _021E679E
	adds r4, #0x20
_021E679E:
	adds r0, r4, #0
	movs r1, #0x20
	blx FUN_020D2894
	adds r0, r7, #0
	bl FUN_02024B34
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #0x20
	blx FUN_020CFD18
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #0x20
	blx FUN_020CFD70
	ldr r0, [sp, #0x10]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x14]
	bl FUN_0200770C
	adds r0, r7, #0
	movs r1, #1
	bl FUN_0200DCE0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov78_021E66D4

	.rodata

_021E67D8:
	.byte 0x00, 0x00, 0x00, 0x20, 0x18, 0x02, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_021E6920:
	.byte 0x80, 0x00, 0x10, 0x00, 0x74, 0x00, 0xB4, 0x00, 0x8C, 0x00, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x021E6940
