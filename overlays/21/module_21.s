
	thumb_func_start MOD21_022598C0
MOD21_022598C0: @ 0x022598C0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x80
	ldr r6, [r1]
	bl FUN_0203FE2C
	adds r4, #0x80
	adds r1, r0, #0
	ldr r0, [r4]
	bl FUN_02040374
	movs r4, #0
	ldr r7, _02259908 @ =0x022599F0
	str r0, [sp]
	adds r5, r4, #0
_022598E0:
	ldr r0, [r6, #0xc]
	bl FUN_0207879C
	lsls r1, r4, #2
	ldrh r1, [r7, r1]
	movs r2, #4
	bl FUN_02078550
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	blo _022598E0
	ldr r0, [sp]
	strh r5, [r0]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02259908: .4byte 0x022599F0
	thumb_func_end MOD21_022598C0
