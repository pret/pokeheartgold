
	thumb_func_start MOD04_02253E20
MOD04_02253E20: @ 0x02253E20
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	adds r5, r0, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #4
	bl FUN_0202AEA8
	add r3, sp, #0x18
	ldr r6, _02253ECC @ =0x02257328
	adds r4, r0, #0
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #0x6f
	str r0, [r3]
	ldr r0, [r5, #0x54]
	movs r3, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_021F3C0C
	movs r3, #3
	movs r0, #2
	str r3, [sp]
	lsls r0, r0, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	movs r1, #0xe
	str r0, [sp, #8]
	movs r0, #0
	movs r2, #0x13
	bl FUN_021FB3E4
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	beq _02253E80
	cmp r0, #1
	beq _02253E86
	b _02253E8C
_02253E80:
	movs r4, #2
	lsls r4, r4, #0x10
	b _02253E94
_02253E86:
	movs r4, #0x1f
	lsls r4, r4, #0x10
	b _02253E94
_02253E8C:
	bl FUN_0202551C
	movs r4, #2
	lsls r4, r4, #0x10
_02253E94:
	adds r0, r5, #0
	adds r0, #0x9c
	ldr r0, [r0]
	movs r1, #0x6f
	bl FUN_021F3B4C
	adds r6, r0, #0
	add r0, sp, #0xc
	adds r1, r6, #0
	bl FUN_021F3B0C
	adds r0, r6, #0
	add r1, sp, #0xc
	str r4, [sp, #0x10]
	bl FUN_021F3B1C
	adds r5, #0x98
	ldr r2, [r5]
	movs r0, #0
	adds r1, r4, #0
	bl FUN_021FB4A0
	ldr r0, _02253ED0 @ =0x02257334
	blx FUN_020CF8E4
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	nop
_02253ECC: .4byte 0x02257328
_02253ED0: .4byte 0x02257334
	thumb_func_end MOD04_02253E20
