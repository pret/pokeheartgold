
	thumb_func_start MOD19_022598C0
MOD19_022598C0: @ 0x022598C0
	push {r3, r4, r5, lr}
	movs r1, #0x76
	adds r5, r0, #0
	movs r0, #0xb
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0x76
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0xb
	str r0, [r4]
	str r5, [r4, #0x14]
	ldr r0, [r5, #8]
	str r0, [r4, #0x18]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	str r0, [r4, #0x1c]
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_020183F0
	movs r1, #0x1d
	str r0, [r4, #8]
	lsls r1, r1, #4
	ldr r0, [r4, #0x1c]
	adds r1, r4, r1
	bl FUN_0206A8C0
	ldr r0, _02259914 @ =0x02259951
	adds r1, r4, #0
	movs r2, #1
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	.align 2, 0
_02259914: .4byte 0x02259951
	thumb_func_end MOD19_022598C0
