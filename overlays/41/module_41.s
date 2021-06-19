
	thumb_func_start MOD41_02245EA0
MOD41_02245EA0: @ 0x02245EA0
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
	thumb_func_end MOD41_02245EA0
