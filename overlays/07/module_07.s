
	thumb_func_start ov07_0221BE20
ov07_0221BE20: @ 0x0221BE20
	adds r1, r0, #0
	adds r1, #0x8d
	ldrb r1, [r1]
	cmp r1, #0
	bne _0221BE32
	ldr r1, _0221BE40 @ =ov07_0221BE44
	adds r0, #0xbc
	str r1, [r0]
	bx lr
_0221BE32:
	adds r1, r0, #0
	adds r1, #0x8d
	ldrb r1, [r1]
	adds r0, #0x8d
	subs r1, r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0221BE40: .4byte ov07_0221BE44
	thumb_func_end ov07_0221BE20

	thumb_func_start ov07_0221BE44
ov07_0221BE44: @ 0x0221BE44
	push {r4, lr}
	adds r4, r0, #0
_0221BE48:
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	bl ov07_0221F8B0
	adds r1, r0, #0
	adds r0, r4, #0
	blx r1
	adds r0, r4, #0
	adds r0, #0x8d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0221BE66
	ldr r0, [r4, #0x10]
	cmp r0, #1
	beq _0221BE48
_0221BE66:
	pop {r4, pc}
	thumb_func_end ov07_0221BE44

	thumb_func_start ov07_0221BE68
ov07_0221BE68: @ 0x0221BE68
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	adds r4, r3, #0
	cmp r0, #1
	beq _0221BE78
	cmp r0, #2
	beq _0221BE86
	b _0221BE94
_0221BE78:
	adds r0, r1, #0
	adds r0, #0x8e
	ldrh r0, [r0]
	adds r1, #0x8e
	adds r0, r0, #1
	strh r0, [r1]
	b _0221BE98
_0221BE86:
	adds r0, r1, #0
	adds r0, #0x90
	ldrh r0, [r0]
	adds r1, #0x90
	adds r0, r0, #1
	strh r0, [r1]
	b _0221BE98
_0221BE94:
	bl GF_AssertFail
_0221BE98:
	ldr r2, [sp, #0x10]
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221BE68

	thumb_func_start ov07_0221BEA4
ov07_0221BEA4: @ 0x0221BEA4
	push {r4, lr}
	adds r4, r2, #0
	cmp r0, #1
	beq _0221BEB2
	cmp r0, #2
	beq _0221BEC0
	b _0221BECE
_0221BEB2:
	adds r0, r1, #0
	adds r0, #0x8e
	ldrh r0, [r0]
	adds r1, #0x8e
	subs r0, r0, #1
	strh r0, [r1]
	b _0221BED2
_0221BEC0:
	adds r0, r1, #0
	adds r0, #0x90
	ldrh r0, [r0]
	adds r1, #0x90
	subs r0, r0, #1
	strh r0, [r1]
	b _0221BED2
_0221BECE:
	bl GF_AssertFail
_0221BED2:
	adds r0, r4, #0
	bl FUN_0200E390
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_0221BEA4

	thumb_func_start ov07_0221BEDC
ov07_0221BEDC: @ 0x0221BEDC
	push {r3, r4, r5, lr}
	movs r1, #0x72
	lsls r1, r1, #2
	adds r5, r0, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _0221BEF8
	cmp r4, #0
	bne _0221BEF4
	bl GF_AssertFail
_0221BEF4:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221BEF8:
	movs r2, #0x72
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	movs r1, #0x47
	str r5, [r4]
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r4]
	lsls r1, r1, #2
	bl FUN_0201AA8C
	adds r1, r4, #0
	adds r1, #0xc0
	str r0, [r1]
	movs r0, #7
	adds r1, r5, #0
	bl FUN_02007688
	movs r1, #0x1b
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #8
	adds r1, r5, #0
	bl FUN_02007688
	movs r1, #0x6d
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x16
	adds r1, r5, #0
	bl FUN_02007688
	movs r1, #0x6e
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x17
	adds r1, r5, #0
	bl FUN_02007688
	movs r1, #0x6f
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x18
	adds r1, r5, #0
	bl FUN_02007688
	movs r1, #7
	lsls r1, r1, #6
	str r0, [r4, r1]
	movs r0, #0x19
	adds r1, r5, #0
	bl FUN_02007688
	movs r2, #0x71
	lsls r2, r2, #2
	str r0, [r4, r2]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	cmp r0, #0
	bne _0221BF80
	bne _0221BF7C
	bl GF_AssertFail
_0221BF7C:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221BF80:
	movs r1, #0
	subs r2, #0xa8
	blx FUN_020E5B44
	movs r1, #0
	str r1, [r4, #0xc]
	str r1, [r4, #0x18]
	adds r2, r4, #0
	adds r3, r1, #0
_0221BF92:
	adds r0, r2, #0
	adds r0, #0xcc
	adds r1, r1, #1
	adds r2, r2, #4
	str r3, [r0]
	cmp r1, #4
	blt _0221BF92
	movs r0, #0x59
	adds r2, r4, #0
	movs r1, #0
	lsls r0, r0, #2
_0221BFA8:
	adds r3, r3, #1
	str r1, [r2, r0]
	adds r2, r2, #4
	cmp r3, #5
	blt _0221BFA8
	movs r0, #0x5e
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221BEDC

	thumb_func_start ov07_0221BFC0
ov07_0221BFC0: @ 0x0221BFC0
	push {r4, lr}
	adds r4, r0, #0
	bne _0221BFCA
	bl GF_AssertFail
_0221BFCA:
	ldr r0, [r4, #8]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_0221BFC0

	thumb_func_start ov07_0221BFD0
ov07_0221BFD0: @ 0x0221BFD0
	push {r4, lr}
	adds r4, r0, #0
	bne _0221BFDA
	bl GF_AssertFail
_0221BFDA:
	ldr r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_0221BFD0

	thumb_func_start ov07_0221BFE0
ov07_0221BFE0: @ 0x0221BFE0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl ov07_0221C3DC
	cmp r0, #0
	bne _0221BFF0
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221BFF0:
	movs r6, #0x1b
	movs r4, #0
	adds r5, r7, #0
	lsls r6, r6, #4
_0221BFF8:
	ldr r0, [r5, r6]
	bl FUN_0200770C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _0221BFF8
	adds r0, r7, #0
	adds r0, #0xc0
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r0, r7, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0221BFE0

	thumb_func_start ov07_0221C01C
ov07_0221C01C: @ 0x0221C01C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	adds r4, r0, #0
	adds r5, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl ov07_0221C69C
	adds r0, r4, #0
	bl ov07_0221C3DC
	cmp r0, #0
	bne _0221C03C
	add sp, #0x6c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0221C03C:
	movs r3, #0
	movs r2, #1
	adds r1, r3, #0
_0221C042:
	adds r0, r4, r3
	adds r0, #0x6c
	strb r2, [r0]
	adds r0, r4, r3
	adds r0, #0x7c
	adds r3, r3, #1
	strb r1, [r0]
	cmp r3, #0x10
	blt _0221C042
	adds r3, r4, #0
	movs r0, #0
_0221C058:
	adds r2, r3, #0
	adds r2, #0x94
	adds r1, r1, #1
	adds r3, r3, #4
	str r0, [r2]
	cmp r1, #0xa
	blt _0221C058
	adds r3, r4, #0
	movs r2, #0
_0221C06A:
	str r2, [r3, #0x30]
	adds r1, r3, #0
	str r2, [r3, #0x28]
	adds r1, #0x2c
	strb r2, [r1]
	adds r1, r3, #0
	adds r1, #0x2d
	adds r0, r0, #1
	adds r3, #0xc
	strb r2, [r1]
	cmp r0, #3
	blt _0221C06A
	adds r0, r4, #0
	adds r0, #0xc0
	ldrb r1, [r5]
	ldr r0, [r0]
	movs r3, #1
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc0
	ldrb r1, [r5, #1]
	ldr r0, [r0]
	strb r1, [r0, #1]
	adds r0, r4, #0
	adds r0, #0xc0
	ldrh r1, [r5, #2]
	ldr r0, [r0]
	strh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, [r5, #4]
	ldr r0, [r0]
	str r1, [r0, #4]
	adds r0, r4, #0
	adds r0, #0xc0
	ldrh r1, [r5, #8]
	ldr r0, [r0]
	strh r1, [r0, #8]
	adds r0, r4, #0
	adds r0, #0xc0
	ldrh r1, [r5, #0xc]
	ldr r0, [r0]
	strh r1, [r0, #0xa]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, [r5, #0x10]
	ldr r0, [r0]
	str r1, [r0, #0xc]
	adds r0, r4, #0
	adds r0, #0xc0
	ldrh r1, [r5, #0xa]
	ldr r0, [r0]
	strh r1, [r0, #0x10]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, [r5, #0x54]
	ldr r0, [r0]
	strh r1, [r0, #0x12]
	adds r0, r4, #0
	adds r0, #0xc0
	ldrh r1, [r5, #0x14]
	ldr r0, [r0]
	strh r1, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0xc0
	ldrh r1, [r5, #0x16]
	ldr r0, [r0]
	strh r1, [r0, #0x16]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r2, [r0]
	movs r0, #0x46
	lsls r0, r0, #2
	ldr r1, [r2, r0]
	bics r1, r3
	ldrh r3, [r5, #0xe]
	lsls r3, r3, #0x1e
	lsrs r6, r3, #0x1f
	movs r3, #1
	ands r3, r6
	orrs r1, r3
	str r1, [r2, r0]
	adds r1, r4, #0
	adds r1, #0xc0
	ldr r2, [r1]
	movs r3, #2
	ldr r1, [r2, r0]
	bics r1, r3
	ldrh r3, [r5, #0xe]
	lsls r3, r3, #0x1d
	lsrs r3, r3, #0x1f
	lsls r3, r3, #0x1f
	lsrs r3, r3, #0x1e
	orrs r1, r3
	str r1, [r2, r0]
	adds r1, r4, #0
	adds r1, #0xc0
	ldr r2, [r1]
	movs r3, #4
	ldr r1, [r2, r0]
	bics r1, r3
	ldrh r3, [r5, #0xe]
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1f
	lsls r3, r3, #0x1f
	lsrs r3, r3, #0x1d
	orrs r1, r3
	str r1, [r2, r0]
	ldr r0, [sp, #4]
	ldr r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, #0xac
	str r1, [r0]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	cmp r0, #0
	bne _0221C15C
	bl GF_AssertFail
_0221C15C:
	ldr r0, [sp, #4]
	movs r2, #0
	ldr r1, [r0, #4]
	adds r0, r4, #0
	adds r0, #0xc4
	str r1, [r0]
	ldr r0, [sp, #4]
	adds r7, r2, #0
	ldr r1, [r0, #8]
	adds r0, r4, #0
	adds r0, #0xc8
	str r1, [r0]
	ldr r0, [sp, #4]
	ldr r1, [r0, #0x30]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, #0xd4
	str r1, [r0]
	ldr r0, [sp, #4]
	adds r1, r2, #0
	adds r3, r0, #0
	mov ip, r3
_0221C18A:
	adds r5, r4, #0
	adds r5, #0xc0
	ldr r5, [r5]
	ldr r3, [r0, #0xc]
	adds r5, r5, r1
	adds r5, #0xb0
	str r3, [r5]
	ldr r3, [sp, #4]
	adds r5, r4, #0
	adds r5, #0xc0
	adds r6, r3, r2
	ldr r5, [r5]
	ldrb r3, [r6, #0x1c]
	adds r5, r5, r2
	adds r5, #0xc0
	strb r3, [r5]
	adds r5, r4, #0
	adds r5, #0xc0
	ldr r5, [r5]
	ldr r3, [r0, #0x20]
	adds r5, r5, r1
	adds r5, #0xc4
	str r3, [r5]
	adds r5, r4, #0
	adds r5, #0xc0
	mov r3, ip
	ldr r5, [r5]
	ldrh r3, [r3, #0x34]
	adds r5, r5, r7
	adds r5, #0xd8
	strh r3, [r5]
	adds r5, r4, #0
	adds r3, r6, #0
	adds r5, #0xc0
	adds r3, #0x3c
	ldr r5, [r5]
	ldrb r3, [r3]
	adds r5, r5, r2
	adds r5, #0xe0
	strb r3, [r5]
	adds r3, r6, #0
	adds r5, r4, #0
	adds r5, #0xc0
	adds r3, #0x40
	ldr r5, [r5]
	ldrb r3, [r3]
	adds r5, r5, r2
	adds r5, #0xe4
	strb r3, [r5]
	adds r5, r4, #0
	adds r5, #0xc0
	adds r6, #0x44
	ldr r5, [r5]
	ldrb r3, [r6]
	adds r5, r5, r2
	adds r5, #0xe8
	strb r3, [r5]
	adds r5, r4, #0
	adds r5, #0xc0
	ldr r5, [r5]
	ldr r3, [r0, #0x48]
	adds r5, r5, r1
	adds r5, #0xec
	str r3, [r5]
	adds r5, r4, #0
	adds r5, #0xc0
	ldr r5, [r5]
	ldr r3, [r0, #0x58]
	adds r5, r5, r1
	adds r5, #0xfc
	str r3, [r5]
	mov r3, ip
	adds r3, r3, #2
	adds r2, r2, #1
	adds r0, r0, #4
	adds r1, r1, #4
	adds r7, r7, #2
	mov ip, r3
	cmp r2, #4
	blt _0221C18A
	ldr r5, [sp, #4]
	movs r2, #0x19
	lsls r2, r2, #4
	adds r5, #0x6c
	adds r3, r4, r2
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [sp, #4]
	adds r0, #0x84
	ldr r3, [r0]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, [r0]
	adds r0, r2, #0
	subs r0, #0x84
	str r3, [r1, r0]
	ldr r0, [sp, #4]
	adds r0, #0x8c
	ldr r3, [r0]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, [r0]
	adds r0, r2, #0
	subs r0, #0x7c
	str r3, [r1, r0]
	ldr r0, [sp, #4]
	adds r0, #0x88
	ldr r3, [r0]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, [r0]
	adds r0, r2, #0
	subs r0, #0x80
	str r3, [r1, r0]
	ldr r0, [sp]
	subs r2, #0x6e
	cmp r0, r2
	bne _0221C2AA
	ldr r5, _0221C37C @ =0x02234C64
	add r3, sp, #8
	movs r2, #0xc
_0221C284:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0221C284
	ldr r0, [r5]
	str r0, [r3]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #0x12]
	cmp r0, #0x18
	blo _0221C2A2
	movs r0, #0xa1
	str r0, [sp]
	b _0221C2AA
_0221C2A2:
	lsls r1, r0, #2
	add r0, sp, #8
	ldr r0, [r0, r1]
	str r0, [sp]
_0221C2AA:
	ldr r0, [sp]
	cmp r0, #0
	beq _0221C2B6
	ldr r1, _0221C380 @ =0x000001D3
	cmp r0, r1
	ble _0221C2BA
_0221C2B6:
	movs r0, #1
	str r0, [sp]
_0221C2BA:
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x68]
	str r0, [r4, #4]
	ldr r1, [sp]
	ldr r2, [r4]
	bl FUN_02007524
	str r0, [r4, #0x14]
	cmp r0, #0
	bne _0221C2DA
	bne _0221C2D4
	bl GF_AssertFail
_0221C2D4:
	add sp, #0x6c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0221C2DA:
	str r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0201CC2C
	movs r1, #0x6b
	lsls r1, r1, #2
	strb r0, [r4, r1]
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0201CC2C
	ldr r1, _0221C384 @ =0x000001AD
	strb r0, [r4, r1]
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0201CC2C
	ldr r1, _0221C388 @ =0x000001AE
	strb r0, [r4, r1]
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0201CC2C
	ldr r1, _0221C38C @ =0x000001AF
	movs r2, #0
	strb r0, [r4, r1]
	adds r1, r4, #0
	adds r5, r2, #0
_0221C324:
	adds r0, r1, #0
	adds r0, #0xdc
	adds r2, r2, #1
	adds r1, r1, #4
	str r5, [r0]
	cmp r2, #0xa
	blt _0221C324
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r1, r0, #0
	adds r2, r4, #0
	movs r3, #0
	adds r1, #0x14
_0221C33E:
	str r3, [r2, r0]
	str r3, [r2, r1]
	adds r5, r5, #1
	adds r2, r2, #4
	cmp r5, #5
	blt _0221C33E
	movs r0, #6
	adds r1, r4, #0
	movs r2, #0
	lsls r0, r0, #6
_0221C352:
	adds r3, r3, #1
	str r2, [r1, r0]
	adds r1, r1, #4
	cmp r3, #4
	blt _0221C352
	adds r0, r4, #0
	ldr r1, _0221C390 @ =ov07_0221BE44
	adds r0, #0xbc
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x8d
	movs r1, #0xff
	strb r2, [r0]
	adds r0, r1, #0
	adds r0, #0xa9
	str r1, [r4, r0]
	movs r0, #1
	str r0, [r4, #0x10]
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	nop
_0221C37C: .4byte 0x02234C64
_0221C380: .4byte 0x000001D3
_0221C384: .4byte 0x000001AD
_0221C388: .4byte 0x000001AE
_0221C38C: .4byte 0x000001AF
_0221C390: .4byte ov07_0221BE44
	thumb_func_end ov07_0221C01C

	thumb_func_start ov07_0221C394
ov07_0221C394: @ 0x0221C394
	push {r4, lr}
	adds r4, r0, #0
	bl ov07_0221C3DC
	cmp r0, #0
	bne _0221C3A4
	movs r0, #0
	pop {r4, pc}
_0221C3A4:
	adds r0, r4, #0
	adds r4, #0xbc
	ldr r1, [r4]
	blx r1
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov07_0221C394

	thumb_func_start ov07_0221C3B0
ov07_0221C3B0: @ 0x0221C3B0
	ldr r0, [r0, #0x10]
	cmp r0, #1
	bne _0221C3BA
	movs r0, #1
	bx lr
_0221C3BA:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221C3B0

	thumb_func_start ov07_0221C3C0
ov07_0221C3C0: @ 0x0221C3C0
	push {r3, lr}
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0221C3D2
	bne _0221C3CE
	bl GF_AssertFail
_0221C3CE:
	movs r0, #0
	pop {r3, pc}
_0221C3D2:
	bl FUN_0201AB0C
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov07_0221C3C0

	thumb_func_start ov07_0221C3DC
ov07_0221C3DC: @ 0x0221C3DC
	cmp r0, #0
	bne _0221C3E4
	movs r0, #0
	bx lr
_0221C3E4:
	ldr r0, [r0, #0xc]
	cmp r0, #1
	bne _0221C3EE
	movs r0, #1
	bx lr
_0221C3EE:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221C3DC

	thumb_func_start ov07_0221C3F4
ov07_0221C3F4: @ 0x0221C3F4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	str r3, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl ov07_0221BE68
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov07_0221C3F4

	thumb_func_start ov07_0221C410
ov07_0221C410: @ 0x0221C410
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0221C428 @ =0x0000044C
	adds r4, r1, #0
	adds r3, r2, #0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl ov07_0221BE68
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221C428: .4byte 0x0000044C
	thumb_func_end ov07_0221C410

	thumb_func_start ov07_0221C42C
ov07_0221C42C: @ 0x0221C42C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	str r3, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl ov07_0221BE68
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov07_0221C42C

	thumb_func_start ov07_0221C448
ov07_0221C448: @ 0x0221C448
	adds r3, r0, #0
	adds r2, r1, #0
	adds r1, r3, #0
	ldr r3, _0221C454 @ =ov07_0221BEA4
	movs r0, #1
	bx r3
	.align 2, 0
_0221C454: .4byte ov07_0221BEA4
	thumb_func_end ov07_0221C448

	thumb_func_start ov07_0221C458
ov07_0221C458: @ 0x0221C458
	adds r3, r0, #0
	adds r2, r1, #0
	adds r1, r3, #0
	ldr r3, _0221C464 @ =ov07_0221BEA4
	movs r0, #2
	bx r3
	.align 2, 0
_0221C464: .4byte ov07_0221BEA4
	thumb_func_end ov07_0221C458

	thumb_func_start ov07_0221C468
ov07_0221C468: @ 0x0221C468
	adds r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #0x14]
	bx lr
	thumb_func_end ov07_0221C468

	thumb_func_start ov07_0221C470
ov07_0221C470: @ 0x0221C470
	adds r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #0x16]
	bx lr
	thumb_func_end ov07_0221C470

	thumb_func_start ov07_0221C478
ov07_0221C478: @ 0x0221C478
	adds r0, #0xc0
	ldr r1, [r0]
	ldr r0, [r1, #0x18]
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r0, [r0, #0x1c]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221C478

	thumb_func_start ov07_0221C488
ov07_0221C488: @ 0x0221C488
	adds r0, #0xc0
	ldr r2, [r0]
	lsls r0, r1, #2
	adds r0, r2, r0
	ldr r0, [r0, #0x1c]
	bx lr
	thumb_func_end ov07_0221C488

	thumb_func_start ov07_0221C494
ov07_0221C494: @ 0x0221C494
	adds r0, #0xc0
	ldr r2, [r0]
	lsls r0, r1, #2
	adds r0, r2, r0
	ldr r0, [r0, #0x5c]
	bx lr
	thumb_func_end ov07_0221C494

	thumb_func_start ov07_0221C4A0
ov07_0221C4A0: @ 0x0221C4A0
	adds r0, #0xc4
	ldr r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221C4A0

	thumb_func_start ov07_0221C4A8
ov07_0221C4A8: @ 0x0221C4A8
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0xa
	blt _0221C4B6
	bl GF_AssertFail
_0221C4B6:
	lsls r0, r5, #2
	adds r0, r4, r0
	adds r0, #0x94
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221C4A8

	thumb_func_start ov07_0221C4C0
ov07_0221C4C0: @ 0x0221C4C0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0xa
	blt _0221C4CE
	bl GF_AssertFail
_0221C4CE:
	cmp r5, #0
	bne _0221C4D6
	bl GF_AssertFail
_0221C4D6:
	adds r5, #0xdc
	lsls r4, r4, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	bne _0221C4E4
	bl GF_AssertFail
_0221C4E4:
	ldr r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221C4C0

	thumb_func_start ov07_0221C4E8
ov07_0221C4E8: @ 0x0221C4E8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #5
	blt _0221C4F6
	bl GF_AssertFail
_0221C4F6:
	cmp r5, #0
	bne _0221C4FE
	bl GF_AssertFail
_0221C4FE:
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r5, r5, r0
	lsls r4, r4, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	bne _0221C510
	bl GF_AssertFail
_0221C510:
	ldr r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221C4E8

	thumb_func_start ov07_0221C514
ov07_0221C514: @ 0x0221C514
	push {r4, lr}
	adds r4, r0, #0
	bne _0221C51E
	bl GF_AssertFail
_0221C51E:
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_0221C514

	thumb_func_start ov07_0221C528
ov07_0221C528: @ 0x0221C528
	adds r0, #0xcc
	ldr r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221C528

	thumb_func_start ov07_0221C530
ov07_0221C530: @ 0x0221C530
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, #0xac
	ldr r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221C530

	thumb_func_start ov07_0221C53C
ov07_0221C53C: @ 0x0221C53C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0x3c
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _0221C554
	bl GF_AssertFail
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221C554:
	movs r1, #0
	movs r2, #0x3c
	blx FUN_020E5B44
	adds r0, r5, #0
	adds r0, #0x90
	ldrh r0, [r0]
	adds r5, #0x90
	adds r0, r0, #1
	strh r0, [r5]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221C53C

	thumb_func_start ov07_0221C56C
ov07_0221C56C: @ 0x0221C56C
	ldr r3, _0221C578 @ =FUN_0200E320
	str r0, [r1, #0x38]
	ldr r0, _0221C57C @ =ov07_0221C584
	ldr r2, _0221C580 @ =0x0000044C
	bx r3
	nop
_0221C578: .4byte FUN_0200E320
_0221C57C: .4byte ov07_0221C584
_0221C580: .4byte 0x0000044C
	thumb_func_end ov07_0221C56C

	thumb_func_start ov07_0221C584
ov07_0221C584: @ 0x0221C584
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldrb r1, [r4]
	adds r5, r0, #0
	adds r0, r4, #0
	lsls r2, r1, #2
	ldr r1, _0221C5C0 @ =0x02234C08
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #0
	bne _0221C5BE
	ldr r0, [r4, #0x38]
	adds r1, r0, #0
	adds r1, #0x90
	ldrh r1, [r1]
	cmp r1, #0
	beq _0221C5B2
	adds r1, r0, #0
	adds r1, #0x90
	ldrh r1, [r1]
	adds r0, #0x90
	subs r1, r1, #1
	strh r1, [r0]
_0221C5B2:
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
_0221C5BE:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221C5C0: .4byte 0x02234C08
	thumb_func_end ov07_0221C584

	thumb_func_start ov07_0221C5C4
ov07_0221C5C4: @ 0x0221C5C4
	movs r0, #0
	bx lr
	thumb_func_end ov07_0221C5C4

	thumb_func_start ov07_0221C5C8
ov07_0221C5C8: @ 0x0221C5C8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r1, [r5, #4]
	adds r0, r1, #1
	strb r0, [r5, #4]
	ldrb r0, [r5, #3]
	cmp r1, r0
	bhs _0221C5DC
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221C5DC:
	movs r0, #0
	strb r0, [r5, #4]
	ldr r2, [r5, #0x14]
	ldr r1, [r5, #0x10]
	movs r4, #1
	adds r1, r2, r1
	str r1, [r5, #0x14]
	ldr r1, [r5, #0x10]
	cmp r1, #0
	bne _0221C5F4
	adds r4, r0, #0
	b _0221C60C
_0221C5F4:
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	cmp r1, r2
	ldr r1, [r5, #0x14]
	bge _0221C606
	cmp r1, r2
	blt _0221C60C
	adds r4, r0, #0
	b _0221C60C
_0221C606:
	cmp r1, r2
	bgt _0221C60C
	adds r4, r0, #0
_0221C60C:
	ldr r0, [r5, #0x14]
	bl FUN_020061EC
	ldrh r0, [r5, #0x1a]
	bl FUN_02006184
	cmp r0, #0
	bne _0221C61E
	movs r4, #0
_0221C61E:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0221C5C8

	thumb_func_start ov07_0221C624
ov07_0221C624: @ 0x0221C624
	ldr r3, _0221C628 @ =ov07_0221C5C8
	bx r3
	.align 2, 0
_0221C628: .4byte ov07_0221C5C8
	thumb_func_end ov07_0221C624

	thumb_func_start ov07_0221C62C
ov07_0221C62C: @ 0x0221C62C
	ldr r3, _0221C630 @ =ov07_0221C5C8
	bx r3
	.align 2, 0
_0221C630: .4byte ov07_0221C5C8
	thumb_func_end ov07_0221C62C

	thumb_func_start ov07_0221C634
ov07_0221C634: @ 0x0221C634
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r1, [r5, #4]
	adds r0, r1, #1
	strb r0, [r5, #4]
	ldrb r0, [r5, #3]
	cmp r1, r0
	bhs _0221C648
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221C648:
	movs r0, #0
	strb r0, [r5, #4]
	ldrb r0, [r5, #0x18]
	movs r4, #1
	subs r0, r0, #1
	strb r0, [r5, #0x18]
	ldrh r0, [r5, #0x1a]
	bl FUN_0200604C
	ldrh r0, [r5, #0x1a]
	ldr r1, _0221C670 @ =0x0000FFFF
	ldr r2, [r5, #0x14]
	bl FUN_020061B4
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne _0221C66C
	movs r4, #0
_0221C66C:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221C670: .4byte 0x0000FFFF
	thumb_func_end ov07_0221C634

	thumb_func_start ov07_0221C674
ov07_0221C674: @ 0x0221C674
	push {r4, lr}
	adds r4, r0, #0
	ldrb r2, [r4, #3]
	movs r0, #1
	subs r1, r2, #1
	strb r1, [r4, #3]
	cmp r2, #0
	bne _0221C696
	ldrh r0, [r4, #0x1a]
	bl FUN_0200604C
	ldrh r0, [r4, #0x1a]
	ldr r1, _0221C698 @ =0x0000FFFF
	ldr r2, [r4, #0x14]
	bl FUN_020061B4
	movs r0, #0
_0221C696:
	pop {r4, pc}
	.align 2, 0
_0221C698: .4byte 0x0000FFFF
	thumb_func_end ov07_0221C674

	thumb_func_start ov07_0221C69C
ov07_0221C69C: @ 0x0221C69C
	push {r3, lr}
	ldr r0, _0221C6B0 @ =0x04000050
	movs r3, #8
	movs r1, #0
	movs r2, #0x3f
	str r3, [sp]
	blx FUN_020CF15C
	pop {r3, pc}
	nop
_0221C6B0: .4byte 0x04000050
	thumb_func_end ov07_0221C69C

	thumb_func_start ov07_0221C6B4
ov07_0221C6B4: @ 0x0221C6B4
	push {r3, r4}
	adds r2, r0, #0
	movs r1, #1
	adds r2, #0x8d
	strb r1, [r2]
	ldr r3, _0221C6E8 @ =0x021D110C
	lsls r2, r1, #9
	ldr r4, [r3, #0x44]
	tst r2, r4
	beq _0221C6E4
	adds r2, r1, #0
	adds r2, #0xff
	tst r2, r4
	beq _0221C6E4
	ldr r2, [r3, #0x48]
	lsls r1, r1, #0xa
	tst r1, r2
	beq _0221C6E4
	ldr r1, [r0, #0x18]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	movs r1, #0
	adds r0, #0x8d
	strb r1, [r0]
_0221C6E4:
	pop {r3, r4}
	bx lr
	.align 2, 0
_0221C6E8: .4byte 0x021D110C
	thumb_func_end ov07_0221C6B4

	thumb_func_start ov07_0221C6EC
ov07_0221C6EC: @ 0x0221C6EC
	ldr r1, [r0, #0x18]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	adds r1, r0, #0
	adds r1, #0x8d
	strb r2, [r1]
	ldr r1, [r0, #0x18]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r1, _0221C708 @ =ov07_0221BE20
	adds r0, #0xbc
	str r1, [r0]
	bx lr
	.align 2, 0
_0221C708: .4byte ov07_0221BE20
	thumb_func_end ov07_0221C6EC

	thumb_func_start ov07_0221C70C
ov07_0221C70C: @ 0x0221C70C
	adds r1, r0, #0
	adds r1, #0x8e
	ldrh r1, [r1]
	cmp r1, #0
	bne _0221C724
	ldr r1, [r0, #0x18]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	movs r1, #0
	adds r0, #0x8d
	strb r1, [r0]
	bx lr
_0221C724:
	movs r1, #1
	adds r0, #0x8d
	strb r1, [r0]
	bx lr
	thumb_func_end ov07_0221C70C

	thumb_func_start ov07_0221C72C
ov07_0221C72C: @ 0x0221C72C
	ldr r1, [r0, #0x18]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r3, [r1]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	cmp r3, #0xa
	bhs _0221C74A
	lsls r1, r3, #2
	adds r0, r0, r1
	adds r0, #0x94
	str r2, [r0]
_0221C74A:
	bx lr
	thumb_func_end ov07_0221C72C

	thumb_func_start ov07_0221C74C
ov07_0221C74C: @ 0x0221C74C
	ldr r1, [r0, #0x18]
	movs r3, #0
	adds r1, r1, #4
	str r1, [r0, #0x18]
	adds r2, r3, #0
_0221C756:
	adds r1, r0, #0
	adds r1, #0x94
	adds r3, r3, #1
	adds r0, r0, #4
	str r2, [r1]
	cmp r3, #0xa
	blt _0221C756
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221C74C

	thumb_func_start ov07_0221C768
ov07_0221C768: @ 0x0221C768
	cmp r1, #5
	bhi _0221C7B4
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0221C778: @ jump table
	.2byte _0221C784 - _0221C778 - 2 @ case 0
	.2byte _0221C78C - _0221C778 - 2 @ case 1
	.2byte _0221C794 - _0221C778 - 2 @ case 2
	.2byte _0221C79C - _0221C778 - 2 @ case 3
	.2byte _0221C7A4 - _0221C778 - 2 @ case 4
	.2byte _0221C7AC - _0221C778 - 2 @ case 5
_0221C784:
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bx lr
_0221C78C:
	adds r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	bx lr
_0221C794:
	adds r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #0xa]
	bx lr
_0221C79C:
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bx lr
_0221C7A4:
	adds r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #0x10]
	bx lr
_0221C7AC:
	adds r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #0x12]
	bx lr
_0221C7B4:
	movs r0, #0
	bx lr
	thumb_func_end ov07_0221C768

	thumb_func_start ov07_0221C7B8
ov07_0221C7B8: @ 0x0221C7B8
	push {r3, r4, r5, r6, r7, lr}
	adds r3, r0, #0
	movs r0, #0
	str r2, [sp]
	adds r6, r0, #0
	adds r5, r1, #0
	mov ip, r0
	adds r7, r1, #0
_0221C7C8:
	adds r2, r3, #0
	adds r2, #0xc0
	ldr r2, [r2]
	adds r2, r2, r6
	adds r2, #0xb0
	ldr r2, [r2]
	str r2, [r5, #8]
	adds r2, r3, #0
	adds r2, #0xc0
	ldr r2, [r2]
	adds r2, r2, r6
	adds r2, #0xc4
	ldr r2, [r2]
	str r2, [r5, #0x18]
	adds r2, r3, #0
	adds r2, #0xc0
	ldr r4, [r2]
	mov r2, ip
	adds r2, r4, r2
	adds r2, #0xd8
	ldrh r2, [r2]
	strh r2, [r7, #0x28]
	adds r2, r3, #0
	adds r2, #0xc0
	ldr r2, [r2]
	adds r7, r7, #2
	adds r2, r2, r0
	adds r2, #0xe0
	ldrb r4, [r2]
	adds r2, r1, r0
	adds r2, #0x30
	strb r4, [r2]
	adds r2, r3, #0
	adds r2, #0xc0
	ldr r2, [r2]
	adds r2, r2, r0
	adds r2, #0xe4
	ldrb r4, [r2]
	adds r2, r1, r0
	adds r2, #0x34
	strb r4, [r2]
	adds r2, r3, #0
	adds r2, #0xc0
	ldr r2, [r2]
	adds r2, r2, r0
	adds r2, #0xe8
	ldrb r4, [r2]
	adds r2, r1, r0
	adds r2, #0x38
	strb r4, [r2]
	adds r2, r3, #0
	adds r2, #0xc0
	ldr r2, [r2]
	adds r2, r2, r6
	adds r2, #0xec
	ldr r2, [r2]
	adds r6, r6, #4
	str r2, [r5, #0x3c]
	adds r2, r3, #0
	adds r2, #0xc0
	ldr r2, [r2]
	adds r5, r5, #4
	adds r2, r2, r0
	adds r2, #0xc0
	ldrb r4, [r2]
	adds r2, r1, r0
	adds r2, #0x4c
	strb r4, [r2]
	mov r2, ip
	adds r2, r2, #2
	adds r0, r0, #1
	mov ip, r2
	cmp r0, #4
	blt _0221C7C8
	ldr r0, [sp]
	cmp r0, #3
	bhi _0221C8C6
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221C86E: @ jump table
	.2byte _0221C876 - _0221C86E - 2 @ case 0
	.2byte _0221C88A - _0221C86E - 2 @ case 1
	.2byte _0221C89E - _0221C86E - 2 @ case 2
	.2byte _0221C8B2 - _0221C86E - 2 @ case 3
_0221C876:
	adds r0, r3, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r3, #0xc0
	ldrh r0, [r0, #0x14]
	str r0, [r1]
	ldr r0, [r3]
	ldrh r0, [r0, #0x16]
	str r0, [r1, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0221C88A:
	adds r0, r3, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r3, #0xc0
	ldrh r0, [r0, #0x14]
	str r0, [r1]
	ldr r0, [r3]
	ldrh r0, [r0, #0x14]
	str r0, [r1, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0221C89E:
	adds r0, r3, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r3, #0xc0
	ldrh r0, [r0, #0x14]
	str r0, [r1]
	ldr r0, [r3]
	ldrh r0, [r0, #0x14]
	str r0, [r1, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0221C8B2:
	adds r0, r3, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r3, #0xc0
	ldrh r0, [r0, #0x14]
	str r0, [r1]
	ldr r0, [r3]
	ldrh r0, [r0, #0x14]
	str r0, [r1, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0221C8C6:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221C7B8

	thumb_func_start ov07_0221C8CC
ov07_0221C8CC: @ 0x0221C8CC
	push {r3, r4, r5, lr}
	sub sp, #0x50
	adds r5, r0, #0
	ldr r1, [r5, #0x18]
	adds r1, r1, #4
	str r1, [r5, #0x18]
	ldr r4, [r1]
	adds r1, r1, #4
	str r1, [r5, #0x18]
	add r1, sp, #0
	adds r2, r4, #0
	bl ov07_0221C7B8
	cmp r4, #2
	add r0, sp, #0
	bne _0221C8F6
	ldr r1, [r5]
	bl ov07_02234A20
	add sp, #0x50
	pop {r3, r4, r5, pc}
_0221C8F6:
	cmp r4, #3
	bne _0221C904
	ldr r1, [r5]
	bl ov07_0223475C
	add sp, #0x50
	pop {r3, r4, r5, pc}
_0221C904:
	ldr r1, [r5]
	bl ov07_0223474C
	add sp, #0x50
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0221C8CC

	thumb_func_start ov07_0221C910
ov07_0221C910: @ 0x0221C910
	push {r4, lr}
	sub sp, #0x50
	adds r4, r0, #0
	ldr r1, [r4, #0x18]
	adds r1, r1, #4
	str r1, [r4, #0x18]
	ldr r2, [r1]
	adds r1, r1, #4
	str r1, [r4, #0x18]
	add r1, sp, #0
	bl ov07_0221C7B8
	ldr r1, [r4]
	add r0, sp, #0
	bl ov07_0223494C
	add sp, #0x50
	pop {r4, pc}
	thumb_func_end ov07_0221C910

	thumb_func_start ov07_0221C934
ov07_0221C934: @ 0x0221C934
	ldr r1, [r0, #0x18]
	movs r2, #0
	adds r1, r1, #4
	str r1, [r0, #0x18]
	adds r3, r0, #0
_0221C93E:
	ldr r1, [r3, #0x30]
	cmp r1, #1
	beq _0221C96A
	movs r1, #0xc
	muls r1, r2, r1
	movs r2, #1
	adds r1, r0, r1
	str r2, [r1, #0x30]
	adds r2, r1, #0
	movs r3, #0
	adds r2, #0x2c
	strb r3, [r2]
	ldr r2, [r0, #0x18]
	ldr r3, [r2]
	adds r2, r1, #0
	adds r2, #0x2d
	strb r3, [r2]
	ldr r2, [r0, #0x18]
	adds r2, r2, #4
	str r2, [r0, #0x18]
	str r2, [r1, #0x28]
	bx lr
_0221C96A:
	adds r2, r2, #1
	adds r3, #0xc
	cmp r2, #3
	blt _0221C93E
	bx lr
	thumb_func_end ov07_0221C934

	thumb_func_start ov07_0221C974
ov07_0221C974: @ 0x0221C974
	push {r3, r4}
	ldr r1, [r0, #0x18]
	adds r3, r0, #0
	adds r1, r1, #4
	adds r3, #0x18
	str r1, [r0, #0x18]
	movs r2, #2
_0221C982:
	ldr r1, [r3, #0x30]
	cmp r1, #0
	beq _0221C9B6
	adds r4, r2, #0
	movs r1, #0xc
	adds r2, r0, #0
	muls r4, r1, r4
	adds r2, #0x2c
	ldrb r1, [r2, r4]
	adds r1, r1, #1
	strb r1, [r2, r4]
	ldrb r3, [r2, r4]
	adds r2, r0, r4
	adds r1, r2, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	cmp r3, r1
	bne _0221C9AE
	movs r0, #0
	str r0, [r2, #0x30]
	pop {r3, r4}
	bx lr
_0221C9AE:
	ldr r1, [r2, #0x28]
	str r1, [r0, #0x18]
	pop {r3, r4}
	bx lr
_0221C9B6:
	subs r3, #0xc
	subs r2, r2, #1
	bpl _0221C982
	pop {r3, r4}
	bx lr
	thumb_func_end ov07_0221C974

	thumb_func_start ov07_0221C9C0
ov07_0221C9C0: @ 0x0221C9C0
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0221CBAC @ =0x0000017E
	adds r5, r0, #0
	ldrb r0, [r5, r1]
	movs r6, #0
	cmp r0, #1
	bhs _0221C9DE
	adds r0, r5, #0
	movs r2, #1
	adds r0, #0x8d
	strb r2, [r0]
	ldrb r0, [r5, r1]
	adds r0, r0, #1
	strb r0, [r5, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0221C9DE:
	adds r7, r6, #0
	adds r4, r6, #0
_0221C9E2:
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, r0, r4
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0221C9F6
	bl FUN_020154B0
	adds r6, r6, r0
_0221C9F6:
	adds r7, r7, #1
	adds r4, r4, #4
	cmp r7, #0x10
	blt _0221C9E2
	cmp r6, #0
	bne _0221CA16
	adds r0, r5, #0
	adds r0, #0x8e
	ldrh r0, [r0]
	cmp r0, #0
	bne _0221CA16
	adds r0, r5, #0
	adds r0, #0x90
	ldrh r0, [r0]
	cmp r0, #0
	beq _0221CA26
_0221CA16:
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0x8d
	strb r1, [r0]
	ldr r0, _0221CBB0 @ =0x0000017D
	movs r1, #0
	strb r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0221CA26:
	bl FUN_02006198
	cmp r0, #0
	beq _0221CA50
	ldr r0, _0221CBB0 @ =0x0000017D
	ldrb r1, [r5, r0]
	adds r1, r1, #1
	strb r1, [r5, r0]
	ldrb r1, [r5, r0]
	cmp r1, #0x5a
	bls _0221CA48
	movs r1, #0
	strb r1, [r5, r0]
	adds r0, r5, #0
	adds r0, #0x8d
	strb r1, [r0]
	b _0221CA50
_0221CA48:
	movs r0, #1
	adds r5, #0x8d
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0221CA50:
	ldr r0, _0221CBB0 @ =0x0000017D
	movs r1, #0
	strb r1, [r5, r0]
	adds r0, r0, #1
	strb r1, [r5, r0]
	adds r0, r5, #0
	adds r2, r1, #0
_0221CA5E:
	adds r1, r1, #1
	str r2, [r0, #0x1c]
	adds r0, r0, #4
	cmp r1, #3
	blt _0221CA5E
	adds r1, r5, #0
	movs r4, #0
_0221CA6C:
	adds r0, r1, #0
	str r4, [r1, #0x28]
	adds r0, #0x2c
	strb r4, [r0]
	adds r0, r1, #0
	adds r0, #0x2d
	strb r4, [r0]
	str r4, [r1, #0x30]
	adds r2, r2, #1
	adds r1, #0xc
	cmp r2, #3
	blt _0221CA6C
	adds r7, r5, #0
	movs r6, #0
_0221CA88:
	adds r0, r7, #0
	adds r0, #0xcc
	ldr r1, [r0]
	cmp r1, #0
	beq _0221CAA0
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200D998
_0221CAA0:
	adds r0, r7, #0
	adds r0, #0xcc
	adds r4, r4, #1
	adds r7, r7, #4
	str r6, [r0]
	cmp r4, #4
	blt _0221CA88
_0221CAAE:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221D55C
	adds r6, r6, #1
	cmp r6, #5
	blt _0221CAAE
	movs r6, #0
	adds r4, r6, #0
	adds r7, r6, #0
_0221CAC2:
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, r0, r4
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0221CADE
	bl ov07_0221FF2C
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, r0, r4
	str r7, [r0, #0x1c]
_0221CADE:
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #0x10
	blt _0221CAC2
	movs r0, #6
	lsls r0, r0, #6
	adds r0, r5, r0
	movs r1, #5
	bl ov07_0221DD14
	bl FUN_0223C340
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221FAEC
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov07_0221BFD0
	adds r3, r0, #0
	lsls r0, r4, #0x18
	movs r1, #1
	lsrs r0, r0, #0x18
	lsls r1, r1, #0xe
	movs r2, #0
	bl FUN_0201C1C4
	adds r0, r5, #0
	bl ov07_0221C4A0
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221FAEC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	movs r0, #2
	movs r1, #1
	bl FUN_0201BC28
	movs r1, #0x6b
	lsls r1, r1, #2
	ldrb r1, [r5, r1]
	movs r0, #0
	bl FUN_0201BB68
	ldr r1, _0221CBB4 @ =0x000001AD
	movs r0, #1
	ldrb r1, [r5, r1]
	bl FUN_0201BB68
	ldr r1, _0221CBB8 @ =0x000001AE
	movs r0, #2
	ldrb r1, [r5, r1]
	bl FUN_0201BB68
	ldr r1, _0221CBBC @ =0x000001AF
	movs r0, #3
	ldrb r1, [r5, r1]
	bl FUN_0201BB68
	adds r0, r5, #0
	adds r0, #0xc4
	movs r2, #0
	ldr r0, [r0]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	adds r0, #0xc4
	ldr r0, [r0]
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	adds r0, #0xc4
	movs r2, #0
	ldr r0, [r0]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	adds r0, #0xc4
	movs r1, #3
	ldr r0, [r0]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	movs r0, #0
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221CBAC: .4byte 0x0000017E
_0221CBB0: .4byte 0x0000017D
_0221CBB4: .4byte 0x000001AD
_0221CBB8: .4byte 0x000001AE
_0221CBBC: .4byte 0x000001AF
	thumb_func_end ov07_0221C9C0

	thumb_func_start ov07_0221CBC0
ov07_0221CBC0: @ 0x0221CBC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r4, [r0]
	adds r1, r0, #4
	str r1, [r5, #0x18]
	ldr r0, [r1]
	str r0, [sp]
	adds r0, r1, #4
	str r0, [r5, #0x18]
	ldr r7, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	str r4, [r0, #0x18]
	adds r0, r5, r4
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221CC1E
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, r0, r6
	ldr r0, [r0, #0x1c]
	add r1, sp, #4
	bl FUN_020154D4
	movs r0, #0
	ldr r1, [sp, #8]
	mvns r0, r0
	muls r0, r1, r0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	add r1, sp, #4
	adds r0, r0, r6
	ldr r0, [r0, #0x1c]
	bl FUN_020154E4
_0221CC1E:
	adds r0, r5, #0
	adds r0, #0xc0
	adds r1, r5, r4
	adds r1, #0x6c
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, r0, r6
	ldrb r1, [r1]
	ldr r0, [r0, #0x1c]
	bl FUN_02015528
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r1, [sp]
	adds r0, r0, r6
	ldr r0, [r0, #0x1c]
	adds r2, r7, #0
	adds r3, r5, #0
	bl ov07_0221FF18
	adds r5, #0xc0
	ldr r1, [r5]
	str r0, [r1, #0x5c]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0221CBC0

	thumb_func_start ov07_0221CC54
ov07_0221CC54: @ 0x0221CC54
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r4, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r7, [r0]
	adds r1, r0, #4
	str r1, [r5, #0x18]
	ldr r0, [r1]
	adds r1, r1, #4
	str r1, [r5, #0x18]
	str r0, [sp, #4]
	ldr r0, [r1]
	str r0, [sp]
	adds r0, r1, #4
	str r0, [r5, #0x18]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	str r4, [r0, #0x18]
	adds r0, r5, r4
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221CCBA
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, r0, r6
	ldr r0, [r0, #0x1c]
	add r1, sp, #8
	bl FUN_020154D4
	movs r0, #0
	ldr r1, [sp, #0xc]
	mvns r0, r0
	muls r0, r1, r0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	add r1, sp, #8
	adds r0, r0, r6
	ldr r0, [r0, #0x1c]
	bl FUN_020154E4
_0221CCBA:
	adds r0, r5, #0
	adds r0, #0xc0
	adds r1, r5, r4
	adds r1, #0x6c
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, r0, r6
	ldrb r1, [r1]
	ldr r0, [r0, #0x1c]
	bl FUN_02015528
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r1, [sp, #4]
	adds r0, r0, r6
	ldr r0, [r0, #0x1c]
	ldr r2, [sp]
	adds r3, r5, #0
	bl ov07_0221FF18
	adds r5, #0xc0
	ldr r2, [r5]
	lsls r1, r7, #2
	adds r1, r2, r1
	str r0, [r1, #0x5c]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0221CC54

	thumb_func_start ov07_0221CCF4
ov07_0221CCF4: @ 0x0221CCF4
	push {r4, r5, r6, lr}
	sub sp, #0x90
	ldr r5, _0221CD48 @ =0x02234CC8
	adds r4, r0, #0
	add r3, sp, #0
	movs r2, #0x12
_0221CD00:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0221CD00
	adds r0, r4, #0
	bl ov07_0221C468
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221C470
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov07_02231924
	movs r1, #0x18
	adds r3, r5, #0
	muls r3, r1, r3
	add r2, sp, #0
	lsls r1, r0, #2
	adds r0, r2, r3
	ldr r4, [r1, r0]
	cmp r4, #0xff
	bne _0221CD40
	bl GF_AssertFail
_0221CD40:
	subs r0, r4, #1
	add sp, #0x90
	pop {r4, r5, r6, pc}
	nop
_0221CD48: .4byte 0x02234CC8
	thumb_func_end ov07_0221CCF4

	thumb_func_start ov07_0221CD4C
ov07_0221CD4C: @ 0x0221CD4C
	push {r4, r5, r6, lr}
	sub sp, #0x90
	ldr r5, _0221CDA0 @ =0x02234D58
	adds r4, r0, #0
	add r3, sp, #0
	movs r2, #0x12
_0221CD58:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0221CD58
	adds r0, r4, #0
	bl ov07_0221C468
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221C470
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov07_02231924
	movs r1, #0x18
	adds r3, r5, #0
	muls r3, r1, r3
	add r2, sp, #0
	lsls r1, r0, #2
	adds r0, r2, r3
	ldr r4, [r1, r0]
	cmp r4, #0xff
	bne _0221CD98
	bl GF_AssertFail
_0221CD98:
	adds r0, r4, #0
	add sp, #0x90
	pop {r4, r5, r6, pc}
	nop
_0221CDA0: .4byte 0x02234D58
	thumb_func_end ov07_0221CD4C

	thumb_func_start ov07_0221CDA4
ov07_0221CDA4: @ 0x0221CDA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	ldr r1, [r5, #0x18]
	adds r0, #0x18
	adds r1, r1, #4
	str r1, [r5, #0x18]
	ldr r4, [r1]
	adds r1, r1, #4
	str r1, [r5, #0x18]
	movs r1, #0
	add r2, sp, #0x10
_0221CDBC:
	ldr r3, [r5, #0x18]
	adds r1, r1, #1
	ldr r3, [r3]
	str r3, [r2]
	ldr r3, [r0]
	adds r2, r2, #4
	adds r3, r3, #4
	str r3, [r0]
	cmp r1, #6
	blt _0221CDBC
	ldr r1, [r5, #0x18]
	ldr r1, [r1]
	str r1, [sp]
	ldr r1, [r0]
	adds r1, r1, #4
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	str r4, [r0, #0x18]
	adds r0, r5, r4
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221CE1A
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, r0, r6
	ldr r0, [r0, #0x1c]
	add r1, sp, #4
	bl FUN_020154D4
	movs r0, #0
	ldr r1, [sp, #8]
	mvns r0, r0
	muls r0, r1, r0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	add r1, sp, #4
	adds r0, r0, r6
	ldr r0, [r0, #0x1c]
	bl FUN_020154E4
_0221CE1A:
	adds r0, r5, #0
	bl ov07_0221CCF4
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0xc0
	adds r1, r5, r4
	adds r1, #0x6c
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, r0, r6
	ldrb r1, [r1]
	ldr r0, [r0, #0x1c]
	bl FUN_02015528
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r2, r7, #2
	adds r0, r0, r6
	add r1, sp, #0x10
	ldr r1, [r1, r2]
	ldr r0, [r0, #0x1c]
	ldr r2, [sp]
	adds r3, r5, #0
	bl ov07_0221FF18
	adds r5, #0xc0
	ldr r1, [r5]
	str r0, [r1, #0x5c]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0221CDA4

	thumb_func_start ov07_0221CE5C
ov07_0221CE5C: @ 0x0221CE5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r1, [r5, #0x18]
	adds r0, #0x18
	adds r1, r1, #4
	str r1, [r5, #0x18]
	ldr r4, [r1]
	adds r1, r1, #4
	str r1, [r5, #0x18]
	movs r1, #0
	add r2, sp, #0x10
_0221CE74:
	ldr r3, [r5, #0x18]
	adds r1, r1, #1
	ldr r3, [r3]
	str r3, [r2]
	ldr r3, [r0]
	adds r2, r2, #4
	adds r3, r3, #4
	str r3, [r0]
	cmp r1, #4
	blt _0221CE74
	ldr r1, [r5, #0x18]
	ldr r1, [r1]
	str r1, [sp]
	ldr r1, [r0]
	adds r1, r1, #4
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	str r4, [r0, #0x18]
	adds r0, r5, r4
	adds r0, #0x7c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221CED2
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, r0, r6
	ldr r0, [r0, #0x1c]
	add r1, sp, #4
	bl FUN_020154D4
	movs r0, #0
	ldr r1, [sp, #8]
	mvns r0, r0
	muls r0, r1, r0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	add r1, sp, #4
	adds r0, r0, r6
	ldr r0, [r0, #0x1c]
	bl FUN_020154E4
_0221CED2:
	adds r0, r5, #0
	bl ov07_0221CD4C
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0xc0
	adds r1, r5, r4
	adds r1, #0x6c
	ldr r0, [r0]
	lsls r6, r4, #2
	adds r0, r0, r6
	ldrb r1, [r1]
	ldr r0, [r0, #0x1c]
	bl FUN_02015528
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r2, r7, #2
	adds r0, r0, r6
	add r1, sp, #0x10
	ldr r1, [r1, r2]
	ldr r0, [r0, #0x1c]
	ldr r2, [sp]
	adds r3, r5, #0
	bl ov07_0221FF18
	adds r5, #0xc0
	ldr r1, [r5]
	str r0, [r1, #0x5c]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0221CE5C

	thumb_func_start ov07_0221CF14
ov07_0221CF14: @ 0x0221CF14
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0
	adds r5, r0, #0
	adds r7, r6, #0
	adds r4, r6, #0
_0221CF1E:
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, r0, r4
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0221CF32
	bl FUN_020154B0
	adds r6, r6, r0
_0221CF32:
	adds r7, r7, #1
	adds r4, r4, #4
	cmp r7, #0x10
	blt _0221CF1E
	cmp r6, #0
	bne _0221CF4C
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	movs r0, #0
	adds r5, #0x8d
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0221CF4C:
	movs r0, #1
	adds r5, #0x8d
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221CF14

	thumb_func_start ov07_0221CF54
ov07_0221CF54: @ 0x0221CF54
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r4, r1, #2
	adds r0, r0, r4
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0221CF78
	bl GF_AssertFail
_0221CF78:
	ldr r0, [r5, #0x18]
	movs r2, #0
	ldr r1, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r5]
	bl ov07_0221FE88
	adds r1, r5, #0
	adds r1, #0xc0
	ldr r1, [r1]
	adds r1, r1, r4
	str r0, [r1, #0x1c]
	adds r0, r5, #0
	movs r1, #2
	adds r0, #0x8d
	strb r1, [r0]
	ldr r0, _0221CFA4 @ =ov07_0221BE20
	adds r5, #0xbc
	str r0, [r5]
	pop {r3, r4, r5, pc}
	nop
_0221CFA4: .4byte ov07_0221BE20
	thumb_func_end ov07_0221CF54

	thumb_func_start ov07_0221CFA8
ov07_0221CFA8: @ 0x0221CFA8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	adds r0, r0, #4
	adds r0, r0, #4
	str r0, [r5, #0x18]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r4, r1, #2
	adds r0, r0, r4
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0221CFCE
	bl GF_AssertFail
_0221CFCE:
	ldr r0, [r5, #0x18]
	movs r1, #0x60
	ldr r2, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r5]
	movs r3, #0
	bl ov07_0221FEB0
	adds r1, r5, #0
	adds r1, #0xc0
	ldr r1, [r1]
	adds r1, r1, r4
	str r0, [r1, #0x1c]
	adds r0, r5, #0
	movs r1, #2
	adds r0, #0x8d
	strb r1, [r0]
	ldr r0, _0221CFFC @ =ov07_0221BE20
	adds r5, #0xbc
	str r0, [r5]
	pop {r3, r4, r5, pc}
	nop
_0221CFFC: .4byte ov07_0221BE20
	thumb_func_end ov07_0221CFA8

	thumb_func_start ov07_0221D000
ov07_0221D000: @ 0x0221D000
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r4, r1, #2
	adds r0, r0, r4
	ldr r0, [r0, #0x1c]
	bl ov07_0221FF2C
	adds r5, #0xc0
	ldr r0, [r5]
	movs r1, #0
	adds r0, r0, r4
	str r1, [r0, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221D000

	thumb_func_start ov07_0221D02C
ov07_0221D02C: @ 0x0221D02C
	ldr r1, [r0, #0x18]
	movs r3, #0
	adds r1, r1, #4
	str r1, [r0, #0x18]
	adds r2, r0, #0
_0221D036:
	ldr r1, [r2, #0x1c]
	cmp r1, #0
	bne _0221D052
	ldr r1, [r0, #0x18]
	adds r2, r1, #4
	lsls r1, r3, #2
	adds r1, r0, r1
	str r2, [r1, #0x1c]
	ldr r2, [r0, #0x18]
	ldr r1, [r2]
	lsls r1, r1, #2
	adds r1, r2, r1
	str r1, [r0, #0x18]
	bx lr
_0221D052:
	adds r3, r3, #1
	adds r2, r2, #4
	cmp r3, #3
	blt _0221D036
	bx lr
	thumb_func_end ov07_0221D02C

	thumb_func_start ov07_0221D05C
ov07_0221D05C: @ 0x0221D05C
	ldr r1, [r0, #0x18]
	adds r3, r0, #0
	adds r1, r1, #4
	str r1, [r0, #0x18]
	movs r2, #2
	adds r3, #8
_0221D068:
	ldr r1, [r3, #0x1c]
	cmp r1, #0
	beq _0221D07E
	adds r3, r0, #0
	adds r3, #0x1c
	lsls r2, r2, #2
	ldr r1, [r3, r2]
	str r1, [r0, #0x18]
	movs r0, #0
	str r0, [r3, r2]
	bx lr
_0221D07E:
	subs r3, r3, #4
	subs r2, r2, #1
	bpl _0221D068
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221D05C

	thumb_func_start ov07_0221D088
ov07_0221D088: @ 0x0221D088
	push {r3, r4}
	ldr r2, [r0, #0x18]
	adds r1, r0, #0
	adds r2, r2, #4
	str r2, [r0, #0x18]
	ldr r4, [r2]
	adds r2, r2, #4
	str r2, [r0, #0x18]
	ldr r3, [r2]
	adds r2, r2, #4
	str r2, [r0, #0x18]
	lsls r2, r4, #2
	adds r2, r0, r2
	adds r2, #0x94
	ldr r2, [r2]
	adds r1, #0x18
	cmp r3, r2
	bne _0221D0B6
	ldr r1, [r0, #0x18]
	ldr r1, [r1]
	str r1, [r0, #0x18]
	pop {r3, r4}
	bx lr
_0221D0B6:
	ldr r0, [r1]
	adds r0, r0, #4
	str r0, [r1]
	pop {r3, r4}
	bx lr
	thumb_func_end ov07_0221D088

	thumb_func_start ov07_0221D0C0
ov07_0221D0C0: @ 0x0221D0C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	adds r0, r0, #4
	str r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	bl ov07_0221F8C4
	cmp r0, #0
	ldr r0, [r4, #0x18]
	beq _0221D0E0
	ldr r0, [r0]
	str r0, [r4, #0x18]
	pop {r4, pc}
_0221D0E0:
	adds r0, r0, #4
	str r0, [r4, #0x18]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_0221D0C0

	thumb_func_start ov07_0221D0E8
ov07_0221D0E8: @ 0x0221D0E8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	adds r1, r0, #4
	str r1, [r4, #0x18]
	ldr r0, [r1]
	adds r1, r1, #4
	str r1, [r4, #0x18]
	bl ov07_02223038
	adds r7, r0, #0
	ldr r0, [r4, #0x18]
	adds r2, r4, #0
	ldr r5, [r0]
	adds r0, r0, #4
	adds r2, #0x18
	movs r3, #0
	str r0, [r4, #0x18]
	cmp r5, #0
	bls _0221D12A
	adds r6, r4, #0
_0221D112:
	ldr r0, [r4, #0x18]
	adds r3, r3, #1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x94
	str r1, [r0]
	ldr r0, [r2]
	adds r6, r6, #4
	adds r0, r0, #4
	str r0, [r2]
	cmp r3, r5
	blo _0221D112
_0221D12A:
	cmp r3, #0xa
	bge _0221D142
	lsls r0, r3, #2
	adds r2, r4, r0
	movs r1, #0
_0221D134:
	adds r0, r2, #0
	adds r0, #0x94
	adds r3, r3, #1
	adds r2, r2, #4
	str r1, [r0]
	cmp r3, #0xa
	blt _0221D134
_0221D142:
	adds r0, r4, #0
	blx r7
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221D0E8

	thumb_func_start ov07_0221D148
ov07_0221D148: @ 0x0221D148
	ldr r2, [r0, #0x18]
	adds r1, r0, #0
	adds r2, r2, #4
	str r2, [r0, #0x18]
	adds r2, r0, #0
	adds r2, #0xc0
	ldr r2, [r2]
	adds r1, #0x18
	ldrh r3, [r2, #0x10]
	movs r2, #1
	tst r2, r3
	beq _0221D166
	ldr r2, [r1]
	adds r2, r2, #4
	str r2, [r1]
_0221D166:
	ldr r2, [r0, #0x18]
	ldr r1, [r2]
	lsls r1, r1, #2
	adds r1, r2, r1
	str r1, [r0, #0x18]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221D148

	thumb_func_start ov07_0221D174
ov07_0221D174: @ 0x0221D174
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x18]
	adds r1, r1, #4
	str r1, [r4, #0x18]
	ldr r2, [r1]
	adds r1, r1, #4
	str r1, [r4, #0x18]
	cmp r2, #0
	bne _0221D196
	adds r1, r4, #0
	adds r1, #0xc0
	ldr r1, [r1]
	ldrh r1, [r1, #0x14]
	bl ov07_0223192C
	b _0221D1A2
_0221D196:
	adds r1, r4, #0
	adds r1, #0xc0
	ldr r1, [r1]
	ldrh r1, [r1, #0x16]
	bl ov07_0223192C
_0221D1A2:
	cmp r0, #4
	bne _0221D1AC
	ldr r0, [r4, #0x18]
	adds r0, r0, #4
	str r0, [r4, #0x18]
_0221D1AC:
	ldr r1, [r4, #0x18]
	ldr r0, [r1]
	lsls r0, r0, #2
	adds r0, r1, r0
	str r0, [r4, #0x18]
	pop {r4, pc}
	thumb_func_end ov07_0221D174

	thumb_func_start ov07_0221D1B8
ov07_0221D1B8: @ 0x0221D1B8
	push {r4, r5}
	sub sp, #0x10
	ldr r5, _0221D210 @ =0x02234B98
	add r2, sp, #0
	adds r4, r0, #0
	adds r3, r2, #0
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r1, [r4, #0x18]
	adds r0, r4, #0
	adds r1, r1, #4
	str r1, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0xc0
	ldr r1, [r1]
	adds r0, #0x18
	ldr r1, [r1, #0xc]
	cmp r1, #0
	beq _0221D1FE
	ldr r2, [r0]
	adds r2, r2, #4
	str r2, [r0]
	movs r2, #0
_0221D1EA:
	ldr r5, [r3]
	tst r5, r1
	bne _0221D1FE
	ldr r5, [r0]
	adds r2, r2, #1
	adds r5, r5, #4
	adds r3, r3, #4
	str r5, [r0]
	cmp r2, #4
	blo _0221D1EA
_0221D1FE:
	ldr r1, [r4, #0x18]
	ldr r0, [r1]
	lsls r0, r0, #2
	adds r0, r1, r0
	str r0, [r4, #0x18]
	add sp, #0x10
	pop {r4, r5}
	bx lr
	nop
_0221D210: .4byte 0x02234B98
	thumb_func_end ov07_0221D1B8

	thumb_func_start ov07_0221D214
ov07_0221D214: @ 0x0221D214
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x18]
	adds r1, r1, #4
	str r1, [r4, #0x18]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221D232
	ldr r1, [r4, #0x18]
	ldr r0, [r1]
	lsls r0, r0, #2
	adds r0, r1, r0
	str r0, [r4, #0x18]
	pop {r4, pc}
_0221D232:
	ldr r0, [r4, #0x18]
	adds r0, r0, #4
	str r0, [r4, #0x18]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_0221D214

	thumb_func_start ov07_0221D23C
ov07_0221D23C: @ 0x0221D23C
	ldr r2, [r0, #0x18]
	adds r1, r0, #0
	adds r2, r2, #4
	str r2, [r0, #0x18]
	adds r2, r0, #0
	adds r2, #0xc0
	ldr r3, [r2]
	movs r2, #0x46
	lsls r2, r2, #2
	ldr r2, [r3, r2]
	adds r1, #0x18
	lsls r2, r2, #0x1e
	asrs r2, r2, #0x1f
	beq _0221D266
	ldr r0, [r0, #0x18]
	ldr r2, [r1]
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r2, r0
	str r0, [r1]
	bx lr
_0221D266:
	ldr r0, [r1]
	adds r0, r0, #4
	str r0, [r1]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221D23C

	thumb_func_start ov07_0221D270
ov07_0221D270: @ 0x0221D270
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x18]
	adds r1, r1, #4
	str r1, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0xc0
	ldr r1, [r1]
	ldrh r1, [r1, #0x14]
	bl ov07_0223192C
	adds r1, r5, #0
	adds r1, #0xc0
	ldr r1, [r1]
	adds r4, r0, #0
	ldrh r1, [r1, #0x16]
	adds r0, r5, #0
	bl ov07_0223192C
	cmp r4, r0
	bne _0221D2A6
	ldr r1, [r5, #0x18]
	ldr r0, [r1]
	lsls r0, r0, #2
	adds r0, r1, r0
	str r0, [r5, #0x18]
	pop {r3, r4, r5, pc}
_0221D2A6:
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0221D270

	thumb_func_start ov07_0221D2B0
ov07_0221D2B0: @ 0x0221D2B0
	ldr r2, [r0, #0x18]
	adds r1, r0, #0
	adds r2, r2, #4
	str r2, [r0, #0x18]
	ldr r3, [r2]
	adds r2, r2, #4
	str r2, [r0, #0x18]
	adds r2, r0, #0
	adds r2, #0xc0
	ldr r2, [r2]
	adds r1, #0x18
	ldrh r2, [r2, #0x10]
	cmp r3, r2
	bne _0221D2DA
	ldr r0, [r0, #0x18]
	ldr r2, [r1]
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r2, r0
	str r0, [r1]
	bx lr
_0221D2DA:
	ldr r0, [r1]
	adds r0, r0, #4
	str r0, [r1]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221D2B0

	thumb_func_start ov07_0221D2E4
ov07_0221D2E4: @ 0x0221D2E4
	ldr r1, [r0, #0x18]
	adds r2, r1, #4
	str r2, [r0, #0x18]
	ldr r1, [r2]
	lsls r1, r1, #2
	adds r1, r2, r1
	str r1, [r0, #0x18]
	bx lr
	thumb_func_end ov07_0221D2E4

	thumb_func_start ov07_0221D2F4
ov07_0221D2F4: @ 0x0221D2F4
	push {r3, lr}
	cmp r1, #0
	beq _0221D314
	movs r1, #1
	str r1, [sp]
	ldr r0, [r0, #4]
	movs r1, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	movs r3, #0x3c
	bl FUN_0200B484
	pop {r3, pc}
_0221D314:
	movs r1, #1
	str r1, [sp]
	ldr r0, [r0, #4]
	movs r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x10
	movs r3, #0x3c
	bl FUN_0200B484
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov07_0221D2F4

	thumb_func_start ov07_0221D330
ov07_0221D330: @ 0x0221D330
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0200B594
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #0
	beq _0221D370
	ldr r0, [r4, #4]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1f
	beq _0221D35E
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
	bl ov07_0221C69C
	pop {r3, r4, r5, pc}
_0221D35E:
	adds r0, r4, #0
	movs r1, #0
	bl ov07_0221D2F4
	movs r0, #1
	ldr r1, [r4, #4]
	lsls r0, r0, #8
	orrs r0, r1
	str r0, [r4, #4]
_0221D370:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0221D330

	thumb_func_start ov07_0221D374
ov07_0221D374: @ 0x0221D374
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #8
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #8
	blx FUN_020D4994
	str r5, [r4]
	ldr r0, [r5, #0x18]
	movs r1, #0xff
	adds r2, r0, #4
	str r2, [r5, #0x18]
	ldr r0, [r4, #4]
	bics r0, r1
	ldr r1, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	orrs r0, r1
	str r0, [r4, #4]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	bl FUN_0200B528
	adds r0, r4, #0
	movs r1, #1
	bl ov07_0221D2F4
	ldr r0, _0221D3C4 @ =ov07_0221D330
	ldr r2, _0221D3C8 @ =0x00001001
	adds r1, r4, #0
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221D3C4: .4byte ov07_0221D330
_0221D3C8: .4byte 0x00001001
	thumb_func_end ov07_0221D374

	thumb_func_start ov07_0221D3CC
ov07_0221D3CC: @ 0x0221D3CC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	cmp r1, #7
	bhi _0221D4AA
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0221D3E0: @ jump table
	.2byte _0221D3F0 - _0221D3E0 - 2 @ case 0
	.2byte _0221D3F8 - _0221D3E0 - 2 @ case 1
	.2byte _0221D400 - _0221D3E0 - 2 @ case 2
	.2byte _0221D40E - _0221D3E0 - 2 @ case 3
	.2byte _0221D41C - _0221D3E0 - 2 @ case 4
	.2byte _0221D442 - _0221D3E0 - 2 @ case 5
	.2byte _0221D468 - _0221D3E0 - 2 @ case 6
	.2byte _0221D48A - _0221D3E0 - 2 @ case 7
_0221D3F0:
	adds r4, #0xc0
	ldr r0, [r4]
	ldrh r6, [r0, #0x14]
	b _0221D4AA
_0221D3F8:
	adds r4, #0xc0
	ldr r0, [r4]
	ldrh r6, [r0, #0x16]
	b _0221D4AA
_0221D400:
	adds r4, #0xc0
	ldr r1, [r4]
	ldrh r1, [r1, #0x14]
	bl ov07_0223197C
	adds r6, r0, #0
	b _0221D4AA
_0221D40E:
	adds r4, #0xc0
	ldr r1, [r4]
	ldrh r1, [r1, #0x16]
	bl ov07_0223197C
	adds r6, r0, #0
	b _0221D4AA
_0221D41C:
	movs r6, #0xff
	movs r5, #0
_0221D420:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #0
	beq _0221D430
	cmp r0, #2
	bne _0221D434
_0221D430:
	adds r6, r5, #0
	b _0221D43A
_0221D434:
	adds r5, r5, #1
	cmp r5, #4
	blt _0221D420
_0221D43A:
	cmp r6, #0xff
	bne _0221D4AA
	movs r6, #0
	b _0221D4AA
_0221D442:
	movs r6, #0xff
	movs r5, #0
_0221D446:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #1
	beq _0221D456
	cmp r0, #3
	bne _0221D45A
_0221D456:
	adds r6, r5, #0
	b _0221D460
_0221D45A:
	adds r5, r5, #1
	cmp r5, #4
	blt _0221D446
_0221D460:
	cmp r6, #0xff
	bne _0221D4AA
	movs r6, #0
	b _0221D4AA
_0221D468:
	movs r6, #0xff
	movs r5, #0
_0221D46C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #4
	bne _0221D47C
	adds r6, r5, #0
	b _0221D482
_0221D47C:
	adds r5, r5, #1
	cmp r5, #4
	blt _0221D46C
_0221D482:
	cmp r6, #0xff
	bne _0221D4AA
	movs r6, #0
	b _0221D4AA
_0221D48A:
	movs r6, #0xff
	movs r5, #0
_0221D48E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #5
	bne _0221D49E
	adds r6, r5, #0
	b _0221D4A4
_0221D49E:
	adds r5, r5, #1
	cmp r5, #4
	blt _0221D48E
_0221D4A4:
	cmp r6, #0xff
	bne _0221D4AA
	movs r6, #0
_0221D4AA:
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_0221D3CC

	thumb_func_start ov07_0221D4B0
ov07_0221D4B0: @ 0x0221D4B0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _0221D4CC
	ldrb r0, [r5, #4]
	adds r0, r0, #1
	strb r0, [r5, #4]
	ldrb r1, [r5, #4]
	ldrb r0, [r5, #5]
	cmp r1, r0
	bne _0221D4FA
	movs r0, #0
	strb r0, [r5, #4]
_0221D4CC:
	ldr r0, [r5, #8]
	movs r1, #0
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, [r5, #8]
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r0, [r5, #8]
	movs r1, #0x29
	bl FUN_02008A78
	subs r0, r4, r0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r0, [r5]
	adds r1, r6, #0
	bl FUN_0200DDB8
_0221D4FA:
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221D4B0

	thumb_func_start ov07_0221D4FC
ov07_0221D4FC: @ 0x0221D4FC
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _0221D518
	ldrb r0, [r5, #4]
	adds r0, r0, #1
	strb r0, [r5, #4]
	ldrb r1, [r5, #4]
	ldrb r0, [r5, #5]
	cmp r1, r0
	bne _0221D55A
	movs r0, #0
	strb r0, [r5, #4]
_0221D518:
	ldr r0, [r5, #8]
	movs r1, #0
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, [r5, #8]
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r0, [r5, #8]
	movs r1, #0x29
	bl FUN_02008A78
	subs r0, r4, r0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	subs r6, #0x28
	ldr r0, [r5]
	movs r1, #2
	movs r2, #0
	rsbs r3, r6, #0
	bl FUN_0201BC8C
	subs r4, #0x28
	ldr r0, [r5]
	movs r1, #2
	movs r2, #3
	rsbs r3, r4, #0
	bl FUN_0201BC8C
_0221D55A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221D4FC

	thumb_func_start ov07_0221D55C
ov07_0221D55C: @ 0x0221D55C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	cmp r1, #4
	bne _0221D588
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221D5A6
	ldr r0, [r0, #0xc]
	bl FUN_0200E390
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x5e
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	pop {r3, r4, r5, pc}
_0221D588:
	movs r0, #0x59
	lsls r0, r0, #2
	lsls r5, r1, #2
	adds r4, r4, r0
	ldr r0, [r4, r5]
	cmp r0, #0
	beq _0221D5A6
	ldr r0, [r0, #0xc]
	bl FUN_0200E390
	ldr r0, [r4, r5]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, r5]
_0221D5A6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221D55C

	thumb_func_start ov07_0221D5A8
ov07_0221D5A8: @ 0x0221D5A8
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221D5A8

	thumb_func_start ov07_0221D5AC
ov07_0221D5AC: @ 0x0221D5AC
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221D5AC

	thumb_func_start ov07_0221D5B0
ov07_0221D5B0: @ 0x0221D5B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, [r5, #0x18]
	adds r2, r1, #4
	str r2, [r5, #0x18]
	ldr r1, [r2]
	adds r2, r2, #4
	str r2, [r5, #0x18]
	ldr r4, [r2]
	adds r2, r2, #4
	str r2, [r5, #0x18]
	bl ov07_0221D3CC
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r1, r0
	adds r0, #0xb0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldr r7, [r1]
	str r0, [sp, #0x14]
	ldr r0, [r1, #8]
	str r0, [sp, #0x10]
	movs r0, #2
	bl FUN_0201CB4C
	movs r2, #0x19
	movs r1, #0
	lsls r2, r2, #8
	blx FUN_020D4994
	movs r0, #2
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0xc4
	movs r3, #0x32
	ldr r0, [r0]
	movs r1, #2
	adds r2, r7, #0
	lsls r3, r3, #6
	bl FUN_0201C0C0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, [r5]
	bl FUN_02003200
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0x1b
	adds r2, r5, #0
	str r0, [sp, #0xc]
	lsls r1, r1, #4
	adds r2, #0xc4
	ldr r0, [r5, r1]
	ldr r2, [r2]
	subs r1, #0xa4
	movs r3, #2
	bl FUN_02007B68
	cmp r4, #1
	bne _0221D696
	ldr r0, [r5]
	movs r1, #0x10
	bl FUN_0201AA8C
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r5, #0
	adds r0, #0xc4
	ldr r2, [r0]
	ldr r0, [r5, r1]
	adds r1, r6, #0
	str r2, [r0]
	adds r0, r5, #0
	bl ov07_0221FA48
	movs r1, #0x5e
	lsls r1, r1, #2
	ldr r2, [r5, r1]
	str r0, [r2, #8]
	ldr r0, [r5, r1]
	movs r2, #0
	strb r2, [r0, #4]
	ldr r0, [r5, r1]
	strb r2, [r0, #5]
	ldr r0, _0221D710 @ =ov07_0221D4FC
	ldr r1, [r5, r1]
	ldr r2, _0221D714 @ =0x00001001
	bl FUN_0200E320
	movs r1, #0x5e
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	str r0, [r1, #0xc]
_0221D696:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FA48
	movs r1, #0
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FA48
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FA48
	movs r1, #0x29
	bl FUN_02008A78
	subs r0, r4, r0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r0, r5, #0
	adds r0, #0xc4
	subs r7, #0x28
	ldr r0, [r0]
	movs r1, #2
	movs r2, #0
	rsbs r3, r7, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	adds r0, #0xc4
	subs r4, #0x28
	ldr r0, [r0]
	movs r1, #2
	movs r2, #3
	rsbs r3, r4, #0
	bl FUN_0201BC8C
	movs r0, #2
	movs r1, #1
	bl FUN_0201BC28
	adds r0, r5, #0
	bl ov07_0221FAE8
	adds r1, r0, #0
	lsls r1, r1, #0x18
	movs r0, #2
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221D710: .4byte ov07_0221D4FC
_0221D714: .4byte 0x00001001
	thumb_func_end ov07_0221D5B0

	thumb_func_start ov07_0221D718
ov07_0221D718: @ 0x0221D718
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	adds r0, r0, #4
	adds r0, r0, #4
	str r0, [r4, #0x18]
	movs r0, #2
	bl FUN_0201CB4C
	movs r2, #0x19
	movs r1, #0
	lsls r2, r2, #8
	blx FUN_020D4994
	adds r0, r4, #0
	movs r1, #4
	bl ov07_0221D55C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_0221D718

	thumb_func_start ov07_0221D740
ov07_0221D740: @ 0x0221D740
	push {r4, lr}
	sub sp, #0x18
	ldr r3, _0221D7B4 @ =0x02234BF0
	add r2, sp, #0
	adds r4, r0, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4, #0x18]
	adds r0, r0, #4
	str r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200CF38
	movs r1, #0x4e
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r1, [r4, r1]
	adds r0, #0xac
	ldr r0, [r0]
	movs r2, #5
	bl FUN_0200CFF4
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200CF6C
	movs r2, #0x11
	movs r1, #0
	lsls r2, r2, #0x10
	bl FUN_02009FC8
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x4e
	adds r0, #0xac
	lsls r1, r1, #2
	ldr r0, [r0]
	ldr r1, [r4, r1]
	add r2, sp, #0
	bl FUN_0200D3F8
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
_0221D7B4: .4byte 0x02234BF0
	thumb_func_end ov07_0221D740

	thumb_func_start ov07_0221D7B8
ov07_0221D7B8: @ 0x0221D7B8
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	ldr r1, _0221D870 @ =0x00004E21
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r2, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r4, r2, r1
	ldrh r3, [r0, #0x14]
	lsrs r2, r1, #2
	adds r0, #0xac
	muls r2, r3, r2
	adds r4, r4, r2
	movs r2, #0
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r2, #0x6d
	str r4, [sp, #8]
	lsrs r1, r1, #6
	lsls r2, r2, #2
	ldr r0, [r0]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	movs r3, #0x4c
	bl FUN_0200D504
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r5, #0
	str r0, [sp]
	movs r3, #0x4b
	str r3, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	str r4, [sp, #0x14]
	adds r2, #0xc0
	ldr r2, [r2]
	adds r0, #0xc8
	adds r2, #0xac
	adds r3, #0xed
	ldr r0, [r0]
	ldr r2, [r2]
	ldr r3, [r5, r3]
	movs r1, #2
	bl FUN_0200D68C
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #0x4e
	str r4, [sp, #4]
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r2, r2, #2
	adds r0, #0xac
	ldr r1, [r5, r2]
	adds r2, #0x7c
	ldr r0, [r0]
	ldr r2, [r5, r2]
	movs r3, #0x4d
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #0x4e
	str r4, [sp, #4]
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r2, r2, #2
	adds r0, #0xac
	ldr r1, [r5, r2]
	adds r2, #0x7c
	ldr r0, [r0]
	ldr r2, [r5, r2]
	movs r3, #0x4e
	bl FUN_0200D71C
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221D870: .4byte 0x00004E21
	thumb_func_end ov07_0221D7B8

	thumb_func_start ov07_0221D874
ov07_0221D874: @ 0x0221D874
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	adds r4, r0, #0
	ldr r1, [r4, #0x18]
	ldr r6, _0221DA68 @ =0x00004E21
	adds r2, r1, #4
	str r2, [r4, #0x18]
	ldr r1, [r2]
	adds r2, r2, #4
	str r2, [r4, #0x18]
	mov ip, r1
	ldr r1, [r2]
	adds r2, r2, #4
	str r2, [r4, #0x18]
	str r1, [sp, #0x10]
	ldr r1, [r2]
	adds r2, r2, #4
	str r2, [r4, #0x18]
	str r1, [sp, #0xc]
	ldr r1, [r2]
	adds r2, r2, #4
	str r2, [r4, #0x18]
	adds r2, r4, #0
	adds r2, #0xc0
	ldr r2, [r2]
	adds r1, r1, r6
	ldrh r3, [r2, #0x14]
	lsrs r2, r6, #2
	muls r2, r3, r2
	adds r2, r1, r2
	str r2, [sp, #0x58]
	adds r2, r4, #0
	adds r2, #0xc0
	ldr r2, [r2]
	ldrh r3, [r2, #0x14]
	lsrs r2, r6, #2
	muls r2, r3, r2
	adds r2, r1, r2
	str r2, [sp, #0x5c]
	adds r2, r4, #0
	adds r2, #0xc0
	ldr r2, [r2]
	ldrh r3, [r2, #0x14]
	lsrs r2, r6, #2
	muls r2, r3, r2
	adds r2, r1, r2
	str r2, [sp, #0x60]
	adds r2, r4, #0
	adds r2, #0xc0
	ldr r2, [r2]
	lsrs r3, r6, #2
	ldrh r2, [r2, #0x14]
	muls r3, r2, r3
	adds r1, r1, r3
	str r1, [sp, #0x64]
	movs r1, #0
	str r1, [sp, #0x68]
	str r1, [sp, #0x6c]
	mov r1, ip
	bl ov07_0221D3CC
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, [r0]
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #2
	adds r0, r1, r0
	adds r0, #0xb0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	str r0, [sp, #0x18]
	ldr r0, [r1, #8]
	str r0, [sp, #0x14]
	ldr r0, [r1]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0x20]
	adds r0, r4, #0
	bl ov07_0221FA48
	adds r6, r0, #0
	beq _0221D93C
	movs r1, #0
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	adds r0, r6, #0
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r0, r6, #0
	movs r1, #0x29
	bl FUN_02008A78
	subs r0, r5, r0
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
_0221D93C:
	add r0, sp, #0x24
	strh r7, [r0]
	strh r5, [r0, #2]
	movs r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	movs r0, #0x64
	str r0, [sp, #0x2c]
	movs r0, #1
	str r1, [sp, #0x30]
	str r0, [sp, #0x34]
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	add r2, sp, #0x58
	add r3, sp, #0x24
_0221D95A:
	ldr r0, [r2]
	adds r1, r1, #1
	str r0, [r3, #0x14]
	adds r2, r2, #4
	adds r3, r3, #4
	cmp r1, #6
	blt _0221D95A
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x4e
	adds r0, #0xac
	lsls r1, r1, #2
	ldr r0, [r0]
	ldr r1, [r4, r1]
	add r2, sp, #0x24
	bl FUN_0200D734
	adds r7, r0, #0
	cmp r6, #0
	bne _0221D98C
	movs r1, #0
	bl FUN_0200DCE8
	b _0221D9A0
_0221D98C:
	adds r0, r6, #0
	movs r1, #6
	bl FUN_02008A78
	cmp r0, #1
	bne _0221D9A0
	adds r0, r7, #0
	movs r1, #0
	bl FUN_0200DCE8
_0221D9A0:
	ldr r1, [sp, #0x1c]
	adds r0, r4, #0
	bl ov07_0221FA48
	cmp r0, #0
	beq _0221D9C2
	ldr r0, [r7]
	bl FUN_02024B1C
	adds r1, r0, #0
	movs r3, #0x32
	ldr r1, [r1, #4]
	ldr r2, [sp, #0x20]
	movs r0, #0x13
	lsls r3, r3, #6
	bl FUN_020205D8
_0221D9C2:
	ldr r1, [sp, #0x1c]
	adds r0, r4, #0
	bl ov07_0221FA48
	cmp r0, #0
	beq _0221D9F8
	ldr r0, [r7]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	movs r1, #2
	str r1, [sp]
	movs r1, #0x20
	lsls r0, r0, #0x14
	str r1, [sp, #4]
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x14]
	ldr r3, [r4]
	bl FUN_02003200
_0221D9F8:
	ldr r0, [sp, #0xc]
	lsls r5, r0, #2
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r6, r4, r0
	ldr r0, [r6, r5]
	cmp r0, #0
	beq _0221DA0C
	bl GF_AssertFail
_0221DA0C:
	movs r0, #0x15
	str r7, [r6, r5]
	movs r2, #1
	adds r1, r4, r5
	lsls r0, r0, #4
	str r2, [r1, r0]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _0221DA62
	ldr r1, [sp, #0x1c]
	adds r0, r4, #0
	bl ov07_0221FA48
	cmp r0, #0
	beq _0221DA62
	movs r0, #0x59
	lsls r0, r0, #2
	adds r6, r4, r0
	ldr r0, [r4]
	movs r1, #0x10
	bl FUN_0201AA8C
	str r0, [r6, r5]
	ldr r0, [r6, r5]
	ldr r1, [sp, #0x1c]
	str r7, [r0]
	adds r0, r4, #0
	bl ov07_0221FA48
	ldr r1, [r6, r5]
	ldr r2, _0221DA6C @ =0x00001001
	str r0, [r1, #8]
	ldr r0, [r6, r5]
	movs r1, #0
	strb r1, [r0, #4]
	ldr r0, [r6, r5]
	strb r1, [r0, #5]
	ldr r0, _0221DA70 @ =ov07_0221D4B0
	ldr r1, [r6, r5]
	bl FUN_0200E320
	ldr r1, [r6, r5]
	str r0, [r1, #0xc]
_0221DA62:
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221DA68: .4byte 0x00004E21
_0221DA6C: .4byte 0x00001001
_0221DA70: .4byte ov07_0221D4B0
	thumb_func_end ov07_0221D874

	thumb_func_start ov07_0221DA74
ov07_0221DA74: @ 0x0221DA74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	adds r0, r0, #4
	str r0, [r4, #0x18]
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0221DA96
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200D998
_0221DA96:
	movs r0, #0x4e
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov07_0221DA74

	thumb_func_start ov07_0221DAA0
ov07_0221DAA0: @ 0x0221DAA0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	movs r0, #0x4f
	lsls r0, r0, #2
	lsls r4, r1, #2
	adds r6, r5, r0
	ldr r0, [r6, r4]
	cmp r0, #0
	beq _0221DAC2
	bl FUN_0200D9DC
_0221DAC2:
	movs r0, #0x15
	movs r2, #0
	adds r1, r5, r4
	lsls r0, r0, #4
	str r2, [r1, r0]
	str r2, [r6, r4]
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221DAA0

	thumb_func_start ov07_0221DAD0
ov07_0221DAD0: @ 0x0221DAD0
	push {r3, lr}
	ldr r2, [r1, #0xc]
	cmp r2, #0
	bne _0221DADE
	bl FUN_0200E390
	pop {r3, pc}
_0221DADE:
	movs r0, #0x4e
	ldr r2, [r1]
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0221DAF0
	ldr r0, [r1, #4]
	bl FUN_0200D020
_0221DAF0:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov07_0221DAD0

	thumb_func_start ov07_0221DAF4
ov07_0221DAF4: @ 0x0221DAF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	adds r6, r5, #0
	adds r1, r0, #4
	str r1, [r5, #0x18]
	ldr r0, [r1]
	adds r6, #0x54
	str r0, [sp]
	adds r0, r1, #4
	str r0, [r5, #0x18]
	ldr r2, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	adds r0, r5, #0
	lsls r4, r2, #4
	str r0, [sp, #8]
	adds r0, #0x4c
	lsls r1, r1, #2
	str r0, [sp, #8]
	str r5, [r0, r4]
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r3, [r5, r0]
	adds r2, r5, r4
	str r3, [r2, #0x50]
	adds r1, r5, r1
	adds r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	str r0, [r6, r4]
	movs r0, #1
	str r0, [r2, #0x58]
	ldr r0, [r6, r4]
	bl FUN_0200DCE8
	adds r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	beq _0221DB50
	b _0221DC9E
_0221DB50:
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_02231924
	str r0, [sp, #4]
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_02231924
	adds r7, r0, #0
	ldr r1, [sp]
	adds r0, r5, #0
	bl ov07_0221D3CC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0221FA48
	cmp r0, #0
	beq _0221DB8C
	movs r1, #6
	bl FUN_02008A78
	b _0221DB8E
_0221DB8C:
	movs r0, #0
_0221DB8E:
	cmp r0, #1
	ldr r0, [r6, r4]
	bne _0221DB9C
	movs r1, #0
	bl FUN_0200DCE8
	b _0221DBA2
_0221DB9C:
	movs r1, #1
	bl FUN_0200DCE8
_0221DBA2:
	ldr r0, [sp]
	cmp r0, #3
	bhi _0221DC90
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221DBB4: @ jump table
	.2byte _0221DBBC - _0221DBB4 - 2 @ case 0
	.2byte _0221DC0A - _0221DBB4 - 2 @ case 1
	.2byte _0221DBE2 - _0221DBB4 - 2 @ case 2
	.2byte _0221DC4E - _0221DBB4 - 2 @ case 3
_0221DBBC:
	ldr r0, [sp, #4]
	subs r0, r0, #3
	cmp r0, #1
	bhi _0221DBCE
	ldr r0, [r6, r4]
	movs r1, #1
	bl FUN_0200DD68
	b _0221DC90
_0221DBCE:
	adds r5, #0x54
	ldr r0, [r5, r4]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r5, r4]
	movs r1, #0xff
	bl FUN_0200DD68
	b _0221DC90
_0221DBE2:
	ldr r0, [sp, #4]
	cmp r0, #5
	beq _0221DBEC
	cmp r0, #2
	bne _0221DBF6
_0221DBEC:
	ldr r0, [r6, r4]
	movs r1, #1
	bl FUN_0200DD68
	b _0221DC90
_0221DBF6:
	adds r5, #0x54
	ldr r0, [r5, r4]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r5, r4]
	movs r1, #0xff
	bl FUN_0200DD68
	b _0221DC90
_0221DC0A:
	cmp r7, #5
	bhi _0221DC90
	adds r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221DC1A: @ jump table
	.2byte _0221DC90 - _0221DC1A - 2 @ case 0
	.2byte _0221DC90 - _0221DC1A - 2 @ case 1
	.2byte _0221DC26 - _0221DC1A - 2 @ case 2
	.2byte _0221DC30 - _0221DC1A - 2 @ case 3
	.2byte _0221DC3A - _0221DC1A - 2 @ case 4
	.2byte _0221DC44 - _0221DC1A - 2 @ case 5
_0221DC26:
	ldr r0, [r6, r4]
	movs r1, #0xff
	bl FUN_0200DD68
	b _0221DC90
_0221DC30:
	ldr r0, [r6, r4]
	movs r1, #1
	bl FUN_0200DD68
	b _0221DC90
_0221DC3A:
	ldr r0, [r6, r4]
	movs r1, #1
	bl FUN_0200DD68
	b _0221DC90
_0221DC44:
	ldr r0, [r6, r4]
	movs r1, #0xff
	bl FUN_0200DD68
	b _0221DC90
_0221DC4E:
	cmp r7, #5
	bhi _0221DC90
	adds r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221DC5E: @ jump table
	.2byte _0221DC90 - _0221DC5E - 2 @ case 0
	.2byte _0221DC90 - _0221DC5E - 2 @ case 1
	.2byte _0221DC6A - _0221DC5E - 2 @ case 2
	.2byte _0221DC74 - _0221DC5E - 2 @ case 3
	.2byte _0221DC7E - _0221DC5E - 2 @ case 4
	.2byte _0221DC88 - _0221DC5E - 2 @ case 5
_0221DC6A:
	ldr r0, [r6, r4]
	movs r1, #1
	bl FUN_0200DD68
	b _0221DC90
_0221DC74:
	ldr r0, [r6, r4]
	movs r1, #0xff
	bl FUN_0200DD68
	b _0221DC90
_0221DC7E:
	ldr r0, [r6, r4]
	movs r1, #0xff
	bl FUN_0200DD68
	b _0221DC90
_0221DC88:
	ldr r0, [r6, r4]
	movs r1, #1
	bl FUN_0200DD68
_0221DC90:
	ldr r1, [sp, #8]
	movs r2, #1
	ldr r0, _0221DCA4 @ =ov07_0221DAD0
	adds r1, r1, r4
	lsls r2, r2, #0xc
	bl FUN_0200E320
_0221DC9E:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0221DCA4: .4byte ov07_0221DAD0
	thumb_func_end ov07_0221DAF4

	thumb_func_start ov07_0221DCA8
ov07_0221DCA8: @ 0x0221DCA8
	ldr r1, [r0, #0x18]
	movs r2, #0
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r3, [r1]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	lsls r1, r3, #4
	adds r0, r0, r1
	str r2, [r0, #0x58]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221DCA8

	thumb_func_start ov07_0221DCC0
ov07_0221DCC0: @ 0x0221DCC0
	ldr r1, [r0, #0x18]
	ldr r3, _0221DCD0 @ =ov07_0221D55C
	adds r2, r1, #4
	str r2, [r0, #0x18]
	ldr r1, [r2]
	adds r2, r2, #4
	str r2, [r0, #0x18]
	bx r3
	.align 2, 0
_0221DCD0: .4byte ov07_0221D55C
	thumb_func_end ov07_0221DCC0

	thumb_func_start ov07_0221DCD4
ov07_0221DCD4: @ 0x0221DCD4
	ldr r1, [r0, #0x18]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r3, [r1]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	adds r0, r0, r3
	adds r0, #0x6c
	strb r2, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221DCD4

	thumb_func_start ov07_0221DCF0
ov07_0221DCF0: @ 0x0221DCF0
	ldr r1, [r0, #0x18]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r3, [r1]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	adds r0, r0, r3
	adds r0, #0x7c
	strb r2, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221DCF0

	thumb_func_start ov07_0221DD0C
ov07_0221DD0C: @ 0x0221DD0C
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221DD0C

	thumb_func_start ov07_0221DD10
ov07_0221DD10: @ 0x0221DD10
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221DD10

	thumb_func_start ov07_0221DD14
ov07_0221DD14: @ 0x0221DD14
	push {r4, r5}
	movs r4, #0
	movs r2, #1
_0221DD1A:
	ldr r5, [r0]
	cmp r5, #0
	beq _0221DD2C
	cmp r1, #5
	beq _0221DD2A
	ldr r3, [r5, #0x1c]
	cmp r1, r3
	bne _0221DD2C
_0221DD2A:
	str r2, [r5, #0x18]
_0221DD2C:
	adds r4, r4, #1
	adds r0, r0, #4
	cmp r4, #4
	blt _0221DD1A
	pop {r4, r5}
	bx lr
	thumb_func_end ov07_0221DD14

	thumb_func_start ov07_0221DD38
ov07_0221DD38: @ 0x0221DD38
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	movs r4, #0
_0221DD42:
	lsls r0, r4, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0221DD54
	ldr r0, [r0, #0x1c]
	cmp r6, r0
	bne _0221DD54
	bl GF_AssertFail
_0221DD54:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _0221DD42
	movs r2, #0
_0221DD60:
	lsls r1, r2, #2
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _0221DD70
	str r7, [r5, r1]
	ldr r0, [r5, r1]
	str r6, [r0, #0x1c]
	pop {r3, r4, r5, r6, r7, pc}
_0221DD70:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #4
	blo _0221DD60
	ldr r0, _0221DD88 @ =0x02237840
	cmp r0, #0
	beq _0221DD84
	bl GF_AssertFail
_0221DD84:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221DD88: .4byte 0x02237840
	thumb_func_end ov07_0221DD38

	thumb_func_start ov07_0221DD8C
ov07_0221DD8C: @ 0x0221DD8C
	push {r3, r4}
	movs r4, #0
_0221DD90:
	lsls r2, r4, #2
	ldr r3, [r0, r2]
	ldr r2, [r3, #0x1c]
	cmp r1, r2
	bne _0221DDA0
	adds r0, r3, #0
	pop {r3, r4}
	bx lr
_0221DDA0:
	adds r2, r4, #1
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #4
	blo _0221DD90
	movs r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov07_0221DD8C

	thumb_func_start ov07_0221DDB0
ov07_0221DDB0: @ 0x0221DDB0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r1, #0xc0
	ldr r1, [r1]
	adds r5, r0, #0
	ldrh r1, [r1, #0x14]
	adds r0, r4, #0
	adds r6, r2, #0
	bl ov07_0223192C
	adds r7, r0, #0
	adds r0, r4, #0
	adds r4, #0xc0
	ldr r1, [r4]
	ldrh r1, [r1, #0x16]
	bl ov07_0223192C
	lsls r1, r6, #2
	adds r1, r5, r1
	ldr r1, [r1, #0x1c]
	cmp r1, #2
	bne _0221DDF4
	cmp r7, r0
	bne _0221DDEC
	cmp r0, #3
	beq _0221DDE8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221DDE8:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221DDEC:
	cmp r0, #3
	bne _0221DE00
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221DDF4:
	cmp r1, #0
	beq _0221DE00
	cmp r0, #3
	bne _0221DE00
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221DE00:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221DDB0

	thumb_func_start ov07_0221DE04
ov07_0221DE04: @ 0x0221DE04
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	adds r5, r1, #0
	adds r0, r3, #0
	movs r1, #0
	adds r4, r2, #0
	str r3, [sp, #0x10]
	bl ov07_0221FB7C
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	adds r2, r5, #0
	str r0, [sp, #0xc]
	adds r2, #0xc4
	ldr r2, [r2]
	movs r0, #7
	adds r3, r4, #0
	bl FUN_020078F0
	ldr r0, [sp, #0x10]
	movs r1, #1
	bl ov07_0221FB7C
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x90
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldr r3, [r5]
	movs r1, #7
	bl FUN_02003200
	adds r0, r5, #0
	adds r0, #0xc4
	lsls r1, r4, #0x18
	ldr r0, [r0]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r5, #0
	movs r6, #2
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221DE78
	movs r6, #4
	b _0221DE88
_0221DE78:
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #7
	bl ov07_0221DDB0
	cmp r0, #1
	bne _0221DE88
	movs r6, #3
_0221DE88:
	ldr r0, [sp, #0x10]
	adds r1, r6, #0
	bl ov07_0221FB7C
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	adds r5, #0xc4
	str r0, [sp, #0xc]
	ldr r2, [r5]
	movs r0, #7
	adds r3, r4, #0
	bl FUN_02007914
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221DE04

	thumb_func_start ov07_0221DEB0
ov07_0221DEB0: @ 0x0221DEB0
	lsls r0, r0, #0x10
	ands r0, r1
	cmp r1, r0
	bne _0221DEBC
	movs r0, #1
	bx lr
_0221DEBC:
	movs r0, #0
	bx lr
	thumb_func_end ov07_0221DEB0

	thumb_func_start ov07_0221DEC0
ov07_0221DEC0: @ 0x0221DEC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r3, _0221DF14 @ =0x02234BA8
	add r2, sp, #0
	adds r5, r0, #0
	adds r4, r2, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r7, _0221DF18 @ =0x02234C40
	movs r6, #0
_0221DEDC:
	ldr r0, [r5, #0x18]
	ldr r1, [r4]
	bl ov07_0221DEB0
	cmp r0, #0
	beq _0221DF06
	ldr r0, [r4]
	movs r1, #0
	lsrs r2, r0, #0x10
	cmp r2, #2
	blt _0221DEFE
_0221DEF2:
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r2, r0, #1
	adds r1, r1, #1
	cmp r2, #2
	bge _0221DEF2
_0221DEFE:
	lsls r1, r1, #2
	ldr r1, [r7, r1]
	adds r0, r5, #0
	blx r1
_0221DF06:
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #6
	blo _0221DEDC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221DF14: .4byte 0x02234BA8
_0221DF18: .4byte 0x02234C40
	thumb_func_end ov07_0221DEC0

	thumb_func_start ov07_0221DF1C
ov07_0221DF1C: @ 0x0221DF1C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0x4c
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _0221DF34
	bl GF_AssertFail
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221DF34:
	movs r1, #0
	movs r2, #0x4c
	blx FUN_020E5B44
	movs r0, #0
	str r0, [r4]
	strb r0, [r4, #5]
	strb r0, [r4, #0xf]
	strb r0, [r4, #0xe]
	str r5, [r4, #0x48]
	strb r0, [r4, #9]
	movs r0, #0x1f
	strb r0, [r4, #0xa]
	movs r0, #0x1d
	strb r0, [r4, #0xb]
	movs r0, #2
	strb r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	cmp r0, #1
	bne _0221DF72
	movs r0, #0
	strb r0, [r4, #9]
	movs r0, #0x1f
	strb r0, [r4, #0xa]
	movs r0, #0xf
	strb r0, [r4, #0xb]
	movs r0, #7
	strb r0, [r4, #0xc]
_0221DF72:
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	cmp r0, #2
	bne _0221DF8E
	movs r0, #7
	strb r0, [r4, #9]
	movs r0, #0xf
	strb r0, [r4, #0xa]
	movs r0, #0x1d
	strb r0, [r4, #0xb]
	movs r0, #2
	strb r0, [r4, #0xc]
_0221DF8E:
	movs r1, #0
	adds r2, r5, #0
	adds r3, r4, #0
_0221DF94:
	adds r0, r2, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r1, r1, #1
	str r0, [r3, #0x1c]
	adds r2, r2, #4
	adds r3, r3, #4
	cmp r1, #0xa
	blt _0221DF94
	movs r0, #0x5f
	movs r1, #1
	lsls r0, r0, #2
	strb r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0221DF1C

	thumb_func_start ov07_0221DFB4
ov07_0221DFB4: @ 0x0221DFB4
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _0221DFC8
	cmp r0, #1
	beq _0221E006
	cmp r0, #2
	beq _0221E058
	b _0221E0A2
_0221DFC8:
	ldr r0, [r5, #0x48]
	movs r1, #2
	bl ov07_0221EB98
	ldr r0, [r5, #0x48]
	movs r1, #2
	bl ov07_0221FB04
	adds r4, r0, #0
	ldr r0, [r5, #0x48]
	movs r1, #1
	bl ov07_0221FB04
	lsls r1, r4, #0x18
	movs r0, #3
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	lsls r1, r4, #0x18
	movs r0, #2
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	movs r0, #2
	movs r1, #1
	bl FUN_0201BC28
	ldrb r0, [r5, #5]
	adds r0, r0, #1
	strb r0, [r5, #5]
	b _0221E0A6
_0221E006:
	ldr r0, [r5, #0x48]
	movs r1, #3
	adds r0, #0xc4
	ldr r0, [r0]
	movs r2, #2
	adds r3, r1, #0
	bl FUN_0201B1F4
	ldr r0, [r5, #0x48]
	bl ov07_0221BFC0
	cmp r0, #1
	beq _0221E030
	ldr r0, [r5, #0x48]
	movs r2, #0
	adds r0, #0xc4
	ldr r0, [r0]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201B1F4
_0221E030:
	ldr r1, [r5, #0x48]
	ldr r3, [r5, #0x10]
	adds r0, r5, #0
	movs r2, #3
	bl ov07_0221DE04
	ldrb r0, [r5, #9]
	movs r1, #4
	movs r2, #8
	str r0, [sp]
	ldrb r3, [r5, #0xa]
	ldr r0, _0221E0AC @ =0x04000050
	blx FUN_020CF15C
	adds r0, r5, #0
	bl ov07_0221DEC0
	ldrb r0, [r5, #5]
	adds r0, r0, #1
	strb r0, [r5, #5]
_0221E058:
	ldrb r1, [r5, #9]
	ldrb r0, [r5, #0xb]
	movs r2, #0
	cmp r1, r0
	bhs _0221E068
	adds r0, r1, #2
	strb r0, [r5, #9]
	b _0221E06A
_0221E068:
	adds r2, r2, #1
_0221E06A:
	ldrb r1, [r5, #0xa]
	ldrb r0, [r5, #0xc]
	cmp r1, r0
	bls _0221E078
	subs r0, r1, #2
	strb r0, [r5, #0xa]
	b _0221E07A
_0221E078:
	adds r2, r2, #1
_0221E07A:
	cmp r2, #2
	bne _0221E08C
	ldrb r0, [r5, #0xb]
	strb r0, [r5, #9]
	ldrb r0, [r5, #0xc]
	strb r0, [r5, #0xa]
	ldrb r0, [r5, #5]
	adds r0, r0, #1
	strb r0, [r5, #5]
_0221E08C:
	ldrb r0, [r5, #9]
	ldrb r1, [r5, #0xa]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0221E0B0 @ =0x04000052
	strh r1, [r0]
	ldrb r0, [r5, #5]
	cmp r0, #2
	beq _0221E0A6
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221E0A2:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221E0A6:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0221E0AC: .4byte 0x04000050
_0221E0B0: .4byte 0x04000052
	thumb_func_end ov07_0221DFB4

	thumb_func_start ov07_0221E0B4
ov07_0221E0B4: @ 0x0221E0B4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r1, #0
	ldrb r0, [r4, #5]
	cmp r0, #4
	bls _0221E0C2
	b _0221E26C
_0221E0C2:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221E0CE: @ jump table
	.2byte _0221E0D8 - _0221E0CE - 2 @ case 0
	.2byte _0221E0E6 - _0221E0CE - 2 @ case 1
	.2byte _0221E12A - _0221E0CE - 2 @ case 2
	.2byte _0221E170 - _0221E0CE - 2 @ case 3
	.2byte _0221E250 - _0221E0CE - 2 @ case 4
_0221E0D8:
	movs r0, #2
	movs r1, #1
	bl FUN_0201BC28
	ldrb r0, [r4, #5]
	adds r0, r0, #1
	strb r0, [r4, #5]
_0221E0E6:
	ldr r0, [r4, #0x48]
	movs r1, #2
	bl ov07_0221FB04
	adds r5, r0, #0
	ldr r0, [r4, #0x48]
	movs r1, #1
	bl ov07_0221FB04
	lsls r1, r5, #0x18
	adds r6, r0, #0
	movs r0, #3
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	lsls r1, r6, #0x18
	movs r0, #2
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	ldrb r0, [r4, #0xa]
	movs r1, #4
	movs r2, #8
	str r0, [sp]
	ldrb r3, [r4, #9]
	ldr r0, _0221E278 @ =0x04000050
	blx FUN_020CF15C
	adds r0, r4, #0
	bl ov07_0221DEC0
	ldrb r0, [r4, #5]
	adds r0, r0, #1
	strb r0, [r4, #5]
_0221E12A:
	ldrb r1, [r4, #9]
	ldrb r0, [r4, #0xb]
	movs r2, #0
	cmp r1, r0
	bhs _0221E13A
	adds r0, r1, #2
	strb r0, [r4, #9]
	b _0221E13C
_0221E13A:
	adds r2, r2, #1
_0221E13C:
	ldrb r1, [r4, #0xa]
	ldrb r0, [r4, #0xc]
	cmp r1, r0
	bls _0221E14A
	subs r0, r1, #2
	strb r0, [r4, #0xa]
	b _0221E14C
_0221E14A:
	adds r2, r2, #1
_0221E14C:
	cmp r2, #2
	bne _0221E162
	ldrb r0, [r4, #0xb]
	adds r0, r0, #2
	strb r0, [r4, #9]
	ldrb r0, [r4, #0xc]
	subs r0, r0, #2
	strb r0, [r4, #0xa]
	ldrb r0, [r4, #5]
	adds r0, r0, #1
	strb r0, [r4, #5]
_0221E162:
	ldrb r0, [r4, #0xa]
	ldrb r1, [r4, #9]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0221E27C @ =0x04000052
	strh r1, [r0]
	b _0221E272
_0221E170:
	adds r0, r4, #0
	bl ov07_0221E664
	ldr r0, [r4, #0x48]
	movs r2, #0
	adds r0, #0xc4
	ldr r0, [r0]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201BC8C
	ldr r0, [r4, #0x48]
	movs r1, #3
	adds r0, #0xc4
	ldr r0, [r0]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r4, #0x48]
	movs r1, #3
	adds r0, #0xc4
	ldr r0, [r0]
	movs r2, #2
	movs r3, #4
	bl FUN_0201B1F4
	ldr r0, [r4, #0x48]
	bl ov07_0221BFC0
	cmp r0, #0
	bne _0221E1D0
	ldr r0, [r4, #0x48]
	movs r1, #3
	adds r0, #0xc4
	ldr r0, [r0]
	movs r2, #0
	movs r3, #1
	bl FUN_0201B1F4
	ldr r0, [r4, #0x48]
	movs r1, #3
	bl ov07_0221FB30
	ldr r0, [r4, #0x48]
	bl ov07_0221FB58
	b _0221E224
_0221E1D0:
	ldr r2, [r4, #0x48]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r2]
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r2, r1]
	adds r1, r1, #4
	ldr r1, [r2, r1]
	adds r2, #0xc4
	ldr r2, [r2]
	movs r3, #3
	bl FUN_020078F0
	movs r2, #0x69
	lsls r2, r2, #2
	adds r1, r2, #0
	ldr r3, [r4, #0x48]
	movs r0, #0
	str r0, [sp]
	ldr r0, [r3, r2]
	subs r1, #0x14
	lsls r0, r0, #5
	str r0, [sp, #4]
	subs r0, r2, #4
	ldr r0, [r3, r0]
	subs r2, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r0, r3, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldr r1, [r3, r1]
	ldr r2, [r3, r2]
	ldr r3, [r3]
	bl FUN_02003200
_0221E224:
	ldr r2, [r4, #0x48]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r2]
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r2, r1]
	adds r1, #0xc
	ldr r1, [r2, r1]
	adds r2, #0xc4
	ldr r2, [r2]
	movs r3, #3
	bl FUN_02007914
	ldrb r0, [r4, #5]
	adds r0, r0, #1
	strb r0, [r4, #5]
	b _0221E272
_0221E250:
	bl FUN_0223C340
	movs r0, #2
	movs r1, #0
	bl FUN_0201BC28
	ldr r0, [r4, #0x48]
	movs r1, #2
	bl ov07_0221EC7C
	ldrb r0, [r4, #5]
	adds r0, r0, #1
	strb r0, [r4, #5]
	b _0221E272
_0221E26C:
	add sp, #0x10
	movs r0, #0
	pop {r4, r5, r6, pc}
_0221E272:
	movs r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221E278: .4byte 0x04000050
_0221E27C: .4byte 0x04000052
	thumb_func_end ov07_0221E0B4

	thumb_func_start ov07_0221E280
ov07_0221E280: @ 0x0221E280
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _0221E292
	cmp r0, #1
	beq _0221E316
	b _0221E39A
_0221E292:
	ldrb r0, [r4, #0xd]
	ldr r2, [r4, #0x48]
	cmp r0, #0
	bne _0221E2D4
	movs r1, #0
	str r1, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r3, #0x6a
	str r1, [sp, #8]
	adds r0, r2, #0
	lsls r3, r3, #2
	ldr r2, [r2, r3]
	movs r3, #0xe
	adds r0, #0xc8
	lsls r2, r2, #0x10
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	movs r1, #1
	lsrs r2, r2, #0x10
	bl FUN_02003474
	movs r1, #0
	str r1, [sp]
	ldr r0, [r4, #0x48]
	movs r2, #2
	adds r0, #0xc8
	ldr r0, [r0]
	lsls r2, r2, #8
	movs r3, #0x10
	bl FUN_02003EA4
	b _0221E310
_0221E2D4:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0221E3B4 @ =0x0000FFFF
	movs r3, #0x6a
	str r0, [sp, #8]
	adds r0, r2, #0
	lsls r3, r3, #2
	ldr r2, [r2, r3]
	movs r3, #0xe
	adds r0, #0xc8
	lsls r2, r2, #0x10
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	movs r1, #1
	lsrs r2, r2, #0x10
	bl FUN_02003474
	ldr r0, _0221E3B4 @ =0x0000FFFF
	movs r2, #2
	str r0, [sp]
	ldr r0, [r4, #0x48]
	movs r1, #0
	adds r0, #0xc8
	ldr r0, [r0]
	lsls r2, r2, #8
	movs r3, #0x10
	bl FUN_02003EA4
_0221E310:
	ldrb r0, [r4, #5]
	adds r0, r0, #1
	strb r0, [r4, #5]
_0221E316:
	ldr r0, [r4, #0x48]
	adds r0, #0xc8
	ldr r0, [r0]
	bl FUN_02003B44
	cmp r0, #0
	bne _0221E3AE
	ldr r0, [r4, #0x48]
	movs r2, #0
	adds r0, #0xc4
	ldr r0, [r0]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201B1F4
	ldr r1, [r4, #0x48]
	ldr r3, [r4, #0x10]
	adds r0, r4, #0
	movs r2, #3
	bl ov07_0221DE04
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	bne _0221E364
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x48]
	movs r3, #0xe
	adds r0, #0xc8
	movs r1, #1
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	lsls r2, r1, #9
	bl FUN_02003474
	b _0221E382
_0221E364:
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0221E3B4 @ =0x0000FFFF
	movs r3, #0xe
	str r0, [sp, #8]
	ldr r0, [r4, #0x48]
	movs r1, #1
	adds r0, #0xc8
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	lsls r2, r1, #9
	bl FUN_02003474
_0221E382:
	adds r0, r4, #0
	bl ov07_0221DEC0
	movs r0, #0x5f
	ldr r1, [r4, #0x48]
	movs r2, #2
	lsls r0, r0, #2
	strb r2, [r1, r0]
	ldrb r0, [r4, #5]
	adds r0, r0, #1
	strb r0, [r4, #5]
	b _0221E3AE
_0221E39A:
	ldr r0, [r4, #0x48]
	adds r0, #0xc8
	ldr r0, [r0]
	bl FUN_02003B44
	cmp r0, #0
	bne _0221E3AE
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_0221E3AE:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0221E3B4: .4byte 0x0000FFFF
	thumb_func_end ov07_0221E280

	thumb_func_start ov07_0221E3B8
ov07_0221E3B8: @ 0x0221E3B8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r1, #0
	ldrb r0, [r4, #5]
	cmp r0, #3
	bls _0221E3C6
	b _0221E5B0
_0221E3C6:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221E3D2: @ jump table
	.2byte _0221E3DA - _0221E3D2 - 2 @ case 0
	.2byte _0221E3E6 - _0221E3D2 - 2 @ case 1
	.2byte _0221E468 - _0221E3D2 - 2 @ case 2
	.2byte _0221E536 - _0221E3D2 - 2 @ case 3
_0221E3DA:
	adds r0, r4, #0
	bl ov07_0221DEC0
	ldrb r0, [r4, #5]
	adds r0, r0, #1
	strb r0, [r4, #5]
_0221E3E6:
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	bne _0221E426
	movs r1, #0
	str r1, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0x48]
	movs r3, #0xf
	adds r0, #0xc8
	movs r1, #1
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	lsls r2, r1, #9
	bl FUN_02003474
	ldr r3, [r4, #0x48]
	movs r1, #0
	movs r2, #0x6a
	adds r0, r3, #0
	str r1, [sp]
	lsls r2, r2, #2
	ldr r2, [r3, r2]
	adds r0, #0xc8
	lsls r2, r2, #0x10
	ldr r0, [r0]
	lsrs r2, r2, #0x10
	movs r3, #0x10
	bl FUN_02003EA4
	b _0221E462
_0221E426:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0221E5DC @ =0x0000FFFF
	movs r3, #0xf
	str r0, [sp, #8]
	ldr r0, [r4, #0x48]
	movs r1, #1
	adds r0, #0xc8
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	lsls r2, r1, #9
	bl FUN_02003474
	movs r2, #0x6a
	ldr r3, [r4, #0x48]
	ldr r0, _0221E5DC @ =0x0000FFFF
	lsls r2, r2, #2
	str r0, [sp]
	adds r0, r3, #0
	ldr r2, [r3, r2]
	adds r0, #0xc8
	lsls r2, r2, #0x10
	ldr r0, [r0]
	movs r1, #0
	lsrs r2, r2, #0x10
	movs r3, #0x10
	bl FUN_02003EA4
_0221E462:
	ldrb r0, [r4, #5]
	adds r0, r0, #1
	strb r0, [r4, #5]
_0221E468:
	ldr r0, [r4, #0x48]
	adds r0, #0xc8
	ldr r0, [r0]
	bl FUN_02003B44
	cmp r0, #0
	beq _0221E478
	b _0221E5D4
_0221E478:
	adds r0, r4, #0
	bl ov07_0221E664
	movs r0, #3
	movs r1, #0
	bl FUN_0201BC28
	ldr r0, [r4, #0x48]
	bl ov07_0221BFC0
	cmp r0, #0
	bne _0221E4B0
	ldr r0, [r4, #0x48]
	movs r1, #3
	adds r0, #0xc4
	ldr r0, [r0]
	movs r2, #0
	movs r3, #1
	bl FUN_0201B1F4
	ldr r0, [r4, #0x48]
	movs r1, #3
	bl ov07_0221FB30
	ldr r0, [r4, #0x48]
	bl ov07_0221FB58
	b _0221E504
_0221E4B0:
	ldr r2, [r4, #0x48]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r2]
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r2, r1]
	adds r1, r1, #4
	ldr r1, [r2, r1]
	adds r2, #0xc4
	ldr r2, [r2]
	movs r3, #3
	bl FUN_020078F0
	movs r2, #0x69
	lsls r2, r2, #2
	adds r1, r2, #0
	ldr r3, [r4, #0x48]
	movs r0, #0
	str r0, [sp]
	ldr r0, [r3, r2]
	subs r1, #0x14
	lsls r0, r0, #5
	str r0, [sp, #4]
	subs r0, r2, #4
	ldr r0, [r3, r0]
	subs r2, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r0, r3, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldr r1, [r3, r1]
	ldr r2, [r3, r2]
	ldr r3, [r3]
	bl FUN_02003200
_0221E504:
	ldr r2, [r4, #0x48]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r2]
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r2, r1]
	adds r1, #0xc
	ldr r1, [r2, r1]
	adds r2, #0xc4
	ldr r2, [r2]
	movs r3, #3
	bl FUN_02007914
	movs r0, #3
	movs r1, #1
	bl FUN_0201BC28
	ldrb r0, [r4, #5]
	adds r0, r0, #1
	strb r0, [r4, #5]
_0221E536:
	ldr r0, [r4, #0x48]
	movs r2, #0
	adds r0, #0xc4
	ldr r0, [r0]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201BC8C
	ldr r0, [r4, #0x48]
	movs r1, #3
	adds r0, #0xc4
	ldr r0, [r0]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	ldrb r0, [r4, #0xd]
	ldr r2, [r4, #0x48]
	cmp r0, #0
	bne _0221E584
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r3, #0x6a
	str r0, [sp, #8]
	adds r0, r2, #0
	lsls r3, r3, #2
	ldr r2, [r2, r3]
	movs r3, #0xf
	adds r0, #0xc8
	lsls r2, r2, #0x10
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	movs r1, #1
	lsrs r2, r2, #0x10
	bl FUN_02003474
	b _0221E5AA
_0221E584:
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0221E5DC @ =0x0000FFFF
	movs r3, #0x6a
	str r0, [sp, #8]
	adds r0, r2, #0
	lsls r3, r3, #2
	ldr r2, [r2, r3]
	movs r3, #0xf
	adds r0, #0xc8
	lsls r2, r2, #0x10
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	movs r1, #1
	lsrs r2, r2, #0x10
	bl FUN_02003474
_0221E5AA:
	ldrb r0, [r4, #5]
	adds r0, r0, #1
	strb r0, [r4, #5]
_0221E5B0:
	ldr r0, [r4, #0x48]
	adds r0, #0xc8
	ldr r0, [r0]
	bl FUN_02003B44
	cmp r0, #0
	bne _0221E5D4
	movs r0, #0x5f
	ldr r1, [r4, #0x48]
	movs r2, #2
	lsls r0, r0, #2
	strb r2, [r1, r0]
	ldrb r0, [r4, #5]
	add sp, #0x10
	adds r0, r0, #1
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
_0221E5D4:
	movs r0, #1
	add sp, #0x10
	pop {r4, pc}
	nop
_0221E5DC: .4byte 0x0000FFFF
	thumb_func_end ov07_0221E3B8

	thumb_func_start ov07_0221E5E0
ov07_0221E5E0: @ 0x0221E5E0
	push {r3, lr}
	adds r0, r1, #0
	bl ov07_0221DEC0
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov07_0221E5E0

	thumb_func_start ov07_0221E5EC
ov07_0221E5EC: @ 0x0221E5EC
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl ov07_0221DEC0
	adds r0, r4, #0
	bl ov07_0221E664
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov07_0221E5EC

	thumb_func_start ov07_0221E600
ov07_0221E600: @ 0x0221E600
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #1
	bne _0221E61A
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
	pop {r3, r4, r5, pc}
_0221E61A:
	movs r3, #4
	movs r1, #8
	ldrsh r2, [r4, r3]
	ldrsh r0, [r4, r1]
	adds r0, r2, r0
	strh r0, [r4, #4]
	movs r0, #6
	ldrsh r2, [r4, r0]
	movs r0, #0xa
	ldrsh r0, [r4, r0]
	adds r0, r2, r0
	strh r0, [r4, #6]
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0221E648
	ldr r1, [r4, #0xc]
	ldrsh r3, [r4, r3]
	lsls r1, r1, #0x18
	ldr r0, [r4]
	lsrs r1, r1, #0x18
	movs r2, #0
	bl FUN_0201BC8C
_0221E648:
	movs r0, #0xa
	ldrsh r0, [r4, r0]
	cmp r0, #0
	beq _0221E662
	ldr r1, [r4, #0xc]
	movs r3, #6
	lsls r1, r1, #0x18
	ldrsh r3, [r4, r3]
	ldr r0, [r4]
	lsrs r1, r1, #0x18
	movs r2, #3
	bl FUN_0201BC8C
_0221E662:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221E600

	thumb_func_start ov07_0221E664
ov07_0221E664: @ 0x0221E664
	push {r4, lr}
	adds r4, r0, #0
	bne _0221E66E
	bl GF_AssertFail
_0221E66E:
	ldr r0, [r4, #0x48]
	cmp r0, #0
	bne _0221E678
	bl GF_AssertFail
_0221E678:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r1, [r0]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0221E696
	movs r0, #6
	ldr r1, [r4, #0x48]
	lsls r0, r0, #6
	adds r0, r1, r0
	movs r1, #1
	bl ov07_0221DD14
	pop {r4, pc}
_0221E696:
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0221E6AE
	movs r0, #6
	ldr r1, [r4, #0x48]
	lsls r0, r0, #6
	adds r0, r1, r0
	movs r1, #2
	bl ov07_0221DD14
	pop {r4, pc}
_0221E6AE:
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0221E6C4
	movs r0, #6
	ldr r1, [r4, #0x48]
	lsls r0, r0, #6
	adds r0, r1, r0
	movs r1, #3
	bl ov07_0221DD14
_0221E6C4:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_0221E664

	thumb_func_start ov07_0221E6C8
ov07_0221E6C8: @ 0x0221E6C8
	movs r1, #0x6a
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov07_0221E6C8

	thumb_func_start ov07_0221E6D0
ov07_0221E6D0: @ 0x0221E6D0
	movs r0, #0
	bx lr
	thumb_func_end ov07_0221E6D0

	thumb_func_start ov07_0221E6D4
ov07_0221E6D4: @ 0x0221E6D4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x48]
	movs r1, #0x28
	ldr r0, [r0]
	bl FUN_0201AA8C
	adds r4, r0, #0
	ldr r0, [r5, #0x48]
	movs r2, #6
	adds r0, #0xc4
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, [r5, #0x48]
	adds r0, #0x9c
	ldr r0, [r0]
	strh r0, [r4, #4]
	ldr r0, [r5, #0x48]
	adds r0, #0xa0
	ldr r0, [r0]
	strh r0, [r4, #6]
	ldr r0, [r5, #0x48]
	adds r0, #0x94
	ldr r0, [r0]
	strh r0, [r4, #8]
	ldr r0, [r5, #0x48]
	adds r0, #0x98
	ldr r0, [r0]
	strh r0, [r4, #0xa]
	movs r0, #3
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	ldr r1, [r5, #0x48]
	adds r0, r5, #0
	bl ov07_0221DDB0
	cmp r0, #1
	bne _0221E748
	movs r0, #8
	ldrsh r1, [r4, r0]
	subs r0, #9
	muls r0, r1, r0
	strh r0, [r4, #8]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	subs r0, #0xb
	muls r0, r1, r0
	strh r0, [r4, #0xa]
	movs r0, #4
	ldrsh r1, [r4, r0]
	subs r0, r0, #5
	muls r0, r1, r0
	strh r0, [r4, #4]
	movs r0, #6
	ldrsh r1, [r4, r0]
	subs r0, r0, #7
	muls r0, r1, r0
	strh r0, [r4, #6]
_0221E748:
	movs r2, #1
	str r2, [r4, #0x14]
	movs r0, #0
	str r0, [r4, #0x18]
	movs r0, #6
	ldr r1, [r5, #0x48]
	lsls r0, r0, #6
	adds r0, r1, r0
	adds r1, r4, #0
	bl ov07_0221DD38
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r1, [r0]
	movs r0, #1
	adds r5, #0x44
	bics r1, r0
	movs r0, #1
	orrs r0, r1
	strh r0, [r5]
	ldr r0, _0221E780 @ =ov07_0221E600
	ldr r2, _0221E784 @ =0x00001001
	adds r1, r4, #0
	bl FUN_0200E320
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0221E780: .4byte ov07_0221E600
_0221E784: .4byte 0x00001001
	thumb_func_end ov07_0221E6D4

	thumb_func_start ov07_0221E788
ov07_0221E788: @ 0x0221E788
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, [r0, #0x48]
	str r0, [sp]
	ldr r0, [r4]
	movs r1, #0x28
	bl FUN_0201AA8C
	adds r6, r0, #0
	ldr r0, [r4]
	movs r1, #0xc4
	bl FUN_0201AA8C
	str r0, [r6, #0x20]
	movs r0, #6
	lsls r0, r0, #6
	adds r0, r4, r0
	adds r1, r6, #0
	movs r2, #2
	bl ov07_0221DD38
	ldr r0, [sp]
	movs r1, #2
	adds r0, #0x44
	ldrh r0, [r0]
	adds r2, r0, #0
	ldr r0, [sp]
	orrs r2, r1
	adds r0, #0x44
	strh r2, [r0]
	movs r0, #0
	str r0, [r6, #0x18]
	adds r0, r4, #0
	bl ov07_0221FAF8
	bl ov07_02222D90
	adds r5, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl ov07_02222D88
	adds r1, r0, #0
	ldr r2, [r4]
	adds r0, r5, #0
	bl ov07_02222BE4
	movs r4, #0
	ldr r1, [r6, #0x20]
	ldr r7, _0221E860 @ =0x02234C20
	adds r1, #0xc0
	str r0, [r1]
	str r4, [sp, #4]
	adds r5, r4, #0
_0221E7F4:
	ldr r0, [r6, #0x20]
	strh r4, [r0, r5]
	ldr r0, [r6, #0x20]
	adds r1, r0, r5
	ldrsh r0, [r0, r5]
	adds r0, #8
	strh r0, [r1, #2]
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r6, #0x20]
	adds r0, r0, r5
	strh r1, [r0, #4]
	ldr r0, [r6, #0x20]
	adds r1, r0, r5
	movs r0, #0
	strh r0, [r1, #6]
	adds r1, r0, #0
	bl ov07_02222D88
	ldr r1, [r6, #0x20]
	movs r2, #6
	adds r1, r1, r5
	str r0, [r1, #8]
	ldr r0, [sp]
	adds r1, r0, #0
	ldr r1, [r1, #0x48]
	bl ov07_0221DDB0
	cmp r0, #1
	bne _0221E83E
	ldr r0, [r6, #0x20]
	movs r1, #4
	adds r0, r0, r5
	ldrsh r2, [r0, r1]
	subs r1, r1, #5
	muls r1, r2, r1
	strh r1, [r0, #4]
_0221E83E:
	ldr r0, [sp, #4]
	adds r4, #8
	adds r0, r0, #1
	adds r5, #0xc
	adds r7, r7, #2
	str r0, [sp, #4]
	cmp r0, #0x10
	blt _0221E7F4
	movs r2, #1
	ldr r0, _0221E864 @ =ov07_0221E87C
	adds r1, r6, #0
	lsls r2, r2, #0xc
	bl FUN_0200E320
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221E860: .4byte 0x02234C20
_0221E864: .4byte ov07_0221E87C
	thumb_func_end ov07_0221E788

	thumb_func_start ov07_0221E868
ov07_0221E868: @ 0x0221E868
	adds r1, r0, #0
	adds r1, #0x44
	ldrh r2, [r1]
	movs r1, #2
	adds r0, #0x44
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221E868

	thumb_func_start ov07_0221E87C
ov07_0221E87C: @ 0x0221E87C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5, #0x18]
	ldr r4, [r5, #0x20]
	cmp r0, #1
	bne _0221E8AA
	adds r4, #0xc0
	ldr r0, [r4]
	bl ov07_02222C60
	ldr r0, [r5, #0x20]
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_0200E390
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0221E8AA:
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	bl ov07_02222C84
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
_0221E8BA:
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r0, #4
	ldrsh r0, [r4, r0]
	adds r0, r1, r0
	strh r0, [r4, #6]
	movs r0, #0
	ldrsh r6, [r4, r0]
	movs r0, #2
	ldrsh r0, [r4, r0]
	cmp r6, r0
	bge _0221E902
	ldr r0, [sp]
	lsls r1, r6, #2
	adds r5, r0, r1
	movs r7, #2
_0221E8DA:
	ldr r1, [r4, #8]
	movs r2, #6
	lsls r0, r1, #0x10
	asrs r1, r1, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r1, r1, #0x10
	ldrsh r2, [r4, r2]
	asrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ov07_02222D88
	stm r5!, {r0}
	ldrsh r0, [r4, r7]
	adds r6, r6, #1
	cmp r6, r0
	blt _0221E8DA
_0221E902:
	ldr r0, [sp, #4]
	adds r4, #0xc
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #0x10
	blt _0221E8BA
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0221E87C

	thumb_func_start ov07_0221E914
ov07_0221E914: @ 0x0221E914
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r0, [r6, #0x18]
	ldr r4, [r6, #0x24]
	cmp r0, #1
	bne _0221E93A
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
	add sp, #0x10
	pop {r4, r5, r6, pc}
_0221E93A:
	ldr r1, _0221E9CC @ =0x0000018B
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0221E94A
	cmp r0, #1
	beq _0221E958
	add sp, #0x10
	pop {r4, r5, r6, pc}
_0221E94A:
	movs r2, #0xff
	adds r0, r2, #0
	adds r0, #0x8b
	strb r2, [r4, r0]
	ldrb r0, [r4, r1]
	adds r0, r0, #1
	strb r0, [r4, r1]
_0221E958:
	movs r2, #0x63
	lsls r2, r2, #2
	ldrb r1, [r4, r2]
	subs r0, r2, #2
	ldrb r0, [r4, r0]
	lsls r3, r1, #1
	adds r3, r4, r3
	adds r3, #0x88
	ldrh r3, [r3]
	subs r3, r3, #2
	cmp r0, r3
	bge _0221E97E
	subs r0, r2, #2
	ldrb r0, [r4, r0]
	add sp, #0x10
	adds r1, r0, #1
	subs r0, r2, #2
	strb r1, [r4, r0]
	pop {r4, r5, r6, pc}
_0221E97E:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r2, #0x90
	str r2, [sp, #8]
	adds r0, r4, r1
	ldrb r0, [r0, #8]
	adds r2, #0xf9
	movs r1, #9
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldrb r2, [r4, r2]
	ldr r0, [r4, #4]
	ldr r3, [r4]
	bl FUN_0200319C
	ldr r1, _0221E9D0 @ =0x0000018A
	movs r0, #0
	strb r0, [r4, r1]
	adds r2, r1, #2
	ldrb r3, [r4, r2]
	subs r2, r1, #2
	ldrb r2, [r4, r2]
	subs r2, r2, #1
	cmp r3, r2
	blt _0221E9BE
	adds r1, r1, #2
	add sp, #0x10
	strb r0, [r4, r1]
	pop {r4, r5, r6, pc}
_0221E9BE:
	adds r0, r1, #2
	ldrb r0, [r4, r0]
	adds r2, r0, #1
	adds r0, r1, #2
	strb r2, [r4, r0]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221E9CC: .4byte 0x0000018B
_0221E9D0: .4byte 0x0000018A
	thumb_func_end ov07_0221E914

	thumb_func_start ov07_0221E9D4
ov07_0221E9D4: @ 0x0221E9D4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x48]
	movs r1, #0x28
	ldr r0, [r6]
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x28
	adds r4, r0, #0
	blx FUN_020D4994
	movs r1, #0x19
	ldr r0, [r6]
	lsls r1, r1, #4
	bl FUN_0201AA8C
	movs r2, #0x19
	movs r1, #0
	lsls r2, r2, #4
	str r0, [r4, #0x24]
	blx FUN_020D4994
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r1, [r0]
	movs r0, #4
	movs r2, #3
	orrs r1, r0
	adds r0, r5, #0
	adds r0, #0x44
	strh r1, [r0]
	movs r0, #0
	str r0, [r4, #0x18]
	ldr r1, [r6]
	ldr r0, [r4, #0x24]
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0xc8
	ldr r1, [r0]
	ldr r0, [r4, #0x24]
	str r1, [r0, #4]
	movs r0, #6
	lsls r0, r0, #6
	adds r0, r6, r0
	adds r1, r4, #0
	bl ov07_0221DD38
	ldr r0, [r5, #0x10]
	cmp r0, #0x34
	bhi _0221EA8E
	bhs _0221EAB0
	cmp r0, #0x1d
	bhi _0221EA88
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0221EA4C: @ jump table
	.2byte _0221EAA0 - _0221EA4C - 2 @ case 0
	.2byte _0221EAA0 - _0221EA4C - 2 @ case 1
	.2byte _0221EAD4 - _0221EA4C - 2 @ case 2
	.2byte _0221EAA0 - _0221EA4C - 2 @ case 3
	.2byte _0221EAA4 - _0221EA4C - 2 @ case 4
	.2byte _0221EAA0 - _0221EA4C - 2 @ case 5
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 6
	.2byte _0221EAC8 - _0221EA4C - 2 @ case 7
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 8
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 9
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 10
	.2byte _0221EAD8 - _0221EA4C - 2 @ case 11
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 12
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 13
	.2byte _0221EACC - _0221EA4C - 2 @ case 14
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 15
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 16
	.2byte _0221EAD0 - _0221EA4C - 2 @ case 17
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 18
	.2byte _0221EAA8 - _0221EA4C - 2 @ case 19
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 20
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 21
	.2byte _0221EAB4 - _0221EA4C - 2 @ case 22
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 23
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 24
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 25
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 26
	.2byte _0221EAE0 - _0221EA4C - 2 @ case 27
	.2byte _0221EABC - _0221EA4C - 2 @ case 28
	.2byte _0221EAC0 - _0221EA4C - 2 @ case 29
_0221EA88:
	cmp r0, #0x2c
	beq _0221EADC
	b _0221EAE0
_0221EA8E:
	cmp r0, #0x39
	bhi _0221EA9A
	bhs _0221EAC4
	cmp r0, #0x35
	beq _0221EAAC
	b _0221EAE0
_0221EA9A:
	cmp r0, #0x3a
	beq _0221EAB8
	b _0221EAE0
_0221EAA0:
	movs r5, #0
	b _0221EAEC
_0221EAA4:
	movs r5, #2
	b _0221EAEC
_0221EAA8:
	movs r5, #4
	b _0221EAEC
_0221EAAC:
	movs r5, #6
	b _0221EAEC
_0221EAB0:
	movs r5, #8
	b _0221EAEC
_0221EAB4:
	movs r5, #0xa
	b _0221EAEC
_0221EAB8:
	movs r5, #0xc
	b _0221EAEC
_0221EABC:
	movs r5, #0xe
	b _0221EAEC
_0221EAC0:
	movs r5, #0x10
	b _0221EAEC
_0221EAC4:
	movs r5, #0x1a
	b _0221EAEC
_0221EAC8:
	movs r5, #0x1c
	b _0221EAEC
_0221EACC:
	movs r5, #0x14
	b _0221EAEC
_0221EAD0:
	movs r5, #0x12
	b _0221EAEC
_0221EAD4:
	movs r5, #0x16
	b _0221EAEC
_0221EAD8:
	movs r5, #0x18
	b _0221EAEC
_0221EADC:
	movs r5, #0x1e
	b _0221EAEC
_0221EAE0:
	ldr r0, _0221EB70 @ =0x02237870
	cmp r0, #0
	beq _0221EAEA
	bl GF_AssertFail
_0221EAEA:
	movs r5, #0
_0221EAEC:
	movs r0, #1
	str r0, [sp]
	ldr r3, [r6]
	movs r0, #9
	adds r1, r5, #0
	movs r2, #0
	bl FUN_02007A44
	adds r7, r0, #0
	bne _0221EB04
	bl GF_AssertFail
_0221EB04:
	ldr r1, [r4, #0x24]
	ldr r0, _0221EB74 @ =0x00000189
	adds r2, r5, #1
	strb r2, [r1, r0]
	ldrb r3, [r7]
	movs r1, #0
	adds r0, r7, #0
	cmp r3, #0xff
	beq _0221EB2A
_0221EB16:
	ldr r2, [r4, #0x24]
	adds r0, r0, #1
	adds r2, r2, r1
	strb r3, [r2, #8]
	adds r1, r1, #1
	lsls r1, r1, #0x10
	ldrb r3, [r0]
	lsrs r1, r1, #0x10
	cmp r3, #0xff
	bne _0221EB16
_0221EB2A:
	movs r0, #0x62
	ldr r2, [r4, #0x24]
	lsls r0, r0, #2
	strb r1, [r2, r0]
	adds r0, r7, #0
	adds r0, #0x80
	ldrh r5, [r0]
	adds r3, r7, #0
	ldr r0, _0221EB78 @ =0x0000FF98
	movs r6, #0
	adds r3, #0x80
	cmp r5, r0
	beq _0221EB5C
_0221EB44:
	ldr r2, [r4, #0x24]
	lsls r1, r6, #1
	adds r1, r2, r1
	adds r1, #0x88
	strh r5, [r1]
	adds r3, r3, #2
	adds r1, r6, #1
	lsls r1, r1, #0x10
	ldrh r5, [r3]
	lsrs r6, r1, #0x10
	cmp r5, r0
	bne _0221EB44
_0221EB5C:
	adds r0, r7, #0
	bl FUN_0201AB0C
	ldr r0, _0221EB7C @ =ov07_0221E914
	ldr r2, _0221EB80 @ =0x00001001
	adds r1, r4, #0
	bl FUN_0200E320
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221EB70: .4byte 0x02237870
_0221EB74: .4byte 0x00000189
_0221EB78: .4byte 0x0000FF98
_0221EB7C: .4byte ov07_0221E914
_0221EB80: .4byte 0x00001001
	thumb_func_end ov07_0221E9D4

	thumb_func_start ov07_0221EB84
ov07_0221EB84: @ 0x0221EB84
	adds r1, r0, #0
	adds r1, #0x44
	ldrh r2, [r1]
	movs r1, #4
	adds r0, #0x44
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221EB84

	thumb_func_start ov07_0221EB98
ov07_0221EB98: @ 0x0221EB98
	ldr r3, _0221EBA0 @ =ov07_0221EBA4
	movs r2, #1
	bx r3
	nop
_0221EBA0: .4byte ov07_0221EBA4
	thumb_func_end ov07_0221EB98

	thumb_func_start ov07_0221EBA4
ov07_0221EBA4: @ 0x0221EBA4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r1, #0
	movs r1, #2
	adds r5, r0, #0
	adds r6, r2, #0
	bl ov07_0221FB04
	adds r1, r0, #0
	lsls r0, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl FUN_0201BC28
	adds r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221EBEA
	adds r0, r5, #0
	adds r0, #0xc4
	lsls r1, r4, #0x18
	ldr r0, [r0]
	lsrs r1, r1, #0x18
	movs r2, #2
	movs r3, #4
	bl FUN_0201B1F4
	b _0221EC10
_0221EBEA:
	adds r0, r5, #0
	adds r0, #0xc4
	lsls r1, r4, #0x18
	lsls r3, r6, #0x18
	ldr r0, [r0]
	lsrs r1, r1, #0x18
	movs r2, #0
	lsrs r3, r3, #0x18
	bl FUN_0201B1F4
	adds r0, r5, #0
	adds r0, #0xc4
	lsls r1, r4, #0x18
	ldr r0, [r0]
	lsrs r1, r1, #0x18
	movs r2, #2
	movs r3, #4
	bl FUN_0201B1F4
_0221EC10:
	adds r0, r5, #0
	adds r0, #0xc4
	lsls r1, r4, #0x18
	ldr r0, [r0]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221EC4E
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0x19
	adds r2, r5, #0
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	adds r2, #0xc4
	ldr r1, [r5, r1]
	ldr r2, [r2]
	adds r3, r4, #0
	bl FUN_020078F0
	b _0221EC56
_0221EC4E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_0221FB30
_0221EC56:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, #0xc
	ldr r1, [r5, r1]
	adds r5, #0xc4
	ldr r2, [r5]
	adds r3, r4, #0
	bl FUN_02007914
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221EBA4

	thumb_func_start ov07_0221EC7C
ov07_0221EC7C: @ 0x0221EC7C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #1
	adds r5, r0, #0
	bl ov07_0221FB04
	adds r1, r0, #0
	lsls r0, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	adds r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221ECB4
	adds r0, r5, #0
	adds r0, #0xc4
	lsls r1, r4, #0x18
	ldr r0, [r0]
	lsrs r1, r1, #0x18
	movs r2, #2
	movs r3, #3
	bl FUN_0201B1F4
	b _0221ECD8
_0221ECB4:
	adds r0, r5, #0
	adds r0, #0xc4
	lsls r1, r4, #0x18
	movs r2, #0
	ldr r0, [r0]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201B1F4
	adds r0, r5, #0
	adds r0, #0xc4
	lsls r1, r4, #0x18
	ldr r0, [r0]
	lsrs r1, r1, #0x18
	movs r2, #2
	movs r3, #3
	bl FUN_0201B1F4
_0221ECD8:
	adds r5, #0xc4
	lsls r1, r4, #0x18
	ldr r0, [r5]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0221EC7C

	thumb_func_start ov07_0221ECE8
ov07_0221ECE8: @ 0x0221ECE8
	adds r1, r0, #0
	adds r1, #0x44
	ldrh r2, [r1]
	movs r1, #1
	adds r0, #0x44
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221ECE8

	thumb_func_start ov07_0221ED00
ov07_0221ED00: @ 0x0221ED00
	push {r3, lr}
	ldr r1, [r0, #0x48]
	movs r0, #6
	lsls r0, r0, #6
	adds r0, r1, r0
	movs r1, #5
	bl ov07_0221DD14
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov07_0221ED00

	thumb_func_start ov07_0221ED14
ov07_0221ED14: @ 0x0221ED14
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r2, [r4, #0x14]
	adds r5, r0, #0
	lsls r3, r2, #2
	ldr r2, _0221ED40 @ =0x02234BC0
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	bne _0221ED3E
	movs r0, #0x5f
	ldr r1, [r4, #0x48]
	movs r2, #0
	lsls r0, r0, #2
	strb r2, [r1, r0]
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
_0221ED3E:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221ED40: .4byte 0x02234BC0
	thumb_func_end ov07_0221ED14

	thumb_func_start ov07_0221ED44
ov07_0221ED44: @ 0x0221ED44
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov07_0221DF1C
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	strb r0, [r4, #0xd]
	ldr r0, [r5, #0x18]
	ldr r2, _0221ED88 @ =0x0000044C
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	str r0, [r4, #0x14]
	ldr r0, _0221ED8C @ =0xFFFF0000
	ands r0, r1
	lsrs r0, r0, #0x10
	str r0, [r4, #0x18]
	ldr r0, _0221ED90 @ =ov07_0221ED14
	adds r1, r4, #0
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221ED88: .4byte 0x0000044C
_0221ED8C: .4byte 0xFFFF0000
_0221ED90: .4byte ov07_0221ED14
	thumb_func_end ov07_0221ED44

	thumb_func_start ov07_0221ED94
ov07_0221ED94: @ 0x0221ED94
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov07_0221DF1C
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	strb r0, [r4, #0xd]
	ldr r0, [r5, #0x18]
	ldr r2, _0221EE64 @ =0xFFFF0000
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x18]
	adds r1, r0, #4
	str r1, [r5, #0x18]
	ldr r0, [r1]
	adds r1, r1, #4
	str r1, [r5, #0x18]
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	ands r0, r2
	str r1, [r4, #0x14]
	lsrs r0, r0, #0x10
	str r0, [r4, #0x18]
	ldr r0, [r5, #0x18]
	ldr r1, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	adds r0, r1, #0
	ands r0, r2
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r1, r1, #0x10
	asrs r0, r0, #0x10
	cmp r1, #6
	bhi _0221EE4C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0221EDF2: @ jump table
	.2byte _0221EE4C - _0221EDF2 - 2 @ case 0
	.2byte _0221EE00 - _0221EDF2 - 2 @ case 1
	.2byte _0221EE0A - _0221EDF2 - 2 @ case 2
	.2byte _0221EE14 - _0221EDF2 - 2 @ case 3
	.2byte _0221EE1E - _0221EDF2 - 2 @ case 4
	.2byte _0221EE28 - _0221EDF2 - 2 @ case 5
	.2byte _0221EE3A - _0221EDF2 - 2 @ case 6
_0221EE00:
	movs r1, #0xe
	ldrsb r1, [r4, r1]
	adds r0, r1, r0
	strb r0, [r4, #0xe]
	b _0221EE56
_0221EE0A:
	movs r1, #0xe
	ldrsb r1, [r4, r1]
	subs r0, r1, r0
	strb r0, [r4, #0xe]
	b _0221EE56
_0221EE14:
	movs r1, #0xf
	ldrsb r1, [r4, r1]
	adds r0, r1, r0
	strb r0, [r4, #0xf]
	b _0221EE56
_0221EE1E:
	movs r1, #0xf
	ldrsb r1, [r4, r1]
	subs r0, r1, r0
	strb r0, [r4, #0xf]
	b _0221EE56
_0221EE28:
	movs r1, #0xe
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	strb r1, [r4, #0xe]
	movs r1, #0xf
	ldrsb r1, [r4, r1]
	adds r0, r1, r0
	strb r0, [r4, #0xf]
	b _0221EE56
_0221EE3A:
	movs r1, #0xe
	ldrsb r1, [r4, r1]
	subs r1, r1, r0
	strb r1, [r4, #0xe]
	movs r1, #0xf
	ldrsb r1, [r4, r1]
	subs r0, r1, r0
	strb r0, [r4, #0xf]
	b _0221EE56
_0221EE4C:
	ldr r0, _0221EE68 @ =0x0223789C
	cmp r0, #0
	beq _0221EE56
	bl GF_AssertFail
_0221EE56:
	ldr r0, _0221EE6C @ =ov07_0221ED14
	ldr r2, _0221EE70 @ =0x0000044C
	adds r1, r4, #0
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	nop
_0221EE64: .4byte 0xFFFF0000
_0221EE68: .4byte 0x0223789C
_0221EE6C: .4byte ov07_0221ED14
_0221EE70: .4byte 0x0000044C
	thumb_func_end ov07_0221ED94

	thumb_func_start ov07_0221EE74
ov07_0221EE74: @ 0x0221EE74
	push {r3, r4, r5, lr}
	ldr r1, [r0, #0x18]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r5, [r1]
	adds r2, r1, #4
	str r2, [r0, #0x18]
	ldr r1, [r2]
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	adds r1, r2, #4
	str r1, [r0, #0x18]
	movs r1, #6
	lsls r1, r1, #6
	adds r0, r0, r1
	movs r1, #1
	bl ov07_0221DD8C
	cmp r5, #3
	bhi _0221EEBE
	adds r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0221EEA8: @ jump table
	.2byte _0221EEB0 - _0221EEA8 - 2 @ case 0
	.2byte _0221EEB4 - _0221EEA8 - 2 @ case 1
	.2byte _0221EEB8 - _0221EEA8 - 2 @ case 2
	.2byte _0221EEBC - _0221EEA8 - 2 @ case 3
_0221EEB0:
	strh r4, [r0, #8]
	pop {r3, r4, r5, pc}
_0221EEB4:
	strh r4, [r0, #0xa]
	pop {r3, r4, r5, pc}
_0221EEB8:
	strh r4, [r0, #4]
	pop {r3, r4, r5, pc}
_0221EEBC:
	strh r4, [r0, #4]
_0221EEBE:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221EE74

	thumb_func_start ov07_0221EEC0
ov07_0221EEC0: @ 0x0221EEC0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov07_0221DF1C
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	strb r0, [r4, #0xd]
	ldr r0, [r5, #0x18]
	ldr r2, _0221EF08 @ =0x0000044C
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x18]
	adds r1, r0, #4
	str r1, [r5, #0x18]
	ldr r0, [r1]
	adds r1, r1, #4
	str r1, [r5, #0x18]
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	adds r1, r1, #3
	str r1, [r4, #0x14]
	ldr r1, _0221EF0C @ =0xFFFF0000
	ands r0, r1
	lsrs r0, r0, #0x10
	str r0, [r4, #0x18]
	ldr r0, _0221EF10 @ =ov07_0221ED14
	adds r1, r4, #0
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	nop
_0221EF08: .4byte 0x0000044C
_0221EF0C: .4byte 0xFFFF0000
_0221EF10: .4byte ov07_0221ED14
	thumb_func_end ov07_0221EEC0

	thumb_func_start ov07_0221EF14
ov07_0221EF14: @ 0x0221EF14
	movs r1, #0x5f
	lsls r1, r1, #2
	ldrb r1, [r0, r1]
	cmp r1, #2
	bne _0221EF2C
	ldr r1, [r0, #0x18]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	movs r1, #0
	adds r0, #0x8d
	strb r1, [r0]
	bx lr
_0221EF2C:
	movs r1, #1
	adds r0, #0x8d
	strb r1, [r0]
	bx lr
	thumb_func_end ov07_0221EF14

	thumb_func_start ov07_0221EF34
ov07_0221EF34: @ 0x0221EF34
	movs r1, #0x5f
	lsls r1, r1, #2
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _0221EF4C
	ldr r1, [r0, #0x18]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	movs r1, #0
	adds r0, #0x8d
	strb r1, [r0]
	bx lr
_0221EF4C:
	movs r1, #1
	adds r0, #0x8d
	strb r1, [r0]
	bx lr
	thumb_func_end ov07_0221EF34

	thumb_func_start ov07_0221EF54
ov07_0221EF54: @ 0x0221EF54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl ov07_0221DF1C
	adds r7, r0, #0
	ldr r0, [r5, #0x18]
	movs r1, #0
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r4, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	movs r0, #3
	bl FUN_0201BC28
	adds r0, r5, #0
	adds r0, #0xc4
	movs r2, #0
	ldr r0, [r0]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201B1F4
	adds r0, r4, #0
	movs r1, #0
	bl ov07_0221FB7C
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	adds r2, r5, #0
	str r0, [sp, #0xc]
	adds r2, #0xc4
	ldr r2, [r2]
	movs r0, #7
	movs r3, #3
	bl FUN_020078F0
	adds r0, r4, #0
	movs r1, #1
	bl ov07_0221FB7C
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x90
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xc8
	ldr r0, [r0]
	ldr r3, [r5]
	movs r1, #7
	bl FUN_02003200
	adds r0, r5, #0
	adds r0, #0xc4
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0201CAE0
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #7
	movs r6, #2
	bl ov07_0221DDB0
	cmp r0, #1
	bne _0221EFEC
	movs r6, #3
_0221EFEC:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov07_0221FB7C
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	adds r5, #0xc4
	str r0, [sp, #0xc]
	ldr r2, [r5]
	movs r0, #7
	movs r3, #3
	bl FUN_02007914
	movs r0, #3
	movs r1, #1
	bl FUN_0201BC28
	adds r0, r7, #0
	bl FUN_0201AB0C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0221EF54

	thumb_func_start ov07_0221F024
ov07_0221F024: @ 0x0221F024
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov07_0221DF1C
	adds r4, r0, #0
	ldr r0, [r5, #0x18]
	adds r1, r0, #4
	str r1, [r5, #0x18]
	ldr r0, [r1]
	str r0, [sp]
	adds r0, r1, #4
	str r0, [r5, #0x18]
	ldr r7, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r6, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	adds r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221F056
	str r6, [r4, #0x10]
	b _0221F06E
_0221F056:
	adds r0, r5, #0
	adds r5, #0xc0
	ldr r1, [r5]
	ldrh r1, [r1, #0x16]
	bl ov07_0223192C
	cmp r0, #3
	bne _0221F06A
	str r7, [r4, #0x10]
	b _0221F06E
_0221F06A:
	ldr r0, [sp]
	str r0, [r4, #0x10]
_0221F06E:
	ldr r0, _0221F07C @ =ov07_0221ED14
	ldr r2, _0221F080 @ =0x0000044C
	adds r1, r4, #0
	bl FUN_0200E320
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221F07C: .4byte ov07_0221ED14
_0221F080: .4byte 0x0000044C
	thumb_func_end ov07_0221F024

	thumb_func_start ov07_0221F084
ov07_0221F084: @ 0x0221F084
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221F084

	thumb_func_start ov07_0221F088
ov07_0221F088: @ 0x0221F088
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221F088

	thumb_func_start ov07_0221F08C
ov07_0221F08C: @ 0x0221F08C
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221F08C

	thumb_func_start ov07_0221F090
ov07_0221F090: @ 0x0221F090
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221F090

	thumb_func_start ov07_0221F094
ov07_0221F094: @ 0x0221F094
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221F094

	thumb_func_start ov07_0221F098
ov07_0221F098: @ 0x0221F098
	ldr r1, [r0, #0x18]
	ldr r3, _0221F0AC @ =FUN_0200604C
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	bx r3
	.align 2, 0
_0221F0AC: .4byte FUN_0200604C
	thumb_func_end ov07_0221F098

	thumb_func_start ov07_0221F0B0
ov07_0221F0B0: @ 0x0221F0B0
	ldr r1, [r0, #0x18]
	ldr r3, _0221F0C8 @ =FUN_02006154
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bx r3
	nop
_0221F0C8: .4byte FUN_02006154
	thumb_func_end ov07_0221F0B0

	thumb_func_start ov07_0221F0CC
ov07_0221F0CC: @ 0x0221F0CC
	push {r3, r4, r5, lr}
	ldr r1, [r0, #0x18]
	adds r2, r1, #4
	str r2, [r0, #0x18]
	ldr r1, [r2]
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r2, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	bl ov07_0221F8C8
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0200604C
	ldr r1, _0221F100 @ =0x0000FFFF
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_020061B4
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221F100: .4byte 0x0000FFFF
	thumb_func_end ov07_0221F0CC

	thumb_func_start ov07_0221F104
ov07_0221F104: @ 0x0221F104
	push {r3, lr}
	ldr r1, [r0, #0x18]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	bl ov07_0221F8C8
	bl FUN_020061EC
	pop {r3, pc}
	thumb_func_end ov07_0221F104

	thumb_func_start ov07_0221F120
ov07_0221F120: @ 0x0221F120
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov07_0221C53C
	movs r1, #0
	movs r2, #0x3c
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #1
	strb r0, [r4]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strh r0, [r4, #0x1a]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	str r0, [r4, #8]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strb r0, [r4, #3]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r4, #8]
	adds r0, r5, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #8]
	ldr r1, [r4, #0xc]
	adds r0, r5, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	asrs r0, r0, #0x18
	asrs r1, r1, #0x18
	asrs r2, r2, #0x18
	bl ov07_0221F980
	str r0, [r4, #0x10]
	ldrh r0, [r4, #0x1a]
	bl FUN_0200604C
	ldrh r0, [r4, #0x1a]
	ldr r1, _0221F1BC @ =0x0000FFFF
	ldr r2, [r4, #8]
	bl FUN_020061B4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_0221C56C
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221F1BC: .4byte 0x0000FFFF
	thumb_func_end ov07_0221F120

	thumb_func_start ov07_0221F1C0
ov07_0221F1C0: @ 0x0221F1C0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov07_0221C53C
	movs r1, #0
	movs r2, #0x3c
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #2
	strb r0, [r4]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strh r0, [r4, #0x1a]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #8]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strb r0, [r4, #3]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldrh r0, [r4, #0x1a]
	bl FUN_0200604C
	ldrh r0, [r4, #0x1a]
	ldr r1, _0221F234 @ =0x0000FFFF
	ldr r2, [r4, #8]
	bl FUN_020061B4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_0221C56C
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221F234: .4byte 0x0000FFFF
	thumb_func_end ov07_0221F1C0

	thumb_func_start ov07_0221F238
ov07_0221F238: @ 0x0221F238
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov07_0221C53C
	movs r1, #0
	movs r2, #0x3c
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #1
	strb r0, [r4]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strh r0, [r4, #0x1a]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #8]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strb r0, [r4, #3]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r4, #8]
	adds r0, r5, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #8]
	ldr r1, [r4, #0xc]
	adds r0, r5, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	adds r0, r5, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #0x10]
	ldrh r0, [r4, #0x1a]
	bl FUN_0200604C
	ldrh r0, [r4, #0x1a]
	ldr r1, _0221F2D8 @ =0x0000FFFF
	ldr r2, [r4, #8]
	bl FUN_020061B4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_0221C56C
	pop {r3, r4, r5, pc}
	nop
_0221F2D8: .4byte 0x0000FFFF
	thumb_func_end ov07_0221F238

	thumb_func_start ov07_0221F2DC
ov07_0221F2DC: @ 0x0221F2DC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov07_0221C53C
	movs r1, #0
	movs r2, #0x3c
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #4
	strb r0, [r4]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strh r0, [r4, #0x1a]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #0x14]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strb r0, [r4, #3]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strb r0, [r4, #0x18]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldrb r0, [r4, #3]
	strb r0, [r4, #4]
	ldr r1, [r4, #0x14]
	adds r0, r5, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #0x14]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_0221C56C
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221F2DC

	thumb_func_start ov07_0221F340
ov07_0221F340: @ 0x0221F340
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov07_0221C53C
	movs r1, #0
	movs r2, #0x3c
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #5
	strb r0, [r4]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strh r0, [r4, #0x1a]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #0x14]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strb r0, [r4, #3]
	ldr r0, [r5, #0x18]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r4, #0x14]
	adds r0, r5, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #0x14]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_0221C56C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0221F340

	thumb_func_start ov07_0221F398
ov07_0221F398: @ 0x0221F398
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221F398

	thumb_func_start ov07_0221F39C
ov07_0221F39C: @ 0x0221F39C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldrh r0, [r0]
	cmp r0, #0
	beq _0221F3B8
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x8d
	strb r1, [r0]
	ldr r0, _0221F3F0 @ =0x0000017D
	movs r1, #0
	strb r1, [r4, r0]
	pop {r4, pc}
_0221F3B8:
	bl FUN_02006198
	cmp r0, #0
	beq _0221F3DC
	ldr r0, _0221F3F0 @ =0x0000017D
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	ldrb r1, [r4, r0]
	cmp r1, #0x5a
	bls _0221F3D4
	movs r1, #0
	strb r1, [r4, r0]
	pop {r4, pc}
_0221F3D4:
	movs r0, #1
	adds r4, #0x8d
	strb r0, [r4]
	pop {r4, pc}
_0221F3DC:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x8d
	strb r1, [r0]
	ldr r0, _0221F3F0 @ =0x0000017D
	strb r1, [r4, r0]
	ldr r0, [r4, #0x18]
	adds r0, r0, #4
	str r0, [r4, #0x18]
	pop {r4, pc}
	.align 2, 0
_0221F3F0: .4byte 0x0000017D
	thumb_func_end ov07_0221F39C

	thumb_func_start ov07_0221F3F4
ov07_0221F3F4: @ 0x0221F3F4
	push {r3, lr}
	ldr r1, [r0, #0x18]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r3, [r1]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r3, r3, #0x10
	ldr r0, _0221F420 @ =0x04001050
	movs r1, #1
	movs r2, #2
	lsrs r3, r3, #0x10
	blx FUN_020CF15C
	pop {r3, pc}
	nop
_0221F420: .4byte 0x04001050
	thumb_func_end ov07_0221F3F4

	thumb_func_start ov07_0221F424
ov07_0221F424: @ 0x0221F424
	ldr r3, _0221F428 @ =ov07_0221C69C
	bx r3
	.align 2, 0
_0221F428: .4byte ov07_0221C69C
	thumb_func_end ov07_0221F424

	thumb_func_start ov07_0221F42C
ov07_0221F42C: @ 0x0221F42C
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221F42C

	thumb_func_start ov07_0221F430
ov07_0221F430: @ 0x0221F430
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	adds r6, r5, #0
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	adds r0, r0, #4
	str r0, [r5, #0x18]
	ldr r7, [r0]
	adds r0, r0, #4
	lsls r4, r1, #2
	adds r6, #0xcc
	str r0, [r5, #0x18]
	ldr r0, [r6, r4]
	cmp r0, #0
	beq _0221F458
	bl GF_AssertFail
_0221F458:
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200CF38
	str r0, [r6, r4]
	ldr r0, [r6, r4]
	cmp r0, #0
	bne _0221F472
	bl GF_AssertFail
_0221F472:
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r1, [r6, r4]
	adds r0, #0xac
	ldr r0, [r0]
	adds r2, r7, #0
	bl FUN_0200CFF4
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200CF6C
	movs r2, #0x11
	movs r1, #0
	lsls r2, r2, #0x10
	bl FUN_02009FC8
	adds r0, r5, #0
	movs r1, #0
	add r2, sp, #0
	adds r0, #0x18
_0221F4A4:
	ldr r3, [r5, #0x18]
	adds r1, r1, #1
	ldr r3, [r3]
	str r3, [r2]
	ldr r3, [r0]
	adds r2, r2, #4
	adds r3, r3, #4
	str r3, [r0]
	cmp r1, #6
	blt _0221F4A4
	adds r5, #0xc0
	ldr r0, [r5]
	ldr r1, [r6, r4]
	adds r0, #0xac
	ldr r0, [r0]
	add r2, sp, #0
	bl FUN_0200D3F8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221F430

	thumb_func_start ov07_0221F4CC
ov07_0221F4CC: @ 0x0221F4CC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r2, r0, #0
	ldr r0, [r2, #0x18]
	movs r4, #0x6e
	adds r0, r0, #4
	str r0, [r2, #0x18]
	ldr r1, [r0]
	adds r0, r0, #4
	str r0, [r2, #0x18]
	ldr r3, [r0]
	adds r0, r0, #4
	str r0, [r2, #0x18]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221F510 @ =0x00001388
	lsls r1, r1, #2
	adds r0, r3, r0
	str r0, [sp, #8]
	adds r0, r2, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r1, r2, r1
	adds r0, #0xac
	adds r1, #0xcc
	lsls r4, r4, #2
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2, r4]
	bl FUN_0200D504
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0221F510: .4byte 0x00001388
	thumb_func_end ov07_0221F4CC

	thumb_func_start ov07_0221F514
ov07_0221F514: @ 0x0221F514
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	adds r0, r0, #4
	str r0, [r4, #0x18]
	ldr r3, [r0]
	adds r0, r0, #4
	str r0, [r4, #0x18]
	ldr r1, [r0]
	adds r2, r0, #4
	str r2, [r4, #0x18]
	ldr r0, [r2]
	adds r2, r2, #4
	str r2, [r4, #0x18]
	movs r2, #0x6f
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	lsls r3, r3, #2
	str r2, [sp]
	str r1, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #1
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0221F570 @ =0x00001388
	adds r2, r4, #0
	adds r0, r1, r0
	str r0, [sp, #0x14]
	adds r2, #0xc0
	ldr r2, [r2]
	adds r0, r4, #0
	adds r3, r4, r3
	adds r0, #0xc8
	adds r2, #0xac
	adds r3, #0xcc
	ldr r0, [r0]
	ldr r2, [r2]
	ldr r3, [r3]
	movs r1, #2
	bl FUN_0200D68C
	add sp, #0x18
	pop {r4, pc}
	nop
_0221F570: .4byte 0x00001388
	thumb_func_end ov07_0221F514

	thumb_func_start ov07_0221F574
ov07_0221F574: @ 0x0221F574
	push {r4, lr}
	sub sp, #8
	adds r2, r0, #0
	ldr r0, [r2, #0x18]
	movs r4, #7
	adds r0, r0, #4
	str r0, [r2, #0x18]
	ldr r1, [r0]
	adds r0, r0, #4
	str r0, [r2, #0x18]
	ldr r3, [r0]
	adds r0, r0, #4
	str r0, [r2, #0x18]
	movs r0, #1
	str r0, [sp]
	ldr r0, _0221F5B8 @ =0x00001388
	lsls r1, r1, #2
	adds r0, r3, r0
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r1, r2, r1
	adds r0, #0xac
	adds r1, #0xcc
	lsls r4, r4, #6
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2, r4]
	bl FUN_0200D6EC
	add sp, #8
	pop {r4, pc}
	nop
_0221F5B8: .4byte 0x00001388
	thumb_func_end ov07_0221F574

	thumb_func_start ov07_0221F5BC
ov07_0221F5BC: @ 0x0221F5BC
	push {r4, lr}
	sub sp, #8
	adds r2, r0, #0
	ldr r0, [r2, #0x18]
	movs r4, #0x71
	adds r0, r0, #4
	str r0, [r2, #0x18]
	ldr r1, [r0]
	adds r0, r0, #4
	str r0, [r2, #0x18]
	ldr r3, [r0]
	adds r0, r0, #4
	str r0, [r2, #0x18]
	movs r0, #1
	str r0, [sp]
	ldr r0, _0221F600 @ =0x00001388
	lsls r1, r1, #2
	adds r0, r3, r0
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r1, r2, r1
	adds r0, #0xac
	adds r1, #0xcc
	lsls r4, r4, #2
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2, r4]
	bl FUN_0200D71C
	add sp, #8
	pop {r4, pc}
	nop
_0221F600: .4byte 0x00001388
	thumb_func_end ov07_0221F5BC

	thumb_func_start ov07_0221F604
ov07_0221F604: @ 0x0221F604
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r4, r0, #0
	ldr r1, [r4, #0x18]
	adds r1, r1, #4
	str r1, [r4, #0x18]
	ldr r5, [r1]
	adds r2, r1, #4
	str r2, [r4, #0x18]
	ldr r1, [r2]
	str r1, [sp]
	adds r1, r2, #4
	str r1, [r4, #0x18]
	bl ov07_0221C470
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl ov07_02221F80
	add r1, sp, #0xc
	strh r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl ov07_02221F80
	add r2, sp, #0xc
	strh r0, [r2, #2]
	movs r1, #0
	strh r1, [r2, #4]
	strh r1, [r2, #6]
	movs r0, #0x64
	str r0, [sp, #0x14]
	movs r0, #1
	str r0, [sp, #0x1c]
	str r0, [sp, #0x38]
	adds r0, r4, #0
	ldr r3, _0221F70C @ =0x00001388
	str r1, [sp, #0x18]
	str r1, [sp, #0x3c]
	add r2, sp, #0xc
	adds r0, #0x18
_0221F65C:
	ldr r6, [r4, #0x18]
	adds r1, r1, #1
	ldr r6, [r6]
	adds r6, r6, r3
	str r6, [r2, #0x14]
	ldr r6, [r0]
	adds r2, r2, #4
	adds r6, r6, #4
	str r6, [r0]
	cmp r1, #6
	blt _0221F65C
	movs r0, #0x41
	lsls r0, r0, #2
	add r3, sp, #0xc
	adds r2, r4, r0
	movs r6, #6
_0221F67C:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r6, r6, #1
	bne _0221F67C
	ldr r0, [r3]
	lsls r7, r5, #2
	str r0, [r2]
	adds r0, r4, #0
	str r0, [sp, #8]
	adds r0, #0xcc
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r1, [sp, #8]
	adds r0, #0xac
	ldr r0, [r0]
	ldr r1, [r1, r7]
	add r2, sp, #0xc
	bl FUN_0200D734
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	adds r2, r4, #0
	ldr r3, [r0]
	adds r0, r0, #4
	adds r2, #0x18
	movs r6, #0
	str r0, [r4, #0x18]
	cmp r3, #0
	ble _0221F6D4
	adds r5, r4, #0
_0221F6BC:
	ldr r0, [r4, #0x18]
	adds r6, r6, #1
	ldr r1, [r0]
	adds r0, r5, #0
	adds r0, #0x94
	str r1, [r0]
	ldr r0, [r2]
	adds r5, r5, #4
	adds r0, r0, #4
	str r0, [r2]
	cmp r6, r3
	blt _0221F6BC
_0221F6D4:
	cmp r6, #0xa
	bge _0221F6EC
	lsls r0, r6, #2
	adds r2, r4, r0
	movs r1, #0
_0221F6DE:
	adds r0, r2, #0
	adds r0, #0x94
	adds r6, r6, #1
	adds r2, r2, #4
	str r1, [r0]
	cmp r6, #0xa
	blt _0221F6DE
_0221F6EC:
	ldr r0, [sp]
	bl ov07_0222304C
	adds r5, r0, #0
	adds r0, r4, #0
	adds r4, #0xc0
	ldr r1, [r4]
	ldr r2, [sp, #8]
	adds r1, #0xac
	ldr r1, [r1]
	ldr r2, [r2, r7]
	ldr r3, [sp, #4]
	blx r5
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221F70C: .4byte 0x00001388
	thumb_func_end ov07_0221F604

	thumb_func_start ov07_0221F710
ov07_0221F710: @ 0x0221F710
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	ldr r1, [r5, #0x18]
	adds r1, r1, #4
	str r1, [r5, #0x18]
	ldr r4, [r1]
	adds r1, r1, #4
	str r1, [r5, #0x18]
	ldr r7, [r1]
	adds r1, r1, #4
	str r1, [r5, #0x18]
	bl ov07_0221C470
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl ov07_02221F80
	add r1, sp, #0
	strh r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl ov07_02221F80
	add r2, sp, #0
	strh r0, [r2, #2]
	movs r1, #0
	strh r1, [r2, #4]
	strh r1, [r2, #6]
	movs r0, #0x64
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0x10]
	str r0, [sp, #0x2c]
	adds r0, r5, #0
	ldr r3, _0221F7C0 @ =0x00001388
	str r1, [sp, #0xc]
	str r1, [sp, #0x30]
	add r2, sp, #0
	adds r0, #0x18
_0221F766:
	ldr r6, [r5, #0x18]
	adds r1, r1, #1
	ldr r6, [r6]
	adds r6, r6, r3
	str r6, [r2, #0x14]
	ldr r6, [r0]
	adds r2, r2, #4
	adds r6, r6, #4
	str r6, [r0]
	cmp r1, #6
	blt _0221F766
	movs r0, #0x41
	lsls r0, r0, #2
	add r6, sp, #0
	adds r3, r5, r0
	movs r2, #6
_0221F786:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0221F786
	ldr r0, [r6]
	lsls r1, r4, #2
	str r0, [r3]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r1, r5, r1
	adds r0, #0xac
	adds r1, #0xcc
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0
	bl FUN_0200D734
	adds r5, #0xdc
	lsls r4, r7, #2
	adds r6, r0, #0
	ldr r0, [r5, r4]
	cmp r0, #0
	beq _0221F7BA
	bl GF_AssertFail
_0221F7BA:
	str r6, [r5, r4]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221F7C0: .4byte 0x00001388
	thumb_func_end ov07_0221F710

	thumb_func_start ov07_0221F7C4
ov07_0221F7C4: @ 0x0221F7C4
	push {r3, r4, r5, lr}
	ldr r1, [r0, #0x18]
	adds r5, r0, #0
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	adds r1, r1, #4
	adds r5, #0xcc
	lsls r4, r2, #2
	str r1, [r0, #0x18]
	ldr r1, [r5, r4]
	cmp r1, #0
	beq _0221F7EA
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200D998
_0221F7EA:
	movs r0, #0
	str r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221F7C4

	thumb_func_start ov07_0221F7F0
ov07_0221F7F0: @ 0x0221F7F0
	ldr r1, [r0, #0x18]
	adds r1, r1, #4
	str r1, [r0, #0x18]
	ldr r3, [r1]
	adds r2, r1, #4
	str r2, [r0, #0x18]
	ldr r1, [r2]
	adds r2, r2, #4
	str r2, [r0, #0x18]
	lsls r2, r3, #2
	adds r2, r0, r2
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r3, _0221F810 @ =FUN_0200DCE8
	ldr r0, [r2, r0]
	bx r3
	.align 2, 0
_0221F810: .4byte FUN_0200DCE8
	thumb_func_end ov07_0221F7F0

	thumb_func_start ov07_0221F814
ov07_0221F814: @ 0x0221F814
	ldr r3, _0221F818 @ =GF_AssertFail
	bx r3
	.align 2, 0
_0221F818: .4byte GF_AssertFail
	thumb_func_end ov07_0221F814

	thumb_func_start ov07_0221F81C
ov07_0221F81C: @ 0x0221F81C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5, #0x18]
	adds r1, r1, #4
	str r1, [r5, #0x18]
	ldr r4, [r1]
	adds r1, r1, #4
	str r1, [r5, #0x18]
	ldr r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl ov07_0221F8C8
	ldr r1, [r5, #0x18]
	adds r2, r1, #4
	str r2, [r5, #0x18]
	ldr r1, [r2]
	adds r2, r2, #4
	str r2, [r5, #0x18]
	adds r2, r5, #0
	adds r2, #0xc0
	ldr r6, [r2]
	ldrh r3, [r6, #0x14]
	str r0, [sp]
	lsls r2, r3, #1
	movs r0, #0x46
	adds r2, r6, r2
	adds r3, r6, r3
	lsls r0, r0, #2
	str r1, [sp, #4]
	ldr r1, [r6, r0]
	adds r2, #0xd8
	lsls r1, r1, #0x1f
	asrs r1, r1, #0x1f
	str r1, [sp, #8]
	ldr r1, [r5]
	adds r3, #0xe8
	str r1, [sp, #0xc]
	subs r0, #0xc
	ldrh r2, [r2]
	ldrb r3, [r3]
	ldr r0, [r6, r0]
	adds r1, r4, #0
	bl FUN_02071FDC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221F81C

	thumb_func_start ov07_0221F880
ov07_0221F880: @ 0x0221F880
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02006360
	cmp r0, #0
	bne _0221F8A4
	ldr r0, [r4, #0x18]
	adds r1, r0, #4
	str r1, [r4, #0x18]
	ldr r0, [r1]
	adds r1, r1, #4
	str r1, [r4, #0x18]
	movs r1, #0
	adds r4, #0x8d
	strb r1, [r4]
	bl FUN_02006300
	pop {r4, pc}
_0221F8A4:
	movs r0, #1
	adds r4, #0x8d
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end ov07_0221F880

	thumb_func_start ov07_0221F8AC
ov07_0221F8AC: @ 0x0221F8AC
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221F8AC

	thumb_func_start ov07_0221F8B0
ov07_0221F8B0: @ 0x0221F8B0
	cmp r0, #0x58
	bls _0221F8B8
	movs r0, #0
	bx lr
_0221F8B8:
	lsls r1, r0, #2
	ldr r0, _0221F8C0 @ =0x02234DE8
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_0221F8C0: .4byte 0x02234DE8
	thumb_func_end ov07_0221F8B0

	thumb_func_start ov07_0221F8C4
ov07_0221F8C4: @ 0x0221F8C4
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end ov07_0221F8C4

	thumb_func_start ov07_0221F8C8
ov07_0221F8C8: @ 0x0221F8C8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov07_0221C468
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov07_0221C470
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov07_0223192C
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0223192C
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _0221F904
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0223192C
	cmp r0, #4
	beq _0221F96A
_0221F904:
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _0221F924
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _0221F924
	movs r0, #0
	mvns r0, r0
	muls r4, r0, r4
	b _0221F96A
_0221F924:
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _0221F948
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _0221F948
	cmp r4, #0
	ble _0221F96A
	movs r0, #0
	mvns r0, r0
	muls r4, r0, r4
	b _0221F96A
_0221F948:
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _0221F96A
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _0221F96A
	cmp r4, #0
	bge _0221F96A
	movs r0, #0
	mvns r0, r0
	muls r4, r0, r4
_0221F96A:
	adds r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221F97A
	movs r0, #0
	mvns r0, r0
	muls r4, r0, r4
_0221F97A:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221F8C8

	thumb_func_start ov07_0221F980
ov07_0221F980: @ 0x0221F980
	push {r3, lr}
	cmp r0, r1
	bge _0221F992
	adds r0, r2, #0
	blx FUN_020E4A90
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r3, pc}
_0221F992:
	cmp r0, r1
	ble _0221F9A4
	adds r0, r2, #0
	blx FUN_020E4A90
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r3, pc}
_0221F9A4:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov07_0221F980

	thumb_func_start ov07_0221F9A8
ov07_0221F9A8: @ 0x0221F9A8
	push {r3, r4, r5, lr}
	ldr r4, [r0, #0x18]
	adds r3, r0, #0
	adds r4, r4, #4
	str r4, [r0, #0x18]
	ldr r5, [r4]
	adds r4, r4, #4
	adds r3, #0x18
	str r4, [r0, #0x18]
	cmp r5, r2
	beq _0221F9CA
	cmp r5, r2
	beq _0221F9C6
	bl GF_AssertFail
_0221F9C6:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221F9CA:
	movs r4, #0
	cmp r2, #0
	ble _0221F9E4
_0221F9D0:
	ldr r5, [r0, #0x18]
	adds r4, r4, #1
	ldr r5, [r5]
	str r5, [r1]
	ldr r5, [r3]
	adds r1, r1, #4
	adds r5, r5, #4
	str r5, [r3]
	cmp r4, r2
	blt _0221F9D0
_0221F9E4:
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221F9A8

	thumb_func_start ov07_0221F9E8
ov07_0221F9E8: @ 0x0221F9E8
	push {r3, r4}
	adds r4, r0, #0
	movs r0, #0x41
	lsls r0, r0, #2
	adds r3, r1, r0
	movs r2, #6
_0221F9F4:
	ldm r3!, {r0, r1}
	stm r4!, {r0, r1}
	subs r2, r2, #1
	bne _0221F9F4
	ldr r0, [r3]
	str r0, [r4]
	pop {r3, r4}
	bx lr
	thumb_func_end ov07_0221F9E8

	thumb_func_start ov07_0221FA04
ov07_0221FA04: @ 0x0221FA04
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, r0, r1
	adds r0, #0xc0
	ldrb r0, [r0]
	bx lr
	thumb_func_end ov07_0221FA04

	thumb_func_start ov07_0221FA10
ov07_0221FA10: @ 0x0221FA10
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, r0, r1
	adds r0, #0xe0
	ldrb r0, [r0]
	bx lr
	thumb_func_end ov07_0221FA10

	thumb_func_start ov07_0221FA1C
ov07_0221FA1C: @ 0x0221FA1C
	adds r0, #0xc0
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r2, r0
	adds r0, #0xd8
	ldrh r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221FA1C

	thumb_func_start ov07_0221FA2C
ov07_0221FA2C: @ 0x0221FA2C
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, r0, r1
	adds r0, #0xe8
	ldrb r0, [r0]
	bx lr
	thumb_func_end ov07_0221FA2C

	thumb_func_start ov07_0221FA38
ov07_0221FA38: @ 0x0221FA38
	adds r0, #0xc0
	ldr r2, [r0]
	lsls r0, r1, #2
	adds r0, r2, r0
	adds r0, #0xec
	ldr r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221FA38

	thumb_func_start ov07_0221FA48
ov07_0221FA48: @ 0x0221FA48
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r4, r1, #2
	adds r0, r0, r4
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0
	bne _0221FA60
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221FA60:
	bl FUN_020094BC
	cmp r0, #0
	beq _0221FA74
	adds r5, #0xc0
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #0xc4
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
_0221FA74:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221FA48

	thumb_func_start ov07_0221FA78
ov07_0221FA78: @ 0x0221FA78
	adds r0, #0xc8
	ldr r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221FA78

	thumb_func_start ov07_0221FA80
ov07_0221FA80: @ 0x0221FA80
	adds r0, #0xc0
	ldr r2, [r0]
	lsls r0, r1, #2
	adds r0, r2, r0
	adds r0, #0xb0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov07_0221FA80

	thumb_func_start ov07_0221FA90
ov07_0221FA90: @ 0x0221FA90
	adds r0, #0xc0
	ldr r2, [r0]
	lsls r0, r1, #2
	adds r0, r2, r0
	adds r0, #0xb0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov07_0221FA90

	thumb_func_start ov07_0221FAA0
ov07_0221FAA0: @ 0x0221FAA0
	adds r0, #0xc0
	ldr r2, [r0]
	lsls r0, r1, #2
	adds r0, r2, r0
	adds r0, #0xb0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov07_0221FAA0

	thumb_func_start ov07_0221FAB0
ov07_0221FAB0: @ 0x0221FAB0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r0, #0xd4
	ldr r1, [r0]
	movs r0, #2
	tst r0, r1
	beq _0221FAC2
	movs r0, #1
	bx lr
_0221FAC2:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221FAB0

	thumb_func_start ov07_0221FAC8
ov07_0221FAC8: @ 0x0221FAC8
	adds r0, #0xc0
	ldr r2, [r0]
	lsls r0, r1, #2
	adds r0, r2, r0
	adds r0, #0xfc
	ldr r1, [r0]
	ldr r0, _0221FAE4 @ =0x200400C0
	tst r0, r1
	beq _0221FADE
	movs r0, #1
	bx lr
_0221FADE:
	movs r0, #0
	bx lr
	nop
_0221FAE4: .4byte 0x200400C0
	thumb_func_end ov07_0221FAC8

	thumb_func_start ov07_0221FAE8
ov07_0221FAE8: @ 0x0221FAE8
	movs r0, #1
	bx lr
	thumb_func_end ov07_0221FAE8

	thumb_func_start ov07_0221FAEC
ov07_0221FAEC: @ 0x0221FAEC
	ldr r0, _0221FAF4 @ =0x02234B8C
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_0221FAF4: .4byte 0x02234B8C
	thumb_func_end ov07_0221FAEC

	thumb_func_start ov07_0221FAF8
ov07_0221FAF8: @ 0x0221FAF8
	ldr r0, _0221FB00 @ =_02234B80
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_0221FB00: .4byte _02234B80
	thumb_func_end ov07_0221FAF8

	thumb_func_start ov07_0221FB04
ov07_0221FB04: @ 0x0221FB04
	push {r3, lr}
	cmp r1, #3
	bhi _0221FB2E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0221FB16: @ jump table
	.2byte _0221FB1E - _0221FB16 - 2 @ case 0
	.2byte _0221FB22 - _0221FB16 - 2 @ case 1
	.2byte _0221FB26 - _0221FB16 - 2 @ case 2
	.2byte _0221FB2A - _0221FB16 - 2 @ case 3
_0221FB1E:
	movs r0, #0
	pop {r3, pc}
_0221FB22:
	movs r0, #1
	pop {r3, pc}
_0221FB26:
	movs r0, #3
	pop {r3, pc}
_0221FB2A:
	bl ov07_0221FAE8
_0221FB2E:
	pop {r3, pc}
	thumb_func_end ov07_0221FB04

	thumb_func_start ov07_0221FB30
ov07_0221FB30: @ 0x0221FB30
	push {r3, lr}
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	adds r0, r2, #0
	adds r2, #0xc0
	ldr r3, [r2]
	movs r2, #0x11
	adds r0, #0xc4
	lsls r2, r2, #4
	lsls r1, r1, #0x18
	ldr r2, [r3, r2]
	movs r3, #1
	ldr r0, [r0]
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x10
	bl FUN_0201C0C0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov07_0221FB30

	thumb_func_start ov07_0221FB58
ov07_0221FB58: @ 0x0221FB58
	push {r3, lr}
	movs r2, #2
	adds r1, r0, #0
	lsls r2, r2, #8
	str r2, [sp]
	adds r1, #0xc0
	adds r0, #0xc8
	ldr r1, [r1]
	subs r2, #0xec
	ldr r1, [r1, r2]
	movs r2, #0
	ldr r0, [r0]
	adds r3, r2, #0
	bl FUN_0200316C
	pop {r3, pc}
	thumb_func_end ov07_0221FB58

	thumb_func_start ov07_0221FB78
ov07_0221FB78: @ 0x0221FB78
	movs r0, #0
	bx lr
	thumb_func_end ov07_0221FB78

	thumb_func_start ov07_0221FB7C
ov07_0221FB7C: @ 0x0221FB7C
	movs r2, #0x14
	muls r2, r0, r2
	ldr r0, _0221FB8C @ =0x02234F48
	lsls r1, r1, #2
	adds r0, r0, r2
	ldr r0, [r1, r0]
	bx lr
	nop
_0221FB8C: .4byte 0x02234F48
	thumb_func_end ov07_0221FB7C

	thumb_func_start ov07_0221FB90
ov07_0221FB90: @ 0x0221FB90
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x98
	ldr r3, _0221FDF0 @ =0x02234BD8
	adds r5, r2, #0
	add r2, sp, #0x80
	adds r7, r0, #0
	str r1, [sp, #0x18]
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [sp, #0x18]
	movs r1, #0x58
	bl FUN_0201AA8C
	adds r4, r0, #0
	ldr r0, [sp, #0x18]
	str r0, [r4]
	str r5, [r4, #4]
	adds r0, r7, #0
	bl FUN_0223A8E4
	str r0, [r4, #8]
	adds r0, r7, #0
	bl FUN_0223A8EC
	str r0, [r4, #0xc]
	adds r0, r7, #0
	bl FUN_0223A938
	str r0, [r4, #0x10]
	movs r6, #0
	adds r5, r4, #0
_0221FBD6:
	movs r0, #0
	str r0, [r5, #0x24]
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_0223BB88
	str r0, [r5, #0x34]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #4
	blt _0221FBD6
	adds r1, r4, #0
	adds r0, r7, #0
	adds r1, #0x44
	bl FUN_0223C1C4
	adds r1, r4, #0
	adds r0, r7, #0
	adds r1, #0x48
	bl FUN_0223C1F4
	ldr r1, [sp, #0x18]
	movs r0, #8
	bl FUN_02007688
	adds r6, r0, #0
	movs r7, #0
	str r4, [sp, #0x1c]
_0221FC0E:
	ldr r0, [r4, #4]
	cmp r7, r0
	beq _0221FC18
	cmp r0, #0xff
	bne _0221FC82
_0221FC18:
	ldr r1, [sp, #0x1c]
	ldr r1, [r1, #0x48]
	cmp r1, #0
	beq _0221FC82
	ldr r1, _0221FDF4 @ =0x0000D903
	movs r3, #0x4c
	adds r2, r7, r1
	ldr r1, _0221FDF8 @ =0x00001388
	muls r1, r0, r1
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	adds r5, r2, r1
	str r0, [sp, #4]
	str r5, [sp, #8]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	adds r2, r6, #0
	bl FUN_0200D504
	str r6, [sp]
	movs r0, #0x4b
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r5, [sp, #0x14]
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	movs r1, #2
	bl FUN_0200D68C
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	adds r2, r6, #0
	movs r3, #0x4d
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	adds r2, r6, #0
	movs r3, #0x4e
	bl FUN_0200D71C
_0221FC82:
	ldr r0, [sp, #0x1c]
	adds r7, r7, #1
	adds r0, r0, #4
	str r0, [sp, #0x1c]
	cmp r7, #4
	blt _0221FC0E
	adds r0, r6, #0
	bl FUN_0200770C
	movs r0, #0
	str r0, [sp, #0x2c]
	adds r7, r4, #0
_0221FC9A:
	ldr r1, [r4, #4]
	ldr r0, [sp, #0x2c]
	cmp r0, r1
	beq _0221FCA8
	cmp r1, #0xff
	beq _0221FCA8
	b _0221FDDC
_0221FCA8:
	ldr r2, _0221FDF4 @ =0x0000D903
	ldr r0, [sp, #0x2c]
	adds r3, r1, #0
	adds r0, r0, r2
	ldr r2, _0221FDF8 @ =0x00001388
	muls r3, r2, r3
	adds r1, r0, r3
	str r1, [r7, #0x14]
	ldr r1, [r4, #4]
	adds r3, r1, #0
	muls r3, r2, r3
	adds r1, r0, r3
	str r1, [sp, #0x68]
	ldr r1, [r4, #4]
	adds r3, r1, #0
	muls r3, r2, r3
	adds r1, r0, r3
	str r1, [sp, #0x6c]
	ldr r1, [r4, #4]
	adds r3, r1, #0
	muls r3, r2, r3
	adds r1, r0, r3
	str r1, [sp, #0x70]
	ldr r1, [r4, #4]
	muls r2, r1, r2
	movs r1, #0
	adds r0, r0, r2
	str r0, [sp, #0x74]
	str r1, [sp, #0x78]
	str r1, [sp, #0x7c]
	ldr r2, [r7, #0x34]
	ldr r5, [r7, #0x48]
	ldr r0, [r2, #4]
	cmp r5, #0
	str r0, [sp, #0x28]
	ldr r0, [r2, #8]
	str r0, [sp, #0x24]
	ldr r0, [r2]
	str r0, [sp, #0x20]
	beq _0221FDDC
	adds r0, r5, #0
	bl FUN_02008A78
	str r0, [sp, #0x30]
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	movs r1, #0x29
	bl FUN_02008A78
	subs r2, r6, r0
	ldr r0, [sp, #0x30]
	add r1, sp, #0x34
	strh r0, [r1]
	strh r2, [r1, #2]
	movs r0, #0
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	ldr r1, [sp, #0x2c]
	add r3, sp, #0x34
	adds r1, r4, r1
	adds r1, #0x44
	ldrb r1, [r1]
	lsls r2, r1, #2
	add r1, sp, #0x80
	ldr r1, [r1, r2]
	str r0, [sp, #0x40]
	str r1, [sp, #0x3c]
	movs r1, #1
	str r1, [sp, #0x44]
	str r1, [sp, #0x60]
	str r0, [sp, #0x64]
	add r2, sp, #0x68
_0221FD42:
	ldr r1, [r2]
	adds r0, r0, #1
	str r1, [r3, #0x14]
	adds r2, r2, #4
	adds r3, r3, #4
	cmp r0, #6
	blt _0221FD42
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r2, sp, #0x34
	bl FUN_0200D734
	adds r6, r0, #0
	bl FUN_0200DC18
	str r6, [r7, #0x24]
	cmp r5, #0
	bne _0221FD70
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0200DCE8
	b _0221FD98
_0221FD70:
	adds r0, r5, #0
	bl FUN_020094BC
	cmp r0, #0
	bne _0221FD84
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0200DCE8
	b _0221FD98
_0221FD84:
	adds r0, r5, #0
	movs r1, #6
	bl FUN_02008A78
	cmp r0, #1
	bne _0221FD98
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0200DCE8
_0221FD98:
	cmp r5, #0
	beq _0221FDB2
	ldr r0, [r6]
	bl FUN_02024B1C
	adds r1, r0, #0
	movs r3, #0x32
	ldr r1, [r1, #4]
	ldr r2, [sp, #0x20]
	movs r0, #0x13
	lsls r3, r3, #6
	bl FUN_020205D8
_0221FDB2:
	cmp r5, #0
	beq _0221FDDC
	ldr r0, [r6]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	movs r1, #2
	str r1, [sp]
	movs r1, #0x20
	lsls r0, r0, #0x14
	str r1, [sp, #4]
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x24]
	ldr r3, [r4]
	bl FUN_02003200
_0221FDDC:
	ldr r0, [sp, #0x2c]
	adds r7, r7, #4
	adds r0, r0, #1
	str r0, [sp, #0x2c]
	cmp r0, #4
	bge _0221FDEA
	b _0221FC9A
_0221FDEA:
	adds r0, r4, #0
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221FDF0: .4byte 0x02234BD8
_0221FDF4: .4byte 0x0000D903
_0221FDF8: .4byte 0x00001388
	thumb_func_end ov07_0221FB90

	thumb_func_start ov07_0221FDFC
ov07_0221FDFC: @ 0x0221FDFC
	ldr r3, _0221FE04 @ =ov07_0221FB90
	movs r2, #0xff
	bx r3
	nop
_0221FE04: .4byte ov07_0221FB90
	thumb_func_end ov07_0221FDFC

	thumb_func_start ov07_0221FE08
ov07_0221FE08: @ 0x0221FE08
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #0
_0221FE10:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _0221FE2C
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x14]
	bl FUN_0200D958
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x14]
	bl FUN_0200D968
	ldr r0, [r4, #0x24]
	bl FUN_0200D9DC
_0221FE2C:
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _0221FE10
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221FE08

	thumb_func_start ov07_0221FE3C
ov07_0221FE3C: @ 0x0221FE3C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #0
_0221FE44:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _0221FE60
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x14]
	bl FUN_0200D958
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x14]
	bl FUN_0200D968
	ldr r0, [r4, #0x24]
	bl FUN_0200D9DC
_0221FE60:
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _0221FE44
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221FE3C

	thumb_func_start ov07_0221FE70
ov07_0221FE70: @ 0x0221FE70
	push {r4, lr}
	adds r4, r0, #0
	bne _0221FE7A
	bl GF_AssertFail
_0221FE7A:
	ldr r0, [r4, #4]
	adds r0, r4, r0
	adds r0, #0x44
	ldrb r0, [r0]
	pop {r4, pc}
	thumb_func_end ov07_0221FE70

	thumb_func_start ov07_0221FE84
ov07_0221FE84: @ 0x0221FE84
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221FE84

	thumb_func_start ov07_0221FE88
ov07_0221FE88: @ 0x0221FE88
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	bl FUN_0221BA40
	adds r4, r0, #0
	movs r0, #0x1d
	adds r1, r6, #0
	adds r2, r5, #0
	bl FUN_02015264
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0xa
	adds r3, r7, #0
	bl FUN_0201526C
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221FE88

	thumb_func_start ov07_0221FEB0
ov07_0221FEB0: @ 0x0221FEB0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp]
	bl FUN_0221BA40
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl FUN_02015264
	adds r1, r0, #0
	ldr r3, [sp]
	adds r0, r4, #0
	movs r2, #0xa
	bl FUN_0201526C
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0221FEB0

	thumb_func_start ov07_0221FEDC
ov07_0221FEDC: @ 0x0221FEDC
	ldr r3, _0221FEE0 @ =FUN_0200771C
	bx r3
	.align 2, 0
_0221FEE0: .4byte FUN_0200771C
	thumb_func_end ov07_0221FEDC

	thumb_func_start ov07_0221FEE4
ov07_0221FEE4: @ 0x0221FEE4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	adds r7, r2, #0
	str r3, [sp]
	bl FUN_0221BA88
	adds r4, r0, #0
	bne _0221FEFC
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221FEFC:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov07_0221FEDC
	adds r1, r0, #0
	ldr r3, [sp]
	adds r0, r4, #0
	movs r2, #0xa
	bl FUN_0201526C
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0221FEE4

	thumb_func_start ov07_0221FF18
ov07_0221FF18: @ 0x0221FF18
	push {r4, lr}
	lsls r4, r2, #2
	ldr r2, _0221FF28 @ =0x022353E4
	ldr r2, [r2, r4]
	bl FUN_02015494
	pop {r4, pc}
	nop
_0221FF28: .4byte 0x022353E4
	thumb_func_end ov07_0221FF18

	thumb_func_start ov07_0221FF2C
ov07_0221FF2C: @ 0x0221FF2C
	ldr r3, _0221FF30 @ =FUN_0221BAD8
	bx r3
	.align 2, 0
_0221FF30: .4byte FUN_0221BAD8
	thumb_func_end ov07_0221FF2C

	thumb_func_start ov07_0221FF34
ov07_0221FF34: @ 0x0221FF34
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r2, #0
	movs r4, #1
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov07_02231924
	cmp r5, #5
	bhi _0221FF70
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221FF5A: @ jump table
	.2byte _0221FF70 - _0221FF5A - 2 @ case 0
	.2byte _0221FF66 - _0221FF5A - 2 @ case 1
	.2byte _0221FF70 - _0221FF5A - 2 @ case 2
	.2byte _0221FF6A - _0221FF5A - 2 @ case 3
	.2byte _0221FF70 - _0221FF5A - 2 @ case 4
	.2byte _0221FF6E - _0221FF5A - 2 @ case 5
_0221FF66:
	subs r4, r4, #2
	b _0221FF70
_0221FF6A:
	subs r4, r4, #2
	b _0221FF70
_0221FF6E:
	subs r4, r4, #2
_0221FF70:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221FF34

	thumb_func_start ov07_0221FF74
ov07_0221FF74: @ 0x0221FF74
	bx lr
	.align 2, 0
	thumb_func_end ov07_0221FF74

	thumb_func_start ov07_0221FF78
ov07_0221FF78: @ 0x0221FF78
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	bl FUN_02015504
	adds r4, r0, #0
	bl ov07_0221C468
	adds r0, r4, #0
	bl ov07_0221C470
	adds r0, r4, #0
	bl ov07_0221C478
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #1
	bl ov07_0223192C
	cmp r0, #3
	bne _0221FFAE
	adds r0, r4, #0
	movs r1, #1
	add r2, sp, #0x28
	bl ov07_02231B90
	b _0221FFE6
_0221FFAE:
	adds r0, r4, #0
	movs r1, #1
	bl ov07_02231924
	str r0, [sp]
	bl ov07_022319E0
	str r0, [sp, #4]
	adds r0, r6, #0
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r4, r0, #0
	ldr r0, [sp, #4]
	add r1, sp, #0x28
	adds r2, r4, #0
	adds r3, r7, #0
	bl ov07_02231AD0
	ldr r0, [sp]
	add r1, sp, #0x1c
	adds r2, r4, #0
	adds r3, r7, #0
	bl ov07_02231AD0
_0221FFE6:
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x28]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x2c]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x30]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, r1, r0
	str r0, [r5, #0x30]
	movs r0, #1
	add r1, sp, #0x10
	bl ov07_02231DE8
	adds r0, r6, #0
	bl FUN_02015524
	adds r4, r0, #0
	add r0, sp, #8
	adds r1, r4, #0
	bl FUN_02023618
	add r0, sp, #8
	adds r1, r4, #0
	bl FUN_02023558
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0221FF78

	thumb_func_start ov07_02220030
ov07_02220030: @ 0x02220030
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	bl FUN_02015504
	adds r4, r0, #0
	bl ov07_0221C470
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov07_0221C478
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #0
	add r2, sp, #0xc
	bl ov07_02231B90
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0xc]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x14]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, r1, r0
	str r0, [r5, #0x30]
	adds r0, r6, #0
	add r1, sp, #0
	bl ov07_02231DE8
	adds r0, r7, #0
	add r1, sp, #0
	bl FUN_020154E4
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02220030

	thumb_func_start ov07_0222008C
ov07_0222008C: @ 0x0222008C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl FUN_02015504
	adds r5, r0, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r5, #0
	add r2, sp, #0
	bl ov07_02231B90
	ldr r0, [r4, #0x20]
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r1, r0
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, r1, r0
	str r0, [r4, #0x30]
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0222008C

	thumb_func_start ov07_022200D0
ov07_022200D0: @ 0x022200D0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl FUN_02015504
	adds r5, r0, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	add r2, sp, #0
	bl ov07_02231B90
	ldr r0, [r4, #0x20]
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r1, r0
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, r1, r0
	str r0, [r4, #0x30]
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_022200D0

	thumb_func_start ov07_02220114
ov07_02220114: @ 0x02220114
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl FUN_02015504
	adds r4, r0, #0
	bl ov07_0221C468
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov07_0221C470
	adds r0, r4, #0
	adds r1, r6, #0
	add r2, sp, #0
	bl ov07_02231B90
	ldr r0, [r5, #0x20]
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, r1, r0
	str r0, [r5, #0x30]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_02220114

	thumb_func_start ov07_02220160
ov07_02220160: @ 0x02220160
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl FUN_02015504
	adds r6, r0, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r6, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	beq _0222018C
	movs r4, #1
	b _0222018E
_0222018C:
	movs r4, #0
_0222018E:
	adds r0, r6, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r4, #0
	add r1, sp, #0
	adds r3, r7, #0
	bl ov07_02231AD0
	ldr r0, [r5, #0x20]
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, r1, r0
	str r0, [r5, #0x30]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_02220160

	thumb_func_start ov07_022201C8
ov07_022201C8: @ 0x022201C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl FUN_02015504
	adds r6, r0, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r6, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	beq _022201F4
	movs r4, #1
	b _022201F6
_022201F4:
	movs r4, #0
_022201F6:
	adds r0, r6, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r4, #0
	add r1, sp, #0
	adds r3, r7, #0
	bl ov07_02231AD0
	ldr r0, [r5, #0x20]
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, r1, r0
	str r0, [r5, #0x30]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_022201C8

	thumb_func_start ov07_02220230
ov07_02220230: @ 0x02220230
	push {r4, r5, r6, r7, lr}
	sub sp, #0x9c
	adds r5, r0, #0
	add r1, sp, #0
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	ldr r3, _022202D0 @ =0x02235440
	add r2, sp, #0x54
	movs r1, #0x24
_0222024C:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _0222024C
	ldr r3, _022202D4 @ =0x02235488
	add r2, sp, #0xc
	movs r1, #0x24
_0222025E:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _0222025E
	bl FUN_02015504
	adds r4, r0, #0
	bl ov07_0221C468
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov07_0221C470
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov07_02231924
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov07_02231924
	lsls r2, r0, #1
	movs r0, #0xc
	adds r1, r6, #0
	muls r1, r0, r1
	add r0, sp, #0x54
	adds r0, r0, r1
	ldrsh r4, [r2, r0]
	movs r3, #0xac
	adds r0, r4, #0
	ldr r4, [r5, #0x20]
	muls r0, r3, r0
	ldr r4, [r4]
	ldr r4, [r4, #4]
	adds r0, r0, r4
	str r0, [r5, #0x28]
	add r0, sp, #0xc
	adds r0, r0, r1
	ldrsh r0, [r2, r0]
	adds r1, r0, #0
	ldr r0, [r5, #0x20]
	muls r1, r3, r1
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	str r0, [r5, #0x30]
	add sp, #0x9c
	pop {r4, r5, r6, r7, pc}
	nop
_022202D0: .4byte 0x02235440
_022202D4: .4byte 0x02235488
	thumb_func_end ov07_02220230

	thumb_func_start ov07_022202D8
ov07_022202D8: @ 0x022202D8
	push {r3, r4}
	adds r3, r2, #0
	adds r3, #8
	cmp r0, #7
	bhi _02220368
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022202EE: @ jump table
	.2byte _02220368 - _022202EE - 2 @ case 0
	.2byte _022202FE - _022202EE - 2 @ case 1
	.2byte _02220308 - _022202EE - 2 @ case 2
	.2byte _02220312 - _022202EE - 2 @ case 3
	.2byte _0222031C - _022202EE - 2 @ case 4
	.2byte _0222032E - _022202EE - 2 @ case 5
	.2byte _02220340 - _022202EE - 2 @ case 6
	.2byte _02220352 - _022202EE - 2 @ case 7
_022202FE:
	ldr r0, [r2]
	muls r1, r0, r1
	str r1, [r2]
	pop {r3, r4}
	bx lr
_02220308:
	ldr r0, [r2, #4]
	muls r1, r0, r1
	str r1, [r2, #4]
	pop {r3, r4}
	bx lr
_02220312:
	ldr r0, [r3]
	muls r1, r0, r1
	str r1, [r3]
	pop {r3, r4}
	bx lr
_0222031C:
	ldr r0, [r2]
	adds r3, r0, #0
	muls r3, r1, r3
	str r3, [r2]
	ldr r0, [r2, #4]
	muls r1, r0, r1
	str r1, [r2, #4]
	pop {r3, r4}
	bx lr
_0222032E:
	ldr r0, [r2]
	adds r4, r0, #0
	muls r4, r1, r4
	str r4, [r2]
	ldr r0, [r3]
	muls r1, r0, r1
	str r1, [r3]
	pop {r3, r4}
	bx lr
_02220340:
	ldr r0, [r2, #4]
	adds r4, r0, #0
	muls r4, r1, r4
	str r4, [r2, #4]
	ldr r0, [r3]
	muls r1, r0, r1
	str r1, [r3]
	pop {r3, r4}
	bx lr
_02220352:
	ldr r0, [r2]
	adds r4, r0, #0
	muls r4, r1, r4
	str r4, [r2]
	ldr r0, [r2, #4]
	adds r4, r0, #0
	muls r4, r1, r4
	str r4, [r2, #4]
	ldr r0, [r3]
	muls r1, r0, r1
	str r1, [r3]
_02220368:
	pop {r3, r4}
	bx lr
	thumb_func_end ov07_022202D8

	thumb_func_start ov07_0222036C
ov07_0222036C: @ 0x0222036C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r6, r2, #0
	adds r5, r1, #0
	adds r1, r3, #0
	add r7, sp, #0x10
	movs r2, #0
	str r2, [r7]
	ldr r3, [sp, #0x30]
	str r2, [r7, #4]
	ldr r4, [sp, #0x38]
	str r2, [r7, #8]
	cmp r3, #5
	bhi _02220416
	adds r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_02220394: @ jump table
	.2byte _02220416 - _02220394 - 2 @ case 0
	.2byte _022203A0 - _02220394 - 2 @ case 1
	.2byte _022203C6 - _02220394 - 2 @ case 2
	.2byte _022203DA - _02220394 - 2 @ case 3
	.2byte _022203E2 - _02220394 - 2 @ case 4
	.2byte _022203EC - _02220394 - 2 @ case 5
_022203A0:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_02015720
	add r1, sp, #0x20
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	ldr r1, [sp, #0x10]
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r1, [sp, #0x14]
	str r2, [sp, #0x10]
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r1, [sp, #0x18]
	str r2, [sp, #0x14]
	muls r0, r1, r0
	str r0, [sp, #0x18]
	b _02220416
_022203C6:
	str r2, [sp, #0x10]
	add r1, sp, #0x20
	movs r0, #0x14
	ldrsb r1, [r1, r0]
	movs r0, #0x32
	lsls r0, r0, #6
	muls r0, r1, r0
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	b _02220416
_022203DA:
	adds r2, r7, #0
	bl ov07_02231B90
	b _02220416
_022203E2:
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov07_02231B90
	b _02220416
_022203EC:
	add r1, sp, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	movs r2, #4
	bl ov07_0221F9A8
	ldr r0, [sp]
	add r2, sp, #0x20
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	movs r1, #0x14
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r0, [sp, #0x18]
	ldrsb r1, [r2, r1]
	ldr r0, [sp, #0xc]
	adds r2, r7, #0
	bl ov07_022202D8
_02220416:
	ldr r1, [sp, #0x10]
	ldr r0, [r4]
	subs r0, r1, r0
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	ldr r0, [r4, #4]
	subs r0, r1, r0
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, [r4, #8]
	subs r0, r1, r0
	str r0, [sp, #0x18]
	adds r0, r5, #0
	add r1, sp, #0x10
	bl FUN_02015708
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0222036C

	thumb_func_start ov07_0222043C
ov07_0222043C: @ 0x0222043C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r6, r2, #0
	adds r5, r1, #0
	adds r1, r3, #0
	add r7, sp, #0x10
	movs r2, #0
	str r2, [r7]
	ldr r3, [sp, #0x30]
	str r2, [r7, #4]
	ldr r4, [sp, #0x38]
	str r2, [r7, #8]
	cmp r3, #5
	bhi _022204E6
	adds r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_02220464: @ jump table
	.2byte _022204E6 - _02220464 - 2 @ case 0
	.2byte _02220470 - _02220464 - 2 @ case 1
	.2byte _02220496 - _02220464 - 2 @ case 2
	.2byte _022204AA - _02220464 - 2 @ case 3
	.2byte _022204B2 - _02220464 - 2 @ case 4
	.2byte _022204BC - _02220464 - 2 @ case 5
_02220470:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_02015640
	add r1, sp, #0x20
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	ldr r1, [sp, #0x10]
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r1, [sp, #0x14]
	str r2, [sp, #0x10]
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r1, [sp, #0x18]
	str r2, [sp, #0x14]
	muls r0, r1, r0
	str r0, [sp, #0x18]
	b _022204E6
_02220496:
	str r2, [sp, #0x10]
	add r1, sp, #0x20
	movs r0, #0x14
	ldrsb r1, [r1, r0]
	movs r0, #0x32
	lsls r0, r0, #6
	muls r0, r1, r0
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	b _022204E6
_022204AA:
	adds r2, r7, #0
	bl ov07_02231B90
	b _022204E6
_022204B2:
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov07_02231B90
	b _022204E6
_022204BC:
	add r1, sp, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	movs r2, #4
	bl ov07_0221F9A8
	ldr r0, [sp]
	add r2, sp, #0x20
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	movs r1, #0x14
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r0, [sp, #0x18]
	ldrsb r1, [r2, r1]
	ldr r0, [sp, #0xc]
	adds r2, r7, #0
	bl ov07_022202D8
_022204E6:
	ldr r1, [sp, #0x10]
	ldr r0, [r4]
	subs r0, r1, r0
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	ldr r0, [r4, #4]
	subs r0, r1, r0
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, [r4, #8]
	subs r0, r1, r0
	str r0, [sp, #0x18]
	adds r0, r5, #0
	add r1, sp, #0x10
	bl FUN_02015628
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0222043C

	thumb_func_start ov07_0222050C
ov07_0222050C: @ 0x0222050C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x94
	adds r6, r0, #0
	adds r7, r2, #0
	adds r4, r1, #0
	str r3, [sp, #0xc]
	bl ov07_0221C478
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov07_02231924
	str r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	adds r0, r6, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r6, #0
	add r1, sp, #0x7c
	movs r2, #3
	bl ov07_0221F9A8
	adds r0, r6, #0
	add r1, sp, #0x70
	movs r2, #3
	bl ov07_0221F9A8
	adds r0, r6, #0
	add r1, sp, #0x58
	movs r2, #3
	bl ov07_0221F9A8
	adds r0, r6, #0
	add r1, sp, #0x64
	movs r2, #3
	bl ov07_0221F9A8
	adds r0, r6, #0
	add r1, sp, #0x40
	movs r2, #3
	bl ov07_0221F9A8
	adds r0, r6, #0
	add r1, sp, #0x34
	movs r2, #3
	bl ov07_0221F9A8
	adds r0, r6, #0
	add r1, sp, #0x4c
	movs r2, #3
	bl ov07_0221F9A8
	ldr r0, [sp, #0x10]
	cmp r0, #5
	bhi _02220594
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02220588: @ jump table
	.2byte _02220594 - _02220588 - 2 @ case 0
	.2byte _022205A4 - _02220588 - 2 @ case 1
	.2byte _022205BA - _02220588 - 2 @ case 2
	.2byte _022205EE - _02220588 - 2 @ case 3
	.2byte _02220638 - _02220588 - 2 @ case 4
	.2byte _0222066C - _02220588 - 2 @ case 5
_02220594:
	ldr r1, [sp, #0x7c]
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x80]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x84]
	strh r1, [r0, #4]
	b _022206B4
_022205A4:
	ldr r0, [sp, #0x7c]
	rsbs r1, r0, #0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x80]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0x84]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	b _022206B4
_022205BA:
	cmp r5, #3
	add r0, sp, #0x14
	bne _022205CE
	ldr r1, [sp, #0x70]
	strh r1, [r0]
	ldr r1, [sp, #0x74]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x78]
	strh r1, [r0, #4]
	b _022206B4
_022205CE:
	cmp r5, #5
	bne _022205E0
	ldr r1, [sp, #0x58]
	strh r1, [r0]
	ldr r1, [sp, #0x5c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x60]
	strh r1, [r0, #4]
	b _022206B4
_022205E0:
	ldr r1, [sp, #0x64]
	strh r1, [r0]
	ldr r1, [sp, #0x68]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x6c]
	strh r1, [r0, #4]
	b _022206B4
_022205EE:
	cmp r5, #2
	bne _02220608
	ldr r0, [sp, #0x70]
	rsbs r1, r0, #0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x74]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0x78]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	b _022206B4
_02220608:
	cmp r5, #5
	bne _02220622
	ldr r0, [sp, #0x64]
	rsbs r1, r0, #0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x68]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0x6c]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	b _022206B4
_02220622:
	ldr r0, [sp, #0x40]
	rsbs r1, r0, #0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x44]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0x48]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	b _022206B4
_02220638:
	cmp r5, #3
	add r0, sp, #0x14
	bne _0222064C
	ldr r1, [sp, #0x40]
	strh r1, [r0]
	ldr r1, [sp, #0x44]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x48]
	strh r1, [r0, #4]
	b _022206B4
_0222064C:
	cmp r5, #5
	bne _0222065E
	ldr r1, [sp, #0x34]
	strh r1, [r0]
	ldr r1, [sp, #0x38]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x3c]
	strh r1, [r0, #4]
	b _022206B4
_0222065E:
	ldr r1, [sp, #0x4c]
	strh r1, [r0]
	ldr r1, [sp, #0x50]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x54]
	strh r1, [r0, #4]
	b _022206B4
_0222066C:
	cmp r5, #3
	bne _02220686
	ldr r0, [sp, #0x4c]
	rsbs r1, r0, #0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x50]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0x54]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	b _022206B4
_02220686:
	cmp r5, #2
	bne _022206A0
	ldr r0, [sp, #0x58]
	rsbs r1, r0, #0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x5c]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0x60]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	b _022206B4
_022206A0:
	ldr r0, [sp, #0x34]
	rsbs r1, r0, #0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x38]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0x3c]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
_022206B4:
	ldr r2, [sp, #0xc]
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov07_0221FF34
	adds r5, r0, #0
	add r1, sp, #0x28
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	adds r0, r6, #0
	movs r2, #3
	bl ov07_0221F9A8
	adds r0, r6, #0
	adds r1, r7, #0
	add r2, sp, #0x1c
	bl ov07_02231B90
	ldr r0, [sp, #0x28]
	cmp r0, #0
	bne _02220720
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bne _02220720
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _02220720
	add r3, sp, #0x1c
	ldm r3!, {r0, r1}
	add r2, sp, #0x88
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [r4, #0x20]
	ldr r0, [sp, #0x1c]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	adds r0, r0, r1
	str r0, [r4, #0x28]
	ldr r1, [r4, #0x20]
	ldr r0, [sp, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r0, r0, r1
	str r0, [r4, #0x2c]
	ldr r1, [r4, #0x20]
	ldr r0, [sp, #0x24]
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	b _02220774
_02220720:
	ldr r2, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	str r2, [sp, #0x88]
	str r1, [sp, #0x8c]
	str r0, [sp, #0x90]
	cmp r2, #0
	bne _0222073A
	movs r0, #0x32
	lsls r0, r0, #6
	cmp r1, r0
	bne _0222073A
	movs r5, #1
_0222073A:
	ldr r1, [sp, #0x88]
	adds r0, r1, #0
	ldr r1, [sp, #0x8c]
	muls r0, r5, r0
	adds r2, r1, #0
	muls r2, r5, r2
	ldr r1, [sp, #0x24]
	str r2, [sp, #0x8c]
	adds r2, r1, #0
	muls r2, r5, r2
	str r0, [sp, #0x88]
	str r2, [sp, #0x90]
	ldr r1, [r4, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	adds r0, r0, r1
	str r0, [r4, #0x28]
	ldr r1, [r4, #0x20]
	ldr r0, [sp, #0x8c]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r0, r0, r1
	str r0, [r4, #0x2c]
	ldr r1, [r4, #0x20]
	ldr r0, [sp, #0x90]
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0x30]
_02220774:
	ldr r0, [sp, #0xa8]
	cmp r0, #0
	beq _022207B2
	cmp r0, #1
	beq _02220784
	cmp r0, #2
	beq _0222079C
	b _022207B2
_02220784:
	ldr r0, [sp, #0xac]
	ldr r3, [sp, #0xc]
	str r0, [sp]
	str r5, [sp, #4]
	add r0, sp, #0x88
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov07_0222036C
	b _022207B2
_0222079C:
	ldr r0, [sp, #0xac]
	ldr r3, [sp, #0xc]
	str r0, [sp]
	str r5, [sp, #4]
	add r0, sp, #0x88
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov07_0222043C
_022207B2:
	add r1, sp, #0x14
	ldrh r2, [r1]
	adds r0, r4, #0
	adds r0, #0x50
	strh r2, [r0]
	adds r0, r4, #0
	ldrh r2, [r1, #2]
	adds r0, #0x52
	adds r4, #0x54
	strh r2, [r0]
	ldrh r0, [r1, #4]
	strh r0, [r4]
	add sp, #0x94
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0222050C

	thumb_func_start ov07_022207D0
ov07_022207D0: @ 0x022207D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_02015504
	adds r6, r0, #0
	bl ov07_0221C468
	str r0, [sp, #8]
	adds r0, r6, #0
	bl ov07_0221C470
	adds r3, r0, #0
	str r5, [sp]
	ldr r2, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #0
	str r4, [sp, #4]
	bl ov07_0222050C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_022207D0

	thumb_func_start ov07_02220800
ov07_02220800: @ 0x02220800
	ldr r3, _02220808 @ =ov07_022207D0
	movs r1, #0
	adds r2, r1, #0
	bx r3
	.align 2, 0
_02220808: .4byte ov07_022207D0
	thumb_func_end ov07_02220800

	thumb_func_start ov07_0222080C
ov07_0222080C: @ 0x0222080C
	ldr r3, _02220814 @ =ov07_022207D0
	movs r1, #1
	adds r2, r1, #0
	bx r3
	.align 2, 0
_02220814: .4byte ov07_022207D0
	thumb_func_end ov07_0222080C

	thumb_func_start ov07_02220818
ov07_02220818: @ 0x02220818
	ldr r3, _02220820 @ =ov07_022207D0
	movs r1, #1
	movs r2, #2
	bx r3
	.align 2, 0
_02220820: .4byte ov07_022207D0
	thumb_func_end ov07_02220818

	thumb_func_start ov07_02220824
ov07_02220824: @ 0x02220824
	ldr r3, _0222082C @ =ov07_022207D0
	movs r1, #1
	movs r2, #3
	bx r3
	.align 2, 0
_0222082C: .4byte ov07_022207D0
	thumb_func_end ov07_02220824

	thumb_func_start ov07_02220830
ov07_02220830: @ 0x02220830
	ldr r3, _02220838 @ =ov07_022207D0
	movs r1, #1
	movs r2, #4
	bx r3
	.align 2, 0
_02220838: .4byte ov07_022207D0
	thumb_func_end ov07_02220830

	thumb_func_start ov07_0222083C
ov07_0222083C: @ 0x0222083C
	ldr r3, _02220844 @ =ov07_022207D0
	movs r1, #1
	movs r2, #5
	bx r3
	.align 2, 0
_02220844: .4byte ov07_022207D0
	thumb_func_end ov07_0222083C

	thumb_func_start ov07_02220848
ov07_02220848: @ 0x02220848
	ldr r3, _02220850 @ =ov07_022207D0
	movs r1, #2
	movs r2, #1
	bx r3
	.align 2, 0
_02220850: .4byte ov07_022207D0
	thumb_func_end ov07_02220848

	thumb_func_start ov07_02220854
ov07_02220854: @ 0x02220854
	ldr r3, _0222085C @ =ov07_022207D0
	movs r1, #2
	adds r2, r1, #0
	bx r3
	.align 2, 0
_0222085C: .4byte ov07_022207D0
	thumb_func_end ov07_02220854

	thumb_func_start ov07_02220860
ov07_02220860: @ 0x02220860
	ldr r3, _02220868 @ =ov07_022207D0
	movs r1, #2
	movs r2, #3
	bx r3
	.align 2, 0
_02220868: .4byte ov07_022207D0
	thumb_func_end ov07_02220860

	thumb_func_start ov07_0222086C
ov07_0222086C: @ 0x0222086C
	ldr r3, _02220874 @ =ov07_022207D0
	movs r1, #2
	movs r2, #4
	bx r3
	.align 2, 0
_02220874: .4byte ov07_022207D0
	thumb_func_end ov07_0222086C

	thumb_func_start ov07_02220878
ov07_02220878: @ 0x02220878
	ldr r3, _02220880 @ =ov07_022207D0
	movs r1, #2
	movs r2, #5
	bx r3
	.align 2, 0
_02220880: .4byte ov07_022207D0
	thumb_func_end ov07_02220878

	thumb_func_start ov07_02220884
ov07_02220884: @ 0x02220884
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	bl FUN_02015504
	adds r4, r0, #0
	bl ov07_0221C468
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov07_0221C470
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r6, #0
	bl ov07_0222050C
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_02220884

	thumb_func_start ov07_022208B4
ov07_022208B4: @ 0x022208B4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r2, [r4, #0x14]
	adds r5, r0, #0
	cmp r2, #0
	beq _022208C4
	bl ov07_02220978
_022208C4:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _022208D2
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02220CAC
_022208D2:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _022208E0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_0222150C
_022208E0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02221540
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _022208F6
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02221550
_022208F6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_022208B4

	thumb_func_start ov07_022208F8
ov07_022208F8: @ 0x022208F8
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [r1]
	adds r6, r2, #0
	adds r0, r4, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov07_0223192C
	cmp r0, #3
	beq _02220920
	movs r5, #1
	b _02220922
_02220920:
	movs r5, #0
_02220922:
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231AD0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_022208F8

	thumb_func_start ov07_02220938
ov07_02220938: @ 0x02220938
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [r1]
	adds r6, r2, #0
	adds r0, r4, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov07_0223192C
	cmp r0, #3
	beq _02220960
	movs r5, #1
	b _02220962
_02220960:
	movs r5, #0
_02220962:
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231AD0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_02220938

	thumb_func_start ov07_02220978
ov07_02220978: @ 0x02220978
	push {r3, r4, r5, r6, lr}
	sub sp, #0xbc
	adds r4, r1, #0
	ldr r2, [r4, #0x14]
	adds r5, r0, #0
	cmp r2, #0x64
	bgt _022209E0
	blt _0222098A
	b _02220B54
_0222098A:
	cmp r2, #0x22
	bhi _022209E6
	adds r3, r2, r2
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_0222099A: @ jump table
	.2byte _02220C5E - _0222099A - 2 @ case 0
	.2byte _022209E8 - _0222099A - 2 @ case 1
	.2byte _022209F4 - _0222099A - 2 @ case 2
	.2byte _02220AF0 - _0222099A - 2 @ case 3
	.2byte _02220B2C - _0222099A - 2 @ case 4
	.2byte _02220B40 - _0222099A - 2 @ case 5
	.2byte _02220A00 - _0222099A - 2 @ case 6
	.2byte _02220A0C - _0222099A - 2 @ case 7
	.2byte _02220AD8 - _0222099A - 2 @ case 8
	.2byte _02220AE4 - _0222099A - 2 @ case 9
	.2byte _02220A18 - _0222099A - 2 @ case 10
	.2byte _02220A24 - _0222099A - 2 @ case 11
	.2byte _02220B80 - _0222099A - 2 @ case 12
	.2byte _02220B90 - _0222099A - 2 @ case 13
	.2byte _02220A30 - _0222099A - 2 @ case 14
	.2byte _02220A3C - _0222099A - 2 @ case 15
	.2byte _02220A48 - _0222099A - 2 @ case 16
	.2byte _02220A54 - _0222099A - 2 @ case 17
	.2byte _02220A60 - _0222099A - 2 @ case 18
	.2byte _02220A6C - _0222099A - 2 @ case 19
	.2byte _02220A78 - _0222099A - 2 @ case 20
	.2byte _02220A84 - _0222099A - 2 @ case 21
	.2byte _02220A90 - _0222099A - 2 @ case 22
	.2byte _02220A9C - _0222099A - 2 @ case 23
	.2byte _02220AA8 - _0222099A - 2 @ case 24
	.2byte _02220AB4 - _0222099A - 2 @ case 25
	.2byte _02220AC0 - _0222099A - 2 @ case 26
	.2byte _02220ACC - _0222099A - 2 @ case 27
	.2byte _02220BA0 - _0222099A - 2 @ case 28
	.2byte _02220C5E - _0222099A - 2 @ case 29
	.2byte _02220BF0 - _0222099A - 2 @ case 30
	.2byte _02220BC6 - _0222099A - 2 @ case 31
	.2byte _02220C28 - _0222099A - 2 @ case 32
	.2byte _02220BAC - _0222099A - 2 @ case 33
	.2byte _02220BBA - _0222099A - 2 @ case 34
_022209E0:
	cmp r2, #0x65
	bne _022209E6
	b _02220B6A
_022209E6:
	b _02220C5E
_022209E8:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231B90
	b _02220C5E
_022209F4:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231B90
	b _02220C5E
_02220A00:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231BC0
	b _02220C5E
_02220A0C:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231BC0
	b _02220C5E
_02220A18:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231BF0
	b _02220C5E
_02220A24:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231BF0
	b _02220C5E
_02220A30:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231C20
	b _02220C5E
_02220A3C:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231C20
	b _02220C5E
_02220A48:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231C50
	b _02220C5E
_02220A54:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231C50
	b _02220C5E
_02220A60:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231C80
	b _02220C5E
_02220A6C:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231C80
	b _02220C5E
_02220A78:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231CB0
	b _02220C5E
_02220A84:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231CB0
	b _02220C5E
_02220A90:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231CE0
	b _02220C5E
_02220A9C:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231CE0
	b _02220C5E
_02220AA8:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231D10
	b _02220C5E
_02220AB4:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231D10
	b _02220C5E
_02220AC0:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231D40
	b _02220C5E
_02220ACC:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231D40
	b _02220C5E
_02220AD8:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231DA0
	b _02220C5E
_02220AE4:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231DA0
	b _02220C5E
_02220AF0:
	ldr r0, [r4]
	add r1, sp, #0xa0
	movs r2, #4
	bl ov07_0221F9A8
	adds r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #0xa4]
	str r0, [sp, #0xb0]
	ldr r0, [sp, #0xa8]
	str r0, [sp, #0xb4]
	ldr r0, [sp, #0xac]
	str r0, [sp, #0xb8]
	ldr r0, [sp, #0xa0]
	cmp r0, #1
	bne _02220B18
	movs r0, #1
	strb r0, [r4, #8]
_02220B18:
	movs r0, #8
	ldrsb r1, [r4, r0]
	ldr r2, [sp, #0xb0]
	muls r1, r2, r1
	str r1, [sp, #0xb0]
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #0xb4]
	muls r0, r1, r0
	str r0, [sp, #0xb4]
	b _02220C5E
_02220B2C:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231B90
	adds r0, r4, #0
	add r1, sp, #0xb0
	bl ov07_02221734
	b _02220C5E
_02220B40:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231B90
	adds r0, r4, #0
	add r1, sp, #0xb0
	bl ov07_02221734
	b _02220C5E
_02220B54:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231B90
	ldr r1, [r4, #0x24]
	adds r0, r4, #0
	add r2, sp, #0xb0
	bl ov07_022216A8
	b _02220C5E
_02220B6A:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231B90
	ldr r1, [r4, #0x28]
	adds r0, r4, #0
	add r2, sp, #0xb0
	bl ov07_022216A8
	b _02220C5E
_02220B80:
	add r2, sp, #0xb0
	bl ov07_02220938
	adds r0, r4, #0
	add r1, sp, #0xb0
	bl ov07_02221734
	b _02220C5E
_02220B90:
	add r2, sp, #0xb0
	bl ov07_022208F8
	adds r0, r4, #0
	add r1, sp, #0xb0
	bl ov07_02221734
	b _02220C5E
_02220BA0:
	ldr r0, _02220C94 @ =0x00002CE0
	str r0, [sp, #0xb0]
	movs r0, #0
	str r0, [sp, #0xb4]
	str r0, [sp, #0xb8]
	b _02220C5E
_02220BAC:
	ldr r0, _02220C98 @ =0xFFFFEC78
	str r0, [sp, #0xb0]
	ldr r0, _02220C9C @ =0xFFFFE890
	str r0, [sp, #0xb4]
	movs r0, #0
	str r0, [sp, #0xb8]
	b _02220C5E
_02220BBA:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231B90
	b _02220C5E
_02220BC6:
	ldr r6, _02220CA0 @ =0x022354E0
	add r3, sp, #0x70
	movs r2, #6
_02220BCC:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02220BCC
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	bl ov07_02231924
	lsls r1, r0, #3
	add r0, sp, #0x70
	ldr r0, [r0, r1]
	str r0, [sp, #0xb0]
	add r0, sp, #0x74
	ldr r0, [r0, r1]
	str r0, [sp, #0xb4]
	movs r0, #0
	str r0, [sp, #0xb8]
	b _02220C5E
_02220BF0:
	ldr r6, _02220CA4 @ =0x02235578
	add r3, sp, #0x38
	movs r2, #7
_02220BF6:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02220BF6
	ldr r0, [r4]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220C0C
	movs r0, #6
	b _02220C14
_02220C0C:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	bl ov07_02231924
_02220C14:
	lsls r1, r0, #3
	add r0, sp, #0x38
	ldr r0, [r0, r1]
	str r0, [sp, #0xb0]
	add r0, sp, #0x3c
	ldr r0, [r0, r1]
	str r0, [sp, #0xb4]
	movs r0, #0
	str r0, [sp, #0xb8]
	b _02220C5E
_02220C28:
	ldr r6, _02220CA8 @ =0x02235540
	add r3, sp, #0
	movs r2, #7
_02220C2E:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02220C2E
	ldr r0, [r4]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220C44
	movs r0, #6
	b _02220C4C
_02220C44:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	bl ov07_02231924
_02220C4C:
	lsls r1, r0, #3
	add r0, sp, #0
	ldr r0, [r0, r1]
	str r0, [sp, #0xb0]
	add r0, sp, #4
	ldr r0, [r0, r1]
	str r0, [sp, #0xb4]
	movs r0, #0
	str r0, [sp, #0xb8]
_02220C5E:
	add r2, sp, #0xb0
	ldm r2!, {r0, r1}
	adds r4, #0x2c
	stm r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0xb0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0xb4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0xb8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, r1, r0
	str r0, [r5, #0x30]
	add sp, #0xbc
	pop {r3, r4, r5, r6, pc}
	nop
_02220C94: .4byte 0x00002CE0
_02220C98: .4byte 0xFFFFEC78
_02220C9C: .4byte 0xFFFFE890
_02220CA0: .4byte 0x022354E0
_02220CA4: .4byte 0x02235578
_02220CA8: .4byte 0x02235540
	thumb_func_end ov07_02220978

	thumb_func_start ov07_02220CAC
ov07_02220CAC: @ 0x02220CAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x148
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r1]
	ldr r1, [r1, #0x24]
	bl ov07_02231924
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x28]
	bl ov07_02231924
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x18]
	cmp r0, #0x1a
	bls _02220CD6
	b _022214D0
_02220CD6:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02220CE2: @ jump table
	.2byte _02220D18 - _02220CE2 - 2 @ case 0
	.2byte _02220D24 - _02220CE2 - 2 @ case 1
	.2byte _02220D24 - _02220CE2 - 2 @ case 2
	.2byte _0222143A - _02220CE2 - 2 @ case 3
	.2byte _02220D8C - _02220CE2 - 2 @ case 4
	.2byte _02220E46 - _02220CE2 - 2 @ case 5
	.2byte _02221178 - _02220CE2 - 2 @ case 6
	.2byte _02221178 - _02220CE2 - 2 @ case 7
	.2byte _02220F00 - _02220CE2 - 2 @ case 8
	.2byte _02220F00 - _02220CE2 - 2 @ case 9
	.2byte _02220F68 - _02220CE2 - 2 @ case 10
	.2byte _02220F68 - _02220CE2 - 2 @ case 11
	.2byte _02220FB6 - _02220CE2 - 2 @ case 12
	.2byte _02220FB6 - _02220CE2 - 2 @ case 13
	.2byte _02220FFE - _02220CE2 - 2 @ case 14
	.2byte _02220FFE - _02220CE2 - 2 @ case 15
	.2byte _02221046 - _02220CE2 - 2 @ case 16
	.2byte _02221046 - _02220CE2 - 2 @ case 17
	.2byte _022210E8 - _02220CE2 - 2 @ case 18
	.2byte _022210E8 - _02220CE2 - 2 @ case 19
	.2byte _02221130 - _02220CE2 - 2 @ case 20
	.2byte _02221130 - _02220CE2 - 2 @ case 21
	.2byte _0222144E - _02220CE2 - 2 @ case 22
	.2byte _022214D0 - _02220CE2 - 2 @ case 23
	.2byte _022214A2 - _02220CE2 - 2 @ case 24
	.2byte _0222145E - _02220CE2 - 2 @ case 25
	.2byte _02221470 - _02220CE2 - 2 @ case 26
_02220D18:
	movs r1, #0
	add r0, sp, #0x20
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	b _022214D0
_02220D24:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220D5E
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x10]
	cmp r0, #2
	add r0, sp, #0x20
	bne _02220D4C
	ldr r1, _02221080 @ =0xFFFFF2F8
	strh r1, [r0]
	movs r1, #0x73
	lsls r1, r1, #4
	strh r1, [r0, #2]
	movs r1, #0x2e
	lsls r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02220D4C:
	movs r1, #0x92
	lsls r1, r1, #4
	strh r1, [r0]
	ldr r1, _02221084 @ =0xFFFFFA60
	strh r1, [r0, #2]
	movs r1, #0x2e
	lsls r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02220D5E:
	ldr r0, [sp, #0x14]
	movs r1, #0xc
	muls r1, r0, r1
	ldr r2, [sp, #0x18]
	movs r0, #0x48
	muls r0, r2, r0
	ldr r2, _02221088 @ =0x02235CE0
	adds r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _0222108C @ =0x02235CE4
	adds r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221090 @ =0x02235CE8
	adds r0, r3, r0
	ldr r1, [r1, r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220D8C:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220DC8
	ldr r0, [sp, #0x14]
	movs r1, #0xc
	muls r1, r0, r1
	ldr r2, [sp, #0x18]
	movs r0, #0x48
	muls r0, r2, r0
	ldr r2, _02221088 @ =0x02235CE0
	adds r2, r2, r0
	ldr r2, [r1, r2]
	rsbs r3, r2, #0
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _0222108C @ =0x02235CE4
	adds r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221090 @ =0x02235CE8
	adds r0, r3, r0
	ldr r1, [r1, r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220DC8:
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x24]
	bl ov07_0223192C
	adds r4, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x28]
	bl ov07_0223192C
	cmp r4, r0
	bne _02220E14
	ldr r0, [sp, #0x14]
	movs r1, #0xc
	muls r1, r0, r1
	ldr r2, [sp, #0x18]
	movs r0, #0x48
	muls r0, r2, r0
	ldr r2, _02221088 @ =0x02235CE0
	adds r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _0222108C @ =0x02235CE4
	adds r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221090 @ =0x02235CE8
	adds r0, r3, r0
	ldr r1, [r1, r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220E14:
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x24]
	bl ov07_0223192C
	cmp r0, #3
	add r0, sp, #0x20
	bne _02220E38
	movs r1, #0x3b
	lsls r1, r1, #6
	strh r1, [r0]
	movs r1, #0x21
	lsls r1, r1, #6
	strh r1, [r0, #2]
	ldr r1, _02221094 @ =0x000005FC
	strh r1, [r0, #4]
	b _022214D0
_02220E38:
	ldr r1, _02221098 @ =0xFFFFEF7C
	strh r1, [r0]
	ldr r1, _0222109C @ =0xFFFFF558
	strh r1, [r0, #2]
	ldr r1, _02221094 @ =0x000005FC
	strh r1, [r0, #4]
	b _022214D0
_02220E46:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220E82
	ldr r0, [sp, #0x14]
	movs r1, #0xc
	muls r1, r0, r1
	ldr r2, [sp, #0x18]
	movs r0, #0x48
	muls r0, r2, r0
	ldr r2, _02221088 @ =0x02235CE0
	adds r2, r2, r0
	ldr r2, [r1, r2]
	rsbs r3, r2, #0
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _0222108C @ =0x02235CE4
	adds r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221090 @ =0x02235CE8
	adds r0, r3, r0
	ldr r1, [r1, r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220E82:
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x24]
	bl ov07_0223192C
	adds r4, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x28]
	bl ov07_0223192C
	cmp r4, r0
	bne _02220ECE
	ldr r0, [sp, #0x14]
	movs r1, #0xc
	muls r1, r0, r1
	ldr r2, [sp, #0x18]
	movs r0, #0x48
	muls r0, r2, r0
	ldr r2, _02221088 @ =0x02235CE0
	adds r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _0222108C @ =0x02235CE4
	adds r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221090 @ =0x02235CE8
	adds r0, r3, r0
	ldr r1, [r1, r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220ECE:
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x24]
	bl ov07_0223192C
	cmp r0, #3
	add r0, sp, #0x20
	bne _02220EF2
	movs r1, #0x3b
	lsls r1, r1, #6
	strh r1, [r0]
	movs r1, #0x21
	lsls r1, r1, #6
	strh r1, [r0, #2]
	ldr r1, _02221094 @ =0x000005FC
	strh r1, [r0, #4]
	b _022214D0
_02220EF2:
	ldr r1, _02221098 @ =0xFFFFEF7C
	strh r1, [r0]
	ldr r1, _0222109C @ =0xFFFFF558
	strh r1, [r0, #2]
	ldr r1, _02221094 @ =0x000005FC
	strh r1, [r0, #4]
	b _022214D0
_02220F00:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220F3A
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x10]
	cmp r0, #2
	add r0, sp, #0x20
	bne _02220F28
	ldr r1, _022210A0 @ =0xFFFFF6E0
	strh r1, [r0]
	movs r1, #0x5a
	lsls r1, r1, #4
	strh r1, [r0, #2]
	movs r1, #0x2e
	lsls r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02220F28:
	movs r1, #0x92
	lsls r1, r1, #4
	strh r1, [r0]
	ldr r1, _02221084 @ =0xFFFFFA60
	strh r1, [r0, #2]
	movs r1, #0x2e
	lsls r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02220F3A:
	ldr r0, [sp, #0x14]
	movs r1, #0xc
	muls r1, r0, r1
	ldr r2, [sp, #0x18]
	movs r0, #0x48
	muls r0, r2, r0
	ldr r2, _022210A4 @ =0x02235620
	adds r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _022210A8 @ =0x02235624
	adds r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _022210AC @ =0x02235628
	adds r0, r3, r0
	ldr r1, [r1, r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220F68:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220F88
	ldr r1, _022210A0 @ =0xFFFFF6E0
	add r0, sp, #0x20
	strh r1, [r0]
	movs r1, #0x5a
	lsls r1, r1, #4
	strh r1, [r0, #2]
	movs r1, #0x2e
	lsls r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02220F88:
	ldr r0, [sp, #0x14]
	movs r1, #0xc
	muls r1, r0, r1
	ldr r2, [sp, #0x18]
	movs r0, #0x48
	muls r0, r2, r0
	ldr r2, _022210B0 @ =0x022357D0
	adds r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _022210A8 @ =0x02235624
	adds r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _022210AC @ =0x02235628
	adds r0, r3, r0
	ldr r1, [r1, r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220FB6:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220FD6
	ldr r1, _022210B4 @ =0xFFFFF488
	add r0, sp, #0x20
	strh r1, [r0]
	movs r1, #0x5a
	lsls r1, r1, #4
	strh r1, [r0, #2]
	movs r1, #0x2e
	lsls r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02220FD6:
	ldr r0, [sp, #0x14]
	movs r1, #0xc
	muls r1, r0, r1
	ldr r2, [sp, #0x18]
	movs r0, #0x48
	muls r0, r2, r0
	ldr r2, _022210B8 @ =0x02235B30
	adds r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _022210BC @ =0x02235B34
	adds r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _022210C0 @ =0x02235B38
	adds r0, r3, r0
	ldr r0, [r1, r0]
	strh r0, [r2, #4]
	b _022214D0
_02220FFE:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0222101E
	ldr r1, _022210A0 @ =0xFFFFF6E0
	add r0, sp, #0x20
	strh r1, [r0]
	movs r1, #0x5a
	lsls r1, r1, #4
	strh r1, [r0, #2]
	movs r1, #0x2e
	lsls r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_0222101E:
	ldr r0, [sp, #0x14]
	movs r1, #0xc
	muls r1, r0, r1
	ldr r2, [sp, #0x18]
	movs r0, #0x48
	muls r0, r2, r0
	ldr r2, _022210C4 @ =0x02235E90
	adds r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _022210C8 @ =0x02235E94
	adds r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _022210CC @ =0x02235E98
	adds r0, r3, r0
	ldr r0, [r1, r0]
	strh r0, [r2, #4]
	b _022214D0
_02221046:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221066
	ldr r1, _022210A0 @ =0xFFFFF6E0
	add r0, sp, #0x20
	strh r1, [r0]
	movs r1, #0x5a
	lsls r1, r1, #4
	strh r1, [r0, #2]
	movs r1, #0x2e
	lsls r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02221066:
	ldr r0, [sp, #0x14]
	movs r1, #0xc
	muls r1, r0, r1
	ldr r2, [sp, #0x18]
	movs r0, #0x48
	muls r0, r2, r0
	ldr r2, _022210D0 @ =0x02235980
	adds r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _022210D4 @ =0x02235984
	b _022210D8
	.align 2, 0
_02221080: .4byte 0xFFFFF2F8
_02221084: .4byte 0xFFFFFA60
_02221088: .4byte 0x02235CE0
_0222108C: .4byte 0x02235CE4
_02221090: .4byte 0x02235CE8
_02221094: .4byte 0x000005FC
_02221098: .4byte 0xFFFFEF7C
_0222109C: .4byte 0xFFFFF558
_022210A0: .4byte 0xFFFFF6E0
_022210A4: .4byte 0x02235620
_022210A8: .4byte 0x02235624
_022210AC: .4byte 0x02235628
_022210B0: .4byte 0x022357D0
_022210B4: .4byte 0xFFFFF488
_022210B8: .4byte 0x02235B30
_022210BC: .4byte 0x02235B34
_022210C0: .4byte 0x02235B38
_022210C4: .4byte 0x02235E90
_022210C8: .4byte 0x02235E94
_022210CC: .4byte 0x02235E98
_022210D0: .4byte 0x02235980
_022210D4: .4byte 0x02235984
_022210D8:
	adds r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _022213F8 @ =0x02235988
	adds r0, r3, r0
	ldr r0, [r1, r0]
	strh r0, [r2, #4]
	b _022214D0
_022210E8:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221108
	ldr r1, _022213FC @ =0xFFFFF6E0
	add r0, sp, #0x20
	strh r1, [r0]
	movs r1, #0x5a
	lsls r1, r1, #4
	strh r1, [r0, #2]
	movs r1, #0x2e
	lsls r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02221108:
	ldr r0, [sp, #0x14]
	movs r1, #0xc
	muls r1, r0, r1
	ldr r2, [sp, #0x18]
	movs r0, #0x48
	muls r0, r2, r0
	ldr r2, _02221400 @ =0x02236040
	adds r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _02221404 @ =0x02236044
	adds r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221408 @ =0x02236048
	adds r0, r3, r0
	ldr r0, [r1, r0]
	strh r0, [r2, #4]
	b _022214D0
_02221130:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221150
	ldr r1, _0222140C @ =0xFFFFEF10
	add r0, sp, #0x20
	strh r1, [r0]
	movs r1, #0x5a
	lsls r1, r1, #4
	strh r1, [r0, #2]
	movs r1, #0x2e
	lsls r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02221150:
	ldr r0, [sp, #0x14]
	movs r1, #0xc
	muls r1, r0, r1
	ldr r2, [sp, #0x18]
	movs r0, #0x48
	muls r0, r2, r0
	ldr r2, _02221410 @ =0x022361F0
	adds r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _02221414 @ =0x022361F4
	adds r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221418 @ =0x022361F8
	adds r0, r3, r0
	ldr r0, [r1, r0]
	strh r0, [r2, #4]
	b _022214D0
_02221178:
	ldr r4, _0222141C @ =0x022355B0
	add r3, sp, #0xd8
	movs r2, #0xe
_0222117E:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0222117E
	ldr r3, _02221420 @ =0x022354D0
	add r2, sp, #0x58
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	add r1, sp, #0xc8
	movs r0, #0
	str r1, [sp, #0xc]
	add r1, sp, #0xb8
	mov ip, r0
	str r1, [sp, #0x1c]
	add r0, sp, #0xd8
	add r7, sp, #0xa8
	add r6, sp, #0x98
	add r5, sp, #0x88
	add r1, sp, #0x78
	add r2, sp, #0x68
_022211AA:
	ldr r4, [r0]
	ldr r3, [sp, #0xc]
	str r4, [r3]
	ldr r4, [r0, #0x10]
	ldr r3, [sp, #0x1c]
	str r4, [r3]
	ldr r3, [r0, #0x20]
	stm r7!, {r3}
	ldr r3, [r0, #0x30]
	stm r6!, {r3}
	ldr r3, [r0, #0x40]
	stm r5!, {r3}
	ldr r3, [r0, #0x50]
	stm r1!, {r3}
	ldr r3, [r0, #0x60]
	adds r0, r0, #4
	stm r2!, {r3}
	ldr r3, [sp, #0xc]
	adds r3, r3, #4
	str r3, [sp, #0xc]
	ldr r3, [sp, #0x1c]
	adds r3, r3, #4
	str r3, [sp, #0x1c]
	mov r3, ip
	adds r3, r3, #1
	mov ip, r3
	cmp r3, #4
	blt _022211AA
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221226
	movs r0, #0
	str r0, [sp, #8]
	add r0, sp, #0x58
	str r0, [sp, #0x10]
	add r7, sp, #0xc8
	add r6, sp, #0xb8
	add r0, sp, #0xa8
	add r1, sp, #0x98
	add r2, sp, #0x88
	add r3, sp, #0x78
	add r4, sp, #0x68
_02221204:
	ldr r5, [sp, #0x10]
	ldr r5, [r5]
	stm r7!, {r5}
	stm r6!, {r5}
	stm r0!, {r5}
	stm r1!, {r5}
	stm r2!, {r5}
	stm r3!, {r5}
	stm r4!, {r5}
	ldr r5, [sp, #0x10]
	adds r5, r5, #4
	str r5, [sp, #0x10]
	ldr r5, [sp, #8]
	adds r5, r5, #1
	str r5, [sp, #8]
	cmp r5, #4
	blt _02221204
_02221226:
	ldr r0, [sp, #0x18]
	cmp r0, #5
	bhi _02221244
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02221238: @ jump table
	.2byte _02221244 - _02221238 - 2 @ case 0
	.2byte _02221254 - _02221238 - 2 @ case 1
	.2byte _02221280 - _02221238 - 2 @ case 2
	.2byte _022212B8 - _02221238 - 2 @ case 3
	.2byte _02221346 - _02221238 - 2 @ case 4
	.2byte _0222137E - _02221238 - 2 @ case 5
_02221244:
	ldr r1, [sp, #0xc8]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0xcc]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xd0]
	strh r1, [r0, #4]
	b _022214D0
_02221254:
	ldr r0, [sp, #0xd4]
	cmp r0, #1
	bne _0222126A
	ldr r1, [sp, #0xc8]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0xcc]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xd0]
	strh r1, [r0, #4]
	b _022214D0
_0222126A:
	ldr r0, [sp, #0xc8]
	rsbs r1, r0, #0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0xcc]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0xd0]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	b _022214D0
_02221280:
	ldr r0, [sp, #0x14]
	cmp r0, #3
	bne _02221296
	ldr r1, [sp, #0xb8]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0xbc]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xc0]
	strh r1, [r0, #4]
	b _022214D0
_02221296:
	cmp r0, #5
	add r0, sp, #0x20
	bne _022212AA
	ldr r1, [sp, #0x98]
	strh r1, [r0]
	ldr r1, [sp, #0x9c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xa0]
	strh r1, [r0, #4]
	b _022214D0
_022212AA:
	ldr r1, [sp, #0xa8]
	strh r1, [r0]
	ldr r1, [sp, #0xac]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xb0]
	strh r1, [r0, #4]
	b _022214D0
_022212B8:
	ldr r0, [sp, #0x14]
	cmp r0, #2
	bne _022212EA
	ldr r0, [sp, #0xc4]
	cmp r0, #1
	bne _022212D4
	ldr r1, [sp, #0xb8]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0xbc]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xc0]
	strh r1, [r0, #4]
	b _022214D0
_022212D4:
	ldr r0, [sp, #0xb8]
	rsbs r1, r0, #0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0xbc]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0xc0]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	b _022214D0
_022212EA:
	cmp r0, #5
	bne _0222131A
	ldr r0, [sp, #0xb4]
	cmp r0, #1
	bne _0222130A
	ldr r0, [sp, #0x88]
	rsbs r1, r0, #0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x8c]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0x90]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	b _022214D0
_0222130A:
	ldr r1, [sp, #0x88]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x8c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x90]
	strh r1, [r0, #4]
	b _022214D0
_0222131A:
	ldr r0, [sp, #0x84]
	cmp r0, #1
	bne _02221330
	ldr r1, [sp, #0x78]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x7c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x80]
	strh r1, [r0, #4]
	b _022214D0
_02221330:
	ldr r0, [sp, #0x78]
	rsbs r1, r0, #0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x7c]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0x80]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	b _022214D0
_02221346:
	ldr r0, [sp, #0x14]
	cmp r0, #3
	bne _0222135C
	ldr r1, [sp, #0x78]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x7c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x80]
	strh r1, [r0, #4]
	b _022214D0
_0222135C:
	cmp r0, #5
	add r0, sp, #0x20
	bne _02221370
	ldr r1, [sp, #0x68]
	strh r1, [r0]
	ldr r1, [sp, #0x6c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x70]
	strh r1, [r0, #4]
	b _022214D0
_02221370:
	ldr r1, [sp, #0x88]
	strh r1, [r0]
	ldr r1, [sp, #0x8c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x90]
	strh r1, [r0, #4]
	b _022214D0
_0222137E:
	ldr r0, [sp, #0x14]
	cmp r0, #3
	bne _022213B0
	ldr r0, [sp, #0xc4]
	cmp r0, #1
	bne _0222139A
	ldr r1, [sp, #0x88]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x8c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x90]
	strh r1, [r0, #4]
	b _022214D0
_0222139A:
	ldr r0, [sp, #0x88]
	rsbs r1, r0, #0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x8c]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0x90]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	b _022214D0
_022213B0:
	cmp r0, #2
	bne _022213E0
	ldr r0, [sp, #0xc4]
	cmp r0, #1
	bne _022213CA
	ldr r1, [sp, #0x98]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x9c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xa0]
	strh r1, [r0, #4]
	b _022214D0
_022213CA:
	ldr r0, [sp, #0x98]
	rsbs r1, r0, #0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x9c]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0xa0]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	b _022214D0
_022213E0:
	ldr r0, [sp, #0xc4]
	cmp r0, #1
	bne _02221424
	ldr r1, [sp, #0x68]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x6c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x70]
	strh r1, [r0, #4]
	b _022214D0
	nop
_022213F8: .4byte 0x02235988
_022213FC: .4byte 0xFFFFF6E0
_02221400: .4byte 0x02236040
_02221404: .4byte 0x02236044
_02221408: .4byte 0x02236048
_0222140C: .4byte 0xFFFFEF10
_02221410: .4byte 0x022361F0
_02221414: .4byte 0x022361F4
_02221418: .4byte 0x022361F8
_0222141C: .4byte 0x022355B0
_02221420: .4byte 0x022354D0
_02221424:
	ldr r0, [sp, #0x68]
	rsbs r1, r0, #0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x6c]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldr r1, [sp, #0x70]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	b _022214D0
_0222143A:
	ldr r1, _022214F0 @ =0xFFFFFCE0
	add r0, sp, #0x20
	strh r1, [r0]
	movs r1, #0x4b
	lsls r1, r1, #4
	strh r1, [r0, #2]
	movs r1, #0x7d
	lsls r1, r1, #2
	strh r1, [r0, #4]
	b _022214D0
_0222144E:
	ldr r1, _022214F4 @ =0xFFFFF2AE
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, _022214F8 @ =0xFFFFF5AC
	strh r1, [r0, #2]
	movs r1, #0
	strh r1, [r0, #4]
	b _022214D0
_0222145E:
	ldr r1, _022214FC @ =0xFFFFF290
	add r0, sp, #0x20
	strh r1, [r0]
	movs r1, #0x7a
	lsls r1, r1, #4
	strh r1, [r0, #2]
	movs r1, #0
	strh r1, [r0, #4]
	b _022214D0
_02221470:
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x24]
	bl ov07_0223192C
	cmp r0, #3
	add r0, sp, #0x20
	bne _02221494
	movs r1, #0x3b
	lsls r1, r1, #6
	strh r1, [r0]
	movs r1, #0x21
	lsls r1, r1, #6
	strh r1, [r0, #2]
	movs r1, #0
	strh r1, [r0, #4]
	b _022214D0
_02221494:
	ldr r1, _02221500 @ =0xFFFFE890
	strh r1, [r0]
	ldr r1, _02221504 @ =0xFFFFF768
	strh r1, [r0, #2]
	movs r1, #0
	strh r1, [r0, #4]
	b _022214D0
_022214A2:
	ldr r4, _02221508 @ =0x02235510
	add r3, sp, #0x28
	movs r2, #6
_022214A8:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _022214A8
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x24]
	bl ov07_02231924
	lsls r2, r0, #3
	add r0, sp, #0x28
	ldr r1, [r0, r2]
	add r0, sp, #0x20
	strh r1, [r0]
	add r1, sp, #0x2c
	ldr r1, [r1, r2]
	strh r1, [r0, #2]
	movs r1, #0
	strh r1, [r0, #4]
_022214D0:
	add r1, sp, #0x20
	ldr r0, [sp]
	ldrh r2, [r1]
	adds r0, #0x50
	strh r2, [r0]
	ldr r0, [sp]
	ldrh r2, [r1, #2]
	adds r0, #0x52
	strh r2, [r0]
	ldr r0, [sp]
	ldrh r1, [r1, #4]
	adds r0, #0x54
	str r0, [sp]
	strh r1, [r0]
	add sp, #0x148
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022214F0: .4byte 0xFFFFFCE0
_022214F4: .4byte 0xFFFFF2AE
_022214F8: .4byte 0xFFFFF5AC
_022214FC: .4byte 0xFFFFF290
_02221500: .4byte 0xFFFFE890
_02221504: .4byte 0xFFFFF768
_02221508: .4byte 0x02235510
	thumb_func_end ov07_02220CAC

	thumb_func_start ov07_0222150C
ov07_0222150C: @ 0x0222150C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	bl ov07_02221CB4
	adds r6, r0, #0
	movs r4, #0
	cmp r6, #0
	ble _0222153C
_0222151E:
	adds r0, r4, #0
	bl ov07_02221C8C
	ldr r1, [r5, #0x1c]
	ands r1, r0
	cmp r0, r1
	bne _02221536
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov07_02221C74
_02221536:
	adds r4, r4, #1
	cmp r4, r6
	blt _0222151E
_0222153C:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0222150C

	thumb_func_start ov07_02221540
ov07_02221540: @ 0x02221540
	adds r3, r0, #0
	adds r2, r1, #0
	adds r1, r3, #0
	ldr r3, _0222154C @ =ov07_02221EEC
	ldr r0, [r2, #0x20]
	bx r3
	.align 2, 0
_0222154C: .4byte ov07_02221EEC
	thumb_func_end ov07_02221540

	thumb_func_start ov07_02221550
ov07_02221550: @ 0x02221550
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r6, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	bl ov07_02231924
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	bl ov07_02231924
	ldr r1, [r4, #0xc]
	cmp r1, #3
	bhi _02221598
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02221578: @ jump table
	.2byte _02221598 - _02221578 - 2 @ case 0
	.2byte _02221580 - _02221578 - 2 @ case 1
	.2byte _0222158E - _02221578 - 2 @ case 2
	.2byte _02221598 - _02221578 - 2 @ case 3
_02221580:
	cmp r0, #0
	bne _0222158A
	movs r5, #1
	lsls r5, r5, #8
	b _02221598
_0222158A:
	ldr r5, _022215AC @ =0xFFFFEC00
	b _02221598
_0222158E:
	cmp r0, #0
	bne _02221596
	movs r5, #0
	b _02221598
_02221596:
	ldr r5, _022215B0 @ =0xFFFFEB00
_02221598:
	ldr r0, [r4, #4]
	bl FUN_02015530
	ldr r0, [r6, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, r5, r0
	str r0, [r6, #0x30]
	pop {r4, r5, r6, pc}
	nop
_022215AC: .4byte 0xFFFFEC00
_022215B0: .4byte 0xFFFFEB00
	thumb_func_end ov07_02221550

	thumb_func_start ov07_022215B4
ov07_022215B4: @ 0x022215B4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl FUN_02015504
	adds r5, r0, #0
	bl ov07_0221BFD0
	movs r1, #0x38
	bl FUN_0201AA8C
	adds r4, r0, #0
	str r5, [r4]
	adds r0, r5, #0
	bl ov07_0221C478
	str r0, [r4, #4]
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0xc
	movs r2, #6
	bl ov07_0221F9A8
	ldr r0, [r4, #0x10]
	cmp r0, #4
	bhi _022215FC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022215F2: @ jump table
	.2byte _022215FC - _022215F2 - 2 @ case 0
	.2byte _0222160E - _022215F2 - 2 @ case 1
	.2byte _02221620 - _022215F2 - 2 @ case 2
	.2byte _02221632 - _022215F2 - 2 @ case 3
	.2byte _02221644 - _022215F2 - 2 @ case 4
_022215FC:
	ldr r0, [r4]
	bl ov07_0221C468
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bl ov07_0221C470
	str r0, [r4, #0x28]
	b _02221654
_0222160E:
	ldr r0, [r4]
	bl ov07_0221C470
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bl ov07_0221C468
	str r0, [r4, #0x28]
	b _02221654
_02221620:
	ldr r0, [r4]
	bl ov07_0221C468
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bl ov07_0221C470
	str r0, [r4, #0x28]
	b _02221654
_02221632:
	ldr r0, [r4]
	bl ov07_0221C470
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bl ov07_0221C468
	str r0, [r4, #0x28]
	b _02221654
_02221644:
	ldr r0, [r4]
	bl ov07_0221C468
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bl ov07_0221C470
	str r0, [r4, #0x28]
_02221654:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov07_022208B4
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_022215B4

	thumb_func_start ov07_02221664
ov07_02221664: @ 0x02221664
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6]
	ldr r1, [r6, #0x24]
	movs r4, #1
	bl ov07_02231924
	adds r5, r0, #0
	ldr r0, [r6]
	ldr r1, [r6, #0x28]
	bl ov07_02231924
	cmp r5, #5
	bhi _022216A2
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222168C: @ jump table
	.2byte _022216A2 - _0222168C - 2 @ case 0
	.2byte _02221698 - _0222168C - 2 @ case 1
	.2byte _022216A2 - _0222168C - 2 @ case 2
	.2byte _0222169C - _0222168C - 2 @ case 3
	.2byte _022216A2 - _0222168C - 2 @ case 4
	.2byte _022216A0 - _0222168C - 2 @ case 5
_02221698:
	subs r4, r4, #2
	b _022216A2
_0222169C:
	subs r4, r4, #2
	b _022216A2
_022216A0:
	subs r4, r4, #2
_022216A2:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_02221664

	thumb_func_start ov07_022216A8
ov07_022216A8: @ 0x022216A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	add r0, sp, #0x20
	movs r4, #0
	str r4, [r0]
	str r4, [r0, #4]
	adds r6, r1, #0
	adds r7, r2, #0
	str r4, [r0, #8]
_022216BC:
	ldr r0, [r5]
	adds r1, r6, #0
	bl ov07_02231924
	cmp r4, r0
	ldr r0, [r5]
	bne _022216D4
	add r1, sp, #0x10
	movs r2, #4
	bl ov07_0221F9A8
	b _022216DC
_022216D4:
	add r1, sp, #0
	movs r2, #4
	bl ov07_0221F9A8
_022216DC:
	adds r4, r4, #1
	cmp r4, #6
	blt _022216BC
	adds r0, r5, #0
	bl ov07_02221664
	strb r0, [r5, #8]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _02221700
	movs r0, #1
	strb r0, [r5, #8]
_02221700:
	movs r1, #8
	ldrsb r0, [r5, r1]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	muls r0, r2, r0
	str r0, [sp, #0x20]
	ldrsb r2, [r5, r1]
	muls r2, r3, r2
	str r2, [sp, #0x24]
	ldrsb r1, [r5, r1]
	ldr r2, [sp, #0x28]
	muls r1, r2, r1
	str r1, [sp, #0x28]
	ldr r1, [r7]
	adds r0, r1, r0
	str r0, [r7]
	ldr r1, [r7, #4]
	ldr r0, [sp, #0x24]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #8]
	ldr r0, [sp, #0x28]
	adds r0, r1, r0
	str r0, [r7, #8]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_022216A8

	thumb_func_start ov07_02221734
ov07_02221734: @ 0x02221734
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r4, r1, #0
	add r1, sp, #0
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r5]
	add r1, sp, #0xc
	movs r2, #4
	bl ov07_0221F9A8
	adds r0, r5, #0
	bl ov07_02221664
	strb r0, [r5, #8]
	ldr r0, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _0222176E
	movs r0, #1
	strb r0, [r5, #8]
_0222176E:
	movs r1, #8
	ldrsb r0, [r5, r1]
	ldr r2, [sp]
	ldr r3, [sp, #4]
	muls r0, r2, r0
	str r0, [sp]
	ldrsb r2, [r5, r1]
	muls r2, r3, r2
	str r2, [sp, #4]
	ldrsb r1, [r5, r1]
	ldr r2, [sp, #8]
	muls r1, r2, r1
	str r1, [sp, #8]
	ldr r1, [r4]
	adds r0, r1, r0
	str r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [sp, #4]
	adds r0, r1, r0
	str r0, [r4, #4]
	ldr r1, [r4, #8]
	ldr r0, [sp, #8]
	adds r0, r1, r0
	str r0, [r4, #8]
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02221734

	thumb_func_start ov07_022217A4
ov07_022217A4: @ 0x022217A4
	ldr r3, _022217AC @ =ov07_0221F9A8
	ldr r0, [r0]
	movs r2, #5
	bx r3
	.align 2, 0
_022217AC: .4byte ov07_0221F9A8
	thumb_func_end ov07_022217A4

	thumb_func_start ov07_022217B0
ov07_022217B0: @ 0x022217B0
	movs r0, #1
	bx lr
	thumb_func_end ov07_022217B0

	thumb_func_start ov07_022217B4
ov07_022217B4: @ 0x022217B4
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r4, r1, #0
	add r1, sp, #0
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	adds r0, r4, #0
	add r1, sp, #8
	bl ov07_022217A4
	adds r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _022217E0
	movs r0, #1
	strb r0, [r4, #8]
_022217E0:
	ldr r0, [sp, #8]
	cmp r0, #3
	bgt _022217FE
	cmp r0, #0
	blt _0222186A
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022217F6: @ jump table
	.2byte _02221802 - _022217F6 - 2 @ case 0
	.2byte _0222182E - _022217F6 - 2 @ case 1
	.2byte _0222186A - _022217F6 - 2 @ case 2
	.2byte _0222186A - _022217F6 - 2 @ case 3
_022217FE:
	cmp r0, #0xff
	b _0222186A
_02221802:
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_0201560C
	add r2, sp, #0
	movs r0, #0
	movs r1, #8
	ldrsh r3, [r2, r0]
	ldrsb r0, [r4, r1]
	muls r0, r3, r0
	strh r0, [r2]
	movs r0, #2
	ldrsh r3, [r2, r0]
	ldrsb r0, [r4, r1]
	muls r0, r3, r0
	strh r0, [r2, #2]
	movs r0, #4
	ldrsh r3, [r2, r0]
	ldrsb r0, [r4, r1]
	muls r0, r3, r0
	strh r0, [r2, #4]
	b _0222186A
_0222182E:
	ldr r0, [sp, #0x10]
	add r2, sp, #0
	strh r0, [r2]
	ldr r0, [sp, #0x14]
	movs r1, #8
	strh r0, [r2, #2]
	ldr r0, [sp, #0x18]
	strh r0, [r2, #4]
	movs r0, #0
	ldrsh r3, [r2, r0]
	ldrsb r0, [r4, r1]
	muls r0, r3, r0
	strh r0, [r2]
	movs r0, #2
	ldrsh r3, [r2, r0]
	ldrsb r0, [r4, r1]
	muls r0, r3, r0
	strh r0, [r2, #2]
	movs r0, #4
	ldrsh r3, [r2, r0]
	ldrsb r0, [r4, r1]
	add r1, sp, #0
	muls r0, r3, r0
	strh r0, [r2, #4]
	adds r0, r5, #0
	bl FUN_0201560C
	add sp, #0x1c
	movs r0, #1
	pop {r4, r5, pc}
_0222186A:
	add r1, sp, #0
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldr r0, [r4, #0x2c]
	subs r0, r2, r0
	strh r0, [r1]
	movs r0, #2
	ldrsh r2, [r1, r0]
	ldr r0, [r4, #0x30]
	subs r0, r2, r0
	strh r0, [r1, #2]
	movs r0, #4
	ldrsh r2, [r1, r0]
	ldr r0, [r4, #0x34]
	subs r0, r2, r0
	strh r0, [r1, #4]
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_0201560C
	movs r0, #1
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov07_022217B4

	thumb_func_start ov07_02221898
ov07_02221898: @ 0x02221898
	movs r0, #1
	bx lr
	thumb_func_end ov07_02221898

	thumb_func_start ov07_0222189C
ov07_0222189C: @ 0x0222189C
	movs r0, #1
	bx lr
	thumb_func_end ov07_0222189C

	thumb_func_start ov07_022218A0
ov07_022218A0: @ 0x022218A0
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r4, r1, #0
	add r1, sp, #0
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	adds r0, r4, #0
	add r1, sp, #0xc
	bl ov07_022217A4
	adds r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _022218CC
	movs r0, #1
	strb r0, [r4, #8]
_022218CC:
	ldr r0, [sp, #0xc]
	cmp r0, #3
	bgt _022218EA
	cmp r0, #0
	blt _0222194A
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022218E2: @ jump table
	.2byte _022218EE - _022218E2 - 2 @ case 0
	.2byte _02221912 - _022218E2 - 2 @ case 1
	.2byte _02221934 - _022218E2 - 2 @ case 2
	.2byte _02221940 - _022218E2 - 2 @ case 3
_022218EA:
	cmp r0, #0xff
	b _0222194A
_022218EE:
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_02015640
	movs r0, #8
	ldrsb r1, [r4, r0]
	ldr r2, [sp]
	muls r1, r2, r1
	str r1, [sp]
	ldrsb r1, [r4, r0]
	ldr r2, [sp, #4]
	muls r1, r2, r1
	str r1, [sp, #4]
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #8]
	muls r0, r1, r0
	str r0, [sp, #8]
	b _0222194A
_02221912:
	ldr r2, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r2, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #8
	ldrsb r6, [r4, r3]
	muls r6, r2, r6
	str r6, [sp]
	ldrsb r2, [r4, r3]
	muls r2, r1, r2
	str r2, [sp, #4]
	ldrsb r1, [r4, r3]
	muls r1, r0, r1
	str r1, [sp, #8]
	b _0222194A
_02221934:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0
	bl ov07_02231B90
	b _0222194A
_02221940:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0
	bl ov07_02231B90
_0222194A:
	ldr r1, [sp]
	ldr r0, [r4, #0x2c]
	subs r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x30]
	subs r0, r1, r0
	str r0, [sp, #4]
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_02015628
	movs r0, #1
	add sp, #0x20
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_022218A0

	thumb_func_start ov07_02221968
ov07_02221968: @ 0x02221968
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0
	add r0, sp, #0
	strh r1, [r0]
	adds r0, r4, #0
	add r1, sp, #4
	bl ov07_022217A4
	adds r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _02221990
	movs r0, #1
	strb r0, [r4, #8]
_02221990:
	ldr r0, [sp, #4]
	cmp r0, #3
	bgt _022219AE
	cmp r0, #0
	blt _022219DC
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022219A6: @ jump table
	.2byte _022219B2 - _022219A6 - 2 @ case 0
	.2byte _022219CA - _022219A6 - 2 @ case 1
	.2byte _022219DC - _022219A6 - 2 @ case 2
	.2byte _022219DC - _022219A6 - 2 @ case 3
_022219AE:
	cmp r0, #0xff
	b _022219DC
_022219B2:
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_0201568C
	add r1, sp, #0
	movs r0, #0
	ldrsh r2, [r1, r0]
	movs r0, #8
	ldrsb r0, [r4, r0]
	muls r0, r2, r0
	strh r0, [r1]
	b _022219DC
_022219CA:
	ldr r0, [sp, #0xc]
	add r1, sp, #0
	strh r0, [r1]
	movs r0, #0
	ldrsh r2, [r1, r0]
	movs r0, #8
	ldrsb r0, [r4, r0]
	muls r0, r2, r0
	strh r0, [r1]
_022219DC:
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_02015674
	movs r0, #1
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02221968

	thumb_func_start ov07_022219EC
ov07_022219EC: @ 0x022219EC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0
	add r0, sp, #0
	strh r1, [r0]
	adds r0, r4, #0
	add r1, sp, #4
	bl ov07_022217A4
	adds r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _02221A14
	movs r0, #1
	strb r0, [r4, #8]
_02221A14:
	ldr r0, [sp, #4]
	cmp r0, #3
	bgt _02221A32
	cmp r0, #0
	blt _02221A5C
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02221A2A: @ jump table
	.2byte _02221A36 - _02221A2A - 2 @ case 0
	.2byte _02221A4C - _02221A2A - 2 @ case 1
	.2byte _02221A5C - _02221A2A - 2 @ case 2
	.2byte _02221A5C - _02221A2A - 2 @ case 3
_02221A32:
	cmp r0, #0xff
	b _02221A5C
_02221A36:
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_020156BC
	add r1, sp, #0
	movs r0, #8
	ldrh r2, [r1]
	ldrsb r0, [r4, r0]
	muls r0, r2, r0
	strh r0, [r1]
	b _02221A5C
_02221A4C:
	ldr r0, [sp, #0xc]
	add r1, sp, #0
	strh r0, [r1]
	movs r0, #8
	ldrh r2, [r1]
	ldrsb r0, [r4, r0]
	muls r0, r2, r0
	strh r0, [r1]
_02221A5C:
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_020156A8
	movs r0, #1
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_022219EC

	thumb_func_start ov07_02221A6C
ov07_02221A6C: @ 0x02221A6C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0
	add r0, sp, #0
	strh r1, [r0]
	adds r0, r4, #0
	add r1, sp, #4
	bl ov07_022217A4
	adds r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _02221A94
	movs r0, #1
	strb r0, [r4, #8]
_02221A94:
	ldr r1, [sp, #4]
	cmp r1, #3
	bgt _02221AB2
	cmp r1, #0
	blt _02221AC6
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02221AAA: @ jump table
	.2byte _02221AB6 - _02221AAA - 2 @ case 0
	.2byte _02221AC0 - _02221AAA - 2 @ case 1
	.2byte _02221AC6 - _02221AAA - 2 @ case 2
	.2byte _02221AC6 - _02221AAA - 2 @ case 3
_02221AB2:
	cmp r1, #0xff
	b _02221AC6
_02221AB6:
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_020156EC
	b _02221AC6
_02221AC0:
	ldr r1, [sp, #0xc]
	add r0, sp, #0
	strh r1, [r0]
_02221AC6:
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_020156D8
	movs r0, #1
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02221A6C

	thumb_func_start ov07_02221AD4
ov07_02221AD4: @ 0x02221AD4
	movs r0, #1
	bx lr
	thumb_func_end ov07_02221AD4

	thumb_func_start ov07_02221AD8
ov07_02221AD8: @ 0x02221AD8
	movs r0, #1
	bx lr
	thumb_func_end ov07_02221AD8

	thumb_func_start ov07_02221ADC
ov07_02221ADC: @ 0x02221ADC
	movs r0, #1
	bx lr
	thumb_func_end ov07_02221ADC

	thumb_func_start ov07_02221AE0
ov07_02221AE0: @ 0x02221AE0
	movs r0, #1
	bx lr
	thumb_func_end ov07_02221AE0

	thumb_func_start ov07_02221AE4
ov07_02221AE4: @ 0x02221AE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r7, r0, #0
	adds r4, r1, #0
	add r1, sp, #0
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	adds r0, r4, #0
	add r1, sp, #0xc
	bl ov07_022217A4
	adds r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _02221B10
	movs r0, #1
	strb r0, [r4, #8]
_02221B10:
	ldr r0, [sp, #0xc]
	cmp r0, #4
	bgt _02221B30
	cmp r0, #0
	blt _02221BCA
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02221B26: @ jump table
	.2byte _02221B34 - _02221B26 - 2 @ case 0
	.2byte _02221B58 - _02221B26 - 2 @ case 1
	.2byte _02221BB4 - _02221B26 - 2 @ case 2
	.2byte _02221BC0 - _02221B26 - 2 @ case 3
	.2byte _02221B7A - _02221B26 - 2 @ case 4
_02221B30:
	cmp r0, #0xff
	b _02221BCA
_02221B34:
	adds r0, r7, #0
	add r1, sp, #0
	bl FUN_02015720
	movs r0, #8
	ldrsb r1, [r4, r0]
	ldr r2, [sp]
	muls r1, r2, r1
	str r1, [sp]
	ldrsb r1, [r4, r0]
	ldr r2, [sp, #4]
	muls r1, r2, r1
	str r1, [sp, #4]
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #8]
	muls r0, r1, r0
	str r0, [sp, #8]
	b _02221BCA
_02221B58:
	ldr r2, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r2, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #8
	ldrsb r5, [r4, r3]
	muls r5, r2, r5
	str r5, [sp]
	ldrsb r2, [r4, r3]
	muls r2, r1, r2
	str r2, [sp, #4]
	ldrsb r1, [r4, r3]
	muls r1, r0, r1
	str r1, [sp, #8]
	b _02221BCA
_02221B7A:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0
	bl ov07_02231B90
	ldr r1, [sp]
	ldr r5, [sp, #0x14]
	adds r0, r1, #0
	ldr r6, [sp, #0x18]
	muls r0, r5, r0
	adds r1, r6, #0
	blx FUN_020F2998
	ldr r1, [sp, #4]
	str r0, [sp]
	adds r0, r1, #0
	muls r0, r5, r0
	adds r1, r6, #0
	blx FUN_020F2998
	ldr r1, [sp, #8]
	str r0, [sp, #4]
	adds r0, r1, #0
	muls r0, r5, r0
	adds r1, r6, #0
	blx FUN_020F2998
	str r0, [sp, #8]
	b _02221BCA
_02221BB4:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0
	bl ov07_02231B90
	b _02221BCA
_02221BC0:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0
	bl ov07_02231B90
_02221BCA:
	ldr r1, [sp]
	ldr r0, [r4, #0x2c]
	subs r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x30]
	subs r0, r1, r0
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x34]
	subs r0, r1, r0
	str r0, [sp, #8]
	adds r0, r7, #0
	add r1, sp, #0
	bl FUN_02015708
	movs r0, #1
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02221AE4

	thumb_func_start ov07_02221BF0
ov07_02221BF0: @ 0x02221BF0
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0
	add r0, sp, #0
	strh r1, [r0]
	adds r0, r4, #0
	add r1, sp, #4
	bl ov07_022217A4
	adds r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _02221C18
	movs r0, #1
	strb r0, [r4, #8]
_02221C18:
	ldr r0, [sp, #4]
	cmp r0, #3
	bgt _02221C36
	cmp r0, #0
	blt _02221C64
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02221C2E: @ jump table
	.2byte _02221C3A - _02221C2E - 2 @ case 0
	.2byte _02221C52 - _02221C2E - 2 @ case 1
	.2byte _02221C64 - _02221C2E - 2 @ case 2
	.2byte _02221C64 - _02221C2E - 2 @ case 3
_02221C36:
	cmp r0, #0xff
	b _02221C64
_02221C3A:
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_0201576C
	add r1, sp, #0
	movs r0, #0
	ldrsh r2, [r1, r0]
	movs r0, #8
	ldrsb r0, [r4, r0]
	muls r0, r2, r0
	strh r0, [r1]
	b _02221C64
_02221C52:
	ldr r0, [sp, #0xc]
	add r1, sp, #0
	strh r0, [r1]
	movs r0, #0
	ldrsh r2, [r1, r0]
	movs r0, #8
	ldrsb r0, [r4, r0]
	muls r0, r2, r0
	strh r0, [r1]
_02221C64:
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_02015754
	movs r0, #1
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02221BF0

	thumb_func_start ov07_02221C74
ov07_02221C74: @ 0x02221C74
	push {r3, lr}
	adds r3, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	ldr r2, _02221C88 @ =0x022363A0
	lsls r3, r3, #2
	ldr r2, [r2, r3]
	blx r2
	pop {r3, pc}
	nop
_02221C88: .4byte 0x022363A0
	thumb_func_end ov07_02221C74

	thumb_func_start ov07_02221C8C
ov07_02221C8C: @ 0x02221C8C
	push {r3, r4, r5}
	sub sp, #0x3c
	ldr r4, _02221CB0 @ =0x022363D8
	adds r5, r0, #0
	add r3, sp, #0
	movs r2, #7
_02221C98:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02221C98
	ldr r0, [r4]
	lsls r1, r5, #2
	str r0, [r3]
	add r0, sp, #0
	ldr r0, [r0, r1]
	add sp, #0x3c
	pop {r3, r4, r5}
	bx lr
	.align 2, 0
_02221CB0: .4byte 0x022363D8
	thumb_func_end ov07_02221C8C

	thumb_func_start ov07_02221CB4
ov07_02221CB4: @ 0x02221CB4
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r6, _02221CDC @ =0x0000FEFE
	adds r5, r4, #0
_02221CBC:
	adds r0, r4, #0
	bl ov07_02221C8C
	adds r4, r4, #1
	cmp r0, r6
	beq _02221CCE
	adds r5, r5, #1
	cmp r5, #0xff
	blt _02221CBC
_02221CCE:
	cmp r5, #0xff
	blt _02221CD6
	movs r0, #0
	pop {r4, r5, r6, pc}
_02221CD6:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_02221CDC: .4byte 0x0000FEFE
	thumb_func_end ov07_02221CB4

	thumb_func_start ov07_02221CE0
ov07_02221CE0: @ 0x02221CE0
	ldr r3, _02221CE8 @ =ov07_0221F9A8
	ldr r0, [r0]
	movs r2, #4
	bx r3
	.align 2, 0
_02221CE8: .4byte ov07_0221F9A8
	thumb_func_end ov07_02221CE0

	thumb_func_start ov07_02221CEC
ov07_02221CEC: @ 0x02221CEC
	push {r3, lr}
	sub sp, #8
	add r2, sp, #0
	movs r0, #0
	strh r0, [r2]
	strh r0, [r2, #2]
	strh r0, [r2, #4]
	strh r0, [r2, #6]
	ldr r0, [r1, #4]
	bl FUN_02015524
	adds r1, r0, #0
	add r0, sp, #0
	bl FUN_02023558
	movs r0, #1
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov07_02221CEC

	thumb_func_start ov07_02221D10
ov07_02221D10: @ 0x02221D10
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	ldr r1, _02221D48 @ =0x02236414
	add r0, sp, #0
	ldrh r2, [r1, #0x20]
	strh r2, [r0]
	ldrh r2, [r1, #0x22]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x24]
	ldrh r1, [r1, #0x26]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldr r0, [r4, #4]
	bl FUN_02015524
	adds r5, r0, #0
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_02015528
	add r0, sp, #0
	adds r1, r5, #0
	bl FUN_02023558
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02221D48: .4byte 0x02236414
	thumb_func_end ov07_02221D10

	thumb_func_start ov07_02221D4C
ov07_02221D4C: @ 0x02221D4C
	push {r4, lr}
	sub sp, #0x18
	adds r4, r1, #0
	add r1, sp, #0
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	adds r0, r4, #0
	add r1, sp, #8
	bl ov07_02221CE0
	ldr r1, [sp, #0xc]
	add r0, sp, #0
	strh r1, [r0]
	ldr r1, [sp, #0x10]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x14]
	strh r1, [r0, #4]
	ldr r0, [r4, #4]
	bl FUN_02015524
	adds r1, r0, #0
	add r0, sp, #0
	bl FUN_02023558
	movs r0, #1
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov07_02221D4C

	thumb_func_start ov07_02221D88
ov07_02221D88: @ 0x02221D88
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	ldr r1, _02221DC0 @ =0x02236414
	add r0, sp, #0
	ldrh r2, [r1, #0x18]
	strh r2, [r0]
	ldrh r2, [r1, #0x1a]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x1c]
	ldrh r1, [r1, #0x1e]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldr r0, [r4, #4]
	bl FUN_02015524
	adds r5, r0, #0
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_02015528
	add r0, sp, #0
	adds r1, r5, #0
	bl FUN_02023558
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02221DC0: .4byte 0x02236414
	thumb_func_end ov07_02221D88

	thumb_func_start ov07_02221DC4
ov07_02221DC4: @ 0x02221DC4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	ldr r1, _02221E20 @ =0x02236414
	add r0, sp, #0
	ldrh r2, [r1, #0x10]
	strh r2, [r0, #8]
	ldrh r2, [r1, #0x12]
	strh r2, [r0, #0xa]
	ldrh r2, [r1, #0x14]
	strh r2, [r0, #0xc]
	ldrh r2, [r1, #0x16]
	strh r2, [r0, #0xe]
	ldrh r2, [r1, #0x28]
	strh r2, [r0]
	ldrh r2, [r1, #0x2a]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x2c]
	strh r2, [r0, #4]
	ldrh r1, [r1, #0x2e]
	strh r1, [r0, #6]
	ldr r0, [r4, #4]
	bl FUN_02015524
	adds r5, r0, #0
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_02015528
	ldr r0, [r4]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221E12
	add r0, sp, #8
	adds r1, r5, #0
	bl FUN_02023558
	b _02221E1A
_02221E12:
	add r0, sp, #0
	adds r1, r5, #0
	bl FUN_02023558
_02221E1A:
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_02221E20: .4byte 0x02236414
	thumb_func_end ov07_02221DC4

	thumb_func_start ov07_02221E24
ov07_02221E24: @ 0x02221E24
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	ldr r1, _02221E5C @ =0x02236414
	add r0, sp, #0
	ldrh r2, [r1]
	strh r2, [r0]
	ldrh r2, [r1, #2]
	strh r2, [r0, #2]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldr r0, [r4, #4]
	bl FUN_02015524
	adds r5, r0, #0
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_02015528
	add r0, sp, #0
	adds r1, r5, #0
	bl FUN_02023558
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02221E5C: .4byte 0x02236414
	thumb_func_end ov07_02221E24

	thumb_func_start ov07_02221E60
ov07_02221E60: @ 0x02221E60
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	ldr r1, _02221E98 @ =0x02236414
	add r0, sp, #0
	ldrh r2, [r1, #8]
	strh r2, [r0]
	ldrh r2, [r1, #0xa]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0xc]
	ldrh r1, [r1, #0xe]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldr r0, [r4, #4]
	bl FUN_02015524
	adds r5, r0, #0
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_02015528
	add r0, sp, #0
	adds r1, r5, #0
	bl FUN_02023558
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02221E98: .4byte 0x02236414
	thumb_func_end ov07_02221E60

	thumb_func_start ov07_02221E9C
ov07_02221E9C: @ 0x02221E9C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r1, #0
	ldr r0, [r5, #4]
	bl FUN_02015524
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r1, [r5, #0x24]
	add r2, sp, #0
	bl ov07_02231D70
	add r0, sp, #0
	adds r1, r4, #0
	bl FUN_0202365C
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02221E9C

	thumb_func_start ov07_02221EC4
ov07_02221EC4: @ 0x02221EC4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r1, #0
	ldr r0, [r5, #4]
	bl FUN_02015524
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r1, [r5, #0x28]
	add r2, sp, #0
	bl ov07_02231D70
	add r0, sp, #0
	adds r1, r4, #0
	bl FUN_0202365C
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02221EC4

	thumb_func_start ov07_02221EEC
ov07_02221EEC: @ 0x02221EEC
	push {r3, lr}
	adds r3, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	ldr r2, _02221F00 @ =0x02236444
	lsls r3, r3, #2
	ldr r2, [r2, r3]
	blx r2
	pop {r3, pc}
	nop
_02221F00: .4byte 0x02236444
	thumb_func_end ov07_02221EEC

	thumb_func_start ov07_02221F04
ov07_02221F04: @ 0x02221F04
	push {r3, r4, r5, r6}
	cmp r2, #0
	beq _02221F1A
	movs r4, #0x18
	adds r6, r0, #0
	muls r6, r4, r6
	ldr r4, _02221F30 @ =0x02236468
	lsls r5, r1, #2
	adds r4, r4, r6
	ldrsh r4, [r5, r4]
	strh r4, [r2]
_02221F1A:
	cmp r3, #0
	beq _02221F2C
	movs r2, #0x18
	muls r2, r0, r2
	ldr r0, _02221F34 @ =0x0223646A
	lsls r1, r1, #2
	adds r0, r0, r2
	ldrsh r0, [r1, r0]
	strh r0, [r3]
_02221F2C:
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
_02221F30: .4byte 0x02236468
_02221F34: .4byte 0x0223646A
	thumb_func_end ov07_02221F04

	thumb_func_start ov07_02221F38
ov07_02221F38: @ 0x02221F38
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221F58
	movs r0, #0
	adds r1, r5, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov07_02221F04
	pop {r3, r4, r5, r6, r7, pc}
_02221F58:
	adds r0, r7, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02221F70
	movs r0, #1
	subs r1, r5, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov07_02221F04
	pop {r3, r4, r5, r6, r7, pc}
_02221F70:
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov07_02221F04
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_02221F38

	thumb_func_start ov07_02221F80
ov07_02221F80: @ 0x02221F80
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r2, #0
	bl ov07_02231924
	adds r4, r0, #0
	adds r0, r7, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02221F9A
	movs r5, #1
	b _02221F9C
_02221F9A:
	movs r5, #0
_02221F9C:
	adds r0, r7, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221FA8
	adds r4, r4, #2
_02221FA8:
	cmp r6, #3
	bhi _02221FE0
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02221FB8: @ jump table
	.2byte _02221FC0 - _02221FB8 - 2 @ case 0
	.2byte _02221FD0 - _02221FB8 - 2 @ case 1
	.2byte _02221FC0 - _02221FB8 - 2 @ case 2
	.2byte _02221FD0 - _02221FB8 - 2 @ case 3
_02221FC0:
	movs r0, #0x18
	adds r2, r5, #0
	muls r2, r0, r2
	ldr r0, _02221FE8 @ =0x02236468
	lsls r1, r4, #2
	adds r0, r0, r2
	ldrsh r0, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02221FD0:
	movs r0, #0x18
	adds r2, r5, #0
	muls r2, r0, r2
	ldr r0, _02221FEC @ =0x0223646A
	lsls r1, r4, #2
	adds r0, r0, r2
	ldrsh r0, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02221FE0:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02221FE8: .4byte 0x02236468
_02221FEC: .4byte 0x0223646A
	thumb_func_end ov07_02221F80

	thumb_func_start ov07_02221FF0
ov07_02221FF0: @ 0x02221FF0
	push {r3, lr}
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end ov07_02221FF0

	thumb_func_start ov07_02222004
ov07_02222004: @ 0x02222004
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #1
	bl ov07_0223192C
	adds r4, r0, #0
	adds r0, r6, #0
	bl ov07_0221BFC0
	cmp r0, #0
	beq _02222022
	cmp r4, #3
	bne _02222028
	subs r5, r5, #2
	b _02222028
_02222022:
	cmp r4, #4
	bne _02222028
	subs r5, r5, #2
_02222028:
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_02222004

	thumb_func_start ov07_0222202C
ov07_0222202C: @ 0x0222202C
	push {r4, lr}
	movs r4, #1
	bl ov07_0223192C
	cmp r0, #4
	bne _0222203A
	subs r4, r4, #2
_0222203A:
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_0222202C

	thumb_func_start ov07_02222040
ov07_02222040: @ 0x02222040
	ldr r3, _02222048 @ =FUN_020CCBA0
	subs r0, r1, r0
	lsls r1, r2, #0xc
	bx r3
	.align 2, 0
_02222048: .4byte FUN_020CCBA0
	thumb_func_end ov07_02222040

	thumb_func_start ov07_0222204C
ov07_0222204C: @ 0x0222204C
	push {r3, lr}
	subs r0, r1, r0
	adds r1, r2, #0
	blx FUN_020CCBA0
	add r1, sp, #0
	str r0, [sp]
	blx FUN_020CD788
	cmp r0, #0
	beq _0222206C
	movs r0, #1
	ldr r1, [sp]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp]
_0222206C:
	ldr r0, [sp]
	cmp r0, #0
	bge _02222074
	rsbs r0, r0, #0
_02222074:
	str r0, [sp]
	asrs r0, r0, #0xc
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov07_0222204C

	thumb_func_start ov07_0222207C
ov07_0222207C: @ 0x0222207C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	movs r1, #0
	ldrsh r1, [r4, r1]
	adds r1, r2, r1
	movs r2, #2
	ldrsh r2, [r4, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	pop {r4, pc}
	thumb_func_end ov07_0222207C

	thumb_func_start ov07_0222209C
ov07_0222209C: @ 0x0222209C
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov07_02222644
	ldr r1, [sp, #4]
	ldr r2, [sp]
	adds r0, r4, #0
	bl FUN_0200E024
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_0222209C

	thumb_func_start ov07_022220B8
ov07_022220B8: @ 0x022220B8
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #0
	adds r6, r3, #0
	ldrsh r3, [r5, r1]
	adds r0, r4, #0
	adds r2, r2, r3
	bl FUN_020087A4
	movs r2, #2
	ldrsh r2, [r5, r2]
	adds r0, r4, #0
	movs r1, #1
	adds r2, r6, r2
	bl FUN_020087A4
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_022220B8

	thumb_func_start ov07_022220DC
ov07_022220DC: @ 0x022220DC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r2, #0
	adds r4, r1, #0
	ldrsh r2, [r5, r2]
	adds r0, r4, #0
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #2
	ldrsh r2, [r5, r2]
	adds r0, r4, #0
	movs r1, #0xd
	bl FUN_020087A4
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_022220DC

	thumb_func_start ov07_022220FC
ov07_022220FC: @ 0x022220FC
	push {r3, r4, r5, lr}
	adds r4, r3, #0
	adds r5, r0, #0
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	str r3, [r5, #4]
	str r1, [r5, #8]
	str r0, [r5, #0xc]
	ldr r0, [sp, #0x18]
	str r4, [r5, #0x10]
	str r0, [r5, #0x14]
	subs r0, r2, r1
	adds r1, r3, #0
	blx FUN_020F2998
	str r0, [r5, #0x18]
	add r0, sp, #0
	ldrh r0, [r0, #0x10]
	ldr r1, [sp, #0x1c]
	subs r0, r0, r4
	blx FUN_020F2998
	str r0, [r5, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_022220FC

	thumb_func_start ov07_0222212C
ov07_0222212C: @ 0x0222212C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	str r3, [sp]
	cmp r5, #0
	bne _0222213E
	bl GF_AssertFail
_0222213E:
	cmp r4, r7
	bls _0222214A
	add r0, sp, #8
	ldrh r1, [r0, #0x1c]
	rsbs r1, r1, #0
	strh r1, [r0, #0x1c]
_0222214A:
	add r1, sp, #8
	movs r0, #0x1c
	ldrsh r6, [r1, r0]
	lsls r0, r4, #0xc
	lsls r1, r7, #0xc
	lsls r2, r6, #0xc
	bl ov07_0222204C
	str r0, [r5, #4]
	ldr r0, [sp, #0x1c]
	str r4, [r5, #8]
	str r0, [r5, #0xc]
	ldr r0, [sp]
	str r0, [r5, #0x10]
	ldr r0, [sp, #0x20]
	str r0, [r5, #0x14]
	str r6, [r5, #0x18]
	add r0, sp, #8
	ldrh r1, [r0, #0x10]
	ldr r0, [sp]
	subs r0, r1, r0
	ldr r1, [r5, #4]
	blx FUN_020F2998
	str r0, [r5, #0x1c]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0222212C

	thumb_func_start ov07_02222180
ov07_02222180: @ 0x02222180
	push {r4, lr}
	adds r4, r0, #0
	bne _0222218A
	bl GF_AssertFail
_0222218A:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222220E
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x18]
	adds r0, r1, r0
	str r0, [r4, #8]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x1c]
	adds r0, r1, r0
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r4, #8]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	subs r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	ldr r2, [r4, #0xc]
	asrs r0, r0, #4
	lsls r1, r0, #2
	ldr r0, _02222214 @ =0x021094DC
	asrs r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	asrs r0, r1, #0xc
	strh r0, [r4]
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x14]
	asrs r0, r0, #4
	lsls r0, r0, #1
	adds r0, r0, #1
	lsls r1, r0, #1
	ldr r0, _02222214 @ =0x021094DC
	asrs r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	asrs r0, r1, #0xc
	strh r0, [r4, #2]
	movs r0, #1
	pop {r4, pc}
_0222220E:
	movs r0, #0
	pop {r4, pc}
	nop
_02222214: .4byte 0x021094DC
	thumb_func_end ov07_02222180

	thumb_func_start ov07_02222218
ov07_02222218: @ 0x02222218
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov07_02222180
	cmp r0, #0
	beq _0222223A
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov07_0222207C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222223A:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_02222218

	thumb_func_start ov07_02222240
ov07_02222240: @ 0x02222240
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov07_02222180
	cmp r0, #0
	beq _02222262
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov07_022220B8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02222262:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_02222240

	thumb_func_start ov07_02222268
ov07_02222268: @ 0x02222268
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r3, #0
	str r2, [sp]
	cmp r5, #0
	bne _0222227C
	bl GF_AssertFail
_0222227C:
	strh r4, [r5]
	strh r6, [r5, #2]
	add r0, sp, #0x10
	ldrh r7, [r0, #0x14]
	lsls r0, r4, #0xc
	str r0, [sp, #4]
	str r7, [r5, #4]
	ldr r1, [sp]
	adds r2, r7, #0
	lsls r1, r1, #0xc
	bl ov07_02222040
	str r0, [r5, #8]
	lsls r4, r6, #0xc
	add r2, sp, #0x10
	movs r1, #0x10
	ldrsh r1, [r2, r1]
	adds r0, r4, #0
	adds r2, r7, #0
	lsls r1, r1, #0xc
	bl ov07_02222040
	str r0, [r5, #0xc]
	ldr r0, [sp, #4]
	str r0, [r5, #0x10]
	str r4, [r5, #0x14]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02222268

	thumb_func_start ov07_022222B4
ov07_022222B4: @ 0x022222B4
	push {r4, lr}
	adds r4, r0, #0
	bne _022222BE
	bl GF_AssertFail
_022222BE:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022222EA
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #8]
	adds r0, r1, r0
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0xc]
	adds r0, r1, r0
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	asrs r0, r0, #0xc
	strh r0, [r4]
	ldr r0, [r4, #0x14]
	asrs r0, r0, #0xc
	strh r0, [r4, #2]
	ldr r0, [r4, #4]
	subs r0, r0, #1
	str r0, [r4, #4]
	movs r0, #1
	pop {r4, pc}
_022222EA:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_022222B4

	thumb_func_start ov07_022222F0
ov07_022222F0: @ 0x022222F0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov07_022222B4
	cmp r0, #0
	beq _0222230E
	movs r2, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov07_0222207C
	movs r0, #1
	pop {r3, r4, r5, pc}
_0222230E:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_022222F0

	thumb_func_start ov07_02222314
ov07_02222314: @ 0x02222314
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov07_022222B4
	cmp r0, #0
	beq _02222332
	movs r2, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov07_022220B8
	movs r0, #1
	pop {r3, r4, r5, pc}
_02222332:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02222314

	thumb_func_start ov07_02222338
ov07_02222338: @ 0x02222338
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r1, #0
	add r4, sp, #0x10
	movs r1, #0x14
	ldrsh r1, [r4, r1]
	str r1, [sp]
	ldrh r1, [r4, #0x18]
	str r1, [sp, #4]
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0x10
	ldrsh r3, [r4, r3]
	bl ov07_02222268
	movs r1, #0
	strh r1, [r5]
	ldr r0, _0222237C @ =0x0000BFFF
	strh r1, [r5, #2]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	ldrh r0, [r0, #0x18]
	ldr r3, _02222380 @ =0x00003FFF
	adds r2, r1, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	bl ov07_022220FC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0222237C: .4byte 0x0000BFFF
_02222380: .4byte 0x00003FFF
	thumb_func_end ov07_02222338

	thumb_func_start ov07_02222384
ov07_02222384: @ 0x02222384
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _02222392
	bl GF_AssertFail
_02222392:
	cmp r4, #0
	bne _0222239A
	bl GF_AssertFail
_0222239A:
	adds r0, r5, #0
	bl ov07_022222B4
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov07_02222180
	movs r2, #0
	ldrsh r3, [r5, r2]
	ldrsh r1, [r4, r2]
	adds r1, r3, r1
	strh r1, [r5]
	movs r1, #2
	ldrsh r3, [r5, r1]
	ldrsh r1, [r4, r1]
	adds r1, r3, r1
	strh r1, [r5, #2]
	cmp r6, r0
	bne _022223C8
	cmp r6, #0
	bne _022223C8
	adds r0, r2, #0
	pop {r4, r5, r6, pc}
_022223C8:
	movs r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_02222384

	thumb_func_start ov07_022223CC
ov07_022223CC: @ 0x022223CC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	bl ov07_02222384
	cmp r0, #0
	beq _022223EA
	movs r2, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov07_0222207C
	movs r0, #1
	pop {r3, r4, r5, pc}
_022223EA:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_022223CC

	thumb_func_start ov07_022223F0
ov07_022223F0: @ 0x022223F0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	cmp r5, #0
	bne _02222402
	bl GF_AssertFail
_02222402:
	str r6, [r5]
	lsls r0, r6, #0xc
	lsls r1, r7, #0xc
	adds r2, r4, #0
	str r4, [r5, #4]
	bl ov07_02222040
	asrs r0, r0, #0xc
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_022223F0

	thumb_func_start ov07_02222418
ov07_02222418: @ 0x02222418
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	cmp r5, #0
	bne _0222242A
	bl GF_AssertFail
_0222242A:
	str r6, [r5]
	lsls r6, r6, #0xc
	adds r0, r6, #0
	lsls r1, r7, #0xc
	adds r2, r4, #0
	str r4, [r5, #4]
	bl ov07_02222040
	str r0, [r5, #8]
	str r6, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02222418

	thumb_func_start ov07_02222440
ov07_02222440: @ 0x02222440
	push {r4, lr}
	adds r4, r0, #0
	bne _0222244A
	bl GF_AssertFail
_0222244A:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02222462
	ldr r1, [r4]
	ldr r0, [r4, #8]
	adds r0, r1, r0
	str r0, [r4]
	ldr r0, [r4, #4]
	subs r0, r0, #1
	str r0, [r4, #4]
	movs r0, #1
	pop {r4, pc}
_02222462:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02222440

	thumb_func_start ov07_02222468
ov07_02222468: @ 0x02222468
	push {r4, lr}
	adds r4, r0, #0
	bne _02222472
	bl GF_AssertFail
_02222472:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222248E
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	adds r0, r1, r0
	str r0, [r4, #0xc]
	asrs r0, r0, #0xc
	str r0, [r4]
	ldr r0, [r4, #4]
	subs r0, r0, #1
	str r0, [r4, #4]
	movs r0, #1
	pop {r4, pc}
_0222248E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02222468

	thumb_func_start ov07_02222494
ov07_02222494: @ 0x02222494
	push {r3, r4, r5, lr}
	ldr r4, [sp, #0x10]
	adds r5, r0, #0
	str r4, [r5, #4]
	str r1, [r5, #8]
	subs r0, r2, r1
	adds r1, r4, #0
	str r3, [r5, #0xc]
	blx FUN_020F2BA4
	str r0, [r5, #0x10]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02222494

	thumb_func_start ov07_022224AC
ov07_022224AC: @ 0x022224AC
	push {r4, lr}
	adds r4, r0, #0
	bne _022224B6
	bl GF_AssertFail
_022224B6:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022224FE
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x10]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	subs r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	ldr r2, [r4, #0xc]
	asrs r0, r0, #4
	lsls r0, r0, #1
	adds r0, r0, #1
	lsls r1, r0, #1
	ldr r0, _02222504 @ =0x021094DC
	asrs r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	asrs r0, r1, #0xc
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
_022224FE:
	movs r0, #0
	pop {r4, pc}
	nop
_02222504: .4byte 0x021094DC
	thumb_func_end ov07_022224AC

	thumb_func_start ov07_02222508
ov07_02222508: @ 0x02222508
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r4, #0
	bne _0222251A
	bl GF_AssertFail
_0222251A:
	ldr r0, [sp, #0x18]
	adds r1, r6, #0
	str r0, [r4, #4]
	lsls r0, r5, #8
	blx FUN_020F2998
	adds r5, r0, #0
	lsls r0, r7, #8
	adds r1, r6, #0
	blx FUN_020F2998
	adds r1, r0, #0
	ldr r2, [sp, #0x18]
	lsls r0, r5, #0xc
	lsls r1, r1, #0xc
	bl ov07_02222040
	str r0, [r4, #8]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	strh r0, [r4]
	strh r0, [r4, #2]
	movs r0, #0
	ldrsh r0, [r4, r0]
	lsls r0, r0, #0xc
	str r0, [r4, #0x10]
	movs r0, #2
	ldrsh r0, [r4, r0]
	lsls r0, r0, #0xc
	str r0, [r4, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02222508

	thumb_func_start ov07_02222558
ov07_02222558: @ 0x02222558
	push {r4, lr}
	adds r4, r0, #0
	bne _02222562
	bl GF_AssertFail
_02222562:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222258C
	subs r0, r0, #1
	str r0, [r4, #4]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #8]
	adds r0, r1, r0
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #8]
	adds r0, r1, r0
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	asrs r0, r0, #0xc
	strh r0, [r4]
	ldr r0, [r4, #0x14]
	asrs r0, r0, #0xc
	strh r0, [r4, #2]
	movs r0, #1
	pop {r4, pc}
_0222258C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov07_02222558

	thumb_func_start ov07_02222590
ov07_02222590: @ 0x02222590
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp]
	cmp r5, #0
	bne _022225A2
	bl GF_AssertFail
_022225A2:
	ldr r0, [sp, #0x20]
	add r1, sp, #8
	str r0, [r5, #4]
	movs r0, #0x14
	ldrsh r4, [r1, r0]
	lsls r0, r6, #8
	adds r1, r4, #0
	blx FUN_020F2998
	adds r6, r0, #0
	lsls r0, r7, #8
	adds r1, r4, #0
	blx FUN_020F2998
	adds r1, r0, #0
	ldr r2, [sp, #0x20]
	lsls r0, r6, #0xc
	lsls r1, r1, #0xc
	bl ov07_02222040
	str r0, [r5, #8]
	ldr r0, [sp]
	adds r1, r4, #0
	lsls r0, r0, #8
	blx FUN_020F2998
	adds r7, r0, #0
	add r1, sp, #8
	movs r0, #0x10
	ldrsh r0, [r1, r0]
	adds r1, r4, #0
	lsls r0, r0, #8
	blx FUN_020F2998
	adds r1, r0, #0
	ldr r2, [sp, #0x20]
	lsls r0, r7, #0xc
	lsls r1, r1, #0xc
	bl ov07_02222040
	str r0, [r5, #0xc]
	strh r6, [r5]
	strh r7, [r5, #2]
	movs r0, #0
	ldrsh r0, [r5, r0]
	lsls r0, r0, #0xc
	str r0, [r5, #0x10]
	movs r0, #2
	ldrsh r0, [r5, r0]
	lsls r0, r0, #0xc
	str r0, [r5, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_02222590

	thumb_func_start ov07_0222260C
ov07_0222260C: @ 0x0222260C
	push {r4, lr}
	adds r4, r0, #0
	bne _02222616
	bl GF_AssertFail
_02222616:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02222640
	subs r0, r0, #1
	str r0, [r4, #4]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #8]
	adds r0, r1, r0
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0xc]
	adds r0, r1, r0
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	asrs r0, r0, #0xc
	strh r0, [r4]
	ldr r0, [r4, #0x14]
	asrs r0, r0, #0xc
	strh r0, [r4, #2]
	movs r0, #1
	pop {r4, pc}
_02222640:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov07_0222260C

	thumb_func_start ov07_02222644
ov07_02222644: @ 0x02222644
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0
	ldrsh r0, [r5, r0]
	adds r4, r1, #0
	adds r6, r2, #0
	blx FUN_020F2178
	ldr r1, _02222670 @ =0x43800000
	blx FUN_020F1CC8
	str r0, [r4]
	movs r0, #2
	ldrsh r0, [r5, r0]
	blx FUN_020F2178
	ldr r1, _02222670 @ =0x43800000
	blx FUN_020F1CC8
	str r0, [r6]
	pop {r4, r5, r6, pc}
	nop
_02222670: .4byte 0x43800000
	thumb_func_end ov07_02222644

	thumb_func_start ov07_02222674
ov07_02222674: @ 0x02222674
	push {r3, r4, lr}
	sub sp, #4
	lsls r1, r1, #1
	movs r0, #0x50
	subs r0, r0, r1
	lsls r4, r0, #0xc
	asrs r1, r4, #0x1f
	adds r0, r4, #0
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
	lsls r1, r2, #9
	blx FUN_020CCBA0
	subs r0, r4, r0
	add r1, sp, #0
	blx FUN_020CD788
	cmp r0, #0
	beq _022226B2
	movs r1, #2
	lsls r1, r1, #0xa
	adds r0, r0, r1
_022226B2:
	ldr r1, [sp]
	adds r0, r1, r0
	asrs r1, r0, #0xc
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0xf
	asrs r0, r0, #0x10
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02222674

	thumb_func_start ov07_022226C4
ov07_022226C4: @ 0x022226C4
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r3, #0
	bl ov07_02222674
	adds r2, r0, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _022226EE
	movs r0, #0
	mvns r0, r0
	muls r0, r2, r0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	subs r0, r4, r6
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
_022226EE:
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, r2
	bl FUN_020087A4
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_022226C4

	thumb_func_start ov07_022226FC
ov07_022226FC: @ 0x022226FC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r2, #0
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r3, #0
	bl ov07_02222674
	adds r4, r0, #0
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _02222726
	movs r0, #0
	mvns r0, r0
	muls r0, r4, r0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	subs r0, r5, r7
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
_02222726:
	add r1, sp, #0
	adds r0, r6, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	add r2, sp, #0
	movs r1, #2
	ldrsh r1, [r2, r1]
	adds r2, r5, r4
	lsls r2, r2, #0x10
	adds r0, r6, #0
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_022226FC

	thumb_func_start ov07_02222748
ov07_02222748: @ 0x02222748
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov07_02222558
	cmp r0, #0
	beq _02222762
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_0222209C
	movs r0, #1
	pop {r3, r4, r5, pc}
_02222762:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02222748

	thumb_func_start ov07_02222768
ov07_02222768: @ 0x02222768
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov07_02222558
	cmp r0, #0
	beq _02222782
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_022220DC
	movs r0, #1
	pop {r3, r4, r5, pc}
_02222782:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02222768

	thumb_func_start ov07_02222788
ov07_02222788: @ 0x02222788
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov07_0222260C
	cmp r0, #0
	beq _022227A2
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_022220DC
	movs r0, #1
	pop {r3, r4, r5, pc}
_022227A2:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02222788

	thumb_func_start ov07_022227A8
ov07_022227A8: @ 0x022227A8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	bne _022227BA
	bl GF_AssertFail
_022227BA:
	str r7, [r5, #4]
	ldr r0, [sp, #0x18]
	str r7, [r5, #8]
	str r0, [r5, #0xc]
	movs r1, #0
	str r1, [r5, #0x10]
	str r6, [r5, #0x14]
	str r4, [r5, #0x18]
	rsbs r0, r6, #0
	str r0, [r5, #0x1c]
	rsbs r0, r4, #0
	str r0, [r5, #0x20]
	strh r1, [r5]
	strh r1, [r5, #2]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_022227A8

	thumb_func_start ov07_022227D8
ov07_022227D8: @ 0x022227D8
	push {r4, lr}
	adds r4, r0, #0
	bne _022227E2
	bl GF_AssertFail
_022227E2:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02222836
	ldr r0, [r4, #4]
	adds r1, r0, #1
	str r1, [r4, #4]
	ldr r0, [r4, #8]
	cmp r1, r0
	blt _02222832
	movs r2, #0
	str r2, [r4, #4]
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0x1c]
	str r0, [r4, #0x1c]
	cmp r1, #0
	bne _02222806
	strh r2, [r4]
	b _0222280A
_02222806:
	rsbs r0, r1, #0
	strh r0, [r4]
_0222280A:
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x20]
	str r0, [r4, #0x20]
	cmp r1, #0
	bne _0222281A
	movs r0, #0
	b _0222281C
_0222281A:
	rsbs r0, r1, #0
_0222281C:
	strh r0, [r4, #2]
	ldr r0, [r4, #0x10]
	adds r0, r0, #1
	str r0, [r4, #0x10]
	cmp r0, #4
	blt _02222832
	movs r0, #0
	str r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	subs r0, r0, #1
	str r0, [r4, #0xc]
_02222832:
	movs r0, #1
	pop {r4, pc}
_02222836:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_022227D8

	thumb_func_start ov07_0222283C
ov07_0222283C: @ 0x0222283C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov07_022227D8
	cmp r0, #0
	beq _0222285E
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov07_022220B8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222285E:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0222283C

	thumb_func_start ov07_02222864
ov07_02222864: @ 0x02222864
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	str r1, [sp]
	strh r3, [r7]
	add r0, sp, #8
	movs r1, #0x10
	ldrsh r1, [r0, r1]
	movs r6, #0
	strh r1, [r7, #2]
	adds r1, r7, #0
	adds r1, #0x94
	str r2, [r1]
	adds r1, r7, #0
	ldrh r2, [r0, #0x14]
	adds r1, #0xa8
	strh r2, [r1]
	adds r1, r7, #0
	adds r1, #0xaa
	strh r6, [r1]
	ldrb r1, [r0, #0x18]
	adds r2, r7, #0
	adds r2, #0xac
	mov ip, r1
	strb r1, [r2]
	adds r1, r7, #0
	adds r1, #0xad
	strb r6, [r1]
	ldrb r1, [r0, #0x1c]
	adds r0, r7, #0
	adds r0, #0xae
	strb r1, [r0]
	mov r0, ip
	cmp r0, #0
	ble _022228C6
	adds r5, r7, #0
_022228AA:
	ldr r4, [sp]
	adds r3, r5, #4
	movs r2, #4
_022228B0:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _022228B0
	ldr r0, [r4]
	adds r6, r6, #1
	str r0, [r3]
	mov r0, ip
	adds r5, #0x24
	cmp r6, r0
	blt _022228AA
_022228C6:
	adds r0, r7, #0
	ldr r1, [sp, #0x28]
	adds r0, #0x98
	str r1, [r0]
	adds r0, r7, #0
	ldr r1, [sp, #0x2c]
	adds r0, #0x9c
	str r1, [r0]
	adds r0, r7, #0
	ldr r1, [sp, #0x30]
	adds r0, #0xa0
	str r1, [r0]
	adds r0, r7, #0
	ldr r1, [sp, #0x34]
	adds r0, #0xa4
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0xac
	ldrb r0, [r0]
	movs r5, #0
	cmp r0, #0
	ble _02222910
	adds r4, r7, #0
	adds r6, r5, #0
_022228F6:
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	adds r1, r6, #0
	bl FUN_0200DCE8
	adds r0, r7, #0
	adds r0, #0xac
	ldrb r0, [r0]
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, r0
	blt _022228F6
_02222910:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_02222864

	thumb_func_start ov07_02222914
ov07_02222914: @ 0x02222914
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r0, #0
	add r2, sp, #0x10
	movs r1, #1
_02222920:
	adds r0, r0, #1
	stm r2!, {r1}
	cmp r0, #4
	blt _02222920
	adds r0, r5, #0
	adds r0, #0xa8
	ldrh r2, [r0]
	adds r0, r5, #0
	adds r0, #0xaa
	ldrh r0, [r0]
	cmp r2, r0
	bhi _02222960
	adds r0, r5, #0
	adds r0, #0xad
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0x98
	ldr r0, [r0]
	bl FUN_0200DCE8
	adds r0, r5, #0
	adds r0, #0xad
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0xad
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0xaa
	strh r1, [r0]
_02222960:
	adds r0, r5, #0
	adds r0, #0xad
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xac
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0222297E
	adds r0, r5, #0
	adds r0, #0xaa
	ldrh r0, [r0]
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0xaa
	strh r1, [r0]
_0222297E:
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0xad
	ldrb r0, [r0]
	cmp r0, #0
	ble _02222A1E
	add r0, sp, #0x10
	adds r7, r5, #4
	str r0, [sp, #4]
	adds r6, r5, #0
	adds r4, r5, #0
_02222996:
	adds r1, r5, #0
	adds r1, #0x94
	ldr r1, [r1]
	adds r0, r7, #0
	blx r1
	ldr r1, [sp, #4]
	cmp r0, #0
	str r0, [r1]
	beq _022229F4
	adds r0, r5, #0
	adds r0, #0xae
	ldrb r0, [r0]
	cmp r0, #0
	bne _022229DA
	movs r1, #0
	movs r2, #4
	ldrsh r1, [r5, r1]
	ldrsh r2, [r6, r2]
	adds r0, r4, #0
	adds r0, #0x98
	adds r1, r1, r2
	movs r2, #2
	ldrsh r3, [r5, r2]
	movs r2, #6
	ldrsh r2, [r6, r2]
	lsls r1, r1, #0x10
	ldr r0, [r0]
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	b _02222A00
_022229DA:
	adds r0, r7, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov07_02222644
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	bl FUN_0200E024
	b _02222A00
_022229F4:
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DCE8
_02222A00:
	ldr r0, [sp, #4]
	adds r7, #0x24
	adds r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r6, #0x24
	adds r0, r0, #1
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0xad
	ldrb r1, [r0]
	ldr r0, [sp]
	adds r4, r4, #4
	cmp r0, r1
	blt _02222996
_02222A1E:
	adds r5, #0xac
	ldrb r2, [r5]
	movs r3, #0
	cmp r2, #0
	ble _02222A3E
	add r1, sp, #0x10
_02222A2A:
	ldr r0, [r1]
	cmp r0, #1
	bne _02222A36
	add sp, #0x20
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02222A36:
	adds r3, r3, #1
	adds r1, r1, #4
	cmp r3, r2
	blt _02222A2A
_02222A3E:
	movs r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02222914

	thumb_func_start ov07_02222A44
ov07_02222A44: @ 0x02222A44
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r3, _02222A74 @ =0x0000FFFF
	adds r4, r1, #0
	movs r1, #2
	str r3, [sp]
	lsls r1, r1, #0x10
	str r1, [sp, #4]
	ldr r1, _02222A78 @ =0xFFFF8000
	adds r5, r0, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	movs r1, #0
	adds r2, r3, #0
	adds r3, r1, #0
	bl ov07_022220FC
	ldr r0, [r5, #4]
	adds r1, r0, #0
	muls r1, r4, r1
	str r1, [r5, #4]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02222A74: .4byte 0x0000FFFF
_02222A78: .4byte 0xFFFF8000
	thumb_func_end ov07_02222A44

	thumb_func_start ov07_02222A7C
ov07_02222A7C: @ 0x02222A7C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_022222B4
	cmp r0, #0
	bne _02222A98
	movs r0, #1
	str r0, [r4, #0x24]
	adds r0, r5, #0
	bl FUN_0200E390
	pop {r3, r4, r5, pc}
_02222A98:
	movs r0, #0
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _02222AA2
	strh r0, [r4]
_02222AA2:
	movs r0, #2
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _02222AAE
	movs r0, #0
	strh r0, [r4, #2]
_02222AAE:
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r0, #2
	ldrsh r0, [r4, r0]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _02222AC0 @ =0x04000052
	strh r1, [r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02222AC0: .4byte 0x04000052
	thumb_func_end ov07_02222A7C

	thumb_func_start ov07_02222AC4
ov07_02222AC4: @ 0x02222AC4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, sp, #8
	movs r5, #0x10
	ldrsh r5, [r6, r5]
	adds r4, r0, #0
	str r5, [sp]
	ldr r5, [sp, #0x1c]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #4]
	bl ov07_02222268
	movs r2, #0
	ldr r0, _02222AF0 @ =ov07_02222A7C
	adds r1, r4, #0
	str r2, [r4, #0x24]
	bl FUN_0200E320
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02222AF0: .4byte ov07_02222A7C
	thumb_func_end ov07_02222AC4

	thumb_func_start ov07_02222AF4
ov07_02222AF4: @ 0x02222AF4
	ldr r0, [r0, #0x24]
	bx lr
	thumb_func_end ov07_02222AF4

	thumb_func_start ov07_02222AF8
ov07_02222AF8: @ 0x02222AF8
	push {r3, lr}
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _02222B0C
	movs r0, #1
	str r0, [r1, #0xc]
	ldr r0, [r1, #0x18]
	ldr r1, [r1, #0x10]
	blx r1
	pop {r3, pc}
_02222B0C:
	bl FUN_02014AA0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov07_02222AF8

	thumb_func_start ov07_02222B14
ov07_02222B14: @ 0x02222B14
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02222B2E
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02222B2E
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x14]
	blx r1
	movs r0, #0
	str r0, [r4, #0xc]
_02222B2E:
	pop {r4, pc}
	thumb_func_end ov07_02222B14

	thumb_func_start ov07_02222B30
ov07_02222B30: @ 0x02222B30
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	bne _02222B42
	bl GF_AssertFail
_02222B42:
	movs r0, #1
	str r0, [r5, #8]
	movs r2, #0
	str r2, [r5, #0xc]
	str r4, [r5, #0x18]
	str r6, [r5, #0x10]
	ldr r0, _02222B68 @ =ov07_02222AF8
	str r7, [r5, #0x14]
	adds r1, r5, #0
	bl FUN_0200E374
	str r0, [r5, #4]
	ldr r0, _02222B6C @ =ov07_02222B14
	adds r1, r5, #0
	movs r2, #0
	bl FUN_0200E33C
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02222B68: .4byte ov07_02222AF8
_02222B6C: .4byte ov07_02222B14
	thumb_func_end ov07_02222B30

	thumb_func_start ov07_02222B70
ov07_02222B70: @ 0x02222B70
	push {r4, lr}
	adds r4, r0, #0
	bne _02222B7A
	bl GF_AssertFail
_02222B7A:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02222B84
	bl FUN_0200E390
_02222B84:
	ldr r0, [r4]
	cmp r0, #0
	beq _02222B8E
	bl FUN_0200E390
_02222B8E:
	bl FUN_02014AA0
	pop {r4, pc}
	thumb_func_end ov07_02222B70

	thumb_func_start ov07_02222B94
ov07_02222B94: @ 0x02222B94
	push {r4, lr}
	adds r4, r0, #0
	bne _02222B9E
	bl GF_AssertFail
_02222B9E:
	movs r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ov07_02222B94

	thumb_func_start ov07_02222BA4
ov07_02222BA4: @ 0x02222BA4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_02014A60
	adds r5, r0, #0
	bl FUN_02014AA0
	movs r1, #0x62
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #1
	bl FUN_02014AB0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02222BA4

	thumb_func_start ov07_02222BC8
ov07_02222BC8: @ 0x02222BC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_02014A8C
	adds r0, r4, #0
	bl ov07_02222BA4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02222BC8

	thumb_func_start ov07_02222BDC
ov07_02222BDC: @ 0x02222BDC
	ldr r3, _02222BE0 @ =ov07_02222BA4
	bx r3
	.align 2, 0
_02222BE0: .4byte ov07_02222BA4
	thumb_func_end ov07_02222BDC

	thumb_func_start ov07_02222BE4
ov07_02222BE4: @ 0x02222BE4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r7, r2, #0
	adds r5, r0, #0
	ldr r1, _02222C54 @ =0x00000624
	adds r0, r7, #0
	bl FUN_0201AA8C
	ldr r2, _02222C54 @ =0x00000624
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	cmp r4, #0
	bne _02222C06
	bl GF_AssertFail
_02222C06:
	movs r2, #0x32
	adds r1, r4, #0
	lsls r2, r2, #4
	adds r0, r7, #0
	adds r1, #0x20
	adds r2, r4, r2
	bl FUN_02014A08
	str r0, [r4, #0x1c]
	cmp r0, #0
	bne _02222C20
	bl GF_AssertFail
_02222C20:
	movs r0, #0x62
	lsls r0, r0, #4
	adds r1, r4, #0
	movs r2, #3
	str r5, [r4, r0]
	adds r0, r6, #0
	adds r1, #0x20
	lsls r2, r2, #8
	blx FUN_020D47EC
	movs r2, #0x32
	lsls r2, r2, #4
	adds r1, r4, r2
	adds r0, r6, #0
	subs r2, #0x20
	blx FUN_020D47EC
	ldr r2, _02222C58 @ =ov07_02222BC8
	ldr r3, _02222C5C @ =ov07_02222BDC
	adds r0, r4, #0
	adds r1, r4, #0
	bl ov07_02222B30
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222C54: .4byte 0x00000624
_02222C58: .4byte ov07_02222BC8
_02222C5C: .4byte ov07_02222BDC
	thumb_func_end ov07_02222BE4

	thumb_func_start ov07_02222C60
ov07_02222C60: @ 0x02222C60
	push {r4, lr}
	adds r4, r0, #0
	bne _02222C6A
	bl GF_AssertFail
_02222C6A:
	adds r0, r4, #0
	bl ov07_02222B70
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02222C7A
	bl FUN_02014A38
_02222C7A:
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02222C60

	thumb_func_start ov07_02222C84
ov07_02222C84: @ 0x02222C84
	push {r4, lr}
	adds r4, r0, #0
	bne _02222C8E
	bl GF_AssertFail
_02222C8E:
	ldr r0, [r4, #0x1c]
	bl FUN_02014A4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02222C84

	thumb_func_start ov07_02222C98
ov07_02222C98: @ 0x02222C98
	push {r4, lr}
	adds r4, r0, #0
	bne _02222CA2
	bl GF_AssertFail
_02222CA2:
	adds r0, r4, #0
	bl ov07_02222B94
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02222C98

	thumb_func_start ov07_02222CAC
ov07_02222CAC: @ 0x02222CAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_02014C08
	ldr r0, [r4, #0x1c]
	bl FUN_02014C40
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02222CAC

	thumb_func_start ov07_02222CC0
ov07_02222CC0: @ 0x02222CC0
	ldr r3, _02222CC8 @ =FUN_02014C40
	ldr r0, [r0, #0x1c]
	bx r3
	nop
_02222CC8: .4byte FUN_02014C40
	thumb_func_end ov07_02222CC0

	thumb_func_start ov07_02222CCC
ov07_02222CCC: @ 0x02222CCC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r7, r0, #0
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x40]
	movs r1, #0x20
	str r2, [sp, #0x18]
	adds r5, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02222CE8
	bl GF_AssertFail
_02222CE8:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020E5B44
	ldr r0, [sp, #0x34]
	bl ov07_02222D90
	adds r6, r0, #0
	ldr r0, [sp, #0x40]
	bl FUN_02014AD8
	str r0, [r4, #0x1c]
	str r5, [sp]
	add r1, sp, #0x20
	movs r0, #0x10
	ldrsh r0, [r1, r0]
	adds r1, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x3c]
	str r6, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x1c]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl FUN_02014B08
	ldr r2, _02222D34 @ =ov07_02222CAC
	ldr r3, _02222D38 @ =ov07_02222CC0
	adds r0, r4, #0
	adds r1, r4, #0
	bl ov07_02222B30
	adds r0, r4, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02222D34: .4byte ov07_02222CAC
_02222D38: .4byte ov07_02222CC0
	thumb_func_end ov07_02222CCC

	thumb_func_start ov07_02222D3C
ov07_02222D3C: @ 0x02222D3C
	push {r4, lr}
	adds r4, r0, #0
	bne _02222D46
	bl GF_AssertFail
_02222D46:
	adds r0, r4, #0
	bl ov07_02222B70
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02222D56
	bl FUN_02014BD8
_02222D56:
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02222D3C

	thumb_func_start ov07_02222D60
ov07_02222D60: @ 0x02222D60
	push {r4, lr}
	adds r4, r0, #0
	bne _02222D6A
	bl GF_AssertFail
_02222D6A:
	ldr r0, [r4, #0x1c]
	bl FUN_02014BF8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02222D60

	thumb_func_start ov07_02222D74
ov07_02222D74: @ 0x02222D74
	push {r4, lr}
	adds r4, r0, #0
	bne _02222D7E
	bl GF_AssertFail
_02222D7E:
	adds r0, r4, #0
	bl ov07_02222B94
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02222D74

	thumb_func_start ov07_02222D88
ov07_02222D88: @ 0x02222D88
	lsls r1, r1, #0x10
	orrs r0, r1
	bx lr
	.align 2, 0
	thumb_func_end ov07_02222D88

	thumb_func_start ov07_02222D90
ov07_02222D90: @ 0x02222D90
	cmp r0, #3
	bhi _02222DB6
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02222DA0: @ jump table
	.2byte _02222DA8 - _02222DA0 - 2 @ case 0
	.2byte _02222DAC - _02222DA0 - 2 @ case 1
	.2byte _02222DB0 - _02222DA0 - 2 @ case 2
	.2byte _02222DB4 - _02222DA0 - 2 @ case 3
_02222DA8:
	ldr r0, _02222DB8 @ =0x04000010
	bx lr
_02222DAC:
	ldr r0, _02222DBC @ =0x04000014
	bx lr
_02222DB0:
	ldr r0, _02222DC0 @ =0x04000018
	bx lr
_02222DB4:
	ldr r0, _02222DC4 @ =0x0400001C
_02222DB6:
	bx lr
	.align 2, 0
_02222DB8: .4byte 0x04000010
_02222DBC: .4byte 0x04000014
_02222DC0: .4byte 0x04000018
_02222DC4: .4byte 0x0400001C
	thumb_func_end ov07_02222D90

	thumb_func_start ov07_02222DC8
ov07_02222DC8: @ 0x02222DC8
	adds r2, r0, r2
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r2, r0, #1
	ldr r0, [sp]
	adds r1, r1, r3
	strh r2, [r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r1, r0, #1
	ldr r0, [sp, #4]
	strh r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov07_02222DC8

	thumb_func_start ov07_02222DE4
ov07_02222DE4: @ 0x02222DE4
	push {r3, lr}
	subs r1, r1, r3
	rsbs r1, r1, #0
	subs r0, r0, r2
	lsls r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r1, r1, #0x10
	adds r2, r1, #0
	asrs r0, r0, #0x10
	muls r2, r1, r2
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r2, r1
	lsls r0, r0, #0xc
	blx FUN_020CCBEC
	ldr r1, [sp, #8]
	str r0, [r1]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov07_02222DE4

	thumb_func_start ov07_02222E0C
ov07_02222E0C: @ 0x02222E0C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	subs r0, r1, r3
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	subs r1, r6, r2
	asrs r4, r0, #0x10
	lsls r1, r1, #0x10
	ldr r5, [sp, #0x10]
	lsls r0, r4, #0xc
	asrs r1, r1, #4
	blx FUN_020CD5DC
	strh r0, [r5]
	ldrh r1, [r5]
	cmp r1, #0
	beq _02222E3C
	cmp r4, #0
	bge _02222E3C
	ldr r0, _02222E40 @ =0x00007FFF
	subs r1, r1, r0
	ldr r0, _02222E44 @ =0x0000FFFF
	muls r0, r1, r0
	strh r0, [r5]
_02222E3C:
	pop {r4, r5, r6, pc}
	nop
_02222E40: .4byte 0x00007FFF
_02222E44: .4byte 0x0000FFFF
	thumb_func_end ov07_02222E0C

	thumb_func_start ov07_02222E48
ov07_02222E48: @ 0x02222E48
	cmp r2, #0
	ldr r3, [r0]
	bge _02222E60
	adds r2, r3, r2
	cmp r2, r1
	ble _02222E5A
	str r2, [r0]
	movs r0, #0
	bx lr
_02222E5A:
	str r1, [r0]
	movs r0, #1
	bx lr
_02222E60:
	adds r2, r3, r2
	cmp r2, r1
	bge _02222E6C
	str r2, [r0]
	movs r0, #0
	bx lr
_02222E6C:
	str r1, [r0]
	movs r0, #1
	bx lr
	.align 2, 0
	thumb_func_end ov07_02222E48

	thumb_func_start ov07_02222E74
ov07_02222E74: @ 0x02222E74
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02222EE4
	movs r0, #0x17
	ldrsb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, #0x17]
	ldrsb r1, [r4, r0]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r1, r0
	blt _02222EE4
	movs r0, #0
	strb r0, [r4, #0x17]
	ldrb r0, [r4, #0x14]
	str r0, [sp]
	ldrh r0, [r4, #0x10]
	str r0, [sp, #4]
	ldrh r2, [r4, #0xc]
	ldrh r3, [r4, #0xe]
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #8]
	bl FUN_02003E5C
	ldrb r3, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	cmp r1, r3
	bne _02222EBA
	movs r0, #0
	add sp, #8
	str r0, [r4]
	pop {r4, pc}
_02222EBA:
	movs r0, #0x15
	ldrsb r2, [r4, r0]
	adds r1, r1, r2
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r2, #0
	ble _02222ED8
	cmp r0, r3
	ble _02222ED2
	add sp, #8
	strb r3, [r4, #0x14]
	pop {r4, pc}
_02222ED2:
	add sp, #8
	strb r1, [r4, #0x14]
	pop {r4, pc}
_02222ED8:
	cmp r0, r3
	bge _02222EE2
	add sp, #8
	strb r3, [r4, #0x14]
	pop {r4, pc}
_02222EE2:
	strb r1, [r4, #0x14]
_02222EE4:
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_02222E74

	thumb_func_start ov07_02222EE8
ov07_02222EE8: @ 0x02222EE8
	push {r4, lr}
	adds r4, r0, #0
	bne _02222EF2
	bl GF_AssertFail
_02222EF2:
	ldr r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02222EE8

	thumb_func_start ov07_02222EF8
ov07_02222EF8: @ 0x02222EF8
	push {r4, lr}
	adds r4, r0, #0
	bne _02222F02
	bl GF_AssertFail
_02222F02:
	ldr r0, [r4, #4]
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov07_02222EF8

	thumb_func_start ov07_02222F10
ov07_02222F10: @ 0x02222F10
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	movs r1, #0x1c
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02222F28
	bl GF_AssertFail
_02222F28:
	str r5, [r4, #0x18]
	str r6, [r4, #8]
	strh r7, [r4, #0xc]
	add r1, sp, #8
	ldrh r0, [r1, #0x10]
	strh r0, [r4, #0xe]
	ldrh r0, [r1, #0x24]
	strh r0, [r4, #0x10]
	ldrb r2, [r1, #0x1c]
	add r0, sp, #0x28
	ldrb r0, [r0]
	strb r2, [r4, #0x12]
	strb r0, [r4, #0x13]
	strb r2, [r4, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	strb r0, [r4, #0x16]
	strb r0, [r4, #0x17]
	ldrb r2, [r4, #0x12]
	ldrb r0, [r4, #0x13]
	cmp r2, r0
	bhs _02222F5A
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	b _02222F60
_02222F5A:
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	rsbs r0, r0, #0
_02222F60:
	strb r0, [r4, #0x15]
	movs r0, #1
	str r0, [r4]
	ldr r0, _02222F78 @ =ov07_02222E74
	ldr r2, [sp, #0x30]
	adds r1, r4, #0
	bl FUN_0200E320
	str r0, [r4, #4]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222F78: .4byte ov07_02222E74
	thumb_func_end ov07_02222F10

	thumb_func_start ov07_02222F7C
ov07_02222F7C: @ 0x02222F7C
	push {r4, r5, r6, r7}
	movs r7, #0
	cmp r1, #0
	ble _02222FBE
	movs r2, #0x97
_02222F86:
	ldrh r6, [r0]
	movs r3, #0x1f
	adds r7, r7, #1
	asrs r4, r6, #0xa
	ands r4, r3
	adds r5, r4, #0
	movs r3, #0x1d
	muls r5, r3, r5
	movs r3, #0x1f
	ands r3, r6
	movs r4, #0x4c
	muls r4, r3, r4
	asrs r6, r6, #5
	movs r3, #0x1f
	ands r3, r6
	adds r6, r3, #0
	muls r6, r2, r6
	adds r3, r4, r6
	adds r3, r5, r3
	asrs r5, r3, #8
	lsls r4, r5, #0xa
	lsls r3, r5, #5
	orrs r3, r4
	orrs r3, r5
	strh r3, [r0]
	adds r0, r0, #2
	cmp r7, r1
	blt _02222F86
_02222FBE:
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
	thumb_func_end ov07_02222F7C

	thumb_func_start ov07_02222FC4
ov07_02222FC4: @ 0x02222FC4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov07_0221FA78
	movs r1, #0
	bl FUN_02003364
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02222FE8
	adds r0, r4, #0
	movs r1, #0x30
	bl ov07_02222F7C
	pop {r3, r4, r5, pc}
_02222FE8:
	adds r0, r4, #0
	movs r1, #0x80
	bl ov07_02222F7C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02222FC4

	thumb_func_start ov07_02222FF4
ov07_02222FF4: @ 0x02222FF4
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl ov07_0221FA78
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02223020
	movs r1, #0
	str r1, [sp]
	movs r0, #0x60
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02003318
	add sp, #8
	pop {r3, r4, r5, pc}
_02223020:
	movs r1, #0
	movs r0, #1
	str r1, [sp]
	lsls r0, r0, #8
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02003318
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02222FF4

	thumb_func_start ov07_02223038
ov07_02223038: @ 0x02223038
	cmp r0, #0x54
	blo _02223040
	movs r0, #0
	bx lr
_02223040:
	lsls r1, r0, #2
	ldr r0, _02223048 @ =0x02236520
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_02223048: .4byte 0x02236520
	thumb_func_end ov07_02223038

	thumb_func_start ov07_0222304C
ov07_0222304C: @ 0x0222304C
	cmp r0, #0x21
	blo _02223054
	movs r0, #0
	bx lr
_02223054:
	lsls r1, r0, #2
	ldr r0, _0222305C @ =0x0223649C
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_0222305C: .4byte 0x0223649C
	thumb_func_end ov07_0222304C

	thumb_func_start ov07_02223060
ov07_02223060: @ 0x02223060
	bx lr
	.align 2, 0
	thumb_func_end ov07_02223060

	thumb_func_start ov07_02223064
ov07_02223064: @ 0x02223064
	push {r4, lr}
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02223076
	cmp r0, #1
	beq _0222307C
	pop {r4, pc}
_02223076:
	adds r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_0222307C:
	ldr r0, [r4, #4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov07_02223064

	thumb_func_start ov07_0222308C
ov07_0222308C: @ 0x0222308C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	movs r1, #8
	bl FUN_0201AA8C
	adds r2, r0, #0
	movs r0, #0
	strb r0, [r2]
	movs r3, #1
	ldr r1, _022230B0 @ =ov07_02223064
	adds r0, r4, #0
	lsls r3, r3, #0xc
	str r4, [r2, #4]
	bl ov07_0221C3F4
	pop {r4, pc}
	nop
_022230B0: .4byte ov07_02223064
	thumb_func_end ov07_0222308C

	thumb_func_start ov07_022230B4
ov07_022230B4: @ 0x022230B4
	push {r4, lr}
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _022230C6
	cmp r0, #1
	beq _022230CC
	pop {r4, pc}
_022230C6:
	adds r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_022230CC:
	ldr r0, [r4, #4]
	adds r1, r2, #0
	bl ov07_0221C458
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov07_022230B4

	thumb_func_start ov07_022230DC
ov07_022230DC: @ 0x022230DC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	movs r1, #8
	bl FUN_0201AA8C
	adds r2, r0, #0
	movs r0, #0
	strb r0, [r2]
	movs r3, #1
	ldr r1, _02223100 @ =ov07_022230B4
	adds r0, r4, #0
	lsls r3, r3, #0xc
	str r4, [r2, #4]
	bl ov07_0221C42C
	pop {r4, pc}
	nop
_02223100: .4byte ov07_022230B4
	thumb_func_end ov07_022230DC

	thumb_func_start ov07_02223104
ov07_02223104: @ 0x02223104
	push {r4, lr}
	adds r4, r1, #0
	ldrb r1, [r4]
	cmp r1, #0
	beq _02223114
	cmp r1, #1
	beq _0222311A
	pop {r4, pc}
_02223114:
	adds r0, r1, #1
	strb r0, [r4]
	pop {r4, pc}
_0222311A:
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02223104

	thumb_func_start ov07_02223128
ov07_02223128: @ 0x02223128
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	movs r1, #8
	bl FUN_0201AA8C
	adds r1, r0, #0
	movs r0, #0
	strb r0, [r1]
	movs r2, #1
	ldr r0, _02223148 @ =ov07_02223104
	lsls r2, r2, #0xc
	str r4, [r1, #4]
	bl FUN_0200E320
	pop {r4, pc}
	.align 2, 0
_02223148: .4byte ov07_02223104
	thumb_func_end ov07_02223128

	thumb_func_start ov07_0222314C
ov07_0222314C: @ 0x0222314C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0222315E
	cmp r0, #1
	beq _022231A4
	pop {r4, r5, r6, pc}
_0222315E:
	ldr r0, [r5, #0x14]
	ldr r0, [r0]
	bl FUN_0200DC0C
	ldr r0, [r5, #0x18]
	ldr r0, [r0]
	bl FUN_0200DC0C
	ldr r0, [r5, #0x1c]
	ldr r0, [r0]
	bl FUN_0200DC0C
	ldr r0, [r5, #0x14]
	movs r1, #1
	ldr r0, [r0]
	movs r2, #0
	bl FUN_0200DEA0
	ldr r0, [r5, #0x18]
	movs r1, #0
	ldr r0, [r0]
	mvns r1, r1
	movs r2, #0
	bl FUN_0200DEA0
	ldr r0, [r5, #0x1c]
	movs r1, #1
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200DEA0
	ldr r0, [r5, #0xc]
	bl FUN_0200D020
	pop {r4, r5, r6, pc}
_022231A4:
	ldr r0, [r5, #0x10]
	ldr r4, [r5, #4]
	bl FUN_0200D9DC
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov07_0221C448
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0222314C

	thumb_func_start ov07_022231BC
ov07_022231BC: @ 0x022231BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r6, r1, #0
	movs r1, #0x73
	str r0, [sp]
	movs r0, #5
	lsls r1, r1, #2
	adds r7, r2, #0
	adds r5, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _022231DA
	bl GF_AssertFail
_022231DA:
	movs r0, #0
	strb r0, [r4]
	str r6, [r4, #8]
	str r7, [r4, #0xc]
	ldr r0, [sp]
	str r5, [r4, #0x10]
	str r0, [r4, #4]
	ldr r1, [sp]
	add r0, sp, #4
	bl ov07_0221F9E8
	str r5, [r4, #0x14]
	movs r6, #1
	adds r5, r4, #4
	add r7, sp, #4
_022231F8:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	adds r2, r7, #0
	bl FUN_0200D734
	str r0, [r5, #0x14]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #3
	blt _022231F8
	movs r3, #1
	ldr r0, [sp]
	ldr r1, _02223220 @ =ov07_0222314C
	adds r2, r4, #0
	lsls r3, r3, #0xc
	bl ov07_0221C3F4
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223220: .4byte ov07_0222314C
	thumb_func_end ov07_022231BC

	thumb_func_start ov07_02223224
ov07_02223224: @ 0x02223224
	push {r4, lr}
	movs r1, #0xc
	adds r2, r1, #0
	adds r2, #0xf4
	adds r4, r0, #0
	bl FUN_020087A4
	movs r1, #0xd
	adds r2, r1, #0
	adds r0, r4, #0
	adds r2, #0xf3
	bl FUN_020087A4
	pop {r4, pc}
	thumb_func_end ov07_02223224

	thumb_func_start ov07_02223240
ov07_02223240: @ 0x02223240
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r2, r0, #0
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _02223252
	cmp r0, #1
	beq _02223274
	b _0222333E
_02223252:
	movs r0, #0x26
	ldrsh r0, [r5, r0]
	movs r1, #0x20
	movs r2, #0x22
	str r0, [sp]
	movs r3, #0x24
	adds r0, r5, #0
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	adds r0, #0x7c
	bl ov07_022227A8
	ldrb r0, [r5, #4]
	adds r0, r0, #1
	strb r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02223274:
	adds r0, r5, #0
	adds r0, #0x7c
	bl ov07_022227D8
	cmp r0, #0
	bne _02223288
	ldrb r0, [r5, #4]
	adds r0, r0, #1
	strb r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02223288:
	ldr r2, [r5, #0x28]
	movs r1, #1
	lsls r1, r1, #8
	adds r0, r2, #0
	ands r0, r1
	cmp r0, r1
	bne _022232D4
	ldr r0, [r5]
	movs r6, #0
	cmp r0, #0
	ble _02223322
	adds r4, r5, #0
	movs r7, #0x32
_022232A2:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _022232C8
	movs r2, #0x7c
	movs r3, #0x30
	ldrsh r2, [r5, r2]
	ldrsh r3, [r4, r3]
	movs r1, #0
	adds r2, r2, r3
	bl FUN_020087A4
	movs r2, #0x7e
	ldrsh r3, [r5, r2]
	ldrsh r2, [r4, r7]
	ldr r0, [r4, #0x34]
	movs r1, #1
	adds r2, r3, r2
	bl FUN_020087A4
_022232C8:
	ldr r0, [r5]
	adds r6, r6, #1
	adds r4, #0x14
	cmp r6, r0
	blt _022232A2
	b _02223322
_022232D4:
	lsls r0, r1, #1
	ands r2, r0
	cmp r2, r0
	bne _02223322
	ldr r0, [r5]
	movs r6, #0
	cmp r0, #0
	ble _0222331C
	adds r4, r5, #0
	movs r7, #0x32
_022232E8:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _02223312
	movs r1, #0x7c
	movs r2, #0x30
	ldrsh r1, [r5, r1]
	ldrsh r2, [r4, r2]
	adds r1, r1, r2
	movs r2, #0x7e
	ldrsh r3, [r5, r2]
	ldrsh r2, [r4, r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r0, [r4, #0x38]
	bl FUN_0200DC18
_02223312:
	ldr r0, [r5]
	adds r6, r6, #1
	adds r4, #0x14
	cmp r6, r0
	blt _022232E8
_0222331C:
	ldr r0, [r5, #0x10]
	bl FUN_0200D020
_02223322:
	movs r0, #1
	ldr r1, [r5, #0x28]
	lsls r0, r0, #0xa
	ands r1, r0
	cmp r1, r0
	bne _0222334C
	movs r3, #0x7c
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x18]
	movs r1, #3
	movs r2, #0
	bl FUN_0201BC8C
	pop {r3, r4, r5, r6, r7, pc}
_0222333E:
	ldr r0, [r5, #8]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r5, #0
	bl FUN_0201AB0C
_0222334C:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_02223240

	thumb_func_start ov07_02223350
ov07_02223350: @ 0x02223350
	push {r3, r4, r5, lr}
	movs r1, #0xa0
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #4
	bl ov07_02231FE4
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	strh r0, [r4, #0x20]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0x22]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	strh r0, [r4, #0x24]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #0x26]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	movs r2, #1
	lsls r2, r2, #8
	str r0, [r4, #0x28]
	adds r1, r0, #0
	ands r0, r2
	cmp r0, r2
	bne _022233B0
	adds r2, r4, #0
	adds r0, r5, #0
	adds r2, #0x2c
	adds r3, r4, #0
	bl ov07_02232020
	b _022233C6
_022233B0:
	lsls r0, r2, #1
	adds r3, r1, #0
	ands r3, r0
	cmp r3, r0
	bne _022233C6
	adds r2, r4, #0
	adds r0, r5, #0
	adds r2, #0x2c
	adds r3, r4, #0
	bl ov07_022323FC
_022233C6:
	ldr r0, [r4, #8]
	ldr r1, _022233D4 @ =ov07_02223240
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_022233D4: .4byte ov07_02223240
	thumb_func_end ov07_02223350

	thumb_func_start ov07_022233D8
ov07_022233D8: @ 0x022233D8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4, #0x1c]
	cmp r0, #3
	bhi _022234A2
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022233F0: @ jump table
	.2byte _022233F8 - _022233F0 - 2 @ case 0
	.2byte _02223416 - _022233F0 - 2 @ case 1
	.2byte _02223458 - _022233F0 - 2 @ case 2
	.2byte _02223464 - _022233F0 - 2 @ case 3
_022233F8:
	ldrh r0, [r4, #0x18]
	movs r1, #4
	movs r2, #0x39
	str r0, [sp]
	ldrh r3, [r4, #0x16]
	ldr r0, _02223544 @ =0x04000050
	blx FUN_020CF15C
	movs r0, #2
	movs r1, #1
	bl FUN_0201BC28
	ldrb r0, [r4, #0x1c]
	adds r0, r0, #1
	strb r0, [r4, #0x1c]
_02223416:
	ldrh r1, [r4, #8]
	ldrh r2, [r4, #0x16]
	movs r0, #0
	subs r1, r1, #2
	cmp r2, r1
	bge _02223428
	adds r1, r2, #2
	strh r1, [r4, #0x16]
	b _0222342A
_02223428:
	adds r0, r0, #1
_0222342A:
	ldrh r1, [r4, #0x18]
	cmp r1, #9
	bls _02223436
	subs r1, r1, #2
	strh r1, [r4, #0x18]
	b _02223438
_02223436:
	adds r0, r0, #1
_02223438:
	cmp r0, #2
	bne _0222344A
	ldrh r0, [r4, #8]
	strh r0, [r4, #0x16]
	movs r0, #7
	strh r0, [r4, #0x18]
	ldrb r0, [r4, #0x1c]
	adds r0, r0, #1
	strb r0, [r4, #0x1c]
_0222344A:
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x16]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _02223548 @ =0x04000052
	strh r1, [r0]
	b _022234BA
_02223458:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _022234BA
	adds r0, r0, #1
	strb r0, [r4, #0x1c]
	b _022234BA
_02223464:
	ldrh r0, [r4, #0x16]
	movs r1, #0
	cmp r0, #2
	bls _02223472
	subs r0, r0, #2
	strh r0, [r4, #0x16]
	b _02223474
_02223472:
	adds r1, r1, #1
_02223474:
	ldrh r0, [r4, #0x18]
	cmp r0, #0x1d
	bhs _02223480
	adds r0, r0, #2
	strh r0, [r4, #0x18]
	b _02223482
_02223480:
	adds r1, r1, #1
_02223482:
	cmp r1, #2
	bne _02223494
	movs r0, #0
	strh r0, [r4, #0x16]
	movs r0, #0x1f
	strh r0, [r4, #0x18]
	ldrb r0, [r4, #0x1c]
	adds r0, r0, #1
	strb r0, [r4, #0x1c]
_02223494:
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x16]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _02223548 @ =0x04000052
	strh r1, [r0]
	b _022234BA
_022234A2:
	movs r0, #2
	movs r1, #0
	bl FUN_0201BC28
	ldr r0, [r4, #0x20]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
_022234BA:
	movs r1, #0x10
	ldrsh r3, [r4, r1]
	cmp r3, #0
	ble _022234CC
	movs r0, #0xc
	ldrsh r2, [r4, r0]
	lsls r0, r1, #5
	cmp r2, r0
	bge _022234DA
_022234CC:
	cmp r3, #0
	bge _022234DE
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r0, _0222354C @ =0xFFFFFE64
	cmp r1, r0
	bgt _022234DE
_022234DA:
	movs r0, #1
	str r0, [r4, #4]
_022234DE:
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	movs r0, #0xe
	ldrsh r0, [r4, r0]
	adds r0, r1, r0
	strh r0, [r4, #0xa]
	movs r0, #0xc
	ldrsh r2, [r4, r0]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	adds r1, r2, r1
	strh r1, [r4, #0xc]
	ldrh r2, [r4, #0x12]
	ldrh r1, [r4, #0x14]
	cmp r2, r1
	bhs _02223522
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _02223508
	adds r0, r0, #1
	b _0222350A
_02223508:
	movs r0, #0
_0222350A:
	strh r0, [r4, #0x10]
	movs r0, #0xe
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _02223518
	adds r0, r0, #1
	b _0222351A
_02223518:
	movs r0, #0
_0222351A:
	strh r0, [r4, #0xe]
	movs r0, #0
	strh r0, [r4, #0x14]
	b _02223526
_02223522:
	adds r0, r1, #1
	strh r0, [r4, #0x14]
_02223526:
	movs r3, #0xa
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	movs r1, #2
	movs r2, #0
	bl FUN_0201BC8C
	movs r3, #0xc
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	movs r1, #2
	movs r2, #3
	bl FUN_0201BC8C
	pop {r3, r4, r5, pc}
	.align 2, 0
_02223544: .4byte 0x04000050
_02223548: .4byte 0x04000052
_0222354C: .4byte 0xFFFFFE64
	thumb_func_end ov07_022233D8

	thumb_func_start ov07_02223550
ov07_02223550: @ 0x02223550
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r1, #0xb8
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x1c
	bl ov07_02231FE4
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0xa]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #0xe]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	str r0, [r4]
	adds r0, r5, #0
	movs r1, #6
	bl ov07_0221C4A8
	strh r0, [r4, #8]
	adds r0, r5, #0
	movs r1, #7
	bl ov07_0221C4A8
	strh r0, [r4, #0x12]
	movs r0, #0
	strh r0, [r4, #0x14]
	ldr r0, [r4]
	cmp r0, #0
	beq _022235FC
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _022235FC
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	subs r0, #0xb
	muls r0, r1, r0
	strh r0, [r4, #0xa]
	movs r1, #0xc
	adds r0, r1, #0
	ldrsh r2, [r4, r1]
	subs r0, #0xd
	muls r0, r2, r0
	strh r0, [r4, #0xc]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	subs r0, #0xf
	muls r0, r2, r0
	strh r0, [r4, #0xe]
	movs r0, #0x10
	ldrsh r2, [r4, r0]
	subs r0, #0x11
	muls r0, r2, r0
	strh r0, [r4, #0x10]
	ldrsh r0, [r4, r1]
	subs r0, #0x54
	strh r0, [r4, #0xc]
	b _02223604
_022235FC:
	movs r0, #0xc
	ldrsh r0, [r4, r0]
	adds r0, #0x54
	strh r0, [r4, #0xc]
_02223604:
	movs r1, #0
	strh r1, [r4, #0x16]
	movs r0, #0x1f
	strh r0, [r4, #0x18]
	movs r0, #2
	str r1, [r4, #4]
	bl FUN_0201BC28
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	movs r1, #0
	adds r7, r0, #0
	bl ov07_0221FB7C
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov07_0221BFD0
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x30]
	movs r0, #7
	adds r1, r6, #0
	movs r3, #2
	bl FUN_020078F0
	adds r0, r7, #0
	movs r1, #1
	bl ov07_0221FB7C
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov07_0221BFD0
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x90
	str r0, [sp, #8]
	ldr r0, [r4, #0x34]
	movs r1, #7
	adds r2, r6, #0
	bl FUN_02003200
	ldr r0, [r4, #0x30]
	movs r1, #2
	bl FUN_0201CAE0
	adds r0, r5, #0
	movs r6, #2
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02223684
	movs r6, #4
	b _02223698
_02223684:
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _02223698
	movs r6, #3
_02223698:
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov07_0221FB7C
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov07_0221BFD0
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x30]
	movs r0, #7
	adds r1, r6, #0
	movs r3, #2
	bl FUN_02007914
	movs r3, #0xa
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	movs r1, #2
	movs r2, #0
	bl FUN_0201BC8C
	movs r3, #0xc
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	movs r1, #2
	movs r2, #3
	bl FUN_0201BC8C
	ldr r0, [r4, #0x20]
	ldr r1, _022236EC @ =ov07_022233D8
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022236EC: .4byte ov07_022233D8
	thumb_func_end ov07_02223550

	thumb_func_start ov07_022236F0
ov07_022236F0: @ 0x022236F0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4, #0x1c]
	cmp r0, #3
	bhi _022237B6
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02223708: @ jump table
	.2byte _02223710 - _02223708 - 2 @ case 0
	.2byte _0222372E - _02223708 - 2 @ case 1
	.2byte _0222376C - _02223708 - 2 @ case 2
	.2byte _02223778 - _02223708 - 2 @ case 3
_02223710:
	ldrh r0, [r4, #0x18]
	movs r1, #4
	movs r2, #0x39
	str r0, [sp]
	ldrh r3, [r4, #0x16]
	ldr r0, _02223858 @ =0x04000050
	blx FUN_020CF15C
	movs r0, #2
	movs r1, #1
	bl FUN_0201BC28
	ldrb r0, [r4, #0x1c]
	adds r0, r0, #1
	strb r0, [r4, #0x1c]
_0222372E:
	ldrh r0, [r4, #0x16]
	movs r1, #0
	cmp r0, #0x10
	bhs _0222373C
	adds r0, r0, #2
	strh r0, [r4, #0x16]
	b _0222373E
_0222373C:
	adds r1, r1, #1
_0222373E:
	ldrh r0, [r4, #0x18]
	cmp r0, #4
	bls _0222374A
	subs r0, r0, #2
	strh r0, [r4, #0x18]
	b _0222374C
_0222374A:
	adds r1, r1, #1
_0222374C:
	cmp r1, #2
	bne _0222375E
	movs r0, #0x10
	strh r0, [r4, #0x16]
	movs r0, #4
	strh r0, [r4, #0x18]
	ldrb r0, [r4, #0x1c]
	adds r0, r0, #1
	strb r0, [r4, #0x1c]
_0222375E:
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x16]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0222385C @ =0x04000052
	strh r1, [r0]
	b _022237CE
_0222376C:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _022237CE
	adds r0, r0, #1
	strb r0, [r4, #0x1c]
	b _022237CE
_02223778:
	ldrh r0, [r4, #0x16]
	movs r1, #0
	cmp r0, #2
	bls _02223786
	subs r0, r0, #2
	strh r0, [r4, #0x16]
	b _02223788
_02223786:
	adds r1, r1, #1
_02223788:
	ldrh r0, [r4, #0x18]
	cmp r0, #0x10
	bhs _02223794
	adds r0, r0, #2
	strh r0, [r4, #0x18]
	b _02223796
_02223794:
	adds r1, r1, #1
_02223796:
	cmp r1, #2
	bne _022237A8
	movs r0, #0
	strh r0, [r4, #0x16]
	movs r0, #0x1f
	strh r0, [r4, #0x18]
	ldrb r0, [r4, #0x1c]
	adds r0, r0, #1
	strb r0, [r4, #0x1c]
_022237A8:
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x16]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0222385C @ =0x04000052
	strh r1, [r0]
	b _022237CE
_022237B6:
	movs r0, #2
	movs r1, #0
	bl FUN_0201BC28
	ldr r0, [r4, #0x20]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
_022237CE:
	movs r1, #0x10
	ldrsh r3, [r4, r1]
	cmp r3, #0
	ble _022237E0
	movs r0, #0xc
	ldrsh r2, [r4, r0]
	lsls r0, r1, #5
	cmp r2, r0
	bge _022237EE
_022237E0:
	cmp r3, #0
	bge _022237F2
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r0, _02223860 @ =0xFFFFFE64
	cmp r1, r0
	bgt _022237F2
_022237EE:
	movs r0, #1
	str r0, [r4, #4]
_022237F2:
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	movs r0, #0xe
	ldrsh r0, [r4, r0]
	adds r0, r1, r0
	strh r0, [r4, #0xa]
	movs r0, #0xc
	ldrsh r2, [r4, r0]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	adds r1, r2, r1
	strh r1, [r4, #0xc]
	ldrh r2, [r4, #0x12]
	ldrh r1, [r4, #0x14]
	cmp r2, r1
	bhs _02223836
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _0222381C
	adds r0, r0, #1
	b _0222381E
_0222381C:
	movs r0, #0
_0222381E:
	strh r0, [r4, #0x10]
	movs r0, #0xe
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _0222382C
	adds r0, r0, #1
	b _0222382E
_0222382C:
	movs r0, #0
_0222382E:
	strh r0, [r4, #0xe]
	movs r0, #0
	strh r0, [r4, #0x14]
	b _0222383A
_02223836:
	adds r0, r1, #1
	strh r0, [r4, #0x14]
_0222383A:
	movs r3, #0xa
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	movs r1, #2
	movs r2, #0
	bl FUN_0201BC8C
	movs r3, #0xc
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	movs r1, #2
	movs r2, #3
	bl FUN_0201BC8C
	pop {r3, r4, r5, pc}
	.align 2, 0
_02223858: .4byte 0x04000050
_0222385C: .4byte 0x04000052
_02223860: .4byte 0xFFFFFE64
	thumb_func_end ov07_022236F0

	thumb_func_start ov07_02223864
ov07_02223864: @ 0x02223864
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r1, #0xb8
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x1c
	bl ov07_02231FE4
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0xa]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #0xe]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	str r0, [r4]
	adds r0, r5, #0
	movs r1, #6
	bl ov07_0221C4A8
	strh r0, [r4, #8]
	adds r0, r5, #0
	movs r1, #7
	bl ov07_0221C4A8
	strh r0, [r4, #0x12]
	movs r0, #0
	strh r0, [r4, #0x14]
	ldr r0, [r4]
	cmp r0, #0
	beq _02223910
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _02223910
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	subs r0, #0xb
	muls r0, r1, r0
	strh r0, [r4, #0xa]
	movs r1, #0xc
	adds r0, r1, #0
	ldrsh r2, [r4, r1]
	subs r0, #0xd
	muls r0, r2, r0
	strh r0, [r4, #0xc]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	subs r0, #0xf
	muls r0, r2, r0
	strh r0, [r4, #0xe]
	movs r0, #0x10
	ldrsh r2, [r4, r0]
	subs r0, #0x11
	muls r0, r2, r0
	strh r0, [r4, #0x10]
	ldrsh r0, [r4, r1]
	subs r0, #0x54
	strh r0, [r4, #0xc]
	b _02223918
_02223910:
	movs r0, #0xc
	ldrsh r0, [r4, r0]
	adds r0, #0x54
	strh r0, [r4, #0xc]
_02223918:
	adds r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0222392C
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	subs r0, #0xf
	muls r0, r1, r0
	strh r0, [r4, #0xe]
_0222392C:
	movs r0, #4
	strh r0, [r4, #0x16]
	movs r0, #0x10
	strh r0, [r4, #0x18]
	movs r1, #0
	strh r1, [r4, #0x16]
	strh r0, [r4, #0x18]
	movs r0, #2
	str r1, [r4, #4]
	bl FUN_0201BC28
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	movs r1, #0
	adds r7, r0, #0
	bl ov07_0221FB7C
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov07_0221BFD0
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x30]
	movs r0, #7
	adds r1, r6, #0
	movs r3, #2
	bl FUN_020078F0
	adds r0, r7, #0
	movs r1, #1
	bl ov07_0221FB7C
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov07_0221BFD0
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x90
	str r0, [sp, #8]
	ldr r0, [r4, #0x34]
	movs r1, #7
	adds r2, r6, #0
	bl FUN_02003200
	ldr r0, [r4, #0x30]
	movs r1, #2
	bl FUN_0201CAE0
	adds r0, r5, #0
	movs r6, #2
	bl ov07_0221BFC0
	cmp r0, #1
	bne _022239B2
	movs r6, #4
	b _022239C6
_022239B2:
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _022239C6
	movs r6, #3
_022239C6:
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov07_0221FB7C
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov07_0221BFD0
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x30]
	movs r0, #7
	adds r1, r6, #0
	movs r3, #2
	bl FUN_02007914
	movs r3, #0xa
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	movs r1, #2
	movs r2, #0
	bl FUN_0201BC8C
	movs r3, #0xc
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	movs r1, #2
	movs r2, #3
	bl FUN_0201BC8C
	ldr r0, [r4, #0x20]
	ldr r1, _02223A18 @ =ov07_022236F0
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02223A18: .4byte ov07_022236F0
	thumb_func_end ov07_02223864

	thumb_func_start ov07_02223A1C
ov07_02223A1C: @ 0x02223A1C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02223A32
	cmp r0, #1
	beq _02223A32
	cmp r0, #2
	beq _02223A64
	pop {r3, r4, r5, pc}
_02223A32:
	adds r0, r4, #0
	adds r0, #0xc
	bl ov07_02222440
	cmp r0, #1
	bne _02223A4E
	ldr r2, [r4, #0xc]
	ldr r0, [r4, #8]
	lsls r2, r2, #0x10
	movs r1, #9
	lsrs r2, r2, #0x10
	bl FUN_020087A4
	pop {r3, r4, r5, pc}
_02223A4E:
	adds r0, r4, #0
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x20]
	ldr r3, [r4, #0x24]
	adds r0, #0xc
	bl ov07_022223F0
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02223A64:
	ldr r0, [r4, #8]
	movs r1, #0xa
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4, #8]
	movs r1, #0xb
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4, #8]
	movs r1, #9
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02223A1C

	thumb_func_start ov07_02223A94
ov07_02223A94: @ 0x02223A94
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov07_0221BFD0
	movs r1, #0x2c
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4]
	str r5, [r4, #4]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #0x24]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #0x20]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	adds r7, r0, #0
	beq _02223ACE
	cmp r7, #2
	bne _02223AD8
_02223ACE:
	ldr r0, [r4, #4]
	bl ov07_0221C470
	str r0, [sp]
	b _02223AE0
_02223AD8:
	ldr r0, [r4, #4]
	bl ov07_0221C468
	str r0, [sp]
_02223AE0:
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	adds r2, r0, #0
	adds r0, r4, #0
	ldr r1, [r4, #0x20]
	ldr r3, [r4, #0x24]
	adds r0, #0xc
	bl ov07_022223F0
	ldr r1, [sp]
	adds r0, r5, #0
	bl ov07_02222004
	adds r6, r0, #0
	ldr r0, [r4, #0x14]
	adds r1, r0, #0
	muls r1, r6, r1
	str r1, [r4, #0x14]
	cmp r7, #2
	bne _02223B12
	movs r0, #0
	mvns r0, r0
	muls r6, r0, r6
_02223B12:
	ldr r0, [r4, #4]
	ldr r1, [sp]
	bl ov07_0221FA48
	str r0, [r4, #8]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	cmp r0, #1
	bne _02223B3C
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	strh r0, [r4, #0x28]
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	b _02223B44
_02223B3C:
	movs r0, #0x28
	adds r1, r6, #0
	muls r1, r0, r1
	strh r1, [r4, #0x28]
_02223B44:
	strh r0, [r4, #0x2a]
	movs r2, #0x28
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	movs r1, #0xa
	bl FUN_020087A4
	movs r2, #0x2a
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	movs r1, #0xb
	bl FUN_020087A4
	ldr r0, [r4, #4]
	ldr r1, _02223B6C @ =ov07_02223A1C
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223B6C: .4byte ov07_02223A1C
	thumb_func_end ov07_02223A94

	thumb_func_start ov07_02223B70
ov07_02223B70: @ 0x02223B70
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0x2c
	movs r2, #0x2e
	adds r5, r0, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x28]
	adds r0, r4, #4
	bl ov07_02222240
	cmp r0, #0
	bne _02223BBC
	movs r2, #0x2c
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x28]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x2e
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x28]
	movs r1, #1
	subs r2, #8
	bl FUN_020087A4
	ldr r0, [r4, #0x28]
	movs r1, #9
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_02223BBC:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02223B70

	thumb_func_start ov07_02223BC0
ov07_02223BC0: @ 0x02223BC0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov07_0221BFD0
	movs r1, #0x30
	bl FUN_0201AA8C
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	str r5, [r4]
	bl ov07_0221C4A8
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	adds r2, r0, #0
	adds r0, r4, #4
	adds r1, r6, #0
	bl ov07_02222A44
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	cmp r0, #8
	bgt _02223C0A
	cmp r0, #2
	blt _02223C7C
	beq _02223C10
	cmp r0, #4
	beq _02223C2C
	cmp r0, #8
	beq _02223C50
	b _02223C7C
_02223C0A:
	cmp r0, #0x10
	beq _02223C62
	b _02223C7C
_02223C10:
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x28]
	movs r0, #0
	ldr r1, [r4, #0x10]
	mvns r0, r0
	muls r0, r1, r0
	str r0, [r4, #0x10]
	b _02223C80
_02223C2C:
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0223197C
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x28]
	movs r0, #0
	ldr r1, [r4, #0x10]
	mvns r0, r0
	muls r0, r1, r0
	str r0, [r4, #0x10]
	b _02223C80
_02223C50:
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x28]
	b _02223C80
_02223C62:
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0223197C
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x28]
	b _02223C80
_02223C7C:
	bl GF_AssertFail
_02223C80:
	ldr r0, [r4, #0x28]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x28]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0x2e]
	movs r0, #0x2e
	ldrsh r0, [r4, r0]
	ldr r1, _02223CA8 @ =ov07_02223B70
	adds r2, r4, #0
	adds r0, #8
	strh r0, [r4, #0x2e]
	ldr r0, [r4]
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	.align 2, 0
_02223CA8: .4byte ov07_02223B70
	thumb_func_end ov07_02223BC0

	thumb_func_start ov07_02223CAC
ov07_02223CAC: @ 0x02223CAC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	adds r4, r1, #0
	movs r1, #1
	adds r6, r2, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x14]
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0200DDB8
	movs r0, #0
	str r0, [r5, #0x40]
	movs r0, #4
	movs r1, #0xa
	adds r5, #0x18
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #0xe
	bl ov07_02222508
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_02223CAC

	thumb_func_start ov07_02223CE4
ov07_02223CE4: @ 0x02223CE4
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x14]
	adds r0, #0x18
	bl ov07_02222748
	cmp r0, #0
	bne _02223D20
	ldr r0, [r4, #0x40]
	cmp r0, #0
	beq _02223D0A
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0200DCE8
	add sp, #4
	movs r0, #1
	pop {r3, r4, pc}
_02223D0A:
	movs r0, #1
	str r0, [r4, #0x40]
	movs r0, #2
	adds r4, #0x18
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0xa
	movs r3, #0xc
	bl ov07_02222508
_02223D20:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov07_02223CE4

	thumb_func_start ov07_02223D28
ov07_02223D28: @ 0x02223D28
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x48]
	movs r5, #0
	cmp r1, #4
	bhi _02223DC0
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02223D40: @ jump table
	.2byte _02223D4A - _02223D40 - 2 @ case 0
	.2byte _02223D70 - _02223D40 - 2 @ case 1
	.2byte _02223D80 - _02223D40 - 2 @ case 2
	.2byte _02223DAE - _02223D40 - 2 @ case 3
	.2byte _02223DBE - _02223D40 - 2 @ case 4
_02223D4A:
	movs r1, #0x4c
	ldrsh r3, [r4, r1]
	ldr r2, [r4, #0x3c]
	movs r1, #0x18
	muls r1, r2, r1
	movs r2, #0x4e
	ldrsh r2, [r4, r2]
	adds r1, r3, r1
	lsls r1, r1, #0x10
	subs r2, #0x10
	lsls r2, r2, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov07_02223CAC
	ldr r0, [r4, #0x48]
	adds r0, r0, #1
	str r0, [r4, #0x48]
	b _02223DC0
_02223D70:
	bl ov07_02223CE4
	cmp r0, #0
	beq _02223DC0
	ldr r0, [r4, #0x48]
	adds r0, r0, #1
	str r0, [r4, #0x48]
	b _02223DC0
_02223D80:
	ldr r1, [r4, #0x44]
	subs r1, r1, #1
	str r1, [r4, #0x44]
	bpl _02223DC0
	ldr r1, [r4, #0x48]
	adds r1, r1, #1
	str r1, [r4, #0x48]
	movs r1, #0x4c
	ldrsh r3, [r4, r1]
	ldr r2, [r4, #0x3c]
	movs r1, #0x18
	muls r1, r2, r1
	movs r2, #0x4e
	ldrsh r2, [r4, r2]
	subs r1, r3, r1
	lsls r1, r1, #0x10
	subs r2, #0x18
	lsls r2, r2, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov07_02223CAC
	b _02223DC0
_02223DAE:
	bl ov07_02223CE4
	cmp r0, #0
	beq _02223DC0
	ldr r0, [r4, #0x48]
	adds r0, r0, #1
	str r0, [r4, #0x48]
	b _02223DC0
_02223DBE:
	movs r5, #1
_02223DC0:
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02223D28

	thumb_func_start ov07_02223DC4
ov07_02223DC4: @ 0x02223DC4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02223DD6
	cmp r0, #1
	beq _02223DE8
	b _02223DFE
_02223DD6:
	adds r0, r4, #0
	bl ov07_02223D28
	cmp r0, #0
	beq _02223DFE
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _02223DFE
_02223DE8:
	ldr r0, [r4, #0x14]
	bl FUN_0200D9DC
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
_02223DFE:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02223DC4

	thumb_func_start ov07_02223E08
ov07_02223E08: @ 0x02223E08
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	movs r1, #0x50
	adds r5, r0, #0
	str r2, [sp]
	adds r6, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4]
	ldr r0, [sp]
	str r7, [r4, #4]
	str r0, [r4, #8]
	str r6, [r4, #0x14]
	adds r0, r6, #0
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0200DD54
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #4
	str r0, [r4, #0x44]
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	str r0, [r4, #0x3c]
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	movs r1, #0
	adds r5, r0, #0
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	ldr r0, [r4]
	ldr r1, _02223E90 @ =ov07_02223DC4
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223E90: .4byte ov07_02223DC4
	thumb_func_end ov07_02223E08

	thumb_func_start ov07_02223E94
ov07_02223E94: @ 0x02223E94
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	bl FUN_02003B44
	cmp r0, #0
	bne _02223EB2
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
_02223EB2:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02223E94

	thumb_func_start ov07_02223EB4
ov07_02223EB4: @ 0x02223EB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r1, #8
	adds r5, r0, #0
	bl ov07_022324D8
	adds r6, r0, #0
	str r5, [r6]
	adds r0, r5, #0
	bl ov07_0221FA78
	str r0, [r6, #4]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	cmp r0, #0
	beq _02223EE2
	cmp r0, #1
	beq _02223EEE
	cmp r0, #2
	beq _02223EF4
	b _02223EFA
_02223EE2:
	adds r0, r5, #0
	bl ov07_0221E6C8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _02223EFE
_02223EEE:
	movs r4, #1
	lsls r4, r4, #8
	b _02223EFE
_02223EF4:
	movs r4, #2
	lsls r4, r4, #8
	b _02223EFE
_02223EFA:
	bl GF_AssertFail
_02223EFE:
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	ldr r1, [sp, #0xc]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	ldr r1, [sp, #0x10]
	lsls r3, r7, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r6, #4]
	movs r1, #1
	adds r2, r4, #0
	asrs r3, r3, #0x18
	bl FUN_02003370
	ldr r0, [r6]
	ldr r1, _02223F58 @ =ov07_02223E94
	adds r2, r6, #0
	bl ov07_0221C410
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02223F58: .4byte ov07_02223E94
	thumb_func_end ov07_02223EB4

	thumb_func_start ov07_02223F5C
ov07_02223F5C: @ 0x02223F5C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #5
	bhi _02224004
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02223F74: @ jump table
	.2byte _02223F80 - _02223F74 - 2 @ case 0
	.2byte _02223F98 - _02223F74 - 2 @ case 1
	.2byte _02223FAA - _02223F74 - 2 @ case 2
	.2byte _02223FBC - _02223F74 - 2 @ case 3
	.2byte _02223FD4 - _02223F74 - 2 @ case 4
	.2byte _02223FF6 - _02223F74 - 2 @ case 5
_02223F80:
	ldr r0, [r4, #0x14]
	movs r1, #0
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x18]
	ldr r3, [r4, #0x10]
	bl FUN_020090B4
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_02223F98:
	ldr r0, [r4, #4]
	bl FUN_02009138
	cmp r0, #0
	bne _02224004
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_02223FAA:
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	bne _02223FB6
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02223FBC
_02223FB6:
	subs r0, r1, #1
	str r0, [r4, #0x1c]
	pop {r3, r4, r5, pc}
_02223FBC:
	ldr r0, [r4, #0x14]
	movs r2, #0
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x18]
	ldr r3, [r4, #0x10]
	bl FUN_020090B4
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_02223FD4:
	ldr r0, [r4, #4]
	bl FUN_02009138
	cmp r0, #0
	bne _02224004
	ldr r0, [r4, #0xc]
	subs r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0
	bgt _02223FF0
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_02223FF0:
	movs r0, #0
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_02223FF6:
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
_02224004:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02223F5C

	thumb_func_start ov07_02224008
ov07_02224008: @ 0x02224008
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x20
	adds r4, r0, #0
	bl ov07_022324D8
	adds r6, r0, #0
	str r4, [r6]
	movs r1, #0
	adds r0, r4, #0
	str r1, [r6, #4]
	bl ov07_0221C4A8
	ldr r2, _022241D0 @ =0x00000802
	cmp r0, r2
	bgt _02224042
	bge _022240C8
	cmp r0, #8
	bgt _0222403C
	cmp r0, #2
	blt _0222403A
	beq _0222405A
	cmp r0, #4
	beq _0222406C
	cmp r0, #8
	beq _02224092
_0222403A:
	b _02224180
_0222403C:
	cmp r0, #0x10
	beq _022240A4
	b _02224180
_02224042:
	adds r1, r2, #6
	cmp r0, r1
	bgt _02224052
	bge _02224124
	adds r1, r2, #2
	cmp r0, r1
	beq _022240F8
	b _02224180
_02224052:
	adds r2, #0xe
	cmp r0, r2
	beq _02224154
	b _02224180
_0222405A:
	adds r0, r4, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_0222406C:
	adds r0, r4, #0
	bl ov07_0221FAB0
	cmp r0, #1
	beq _02224078
	b _02224184
_02224078:
	ldr r0, [r6]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_0223197C
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_02224092:
	adds r0, r4, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_022240A4:
	adds r0, r4, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02224184
	ldr r0, [r6]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_0223197C
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_022240C8:
	movs r7, #0xff
	movs r5, #0
_022240CC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #0
	beq _022240DC
	cmp r0, #2
	bne _022240E0
_022240DC:
	adds r7, r5, #0
	b _022240E6
_022240E0:
	adds r5, r5, #1
	cmp r5, #4
	blt _022240CC
_022240E6:
	cmp r7, #0xff
	bne _022240EC
	movs r7, #0
_022240EC:
	ldr r0, [r6]
	adds r1, r7, #0
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_022240F8:
	movs r7, #0xff
	movs r5, #0
_022240FC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #4
	bne _0222410C
	adds r7, r5, #0
	b _02224112
_0222410C:
	adds r5, r5, #1
	cmp r5, #4
	blt _022240FC
_02224112:
	cmp r7, #0xff
	bne _02224118
	movs r7, #0
_02224118:
	ldr r0, [r6]
	adds r1, r7, #0
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_02224124:
	movs r7, #0xff
	movs r5, #0
_02224128:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #1
	beq _02224138
	cmp r0, #3
	bne _0222413C
_02224138:
	adds r7, r5, #0
	b _02224142
_0222413C:
	adds r5, r5, #1
	cmp r5, #4
	blt _02224128
_02224142:
	cmp r7, #0xff
	bne _02224148
	movs r7, #0
_02224148:
	ldr r0, [r6]
	adds r1, r7, #0
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_02224154:
	movs r7, #0xff
	movs r5, #0
_02224158:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #5
	bne _02224168
	adds r7, r5, #0
	b _0222416E
_02224168:
	adds r5, r5, #1
	cmp r5, #4
	blt _02224158
_0222416E:
	cmp r7, #0xff
	bne _02224174
	movs r7, #0
_02224174:
	ldr r0, [r6]
	adds r1, r7, #0
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_02224180:
	bl GF_AssertFail
_02224184:
	ldr r0, [r6, #4]
	cmp r0, #0
	bne _02224192
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
_02224192:
	adds r0, r4, #0
	movs r1, #1
	bl ov07_0221C4A8
	str r0, [r6, #0x10]
	adds r0, r4, #0
	movs r1, #2
	bl ov07_0221C4A8
	str r0, [r6, #0xc]
	adds r0, r4, #0
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [r6, #0x14]
	adds r0, r4, #0
	movs r1, #4
	bl ov07_0221C4A8
	str r0, [r6, #0x18]
	adds r0, r4, #0
	movs r1, #5
	bl ov07_0221C4A8
	str r0, [r6, #0x1c]
	ldr r0, [r6]
	ldr r1, _022241D4 @ =ov07_02223F5C
	adds r2, r6, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022241D0: .4byte 0x00000802
_022241D4: .4byte ov07_02223F5C
	thumb_func_end ov07_02224008

	thumb_func_start ov07_022241D8
ov07_022241D8: @ 0x022241D8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #4
	bls _022241E8
	b _0222433C
_022241E8:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022241F4: @ jump table
	.2byte _022241FE - _022241F4 - 2 @ case 0
	.2byte _0222424C - _022241F4 - 2 @ case 1
	.2byte _0222429E - _022241F4 - 2 @ case 2
	.2byte _022242C8 - _022241F4 - 2 @ case 3
	.2byte _0222432A - _022241F4 - 2 @ case 4
_022241FE:
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x40]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	adds r0, #0x14
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222508
	adds r0, r4, #0
	adds r0, #0x14
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x50]
	cmp r0, #1
	bne _0222423A
	ldr r1, [sp, #8]
	movs r0, #0
	blx FUN_020F24C8
	str r0, [sp, #8]
_0222423A:
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	bl FUN_0200E024
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0222433C
_0222424C:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222558
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x14
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x50]
	cmp r0, #1
	bne _02224272
	ldr r1, [sp, #8]
	movs r0, #0
	blx FUN_020F24C8
	str r0, [sp, #8]
_02224272:
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	bl FUN_0200E024
	cmp r5, #0
	beq _02224296
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc
	movs r2, #0xe
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r3, [r4, #0x28]
	bl ov07_022226FC
	b _0222433C
_02224296:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0222433C
_0222429E:
	ldr r0, [r4, #0x4c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x3c]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	adds r0, #0x14
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222508
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0222433C
_022242C8:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222558
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x14
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x50]
	cmp r0, #1
	bne _022242EE
	ldr r1, [sp, #8]
	movs r0, #0
	blx FUN_020F24C8
	str r0, [sp, #8]
_022242EE:
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	bl FUN_0200E024
	cmp r5, #0
	beq _02224312
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc
	movs r2, #0xe
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r3, [r4, #0x28]
	bl ov07_022226FC
	b _0222433C
_02224312:
	ldr r0, [r4, #0x48]
	subs r0, r0, #1
	str r0, [r4, #0x48]
	cmp r0, #0
	bgt _02224324
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0222433C
_02224324:
	movs r0, #0
	str r0, [r4, #8]
	b _0222433C
_0222432A:
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	add sp, #0xc
	pop {r4, r5, pc}
_0222433C:
	ldr r0, [r4, #4]
	bl FUN_0200D020
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_022241D8

	thumb_func_start ov07_02224348
ov07_02224348: @ 0x02224348
	push {r4, r5, r6, lr}
	movs r1, #0x54
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4]
	adds r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	cmp r0, #0
	bne _0222438A
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	adds r6, r0, #0
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
	b _022243A8
_0222438A:
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	adds r6, r0, #0
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
_022243A8:
	strh r0, [r4, #0xe]
	adds r0, r6, #0
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0xc]
	adds r0, r6, #0
	movs r1, #0x29
	bl FUN_02008A78
	movs r1, #0xc
	ldrsh r1, [r4, r1]
	subs r0, r1, r0
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	str r0, [r4, #0x38]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #0x3c]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #0x40]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	str r0, [r4, #0x44]
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	str r0, [r4, #0x48]
	adds r0, r5, #0
	movs r1, #6
	bl ov07_0221C4A8
	str r0, [r4, #0x4c]
	adds r0, r5, #0
	movs r1, #7
	bl ov07_0221C4A8
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221C4E8
	str r0, [r4, #0x10]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0200DD54
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #0x10]
	movs r1, #2
	bl FUN_0200DF98
	ldr r1, [r4, #0x38]
	movs r2, #0x10
	ldr r0, [r4]
	subs r2, r2, r1
	bl ov07_02231E08
	ldr r0, [r4]
	ldr r1, _02224468 @ =ov07_022241D8
	adds r2, r4, #0
	bl ov07_0221C410
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	cmp r0, #0
	beq _02224456
	movs r1, #1
	b _02224458
_02224456:
	movs r1, #0
_02224458:
	ldr r0, [r4]
	bl ov07_0221FB78
	cmp r0, #1
	bne _02224466
	movs r0, #1
	str r0, [r4, #0x50]
_02224466:
	pop {r4, r5, r6, pc}
	.align 2, 0
_02224468: .4byte ov07_022241D8
	thumb_func_end ov07_02224348

	thumb_func_start ov07_0222446C
ov07_0222446C: @ 0x0222446C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #5
	bls _0222447C
	b _022245B8
_0222447C:
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02224488: @ jump table
	.2byte _02224494 - _02224488 - 2 @ case 0
	.2byte _022244D8 - _02224488 - 2 @ case 1
	.2byte _02224508 - _02224488 - 2 @ case 2
	.2byte _0222451C - _02224488 - 2 @ case 3
	.2byte _02224562 - _02224488 - 2 @ case 4
	.2byte _022245A4 - _02224488 - 2 @ case 5
_02224494:
	ldr r0, [r4, #0x40]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x44]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r1, [r4, #0x34]
	ldr r2, [r4, #0x38]
	ldr r3, [r4, #0x3c]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	adds r0, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222590
	adds r0, r4, #0
	ldr r1, [r4, #0xc]
	adds r0, #0x10
	bl ov07_02222768
	ldr r0, [r4, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_022244D8:
	adds r0, r4, #0
	ldr r1, [r4, #0xc]
	adds r0, #0x10
	bl ov07_02222788
	cmp r0, #0
	beq _022244FE
	movs r0, #0
	str r0, [sp]
	movs r1, #8
	movs r2, #0xa
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	bl ov07_022226C4
	add sp, #0xc
	pop {r4, r5, pc}
_022244FE:
	ldr r0, [r4, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_02224508:
	ldr r1, [r4, #0x50]
	cmp r1, #0
	bne _02224514
	adds r0, r0, #1
	str r0, [r4, #4]
	b _0222451C
_02224514:
	subs r0, r1, #1
	add sp, #0xc
	str r0, [r4, #0x50]
	pop {r4, r5, pc}
_0222451C:
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x44]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4, #0x4c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x40]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	adds r0, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222590
	adds r0, r4, #0
	ldr r1, [r4, #0xc]
	adds r0, #0x10
	bl ov07_02222788
	ldr r0, [r4, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_02224562:
	adds r0, r4, #0
	ldr r1, [r4, #0xc]
	adds r0, #0x10
	bl ov07_02222788
	cmp r0, #0
	beq _02224588
	movs r0, #0
	str r0, [sp]
	movs r1, #8
	movs r2, #0xa
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	bl ov07_022226C4
	add sp, #0xc
	pop {r4, r5, pc}
_02224588:
	ldr r0, [r4, #0x48]
	subs r0, r0, #1
	str r0, [r4, #0x48]
	cmp r0, #0
	bgt _0222459C
	ldr r0, [r4, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_0222459C:
	movs r0, #0
	add sp, #0xc
	str r0, [r4, #4]
	pop {r4, r5, pc}
_022245A4:
	ldr r0, [r4, #0xc]
	bl ov07_02223224
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
_022245B8:
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov07_0222446C

	thumb_func_start ov07_022245BC
ov07_022245BC: @ 0x022245BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	adds r5, r0, #0
	movs r1, #0x54
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	str r5, [r4]
	bl ov07_0221C4A8
	ldr r2, _022247C0 @ =0x00000802
	cmp r0, r2
	bgt _02224600
	bge _0222466C
	movs r2, #0x42
	lsls r2, r2, #2
	cmp r0, r2
	bgt _022245F8
	subs r1, r2, #6
	cmp r0, r1
	blt _022245F6
	beq _02224618
	subs r1, r2, #4
	cmp r0, r1
	beq _02224618
	cmp r0, r2
	beq _02224642
_022245F6:
	b _02224722
_022245F8:
	adds r2, #8
	cmp r0, r2
	beq _02224642
	b _02224722
_02224600:
	adds r1, r2, #6
	cmp r0, r1
	bgt _02224610
	bge _022246C8
	adds r1, r2, #2
	cmp r0, r1
	beq _0222469C
	b _02224722
_02224610:
	adds r2, #0xe
	cmp r0, r2
	beq _022246F8
	b _02224722
_02224618:
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
	strh r0, [r4, #0xa]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	adds r1, r0, #0
	ldr r0, [r4]
	add r2, sp, #4
	add r3, sp, #0
	bl ov07_02232020
	ldr r0, [sp, #0xc]
	str r0, [r4, #0xc]
	b _02224722
_02224642:
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
	strh r0, [r4, #0xa]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	adds r1, r0, #0
	ldr r0, [r4]
	add r2, sp, #4
	add r3, sp, #0
	bl ov07_02232020
	ldr r0, [sp, #0xc]
	str r0, [r4, #0xc]
	b _02224722
_0222466C:
	movs r7, #0xff
	movs r6, #0
_02224670:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FA04
	cmp r0, #0
	beq _02224680
	cmp r0, #2
	bne _02224684
_02224680:
	adds r7, r6, #0
	b _0222468A
_02224684:
	adds r6, r6, #1
	cmp r6, #4
	blt _02224670
_0222468A:
	cmp r7, #0xff
	bne _02224690
	movs r7, #0
_02224690:
	ldr r0, [r4]
	adds r1, r7, #0
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	b _02224722
_0222469C:
	movs r7, #0xff
	movs r6, #0
_022246A0:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FA04
	cmp r0, #4
	bne _022246B0
	adds r7, r6, #0
	b _022246B6
_022246B0:
	adds r6, r6, #1
	cmp r6, #4
	blt _022246A0
_022246B6:
	cmp r7, #0xff
	bne _022246BC
	movs r7, #0
_022246BC:
	ldr r0, [r4]
	adds r1, r7, #0
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	b _02224722
_022246C8:
	movs r7, #0xff
	movs r6, #0
_022246CC:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FA04
	cmp r0, #1
	beq _022246DC
	cmp r0, #3
	bne _022246E0
_022246DC:
	adds r7, r6, #0
	b _022246E6
_022246E0:
	adds r6, r6, #1
	cmp r6, #4
	blt _022246CC
_022246E6:
	cmp r7, #0xff
	bne _022246EC
	movs r7, #0
_022246EC:
	ldr r0, [r4]
	adds r1, r7, #0
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	b _02224722
_022246F8:
	movs r7, #0xff
	movs r6, #0
_022246FC:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FA04
	cmp r0, #5
	bne _0222470C
	adds r7, r6, #0
	b _02224712
_0222470C:
	adds r6, r6, #1
	cmp r6, #4
	blt _022246FC
_02224712:
	cmp r7, #0xff
	bne _02224718
	movs r7, #0
_02224718:
	ldr r0, [r4]
	adds r1, r7, #0
	bl ov07_0221FA48
	str r0, [r4, #0xc]
_02224722:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _02224732
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
_02224732:
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x29
	bl FUN_02008A78
	strh r0, [r4, #0xa]
	movs r0, #0xa
	ldrsh r0, [r4, r0]
	movs r1, #1
	adds r0, #0x10
	strh r0, [r4, #0xa]
	adds r0, r5, #0
	bl ov07_0221C4A8
	str r0, [r4, #0x34]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #0x38]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #0x3c]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	str r0, [r4, #0x40]
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	str r0, [r4, #0x44]
	adds r0, r5, #0
	movs r1, #6
	bl ov07_0221C4A8
	str r0, [r4, #0x48]
	adds r0, r5, #0
	movs r1, #7
	bl ov07_0221C4A8
	str r0, [r4, #0x4c]
	adds r0, r5, #0
	movs r1, #6
	bl ov07_0221C4A8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r4, #0x48]
	adds r0, r5, #0
	movs r1, #6
	bl ov07_0221C4A8
	asrs r0, r0, #0x10
	str r0, [r4, #0x50]
	ldr r0, [r4]
	ldr r1, _022247C4 @ =ov07_0222446C
	adds r2, r4, #0
	bl ov07_0221C410
	adds r1, r4, #0
	bl ov07_0222446C
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022247C0: .4byte 0x00000802
_022247C4: .4byte ov07_0222446C
	thumb_func_end ov07_022245BC

	thumb_func_start ov07_022247C8
ov07_022247C8: @ 0x022247C8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #8
	bl ov07_02222AF4
	cmp r0, #0
	beq _022247EA
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	pop {r3, r4, r5, pc}
_022247EA:
	ldr r0, [r4, #4]
	bl FUN_0200D020
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_022247C8

	thumb_func_start ov07_022247F4
ov07_022247F4: @ 0x022247F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r1, #0x30
	adds r7, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r7, [r4]
	adds r0, r7, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	adds r0, r7, #0
	movs r1, #0
	bl ov07_0221C4A8
	adds r6, r0, #0
	movs r5, #0
_02224818:
	movs r0, #1
	lsls r0, r5
	tst r0, r6
	beq _0222482E
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C4E8
	movs r1, #1
	bl FUN_0200E0FC
_0222482E:
	adds r5, r5, #1
	cmp r5, #4
	blt _02224818
	adds r0, r7, #0
	movs r1, #1
	bl ov07_0221C4A8
	adds r5, r0, #0
	adds r0, r7, #0
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r2, [sp, #8]
	adds r1, r5, #0
	bl ov07_02231E08
	adds r0, r7, #0
	movs r1, #2
	bl ov07_0221C4A8
	adds r6, r0, #0
	adds r0, r7, #0
	movs r1, #4
	bl ov07_0221C4A8
	str r0, [sp, #0xc]
	adds r0, r7, #0
	movs r1, #5
	bl ov07_0221C4A8
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #8]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	lsls r1, r5, #0x10
	lsls r2, r6, #0x10
	lsls r3, r3, #0x10
	adds r0, #8
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222AC4
	ldr r0, [r4]
	ldr r1, _0222489C @ =ov07_022247C8
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222489C: .4byte ov07_022247C8
	thumb_func_end ov07_022247F4

	thumb_func_start ov07_022248A0
ov07_022248A0: @ 0x022248A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r0, #0
	movs r1, #1
	bl ov07_0221C4A8
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl ov07_0221C4A8
	adds r1, r0, #0
	adds r0, r6, #0
	add r2, sp, #4
	add r3, sp, #0
	bl ov07_02232020
	ldr r0, [sp]
	movs r4, #0
	cmp r0, #0
	ble _022248EE
	movs r7, #6
_022248CC:
	ldr r1, [sp, #0x14]
	adds r0, r6, #0
	bl ov07_0221FAC8
	cmp r0, #1
	bne _022248DC
	cmp r5, #0
	beq _022248E6
_022248DC:
	ldr r0, [sp, #0xc]
	adds r1, r7, #0
	adds r2, r5, #0
	bl FUN_020087A4
_022248E6:
	ldr r0, [sp]
	adds r4, r4, #1
	cmp r4, r0
	blt _022248CC
_022248EE:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_022248A0

	thumb_func_start ov07_022248F4
ov07_022248F4: @ 0x022248F4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r4, #8]
	cmp r1, r0
	blt _02224942
	ldr r0, [r4]
	cmp r0, #0
	ldr r0, [r4, #0x14]
	bne _02224922
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4, #0x3c]
	adds r1, r5, #0
	bl ov07_0221C448
	pop {r3, r4, r5, pc}
_02224922:
	movs r1, #6
	bl FUN_02008A78
	adds r3, r0, #0
	movs r2, #1
	ldr r0, [r4, #0x14]
	movs r1, #6
	eors r2, r3
	bl FUN_020087A4
	ldr r0, [r4]
	subs r0, r0, #1
	str r0, [r4]
	movs r0, #0
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_02224942:
	adds r0, r1, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_022248F4

	thumb_func_start ov07_02224948
ov07_02224948: @ 0x02224948
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x40
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	str r5, [r4, #0x3c]
	bl ov07_0221C4A8
	lsls r0, r0, #1
	str r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	adds r1, r4, #0
	str r0, [r4, #8]
	adds r0, r5, #0
	adds r1, #0x20
	bl ov07_02231FE4
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0221FA48
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x3c]
	ldr r1, _02224994 @ =ov07_022248F4
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_02224994: .4byte ov07_022248F4
	thumb_func_end ov07_02224948

	thumb_func_start ov07_02224998
ov07_02224998: @ 0x02224998
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _022249B0
	cmp r0, #1
	beq _022249E4
	b _02224A0E
_022249B0:
	movs r0, #0x16
	ldrsh r3, [r4, r0]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	movs r2, #0xc
	str r3, [sp]
	ldr r0, [r4, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldrsh r2, [r4, r2]
	adds r0, r4, #0
	adds r0, #0x40
	adds r2, r1, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov07_02222268
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r4, #0x24
	add sp, #8
	adds r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_022249E4:
	adds r0, r4, #0
	adds r0, #0x40
	bl ov07_022222B4
	cmp r0, #0
	bne _022249FE
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
_022249FE:
	movs r2, #0x40
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	movs r1, #0
	bl FUN_020087A4
	add sp, #8
	pop {r4, pc}
_02224A0E:
	ldr r0, [r4, #0x64]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_02224998

	thumb_func_start ov07_02224A20
ov07_02224A20: @ 0x02224A20
	push {r4, r5, r6, lr}
	movs r1, #0x68
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4, #0x64]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #8]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	movs r6, #0xff
	adds r1, r6, #0
	adds r1, #9
	cmp r0, r1
	bgt _02224A6C
	adds r1, r6, #3
	cmp r0, r1
	blt _02224AC2
	beq _02224A76
	adds r1, r6, #5
	cmp r0, r1
	beq _02224A80
	adds r1, r6, #0
	adds r1, #9
	cmp r0, r1
	beq _02224A9C
	b _02224AC2
_02224A6C:
	adds r1, r6, #0
	adds r1, #0x11
	cmp r0, r1
	beq _02224AA6
	b _02224AC2
_02224A76:
	adds r0, r5, #0
	bl ov07_0221C468
	adds r6, r0, #0
	b _02224AC6
_02224A80:
	adds r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02224AC6
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	adds r6, r0, #0
	b _02224AC6
_02224A9C:
	adds r0, r5, #0
	bl ov07_0221C470
	adds r6, r0, #0
	b _02224AC6
_02224AA6:
	adds r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02224AC6
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	adds r6, r0, #0
	b _02224AC6
_02224AC2:
	bl GF_AssertFail
_02224AC6:
	cmp r6, #0xff
	bne _02224AD2
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
_02224AD2:
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x24
	bl ov07_02231FE4
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FA48
	adds r1, r4, #0
	adds r1, #0x14
	str r0, [r4, #0x18]
	bl ov07_02231FA0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_02222004
	cmp r0, #0
	bgt _02224B04
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	subs r0, #0xd
	muls r0, r1, r0
	strh r0, [r4, #0xc]
_02224B04:
	ldr r0, [r4, #0x64]
	ldr r1, _02224B10 @ =ov07_02224998
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	.align 2, 0
_02224B10: .4byte ov07_02224998
	thumb_func_end ov07_02224A20

	thumb_func_start ov07_02224B14
ov07_02224B14: @ 0x02224B14
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _02224B2C
	cmp r0, #1
	beq _02224B6E
	b _02224B98
_02224B2C:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _02224B3C
	movs r0, #0xff
	adds r4, #0x20
	add sp, #8
	strb r0, [r4]
	pop {r4, pc}
_02224B3C:
	movs r0, #0x12
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r2, #0x64
	str r3, [sp]
	ldr r0, [r4, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldrsh r2, [r4, r2]
	adds r0, r4, #0
	adds r0, #0x3c
	adds r2, r1, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov07_02222268
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_02224B6E:
	adds r0, r4, #0
	adds r0, #0x3c
	bl ov07_022222B4
	cmp r0, #0
	bne _02224B88
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_02224B88:
	movs r2, #0x3c
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_020087A4
	add sp, #8
	pop {r4, pc}
_02224B98:
	ldr r0, [r4, #0x60]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02224B14

	thumb_func_start ov07_02224BAC
ov07_02224BAC: @ 0x02224BAC
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x68
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4, #0x60]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #8]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	adds r1, r4, #0
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, #0x20
	bl ov07_02231FE4
	movs r6, #0xff
	adds r0, r6, #0
	adds r0, #9
	cmp r7, r0
	bgt _02224C08
	adds r0, r6, #3
	cmp r7, r0
	blt _02224C5E
	beq _02224C12
	adds r0, r6, #5
	cmp r7, r0
	beq _02224C1C
	adds r0, r6, #0
	adds r0, #9
	cmp r7, r0
	beq _02224C38
	b _02224C5E
_02224C08:
	adds r0, r6, #0
	adds r0, #0x11
	cmp r7, r0
	beq _02224C42
	b _02224C5E
_02224C12:
	adds r0, r5, #0
	bl ov07_0221C468
	adds r6, r0, #0
	b _02224C62
_02224C1C:
	adds r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02224C62
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	adds r6, r0, #0
	b _02224C62
_02224C38:
	adds r0, r5, #0
	bl ov07_0221C470
	adds r6, r0, #0
	b _02224C62
_02224C42:
	adds r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02224C62
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	adds r6, r0, #0
	b _02224C62
_02224C5E:
	bl GF_AssertFail
_02224C62:
	cmp r6, #0xff
	bne _02224C6E
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
_02224C6E:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FA48
	adds r1, r4, #0
	adds r1, #0x10
	str r0, [r4, #0x14]
	bl ov07_02231FA0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_02222004
	cmp r0, #0
	bgt _02224C9C
	movs r0, #0x64
	ldrsh r1, [r4, r0]
	subs r0, #0x65
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r4, #0
	adds r0, #0x64
	strh r2, [r0]
_02224C9C:
	adds r0, r5, #0
	bl ov07_0221BFC0
	ldr r0, [r4, #0x60]
	ldr r1, _02224CB4 @ =ov07_02224B14
	adds r2, r4, #0
	bl ov07_0221C410
	adds r1, r4, #0
	bl ov07_02224B14
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02224CB4: .4byte ov07_02224B14
	thumb_func_end ov07_02224BAC

	thumb_func_start ov07_02224CB8
ov07_02224CB8: @ 0x02224CB8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bls _02224CC8
	b _02224E46
_02224CC8:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02224CD4: @ jump table
	.2byte _02224CDC - _02224CD4 - 2 @ case 0
	.2byte _02224D3E - _02224CD4 - 2 @ case 1
	.2byte _02224D88 - _02224CD4 - 2 @ case 2
	.2byte _02224DD6 - _02224CD4 - 2 @ case 3
_02224CDC:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	bne _02224D34
	adds r0, r4, #0
	adds r0, #0x38
	bl ov07_022227D8
	movs r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0xd
	bl FUN_020087A4
	movs r2, #0x38
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_02008C2C
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02224D34:
	ldrb r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02224D3E:
	ldrb r0, [r4, #9]
	adds r0, r0, #1
	strb r0, [r4, #9]
	ldrb r1, [r4, #9]
	ldrb r0, [r4, #0xa]
	cmp r1, r0
	bhi _02224D4E
	b _02224E54
_02224D4E:
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl ov07_0221C4A8
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl ov07_0221C4A8
	adds r6, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [sp]
	adds r0, r4, #0
	lsls r1, r5, #0x10
	lsls r3, r6, #0x10
	adds r0, #0x14
	asrs r1, r1, #0x10
	movs r2, #0x64
	asrs r3, r3, #0x10
	bl ov07_02222508
	ldrb r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02224D88:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	bne _02224DCC
	movs r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02224DCC:
	ldrb r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02224DD6:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	ldr r0, [r4, #0x10]
	bne _02224E1A
	movs r2, #0x14
	ldrsh r2, [r4, r2]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02224E1A:
	movs r1, #0xc
	adds r2, r1, #0
	adds r2, #0xf4
	bl FUN_020087A4
	movs r1, #0xd
	adds r2, r1, #0
	ldr r0, [r4, #0x10]
	adds r2, #0xf3
	bl FUN_020087A4
	movs r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_020087A4
	ldrb r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02224E46:
	ldr r0, [r4, #0xc]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_02224E54:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov07_02224CB8

	thumb_func_start ov07_02224E58
ov07_02224E58: @ 0x02224E58
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	bl ov07_0221BFD0
	movs r1, #0x5c
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #8]
	strb r0, [r4]
	str r5, [r4, #0xc]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	movs r0, #0
	strb r0, [r4, #9]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	strb r0, [r4, #0xa]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #2]
	ldr r0, [r4, #0xc]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FAA0
	str r0, [r4, #4]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x64
	lsls r3, r6, #0x10
	adds r0, #0x14
	adds r2, r1, #0
	asrs r3, r3, #0x10
	bl ov07_02222508
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	adds r0, #0x38
	movs r1, #2
	adds r3, r2, #0
	bl ov07_022227A8
	ldr r0, [r4, #0xc]
	ldr r1, _02224EF0 @ =ov07_02224CB8
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02224EF0: .4byte ov07_02224CB8
	thumb_func_end ov07_02224E58

	thumb_func_start ov07_02224EF4
ov07_02224EF4: @ 0x02224EF4
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bls _02224F04
	b _02225084
_02224F04:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02224F10: @ jump table
	.2byte _02224F18 - _02224F10 - 2 @ case 0
	.2byte _02224F7A - _02224F10 - 2 @ case 1
	.2byte _02224FC6 - _02224F10 - 2 @ case 2
	.2byte _02225014 - _02224F10 - 2 @ case 3
_02224F18:
	adds r0, r4, #0
	adds r0, #0x20
	bl ov07_0222260C
	cmp r0, #1
	bne _02224F70
	adds r0, r4, #0
	adds r0, #0x44
	bl ov07_022227D8
	movs r2, #0x20
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x22
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	movs r1, #0xd
	bl FUN_020087A4
	movs r2, #0x44
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_02008C2C
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x34]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_02224F70:
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02224F7A:
	ldrb r0, [r4, #9]
	adds r0, r0, #1
	strb r0, [r4, #9]
	ldrb r1, [r4, #9]
	ldrb r0, [r4, #0xa]
	cmp r1, r0
	bhi _02224F8A
	b _02225092
_02224F8A:
	ldr r3, [r4, #0x10]
	ldr r2, [r4, #0xc]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	asrs r1, r2, #0x10
	movs r0, #0x64
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	asrs r3, r3, #0x10
	str r0, [sp, #8]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	adds r0, #0x20
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222590
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02224FC6:
	adds r0, r4, #0
	adds r0, #0x20
	bl ov07_0222260C
	cmp r0, #1
	bne _0222500A
	movs r2, #0x20
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x22
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x34]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_0222500A:
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02225014:
	adds r0, r4, #0
	adds r0, #0x20
	bl ov07_0222260C
	cmp r0, #1
	ldr r0, [r4, #0x1c]
	bne _02225058
	movs r2, #0x20
	ldrsh r2, [r4, r2]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x22
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x34]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_02225058:
	movs r1, #0xc
	adds r2, r1, #0
	adds r2, #0xf4
	bl FUN_020087A4
	movs r1, #0xd
	adds r2, r1, #0
	ldr r0, [r4, #0x1c]
	adds r2, #0xf3
	bl FUN_020087A4
	movs r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	movs r1, #1
	bl FUN_020087A4
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02225084:
	ldr r0, [r4, #0x18]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_02225092:
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov07_02224EF4

	thumb_func_start ov07_02225098
ov07_02225098: @ 0x02225098
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl ov07_0221BFD0
	movs r1, #0x68
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #8]
	strb r0, [r4]
	str r5, [r4, #0x18]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0x18]
	bl ov07_0221FA48
	str r0, [r4, #0x1c]
	movs r0, #0
	strb r0, [r4, #9]
	adds r0, r5, #0
	movs r1, #6
	bl ov07_0221C4A8
	strb r0, [r4, #0xa]
	ldr r0, [r4, #0x18]
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x18]
	movs r1, #4
	bl ov07_0221C4A8
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x18]
	movs r1, #5
	bl ov07_0221C4A8
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x18]
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #2
	bl ov07_02221F38
	ldr r0, [r4, #0x18]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0x18]
	bl ov07_0221FAA0
	str r0, [r4, #4]
	movs r1, #2
	ldrsh r1, [r4, r1]
	adds r0, r1, r0
	strh r0, [r4, #2]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	asrs r0, r0, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	asrs r0, r0, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	str r6, [sp]
	movs r1, #0x64
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r1, [sp, #0x10]
	ldr r3, [sp, #0xc]
	adds r0, #0x20
	adds r2, r7, #0
	bl ov07_02222590
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	adds r0, #0x44
	movs r1, #2
	adds r3, r2, #0
	bl ov07_022227A8
	ldr r0, [r4, #0x18]
	ldr r1, _02225198 @ =ov07_02224EF4
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02225198: .4byte ov07_02224EF4
	thumb_func_end ov07_02225098

	thumb_func_start ov07_0222519C
ov07_0222519C: @ 0x0222519C
	push {r3, r4, r5, lr}
	movs r2, #1
	lsls r2, r2, #0x1a
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r2]
	ldr r0, _022251C8 @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	ldr r0, [r4, #8]
	movs r1, #2
	bl ov07_0221EC7C
	ldr r0, [r4, #8]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	nop
_022251C8: .4byte 0xFFFF1FFF
	thumb_func_end ov07_0222519C

	thumb_func_start ov07_022251CC
ov07_022251CC: @ 0x022251CC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x28
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	adds r0, r5, #0
	adds r1, r4, #4
	bl ov07_02231FE4
	ldr r0, [r4, #8]
	movs r1, #2
	bl ov07_0221EB98
	ldr r0, [r4, #8]
	movs r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x24]
	movs r1, #2
	bl FUN_0200E0FC
	ldr r0, [r4, #0x24]
	movs r1, #2
	bl FUN_0200DF98
	ldr r1, _0222524C @ =0x3F99999A
	ldr r0, [r4, #0x24]
	adds r2, r1, #0
	bl FUN_0200E024
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02225250 @ =0xFFFF1FFF
	ands r2, r1
	lsrs r1, r0, #0xb
	orrs r1, r2
	str r1, [r0]
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r1, #0x3f
	bics r2, r1
	movs r1, #0x1b
	orrs r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	ldr r1, _02225254 @ =0xFFFFC0FF
	ands r2, r1
	movs r1, #7
	lsls r1, r1, #8
	orrs r1, r2
	strh r1, [r0]
	ldr r0, [r4, #8]
	ldr r1, _02225258 @ =ov07_0222519C
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_0222524C: .4byte 0x3F99999A
_02225250: .4byte 0xFFFF1FFF
_02225254: .4byte 0xFFFFC0FF
_02225258: .4byte ov07_0222519C
	thumb_func_end ov07_022251CC

	thumb_func_start ov07_0222525C
ov07_0222525C: @ 0x0222525C
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _02225274
	cmp r0, #1
	beq _022252B0
	b _022252E6
_02225274:
	movs r0, #0x12
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r0, #0x66
	ldrsh r0, [r4, r0]
	movs r2, #0x64
	adds r0, r3, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldrsh r2, [r4, r2]
	adds r0, r4, #0
	adds r0, #0x3c
	adds r2, r1, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov07_02222268
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_022252B0:
	adds r0, r4, #0
	adds r0, #0x3c
	bl ov07_022222B4
	cmp r0, #0
	bne _022252CA
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_022252CA:
	movs r2, #0x3c
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x3e
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_020087A4
	add sp, #8
	pop {r4, pc}
_022252E6:
	ldr r0, [r4, #0x60]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_0222525C

	thumb_func_start ov07_022252F8
ov07_022252F8: @ 0x022252F8
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x68
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4, #0x60]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #8]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	adds r1, r4, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	adds r1, r4, #0
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, #0x20
	bl ov07_02231FE4
	movs r6, #0xff
	adds r0, r6, #0
	adds r0, #9
	cmp r7, r0
	bgt _02225362
	adds r0, r6, #3
	cmp r7, r0
	blt _022253B8
	beq _0222536C
	adds r0, r6, #5
	cmp r7, r0
	beq _02225376
	adds r0, r6, #0
	adds r0, #9
	cmp r7, r0
	beq _02225392
	b _022253B8
_02225362:
	adds r0, r6, #0
	adds r0, #0x11
	cmp r7, r0
	beq _0222539C
	b _022253B8
_0222536C:
	adds r0, r5, #0
	bl ov07_0221C468
	adds r6, r0, #0
	b _022253BC
_02225376:
	adds r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _022253BC
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	adds r6, r0, #0
	b _022253BC
_02225392:
	adds r0, r5, #0
	bl ov07_0221C470
	adds r6, r0, #0
	b _022253BC
_0222539C:
	adds r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _022253BC
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	adds r6, r0, #0
	b _022253BC
_022253B8:
	bl GF_AssertFail
_022253BC:
	cmp r6, #0xff
	bne _022253C8
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
_022253C8:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x14]
	cmp r0, #0
	bne _022253DE
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
_022253DE:
	adds r1, r4, #0
	adds r1, #0x10
	bl ov07_02231FA0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_02222004
	cmp r0, #0
	bgt _02225412
	movs r0, #0x64
	ldrsh r1, [r4, r0]
	subs r0, #0x65
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r4, #0
	adds r0, #0x64
	strh r2, [r0]
	movs r0, #0x66
	ldrsh r1, [r4, r0]
	subs r0, #0x67
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r4, #0
	adds r0, #0x66
	strh r2, [r0]
_02225412:
	adds r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0222542C
	movs r0, #0x66
	ldrsh r1, [r4, r0]
	subs r0, #0x67
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r4, #0
	adds r0, #0x66
	strh r2, [r0]
_0222542C:
	ldr r0, [r4, #0x60]
	ldr r1, _02225440 @ =ov07_0222525C
	adds r2, r4, #0
	bl ov07_0221C410
	adds r1, r4, #0
	bl ov07_0222525C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02225440: .4byte ov07_0222525C
	thumb_func_end ov07_022252F8

	thumb_func_start ov07_02225444
ov07_02225444: @ 0x02225444
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0x20
	movs r2, #0x22
	adds r5, r0, #0
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x24]
	adds r0, #0x30
	bl ov07_02222240
	cmp r0, #0
	bne _02225488
	movs r2, #0x20
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x22
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	movs r1, #1
	subs r2, #8
	bl FUN_020087A4
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_02225488:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02225444

	thumb_func_start ov07_0222548C
ov07_0222548C: @ 0x0222548C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	movs r1, #0x54
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	adds r2, r4, #0
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, #0x1c
	add r3, sp, #0
	bl ov07_02232020
	movs r0, #0x22
	ldrsh r0, [r4, r0]
	movs r1, #1
	adds r0, #8
	strh r0, [r4, #0x22]
	adds r0, r5, #0
	bl ov07_0221C4A8
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r6, #0
	bl ov07_02222A44
	ldr r1, [r4, #0x3c]
	adds r2, r4, #0
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [r4, #0x3c]
	ldr r1, [r4, #0x44]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [r4, #0x44]
	ldr r0, [r4, #4]
	ldr r1, _02225500 @ =ov07_02225444
	bl ov07_0221C410
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02225500: .4byte ov07_02225444
	thumb_func_end ov07_0222548C

	thumb_func_start ov07_02225504
ov07_02225504: @ 0x02225504
	push {r4, lr}
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0222553C
	adds r0, r4, #0
	adds r0, #0x30
	bl ov07_022222B4
	cmp r0, #0
	bne _02225522
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_02225522:
	movs r2, #0x30
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x32
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	movs r1, #1
	bl FUN_020087A4
	pop {r4, pc}
_0222553C:
	ldr r0, [r4, #4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov07_02225504

	thumb_func_start ov07_0222554C
ov07_0222554C: @ 0x0222554C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r1, #0x5c
	adds r6, r0, #0
	bl ov07_022324D8
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov07_02231FE4
	adds r0, r6, #0
	movs r1, #0
	bl ov07_0221C4A8
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl ov07_0221C4A8
	adds r7, r0, #0
	cmp r4, #8
	bgt _0222558A
	cmp r4, #2
	blt _022255C8
	beq _02225590
	cmp r4, #4
	beq _0222559A
	cmp r4, #8
	beq _022255AC
	b _022255C8
_0222558A:
	cmp r4, #0x10
	beq _022255B6
	b _022255C8
_02225590:
	adds r0, r6, #0
	bl ov07_0221C468
	str r0, [sp, #8]
	b _022255CC
_0222559A:
	adds r0, r6, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0223197C
	str r0, [sp, #8]
	b _022255CC
_022255AC:
	adds r0, r6, #0
	bl ov07_0221C470
	str r0, [sp, #8]
	b _022255CC
_022255B6:
	adds r0, r6, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0223197C
	str r0, [sp, #8]
	b _022255CC
_022255C8:
	bl GF_AssertFail
_022255CC:
	adds r2, r5, #0
	ldr r1, [sp, #8]
	adds r0, r6, #0
	adds r2, #0x54
	bl ov07_02231A50
	adds r2, r5, #0
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, #0x1c
	add r3, sp, #0xc
	bl ov07_02232020
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x58
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x5a
	strh r1, [r0]
	ldr r0, [r5, #4]
	ldr r1, [sp, #8]
	bl ov07_0223192C
	cmp r0, #3
	bne _02225606
	movs r1, #0x4f
	mvns r1, r1
	b _0222560A
_02225606:
	movs r1, #0x15
	lsls r1, r1, #4
_0222560A:
	adds r0, r5, #0
	adds r0, #0x58
	strh r1, [r0]
	movs r0, #0x22
	ldrsh r3, [r5, r0]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r3, [sp]
	str r0, [sp, #4]
	movs r1, #0x20
	movs r2, #0x58
	adds r0, r5, #0
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	adds r0, #0x30
	bl ov07_02222268
	ldr r0, [r5, #4]
	ldr r1, _0222563C @ =ov07_02225504
	adds r2, r5, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222563C: .4byte ov07_02225504
	thumb_func_end ov07_0222554C

	thumb_func_start ov07_02225640
ov07_02225640: @ 0x02225640
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r1, #0x5c
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	adds r7, r0, #0
	cmp r6, #8
	bgt _02225688
	cmp r6, #2
	blt _022256C6
	beq _0222568E
	cmp r6, #4
	beq _02225698
	cmp r6, #8
	beq _022256AA
	b _022256C6
_02225688:
	cmp r6, #0x10
	beq _022256B4
	b _022256C6
_0222568E:
	adds r0, r5, #0
	bl ov07_0221C468
	str r0, [sp, #8]
	b _022256CA
_02225698:
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	str r0, [sp, #8]
	b _022256CA
_022256AA:
	adds r0, r5, #0
	bl ov07_0221C470
	str r0, [sp, #8]
	b _022256CA
_022256B4:
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	str r0, [sp, #8]
	b _022256CA
_022256C6:
	bl GF_AssertFail
_022256CA:
	adds r2, r4, #0
	ldr r1, [sp, #8]
	adds r0, r5, #0
	adds r2, #0x54
	bl ov07_02231A50
	adds r2, r4, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, #0x1c
	add r3, sp, #0x10
	bl ov07_02232020
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x58
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5a
	strh r1, [r0]
	ldr r0, [r4, #4]
	ldr r1, [sp, #8]
	bl ov07_0223192C
	cmp r0, #3
	bne _02225704
	movs r1, #0x4f
	mvns r1, r1
	b _02225708
_02225704:
	movs r1, #0x15
	lsls r1, r1, #4
_02225708:
	adds r0, r4, #0
	adds r0, #0x58
	strh r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _02225732
	movs r0, #0x22
	ldrsh r3, [r4, r0]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r3, [sp]
	str r0, [sp, #4]
	movs r1, #0x20
	movs r2, #0x58
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	adds r0, #0x30
	bl ov07_02222268
	b _02225756
_02225732:
	ldr r1, [sp, #8]
	adds r0, r5, #0
	movs r2, #0
	bl ov07_02221F80
	adds r2, r0, #0
	movs r0, #0x22
	ldrsh r3, [r4, r0]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r3, [sp]
	str r0, [sp, #4]
	movs r1, #0x58
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	adds r0, #0x30
	bl ov07_02222268
_02225756:
	ldr r0, [r4, #4]
	ldr r1, _02225764 @ =ov07_02225504
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02225764: .4byte ov07_02225504
	thumb_func_end ov07_02225640

	thumb_func_start ov07_02225768
ov07_02225768: @ 0x02225768
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	movs r1, #0
	adds r5, r0, #0
	bl ov07_0221C4A8
	adds r4, r0, #0
	cmp r4, #8
	bgt _0222578A
	cmp r4, #2
	blt _022257C8
	beq _02225790
	cmp r4, #4
	beq _0222579A
	cmp r4, #8
	beq _022257AC
	b _022257C8
_0222578A:
	cmp r4, #0x10
	beq _022257B6
	b _022257C8
_02225790:
	adds r0, r5, #0
	bl ov07_0221C468
	adds r6, r0, #0
	b _022257CC
_0222579A:
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	adds r6, r0, #0
	b _022257CC
_022257AC:
	adds r0, r5, #0
	bl ov07_0221C470
	adds r6, r0, #0
	b _022257CC
_022257B6:
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	adds r6, r0, #0
	b _022257CC
_022257C8:
	bl GF_AssertFail
_022257CC:
	adds r0, r5, #0
	adds r1, r6, #0
	add r2, sp, #0
	bl ov07_02231A50
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #8
	add r3, sp, #4
	bl ov07_02232020
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FAA0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r1, #0
	add r2, sp, #0
	ldrsh r2, [r2, r1]
	ldr r0, [sp, #0x10]
	bl FUN_020087A4
	add r3, sp, #0
	movs r2, #2
	ldrsh r2, [r3, r2]
	ldr r0, [sp, #0x10]
	movs r1, #1
	adds r2, r2, r4
	bl FUN_020087A4
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_02225768

	thumb_func_start ov07_02225810
ov07_02225810: @ 0x02225810
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	bl ov07_02222EE8
	cmp r0, #0
	bne _02225834
	ldr r0, [r4, #0x30]
	bl ov07_02222EF8
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_02225834:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02225810

	thumb_func_start ov07_02225838
ov07_02225838: @ 0x02225838
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	movs r1, #0x34
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [sp, #0x20]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	str r0, [sp, #0x24]
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	adds r2, r4, #0
	str r0, [sp, #0x28]
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, #0x1c
	add r3, sp, #0x2c
	bl ov07_022323FC
	ldr r0, [r4, #0x28]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov07_0221BFD0
	adds r1, r0, #0
	movs r0, #0x10
	str r0, [sp]
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	lsls r3, r7, #0x14
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	movs r2, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, _022258FC @ =0x0000044C
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x18]
	bl ov07_02222F10
	str r0, [r4, #0x30]
	ldr r0, [r4, #4]
	ldr r1, _02225900 @ =ov07_02225810
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022258FC: .4byte 0x0000044C
_02225900: .4byte ov07_02225810
	thumb_func_end ov07_02225838

	thumb_func_start ov07_02225904
ov07_02225904: @ 0x02225904
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _02225978
	ldr r0, [r4, #0x4c]
	adds r1, r0, #1
	str r1, [r4, #0x4c]
	ldr r0, [r4, #0x44]
	cmp r1, r0
	blt _0222598C
	movs r1, #0
	str r1, [r4, #0x4c]
	ldr r0, [r4, #0x48]
	cmp r0, #0
	ldr r0, [r4, #0x54]
	bne _0222593C
	cmp r0, #0
	bge _0222592E
	str r1, [r4, #0x54]
_0222592E:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _02225950
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02225950
_0222593C:
	cmp r0, #0x50
	ble _02225944
	movs r0, #0x50
	str r0, [r4, #0x54]
_02225944:
	ldr r0, [r4, #0x54]
	cmp r0, #0x50
	bne _02225950
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_02225950:
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x54]
	movs r1, #0x12
	bl FUN_020087A4
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	movs r1, #1
	bl FUN_020087A4
	movs r0, #0x42
	ldrsh r1, [r4, r0]
	ldr r2, [r4, #0x50]
	subs r1, r2, r1
	str r1, [r4, #0x50]
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x54]
	adds r0, r1, r0
	str r0, [r4, #0x54]
	pop {r3, r4, r5, pc}
_02225978:
	ldr r0, [r4, #0x24]
	bl ov07_02223224
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_0222598C:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02225904

	thumb_func_start ov07_02225990
ov07_02225990: @ 0x02225990
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r1, #0x58
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	adds r6, r0, #0
	adds r2, r4, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, #0x1c
	add r3, sp, #4
	bl ov07_02232020
	cmp r6, #8
	bgt _022259D2
	cmp r6, #2
	blt _02225A10
	beq _022259D8
	cmp r6, #4
	beq _022259E2
	cmp r6, #8
	beq _022259F4
	b _02225A10
_022259D2:
	cmp r6, #0x10
	beq _022259FE
	b _02225A10
_022259D8:
	adds r0, r5, #0
	bl ov07_0221C468
	adds r7, r0, #0
	b _02225A14
_022259E2:
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	adds r7, r0, #0
	b _02225A14
_022259F4:
	adds r0, r5, #0
	bl ov07_0221C470
	adds r7, r0, #0
	b _02225A14
_022259FE:
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	adds r7, r0, #0
	b _02225A14
_02225A10:
	bl GF_AssertFail
_02225A14:
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	str r0, [r4, #0x48]
	cmp r0, #0
	ldr r0, [r4, #0x24]
	bne _02225A68
	movs r1, #1
	bl FUN_02008A78
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x24]
	movs r1, #0x12
	bl FUN_02008A78
	movs r1, #0x50
	subs r0, r1, r0
	str r0, [r4, #0x54]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	adds r1, r4, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	adds r1, r4, #0
	adds r1, #0x42
	strh r0, [r1]
	movs r0, #0x42
	ldrsh r1, [r4, r0]
	subs r0, #0x43
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r4, #0
	adds r0, #0x42
	strh r2, [r0]
	b _02225A96
_02225A68:
	movs r1, #1
	bl FUN_02008A78
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x24]
	movs r1, #0x12
	bl FUN_02008A78
	str r0, [r4, #0x54]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	adds r1, r4, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	adds r1, r4, #0
	adds r1, #0x42
	strh r0, [r1]
_02225A96:
	movs r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	movs r0, #0x50
	str r0, [r4, #0x38]
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov07_0221FAA0
	movs r1, #0x50
	subs r0, r1, r0
	str r0, [r4, #0x3c]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	str r0, [r4, #0x44]
	movs r0, #0
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x3c]
	str r0, [sp]
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x38]
	bl FUN_0200908C
	ldr r0, [r4, #4]
	ldr r1, _02225ADC @ =ov07_02225904
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02225ADC: .4byte ov07_02225904
	thumb_func_end ov07_02225990

	thumb_func_start ov07_02225AE0
ov07_02225AE0: @ 0x02225AE0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	cmp r1, #8
	bgt _02225AFA
	cmp r1, #2
	blt _02225B30
	beq _02225B00
	cmp r1, #4
	beq _02225B08
	cmp r1, #8
	beq _02225B18
	b _02225B30
_02225AFA:
	cmp r1, #0x10
	beq _02225B20
	b _02225B30
_02225B00:
	bl ov07_0221C468
	adds r4, r0, #0
	b _02225B34
_02225B08:
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	adds r4, r0, #0
	b _02225B34
_02225B18:
	bl ov07_0221C470
	adds r4, r0, #0
	b _02225B34
_02225B20:
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223197C
	adds r4, r0, #0
	b _02225B34
_02225B30:
	bl GF_AssertFail
_02225B34:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02225AE0

	thumb_func_start ov07_02225B38
ov07_02225B38: @ 0x02225B38
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02225B4A
	cmp r0, #1
	beq _02225B90
	pop {r3, r4, r5, pc}
_02225B4A:
	ldr r0, [r4, #0x24]
	adds r1, r0, #1
	str r1, [r4, #0x24]
	ldr r0, [r4, #0x20]
	cmp r1, r0
	blt _02225BC2
	movs r0, #0
	str r0, [r4, #0x24]
	movs r0, #0x1c
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x44]
	adds r2, r1, r0
	str r2, [r4, #0x44]
	ldr r0, [r4, #0x30]
	movs r1, #1
	bl FUN_020087A4
	movs r0, #0x1c
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x3c]
	subs r1, r1, r0
	str r1, [r4, #0x3c]
	ldr r0, [r4, #0x40]
	cmp r1, r0
	ble _02225B84
	str r0, [r4, #0x3c]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_02225B84:
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x3c]
	movs r1, #0x12
	bl FUN_020087A4
	pop {r3, r4, r5, pc}
_02225B90:
	ldr r0, [r4, #0x30]
	movs r1, #0xe
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x48]
	movs r1, #1
	bl FUN_020087A4
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x40]
	movs r1, #0x12
	bl FUN_020087A4
	ldr r0, [r4, #0x30]
	bl ov07_02223224
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_02225BC2:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02225B38

	thumb_func_start ov07_02225BC4
ov07_02225BC4: @ 0x02225BC4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02225BD6
	cmp r0, #1
	beq _02225C1A
	pop {r3, r4, r5, pc}
_02225BD6:
	ldr r0, [r4, #0x24]
	adds r1, r0, #1
	str r1, [r4, #0x24]
	ldr r0, [r4, #0x20]
	cmp r1, r0
	blt _02225C4C
	movs r0, #0
	str r0, [r4, #0x24]
	movs r0, #0x1c
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x44]
	adds r2, r1, r0
	str r2, [r4, #0x44]
	ldr r0, [r4, #0x30]
	movs r1, #1
	bl FUN_020087A4
	movs r0, #0x1c
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x3c]
	subs r0, r1, r0
	str r0, [r4, #0x3c]
	bpl _02225C0E
	movs r0, #0
	str r0, [r4, #0x3c]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_02225C0E:
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x3c]
	movs r1, #0x12
	bl FUN_020087A4
	pop {r3, r4, r5, pc}
_02225C1A:
	ldr r0, [r4, #0x30]
	movs r1, #0xe
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x48]
	movs r1, #1
	bl FUN_020087A4
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x40]
	movs r1, #0x12
	bl FUN_020087A4
	ldr r0, [r4, #0x30]
	bl ov07_02223224
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_02225C4C:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02225BC4

	thumb_func_start ov07_02225C50
ov07_02225C50: @ 0x02225C50
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02225C62
	cmp r0, #1
	beq _02225CA4
	pop {r3, r4, r5, pc}
_02225C62:
	ldr r0, [r4, #0x24]
	adds r1, r0, #1
	str r1, [r4, #0x24]
	ldr r0, [r4, #0x20]
	cmp r1, r0
	blt _02225CC2
	movs r0, #0
	str r0, [r4, #0x24]
	movs r1, #0x1c
	ldrsh r2, [r4, r1]
	ldr r3, [r4, #0x3c]
	subs r2, r3, r2
	str r2, [r4, #0x3c]
	ldrsh r1, [r4, r1]
	ldr r2, [r4, #0x40]
	adds r1, r2, r1
	str r1, [r4, #0x40]
	ldr r1, [r4, #0x3c]
	cmp r1, #0
	bge _02225C92
	str r0, [r4, #0x3c]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_02225C92:
	ldr r0, [r4, #0x40]
	movs r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x3c]
	movs r3, #0x50
	bl FUN_0200908C
	pop {r3, r4, r5, pc}
_02225CA4:
	ldr r0, [r4, #0x30]
	movs r1, #0xe
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4, #0x30]
	bl ov07_02223224
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_02225CC2:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02225C50

	thumb_func_start ov07_02225CC4
ov07_02225CC4: @ 0x02225CC4
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r1, #0x50
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #0x1c]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	str r0, [r4, #0x20]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	adds r6, r0, #0
	adds r2, r4, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, #0x28
	add r3, sp, #4
	bl ov07_02232020
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_02225AE0
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	cmp r0, #0
	beq _02225D46
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FAA0
	movs r3, #0x50
	subs r0, r3, r0
	str r0, [r4, #0x3c]
	movs r1, #0
	str r1, [r4, #0x40]
	str r1, [sp]
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x3c]
	bl FUN_0200908C
	ldr r0, [r4, #4]
	ldr r1, _02225DB8 @ =ov07_02225C50
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r4, r5, r6, pc}
_02225D46:
	ldr r0, [r4, #0x30]
	movs r1, #1
	bl FUN_02008A78
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FAA0
	movs r3, #0x50
	subs r0, r3, r0
	str r0, [r4, #0x3c]
	str r0, [r4, #0x40]
	movs r0, #0x1c
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02225D86
	ldr r0, [r4, #0x3c]
	movs r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x30]
	adds r2, r1, #0
	bl FUN_0200908C
	ldr r0, [r4, #4]
	ldr r1, _02225DBC @ =ov07_02225BC4
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r4, r5, r6, pc}
_02225D86:
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r1, [r4, #0x44]
	ldr r0, [r4, #0x40]
	adds r2, r1, r0
	str r2, [r4, #0x44]
	ldr r0, [r4, #0x30]
	movs r1, #1
	bl FUN_020087A4
	ldr r0, [r4, #0x3c]
	movs r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x30]
	adds r2, r1, #0
	movs r3, #0x50
	bl FUN_0200908C
	ldr r0, [r4, #4]
	ldr r1, _02225DC0 @ =ov07_02225B38
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_02225DB8: .4byte ov07_02225C50
_02225DBC: .4byte ov07_02225BC4
_02225DC0: .4byte ov07_02225B38
	thumb_func_end ov07_02225CC4

	thumb_func_start ov07_02225DC4
ov07_02225DC4: @ 0x02225DC4
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02225DD8
	cmp r0, #1
	beq _02225DF8
	b _02225E88
_02225DD8:
	ldr r0, [r4, #0x10]
	str r0, [sp]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r3, [r4, #0xc]
	adds r0, #0xd4
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov07_022227A8
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_02225DF8:
	adds r0, r4, #0
	adds r0, #0xd4
	bl ov07_022227D8
	cmp r0, #0
	bne _02225E4C
	ldrb r1, [r4, #1]
	ldr r0, [r4, #0x18]
	cmp r1, r0
	ldrb r0, [r4]
	blt _02225E12
	adds r0, r0, #1
	b _02225E14
_02225E12:
	subs r0, r0, #1
_02225E14:
	strb r0, [r4]
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _02225E2C
	ldr r1, [r4, #0x1c]
	movs r2, #0
	lsls r1, r1, #0x18
	ldr r0, [r4, #0x28]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201BC8C
_02225E2C:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _02225E42
	ldr r1, [r4, #0x1c]
	ldr r0, [r4, #0x28]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
_02225E42:
	ldrb r0, [r4, #1]
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4, #1]
	pop {r3, r4, pc}
_02225E4C:
	movs r3, #0xd4
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _02225E68
	movs r0, #1
	str r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	ldrsh r3, [r4, r3]
	lsls r1, r1, #0x18
	ldr r0, [r4, #0x28]
	lsrs r1, r1, #0x18
	movs r2, #0
	bl FUN_0201BC8C
_02225E68:
	movs r3, #0xd6
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _02225E96
	movs r0, #1
	str r0, [r4, #0x24]
	ldr r1, [r4, #0x1c]
	ldrsh r3, [r4, r3]
	lsls r1, r1, #0x18
	ldr r0, [r4, #0x28]
	lsrs r1, r1, #0x18
	movs r2, #3
	bl FUN_0201BC8C
	add sp, #4
	pop {r3, r4, pc}
_02225E88:
	ldr r0, [r4, #0x2c]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_02225E96:
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov07_02225DC4

	thumb_func_start ov07_02225E9C
ov07_02225E9C: @ 0x02225E9C
	push {r3, r4, r5, lr}
	movs r1, #0xf8
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	str r5, [r4, #0x2c]
	adds r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	bl ov07_0221C4A0
	str r0, [r4, #0x28]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #4]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	str r0, [r4, #8]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #0x10]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	str r0, [r4, #0x18]
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	cmp r0, #0
	bne _02225F02
	movs r0, #3
	b _02225F04
_02225F02:
	movs r0, #2
_02225F04:
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x2c]
	ldr r1, _02225F14 @ =ov07_02225DC4
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_02225F14: .4byte ov07_02225DC4
	thumb_func_end ov07_02225E9C

	thumb_func_start ov07_02225F18
ov07_02225F18: @ 0x02225F18
	push {r4, lr}
	adds r4, r1, #0
	adds r2, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x24]
	cmp r3, r0
	beq _02225F2C
	ldr r1, [r4, #0x28]
	cmp r1, r0
	bne _02225F3C
_02225F2C:
	ldr r0, [r4, #4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
_02225F3C:
	movs r1, #0x20
	ldrsh r2, [r4, r1]
	cmp r2, #0
	bge _02225F5E
	adds r2, r3, r2
	cmp r2, #0
	ble _02225F56
	str r2, [r4, #0x24]
	ldrsh r0, [r4, r1]
	ldr r2, [r4, #0x28]
	adds r0, r2, r0
	str r0, [r4, #0x28]
	b _02225F76
_02225F56:
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x2c]
	str r0, [r4, #0x28]
	b _02225F76
_02225F5E:
	adds r2, r3, r2
	cmp r2, #0xf
	bge _02225F70
	str r2, [r4, #0x24]
	ldrsh r0, [r4, r1]
	ldr r2, [r4, #0x28]
	adds r0, r2, r0
	str r0, [r4, #0x28]
	b _02225F76
_02225F70:
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x2c]
	str r0, [r4, #0x28]
_02225F76:
	ldr r0, [r4, #0x1c]
	bl FUN_0200DC18
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #0x24]
	lsls r0, r0, #4
	orrs r1, r0
	ldr r0, _02225F90 @ =0x0400004D
	strb r1, [r0]
	ldr r0, [r4, #0xc]
	bl FUN_0200D020
	pop {r4, pc}
	.align 2, 0
_02225F90: .4byte 0x0400004D
	thumb_func_end ov07_02225F18

	thumb_func_start ov07_02225F94
ov07_02225F94: @ 0x02225F94
	push {r3, r4, r5, lr}
	movs r1, #0x30
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	ldr r0, [r4, #4]
	movs r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0x20]
	ldr r0, [r4, #4]
	movs r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #0x24]
	ldr r0, [r4, #4]
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #0x28]
	ldr r0, [r4, #4]
	movs r1, #0
	bl ov07_0221C4A8
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221C4E8
	movs r1, #1
	str r0, [r4, #0x1c]
	bl FUN_0200DCE8
	movs r0, #0x20
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _02225FEA
	movs r0, #0
	b _02225FEC
_02225FEA:
	movs r0, #0xf
_02225FEC:
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x1c]
	movs r1, #1
	bl FUN_0200E0E8
	ldr r0, [r4, #4]
	ldr r1, _02226008 @ =ov07_02225F18
	adds r2, r4, #0
	bl ov07_0221C410
	adds r1, r4, #0
	bl ov07_02225F18
	pop {r3, r4, r5, pc}
	.align 2, 0
_02226008: .4byte ov07_02225F18
	thumb_func_end ov07_02225F94

	thumb_func_start ov07_0222600C
ov07_0222600C: @ 0x0222600C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #0
	bl ov07_0221C4A8
	str r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	strh r0, [r4, #0xe]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #4]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	strh r0, [r4, #6]
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	str r0, [r4, #8]
	adds r0, r5, #0
	movs r1, #6
	bl ov07_0221C4A8
	str r0, [r4, #0x10]
	adds r0, r5, #0
	movs r1, #8
	bl ov07_0221C4A8
	str r0, [r4, #0x30]
	adds r0, r5, #0
	movs r1, #7
	bl ov07_0221C4A8
	ldr r2, _022260D8 @ =0xFFFF0000
	movs r1, #0
	ands r2, r0
	lsls r0, r0, #0x10
	str r1, [r4, #0x1c]
	lsrs r2, r2, #0x10
	str r2, [r4, #0x20]
	lsrs r0, r0, #0x10
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bne _02226082
	str r1, [r4, #0x20]
_02226082:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _0222608C
	movs r0, #0xff
	str r0, [r4, #0x24]
_0222608C:
	ldr r1, [r4]
	adds r0, r5, #0
	bl ov07_0221C494
	str r0, [r4, #0x38]
	adds r0, r5, #0
	bl ov07_0221C478
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _022260B6
	adds r0, r5, #0
	bl ov07_0221C468
	str r0, [r4, #0x14]
	adds r0, r5, #0
	bl ov07_0221C470
	str r0, [r4, #0x18]
	b _022260CA
_022260B6:
	cmp r0, #1
	bne _022260CA
	adds r0, r5, #0
	bl ov07_0221C470
	str r0, [r4, #0x14]
	adds r0, r5, #0
	bl ov07_0221C468
	str r0, [r4, #0x18]
_022260CA:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _022260D4
	bl GF_AssertFail
_022260D4:
	pop {r3, r4, r5, pc}
	nop
_022260D8: .4byte 0xFFFF0000
	thumb_func_end ov07_0222600C

	thumb_func_start ov07_022260DC
ov07_022260DC: @ 0x022260DC
	ldr r0, [r0, #8]
	movs r1, #0
	cmp r0, #0
	beq _022260EE
_022260E4:
	ldrh r2, [r0, #0x26]
	ldrh r3, [r0, #0x24]
	ldr r0, [r0]
	cmp r0, #0
	bne _022260E4
_022260EE:
	cmp r2, r3
	beq _022260F4
	movs r1, #1
_022260F4:
	adds r0, r1, #0
	bx lr
	thumb_func_end ov07_022260DC

	thumb_func_start ov07_022260F8
ov07_022260F8: @ 0x022260F8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5, #0x38]
	bl ov07_022260DC
	adds r4, r0, #0
	movs r0, #4
	ldrsh r0, [r5, r0]
	ldr r1, [r5, #0x28]
	cmp r1, r0
	bge _02226116
	adds r0, r1, #1
	str r0, [r5, #0x28]
	pop {r4, r5, r6, pc}
_02226116:
	adds r0, r5, #0
	adds r0, #0xa8
	bl ov07_022222B4
	cmp r0, #0
	bne _0222613E
	cmp r4, #0
	bne _0222613E
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl FUN_020154C4
	ldr r0, [r5, #0x40]
	adds r1, r6, #0
	bl ov07_0221C448
	adds r0, r5, #0
	bl ov07_02232508
	pop {r4, r5, r6, pc}
_0222613E:
	ldr r1, [r5, #0x1c]
	ldr r0, [r5, #0x20]
	cmp r0, r1
	bgt _0222614C
	ldr r0, [r5, #0x24]
	cmp r0, r1
	bge _02226152
_0222614C:
	ldr r0, [r5, #0x24]
	cmp r0, #0xff
	bne _022261B0
_02226152:
	movs r0, #0xa8
	ldrsh r2, [r5, r0]
	ldr r1, [r5, #0x38]
	movs r3, #0xac
	adds r0, r2, #0
	ldr r2, [r1, #0x20]
	muls r0, r3, r0
	ldr r2, [r2]
	ldr r2, [r2, #4]
	adds r0, r0, r2
	str r0, [r1, #0x28]
	movs r0, #0xaa
	ldrsh r4, [r5, r0]
	ldr r2, [r5, #0x38]
	adds r1, r4, #0
	muls r1, r3, r1
	ldr r3, [r2, #0x20]
	ldr r3, [r3]
	ldr r3, [r3, #8]
	adds r1, r1, r3
	str r1, [r2, #0x2c]
	ldr r1, [r5, #0x30]
	cmp r1, #0
	beq _022261B0
	movs r1, #6
	ldrsh r1, [r5, r1]
	adds r0, #0xbe
	blx FUN_020F2998
	ldr r1, [r5, #0x2c]
	adds r0, r1, r0
	str r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FCAC
	movs r1, #0xaa
	ldrsh r2, [r5, r1]
	movs r1, #0xac
	muls r1, r2, r1
	adds r2, r1, r0
	ldr r1, [r5, #0x38]
	ldr r0, [r1, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r2, r0
	str r0, [r1, #0x2c]
_022261B0:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_022260F8

	thumb_func_start ov07_022261B4
ov07_022261B4: @ 0x022261B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	movs r1, #0x41
	lsls r1, r1, #2
	adds r6, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x3c
	bl ov07_02231FE4
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov07_0222600C
	adds r0, r6, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_02222004
	adds r5, r0, #0
	ldr r1, [r4, #0x14]
	adds r0, r6, #0
	add r2, sp, #0x18
	bl ov07_02231B90
	ldr r1, [r4, #0x18]
	adds r0, r6, #0
	add r2, sp, #0xc
	bl ov07_02231B90
	ldr r0, [sp, #0x18]
	movs r1, #0xac
	blx FUN_020F2998
	adds r6, r0, #0
	ldr r0, [sp, #0xc]
	movs r1, #0xac
	blx FUN_020F2998
	adds r7, r0, #0
	ldr r0, [sp, #0x1c]
	movs r1, #0xac
	blx FUN_020F2998
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	movs r1, #0xac
	blx FUN_020F2998
	movs r1, #0xe
	ldrsh r1, [r4, r1]
	adds r2, r1, #0
	muls r2, r5, r2
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldrh r0, [r4, #6]
	lsls r1, r6, #0x10
	movs r2, #0xc
	str r0, [sp, #4]
	ldrsh r2, [r4, r2]
	adds r0, r4, #0
	adds r0, #0xa8
	adds r3, r2, #0
	muls r3, r5, r3
	adds r2, r7, r3
	ldr r3, [sp, #8]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222268
	cmp r5, #0
	ldr r2, _022262D8 @ =0x00005C71
	ble _0222626C
	ldr r1, _022262DC @ =0x00000E38
	adds r0, r4, #0
	adds r0, #0xf0
	muls r1, r5, r1
	muls r2, r5, r2
	movs r3, #0xa
	bl ov07_022223F0
	b _0222627C
_0222626C:
	ldr r1, _022262E0 @ =0x00003FFF
	adds r0, r4, #0
	adds r0, #0xf0
	muls r1, r5, r1
	muls r2, r5, r2
	movs r3, #0xa
	bl ov07_022223F0
_0222627C:
	ldr r0, [r4, #0x20]
	movs r5, #0
	cmp r0, #0
	ble _02226296
	adds r6, r4, #0
	adds r6, #0xa8
_02226288:
	adds r0, r6, #0
	bl ov07_022222B4
	ldr r0, [r4, #0x20]
	adds r5, r5, #1
	cmp r5, r0
	blt _02226288
_02226296:
	ldr r0, [r4, #0x24]
	cmp r0, #0xff
	beq _022262A0
	adds r0, r0, #1
	str r0, [r4, #0x1c]
_022262A0:
	movs r0, #0xa8
	ldrsh r3, [r4, r0]
	ldr r1, [r4, #0x38]
	movs r2, #0xac
	adds r0, r3, #0
	ldr r3, [r1, #0x20]
	muls r0, r2, r0
	ldr r3, [r3]
	ldr r3, [r3, #4]
	adds r0, r0, r3
	str r0, [r1, #0x28]
	movs r1, #0xaa
	ldrsh r1, [r4, r1]
	ldr r0, [r4, #0x38]
	muls r2, r1, r2
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r0, [r4, #0x40]
	ldr r1, _022262E4 @ =ov07_022260F8
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_022262D8: .4byte 0x00005C71
_022262DC: .4byte 0x00000E38
_022262E0: .4byte 0x00003FFF
_022262E4: .4byte ov07_022260F8
	thumb_func_end ov07_022261B4

	thumb_func_start ov07_022262E8
ov07_022262E8: @ 0x022262E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	movs r1, #0x41
	lsls r1, r1, #2
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x3c
	bl ov07_02231FE4
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	str r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	str r0, [r4, #0x10]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #6]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	strh r0, [r4, #4]
	movs r0, #0
	str r0, [r4, #0x28]
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	ldr r2, _02226474 @ =0xFFFF0000
	movs r1, #0
	ands r2, r0
	lsls r0, r0, #0x10
	str r1, [r4, #0x1c]
	lsrs r2, r2, #0x10
	str r2, [r4, #0x20]
	lsrs r0, r0, #0x10
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bne _0222635A
	str r1, [r4, #0x20]
_0222635A:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _02226364
	movs r0, #0xff
	str r0, [r4, #0x24]
_02226364:
	ldr r1, [r4]
	adds r0, r5, #0
	bl ov07_0221C494
	str r0, [r4, #0x38]
	adds r0, r5, #0
	bl ov07_0221C478
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0222638C
	adds r0, r5, #0
	bl ov07_0221C468
	str r0, [r4, #0x14]
	adds r0, r5, #0
	bl ov07_0221C468
	b _0222639A
_0222638C:
	adds r0, r5, #0
	bl ov07_0221C470
	str r0, [r4, #0x14]
	adds r0, r5, #0
	bl ov07_0221C470
_0222639A:
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _022263A6
	bl GF_AssertFail
_022263A6:
	ldr r1, [r4, #0x14]
	adds r0, r5, #0
	add r2, sp, #0x14
	bl ov07_02231B90
	ldr r1, [r4, #0x18]
	adds r0, r5, #0
	add r2, sp, #8
	bl ov07_02231B90
	cmp r6, #0
	bne _022263CA
	add r0, sp, #0x14
	bl ov07_02231DD0
	ldr r0, [sp, #8]
	str r0, [sp, #0x14]
	b _022263D4
_022263CA:
	add r0, sp, #8
	bl ov07_02231DD0
	ldr r0, [sp, #0x14]
	str r0, [sp, #8]
_022263D4:
	ldr r0, [sp, #0x14]
	movs r1, #0xac
	blx FUN_020F2998
	adds r5, r0, #0
	ldr r0, [sp, #8]
	movs r1, #0xac
	blx FUN_020F2998
	adds r6, r0, #0
	ldr r0, [sp, #0x18]
	movs r1, #0xac
	blx FUN_020F2998
	adds r7, r0, #0
	ldr r0, [sp, #0xc]
	movs r1, #0xac
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldrh r0, [r4, #6]
	lsls r1, r5, #0x10
	lsls r2, r6, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	lsls r3, r7, #0x10
	adds r0, #0xa8
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222268
	ldr r0, [r4, #0x20]
	movs r5, #0
	cmp r0, #0
	ble _02226432
	adds r6, r4, #0
	adds r6, #0xa8
_02226424:
	adds r0, r6, #0
	bl ov07_022222B4
	ldr r0, [r4, #0x20]
	adds r5, r5, #1
	cmp r5, r0
	blt _02226424
_02226432:
	ldr r0, [r4, #0x24]
	cmp r0, #0xff
	beq _0222643C
	adds r0, r0, #1
	str r0, [r4, #0x1c]
_0222643C:
	movs r0, #0xa8
	ldrsh r3, [r4, r0]
	ldr r1, [r4, #0x38]
	movs r2, #0xac
	adds r0, r3, #0
	ldr r3, [r1, #0x20]
	muls r0, r2, r0
	ldr r3, [r3]
	ldr r3, [r3, #4]
	adds r0, r0, r3
	str r0, [r1, #0x28]
	movs r1, #0xaa
	ldrsh r1, [r4, r1]
	ldr r0, [r4, #0x38]
	muls r2, r1, r2
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r0, [r4, #0x40]
	ldr r1, _02226478 @ =ov07_022260F8
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02226474: .4byte 0xFFFF0000
_02226478: .4byte ov07_022260F8
	thumb_func_end ov07_022262E8

	thumb_func_start ov07_0222647C
ov07_0222647C: @ 0x0222647C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5, #0x38]
	bl ov07_022260DC
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0xa8
	adds r1, #0xcc
	bl ov07_02222384
	cmp r0, #0
	bne _022264B6
	cmp r4, #0
	bne _022264B6
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl FUN_020154C4
	ldr r0, [r5, #0x40]
	adds r1, r6, #0
	bl ov07_0221C448
	adds r0, r5, #0
	bl ov07_02232508
	pop {r4, r5, r6, pc}
_022264B6:
	movs r1, #0xa8
	ldrsh r1, [r5, r1]
	ldr r0, [r5, #0x38]
	movs r2, #0xac
	adds r3, r1, #0
	ldr r1, [r0, #0x20]
	muls r3, r2, r3
	ldr r1, [r1]
	ldr r1, [r1, #4]
	adds r1, r3, r1
	str r1, [r0, #0x28]
	movs r1, #0xaa
	ldrsh r1, [r5, r1]
	ldr r0, [r5, #0x38]
	muls r2, r1, r2
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r1, r2, r1
	str r1, [r0, #0x2c]
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0222647C

	thumb_func_start ov07_022264E0
ov07_022264E0: @ 0x022264E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	movs r1, #0x41
	lsls r1, r1, #2
	adds r6, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x3c
	bl ov07_02231FE4
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov07_0222600C
	adds r0, r6, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_02222004
	adds r5, r0, #0
	ldr r1, [r4, #0x14]
	adds r0, r6, #0
	add r2, sp, #0x20
	bl ov07_02231B90
	ldr r1, [r4, #0x18]
	adds r0, r6, #0
	add r2, sp, #0x14
	bl ov07_02231B90
	ldr r0, [sp, #0x20]
	movs r1, #0xac
	blx FUN_020F2998
	adds r6, r0, #0
	ldr r0, [sp, #0x14]
	movs r1, #0xac
	blx FUN_020F2998
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x24]
	movs r1, #0xac
	blx FUN_020F2998
	adds r7, r0, #0
	ldr r0, [sp, #0x18]
	movs r1, #0xac
	blx FUN_020F2998
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	str r1, [sp]
	movs r1, #0xe
	ldrsh r1, [r4, r1]
	movs r3, #0xc
	adds r2, r1, #0
	muls r2, r5, r2
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldrh r0, [r4, #6]
	lsls r2, r6, #0x10
	adds r1, r4, #0
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	adds r1, #0xcc
	lsls r0, r0, #0xc
	rsbs r0, r0, #0
	str r0, [sp, #0xc]
	ldrsh r6, [r4, r3]
	adds r0, r4, #0
	adds r0, #0xa8
	adds r3, r6, #0
	ldr r6, [sp, #0x10]
	muls r3, r5, r3
	adds r3, r6, r3
	lsls r3, r3, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222338
	cmp r5, #0
	ldr r2, _02226618 @ =0x00005C71
	ble _022265A6
	ldr r1, _0222661C @ =0x00000E38
	adds r0, r4, #0
	adds r0, #0xf0
	muls r1, r5, r1
	muls r2, r5, r2
	movs r3, #0xa
	bl ov07_022223F0
	b _022265B6
_022265A6:
	ldr r1, _02226620 @ =0x00003FFF
	adds r0, r4, #0
	adds r0, #0xf0
	muls r1, r5, r1
	muls r2, r5, r2
	movs r3, #0xa
	bl ov07_022223F0
_022265B6:
	ldr r0, [r4, #0x20]
	movs r5, #0
	cmp r0, #0
	ble _022265D6
	adds r6, r4, #0
	adds r7, r4, #0
	adds r6, #0xa8
	adds r7, #0xcc
_022265C6:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov07_02222384
	ldr r0, [r4, #0x20]
	adds r5, r5, #1
	cmp r5, r0
	blt _022265C6
_022265D6:
	ldr r0, [r4, #0x24]
	cmp r0, #0xff
	beq _022265E0
	adds r0, r0, #1
	str r0, [r4, #0x1c]
_022265E0:
	movs r0, #0xa8
	ldrsh r3, [r4, r0]
	ldr r1, [r4, #0x38]
	movs r2, #0xac
	adds r0, r3, #0
	ldr r3, [r1, #0x20]
	muls r0, r2, r0
	ldr r3, [r3]
	ldr r3, [r3, #4]
	adds r0, r0, r3
	str r0, [r1, #0x28]
	movs r1, #0xaa
	ldrsh r1, [r4, r1]
	ldr r0, [r4, #0x38]
	muls r2, r1, r2
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r0, [r4, #0x40]
	ldr r1, _02226624 @ =ov07_0222647C
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02226618: .4byte 0x00005C71
_0222661C: .4byte 0x00000E38
_02226620: .4byte 0x00003FFF
_02226624: .4byte ov07_0222647C
	thumb_func_end ov07_022264E0

	thumb_func_start ov07_02226628
ov07_02226628: @ 0x02226628
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5, #0x38]
	bl ov07_022260DC
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x58
	bl ov07_02222180
	cmp r0, #0
	bne _0222665E
	cmp r4, #0
	bne _0222665E
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl FUN_020154C4
	ldr r0, [r5, #0x40]
	adds r1, r6, #0
	bl ov07_0221C448
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
_0222665E:
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r2, [r0]
	movs r0, #0x5a
	ldrsh r0, [r5, r0]
	movs r3, #0xac
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r2, r1
	adds r2, r5, #0
	adds r2, #0x88
	ldr r4, [r2]
	movs r2, #0x58
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #0x38]
	muls r3, r2, r3
	ldr r2, [r0, #0x20]
	adds r3, r4, r3
	ldr r2, [r2]
	ldr r2, [r2, #4]
	adds r2, r3, r2
	str r2, [r0, #0x28]
	ldr r2, [r5, #0x38]
	ldr r0, [r2, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r2, #0x2c]
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_02226628

	thumb_func_start ov07_02226698
ov07_02226698: @ 0x02226698
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r1, #0x94
	adds r4, r0, #0
	bl ov07_022324D8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x3c
	bl ov07_02231FE4
	adds r0, r4, #0
	movs r1, #0
	bl ov07_0221C4A8
	str r0, [r5]
	adds r0, r4, #0
	movs r1, #1
	bl ov07_0221C4A8
	str r0, [r5, #4]
	adds r0, r4, #0
	movs r1, #2
	bl ov07_0221C4A8
	str r0, [r5, #0xc]
	adds r0, r4, #0
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [r5, #8]
	adds r0, r4, #0
	movs r1, #4
	bl ov07_0221C4A8
	str r0, [r5, #0x10]
	adds r0, r4, #0
	movs r1, #5
	bl ov07_0221C4A8
	str r0, [r5, #0x14]
	adds r0, r4, #0
	movs r1, #6
	bl ov07_0221C4A8
	str r0, [r5, #0x18]
	adds r0, r4, #0
	movs r1, #7
	bl ov07_0221C4A8
	str r0, [r5, #0x1c]
	adds r0, r4, #0
	movs r1, #8
	bl ov07_0221C4A8
	str r0, [r5, #0x20]
	cmp r0, #0
	bne _02226716
	adds r0, r4, #0
	bl ov07_0221C468
	b _0222671C
_02226716:
	adds r0, r4, #0
	bl ov07_0221C470
_0222671C:
	str r0, [r5, #0x24]
	adds r2, r5, #0
	ldr r1, [r5, #0x24]
	adds r0, r4, #0
	adds r2, #0x88
	bl ov07_02231B90
	ldr r1, [r5]
	adds r0, r4, #0
	bl ov07_0221C494
	str r0, [r5, #0x38]
	adds r0, r4, #0
	movs r1, #9
	bl ov07_0221C4A8
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov07_0221C488
	str r0, [r5, #0x34]
	ldr r1, [r5, #4]
	ldr r0, _022267FC @ =0x0000FFFF
	muls r0, r1, r0
	movs r1, #0x5a
	lsls r1, r1, #2
	blx FUN_020F2998
	adds r4, r0, #0
	ldr r1, [r5, #0xc]
	ldr r0, _022267FC @ =0x0000FFFF
	muls r0, r1, r0
	movs r1, #0x5a
	lsls r1, r1, #2
	blx FUN_020F2998
	adds r6, r0, #0
	ldr r1, [r5, #8]
	ldr r0, _022267FC @ =0x0000FFFF
	muls r0, r1, r0
	movs r1, #0x5a
	lsls r1, r1, #2
	blx FUN_020F2998
	adds r7, r0, #0
	ldr r1, [r5, #0x10]
	ldr r0, _022267FC @ =0x0000FFFF
	muls r0, r1, r0
	movs r1, #0x5a
	lsls r1, r1, #2
	blx FUN_020F2998
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x14]
	lsls r1, r4, #0x10
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	ldr r0, [r5, #0x18]
	lsls r2, r6, #0x10
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, #0x1c]
	lsls r3, r7, #0x10
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x58
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x10
	bl ov07_022220FC
	adds r0, r5, #0
	adds r0, #0x58
	bl ov07_02222180
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r2, [r0]
	movs r0, #0x5a
	ldrsh r0, [r5, r0]
	movs r3, #0x58
	movs r4, #0xac
	adds r1, r0, #0
	adds r0, r5, #0
	muls r1, r4, r1
	ldrsh r3, [r5, r3]
	adds r0, #0x88
	adds r2, r2, r1
	ldr r1, [r5, #0x38]
	ldr r0, [r0]
	muls r4, r3, r4
	adds r3, r0, r4
	ldr r0, [r1, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r3, r0
	str r0, [r1, #0x28]
	ldr r1, [r5, #0x38]
	ldr r0, [r1, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r2, r0
	str r0, [r1, #0x2c]
	ldr r0, [r5, #0x40]
	ldr r1, _02226800 @ =ov07_02226628
	adds r2, r5, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022267FC: .4byte 0x0000FFFF
_02226800: .4byte ov07_02226628
	thumb_func_end ov07_02226698

	thumb_func_start ov07_02226804
ov07_02226804: @ 0x02226804
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_0200DCA0
	cmp r0, #0
	ldr r0, [r4, #0x1c]
	bne _0222682A
	bl FUN_0200D9DC
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
_0222682A:
	bl FUN_0200DC18
	ldr r0, [r4, #0x10]
	bl FUN_0200D020
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02226804

	thumb_func_start ov07_02226838
ov07_02226838: @ 0x02226838
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x20
	adds r5, r0, #0
	adds r4, r3, #0
	bl ov07_022324D8
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov07_02231FE4
	adds r0, r5, #0
	movs r1, #0
	str r4, [r7, #0x1c]
	bl ov07_0221C4A8
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200DED0
	ldr r0, [r7, #4]
	ldr r1, _0222687C @ =ov07_02226804
	adds r2, r7, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222687C: .4byte ov07_02226804
	thumb_func_end ov07_02226838

	thumb_func_start ov07_02226880
ov07_02226880: @ 0x02226880
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02226892
	cmp r0, #1
	beq _02226910
	b _022269A8
_02226892:
	ldr r1, [r4, #0x34]
	ldr r0, _022269CC @ =0x02236670
	lsls r2, r1, #1
	ldrsh r6, [r0, r2]
	adds r0, r1, #1
	str r0, [r4, #0x34]
	cmp r6, #0xff
	beq _022268E2
	cmp r6, #0
	bne _022268D6
	ldr r0, [r4, #0x1c]
	bl FUN_0200DD48
	adds r5, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FAE8
	cmp r5, r0
	ldr r0, [r4, #4]
	bne _022268CA
	movs r1, #2
	bl ov07_0221FB04
	adds r1, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_0200DD54
	b _022268D6
_022268CA:
	bl ov07_0221FAE8
	adds r1, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_0200DD54
_022268D6:
	ldr r0, [r4, #0x1c]
	adds r1, r6, #0
	movs r2, #0
	bl FUN_0200DED0
	b _022269BE
_022268E2:
	ldr r0, [r4, #0x1c]
	movs r1, #2
	bl FUN_0200DF98
	adds r0, r4, #0
	ldr r2, _022269D0 @ =0x00000E38
	adds r0, #0x20
	movs r1, #0
	movs r3, #4
	bl ov07_022223F0
	movs r1, #7
	ldr r0, [r4, #0x1c]
	mvns r1, r1
	movs r2, #0x10
	bl FUN_0200E0CC
	movs r0, #0
	str r0, [r4, #0x34]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _022269BE
_02226910:
	adds r0, r4, #0
	adds r0, #0x20
	bl ov07_02222440
	cmp r0, #1
	bne _0222692A
	ldr r1, [r4, #0x20]
	ldr r0, [r4, #0x1c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FUN_0200E074
	b _022269BE
_0222692A:
	ldr r0, [r4, #0x34]
	cmp r0, #5
	ble _02226938
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _022269BE
_02226938:
	adds r0, r0, #1
	str r0, [r4, #0x34]
	cmp r0, #5
	bhi _022269BE
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222694C: @ jump table
	.2byte _022269BE - _0222694C - 2 @ case 0
	.2byte _02226958 - _0222694C - 2 @ case 1
	.2byte _02226968 - _0222694C - 2 @ case 2
	.2byte _02226978 - _0222694C - 2 @ case 3
	.2byte _02226988 - _0222694C - 2 @ case 4
	.2byte _02226998 - _0222694C - 2 @ case 5
_02226958:
	adds r0, r4, #0
	ldr r1, _022269D0 @ =0x00000E38
	ldr r2, _022269D4 @ =0xFFFFF1C8
	adds r0, #0x20
	movs r3, #4
	bl ov07_022223F0
	b _022269BE
_02226968:
	adds r0, r4, #0
	ldr r1, _022269D4 @ =0xFFFFF1C8
	ldr r2, _022269D0 @ =0x00000E38
	adds r0, #0x20
	movs r3, #4
	bl ov07_022223F0
	b _022269BE
_02226978:
	adds r0, r4, #0
	ldr r1, _022269D0 @ =0x00000E38
	ldr r2, _022269D4 @ =0xFFFFF1C8
	adds r0, #0x20
	movs r3, #4
	bl ov07_022223F0
	b _022269BE
_02226988:
	adds r0, r4, #0
	ldr r1, _022269D4 @ =0xFFFFF1C8
	ldr r2, _022269D0 @ =0x00000E38
	adds r0, #0x20
	movs r3, #4
	bl ov07_022223F0
	b _022269BE
_02226998:
	adds r0, r4, #0
	ldr r1, _022269D0 @ =0x00000E38
	adds r0, #0x20
	movs r2, #0
	movs r3, #2
	bl ov07_022223F0
	b _022269BE
_022269A8:
	ldr r0, [r4, #0x1c]
	bl FUN_0200D9DC
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
_022269BE:
	ldr r0, [r4, #0x1c]
	bl FUN_0200DC18
	ldr r0, [r4, #0x10]
	bl FUN_0200D020
	pop {r4, r5, r6, pc}
	.align 2, 0
_022269CC: .4byte 0x02236670
_022269D0: .4byte 0x00000E38
_022269D4: .4byte 0xFFFFF1C8
	thumb_func_end ov07_02226880

	thumb_func_start ov07_022269D8
ov07_022269D8: @ 0x022269D8
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x38
	adds r5, r0, #0
	adds r6, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	str r6, [r4, #0x1c]
	movs r0, #0
	str r0, [r4, #0x34]
	adds r0, r5, #0
	bl ov07_0221C470
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0
	bl ov07_02221F80
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #1
	bl ov07_02221F80
	adds r2, r0, #0
	ldr r0, [r4, #0x1c]
	adds r1, r6, #0
	bl FUN_0200DDB8
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	ldr r0, [r4, #0x1c]
	bne _02226A38
	movs r1, #1
	bl FUN_0200DC4C
	b _02226A3E
_02226A38:
	movs r1, #0
	bl FUN_0200DC4C
_02226A3E:
	ldr r0, [r4, #4]
	bl ov07_0221FAE8
	adds r1, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_0200DD54
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #0xc
	bl FUN_0200DED0
	ldr r0, [r4, #4]
	ldr r1, _02226A64 @ =ov07_02226880
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02226A64: .4byte ov07_02226880
	thumb_func_end ov07_022269D8

	thumb_func_start ov07_02226A68
ov07_02226A68: @ 0x02226A68
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_0200DCA0
	cmp r0, #0
	ldr r0, [r4, #0x1c]
	bne _02226A8E
	bl FUN_0200D9DC
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
_02226A8E:
	bl FUN_0200DC18
	ldr r0, [r4, #0x10]
	bl FUN_0200D020
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02226A68

	thumb_func_start ov07_02226A9C
ov07_02226A9C: @ 0x02226A9C
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x38
	adds r5, r0, #0
	adds r6, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	adds r0, r5, #0
	str r6, [r4, #0x1c]
	bl ov07_0221C470
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0
	bl ov07_02221F80
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #1
	bl ov07_02221F80
	adds r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02226AE4
	movs r6, #0x48
	movs r2, #0x20
	movs r5, #0
	b _02226AFA
_02226AE4:
	ldr r0, [r4, #4]
	adds r1, r7, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _02226AF6
	movs r2, #0x7e
	movs r5, #1
	b _02226AFA
_02226AF6:
	movs r2, #0x20
	movs r5, #0
_02226AFA:
	ldr r0, [r4, #0x1c]
	adds r1, r6, #0
	bl FUN_0200DDB8
	ldr r0, [r4, #0x1c]
	adds r1, r5, #0
	bl FUN_0200DC4C
	ldr r0, [r4, #4]
	movs r1, #2
	bl ov07_0221FB04
	adds r1, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_0200DD54
	ldr r0, [r4, #4]
	ldr r1, _02226B28 @ =ov07_02226A68
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02226B28: .4byte ov07_02226A68
	thumb_func_end ov07_02226A9C

	thumb_func_start ov07_02226B2C
ov07_02226B2C: @ 0x02226B2C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bhi _02226C1E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02226B46: @ jump table
	.2byte _02226B4E - _02226B46 - 2 @ case 0
	.2byte _02226B74 - _02226B46 - 2 @ case 1
	.2byte _02226B8C - _02226B46 - 2 @ case 2
	.2byte _02226BC8 - _02226B46 - 2 @ case 3
_02226B4E:
	movs r0, #0xa0
	str r0, [sp]
	movs r3, #0x70
	movs r0, #1
	str r3, [sp, #4]
	movs r2, #0x15
	str r2, [sp, #8]
	lsls r0, r0, #0x12
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	adds r1, #0x48
	subs r2, #0x33
	bl ov07_02222338
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02226C36
_02226B74:
	adds r0, r4, #0
	ldr r2, [r4, #0x1c]
	adds r0, #0x24
	adds r1, #0x48
	bl ov07_022223CC
	cmp r0, #0
	bne _02226C36
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02226C36
_02226B8C:
	ldr r0, [r4, #0x1c]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _02226C36
	ldr r0, [r4, #0x1c]
	movs r1, #1
	bl FUN_0200E0FC
	adds r0, r4, #0
	adds r2, r4, #0
	movs r1, #0x10
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x21
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x20
	adds r2, #0x21
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4, #4]
	bl ov07_02231E08
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02226C36
_02226BC8:
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _02226BE0
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_02226BE0:
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x10
	bhs _02226BF8
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x21
	strb r1, [r0]
_02226BF8:
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _02226C48 @ =0x04000052
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _02226C36
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02226C36
_02226C1E:
	ldr r0, [r4, #0x1c]
	bl FUN_0200D9DC
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x10
	pop {r3, r4, r5, pc}
_02226C36:
	ldr r0, [r4, #0x1c]
	bl FUN_0200DC18
	ldr r0, [r4, #0x10]
	bl FUN_0200D020
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02226C48: .4byte 0x04000052
	thumb_func_end ov07_02226B2C

	thumb_func_start ov07_02226C4C
ov07_02226C4C: @ 0x02226C4C
	push {r4, r5, r6, lr}
	movs r1, #0x6c
	adds r6, r0, #0
	adds r5, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	movs r1, #0x1d
	str r5, [r4, #0x1c]
	adds r0, r5, #0
	mvns r1, r1
	movs r2, #0xa0
	bl FUN_0200DDB8
	ldr r0, [r4, #4]
	movs r1, #2
	bl ov07_0221FB04
	adds r1, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_0200DD54
	ldr r0, [r4, #4]
	ldr r1, _02226C8C @ =ov07_02226B2C
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	.align 2, 0
_02226C8C: .4byte ov07_02226B2C
	thumb_func_end ov07_02226C4C

	thumb_func_start ov07_02226C90
ov07_02226C90: @ 0x02226C90
	push {r4, lr}
	movs r1, #0
	adds r4, r0, #0
	bl ov07_0221C4A8
	cmp r0, #0
	beq _02226CA6
	adds r0, r4, #0
	bl ov07_02222FC4
	pop {r4, pc}
_02226CA6:
	adds r0, r4, #0
	bl ov07_02222FF4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02226C90

	thumb_func_start ov07_02226CB0
ov07_02226CB0: @ 0x02226CB0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0x18
	bls _02226CBE
	b _02226EB2
_02226CBE:
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02226CCA: @ jump table
	.2byte _02226CFC - _02226CCA - 2 @ case 0
	.2byte _02226EB2 - _02226CCA - 2 @ case 1
	.2byte _02226EB2 - _02226CCA - 2 @ case 2
	.2byte _02226EB2 - _02226CCA - 2 @ case 3
	.2byte _02226EB2 - _02226CCA - 2 @ case 4
	.2byte _02226DA8 - _02226CCA - 2 @ case 5
	.2byte _02226DA8 - _02226CCA - 2 @ case 6
	.2byte _02226DD2 - _02226CCA - 2 @ case 7
	.2byte _02226EB2 - _02226CCA - 2 @ case 8
	.2byte _02226EB2 - _02226CCA - 2 @ case 9
	.2byte _02226DEC - _02226CCA - 2 @ case 10
	.2byte _02226DEC - _02226CCA - 2 @ case 11
	.2byte _02226E16 - _02226CCA - 2 @ case 12
	.2byte _02226EB2 - _02226CCA - 2 @ case 13
	.2byte _02226EB2 - _02226CCA - 2 @ case 14
	.2byte _02226E2E - _02226CCA - 2 @ case 15
	.2byte _02226E2E - _02226CCA - 2 @ case 16
	.2byte _02226E58 - _02226CCA - 2 @ case 17
	.2byte _02226EB2 - _02226CCA - 2 @ case 18
	.2byte _02226EB2 - _02226CCA - 2 @ case 19
	.2byte _02226EB2 - _02226CCA - 2 @ case 20
	.2byte _02226EB2 - _02226CCA - 2 @ case 21
	.2byte _02226E70 - _02226CCA - 2 @ case 22
	.2byte _02226E70 - _02226CCA - 2 @ case 23
	.2byte _02226E9A - _02226CCA - 2 @ case 24
_02226CFC:
	ldr r0, [r4, #0x34]
	ldr r1, _02226EF8 @ =0xFFFF1FFF
	cmp r0, #0
	bne _02226D56
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r2, [r0]
	adds r5, r0, #0
	ands r2, r1
	lsrs r1, r0, #0xd
	orrs r1, r2
	str r1, [r0]
	adds r5, #0x48
	ldrh r3, [r5]
	movs r2, #0x3f
	movs r1, #0xf
	bics r3, r2
	orrs r1, r3
	movs r3, #0x20
	orrs r1, r3
	strh r1, [r5]
	adds r5, r0, #0
	adds r5, #0x4a
	ldrh r6, [r5]
	movs r1, #0x1f
	bics r6, r2
	orrs r1, r6
	orrs r1, r3
	strh r1, [r5]
	adds r1, r0, #0
	movs r2, #0x80
	adds r1, #0x40
	strh r2, [r1]
	ldr r1, _02226EFC @ =0x0000A0C0
	adds r0, #0x44
	strh r1, [r0]
	bl FUN_0201FD44
	movs r1, #5
	blx FUN_020F2998
	adds r1, #0x23
	add sp, #4
	str r1, [r4, #0x3c]
	pop {r3, r4, r5, r6, pc}
_02226D56:
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r2, [r0]
	adds r5, r0, #0
	ands r2, r1
	lsrs r1, r0, #0xd
	orrs r1, r2
	str r1, [r0]
	adds r5, #0x48
	ldrh r3, [r5]
	movs r2, #0x3f
	movs r1, #0xf
	bics r3, r2
	orrs r1, r3
	movs r3, #0x20
	orrs r1, r3
	strh r1, [r5]
	adds r5, r0, #0
	adds r5, #0x4a
	ldrh r6, [r5]
	movs r1, #0x1f
	bics r6, r2
	orrs r1, r6
	orrs r1, r3
	strh r1, [r5]
	adds r1, r0, #0
	lsls r2, r3, #0xa
	adds r1, #0x40
	strh r2, [r1]
	ldr r1, _02226F00 @ =0x000056C0
	adds r0, #0x44
	strh r1, [r0]
	bl FUN_0201FD44
	movs r1, #5
	blx FUN_020F2998
	adds r1, #0x23
	add sp, #4
	str r1, [r4, #0x3c]
	pop {r3, r4, r5, r6, pc}
_02226DA8:
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	beq _02226DD8
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _02226DD8
	adds r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #4
	bl FUN_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226DD2:
	ldr r0, [r4, #0x38]
	cmp r0, #1
	bne _02226DDA
_02226DD8:
	b _02226EF4
_02226DDA:
	adds r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #4
	bl FUN_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226DEC:
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	beq _02226EF4
	ldr r0, [r4, #0x38]
	cmp r0, #1
	bne _02226EF4
	adds r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #4
	bl FUN_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226E16:
	ldr r0, [r4, #0x38]
	cmp r0, #2
	beq _02226EF4
	adds r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #4
	bl FUN_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226E2E:
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	beq _02226EF4
	ldr r0, [r4, #0x38]
	cmp r0, #2
	bne _02226EF4
	adds r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #4
	bl FUN_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226E58:
	ldr r0, [r4, #0x38]
	cmp r0, #3
	beq _02226EF4
	adds r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #4
	bl FUN_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226E70:
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	beq _02226EF4
	ldr r0, [r4, #0x38]
	cmp r0, #3
	bne _02226EF4
	adds r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #8
	bl FUN_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226E9A:
	ldr r0, [r4, #0x38]
	cmp r0, #4
	beq _02226EF4
	adds r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #8
	bl FUN_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226EB2:
	ldr r1, [r4, #0x3c]
	cmp r0, r1
	ble _02226EF4
	ldr r0, [r4, #0x38]
	cmp r0, #0x14
	ldr r0, [r4, #0x1c]
	bge _02226EEE
	movs r1, #0
	movs r2, #4
	bl FUN_0200DED0
	add r1, sp, #0
	ldr r0, [r4, #0x1c]
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	add r0, sp, #0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x82
	ble _02226EE4
	ldr r0, [r4, #0x1c]
	bl FUN_0200DCE8
_02226EE4:
	ldr r0, [r4, #0x38]
	add sp, #4
	adds r0, r0, #1
	str r0, [r4, #0x38]
	pop {r3, r4, r5, r6, pc}
_02226EEE:
	movs r1, #0
	bl FUN_0200DCE8
_02226EF4:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02226EF8: .4byte 0xFFFF1FFF
_02226EFC: .4byte 0x0000A0C0
_02226F00: .4byte 0x000056C0
	thumb_func_end ov07_02226CB0

	thumb_func_start ov07_02226F04
ov07_02226F04: @ 0x02226F04
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _02226F16
	adds r0, r4, #0
	bl ov07_02226CB0
_02226F16:
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [r4, #0x24]
	cmp r1, r0
	blt _02226F6E
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02226F7C @ =0xFFFF1FFF
	ands r1, r2
	adds r2, r0, #0
	str r1, [r0]
	adds r2, #0x48
	ldrh r3, [r2]
	movs r1, #0x3f
	bics r3, r1
	strh r3, [r2]
	adds r2, r0, #0
	adds r2, #0x4a
	ldrh r3, [r2]
	bics r3, r1
	strh r3, [r2]
	adds r2, r0, #0
	movs r1, #0
	adds r2, #0x40
	strh r1, [r2]
	adds r0, #0x44
	strh r1, [r0]
	ldr r0, [r4, #0x1c]
	bl FUN_0200DCE8
	ldr r0, [r4, #0xc]
	bl FUN_0200D020
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
_02226F6E:
	ldr r0, [r4, #0x1c]
	bl FUN_0200DC18
	ldr r0, [r4, #0xc]
	bl FUN_0200D020
	pop {r3, r4, r5, pc}
	.align 2, 0
_02226F7C: .4byte 0xFFFF1FFF
	thumb_func_end ov07_02226F04

	thumb_func_start ov07_02226F80
ov07_02226F80: @ 0x02226F80
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x40
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #0x20]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	str r0, [r4, #0x24]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #0x28]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #0x2c]
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	str r0, [r4, #0x30]
	adds r0, r5, #0
	movs r1, #6
	bl ov07_0221C4A8
	str r0, [r4, #0x34]
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x20]
	bl ov07_0221C4E8
	str r0, [r4, #0x1c]
	movs r0, #0
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x28]
	cmp r1, #0xff
	beq _02226FF2
	adds r0, r5, #0
	bl ov07_0221FB04
	adds r1, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_0200DD54
_02226FF2:
	ldr r1, [r4, #0x2c]
	cmp r1, #0xff
	beq _02226FFE
	ldr r0, [r4, #0x1c]
	bl FUN_0200DD68
_02226FFE:
	adds r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	beq _02227030
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	cmp r0, #2
	beq _02227020
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	cmp r0, #3
	bne _02227030
_02227020:
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_0200DCE8
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
_02227030:
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov07_0221C468
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov07_0221C470
	str r0, [sp]
	ldr r0, [r4, #0x2c]
	cmp r0, #0xff
	beq _0222707E
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_02231924
	adds r6, r0, #0
	ldr r1, [sp]
	adds r0, r5, #0
	bl ov07_02231924
	cmp r7, #3
	bhi _0222707E
	adds r1, r7, r7
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02227072: @ jump table
	.2byte _0222707A - _02227072 - 2 @ case 0
	.2byte _02227104 - _02227072 - 2 @ case 1
	.2byte _022270C0 - _02227072 - 2 @ case 2
	.2byte _02227148 - _02227072 - 2 @ case 3
_0222707A:
	cmp r6, #5
	bls _02227080
_0222707E:
	b _0222718A
_02227080:
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222708C: @ jump table
	.2byte _0222718A - _0222708C - 2 @ case 0
	.2byte _0222718A - _0222708C - 2 @ case 1
	.2byte _02227098 - _0222708C - 2 @ case 2
	.2byte _022270A2 - _0222708C - 2 @ case 3
	.2byte _022270AC - _0222708C - 2 @ case 4
	.2byte _022270B6 - _0222708C - 2 @ case 5
_02227098:
	ldr r0, [r4, #0x1c]
	movs r1, #0x14
	bl FUN_0200DD68
	b _0222718A
_022270A2:
	ldr r0, [r4, #0x1c]
	movs r1, #0xa
	bl FUN_0200DD68
	b _0222718A
_022270AC:
	ldr r0, [r4, #0x1c]
	movs r1, #0xa
	bl FUN_0200DD68
	b _0222718A
_022270B6:
	ldr r0, [r4, #0x1c]
	movs r1, #0x14
	bl FUN_0200DD68
	b _0222718A
_022270C0:
	cmp r6, #5
	bhi _0222718A
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022270D0: @ jump table
	.2byte _0222718A - _022270D0 - 2 @ case 0
	.2byte _0222718A - _022270D0 - 2 @ case 1
	.2byte _022270DC - _022270D0 - 2 @ case 2
	.2byte _022270E6 - _022270D0 - 2 @ case 3
	.2byte _022270F0 - _022270D0 - 2 @ case 4
	.2byte _022270FA - _022270D0 - 2 @ case 5
_022270DC:
	ldr r0, [r4, #0x1c]
	movs r1, #0xa
	bl FUN_0200DD68
	b _0222718A
_022270E6:
	ldr r0, [r4, #0x1c]
	movs r1, #0x14
	bl FUN_0200DD68
	b _0222718A
_022270F0:
	ldr r0, [r4, #0x1c]
	movs r1, #0x14
	bl FUN_0200DD68
	b _0222718A
_022270FA:
	ldr r0, [r4, #0x1c]
	movs r1, #0xa
	bl FUN_0200DD68
	b _0222718A
_02227104:
	cmp r0, #5
	bhi _0222718A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02227114: @ jump table
	.2byte _0222718A - _02227114 - 2 @ case 0
	.2byte _0222718A - _02227114 - 2 @ case 1
	.2byte _02227120 - _02227114 - 2 @ case 2
	.2byte _0222712A - _02227114 - 2 @ case 3
	.2byte _02227134 - _02227114 - 2 @ case 4
	.2byte _0222713E - _02227114 - 2 @ case 5
_02227120:
	ldr r0, [r4, #0x1c]
	movs r1, #0x14
	bl FUN_0200DD68
	b _0222718A
_0222712A:
	ldr r0, [r4, #0x1c]
	movs r1, #0xa
	bl FUN_0200DD68
	b _0222718A
_02227134:
	ldr r0, [r4, #0x1c]
	movs r1, #0xa
	bl FUN_0200DD68
	b _0222718A
_0222713E:
	ldr r0, [r4, #0x1c]
	movs r1, #0x14
	bl FUN_0200DD68
	b _0222718A
_02227148:
	cmp r0, #5
	bhi _0222718A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02227158: @ jump table
	.2byte _0222718A - _02227158 - 2 @ case 0
	.2byte _0222718A - _02227158 - 2 @ case 1
	.2byte _02227164 - _02227158 - 2 @ case 2
	.2byte _0222716E - _02227158 - 2 @ case 3
	.2byte _02227178 - _02227158 - 2 @ case 4
	.2byte _02227182 - _02227158 - 2 @ case 5
_02227164:
	ldr r0, [r4, #0x1c]
	movs r1, #0xa
	bl FUN_0200DD68
	b _0222718A
_0222716E:
	ldr r0, [r4, #0x1c]
	movs r1, #0x14
	bl FUN_0200DD68
	b _0222718A
_02227178:
	ldr r0, [r4, #0x1c]
	movs r1, #0x14
	bl FUN_0200DD68
	b _0222718A
_02227182:
	ldr r0, [r4, #0x1c]
	movs r1, #0xa
	bl FUN_0200DD68
_0222718A:
	ldr r0, [r4, #4]
	ldr r1, _02227198 @ =ov07_02226F04
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02227198: .4byte ov07_02226F04
	thumb_func_end ov07_02226F80

	thumb_func_start ov07_0222719C
ov07_0222719C: @ 0x0222719C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r2, r0, #0
	ldr r0, [r6, #0x2c]
	cmp r0, #0
	bne _022271B8
	ldr r0, [r6, #4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
_022271B8:
	subs r0, r0, #1
	str r0, [r6, #0x2c]
	movs r4, #0
	adds r5, r6, #0
_022271C0:
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _022271CA
	bl FUN_0200DC18
_022271CA:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _022271C0
	ldr r0, [r6, #0xc]
	bl FUN_0200D020
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_0222719C

	thumb_func_start ov07_022271DC
ov07_022271DC: @ 0x022271DC
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x34
	adds r4, r0, #0
	bl ov07_022324D8
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov07_02231FE4
	adds r0, r4, #0
	movs r1, #0
	bl ov07_0221C4A8
	cmp r0, #0
	bne _02227200
	movs r0, #3
	b _02227208
_02227200:
	adds r0, r4, #0
	movs r1, #0
	bl ov07_0221C4A8
_02227208:
	ldr r5, _02227240 @ =0x022378B0
	str r0, [r7, #0x2c]
	movs r6, #0
	adds r4, r7, #0
_02227210:
	ldr r0, [r7, #4]
	adds r1, r6, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x1c]
	cmp r0, #0
	beq _02227224
	ldr r1, [r5]
	bl FUN_0200DD68
_02227224:
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #4
	blt _02227210
	ldr r0, [r7, #4]
	ldr r1, _02227244 @ =ov07_0222719C
	adds r2, r7, #0
	bl ov07_0221C410
	adds r1, r7, #0
	bl ov07_0222719C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02227240: .4byte 0x022378B0
_02227244: .4byte ov07_0222719C
	thumb_func_end ov07_022271DC

	thumb_func_start ov07_02227248
ov07_02227248: @ 0x02227248
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r1, #0
	adds r4, r0, #0
	ldrb r0, [r5, #8]
	cmp r0, #0
	beq _0222725C
	cmp r0, #1
	beq _022272A4
	b _022272BC
_0222725C:
	movs r0, #0
	str r0, [r5]
	ldr r0, [r5, #0xc]
	movs r1, #2
	bl ov07_0221FAF8
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl ov07_02222D88
	adds r6, r0, #0
	ldr r0, [r5, #0xc]
	bl ov07_0221BFD0
	movs r1, #0xc8
	str r1, [sp]
	movs r3, #2
	str r4, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r1, #0
	movs r1, #0xa0
	adds r2, r1, #0
	adds r2, #0xb5
	lsls r3, r3, #0x10
	bl ov07_02222CCC
	str r0, [r5, #0x24]
	ldrb r0, [r5, #8]
	add sp, #0x14
	adds r0, r0, #1
	strb r0, [r5, #8]
	pop {r3, r4, r5, r6, pc}
_022272A4:
	ldr r0, [r5]
	adds r1, r0, #1
	str r1, [r5]
	ldr r0, [r5, #4]
	cmp r1, r0
	blt _022272CA
	ldr r0, [r5, #0x24]
	bl ov07_02222D3C
	ldrb r0, [r5, #8]
	adds r0, r0, #1
	strb r0, [r5, #8]
_022272BC:
	ldr r0, [r5, #0xc]
	adds r1, r4, #0
	bl ov07_0221C448
	adds r0, r5, #0
	bl FUN_0201AB0C
_022272CA:
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_02227248

	thumb_func_start ov07_022272D0
ov07_022272D0: @ 0x022272D0
	push {r3, r4, r5, lr}
	movs r1, #0x28
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #8
	bl ov07_02231FE4
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #4]
	ldr r0, [r4, #0xc]
	ldr r1, _022272FC @ =ov07_02227248
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	.align 2, 0
_022272FC: .4byte ov07_02227248
	thumb_func_end ov07_022272D0

	thumb_func_start ov07_02227300
ov07_02227300: @ 0x02227300
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r1, #0
	str r0, [sp, #0xc]
	ldrb r0, [r4]
	cmp r0, #3
	bls _02227310
	b _02227482
_02227310:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222731C: @ jump table
	.2byte _02227324 - _0222731C - 2 @ case 0
	.2byte _022273D6 - _0222731C - 2 @ case 1
	.2byte _022273F4 - _0222731C - 2 @ case 2
	.2byte _0222744E - _0222731C - 2 @ case 3
_02227324:
	ldrb r0, [r4, #4]
	movs r7, #0
	adds r1, r7, #0
	adds r0, r0, #1
	strb r0, [r4, #4]
	ldr r0, [r4, #8]
	bl ov07_0221C4A8
	cmp r0, #0
	ble _0222739A
	ldr r6, _022274F0 @ =0x022366D2
	adds r5, r4, #0
_0222733C:
	add r1, sp, #0x10
	ldr r0, [r5, #0x14]
	adds r1, #2
	add r2, sp, #0x10
	bl FUN_0200DE44
	ldrb r1, [r4, #4]
	ldrb r0, [r6]
	cmp r1, r0
	blo _02227380
	adds r0, r4, r7
	ldrb r1, [r0, #1]
	adds r1, r1, #1
	strb r1, [r0, #1]
	ldrb r2, [r0, #1]
	ldrb r1, [r6, #1]
	cmp r2, r1
	blo _02227388
	movs r1, #0
	strb r1, [r0, #1]
	ldr r0, [r5, #0x14]
	bl FUN_0200DCFC
	cmp r0, #1
	ldr r0, [r5, #0x14]
	bne _02227378
	movs r1, #0
	bl FUN_0200DCE8
	b _02227388
_02227378:
	movs r1, #1
	bl FUN_0200DCE8
	b _02227388
_02227380:
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl FUN_0200DCE8
_02227388:
	ldr r0, [r4, #8]
	movs r1, #0
	adds r5, r5, #4
	adds r6, r6, #2
	adds r7, r7, #1
	bl ov07_0221C4A8
	cmp r7, r0
	blt _0222733C
_0222739A:
	ldrb r0, [r4, #4]
	cmp r0, #0x2d
	blo _02227438
	movs r5, #0
	ldr r0, [r4, #8]
	adds r1, r5, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _022273CA
	adds r6, r4, #0
	movs r7, #1
_022273B2:
	ldr r0, [r6, #0x14]
	adds r1, r7, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #8]
	movs r1, #0
	adds r6, r6, #4
	adds r5, r5, #1
	bl ov07_0221C4A8
	cmp r5, r0
	blt _022273B2
_022273CA:
	movs r0, #0
	strb r0, [r4, #4]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _022274BC
_022273D6:
	movs r1, #0x64
	str r1, [sp]
	str r1, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x20
	movs r2, #0x3c
	adds r3, r1, #0
	bl ov07_02222590
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _022274BC
_022273F4:
	adds r0, r4, #0
	adds r0, #0x20
	bl ov07_0222260C
	cmp r0, #1
	bne _0222743A
	movs r5, #0
	ldr r0, [r4, #8]
	adds r1, r5, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _022274BC
	adds r7, r4, #0
	adds r6, r4, #0
	adds r7, #0x20
_02227414:
	adds r0, r7, #0
	add r1, sp, #0x18
	add r2, sp, #0x14
	bl ov07_02222644
	ldr r0, [r6, #0x14]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x14]
	bl FUN_0200E024
	ldr r0, [r4, #8]
	movs r1, #0
	adds r6, r6, #4
	adds r5, r5, #1
	bl ov07_0221C4A8
	cmp r5, r0
	blt _02227414
_02227438:
	b _022274BC
_0222743A:
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	ldrb r0, [r4, #4]
	cmp r0, #0x2d
	blo _022274BC
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _022274BC
_0222744E:
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _02227458
	subs r0, r0, #1
	strb r0, [r4, #5]
_02227458:
	ldrb r0, [r4, #6]
	cmp r0, #0xf
	bhs _02227462
	adds r0, r0, #1
	strb r0, [r4, #6]
_02227462:
	ldrb r0, [r4, #5]
	cmp r0, #0
	bne _02227474
	ldrb r0, [r4, #6]
	cmp r0, #0xf
	bne _02227474
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_02227474:
	ldrb r0, [r4, #6]
	ldrb r1, [r4, #5]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _022274F4 @ =0x04000052
	strh r1, [r0]
	b _022274BC
_02227482:
	movs r5, #0
	ldr r0, [r4, #8]
	adds r1, r5, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _022274AA
	adds r6, r4, #0
	adds r7, r5, #0
_02227494:
	ldr r0, [r6, #0x14]
	bl FUN_0200D9DC
	ldr r0, [r4, #8]
	adds r1, r7, #0
	adds r6, r6, #4
	adds r5, r5, #1
	bl ov07_0221C4A8
	cmp r5, r0
	blt _02227494
_022274AA:
	ldr r0, [r4, #8]
	ldr r1, [sp, #0xc]
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_022274BC:
	movs r5, #0
	ldr r0, [r4, #8]
	adds r1, r5, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _022274E6
	adds r6, r4, #0
	adds r7, r5, #0
_022274CE:
	ldr r0, [r6, #0x14]
	ldr r0, [r0]
	bl FUN_0200DC0C
	ldr r0, [r4, #8]
	adds r1, r7, #0
	adds r6, r6, #4
	adds r5, r5, #1
	bl ov07_0221C4A8
	cmp r5, r0
	blt _022274CE
_022274E6:
	ldr r0, [r4, #0x10]
	bl FUN_0200D020
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022274F0: .4byte 0x022366D2
_022274F4: .4byte 0x04000052
	thumb_func_end ov07_02227300

	thumb_func_start ov07_022274F8
ov07_022274F8: @ 0x022274F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp]
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov07_0221BFD0
	movs r1, #0x44
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02227516
	bl GF_AssertFail
_02227516:
	movs r0, #0
	strb r0, [r4, #4]
	strb r0, [r4]
	str r5, [r4, #0xc]
	ldr r0, [sp]
	str r6, [r4, #0x10]
	str r0, [r4, #8]
	ldr r1, [sp]
	add r0, sp, #8
	bl ov07_0221F9E8
	movs r1, #0
	mvns r1, r1
	ldr r0, [r4, #8]
	adds r2, r1, #0
	bl ov07_02231E08
	movs r0, #0xf
	strb r0, [r4, #5]
	movs r0, #0
	strb r0, [r4, #6]
	ldrb r0, [r4, #6]
	ldrb r1, [r4, #5]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _02227628 @ =0x04000052
	strh r1, [r0]
	ldr r0, [sp]
	str r7, [r4, #0x14]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [sp]
	bl ov07_0223192C
	cmp r0, #3
	bne _02227572
	ldr r0, [sp]
	bl ov07_0221BFC0
	adds r1, r0, #0
	movs r0, #0
	add r2, sp, #4
	bl ov07_02231A20
	b _02227582
_02227572:
	ldr r0, [sp]
	bl ov07_0221BFC0
	adds r1, r0, #0
	movs r0, #1
	add r2, sp, #4
	bl ov07_02231A20
_02227582:
	ldr r0, [r4, #8]
	movs r1, #0
	movs r6, #1
	bl ov07_0221C4A8
	cmp r0, #1
	ble _022275BC
	adds r5, r4, #4
	add r7, sp, #4
_02227594:
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r2, sp, #8
	bl FUN_0200D734
	str r0, [r5, #0x14]
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r7, r1]
	ldrsh r2, [r7, r2]
	bl FUN_0200DDB8
	ldr r0, [r4, #8]
	movs r1, #0
	adds r5, r5, #4
	adds r6, r6, #1
	bl ov07_0221C4A8
	cmp r6, r0
	blt _02227594
_022275BC:
	add r3, sp, #4
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #0x14]
	bl FUN_0200DDB8
	movs r6, #0
	ldr r0, [r4, #8]
	adds r1, r6, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _02227616
	adds r5, r4, #0
	adds r7, r6, #0
_022275DE:
	adds r1, r4, r6
	movs r0, #0
	strb r0, [r1, #1]
	ldr r0, [r5, #0x14]
	movs r1, #2
	bl FUN_0200DF98
	movs r2, #0x20
	subs r2, r2, r7
	lsls r2, r2, #0x10
	ldr r0, [r5, #0x14]
	movs r1, #0
	asrs r2, r2, #0x10
	bl FUN_0200DED0
	ldr r0, [r5, #0x14]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #8]
	movs r1, #0
	adds r5, r5, #4
	adds r7, r7, #4
	adds r6, r6, #1
	bl ov07_0221C4A8
	cmp r6, r0
	blt _022275DE
_02227616:
	movs r3, #1
	ldr r0, [sp]
	ldr r1, _0222762C @ =ov07_02227300
	adds r2, r4, #0
	lsls r3, r3, #0xc
	bl ov07_0221C3F4
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02227628: .4byte 0x04000052
_0222762C: .4byte ov07_02227300
	thumb_func_end ov07_022274F8

	thumb_func_start ov07_02227630
ov07_02227630: @ 0x02227630
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #5
	bls _02227640
	b _02227810
_02227640:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222764C: @ jump table
	.2byte _02227658 - _0222764C - 2 @ case 0
	.2byte _022276BA - _0222764C - 2 @ case 1
	.2byte _022276D4 - _0222764C - 2 @ case 2
	.2byte _022276F8 - _0222764C - 2 @ case 3
	.2byte _02227752 - _0222764C - 2 @ case 4
	.2byte _022277A0 - _0222764C - 2 @ case 5
_02227658:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	bne _022276B0
	adds r0, r4, #0
	adds r0, #0x38
	bl ov07_022227D8
	movs r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0xd
	bl FUN_020087A4
	movs r2, #0x38
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_02008C2C
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_022276B0:
	ldrb r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022276BA:
	movs r0, #0x1f
	str r0, [sp]
	movs r1, #0
	ldr r0, [r4, #0x10]
	movs r2, #0xa
	adds r3, r1, #0
	bl FUN_020090B4
	ldrb r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022276D4:
	ldr r0, [r4, #0x10]
	bl FUN_02009138
	cmp r0, #0
	bne _02227702
	movs r0, #0x1f
	str r0, [sp]
	movs r2, #0
	ldr r0, [r4, #0x10]
	movs r1, #0xa
	adds r3, r2, #0
	bl FUN_020090B4
	ldrb r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022276F8:
	ldr r0, [r4, #0x10]
	bl FUN_02009138
	cmp r0, #0
	beq _02227704
_02227702:
	b _0222781E
_02227704:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #8]
	cmp r0, #3
	blo _0222774A
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl ov07_0221C4A8
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl ov07_0221C4A8
	adds r6, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [sp]
	adds r0, r4, #0
	lsls r1, r5, #0x10
	lsls r3, r6, #0x10
	adds r0, #0x14
	asrs r1, r1, #0x10
	movs r2, #0x64
	asrs r3, r3, #0x10
	bl ov07_02222508
	ldrb r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0222774A:
	movs r0, #1
	add sp, #4
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02227752:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	bne _02227796
	movs r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02227796:
	ldrb r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022277A0:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	ldr r0, [r4, #0x10]
	bne _022277E4
	movs r2, #0x14
	ldrsh r2, [r4, r2]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_022277E4:
	movs r1, #0xc
	adds r2, r1, #0
	adds r2, #0xf4
	bl FUN_020087A4
	movs r1, #0xd
	adds r2, r1, #0
	ldr r0, [r4, #0x10]
	adds r2, #0xf3
	bl FUN_020087A4
	movs r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_020087A4
	ldrb r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02227810:
	ldr r0, [r4, #0xc]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_0222781E:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_02227630

	thumb_func_start ov07_02227824
ov07_02227824: @ 0x02227824
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	bl ov07_0221BFD0
	movs r1, #0x5c
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #8]
	strb r0, [r4]
	str r5, [r4, #0xc]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #2]
	ldr r0, [r4, #0xc]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FAA0
	str r0, [r4, #4]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x64
	lsls r3, r6, #0x10
	adds r0, #0x14
	adds r2, r1, #0
	asrs r3, r3, #0x10
	bl ov07_02222508
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	adds r0, #0x38
	movs r1, #2
	adds r3, r2, #0
	bl ov07_022227A8
	ldr r0, [r4, #0xc]
	ldr r1, _022278AC @ =ov07_02227630
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_022278AC: .4byte ov07_02227630
	thumb_func_end ov07_02227824

	thumb_func_start ov07_022278B0
ov07_022278B0: @ 0x022278B0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #4
	bls _022278C0
	b _02227AD8
_022278C0:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022278CC: @ jump table
	.2byte _022278D6 - _022278CC - 2 @ case 0
	.2byte _0222793C - _022278CC - 2 @ case 1
	.2byte _022279A0 - _022278CC - 2 @ case 2
	.2byte _02227A04 - _022278CC - 2 @ case 3
	.2byte _02227A68 - _022278CC - 2 @ case 4
_022278D6:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_0222260C
	cmp r0, #1
	bne _0222791A
	movs r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x24]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_0222791A:
	movs r1, #0x96
	str r1, [sp]
	movs r0, #0x64
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r2, #0x32
	adds r0, #0x10
	adds r3, r2, #0
	bl ov07_02222590
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_0222793C:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_0222260C
	cmp r0, #1
	bne _02227980
	movs r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x24]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_02227980:
	movs r2, #0x64
	str r2, [sp]
	str r2, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #0x32
	movs r3, #0x96
	bl ov07_02222590
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_022279A0:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_0222260C
	cmp r0, #1
	bne _022279E4
	movs r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x24]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_022279E4:
	movs r2, #0x96
	movs r1, #0x64
	str r2, [sp]
	str r1, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x10
	adds r3, r1, #0
	bl ov07_02222590
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02227A04:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_0222260C
	cmp r0, #1
	bne _02227A48
	movs r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x24]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_02227A48:
	movs r2, #0x64
	str r2, [sp]
	str r2, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x96
	adds r0, #0x10
	adds r3, r1, #0
	bl ov07_02222590
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02227A68:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_0222260C
	cmp r0, #1
	ldr r0, [r4, #0xc]
	bne _02227AAC
	movs r2, #0x10
	ldrsh r2, [r4, r2]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x24]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_02227AAC:
	movs r1, #0xc
	adds r2, r1, #0
	adds r2, #0xf4
	bl FUN_020087A4
	movs r1, #0xd
	adds r2, r1, #0
	ldr r0, [r4, #0xc]
	adds r2, #0xf3
	bl FUN_020087A4
	movs r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_020087A4
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02227AD8:
	ldr r0, [r4, #8]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov07_022278B0

	thumb_func_start ov07_02227AEC
ov07_02227AEC: @ 0x02227AEC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl ov07_0221BFD0
	movs r1, #0x58
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4]
	str r5, [r4, #8]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #2]
	ldr r0, [r4, #8]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FAA0
	str r0, [r4, #4]
	movs r0, #0x32
	str r0, [sp]
	movs r1, #0x64
	str r1, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x10
	movs r2, #0x96
	adds r3, r1, #0
	bl ov07_02222590
	ldr r0, [r4, #8]
	ldr r1, _02227B54 @ =ov07_022278B0
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02227B54: .4byte ov07_022278B0
	thumb_func_end ov07_02227AEC

	thumb_func_start ov07_02227B58
ov07_02227B58: @ 0x02227B58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r1, #0
	adds r2, r0, #0
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _02227B72
	cmp r0, #1
	beq _02227C58
	cmp r0, #2
	bne _02227B70
	b _02227CBA
_02227B70:
	b _02227CEE
_02227B72:
	ldrb r3, [r5]
	movs r0, #0x1f
	lsrs r2, r3, #0x1f
	lsls r1, r3, #0x1f
	subs r1, r1, r2
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r1, r3, #1
	str r0, [sp, #0xc]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	movs r0, #6
	muls r0, r1, r0
	ldr r1, _02227D0C @ =0x02236736
	ldrsh r2, [r1, r0]
	ldr r1, [sp, #8]
	subs r7, r2, r1
	movs r1, #0xa
	ldrsh r3, [r5, r1]
	ldr r1, _02227D10 @ =0x02236734
	ldrsh r6, [r1, r0]
	movs r1, #8
	ldrsh r2, [r5, r1]
	ldr r1, _02227D14 @ =0x02236732
	ldrsh r4, [r1, r0]
	lsls r0, r7, #0x10
	str r3, [sp]
	adds r1, r2, r4
	lsrs r0, r0, #0x10
	adds r2, r2, r6
	str r0, [sp, #4]
	adds r0, r5, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	adds r0, #0x28
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov07_02222268
	movs r0, #0xa
	ldrsh r3, [r5, r0]
	movs r0, #8
	ldrsh r2, [r5, r0]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	subs r1, r2, r4
	str r3, [sp]
	subs r2, r2, r6
	str r0, [sp, #4]
	adds r0, r5, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	adds r0, #0x4c
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov07_02222268
	ldr r0, [sp, #0xc]
	adds r1, r0, #1
	movs r0, #6
	muls r0, r1, r0
	ldr r1, _02227D0C @ =0x02236736
	ldrsh r2, [r1, r0]
	ldr r1, [sp, #8]
	subs r7, r2, r1
	movs r1, #0xa
	ldrsh r3, [r5, r1]
	ldr r1, _02227D10 @ =0x02236734
	ldrsh r6, [r1, r0]
	movs r1, #8
	ldrsh r2, [r5, r1]
	ldr r1, _02227D14 @ =0x02236732
	ldrsh r4, [r1, r0]
	lsls r0, r7, #0x10
	str r3, [sp]
	adds r1, r2, r4
	lsrs r0, r0, #0x10
	adds r2, r2, r6
	str r0, [sp, #4]
	adds r0, r5, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	adds r0, #0x70
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov07_02222268
	movs r0, #0xa
	ldrsh r3, [r5, r0]
	movs r0, #8
	ldrsh r2, [r5, r0]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	subs r1, r2, r4
	str r3, [sp]
	subs r2, r2, r6
	str r0, [sp, #4]
	adds r0, r5, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	adds r0, #0x94
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov07_02222268
	ldrb r0, [r5]
	adds r0, r0, #1
	strb r0, [r5]
	ldrb r0, [r5, #1]
	adds r0, r0, #1
	strb r0, [r5, #1]
_02227C58:
	movs r0, #0
	adds r7, r5, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	adds r7, #0x28
	adds r6, r5, #0
	adds r4, r5, #0
_02227C66:
	adds r0, r7, #0
	bl ov07_022222B4
	cmp r0, #0
	bne _02227C7C
	ldr r0, [sp, #0x10]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	b _02227C8A
_02227C7C:
	movs r1, #0x28
	movs r2, #0x2a
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r4, #0x18]
	bl FUN_0200DDB8
_02227C8A:
	ldr r0, [r4, #0x18]
	bl FUN_0200DC18
	ldr r0, [sp, #0x14]
	adds r7, #0x24
	adds r0, r0, #1
	adds r6, #0x24
	adds r4, r4, #4
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _02227C66
	ldr r0, [sp, #0x10]
	cmp r0, #4
	bne _02227D00
	ldrb r0, [r5]
	cmp r0, #9
	bne _02227CB4
	ldrb r0, [r5, #1]
	adds r0, r0, #1
	strb r0, [r5, #1]
	b _02227D00
_02227CB4:
	movs r0, #0
	strb r0, [r5, #1]
	b _02227D00
_02227CBA:
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _02227CC4
	subs r0, r0, #1
	strb r0, [r5, #4]
_02227CC4:
	ldrb r0, [r5, #5]
	cmp r0, #0xf
	bhs _02227CCE
	adds r0, r0, #1
	strb r0, [r5, #5]
_02227CCE:
	ldrb r0, [r5, #4]
	cmp r0, #0
	bne _02227CE0
	ldrb r0, [r5, #5]
	cmp r0, #0xf
	bne _02227CE0
	ldrb r0, [r5, #1]
	adds r0, r0, #1
	strb r0, [r5, #1]
_02227CE0:
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _02227D18 @ =0x04000052
	strh r1, [r0]
	b _02227D00
_02227CEE:
	ldr r0, [r5, #0xc]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r5, #0
	bl FUN_0201AB0C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_02227D00:
	ldr r0, [r5, #0x14]
	bl FUN_0200D020
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02227D0C: .4byte 0x02236736
_02227D10: .4byte 0x02236734
_02227D14: .4byte 0x02236732
_02227D18: .4byte 0x04000052
	thumb_func_end ov07_02227B58

	thumb_func_start ov07_02227D1C
ov07_02227D1C: @ 0x02227D1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #0x18]
	bl ov07_0221BFD0
	movs r1, #0xb8
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #1]
	strb r0, [r4]
	ldr r0, [sp, #0x18]
	str r0, [r4, #0xc]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #8]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0xa]
	ldr r0, [r4, #0x10]
	movs r1, #0x29
	bl FUN_02008A78
	movs r1, #0xa
	ldrsh r1, [r4, r1]
	subs r0, r1, r0
	strh r0, [r4, #0xa]
	ldr r0, [r4, #0xc]
	bl ov07_0221C514
	str r0, [r4, #0x14]
	movs r0, #8
	strb r0, [r4, #4]
	movs r1, #6
	strb r1, [r4, #5]
	subs r1, r1, #7
	ldr r0, [r4, #0xc]
	adds r2, r1, #0
	bl ov07_02231E08
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _02227F9C @ =0x04000052
	strh r1, [r0]
	ldr r0, [r4, #0xc]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FA80
	str r0, [sp, #0x20]
	ldr r0, [r4, #0xc]
	bl ov07_0221FAE8
	adds r7, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FA90
	str r0, [sp, #0x1c]
	movs r6, #0
	adds r5, r4, #0
_02227DBA:
	ldr r0, [r4, #0xc]
	adds r1, r6, #0
	bl ov07_0221C4E8
	movs r1, #1
	str r0, [r5, #0x18]
	bl FUN_0200E0FC
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #4
	blt _02227DBA
	ldr r0, [r4, #0xc]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0223192C
	cmp r0, #3
	ldr r0, [r4, #0x18]
	bne _02227EAA
	movs r1, #0xa
	bl FUN_0200DD68
	ldr r0, [r4, #0x1c]
	movs r1, #0xa
	bl FUN_0200DD68
	ldr r0, [r4, #0x20]
	movs r1, #0x14
	bl FUN_0200DD68
	ldr r0, [r4, #0x24]
	movs r1, #0x14
	bl FUN_0200DD68
	ldr r0, [r4, #0x18]
	adds r1, r7, #0
	bl FUN_0200DD54
	ldr r0, [r4, #0x1c]
	adds r1, r7, #0
	bl FUN_0200DD54
	ldr r0, [r4, #0x20]
	adds r1, r7, #0
	bl FUN_0200DD54
	ldr r0, [r4, #0x24]
	adds r1, r7, #0
	bl FUN_0200DD54
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	adds r6, r0, #0
	ldr r0, [sp, #0x18]
	bl ov07_0221BFD0
	adds r3, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	lsls r0, r5, #0x14
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x80
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	adds r0, r6, #0
	bl FUN_02003FC8
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	adds r6, r0, #0
	ldr r0, [sp, #0x18]
	bl ov07_0221BFD0
	adds r3, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	lsls r0, r5, #0x14
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xc4
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	adds r0, r6, #0
	bl FUN_02003FC8
	b _02227F8C
_02227EAA:
	movs r1, #0x14
	bl FUN_0200DD68
	ldr r0, [r4, #0x1c]
	movs r1, #0x14
	bl FUN_0200DD68
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	bl FUN_0200DD68
	ldr r0, [r4, #0x24]
	movs r1, #0xa
	bl FUN_0200DD68
	ldr r0, [r4, #0x18]
	adds r1, r7, #1
	bl FUN_0200DD54
	ldr r0, [r4, #0x1c]
	adds r1, r7, #1
	bl FUN_0200DD54
	ldr r0, [r4, #0x20]
	adds r1, r7, #1
	bl FUN_0200DD54
	ldr r0, [r4, #0x24]
	adds r1, r7, #1
	bl FUN_0200DD54
	ldr r0, [r4, #0x18]
	adds r1, r7, #0
	bl FUN_0200DD54
	ldr r0, [r4, #0x1c]
	adds r1, r7, #0
	bl FUN_0200DD54
	ldr r0, [r4, #0x20]
	adds r1, r7, #0
	bl FUN_0200DD54
	ldr r0, [r4, #0x24]
	adds r1, r7, #0
	bl FUN_0200DD54
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	adds r6, r0, #0
	ldr r0, [sp, #0x18]
	bl ov07_0221BFD0
	adds r3, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	lsls r0, r5, #0x14
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xc4
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	adds r0, r6, #0
	bl FUN_02003FC8
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	adds r6, r0, #0
	ldr r0, [sp, #0x18]
	bl ov07_0221BFD0
	adds r3, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	lsls r0, r5, #0x14
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x80
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	adds r0, r6, #0
	bl FUN_02003FC8
_02227F8C:
	ldr r0, [r4, #0xc]
	ldr r1, _02227FA0 @ =ov07_02227B58
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02227F9C: .4byte 0x04000052
_02227FA0: .4byte ov07_02227B58
	thumb_func_end ov07_02227D1C

	thumb_func_start ov07_02227FA4
ov07_02227FA4: @ 0x02227FA4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02227FB6
	cmp r0, #1
	beq _02228010
	b _02228050
_02227FB6:
	ldrb r1, [r4, #2]
	ldr r5, _02228060 @ =0x022366CD
	movs r2, #0x64
	lsls r0, r1, #1
	adds r3, r1, r0
	ldr r0, _02228064 @ =0x022366CE
	ldr r1, _02228068 @ =0x022366CC
	ldrb r0, [r0, r3]
	ldrb r1, [r1, r3]
	ldrb r3, [r5, r3]
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0xc
	bl ov07_02222508
	ldrb r0, [r4, #2]
	cmp r0, #0
	ldr r0, _0222806C @ =0x00007FFF
	bne _02227FEC
	str r0, [sp]
	movs r1, #0
	ldr r0, [r4, #8]
	movs r2, #6
	adds r3, r1, #0
	bl FUN_020090B4
	b _02227FFA
_02227FEC:
	str r0, [sp]
	movs r2, #0
	ldr r0, [r4, #8]
	movs r1, #6
	adds r3, r2, #0
	bl FUN_020090B4
_02227FFA:
	ldrb r1, [r4, #2]
	movs r0, #1
	eors r0, r1
	strb r0, [r4, #2]
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02228010:
	adds r0, r4, #0
	adds r0, #0xc
	bl ov07_02222558
	cmp r0, #0
	bne _02228038
	ldr r0, [r4, #8]
	bl FUN_02009138
	cmp r0, #0
	bne _02228038
	ldrb r0, [r4, #1]
	cmp r0, #4
	ldrb r0, [r4]
	bhs _02228034
	subs r0, r0, #1
	strb r0, [r4]
	b _02228038
_02228034:
	adds r0, r0, #1
	strb r0, [r4]
_02228038:
	movs r1, #0xc
	ldrsh r2, [r4, r1]
	ldr r0, [r4, #8]
	bl FUN_020087A4
	movs r2, #0xe
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	movs r1, #0xd
	bl FUN_020087A4
	pop {r3, r4, r5, pc}
_02228050:
	ldr r0, [r4, #4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	.align 2, 0
_02228060: .4byte 0x022366CD
_02228064: .4byte 0x022366CE
_02228068: .4byte 0x022366CC
_0222806C: .4byte 0x00007FFF
	thumb_func_end ov07_02227FA4

	thumb_func_start ov07_02228070
ov07_02228070: @ 0x02228070
	push {r3, r4, r5, lr}
	movs r1, #0x30
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4]
	strb r0, [r4, #2]
	strb r0, [r4, #1]
	str r5, [r4, #4]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	ldr r1, _022280A4 @ =ov07_02227FA4
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_022280A4: .4byte ov07_02227FA4
	thumb_func_end ov07_02228070

	thumb_func_start ov07_022280A8
ov07_022280A8: @ 0x022280A8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _022280BC
	cmp r0, #1
	beq _022280F6
	b _0222814E
_022280BC:
	ldrb r1, [r4, #1]
	ldr r2, _02228160 @ =0x02236714
	ldr r5, _02228164 @ =0x02236715
	lsls r0, r1, #2
	adds r3, r1, r0
	ldr r0, _02228168 @ =0x02236716
	ldr r1, _0222816C @ =0x02236713
	ldrb r0, [r0, r3]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	str r0, [sp]
	movs r0, #0x64
	str r0, [sp, #4]
	ldr r0, _02228170 @ =0x02236717
	ldrb r0, [r0, r3]
	ldrb r3, [r5, r3]
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_02222590
	ldrb r0, [r4, #1]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, pc}
_022280F6:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_0222260C
	cmp r0, #0
	bne _02228114
	ldrb r0, [r4, #1]
	cmp r0, #3
	ldrb r0, [r4]
	bhs _02228110
	subs r0, r0, #1
	strb r0, [r4]
	b _02228114
_02228110:
	adds r0, r0, #1
	strb r0, [r4]
_02228114:
	movs r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #2
	movs r1, #4
	ldrsh r0, [r4, r0]
	ldrsh r1, [r4, r1]
	ldr r2, [r4, #0x24]
	bl ov07_02222674
	movs r2, #2
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	add sp, #0xc
	pop {r4, r5, pc}
_0222814E:
	ldr r0, [r4, #8]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_02228160: .4byte 0x02236714
_02228164: .4byte 0x02236715
_02228168: .4byte 0x02236716
_0222816C: .4byte 0x02236713
_02228170: .4byte 0x02236717
	thumb_func_end ov07_022280A8

	thumb_func_start ov07_02228174
ov07_02228174: @ 0x02228174
	push {r3, r4, r5, lr}
	movs r1, #0x34
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	str r5, [r4, #8]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #2]
	ldr r0, [r4, #8]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FAA0
	strh r0, [r4, #4]
	ldr r0, [r4, #8]
	ldr r1, _022281BC @ =ov07_022280A8
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	.align 2, 0
_022281BC: .4byte ov07_022280A8
	thumb_func_end ov07_02228174

	thumb_func_start ov07_022281C0
ov07_022281C0: @ 0x022281C0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #5
	bls _022281D0
	b _02228330
_022281D0:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022281DC: @ jump table
	.2byte _022281E8 - _022281DC - 2 @ case 0
	.2byte _02228222 - _022281DC - 2 @ case 1
	.2byte _02228264 - _022281DC - 2 @ case 2
	.2byte _0222828E - _022281DC - 2 @ case 3
	.2byte _022282B0 - _022281DC - 2 @ case 4
	.2byte _022282EE - _022281DC - 2 @ case 5
_022281E8:
	ldrb r1, [r4, #1]
	ldr r2, _02228370 @ =0x022366EC
	ldr r5, _02228374 @ =0x022366ED
	lsls r0, r1, #2
	adds r3, r1, r0
	ldr r0, _02228378 @ =0x022366EE
	ldr r1, _0222837C @ =0x022366EB
	ldrb r0, [r0, r3]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	str r0, [sp]
	movs r0, #0x64
	str r0, [sp, #4]
	ldr r0, _02228380 @ =0x022366EF
	ldrb r0, [r0, r3]
	ldrb r3, [r5, r3]
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_02222590
	ldrb r0, [r4, #1]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, pc}
_02228222:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_0222260C
	cmp r0, #0
	bne _02228234
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_02228234:
	movs r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #0
	str r0, [sp]
	movs r1, #2
	movs r2, #6
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	bl ov07_022226C4
	add sp, #0xc
	pop {r4, r5, pc}
_02228264:
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02008A78
	movs r1, #0
	adds r3, r0, #0
	lsls r3, r3, #0x10
	str r1, [sp]
	movs r0, #5
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x10
	adds r2, r1, #0
	asrs r3, r3, #0x10
	bl ov07_02222268
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, pc}
_0222828E:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_022222B4
	cmp r0, #0
	bne _022282A0
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_022282A0:
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_020087A4
	add sp, #0xc
	pop {r4, r5, pc}
_022282B0:
	ldrb r1, [r4, #1]
	ldr r2, _02228370 @ =0x022366EC
	ldr r5, _02228374 @ =0x022366ED
	lsls r0, r1, #2
	adds r3, r1, r0
	ldr r0, _02228378 @ =0x022366EE
	ldr r1, _0222837C @ =0x022366EB
	ldrb r0, [r0, r3]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	str r0, [sp]
	movs r0, #0x64
	str r0, [sp, #4]
	ldr r0, _02228380 @ =0x022366EF
	ldrb r0, [r0, r3]
	ldrb r3, [r5, r3]
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_02222590
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #2]
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, pc}
_022282EE:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_0222260C
	cmp r0, #0
	bne _02228300
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_02228300:
	movs r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #1
	str r0, [sp]
	movs r1, #2
	movs r2, #6
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	bl ov07_022226C4
	add sp, #0xc
	pop {r4, r5, pc}
_02228330:
	movs r2, #4
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_020087A4
	ldr r0, [r4, #0xc]
	movs r1, #6
	movs r2, #1
	bl FUN_020087A4
	movs r1, #0xc
	adds r2, r1, #0
	ldr r0, [r4, #0xc]
	adds r2, #0xf4
	bl FUN_020087A4
	movs r1, #0xd
	adds r2, r1, #0
	ldr r0, [r4, #0xc]
	adds r2, #0xf3
	bl FUN_020087A4
	ldr r0, [r4, #8]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_02228370: .4byte 0x022366EC
_02228374: .4byte 0x022366ED
_02228378: .4byte 0x022366EE
_0222837C: .4byte 0x022366EB
_02228380: .4byte 0x022366EF
	thumb_func_end ov07_022281C0

	thumb_func_start ov07_02228384
ov07_02228384: @ 0x02228384
	push {r3, r4, r5, lr}
	movs r1, #0x34
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	str r5, [r4, #8]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #2]
	movs r0, #2
	ldrsh r0, [r4, r0]
	strh r0, [r4, #4]
	ldr r0, [r4, #8]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FAA0
	strh r0, [r4, #6]
	ldr r0, [r4, #8]
	ldr r1, _022283D4 @ =ov07_022281C0
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_022283D4: .4byte ov07_022281C0
	thumb_func_end ov07_02228384

	thumb_func_start ov07_022283D8
ov07_022283D8: @ 0x022283D8
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #4
	bhi _022284C2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022283F2: @ jump table
	.2byte _022283FC - _022283F2 - 2 @ case 0
	.2byte _02228436 - _022283F2 - 2 @ case 1
	.2byte _02228454 - _022283F2 - 2 @ case 2
	.2byte _0222846A - _022283F2 - 2 @ case 3
	.2byte _022284A4 - _022283F2 - 2 @ case 4
_022283FC:
	ldr r0, [r4, #8]
	bl ov07_0221E6C8
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, _022284D4 @ =0x00007FFF
	movs r1, #1
	str r0, [sp, #8]
	lsls r2, r2, #0x10
	ldr r0, [r4, #4]
	lsrs r2, r2, #0x10
	subs r3, r1, #3
	bl FUN_02003370
	movs r1, #0
	str r1, [sp]
	ldr r0, [r4, #0x10]
	movs r2, #0x10
	adds r3, r1, #0
	bl FUN_020090B4
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02228436:
	ldr r0, [r4, #4]
	bl FUN_02003B44
	cmp r0, #0
	bne _022284D0
	ldr r0, [r4, #0x10]
	bl FUN_02009138
	cmp r0, #0
	bne _022284D0
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02228454:
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #5
	bls _022284D0
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_0222846A:
	ldr r0, [r4, #8]
	bl ov07_0221E6C8
	adds r2, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _022284D4 @ =0x00007FFF
	movs r1, #1
	str r0, [sp, #8]
	lsls r2, r2, #0x10
	ldr r0, [r4, #4]
	lsrs r2, r2, #0x10
	subs r3, r1, #3
	bl FUN_02003370
	movs r2, #0
	str r2, [sp]
	ldr r0, [r4, #0x10]
	movs r1, #0x10
	adds r3, r2, #0
	bl FUN_020090B4
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_022284A4:
	ldr r0, [r4, #4]
	bl FUN_02003B44
	cmp r0, #0
	bne _022284D0
	ldr r0, [r4, #0x10]
	bl FUN_02009138
	cmp r0, #0
	bne _022284D0
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_022284C2:
	ldr r0, [r4, #8]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_022284D0:
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_022284D4: .4byte 0x00007FFF
	thumb_func_end ov07_022283D8

	thumb_func_start ov07_022284D8
ov07_022284D8: @ 0x022284D8
	push {r3, r4, r5, lr}
	movs r1, #0x14
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4, #8]
	adds r0, r5, #0
	bl ov07_0221FA78
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	ldr r1, _0222850C @ =ov07_022283D8
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_0222850C: .4byte ov07_022283D8
	thumb_func_end ov07_022284D8

	thumb_func_start ov07_02228510
ov07_02228510: @ 0x02228510
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02228524
	cmp r0, #1
	beq _02228590
	b _02228604
_02228524:
	ldrb r1, [r4, #1]
	ldr r2, _02228618 @ =0x022366F6
	ldr r5, _0222861C @ =0x022366F7
	lsls r0, r1, #2
	adds r3, r1, r0
	ldr r0, _02228620 @ =0x022366F8
	ldr r1, _02228624 @ =0x022366F5
	ldrb r0, [r0, r3]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	str r0, [sp]
	movs r0, #0x64
	str r0, [sp, #4]
	ldr r0, _02228628 @ =0x022366F9
	ldrb r0, [r0, r3]
	ldrb r3, [r5, r3]
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_02222590
	ldrb r1, [r4, #1]
	ldr r6, _0222862C @ =0x022366D8
	lsls r0, r1, #1
	adds r5, r1, r0
	movs r0, #4
	ldrsh r3, [r4, r0]
	ldr r0, _02228630 @ =0x022366D9
	movs r1, #0
	ldrb r0, [r0, r5]
	adds r2, r1, #0
	adds r0, r3, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, _02228634 @ =0x022366DA
	ldrb r0, [r0, r5]
	ldrb r5, [r6, r5]
	str r0, [sp, #4]
	adds r3, r3, r5
	adds r0, r4, #0
	lsls r3, r3, #0x10
	adds r0, #0x34
	asrs r3, r3, #0x10
	bl ov07_02222268
	ldrb r0, [r4, #1]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02228590:
	adds r0, r4, #0
	adds r0, #0x10
	movs r5, #0
	bl ov07_0222260C
	cmp r0, #0
	bne _022285A0
	adds r5, r5, #1
_022285A0:
	adds r0, r4, #0
	adds r0, #0x34
	bl ov07_022222B4
	cmp r0, #0
	bne _022285AE
	adds r5, r5, #1
_022285AE:
	cmp r5, #2
	blt _022285D4
	ldrb r0, [r4, #1]
	cmp r0, #3
	blo _022285D0
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	movs r0, #0
	strb r0, [r4, #1]
	ldrb r0, [r4, #2]
	cmp r0, #3
	blo _022285D4
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _022285D4
_022285D0:
	movs r0, #0
	strb r0, [r4]
_022285D4:
	movs r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x36
	movs r2, #6
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	bl ov07_022226C4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02228604:
	ldr r0, [r4, #8]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_02228618: .4byte 0x022366F6
_0222861C: .4byte 0x022366F7
_02228620: .4byte 0x022366F8
_02228624: .4byte 0x022366F5
_02228628: .4byte 0x022366F9
_0222862C: .4byte 0x022366D8
_02228630: .4byte 0x022366D9
_02228634: .4byte 0x022366DA
	thumb_func_end ov07_02228510

	thumb_func_start ov07_02228638
ov07_02228638: @ 0x02228638
	push {r3, r4, r5, lr}
	movs r1, #0x58
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	str r5, [r4, #8]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #4]
	ldr r0, [r4, #8]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FAA0
	strh r0, [r4, #6]
	ldr r0, [r4, #8]
	ldr r1, _02228680 @ =ov07_02228510
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	.align 2, 0
_02228680: .4byte ov07_02228510
	thumb_func_end ov07_02228638

	thumb_func_start ov07_02228684
ov07_02228684: @ 0x02228684
	push {r4, lr}
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0222869A
	cmp r0, #1
	beq _022286B2
	cmp r0, #2
	beq _022286D2
	b _02228714
_0222869A:
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #0xa
	blo _02228730
	movs r0, #0
	strb r0, [r4, #1]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02228730
_022286B2:
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, [r4, #0x10]
	movs r1, #2
	bl FUN_0200E0FC
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02228730
_022286D2:
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #0xa
	blo _02228730
	ldr r0, _02228744 @ =0x0400004A
	movs r1, #0x3f
	ldrh r2, [r0]
	bics r2, r1
	movs r1, #0x1f
	orrs r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _02228748 @ =0xFFFFC0FF
	lsls r1, r1, #8
	ands r2, r3
	orrs r1, r2
	strh r1, [r0]
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0
	strb r0, [r4, #1]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02228730
_02228714:
	movs r3, #1
	lsls r3, r3, #0x1a
	ldr r1, [r3]
	ldr r0, _0222874C @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r3]
	ldr r0, [r4, #4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
_02228730:
	ldr r0, [r4, #0xc]
	bl FUN_0200DC18
	ldr r0, [r4, #0x10]
	bl FUN_0200DC18
	ldr r0, [r4, #8]
	bl FUN_0200D020
	pop {r4, pc}
	.align 2, 0
_02228744: .4byte 0x0400004A
_02228748: .4byte 0xFFFFC0FF
_0222874C: .4byte 0xFFFF1FFF
	thumb_func_end ov07_02228684

	thumb_func_start ov07_02228750
ov07_02228750: @ 0x02228750
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	movs r1, #0x14
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4, #4]
	adds r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	movs r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0xc]
	ldr r0, [r4, #4]
	movs r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x10]
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02228828 @ =0xFFFF1FFF
	ands r2, r1
	lsrs r1, r0, #0xb
	orrs r1, r2
	str r1, [r0]
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r1, #0x3f
	bics r2, r1
	movs r1, #0x1f
	orrs r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	ldr r1, _0222882C @ =0xFFFFC0FF
	ands r2, r1
	movs r1, #0x12
	lsls r1, r1, #8
	orrs r1, r2
	strh r1, [r0]
	ldr r0, [r4, #4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA80
	adds r7, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA90
	str r0, [sp, #0x18]
	ldr r0, [r4, #0xc]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	adds r6, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA78
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl ov07_0221BFD0
	adds r3, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r1, #0x20
	lsls r0, r6, #0x14
	str r1, [sp, #4]
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r1, #0xe0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	adds r2, r7, #0
	bl FUN_02003FC8
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #4]
	ldr r1, _02228830 @ =ov07_02228684
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228828: .4byte 0xFFFF1FFF
_0222882C: .4byte 0xFFFFC0FF
_02228830: .4byte ov07_02228684
	thumb_func_end ov07_02228750

	thumb_func_start ov07_02228834
ov07_02228834: @ 0x02228834
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bls _02228844
	b _02228A26
_02228844:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02228850: @ jump table
	.2byte _02228858 - _02228850 - 2 @ case 0
	.2byte _0222886A - _02228850 - 2 @ case 1
	.2byte _02228982 - _02228850 - 2 @ case 2
	.2byte _022289BA - _02228850 - 2 @ case 3
_02228858:
	ldr r0, [r4, #0xc]
	movs r1, #0xe
	movs r2, #1
	bl FUN_020087A4
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02228A42
_0222886A:
	movs r0, #0
	adds r6, r4, #0
	ldr r7, _02228A4C @ =0x022366C8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	adds r5, r4, #0
	adds r6, #0x20
_02228878:
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	beq _02228884
	cmp r0, #1
	beq _022288B2
	b _02228900
_02228884:
	ldrb r0, [r5, #0x19]
	adds r0, r0, #1
	strb r0, [r5, #0x19]
	ldrb r1, [r5, #0x19]
	ldrb r0, [r7]
	cmp r1, r0
	blo _02228906
	movs r0, #5
	str r0, [sp]
	movs r0, #0x64
	str r0, [sp, #4]
	movs r0, #5
	movs r1, #0x64
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r2, #5
	adds r3, r1, #0
	bl ov07_02222590
	ldrb r0, [r5, #0x18]
	adds r0, r0, #1
	strb r0, [r5, #0x18]
	b _02228906
_022288B2:
	adds r0, r6, #0
	bl ov07_0222260C
	cmp r0, #0
	bne _022288C4
	ldrb r0, [r5, #0x18]
	adds r0, r0, #1
	strb r0, [r5, #0x18]
	b _02228906
_022288C4:
	adds r0, r6, #0
	add r1, sp, #0x28
	add r2, sp, #0x24
	bl ov07_02222644
	movs r0, #8
	ldrsb r0, [r4, r0]
	blx FUN_020F2178
	adds r1, r0, #0
	ldr r0, [sp, #0x28]
	blx FUN_020F22DC
	adds r1, r0, #0
	ldr r0, [r5, #0x1c]
	ldr r2, [sp, #0x24]
	bl FUN_0200E024
	movs r0, #0
	str r0, [sp]
	movs r1, #2
	ldr r2, [r4, #4]
	ldrsh r1, [r4, r1]
	lsls r2, r2, #0x10
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x34]
	asrs r2, r2, #0x10
	bl ov07_022226FC
	b _02228906
_02228900:
	ldr r0, [sp, #0x10]
	adds r0, r0, #1
	str r0, [sp, #0x10]
_02228906:
	ldr r0, [r5, #0x1c]
	bl FUN_0200DC18
	ldr r0, [sp, #0x14]
	adds r5, #0x2c
	adds r0, r0, #1
	adds r7, r7, #1
	adds r6, #0x2c
	str r0, [sp, #0x14]
	cmp r0, #3
	blt _02228878
	ldr r0, [sp, #0x10]
	cmp r0, #3
	bge _02228924
	b _02228A42
_02228924:
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #3
	bhs _0222897A
	movs r6, #0
	adds r5, r4, #0
	adds r7, r6, #0
_02228936:
	add r1, sp, #0x18
	ldr r0, [r5, #0x1c]
	adds r1, #2
	add r2, sp, #0x18
	bl FUN_0200DE44
	add r2, sp, #0x18
	movs r1, #2
	ldrsh r1, [r2, r1]
	movs r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #0x1c]
	bl FUN_0200DDB8
	movs r0, #8
	ldrsb r0, [r4, r0]
	blx FUN_020F2178
	adds r1, r0, #0
	movs r2, #0xfe
	ldr r0, [r5, #0x1c]
	lsls r2, r2, #0x16
	bl FUN_0200E024
	strb r7, [r5, #0x18]
	strb r7, [r5, #0x19]
	adds r6, r6, #1
	adds r5, #0x2c
	cmp r6, #3
	blt _02228936
	ldrb r0, [r4]
	subs r0, r0, #1
	strb r0, [r4]
	b _02228A42
_0222897A:
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02228A42
_02228982:
	adds r5, r4, #0
	movs r7, #0
	adds r6, r4, #0
	adds r5, #0x20
_0222898A:
	ldr r0, [r6, #0x1c]
	movs r1, #0
	bl FUN_0200E0FC
	movs r0, #0x64
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #5
	movs r1, #5
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r2, #0x64
	adds r3, r1, #0
	bl ov07_02222590
	adds r7, r7, #1
	adds r6, #0x2c
	adds r5, #0x2c
	cmp r7, #3
	blt _0222898A
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02228A42
_022289BA:
	movs r7, #0
	adds r6, r4, #0
	str r7, [sp, #0xc]
	adds r6, #0x20
	adds r5, r4, #0
_022289C4:
	adds r0, r6, #0
	bl ov07_0222260C
	cmp r0, #0
	bne _022289D2
	adds r7, r7, #1
	b _02228A0C
_022289D2:
	adds r0, r6, #0
	add r1, sp, #0x20
	add r2, sp, #0x1c
	bl ov07_02222644
	movs r0, #8
	ldrsb r0, [r4, r0]
	blx FUN_020F2178
	adds r1, r0, #0
	ldr r0, [sp, #0x20]
	blx FUN_020F22DC
	adds r1, r0, #0
	ldr r0, [r5, #0x1c]
	ldr r2, [sp, #0x1c]
	bl FUN_0200E024
	movs r0, #0
	str r0, [sp]
	movs r1, #2
	ldr r2, [r4, #4]
	ldrsh r1, [r4, r1]
	lsls r2, r2, #0x10
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x34]
	asrs r2, r2, #0x10
	bl ov07_022226FC
_02228A0C:
	ldr r0, [sp, #0xc]
	adds r6, #0x2c
	adds r0, r0, #1
	adds r5, #0x2c
	str r0, [sp, #0xc]
	cmp r0, #3
	blt _022289C4
	cmp r7, #3
	blt _02228A42
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02228A42
_02228A26:
	ldr r0, [r4, #0xc]
	movs r1, #0xe
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4, #0x10]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02228A42:
	ldr r0, [r4, #0x14]
	bl FUN_0200D020
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02228A4C: .4byte 0x022366C8
	thumb_func_end ov07_02228834

	thumb_func_start ov07_02228A50
ov07_02228A50: @ 0x02228A50
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x9c
	str r0, [sp]
	bl ov07_022324D8
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	ldr r0, [sp]
	str r0, [r4, #0x10]
	bl ov07_0221C514
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #2]
	ldr r0, [r4, #0xc]
	movs r1, #0x29
	bl FUN_02008A78
	movs r1, #2
	ldrsh r1, [r4, r1]
	subs r0, r1, r0
	strh r0, [r4, #2]
	ldr r0, [r4, #0x10]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	bl ov07_0221FAA0
	movs r1, #0
	str r0, [r4, #4]
	mvns r1, r1
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	bl ov07_02231E08
	movs r6, #0
	ldr r1, _02228B2C @ =0x0000060C
	ldr r0, _02228B30 @ =0x04000052
	adds r5, r4, #0
	strh r1, [r0]
	adds r7, r6, #0
_02228ABC:
	strb r7, [r5, #0x18]
	strb r7, [r5, #0x19]
	ldr r0, [r4, #0x10]
	adds r1, r6, #0
	bl ov07_0221C4E8
	str r0, [r5, #0x1c]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r5, #0x1c]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r5, #0x1c]
	adds r1, r6, #1
	bl FUN_0200DD68
	adds r6, r6, #1
	adds r5, #0x2c
	cmp r6, #3
	blt _02228ABC
	ldr r0, [sp]
	movs r1, #0
	bl ov07_0221FB78
	cmp r0, #1
	bne _02228AFA
	movs r0, #0
	mvns r0, r0
	b _02228AFC
_02228AFA:
	movs r0, #1
_02228AFC:
	strb r0, [r4, #8]
	movs r6, #0
	adds r5, r4, #0
	movs r7, #8
_02228B04:
	ldrsb r0, [r4, r7]
	blx FUN_020F2178
	adds r1, r0, #0
	movs r2, #0xfe
	ldr r0, [r5, #0x1c]
	lsls r2, r2, #0x16
	bl FUN_0200E024
	adds r6, r6, #1
	adds r5, #0x2c
	cmp r6, #3
	blt _02228B04
	ldr r0, [r4, #0x10]
	ldr r1, _02228B34 @ =ov07_02228834
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228B2C: .4byte 0x0000060C
_02228B30: .4byte 0x04000052
_02228B34: .4byte ov07_02228834
	thumb_func_end ov07_02228A50

	thumb_func_start ov07_02228B38
ov07_02228B38: @ 0x02228B38
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bls _02228B48
	b _02228C72
_02228B48:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02228B54: @ jump table
	.2byte _02228B5C - _02228B54 - 2 @ case 0
	.2byte _02228B8E - _02228B54 - 2 @ case 1
	.2byte _02228BA2 - _02228B54 - 2 @ case 2
	.2byte _02228BFE - _02228B54 - 2 @ case 3
_02228B5C:
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221E6C8
	adds r2, r0, #0
	movs r1, #0
	lsls r2, r2, #0x10
	str r1, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r1, #1
	adds r0, r5, #0
	lsrs r2, r2, #0x10
	adds r3, r1, #0
	bl FUN_02003370
	ldrb r0, [r4]
	add sp, #0xc
	adds r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, r7, pc}
_02228B8E:
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	bl FUN_02003B44
	cmp r0, #0
	bne _02228C80
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_02228BA2:
	movs r0, #5
	str r0, [sp]
	ldrb r1, [r4, #1]
	adds r0, r4, #0
	adds r0, #0xb4
	lsls r2, r1, #1
	ldr r1, _02228C84 @ =0x02236722
	ldrsh r1, [r1, r2]
	movs r2, #0
	adds r3, r2, #0
	bl ov07_022227A8
	ldrb r0, [r4, #2]
	cmp r0, #0
	ldr r0, [r4, #0xc]
	bne _02228BD4
	bl ov07_0221FA78
	movs r1, #0
	movs r2, #0xff
	movs r3, #0xa
	str r1, [sp]
	bl FUN_02003EA4
	b _02228BE6
_02228BD4:
	bl ov07_0221FA78
	ldr r1, _02228C88 @ =0x00007FFF
	movs r2, #0xff
	str r1, [sp]
	movs r1, #0
	movs r3, #0xa
	bl FUN_02003EA4
_02228BE6:
	movs r0, #3
	strb r0, [r4, #3]
	ldrb r1, [r4, #2]
	movs r0, #1
	eors r0, r1
	strb r0, [r4, #2]
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_02228BFE:
	adds r0, r4, #0
	adds r0, #0xb4
	bl ov07_022227D8
	cmp r0, #0
	bne _02228C1C
	ldrb r0, [r4, #1]
	cmp r0, #8
	ldrb r0, [r4]
	blo _02228C18
	adds r0, r0, #1
	strb r0, [r4]
	b _02228C1C
_02228C18:
	subs r0, r0, #1
	strb r0, [r4]
_02228C1C:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _02228C3E
	subs r0, r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _02228C3E
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	movs r1, #0
	movs r2, #0xff
	adds r3, r1, #0
	str r1, [sp]
	bl FUN_02003EA4
_02228C3E:
	movs r6, #0
	adds r5, r4, #0
	movs r7, #0x14
_02228C44:
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _02228C58
	movs r2, #0xb4
	ldrsh r3, [r4, r2]
	ldrsh r2, [r5, r7]
	movs r1, #0
	adds r2, r3, r2
	bl FUN_020087A4
_02228C58:
	adds r6, r6, #1
	adds r5, #0x14
	cmp r6, #4
	blt _02228C44
	movs r3, #0xb4
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #8]
	movs r1, #3
	movs r2, #0
	bl FUN_0201BC8C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02228C72:
	ldr r0, [r4, #0xc]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_02228C80:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02228C84: .4byte 0x02236722
_02228C88: .4byte 0x00007FFF
	thumb_func_end ov07_02228B38

	thumb_func_start ov07_02228C8C
ov07_02228C8C: @ 0x02228C8C
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0xd8
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	str r5, [r4, #0xc]
	adds r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	bl ov07_0221C4A0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02228CBE
	movs r1, #0x40
	b _02228CC0
_02228CBE:
	movs r1, #0xa
_02228CC0:
	adds r2, r4, #0
	adds r0, r5, #0
	adds r2, #0x14
	adds r3, r4, #4
	bl ov07_02232020
	ldr r0, [r4, #4]
	movs r6, #0
	cmp r0, #0
	ble _02228CF6
	adds r5, r4, #0
	adds r7, r6, #0
_02228CD8:
	ldr r0, [r5, #0x1c]
	adds r1, r7, #0
	bl FUN_02008A78
	strh r0, [r5, #0x14]
	ldr r0, [r5, #0x1c]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	adds r6, r6, #1
	adds r5, #0x14
	cmp r6, r0
	blt _02228CD8
_02228CF6:
	ldr r0, [r4, #0xc]
	ldr r1, _02228D04 @ =ov07_02228B38
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228D04: .4byte ov07_02228B38
	thumb_func_end ov07_02228C8C

	thumb_func_start ov07_02228D08
ov07_02228D08: @ 0x02228D08
	push {r4, lr}
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _02228D52
	adds r0, r4, #0
	adds r0, #0x40
	bl ov07_022222B4
	cmp r0, #0
	bne _02228D26
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_02228D26:
	adds r0, r4, #0
	adds r0, #0x1c
	bl ov07_022227D8
	adds r0, r4, #0
	adds r0, #0x64
	bl ov07_02222AF4
	movs r1, #0x40
	movs r2, #0x42
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	bl FUN_0200DDB8
	ldr r0, [r4, #0x18]
	bl FUN_0200DC18
	ldr r0, [r4, #0x10]
	bl FUN_0200D020
	pop {r4, pc}
_02228D52:
	ldr r0, [r4, #0xc]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02228D08

	thumb_func_start ov07_02228D64
ov07_02228D64: @ 0x02228D64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r1, #0x8c
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	str r5, [r4, #0xc]
	adds r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	bl ov07_0221C4A0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x18]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ldr r0, [r4, #0xc]
	bne _02228DA8
	bl ov07_0221C470
	b _02228DAC
_02228DA8:
	bl ov07_0221C468
_02228DAC:
	adds r6, r0, #0
	ldr r0, [r4, #0xc]
	adds r1, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x14]
	adds r1, r4, #4
	bl ov07_02231FA0
	ldr r0, [r4, #0x14]
	movs r1, #0x29
	bl FUN_02008A78
	movs r1, #6
	ldrsh r1, [r4, r1]
	subs r0, r1, r0
	strh r0, [r4, #6]
	ldr r0, [r4, #0xc]
	adds r1, r6, #0
	bl ov07_02222004
	adds r7, r0, #0
	ldr r0, [r4, #0xc]
	adds r1, r6, #0
	bl ov07_0222202C
	adds r6, r0, #0
	movs r0, #6
	ldrsh r3, [r4, r0]
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r2, #0x14
	adds r0, r6, #0
	muls r0, r2, r0
	adds r0, r3, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	str r2, [sp, #4]
	subs r2, #0x28
	muls r2, r7, r2
	adds r2, r1, r2
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x40
	asrs r2, r2, #0x10
	bl ov07_02222268
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221FAF8
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221FAF8
	movs r5, #1
	adds r3, r5, #0
	lsls r3, r6
	adds r1, r0, #0
	adds r6, r3, #0
	movs r2, #0x20
	adds r3, r5, #0
	orrs r6, r2
	lsls r3, r1
	adds r1, r6, #0
	orrs r1, r3
	subs r2, #0x21
	ldr r0, [r4, #0xc]
	orrs r1, r5
	adds r3, r2, #0
	bl ov07_02231E44
	movs r1, #0x1f
	movs r2, #0
	str r1, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x64
	adds r3, r2, #0
	bl ov07_02222AC4
	ldr r0, [r4, #0x18]
	adds r1, r5, #0
	bl FUN_0200E0FC
	ldr r0, [r4, #0xc]
	ldr r1, _02228E6C @ =ov07_02228D08
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228E6C: .4byte ov07_02228D08
	thumb_func_end ov07_02228D64

	thumb_func_start ov07_02228E70
ov07_02228E70: @ 0x02228E70
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02228E82
	cmp r0, #1
	beq _02228EC2
	b _02228EF2
_02228E82:
	ldrb r0, [r4, #1]
	cmp r0, #0
	ldrb r0, [r4, #2]
	bne _02228E94
	lsls r3, r0, #3
	ldr r0, _02228F0C @ =0x0223674C
	ldr r2, [r0, r3]
	rsbs r1, r2, #0
	b _02228E9C
_02228E94:
	lsls r3, r0, #3
	ldr r0, _02228F0C @ =0x0223674C
	ldr r1, [r0, r3]
	rsbs r2, r1, #0
_02228E9C:
	ldr r5, _02228F10 @ =0x02236750
	adds r0, r4, #0
	ldr r3, [r5, r3]
	adds r0, #0x5c
	bl ov07_022223F0
	ldrb r0, [r4, #1]
	cmp r0, #1
	bne _02228EB4
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
_02228EB4:
	ldrb r1, [r4, #1]
	movs r0, #1
	eors r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_02228EC2:
	adds r0, r4, #0
	adds r0, #0x5c
	bl ov07_02222440
	cmp r0, #1
	bne _02228EDE
	ldr r2, [r4, #0x5c]
	ldr r0, [r4, #0x28]
	lsls r2, r2, #0x10
	movs r1, #9
	lsrs r2, r2, #0x10
	bl FUN_020087A4
	pop {r3, r4, r5, pc}
_02228EDE:
	ldrb r0, [r4, #2]
	cmp r0, #5
	ldrb r0, [r4]
	blo _02228EEC
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02228EEC:
	subs r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02228EF2:
	ldr r0, [r4, #0x28]
	movs r1, #9
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	.align 2, 0
_02228F0C: .4byte 0x0223674C
_02228F10: .4byte 0x02236750
	thumb_func_end ov07_02228E70

	thumb_func_start ov07_02228F14
ov07_02228F14: @ 0x02228F14
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02228F28
	cmp r0, #1
	beq _02228F4C
	b _02228F76
_02228F28:
	movs r0, #0x22
	ldrsh r0, [r4, r0]
	movs r1, #0x1c
	movs r2, #0x1e
	str r0, [sp]
	movs r3, #0x20
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	adds r0, #0x38
	bl ov07_022227A8
	ldrb r0, [r4]
	add sp, #8
	adds r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02228F4C:
	ldr r0, [r4, #0x2c]
	add r1, sp, #4
	bl ov07_02231FA0
	adds r0, r4, #0
	add r3, sp, #4
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r3, [r4, #0x2c]
	adds r0, #0x38
	bl ov07_0222283C
	cmp r0, #0
	bne _02228F84
	ldrb r0, [r4]
	add sp, #8
	adds r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02228F76:
	ldr r0, [r4, #4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_02228F84:
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_02228F14

	thumb_func_start ov07_02228F88
ov07_02228F88: @ 0x02228F88
	push {r4, r5, r6, lr}
	movs r1, #0x70
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	ldr r0, [r4, #4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0x28]
	ldr r0, [r4, #4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x28]
	movs r1, #0xb
	movs r2, #0x64
	bl FUN_020087A4
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0x1c]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4A8
	strh r0, [r4, #0x1e]
	adds r0, r5, #0
	movs r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #0x20]
	adds r0, r5, #0
	movs r1, #4
	bl ov07_0221C4A8
	strh r0, [r4, #0x22]
	adds r0, r5, #0
	movs r1, #5
	bl ov07_0221C4A8
	str r0, [r4, #0x24]
	cmp r6, #0
	ldr r0, [r4, #4]
	bne _02229012
	ldr r1, _0222901C @ =ov07_02228E70
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
_02229012:
	ldr r1, _02229020 @ =ov07_02228F14
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222901C: .4byte ov07_02228E70
_02229020: .4byte ov07_02228F14
	thumb_func_end ov07_02228F88

	thumb_func_start ov07_02229024
ov07_02229024: @ 0x02229024
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r2, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _02229036
	cmp r0, #1
	beq _02229058
	b _022290AC
_02229036:
	ldr r2, [r5, #0x48]
	movs r0, #0xa
	adds r1, r2, #2
	str r0, [sp]
	adds r0, r5, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	adds r0, #0x4c
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	movs r3, #0
	bl ov07_022227A8
	ldrb r0, [r5]
	adds r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02229058:
	adds r0, r5, #0
	adds r0, #0x4c
	bl ov07_022227D8
	cmp r0, #0
	bne _0222906C
	ldrb r0, [r5]
	adds r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222906C:
	movs r6, #0
	adds r4, r5, #0
	movs r7, #0x28
_02229072:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _02229086
	movs r2, #0x4c
	ldrsh r3, [r5, r2]
	ldrsh r2, [r4, r7]
	movs r1, #0
	adds r2, r3, r2
	bl FUN_020087A4
_02229086:
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _02229072
	movs r3, #0x4c
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x14]
	movs r1, #3
	movs r2, #0
	bl FUN_0201BC8C
	movs r3, #0x4e
	movs r1, #3
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x14]
	adds r2, r1, #0
	bl FUN_0201BC8C
	pop {r3, r4, r5, r6, r7, pc}
_022290AC:
	ldr r0, [r5, #4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02229024

	thumb_func_start ov07_022290BC
ov07_022290BC: @ 0x022290BC
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x70
	adds r4, r0, #0
	bl ov07_022324D8
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov07_02231FE4
	ldr r0, [r7, #4]
	movs r1, #1
	bl ov07_0221C768
	cmp r0, #0x46
	bgt _022290EC
	bge _0222910E
	cmp r0, #0x1e
	bgt _022290E6
	beq _0222911A
	b _02229120
_022290E6:
	cmp r0, #0x32
	beq _02229114
	b _02229120
_022290EC:
	cmp r0, #0x6e
	bgt _022290F8
	bge _02229102
	cmp r0, #0x5a
	beq _02229108
	b _02229120
_022290F8:
	cmp r0, #0x96
	bne _02229120
	movs r0, #6
	str r0, [r7, #0x48]
	b _02229124
_02229102:
	movs r0, #5
	str r0, [r7, #0x48]
	b _02229124
_02229108:
	movs r0, #4
	str r0, [r7, #0x48]
	b _02229124
_0222910E:
	movs r0, #3
	str r0, [r7, #0x48]
	b _02229124
_02229114:
	movs r0, #2
	str r0, [r7, #0x48]
	b _02229124
_0222911A:
	movs r0, #1
	str r0, [r7, #0x48]
	b _02229124
_02229120:
	movs r0, #0
	str r0, [r7, #0x48]
_02229124:
	adds r5, r7, #0
	movs r6, #0
	adds r4, r7, #0
	adds r5, #0x28
_0222912C:
	ldr r0, [r7, #4]
	adds r1, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x38]
	cmp r0, #0
	beq _02229140
	adds r1, r5, #0
	bl ov07_02231FA0
_02229140:
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #4
	blt _0222912C
	ldr r0, [r7, #4]
	ldr r1, _02229158 @ =ov07_02229024
	adds r2, r7, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02229158: .4byte ov07_02229024
	thumb_func_end ov07_022290BC

	thumb_func_start ov07_0222915C
ov07_0222915C: @ 0x0222915C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02229170
	cmp r0, #1
	beq _0222919E
	b _0222920C
_02229170:
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	adds r0, #0x40
	movs r1, #0x14
	adds r3, r2, #0
	bl ov07_022227A8
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	adds r0, #0x64
	movs r1, #2
	adds r3, r2, #0
	bl ov07_022227A8
	ldrb r0, [r4]
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_0222919E:
	adds r0, r4, #0
	adds r0, #0x40
	bl ov07_022227D8
	cmp r0, #0
	bne _022291B2
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02229202
_022291B2:
	movs r1, #0x2c
	ldrsh r2, [r4, r1]
	movs r1, #0x40
	ldrsh r1, [r4, r1]
	ldr r0, [r4, #0x38]
	adds r1, r2, r1
	movs r2, #0x2e
	ldrsh r3, [r4, r2]
	movs r2, #0x42
	ldrsh r2, [r4, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	movs r1, #0x40
	ldrsh r2, [r4, r1]
	movs r1, #0x2c
	ldrsh r1, [r4, r1]
	ldr r0, [r4, #0x3c]
	subs r1, r2, r1
	movs r2, #0x2e
	ldrsh r3, [r4, r2]
	movs r2, #0x42
	ldrsh r2, [r4, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r0, [r4, #0x38]
	bl FUN_0200DC18
	ldr r0, [r4, #0x3c]
	bl FUN_0200DC18
_02229202:
	ldr r0, [r4, #0xc]
	bl FUN_0200D020
	add sp, #4
	pop {r3, r4, pc}
_0222920C:
	ldr r0, [r4, #4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov07_0222915C

	thumb_func_start ov07_02229220
ov07_02229220: @ 0x02229220
	push {r3, r4, r5, lr}
	movs r1, #0x88
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	ldr r0, [r4, #4]
	movs r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x38]
	ldr r0, [r4, #4]
	movs r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0x30]
	ldr r0, [r4, #4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0x34]
	adds r1, r4, #0
	ldr r0, [r4, #0x30]
	adds r1, #0x28
	bl ov07_02231FA0
	adds r1, r4, #0
	ldr r0, [r4, #0x34]
	adds r1, #0x2c
	bl ov07_02231FA0
	ldr r0, [r4, #4]
	ldr r1, _02229288 @ =ov07_0222915C
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	.align 2, 0
_02229288: .4byte ov07_0222915C
	thumb_func_end ov07_02229220

	thumb_func_start ov07_0222928C
ov07_0222928C: @ 0x0222928C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	ldr r2, [r4, #0x38]
	adds r0, #0x8c
	adds r1, #0xb0
	bl ov07_022223CC
	cmp r0, #0
	bne _022292B8
	ldr r0, [r4, #0x38]
	bl FUN_0200D9DC
	ldr r0, [r4, #0x14]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl ov07_02232508
	pop {r3, r4, r5, pc}
_022292B8:
	adds r0, r4, #0
	adds r0, #0xd4
	bl ov07_02222440
	cmp r0, #1
	bne _022292D4
	adds r1, r4, #0
	adds r1, #0xd4
	ldr r1, [r1]
	ldr r0, [r4, #0x38]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FUN_0200E074
_022292D4:
	ldr r0, [r4, #0x38]
	bl FUN_0200DC18
	ldr r0, [r4, #0x20]
	bl FUN_0200D020
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0222928C

	thumb_func_start ov07_022292E4
ov07_022292E4: @ 0x022292E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r1, #0xe8
	adds r6, r0, #0
	adds r7, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x10
	bl ov07_02231FE4
	adds r0, r6, #0
	movs r1, #0
	bl ov07_0221C4A8
	strh r0, [r4, #0xc]
	adds r0, r6, #0
	movs r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0xe]
	adds r0, r6, #0
	movs r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #4]
	adds r0, r6, #0
	movs r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #8]
	adds r0, r6, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_02222004
	adds r5, r0, #0
	adds r0, r7, #0
	movs r1, #2
	str r7, [r4, #0x38]
	bl FUN_0200DF98
	adds r0, r6, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x44]
	adds r0, r6, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x58]
	adds r1, r4, #0
	ldr r0, [r4, #0x44]
	adds r1, #0x40
	bl ov07_02231FA0
	adds r1, r4, #0
	ldr r0, [r4, #0x58]
	adds r1, #0x54
	bl ov07_02231FA0
	movs r0, #0x42
	ldrsh r0, [r4, r0]
	movs r3, #0x54
	str r0, [sp]
	movs r0, #0x56
	ldrsh r2, [r4, r0]
	movs r0, #0xe
	ldrsh r0, [r4, r0]
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	adds r1, r4, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	movs r2, #0x40
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	ldrsh r3, [r4, r3]
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	mov ip, r3
	movs r3, #0xc
	ldrsh r3, [r4, r3]
	adds r0, #0x8c
	adds r1, #0xb0
	adds r7, r3, #0
	muls r7, r5, r7
	mov r3, ip
	adds r3, r3, r7
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222338
	adds r0, r6, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0221FA04
	cmp r0, #4
	bne _022293EC
	adds r0, r6, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0221FA04
	cmp r0, #2
	bne _022293EC
	movs r0, #0
	mvns r0, r0
	muls r5, r0, r5
_022293EC:
	adds r0, r6, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0221FA04
	cmp r0, #5
	bne _02229416
	adds r0, r6, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0221FA04
	cmp r0, #3
	bne _02229416
	movs r0, #0
	mvns r0, r0
	muls r5, r0, r5
_02229416:
	cmp r5, #0
	ldr r2, _02229470 @ =0x00005C71
	ble _0222942E
	ldr r1, _02229474 @ =0x00000E38
	adds r0, r4, #0
	adds r0, #0xd4
	muls r1, r5, r1
	muls r2, r5, r2
	movs r3, #0xa
	bl ov07_022223F0
	b _0222943E
_0222942E:
	ldr r1, _02229478 @ =0x00003FFF
	adds r0, r4, #0
	adds r0, #0xd4
	muls r1, r5, r1
	muls r2, r5, r2
	movs r3, #0xa
	bl ov07_022223F0
_0222943E:
	adds r1, r4, #0
	adds r1, #0xd4
	ldr r1, [r1]
	ldr r0, [r4, #0x38]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FUN_0200E074
	adds r0, r4, #0
	adds r1, r4, #0
	ldr r2, [r4, #0x38]
	adds r0, #0x8c
	adds r1, #0xb0
	bl ov07_022223CC
	ldr r0, [r4, #0x38]
	bl FUN_0200DC18
	ldr r0, [r4, #0x14]
	ldr r1, _0222947C @ =ov07_0222928C
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02229470: .4byte 0x00005C71
_02229474: .4byte 0x00000E38
_02229478: .4byte 0x00003FFF
_0222947C: .4byte ov07_0222928C
	thumb_func_end ov07_022292E4

	thumb_func_start ov07_02229480
ov07_02229480: @ 0x02229480
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4, #0x18]
	cmp r0, #3
	bls _02229490
	b _022295FC
_02229490:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222949C: @ jump table
	.2byte _022294A4 - _0222949C - 2 @ case 0
	.2byte _022294D4 - _0222949C - 2 @ case 1
	.2byte _02229574 - _0222949C - 2 @ case 2
	.2byte _02229586 - _0222949C - 2 @ case 3
_022294A4:
	movs r0, #0x12
	ldrsh r2, [r4, r0]
	movs r0, #0x96
	movs r3, #0x3c
	str r0, [sp]
	movs r1, #0x64
	str r1, [sp, #4]
	movs r0, #0xc
	muls r1, r2, r1
	muls r3, r2, r3
	lsls r2, r3, #0x10
	str r0, [sp, #8]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	adds r0, #0x9c
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	movs r3, #5
	bl ov07_02222590
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	b _0222961A
_022294D4:
	adds r0, r4, #0
	adds r0, #0x9c
	bl ov07_0222260C
	cmp r0, #0
	bne _02229512
	movs r0, #0x12
	ldrsh r2, [r4, r0]
	movs r0, #0xa
	movs r1, #0x3c
	str r0, [sp]
	movs r0, #0x64
	str r0, [sp, #4]
	movs r0, #0xc
	muls r1, r2, r1
	str r0, [sp, #8]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	movs r3, #0x96
	adds r5, r2, #0
	muls r5, r3, r5
	lsls r2, r5, #0x10
	adds r0, #0x9c
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov07_02222590
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	b _0222961A
_02229512:
	adds r0, r4, #0
	adds r0, #0x9c
	add r1, sp, #0x18
	add r2, sp, #0x14
	bl ov07_02222644
	ldr r0, [r4, #0x40]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x14]
	bl FUN_0200E024
	movs r0, #0x16
	adds r2, r4, #0
	adds r2, #0xb0
	ldrsh r0, [r4, r0]
	ldr r2, [r2]
	movs r1, #0x10
	bl ov07_02222674
	movs r2, #0x16
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	movs r1, #0x14
	ldrsh r1, [r4, r1]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	ldr r0, [r4, #0x40]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldrb r1, [r4, #0xc]
	ldrb r0, [r4, #0x10]
	cmp r1, r0
	bhs _0222955A
	adds r0, r1, #1
	strb r0, [r4, #0xc]
_0222955A:
	ldrb r1, [r4, #0xd]
	ldrb r0, [r4, #0x11]
	cmp r1, r0
	bls _02229566
	subs r0, r1, #1
	strb r0, [r4, #0xd]
_02229566:
	ldrb r0, [r4, #0xd]
	ldrb r1, [r4, #0xc]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0222962C @ =0x04000052
	strh r1, [r0]
	b _0222961A
_02229574:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #4
	blt _0222961A
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	b _0222961A
_02229586:
	adds r0, r4, #0
	adds r0, #0x9c
	bl ov07_0222260C
	cmp r0, #0
	bne _0222959A
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	b _0222961A
_0222959A:
	adds r0, r4, #0
	adds r0, #0x9c
	add r1, sp, #0x10
	add r2, sp, #0xc
	bl ov07_02222644
	ldr r0, [r4, #0x40]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl FUN_0200E024
	movs r0, #0x16
	adds r2, r4, #0
	adds r2, #0xb0
	ldrsh r0, [r4, r0]
	ldr r2, [r2]
	movs r1, #0x10
	bl ov07_02222674
	movs r2, #0x16
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	movs r1, #0x14
	ldrsh r1, [r4, r1]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	ldr r0, [r4, #0x40]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldrb r1, [r4, #0xc]
	ldrb r0, [r4, #0xe]
	cmp r1, r0
	bls _022295E2
	subs r0, r1, #1
	strb r0, [r4, #0xc]
_022295E2:
	ldrb r1, [r4, #0xd]
	ldrb r0, [r4, #0xf]
	cmp r1, r0
	bhs _022295EE
	adds r0, r1, #1
	strb r0, [r4, #0xd]
_022295EE:
	ldrb r0, [r4, #0xd]
	ldrb r1, [r4, #0xc]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0222962C @ =0x04000052
	strh r1, [r0]
	b _0222961A
_022295FC:
	ldr r0, [r4, #0x44]
	bl FUN_0200D9DC
	ldr r0, [r4, #0x48]
	bl FUN_0200D9DC
	ldr r0, [r4, #0x1c]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl ov07_02232508
	add sp, #0x1c
	pop {r4, r5, pc}
_0222961A:
	ldr r0, [r4, #0x40]
	bl FUN_0200DC18
	ldr r0, [r4, #0x28]
	bl FUN_0200D020
	add sp, #0x1c
	pop {r4, r5, pc}
	nop
_0222962C: .4byte 0x04000052
	thumb_func_end ov07_02229480

	thumb_func_start ov07_02229630
ov07_02229630: @ 0x02229630
	push {r4, r5, lr}
	sub sp, #0x14
	movs r1, #0xd4
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x18
	bl ov07_02231FE4
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4C0
	str r0, [r4, #0x44]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4C0
	movs r1, #0
	str r0, [r4, #0x48]
	mvns r1, r1
	ldr r0, [r4, #0x1c]
	adds r2, r1, #0
	bl ov07_02231E08
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	movs r1, #0
	strb r1, [r4, #0xc]
	movs r0, #0x1f
	strb r0, [r4, #0xd]
	strb r1, [r4, #0xe]
	strb r0, [r4, #0xf]
	strb r0, [r4, #0x10]
	movs r0, #4
	strb r0, [r4, #0x11]
	adds r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _022296C0
	ldr r0, [r4, #0x44]
	movs r1, #0
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x48]
	bl FUN_0200DCE8
	ldr r0, [r4, #0x40]
	movs r1, #0
	bl FUN_0200DC4C
	movs r0, #0xb3
	strh r0, [r4, #0x14]
	movs r0, #0x78
	strh r0, [r4, #0x16]
	adds r0, r5, #0
	bl ov07_0221FAE8
	adds r1, r0, #0
	ldr r0, [r4, #0x40]
	adds r1, r1, #1
	bl FUN_0200DD54
	movs r0, #0
	mvns r0, r0
	strh r0, [r4, #0x12]
	b _02229720
_022296C0:
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _022296F0
	ldr r0, [r4, #0x48]
	movs r1, #0
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x44]
	bl FUN_0200DCE8
	ldr r0, [r4, #0x40]
	movs r1, #1
	bl FUN_0200DC4C
	movs r0, #0x90
	strh r0, [r4, #0x14]
	movs r0, #0x40
	strh r0, [r4, #0x16]
	b _0222971C
_022296F0:
	ldr r0, [r4, #0x44]
	movs r1, #0
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x48]
	bl FUN_0200DCE8
	ldr r0, [r4, #0x40]
	movs r1, #0
	bl FUN_0200DC4C
	movs r0, #0x4c
	strh r0, [r4, #0x14]
	movs r0, #0x78
	strh r0, [r4, #0x16]
	adds r0, r5, #0
	bl ov07_0221FAE8
	adds r1, r0, #0
	ldr r0, [r4, #0x40]
	adds r1, r1, #1
	bl FUN_0200DD54
_0222971C:
	movs r0, #1
	strh r0, [r4, #0x12]
_02229720:
	movs r1, #0x14
	movs r2, #0x16
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x40]
	bl FUN_0200DDB8
	ldr r0, [r4, #0x40]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r4, #0x40]
	movs r1, #1
	bl FUN_0200E0FC
	movs r0, #0x12
	ldrsh r0, [r4, r0]
	movs r3, #0x64
	adds r1, r0, #0
	movs r0, #5
	str r0, [sp]
	muls r1, r3, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x9c
	adds r2, r1, #0
	bl ov07_02222590
	adds r0, r4, #0
	adds r0, #0x9c
	bl ov07_0222260C
	adds r0, r4, #0
	adds r0, #0x9c
	add r1, sp, #0x10
	add r2, sp, #0xc
	bl ov07_02222644
	ldr r0, [r4, #0x40]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl FUN_0200E024
	movs r0, #0x16
	adds r2, r4, #0
	adds r2, #0xb0
	ldrsh r0, [r4, r0]
	ldr r2, [r2]
	movs r1, #0x10
	bl ov07_02222674
	movs r2, #0x16
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	movs r1, #0x14
	ldrsh r1, [r4, r1]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	ldr r0, [r4, #0x40]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r0, [r4, #0x1c]
	ldr r1, _022297B4 @ =ov07_02229480
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_022297B4: .4byte ov07_02229480
	thumb_func_end ov07_02229630

	thumb_func_start ov07_022297B8
ov07_022297B8: @ 0x022297B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r4, r1, #0
	str r0, [sp, #0x10]
	ldrb r0, [r4]
	cmp r0, #8
	bls _022297C8
	b _02229B1C
_022297C8:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022297D4: @ jump table
	.2byte _022297E6 - _022297D4 - 2 @ case 0
	.2byte _0222981E - _022297D4 - 2 @ case 1
	.2byte _02229878 - _022297D4 - 2 @ case 2
	.2byte _02229892 - _022297D4 - 2 @ case 3
	.2byte _022298C6 - _022297D4 - 2 @ case 4
	.2byte _0222994A - _022297D4 - 2 @ case 5
	.2byte _022299DC - _022297D4 - 2 @ case 6
	.2byte _02229A7A - _022297D4 - 2 @ case 7
	.2byte _02229AC2 - _022297D4 - 2 @ case 8
_022297E6:
	ldrb r1, [r4, #0xc]
	ldr r2, _02229B00 @ =0x02236705
	ldr r5, _02229B04 @ =0x02236706
	lsls r0, r1, #2
	adds r3, r1, r0
	ldr r0, _02229B08 @ =0x02236707
	ldr r1, _02229B0C @ =0x02236704
	ldrb r0, [r0, r3]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	str r0, [sp]
	movs r0, #0x64
	str r0, [sp, #4]
	ldr r0, _02229B10 @ =0x02236708
	ldrb r0, [r0, r3]
	ldrb r3, [r5, r3]
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0xcc
	bl ov07_02222590
	ldrb r0, [r4, #0xc]
	adds r0, r0, #1
	strb r0, [r4, #0xc]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02229B56
_0222981E:
	adds r0, r4, #0
	adds r0, #0xcc
	bl ov07_0222260C
	cmp r0, #1
	bne _02229864
	movs r2, #0xcc
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	movs r1, #0xc
	bl FUN_020087A4
	movs r2, #0xce
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	movs r1, #0xd
	bl FUN_020087A4
	movs r0, #0x20
	adds r2, r4, #0
	adds r2, #0xe0
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x24]
	ldr r2, [r2]
	bl ov07_02222674
	movs r2, #0x20
	adds r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	movs r1, #1
	adds r2, r2, r3
	bl FUN_020087A4
	b _02229B56
_02229864:
	ldrb r0, [r4, #0xc]
	cmp r0, #3
	ldrb r0, [r4]
	blo _02229872
	adds r0, r0, #1
	strb r0, [r4]
	b _02229B56
_02229872:
	subs r0, r0, #1
	strb r0, [r4]
	b _02229B56
_02229878:
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #1
	blo _02229956
	movs r0, #0
	strb r0, [r4, #1]
	strb r0, [r4, #0xc]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02229B56
_02229892:
	add r1, sp, #0x2c
	ldr r0, [r4, #0x30]
	adds r1, #2
	add r2, sp, #0x2c
	bl FUN_0200DE44
	add r1, sp, #0x14
	movs r0, #0x18
	ldrsh r0, [r1, r0]
	cmp r0, #0x68
	bgt _022298BE
	ldr r0, [r4, #0x30]
	movs r1, #0
	movs r2, #2
	bl FUN_0200DED0
	ldr r0, [r4, #0x7c]
	movs r1, #0
	movs r2, #2
	bl FUN_0200DED0
	b _02229B56
_022298BE:
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02229B56
_022298C6:
	add r1, sp, #0x28
	ldr r0, [r4, #0x30]
	adds r1, #2
	add r2, sp, #0x28
	bl FUN_0200DE44
	add r1, sp, #0x14
	movs r0, #0x14
	ldrsh r0, [r1, r0]
	cmp r0, #0x68
	bgt _022298F2
	ldr r0, [r4, #0x30]
	movs r1, #0
	movs r2, #2
	bl FUN_0200DED0
	ldr r0, [r4, #0x7c]
	movs r1, #0
	movs r2, #2
	bl FUN_0200DED0
	b _022298FE
_022298F2:
	ldr r0, _02229B14 @ =0x04000052
	movs r1, #0x10
	strh r1, [r0]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_022298FE:
	ldrb r0, [r4, #1]
	movs r1, #0x10
	adds r2, r1, #0
	adds r0, r0, #1
	strb r0, [r4, #1]
	adds r0, r4, #4
	bl ov07_02222E48
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	adds r0, #8
	subs r2, #0x10
	bl ov07_02222E48
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _02229B14 @ =0x04000052
	strh r1, [r0]
	ldrb r0, [r4, #1]
	cmp r0, #0xa
	bne _02229938
	ldr r0, [r4, #0x30]
	movs r1, #0
	movs r2, #0x10
	bl FUN_0200DED0
_02229938:
	ldrb r0, [r4, #1]
	cmp r0, #0xc
	bne _02229956
	ldr r0, [r4, #0x7c]
	movs r1, #0
	movs r2, #0x10
	bl FUN_0200DED0
	b _02229B56
_0222994A:
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #1
	bhs _02229958
_02229956:
	b _02229B56
_02229958:
	movs r0, #0
	strb r0, [r4, #1]
	add r1, sp, #0x24
	ldr r0, [r4, #0x30]
	adds r1, #2
	add r2, sp, #0x24
	bl FUN_0200DE44
	add r1, sp, #0x20
	ldr r0, [r4, #0x7c]
	adds r1, #2
	add r2, sp, #0x20
	bl FUN_0200DE44
	adds r0, r4, #0
	adds r0, #0xc8
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0xca
	str r0, [sp, #4]
	add r3, sp, #0x14
	movs r0, #0x12
	movs r1, #0x10
	movs r2, #0xe
	movs r5, #0xc
	ldrsh r0, [r3, r0]
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldrsh r3, [r3, r5]
	bl ov07_02222DC8
	adds r0, r4, #0
	adds r0, #0x2c
	str r0, [sp]
	movs r3, #0xca
	add r2, sp, #0x14
	movs r0, #0x12
	movs r1, #0x10
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	movs r2, #0xc8
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	bl ov07_02222DE4
	adds r0, r4, #0
	adds r0, #0x28
	str r0, [sp]
	movs r3, #0xca
	add r2, sp, #0x14
	movs r0, #0x12
	movs r1, #0x10
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	movs r2, #0xc8
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	bl ov07_02222E0C
	movs r0, #0xa
	lsls r0, r0, #0xe
	str r0, [r4, #0x2c]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02229B56
_022299DC:
	ldr r3, _02229B18 @ =0x022366E1
	add r2, sp, #0x30
	movs r1, #0xa
_022299E2:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _022299E2
	add r1, sp, #0x1c
	ldr r0, [r4, #0x30]
	adds r1, #2
	add r2, sp, #0x1c
	bl FUN_0200DE44
	add r1, sp, #0x18
	ldr r0, [r4, #0x7c]
	adds r1, #2
	add r2, sp, #0x18
	bl FUN_0200DE44
	add r3, sp, #0x14
	movs r0, #8
	ldrsh r0, [r3, r0]
	movs r2, #0xa
	str r0, [sp]
	movs r0, #4
	ldrsh r0, [r3, r0]
	str r0, [sp, #4]
	str r2, [sp, #8]
	ldrb r1, [r4, #0xc]
	ldr r0, [r4, #0x2c]
	lsls r5, r1, #1
	add r1, sp, #0x30
	ldrsb r1, [r1, r5]
	movs r5, #6
	muls r1, r0, r1
	str r1, [sp, #0xc]
	ldrsh r2, [r3, r2]
	adds r0, r4, #0
	adds r1, r4, #0
	ldrsh r3, [r3, r5]
	adds r0, #0x34
	adds r1, #0x58
	bl ov07_02222338
	add r3, sp, #0x14
	movs r0, #4
	ldrsh r0, [r3, r0]
	movs r5, #0xa
	str r0, [sp]
	movs r0, #8
	ldrsh r0, [r3, r0]
	str r0, [sp, #4]
	str r5, [sp, #8]
	ldrb r1, [r4, #0xc]
	ldr r0, [r4, #0x2c]
	lsls r2, r1, #1
	add r1, sp, #0x30
	adds r1, #1
	ldrsb r1, [r1, r2]
	movs r2, #6
	muls r1, r0, r1
	str r1, [sp, #0xc]
	ldrsh r2, [r3, r2]
	adds r0, r4, #0
	adds r1, r4, #0
	ldrsh r3, [r3, r5]
	adds r0, #0x80
	adds r1, #0xa4
	bl ov07_02222338
	ldrb r0, [r4, #0xc]
	adds r0, r0, #1
	strb r0, [r4, #0xc]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02229B56
_02229A7A:
	adds r0, r4, #0
	ldr r2, [r4, #0x30]
	adds r0, #0x34
	adds r1, #0x58
	movs r5, #0
	bl ov07_022223CC
	cmp r0, #0
	bne _02229A92
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_02229A92:
	adds r0, r4, #0
	adds r1, r4, #0
	ldr r2, [r4, #0x7c]
	adds r0, #0x80
	adds r1, #0xa4
	bl ov07_022223CC
	cmp r0, #0
	bne _02229AAA
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_02229AAA:
	cmp r5, #2
	bne _02229B56
	ldrb r0, [r4, #0xc]
	cmp r0, #5
	ldrb r0, [r4]
	bne _02229ABC
	adds r0, r0, #1
	strb r0, [r4]
	b _02229B56
_02229ABC:
	subs r0, r0, #1
	strb r0, [r4]
	b _02229B56
_02229AC2:
	movs r5, #0
	adds r0, r4, #4
	adds r1, r5, #0
	subs r2, r5, #2
	bl ov07_02222E48
	cmp r0, #1
	bne _02229AD4
	adds r5, r5, #1
_02229AD4:
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x10
	movs r2, #2
	bl ov07_02222E48
	cmp r0, #1
	bne _02229AE6
	adds r5, r5, #1
_02229AE6:
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _02229B14 @ =0x04000052
	cmp r5, #2
	strh r1, [r0]
	bne _02229B56
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02229B56
	nop
_02229B00: .4byte 0x02236705
_02229B04: .4byte 0x02236706
_02229B08: .4byte 0x02236707
_02229B0C: .4byte 0x02236704
_02229B10: .4byte 0x02236708
_02229B14: .4byte 0x04000052
_02229B18: .4byte 0x022366E1
_02229B1C:
	movs r6, #0
	ldr r0, [r4, #0x10]
	adds r1, r6, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _02229B44
	adds r5, r4, #0
	adds r7, r6, #0
_02229B2E:
	ldr r0, [r5, #0x30]
	bl FUN_0200D9DC
	ldr r0, [r4, #0x10]
	adds r1, r7, #0
	adds r5, #0x4c
	adds r6, r6, #1
	bl ov07_0221C4A8
	cmp r6, r0
	blt _02229B2E
_02229B44:
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #0x10]
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
_02229B56:
	movs r6, #0
	ldr r0, [r4, #0x10]
	adds r1, r6, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _02229BC2
	adds r5, r4, #0
	add r7, sp, #0x14
_02229B68:
	add r1, sp, #0x14
	ldr r0, [r5, #0x30]
	adds r1, #2
	add r2, sp, #0x14
	bl FUN_0200DE44
	movs r0, #0
	ldrsh r0, [r7, r0]
	cmp r0, #0x50
	bge _02229B8C
	ldr r0, [r4, #0x10]
	bl ov07_0221FAE8
	adds r1, r0, #0
	ldr r0, [r5, #0x30]
	bl FUN_0200DD54
	b _02229BB2
_02229B8C:
	movs r0, #2
	ldrsh r0, [r7, r0]
	cmp r0, #0x80
	ldr r0, [r4, #0x10]
	ble _02229BA4
	bl ov07_0221FAE8
	adds r1, r0, #0
	ldr r0, [r5, #0x30]
	bl FUN_0200DD54
	b _02229BB2
_02229BA4:
	bl ov07_0221FAE8
	adds r1, r0, #0
	ldr r0, [r5, #0x30]
	adds r1, r1, #1
	bl FUN_0200DD54
_02229BB2:
	ldr r0, [r4, #0x10]
	movs r1, #0
	adds r5, #0x4c
	adds r6, r6, #1
	bl ov07_0221C4A8
	cmp r6, r0
	blt _02229B68
_02229BC2:
	ldrb r0, [r4]
	cmp r0, #4
	blo _02229BF6
	movs r5, #0
	ldr r0, [r4, #0x10]
	adds r1, r5, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _02229BF0
	adds r6, r4, #0
	adds r7, r5, #0
_02229BDA:
	ldr r0, [r6, #0x30]
	bl FUN_0200DC18
	ldr r0, [r4, #0x10]
	adds r1, r7, #0
	adds r6, #0x4c
	adds r5, r5, #1
	bl ov07_0221C4A8
	cmp r5, r0
	blt _02229BDA
_02229BF0:
	ldr r0, [r4, #0x18]
	bl FUN_0200D020
_02229BF6:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_022297B8

	thumb_func_start ov07_02229BFC
ov07_02229BFC: @ 0x02229BFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r1, #0
	movs r1, #0xf0
	str r0, [sp]
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	movs r1, #0
	strb r1, [r4]
	ldr r0, [sp]
	strb r1, [r4, #1]
	str r0, [r4, #0x10]
	str r6, [r4, #0x18]
	str r5, [r4, #0x14]
	str r1, [r4, #4]
	movs r0, #0x10
	str r0, [r4, #8]
	ldr r0, [r4, #0x10]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	bl ov07_0221FA48
	str r0, [r4, #0x1c]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	bl ov07_0221FAA0
	str r0, [r4, #0x24]
	ldr r0, [sp]
	movs r1, #2
	bl ov07_0221FAF8
	adds r5, r0, #0
	ldr r0, [sp]
	movs r1, #1
	bl ov07_0221FAF8
	movs r2, #1
	adds r1, r2, #0
	adds r3, r0, #0
	lsls r1, r5
	adds r5, r2, #0
	lsls r5, r3
	orrs r1, r5
	orrs r1, r2
	subs r2, r2, #2
	ldr r0, [r4, #0x10]
	adds r3, r2, #0
	bl ov07_02231E44
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _02229D38 @ =0x04000052
	strh r1, [r0]
	ldr r1, [sp]
	add r0, sp, #4
	bl ov07_0221F9E8
	str r7, [r4, #0x30]
	ldr r0, [r4, #0x10]
	movs r1, #0
	movs r6, #1
	bl ov07_0221C4A8
	cmp r0, #1
	ble _02229CBE
	adds r5, r4, #0
	adds r5, #0x4c
	add r7, sp, #4
_02229CA2:
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	adds r2, r7, #0
	bl FUN_0200D734
	str r0, [r5, #0x30]
	ldr r0, [r4, #0x10]
	movs r1, #0
	adds r5, #0x4c
	adds r6, r6, #1
	bl ov07_0221C4A8
	cmp r6, r0
	blt _02229CA2
_02229CBE:
	movs r6, #0
	ldr r0, [r4, #0x10]
	adds r1, r6, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _02229CF8
	adds r5, r4, #0
	movs r7, #1
_02229CD0:
	ldr r0, [r5, #0x30]
	adds r1, r7, #0
	bl FUN_0200E0FC
	ldr r0, [r4, #0x10]
	bl ov07_0221FAE8
	adds r1, r0, #0
	ldr r0, [r5, #0x30]
	adds r1, r1, #1
	bl FUN_0200DD54
	ldr r0, [r4, #0x10]
	movs r1, #0
	adds r5, #0x4c
	adds r6, r6, #1
	bl ov07_0221C4A8
	cmp r6, r0
	blt _02229CD0
_02229CF8:
	ldr r0, [sp]
	bl ov07_0221BFC0
	cmp r0, #1
	ldr r0, [r4, #0x30]
	bne _02229D18
	movs r1, #0xa0
	movs r2, #0x36
	bl FUN_0200DDB8
	ldr r0, [r4, #0x7c]
	movs r1, #0x50
	movs r2, #0x27
	bl FUN_0200DDB8
	b _02229D2A
_02229D18:
	movs r1, #0x64
	movs r2, #0x36
	bl FUN_0200DDB8
	ldr r0, [r4, #0x7c]
	movs r1, #0xb4
	movs r2, #0x27
	bl FUN_0200DDB8
_02229D2A:
	ldr r0, [r4, #0x10]
	ldr r1, _02229D3C @ =ov07_022297B8
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02229D38: .4byte 0x04000052
_02229D3C: .4byte ov07_022297B8
	thumb_func_end ov07_02229BFC

	thumb_func_start ov07_02229D40
ov07_02229D40: @ 0x02229D40
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _02229D52
	cmp r0, #1
	beq _02229DC6
	b _02229DFA
_02229D52:
	ldrb r0, [r5, #6]
	cmp r0, #0xf
	bhs _02229D5C
	adds r0, r0, #1
	strb r0, [r5, #6]
_02229D5C:
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _02229D66
	subs r0, r0, #1
	strb r0, [r5, #7]
_02229D66:
	ldrb r0, [r5, #7]
	ldrb r1, [r5, #6]
	movs r6, #0
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _02229E48 @ =0x04000052
	strh r1, [r0]
	ldrb r0, [r5, #4]
	adds r0, r0, #1
	strb r0, [r5, #4]
	ldrb r0, [r5, #5]
	cmp r0, #0
	ble _02229DB8
	ldr r4, _02229E4C @ =0x02236778
	adds r7, r5, #0
_02229D84:
	add r1, sp, #0
	ldr r0, [r7, #0x14]
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	ldrb r1, [r5, #4]
	ldrb r0, [r4]
	cmp r1, r0
	blo _02229DAC
	adds r0, r5, r6
	ldrb r1, [r0, #1]
	adds r1, r1, #1
	strb r1, [r0, #1]
	ldrb r2, [r0, #1]
	ldrb r1, [r4, #1]
	cmp r2, r1
	blo _02229DAC
	movs r1, #0
	strb r1, [r0, #1]
_02229DAC:
	ldrb r0, [r5, #5]
	adds r6, r6, #1
	adds r7, r7, #4
	adds r4, r4, #2
	cmp r6, r0
	blt _02229D84
_02229DB8:
	ldrb r0, [r5, #4]
	cmp r0, #0x2d
	blo _02229E24
	ldrb r0, [r5]
	adds r0, r0, #1
	strb r0, [r5]
	b _02229E24
_02229DC6:
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _02229DD0
	subs r0, r0, #1
	strb r0, [r5, #6]
_02229DD0:
	ldrb r0, [r5, #7]
	cmp r0, #0xf
	bhs _02229DDA
	adds r0, r0, #1
	strb r0, [r5, #7]
_02229DDA:
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _02229DEC
	ldrb r0, [r5, #7]
	cmp r0, #0xf
	bne _02229DEC
	ldrb r0, [r5]
	adds r0, r0, #1
	strb r0, [r5]
_02229DEC:
	ldrb r0, [r5, #7]
	ldrb r1, [r5, #6]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _02229E48 @ =0x04000052
	strh r1, [r0]
	b _02229E24
_02229DFA:
	ldrb r0, [r5, #5]
	movs r6, #0
	cmp r0, #0
	ble _02229E14
	adds r4, r5, #0
_02229E04:
	ldr r0, [r4, #0x14]
	bl FUN_0200D9DC
	ldrb r0, [r5, #5]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blt _02229E04
_02229E14:
	ldr r0, [r5, #8]
	adds r1, r7, #0
	bl ov07_0221C448
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
_02229E24:
	ldrb r0, [r5, #5]
	movs r6, #0
	cmp r0, #0
	ble _02229E40
	adds r4, r5, #0
_02229E2E:
	ldr r0, [r4, #0x14]
	ldr r0, [r0]
	bl FUN_0200DC0C
	ldrb r0, [r5, #5]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blt _02229E2E
_02229E40:
	ldr r0, [r5, #0x10]
	bl FUN_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02229E48: .4byte 0x04000052
_02229E4C: .4byte 0x02236778
	thumb_func_end ov07_02229D40

	thumb_func_start ov07_02229E50
ov07_02229E50: @ 0x02229E50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	str r3, [sp]
	bl ov07_0221BFD0
	movs r1, #0x44
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02229E6E
	bl GF_AssertFail
_02229E6E:
	movs r0, #0
	strb r0, [r4, #4]
	strb r0, [r4]
	str r5, [r4, #0xc]
	str r6, [r4, #0x10]
	add r0, sp, #4
	adds r1, r7, #0
	str r7, [r4, #8]
	bl ov07_0221F9E8
	movs r1, #0
	mvns r1, r1
	ldr r0, [r4, #8]
	adds r2, r1, #0
	bl ov07_02231E08
	ldr r0, [r4, #8]
	movs r1, #0
	bl ov07_0221C4A8
	strb r0, [r4, #5]
	movs r0, #0
	strb r0, [r4, #6]
	movs r0, #0xf
	strb r0, [r4, #7]
	ldrb r0, [r4, #7]
	ldrb r1, [r4, #6]
	movs r6, #1
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _02229FB4 @ =0x04000052
	strh r1, [r0]
	ldr r0, [sp]
	str r0, [r4, #0x14]
	ldrb r0, [r4, #5]
	cmp r0, #1
	ble _02229ED0
	adds r5, r4, #4
_02229EBA:
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r2, sp, #4
	bl FUN_0200D734
	str r0, [r5, #0x14]
	ldrb r0, [r4, #5]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _02229EBA
_02229ED0:
	adds r0, r7, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r7, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _02229F24
	adds r0, r7, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r7, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _02229F10
	adds r0, r7, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r7, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _02229F10
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0200DC4C
	b _02229F18
_02229F10:
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0200DC4C
_02229F18:
	ldr r0, [r4, #0x14]
	movs r1, #0x80
	movs r2, #0x50
	bl FUN_0200DDB8
	b _02229F64
_02229F24:
	adds r0, r7, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r7, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _02229F52
	adds r0, r7, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r7, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _02229F52
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0200DC4C
	b _02229F5A
_02229F52:
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0200DC4C
_02229F5A:
	ldr r0, [r4, #0x14]
	movs r1, #0x80
	movs r2, #0x50
	bl FUN_0200DDB8
_02229F64:
	ldrb r0, [r4, #5]
	movs r6, #0
	cmp r0, #0
	ble _02229FA4
	adds r5, r4, #0
_02229F6E:
	adds r1, r4, r6
	movs r0, #0
	strb r0, [r1, #1]
	ldr r0, [r5, #0x14]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r5, #0x14]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #8]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02229F9A
	movs r2, #0xfe
	ldr r0, [r5, #0x14]
	ldr r1, _02229FB8 @ =0xBF800000
	lsls r2, r2, #0x16
	bl FUN_0200E024
_02229F9A:
	ldrb r0, [r4, #5]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _02229F6E
_02229FA4:
	ldr r1, _02229FBC @ =ov07_02229D40
	ldr r3, _02229FC0 @ =0x0000044C
	adds r0, r7, #0
	adds r2, r4, #0
	bl ov07_0221C3F4
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02229FB4: .4byte 0x04000052
_02229FB8: .4byte 0xBF800000
_02229FBC: .4byte ov07_02229D40
_02229FC0: .4byte 0x0000044C
	thumb_func_end ov07_02229E50

	thumb_func_start ov07_02229FC4
ov07_02229FC4: @ 0x02229FC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r7, r0, #0
	ldrb r0, [r4]
	movs r6, #0
	cmp r0, #3
	bls _02229FD6
	b _0222A17C
_02229FD6:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02229FE2: @ jump table
	.2byte _02229FEA - _02229FE2 - 2 @ case 0
	.2byte _0222A01E - _02229FE2 - 2 @ case 1
	.2byte _0222A0F6 - _02229FE2 - 2 @ case 2
	.2byte _0222A142 - _02229FE2 - 2 @ case 3
_02229FEA:
	ldrb r0, [r4, #9]
	cmp r0, #0xf
	bhs _02229FF4
	adds r0, r0, #1
	strb r0, [r4, #9]
_02229FF4:
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	beq _02229FFE
	subs r0, r0, #1
	strb r0, [r4, #0xa]
_02229FFE:
	ldrb r0, [r4, #9]
	cmp r0, #0xf
	bne _0222A010
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _0222A010
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_0222A010:
	ldrb r0, [r4, #0xa]
	ldrb r1, [r4, #9]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0222A1D8 @ =0x04000052
	strh r1, [r0]
	b _0222A1A8
_0222A01E:
	ldr r0, [r4, #0x30]
	cmp r0, #3
	bhi _0222A084
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222A030: @ jump table
	.2byte _0222A038 - _0222A030 - 2 @ case 0
	.2byte _0222A052 - _0222A030 - 2 @ case 1
	.2byte _0222A06C - _0222A030 - 2 @ case 2
	.2byte _0222A06C - _0222A030 - 2 @ case 3
_0222A038:
	ldr r0, [r4, #0x18]
	movs r1, #1
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x24]
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x34]
	bl FUN_0200DCE8
	ldr r0, [r4, #0x38]
	movs r1, #1
	bl FUN_0200DCE8
	b _0222A084
_0222A052:
	ldr r0, [r4, #0x1c]
	movs r1, #1
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x34]
	bl FUN_0200DCE8
	ldr r0, [r4, #0x38]
	movs r1, #1
	bl FUN_0200DCE8
	b _0222A084
_0222A06C:
	ldr r0, [r4, #0x28]
	movs r1, #1
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x2c]
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x34]
	bl FUN_0200DCE8
	ldr r0, [r4, #0x38]
	movs r1, #1
	bl FUN_0200DCE8
_0222A084:
	add r1, sp, #8
	ldr r0, [r4, #0x34]
	adds r1, #2
	add r2, sp, #8
	bl FUN_0200DE44
	ldr r1, [r4, #0x30]
	ldr r0, _0222A1DC @ =0x022367B0
	lsls r2, r1, #3
	ldrsh r0, [r0, r2]
	ldr r5, _0222A1E0 @ =0x022367AE
	add r3, sp, #8
	str r0, [sp]
	ldr r0, _0222A1E4 @ =0x02236774
	ldrsh r2, [r5, r2]
	ldrb r0, [r0, r1]
	movs r1, #2
	movs r5, #0
	str r0, [sp, #4]
	ldrsh r1, [r3, r1]
	adds r0, r4, #0
	ldrsh r3, [r3, r5]
	adds r0, #0x3c
	bl ov07_02222268
	add r1, sp, #8
	ldr r0, [r4, #0x38]
	adds r1, #2
	add r2, sp, #8
	bl FUN_0200DE44
	ldr r1, [r4, #0x30]
	ldr r0, _0222A1E8 @ =0x022367B4
	lsls r2, r1, #3
	ldrsh r0, [r0, r2]
	ldr r5, _0222A1EC @ =0x022367B2
	add r3, sp, #8
	str r0, [sp]
	ldr r0, _0222A1E4 @ =0x02236774
	ldrsh r2, [r5, r2]
	ldrb r0, [r0, r1]
	movs r1, #2
	movs r5, #0
	str r0, [sp, #4]
	ldrsh r1, [r3, r1]
	adds r0, r4, #0
	ldrsh r3, [r3, r5]
	adds r0, #0x60
	bl ov07_02222268
	ldr r0, [r4, #0x30]
	adds r0, r0, #1
	str r0, [r4, #0x30]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0222A1A8
_0222A0F6:
	adds r0, r4, #0
	ldr r1, [r4, #0x34]
	adds r0, #0x3c
	adds r5, r6, #0
	bl ov07_022222F0
	cmp r0, #0
	bne _0222A108
	adds r5, r5, #1
_0222A108:
	adds r0, r4, #0
	ldr r1, [r4, #0x38]
	adds r0, #0x60
	bl ov07_022222F0
	cmp r0, #0
	bne _0222A118
	adds r5, r5, #1
_0222A118:
	cmp r5, #2
	blt _0222A1A8
	ldr r0, [r4, #0x30]
	cmp r0, #3
	bgt _0222A13A
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x38]
	movs r1, #0
	bl FUN_0200DCE8
	ldrb r0, [r4]
	subs r0, r0, #1
	strb r0, [r4]
	b _0222A1A8
_0222A13A:
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0222A1A8
_0222A142:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0222A14C
	subs r0, r0, #1
	strb r0, [r4, #9]
_0222A14C:
	ldrb r0, [r4, #0xa]
	cmp r0, #0xf
	bhs _0222A156
	adds r0, r0, #1
	strb r0, [r4, #0xa]
_0222A156:
	ldrb r1, [r4, #0xa]
	cmp r1, #7
	blo _0222A15E
	movs r6, #1
_0222A15E:
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _0222A16E
	cmp r1, #0xf
	bne _0222A16E
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_0222A16E:
	ldrb r0, [r4, #0xa]
	ldrb r1, [r4, #9]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0222A1D8 @ =0x04000052
	strh r1, [r0]
	b _0222A1A8
_0222A17C:
	ldrb r0, [r4, #8]
	movs r6, #0
	cmp r0, #0
	ble _0222A196
	adds r5, r4, #0
_0222A186:
	ldr r0, [r5, #0x18]
	bl FUN_0200D9DC
	ldrb r0, [r4, #8]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _0222A186
_0222A196:
	ldr r0, [r4, #0xc]
	adds r1, r7, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0222A1A8:
	ldrb r0, [r4]
	cmp r0, #3
	bhs _0222A1CE
	cmp r6, #0
	bne _0222A1CE
	ldrb r0, [r4, #8]
	movs r6, #0
	cmp r0, #0
	ble _0222A1CE
	adds r5, r4, #0
_0222A1BC:
	ldr r0, [r5, #0x18]
	ldr r0, [r0]
	bl FUN_0200DC0C
	ldrb r0, [r4, #8]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _0222A1BC
_0222A1CE:
	ldr r0, [r4, #0x14]
	bl FUN_0200D020
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222A1D8: .4byte 0x04000052
_0222A1DC: .4byte 0x022367B0
_0222A1E0: .4byte 0x022367AE
_0222A1E4: .4byte 0x02236774
_0222A1E8: .4byte 0x022367B4
_0222A1EC: .4byte 0x022367B2
	thumb_func_end ov07_02229FC4

	thumb_func_start ov07_0222A1F0
ov07_0222A1F0: @ 0x0222A1F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp]
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov07_0221BFD0
	movs r1, #0x84
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _0222A20E
	bl GF_AssertFail
_0222A20E:
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4]
	str r5, [r4, #0x10]
	str r6, [r4, #0x14]
	str r0, [r4, #0x30]
	ldr r0, [sp]
	ldr r1, [sp]
	str r0, [r4, #0xc]
	add r0, sp, #4
	bl ov07_0221F9E8
	movs r1, #0
	mvns r1, r1
	ldr r0, [r4, #0xc]
	adds r2, r1, #0
	bl ov07_02231E08
	movs r1, #0
	strb r1, [r4, #9]
	movs r0, #0xf
	strb r0, [r4, #0xa]
	ldrb r0, [r4, #0xa]
	ldrb r2, [r4, #9]
	lsls r0, r0, #8
	orrs r2, r0
	ldr r0, _0222A318 @ =0x04000052
	strh r2, [r0]
	ldr r0, [r4, #0xc]
	bl ov07_0221C4A8
	strb r0, [r4, #8]
	str r7, [r4, #0x18]
	ldrb r0, [r4, #8]
	movs r6, #1
	cmp r0, #1
	ble _0222A272
	adds r5, r4, #4
	add r7, sp, #4
_0222A25C:
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	adds r2, r7, #0
	bl FUN_0200D734
	str r0, [r5, #0x18]
	ldrb r0, [r4, #8]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _0222A25C
_0222A272:
	ldr r0, [r4, #0x18]
	movs r1, #0
	bl FUN_0200DC4C
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_0200DC4C
	ldr r0, [r4, #0x20]
	movs r1, #1
	bl FUN_0200DC4C
	ldr r0, [r4, #0x24]
	movs r1, #1
	bl FUN_0200DC4C
	ldr r0, [r4, #0x28]
	movs r1, #2
	bl FUN_0200DC4C
	ldr r0, [r4, #0x2c]
	movs r1, #3
	bl FUN_0200DC4C
	ldr r0, [r4, #0x18]
	movs r1, #1
	bl FUN_0200E0C0
	ldr r0, [r4, #0x24]
	movs r1, #1
	bl FUN_0200E0C0
	ldrb r0, [r4, #8]
	movs r7, #0
	cmp r0, #0
	ble _0222A2E8
	ldr r6, _0222A31C @ =0x02236796
	adds r5, r4, #0
_0222A2BE:
	ldr r0, [r5, #0x18]
	movs r1, #1
	bl FUN_0200DC78
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r5, #0x18]
	bl FUN_0200DDB8
	ldr r0, [r5, #0x18]
	movs r1, #1
	bl FUN_0200E0FC
	ldrb r0, [r4, #8]
	adds r7, r7, #1
	adds r5, r5, #4
	adds r6, r6, #4
	cmp r7, r0
	blt _0222A2BE
_0222A2E8:
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x28]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [sp]
	ldr r1, _0222A320 @ =ov07_02229FC4
	ldr r3, _0222A324 @ =0x0000044C
	adds r2, r4, #0
	bl ov07_0221C3F4
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222A318: .4byte 0x04000052
_0222A31C: .4byte 0x02236796
_0222A320: .4byte ov07_02229FC4
_0222A324: .4byte 0x0000044C
	thumb_func_end ov07_0222A1F0

	thumb_func_start ov07_0222A328
ov07_0222A328: @ 0x0222A328
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	cmp r0, #7
	bls _0222A338
	b _0222A490
_0222A338:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222A344: @ jump table
	.2byte _0222A354 - _0222A344 - 2 @ case 0
	.2byte _0222A368 - _0222A344 - 2 @ case 1
	.2byte _0222A38A - _0222A344 - 2 @ case 2
	.2byte _0222A3B8 - _0222A344 - 2 @ case 3
	.2byte _0222A3E6 - _0222A344 - 2 @ case 4
	.2byte _0222A404 - _0222A344 - 2 @ case 5
	.2byte _0222A42C - _0222A344 - 2 @ case 6
	.2byte _0222A474 - _0222A344 - 2 @ case 7
_0222A354:
	ldrb r0, [r4, #0xe]
	subs r0, r0, #1
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #0xe]
	cmp r0, #0xa
	bhi _0222A374
	ldrb r0, [r4, #0xc]
	adds r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A368:
	ldrb r0, [r4, #0xd]
	adds r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	cmp r0, #3
	bhs _0222A376
_0222A374:
	b _0222A49E
_0222A376:
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	adds r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A38A:
	ldrb r0, [r4, #0xd]
	adds r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	cmp r0, #3
	bhi _0222A3AC
	ldr r0, [r4, #0x38]
	ldr r1, _0222A4A8 @ =0x3DCCCCCD
	blx FUN_020F1520
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x38]
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	bl FUN_0200E024
	b _0222A49E
_0222A3AC:
	movs r0, #0
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	adds r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A3B8:
	ldrb r0, [r4, #0xd]
	adds r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	cmp r0, #3
	bhi _0222A3DA
	ldr r0, [r4, #0x38]
	ldr r1, _0222A4A8 @ =0x3DCCCCCD
	blx FUN_020F24C8
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x38]
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	bl FUN_0200E024
	b _0222A49E
_0222A3DA:
	movs r0, #0
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	adds r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A3E6:
	ldrb r0, [r4, #0xe]
	subs r0, r0, #1
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #0xe]
	cmp r0, #0xa
	bhi _0222A49E
	ldr r0, [r4, #0x3c]
	movs r1, #1
	str r1, [r0]
	movs r0, #0
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	adds r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A404:
	ldrb r0, [r4, #0xd]
	adds r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	cmp r0, #0x1e
	bls _0222A41C
	movs r0, #0
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	adds r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A41C:
	ldr r0, [r4, #0x3c]
	ldr r0, [r0]
	cmp r0, #2
	bne _0222A49E
	ldrb r0, [r4, #0xc]
	adds r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A42C:
	bl FUN_0201FD44
	movs r1, #0xa
	blx FUN_020F2998
	adds r5, r1, #0
	add r2, sp, #8
	ldr r0, [r4, #0x10]
	add r1, sp, #8
	adds r2, #2
	adds r5, #0xa
	bl FUN_0200DE44
	ldrb r0, [r4, #0xf]
	add r3, sp, #8
	movs r1, #0
	lsls r2, r0, #2
	ldr r0, _0222A4AC @ =0x02236780
	ldrsh r0, [r0, r2]
	str r0, [sp]
	lsls r0, r5, #0x10
	ldr r5, _0222A4B0 @ =0x0223677E
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldrsh r2, [r5, r2]
	adds r0, r4, #0
	movs r5, #2
	ldrsh r1, [r3, r1]
	ldrsh r3, [r3, r5]
	adds r0, #0x14
	bl ov07_02222268
	ldrb r0, [r4, #0xc]
	adds r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A474:
	adds r0, r4, #0
	ldr r1, [r4, #0x10]
	adds r0, #0x14
	bl ov07_022222F0
	cmp r0, #0
	bne _0222A49E
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_0200DCE8
	ldrb r0, [r4, #0xc]
	adds r0, r0, #1
	strb r0, [r4, #0xc]
_0222A490:
	ldr r0, [r4, #0x3c]
	movs r1, #3
	str r1, [r0]
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
_0222A49E:
	ldr r0, [r4, #0x10]
	bl FUN_0200DC18
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0222A4A8: .4byte 0x3DCCCCCD
_0222A4AC: .4byte 0x02236780
_0222A4B0: .4byte 0x0223677E
	thumb_func_end ov07_0222A328

	thumb_func_start ov07_0222A4B4
ov07_0222A4B4: @ 0x0222A4B4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bhi _0222A570
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222A4CC: @ jump table
	.2byte _0222A4D4 - _0222A4CC - 2 @ case 0
	.2byte _0222A500 - _0222A4CC - 2 @ case 1
	.2byte _0222A522 - _0222A4CC - 2 @ case 2
	.2byte _0222A54E - _0222A4CC - 2 @ case 3
_0222A4D4:
	ldrb r6, [r4, #2]
	movs r3, #1
	movs r2, #0
	cmp r6, #0
	ble _0222A4F4
	ldr r0, _0222A588 @ =0x00000514
	adds r5, r4, #0
_0222A4E2:
	ldr r1, [r5, r0]
	cmp r1, #1
	beq _0222A4EC
	movs r3, #0
	b _0222A4F4
_0222A4EC:
	adds r2, r2, #1
	adds r5, r5, #4
	cmp r2, r6
	blt _0222A4E2
_0222A4F4:
	cmp r3, #1
	bne _0222A580
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0222A580
_0222A500:
	ldrb r0, [r4, #2]
	movs r5, #0
	cmp r0, #0
	ble _0222A51A
	ldr r0, _0222A588 @ =0x00000514
	adds r3, r4, #0
	movs r2, #2
_0222A50E:
	str r2, [r3, r0]
	ldrb r1, [r4, #2]
	adds r5, r5, #1
	adds r3, r3, #4
	cmp r5, r1
	blt _0222A50E
_0222A51A:
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0222A580
_0222A522:
	ldrb r5, [r4, #2]
	movs r2, #1
	movs r6, #0
	cmp r5, #0
	ble _0222A542
	ldr r0, _0222A588 @ =0x00000514
	adds r3, r4, #0
_0222A530:
	ldr r1, [r3, r0]
	cmp r1, #3
	beq _0222A53A
	movs r2, #0
	b _0222A542
_0222A53A:
	adds r6, r6, #1
	adds r3, r3, #4
	cmp r6, r5
	blt _0222A530
_0222A542:
	cmp r2, #1
	bne _0222A580
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0222A580
_0222A54E:
	ldrb r0, [r4, #2]
	movs r6, #0
	cmp r0, #0
	ble _0222A568
	adds r5, r4, #0
_0222A558:
	ldr r0, [r5, #0x24]
	bl FUN_0200D9DC
	ldrb r0, [r4, #2]
	adds r6, r6, #1
	adds r5, #0x40
	cmp r6, r0
	blt _0222A558
_0222A568:
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0222A580
_0222A570:
	ldr r0, [r4, #8]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
_0222A580:
	ldr r0, [r4, #0x10]
	bl FUN_0200D020
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222A588: .4byte 0x00000514
	thumb_func_end ov07_0222A4B4

	thumb_func_start ov07_0222A58C
ov07_0222A58C: @ 0x0222A58C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	str r0, [sp]
	adds r4, r1, #0
	adds r5, r2, #0
	adds r7, r3, #0
	bl ov07_0221BFD0
	ldr r1, _0222A6F4 @ =0x00000564
	bl FUN_0201AA8C
	adds r6, r0, #0
	bne _0222A5AA
	bl GF_AssertFail
_0222A5AA:
	movs r0, #0
	strb r0, [r6, #1]
	strb r0, [r6]
	str r4, [r6, #0xc]
	ldr r0, [sp]
	str r5, [r6, #0x10]
	str r0, [r6, #8]
	ldr r1, [sp]
	add r0, sp, #0x1c
	bl ov07_0221F9E8
	movs r1, #0
	mvns r1, r1
	ldr r0, [r6, #8]
	adds r2, r1, #0
	bl ov07_02231E08
	ldr r0, [r6, #8]
	movs r1, #0
	bl ov07_0221C4A8
	strb r0, [r6, #2]
	movs r0, #0xc
	strb r0, [r6, #2]
	str r7, [r6, #0x24]
	movs r4, #0
	ldrb r0, [r6, #2]
	str r4, [sp, #4]
	cmp r0, #0
	ble _0222A6E2
	ldr r0, _0222A6F8 @ =0x00000514
	adds r5, r6, #0
	adds r0, r6, r0
	str r0, [sp, #0x10]
	adds r0, r6, #0
	str r0, [sp, #0xc]
	adds r0, #0x14
	str r0, [sp, #0xc]
_0222A5F6:
	cmp r4, #0
	beq _0222A606
	ldr r0, [r6, #0xc]
	ldr r1, [r6, #0x10]
	add r2, sp, #0x1c
	bl FUN_0200D734
	str r0, [r5, #0x24]
_0222A606:
	adds r1, r5, #0
	ldr r7, [r5, #0x24]
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
	bl FUN_0201FD44
	movs r1, #0xa
	blx FUN_020F2998
	adds r1, #0xa
	adds r0, r5, #0
	adds r1, r4, r1
	adds r0, #0x22
	strb r1, [r0]
	bl FUN_0201FD44
	movs r1, #6
	blx FUN_020F2998
	adds r0, r5, #0
	adds r0, #0x23
	strb r1, [r0]
	movs r0, #0xfe
	lsls r0, r0, #0x16
	str r0, [r5, #0x4c]
	ldr r0, [r6, #8]
	ldr r1, _0222A6FC @ =0x022367CE
	str r0, [r5, #0x14]
	ldr r0, [r6, #0xc]
	str r0, [r5, #0x18]
	ldr r0, [r6, #0x10]
	str r0, [r5, #0x1c]
	ldr r0, [sp, #0x10]
	str r0, [r5, #0x50]
	ldr r0, [sp, #4]
	lsls r0, r0, #3
	str r0, [sp, #0x18]
	adds r0, r1, r0
	str r0, [sp, #8]
	bl FUN_0201FD44
	ldr r2, [sp, #8]
	movs r1, #6
	ldrsh r1, [r2, r1]
	blx FUN_020F2998
	ldr r2, [sp, #8]
	movs r0, #2
	ldrsh r0, [r2, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x14]
	bl FUN_0201FD44
	ldr r2, [sp, #8]
	movs r1, #4
	ldrsh r1, [r2, r1]
	blx FUN_020F2998
	ldr r2, _0222A6FC @ =0x022367CE
	ldr r0, [sp, #0x18]
	ldrsh r0, [r2, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r1, [sp, #0x14]
	adds r0, r7, #0
	bl FUN_0200DDB8
	adds r0, r7, #0
	movs r1, #2
	bl FUN_0200DF98
	ldr r1, [r5, #0x4c]
	adds r0, r7, #0
	adds r2, r1, #0
	bl FUN_0200E024
	adds r0, r7, #0
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [sp]
	ldr r1, _0222A700 @ =ov07_0222A328
	ldr r2, [sp, #0xc]
	ldr r3, _0222A704 @ =0x0000044B
	bl ov07_0221C3F4
	ldr r0, [sp, #4]
	movs r1, #6
	adds r0, r0, #1
	blx FUN_020F2998
	ldr r0, [sp, #0x10]
	adds r4, r4, #1
	adds r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	str r1, [sp, #4]
	adds r0, #0x40
	str r0, [sp, #0xc]
	ldrb r0, [r6, #2]
	adds r5, #0x40
	cmp r4, r0
	blt _0222A5F6
_0222A6E2:
	ldr r0, [sp]
	ldr r1, _0222A708 @ =ov07_0222A4B4
	ldr r3, _0222A70C @ =0x0000044D
	adds r2, r6, #0
	bl ov07_0221C3F4
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222A6F4: .4byte 0x00000564
_0222A6F8: .4byte 0x00000514
_0222A6FC: .4byte 0x022367CE
_0222A700: .4byte ov07_0222A328
_0222A704: .4byte 0x0000044B
_0222A708: .4byte ov07_0222A4B4
_0222A70C: .4byte 0x0000044D
	thumb_func_end ov07_0222A58C

	thumb_func_start ov07_0222A710
ov07_0222A710: @ 0x0222A710
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4, #4]
	cmp r0, #3
	bhi _0222A7F6
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222A72A: @ jump table
	.2byte _0222A732 - _0222A72A - 2 @ case 0
	.2byte _0222A750 - _0222A72A - 2 @ case 1
	.2byte _0222A7A2 - _0222A72A - 2 @ case 2
	.2byte _0222A7CC - _0222A72A - 2 @ case 3
_0222A732:
	ldr r0, [r4, #8]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	movs r1, #6
	movs r2, #1
	bl FUN_020087A4
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0222A81C
_0222A750:
	adds r0, r4, #0
	adds r0, #0x2c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222A81C
	movs r0, #0
	str r0, [r4]
	ldr r0, [r4, #8]
	movs r1, #1
	bl ov07_0221FAF8
	adds r5, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl ov07_02222D88
	adds r6, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221BFD0
	movs r1, #0xc8
	str r1, [sp]
	movs r3, #3
	str r5, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r1, #0
	movs r1, #0xa0
	adds r2, r1, #0
	adds r2, #0xcc
	lsls r3, r3, #0xe
	bl ov07_02222CCC
	str r0, [r4, #0x28]
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0222A81C
_0222A7A2:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	cmp r0, #0x78
	blt _0222A81C
	ldr r0, [r4, #0x28]
	bl ov07_02222D3C
	movs r1, #2
	movs r2, #0x10
	str r1, [sp]
	adds r0, r4, #0
	str r2, [sp, #4]
	adds r0, #0x2c
	adds r3, r2, #0
	bl ov07_02222AC4
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0222A81C
_0222A7CC:
	adds r0, r4, #0
	adds r0, #0x2c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222A81C
	ldr r0, [r4, #8]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0222A81C
_0222A7F6:
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0222A834 @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	ldr r0, [r4, #8]
	movs r1, #2
	bl ov07_0221EC7C
	ldr r0, [r4, #8]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
_0222A81C:
	ldr r0, [r4, #0x24]
	bl FUN_0200DC18
	ldr r0, [r4, #0x20]
	bl FUN_0200DC18
	ldr r0, [r4, #0x10]
	bl FUN_0200D020
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0222A834: .4byte 0xFFFF1FFF
	thumb_func_end ov07_0222A710

	thumb_func_start ov07_0222A838
ov07_0222A838: @ 0x0222A838
	push {r3, r4, r5, lr}
	sub sp, #8
	movs r1, #0x54
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #4
	bl ov07_02231FE4
	ldr r0, [r4, #8]
	movs r1, #0
	bl ov07_0221C4E8
	movs r1, #2
	str r0, [r4, #0x20]
	bl FUN_0200E0FC
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _0222A8CC @ =0xFFFF1FFF
	ands r2, r1
	lsrs r1, r0, #0xb
	orrs r1, r2
	str r1, [r0]
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r1, #0x3f
	bics r2, r1
	movs r1, #0x1b
	orrs r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	ldr r1, _0222A8D0 @ =0xFFFFC0FF
	ands r2, r1
	movs r1, #0x17
	lsls r1, r1, #8
	orrs r1, r2
	strh r1, [r0]
	ldr r0, [r4, #8]
	movs r1, #1
	bl ov07_0221C4E8
	movs r1, #1
	str r0, [r4, #0x24]
	bl FUN_0200E0FC
	movs r1, #0x10
	str r1, [sp]
	adds r0, r4, #0
	movs r2, #2
	str r1, [sp, #4]
	adds r0, #0x2c
	adds r3, r2, #0
	bl ov07_02222AC4
	ldr r0, [r4, #8]
	movs r1, #2
	bl ov07_0221EB98
	movs r0, #2
	movs r1, #1
	bl FUN_0201BC28
	ldr r0, [r4, #8]
	ldr r1, _0222A8D4 @ =ov07_0222A710
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0222A8CC: .4byte 0xFFFF1FFF
_0222A8D0: .4byte 0xFFFFC0FF
_0222A8D4: .4byte ov07_0222A710
	thumb_func_end ov07_0222A838

	thumb_func_start ov07_0222A8D8
ov07_0222A8D8: @ 0x0222A8D8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200DCFC
	cmp r0, #1
	bne _0222A8EA
	adds r0, r4, #0
	bl FUN_0200DC18
_0222A8EA:
	pop {r4, pc}
	thumb_func_end ov07_0222A8D8

	thumb_func_start ov07_0222A8EC
ov07_0222A8EC: @ 0x0222A8EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp, #4]
	str r0, [sp]
	ldr r0, [sp, #4]
	movs r1, #0x1c
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _0222A910
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x30]
	bl ov07_0222A8D8
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x34]
	bl ov07_0222A8D8
	b _0222A916
_0222A910:
	subs r1, r0, #1
	ldr r0, [sp, #4]
	strh r1, [r0, #0x1c]
_0222A916:
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x28]
	bl ov07_0222A8D8
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x2c]
	bl ov07_0222A8D8
	ldr r4, [sp, #4]
	movs r6, #0
	adds r7, r6, #0
	adds r5, r4, #0
_0222A92E:
	movs r0, #0x1e
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #0x1e]
	movs r0, #0x1e
	ldrsh r0, [r4, r0]
	cmp r0, #0x28
	blt _0222A948
	ldr r0, [r5, #0x28]
	movs r1, #0
	bl FUN_0200DCE8
	adds r6, r6, #1
_0222A948:
	adds r7, r7, #1
	adds r4, r4, #2
	adds r5, r5, #4
	cmp r7, #4
	blt _0222A92E
	cmp r6, #4
	bne _0222A97C
	ldr r4, [sp, #4]
	movs r5, #0
_0222A95A:
	ldr r0, [r4, #0x28]
	bl FUN_0200D9DC
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #4
	blt _0222A95A
	ldr r0, [sp, #4]
	ldr r1, [sp]
	ldr r0, [r0, #4]
	bl ov07_0221C448
	ldr r0, [sp, #4]
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222A97C:
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x10]
	bl FUN_0200D020
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222A8EC

	thumb_func_start ov07_0222A988
ov07_0222A988: @ 0x0222A988
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	movs r1, #0x38
	adds r5, r0, #0
	adds r4, r3, #0
	bl ov07_022324D8
	adds r6, r0, #0
	movs r0, #0xa
	strh r0, [r6, #0x1c]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_02231FE4
	ldr r1, [r6, #4]
	add r0, sp, #0
	bl ov07_0221F9E8
	str r4, [r6, #0x28]
	movs r0, #0
	strh r0, [r6, #0x1e]
	movs r7, #1
	adds r4, r6, #2
	adds r5, r6, #4
_0222A9B8:
	movs r0, #0
	strh r0, [r4, #0x1e]
	ldr r0, [r6, #8]
	ldr r1, [r6, #0x10]
	add r2, sp, #0
	bl FUN_0200D734
	str r0, [r5, #0x28]
	adds r7, r7, #1
	adds r4, r4, #2
	adds r5, r5, #4
	cmp r7, #4
	blt _0222A9B8
	ldr r0, [r6, #0x28]
	movs r1, #1
	bl FUN_0200E0C0
	ldr r0, [r6, #0x2c]
	movs r1, #1
	bl FUN_0200E0C0
	movs r1, #0x1f
	ldr r0, [r6, #0x28]
	mvns r1, r1
	movs r2, #0
	bl FUN_0200DED0
	movs r1, #0x1f
	ldr r0, [r6, #0x2c]
	mvns r1, r1
	movs r2, #0x20
	bl FUN_0200DED0
	ldr r0, [r6, #0x30]
	movs r1, #0x20
	movs r2, #0
	bl FUN_0200DED0
	movs r1, #0x20
	ldr r0, [r6, #0x34]
	adds r2, r1, #0
	bl FUN_0200DED0
	ldr r0, [r6, #4]
	ldr r1, _0222AA1C @ =ov07_0222A8EC
	adds r2, r6, #0
	bl ov07_0221C410
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222AA1C: .4byte ov07_0222A8EC
	thumb_func_end ov07_0222A988

	thumb_func_start ov07_0222AA20
ov07_0222AA20: @ 0x0222AA20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r1, #0
	movs r4, #0
	str r0, [sp, #0x1c]
	str r4, [sp, #0x20]
	adds r6, r5, #0
	adds r7, r5, #0
_0222AA30:
	movs r0, #0x22
	ldrsh r0, [r6, r0]
	adds r0, r0, #1
	strh r0, [r6, #0x22]
	movs r0, #0x22
	ldrsh r0, [r6, r0]
	cmp r0, #0x14
	blt _0222AA82
	ldr r0, [r7, #0x2c]
	bl ov07_0222A8D8
	movs r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x6e
	bne _0222AA82
	movs r1, #0
	mvns r1, r1
	ldr r0, [r5, #4]
	adds r2, r1, #0
	bl ov07_02231E08
	ldr r0, [r5, #0x2c]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r5, #0x30]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r5, #0x38]
	movs r1, #1
	bl FUN_0200E0FC
	movs r0, #0xf
	str r0, [r5, #0x54]
	movs r0, #0
	str r0, [r5, #0x58]
_0222AA82:
	adds r4, r4, #1
	adds r6, r6, #2
	adds r7, r7, #4
	cmp r4, #4
	blt _0222AA30
	movs r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x32
	bne _0222AAC6
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	adds r1, r0, #0
	movs r0, #0x10
	str r0, [sp]
	subs r0, #0x12
	str r0, [sp, #4]
	movs r2, #2
	str r2, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _0222ACA0 @ =0x0000FFFF
	str r0, [sp, #0x14]
	ldr r0, _0222ACA4 @ =0x000003EA
	str r0, [sp, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	lsls r3, r3, #0x14
	lsrs r3, r3, #0x10
	bl ov07_02222F10
	str r0, [r5, #0x3c]
_0222AAC6:
	movs r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x3c
	bne _0222AB00
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	adds r1, r0, #0
	movs r0, #0x10
	str r0, [sp]
	subs r0, #0x12
	str r0, [sp, #4]
	movs r2, #2
	str r2, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, _0222ACA0 @ =0x0000FFFF
	str r0, [sp, #0x14]
	ldr r0, _0222ACA4 @ =0x000003EA
	str r0, [sp, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	lsls r3, r3, #0x14
	lsrs r3, r3, #0x10
	bl ov07_02222F10
	str r0, [r5, #0x40]
_0222AB00:
	movs r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x46
	bne _0222AB3A
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	adds r1, r0, #0
	movs r0, #0x10
	str r0, [sp]
	subs r0, #0x12
	str r0, [sp, #4]
	movs r2, #2
	str r2, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _0222ACA0 @ =0x0000FFFF
	str r0, [sp, #0x14]
	ldr r0, _0222ACA4 @ =0x000003EA
	str r0, [sp, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	lsls r3, r3, #0x14
	lsrs r3, r3, #0x10
	bl ov07_02222F10
	str r0, [r5, #0x44]
_0222AB3A:
	movs r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x50
	bne _0222AB74
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	adds r1, r0, #0
	movs r0, #0x10
	str r0, [sp]
	subs r0, #0x12
	str r0, [sp, #4]
	movs r2, #2
	str r2, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, _0222ACA0 @ =0x0000FFFF
	str r0, [sp, #0x14]
	ldr r0, _0222ACA4 @ =0x000003EA
	str r0, [sp, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	lsls r3, r3, #0x14
	lsrs r3, r3, #0x10
	bl ov07_02222F10
	str r0, [r5, #0x48]
_0222AB74:
	movs r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x5a
	bne _0222ABAE
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	adds r1, r0, #0
	movs r0, #0x10
	str r0, [sp]
	subs r0, #0x12
	str r0, [sp, #4]
	movs r2, #2
	str r2, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _0222ACA0 @ =0x0000FFFF
	str r0, [sp, #0x14]
	ldr r0, _0222ACA4 @ =0x000003EA
	str r0, [sp, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	lsls r3, r3, #0x14
	lsrs r3, r3, #0x10
	bl ov07_02222F10
	str r0, [r5, #0x4c]
_0222ABAE:
	movs r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x64
	bne _0222ABE8
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	adds r1, r0, #0
	movs r0, #0x10
	str r0, [sp]
	subs r0, #0x12
	str r0, [sp, #4]
	movs r2, #2
	str r2, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, _0222ACA0 @ =0x0000FFFF
	str r0, [sp, #0x14]
	ldr r0, _0222ACA4 @ =0x000003EA
	str r0, [sp, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	lsls r3, r3, #0x14
	lsrs r3, r3, #0x10
	bl ov07_02222F10
	str r0, [r5, #0x50]
_0222ABE8:
	movs r1, #0x22
	ldrsh r0, [r5, r1]
	cmp r0, #0x6e
	bne _0222AC22
	subs r1, #0x23
	ldr r0, [r5, #4]
	adds r2, r1, #0
	bl ov07_02231E08
	ldr r0, [r5, #0x2c]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r5, #0x30]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r5, #0x38]
	movs r1, #1
	bl FUN_0200E0FC
	movs r0, #0xf
	str r0, [r5, #0x54]
	movs r0, #0
	str r0, [r5, #0x58]
_0222AC22:
	movs r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x6e
	blt _0222AC5A
	ldr r0, [r5, #0x54]
	cmp r0, #0
	ble _0222AC34
	subs r0, r0, #1
	str r0, [r5, #0x54]
_0222AC34:
	ldr r0, [r5, #0x58]
	cmp r0, #0xf
	bge _0222AC3E
	adds r0, r0, #1
	str r0, [r5, #0x58]
_0222AC3E:
	ldr r0, [r5, #0x58]
	ldr r1, [r5, #0x54]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0222ACA8 @ =0x04000052
	strh r1, [r0]
	ldr r0, [r5, #0x54]
	cmp r0, #0
	bne _0222AC5A
	ldr r0, [r5, #0x58]
	cmp r0, #0xf
	bne _0222AC5A
	movs r0, #4
	str r0, [sp, #0x20]
_0222AC5A:
	ldr r0, [sp, #0x20]
	cmp r0, #4
	bne _0222AC96
	movs r6, #0
	adds r4, r5, #0
_0222AC64:
	ldr r0, [r4, #0x2c]
	bl FUN_0200D9DC
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _0222AC64
	movs r6, #0
	adds r4, r5, #0
_0222AC76:
	ldr r0, [r4, #0x3c]
	bl ov07_02222EF8
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #6
	blt _0222AC76
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x1c]
	bl ov07_0221C448
	adds r0, r5, #0
	bl FUN_0201AB0C
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0222AC96:
	ldr r0, [r5, #0x10]
	bl FUN_0200D020
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222ACA0: .4byte 0x0000FFFF
_0222ACA4: .4byte 0x000003EA
_0222ACA8: .4byte 0x04000052
	thumb_func_end ov07_0222AA20

	thumb_func_start ov07_0222ACAC
ov07_0222ACAC: @ 0x0222ACAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	movs r1, #0x5c
	str r0, [sp]
	adds r5, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	movs r0, #0xa
	strh r0, [r4, #0x20]
	ldr r0, [sp]
	adds r1, r4, #0
	bl ov07_02231FE4
	ldr r1, [r4, #4]
	add r0, sp, #0xc
	bl ov07_0221F9E8
	str r5, [r4, #0x2c]
	movs r0, #0
	strh r0, [r4, #0x22]
	movs r0, #1
	str r0, [sp, #8]
	movs r7, #5
	adds r6, r4, #2
	adds r5, r4, #4
_0222ACE0:
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r2, r0, #0x1e
	subs r2, r2, r1
	movs r0, #0x1e
	rors r2, r0
	adds r0, r1, r2
	adds r0, r7, r0
	strh r0, [r6, #0x22]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	add r2, sp, #0xc
	bl FUN_0200D734
	str r0, [r5, #0x2c]
	ldr r0, [sp, #8]
	adds r7, r7, #5
	adds r0, r0, #1
	adds r6, r6, #2
	adds r5, r5, #4
	str r0, [sp, #8]
	cmp r0, #4
	blt _0222ACE0
	ldr r0, [r4, #0x30]
	movs r1, #1
	bl FUN_0200E0C0
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl FUN_0200E0C0
	ldr r0, [sp]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [sp]
	bl ov07_0221FA48
	movs r1, #0
	adds r5, r0, #0
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02008A78
	adds r0, r5, #0
	movs r1, #0x29
	bl FUN_02008A78
	ldr r0, [sp]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [sp]
	bl ov07_0223192C
	cmp r0, #3
	bne _0222AD62
	movs r7, #0x8c
	b _0222AD64
_0222AD62:
	movs r7, #0x54
_0222AD64:
	movs r6, #0
	adds r5, r4, #0
_0222AD68:
	ldr r0, [r5, #0x2c]
	ldr r1, [sp, #4]
	adds r2, r7, #0
	bl FUN_0200DDB8
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #4
	blt _0222AD68
	ldr r0, [sp]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [sp]
	bl ov07_0223192C
	cmp r0, #3
	ldr r0, [r4, #0x2c]
	bne _0222ADAE
	movs r1, #0xa
	bl FUN_0200DD68
	ldr r0, [r4, #0x34]
	movs r1, #0xa
	bl FUN_0200DD68
	ldr r0, [r4, #0x30]
	movs r1, #0x12
	bl FUN_0200DD68
	ldr r0, [r4, #0x38]
	movs r1, #0x12
	bl FUN_0200DD68
	b _0222ADCC
_0222ADAE:
	movs r1, #0x12
	bl FUN_0200DD68
	ldr r0, [r4, #0x34]
	movs r1, #0x12
	bl FUN_0200DD68
	ldr r0, [r4, #0x30]
	movs r1, #0xa
	bl FUN_0200DD68
	ldr r0, [r4, #0x38]
	movs r1, #0xa
	bl FUN_0200DD68
_0222ADCC:
	movs r1, #0x1f
	ldr r0, [r4, #0x2c]
	mvns r1, r1
	movs r2, #0
	bl FUN_0200DED0
	movs r1, #0x27
	ldr r0, [r4, #0x38]
	mvns r1, r1
	movs r2, #4
	bl FUN_0200DED0
	ldr r0, [r4, #0x34]
	movs r1, #0x20
	movs r2, #0
	bl FUN_0200DED0
	ldr r0, [r4, #0x30]
	movs r1, #0x28
	movs r2, #4
	bl FUN_0200DED0
	ldr r0, [r4, #0x2c]
	bl FUN_0200DD30
	str r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	ldr r1, _0222AE10 @ =ov07_0222AA20
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222AE10: .4byte ov07_0222AA20
	thumb_func_end ov07_0222ACAC

	thumb_func_start ov07_0222AE14
ov07_0222AE14: @ 0x0222AE14
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0222AE9A
	adds r0, r4, #0
	adds r0, #0x60
	bl ov07_0222260C
	cmp r0, #0
	bne _0222AE58
	ldr r0, [r4, #0x28]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x3c]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x3c]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl ov07_02232508
	add sp, #0xc
	pop {r4, r5, pc}
_0222AE58:
	adds r0, r4, #0
	adds r0, #0x60
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x28]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	bl FUN_0200E024
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	movs r2, #0x5a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x28]
	ldr r3, [r4, #0x74]
	bl ov07_022226FC
	ldr r0, [r4, #0x28]
	bl FUN_0200DC18
	ldr r0, [r4, #0x3c]
	bl FUN_0200DC18
	ldr r0, [r4, #0x50]
	bl FUN_0200DC18
	ldr r0, [r4, #0xc]
	bl FUN_0200D020
_0222AE9A:
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0222AE14

	thumb_func_start ov07_0222AEA0
ov07_0222AEA0: @ 0x0222AEA0
	push {r4, r5, lr}
	sub sp, #0xc
	movs r1, #0x84
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	ldr r0, [r4, #4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	movs r1, #1
	str r0, [r4, #0x24]
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0x58
	strh r0, [r1]
	movs r0, #0x58
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x5c
	strh r1, [r0]
	ldr r0, [r4, #4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FAA0
	adds r1, r4, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x28]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x3c]
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221C4E8
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x28]
	movs r1, #2
	bl FUN_0200DF98
	adds r0, r5, #0
	bl ov07_0221FAE8
	adds r1, r0, #0
	ldr r0, [r4, #0x28]
	bl FUN_0200DD54
	adds r0, r5, #0
	bl ov07_0221FAE8
	adds r1, r0, #0
	ldr r0, [r4, #0x3c]
	bl FUN_0200DD54
	adds r0, r5, #0
	bl ov07_0221FAE8
	adds r1, r0, #0
	ldr r0, [r4, #0x50]
	bl FUN_0200DD54
	ldr r0, [r4, #4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA04
	subs r0, r0, #3
	cmp r0, #1
	ldr r0, [r4, #0x28]
	bhi _0222AF6E
	movs r1, #0x1e
	bl FUN_0200DD68
	ldr r0, [r4, #0x3c]
	movs r1, #0x32
	bl FUN_0200DD68
	ldr r0, [r4, #0x50]
	movs r1, #0x46
	bl FUN_0200DD68
	b _0222AF84
_0222AF6E:
	movs r1, #0x3c
	bl FUN_0200DD68
	ldr r0, [r4, #0x3c]
	movs r1, #0x46
	bl FUN_0200DD68
	ldr r0, [r4, #0x50]
	movs r1, #0x32
	bl FUN_0200DD68
_0222AF84:
	movs r2, #0x14
	movs r1, #0x64
	str r2, [sp]
	str r1, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x60
	adds r3, r1, #0
	bl ov07_02222590
	ldr r0, [r4, #4]
	ldr r1, _0222AFA8 @ =ov07_0222AE14
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0222AFA8: .4byte ov07_0222AE14
	thumb_func_end ov07_0222AEA0

	thumb_func_start ov07_0222AFAC
ov07_0222AFAC: @ 0x0222AFAC
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0222AFC0
	cmp r0, #1
	beq _0222B0BE
	b _0222B10C
_0222AFC0:
	adds r0, r4, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222B03A
	movs r0, #0x22
	ldrsh r3, [r4, r0]
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	movs r0, #3
	adds r2, r1, #0
	str r3, [sp]
	adds r2, #0x30
	str r0, [sp, #4]
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x34
	asrs r2, r2, #0x10
	bl ov07_02222268
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	movs r0, #0xa4
	ldrsh r0, [r4, r0]
	adds r2, r1, r0
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	lsls r0, r2, #0x10
	asrs r3, r0, #0x10
	adds r2, r1, #0
	adds r2, #0x30
	lsls r2, r2, #0x10
	str r3, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x58
	asrs r2, r2, #0x10
	bl ov07_02222268
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	movs r0, #0xa4
	ldrsh r0, [r4, r0]
	adds r2, r1, r0
	movs r0, #0x20
	ldrsh r1, [r4, r0]
	lsls r0, r2, #0x10
	asrs r3, r0, #0x10
	adds r2, r1, #0
	adds r2, #0x30
	lsls r2, r2, #0x10
	str r3, [sp]
	movs r0, #8
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x7c
	asrs r2, r2, #0x10
	bl ov07_02222268
	b _0222B0A8
_0222B03A:
	movs r0, #0x22
	ldrsh r3, [r4, r0]
	movs r0, #0x20
	ldrsh r2, [r4, r0]
	movs r0, #3
	adds r1, r2, #0
	str r3, [sp]
	adds r1, #0x30
	str r0, [sp, #4]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	adds r0, #0x34
	asrs r1, r1, #0x10
	bl ov07_02222268
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	movs r0, #0xa4
	ldrsh r0, [r4, r0]
	adds r1, r1, r0
	movs r0, #0x20
	ldrsh r2, [r4, r0]
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	adds r1, r2, #0
	adds r1, #0x30
	lsls r1, r1, #0x10
	str r3, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x58
	asrs r1, r1, #0x10
	bl ov07_02222268
	movs r0, #0x22
	ldrsh r1, [r4, r0]
	movs r0, #0xa4
	ldrsh r0, [r4, r0]
	adds r1, r1, r0
	movs r0, #0x20
	ldrsh r2, [r4, r0]
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	adds r1, r2, #0
	adds r1, #0x30
	lsls r1, r1, #0x10
	str r3, [sp]
	movs r0, #9
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x7c
	asrs r1, r1, #0x10
	bl ov07_02222268
_0222B0A8:
	adds r0, r4, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xa0
	strb r1, [r0]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0222B11E
_0222B0BE:
	adds r0, r4, #0
	ldr r1, [r4, #0x28]
	adds r0, #0x58
	movs r5, #0
	bl ov07_022222F0
	cmp r0, #0
	bne _0222B0D0
	adds r5, r5, #1
_0222B0D0:
	adds r0, r4, #0
	ldr r1, [r4, #0x24]
	adds r0, #0x34
	bl ov07_02222314
	cmp r0, #0
	bne _0222B0E0
	adds r5, r5, #1
_0222B0E0:
	adds r0, r4, #0
	ldr r1, [r4, #0x30]
	adds r0, #0x7c
	bl ov07_022222F0
	cmp r0, #0
	bne _0222B0F0
	adds r5, r5, #1
_0222B0F0:
	cmp r5, #3
	blt _0222B11E
	adds r0, r4, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #1
	ldrb r0, [r4]
	bne _0222B106
	subs r0, r0, #1
	strb r0, [r4]
	b _0222B11E
_0222B106:
	adds r0, r0, #1
	strb r0, [r4]
	b _0222B11E
_0222B10C:
	ldr r0, [r4, #4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl ov07_02232508
	add sp, #8
	pop {r3, r4, r5, pc}
_0222B11E:
	ldr r0, [r4, #0x28]
	bl FUN_0200DC18
	ldr r0, [r4, #0xc]
	bl FUN_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0222AFAC

	thumb_func_start ov07_0222B130
ov07_0222B130: @ 0x0222B130
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	movs r1, #0xa8
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xa1
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #8
	adds r0, #0xa2
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xa3
	strb r1, [r0]
	subs r1, #9
	ldr r0, [r4, #4]
	adds r2, r1, #0
	bl ov07_02231E08
	adds r0, r4, #0
	adds r0, #0xa2
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xa3
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0222B2A0 @ =0x04000052
	strh r1, [r0]
	ldr r0, [r4, #4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0x24]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0x20]
	ldr r0, [r4, #0x24]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0x22]
	ldr r0, [r4, #4]
	movs r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x28]
	ldr r0, [r4, #4]
	movs r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x24]
	movs r1, #0x29
	bl FUN_02008A78
	rsbs r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xa4
	strh r1, [r0]
	ldr r0, [r4, #4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA80
	adds r7, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA90
	str r0, [sp, #0x18]
	ldr r0, [r4, #4]
	ldr r5, [r4, #0x28]
	bl ov07_0221FAE8
	adds r1, r0, #0
	adds r0, r5, #0
	adds r1, r1, #1
	bl FUN_0200DD54
	ldr r0, [r5]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	adds r6, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA78
	str r0, [sp, #0x1c]
	ldr r0, [r4, #4]
	bl ov07_0221BFD0
	adds r3, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	lsls r0, r6, #0x14
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xc4
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	adds r2, r7, #0
	bl FUN_02003FC8
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #4]
	ldr r5, [r4, #0x30]
	bl ov07_0221FAE8
	adds r1, r0, #0
	adds r0, r5, #0
	adds r1, r1, #1
	bl FUN_0200DD54
	ldr r0, [r5]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	adds r6, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA78
	str r0, [sp, #0x20]
	ldr r0, [r4, #4]
	bl ov07_0221BFD0
	adds r3, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	lsls r0, r6, #0x14
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xc4
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	adds r2, r7, #0
	bl FUN_02003FC8
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #4]
	ldr r1, _0222B2A4 @ =ov07_0222AFAC
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0222B2A0: .4byte 0x04000052
_0222B2A4: .4byte ov07_0222AFAC
	thumb_func_end ov07_0222B130

	thumb_func_start ov07_0222B2A8
ov07_0222B2A8: @ 0x0222B2A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r6, #0
	str r0, [sp]
	str r1, [sp, #4]
	adds r7, r6, #0
	adds r4, r1, #0
	adds r5, r1, #0
_0222B2B8:
	movs r0, #0x1e
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #0x1e]
	movs r0, #0x1e
	ldrsh r0, [r4, r0]
	cmp r0, #0x20
	blt _0222B2E0
	ldr r0, [r5, #0x30]
	bl ov07_0222A8D8
	movs r0, #0x1e
	ldrsh r0, [r4, r0]
	cmp r0, #0xa0
	blt _0222B2E0
	ldr r0, [r5, #0x30]
	movs r1, #0
	bl FUN_0200DCE8
	adds r6, r6, #1
_0222B2E0:
	adds r7, r7, #1
	adds r4, r4, #2
	adds r5, r5, #4
	cmp r7, #8
	blt _0222B2B8
	cmp r6, #8
	bne _0222B314
	ldr r4, [sp, #4]
	movs r5, #0
_0222B2F2:
	ldr r0, [r4, #0x30]
	bl FUN_0200D9DC
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #8
	blt _0222B2F2
	ldr r0, [sp, #4]
	ldr r1, [sp]
	ldr r0, [r0, #4]
	bl ov07_0221C448
	ldr r0, [sp, #4]
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222B314:
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x10]
	bl FUN_0200D020
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222B2A8

	thumb_func_start ov07_0222B320
ov07_0222B320: @ 0x0222B320
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	movs r1, #0x74
	adds r6, r0, #0
	adds r5, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	movs r0, #0xa
	strh r0, [r4, #0x1c]
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	ldr r1, [r4, #4]
	add r0, sp, #0x24
	bl ov07_0221F9E8
	str r5, [r4, #0x30]
	movs r6, #1
	adds r5, r4, #4
	movs r7, #0x1f
_0222B34C:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	add r2, sp, #0x24
	bl FUN_0200D734
	str r0, [r5, #0x30]
	lsrs r1, r6, #0x1f
	lsls r0, r6, #0x1f
	subs r0, r0, r1
	rors r0, r7
	adds r0, r1, r0
	beq _0222B36C
	ldr r0, [r5, #0x30]
	movs r1, #1
	bl FUN_0200E0C0
_0222B36C:
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #8
	blt _0222B34C
	ldr r0, [r4, #4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	movs r1, #0
	adds r5, r0, #0
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldr r0, [r4, #4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	movs r1, #0
	str r0, [sp, #0x1c]
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, [sp, #0x1c]
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x50
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl ov07_02222268
	movs r7, #0
	ldr r0, [r4, #4]
	adds r6, r7, #0
	str r7, [sp, #0x14]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0223192C
	cmp r0, #4
	bne _0222B3F0
	movs r0, #1
	str r0, [sp, #0x14]
_0222B3F0:
	adds r0, r4, #0
	str r0, [sp, #0x20]
	adds r0, #0x50
	adds r5, r4, #0
	str r0, [sp, #0x20]
_0222B3FA:
	ldr r0, [sp, #0x20]
	bl ov07_022222B4
	str r0, [sp, #0x18]
	lsrs r2, r7, #0x1f
	lsls r1, r7, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	beq _0222B432
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0222B42E
	cmp r6, #8
	bge _0222B432
	movs r1, #0x50
	movs r2, #0x52
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #0x30]
	bl FUN_0200DDB8
	adds r5, r5, #4
	adds r6, r6, #1
	b _0222B432
_0222B42E:
	movs r0, #0
	str r0, [sp, #0x14]
_0222B432:
	ldr r0, [sp, #0x18]
	adds r7, r7, #1
	cmp r0, #1
	beq _0222B3FA
	ldr r0, [r4, #4]
	movs r1, #1
	bl ov07_0221FB04
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	movs r1, #2
	bl ov07_0221FB04
	adds r7, r0, #0
	movs r6, #0
	str r4, [sp, #0xc]
	adds r5, r4, #0
_0222B454:
	movs r0, #8
	subs r0, r0, r6
	str r0, [sp, #8]
	lsls r1, r0, #2
	ldr r0, [sp, #0xc]
	strh r1, [r0, #0x1e]
	ldr r0, [r4, #4]
	bl ov07_0221BFC0
	cmp r0, #0
	bne _0222B4B0
	ldr r0, [r4, #4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0223192C
	cmp r0, #3
	bne _0222B492
	cmp r6, #4
	ldr r0, [r5, #0x30]
	bge _0222B48A
	adds r1, r7, #0
	bl FUN_0200DD54
	b _0222B4A6
_0222B48A:
	ldr r1, [sp, #0x10]
	bl FUN_0200DD54
	b _0222B4A6
_0222B492:
	cmp r6, #4
	ldr r0, [r5, #0x30]
	blt _0222B4A0
	adds r1, r7, #0
	bl FUN_0200DD54
	b _0222B4A6
_0222B4A0:
	ldr r1, [sp, #0x10]
	bl FUN_0200DD54
_0222B4A6:
	ldr r0, [r5, #0x30]
	ldr r1, [sp, #8]
	bl FUN_0200DD68
	b _0222B4C0
_0222B4B0:
	ldr r0, [r5, #0x30]
	adds r1, r6, #0
	bl FUN_0200DD68
	ldr r0, [r5, #0x30]
	adds r1, r7, #0
	bl FUN_0200DD54
_0222B4C0:
	ldr r0, [sp, #0xc]
	adds r6, r6, #1
	adds r0, r0, #2
	adds r5, r5, #4
	str r0, [sp, #0xc]
	cmp r6, #8
	blt _0222B454
	ldr r0, [r4, #4]
	ldr r1, _0222B4DC @ =ov07_0222B2A8
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222B4DC: .4byte ov07_0222B2A8
	thumb_func_end ov07_0222B320

	thumb_func_start ov07_0222B4E0
ov07_0222B4E0: @ 0x0222B4E0
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r1, #0
	adds r4, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0222B4F6
	cmp r0, #1
	beq _0222B584
	cmp r0, #2
	b _0222B5E2
_0222B4F6:
	ldr r0, [r5, #0x28]
	cmp r0, #0xe
	ble _0222B54C
	ldr r0, [r5, #0x30]
	ldr r1, _0222B628 @ =0x3E4CCCCD
	blx FUN_020F24C8
	str r0, [r5, #0x30]
	ldr r0, [r5, #0x2c]
	ldr r1, _0222B628 @ =0x3E4CCCCD
	blx FUN_020F1520
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	blx FUN_020F2080
	ldr r2, _0222B62C @ =0x9999999A
	ldr r3, _0222B630 @ =0x3FC99999
	blx FUN_020F1874
	bhi _0222B530
	ldrb r0, [r5]
	movs r1, #0
	adds r0, r0, #1
	strb r0, [r5]
	ldr r0, [r5, #0x1c]
	bl FUN_0200DCE8
	b _0222B60A
_0222B530:
	movs r0, #0x36
	ldrsb r0, [r5, r0]
	blx FUN_020F2178
	adds r1, r0, #0
	ldr r0, [r5, #0x2c]
	blx FUN_020F22DC
	adds r1, r0, #0
	ldr r0, [r5, #0x1c]
	ldr r2, [r5, #0x30]
	bl FUN_0200E024
	b _0222B60A
_0222B54C:
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x34
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	subs r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x35
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0222B634 @ =0x04000052
	strh r1, [r0]
	ldr r0, [r5, #0x28]
	adds r0, r0, #1
	str r0, [r5, #0x28]
	b _0222B60A
_0222B584:
	ldr r0, [r5, #0x3c]
	bl ov07_02222EE8
	cmp r0, #0
	bne _0222B60A
	ldr r0, [r5, #0x38]
	bl ov07_02222EF8
	ldr r0, [r5, #0x3c]
	bl ov07_02222EF8
	ldr r0, [r5, #0x24]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	adds r4, r0, #0
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	adds r1, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r2, #0
	lsls r3, r4, #0x14
	str r2, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, _0222B638 @ =0x0000FFFF
	movs r2, #2
	str r0, [sp, #0x14]
	ldr r0, _0222B63C @ =0x0000044C
	lsrs r3, r3, #0x10
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x18]
	bl ov07_02222F10
	str r0, [r5, #0x3c]
	ldrb r0, [r5]
	adds r0, r0, #1
	strb r0, [r5]
	b _0222B60A
_0222B5E2:
	ldr r0, [r5, #0x3c]
	bl ov07_02222EE8
	cmp r0, #0
	bne _0222B60A
	ldr r0, [r5, #0x20]
	bl FUN_0200DC18
	ldr r0, [r5, #0x3c]
	bl ov07_02222EF8
	ldr r0, [r5, #4]
	adds r1, r4, #0
	bl ov07_0221C448
	adds r0, r5, #0
	bl FUN_0201AB0C
	add sp, #0x1c
	pop {r4, r5, pc}
_0222B60A:
	ldr r0, [r5, #0x1c]
	bl FUN_0200DC18
	ldr r0, [r5, #0x20]
	bl FUN_0200DC18
	ldr r0, [r5, #0x24]
	bl FUN_0200DC18
	ldr r0, [r5, #0xc]
	bl FUN_0200D020
	add sp, #0x1c
	pop {r4, r5, pc}
	nop
_0222B628: .4byte 0x3E4CCCCD
_0222B62C: .4byte 0x9999999A
_0222B630: .4byte 0x3FC99999
_0222B634: .4byte 0x04000052
_0222B638: .4byte 0x0000FFFF
_0222B63C: .4byte 0x0000044C
	thumb_func_end ov07_0222B4E0

	thumb_func_start ov07_0222B640
ov07_0222B640: @ 0x0222B640
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	movs r1, #0x40
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	ldr r0, [r4, #4]
	movs r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	movs r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x20]
	ldr r0, [r4, #4]
	movs r1, #2
	bl ov07_0221C4E8
	str r0, [r4, #0x24]
	movs r6, #0
	str r6, [r4, #0x28]
	adds r0, r5, #0
	subs r6, #0x20
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_02222004
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r6, r0
	adds r6, r0, #0
	movs r0, #0xfe
	lsls r0, r0, #0x16
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221FB78
	cmp r0, #1
	bne _0222B6AA
	movs r1, #0
	mvns r1, r1
	b _0222B6AC
_0222B6AA:
	movs r1, #1
_0222B6AC:
	adds r0, r4, #0
	adds r0, #0x36
	strb r1, [r0]
	add r1, sp, #0x24
	ldr r0, [r4, #0x20]
	adds r1, #2
	add r2, sp, #0x24
	bl FUN_0200DE44
	add r2, sp, #0x24
	movs r1, #2
	ldrsh r1, [r2, r1]
	movs r3, #0
	ldrsh r2, [r2, r3]
	adds r1, r1, r6
	lsls r1, r1, #0x10
	ldr r0, [r4, #0x1c]
	asrs r1, r1, #0x10
	bl FUN_0200DDB8
	ldr r0, [r4, #0x1c]
	movs r1, #2
	bl FUN_0200DF98
	movs r0, #0x36
	ldrsb r0, [r4, r0]
	blx FUN_020F2178
	adds r1, r0, #0
	ldr r0, [r4, #0x2c]
	blx FUN_020F22DC
	adds r1, r0, #0
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x30]
	bl FUN_0200E024
	ldr r0, [r4, #0x1c]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov07_0221BFD0
	adds r1, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r2, #0
	lsls r3, r6, #0x14
	str r2, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	ldr r0, _0222B888 @ =0x0000FFFF
	movs r2, #2
	str r0, [sp, #0x14]
	ldr r0, _0222B88C @ =0x0000044C
	lsrs r3, r3, #0x10
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x18]
	bl ov07_02222F10
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x24]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov07_0221BFD0
	adds r1, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r2, #0
	lsls r3, r6, #0x14
	str r2, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	ldr r0, _0222B888 @ =0x0000FFFF
	movs r2, #2
	str r0, [sp, #0x14]
	ldr r0, _0222B88C @ =0x0000044C
	lsrs r3, r3, #0x10
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x18]
	bl ov07_02222F10
	str r0, [r4, #0x3c]
	ldr r0, [r4, #4]
	bl ov07_0221C468
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r4, #4]
	adds r1, r6, #0
	bl ov07_02231924
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r4, #4]
	bl ov07_0221BFC0
	adds r1, r0, #0
	adds r0, r5, #0
	add r2, sp, #0x2c
	bl ov07_02231A20
	add r2, sp, #0x28
	ldr r0, [r4, #0x1c]
	add r1, sp, #0x28
	adds r2, #2
	bl FUN_0200DE44
	ldr r0, [r4, #4]
	adds r1, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _0222B7C8
	ldr r0, [r4, #0x1c]
	movs r1, #1
	movs r5, #0
	bl FUN_0200DD54
	ldr r0, [r4, #0x1c]
	adds r1, r5, #0
	bl FUN_0200DD68
	b _0222B7DA
_0222B7C8:
	ldr r0, [r4, #0x1c]
	movs r1, #2
	bl FUN_0200DD54
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_0200DD68
	movs r5, #2
_0222B7DA:
	ldr r0, [r4, #4]
	bl ov07_0221C470
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r4, #4]
	adds r1, r6, #0
	bl ov07_0221FA1C
	adds r7, r0, #0
	ldr r0, [r4, #4]
	adds r1, r6, #0
	bl ov07_0221FA10
	str r0, [sp, #0x1c]
	ldr r0, [r4, #4]
	adds r1, r6, #0
	bl ov07_0221FA2C
	str r0, [sp, #0x20]
	ldr r0, [r4, #4]
	adds r1, r6, #0
	bl ov07_0221FA38
	ldr r1, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	lsls r0, r7, #0x10
	lsls r1, r1, #0x18
	lsls r2, r5, #0x18
	lsls r3, r3, #0x18
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_020708D8
	adds r2, r0, #0
	add r5, sp, #0x24
	movs r3, #0xa
	ldrsh r3, [r5, r3]
	movs r1, #4
	ldrsh r1, [r5, r1]
	adds r2, r3, r2
	lsls r2, r2, #0x10
	ldr r0, [r4, #0x1c]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r0, [r4, #0x1c]
	movs r1, #1
	bl FUN_0200DCE8
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x34
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0xf
	adds r0, #0x35
	strb r1, [r0]
	subs r1, #0x10
	ldr r0, [r4, #4]
	adds r2, r1, #0
	bl ov07_02231E08
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	adds r2, r4, #0
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0222B890 @ =0x04000052
	strh r1, [r0]
	ldr r0, [r4, #4]
	ldr r1, _0222B894 @ =ov07_0222B4E0
	bl ov07_0221C410
	adds r1, r4, #0
	bl ov07_0222B4E0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222B888: .4byte 0x0000FFFF
_0222B88C: .4byte 0x0000044C
_0222B890: .4byte 0x04000052
_0222B894: .4byte ov07_0222B4E0
	thumb_func_end ov07_0222B640

	thumb_func_start ov07_0222B898
ov07_0222B898: @ 0x0222B898
	push {r3, r4, r5, lr}
	sub sp, #0x58
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0222B8AC
	cmp r0, #1
	beq _0222B8F2
	b _0222B96C
_0222B8AC:
	ldr r0, [r4, #0x68]
	movs r1, #0x20
	lsls r0, r0, #2
	adds r2, r4, r0
	ldr r0, [r2, #0x78]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	str r3, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	ldr r2, [r2, #0x6c]
	adds r0, r4, #0
	lsls r2, r2, #0x10
	ldrsh r1, [r4, r1]
	adds r0, #0x30
	asrs r2, r2, #0x10
	bl ov07_02222268
	ldr r2, [r4, #0x68]
	ldr r0, [r4, #0x24]
	lsls r2, r2, #2
	adds r2, r4, r2
	adds r2, #0x84
	ldr r2, [r2]
	movs r1, #2
	bl FUN_020087A4
	ldr r0, [r4, #0x24]
	movs r1, #0x2c
	movs r2, #1
	bl FUN_020087A4
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
_0222B8F2:
	adds r0, r4, #0
	adds r0, #0x30
	bl ov07_022222B4
	cmp r0, #0
	bne _0222B950
	ldr r0, [r4, #0x68]
	adds r0, r0, #1
	str r0, [r4, #0x68]
	cmp r0, #2
	ble _0222B910
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0222B946
_0222B910:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	bne _0222B942
	ldr r0, [r4, #4]
	add r1, sp, #8
	movs r2, #3
	bl ov07_0221C7B8
	ldr r0, [r4, #0x68]
	cmp r0, #2
	ldr r0, [r4, #4]
	bne _0222B936
	bl ov07_0221BFD0
	adds r1, r0, #0
	add r0, sp, #8
	bl ov07_0223494C
	b _0222B942
_0222B936:
	bl ov07_0221BFD0
	adds r1, r0, #0
	add r0, sp, #8
	bl ov07_0223475C
_0222B942:
	movs r0, #0
	strb r0, [r4]
_0222B946:
	ldr r0, [r4, #0x24]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0x20]
_0222B950:
	movs r2, #0x30
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x32
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	movs r1, #1
	bl FUN_020087A4
	add sp, #0x58
	pop {r3, r4, r5, pc}
_0222B96C:
	ldr r0, [r4, #0x24]
	movs r1, #0x2c
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x58
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222B898

	thumb_func_start ov07_0222B988
ov07_0222B988: @ 0x0222B988
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	movs r1, #0x90
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02231FE4
	ldr r0, [r4, #4]
	bl ov07_0221C468
	adds r6, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221C468
	adds r1, r0, #0
	adds r2, r4, #0
	ldr r0, [r4, #4]
	adds r2, #0x5c
	bl ov07_02231A50
	ldr r0, [r4, #4]
	bl ov07_0221C470
	adds r1, r0, #0
	adds r2, r4, #0
	ldr r0, [r4, #4]
	adds r2, #0x60
	bl ov07_02231A50
	ldr r0, [r4, #4]
	adds r1, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _0222B9DA
	movs r1, #1
	b _0222B9DE
_0222B9DA:
	movs r1, #0
	mvns r1, r1
_0222B9DE:
	adds r0, r4, #0
	adds r0, #0x54
	strh r1, [r0]
	ldr r0, [r4, #4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0223192C
	adds r6, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0223192C
	cmp r6, r0
	bne _0222BA0A
	movs r0, #1
	b _0222BA0C
_0222BA0A:
	movs r0, #0
_0222BA0C:
	str r0, [r4, #0x58]
	movs r1, #0
	adds r0, r5, #0
	str r1, [r4, #0x68]
	bl ov07_0221C4A8
	adds r2, r4, #0
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, #0x1c
	add r3, sp, #0
	bl ov07_02232020
	ldr r0, [r4, #0x24]
	movs r1, #1
	bl FUN_02008A78
	movs r1, #0x5e
	ldrsh r2, [r4, r1]
	movs r3, #0x54
	subs r0, r0, r2
	ldrsh r2, [r4, r3]
	cmp r2, #0
	ble _0222BA7E
	adds r2, r3, #0
	adds r2, #0xfb
	str r2, [r4, #0x6c]
	subs r3, #0xa4
	str r3, [r4, #0x70]
	movs r2, #0x5c
	ldrsh r2, [r4, r2]
	str r2, [r4, #0x74]
	ldrsh r2, [r4, r1]
	adds r2, r2, r0
	str r2, [r4, #0x78]
	movs r2, #0x62
	ldrsh r2, [r4, r2]
	adds r2, r2, r0
	str r2, [r4, #0x7c]
	ldrsh r1, [r4, r1]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x80
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #0xa
	adds r0, #0x84
	str r1, [r0]
	adds r0, r4, #0
	ldr r1, _0222BAD4 @ =0xFFFFFD76
	adds r0, #0x88
	str r1, [r0]
	ldr r0, [r4, #0x24]
	movs r1, #2
	bl FUN_02008A78
	b _0222BABE
_0222BA7E:
	adds r2, r3, #0
	subs r2, #0xa4
	str r2, [r4, #0x6c]
	adds r3, #0xfb
	str r3, [r4, #0x70]
	movs r2, #0x5c
	ldrsh r2, [r4, r2]
	str r2, [r4, #0x74]
	ldrsh r2, [r4, r1]
	adds r2, r2, r0
	str r2, [r4, #0x78]
	movs r2, #0x62
	ldrsh r2, [r4, r2]
	adds r2, r2, r0
	str r2, [r4, #0x7c]
	ldrsh r1, [r4, r1]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x80
	str r1, [r0]
	adds r0, r4, #0
	ldr r1, _0222BAD4 @ =0xFFFFFD76
	adds r0, #0x84
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #0xa
	adds r0, #0x88
	str r1, [r0]
	ldr r0, [r4, #0x24]
	movs r1, #2
	bl FUN_02008A78
_0222BABE:
	adds r1, r4, #0
	adds r1, #0x8c
	str r0, [r1]
	ldr r0, [r4, #4]
	ldr r1, _0222BAD8 @ =ov07_0222B898
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0222BAD4: .4byte 0xFFFFFD76
_0222BAD8: .4byte ov07_0222B898
	thumb_func_end ov07_0222B988

	thumb_func_start ov07_0222BADC
ov07_0222BADC: @ 0x0222BADC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r2, #0
	ldr r2, [sp, #0x10]
	str r2, [sp]
	movs r2, #0x50
	subs r2, r2, r3
	adds r3, r4, #0
	bl FUN_0200908C
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_0222BADC

	thumb_func_start ov07_0222BAF4
ov07_0222BAF4: @ 0x0222BAF4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #3
	bls _0222BB08
	b _0222BC2A
_0222BB08:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222BB14: @ jump table
	.2byte _0222BB1C - _0222BB14 - 2 @ case 0
	.2byte _0222BB78 - _0222BB14 - 2 @ case 1
	.2byte _0222BBBA - _0222BB14 - 2 @ case 2
	.2byte _0222BC10 - _0222BB14 - 2 @ case 3
_0222BB1C:
	ldr r2, [r4, #0x10]
	adds r2, #0x4f
	str r2, [r4, #0x10]
	cmp r2, #0x50
	blt _0222BB44
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	add sp, #4
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	ldr r1, [r4, #0x14]
	movs r0, #1
	eors r0, r1
	str r0, [r4, #0x14]
	movs r0, #0
	str r0, [r4, #0x10]
	pop {r3, r4, r5, r6, pc}
_0222BB44:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0222BB60
	movs r0, #2
	str r0, [sp]
	ldr r3, [r4]
	ldr r0, [r4, #0x1c]
	adds r3, r3, #2
	movs r1, #0
	lsls r3, r3, #1
	bl ov07_0222BADC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0222BB60:
	movs r0, #2
	str r0, [sp]
	ldr r3, [r4]
	movs r1, #0x50
	adds r3, r3, #2
	ldr r0, [r4, #0x1c]
	subs r1, r1, r2
	lsls r3, r3, #1
	bl ov07_0222BADC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0222BB78:
	ldr r0, [r4, #4]
	movs r3, #0xff
	subs r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #0xc]
	lsls r3, r3, #8
	adds r2, r0, #1
	str r2, [r4, #0xc]
	ldr r6, [r4, #8]
	ldr r1, [r4, #4]
	lsls r0, r6, #8
	adds r5, r0, #0
	adds r6, #0x50
	lsls r0, r6, #0x18
	ands r5, r3
	lsrs r0, r0, #0x18
	lsls r1, r1, #8
	orrs r5, r0
	ldr r0, _0222BC74 @ =0x04000040
	ands r3, r1
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	strh r5, [r0]
	orrs r1, r3
	strh r1, [r0, #4]
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	adds r4, #0x20
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0222BBBA:
	ldr r0, [r4, #4]
	movs r3, #0xff
	subs r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #0xc]
	lsls r3, r3, #8
	adds r2, r0, #1
	str r2, [r4, #0xc]
	ldr r6, [r4, #8]
	ldr r1, [r4, #4]
	lsls r0, r6, #8
	adds r5, r0, #0
	adds r6, #0x50
	lsls r0, r6, #0x18
	ands r5, r3
	lsrs r0, r0, #0x18
	lsls r1, r1, #8
	orrs r5, r0
	ldr r0, _0222BC74 @ =0x04000040
	ands r3, r1
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	strh r5, [r0]
	orrs r1, r3
	strh r1, [r0, #4]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	cmp r0, #0x26
	ble _0222BC06
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	adds r4, #0x20
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0222BC06:
	movs r0, #0
	adds r4, #0x20
	add sp, #4
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0222BC10:
	ldr r0, [r4, #0x1c]
	movs r1, #0xe
	movs r2, #0
	bl FUN_020087A4
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	adds r4, #0x20
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0222BC2A:
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r3, [r0]
	ldr r1, _0222BC78 @ =0xFFFF1FFF
	ands r1, r3
	adds r3, r0, #0
	str r1, [r0]
	adds r3, #0x48
	ldrh r5, [r3]
	movs r1, #0x3f
	bics r5, r1
	strh r5, [r3]
	adds r3, r0, #0
	adds r3, #0x4a
	ldrh r5, [r3]
	bics r5, r1
	adds r1, r0, #0
	strh r5, [r3]
	movs r3, #0
	adds r1, #0x40
	strh r3, [r1]
	adds r0, #0x44
	strh r3, [r0]
	ldr r0, [r4, #0x24]
	adds r1, r2, #0
	bl ov07_0221C448
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x18]
	movs r1, #0x17
	bl FUN_020087A4
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222BC74: .4byte 0x04000040
_0222BC78: .4byte 0xFFFF1FFF
	thumb_func_end ov07_0222BAF4

	thumb_func_start ov07_0222BC7C
ov07_0222BC7C: @ 0x0222BC7C
	push {r4, r5, r6, lr}
	movs r1, #0x50
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x20
	bl ov07_02231FE4
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0221FA48
	str r0, [r4, #0x1c]
	movs r0, #0
	str r0, [r4]
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_02231924
	cmp r0, #3
	beq _0222BCBC
	cmp r0, #4
	bne _0222BCD0
_0222BCBC:
	adds r0, r5, #0
	bl ov07_0221FAE8
	adds r1, r0, #0
	subs r1, r1, #1
	lsls r1, r1, #0x18
	movs r0, #2
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
_0222BCD0:
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, [r4, #0x1c]
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldr r0, [r4, #0x1c]
	movs r1, #0x29
	bl FUN_02008A78
	subs r0, r5, r0
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldr r0, [r4, #0x1c]
	movs r1, #0x17
	bl FUN_02008A78
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x1c]
	movs r1, #0x17
	movs r2, #8
	bl FUN_020087A4
	subs r6, #0x28
	str r6, [r4, #8]
	adds r5, #0x28
	movs r6, #1
	lsls r6, r6, #0x1a
	adds r3, r6, #0
	str r5, [r4, #4]
	movs r1, #0
	str r1, [r4, #0x10]
	ldr r0, [r4, #4]
	adds r3, #0x48
	str r0, [r4, #0xc]
	str r1, [r4, #0x14]
	ldr r1, [r6]
	ldr r0, _0222BD88 @ =0xFFFF1FFF
	ands r1, r0
	lsrs r0, r6, #0xd
	orrs r0, r1
	str r0, [r6]
	ldrh r2, [r3]
	movs r1, #0x3f
	movs r0, #0x1f
	bics r2, r1
	orrs r0, r2
	movs r2, #0x20
	orrs r0, r2
	strh r0, [r3]
	adds r3, r6, #0
	adds r3, #0x4a
	ldrh r5, [r3]
	movs r0, #0x1b
	bics r5, r1
	orrs r0, r5
	orrs r0, r2
	strh r0, [r3]
	ldr r2, [r4, #8]
	movs r0, #0xff
	lsls r1, r2, #8
	adds r2, #0x50
	lsls r0, r0, #8
	lsls r2, r2, #0x18
	ands r1, r0
	lsrs r2, r2, #0x18
	orrs r2, r1
	adds r1, r6, #0
	ldr r5, [r4, #0xc]
	ldr r3, [r4, #4]
	adds r1, #0x40
	strh r2, [r1]
	lsls r1, r3, #8
	ands r1, r0
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	orrs r0, r1
	adds r6, #0x44
	strh r0, [r6]
	ldr r0, [r4, #0x24]
	ldr r1, _0222BD8C @ =ov07_0222BAF4
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	nop
_0222BD88: .4byte 0xFFFF1FFF
_0222BD8C: .4byte ov07_0222BAF4
	thumb_func_end ov07_0222BC7C

	thumb_func_start ov07_0222BD90
ov07_0222BD90: @ 0x0222BD90
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	movs r1, #0xe8
	movs r2, #0xea
	adds r5, r0, #0
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #8]
	adds r0, #0xc
	bl ov07_02222240
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x38
	bl ov07_02222914
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	bl FUN_0200D020
	movs r1, #0
	add r2, sp, #0
_0222BDC4:
	ldr r0, [r2]
	cmp r0, #1
	beq _0222BDFA
	adds r1, r1, #1
	adds r2, r2, #4
	cmp r1, #3
	blt _0222BDC4
	movs r2, #0xe8
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0xea
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	movs r1, #1
	subs r2, #8
	bl FUN_020087A4
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_0222BDFA:
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0222BD90

	thumb_func_start ov07_0222BE00
ov07_0222BE00: @ 0x0222BE00
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r5, r0, #0
	bl ov07_0221BFD0
	movs r1, #0xf0
	bl FUN_0201AA8C
	adds r4, r0, #0
	str r5, [r4]
	adds r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	movs r1, #0
	str r0, [r4, #8]
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0xe8
	strh r0, [r1]
	ldr r0, [r4, #8]
	movs r1, #1
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0xea
	strh r0, [r1]
	ldr r0, [r4, #8]
	movs r1, #0x29
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0xec
	strh r0, [r1]
	movs r0, #0xea
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xea
	adds r1, #8
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc
	movs r1, #1
	movs r2, #8
	bl ov07_02222A44
	add r0, sp, #0x20
	movs r1, #1
	movs r2, #0xa
	bl ov07_02222A44
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	ldr r1, [r4, #0x18]
	movs r6, #0
	adds r2, r1, #0
	muls r2, r0, r2
	str r2, [r4, #0x18]
	ldr r1, [sp, #0x2c]
	adds r5, r4, #0
	muls r0, r1, r0
	str r0, [sp, #0x2c]
	movs r7, #0x64
_0222BE98:
	ldr r0, [r4]
	adds r1, r6, #0
	bl ov07_0221C4E8
	str r0, [r5, #0x30]
	adds r1, r7, #0
	bl FUN_0200DD68
	ldr r0, [r5, #0x30]
	movs r1, #1
	bl FUN_0200DD54
	ldr r0, [r5, #0x30]
	movs r1, #1
	bl FUN_0200E0FC
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #2
	blt _0222BE98
	movs r0, #0xea
	ldrsh r1, [r4, r0]
	movs r0, #0xec
	ldrsh r0, [r4, r0]
	movs r3, #0xe8
	ldr r2, _0222BF10 @ =ov07_02222180
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x30]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x34]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	str r1, [sp, #0x1c]
	adds r0, r4, #0
	ldrsh r3, [r4, r3]
	adds r0, #0x38
	add r1, sp, #0x20
	bl ov07_02222864
	movs r1, #0
	mvns r1, r1
	ldr r0, [r4]
	adds r2, r1, #0
	bl ov07_02231E08
	ldr r0, [r4]
	ldr r1, _0222BF14 @ =ov07_0222BD90
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222BF10: .4byte ov07_02222180
_0222BF14: .4byte ov07_0222BD90
	thumb_func_end ov07_0222BE00

	thumb_func_start ov07_0222BF18
ov07_0222BF18: @ 0x0222BF18
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #6
	bls _0222BF28
	b _0222C06E
_0222BF28:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222BF34: @ jump table
	.2byte _0222BF42 - _0222BF34 - 2 @ case 0
	.2byte _0222BF84 - _0222BF34 - 2 @ case 1
	.2byte _0222BFBA - _0222BF34 - 2 @ case 2
	.2byte _0222BFD2 - _0222BF34 - 2 @ case 3
	.2byte _0222C002 - _0222BF34 - 2 @ case 4
	.2byte _0222C01A - _0222BF34 - 2 @ case 5
	.2byte _0222C03E - _0222BF34 - 2 @ case 6
_0222BF42:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_022222B4
	cmp r0, #0
	beq _0222BF64
	movs r2, #0x48
	movs r3, #0x4a
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0xc]
	adds r0, #0x10
	bl ov07_022220B8
	add sp, #8
	pop {r3, r4, r5, pc}
_0222BF64:
	movs r2, #0
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r1, #0x10
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	adds r0, #0x10
	adds r3, r2, #0
	bl ov07_02222268
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0222BF84:
	adds r0, r4, #0
	adds r0, #0x34
	bl ov07_02222440
	cmp r0, #0
	beq _0222BF9E
	ldr r0, [r4, #0xc]
	ldr r2, [r4, #0x34]
	movs r1, #9
	bl FUN_020087A4
	add sp, #8
	pop {r3, r4, r5, pc}
_0222BF9E:
	adds r0, r4, #0
	ldr r1, [r4, #0x34]
	adds r0, #0x34
	movs r2, #0
	movs r3, #4
	bl ov07_022223F0
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #2
	strh r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0222BFBA:
	movs r0, #8
	ldrsh r1, [r4, r0]
	subs r1, r1, #1
	strh r1, [r4, #8]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _0222C06E
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0222BFD2:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_022222B4
	cmp r0, #0
	beq _0222BFF4
	movs r2, #0x48
	movs r3, #0x4a
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0xc]
	adds r0, #0x10
	bl ov07_022220B8
	add sp, #8
	pop {r3, r4, r5, pc}
_0222BFF4:
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0x20
	strh r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0222C002:
	movs r0, #8
	ldrsh r1, [r4, r0]
	subs r1, r1, #1
	strh r1, [r4, #8]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _0222C06E
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0222C01A:
	adds r0, r4, #0
	adds r0, #0x34
	bl ov07_02222440
	cmp r0, #0
	beq _0222C034
	ldr r0, [r4, #0xc]
	ldr r2, [r4, #0x34]
	movs r1, #9
	bl FUN_020087A4
	add sp, #8
	pop {r3, r4, r5, pc}
_0222C034:
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0222C03E:
	movs r2, #0x48
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x4a
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_020087A4
	ldr r0, [r4, #0xc]
	movs r1, #9
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_0222C06E:
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0222BF18

	thumb_func_start ov07_0222C074
ov07_0222C074: @ 0x0222C074
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	bl ov07_0221BFD0
	movs r1, #0xf0
	bl FUN_0201AA8C
	adds r4, r0, #0
	str r5, [r4]
	movs r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	movs r1, #0
	str r0, [r4, #0xc]
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0x4a
	strh r0, [r1]
	movs r1, #0
	adds r0, r4, #0
	str r1, [sp]
	movs r2, #3
	str r2, [sp, #4]
	adds r0, #0x10
	subs r2, #0x23
	adds r3, r1, #0
	bl ov07_02222268
	adds r0, r4, #0
	ldr r2, _0222C184 @ =0x00000E38
	adds r0, #0x34
	movs r1, #0
	movs r3, #8
	bl ov07_022223F0
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	ldr r1, [r4, #0x18]
	adds r2, r1, #0
	muls r2, r0, r2
	str r2, [r4, #0x18]
	ldr r1, [r4, #0x3c]
	muls r0, r1, r0
	str r0, [r4, #0x3c]
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	adds r7, r0, #0
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223192C
	adds r6, r0, #0
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223192C
	cmp r6, #3
	bne _0222C142
	cmp r0, #3
	bne _0222C142
	movs r1, #0xa
	adds r2, r1, #0
	ldr r0, [r4, #0xc]
	subs r2, #0x32
	bl FUN_020087A4
	ldr r0, [r4, #0xc]
	movs r1, #0xb
	movs r2, #0x28
	bl FUN_020087A4
	b _0222C176
_0222C142:
	cmp r6, #4
	bne _0222C160
	cmp r0, #4
	bne _0222C160
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	movs r2, #0x28
	bl FUN_020087A4
	ldr r0, [r4, #0xc]
	movs r1, #0xb
	movs r2, #0x28
	bl FUN_020087A4
	b _0222C176
_0222C160:
	movs r2, #0x28
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	muls r2, r7, r2
	bl FUN_020087A4
	ldr r0, [r4, #0xc]
	movs r1, #0xb
	movs r2, #0x28
	bl FUN_020087A4
_0222C176:
	ldr r0, [r4]
	ldr r1, _0222C188 @ =ov07_0222BF18
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222C184: .4byte 0x00000E38
_0222C188: .4byte ov07_0222BF18
	thumb_func_end ov07_0222C074

	thumb_func_start ov07_0222C18C
ov07_0222C18C: @ 0x0222C18C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r4, [sp, #0x10]
	bl FUN_0200D734
	str r0, [r5]
	adds r6, r4, #4
	adds r3, r5, #4
	movs r2, #4
_0222C1A4:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0222C1A4
	ldr r0, [r6]
	adds r2, r5, #0
	str r0, [r3]
	adds r3, r4, #0
	adds r3, #0x28
	ldm r3!, {r0, r1}
	adds r2, #0x28
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #0x3c
	ldrsh r0, [r4, r0]
	strh r0, [r5, #0x3c]
	movs r0, #0x3e
	ldrsh r0, [r4, r0]
	strh r0, [r5, #0x3e]
	movs r0, #0x40
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	adds r0, #0x40
	strh r1, [r0]
	ldr r0, [r4, #0x44]
	movs r1, #0
	str r0, [r5, #0x44]
	str r1, [r5, #0x48]
	ldr r0, [r5]
	bl FUN_0200DCE8
	ldr r0, [r5]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r5]
	movs r1, #1
	bl FUN_0200DD54
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_0222C18C

	thumb_func_start ov07_0222C1FC
ov07_0222C1FC: @ 0x0222C1FC
	ldr r3, _0222C204 @ =FUN_0200D9DC
	ldr r0, [r0]
	bx r3
	nop
_0222C204: .4byte FUN_0200D9DC
	thumb_func_end ov07_0222C1FC

	thumb_func_start ov07_0222C208
ov07_0222C208: @ 0x0222C208
	ldr r3, _0222C210 @ =FUN_0200DCE8
	ldr r0, [r0]
	bx r3
	nop
_0222C210: .4byte FUN_0200DCE8
	thumb_func_end ov07_0222C208

	thumb_func_start ov07_0222C214
ov07_0222C214: @ 0x0222C214
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #0
	bne _0222C226
	add sp, #0x10
	movs r0, #1
	pop {r4, pc}
_0222C226:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0222C236
	cmp r0, #1
	beq _0222C236
	cmp r0, #2
	beq _0222C2B8
	b _0222C2BE
_0222C236:
	adds r0, r4, #4
	bl ov07_02222180
	cmp r0, #0
	beq _0222C276
	adds r0, r4, #0
	adds r0, #0x28
	bl ov07_022224AC
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x28]
	adds r0, r1, r0
	str r0, [r4, #0x1c]
	movs r1, #0x3e
	ldrsh r2, [r4, r1]
	movs r1, #4
	ldrsh r1, [r4, r1]
	ldr r0, [r4]
	adds r1, r2, r1
	movs r2, #0x40
	ldrsh r3, [r4, r2]
	movs r2, #6
	ldrsh r2, [r4, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	b _0222C2BE
_0222C276:
	ldr r0, [r4, #0x44]
	cmp r0, #1
	bge _0222C2B0
	cmp r0, #0
	bne _0222C29E
	ldr r1, [r4, #0xc]
	ldr r2, _0222C2C4 @ =0x00007FFF
	lsls r1, r1, #0x10
	str r2, [sp]
	ldr r0, [r4, #0x10]
	lsrs r1, r1, #0x10
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	adds r3, r1, #0
	str r0, [sp, #8]
	ldr r0, _0222C2C8 @ =0x0000071C
	str r0, [sp, #0xc]
	adds r0, r4, #4
	bl ov07_0222212C
_0222C29E:
	ldr r0, [r4, #8]
	ldr r2, _0222C2CC @ =0x0000FFFF
	str r0, [sp]
	adds r0, r4, #0
	ldr r3, _0222C2D0 @ =0xFFFFF000
	adds r0, #0x28
	movs r1, #0
	bl ov07_02222494
_0222C2B0:
	ldr r0, [r4, #0x44]
	adds r0, r0, #1
	str r0, [r4, #0x44]
	b _0222C2BE
_0222C2B8:
	add sp, #0x10
	movs r0, #0
	pop {r4, pc}
_0222C2BE:
	movs r0, #1
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0222C2C4: .4byte 0x00007FFF
_0222C2C8: .4byte 0x0000071C
_0222C2CC: .4byte 0x0000FFFF
_0222C2D0: .4byte 0xFFFFF000
	thumb_func_end ov07_0222C214

	thumb_func_start ov07_0222C2D4
ov07_0222C2D4: @ 0x0222C2D4
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r7, r0, #0
	adds r0, r4, #0
	adds r0, #0xf0
	ldr r0, [r0]
	cmp r0, #6
	bhi _0222C348
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222C2F0: @ jump table
	.2byte _0222C2FE - _0222C2F0 - 2 @ case 0
	.2byte _0222C316 - _0222C2F0 - 2 @ case 1
	.2byte _0222C362 - _0222C2F0 - 2 @ case 2
	.2byte _0222C378 - _0222C2F0 - 2 @ case 3
	.2byte _0222C418 - _0222C2F0 - 2 @ case 4
	.2byte _0222C442 - _0222C2F0 - 2 @ case 5
	.2byte _0222C482 - _0222C2F0 - 2 @ case 6
_0222C2FE:
	adds r0, r4, #0
	adds r0, #0xc
	bl ov07_0222C214
	adds r0, r4, #0
	adds r0, #0xf0
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf0
	str r1, [r0]
	b _0222C4AC
_0222C316:
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r1, [r0]
	adds r0, r4, #0
	adds r1, #0xa
	adds r0, #0xfc
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0xa
	blx FUN_020F2998
	movs r1, #0x1f
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	ldr r0, _0222C4B4 @ =0x04000052
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r1, [r0]
	ldr r0, _0222C4B8 @ =0x00000136
	cmp r1, r0
	bge _0222C34A
_0222C348:
	b _0222C4AC
_0222C34A:
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0200E0FC
	adds r0, r4, #0
	adds r0, #0xf0
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf0
	str r1, [r0]
	b _0222C4AC
_0222C362:
	ldr r1, _0222C4BC @ =0x0000FFFF
	ldr r0, _0222C4B4 @ =0x04000052
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf0
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf0
	str r1, [r0]
	b _0222C4AC
_0222C378:
	adds r0, r4, #0
	adds r0, #0xf4
	ldr r0, [r0]
	cmp r0, #0
	bgt _0222C3BC
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r0, [r0]
	movs r2, #0x4c
	adds r3, r0, #0
	muls r3, r2, r3
	adds r0, r4, r3
	movs r1, #1
	adds r0, #0xa0
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r0, [r0]
	muls r2, r0, r2
	adds r0, r4, r2
	ldr r0, [r0, #0x58]
	bl FUN_0200DCE8
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf8
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #8
	adds r0, #0xf4
	str r1, [r0]
_0222C3BC:
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r0, [r0]
	cmp r0, #2
	bge _0222C3D4
	adds r0, r4, #0
	adds r0, #0xf4
	ldr r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf4
	str r1, [r0]
_0222C3D4:
	adds r0, r4, #0
	adds r0, #0xc
	bl ov07_0222C214
	adds r5, r4, #0
	adds r6, r0, #0
	movs r7, #0
	adds r5, #0x58
_0222C3E4:
	adds r0, r5, #0
	bl ov07_0222C214
	str r0, [sp]
	cmp r0, #0
	bne _0222C3F8
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0222C208
_0222C3F8:
	ldr r0, [sp]
	adds r7, r7, #1
	orrs r6, r0
	adds r5, #0x4c
	cmp r7, #2
	blt _0222C3E4
	cmp r6, #0
	bne _0222C4AC
	adds r0, r4, #0
	adds r0, #0xf0
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf0
	str r1, [r0]
	b _0222C4AC
_0222C418:
	ldr r0, [r4, #0xc]
	bl FUN_0200DC18
	ldr r0, [r4, #0xc]
	ldr r0, [r0]
	bl FUN_02024B68
	cmp r0, #0
	bne _0222C4AC
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_0200E0FC
	adds r0, r4, #0
	adds r0, #0xf0
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf0
	str r1, [r0]
	b _0222C4AC
_0222C442:
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r1, [r0]
	adds r0, r4, #0
	subs r1, #0xa
	adds r0, #0xfc
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	movs r1, #0xa
	blx FUN_020F2998
	movs r1, #0x1f
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	ldr r0, _0222C4B4 @ =0x04000052
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	cmp r0, #0
	bgt _0222C4AC
	adds r0, r4, #0
	adds r0, #0xf0
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xf0
	str r1, [r0]
	b _0222C4AC
_0222C482:
	adds r5, r4, #0
	movs r6, #0
	adds r5, #0x58
_0222C488:
	adds r0, r5, #0
	bl ov07_0222C1FC
	adds r6, r6, #1
	adds r5, #0x4c
	cmp r6, #2
	blt _0222C488
	ldr r0, [r4, #0xc]
	bl FUN_0200D9DC
	ldr r0, [r4]
	adds r1, r7, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
_0222C4AC:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222C4B4: .4byte 0x04000052
_0222C4B8: .4byte 0x00000136
_0222C4BC: .4byte 0x0000FFFF
	thumb_func_end ov07_0222C2D4

	thumb_func_start ov07_0222C4C0
ov07_0222C4C0: @ 0x0222C4C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp, #0x10]
	bl ov07_0221BFD0
	movs r1, #1
	lsls r1, r1, #8
	bl FUN_0201AA8C
	adds r4, r0, #0
	str r5, [r4]
	str r6, [r4, #4]
	str r7, [r4, #8]
	movs r1, #8
	adds r0, #0xf4
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xf8
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf0
	str r1, [r0]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_02222004
	ldr r1, [sp, #0x10]
	lsls r0, r0, #0x11
	str r1, [r4, #0xc]
	movs r1, #0
	str r1, [r4, #0x50]
	ldr r2, _0222C5F8 @ =0x0000BFFF
	rsbs r0, r0, #0
	str r2, [sp]
	str r0, [sp, #4]
	ldr r1, _0222C5FC @ =0xFFFF8000
	ldr r0, _0222C600 @ =0x0000071C
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	lsrs r1, r1, #0x12
	adds r0, #0x10
	adds r3, r1, #0
	bl ov07_0222212C
	ldr r0, [r4, #0x14]
	ldr r2, _0222C604 @ =0x0000FFFF
	str r0, [sp]
	adds r0, r4, #0
	ldr r3, _0222C608 @ =0xFFFFF000
	adds r0, #0x34
	movs r1, #0
	bl ov07_02222494
	adds r0, r4, #0
	ldr r1, [r4, #0x28]
	adds r0, #0x48
	strh r1, [r0]
	movs r0, #1
	str r0, [r4, #0x54]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl ov07_02221F80
	adds r1, r4, #0
	adds r1, #0x4a
	strh r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl ov07_02221F80
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	movs r1, #0x4a
	movs r2, #0x4c
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	bl FUN_0200DDB8
	ldr r0, [r4, #0xc]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_0200DD54
	ldr r1, [r4]
	add r0, sp, #0x14
	bl ov07_0221F9E8
	movs r0, #0x4a
	ldrsh r0, [r4, r0]
	add r1, sp, #0x14
	adds r5, r4, #0
	strh r0, [r1]
	movs r0, #0x4c
	ldrsh r0, [r4, r0]
	adds r7, r4, #0
	movs r6, #0
	strh r0, [r1, #2]
	adds r5, #0x58
	adds r7, #0xc
_0222C5A6:
	str r7, [sp]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	adds r0, r5, #0
	add r3, sp, #0x14
	bl ov07_0222C18C
	adds r6, r6, #1
	adds r5, #0x4c
	cmp r6, #2
	blt _0222C5A6
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xfc
	str r1, [r0]
	ldr r0, [r4]
	movs r2, #0x1f
	bl ov07_02231E08
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_0200E0FC
	movs r6, #0
	adds r5, r4, #0
	movs r7, #1
_0222C5DA:
	ldr r0, [r5, #0x58]
	adds r1, r7, #0
	bl FUN_0200E0FC
	adds r6, r6, #1
	adds r5, #0x4c
	cmp r6, #2
	blt _0222C5DA
	ldr r0, [r4]
	ldr r1, _0222C60C @ =ov07_0222C2D4
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222C5F8: .4byte 0x0000BFFF
_0222C5FC: .4byte 0xFFFF8000
_0222C600: .4byte 0x0000071C
_0222C604: .4byte 0x0000FFFF
_0222C608: .4byte 0xFFFFF000
_0222C60C: .4byte ov07_0222C2D4
	thumb_func_end ov07_0222C4C0

	thumb_func_start ov07_0222C610
ov07_0222C610: @ 0x0222C610
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r2, #0x60
	ldrsh r3, [r4, r2]
	movs r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x5c]
	movs r1, #0
	adds r2, r3, r2
	bl FUN_020087A4
	movs r2, #0x62
	ldrsh r3, [r4, r2]
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	adds r2, r3, r2
	bl FUN_020087A4
	movs r1, #0x60
	ldrsh r2, [r4, r1]
	movs r1, #0x10
	ldrsh r1, [r4, r1]
	ldr r0, [r4, #0x58]
	adds r1, r2, r1
	movs r2, #0x62
	ldrsh r3, [r4, r2]
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r3, r3, r2
	movs r2, #0x66
	ldrsh r2, [r4, r2]
	subs r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0x34
	add r1, sp, #4
	add r2, sp, #0
	bl ov07_02222644
	movs r0, #0x64
	ldrsh r0, [r4, r0]
	blx FUN_020F2178
	adds r1, r0, #0
	ldr r0, _0222C6A4 @ =0x3DCCCCCD
	blx FUN_020F22DC
	adds r1, r0, #0
	ldr r0, [sp, #4]
	blx FUN_020F1520
	adds r1, r0, #0
	str r1, [sp, #4]
	ldr r0, [r4, #0x58]
	ldr r2, [sp]
	bl FUN_0200E024
	movs r0, #0x64
	ldrsh r1, [r4, r0]
	subs r0, #0x65
	adds r4, #0x64
	muls r0, r1, r0
	strh r0, [r4]
	add sp, #8
	pop {r4, pc}
	nop
_0222C6A4: .4byte 0x3DCCCCCD
	thumb_func_end ov07_0222C610

	thumb_func_start ov07_0222C6A8
ov07_0222C6A8: @ 0x0222C6A8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r2, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0222C6C0
	cmp r0, #1
	beq _0222C6FA
	cmp r0, #2
	beq _0222C762
	b _0222C774
_0222C6C0:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_022227D8
	adds r0, r4, #0
	adds r0, #0x34
	bl ov07_0222260C
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0222C610
	cmp r5, #0
	bne _0222C774
	movs r2, #0xa
	str r2, [sp]
	str r2, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #0xc
	movs r3, #0xf
	bl ov07_02222590
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0222C774
_0222C6FA:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_022227D8
	adds r0, r4, #0
	adds r0, #0x34
	bl ov07_0222260C
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0222C610
	cmp r5, #0
	bne _0222C774
	movs r2, #0x60
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x62
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl FUN_020087A4
	ldr r0, [r4, #0x58]
	movs r1, #0
	bl FUN_0200E0FC
	movs r2, #0x62
	ldrsh r3, [r4, r2]
	movs r2, #0x66
	ldrsh r2, [r4, r2]
	movs r1, #0x60
	ldrsh r1, [r4, r1]
	subs r2, r3, r2
	lsls r2, r2, #0x10
	ldr r0, [r4, #0x58]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	movs r1, #0xfe
	lsls r1, r1, #0x16
	ldr r0, [r4, #0x58]
	adds r2, r1, #0
	bl FUN_0200E024
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0222C774
_0222C762:
	ldr r0, [r4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, pc}
_0222C774:
	ldr r0, [r4, #4]
	bl FUN_0200D020
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0222C6A8

	thumb_func_start ov07_0222C780
ov07_0222C780: @ 0x0222C780
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl ov07_0221BFD0
	movs r1, #0x68
	bl FUN_0201AA8C
	adds r4, r0, #0
	str r5, [r4]
	adds r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	movs r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	movs r1, #0
	str r0, [r4, #0x5c]
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0x60
	strh r0, [r1]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0x62
	strh r0, [r1]
	ldr r0, [r4, #0x5c]
	movs r1, #0x29
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0x66
	strh r0, [r1]
	movs r0, #6
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #2
	movs r2, #0
	movs r3, #1
	bl ov07_022227A8
	ldr r0, [r4]
	movs r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x58]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #0x58]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r4, #0x58]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0x58]
	movs r1, #1
	bl FUN_0200DD54
	movs r0, #0xf
	str r0, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r0, #7
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x34
	movs r2, #0xc
	adds r3, r1, #0
	bl ov07_02222590
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x64
	strh r1, [r0]
	ldr r0, [r4]
	movs r1, #0x1c
	movs r2, #0xf
	bl ov07_02231E08
	ldr r0, [r4]
	ldr r1, _0222C84C @ =ov07_0222C6A8
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0222C84C: .4byte ov07_0222C6A8
	thumb_func_end ov07_0222C780

	thumb_func_start ov07_0222C850
ov07_0222C850: @ 0x0222C850
	movs r2, #0x12
	ldrsh r2, [r0, r2]
	movs r3, #0x10
	ldrsh r0, [r0, r3]
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r2
	movs r2, #3
	ldr r3, _0222C86C @ =FUN_020D47EC
	lsls r2, r2, #8
	bx r3
	.align 2, 0
_0222C86C: .4byte FUN_020D47EC
	thumb_func_end ov07_0222C850

	thumb_func_start ov07_0222C870
ov07_0222C870: @ 0x0222C870
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	bl ov07_02222D60
	str r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	adds r0, r5, #0
	bl ov07_0222C850
	adds r0, r5, #0
	adds r0, #0x1c
	bl ov07_022222B4
	str r0, [sp, #8]
	movs r0, #0x14
	ldrsh r4, [r5, r0]
	movs r0, #0x16
	ldrsh r0, [r5, r0]
	cmp r4, r0
	bgt _0222C910
	ldr r1, [sp, #0xc]
	lsls r2, r4, #2
	adds r1, r1, r2
	str r1, [sp]
_0222C8A4:
	ldr r1, [sp]
	subs r0, r0, r4
	ldr r2, [r1]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	lsrs r1, r2, #0x10
	lsls r1, r1, #0x10
	asrs r7, r1, #0x10
	movs r1, #0x1e
	ldrsh r1, [r5, r1]
	muls r0, r1, r0
	movs r1, #0x64
	blx FUN_020F2998
	subs r0, r7, r0
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	movs r0, #0x1c
	ldrsh r1, [r5, r0]
	movs r0, #0x14
	ldrsh r0, [r5, r0]
	adds r0, #0x28
	subs r0, r0, r4
	muls r0, r1, r0
	movs r1, #0x64
	blx FUN_020F2998
	ldr r1, [sp, #4]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	subs r6, r4, #1
	bpl _0222C8EC
	adds r6, #0xc0
_0222C8EC:
	ldr r0, [sp, #4]
	lsls r1, r7, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	bl ov07_02222D88
	ldr r1, [sp, #0xc]
	lsls r2, r6, #2
	str r0, [r1, r2]
	ldr r0, [sp]
	adds r4, r4, #1
	adds r0, r0, #4
	str r0, [sp]
	movs r0, #0x16
	ldrsh r0, [r5, r0]
	cmp r4, r0
	ble _0222C8A4
_0222C910:
	ldr r0, [sp, #8]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0222C870

	thumb_func_start ov07_0222C918
ov07_0222C918: @ 0x0222C918
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r6, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #4
	bhi _0222C980
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222C932: @ jump table
	.2byte _0222C93C - _0222C932 - 2 @ case 0
	.2byte _0222C96E - _0222C932 - 2 @ case 1
	.2byte _0222C996 - _0222C932 - 2 @ case 2
	.2byte _0222C9E6 - _0222C932 - 2 @ case 3
	.2byte _0222CA06 - _0222C932 - 2 @ case 4
_0222C93C:
	adds r0, r4, #0
	bl ov07_0222C870
	cmp r0, #0
	bne _0222C980
	ldr r0, [r4, #4]
	movs r1, #0x1f
	adds r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4]
	movs r2, #0
	bl ov07_02231E74
	movs r1, #0x1f
	movs r2, #0
	str r1, [sp]
	movs r0, #0x10
	adds r4, #0x40
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r3, r2, #0
	bl ov07_02222AC4
	add sp, #8
	pop {r4, r5, r6, pc}
_0222C96E:
	adds r0, r4, #0
	bl ov07_0222C870
	adds r0, r4, #0
	adds r0, #0x40
	bl ov07_02222AF4
	cmp r0, #0
	bne _0222C982
_0222C980:
	b _0222CA88
_0222C982:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #0x18]
	bl ov07_02222D74
	movs r0, #0
	add sp, #8
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
_0222C996:
	ldr r0, [r4]
	bl ov07_0221C4A0
	movs r3, #0x10
	ldrsh r3, [r4, r3]
	movs r1, #2
	movs r2, #0
	rsbs r3, r3, #0
	bl FUN_0201BC8C
	ldr r0, [r4]
	bl ov07_0221C4A0
	movs r3, #0x12
	ldrsh r3, [r4, r3]
	movs r1, #2
	movs r2, #3
	rsbs r3, r3, #0
	bl FUN_0201BC8C
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #8
	ble _0222CA88
	movs r1, #0
	str r1, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1f
	adds r0, #0x40
	adds r3, r2, #0
	bl ov07_02222AC4
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, pc}
_0222C9E6:
	adds r0, r4, #0
	adds r0, #0x40
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222CA88
	ldr r0, [r4, #0xc]
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, pc}
_0222CA06:
	ldr r0, [r4, #0x18]
	bl ov07_02222D3C
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FAEC
	adds r5, r0, #0
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FB04
	adds r1, r0, #0
	lsls r0, r5, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	ldr r0, [r4]
	bl ov07_0221FAE8
	adds r1, r0, #0
	lsls r1, r1, #0x18
	movs r0, #0
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FAEC
	adds r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221BFD0
	adds r3, r0, #0
	lsls r0, r5, #0x18
	movs r1, #1
	lsrs r0, r0, #0x18
	lsls r1, r1, #0xe
	movs r2, #0
	bl FUN_0201C1C4
	ldr r0, [r4]
	bl ov07_0221C4A0
	adds r5, r0, #0
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FAEC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	ldr r0, [r4]
	adds r1, r6, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_0222CA88:
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0222C918

	thumb_func_start ov07_0222CA8C
ov07_0222CA8C: @ 0x0222CA8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	bl ov07_0221BFD0
	movs r1, #0x68
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x68
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r1, _0222CBF4 @ =ov07_0222C918
	str r5, [r4]
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov07_0221C410
	str r0, [sp, #0x14]
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0xc]
	movs r1, #0x29
	bl FUN_02008A78
	movs r1, #0x12
	ldrsh r2, [r4, r1]
	subs r0, r2, r0
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r0, [r4, r0]
	movs r2, #1
	subs r0, #0x28
	strh r0, [r4, #0x10]
	ldrsh r0, [r4, r1]
	movs r1, #6
	subs r0, #0x28
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0xc]
	bl FUN_020087A4
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	adds r6, r0, #0
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	subs r1, #8
	strh r1, [r4, #0x14]
	ldrsh r0, [r4, r0]
	adds r0, #0x58
	strh r0, [r4, #0x16]
	movs r0, #0x14
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _0222CB28
	movs r0, #0
	strh r0, [r4, #0x14]
_0222CB28:
	movs r0, #0x16
	ldrsh r0, [r4, r0]
	cmp r0, #0xbf
	ble _0222CB34
	movs r0, #0xbf
	strh r0, [r4, #0x16]
_0222CB34:
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221FAF8
	adds r7, r0, #0
	ldr r0, [sp, #0x14]
	bl FUN_0201F98C
	str r0, [sp, #0x18]
	ldrh r0, [r4, #0x10]
	ldrh r1, [r4, #0x12]
	bl ov07_02222D88
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl ov07_0221BFD0
	movs r1, #0x50
	str r1, [sp]
	ldr r1, [sp, #0x18]
	str r7, [sp, #4]
	adds r1, r1, #1
	str r1, [sp, #8]
	ldr r1, [sp, #0x1c]
	ldr r2, _0222CBF8 @ =0x0000038E
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0x14
	movs r1, #0x16
	ldrsh r0, [r4, r0]
	ldrsh r1, [r4, r1]
	lsls r3, r6, #0xf
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl ov07_02222CCC
	str r0, [r4, #0x18]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x1c
	movs r2, #0x50
	adds r3, r1, #0
	bl ov07_02222268
	ldr r0, [r4, #0x24]
	adds r1, r0, #0
	muls r1, r6, r1
	str r1, [r4, #0x24]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	subs r0, r0, #3
	cmp r0, #1
	bhi _0222CBE6
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FAEC
	adds r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAE8
	adds r1, r0, #0
	lsls r0, r5, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	ldr r0, [r4]
	bl ov07_0221FAE8
	adds r1, r0, #0
	adds r1, r1, #1
	lsls r1, r1, #0x18
	movs r0, #0
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
_0222CBE6:
	ldr r0, [sp, #0x14]
	adds r1, r4, #0
	bl ov07_0222C918
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222CBF4: .4byte ov07_0222C918
_0222CBF8: .4byte 0x0000038E
	thumb_func_end ov07_0222CA8C

	thumb_func_start ov07_0222CBFC
ov07_0222CBFC: @ 0x0222CBFC
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r2, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _0222CCAC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222CC16: @ jump table
	.2byte _0222CC1E - _0222CC16 - 2 @ case 0
	.2byte _0222CC44 - _0222CC16 - 2 @ case 1
	.2byte _0222CC56 - _0222CC16 - 2 @ case 2
	.2byte _0222CC9A - _0222CC16 - 2 @ case 3
_0222CC1E:
	adds r0, r4, #0
	adds r0, #0x38
	bl ov07_02222468
	ldr r2, [r4, #0x38]
	movs r1, #0x1f
	subs r1, r1, r2
	lsls r1, r1, #8
	orrs r2, r1
	ldr r1, _0222CCB8 @ =0x04000052
	cmp r0, #0
	strh r2, [r1]
	bne _0222CCAC
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	str r0, [r4, #0xc]
	b _0222CCAC
_0222CC44:
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0x20
	ble _0222CCAC
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0222CCAC
_0222CC56:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222558
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x14
	add r1, sp, #4
	add r2, sp, #0
	bl ov07_02222644
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	bne _0222CC7C
	ldr r1, [sp, #4]
	movs r0, #0
	blx FUN_020F24C8
	str r0, [sp, #4]
_0222CC7C:
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl FUN_0200E024
	cmp r5, #0
	bne _0222CCAC
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0222CCAC
_0222CC9A:
	ldr r0, [r4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, pc}
_0222CCAC:
	ldr r0, [r4, #4]
	bl FUN_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0222CCB8: .4byte 0x04000052
	thumb_func_end ov07_0222CBFC

	thumb_func_start ov07_0222CCBC
ov07_0222CCBC: @ 0x0222CCBC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r2, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0222CCD8
	cmp r0, #1
	beq _0222CD60
	cmp r0, #2
	bne _0222CCD4
	b _0222CDFE
_0222CCD4:
	add sp, #0xc
	pop {r4, r5, pc}
_0222CCD8:
	adds r0, r5, #0
	adds r0, #0x14
	bl ov07_022227D8
	movs r2, #0x38
	movs r3, #0x3a
	adds r0, r5, #0
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	ldr r1, [r5, #8]
	adds r0, #0x14
	bl ov07_022220B8
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _0222CD12
	movs r3, #0x3a
	ldrsh r4, [r5, r3]
	ldr r3, [r5, #0x3c]
	movs r2, #0x38
	subs r3, r4, r3
	adds r0, r5, #0
	lsls r3, r3, #0x10
	ldrsh r2, [r5, r2]
	ldr r1, [r5, #0xc]
	adds r0, #0x14
	asrs r3, r3, #0x10
	bl ov07_0222207C
_0222CD12:
	ldr r0, [r5, #8]
	bl FUN_02009138
	cmp r0, #0
	bne _0222CE0C
	movs r2, #0
	str r2, [sp]
	ldr r0, [r5, #8]
	movs r1, #0x10
	adds r3, r2, #0
	bl FUN_020090B4
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _0222CD56
	ldr r0, [r5, #0xc]
	bl ov07_02221FF0
	movs r1, #1
	adds r4, r1, #0
	lsls r4, r0
	ldr r0, [r5]
	bl ov07_0221FA78
	movs r1, #0x10
	str r1, [sp]
	movs r3, #0
	lsls r2, r4, #0x10
	str r3, [sp, #4]
	movs r1, #4
	lsrs r2, r2, #0x10
	str r3, [sp, #8]
	bl FUN_02003370
_0222CD56:
	ldr r0, [r5, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r5, #4]
	pop {r4, r5, pc}
_0222CD60:
	adds r0, r5, #0
	adds r0, #0x14
	bl ov07_022227D8
	movs r2, #0x38
	movs r3, #0x3a
	adds r0, r5, #0
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	ldr r1, [r5, #8]
	adds r0, #0x14
	bl ov07_022220B8
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _0222CD9A
	movs r3, #0x3a
	ldrsh r4, [r5, r3]
	ldr r3, [r5, #0x3c]
	movs r2, #0x38
	subs r3, r4, r3
	adds r0, r5, #0
	lsls r3, r3, #0x10
	ldrsh r2, [r5, r2]
	ldr r1, [r5, #0xc]
	adds r0, #0x14
	asrs r3, r3, #0x10
	bl ov07_0222207C
_0222CD9A:
	ldr r0, [r5, #8]
	bl FUN_02009138
	cmp r0, #0
	bne _0222CE0C
	movs r2, #0x38
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #8]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x3a
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #8]
	movs r1, #1
	bl FUN_020087A4
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _0222CDF4
	ldr r0, [r5]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r5]
	bl ov07_0221FAC8
	cmp r0, #0
	bne _0222CDDE
	ldr r0, [r5, #8]
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
_0222CDDE:
	movs r2, #0x3a
	ldrsh r3, [r5, r2]
	ldr r2, [r5, #0x3c]
	movs r1, #0x38
	subs r2, r3, r2
	lsls r2, r2, #0x10
	ldrsh r1, [r5, r1]
	ldr r0, [r5, #0xc]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
_0222CDF4:
	ldr r0, [r5, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r5, #4]
	pop {r4, r5, pc}
_0222CDFE:
	ldr r0, [r5]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r5, #0
	bl FUN_0201AB0C
_0222CE0C:
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov07_0222CCBC

	thumb_func_start ov07_0222CE10
ov07_0222CE10: @ 0x0222CE10
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov07_0221BFD0
	movs r1, #0x50
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x50
	blx FUN_020E5B44
	str r5, [r4]
	adds r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	adds r0, r5, #0
	bl ov07_0221BFC0
	str r0, [r4, #0x4c]
	ldr r0, [r4]
	movs r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x10]
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0xa
	adds r0, #0x14
	movs r1, #0xe
	adds r3, r2, #0
	bl ov07_02222508
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #0
	movs r2, #0x10
	movs r3, #8
	bl ov07_02222418
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4]
	movs r1, #0
	movs r2, #0x1f
	bl ov07_02231E08
	ldr r0, [r4, #0x10]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	ldr r0, [r4, #0x10]
	bne _0222CE90
	ldr r1, _0222CEB4 @ =0xBFB33333
	ldr r2, _0222CEB8 @ =0x3FB33333
	bl FUN_0200E024
	b _0222CE98
_0222CE90:
	ldr r1, _0222CEB8 @ =0x3FB33333
	adds r2, r1, #0
	bl FUN_0200E024
_0222CE98:
	ldr r0, [r4, #0x10]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0200DD54
	ldr r0, [r4]
	ldr r1, _0222CEBC @ =ov07_0222CBFC
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222CEB4: .4byte 0xBFB33333
_0222CEB8: .4byte 0x3FB33333
_0222CEBC: .4byte ov07_0222CBFC
	thumb_func_end ov07_0222CE10

	thumb_func_start ov07_0222CEC0
ov07_0222CEC0: @ 0x0222CEC0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl ov07_0221BFD0
	movs r1, #0x40
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x40
	blx FUN_020E5B44
	str r5, [r4]
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #8]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0x38]
	ldr r0, [r4, #8]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0x3a]
	ldr r0, [r4, #8]
	movs r1, #0x29
	bl FUN_02008A78
	str r0, [r4, #0x3c]
	movs r1, #4
	adds r0, r4, #0
	str r1, [sp]
	adds r0, #0x14
	movs r2, #0
	movs r3, #1
	bl ov07_022227A8
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	movs r1, #0x14
	ldrsh r1, [r4, r1]
	movs r2, #0x10
	adds r0, r1, r0
	movs r1, #0
	strh r0, [r4, #0x14]
	str r1, [sp]
	ldr r0, [r4, #8]
	adds r3, r1, #0
	bl FUN_020090B4
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0xc]
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	adds r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	cmp r5, #2
	bne _0222CF6C
	cmp r0, #4
	beq _0222CF74
_0222CF6C:
	cmp r5, #5
	bne _0222CFBA
	cmp r0, #3
	bne _0222CFBA
_0222CF74:
	ldr r0, [r4, #0xc]
	bl ov07_02221FF0
	movs r1, #1
	adds r5, r1, #0
	lsls r5, r0
	ldr r0, [r4]
	bl ov07_0221FA78
	movs r3, #0
	lsls r2, r5, #0x10
	str r3, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	movs r1, #4
	lsrs r2, r2, #0x10
	str r3, [sp, #8]
	bl FUN_02003370
	movs r0, #1
	str r0, [r4, #0x10]
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAC8
	cmp r0, #0
	bne _0222CFBA
	ldr r0, [r4, #8]
	movs r1, #6
	movs r2, #1
	bl FUN_020087A4
_0222CFBA:
	ldr r0, [r4]
	ldr r1, _0222CFC8 @ =ov07_0222CCBC
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0222CFC8: .4byte ov07_0222CCBC
	thumb_func_end ov07_0222CEC0

	thumb_func_start ov07_0222CFCC
ov07_0222CFCC: @ 0x0222CFCC
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #8]
	movs r5, #0
	cmp r0, #3
	bhi _0222D048
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222CFE6: @ jump table
	.2byte _0222CFEE - _0222CFE6 - 2 @ case 0
	.2byte _0222D006 - _0222CFE6 - 2 @ case 1
	.2byte _0222D02C - _0222CFE6 - 2 @ case 2
	.2byte _0222D046 - _0222CFE6 - 2 @ case 3
_0222CFEE:
	adds r0, r4, #0
	adds r0, #0x1c
	bl ov07_02222AF4
	cmp r0, #1
	bne _0222D048
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0x20
	str r0, [r4, #0x44]
	b _0222D048
_0222D006:
	ldr r0, [r4, #0x44]
	subs r0, r0, #1
	str r0, [r4, #0x44]
	bpl _0222D048
	ldr r0, [r4, #8]
	movs r1, #8
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0x18
	adds r4, #0x1c
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r5, #0
	adds r3, r1, #0
	bl ov07_02222AC4
	b _0222D048
_0222D02C:
	adds r0, r4, #0
	adds r0, #0x1c
	bl ov07_02222AF4
	cmp r0, #1
	bne _0222D048
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	ldr r0, [r4, #0x14]
	bl ov07_02222D3C
	b _0222D048
_0222D046:
	movs r5, #1
_0222D048:
	adds r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0222CFCC

	thumb_func_start ov07_0222D050
ov07_0222D050: @ 0x0222D050
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r6, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222D066
	cmp r0, #1
	beq _0222D09A
	cmp r0, #2
	beq _0222D0AC
	pop {r4, r5, r6, pc}
_0222D066:
	adds r0, r4, #0
	bl ov07_0222CFCC
	ldr r0, [r4, #0x48]
	bl FUN_0200DCFC
	cmp r0, #1
	bne _0222D092
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAC8
	cmp r0, #0
	bne _0222D092
	ldr r0, [r4, #0x10]
	movs r1, #6
	movs r2, #1
	bl FUN_020087A4
_0222D092:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, pc}
_0222D09A:
	adds r0, r4, #0
	bl ov07_0222CFCC
	cmp r0, #0
	beq _0222D144
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, pc}
_0222D0AC:
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FAEC
	adds r5, r0, #0
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FB04
	adds r1, r0, #0
	lsls r0, r5, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	ldr r0, [r4]
	bl ov07_0221FAE8
	adds r1, r0, #0
	lsls r1, r1, #0x18
	movs r0, #0
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAC8
	cmp r0, #0
	bne _0222D0FA
	ldr r0, [r4, #0x10]
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
_0222D0FA:
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FAEC
	adds r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221BFD0
	adds r3, r0, #0
	lsls r0, r5, #0x18
	movs r1, #1
	lsrs r0, r0, #0x18
	lsls r1, r1, #0xe
	movs r2, #0
	bl FUN_0201C1C4
	ldr r0, [r4]
	bl ov07_0221C4A0
	adds r5, r0, #0
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FAEC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	ldr r0, [r4]
	adds r1, r6, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_0222D144:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_0222D050

	thumb_func_start ov07_0222D148
ov07_0222D148: @ 0x0222D148
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp, #0x14]
	movs r1, #0x4c
	bl ov07_022324D8
	adds r4, r0, #0
	ldr r0, [sp, #0x14]
	str r0, [r4]
	bl ov07_0221FA78
	str r0, [r4, #0x18]
	ldr r0, [r4]
	movs r1, #0
	movs r2, #0x10
	bl ov07_02231E74
	movs r2, #8
	str r2, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x1c
	movs r1, #0
	movs r3, #0x10
	bl ov07_02222AC4
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	movs r1, #0
	str r0, [r4, #0x10]
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldr r0, [r4, #0x10]
	movs r1, #0x29
	bl FUN_02008A78
	subs r0, r5, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r0, #0x28
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldr r0, [r4]
	movs r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x48]
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	cmp r0, #5
	beq _0222D1D8
	cmp r0, #2
	bne _0222D1EA
_0222D1D8:
	ldr r0, [r4, #0x48]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, [r4, #0x48]
	movs r1, #2
	bl FUN_0200DD54
	b _0222D224
_0222D1EA:
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FAEC
	adds r6, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAE8
	adds r1, r0, #0
	lsls r0, r6, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	ldr r0, [r4]
	bl ov07_0221FAE8
	adds r1, r0, #0
	adds r1, r1, #1
	lsls r1, r1, #0x18
	movs r0, #0
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	ldr r0, [r4, #0x48]
	movs r1, #0
	bl FUN_0200DCE8
_0222D224:
	adds r0, r5, #0
	adds r0, #0x50
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	str r5, [sp, #0x18]
	cmp r5, #0
	bge _0222D234
	movs r5, #0
_0222D234:
	cmp r6, #0xbf
	ble _0222D23A
	movs r6, #0xbf
_0222D23A:
	ldr r0, [sp, #0x14]
	movs r1, #1
	bl ov07_0221FAF8
	ldr r1, [sp, #0x18]
	subs r7, #0x28
	str r0, [sp, #0x1c]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	rsbs r1, r1, #0
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	bl ov07_02222D88
	adds r7, r0, #0
	ldr r0, [sp, #0x14]
	bl ov07_0221BFD0
	movs r1, #0x64
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	movs r3, #5
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r7, [sp, #0xc]
	str r0, [sp, #0x10]
	lsls r0, r5, #0x18
	lsls r1, r6, #0x18
	ldr r2, _0222D2A8 @ =0x0000038E
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0xc
	bl ov07_02222CCC
	movs r2, #1
	str r0, [r4, #0x14]
	movs r1, #0
	str r1, [sp]
	ldr r0, [r4, #0x18]
	lsls r2, r2, #8
	movs r3, #8
	bl FUN_02003EA4
	ldr r0, [r4]
	ldr r1, _0222D2AC @ =ov07_0222D050
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222D2A8: .4byte 0x0000038E
_0222D2AC: .4byte ov07_0222D050
	thumb_func_end ov07_0222D148

	thumb_func_start ov07_0222D2B0
ov07_0222D2B0: @ 0x0222D2B0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #3
	bhi _0222D3B2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222D2CA: @ jump table
	.2byte _0222D2D2 - _0222D2CA - 2 @ case 0
	.2byte _0222D322 - _0222D2CA - 2 @ case 1
	.2byte _0222D360 - _0222D2CA - 2 @ case 2
	.2byte _0222D39A - _0222D2CA - 2 @ case 3
_0222D2D2:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	bne _0222D304
	adds r0, r4, #0
	adds r0, #0x14
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x54]
	blx FUN_020F2178
	adds r1, r0, #0
	ldr r0, [sp, #8]
	blx FUN_020F22DC
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	ldr r2, [sp, #4]
	bl FUN_0200E024
	b _0222D3B2
_0222D304:
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	adds r0, r0, #1
	str r0, [r4, #0xc]
	movs r0, #5
	str r0, [r4, #0x4c]
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x14
	adds r2, r1, #0
	movs r3, #1
	bl ov07_02222508
	b _0222D3B2
_0222D322:
	adds r0, r4, #0
	adds r0, #0x38
	bl ov07_02222440
	ldr r1, [r4, #0x38]
	adds r5, r0, #0
	lsls r1, r1, #0x10
	ldr r0, [r4, #0x10]
	lsrs r1, r1, #0x10
	bl FUN_0200E074
	cmp r5, #0
	bne _0222D3B2
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	ble _0222D358
	subs r0, r0, #1
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x50]
	adds r0, #0x38
	movs r3, #4
	str r1, [r4, #0x50]
	bl ov07_022223F0
	b _0222D3B2
_0222D358:
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D3B2
_0222D360:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	bne _0222D392
	adds r0, r4, #0
	adds r0, #0x14
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x54]
	blx FUN_020F2178
	adds r1, r0, #0
	ldr r0, [sp, #8]
	blx FUN_020F22DC
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	ldr r2, [sp, #4]
	bl FUN_0200E024
	b _0222D3B2
_0222D392:
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D3B2
_0222D39A:
	ldr r0, [r4, #0x10]
	bl FUN_0200D9DC
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, pc}
_0222D3B2:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov07_0222D2B0

	thumb_func_start ov07_0222D3BC
ov07_0222D3BC: @ 0x0222D3BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r1, #0
	movs r1, #0x58
	adds r5, r0, #0
	adds r7, r2, #0
	str r3, [sp, #4]
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4]
	str r6, [r4, #4]
	str r7, [r4, #8]
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	adds r7, r0, #0
	ldr r0, [r4]
	movs r1, #0
	bl ov07_0221FB78
	cmp r0, #1
	bne _0222D3FC
	movs r0, #0
	mvns r0, r0
	str r0, [r4, #0x54]
	rsbs r6, r7, #0
	b _0222D402
_0222D3FC:
	movs r0, #1
	str r0, [r4, #0x54]
	adds r6, r7, #0
_0222D402:
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	bl ov07_02221F80
	str r0, [sp, #8]
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #1
	bl ov07_02221F80
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	movs r1, #2
	str r0, [r4, #0x10]
	bl FUN_0200DF98
	movs r1, #0xfe
	lsls r1, r1, #0x16
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	bl FUN_0200E024
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	bl FUN_0200DDB8
	movs r1, #0x28
	muls r1, r7, r1
	lsls r1, r1, #0x10
	ldr r0, [r4, #0x10]
	asrs r1, r1, #0x10
	movs r2, #0
	bl FUN_0200DED0
	ldr r0, [r4, #0x10]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0200DD54
	movs r1, #0xb
	mvns r1, r1
	muls r1, r6, r1
	lsls r1, r1, #0x10
	ldr r0, [r4, #0x10]
	asrs r1, r1, #0x10
	movs r2, #0xc
	bl FUN_0200E0CC
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	ldr r0, [r4, #0x10]
	bne _0222D494
	movs r1, #1
	bl FUN_0200DC4C
	b _0222D49A
_0222D494:
	movs r1, #0
	bl FUN_0200DC4C
_0222D49A:
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0xa
	adds r0, #0x14
	movs r1, #1
	adds r3, r2, #0
	bl ov07_02222508
	cmp r6, #0
	blt _0222D4C2
	adds r0, r4, #0
	ldr r1, _0222D4E4 @ =0x0000FF48
	ldr r2, _0222D4E8 @ =0x0000E38D
	adds r0, #0x38
	movs r3, #4
	bl ov07_022223F0
	ldr r0, _0222D4E4 @ =0x0000FF48
	b _0222D4D2
_0222D4C2:
	adds r0, r4, #0
	ldr r2, _0222D4EC @ =0x00001C71
	adds r0, #0x38
	movs r1, #0
	movs r3, #4
	bl ov07_022223F0
	movs r0, #0
_0222D4D2:
	str r0, [r4, #0x50]
	ldr r0, [r4]
	ldr r1, _0222D4F0 @ =ov07_0222D2B0
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222D4E4: .4byte 0x0000FF48
_0222D4E8: .4byte 0x0000E38D
_0222D4EC: .4byte 0x00001C71
_0222D4F0: .4byte ov07_0222D2B0
	thumb_func_end ov07_0222D3BC

	thumb_func_start ov07_0222D4F4
ov07_0222D4F4: @ 0x0222D4F4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	str r1, [r5]
	adds r6, r3, #0
	movs r3, #8
	movs r1, #0xa
	adds r4, r2, #0
	adds r0, r5, #4
	adds r2, r1, #0
	str r3, [sp]
	bl ov07_02222508
	movs r0, #3
	str r0, [r5, #0x2c]
	movs r0, #8
	str r0, [r5, #0x30]
	movs r0, #0xa
	str r0, [r5, #0x34]
	ldr r0, [sp, #0x18]
	adds r1, r4, #0
	str r0, [r5, #0x28]
	ldr r0, [r5]
	adds r2, r6, #0
	bl FUN_0200DDB8
	ldr r0, [r5]
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0200DDB8
	ldr r0, [r5]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r5]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r5]
	movs r1, #1
	bl FUN_0200DD54
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _0222D55C
	movs r2, #0xfe
	ldr r0, [r5]
	ldr r1, _0222D568 @ =0xBF800000
	lsls r2, r2, #0x16
	bl FUN_0200E024
_0222D55C:
	ldr r0, [r5]
	movs r1, #0
	bl FUN_0200DCE8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222D568: .4byte 0xBF800000
	thumb_func_end ov07_0222D4F4

	thumb_func_start ov07_0222D56C
ov07_0222D56C: @ 0x0222D56C
	ldr r3, _0222D574 @ =FUN_0200D9DC
	ldr r0, [r0]
	bx r3
	nop
_0222D574: .4byte FUN_0200D9DC
	thumb_func_end ov07_0222D56C

	thumb_func_start ov07_0222D578
ov07_0222D578: @ 0x0222D578
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0200DC78
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_0222D578

	thumb_func_start ov07_0222D590
ov07_0222D590: @ 0x0222D590
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, r4, #4
	bl ov07_02222558
	cmp r0, #1
	bne _0222D5D4
	adds r0, r4, #4
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _0222D5C6
	ldr r1, [sp, #8]
	movs r0, #0
	blx FUN_020F24C8
	adds r1, r0, #0
	movs r2, #0xfe
	ldr r0, [r4]
	lsls r2, r2, #0x16
	bl FUN_0200E024
	b _0222D606
_0222D5C6:
	movs r2, #0xfe
	ldr r0, [r4]
	ldr r1, [sp, #8]
	lsls r2, r2, #0x16
	bl FUN_0200E024
	b _0222D606
_0222D5D4:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _0222D600
	subs r0, r0, #1
	str r0, [r4, #0x2c]
	movs r0, #8
	str r0, [sp]
	ldr r1, [r4, #0x30]
	ldr r3, [r4, #0x34]
	lsls r1, r1, #0x10
	lsls r3, r3, #0x10
	adds r0, r4, #4
	asrs r1, r1, #0x10
	movs r2, #0xa
	asrs r3, r3, #0x10
	bl ov07_02222508
	ldr r1, [r4, #0x30]
	ldr r0, [r4, #0x34]
	str r0, [r4, #0x30]
	str r1, [r4, #0x34]
	b _0222D606
_0222D600:
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_0222D606:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov07_0222D590

	thumb_func_start ov07_0222D60C
ov07_0222D60C: @ 0x0222D60C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r7, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #3
	bhi _0222D6D8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222D624: @ jump table
	.2byte _0222D62C - _0222D624 - 2 @ case 0
	.2byte _0222D65E - _0222D624 - 2 @ case 1
	.2byte _0222D67C - _0222D624 - 2 @ case 2
	.2byte _0222D69C - _0222D624 - 2 @ case 3
_0222D62C:
	ldr r0, [r4, #0x10]
	cmp r0, #4
	blt _0222D656
	movs r0, #0
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	adds r2, r4, #0
	movs r0, #0x38
	adds r2, #0x44
	muls r0, r1, r0
	adds r0, r2, r0
	bl ov07_0222D578
	ldr r0, [r4, #0x14]
	adds r0, r0, #1
	str r0, [r4, #0x14]
	cmp r0, #4
	blt _0222D656
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
_0222D656:
	ldr r0, [r4, #0x10]
	adds r0, r0, #1
	str r0, [r4, #0x10]
	b _0222D6D8
_0222D65E:
	movs r1, #0x1c
	movs r2, #0x1e
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x18]
	adds r0, #0x20
	bl ov07_0222283C
	cmp r0, #0
	bne _0222D6D8
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D6D8
_0222D67C:
	adds r6, r4, #0
	movs r5, #0
	adds r6, #0x44
_0222D682:
	adds r0, r6, #0
	bl ov07_0222D590
	adds r5, r5, #1
	adds r6, #0x38
	cmp r5, #4
	blt _0222D682
	cmp r0, #0
	bne _0222D6D8
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D6D8
_0222D69C:
	movs r2, #0x1c
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x1e
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	movs r1, #1
	bl FUN_020087A4
	adds r5, r4, #0
	movs r6, #0
	adds r5, #0x44
_0222D6BA:
	adds r0, r5, #0
	bl ov07_0222D56C
	adds r6, r6, #1
	adds r5, #0x38
	cmp r6, #4
	blt _0222D6BA
	ldr r0, [r4]
	adds r1, r7, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
_0222D6D8:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222D60C

	thumb_func_start ov07_0222D6E0
ov07_0222D6E0: @ 0x0222D6E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r1, [sp, #4]
	movs r1, #0x4a
	lsls r1, r1, #2
	adds r4, r0, #0
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	bl ov07_022324D8
	adds r7, r0, #0
	ldr r0, [sp, #4]
	str r4, [r7]
	str r0, [r7, #4]
	ldr r0, [sp, #8]
	str r0, [r7, #8]
	adds r0, r4, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r7]
	bl ov07_0221FA48
	str r0, [r7, #0x18]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r7, #0x1c]
	ldr r0, [r7, #0x18]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r7, #0x1e]
	adds r0, r7, #0
	movs r3, #1
	adds r0, #0x20
	movs r1, #4
	movs r2, #0
	str r3, [sp]
	bl ov07_022227A8
	movs r0, #0x1e
	ldrsh r4, [r7, r0]
	ldr r1, [r7]
	add r0, sp, #0x14
	adds r4, #0x10
	movs r5, #0
	bl ov07_0221F9E8
	adds r0, r5, #0
	adds r6, r7, #0
	str r0, [sp, #0x10]
	adds r6, #0x44
_0222D74A:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0222D764
	str r5, [sp]
	movs r2, #0x1c
	lsls r3, r4, #0x10
	ldrsh r2, [r7, r2]
	ldr r1, [sp, #0xc]
	adds r0, r6, #0
	asrs r3, r3, #0x10
	bl ov07_0222D4F4
	b _0222D780
_0222D764:
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	add r2, sp, #0x14
	bl FUN_0200D734
	lsls r3, r4, #0x10
	adds r1, r0, #0
	str r5, [sp]
	movs r2, #0x1c
	ldrsh r2, [r7, r2]
	adds r0, r6, #0
	asrs r3, r3, #0x10
	bl ov07_0222D4F4
_0222D780:
	movs r0, #1
	eors r5, r0
	ldr r0, [sp, #0x10]
	subs r4, #0xa
	adds r0, r0, #1
	adds r6, #0x38
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _0222D74A
	ldr r0, [r7]
	ldr r1, _0222D7A0 @ =ov07_0222D60C
	adds r2, r7, #0
	bl ov07_0221C410
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222D7A0: .4byte ov07_0222D60C
	thumb_func_end ov07_0222D6E0

	thumb_func_start ov07_0222D7A4
ov07_0222D7A4: @ 0x0222D7A4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #6
	bls _0222D7B4
	b _0222D966
_0222D7B4:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222D7C0: @ jump table
	.2byte _0222D7CE - _0222D7C0 - 2 @ case 0
	.2byte _0222D810 - _0222D7C0 - 2 @ case 1
	.2byte _0222D870 - _0222D7C0 - 2 @ case 2
	.2byte _0222D8B0 - _0222D7C0 - 2 @ case 3
	.2byte _0222D8D0 - _0222D7C0 - 2 @ case 4
	.2byte _0222D90E - _0222D7C0 - 2 @ case 5
	.2byte _0222D94E - _0222D7C0 - 2 @ case 6
_0222D7CE:
	adds r0, r4, #0
	adds r0, #0x18
	bl ov07_022222B4
	cmp r0, #0
	beq _0222D7F0
	movs r2, #0x14
	movs r3, #0x16
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0x10]
	adds r0, #0x18
	bl ov07_022220B8
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0222D7F0:
	movs r2, #0
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r1, #0x18
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	adds r0, #0x18
	adds r3, r2, #0
	bl ov07_02222268
	ldr r0, [r4, #0xc]
	add sp, #0x10
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
_0222D810:
	adds r0, r4, #0
	adds r0, #0x18
	bl ov07_022222B4
	cmp r0, #0
	beq _0222D832
	movs r2, #0x14
	movs r3, #0x16
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0x10]
	adds r0, #0x18
	bl ov07_022220B8
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0222D832:
	movs r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_020087A4
	movs r1, #0
	str r1, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r2, [r4, #0x3c]
	adds r0, r4, #0
	lsls r2, r2, #5
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	adds r0, #0x18
	asrs r2, r2, #0x10
	adds r3, r1, #0
	bl ov07_02222268
	ldr r0, [r4, #0xc]
	add sp, #0x10
	adds r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
_0222D870:
	adds r0, r4, #0
	ldr r2, [r4, #0x48]
	adds r0, #0x4c
	adds r1, #0x70
	bl ov07_022223CC
	cmp r0, #0
	bne _0222D966
	movs r0, #0x46
	ldrsh r0, [r4, r0]
	adds r1, r4, #0
	movs r2, #0x44
	str r0, [sp]
	movs r0, #0x16
	ldrsh r0, [r4, r0]
	movs r3, #0x14
	adds r1, #0x70
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	ldr r0, _0222D970 @ =0xFFFE0000
	str r0, [sp, #0xc]
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	adds r0, #0x4c
	bl ov07_02222338
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D966
_0222D8B0:
	adds r0, r4, #0
	ldr r2, [r4, #0x48]
	adds r0, #0x4c
	adds r1, #0x70
	bl ov07_022223CC
	cmp r0, #0
	bne _0222D966
	ldr r0, [r4, #0x48]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D966
_0222D8D0:
	adds r0, r4, #0
	adds r0, #0x18
	bl ov07_022222B4
	cmp r0, #0
	beq _0222D8F0
	movs r2, #0x14
	movs r3, #0x16
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0x10]
	adds r0, #0x18
	bl ov07_022220B8
	b _0222D966
_0222D8F0:
	movs r2, #0
	str r2, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r1, #0x18
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	adds r0, #0x18
	adds r3, r2, #0
	bl ov07_02222268
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D966
_0222D90E:
	adds r0, r4, #0
	adds r0, #0x18
	bl ov07_022222B4
	cmp r0, #0
	beq _0222D92E
	movs r2, #0x14
	movs r3, #0x16
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0x10]
	adds r0, #0x18
	bl ov07_022220B8
	b _0222D966
_0222D92E:
	movs r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_020087A4
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D966
_0222D94E:
	ldr r0, [r4, #0x48]
	bl FUN_0200D9DC
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0222D966:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222D970: .4byte 0xFFFE0000
	thumb_func_end ov07_0222D7A4

	thumb_func_start ov07_0222D974
ov07_0222D974: @ 0x0222D974
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r1, #0
	movs r1, #0x94
	adds r5, r0, #0
	str r2, [sp, #0x10]
	adds r6, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4]
	ldr r0, [sp, #0x10]
	str r7, [r4, #4]
	str r0, [r4, #8]
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	str r0, [r4, #0x3c]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0x16]
	movs r1, #0
	str r1, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r2, [r4, #0x3c]
	adds r0, r4, #0
	lsls r2, r2, #4
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	adds r0, #0x18
	asrs r2, r2, #0x10
	adds r3, r1, #0
	bl ov07_02222268
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	movs r1, #0
	str r0, [r4, #0x40]
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0x44
	strh r0, [r1]
	ldr r0, [r4, #0x40]
	movs r1, #1
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0x46
	strh r0, [r1]
	adds r0, r6, #0
	movs r1, #1
	str r6, [r4, #0x48]
	bl FUN_0200DC78
	ldr r0, [r4, #0x48]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0x48]
	movs r1, #1
	bl FUN_0200DD54
	movs r0, #0x16
	ldrsh r0, [r4, r0]
	adds r1, r4, #0
	movs r2, #0x14
	str r0, [sp]
	movs r0, #0x46
	ldrsh r0, [r4, r0]
	movs r3, #0x44
	adds r1, #0x70
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #2
	lsls r0, r0, #0x10
	str r0, [sp, #0xc]
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	adds r0, #0x4c
	bl ov07_02222338
	ldr r0, [r4]
	ldr r1, _0222DA5C @ =ov07_0222D7A4
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0222DA5C: .4byte ov07_0222D7A4
	thumb_func_end ov07_0222D974

	thumb_func_start ov07_0222DA60
ov07_0222DA60: @ 0x0222DA60
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r2, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _0222DB0A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222DA7A: @ jump table
	.2byte _0222DA82 - _0222DA7A - 2 @ case 0
	.2byte _0222DAAE - _0222DA7A - 2 @ case 1
	.2byte _0222DAD2 - _0222DA7A - 2 @ case 2
	.2byte _0222DAF8 - _0222DA7A - 2 @ case 3
_0222DA82:
	movs r2, #0x1a
	ldrsh r3, [r4, r2]
	movs r2, #0x68
	ldrsh r2, [r4, r2]
	movs r1, #0x18
	ldrsh r1, [r4, r1]
	subs r2, r3, r2
	adds r0, r4, #0
	lsls r2, r2, #0x10
	ldr r3, [r4, #0x14]
	adds r0, #0x1c
	asrs r2, r2, #0x10
	bl ov07_02222218
	cmp r0, #0
	bne _0222DB0A
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0x10
	str r0, [r4, #0xc]
	b _0222DB0A
_0222DAAE:
	ldr r0, [r4, #0xc]
	subs r0, r0, #1
	str r0, [r4, #0xc]
	bpl _0222DB0A
	ldr r0, [r4, #8]
	movs r2, #0x10
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x40
	adds r3, r2, #0
	bl ov07_02222AC4
	b _0222DB0A
_0222DAD2:
	adds r0, r4, #0
	adds r0, #0x40
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222DB0A
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, [r4, #0x10]
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0222DB0A
_0222DAF8:
	ldr r0, [r4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r4, pc}
_0222DB0A:
	ldr r0, [r4, #4]
	bl FUN_0200D020
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_0222DA60

	thumb_func_start ov07_0222DB14
ov07_0222DB14: @ 0x0222DB14
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r1, #0x6c
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4]
	adds r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0x18]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0x1a]
	ldr r0, [r4, #0x10]
	movs r1, #0x29
	bl FUN_02008A78
	adds r1, r4, #0
	adds r1, #0x68
	strh r0, [r1]
	movs r0, #0x1a
	ldrsh r0, [r4, r0]
	movs r1, #0
	adds r0, #8
	strh r0, [r4, #0x1a]
	ldr r0, [r4]
	bl ov07_0221C4E8
	str r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #0x10]
	movs r1, #6
	movs r2, #1
	bl FUN_020087A4
	adds r0, r4, #0
	adds r0, #0x1c
	movs r1, #2
	movs r2, #0x10
	bl ov07_02222A44
	ldr r0, [r4]
	movs r1, #0x10
	movs r2, #0
	bl ov07_02231E08
	movs r1, #0x10
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	adds r0, #0x40
	adds r3, r2, #0
	bl ov07_02222AC4
	ldr r0, [r4, #0x28]
	adds r2, r4, #0
	adds r1, r0, #0
	muls r1, r6, r1
	str r1, [r4, #0x28]
	ldr r0, [r4]
	ldr r1, _0222DBD4 @ =ov07_0222DA60
	bl ov07_0221C410
	ldr r0, [r4, #4]
	bl FUN_0200D020
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222DBD4: .4byte ov07_0222DA60
	thumb_func_end ov07_0222DB14

	thumb_func_start ov07_0222DBD8
ov07_0222DBD8: @ 0x0222DBD8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	movs r4, #0
	cmp r0, #0
	beq _0222DBEE
	cmp r0, #1
	beq _0222DC22
	cmp r0, #2
	beq _0222DC4E
	b _0222DC50
_0222DBEE:
	adds r0, r5, #0
	adds r0, #0x14
	bl ov07_02222558
	cmp r0, #0
	beq _0222DC08
	movs r2, #0x16
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #0x10]
	movs r1, #0xd
	bl FUN_020087A4
	b _0222DC50
_0222DC08:
	ldr r0, [r5, #0x38]
	movs r2, #0xa
	adds r0, r0, #1
	str r0, [r5, #0x38]
	movs r0, #0xc
	adds r5, #0x14
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r3, r2, #0
	bl ov07_02222508
	b _0222DC50
_0222DC22:
	adds r0, r5, #0
	adds r0, #0x14
	bl ov07_02222558
	cmp r0, #0
	ldr r0, [r5, #0x10]
	beq _0222DC3C
	movs r2, #0x16
	ldrsh r2, [r5, r2]
	movs r1, #0xd
	bl FUN_020087A4
	b _0222DC50
_0222DC3C:
	movs r1, #0xd
	adds r2, r1, #0
	adds r2, #0xf3
	bl FUN_020087A4
	ldr r0, [r5, #0x38]
	adds r0, r0, #1
	str r0, [r5, #0x38]
	b _0222DC50
_0222DC4E:
	movs r4, #1
_0222DC50:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222DBD8

	thumb_func_start ov07_0222DC54
ov07_0222DC54: @ 0x0222DC54
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	movs r4, #0
	cmp r0, #0
	beq _0222DC6C
	cmp r0, #1
	beq _0222DCB2
	cmp r0, #2
	beq _0222DCCE
	b _0222DCD0
_0222DC6C:
	adds r0, r5, #0
	ldr r1, [r5, #0x3c]
	adds r0, #0x44
	bl ov07_02222748
	adds r0, r5, #0
	adds r0, #0x68
	bl ov07_022222B4
	cmp r0, #0
	beq _0222DC96
	movs r2, #0xb4
	movs r3, #0xb6
	adds r0, r5, #0
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	ldr r1, [r5, #0x3c]
	adds r0, #0x68
	bl ov07_0222207C
	b _0222DCD0
_0222DC96:
	ldr r0, [r5, #0x40]
	movs r1, #0x10
	adds r0, r0, #1
	str r0, [r5, #0x40]
	str r1, [sp]
	movs r0, #8
	adds r5, #0x8c
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0xe
	bl ov07_02222AC4
	b _0222DCD0
_0222DCB2:
	adds r0, r5, #0
	adds r0, #0x8c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222DCD0
	ldr r0, [r5, #0x3c]
	adds r1, r4, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x40]
	adds r0, r0, #1
	str r0, [r5, #0x40]
	b _0222DCD0
_0222DCCE:
	movs r4, #1
_0222DCD0:
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0222DC54

	thumb_func_start ov07_0222DCD8
ov07_0222DCD8: @ 0x0222DCD8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0222DCEA
	cmp r0, #1
	beq _0222DD02
	b _0222DD18
_0222DCEA:
	adds r0, r4, #0
	bl ov07_0222DBD8
	adds r0, r4, #0
	bl ov07_0222DC54
	cmp r0, #0
	beq _0222DD18
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222DD18
_0222DD02:
	ldr r0, [r4, #0x3c]
	bl FUN_0200D9DC
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
_0222DD18:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222DCD8

	thumb_func_start ov07_0222DD20
ov07_0222DD20: @ 0x0222DD20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	movs r1, #0xb8
	adds r6, r0, #0
	adds r7, r2, #0
	str r3, [sp, #8]
	bl ov07_022324D8
	adds r4, r0, #0
	str r6, [r4]
	str r5, [r4, #4]
	str r7, [r4, #8]
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	str r0, [sp, #0xc]
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0222202C
	adds r5, r0, #0
	adds r0, r6, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	movs r1, #0
	str r0, [r4, #0x10]
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #0xc
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	adds r0, #0x14
	adds r2, r1, #0
	movs r3, #0xf
	bl ov07_02222508
	ldr r0, [sp, #8]
	movs r1, #1
	str r0, [r4, #0x3c]
	bl FUN_0200DC78
	ldr r0, [r4, #0x3c]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r4, #0x3c]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #0x3c]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0x3c]
	movs r1, #1
	bl FUN_0200DD54
	ldr r0, [sp, #0xc]
	lsls r0, r0, #5
	adds r1, r7, r0
	adds r0, r4, #0
	adds r0, #0xb4
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xb6
	strh r6, [r0]
	cmp r5, #0
	bge _0222DDD6
	movs r1, #7
	b _0222DDD8
_0222DDD6:
	movs r1, #0x17
_0222DDD8:
	mvns r1, r1
	adds r0, r1, #0
	muls r0, r5, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r1, #0
	movs r0, #0x20
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x68
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov07_02222268
	movs r0, #0x20
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #5
	movs r2, #0xa
	movs r3, #0xc
	bl ov07_02222508
	movs r0, #0x1a
	str r0, [sp]
	ldr r0, _0222DE28 @ =0x04000050
	movs r1, #0
	movs r2, #0x3f
	movs r3, #0x1f
	blx FUN_020CF15C
	ldr r0, [r4]
	ldr r1, _0222DE2C @ =ov07_0222DCD8
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DE28: .4byte 0x04000050
_0222DE2C: .4byte ov07_0222DCD8
	thumb_func_end ov07_0222DD20

	thumb_func_start ov07_0222DE30
ov07_0222DE30: @ 0x0222DE30
	push {r3, lr}
	sub sp, #8
	ldr r1, [r0, #0x68]
	cmp r1, #5
	bhi _0222DEE4
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0222DE46: @ jump table
	.2byte _0222DE52 - _0222DE46 - 2 @ case 0
	.2byte _0222DE68 - _0222DE46 - 2 @ case 1
	.2byte _0222DE82 - _0222DE46 - 2 @ case 2
	.2byte _0222DE9C - _0222DE46 - 2 @ case 3
	.2byte _0222DEB6 - _0222DE46 - 2 @ case 4
	.2byte _0222DECC - _0222DE46 - 2 @ case 5
_0222DE52:
	movs r2, #0x28
	str r2, [sp]
	movs r1, #8
	str r1, [sp, #4]
	movs r1, #0
	adds r0, #0x18
	adds r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222DE68:
	movs r1, #0x4f
	mvns r1, r1
	str r1, [sp]
	movs r1, #8
	str r1, [sp, #4]
	movs r1, #0
	adds r0, #0x18
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222DE82:
	movs r1, #0x50
	str r1, [sp]
	movs r1, #8
	str r1, [sp, #4]
	movs r1, #0
	adds r2, r1, #0
	adds r0, #0x18
	subs r2, #0x50
	adds r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222DE9C:
	movs r1, #0x4f
	mvns r1, r1
	str r1, [sp]
	movs r1, #8
	str r1, [sp, #4]
	movs r1, #0
	adds r0, #0x18
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222DEB6:
	movs r2, #0x50
	str r2, [sp]
	movs r1, #8
	str r1, [sp, #4]
	movs r1, #0
	adds r0, #0x18
	adds r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222DECC:
	movs r2, #0x27
	mvns r2, r2
	str r2, [sp]
	movs r1, #8
	str r1, [sp, #4]
	movs r1, #0
	adds r0, #0x18
	adds r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222DEE4:
	bl GF_AssertFail
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov07_0222DE30

	thumb_func_start ov07_0222DEEC
ov07_0222DEEC: @ 0x0222DEEC
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bls _0222DEFC
	b _0222E010
_0222DEFC:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222DF08: @ jump table
	.2byte _0222DF12 - _0222DF08 - 2 @ case 0
	.2byte _0222DF2E - _0222DF08 - 2 @ case 1
	.2byte _0222DFB0 - _0222DF08 - 2 @ case 2
	.2byte _0222DFE6 - _0222DF08 - 2 @ case 3
	.2byte _0222DFF8 - _0222DF08 - 2 @ case 4
_0222DF12:
	ldr r0, [r4, #0x6c]
	adds r0, r0, #1
	str r0, [r4, #0x6c]
	cmp r0, #4
	ble _0222E010
	adds r0, r4, #0
	bl ov07_0222DE30
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	movs r0, #0
	str r0, [r4, #0x6c]
	b _0222E010
_0222DF2E:
	adds r0, r4, #0
	adds r0, #0x18
	bl ov07_022222B4
	cmp r0, #0
	beq _0222DF4E
	movs r2, #0x64
	movs r3, #0x66
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0x14]
	adds r0, #0x18
	bl ov07_0222207C
	b _0222E010
_0222DF4E:
	ldr r0, [r4, #0x68]
	adds r0, r0, #1
	str r0, [r4, #0x68]
	cmp r0, #6
	bge _0222DF7E
	movs r0, #0
	str r0, [r4, #0xc]
	movs r0, #0x64
	ldrsh r1, [r4, r0]
	movs r0, #0x18
	ldrsh r0, [r4, r0]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	movs r0, #0x66
	ldrsh r1, [r4, r0]
	movs r0, #0x1a
	ldrsh r0, [r4, r0]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x66
	strh r1, [r0]
	b _0222E010
_0222DF7E:
	ldr r0, [r4, #0xc]
	movs r1, #1
	adds r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x14]
	bl FUN_0200E0FC
	movs r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	str r1, [sp]
	adds r0, #0x3c
	adds r3, r2, #0
	str r1, [sp, #4]
	bl ov07_02222AC4
	ldr r0, _0222E01C @ =0x00007FFF
	movs r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x10]
	movs r2, #0xa
	adds r3, r1, #0
	bl FUN_020090B4
	b _0222E010
_0222DFB0:
	adds r0, r4, #0
	adds r0, #0x3c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222DFC4
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0200DCE8
_0222DFC4:
	ldr r0, [r4, #0x10]
	bl FUN_02009138
	cmp r0, #0
	bne _0222E010
	ldr r0, [r4, #0xc]
	movs r2, #0
	adds r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, _0222E01C @ =0x00007FFF
	movs r1, #0xa
	str r0, [sp]
	ldr r0, [r4, #0x10]
	adds r3, r2, #0
	bl FUN_020090B4
	b _0222E010
_0222DFE6:
	ldr r0, [r4, #0x10]
	bl FUN_02009138
	cmp r0, #0
	bne _0222E010
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222E010
_0222DFF8:
	ldr r0, [r4, #0x14]
	bl FUN_0200D9DC
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, pc}
_0222E010:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0222E01C: .4byte 0x00007FFF
	thumb_func_end ov07_0222DEEC

	thumb_func_start ov07_0222E020
ov07_0222E020: @ 0x0222E020
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	movs r1, #0x70
	adds r5, r0, #0
	str r2, [sp]
	adds r6, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4]
	ldr r0, [sp]
	str r7, [r4, #4]
	str r0, [r4, #8]
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	str r6, [r4, #0x14]
	adds r0, r6, #0
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0200DD54
	adds r1, r4, #0
	adds r2, r4, #0
	ldr r0, [r4, #0x14]
	adds r1, #0x64
	adds r2, #0x66
	bl FUN_0200DE44
	ldr r0, [r4]
	ldr r1, _0222E078 @ =ov07_0222DEEC
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E078: .4byte ov07_0222DEEC
	thumb_func_end ov07_0222E020

	thumb_func_start ov07_0222E07C
ov07_0222E07C: @ 0x0222E07C
	push {r3, lr}
	sub sp, #8
	ldr r1, [r0, #0x50]
	cmp r1, #3
	bhi _0222E0FE
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0222E092: @ jump table
	.2byte _0222E09A - _0222E092 - 2 @ case 0
	.2byte _0222E0B0 - _0222E092 - 2 @ case 1
	.2byte _0222E0CA - _0222E092 - 2 @ case 2
	.2byte _0222E0E4 - _0222E092 - 2 @ case 3
_0222E09A:
	movs r2, #0x50
	str r2, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r1, #0
	adds r0, #0x28
	adds r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222E0B0:
	movs r1, #0x4f
	mvns r1, r1
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r1, #0
	adds r0, #0x28
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222E0CA:
	movs r1, #0x50
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r1, #0
	adds r2, r1, #0
	adds r0, #0x28
	subs r2, #0x50
	adds r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222E0E4:
	movs r1, #0x27
	mvns r1, r1
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	movs r1, #0
	adds r0, #0x28
	movs r2, #0x28
	adds r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222E0FE:
	bl GF_AssertFail
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov07_0222E07C

	thumb_func_start ov07_0222E108
ov07_0222E108: @ 0x0222E108
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #6
	bhi _0222E212
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222E122: @ jump table
	.2byte _0222E130 - _0222E122 - 2 @ case 0
	.2byte _0222E14C - _0222E122 - 2 @ case 1
	.2byte _0222E1B8 - _0222E122 - 2 @ case 2
	.2byte _0222E214 - _0222E122 - 2 @ case 3
	.2byte _0222E276 - _0222E122 - 2 @ case 4
	.2byte _0222E296 - _0222E122 - 2 @ case 5
	.2byte _0222E2C4 - _0222E122 - 2 @ case 6
_0222E130:
	ldr r0, [r4, #0x54]
	adds r0, r0, #1
	str r0, [r4, #0x54]
	cmp r0, #1
	ble _0222E212
	adds r0, r4, #0
	bl ov07_0222E07C
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	movs r0, #0
	str r0, [r4, #0x54]
	b _0222E2DC
_0222E14C:
	adds r0, r4, #0
	adds r0, #0x28
	bl ov07_022222B4
	cmp r0, #0
	beq _0222E16C
	movs r2, #0x4c
	movs r3, #0x4e
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0x24]
	adds r0, #0x28
	bl ov07_0222207C
	b _0222E2DC
_0222E16C:
	ldr r0, [r4, #0x50]
	adds r0, r0, #1
	str r0, [r4, #0x50]
	cmp r0, #4
	bge _0222E19C
	movs r0, #0
	str r0, [r4, #0xc]
	movs r0, #0x4c
	ldrsh r1, [r4, r0]
	movs r0, #0x28
	ldrsh r0, [r4, r0]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x4c
	strh r1, [r0]
	movs r0, #0x4e
	ldrsh r1, [r4, r0]
	movs r0, #0x2a
	ldrsh r0, [r4, r0]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x4e
	strh r1, [r0]
	b _0222E2DC
_0222E19C:
	ldr r0, [r4, #0xc]
	movs r1, #1
	adds r0, r0, #1
	str r0, [r4, #0xc]
	movs r0, #8
	str r0, [r4, #0x54]
	ldr r0, [r4, #0x24]
	bl FUN_0200DC4C
	ldr r0, [r4, #0x24]
	movs r1, #1
	bl FUN_0200DC78
	b _0222E2DC
_0222E1B8:
	ldr r0, [r4, #0x54]
	subs r0, r0, #1
	str r0, [r4, #0x54]
	bpl _0222E212
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	bl ov07_0221FA78
	adds r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221E6C8
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0222E2E8 @ =0x0000FFFF
	movs r1, #1
	lsls r2, r2, #0x10
	adds r3, r1, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	lsrs r2, r2, #0x10
	subs r3, #9
	bl FUN_02003370
	ldr r7, _0222E2E8 @ =0x0000FFFF
	movs r6, #0
	adds r5, r4, #0
_0222E1F8:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _0222E20A
	movs r1, #0xe
	movs r2, #0x10
	movs r3, #0
	str r7, [sp]
	bl FUN_020090B4
_0222E20A:
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #4
	blt _0222E1F8
_0222E212:
	b _0222E2DC
_0222E214:
	ldr r0, [r4]
	bl ov07_0221FA78
	bl FUN_02003B44
	cmp r0, #0
	bne _0222E2DC
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	bl ov07_0221FA78
	adds r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221E6C8
	adds r2, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0222E2E8 @ =0x0000FFFF
	movs r1, #1
	lsls r2, r2, #0x10
	adds r3, r1, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	lsrs r2, r2, #0x10
	subs r3, #9
	bl FUN_02003370
	ldr r7, _0222E2E8 @ =0x0000FFFF
	movs r6, #0
	adds r5, r4, #0
_0222E25A:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _0222E26C
	movs r2, #0
	movs r1, #2
	adds r3, r2, #0
	str r7, [sp]
	bl FUN_020090B4
_0222E26C:
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #4
	blt _0222E25A
	b _0222E2DC
_0222E276:
	ldr r0, [r4]
	bl ov07_0221FA78
	bl FUN_02003B44
	cmp r0, #0
	bne _0222E2DC
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	movs r0, #4
	str r0, [r4, #0x54]
	str r0, [r4, #0x50]
	movs r0, #0
	str r0, [r4, #0x58]
	b _0222E2DC
_0222E296:
	ldr r0, [r4, #0x54]
	subs r0, r0, #1
	str r0, [r4, #0x54]
	bpl _0222E2DC
	movs r0, #4
	str r0, [r4, #0x54]
	ldr r0, [r4, #0x50]
	subs r0, r0, #1
	str r0, [r4, #0x50]
	bpl _0222E2B2
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222E2DC
_0222E2B2:
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x58]
	bl FUN_0200DCE8
	ldr r1, [r4, #0x58]
	movs r0, #1
	eors r0, r1
	str r0, [r4, #0x58]
	b _0222E2DC
_0222E2C4:
	ldr r0, [r4, #0x24]
	bl FUN_0200D9DC
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0222E2DC:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0222E2E8: .4byte 0x0000FFFF
	thumb_func_end ov07_0222E108

	thumb_func_start ov07_0222E2EC
ov07_0222E2EC: @ 0x0222E2EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r1, #0
	movs r1, #0x5c
	adds r4, r0, #0
	str r2, [sp, #4]
	adds r7, r3, #0
	bl ov07_022324D8
	adds r6, r0, #0
	str r4, [r6]
	ldr r0, [sp, #4]
	str r5, [r6, #4]
	str r0, [r6, #8]
	adds r0, r4, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	str r0, [r6, #0x10]
	movs r4, #0
	adds r5, r6, #0
_0222E31C:
	ldr r0, [r6]
	adds r1, r4, #0
	bl ov07_0221FA48
	str r0, [r5, #0x14]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0222E31C
	str r7, [r6, #0x24]
	adds r0, r7, #0
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r6, #0x24]
	movs r1, #1
	bl FUN_0200DD54
	adds r1, r6, #0
	adds r2, r6, #0
	ldr r0, [r6, #0x24]
	adds r1, #0x4c
	adds r2, #0x4e
	bl FUN_0200DE44
	movs r1, #0x4c
	ldrsh r2, [r6, r1]
	adds r0, r6, #0
	adds r0, #0x4c
	subs r2, #0x28
	strh r2, [r0]
	movs r2, #0x4e
	ldrsh r3, [r6, r2]
	adds r0, r6, #0
	adds r0, #0x4e
	subs r3, #0x28
	strh r3, [r0]
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r6, #0x24]
	bl FUN_0200DDB8
	ldr r0, [r6, #0x24]
	movs r1, #1
	bl FUN_0200E0FC
	movs r0, #0xf
	mvns r0, r0
	str r0, [r6, #0x54]
	movs r0, #0x1a
	str r0, [sp]
	ldr r0, _0222E39C @ =0x04000050
	movs r1, #0
	movs r2, #0x3f
	movs r3, #0x1f
	blx FUN_020CF15C
	ldr r0, [r6]
	ldr r1, _0222E3A0 @ =ov07_0222E108
	adds r2, r6, #0
	bl ov07_0221C410
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222E39C: .4byte 0x04000050
_0222E3A0: .4byte ov07_0222E108
	thumb_func_end ov07_0222E2EC

	thumb_func_start ov07_0222E3A4
ov07_0222E3A4: @ 0x0222E3A4
	push {r3, r4, r5, lr}
	ldr r2, _0222E3E4 @ =0x00000AAA
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, #0x10
	movs r1, #0
	movs r3, #3
	bl ov07_02222418
	cmp r5, #0
	beq _0222E3D0
	movs r0, #0
	ldr r1, [r4, #0x18]
	mvns r0, r0
	muls r0, r1, r0
	str r0, [r4, #0x18]
	ldr r0, [r4, #8]
	movs r1, #0xa
	movs r2, #0x10
	bl FUN_020087A4
	b _0222E3DC
_0222E3D0:
	movs r1, #0xa
	adds r2, r1, #0
	ldr r0, [r4, #8]
	subs r2, #0x1a
	bl FUN_020087A4
_0222E3DC:
	movs r0, #0
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222E3E4: .4byte 0x00000AAA
	thumb_func_end ov07_0222E3A4

	thumb_func_start ov07_0222E3E8
ov07_0222E3E8: @ 0x0222E3E8
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	movs r5, #0
	cmp r0, #3
	bhi _0222E4F2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222E402: @ jump table
	.2byte _0222E40A - _0222E402 - 2 @ case 0
	.2byte _0222E44A - _0222E402 - 2 @ case 1
	.2byte _0222E4A6 - _0222E402 - 2 @ case 2
	.2byte _0222E4F0 - _0222E402 - 2 @ case 3
_0222E40A:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_02222468
	ldr r0, [r4, #8]
	ldr r2, [r4, #0x10]
	movs r1, #9
	bl FUN_020087A4
	ldr r0, [r4, #0x50]
	subs r0, r0, #1
	str r0, [r4, #0x50]
	bpl _0222E4F2
	ldr r0, [r4, #0x4c]
	adds r0, r0, #1
	str r0, [r4, #0x4c]
	movs r0, #0xe
	ldrsh r3, [r4, r0]
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	adds r0, r3, #2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #2
	adds r4, #0x24
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov07_02222268
	b _0222E4F2
_0222E44A:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_02222468
	cmp r0, #0
	beq _0222E460
	ldr r0, [r4, #8]
	ldr r2, [r4, #0x10]
	movs r1, #9
	bl FUN_020087A4
_0222E460:
	adds r0, r4, #0
	ldr r1, [r4, #8]
	adds r0, #0x24
	bl ov07_02222314
	cmp r0, #0
	bne _0222E4F2
	ldr r0, [r4, #0x4c]
	movs r2, #0
	adds r0, r0, #1
	str r0, [r4, #0x4c]
	ldr r1, [r4, #0x10]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	adds r0, #0x10
	asrs r1, r1, #0x10
	movs r3, #3
	bl ov07_02222418
	movs r0, #0xe
	ldrsh r3, [r4, r0]
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #2
	adds r4, #0x24
	str r3, [sp]
	adds r3, r3, #2
	lsls r3, r3, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r1, #0
	asrs r3, r3, #0x10
	bl ov07_02222268
	b _0222E4F2
_0222E4A6:
	adds r0, r4, #0
	ldr r1, [r4, #8]
	adds r0, #0x24
	bl ov07_02222314
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_02222468
	cmp r0, #0
	ldr r0, [r4, #8]
	beq _0222E4C8
	ldr r2, [r4, #0x10]
	movs r1, #9
	bl FUN_020087A4
	b _0222E4F2
_0222E4C8:
	movs r2, #0xc
	ldrsh r2, [r4, r2]
	adds r1, r5, #0
	bl FUN_020087A4
	movs r2, #0xe
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	movs r1, #1
	bl FUN_020087A4
	ldr r0, [r4, #8]
	movs r1, #9
	adds r2, r5, #0
	bl FUN_020087A4
	ldr r0, [r4, #0x4c]
	adds r0, r0, #1
	str r0, [r4, #0x4c]
	b _0222E4F2
_0222E4F0:
	movs r5, #1
_0222E4F2:
	adds r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222E3E8

	thumb_func_start ov07_0222E4F8
ov07_0222E4F8: @ 0x0222E4F8
	push {r4, lr}
	adds r4, r1, #0
	adds r2, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0222E50A
	cmp r0, #1
	beq _0222E53C
	pop {r4, pc}
_0222E50A:
	adds r0, r4, #0
	bl ov07_0222E3E8
	cmp r0, #0
	beq _0222E54A
	ldr r0, [r4, #0x48]
	adds r0, r0, #1
	str r0, [r4, #0x48]
	cmp r0, #4
	bge _0222E534
	ldr r1, [r4, #0x54]
	movs r0, #1
	eors r1, r0
	adds r0, r4, #0
	str r1, [r4, #0x54]
	bl ov07_0222E3A4
	adds r0, r4, #0
	bl ov07_0222E3E8
	pop {r4, pc}
_0222E534:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222E53C:
	ldr r0, [r4, #4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_0222E54A:
	pop {r4, pc}
	thumb_func_end ov07_0222E4F8

	thumb_func_start ov07_0222E54C
ov07_0222E54C: @ 0x0222E54C
	push {r4, r5, r6, lr}
	movs r1, #0x58
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4, #4]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_02222004
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4A8
	cmp r0, #0
	bne _0222E598
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #8]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0xc]
	ldr r0, [r4, #8]
	movs r1, #1
	bl FUN_02008A78
	b _0222E5B8
_0222E598:
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #8]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0xc]
	ldr r0, [r4, #8]
	movs r1, #1
	bl FUN_02008A78
_0222E5B8:
	strh r0, [r4, #0xe]
	ldr r0, [r4, #8]
	movs r1, #0xb
	movs r2, #0x32
	bl FUN_020087A4
	cmp r6, #1
	bne _0222E5CC
	movs r0, #0
	b _0222E5CE
_0222E5CC:
	movs r0, #1
_0222E5CE:
	str r0, [r4, #0x54]
	ldr r1, [r4, #0x54]
	adds r0, r4, #0
	bl ov07_0222E3A4
	ldr r0, [r4, #4]
	ldr r1, _0222E5E4 @ =ov07_0222E4F8
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222E5E4: .4byte ov07_0222E4F8
	thumb_func_end ov07_0222E54C

	thumb_func_start ov07_0222E5E8
ov07_0222E5E8: @ 0x0222E5E8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	movs r5, #0
	cmp r0, #3
	bhi _0222E6A4
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222E600: @ jump table
	.2byte _0222E608 - _0222E600 - 2 @ case 0
	.2byte _0222E638 - _0222E600 - 2 @ case 1
	.2byte _0222E65A - _0222E600 - 2 @ case 2
	.2byte _0222E68A - _0222E600 - 2 @ case 3
_0222E608:
	adds r0, r4, #0
	ldr r1, [r4, #0xc]
	adds r0, #0x10
	bl ov07_02222768
	cmp r0, #0
	beq _0222E630
	adds r0, r5, #0
	str r0, [sp]
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov07_022226C4
	b _0222E6A4
_0222E630:
	ldr r0, [r4, #0x38]
	adds r0, r0, #1
	str r0, [r4, #0x38]
	b _0222E6A4
_0222E638:
	ldr r0, [r4, #0x34]
	subs r0, r0, #1
	str r0, [r4, #0x34]
	bpl _0222E6A4
	ldr r0, [r4, #0x38]
	movs r2, #0xa
	adds r0, r0, #1
	str r0, [r4, #0x38]
	movs r0, #8
	adds r4, #0x10
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xf
	adds r3, r2, #0
	bl ov07_02222508
	b _0222E6A4
_0222E65A:
	adds r0, r4, #0
	ldr r1, [r4, #0xc]
	adds r0, #0x10
	bl ov07_02222768
	cmp r0, #0
	beq _0222E682
	adds r0, r5, #0
	str r0, [sp]
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov07_022226C4
	b _0222E6A4
_0222E682:
	ldr r0, [r4, #0x38]
	adds r0, r0, #1
	str r0, [r4, #0x38]
	b _0222E6A4
_0222E68A:
	movs r1, #0xc
	adds r2, r1, #0
	ldr r0, [r4, #0xc]
	adds r2, #0xf4
	bl FUN_020087A4
	movs r1, #0xd
	adds r2, r1, #0
	ldr r0, [r4, #0xc]
	adds r2, #0xf3
	bl FUN_020087A4
	movs r5, #1
_0222E6A4:
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222E5E8

	thumb_func_start ov07_0222E6A8
ov07_0222E6A8: @ 0x0222E6A8
	push {r4, lr}
	adds r4, r1, #0
	adds r2, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222E6BE
	cmp r0, #1
	beq _0222E6D4
	cmp r0, #2
	beq _0222E6E4
	pop {r4, pc}
_0222E6BE:
	adds r0, r4, #0
	bl ov07_0222E5E8
	cmp r0, #0
	beq _0222E6F2
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0x10
	str r0, [r4, #8]
	pop {r4, pc}
_0222E6D4:
	ldr r0, [r4, #8]
	subs r0, r0, #1
	str r0, [r4, #8]
	bpl _0222E6F2
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, pc}
_0222E6E4:
	ldr r0, [r4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_0222E6F2:
	pop {r4, pc}
	thumb_func_end ov07_0222E6A8

	thumb_func_start ov07_0222E6F4
ov07_0222E6F4: @ 0x0222E6F4
	push {r3, r4, r5, lr}
	movs r1, #0x44
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	adds r0, #0x10
	adds r2, r1, #0
	movs r3, #0xf
	bl ov07_02222508
	movs r0, #4
	str r0, [r4, #0x34]
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
	str r0, [r4, #0x40]
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02008A78
	str r0, [r4, #0x3c]
	ldr r0, [r4]
	ldr r1, _0222E750 @ =ov07_0222E6A8
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_0222E750: .4byte ov07_0222E6A8
	thumb_func_end ov07_0222E6F4

	thumb_func_start ov07_0222E754
ov07_0222E754: @ 0x0222E754
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x74]
	movs r1, #0x64
	blx FUN_020F2998
	adds r4, r0, #0
	ldr r0, [r5, #0x78]
	movs r1, #0x64
	blx FUN_020F2998
	adds r6, r0, #0
	ldr r0, [r5, #0x70]
	movs r1, #0x64
	blx FUN_020F2998
	str r0, [sp]
	adds r0, r5, #0
	lsls r1, r4, #0x10
	lsls r3, r6, #0x10
	adds r0, #0x18
	asrs r1, r1, #0x10
	movs r2, #0xa
	asrs r3, r3, #0x10
	bl ov07_02222508
	ldr r0, [r5]
	movs r1, #0x10
	movs r2, #0
	bl ov07_02231E08
	ldr r0, [r5, #0x70]
	movs r1, #0x64
	blx FUN_020F2998
	movs r1, #6
	str r1, [sp]
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x3c
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0
	bl ov07_02222AC4
	movs r0, #0
	str r0, [r5, #0x64]
	str r0, [r5, #0x68]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0222E754

	thumb_func_start ov07_0222E7BC
ov07_0222E7BC: @ 0x0222E7BC
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x64]
	movs r5, #0
	cmp r0, #3
	bhi _0222E890
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222E7D4: @ jump table
	.2byte _0222E7DC - _0222E7D4 - 2 @ case 0
	.2byte _0222E822 - _0222E7D4 - 2 @ case 1
	.2byte _0222E878 - _0222E7D4 - 2 @ case 2
	.2byte _0222E88E - _0222E7D4 - 2 @ case 3
_0222E7DC:
	adds r0, r4, #0
	ldr r1, [r4, #0x14]
	adds r0, #0x18
	bl ov07_02222748
	cmp r0, #0
	bne _0222E890
	ldr r0, [r4, #0x78]
	movs r1, #0x64
	blx FUN_020F2998
	adds r6, r0, #0
	ldr r0, [r4, #0x74]
	movs r1, #0x64
	blx FUN_020F2998
	adds r7, r0, #0
	ldr r0, [r4, #0x70]
	movs r1, #0x64
	blx FUN_020F2998
	str r0, [sp]
	adds r0, r4, #0
	lsls r1, r6, #0x10
	lsls r3, r7, #0x10
	adds r0, #0x18
	asrs r1, r1, #0x10
	movs r2, #0xa
	asrs r3, r3, #0x10
	bl ov07_02222508
	ldr r0, [r4, #0x64]
	adds r0, r0, #1
	str r0, [r4, #0x64]
	b _0222E890
_0222E822:
	adds r0, r4, #0
	ldr r1, [r4, #0x14]
	adds r0, #0x18
	bl ov07_02222748
	cmp r0, #0
	bne _0222E890
	ldr r0, [r4, #0x68]
	adds r0, r0, #1
	str r0, [r4, #0x68]
	cmp r0, #2
	bge _0222E870
	adds r0, r5, #0
	str r0, [r4, #0x64]
	ldr r0, [r4, #0x74]
	movs r1, #0x64
	blx FUN_020F2998
	adds r6, r0, #0
	ldr r0, [r4, #0x78]
	movs r1, #0x64
	blx FUN_020F2998
	adds r7, r0, #0
	ldr r0, [r4, #0x70]
	movs r1, #0x64
	blx FUN_020F2998
	lsls r1, r6, #0x10
	lsls r3, r7, #0x10
	adds r4, #0x18
	str r0, [sp]
	adds r0, r4, #0
	asrs r1, r1, #0x10
	movs r2, #0xa
	asrs r3, r3, #0x10
	bl ov07_02222508
	b _0222E890
_0222E870:
	ldr r0, [r4, #0x64]
	adds r0, r0, #1
	str r0, [r4, #0x64]
	b _0222E890
_0222E878:
	adds r0, r4, #0
	adds r0, #0x3c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222E890
	ldr r0, [r4, #0x64]
	movs r5, #1
	adds r0, r0, #1
	str r0, [r4, #0x64]
	b _0222E890
_0222E88E:
	movs r5, #1
_0222E890:
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222E7BC

	thumb_func_start ov07_0222E894
ov07_0222E894: @ 0x0222E894
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x7c]
	movs r4, #0
	cmp r1, #0
	beq _0222E8AA
	cmp r1, #1
	beq _0222E8BC
	cmp r1, #2
	beq _0222E906
	b _0222E908
_0222E8AA:
	bl ov07_0222E754
	adds r0, r5, #0
	bl ov07_0222E7BC
	ldr r0, [r5, #0x7c]
	adds r0, r0, #1
	str r0, [r5, #0x7c]
	b _0222E908
_0222E8BC:
	bl ov07_0222E7BC
	cmp r0, #0
	beq _0222E908
	ldr r0, [r5, #0x6c]
	subs r0, r0, #1
	str r0, [r5, #0x6c]
	bmi _0222E8FC
	ldr r0, [r5, #0x70]
	movs r1, #3
	blx FUN_020F2998
	ldr r1, [r5, #0x70]
	subs r0, r1, r0
	str r0, [r5, #0x70]
	ldr r0, [r5, #0x74]
	movs r1, #3
	blx FUN_020F2998
	ldr r1, [r5, #0x74]
	subs r0, r1, r0
	str r0, [r5, #0x74]
	ldr r0, [r5, #0x78]
	movs r1, #3
	blx FUN_020F2998
	ldr r1, [r5, #0x78]
	subs r0, r1, r0
	str r0, [r5, #0x78]
	adds r0, r4, #0
	str r0, [r5, #0x7c]
	b _0222E908
_0222E8FC:
	ldr r0, [r5, #0x7c]
	movs r4, #1
	adds r0, r0, #1
	str r0, [r5, #0x7c]
	b _0222E908
_0222E906:
	movs r4, #1
_0222E908:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222E894

	thumb_func_start ov07_0222E90C
ov07_0222E90C: @ 0x0222E90C
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bls _0222E91C
	b _0222EA3C
_0222E91C:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222E928: @ jump table
	.2byte _0222E932 - _0222E928 - 2 @ case 0
	.2byte _0222E978 - _0222E928 - 2 @ case 1
	.2byte _0222E9D8 - _0222E928 - 2 @ case 2
	.2byte _0222EA08 - _0222E928 - 2 @ case 3
	.2byte _0222EA24 - _0222E928 - 2 @ case 4
_0222E932:
	adds r0, r4, #0
	bl ov07_0222E894
	cmp r0, #0
	beq _0222EA3C
	ldr r0, [r4, #0xc]
	movs r1, #0
	adds r0, r0, #1
	str r0, [r4, #0xc]
	movs r0, #0x1e
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x14]
	bl FUN_0200DC4C
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0200DC78
	movs r1, #0xfe
	lsls r1, r1, #0x16
	ldr r0, [r4, #0x14]
	adds r2, r1, #0
	bl FUN_0200E024
	movs r1, #0
	movs r2, #0x10
	str r1, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x3c
	adds r3, r2, #0
	bl ov07_02222AC4
	b _0222EA3C
_0222E978:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0222E996
	movs r0, #1
	str r0, [sp]
	movs r0, #8
	movs r1, #0x10
	movs r2, #0
	movs r3, #0xd
	bl FUN_0200B484
	movs r0, #0
	mvns r0, r0
	str r0, [r4, #0x10]
	b _0222E99C
_0222E996:
	ble _0222E99C
	subs r0, r0, #1
	str r0, [r4, #0x10]
_0222E99C:
	movs r0, #0
	ldr r1, [r4, #0x10]
	mvns r0, r0
	cmp r1, r0
	bne _0222E9C6
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #0
	beq _0222E9C6
	movs r0, #1
	str r0, [sp]
	movs r0, #8
	movs r1, #0
	movs r2, #0x10
	movs r3, #0xd
	bl FUN_0200B484
	movs r0, #1
	mvns r0, r0
	str r0, [r4, #0x10]
_0222E9C6:
	ldr r0, [r4, #0x14]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _0222EA3C
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222EA3C
_0222E9D8:
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #0
	beq _0222EA3C
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	adds r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	movs r2, #0
	bl ov07_02231E08
	movs r1, #0x10
	movs r2, #0
	str r1, [sp]
	movs r0, #8
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x3c
	adds r3, r2, #0
	bl ov07_02222AC4
	b _0222EA3C
_0222EA08:
	adds r0, r4, #0
	adds r0, #0x3c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222EA3C
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222EA3C
_0222EA24:
	ldr r0, [r4, #0x14]
	bl FUN_0200D9DC
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, pc}
_0222EA3C:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0222E90C

	thumb_func_start ov07_0222EA48
ov07_0222EA48: @ 0x0222EA48
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	movs r1, #0x80
	adds r6, r0, #0
	str r2, [sp]
	adds r5, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r6, [r4]
	ldr r0, [sp]
	str r7, [r4, #4]
	str r0, [r4, #8]
	str r5, [r4, #0x14]
	adds r0, r5, #0
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0200DD54
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #0x14]
	movs r1, #4
	bl FUN_0200DCC0
	movs r0, #3
	str r0, [r4, #0x6c]
	movs r0, #0x19
	lsls r0, r0, #4
	str r0, [r4, #0x70]
	ldr r0, _0222EAAC @ =0x000005DC
	ldr r1, _0222EAB0 @ =ov07_0222E90C
	str r0, [r4, #0x74]
	movs r0, #0xfa
	lsls r0, r0, #2
	str r0, [r4, #0x78]
	ldr r0, [r4]
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222EAAC: .4byte 0x000005DC
_0222EAB0: .4byte ov07_0222E90C
	thumb_func_end ov07_0222EA48

	thumb_func_start ov07_0222EAB4
ov07_0222EAB4: @ 0x0222EAB4
	push {r3, lr}
	sub sp, #8
	ldr r1, [r0, #0x34]
	cmp r1, #3
	bhi _0222EAFC
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0222EACA: @ jump table
	.2byte _0222EAD2 - _0222EACA - 2 @ case 0
	.2byte _0222EAEA - _0222EACA - 2 @ case 1
	.2byte _0222EAD2 - _0222EACA - 2 @ case 2
	.2byte _0222EAEA - _0222EACA - 2 @ case 3
_0222EAD2:
	movs r1, #0x20
	str r1, [sp]
	movs r1, #6
	str r1, [sp, #4]
	movs r1, #0
	adds r0, #0x10
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222EAEA:
	movs r1, #0
	str r1, [sp]
	movs r2, #6
	str r2, [sp, #4]
	adds r0, #0x10
	adds r2, r1, #0
	movs r3, #0x20
	bl ov07_02222268
_0222EAFC:
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov07_0222EAB4

	thumb_func_start ov07_0222EB00
ov07_0222EB00: @ 0x0222EB00
	push {r4, lr}
	adds r4, r1, #0
	adds r2, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0222EB16
	cmp r0, #1
	beq _0222EB24
	cmp r0, #2
	beq _0222EB5C
	pop {r4, pc}
_0222EB16:
	adds r0, r4, #0
	bl ov07_0222EAB4
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222EB24:
	adds r0, r4, #0
	adds r0, #0x10
	bl ov07_022222B4
	cmp r0, #0
	beq _0222EB44
	movs r2, #0xc
	movs r3, #0xe
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #8]
	adds r0, #0x10
	bl ov07_022220B8
	pop {r4, pc}
_0222EB44:
	ldr r0, [r4, #0x34]
	adds r0, r0, #1
	str r0, [r4, #0x34]
	cmp r0, #4
	bge _0222EB54
	movs r0, #0
	str r0, [r4]
	pop {r4, pc}
_0222EB54:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222EB5C:
	ldr r0, [r4, #4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov07_0222EB00

	thumb_func_start ov07_0222EB6C
ov07_0222EB6C: @ 0x0222EB6C
	push {r3, r4, r5, lr}
	movs r1, #0x38
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4, #4]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #8]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0xc]
	ldr r0, [r4, #8]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0xe]
	movs r0, #0
	str r0, [r4, #0x34]
	ldr r0, [r4, #4]
	ldr r1, _0222EBAC @ =ov07_0222EB00
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222EBAC: .4byte ov07_0222EB00
	thumb_func_end ov07_0222EB6C

	thumb_func_start ov07_0222EBB0
ov07_0222EBB0: @ 0x0222EBB0
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r2, r0, #0
	ldr r0, [r4]
	cmp r0, #6
	bhi _0222EC12
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222EBCA: @ jump table
	.2byte _0222EBD8 - _0222EBCA - 2 @ case 0
	.2byte _0222EBF6 - _0222EBCA - 2 @ case 1
	.2byte _0222EC6E - _0222EBCA - 2 @ case 2
	.2byte _0222ECB2 - _0222EBCA - 2 @ case 3
	.2byte _0222ECF0 - _0222EBCA - 2 @ case 4
	.2byte _0222ED38 - _0222EBCA - 2 @ case 5
	.2byte _0222ED68 - _0222EBCA - 2 @ case 6
_0222EBD8:
	adds r0, r4, #0
	adds r0, #0x14
	movs r1, #1
	movs r2, #0x40
	bl ov07_02222A44
	ldr r1, [r4, #0x20]
	ldr r0, [r4, #8]
	add sp, #8
	muls r0, r1, r0
	str r0, [r4, #0x20]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222EBF6:
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	movs r1, #0x10
	adds r0, r4, #0
	adds r2, #8
	lsls r2, r2, #0x10
	ldrsh r1, [r4, r1]
	ldr r3, [r4, #0xc]
	adds r0, #0x14
	asrs r2, r2, #0x10
	bl ov07_02222240
	cmp r0, #0
	beq _0222EC14
_0222EC12:
	b _0222ED76
_0222EC14:
	movs r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_020087A4
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r3, #0
	movs r0, #2
	adds r2, r1, #0
	str r3, [sp]
	adds r2, #0x20
	str r0, [sp, #4]
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x14
	asrs r2, r2, #0x10
	bl ov07_02222268
	ldr r1, [r4, #0x1c]
	ldr r0, [r4, #8]
	muls r0, r1, r0
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_022222B4
	movs r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_020087A4
	add sp, #8
	pop {r4, pc}
_0222EC6E:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_022222B4
	cmp r0, #0
	beq _0222EC8A
	movs r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_020087A4
	add sp, #8
	pop {r4, pc}
_0222EC8A:
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r3, #0
	movs r0, #2
	str r3, [sp]
	str r0, [sp, #4]
	ldr r2, [r4, #8]
	adds r0, r4, #0
	lsls r2, r2, #5
	adds r2, r1, r2
	lsls r2, r2, #0x10
	adds r0, #0x40
	asrs r2, r2, #0x10
	bl ov07_02222268
	ldr r0, [r4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222ECB2:
	adds r0, r4, #0
	adds r0, #0x40
	bl ov07_022222B4
	cmp r0, #0
	beq _0222ECCE
	movs r2, #0x40
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x38]
	movs r1, #0
	bl FUN_020087A4
	add sp, #8
	pop {r4, pc}
_0222ECCE:
	movs r3, #0
	str r3, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r1, #0x14
	movs r2, #0x10
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	adds r0, #0x14
	bl ov07_02222268
	ldr r0, [r4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222ECF0:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_022222B4
	cmp r0, #0
	ldr r0, [r4, #0xc]
	beq _0222ED0C
	movs r2, #0x14
	ldrsh r2, [r4, r2]
	movs r1, #0
	bl FUN_020087A4
	add sp, #8
	pop {r4, pc}
_0222ED0C:
	movs r2, #0x10
	ldrsh r2, [r4, r2]
	movs r1, #0
	bl FUN_020087A4
	movs r3, #0
	str r3, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r1, #0x40
	movs r2, #0x3c
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	adds r0, #0x40
	bl ov07_02222268
	ldr r0, [r4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222ED38:
	adds r0, r4, #0
	adds r0, #0x40
	bl ov07_022222B4
	cmp r0, #0
	ldr r0, [r4, #0x38]
	beq _0222ED54
	movs r2, #0x40
	ldrsh r2, [r4, r2]
	movs r1, #0
	bl FUN_020087A4
	add sp, #8
	pop {r4, pc}
_0222ED54:
	movs r2, #0x3c
	ldrsh r2, [r4, r2]
	movs r1, #0
	bl FUN_020087A4
	ldr r0, [r4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222ED68:
	ldr r0, [r4, #4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_0222ED76:
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_0222EBB0

	thumb_func_start ov07_0222ED7C
ov07_0222ED7C: @ 0x0222ED7C
	push {r3, r4, r5, lr}
	movs r1, #0x64
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4, #4]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_02222004
	str r0, [r4, #8]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0x12]
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0x38]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0x3c]
	ldr r0, [r4, #0x38]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0x3e]
	ldr r0, [r4, #4]
	ldr r1, _0222EDEC @ =ov07_0222EBB0
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_0222EDEC: .4byte ov07_0222EBB0
	thumb_func_end ov07_0222ED7C

	thumb_func_start ov07_0222EDF0
ov07_0222EDF0: @ 0x0222EDF0
	push {lr}
	sub sp, #0xc
	movs r1, #0
	str r1, [r0, #0x40]
	movs r1, #8
	str r1, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r2, #2
	str r2, [sp, #8]
	adds r0, #0x1c
	movs r2, #9
	adds r3, r1, #0
	bl ov07_02222590
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov07_0222EDF0

	thumb_func_start ov07_0222EE14
ov07_0222EE14: @ 0x0222EE14
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x40]
	movs r5, #0
	cmp r0, #3
	bhi _0222EF06
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222EE2E: @ jump table
	.2byte _0222EE36 - _0222EE2E - 2 @ case 0
	.2byte _0222EE7C - _0222EE2E - 2 @ case 1
	.2byte _0222EEBE - _0222EE2E - 2 @ case 2
	.2byte _0222EF04 - _0222EE2E - 2 @ case 3
_0222EE36:
	adds r0, r4, #0
	ldr r1, [r4, #0x18]
	adds r0, #0x1c
	bl ov07_02222788
	cmp r0, #0
	beq _0222EE5A
	adds r0, r5, #0
	str r0, [sp]
	movs r1, #0x44
	movs r2, #0x46
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	ldr r3, [r4, #0x30]
	bl ov07_022226C4
	b _0222EF06
_0222EE5A:
	ldr r0, [r4, #0x40]
	movs r1, #9
	adds r0, r0, #1
	str r0, [r4, #0x40]
	movs r0, #0xf
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #2
	adds r4, #0x1c
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r2, #0xb
	movs r3, #8
	bl ov07_02222590
	b _0222EF06
_0222EE7C:
	adds r0, r4, #0
	ldr r1, [r4, #0x18]
	adds r0, #0x1c
	bl ov07_02222788
	cmp r0, #0
	beq _0222EEA0
	adds r0, r5, #0
	str r0, [sp]
	movs r1, #0x44
	movs r2, #0x46
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	ldr r3, [r4, #0x30]
	bl ov07_022226C4
	b _0222EF06
_0222EEA0:
	ldr r0, [r4, #0x40]
	movs r2, #0xa
	adds r0, r0, #1
	str r0, [r4, #0x40]
	str r2, [sp]
	str r2, [sp, #4]
	movs r0, #2
	adds r4, #0x1c
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0xb
	movs r3, #0xf
	bl ov07_02222590
	b _0222EF06
_0222EEBE:
	adds r0, r4, #0
	ldr r1, [r4, #0x18]
	adds r0, #0x1c
	bl ov07_02222788
	cmp r0, #0
	beq _0222EEE2
	adds r0, r5, #0
	str r0, [sp]
	movs r1, #0x44
	movs r2, #0x46
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	ldr r3, [r4, #0x30]
	bl ov07_022226C4
	b _0222EF06
_0222EEE2:
	movs r1, #0xc
	adds r2, r1, #0
	ldr r0, [r4, #0x18]
	adds r2, #0xf4
	bl FUN_020087A4
	movs r1, #0xd
	adds r2, r1, #0
	ldr r0, [r4, #0x18]
	adds r2, #0xf3
	bl FUN_020087A4
	ldr r0, [r4, #0x40]
	movs r5, #1
	adds r0, r0, #1
	str r0, [r4, #0x40]
	b _0222EF06
_0222EF04:
	movs r5, #1
_0222EF06:
	adds r0, r5, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov07_0222EE14

	thumb_func_start ov07_0222EF0C
ov07_0222EF0C: @ 0x0222EF0C
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	movs r2, #0
	str r2, [r1]
	adds r5, r0, #0
	movs r1, #0x64
	bl FUN_0200DD68
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200DD54
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200DCE8
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200DC78
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0200DC8C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0200DC4C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0200DCC0
	movs r1, #0x37
	adds r0, r5, #0
	lsls r1, r1, #0xc
	bl FUN_0200DC34
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222EF0C

	thumb_func_start ov07_0222EF58
ov07_0222EF58: @ 0x0222EF58
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r1, [r5]
	movs r4, #0
	cmp r1, #0
	beq _0222EF6A
	cmp r1, #1
	beq _0222EF7C
	b _0222EF80
_0222EF6A:
	bl FUN_0200DCA0
	cmp r0, #0
	bne _0222EF82
	ldr r0, [r5]
	movs r4, #1
	adds r0, r0, #1
	str r0, [r5]
	b _0222EF82
_0222EF7C:
	movs r4, #1
	b _0222EF82
_0222EF80:
	movs r4, #1
_0222EF82:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0222EF58

	thumb_func_start ov07_0222EF88
ov07_0222EF88: @ 0x0222EF88
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r7, r0, #0
	ldr r0, [r6, #0xc]
	cmp r0, #5
	bls _0222EF96
	b _0222F0A8
_0222EF96:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222EFA2: @ jump table
	.2byte _0222EFAE - _0222EFA2 - 2 @ case 0
	.2byte _0222EFD2 - _0222EFA2 - 2 @ case 1
	.2byte _0222F00A - _0222EFA2 - 2 @ case 2
	.2byte _0222F03A - _0222EFA2 - 2 @ case 3
	.2byte _0222F060 - _0222EFA2 - 2 @ case 4
	.2byte _0222F086 - _0222EFA2 - 2 @ case 5
_0222EFAE:
	adds r0, r6, #0
	bl ov07_0222EDF0
	ldr r0, [r6, #0x10]
	adds r1, r6, #0
	lsls r2, r0, #2
	adds r0, r6, r2
	adds r1, #0x60
	adds r1, r1, r2
	movs r2, #2
	ldr r0, [r0, #0x48]
	lsls r2, r2, #0xc
	bl ov07_0222EF0C
	ldr r0, [r6, #0xc]
	adds r0, r0, #1
	str r0, [r6, #0xc]
	b _0222F0A8
_0222EFD2:
	adds r0, r6, #0
	bl ov07_0222EE14
	adds r4, r0, #0
	ldr r0, [r6, #0x10]
	adds r1, r6, #0
	lsls r2, r0, #2
	adds r0, r6, r2
	adds r1, #0x60
	ldr r0, [r0, #0x48]
	adds r1, r1, r2
	bl ov07_0222EF58
	cmp r4, r0
	bne _0222F0A8
	cmp r4, #1
	bne _0222F0A8
	ldr r0, [r6, #0x10]
	movs r1, #1
	lsls r0, r0, #2
	adds r0, r6, r0
	ldr r0, [r0, #0x48]
	bl FUN_0200DC4C
	ldr r0, [r6, #0xc]
	adds r0, r0, #1
	str r0, [r6, #0xc]
	b _0222F0A8
_0222F00A:
	ldr r0, [r6, #0x10]
	adds r2, r6, #0
	adds r2, #0x78
	lsls r1, r0, #2
	ldr r0, [r2, r1]
	subs r0, r0, #1
	str r0, [r2, r1]
	ldr r1, [r6, #0x10]
	lsls r0, r1, #2
	adds r0, r6, r0
	ldr r0, [r0, #0x78]
	cmp r0, #0
	bge _0222F0A8
	adds r0, r1, #1
	str r0, [r6, #0x10]
	cmp r0, #6
	bge _0222F032
	movs r0, #0
	str r0, [r6, #0xc]
	b _0222F0A8
_0222F032:
	ldr r0, [r6, #0xc]
	adds r0, r0, #1
	str r0, [r6, #0xc]
	b _0222F0A8
_0222F03A:
	adds r4, r6, #0
	movs r7, #0
	adds r4, #0x60
	adds r5, r6, #0
_0222F042:
	movs r2, #2
	ldr r0, [r5, #0x48]
	adds r1, r4, #0
	lsls r2, r2, #0xc
	bl ov07_0222EF0C
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #6
	blt _0222F042
	ldr r0, [r6, #0xc]
	adds r0, r0, #1
	str r0, [r6, #0xc]
	b _0222F0A8
_0222F060:
	adds r4, r6, #0
	movs r7, #0
	adds r4, #0x60
	adds r5, r6, #0
_0222F068:
	ldr r0, [r5, #0x48]
	adds r1, r4, #0
	bl ov07_0222EF58
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #6
	blt _0222F068
	cmp r0, #1
	bne _0222F0A8
	ldr r0, [r6, #0xc]
	adds r0, r0, #1
	str r0, [r6, #0xc]
	b _0222F0A8
_0222F086:
	movs r5, #0
	adds r4, r6, #0
_0222F08A:
	ldr r0, [r4, #0x48]
	bl FUN_0200D9DC
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #6
	blt _0222F08A
	ldr r0, [r6]
	adds r1, r7, #0
	bl ov07_0221C448
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
_0222F0A8:
	ldr r0, [r6, #8]
	bl FUN_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222EF88

	thumb_func_start ov07_0222F0B0
ov07_0222F0B0: @ 0x0222F0B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	str r1, [sp]
	movs r1, #0x90
	adds r4, r0, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl ov07_022324D8
	ldr r1, [sp]
	str r4, [r0]
	str r1, [r0, #4]
	ldr r1, [sp, #4]
	str r0, [sp, #0x14]
	str r1, [r0, #8]
	ldr r0, [r0]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	bl ov07_0221FA48
	ldr r1, [sp, #0x14]
	str r0, [r1, #0x18]
	movs r1, #0
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	ldr r0, [sp, #0x14]
	movs r1, #1
	ldr r0, [r0, #0x18]
	bl FUN_02008A78
	ldr r1, [sp, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, #0x44
	str r0, [sp, #0xc]
	strh r0, [r1]
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	bl ov07_0221FAA0
	ldr r1, [sp, #0x14]
	adds r1, #0x46
	strh r0, [r1]
	ldr r1, [sp, #0x14]
	add r0, sp, #0x1c
	ldr r1, [r1]
	bl ov07_0221F9E8
	ldr r5, [sp, #0x14]
	movs r4, #0
_0222F128:
	cmp r4, #0
	bne _0222F130
	ldr r0, [sp, #8]
	b _0222F13A
_0222F130:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, sp, #0x1c
	bl FUN_0200D734
_0222F13A:
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x48]
	movs r1, #0
	bl FUN_0200DCE8
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r1, r0, #1
	ldr r0, _0222F200 @ =0x00001555
	movs r2, #3
	muls r0, r1, r0
	asrs r0, r0, #4
	lsls r0, r0, #2
	ldr r1, _0222F204 @ =0x021094DC
	str r0, [sp, #0x18]
	adds r1, r1, r0
	movs r0, #2
	ldrsh r0, [r1, r0]
	lsls r2, r2, #0x10
	movs r3, #0
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	lsls r2, r2, #0xa
	adds r2, r0, r2
	ldr r0, _0222F208 @ =0x00000000
	adcs r1, r0
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	lsls r0, r1, #4
	asrs r6, r0, #0x10
	movs r2, #3
	ldr r1, _0222F204 @ =0x021094DC
	ldr r0, [sp, #0x18]
	lsls r2, r2, #0x10
	ldrsh r0, [r1, r0]
	movs r3, #0
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	lsls r2, r2, #0xa
	adds r0, r0, r2
	ldr r2, _0222F208 @ =0x00000000
	adcs r1, r2
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	lsls r0, r0, #4
	asrs r0, r0, #0x10
	str r0, [sp, #0x10]
	lsrs r2, r4, #0x1f
	lsls r1, r4, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	bne _0222F1C2
	adds r0, r7, r6
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, [r5, #0x48]
	movs r1, #1
	bl FUN_0200E0C0
	b _0222F1C8
_0222F1C2:
	subs r0, r7, r6
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
_0222F1C8:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r0, [r5, #0x48]
	adds r1, r6, #0
	bl FUN_0200DDB8
	cmp r4, #2
	bge _0222F1E2
	movs r0, #8
	b _0222F1E4
_0222F1E2:
	movs r0, #0
_0222F1E4:
	adds r4, r4, #1
	str r0, [r5, #0x78]
	adds r5, r5, #4
	cmp r4, #6
	blt _0222F128
	ldr r0, [sp, #0x14]
	ldr r1, _0222F20C @ =ov07_0222EF88
	ldr r0, [r0]
	ldr r2, [sp, #0x14]
	bl ov07_0221C410
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F200: .4byte 0x00001555
_0222F204: .4byte 0x021094DC
_0222F208: .4byte 0x00000000
_0222F20C: .4byte ov07_0222EF88
	thumb_func_end ov07_0222F0B0

	thumb_func_start ov07_0222F210
ov07_0222F210: @ 0x0222F210
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #5
	bhi _0222F250
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222F22A: @ jump table
	.2byte _0222F236 - _0222F22A - 2 @ case 0
	.2byte _0222F246 - _0222F22A - 2 @ case 1
	.2byte _0222F2A6 - _0222F22A - 2 @ case 2
	.2byte _0222F302 - _0222F22A - 2 @ case 3
	.2byte _0222F332 - _0222F22A - 2 @ case 4
	.2byte _0222F356 - _0222F22A - 2 @ case 5
_0222F236:
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl FUN_0200DC78
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222F36E
_0222F246:
	ldr r0, [r4, #0x5c]
	bl FUN_0200DCA0
	cmp r0, #0
	beq _0222F252
_0222F250:
	b _0222F36E
_0222F252:
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl FUN_0200DC78
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	adds r0, r0, #1
	str r0, [r4, #0xc]
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x14
	adds r2, r1, #0
	movs r3, #0
	bl ov07_02222508
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_02008A78
	adds r5, r0, #0
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02008A78
	adds r3, r0, #0
	movs r0, #0x8a
	ldrsh r0, [r4, r0]
	lsls r1, r5, #0x10
	lsls r3, r3, #0x10
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r2, #0x88
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	adds r0, #0x38
	asrs r1, r1, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222268
	b _0222F36E
_0222F2A6:
	adds r0, r4, #0
	ldr r1, [r4, #0x10]
	adds r0, #0x38
	bl ov07_02222314
	adds r0, r4, #0
	ldr r1, [r4, #0x10]
	adds r0, #0x14
	bl ov07_02222768
	cmp r0, #0
	bne _0222F36E
	ldr r0, [r4, #0x10]
	movs r1, #6
	movs r2, #1
	bl FUN_020087A4
	movs r1, #0xc
	adds r2, r1, #0
	ldr r0, [r4, #0x10]
	adds r2, #0xf4
	bl FUN_020087A4
	movs r1, #0xd
	adds r2, r1, #0
	ldr r0, [r4, #0x10]
	adds r2, #0xf3
	bl FUN_020087A4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl FUN_0200DC4C
	movs r1, #1
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #0xc
	bl FUN_0200DC8C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl FUN_0200DC78
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222F36E
_0222F302:
	ldr r0, [r4, #0x5c]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _0222F36E
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl FUN_0200DC78
	ldr r0, [r4, #0xc]
	movs r1, #0
	adds r0, r0, #1
	str r0, [r4, #0xc]
	str r1, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r3, #0x8a
	adds r0, r4, #0
	ldrsh r3, [r4, r3]
	adds r0, #0x60
	adds r2, r1, #0
	bl ov07_02222268
	b _0222F36E
_0222F332:
	adds r0, r4, #0
	adds r0, #0x60
	bl ov07_022222B4
	cmp r0, #0
	beq _0222F34E
	movs r1, #0x88
	movs r2, #0x62
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x5c]
	bl FUN_0200DDB8
	b _0222F36E
_0222F34E:
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222F36E
_0222F356:
	ldr r0, [r4, #0x5c]
	bl FUN_0200D9DC
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, pc}
_0222F36E:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222F210

	thumb_func_start ov07_0222F378
ov07_0222F378: @ 0x0222F378
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	movs r1, #0x8c
	adds r5, r0, #0
	str r2, [sp]
	adds r6, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4]
	ldr r0, [sp]
	str r7, [r4, #4]
	str r0, [r4, #8]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	movs r1, #6
	movs r2, #0
	str r0, [r4, #0x10]
	bl FUN_020087A4
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	bl ov07_02221F80
	adds r1, r4, #0
	adds r1, #0x88
	strh r0, [r1]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #1
	bl ov07_02221F80
	adds r1, r4, #0
	adds r1, #0x8a
	strh r0, [r1]
	str r6, [r4, #0x5c]
	adds r0, r6, #0
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl FUN_0200DD54
	movs r1, #0x88
	movs r2, #0x8a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x5c]
	bl FUN_0200DDB8
	ldr r0, [r4]
	ldr r1, _0222F404 @ =ov07_0222F210
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F404: .4byte ov07_0222F210
	thumb_func_end ov07_0222F378

	thumb_func_start ov07_0222F408
ov07_0222F408: @ 0x0222F408
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, r1, #0
	bl ov07_02221FF0
	movs r1, #1
	adds r2, r1, #0
	lsls r2, r0
	movs r0, #0
	lsls r2, r2, #0x10
	adds r4, #0xc4
	str r0, [sp]
	ldr r0, [r4]
	movs r1, #2
	lsrs r2, r2, #0x10
	movs r3, #8
	bl FUN_02003EA4
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov07_0222F408

	thumb_func_start ov07_0222F434
ov07_0222F434: @ 0x0222F434
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r1, #0xa
	movs r0, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x28
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov07_02222590
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	adds r0, #0x4c
	adds r2, r1, #0
	movs r3, #1
	bl ov07_02222508
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x94
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #6
	adds r0, #0x98
	str r1, [r0]
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	adds r1, r0, #0
	lsls r2, r1, #1
	ldr r1, _0222F4D0 @ =0x02236800
	ldr r0, [r4, #0x20]
	ldrh r1, [r1, r2]
	bl FUN_0200DCE8
	ldr r0, [r4, #0x18]
	movs r1, #1
	bl FUN_0200DCE8
	adds r0, r4, #0
	adds r0, #0x28
	add r1, sp, #0x10
	add r2, sp, #0xc
	bl ov07_02222644
	adds r0, r4, #0
	adds r0, #0xc8
	ldr r0, [r0]
	cmp r0, #1
	bne _0222F4B8
	ldr r1, [sp, #0x10]
	movs r0, #0
	blx FUN_020F24C8
	str r0, [sp, #0x10]
_0222F4B8:
	ldr r0, [r4, #0x18]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl FUN_0200E024
	ldr r1, [r4, #0x18]
	adds r0, r4, #0
	bl ov07_0222F408
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_0222F4D0: .4byte 0x02236800
	thumb_func_end ov07_0222F434

	thumb_func_start ov07_0222F4D4
ov07_0222F4D4: @ 0x0222F4D4
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r4, #0
	cmp r0, #0
	beq _0222F4F0
	cmp r0, #1
	beq _0222F578
	cmp r0, #2
	bne _0222F4EE
	b _0222F5F8
_0222F4EE:
	b _0222F5FA
_0222F4F0:
	adds r0, r5, #0
	adds r0, #0x28
	bl ov07_0222260C
	adds r0, r5, #0
	adds r0, #0x28
	add r1, sp, #0x10
	add r2, sp, #0xc
	bl ov07_02222644
	adds r0, r5, #0
	adds r0, #0xc8
	ldr r0, [r0]
	cmp r0, #1
	bne _0222F518
	ldr r1, [sp, #0x10]
	adds r0, r4, #0
	blx FUN_020F24C8
	str r0, [sp, #0x10]
_0222F518:
	ldr r0, [r5, #0x18]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl FUN_0200E024
	movs r0, #0
	str r0, [sp]
	ldr r1, [r5, #0x14]
	ldr r2, [r5, #0x10]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r5, #0x18]
	ldr r3, [r5, #0x3c]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov07_022226FC
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	subs r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x98
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	cmp r0, #0
	bge _0222F5FA
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r3, #0x14
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x94
	str r1, [r0]
	str r3, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r0, #4
	adds r5, #0x28
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r2, #1
	bl ov07_02222590
	b _0222F5FA
_0222F578:
	adds r0, r5, #0
	adds r0, #0x28
	bl ov07_0222260C
	adds r0, r5, #0
	adds r0, #0x4c
	bl ov07_02222558
	cmp r0, #0
	beq _0222F5D6
	movs r0, #0x4c
	ldrsh r0, [r5, r0]
	add r1, sp, #0x10
	add r2, sp, #0xc
	strh r0, [r5, #0x28]
	adds r0, r5, #0
	adds r0, #0x28
	bl ov07_02222644
	adds r0, r5, #0
	adds r0, #0xc8
	ldr r0, [r0]
	cmp r0, #1
	bne _0222F5B2
	ldr r1, [sp, #0x10]
	adds r0, r4, #0
	blx FUN_020F24C8
	str r0, [sp, #0x10]
_0222F5B2:
	ldr r0, [r5, #0x18]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl FUN_0200E024
	movs r0, #0
	str r0, [sp]
	ldr r1, [r5, #0x14]
	ldr r2, [r5, #0x10]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r5, #0x18]
	ldr r3, [r5, #0x3c]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov07_022226FC
	b _0222F5FA
_0222F5D6:
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x94
	str r1, [r0]
	ldr r0, [r5, #0x20]
	adds r1, r4, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x18]
	adds r1, r4, #0
	bl FUN_0200DCE8
	movs r4, #1
	b _0222F5FA
_0222F5F8:
	movs r4, #1
_0222F5FA:
	adds r0, r4, #0
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov07_0222F4D4

	thumb_func_start ov07_0222F600
ov07_0222F600: @ 0x0222F600
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	add r1, sp, #0xc
	ldr r0, [r4, #0x1c]
	adds r1, #2
	add r2, sp, #0xc
	bl FUN_0200DE44
	add r1, sp, #0xc
	movs r0, #0
	ldrsh r3, [r1, r0]
	movs r0, #2
	ldrsh r1, [r1, r0]
	movs r0, #8
	str r3, [sp]
	subs r3, #0x40
	str r0, [sp, #4]
	adds r0, r4, #0
	lsls r3, r3, #0x10
	adds r0, #0x70
	adds r2, r1, #0
	asrs r3, r3, #0x10
	bl ov07_02222268
	movs r2, #0xa
	str r2, [sp]
	str r2, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #2
	movs r3, #0x14
	bl ov07_02222590
	adds r0, r4, #0
	adds r0, #0x28
	add r1, sp, #0x14
	add r2, sp, #0x10
	bl ov07_02222644
	adds r0, r4, #0
	adds r0, #0xcc
	ldr r0, [r0]
	cmp r0, #1
	bne _0222F668
	ldr r1, [sp, #0x14]
	movs r0, #0
	blx FUN_020F24C8
	str r0, [sp, #0x14]
_0222F668:
	ldr r0, [r4, #0x1c]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	bl FUN_0200E024
	adds r0, r4, #0
	ldr r1, [r4, #0x1c]
	adds r0, #0x70
	bl ov07_022222F0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x94
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #6
	adds r0, #0x98
	str r1, [r0]
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	adds r1, r0, #0
	lsls r2, r1, #1
	ldr r1, _0222F6BC @ =0x02236800
	ldr r0, [r4, #0x24]
	ldrh r1, [r1, r2]
	bl FUN_0200DCE8
	ldr r0, [r4, #0x1c]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r1, [r4, #0x1c]
	adds r0, r4, #0
	bl ov07_0222F408
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
_0222F6BC: .4byte 0x02236800
	thumb_func_end ov07_0222F600

	thumb_func_start ov07_0222F6C0
ov07_0222F6C0: @ 0x0222F6C0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r4, #0
	cmp r0, #0
	beq _0222F6DA
	cmp r0, #1
	beq _0222F70A
	cmp r0, #2
	beq _0222F75C
	b _0222F75E
_0222F6DA:
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	subs r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x98
	str r1, [r0]
	adds r0, r5, #0
	ldr r1, [r5, #0x1c]
	adds r0, #0x70
	bl ov07_022222F0
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	cmp r0, #0
	bge _0222F75E
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r5, #0x94
	adds r0, r0, #1
	str r0, [r5]
	b _0222F75E
_0222F70A:
	adds r0, r5, #0
	ldr r1, [r5, #0x1c]
	adds r0, #0x70
	bl ov07_022222F0
	adds r0, r5, #0
	adds r0, #0x28
	bl ov07_0222260C
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x28
	add r1, sp, #4
	add r2, sp, #0
	bl ov07_02222644
	adds r0, r5, #0
	adds r0, #0xcc
	ldr r0, [r0]
	cmp r0, #1
	bne _0222F73E
	ldr r1, [sp, #4]
	adds r0, r4, #0
	blx FUN_020F24C8
	str r0, [sp, #4]
_0222F73E:
	ldr r0, [r5, #0x1c]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl FUN_0200E024
	cmp r6, #0
	bne _0222F75E
	adds r0, r5, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r5, #0x94
	adds r0, r0, #1
	str r0, [r5]
	movs r4, #1
	b _0222F75E
_0222F75C:
	movs r4, #1
_0222F75E:
	adds r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0222F6C0

	thumb_func_start ov07_0222F764
ov07_0222F764: @ 0x0222F764
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r2, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #6
	bhi _0222F83E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222F77E: @ jump table
	.2byte _0222F78C - _0222F77E - 2 @ case 0
	.2byte _0222F7B0 - _0222F77E - 2 @ case 1
	.2byte _0222F7CA - _0222F77E - 2 @ case 2
	.2byte _0222F7E0 - _0222F77E - 2 @ case 3
	.2byte _0222F7F6 - _0222F77E - 2 @ case 4
	.2byte _0222F81C - _0222F77E - 2 @ case 5
	.2byte _0222F830 - _0222F77E - 2 @ case 6
_0222F78C:
	ldr r0, [r4]
	movs r1, #0
	movs r2, #0x10
	bl ov07_02231E08
	movs r2, #8
	str r2, [sp]
	adds r0, r4, #0
	str r2, [sp, #4]
	adds r0, #0x9c
	movs r1, #0
	movs r3, #0x10
	bl ov07_02222AC4
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0222F83E
_0222F7B0:
	adds r0, r4, #0
	adds r0, #0x9c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222F83E
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl ov07_0222F434
	b _0222F83E
_0222F7CA:
	adds r0, r4, #0
	bl ov07_0222F4D4
	cmp r0, #0
	beq _0222F83E
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #2
	str r0, [r4, #0xc]
	b _0222F83E
_0222F7E0:
	ldr r0, [r4, #0xc]
	subs r0, r0, #1
	str r0, [r4, #0xc]
	bpl _0222F83E
	adds r0, r4, #0
	bl ov07_0222F600
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0222F83E
_0222F7F6:
	adds r0, r4, #0
	bl ov07_0222F6C0
	cmp r0, #0
	beq _0222F83E
	ldr r0, [r4, #8]
	movs r1, #8
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x9c
	movs r2, #0
	adds r3, r1, #0
	str r1, [sp, #4]
	bl ov07_02222AC4
	b _0222F83E
_0222F81C:
	adds r0, r4, #0
	adds r0, #0x9c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222F83E
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0222F83E
_0222F830:
	ldr r0, [r4]
	adds r1, r2, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
_0222F83E:
	ldr r0, [r4, #4]
	bl FUN_0200D020
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_0222F764

	thumb_func_start ov07_0222F848
ov07_0222F848: @ 0x0222F848
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r1, #0xd0
	adds r6, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r6, [r4]
	adds r0, r6, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	ldr r0, [r4]
	bl ov07_0221FA78
	adds r1, r4, #0
	adds r1, #0xc4
	str r0, [r1]
	adds r0, r6, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	movs r1, #0
	adds r7, r0, #0
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r0, r7, #0
	movs r1, #0x29
	bl FUN_02008A78
	subs r0, r5, r0
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r0, r6, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	movs r1, #0
	str r0, [sp, #4]
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	ldr r0, [sp, #4]
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, [sp, #4]
	movs r1, #0x29
	bl FUN_02008A78
	subs r0, r6, r0
	lsls r0, r0, #0x10
	str r5, [r4, #0x14]
	asrs r6, r0, #0x10
	ldr r0, [r4]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
	str r0, [r4, #0x10]
	ldr r0, [r4]
	movs r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x18]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0x18]
	movs r1, #1
	bl FUN_0200DD54
	ldr r0, [r4, #0x18]
	ldr r1, [sp]
	adds r2, r5, #0
	bl FUN_0200DDB8
	ldr r0, [r4, #0x18]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x18]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #0x18]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x1c]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0x1c]
	movs r1, #1
	bl FUN_0200DD54
	ldr r0, [r4, #0x1c]
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_0200DDB8
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x1c]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #0x1c]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #0x28
	bl FUN_0200E0CC
	ldr r0, [r4]
	movs r1, #0
	bl ov07_0221FB78
	adds r1, r4, #0
	adds r1, #0xc8
	str r0, [r1]
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FB78
	adds r1, r4, #0
	adds r1, #0xcc
	str r0, [r1]
	ldr r0, [r4]
	movs r1, #2
	bl ov07_0221C4E8
	str r0, [r4, #0x20]
	ldr r0, [r4]
	movs r1, #3
	bl ov07_0221C4E8
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x20]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x24]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4]
	ldr r1, _0222F9B4 @ =ov07_0222F764
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222F9B4: .4byte ov07_0222F764
	thumb_func_end ov07_0222F848

	thumb_func_start ov07_0222F9B8
ov07_0222F9B8: @ 0x0222F9B8
	push {r4, lr}
	sub sp, #0x20
	movs r2, #0xa
	adds r4, r0, #0
	adds r0, #0xf8
	movs r1, #0x19
	adds r3, r2, #0
	str r2, [sp]
	bl ov07_02222508
	movs r0, #0x3a
	ldrsh r0, [r4, r0]
	adds r1, r4, #0
	movs r3, #0x38
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x44]
	ldr r2, _0222FA04 @ =ov07_02222558
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x40]
	adds r1, #0xf8
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x3c]
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	ldrsh r3, [r4, r3]
	adds r0, #0x48
	bl ov07_02222864
	add sp, #0x20
	pop {r4, pc}
	.align 2, 0
_0222FA04: .4byte ov07_02222558
	thumb_func_end ov07_0222F9B8

	thumb_func_start ov07_0222FA08
ov07_0222FA08: @ 0x0222FA08
	push {r4, lr}
	sub sp, #0x20
	adds r4, r0, #0
	movs r0, #6
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	adds r0, #0xf8
	adds r2, r1, #0
	movs r3, #0x19
	bl ov07_02222508
	movs r0, #0x3a
	ldrsh r0, [r4, r0]
	adds r1, r4, #0
	movs r3, #0x38
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x3c]
	ldr r2, _0222FA60 @ =ov07_02222558
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x40]
	adds r1, #0xf8
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x44]
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	ldrsh r3, [r4, r3]
	adds r0, #0x48
	bl ov07_02222864
	ldr r0, [r4, #0x3c]
	movs r1, #1
	bl FUN_0200DCE8
	add sp, #0x20
	pop {r4, pc}
	.align 2, 0
_0222FA60: .4byte ov07_02222558
	thumb_func_end ov07_0222FA08

	thumb_func_start ov07_0222FA64
ov07_0222FA64: @ 0x0222FA64
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r7, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bhi _0222FB1C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222FA7C: @ jump table
	.2byte _0222FA86 - _0222FA7C - 2 @ case 0
	.2byte _0222FA94 - _0222FA7C - 2 @ case 1
	.2byte _0222FAC2 - _0222FA7C - 2 @ case 2
	.2byte _0222FAE6 - _0222FA7C - 2 @ case 3
	.2byte _0222FAFA - _0222FA7C - 2 @ case 4
_0222FA86:
	adds r0, r4, #0
	bl ov07_0222F9B8
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222FB1C
_0222FA94:
	adds r0, r4, #0
	adds r0, #0x48
	bl ov07_02222914
	cmp r0, #0
	bne _0222FB1C
	ldr r0, [r4, #0x3c]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, [r4, #0xc]
	movs r1, #4
	adds r0, r0, #1
	str r0, [r4, #0xc]
	movs r0, #6
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x14
	movs r2, #0
	movs r3, #1
	bl ov07_022227A8
	b _0222FB1C
_0222FAC2:
	movs r1, #0x38
	movs r2, #0x3a
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x10]
	adds r0, #0x14
	bl ov07_0222283C
	cmp r0, #0
	bne _0222FB1C
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl ov07_0222FA08
	b _0222FB1C
_0222FAE6:
	adds r0, r4, #0
	adds r0, #0x48
	bl ov07_02222914
	cmp r0, #0
	bne _0222FB1C
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222FB1C
_0222FAFA:
	movs r6, #0
	adds r5, r4, #0
_0222FAFE:
	ldr r0, [r5, #0x3c]
	bl FUN_0200D9DC
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #3
	blt _0222FAFE
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r7, #0
	bl ov07_0221C448
	pop {r3, r4, r5, r6, r7, pc}
_0222FB1C:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222FA64

	thumb_func_start ov07_0222FB24
ov07_0222FB24: @ 0x0222FB24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r6, r1, #0
	movs r1, #0x47
	lsls r1, r1, #2
	adds r5, r0, #0
	str r2, [sp]
	adds r7, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4]
	ldr r0, [sp]
	str r6, [r4, #4]
	str r0, [r4, #8]
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0x38]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0x3a]
	ldr r0, [r4, #0x10]
	movs r1, #0x29
	bl FUN_02008A78
	movs r1, #0x3a
	ldrsh r1, [r4, r1]
	subs r0, r1, r0
	strh r0, [r4, #0x3a]
	add r0, sp, #4
	adds r1, r5, #0
	bl ov07_0221F9E8
	movs r6, #0
	adds r5, r4, #0
_0222FB80:
	cmp r6, #0
	bne _0222FB90
	adds r0, r7, #0
	movs r1, #1
	str r7, [r5, #0x3c]
	bl FUN_0200DC4C
	b _0222FBA2
_0222FB90:
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	add r2, sp, #4
	bl FUN_0200D734
	movs r1, #1
	str r0, [r5, #0x3c]
	bl FUN_0200E0FC
_0222FBA2:
	ldr r0, [r5, #0x3c]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r5, #0x3c]
	movs r1, #1
	bl FUN_0200DD54
	movs r1, #0x38
	movs r2, #0x3a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #0x3c]
	bl FUN_0200DDB8
	ldr r0, [r5, #0x3c]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x3c]
	movs r1, #2
	bl FUN_0200DF98
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #3
	blt _0222FB80
	ldr r0, [r4]
	ldr r1, _0222FBE8 @ =ov07_0222FA64
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FBE8: .4byte ov07_0222FA64
	thumb_func_end ov07_0222FB24

	thumb_func_start ov07_0222FBEC
ov07_0222FBEC: @ 0x0222FBEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r7, #0
	adds r6, r5, #0
	str r1, [sp, #0x10]
	adds r6, #0x30
	adds r4, r7, #0
_0222FBFC:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x32
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x30
	movs r1, #0
	str r0, [sp, #0xc]
	ldr r2, _0222FC3C @ =0x00007FFF
	adds r0, r6, #0
	adds r3, r1, #0
	bl ov07_022220FC
	ldr r0, [r5, #0x38]
	adds r7, r7, #1
	adds r0, r0, r4
	str r0, [r5, #0x38]
	ldr r1, [r5, #0x48]
	ldr r0, [sp, #0x10]
	adds r6, #0x24
	muls r0, r1, r0
	str r0, [r5, #0x48]
	ldr r0, _0222FC40 @ =0x00002AAA
	adds r5, #0x24
	adds r4, r4, r0
	cmp r7, #6
	blt _0222FBFC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0222FC3C: .4byte 0x00007FFF
_0222FC40: .4byte 0x00002AAA
	thumb_func_end ov07_0222FBEC

	thumb_func_start ov07_0222FC44
ov07_0222FC44: @ 0x0222FC44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	str r0, [sp]
	adds r0, #0x30
	str r0, [sp]
	adds r5, r6, #0
	adds r4, r6, #0
_0222FC5A:
	ldr r0, [sp]
	bl ov07_02222180
	ldr r1, [r5, #0x38]
	movs r2, #0xa
	lsls r0, r1, #2
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r1, r0, #2
	ldr r0, _0222FD00 @ =0x021094DC
	ldr r3, [r6, #0x14]
	ldrsh r0, [r0, r1]
	lsls r2, r2, #0xc
	muls r2, r3, r2
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	adds r3, r1, #0
	movs r1, #0x13
	lsls r1, r1, #4
	movs r2, #0x30
	adds r7, r0, #0
	ldrsh r1, [r6, r1]
	ldrsh r2, [r5, r2]
	ldr r0, [r4, #0x18]
	adds r1, r1, r2
	ldr r2, _0222FD04 @ =0x00000132
	lsls r1, r1, #0x10
	ldrsh r2, [r6, r2]
	asrs r1, r1, #0x10
	mov ip, r2
	movs r2, #2
	lsls r2, r2, #0xa
	adds r7, r7, r2
	ldr r2, _0222FD08 @ =0x00000000
	adcs r3, r2
	lsls r2, r3, #0x14
	lsrs r3, r7, #0xc
	orrs r3, r2
	lsls r2, r3, #4
	asrs r2, r2, #0x10
	mov r3, ip
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r1, [r5, #0x38]
	ldr r0, _0222FD0C @ =0x00003FFF
	cmp r1, r0
	blt _0222FCD6
	ldr r0, _0222FD10 @ =0x0000BF49
	cmp r1, r0
	bgt _0222FCD6
	ldr r0, [r4, #0x18]
	movs r1, #1
	bl FUN_0200DD54
	b _0222FCE6
_0222FCD6:
	ldr r0, [r6]
	bl ov07_0221FAE8
	adds r1, r0, #0
	ldr r0, [r4, #0x18]
	adds r1, r1, #1
	bl FUN_0200DD54
_0222FCE6:
	ldr r0, [sp]
	adds r5, #0x24
	adds r0, #0x24
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r4, r4, #4
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #6
	blt _0222FC5A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FD00: .4byte 0x021094DC
_0222FD04: .4byte 0x00000132
_0222FD08: .4byte 0x00000000
_0222FD0C: .4byte 0x00003FFF
_0222FD10: .4byte 0x0000BF49
	thumb_func_end ov07_0222FC44

	thumb_func_start ov07_0222FD14
ov07_0222FD14: @ 0x0222FD14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r7, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bhi _0222FDFA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222FD2E: @ jump table
	.2byte _0222FD38 - _0222FD2E - 2 @ case 0
	.2byte _0222FD6E - _0222FD2E - 2 @ case 1
	.2byte _0222FD8E - _0222FD2E - 2 @ case 2
	.2byte _0222FDBA - _0222FD2E - 2 @ case 3
	.2byte _0222FDD6 - _0222FD2E - 2 @ case 4
_0222FD38:
	ldr r0, [r4]
	movs r1, #1
	movs r2, #0xf
	bl ov07_02231E08
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r0, #0xfe
	adds r0, r4, r0
	movs r1, #1
	movs r2, #0x10
	movs r3, #0xf
	bl ov07_02222AC4
	ldr r1, [r4, #0x14]
	adds r0, r4, #0
	bl ov07_0222FBEC
	adds r0, r4, #0
	bl ov07_0222FC44
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222FDFA
_0222FD6E:
	adds r0, r4, #0
	bl ov07_0222FC44
	movs r0, #0x42
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222FDFA
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	movs r0, #0x1c
	str r0, [r4, #0x10]
	b _0222FDFA
_0222FD8E:
	adds r0, r4, #0
	bl ov07_0222FC44
	ldr r0, [r4, #0x10]
	subs r0, r0, #1
	str r0, [r4, #0x10]
	bpl _0222FDFA
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	adds r0, r0, #1
	str r0, [r4, #0xc]
	movs r0, #0xf
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r0, #0xfe
	adds r0, r4, r0
	movs r2, #1
	movs r3, #0
	bl ov07_02222AC4
	b _0222FDFA
_0222FDBA:
	adds r0, r4, #0
	bl ov07_0222FC44
	movs r0, #0x42
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222FDFA
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0222FDFA
_0222FDD6:
	movs r6, #0
	adds r5, r4, #0
_0222FDDA:
	ldr r0, [r5, #0x18]
	bl FUN_0200D9DC
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #6
	blt _0222FDDA
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r7, #0
	bl ov07_0221C448
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222FDFA:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222FD14

	thumb_func_start ov07_0222FE04
ov07_0222FE04: @ 0x0222FE04
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r1, #0
	movs r1, #0x4d
	lsls r1, r1, #2
	adds r4, r0, #0
	str r2, [sp]
	adds r7, r3, #0
	bl ov07_022324D8
	adds r6, r0, #0
	str r4, [r6]
	ldr r0, [sp]
	str r5, [r6, #4]
	str r0, [r6, #8]
	adds r0, r4, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	movs r1, #0
	adds r5, r0, #0
	bl FUN_02008A78
	movs r1, #0x13
	lsls r1, r1, #4
	strh r0, [r6, r1]
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02008A78
	ldr r1, _0222FEA8 @ =0x00000132
	strh r0, [r6, r1]
	add r0, sp, #4
	adds r1, r4, #0
	bl ov07_0221F9E8
	movs r4, #0
	adds r5, r6, #0
_0222FE56:
	cmp r4, #0
	bne _0222FE5E
	str r7, [r5, #0x18]
	b _0222FE6A
_0222FE5E:
	ldr r0, [r6, #4]
	ldr r1, [r6, #8]
	add r2, sp, #4
	bl FUN_0200D734
	str r0, [r5, #0x18]
_0222FE6A:
	ldr r0, [r5, #0x18]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r5, #0x18]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r5, #0x18]
	movs r1, #1
	bl FUN_0200DC78
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _0222FE56
	ldr r0, [r6]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_02222004
	str r0, [r6, #0x14]
	ldr r0, [r6]
	ldr r1, _0222FEAC @ =ov07_0222FD14
	adds r2, r6, #0
	bl ov07_0221C410
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222FEA8: .4byte 0x00000132
_0222FEAC: .4byte ov07_0222FD14
	thumb_func_end ov07_0222FE04

	thumb_func_start ov07_0222FEB0
ov07_0222FEB0: @ 0x0222FEB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r1, #0
	add r1, sp, #8
	adds r5, r2, #0
	adds r1, #2
	add r2, sp, #8
	adds r6, r0, #0
	adds r4, r3, #0
	bl FUN_0200DE44
	add r0, sp, #8
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r1, #2
	ldrsh r2, [r0, r1]
	lsls r0, r4, #7
	rsbs r0, r0, #0
	adds r0, r3, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r2, #0x10
	lsls r4, r5, #8
	adds r2, r2, r4
	str r0, [sp]
	movs r0, #0x3b
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	str r0, [sp, #4]
	adds r0, r7, #0
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222268
	adds r0, r6, #0
	movs r1, #1
	bl FUN_0200DCE8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0222FEB0

	thumb_func_start ov07_0222FF04
ov07_0222FF04: @ 0x0222FF04
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r4, #0
	bl ov07_022222F0
	cmp r0, #0
	beq _0222FFBE
	add r1, sp, #8
	adds r0, r4, #0
	adds r1, #2
	add r2, sp, #8
	bl FUN_0200DE44
	add r1, sp, #8
	movs r0, #2
	ldrsh r0, [r1, r0]
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [sp]
	ldr r0, [sp]
	movs r2, #0xe
	muls r1, r0, r1
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r1, r0, #2
	ldr r0, _0222FFC4 @ =0x021094DC
	lsls r2, r2, #0xc
	ldrsh r0, [r0, r1]
	movs r3, #0
	asrs r7, r0, #0x1f
	adds r1, r7, #0
	str r0, [sp, #4]
	blx FUN_020F2948
	adds r3, r0, #0
	adds r5, r1, #0
	add r6, sp, #8
	movs r2, #0
	ldrsh r2, [r6, r2]
	movs r6, #2
	lsls r6, r6, #0xa
	adds r0, r4, #0
	adds r6, r3, r6
	ldr r3, _0222FFC8 @ =0x00000000
	ldr r1, [sp]
	adcs r5, r3
	lsls r3, r5, #0x14
	lsrs r5, r6, #0xc
	orrs r5, r3
	lsls r3, r5, #4
	asrs r3, r3, #0x10
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	movs r2, #0xae
	ldr r0, [sp, #4]
	adds r1, r7, #0
	lsls r2, r2, #2
	movs r3, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	rsbs r0, r1, #0
	blx FUN_020F2178
	ldr r1, _0222FFCC @ =0x45800000
	blx FUN_020F1CC8
	adds r1, r0, #0
	movs r0, #0xfe
	lsls r0, r0, #0x16
	blx FUN_020F1520
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl FUN_0200E024
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0222FFBE:
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222FFC4: .4byte 0x021094DC
_0222FFC8: .4byte 0x00000000
_0222FFCC: .4byte 0x45800000
	thumb_func_end ov07_0222FF04

	thumb_func_start ov07_0222FFD0
ov07_0222FFD0: @ 0x0222FFD0
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x9d
	adds r7, r0, #0
	lsls r1, r1, #2
	ldr r0, [r7, r1]
	cmp r0, #0xf
	bge _02230018
	subs r0, r1, #4
	ldr r0, [r7, r0]
	adds r2, r0, #1
	subs r0, r1, #4
	str r2, [r7, r0]
	ldr r0, [r7, r0]
	cmp r0, #6
	ble _02230018
	movs r2, #0
	subs r0, r1, #4
	str r2, [r7, r0]
	ldr r1, [r7, r1]
	adds r3, r7, #0
	lsls r0, r1, #2
	movs r2, #0x24
	adds r0, r7, r0
	adds r3, #0x54
	muls r2, r1, r2
	adds r1, r3, r2
	ldr r0, [r0, #0x18]
	ldr r2, [r7, #0x10]
	ldr r3, [r7, #0x14]
	bl ov07_0222FEB0
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r1, [r7, r0]
	adds r1, r1, #1
	str r1, [r7, r0]
_02230018:
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r4, #0
	cmp r0, #0
	ble _02230044
	adds r6, r7, #0
	adds r6, #0x54
	adds r5, r7, #0
_0223002A:
	ldr r0, [r5, #0x18]
	adds r1, r6, #0
	bl ov07_0222FF04
	str r0, [sp]
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	adds r4, r4, #1
	adds r6, #0x24
	adds r5, r5, #4
	cmp r4, r0
	blt _0223002A
_02230044:
	cmp r0, #0xf
	blt _02230052
	ldr r0, [sp]
	cmp r0, #1
	bne _02230052
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02230052:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_0222FFD0

	thumb_func_start ov07_02230058
ov07_02230058: @ 0x02230058
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r7, r0, #0
	adds r0, r6, #0
	bl ov07_0222FFD0
	cmp r0, #0
	beq _0223008A
	movs r4, #0
	adds r5, r6, #0
_0223006C:
	ldr r0, [r5, #0x18]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xf
	blt _0223006C
	adds r0, r6, #0
	bl FUN_0201AB0C
	ldr r0, [r6]
	adds r1, r7, #0
	bl ov07_0221C448
	pop {r3, r4, r5, r6, r7, pc}
_0223008A:
	ldr r0, [r6, #8]
	bl FUN_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_02230058

	thumb_func_start ov07_02230094
ov07_02230094: @ 0x02230094
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r5, r1, #0
	movs r1, #0x9e
	lsls r1, r1, #2
	adds r4, r0, #0
	str r2, [sp]
	adds r7, r3, #0
	bl ov07_022324D8
	adds r6, r0, #0
	str r4, [r6]
	ldr r0, [sp]
	str r5, [r6, #4]
	str r0, [r6, #8]
	adds r0, r4, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	movs r1, #0
	adds r5, r0, #0
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	add r0, sp, #0xc
	adds r1, r4, #0
	bl ov07_0221F9E8
	movs r4, #0
	adds r5, r6, #0
_022300E8:
	cmp r4, #0
	bne _022300F0
	str r7, [r5, #0x18]
	b _022300FC
_022300F0:
	ldr r0, [r6, #4]
	ldr r1, [r6, #8]
	add r2, sp, #0xc
	bl FUN_0200D734
	str r0, [r5, #0x18]
_022300FC:
	ldr r0, [r5, #0x18]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r5, #0x18]
	movs r1, #1
	bl FUN_0200DD54
	ldr r0, [r5, #0x18]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r5, #0x18]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x18]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	bl FUN_0200DDB8
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	ldr r0, [r5, #0x18]
	bl FUN_0200DC4C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xf
	blt _022300E8
	ldr r0, [r6]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_02222004
	str r0, [r6, #0x10]
	ldr r0, [r6]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_0222202C
	str r0, [r6, #0x14]
	ldr r0, [r6]
	ldr r1, _0223016C @ =ov07_02230058
	adds r2, r6, #0
	bl ov07_0221C410
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223016C: .4byte ov07_02230058
	thumb_func_end ov07_02230094

	thumb_func_start ov07_02230170
ov07_02230170: @ 0x02230170
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	beq _02230180
	cmp r1, #1
	beq _02230194
	cmp r1, #2
	beq _022301A8
	bx lr
_02230180:
	ldr r1, _022301BC @ =0x00007FFF
	str r1, [r0, #0x18]
	movs r1, #5
	str r1, [r0, #0x24]
	movs r1, #1
	lsls r1, r1, #0x10
	str r1, [r0, #0x1c]
	movs r1, #0x10
	str r1, [r0, #0x28]
	bx lr
_02230194:
	ldr r1, _022301BC @ =0x00007FFF
	str r1, [r0, #0x18]
	movs r1, #4
	mvns r1, r1
	str r1, [r0, #0x24]
	ldr r1, _022301C0 @ =0xFFFF0000
	str r1, [r0, #0x1c]
	movs r1, #0x10
	str r1, [r0, #0x28]
	bx lr
_022301A8:
	ldr r1, _022301BC @ =0x00007FFF
	str r1, [r0, #0x18]
	movs r1, #0xa
	str r1, [r0, #0x24]
	lsls r1, r1, #0xd
	str r1, [r0, #0x1c]
	movs r1, #0x10
	str r1, [r0, #0x28]
	bx lr
	nop
_022301BC: .4byte 0x00007FFF
_022301C0: .4byte 0xFFFF0000
	thumb_func_end ov07_02230170

	thumb_func_start ov07_022301C4
ov07_022301C4: @ 0x022301C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #4]
	bl ov07_02222C84
	str r0, [sp, #8]
	ldr r0, [r5, #0x10]
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #8
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r0, #0x58
	str r0, [sp]
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _022301EC
	movs r0, #0
	str r0, [sp, #4]
_022301EC:
	ldr r0, [sp]
	cmp r0, #0xc0
	ble _022301F6
	movs r0, #0xc0
	str r0, [sp]
_022301F6:
	movs r0, #0
	ldr r1, [r5, #0x20]
	mvns r0, r0
	muls r0, r1, r0
	ldr r4, [sp, #4]
	str r0, [r5, #0x20]
	ldr r0, [sp]
	adds r1, r4, #0
	cmp r1, r0
	bge _02230296
_0223020A:
	movs r0, #2
	tst r0, r4
	ldr r1, [r5, #0x1c]
	beq _0223021A
	ldr r0, [r5, #0x20]
	lsls r0, r0, #0xc
	adds r2, r1, r0
	b _02230220
_0223021A:
	ldr r0, [r5, #0x20]
	lsls r0, r0, #0xc
	subs r2, r1, r0
_02230220:
	ldr r1, [sp, #4]
	ldr r0, [r5, #0x18]
	subs r3, r4, r1
	ldr r1, _0223029C @ =0x00000199
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r1, r0, #2
	ldr r0, _022302A0 @ =0x021094DC
	asrs r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	lsls r2, r2, #0xa
	adds r2, r0, r2
	ldr r0, _022302A4 @ =0x00000000
	adcs r1, r0
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	lsls r0, r1, #4
	asrs r7, r0, #0x10
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x24]
	subs r0, r4, r0
	muls r0, r1, r0
	movs r1, #0xa
	blx FUN_020F2998
	adds r0, r7, r0
	lsls r0, r0, #0x10
	ldr r1, [r5, #0x30]
	asrs r7, r0, #0x10
	lsls r0, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	subs r6, r4, #1
	bpl _0223027A
	adds r6, #0xc0
_0223027A:
	adds r0, r0, r7
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	bl ov07_02222D88
	ldr r1, [sp, #8]
	lsls r2, r6, #2
	str r0, [r1, r2]
	ldr r0, [sp]
	adds r4, r4, #1
	cmp r4, r0
	blt _0223020A
_02230296:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0223029C: .4byte 0x00000199
_022302A0: .4byte 0x021094DC
_022302A4: .4byte 0x00000000
	thumb_func_end ov07_022301C4

	thumb_func_start ov07_022302A8
ov07_022302A8: @ 0x022302A8
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r6, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _022302BE
	cmp r0, #1
	beq _022302D2
	cmp r0, #2
	beq _022302FC
	pop {r4, r5, r6, pc}
_022302BE:
	adds r0, r4, #0
	bl ov07_02230170
	adds r0, r4, #0
	bl ov07_022301C4
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
_022302D2:
	ldr r0, [r4, #0x28]
	subs r0, r0, #1
	str r0, [r4, #0x28]
	adds r0, r4, #0
	bl ov07_022301C4
	ldr r0, [r4, #0x28]
	cmp r0, #0
	bge _022303A0
	ldr r0, [r4, #0x2c]
	adds r0, r0, #1
	str r0, [r4, #0x2c]
	cmp r0, #3
	bge _022302F4
	movs r0, #0
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
_022302F4:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
_022302FC:
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAC8
	cmp r0, #0
	bne _02230318
	ldr r0, [r4, #0xc]
	movs r1, #6
	movs r2, #0
	bl FUN_020087A4
_02230318:
	ldr r0, [r4, #4]
	bl ov07_02222C98
	ldr r0, [r4, #4]
	bl ov07_02222C60
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FAEC
	adds r5, r0, #0
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FB04
	adds r1, r0, #0
	lsls r0, r5, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	ldr r0, [r4]
	bl ov07_0221FAE8
	adds r1, r0, #0
	lsls r1, r1, #0x18
	movs r0, #0
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FAEC
	adds r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221BFD0
	adds r3, r0, #0
	lsls r0, r5, #0x18
	movs r1, #1
	lsrs r0, r0, #0x18
	lsls r1, r1, #0xe
	movs r2, #0
	bl FUN_0201C1C4
	ldr r0, [r4]
	bl ov07_0221C4A0
	adds r5, r0, #0
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FAEC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r6, #0
	bl ov07_0221C448
_022303A0:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_022302A8

	thumb_func_start ov07_022303A4
ov07_022303A4: @ 0x022303A4
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x34
	adds r7, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r7, [r4]
	adds r0, r7, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	movs r1, #0
	str r0, [r4, #0xc]
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldr r0, [r4, #0xc]
	movs r1, #0x29
	bl FUN_02008A78
	subs r0, r5, r0
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAC8
	cmp r0, #0
	bne _02230402
	ldr r0, [r4, #0xc]
	movs r1, #6
	movs r2, #1
	bl FUN_020087A4
_02230402:
	subs r6, #0x28
	lsls r0, r6, #0x10
	str r5, [r4, #0x14]
	subs r5, #0x28
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	rsbs r1, r5, #0
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	str r5, [r4, #0x10]
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	bl ov07_02222D88
	str r0, [r4, #0x30]
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FAF8
	bl ov07_02222D90
	adds r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221BFD0
	adds r2, r0, #0
	ldr r1, [r4, #0x30]
	adds r0, r5, #0
	bl ov07_02222BE4
	str r0, [r4, #4]
	movs r0, #1
	str r0, [r4, #0x20]
	adds r0, r7, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	subs r0, r0, #3
	cmp r0, #1
	bhi _0223048A
	ldr r0, [r4]
	movs r1, #1
	bl ov07_0221FAEC
	adds r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAE8
	adds r1, r0, #0
	lsls r0, r5, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	ldr r0, [r4]
	bl ov07_0221FAE8
	adds r1, r0, #0
	adds r1, r1, #1
	lsls r1, r1, #0x18
	movs r0, #0
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
_0223048A:
	ldr r0, [r4]
	ldr r1, _02230498 @ =ov07_022302A8
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230498: .4byte ov07_022302A8
	thumb_func_end ov07_022303A4

	thumb_func_start ov07_0223049C
ov07_0223049C: @ 0x0223049C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #5
	bls _022304AC
	b _022305F0
_022304AC:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022304B8: @ jump table
	.2byte _022304C4 - _022304B8 - 2 @ case 0
	.2byte _0223050A - _022304B8 - 2 @ case 1
	.2byte _02230544 - _022304B8 - 2 @ case 2
	.2byte _0223057E - _022304B8 - 2 @ case 3
	.2byte _022305CA - _022304B8 - 2 @ case 4
	.2byte _022305E2 - _022304B8 - 2 @ case 5
_022304C4:
	movs r2, #0
	str r2, [sp]
	movs r0, #8
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xc
	movs r1, #0x7f
	adds r3, r2, #0
	bl ov07_02222268
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _022305F4 @ =0xFFFF1FFF
	ands r1, r0
	lsrs r0, r2, #0xd
	orrs r0, r1
	str r0, [r2]
	movs r1, #0
	ldr r0, [r4]
	adds r2, r1, #0
	bl ov07_02231EC0
	ldr r1, _022305F8 @ =0x04000040
	movs r0, #0xff
	strh r0, [r1]
	movs r0, #0xbf
	strh r0, [r1, #4]
	movs r0, #7
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_0223050A:
	ldr r0, [r4, #8]
	subs r0, r0, #1
	str r0, [r4, #8]
	bpl _022305F0
	ldr r0, [r4]
	bl ov07_0221FA78
	adds r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221E6C8
	adds r2, r0, #0
	movs r3, #0
	lsls r2, r2, #0x10
	str r3, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, _022305FC @ =0x0000FFFF
	movs r1, #1
	str r0, [sp, #8]
	adds r0, r5, #0
	lsrs r2, r2, #0x10
	bl FUN_02003370
	ldr r0, [r4, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_02230544:
	adds r0, r4, #0
	adds r0, #0xc
	bl ov07_022222B4
	cmp r0, #0
	beq _02230574
	movs r0, #0xc
	ldrsh r2, [r4, r0]
	movs r0, #0x7f
	add sp, #0xc
	subs r0, r0, r2
	lsls r1, r0, #8
	movs r0, #0xff
	lsls r0, r0, #8
	adds r2, #0x80
	ands r1, r0
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	orrs r0, r1
	ldr r1, _022305F8 @ =0x04000040
	strh r0, [r1]
	movs r0, #0xbf
	strh r0, [r1, #4]
	pop {r4, r5, pc}
_02230574:
	ldr r0, [r4, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_0223057E:
	ldr r0, [r4]
	bl ov07_0221FA78
	bl FUN_02003B44
	cmp r0, #0
	bne _022305F0
	ldr r0, [r4, #4]
	movs r2, #1
	adds r0, r0, #1
	str r0, [r4, #4]
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _022305F4 @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	ldr r0, [r4]
	bl ov07_0221FA78
	adds r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221E6C8
	adds r2, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r3, #0
	lsls r2, r2, #0x10
	ldr r0, _022305FC @ =0x0000FFFF
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	lsrs r2, r2, #0x10
	bl FUN_02003370
	add sp, #0xc
	pop {r4, r5, pc}
_022305CA:
	ldr r0, [r4]
	bl ov07_0221FA78
	bl FUN_02003B44
	cmp r0, #0
	bne _022305F0
	ldr r0, [r4, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_022305E2:
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
_022305F0:
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_022305F4: .4byte 0xFFFF1FFF
_022305F8: .4byte 0x04000040
_022305FC: .4byte 0x0000FFFF
	thumb_func_end ov07_0223049C

	thumb_func_start ov07_02230600
ov07_02230600: @ 0x02230600
	push {r4, lr}
	movs r1, #0x34
	adds r4, r0, #0
	bl ov07_022324D8
	adds r2, r0, #0
	ldr r1, _02230618 @ =ov07_0223049C
	adds r0, r4, #0
	str r4, [r2]
	bl ov07_0221C410
	pop {r4, pc}
	.align 2, 0
_02230618: .4byte ov07_0223049C
	thumb_func_end ov07_02230600

	thumb_func_start ov07_0223061C
ov07_0223061C: @ 0x0223061C
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bhi _022306CC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02230636: @ jump table
	.2byte _02230640 - _02230636 - 2 @ case 0
	.2byte _02230666 - _02230636 - 2 @ case 1
	.2byte _0223067A - _02230636 - 2 @ case 2
	.2byte _022306A0 - _02230636 - 2 @ case 3
	.2byte _022306B4 - _02230636 - 2 @ case 4
_02230640:
	ldr r0, [r4]
	movs r1, #0
	movs r2, #0x10
	bl ov07_02231E08
	movs r1, #0
	movs r2, #0x10
	str r1, [sp]
	movs r0, #8
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x14
	adds r3, r2, #0
	bl ov07_02222AC4
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _022306CC
_02230666:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222AF4
	cmp r0, #0
	beq _022306CC
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _022306CC
_0223067A:
	ldr r0, [r4, #0x10]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _022306CC
	ldr r0, [r4, #0xc]
	movs r2, #0
	adds r0, r0, #1
	str r0, [r4, #0xc]
	movs r1, #0x10
	str r1, [sp]
	movs r0, #8
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x14
	adds r3, r2, #0
	bl ov07_02222AC4
	b _022306CC
_022306A0:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222AF4
	cmp r0, #0
	beq _022306CC
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _022306CC
_022306B4:
	ldr r0, [r4, #0x10]
	bl FUN_0200D9DC
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, pc}
_022306CC:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0223061C

	thumb_func_start ov07_022306D8
ov07_022306D8: @ 0x022306D8
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	movs r1, #0x3c
	adds r6, r0, #0
	str r2, [sp]
	adds r5, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r6, [r4]
	ldr r0, [sp]
	str r7, [r4, #4]
	str r0, [r4, #8]
	str r5, [r4, #0x10]
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200DC78
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4]
	ldr r1, _02230710 @ =ov07_0223061C
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02230710: .4byte ov07_0223061C
	thumb_func_end ov07_022306D8

	thumb_func_start ov07_02230714
ov07_02230714: @ 0x02230714
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #4
	bhi _022307D8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223072E: @ jump table
	.2byte _02230738 - _0223072E - 2 @ case 0
	.2byte _022307A2 - _0223072E - 2 @ case 1
	.2byte _022307E4 - _0223072E - 2 @ case 2
	.2byte _02230850 - _0223072E - 2 @ case 3
	.2byte _022308A2 - _0223072E - 2 @ case 4
_02230738:
	ldr r0, [r4, #0x68]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x6c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4, #0x74]
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r1, [r4, #0x5c]
	ldr r2, [r4, #0x60]
	ldr r3, [r4, #0x64]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	adds r0, #0x14
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222590
	movs r1, #0xa
	movs r2, #8
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x10]
	adds r0, #0x38
	bl ov07_0222283C
	adds r0, r4, #0
	ldr r1, [r4, #0x10]
	adds r0, #0x14
	bl ov07_02222788
	movs r0, #0
	str r0, [sp]
	movs r1, #8
	movs r2, #0xc
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r3, [r4, #0x28]
	bl ov07_022226C4
	ldr r0, [r4, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_022307A2:
	movs r1, #0xa
	movs r2, #8
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x10]
	adds r0, #0x38
	bl ov07_0222283C
	adds r0, r4, #0
	ldr r1, [r4, #0x10]
	adds r0, #0x14
	bl ov07_02222788
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r1, #8
	movs r2, #0xc
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r3, [r4, #0x28]
	bl ov07_022226C4
	cmp r5, #0
	beq _022307DA
_022307D8:
	b _022308E0
_022307DA:
	ldr r0, [r4, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_022307E4:
	ldr r0, [r4, #0x64]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x6c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4, #0x74]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r1, [r4, #0x60]
	ldr r2, [r4, #0x5c]
	ldr r3, [r4, #0x68]
	adds r0, r4, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	adds r0, #0x14
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222590
	movs r1, #0xa
	movs r2, #8
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x10]
	adds r0, #0x38
	bl ov07_0222283C
	adds r0, r4, #0
	ldr r1, [r4, #0x10]
	adds r0, #0x14
	bl ov07_02222788
	movs r0, #0
	str r0, [sp]
	movs r1, #8
	movs r2, #0xc
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r3, [r4, #0x28]
	bl ov07_022226C4
	ldr r0, [r4, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_02230850:
	movs r1, #0xa
	movs r2, #8
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x10]
	adds r0, #0x38
	bl ov07_0222283C
	adds r0, r4, #0
	ldr r1, [r4, #0x10]
	adds r0, #0x14
	bl ov07_02222788
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r1, #8
	movs r2, #0xc
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r3, [r4, #0x28]
	bl ov07_022226C4
	cmp r5, #0
	bne _022308E0
	ldr r0, [r4, #0x70]
	subs r0, r0, #1
	str r0, [r4, #0x70]
	cmp r0, #0
	bgt _0223089A
	ldr r0, [r4, #4]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_0223089A:
	movs r0, #0
	add sp, #0xc
	str r0, [r4, #4]
	pop {r4, r5, pc}
_022308A2:
	movs r2, #0xa
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #8
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_020087A4
	movs r1, #0xc
	adds r2, r1, #0
	ldr r0, [r4, #0x10]
	adds r2, #0xf4
	bl FUN_020087A4
	movs r1, #0xd
	adds r2, r1, #0
	ldr r0, [r4, #0x10]
	adds r2, #0xf3
	bl FUN_020087A4
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
_022308E0:
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov07_02230714

	thumb_func_start ov07_022308E4
ov07_022308E4: @ 0x022308E4
	push {r3, r4, r5, lr}
	movs r1, #0x78
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4]
	adds r0, r5, #0
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
	strh r0, [r4, #0xc]
	ldr r0, [r4]
	bl ov07_0221C470
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #8]
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0xa]
	movs r1, #0xa
	str r1, [r4, #0x5c]
	movs r0, #7
	str r0, [r4, #0x60]
	str r1, [r4, #0x64]
	movs r0, #0x1e
	str r0, [r4, #0x68]
	str r1, [r4, #0x6c]
	movs r3, #1
	ldr r0, _02230958 @ =0x00040003
	str r3, [r4, #0x70]
	str r0, [r4, #0x74]
	movs r1, #2
	adds r0, r4, #0
	str r1, [sp]
	adds r0, #0x38
	movs r2, #0
	bl ov07_022227A8
	ldr r0, [r4]
	ldr r1, _0223095C @ =ov07_02230714
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_02230958: .4byte 0x00040003
_0223095C: .4byte ov07_02230714
	thumb_func_end ov07_022308E4

	thumb_func_start ov07_02230960
ov07_02230960: @ 0x02230960
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	ldr r1, [r4, #0x2c]
	adds r0, #8
	bl ov07_022222F0
	cmp r0, #0
	bne _0223098A
	ldr r0, [r4, #0x2c]
	bl FUN_0200D9DC
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	pop {r3, r4, r5, pc}
_0223098A:
	ldr r0, [r4, #4]
	bl FUN_0200D020
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02230960

	thumb_func_start ov07_02230994
ov07_02230994: @ 0x02230994
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r1, #0x30
	adds r5, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r5, [r4]
	adds r0, r5, #0
	bl ov07_0221C528
	str r0, [r4, #4]
	adds r0, r5, #0
	bl ov07_0221C468
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _022309D8
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4C0
	str r0, [r4, #0x2c]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4C0
	bl FUN_0200D9DC
	b _022309EE
_022309D8:
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4C0
	str r0, [r4, #0x2c]
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221C4C0
	bl FUN_0200D9DC
_022309EE:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_02222004
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0222202C
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl ov07_02221F80
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl ov07_02221F80
	ldr r1, [sp, #0x10]
	lsls r2, r7, #6
	adds r6, r1, r2
	ldr r1, [sp, #0xc]
	lsls r1, r1, #4
	rsbs r1, r1, #0
	adds r5, r0, r1
	str r1, [sp, #8]
	lsls r1, r6, #0x10
	lsls r2, r5, #0x10
	ldr r0, [r4, #0x2c]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r0, [sp, #8]
	movs r2, #0x30
	adds r0, r5, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r2, r7, r2
	str r0, [sp]
	movs r0, #6
	adds r2, r6, r2
	str r0, [sp, #4]
	adds r0, r4, #0
	lsls r1, r6, #0x10
	lsls r2, r2, #0x10
	lsls r3, r5, #0x10
	adds r0, #8
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222268
	ldr r0, [r4]
	ldr r1, _02230A6C @ =ov07_02230960
	adds r2, r4, #0
	bl ov07_0221C410
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02230A6C: .4byte ov07_02230960
	thumb_func_end ov07_02230994

	thumb_func_start ov07_02230A70
ov07_02230A70: @ 0x02230A70
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #5
	bls _02230A80
	b _02230B9C
_02230A80:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02230A8C: @ jump table
	.2byte _02230A98 - _02230A8C - 2 @ case 0
	.2byte _02230AB2 - _02230A8C - 2 @ case 1
	.2byte _02230B00 - _02230A8C - 2 @ case 2
	.2byte _02230B1C - _02230A8C - 2 @ case 3
	.2byte _02230B5E - _02230A8C - 2 @ case 4
	.2byte _02230B76 - _02230A8C - 2 @ case 5
_02230A98:
	movs r1, #4
	adds r0, r4, #0
	str r1, [sp]
	adds r0, #0x40
	movs r2, #0
	movs r3, #1
	bl ov07_022227A8
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, pc}
_02230AB2:
	movs r1, #0x18
	movs r2, #0x1a
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x14]
	adds r0, #0x40
	bl ov07_0222283C
	cmp r0, #0
	bne _02230B9C
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0x1a
	ldrsh r3, [r4, r0]
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	ldr r2, [r4, #0x10]
	subs r0, #0x1f
	muls r0, r2, r0
	adds r0, r3, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r4, #0
	ldr r4, [r4, #0xc]
	movs r2, #0x28
	muls r2, r4, r2
	adds r2, r1, r2
	lsls r2, r2, #0x10
	adds r0, #0x1c
	asrs r2, r2, #0x10
	bl ov07_02222268
	add sp, #8
	pop {r4, r5, r6, pc}
_02230B00:
	adds r0, r4, #0
	ldr r1, [r4, #0x14]
	adds r0, #0x1c
	bl ov07_02222314
	cmp r0, #0
	bne _02230B9C
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #8
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
_02230B1C:
	ldr r0, [r4, #8]
	subs r0, r0, #1
	str r0, [r4, #8]
	bpl _02230B9C
	ldr r0, [r4, #4]
	movs r5, #0x28
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0x1a
	ldrsh r3, [r4, r0]
	movs r0, #0x18
	ldrsh r2, [r4, r0]
	movs r0, #4
	str r3, [sp]
	str r0, [sp, #4]
	ldr r1, [r4, #0xc]
	adds r0, r4, #0
	adds r6, r1, #0
	muls r6, r5, r6
	adds r1, r2, r6
	lsls r1, r1, #0x10
	ldr r4, [r4, #0x10]
	subs r5, #0x2f
	muls r5, r4, r5
	adds r3, r3, r5
	lsls r3, r3, #0x10
	adds r0, #0x1c
	asrs r1, r1, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222268
	add sp, #8
	pop {r4, r5, r6, pc}
_02230B5E:
	adds r0, r4, #0
	ldr r1, [r4, #0x14]
	adds r0, #0x1c
	bl ov07_02222314
	cmp r0, #0
	bne _02230B9C
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, pc}
_02230B76:
	movs r2, #0x18
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x1a
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_020087A4
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
_02230B9C:
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_02230A70

	thumb_func_start ov07_02230BA0
ov07_02230BA0: @ 0x02230BA0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x64
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	str r5, [r4]
	bl ov07_0221C468
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x14]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0x18]
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0x1a]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_02222004
	str r0, [r4, #0xc]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0222202C
	str r0, [r4, #0x10]
	ldr r0, [r4]
	ldr r1, _02230BF4 @ =ov07_02230A70
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	nop
_02230BF4: .4byte ov07_02230A70
	thumb_func_end ov07_02230BA0

	thumb_func_start ov07_02230BF8
ov07_02230BF8: @ 0x02230BF8
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #4
	bls _02230C08
	b _02230D18
_02230C08:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02230C14: @ jump table
	.2byte _02230C1E - _02230C14 - 2 @ case 0
	.2byte _02230C54 - _02230C14 - 2 @ case 1
	.2byte _02230C7C - _02230C14 - 2 @ case 2
	.2byte _02230CDA - _02230C14 - 2 @ case 3
	.2byte _02230CF2 - _02230C14 - 2 @ case 4
_02230C1E:
	movs r0, #0x16
	ldrsh r3, [r4, r0]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	movs r5, #4
	lsls r0, r0, #4
	adds r0, r3, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	str r5, [sp, #4]
	ldr r2, [r4, #8]
	subs r5, #0x2c
	muls r5, r2, r5
	adds r2, r1, r5
	adds r0, r4, #0
	lsls r2, r2, #0x10
	adds r0, #0x18
	asrs r2, r2, #0x10
	bl ov07_02222268
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_02230C54:
	adds r0, r4, #0
	ldr r1, [r4, #0x10]
	adds r0, #0x18
	bl ov07_02222314
	cmp r0, #0
	bne _02230D18
	ldr r0, [r4, #4]
	movs r1, #4
	adds r0, r0, #1
	str r0, [r4, #4]
	adds r4, #0x3c
	adds r0, r4, #0
	movs r2, #0
	movs r3, #1
	str r1, [sp]
	bl ov07_022227A8
	add sp, #8
	pop {r3, r4, r5, pc}
_02230C7C:
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02008A78
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r0, r4, #0
	ldr r3, [r4, #0x10]
	adds r0, #0x3c
	adds r1, r5, #0
	bl ov07_0222283C
	cmp r0, #0
	bne _02230D18
	ldr r0, [r4, #4]
	movs r5, #4
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0x16
	ldrsh r3, [r4, r0]
	movs r0, #0x14
	ldrsh r2, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x18
	str r3, [sp]
	str r5, [sp, #4]
	ldr r1, [r4, #8]
	ldr r4, [r4, #0xc]
	subs r5, #0x2c
	muls r5, r1, r5
	lsls r4, r4, #4
	adds r1, r2, r5
	adds r3, r3, r4
	lsls r1, r1, #0x10
	lsls r3, r3, #0x10
	asrs r1, r1, #0x10
	asrs r3, r3, #0x10
	bl ov07_02222268
	add sp, #8
	pop {r3, r4, r5, pc}
_02230CDA:
	adds r0, r4, #0
	ldr r1, [r4, #0x10]
	adds r0, #0x18
	bl ov07_02222314
	cmp r0, #0
	bne _02230D18
	ldr r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_02230CF2:
	movs r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_020087A4
	movs r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_020087A4
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
_02230D18:
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02230BF8

	thumb_func_start ov07_02230D1C
ov07_02230D1C: @ 0x02230D1C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x60
	bl ov07_022324D8
	adds r4, r0, #0
	adds r0, r5, #0
	str r5, [r4]
	bl ov07_0221C470
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #0x16]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_02222004
	str r0, [r4, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov07_0222202C
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, _02230D70 @ =ov07_02230BF8
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	nop
_02230D70: .4byte ov07_02230BF8
	thumb_func_end ov07_02230D1C

	thumb_func_start ov07_02230D74
ov07_02230D74: @ 0x02230D74
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r7, r1, #0
	adds r4, r0, #0
	movs r1, #0xac
	adds r6, r2, #0
	str r3, [sp]
	bl ov07_022324D8
	str r4, [r0]
	str r0, [sp, #4]
	str r6, [r0, #0xc]
	adds r0, r4, #0
	bl ov07_0221C468
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02222004
	ldr r1, [sp, #4]
	str r0, [r1, #0x10]
	ldr r1, [r1]
	add r0, sp, #8
	bl ov07_0221F9E8
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl ov07_02221F80
	add r1, sp, #8
	strh r0, [r1]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov07_02221F80
	add r1, sp, #8
	ldr r5, [sp, #4]
	strh r0, [r1, #2]
	movs r4, #0
_02230DC8:
	cmp r4, #0
	add r2, sp, #8
	bne _02230DE2
	ldr r0, [sp]
	movs r1, #0
	str r0, [r5, #0x14]
	ldrsh r1, [r2, r1]
	adds r3, r2, #0
	movs r2, #2
	ldrsh r2, [r3, r2]
	bl FUN_0200DDB8
	b _02230DEC
_02230DE2:
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_0200D734
	str r0, [r5, #0x14]
_02230DEC:
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r5, #0x14]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r5, #0x14]
	movs r1, #1
	bl FUN_0200DD54
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _02230DC8
	ldr r0, [sp, #4]
	ldr r1, _02230E1C @ =ov07_02230E20
	ldr r0, [r0]
	ldr r2, [sp, #4]
	bl ov07_0221C410
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02230E1C: .4byte ov07_02230E20
	thumb_func_end ov07_02230D74

	thumb_func_start ov07_02230E20
ov07_02230E20: @ 0x02230E20
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r7, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #4
	bhi _02230F04
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02230E38: @ jump table
	.2byte _02230E42 - _02230E38 - 2 @ case 0
	.2byte _02230E6A - _02230E38 - 2 @ case 1
	.2byte _02230E8A - _02230E38 - 2 @ case 2
	.2byte _02230EBC - _02230E38 - 2 @ case 3
	.2byte _02230EE2 - _02230E38 - 2 @ case 4
_02230E42:
	adds r2, r4, #0
	ldr r0, [r4, #0x14]
	ldr r3, [r4, #0x10]
	adds r1, #0x1c
	adds r2, #0x64
	bl ov07_02230F0C
	adds r1, r4, #0
	adds r2, r4, #0
	ldr r0, [r4, #0x14]
	adds r1, #0x1c
	adds r2, #0x64
	bl ov07_02230F6C
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #8
	str r0, [r4, #8]
	b _02230F04
_02230E6A:
	ldr r0, [r4, #8]
	adds r2, r4, #0
	subs r0, r0, #1
	str r0, [r4, #8]
	ldr r0, [r4, #0x14]
	adds r1, #0x1c
	adds r2, #0x64
	bl ov07_02230F6C
	ldr r0, [r4, #8]
	cmp r0, #0
	bge _02230F04
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _02230F04
_02230E8A:
	adds r2, r4, #0
	ldr r0, [r4, #0x18]
	ldr r3, [r4, #0x10]
	adds r1, #0x40
	adds r2, #0x88
	bl ov07_02230F0C
	adds r1, r4, #0
	adds r2, r4, #0
	ldr r0, [r4, #0x18]
	adds r1, #0x40
	adds r2, #0x88
	bl ov07_02230F6C
	adds r1, r4, #0
	adds r2, r4, #0
	ldr r0, [r4, #0x14]
	adds r1, #0x1c
	adds r2, #0x64
	bl ov07_02230F6C
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _02230F04
_02230EBC:
	adds r2, r4, #0
	ldr r0, [r4, #0x14]
	adds r1, #0x1c
	adds r2, #0x64
	bl ov07_02230F6C
	adds r1, r4, #0
	adds r2, r4, #0
	ldr r0, [r4, #0x18]
	adds r1, #0x40
	adds r2, #0x88
	bl ov07_02230F6C
	cmp r0, #0
	beq _02230F04
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _02230F04
_02230EE2:
	movs r6, #0
	adds r5, r4, #0
_02230EE6:
	ldr r0, [r5, #0x14]
	bl FUN_0200D9DC
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #2
	blt _02230EE6
	ldr r0, [r4]
	adds r1, r7, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
_02230F04:
	ldr r0, [r4, #0xc]
	bl FUN_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02230E20

	thumb_func_start ov07_02230F0C
ov07_02230F0C: @ 0x02230F0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r1, #0
	adds r5, r0, #0
	movs r1, #2
	adds r7, r2, #0
	adds r4, r3, #0
	bl FUN_0200DF98
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200DCE8
	add r1, sp, #8
	adds r0, r5, #0
	adds r1, #2
	add r2, sp, #8
	bl FUN_0200DE44
	add r1, sp, #8
	movs r0, #0
	ldrsh r3, [r1, r0]
	movs r0, #2
	ldrsh r1, [r1, r0]
	adds r0, r3, #0
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsls r2, r4, #4
	asrs r0, r0, #0x10
	adds r2, r1, r2
	str r0, [sp]
	movs r0, #0x20
	lsls r2, r2, #0x10
	str r0, [sp, #4]
	adds r0, r6, #0
	asrs r2, r2, #0x10
	bl ov07_02222268
	movs r0, #0x20
	movs r2, #0xa
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #2
	adds r3, r2, #0
	bl ov07_02222508
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_02230F0C

	thumb_func_start ov07_02230F6C
ov07_02230F6C: @ 0x02230F6C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r4, r2, #0
	adds r1, r5, #0
	bl ov07_022222F0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02222748
	cmp r0, #0
	beq _02230F8A
	movs r0, #0
	pop {r3, r4, r5, pc}
_02230F8A:
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02230F6C

	thumb_func_start ov07_02230F98
ov07_02230F98: @ 0x02230F98
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x3c
	adds r6, r0, #0
	adds r7, r2, #0
	adds r5, r3, #0
	bl ov07_022324D8
	adds r4, r0, #0
	str r6, [r4]
	str r7, [r4, #0xc]
	str r5, [r4, #0x10]
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #0x10]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0200DD54
	ldr r0, [r4, #0x10]
	bl FUN_0200DD30
	str r0, [r4, #8]
	ldr r0, [r4]
	ldr r1, _02230FE4 @ =ov07_02230FE8
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230FE4: .4byte ov07_02230FE8
	thumb_func_end ov07_02230F98

	thumb_func_start ov07_02230FE8
ov07_02230FE8: @ 0x02230FE8
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #4
	bhi _022310D4
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02231002: @ jump table
	.2byte _0223100C - _02231002 - 2 @ case 0
	.2byte _0223103C - _02231002 - 2 @ case 1
	.2byte _02231062 - _02231002 - 2 @ case 2
	.2byte _022310A0 - _02231002 - 2 @ case 3
	.2byte _022310BC - _02231002 - 2 @ case 4
_0223100C:
	movs r0, #4
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x14
	movs r1, #0
	movs r2, #0x10
	movs r3, #0x14
	bl ov07_02222AC4
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, [r4]
	movs r1, #0
	movs r2, #0x14
	bl ov07_02231E08
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _022310D4
_0223103C:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222AF4
	cmp r0, #0
	beq _022310D4
	ldr r0, [r4, #4]
	movs r1, #1
	adds r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl FUN_0200DC78
	movs r1, #1
	ldr r0, [r4, #0x10]
	lsls r1, r1, #0xc
	bl FUN_0200DC8C
	b _022310D4
_02231062:
	ldr r0, [r4, #0x10]
	bl FUN_0200DCD4
	movs r1, #3
	blx FUN_020F2998
	ldr r2, [r4, #8]
	ldr r0, [r4, #0x10]
	adds r1, r2, r1
	bl FUN_0200DD24
	ldr r0, [r4, #0x10]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _022310D4
	ldr r0, [r4, #4]
	movs r1, #0x10
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0x14
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x14
	movs r2, #0
	movs r3, #4
	bl ov07_02222AC4
	b _022310D4
_022310A0:
	adds r0, r4, #0
	adds r0, #0x14
	bl ov07_02222AF4
	cmp r0, #0
	beq _022310D4
	ldr r0, [r4, #4]
	movs r1, #0
	adds r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl FUN_0200DCE8
	b _022310D4
_022310BC:
	ldr r0, [r4, #0x10]
	bl FUN_0200D9DC
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, pc}
_022310D4:
	ldr r0, [r4, #0xc]
	bl FUN_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02230FE8

	thumb_func_start ov07_022310E0
ov07_022310E0: @ 0x022310E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	str r1, [sp, #4]
	str r2, [sp, #8]
	movs r1, #0x54
	adds r5, r0, #0
	str r3, [sp, #0xc]
	bl ov07_022324D8
	ldr r1, [sp, #8]
	str r5, [r0]
	str r0, [sp, #0x14]
	str r1, [r0, #8]
	ldr r0, [r0]
	bl ov07_0221C468
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02222004
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r1, [r1]
	add r0, sp, #0x18
	bl ov07_0221F9E8
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov07_02221F80
	add r1, sp, #0x18
	strh r0, [r1]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl ov07_02221F80
	ldr r7, [sp, #0x14]
	ldr r6, [sp, #0x14]
	ldr r5, [sp, #0x14]
	add r1, sp, #0x18
	adds r7, #0x3c
	adds r6, #0x24
	strh r0, [r1, #2]
	movs r4, #5
	adds r5, #0x14
	adds r7, #0x14
	adds r6, #0x14
_02231144:
	cmp r4, #5
	add r2, sp, #0x18
	bne _0223115E
	ldr r0, [sp, #0xc]
	movs r1, #0
	str r0, [r5, #0xc]
	ldrsh r1, [r2, r1]
	adds r3, r2, #0
	movs r2, #2
	ldrsh r2, [r3, r2]
	bl FUN_0200DDB8
	b _02231168
_0223115E:
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl FUN_0200D734
	str r0, [r5, #0xc]
_02231168:
	ldr r0, [r5, #0xc]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r5, #0xc]
	movs r1, #1
	bl FUN_0200DD54
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [sp, #0x10]
	adds r1, r6, #0
	str r0, [sp]
	ldr r0, [r5, #0xc]
	adds r2, r7, #0
	adds r3, r4, #0
	bl ov07_022311B0
	subs r5, r5, #4
	subs r7, r7, #4
	subs r6, r6, #4
	subs r4, r4, #1
	bpl _02231144
	ldr r0, [sp, #0x14]
	ldr r1, _022311AC @ =ov07_02231234
	ldr r0, [r0]
	ldr r2, [sp, #0x14]
	bl ov07_0221C410
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_022311AC: .4byte ov07_02231234
	thumb_func_end ov07_022310E0

	thumb_func_start ov07_022311B0
ov07_022311B0: @ 0x022311B0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r3, #0
	adds r6, r1, #0
	lsrs r1, r4, #0x1f
	adds r1, r4, r1
	asrs r1, r1, #1
	adds r5, r0, #0
	adds r7, r2, #0
	bl FUN_0200DC4C
	lsls r0, r4, #1
	str r0, [r7]
	movs r0, #0x10
	add r1, sp, #0
	str r0, [r6]
	adds r0, r5, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	movs r1, #2
	adds r6, r1, #0
	add r2, sp, #0
	subs r6, #0xe
	muls r6, r4, r6
	ldr r0, [sp, #0x18]
	ldrsh r3, [r2, r1]
	adds r6, #0x28
	adds r4, r0, #0
	muls r4, r6, r4
	adds r0, r3, r4
	movs r3, #0
	strh r0, [r2, #2]
	ldrsh r0, [r2, r3]
	adds r0, #0x28
	strh r0, [r2]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	adds r0, r5, #0
	bl FUN_0200DDB8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_022311B0

	thumb_func_start ov07_02231204
ov07_02231204: @ 0x02231204
	push {r3, lr}
	ldr r3, [r2]
	cmp r3, #0
	ble _0223121A
	subs r1, r3, #1
	str r1, [r2]
	bne _02231230
	movs r1, #1
	bl FUN_0200DCE8
	b _02231230
_0223121A:
	ldr r2, [r1]
	cmp r2, #0
	ble _02231226
	subs r0, r2, #1
	str r0, [r1]
	b _02231230
_02231226:
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #1
	pop {r3, pc}
_02231230:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov07_02231204

	thumb_func_start ov07_02231234
ov07_02231234: @ 0x02231234
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r1, #4]
	str r1, [sp]
	cmp r0, #0
	beq _02231246
	cmp r0, #1
	beq _02231278
	b _0223129C
_02231246:
	adds r6, r1, #0
	adds r4, r1, #0
	movs r7, #0
	adds r6, #0x3c
	adds r4, #0x24
	adds r5, r1, #0
_02231252:
	ldr r0, [r5, #0xc]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov07_02231204
	adds r7, r7, #1
	adds r6, r6, #4
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #6
	blt _02231252
	cmp r0, #0
	beq _0223129C
	ldr r0, [sp]
	ldr r0, [r0, #4]
	adds r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	b _0223129C
_02231278:
	movs r5, #0
	adds r4, r1, #0
_0223127C:
	ldr r0, [r4, #0xc]
	bl FUN_0200D9DC
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #6
	blt _0223127C
	ldr r0, [sp]
	adds r1, r6, #0
	ldr r0, [r0]
	bl ov07_0221C448
	ldr r0, [sp]
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
_0223129C:
	ldr r0, [sp]
	ldr r0, [r0, #8]
	bl FUN_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_02231234

	thumb_func_start ov07_022312A8
ov07_022312A8: @ 0x022312A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r7, #0
	adds r6, r5, #0
	str r1, [sp, #0x10]
	adds r6, #0x30
	adds r4, r7, #0
_022312B8:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x32
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x30
	movs r1, #0
	str r0, [sp, #0xc]
	ldr r2, _022312F8 @ =0x00007FFF
	adds r0, r6, #0
	adds r3, r1, #0
	bl ov07_022220FC
	ldr r0, [r5, #0x38]
	adds r7, r7, #1
	adds r0, r0, r4
	str r0, [r5, #0x38]
	ldr r1, [r5, #0x48]
	ldr r0, [sp, #0x10]
	adds r6, #0x24
	muls r0, r1, r0
	str r0, [r5, #0x48]
	ldr r0, _022312FC @ =0x00002AAA
	adds r5, #0x24
	adds r4, r4, r0
	cmp r7, #6
	blt _022312B8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_022312F8: .4byte 0x00007FFF
_022312FC: .4byte 0x00002AAA
	thumb_func_end ov07_022312A8

	thumb_func_start ov07_02231300
ov07_02231300: @ 0x02231300
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0
	adds r7, r6, #0
	str r0, [sp]
	adds r7, #0x30
	adds r4, r6, #0
	adds r5, r6, #0
_02231310:
	adds r0, r7, #0
	bl ov07_02222180
	movs r1, #0x13
	lsls r1, r1, #4
	movs r2, #0x30
	ldrsh r1, [r6, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #0x18]
	adds r1, r1, r2
	ldr r2, _0223136C @ =0x00000132
	lsls r1, r1, #0x10
	ldrsh r2, [r6, r2]
	asrs r1, r1, #0x10
	bl FUN_0200DDB8
	ldr r1, [r4, #0x38]
	ldr r0, _02231370 @ =0x00003FFF
	cmp r1, r0
	blt _02231348
	ldr r0, _02231374 @ =0x0000BF49
	cmp r1, r0
	bgt _02231348
	ldr r0, [r5, #0x18]
	movs r1, #1
	bl FUN_0200DD54
	b _02231358
_02231348:
	ldr r0, [r6]
	bl ov07_0221FAE8
	adds r1, r0, #0
	ldr r0, [r5, #0x18]
	adds r1, r1, #1
	bl FUN_0200DD54
_02231358:
	ldr r0, [sp]
	adds r7, #0x24
	adds r0, r0, #1
	adds r4, #0x24
	adds r5, r5, #4
	str r0, [sp]
	cmp r0, #6
	blt _02231310
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223136C: .4byte 0x00000132
_02231370: .4byte 0x00003FFF
_02231374: .4byte 0x0000BF49
	thumb_func_end ov07_02231300

	thumb_func_start ov07_02231378
ov07_02231378: @ 0x02231378
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r7, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bhi _0223145E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02231392: @ jump table
	.2byte _0223139C - _02231392 - 2 @ case 0
	.2byte _022313D2 - _02231392 - 2 @ case 1
	.2byte _022313F2 - _02231392 - 2 @ case 2
	.2byte _0223141E - _02231392 - 2 @ case 3
	.2byte _0223143A - _02231392 - 2 @ case 4
_0223139C:
	ldr r0, [r4]
	movs r1, #1
	movs r2, #0xf
	bl ov07_02231E08
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r0, #0xfe
	adds r0, r4, r0
	movs r1, #1
	movs r2, #0x10
	movs r3, #0xf
	bl ov07_02222AC4
	ldr r1, [r4, #0x14]
	adds r0, r4, #0
	bl ov07_022312A8
	adds r0, r4, #0
	bl ov07_02231300
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0223145E
_022313D2:
	adds r0, r4, #0
	bl ov07_02231300
	movs r0, #0x42
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov07_02222AF4
	cmp r0, #0
	beq _0223145E
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	movs r0, #0x1c
	str r0, [r4, #0x10]
	b _0223145E
_022313F2:
	adds r0, r4, #0
	bl ov07_02231300
	ldr r0, [r4, #0x10]
	subs r0, r0, #1
	str r0, [r4, #0x10]
	bpl _0223145E
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	adds r0, r0, #1
	str r0, [r4, #0xc]
	movs r0, #0xf
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r0, #0xfe
	adds r0, r4, r0
	movs r2, #1
	movs r3, #0
	bl ov07_02222AC4
	b _0223145E
_0223141E:
	adds r0, r4, #0
	bl ov07_02231300
	movs r0, #0x42
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov07_02222AF4
	cmp r0, #0
	beq _0223145E
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _0223145E
_0223143A:
	movs r6, #0
	adds r5, r4, #0
_0223143E:
	ldr r0, [r5, #0x18]
	bl FUN_0200D9DC
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #6
	blt _0223143E
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	adds r1, r7, #0
	bl ov07_0221C448
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0223145E:
	ldr r0, [r4, #8]
	bl FUN_0200D020
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231378

	thumb_func_start ov07_02231468
ov07_02231468: @ 0x02231468
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r1, #0
	movs r1, #0x4d
	lsls r1, r1, #2
	adds r4, r0, #0
	str r2, [sp]
	adds r7, r3, #0
	bl ov07_022324D8
	adds r6, r0, #0
	str r4, [r6]
	ldr r0, [sp]
	str r5, [r6, #4]
	str r0, [r6, #8]
	adds r0, r4, #0
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	movs r1, #0
	adds r5, r0, #0
	bl FUN_02008A78
	movs r1, #0x13
	lsls r1, r1, #4
	strh r0, [r6, r1]
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02008A78
	ldr r1, _0223150C @ =0x00000132
	strh r0, [r6, r1]
	add r0, sp, #4
	adds r1, r4, #0
	bl ov07_0221F9E8
	movs r4, #0
	adds r5, r6, #0
_022314BA:
	cmp r4, #0
	bne _022314C2
	str r7, [r5, #0x18]
	b _022314CE
_022314C2:
	ldr r0, [r6, #4]
	ldr r1, [r6, #8]
	add r2, sp, #4
	bl FUN_0200D734
	str r0, [r5, #0x18]
_022314CE:
	ldr r0, [r5, #0x18]
	movs r1, #0x64
	bl FUN_0200DD68
	ldr r0, [r5, #0x18]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r5, #0x18]
	movs r1, #1
	bl FUN_0200DC78
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _022314BA
	ldr r0, [r6]
	bl ov07_0221C468
	adds r1, r0, #0
	ldr r0, [r6]
	bl ov07_02222004
	str r0, [r6, #0x14]
	ldr r0, [r6]
	ldr r1, _02231510 @ =ov07_02231378
	adds r2, r6, #0
	bl ov07_0221C410
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223150C: .4byte 0x00000132
_02231510: .4byte ov07_02231378
	thumb_func_end ov07_02231468

	thumb_func_start ov07_02231514
ov07_02231514: @ 0x02231514
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	bx lr
	.align 2, 0
	thumb_func_end ov07_02231514

	thumb_func_start ov07_0223151C
ov07_0223151C: @ 0x0223151C
	strh r1, [r0, #0x14]
	strh r2, [r0, #0x16]
	bx lr
	.align 2, 0
	thumb_func_end ov07_0223151C

	thumb_func_start ov07_02231524
ov07_02231524: @ 0x02231524
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x1c]
	adds r4, r1, #0
	bl ov07_0221BFD0
	adds r6, r0, #0
	ldr r0, [r5, #0x1c]
	movs r1, #3
	bl ov07_0221FB04
	adds r1, r0, #0
	lsls r0, r4, #0x18
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r1, [r5, #4]
	ldr r0, [r5]
	lsls r2, r1, #4
	ldr r1, _022315B4 @ =0x0223680C
	adds r3, r4, #0
	ldr r1, [r1, r2]
	ldr r2, [r5, #0x2c]
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x30]
	lsls r3, r2, #4
	ldr r2, _022315B8 @ =0x02236810
	ldr r1, [r5]
	ldr r2, [r2, r3]
	adds r3, r6, #0
	bl FUN_02003200
	lsls r1, r4, #0x18
	ldr r0, [r5, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r1, [r5, #4]
	ldr r0, [r5]
	lsls r2, r1, #4
	ldr r1, _022315BC @ =0x02236814
	adds r3, r4, #0
	ldr r1, [r1, r2]
	ldr r2, [r5, #0x2c]
	bl FUN_02007914
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_022315B4: .4byte 0x0223680C
_022315B8: .4byte 0x02236810
_022315BC: .4byte 0x02236814
	thumb_func_end ov07_02231524

	thumb_func_start ov07_022315C0
ov07_022315C0: @ 0x022315C0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4, #0x18]
	cmp r0, #3
	bhi _0223167C
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022315D8: @ jump table
	.2byte _022315E0 - _022315D8 - 2 @ case 0
	.2byte _022315F0 - _022315D8 - 2 @ case 1
	.2byte _02231608 - _022315D8 - 2 @ case 2
	.2byte _02231628 - _022315D8 - 2 @ case 3
_022315E0:
	adds r0, r4, #0
	movs r1, #2
	bl ov07_02231524
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	b _022316CA
_022315F0:
	ldrh r0, [r4, #0x16]
	movs r1, #4
	movs r2, #0x39
	str r0, [sp]
	ldrh r3, [r4, #0x14]
	ldr r0, _02231718 @ =0x04000050
	blx FUN_020CF15C
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	b _022316CA
_02231608:
	adds r1, r4, #0
	adds r1, #0x40
	ldrb r1, [r1]
	cmp r1, #0x14
	bls _02231618
	adds r0, r0, #1
	strb r0, [r4, #0x18]
	b _022316CA
_02231618:
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x40
	strb r1, [r0]
	b _022316CA
_02231628:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _02231632
	subs r0, r0, #1
	strh r0, [r4, #0x14]
_02231632:
	ldrh r0, [r4, #0x16]
	cmp r0, #0x10
	bhs _0223163C
	adds r0, r0, #1
	strh r0, [r4, #0x16]
_0223163C:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	bne _0223166E
	ldrh r0, [r4, #0x16]
	cmp r0, #0x10
	bne _0223166E
	ldr r0, [r4, #0x2c]
	movs r1, #2
	bl FUN_0201CAE0
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x38]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x3c]
	movs r1, #0
	bl FUN_0200DCE8
	ldrb r0, [r4, #0x18]
	adds r0, r0, #1
	strb r0, [r4, #0x18]
_0223166E:
	ldrh r0, [r4, #0x16]
	ldrh r1, [r4, #0x14]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0223171C @ =0x04000052
	strh r1, [r0]
	b _022316CA
_0223167C:
	ldr r0, _02231720 @ =0x0400004A
	movs r1, #0x3f
	ldrh r2, [r0]
	bics r2, r1
	movs r1, #0x1f
	orrs r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _02231724 @ =0xFFFFC0FF
	lsls r1, r1, #8
	ands r2, r3
	orrs r1, r2
	strh r1, [r0]
	movs r2, #0
	ldr r0, [r4, #0x2c]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201BC8C
	ldr r0, [r4, #0x2c]
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02231728 @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	ldr r0, [r4, #0x1c]
	adds r1, r5, #0
	bl ov07_0221C448
	adds r0, r4, #0
	bl ov07_02232508
	pop {r3, r4, r5, pc}
_022316CA:
	movs r3, #0x10
	movs r0, #0xc
	ldrsh r1, [r4, r3]
	ldrsh r0, [r4, r0]
	movs r2, #0
	adds r0, r1, r0
	strh r0, [r4, #0x10]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	movs r0, #0xe
	ldrsh r0, [r4, r0]
	adds r0, r1, r0
	strh r0, [r4, #0x12]
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x2c]
	movs r1, #2
	bl FUN_0201BC8C
	movs r3, #0x12
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x2c]
	movs r1, #2
	movs r2, #3
	bl FUN_0201BC8C
	ldr r0, [r4, #0x34]
	bl FUN_0200DC18
	ldr r0, [r4, #0x38]
	bl FUN_0200DC18
	ldr r0, [r4, #0x3c]
	bl FUN_0200DC18
	ldr r0, [r4, #0x24]
	bl FUN_0200D020
	pop {r3, r4, r5, pc}
	nop
_02231718: .4byte 0x04000050
_0223171C: .4byte 0x04000052
_02231720: .4byte 0x0400004A
_02231724: .4byte 0xFFFFC0FF
_02231728: .4byte 0xFFFF1FFF
	thumb_func_end ov07_022315C0

	thumb_func_start ov07_0223172C
ov07_0223172C: @ 0x0223172C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #7
	str r1, [r4]
	adds r5, r0, #0
	movs r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #4]
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221C4A8
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_0223172C

	thumb_func_start ov07_0223174C
ov07_0223174C: @ 0x0223174C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	movs r1, #0x44
	adds r6, r0, #0
	bl ov07_022324D8
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, r6, #0
	adds r1, #0x18
	bl ov07_02231FE4
	adds r2, r4, #0
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x1c]
	movs r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	movs r1, #2
	bl ov07_0221C4E8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x1c]
	movs r1, #2
	bl ov07_0221FB04
	ldr r0, [r4, #0x34]
	movs r1, #2
	bl FUN_0200DD54
	ldr r0, [r4, #0x38]
	movs r1, #2
	bl FUN_0200DD54
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _022317B6
	adds r0, r6, #0
	bl ov07_0221C468
	b _022317BC
_022317B6:
	adds r0, r6, #0
	bl ov07_0221C470
_022317BC:
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r6, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _022317F4
	ldr r0, [r4, #0x3c]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x1c]
	movs r1, #2
	bl ov07_0221FB04
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	bl FUN_0200DD54
	ldr r0, [r4, #0x38]
	adds r1, r5, #0
	bl FUN_0200DD54
	b _02231818
_022317F4:
	cmp r5, #1
	bhi _02231802
	ldr r0, [r4, #0x3c]
	movs r1, #0
	bl FUN_0200DCE8
	b _02231818
_02231802:
	subs r0, r5, #3
	cmp r0, #1
	ldr r0, [r4, #0x3c]
	bhi _02231812
	movs r1, #3
	bl FUN_0200DD54
	b _02231818
_02231812:
	movs r1, #1
	bl FUN_0200DD54
_02231818:
	ldr r0, _02231864 @ =0x0400004A
	ldr r1, _02231868 @ =0xFFFFC0FF
	ldrh r2, [r0]
	ands r2, r1
	movs r1, #0x16
	lsls r1, r1, #8
	orrs r2, r1
	lsrs r1, r0, #0xd
	orrs r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	movs r1, #0x3f
	bics r2, r1
	movs r1, #0x1b
	orrs r2, r1
	movs r1, #0x20
	orrs r2, r1
	strh r2, [r0]
	lsls r3, r1, #0x15
	ldr r2, [r3]
	ldr r0, _0223186C @ =0xFFFF1FFF
	ands r2, r0
	lsls r0, r1, #0xa
	orrs r0, r2
	str r0, [r3]
	ldr r0, [r4, #0x38]
	movs r1, #2
	bl FUN_0200E0FC
	movs r0, #0
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x1c]
	ldr r1, _02231870 @ =ov07_022315C0
	adds r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	.align 2, 0
_02231864: .4byte 0x0400004A
_02231868: .4byte 0xFFFFC0FF
_0223186C: .4byte 0xFFFF1FFF
_02231870: .4byte ov07_022315C0
	thumb_func_end ov07_0223174C

	thumb_func_start ov07_02231874
ov07_02231874: @ 0x02231874
	push {r4, lr}
	sub sp, #0x18
	add r1, sp, #0
	adds r4, r0, #0
	bl ov07_0223172C
	add r0, sp, #0
	movs r1, #0
	movs r2, #3
	bl ov07_02231514
	add r0, sp, #0
	movs r1, #0xc
	movs r2, #4
	bl ov07_0223151C
	adds r0, r4, #0
	add r1, sp, #0
	bl ov07_0223174C
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov07_02231874

	thumb_func_start ov07_022318A0
ov07_022318A0: @ 0x022318A0
	push {r4, lr}
	sub sp, #0x18
	add r1, sp, #0
	adds r4, r0, #0
	bl ov07_0223172C
	movs r1, #0
	add r0, sp, #0
	subs r2, r1, #3
	bl ov07_02231514
	add r0, sp, #0
	movs r1, #0xc
	movs r2, #4
	bl ov07_0223151C
	adds r0, r4, #0
	add r1, sp, #0
	bl ov07_0223174C
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov07_022318A0

	thumb_func_start ov07_022318CC
ov07_022318CC: @ 0x022318CC
	push {r4, lr}
	sub sp, #0x18
	add r1, sp, #0
	adds r4, r0, #0
	bl ov07_0223172C
	add r0, sp, #0
	movs r1, #0
	movs r2, #3
	bl ov07_02231514
	add r0, sp, #0
	movs r1, #0xc
	movs r2, #4
	bl ov07_0223151C
	adds r0, r4, #0
	add r1, sp, #0
	bl ov07_0223174C
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov07_022318CC

	thumb_func_start ov07_022318F8
ov07_022318F8: @ 0x022318F8
	push {r4, lr}
	sub sp, #0x18
	add r1, sp, #0
	adds r4, r0, #0
	bl ov07_0223172C
	movs r1, #0
	add r0, sp, #0
	subs r2, r1, #6
	bl ov07_02231514
	add r0, sp, #0
	movs r1, #0xc
	movs r2, #4
	bl ov07_0223151C
	adds r0, r4, #0
	add r1, sp, #0
	bl ov07_0223174C
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov07_022318F8

	thumb_func_start ov07_02231924
ov07_02231924: @ 0x02231924
	ldr r3, _02231928 @ =ov07_0221FA04
	bx r3
	.align 2, 0
_02231928: .4byte ov07_0221FA04
	thumb_func_end ov07_02231924

	thumb_func_start ov07_0223192C
ov07_0223192C: @ 0x0223192C
	push {r4, lr}
	bl ov07_0221FA04
	cmp r0, #5
	bhi _02231954
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02231942: @ jump table
	.2byte _0223194E - _02231942 - 2 @ case 0
	.2byte _02231952 - _02231942 - 2 @ case 1
	.2byte _0223194E - _02231942 - 2 @ case 2
	.2byte _02231952 - _02231942 - 2 @ case 3
	.2byte _0223194E - _02231942 - 2 @ case 4
	.2byte _02231952 - _02231942 - 2 @ case 5
_0223194E:
	movs r4, #3
	b _02231954
_02231952:
	movs r4, #4
_02231954:
	adds r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov07_0223192C

	thumb_func_start ov07_02231958
ov07_02231958: @ 0x02231958
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r4, #0
_02231960:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov07_0221FA04
	cmp r0, r5
	bne _02231970
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_02231970:
	adds r4, r4, #1
	cmp r4, #4
	blt _02231960
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_02231958

	thumb_func_start ov07_0223197C
ov07_0223197C: @ 0x0223197C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ov07_0221FA04
	adds r5, r0, #0
	cmp r5, #1
	bls _022319DC
	movs r4, #0
_0223198C:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov07_0221FA04
	cmp r5, #5
	bhi _022319D0
	adds r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022319A4: @ jump table
	.2byte _022319D0 - _022319A4 - 2 @ case 0
	.2byte _022319D0 - _022319A4 - 2 @ case 1
	.2byte _022319B0 - _022319A4 - 2 @ case 2
	.2byte _022319C0 - _022319A4 - 2 @ case 3
	.2byte _022319B8 - _022319A4 - 2 @ case 4
	.2byte _022319C8 - _022319A4 - 2 @ case 5
_022319B0:
	cmp r0, #4
	bne _022319D0
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_022319B8:
	cmp r0, #2
	bne _022319D0
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_022319C0:
	cmp r0, #5
	bne _022319D0
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_022319C8:
	cmp r0, #3
	bne _022319D0
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_022319D0:
	adds r4, r4, #1
	cmp r4, #4
	blt _0223198C
	bl GF_AssertFail
	adds r0, r5, #0
_022319DC:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_0223197C

	thumb_func_start ov07_022319E0
ov07_022319E0: @ 0x022319E0
	push {r3, lr}
	cmp r0, #5
	bhi _02231A16
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022319F2: @ jump table
	.2byte _022319FE - _022319F2 - 2 @ case 0
	.2byte _02231A02 - _022319F2 - 2 @ case 1
	.2byte _02231A06 - _022319F2 - 2 @ case 2
	.2byte _02231A0A - _022319F2 - 2 @ case 3
	.2byte _02231A0E - _022319F2 - 2 @ case 4
	.2byte _02231A12 - _022319F2 - 2 @ case 5
_022319FE:
	movs r0, #1
	pop {r3, pc}
_02231A02:
	movs r0, #0
	pop {r3, pc}
_02231A06:
	movs r0, #3
	pop {r3, pc}
_02231A0A:
	movs r0, #2
	pop {r3, pc}
_02231A0E:
	movs r0, #5
	pop {r3, pc}
_02231A12:
	movs r0, #4
	pop {r3, pc}
_02231A16:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov07_022319E0

	thumb_func_start ov07_02231A20
ov07_02231A20: @ 0x02231A20
	push {r4, r5}
	sub sp, #0x18
	ldr r5, _02231A4C @ =0x02236864
	add r4, sp, #0
	movs r3, #0xc
_02231A2A:
	ldrh r1, [r5]
	adds r5, r5, #2
	strh r1, [r4]
	adds r4, r4, #2
	subs r3, r3, #1
	bne _02231A2A
	lsls r3, r0, #2
	add r0, sp, #0
	adds r1, r0, r3
	ldrh r0, [r0, r3]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	add sp, #0x18
	pop {r4, r5}
	bx lr
	nop
_02231A4C: .4byte 0x02236864
	thumb_func_end ov07_02231A20

	thumb_func_start ov07_02231A50
ov07_02231A50: @ 0x02231A50
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	bl ov07_02231924
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov07_0221BFC0
	adds r1, r0, #0
	adds r0, r6, #0
	adds r2, r4, #0
	bl ov07_02231A20
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_02231A50

	thumb_func_start ov07_02231A70
ov07_02231A70: @ 0x02231A70
	push {r4, r5, r6, r7}
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x110
	movs r5, #0x12
	ldr r7, _02231AC8 @ =0x0223687C
	adds r4, r0, #0
	adds r2, r1, #0
	add r6, sp, #0
	lsls r5, r5, #4
_02231A88:
	ldm r7!, {r0, r1}
	stm r6!, {r0, r1}
	subs r5, r5, #1
	bne _02231A88
	movs r0, #0x12
	lsls r0, r0, #4
	add r1, sp, #0
	muls r0, r4, r0
	adds r0, r1, r0
	ldr r1, _02231ACC @ =0x00000900
	add r1, sp
	ldr r1, [r1, #0x10]
	lsls r1, r1, #1
	adds r3, r3, r1
	movs r1, #0xc
	adds r4, r3, #0
	muls r4, r1, r4
	adds r1, r0, r4
	ldr r3, [r1, #8]
	ldr r1, [r1, #4]
	ldr r0, [r0, r4]
	str r0, [r2]
	str r1, [r2, #4]
	str r3, [r2, #8]
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x110
	pop {r4, r5, r6, r7}
	bx lr
	nop
_02231AC8: .4byte 0x0223687C
_02231ACC: .4byte 0x00000900
	thumb_func_end ov07_02231A70

	thumb_func_start ov07_02231AD0
ov07_02231AD0: @ 0x02231AD0
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #0
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231AD0

	thumb_func_start ov07_02231AE0
ov07_02231AE0: @ 0x02231AE0
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #1
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231AE0

	thumb_func_start ov07_02231AF0
ov07_02231AF0: @ 0x02231AF0
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #2
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231AF0

	thumb_func_start ov07_02231B00
ov07_02231B00: @ 0x02231B00
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #3
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B00

	thumb_func_start ov07_02231B10
ov07_02231B10: @ 0x02231B10
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #4
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B10

	thumb_func_start ov07_02231B20
ov07_02231B20: @ 0x02231B20
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #5
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B20

	thumb_func_start ov07_02231B30
ov07_02231B30: @ 0x02231B30
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #6
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B30

	thumb_func_start ov07_02231B40
ov07_02231B40: @ 0x02231B40
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #7
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B40

	thumb_func_start ov07_02231B50
ov07_02231B50: @ 0x02231B50
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #8
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B50

	thumb_func_start ov07_02231B60
ov07_02231B60: @ 0x02231B60
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #9
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B60

	thumb_func_start ov07_02231B70
ov07_02231B70: @ 0x02231B70
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #0xa
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B70

	thumb_func_start ov07_02231B80
ov07_02231B80: @ 0x02231B80
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #0xb
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B80

	thumb_func_start ov07_02231B90
ov07_02231B90: @ 0x02231B90
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231AD0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231B90

	thumb_func_start ov07_02231BC0
ov07_02231BC0: @ 0x02231BC0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231AE0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231BC0

	thumb_func_start ov07_02231BF0
ov07_02231BF0: @ 0x02231BF0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231AF0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231BF0

	thumb_func_start ov07_02231C20
ov07_02231C20: @ 0x02231C20
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231B00
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231C20

	thumb_func_start ov07_02231C50
ov07_02231C50: @ 0x02231C50
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231B10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231C50

	thumb_func_start ov07_02231C80
ov07_02231C80: @ 0x02231C80
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231B20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231C80

	thumb_func_start ov07_02231CB0
ov07_02231CB0: @ 0x02231CB0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231B30
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231CB0

	thumb_func_start ov07_02231CE0
ov07_02231CE0: @ 0x02231CE0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231B40
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231CE0

	thumb_func_start ov07_02231D10
ov07_02231D10: @ 0x02231D10
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231B50
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231D10

	thumb_func_start ov07_02231D40
ov07_02231D40: @ 0x02231D40
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231B60
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231D40

	thumb_func_start ov07_02231D70
ov07_02231D70: @ 0x02231D70
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231B70
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231D70

	thumb_func_start ov07_02231DA0
ov07_02231DA0: @ 0x02231DA0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ov07_0221C478
	bl FUN_02015530
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov07_02231924
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov07_0221BFC0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov07_02231B80
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231DA0

	thumb_func_start ov07_02231DD0
ov07_02231DD0: @ 0x02231DD0
	movs r2, #0
	ldr r1, _02231DDC @ =0x000068D0
	str r2, [r0]
	str r1, [r0, #4]
	str r2, [r0, #8]
	bx lr
	.align 2, 0
_02231DDC: .4byte 0x000068D0
	thumb_func_end ov07_02231DD0

	thumb_func_start ov07_02231DE0
ov07_02231DE0: @ 0x02231DE0
	push {r3, lr}
	bl ov07_02231AD0
	pop {r3, pc}
	thumb_func_end ov07_02231DE0

	thumb_func_start ov07_02231DE8
ov07_02231DE8: @ 0x02231DE8
	push {r3, lr}
	adds r3, r1, #0
	cmp r0, #0
	bne _02231DF8
	adds r0, r3, #0
	bl FUN_02015510
	pop {r3, pc}
_02231DF8:
	ldr r2, _02231E04 @ =0x02236858
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	pop {r3, pc}
	.align 2, 0
_02231E04: .4byte 0x02236858
	thumb_func_end ov07_02231DE8

	thumb_func_start ov07_02231E08
ov07_02231E08: @ 0x02231E08
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r1, #0
	mvns r1, r1
	adds r4, r2, #0
	cmp r5, r1
	bne _02231E18
	movs r5, #0x1a
_02231E18:
	movs r1, #0
	mvns r1, r1
	cmp r4, r1
	bne _02231E22
	movs r4, #5
_02231E22:
	movs r1, #2
	bl ov07_0221FAF8
	movs r1, #1
	adds r2, r1, #0
	lsls r2, r0
	orrs r2, r1
	ldr r0, _02231E40 @ =0x04000050
	movs r1, #0
	adds r3, r5, #0
	str r4, [sp]
	blx FUN_020CF15C
	pop {r3, r4, r5, pc}
	nop
_02231E40: .4byte 0x04000050
	thumb_func_end ov07_02231E08

	thumb_func_start ov07_02231E44
ov07_02231E44: @ 0x02231E44
	push {r3, r4, r5, lr}
	movs r0, #0
	adds r4, r2, #0
	mvns r0, r0
	adds r5, r1, #0
	cmp r4, r0
	bne _02231E54
	movs r4, #0x1a
_02231E54:
	movs r0, #0
	mvns r0, r0
	cmp r3, r0
	bne _02231E5E
	movs r3, #5
_02231E5E:
	ldr r0, _02231E70 @ =0x04000050
	str r3, [sp]
	movs r1, #0
	adds r2, r5, #0
	adds r3, r4, #0
	blx FUN_020CF15C
	pop {r3, r4, r5, pc}
	nop
_02231E70: .4byte 0x04000050
	thumb_func_end ov07_02231E44

	thumb_func_start ov07_02231E74
ov07_02231E74: @ 0x02231E74
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0
	adds r5, r1, #0
	mvns r0, r0
	adds r4, r2, #0
	cmp r5, r0
	bne _02231E86
	movs r5, #0x1a
_02231E86:
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _02231E90
	movs r4, #5
_02231E90:
	adds r0, r6, #0
	movs r1, #2
	bl ov07_0221FAF8
	movs r1, #1
	adds r2, r1, #0
	lsls r2, r0
	movs r0, #0x11
	adds r7, r2, #0
	orrs r7, r0
	adds r0, r6, #0
	bl ov07_0221FAF8
	movs r1, #1
	lsls r1, r0
	ldr r0, _02231EBC @ =0x04000050
	adds r2, r7, #0
	adds r3, r5, #0
	str r4, [sp]
	blx FUN_020CF15C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02231EBC: .4byte 0x04000050
	thumb_func_end ov07_02231E74

	thumb_func_start ov07_02231EC0
ov07_02231EC0: @ 0x02231EC0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r1, #0
	bne _02231F14
	movs r1, #1
	bl ov07_0221FAF8
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221FAF8
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221FAF8
	adds r2, r0, #0
	movs r0, #1
	adds r3, r0, #0
	adds r1, r0, #0
	lsls r3, r7
	lsls r0, r2
	lsls r1, r6
	orrs r0, r3
	orrs r1, r0
	movs r0, #0x11
	adds r2, r1, #0
	orrs r2, r0
	ldr r0, _02231F94 @ =0x04000048
	ldrh r1, [r0]
	movs r0, #0x3f
	bics r1, r0
	orrs r1, r2
	cmp r4, #0
	beq _02231F0E
	movs r0, #0x20
	orrs r1, r0
_02231F0E:
	ldr r0, _02231F94 @ =0x04000048
	strh r1, [r0]
	b _02231F5E
_02231F14:
	movs r1, #1
	bl ov07_0221FAF8
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl ov07_0221FAF8
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221FAF8
	adds r2, r0, #0
	movs r0, #1
	adds r3, r0, #0
	adds r1, r0, #0
	lsls r0, r2
	lsls r3, r7
	lsls r1, r6
	orrs r0, r3
	orrs r1, r0
	ldr r2, _02231F94 @ =0x04000048
	adds r3, r1, #0
	movs r0, #0x11
	orrs r3, r0
	ldrh r1, [r2]
	ldr r0, _02231F98 @ =0xFFFFC0FF
	ands r1, r0
	lsls r0, r3, #8
	orrs r1, r0
	cmp r4, #0
	beq _02231F5A
	lsrs r0, r2, #0xd
	orrs r1, r0
_02231F5A:
	ldr r0, _02231F94 @ =0x04000048
	strh r1, [r0]
_02231F5E:
	adds r0, r5, #0
	movs r1, #0
	bl ov07_0221FAF8
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl ov07_0221FAF8
	movs r1, #1
	adds r2, r1, #0
	lsls r1, r0
	lsls r2, r4
	orrs r1, r2
	adds r3, r1, #0
	ldr r1, _02231F9C @ =0x0400004A
	movs r0, #0x11
	orrs r3, r0
	ldrh r2, [r1]
	movs r0, #0x3f
	bics r2, r0
	orrs r2, r3
	movs r0, #0x20
	orrs r0, r2
	strh r0, [r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02231F94: .4byte 0x04000048
_02231F98: .4byte 0xFFFFC0FF
_02231F9C: .4byte 0x0400004A
	thumb_func_end ov07_02231EC0

	thumb_func_start ov07_02231FA0
ov07_02231FA0: @ 0x02231FA0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _02231FB2
	movs r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	pop {r3, r4, r5, pc}
_02231FB2:
	bl FUN_020094BC
	cmp r0, #0
	bne _02231FC2
	movs r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	pop {r3, r4, r5, pc}
_02231FC2:
	adds r0, r5, #0
	movs r1, #0
	bl FUN_02008A78
	strh r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02008A78
	strh r0, [r4, #2]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02231FA0

	thumb_func_start ov07_02231FD8
ov07_02231FD8: @ 0x02231FD8
	ldr r3, _02231FE0 @ =FUN_0200DE44
	adds r2, r1, #2
	bx r3
	nop
_02231FE0: .4byte FUN_0200DE44
	thumb_func_end ov07_02231FD8

	thumb_func_start ov07_02231FE4
ov07_02231FE4: @ 0x02231FE4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0
	strb r1, [r4]
	strb r1, [r4, #1]
	strb r1, [r4, #2]
	adds r5, r0, #0
	strb r1, [r4, #3]
	str r5, [r4, #4]
	bl ov07_0221C530
	str r0, [r4, #8]
	adds r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #0xc]
	adds r0, r5, #0
	bl ov07_0221C528
	str r0, [r4, #0x10]
	adds r0, r5, #0
	bl ov07_0221C4A0
	str r0, [r4, #0x14]
	adds r0, r5, #0
	bl ov07_0221FA78
	str r0, [r4, #0x18]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02231FE4

	thumb_func_start ov07_02232020
ov07_02232020: @ 0x02232020
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r1, #0
	adds r4, r3, #0
	movs r1, #0
	str r1, [r4]
	movs r1, #0x40
	ands r1, r7
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r1, #0x40
	beq _0223203A
	b _0223215C
_0223203A:
	bl ov07_0221C468
	adds r7, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov07_0221FA48
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _0223207C
	str r7, [r1, #0x10]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r0, [r1, #8]
	adds r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0223207C:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov07_0223197C
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	adds r0, r6, #0
	bl ov07_0221FA48
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _022320C4
	ldr r1, [sp, #4]
	str r1, [r0, #0x10]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r0, [r1, #8]
	adds r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_022320C4:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov07_0221FA04
	bl ov07_022319E0
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_02231958
	adds r7, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov07_0221FA48
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _02232116
	str r7, [r1, #0x10]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r0, [r1, #8]
	adds r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_02232116:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov07_0223197C
	adds r7, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov07_0221FA48
	ldr r2, [r4]
	movs r1, #0x14
	adds r3, r2, #0
	muls r3, r1, r3
	adds r2, r5, r3
	str r0, [r2, #8]
	ldr r0, [r4]
	adds r2, r0, #0
	muls r2, r1, r2
	adds r2, r5, r2
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _0223223E
	str r7, [r2, #0x10]
	ldr r0, [r4]
	muls r1, r0, r1
	adds r1, r5, r1
	ldr r0, [r1, #8]
	adds r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	add sp, #0x10
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0223215C:
	movs r1, #0x20
	ands r1, r7
	cmp r1, #0x20
	bne _0223225C
	bl ov07_0221C468
	adds r7, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov07_0223197C
	str r0, [sp, #8]
	cmp r0, r7
	beq _022321B6
	ldr r1, [sp, #8]
	adds r0, r6, #0
	bl ov07_0221FA48
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _022321B6
	ldr r1, [sp, #8]
	str r1, [r0, #0x10]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r0, [r1, #8]
	adds r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_022321B6:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov07_0221FA04
	bl ov07_022319E0
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_02231958
	str r0, [sp]
	cmp r0, r7
	beq _0223220E
	ldr r1, [sp]
	adds r0, r6, #0
	bl ov07_0221FA48
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0223220E
	ldr r1, [sp]
	str r1, [r0, #0x10]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r0, [r1, #8]
	adds r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0223220E:
	ldr r1, [sp]
	adds r0, r6, #0
	bl ov07_0223197C
	str r0, [sp, #0xc]
	cmp r0, r7
	beq _0223223E
	ldr r1, [sp, #0xc]
	adds r0, r6, #0
	bl ov07_0221FA48
	ldr r2, [r4]
	movs r1, #0x14
	adds r3, r2, #0
	muls r3, r1, r3
	adds r2, r5, r3
	str r0, [r2, #8]
	ldr r0, [r4]
	adds r2, r0, #0
	muls r2, r1, r2
	adds r2, r5, r2
	ldr r0, [r2, #8]
	cmp r0, #0
	bne _02232240
_0223223E:
	b _022323F6
_02232240:
	ldr r0, [sp, #0xc]
	str r0, [r2, #0x10]
	ldr r0, [r4]
	muls r1, r0, r1
	adds r1, r5, r1
	ldr r0, [r1, #8]
	adds r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	add sp, #0x10
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0223225C:
	movs r1, #2
	ands r1, r7
	cmp r1, #2
	bne _022322B6
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0221FA48
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _022322B6
	adds r0, r6, #0
	bl ov07_0221C468
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #0x10]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r0, [r1, #8]
	adds r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_022322B6:
	adds r0, r6, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _0223232C
	movs r0, #4
	ands r0, r7
	cmp r0, #4
	bne _0223232C
	adds r0, r6, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0223197C
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0221FA48
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0223232C
	adds r0, r6, #0
	bl ov07_0221C468
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0223197C
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #0x10]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r0, [r1, #8]
	adds r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0223232C:
	movs r0, #8
	ands r0, r7
	cmp r0, #8
	bne _02232388
	adds r0, r6, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0221FA48
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02232388
	adds r0, r6, #0
	bl ov07_0221C470
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #0x10]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r0, [r1, #8]
	adds r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_02232388:
	adds r0, r6, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _022323F6
	movs r0, #0x10
	ands r0, r7
	cmp r0, #0x10
	bne _022323F6
	adds r0, r6, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0223197C
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0221FA48
	ldr r2, [r4]
	movs r1, #0x14
	adds r3, r2, #0
	muls r3, r1, r3
	adds r2, r5, r3
	str r0, [r2, #8]
	ldr r0, [r4]
	muls r1, r0, r1
	adds r0, r5, r1
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _022323F6
	adds r0, r6, #0
	bl ov07_0221C470
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov07_0223197C
	ldr r2, [r4]
	movs r1, #0x14
	adds r3, r2, #0
	muls r3, r1, r3
	adds r2, r5, r3
	str r0, [r2, #0x10]
	ldr r0, [r4]
	muls r1, r0, r1
	adds r1, r5, r1
	ldr r0, [r1, #8]
	adds r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_022323F6:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_02232020

	thumb_func_start ov07_022323FC
ov07_022323FC: @ 0x022323FC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r4, r3, #0
	movs r1, #0
	str r1, [r4]
	movs r1, #2
	ands r1, r6
	adds r7, r0, #0
	adds r5, r2, #0
	cmp r1, #2
	bne _0223243C
	ldr r1, [r4]
	bl ov07_0221C4E8
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #0xc]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r0, [r1, #0xc]
	adds r1, r1, #4
	bl ov07_02231FD8
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_0223243C:
	movs r0, #4
	ands r0, r6
	cmp r0, #4
	bne _02232470
	ldr r1, [r4]
	adds r0, r7, #0
	bl ov07_0221C4E8
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #0xc]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r0, [r1, #0xc]
	adds r1, r1, #4
	bl ov07_02231FD8
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_02232470:
	movs r0, #8
	ands r0, r6
	cmp r0, #8
	bne _022324A4
	ldr r1, [r4]
	adds r0, r7, #0
	bl ov07_0221C4E8
	adds r2, r0, #0
	ldr r0, [r4]
	movs r3, #0x14
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r5, r1
	str r2, [r0, #0xc]
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r0, [r1, #0xc]
	adds r1, r1, #4
	bl ov07_02231FD8
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_022324A4:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0x10
	bne _022324D4
	ldr r1, [r4]
	adds r0, r7, #0
	bl ov07_0221C4E8
	ldr r2, [r4]
	movs r1, #0x14
	adds r3, r2, #0
	muls r3, r1, r3
	adds r2, r5, r3
	str r0, [r2, #0xc]
	ldr r0, [r4]
	muls r1, r0, r1
	adds r1, r5, r1
	ldr r0, [r1, #0xc]
	adds r1, r1, #4
	bl ov07_02231FD8
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
_022324D4:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov07_022323FC

	thumb_func_start ov07_022324D8
ov07_022324D8: @ 0x022324D8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _022324E6
	bl GF_AssertFail
_022324E6:
	adds r0, r4, #0
	bl ov07_0221BFD0
	adds r1, r5, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _022324FA
	bl GF_AssertFail
_022324FA:
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	blx FUN_020E5B44
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_022324D8

	thumb_func_start ov07_02232508
ov07_02232508: @ 0x02232508
	push {r4, lr}
	adds r4, r0, #0
	bne _02232512
	bl GF_AssertFail
_02232512:
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02232508

	thumb_func_start ov07_0223251C
ov07_0223251C: @ 0x0223251C
	cmp r0, #1
	blt _02232528
	cmp r0, #0x18
	bgt _02232528
	subs r0, r0, #1
	bx lr
_02232528:
	movs r2, #0xfa
	lsls r2, r2, #2
	cmp r0, r2
	blt _0223253C
	adds r1, r2, #0
	adds r1, #0x1b
	cmp r0, r1
	bgt _0223253C
	subs r0, r0, r2
	bx lr
_0223253C:
	movs r0, #3
	bx lr
	thumb_func_end ov07_0223251C

	thumb_func_start ov07_02232540
ov07_02232540: @ 0x02232540
	push {r3, r4, r5}
	sub sp, #0x2c
	ldr r5, _0223257C @ =0x02237228
	adds r2, r0, #0
	add r4, sp, #0
	movs r3, #5
_0223254C:
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	subs r3, r3, #1
	bne _0223254C
	ldr r0, [r5]
	str r0, [r4]
	movs r0, #0
	adds r3, r0, #0
	add r4, sp, #0
_0223255E:
	ldr r1, [r4]
	cmp r2, r1
	bne _0223256C
	add sp, #0x2c
	movs r0, #1
	pop {r3, r4, r5}
	bx lr
_0223256C:
	adds r3, r3, #1
	adds r4, r4, #4
	cmp r3, #0xb
	blo _0223255E
	add sp, #0x2c
	pop {r3, r4, r5}
	bx lr
	nop
_0223257C: .4byte 0x02237228
	thumb_func_end ov07_02232540

	thumb_func_start ov07_02232580
ov07_02232580: @ 0x02232580
	push {r4, r5}
	sub sp, #0x18
	ldr r3, _022325B8 @ =0x02237188
	add r2, sp, #0
	adds r5, r0, #0
	adds r4, r2, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r0, #0
	adds r2, r0, #0
_0223259C:
	ldr r1, [r4]
	cmp r5, r1
	bne _022325AA
	add sp, #0x18
	movs r0, #1
	pop {r4, r5}
	bx lr
_022325AA:
	adds r2, r2, #1
	adds r4, r4, #4
	cmp r2, #6
	blo _0223259C
	add sp, #0x18
	pop {r4, r5}
	bx lr
	.align 2, 0
_022325B8: .4byte 0x02237188
	thumb_func_end ov07_02232580

	thumb_func_start ov07_022325BC
ov07_022325BC: @ 0x022325BC
	push {r3, r4, r5}
	sub sp, #0xc
	ldr r5, _022325F0 @ =0x0223717C
	adds r3, r0, #0
	ldm r5!, {r0, r1}
	add r4, sp, #0
	adds r2, r4, #0
	stm r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
	movs r0, #1
	movs r4, #0
_022325D4:
	ldr r1, [r2]
	cmp r3, r1
	bne _022325E2
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, r5}
	bx lr
_022325E2:
	adds r4, r4, #1
	adds r2, r2, #4
	cmp r4, #3
	blo _022325D4
	add sp, #0xc
	pop {r3, r4, r5}
	bx lr
	.align 2, 0
_022325F0: .4byte 0x0223717C
	thumb_func_end ov07_022325BC

	thumb_func_start ov07_022325F4
ov07_022325F4: @ 0x022325F4
	push {r3, lr}
	bl ov07_0223251C
	lsls r1, r0, #3
	ldr r0, _02232604 @ =0x0223738C
	ldr r0, [r0, r1]
	pop {r3, pc}
	nop
_02232604: .4byte 0x0223738C
	thumb_func_end ov07_022325F4

	thumb_func_start ov07_02232608
ov07_02232608: @ 0x02232608
	push {r3, lr}
	bl ov07_0223251C
	lsls r1, r0, #3
	ldr r0, _02232618 @ =0x02237390
	ldr r0, [r0, r1]
	pop {r3, pc}
	nop
_02232618: .4byte 0x02237390
	thumb_func_end ov07_02232608

	thumb_func_start ov07_0223261C
ov07_0223261C: @ 0x0223261C
	push {r3, lr}
	bl ov07_0223251C
	movs r1, #0xc
	muls r1, r0, r1
	ldr r0, _0223262C @ =0x0223746C
	ldr r0, [r0, r1]
	pop {r3, pc}
	.align 2, 0
_0223262C: .4byte 0x0223746C
	thumb_func_end ov07_0223261C

	thumb_func_start ov07_02232630
ov07_02232630: @ 0x02232630
	push {r3, lr}
	bl ov07_0223251C
	movs r1, #0xc
	muls r1, r0, r1
	ldr r0, _02232640 @ =0x02237474
	ldr r0, [r0, r1]
	pop {r3, pc}
	.align 2, 0
_02232640: .4byte 0x02237474
	thumb_func_end ov07_02232630

	thumb_func_start ov07_02232644
ov07_02232644: @ 0x02232644
	push {r3, lr}
	bl ov07_0223251C
	movs r1, #0xc
	muls r1, r0, r1
	ldr r0, _02232654 @ =0x02237470
	ldr r0, [r0, r1]
	pop {r3, pc}
	.align 2, 0
_02232654: .4byte 0x02237470
	thumb_func_end ov07_02232644

	thumb_func_start ov07_02232658
ov07_02232658: @ 0x02232658
	push {r4, lr}
	adds r4, r1, #0
	bl ov07_0223251C
	lsls r2, r0, #4
	ldr r0, _0223266C @ =0x022375BC
	lsls r1, r4, #2
	adds r0, r0, r2
	ldr r0, [r1, r0]
	pop {r4, pc}
	.align 2, 0
_0223266C: .4byte 0x022375BC
	thumb_func_end ov07_02232658

	thumb_func_start ov07_02232670
ov07_02232670: @ 0x02232670
	push {r4, lr}
	movs r1, #0xb8
	adds r4, r0, #0
	bl FUN_0201AA8C
	cmp r0, #0
	bne _02232686
	bl GF_AssertFail
	movs r0, #0
	pop {r4, pc}
_02232686:
	adds r1, r0, #0
	str r4, [r0]
	movs r2, #0
	adds r1, #0x88
	str r2, [r1]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02232670

	thumb_func_start ov07_02232694
ov07_02232694: @ 0x02232694
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl ov07_02232670
	adds r1, r5, #0
	adds r4, r0, #0
	bl ov07_022326C0
	movs r1, #0
	str r1, [r4, #0x10]
	adds r2, r4, #0
	adds r0, r1, #0
_022326AC:
	str r0, [r2, #0x14]
	str r0, [r2, #0x38]
	str r0, [r2, #0x5c]
	adds r1, r1, #1
	adds r2, r2, #4
	cmp r1, #9
	blt _022326AC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02232694

	thumb_func_start ov07_022326C0
ov07_022326C0: @ 0x022326C0
	push {r4, lr}
	adds r3, r1, #0
	adds r4, r0, #0
	ldm r3!, {r0, r1}
	adds r2, r4, #4
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #0xa2
	str r0, [r2]
	ldr r0, [r4, #0xc]
	movs r2, #0
	bl FUN_0206E540
	adds r1, r4, #0
	adds r1, #0x9c
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0xd
	blt _022326EE
	bl GF_AssertFail
_022326EE:
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _0223271A
	adds r0, r4, #0
	movs r2, #0
	adds r0, #0x94
	str r2, [r0]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0223270C
	adds r4, #0x98
	str r0, [r4]
	pop {r4, pc}
_0223270C:
	ldr r0, [r4, #0xc]
	movs r1, #0x9b
	bl FUN_0206E540
	adds r4, #0x98
	str r0, [r4]
	pop {r4, pc}
_0223271A:
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x94
	str r1, [r0]
	ldr r0, [r4, #0xc]
	adds r4, #0xa0
	movs r1, #0xab
	adds r2, r4, #0
	bl FUN_0206E540
	pop {r4, pc}
	thumb_func_end ov07_022326C0

	thumb_func_start ov07_02232730
ov07_02232730: @ 0x02232730
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r4, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #3
	bls _02232744
	b _022329AC
_02232744:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02232750: @ jump table
	.2byte _02232758 - _02232750 - 2 @ case 0
	.2byte _022327F6 - _02232750 - 2 @ case 1
	.2byte _02232886 - _02232750 - 2 @ case 2
	.2byte _02232916 - _02232750 - 2 @ case 3
_02232758:
	ldr r1, [r4]
	movs r0, #0x5f
	bl FUN_02007688
	adds r1, r4, #0
	adds r1, #0x8c
	str r0, [r1]
	adds r0, r4, #0
	adds r6, r4, #0
	str r0, [sp, #0x14]
	adds r0, #0xa0
	movs r5, #0
	adds r6, #0x10
	str r0, [sp, #0x14]
_02232774:
	ldr r0, [sp, #0x14]
	adds r1, r5, #0
	bl FUN_0202CC30
	adds r7, r0, #0
	beq _022327E0
	bl FUN_0202CC48
	cmp r0, #0
	beq _022327E0
	cmp r0, #0x51
	bge _022327E0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02091084
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r4, r0
	str r7, [r0, #0x38]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _022327AE
	bl GF_AssertFail
_022327AE:
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [sp, #0x10]
	movs r3, #0
	bl ov07_0221FEE4
	ldr r1, [r4, #0x10]
	lsls r1, r1, #2
	adds r1, r4, r1
	str r0, [r1, #0x14]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _022327DA
	bne _022327E0
	bl GF_AssertFail
	b _022327E0
_022327DA:
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
_022327E0:
	adds r5, r5, #1
	cmp r5, #2
	blt _02232774
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r4, #0x90
	adds r0, r0, #1
	add sp, #0x24
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_022327F6:
	adds r0, r4, #0
	adds r6, r4, #0
	str r0, [sp, #0x18]
	adds r0, #0xa0
	movs r5, #2
	adds r6, #0x10
	str r0, [sp, #0x18]
_02232804:
	ldr r0, [sp, #0x18]
	adds r1, r5, #0
	bl FUN_0202CC30
	adds r7, r0, #0
	beq _02232870
	bl FUN_0202CC48
	cmp r0, #0
	beq _02232870
	cmp r0, #0x51
	bge _02232870
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02091084
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r4, r0
	str r7, [r0, #0x38]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _0223283E
	bl GF_AssertFail
_0223283E:
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [sp, #4]
	movs r3, #0
	bl ov07_0221FEE4
	ldr r1, [r4, #0x10]
	lsls r1, r1, #2
	adds r1, r4, r1
	str r0, [r1, #0x14]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0223286A
	bne _02232870
	bl GF_AssertFail
	b _02232870
_0223286A:
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
_02232870:
	adds r5, r5, #1
	cmp r5, #4
	blt _02232804
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r4, #0x90
	adds r0, r0, #1
	add sp, #0x24
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_02232886:
	adds r0, r4, #0
	adds r6, r4, #0
	str r0, [sp, #0x1c]
	adds r0, #0xa0
	movs r5, #4
	adds r6, #0x10
	str r0, [sp, #0x1c]
_02232894:
	ldr r0, [sp, #0x1c]
	adds r1, r5, #0
	bl FUN_0202CC30
	adds r7, r0, #0
	beq _02232900
	bl FUN_0202CC48
	cmp r0, #0
	beq _02232900
	cmp r0, #0x51
	bge _02232900
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02091084
	str r0, [sp, #8]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r4, r0
	str r7, [r0, #0x38]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _022328CE
	bl GF_AssertFail
_022328CE:
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [sp, #8]
	movs r3, #0
	bl ov07_0221FEE4
	ldr r1, [r4, #0x10]
	lsls r1, r1, #2
	adds r1, r4, r1
	str r0, [r1, #0x14]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _022328FA
	bne _02232900
	bl GF_AssertFail
	b _02232900
_022328FA:
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
_02232900:
	adds r5, r5, #1
	cmp r5, #6
	blt _02232894
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r4, #0x90
	adds r0, r0, #1
	add sp, #0x24
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_02232916:
	adds r0, r4, #0
	adds r6, r4, #0
	str r0, [sp, #0x20]
	adds r0, #0xa0
	movs r5, #6
	adds r6, #0x10
	str r0, [sp, #0x20]
_02232924:
	ldr r0, [sp, #0x20]
	adds r1, r5, #0
	bl FUN_0202CC30
	adds r7, r0, #0
	beq _02232990
	bl FUN_0202CC48
	cmp r0, #0
	beq _02232990
	cmp r0, #0x51
	bge _02232990
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02091084
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r4, r0
	str r7, [r0, #0x38]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _0223295E
	bl GF_AssertFail
_0223295E:
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl ov07_0221FEE4
	ldr r1, [r4, #0x10]
	lsls r1, r1, #2
	adds r1, r4, r1
	str r0, [r1, #0x14]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0223298A
	bne _02232990
	bl GF_AssertFail
	b _02232990
_0223298A:
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
_02232990:
	adds r5, r5, #1
	cmp r5, #8
	blt _02232924
	adds r0, r4, #0
	movs r1, #0xff
	adds r0, #0x90
	adds r4, #0x8c
	str r1, [r0]
	ldr r0, [r4]
	bl FUN_0200770C
	ldr r0, [sp]
	bl FUN_0200E390
_022329AC:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_02232730

	thumb_func_start ov07_022329B0
ov07_022329B0: @ 0x022329B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	bne _022329E0
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	bl ov07_022325F4
	adds r2, r0, #0
	movs r0, #1
	str r0, [r4, #0x10]
	ldr r0, [r4]
	movs r1, #0x5f
	movs r3, #0
	bl ov07_0221FEB0
	str r0, [r4, #0x14]
	movs r0, #0xff
	adds r4, #0x90
	str r0, [r4]
	pop {r4, pc}
_022329E0:
	movs r1, #0
	adds r0, r4, #0
	movs r2, #0xfa
	str r1, [r4, #0x10]
	adds r0, #0x90
	str r1, [r0]
	ldr r0, _02232A00 @ =ov07_02232730
	adds r1, r4, #0
	lsls r2, r2, #2
	bl FUN_0200E320
	adds r1, r4, #0
	bl ov07_02232730
	pop {r4, pc}
	nop
_02232A00: .4byte ov07_02232730
	thumb_func_end ov07_022329B0

	thumb_func_start ov07_02232A04
ov07_02232A04: @ 0x02232A04
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xff
	bne _02232A10
	movs r0, #1
	bx lr
_02232A10:
	movs r0, #0
	bx lr
	thumb_func_end ov07_02232A04

	thumb_func_start ov07_02232A14
ov07_02232A14: @ 0x02232A14
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #1
	adds r0, #0x88
	str r1, [r0]
	bl ov07_0221C69C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov07_02232AFC
	movs r2, #0xfa
	ldr r0, _02232A40 @ =ov07_02232A5C
	adds r1, r5, #0
	lsls r2, r2, #2
	bl FUN_0200E320
	adds r5, #0x84
	str r0, [r5]
	pop {r3, r4, r5, pc}
	nop
_02232A40: .4byte ov07_02232A5C
	thumb_func_end ov07_02232A14

	thumb_func_start ov07_02232A44
ov07_02232A44: @ 0x02232A44
	ldr r3, _02232A4C @ =ov07_02232A14
	ldr r1, _02232A50 @ =ov07_02232C28
	bx r3
	nop
_02232A4C: .4byte ov07_02232A14
_02232A50: .4byte ov07_02232C28
	thumb_func_end ov07_02232A44

	thumb_func_start ov07_02232A54
ov07_02232A54: @ 0x02232A54
	adds r0, #0x88
	ldr r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov07_02232A54

	thumb_func_start ov07_02232A5C
ov07_02232A5C: @ 0x02232A5C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	str r0, [sp]
	ldr r0, [r6, #0x10]
	movs r7, #0
	cmp r0, #9
	ble _02232A6E
	bl GF_AssertFail
_02232A6E:
	ldr r0, [r6, #0x10]
	movs r4, #0
	cmp r0, #0
	ble _02232AA6
	adds r5, r6, #0
_02232A78:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _02232A9C
	bl FUN_020154B0
	cmp r0, #0
	bne _02232A9A
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	beq _02232A9A
	ldr r0, [r5, #0x14]
	bl ov07_0221FF2C
	movs r0, #0
	str r0, [r5, #0x14]
	str r0, [r5, #0x5c]
	b _02232A9C
_02232A9A:
	movs r7, #1
_02232A9C:
	ldr r0, [r6, #0x10]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r0
	blt _02232A78
_02232AA6:
	cmp r7, #0
	bne _02232AB6
	movs r0, #0
	adds r6, #0x88
	str r0, [r6]
	ldr r0, [sp]
	bl FUN_0200E390
_02232AB6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02232A5C

	thumb_func_start ov07_02232AB8
ov07_02232AB8: @ 0x02232AB8
	ldr r3, _02232ABC @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_02232ABC: .4byte FUN_0201AB0C
	thumb_func_end ov07_02232AB8

	thumb_func_start ov07_02232AC0
ov07_02232AC0: @ 0x02232AC0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02232AF4
	ldr r0, [r4, #0xc]
	movs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x18]
	movs r1, #0
	adds r3, r4, #0
	bl FUN_02015494
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02015528
	adds r0, r5, #0
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
_02232AF4:
	subs r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02232AC0

	thumb_func_start ov07_02232AFC
ov07_02232AFC: @ 0x02232AFC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x94
	ldr r0, [r0]
	adds r7, r1, #0
	cmp r0, #0
	bne _02232B3A
	adds r0, r6, #0
	adds r0, #0x98
	ldr r0, [r0]
	bl ov07_02232608
	adds r5, r0, #0
	movs r4, #0
	cmp r5, #0
	ble _02232B2E
_02232B1C:
	ldr r0, [r6, #0x14]
	adds r1, r4, #0
	adds r2, r7, #0
	adds r3, r6, #0
	bl FUN_02015494
	adds r4, r4, #1
	cmp r4, r5
	blt _02232B1C
_02232B2E:
	movs r1, #1
	str r1, [r6, #0x5c]
	ldr r0, [r6, #0x14]
	bl FUN_02015528
	pop {r3, r4, r5, r6, r7, pc}
_02232B3A:
	ldr r0, [r6, #0x10]
	movs r7, #0
	cmp r0, #0
	ble _02232BA0
	adds r0, r6, #0
	str r0, [sp]
	adds r0, #0x5c
	adds r5, r6, #0
	str r0, [sp]
_02232B4C:
	ldr r0, [r6]
	movs r1, #0x1c
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02232B5C
	bl GF_AssertFail
_02232B5C:
	str r7, [r4]
	ldr r0, [r6, #4]
	str r0, [r4, #8]
	ldr r0, _02232BA4 @ =ov07_02232C64
	str r0, [r4, #0x18]
	movs r0, #0
	str r0, [r5, #0x5c]
	ldr r0, [sp]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x14]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x38]
	str r0, [r4, #0x14]
	cmp r0, #0
	bne _02232B7E
	bl GF_AssertFail
_02232B7E:
	ldr r0, [r4, #0x14]
	bl ov07_02234530
	str r0, [r4, #4]
	ldr r0, _02232BA8 @ =ov07_02232AC0
	ldr r2, _02232BAC @ =0x000003E9
	adds r1, r4, #0
	bl FUN_0200E320
	ldr r0, [sp]
	adds r7, r7, #1
	adds r0, r0, #4
	str r0, [sp]
	ldr r0, [r6, #0x10]
	adds r5, r5, #4
	cmp r7, r0
	blt _02232B4C
_02232BA0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232BA4: .4byte ov07_02232C64
_02232BA8: .4byte ov07_02232AC0
_02232BAC: .4byte 0x000003E9
	thumb_func_end ov07_02232AFC

	thumb_func_start ov07_02232BB0
ov07_02232BB0: @ 0x02232BB0
	push {r3, r4, r5, lr}
	movs r2, #0
	movs r3, #1
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov07_02231DE0
	cmp r5, #5
	bhi _02232C06
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02232BCE: @ jump table
	.2byte _02232BDA - _02232BCE - 2 @ case 0
	.2byte _02232BE2 - _02232BCE - 2 @ case 1
	.2byte _02232BEC - _02232BCE - 2 @ case 2
	.2byte _02232BF4 - _02232BCE - 2 @ case 3
	.2byte _02232BFE - _02232BCE - 2 @ case 4
	.2byte _02232C06 - _02232BCE - 2 @ case 5
_02232BDA:
	movs r5, #0
	adds r0, r5, #0
	subs r0, #0x10
	b _02232C0E
_02232BE2:
	movs r5, #0xe
	mvns r5, r5
	adds r0, r5, #0
	subs r0, #0xa
	b _02232C0E
_02232BEC:
	movs r5, #7
	mvns r5, r5
	subs r0, r5, #4
	b _02232C0E
_02232BF4:
	movs r5, #0xd
	mvns r5, r5
	adds r0, r5, #0
	subs r0, #0xb
	b _02232C0E
_02232BFE:
	movs r5, #7
	mvns r5, r5
	subs r0, r5, #4
	b _02232C0E
_02232C06:
	movs r5, #0xf
	mvns r5, r5
	adds r0, r5, #0
	subs r0, #0xd
_02232C0E:
	adds r5, #0xa
	ldr r3, [r4]
	movs r1, #0xac
	adds r2, r5, #0
	muls r2, r1, r2
	subs r2, r3, r2
	str r2, [r4]
	adds r0, #0x20
	ldr r2, [r4, #4]
	muls r1, r0, r1
	subs r0, r2, r1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02232BB0

	thumb_func_start ov07_02232C28
ov07_02232C28: @ 0x02232C28
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl FUN_02015504
	ldr r0, [r0, #4]
	add r1, sp, #0
	bl ov07_02232BB0
	ldr r0, [r4, #0x20]
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r1, r0
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, r1, r0
	str r0, [r4, #0x30]
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov07_02232C28

	thumb_func_start ov07_02232C64
ov07_02232C64: @ 0x02232C64
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl FUN_02015504
	adds r4, r0, #0
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl ov07_02232BB0
	ldr r0, [r4, #0x14]
	bl FUN_0202CC48
	bl FUN_0209109C
	ldr r0, [r4, #0x14]
	bl FUN_0202CC4C
	adds r6, r0, #0
	ldr r0, [r4, #0x14]
	bl FUN_0202CC50
	subs r6, #0xbe
	lsls r1, r6, #0x10
	asrs r3, r1, #0x10
	ldr r2, [sp]
	movs r1, #0xac
	adds r4, r3, #0
	muls r4, r1, r4
	adds r3, r2, r4
	movs r4, #0x64
	subs r0, r4, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #4]
	muls r1, r0, r1
	adds r0, r2, r1
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r3, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, r1, r0
	str r0, [r5, #0x30]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov07_02232C64

	thumb_func_start ov07_02232CD8
ov07_02232CD8: @ 0x02232CD8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02015504
	movs r1, #2
	ldrsh r2, [r0, r1]
	movs r1, #0x64
	movs r3, #0xac
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r2, r1, #0x10
	adds r1, r2, #0
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r3, r1
	subs r0, #0x81
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, #0
	ldr r0, [r4, #0x20]
	muls r2, r3, r2
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r2, r0
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	str r0, [r4, #0x30]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02232CD8

	thumb_func_start ov07_02232D20
ov07_02232D20: @ 0x02232D20
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	movs r1, #0x24
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02232D34
	bl GF_AssertFail
_02232D34:
	ldm r5!, {r0, r1}
	adds r2, r4, #0
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r5]
	str r0, [r2]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02232D58
	ldr r0, _02232D7C @ =0x00000403
	bl ov07_0223261C
	str r0, [r4, #0x20]
	ldr r0, _02232D7C @ =0x00000403
	bl ov07_02232630
	b _02232D66
_02232D58:
	ldr r0, [r4, #4]
	bl ov07_0223261C
	str r0, [r4, #0x20]
	ldr r0, [r4, #4]
	bl ov07_02232630
_02232D66:
	str r0, [r4, #0x1c]
	ldr r0, [r4, #8]
	ldr r2, [r4, #0x20]
	movs r1, #0x5f
	movs r3, #0
	bl ov07_0221FEB0
	str r0, [r4, #0x18]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02232D7C: .4byte 0x00000403
	thumb_func_end ov07_02232D20

	thumb_func_start ov07_02232D80
ov07_02232D80: @ 0x02232D80
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0xc]
	cmp r1, #0xff
	bne _02232DDA
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _02232DB0
	ldr r0, [r5, #0x1c]
	movs r4, #0
	cmp r0, #0
	ble _02232DE4
	ldr r6, _02232DF0 @ =ov07_02232CD8
_02232D9A:
	ldr r0, [r5, #0x18]
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl FUN_02015494
	ldr r0, [r5, #0x1c]
	adds r4, r4, #1
	cmp r4, r0
	blt _02232D9A
	b _02232DE4
_02232DB0:
	ldr r0, [r5, #0x1c]
	movs r4, #0
	cmp r0, #0
	ble _02232DE4
	ldr r6, _02232DF0 @ =ov07_02232CD8
_02232DBA:
	ldr r0, [r5, #4]
	bl ov07_02232644
	cmp r4, r0
	beq _02232DD0
	ldr r0, [r5, #0x18]
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl FUN_02015494
_02232DD0:
	ldr r0, [r5, #0x1c]
	adds r4, r4, #1
	cmp r4, r0
	blt _02232DBA
	b _02232DE4
_02232DDA:
	ldr r0, [r5, #0x18]
	ldr r2, _02232DF0 @ =ov07_02232CD8
	adds r3, r5, #0
	bl FUN_02015494
_02232DE4:
	ldr r0, [r5, #0x18]
	movs r1, #1
	bl FUN_02015528
	pop {r4, r5, r6, pc}
	nop
_02232DF0: .4byte ov07_02232CD8
	thumb_func_end ov07_02232D80

	thumb_func_start ov07_02232DF4
ov07_02232DF4: @ 0x02232DF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	bl FUN_020154B0
	cmp r0, #0
	bne _02232E0C
	ldr r0, [r4, #0x18]
	bl ov07_0221FF2C
	movs r0, #0
	pop {r4, pc}
_02232E0C:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232DF4

	thumb_func_start ov07_02232E10
ov07_02232E10: @ 0x02232E10
	ldr r3, _02232E14 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_02232E14: .4byte FUN_0201AB0C
	thumb_func_end ov07_02232E10

	thumb_func_start ov07_02232E18
ov07_02232E18: @ 0x02232E18
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232E2C
	adds r1, r1, #1
	str r1, [r4, #4]
	movs r1, #1
	bl ov07_02233EB8
_02232E2C:
	adds r0, r4, #0
	movs r1, #2
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232E3C
	movs r0, #0
	pop {r4, pc}
_02232E3C:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232E18

	thumb_func_start ov07_02232E40
ov07_02232E40: @ 0x02232E40
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232E54
	adds r1, r1, #1
	str r1, [r4, #4]
	movs r1, #3
	bl ov07_02233EB8
_02232E54:
	adds r0, r4, #0
	movs r1, #4
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232E64
	movs r0, #0
	pop {r4, pc}
_02232E64:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232E40

	thumb_func_start ov07_02232E68
ov07_02232E68: @ 0x02232E68
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232E7C
	adds r1, r1, #1
	str r1, [r4, #4]
	movs r1, #5
	bl ov07_02233EB8
_02232E7C:
	adds r0, r4, #0
	movs r1, #6
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232E8C
	movs r0, #0
	pop {r4, pc}
_02232E8C:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232E68

	thumb_func_start ov07_02232E90
ov07_02232E90: @ 0x02232E90
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232EA4
	adds r1, r1, #1
	str r1, [r4, #4]
	movs r1, #7
	bl ov07_02233EB8
_02232EA4:
	adds r0, r4, #0
	movs r1, #0xe
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232EB4
	movs r0, #0
	pop {r4, pc}
_02232EB4:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232E90

	thumb_func_start ov07_02232EB8
ov07_02232EB8: @ 0x02232EB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232ECC
	adds r1, r1, #1
	str r1, [r4, #4]
	movs r1, #0xf
	bl ov07_02233EB8
_02232ECC:
	adds r0, r4, #0
	movs r1, #0x12
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232EDC
	movs r0, #0
	pop {r4, pc}
_02232EDC:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232EB8

	thumb_func_start ov07_02232EE0
ov07_02232EE0: @ 0x02232EE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232EF4
	adds r1, r1, #1
	str r1, [r4, #4]
	movs r1, #0x13
	bl ov07_02233EB8
_02232EF4:
	adds r0, r4, #0
	movs r1, #0x1b
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232F04
	movs r0, #0
	pop {r4, pc}
_02232F04:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232EE0

	thumb_func_start ov07_02232F08
ov07_02232F08: @ 0x02232F08
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232F1C
	adds r1, r1, #1
	str r1, [r4, #4]
	movs r1, #0x15
	bl ov07_02233EB8
_02232F1C:
	adds r0, r4, #0
	movs r1, #0x16
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232F2C
	movs r0, #0
	pop {r4, pc}
_02232F2C:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232F08

	thumb_func_start ov07_02232F30
ov07_02232F30: @ 0x02232F30
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232F44
	adds r1, r1, #1
	str r1, [r4, #4]
	movs r1, #0x17
	bl ov07_02233EB8
_02232F44:
	adds r0, r4, #0
	movs r1, #0x1b
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232F54
	movs r0, #0
	pop {r4, pc}
_02232F54:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232F30

	thumb_func_start ov07_02232F58
ov07_02232F58: @ 0x02232F58
	str r1, [r0]
	movs r1, #0
	str r1, [r0, #4]
	bx lr
	thumb_func_end ov07_02232F58

	thumb_func_start ov07_02232F60
ov07_02232F60: @ 0x02232F60
	push {r3, lr}
	ldr r1, [r0]
	lsls r2, r1, #2
	ldr r1, _02232F70 @ =0x022371B8
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	nop
_02232F70: .4byte 0x022371B8
	thumb_func_end ov07_02232F60

	thumb_func_start ov07_02232F74
ov07_02232F74: @ 0x02232F74
	str r1, [r0, #0x14]
	movs r1, #0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end ov07_02232F74

	thumb_func_start ov07_02232F80
ov07_02232F80: @ 0x02232F80
	movs r0, #1
	bx lr
	thumb_func_end ov07_02232F80

	thumb_func_start ov07_02232F84
ov07_02232F84: @ 0x02232F84
	push {r4, lr}
	adds r4, r0, #0
	bl ov07_022335B4
	cmp r0, #0
	bne _02232F98
	adds r0, r4, #0
	movs r1, #2
	bl ov07_02232F74
_02232F98:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232F84

	thumb_func_start ov07_02232F9C
ov07_02232F9C: @ 0x02232F9C
	push {r3, lr}
	movs r1, #3
	bl ov07_02232F74
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov07_02232F9C

	thumb_func_start ov07_02232FA8
ov07_02232FA8: @ 0x02232FA8
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _02233078
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02232FC0: @ jump table
	.2byte _02232FC8 - _02232FC0 - 2 @ case 0
	.2byte _0223301E - _02232FC0 - 2 @ case 1
	.2byte _02233034 - _02232FC0 - 2 @ case 2
	.2byte _02233050 - _02232FC0 - 2 @ case 3
_02232FC8:
	ldr r0, [r4, #0x30]
	movs r1, #1
	bl FUN_0200DC4C
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	add r2, sp, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	add r1, sp, #0
	str r0, [sp, #8]
	movs r0, #0xff
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x30]
	adds r2, #2
	bl FUN_0200DE44
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xb4
	adds r1, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_0221FDFC
	adds r1, r4, #0
	adds r1, #0xd8
	str r0, [r1]
	add r0, sp, #0
	bl ov07_02232D20
	adds r1, r4, #0
	adds r1, #0xd0
	str r0, [r1]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233080
_0223301E:
	ldr r0, [r4, #0x30]
	bl FUN_0200DCD4
	cmp r0, #2
	blt _02233080
	movs r0, #0
	str r0, [r4, #0x24]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233080
_02233034:
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232D80
	adds r0, r4, #0
	adds r0, #0xd8
	ldr r0, [r0]
	bl ov07_0221FE08
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233080
_02233050:
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232DF4
	cmp r0, #0
	bne _02233080
	ldr r0, [r4, #0x30]
	movs r1, #0
	bl FUN_0200DCC0
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232E10
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233080
_02233078:
	adds r0, r4, #0
	movs r1, #4
	bl ov07_02232F74
_02233080:
	movs r0, #1
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov07_02232FA8

	thumb_func_start ov07_02233088
ov07_02233088: @ 0x02233088
	movs r0, #1
	bx lr
	thumb_func_end ov07_02233088

	thumb_func_start ov07_0223308C
ov07_0223308C: @ 0x0223308C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _022330CC
	adds r1, r4, #0
	adds r2, r4, #0
	ldr r0, [r4, #0x30]
	adds r1, #0xb8
	adds r2, #0xba
	bl FUN_0200DE44
	adds r0, r4, #0
	movs r1, #0x3c
	adds r0, #0xbc
	strh r1, [r0]
	adds r0, r4, #0
	movs r1, #0xb4
	adds r0, #0xbe
	strh r1, [r0]
	adds r0, r4, #0
	movs r1, #0xa
	adds r0, #0xc0
	str r1, [r0]
	adds r0, r4, #0
	movs r1, #0xc
	adds r0, #0xc8
	str r1, [r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	b _022330DC
_022330CC:
	bl ov07_022335B4
	cmp r0, #0
	bne _022330DC
	adds r0, r4, #0
	movs r1, #6
	bl ov07_02232F74
_022330DC:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov07_0223308C

	thumb_func_start ov07_022330E0
ov07_022330E0: @ 0x022330E0
	movs r0, #1
	bx lr
	thumb_func_end ov07_022330E0

	thumb_func_start ov07_022330E4
ov07_022330E4: @ 0x022330E4
	push {r3, lr}
	movs r1, #8
	bl ov07_02232F74
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022330E4

	thumb_func_start ov07_022330F0
ov07_022330F0: @ 0x022330F0
	push {r3, lr}
	movs r1, #9
	bl ov07_02232F74
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022330F0

	thumb_func_start ov07_022330FC
ov07_022330FC: @ 0x022330FC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0223310E
	cmp r0, #1
	beq _02233142
	b _02233184
_0223310E:
	ldr r0, [r4, #0x30]
	bl FUN_0200DD30
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	ldr r0, _022331A0 @ =0x0000037F
	movs r3, #1
	adds r5, r3, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	lsls r5, r2
	adds r0, #0xb0
	lsls r2, r5, #0x10
	ldr r0, [r0]
	movs r1, #4
	lsrs r2, r2, #0x10
	subs r3, r3, #2
	bl FUN_02003370
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0223319A
_02233142:
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_02003B44
	cmp r0, #0
	bne _0223319A
	ldr r0, [r4, #0x30]
	bl FUN_0200DD30
	adds r2, r0, #0
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _022331A0 @ =0x0000037F
	movs r3, #1
	adds r5, r3, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	lsls r5, r2
	adds r0, #0xb0
	lsls r2, r5, #0x10
	ldr r0, [r0]
	movs r1, #4
	lsrs r2, r2, #0x10
	subs r3, r3, #2
	bl FUN_02003370
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0223319A
_02233184:
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_02003B44
	cmp r0, #0
	bne _0223319A
	adds r0, r4, #0
	movs r1, #0xa
	bl ov07_02232F74
_0223319A:
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_022331A0: .4byte 0x0000037F
	thumb_func_end ov07_022330FC

	thumb_func_start ov07_022331A4
ov07_022331A4: @ 0x022331A4
	push {r3, lr}
	movs r1, #0xb
	bl ov07_02232F74
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022331A4

	thumb_func_start ov07_022331B0
ov07_022331B0: @ 0x022331B0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _022331C2
	cmp r0, #1
	beq _02233202
	b _0223321E
_022331C2:
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #1
	blt _0223321E
	add r1, sp, #8
	ldr r0, [r4, #0x30]
	adds r1, #2
	add r2, sp, #8
	bl FUN_0200DE44
	add r1, sp, #8
	movs r0, #0
	ldrsh r3, [r1, r0]
	movs r0, #2
	ldrsh r1, [r1, r0]
	adds r0, r3, #0
	adds r0, #0x20
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x48
	adds r2, r1, #0
	bl ov07_02222268
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0223321E
_02233202:
	adds r0, r4, #0
	ldr r1, [r4, #0x30]
	adds r0, #0x48
	bl ov07_022222F0
	cmp r0, #0
	bne _0223321E
	ldr r0, [r4, #8]
	movs r1, #0xd
	adds r0, r0, #1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl ov07_02232F74
_0223321E:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov07_022331B0

	thumb_func_start ov07_02233224
ov07_02233224: @ 0x02233224
	movs r0, #1
	bx lr
	thumb_func_end ov07_02233224

	thumb_func_start ov07_02233228
ov07_02233228: @ 0x02233228
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02233238
	cmp r1, #1
	beq _0223324E
	b _022332AE
_02233238:
	ldr r0, [r5, #0x30]
	movs r1, #1
	bl FUN_0200DC4C
	ldr r0, [r5, #0x30]
	movs r1, #0
	bl FUN_0200DCC0
	ldr r0, [r5, #8]
	adds r0, r0, #1
	str r0, [r5, #8]
_0223324E:
	ldr r1, [r5, #0xc]
	movs r0, #6
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, _022332B8 @ =0x0223730E
	ldr r1, _022332BC @ =0x02237310
	ldrsh r0, [r0, r2]
	ldrh r1, [r1, r2]
	str r0, [sp]
	ldr r0, [r5, #0x30]
	bl FUN_0200DCC0
	ldr r0, [r5, #0xc]
	ldr r4, _022332C0 @ =0x02237200
	adds r0, r0, #1
	str r0, [r5, #0xc]
	movs r6, #0
	movs r7, #0x75
_02233272:
	ldr r1, [r5, #0xc]
	ldr r0, [r4]
	cmp r1, r0
	bne _02233286
	ldr r0, [r4, #4]
	adds r1, r7, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0200602C
_02233286:
	adds r6, r6, #1
	adds r4, #8
	cmp r6, #5
	blt _02233272
	ldr r0, [r5, #0xc]
	cmp r0, #0x14
	bgt _0223329A
	ldr r0, [sp]
	cmp r0, #0xff
	bne _022332A2
_0223329A:
	ldr r0, [r5, #8]
	adds r0, r0, #1
	str r0, [r5, #8]
	b _022332B4
_022332A2:
	ldr r0, [r5, #0x30]
	ldr r2, [sp]
	movs r1, #0
	bl FUN_0200DED0
	b _022332B4
_022332AE:
	movs r1, #0xe
	bl ov07_02232F74
_022332B4:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022332B8: .4byte 0x0223730E
_022332BC: .4byte 0x02237310
_022332C0: .4byte 0x02237200
	thumb_func_end ov07_02233228

	thumb_func_start ov07_022332C4
ov07_022332C4: @ 0x022332C4
	movs r0, #1
	bx lr
	thumb_func_end ov07_022332C4

	thumb_func_start ov07_022332C8
ov07_022332C8: @ 0x022332C8
	push {r3, lr}
	ldr r1, [r0, #0xc]
	adds r1, r1, #1
	str r1, [r0, #0xc]
	cmp r1, #0xe
	blt _022332E4
	ldr r1, [r0, #8]
	adds r1, r1, #1
	str r1, [r0, #8]
	movs r1, #0
	str r1, [r0, #0xc]
	movs r1, #0x10
	bl ov07_02232F74
_022332E4:
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022332C8

	thumb_func_start ov07_022332E8
ov07_022332E8: @ 0x022332E8
	push {r3, lr}
	movs r1, #0x11
	bl ov07_02232F74
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022332E8

	thumb_func_start ov07_022332F4
ov07_022332F4: @ 0x022332F4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02233304
	cmp r0, #1
	beq _02233314
	b _0223337C
_02233304:
	ldr r0, [r5, #0x18]
	cmp r0, #3
	blt _0223330E
	bl GF_AssertFail
_0223330E:
	ldr r0, [r5, #8]
	adds r0, r0, #1
	str r0, [r5, #8]
_02233314:
	ldr r1, [r5, #0x18]
	movs r0, #0x18
	adds r3, r1, #0
	muls r3, r0, r3
	ldr r0, _02233380 @ =0x02237254
	ldr r1, [r5, #0xc]
	adds r0, r0, r3
	lsls r2, r1, #1
	ldrsh r4, [r2, r0]
	adds r0, r1, #1
	str r0, [r5, #0xc]
	cmp r0, #0xb
	bgt _02233332
	cmp r4, #0xff
	bne _02233352
_02233332:
	ldr r0, [r5, #8]
	movs r1, #0
	adds r0, r0, #1
	str r0, [r5, #8]
	ldr r0, [r5, #0x18]
	adds r0, r0, #1
	str r0, [r5, #0x18]
	ldr r0, [r5, #0x30]
	bl FUN_0200E074
	adds r0, r5, #0
	movs r1, #0x12
	bl ov07_02232F74
	movs r0, #1
	pop {r3, r4, r5, pc}
_02233352:
	cmp r0, #5
	bne _0223335E
	ldr r0, _02233384 @ =0x000005FD
	movs r1, #0x75
	bl FUN_0200602C
_0223335E:
	ldr r0, [r5, #0x30]
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200DED0
	ldr r0, _02233388 @ =0x0001FFFE
	movs r1, #0x5a
	muls r0, r4, r0
	lsls r1, r1, #2
	blx FUN_020F2998
	adds r1, r0, #0
	ldr r0, [r5, #0x30]
	bl FUN_0200E098
_0223337C:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_02233380: .4byte 0x02237254
_02233384: .4byte 0x000005FD
_02233388: .4byte 0x0001FFFE
	thumb_func_end ov07_022332F4

	thumb_func_start ov07_0223338C
ov07_0223338C: @ 0x0223338C
	movs r0, #1
	bx lr
	thumb_func_end ov07_0223338C

	thumb_func_start ov07_02233390
ov07_02233390: @ 0x02233390
	push {r3, lr}
	movs r1, #0x14
	bl ov07_02232F74
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov07_02233390

	thumb_func_start ov07_0223339C
ov07_0223339C: @ 0x0223339C
	push {r3, lr}
	movs r1, #0x1b
	bl ov07_02232F74
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov07_0223339C

	thumb_func_start ov07_022333A8
ov07_022333A8: @ 0x022333A8
	push {r3, r4, r5, lr}
	sub sp, #0x20
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _0223347C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022333C0: @ jump table
	.2byte _022333C8 - _022333C0 - 2 @ case 0
	.2byte _022333FA - _022333C0 - 2 @ case 1
	.2byte _02233442 - _022333C0 - 2 @ case 2
	.2byte _02233454 - _022333C0 - 2 @ case 3
_022333C8:
	ldr r0, [r4, #0x30]
	bl FUN_0200DD30
	movs r1, #0
	movs r3, #1
	adds r2, r0, #0
	adds r5, r3, #0
	lsls r5, r2
	lsls r2, r5, #0x10
	str r1, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r0, r4, #0
	str r1, [sp, #8]
	adds r0, #0xb0
	ldr r0, [r0]
	movs r1, #4
	lsrs r2, r2, #0x10
	subs r3, r3, #6
	bl FUN_02003370
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233492
_022333FA:
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_02003B44
	cmp r0, #0
	bne _02233492
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	adds r1, r4, #0
	str r0, [sp, #0x10]
	adds r1, #0x94
	ldr r1, [r1]
	str r1, [sp, #0x14]
	bl ov07_02232644
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	add r2, sp, #0xc
	ldr r0, [r4, #0x30]
	add r1, sp, #0xc
	adds r2, #2
	bl FUN_0200DE44
	add r0, sp, #0xc
	bl ov07_02232D20
	adds r1, r4, #0
	adds r1, #0xd0
	str r0, [r1]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233492
_02233442:
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232D80
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233492
_02233454:
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232DF4
	cmp r0, #0
	bne _02233492
	ldr r0, [r4, #0x30]
	movs r1, #0
	bl FUN_0200DCC0
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232E10
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233492
_0223347C:
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_02003B44
	cmp r0, #0
	bne _02233492
	adds r0, r4, #0
	movs r1, #0x16
	bl ov07_02232F74
_02233492:
	movs r0, #1
	add sp, #0x20
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_022333A8

	thumb_func_start ov07_02233498
ov07_02233498: @ 0x02233498
	movs r0, #1
	bx lr
	thumb_func_end ov07_02233498

	thumb_func_start ov07_0223349C
ov07_0223349C: @ 0x0223349C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _022334AE
	cmp r1, #1
	beq _022334E0
	b _022334F4
_022334AE:
	ldr r0, [r4, #0x30]
	bl FUN_0200DD30
	adds r2, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0
	movs r3, #1
	adds r5, r3, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	lsls r5, r2
	adds r0, #0xb0
	lsls r2, r5, #0x10
	ldr r0, [r0]
	movs r1, #4
	lsrs r2, r2, #0x10
	subs r3, r3, #6
	bl FUN_02003370
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _022334FA
_022334E0:
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_02003B44
	cmp r0, #0
	bne _022334FA
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _022334FA
_022334F4:
	movs r1, #0x18
	bl ov07_02232F74
_022334FA:
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov07_0223349C

	thumb_func_start ov07_02233500
ov07_02233500: @ 0x02233500
	push {r3, lr}
	movs r1, #0x19
	bl ov07_02232F74
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov07_02233500

	thumb_func_start ov07_0223350C
ov07_0223350C: @ 0x0223350C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0223351C
	cmp r1, #1
	beq _0223352A
	b _02233582
_0223351C:
	ldr r0, [r4, #0x30]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
_0223352A:
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _02233552
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x21
	strb r1, [r0]
	b _0223356E
_02233552:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r4, #0
	movs r2, #0xf
	adds r0, #0x21
	strb r2, [r0]
	ldr r0, [r4, #0x30]
	bl FUN_0200DCE8
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
_0223356E:
	adds r0, r4, #0
	adds r0, #0x20
	adds r4, #0x21
	ldrb r1, [r0]
	ldrb r0, [r4]
	lsls r0, r0, #8
	orrs r1, r0
	ldr r0, _0223358C @ =0x04000052
	strh r1, [r0]
	b _02233588
_02233582:
	movs r1, #0x1a
	bl ov07_02232F74
_02233588:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0223358C: .4byte 0x04000052
	thumb_func_end ov07_0223350C

	thumb_func_start ov07_02233590
ov07_02233590: @ 0x02233590
	push {r3, lr}
	movs r1, #0x1b
	bl ov07_02232F74
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov07_02233590

	thumb_func_start ov07_0223359C
ov07_0223359C: @ 0x0223359C
	movs r0, #0
	bx lr
	thumb_func_end ov07_0223359C

	thumb_func_start ov07_022335A0
ov07_022335A0: @ 0x022335A0
	push {r3, lr}
	ldr r1, [r0, #0x14]
	lsls r2, r1, #2
	ldr r1, _022335B0 @ =0x0223729C
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	nop
_022335B0: .4byte 0x0223729C
	thumb_func_end ov07_022335A0

	thumb_func_start ov07_022335B4
ov07_022335B4: @ 0x022335B4
	push {r3, r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bls _022335C2
	b _022337C2
_022335C2:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022335CE: @ jump table
	.2byte _022335D6 - _022335CE - 2 @ case 0
	.2byte _02233644 - _022335CE - 2 @ case 1
	.2byte _0223373E - _022335CE - 2 @ case 2
	.2byte _022337A2 - _022335CE - 2 @ case 3
_022335D6:
	movs r0, #0xba
	ldrsh r0, [r4, r0]
	adds r1, r4, #0
	movs r2, #0xb8
	str r0, [sp]
	movs r0, #0xbe
	ldrsh r0, [r4, r0]
	movs r3, #0xbc
	adds r1, #0x6c
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0xc8
	ldr r0, [r0]
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	adds r0, #0x48
	bl ov07_02222338
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	adds r0, r4, #0
	adds r0, #0xd4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl ov07_02232540
	cmp r0, #1
	bne _0223372C
	bl FUN_0201FD44
	movs r1, #0x14
	blx FUN_020F2998
	adds r1, #0xa
	ldr r0, [r4, #0x30]
	lsls r1, r1, #0xd
	bl FUN_0200E098
	b _0223385E
_02233644:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl ov07_02232540
	cmp r0, #1
	bne _022336E2
	movs r1, #2
	ldr r0, [r4, #0x30]
	lsls r1, r1, #0xc
	bl FUN_0200E098
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r2, [r0]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, [r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	adds r0, #0xa
	cmp r2, r0
	ble _0223367E
	movs r1, #2
	ldr r0, [r4, #0x30]
	lsls r1, r1, #0xc
	bl FUN_0200E098
_0223367E:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl ov07_02232580
	cmp r0, #1
	bne _022336E2
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r2, [r0]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, [r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	adds r0, #0xa
	cmp r2, r0
	bne _022336E2
	ldr r0, [r4, #0x30]
	bl FUN_0200DD30
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	subs r0, #0x12
	str r0, [sp, #4]
	movs r2, #2
	adds r1, r4, #0
	lsls r3, r3, #0x14
	str r2, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _02233864 @ =0x0000FFFF
	adds r1, #0x94
	str r0, [sp, #0x14]
	ldr r0, _02233868 @ =0x000003EA
	lsrs r3, r3, #0x10
	str r0, [sp, #0x18]
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_02222F10
	adds r1, r4, #0
	adds r1, #0xd4
	str r0, [r1]
_022336E2:
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xc4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #6
	blt _0223371A
	cmp r0, #8
	bgt _0223371A
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, [r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r2, r0, #1
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r1, [r0]
	cmp r1, r2
	ble _0223371A
	adds r0, r2, #5
	cmp r1, r0
	blt _0223372C
_0223371A:
	adds r0, r4, #0
	adds r1, r4, #0
	ldr r2, [r4, #0x30]
	adds r0, #0x48
	adds r1, #0x6c
	bl ov07_022223CC
	cmp r0, #0
	beq _0223372E
_0223372C:
	b _0223385E
_0223372E:
	adds r0, r4, #0
	movs r1, #0
	bl ov07_022344B4
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0223385E
_0223373E:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl ov07_02232580
	cmp r0, #1
	bne _02233772
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02233772
	bl ov07_02222EE8
	cmp r0, #1
	beq _0223385E
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	bl ov07_02222EF8
	movs r0, #1
	str r0, [r4, #0x28]
	add sp, #0x1c
	movs r0, #0
	pop {r3, r4, pc}
_02233772:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xf
	blt _02233786
	movs r0, #1
	str r0, [r4, #0x28]
	add sp, #0x1c
	movs r0, #0
	pop {r3, r4, pc}
_02233786:
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r1, [r0]
	ldr r0, _0223386C @ =0x00000401
	cmp r1, r0
	bne _0223379A
	ldr r0, _02233870 @ =0x000007E8
	movs r1, #0x75
	bl FUN_0200602C
_0223379A:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0223385E
_022337A2:
	ldr r0, [r4, #0x30]
	movs r1, #1
	bl FUN_0200DC4C
	adds r0, r4, #0
	movs r1, #1
	bl ov07_022344C0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _0223385E
_022337C2:
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #5
	bne _0223381C
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xc
	beq _02233818
	cmp r0, #0xd
	beq _02233818
	ldr r0, [r4, #0x30]
	bl FUN_0200DD30
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	subs r0, #0x12
	str r0, [sp, #4]
	movs r2, #2
	adds r1, r4, #0
	lsls r3, r3, #0x14
	str r2, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _02233864 @ =0x0000FFFF
	adds r1, #0x94
	str r0, [sp, #0x14]
	ldr r0, _02233868 @ =0x000003EA
	lsrs r3, r3, #0x10
	str r0, [sp, #0x18]
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_02222F10
	adds r1, r4, #0
	adds r1, #0xd4
	str r0, [r1]
_02233818:
	movs r0, #1
	str r0, [r4, #0x28]
_0223381C:
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xc4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0xf
	ble _0223385E
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xc
	beq _02233858
	cmp r0, #0xd
	beq _02233858
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	bl ov07_02222EE8
	cmp r0, #1
	beq _0223385E
	adds r4, #0xd4
	ldr r0, [r4]
	bl ov07_02222EF8
_02233858:
	add sp, #0x1c
	movs r0, #0
	pop {r3, r4, pc}
_0223385E:
	movs r0, #1
	add sp, #0x1c
	pop {r3, r4, pc}
	.align 2, 0
_02233864: .4byte 0x0000FFFF
_02233868: .4byte 0x000003EA
_0223386C: .4byte 0x00000401
_02233870: .4byte 0x000007E8
	thumb_func_end ov07_022335B4

	thumb_func_start ov07_02233874
ov07_02233874: @ 0x02233874
	push {r3, r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bls _02233882
	b _02233A6E
_02233882:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223388E: @ jump table
	.2byte _02233896 - _0223388E - 2 @ case 0
	.2byte _02233904 - _0223388E - 2 @ case 1
	.2byte _022339FE - _0223388E - 2 @ case 2
	.2byte _02233A4E - _0223388E - 2 @ case 3
_02233896:
	movs r0, #0xba
	ldrsh r0, [r4, r0]
	adds r1, r4, #0
	movs r2, #0xb8
	str r0, [sp]
	movs r0, #0xbe
	ldrsh r0, [r4, r0]
	movs r3, #0xbc
	adds r1, #0x6c
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0xc8
	ldr r0, [r0]
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	adds r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	adds r0, #0x48
	bl ov07_02222338
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	adds r0, r4, #0
	adds r0, #0xd4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl ov07_02232540
	cmp r0, #1
	bne _022339EC
	bl FUN_0201FD44
	movs r1, #0x14
	blx FUN_020F2998
	adds r1, #0xa
	ldr r0, [r4, #0x30]
	lsls r1, r1, #0xd
	bl FUN_0200E098
	b _02233AF6
_02233904:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl ov07_02232540
	cmp r0, #1
	bne _022339A2
	movs r1, #2
	ldr r0, [r4, #0x30]
	lsls r1, r1, #0xc
	bl FUN_0200E098
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r2, [r0]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, [r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	adds r0, #0xa
	cmp r2, r0
	ble _0223393E
	movs r1, #2
	ldr r0, [r4, #0x30]
	lsls r1, r1, #0xc
	bl FUN_0200E098
_0223393E:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl ov07_02232580
	cmp r0, #1
	bne _022339A2
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r2, [r0]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, [r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	adds r0, #0xa
	cmp r2, r0
	bne _022339A2
	ldr r0, [r4, #0x30]
	bl FUN_0200DD30
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	subs r0, #0x12
	str r0, [sp, #4]
	movs r2, #2
	adds r1, r4, #0
	lsls r3, r3, #0x14
	str r2, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _02233AFC @ =0x0000FFFF
	adds r1, #0x94
	str r0, [sp, #0x14]
	ldr r0, _02233B00 @ =0x000003EA
	lsrs r3, r3, #0x10
	str r0, [sp, #0x18]
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_02222F10
	adds r1, r4, #0
	adds r1, #0xd4
	str r0, [r1]
_022339A2:
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xc4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #6
	blt _022339DA
	cmp r0, #8
	bgt _022339DA
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r1, [r0]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r2, r0, #1
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r1, [r0]
	cmp r1, r2
	ble _022339DA
	adds r0, r2, #5
	cmp r1, r0
	blt _022339EC
_022339DA:
	adds r0, r4, #0
	adds r1, r4, #0
	ldr r2, [r4, #0x30]
	adds r0, #0x48
	adds r1, #0x6c
	bl ov07_022223CC
	cmp r0, #0
	beq _022339EE
_022339EC:
	b _02233AF6
_022339EE:
	adds r0, r4, #0
	movs r1, #0
	bl ov07_022344B4
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233AF6
_022339FE:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl ov07_02232580
	cmp r0, #1
	bne _02233A32
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02233A32
	bl ov07_02222EE8
	cmp r0, #1
	beq _02233AF6
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	bl ov07_02222EF8
	movs r0, #1
	str r0, [r4, #0x28]
	add sp, #0x1c
	movs r0, #0
	pop {r3, r4, pc}
_02233A32:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xf
	blt _02233A46
	movs r0, #1
	str r0, [r4, #0x28]
	add sp, #0x1c
	movs r0, #0
	pop {r3, r4, pc}
_02233A46:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233AF6
_02233A4E:
	ldr r0, [r4, #0x30]
	movs r1, #1
	bl FUN_0200DC4C
	adds r0, r4, #0
	movs r1, #0
	bl ov07_022344C0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233AF6
_02233A6E:
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #5
	bne _02233AC2
	ldr r0, [r4, #0x30]
	movs r1, #2
	bl FUN_0200DCC0
	ldr r0, [r4, #0x30]
	bl FUN_0200DD30
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	subs r0, #0x12
	str r0, [sp, #4]
	movs r2, #2
	adds r1, r4, #0
	lsls r3, r3, #0x14
	str r2, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _02233AFC @ =0x0000FFFF
	adds r1, #0x94
	str r0, [sp, #0x14]
	ldr r0, _02233B00 @ =0x000003EA
	lsrs r3, r3, #0x10
	str r0, [sp, #0x18]
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_02222F10
	adds r1, r4, #0
	adds r1, #0xd4
	str r0, [r1]
	movs r0, #1
	str r0, [r4, #0x28]
_02233AC2:
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xc4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0xf
	ble _02233AF6
	adds r0, r4, #0
	adds r0, #0xd4
	ldr r0, [r0]
	bl ov07_02222EE8
	cmp r0, #1
	beq _02233AF6
	adds r4, #0xd4
	ldr r0, [r4]
	bl ov07_02222EF8
	add sp, #0x1c
	movs r0, #0
	pop {r3, r4, pc}
_02233AF6:
	movs r0, #1
	add sp, #0x1c
	pop {r3, r4, pc}
	.align 2, 0
_02233AFC: .4byte 0x0000FFFF
_02233B00: .4byte 0x000003EA
	thumb_func_end ov07_02233874

	thumb_func_start ov07_02233B04
ov07_02233B04: @ 0x02233B04
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #7
	bls _02233B12
	b _02233C8A
_02233B12:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02233B1E: @ jump table
	.2byte _02233B2E - _02233B1E - 2 @ case 0
	.2byte _02233B6C - _02233B1E - 2 @ case 1
	.2byte _02233B9C - _02233B1E - 2 @ case 2
	.2byte _02233BD2 - _02233B1E - 2 @ case 3
	.2byte _02233BE2 - _02233B1E - 2 @ case 4
	.2byte _02233C10 - _02233B1E - 2 @ case 5
	.2byte _02233C3E - _02233B1E - 2 @ case 6
	.2byte _02233C6C - _02233B1E - 2 @ case 7
_02233B2E:
	movs r1, #0
	bl ov07_022344C0
	ldr r0, [r4, #0x30]
	movs r1, #1
	bl FUN_0200DC4C
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xc4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #2
	blt _02233B82
	ldr r0, [r4, #0x30]
	movs r1, #0
	bl FUN_0200DCC0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233B6C:
	adds r0, #0xc4
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xc4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #2
	bge _02233B84
_02233B82:
	b _02233C90
_02233B84:
	ldr r0, [r4, #0x30]
	movs r1, #2
	bl FUN_0200DCC0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233B9C:
	adds r0, #0xa0
	ldr r0, [r0]
	add r2, sp, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	add r1, sp, #0
	str r0, [sp, #8]
	movs r0, #0xff
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x30]
	adds r2, #2
	bl FUN_0200DE44
	add r0, sp, #0
	bl ov07_02232D20
	adds r1, r4, #0
	adds r1, #0xd0
	str r0, [r1]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233BD2:
	adds r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232D80
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233BE2:
	adds r0, #0xc4
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xc4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #6
	blt _02233C90
	ldr r0, [r4, #0x30]
	movs r1, #2
	bl FUN_0200DCC0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233C10:
	adds r0, #0xc4
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xc4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #6
	blt _02233C90
	ldr r0, [r4, #0x30]
	movs r1, #1
	bl FUN_0200DCC0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233C3E:
	adds r0, #0xc4
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xc4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc4
	ldr r0, [r0]
	cmp r0, #6
	blt _02233C90
	ldr r0, [r4, #0x30]
	movs r1, #0
	bl FUN_0200DCC0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233C6C:
	adds r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232DF4
	cmp r0, #0
	bne _02233C90
	adds r0, r4, #0
	adds r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232E10
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233C8A:
	add sp, #0x14
	movs r0, #0
	pop {r3, r4, pc}
_02233C90:
	movs r0, #1
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov07_02233B04

	thumb_func_start ov07_02233C98
ov07_02233C98: @ 0x02233C98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02233CA8
	cmp r0, #1
	beq _02233CDC
	b _02233D0E
_02233CA8:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _02233CBE
	ldr r1, _02233D1C @ =0xFFFFE001
	adds r0, r4, #0
	adds r0, #0x34
	lsrs r2, r1, #0x13
	movs r3, #0xa
	bl ov07_022223F0
	b _02233CCC
_02233CBE:
	adds r0, r4, #0
	ldr r1, _02233D20 @ =0x00001FFF
	ldr r2, _02233D1C @ =0xFFFFE001
	adds r0, #0x34
	movs r3, #0xa
	bl ov07_022223F0
_02233CCC:
	ldr r1, [r4, #0x10]
	movs r0, #1
	eors r0, r1
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233D16
_02233CDC:
	ldr r1, [r4, #0x34]
	ldr r0, [r4, #0x30]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FUN_0200E074
	adds r0, r4, #0
	adds r0, #0x34
	bl ov07_02222440
	cmp r0, #0
	bne _02233D16
	ldr r0, [r4, #0xc]
	cmp r0, #1
	blt _02233D02
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _02233D16
_02233D02:
	adds r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	subs r0, r0, #1
	str r0, [r4, #8]
	b _02233D16
_02233D0E:
	movs r0, #0
	adds r4, #0xc4
	str r0, [r4]
	pop {r4, pc}
_02233D16:
	movs r0, #1
	pop {r4, pc}
	nop
_02233D1C: .4byte 0xFFFFE001
_02233D20: .4byte 0x00001FFF
	thumb_func_end ov07_02233C98

	thumb_func_start ov07_02233D24
ov07_02233D24: @ 0x02233D24
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0xff
	bne _02233D36
	add sp, #4
	movs r0, #0
	pop {r3, r4, pc}
_02233D36:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _02233D5A
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	add r1, sp, #0
	movs r0, #2
	ldrsh r2, [r1, r0]
	adds r0, r4, #0
	adds r0, #0xb8
	strh r2, [r0]
	movs r0, #0
	ldrsh r0, [r1, r0]
	adds r4, #0xba
	strh r0, [r4]
_02233D5A:
	movs r0, #1
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02233D24

	thumb_func_start ov07_02233D60
ov07_02233D60: @ 0x02233D60
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02233DB2
	adds r0, r4, #0
	adds r0, #0xdc
	ldr r0, [r0]
	cmp r0, #0
	ble _02233D8A
	adds r0, r4, #0
	adds r0, #0xdc
	ldr r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xdc
	str r1, [r0]
	ldr r0, [r4, #0x2c]
	bl FUN_0200D020
	pop {r4, pc}
_02233D8A:
	adds r1, #0x98
	ldr r1, [r1]
	adds r0, r4, #0
	lsls r2, r1, #2
	ldr r1, _02233DB4 @ =0x022371A0
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #0
	bne _02233DA0
	movs r0, #0
	str r0, [r4, #0x1c]
_02233DA0:
	ldr r0, [r4, #0x24]
	cmp r0, #1
	bne _02233DAC
	ldr r0, [r4, #0x30]
	bl FUN_0200DC18
_02233DAC:
	ldr r0, [r4, #0x2c]
	bl FUN_0200D020
_02233DB2:
	pop {r4, pc}
	.align 2, 0
_02233DB4: .4byte 0x022371A0
	thumb_func_end ov07_02233D60

	thumb_func_start ov07_02233DB8
ov07_02233DB8: @ 0x02233DB8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	movs r1, #0xe0
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0xe0
	adds r4, r0, #0
	blx FUN_020D4994
	cmp r4, #0
	bne _02233DD6
	bl GF_AssertFail
_02233DD6:
	adds r3, r4, #0
	adds r3, #0x90
	movs r2, #5
_02233DDC:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02233DDC
	movs r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0x10]
	str r0, [r4, #0xc]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4]
	str r0, [r4, #4]
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200CF38
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xdc
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl ov07_022325BC
	str r0, [r4, #0x24]
	adds r0, r4, #0
	movs r2, #0
	adds r0, #0xc4
	str r2, [r0]
	adds r0, r4, #0
	movs r1, #0x10
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x21
	strb r2, [r0]
	bl ov07_0221C69C
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r0, r0, #0x1f
	subs r0, r0, r1
	movs r2, #0x1f
	rors r0, r2
	adds r0, r1, r0
	beq _02233E4A
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x22
	strb r1, [r0]
	b _02233E52
_02233E4A:
	adds r0, r4, #0
	subs r2, #0x20
	adds r0, #0x22
	strb r2, [r0]
_02233E52:
	adds r0, r4, #0
	bl ov07_022342E4
	adds r0, r4, #0
	bl ov07_0223441C
	adds r0, r4, #0
	bl ov07_02233F30
	movs r0, #1
	str r0, [r4, #0x1c]
	movs r0, #0
	str r0, [r4, #0x28]
	movs r2, #0xfa
	ldr r0, _02233E84 @ =ov07_02233D60
	adds r1, r4, #0
	lsls r2, r2, #2
	bl FUN_0200E320
	adds r1, r4, #0
	adds r1, #0xcc
	str r0, [r1]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02233E84: .4byte ov07_02233D60
	thumb_func_end ov07_02233DB8

	thumb_func_start ov07_02233E88
ov07_02233E88: @ 0x02233E88
	push {r4, lr}
	adds r4, r0, #0
	bne _02233E92
	bl GF_AssertFail
_02233E92:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02233E9C
	movs r0, #1
	pop {r4, pc}
_02233E9C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov07_02233E88

	thumb_func_start ov07_02233EA0
ov07_02233EA0: @ 0x02233EA0
	push {r4, lr}
	adds r4, r0, #0
	bne _02233EAA
	bl GF_AssertFail
_02233EAA:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _02233EB4
	movs r0, #1
	pop {r4, pc}
_02233EB4:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov07_02233EA0

	thumb_func_start ov07_02233EB8
ov07_02233EB8: @ 0x02233EB8
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end ov07_02233EB8

	thumb_func_start ov07_02233EBC
ov07_02233EBC: @ 0x02233EBC
	ldr r0, [r0, #0x14]
	cmp r0, r1
	bne _02233EC6
	movs r0, #1
	bx lr
_02233EC6:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov07_02233EBC

	thumb_func_start ov07_02233ECC
ov07_02233ECC: @ 0x02233ECC
	push {r4, lr}
	adds r4, r0, #0
	bne _02233ED6
	bl GF_AssertFail
_02233ED6:
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	ldr r1, [r4, #0x2c]
	bl FUN_0200D998
	ldr r0, [r4, #0x30]
	bl FUN_0200D9DC
	adds r0, r4, #0
	adds r0, #0xcc
	ldr r0, [r0]
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_02233ECC

	thumb_func_start ov07_02233EFC
ov07_02233EFC: @ 0x02233EFC
	adds r2, r0, #0
	adds r0, #0x98
	str r1, [r0]
	movs r0, #0
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	str r0, [r2, #0x10]
	movs r0, #1
	adds r1, r2, #0
	str r0, [r2, #0x1c]
	ldr r0, [r2, #0x30]
	ldr r3, _02233F1C @ =FUN_0200DE44
	adds r1, #0xb8
	adds r2, #0xba
	bx r3
	nop
_02233F1C: .4byte FUN_0200DE44
	thumb_func_end ov07_02233EFC

	thumb_func_start ov07_02233F20
ov07_02233F20: @ 0x02233F20
	push {r4, lr}
	adds r4, r0, #0
	bne _02233F2A
	bl GF_AssertFail
_02233F2A:
	adds r4, #0x98
	ldr r0, [r4]
	pop {r4, pc}
	thumb_func_end ov07_02233F20

	thumb_func_start ov07_02233F30
ov07_02233F30: @ 0x02233F30
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r2, r4, #0
	ldr r0, [r4, #0x30]
	adds r1, #0xb8
	adds r2, #0xba
	bl FUN_0200DE44
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	cmp r0, #0x11
	bls _02233F4E
	b _0223419C
_02233F4E:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02233F5A: @ jump table
	.2byte _02233F7E - _02233F5A - 2 @ case 0
	.2byte _02233F7E - _02233F5A - 2 @ case 1
	.2byte _02233F7E - _02233F5A - 2 @ case 2
	.2byte _02233F7E - _02233F5A - 2 @ case 3
	.2byte _02233F7E - _02233F5A - 2 @ case 4
	.2byte _02233F7E - _02233F5A - 2 @ case 5
	.2byte _02233F9C - _02233F5A - 2 @ case 6
	.2byte _02233FC2 - _02233F5A - 2 @ case 7
	.2byte _02233FF6 - _02233F5A - 2 @ case 8
	.2byte _0223401C - _02233F5A - 2 @ case 9
	.2byte _02234042 - _02233F5A - 2 @ case 10
	.2byte _02234068 - _02233F5A - 2 @ case 11
	.2byte _0223408E - _02233F5A - 2 @ case 12
	.2byte _022340BA - _02233F5A - 2 @ case 13
	.2byte _022340F2 - _02233F5A - 2 @ case 14
	.2byte _02234118 - _02233F5A - 2 @ case 15
	.2byte _02234144 - _02233F5A - 2 @ case 16
	.2byte _02234170 - _02233F5A - 2 @ case 17
_02233F7E:
	adds r1, r4, #0
	adds r2, r4, #0
	ldr r0, [r4, #0x30]
	adds r1, #0xbc
	adds r2, #0xbe
	bl FUN_0200DE44
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xc
	adds r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_02233F9C:
	movs r0, #0
	adds r2, r4, #0
	adds r3, r4, #0
	adds r1, r0, #0
	adds r2, #0xbc
	adds r3, #0xbe
	bl ov07_02221F04
	adds r0, r4, #0
	movs r1, #0x30
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xbe
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xbe
	adds r1, #0x20
	strh r1, [r0]
	b _0223419C
_02233FC2:
	adds r1, r4, #0
	adds r2, r4, #0
	ldr r0, [r4, #0x30]
	adds r1, #0xb8
	adds r2, #0xba
	bl FUN_0200DE44
	adds r2, r4, #0
	adds r3, r4, #0
	movs r0, #1
	movs r1, #4
	adds r2, #0xbc
	adds r3, #0xbe
	bl ov07_02221F04
	adds r0, r4, #0
	movs r1, #0x30
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xbe
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xbe
	adds r1, #0x20
	strh r1, [r0]
	b _0223419C
_02233FF6:
	adds r2, r4, #0
	adds r3, r4, #0
	movs r0, #1
	movs r1, #2
	adds r2, #0xbc
	adds r3, #0xbe
	bl ov07_02221F04
	adds r0, r4, #0
	movs r1, #0x30
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xbe
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xbe
	adds r1, #0x20
	strh r1, [r0]
	b _0223419C
_0223401C:
	adds r2, r4, #0
	adds r3, r4, #0
	movs r0, #0
	movs r1, #1
	adds r2, #0xbc
	adds r3, #0xbe
	bl ov07_02221F04
	adds r0, r4, #0
	movs r1, #0x30
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xbe
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xbe
	adds r1, #0x20
	strh r1, [r0]
	b _0223419C
_02234042:
	adds r2, r4, #0
	adds r3, r4, #0
	movs r0, #1
	movs r1, #3
	adds r2, #0xbc
	adds r3, #0xbe
	bl ov07_02221F04
	adds r0, r4, #0
	movs r1, #0x30
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xbe
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xbe
	adds r1, #0x20
	strh r1, [r0]
	b _0223419C
_02234068:
	adds r2, r4, #0
	adds r3, r4, #0
	movs r0, #1
	movs r1, #5
	adds r2, #0xbc
	adds r3, #0xbe
	bl ov07_02221F04
	adds r0, r4, #0
	movs r1, #0x30
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xbe
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xbe
	adds r1, #0x20
	strh r1, [r0]
	b _0223419C
_0223408E:
	adds r2, r4, #0
	adds r3, r4, #0
	movs r0, #0
	movs r1, #1
	adds r2, #0xbc
	adds r3, #0xbe
	bl ov07_02221F04
	adds r0, r4, #0
	movs r1, #0x10
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xbe
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xbe
	adds r1, #0x10
	strh r1, [r0]
	movs r0, #0xc
	adds r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_022340BA:
	adds r2, r4, #0
	adds r3, r4, #0
	movs r0, #0
	movs r1, #1
	adds r2, #0xbc
	adds r3, #0xbe
	bl ov07_02221F04
	adds r0, r4, #0
	movs r1, #0x20
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xbc
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xbc
	subs r1, #0x14
	strh r1, [r0]
	movs r0, #0xbe
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xbe
	adds r1, #0x26
	strh r1, [r0]
	movs r0, #0x10
	adds r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_022340F2:
	adds r0, r4, #0
	movs r1, #0x80
	adds r0, #0xbc
	strh r1, [r0]
	adds r0, r4, #0
	movs r1, #0x40
	adds r0, #0xbe
	strh r1, [r0]
	adds r0, r4, #0
	movs r1, #0x20
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xbe
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xbe
	adds r1, #0x20
	strh r1, [r0]
	b _0223419C
_02234118:
	adds r2, r4, #0
	adds r3, r4, #0
	movs r0, #0
	movs r1, #1
	adds r2, #0xbc
	adds r3, #0xbe
	bl ov07_02221F04
	adds r0, r4, #0
	movs r1, #0x40
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xbe
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xbe
	adds r1, #8
	strh r1, [r0]
	movs r0, #0x10
	adds r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_02234144:
	adds r2, r4, #0
	adds r3, r4, #0
	movs r0, #1
	movs r1, #3
	adds r2, #0xbc
	adds r3, #0xbe
	bl ov07_02221F04
	adds r0, r4, #0
	movs r1, #0x40
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xbe
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xbe
	adds r1, #8
	strh r1, [r0]
	movs r0, #0x10
	adds r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_02234170:
	adds r2, r4, #0
	adds r3, r4, #0
	movs r0, #1
	movs r1, #5
	adds r2, #0xbc
	adds r3, #0xbe
	bl ov07_02221F04
	adds r0, r4, #0
	movs r1, #0x40
	adds r0, #0xc8
	str r1, [r0]
	movs r0, #0xbe
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xbe
	adds r1, #8
	strh r1, [r0]
	movs r0, #0x10
	adds r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_0223419C:
	movs r0, #0x14
	adds r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov07_02233F30

	thumb_func_start ov07_022341A4
ov07_022341A4: @ 0x022341A4
	push {r4, lr}
	adds r0, #0x90
	ldr r0, [r0]
	adds r3, r1, #0
	adds r4, r2, #0
	cmp r0, #0x11
	bls _022341B4
	b _022342E0
_022341B4:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022341C0: @ jump table
	.2byte _022341E4 - _022341C0 - 2 @ case 0
	.2byte _022341FA - _022341C0 - 2 @ case 1
	.2byte _02234210 - _022341C0 - 2 @ case 2
	.2byte _0223423C - _022341C0 - 2 @ case 3
	.2byte _02234226 - _022341C0 - 2 @ case 4
	.2byte _02234252 - _022341C0 - 2 @ case 5
	.2byte _02234268 - _022341C0 - 2 @ case 6
	.2byte _02234272 - _022341C0 - 2 @ case 7
	.2byte _0223427C - _022341C0 - 2 @ case 8
	.2byte _02234286 - _022341C0 - 2 @ case 9
	.2byte _02234294 - _022341C0 - 2 @ case 10
	.2byte _022342A2 - _022341C0 - 2 @ case 11
	.2byte _022342B0 - _022341C0 - 2 @ case 12
	.2byte _022342BE - _022341C0 - 2 @ case 13
	.2byte _022342CC - _022341C0 - 2 @ case 14
	.2byte _022342D6 - _022341C0 - 2 @ case 15
	.2byte _022342D6 - _022341C0 - 2 @ case 16
	.2byte _022342D6 - _022341C0 - 2 @ case 17
_022341E4:
	movs r0, #0
	adds r2, r3, #0
	adds r1, r0, #0
	adds r3, r4, #0
	bl ov07_02221F04
	movs r0, #0
	ldrsh r0, [r4, r0]
	adds r0, #0x28
	strh r0, [r4]
	pop {r4, pc}
_022341FA:
	adds r2, r3, #0
	movs r0, #0
	movs r1, #1
	adds r3, r4, #0
	bl ov07_02221F04
	movs r0, #0
	ldrsh r0, [r4, r0]
	adds r0, #0x26
	strh r0, [r4]
	pop {r4, pc}
_02234210:
	adds r2, r3, #0
	movs r0, #1
	movs r1, #2
	adds r3, r4, #0
	bl ov07_02221F04
	movs r0, #0
	ldrsh r0, [r4, r0]
	adds r0, #0x28
	strh r0, [r4]
	pop {r4, pc}
_02234226:
	adds r2, r3, #0
	movs r0, #1
	movs r1, #4
	adds r3, r4, #0
	bl ov07_02221F04
	movs r0, #0
	ldrsh r0, [r4, r0]
	adds r0, #0x28
	strh r0, [r4]
	pop {r4, pc}
_0223423C:
	adds r2, r3, #0
	movs r0, #1
	movs r1, #3
	adds r3, r4, #0
	bl ov07_02221F04
	movs r0, #0
	ldrsh r0, [r4, r0]
	adds r0, #0x26
	strh r0, [r4]
	pop {r4, pc}
_02234252:
	adds r2, r3, #0
	movs r0, #1
	movs r1, #5
	adds r3, r4, #0
	bl ov07_02221F04
	movs r0, #0
	ldrsh r0, [r4, r0]
	adds r0, #0x26
	strh r0, [r4]
	pop {r4, pc}
_02234268:
	movs r0, #0xa
	strh r0, [r3]
	movs r0, #0x64
	strh r0, [r4]
	pop {r4, pc}
_02234272:
	movs r0, #0xa
	strh r0, [r3]
	movs r0, #0x64
	strh r0, [r4]
	pop {r4, pc}
_0223427C:
	movs r0, #0xa
	strh r0, [r3]
	movs r0, #0x64
	strh r0, [r4]
	pop {r4, pc}
_02234286:
	movs r0, #0
	adds r2, r3, #0
	adds r1, r0, #0
	adds r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_02234294:
	movs r0, #0
	adds r2, r3, #0
	adds r1, r0, #0
	adds r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_022342A2:
	movs r0, #0
	adds r2, r3, #0
	adds r1, r0, #0
	adds r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_022342B0:
	movs r0, #0
	adds r2, r3, #0
	adds r1, r0, #0
	adds r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_022342BE:
	movs r0, #0
	adds r2, r3, #0
	adds r1, r0, #0
	adds r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_022342CC:
	movs r0, #0xe6
	strh r0, [r3]
	movs r0, #0x20
	strh r0, [r4]
	pop {r4, pc}
_022342D6:
	movs r0, #0x1d
	mvns r0, r0
	strh r0, [r3]
	movs r0, #0xa0
	strh r0, [r4]
_022342E0:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov07_022341A4

	thumb_func_start ov07_022342E4
ov07_022342E4: @ 0x022342E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	adds r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	movs r2, #0xa
	bl FUN_0200CFF4
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _02234314
	adds r0, r5, #0
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200CF6C
	movs r2, #0x11
	movs r1, #0
	lsls r2, r2, #0x10
	bl FUN_02009FC8
_02234314:
	movs r1, #0
	add r2, sp, #0x20
	movs r0, #0xa
_0223431A:
	adds r1, r1, #1
	stm r2!, {r0}
	cmp r1, #6
	blt _0223431A
	movs r0, #0
	str r0, [sp, #0x30]
	str r0, [sp, #0x34]
	adds r0, r5, #0
	adds r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	add r2, sp, #0x20
	bl FUN_0200D3F8
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #0
	bl ov07_02232658
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #1
	bl ov07_02232658
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #2
	bl ov07_02232658
	str r0, [sp, #0x18]
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #3
	bl ov07_02232658
	adds r1, r5, #0
	adds r1, #0x94
	str r0, [sp, #0x1c]
	ldr r1, [r1]
	movs r0, #8
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x9c
	ldr r1, [r0]
	ldr r0, _02234418 @ =0x00001770
	adds r2, r4, #0
	adds r0, r1, r0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	adds r3, r7, #0
	bl FUN_0200D504
	str r4, [sp]
	adds r2, r5, #0
	str r6, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r0, #0x9c
	ldr r1, [r0]
	ldr r0, _02234418 @ =0x00001770
	adds r2, #0xac
	adds r0, r1, r0
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r0, #0xb0
	ldr r0, [r0]
	ldr r2, [r2]
	ldr r3, [r5, #0x2c]
	movs r1, #2
	bl FUN_0200D68C
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x9c
	ldr r1, [r0]
	ldr r0, _02234418 @ =0x00001770
	ldr r3, [sp, #0x18]
	adds r0, r1, r0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	adds r2, r4, #0
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x9c
	ldr r1, [r0]
	ldr r0, _02234418 @ =0x00001770
	ldr r3, [sp, #0x1c]
	adds r0, r1, r0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	adds r2, r4, #0
	bl FUN_0200D71C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02234418: .4byte 0x00001770
	thumb_func_end ov07_022342E4

	thumb_func_start ov07_0223441C
ov07_0223441C: @ 0x0223441C
	push {r3, r4, lr}
	sub sp, #0x34
	add r2, sp, #0
	add r1, sp, #0
	adds r2, #2
	adds r4, r0, #0
	bl ov07_022341A4
	movs r0, #0
	add r1, sp, #0
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	movs r1, #1
	str r1, [sp, #0x10]
	adds r1, r4, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r1, #0xa4
	ldr r1, [r1]
	ldr r2, _02234498 @ =0x00001770
	str r1, [sp, #0x2c]
	str r0, [sp, #0x30]
	add r3, sp, #0
_0223444A:
	adds r1, r4, #0
	adds r1, #0x9c
	ldr r1, [r1]
	adds r0, r0, #1
	adds r1, r1, r2
	str r1, [r3, #0x14]
	adds r3, r3, #4
	cmp r0, #6
	blt _0223444A
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	ldr r1, [r4, #0x2c]
	add r2, sp, #0
	bl FUN_0200D734
	str r0, [r4, #0x30]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, [r4, #0x30]
	movs r1, #2
	bl FUN_0200DF98
	ldr r0, [r4, #0x30]
	movs r1, #0
	bl FUN_0200DCC0
	ldr r0, [r4, #0x30]
	movs r1, #0
	bl FUN_0200DC4C
	ldr r0, [r4, #0x30]
	bl FUN_0200DC18
	bl ov07_0221C69C
	add sp, #0x34
	pop {r3, r4, pc}
	.align 2, 0
_02234498: .4byte 0x00001770
	thumb_func_end ov07_0223441C

	thumb_func_start ov07_0223449C
ov07_0223449C: @ 0x0223449C
	ldr r3, _022344A4 @ =FUN_0200DCE8
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344A4: .4byte FUN_0200DCE8
	thumb_func_end ov07_0223449C

	thumb_func_start ov07_022344A8
ov07_022344A8: @ 0x022344A8
	ldr r3, _022344B0 @ =FUN_0200DDB8
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344B0: .4byte FUN_0200DDB8
	thumb_func_end ov07_022344A8

	thumb_func_start ov07_022344B4
ov07_022344B4: @ 0x022344B4
	ldr r3, _022344BC @ =FUN_0200E074
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344BC: .4byte FUN_0200E074
	thumb_func_end ov07_022344B4

	thumb_func_start ov07_022344C0
ov07_022344C0: @ 0x022344C0
	str r1, [r0, #0x24]
	bx lr
	thumb_func_end ov07_022344C0

	thumb_func_start ov07_022344C4
ov07_022344C4: @ 0x022344C4
	ldr r3, _022344CC @ =FUN_0200DD68
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344CC: .4byte FUN_0200DD68
	thumb_func_end ov07_022344C4

	thumb_func_start ov07_022344D0
ov07_022344D0: @ 0x022344D0
	ldr r3, _022344D8 @ =FUN_0200DD54
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344D8: .4byte FUN_0200DD54
	thumb_func_end ov07_022344D0

	thumb_func_start ov07_022344DC
ov07_022344DC: @ 0x022344DC
	adds r0, #0xdc
	str r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov07_022344DC

	thumb_func_start ov07_022344E4
ov07_022344E4: @ 0x022344E4
	push {r3, lr}
	subs r1, r1, r3
	rsbs r1, r1, #0
	subs r0, r0, r2
	lsls r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r1, r1, #0x10
	adds r2, r1, #0
	asrs r0, r0, #0x10
	muls r2, r1, r2
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r2, r1
	lsls r0, r0, #0xc
	blx FUN_020CCBEC
	asrs r1, r0, #0xb
	lsrs r1, r1, #0x14
	adds r1, r0, r1
	asrs r0, r1, #0xc
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov07_022344E4

	thumb_func_start ov07_02234510
ov07_02234510: @ 0x02234510
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_0202CC4C
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0202CC50
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0xbe
	movs r3, #0x46
	bl ov07_022344E4
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02234510

	thumb_func_start ov07_02234530
ov07_02234530: @ 0x02234530
	push {r4, lr}
	sub sp, #8
	ldr r3, _02234588 @ =0x0223777C
	adds r4, r0, #0
	add r2, sp, #0
	movs r1, #7
_0223453C:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0223453C
	adds r0, r4, #0
	bl FUN_0202CC48
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_0209109C
	cmp r0, #0
	bne _0223457E
	adds r0, r4, #0
	bl ov07_02234510
	cmp r0, #0x38
	blt _02234568
	movs r0, #3
	b _02234576
_02234568:
	adds r0, r0, #1
	movs r1, #0x14
	blx FUN_020F2998
	cmp r0, #3
	blt _02234576
	movs r0, #3
_02234576:
	add r1, sp, #0
	add sp, #8
	ldrb r0, [r1, r0]
	pop {r4, pc}
_0223457E:
	add r0, sp, #0
	ldrb r0, [r0, #1]
	add sp, #8
	pop {r4, pc}
	nop
_02234588: .4byte 0x0223777C
	thumb_func_end ov07_02234530

	thumb_func_start ov07_0223458C
ov07_0223458C: @ 0x0223458C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	movs r1, #0x48
	adds r6, r0, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _022345A4
	bl GF_AssertFail
	movs r0, #0
	pop {r4, r5, r6, pc}
_022345A4:
	bl ov07_0221C69C
	str r6, [r4]
	cmp r5, #0
	beq _022345B2
	ldr r0, [r5]
	str r0, [r4, #4]
_022345B2:
	movs r1, #0
	adds r2, r4, #0
	adds r0, r1, #0
_022345B8:
	adds r1, r1, #1
	str r0, [r2, #8]
	adds r2, r2, #4
	cmp r1, #0x10
	blt _022345B8
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_0223458C

	thumb_func_start ov07_022345C8
ov07_022345C8: @ 0x022345C8
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r5, r4, #0
	adds r3, r0, #0
_022345D0:
	ldr r2, [r3, #8]
	cmp r2, #0
	bne _022345F0
	adds r4, r0, #0
	ldr r0, [r0]
	adds r4, #8
	lsls r6, r5, #2
	bl ov07_02234658
	str r0, [r4, r6]
	ldr r0, [r4, r6]
	movs r1, #0
	str r1, [r0, #0x18]
	ldr r4, [r4, r6]
	str r5, [r4]
	b _022345F8
_022345F0:
	adds r5, r5, #1
	adds r3, r3, #4
	cmp r5, #0x10
	blt _022345D0
_022345F8:
	cmp r4, #0
	bne _02234600
	bl GF_AssertFail
_02234600:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_022345C8

	thumb_func_start ov07_02234604
ov07_02234604: @ 0x02234604
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_0223460C:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02234616
	bl FUN_0201AB0C
_02234616:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x10
	blt _0223460C
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_02234604

	thumb_func_start ov07_02234628
ov07_02234628: @ 0x02234628
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0223462E:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0223464C
	ldr r0, [r0, #0x10]
	bl ov07_0221FF2C
	ldr r1, [r5, #8]
	ldr r0, [r1, #0x20]
	cmp r0, #0
	beq _0223464C
	ldr r0, [r1, #0x18]
	cmp r0, #0
	beq _0223464C
	bl FUN_0200E390
_0223464C:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x10
	blt _0223462E
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_02234628

	thumb_func_start ov07_02234658
ov07_02234658: @ 0x02234658
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	movs r1, #0x24
	adds r5, r0, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02234670
	bl GF_AssertFail
	movs r0, #0
	pop {r4, r5, r6, pc}
_02234670:
	str r5, [r4, #4]
	ldr r1, [r6]
	ldr r0, [r6, #4]
	str r1, [r4, #8]
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	bl ov07_02234718
	str r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	movs r2, #1
	bl ov07_0221FE88
	str r0, [r4, #0x10]
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov07_02234658

	thumb_func_start ov07_02234694
ov07_02234694: @ 0x02234694
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	str r1, [r4, #0x20]
	ldr r1, _022346B4 @ =ov07_02234710
	bl ov07_022346E4
	movs r2, #0xfa
	ldr r0, _022346B8 @ =ov07_022346C0
	adds r1, r4, #0
	lsls r2, r2, #2
	bl FUN_0200E320
	str r0, [r4, #0x18]
	pop {r4, pc}
	nop
_022346B4: .4byte ov07_02234710
_022346B8: .4byte ov07_022346C0
	thumb_func_end ov07_02234694

	thumb_func_start ov07_022346BC
ov07_022346BC: @ 0x022346BC
	ldr r0, [r0, #0x20]
	bx lr
	thumb_func_end ov07_022346BC

	thumb_func_start ov07_022346C0
ov07_022346C0: @ 0x022346C0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_020154B0
	cmp r0, #0
	bne _022346E0
	movs r0, #0
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	bl ov07_0221FF2C
	adds r0, r5, #0
	bl FUN_0200E390
_022346E0:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov07_022346C0

	thumb_func_start ov07_022346E4
ov07_022346E4: @ 0x022346E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x1c]
	adds r6, r1, #0
	movs r4, #0
	cmp r0, #0
	ble _02234706
_022346F2:
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl FUN_02015494
	ldr r0, [r5, #0x1c]
	adds r4, r4, #1
	cmp r4, r0
	blt _022346F2
_02234706:
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0xc]
	bl FUN_02015528
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_022346E4

	thumb_func_start ov07_02234710
ov07_02234710: @ 0x02234710
	ldr r3, _02234714 @ =FUN_02015504
	bx r3
	.align 2, 0
_02234714: .4byte FUN_02015504
	thumb_func_end ov07_02234710

	thumb_func_start ov07_02234718
ov07_02234718: @ 0x02234718
	push {r3, r4, r5, lr}
	sub sp, #0x58
	ldr r4, _02234748 @ =0x02237784
	adds r5, r0, #0
	add r3, sp, #0
	movs r2, #0xb
_02234724:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02234724
	subs r0, r5, #5
	cmp r0, #0x16
	blo _0223473C
	bl GF_AssertFail
	add sp, #0x58
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223473C:
	lsls r1, r0, #2
	add r0, sp, #0
	ldr r0, [r0, r1]
	add sp, #0x58
	pop {r3, r4, r5, pc}
	nop
_02234748: .4byte 0x02237784
	thumb_func_end ov07_02234718

	thumb_func_start ov07_0223474C
ov07_0223474C: @ 0x0223474C
	push {r3, lr}
	adds r3, r1, #0
	ldr r1, [r0]
	movs r2, #0
	bl ov07_0223476C
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov07_0223474C

	thumb_func_start ov07_0223475C
ov07_0223475C: @ 0x0223475C
	push {r3, lr}
	adds r3, r1, #0
	ldr r1, [r0, #4]
	movs r2, #1
	bl ov07_0223476C
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov07_0223475C

	thumb_func_start ov07_0223476C
ov07_0223476C: @ 0x0223476C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	adds r7, r2, #0
	str r3, [sp, #0x10]
	bl FUN_02009334
	ldr r0, [r5, #4]
	lsls r1, r0, #1
	adds r1, r5, r1
	ldrh r6, [r1, #0x28]
	adds r1, r5, r0
	adds r1, #0x30
	ldrb r1, [r1]
	adds r2, r5, r0
	adds r2, #0x38
	str r1, [sp, #0x1c]
	adds r1, r5, r0
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r5, r0
	adds r1, #0x34
	ldr r0, [r0, #0x3c]
	ldrb r1, [r1]
	str r2, [sp, #0x18]
	str r0, [sp, #0x14]
	cmp r7, #0
	beq _022347C2
	adds r0, r5, r4
	adds r0, #0x4c
	ldrb r2, [r0]
	movs r0, #1
	tst r0, r2
	beq _022347BE
	movs r4, #0
	b _022347D4
_022347BE:
	movs r4, #2
	b _022347D4
_022347C2:
	adds r0, r5, r4
	adds r0, #0x4c
	ldrb r2, [r0]
	movs r0, #1
	tst r0, r2
	beq _022347D2
	movs r4, #2
	b _022347D4
_022347D2:
	movs r4, #0
_022347D4:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	lsls r1, r6, #0x10
	lsls r2, r2, #0x18
	lsls r3, r4, #0x18
	str r0, [sp, #8]
	add r0, sp, #0x28
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_020701E4
	ldr r0, [r5]
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	bl FUN_02009414
	adds r7, r0, #0
	add r3, sp, #0x28
	adds r2, r7, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r5]
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	bl FUN_02009324
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x10]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldrh r0, [r7, #6]
	str r0, [sp, #0xc]
	ldr r3, [r5]
	ldrh r0, [r7]
	lsls r3, r3, #2
	adds r3, r5, r3
	ldr r3, [r3, #8]
	ldrh r1, [r7, #2]
	ldr r3, [r3]
	bl FUN_02014540
	ldr r1, [r5]
	ldr r3, [sp, #0x18]
	lsls r1, r1, #2
	adds r1, r5, r1
	lsls r2, r4, #0x18
	lsls r3, r3, #0x18
	ldrh r0, [r7]
	ldr r1, [r1, #8]
	lsrs r2, r2, #0x18
	str r0, [r1, #4]
	ldr r1, [r5]
	ldrh r0, [r7, #4]
	lsls r1, r1, #2
	adds r1, r5, r1
	ldr r1, [r1, #8]
	lsrs r3, r3, #0x18
	str r0, [r1, #8]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	str r0, [sp]
	lsls r0, r6, #0x10
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x18
	bl FUN_020708D8
	ldr r1, [r5]
	lsls r1, r1, #2
	adds r1, r5, r1
	ldr r1, [r1, #8]
	str r0, [r1, #0xc]
	ldr r0, [r5]
	lsls r1, r0, #2
	adds r1, r5, r1
	ldr r1, [r1, #8]
	adds r0, r5, r0
	ldr r1, [r1, #0xc]
	adds r0, #0x4c
	lsls r1, r1, #0x18
	asrs r7, r1, #0x18
	ldrb r0, [r0]
	movs r1, #1
	bl ov07_02234B5C
	str r0, [sp, #0x20]
	ldr r0, [r5]
	ldr r2, [sp, #0x20]
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	movs r1, #1
	adds r2, r2, r7
	bl FUN_020087A4
	cmp r4, #2
	bne _02234948
	ldr r1, [sp, #0x10]
	movs r0, #0xb4
	bl FUN_02007688
	add r1, sp, #0x24
	lsls r2, r6, #0x10
	adds r1, #2
	lsrs r2, r2, #0x10
	adds r4, r0, #0
	bl FUN_020729D8
	add r1, sp, #0x24
	lsls r2, r6, #0x10
	adds r0, r4, #0
	adds r1, #1
	lsrs r2, r2, #0x10
	bl FUN_020729FC
	lsls r2, r6, #0x10
	adds r0, r4, #0
	add r1, sp, #0x24
	lsrs r2, r2, #0x10
	bl FUN_02072A20
	adds r0, r4, #0
	bl FUN_0200770C
	ldr r0, [r5]
	add r2, sp, #0x24
	lsls r0, r0, #2
	adds r0, r5, r0
	ldrb r2, [r2]
	ldr r0, [r0, #0x18]
	movs r1, #0x2e
	bl FUN_020087A4
	ldr r0, [r5]
	ldr r2, [sp, #0x20]
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, #0x24
	ldr r0, [r0, #0x18]
	movs r1, #0x14
	str r2, [sp, #0x20]
	bl FUN_020087A4
	ldr r0, [r5]
	add r3, sp, #0x24
	lsls r0, r0, #2
	movs r2, #1
	adds r0, r5, r0
	ldrsb r2, [r3, r2]
	ldr r0, [r0, #0x18]
	movs r1, #0x15
	bl FUN_020087A4
	ldr r0, [r5]
	movs r2, #0x24
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	movs r1, #0x16
	subs r2, r2, r7
	bl FUN_020087A4
	ldr r0, [r5]
	add r3, sp, #0x24
	lsls r0, r0, #2
	movs r2, #2
	adds r0, r5, r0
	ldrsb r2, [r3, r2]
	ldr r0, [r0, #0x18]
	movs r1, #0x29
	bl FUN_020087A4
_02234948:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0223476C

	thumb_func_start ov07_0223494C
ov07_0223494C: @ 0x0223494C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [r5]
	str r1, [sp, #0x10]
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	bl FUN_02009390
	ldr r0, [r5]
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	bl FUN_02009414
	adds r4, r0, #0
	ldr r0, [r5]
	lsls r1, r0, #1
	adds r1, r5, r1
	ldrh r1, [r1, #0x28]
	lsls r3, r0, #2
	str r1, [sp, #0x1c]
	adds r1, r5, r0
	adds r1, #0x30
	ldrb r1, [r1]
	str r1, [sp, #0x18]
	adds r1, r5, r0
	adds r1, #0x38
	ldrb r1, [r1]
	adds r0, r5, r0
	adds r0, #0x4c
	str r1, [sp, #0x14]
	adds r1, r5, r3
	ldr r7, [r1, #0x3c]
	ldrb r1, [r0]
	movs r0, #1
	tst r0, r1
	beq _0223499E
	movs r6, #2
	b _022349A0
_0223499E:
	movs r6, #0
_022349A0:
	str r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldrh r0, [r4, #6]
	adds r3, r5, r3
	ldr r2, [sp, #0x10]
	str r0, [sp, #0xc]
	ldr r3, [r3, #8]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	ldr r3, [r3]
	bl FUN_02014540
	ldr r1, [r5]
	ldrh r0, [r4]
	lsls r1, r1, #2
	adds r1, r5, r1
	ldr r1, [r1, #8]
	ldr r3, [sp, #0x14]
	str r0, [r1, #4]
	ldr r1, [r5]
	lsls r2, r6, #0x18
	lsls r1, r1, #2
	adds r1, r5, r1
	lsls r3, r3, #0x18
	ldrh r0, [r4, #4]
	ldr r1, [r1, #8]
	lsrs r2, r2, #0x18
	str r0, [r1, #8]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	str r7, [sp]
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x18
	lsrs r3, r3, #0x18
	bl FUN_020708D8
	ldr r1, [r5]
	lsls r1, r1, #2
	adds r1, r5, r1
	ldr r1, [r1, #8]
	str r0, [r1, #0xc]
	ldr r0, [r5]
	movs r1, #1
	lsls r4, r0, #2
	adds r0, r5, r0
	adds r0, #0x4c
	ldrb r0, [r0]
	bl ov07_02234B5C
	adds r1, r5, r4
	adds r2, r0, #0
	ldr r0, [r1, #8]
	ldr r3, [r0, #0xc]
	ldr r0, [r1, #0x18]
	movs r1, #1
	adds r2, r3, r2
	bl FUN_020087A4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0223494C

	thumb_func_start ov07_02234A20
ov07_02234A20: @ 0x02234A20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5]
	adds r6, r1, #0
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	bl FUN_02009334
	movs r0, #0x72
	add r3, sp, #0
	adds r1, r0, #0
	strh r0, [r3, #4]
	adds r1, #0x90
	strh r1, [r3, #8]
	movs r1, #0
	strh r1, [r3, #0xa]
	strb r1, [r3, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r5]
	adds r2, r5, r1
	adds r2, #0x4c
	ldrb r4, [r2]
	movs r2, #1
	tst r4, r2
	beq _02234A5E
	adds r0, #0x8f
	strh r0, [r3, #6]
	movs r4, #0x87
	b _02234A64
_02234A5E:
	adds r2, #0xff
	strh r2, [r3, #6]
	movs r4, #0x86
_02234A64:
	lsls r0, r1, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	bl FUN_02009414
	adds r7, r0, #0
	add r3, sp, #4
	adds r2, r7, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r5]
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	bl FUN_02009324
	ldr r3, [r5]
	ldrh r0, [r7]
	lsls r3, r3, #2
	adds r3, r5, r3
	ldr r3, [r3, #8]
	ldrh r1, [r7, #2]
	ldr r3, [r3]
	adds r2, r6, #0
	bl FUN_02014400
	ldr r2, [r5]
	add r1, sp, #0
	lsls r2, r2, #2
	adds r2, r5, r2
	ldrh r0, [r1, #4]
	ldr r2, [r2, #8]
	str r0, [r2, #4]
	ldr r0, [r5]
	ldrh r1, [r1, #8]
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #8]
	adds r2, r4, #0
	str r1, [r0, #8]
	add r0, sp, #0
	movs r1, #0x75
	bl FUN_02007508
	add r0, sp, #0
	ldrb r1, [r0]
	ldr r0, [r5]
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #8]
	str r1, [r0, #0xc]
	ldr r0, [r5]
	movs r1, #1
	lsls r4, r0, #2
	adds r0, r5, r0
	adds r0, #0x4c
	ldrb r0, [r0]
	bl ov07_02234B5C
	adds r2, r5, r4
	ldr r1, [r2, #8]
	ldr r1, [r1, #0xc]
	adds r4, r1, r0
	ldr r0, [r2, #0x18]
	movs r1, #1
	adds r2, r4, #0
	bl FUN_020087A4
	ldr r1, [r5]
	movs r2, #1
	adds r0, r5, r1
	adds r0, #0x4c
	ldrb r0, [r0]
	tst r0, r2
	beq _02234B58
	lsls r0, r1, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	movs r1, #0x2e
	bl FUN_020087A4
	ldr r0, [r5]
	add r2, sp, #0
	ldrb r3, [r2]
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r2, #0x24
	subs r2, r2, r3
	ldr r0, [r0, #0x18]
	movs r1, #0x14
	adds r2, r4, r2
	bl FUN_020087A4
	ldr r0, [r5]
	movs r1, #0x15
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	movs r2, #0
	bl FUN_020087A4
	ldr r0, [r5]
	add r2, sp, #0
	lsls r0, r0, #2
	ldrb r3, [r2]
	adds r0, r5, r0
	movs r2, #0x24
	ldr r0, [r0, #0x18]
	movs r1, #0x16
	subs r2, r2, r3
	bl FUN_020087A4
	ldr r0, [r5]
	movs r1, #0x29
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	movs r2, #0
	bl FUN_020087A4
_02234B58:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_02234A20

	thumb_func_start ov07_02234B5C
ov07_02234B5C: @ 0x02234B5C
	cmp r1, #0
	bne _02234B68
	lsls r1, r0, #2
	ldr r0, _02234B78 @ =0x022377DC
	ldrsh r0, [r0, r1]
	bx lr
_02234B68:
	movs r2, #6
	muls r2, r0, r2
	ldr r0, _02234B7C @ =0x022377F4
	lsls r1, r1, #1
	adds r0, r0, r2
	ldrsh r0, [r1, r0]
	bx lr
	nop
_02234B78: .4byte 0x022377DC
_02234B7C: .4byte 0x022377F4
	thumb_func_end ov07_02234B5C

	.rodata

_02234B80:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00
	.byte 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x01
	.byte 0xB5, 0xDF, 0x21, 0x02, 0x81, 0xE2, 0x21, 0x02, 0xE1, 0xE5, 0x21, 0x02, 0xB5, 0xE0, 0x21, 0x02
	.byte 0xB9, 0xE3, 0x21, 0x02, 0xED, 0xE5, 0x21, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC5, 0xC5, 0x21, 0x02, 0xC9, 0xC5, 0x21, 0x02
	.byte 0x25, 0xC6, 0x21, 0x02, 0x2D, 0xC6, 0x21, 0x02, 0x35, 0xC6, 0x21, 0x02, 0x75, 0xC6, 0x21, 0x02
	.byte 0x20, 0x00, 0x1C, 0x00, 0x18, 0x00, 0x14, 0x00, 0x10, 0x00, 0x0C, 0x00, 0x08, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x08, 0x00, 0x0C, 0x00, 0x10, 0x00, 0x14, 0x00, 0x18, 0x00, 0x1C, 0x00, 0x20, 0x00
	.byte 0xD1, 0xE6, 0x21, 0x02, 0xD5, 0xE6, 0x21, 0x02, 0xE9, 0xEC, 0x21, 0x02, 0x01, 0xED, 0x21, 0x02
	.byte 0xD1, 0xE6, 0x21, 0x02, 0x89, 0xE7, 0x21, 0x02, 0x69, 0xE8, 0x21, 0x02, 0xD5, 0xE9, 0x21, 0x02
	.byte 0x85, 0xEB, 0x21, 0x02, 0xBD, 0x00, 0x00, 0x00, 0xBD, 0x00, 0x00, 0x00, 0x2E, 0x01, 0x00, 0x00
	.byte 0x2E, 0x01, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0xA3, 0x01, 0x00, 0x00
	.byte 0x60, 0x01, 0x00, 0x00, 0xA4, 0x01, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x55, 0x01, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xED, 0xC6, 0x21, 0x02, 0x0D, 0xC7, 0x21, 0x02
	.byte 0x35, 0xC9, 0x21, 0x02, 0x75, 0xC9, 0x21, 0x02, 0xC1, 0xC9, 0x21, 0x02, 0x99, 0xF0, 0x21, 0x02
	.byte 0xA9, 0xD5, 0x21, 0x02, 0xAD, 0xD5, 0x21, 0x02, 0xF5, 0xF3, 0x21, 0x02, 0x25, 0xF4, 0x21, 0x02
	.byte 0x2D, 0xD0, 0x21, 0x02, 0x5D, 0xD0, 0x21, 0x02, 0x2D, 0xC7, 0x21, 0x02, 0x49, 0xD1, 0x21, 0x02
	.byte 0xB1, 0xD2, 0x21, 0x02, 0xE5, 0xD2, 0x21, 0x02, 0x45, 0xED, 0x21, 0x02, 0x75, 0xEE, 0x21, 0x02
	.byte 0xC1, 0xEE, 0x21, 0x02, 0x15, 0xEF, 0x21, 0x02, 0x35, 0xEF, 0x21, 0x02, 0x55, 0xEF, 0x21, 0x02
	.byte 0xCD, 0xF0, 0x21, 0x02, 0x05, 0xF1, 0x21, 0x02, 0x21, 0xF1, 0x21, 0x02, 0xDD, 0xF2, 0x21, 0x02
	.byte 0x41, 0xF3, 0x21, 0x02, 0x2D, 0xF4, 0x21, 0x02, 0x99, 0xF3, 0x21, 0x02, 0x9D, 0xF3, 0x21, 0x02
	.byte 0x89, 0xD0, 0x21, 0x02, 0xB1, 0xD5, 0x21, 0x02, 0x19, 0xD7, 0x21, 0x02, 0xC1, 0xD0, 0x21, 0x02
	.byte 0x25, 0xF0, 0x21, 0x02, 0xC1, 0xF1, 0x21, 0x02, 0x39, 0xF2, 0x21, 0x02, 0x85, 0xF0, 0x21, 0x02
	.byte 0x89, 0xF0, 0x21, 0x02, 0x8D, 0xF0, 0x21, 0x02, 0x0D, 0xDD, 0x21, 0x02, 0x11, 0xDD, 0x21, 0x02
	.byte 0x91, 0xF0, 0x21, 0x02, 0x95, 0xF0, 0x21, 0x02, 0xB1, 0xF0, 0x21, 0x02, 0xE9, 0xD0, 0x21, 0x02
	.byte 0xC1, 0xCB, 0x21, 0x02, 0x55, 0xCC, 0x21, 0x02, 0xA5, 0xCD, 0x21, 0x02, 0x5D, 0xCE, 0x21, 0x02
	.byte 0x15, 0xCF, 0x21, 0x02, 0x55, 0xCF, 0x21, 0x02, 0xA9, 0xCF, 0x21, 0x02, 0x01, 0xD0, 0x21, 0x02
	.byte 0xAD, 0xF8, 0x21, 0x02, 0x15, 0xF8, 0x21, 0x02, 0x41, 0xD7, 0x21, 0x02, 0xB9, 0xD7, 0x21, 0x02
	.byte 0x75, 0xD8, 0x21, 0x02, 0x75, 0xDA, 0x21, 0x02, 0xA1, 0xDA, 0x21, 0x02, 0xC1, 0xDC, 0x21, 0x02
	.byte 0xD5, 0xDC, 0x21, 0x02, 0xF1, 0xDC, 0x21, 0x02, 0x75, 0xD1, 0x21, 0x02, 0x1D, 0xF8, 0x21, 0x02
	.byte 0x81, 0xF8, 0x21, 0x02, 0x4D, 0xC7, 0x21, 0x02, 0xCD, 0xC8, 0x21, 0x02, 0x11, 0xC9, 0x21, 0x02
	.byte 0xB9, 0xD1, 0x21, 0x02, 0x15, 0xD2, 0x21, 0x02, 0x71, 0xD2, 0x21, 0x02, 0x31, 0xF4, 0x21, 0x02
	.byte 0xCD, 0xF4, 0x21, 0x02, 0x15, 0xF5, 0x21, 0x02, 0x75, 0xF5, 0x21, 0x02, 0xBD, 0xF5, 0x21, 0x02
	.byte 0x05, 0xF6, 0x21, 0x02, 0x11, 0xF7, 0x21, 0x02, 0xC5, 0xF7, 0x21, 0x02, 0xF1, 0xF7, 0x21, 0x02
	.byte 0xF5, 0xDA, 0x21, 0x02, 0xA9, 0xDC, 0x21, 0x02, 0xB5, 0xC6, 0x21, 0x02, 0x75, 0xD3, 0x21, 0x02
	.byte 0x95, 0xED, 0x21, 0x02, 0x3D, 0xD2, 0x21, 0x02, 0x3B, 0x00, 0x00, 0x00, 0x27, 0x01, 0x00, 0x00
	.byte 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00
	.byte 0x27, 0x01, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00
	.byte 0x77, 0x00, 0x00, 0x00, 0x3F, 0x01, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00
	.byte 0x78, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x27, 0x01, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00
	.byte 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x27, 0x01, 0x00, 0x00
	.byte 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00
	.byte 0x4A, 0x01, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00
	.byte 0x3F, 0x00, 0x00, 0x00, 0x28, 0x01, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x3D, 0x00, 0x00, 0x00
	.byte 0x3E, 0x00, 0x00, 0x00, 0x8E, 0x00, 0x00, 0x00, 0x4E, 0x01, 0x00, 0x00, 0x8F, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x8F, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00, 0x51, 0x01, 0x00, 0x00
	.byte 0x3C, 0x00, 0x00, 0x00, 0x3D, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x29, 0x01, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x29, 0x01, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00
	.byte 0x41, 0x00, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00, 0x40, 0x01, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00
	.byte 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x49, 0x01, 0x00, 0x00
	.byte 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x50, 0x01, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00
	.byte 0x77, 0x00, 0x00, 0x00, 0x3E, 0x01, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00
	.byte 0x78, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x2C, 0x01, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00
	.byte 0x42, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x34, 0x01, 0x00, 0x00
	.byte 0x42, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00
	.byte 0x3D, 0x01, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x34, 0x01, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00
	.byte 0x42, 0x00, 0x00, 0x00, 0x4B, 0x00, 0x00, 0x00, 0x2D, 0x01, 0x00, 0x00, 0x4C, 0x00, 0x00, 0x00
	.byte 0x4C, 0x00, 0x00, 0x00, 0x4A, 0x00, 0x00, 0x00, 0x53, 0x00, 0x00, 0x00, 0x2F, 0x01, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00
	.byte 0x31, 0x01, 0x00, 0x00, 0x56, 0x00, 0x00, 0x00, 0x57, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00
	.byte 0x5D, 0x00, 0x00, 0x00, 0x32, 0x01, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00
	.byte 0x5C, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0x00, 0x33, 0x01, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00
	.byte 0x5F, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x36, 0x01, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00
	.byte 0x37, 0x01, 0x00, 0x00, 0x67, 0x00, 0x00, 0x00, 0x67, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x00
	.byte 0x6C, 0x00, 0x00, 0x00, 0x38, 0x01, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00
	.byte 0x6B, 0x00, 0x00, 0x00, 0x6C, 0x00, 0x00, 0x00, 0x5C, 0x01, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00
	.byte 0x6B, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00, 0x6D, 0x00, 0x00, 0x00, 0x39, 0x01, 0x00, 0x00
	.byte 0x6E, 0x00, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00, 0x6F, 0x00, 0x00, 0x00
	.byte 0x3A, 0x01, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00
	.byte 0x6D, 0x00, 0x00, 0x00, 0x39, 0x01, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00
	.byte 0x6E, 0x00, 0x00, 0x00, 0x76, 0x00, 0x00, 0x00, 0x3C, 0x01, 0x00, 0x00, 0x73, 0x00, 0x00, 0x00
	.byte 0x74, 0x00, 0x00, 0x00, 0x75, 0x00, 0x00, 0x00, 0x76, 0x00, 0x00, 0x00, 0x3C, 0x01, 0x00, 0x00
	.byte 0x73, 0x00, 0x00, 0x00, 0x74, 0x00, 0x00, 0x00, 0x75, 0x00, 0x00, 0x00, 0x76, 0x00, 0x00, 0x00
	.byte 0x3C, 0x01, 0x00, 0x00, 0x73, 0x00, 0x00, 0x00, 0x74, 0x00, 0x00, 0x00, 0x75, 0x00, 0x00, 0x00
	.byte 0x7D, 0x00, 0x00, 0x00, 0x44, 0x01, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00
	.byte 0x7E, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x46, 0x01, 0x00, 0x00, 0x83, 0x00, 0x00, 0x00
	.byte 0x83, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00, 0x84, 0x00, 0x00, 0x00, 0x47, 0x01, 0x00, 0x00
	.byte 0x85, 0x00, 0x00, 0x00, 0x85, 0x00, 0x00, 0x00, 0x86, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x00, 0x00
	.byte 0x4C, 0x01, 0x00, 0x00, 0x89, 0x00, 0x00, 0x00, 0x8A, 0x00, 0x00, 0x00, 0x8A, 0x00, 0x00, 0x00
	.byte 0x8C, 0x00, 0x00, 0x00, 0x4D, 0x01, 0x00, 0x00, 0x8D, 0x00, 0x00, 0x00, 0x8D, 0x00, 0x00, 0x00
	.byte 0x8D, 0x00, 0x00, 0x00, 0x91, 0x00, 0x00, 0x00, 0x4F, 0x01, 0x00, 0x00, 0x92, 0x00, 0x00, 0x00
	.byte 0x92, 0x00, 0x00, 0x00, 0x92, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0x52, 0x01, 0x00, 0x00
	.byte 0x93, 0x00, 0x00, 0x00, 0x94, 0x00, 0x00, 0x00, 0x95, 0x00, 0x00, 0x00, 0x9A, 0x00, 0x00, 0x00
	.byte 0x53, 0x01, 0x00, 0x00, 0x97, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x99, 0x00, 0x00, 0x00
	.byte 0x9B, 0x00, 0x00, 0x00, 0x54, 0x01, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00
	.byte 0x9C, 0x00, 0x00, 0x00, 0x9D, 0x00, 0x00, 0x00, 0x55, 0x01, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00
	.byte 0x9E, 0x00, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00, 0x9F, 0x00, 0x00, 0x00, 0x56, 0x01, 0x00, 0x00
	.byte 0xA0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x57, 0x01, 0x00, 0x00, 0xA1, 0x00, 0x00, 0x00, 0xA2, 0x00, 0x00, 0x00, 0xA3, 0x00, 0x00, 0x00
	.byte 0xA5, 0x00, 0x00, 0x00, 0x58, 0x01, 0x00, 0x00, 0xA6, 0x00, 0x00, 0x00, 0xA6, 0x00, 0x00, 0x00
	.byte 0xA6, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x22, 0x01, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00
	.byte 0x2F, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0xA7, 0x00, 0x00, 0x00, 0x59, 0x01, 0x00, 0x00
	.byte 0xA8, 0x00, 0x00, 0x00, 0xA9, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00, 0xA7, 0x00, 0x00, 0x00
	.byte 0x5B, 0x01, 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00, 0xA9, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00
	.byte 0xAA, 0x00, 0x00, 0x00, 0x5A, 0x01, 0x00, 0x00, 0xAC, 0x00, 0x00, 0x00, 0xAB, 0x00, 0x00, 0x00
	.byte 0xAB, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x2B, 0x01, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00
	.byte 0x49, 0x00, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00, 0x54, 0x00, 0x00, 0x00, 0x30, 0x01, 0x00, 0x00
	.byte 0x55, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x4F, 0x00, 0x00, 0x00
	.byte 0x2E, 0x01, 0x00, 0x00, 0x4D, 0x00, 0x00, 0x00, 0x4E, 0x00, 0x00, 0x00, 0x4D, 0x00, 0x00, 0x00
	.byte 0x71, 0x00, 0x00, 0x00, 0x3B, 0x01, 0x00, 0x00, 0x72, 0x00, 0x00, 0x00, 0x72, 0x00, 0x00, 0x00
	.byte 0x72, 0x00, 0x00, 0x00, 0x7B, 0x00, 0x00, 0x00, 0x43, 0x01, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00
	.byte 0x7C, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x79, 0x00, 0x00, 0x00, 0x42, 0x01, 0x00, 0x00
	.byte 0x7A, 0x00, 0x00, 0x00, 0x7A, 0x00, 0x00, 0x00, 0x7A, 0x00, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00
	.byte 0x4B, 0x01, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00
	.byte 0x62, 0x00, 0x00, 0x00, 0x35, 0x01, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x85, 0xFE, 0x21, 0x02, 0x79, 0xFF, 0x21, 0x02, 0x31, 0x00, 0x22, 0x02
	.byte 0xD1, 0x00, 0x22, 0x02, 0x8D, 0x00, 0x22, 0x02, 0x01, 0x08, 0x22, 0x02, 0x85, 0x08, 0x22, 0x02
	.byte 0x0D, 0x08, 0x22, 0x02, 0x19, 0x08, 0x22, 0x02, 0x25, 0x08, 0x22, 0x02, 0x31, 0x08, 0x22, 0x02
	.byte 0x3D, 0x08, 0x22, 0x02, 0x49, 0x08, 0x22, 0x02, 0x55, 0x08, 0x22, 0x02, 0x61, 0x08, 0x22, 0x02
	.byte 0x6D, 0x08, 0x22, 0x02, 0x79, 0x08, 0x22, 0x02, 0xB5, 0x15, 0x22, 0x02, 0x31, 0x02, 0x22, 0x02
	.byte 0x61, 0x01, 0x22, 0x02, 0xC9, 0x01, 0x22, 0x02, 0x15, 0x01, 0x22, 0x02, 0x75, 0xFF, 0x21, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xF0, 0xFF
	.byte 0xFF, 0x00, 0xF0, 0xFF, 0xFF, 0x00, 0xFF, 0x00, 0x20, 0x00, 0xFF, 0x00, 0x20, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x10, 0x00, 0xFF, 0x00, 0x04, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xF0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x10, 0x00, 0xFF, 0x00, 0x10, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x18, 0x00, 0xFF, 0x00, 0x18, 0x00, 0xFF, 0x00
	.byte 0xE0, 0xF6, 0xFF, 0xFF, 0xA0, 0x05, 0x00, 0x00, 0xE0, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0xE9, 0xFF, 0xFF, 0x00, 0xEF, 0xFF, 0xFF, 0x10, 0x25, 0x00, 0x00, 0x40, 0xF8, 0xFF, 0xFF
	.byte 0x10, 0xD2, 0xFF, 0xFF, 0xD0, 0x0C, 0x00, 0x00, 0xC8, 0x35, 0x00, 0x00, 0x48, 0xFA, 0xFF, 0xFF
	.byte 0x00, 0xEB, 0xFF, 0xFF, 0x08, 0xF5, 0xFF, 0xFF, 0x48, 0x1B, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00
	.byte 0x30, 0x0B, 0x00, 0x00, 0xA8, 0x0E, 0x00, 0x00, 0x80, 0xF4, 0xFF, 0xFF, 0xB0, 0x05, 0x00, 0x00
	.byte 0x18, 0x0B, 0x00, 0x00, 0xAA, 0xFC, 0xFF, 0xFF, 0x50, 0xF1, 0xFF, 0xFF, 0x18, 0xF6, 0xFF, 0xFF
	.byte 0xF0, 0x08, 0x00, 0x00, 0x68, 0x09, 0x00, 0x00, 0x10, 0xF3, 0xFF, 0xFF, 0x28, 0xF5, 0xFF, 0xFF
	.byte 0x00, 0xEE, 0xFF, 0xFF, 0x80, 0xEE, 0xFF, 0xFF, 0xC8, 0x1D, 0x00, 0x00, 0xC8, 0x08, 0x00, 0x00
	.byte 0xC0, 0xDC, 0xFF, 0xFF, 0x36, 0xF4, 0xFF, 0xFF, 0x00, 0x33, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00
	.byte 0x80, 0xF6, 0xFF, 0xFF, 0x40, 0xED, 0xFF, 0xFF, 0x40, 0x18, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00
	.byte 0xA0, 0x1B, 0x00, 0x00, 0xC0, 0xF1, 0xFF, 0xFF, 0xF4, 0xD4, 0xFF, 0xFF, 0x60, 0xF2, 0xFF, 0xFF
	.byte 0x80, 0x2A, 0x00, 0x00, 0xE8, 0x1D, 0x00, 0x00, 0x2C, 0xC5, 0xFF, 0xFF, 0xA8, 0xF3, 0xFF, 0xFF
	.byte 0x98, 0x3A, 0x00, 0x00, 0x48, 0x1C, 0x00, 0x00, 0xE0, 0xDF, 0xFF, 0xFF, 0x00, 0xEE, 0xFF, 0xFF
	.byte 0xE8, 0x20, 0x00, 0x00, 0xC0, 0x22, 0x00, 0x00, 0x98, 0x3A, 0x00, 0x00, 0x40, 0xF5, 0xFF, 0xFF
	.byte 0x68, 0x0C, 0x00, 0x00, 0xA8, 0x07, 0x00, 0x00, 0xD8, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xA0, 0x0C, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0x20, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x60, 0x17, 0x00, 0x00, 0xC0, 0x09, 0x00, 0x00, 0x40, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x0A, 0x00, 0x00, 0x80, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0xFC, 0xFF, 0xFF, 0x80, 0x01, 0x00, 0x00, 0x20, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x09, 0x00, 0x00, 0xA0, 0x05, 0x00, 0x00, 0xE0, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x60, 0x07, 0x00, 0x00, 0x40, 0x07, 0x00, 0x00, 0xE0, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x68, 0x09, 0x00, 0x00
	.byte 0xE0, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xF9, 0xFF, 0xFF, 0x58, 0xFC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x98, 0x07, 0x00, 0x00, 0x50, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x38, 0x02, 0x00, 0x00, 0xD0, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x98, 0x07, 0x00, 0x00
	.byte 0xA0, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x88, 0xF6, 0xFF, 0xFF, 0xD0, 0xFC, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0xF6, 0xFF, 0xFF, 0x00, 0xFC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x98, 0xFC, 0xFF, 0xFF, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x68, 0xFA, 0xFF, 0xFF, 0x78, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD8, 0x05, 0x00, 0x00, 0x08, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD8, 0x05, 0x00, 0x00
	.byte 0xB8, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0xF8, 0xFF, 0xFF, 0xC8, 0xFC, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x02, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xF8, 0xFF, 0xFF, 0xCC, 0xFB, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x05, 0x00, 0x00
	.byte 0xE0, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0xFB, 0xFF, 0xFF, 0xF0, 0xFC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF8, 0x07, 0x00, 0x00, 0xA0, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xA0, 0x03, 0x00, 0x00, 0x98, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x06, 0x00, 0x00
	.byte 0x10, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xE8, 0xF8, 0xFF, 0xFF, 0x68, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0xFA, 0xFF, 0xFF, 0x60, 0xFC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x58, 0xFD, 0xFF, 0xFF, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xFB, 0xFF, 0xFF, 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0xA0, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x04, 0x00, 0x00
	.byte 0x08, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x90, 0xF9, 0xFF, 0xFF, 0x20, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x18, 0x03, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0xFC, 0xFF, 0xFF, 0x60, 0xFC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C, 0x00, 0x00
	.byte 0xB8, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0xF2, 0xFF, 0xFF, 0x48, 0xF8, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE8, 0x0D, 0x00, 0x00, 0xC8, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x06, 0x00, 0x00, 0x40, 0xFA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x0C, 0x00, 0x00
	.byte 0x10, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x60, 0xF0, 0xFF, 0xFF, 0xF0, 0xFC, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0xF3, 0xFF, 0xFF, 0x30, 0xF7, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0xFB, 0xFF, 0xFF, 0x30, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0xFB, 0xFF, 0xFF, 0xD8, 0x04, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x48, 0x0C, 0x00, 0x00, 0x98, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x08, 0x00, 0x00
	.byte 0x20, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x50, 0xF4, 0xFF, 0xFF, 0x60, 0xFA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x60, 0x07, 0x00, 0x00
	.byte 0xB0, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xF5, 0xFF, 0xFF, 0x70, 0xF5, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x09, 0x00, 0x00
	.byte 0x34, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0xEF, 0xFF, 0xFF, 0x40, 0xEC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x58, 0x0F, 0x00, 0x00, 0x58, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC0, 0x02, 0x00, 0x00, 0x60, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x0A, 0x00, 0x00
	.byte 0x60, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC8, 0xEF, 0xFF, 0xFF, 0xE8, 0xF9, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE8, 0xF3, 0xFF, 0xFF, 0x48, 0xF8, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x4C, 0xFD, 0xFF, 0xFF, 0xE8, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE8, 0xFC, 0xFF, 0xFF, 0x68, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x0B, 0x00, 0x00, 0x50, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x08, 0x00, 0x00
	.byte 0x90, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xA8, 0xF4, 0xFF, 0xFF, 0x08, 0xFA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x68, 0x04, 0x00, 0x00
	.byte 0x68, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x88, 0xF8, 0xFF, 0xFF, 0xE8, 0xF7, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x0E, 0x00, 0x00
	.byte 0x40, 0x08, 0x00, 0x00, 0xF8, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7C, 0xEF, 0xFF, 0xFF, 0x58, 0xF5, 0xFF, 0xFF
	.byte 0xF8, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x62, 0x17, 0x00, 0x00, 0x30, 0x06, 0x00, 0x00, 0xF8, 0x0B, 0x00, 0x00
	.byte 0x10, 0x04, 0x00, 0x00, 0xA8, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x10, 0x00, 0x00
	.byte 0xE8, 0x09, 0x00, 0x00, 0xF8, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB0, 0xE6, 0xFF, 0xFF, 0x08, 0xF8, 0xFF, 0xFF, 0xF8, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xEE, 0xFF, 0xFF, 0x68, 0xF4, 0xFF, 0xFF
	.byte 0xF8, 0x0B, 0x00, 0x00, 0xC0, 0xFC, 0xFF, 0xFF, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0xF8, 0xFF, 0xFF, 0x78, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC2, 0x0F, 0x00, 0x00, 0x88, 0x0A, 0x00, 0x00, 0xF8, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x0C, 0x00, 0x00
	.byte 0xDC, 0x0B, 0x00, 0x00, 0xF8, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x68, 0xED, 0xFF, 0xFF, 0x90, 0xF5, 0xFF, 0xFF, 0xF8, 0x0B, 0x00, 0x00, 0xC0, 0x06, 0x00, 0x00
	.byte 0x70, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x70, 0xF2, 0xFF, 0xFF, 0xD8, 0xED, 0xFF, 0xFF
	.byte 0xF8, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x07, 0x00, 0x00
	.byte 0x48, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0xF8, 0xFF, 0xFF, 0x38, 0xFC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x07, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x03, 0x00, 0x00, 0x40, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x06, 0x00, 0x00
	.byte 0x40, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xD0, 0xF7, 0xFF, 0xFF, 0x18, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0xF7, 0xFF, 0xFF, 0x28, 0xFB, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0xFD, 0xFF, 0xFF, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0xFC, 0xFF, 0xFF, 0xA8, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD0, 0x06, 0x00, 0x00, 0x68, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD8, 0x05, 0x00, 0x00
	.byte 0xD8, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x44, 0xF8, 0xFF, 0xFF, 0x38, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x78, 0x02, 0x00, 0x00
	.byte 0x38, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x70, 0xF9, 0xFF, 0xFF, 0x88, 0xF9, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00
	.byte 0xC0, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xF8, 0xFF, 0xFF, 0xB8, 0xF9, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0x40, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xA0, 0x02, 0x00, 0x00, 0xD0, 0xFA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x78, 0xF7, 0xFF, 0xFF, 0x00, 0xFA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xF7, 0xFF, 0xFF, 0xA8, 0xF8, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0xB0, 0xFD, 0xFF, 0xFF, 0xE8, 0xFC, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xFA, 0xFF, 0xFF, 0x80, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0xF8, 0x05, 0x00, 0x00, 0x40, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x05, 0x00, 0x00
	.byte 0x28, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0xFA, 0xFF, 0xFF, 0xE8, 0xF9, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x58, 0x03, 0x00, 0x00
	.byte 0x90, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x98, 0xFA, 0xFF, 0xFF, 0x10, 0xF8, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xF2, 0xFF, 0xFF, 0x10, 0xF9, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x13, 0x00, 0x00, 0xF0, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x50, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x0E, 0x00, 0x00
	.byte 0xB0, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x58, 0xEA, 0xFF, 0xFF, 0xC8, 0xF9, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0xF1, 0xFF, 0xFF, 0x48, 0xF7, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x58, 0xF9, 0xFF, 0xFF, 0x08, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0xF8, 0xFF, 0xFF, 0xC0, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0xF8, 0x0F, 0x00, 0x00, 0x30, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x54, 0x0A, 0x00, 0x00
	.byte 0x70, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x38, 0xF1, 0xFF, 0xFF, 0x70, 0xF8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x06, 0x00, 0x00
	.byte 0xF0, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x58, 0xF3, 0xFF, 0xFF, 0x48, 0xF5, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB1, 0x17, 0x22, 0x02, 0xB5, 0x17, 0x22, 0x02, 0x99, 0x18, 0x22, 0x02, 0x9D, 0x18, 0x22, 0x02
	.byte 0xA1, 0x18, 0x22, 0x02, 0x69, 0x19, 0x22, 0x02, 0xED, 0x19, 0x22, 0x02, 0x6D, 0x1A, 0x22, 0x02
	.byte 0xD5, 0x1A, 0x22, 0x02, 0xD9, 0x1A, 0x22, 0x02, 0xDD, 0x1A, 0x22, 0x02, 0xE1, 0x1A, 0x22, 0x02
	.byte 0xE5, 0x1A, 0x22, 0x02, 0xF1, 0x1B, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0xFE, 0xFE, 0x00, 0x00, 0x00, 0xC2, 0x40, 0x17, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x90, 0xE8, 0x00, 0x00, 0x00, 0xC2, 0x40, 0x17, 0x00, 0x10, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x20
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x20, 0x24, 0xA0, 0x0E
	.byte 0x00, 0x00, 0x00, 0x00, 0xED, 0x1C, 0x22, 0x02, 0x11, 0x1D, 0x22, 0x02, 0x4D, 0x1D, 0x22, 0x02
	.byte 0x89, 0x1D, 0x22, 0x02, 0xC5, 0x1D, 0x22, 0x02, 0x25, 0x1E, 0x22, 0x02, 0x61, 0x1E, 0x22, 0x02
	.byte 0x9D, 0x1E, 0x22, 0x02, 0xC5, 0x1E, 0x22, 0x02, 0x40, 0x00, 0x70, 0x00, 0xC0, 0x00, 0x30, 0x00
	.byte 0xD8, 0x00, 0x70, 0x00, 0x50, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x70, 0x00, 0xC0, 0x00, 0x30, 0x00, 0x28, 0x00, 0x70, 0x00, 0xD8, 0x00, 0x32, 0x00
	.byte 0x50, 0x00, 0x78, 0x00, 0xB0, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x00, 0xBD, 0x31, 0x22, 0x02
	.byte 0xF9, 0x74, 0x22, 0x02, 0xC1, 0xC4, 0x22, 0x02, 0xFD, 0x9B, 0x22, 0x02, 0xBD, 0xD3, 0x22, 0x02
	.byte 0xE1, 0xD6, 0x22, 0x02, 0x75, 0xD9, 0x22, 0x02, 0x21, 0xDD, 0x22, 0x02, 0x21, 0xE0, 0x22, 0x02
	.byte 0xED, 0xE2, 0x22, 0x02, 0x09, 0x3E, 0x22, 0x02, 0x49, 0xEA, 0x22, 0x02, 0xB1, 0xF0, 0x22, 0x02
	.byte 0x79, 0xF3, 0x22, 0x02, 0x25, 0xFB, 0x22, 0x02, 0x05, 0xFE, 0x22, 0x02, 0x95, 0x00, 0x23, 0x02
	.byte 0xE5, 0x92, 0x22, 0x02, 0xD9, 0x06, 0x23, 0x02, 0x51, 0x9E, 0x22, 0x02, 0xF1, 0xA1, 0x22, 0x02
	.byte 0x8D, 0xA5, 0x22, 0x02, 0x89, 0xA9, 0x22, 0x02, 0xAD, 0xAC, 0x22, 0x02, 0x21, 0xB3, 0x22, 0x02
	.byte 0x39, 0x68, 0x22, 0x02, 0xD9, 0x69, 0x22, 0x02, 0x9D, 0x6A, 0x22, 0x02, 0x4D, 0x6C, 0x22, 0x02
	.byte 0x75, 0x0D, 0x23, 0x02, 0xE1, 0x10, 0x23, 0x02, 0x99, 0x0F, 0x23, 0x02, 0x69, 0x14, 0x23, 0x02
	.byte 0x61, 0x30, 0x22, 0x02, 0x8D, 0x30, 0x22, 0x02, 0xDD, 0x30, 0x22, 0x02, 0x29, 0x31, 0x22, 0x02
	.byte 0x95, 0x3A, 0x22, 0x02, 0x25, 0x78, 0x22, 0x02, 0xED, 0x7A, 0x22, 0x02, 0x1D, 0x7D, 0x22, 0x02
	.byte 0x01, 0xBE, 0x22, 0x02, 0x75, 0xC0, 0x22, 0x02, 0xC1, 0x3B, 0x22, 0x02, 0x81, 0xC7, 0x22, 0x02
	.byte 0x8D, 0xCA, 0x22, 0x02, 0x71, 0x80, 0x22, 0x02, 0x75, 0x81, 0x22, 0x02, 0x85, 0x83, 0x22, 0x02
	.byte 0xD9, 0x84, 0x22, 0x02, 0x11, 0xCE, 0x22, 0x02, 0xC1, 0xCE, 0x22, 0x02, 0x39, 0x86, 0x22, 0x02
	.byte 0x49, 0xD1, 0x22, 0x02, 0x51, 0x87, 0x22, 0x02, 0x51, 0x8A, 0x22, 0x02, 0x15, 0xDB, 0x22, 0x02
	.byte 0x8D, 0x8C, 0x22, 0x02, 0x4D, 0xE5, 0x22, 0x02, 0x65, 0x8D, 0x22, 0x02, 0x89, 0x8F, 0x22, 0x02
	.byte 0xBD, 0x90, 0x22, 0x02, 0x6D, 0xEB, 0x22, 0x02, 0x7D, 0xED, 0x22, 0x02, 0xF5, 0xE6, 0x22, 0x02
	.byte 0x49, 0xF8, 0x22, 0x02, 0xB5, 0x3E, 0x22, 0x02, 0x09, 0x40, 0x22, 0x02, 0x49, 0x43, 0x22, 0x02
	.byte 0x51, 0x33, 0x22, 0x02, 0xA5, 0x03, 0x23, 0x02, 0xF5, 0x47, 0x22, 0x02, 0x21, 0x92, 0x22, 0x02
	.byte 0xA1, 0x48, 0x22, 0x02, 0x01, 0x06, 0x23, 0x02, 0xBD, 0x45, 0x22, 0x02, 0xE5, 0x08, 0x23, 0x02
	.byte 0x51, 0x35, 0x22, 0x02, 0x65, 0x38, 0x22, 0x02, 0x95, 0x09, 0x23, 0x02, 0xA1, 0x0B, 0x23, 0x02
	.byte 0x1D, 0x0D, 0x23, 0x02, 0x31, 0x96, 0x22, 0x02, 0x49, 0x49, 0x22, 0x02, 0x21, 0x4A, 0x22, 0x02
	.byte 0xAD, 0x4B, 0x22, 0x02, 0x59, 0x4E, 0x22, 0x02, 0x99, 0x50, 0x22, 0x02, 0x39, 0xA8, 0x22, 0x02
	.byte 0xCD, 0x51, 0x22, 0x02, 0xF9, 0x52, 0x22, 0x02, 0xA1, 0xAE, 0x22, 0x02, 0x31, 0xB1, 0x22, 0x02
	.byte 0x8D, 0x54, 0x22, 0x02, 0x4D, 0x55, 0x22, 0x02, 0x69, 0x57, 0x22, 0x02, 0x39, 0x58, 0x22, 0x02
	.byte 0x91, 0x59, 0x22, 0x02, 0xB5, 0x61, 0x22, 0x02, 0xE1, 0x64, 0x22, 0x02, 0xC5, 0x5C, 0x22, 0x02
	.byte 0x9D, 0x5E, 0x22, 0x02, 0x95, 0x5F, 0x22, 0x02, 0x41, 0xB6, 0x22, 0x02, 0x89, 0xB9, 0x22, 0x02
	.byte 0x99, 0x66, 0x22, 0x02, 0xE9, 0x62, 0x22, 0x02, 0x91, 0x6C, 0x22, 0x02, 0x81, 0x6F, 0x22, 0x02
	.byte 0xD1, 0x72, 0x22, 0x02, 0x41, 0x56, 0x22, 0x02, 0xDD, 0x71, 0x22, 0x02, 0x7D, 0xBC, 0x22, 0x02
	.byte 0x75, 0x18, 0x23, 0x02, 0xA1, 0x18, 0x23, 0x02, 0xCD, 0x18, 0x23, 0x02, 0xF9, 0x18, 0x23, 0x02
	.byte 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFD, 0xFF, 0xFD, 0xFF, 0xFD, 0xFF, 0xFC, 0xFF, 0xFC, 0xFF
	.byte 0xFC, 0xFF, 0xFB, 0xFF, 0xFB, 0xFF, 0xFB, 0xFF, 0xFB, 0xFF, 0xFB, 0xFF, 0xFB, 0xFF, 0xFB, 0xFF
	.byte 0xFB, 0xFF, 0xFC, 0xFF, 0xFC, 0xFF, 0xFC, 0xFF, 0xFD, 0xFF, 0xFD, 0xFF, 0xFD, 0xFF, 0x00, 0x00
	.byte 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x05, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x02, 0x07, 0x0D, 0x12, 0x64, 0x73, 0x06, 0x73
	.byte 0x64, 0x06, 0x08, 0x02, 0x0D, 0x01, 0x12, 0x03, 0x00, 0x10, 0x05, 0x10, 0x00, 0x05, 0x00, 0x00
	.byte 0x05, 0x01, 0xFF, 0xFF, 0x01, 0x01, 0xFF, 0x01, 0xFF, 0x01, 0xFF, 0x64, 0x0A, 0x64, 0xB4, 0x0A
	.byte 0x0A, 0x0A, 0xB4, 0x00, 0x05, 0x64, 0x78, 0x64, 0x50, 0x05, 0x78, 0x64, 0x50, 0x78, 0x05, 0x64
	.byte 0x64, 0x78, 0x64, 0x05, 0x64, 0x64, 0x64, 0x46, 0x08, 0x64, 0x64, 0x46, 0x78, 0x03, 0x64, 0x64
	.byte 0x78, 0x64, 0x03, 0x64, 0x96, 0x64, 0x32, 0x08, 0x96, 0x32, 0x32, 0x96, 0x08, 0x32, 0x64, 0x96
	.byte 0x64, 0x08, 0x0C, 0x00, 0x0A, 0x00, 0x08, 0x00, 0x06, 0x00, 0x04, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x07, 0x00, 0x00, 0x00, 0x20, 0x00, 0x0A, 0x00, 0x20, 0x00
	.byte 0x00, 0x00, 0x07, 0x00, 0x20, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x38, 0x0E, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x1C, 0x07, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x8E, 0x03, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x05, 0x05, 0x03, 0x14, 0x02, 0x0D, 0x01, 0x12, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0xAA, 0x00, 0x80, 0x00
	.byte 0xAA, 0x00, 0x00, 0x01, 0xAA, 0x00, 0x50, 0x00, 0x32, 0x00, 0xB4, 0x00, 0x32, 0x00, 0x50, 0x00
	.byte 0x64, 0x00, 0xB4, 0x00, 0x64, 0x00, 0x50, 0x00, 0x4B, 0x00, 0xB4, 0x00, 0x4B, 0x00, 0x78, 0x00
	.byte 0x50, 0x00, 0x88, 0x00, 0x50, 0x00, 0x78, 0x00, 0x50, 0x00, 0x88, 0x00, 0x50, 0x00, 0x78, 0x00
	.byte 0x50, 0x00, 0x88, 0x00, 0x50, 0x00, 0x58, 0x00, 0x50, 0x00, 0xA8, 0x00, 0x50, 0x00, 0x1E, 0x00
	.byte 0x28, 0x00, 0x32, 0x00, 0x35, 0x00, 0x1E, 0x00, 0x5D, 0x00, 0x32, 0x00, 0x35, 0x00, 0x1E, 0x00
	.byte 0x92, 0x00, 0x32, 0x00, 0x35, 0x00, 0x50, 0x00, 0x28, 0x00, 0x32, 0x00, 0x35, 0x00, 0x50, 0x00
	.byte 0x5D, 0x00, 0x32, 0x00, 0x35, 0x00, 0x50, 0x00, 0x92, 0x00, 0x32, 0x00, 0x35, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x26, 0x01, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x23, 0x01, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x24, 0x01, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00
	.byte 0x25, 0x01, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00
	.byte 0x00, 0x4D, 0x00, 0x00, 0x00, 0xF0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x70, 0x00, 0xC0, 0x00, 0x30, 0x00, 0x28, 0x00, 0x70, 0x00
	.byte 0xD8, 0x00, 0x32, 0x00, 0x50, 0x00, 0x78, 0x00, 0xB0, 0x00, 0x2A, 0x00, 0x70, 0xDA, 0xFF, 0xFF
	.byte 0xA8, 0xEA, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x00, 0xD8, 0xFF, 0xFF, 0x00, 0xE7, 0xFF, 0xFF
	.byte 0x40, 0x00, 0x00, 0x00, 0x80, 0xF0, 0xFF, 0xFF, 0x00, 0xF3, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00
	.byte 0x58, 0xE6, 0xFF, 0xFF, 0x60, 0xF0, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x80, 0xF0, 0xFF, 0xFF
	.byte 0x00, 0xF3, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0xC0, 0xE5, 0xFF, 0xFF, 0x60, 0xE9, 0xFF, 0xFF
	.byte 0x40, 0x00, 0x00, 0x00, 0x48, 0xDE, 0xFF, 0xFF, 0xE8, 0xE4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x48, 0xDE, 0xFF, 0xFF, 0xE8, 0xE4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCF, 0xFF, 0xFF
	.byte 0x00, 0xF1, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCF, 0xFF, 0xFF, 0x00, 0xF1, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x60, 0xDA, 0xFF, 0xFF, 0x20, 0xE9, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x60, 0xDA, 0xFF, 0xFF, 0x20, 0xE9, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xD0, 0xEF, 0xFF, 0xFF
	.byte 0xB0, 0xEB, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xD0, 0xEF, 0xFF, 0xFF, 0xB0, 0xEB, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0xCF, 0xFF, 0xFF, 0x40, 0xEF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0xCF, 0xFF, 0xFF, 0x40, 0xEF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF9, 0xFF, 0xFF
	.byte 0x80, 0xEF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF9, 0xFF, 0xFF, 0x80, 0xEF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0xDF, 0xFF, 0xFF, 0xC0, 0xEF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0xDF, 0xFF, 0xFF, 0xC0, 0xEF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x78, 0x23, 0x00, 0x00
	.byte 0xA0, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x78, 0x23, 0x00, 0x00, 0xA0, 0x15, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x98, 0xE7, 0xFF, 0xFF, 0x80, 0xF4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x98, 0xE7, 0xFF, 0xFF, 0x80, 0xF4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x30, 0x2B, 0x00, 0x00
	.byte 0x30, 0x11, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0x00, 0x28, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00
	.byte 0x80, 0xEB, 0xFF, 0xFF, 0x80, 0x24, 0x00, 0x00, 0x80, 0x08, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF
	.byte 0x60, 0x22, 0x00, 0x00, 0x40, 0x19, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0x80, 0x24, 0x00, 0x00
	.byte 0x80, 0x08, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0xC0, 0x38, 0x00, 0x00, 0x60, 0x1F, 0x00, 0x00
	.byte 0x80, 0xEB, 0xFF, 0xFF, 0x68, 0x32, 0x00, 0x00, 0xF4, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x68, 0x32, 0x00, 0x00, 0xF4, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x15, 0x00, 0x00
	.byte 0x18, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x15, 0x00, 0x00, 0x18, 0x1A, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x58, 0x33, 0x00, 0x00, 0x08, 0x2C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x58, 0x33, 0x00, 0x00, 0x08, 0x2C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x40, 0x00, 0x00
	.byte 0x30, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x40, 0x00, 0x00, 0x30, 0x14, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x33, 0x00, 0x00, 0xC0, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x33, 0x00, 0x00, 0xC0, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00
	.byte 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x2A, 0x00, 0x00, 0x80, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x2A, 0x00, 0x00, 0x80, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE8, 0xE4, 0xFF, 0xFF
	.byte 0x20, 0xED, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xE8, 0xE4, 0xFF, 0xFF, 0x20, 0xED, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x58, 0x20, 0x00, 0x00, 0x38, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x58, 0x20, 0x00, 0x00, 0x38, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA8, 0xC5, 0xFF, 0xFF
	.byte 0x58, 0xEC, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x00, 0xC4, 0xFF, 0xFF, 0x80, 0xE7, 0xFF, 0xFF
	.byte 0x40, 0x00, 0x00, 0x00, 0x80, 0xD9, 0xFF, 0xFF, 0x80, 0xF3, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00
	.byte 0x78, 0xD3, 0xFF, 0xFF, 0x80, 0xF4, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x80, 0xD9, 0xFF, 0xFF
	.byte 0x80, 0xF3, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x80, 0xD9, 0xFF, 0xFF, 0x80, 0xF3, 0xFF, 0xFF
	.byte 0x40, 0x00, 0x00, 0x00, 0x10, 0xDB, 0xFF, 0xFF, 0xE0, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0xDB, 0xFF, 0xFF, 0xE0, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x40, 0xBA, 0xFF, 0xFF
	.byte 0xD8, 0xF1, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x40, 0xBA, 0xFF, 0xFF, 0xD8, 0xF1, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0xD0, 0xCE, 0xFF, 0xFF, 0x60, 0xF4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xD0, 0xCE, 0xFF, 0xFF, 0x60, 0xF4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x22, 0xE7, 0xFF, 0xFF
	.byte 0x40, 0xF1, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x22, 0xE7, 0xFF, 0xFF, 0x40, 0xF1, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0xC5, 0xFF, 0xFF, 0x80, 0xF7, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xC0, 0xC5, 0xFF, 0xFF, 0x80, 0xF7, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x40, 0xE8, 0xFF, 0xFF
	.byte 0x80, 0xEA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x40, 0xE8, 0xFF, 0xFF, 0x80, 0xEA, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xD1, 0xFF, 0xFF, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xD1, 0xFF, 0xFF, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x48, 0x2A, 0x00, 0x00
	.byte 0x40, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x2A, 0x00, 0x00, 0x40, 0x1D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0xD9, 0xFF, 0xFF, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0xD9, 0xFF, 0xFF, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x1C, 0x00, 0x00
	.byte 0x48, 0x17, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0x00, 0x35, 0x00, 0x00, 0x80, 0x0B, 0x00, 0x00
	.byte 0x80, 0xEB, 0xFF, 0xFF, 0x00, 0x35, 0x00, 0x00, 0x80, 0x0B, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF
	.byte 0x70, 0x31, 0x00, 0x00, 0x68, 0x16, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0x00, 0x35, 0x00, 0x00
	.byte 0x80, 0x0B, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0x00, 0x35, 0x00, 0x00, 0x80, 0x0B, 0x00, 0x00
	.byte 0x80, 0xEB, 0xFF, 0xFF, 0x40, 0x46, 0x00, 0x00, 0xC0, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x46, 0x00, 0x00, 0xC0, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0x1F, 0x00, 0x00
	.byte 0x78, 0x17, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0x1F, 0x00, 0x00, 0x78, 0x17, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x33, 0x00, 0x00, 0x40, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x33, 0x00, 0x00, 0x40, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00
	.byte 0x40, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x40, 0x14, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0xC0, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x3F, 0x00, 0x00, 0xC0, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x50, 0x00, 0x00
	.byte 0x98, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x50, 0x00, 0x00, 0x98, 0x0D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x34, 0x00, 0x00, 0x20, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x34, 0x00, 0x00, 0x20, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xDA, 0xFF, 0xFF
	.byte 0xD0, 0xF3, 0xFF, 0xFF, 0xA8, 0x0A, 0x00, 0x00, 0xC0, 0xDA, 0xFF, 0xFF, 0xD0, 0xF3, 0xFF, 0xFF
	.byte 0xA8, 0x0A, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x35, 0x00, 0x00, 0x80, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0xEB, 0xFF, 0xFF
	.byte 0x58, 0xE6, 0xFF, 0xFF, 0x00, 0xFC, 0xFF, 0xFF, 0x80, 0xE2, 0xFF, 0xFF, 0x00, 0xE5, 0xFF, 0xFF
	.byte 0x00, 0xFC, 0xFF, 0xFF, 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0xEA, 0xFF, 0xFF, 0x00, 0xFC, 0xFF, 0xFF
	.byte 0x58, 0xF4, 0xFF, 0xFF, 0x68, 0xEB, 0xFF, 0xFF, 0x00, 0xFC, 0xFF, 0xFF, 0xFC, 0xF6, 0xFF, 0xFF
	.byte 0x00, 0xEA, 0xFF, 0xFF, 0x00, 0xFC, 0xFF, 0xFF, 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0xEA, 0xFF, 0xFF
	.byte 0x00, 0xFC, 0xFF, 0xFF, 0x50, 0xF6, 0xFF, 0xFF, 0x40, 0xEA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x50, 0xF6, 0xFF, 0xFF, 0x40, 0xEA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xDF, 0xFF, 0xFF
	.byte 0x58, 0xED, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xDF, 0xFF, 0xFF, 0x58, 0xED, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0xEA, 0xFF, 0xFF, 0xB0, 0xE6, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0xEA, 0xFF, 0xFF, 0xB0, 0xE6, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x88, 0xFD, 0xFF, 0xFF
	.byte 0xC8, 0xEB, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x88, 0xFD, 0xFF, 0xFF, 0xC8, 0xEB, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xDF, 0xFF, 0xFF, 0x40, 0xDF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xDF, 0xFF, 0xFF, 0x40, 0xDF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x80, 0xE6, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x80, 0xE6, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0xE5, 0xFF, 0xFF, 0x00, 0xE8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0xE5, 0xFF, 0xFF, 0x00, 0xE8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x20, 0x14, 0x00, 0x00
	.byte 0x40, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x14, 0x00, 0x00, 0x40, 0x1D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0xEA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0xEA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x50, 0x3B, 0x00, 0x00
	.byte 0x48, 0x11, 0x00, 0x00, 0x50, 0xE3, 0xFF, 0xFF, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x50, 0xE3, 0xFF, 0xFF, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x50, 0xE3, 0xFF, 0xFF
	.byte 0xF8, 0x1A, 0x00, 0x00, 0x48, 0x20, 0x00, 0x00, 0x50, 0xE3, 0xFF, 0xFF, 0x00, 0x1B, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x50, 0xE3, 0xFF, 0xFF, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x50, 0xE3, 0xFF, 0xFF, 0x10, 0x32, 0x00, 0x00, 0xE0, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x32, 0x00, 0x00, 0xE0, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD8, 0x07, 0x00, 0x00
	.byte 0x58, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD8, 0x07, 0x00, 0x00, 0x58, 0x12, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x58, 0x1F, 0x00, 0x00, 0xA8, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x58, 0x1F, 0x00, 0x00, 0xA8, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x2E, 0x00, 0x00
	.byte 0x08, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x2E, 0x00, 0x00, 0x08, 0x18, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x27, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x36, 0x00, 0x00
	.byte 0x98, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x36, 0x00, 0x00, 0x98, 0x0D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x18, 0x00, 0x00, 0x40, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x18, 0x00, 0x00, 0x40, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xEA, 0xFF, 0xFF
	.byte 0x90, 0xE8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xEA, 0xFF, 0xFF, 0x90, 0xE8, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x1B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x1C, 0x00, 0x00
	.byte 0x58, 0xEC, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xE7, 0xFF, 0xFF
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00
	.byte 0x70, 0x31, 0x00, 0x00, 0x80, 0xF4, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00
	.byte 0x80, 0xF3, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x90, 0x1D, 0x00, 0x00
	.byte 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x90, 0x1D, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00
	.byte 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00
	.byte 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xDA, 0xFF, 0xFF
	.byte 0x40, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xDA, 0xFF, 0xFF, 0x40, 0x1D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x35, 0x00, 0x00, 0x80, 0xF4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0C, 0xEB, 0xFF, 0xFF
	.byte 0x48, 0x11, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0x80, 0xE2, 0xFF, 0xFF, 0x00, 0x10, 0x00, 0x00
	.byte 0x80, 0xEB, 0xFF, 0xFF, 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0x10, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF
	.byte 0x58, 0xF4, 0xFF, 0xFF, 0x48, 0x20, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0xFC, 0xF6, 0xFF, 0xFF
	.byte 0x00, 0x10, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0x10, 0x00, 0x00
	.byte 0x80, 0xEB, 0xFF, 0xFF, 0x50, 0xF6, 0xFF, 0xFF, 0xE0, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x50, 0xF6, 0xFF, 0xFF, 0xE0, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xDF, 0xFF, 0xFF
	.byte 0x58, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xDF, 0xFF, 0xFF, 0x58, 0x12, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0xEA, 0xFF, 0xFF, 0xA8, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0xEA, 0xFF, 0xFF, 0xA8, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0xFD, 0xFF, 0xFF
	.byte 0x08, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0xFD, 0xFF, 0xFF, 0x08, 0x18, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xDF, 0xFF, 0xFF, 0x00, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xDF, 0xFF, 0xFF, 0x00, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x98, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x98, 0x0D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0xE5, 0xFF, 0xFF, 0x40, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0xE5, 0xFF, 0xFF, 0x40, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x14, 0x00, 0x00
	.byte 0x90, 0xE8, 0xFF, 0xFF, 0xA8, 0x0A, 0x00, 0x00, 0x20, 0x14, 0x00, 0x00, 0xE0, 0xEA, 0xFF, 0xFF
	.byte 0xA8, 0x0A, 0x00, 0x00, 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x58, 0xF4, 0xFF, 0xFF, 0x48, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0xB5, 0x35, 0x23, 0x02, 0x75, 0x38, 0x23, 0x02, 0x99, 0x3C, 0x23, 0x02, 0xA1, 0x35, 0x23, 0x02
	.byte 0x25, 0x3D, 0x23, 0x02, 0x05, 0x3B, 0x23, 0x02, 0x19, 0x2E, 0x23, 0x02, 0x41, 0x2E, 0x23, 0x02
	.byte 0x69, 0x2E, 0x23, 0x02, 0x91, 0x2E, 0x23, 0x02, 0xB9, 0x2E, 0x23, 0x02, 0xE1, 0x2E, 0x23, 0x02
	.byte 0x09, 0x2F, 0x23, 0x02, 0x31, 0x2F, 0x23, 0x02, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xE6, 0x05, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0xE6, 0x05, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0xE7, 0x05, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0xE8, 0x05, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0xE9, 0x05, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFE, 0xFF
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x81, 0x2F, 0x23, 0x02
	.byte 0x85, 0x2F, 0x23, 0x02, 0x9D, 0x2F, 0x23, 0x02, 0xA9, 0x2F, 0x23, 0x02, 0x89, 0x30, 0x23, 0x02
	.byte 0x8D, 0x30, 0x23, 0x02, 0xE1, 0x30, 0x23, 0x02, 0xE5, 0x30, 0x23, 0x02, 0xF1, 0x30, 0x23, 0x02
	.byte 0xFD, 0x30, 0x23, 0x02, 0xA5, 0x31, 0x23, 0x02, 0xB1, 0x31, 0x23, 0x02, 0x25, 0x32, 0x23, 0x02
	.byte 0x29, 0x32, 0x23, 0x02, 0xC5, 0x32, 0x23, 0x02, 0xC9, 0x32, 0x23, 0x02, 0xE9, 0x32, 0x23, 0x02
	.byte 0xF5, 0x32, 0x23, 0x02, 0x8D, 0x33, 0x23, 0x02, 0x91, 0x33, 0x23, 0x02, 0x9D, 0x33, 0x23, 0x02
	.byte 0xA9, 0x33, 0x23, 0x02, 0x99, 0x34, 0x23, 0x02, 0x9D, 0x34, 0x23, 0x02, 0x01, 0x35, 0x23, 0x02
	.byte 0x0D, 0x35, 0x23, 0x02, 0x91, 0x35, 0x23, 0x02, 0x9D, 0x35, 0x23, 0x02, 0x00, 0x00, 0xF9, 0xFF
	.byte 0x01, 0x00, 0x01, 0x00, 0xFB, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xFD, 0xFF, 0x00, 0x00, 0x01, 0x00
	.byte 0xFE, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFB, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0xFD, 0xFF, 0x00, 0x00, 0x01, 0x00, 0xFE, 0xFF, 0x00, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0xFE, 0xFF, 0x00, 0x00, 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x22, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x26, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x2A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x2E, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x05, 0x01, 0x00, 0x00
	.byte 0x53, 0x00, 0x00, 0x00, 0x04, 0x01, 0x00, 0x00, 0x03, 0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00
	.byte 0x54, 0x00, 0x00, 0x00, 0x07, 0x01, 0x00, 0x00, 0x06, 0x01, 0x00, 0x00, 0x0B, 0x01, 0x00, 0x00
	.byte 0x55, 0x00, 0x00, 0x00, 0x0A, 0x01, 0x00, 0x00, 0x09, 0x01, 0x00, 0x00, 0x0E, 0x01, 0x00, 0x00
	.byte 0x56, 0x00, 0x00, 0x00, 0x0D, 0x01, 0x00, 0x00, 0x0C, 0x01, 0x00, 0x00, 0x11, 0x01, 0x00, 0x00
	.byte 0x57, 0x00, 0x00, 0x00, 0x10, 0x01, 0x00, 0x00, 0x0F, 0x01, 0x00, 0x00, 0x14, 0x01, 0x00, 0x00
	.byte 0x58, 0x00, 0x00, 0x00, 0x13, 0x01, 0x00, 0x00, 0x12, 0x01, 0x00, 0x00, 0x17, 0x01, 0x00, 0x00
	.byte 0x59, 0x00, 0x00, 0x00, 0x16, 0x01, 0x00, 0x00, 0x15, 0x01, 0x00, 0x00, 0x1A, 0x01, 0x00, 0x00
	.byte 0x5A, 0x00, 0x00, 0x00, 0x19, 0x01, 0x00, 0x00, 0x18, 0x01, 0x00, 0x00, 0x1D, 0x01, 0x00, 0x00
	.byte 0x5B, 0x00, 0x00, 0x00, 0x1C, 0x01, 0x00, 0x00, 0x1B, 0x01, 0x00, 0x00, 0x20, 0x01, 0x00, 0x00
	.byte 0x5C, 0x00, 0x00, 0x00, 0x1F, 0x01, 0x00, 0x00, 0x1E, 0x01, 0x00, 0x00, 0x23, 0x01, 0x00, 0x00
	.byte 0x5D, 0x00, 0x00, 0x00, 0x22, 0x01, 0x00, 0x00, 0x21, 0x01, 0x00, 0x00, 0x26, 0x01, 0x00, 0x00
	.byte 0x5E, 0x00, 0x00, 0x00, 0x25, 0x01, 0x00, 0x00, 0x24, 0x01, 0x00, 0x00, 0x29, 0x01, 0x00, 0x00
	.byte 0x5F, 0x00, 0x00, 0x00, 0x28, 0x01, 0x00, 0x00, 0x27, 0x01, 0x00, 0x00, 0x2C, 0x01, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x2B, 0x01, 0x00, 0x00, 0x2A, 0x01, 0x00, 0x00, 0x2F, 0x01, 0x00, 0x00
	.byte 0x61, 0x00, 0x00, 0x00, 0x2E, 0x01, 0x00, 0x00, 0x2D, 0x01, 0x00, 0x00, 0x32, 0x01, 0x00, 0x00
	.byte 0x62, 0x00, 0x00, 0x00, 0x31, 0x01, 0x00, 0x00, 0x30, 0x01, 0x00, 0x00, 0x35, 0x01, 0x00, 0x00
	.byte 0x63, 0x00, 0x00, 0x00, 0x34, 0x01, 0x00, 0x00, 0x33, 0x01, 0x00, 0x00, 0x38, 0x01, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x37, 0x01, 0x00, 0x00, 0x36, 0x01, 0x00, 0x00, 0x3B, 0x01, 0x00, 0x00
	.byte 0x65, 0x00, 0x00, 0x00, 0x3A, 0x01, 0x00, 0x00, 0x39, 0x01, 0x00, 0x00, 0x3E, 0x01, 0x00, 0x00
	.byte 0x66, 0x00, 0x00, 0x00, 0x3D, 0x01, 0x00, 0x00, 0x3C, 0x01, 0x00, 0x00, 0x41, 0x01, 0x00, 0x00
	.byte 0x67, 0x00, 0x00, 0x00, 0x40, 0x01, 0x00, 0x00, 0x3F, 0x01, 0x00, 0x00, 0x44, 0x01, 0x00, 0x00
	.byte 0x68, 0x00, 0x00, 0x00, 0x43, 0x01, 0x00, 0x00, 0x42, 0x01, 0x00, 0x00, 0x47, 0x01, 0x00, 0x00
	.byte 0x69, 0x00, 0x00, 0x00, 0x46, 0x01, 0x00, 0x00, 0x45, 0x01, 0x00, 0x00, 0x4A, 0x01, 0x00, 0x00
	.byte 0x6A, 0x00, 0x00, 0x00, 0x49, 0x01, 0x00, 0x00, 0x48, 0x01, 0x00, 0x00, 0x4D, 0x01, 0x00, 0x00
	.byte 0x6B, 0x00, 0x00, 0x00, 0x4C, 0x01, 0x00, 0x00, 0x4B, 0x01, 0x00, 0x00, 0x50, 0x01, 0x00, 0x00
	.byte 0x6C, 0x00, 0x00, 0x00, 0x4F, 0x01, 0x00, 0x00, 0x4E, 0x01, 0x00, 0x00, 0x53, 0x01, 0x00, 0x00
	.byte 0x6D, 0x00, 0x00, 0x00, 0x52, 0x01, 0x00, 0x00, 0x51, 0x01, 0x00, 0x00, 0x53, 0x01, 0x00, 0x00
	.byte 0x6D, 0x00, 0x00, 0x00, 0x52, 0x01, 0x00, 0x00, 0x51, 0x01, 0x00, 0x00, 0x00, 0x08, 0x0E, 0x14
	.byte 0x14, 0x10, 0x10, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x40, 0x00, 0x20, 0x00
	.byte 0xC0, 0x00, 0xE0, 0x00, 0x28, 0x00, 0x20, 0x00, 0xD8, 0x00, 0xE0, 0x00, 0x50, 0x00, 0x20, 0x00
	.byte 0xB0, 0x00, 0xE0, 0x00, 0x50, 0x01, 0x70, 0x00, 0x00, 0xFE, 0xB0, 0xFF, 0x32, 0x00, 0x80, 0xFD
	.byte 0x3C, 0x01, 0x70, 0x00, 0x00, 0xFE, 0xC4, 0xFF, 0x32, 0x00, 0x9C, 0xFF, 0x64, 0x01, 0x78, 0x00
	.byte 0x00, 0x00, 0x9C, 0xFF, 0x2A, 0x00, 0x80, 0xFD, 0xB0, 0xFF, 0x70, 0x00, 0x00, 0xFE, 0x50, 0x01
	.byte 0x32, 0x00, 0x80, 0xFD, 0xB0, 0xFF, 0x70, 0x00, 0x00, 0xFE, 0x50, 0x01, 0x32, 0x00, 0x80, 0xFD
	.byte 0xB0, 0xFF, 0x70, 0x00, 0x00, 0xFE, 0x50, 0x01, 0x32, 0x00, 0x80, 0xFD

	.data

_02237840:
	.byte 0x20, 0x48, 0x61, 0x69, 0x6B, 0x65, 0x69, 0x53, 0x75, 0x62, 0x53, 0x79, 0x73, 0x74, 0x65, 0x6D
	.byte 0x83, 0x52, 0x83, 0x7D, 0x83, 0x93, 0x83, 0x68, 0x93, 0xAF, 0x8E, 0x9E, 0x8B, 0x4E, 0x93, 0xAE
	.byte 0x90, 0x94, 0x82, 0xCC, 0x8C, 0xC0, 0x8A, 0x45, 0x82, 0xC5, 0x82, 0xB7, 0x81, 0x42, 0x20, 0x00
	.byte 0x42, 0x47, 0x83, 0x70, 0x83, 0x8C, 0x83, 0x62, 0x83, 0x67, 0x83, 0x41, 0x83, 0x6A, 0x83, 0x81
	.byte 0x82, 0xAA, 0x90, 0xDD, 0x92, 0xE8, 0x82, 0xB3, 0x82, 0xEA, 0x82, 0xC4, 0x82, 0xA2, 0x82, 0xC8
	.byte 0x82, 0xA2, 0x42, 0x47, 0x82, 0xC5, 0x82, 0xB7, 0x81, 0x42, 0x00, 0x00, 0x65, 0x78, 0x5F, 0x66
	.byte 0x6C, 0x61, 0x67, 0x82, 0xAA, 0x95, 0x73, 0x90, 0xB3, 0x82, 0xC5, 0x82, 0xB7, 0x81, 0x42, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
_022378C0:
	@ 0x022378C0
