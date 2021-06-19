
	thumb_func_start MOD17_02201BC0
MOD17_02201BC0: @ 0x02201BC0
	push {r3, lr}
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02201C08 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _02201C0C @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	pop {r3, pc}
	.align 2, 0
_02201C08: .4byte 0xFFFFE0FF
_02201C0C: .4byte 0x04001000
	thumb_func_end MOD17_02201BC0
