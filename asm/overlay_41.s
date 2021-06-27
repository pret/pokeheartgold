
	thumb_func_start ov41_02245EA0
ov41_02245EA0: @ 0x02245EA0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	adds r5, r0, #0
	adds r0, r7, #0
	movs r1, #8
	bl FUN_0201AA8C
	lsls r6, r5, #3
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_0201AA8C
	movs r1, #0
	adds r2, r6, #0
	str r0, [r4]
	blx FUN_020E5B44
	str r5, [r4, #4]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_02245EA0

	thumb_func_start ov41_02245ECC
ov41_02245ECC: @ 0x02245ECC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02245ECC

	thumb_func_start ov41_02245EE0
ov41_02245EE0: @ 0x02245EE0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	bl ov41_0224607C
	adds r4, r0, #0
	bne _02245EF2
	bl GF_AssertFail
_02245EF2:
	ldr r0, [r5, #0x18]
	str r0, [r4]
	adds r0, r5, #0
	bl ov41_022460A8
	str r0, [r4, #4]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_02245EE0

	thumb_func_start ov41_02245F04
ov41_02245F04: @ 0x02245F04
	push {r3, lr}
	add r1, sp, #0
	bl ov41_022460DC
	add r0, sp, #0
	bl FUN_020252F4
	pop {r3, pc}
	thumb_func_end ov41_02245F04

	thumb_func_start ov41_02245F14
ov41_02245F14: @ 0x02245F14
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r6, r1, #0
	str r2, [sp]
	adds r7, r3, #0
	bl ov41_02245F04
	cmp r0, #0
	bne _02245F2E
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_02245F2E:
	adds r0, r4, #0
	add r1, sp, #8
	add r2, sp, #4
	bl ov41_02245FA8
	ldr r0, _02245F98 @ =0x021D114C
	ldr r1, [sp, #8]
	ldrh r2, [r0, #0x20]
	subs r1, r2, r1
	str r1, [r6]
	ldrh r1, [r0, #0x22]
	ldr r0, [sp, #4]
	subs r1, r1, r0
	ldr r0, [sp]
	subs r4, r1, #4
	str r1, [r0]
	adds r0, r1, #4
	cmp r4, r0
	bge _02245F92
_02245F54:
	cmp r4, #0
	blt _02245F86
	ldr r0, [r6]
	subs r5, r0, #4
	adds r0, r0, #4
	cmp r5, r0
	bge _02245F86
_02245F62:
	cmp r5, #0
	blt _02245F7C
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov41_022464BC
	cmp r0, #0
	bne _02245F7C
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02245F7C:
	ldr r0, [r6]
	adds r5, r5, #1
	adds r0, r0, #4
	cmp r5, r0
	blt _02245F62
_02245F86:
	ldr r0, [sp]
	adds r4, r4, #1
	ldr r0, [r0]
	adds r0, r0, #4
	cmp r4, r0
	blt _02245F54
_02245F92:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02245F98: .4byte 0x021D114C
	thumb_func_end ov41_02245F14

	thumb_func_start ov41_02245F9C
ov41_02245F9C: @ 0x02245F9C
	ldr r3, _02245FA4 @ =FUN_02015FC4
	ldr r0, [r0, #4]
	bx r3
	nop
_02245FA4: .4byte FUN_02015FC4
	thumb_func_end ov41_02245F9C

	thumb_func_start ov41_02245FA8
ov41_02245FA8: @ 0x02245FA8
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r0, [r0, #4]
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_02015FCC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	movs r0, #4
	ldrsh r0, [r1, r0]
	str r0, [r5]
	movs r0, #6
	ldrsh r0, [r1, r0]
	str r0, [r4]
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_02245FA8

	thumb_func_start ov41_02245FD8
ov41_02245FD8: @ 0x02245FD8
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r0, [r0, #4]
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_02015FE8
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	movs r0, #4
	ldrsh r0, [r1, r0]
	str r0, [r5]
	movs r0, #6
	ldrsh r0, [r1, r0]
	str r0, [r4]
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_02245FD8

	thumb_func_start ov41_02246008
ov41_02246008: @ 0x02246008
	ldr r3, _02246010 @ =FUN_02015FB0
	ldr r0, [r0, #4]
	bx r3
	nop
_02246010: .4byte FUN_02015FB0
	thumb_func_end ov41_02246008

	thumb_func_start ov41_02246014
ov41_02246014: @ 0x02246014
	ldr r3, _0224601C @ =FUN_02015FF4
	ldr r0, [r0, #4]
	bx r3
	nop
_0224601C: .4byte FUN_02015FF4
	thumb_func_end ov41_02246014

	thumb_func_start ov41_02246020
ov41_02246020: @ 0x02246020
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r4, r2, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02245FD8
	ldr r0, [sp, #4]
	cmp r0, #0x10
	beq _02246040
	cmp r0, #0x20
	beq _02246046
	cmp r0, #0x40
	beq _0224604C
	b _02246050
_02246040:
	movs r0, #0
	str r0, [r5]
	b _02246050
_02246046:
	movs r0, #0xa
	str r0, [r5]
	b _02246050
_0224604C:
	movs r0, #0x14
	str r0, [r5]
_02246050:
	ldr r0, [sp]
	cmp r0, #0x10
	beq _02246062
	cmp r0, #0x20
	beq _0224606A
	cmp r0, #0x40
	beq _02246072
	add sp, #8
	pop {r3, r4, r5, pc}
_02246062:
	movs r0, #0
	add sp, #8
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0224606A:
	movs r0, #0xa
	add sp, #8
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02246072:
	movs r0, #0x14
	str r0, [r4]
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_02246020

	thumb_func_start ov41_0224607C
ov41_0224607C: @ 0x0224607C
	push {r3, r4}
	ldr r4, [r0, #4]
	movs r1, #0
	cmp r4, #0
	ble _022460A0
	ldr r3, [r0]
	adds r2, r3, #0
_0224608A:
	ldr r0, [r2, #4]
	cmp r0, #0
	bne _02246098
	lsls r0, r1, #3
	adds r0, r3, r0
	pop {r3, r4}
	bx lr
_02246098:
	adds r1, r1, #1
	adds r2, #8
	cmp r1, r4
	blt _0224608A
_022460A0:
	movs r0, #0
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov41_0224607C

	thumb_func_start ov41_022460A8
ov41_022460A8: @ 0x022460A8
	push {r3, lr}
	sub sp, #0x20
	ldr r1, [r0, #4]
	movs r3, #0
	str r1, [sp]
	ldr r1, [r0, #8]
	str r1, [sp, #4]
	ldr r1, [r0, #0xc]
	str r1, [sp, #8]
	ldr r2, [r0, #0x10]
	add r1, sp, #0
	strh r2, [r1, #0xc]
	ldr r2, [r0, #0x14]
	strh r2, [r1, #0xe]
	strh r3, [r1, #0x10]
	movs r2, #0x1f
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	ldr r0, [r0, #0x1c]
	strh r0, [r1, #0x1c]
	add r0, sp, #0
	bl FUN_02015F8C
	add sp, #0x20
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov41_022460A8

	thumb_func_start ov41_022460DC
ov41_022460DC: @ 0x022460DC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	bl FUN_02015FCC
	add r1, sp, #0
	strh r0, [r1, #4]
	lsrs r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #6]
	strh r0, [r1, #0xe]
	ldr r0, [r5, #4]
	bl FUN_02015FE8
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #8]
	ldrh r0, [r1, #2]
	strh r0, [r1, #0xa]
	movs r0, #0xe
	ldrsh r2, [r1, r0]
	movs r0, #0xa
	strb r2, [r4]
	ldrsh r0, [r1, r0]
	adds r0, r2, r0
	strb r0, [r4, #1]
	movs r0, #0xc
	ldrsh r2, [r1, r0]
	movs r0, #8
	strb r2, [r4, #2]
	ldrsh r0, [r1, r0]
	adds r0, r2, r0
	strb r0, [r4, #3]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_022460DC

	thumb_func_start ov41_02246130
ov41_02246130: @ 0x02246130
	push {r3, lr}
	bl ov41_022466D0
	bl ov41_022466F0
	bl ov41_02246778
	ldr r0, _0224614C @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	pop {r3, pc}
	nop
_0224614C: .4byte 0x021D116C
	thumb_func_end ov41_02246130

	thumb_func_start ov41_02246150
ov41_02246150: @ 0x02246150
	push {r3, lr}
	ldr r0, _0224616C @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	bl ov41_022467D4
	bl ov41_022467C8
	blx FUN_020CE90C
	pop {r3, pc}
	nop
_0224616C: .4byte 0x021D116C
	thumb_func_end ov41_02246150

	thumb_func_start ov41_02246170
ov41_02246170: @ 0x02246170
	push {r4, lr}
	sub sp, #0x10
	ldr r3, _022461CC @ =0x0224BFB4
	add r2, sp, #0
	adds r4, r0, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r0, #0x1a
	movs r1, #0xe
	bl FUN_02007688
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r4, r1]
	adds r0, r4, #0
	add r1, sp, #0
	bl ov41_022467E4
	movs r2, #0xa
	adds r0, r4, #0
	movs r1, #0xe
	lsls r2, r2, #0xa
	movs r3, #0x20
	bl ov41_02246CC0
	adds r0, r4, #0
	bl ov41_02246A50
	adds r0, r4, #0
	movs r1, #0xd
	bl ov41_02246C90
	adds r0, r4, #0
	bl ov41_02246A94
	movs r0, #0xe
	bl FUN_0201AC88
	str r0, [r4, #0x40]
	adds r0, r4, #0
	bl ov41_022468FC
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_022461CC: .4byte 0x0224BFB4
	thumb_func_end ov41_02246170

	thumb_func_start ov41_022461D0
ov41_022461D0: @ 0x022461D0
	push {r4, lr}
	adds r4, r0, #0
	bl ov41_02246CB0
	adds r0, r4, #0
	bl ov41_02246820
	adds r0, r4, #0
	bl ov41_02246A20
	ldr r0, [r4, #0x40]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl ov41_02246D2C
	adds r0, r4, #0
	bl ov41_02246B34
	adds r0, r4, #0
	bl ov41_02246A7C
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0200770C
	ldr r0, [r4, #4]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x10]
	pop {r4, pc}
	thumb_func_end ov41_022461D0

	thumb_func_start ov41_0224621C
ov41_0224621C: @ 0x0224621C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02026E48
	blx FUN_020B7350
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02246234
	adds r0, r4, #0
	bl ov41_02246830
_02246234:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _02246240
	ldr r0, [r4, #0x20]
	bl FUN_02008120
_02246240:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
	adds r0, r4, #0
	bl ov41_02246B5C
	pop {r4, pc}
	thumb_func_end ov41_0224621C

	thumb_func_start ov41_02246250
ov41_02246250: @ 0x02246250
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, [r4]
	ldr r2, [r4, #4]
	adds r5, r0, #0
	bl ov41_0224683C
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	adds r0, r5, #0
	bl ov41_0224689C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_02246250

	thumb_func_start ov41_0224626C
ov41_0224626C: @ 0x0224626C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_02015EF4
	ldr r0, [r4]
	bl FUN_02015F64
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224626C

	thumb_func_start ov41_02246280
ov41_02246280: @ 0x02246280
	push {r4, r5, r6, lr}
	sub sp, #0x70
	adds r5, r0, #0
	movs r0, #0
	str r1, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r4, r2, #0
	ldr r2, [r5, #0x48]
	adds r6, r3, #0
	str r2, [sp, #0x14]
	ldr r2, [r5, #0x4c]
	adds r3, r1, #0
	str r2, [sp, #0x18]
	ldr r2, [r5, #0x50]
	str r2, [sp, #0x1c]
	ldr r2, [r5, #0x54]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x4c
	adds r2, r1, #0
	bl FUN_02009D48
	ldr r0, [r5, #0x44]
	str r0, [sp, #0x2c]
	add r0, sp, #0x4c
	str r0, [sp, #0x30]
	lsls r0, r4, #0xc
	str r0, [sp, #0x34]
	lsls r0, r6, #0xc
	str r0, [sp, #0x38]
	movs r0, #0
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x80]
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x84]
	str r0, [sp, #0x44]
	movs r0, #0xe
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	bl FUN_02024714
	add sp, #0x70
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_02246280

	thumb_func_start ov41_022462E4
ov41_022462E4: @ 0x022462E4
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x1c]
	str r4, [sp]
	ldr r4, [sp, #0x18]
	str r4, [sp, #4]
	movs r4, #0xe
	str r4, [sp, #8]
	ldr r0, [r0, #0x48]
	bl FUN_0200A3C8
	bl FUN_0200ADA4
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov41_022462E4

	thumb_func_start ov41_02246304
ov41_02246304: @ 0x02246304
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x20]
	str r4, [sp]
	ldr r4, [sp, #0x18]
	str r4, [sp, #4]
	ldr r4, [sp, #0x1c]
	str r4, [sp, #8]
	movs r4, #0xe
	str r4, [sp, #0xc]
	ldr r0, [r0, #0x4c]
	bl FUN_0200A480
	bl FUN_0200B00C
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02246304

	thumb_func_start ov41_02246328
ov41_02246328: @ 0x02246328
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x18]
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	movs r4, #0xe
	str r4, [sp, #8]
	ldr r0, [r0, #0x50]
	bl FUN_0200A540
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov41_02246328

	thumb_func_start ov41_02246344
ov41_02246344: @ 0x02246344
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x18]
	str r4, [sp]
	movs r4, #3
	str r4, [sp, #4]
	movs r4, #0xe
	str r4, [sp, #8]
	ldr r0, [r0, #0x54]
	bl FUN_0200A540
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov41_02246344

	thumb_func_start ov41_02246360
ov41_02246360: @ 0x02246360
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	bl FUN_0200A7BC
	adds r1, r0, #0
	ldr r0, [r4, #0x48]
	bl FUN_0200A75C
	pop {r4, pc}
	thumb_func_end ov41_02246360

	thumb_func_start ov41_02246374
ov41_02246374: @ 0x02246374
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl FUN_0200A7BC
	adds r1, r0, #0
	ldr r0, [r4, #0x4c]
	bl FUN_0200A75C
	pop {r4, pc}
	thumb_func_end ov41_02246374

	thumb_func_start ov41_02246388
ov41_02246388: @ 0x02246388
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	bl FUN_0200A7BC
	adds r1, r0, #0
	ldr r0, [r4, #0x50]
	bl FUN_0200A75C
	pop {r4, pc}
	thumb_func_end ov41_02246388

	thumb_func_start ov41_0224639C
ov41_0224639C: @ 0x0224639C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	bl FUN_0200A7BC
	adds r1, r0, #0
	ldr r0, [r4, #0x54]
	bl FUN_0200A75C
	pop {r4, pc}
	thumb_func_end ov41_0224639C

	thumb_func_start ov41_022463B0
ov41_022463B0: @ 0x022463B0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0x76
	movs r2, #0x13
	movs r3, #0xe
	bl ov41_02246D54
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov41_02246B68
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov41_02246BEC
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_022463B0

	thumb_func_start ov41_022463D4
ov41_022463D4: @ 0x022463D4
	ldr r3, _022463D8 @ =ov41_02246DA8
	bx r3
	.align 2, 0
_022463D8: .4byte ov41_02246DA8
	thumb_func_end ov41_022463D4

	thumb_func_start ov41_022463DC
ov41_022463DC: @ 0x022463DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	adds r6, r1, #0
	adds r5, r2, #0
	bl FUN_020255C4
	ldr r1, [r4, #0x38]
	lsls r5, r5, #2
	adds r0, r6, #0
	adds r1, r1, r5
	blx FUN_020B70A8
	ldr r0, [r4, #0x38]
	ldr r0, [r0, r5]
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_022463DC

	thumb_func_start ov41_022463FC
ov41_022463FC: @ 0x022463FC
	push {r3, r4}
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02246428 @ =0xFFFF1FFF
	adds r3, r0, #0
	ands r1, r2
	str r1, [r0]
	adds r3, #8
	ldrh r4, [r3]
	movs r2, #3
	movs r1, #1
	bics r4, r2
	orrs r1, r4
	adds r0, #0xa
	strh r1, [r3]
	ldrh r1, [r0]
	bics r1, r2
	strh r1, [r0]
	pop {r3, r4}
	bx lr
	nop
_02246428: .4byte 0xFFFF1FFF
	thumb_func_end ov41_022463FC

	thumb_func_start ov41_0224642C
ov41_0224642C: @ 0x0224642C
	push {r3, r4}
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02246488 @ =0xFFFF1FFF
	adds r3, r0, #0
	ands r2, r1
	lsrs r1, r0, #0xd
	orrs r1, r2
	str r1, [r0]
	adds r3, #0x48
	ldrh r4, [r3]
	movs r2, #0x3f
	movs r1, #0x1f
	bics r4, r2
	orrs r1, r4
	strh r1, [r3]
	adds r3, r0, #0
	adds r3, #0x4a
	ldrh r4, [r3]
	movs r1, #0x12
	bics r4, r2
	orrs r1, r4
	strh r1, [r3]
	adds r1, r0, #0
	ldr r2, _0224648C @ =0x00000AF6
	adds r1, #0x40
	strh r2, [r1]
	adds r1, r0, #0
	ldr r2, _02246490 @ =0x0000128F
	adds r1, #0x44
	strh r2, [r1]
	adds r2, r0, #0
	adds r2, #8
	ldrh r3, [r2]
	movs r1, #3
	adds r0, #0xa
	bics r3, r1
	strh r3, [r2]
	ldrh r2, [r0]
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	strh r1, [r0]
	pop {r3, r4}
	bx lr
	.align 2, 0
_02246488: .4byte 0xFFFF1FFF
_0224648C: .4byte 0x00000AF6
_02246490: .4byte 0x0000128F
	thumb_func_end ov41_0224642C

	thumb_func_start ov41_02246494
ov41_02246494: @ 0x02246494
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x40]
	bl FUN_0201EEB4
	ldr r0, [r4, #0x20]
	bl FUN_02009418
	bl FUN_0200B224
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02246494

	thumb_func_start ov41_022464AC
ov41_022464AC: @ 0x022464AC
	push {r3, lr}
	adds r3, r1, #0
	movs r1, #0x76
	movs r2, #0x13
	bl ov41_02246D54
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov41_022464AC

	thumb_func_start ov41_022464BC
ov41_022464BC: @ 0x022464BC
	push {r4, r5}
	ldrh r5, [r0, #2]
	ldrh r4, [r0]
	lsls r5, r5, #3
	cmp r1, #0
	blt _022464D6
	cmp r2, #0
	blt _022464D6
	cmp r1, r5
	bge _022464D6
	lsls r4, r4, #3
	cmp r2, r4
	blt _022464DC
_022464D6:
	movs r0, #2
	pop {r4, r5}
	bx lr
_022464DC:
	adds r4, r2, #0
	muls r4, r5, r4
	adds r4, r1, r4
	lsrs r5, r4, #0x1f
	lsls r2, r4, #0x1d
	subs r2, r2, r5
	movs r1, #0x1d
	rors r2, r1
	adds r1, r5, r2
	lsls r2, r1, #2
	adds r1, r3, #0
	ldr r3, [r0, #0x14]
	asrs r0, r4, #2
	lsrs r0, r0, #0x1d
	adds r0, r4, r0
	asrs r0, r0, #3
	lsls r0, r0, #2
	ldr r3, [r3, r0]
	movs r0, #0xf
	lsls r0, r2
	lsls r1, r2
	ands r0, r3
	cmp r1, r0
	bne _02246512
	movs r0, #1
	pop {r4, r5}
	bx lr
_02246512:
	movs r0, #0
	pop {r4, r5}
	bx lr
	thumb_func_end ov41_022464BC

	thumb_func_start ov41_02246518
ov41_02246518: @ 0x02246518
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	bl ov41_022467E4
	movs r2, #0xa
	adds r0, r5, #0
	adds r1, r4, #0
	lsls r2, r2, #0xa
	movs r3, #0x20
	bl ov41_02246CC0
	ldr r0, [r5, #0x20]
	movs r1, #1
	bl FUN_020094B0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov41_02246C90
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_02246518

	thumb_func_start ov41_02246544
ov41_02246544: @ 0x02246544
	push {r4, r5, lr}
	sub sp, #0x1c
	ldr r3, _02246590 @ =0x0224C018
	adds r5, r0, #0
	str r1, [r5, #0x40]
	adds r4, r2, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #2
	str r0, [r2]
	ldr r0, [r5, #0x40]
	bl FUN_0201BB4C
	ldr r0, [r5, #0x40]
	movs r1, #2
	add r2, sp, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	ldr r0, [r5, #0x40]
	movs r1, #2
	bl FUN_0201CAE0
	add sp, #0x1c
	pop {r4, r5, pc}
	nop
_02246590: .4byte 0x0224C018
	thumb_func_end ov41_02246544

	thumb_func_start ov41_02246594
ov41_02246594: @ 0x02246594
	push {r4, lr}
	adds r4, r0, #0
	bl ov41_02246CB0
	adds r0, r4, #0
	bl ov41_02246820
	adds r0, r4, #0
	bl ov41_02246D2C
	ldr r0, [r4, #4]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x10]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02246594

	thumb_func_start ov41_022465C0
ov41_022465C0: @ 0x022465C0
	ldr r3, _022465C8 @ =FUN_0201BB4C
	ldr r0, [r0, #0x40]
	movs r1, #2
	bx r3
	.align 2, 0
_022465C8: .4byte FUN_0201BB4C
	thumb_func_end ov41_022465C0

	thumb_func_start ov41_022465CC
ov41_022465CC: @ 0x022465CC
	ldr r3, _022465D4 @ =FUN_02009418
	ldr r0, [r0, #0x20]
	bx r3
	nop
_022465D4: .4byte FUN_02009418
	thumb_func_end ov41_022465CC

	thumb_func_start ov41_022465D8
ov41_022465D8: @ 0x022465D8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0224665C @ =0x04000454
	str r3, [sp]
	movs r1, #0
	str r1, [r0]
	subs r0, #0x10
	adds r6, r2, #0
	ldr r7, [sp, #0x18]
	str r1, [r0]
	blx FUN_020B7350
	ldr r1, _02246660 @ =0x04000470
	lsls r0, r4, #0xc
	str r0, [r1]
	lsls r0, r6, #0xc
	str r0, [r1]
	movs r0, #0
	str r0, [r1]
	ldr r0, [sp]
	ldr r1, _02246664 @ =0x021094DC
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r0, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r0, [r1, r0]
	ldrsh r1, [r1, r2]
	blx FUN_020CFC30
	ldr r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r3, [r7]
	ldr r0, _02246668 @ =0x0400046C
	str r3, [r0]
	str r1, [r0]
	rsbs r1, r4, #0
	str r2, [r0]
	lsls r1, r1, #0xc
	str r1, [r0, #4]
	rsbs r1, r6, #0
	lsls r1, r1, #0xc
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #4]
	subs r0, #0x28
	str r1, [r0]
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _02246644
	adds r0, r5, #0
	bl ov41_02246830
_02246644:
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _02246650
	ldr r0, [r5, #0x20]
	bl FUN_02008120
_02246650:
	ldr r0, _0224666C @ =0x04000448
	movs r1, #1
	str r1, [r0]
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224665C: .4byte 0x04000454
_02246660: .4byte 0x04000470
_02246664: .4byte 0x021094DC
_02246668: .4byte 0x0400046C
_0224666C: .4byte 0x04000448
	thumb_func_end ov41_022465D8

	thumb_func_start ov41_02246670
ov41_02246670: @ 0x02246670
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1a
	movs r1, #0xe
	bl FUN_02007688
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov41_02246A94
	movs r0, #0xe
	bl FUN_0201AC88
	str r0, [r4, #0x40]
	adds r0, r4, #0
	bl ov41_022468FC
	pop {r4, pc}
	thumb_func_end ov41_02246670

	thumb_func_start ov41_02246698
ov41_02246698: @ 0x02246698
	push {r4, lr}
	adds r4, r0, #0
	bl ov41_02246A20
	ldr r0, [r4, #0x40]
	bl FUN_0201AB0C
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0200770C
	adds r0, r4, #0
	bl ov41_02246B34
	pop {r4, pc}
	thumb_func_end ov41_02246698

	thumb_func_start ov41_022466B8
ov41_022466B8: @ 0x022466B8
	push {r3, lr}
	ldr r0, [r0, #0x40]
	bl FUN_0201EEB4
	bl FUN_0200B224
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov41_022466B8

	thumb_func_start ov41_022466C8
ov41_022466C8: @ 0x022466C8
	ldr r3, _022466CC @ =ov41_02246B5C
	bx r3
	.align 2, 0
_022466CC: .4byte ov41_02246B5C
	thumb_func_end ov41_022466C8

	thumb_func_start ov41_022466D0
ov41_022466D0: @ 0x022466D0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _022466EC @ =0x0224C06C
	add r3, sp, #0
	movs r2, #5
_022466DA:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _022466DA
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_022466EC: .4byte 0x0224C06C
	thumb_func_end ov41_022466D0

	thumb_func_start ov41_022466F0
ov41_022466F0: @ 0x022466F0
	push {r3, lr}
	blx FUN_020C2698
	blx FUN_020CF704
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r0, _02246764 @ =0x04000008
	movs r1, #3
	ldrh r2, [r0]
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	strh r1, [r0]
	adds r0, #0x58
	ldrh r1, [r0]
	ldr r2, _02246768 @ =0xFFFFCFFD
	ands r1, r2
	strh r1, [r0]
	ldrh r3, [r0]
	adds r1, r2, #2
	ands r3, r1
	movs r1, #0x10
	orrs r1, r3
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _0224676C @ =0x0000CFFB
	ands r1, r3
	strh r1, [r0]
	adds r1, r2, #2
	ldrh r3, [r0]
	lsrs r2, r2, #0x11
	ands r3, r1
	movs r1, #8
	orrs r1, r3
	strh r1, [r0]
	movs r0, #0
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r2, _02246770 @ =0x04000540
	movs r0, #2
	ldr r1, _02246774 @ =0xBFFF0000
	str r0, [r2]
	str r1, [r2, #0x40]
	movs r1, #1
	bl FUN_02027000
	movs r0, #1
	lsls r0, r0, #0xe
	movs r1, #1
	bl FUN_02027008
	pop {r3, pc}
	.align 2, 0
_02246764: .4byte 0x04000008
_02246768: .4byte 0xFFFFCFFD
_0224676C: .4byte 0x0000CFFB
_02246770: .4byte 0x04000540
_02246774: .4byte 0xBFFF0000
	thumb_func_end ov41_022466F0

	thumb_func_start ov41_02246778
ov41_02246778: @ 0x02246778
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _022467C0 @ =_0224BF94
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _022467C4 @ =0xFFCFFFEF
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r2]
	blx FUN_020B78D4
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r0, #0x1f
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x13
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_022467C0: .4byte _0224BF94
_022467C4: .4byte 0xFFCFFFEF
	thumb_func_end ov41_02246778

	thumb_func_start ov41_022467C8
ov41_022467C8: @ 0x022467C8
	push {r3, lr}
	blx FUN_020B5AAC
	blx FUN_020B5EE0
	pop {r3, pc}
	thumb_func_end ov41_022467C8

	thumb_func_start ov41_022467D4
ov41_022467D4: @ 0x022467D4
	push {r3, lr}
	bl FUN_02022C54
	bl FUN_02022CBC
	blx FUN_020B78D4
	pop {r3, pc}
	thumb_func_end ov41_022467D4

	thumb_func_start ov41_022467E4
ov41_022467E4: @ 0x022467E4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02015DDC
	str r0, [r5]
	movs r1, #0x76
	ldr r0, [r4, #0xc]
	lsls r1, r1, #2
	bl FUN_0201AA8C
	str r0, [r5, #4]
	movs r0, #0x76
	str r0, [r5, #8]
	movs r0, #0
	str r0, [r5, #0xc]
	ldr r0, [r4, #0xc]
	movs r1, #0x4c
	bl FUN_0201AA8C
	str r0, [r5, #0x10]
	movs r0, #0x13
	str r0, [r5, #0x14]
	movs r0, #0
	str r0, [r5, #0x18]
	movs r0, #1
	str r0, [r5, #0x1c]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_022467E4

	thumb_func_start ov41_02246820
ov41_02246820: @ 0x02246820
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_02015E20
	movs r0, #0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov41_02246820

	thumb_func_start ov41_02246830
ov41_02246830: @ 0x02246830
	ldr r3, _02246838 @ =FUN_02015E64
	ldr r0, [r0]
	bx r3
	nop
_02246838: .4byte FUN_02015E64
	thumb_func_end ov41_02246830

	thumb_func_start ov41_0224683C
ov41_0224683C: @ 0x0224683C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r4, r1, #0
	str r2, [sp]
	cmp r0, #0
	ble _02246898
	adds r7, r5, #0
	adds r6, r4, #0
	adds r7, #0xc
_02246856:
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #8]
	cmp r1, r0
	blt _02246862
	bl GF_AssertFail
_02246862:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02246878
	adds r0, r6, #0
	bl FUN_02015EA0
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #4]
	lsls r2, r2, #2
	str r0, [r1, r2]
	b _02246882
_02246878:
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #4]
	lsls r2, r1, #2
	movs r1, #0
	str r1, [r0, r2]
_02246882:
	ldr r0, [r7]
	adds r4, #8
	adds r0, r0, #1
	str r0, [r7]
	ldr r0, [sp, #4]
	adds r6, #8
	adds r1, r0, #1
	ldr r0, [sp]
	str r1, [sp, #4]
	cmp r1, r0
	blt _02246856
_02246898:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224683C

	thumb_func_start ov41_0224689C
ov41_0224689C: @ 0x0224689C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r4, r1, #0
	str r2, [sp]
	cmp r0, #0
	ble _022468F8
	adds r7, r5, #0
	adds r6, r4, #0
	adds r7, #0x18
_022468B6:
	ldr r1, [r5, #0x18]
	ldr r0, [r5, #0x14]
	cmp r1, r0
	blt _022468C2
	bl GF_AssertFail
_022468C2:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022468D8
	adds r0, r6, #0
	bl FUN_02015F1C
	ldr r2, [r5, #0x18]
	ldr r1, [r5, #0x10]
	lsls r2, r2, #2
	str r0, [r1, r2]
	b _022468E2
_022468D8:
	ldr r1, [r5, #0x18]
	ldr r0, [r5, #0x10]
	lsls r2, r1, #2
	movs r1, #0
	str r1, [r0, r2]
_022468E2:
	ldr r0, [r7]
	adds r4, #0xc
	adds r0, r0, #1
	str r0, [r7]
	ldr r0, [sp, #4]
	adds r6, #0xc
	adds r1, r0, #1
	ldr r0, [sp]
	str r1, [sp, #4]
	cmp r1, r0
	blt _022468B6
_022468F8:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224689C

	thumb_func_start ov41_022468FC
ov41_022468FC: @ 0x022468FC
	push {r4, r5, lr}
	sub sp, #0x8c
	ldr r5, _02246A0C @ =0x0224BFE0
	adds r4, r0, #0
	ldm r5!, {r0, r1}
	add r3, sp, #0x70
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #1
	str r0, [r3]
	ldr r0, [r4, #0x40]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0xe
	bl FUN_0201C1C4
	ldr r0, [r4, #0x40]
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _02246A10 @ =0x0224BFFC
	add r3, sp, #0x54
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
	ldr r0, [r4, #0x40]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	movs r3, #0xe
	bl FUN_0201C1C4
	ldr r0, [r4, #0x40]
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _02246A14 @ =0x0224C034
	add r3, sp, #0x38
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
	ldr r0, [r4, #0x40]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	movs r3, #0xe
	bl FUN_0201C1C4
	ldr r0, [r4, #0x40]
	movs r1, #3
	bl FUN_0201CAE0
	ldr r5, _02246A18 @ =0x0224BFC4
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
	ldr r0, [r4, #0x40]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0xe
	bl FUN_0201C1C4
	ldr r0, [r4, #0x40]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _02246A1C @ =0x0224C050
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
	ldr r0, [r4, #0x40]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	movs r3, #0xe
	bl FUN_0201C1C4
	ldr r0, [r4, #0x40]
	movs r1, #5
	bl FUN_0201CAE0
	add sp, #0x8c
	pop {r4, r5, pc}
	nop
_02246A0C: .4byte 0x0224BFE0
_02246A10: .4byte 0x0224BFFC
_02246A14: .4byte 0x0224C034
_02246A18: .4byte 0x0224BFC4
_02246A1C: .4byte 0x0224C050
	thumb_func_end ov41_022468FC

	thumb_func_start ov41_02246A20
ov41_02246A20: @ 0x02246A20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x40]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x40]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0x40]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x40]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r4, #0x40]
	movs r1, #5
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02246A20

	thumb_func_start ov41_02246A50
ov41_02246A50: @ 0x02246A50
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x77
	movs r1, #0xe
	bl FUN_02025534
	movs r1, #0x77
	str r0, [r4, #0x34]
	movs r0, #0xe
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0x77
	movs r1, #0
	lsls r2, r2, #2
	str r0, [r4, #0x38]
	blx FUN_020E5B44
	movs r0, #0x77
	str r0, [r4, #0x3c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02246A50

	thumb_func_start ov41_02246A7C
ov41_02246A7C: @ 0x02246A7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	bl FUN_0201AB0C
	ldr r0, [r4, #0x34]
	bl FUN_02025580
	movs r0, #0
	str r0, [r4, #0x3c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02246A7C

	thumb_func_start ov41_02246A94
ov41_02246A94: @ 0x02246A94
	push {r4, r5, lr}
	sub sp, #0x24
	ldr r5, _02246B30 @ =0x0224BFA4
	add r3, sp, #0x14
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	movs r1, #0x10
	adds r0, r2, #0
	adds r2, r1, #0
	bl FUN_020215C0
	movs r0, #5
	movs r1, #0xe
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7c
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x1f
	str r3, [sp, #0xc]
	movs r2, #0xe
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	adds r1, r4, #0
	movs r0, #0x30
	adds r1, #0x58
	movs r2, #0xe
	bl FUN_02009F40
	str r0, [r4, #0x44]
	adds r0, r4, #0
	movs r2, #2
	adds r0, #0x58
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r0, #8
	movs r1, #0
	movs r2, #0xe
	bl FUN_0200A090
	str r0, [r4, #0x48]
	movs r0, #5
	movs r1, #1
	movs r2, #0xe
	bl FUN_0200A090
	str r0, [r4, #0x4c]
	movs r0, #0x30
	movs r1, #2
	movs r2, #0xe
	bl FUN_0200A090
	str r0, [r4, #0x50]
	movs r0, #0x30
	movs r1, #3
	movs r2, #0xe
	bl FUN_0200A090
	str r0, [r4, #0x54]
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_02246B30: .4byte 0x0224BFA4
	thumb_func_end ov41_02246A94

	thumb_func_start ov41_02246B34
ov41_02246B34: @ 0x02246B34
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x44]
	bl FUN_02024504
	movs r4, #0
_02246B40:
	ldr r0, [r5, #0x48]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02246B40
	bl FUN_0202168C
	bl FUN_02022608
	bl FUN_0200B244
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_02246B34

	thumb_func_start ov41_02246B5C
ov41_02246B5C: @ 0x02246B5C
	ldr r3, _02246B64 @ =FUN_0202457C
	ldr r0, [r0, #0x44]
	bx r3
	nop
_02246B64: .4byte FUN_0202457C
	thumb_func_end ov41_02246B5C

	thumb_func_start ov41_02246B68
ov41_02246B68: @ 0x02246B68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r4, #0
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r4, #0
_02246B74:
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	adds r1, r4, #1
	movs r2, #0
	movs r3, #0xe
	bl FUN_02007C98
	str r0, [sp, #4]
	cmp r0, #0
	bne _02246B92
	bl GF_AssertFail
_02246B92:
	ldr r1, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	bl ov41_022463DC
	ldr r1, [r7]
	adds r4, r4, #1
	adds r1, r1, r5
	str r0, [r1, #4]
	ldr r1, [r6]
	ldr r0, [r7]
	str r1, [r0, r5]
	adds r5, #8
	cmp r4, #0x64
	blt _02246B74
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #6
	movs r1, #0
	ldr r0, [r6, r0]
	adds r2, r1, #0
	movs r3, #0xe
	bl FUN_02007C98
	adds r4, r0, #0
	ldr r0, [r7, #0x14]
	adds r1, r4, #0
	movs r2, #0
	bl FUN_020255C4
	ldr r1, [r7, #8]
	adds r0, r4, #0
	adds r1, r1, #4
	blx FUN_020B7140
	ldr r1, [r6]
	ldr r0, [r7, #8]
	str r1, [r0]
	ldr r0, [r7, #8]
	movs r1, #3
	str r1, [r0, #8]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_02246B68

	thumb_func_start ov41_02246BEC
ov41_02246BEC: @ 0x02246BEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x87
	adds r4, r1, #0
	movs r6, #0
	str r0, [sp, #8]
_02246BFA:
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #6
	adds r1, r6, #0
	ldr r0, [r5, r0]
	adds r1, #0xce
	movs r2, #0
	movs r3, #0xe
	bl FUN_02007C98
	adds r2, r6, #0
	adds r1, r0, #0
	adds r2, #0x64
	adds r0, r5, #0
	lsls r7, r2, #3
	bl ov41_022463DC
	ldr r1, [r4]
	movs r2, #0
	adds r1, r1, r7
	str r0, [r1, #4]
	ldr r1, [r5]
	ldr r0, [r4]
	movs r3, #0xe
	str r1, [r0, r7]
	adds r0, r6, #1
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [sp, #8]
	bl FUN_02007C98
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #4]
	bl FUN_020255C4
	ldr r1, [sp, #4]
	movs r0, #0xc
	adds r7, r1, #0
	muls r7, r0, r7
	ldr r1, [r4, #8]
	ldr r0, [sp, #0xc]
	adds r1, r1, r7
	adds r1, r1, #4
	blx FUN_020B7140
	ldr r0, [r4, #8]
	adds r0, r0, r7
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _02246C70
	bl GF_AssertFail
_02246C70:
	ldr r1, [r5]
	ldr r0, [r4, #8]
	adds r6, r6, #1
	str r1, [r0, r7]
	ldr r0, [r4, #8]
	adds r1, r0, r7
	movs r0, #1
	str r0, [r1, #8]
	ldr r0, [sp, #8]
	adds r0, r0, #4
	str r0, [sp, #8]
	cmp r6, #0x12
	blt _02246BFA
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_02246BEC

	thumb_func_start ov41_02246C90
ov41_02246C90: @ 0x02246C90
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r2, #0
	movs r0, #6
	adds r3, r1, #0
	str r2, [sp]
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0xeb
	bl FUN_02007C98
	str r0, [r4, #0x30]
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov41_02246C90

	thumb_func_start ov41_02246CB0
ov41_02246CB0: @ 0x02246CB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0x30]
	pop {r4, pc}
	thumb_func_end ov41_02246CB0

	thumb_func_start ov41_02246CC0
ov41_02246CC0: @ 0x02246CC0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl FUN_02007FD4
	str r0, [r5, #0x20]
	ldr r3, _02246D1C @ =0x02110924
	movs r1, #0
	ldr r3, [r3]
	adds r0, r4, #0
	adds r2, r1, #0
	blx r3
	str r0, [r5, #0x24]
	ldr r3, _02246D20 @ =0x0211092C
	adds r0, r6, #0
	ldr r3, [r3]
	movs r1, #0
	movs r2, #1
	blx r3
	str r0, [r5, #0x28]
	ldr r3, [r5, #0x24]
	ldr r2, _02246D24 @ =0x7FFF0000
	lsls r1, r3, #0x10
	ands r2, r3
	lsrs r2, r2, #0x10
	ldr r0, [r5, #0x20]
	lsrs r1, r1, #0xd
	lsls r2, r2, #4
	bl FUN_020093FC
	ldr r3, [r5, #0x28]
	ldr r2, _02246D28 @ =0xFFFF0000
	lsls r1, r3, #0x10
	ands r2, r3
	lsrs r2, r2, #0x10
	ldr r0, [r5, #0x20]
	lsrs r1, r1, #0xd
	lsls r2, r2, #3
	bl FUN_02009408
	movs r0, #1
	str r0, [r5, #0x2c]
	pop {r4, r5, r6, pc}
	nop
_02246D1C: .4byte 0x02110924
_02246D20: .4byte 0x0211092C
_02246D24: .4byte 0x7FFF0000
_02246D28: .4byte 0xFFFF0000
	thumb_func_end ov41_02246CC0

	thumb_func_start ov41_02246D2C
ov41_02246D2C: @ 0x02246D2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	bl FUN_02008524
	ldr r1, _02246D4C @ =0x02110928
	ldr r0, [r4, #0x24]
	ldr r1, [r1]
	blx r1
	ldr r1, _02246D50 @ =0x02110930
	ldr r0, [r4, #0x28]
	ldr r1, [r1]
	blx r1
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
	.align 2, 0
_02246D4C: .4byte 0x02110928
_02246D50: .4byte 0x02110930
	thumb_func_end ov41_02246D2C

	thumb_func_start ov41_02246D54
ov41_02246D54: @ 0x02246D54
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	lsls r0, r4, #3
	str r0, [sp]
	adds r7, r3, #0
	ldr r1, [sp]
	adds r0, r7, #0
	adds r6, r2, #0
	bl FUN_0201AA8C
	ldr r2, [sp]
	movs r1, #0
	str r0, [r5]
	blx FUN_020E5B44
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_02025534
	str r0, [r5, #0x10]
	str r4, [r5, #4]
	movs r0, #0xc
	adds r4, r6, #0
	muls r4, r0, r4
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_0201AA8C
	movs r1, #0
	adds r2, r4, #0
	str r0, [r5, #8]
	blx FUN_020E5B44
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_02025534
	str r0, [r5, #0x14]
	str r6, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_02246D54

	thumb_func_start ov41_02246DA8
ov41_02246DA8: @ 0x02246DA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02246DBA
	bl FUN_02025580
	movs r0, #0
	str r0, [r4, #0x10]
_02246DBA:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _02246DC8
	bl FUN_02025580
	movs r0, #0
	str r0, [r4, #0x14]
_02246DC8:
	ldr r0, [r4]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4]
	ldr r0, [r4, #8]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02246DA8

	thumb_func_start ov41_02246DE0
ov41_02246DE0: @ 0x02246DE0
	push {r3, r4, r5, lr}
	sub sp, #8
	movs r2, #2
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0xd
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r2, #1
	movs r0, #3
	movs r1, #0xe
	lsls r2, r2, #0x12
	bl FUN_0201A910
	movs r1, #0x6f
	adds r0, r5, #0
	lsls r1, r1, #4
	movs r2, #0xd
	bl FUN_02007280
	movs r2, #0x6f
	movs r1, #0
	lsls r2, r2, #4
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r0, _02246EF0 @ =ov41_02247478
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	adds r0, r5, #0
	bl FUN_020072A4
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	ldr r1, _02246EF4 @ =0x000006DC
	str r0, [r4, r1]
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _02246E3E
	bl FUN_020183F0
	ldr r1, _02246EF8 @ =0x000006EC
	b _02246E42
_02246E3E:
	movs r0, #0
	adds r1, #0x10
_02246E42:
	str r0, [r4, r1]
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	movs r1, #0x61
	lsls r1, r1, #2
	ldr r0, [r5, #8]
	adds r1, r4, r1
	bl ov41_02248E84
	adds r0, r4, #0
	bl ov41_02247240
	movs r1, #0xd7
	lsls r1, r1, #2
	adds r0, r4, r1
	subs r1, #0x8d
	movs r2, #0xd
	bl ov41_022499B4
	movs r0, #0xaf
	lsls r0, r0, #2
	movs r1, #0xd
	bl ov41_02245EA0
	movs r1, #0xd9
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r5]
	adds r0, r4, #0
	movs r2, #0xa
	movs r3, #0
	bl ov41_02247288
	adds r0, r4, #0
	bl ov41_02247334
	adds r0, r4, #0
	movs r1, #0
	bl ov41_02247480
	adds r0, r4, #0
	bl ov41_022474D4
	ldr r1, [r5, #0xc]
	adds r0, r4, #0
	bl ov41_0224765C
	ldr r0, _02246EFC @ =0x00000568
	movs r2, #0xfd
	adds r1, r4, r0
	str r1, [sp]
	movs r1, #1
	subs r0, #0xd0
	lsls r2, r2, #2
	str r1, [sp, #4]
	adds r1, r4, r2
	subs r2, #0x8c
	adds r0, r4, r0
	adds r2, r4, r2
	adds r3, r4, #0
	bl ov41_02248F18
	movs r0, #0xd
	bl FUN_0201660C
	ldr r1, _02246F00 @ =0x000006B8
	str r0, [r4, r1]
	movs r0, #0xd
	movs r1, #1
	bl FUN_0201D39C
	ldr r2, _02246F04 @ =0x000006BC
	movs r1, #0
	str r0, [r4, r2]
	subs r2, #0xc
	str r1, [r4, r2]
	movs r0, #0x35
	adds r2, r1, #0
	bl FUN_02004EC4
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02246EF0: .4byte ov41_02247478
_02246EF4: .4byte 0x000006DC
_02246EF8: .4byte 0x000006EC
_02246EFC: .4byte 0x00000568
_02246F00: .4byte 0x000006B8
_02246F04: .4byte 0x000006BC
	thumb_func_end ov41_02246DE0

	thumb_func_start ov41_02246F08
ov41_02246F08: @ 0x02246F08
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r7, #0
	movs r6, #0
	bl FUN_020072A4
	ldr r1, [r5]
	cmp r1, #0xc
	bhi _02246FD6
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02246F30: @ jump table
	.2byte _02246F4A - _02246F30 - 2 @ case 0
	.2byte _02246F4A - _02246F30 - 2 @ case 1
	.2byte _02246F66 - _02246F30 - 2 @ case 2
	.2byte _02246F76 - _02246F30 - 2 @ case 3
	.2byte _02246FA4 - _02246F30 - 2 @ case 4
	.2byte _02246FC6 - _02246F30 - 2 @ case 5
	.2byte _02246FF4 - _02246F30 - 2 @ case 6
	.2byte _0224702A - _02246F30 - 2 @ case 7
	.2byte _02247050 - _02246F30 - 2 @ case 8
	.2byte _02247094 - _02246F30 - 2 @ case 9
	.2byte _022470D0 - _02246F30 - 2 @ case 10
	.2byte _022470EE - _02246F30 - 2 @ case 11
	.2byte _0224710C - _02246F30 - 2 @ case 12
_02246F4A:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #0xd
	str r1, [sp, #8]
	movs r1, #5
	adds r2, r1, #0
	adds r3, r6, #0
	bl FUN_0200FA24
	movs r0, #2
	str r0, [r5]
	b _0224712A
_02246F66:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02246FD6
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224712A
_02246F76:
	ldr r0, [r0, #0x1c]
	cmp r0, #1
	bne _02246F9E
	movs r0, #1
	bl FUN_02002B8C
	ldr r0, _02247138 @ =0x00000568
	movs r1, #0x1b
	adds r0, r4, r0
	movs r2, #0xd7
	movs r3, #0x2f
	bl ov41_0224AC40
	movs r1, #0x6e
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224712A
_02246F9E:
	movs r0, #6
	str r0, [r5]
	b _0224712A
_02246FA4:
	movs r0, #0x6e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02246FD6
	ldr r0, _02247138 @ =0x00000568
	adds r0, r4, r0
	bl ov41_0224AC80
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224712A
_02246FC6:
	ldr r0, _0224713C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	ands r1, r0
	ldr r0, _02247140 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	orrs r0, r1
	bne _02246FD8
_02246FD6:
	b _0224712A
_02246FD8:
	ldr r0, _02247138 @ =0x00000568
	movs r1, #0x1b
	adds r0, r4, r0
	movs r2, #0xd7
	movs r3, #0x30
	bl ov41_0224AC08
	adds r0, r6, #0
	bl FUN_02002B8C
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224712A
_02246FF4:
	movs r1, #0x6b
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	cmp r0, #3
	bne _0224700C
	adds r1, r1, #4
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov41_022476B8
	movs r0, #7
	str r0, [r5]
_0224700C:
	ldr r0, _02247144 @ =0x00000498
	adds r0, r4, r0
	bl ov41_02248E44
	adds r0, r4, #0
	bl ov41_02247D44
	ldr r0, _02247138 @ =0x00000568
	adds r0, r4, r0
	bl ov41_0224ABF0
	adds r0, r4, #0
	bl ov41_02247578
	b _0224712A
_0224702A:
	ldr r0, _02247148 @ =0x000006B4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0224712A
	adds r1, r6, #0
	str r1, [r4, r0]
	movs r1, #8
	str r1, [r5]
	movs r1, #4
	subs r0, r0, #4
	str r1, [r4, r0]
	ldr r1, _0224714C @ =0x0000047C
	movs r2, #0xe
	adds r0, r4, r1
	subs r1, #0x88
	adds r1, r4, r1
	bl ov41_0224B4E8
	b _0224712A
_02247050:
	movs r1, #0x6b
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	cmp r0, #9
	bne _0224706A
	adds r1, r1, #4
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov41_02247828
	movs r0, #0xa
	str r0, [r5]
	b _0224712A
_0224706A:
	cmp r0, #8
	bne _0224707E
	movs r0, #9
	str r0, [r5]
	movs r0, #5
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov41_02247D64
	b _0224712A
_0224707E:
	adds r0, r4, #0
	bl ov41_02247B7C
	movs r1, #0x6b
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, _0224714C @ =0x0000047C
	adds r0, r4, r0
	bl ov41_0224B50C
	b _0224712A
_02247094:
	movs r0, #0x6b
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #6
	bne _022470AA
	movs r1, #1
	adds r0, #0x10
	str r1, [r4, r0]
	movs r0, #0xb
	str r0, [r5]
	b _0224712A
_022470AA:
	cmp r1, #7
	bne _022470BA
	adds r1, r6, #0
	adds r0, #0x10
	str r1, [r4, r0]
	movs r0, #0xb
	str r0, [r5]
	b _0224712A
_022470BA:
	adds r0, r4, #0
	bl ov41_02247DF8
	movs r1, #0x6b
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, _0224714C @ =0x0000047C
	adds r0, r4, r0
	bl ov41_0224B50C
	b _0224712A
_022470D0:
	ldr r0, _02247148 @ =0x000006B4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0224712A
	adds r2, r6, #0
	str r2, [r4, r0]
	movs r1, #6
	str r1, [r5]
	subs r0, r0, #4
	str r2, [r4, r0]
	ldr r0, _0224714C @ =0x0000047C
	adds r0, r4, r0
	bl ov41_0224B518
	b _0224712A
_022470EE:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #0xd
	str r1, [sp, #8]
	adds r1, r6, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0224712A
_0224710C:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0224712A
	adds r0, r6, #0
	str r0, [r5]
	movs r0, #0x6b
	movs r1, #0xa
	lsls r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _0224714C @ =0x0000047C
	movs r6, #1
	adds r0, r4, r0
	bl ov41_0224B518
_0224712A:
	adds r0, r4, #0
	bl ov41_0224726C
	adds r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02247138: .4byte 0x00000568
_0224713C: .4byte 0x021D110C
_02247140: .4byte 0x021D114C
_02247144: .4byte 0x00000498
_02247148: .4byte 0x000006B4
_0224714C: .4byte 0x0000047C
	thumb_func_end ov41_02246F08

	thumb_func_start ov41_02247150
ov41_02247150: @ 0x02247150
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_020072A4
	adds r5, r0, #0
	movs r0, #0x1b
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02247182
	ldr r0, [r5, #0x10]
	movs r1, #8
	bl FUN_0202D1C0
	movs r1, #0xfd
	lsls r1, r1, #2
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x14]
	adds r1, r4, r1
	bl ov41_022479A8
_02247182:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	beq _0224719C
	movs r1, #0x1b
	lsls r1, r1, #6
	ldr r1, [r4, r1]
	cmp r1, #1
	bne _02247198
	movs r1, #1
	str r1, [r0]
	b _0224719C
_02247198:
	movs r1, #0
	str r1, [r0]
_0224719C:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _022471AA
	ldr r1, _02247230 @ =0x000006EC
	ldr r1, [r4, r1]
	bl FUN_02018410
_022471AA:
	ldr r0, _02247234 @ =0x000006B8
	ldr r0, [r4, r0]
	bl FUN_02016624
	ldr r0, _02247238 @ =0x000006BC
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_0201D54C
	adds r0, r4, #0
	bl ov41_022476A8
	ldr r0, _0224723C @ =0x00000498
	adds r0, r4, r0
	bl ov41_02248F6C
	adds r0, r4, #0
	bl ov41_02247568
	adds r0, r4, #0
	bl ov41_022474C4
	adds r0, r4, #0
	bl ov41_02247310
	adds r0, r4, #0
	bl ov41_022473F0
	movs r0, #0xd9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov41_02245ECC
	movs r0, #0xd9
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, #8
	adds r0, r4, r0
	bl ov41_022499DC
	adds r0, r4, #0
	bl ov41_02247274
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02021238
	cmp r0, #1
	beq _0224721A
	bl GF_AssertFail
_0224721A:
	adds r0, r6, #0
	bl FUN_02007294
	movs r0, #0xd
	bl FUN_0201A9C4
	movs r0, #0xe
	bl FUN_0201A9C4
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_02247230: .4byte 0x000006EC
_02247234: .4byte 0x000006B8
_02247238: .4byte 0x000006BC
_0224723C: .4byte 0x00000498
	thumb_func_end ov41_02247150

	thumb_func_start ov41_02247240
ov41_02247240: @ 0x02247240
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	bl ov41_02246130
	adds r0, r4, #0
	bl ov41_02246170
	adds r0, r4, #0
	add r1, sp, #0
	bl ov41_022463B0
	adds r0, r4, #0
	add r1, sp, #0
	bl ov41_02246250
	add r0, sp, #0
	bl ov41_022463D4
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02247240

	thumb_func_start ov41_0224726C
ov41_0224726C: @ 0x0224726C
	ldr r3, _02247270 @ =ov41_0224621C
	bx r3
	.align 2, 0
_02247270: .4byte ov41_0224621C
	thumb_func_end ov41_0224726C

	thumb_func_start ov41_02247274
ov41_02247274: @ 0x02247274
	push {r4, lr}
	adds r4, r0, #0
	bl ov41_0224626C
	adds r0, r4, #0
	bl ov41_022461D0
	bl ov41_02246150
	pop {r4, pc}
	thumb_func_end ov41_02247274

	thumb_func_start ov41_02247288
ov41_02247288: @ 0x02247288
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	movs r1, #0xd9
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x10]
	lsls r1, r1, #2
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x30]
	adds r6, r3, #0
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x20]
	str r0, [sp, #0x20]
	ldr r0, [r5, #0x40]
	str r2, [sp, #0x30]
	str r0, [sp, #0x24]
	ldr r0, [r5, r1]
	str r0, [sp, #0x28]
	adds r0, r1, #0
	subs r0, #8
	adds r0, r5, r0
	adds r1, #0x90
	str r0, [sp, #0x2c]
	adds r0, r5, r1
	add r1, sp, #0x10
	bl ov41_02247F3C
	cmp r6, #0
	add r2, sp, #0
	bne _022472DC
	movs r0, #0xfd
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r4, #0
	movs r3, #0xe
	bl ov41_02247FE0
	b _022472EA
_022472DC:
	movs r0, #0xfd
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r4, #0
	movs r3, #0xe
	bl ov41_02247FFC
_022472EA:
	adds r0, r5, #0
	add r1, sp, #0
	bl ov41_022495C8
	movs r0, #0xfd
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov41_02248158
	movs r0, #0xfd
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	movs r2, #0xe
	bl ov41_0224825C
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_02247288

	thumb_func_start ov41_02247310
ov41_02247310: @ 0x02247310
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xfd
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov41_022482A8
	movs r0, #0xfd
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov41_022480E0
	movs r0, #0xfd
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov41_02247F90
	pop {r4, pc}
	thumb_func_end ov41_02247310

	thumb_func_start ov41_02247334
ov41_02247334: @ 0x02247334
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	ldr r0, [r5]
	str r0, [sp]
	ldr r0, [r5, #4]
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	str r0, [sp, #8]
	ldr r0, [r5, #0x30]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x40]
	str r0, [sp, #0x10]
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp, #0x28]
	movs r0, #0xd9
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	str r1, [sp, #0x14]
	adds r1, r0, #0
	subs r1, #8
	adds r1, r5, r1
	str r1, [sp, #0x18]
	movs r1, #0xe
	str r1, [sp, #0x1c]
	movs r1, #2
	str r1, [sp, #0x20]
	movs r1, #1
	adds r0, r0, #4
	str r1, [sp, #0x24]
	adds r0, r5, r0
	add r1, sp, #0
	bl ov41_02248488
	movs r0, #0xda
	lsls r0, r0, #2
	movs r1, #0
	adds r0, r5, r0
	adds r2, r1, #0
	bl ov41_022487F8
	movs r6, #0
_0224738C:
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r6, #0
	bl ov41_02248ED4
	adds r7, r0, #0
	movs r4, #0
	cmp r7, #0
	ble _022473B4
_022473A0:
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	adds r2, r6, #0
	bl ov41_022485DC
	adds r4, r4, #1
	cmp r4, r7
	blt _022473A0
_022473B4:
	adds r6, r6, #1
	cmp r6, #0x64
	blt _0224738C
	movs r7, #0xda
	movs r6, #0x61
	movs r4, #0
	lsls r7, r7, #2
	lsls r6, r6, #2
_022473C4:
	adds r0, r5, r6
	adds r1, r4, #0
	bl ov41_02248EE8
	adds r2, r0, #0
	cmp r2, #0x12
	bge _022473DA
	adds r0, r5, r7
	movs r1, #1
	bl ov41_022485DC
_022473DA:
	adds r4, r4, #1
	cmp r4, #0x12
	blt _022473C4
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov41_02248724
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_02247334

	thumb_func_start ov41_022473F0
ov41_022473F0: @ 0x022473F0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov41_02248940
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov41_022486F8
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov41_022484C0
	pop {r4, pc}
	thumb_func_end ov41_022473F0

	thumb_func_start ov41_02247414
ov41_02247414: @ 0x02247414
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _02247474 @ =0x04000008
	movs r2, #3
	ldrh r3, [r0]
	movs r1, #1
	bics r3, r2
	orrs r1, r3
	strh r1, [r0]
	ldrh r1, [r0, #2]
	bics r1, r2
	strh r1, [r0, #2]
	ldrh r3, [r0, #4]
	movs r1, #2
	bics r3, r2
	orrs r1, r3
	strh r1, [r0, #4]
	ldrh r3, [r0, #6]
	movs r1, #3
	bics r3, r2
	adds r2, r3, #0
	orrs r2, r1
	strh r2, [r0, #6]
	adds r3, r1, #0
	ldr r0, [r4, #0x40]
	adds r2, r1, #0
	subs r3, #0x13
	bl FUN_0201BC8C
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl ov41_0224888C
	movs r1, #0
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r2, #2
	adds r3, r1, #0
	str r1, [sp]
	bl ov41_022488D8
	add sp, #4
	pop {r3, r4, pc}
	nop
_02247474: .4byte 0x04000008
	thumb_func_end ov41_02247414

	thumb_func_start ov41_02247478
ov41_02247478: @ 0x02247478
	ldr r3, _0224747C @ =ov41_02246494
	bx r3
	.align 2, 0
_0224747C: .4byte ov41_02246494
	thumb_func_end ov41_02247478

	thumb_func_start ov41_02247480
ov41_02247480: @ 0x02247480
	push {r3, lr}
	sub sp, #0x30
	ldr r2, [r0, #0x40]
	str r2, [sp]
	movs r2, #0x1a
	str r2, [sp, #4]
	lsls r2, r1, #1
	adds r1, r2, #0
	adds r1, #0x79
	str r1, [sp, #8]
	movs r1, #0x85
	str r1, [sp, #0xc]
	movs r1, #1
	adds r2, #0x7a
	str r2, [sp, #0x10]
	movs r2, #0
	str r1, [sp, #0x1c]
	str r1, [sp, #0x20]
	movs r1, #2
	str r1, [sp, #0x24]
	movs r1, #0xe
	str r1, [sp, #0x2c]
	ldr r1, _022474C0 @ =0x000004B4
	str r2, [sp, #0x14]
	adds r0, r0, r1
	add r1, sp, #0
	str r2, [sp, #0x18]
	str r2, [sp, #0x28]
	bl ov41_02249C7C
	add sp, #0x30
	pop {r3, pc}
	.align 2, 0
_022474C0: .4byte 0x000004B4
	thumb_func_end ov41_02247480

	thumb_func_start ov41_022474C4
ov41_022474C4: @ 0x022474C4
	ldr r1, _022474CC @ =0x000004B4
	ldr r3, _022474D0 @ =ov41_02249CC4
	adds r0, r0, r1
	bx r3
	.align 2, 0
_022474CC: .4byte 0x000004B4
_022474D0: .4byte ov41_02249CC4
	thumb_func_end ov41_022474C4

	thumb_func_start ov41_022474D4
ov41_022474D4: @ 0x022474D4
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x4e
	ldr r2, _02247550 @ =0x000006EC
	lsls r0, r0, #4
	adds r0, r4, r0
	adds r1, r4, #0
	adds r2, r4, r2
	bl ov41_0224A27C
	movs r0, #0x4e
	lsls r0, r0, #4
	movs r1, #0
	ldr r2, _02247554 @ =ov41_022475B4
	adds r0, r4, r0
	adds r3, r4, #0
	str r1, [sp]
	bl ov41_0224A5D4
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4e
	lsls r0, r0, #4
	ldr r2, _02247558 @ =ov41_022475D4
	adds r0, r4, r0
	movs r1, #1
	adds r3, r4, #0
	bl ov41_0224A5D4
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4e
	lsls r0, r0, #4
	ldr r2, _0224755C @ =ov41_022475F4
	adds r0, r4, r0
	movs r1, #2
	adds r3, r4, #0
	bl ov41_0224A5D4
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4e
	lsls r0, r0, #4
	ldr r2, _02247560 @ =ov41_02247628
	adds r0, r4, r0
	movs r1, #3
	adds r3, r4, #0
	bl ov41_0224A5D4
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4e
	lsls r0, r0, #4
	ldr r2, _02247564 @ =ov41_02247598
	adds r0, r4, r0
	movs r1, #4
	adds r3, r4, #0
	bl ov41_0224A5D4
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02247550: .4byte 0x000006EC
_02247554: .4byte ov41_022475B4
_02247558: .4byte ov41_022475D4
_0224755C: .4byte ov41_022475F4
_02247560: .4byte ov41_02247628
_02247564: .4byte ov41_02247598
	thumb_func_end ov41_022474D4

	thumb_func_start ov41_02247568
ov41_02247568: @ 0x02247568
	adds r1, r0, #0
	movs r0, #0x4e
	lsls r0, r0, #4
	ldr r3, _02247574 @ =ov41_0224A3E4
	adds r0, r1, r0
	bx r3
	.align 2, 0
_02247574: .4byte ov41_0224A3E4
	thumb_func_end ov41_02247568

	thumb_func_start ov41_02247578
ov41_02247578: @ 0x02247578
	movs r1, #0x4e
	lsls r1, r1, #4
	ldr r3, _02247584 @ =ov41_0224A54C
	adds r0, r0, r1
	bx r3
	nop
_02247584: .4byte ov41_0224A54C
	thumb_func_end ov41_02247578

	thumb_func_start ov41_02247588
ov41_02247588: @ 0x02247588
	movs r1, #0x4e
	lsls r1, r1, #4
	ldr r3, _02247594 @ =ov41_0224A580
	adds r0, r0, r1
	bx r3
	nop
_02247594: .4byte ov41_0224A580
	thumb_func_end ov41_02247588

	thumb_func_start ov41_02247598
ov41_02247598: @ 0x02247598
	push {r4, lr}
	movs r0, #0xda
	adds r4, r1, #0
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov41_02248998
	cmp r0, #0
	beq _022475B2
	movs r0, #0x6b
	movs r1, #3
	lsls r0, r0, #4
	str r1, [r4, r0]
_022475B2:
	pop {r4, pc}
	thumb_func_end ov41_02247598

	thumb_func_start ov41_022475B4
ov41_022475B4: @ 0x022475B4
	push {r4, lr}
	movs r0, #0xda
	adds r4, r1, #0
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov41_0224894C
	adds r1, r0, #0
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r2, #0
	bl ov41_02248790
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_022475B4

	thumb_func_start ov41_022475D4
ov41_022475D4: @ 0x022475D4
	push {r4, lr}
	movs r0, #0xda
	adds r4, r1, #0
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov41_0224894C
	adds r1, r0, #0
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r2, #1
	bl ov41_02248790
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_022475D4

	thumb_func_start ov41_022475F4
ov41_022475F4: @ 0x022475F4
	push {r4, lr}
	movs r0, #0x6b
	adds r4, r1, #0
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02247624
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl ov41_0224895C
	adds r2, r0, #0
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl ov41_022487F8
	movs r0, #0x6b
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
_02247624:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_022475F4

	thumb_func_start ov41_02247628
ov41_02247628: @ 0x02247628
	push {r4, lr}
	movs r0, #0x6b
	adds r4, r1, #0
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #1
	beq _02247658
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #1
	bl ov41_0224895C
	adds r2, r0, #0
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #1
	bl ov41_022487F8
	movs r0, #0x6b
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r4, r0]
_02247658:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02247628

	thumb_func_start ov41_0224765C
ov41_0224765C: @ 0x0224765C
	push {r3, r4, r5, lr}
	sub sp, #0x28
	adds r4, r0, #0
	add r2, sp, #0
	movs r0, #0
	adds r3, r1, #0
	adds r5, r2, #0
	adds r1, r0, #0
	stm r5!, {r0, r1}
	stm r5!, {r0, r1}
	stm r5!, {r0, r1}
	stm r5!, {r0, r1}
	stm r5!, {r0, r1}
	ldr r0, [r4, #0x40]
	adds r1, r2, #0
	str r0, [sp]
	ldr r0, [r4, #0x44]
	movs r2, #0xf
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x48
	str r0, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0x10]
	movs r0, #6
	str r3, [sp, #0xc]
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	str r0, [sp, #0x24]
	ldr r0, _022476A4 @ =0x00000568
	adds r0, r4, r0
	bl ov41_0224AA08
	add sp, #0x28
	pop {r3, r4, r5, pc}
	nop
_022476A4: .4byte 0x00000568
	thumb_func_end ov41_0224765C

	thumb_func_start ov41_022476A8
ov41_022476A8: @ 0x022476A8
	ldr r1, _022476B0 @ =0x00000568
	ldr r3, _022476B4 @ =ov41_0224AB40
	adds r0, r0, r1
	bx r3
	.align 2, 0
_022476B0: .4byte 0x00000568
_022476B4: .4byte ov41_0224AB40
	thumb_func_end ov41_022476A8

	thumb_func_start ov41_022476B8
ov41_022476B8: @ 0x022476B8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _022476DC @ =ov41_022476E0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0xd
	bl FUN_02007200
	bl FUN_0201F988
	str r5, [r0]
	str r4, [r0, #4]
	movs r1, #0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	pop {r3, r4, r5, pc}
	nop
_022476DC: .4byte ov41_022476E0
	thumb_func_end ov41_022476B8

	thumb_func_start ov41_022476E0
ov41_022476E0: @ 0x022476E0
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r1, #0
	ldr r1, [r4, #0xc]
	cmp r1, #9
	bls _022476EE
	b _02247822
_022476EE:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022476FA: @ jump table
	.2byte _0224770E - _022476FA - 2 @ case 0
	.2byte _02247730 - _022476FA - 2 @ case 1
	.2byte _0224774A - _022476FA - 2 @ case 2
	.2byte _02247766 - _022476FA - 2 @ case 3
	.2byte _0224777A - _022476FA - 2 @ case 4
	.2byte _022477A2 - _022476FA - 2 @ case 5
	.2byte _022477C2 - _022476FA - 2 @ case 6
	.2byte _022477E8 - _022476FA - 2 @ case 7
	.2byte _02247804 - _022476FA - 2 @ case 8
	.2byte _02247818 - _022476FA - 2 @ case 9
_0224770E:
	movs r0, #0xda
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r1, r0
	movs r1, #3
	movs r2, #0
	bl ov41_02248750
	cmp r0, #0
	bne _02247726
	bl GF_AssertFail
_02247726:
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247730:
	movs r0, #0xda
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r1, r0
	bl ov41_02248998
	cmp r0, #0
	beq _02247822
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_0224774A:
	movs r0, #1
	str r0, [sp]
	movs r0, #8
	adds r1, r0, #0
	subs r1, #0x18
	movs r2, #0
	movs r3, #0xa
	bl FUN_0200B484
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247766:
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #0
	beq _02247822
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_0224777A:
	movs r0, #0x4e
	ldr r1, [r4]
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	movs r2, #8
	bl ov41_0224A5A4
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #8
	blt _02247822
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_022477A2:
	movs r1, #7
	adds r0, r4, #0
	mvns r1, r1
	movs r2, #5
	movs r3, #8
	bl ov41_02247A48
	cmp r0, #0
	beq _02247822
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_022477C2:
	ldr r0, [r4]
	movs r1, #1
	bl ov41_02247480
	ldr r0, [r4]
	movs r1, #1
	ldr r0, [r0, #0x40]
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	ldr r0, [r4]
	bl ov41_02247AB4
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_022477E8:
	movs r1, #0
	movs r0, #1
	adds r2, r1, #0
	str r0, [sp]
	movs r0, #8
	subs r2, #0x10
	movs r3, #0xa
	bl FUN_0200B484
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247804:
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #0
	beq _02247822
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247818:
	ldr r1, [r4, #4]
	movs r2, #1
	str r2, [r1]
	bl FUN_02007234
_02247822:
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov41_022476E0

	thumb_func_start ov41_02247828
ov41_02247828: @ 0x02247828
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0224784C @ =ov41_02247850
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0xd
	bl FUN_02007200
	bl FUN_0201F988
	str r5, [r0]
	str r4, [r0, #4]
	movs r1, #0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	pop {r3, r4, r5, pc}
	nop
_0224784C: .4byte ov41_02247850
	thumb_func_end ov41_02247828

	thumb_func_start ov41_02247850
ov41_02247850: @ 0x02247850
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r1, #0
	ldr r1, [r4, #0xc]
	cmp r1, #9
	bls _0224785E
	b _022479A2
_0224785E:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224786A: @ jump table
	.2byte _0224787E - _0224786A - 2 @ case 0
	.2byte _0224789A - _0224786A - 2 @ case 1
	.2byte _022478AE - _0224786A - 2 @ case 2
	.2byte _022478E2 - _0224786A - 2 @ case 3
	.2byte _02247902 - _0224786A - 2 @ case 4
	.2byte _0224792C - _0224786A - 2 @ case 5
	.2byte _02247948 - _0224786A - 2 @ case 6
	.2byte _0224795C - _0224786A - 2 @ case 7
	.2byte _0224797E - _0224786A - 2 @ case 8
	.2byte _02247998 - _0224786A - 2 @ case 9
_0224787E:
	movs r0, #1
	str r0, [sp]
	movs r0, #8
	adds r1, r0, #0
	subs r1, #0x18
	movs r2, #0
	movs r3, #0xa
	bl FUN_0200B484
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_0224789A:
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #0
	beq _022479A2
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_022478AE:
	ldr r0, [r4]
	bl ov41_02247B5C
	ldr r0, [r4]
	bl ov41_02247414
	ldr r0, [r4]
	bl ov41_02247588
	ldr r0, [r4]
	movs r1, #0
	bl ov41_02247480
	ldr r0, [r4]
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r0, #0x40]
	movs r1, #1
	subs r3, #0x2b
	bl FUN_0201F238
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_022478E2:
	movs r1, #8
	adds r2, r1, #0
	adds r0, r4, #0
	subs r2, #0xd
	adds r3, r1, #0
	bl ov41_02247A48
	cmp r0, #0
	beq _022479A2
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247902:
	movs r0, #0x4e
	ldr r1, [r4]
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	adds r2, r1, #0
	subs r2, #8
	bl ov41_0224A5A4
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #8
	blt _022479A2
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_0224792C:
	movs r1, #0
	movs r0, #1
	adds r2, r1, #0
	str r0, [sp]
	movs r0, #8
	subs r2, #0x10
	movs r3, #0xa
	bl FUN_0200B484
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247948:
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #0
	beq _022479A2
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_0224795C:
	movs r0, #0xda
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r1, r0
	movs r1, #0
	adds r2, r1, #0
	bl ov41_02248750
	cmp r0, #0
	bne _02247974
	bl GF_AssertFail
_02247974:
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_0224797E:
	movs r0, #0xda
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r1, r0
	bl ov41_02248998
	cmp r0, #0
	beq _022479A2
	ldr r0, [r4, #0xc]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247998:
	ldr r1, [r4, #4]
	movs r2, #1
	str r2, [r1]
	bl FUN_02007234
_022479A2:
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov41_02247850

	thumb_func_start ov41_022479A8
ov41_022479A8: @ 0x022479A8
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	adds r6, r0, #0
	adds r4, r2, #0
	bl FUN_0202BC60
	ldr r1, [sp]
	ldr r2, [sp]
	adds r1, #0x84
	ldr r1, [r1]
	adds r0, r6, #0
	adds r2, #0x78
	bl FUN_0202BC88
	cmp r4, #0
	beq _022479E8
	adds r0, r4, #0
	movs r1, #0xd
	bl FUN_02028F68
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02028F94
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0202BDC8
	adds r0, r5, #0
	bl FUN_02026380
_022479E8:
	ldr r0, [sp]
	movs r5, #0
	adds r7, r0, #0
	ldr r4, [r0, #0x1c]
	adds r7, #0x14
	cmp r4, r7
	beq _02247A0E
_022479F6:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02247A08
	ldr r1, [r4]
	adds r0, r6, #0
	adds r2, r5, #0
	bl FUN_0202BCAC
	adds r5, r5, #1
_02247A08:
	ldr r4, [r4, #8]
	cmp r4, r7
	bne _022479F6
_02247A0E:
	ldr r0, [sp]
	ldr r4, [r0, #0xc]
	adds r7, r0, #4
	cmp r4, r7
	beq _02247A30
_02247A18:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02247A2A
	ldr r1, [r4]
	adds r0, r6, #0
	adds r2, r5, #0
	bl FUN_0202BCAC
	adds r5, r5, #1
_02247A2A:
	ldr r4, [r4, #8]
	cmp r4, r7
	bne _02247A18
_02247A30:
	ldr r1, [sp]
	adds r0, r6, #0
	ldr r1, [r1, #0x74]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0202BD60
	adds r0, r6, #0
	bl FUN_0202BC38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_022479A8

	thumb_func_start ov41_02247A48
ov41_02247A48: @ 0x02247A48
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r0, #8
	bge _02247A64
	movs r0, #0xfd
	ldr r3, [r5]
	lsls r0, r0, #2
	adds r0, r3, r0
	bl ov41_022480F8
_02247A64:
	ldr r0, [r5, #8]
	cmp r0, #1
	blt _02247AA2
	ldr r0, [r5]
	movs r1, #2
	ldr r0, [r0, #0x40]
	adds r2, r1, #0
	adds r3, r4, #0
	bl FUN_0201F238
	ldr r0, [r5]
	movs r1, #1
	ldr r0, [r0, #0x40]
	movs r2, #2
	adds r3, r4, #0
	bl FUN_0201F238
	ldr r0, [r5]
	movs r1, #2
	ldr r0, [r0, #0x40]
	movs r2, #5
	adds r3, r6, #0
	bl FUN_0201F238
	ldr r0, [r5]
	movs r1, #1
	ldr r0, [r0, #0x40]
	movs r2, #5
	adds r3, r6, #0
	bl FUN_0201F238
_02247AA2:
	ldr r0, [r5, #8]
	adds r0, r0, #1
	str r0, [r5, #8]
	cmp r0, r7
	ble _02247AB0
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02247AB0:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02247A48

	thumb_func_start ov41_02247AB4
ov41_02247AB4: @ 0x02247AB4
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #0x40]
	movs r1, #3
	bl FUN_0201CAE0
	movs r2, #0
	ldr r0, [r4, #0x40]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201BC8C
	movs r1, #3
	ldr r0, [r4, #0x40]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, [r4, #0x40]
	add r3, sp, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #0x19
	strb r0, [r3, #0x10]
	movs r0, #4
	strb r0, [r3, #0x11]
	ldrb r0, [r3, #0x12]
	movs r1, #0xf
	ldr r2, _02247B54 @ =0x000006EC
	bics r0, r1
	ldr r1, [r4, r2]
	subs r2, #0x34
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r1, #0xf
	ands r1, r5
	orrs r0, r1
	strb r0, [r3, #0x12]
	ldr r0, [r4, r2]
	add r1, sp, #0
	bl FUN_020166FC
	adds r0, r4, #0
	movs r1, #1
	bl ov41_02247D1C
	ldr r0, _02247B58 @ =0x04000008
	movs r2, #3
	ldrh r3, [r0]
	movs r1, #2
	bics r3, r2
	orrs r1, r3
	strh r1, [r0]
	ldrh r3, [r0, #2]
	movs r1, #1
	bics r3, r2
	orrs r1, r3
	strh r1, [r0, #2]
	ldrh r3, [r0, #4]
	movs r1, #3
	bics r3, r2
	orrs r1, r3
	strh r1, [r0, #4]
	ldrh r1, [r0, #6]
	bics r1, r2
	strh r1, [r0, #6]
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_02247B54: .4byte 0x000006EC
_02247B58: .4byte 0x04000008
	thumb_func_end ov41_02247AB4

	thumb_func_start ov41_02247B5C
ov41_02247B5C: @ 0x02247B5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02247B78 @ =0x000006B8
	ldr r0, [r4, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	bl ov41_02247D3C
	ldr r0, [r4, #0x40]
	movs r1, #3
	bl FUN_0201CAE0
	pop {r4, pc}
	.align 2, 0
_02247B78: .4byte 0x000006B8
	thumb_func_end ov41_02247B5C

	thumb_func_start ov41_02247B7C
ov41_02247B7C: @ 0x02247B7C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02247BB0 @ =0x000006B8
	ldr r0, [r5, r0]
	bl FUN_020168F4
	adds r4, r0, #0
	beq _02247B96
	cmp r4, #1
	beq _02247B9A
	cmp r4, #2
	beq _02247B9E
	b _02247BA0
_02247B96:
	movs r0, #4
	pop {r3, r4, r5, pc}
_02247B9A:
	movs r4, #8
	b _02247BA0
_02247B9E:
	movs r4, #9
_02247BA0:
	ldr r0, _02247BB0 @ =0x000006B8
	ldr r0, [r5, r0]
	bl FUN_020169C0
	ldr r1, _02247BB4 @ =0x000006EC
	str r0, [r5, r1]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02247BB0: .4byte 0x000006B8
_02247BB4: .4byte 0x000006EC
	thumb_func_end ov41_02247B7C

	thumb_func_start ov41_02247BB8
ov41_02247BB8: @ 0x02247BB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, _02247C70 @ =0x000006DC
	str r1, [sp, #0x14]
	ldr r0, [r5, r0]
	adds r7, r2, #0
	adds r4, r3, #0
	bl FUN_0202ADCC
	adds r6, r0, #0
	movs r0, #0
	movs r1, #0xe0
	movs r2, #0xe
	bl FUN_0200304C
	str r4, [sp]
	add r0, sp, #0x20
	ldrb r1, [r0, #0x10]
	movs r2, #3
	adds r3, r7, #0
	str r1, [sp, #4]
	ldrb r0, [r0, #0x14]
	ldr r1, _02247C74 @ =0x000006BC
	str r0, [sp, #8]
	movs r0, #7
	str r0, [sp, #0xc]
	movs r0, #0x5a
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x40]
	ldr r1, [r5, r1]
	bl FUN_0201D40C
	ldr r0, _02247C74 @ =0x000006BC
	movs r1, #0xf
	ldr r0, [r5, r0]
	bl FUN_0201D978
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	ldr r0, [r5, #0x40]
	movs r1, #3
	movs r2, #0x3c
	movs r3, #8
	bl FUN_0200E644
	ldr r0, _02247C74 @ =0x000006BC
	movs r1, #0
	ldr r0, [r5, r0]
	movs r2, #0x3c
	movs r3, #8
	bl FUN_0200E998
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xd7
	movs r3, #0xd
	bl FUN_0200BAF8
	ldr r1, [sp, #0x14]
	adds r6, r0, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r3, #0
	str r3, [sp]
	ldr r0, _02247C78 @ =0x0001020F
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02247C74 @ =0x000006BC
	str r3, [sp, #0xc]
	ldr r0, [r5, r0]
	movs r1, #1
	adds r2, r4, #0
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_0200BB44
	ldr r0, _02247C74 @ =0x000006BC
	ldr r0, [r5, r0]
	bl FUN_0201D578
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02247C70: .4byte 0x000006DC
_02247C74: .4byte 0x000006BC
_02247C78: .4byte 0x0001020F
	thumb_func_end ov41_02247BB8

	thumb_func_start ov41_02247C7C
ov41_02247C7C: @ 0x02247C7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _02247CF4 @ =0x000006BC
	adds r4, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xd7
	movs r3, #0xd
	bl FUN_0200BAF8
	adds r1, r4, #0
	adds r7, r0, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r0, #1
	lsls r0, r0, #8
	movs r1, #0xd
	bl FUN_02026354
	adds r4, r0, #0
	ldr r0, _02247CF8 @ =0x000006E8
	adds r1, r4, #0
	ldr r0, [r5, r0]
	adds r2, r6, #0
	bl FUN_0200CBBC
	movs r3, #0
	str r3, [sp]
	ldr r0, _02247CFC @ =0x0001020F
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02247CF4 @ =0x000006BC
	str r3, [sp, #0xc]
	ldr r0, [r5, r0]
	movs r1, #1
	adds r2, r4, #0
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_0200BB44
	ldr r0, _02247CF4 @ =0x000006BC
	ldr r0, [r5, r0]
	bl FUN_0201D578
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02247CF4: .4byte 0x000006BC
_02247CF8: .4byte 0x000006E8
_02247CFC: .4byte 0x0001020F
	thumb_func_end ov41_02247C7C

	thumb_func_start ov41_02247D00
ov41_02247D00: @ 0x02247D00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02247D18 @ =0x000006BC
	ldr r0, [r4, r0]
	bl FUN_0201D8C8
	ldr r0, _02247D18 @ =0x000006BC
	ldr r0, [r4, r0]
	bl FUN_0201D520
	pop {r4, pc}
	nop
_02247D18: .4byte 0x000006BC
	thumb_func_end ov41_02247D00

	thumb_func_start ov41_02247D1C
ov41_02247D1C: @ 0x02247D1C
	push {r3, lr}
	sub sp, #8
	movs r2, #0x1b
	str r2, [sp]
	movs r2, #2
	movs r3, #1
	str r2, [sp, #4]
	bl ov41_02247BB8
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov41_02247D1C

	thumb_func_start ov41_02247D34
ov41_02247D34: @ 0x02247D34
	ldr r3, _02247D38 @ =ov41_02247C7C
	bx r3
	.align 2, 0
_02247D38: .4byte ov41_02247C7C
	thumb_func_end ov41_02247D34

	thumb_func_start ov41_02247D3C
ov41_02247D3C: @ 0x02247D3C
	ldr r3, _02247D40 @ =ov41_02247D00
	bx r3
	.align 2, 0
_02247D40: .4byte ov41_02247D00
	thumb_func_end ov41_02247D3C

	thumb_func_start ov41_02247D44
ov41_02247D44: @ 0x02247D44
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xfd
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov41_022482B4
	adds r1, r0, #0
	ldr r0, _02247D60 @ =0x00000568
	adds r0, r4, r0
	bl ov41_0224AC98
	pop {r4, pc}
	nop
_02247D60: .4byte 0x00000568
	thumb_func_end ov41_02247D44

	thumb_func_start ov41_02247D64
ov41_02247D64: @ 0x02247D64
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, [r4, #0x40]
	add r3, sp, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #0x19
	strb r0, [r3, #0x10]
	movs r0, #4
	strb r0, [r3, #0x11]
	ldrb r0, [r3, #0x12]
	movs r1, #0xf
	ldr r2, _02247DEC @ =0x000006EC
	bics r0, r1
	ldr r1, [r4, r2]
	subs r2, #0x34
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r1, #0xf
	ands r1, r5
	orrs r0, r1
	strb r0, [r3, #0x12]
	ldr r0, [r4, r2]
	bl FUN_020169CC
	ldr r0, _02247DF0 @ =0x000006B8
	add r1, sp, #0
	ldr r0, [r4, r0]
	bl FUN_020166FC
	adds r0, r4, #0
	movs r1, #2
	bl ov41_02247D34
	ldr r0, _02247DF4 @ =0x04000008
	movs r2, #3
	ldrh r3, [r0]
	movs r1, #2
	bics r3, r2
	orrs r1, r3
	strh r1, [r0]
	ldrh r3, [r0, #2]
	movs r1, #1
	bics r3, r2
	orrs r1, r3
	strh r1, [r0, #2]
	ldrh r3, [r0, #4]
	movs r1, #3
	bics r3, r2
	orrs r1, r3
	strh r1, [r0, #4]
	ldrh r1, [r0, #6]
	bics r1, r2
	strh r1, [r0, #6]
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_02247DEC: .4byte 0x000006EC
_02247DF0: .4byte 0x000006B8
_02247DF4: .4byte 0x04000008
	thumb_func_end ov41_02247D64

	thumb_func_start ov41_02247DF8
ov41_02247DF8: @ 0x02247DF8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02247E2C @ =0x000006B8
	ldr r0, [r5, r0]
	bl FUN_020168F4
	adds r4, r0, #0
	beq _02247E12
	cmp r4, #1
	beq _02247E16
	cmp r4, #2
	beq _02247E1A
	b _02247E1C
_02247E12:
	movs r0, #5
	pop {r3, r4, r5, pc}
_02247E16:
	movs r4, #6
	b _02247E1C
_02247E1A:
	movs r4, #7
_02247E1C:
	ldr r0, _02247E2C @ =0x000006B8
	ldr r0, [r5, r0]
	bl FUN_020169C0
	ldr r1, _02247E30 @ =0x000006EC
	str r0, [r5, r1]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02247E2C: .4byte 0x000006B8
_02247E30: .4byte 0x000006EC
	thumb_func_end ov41_02247DF8

	thumb_func_start ov41_02247E34
ov41_02247E34: @ 0x02247E34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	str r1, [sp]
	adds r7, r2, #0
	adds r0, r3, #0
	subs r0, r0, r7
	movs r1, #3
	str r3, [sp, #4]
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	blx FUN_020F2BA4
	adds r1, r7, r0
	lsls r0, r0, #1
	adds r0, r7, r0
	str r0, [sp, #8]
	ldr r0, [sp]
	str r1, [sp, #0xc]
	subs r0, r0, r6
	movs r1, #3
	blx FUN_020F2BA4
	adds r2, r6, r0
	lsls r0, r0, #1
	ldr r1, [sp, #0x28]
	adds r0, r6, r0
	cmp r1, #0xf
	bhi _02247F36
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02247E7A: @ jump table
	.2byte _02247E9A - _02247E7A - 2 @ case 0
	.2byte _02247EA2 - _02247E7A - 2 @ case 1
	.2byte _02247EAA - _02247E7A - 2 @ case 2
	.2byte _02247EB2 - _02247E7A - 2 @ case 3
	.2byte _02247EBC - _02247E7A - 2 @ case 4
	.2byte _02247EC6 - _02247E7A - 2 @ case 5
	.2byte _02247ED0 - _02247E7A - 2 @ case 6
	.2byte _02247EDA - _02247E7A - 2 @ case 7
	.2byte _02247EE6 - _02247E7A - 2 @ case 8
	.2byte _02247EF0 - _02247E7A - 2 @ case 9
	.2byte _02247EFA - _02247E7A - 2 @ case 10
	.2byte _02247F04 - _02247E7A - 2 @ case 11
	.2byte _02247F10 - _02247E7A - 2 @ case 12
	.2byte _02247F1A - _02247E7A - 2 @ case 13
	.2byte _02247F24 - _02247E7A - 2 @ case 14
	.2byte _02247F2E - _02247E7A - 2 @ case 15
_02247E9A:
	str r7, [r4]
	add sp, #0x10
	str r6, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EA2:
	str r7, [r4]
	add sp, #0x10
	str r2, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EAA:
	str r7, [r4]
	add sp, #0x10
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EB2:
	ldr r0, [sp]
	str r7, [r4]
	add sp, #0x10
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EBC:
	ldr r0, [sp, #0xc]
	add sp, #0x10
	str r0, [r4]
	str r6, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EC6:
	ldr r0, [sp, #0xc]
	add sp, #0x10
	str r0, [r4]
	str r2, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247ED0:
	ldr r1, [sp, #0xc]
	add sp, #0x10
	str r1, [r4]
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EDA:
	ldr r0, [sp, #0xc]
	str r0, [r4]
	ldr r0, [sp]
	add sp, #0x10
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EE6:
	ldr r0, [sp, #8]
	add sp, #0x10
	str r0, [r4]
	str r6, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EF0:
	ldr r0, [sp, #8]
	add sp, #0x10
	str r0, [r4]
	str r2, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EFA:
	ldr r1, [sp, #8]
	add sp, #0x10
	str r1, [r4]
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247F04:
	ldr r0, [sp, #8]
	str r0, [r4]
	ldr r0, [sp]
	add sp, #0x10
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247F10:
	ldr r0, [sp, #4]
	add sp, #0x10
	str r0, [r4]
	str r6, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247F1A:
	ldr r0, [sp, #4]
	add sp, #0x10
	str r0, [r4]
	str r2, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247F24:
	ldr r1, [sp, #4]
	add sp, #0x10
	str r1, [r4]
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247F2E:
	ldr r0, [sp, #4]
	str r0, [r4]
	ldr r0, [sp]
	str r0, [r5]
_02247F36:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_02247E34

	thumb_func_start ov41_02247F3C
ov41_02247F3C: @ 0x02247F3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r1]
	movs r2, #0
	str r0, [r4, #0x2c]
	ldr r0, [r1, #4]
	str r0, [r4, #0x30]
	ldr r0, [r1, #8]
	str r0, [r4, #0x34]
	ldr r0, [r1, #0xc]
	str r0, [r4, #0x38]
	ldr r0, [r1, #0x10]
	str r0, [r4, #0x3c]
	ldr r0, [r1, #0x14]
	str r0, [r4, #0x40]
	ldr r0, [r1, #0x18]
	str r0, [r4, #0x44]
	str r2, [r4, #0x74]
	ldr r0, [r1, #0x1c]
	str r0, [r4]
	adds r0, r4, #4
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x14
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r2, [r4, #0x24]
	ldr r0, [r1, #0x20]
	adds r1, r4, #0
	str r0, [r4, #0x28]
	ldr r0, [r4]
	adds r1, #0x78
	movs r2, #3
	bl ov41_022499F0
	adds r4, #0x14
	adds r1, r4, #0
	bl ov41_02249A50
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02247F3C

	thumb_func_start ov41_02247F90
ov41_02247F90: @ 0x02247F90
	push {r4, lr}
	adds r4, r0, #0
	bl ov41_02248038
	adds r0, r4, #0
	bl ov41_022480E0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x88
	blx FUN_020E5B44
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02247F90

	thumb_func_start ov41_02247FAC
ov41_02247FAC: @ 0x02247FAC
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [sp, #0x20]
	adds r6, r1, #0
	str r0, [sp]
	adds r5, r2, #0
	adds r0, r4, #0
	adds r7, r3, #0
	ldr r1, [r4, #0x3c]
	adds r0, #0x78
	adds r2, r6, #0
	adds r3, r5, #0
	bl ov41_022495F0
	adds r0, r4, #0
	ldr r1, [sp, #0x1c]
	adds r0, #0x78
	bl ov41_02249700
	adds r4, #0x78
	ldr r2, [sp, #0x18]
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov41_0224971C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02247FAC

	thumb_func_start ov41_02247FE0
ov41_02247FE0: @ 0x02247FE0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	str r3, [sp]
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r1, [r6, #0x3c]
	adds r0, #0x78
	adds r2, r5, #0
	adds r3, r4, #0
	bl ov41_022495F0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov41_02247FE0

	thumb_func_start ov41_02247FFC
ov41_02247FFC: @ 0x02247FFC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r6, #0
	ldr r1, [r6, #0x3c]
	adds r0, #0x78
	adds r2, r5, #0
	adds r3, r4, #0
	bl ov41_02249604
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_02247FFC

	thumb_func_start ov41_02248020
ov41_02248020: @ 0x02248020
	ldr r3, _0224802C @ =ov41_02249A50
	adds r2, r0, #0
	adds r0, r1, #0
	ldr r1, [r2, #0x20]
	bx r3
	nop
_0224802C: .4byte ov41_02249A50
	thumb_func_end ov41_02248020

	thumb_func_start ov41_02248030
ov41_02248030: @ 0x02248030
	ldr r3, _02248034 @ =ov41_02249A60
	bx r3
	.align 2, 0
_02248034: .4byte ov41_02249A60
	thumb_func_end ov41_02248030

	thumb_func_start ov41_02248038
ov41_02248038: @ 0x02248038
	ldr r3, _02248040 @ =ov41_022496E8
	adds r0, #0x78
	bx r3
	nop
_02248040: .4byte ov41_022496E8
	thumb_func_end ov41_02248038

	thumb_func_start ov41_02248044
ov41_02248044: @ 0x02248044
	push {r3, r4, r5, lr}
	sub sp, #0x20
	adds r4, r0, #0
	ldr r5, [r4, #0x24]
	ldr r0, [r4, #0x28]
	cmp r5, r0
	bge _0224809E
	ldr r0, [r4, #0x44]
	str r0, [sp]
	ldr r0, [r4, #0x2c]
	str r0, [sp, #4]
	ldr r5, [r4, #0x30]
	lsls r0, r1, #2
	ldr r0, [r5, r0]
	str r0, [sp, #8]
	ldr r0, [r4, #0x34]
	ldr r0, [r0]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	str r1, [sp, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x38]
	ldrb r0, [r0, r1]
	str r0, [sp, #0x1c]
	add r0, sp, #0
	bl ov41_02245EE0
	ldr r1, [sp, #0x30]
	adds r5, r0, #0
	bl ov41_02246014
	ldr r0, [r4]
	adds r1, r5, #0
	movs r2, #0
	bl ov41_022499F0
	adds r1, r4, #4
	bl ov41_02249A50
	ldr r0, [r4, #0x24]
	add sp, #0x20
	adds r0, r0, #1
	str r0, [r4, #0x24]
	movs r0, #1
	pop {r3, r4, r5, pc}
_0224809E:
	movs r0, #0
	add sp, #0x20
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_02248044

	thumb_func_start ov41_022480A4
ov41_022480A4: @ 0x022480A4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	ldr r5, [r4, #0x24]
	ldr r2, [r4, #0x28]
	cmp r5, r2
	bge _022480C2
	movs r2, #1
	bl ov41_02248324
	ldr r0, [r4, #0x24]
	adds r0, r0, #1
	str r0, [r4, #0x24]
	movs r0, #1
	pop {r3, r4, r5, pc}
_022480C2:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_022480A4

	thumb_func_start ov41_022480C8
ov41_022480C8: @ 0x022480C8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl ov41_02249A60
	ldr r0, [r4, #0x24]
	subs r0, r0, #1
	str r0, [r4, #0x24]
	bpl _022480DE
	bl GF_AssertFail
_022480DE:
	pop {r4, pc}
	thumb_func_end ov41_022480C8

	thumb_func_start ov41_022480E0
ov41_022480E0: @ 0x022480E0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r4, #4
	bl ov41_02249A70
	adds r0, r4, #0
	adds r0, #0x14
	bl ov41_02249A70
	movs r0, #0
	str r0, [r4, #0x24]
	pop {r4, pc}
	thumb_func_end ov41_022480E0

	thumb_func_start ov41_022480F8
ov41_022480F8: @ 0x022480F8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, r5, #4
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov41_02249BE8
	adds r5, #0x14
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov41_02249BE8
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_022480F8

	thumb_func_start ov41_02248114
ov41_02248114: @ 0x02248114
	ldr r3, _0224811C @ =ov41_02249BE8
	adds r0, #0x14
	bx r3
	nop
_0224811C: .4byte ov41_02249BE8
	thumb_func_end ov41_02248114

	thumb_func_start ov41_02248120
ov41_02248120: @ 0x02248120
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	rsbs r4, r2, #0
	rsbs r7, r1, #0
	adds r0, r5, #4
	adds r1, r7, #0
	adds r2, r4, #0
	adds r6, r3, #0
	bl ov41_02249BE8
	ldr r2, [sp, #0x18]
	adds r0, r5, #4
	adds r1, r6, #0
	bl ov41_02249BE8
	adds r0, r5, #0
	adds r0, #0x14
	adds r1, r7, #0
	adds r2, r4, #0
	bl ov41_02249BE8
	adds r5, #0x14
	ldr r2, [sp, #0x18]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov41_02249BE8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02248120

	thumb_func_start ov41_02248158
ov41_02248158: @ 0x02248158
	ldr r3, _02248160 @ =ov41_02248164
	movs r1, #0
	mvns r1, r1
	bx r3
	.align 2, 0
_02248160: .4byte ov41_02248164
	thumb_func_end ov41_02248158

	thumb_func_start ov41_02248164
ov41_02248164: @ 0x02248164
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r7, #0
	ldr r4, [r7, #0x1c]
	adds r6, #0x14
	adds r5, r1, #0
	cmp r4, r6
	beq _02248192
_02248174:
	ldr r0, [r4, #4]
	cmp r0, #0
	ldr r0, [r4]
	bne _02248184
	adds r1, r5, #0
	bl ov41_02246014
	b _0224818A
_02248184:
	adds r1, r5, #0
	bl ov41_02249700
_0224818A:
	ldr r4, [r4, #8]
	subs r5, r5, #1
	cmp r4, r6
	bne _02248174
_02248192:
	ldr r4, [r7, #0xc]
	adds r6, r7, #4
	subs r5, #8
	cmp r4, r6
	beq _022481BA
_0224819C:
	ldr r0, [r4, #4]
	cmp r0, #0
	ldr r0, [r4]
	bne _022481AC
	adds r1, r5, #0
	bl ov41_02246014
	b _022481B2
_022481AC:
	adds r1, r5, #0
	bl ov41_02249700
_022481B2:
	ldr r4, [r4, #8]
	subs r5, r5, #1
	cmp r4, r6
	bne _0224819C
_022481BA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02248164

	thumb_func_start ov41_022481BC
ov41_022481BC: @ 0x022481BC
	push {r3, lr}
	movs r1, #0x12
	add r0, sp, #0
	strb r1, [r0]
	movs r1, #0x8f
	strb r1, [r0, #1]
	movs r1, #0x8a
	strb r1, [r0, #2]
	movs r1, #0xf6
	strb r1, [r0, #3]
	add r0, sp, #0
	bl FUN_020252F4
	pop {r3, pc}
	thumb_func_end ov41_022481BC

	thumb_func_start ov41_022481D8
ov41_022481D8: @ 0x022481D8
	push {r3, lr}
	movs r3, #0x12
	add r0, sp, #0
	strb r3, [r0]
	movs r3, #0x8f
	strb r3, [r0, #1]
	movs r3, #0x8a
	strb r3, [r0, #2]
	movs r3, #0xf6
	strb r3, [r0, #3]
	add r0, sp, #0
	bl FUN_020253F0
	pop {r3, pc}
	thumb_func_end ov41_022481D8

	thumb_func_start ov41_022481F4
ov41_022481F4: @ 0x022481F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, [r0, #0x1c]
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, #0x14
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	str r0, [sp, #4]
	cmp r5, r0
	beq _0224822A
_0224820C:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov41_02249AA8
	cmp r0, #1
	bne _02248222
	add sp, #0xc
	adds r0, r5, #0
	pop {r4, r5, r6, r7, pc}
_02248222:
	ldr r5, [r5, #8]
	ldr r0, [sp, #4]
	cmp r5, r0
	bne _0224820C
_0224822A:
	ldr r0, [sp]
	ldr r5, [r0, #0xc]
	adds r0, r0, #4
	str r0, [sp, #8]
	cmp r5, r0
	beq _02248254
_02248236:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov41_02249AA8
	cmp r0, #1
	bne _0224824C
	add sp, #0xc
	adds r0, r5, #0
	pop {r4, r5, r6, r7, pc}
_0224824C:
	ldr r5, [r5, #8]
	ldr r0, [sp, #8]
	cmp r5, r0
	bne _02248236
_02248254:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_022481F4

	thumb_func_start ov41_0224825C
ov41_0224825C: @ 0x0224825C
	push {r3, r4, r5, lr}
	sub sp, #0x30
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	adds r4, r1, #0
	str r0, [sp]
	movs r0, #0x1a
	lsls r1, r4, #2
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r0, #0x86
	str r0, [sp, #8]
	adds r0, r1, #0
	adds r0, #0x87
	str r0, [sp, #0xc]
	movs r0, #0x88
	str r0, [sp, #0x14]
	movs r0, #0x10
	str r0, [sp, #0x18]
	movs r0, #2
	str r0, [sp, #0x1c]
	movs r0, #1
	str r0, [sp, #0x20]
	movs r0, #0xd
	str r0, [sp, #0x24]
	movs r0, #0
	adds r1, #0x88
	str r0, [sp, #0x28]
	adds r0, r5, #0
	str r1, [sp, #0x10]
	adds r0, #0x48
	add r1, sp, #0
	str r2, [sp, #0x2c]
	bl ov41_02249C7C
	str r4, [r5, #0x74]
	add sp, #0x30
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224825C

	thumb_func_start ov41_022482A8
ov41_022482A8: @ 0x022482A8
	ldr r3, _022482B0 @ =ov41_02249CC4
	adds r0, #0x48
	bx r3
	nop
_022482B0: .4byte ov41_02249CC4
	thumb_func_end ov41_022482A8

	thumb_func_start ov41_022482B4
ov41_022482B4: @ 0x022482B4
	ldr r0, [r0, #0x24]
	bx lr
	thumb_func_end ov41_022482B4

	thumb_func_start ov41_022482B8
ov41_022482B8: @ 0x022482B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r6, [r7, #0x1c]
	movs r4, #0
	adds r7, #0x14
	str r1, [sp]
	str r2, [sp, #4]
	adds r5, r4, #0
	cmp r6, r7
	beq _02248316
_022482CE:
	adds r0, r6, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov41_02248400
	cmp r4, #0
	bge _022482E0
	rsbs r1, r4, #0
	b _022482E2
_022482E0:
	adds r1, r4, #0
_022482E2:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bge _022482EC
	rsbs r2, r0, #0
	b _022482EE
_022482EC:
	adds r2, r0, #0
_022482EE:
	cmp r2, r1
	ble _022482F4
	adds r4, r0, #0
_022482F4:
	cmp r5, #0
	bge _022482FC
	rsbs r1, r5, #0
	b _022482FE
_022482FC:
	adds r1, r5, #0
_022482FE:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _02248308
	rsbs r2, r0, #0
	b _0224830A
_02248308:
	adds r2, r0, #0
_0224830A:
	cmp r2, r1
	ble _02248310
	adds r5, r0, #0
_02248310:
	ldr r6, [r6, #8]
	cmp r6, r7
	bne _022482CE
_02248316:
	ldr r0, [sp]
	str r4, [r0]
	ldr r0, [sp, #4]
	str r5, [r0]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_022482B8

	thumb_func_start ov41_02248324
ov41_02248324: @ 0x02248324
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	str r0, [sp, #0xc]
	str r2, [sp, #0x14]
	str r1, [sp, #0x10]
	adds r0, r1, #0
	add r1, sp, #0x54
	add r2, sp, #0x50
	adds r4, r3, #0
	bl ov41_02249B44
	ldr r0, [sp, #0x10]
	add r1, sp, #0x4c
	add r2, sp, #0x48
	bl ov41_02249B94
	add r0, sp, #0x30
	str r0, [sp]
	ldr r0, [sp, #0x10]
	add r1, sp, #0x44
	add r2, sp, #0x34
	add r3, sp, #0x40
	bl ov41_02249BAC
	movs r0, #0x76
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r5, #0
	str r0, [sp, #0x20]
	ldr r6, [sp, #0x54]
	ldr r0, [sp, #0x4c]
	ldr r7, [sp, #0x44]
	adds r1, r6, r0
	ldr r0, [sp, #0x34]
	adds r4, r5, #0
	subs r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x48]
	str r0, [sp, #0x24]
	adds r1, r0, r1
	ldr r0, [sp, #0x30]
	subs r0, r1, r0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x40]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0xc]
	str r0, [sp, #0x2c]
	adds r0, #0x78
	str r0, [sp, #0x2c]
_02248388:
	str r4, [sp]
	add r0, sp, #0x3c
	str r0, [sp, #4]
	add r0, sp, #0x38
	str r0, [sp, #8]
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	adds r0, r1, r0
	ldr r1, [sp, #0x18]
	adds r2, r6, r7
	bl ov41_02247E34
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x20]
	bl ov41_02249820
	adds r4, r4, #1
	orrs r5, r0
	cmp r4, #0x10
	blt _02248388
	cmp r5, #0
	beq _022483DE
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _022483D0
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r1, #0x14
	str r1, [sp, #0xc]
	bl ov41_02249A50
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
_022483D0:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [r1, #0x20]
	bl ov41_02249A50
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
_022483DE:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _022483F2
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r1, r1, #4
	bl ov41_02249A50
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
_022483F2:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [r1, #0x10]
	bl ov41_02249A50
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02248324

	thumb_func_start ov41_02248400
ov41_02248400: @ 0x02248400
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r0, #0
	add r1, sp, #0x20
	add r2, sp, #0x1c
	bl ov41_02249B94
	adds r0, r6, #0
	add r1, sp, #0x18
	add r2, sp, #0x14
	bl ov41_02249B44
	add r0, sp, #4
	str r0, [sp]
	adds r0, r6, #0
	add r1, sp, #0x10
	add r2, sp, #8
	add r3, sp, #0xc
	bl ov41_02249BAC
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	ldr r3, [sp, #0xc]
	adds r2, r0, r1
	movs r1, #0x8a
	subs r2, r1, r2
	ldr r1, [sp, #0x20]
	adds r1, r0, r1
	ldr r0, [sp, #8]
	subs r1, r1, r0
	ldr r0, [sp, #0x14]
	subs r1, #0xf6
	adds r6, r0, r3
	movs r3, #0x12
	subs r3, r3, r6
	ldr r6, [sp, #0x1c]
	adds r6, r0, r6
	ldr r0, [sp, #4]
	subs r6, r6, r0
	subs r6, #0x8f
	cmp r2, #0
	ble _0224845C
	str r2, [r5]
	b _0224846A
_0224845C:
	cmp r1, #0
	ble _02248466
	rsbs r0, r1, #0
	str r0, [r5]
	b _0224846A
_02248466:
	movs r0, #0
	str r0, [r5]
_0224846A:
	cmp r3, #0
	ble _02248474
	add sp, #0x24
	str r3, [r4]
	pop {r3, r4, r5, r6, pc}
_02248474:
	cmp r6, #0
	ble _02248480
	rsbs r0, r6, #0
	add sp, #0x24
	str r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02248480:
	movs r0, #0
	str r0, [r4]
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov41_02248400

	thumb_func_start ov41_02248488
ov41_02248488: @ 0x02248488
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, [r4]
	adds r5, r0, #0
	str r1, [r5, #0x44]
	ldr r1, [r4, #4]
	str r1, [r5, #0x48]
	ldr r1, [r4, #8]
	str r1, [r5, #0x4c]
	ldr r1, [r4, #0xc]
	str r1, [r5, #0x50]
	ldr r1, [r4, #0x10]
	str r1, [r5, #0x54]
	ldr r1, [r4, #0x14]
	str r1, [r5, #0x58]
	ldr r1, [r4, #0x18]
	str r1, [r5, #8]
	ldr r1, [r4, #0x28]
	str r1, [r5, #4]
	movs r1, #0
	bl ov41_0224888C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov41_022489A8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_02248488

	thumb_func_start ov41_022484C0
ov41_022484C0: @ 0x022484C0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ov41_022486F8
	adds r5, r6, #0
	movs r4, #0
	adds r5, #0xc
_022484CE:
	adds r0, r5, #0
	bl ov41_02248A6C
	adds r4, r4, #1
	adds r5, #0xc
	cmp r4, #4
	blt _022484CE
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x8c
	blx FUN_020E5B44
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_022484C0

	thumb_func_start ov41_022484E8
ov41_022484E8: @ 0x022484E8
	push {r3, lr}
	cmp r0, #0
	beq _022484F8
	cmp r0, #1
	beq _02248568
	cmp r0, #2
	beq _02248576
	pop {r3, pc}
_022484F8:
	cmp r1, #5
	bgt _02248500
	movs r0, #0
	pop {r3, pc}
_02248500:
	cmp r1, #0xb
	bgt _02248508
	movs r0, #1
	pop {r3, pc}
_02248508:
	cmp r1, #0x11
	bgt _02248510
	movs r0, #2
	pop {r3, pc}
_02248510:
	cmp r1, #0x15
	bgt _02248518
	movs r0, #3
	pop {r3, pc}
_02248518:
	cmp r1, #0x1c
	bgt _02248520
	movs r0, #4
	pop {r3, pc}
_02248520:
	cmp r1, #0x21
	bgt _02248528
	movs r0, #5
	pop {r3, pc}
_02248528:
	cmp r1, #0x26
	bgt _02248530
	movs r0, #6
	pop {r3, pc}
_02248530:
	cmp r1, #0x2a
	bgt _02248538
	movs r0, #7
	pop {r3, pc}
_02248538:
	cmp r1, #0x31
	bgt _02248540
	movs r0, #8
	pop {r3, pc}
_02248540:
	cmp r1, #0x37
	bgt _02248548
	movs r0, #9
	pop {r3, pc}
_02248548:
	cmp r1, #0x3c
	bgt _02248550
	movs r0, #0xa
	pop {r3, pc}
_02248550:
	cmp r1, #0x47
	bgt _02248558
	movs r0, #0xb
	pop {r3, pc}
_02248558:
	cmp r1, #0x5b
	bgt _02248560
	movs r0, #0xc
	pop {r3, pc}
_02248560:
	cmp r1, #0x63
	bgt _02248582
	movs r0, #0xd
	pop {r3, pc}
_02248568:
	adds r0, r2, #0
	bl ov41_02248EF4
	movs r1, #9
	blx FUN_020F2998
	pop {r3, pc}
_02248576:
	adds r0, r2, #0
	bl ov41_02248EF4
	movs r1, #9
	blx FUN_020F2998
_02248582:
	pop {r3, pc}
	thumb_func_end ov41_022484E8

	thumb_func_start ov41_02248584
ov41_02248584: @ 0x02248584
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	adds r4, r3, #0
	cmp r0, #0
	beq _02248598
	cmp r0, #1
	beq _022485CA
	cmp r0, #2
	beq _022485CA
	pop {r3, r4, r5, pc}
_02248598:
	movs r0, #0xa
	str r0, [r5]
	movs r0, #0x12
	str r0, [r4]
	bl FUN_0201FDB8
	ldr r2, [sp, #0x10]
	movs r1, #0x6c
	subs r1, r1, r2
	blx FUN_020F2BA4
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	bl FUN_0201FDB8
	ldr r2, [sp, #0x14]
	movs r1, #0x7d
	subs r1, r1, r2
	blx FUN_020F2BA4
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_022485CA:
	ldr r0, [sp, #0x18]
	bl ov41_02248EF4
	adds r1, r5, #0
	adds r2, r4, #0
	bl ov41_02248B48
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_02248584

	thumb_func_start ov41_022485DC
ov41_022485DC: @ 0x022485DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r5, r0, #0
	ldr r0, [r5, #0x58]
	adds r4, r2, #0
	str r4, [sp, #0x40]
	str r0, [sp, #0x28]
	ldr r0, [r5, #0x44]
	adds r6, r1, #0
	movs r1, #0
	str r0, [sp, #0x2c]
	str r1, [sp, #0x38]
	str r1, [sp, #0x3c]
	cmp r6, #0
	beq _02248604
	cmp r6, #1
	beq _02248610
	cmp r6, #2
	beq _0224861E
	b _0224862C
_02248604:
	ldr r0, [r5, #0x50]
	str r4, [sp, #0xc]
	ldrb r0, [r0, r4]
	adds r7, r1, #0
	str r0, [sp, #0x44]
	b _02248630
_02248610:
	adds r0, r4, #0
	str r0, [sp, #0xc]
	adds r0, #0x64
	str r0, [sp, #0xc]
	adds r7, r4, #1
	str r1, [sp, #0x44]
	b _02248630
_0224861E:
	adds r0, r4, #0
	str r0, [sp, #0xc]
	adds r0, #0x64
	str r0, [sp, #0xc]
	adds r7, r4, #1
	str r1, [sp, #0x44]
	b _02248630
_0224862C:
	bl GF_AssertFail
_02248630:
	ldr r0, [sp, #0xc]
	ldr r1, [r5, #0x48]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	lsls r1, r7, #2
	str r0, [sp, #0x30]
	ldr r2, [r5, #0x4c]
	cmp r0, #0
	ldr r1, [r2, r1]
	str r1, [sp, #0x34]
	bne _0224864A
	bl GF_AssertFail
_0224864A:
	ldr r0, [sp, #0x34]
	cmp r0, #0
	bne _02248654
	bl GF_AssertFail
_02248654:
	ldr r2, [r5, #4]
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov41_022484E8
	adds r7, r0, #0
	add r0, sp, #0x28
	bl ov41_02245EE0
	str r0, [sp, #0x10]
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x10]
	adds r2, r6, #0
	bl ov41_022499F0
	movs r1, #0xc
	muls r1, r6, r1
	adds r1, r5, r1
	ldr r2, [r1, #0xc]
	lsls r1, r7, #4
	adds r1, r2, r1
	ldr r1, [r1, #0xc]
	str r0, [sp, #0x14]
	bl ov41_02249A50
	ldr r0, [sp, #0x14]
	add r1, sp, #0x1c
	add r2, sp, #0x18
	bl ov41_02249B94
	ldr r0, [sp, #0x1c]
	adds r1, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0x18]
	add r2, sp, #0x24
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	add r3, sp, #0x20
	str r0, [sp, #8]
	adds r0, r6, #0
	bl ov41_02248584
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x20]
	bl ov41_02249AF4
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov41_02248B20
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_022485DC

	thumb_func_start ov41_022486C4
ov41_022486C4: @ 0x022486C4
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	movs r1, #0xc
	adds r5, r0, #0
	muls r1, r4, r1
	adds r7, r3, #0
	adds r1, r5, r1
	adds r6, r2, #0
	ldr r2, [r1, #0xc]
	lsls r1, r6, #4
	adds r0, r7, #0
	adds r1, r2, r1
	bl ov41_02249A50
	ldr r1, [r7]
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov41_02248B20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_022486C4

	thumb_func_start ov41_022486F0
ov41_022486F0: @ 0x022486F0
	ldr r3, _022486F4 @ =ov41_02249A60
	bx r3
	.align 2, 0
_022486F4: .4byte ov41_02249A60
	thumb_func_end ov41_022486F0

	thumb_func_start ov41_022486F8
ov41_022486F8: @ 0x022486F8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
_022486FE:
	ldr r0, [r5, #0x10]
	movs r6, #0
	cmp r0, #0
	ble _0224871A
	adds r4, r6, #0
_02248708:
	ldr r0, [r5, #0xc]
	adds r0, r0, r4
	bl ov41_02249A70
	ldr r0, [r5, #0x10]
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, r0
	blt _02248708
_0224871A:
	adds r7, r7, #1
	adds r5, #0xc
	cmp r7, #3
	blt _022486FE
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_022486F8

	thumb_func_start ov41_02248724
ov41_02248724: @ 0x02248724
	push {r4, r5, r6, lr}
	movs r5, #0
	mvns r5, r5
	bl ov41_02248A94
	adds r6, r0, #0
	ldr r4, [r6, #8]
	cmp r4, r6
	beq _0224874C
_02248736:
	ldr r0, [r4, #4]
	cmp r0, #2
	bhi _02248744
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov41_02246014
_02248744:
	ldr r4, [r4, #8]
	subs r5, r5, #1
	cmp r4, r6
	bne _02248736
_0224874C:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_02248724

	thumb_func_start ov41_02248750
ov41_02248750: @ 0x02248750
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, [r5, #0x3c]
	adds r4, r2, #0
	cmp r1, #0
	bne _02248788
	ldr r1, [r5]
	movs r2, #0xc
	muls r2, r1, r2
	str r4, [sp]
	adds r2, r5, r2
	ldr r2, [r2, #0x14]
	adds r3, r6, #0
	bl ov41_02248B84
	movs r0, #0xc
	muls r0, r6, r0
	str r6, [r5]
	adds r0, r5, r0
	str r4, [r0, #0x14]
	adds r0, r5, #0
	bl ov41_02248724
	add sp, #4
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_02248788:
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_02248750

	thumb_func_start ov41_02248790
ov41_02248790: @ 0x02248790
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #4]
	str r0, [sp]
	str r2, [sp, #8]
	bl ov41_0224895C
	adds r7, r0, #0
	ldr r0, [sp, #4]
	movs r1, #0xc
	muls r1, r0, r1
	ldr r0, [sp]
	movs r4, #1
	adds r6, r0, r1
	ldr r0, [r6, #0x10]
	cmp r0, #1
	ble _022487F2
_022487B2:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _022487C4
	ldr r1, [r6, #0x10]
	adds r0, r4, r7
	blx FUN_020F2998
	adds r5, r1, #0
	b _022487CC
_022487C4:
	subs r5, r7, r4
	bpl _022487CC
	ldr r0, [r6, #0x10]
	adds r5, r5, r0
_022487CC:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	adds r2, r5, #0
	bl ov41_02248ABC
	ldr r1, [r0, #8]
	cmp r1, r0
	beq _022487EA
	ldr r0, [sp]
	ldr r1, [sp, #4]
	adds r2, r5, #0
	bl ov41_02248750
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_022487EA:
	ldr r0, [r6, #0x10]
	adds r4, r4, #1
	cmp r4, r0
	blt _022487B2
_022487F2:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_02248790

	thumb_func_start ov41_022487F8
ov41_022487F8: @ 0x022487F8
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	bl ov41_02248A18
	movs r0, #0xc
	muls r0, r4, r0
	str r4, [r5]
	adds r0, r5, r0
	str r6, [r0, #0x14]
	adds r0, r5, #0
	movs r1, #1
	bl ov41_02248A18
	adds r0, r5, #0
	bl ov41_02248724
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_022487F8

	thumb_func_start ov41_02248820
ov41_02248820: @ 0x02248820
	push {r3, lr}
	movs r1, #0x12
	add r0, sp, #0
	strb r1, [r0]
	movs r1, #0x8f
	strb r1, [r0, #1]
	movs r1, #0xa
	strb r1, [r0, #2]
	movs r1, #0x76
	strb r1, [r0, #3]
	add r0, sp, #0
	bl FUN_020252F4
	pop {r3, pc}
	thumb_func_end ov41_02248820

	thumb_func_start ov41_0224883C
ov41_0224883C: @ 0x0224883C
	push {r3, lr}
	movs r3, #0x12
	add r0, sp, #0
	strb r3, [r0]
	movs r3, #0x8f
	strb r3, [r0, #1]
	movs r3, #0xa
	strb r3, [r0, #2]
	movs r3, #0x76
	strb r3, [r0, #3]
	add r0, sp, #0
	bl FUN_020253F0
	pop {r3, pc}
	thumb_func_end ov41_0224883C

	thumb_func_start ov41_02248858
ov41_02248858: @ 0x02248858
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp]
	bl ov41_02248A94
	adds r5, r0, #0
	ldr r4, [r5, #8]
	cmp r4, r5
	beq _02248886
_0224886C:
	ldr r3, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov41_02249AA8
	cmp r0, #1
	bne _02248880
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_02248880:
	ldr r4, [r4, #8]
	cmp r4, r5
	bne _0224886C
_02248886:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_02248858

	thumb_func_start ov41_0224888C
ov41_0224888C: @ 0x0224888C
	push {r3, r4, r5, lr}
	sub sp, #0x30
	adds r5, r0, #0
	ldr r0, [r5, #0x54]
	adds r4, r1, #0
	str r0, [sp]
	movs r0, #0x1a
	lsls r1, r4, #1
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r0, #0x81
	str r0, [sp, #8]
	movs r0, #0x85
	str r0, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x14]
	movs r0, #0x81
	str r0, [sp, #0x18]
	movs r0, #3
	str r0, [sp, #0x1c]
	movs r0, #1
	str r0, [sp, #0x20]
	movs r0, #2
	str r0, [sp, #0x24]
	movs r0, #0
	str r0, [sp, #0x28]
	movs r0, #0xe
	adds r1, #0x82
	str r0, [sp, #0x2c]
	adds r0, r5, #0
	str r1, [sp, #0x10]
	adds r0, #0x5c
	add r1, sp, #0
	bl ov41_02249C7C
	str r4, [r5, #0x40]
	add sp, #0x30
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224888C

	thumb_func_start ov41_022488D8
ov41_022488D8: @ 0x022488D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	ldr r0, [r5, #0x54]
	adds r4, r1, #0
	str r0, [sp, #8]
	movs r0, #0x1a
	lsls r1, r4, #1
	str r0, [sp, #0xc]
	adds r0, r1, #0
	adds r0, #0x81
	str r0, [sp, #0x10]
	movs r0, #0x85
	str r0, [sp, #0x14]
	movs r0, #8
	adds r1, #0x82
	str r0, [sp, #0x1c]
	movs r0, #0x81
	str r1, [sp, #0x18]
	str r0, [sp, #0x20]
	movs r0, #3
	movs r1, #2
	str r0, [sp, #0x24]
	movs r0, #1
	str r1, [sp, #0x2c]
	movs r7, #0
	movs r1, #0xe
	str r0, [sp, #0x28]
	str r7, [sp, #0x30]
	str r1, [sp, #0x34]
	tst r0, r2
	beq _0224891A
	movs r7, #0x70
_0224891A:
	movs r0, #2
	tst r0, r2
	beq _02248924
	movs r6, #0x81
	b _02248926
_02248924:
	movs r6, #0
_02248926:
	ldr r0, [sp, #0x50]
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x5c
	add r1, sp, #8
	adds r2, r7, #0
	adds r3, r6, #0
	bl ov41_02249DB4
	str r4, [r5, #0x40]
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_022488D8

	thumb_func_start ov41_02248940
ov41_02248940: @ 0x02248940
	ldr r3, _02248948 @ =ov41_02249CC4
	adds r0, #0x5c
	bx r3
	nop
_02248948: .4byte ov41_02249CC4
	thumb_func_end ov41_02248940

	thumb_func_start ov41_0224894C
ov41_0224894C: @ 0x0224894C
	push {r4, lr}
	adds r4, r0, #0
	bne _02248956
	bl GF_AssertFail
_02248956:
	ldr r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224894C

	thumb_func_start ov41_0224895C
ov41_0224895C: @ 0x0224895C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _0224896C
	bl GF_AssertFail
_0224896C:
	movs r0, #0xc
	muls r0, r4, r0
	adds r3, r5, r0
	adds r3, #0xc
	ldm r3!, {r0, r1}
	add r2, sp, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #8]
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov41_0224895C

	thumb_func_start ov41_02248984
ov41_02248984: @ 0x02248984
	push {r4, lr}
	adds r4, r3, #0
	bl ov41_02248ABC
	ldr r2, [sp, #8]
	adds r1, r4, #0
	bl ov41_02249BE8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02248984

	thumb_func_start ov41_02248998
ov41_02248998: @ 0x02248998
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	bne _022489A2
	movs r0, #1
	bx lr
_022489A2:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov41_02248998

	thumb_func_start ov41_022489A8
ov41_022489A8: @ 0x022489A8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, [r4, #0x1c]
	adds r5, r0, #0
	adds r0, #0xc
	bl ov41_02248A28
	movs r0, #0
	str r0, [r5]
	ldr r0, [r5, #0xc]
	movs r1, #1
	bl ov41_022489E4
	adds r0, r5, #0
	ldr r1, [r4, #0x20]
	adds r0, #0x18
	bl ov41_02248A28
	adds r0, r5, #0
	ldr r1, [r4, #0x24]
	adds r0, #0x24
	bl ov41_02248A28
	adds r5, #0x30
	adds r0, r5, #0
	movs r1, #1
	bl ov41_02248A28
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_022489A8

	thumb_func_start ov41_022489E4
ov41_022489E4: @ 0x022489E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #8]
	adds r6, r1, #0
	cmp r4, r5
	beq _02248A04
_022489F0:
	ldr r0, [r4, #4]
	cmp r0, #2
	bhi _022489FE
	ldr r0, [r4]
	adds r1, r6, #0
	bl ov41_02246008
_022489FE:
	ldr r4, [r4, #8]
	cmp r4, r5
	bne _022489F0
_02248A04:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_022489E4

	thumb_func_start ov41_02248A08
ov41_02248A08: @ 0x02248A08
	push {r4, lr}
	adds r4, r3, #0
	bl ov41_02248ABC
	adds r1, r4, #0
	bl ov41_022489E4
	pop {r4, pc}
	thumb_func_end ov41_02248A08

	thumb_func_start ov41_02248A18
ov41_02248A18: @ 0x02248A18
	push {r4, lr}
	adds r4, r1, #0
	bl ov41_02248A94
	adds r1, r4, #0
	bl ov41_022489E4
	pop {r4, pc}
	thumb_func_end ov41_02248A18

	thumb_func_start ov41_02248A28
ov41_02248A28: @ 0x02248A28
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r0, #0xe
	lsls r1, r4, #4
	bl FUN_0201AA8C
	str r0, [r5]
	str r4, [r5, #4]
	movs r6, #0
	str r6, [r5, #8]
	ldr r0, [r5, #4]
	cmp r0, #0
	ble _02248A68
	adds r4, r6, #0
	adds r7, r6, #0
_02248A48:
	ldr r0, [r5]
	adds r1, r7, #0
	adds r0, r0, r4
	str r0, [r0, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r0, #0xc]
	ldr r0, [r5]
	adds r0, r0, r4
	bl ov41_022489E4
	ldr r0, [r5, #4]
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, r0
	blt _02248A48
_02248A68:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_02248A28

	thumb_func_start ov41_02248A6C
ov41_02248A6C: @ 0x02248A6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4]
	strb r0, [r4]
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	strb r0, [r4, #4]
	strb r0, [r4, #5]
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xb]
	pop {r4, pc}
	thumb_func_end ov41_02248A6C

	thumb_func_start ov41_02248A94
ov41_02248A94: @ 0x02248A94
	push {r3}
	sub sp, #0xc
	ldr r2, [r0]
	movs r1, #0xc
	muls r1, r2, r1
	adds r3, r0, r1
	adds r3, #0xc
	ldm r3!, {r0, r1}
	add r2, sp, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #8]
	ldr r1, [sp]
	lsls r0, r0, #4
	adds r0, r1, r0
	add sp, #0xc
	pop {r3}
	bx lr
	.align 2, 0
	thumb_func_end ov41_02248A94

	thumb_func_start ov41_02248ABC
ov41_02248ABC: @ 0x02248ABC
	push {r4}
	sub sp, #0xc
	movs r3, #0xc
	muls r3, r1, r3
	adds r4, r0, r3
	adds r4, #0xc
	ldm r4!, {r0, r1}
	add r3, sp, #0
	stm r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	ldr r1, [sp]
	lsls r0, r2, #4
	adds r0, r1, r0
	add sp, #0xc
	pop {r4}
	bx lr
	.align 2, 0
	thumb_func_end ov41_02248ABC

	thumb_func_start ov41_02248AE0
ov41_02248AE0: @ 0x02248AE0
	push {r4, lr}
	movs r4, #0
	bl ov41_02248ABC
	ldr r1, [r0, #8]
	cmp r1, r0
	beq _02248AF6
_02248AEE:
	ldr r1, [r1, #8]
	adds r4, r4, #1
	cmp r1, r0
	bne _02248AEE
_02248AF6:
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02248AE0

	thumb_func_start ov41_02248AFC
ov41_02248AFC: @ 0x02248AFC
	push {r3, r4, r5, lr}
	adds r5, r3, #0
	movs r4, #0
	bl ov41_02248ABC
	ldr r1, [r0, #8]
	cmp r1, r0
	beq _02248B1C
_02248B0C:
	cmp r4, r5
	bne _02248B14
	adds r0, r1, #0
	pop {r3, r4, r5, pc}
_02248B14:
	ldr r1, [r1, #8]
	adds r4, r4, #1
	cmp r1, r0
	bne _02248B0C
_02248B1C:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_02248AFC

	thumb_func_start ov41_02248B20
ov41_02248B20: @ 0x02248B20
	push {r4, lr}
	ldr r4, [r0]
	cmp r4, r2
	bne _02248B34
	movs r4, #0xc
	muls r4, r2, r4
	adds r0, r0, r4
	ldr r0, [r0, #0x14]
	cmp r3, r0
	beq _02248B3E
_02248B34:
	adds r0, r1, #0
	movs r1, #0
	bl ov41_02246008
	pop {r4, pc}
_02248B3E:
	adds r0, r1, #0
	movs r1, #1
	bl ov41_02246008
	pop {r4, pc}
	thumb_func_end ov41_02248B20

	thumb_func_start ov41_02248B48
ov41_02248B48: @ 0x02248B48
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	movs r1, #9
	adds r4, r2, #0
	blx FUN_020F2998
	adds r7, r1, #0
	adds r0, r7, #0
	movs r1, #3
	blx FUN_020F2998
	adds r6, r0, #0
	adds r0, r7, #0
	movs r1, #3
	blx FUN_020F2998
	adds r0, r6, #1
	lsls r2, r0, #3
	lsls r0, r6, #5
	adds r0, r2, r0
	adds r0, #0x10
	str r0, [r4]
	adds r0, r1, #1
	lsls r2, r0, #3
	movs r0, #0x18
	muls r0, r1, r0
	adds r0, r2, r0
	adds r0, #8
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02248B48

	thumb_func_start ov41_02248B84
ov41_02248B84: @ 0x02248B84
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp]
	ldr r0, _02248BF8 @ =ov41_02248BFC
	movs r1, #0x30
	movs r2, #0
	movs r3, #0xd
	bl FUN_02007200
	bl FUN_0201F988
	adds r4, r0, #0
	str r5, [r4]
	str r6, [r4, #4]
	ldr r0, [sp]
	str r7, [r4, #8]
	str r0, [r4, #0xc]
	ldr r0, [sp, #0x18]
	adds r1, r6, #0
	str r0, [r4, #0x10]
	movs r0, #0
	str r0, [r4, #0x1c]
	adds r0, r5, #0
	adds r2, r7, #0
	bl ov41_02248AE0
	str r0, [r4, #0x20]
	ldr r1, [sp]
	ldr r2, [sp, #0x18]
	adds r0, r5, #0
	bl ov41_02248AE0
	str r0, [r4, #0x24]
	ldr r1, [r4, #0x20]
	adds r2, r1, r0
	movs r1, #0xc
	movs r0, #0xd
	muls r1, r2, r1
	str r2, [r4, #0x2c]
	bl FUN_0201AA8C
	str r0, [r4, #0x28]
	cmp r0, #0
	bne _02248BE4
	bl GF_AssertFail
_02248BE4:
	ldr r3, [r4, #0x2c]
	movs r2, #0xc
	ldr r0, [r4, #0x28]
	movs r1, #0
	muls r2, r3, r2
	blx FUN_020E5B44
	movs r0, #1
	str r0, [r5, #0x3c]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02248BF8: .4byte ov41_02248BFC
	thumb_func_end ov41_02248B84

	thumb_func_start ov41_02248BFC
ov41_02248BFC: @ 0x02248BFC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #4
	bls _02248C0C
	b _02248D54
_02248C0C:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02248C18: @ jump table
	.2byte _02248C22 - _02248C18 - 2 @ case 0
	.2byte _02248C76 - _02248C18 - 2 @ case 1
	.2byte _02248CC2 - _02248C18 - 2 @ case 2
	.2byte _02248D08 - _02248C18 - 2 @ case 3
	.2byte _02248D20 - _02248C18 - 2 @ case 4
_02248C22:
	movs r0, #0x83
	mvns r0, r0
	str r0, [sp]
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	movs r3, #0
	bl ov41_02248984
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	movs r3, #1
	bl ov41_02248A08
	movs r0, #0
	str r0, [r4, #0x14]
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x14
	str r1, [sp]
	ldr r1, [r0, #0x40]
	adds r1, r1, #1
	lsrs r3, r1, #0x1f
	lsls r2, r1, #0x1f
	subs r2, r2, r3
	movs r1, #0x1f
	rors r2, r1
	adds r1, r3, r2
	movs r2, #2
	movs r3, #5
	bl ov41_022488D8
	ldr r0, [r4, #0x20]
	movs r1, #1
	bl ov41_02248E10
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x1c]
	adds r0, r0, #1
	str r0, [r4, #0x1c]
	b _02248D58
_02248C76:
	ldr r0, [r4, #0x18]
	movs r6, #0
	cmp r0, #0
	ble _02248CAA
	adds r5, r4, #0
	adds r5, #0x20
_02248C82:
	ldr r0, [r4, #0x20]
	subs r0, r0, #1
	bmi _02248CA2
	ldr r0, [r5]
	subs r0, r0, #1
	str r0, [r5]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0x20]
	bl ov41_02248AFC
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	bl ov41_02248D64
_02248CA2:
	ldr r0, [r4, #0x18]
	adds r6, r6, #1
	cmp r6, r0
	blt _02248C82
_02248CAA:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bne _02248D58
	ldr r0, [r4, #0x24]
	movs r1, #2
	bl ov41_02248E10
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x1c]
	adds r0, r0, #1
	str r0, [r4, #0x1c]
	b _02248D58
_02248CC2:
	ldr r0, [r4, #0x18]
	movs r6, #0
	cmp r0, #0
	ble _02248CF6
	adds r5, r4, #0
	adds r5, #0x24
_02248CCE:
	ldr r0, [r4, #0x24]
	subs r0, r0, #1
	bmi _02248CEE
	ldr r0, [r5]
	subs r0, r0, #1
	str r0, [r5]
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0x24]
	bl ov41_02248AFC
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	bl ov41_02248D64
_02248CEE:
	ldr r0, [r4, #0x18]
	adds r6, r6, #1
	cmp r6, r0
	blt _02248CCE
_02248CF6:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _02248D58
	ldr r0, [r4, #0x1c]
	adds r0, r0, #1
	str r0, [r4, #0x1c]
	movs r0, #0
	str r0, [r4, #0x18]
	b _02248D58
_02248D08:
	ldr r0, [r4, #0x18]
	adds r0, r0, #1
	str r0, [r4, #0x18]
	cmp r0, #3
	ble _02248D58
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _02248D58
	ldr r0, [r4, #0x1c]
	adds r0, r0, #1
	str r0, [r4, #0x1c]
	b _02248D58
_02248D20:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	movs r3, #0
	bl ov41_02248A08
	movs r0, #0x83
	mvns r0, r0
	str r0, [sp]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	movs r3, #0
	bl ov41_02248984
	ldr r0, [r4]
	movs r1, #0
	str r1, [r0, #0x3c]
	ldr r0, [r4, #0x28]
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_02007234
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02248D54:
	bl GF_AssertFail
_02248D58:
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #0x2c]
	bl ov41_02248DA4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov41_02248BFC

	thumb_func_start ov41_02248D64
ov41_02248D64: @ 0x02248D64
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	bl ov41_02248D7C
	str r4, [r0]
	movs r1, #3
	str r1, [r0, #4]
	movs r1, #0x2c
	str r1, [r0, #8]
	pop {r4, pc}
	thumb_func_end ov41_02248D64

	thumb_func_start ov41_02248D7C
ov41_02248D7C: @ 0x02248D7C
	push {r3, r4}
	movs r3, #0
	cmp r1, #0
	ble _02248D9E
	adds r4, r0, #0
_02248D86:
	ldr r2, [r4]
	cmp r2, #0
	bne _02248D96
	movs r1, #0xc
	muls r1, r3, r1
	adds r0, r0, r1
	pop {r3, r4}
	bx lr
_02248D96:
	adds r3, r3, #1
	adds r4, #0xc
	cmp r3, r1
	blt _02248D86
_02248D9E:
	movs r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov41_02248D7C

	thumb_func_start ov41_02248DA4
ov41_02248DA4: @ 0x02248DA4
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	movs r4, #0
	cmp r6, #0
	ble _02248DC4
_02248DB0:
	ldr r0, [r5]
	cmp r0, #0
	beq _02248DBC
	adds r0, r5, #0
	bl ov41_02248DC8
_02248DBC:
	adds r4, r4, #1
	adds r5, #0xc
	cmp r4, r6
	blt _02248DB0
_02248DC4:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_02248DA4

	thumb_func_start ov41_02248DC8
ov41_02248DC8: @ 0x02248DC8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4]
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02249B44
	ldr r1, [sp]
	ldr r0, [r4, #8]
	adds r2, r1, r0
	str r2, [sp]
	ldr r0, [r4]
	ldr r1, [sp, #4]
	bl ov41_02249AF4
	ldr r0, [r4, #4]
	subs r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #0
	bgt _02248E0C
	movs r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	strb r0, [r4, #4]
	strb r0, [r4, #5]
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xb]
_02248E0C:
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov41_02248DC8

	thumb_func_start ov41_02248E10
ov41_02248E10: @ 0x02248E10
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	blx FUN_020F2998
	subs r0, r4, r1
	adds r0, r5, r0
	adds r1, r4, #0
	blx FUN_020F2998
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_02248E10

	thumb_func_start ov41_02248E28
ov41_02248E28: @ 0x02248E28
	adds r3, r0, #0
	movs r2, #0x1c
	movs r1, #0
_02248E2E:
	strb r1, [r3]
	adds r3, r3, #1
	subs r2, r2, #1
	bne _02248E2E
	ldr r1, _02248E40 @ =ov41_02248E80
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_02248E40: .4byte ov41_02248E80
	thumb_func_end ov41_02248E28

	thumb_func_start ov41_02248E44
ov41_02248E44: @ 0x02248E44
	push {r4, lr}
	ldr r1, _02248E7C @ =0x021D114C
	adds r4, r0, #0
	ldrh r2, [r1, #0x24]
	cmp r2, #0
	beq _02248E56
	ldr r1, [r4, #4]
	blx r1
	b _02248E6C
_02248E56:
	ldrh r1, [r1, #0x26]
	cmp r1, #0
	beq _02248E62
	ldr r1, [r4, #0xc]
	blx r1
	b _02248E6C
_02248E62:
	ldrb r1, [r4, #0x18]
	cmp r1, #0
	beq _02248E6C
	ldr r1, [r4, #8]
	blx r1
_02248E6C:
	ldr r0, _02248E7C @ =0x021D114C
	ldrh r1, [r0, #0x20]
	strh r1, [r4, #0x14]
	ldrh r1, [r0, #0x22]
	strh r1, [r4, #0x16]
	ldrh r0, [r0, #0x26]
	strb r0, [r4, #0x18]
	pop {r4, pc}
	.align 2, 0
_02248E7C: .4byte 0x021D114C
	thumb_func_end ov41_02248E44

	thumb_func_start ov41_02248E80
ov41_02248E80: @ 0x02248E80
	bx lr
	.align 2, 0
	thumb_func_end ov41_02248E80

	thumb_func_start ov41_02248E84
ov41_02248E84: @ 0x02248E84
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	adds r6, r0, #0
	movs r4, #0
	adds r5, r7, #0
_02248E8E:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0202BA70
	adds r4, r4, #1
	stm r5!, {r0}
	cmp r4, #0x64
	blt _02248E8E
	movs r0, #0x19
	movs r3, #0
	adds r2, r7, #0
	movs r1, #0x12
	lsls r0, r0, #4
_02248EA8:
	adds r3, r3, #1
	str r1, [r2, r0]
	adds r2, r2, #4
	cmp r3, #0x12
	blt _02248EA8
	movs r5, #0x19
	movs r4, #0
	lsls r5, r5, #4
_02248EB8:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0202BAB0
	cmp r0, #0x12
	beq _02248ECA
	lsls r0, r0, #2
	adds r0, r7, r0
	str r4, [r0, r5]
_02248ECA:
	adds r4, r4, #1
	cmp r4, #0x12
	blt _02248EB8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_02248E84

	thumb_func_start ov41_02248ED4
ov41_02248ED4: @ 0x02248ED4
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0x64
	blo _02248EE2
	bl GF_AssertFail
_02248EE2:
	lsls r0, r5, #2
	ldr r0, [r4, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_02248ED4

	thumb_func_start ov41_02248EE8
ov41_02248EE8: @ 0x02248EE8
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bx lr
	thumb_func_end ov41_02248EE8

	thumb_func_start ov41_02248EF4
ov41_02248EF4: @ 0x02248EF4
	push {r3, r4}
	movs r2, #0x19
	movs r4, #0
	lsls r2, r2, #4
_02248EFC:
	ldr r3, [r0, r2]
	cmp r1, r3
	bne _02248F08
	adds r0, r4, #0
	pop {r3, r4}
	bx lr
_02248F08:
	adds r4, r4, #1
	adds r0, r0, #4
	cmp r4, #0x12
	blt _02248EFC
	adds r0, r4, #0
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov41_02248EF4

	thumb_func_start ov41_02248F18
ov41_02248F18: @ 0x02248F18
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov41_02248E28
	movs r0, #0xd
	movs r1, #0x34
	bl FUN_0201AA8C
	str r0, [r5]
	movs r1, #0
	movs r2, #0x34
	blx FUN_020E5B44
	ldr r1, [r5]
	ldr r0, [sp, #0x18]
	str r4, [r1, #4]
	str r6, [r1, #8]
	str r7, [r1]
	str r0, [r1, #0xc]
	ldr r0, [sp, #0x1c]
	str r0, [r1, #0x2c]
	ldr r0, _02248F5C @ =ov41_02248F80
	str r0, [r5, #4]
	ldr r0, _02248F60 @ =ov41_022490F0
	str r0, [r5, #8]
	ldr r0, _02248F64 @ =ov41_02249280
	str r0, [r5, #0xc]
	ldr r0, _02248F68 @ =ov41_02248F6C
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02248F5C: .4byte ov41_02248F80
_02248F60: .4byte ov41_022490F0
_02248F64: .4byte ov41_02249280
_02248F68: .4byte ov41_02248F6C
	thumb_func_end ov41_02248F18

	thumb_func_start ov41_02248F6C
ov41_02248F6C: @ 0x02248F6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl ov41_02248E28
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02248F6C

	thumb_func_start ov41_02248F80
ov41_02248F80: @ 0x02248F80
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4, #4]
	bl ov41_022481BC
	cmp r0, #0
	beq _02249002
	ldr r3, [r4]
	ldr r0, [r4, #4]
	ldr r3, [r3, #0x38]
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov41_022481F4
	adds r6, r0, #0
	beq _02248FB2
	ldr r0, [r6, #4]
	cmp r0, #3
	bne _02248FB2
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _02248FB2
	movs r6, #0
_02248FB2:
	cmp r6, #0
	beq _0224903E
	ldr r0, [r6, #4]
	cmp r0, #0
	bne _02248FC8
	ldr r0, [r4, #4]
	adds r1, r6, #0
	bl ov41_022480C8
	movs r7, #0
	b _02248FE4
_02248FC8:
	adds r0, r6, #0
	bl ov41_02248030
	ldr r0, [r6]
	bl ov41_02249710
	adds r1, r4, #0
	adds r2, r4, #0
	adds r7, r0, #0
	adds r0, r6, #0
	adds r1, #0x24
	adds r2, #0x28
	bl ov41_02249B44
_02248FE4:
	ldr r0, [r4, #4]
	bl ov41_02248158
	ldr r0, [sp, #8]
	adds r1, r6, #0
	str r0, [sp]
	str r7, [sp, #4]
	ldr r3, [sp, #0xc]
	adds r0, r4, #0
	movs r2, #1
	bl ov41_022493BC
	bl ov41_0224642C
	b _0224903E
_02249002:
	ldr r0, [r4, #8]
	bl ov41_02248820
	cmp r0, #0
	beq _0224903E
	ldr r3, [r4]
	ldr r0, [r4, #8]
	ldr r3, [r3, #0x38]
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov41_02248858
	adds r6, r0, #0
	beq _0224903E
	bl ov41_022486F0
	ldr r0, [r4, #8]
	bl ov41_02248724
	ldr r0, [sp, #8]
	movs r2, #0
	str r0, [sp]
	str r2, [sp, #4]
	ldr r3, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov41_022493BC
	bl ov41_0224642C
_0224903E:
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq _02249088
	ldr r1, [r1, #4]
	ldr r0, _0224908C @ =0x000005EB
	cmp r1, #0
	beq _02249056
	cmp r1, #1
	beq _02249060
	cmp r1, #3
	beq _02249072
	b _0224907A
_02249056:
	ldr r1, _02249090 @ =ov41_022490F0
	str r1, [r5, #8]
	ldr r1, _02249094 @ =ov41_02249280
	str r1, [r5, #0xc]
	b _0224907A
_02249060:
	ldr r0, _02249098 @ =ov41_022490B0
	str r0, [r5, #8]
	ldr r0, _0224909C @ =ov41_022490AC
	str r0, [r5, #0xc]
	adds r0, r5, #0
	bl ov41_02249390
	ldr r0, _022490A0 @ =0x0000067D
	b _0224907A
_02249072:
	ldr r1, _022490A4 @ =ov41_022492B0
	str r1, [r5, #8]
	ldr r1, _022490A8 @ =ov41_022492E0
	str r1, [r5, #0xc]
_0224907A:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov41_02249574
_02249088:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224908C: .4byte 0x000005EB
_02249090: .4byte ov41_022490F0
_02249094: .4byte ov41_02249280
_02249098: .4byte ov41_022490B0
_0224909C: .4byte ov41_022490AC
_022490A0: .4byte 0x0000067D
_022490A4: .4byte ov41_022492B0
_022490A8: .4byte ov41_022492E0
	thumb_func_end ov41_02248F80

	thumb_func_start ov41_022490AC
ov41_022490AC: @ 0x022490AC
	bx lr
	.align 2, 0
	thumb_func_end ov41_022490AC

	thumb_func_start ov41_022490B0
ov41_022490B0: @ 0x022490B0
	push {r4, lr}
	sub sp, #8
	ldr r4, [r0]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _022490EA
	ldr r0, [r0, #4]
	cmp r0, #1
	beq _022490C6
	bl GF_AssertFail
_022490C6:
	ldr r0, [r4, #0x10]
	movs r2, #0x1c
	ldr r0, [r0, #4]
	movs r3, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	movs r1, #4
	str r0, [sp, #4]
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	adds r0, r4, #0
	bl ov41_02249480
	adds r0, r4, #0
	bl ov41_02249418
_022490EA:
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_022490B0

	thumb_func_start ov41_022490F0
ov41_022490F0: @ 0x022490F0
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r6, r0, #0
	ldr r4, [r6]
	ldr r1, [r4, #0x10]
	cmp r1, #0
	bne _02249100
	b _0224926E
_02249100:
	add r1, sp, #0x18
	str r1, [sp]
	add r1, sp, #0x24
	add r2, sp, #0x20
	add r3, sp, #0x1c
	bl ov41_0224946C
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x24]
	bl ov41_022481D8
	adds r5, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x24]
	bl ov41_022481D8
	adds r5, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	bl ov41_022481D8
	adds r5, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x20]
	bl ov41_022481D8
	adds r0, r5, r0
	cmp r0, #4
	blt _022491A2
	ldr r2, [r4]
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x10]
	ldr r2, [r2, #0x38]
	bl ov41_022480A4
	cmp r0, #0
	bne _0224918C
	movs r0, #0x1c
	ldrsh r0, [r4, r0]
	str r0, [sp, #0xc]
	movs r0, #0x1e
	ldrsh r0, [r4, r0]
	str r0, [sp, #8]
	ldr r0, _02249274 @ =0x00000682
	bl FUN_0200604C
	ldr r0, [r4, #0xc]
	movs r1, #0x1b
	movs r2, #0xd7
	movs r3, #3
	bl ov41_0224AC08
	ldr r0, [r4, #0x10]
	movs r1, #4
	ldr r0, [r0, #4]
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	adds r0, r4, #0
	bl ov41_02249480
	b _02249268
_0224918C:
	ldr r0, [r4, #4]
	bl ov41_02248158
	bl ov41_022463FC
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, _02249278 @ =0x000005EA
	bl FUN_0200604C
	b _02249268
_022491A2:
	ldr r0, [r4, #0x10]
	add r1, sp, #0x24
	ldr r5, [r0]
	add r0, sp, #0x18
	str r0, [sp]
	adds r0, r6, #0
	add r2, sp, #0x20
	add r3, sp, #0x1c
	bl ov41_0224942C
	ldr r0, [r4, #8]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x24]
	bl ov41_0224883C
	adds r6, r0, #0
	ldr r0, [r4, #8]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x20]
	bl ov41_0224883C
	adds r0, r6, r0
	cmp r0, #2
	bge _02249220
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _0224920C
	ldr r0, [r4, #0x10]
	add r1, sp, #0x14
	add r2, sp, #0x10
	bl ov41_02249B94
	bl FUN_0201FDB8
	ldr r2, [sp, #0x14]
	movs r1, #0x6c
	subs r1, r1, r2
	blx FUN_020F2BA4
	adds r1, #0xa
	str r1, [sp, #0xc]
	bl FUN_0201FDB8
	ldr r2, [sp, #0x10]
	movs r1, #0x7d
	subs r1, r1, r2
	blx FUN_020F2BA4
	adds r1, #0x12
	str r1, [sp, #8]
	b _02249218
_0224920C:
	movs r0, #0x1c
	ldrsh r0, [r4, r0]
	str r0, [sp, #0xc]
	movs r0, #0x1e
	ldrsh r0, [r4, r0]
	str r0, [sp, #8]
_02249218:
	ldr r0, _02249274 @ =0x00000682
	bl FUN_0200604C
	b _02249230
_02249220:
	ldr r0, [r4, #0x10]
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov41_02249B44
	ldr r0, _0224927C @ =0x000005EB
	bl FUN_0200604C
_02249230:
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _0224924E
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #8]
	ldr r0, [r0, #4]
	ldr r1, [r5]
	ldr r2, [r2, #4]
	bl ov41_022484E8
	adds r1, r4, #0
	adds r1, #0x21
	strb r0, [r1]
_0224924E:
	ldr r0, [r4, #0x10]
	movs r1, #4
	ldr r0, [r0, #4]
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	adds r0, r4, #0
	bl ov41_02249480
_02249268:
	adds r0, r4, #0
	bl ov41_02249418
_0224926E:
	add sp, #0x28
	pop {r4, r5, r6, pc}
	nop
_02249274: .4byte 0x00000682
_02249278: .4byte 0x000005EA
_0224927C: .4byte 0x000005EB
	thumb_func_end ov41_022490F0

	thumb_func_start ov41_02249280
ov41_02249280: @ 0x02249280
	push {r4, lr}
	ldr r2, [r0]
	ldr r0, [r2, #0x10]
	cmp r0, #0
	beq _022492A4
	ldr r3, _022492A8 @ =0x021D114C
	ldr r1, _022492AC @ =0x0000FFFF
	ldrh r4, [r3, #0x20]
	cmp r4, r1
	beq _022492A4
	beq _022492A4
	ldrh r3, [r3, #0x22]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #0x18]
	subs r1, r4, r1
	subs r2, r3, r2
	bl ov41_02249AF4
_022492A4:
	pop {r4, pc}
	nop
_022492A8: .4byte 0x021D114C
_022492AC: .4byte 0x0000FFFF
	thumb_func_end ov41_02249280

	thumb_func_start ov41_022492B0
ov41_022492B0: @ 0x022492B0
	push {r4, lr}
	ldr r4, [r0]
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq _022492DA
	ldr r0, [r4, #4]
	bl ov41_02248020
	ldr r0, [r4, #4]
	bl ov41_02248158
	bl ov41_022463FC
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, _022492DC @ =0x000005EB
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov41_02249418
_022492DA:
	pop {r4, pc}
	.align 2, 0
_022492DC: .4byte 0x000005EB
	thumb_func_end ov41_022492B0

	thumb_func_start ov41_022492E0
ov41_022492E0: @ 0x022492E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r4, [r0]
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02249384
	ldr r1, _02249388 @ =0x021D114C
	ldrh r2, [r1, #0x20]
	ldr r1, _0224938C @ =0x0000FFFF
	cmp r2, r1
	beq _02249384
	beq _02249384
	add r1, sp, #8
	str r1, [sp]
	add r1, sp, #0x14
	add r2, sp, #0xc
	add r3, sp, #0x10
	bl ov41_02249BAC
	ldr r0, [r4, #0x10]
	add r1, sp, #0x1c
	add r2, sp, #0x18
	bl ov41_02249B94
	ldr r0, _02249388 @ =0x021D114C
	ldr r1, [r4, #0x14]
	ldrh r2, [r0, #0x20]
	ldr r3, [sp, #0x18]
	subs r5, r2, r1
	ldrh r1, [r0, #0x22]
	ldr r0, [r4, #0x18]
	ldr r2, [sp, #0x1c]
	subs r6, r1, r0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	subs r0, r2, r0
	ldr r2, [sp, #8]
	adds r7, r6, r1
	subs r2, r3, r2
	ldr r3, [sp, #0x14]
	str r2, [sp, #0x18]
	adds r2, r5, r3
	str r0, [sp, #0x1c]
	cmp r2, #0x8a
	bgt _02249342
	movs r0, #0x8a
	subs r5, r0, r3
	b _0224934C
_02249342:
	adds r2, r5, r0
	cmp r2, #0xf6
	blt _0224934C
	movs r2, #0xf6
	subs r5, r2, r0
_0224934C:
	cmp r7, #0x12
	bgt _02249356
	movs r0, #0x12
	subs r6, r0, r1
	b _02249362
_02249356:
	ldr r1, [sp, #0x18]
	adds r0, r6, r1
	cmp r0, #0x8f
	blt _02249362
	movs r0, #0x8f
	subs r6, r0, r1
_02249362:
	ldr r0, [sp, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov41_022495A4
	ldr r0, [r4, #4]
	add r1, sp, #0x14
	add r2, sp, #0x10
	bl ov41_022482B8
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r0, [sp, #4]
	adds r1, r5, r1
	adds r2, r6, r2
	bl ov41_022495A4
_02249384:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02249388: .4byte 0x021D114C
_0224938C: .4byte 0x0000FFFF
	thumb_func_end ov41_022492E0

	thumb_func_start ov41_02249390
ov41_02249390: @ 0x02249390
	push {r3, r4, r5, lr}
	ldr r4, [r0]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _022493B8
	ldr r0, [r0, #4]
	cmp r0, #1
	beq _022493A4
	bl GF_AssertFail
_022493A4:
	ldr r0, [r4, #0x10]
	ldr r5, [r0]
	ldr r0, [r4, #4]
	bl ov41_022482A8
	ldr r0, [r4, #4]
	ldr r1, [r5]
	movs r2, #0xe
	bl ov41_0224825C
_022493B8:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_02249390

	thumb_func_start ov41_022493BC
ov41_022493BC: @ 0x022493BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	adds r0, r4, #0
	add r1, sp, #4
	add r2, sp, #0
	adds r7, r3, #0
	bl ov41_02249B44
	str r4, [r5, #0x10]
	ldr r0, [sp, #4]
	strh r0, [r5, #0x1c]
	ldr r0, [sp]
	strh r0, [r5, #0x1e]
	adds r0, r5, #0
	adds r0, #0x20
	strb r6, [r0]
	ldr r0, [sp, #0x20]
	str r7, [r5, #0x14]
	str r0, [r5, #0x18]
	cmp r6, #0
	bne _022493FE
	ldr r1, [r5, #0x10]
	ldr r0, [r5, #8]
	ldr r1, [r1, #4]
	bl ov41_0224895C
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
	b _02249406
_022493FE:
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x21
	strb r1, [r0]
_02249406:
	movs r0, #1
	str r0, [r5, #0x30]
	ldr r1, [sp, #0x24]
	adds r0, r4, #0
	bl ov41_02249A90
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_022493BC

	thumb_func_start ov41_02249418
ov41_02249418: @ 0x02249418
	movs r2, #0
	str r2, [r0, #0x10]
	strh r2, [r0, #0x1c]
	adds r1, r0, #0
	strh r2, [r0, #0x1e]
	adds r1, #0x20
	strb r2, [r1]
	adds r0, #0x21
	strb r2, [r0]
	bx lr
	thumb_func_end ov41_02249418

	thumb_func_start ov41_0224942C
ov41_0224942C: @ 0x0224942C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r4, [r0]
	adds r5, r1, #0
	ldr r0, [r4, #0x10]
	adds r6, r2, #0
	add r1, sp, #0xc
	add r2, sp, #8
	adds r7, r3, #0
	bl ov41_02249B94
	ldr r0, [r4, #0x10]
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02249B44
	ldr r0, [sp]
	str r0, [r5]
	ldr r1, [sp]
	ldr r0, [sp, #8]
	adds r0, r1, r0
	str r0, [r6]
	ldr r0, [sp, #4]
	str r0, [r7]
	ldr r1, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r1, r1, r0
	ldr r0, [sp, #0x28]
	str r1, [r0]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_0224942C

	thumb_func_start ov41_0224946C
ov41_0224946C: @ 0x0224946C
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl ov41_02249C20
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov41_0224946C

	thumb_func_start ov41_02249480
ov41_02249480: @ 0x02249480
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp]
	ldr r0, _022494F0 @ =ov41_022494F4
	movs r1, #0x2c
	movs r2, #0
	movs r3, #0xd
	bl FUN_02007200
	bl FUN_0201F988
	adds r4, r0, #0
	ldr r0, [r5, #8]
	add r1, sp, #8
	str r0, [r4]
	ldr r0, [r5, #0x10]
	add r2, sp, #4
	str r0, [r4, #4]
	str r6, [r4, #0x20]
	ldr r0, [sp]
	str r7, [r4, #0x10]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x20]
	str r0, [r4, #0x18]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x1c]
	ldr r0, [r5, #8]
	adds r0, #0x3c
	str r0, [r4, #0x24]
	adds r0, r5, #0
	adds r0, #0x30
	str r0, [r4, #0x28]
	ldr r0, [r5, #0x10]
	bl ov41_02249B44
	ldr r1, [r4, #0x10]
	ldr r0, [sp, #8]
	subs r0, r1, r0
	adds r1, r6, #0
	blx FUN_020F2998
	str r0, [r4, #8]
	ldr r1, [r4, #0x14]
	ldr r0, [sp, #4]
	subs r0, r1, r0
	adds r1, r6, #0
	blx FUN_020F2998
	str r0, [r4, #0xc]
	movs r0, #0
	str r0, [r5, #0x30]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022494F0: .4byte ov41_022494F4
	thumb_func_end ov41_02249480

	thumb_func_start ov41_022494F4
ov41_022494F4: @ 0x022494F4
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x24]
	ldr r0, [r0]
	cmp r0, #1
	beq _0224956E
	ldr r0, [r4, #4]
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02249B44
	ldr r1, [sp, #4]
	ldr r0, [r4, #8]
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r1, [sp]
	ldr r0, [r4, #0xc]
	adds r0, r1, r0
	str r0, [sp]
	ldr r0, [r4, #0x20]
	subs r0, r0, #1
	str r0, [r4, #0x20]
	bmi _02249532
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _02249564
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _02249564
_02249532:
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x14]
	bl ov41_02249AF4
	ldr r0, [r4]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x1c]
	ldr r3, [r4, #4]
	bl ov41_022486C4
	ldr r0, [r4]
	bl ov41_02248724
	ldr r0, [r4, #0x28]
	ldr r0, [r0]
	cmp r0, #0
	bne _0224955A
	bl ov41_022463FC
_0224955A:
	adds r0, r5, #0
	bl FUN_02007234
	add sp, #8
	pop {r3, r4, r5, pc}
_02249564:
	ldr r0, [r4, #4]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov41_02249AF4
_0224956E:
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_022494F4

	thumb_func_start ov41_02249574
ov41_02249574: @ 0x02249574
	push {r3, lr}
	ldr r3, [r0, #0x10]
	ldr r1, [r3, #4]
	cmp r1, #0
	bne _0224958E
	ldr r3, [r3]
	ldr r0, [r0, #0xc]
	ldr r3, [r3]
	movs r1, #0x1b
	movs r2, #0xd8
	bl ov41_0224AC08
	pop {r3, pc}
_0224958E:
	cmp r1, #1
	bne _022495A0
	ldr r3, [r3]
	ldr r0, [r0, #0xc]
	ldr r3, [r3]
	movs r1, #0x1b
	movs r2, #0xda
	bl ov41_0224AC08
_022495A0:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov41_02249574

	thumb_func_start ov41_022495A4
ov41_022495A4: @ 0x022495A4
	push {r4, r5, r6, lr}
	ldr r4, [r0]
	adds r5, r1, #0
	ldr r0, [r4, #0x10]
	adds r6, r2, #0
	bl ov41_02249AF4
	ldr r1, [r4, #0x24]
	ldr r2, [r4, #0x28]
	ldr r0, [r4, #4]
	subs r1, r5, r1
	subs r2, r6, r2
	bl ov41_02248114
	str r5, [r4, #0x24]
	str r6, [r4, #0x28]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_022495A4

	thumb_func_start ov41_022495C8
ov41_022495C8: @ 0x022495C8
	push {r3, r4, r5, lr}
	movs r2, #0
	adds r4, r1, #0
	str r2, [sp]
	adds r5, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	movs r3, #0xe
	bl FUN_02007A44
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x76
	bl ov41_022463DC
	ldrh r1, [r4]
	ldr r0, [r0, #0x14]
	bl FUN_02009D28
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_022495C8

	thumb_func_start ov41_022495F0
ov41_022495F0: @ 0x022495F0
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	bl ov41_02249604
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov41_022495F0

	thumb_func_start ov41_02249604
ov41_02249604: @ 0x02249604
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r6, r2, #0
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r3, #0
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	bl FUN_02070130
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0xc0
	movs r3, #0x38
	bl FUN_020085EC
	str r0, [r5]
	adds r0, r5, #0
	add r1, sp, #0x1c
	add r2, sp, #0x18
	bl ov41_022497A0
	ldr r1, [sp, #0x1c]
	movs r2, #0x38
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	ldr r1, [sp, #0x18]
	str r0, [sp, #0x1c]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [sp, #0x18]
	subs r0, r2, r0
	strb r0, [r5, #4]
	ldr r0, [sp, #0x18]
	movs r1, #0xc0
	adds r0, #0x38
	strb r0, [r5, #5]
	ldr r0, [sp, #0x1c]
	subs r0, r1, r0
	strb r0, [r5, #6]
	ldr r0, [sp, #0x1c]
	adds r0, #0xc0
	strb r0, [r5, #7]
	ldr r0, [sp, #0x18]
	str r0, [sp]
	ldr r3, [sp, #0x1c]
	adds r0, r5, #4
	bl ov41_02249978
	adds r0, r6, #0
	movs r1, #2
	bl FUN_02070848
	movs r2, #0
	str r2, [sp]
	adds r7, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	ldr r3, [sp, #0x38]
	bl FUN_02007A44
	add r1, sp, #0x14
	str r0, [sp, #0x10]
	blx FUN_020B70A8
	ldr r0, [sp, #0x14]
	ldrh r1, [r4]
	ldr r0, [r0, #0x14]
	bl FUN_02009D28
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _022496C6
	ldr r2, [sp, #0x14]
	adds r3, r5, #0
	ldrh r1, [r2, #2]
	ldr r0, [r2, #0x14]
	ldrh r2, [r2]
	lsls r1, r1, #3
	adds r3, #8
	lsls r2, r2, #3
	bl ov41_022498E8
	b _022496DC
_022496C6:
	ldr r1, [sp, #0x14]
	ldr r0, [r1, #0x14]
	ldrh r1, [r1, #2]
	lsls r1, r1, #3
	bl ov41_0224989C
	strb r0, [r5, #8]
	ldrb r0, [r5, #8]
	strb r0, [r5, #9]
	strb r7, [r5, #0xb]
	strb r7, [r5, #0xa]
_022496DC:
	ldr r0, [sp, #0x10]
	bl FUN_0201AB0C
	str r6, [r5, #0xc]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02249604

	thumb_func_start ov41_022496E8
ov41_022496E8: @ 0x022496E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_02008780
	movs r1, #0x10
	movs r0, #0
_022496F6:
	strb r0, [r4]
	adds r4, r4, #1
	subs r1, r1, #1
	bne _022496F6
	pop {r4, pc}
	thumb_func_end ov41_022496E8

	thumb_func_start ov41_02249700
ov41_02249700: @ 0x02249700
	ldr r3, _0224970C @ =FUN_020087A4
	adds r2, r1, #0
	ldr r0, [r0]
	movs r1, #2
	bx r3
	nop
_0224970C: .4byte FUN_020087A4
	thumb_func_end ov41_02249700

	thumb_func_start ov41_02249710
ov41_02249710: @ 0x02249710
	ldr r3, _02249718 @ =FUN_02008A78
	ldr r0, [r0]
	movs r1, #2
	bx r3
	.align 2, 0
_02249718: .4byte FUN_02008A78
	thumb_func_end ov41_02249710

	thumb_func_start ov41_0224971C
ov41_0224971C: @ 0x0224971C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r6, r2, #0
	adds r5, r0, #0
	add r1, sp, #8
	add r2, sp, #4
	bl ov41_022497A0
	ldr r0, [r5]
	movs r1, #0
	adds r2, r4, #0
	bl FUN_020087A4
	ldr r0, [r5]
	movs r1, #1
	adds r2, r6, #0
	bl FUN_020087A4
	ldr r1, [sp, #4]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r2, r0, #1
	ldr r1, [sp, #8]
	str r2, [sp, #4]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [sp, #8]
	str r2, [sp]
	ldr r3, [sp, #8]
	adds r0, r5, #4
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov41_02249978
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov41_0224971C

	thumb_func_start ov41_02249768
ov41_02249768: @ 0x02249768
	ldr r3, _02249770 @ =FUN_020252F4
	adds r0, r0, #4
	bx r3
	nop
_02249770: .4byte FUN_020252F4
	thumb_func_end ov41_02249768

	thumb_func_start ov41_02249774
ov41_02249774: @ 0x02249774
	ldr r3, _0224977C @ =FUN_020253F0
	adds r0, r0, #4
	bx r3
	nop
_0224977C: .4byte FUN_020253F0
	thumb_func_end ov41_02249774

	thumb_func_start ov41_02249780
ov41_02249780: @ 0x02249780
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	movs r1, #0
	adds r6, r2, #0
	bl FUN_02008A78
	str r0, [r4]
	ldr r0, [r5]
	movs r1, #1
	bl FUN_02008A78
	str r0, [r6]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_02249780

	thumb_func_start ov41_022497A0
ov41_022497A0: @ 0x022497A0
	movs r0, #0x50
	str r0, [r1]
	str r0, [r2]
	bx lr
	thumb_func_end ov41_022497A0

	thumb_func_start ov41_022497A8
ov41_022497A8: @ 0x022497A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov41_02249768
	cmp r0, #0
	bne _022497C2
	add sp, #0x10
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022497C2:
	adds r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02249780
	adds r0, r5, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov41_022497A0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #4]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	subs r1, r2, r0
	ldr r3, [sp, #8]
	ldr r0, [sp]
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	asrs r2, r2, #1
	subs r0, r0, r2
	str r0, [sp]
	ldr r0, _0224981C @ =0x021D114C
	str r1, [sp, #4]
	ldrh r2, [r0, #0x20]
	movs r3, #0
	subs r1, r2, r1
	str r1, [r4]
	ldrh r1, [r0, #0x22]
	ldr r0, [sp]
	subs r2, r1, r0
	str r2, [r6]
	ldr r1, [r4]
	adds r0, r7, #0
	bl ov41_022464BC
	cmp r0, #0
	bne _02249816
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02249816:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224981C: .4byte 0x021D114C
	thumb_func_end ov41_022497A8

	thumb_func_start ov41_02249820
ov41_02249820: @ 0x02249820
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov41_02249774
	cmp r0, #0
	bne _0224983A
	add sp, #0x10
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224983A:
	adds r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02249780
	adds r0, r5, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov41_022497A0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #4]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	subs r1, r2, r0
	ldr r3, [sp, #8]
	str r1, [sp, #4]
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	ldr r0, [sp]
	asrs r2, r2, #1
	subs r0, r0, r2
	str r0, [sp]
	subs r2, r6, r0
	subs r1, r4, r1
	adds r0, r7, #0
	movs r3, #0
	bl ov41_022464BC
	cmp r0, #0
	bne _02249880
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02249880:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_02249820

	thumb_func_start ov41_02249888
ov41_02249888: @ 0x02249888
	ldrb r2, [r0, #8]
	strb r2, [r1]
	ldrb r2, [r0, #9]
	strb r2, [r1, #1]
	ldrb r2, [r0, #0xa]
	strb r2, [r1, #2]
	ldrb r0, [r0, #0xb]
	strb r0, [r1, #3]
	bx lr
	.align 2, 0
	thumb_func_end ov41_02249888

	thumb_func_start ov41_0224989C
ov41_0224989C: @ 0x0224989C
	push {r4, r5, r6, r7}
	mov ip, r0
	adds r7, r1, #0
	movs r2, #0
_022498A4:
	movs r3, #0
	adds r4, r3, #0
_022498A8:
	adds r1, r2, r4
	lsrs r0, r1, #0x1f
	lsls r6, r1, #0x1f
	subs r6, r6, r0
	movs r5, #0x1f
	rors r6, r5
	adds r5, r0, r6
	lsls r6, r5, #2
	movs r5, #0xf
	adds r0, r1, r0
	lsls r5, r6
	asrs r1, r0, #1
	mov r0, ip
	lsls r5, r5, #0x18
	ldrsb r0, [r0, r1]
	lsrs r5, r5, #0x18
	tst r0, r5
	beq _022498D2
	adds r0, r2, #0
	pop {r4, r5, r6, r7}
	bx lr
_022498D2:
	adds r3, r3, #1
	adds r4, r4, r7
	cmp r3, #0x50
	blt _022498A8
	adds r2, r2, #1
	cmp r2, #0x50
	blt _022498A4
	movs r0, #0x50
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
	thumb_func_end ov41_0224989C

	thumb_func_start ov41_022498E8
ov41_022498E8: @ 0x022498E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	adds r1, r3, #0
	movs r0, #0x28
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	movs r6, #0
_022498FE:
	movs r2, #0x50
	subs r2, r2, r6
	str r2, [sp, #8]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	mov lr, r2
	ldr r2, [sp, #8]
	movs r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r5, r0, #0
	mov ip, r2
_02249916:
	adds r7, r6, r5
	lsrs r3, r7, #0x1f
	lsls r4, r7, #0x1f
	subs r4, r4, r3
	movs r2, #0x1f
	rors r4, r2
	adds r2, r3, r4
	lsls r4, r2, #2
	movs r2, #0xf
	lsls r2, r4
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	adds r3, r7, r3
	ldr r2, [sp]
	asrs r3, r3, #1
	ldrsb r2, [r2, r3]
	tst r2, r4
	beq _02249964
	ldrb r2, [r1]
	cmp r2, r6
	ble _02249944
	mov r2, lr
	strb r2, [r1]
_02249944:
	ldrb r3, [r1, #1]
	ldr r2, [sp, #8]
	cmp r3, r2
	ble _02249950
	mov r2, ip
	strb r2, [r1, #1]
_02249950:
	ldrb r2, [r1, #2]
	cmp r2, r0
	ble _02249958
	strb r0, [r1, #2]
_02249958:
	movs r2, #0x50
	subs r3, r2, r0
	ldrb r2, [r1, #3]
	cmp r2, r3
	ble _02249964
	strb r3, [r1, #3]
_02249964:
	ldr r2, [sp, #4]
	adds r0, r0, #1
	adds r5, r5, r2
	cmp r0, #0x50
	blt _02249916
	adds r6, r6, #1
	cmp r6, #0x50
	blt _022498FE
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_022498E8

	thumb_func_start ov41_02249978
ov41_02249978: @ 0x02249978
	push {r3, r4}
	ldr r4, [sp, #8]
	subs r4, r2, r4
	bmi _02249982
	b _02249984
_02249982:
	movs r4, #0
_02249984:
	strb r4, [r0]
	ldr r4, [sp, #8]
	adds r2, r2, r4
	cmp r2, #0xbf
	bgt _02249990
	b _02249992
_02249990:
	movs r2, #0xbf
_02249992:
	strb r2, [r0, #1]
	subs r2, r1, r3
	bmi _0224999A
	b _0224999C
_0224999A:
	movs r2, #0
_0224999C:
	adds r1, r1, r3
	strb r2, [r0, #2]
	cmp r1, #0xff
	bgt _022499AA
	strb r1, [r0, #3]
	pop {r3, r4}
	bx lr
_022499AA:
	movs r1, #0xff
	strb r1, [r0, #3]
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov41_02249978

	thumb_func_start ov41_022499B4
ov41_022499B4: @ 0x022499B4
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	lsls r4, r6, #4
	adds r5, r0, #0
	adds r0, r2, #0
	adds r1, r4, #0
	bl FUN_0201AA8C
	str r0, [r5]
	cmp r0, #0
	bne _022499CE
	bl GF_AssertFail
_022499CE:
	ldr r0, [r5]
	movs r1, #0
	adds r2, r4, #0
	blx FUN_020E5B44
	str r6, [r5, #4]
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_022499B4

	thumb_func_start ov41_022499DC
ov41_022499DC: @ 0x022499DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_022499DC

	thumb_func_start ov41_022499F0
ov41_022499F0: @ 0x022499F0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r0, #0
	bne _02249A02
	bl GF_AssertFail
_02249A02:
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02249A0C
	bl GF_AssertFail
_02249A0C:
	ldr r2, [r5, #4]
	movs r4, #0
	cmp r2, #0
	ble _02249A24
	ldr r1, [r5]
_02249A16:
	ldr r0, [r1]
	cmp r0, #0
	beq _02249A24
	adds r4, r4, #1
	adds r1, #0x10
	cmp r4, r2
	blt _02249A16
_02249A24:
	cmp r2, r4
	bgt _02249A2C
	bl GF_AssertFail
_02249A2C:
	ldr r0, [r5]
	lsls r1, r4, #4
	str r6, [r0, r1]
	ldr r0, [r5]
	adds r0, r0, r1
	str r7, [r0, #4]
	ldr r0, [r5]
	adds r0, r0, r1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_022499F0

	thumb_func_start ov41_02249A40
ov41_02249A40: @ 0x02249A40
	movs r2, #0x10
	movs r1, #0
_02249A44:
	strb r1, [r0]
	adds r0, r0, #1
	subs r2, r2, #1
	bne _02249A44
	bx lr
	.align 2, 0
	thumb_func_end ov41_02249A40

	thumb_func_start ov41_02249A50
ov41_02249A50: @ 0x02249A50
	ldr r2, [r1, #8]
	str r2, [r0, #8]
	ldr r2, [r1, #8]
	str r0, [r2, #0xc]
	str r1, [r0, #0xc]
	str r0, [r1, #8]
	bx lr
	.align 2, 0
	thumb_func_end ov41_02249A50

	thumb_func_start ov41_02249A60
ov41_02249A60: @ 0x02249A60
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	str r2, [r1, #8]
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
	thumb_func_end ov41_02249A60

	thumb_func_start ov41_02249A70
ov41_02249A70: @ 0x02249A70
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, [r6, #8]
	cmp r4, r6
	beq _02249A8E
_02249A7A:
	adds r0, r4, #0
	ldr r5, [r4, #8]
	bl ov41_02249A60
	adds r0, r4, #0
	bl ov41_02249A40
	adds r4, r5, #0
	cmp r5, r6
	bne _02249A7A
_02249A8E:
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_02249A70

	thumb_func_start ov41_02249A90
ov41_02249A90: @ 0x02249A90
	push {r3, lr}
	ldr r2, [r0, #4]
	ldr r0, [r0]
	cmp r2, #3
	bge _02249AA0
	bl ov41_02246014
	pop {r3, pc}
_02249AA0:
	bl ov41_02249700
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov41_02249A90

	thumb_func_start ov41_02249AA8
ov41_02249AA8: @ 0x02249AA8
	push {r4, lr}
	ldr r4, [r0, #4]
	cmp r4, #0
	bne _02249ABE
	ldr r0, [r0]
	ldr r4, [r0]
	lsls r4, r4, #2
	ldr r3, [r3, r4]
	bl ov41_02245F14
	pop {r4, pc}
_02249ABE:
	cmp r4, #1
	bne _02249AD2
	ldr r0, [r0]
	ldr r4, [r0]
	adds r4, #0x64
	lsls r4, r4, #2
	ldr r3, [r3, r4]
	bl ov41_02245F14
	pop {r4, pc}
_02249AD2:
	cmp r4, #2
	ldr r0, [r0]
	bne _02249AE6
	ldr r4, [r0]
	adds r4, #0x64
	lsls r4, r4, #2
	ldr r3, [r3, r4]
	bl ov41_02245F14
	pop {r4, pc}
_02249AE6:
	movs r4, #0x76
	lsls r4, r4, #2
	ldr r3, [r3, r4]
	bl ov41_022497A8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_02249AA8

	thumb_func_start ov41_02249AF4
ov41_02249AF4: @ 0x02249AF4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r1, #0
	ldr r1, [r0, #4]
	adds r4, r2, #0
	cmp r1, #3
	bge _02249B14
	lsls r1, r5, #0x10
	lsls r2, r4, #0x10
	ldr r0, [r0]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov41_02245F9C
	add sp, #8
	pop {r4, r5, r6, pc}
_02249B14:
	ldr r6, [r0]
	add r1, sp, #4
	adds r0, r6, #0
	add r2, sp, #0
	bl ov41_022497A0
	ldr r1, [sp, #4]
	ldr r2, [sp]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r1, r0, #1
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r2, r0, #1
	str r1, [sp, #4]
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r5, r1
	adds r2, r4, r2
	bl ov41_0224971C
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_02249AF4

	thumb_func_start ov41_02249B44
ov41_02249B44: @ 0x02249B44
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r3, [r0, #4]
	adds r5, r1, #0
	adds r4, r2, #0
	cmp r3, #3
	bge _02249B5C
	ldr r0, [r0]
	bl ov41_02245FA8
	add sp, #8
	pop {r4, r5, r6, pc}
_02249B5C:
	ldr r6, [r0]
	adds r0, r6, #0
	bl ov41_02249780
	adds r0, r6, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_022497A0
	ldr r1, [sp, #4]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r2, r0, #1
	ldr r1, [sp]
	str r2, [sp, #4]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [sp]
	ldr r0, [r5]
	subs r0, r0, r2
	str r0, [r5]
	ldr r1, [r4]
	ldr r0, [sp]
	subs r0, r1, r0
	str r0, [r4]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_02249B44

	thumb_func_start ov41_02249B94
ov41_02249B94: @ 0x02249B94
	push {r3, lr}
	ldr r3, [r0, #4]
	ldr r0, [r0]
	cmp r3, #3
	bge _02249BA4
	bl ov41_02245FD8
	pop {r3, pc}
_02249BA4:
	bl ov41_022497A0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov41_02249B94

	thumb_func_start ov41_02249BAC
ov41_02249BAC: @ 0x02249BAC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r2, #0
	ldr r2, [r0, #4]
	adds r6, r1, #0
	adds r5, r3, #0
	ldr r4, [sp, #0x18]
	cmp r2, #3
	ldr r0, [r0]
	bge _02249BCE
	adds r2, r5, #0
	bl ov41_02246020
	ldr r0, [r6]
	str r0, [r7]
	ldr r0, [r5]
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02249BCE:
	add r1, sp, #0
	bl ov41_02249888
	add r0, sp, #0
	ldrb r1, [r0]
	str r1, [r6]
	ldrb r1, [r0, #1]
	str r1, [r7]
	ldrb r1, [r0, #2]
	str r1, [r5]
	ldrb r0, [r0, #3]
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02249BAC

	thumb_func_start ov41_02249BE8
ov41_02249BE8: @ 0x02249BE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, [r5, #8]
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r4, r5
	beq _02249C1A
_02249BF8:
	adds r0, r4, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02249B44
	ldr r0, [sp, #4]
	adds r1, r0, r6
	ldr r0, [sp]
	str r1, [sp, #4]
	adds r2, r0, r7
	str r2, [sp]
	adds r0, r4, #0
	bl ov41_02249AF4
	ldr r4, [r4, #8]
	cmp r4, r5
	bne _02249BF8
_02249C1A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_02249BE8

	thumb_func_start ov41_02249C20
ov41_02249C20: @ 0x02249C20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r4, r1, #0
	adds r6, r2, #0
	adds r5, r0, #0
	add r1, sp, #0x20
	add r2, sp, #0x1c
	adds r7, r3, #0
	bl ov41_02249B94
	adds r0, r5, #0
	add r1, sp, #0x18
	add r2, sp, #0x14
	bl ov41_02249B44
	add r0, sp, #4
	str r0, [sp]
	adds r0, r5, #0
	add r1, sp, #0x10
	add r2, sp, #8
	add r3, sp, #0xc
	bl ov41_02249BAC
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	adds r0, r1, r0
	str r0, [r4]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	adds r1, r1, r0
	ldr r0, [sp, #4]
	subs r0, r1, r0
	str r0, [r6]
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x10]
	adds r0, r1, r0
	str r0, [r7]
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x20]
	adds r1, r1, r0
	ldr r0, [sp, #8]
	subs r1, r1, r0
	ldr r0, [sp, #0x38]
	str r1, [r0]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_02249C20

	thumb_func_start ov41_02249C7C
ov41_02249C7C: @ 0x02249C7C
	adds r2, r0, #0
	ldr r0, [r1]
	str r0, [r2]
	ldr r3, [r1, #0x14]
	asrs r0, r3, #2
	lsrs r0, r0, #0x1d
	adds r0, r3, r0
	asrs r0, r0, #3
	str r0, [r2, #0xc]
	ldr r3, [r1, #0x18]
	asrs r0, r3, #2
	lsrs r0, r0, #0x1d
	adds r0, r3, r0
	asrs r0, r0, #3
	str r0, [r2, #0x10]
	ldr r0, [r1, #0x1c]
	ldr r3, _02249CC0 @ =ov41_02249E60
	str r0, [r2, #0x1c]
	ldr r0, [r1, #0x24]
	str r0, [r2, #0x20]
	ldr r0, [r1, #0x20]
	str r0, [r2, #0x24]
	ldr r0, [r1, #0x28]
	str r0, [r2, #0x28]
	ldr r0, [r1, #4]
	str r0, [r2, #4]
	ldr r0, [r1, #0x10]
	str r0, [r2, #8]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r1, #0x14
	adds r2, #0x18
	bx r3
	nop
_02249CC0: .4byte ov41_02249E60
	thumb_func_end ov41_02249C7C

	thumb_func_start ov41_02249CC4
ov41_02249CC4: @ 0x02249CC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x1c]
	ldr r0, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x2c
	blx FUN_020E5B44
	pop {r4, pc}
	thumb_func_end ov41_02249CC4

	thumb_func_start ov41_02249CE0
ov41_02249CE0: @ 0x02249CE0
	ldr r2, [r1]
	str r2, [r0]
	ldr r2, [r1, #4]
	str r2, [r0, #4]
	ldr r2, [r1, #8]
	str r2, [r0, #8]
	movs r2, #0
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
	ldr r1, [r1, #0xc]
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end ov41_02249CE0

	thumb_func_start ov41_02249CF8
ov41_02249CF8: @ 0x02249CF8
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r1, r0, r1
	str r1, [r5, #0xc]
	ldr r0, [r5, #8]
	cmp r1, r0
	ble _02249D5C
	movs r2, #0
	str r2, [r5, #0xc]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _02249D1C
	ldr r1, [r5, #4]
	movs r0, #1
	str r0, [r5, #0x10]
	b _02249D22
_02249D1C:
	ldr r0, [r5]
	ldr r1, [r0, #8]
	str r2, [r5, #0x10]
_02249D22:
	ldr r0, [r5, #0x14]
	movs r2, #0
	str r0, [sp]
	ldr r0, [r5]
	add r3, sp, #0x14
	ldr r0, [r0, #4]
	bl FUN_020079D8
	ldr r3, [r5]
	adds r4, r0, #0
	ldr r0, [r3, #0x18]
	str r0, [sp]
	ldr r0, [r3, #0xc]
	str r0, [sp, #4]
	ldr r0, [r3, #0x10]
	str r0, [sp, #8]
	ldr r0, [r3, #0x28]
	str r0, [sp, #0xc]
	ldr r0, [r3, #0x20]
	str r0, [sp, #0x10]
	ldr r0, [r3]
	ldr r1, [r3, #0x1c]
	ldr r2, [sp, #0x14]
	ldr r3, [r3, #0x14]
	bl ov41_02249F7C
	adds r0, r4, #0
	bl FUN_0201AB0C
_02249D5C:
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_02249CF8

	thumb_func_start ov41_02249D60
ov41_02249D60: @ 0x02249D60
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, [r5]
	ldr r0, [r5, #0x14]
	movs r2, #0
	str r0, [sp]
	ldr r0, [r1, #4]
	ldr r1, [r1, #8]
	add r3, sp, #0x14
	bl FUN_020079D8
	ldr r3, [r5]
	adds r4, r0, #0
	ldr r0, [r3, #0x18]
	str r0, [sp]
	ldr r0, [r3, #0xc]
	str r0, [sp, #4]
	ldr r0, [r3, #0x10]
	str r0, [sp, #8]
	ldr r0, [r3, #0x28]
	str r0, [sp, #0xc]
	ldr r0, [r3, #0x20]
	str r0, [sp, #0x10]
	ldr r0, [r3]
	ldr r1, [r3, #0x1c]
	ldr r2, [sp, #0x14]
	ldr r3, [r3, #0x14]
	bl ov41_02249F7C
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r1, #0x18
	movs r0, #0
_02249DA6:
	strb r0, [r5]
	adds r5, r5, #1
	subs r1, r1, #1
	bne _02249DA6
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_02249D60

	thumb_func_start ov41_02249DB4
ov41_02249DB4: @ 0x02249DB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	ldr r0, _02249E3C @ =ov41_02249F0C
	movs r1, #0x4c
	movs r2, #0
	movs r3, #0xd
	bl FUN_02007200
	bl FUN_0201F988
	adds r4, r0, #0
	str r6, [r4]
	adds r7, r5, #0
	adds r3, r4, #4
	movs r2, #6
_02249DDA:
	ldm r7!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02249DDA
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x20]
	str r0, [r4, #0x34]
	ldr r0, [sp]
	str r1, [r4, #0x38]
	blx FUN_020F2998
	str r0, [r4, #0x3c]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x20]
	blx FUN_020F2998
	str r0, [r4, #0x40]
	ldr r0, [r6]
	ldr r1, [r6, #0x1c]
	bl FUN_0201BDF4
	str r0, [r4, #0x44]
	ldr r0, [r6]
	ldr r1, [r6, #0x1c]
	bl FUN_0201BE00
	str r0, [r4, #0x48]
	movs r0, #0x80
	str r0, [r5, #0x28]
	movs r0, #5
	str r0, [r5, #0x24]
	ldr r1, [r5, #0x14]
	ldr r0, [sp]
	subs r0, r1, r0
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r0, [sp, #4]
	subs r0, r1, r0
	str r0, [r5, #0x18]
	movs r0, #0xe
	movs r1, #0
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov41_02249E60
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02249E3C: .4byte ov41_02249F0C
	thumb_func_end ov41_02249DB4

	thumb_func_start ov41_02249E40
ov41_02249E40: @ 0x02249E40
	push {r3, r4}
	ldr r2, [r0, #8]
	adds r0, #0xc
	lsrs r4, r2, #1
	movs r3, #0
	cmp r4, #0
	ble _02249E5C
_02249E4E:
	ldrh r2, [r0]
	adds r3, r3, #1
	adds r2, r2, r1
	strh r2, [r0]
	adds r0, r0, #2
	cmp r3, r4
	blt _02249E4E
_02249E5C:
	pop {r3, r4}
	bx lr
	thumb_func_end ov41_02249E40

	thumb_func_start ov41_02249E60
ov41_02249E60: @ 0x02249E60
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0x14]
	adds r6, r2, #0
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	ldr r1, [r5, #0x18]
	str r0, [sp, #0x18]
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x28]
	str r0, [sp]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [r5]
	ldr r3, [r5, #0x1c]
	bl ov41_02249FFC
	ldr r0, [r5, #0x1c]
	cmp r0, #4
	bge _02249EA0
	movs r2, #0
	b _02249EA2
_02249EA0:
	movs r2, #4
_02249EA2:
	ldr r0, [r5, #0x20]
	lsls r0, r0, #5
	str r0, [sp]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #4]
	ldr r3, [r5, #0x24]
	ldr r0, [r5, #4]
	ldr r1, [r5, #0xc]
	lsls r3, r3, #5
	bl ov41_0224A04C
	ldr r0, [r5, #0x2c]
	movs r2, #0
	str r0, [sp]
	ldr r0, [r5, #4]
	ldr r1, [r5, #0x10]
	add r3, sp, #0x24
	bl FUN_020079D8
	ldr r2, [sp, #0x24]
	str r0, [sp, #0x20]
	ldrh r0, [r2]
	lsrs r7, r0, #3
	ldrh r0, [r2, #2]
	adds r3, r7, #0
	lsrs r0, r0, #3
	str r0, [sp, #0x1c]
	str r0, [sp]
	ldr r0, [sp, #0x18]
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	str r0, [sp, #8]
	ldr r0, [r5, #0x28]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x24]
	str r0, [sp, #0x10]
	ldr r0, [r5]
	ldr r1, [r5, #0x1c]
	bl ov41_02249F7C
	ldr r0, [sp, #0x20]
	bl FUN_0201AB0C
	cmp r4, #0
	beq _02249EFE
	str r7, [r4]
_02249EFE:
	cmp r6, #0
	beq _02249F06
	ldr r0, [sp, #0x1c]
	str r0, [r6]
_02249F06:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_02249E60

	thumb_func_start ov41_02249F0C
ov41_02249F0C: @ 0x02249F0C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, r0, #1
	str r0, [r4, #0x38]
	ldr r1, [r4]
	bmi _02249F40
	ldr r0, [r1]
	ldr r1, [r1, #0x1c]
	ldr r3, [r4, #0x3c]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #2
	bl FUN_0201F238
	ldr r1, [r4]
	ldr r3, [r4, #0x40]
	ldr r0, [r1]
	ldr r1, [r1, #0x1c]
	movs r2, #5
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201F238
	pop {r3, r4, r5, pc}
_02249F40:
	ldr r0, [r1]
	ldr r1, [r1, #0x1c]
	ldr r3, [r4, #0x44]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0
	bl FUN_0201F238
	ldr r1, [r4]
	ldr r3, [r4, #0x48]
	ldr r0, [r1]
	ldr r1, [r1, #0x1c]
	movs r2, #3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201F238
	ldr r0, [r4]
	adds r1, r4, #4
	bl ov41_02249C7C
	ldr r1, [r4, #0x34]
	cmp r1, #0
	beq _02249F74
	movs r0, #1
	str r0, [r1]
_02249F74:
	adds r0, r5, #0
	bl FUN_02007234
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_02249F0C

	thumb_func_start ov41_02249F7C
ov41_02249F7C: @ 0x02249F7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r1, #0
	adds r4, r2, #0
	adds r7, r0, #0
	ldr r1, [sp, #0x3c]
	adds r0, r4, #0
	adds r6, r3, #0
	bl ov41_02249E40
	ldr r1, [sp, #0x30]
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	str r0, [sp]
	ldr r3, [sp, #0x38]
	str r2, [sp, #4]
	adds r4, #0xc
	lsls r3, r3, #0x18
	str r4, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r2, [sp, #0x34]
	lsls r1, r5, #0x18
	lsls r2, r2, #0x18
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201C4EC
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	ldr r3, [sp, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r5, #0x18
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	str r0, [sp, #8]
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201CA4C
	lsls r1, r5, #0x18
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_02249F7C

	thumb_func_start ov41_02249FFC
ov41_02249FFC: @ 0x02249FFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	str r1, [sp, #4]
	ldr r0, [sp, #0x24]
	movs r1, #0x14
	adds r5, r2, #0
	adds r6, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #0x14
	movs r0, #0
_0224A018:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0224A018
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #4]
	str r0, [sp]
	adds r0, r7, #0
	movs r2, #0
	adds r3, r4, #4
	bl FUN_020079BC
	str r0, [r4, #8]
	str r5, [r4]
	ldr r0, [sp, #0x20]
	str r6, [r4, #0xc]
	str r0, [r4, #0x10]
	ldr r0, _0224A048 @ =ov41_0224A094
	adds r1, r4, #0
	movs r2, #0x80
	bl FUN_0200E374
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224A048: .4byte ov41_0224A094
	thumb_func_end ov41_02249FFC

	thumb_func_start ov41_0224A04C
ov41_0224A04C: @ 0x0224A04C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	str r1, [sp]
	ldr r0, [sp, #0x1c]
	movs r1, #0x14
	adds r5, r2, #0
	adds r6, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #0x14
	movs r0, #0
_0224A066:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0224A066
	ldr r1, [sp]
	ldr r3, [sp, #0x1c]
	adds r0, r7, #0
	adds r2, r4, #0
	bl FUN_020079F4
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [sp, #0x18]
	str r6, [r4, #0xc]
	str r0, [r4, #0x10]
	ldr r0, _0224A090 @ =ov41_0224A0D0
	adds r1, r4, #0
	movs r2, #0x80
	bl FUN_0200E374
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224A090: .4byte ov41_0224A0D0
	thumb_func_end ov41_0224A04C

	thumb_func_start ov41_0224A094
ov41_0224A094: @ 0x0224A094
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, [r4, #4]
	adds r5, r0, #0
	ldr r0, [r1, #0x14]
	ldr r1, [r1, #0x10]
	blx FUN_020D2894
	ldr r3, [r4, #4]
	ldr r0, [r4, #0x10]
	str r0, [sp]
	ldr r1, [r4, #0xc]
	ldr r2, [r3, #0x14]
	lsls r1, r1, #0x18
	ldr r0, [r4]
	ldr r3, [r3, #0x10]
	lsrs r1, r1, #0x18
	bl FUN_0201C0C0
	adds r0, r5, #0
	bl FUN_0200E390
	ldr r0, [r4, #8]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_0224A094

	thumb_func_start ov41_0224A0D0
ov41_0224A0D0: @ 0x0224A0D0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	ldr r0, [r0, #0xc]
	blx FUN_020D2894
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0224A0F4
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	ldr r0, [r0, #0xc]
	ldr r2, [r4, #0x10]
	blx FUN_020CFC6C
	b _0224A104
_0224A0F4:
	cmp r0, #4
	bne _0224A104
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	ldr r0, [r0, #0xc]
	ldr r2, [r4, #0x10]
	blx FUN_020CFCC0
_0224A104:
	adds r0, r5, #0
	bl FUN_0200E390
	ldr r0, [r4, #4]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224A0D0

	thumb_func_start ov41_0224A118
ov41_0224A118: @ 0x0224A118
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _0224A126
	bl GF_AssertFail
_0224A126:
	cmp r4, #0
	bne _0224A12E
	bl GF_AssertFail
_0224A12E:
	ldr r0, [r4]
	bl FUN_02024624
	str r0, [r5]
	cmp r0, #0
	bne _0224A13E
	bl GF_AssertFail
_0224A13E:
	ldr r0, [r4, #0xc]
	str r0, [r5, #4]
	ldr r0, [r4, #8]
	str r0, [r5, #8]
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0224A150
	str r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
_0224A150:
	ldr r0, _0224A158 @ =ov41_0224A254
	str r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
	nop
_0224A158: .4byte ov41_0224A254
	thumb_func_end ov41_0224A118

	thumb_func_start ov41_0224A15C
ov41_0224A15C: @ 0x0224A15C
	push {r3, r4, r5, lr}
	sub sp, #0x30
	adds r4, r1, #0
	adds r5, r0, #0
	bl ov41_0224A118
	ldr r0, [r4, #0x14]
	str r0, [sp]
	ldr r0, [r4, #0x10]
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [r4, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [r5]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x24]
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x1c]
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x20]
	str r0, [sp, #0x1c]
	movs r0, #0
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	ldr r0, [r4]
	ldr r0, [r0, #0x28]
	str r0, [sp, #0x28]
	ldr r0, [r4]
	ldr r0, [r0, #0x2c]
	str r0, [sp, #0x2c]
	add r0, sp, #0
	bl FUN_020135D8
	str r0, [r5, #0x10]
	add sp, #0x30
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224A15C

	thumb_func_start ov41_0224A1A8
ov41_0224A1A8: @ 0x0224A1A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_02024758
	movs r1, #0x10
	movs r0, #0
_0224A1B6:
	strb r0, [r4]
	adds r4, r4, #1
	subs r1, r1, #1
	bne _0224A1B6
	pop {r4, pc}
	thumb_func_end ov41_0224A1A8

	thumb_func_start ov41_0224A1C0
ov41_0224A1C0: @ 0x0224A1C0
	push {r4, lr}
	adds r4, r0, #0
	bl ov41_0224A1A8
	ldr r0, [r4, #0x10]
	bl FUN_02013660
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020E5B44
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224A1C0

	thumb_func_start ov41_0224A1DC
ov41_0224A1DC: @ 0x0224A1DC
	push {r3, lr}
	ldr r2, [r0, #4]
	cmp r1, r2
	bne _0224A1EA
	ldr r1, [r0, #8]
	ldr r2, [r0, #0xc]
	blx r2
_0224A1EA:
	pop {r3, pc}
	thumb_func_end ov41_0224A1DC

	thumb_func_start ov41_0224A1EC
ov41_0224A1EC: @ 0x0224A1EC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	movs r4, #2
	adds r5, #0x20
_0224A1F8:
	cmp r4, r7
	beq _0224A204
	adds r0, r5, #0
	bl ov41_0224A264
	b _0224A228
_0224A204:
	cmp r6, #0
	bne _0224A216
	adds r0, r5, #0
	bl ov41_0224A270
	ldr r0, _0224A234 @ =0x0000067C
	bl FUN_0200604C
	b _0224A228
_0224A216:
	cmp r6, #2
	bne _0224A222
	adds r0, r5, #0
	bl ov41_0224A258
	b _0224A228
_0224A222:
	adds r0, r5, #0
	bl ov41_0224A270
_0224A228:
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	ble _0224A1F8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224A234: .4byte 0x0000067C
	thumb_func_end ov41_0224A1EC

	thumb_func_start ov41_0224A238
ov41_0224A238: @ 0x0224A238
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	bne _0224A24A
	bl GF_AssertFail
_0224A24A:
	str r7, [r5, #4]
	str r6, [r5, #8]
	str r4, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_0224A238

	thumb_func_start ov41_0224A254
ov41_0224A254: @ 0x0224A254
	bx lr
	.align 2, 0
	thumb_func_end ov41_0224A254

	thumb_func_start ov41_0224A258
ov41_0224A258: @ 0x0224A258
	ldr r3, _0224A260 @ =FUN_020249D4
	ldr r0, [r0]
	movs r1, #2
	bx r3
	.align 2, 0
_0224A260: .4byte FUN_020249D4
	thumb_func_end ov41_0224A258

	thumb_func_start ov41_0224A264
ov41_0224A264: @ 0x0224A264
	ldr r3, _0224A26C @ =FUN_020249D4
	ldr r0, [r0]
	movs r1, #0
	bx r3
	.align 2, 0
_0224A26C: .4byte FUN_020249D4
	thumb_func_end ov41_0224A264

	thumb_func_start ov41_0224A270
ov41_0224A270: @ 0x0224A270
	ldr r3, _0224A278 @ =FUN_020249D4
	ldr r0, [r0]
	movs r1, #1
	bx r3
	.align 2, 0
_0224A278: .4byte FUN_020249D4
	thumb_func_end ov41_0224A270

	thumb_func_start ov41_0224A27C
ov41_0224A27C: @ 0x0224A27C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r0, #0x80
	adds r4, r1, #0
	str r2, [r0]
	movs r0, #1
	movs r1, #0xd
	bl FUN_02013534
	str r0, [r5, #0x64]
	adds r0, r4, #0
	bl ov41_0224A7F8
	movs r0, #0x90
	str r0, [sp]
	movs r0, #0x28
	str r0, [sp, #4]
	movs r0, #0x20
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	movs r3, #0x30
	bl ov41_0224A6C4
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x6c
	movs r1, #0
	movs r2, #0x30
	movs r3, #0x98
	bl ov41_0224A7E0
	movs r0, #0x90
	str r0, [sp]
	movs r0, #0x28
	str r0, [sp, #4]
	movs r0, #0x20
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x10
	movs r1, #1
	adds r2, r4, #0
	movs r3, #8
	bl ov41_0224A6C4
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x6c
	movs r1, #1
	movs r2, #8
	movs r3, #0x98
	bl ov41_0224A7E0
	movs r0, #0x90
	str r0, [sp]
	movs r0, #0x28
	str r0, [sp, #4]
	movs r0, #0x2a
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #2
	adds r2, r4, #0
	movs r3, #0x60
	bl ov41_0224A6C4
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0x22
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x6c
	movs r1, #2
	movs r2, #0x60
	movs r3, #0x9c
	bl ov41_0224A7E0
	movs r0, #0x90
	str r0, [sp]
	movs r0, #0x28
	str r0, [sp, #4]
	movs r0, #0x2a
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #3
	adds r2, r4, #0
	movs r3, #0x88
	bl ov41_0224A6C4
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0x22
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x6c
	movs r1, #3
	movs r2, #0x88
	movs r3, #0x9c
	bl ov41_0224A7E0
	movs r0, #2
	movs r1, #0xe
	bl FUN_02002CEC
	movs r0, #9
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x1b
	movs r2, #0xd7
	movs r3, #0
	bl ov41_0224A928
	adds r6, r0, #0
	str r6, [sp]
	movs r0, #0xb8
	str r0, [sp, #4]
	movs r0, #0x90
	str r0, [sp, #8]
	movs r0, #0x48
	str r0, [sp, #0xc]
	movs r0, #0x2a
	str r0, [sp, #0x10]
	adds r0, r5, #0
	ldr r3, [r5, #0x64]
	adds r0, #0x40
	movs r1, #4
	adds r2, r4, #0
	bl ov41_0224A734
	movs r0, #0x48
	str r0, [sp]
	movs r0, #0x22
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x6c
	movs r1, #4
	movs r2, #0xb8
	movs r3, #0x9c
	bl ov41_0224A7E0
	adds r0, r6, #0
	bl ov41_0224A9B0
	movs r0, #2
	bl FUN_02002DB4
	movs r0, #1
	str r0, [r5, #0x60]
	adds r0, r4, #0
	bl ov41_0224A888
	adds r0, r5, #0
	adds r0, #0x20
	bl ov41_0224A258
	movs r0, #0xd
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0224A3E0 @ =ov41_0224A60C
	adds r0, #0x6c
	movs r1, #5
	adds r3, r5, #0
	bl FUN_02026C44
	str r0, [r5, #0x68]
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0224A3E0: .4byte ov41_0224A60C
	thumb_func_end ov41_0224A27C

	thumb_func_start ov41_0224A3E4
ov41_0224A3E4: @ 0x0224A3E4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r4, #0
_0224A3EC:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov41_02246388
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov41_0224639C
	adds r0, r4, #0
	bl FUN_02021884
	adds r4, r4, #1
	cmp r4, #5
	blt _0224A3EC
	movs r0, #0
	bl FUN_02022744
	movs r0, #1
	bl FUN_02022744
	movs r5, #0
	adds r4, r6, #0
_0224A418:
	adds r0, r4, #0
	bl ov41_0224A1A8
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #4
	blt _0224A418
	adds r0, r6, #0
	adds r0, #0x54
	bl FUN_02021B5C
	adds r0, r6, #0
	adds r0, #0x40
	bl ov41_0224A1C0
	ldr r0, [r6, #0x64]
	bl FUN_020135AC
	ldr r0, [r6, #0x68]
	bl FUN_02026CAC
	movs r0, #0
	str r0, [r6, #0x68]
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_0224A3E4

	thumb_func_start ov41_0224A448
ov41_0224A448: @ 0x0224A448
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x68]
	movs r4, #0xff
	cmp r0, #0
	bne _0224A458
	bl GF_AssertFail
_0224A458:
	adds r0, r5, #0
	adds r0, #0x84
	ldrh r0, [r0]
	cmp r0, #0
	beq _0224A48C
	adds r0, r5, #0
	adds r0, #0x84
	ldrh r0, [r0]
	subs r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x84
	strh r1, [r0]
	adds r1, r5, #0
	adds r1, #0x84
	ldrh r2, [r1]
	movs r1, #1
	adds r0, r5, #0
	eors r2, r1
	ldr r1, _0224A4E4 @ =0x0224C094
	adds r0, #0x86
	ldrb r1, [r1, r2]
	ldrh r0, [r0]
	adds r2, r5, #0
	bl ov41_0224A60C
	pop {r3, r4, r5, pc}
_0224A48C:
	ldr r0, _0224A4E8 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	adds r2, r1, #0
	tst r2, r0
	beq _0224A49C
	movs r4, #4
	b _0224A4C2
_0224A49C:
	movs r2, #0x40
	tst r2, r1
	beq _0224A4A6
	movs r4, #1
	b _0224A4C2
_0224A4A6:
	movs r2, #0x80
	tst r2, r1
	beq _0224A4B0
	movs r4, #0
	b _0224A4C2
_0224A4B0:
	movs r2, #0x20
	tst r2, r1
	beq _0224A4BA
	movs r4, #2
	b _0224A4C2
_0224A4BA:
	movs r2, #0x10
	tst r1, r2
	beq _0224A4C2
	adds r4, r0, #0
_0224A4C2:
	cmp r4, #0xff
	beq _0224A4E2
	adds r0, r5, #0
	adds r0, #0x86
	strh r4, [r0]
	adds r0, r5, #0
	movs r1, #2
	adds r0, #0x84
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x86
	ldrh r0, [r0]
	movs r1, #0
	adds r2, r5, #0
	bl ov41_0224A60C
_0224A4E2:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224A4E4: .4byte 0x0224C094
_0224A4E8: .4byte 0x021D110C
	thumb_func_end ov41_0224A448

	thumb_func_start ov41_0224A4EC
ov41_0224A4EC: @ 0x0224A4EC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x84
	ldrh r0, [r0]
	cmp r0, #0
	beq _0224A4FC
	movs r0, #0
	pop {r4, pc}
_0224A4FC:
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #1
	bne _0224A526
	bl FUN_0202534C
	cmp r0, #0
	beq _0224A514
	movs r0, #0
	pop {r4, pc}
_0224A514:
	ldr r0, _0224A548 @ =0x021D110C
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _0224A542
	adds r4, #0x80
	ldr r0, [r4]
	movs r1, #0
	str r1, [r0]
	b _0224A542
_0224A526:
	ldr r0, _0224A548 @ =0x021D110C
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _0224A532
	movs r0, #0
	pop {r4, pc}
_0224A532:
	bl FUN_0202534C
	cmp r0, #0
	beq _0224A542
	adds r4, #0x80
	ldr r0, [r4]
	movs r1, #1
	str r1, [r0]
_0224A542:
	movs r0, #0
	pop {r4, pc}
	nop
_0224A548: .4byte 0x021D110C
	thumb_func_end ov41_0224A4EC

	thumb_func_start ov41_0224A54C
ov41_0224A54C: @ 0x0224A54C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x68]
	cmp r0, #0
	bne _0224A55A
	bl GF_AssertFail
_0224A55A:
	adds r0, r4, #0
	bl ov41_0224A4EC
	cmp r0, #0
	bne _0224A57E
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	bne _0224A578
	adds r0, r4, #0
	bl ov41_0224A448
	pop {r4, pc}
_0224A578:
	ldr r0, [r4, #0x68]
	bl FUN_02026CC4
_0224A57E:
	pop {r4, pc}
	thumb_func_end ov41_0224A54C

	thumb_func_start ov41_0224A580
ov41_0224A580: @ 0x0224A580
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	movs r1, #3
	bl ov41_0224A8B0
	adds r0, r4, #0
	adds r0, #0x40
	movs r1, #3
	bl ov41_0224A8D4
	adds r0, r4, #0
	movs r1, #2
	movs r2, #3
	bl ov41_0224A1EC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224A580

	thumb_func_start ov41_0224A5A4
ov41_0224A5A4: @ 0x0224A5A4
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	adds r6, r1, #0
	adds r7, r2, #0
	movs r4, #0
	adds r5, r0, #0
_0224A5B0:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov41_0224A9BC
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #4
	blt _0224A5B0
	ldr r0, [sp]
	adds r1, r6, #0
	adds r0, #0x40
	adds r2, r7, #0
	str r0, [sp]
	bl ov41_0224A9F8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_0224A5A4

	thumb_func_start ov41_0224A5D4
ov41_0224A5D4: @ 0x0224A5D4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	bne _0224A5E6
	bl GF_AssertFail
_0224A5E6:
	cmp r4, #4
	bge _0224A5FA
	lsls r0, r4, #4
	ldr r3, [sp, #0x18]
	adds r0, r5, r0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov41_0224A238
	pop {r3, r4, r5, r6, r7, pc}
_0224A5FA:
	adds r5, #0x40
	ldr r3, [sp, #0x18]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov41_0224A238
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_0224A5D4

	thumb_func_start ov41_0224A60C
ov41_0224A60C: @ 0x0224A60C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	cmp r6, #4
	bhi _0224A6B8
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224A624: @ jump table
	.2byte _0224A62E - _0224A624 - 2 @ case 0
	.2byte _0224A64C - _0224A624 - 2 @ case 1
	.2byte _0224A670 - _0224A624 - 2 @ case 2
	.2byte _0224A670 - _0224A624 - 2 @ case 3
	.2byte _0224A686 - _0224A624 - 2 @ case 4
_0224A62E:
	adds r0, r4, #0
	bl ov41_0224A8B0
	movs r1, #0x1a
	adds r0, r4, #0
	lsls r1, r1, #6
	movs r2, #0
	adds r3, r5, #0
	bl ov41_0224A918
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov41_0224A1DC
	pop {r4, r5, r6, pc}
_0224A64C:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov41_0224A8B0
	adds r0, r4, #0
	movs r1, #0x1a
	adds r0, #0x10
	lsls r1, r1, #6
	movs r2, #0
	adds r3, r5, #0
	bl ov41_0224A918
	adds r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov41_0224A1DC
	pop {r4, r5, r6, pc}
_0224A670:
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl ov41_0224A1EC
	lsls r0, r6, #4
	adds r0, r4, r0
	adds r1, r5, #0
	bl ov41_0224A1DC
	pop {r4, r5, r6, pc}
_0224A686:
	ldr r0, [r4, #0x60]
	cmp r0, #1
	bne _0224A6BC
	adds r0, r4, #0
	adds r0, #0x40
	bl ov41_0224A8B0
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	bl ov41_0224A8D4
	adds r0, r4, #0
	ldr r1, _0224A6C0 @ =0x000005E2
	adds r0, #0x40
	movs r2, #0
	adds r3, r5, #0
	bl ov41_0224A918
	adds r4, #0x40
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov41_0224A1DC
	pop {r4, r5, r6, pc}
_0224A6B8:
	bl GF_AssertFail
_0224A6BC:
	pop {r4, r5, r6, pc}
	nop
_0224A6C0: .4byte 0x000005E2
	thumb_func_end ov41_0224A60C

	thumb_func_start ov41_0224A6C4
ov41_0224A6C4: @ 0x0224A6C4
	push {r4, r5, r6, lr}
	sub sp, #0x90
	adds r6, r0, #0
	movs r0, #0
	str r1, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	adds r5, r2, #0
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, [r5, #0x48]
	adds r4, r3, #0
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x4c]
	adds r3, r1, #0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x50]
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x54]
	str r0, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	add r0, sp, #0x5c
	bl FUN_02009D48
	ldr r0, [r5, #0x44]
	movs r2, #0
	movs r1, #1
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	lsls r0, r4, #0xc
	str r0, [sp, #0x34]
	ldr r0, [sp, #0xa0]
	str r1, [sp, #0x54]
	lsls r0, r0, #0xc
	str r0, [sp, #0x38]
	movs r0, #2
	str r0, [sp, #0x50]
	movs r0, #0xe
	str r0, [sp, #0x58]
	add r0, sp, #0x2c
	str r0, [sp, #0x80]
	str r1, [sp, #0x8c]
	adds r0, r6, #0
	add r1, sp, #0x80
	str r2, [sp, #0x3c]
	str r2, [sp, #0x84]
	str r2, [sp, #0x88]
	bl ov41_0224A118
	add sp, #0x90
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_0224A6C4

	thumb_func_start ov41_0224A734
ov41_0224A734: @ 0x0224A734
	push {r4, r5, r6, lr}
	sub sp, #0xa8
	adds r5, r0, #0
	movs r0, #0
	str r1, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	adds r4, r2, #0
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, [r4, #0x48]
	adds r6, r3, #0
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x4c]
	adds r3, r1, #0
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x50]
	str r0, [sp, #0x1c]
	ldr r0, [r4, #0x54]
	str r0, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	add r0, sp, #0x5c
	bl FUN_02009D48
	ldr r0, [r4, #0x44]
	movs r2, #0xe
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	ldr r0, [sp, #0xbc]
	str r2, [sp, #0x58]
	lsls r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [sp, #0xc0]
	add r2, sp, #0x2c
	lsls r0, r0, #0xc
	movs r1, #2
	str r2, [sp, #0x80]
	ldr r2, [sp, #0xb8]
	str r0, [sp, #0x38]
	movs r0, #0
	str r1, [sp, #0x50]
	movs r1, #1
	str r0, [sp, #0x3c]
	str r1, [sp, #0x54]
	str r0, [sp, #0x84]
	str r0, [sp, #0x88]
	str r0, [sp, #0x9c]
	movs r0, #0x13
	str r1, [sp, #0x8c]
	str r6, [sp, #0x94]
	str r2, [sp, #0x90]
	str r0, [sp, #0xa0]
	ldr r0, [r4, #0x4c]
	bl FUN_0200A7BC
	movs r1, #0
	bl FUN_0200B0F8
	str r0, [sp, #0x98]
	ldr r0, [sp, #0xb8]
	movs r1, #1
	movs r2, #0xd
	bl FUN_02013688
	movs r1, #1
	adds r3, r5, #0
	adds r2, r1, #0
	adds r3, #0x14
	bl FUN_02021AC8
	cmp r0, #0
	bne _0224A7D0
	bl GF_AssertFail
_0224A7D0:
	ldr r0, [r5, #0x18]
	add r1, sp, #0x80
	str r0, [sp, #0xa4]
	adds r0, r5, #0
	bl ov41_0224A15C
	add sp, #0xa8
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_0224A734

	thumb_func_start ov41_0224A7E0
ov41_0224A7E0: @ 0x0224A7E0
	lsls r1, r1, #2
	strb r3, [r0, r1]
	adds r1, r0, r1
	ldr r0, [sp, #4]
	strb r2, [r1, #2]
	adds r0, r3, r0
	strb r0, [r1, #1]
	ldr r0, [sp]
	adds r0, r2, r0
	strb r0, [r1, #3]
	bx lr
	.align 2, 0
	thumb_func_end ov41_0224A7E0

	thumb_func_start ov41_0224A7F8
ov41_0224A7F8: @ 0x0224A7F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x6b
	movs r4, #0
	str r0, [sp, #0xc]
	movs r7, #0x6a
	movs r6, #0x69
_0224A808:
	movs r0, #1
	str r0, [sp]
	movs r1, #6
	str r4, [sp, #4]
	lsls r1, r1, #6
	ldr r1, [r5, r1]
	ldr r2, [sp, #0xc]
	adds r0, r5, #0
	movs r3, #0
	bl ov41_022462E4
	movs r1, #6
	str r4, [sp]
	lsls r1, r1, #6
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl ov41_02246328
	movs r1, #6
	str r4, [sp]
	lsls r1, r1, #6
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl ov41_02246344
	ldr r0, [sp, #0xc]
	adds r4, r4, #1
	adds r0, r0, #3
	str r0, [sp, #0xc]
	adds r7, r7, #3
	adds r6, r6, #3
	cmp r4, #5
	blt _0224A808
	movs r0, #1
	str r0, [sp]
	movs r1, #3
	str r1, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	lsls r1, r1, #7
	ldr r1, [r5, r1]
	adds r0, r5, #0
	movs r2, #0x68
	bl ov41_02246304
	movs r1, #1
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r1, #6
	lsls r1, r1, #6
	ldr r1, [r5, r1]
	adds r0, r5, #0
	movs r2, #0x78
	movs r3, #0
	bl ov41_02246304
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224A7F8

	thumb_func_start ov41_0224A888
ov41_0224A888: @ 0x0224A888
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0224A88E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov41_02246360
	adds r4, r4, #1
	cmp r4, #5
	blt _0224A88E
	adds r0, r5, #0
	movs r1, #0
	bl ov41_02246374
	adds r0, r5, #0
	movs r1, #1
	bl ov41_02246374
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_0224A888

	thumb_func_start ov41_0224A8B0
ov41_0224A8B0: @ 0x0224A8B0
	push {r3, lr}
	cmp r1, #0
	bne _0224A8BC
	bl ov41_0224A270
	pop {r3, pc}
_0224A8BC:
	cmp r1, #2
	bne _0224A8C6
	bl ov41_0224A258
	pop {r3, pc}
_0224A8C6:
	cmp r1, #1
	beq _0224A8CE
	cmp r1, #3
	bne _0224A8D2
_0224A8CE:
	bl ov41_0224A264
_0224A8D2:
	pop {r3, pc}
	thumb_func_end ov41_0224A8B0

	thumb_func_start ov41_0224A8D4
ov41_0224A8D4: @ 0x0224A8D4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bne _0224A8F0
	ldr r0, [r5, #0x10]
	movs r1, #0
	movs r2, #0xf
	bl FUN_020136B4
	ldr r0, [r5, #0x10]
	movs r1, #4
	bl FUN_02013850
	pop {r3, r4, r5, pc}
_0224A8F0:
	cmp r4, #1
	bne _0224A8FE
	ldr r0, [r5, #0x10]
	movs r1, #0
	movs r2, #0x13
	bl FUN_020136B4
_0224A8FE:
	cmp r4, #3
	bne _0224A914
	ldr r0, [r5, #0x10]
	movs r1, #0
	movs r2, #0x13
	bl FUN_020136B4
	ldr r0, [r5, #0x10]
	movs r1, #3
	bl FUN_02013850
_0224A914:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_0224A8D4

	thumb_func_start ov41_0224A918
ov41_0224A918: @ 0x0224A918
	push {r3, lr}
	cmp r3, r2
	bne _0224A926
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0200604C
_0224A926:
	pop {r3, pc}
	thumb_func_end ov41_0224A918

	thumb_func_start ov41_0224A928
ov41_0224A928: @ 0x0224A928
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r3, #0
	movs r0, #0
	movs r3, #0xd
	bl FUN_0200BAF8
	adds r7, r0, #0
	bne _0224A940
	bl GF_AssertFail
_0224A940:
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_0200BBA0
	adds r5, r0, #0
	movs r0, #0xe
	movs r1, #1
	bl FUN_0201D39C
	adds r4, r0, #0
	bl FUN_0201D3C4
	movs r0, #0
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	str r0, [sp]
	str r0, [sp, #4]
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	ldr r0, [r6, #0x40]
	adds r1, r4, #0
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D494
	ldr r3, [sp, #0x28]
	movs r0, #2
	adds r1, r5, #0
	movs r2, #0
	lsls r3, r3, #3
	bl FUN_020030A0
	movs r1, #0
	adds r3, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0224A9AC @ =0x00010203
	adds r2, r5, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #2
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_0200BB44
	adds r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224A9AC: .4byte 0x00010203
	thumb_func_end ov41_0224A928

	thumb_func_start ov41_0224A9B0
ov41_0224A9B0: @ 0x0224A9B0
	ldr r3, _0224A9B8 @ =FUN_0201D54C
	movs r1, #1
	bx r3
	nop
_0224A9B8: .4byte FUN_0201D54C
	thumb_func_end ov41_0224A9B0

	thumb_func_start ov41_0224A9BC
ov41_0224A9BC: @ 0x0224A9BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_020248AC
	adds r3, r0, #0
	add r2, sp, #0
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [sp]
	lsls r0, r4, #0xc
	adds r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #4]
	lsls r0, r6, #0xc
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5]
	adds r1, r7, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_0224A9BC

	thumb_func_start ov41_0224A9F8
ov41_0224A9F8: @ 0x0224A9F8
	push {r4, lr}
	adds r4, r0, #0
	bl ov41_0224A9BC
	ldr r0, [r4, #0x10]
	bl FUN_02013728
	pop {r4, pc}
	thumb_func_end ov41_0224A9F8

	thumb_func_start ov41_0224AA08
ov41_0224AA08: @ 0x0224AA08
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r6, r2, #0
	movs r1, #1
	adds r5, r0, #0
	tst r1, r6
	beq _0224AA22
	movs r2, #0x52
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
_0224AA22:
	movs r0, #2
	tst r0, r6
	beq _0224AA30
	ldr r1, [r4]
	adds r0, r5, #0
	bl ov41_0224ACA4
_0224AA30:
	movs r0, #4
	adds r1, r6, #0
	tst r1, r0
	beq _0224AA54
	movs r1, #0x1b
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0x1f
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	adds r0, r5, #0
	ldr r1, [r4]
	adds r0, #0x2c
	movs r2, #2
	movs r3, #0x13
	bl ov41_0224AD0C
_0224AA54:
	movs r0, #8
	tst r0, r6
	beq _0224AA6C
	ldr r0, [r4, #0x24]
	str r0, [sp]
	adds r0, r5, #0
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0x10]
	adds r0, #0x38
	bl ov41_0224AED8
_0224AA6C:
	movs r0, #0x10
	tst r0, r6
	beq _0224AA8C
	ldr r0, [r4]
	str r0, [sp]
	ldr r0, [r4, #0x20]
	str r0, [sp, #4]
	ldr r0, [r4, #0x24]
	str r0, [sp, #8]
	adds r0, r5, #0
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0x1c]
	adds r0, #0xa0
	bl ov41_0224B118
_0224AA8C:
	movs r0, #0x20
	tst r0, r6
	beq _0224AB02
	movs r0, #0x1b
	str r0, [sp]
	movs r2, #2
	str r2, [sp, #4]
	movs r0, #0x8b
	str r0, [sp, #8]
	movs r3, #1
	str r3, [sp, #0xc]
	adds r0, #0xa9
	ldr r1, [r4]
	adds r0, r5, r0
	bl ov41_0224AD0C
	movs r0, #0x4d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0224AB3C @ =0x0001020F
	movs r1, #0x1b
	str r0, [sp, #8]
	movs r0, #0xff
	str r0, [sp, #0xc]
	adds r0, #0x35
	ldr r0, [r5, r0]
	ldr r2, [r4, #0x14]
	movs r3, #6
	bl ov41_0224AE24
	movs r0, #0x48
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0224AB3C @ =0x0001020F
	movs r1, #0x1b
	str r0, [sp, #8]
	movs r0, #0xff
	str r0, [sp, #0xc]
	adds r0, #0x35
	ldr r0, [r5, r0]
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x18]
	bl ov41_0224AE24
	movs r0, #0x4d
	lsls r0, r0, #2
	movs r2, #1
	ldr r0, [r5, r0]
	movs r1, #0
	adds r3, r2, #0
	bl FUN_0200E998
_0224AB02:
	ldr r0, [r4, #4]
	str r0, [r5, #0x30]
	ldr r0, [r4, #8]
	str r0, [r5, #0x34]
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	bl ov41_0224ACDC
	ldr r0, [r4, #0xc]
	bl FUN_0202ADCC
	movs r1, #0x4f
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r4, #0xc]
	bl FUN_0202AD3C
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #8
	ldr r0, [r5, r0]
	subs r1, #8
	orrs r0, r6
	str r0, [r5, r1]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0224AB3C: .4byte 0x0001020F
	thumb_func_end ov41_0224AA08

	thumb_func_start ov41_0224AB40
ov41_0224AB40: @ 0x0224AB40
	push {r4, lr}
	movs r1, #0x4e
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	movs r1, #2
	tst r1, r2
	beq _0224AB60
	bl ov41_0224AD7C
	movs r1, #0x4e
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	movs r0, #2
	bics r2, r0
	str r2, [r4, r1]
_0224AB60:
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	movs r0, #4
	tst r0, r1
	beq _0224AB7E
	ldr r0, [r4, #0x2c]
	bl ov41_0224AD84
	movs r1, #0x4e
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	movs r0, #4
	bics r2, r0
	str r2, [r4, r1]
_0224AB7E:
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	movs r0, #8
	tst r0, r1
	beq _0224ABA0
	adds r0, r4, #0
	ldr r1, [r4, #0x34]
	adds r0, #0x38
	bl ov41_0224AFD4
	movs r1, #0x4e
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	movs r0, #8
	bics r2, r0
	str r2, [r4, r1]
_0224ABA0:
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	movs r0, #0x10
	tst r0, r1
	beq _0224ABC2
	adds r0, r4, #0
	ldr r1, [r4, #0x34]
	adds r0, #0xa0
	bl ov41_0224B21C
	movs r1, #0x4e
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	movs r0, #0x10
	bics r2, r0
	str r2, [r4, r1]
_0224ABC2:
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	movs r1, #0x20
	tst r1, r2
	beq _0224ABE2
	subs r0, r0, #4
	ldr r0, [r4, r0]
	bl ov41_0224AD84
	movs r1, #0x4e
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	movs r0, #0x20
	bics r2, r0
	str r2, [r4, r1]
_0224ABE2:
	movs r2, #0x52
	adds r0, r4, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	pop {r4, pc}
	thumb_func_end ov41_0224AB40

	thumb_func_start ov41_0224ABF0
ov41_0224ABF0: @ 0x0224ABF0
	push {r3, lr}
	movs r1, #0x4e
	lsls r1, r1, #2
	ldr r2, [r0, r1]
	movs r1, #0x10
	tst r1, r2
	beq _0224AC04
	adds r0, #0xa0
	bl ov41_0224B250
_0224AC04:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov41_0224ABF0

	thumb_func_start ov41_0224AC08
ov41_0224AC08: @ 0x0224AC08
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x4e
	lsls r0, r0, #2
	adds r4, r1, #0
	ldr r1, [r5, r0]
	movs r0, #4
	adds r6, r2, #0
	adds r7, r3, #0
	tst r0, r1
	bne _0224AC24
	bl GF_AssertFail
_0224AC24:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xff
	str r0, [sp, #8]
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov41_0224AD90
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_0224AC08

	thumb_func_start ov41_0224AC40
ov41_0224AC40: @ 0x0224AC40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x4e
	lsls r0, r0, #2
	adds r4, r1, #0
	ldr r1, [r5, r0]
	movs r0, #4
	adds r6, r2, #0
	adds r7, r3, #0
	tst r0, r1
	bne _0224AC5C
	bl GF_AssertFail
_0224AC5C:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #5
	lsls r0, r0, #6
	ldr r1, [r5, r0]
	adds r0, r0, #4
	str r1, [sp, #8]
	adds r0, r5, r0
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov41_0224ADD8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224AC40

	thumb_func_start ov41_0224AC80
ov41_0224AC80: @ 0x0224AC80
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x51
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov41_0224AC80

	thumb_func_start ov41_0224AC98
ov41_0224AC98: @ 0x0224AC98
	ldr r3, _0224ACA0 @ =ov41_0224AF8C
	adds r0, #0x38
	bx r3
	nop
_0224ACA0: .4byte ov41_0224AF8C
	thumb_func_end ov41_0224AC98

	thumb_func_start ov41_0224ACA4
ov41_0224ACA4: @ 0x0224ACA4
	push {r3, lr}
	sub sp, #0x30
	str r1, [sp]
	movs r1, #0x1a
	str r1, [sp, #4]
	movs r1, #0xe0
	str r1, [sp, #8]
	movs r1, #0xe1
	str r1, [sp, #0xc]
	movs r2, #0
	movs r1, #0xe2
	str r1, [sp, #0x10]
	movs r1, #4
	str r1, [sp, #0x1c]
	movs r1, #1
	str r1, [sp, #0x20]
	movs r1, #0xe
	str r1, [sp, #0x2c]
	add r1, sp, #0
	str r2, [sp, #0x14]
	str r2, [sp, #0x18]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	bl ov41_02249C7C
	add sp, #0x30
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov41_0224ACA4

	thumb_func_start ov41_0224ACDC
ov41_0224ACDC: @ 0x0224ACDC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, r1, #0
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xe
	movs r2, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0200E644
	movs r0, #4
	movs r1, #0x40
	movs r2, #0xe
	bl FUN_0200304C
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov41_0224ACDC

	thumb_func_start ov41_0224AD0C
ov41_0224AD0C: @ 0x0224AD0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r3, #0
	movs r0, #0xe
	movs r1, #1
	adds r4, r2, #0
	bl FUN_0201D39C
	str r0, [r5]
	bl FUN_0201D3C4
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x28]
	lsls r3, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	movs r2, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x30]
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r1, [r5]
	adds r0, r7, #0
	bl FUN_0201D40C
	ldr r0, [r5]
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [sp, #0x34]
	cmp r0, #0
	beq _0224AD70
	movs r2, #1
	ldr r0, [r5]
	movs r1, #0
	adds r3, r2, #0
	bl FUN_0200E998
_0224AD70:
	ldr r0, [r5]
	bl FUN_0201D578
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_0224AD0C

	thumb_func_start ov41_0224AD7C
ov41_0224AD7C: @ 0x0224AD7C
	ldr r3, _0224AD80 @ =ov41_02249CC4
	bx r3
	.align 2, 0
_0224AD80: .4byte ov41_02249CC4
	thumb_func_end ov41_0224AD7C

	thumb_func_start ov41_0224AD84
ov41_0224AD84: @ 0x0224AD84
	ldr r3, _0224AD8C @ =FUN_0201D54C
	movs r1, #1
	bx r3
	nop
_0224AD8C: .4byte FUN_0201D54C
	thumb_func_end ov41_0224AD84

	thumb_func_start ov41_0224AD90
ov41_0224AD90: @ 0x0224AD90
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	movs r1, #0xf
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x28]
	adds r1, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	adds r2, r6, #0
	str r0, [sp, #4]
	ldr r0, _0224ADD4 @ =0x0001020F
	adds r3, r7, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0xc]
	adds r0, r5, #0
	bl ov41_0224AE24
	movs r2, #1
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r3, r2, #0
	bl FUN_0200E998
	adds r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224ADD4: .4byte 0x0001020F
	thumb_func_end ov41_0224AD90

	thumb_func_start ov41_0224ADD8
ov41_0224ADD8: @ 0x0224ADD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r1, #0
	movs r1, #0xf
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x28]
	adds r1, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	adds r2, r6, #0
	str r0, [sp, #4]
	ldr r0, _0224AE20 @ =0x0001020F
	adds r3, r7, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl ov41_0224AE78
	movs r2, #1
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r3, r2, #0
	bl FUN_0200E998
	adds r0, r4, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0224AE20: .4byte 0x0001020F
	thumb_func_end ov41_0224ADD8

	thumb_func_start ov41_0224AE24
ov41_0224AE24: @ 0x0224AE24
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r3, #0
	movs r0, #0
	movs r3, #0xd
	bl FUN_0200BAF8
	adds r5, r0, #0
	bne _0224AE3C
	bl GF_AssertFail
_0224AE3C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	movs r1, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	adds r2, r4, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r6, #0
	bl FUN_020200FC
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	bl FUN_0200BB44
	adds r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_0224AE24

	thumb_func_start ov41_0224AE78
ov41_0224AE78: @ 0x0224AE78
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r4, [sp, #0x38]
	adds r7, r0, #0
	ldr r0, [r4]
	adds r5, r1, #0
	adds r6, r2, #0
	str r3, [sp, #0x10]
	cmp r0, #0
	beq _0224AE90
	bl GF_AssertFail
_0224AE90:
	movs r0, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0xd
	bl FUN_0200BAF8
	adds r5, r0, #0
	bne _0224AEA4
	bl GF_AssertFail
_0224AEA4:
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	bl FUN_0200BBA0
	str r0, [r4]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x28]
	str r0, [sp]
	ldr r0, [sp, #0x34]
	movs r1, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4]
	adds r0, r7, #0
	bl FUN_020200FC
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0200BB44
	adds r0, r4, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224AE78

	thumb_func_start ov41_0224AED8
ov41_0224AED8: @ 0x0224AED8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	adds r5, r1, #0
	movs r1, #0x67
	str r1, [sp]
	movs r1, #0xe1
	str r1, [sp, #4]
	movs r1, #0x66
	str r1, [sp, #8]
	movs r1, #0x65
	str r1, [sp, #0xc]
	movs r1, #2
	str r1, [sp, #0x10]
	movs r1, #0x7d
	adds r4, r2, #0
	str r3, [sp, #0x1c]
	lsls r1, r1, #4
	str r1, [sp, #0x14]
	ldr r3, [sp, #0x80]
	str r0, [sp, #0x18]
	adds r1, r4, #0
	movs r2, #0xe
	bl ov41_0224AFF8
	ldr r0, [sp, #0x18]
	adds r1, r4, #0
	add r2, sp, #0x48
	movs r3, #0
	bl ov41_0224B0B8
	add r0, sp, #0x48
	str r0, [sp, #0x2c]
	movs r0, #2
	str r0, [sp, #0x40]
	movs r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x3c]
	movs r0, #0xe
	str r0, [sp, #0x44]
	movs r0, #0x68
	ldr r7, [sp, #0x24]
	str r5, [sp, #0x28]
	str r0, [sp, #0x20]
_0224AF2E:
	ldr r0, [sp, #0x20]
	movs r6, #0
	str r0, [sp, #0x34]
	lsls r1, r0, #0xc
	movs r0, #2
	lsls r0, r0, #0x14
	str r1, [sp, #0x34]
	adds r0, r1, r0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x18]
	lsls r1, r7, #2
	movs r4, #0x26
	adds r5, r0, r1
_0224AF48:
	str r4, [sp, #0x30]
	lsls r0, r4, #0xc
	str r0, [sp, #0x30]
	add r0, sp, #0x28
	bl FUN_02024714
	movs r1, #1
	str r0, [r5, #0x10]
	bl FUN_020248F0
	ldr r0, [sp, #0x1c]
	adds r1, r6, r7
	cmp r1, r0
	blt _0224AF6C
	ldr r0, [r5, #0x10]
	movs r1, #0
	bl FUN_02024830
_0224AF6C:
	adds r6, r6, #1
	adds r4, #0x12
	adds r5, r5, #4
	cmp r6, #0xa
	blt _0224AF48
	ldr r0, [sp, #0x20]
	adds r7, #0xa
	adds r0, #0x12
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	adds r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #2
	blt _0224AF2E
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224AED8

	thumb_func_start ov41_0224AF8C
ov41_0224AF8C: @ 0x0224AF8C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, [r7, #0x60]
	adds r5, r1, #0
	cmp r6, r5
	bge _0224AFB2
	cmp r6, r5
	bge _0224AFD0
	lsls r0, r6, #2
	adds r4, r7, r0
_0224AFA0:
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_020248F0
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r5
	blt _0224AFA0
	b _0224AFD0
_0224AFB2:
	cmp r6, r5
	ble _0224AFD0
	subs r6, r6, #1
	cmp r6, r5
	blt _0224AFD0
	lsls r0, r6, #2
	adds r4, r7, r0
_0224AFC0:
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_020248F0
	subs r6, r6, #1
	subs r4, r4, #4
	cmp r6, r5
	bge _0224AFC0
_0224AFD0:
	str r5, [r7, #0x60]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224AF8C

	thumb_func_start ov41_0224AFD4
ov41_0224AFD4: @ 0x0224AFD4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	movs r4, #0
	adds r5, r6, #0
_0224AFDE:
	ldr r0, [r5, #0x10]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x14
	blt _0224AFDE
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov41_0224B084
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_0224AFD4

	thumb_func_start ov41_0224AFF8
ov41_0224AFF8: @ 0x0224AFF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r2, #0
	ldr r7, [sp, #0x3c]
	ldr r2, [sp, #0x28]
	adds r5, r0, #0
	adds r0, r7, r2
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r4, r1, #0
	str r6, [sp, #8]
	ldr r0, [r4]
	str r3, [sp, #0x10]
	adds r1, r3, #0
	movs r3, #0
	bl FUN_0200A3C8
	str r0, [r5]
	bl FUN_0200ADA4
	ldr r0, [r5]
	bl FUN_0200A740
	ldr r2, [sp, #0x2c]
	ldr r1, [sp, #0x10]
	adds r0, r7, r2
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	movs r3, #0
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r0, [r4, #4]
	bl FUN_0200A480
	str r0, [r5, #4]
	bl FUN_0200B00C
	ldr r0, [r5, #4]
	bl FUN_0200A740
	ldr r2, [sp, #0x30]
	ldr r1, [sp, #0x10]
	adds r0, r7, r2
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r4, #8]
	movs r3, #0
	bl FUN_0200A540
	ldr r2, [sp, #0x34]
	str r0, [r5, #8]
	adds r0, r7, r2
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r4, #0xc]
	ldr r1, [sp, #0x10]
	movs r3, #0
	bl FUN_0200A540
	str r0, [r5, #0xc]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_0224AFF8

	thumb_func_start ov41_0224B084
ov41_0224B084: @ 0x0224B084
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	bl FUN_0200AEB0
	ldr r0, [r5, #4]
	bl FUN_0200B0A8
	ldr r0, [r4]
	ldr r1, [r5]
	bl FUN_0200A75C
	ldr r0, [r4, #4]
	ldr r1, [r5, #4]
	bl FUN_0200A75C
	ldr r0, [r4, #8]
	ldr r1, [r5, #8]
	bl FUN_0200A75C
	ldr r0, [r4, #0xc]
	ldr r1, [r5, #0xc]
	bl FUN_0200A75C
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224B084

	thumb_func_start ov41_0224B0B8
ov41_0224B0B8: @ 0x0224B0B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	adds r7, r2, #0
	adds r6, r3, #0
	bl FUN_0200A7FC
	str r0, [sp, #0x2c]
	ldr r0, [r5, #4]
	bl FUN_0200A7FC
	str r0, [sp, #0x30]
	ldr r0, [r5, #8]
	bl FUN_0200A7FC
	str r0, [sp, #0x34]
	ldr r0, [r5, #0xc]
	bl FUN_0200A7FC
	str r0, [sp]
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	ldr r1, [r4]
	ldr r2, [sp, #0x30]
	str r1, [sp, #0x14]
	ldr r1, [r4, #4]
	ldr r3, [sp, #0x34]
	str r1, [sp, #0x18]
	ldr r1, [r4, #8]
	str r1, [sp, #0x1c]
	ldr r1, [r4, #0xc]
	str r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	adds r0, r7, #0
	bl FUN_02009D48
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_0224B0B8

	thumb_func_start ov41_0224B118
ov41_0224B118: @ 0x0224B118
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	adds r4, r1, #0
	movs r1, #0xe5
	str r1, [sp]
	movs r1, #0xe6
	str r1, [sp, #4]
	movs r1, #0xe4
	str r1, [sp, #8]
	movs r1, #0xe3
	str r1, [sp, #0xc]
	movs r1, #2
	str r1, [sp, #0x10]
	ldr r1, _0224B214 @ =0x00000BB8
	adds r5, r2, #0
	str r3, [sp, #0x18]
	str r1, [sp, #0x14]
	ldr r3, [sp, #0x80]
	adds r7, r0, #0
	adds r1, r5, #0
	movs r2, #0xe
	bl ov41_0224AFF8
	adds r0, r7, #0
	adds r1, r5, #0
	add r2, sp, #0x3c
	movs r3, #0
	bl ov41_0224B0B8
	add r0, sp, #0x3c
	str r0, [sp, #0x20]
	movs r2, #2
	movs r0, #0xe
	movs r1, #0x3a
	str r0, [sp, #0x38]
	lsls r1, r1, #0xc
	lsls r0, r2, #0x14
	movs r6, #0
	str r4, [sp, #0x1c]
	str r1, [sp, #0x28]
	adds r0, r1, r0
	str r2, [sp, #0x34]
	str r6, [sp, #0x30]
	str r0, [sp, #0x28]
	movs r4, #0x67
	adds r5, r7, #0
_0224B174:
	str r4, [sp, #0x24]
	lsls r0, r4, #0xc
	str r0, [sp, #0x24]
	add r0, sp, #0x1c
	bl FUN_02024714
	str r0, [r5, #0x10]
	adds r6, r6, #1
	adds r4, #0x18
	adds r5, r5, #4
	cmp r6, #2
	blt _0224B174
	ldr r0, [sp, #0x18]
	movs r1, #0x1e
	str r0, [r7, #0x1c]
	muls r1, r0, r1
	str r1, [r7, #0x20]
	ldr r1, [sp, #0x7c]
	str r1, [r7, #0x2c]
	str r0, [r1]
	ldr r1, [r7, #0x2c]
	str r0, [r1, #8]
	adds r0, r7, #0
	movs r1, #0
	adds r0, #0x90
	str r1, [r0]
	adds r0, r7, #0
	bl ov41_0224B298
	movs r0, #0xe
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #0xc1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r7, #0
	ldr r1, [sp, #0x78]
	adds r0, #0x18
	movs r2, #0xa
	movs r3, #8
	bl ov41_0224AD0C
	ldr r0, [r7, #0x18]
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0
	str r0, [sp]
	movs r3, #4
	ldr r0, _0224B218 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0xff
	str r0, [sp, #0xc]
	ldr r0, [r7, #0x18]
	movs r1, #0x1b
	movs r2, #0xd7
	bl ov41_0224AE24
	movs r0, #0x48
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _0224B218 @ =0x00010200
	movs r1, #0x1b
	str r0, [sp, #8]
	movs r0, #0xff
	str r0, [sp, #0xc]
	ldr r0, [r7, #0x18]
	movs r2, #0xd7
	movs r3, #5
	bl ov41_0224AE24
	ldr r0, [r7, #0x18]
	bl FUN_0201D578
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224B214: .4byte 0x00000BB8
_0224B218: .4byte 0x00010200
	thumb_func_end ov41_0224B118

	thumb_func_start ov41_0224B21C
ov41_0224B21C: @ 0x0224B21C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x24]
	adds r4, r1, #0
	cmp r0, #0
	beq _0224B22C
	bl FUN_0200E390
_0224B22C:
	ldr r0, [r5, #0x28]
	cmp r0, #0
	beq _0224B236
	bl FUN_0200E390
_0224B236:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov41_0224B084
	ldr r0, [r5, #0x18]
	bl ov41_0224AD84
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x94
	blx FUN_020E5B44
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224B21C

	thumb_func_start ov41_0224B250
ov41_0224B250: @ 0x0224B250
	push {r4, lr}
	adds r4, r0, #0
	bl ov41_0224B310
	adds r0, r4, #0
	bl ov41_0224B270
	adds r0, r4, #0
	bl ov41_0224B298
	adds r4, #0x30
	adds r0, r4, #0
	bl ov41_0224B450
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224B250

	thumb_func_start ov41_0224B270
ov41_0224B270: @ 0x0224B270
	push {r3, lr}
	ldr r1, [r0, #0x2c]
	ldr r2, [r1]
	ldr r1, [r0, #0x1c]
	cmp r1, r2
	beq _0224B290
	str r2, [r0, #0x1c]
	cmp r2, #0xa
	bgt _0224B290
	adds r1, r0, #0
	adds r1, #0x30
	bl ov41_0224B374
	ldr r0, _0224B294 @ =0x00000682
	bl FUN_0200604C
_0224B290:
	pop {r3, pc}
	nop
_0224B294: .4byte 0x00000682
	thumb_func_end ov41_0224B270

	thumb_func_start ov41_0224B298
ov41_0224B298: @ 0x0224B298
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x1c]
	movs r1, #1
	str r0, [sp]
	movs r0, #0xa
	adds r4, r1, #0
	muls r4, r0, r4
	movs r7, #0
	adds r5, r6, #0
_0224B2AE:
	ldr r0, [sp]
	adds r1, r4, #0
	blx FUN_020F2998
	str r0, [sp, #4]
	cmp r0, #0xa
	ble _0224B2C0
	bl GF_AssertFail
_0224B2C0:
	ldr r0, [r5, #0x10]
	ldr r1, [sp, #4]
	bl FUN_020248F0
	ldr r0, [sp, #4]
	adds r1, r0, #0
	ldr r0, [sp]
	muls r1, r4, r1
	subs r0, r0, r1
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	blx FUN_020F2998
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #0
	bne _0224B302
	ldr r0, [r6, #0x1c]
	cmp r0, #0xa
	bgt _0224B302
	ldr r0, [r5, #0x10]
	movs r1, #1
	bl FUN_02024A48
	cmp r7, #1
	bne _0224B302
	adds r1, r6, #0
	adds r1, #0x90
	movs r0, #1
	str r0, [r1]
_0224B302:
	adds r7, r7, #1
	adds r5, r5, #4
	cmp r7, #2
	blt _0224B2AE
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_0224B298

	thumb_func_start ov41_0224B310
ov41_0224B310: @ 0x0224B310
	ldr r1, [r0, #0x20]
	subs r1, r1, #1
	bmi _0224B318
	str r1, [r0, #0x20]
_0224B318:
	bx lr
	.align 2, 0
	thumb_func_end ov41_0224B310

	thumb_func_start ov41_0224B31C
ov41_0224B31C: @ 0x0224B31C
	str r1, [r0]
	str r1, [r0, #4]
	subs r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	movs r1, #0
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov41_0224B31C

	thumb_func_start ov41_0224B32C
ov41_0224B32C: @ 0x0224B32C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0xc]
	ldr r0, [r4, #8]
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
	ldr r1, [r4, #0x10]
	lsls r1, r1, #0xc
	blx FUN_020CCBA0
	ldr r1, [r4, #4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	adds r0, r0, #1
	cmp r0, r1
	bgt _0224B36C
	str r0, [r4, #0xc]
	movs r0, #0
	pop {r4, pc}
_0224B36C:
	str r1, [r4, #0xc]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224B32C

	thumb_func_start ov41_0224B374
ov41_0224B374: @ 0x0224B374
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	movs r1, #0x3a
	movs r0, #2
	lsls r1, r1, #0xc
	lsls r0, r0, #0x14
	ldr r4, [sp, #4]
	str r1, [sp, #0x10]
	adds r0, r1, r0
	str r0, [sp, #0x10]
	adds r0, r4, #0
	ldr r6, [sp]
	movs r7, #0
	movs r5, #0x67
	str r0, [sp, #8]
_0224B396:
	ldr r0, [r6, #0x10]
	movs r1, #2
	str r0, [r4, #4]
	bl FUN_0202487C
	ldr r2, [sp, #8]
	str r5, [sp, #0xc]
	lsls r0, r5, #0xc
	adds r2, #0xc
	add r3, sp, #0xc
	str r0, [sp, #0xc]
	ldm r3!, {r0, r1}
	str r2, [sp, #8]
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r7, r7, #1
	str r0, [r2]
	adds r6, r6, #4
	adds r4, r4, #4
	adds r5, #0x18
	cmp r7, #2
	blt _0224B396
	ldr r0, [sp]
	ldr r1, [r0, #0x1c]
	movs r0, #0xa
	subs r0, r0, r1
	cmp r0, #0
	ble _0224B3F0
	lsls r0, r0, #0xc
	ldr r2, _0224B44C @ =0x00000266
	asrs r1, r0, #0x1f
	movs r3, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r4, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r4, #0xc
	orrs r1, r0
	lsls r0, r2, #1
	adds r4, r1, r0
	b _0224B3F4
_0224B3F0:
	movs r4, #1
	lsls r4, r4, #0xc
_0224B3F4:
	ldr r0, [sp, #4]
	movs r2, #1
	adds r0, #0x24
	adds r1, r4, #0
	lsls r2, r2, #0xc
	movs r3, #0x10
	bl ov41_0224B31C
	movs r2, #6
	asrs r1, r4, #0x1f
	adds r0, r4, #0
	lsls r2, r2, #0xe
	movs r3, #0
	blx FUN_020F2948
	movs r3, #2
	movs r2, #0
	lsls r3, r3, #0xa
	adds r3, r0, r3
	adcs r1, r2
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	orrs r1, r0
	movs r0, #6
	lsls r0, r0, #0xe
	subs r4, r1, r0
	ldr r0, [sp, #4]
	adds r1, r4, #0
	adds r0, #0x38
	movs r3, #0x10
	bl ov41_0224B31C
	ldr r0, [sp, #4]
	adds r1, r4, #0
	adds r0, #0x4c
	movs r2, #0
	movs r3, #0x10
	bl ov41_0224B31C
	ldr r0, [sp, #4]
	movs r1, #1
	str r1, [r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0224B44C: .4byte 0x00000266
	thumb_func_end ov41_0224B374

	thumb_func_start ov41_0224B450
ov41_0224B450: @ 0x0224B450
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _0224B4E2
	adds r0, r5, #0
	adds r0, #0x24
	bl ov41_0224B32C
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x38
	bl ov41_0224B32C
	adds r0, r5, #0
	adds r0, #0x4c
	bl ov41_0224B32C
	ldr r0, [r5, #0x24]
	add r1, sp, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x24]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	str r0, [sp, #0x14]
	ldr r0, [r5, #4]
	bl FUN_020247F4
	ldr r0, [r5, #8]
	add r1, sp, #0xc
	bl FUN_020247F4
	adds r6, r5, #0
	adds r6, #0xc
	add r3, sp, #0
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	ldr r1, [sp]
	ldr r0, [r5, #0x38]
	subs r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [r5, #0x4c]
	subs r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	adds r1, r2, #0
	bl FUN_020247D4
	adds r6, r5, #0
	adds r6, #0x18
	add r3, sp, #0
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	ldr r1, [sp, #4]
	ldr r0, [r5, #0x4c]
	subs r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	adds r1, r2, #0
	bl FUN_020247D4
	cmp r4, #0
	beq _0224B4E2
	movs r0, #0
	str r0, [r5]
_0224B4E2:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_0224B450

	thumb_func_start ov41_0224B4E8
ov41_0224B4E8: @ 0x0224B4E8
	push {r3, lr}
	sub sp, #0x10
	adds r3, r1, #0
	stm r0!, {r1}
	adds r3, #0x48
	str r3, [sp]
	ldr r1, [r1, #0x74]
	lsls r1, r1, #2
	adds r1, #0x89
	str r1, [sp, #4]
	movs r1, #0x10
	str r1, [sp, #8]
	add r1, sp, #0
	str r2, [sp, #0xc]
	bl ov41_02249CE0
	add sp, #0x10
	pop {r3, pc}
	thumb_func_end ov41_0224B4E8

	thumb_func_start ov41_0224B50C
ov41_0224B50C: @ 0x0224B50C
	ldr r3, _0224B514 @ =ov41_02249CF8
	adds r0, r0, #4
	movs r1, #1
	bx r3
	.align 2, 0
_0224B514: .4byte ov41_02249CF8
	thumb_func_end ov41_0224B50C

	thumb_func_start ov41_0224B518
ov41_0224B518: @ 0x0224B518
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r4, #4
	bl ov41_02249D60
	movs r1, #0x1c
	movs r0, #0
_0224B526:
	strb r0, [r4]
	adds r4, r4, #1
	subs r1, r1, #1
	bne _0224B526
	pop {r4, pc}
	thumb_func_end ov41_0224B518

	thumb_func_start ov41_0224B530
ov41_0224B530: @ 0x0224B530
	push {r3, r4, lr}
	sub sp, #0x6c
	adds r2, r0, #0
	adds r4, r1, #0
	add r0, sp, #0
	adds r1, r2, #0
	bl ov41_0224B8DC
	add r0, sp, #0
	adds r1, r4, #0
	bl ov41_0224B8F0
	add r0, sp, #0
	bl ov41_0224B630
	add sp, #0x6c
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224B530

	thumb_func_start ov41_0224B554
ov41_0224B554: @ 0x0224B554
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _0224B56A
	subs r0, #0x48
	adds r0, r4, r0
	bl ov41_0224B50C
_0224B56A:
	movs r0, #0x99
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0224B57A
	adds r0, r4, #0
	bl ov41_0224B720
_0224B57A:
	pop {r4, pc}
	thumb_func_end ov41_0224B554

	thumb_func_start ov41_0224B57C
ov41_0224B57C: @ 0x0224B57C
	push {r4, lr}
	movs r1, #0x26
	adds r4, r0, #0
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0224B58E
	bl ov41_0224B878
_0224B58E:
	adds r0, r4, #0
	bl ov41_0224B85C
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov41_02245ECC
	movs r0, #0x63
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, #8
	adds r0, r4, r0
	bl ov41_022499DC
	adds r0, r4, #0
	bl ov41_0224B754
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224B57C

	thumb_func_start ov41_0224B5C8
ov41_0224B5C8: @ 0x0224B5C8
	ldr r3, _0224B5CC @ =ov41_022465CC
	bx r3
	.align 2, 0
_0224B5CC: .4byte ov41_022465CC
	thumb_func_end ov41_0224B5C8

	thumb_func_start ov41_0224B5D0
ov41_0224B5D0: @ 0x0224B5D0
	movs r2, #0x99
	lsls r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov41_0224B5D0

	thumb_func_start ov41_0224B5D8
ov41_0224B5D8: @ 0x0224B5D8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r6, r2, #0
	movs r2, #0x19
	adds r4, r1, #0
	lsls r2, r2, #4
	adds r5, r0, #0
	adds r1, r2, #0
	adds r0, r5, r2
	str r6, [sp]
	adds r1, #0xac
	adds r2, #0xb0
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	adds r3, r4, #0
	bl ov41_02248120
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0224B620
	movs r3, #0x88
	ldr r0, [r5, #0x40]
	movs r1, #2
	movs r2, #0
	subs r3, r3, r4
	bl FUN_0201BC8C
	movs r3, #0x10
	ldr r0, [r5, #0x40]
	movs r1, #2
	movs r2, #3
	subs r3, r3, r6
	bl FUN_0201BC8C
_0224B620:
	movs r0, #0x8f
	lsls r0, r0, #2
	str r4, [r5, r0]
	adds r0, r0, #4
	str r6, [r5, r0]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov41_0224B5D8

	thumb_func_start ov41_0224B630
ov41_0224B630: @ 0x0224B630
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x9a
	ldr r0, [r5, #0x68]
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0x9a
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x8e
	ldr r1, [r5, #0x68]
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r5, #0x68]
	bl FUN_0206DD2C
	movs r1, #0x8d
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5]
	ldr r1, [r4, r1]
	bl FUN_0202BEF4
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov41_0224B6CC
	ldr r1, [r5, #0x58]
	ldr r2, [r5, #0x68]
	adds r0, r4, #0
	bl ov41_02246544
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r2, [r5, #0x68]
	adds r0, r4, r0
	movs r1, #0x15
	bl ov41_022499B4
	ldr r1, [r5, #0x68]
	movs r0, #0x14
	bl ov41_02245EA0
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov41_0224B780
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov41_0224B848
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r4, r1
	subs r1, #0x88
	ldr r2, [r5, #0x68]
	adds r1, r4, r1
	bl ov41_0224B4E8
	movs r0, #0x26
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov41_0224B888
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224B630

	thumb_func_start ov41_0224B6CC
ov41_0224B6CC: @ 0x0224B6CC
	push {r3, r4, r5, lr}
	sub sp, #0x28
	adds r4, r1, #0
	ldr r1, [r4, #0x68]
	adds r5, r0, #0
	movs r0, #0x1a
	bl FUN_02007688
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r5, r1]
	ldr r0, _0224B71C @ =0x000002CE
	add r1, sp, #0
	str r0, [sp]
	movs r0, #0x76
	str r0, [sp, #4]
	movs r0, #0x13
	str r0, [sp, #8]
	ldr r0, [r4, #0x68]
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x68]
	adds r0, r5, #0
	bl ov41_02246518
	ldr r3, [r4, #0x68]
	adds r0, r5, #0
	add r1, sp, #0x10
	adds r2, r4, #0
	bl ov41_0224B938
	adds r0, r5, #0
	add r1, sp, #0x10
	bl ov41_02246250
	add r0, sp, #0x10
	bl ov41_022463D4
	add sp, #0x28
	pop {r3, r4, r5, pc}
	nop
_0224B71C: .4byte 0x000002CE
	thumb_func_end ov41_0224B6CC

	thumb_func_start ov41_0224B720
ov41_0224B720: @ 0x0224B720
	push {r3, r4, lr}
	sub sp, #4
	movs r3, #0x25
	lsls r3, r3, #4
	adds r1, r0, r3
	str r1, [sp]
	adds r1, r3, #0
	subs r1, #0x14
	ldr r2, [r0, r1]
	adds r1, r3, #0
	subs r1, #0xc
	ldr r1, [r0, r1]
	adds r1, r2, r1
	adds r2, r3, #0
	subs r2, #0x10
	ldr r4, [r0, r2]
	adds r2, r3, #0
	subs r2, #8
	subs r3, r3, #4
	ldr r2, [r0, r2]
	ldrh r3, [r0, r3]
	adds r2, r4, r2
	bl ov41_022465D8
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov41_0224B720

	thumb_func_start ov41_0224B754
ov41_0224B754: @ 0x0224B754
	push {r4, lr}
	adds r4, r0, #0
	bl ov41_0224626C
	adds r0, r4, #0
	bl ov41_02246594
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224B772
	adds r0, r4, #0
	bl ov41_022465C0
_0224B772:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0200770C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224B754

	thumb_func_start ov41_0224B780
ov41_0224B780: @ 0x0224B780
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	adds r5, r0, #0
	add r2, sp, #0x28
	movs r0, #0
	adds r7, r1, #0
	adds r3, r2, #0
	adds r1, r0, #0
	stm r3!, {r0, r1}
	stm r3!, {r0, r1}
	stm r3!, {r0, r1}
	stm r3!, {r0, r1}
	str r0, [r3]
	ldr r0, [r5]
	str r0, [sp, #0x28]
	ldr r0, [r5, #4]
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x10]
	str r0, [sp, #0x30]
	ldr r0, [r5, #0x30]
	str r0, [sp, #0x34]
	ldr r0, [r5, #0x20]
	str r0, [sp, #0x38]
	ldr r0, [r5, #0x40]
	str r0, [sp, #0x3c]
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	str r1, [sp, #0x40]
	adds r1, r0, #0
	subs r1, #8
	adds r1, r5, r1
	str r1, [sp, #0x44]
	movs r1, #0x15
	adds r0, r0, #4
	str r1, [sp, #0x48]
	adds r0, r5, r0
	adds r1, r2, #0
	bl ov41_02247F3C
	ldr r0, [r7]
	bl FUN_0202BEE4
	adds r6, r0, #0
	ldr r0, [r7]
	bl FUN_0202BEEC
	adds r4, r0, #0
	ldr r0, [r7]
	bl FUN_0202BEDC
	str r4, [sp]
	str r0, [sp, #4]
	ldr r0, [r7, #0x68]
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #8]
	adds r0, r5, r1
	adds r1, #0xa4
	ldr r1, [r5, r1]
	add r2, sp, #0x18
	adds r3, r6, #0
	bl ov41_02247FAC
	ldr r0, [r7, #0x54]
	movs r6, #0
	cmp r0, #0
	ble _0224B844
	adds r4, r7, #0
_0224B80A:
	ldr r0, [r4, #4]
	bl FUN_0202BEFC
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	bl FUN_0202BF00
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	bl FUN_0202BF04
	str r0, [sp, #0x14]
	ldr r0, [r4, #4]
	bl FUN_0202BF08
	str r0, [sp]
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r5, r0
	bl ov41_02248044
	ldr r0, [r7, #0x54]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blt _0224B80A
_0224B844:
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224B780

	thumb_func_start ov41_0224B848
ov41_0224B848: @ 0x0224B848
	adds r2, r1, #0
	movs r1, #0x19
	lsls r1, r1, #4
	adds r0, r0, r1
	ldr r1, [r2, #0x5c]
	ldr r3, _0224B858 @ =ov41_0224825C
	ldr r2, [r2, #0x68]
	bx r3
	.align 2, 0
_0224B858: .4byte ov41_0224825C
	thumb_func_end ov41_0224B848

	thumb_func_start ov41_0224B85C
ov41_0224B85C: @ 0x0224B85C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov41_022480E0
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov41_02247F90
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224B85C

	thumb_func_start ov41_0224B878
ov41_0224B878: @ 0x0224B878
	movs r1, #0x19
	lsls r1, r1, #4
	ldr r3, _0224B884 @ =ov41_022482A8
	adds r0, r0, r1
	bx r3
	nop
_0224B884: .4byte ov41_022482A8
	thumb_func_end ov41_0224B878

	thumb_func_start ov41_0224B888
ov41_0224B888: @ 0x0224B888
	push {r3, r4, r5, lr}
	adds r3, r1, #0
	movs r1, #0x8f
	adds r4, r0, #0
	movs r2, #0x48
	lsls r1, r1, #2
	str r2, [r4, r1]
	movs r5, #0x38
	adds r2, r1, #4
	str r5, [r4, r2]
	adds r2, r1, #0
	adds r2, #8
	str r5, [r4, r2]
	adds r2, r1, #0
	movs r5, #0x40
	adds r2, #0xc
	str r5, [r4, r2]
	lsls r2, r5, #6
	adds r5, r1, #0
	adds r5, #0x14
	str r2, [r4, r5]
	adds r5, r1, #0
	adds r5, #0x18
	str r2, [r4, r5]
	adds r5, r1, #0
	adds r5, #0x1c
	str r2, [r4, r5]
	movs r2, #0
	adds r1, #0x10
	strh r2, [r4, r1]
	ldr r1, [r3, #0x60]
	ldr r2, [r3, #0x64]
	bl ov41_0224B5D8
	movs r0, #0x97
	ldr r1, _0224B8D8 @ =0x00007FFF
	lsls r0, r0, #2
	strh r1, [r4, r0]
	pop {r3, r4, r5, pc}
	nop
_0224B8D8: .4byte 0x00007FFF
	thumb_func_end ov41_0224B888

	thumb_func_start ov41_0224B8DC
ov41_0224B8DC: @ 0x0224B8DC
	ldr r2, [r1]
	str r2, [r0, #0x58]
	ldr r2, [r1, #4]
	str r2, [r0, #0x60]
	ldr r2, [r1, #8]
	str r2, [r0, #0x64]
	ldr r1, [r1, #0xc]
	str r1, [r0, #0x68]
	bx lr
	.align 2, 0
	thumb_func_end ov41_0224B8DC

	thumb_func_start ov41_0224B8F0
ov41_0224B8F0: @ 0x0224B8F0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	adds r5, r0, #0
	adds r0, r7, #0
	bl FUN_0202BE14
	adds r6, r5, #0
	str r0, [r5]
	movs r4, #0
	str r4, [r5, #0x54]
	adds r6, #0x54
_0224B906:
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_0202BDEC
	cmp r0, #0
	beq _0224B928
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_0202BE2C
	ldr r1, [r5, #0x54]
	lsls r1, r1, #2
	adds r1, r5, r1
	str r0, [r1, #4]
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
_0224B928:
	adds r4, r4, #1
	cmp r4, #0xa
	blt _0224B906
	adds r0, r7, #0
	bl FUN_0202BE80
	str r0, [r5, #0x5c]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224B8F0

	thumb_func_start ov41_0224B938
ov41_0224B938: @ 0x0224B938
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r7, r3, #0
	adds r5, r0, #0
	adds r6, r2, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov41_022464AC
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov41_0224B958
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224B938

	thumb_func_start ov41_0224B958
ov41_0224B958: @ 0x0224B958
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #0x10]
	adds r0, r2, #0
	ldr r0, [r0, #0x54]
	adds r4, r1, #0
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r0, #0
	ble _0224B9D0
	adds r6, r2, #0
_0224B972:
	ldr r0, [r6, #4]
	bl FUN_0202BEFC
	adds r5, r0, #0
	ldr r0, [r4, #0x10]
	adds r1, r5, #0
	bl FUN_020255A0
	cmp r0, #1
	bne _0224B9BE
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	ldr r1, [sp, #4]
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	ldr r3, [sp, #0xc]
	adds r1, r5, #1
	movs r2, #0
	bl FUN_02007C98
	adds r7, r0, #0
	ldr r0, [r4, #0x10]
	adds r1, r7, #0
	adds r2, r5, #0
	bl FUN_020255C4
	ldr r1, [r4]
	lsls r5, r5, #3
	adds r1, r1, r5
	adds r0, r7, #0
	adds r1, r1, #4
	blx FUN_020B70A8
	ldr r0, [sp, #4]
	ldr r1, [r0]
	ldr r0, [r4]
	str r1, [r0, r5]
_0224B9BE:
	ldr r0, [sp, #0x10]
	adds r6, r6, #4
	adds r0, r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	ldr r1, [r0, #0x54]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	blt _0224B972
_0224B9D0:
	movs r0, #1
	str r0, [sp]
	movs r1, #6
	ldr r0, [sp, #4]
	lsls r1, r1, #6
	ldr r0, [r0, r1]
	movs r1, #0
	ldr r3, [sp, #0xc]
	adds r2, r1, #0
	bl FUN_02007C98
	adds r5, r0, #0
	ldr r0, [r4, #0x14]
	adds r1, r5, #0
	movs r2, #0
	bl FUN_020255C4
	ldr r1, [r4, #8]
	adds r0, r5, #0
	adds r1, r1, #4
	blx FUN_020B7140
	ldr r0, [sp, #4]
	ldr r1, [r0]
	ldr r0, [r4, #8]
	str r1, [r0]
	ldr r0, [r4, #8]
	movs r1, #3
	str r1, [r0, #8]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov41_0224B958

	thumb_func_start ov41_0224BA10
ov41_0224BA10: @ 0x0224BA10
	push {r3, r4, r5, lr}
	sub sp, #0x10
	movs r2, #2
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0xd
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r2, #1
	movs r0, #3
	movs r1, #0xe
	lsls r2, r2, #0x12
	bl FUN_0201A910
	movs r1, #0x1a
	adds r0, r4, #0
	lsls r1, r1, #4
	movs r2, #0xd
	bl FUN_02007280
	movs r2, #0x1a
	movs r1, #0
	lsls r2, r2, #4
	adds r5, r0, #0
	blx FUN_020E5B44
	ldr r0, _0224BAC4 @ =ov41_0224BBF0
	adds r1, r5, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	adds r0, r4, #0
	bl FUN_020072A4
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl FUN_0202B9B8
	str r0, [r5]
	ldr r0, [r4, #4]
	str r0, [r5, #8]
	ldr r0, [r4, #8]
	str r0, [r5, #0xc]
	bl ov41_02246130
	ldr r0, _0224BAC8 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	adds r0, r5, #0
	adds r0, #0x14
	movs r1, #0xe
	bl ov41_02246670
	ldr r0, [r5, #0x54]
	str r0, [sp]
	movs r0, #0x48
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	ldr r1, [r5]
	add r0, sp, #0
	bl ov41_0224B530
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl ov41_0224BC04
	adds r0, r5, #0
	bl ov41_0224BCA4
	adds r0, r5, #0
	bl ov41_0224BCF0
	adds r0, r5, #0
	bl ov41_0224BDCC
	adds r0, r5, #0
	bl ov41_0224BE5C
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0224BAC4: .4byte ov41_0224BBF0
_0224BAC8: .4byte 0x021D116C
	thumb_func_end ov41_0224BA10

	thumb_func_start ov41_0224BACC
ov41_0224BACC: @ 0x0224BACC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	bl FUN_02007290
	adds r5, r0, #0
	bl FUN_02026E48
	blx FUN_020B7350
	ldr r0, [r5, #0x10]
	bl ov41_0224B554
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
	adds r5, #0x14
	adds r0, r5, #0
	bl ov41_022466C8
	ldr r1, [r4]
	cmp r1, #5
	bhi _0224BB96
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224BB08: @ jump table
	.2byte _0224BB14 - _0224BB08 - 2 @ case 0
	.2byte _0224BB1A - _0224BB08 - 2 @ case 1
	.2byte _0224BB38 - _0224BB08 - 2 @ case 2
	.2byte _0224BB48 - _0224BB08 - 2 @ case 3
	.2byte _0224BB68 - _0224BB08 - 2 @ case 4
	.2byte _0224BB88 - _0224BB08 - 2 @ case 5
_0224BB14:
	adds r0, r1, #1
	str r0, [r4]
	b _0224BB96
_0224BB1A:
	movs r0, #6
	str r0, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r0, #0xd
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #5
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224BB96
_0224BB38:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0224BB96
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224BB96
_0224BB48:
	ldr r0, _0224BB9C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0224BB5A
	bl FUN_02025358
	cmp r0, #0
	beq _0224BB96
_0224BB5A:
	ldr r0, _0224BBA0 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224BB96
_0224BB68:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xd
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #2
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0224BB96
_0224BB88:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0224BB96
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_0224BB96:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0224BB9C: .4byte 0x021D110C
_0224BBA0: .4byte 0x000005DD
	thumb_func_end ov41_0224BACC

	thumb_func_start ov41_0224BBA4
ov41_0224BBA4: @ 0x0224BBA4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl ov41_0224B57C
	adds r0, r4, #0
	bl ov41_0224BD8C
	adds r0, r4, #0
	bl ov41_0224BE34
	adds r4, #0x14
	adds r0, r4, #0
	bl ov41_02246698
	bl ov41_02246150
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0xd
	bl FUN_0201A9C4
	movs r0, #0xe
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov41_0224BBA4

	thumb_func_start ov41_0224BBF0
ov41_0224BBF0: @ 0x0224BBF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl ov41_0224B5C8
	adds r4, #0x14
	adds r0, r4, #0
	bl ov41_022466B8
	pop {r4, pc}
	thumb_func_end ov41_0224BBF0

	thumb_func_start ov41_0224BC04
ov41_0224BC04: @ 0x0224BC04
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0x40
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r0, #0x65
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x7e
	movs r2, #0
	movs r3, #0x60
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	movs r0, #0x65
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x54]
	movs r1, #0x7d
	movs r3, #1
	bl FUN_02007B44
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0x1a
	movs r1, #0x80
	movs r2, #0
	add r3, sp, #0x10
	bl FUN_020079D8
	ldr r2, [sp, #0x10]
	movs r3, #0
	str r3, [sp]
	adds r4, r0, #0
	ldrh r0, [r2]
	movs r1, #1
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	adds r2, #0xc
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r5, #0x54]
	bl FUN_0201C4C4
	ldr r1, [sp, #0x10]
	movs r2, #0
	ldrh r0, [r1]
	adds r3, r2, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldrh r0, [r1, #2]
	movs r1, #1
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldr r0, [r5, #0x54]
	bl FUN_0201CA4C
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r5, #0x54]
	movs r1, #1
	bl FUN_0201EFBC
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov41_0224BC04

	thumb_func_start ov41_0224BCA4
ov41_0224BCA4: @ 0x0224BCA4
	push {r4, lr}
	sub sp, #0x10
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r0, #0xef
	movs r2, #4
	adds r3, r1, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x54]
	movs r0, #0xef
	movs r1, #9
	movs r3, #4
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x54]
	movs r0, #0xef
	movs r1, #1
	movs r3, #4
	bl FUN_020078F0
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov41_0224BCA4

	thumb_func_start ov41_0224BCF0
ov41_0224BCF0: @ 0x0224BCF0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0xfa
	lsls r0, r0, #2
	movs r1, #0x65
	str r0, [sp, #4]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0x14
	movs r2, #0xe9
	movs r3, #0
	bl ov41_022462E4
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0xfa
	lsls r0, r0, #2
	movs r1, #0x65
	str r0, [sp, #8]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0x14
	movs r2, #0xea
	movs r3, #0
	bl ov41_02246304
	movs r0, #0xfa
	lsls r0, r0, #2
	movs r1, #0x65
	str r0, [sp]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0x14
	movs r2, #0xe8
	movs r3, #0
	bl ov41_02246328
	movs r0, #0xfa
	lsls r0, r0, #2
	movs r1, #0x65
	str r0, [sp]
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0x14
	movs r2, #0xe7
	movs r3, #0
	bl ov41_02246344
	movs r0, #0x64
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0xfa
	adds r0, #0x14
	lsls r1, r1, #2
	movs r2, #0
	movs r3, #0x90
	bl ov41_02246280
	movs r1, #0x66
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_02024A04
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov41_0224BCF0

	thumb_func_start ov41_0224BD8C
ov41_0224BD8C: @ 0x0224BD8C
	push {r4, lr}
	movs r1, #0xfa
	adds r4, r0, #0
	adds r0, #0x14
	lsls r1, r1, #2
	bl ov41_02246360
	adds r0, r4, #0
	movs r1, #0xfa
	adds r0, #0x14
	lsls r1, r1, #2
	bl ov41_02246374
	adds r0, r4, #0
	movs r1, #0xfa
	adds r0, #0x14
	lsls r1, r1, #2
	bl ov41_02246388
	adds r0, r4, #0
	movs r1, #0xfa
	adds r0, #0x14
	lsls r1, r1, #2
	bl ov41_0224639C
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024758
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224BD8C

	thumb_func_start ov41_0224BDCC
ov41_0224BDCC: @ 0x0224BDCC
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #0xe
	movs r1, #1
	bl FUN_0201D39C
	movs r1, #0x67
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x54]
	ldr r1, [r4, r1]
	movs r2, #3
	movs r3, #0
	bl FUN_0201D40C
	movs r0, #0
	movs r1, #0xa0
	movs r2, #0xe
	bl FUN_02003030
	movs r0, #3
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #0
	movs r1, #2
	bl FUN_0201BB68
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r1, #3
	ldr r0, [r4, #0x54]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224BDCC

	thumb_func_start ov41_0224BE34
ov41_0224BE34: @ 0x0224BE34
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201D8C8
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201D520
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0201D54C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224BE34

	thumb_func_start ov41_0224BE5C
ov41_0224BE5C: @ 0x0224BE5C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	bl ov41_0224BE80
	movs r0, #0x67
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201D578
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov41_0224BE5C

	thumb_func_start ov41_0224BE80
ov41_0224BE80: @ 0x0224BE80
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xd7
	movs r3, #0xd
	bl FUN_0200BAF8
	str r0, [sp, #0x10]
	cmp r0, #0
	bne _0224BE9C
	bl GF_AssertFail
_0224BE9C:
	movs r0, #0xd
	bl FUN_0200BD08
	adds r6, r0, #0
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #5
	bl FUN_020248F0
	movs r0, #3
	lsls r0, r0, #0x10
	str r0, [sp, #0x14]
	movs r0, #9
	lsls r0, r0, #0x10
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0x14
	bl FUN_020247D4
	movs r0, #0xc
	movs r1, #0xd
	bl FUN_02026354
	adds r7, r0, #0
	ldr r0, [r5]
	adds r1, r7, #0
	bl FUN_0202BE60
	movs r0, #0
	adds r1, r7, #0
	adds r2, r0, #0
	bl FUN_02002F30
	adds r4, r0, #0
	movs r0, #7
	str r0, [sp]
	movs r1, #0
	lsrs r3, r4, #0x1f
	adds r3, r4, r3
	asrs r4, r3, #1
	movs r3, #0x80
	ldr r0, _0224BF90 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x67
	str r1, [sp, #0xc]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r7, #0
	subs r3, r3, r4
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	ldr r0, [r5]
	bl FUN_0202BE98
	adds r2, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0200C528
	movs r0, #0xc8
	movs r1, #0xd
	bl FUN_02026354
	adds r4, r0, #0
	ldr r0, [sp, #0x10]
	movs r1, #0x2d
	bl FUN_0200BBA0
	adds r7, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r0, #0x1b
	str r0, [sp]
	movs r1, #0
	ldr r0, _0224BF90 @ =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x67
	str r1, [sp, #0xc]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	lsrs r5, r3, #0x1f
	adds r5, r3, r5
	asrs r5, r5, #1
	movs r3, #0x80
	adds r2, r4, #0
	subs r3, r3, r5
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
	ldr r0, [sp, #0x10]
	bl FUN_0200BB44
	adds r0, r6, #0
	bl FUN_0200BDA0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224BF90: .4byte 0x00010200
	thumb_func_end ov41_0224BE80

	.rodata

_0224BF94:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0xCE, 0x02, 0x00, 0x00, 0x76, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6F, 0xFF, 0xFF, 0xFF, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0E, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
