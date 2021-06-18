
	thumb_func_start MOD26_022598C0
MOD26_022598C0: @ 0x022598C0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	bl FUN_022598F0
	adds r4, r0, #0
	cmp r4, #0xff
	bne _022598D4
	movs r0, #0
	pop {r3, r4, r5, pc}
_022598D4:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02259910
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225995C
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_022599BC
	pop {r3, r4, r5, pc}
	thumb_func_end MOD26_022598C0

	thumb_func_start FUN_022598F0
FUN_022598F0: @ 0x022598F0
	ldr r3, _0225990C @ =0x02259ACC
	movs r2, #0
_022598F4:
	ldrh r1, [r3]
	cmp r0, r1
	bne _02259900
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	bx lr
_02259900:
	adds r2, r2, #1
	adds r3, #0xc
	cmp r2, #0x3f
	blo _022598F4
	movs r0, #0xff
	bx lr
	.align 2, 0
_0225990C: .4byte 0x02259ACC
	thumb_func_end FUN_022598F0

	thumb_func_start FUN_02259910
FUN_02259910: @ 0x02259910
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0xc
	ldr r2, _02259954 @ =0x02259ACC
	muls r0, r1, r0
	adds r0, r2, r0
	ldr r7, _02259958 @ =0x0000FFFF
	movs r4, #1
	adds r5, r0, #2
_02259922:
	ldrh r1, [r5]
	cmp r1, #0
	bne _02259930
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02259930:
	cmp r1, r7
	beq _02259944
	adds r0, r6, #0
	bl FUN_02040514
	cmp r0, #0
	bne _02259944
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02259944:
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #6
	blt _02259922
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02259954: .4byte 0x02259ACC
_02259958: .4byte 0x0000FFFF
	thumb_func_end FUN_02259910

	thumb_func_start FUN_0225995C
FUN_0225995C: @ 0x0225995C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_020503D0
	cmp r4, #0
	bne _0225996E
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0225996E:
	adds r1, r4, #0
	bl FUN_020666C4
	cmp r0, #0
	bne _02259982
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02259988
	adds r4, r0, #0
_02259982:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end FUN_0225995C

	thumb_func_start FUN_02259988
FUN_02259988: @ 0x02259988
	subs r1, r1, #1
	lsls r1, r1, #0x10
	ldr r2, _022599B4 @ =0x02259ACC
	lsrs r3, r1, #0x10
	beq _022599AE
	movs r1, #0xc
	muls r1, r0, r1
	adds r2, r2, r1
	ldr r1, _022599B8 @ =0x0000FFFF
_0225999A:
	lsls r0, r3, #1
	ldrh r0, [r2, r0]
	cmp r0, r1
	beq _022599A6
	adds r0, r3, #0
	bx lr
_022599A6:
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	bne _0225999A
_022599AE:
	movs r0, #0
	bx lr
	nop
_022599B4: .4byte 0x02259ACC
_022599B8: .4byte 0x0000FFFF
	thumb_func_end FUN_02259988

	thumb_func_start FUN_022599BC
FUN_022599BC: @ 0x022599BC
	movs r2, #0xc
	muls r2, r0, r2
	ldr r0, _022599CC @ =0x02259ACC
	lsls r1, r1, #1
	adds r0, r0, r2
	ldrh r0, [r1, r0]
	bx lr
	nop
_022599CC: .4byte 0x02259ACC
	thumb_func_end FUN_022599BC
