
	thumb_func_start MOD20_022598C0
MOD20_022598C0: @ 0x022598C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r1, #0
	adds r2, r1, #0
	adds r5, r0, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #0x47
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x48
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x49
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #0
	movs r1, #0x4b
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	eors r0, r6
	asrs r1, r4, #8
	muls r0, r7, r0
	eors r0, r1
	lsls r1, r4, #0x18
	lsrs r3, r1, #0x18
	lsls r0, r0, #0x10
	ldr r2, [sp, #4]
	ldr r1, [sp]
	lsrs r0, r0, #0x10
	eors r2, r1
	ldr r1, [sp, #8]
	muls r2, r1, r2
	adds r1, r3, #0
	eors r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #8
	adds r0, r0, r1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end MOD20_022598C0
