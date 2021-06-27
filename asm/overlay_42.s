
	thumb_func_start ov42_02227060
ov42_02227060: @ 0x02227060
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r6, r3, #0
	adds r4, r0, #0
	ldr r1, _02227100 @ =0x0000230C
	adds r0, r6, #0
	str r2, [sp]
	bl FUN_0201AA8C
	ldr r2, _02227100 @ =0x0000230C
	adds r7, r0, #0
	movs r1, #0
	blx FUN_020E5B44
	str r4, [r7]
	movs r0, #0xb3
	adds r1, r6, #0
	str r5, [r7, #4]
	bl FUN_02007688
	ldr r1, _02227104 @ =0x00002304
	str r0, [r7, r1]
	movs r0, #0xba
	adds r1, r6, #0
	bl FUN_02007688
	ldr r1, _02227108 @ =0x00002308
	movs r4, #0
	str r0, [r7, r1]
	adds r5, r7, #0
_0222709C:
	movs r0, #0x9a
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0200A090
	ldr r1, _0222710C @ =0x000022F0
	adds r4, r4, #1
	str r0, [r5, r1]
	adds r5, r5, #4
	cmp r4, #2
	blt _0222709C
	movs r5, #0
	adds r4, r7, #0
_022270B6:
	movs r0, #0x17
	adds r1, r5, #2
	adds r2, r6, #0
	bl FUN_0200A090
	ldr r1, _02227110 @ =0x000022F8
	adds r5, r5, #1
	str r0, [r4, r1]
	adds r4, r4, #4
	cmp r5, #2
	blt _022270B6
	movs r4, #0
_022270CE:
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov42_02227570
	adds r4, r4, #1
	cmp r4, #3
	blt _022270CE
	ldr r0, [sp]
	ldr r2, [sp]
	movs r1, #0x18
	str r0, [r7, #0xc]
	adds r0, r6, #0
	muls r1, r2, r1
	bl FUN_0201AA8C
	str r0, [r7, #8]
	ldr r3, [r7, #0xc]
	movs r2, #0x18
	movs r1, #0
	muls r2, r3, r2
	blx FUN_020E5B44
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02227100: .4byte 0x0000230C
_02227104: .4byte 0x00002304
_02227108: .4byte 0x00002308
_0222710C: .4byte 0x000022F0
_02227110: .4byte 0x000022F8
	thumb_func_end ov42_02227060

	thumb_func_start ov42_02227114
ov42_02227114: @ 0x02227114
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r6, #0
	cmp r0, #0
	bls _02227140
	adds r4, r6, #0
_02227122:
	ldr r0, [r5, #8]
	adds r0, r0, r4
	bl ov42_02227E68
	cmp r0, #0
	bne _02227136
	ldr r0, [r5, #8]
	adds r0, r0, r4
	bl ov42_0222740C
_02227136:
	ldr r0, [r5, #0xc]
	adds r6, r6, #1
	adds r4, #0x18
	cmp r6, r0
	blo _02227122
_02227140:
	movs r4, #0
_02227142:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov42_02227604
	adds r4, r4, #1
	cmp r4, #3
	blt _02227142
	adds r0, r5, #0
	bl ov42_022271F8
	ldr r0, _02227188 @ =0x00002304
	ldr r0, [r5, r0]
	bl FUN_0200770C
	ldr r0, _0222718C @ =0x00002308
	ldr r0, [r5, r0]
	bl FUN_0200770C
	ldr r7, _02227190 @ =0x000022F0
	movs r6, #0
	adds r4, r5, #0
_0222716C:
	ldr r0, [r4, r7]
	bl FUN_0200A0D0
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _0222716C
	ldr r0, [r5, #8]
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02227188: .4byte 0x00002304
_0222718C: .4byte 0x00002308
_02227190: .4byte 0x000022F0
	thumb_func_end ov42_02227114

	thumb_func_start ov42_02227194
ov42_02227194: @ 0x02227194
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r7, r3, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	adds r6, r2, #0
	bl ov42_02227680
	cmp r0, #0
	bne _022271B0
	bl GF_AssertFail
_022271B0:
	adds r0, r4, #0
	bl ov42_02227654
	adds r1, r0, #0
	ldr r0, [sp, #0x20]
	adds r2, r6, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r3, r7, #0
	bl ov42_022276DC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov42_02227194

	thumb_func_start ov42_022271D0
ov42_022271D0: @ 0x022271D0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl ov42_02227654
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov42_02227948
	pop {r4, pc}
	thumb_func_end ov42_022271D0

	thumb_func_start ov42_022271E4
ov42_022271E4: @ 0x022271E4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl ov42_02227654
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov42_022279E8
	pop {r4, pc}
	thumb_func_end ov42_022271E4

	thumb_func_start ov42_022271F8
ov42_022271F8: @ 0x022271F8
	push {r3, r4, r5, lr}
	movs r1, #0x23
	adds r4, r0, #0
	lsls r1, r1, #8
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0222720A
	bl ov42_02227274
_0222720A:
	movs r5, #0
_0222720C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov42_022279E8
	cmp r0, #1
	bne _02227220
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov42_02227948
_02227220:
	adds r5, r5, #1
	cmp r5, #0x99
	blt _0222720C
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_022271F8

	thumb_func_start ov42_02227228
ov42_02227228: @ 0x02227228
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r3, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	adds r0, r2, #0
	bne _0222723C
	bl GF_AssertFail
_0222723C:
	ldr r1, [sp, #8]
	adds r0, r7, #0
	adds r2, r6, #0
	bl ov42_02227B6C
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov42_02227C18
	ldr r5, _02227270 @ =0x02229B10
	movs r4, #0
_02227252:
	str r6, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldrb r1, [r5]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r7, #0
	bl ov42_022276DC
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #0x10
	blt _02227252
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02227270: .4byte 0x02229B10
	thumb_func_end ov42_02227228

	thumb_func_start ov42_02227274
ov42_02227274: @ 0x02227274
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ov42_02227BE0
	adds r0, r6, #0
	bl ov42_02227CA8
	ldr r5, _02227298 @ =0x02229B10
	movs r4, #0
_02227286:
	ldrb r1, [r5]
	adds r0, r6, #0
	bl ov42_02227948
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #0x10
	blt _02227286
	pop {r4, r5, r6, pc}
	.align 2, 0
_02227298: .4byte 0x02229B10
	thumb_func_end ov42_02227274

	thumb_func_start ov42_0222729C
ov42_0222729C: @ 0x0222729C
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r2, r3, #0
	adds r5, r0, #0
	bl ov42_022279FC
	ldr r0, _022272B0 @ =0x000022EC
	str r4, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_022272B0: .4byte 0x000022EC
	thumb_func_end ov42_0222729C

	thumb_func_start ov42_022272B4
ov42_022272B4: @ 0x022272B4
	ldr r3, _022272B8 @ =ov42_02227B04
	bx r3
	.align 2, 0
_022272B8: .4byte ov42_02227B04
	thumb_func_end ov42_022272B4

	thumb_func_start ov42_022272BC
ov42_022272BC: @ 0x022272BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r7, r2, #0
	adds r5, r0, #0
	adds r6, r1, #0
	str r3, [sp]
	bl ov42_02227CF8
	adds r4, r0, #0
	adds r0, r7, #0
	bl ov42_02227654
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	adds r0, r5, #0
	bl ov42_022279E8
	cmp r0, #1
	beq _022272E6
	bl GF_AssertFail
_022272E6:
	movs r0, #0
	add r2, sp, #0xc
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r1, [r5]
	movs r2, #0x38
	str r1, [sp, #0xc]
	ldr r1, [sp, #4]
	adds r7, r1, #0
	adds r1, r5, #0
	muls r7, r2, r7
	adds r1, #0x24
	adds r1, r1, r7
	str r1, [sp, #0x10]
	ldrsh r0, [r6, r0]
	lsls r0, r0, #0xc
	str r0, [sp, #0x14]
	movs r0, #2
	ldrsh r1, [r6, r0]
	lsls r1, r1, #0xc
	str r1, [sp, #0x18]
	lsls r1, r0, #0xb
	str r1, [sp, #0x20]
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	movs r1, #4
	ldrsh r1, [r6, r1]
	str r1, [sp, #0x30]
	ldr r1, [sp]
	str r1, [sp, #0x38]
	adds r1, r5, #0
	str r1, [sp, #8]
	adds r1, #0x1c
	str r1, [sp, #8]
	ldr r1, [r1, r7]
	cmp r1, #3
	beq _0222733E
	cmp r1, #1
	bne _02227344
_0222733E:
	movs r0, #1
	str r0, [sp, #0x34]
	b _02227346
_02227344:
	str r0, [sp, #0x34]
_02227346:
	add r0, sp, #0xc
	bl FUN_02024624
	str r0, [r4, #4]
	movs r1, #6
	ldrsh r1, [r6, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_02024A04
	adds r0, r5, r7
	ldr r0, [r0, #0x20]
	cmp r0, #1
	ldr r0, [r4, #4]
	bne _0222736C
	movs r1, #6
	bl FUN_020248F0
	b _02227372
_0222736C:
	movs r1, #1
	bl FUN_020248F0
_02227372:
	movs r0, #9
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x14]
	movs r0, #1
	str r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x10
	adds r0, r0, r7
	str r0, [r4]
	ldr r0, _02227404 @ =0x000022B8
	adds r0, r5, r0
	bl ov42_02227B5C
	cmp r0, #0
	beq _022273F8
	movs r0, #0
	add r2, sp, #0xc
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r1, [r5]
	str r1, [sp, #0xc]
	ldr r1, _02227408 @ =0x000022C8
	adds r2, r5, r1
	str r2, [sp, #0x10]
	ldrsh r0, [r6, r0]
	adds r1, #0x24
	lsls r0, r0, #0xc
	str r0, [sp, #0x14]
	movs r0, #2
	ldrsh r2, [r6, r0]
	lsls r2, r2, #0xc
	str r2, [sp, #0x18]
	lsls r2, r0, #0xb
	str r2, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	ldr r1, [r5, r1]
	str r1, [sp, #0x30]
	ldr r1, [sp]
	str r1, [sp, #0x38]
	ldr r1, [sp, #8]
	ldr r1, [r1, r7]
	cmp r1, #3
	beq _022273DA
	cmp r1, #1
	bne _022273E0
_022273DA:
	movs r0, #1
	str r0, [sp, #0x34]
	b _022273E2
_022273E0:
	str r0, [sp, #0x34]
_022273E2:
	add r0, sp, #0xc
	bl FUN_02024624
	str r0, [r4, #8]
	movs r1, #6
	ldrsh r1, [r6, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_02024A04
	b _022273FC
_022273F8:
	movs r0, #0
	str r0, [r4, #8]
_022273FC:
	adds r0, r4, #0
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_02227404: .4byte 0x000022B8
_02227408: .4byte 0x000022C8
	thumb_func_end ov42_022272BC

	thumb_func_start ov42_0222740C
ov42_0222740C: @ 0x0222740C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0222741A
	bl FUN_02024758
_0222741A:
	ldr r0, [r4, #4]
	bl FUN_02024758
	movs r1, #0x18
	movs r0, #0
_02227424:
	strb r0, [r4]
	adds r4, r4, #1
	subs r1, r1, #1
	bne _02227424
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov42_0222740C

	thumb_func_start ov42_02227430
ov42_02227430: @ 0x02227430
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov42_02227430

	thumb_func_start ov42_02227434
ov42_02227434: @ 0x02227434
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r0, r1, #0xc
	str r0, [sp]
	lsls r0, r2, #0xc
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl FUN_020247D4
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02227470
	movs r0, #2
	ldr r1, [sp]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp]
	movs r0, #0xe
	ldr r1, [sp, #4]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl FUN_020247D4
_02227470:
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov42_02227434

	thumb_func_start ov42_02227474
ov42_02227474: @ 0x02227474
	ldr r3, _0222747C @ =FUN_02024ADC
	ldr r0, [r0, #4]
	bx r3
	nop
_0222747C: .4byte FUN_02024ADC
	thumb_func_end ov42_02227474

	thumb_func_start ov42_02227480
ov42_02227480: @ 0x02227480
	push {r3, lr}
	ldr r0, [r0, #4]
	bl FUN_02024AF8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov42_02227480

	thumb_func_start ov42_02227490
ov42_02227490: @ 0x02227490
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	bl FUN_02024830
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _022274A8
	adds r1, r4, #0
	bl FUN_02024830
_022274A8:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov42_02227490

	thumb_func_start ov42_022274AC
ov42_022274AC: @ 0x022274AC
	ldr r3, _022274B4 @ =FUN_020248B8
	ldr r0, [r0, #4]
	bx r3
	nop
_022274B4: .4byte FUN_020248B8
	thumb_func_end ov42_022274AC

	thumb_func_start ov42_022274B8
ov42_022274B8: @ 0x022274B8
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bx lr
	.align 2, 0
	thumb_func_end ov42_022274B8

	thumb_func_start ov42_022274C0
ov42_022274C0: @ 0x022274C0
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov42_022274C0

	thumb_func_start ov42_022274C4
ov42_022274C4: @ 0x022274C4
	ldr r3, _022274CC @ =FUN_020249D4
	ldr r0, [r0, #4]
	bx r3
	nop
_022274CC: .4byte FUN_020249D4
	thumb_func_end ov42_022274C4

	thumb_func_start ov42_022274D0
ov42_022274D0: @ 0x022274D0
	ldr r3, _022274D8 @ =FUN_020249F8
	ldr r0, [r0, #4]
	bx r3
	nop
_022274D8: .4byte FUN_020249F8
	thumb_func_end ov42_022274D0

	thumb_func_start ov42_022274DC
ov42_022274DC: @ 0x022274DC
	push {lr}
	sub sp, #0xc
	ldr r3, [r0, #8]
	cmp r3, #0
	beq _022274FE
	adds r1, #8
	lsls r1, r1, #0xc
	adds r2, #0xe
	str r1, [sp]
	lsls r1, r2, #0xc
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, [r0, #8]
	add r1, sp, #0
	bl FUN_020247D4
_022274FE:
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov42_022274DC

	thumb_func_start ov42_02227504
ov42_02227504: @ 0x02227504
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0xa
	blt _02227514
	bl GF_AssertFail
_02227514:
	cmp r6, #4
	blt _0222751C
	bl GF_AssertFail
_0222751C:
	str r4, [r5, #0xc]
	movs r0, #0
	strh r0, [r5, #0x14]
	ldr r0, _02227534 @ =0x02229B20
	lsls r1, r4, #2
	ldr r2, [r0, r1]
	cmp r2, #0
	beq _02227532
	adds r0, r5, #0
	adds r1, r6, #0
	blx r2
_02227532:
	pop {r4, r5, r6, pc}
	.align 2, 0
_02227534: .4byte 0x02229B20
	thumb_func_end ov42_02227504

	thumb_func_start ov42_02227538
ov42_02227538: @ 0x02227538
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0xc]
	ldr r1, _0222756C @ =0x02229B04
	movs r0, #0
	ldrb r2, [r1, r2]
	cmp r2, #0xff
	bne _0222754C
	movs r0, #1
	b _02227558
_0222754C:
	movs r1, #0x14
	ldrsh r1, [r4, r1]
	adds r1, r1, #1
	cmp r2, r1
	blt _02227558
	movs r0, #1
_02227558:
	cmp r0, #1
	bne _0222756A
	adds r0, r4, #0
	bl ov42_02227D30
	movs r0, #0x14
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #0x14]
_0222756A:
	pop {r4, pc}
	.align 2, 0
_0222756C: .4byte 0x02229B04
	thumb_func_end ov42_02227538

	thumb_func_start ov42_02227570
ov42_02227570: @ 0x02227570
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0xc]
	adds r0, r1, #0
	lsls r5, r0, #4
	ldr r0, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r1, r0, r5
	ldr r0, _022275F0 @ =0x00002188
	str r2, [sp, #0x14]
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0222758E
	bl GF_AssertFail
_0222758E:
	ldr r0, _022275F4 @ =0x02229B70
	ldr r6, _022275F8 @ =_02229AF8
	adds r4, r0, r5
	ldr r0, [sp, #0xc]
	movs r7, #0
	adds r5, r0, r5
	ldr r0, [sp, #0x10]
	lsls r1, r0, #1
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r1, r0
	str r0, [sp, #0x18]
_022275A6:
	lsrs r2, r7, #0x1f
	lsls r1, r7, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	ldrb r2, [r6]
	ldr r1, [sp, #0x18]
	adds r0, r0, #2
	adds r1, r2, r1
	str r1, [sp]
	ldr r1, [sp, #0x14]
	str r0, [sp, #4]
	str r1, [sp, #8]
	lsls r1, r0, #2
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0xc]
	adds r1, r0, r1
	ldr r0, _022275FC @ =0x000022F0
	movs r3, #0
	ldr r0, [r1, r0]
	ldr r1, _02227600 @ =0x00002304
	ldr r1, [r2, r1]
	ldr r2, [r4]
	bl FUN_0200A540
	ldr r1, _022275F0 @ =0x00002188
	adds r7, r7, #1
	str r0, [r5, r1]
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #4
	blt _022275A6
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022275F0: .4byte 0x00002188
_022275F4: .4byte 0x02229B70
_022275F8: .4byte _02229AF8
_022275FC: .4byte 0x000022F0
_02227600: .4byte 0x00002304
	thumb_func_end ov42_02227570

	thumb_func_start ov42_02227604
ov42_02227604: @ 0x02227604
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r5, r1, #4
	ldr r0, _0222764C @ =0x00002188
	adds r1, r6, r5
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _02227618
	bl GF_AssertFail
_02227618:
	movs r4, #0
	adds r5, r6, r5
	adds r7, r4, #0
_0222761E:
	lsrs r2, r4, #0x1f
	lsls r1, r4, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	adds r0, r0, #2
	lsls r0, r0, #2
	adds r1, r6, r0
	ldr r0, _02227650 @ =0x000022F0
	ldr r0, [r1, r0]
	ldr r1, _0222764C @ =0x00002188
	ldr r1, [r5, r1]
	bl FUN_0200A75C
	ldr r0, _0222764C @ =0x00002188
	adds r4, r4, #1
	str r7, [r5, r0]
	adds r5, r5, #4
	cmp r4, #4
	blt _0222761E
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222764C: .4byte 0x00002188
_02227650: .4byte 0x000022F0
	thumb_func_end ov42_02227604

	thumb_func_start ov42_02227654
ov42_02227654: @ 0x02227654
	push {r3, lr}
	ldr r3, _02227678 @ =0x02229BA0
	movs r2, #0
_0222765A:
	ldrh r1, [r3]
	cmp r0, r1
	bne _02227668
	ldr r0, _0222767C @ =0x02229BA2
	lsls r1, r2, #2
	ldrh r0, [r0, r1]
	pop {r3, pc}
_02227668:
	adds r2, r2, #1
	adds r3, r3, #4
	cmp r2, #0x99
	blt _0222765A
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_02227678: .4byte 0x02229BA0
_0222767C: .4byte 0x02229BA2
	thumb_func_end ov42_02227654

	thumb_func_start ov42_02227680
ov42_02227680: @ 0x02227680
	cmp r1, #0
	bne _022276A4
	cmp r0, #0
	beq _0222769C
	cmp r0, #0x61
	beq _0222769C
	cmp r0, #0xee
	beq _0222769C
	cmp r0, #0xef
	beq _0222769C
	ldr r1, _022276A8 @ =0x00000127
	subs r0, r0, r1
	cmp r0, #1
	bhi _022276A0
_0222769C:
	movs r0, #1
	bx lr
_022276A0:
	movs r0, #0
	bx lr
_022276A4:
	movs r0, #1
	bx lr
	.align 2, 0
_022276A8: .4byte 0x00000127
	thumb_func_end ov42_02227680

	thumb_func_start ov42_022276AC
ov42_022276AC: @ 0x022276AC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #2
	beq _022276C0
	cmp r4, #3
	beq _022276C0
	bl GF_AssertFail
_022276C0:
	subs r1, r4, #2
	cmp r6, #0
	bne _022276C8
	adds r1, r1, #2
_022276C8:
	ldr r0, _022276D8 @ =_02229AF8
	ldrb r2, [r0, r1]
	movs r0, #1
	lsls r1, r5, #1
	lsls r0, r0, #8
	adds r0, r1, r0
	adds r0, r2, r0
	pop {r4, r5, r6, pc}
	.align 2, 0
_022276D8: .4byte _02229AF8
	thumb_func_end ov42_022276AC

	thumb_func_start ov42_022276DC
ov42_022276DC: @ 0x022276DC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x38
	muls r0, r4, r0
	adds r0, r5, r0
	ldr r0, [r0, #0x14]
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r0, #0
	beq _022276F6
	bl GF_AssertFail
_022276F6:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0222770E
	ldr r0, [sp, #0x18]
	adds r1, r4, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov42_02227720
	pop {r3, r4, r5, r6, r7, pc}
_0222770E:
	ldr r0, [sp, #0x18]
	adds r1, r4, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov42_02227874
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_022276DC

	thumb_func_start ov42_02227720
ov42_02227720: @ 0x02227720
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r5, r0, #0
	ldr r0, [sp, #0x58]
	adds r6, r5, #0
	str r0, [sp, #0x40]
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r1, r0
	str r0, [sp, #0x38]
	lsls r0, r1, #1
	str r0, [sp, #0x3c]
	adds r4, r1, #0
	movs r0, #0x38
	muls r4, r0, r4
	ldr r0, [sp, #0x38]
	str r3, [sp, #0x30]
	str r0, [sp]
	adds r0, r2, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	str r2, [sp, #0x2c]
	ldr r2, [sp, #0x3c]
	ldr r1, _0222786C @ =0x000022F0
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, #0x14
	ldr r1, [r5, r1]
	adds r6, #0x14
	adds r2, #0xe
	movs r3, #0
	bl FUN_0200A3C8
	str r0, [r6, r4]
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x3c]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	adds r7, r5, #0
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [sp, #0x40]
	adds r2, #0xd
	ldr r1, _02227870 @ =0x000022F4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, #0x10
	ldr r1, [r5, r1]
	adds r7, #0x18
	movs r3, #0
	str r2, [sp, #0x3c]
	bl FUN_0200A480
	str r0, [r7, r4]
	ldr r0, [r6, r4]
	bl FUN_0200A810
	movs r1, #6
	ldr r2, [r0, #0x10]
	lsls r1, r1, #0xa
	cmp r2, r1
	beq _022277A4
	movs r1, #1
	str r1, [sp, #0x34]
	b _022277A8
_022277A4:
	movs r1, #0
	str r1, [sp, #0x34]
_022277A8:
	ldr r1, [sp, #0x30]
	cmp r1, #2
	bne _022277B6
	movs r1, #2
	lsls r1, r1, #0xa
	str r1, [r0, #0x10]
	b _022277CE
_022277B6:
	cmp r1, #1
	bne _022277CE
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _022277C8
	movs r1, #5
	lsls r1, r1, #0xa
	str r1, [r0, #0x10]
	b _022277CE
_022277C8:
	movs r1, #6
	lsls r1, r1, #0xa
	str r1, [r0, #0x10]
_022277CE:
	ldr r0, [r6, r4]
	bl FUN_0200AE18
	cmp r0, #0
	bne _022277DC
	bl GF_AssertFail
_022277DC:
	ldr r0, [r7, r4]
	bl FUN_0200B00C
	cmp r0, #0
	bne _022277EA
	bl GF_AssertFail
_022277EA:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _022277FA
	ldr r1, [r7, r4]
	adds r0, r5, #0
	movs r2, #1
	bl ov42_02227E78
_022277FA:
	ldr r0, [r6, r4]
	bl FUN_0200A740
	ldr r0, [r7, r4]
	bl FUN_0200A740
	ldr r0, [sp, #0x2c]
	adds r1, r5, r4
	str r0, [r1, #0x1c]
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x34]
	str r0, [r1, #0x20]
	movs r0, #0
	str r0, [r1, #0x10]
	ldr r0, [sp, #0x30]
	movs r1, #2
	bl ov42_022276AC
	adds r6, r0, #0
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x34]
	movs r1, #3
	bl ov42_022276AC
	str r0, [sp]
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r2, _0222786C @ =0x000022F0
	str r0, [sp, #0x10]
	ldr r1, [r5, r2]
	adds r3, r6, #0
	str r1, [sp, #0x14]
	adds r1, r2, #4
	ldr r1, [r5, r1]
	str r1, [sp, #0x18]
	adds r1, r2, #0
	adds r1, #8
	ldr r1, [r5, r1]
	adds r2, #0xc
	str r1, [sp, #0x1c]
	ldr r1, [r5, r2]
	adds r5, #0x24
	str r1, [sp, #0x20]
	ldr r1, [sp, #0x38]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r5, r4
	adds r2, r1, #0
	bl FUN_02009D48
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0222786C: .4byte 0x000022F0
_02227870: .4byte 0x000022F4
	thumb_func_end ov42_02227720

	thumb_func_start ov42_02227874
ov42_02227874: @ 0x02227874
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r7, r1, #0
	adds r5, r0, #0
	subs r0, r7, #2
	str r0, [sp, #0x38]
	movs r0, #2
	lsls r0, r0, #8
	adds r0, r7, r0
	str r0, [sp, #0x34]
	movs r0, #0x38
	adds r4, r7, #0
	muls r4, r0, r4
	ldr r0, [sp, #0x34]
	adds r6, r5, #0
	str r0, [sp]
	adds r0, r2, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x50]
	str r2, [sp, #0x2c]
	str r3, [sp, #0x30]
	ldr r1, _02227940 @ =0x000022F0
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, #0x18
	ldr r1, [r5, r1]
	adds r6, #0x14
	subs r2, r7, #1
	movs r3, #0
	bl FUN_0200A3C8
	str r0, [r6, r4]
	ldr r0, [sp, #0x30]
	cmp r0, #2
	bne _022278C8
	ldr r0, [r6, r4]
	bl FUN_0200A810
	movs r1, #2
	lsls r1, r1, #0xa
	str r1, [r0, #0x10]
	b _022278D8
_022278C8:
	cmp r0, #1
	bne _022278D8
	ldr r0, [r6, r4]
	bl FUN_0200A810
	movs r1, #5
	lsls r1, r1, #0xa
	str r1, [r0, #0x10]
_022278D8:
	ldr r0, [r6, r4]
	bl FUN_0200AE18
	cmp r0, #0
	bne _022278E6
	bl GF_AssertFail
_022278E6:
	ldr r0, [r6, r4]
	bl FUN_0200A740
	movs r0, #0
	adds r2, r5, r4
	ldr r1, [sp, #0x2c]
	str r0, [r2, #0x18]
	str r1, [r2, #0x1c]
	ldr r1, [sp, #0x30]
	movs r6, #1
	str r1, [r2, #0x20]
	str r6, [r2, #0x10]
	movs r2, #6
	ldr r1, [sp, #0x38]
	lsls r2, r2, #6
	adds r3, r1, r2
	str r3, [sp]
	subs r1, r6, #2
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, _02227940 @ =0x000022F0
	str r0, [sp, #0x10]
	ldr r1, [r5, r2]
	str r1, [sp, #0x14]
	adds r1, r2, #4
	ldr r1, [r5, r1]
	str r1, [sp, #0x18]
	adds r1, r2, #0
	adds r1, #8
	ldr r1, [r5, r1]
	adds r2, #0xc
	str r1, [sp, #0x1c]
	ldr r1, [r5, r2]
	adds r5, #0x24
	str r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x34]
	ldr r2, _02227944 @ =0x00000402
	adds r0, r5, r4
	bl FUN_02009D48
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02227940: .4byte 0x000022F0
_02227944: .4byte 0x00000402
	thumb_func_end ov42_02227874

	thumb_func_start ov42_02227948
ov42_02227948: @ 0x02227948
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	movs r0, #0x38
	adds r4, r6, #0
	muls r4, r0, r4
	adds r0, r5, r4
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _02227960
	bl GF_AssertFail
_02227960:
	adds r0, r5, r4
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _02227972
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov42_0222797C
	pop {r4, r5, r6, pc}
_02227972:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov42_022279C0
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_02227948

	thumb_func_start ov42_0222797C
ov42_0222797C: @ 0x0222797C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	movs r0, #0x38
	adds r4, r1, #0
	muls r4, r0, r4
	adds r6, #0x14
	ldr r0, [r6, r4]
	bl FUN_0200AEB0
	adds r7, r5, #0
	adds r7, #0x18
	ldr r0, [r7, r4]
	bl FUN_0200B0A8
	ldr r0, _022279B8 @ =0x000022F0
	ldr r1, [r6, r4]
	ldr r0, [r5, r0]
	bl FUN_0200A75C
	ldr r0, _022279BC @ =0x000022F4
	ldr r1, [r7, r4]
	ldr r0, [r5, r0]
	bl FUN_0200A75C
	movs r0, #0
	str r0, [r6, r4]
	str r0, [r7, r4]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022279B8: .4byte 0x000022F0
_022279BC: .4byte 0x000022F4
	thumb_func_end ov42_0222797C

	thumb_func_start ov42_022279C0
ov42_022279C0: @ 0x022279C0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	movs r0, #0x38
	adds r4, r1, #0
	adds r5, #0x14
	muls r4, r0, r4
	ldr r0, [r5, r4]
	bl FUN_0200AEB0
	ldr r0, _022279E4 @ =0x000022F0
	ldr r1, [r5, r4]
	ldr r0, [r6, r0]
	bl FUN_0200A75C
	movs r0, #0
	str r0, [r5, r4]
	pop {r4, r5, r6, pc}
	.align 2, 0
_022279E4: .4byte 0x000022F0
	thumb_func_end ov42_022279C0

	thumb_func_start ov42_022279E8
ov42_022279E8: @ 0x022279E8
	movs r2, #0x38
	muls r2, r1, r2
	adds r0, r0, r2
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _022279F8
	movs r0, #1
	bx lr
_022279F8:
	movs r0, #0
	bx lr
	thumb_func_end ov42_022279E8

	thumb_func_start ov42_022279FC
ov42_022279FC: @ 0x022279FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r6, r0, #0
	ldr r0, _02227AF0 @ =0x000022B8
	str r1, [sp, #0x2c]
	ldr r0, [r6, r0]
	adds r7, r2, #0
	cmp r0, #0
	beq _02227A12
	bl GF_AssertFail
_02227A12:
	movs r4, #0
	ldr r5, _02227AF4 @ =0x02229AFC
	str r4, [sp, #0x34]
_02227A18:
	ldrb r1, [r5]
	adds r0, r6, #0
	bl ov42_022279E8
	cmp r0, #1
	bne _02227A30
	ldr r0, _02227AF4 @ =0x02229AFC
	ldrb r0, [r0, r4]
	str r0, [sp, #0x30]
	movs r0, #1
	str r0, [sp, #0x34]
	b _02227A38
_02227A30:
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #6
	blt _02227A18
_02227A38:
	ldr r0, [sp, #0x34]
	cmp r0, #1
	beq _02227A42
	bl GF_AssertFail
_02227A42:
	movs r5, #0
	adds r4, r6, #0
_02227A46:
	movs r0, #0x12
	lsls r0, r0, #4
	str r0, [sp]
	adds r0, r5, #2
	str r0, [sp, #4]
	ldr r0, _02227AF8 @ =0x000022F8
	str r7, [sp, #8]
	ldr r1, _02227AFC @ =0x00002304
	ldr r0, [r4, r0]
	ldr r1, [r6, r1]
	adds r2, r5, #0
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x8b
	lsls r1, r1, #6
	str r0, [r4, r1]
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #2
	blt _02227A46
	movs r0, #0x12
	lsls r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	adds r1, #0x30
	str r0, [sp, #4]
	str r7, [sp, #8]
	ldr r0, [r6, r1]
	adds r1, #0x14
	ldr r1, [r6, r1]
	movs r2, #2
	movs r3, #0
	bl FUN_0200A3C8
	ldr r1, _02227AF0 @ =0x000022B8
	str r0, [r6, r1]
	ldr r0, [r6, r1]
	bl FUN_0200AE18
	cmp r0, #0
	bne _02227A9E
	bl GF_AssertFail
_02227A9E:
	ldr r0, _02227AF0 @ =0x000022B8
	ldr r0, [r6, r0]
	bl FUN_0200A740
	movs r1, #0x12
	lsls r1, r1, #4
	movs r0, #0
	str r1, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r3, _02227B00 @ =0x000022F0
	str r0, [sp, #0x10]
	ldr r2, [r6, r3]
	str r2, [sp, #0x14]
	adds r2, r3, #4
	ldr r2, [r6, r2]
	str r2, [sp, #0x18]
	adds r2, r3, #0
	adds r2, #8
	ldr r2, [r6, r2]
	str r2, [sp, #0x1c]
	adds r2, r3, #0
	adds r2, #0xc
	ldr r2, [r6, r2]
	subs r3, #0x28
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r6, r3
	adds r3, r1, #0
	ldr r2, [sp, #0x30]
	adds r3, #0xe0
	adds r2, r2, r3
	adds r3, r1, #0
	bl FUN_02009D48
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02227AF0: .4byte 0x000022B8
_02227AF4: .4byte 0x02229AFC
_02227AF8: .4byte 0x000022F8
_02227AFC: .4byte 0x00002304
_02227B00: .4byte 0x000022F0
	thumb_func_end ov42_022279FC

	thumb_func_start ov42_02227B04
ov42_02227B04: @ 0x02227B04
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _02227B50 @ =0x000022B8
	adds r0, r5, r0
	bl ov42_02227B5C
	cmp r0, #1
	bne _02227B4C
	ldr r0, _02227B50 @ =0x000022B8
	ldr r0, [r5, r0]
	bl FUN_0200AEB0
	ldr r1, _02227B54 @ =0x000022F0
	ldr r0, [r5, r1]
	subs r1, #0x38
	ldr r1, [r5, r1]
	bl FUN_0200A75C
	ldr r0, _02227B50 @ =0x000022B8
	movs r4, #0
	adds r7, r0, #0
	str r4, [r5, r0]
	adds r6, r4, #0
	adds r7, #8
_02227B34:
	ldr r0, _02227B58 @ =0x000022F8
	movs r1, #0x8b
	lsls r1, r1, #6
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl FUN_0200A75C
	str r6, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _02227B34
_02227B4C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02227B50: .4byte 0x000022B8
_02227B54: .4byte 0x000022F0
_02227B58: .4byte 0x000022F8
	thumb_func_end ov42_02227B04

	thumb_func_start ov42_02227B5C
ov42_02227B5C: @ 0x02227B5C
	ldr r0, [r0]
	cmp r0, #0
	beq _02227B66
	movs r0, #1
	bx lr
_02227B66:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov42_02227B5C

	thumb_func_start ov42_02227B6C
ov42_02227B6C: @ 0x02227B6C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x23
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r0, #0
	beq _02227B84
	bl GF_AssertFail
_02227B84:
	ldr r0, _02227BD8 @ =0x00000402
	movs r2, #0
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	ldr r1, _02227BDC @ =0x000022F4
	str r6, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, #0x14
	ldr r1, [r5, r1]
	adds r3, r2, #0
	bl FUN_0200A480
	movs r1, #0x23
	lsls r1, r1, #8
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl FUN_0200B00C
	cmp r0, #0
	bne _02227BB4
	bl GF_AssertFail
_02227BB4:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _02227BC8
	movs r1, #0x23
	lsls r1, r1, #8
	ldr r1, [r5, r1]
	adds r0, r5, #0
	movs r2, #8
	bl ov42_02227E78
_02227BC8:
	movs r0, #0x23
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	bl FUN_0200A740
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02227BD8: .4byte 0x00000402
_02227BDC: .4byte 0x000022F4
	thumb_func_end ov42_02227B6C

	thumb_func_start ov42_02227BE0
ov42_02227BE0: @ 0x02227BE0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x23
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02227BF2
	bl GF_AssertFail
_02227BF2:
	movs r0, #0x23
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	bl FUN_0200B0A8
	ldr r1, _02227C14 @ =0x000022F4
	ldr r0, [r4, r1]
	adds r1, #0xc
	ldr r1, [r4, r1]
	bl FUN_0200A75C
	movs r0, #0x23
	movs r1, #0
	lsls r0, r0, #8
	str r1, [r4, r0]
	pop {r4, pc}
	nop
_02227C14: .4byte 0x000022F4
	thumb_func_end ov42_02227BE0

	thumb_func_start ov42_02227C18
ov42_02227C18: @ 0x02227C18
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, _02227C94 @ =0x000021B8
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02227C2C
	bl GF_AssertFail
_02227C2C:
	movs r0, #0x11
	movs r4, #0
	str r0, [sp, #0x10]
	adds r6, r5, #0
	movs r7, #0x12
_02227C36:
	movs r0, #6
	lsls r0, r0, #6
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r1, _02227C98 @ =0x00002308
	str r0, [sp, #8]
	ldr r0, _02227C9C @ =0x000022F8
	ldr r1, [r5, r1]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x10]
	movs r3, #0
	bl FUN_0200A540
	ldr r1, _02227C94 @ =0x000021B8
	adds r2, r7, #0
	str r0, [r6, r1]
	movs r0, #6
	lsls r0, r0, #6
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r1, _02227C98 @ =0x00002308
	str r0, [sp, #8]
	ldr r0, _02227CA0 @ =0x000022FC
	ldr r1, [r5, r1]
	ldr r0, [r5, r0]
	movs r3, #0
	bl FUN_0200A540
	ldr r1, _02227CA4 @ =0x000021BC
	adds r4, r4, #1
	str r0, [r6, r1]
	ldr r0, [sp, #0x10]
	adds r6, #0x10
	adds r0, r0, #2
	adds r7, r7, #2
	str r0, [sp, #0x10]
	cmp r4, #0x10
	blt _02227C36
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02227C94: .4byte 0x000021B8
_02227C98: .4byte 0x00002308
_02227C9C: .4byte 0x000022F8
_02227CA0: .4byte 0x000022FC
_02227CA4: .4byte 0x000021BC
	thumb_func_end ov42_02227C18

	thumb_func_start ov42_02227CA8
ov42_02227CA8: @ 0x02227CA8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _02227CE8 @ =0x000021B8
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _02227CB8
	bl GF_AssertFail
_02227CB8:
	movs r6, #0
	adds r4, r5, #0
	adds r7, r6, #0
_02227CBE:
	ldr r0, _02227CEC @ =0x000022F8
	ldr r1, _02227CE8 @ =0x000021B8
	ldr r0, [r5, r0]
	ldr r1, [r4, r1]
	bl FUN_0200A75C
	ldr r0, _02227CF0 @ =0x000022FC
	ldr r1, _02227CF4 @ =0x000021BC
	ldr r0, [r5, r0]
	ldr r1, [r4, r1]
	bl FUN_0200A75C
	ldr r0, _02227CE8 @ =0x000021B8
	adds r6, r6, #1
	str r7, [r4, r0]
	adds r0, r0, #4
	str r7, [r4, r0]
	adds r4, #0x10
	cmp r6, #0x10
	blt _02227CBE
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02227CE8: .4byte 0x000021B8
_02227CEC: .4byte 0x000022F8
_02227CF0: .4byte 0x000022FC
_02227CF4: .4byte 0x000021BC
	thumb_func_end ov42_02227CA8

	thumb_func_start ov42_02227CF8
ov42_02227CF8: @ 0x02227CF8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r6, #0
	cmp r0, #0
	bls _02227D26
	adds r4, r6, #0
_02227D06:
	ldr r0, [r5, #8]
	adds r0, r0, r4
	bl ov42_02227E68
	cmp r0, #1
	bne _02227D1C
	movs r0, #0x18
	ldr r1, [r5, #8]
	muls r0, r6, r0
	adds r0, r1, r0
	pop {r4, r5, r6, pc}
_02227D1C:
	ldr r0, [r5, #0xc]
	adds r6, r6, #1
	adds r4, #0x18
	cmp r6, r0
	blo _02227D06
_02227D26:
	bl GF_AssertFail
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov42_02227CF8

	thumb_func_start ov42_02227D30
ov42_02227D30: @ 0x02227D30
	push {r3, lr}
	ldr r1, [r0, #0xc]
	lsls r2, r1, #2
	ldr r1, _02227D44 @ =0x02229B48
	ldr r1, [r1, r2]
	cmp r1, #0
	beq _02227D40
	blx r1
_02227D40:
	pop {r3, pc}
	nop
_02227D44: .4byte 0x02229B48
	thumb_func_end ov42_02227D30

	thumb_func_start ov42_02227D48
ov42_02227D48: @ 0x02227D48
	ldr r3, _02227D50 @ =FUN_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	bx r3
	.align 2, 0
_02227D50: .4byte FUN_02024950
	thumb_func_end ov42_02227D48

	thumb_func_start ov42_02227D54
ov42_02227D54: @ 0x02227D54
	ldr r3, _02227D60 @ =FUN_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	movs r1, #4
	bx r3
	nop
_02227D60: .4byte FUN_02024950
	thumb_func_end ov42_02227D54

	thumb_func_start ov42_02227D64
ov42_02227D64: @ 0x02227D64
	ldr r3, _02227D70 @ =FUN_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	adds r1, r1, #5
	bx r3
	nop
_02227D70: .4byte FUN_02024950
	thumb_func_end ov42_02227D64

	thumb_func_start ov42_02227D74
ov42_02227D74: @ 0x02227D74
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0x10]
	ldr r0, [r5, #4]
	adds r1, r1, #5
	bl FUN_02024950
	str r4, [r5, #0x10]
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02227D74

	thumb_func_start ov42_02227D88
ov42_02227D88: @ 0x02227D88
	ldr r3, _02227D94 @ =FUN_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	adds r1, #9
	bx r3
	nop
_02227D94: .4byte FUN_02024950
	thumb_func_end ov42_02227D88

	thumb_func_start ov42_02227D98
ov42_02227D98: @ 0x02227D98
	ldr r3, _02227DA4 @ =FUN_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	adds r1, r1, #5
	bx r3
	nop
_02227DA4: .4byte FUN_02024950
	thumb_func_end ov42_02227D98

	thumb_func_start ov42_02227DA8
ov42_02227DA8: @ 0x02227DA8
	ldr r3, _02227DB4 @ =FUN_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	adds r1, r1, #5
	bx r3
	nop
_02227DB4: .4byte FUN_02024950
	thumb_func_end ov42_02227DA8

	thumb_func_start ov42_02227DB8
ov42_02227DB8: @ 0x02227DB8
	ldr r3, _02227DC4 @ =FUN_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	adds r1, r1, #5
	bx r3
	nop
_02227DC4: .4byte FUN_02024950
	thumb_func_end ov42_02227DB8

	thumb_func_start ov42_02227DC8
ov42_02227DC8: @ 0x02227DC8
	ldr r3, _02227DD4 @ =FUN_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	adds r1, r1, #5
	bx r3
	nop
_02227DD4: .4byte FUN_02024950
	thumb_func_end ov42_02227DC8

	thumb_func_start ov42_02227DD8
ov42_02227DD8: @ 0x02227DD8
	ldr r3, _02227DE4 @ =FUN_020249B0
	movs r1, #2
	ldr r0, [r0, #4]
	lsls r1, r1, #0xc
	bx r3
	nop
_02227DE4: .4byte FUN_020249B0
	thumb_func_end ov42_02227DD8

	thumb_func_start ov42_02227DE8
ov42_02227DE8: @ 0x02227DE8
	ldr r3, _02227DF4 @ =FUN_020249B0
	movs r1, #2
	ldr r0, [r0, #4]
	lsls r1, r1, #0xc
	bx r3
	nop
_02227DF4: .4byte FUN_020249B0
	thumb_func_end ov42_02227DE8

	thumb_func_start ov42_02227DF8
ov42_02227DF8: @ 0x02227DF8
	push {r3, lr}
	adds r1, r0, #0
	movs r0, #0x14
	ldrsh r0, [r1, r0]
	cmp r0, #0
	ldr r0, [r1, #4]
	bne _02227E0E
	movs r1, #1
	bl FUN_020249D4
	pop {r3, pc}
_02227E0E:
	ldr r1, [r1, #0x10]
	adds r1, r1, #5
	bl FUN_020248F0
	pop {r3, pc}
	thumb_func_end ov42_02227DF8

	thumb_func_start ov42_02227E18
ov42_02227E18: @ 0x02227E18
	ldr r3, _02227E24 @ =FUN_020249B0
	movs r1, #2
	ldr r0, [r0, #4]
	lsls r1, r1, #0xc
	bx r3
	nop
_02227E24: .4byte FUN_020249B0
	thumb_func_end ov42_02227E18

	thumb_func_start ov42_02227E28
ov42_02227E28: @ 0x02227E28
	ldr r3, _02227E34 @ =FUN_020249B0
	movs r1, #1
	ldr r0, [r0, #4]
	lsls r1, r1, #0xc
	bx r3
	nop
_02227E34: .4byte FUN_020249B0
	thumb_func_end ov42_02227E28

	thumb_func_start ov42_02227E38
ov42_02227E38: @ 0x02227E38
	ldr r3, _02227E44 @ =FUN_020249B0
	movs r1, #1
	ldr r0, [r0, #4]
	lsls r1, r1, #0xc
	bx r3
	nop
_02227E44: .4byte FUN_020249B0
	thumb_func_end ov42_02227E38

	thumb_func_start ov42_02227E48
ov42_02227E48: @ 0x02227E48
	ldr r3, _02227E54 @ =FUN_020249B0
	movs r1, #2
	ldr r0, [r0, #4]
	lsls r1, r1, #0xe
	bx r3
	nop
_02227E54: .4byte FUN_020249B0
	thumb_func_end ov42_02227E48

	thumb_func_start ov42_02227E58
ov42_02227E58: @ 0x02227E58
	ldr r3, _02227E64 @ =FUN_020249B0
	movs r1, #6
	ldr r0, [r0, #4]
	lsls r1, r1, #0xc
	bx r3
	nop
_02227E64: .4byte FUN_020249B0
	thumb_func_end ov42_02227E58

	thumb_func_start ov42_02227E68
ov42_02227E68: @ 0x02227E68
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _02227E72
	movs r0, #1
	bx lr
_02227E72:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov42_02227E68

	thumb_func_start ov42_02227E78
ov42_02227E78: @ 0x02227E78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	adds r4, r2, #0
	bl FUN_0200A828
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #1
	bl FUN_0200B12C
	adds r7, r0, #0
	adds r0, r6, #0
	movs r1, #2
	bl FUN_0200B12C
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r7, r0
	beq _02227EBC
	lsls r0, r4, #0x15
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldr r1, [sp, #4]
	lsls r3, r7, #0x14
	ldr r0, [r5, #4]
	ldr r1, [r1, #0xc]
	movs r2, #2
	lsrs r3, r3, #0x10
	bl FUN_0200316C
_02227EBC:
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _02227EDA
	lsls r0, r4, #0x15
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldr r1, [sp, #4]
	lsls r3, r6, #0x14
	ldr r0, [r5, #4]
	ldr r1, [r1, #0xc]
	movs r2, #3
	lsrs r3, r3, #0x10
	bl FUN_0200316C
_02227EDA:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov42_02227E78

	thumb_func_start ov42_02227EE0
ov42_02227EE0: @ 0x02227EE0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r2, #0
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r7, #0
	movs r1, #8
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02227EF8
	bl GF_AssertFail
_02227EF8:
	strh r5, [r4]
	strh r6, [r4, #2]
	ldrh r2, [r4]
	ldrh r1, [r4, #2]
	adds r0, r7, #0
	muls r1, r2, r1
	lsls r1, r1, #2
	bl FUN_0201AA8C
	str r0, [r4, #4]
	cmp r0, #0
	bne _02227F14
	bl GF_AssertFail
_02227F14:
	ldrh r3, [r4]
	ldrh r2, [r4, #2]
	ldr r0, [r4, #4]
	movs r1, #0
	muls r2, r3, r2
	lsls r2, r2, #2
	blx FUN_020E5B44
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_02227EE0

	thumb_func_start ov42_02227F28
ov42_02227F28: @ 0x02227F28
	push {r4, lr}
	adds r4, r0, #0
	bne _02227F32
	bl GF_AssertFail
_02227F32:
	ldr r0, [r4, #4]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov42_02227F28

	thumb_func_start ov42_02227F40
ov42_02227F40: @ 0x02227F40
	ldrh r0, [r0]
	bx lr
	thumb_func_end ov42_02227F40

	thumb_func_start ov42_02227F44
ov42_02227F44: @ 0x02227F44
	ldrh r0, [r0, #2]
	bx lr
	thumb_func_end ov42_02227F44

	thumb_func_start ov42_02227F48
ov42_02227F48: @ 0x02227F48
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _02227F56
	bl GF_AssertFail
_02227F56:
	ldrh r3, [r4]
	ldrh r2, [r4, #2]
	ldr r0, [r4, #4]
	adds r1, r5, #0
	muls r2, r3, r2
	lsls r2, r2, #2
	blx FUN_020E5AD8
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02227F48

	thumb_func_start ov42_02227F68
ov42_02227F68: @ 0x02227F68
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _02227FA0 @ =0x02229E04
	adds r4, r1, #0
	ldr r0, [r0]
	adds r6, r2, #0
	str r0, [sp]
	cmp r5, #0
	bne _02227F80
	bl GF_AssertFail
_02227F80:
	ldrh r2, [r5]
	cmp r2, r4
	bls _02227F9A
	ldrh r0, [r5, #2]
	cmp r0, r6
	bls _02227F9A
	adds r0, r2, #0
	muls r0, r6, r0
	adds r0, r4, r0
	ldr r1, [r5, #4]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	str r0, [sp]
_02227F9A:
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02227FA0: .4byte 0x02229E04
	thumb_func_end ov42_02227F68

	thumb_func_start ov42_02227FA4
ov42_02227FA4: @ 0x02227FA4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r5, #0
	bne _02227FB6
	bl GF_AssertFail
_02227FB6:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov42_02227F68
	movs r1, #0
	mvns r1, r1
	str r0, [sp]
	str r0, [sp, #4]
	cmp r0, r1
	bne _02227FD2
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_02227FD2:
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov42_02227FA4

	thumb_func_start ov42_02227FDC
ov42_02227FDC: @ 0x02227FDC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r5, #0
	bne _02227FEE
	bl GF_AssertFail
_02227FEE:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov42_02227F68
	movs r1, #0
	mvns r1, r1
	str r0, [sp]
	str r0, [sp, #4]
	cmp r0, r1
	bne _0222800A
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_0222800A:
	lsrs r0, r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_02227FDC

	thumb_func_start ov42_02228010
ov42_02228010: @ 0x02228010
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #8
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02228026
	bl GF_AssertFail
_02228026:
	movs r1, #0x18
	adds r0, r6, #0
	muls r1, r5, r1
	str r5, [r4, #4]
	bl FUN_0201AA8C
	str r0, [r4]
	cmp r0, #0
	bne _0222803C
	bl GF_AssertFail
_0222803C:
	ldr r3, [r4, #4]
	movs r2, #0x18
	ldr r0, [r4]
	movs r1, #0
	muls r2, r3, r2
	blx FUN_020E5B44
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov42_02228010

	thumb_func_start ov42_02228050
ov42_02228050: @ 0x02228050
	push {r4, lr}
	adds r4, r0, #0
	bne _0222805A
	bl GF_AssertFail
_0222805A:
	ldr r0, [r4]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov42_02228050

	thumb_func_start ov42_02228068
ov42_02228068: @ 0x02228068
	push {r4, lr}
	adds r4, r1, #0
	ldrb r1, [r4, #7]
	bl ov42_02228110
	adds r1, r4, #0
	bl ov42_02228548
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov42_02228068

	thumb_func_start ov42_0222807C
ov42_0222807C: @ 0x0222807C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ov42_022280A8
	adds r5, r0, #0
	ldr r4, _022280A4 @ =0x00000000
	beq _022280A2
_0222808A:
	lsls r1, r4, #0x10
	adds r0, r6, #0
	lsrs r1, r1, #0x10
	bl ov42_02228148
	cmp r0, #0
	beq _0222809C
	bl ov42_02228574
_0222809C:
	adds r4, r4, #1
	cmp r4, r5
	blo _0222808A
_022280A2:
	pop {r4, r5, r6, pc}
	.align 2, 0
_022280A4: .4byte 0x00000000
	thumb_func_end ov42_0222807C

	thumb_func_start ov42_022280A8
ov42_022280A8: @ 0x022280A8
	push {r4, lr}
	adds r4, r0, #0
	bne _022280B2
	bl GF_AssertFail
_022280B2:
	ldr r0, [r4, #4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov42_022280A8

	thumb_func_start ov42_022280B8
ov42_022280B8: @ 0x022280B8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _022280C6
	bl GF_AssertFail
_022280C6:
	cmp r4, #0
	bne _022280CE
	bl GF_AssertFail
_022280CE:
	adds r0, r5, #0
	bl ov42_022282B0
	movs r1, #0
	ldrsh r2, [r4, r1]
	strh r2, [r0, #4]
	movs r2, #2
	ldrsh r3, [r4, r2]
	strh r3, [r0, #6]
	ldrsh r1, [r4, r1]
	strh r1, [r0, #8]
	ldrsh r1, [r4, r2]
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r4, #6]
	strb r1, [r0, #0x15]
	ldrh r1, [r4, #8]
	strb r1, [r0, #0x14]
	ldrh r1, [r4, #0xa]
	strh r1, [r0, #0xe]
	movs r1, #1
	str r1, [r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov42_022280B8

	thumb_func_start ov42_02228100
ov42_02228100: @ 0x02228100
	movs r2, #0x18
	movs r1, #0
_02228104:
	strb r1, [r0]
	adds r0, r0, #1
	subs r2, r2, #1
	bne _02228104
	bx lr
	.align 2, 0
	thumb_func_end ov42_02228100

	thumb_func_start ov42_02228110
ov42_02228110: @ 0x02228110
	push {r3, r4, r5, r6}
	ldr r5, [r0, #4]
	movs r2, #0
	cmp r5, #0
	bls _02228142
	ldr r4, [r0]
	adds r3, r2, #0
	adds r0, r4, #0
_02228120:
	ldr r6, [r0]
	cmp r6, #1
	bne _02228138
	adds r6, r4, r3
	ldrh r6, [r6, #0xc]
	cmp r1, r6
	bne _02228138
	movs r0, #0x18
	muls r0, r2, r0
	adds r0, r4, r0
	pop {r3, r4, r5, r6}
	bx lr
_02228138:
	adds r2, r2, #1
	adds r0, #0x18
	adds r3, #0x18
	cmp r2, r5
	blo _02228120
_02228142:
	movs r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov42_02228110

	thumb_func_start ov42_02228148
ov42_02228148: @ 0x02228148
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _02228156
	bl GF_AssertFail
_02228156:
	ldr r0, [r5, #4]
	cmp r4, r0
	blo _02228160
	bl GF_AssertFail
_02228160:
	ldr r2, [r5]
	movs r0, #0x18
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, [r2, r1]
	cmp r0, #1
	bne _02228172
	adds r0, r2, r1
	pop {r3, r4, r5, pc}
_02228172:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov42_02228148

	thumb_func_start ov42_02228178
ov42_02228178: @ 0x02228178
	ldr r3, _0222817C @ =ov42_02228110
	bx r3
	.align 2, 0
_0222817C: .4byte ov42_02228110
	thumb_func_end ov42_02228178

	thumb_func_start ov42_02228180
ov42_02228180: @ 0x02228180
	ldr r3, _02228184 @ =ov42_02228148
	bx r3
	.align 2, 0
_02228184: .4byte ov42_02228148
	thumb_func_end ov42_02228180

	thumb_func_start ov42_02228188
ov42_02228188: @ 0x02228188
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	cmp r4, #0
	bne _02228196
	bl GF_AssertFail
_02228196:
	cmp r6, #0xa
	bhi _022281F0
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022281A6: @ jump table
	.2byte _022281BC - _022281A6 - 2 @ case 0
	.2byte _022281C2 - _022281A6 - 2 @ case 1
	.2byte _022281C8 - _022281A6 - 2 @ case 2
	.2byte _022281CE - _022281A6 - 2 @ case 3
	.2byte _022281D4 - _022281A6 - 2 @ case 4
	.2byte _022281D8 - _022281A6 - 2 @ case 5
	.2byte _022281DC - _022281A6 - 2 @ case 6
	.2byte _022281E0 - _022281A6 - 2 @ case 7
	.2byte _022281E4 - _022281A6 - 2 @ case 8
	.2byte _022281E8 - _022281A6 - 2 @ case 9
	.2byte _022281EC - _022281A6 - 2 @ case 10
_022281BC:
	movs r0, #4
	ldrsh r5, [r4, r0]
	b _022281F4
_022281C2:
	movs r0, #6
	ldrsh r5, [r4, r0]
	b _022281F4
_022281C8:
	movs r0, #8
	ldrsh r5, [r4, r0]
	b _022281F4
_022281CE:
	movs r0, #0xa
	ldrsh r5, [r4, r0]
	b _022281F4
_022281D4:
	ldrh r5, [r4, #0xc]
	b _022281F4
_022281D8:
	ldrb r5, [r4, #0x15]
	b _022281F4
_022281DC:
	ldrb r5, [r4, #0x14]
	b _022281F4
_022281E0:
	ldrh r5, [r4, #0xe]
	b _022281F4
_022281E4:
	ldrh r5, [r4, #0x10]
	b _022281F4
_022281E8:
	ldrh r5, [r4, #0x12]
	b _022281F4
_022281EC:
	ldrh r5, [r4, #0x16]
	b _022281F4
_022281F0:
	bl GF_AssertFail
_022281F4:
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_02228188

	thumb_func_start ov42_022281F8
ov42_022281F8: @ 0x022281F8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	cmp r5, #0
	bne _02228208
	bl GF_AssertFail
_02228208:
	cmp r6, #0xa
	bhi _0222826A
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02228218: @ jump table
	.2byte _0222822E - _02228218 - 2 @ case 0
	.2byte _02228232 - _02228218 - 2 @ case 1
	.2byte _02228236 - _02228218 - 2 @ case 2
	.2byte _0222823A - _02228218 - 2 @ case 3
	.2byte _0222823E - _02228218 - 2 @ case 4
	.2byte _02228242 - _02228218 - 2 @ case 5
	.2byte _0222824E - _02228218 - 2 @ case 6
	.2byte _0222825A - _02228218 - 2 @ case 7
	.2byte _0222825E - _02228218 - 2 @ case 8
	.2byte _02228262 - _02228218 - 2 @ case 9
	.2byte _02228266 - _02228218 - 2 @ case 10
_0222822E:
	strh r4, [r5, #4]
	pop {r4, r5, r6, pc}
_02228232:
	strh r4, [r5, #6]
	pop {r4, r5, r6, pc}
_02228236:
	strh r4, [r5, #8]
	pop {r4, r5, r6, pc}
_0222823A:
	strh r4, [r5, #0xa]
	pop {r4, r5, r6, pc}
_0222823E:
	strh r4, [r5, #0xc]
	pop {r4, r5, r6, pc}
_02228242:
	cmp r4, #0xc
	blt _0222824A
	bl GF_AssertFail
_0222824A:
	strb r4, [r5, #0x15]
	pop {r4, r5, r6, pc}
_0222824E:
	cmp r4, #4
	blt _02228256
	bl GF_AssertFail
_02228256:
	strb r4, [r5, #0x14]
	pop {r4, r5, r6, pc}
_0222825A:
	strh r4, [r5, #0xe]
	pop {r4, r5, r6, pc}
_0222825E:
	strh r4, [r5, #0x10]
	pop {r4, r5, r6, pc}
_02228262:
	strh r4, [r5, #0x12]
	pop {r4, r5, r6, pc}
_02228266:
	strh r4, [r5, #0x16]
	pop {r4, r5, r6, pc}
_0222826A:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_022281F8

	thumb_func_start ov42_02228270
ov42_02228270: @ 0x02228270
	push {r0, r1, r2, r3}
	lsls r0, r1, #1
	add r2, sp, #0
	movs r1, #0
	ldrsh r3, [r2, r1]
	ldr r1, _0222829C @ =0x02229E0C
	ldrsb r1, [r1, r0]
	adds r1, r3, r1
	strh r1, [r2]
	movs r1, #2
	ldrsh r3, [r2, r1]
	ldr r1, _022282A0 @ =0x02229E0D
	ldrsb r0, [r1, r0]
	adds r0, r3, r0
	strh r0, [r2, #2]
	ldrh r1, [r2, #2]
	ldrh r0, [r2]
	lsls r1, r1, #0x10
	orrs r0, r1
	add sp, #0x10
	bx lr
	nop
_0222829C: .4byte 0x02229E0C
_022282A0: .4byte 0x02229E0D
	thumb_func_end ov42_02228270

	thumb_func_start ov42_022282A4
ov42_022282A4: @ 0x022282A4
	ldr r1, _022282AC @ =0x02229E08
	ldrb r0, [r1, r0]
	bx lr
	nop
_022282AC: .4byte 0x02229E08
	thumb_func_end ov42_022282A4

	thumb_func_start ov42_022282B0
ov42_022282B0: @ 0x022282B0
	push {r4, lr}
	ldr r4, [r0, #4]
	movs r1, #0
	cmp r4, #0
	bls _022282D4
	ldr r3, [r0]
	adds r2, r3, #0
_022282BE:
	ldr r0, [r2]
	cmp r0, #0
	bne _022282CC
	movs r0, #0x18
	muls r0, r1, r0
	adds r0, r3, r0
	pop {r4, pc}
_022282CC:
	adds r1, r1, #1
	adds r2, #0x18
	cmp r1, r4
	blo _022282BE
_022282D4:
	bl GF_AssertFail
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov42_022282B0

	thumb_func_start ov42_022282DC
ov42_022282DC: @ 0x022282DC
	ldrh r1, [r0, #6]
	ldrh r0, [r0, #4]
	lsls r1, r1, #0x10
	orrs r0, r1
	bx lr
	.align 2, 0
	thumb_func_end ov42_022282DC

	thumb_func_start ov42_022282E8
ov42_022282E8: @ 0x022282E8
	ldrh r1, [r0, #0xa]
	ldrh r0, [r0, #8]
	lsls r1, r1, #0x10
	orrs r0, r1
	bx lr
	.align 2, 0
	thumb_func_end ov42_022282E8

	thumb_func_start ov42_022282F4
ov42_022282F4: @ 0x022282F4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r1, #8
	bl ov42_02228188
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #9
	bl ov42_02228188
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1, #4]
	lsrs r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #6]
	strh r0, [r1, #0xe]
	adds r0, r5, #0
	bl ov42_022282E8
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	movs r2, #8
	strh r0, [r1, #8]
	ldrh r0, [r1, #2]
	strh r0, [r1, #0xa]
	movs r0, #0xc
	ldrsh r3, [r1, r0]
	ldrsh r2, [r1, r2]
	subs r2, r3, r2
	strh r2, [r1, #0xc]
	movs r2, #0xa
	ldrsh r5, [r1, r2]
	movs r2, #0xe
	ldrsh r2, [r1, r2]
	subs r2, r2, r5
	strh r2, [r1, #0xe]
	cmp r4, #0
	ble _02228372
	ldrsh r0, [r1, r0]
	adds r1, r6, #0
	muls r0, r4, r0
	blx FUN_020F2998
	add r1, sp, #0
	strh r0, [r1, #0xc]
	movs r0, #0xe
	ldrsh r0, [r1, r0]
	adds r1, r6, #0
	muls r0, r4, r0
	blx FUN_020F2998
	add r1, sp, #0
	b _02228376
_02228372:
	movs r0, #0
	strh r0, [r1, #0xc]
_02228376:
	strh r0, [r1, #0xe]
	add r1, sp, #0
	movs r0, #0xc
	ldrsh r2, [r1, r0]
	movs r0, #8
	ldrsh r0, [r1, r0]
	adds r0, r2, r0
	strh r0, [r1, #0xc]
	movs r0, #0xe
	ldrsh r0, [r1, r0]
	adds r0, r0, r5
	strh r0, [r1, #0xe]
	ldrh r2, [r1, #0xe]
	ldrh r0, [r1, #0xc]
	lsls r1, r2, #0x10
	orrs r0, r1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov42_022282F4

	thumb_func_start ov42_0222839C
ov42_0222839C: @ 0x0222839C
	push {r0, r1, r2, r3}
	add r1, sp, #0
	ldrh r2, [r1, #4]
	strh r2, [r0, #4]
	ldrh r1, [r1, #6]
	strh r1, [r0, #6]
	add sp, #0x10
	bx lr
	thumb_func_end ov42_0222839C

	thumb_func_start ov42_022283AC
ov42_022283AC: @ 0x022283AC
	push {r0, r1, r2, r3}
	add r1, sp, #0
	ldrh r2, [r1, #4]
	strh r2, [r0, #8]
	ldrh r1, [r1, #6]
	strh r1, [r0, #0xa]
	add sp, #0x10
	bx lr
	thumb_func_end ov42_022283AC

	thumb_func_start ov42_022283BC
ov42_022283BC: @ 0x022283BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r5, r0, #0
	str r1, [sp]
	adds r4, r2, #0
	bl ov42_022282DC
	add r1, sp, #0x10
	strh r0, [r1, #0xc]
	lsrs r0, r0, #0x10
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0xc]
	mov r2, sp
	subs r2, r2, #4
	strh r0, [r1, #0x1c]
	ldrh r0, [r1, #0xe]
	strh r0, [r1, #0x1e]
	ldrh r0, [r1, #0x1c]
	strh r0, [r2]
	ldrh r0, [r1, #0x1e]
	adds r1, r4, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228270
	add r1, sp, #0x10
	strh r0, [r1, #8]
	lsrs r0, r0, #0x10
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #8]
	strh r0, [r1, #0x14]
	ldrh r0, [r1, #0xa]
	strh r0, [r1, #0x16]
	adds r0, r5, #0
	movs r1, #4
	bl ov42_02228188
	str r0, [sp, #4]
	ldr r0, [sp]
	bl ov42_022280A8
	movs r5, #0
	str r0, [sp, #8]
	cmp r0, #0
	bls _0222849C
	add r4, sp, #0x10
	movs r0, #0x16
	ldrsh r7, [r4, r0]
	movs r0, #0x14
	ldrsh r0, [r4, r0]
	str r0, [sp, #0xc]
_02228422:
	lsls r1, r5, #0x10
	ldr r0, [sp]
	lsrs r1, r1, #0x10
	bl ov42_02228180
	adds r6, r0, #0
	beq _02228494
	movs r1, #4
	bl ov42_02228188
	ldr r1, [sp, #4]
	cmp r0, r1
	beq _02228494
	adds r0, r6, #0
	bl ov42_022282DC
	strh r0, [r4, #4]
	lsrs r0, r0, #0x10
	strh r0, [r4, #6]
	ldrh r0, [r4, #4]
	strh r0, [r4, #0x18]
	ldrh r0, [r4, #6]
	strh r0, [r4, #0x1a]
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bne _02228468
	movs r0, #0x1a
	ldrsh r0, [r4, r0]
	cmp r0, r7
	bne _02228468
	add sp, #0x30
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02228468:
	adds r0, r6, #0
	bl ov42_022282E8
	strh r0, [r4]
	lsrs r0, r0, #0x10
	strh r0, [r4, #2]
	ldrh r0, [r4]
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #2]
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bne _02228494
	movs r0, #0x12
	ldrsh r0, [r4, r0]
	cmp r0, r7
	bne _02228494
	add sp, #0x30
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02228494:
	ldr r0, [sp, #8]
	adds r5, r5, #1
	cmp r5, r0
	blo _02228422
_0222849C:
	movs r0, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov42_022283BC

	thumb_func_start ov42_022284A4
ov42_022284A4: @ 0x022284A4
	push {r0, r1, r2, r3}
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r2, sp, #0x30
	movs r1, #6
	str r0, [sp]
	ldrsh r6, [r2, r1]
	bl ov42_022280A8
	movs r5, #0
	str r0, [sp, #8]
	cmp r0, #0
	bls _0222853C
	add r1, sp, #0x30
	movs r0, #4
	ldrsh r7, [r1, r0]
	add r4, sp, #0xc
_022284C6:
	lsls r1, r5, #0x10
	ldr r0, [sp]
	lsrs r1, r1, #0x10
	bl ov42_02228180
	str r0, [sp, #4]
	cmp r0, #0
	beq _02228534
	bl ov42_022282DC
	strh r0, [r4, #4]
	lsrs r0, r0, #0x10
	strh r0, [r4, #6]
	ldrh r0, [r4, #4]
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #6]
	strh r0, [r4, #0xe]
	movs r0, #0xc
	ldrsh r0, [r4, r0]
	cmp r0, r7
	bne _02228504
	movs r0, #0xe
	ldrsh r0, [r4, r0]
	cmp r0, r6
	bne _02228504
	ldr r0, [sp, #4]
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
_02228504:
	ldr r0, [sp, #4]
	bl ov42_022282E8
	strh r0, [r4]
	lsrs r0, r0, #0x10
	strh r0, [r4, #2]
	ldrh r0, [r4]
	strh r0, [r4, #8]
	ldrh r0, [r4, #2]
	strh r0, [r4, #0xa]
	movs r0, #8
	ldrsh r0, [r4, r0]
	cmp r0, r7
	bne _02228534
	movs r0, #0xa
	ldrsh r0, [r4, r0]
	cmp r0, r6
	bne _02228534
	ldr r0, [sp, #4]
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
_02228534:
	ldr r0, [sp, #8]
	adds r5, r5, #1
	cmp r5, r0
	blo _022284C6
_0222853C:
	movs r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_022284A4

	thumb_func_start ov42_02228548
ov42_02228548: @ 0x02228548
	push {r3, r4, r5, lr}
	adds r3, r1, #0
	ldrh r1, [r3]
	mov r2, sp
	subs r2, r2, #4
	strh r1, [r2]
	ldrh r1, [r3, #2]
	adds r4, r0, #0
	strh r1, [r2, #2]
	ldr r1, [r2]
	ldrb r2, [r3, #6]
	ldrh r3, [r3, #4]
	lsls r5, r3, #2
	ldr r3, _02228570 @ =0x02229E14
	ldr r3, [r3, r5]
	blx r3
	movs r0, #0
	strh r0, [r4, #0x16]
	pop {r3, r4, r5, pc}
	nop
_02228570: .4byte 0x02229E14
	thumb_func_end ov42_02228548

	thumb_func_start ov42_02228574
ov42_02228574: @ 0x02228574
	push {r4, lr}
	movs r1, #5
	adds r4, r0, #0
	bl ov42_02228188
	adds r1, r0, #0
	lsls r2, r1, #2
	ldr r1, _022285A0 @ =0x02229E44
	adds r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
	ldrh r1, [r4, #0x16]
	adds r1, r1, #1
	strh r1, [r4, #0x16]
	cmp r0, #1
	bne _0222859E
	adds r0, r4, #0
	bl ov42_02228C40
	movs r0, #0
	strh r0, [r4, #0x16]
_0222859E:
	pop {r4, pc}
	.align 2, 0
_022285A0: .4byte 0x02229E44
	thumb_func_end ov42_02228574

	thumb_func_start ov42_022285A4
ov42_022285A4: @ 0x022285A4
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r5, #0
	bne _022285B4
	bl GF_AssertFail
_022285B4:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	adds r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	subs r3, r3, #4
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_022285A4

	thumb_func_start ov42_022285FC
ov42_022285FC: @ 0x022285FC
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r5, #0
	bne _0222860C
	bl GF_AssertFail
_0222860C:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	adds r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	subs r3, r3, #4
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #5
	movs r2, #1
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #9
	movs r2, #2
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_022285FC

	thumb_func_start ov42_02228668
ov42_02228668: @ 0x02228668
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r5, #0
	bne _0222867A
	bl GF_AssertFail
_0222867A:
	add r0, sp, #0x18
	ldrh r1, [r0, #4]
	mov r2, sp
	subs r2, r2, #4
	strh r1, [r2]
	ldrh r0, [r0, #6]
	adds r1, r4, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228BDC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	subs r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	add r1, sp, #0x18
	ldrh r2, [r1, #4]
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0
	mov r3, sp
	ldrh r2, [r1, #4]
	subs r3, r3, #4
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #5
	movs r2, #2
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #9
	movs r2, #8
	bl ov42_022281F8
	add sp, #8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.align 2, 0
	thumb_func_end ov42_02228668

	thumb_func_start ov42_02228700
ov42_02228700: @ 0x02228700
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r5, #0
	bne _02228712
	bl GF_AssertFail
_02228712:
	add r0, sp, #0x18
	ldrh r1, [r0, #4]
	mov r2, sp
	subs r2, r2, #4
	strh r1, [r2]
	ldrh r0, [r0, #6]
	adds r1, r4, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228BDC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	subs r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	add r1, sp, #0x18
	ldrh r2, [r1, #4]
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0
	mov r3, sp
	ldrh r2, [r1, #4]
	subs r3, r3, #4
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #5
	movs r2, #3
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #9
	movs r2, #4
	bl ov42_022281F8
	add sp, #8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.align 2, 0
	thumb_func_end ov42_02228700

	thumb_func_start ov42_02228798
ov42_02228798: @ 0x02228798
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r5, #0
	bne _022287A8
	bl GF_AssertFail
_022287A8:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	adds r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	subs r3, r3, #4
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #5
	movs r2, #4
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_02228798

	thumb_func_start ov42_022287F0
ov42_022287F0: @ 0x022287F0
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r5, #0
	bne _02228800
	bl GF_AssertFail
_02228800:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	adds r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	subs r3, r3, #4
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	bl ov42_022281F8
	movs r1, #5
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #9
	movs r2, #0x10
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_022287F0

	thumb_func_start ov42_0222885C
ov42_0222885C: @ 0x0222885C
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r5, #0
	bne _0222886E
	bl GF_AssertFail
_0222886E:
	add r0, sp, #0x18
	ldrh r1, [r0, #4]
	mov r2, sp
	subs r2, r2, #4
	strh r1, [r2]
	ldrh r0, [r0, #6]
	adds r1, r4, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228BDC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	subs r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	add r1, sp, #0x18
	ldrh r2, [r1, #4]
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0
	mov r3, sp
	ldrh r2, [r1, #4]
	subs r3, r3, #4
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #5
	movs r2, #6
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #9
	movs r2, #0x10
	bl ov42_022281F8
	add sp, #8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.align 2, 0
	thumb_func_end ov42_0222885C

	thumb_func_start ov42_022288F4
ov42_022288F4: @ 0x022288F4
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r5, #0
	bne _02228906
	bl GF_AssertFail
_02228906:
	add r0, sp, #0x18
	ldrh r1, [r0, #4]
	mov r2, sp
	subs r2, r2, #4
	strh r1, [r2]
	ldrh r0, [r0, #6]
	adds r1, r4, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228BDC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	subs r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	add r1, sp, #0x18
	ldrh r2, [r1, #4]
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0
	mov r3, sp
	ldrh r2, [r1, #4]
	subs r3, r3, #4
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #5
	movs r2, #7
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #9
	movs r2, #4
	bl ov42_022281F8
	add sp, #8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.align 2, 0
	thumb_func_end ov42_022288F4

	thumb_func_start ov42_0222898C
ov42_0222898C: @ 0x0222898C
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r5, #0
	bne _0222899C
	bl GF_AssertFail
_0222899C:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	adds r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	subs r3, r3, #4
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #5
	movs r2, #8
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #9
	movs r2, #2
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_0222898C

	thumb_func_start ov42_022289F8
ov42_022289F8: @ 0x022289F8
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r5, #0
	bne _02228A08
	bl GF_AssertFail
_02228A08:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	adds r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	subs r3, r3, #4
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #5
	movs r2, #9
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #9
	movs r2, #4
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_022289F8

	thumb_func_start ov42_02228A64
ov42_02228A64: @ 0x02228A64
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r5, #0
	bne _02228A74
	bl GF_AssertFail
_02228A74:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	adds r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	subs r3, r3, #4
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0xa
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #9
	movs r2, #8
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_02228A64

	thumb_func_start ov42_02228AD0
ov42_02228AD0: @ 0x02228AD0
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r5, #0
	bne _02228AE0
	bl GF_AssertFail
_02228AE0:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	adds r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	subs r3, r3, #4
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0xb
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl ov42_022281F8
	adds r0, r5, #0
	movs r1, #9
	movs r2, #0x10
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_02228AD0

	thumb_func_start ov42_02228B3C
ov42_02228B3C: @ 0x02228B3C
	movs r0, #0
	bx lr
	thumb_func_end ov42_02228B3C

	thumb_func_start ov42_02228B40
ov42_02228B40: @ 0x02228B40
	ldr r3, _02228B44 @ =ov42_02228C0C
	bx r3
	.align 2, 0
_02228B44: .4byte ov42_02228C0C
	thumb_func_end ov42_02228B40

	thumb_func_start ov42_02228B48
ov42_02228B48: @ 0x02228B48
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl ov42_02228C0C
	adds r4, r0, #0
	cmp r4, #1
	bne _02228B82
	adds r0, r5, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	subs r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	ldrh r2, [r1, #4]
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
_02228B82:
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02228B48

	thumb_func_start ov42_02228B88
ov42_02228B88: @ 0x02228B88
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl ov42_02228C0C
	adds r4, r0, #0
	cmp r4, #1
	bne _02228BC2
	adds r0, r5, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	subs r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	ldrh r2, [r1, #4]
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
_02228BC2:
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02228B88

	thumb_func_start ov42_02228BC8
ov42_02228BC8: @ 0x02228BC8
	movs r0, #0
	bx lr
	thumb_func_end ov42_02228BC8

	thumb_func_start ov42_02228BCC
ov42_02228BCC: @ 0x02228BCC
	ldr r3, _02228BD0 @ =ov42_02228C0C
	bx r3
	.align 2, 0
_02228BD0: .4byte ov42_02228C0C
	thumb_func_end ov42_02228BCC

	thumb_func_start ov42_02228BD4
ov42_02228BD4: @ 0x02228BD4
	ldr r3, _02228BD8 @ =ov42_02228C0C
	bx r3
	.align 2, 0
_02228BD8: .4byte ov42_02228C0C
	thumb_func_end ov42_02228BD4

	thumb_func_start ov42_02228BDC
ov42_02228BDC: @ 0x02228BDC
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r0, sp, #8
	ldrh r2, [r0]
	mov r3, sp
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r0, [r0, #2]
	strh r0, [r3, #2]
	ldr r0, [r3]
	bl ov42_02228270
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r2, [r1, #2]
	ldrh r0, [r1]
	lsls r1, r2, #0x10
	orrs r0, r1
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_02228BDC

	thumb_func_start ov42_02228C0C
ov42_02228C0C: @ 0x02228C0C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #8
	bl ov42_02228188
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #9
	bl ov42_02228188
	adds r6, r0, #0
	cmp r4, r6
	bge _02228C3A
	adds r0, r5, #0
	movs r1, #8
	adds r2, r4, #1
	bl ov42_022281F8
	adds r0, r4, #1
	cmp r0, r6
	bge _02228C3A
	movs r0, #0
	pop {r4, r5, r6, pc}
_02228C3A:
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov42_02228C0C

	thumb_func_start ov42_02228C40
ov42_02228C40: @ 0x02228C40
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	adds r0, r4, #0
	movs r1, #6
	bl ov42_02228188
	add r1, sp, #0
	adds r2, r0, #0
	adds r0, r4, #0
	mov r4, sp
	ldrh r3, [r1, #4]
	subs r4, r4, #4
	strh r3, [r4]
	ldrh r1, [r1, #6]
	strh r1, [r4, #2]
	ldr r1, [r4]
	bl ov42_022285A4
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov42_02228C40

	thumb_func_start ov42_02228C80
ov42_02228C80: @ 0x02228C80
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r7, #0
	bne _02228C94
	bl GF_AssertFail
_02228C94:
	cmp r5, #0
	bne _02228C9C
	bl GF_AssertFail
_02228C9C:
	cmp r4, #0
	bne _02228CA4
	bl GF_AssertFail
_02228CA4:
	cmp r6, #0
	bne _02228CAC
	bl GF_AssertFail
_02228CAC:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	bl ov42_02228178
	str r0, [sp, #4]
	cmp r0, #0
	bne _02228CBE
	bl GF_AssertFail
_02228CBE:
	str r6, [sp]
	adds r3, r4, #0
	ldrh r4, [r4]
	adds r2, r5, #0
	ldr r0, [sp, #4]
	lsls r5, r4, #2
	ldr r4, _02228CD8 @ =0x02229E74
	adds r1, r7, #0
	ldr r4, [r4, r5]
	blx r4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228CD8: .4byte 0x02229E74
	thumb_func_end ov42_02228C80

	thumb_func_start ov42_02228CDC
ov42_02228CDC: @ 0x02228CDC
	push {r3, r4, r5, lr}
	movs r1, #5
	adds r5, r0, #0
	adds r4, r3, #0
	bl ov42_02228188
	cmp r0, #0
	beq _02228CF0
	cmp r0, #4
	bne _02228D04
_02228CF0:
	ldrb r0, [r4, #2]
	adds r1, r5, #0
	str r0, [sp]
	ldrh r2, [r4]
	ldrb r3, [r4, #3]
	ldr r0, [sp, #0x10]
	bl ov42_02228EB0
	movs r0, #1
	pop {r3, r4, r5, pc}
_02228D04:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02228CDC

	thumb_func_start ov42_02228D08
ov42_02228D08: @ 0x02228D08
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #5
	adds r4, r3, #0
	bl ov42_02228188
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #6
	bl ov42_02228188
	cmp r6, #0
	bne _02228D3E
	ldrb r1, [r4, #2]
	cmp r0, r1
	beq _02228D3E
	str r1, [sp]
	ldrh r2, [r4]
	ldrb r3, [r4, #3]
	ldr r0, [sp, #0x18]
	adds r1, r5, #0
	bl ov42_02228EB0
	add sp, #4
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_02228D3E:
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov42_02228D08

	thumb_func_start ov42_02228D44
ov42_02228D44: @ 0x02228D44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r1, #0
	movs r1, #5
	adds r5, r0, #0
	str r2, [sp, #4]
	adds r4, r3, #0
	bl ov42_02228188
	adds r6, r0, #0
	bne _02228D8C
	ldrb r2, [r4, #2]
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov42_02228E34
	cmp r0, #1
	beq _02228D8C
	ldrb r2, [r4, #2]
	ldr r1, [sp, #4]
	adds r0, r5, #0
	bl ov42_02228E9C
	cmp r0, #1
	beq _02228D8C
	ldrb r0, [r4, #2]
	adds r1, r5, #0
	str r0, [sp]
	ldrh r2, [r4]
	ldrb r3, [r4, #3]
	ldr r0, [sp, #0x20]
	bl ov42_02228EB0
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02228D8C:
	cmp r6, #0
	bne _02228DB2
	adds r0, r5, #0
	movs r1, #0xa
	bl ov42_02228188
	cmp r0, #8
	blt _02228DB2
	ldrb r0, [r4, #2]
	adds r1, r5, #0
	movs r2, #5
	str r0, [sp]
	ldrb r3, [r4, #3]
	ldr r0, [sp, #0x20]
	bl ov42_02228EB0
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02228DB2:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_02228D44

	thumb_func_start ov42_02228DB8
ov42_02228DB8: @ 0x02228DB8
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	bl ov42_02228D44
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov42_02228DB8

	thumb_func_start ov42_02228DC8
ov42_02228DC8: @ 0x02228DC8
	push {r3, r4, r5, lr}
	movs r1, #5
	adds r5, r0, #0
	adds r4, r3, #0
	bl ov42_02228188
	cmp r0, #0
	bne _02228DEC
	ldrb r0, [r4, #2]
	adds r1, r5, #0
	str r0, [sp]
	ldrh r2, [r4]
	ldrb r3, [r4, #3]
	ldr r0, [sp, #0x10]
	bl ov42_02228EB0
	movs r0, #1
	pop {r3, r4, r5, pc}
_02228DEC:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02228DC8

	thumb_func_start ov42_02228DF0
ov42_02228DF0: @ 0x02228DF0
	push {r3, lr}
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov42_02228DF0

	thumb_func_start ov42_02228DFC
ov42_02228DFC: @ 0x02228DFC
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	bl ov42_02228D44
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov42_02228DFC

	thumb_func_start ov42_02228E0C
ov42_02228E0C: @ 0x02228E0C
	push {r3, r4, r5, lr}
	movs r1, #5
	adds r5, r0, #0
	adds r4, r3, #0
	bl ov42_02228188
	cmp r0, #0
	bne _02228E30
	ldrb r0, [r4, #2]
	adds r1, r5, #0
	str r0, [sp]
	ldrh r2, [r4]
	ldrb r3, [r4, #3]
	ldr r0, [sp, #0x10]
	bl ov42_02228EB0
	movs r0, #1
	pop {r3, r4, r5, pc}
_02228E30:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02228E0C

	thumb_func_start ov42_02228E34
ov42_02228E34: @ 0x02228E34
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r2, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1, #4]
	lsrs r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	mov r2, sp
	subs r2, r2, #4
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #6]
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	ldrh r0, [r1, #0xe]
	adds r1, r5, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228270
	add r2, sp, #0
	strh r0, [r2]
	lsrs r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	movs r1, #8
	strh r0, [r2, #8]
	ldrh r0, [r2, #2]
	strh r0, [r2, #0xa]
	ldrsh r3, [r2, r1]
	adds r0, r4, #0
	asrs r1, r3, #3
	lsrs r1, r1, #0x1c
	adds r1, r3, r1
	movs r3, #0xa
	ldrsh r3, [r2, r3]
	lsls r1, r1, #0xc
	lsrs r1, r1, #0x10
	asrs r2, r3, #3
	lsrs r2, r2, #0x1c
	adds r2, r3, r2
	lsls r2, r2, #0xc
	lsrs r2, r2, #0x10
	bl ov42_02227FA4
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov42_02228E34

	thumb_func_start ov42_02228E9C
ov42_02228E9C: @ 0x02228E9C
	push {r3, lr}
	bl ov42_022283BC
	cmp r0, #0
	beq _02228EAA
	movs r0, #1
	pop {r3, pc}
_02228EAA:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov42_02228E9C

	thumb_func_start ov42_02228EB0
ov42_02228EB0: @ 0x02228EB0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r5]
	ldrh r0, [r1, #2]
	strh r0, [r5, #2]
	strh r4, [r5, #4]
	ldr r0, [sp, #0x18]
	strb r6, [r5, #7]
	strb r0, [r5, #6]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov42_02228EB0

	thumb_func_start ov42_02228EDC
ov42_02228EDC: @ 0x02228EDC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	str r1, [sp]
	ldr r0, [sp, #0x18]
	movs r1, #0xc
	adds r5, r2, #0
	adds r6, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	ldr r1, [sp]
	ldr r3, [sp, #0x18]
	adds r0, r7, #0
	adds r2, r5, #0
	bl ov42_02227060
	str r0, [r4]
	strh r5, [r4, #8]
	ldrh r2, [r4, #8]
	movs r1, #0x14
	ldr r0, [sp, #0x18]
	muls r1, r2, r1
	bl FUN_0201AA8C
	str r0, [r4, #4]
	ldrh r3, [r4, #8]
	movs r2, #0x14
	movs r1, #0
	muls r2, r3, r2
	blx FUN_020E5B44
	movs r0, #2
	strb r0, [r4, #0xa]
	strb r6, [r4, #0xb]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_02228EDC

	thumb_func_start ov42_02228F24
ov42_02228F24: @ 0x02228F24
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, [sp, #0x28]
	adds r7, r0, #0
	str r1, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xc
	adds r6, r2, #0
	str r3, [sp, #8]
	bl FUN_0201AA8C
	adds r4, r0, #0
	ldr r1, [sp, #4]
	adds r0, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl ov42_02227060
	str r0, [r4]
	strh r6, [r4, #8]
	ldrh r2, [r4, #8]
	movs r1, #0x14
	adds r0, r5, #0
	muls r1, r2, r1
	bl FUN_0201AA8C
	str r0, [r4, #4]
	ldrh r3, [r4, #8]
	movs r2, #0x14
	movs r1, #0
	muls r2, r3, r2
	blx FUN_020E5B44
	movs r0, #2
	strb r0, [r4, #0xa]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #8]
	strb r0, [r4, #0xb]
	str r5, [sp]
	ldrb r2, [r4, #0xb]
	ldr r0, [r4]
	ldr r3, [sp, #0x20]
	bl ov42_02227194
	ldrb r1, [r4, #0xb]
	ldr r0, [r4]
	ldr r2, _02228F90 @ =0x00009C41
	adds r3, r5, #0
	bl ov42_0222729C
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02228F90: .4byte 0x00009C41
	thumb_func_end ov42_02228F24

	thumb_func_start ov42_02228F94
ov42_02228F94: @ 0x02228F94
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #8]
	movs r6, #0
	cmp r0, #0
	ble _02228FC0
	adds r4, r6, #0
_02228FA2:
	ldr r0, [r5, #4]
	adds r0, r0, r4
	bl ov42_02229274
	cmp r0, #0
	bne _02228FB6
	ldr r0, [r5, #4]
	adds r0, r0, r4
	bl ov42_022290C4
_02228FB6:
	ldrh r0, [r5, #8]
	adds r6, r6, #1
	adds r4, #0x14
	cmp r6, r0
	blt _02228FA2
_02228FC0:
	ldr r0, [r5]
	bl ov42_022272B4
	adds r0, r5, #0
	bl ov42_0222901C
	ldr r0, [r5]
	bl ov42_02227114
	ldr r0, [r5, #4]
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_02228F94

	thumb_func_start ov42_02228FE0
ov42_02228FE0: @ 0x02228FE0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	bl ov42_022271E4
	cmp r0, #0
	bne _02229002
	str r4, [sp]
	ldrb r2, [r5, #0xb]
	ldr r0, [r5]
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov42_02227194
_02229002:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_02228FE0

	thumb_func_start ov42_02229004
ov42_02229004: @ 0x02229004
	ldr r3, _0222900C @ =ov42_022271D0
	ldr r0, [r0]
	bx r3
	nop
_0222900C: .4byte ov42_022271D0
	thumb_func_end ov42_02229004

	thumb_func_start ov42_02229010
ov42_02229010: @ 0x02229010
	ldr r3, _02229018 @ =ov42_022271E4
	ldr r0, [r0]
	bx r3
	nop
_02229018: .4byte ov42_022271E4
	thumb_func_end ov42_02229010

	thumb_func_start ov42_0222901C
ov42_0222901C: @ 0x0222901C
	ldr r3, _02229024 @ =ov42_022271F8
	ldr r0, [r0]
	bx r3
	nop
_02229024: .4byte ov42_022271F8
	thumb_func_end ov42_0222901C

	thumb_func_start ov42_02229028
ov42_02229028: @ 0x02229028
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r1, [r5, #0xb]
	adds r3, r2, #0
	ldr r0, [r5]
	adds r2, r4, #0
	bl ov42_02227228
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02229028

	thumb_func_start ov42_0222903C
ov42_0222903C: @ 0x0222903C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r6, r0, #0
	adds r7, r2, #0
	str r3, [sp]
	bl ov42_02229284
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #5
	bl ov42_02228188
	strh r0, [r4, #8]
	adds r0, r5, #0
	movs r1, #6
	bl ov42_02228188
	strh r0, [r4, #0xa]
	adds r0, r5, #0
	movs r1, #4
	bl ov42_02228188
	strh r0, [r4, #0xc]
	str r5, [r4]
	strb r7, [r4, #0x12]
	movs r0, #1
	strb r0, [r4, #0x13]
	movs r1, #0
	strh r1, [r4, #0xe]
	adds r0, r5, #0
	strh r1, [r4, #0x10]
	bl ov42_02228188
	add r1, sp, #4
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #1
	bl ov42_02228188
	add r1, sp, #4
	strh r0, [r1, #2]
	movs r0, #2
	ldrsh r0, [r1, r0]
	ldrb r1, [r4, #0x12]
	bl ov42_0222922C
	add r1, sp, #4
	strh r0, [r1, #4]
	ldrb r0, [r6, #0xa]
	strh r0, [r1, #6]
	adds r0, r5, #0
	movs r1, #7
	bl ov42_02228188
	adds r2, r0, #0
	ldr r0, [r6]
	ldr r3, [sp]
	add r1, sp, #4
	bl ov42_022272BC
	str r0, [r4, #4]
	adds r0, r4, #0
	bl ov42_0222910C
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov42_0222903C

	thumb_func_start ov42_022290C4
ov42_022290C4: @ 0x022290C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl ov42_0222740C
	movs r1, #0x14
	movs r0, #0
_022290D2:
	strb r0, [r4]
	adds r4, r4, #1
	subs r1, r1, #1
	bne _022290D2
	pop {r4, pc}
	thumb_func_end ov42_022290C4

	thumb_func_start ov42_022290DC
ov42_022290DC: @ 0x022290DC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #8]
	movs r6, #0
	cmp r0, #0
	ble _02229108
	adds r4, r6, #0
_022290EA:
	ldr r0, [r5, #4]
	adds r0, r0, r4
	bl ov42_02229274
	cmp r0, #0
	bne _022290FE
	ldr r0, [r5, #4]
	adds r0, r0, r4
	bl ov42_0222910C
_022290FE:
	ldrh r0, [r5, #8]
	adds r6, r6, #1
	adds r4, #0x14
	cmp r6, r0
	blt _022290EA
_02229108:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov42_022290DC

	thumb_func_start ov42_0222910C
ov42_0222910C: @ 0x0222910C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _02229196
	ldr r0, [r5]
	movs r1, #5
	bl ov42_02228188
	adds r6, r0, #0
	ldr r0, [r5]
	movs r1, #6
	bl ov42_02228188
	adds r4, r0, #0
	ldr r0, [r5]
	movs r1, #8
	bl ov42_02228188
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	ldrh r0, [r5, #8]
	cmp r0, r6
	bne _02229148
	ldrh r0, [r5, #0xa]
	cmp r0, r4
	bne _02229148
	cmp r1, #0
	bne _0222915E
_02229148:
	strh r6, [r5, #8]
	strh r4, [r5, #0xa]
	ldr r0, [r5, #4]
	adds r1, r6, #0
	bl ov42_022292BC
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov42_02229308
_0222915E:
	add r1, sp, #0
	adds r0, r5, #0
	adds r1, #2
	add r2, sp, #0
	bl ov42_022292D8
	add r3, sp, #0
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r5, #4]
	bl ov42_02227434
	add r1, sp, #0
	movs r0, #0
	ldrsh r0, [r1, r0]
	ldrb r1, [r5, #0x12]
	bl ov42_0222922C
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, [r5, #4]
	bl ov42_02227474
	ldr r0, [r5, #4]
	bl ov42_02227538
_02229196:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov42_0222910C

	thumb_func_start ov42_0222919C
ov42_0222919C: @ 0x0222919C
	strb r1, [r0, #0x13]
	bx lr
	thumb_func_end ov42_0222919C

	thumb_func_start ov42_022291A0
ov42_022291A0: @ 0x022291A0
	ldr r3, _022291A8 @ =ov42_02229308
	movs r1, #1
	ldrh r2, [r0, #0xa]
	bx r3
	.align 2, 0
_022291A8: .4byte ov42_02229308
	thumb_func_end ov42_022291A0

	thumb_func_start ov42_022291AC
ov42_022291AC: @ 0x022291AC
	ldr r3, _022291B4 @ =ov42_02227538
	ldr r0, [r0, #4]
	bx r3
	nop
_022291B4: .4byte ov42_02227538
	thumb_func_end ov42_022291AC

	thumb_func_start ov42_022291B8
ov42_022291B8: @ 0x022291B8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #8]
	ldr r0, [r4, #4]
	bl ov42_022292BC
	adds r1, r0, #0
	ldrh r2, [r4, #0xa]
	adds r0, r4, #0
	bl ov42_02229308
	adds r0, r4, #0
	bl ov42_0222910C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov42_022291B8

	thumb_func_start ov42_022291D8
ov42_022291D8: @ 0x022291D8
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r3, sp, #8
	movs r1, #4
	movs r2, #6
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r0, #4]
	bl ov42_02227434
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_022291D8

	thumb_func_start ov42_022291F4
ov42_022291F4: @ 0x022291F4
	ldr r3, _022291FC @ =ov42_022274AC
	ldr r0, [r0, #4]
	bx r3
	nop
_022291FC: .4byte ov42_022274AC
	thumb_func_end ov42_022291F4

	thumb_func_start ov42_02229200
ov42_02229200: @ 0x02229200
	ldr r3, _02229208 @ =ov42_02227490
	ldr r0, [r0, #4]
	bx r3
	nop
_02229208: .4byte ov42_02227490
	thumb_func_end ov42_02229200

	thumb_func_start ov42_0222920C
ov42_0222920C: @ 0x0222920C
	ldr r3, _02229214 @ =ov42_02227480
	ldr r0, [r0, #4]
	bx r3
	nop
_02229214: .4byte ov42_02227480
	thumb_func_end ov42_0222920C

	thumb_func_start ov42_02229218
ov42_02229218: @ 0x02229218
	push {r4, lr}
	adds r2, r1, #0
	adds r4, r0, #0
	movs r1, #0
	bl ov42_02229308
	ldr r0, [r4, #4]
	bl ov42_02227538
	pop {r4, pc}
	thumb_func_end ov42_02229218

	thumb_func_start ov42_0222922C
ov42_0222922C: @ 0x0222922C
	cmp r1, #1
	bne _02229238
	lsls r1, r0, #1
	ldr r0, _02229240 @ =0x00009C40
	subs r0, r0, r1
	bx lr
_02229238:
	lsls r1, r0, #1
	ldr r0, _02229244 @ =0x00009C41
	subs r0, r0, r1
	bx lr
	.align 2, 0
_02229240: .4byte 0x00009C40
_02229244: .4byte 0x00009C41
	thumb_func_end ov42_0222922C

	thumb_func_start ov42_02229248
ov42_02229248: @ 0x02229248
	push {r3, lr}
	ldr r0, [r0, #4]
	bl ov42_02227430
	bl FUN_02024ACC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov42_02229248

	thumb_func_start ov42_02229258
ov42_02229258: @ 0x02229258
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r3, sp, #8
	movs r1, #4
	movs r2, #6
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r0, #4]
	bl ov42_022274DC
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_02229258

	thumb_func_start ov42_02229274
ov42_02229274: @ 0x02229274
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0222927E
	movs r0, #1
	bx lr
_0222927E:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov42_02229274

	thumb_func_start ov42_02229284
ov42_02229284: @ 0x02229284
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #8]
	movs r6, #0
	cmp r0, #0
	ble _022292B2
	adds r4, r6, #0
_02229292:
	ldr r0, [r5, #4]
	adds r0, r0, r4
	bl ov42_02229274
	cmp r0, #1
	bne _022292A8
	movs r0, #0x14
	ldr r1, [r5, #4]
	muls r0, r6, r0
	adds r0, r1, r0
	pop {r4, r5, r6, pc}
_022292A8:
	ldrh r0, [r5, #8]
	adds r6, r6, #1
	adds r4, #0x14
	cmp r6, r0
	blt _02229292
_022292B2:
	bl GF_AssertFail
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov42_02229284

	thumb_func_start ov42_022292BC
ov42_022292BC: @ 0x022292BC
	push {r4, lr}
	adds r4, r1, #0
	bl ov42_022274B8
	cmp r0, #2
	bne _022292CC
	movs r0, #0
	pop {r4, pc}
_022292CC:
	ldr r0, _022292D4 @ =0x02229EB0
	ldrb r0, [r0, r4]
	pop {r4, pc}
	nop
_022292D4: .4byte 0x02229EB0
	thumb_func_end ov42_022292BC

	thumb_func_start ov42_022292D8
ov42_022292D8: @ 0x022292D8
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r0, [r0]
	adds r5, r1, #0
	adds r4, r2, #0
	bl ov42_022282F4
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	movs r0, #4
	ldrsh r0, [r1, r0]
	strh r0, [r5]
	movs r0, #6
	ldrsh r0, [r1, r0]
	strh r0, [r4]
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov42_022292D8

	thumb_func_start ov42_02229308
ov42_02229308: @ 0x02229308
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	str r2, [sp]
	bl ov42_022274D0
	adds r7, r0, #0
	ldr r0, [r5, #4]
	bl ov42_022274C0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, [r5, #4]
	ldr r2, [sp]
	adds r1, r4, #0
	bl ov42_02227504
	cmp r6, r4
	beq _02229352
	ldr r0, _02229354 @ =0x02229EA4
	ldrb r0, [r0, r4]
	cmp r0, #1
	bne _02229346
	ldrh r0, [r5, #0x10]
	cmp r0, r4
	bne _02229346
	ldrh r1, [r5, #0xe]
	ldr r0, [r5, #4]
	bl ov42_022274C4
_02229346:
	ldr r0, _02229354 @ =0x02229EA4
	ldrb r0, [r0, r6]
	cmp r0, #1
	bne _02229352
	strh r6, [r5, #0x10]
	strh r7, [r5, #0xe]
_02229352:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02229354: .4byte 0x02229EA4
	thumb_func_end ov42_02229308

	thumb_func_start ov42_02229358
ov42_02229358: @ 0x02229358
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, r1, #0
	bl ov42_022282F4
	add r3, sp, #0
	strh r0, [r3]
	lsrs r0, r0, #0x10
	strh r0, [r3, #2]
	ldrh r0, [r3]
	movs r1, #6
	movs r2, #4
	strh r0, [r3, #4]
	ldrh r0, [r3, #2]
	strh r0, [r3, #6]
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	adds r0, r4, #0
	subs r1, #0x60
	subs r2, #0x70
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov42_022293A0
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov42_02229358

	thumb_func_start ov42_02229394
ov42_02229394: @ 0x02229394
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	bx lr
	thumb_func_end ov42_02229394

	thumb_func_start ov42_022293A0
ov42_022293A0: @ 0x022293A0
	strh r1, [r0]
	strh r2, [r0, #2]
	bx lr
	.align 2, 0
	thumb_func_end ov42_022293A0

	thumb_func_start ov42_022293A8
ov42_022293A8: @ 0x022293A8
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
	thumb_func_end ov42_022293A8

	thumb_func_start ov42_022293B0
ov42_022293B0: @ 0x022293B0
	movs r1, #2
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
	thumb_func_end ov42_022293B0

	thumb_func_start ov42_022293B8
ov42_022293B8: @ 0x022293B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	adds r0, r3, #0
	movs r1, #0x1c
	adds r5, r2, #0
	str r3, [sp, #4]
	bl FUN_0201AA8C
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #0x1c
	movs r0, #0
_022293D4:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _022293D4
	str r6, [r4]
	str r7, [r4, #4]
	ldrb r0, [r5]
	adds r2, r5, #0
	str r0, [r4, #0x10]
	ldrb r1, [r5, #1]
	str r1, [r4, #0x14]
	ldr r0, [r4, #4]
	bl ov42_02229514
	ldr r0, [sp, #4]
	adds r3, r4, #0
	str r0, [sp]
	ldrb r0, [r5, #8]
	ldrb r1, [r5, #9]
	ldrb r2, [r5, #0xa]
	adds r3, #0xc
	bl FUN_020079D8
	str r0, [r4, #8]
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov42_022293B8

	thumb_func_start ov42_0222940C
ov42_0222940C: @ 0x0222940C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov42_0222940C

	thumb_func_start ov42_02229420
ov42_02229420: @ 0x02229420
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov42_022293A8
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov42_022293B0
	adds r4, r0, #0
	ldr r0, [r6, #0x10]
	cmp r0, #0
	bne _022294A0
	cmp r5, #0
	ble _02229454
	lsls r0, r5, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02229462
_02229454:
	lsls r0, r5, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02229462:
	adds r7, r0, #0
	cmp r4, #0
	ble _0222947A
	lsls r0, r4, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02229488
_0222947A:
	lsls r0, r4, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02229488:
	blx FUN_020F2104
	str r0, [sp]
	adds r0, r7, #0
	blx FUN_020F2104
	adds r2, r0, #0
	ldr r0, [r6]
	ldr r1, [sp]
	bl FUN_02009FA8
	b _02229506
_022294A0:
	cmp r5, #0
	ble _022294B6
	lsls r0, r5, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022294C4
_022294B6:
	lsls r0, r5, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022294C4:
	adds r7, r0, #0
	cmp r4, #0
	ble _022294DC
	lsls r0, r4, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022294EA
_022294DC:
	lsls r0, r4, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022294EA:
	blx FUN_020F2104
	str r0, [sp, #4]
	adds r0, r7, #0
	blx FUN_020F2104
	movs r2, #3
	adds r3, r0, #0
	lsls r2, r2, #0x12
	ldr r0, [r6]
	ldr r1, [sp, #4]
	adds r2, r3, r2
	bl FUN_02009FC8
_02229506:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl ov42_02229570
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_02229420

	thumb_func_start ov42_02229514
ov42_02229514: @ 0x02229514
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	ldr r6, _0222956C @ =0x02229EBC
	adds r5, r0, #0
	adds r4, r1, #0
	ldm r6!, {r0, r1}
	add r3, sp, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	ldrb r1, [r2, #2]
	add r0, sp, #0
	strb r1, [r0, #0x11]
	ldrb r1, [r2, #3]
	strb r1, [r0, #0x12]
	ldrb r1, [r2, #4]
	strb r1, [r0, #0x13]
	ldrb r1, [r2, #5]
	strb r1, [r0, #0x14]
	ldrb r1, [r2, #6]
	strb r1, [r0, #0x15]
	movs r1, #0
	strb r1, [r0, #0x16]
	ldrb r0, [r2, #7]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	str r0, [sp, #0x18]
	adds r0, r5, #0
	bl FUN_0201BB4C
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	add r2, sp, #0
	movs r3, #0
	bl FUN_0201B1E4
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	nop
_0222956C: .4byte 0x02229EBC
	thumb_func_end ov42_02229514

	thumb_func_start ov42_02229570
ov42_02229570: @ 0x02229570
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	lsls r0, r0, #0xd
	asrs r3, r0, #0x10
	asrs r0, r2, #2
	lsrs r0, r0, #0x1d
	adds r0, r2, r0
	lsrs r4, r1, #0x1f
	lsls r6, r1, #0x1d
	subs r6, r6, r4
	movs r1, #0x1d
	rors r6, r1
	adds r4, r4, r6
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	lsrs r4, r2, #0x1f
	lsls r2, r2, #0x1d
	subs r2, r2, r4
	rors r2, r1
	adds r1, r4, r2
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	lsls r0, r0, #0xd
	ldrh r1, [r5, #0x18]
	asrs r0, r0, #0x10
	cmp r3, r1
	bne _022295B4
	ldrh r1, [r5, #0x1a]
	cmp r0, r1
	beq _022295DC
_022295B4:
	strh r3, [r5, #0x18]
	strh r0, [r5, #0x1a]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	rsbs r3, r3, #0
	lsls r3, r3, #0x10
	ldr r0, [r5, #4]
	ldr r1, [r5, #0x14]
	ldr r2, [r5, #0xc]
	asrs r3, r3, #0x10
	bl ov42_02229600
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
_022295DC:
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0
	adds r3, r6, #0
	bl FUN_0201F238
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #3
	adds r3, r4, #0
	bl FUN_0201F238
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov42_02229570

	thumb_func_start ov42_02229600
ov42_02229600: @ 0x02229600
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #0x1c]
	adds r0, r2, #0
	ldrh r0, [r0]
	ldr r4, [sp, #0x50]
	adds r5, r3, #0
	lsls r0, r0, #0xd
	asrs r0, r0, #0x10
	str r0, [sp, #0x34]
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	str r1, [sp, #0x20]
	str r2, [sp, #0x24]
	lsls r0, r0, #0xd
	asrs r0, r0, #0x10
	str r0, [sp, #0x30]
	cmp r5, #0
	bge _02229630
	rsbs r0, r5, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x2c]
	b _02229634
_02229630:
	movs r0, #0
	str r0, [sp, #0x2c]
_02229634:
	cmp r4, #0
	bge _02229642
	rsbs r0, r4, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x28]
	b _02229646
_02229642:
	movs r0, #0
	str r0, [sp, #0x28]
_02229646:
	cmp r5, #0
	bgt _0222964C
	movs r5, #0
_0222964C:
	cmp r4, #0
	bgt _02229652
	movs r4, #0
_02229652:
	movs r0, #0x21
	subs r0, r0, r5
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	movs r0, #0x19
	subs r0, r0, r4
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, [sp, #0x2c]
	adds r1, r0, r7
	ldr r0, [sp, #0x34]
	cmp r0, r1
	bge _02229674
	subs r0, r1, r0
	subs r0, r7, r0
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
_02229674:
	ldr r0, [sp, #0x28]
	adds r1, r0, r6
	ldr r0, [sp, #0x30]
	cmp r0, r1
	bge _02229686
	subs r0, r1, r0
	subs r0, r6, r0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
_02229686:
	movs r2, #0
	str r2, [sp]
	movs r0, #0x21
	str r0, [sp, #4]
	movs r0, #0x19
	ldr r1, [sp, #0x20]
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	lsls r1, r1, #0x18
	ldr r0, [sp, #0x1c]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201C8C4
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x20]
	adds r0, #0xc
	str r0, [sp, #0x24]
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	lsls r1, r1, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	lsls r2, r5, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x34]
	lsls r3, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x30]
	lsrs r1, r1, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov42_022296F0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_02229600

	thumb_func_start ov42_022296F0
ov42_022296F0: @ 0x022296F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	ldr r0, [sp, #0x70]
	str r3, [sp, #0x24]
	str r0, [sp, #0x70]
	ldr r0, [sp, #0x78]
	adds r4, r2, #0
	str r0, [sp, #0x78]
	ldr r0, [sp, #0x7c]
	str r0, [sp, #0x7c]
	ldr r0, [sp, #0x80]
	str r0, [sp, #0x80]
	ldr r0, [sp, #0x7c]
	ldr r1, [sp, #0x80]
	bl ov42_02229880
	str r0, [sp, #0x40]
	cmp r0, #0
	add r1, sp, #0x58
	bne _02229748
	ldrb r0, [r1, #0x10]
	adds r2, r4, #0
	str r0, [sp]
	ldrb r0, [r1, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #0x70]
	str r0, [sp, #8]
	ldrb r0, [r1, #0x1c]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x78]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x7c]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x80]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	ldr r3, [sp, #0x24]
	bl FUN_0201C4EC
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
_02229748:
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	str r0, [sp, #0x48]
	cmp r0, #0
	bgt _02229754
	b _0222987A
_02229754:
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [sp, #0x3c]
	movs r0, #0x1c
	ldrsb r0, [r1, r0]
	str r0, [sp, #0x38]
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #0x34]
_02229766:
	ldr r0, [sp, #0x78]
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1b
	subs r1, r1, r2
	movs r0, #0x1b
	rors r1, r0
	adds r0, r2, r1
	ldr r1, [sp, #0x48]
	adds r1, r0, r1
	cmp r1, #0x20
	bgt _02229786
	ldr r1, [sp, #0x48]
	str r1, [sp, #0x44]
	movs r1, #0
	str r1, [sp, #0x48]
	b _0222979A
_02229786:
	movs r1, #0x20
	subs r1, r1, r0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #0x44]
	ldr r2, [sp, #0x48]
	subs r1, r2, r1
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #0x48]
_0222979A:
	ldr r1, [sp, #0x78]
	ldr r4, [sp, #0x3c]
	lsls r1, r1, #0x13
	asrs r2, r1, #0x18
	adds r1, r4, #0
	ldr r5, [sp, #0x38]
	ldr r7, [sp, #0x34]
	cmp r1, #0
	ble _0222985A
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x30]
	ldr r1, [sp, #0x44]
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsrs r0, r0, #0x18
	str r1, [sp, #0x2c]
	str r0, [sp, #0x4c]
_022297C0:
	lsrs r2, r5, #0x1f
	lsls r1, r5, #0x1b
	subs r1, r1, r2
	movs r0, #0x1b
	rors r1, r0
	adds r0, r2, r1
	str r0, [sp, #0x28]
	adds r0, r0, r4
	cmp r0, #0x20
	bgt _022297DA
	adds r6, r4, #0
	movs r4, #0
	b _022297EA
_022297DA:
	ldr r0, [sp, #0x28]
	movs r1, #0x20
	subs r0, r1, r0
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	subs r0, r4, r6
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
_022297EA:
	ldr r0, [sp, #0x7c]
	asrs r1, r5, #4
	str r0, [sp]
	ldr r0, [sp, #0x80]
	lsrs r1, r1, #0x1b
	adds r1, r5, r1
	str r0, [sp, #4]
	add r0, sp, #0x50
	str r0, [sp, #8]
	lsls r1, r1, #0x13
	asrs r1, r1, #0x18
	lsls r1, r1, #0x18
	ldr r0, [sp, #0x70]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x40]
	lsrs r1, r1, #0x18
	bl ov42_022298B4
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	ldr r1, [sp, #0x2c]
	lsls r2, r7, #0x18
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	add r1, sp, #0x50
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x4c]
	lsrs r2, r2, #0x18
	str r0, [sp, #0x10]
	movs r0, #0
	ldrsh r0, [r1, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	movs r0, #2
	ldrsh r0, [r1, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	ldr r3, [sp, #0x24]
	bl FUN_0201C4EC
	adds r0, r5, r6
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	adds r0, r7, r6
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	cmp r4, #0
	bgt _022297C0
_0222985A:
	ldr r1, [sp, #0x78]
	ldr r0, [sp, #0x44]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x78]
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x44]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x48]
	cmp r0, #0
	ble _0222987A
	b _02229766
_0222987A:
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov42_022296F0

	thumb_func_start ov42_02229880
ov42_02229880: @ 0x02229880
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0x40
	bls _0222988E
	bl GF_AssertFail
_0222988E:
	cmp r4, #0x40
	bls _02229896
	bl GF_AssertFail
_02229896:
	cmp r5, #0x20
	bhi _022298A6
	cmp r4, #0x20
	bhi _022298A2
	movs r0, #0
	pop {r3, r4, r5, pc}
_022298A2:
	movs r0, #2
	pop {r3, r4, r5, pc}
_022298A6:
	cmp r4, #0x20
	bhi _022298AE
	movs r0, #1
	pop {r3, r4, r5, pc}
_022298AE:
	movs r0, #3
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov42_02229880

	thumb_func_start ov42_022298B4
ov42_022298B4: @ 0x022298B4
	push {r4, r5, r6, lr}
	adds r5, r3, #0
	adds r6, r2, #0
	ldr r4, [sp, #0x10]
	ldr r3, [sp, #0x14]
	ldr r2, [sp, #0x18]
	cmp r5, #3
	bhi _02229968
	adds r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	add pc, r5
_022298D0: @ jump table
	.2byte _022298D8 - _022298D0 - 2 @ case 0
	.2byte _022298DE - _022298D0 - 2 @ case 1
	.2byte _022298FC - _022298D0 - 2 @ case 2
	.2byte _0222991A - _022298D0 - 2 @ case 3
_022298D8:
	strh r4, [r2]
	strh r3, [r2, #2]
	pop {r4, r5, r6, pc}
_022298DE:
	adds r5, r1, #1
	lsls r5, r5, #5
	cmp r5, r4
	bgt _022298EA
	movs r4, #0x20
	b _022298EE
_022298EA:
	lsls r5, r1, #5
	subs r4, r4, r5
_022298EE:
	strh r4, [r2]
	strh r3, [r2, #2]
	lsls r2, r3, #0x16
	asrs r2, r2, #0x10
	muls r2, r1, r2
	adds r0, r0, r2
	pop {r4, r5, r6, pc}
_022298FC:
	adds r1, r6, #1
	lsls r1, r1, #5
	strh r4, [r2]
	cmp r1, r3
	bgt _0222990A
	movs r1, #0x20
	b _0222990E
_0222990A:
	lsls r1, r6, #5
	subs r1, r3, r1
_0222990E:
	strh r1, [r2, #2]
	lsls r1, r4, #0x16
	asrs r1, r1, #0x10
	muls r1, r6, r1
	adds r0, r0, r1
	pop {r4, r5, r6, pc}
_0222991A:
	adds r5, r1, #1
	lsls r5, r5, #5
	cmp r5, r4
	bgt _02229926
	movs r5, #0x20
	b _0222992A
_02229926:
	lsls r5, r1, #5
	subs r5, r4, r5
_0222992A:
	strh r5, [r2]
	adds r5, r6, #1
	lsls r5, r5, #5
	cmp r5, r3
	bgt _02229938
	movs r5, #0x20
	b _0222993C
_02229938:
	lsls r5, r6, #5
	subs r5, r3, r5
_0222993C:
	strh r5, [r2, #2]
	cmp r6, #0
	bne _02229954
	movs r2, #0
	cmp r1, #0
	beq _02229964
	movs r1, #2
	lsls r1, r1, #0xa
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	b _02229964
_02229954:
	lsls r2, r4, #0x16
	lsrs r2, r2, #0x10
	cmp r1, #0
	beq _02229964
	lsls r1, r3, #6
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
_02229964:
	adds r0, r0, r2
	pop {r4, r5, r6, pc}
_02229968:
	bl GF_AssertFail
	bl GF_AssertFail
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_022298B4

	thumb_func_start ov42_02229974
ov42_02229974: @ 0x02229974
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #0xc
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _0222998A
	bl GF_AssertFail
_0222998A:
	adds r1, r5, #1
	str r1, [r4, #4]
	adds r0, r6, #0
	lsls r1, r1, #3
	bl FUN_0201AA8C
	str r0, [r4]
	ldr r2, [r4, #4]
	movs r1, #0
	lsls r2, r2, #3
	blx FUN_020E5B44
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_02229974

	thumb_func_start ov42_022299AC
ov42_022299AC: @ 0x022299AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov42_022299AC

	thumb_func_start ov42_022299C0
ov42_022299C0: @ 0x022299C0
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0xa]
	adds r4, r1, #0
	ldr r1, [r5, #4]
	adds r0, r0, #1
	blx FUN_020F2BA4
	ldrh r0, [r5, #8]
	cmp r0, r1
	bne _022299E0
	adds r0, r5, #0
	add r1, sp, #0
	bl ov42_02229A08
_022299E0:
	ldrh r0, [r5, #0xa]
	ldr r3, [r5]
	lsls r2, r0, #3
	ldrh r0, [r4]
	adds r1, r3, r2
	strh r0, [r3, r2]
	ldrh r0, [r4, #2]
	strh r0, [r1, #2]
	ldrh r0, [r4, #4]
	strh r0, [r1, #4]
	ldrh r0, [r4, #6]
	strh r0, [r1, #6]
	ldrh r0, [r5, #0xa]
	ldr r1, [r5, #4]
	adds r0, r0, #1
	blx FUN_020F2BA4
	strh r1, [r5, #0xa]
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_022299C0

	thumb_func_start ov42_02229A08
ov42_02229A08: @ 0x02229A08
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #8]
	ldrh r0, [r4, #0xa]
	cmp r0, r2
	bne _02229A18
	movs r0, #0
	pop {r4, pc}
_02229A18:
	ldr r3, [r4]
	lsls r0, r2, #3
	adds r2, r3, r0
	ldrh r0, [r3, r0]
	strh r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldrh r0, [r2, #6]
	strh r0, [r1, #6]
	ldrh r0, [r4, #8]
	ldr r1, [r4, #4]
	adds r0, r0, #1
	blx FUN_020F2BA4
	strh r1, [r4, #8]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov42_02229A08

	thumb_func_start ov42_02229A40
ov42_02229A40: @ 0x02229A40
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #0xc
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02229A56
	bl GF_AssertFail
_02229A56:
	adds r1, r5, #1
	str r1, [r4, #4]
	adds r0, r6, #0
	lsls r1, r1, #2
	bl FUN_0201AA8C
	str r0, [r4]
	ldr r2, [r4, #4]
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_02229A40

	thumb_func_start ov42_02229A78
ov42_02229A78: @ 0x02229A78
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov42_02229A78

	thumb_func_start ov42_02229A8C
ov42_02229A8C: @ 0x02229A8C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0xa]
	adds r4, r1, #0
	ldr r1, [r5, #4]
	adds r0, r0, #1
	blx FUN_020F2BA4
	ldrh r0, [r5, #8]
	cmp r0, r1
	bne _02229AAA
	adds r0, r5, #0
	add r1, sp, #0
	bl ov42_02229AC8
_02229AAA:
	ldrh r0, [r5, #0xa]
	ldr r3, [r5]
	lsls r2, r0, #2
	ldrh r0, [r4]
	adds r1, r3, r2
	strh r0, [r3, r2]
	ldrh r0, [r4, #2]
	strh r0, [r1, #2]
	ldrh r0, [r5, #0xa]
	ldr r1, [r5, #4]
	adds r0, r0, #1
	blx FUN_020F2BA4
	strh r1, [r5, #0xa]
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02229A8C

	thumb_func_start ov42_02229AC8
ov42_02229AC8: @ 0x02229AC8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #8]
	ldrh r0, [r4, #0xa]
	cmp r0, r2
	bne _02229AD8
	movs r0, #0
	pop {r4, pc}
_02229AD8:
	ldr r3, [r4]
	lsls r0, r2, #2
	adds r2, r3, r0
	ldrh r0, [r3, r0]
	strh r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r4, #8]
	ldr r1, [r4, #4]
	adds r0, r0, #1
	blx FUN_020F2BA4
	strh r1, [r4, #8]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov42_02229AC8

	.rodata

_02229AF8:
	.byte 0x00, 0x00, 0x01, 0x01, 0x00, 0x01, 0x95, 0x96
	.byte 0x97, 0x98, 0x00, 0x00, 0x01, 0xFF, 0x08, 0x02, 0x04, 0x10, 0x10, 0x02, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11
	.byte 0x49, 0x7D, 0x22, 0x02, 0x55, 0x7D, 0x22, 0x02, 0x65, 0x7D, 0x22, 0x02, 0x75, 0x7D, 0x22, 0x02
	.byte 0x89, 0x7D, 0x22, 0x02, 0x99, 0x7D, 0x22, 0x02, 0xA9, 0x7D, 0x22, 0x02, 0xB9, 0x7D, 0x22, 0x02
	.byte 0xC9, 0x7D, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD9, 0x7D, 0x22, 0x02
	.byte 0xE9, 0x7D, 0x22, 0x02, 0xF9, 0x7D, 0x22, 0x02, 0x19, 0x7E, 0x22, 0x02, 0x29, 0x7E, 0x22, 0x02
	.byte 0x39, 0x7E, 0x22, 0x02, 0x49, 0x7E, 0x22, 0x02, 0x59, 0x7E, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x00, 0x05, 0x00, 0x03, 0x00, 0x0B, 0x00, 0x04, 0x00
	.byte 0x1F, 0x00, 0x05, 0x00, 0x32, 0x00, 0x06, 0x00, 0x33, 0x00, 0x07, 0x00, 0x3E, 0x00, 0x08, 0x00
	.byte 0x46, 0x00, 0x09, 0x00, 0x61, 0x00, 0x01, 0x00, 0x06, 0x00, 0x0A, 0x00, 0x07, 0x00, 0x0B, 0x00
	.byte 0x0D, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x0D, 0x00, 0x23, 0x00, 0x0E, 0x00, 0x25, 0x00, 0x0F, 0x00
	.byte 0x2A, 0x00, 0x10, 0x00, 0x3F, 0x00, 0x11, 0x00, 0x04, 0x00, 0x12, 0x00, 0x08, 0x00, 0x13, 0x00
	.byte 0x34, 0x00, 0x14, 0x00, 0x35, 0x00, 0x15, 0x00, 0x02, 0x00, 0x16, 0x00, 0x0F, 0x00, 0x17, 0x00
	.byte 0x10, 0x00, 0x18, 0x00, 0x3B, 0x00, 0x19, 0x00, 0x3C, 0x00, 0x1A, 0x00, 0x09, 0x00, 0x1B, 0x00
	.byte 0x0C, 0x00, 0x1C, 0x00, 0x17, 0x00, 0x1D, 0x00, 0x16, 0x00, 0x1E, 0x00, 0x29, 0x00, 0x1F, 0x00
	.byte 0x26, 0x00, 0x20, 0x00, 0x27, 0x00, 0x21, 0x00, 0x11, 0x00, 0x22, 0x00, 0x44, 0x00, 0x23, 0x00
	.byte 0x45, 0x00, 0x24, 0x00, 0x01, 0x00, 0x25, 0x00, 0x2D, 0x00, 0x26, 0x00, 0x36, 0x00, 0x27, 0x00
	.byte 0x38, 0x00, 0x28, 0x00, 0x14, 0x00, 0x29, 0x00, 0x0A, 0x00, 0x2A, 0x00, 0x13, 0x00, 0x2B, 0x00
	.byte 0x1D, 0x00, 0x2C, 0x00, 0x24, 0x00, 0x2D, 0x00, 0x28, 0x00, 0x2E, 0x00, 0x2B, 0x00, 0x2F, 0x00
	.byte 0x22, 0x00, 0x30, 0x00, 0x37, 0x00, 0x31, 0x00, 0x47, 0x00, 0x32, 0x00, 0x8D, 0x00, 0x33, 0x00
	.byte 0x8E, 0x00, 0x34, 0x00, 0x8F, 0x00, 0x35, 0x00, 0x90, 0x00, 0x36, 0x00, 0x91, 0x00, 0x37, 0x00
	.byte 0xA9, 0x00, 0x38, 0x00, 0x2C, 0x00, 0x3A, 0x00, 0x1E, 0x00, 0x3B, 0x00, 0xAF, 0x00, 0x5E, 0x00
	.byte 0x12, 0x00, 0x67, 0x00, 0x94, 0x00, 0x72, 0x00, 0x54, 0x00, 0x73, 0x00, 0x18, 0x00, 0x74, 0x00
	.byte 0x19, 0x00, 0x75, 0x00, 0xA8, 0x00, 0x84, 0x00, 0x56, 0x00, 0x87, 0x00, 0x15, 0x01, 0x8B, 0x00
	.byte 0x16, 0x01, 0x8C, 0x00, 0x17, 0x01, 0x8D, 0x00, 0x18, 0x01, 0x8E, 0x00, 0x19, 0x01, 0x8F, 0x00
	.byte 0x1A, 0x01, 0x90, 0x00, 0x1B, 0x01, 0x91, 0x00, 0x1C, 0x01, 0x92, 0x00, 0x1D, 0x01, 0x93, 0x00
	.byte 0x1E, 0x01, 0x94, 0x00, 0xEE, 0x00, 0x95, 0x00, 0xEF, 0x00, 0x96, 0x00, 0x27, 0x01, 0x97, 0x00
	.byte 0x28, 0x01, 0x98, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x03, 0x02, 0x00, 0xF0, 0x00, 0x10
	.byte 0xF0, 0x00, 0x10, 0x00, 0xA5, 0x85, 0x22, 0x02, 0xFD, 0x85, 0x22, 0x02, 0x69, 0x86, 0x22, 0x02
	.byte 0x01, 0x87, 0x22, 0x02, 0x99, 0x87, 0x22, 0x02, 0xF1, 0x87, 0x22, 0x02, 0x5D, 0x88, 0x22, 0x02
	.byte 0xF5, 0x88, 0x22, 0x02, 0x8D, 0x89, 0x22, 0x02, 0xF9, 0x89, 0x22, 0x02, 0x65, 0x8A, 0x22, 0x02
	.byte 0xD1, 0x8A, 0x22, 0x02, 0x3D, 0x8B, 0x22, 0x02, 0x41, 0x8B, 0x22, 0x02, 0x49, 0x8B, 0x22, 0x02
	.byte 0x89, 0x8B, 0x22, 0x02, 0xC9, 0x8B, 0x22, 0x02, 0xCD, 0x8B, 0x22, 0x02, 0x49, 0x8B, 0x22, 0x02
	.byte 0x49, 0x8B, 0x22, 0x02, 0xD5, 0x8B, 0x22, 0x02, 0xD5, 0x8B, 0x22, 0x02, 0xD5, 0x8B, 0x22, 0x02
	.byte 0xD5, 0x8B, 0x22, 0x02, 0xDD, 0x8C, 0x22, 0x02, 0x09, 0x8D, 0x22, 0x02, 0x45, 0x8D, 0x22, 0x02
	.byte 0xB9, 0x8D, 0x22, 0x02, 0xC9, 0x8D, 0x22, 0x02, 0xF1, 0x8D, 0x22, 0x02, 0xFD, 0x8D, 0x22, 0x02
	.byte 0x45, 0x8D, 0x22, 0x02, 0x0D, 0x8E, 0x22, 0x02, 0x0D, 0x8E, 0x22, 0x02, 0x0D, 0x8E, 0x22, 0x02
	.byte 0x0D, 0x8E, 0x22, 0x02, 0x00, 0x00, 0x01, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x03, 0x02, 0x04, 0x00, 0x05, 0x06, 0x08, 0x07, 0x08, 0x02, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
