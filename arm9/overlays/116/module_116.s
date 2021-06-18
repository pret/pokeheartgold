
	thumb_func_start MOD116_0225F020
MOD116_0225F020: @ 0x0225F020
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldrh r0, [r4, #8]
	ldr r1, [r5, #0x24]
	bl FUN_02023494
	ldr r0, [r4]
	ldr r1, [r5, #0x24]
	bl FUN_020235D4
	ldrh r1, [r4, #4]
	add r0, sp, #0
	strh r1, [r0]
	ldrh r1, [r4, #6]
	strh r1, [r0, #2]
	movs r1, #0
	strh r1, [r0, #4]
	ldr r1, [r5, #0x24]
	add r0, sp, #0
	bl FUN_02023558
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end MOD116_0225F020
