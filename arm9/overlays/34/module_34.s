
	thumb_func_start MOD34_0225D520
MOD34_0225D520: @ 0x0225D520
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x1c]
	movs r1, #0xdb
	bl FUN_0200BBA0
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	ldr r0, _0225D554 @ =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x9d
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r4, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225D554: .4byte 0x000F0200
	thumb_func_end MOD34_0225D520
