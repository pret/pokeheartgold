
	thumb_func_start MOD75_02246960
MOD75_02246960: @ 0x02246960
	push {r3, r4, r5, lr}
	movs r2, #0xa
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x73
	lsls r2, r2, #0xe
	bl FUN_0201A910
	movs r2, #0x57
	movs r0, #0
	movs r1, #0x59
	lsls r2, r2, #4
	bl FUN_0201A910
	movs r1, #0x47
	adds r0, r5, #0
	lsls r1, r1, #2
	movs r2, #0x73
	bl FUN_02007280
	movs r2, #0x47
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	bl FUN_020072A4
	ldr r0, [r0, #8]
	str r0, [r4, #4]
	bl FUN_02028EA8
	str r0, [r4, #8]
	movs r0, #0x64
	movs r1, #0x73
	bl FUN_02026354
	movs r1, #0x11
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #0x64
	movs r1, #0x73
	bl FUN_02026354
	movs r1, #0x45
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r1, _022469D4 @ =0x0000047D
	movs r0, #0x11
	movs r2, #1
	bl FUN_02004EC4
	movs r0, #0
	adds r4, #0x88
	str r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_022469D4: .4byte 0x0000047D
	thumb_func_end MOD75_02246960
