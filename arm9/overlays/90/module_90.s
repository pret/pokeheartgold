
	thumb_func_start MOD90_02258800
MOD90_02258800: @ 0x02258800
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	adds r2, r6, #0
	movs r1, #0x10
	movs r0, #0
_02258812:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _02258812
	bl FUN_020347A0
	strb r0, [r6, #8]
	bl FUN_0203769C
	movs r5, #0
	adds r7, r0, #0
	adds r4, r5, #0
_0225882A:
	adds r0, r4, #0
	bl FUN_02034818
	cmp r0, #0
	beq _02258840
	cmp r7, r4
	bne _0225883A
	strb r5, [r6, #9]
_0225883A:
	adds r0, r6, r5
	strb r4, [r0, #4]
	adds r5, r5, #1
_02258840:
	adds r4, r4, #1
	cmp r4, #4
	blt _0225882A
	ldrb r0, [r6, #8]
	cmp r5, r0
	beq _02258850
	bl FUN_0202551C
_02258850:
	ldr r0, [sp]
	cmp r0, #0
	bne _0225885A
	movs r0, #1
	strb r0, [r6, #0xb]
_0225885A:
	ldr r0, [sp, #4]
	str r0, [r6]
	ldr r0, [sp, #8]
	strb r0, [r6, #0xa]
	ldr r0, [sp, #0x20]
	str r0, [r6, #0xc]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end MOD90_02258800
