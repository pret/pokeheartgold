
	thumb_func_start MOD22_022598C0
MOD22_022598C0: @ 0x022598C0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, [r5, #8]
	adds r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_020403AC
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_020403AC
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #0x27
	bl FUN_020402F0
	lsls r2, r6, #0x18
	lsls r3, r7, #0x18
	adds r5, #0x80
	str r0, [sp]
	ldr r0, [r5]
	adds r1, r4, #0
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_021EEC00
	ldr r1, [sp]
	str r0, [r1]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end MOD22_022598C0
