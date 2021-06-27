
	thumb_func_start ov90_02258800
ov90_02258800: @ 0x02258800
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	adds r2, r6, #0
	movs r1, #0x10
	movs r0, #0
_02258812:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _02258812
	bl FUN_020347A0
	strb r0, [r6, #8]
	bl FUN_0203769C
	movs r5, #0
	adds r7, r0, #0
	adds r4, r5, #0
_0225882A:
	adds r0, r4, #0
	bl FUN_02034818
	cmp r0, #0
	beq _02258840
	cmp r7, r4
	bne _0225883A
	strb r5, [r6, #9]
_0225883A:
	adds r0, r6, r5
	strb r4, [r0, #4]
	adds r5, r5, #1
_02258840:
	adds r4, r4, #1
	cmp r4, #4
	blt _0225882A
	ldrb r0, [r6, #8]
	cmp r5, r0
	beq _02258850
	bl GF_AssertFail
_02258850:
	ldr r0, [sp]
	cmp r0, #0
	bne _0225885A
	movs r0, #1
	strb r0, [r6, #0xb]
_0225885A:
	ldr r0, [sp, #4]
	str r0, [r6]
	ldr r0, [sp, #8]
	strb r0, [r6, #0xa]
	ldr r0, [sp, #0x20]
	str r0, [r6, #0xc]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov90_02258800

	thumb_func_start ov90_0225886C
ov90_0225886C: @ 0x0225886C
	ldrb r2, [r0, #8]
	movs r3, #0
	cmp r2, #0
	ble _02258888
_02258874:
	adds r2, r0, r3
	ldrb r2, [r2, #4]
	cmp r1, r2
	bne _02258880
	adds r0, r3, #0
	bx lr
_02258880:
	ldrb r2, [r0, #8]
	adds r3, r3, #1
	cmp r3, r2
	blt _02258874
_02258888:
	movs r0, #4
	bx lr
	thumb_func_end ov90_0225886C

	thumb_func_start ov90_0225888C
ov90_0225888C: @ 0x0225888C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #8]
	adds r4, r1, #0
	cmp r4, r0
	blo _0225889C
	bl GF_AssertFail
_0225889C:
	adds r0, r5, r4
	ldrb r0, [r0, #4]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov90_0225888C

	thumb_func_start ov90_022588A4
ov90_022588A4: @ 0x022588A4
	push {r3, lr}
	cmp r1, #4
	blo _022588B4
	blo _022588B0
	bl GF_AssertFail
_022588B0:
	movs r0, #0
	pop {r3, pc}
_022588B4:
	ldr r2, [r0, #0xc]
	adds r0, r2, r1
	ldrb r1, [r0, #4]
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	bne _022588C6
	movs r0, #0
	pop {r3, pc}
_022588C6:
	adds r0, r2, r1
	ldrb r0, [r0, #8]
	pop {r3, pc}
	thumb_func_end ov90_022588A4

	thumb_func_start ov90_022588CC
ov90_022588CC: @ 0x022588CC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #4
	blo _022588E0
	blo _022588DC
	bl GF_AssertFail
_022588DC:
	movs r0, #0
	pop {r3, r4, r5, pc}
_022588E0:
	ldrb r2, [r5, #0xb]
	cmp r2, #1
	bne _02258900
	bl ov90_0225886C
	ldrb r1, [r5, #9]
	cmp r0, r1
	bne _022588F8
	ldr r0, [r5]
	bl FUN_02028E9C
	pop {r3, r4, r5, pc}
_022588F8:
	adds r0, r4, #0
	bl FUN_02034818
	pop {r3, r4, r5, pc}
_02258900:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _0225890A
	bl GF_AssertFail
_0225890A:
	ldr r1, [r5, #0xc]
	lsls r0, r4, #2
	adds r0, r1, r0
	ldr r0, [r0, #0x20]
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_022588CC

	thumb_func_start ov90_02258914
ov90_02258914: @ 0x02258914
	ldr r3, _0225891C @ =ov90_02259588
	adds r2, r1, #0
	movs r1, #0
	bx r3
	.align 2, 0
_0225891C: .4byte ov90_02259588
	thumb_func_end ov90_02258914

	thumb_func_start ov90_02258920
ov90_02258920: @ 0x02258920
	ldr r3, _02258928 @ =ov90_02259588
	adds r2, r1, #0
	movs r1, #1
	bx r3
	.align 2, 0
_02258928: .4byte ov90_02259588
	thumb_func_end ov90_02258920

	thumb_func_start ov90_0225892C
ov90_0225892C: @ 0x0225892C
	ldr r3, _02258934 @ =ov90_02259588
	adds r2, r1, #0
	movs r1, #2
	bx r3
	.align 2, 0
_02258934: .4byte ov90_02259588
	thumb_func_end ov90_0225892C

	thumb_func_start ov90_02258938
ov90_02258938: @ 0x02258938
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _022589B8 @ =0x000005EC
	ldr r0, [r5, r0]
	bl FUN_0200E390
	movs r0, #0x5f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200E390
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov90_0225A108
	movs r0, #0x73
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov90_0225A340
	ldrb r0, [r5, #0x10]
	movs r6, #0
	cmp r0, #0
	ble _02258980
	movs r0, #0x81
	lsls r0, r0, #2
	adds r4, r5, r0
_02258970:
	adds r0, r4, #0
	bl ov90_02259EAC
	ldrb r0, [r5, #0x10]
	adds r6, r6, #1
	adds r4, #0x38
	cmp r6, r0
	blt _02258970
_02258980:
	adds r0, r5, #0
	adds r0, #0x4c
	bl ov90_02259434
	adds r0, r5, #0
	bl ov90_02259784
	adds r0, r5, #0
	adds r0, #0x3c
	bl ov90_022591D4
	movs r0, #0x1b
	lsls r0, r0, #4
	adds r0, r5, r0
	bl ov90_02258E10
	adds r0, r5, #0
	adds r0, #0x84
	bl ov90_02259158
	adds r0, r5, #0
	adds r0, #0x30
	bl ov90_02259084
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
_022589B8: .4byte 0x000005EC
	thumb_func_end ov90_02258938

	thumb_func_start ov90_022589BC
ov90_022589BC: @ 0x022589BC
	ldrb r0, [r0]
	cmp r0, #0x10
	blo _022589C6
	movs r0, #1
	bx lr
_022589C6:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov90_022589BC

	thumb_func_start ov90_022589CC
ov90_022589CC: @ 0x022589CC
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #7]
	cmp r0, #1
	beq _022589DA
	bl GF_AssertFail
_022589DA:
	ldrb r0, [r4, #6]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov90_022589CC

	thumb_func_start ov90_022589E0
ov90_022589E0: @ 0x022589E0
	push {r3, lr}
	adds r3, r2, #0
	movs r2, #0
	bl ov90_0225A6B4
	pop {r3, pc}
	thumb_func_end ov90_022589E0

	thumb_func_start ov90_022589EC
ov90_022589EC: @ 0x022589EC
	push {r3, lr}
	adds r3, r2, #0
	movs r2, #1
	bl ov90_0225A6B4
	pop {r3, pc}
	thumb_func_end ov90_022589EC

	thumb_func_start ov90_022589F8
ov90_022589F8: @ 0x022589F8
	push {r3, lr}
	adds r3, r2, #0
	movs r2, #2
	bl ov90_0225A6B4
	pop {r3, pc}
	thumb_func_end ov90_022589F8

	thumb_func_start ov90_02258A04
ov90_02258A04: @ 0x02258A04
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _02258A90 @ =0x00000644
	ldr r0, [r5, r0]
	bl FUN_0200E390
	ldr r0, _02258A94 @ =0x00000648
	ldr r0, [r5, r0]
	bl FUN_0200E390
	movs r0, #0xcf
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov90_0225A108
	ldrb r0, [r5, #0x14]
	movs r6, #0
	cmp r0, #0
	ble _02258A40
	movs r0, #0x97
	lsls r0, r0, #2
	adds r4, r5, r0
_02258A30:
	adds r0, r4, #0
	bl ov90_02259EAC
	ldrb r0, [r5, #0x14]
	adds r6, r6, #1
	adds r4, #0x38
	cmp r6, r0
	blt _02258A30
_02258A40:
	movs r0, #0x7a
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov90_0225B380
	adds r0, r5, #0
	bl ov90_0225A960
	adds r0, r5, #0
	adds r0, #0x68
	bl ov90_02259434
	adds r0, r5, #0
	adds r0, #0x58
	bl ov90_022591D4
	movs r0, #0x73
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov90_02258E10
	adds r0, r5, #0
	adds r0, #0xa0
	bl ov90_02259158
	adds r0, r5, #0
	adds r0, #0x4c
	bl ov90_02259084
	ldr r0, _02258A98 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r0, _02258A9C @ =0x04001050
	strh r1, [r0]
	bl FUN_020205AC
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
_02258A90: .4byte 0x00000644
_02258A94: .4byte 0x00000648
_02258A98: .4byte 0x04000050
_02258A9C: .4byte 0x04001050
	thumb_func_end ov90_02258A04

	thumb_func_start ov90_02258AA0
ov90_02258AA0: @ 0x02258AA0
	ldrb r0, [r0, #6]
	bx lr
	thumb_func_end ov90_02258AA0

	thumb_func_start ov90_02258AA4
ov90_02258AA4: @ 0x02258AA4
	ldrb r0, [r0, #8]
	bx lr
	thumb_func_end ov90_02258AA4

	thumb_func_start ov90_02258AA8
ov90_02258AA8: @ 0x02258AA8
	push {r3, r4, r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	movs r7, #0
	mov ip, r1
	adds r0, r1, #0
	beq _02258AE8
	adds r3, r5, #0
_02258AB8:
	adds r2, r7, #0
	cmp r7, #0
	ble _02258ADA
	add r0, sp, #0
	adds r4, r0, r7
_02258AC2:
	subs r0, r4, #1
	ldrb r1, [r0]
	ldr r0, [r3]
	lsls r6, r1, #2
	ldr r6, [r5, r6]
	cmp r0, r6
	bls _02258ADA
	subs r2, r2, #1
	strb r1, [r4]
	subs r4, r4, #1
	cmp r2, #0
	bgt _02258AC2
_02258ADA:
	add r0, sp, #0
	strb r7, [r0, r2]
	adds r7, r7, #1
	mov r0, ip
	adds r3, r3, #4
	cmp r7, r0
	blo _02258AB8
_02258AE8:
	mov r0, ip
	movs r4, #0
	cmp r0, #0
	bls _02258B1E
	add r3, sp, #0
_02258AF2:
	adds r2, r4, #0
	cmp r4, #0
	ble _02258B0E
	subs r0, r3, #1
	ldrb r1, [r0]
	ldrb r0, [r3]
	lsls r6, r1, #2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r6, [r5, r6]
	cmp r0, r6
	bne _02258B0E
	adds r0, r5, r1
	ldrb r2, [r0, #0x10]
_02258B0E:
	ldrb r0, [r3]
	adds r4, r4, #1
	adds r3, r3, #1
	adds r0, r5, r0
	strb r2, [r0, #0x10]
	mov r0, ip
	cmp r4, r0
	blo _02258AF2
_02258B1E:
	add sp, #4
	pop {r3, r4, r5, r6, r7}
	bx lr
	thumb_func_end ov90_02258AA8

	thumb_func_start ov90_02258B24
ov90_02258B24: @ 0x02258B24
	strb r1, [r0, #6]
	movs r1, #1
	strb r1, [r0, #7]
	bx lr
	thumb_func_end ov90_02258B24

	thumb_func_start ov90_02258B2C
ov90_02258B2C: @ 0x02258B2C
	push {r3, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x15]
	cmp r0, #0
	bne _02258B42
	movs r0, #0x7a
	lsls r0, r0, #2
	adds r0, r3, r0
	ldrb r3, [r3, #0x14]
	bl ov90_0225B53C
_02258B42:
	pop {r3, pc}
	thumb_func_end ov90_02258B2C

	thumb_func_start ov90_02258B44
ov90_02258B44: @ 0x02258B44
	movs r2, #0x7a
	lsls r2, r2, #2
	ldr r3, _02258B50 @ =ov90_0225B594
	adds r0, r0, r2
	bx r3
	nop
_02258B50: .4byte ov90_0225B594
	thumb_func_end ov90_02258B44

	thumb_func_start ov90_02258B54
ov90_02258B54: @ 0x02258B54
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r4, #0
	cmp r0, #0
	beq _02258B94
	bl FUN_02037454
	ldrb r1, [r5, #8]
	cmp r1, r0
	beq _02258B6C
	movs r4, #1
_02258B6C:
	bl FUN_02039264
	cmp r0, #1
	bne _02258B76
	movs r4, #1
_02258B76:
	bl FUN_020390C4
	cmp r0, #2
	blt _02258B80
	movs r4, #1
_02258B80:
	cmp r4, #1
	bne _02258B8A
	ldr r0, [r5, #0xc]
	movs r1, #1
	str r1, [r0, #0x1c]
_02258B8A:
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x1c]
	cmp r0, #1
	bne _02258B94
	movs r4, #1
_02258B94:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_02258B54

	thumb_func_start ov90_02258B98
ov90_02258B98: @ 0x02258B98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _02258BA6
	bl GF_AssertFail
_02258BA6:
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x1c]
	cmp r0, #1
	beq _02258BB2
	bl GF_AssertFail
_02258BB2:
	bl FUN_02034420
	cmp r0, #1
	bne _02258BC4
	bl FUN_020343E4
	bl FUN_0203986C
	b _02258BD0
_02258BC4:
	bl FUN_020392A0
	cmp r0, #1
	bne _02258BD0
	movs r0, #1
	pop {r4, pc}
_02258BD0:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov90_02258B98

	thumb_func_start ov90_02258BD4
ov90_02258BD4: @ 0x02258BD4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r1, #0
	movs r1, #0x73
	adds r6, r0, #0
	adds r0, r5, #0
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0x73
	adds r4, r0, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	str r6, [r4, #8]
	movs r0, #0xc8
	adds r1, r5, #0
	bl FUN_02007688
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #1
	adds r2, r5, #0
	bl ov90_02258DD0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, _02258C34 @ =0x00001388
	movs r2, #3
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	adds r0, r4, #0
	ldr r1, [r4, #0xc]
	adds r0, #0x10
	adds r3, r2, #0
	bl ov90_02258E54
	str r0, [r4, #0x28]
	adds r0, r4, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_02258C34: .4byte 0x00001388
	thumb_func_end ov90_02258BD4

	thumb_func_start ov90_02258C38
ov90_02258C38: @ 0x02258C38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _02258C4A
	bl FUN_0200E390
	movs r0, #0
	str r0, [r4, #0x2c]
_02258C4A:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _02258C54
	bl FUN_02024758
_02258C54:
	adds r0, r4, #0
	adds r0, #0x34
	bl ov90_0225BD08
	adds r0, r4, #0
	adds r0, #0x10
	bl ov90_02258E10
	ldr r0, [r4, #0xc]
	bl FUN_0200770C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov90_02258C38

	thumb_func_start ov90_02258C74
ov90_02258C74: @ 0x02258C74
	push {r3, lr}
	ldr r0, [r0, #0x14]
	ldr r1, _02258C88 @ =0x00001388
	bl FUN_0200A7BC
	movs r1, #1
	bl FUN_0200B12C
	pop {r3, pc}
	nop
_02258C88: .4byte 0x00001388
	thumb_func_end ov90_02258C74

	thumb_func_start ov90_02258C8C
ov90_02258C8C: @ 0x02258C8C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _02258C9A
	bl GF_AssertFail
_02258C9A:
	ldr r0, _02258CAC @ =ov90_0225BEE0
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	str r0, [r4, #0x2c]
	movs r0, #1
	strh r0, [r4, #4]
	pop {r4, pc}
	.align 2, 0
_02258CAC: .4byte ov90_0225BEE0
	thumb_func_end ov90_02258C8C

	thumb_func_start ov90_02258CB0
ov90_02258CB0: @ 0x02258CB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _02258CBE
	bl GF_AssertFail
_02258CBE:
	ldr r0, _02258CD8 @ =ov90_0225C06C
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	str r0, [r4, #0x2c]
	movs r0, #1
	strh r0, [r4, #4]
	ldr r0, _02258CDC @ =0x000005F1
	bl FUN_0200604C
	pop {r4, pc}
	nop
_02258CD8: .4byte ov90_0225C06C
_02258CDC: .4byte 0x000005F1
	thumb_func_end ov90_02258CB0

	thumb_func_start ov90_02258CE0
ov90_02258CE0: @ 0x02258CE0
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _02258CEA
	movs r0, #1
	bx lr
_02258CEA:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov90_02258CE0

	thumb_func_start ov90_02258CF0
ov90_02258CF0: @ 0x02258CF0
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x18]
	adds r5, r0, #0
	adds r7, r2, #0
	adds r0, r3, #0
	adds r6, r1, #0
	lsls r2, r4, #0xc
	str r3, [sp]
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	adds r2, r0, #0
	subs r0, r7, r6
	movs r7, #2
	movs r3, #0
	lsls r7, r7, #0xa
	adds r2, r2, r7
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r2, r2, #0xc
	orrs r2, r1
	subs r2, r0, r2
	asrs r1, r2, #0x1f
	lsrs r0, r2, #0x13
	lsls r1, r1, #0xd
	orrs r1, r0
	lsls r0, r2, #0xd
	adds r0, r0, r7
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	adds r1, r4, #0
	muls r1, r4, r1
	lsls r1, r1, #0xc
	blx FUN_020CCBA0
	str r6, [r5]
	ldr r1, [sp]
	str r6, [r5, #4]
	str r1, [r5, #8]
	str r0, [r5, #0xc]
	str r4, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov90_02258CF0

	thumb_func_start ov90_02258D4C
ov90_02258D4C: @ 0x02258D4C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	adds r4, r1, #0
	cmp r4, r0
	blt _02258D5E
	adds r4, r0, #0
	movs r7, #1
	b _02258D60
_02258D5E:
	movs r7, #0
_02258D60:
	ldr r0, [r5, #8]
	lsls r2, r4, #0xc
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsrs r6, r2, #0xc
	lsls r0, r1, #0x14
	adds r2, r4, #0
	orrs r6, r0
	ldr r0, [r5, #0xc]
	muls r2, r4, r2
	lsls r2, r2, #0xc
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r0, r0, r2
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	lsls r1, r2, #2
	blx FUN_020CCBA0
	ldr r1, [r5, #4]
	adds r0, r6, r0
	adds r0, r1, r0
	str r0, [r5]
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov90_02258D4C

	thumb_func_start ov90_02258DB0
ov90_02258DB0: @ 0x02258DB0
	push {r3, r4}
	ldr r2, [r0, #8]
	adds r0, #0xc
	lsrs r4, r2, #1
	movs r3, #0
	cmp r4, #0
	ble _02258DCC
_02258DBE:
	ldrh r2, [r0]
	adds r3, r3, #1
	adds r2, r2, r1
	strh r2, [r0]
	adds r0, r0, #2
	cmp r3, r4
	blt _02258DBE
_02258DCC:
	pop {r3, r4}
	bx lr
	thumb_func_end ov90_02258DB0

	thumb_func_start ov90_02258DD0
ov90_02258DD0: @ 0x02258DD0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	adds r6, r1, #0
	adds r7, r2, #0
	movs r4, #0
	adds r5, r0, #0
_02258DDC:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0200A090
	adds r4, r4, #1
	stm r5!, {r0}
	cmp r4, #4
	blt _02258DDC
	movs r0, #0x38
	adds r4, r6, #0
	muls r4, r0, r4
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_0201AA8C
	ldr r1, [sp]
	adds r2, r4, #0
	str r0, [r1, #0x10]
	movs r1, #0
	blx FUN_020E5B44
	ldr r0, [sp]
	str r6, [r0, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov90_02258DD0

	thumb_func_start ov90_02258E10
ov90_02258E10: @ 0x02258E10
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	movs r6, #0
	cmp r0, #0
	bls _02258E38
	adds r4, r6, #0
_02258E1E:
	ldr r1, [r5, #0x10]
	ldr r0, [r1, r4]
	cmp r0, #1
	bne _02258E2E
	adds r0, r5, #0
	adds r1, r1, r4
	bl ov90_02258FB8
_02258E2E:
	ldr r0, [r5, #0x14]
	adds r6, r6, #1
	adds r4, #0x38
	cmp r6, r0
	blo _02258E1E
_02258E38:
	movs r6, #0
	adds r4, r5, #0
_02258E3C:
	ldr r0, [r4]
	bl FUN_0200A0D0
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _02258E3C
	ldr r0, [r5, #0x10]
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov90_02258E10

	thumb_func_start ov90_02258E54
ov90_02258E54: @ 0x02258E54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r6, [r5, #0x14]
	movs r4, #0
	str r1, [sp, #0x18]
	str r2, [sp, #0x1c]
	adds r7, r3, #0
	adds r1, r4, #0
	cmp r6, #0
	bls _02258E84
	ldr r3, [r5, #0x10]
	adds r2, r3, #0
_02258E6E:
	ldr r0, [r2]
	cmp r0, #0
	bne _02258E7C
	movs r0, #0x38
	muls r0, r1, r0
	adds r4, r3, r0
	b _02258E84
_02258E7C:
	adds r1, r1, #1
	adds r2, #0x38
	cmp r1, r6
	blo _02258E6E
_02258E84:
	cmp r4, #0
	bne _02258E8C
	bl GF_AssertFail
_02258E8C:
	ldr r0, [sp, #0x38]
	str r7, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x3c]
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [sp, #0x40]
	ldr r3, [sp, #0x1c]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x44]
	adds r1, r4, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x48]
	str r0, [sp, #0x14]
	adds r0, r5, #0
	bl ov90_02258EE0
	adds r0, r4, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov90_02258E54

	thumb_func_start ov90_02258EB4
ov90_02258EB4: @ 0x02258EB4
	push {r3, lr}
	sub sp, #0x20
	adds r0, #0x14
	str r0, [sp, #4]
	lsls r0, r2, #0xc
	str r0, [sp, #8]
	lsls r0, r3, #0xc
	str r0, [sp, #0xc]
	str r1, [sp]
	add r0, sp, #0x18
	ldrh r0, [r0, #0x10]
	str r0, [sp, #0x14]
	movs r0, #1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x1c]
	add r0, sp, #0
	bl FUN_02024714
	add sp, #0x20
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov90_02258EB4

	thumb_func_start ov90_02258EE0
ov90_02258EE0: @ 0x02258EE0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	str r2, [sp, #0x2c]
	str r3, [sp, #0x30]
	cmp r0, #0
	beq _02258EF6
	bl GF_AssertFail
_02258EF6:
	movs r0, #1
	ldr r7, [sp, #0x58]
	str r0, [r4]
	str r7, [sp]
	ldr r6, [sp, #0x5c]
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r5]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x4c]
	movs r3, #0
	bl FUN_0200A3C8
	str r0, [r4, #4]
	str r7, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x2c]
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r0, [r5, #4]
	ldr r2, [sp, #0x30]
	movs r3, #0
	bl FUN_0200A480
	str r0, [r4, #8]
	str r7, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x50]
	movs r3, #0
	bl FUN_0200A540
	str r0, [r4, #0xc]
	str r7, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r5, #0xc]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x54]
	movs r3, #0
	bl FUN_0200A540
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	bl FUN_0200ADA4
	cmp r0, #0
	bne _02258F66
	bl GF_AssertFail
_02258F66:
	ldr r0, [r4, #4]
	bl FUN_0200A740
	ldr r0, [r4, #8]
	bl FUN_0200B00C
	cmp r0, #0
	bne _02258F7A
	bl GF_AssertFail
_02258F7A:
	ldr r0, [r4, #8]
	bl FUN_0200A740
	movs r0, #0
	str r7, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r1, #1
	str r1, [sp, #0x10]
	ldr r1, [r5]
	adds r4, #0x14
	str r1, [sp, #0x14]
	ldr r1, [r5, #4]
	adds r2, r7, #0
	str r1, [sp, #0x18]
	ldr r1, [r5, #8]
	adds r3, r7, #0
	str r1, [sp, #0x1c]
	ldr r1, [r5, #0xc]
	str r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_02009D48
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov90_02258EE0

	thumb_func_start ov90_02258FB8
ov90_02258FB8: @ 0x02258FB8
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #1
	beq _02258FC8
	bl GF_AssertFail
_02258FC8:
	movs r0, #0
	str r0, [r4]
	ldr r0, [r4, #4]
	bl FUN_0200AEB0
	ldr r0, [r4, #8]
	bl FUN_0200B0A8
	movs r6, #0
_02258FDA:
	ldr r0, [r5]
	ldr r1, [r4, #4]
	bl FUN_0200A75C
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #4
	blt _02258FDA
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov90_02258FB8

	thumb_func_start ov90_02258FF0
ov90_02258FF0: @ 0x02258FF0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [sp, #0x18]
	adds r6, r2, #0
	str r0, [sp, #0x18]
	adds r0, r1, #0
	str r3, [sp]
	bl FUN_0201ACB0
	ldr r0, [sp, #0x18]
	bl FUN_0201AC88
	str r0, [r5]
	ldr r0, [sp]
	str r6, [r5, #4]
	str r0, [r5, #8]
	ldr r0, _02259080 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	ldr r0, [sp]
	movs r7, #0
	cmp r0, #0
	bls _0225907C
	adds r4, r6, #0
_02259024:
	ldr r1, [r4]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r6, #4
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4]
	ldr r3, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r1, [r4]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	ldr r1, [r4]
	movs r2, #0
	lsls r1, r1, #0x18
	ldr r0, [r5]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201BC8C
	ldr r1, [r4]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [sp]
	adds r7, r7, #1
	adds r6, #0x20
	adds r4, #0x20
	cmp r7, r0
	blo _02259024
_0225907C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02259080: .4byte 0x021D116C
	thumb_func_end ov90_02258FF0

	thumb_func_start ov90_02259084
ov90_02259084: @ 0x02259084
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #3
	ldr r0, [r5]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #8]
	movs r6, #0
	cmp r0, #0
	bls _022590B6
	adds r4, r6, #0
_0225909E:
	ldr r1, [r5, #4]
	ldr r0, [r5]
	ldr r1, [r1, r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB4C
	ldr r0, [r5, #8]
	adds r6, r6, #1
	adds r4, #0x20
	cmp r6, r0
	blo _0225909E
_022590B6:
	ldr r0, [r5]
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov90_02259084

	thumb_func_start ov90_022590C0
ov90_022590C0: @ 0x022590C0
	ldr r3, _022590C8 @ =FUN_0201EEB4
	ldr r0, [r0]
	bx r3
	nop
_022590C8: .4byte FUN_0201EEB4
	thumb_func_end ov90_022590C0

	thumb_func_start ov90_022590CC
ov90_022590CC: @ 0x022590CC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	str r1, [sp, #0x14]
	adds r6, r2, #0
	str r3, [sp, #0x18]
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	ldr r4, [sp, #0x40]
	str r0, [sp, #8]
	movs r3, #0x1f
	str r3, [sp, #0xc]
	adds r2, r0, #0
	str r4, [sp, #0x10]
	bl FUN_0200B150
	ldr r3, _02259154 @ =0x0225C294
	add r2, sp, #0x1c
	adds r7, r2, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r1, #0x10
	adds r0, r7, #0
	adds r2, r1, #0
	str r6, [sp, #0x1c]
	str r4, [sp, #0x28]
	bl FUN_020215C0
	ldr r0, [sp, #0x18]
	adds r1, r4, #0
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	movs r0, #1
	movs r1, #0x10
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	ldr r0, [sp, #0x14]
	adds r1, r5, #4
	adds r2, r4, #0
	bl FUN_02009F40
	str r0, [r5]
	bl FUN_0203A880
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02259154: .4byte 0x0225C294
	thumb_func_end ov90_022590CC

	thumb_func_start ov90_02259158
ov90_02259158: @ 0x02259158
	push {r3, lr}
	ldr r0, [r0]
	bl FUN_02024504
	bl FUN_0202168C
	bl FUN_02022608
	bl FUN_0200B244
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov90_02259158

	thumb_func_start ov90_02259170
ov90_02259170: @ 0x02259170
	ldr r3, _02259178 @ =FUN_0202457C
	ldr r0, [r0]
	bx r3
	nop
_02259178: .4byte FUN_0202457C
	thumb_func_end ov90_02259170

	thumb_func_start ov90_0225917C
ov90_0225917C: @ 0x0225917C
	ldr r3, _02259180 @ =FUN_0200B224
	bx r3
	.align 2, 0
_02259180: .4byte FUN_0200B224
	thumb_func_end ov90_0225917C

	thumb_func_start ov90_02259184
ov90_02259184: @ 0x02259184
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xec
	adds r3, r4, #0
	bl FUN_0200BAF8
	str r0, [r5]
	movs r0, #8
	movs r1, #0x40
	adds r2, r4, #0
	bl FUN_0200BD18
	str r0, [r5, #4]
	movs r0, #0x80
	adds r1, r4, #0
	bl FUN_02026354
	str r0, [r5, #8]
	movs r0, #0x80
	adds r1, r4, #0
	bl FUN_02026354
	movs r1, #6
	str r0, [r5, #0xc]
	movs r0, #0
	lsls r1, r1, #6
	adds r2, r4, #0
	bl FUN_0200304C
	movs r1, #6
	movs r0, #4
	lsls r1, r1, #6
	adds r2, r4, #0
	bl FUN_0200304C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov90_02259184

	thumb_func_start ov90_022591D4
ov90_022591D4: @ 0x022591D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_02026380
	ldr r0, [r4, #8]
	bl FUN_02026380
	ldr r0, [r4, #4]
	bl FUN_0200BDA0
	ldr r0, [r4]
	bl FUN_0200BB44
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov90_022591D4

	thumb_func_start ov90_022591F4
ov90_022591F4: @ 0x022591F4
	ldr r3, _022591FC @ =FUN_0200CC50
	ldr r0, [r0, #4]
	bx r3
	nop
_022591FC: .4byte FUN_0200CC50
	thumb_func_end ov90_022591F4

	thumb_func_start ov90_02259200
ov90_02259200: @ 0x02259200
	ldr r3, _0225920C @ =FUN_0200BE48
	adds r2, r1, #0
	ldr r0, [r0, #4]
	movs r1, #0
	bx r3
	nop
_0225920C: .4byte FUN_0200BE48
	thumb_func_end ov90_02259200

	thumb_func_start ov90_02259210
ov90_02259210: @ 0x02259210
	ldr r3, _0225921C @ =FUN_0200C4B0
	adds r2, r1, #0
	ldr r0, [r0, #4]
	movs r1, #0
	bx r3
	nop
_0225921C: .4byte FUN_0200C4B0
	thumb_func_end ov90_02259210

	thumb_func_start ov90_02259220
ov90_02259220: @ 0x02259220
	push {r4, lr}
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r0, [r0, #4]
	movs r1, #0
	adds r2, r4, #0
	bl FUN_0200C4E8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov90_02259220

	thumb_func_start ov90_02259234
ov90_02259234: @ 0x02259234
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	movs r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	adds r3, r2, #0
	ldr r0, [r0, #4]
	movs r1, #0
	adds r2, r4, #0
	bl FUN_0200BFCC
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov90_02259234

	thumb_func_start ov90_02259250
ov90_02259250: @ 0x02259250
	push {r3, lr}
	sub sp, #8
	adds r2, r1, #0
	movs r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r0, #4]
	movs r1, #0
	movs r3, #2
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov90_02259250

	thumb_func_start ov90_0225926C
ov90_0225926C: @ 0x0225926C
	ldr r3, _02259278 @ =FUN_0200C7BC
	adds r2, r1, #0
	ldr r0, [r0, #4]
	movs r1, #1
	bx r3
	nop
_02259278: .4byte FUN_0200C7BC
	thumb_func_end ov90_0225926C

	thumb_func_start ov90_0225927C
ov90_0225927C: @ 0x0225927C
	ldr r3, _02259288 @ =FUN_0200C74C
	adds r2, r1, #0
	ldr r0, [r0, #4]
	movs r1, #0
	bx r3
	nop
_02259288: .4byte FUN_0200C74C
	thumb_func_end ov90_0225927C

	thumb_func_start ov90_0225928C
ov90_0225928C: @ 0x0225928C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, [r5]
	ldr r2, [r5, #0xc]
	bl FUN_0200BB6C
	ldr r0, [r5, #4]
	ldr r2, [r5, #0xc]
	adds r1, r4, #0
	bl FUN_0200CBBC
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_0225928C

	thumb_func_start ov90_022592A8
ov90_022592A8: @ 0x022592A8
	push {r4, lr}
	sub sp, #8
	add r4, sp, #0
	ldrb r4, [r4, #0x10]
	str r4, [sp]
	ldr r4, _022592C0 @ =0x000F0E00
	str r4, [sp, #4]
	bl ov90_02259350
	add sp, #8
	pop {r4, pc}
	nop
_022592C0: .4byte 0x000F0E00
	thumb_func_end ov90_022592A8

	thumb_func_start ov90_022592C4
ov90_022592C4: @ 0x022592C4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r2, #0
	ldr r0, [r5]
	ldr r2, [r5, #0xc]
	adds r4, r3, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [r5, #0xc]
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [r5, #8]
	adds r2, r0, #0
	bl FUN_02002F30
	subs r3, r4, r0
	bpl _022592F0
	movs r3, #0
_022592F0:
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	movs r1, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02259310 @ =0x000F0E00
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #8]
	adds r0, r6, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02259310: .4byte 0x000F0E00
	thumb_func_end ov90_022592C4

	thumb_func_start ov90_02259314
ov90_02259314: @ 0x02259314
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r2, #0
	ldr r0, [r5]
	ldr r2, [r5, #0xc]
	adds r4, r3, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #4]
	ldr r2, [r5, #0xc]
	adds r1, r4, #0
	bl FUN_0200CBBC
	movs r3, #0
	ldr r0, [sp, #0x20]
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0225934C @ =0x0001020F
	movs r1, #1
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r4, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225934C: .4byte 0x0001020F
	thumb_func_end ov90_02259314

	thumb_func_start ov90_02259350
ov90_02259350: @ 0x02259350
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r0, [r5]
	ldr r2, [r5, #0xc]
	adds r6, r3, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [r5, #0xc]
	bl FUN_0200CBBC
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	movs r1, #0
	adds r3, r6, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov90_02259350

	thumb_func_start ov90_0225938C
ov90_0225938C: @ 0x0225938C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x30]
	adds r7, r1, #0
	str r0, [sp, #0x30]
	adds r0, r2, #0
	str r3, [sp, #0x18]
	bl FUN_02028EA8
	bl FUN_0202ADCC
	adds r4, r0, #0
	movs r0, #1
	bl FUN_02002C60
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x30]
	movs r1, #2
	str r0, [sp, #4]
	ldr r0, [r7]
	movs r2, #1
	movs r3, #0xd
	bl FUN_0200E644
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x30]
	movs r1, #4
	str r0, [sp, #4]
	ldr r0, [r7]
	movs r2, #1
	movs r3, #0xd
	bl FUN_0200E644
	ldr r4, [sp, #0x14]
	movs r6, #0
	adds r5, r4, #0
_022593DE:
	cmp r6, #0
	bne _022593E8
	movs r2, #2
	movs r0, #0x13
	b _022593EC
_022593E8:
	movs r2, #4
	movs r0, #1
_022593EC:
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	movs r0, #0x1f
	str r0, [sp, #0x10]
	lsls r2, r2, #0x18
	ldr r0, [r7]
	adds r1, r4, #0
	lsrs r2, r2, #0x18
	movs r3, #2
	bl FUN_0201D40C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r1, [sp, #0x30]
	movs r0, #0x80
	bl FUN_02026354
	str r0, [r5, #0x24]
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, r5, #4
	cmp r6, #2
	blt _022593DE
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x14]
	str r1, [r0, #0x34]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov90_0225938C

	thumb_func_start ov90_02259434
ov90_02259434: @ 0x02259434
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r4, #0
	adds r5, r7, #0
	adds r6, r7, #0
_0225943E:
	adds r0, r7, #0
	adds r1, r4, #0
	bl ov90_022594FC
	ldr r0, [r5, #0x24]
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, r5, #4
	adds r6, #0x10
	cmp r4, #2
	blt _0225943E
	bl FUN_02002C90
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov90_02259434

	thumb_func_start ov90_02259464
ov90_02259464: @ 0x02259464
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	str r1, [sp, #4]
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r0, #1
	bne _0225948A
	ldr r2, _022594F8 @ =0x0225C34C
	movs r1, #0
_0225947A:
	ldrh r0, [r2]
	cmp r4, r0
	bne _02259482
	ldrh r4, [r2, #2]
_02259482:
	adds r1, r1, #1
	adds r2, r2, #4
	cmp r1, #0x14
	blo _0225947A
_0225948A:
	adds r0, r5, #0
	str r0, [sp, #8]
	adds r0, #0x20
	str r0, [sp, #8]
	lsls r0, r6, #1
	ldr r1, [sp, #8]
	str r0, [sp, #0xc]
	ldrh r0, [r1, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _022594B4
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	ldrh r0, [r1, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_022594B4:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov90_02259570
	lsls r7, r6, #4
	adds r0, r5, r7
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #1
	lsls r3, r6, #2
	str r0, [sp]
	adds r3, r5, r3
	ldr r0, [sp, #4]
	ldr r3, [r3, #0x24]
	adds r1, r4, #0
	adds r2, r5, r7
	bl ov90_02259314
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	movs r3, #0xd
	strh r0, [r2, r1]
	movs r1, #1
	adds r0, r5, r7
	adds r2, r1, #0
	bl FUN_0200E998
	adds r0, r5, r7
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022594F8: .4byte 0x0225C34C
	thumb_func_end ov90_02259464

	thumb_func_start ov90_022594FC
ov90_022594FC: @ 0x022594FC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov90_02259570
	adds r6, r5, #0
	adds r6, #0x20
	lsls r7, r4, #1
	ldrh r0, [r6, r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _02259524
	ldrh r0, [r6, r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_02259524:
	lsls r4, r4, #4
	adds r0, r5, r4
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, r4
	bl FUN_0201D8E4
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov90_022594FC

	thumb_func_start ov90_02259538
ov90_02259538: @ 0x02259538
	push {r3, lr}
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0, #0x20]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02259550
	movs r0, #1
	pop {r3, pc}
_02259550:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov90_02259538

	thumb_func_start ov90_02259554
ov90_02259554: @ 0x02259554
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r5, #0x2c
	lsls r4, r1, #2
	ldr r2, [r5, r4]
	cmp r2, #0
	bne _0225956E
	lsls r1, r1, #4
	adds r0, r0, r1
	movs r1, #1
	bl FUN_0200F0AC
	str r0, [r5, r4]
_0225956E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_02259554

	thumb_func_start ov90_02259570
ov90_02259570: @ 0x02259570
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	lsls r5, r1, #2
	adds r4, #0x2c
	ldr r0, [r4, r5]
	cmp r0, #0
	beq _02259586
	bl FUN_0200F478
	movs r0, #0
	str r0, [r4, r5]
_02259586:
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_02259570

	thumb_func_start ov90_02259588
ov90_02259588: @ 0x02259588
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	movs r1, #0x12
	adds r6, r0, #0
	adds r5, r2, #0
	movs r0, #0x13
	lsls r1, r1, #6
	movs r2, #0
	bl FUN_02004EC4
	ldr r1, _022596A0 @ =0x000005F4
	adds r0, r5, #0
	bl FUN_0201AA8C
	ldr r2, _022596A0 @ =0x000005F4
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r2, r4, #0
	adds r2, #8
	movs r1, #0x10
_022595B4:
	ldrb r0, [r6]
	adds r6, r6, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _022595B4
	ldr r3, _022596A4 @ =0x04000050
	strh r7, [r4, #4]
	movs r1, #0
	strh r1, [r3]
	ldr r0, _022596A8 @ =0x04001050
	subs r3, #0x50
	strh r1, [r0]
	ldr r2, [r3]
	ldr r1, _022596AC @ =0xFFFF1FFF
	subs r0, #0x50
	ands r2, r1
	str r2, [r3]
	ldr r2, [r0]
	ands r1, r2
	str r1, [r0]
	ldr r0, _022596B0 @ =0x0225C2CC
	bl FUN_02022BE8
	adds r0, r4, #0
	strh r5, [r4, #2]
	bl ov90_0225C178
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x18
	adds r1, #8
	bl ov90_0225A204
	adds r0, r4, #0
	ldr r1, _022596B4 @ =0x0225C2A4
	ldr r2, _022596B8 @ =0x0225C39C
	adds r0, #0x30
	movs r3, #5
	str r5, [sp]
	bl ov90_02258FF0
	adds r0, r4, #0
	movs r2, #1
	adds r0, #0x84
	movs r1, #0x10
	adds r3, r2, #0
	str r5, [sp]
	bl ov90_022590CC
	movs r0, #0x1b
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #1
	adds r2, r5, #0
	bl ov90_02258DD0
	adds r0, r4, #0
	adds r0, #0x3c
	adds r1, r5, #0
	bl ov90_02259184
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov90_022596C8
	adds r0, r4, #0
	ldrb r1, [r4, #0x11]
	adds r0, #8
	bl ov90_0225888C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #8
	bl ov90_022588A4
	str r5, [sp]
	adds r3, r0, #0
	adds r0, r4, #0
	adds r1, r4, #0
	ldr r2, [r4, #8]
	adds r0, #0x4c
	adds r1, #0x30
	bl ov90_0225938C
	ldr r0, _022596BC @ =ov90_02259794
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	ldr r1, _022596C0 @ =0x000005EC
	movs r2, #0
	str r0, [r4, r1]
	ldr r0, _022596C4 @ =ov90_02259B18
	adds r1, r4, #0
	bl FUN_0200E374
	movs r1, #0x5f
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _02259688
	adds r0, r5, #0
	bl FUN_021E69A8
_02259688:
	ldr r0, [r4, #8]
	bl FUN_0202CF54
	ldrb r1, [r4, #0x13]
	cmp r1, #0
	beq _0225969A
	movs r1, #0x27
	bl FUN_0202D1C0
_0225969A:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022596A0: .4byte 0x000005F4
_022596A4: .4byte 0x04000050
_022596A8: .4byte 0x04001050
_022596AC: .4byte 0xFFFF1FFF
_022596B0: .4byte 0x0225C2CC
_022596B4: .4byte 0x0225C2A4
_022596B8: .4byte 0x0225C39C
_022596BC: .4byte ov90_02259794
_022596C0: .4byte 0x000005EC
_022596C4: .4byte ov90_02259B18
	thumb_func_end ov90_02259588

	thumb_func_start ov90_022596C8
ov90_022596C8: @ 0x022596C8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0xc8
	adds r4, r1, #0
	bl FUN_02007688
	movs r1, #0x12
	lsls r1, r1, #4
	str r1, [sp]
	movs r2, #0
	movs r1, #4
	adds r3, r2, #0
	adds r6, r0, #0
	str r4, [sp, #4]
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5, #0x30]
	adds r0, r6, #0
	movs r1, #6
	movs r3, #1
	bl FUN_02007B44
	movs r3, #2
	lsls r3, r3, #8
	adds r0, r6, #0
	movs r1, #9
	movs r2, #0
	adds r3, r5, r3
	str r4, [sp]
	bl FUN_02007C2C
	movs r1, #0x7f
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5, #0x30]
	adds r0, r6, #0
	movs r1, #8
	movs r3, #3
	bl FUN_02007B68
	ldrh r1, [r5, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	bl ov90_0225A65C
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0xd
	str r0, [sp, #4]
	movs r0, #0xe
	str r0, [sp, #8]
	ldr r0, _02259780 @ =0x00001388
	adds r1, r6, #0
	str r0, [sp, #0xc]
	movs r0, #0x1b
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r2, #0xb
	movs r3, #5
	str r4, [sp, #0x10]
	bl ov90_02258E54
	movs r1, #0x72
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #4
	str r6, [sp]
	str r4, [sp, #4]
	adds r1, r5, #0
	adds r2, r5, #0
	ldrh r3, [r5, #4]
	adds r0, r5, r0
	adds r1, #0x30
	adds r2, #0x3c
	bl ov90_0225A2B0
	adds r0, r6, #0
	bl FUN_0200770C
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02259780: .4byte 0x00001388
	thumb_func_end ov90_022596C8

	thumb_func_start ov90_02259784
ov90_02259784: @ 0x02259784
	movs r1, #0x7f
	lsls r1, r1, #2
	ldr r3, _02259790 @ =FUN_0201AB0C
	ldr r0, [r0, r1]
	bx r3
	nop
_02259790: .4byte FUN_0201AB0C
	thumb_func_end ov90_02259784

	thumb_func_start ov90_02259794
ov90_02259794: @ 0x02259794
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r4, r1, #0
	ldrb r0, [r4]
	cmp r0, #0x10
	bls _022597A2
	b _02259AF2
_022597A2:
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022597AE: @ jump table
	.2byte _022597D0 - _022597AE - 2 @ case 0
	.2byte _022597FE - _022597AE - 2 @ case 1
	.2byte _0225981C - _022597AE - 2 @ case 2
	.2byte _02259836 - _022597AE - 2 @ case 3
	.2byte _0225984E - _022597AE - 2 @ case 4
	.2byte _02259868 - _022597AE - 2 @ case 5
	.2byte _02259898 - _022597AE - 2 @ case 6
	.2byte _022598B4 - _022597AE - 2 @ case 7
	.2byte _022599BA - _022597AE - 2 @ case 8
	.2byte _022599CC - _022597AE - 2 @ case 9
	.2byte _022599F2 - _022597AE - 2 @ case 10
	.2byte _02259A04 - _022597AE - 2 @ case 11
	.2byte _02259A36 - _022597AE - 2 @ case 12
	.2byte _02259A50 - _022597AE - 2 @ case 13
	.2byte _02259AB6 - _022597AE - 2 @ case 14
	.2byte _02259AE8 - _022597AE - 2 @ case 15
	.2byte _02259AF2 - _022597AE - 2 @ case 16
_022597D0:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldrh r0, [r4, #2]
	ldr r3, _02259AD8 @ =0x0000FFFF
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #3
	bl FUN_0200FA24
	movs r0, #0x73
	lsls r0, r0, #2
	adds r1, r4, #0
	ldrh r2, [r4, #2]
	adds r0, r4, r0
	adds r1, #0x30
	bl ov90_0225A350
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_022597FE:
	movs r0, #0x73
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #0x30
	bl ov90_0225A428
	bl FUN_0200FB5C
	cmp r0, #1
	bne _022598AA
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_0225981C:
	movs r0, #0x73
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #0x30
	bl ov90_0225A428
	cmp r0, #1
	bne _022598AA
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_02259836:
	adds r0, r4, #0
	adds r1, r4, #0
	movs r2, #0
	adds r0, #0x4c
	adds r1, #0x3c
	adds r3, r2, #0
	bl ov90_02259464
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_0225984E:
	adds r0, r4, #0
	adds r0, #0x4c
	movs r1, #0
	bl ov90_02259538
	cmp r0, #0
	beq _022598AA
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	movs r0, #0x40
	strb r0, [r4, #1]
	b _02259AF2
_02259868:
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _022598AA
	subs r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _022598AA
	adds r0, r4, #0
	adds r0, #0x4c
	movs r1, #0
	bl ov90_022594FC
	movs r0, #0x73
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #0x30
	bl ov90_0225A3E0
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_02259898:
	movs r0, #0x73
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #0x30
	bl ov90_0225A544
	cmp r0, #1
	beq _022598AC
_022598AA:
	b _02259AF2
_022598AC:
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_022598B4:
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r1, r4, #0
	ldrh r2, [r4, #2]
	adds r0, r4, r0
	adds r1, #0x30
	bl ov90_0225A088
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #8
	adds r1, #0x18
	bl ov90_0225A258
	ldrb r1, [r4, #0x10]
	movs r6, #0
	str r0, [sp, #0x1c]
	cmp r1, #0
	ble _02259986
	movs r0, #0x81
	lsls r0, r0, #2
	adds r5, r4, r0
	adds r0, r4, #0
	str r0, [sp, #0x20]
	adds r0, #0x30
	str r0, [sp, #0x20]
	adds r0, r4, #0
	str r0, [sp, #0x24]
	adds r0, #0x84
	str r0, [sp, #0x24]
	adds r0, r4, #0
	str r0, [sp, #0x28]
	adds r0, #8
	str r0, [sp, #0x28]
	adds r0, r4, #0
	str r0, [sp, #0x2c]
	adds r0, #0x3c
	str r4, [sp, #0x18]
	adds r7, r6, #0
	str r0, [sp, #0x2c]
_02259904:
	ldr r0, [sp, #0x20]
	movs r3, #2
	str r0, [sp]
	str r6, [sp, #4]
	ldrb r0, [r4, #0x11]
	lsls r3, r3, #8
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	str r0, [sp, #0xc]
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [sp, #0x10]
	ldrh r0, [r4, #2]
	str r0, [sp, #0x14]
	ldrh r2, [r4, #4]
	ldr r3, [r4, r3]
	adds r0, r5, #0
	bl ov90_02259BCC
	ldr r0, [sp, #0x28]
	adds r1, r6, #0
	bl ov90_0225888C
	adds r1, r0, #0
	ldr r0, [sp, #0x28]
	bl ov90_022588A4
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x2c]
	ldr r2, [r2, #0x20]
	adds r0, r5, #0
	movs r3, #8
	bl ov90_02259D50
	adds r3, r4, r6
	ldrb r0, [r3, #0x1c]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x1c]
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	ldrb r3, [r3, #0x18]
	adds r0, r5, #0
	bl ov90_02259DAC
	movs r1, #7
	lsls r2, r7, #0x10
	adds r0, r5, #0
	mvns r1, r1
	asrs r2, r2, #0x10
	bl ov90_02259EE0
	ldr r0, [sp, #0x18]
	ldrb r1, [r4, #0x10]
	adds r0, r0, #4
	adds r6, r6, #1
	adds r5, #0x38
	str r0, [sp, #0x18]
	adds r7, r7, #3
	cmp r6, r1
	blt _02259904
_02259986:
	movs r6, #0
	cmp r1, #0
	ble _022599AE
	movs r0, #0x81
	lsls r0, r0, #2
	adds r7, r4, #0
	adds r5, r4, r0
	adds r7, #0x30
_02259996:
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov90_02259E8C
	adds r0, r5, #0
	bl ov90_02259EA0
	ldrb r0, [r4, #0x10]
	adds r6, r6, #1
	adds r5, #0x38
	cmp r6, r0
	blt _02259996
_022599AE:
	movs r0, #0x5c
	strb r0, [r4, #1]
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_022599BA:
	adds r0, r4, #0
	bl ov90_02259B68
	cmp r0, #1
	bne _022599EA
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_022599CC:
	ldrb r0, [r4, #1]
	subs r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _022599EA
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	movs r0, #0x81
	bl FUN_02037AC0
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _022599EC
_022599EA:
	b _02259AF2
_022599EC:
	bl FUN_021E6A4C
	b _02259AF2
_022599F2:
	movs r0, #0x81
	bl FUN_02037B38
	cmp r0, #0
	beq _02259AF2
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_02259A04:
	ldrb r0, [r4, #0x10]
	movs r7, #0
	cmp r0, #0
	ble _02259A2A
	movs r0, #0x81
	lsls r0, r0, #2
	adds r6, r7, #0
	adds r5, r4, r0
_02259A14:
	lsls r1, r6, #0x10
	adds r0, r5, #0
	asrs r1, r1, #0x10
	bl ov90_02259F44
	ldrb r0, [r4, #0x10]
	adds r7, r7, #1
	adds r6, r6, #3
	adds r5, #0x38
	cmp r7, r0
	blt _02259A14
_02259A2A:
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	movs r0, #8
	strb r0, [r4, #1]
	b _02259AF2
_02259A36:
	ldrb r0, [r4, #1]
	subs r0, r0, #1
	strb r0, [r4, #1]
	adds r0, r4, #0
	bl ov90_02259B68
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _02259AF2
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_02259A50:
	movs r0, #6
	str r0, [sp]
	movs r2, #1
	str r2, [sp, #4]
	ldrh r0, [r4, #2]
	movs r1, #0
	adds r3, r1, #0
	str r0, [sp, #8]
	movs r0, #3
	bl FUN_0200FA24
	adds r0, r4, #0
	bl ov90_02259B68
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	bne _02259AAE
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _02259A82
	cmp r0, #1
	beq _02259A8E
	cmp r0, #2
	beq _02259A9A
	b _02259AA4
_02259A82:
	ldr r0, _02259ADC @ =0x0225C1E8
	movs r1, #3
	bl ov90_02259B38
	str r0, [sp, #0x30]
	b _02259AA4
_02259A8E:
	ldr r0, _02259AE0 @ =_0225C1E0
	movs r1, #2
	bl ov90_02259B38
	str r0, [sp, #0x30]
	b _02259AA4
_02259A9A:
	ldr r0, _02259AE4 @ =0x0225C1E4
	movs r1, #3
	bl ov90_02259B38
	str r0, [sp, #0x30]
_02259AA4:
	movs r0, #0x1a
	add r1, sp, #0x30
	movs r2, #4
	bl FUN_02037030
_02259AAE:
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_02259AB6:
	adds r0, r4, #0
	bl ov90_02259B68
	bl FUN_0200FB5C
	cmp r0, #1
	bne _02259AF2
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov90_0225A108
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _02259AF2
	nop
_02259AD8: .4byte 0x0000FFFF
_02259ADC: .4byte 0x0225C1E8
_02259AE0: .4byte _0225C1E0
_02259AE4: .4byte 0x0225C1E4
_02259AE8:
	ldrb r1, [r4, #7]
	cmp r1, #1
	bne _02259AF2
	adds r0, r0, #1
	strb r0, [r4]
_02259AF2:
	adds r0, r4, #0
	adds r0, #0x84
	bl ov90_02259170
	ldr r0, [r4, #0x30]
	movs r1, #3
	movs r2, #4
	movs r3, #2
	bl FUN_0201F238
	ldr r0, [r4, #0x30]
	movs r1, #5
	movs r2, #4
	movs r3, #2
	bl FUN_0201F238
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov90_02259794

	thumb_func_start ov90_02259B18
ov90_02259B18: @ 0x02259B18
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x30
	bl ov90_022590C0
	adds r0, r4, #0
	adds r0, #0x84
	bl ov90_0225917C
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov90_0225A198
	pop {r4, pc}
	thumb_func_end ov90_02259B18

	thumb_func_start ov90_02259B38
ov90_02259B38: @ 0x02259B38
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0201FDB8
	movs r1, #0x64
	blx FUN_020F2BA4
	movs r3, #0
	adds r0, r3, #0
	cmp r4, #0
	bls _02259B5E
_02259B50:
	ldrb r2, [r5, r0]
	adds r3, r3, r2
	cmp r3, r1
	bhi _02259B64
	adds r0, r0, #1
	cmp r0, r4
	blo _02259B50
_02259B5E:
	bl GF_AssertFail
	subs r0, r4, #1
_02259B64:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov90_02259B38

	thumb_func_start ov90_02259B68
ov90_02259B68: @ 0x02259B68
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldrb r0, [r7, #0x10]
	cmp r0, #0
	ble _02259BC6
	movs r0, #0x81
	lsls r0, r0, #2
	adds r6, r7, r0
	adds r4, r7, #0
	adds r5, r6, #0
_02259B86:
	movs r0, #0x85
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02259BB0
	adds r0, r6, #0
	bl ov90_02259F7C
	str r0, [sp, #8]
	movs r0, #0xb9
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r1, r5, #0
	bl ov90_0225A134
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02259BB4
	movs r0, #0
	str r0, [sp]
	b _02259BB4
_02259BB0:
	movs r0, #0
	str r0, [sp]
_02259BB4:
	ldr r0, [sp, #4]
	ldrb r1, [r7, #0x10]
	adds r0, r0, #1
	adds r4, #0x38
	adds r6, #0x38
	adds r5, #0x38
	str r0, [sp, #4]
	cmp r0, r1
	blt _02259B86
_02259BC6:
	ldr r0, [sp]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov90_02259B68

	thumb_func_start ov90_02259BCC
ov90_02259BCC: @ 0x02259BCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r5, r0, #0
	ldr r0, [sp, #0x48]
	adds r6, r3, #0
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x54]
	str r1, [sp, #0x1c]
	ldr r4, [sp, #0x4c]
	str r0, [sp, #0x54]
	cmp r2, #0
	beq _02259BEC
	cmp r2, #1
	beq _02259BFA
	cmp r2, #2
	bne _02259C10
_02259BEC:
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x50]
	adds r1, r4, #0
	bl ov90_0225A050
	adds r7, r0, #0
	b _02259C12
_02259BFA:
	ldr r0, [sp, #0x50]
	cmp r0, r4
	bls _02259C04
	adds r7, r4, #1
	b _02259C12
_02259C04:
	cmp r0, r4
	bne _02259C0C
	movs r7, #0
	b _02259C12
_02259C0C:
	adds r7, r4, #0
	b _02259C12
_02259C10:
	adds r7, r4, #0
_02259C12:
	movs r0, #1
	movs r1, #2
	bl FUN_0201BB68
	movs r0, #0
	movs r1, #1
	bl FUN_0201BB68
	ldr r1, [sp, #0x1c]
	movs r0, #0xc
	adds r2, r1, #0
	muls r2, r0, r2
	str r2, [sp, #0x2c]
	ldr r2, _02259D38 @ =0x0225C310
	ldr r1, [sp, #0x2c]
	movs r3, #5
	adds r1, r2, r1
	ldrb r1, [r7, r1]
	movs r2, #0
	str r1, [sp, #0x28]
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #0x1a
	str r1, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0x68
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _02259D3C @ =0x00000201
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x48]
	adds r1, r5, #0
	ldr r0, [r0]
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x20
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r0, #0xc
	str r0, [sp, #8]
	movs r2, #0
	ldr r1, _02259D40 @ =0x0225C314
	ldr r0, [sp, #0x2c]
	str r2, [sp, #0xc]
	adds r0, r1, r0
	ldrb r0, [r4, r0]
	ldr r3, [sp, #0x28]
	movs r1, #1
	str r0, [sp, #0x10]
	ldrh r0, [r6]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r6, #2]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x48]
	ldr r0, [r0]
	bl FUN_0201C4EC
	ldr r0, [sp, #0x28]
	ldr r1, _02259D44 @ =0x0225C318
	lsls r0, r0, #3
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x2c]
	ldr r2, _02259D48 @ =0x0225C274
	adds r0, r1, r0
	ldrb r0, [r7, r0]
	ldr r3, _02259D4C @ =0x0225C276
	ldr r1, [sp, #0x54]
	lsls r6, r0, #2
	ldrsh r2, [r2, r6]
	str r0, [sp, #0x24]
	movs r0, #0
	ldrsh r6, [r3, r6]
	str r0, [sp]
	ldr r0, [sp, #0x5c]
	ldr r3, [sp, #0x20]
	str r0, [sp, #4]
	adds r3, r6, r3
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	ldr r0, [sp, #0x58]
	ldr r1, [r1]
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov90_02258EB4
	ldr r1, [sp, #0x24]
	str r0, [r5, #0x10]
	bl FUN_020248F0
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	bl FUN_02024A74
	ldr r0, [r5, #0x10]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x10]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x5c]
	ldr r3, [sp, #0x20]
	str r0, [sp, #4]
	ldr r1, [sp, #0x54]
	adds r3, #0x15
	str r3, [sp, #0x20]
	lsls r3, r3, #0x18
	ldr r0, [sp, #0x58]
	ldr r1, [r1]
	movs r2, #0x18
	lsrs r3, r3, #0x18
	bl ov90_02258EB4
	str r0, [r5, #0x14]
	movs r1, #0
	bl FUN_020248F0
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl FUN_02024830
	strb r4, [r5, #0x1a]
	ldr r0, [sp, #0x1c]
	strb r7, [r5, #0x1b]
	strh r0, [r5, #0x18]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02259D38: .4byte 0x0225C310
_02259D3C: .4byte 0x00000201
_02259D40: .4byte 0x0225C314
_02259D44: .4byte 0x0225C318
_02259D48: .4byte 0x0225C274
_02259D4C: .4byte 0x0225C276
	thumb_func_end ov90_02259BCC

	thumb_func_start ov90_02259D50
ov90_02259D50: @ 0x02259D50
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r2, #0
	adds r4, r3, #0
	bl ov90_02259200
	ldr r0, [sp, #0x1c]
	add r1, sp, #8
	cmp r0, #1
	bne _02259D8A
	movs r0, #0x10
	ldrsh r0, [r1, r0]
	lsls r3, r4, #0x18
	movs r1, #0xa
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, _02259DA8 @ =0x00050600
	adds r2, r6, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	lsrs r3, r3, #0x18
	bl ov90_02259350
	add sp, #8
	pop {r4, r5, r6, pc}
_02259D8A:
	movs r0, #0x10
	ldrsh r0, [r1, r0]
	lsls r3, r4, #0x18
	movs r1, #0xa
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r6, #0
	lsrs r3, r3, #0x18
	bl ov90_022592A8
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02259DA8: .4byte 0x00050600
	thumb_func_end ov90_02259D50

	thumb_func_start ov90_02259DAC
ov90_02259DAC: @ 0x02259DAC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r3, #0
	cmp r2, #0
	beq _02259DE8
	cmp r4, #0
	beq _02259E14
	adds r0, r5, #0
	bl ov90_022591F4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov90_02259210
	movs r0, #0x10
	str r0, [sp]
	add r4, sp, #8
	movs r3, #0x14
	ldrsh r3, [r4, r3]
	adds r0, r5, #0
	movs r1, #0xb
	lsls r3, r3, #0x18
	adds r2, r6, #0
	lsrs r3, r3, #0x18
	bl ov90_022592A8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02259DE8:
	cmp r4, #0
	beq _02259E14
	adds r0, r5, #0
	bl ov90_022591F4
	ldr r2, [sp, #0x18]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov90_02259220
	movs r0, #0x10
	str r0, [sp]
	add r4, sp, #8
	movs r3, #0x14
	ldrsh r3, [r4, r3]
	adds r0, r5, #0
	movs r1, #0xc
	lsls r3, r3, #0x18
	adds r2, r6, #0
	lsrs r3, r3, #0x18
	bl ov90_022592A8
_02259E14:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov90_02259DAC

	thumb_func_start ov90_02259E18
ov90_02259E18: @ 0x02259E18
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	adds r4, r1, #0
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r5, #0x14]
	adds r1, r4, #4
	bl FUN_020248F0
	ldr r0, [r5, #0x14]
	movs r1, #1
	bl FUN_0202484C
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_02259E18

	thumb_func_start ov90_02259E38
ov90_02259E38: @ 0x02259E38
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r1, #0
	adds r1, r2, #0
	adds r6, r0, #0
	ldr r2, [sp, #0x1c]
	adds r0, r5, #0
	adds r4, r3, #0
	bl ov90_02259234
	ldr r0, [sp, #0x1c]
	add r1, sp, #8
	cmp r0, #5
	bne _02259E70
	movs r0, #0x10
	ldrsh r0, [r1, r0]
	lsls r3, r4, #0x18
	movs r1, #0xe
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r6, #0
	lsrs r3, r3, #0x18
	bl ov90_022592C4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02259E70:
	movs r0, #0x10
	ldrsh r0, [r1, r0]
	lsls r3, r4, #0x18
	movs r1, #0xd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r6, #0
	lsrs r3, r3, #0x18
	bl ov90_022592C4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov90_02259E38

	thumb_func_start ov90_02259E8C
ov90_02259E8C: @ 0x02259E8C
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_0201D5C8
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0201EFBC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov90_02259E8C

	thumb_func_start ov90_02259EA0
ov90_02259EA0: @ 0x02259EA0
	ldr r3, _02259EA8 @ =FUN_02024830
	ldr r0, [r0, #0x10]
	movs r1, #1
	bx r3
	.align 2, 0
_02259EA8: .4byte FUN_02024830
	thumb_func_end ov90_02259EA0

	thumb_func_start ov90_02259EAC
ov90_02259EAC: @ 0x02259EAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02259EBE
	bl FUN_02024758
	movs r0, #0
	str r0, [r4, #0x10]
_02259EBE:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _02259ECC
	bl FUN_02024758
	movs r0, #0
	str r0, [r4, #0x14]
_02259ECC:
	adds r0, r4, #0
	bl FUN_0201D3F0
	cmp r0, #1
	bne _02259EDC
	adds r0, r4, #0
	bl FUN_0201D520
_02259EDC:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov90_02259EAC

	thumb_func_start ov90_02259EE0
ov90_02259EE0: @ 0x02259EE0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r1, #0
	ble _02259EFC
	lsls r0, r1, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02259F0A
_02259EFC:
	lsls r0, r1, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02259F0A:
	blx FUN_020F2104
	adds r2, r0, #0
	movs r0, #8
	str r0, [sp]
	adds r0, r5, #0
	movs r3, #7
	ldr r1, _02259F3C @ =0xFFF01000
	adds r0, #0x1c
	lsls r3, r3, #0xe
	bl ov90_02258CF0
	movs r0, #0
	strh r0, [r5, #0x30]
	ldr r0, _02259F40 @ =0x0000057E
	strh r4, [r5, #0x32]
	str r0, [r5, #0x34]
	ldr r1, [r5, #0x1c]
	adds r0, r5, #0
	asrs r1, r1, #0xc
	rsbs r1, r1, #0
	bl ov90_02259FC8
	pop {r3, r4, r5, pc}
	nop
_02259F3C: .4byte 0xFFF01000
_02259F40: .4byte 0x0000057E
	thumb_func_end ov90_02259EE0

	thumb_func_start ov90_02259F44
ov90_02259F44: @ 0x02259F44
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #8
	str r0, [sp]
	adds r4, r1, #0
	adds r0, r5, #0
	ldr r1, [r5, #0x1c]
	ldr r2, _02259F74 @ =0xFFF01000
	adds r0, #0x1c
	movs r3, #0
	bl ov90_02258CF0
	movs r0, #0
	strh r0, [r5, #0x30]
	ldr r0, _02259F78 @ =0x0000057F
	strh r4, [r5, #0x32]
	str r0, [r5, #0x34]
	ldr r1, [r5, #0x1c]
	adds r0, r5, #0
	asrs r1, r1, #0xc
	rsbs r1, r1, #0
	bl ov90_02259FC8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02259F74: .4byte 0xFFF01000
_02259F78: .4byte 0x0000057F
	thumb_func_end ov90_02259F44

	thumb_func_start ov90_02259F7C
ov90_02259F7C: @ 0x02259F7C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bgt _02259FBE
	movs r0, #0x30
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bne _02259F9A
	ldr r0, [r5, #0x34]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0200604C
_02259F9A:
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	adds r0, r0, #1
	strh r0, [r5, #0x30]
	ldrsh r1, [r5, r1]
	adds r0, r5, #0
	adds r0, #0x1c
	bl ov90_02258D4C
	ldr r1, [r5, #0x1c]
	adds r4, r0, #0
	asrs r1, r1, #0xc
	adds r0, r5, #0
	rsbs r1, r1, #0
	bl ov90_02259FC8
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_02259FBE:
	subs r0, r0, #1
	strh r0, [r5, #0x32]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov90_02259F7C

	thumb_func_start ov90_02259FC8
ov90_02259FC8: @ 0x02259FC8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldrh r0, [r5, #0x18]
	adds r4, r1, #0
	ldrb r2, [r5, #0x1b]
	subs r1, r0, #1
	movs r0, #0xc
	adds r3, r1, #0
	muls r3, r0, r3
	ldr r0, _0225A040 @ =0x0225C324
	ldr r6, _0225A044 @ =0x0225C31C
	adds r0, r0, r3
	ldrb r0, [r2, r0]
	adds r3, r6, r3
	ldrb r2, [r2, r3]
	lsls r1, r0, #2
	ldr r0, _0225A048 @ =0x0225C276
	lsls r2, r2, #3
	ldrsh r0, [r0, r1]
	adds r0, r0, r2
	ldr r2, _0225A04C @ =0x0225C274
	lsls r0, r0, #0x18
	ldrsh r1, [r2, r1]
	lsrs r0, r0, #0x18
	lsls r0, r0, #0xc
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r1, r1, r4
	lsls r1, r1, #0xc
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	add r1, sp, #0
	bl FUN_020247D4
	ldrh r0, [r5, #0x18]
	adds r4, #0x18
	subs r1, r0, #1
	adds r2, r1, #0
	movs r0, #0xc
	muls r2, r0, r2
	adds r0, r6, #0
	ldrb r1, [r5, #0x1b]
	adds r0, r0, r2
	ldrb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, #0x15
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	lsls r0, r4, #0xc
	str r0, [sp]
	lsls r0, r1, #0xc
	str r0, [sp, #4]
	ldr r0, [r5, #0x14]
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0225A040: .4byte 0x0225C324
_0225A044: .4byte 0x0225C31C
_0225A048: .4byte 0x0225C276
_0225A04C: .4byte 0x0225C274
	thumb_func_end ov90_02259FC8

	thumb_func_start ov90_0225A050
ov90_0225A050: @ 0x0225A050
	push {r4, r5, r6, r7}
	adds r5, r0, #0
	ldr r4, _0225A080 @ =0x00000000
	beq _0225A076
	ldr r7, _0225A084 @ =0x0225C284
	lsls r6, r5, #2
	adds r7, r7, r6
_0225A05E:
	subs r6, r7, #4
	ldrb r6, [r6]
	cmp r1, r6
	bne _0225A068
	adds r3, r4, #0
_0225A068:
	cmp r2, r6
	bne _0225A06E
	adds r0, r4, #0
_0225A06E:
	adds r4, r4, #1
	adds r7, r7, #1
	cmp r4, r5
	blo _0225A05E
_0225A076:
	subs r0, r3, r0
	bpl _0225A07C
	adds r0, r0, r5
_0225A07C:
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_0225A080: .4byte 0x00000000
_0225A084: .4byte 0x0225C284
	thumb_func_end ov90_0225A050

	thumb_func_start ov90_0225A088
ov90_0225A088: @ 0x0225A088
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	adds r4, r1, #0
	str r2, [sp]
	cmp r0, #0
	beq _0225A09E
	bl GF_AssertFail
_0225A09E:
	movs r1, #0
	str r4, [r6]
	adds r3, r1, #0
	ldr r0, [r4]
	adds r2, r1, #0
	subs r3, #0xff
	bl FUN_0201BC8C
	ldr r0, [r6]
	movs r2, #0
	adds r3, r2, #0
	ldr r0, [r0]
	movs r1, #1
	subs r3, #0xff
	bl FUN_0201BC8C
	movs r7, #6
	movs r4, #0
	adds r5, r6, #4
	lsls r7, r7, #6
_0225A0C6:
	movs r2, #6
	ldr r0, _0225A100 @ =0x0000FF01
	adds r1, r5, #0
	lsls r2, r2, #6
	blx FUN_020D4790
	adds r4, r4, #1
	adds r5, r5, r7
	cmp r4, #2
	blt _0225A0C6
	movs r2, #0x61
	lsls r2, r2, #2
	ldr r0, [sp]
	adds r1, r6, #4
	adds r2, r6, r2
	bl FUN_02014A08
	movs r1, #0xc1
	lsls r1, r1, #2
	str r0, [r6, r1]
	ldr r0, [r6, r1]
	movs r1, #0
	bl FUN_02014A78
	ldr r0, _0225A104 @ =ov90_0225A1B8
	adds r1, r6, #0
	bl FUN_0201A120
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225A100: .4byte 0x0000FF01
_0225A104: .4byte ov90_0225A1B8
	thumb_func_end ov90_0225A088

	thumb_func_start ov90_0225A108
ov90_0225A108: @ 0x0225A108
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0225A130
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A120
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02014A38
	movs r0, #0xc1
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_0225A130:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov90_0225A108

	thumb_func_start ov90_0225A134
ov90_0225A134: @ 0x0225A134
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	movs r1, #0xc1
	lsls r1, r1, #2
	str r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _0225A148
	bl GF_AssertFail
_0225A148:
	movs r1, #0xc1
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_02014A4C
	ldr r1, _0225A194 @ =0x0225C31C
	adds r5, r0, #0
	movs r6, #0
	movs r7, #0xc
_0225A15C:
	ldrh r0, [r4, #0x18]
	subs r3, r6, #1
	adds r2, r0, #0
	muls r2, r7, r2
	ldrb r0, [r4, #0x1b]
	adds r2, r1, r2
	adds r0, r0, r2
	subs r0, #0xc
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r2, r3, r0
	bpl _0225A176
	adds r2, #0xc0
_0225A176:
	ldr r0, [r4, #0x1c]
	lsls r2, r2, #1
	asrs r0, r0, #0xc
	adds r6, r6, #1
	strh r0, [r5, r2]
	cmp r6, #0x30
	blt _0225A15C
	movs r1, #0xc1
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #1
	bl FUN_02014A78
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225A194: .4byte 0x0225C31C
	thumb_func_end ov90_0225A134

	thumb_func_start ov90_0225A198
ov90_0225A198: @ 0x0225A198
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0225A1B6
	bl FUN_02014A8C
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02014A78
_0225A1B6:
	pop {r4, pc}
	thumb_func_end ov90_0225A198

	thumb_func_start ov90_0225A1B8
ov90_0225A1B8: @ 0x0225A1B8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0225A1FC @ =0x04000006
	ldrh r4, [r0]
	cmp r4, #0xc0
	bge _0225A1F8
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02014A60
	adds r6, r0, #0
	ldr r0, _0225A200 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #2
	tst r0, r1
	beq _0225A1F8
	lsls r4, r4, #1
	ldr r0, [r5]
	movs r1, #0
	ldrsh r3, [r6, r4]
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0201BC8C
	ldr r0, [r5]
	ldrsh r3, [r6, r4]
	ldr r0, [r0]
	movs r1, #1
	movs r2, #0
	bl FUN_0201BC8C
_0225A1F8:
	pop {r4, r5, r6, pc}
	nop
_0225A1FC: .4byte 0x04000006
_0225A200: .4byte 0x04000004
	thumb_func_end ov90_0225A1B8

	thumb_func_start ov90_0225A204
ov90_0225A204: @ 0x0225A204
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r1, #0
	str r0, [sp]
	ldrb r0, [r5, #8]
	movs r4, #0
	cmp r0, #0
	ble _0225A252
	ldr r6, [sp]
_0225A216:
	adds r1, r5, r4
	ldrb r1, [r1, #4]
	adds r0, r5, #0
	bl ov90_022588CC
	str r0, [r6, #8]
	cmp r0, #0
	bne _0225A22A
	bl GF_AssertFail
_0225A22A:
	adds r0, r5, r4
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r7, r0, r4
	ldr r0, [sp, #4]
	ldrb r0, [r0, #4]
	bl FUN_020348A8
	ldr r1, [sp]
	strb r0, [r1, r4]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #4]
	bl FUN_020348CC
	strb r0, [r7, #4]
	ldrb r0, [r5, #8]
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, r0
	blt _0225A216
_0225A252:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov90_0225A204

	thumb_func_start ov90_0225A258
ov90_0225A258: @ 0x0225A258
	push {r3, r4, r5, r6}
	ldrb r4, [r0, #8]
	movs r3, #0
	adds r2, r3, #0
	subs r4, r4, #1
	cmp r4, #0
	ble _0225A286
	movs r5, #1
_0225A268:
	adds r4, r1, r2
	ldrb r6, [r4, #1]
	ldrb r4, [r1, r2]
	cmp r4, r6
	bne _0225A27A
	cmp r4, #0
	beq _0225A27A
	cmp r6, #0
	bne _0225A27C
_0225A27A:
	adds r3, r5, #0
_0225A27C:
	ldrb r4, [r0, #8]
	adds r2, r2, #1
	subs r4, r4, #1
	cmp r2, r4
	blt _0225A268
_0225A286:
	adds r0, r3, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov90_0225A258

	thumb_func_start ov90_0225A28C
ov90_0225A28C: @ 0x0225A28C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r1, #3
	blx FUN_020F2BA4
	adds r4, r1, #0
	adds r0, r5, #0
	movs r1, #3
	blx FUN_020F2BA4
	adds r1, r4, #1
	cmp r1, #3
	bhs _0225A2A8
	adds r4, r1, #0
_0225A2A8:
	lsls r1, r0, #1
	adds r0, r0, r1
	adds r0, r0, r4
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_0225A28C

	thumb_func_start ov90_0225A2B0
ov90_0225A2B0: @ 0x0225A2B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0xb
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r0, _0225A33C @ =0x00000201
	adds r4, r1, #0
	str r0, [sp, #0x10]
	adds r7, r2, #0
	adds r6, r3, #0
	ldr r0, [r4]
	adds r1, r5, #0
	movs r2, #1
	movs r3, #6
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r1, [sp, #0x2c]
	movs r0, #0x80
	bl FUN_02026354
	str r0, [r5, #0x14]
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov90_0225927C
	ldr r1, [r5, #0x14]
	adds r0, r7, #0
	movs r2, #0x10
	bl ov90_0225928C
	movs r0, #1
	movs r1, #0
	str r6, [r5, #0x10]
	bl FUN_02022C60
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, [sp, #0x2c]
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	ldr r2, [r4]
	movs r1, #7
	bl FUN_02007B44
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, [sp, #0x2c]
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	ldr r2, [r4]
	movs r1, #0xa
	bl FUN_02007B68
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225A33C: .4byte 0x00000201
	thumb_func_end ov90_0225A2B0

	thumb_func_start ov90_0225A340
ov90_0225A340: @ 0x0225A340
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0201D520
	ldr r0, [r4, #0x14]
	bl FUN_02026380
	pop {r4, pc}
	thumb_func_end ov90_0225A340

	thumb_func_start ov90_0225A350
ov90_0225A350: @ 0x0225A350
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x10]
	adds r4, r1, #0
	adds r7, r2, #0
	lsls r6, r0, #2
	ldr r1, _0225A3D0 @ =0x0225C258
	ldr r2, _0225A3D4 @ =0x0225C228
	ldr r3, _0225A3D8 @ =0x0225C21C
	movs r0, #0x10
	str r0, [sp]
	adds r0, r5, #0
	ldr r1, [r1, r6]
	ldr r2, [r2, r6]
	ldr r3, [r3, r6]
	adds r0, #0x18
	bl ov90_02258CF0
	ldr r2, [r5, #0x18]
	adds r0, r5, #0
	adds r1, r4, #0
	asrs r2, r2, #0xc
	bl ov90_0225A5BC
	movs r0, #2
	adds r1, r7, #0
	bl FUN_02002CEC
	ldr r1, [r5, #0x14]
	movs r0, #2
	movs r2, #0
	bl FUN_02002F30
	movs r2, #0
	str r2, [sp]
	adds r3, r0, #0
	str r2, [sp, #4]
	ldr r0, [r5, #0x10]
	lsrs r4, r3, #1
	lsls r1, r0, #2
	ldr r0, _0225A3DC @ =0x0225C210
	movs r3, #0x50
	ldr r0, [r0, r1]
	movs r1, #2
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r2, [r5, #0x14]
	adds r0, r5, #0
	subs r3, r3, r4
	bl FUN_020200FC
	movs r0, #2
	bl FUN_02002DB4
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225A3D0: .4byte 0x0225C258
_0225A3D4: .4byte 0x0225C228
_0225A3D8: .4byte 0x0225C21C
_0225A3DC: .4byte 0x0225C210
	thumb_func_end ov90_0225A350

	thumb_func_start ov90_0225A3E0
ov90_0225A3E0: @ 0x0225A3E0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x10]
	adds r4, r1, #0
	lsls r3, r0, #2
	ldr r1, _0225A41C @ =0x0225C228
	ldr r2, _0225A420 @ =0x0225C1F8
	movs r0, #8
	str r0, [sp]
	adds r0, r5, #0
	ldr r6, _0225A424 @ =0x0225C204
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	ldr r3, [r6, r3]
	adds r0, #0x18
	bl ov90_02258CF0
	ldr r2, [r5, #0x18]
	adds r0, r5, #0
	adds r1, r4, #0
	asrs r2, r2, #0xc
	bl ov90_0225A60C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0225A41C: .4byte 0x0225C228
_0225A420: .4byte 0x0225C1F8
_0225A424: .4byte 0x0225C204
	thumb_func_end ov90_0225A3E0

	thumb_func_start ov90_0225A428
ov90_0225A428: @ 0x0225A428
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2e
	ldrsh r0, [r4, r0]
	adds r5, r1, #0
	cmp r0, #3
	bhi _0225A528
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225A444: @ jump table
	.2byte _0225A44C - _0225A444 - 2 @ case 0
	.2byte _0225A4A2 - _0225A444 - 2 @ case 1
	.2byte _0225A4F2 - _0225A444 - 2 @ case 2
	.2byte _0225A522 - _0225A444 - 2 @ case 3
_0225A44C:
	movs r1, #0x2c
	ldrsh r1, [r4, r1]
	adds r0, r4, #0
	adds r0, #0x18
	bl ov90_02258D4C
	ldr r2, [r4, #0x18]
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	asrs r2, r2, #0xc
	bl ov90_0225A60C
	movs r0, #0x2c
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #0x2c]
	cmp r6, #1
	bne _0225A528
	ldr r0, _0225A530 @ =0x00000581
	bl FUN_0200604C
	ldr r0, [r4, #0x10]
	ldr r1, _0225A534 @ =0x0225C228
	lsls r3, r0, #2
	ldr r2, _0225A538 @ =0x0225C234
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	ldr r5, _0225A53C @ =0x0225C240
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	ldr r3, [r5, r3]
	adds r0, #0x18
	bl ov90_02258CF0
	movs r0, #0x2e
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #0x2e]
	movs r0, #0
	strh r0, [r4, #0x2c]
	b _0225A528
_0225A4A2:
	movs r1, #0x2c
	ldrsh r1, [r4, r1]
	adds r0, r4, #0
	adds r0, #0x18
	bl ov90_02258D4C
	ldr r2, [r4, #0x18]
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	asrs r2, r2, #0xc
	bl ov90_0225A60C
	movs r0, #0x2c
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #0x2c]
	cmp r6, #1
	bne _0225A528
	ldr r0, [r4, #0x10]
	ldr r1, _0225A538 @ =0x0225C234
	lsls r3, r0, #2
	ldr r2, _0225A534 @ =0x0225C228
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	ldr r5, _0225A540 @ =0x0225C24C
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	ldr r3, [r5, r3]
	adds r0, #0x18
	bl ov90_02258CF0
	movs r0, #0x2e
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #0x2e]
	movs r0, #0
	strh r0, [r4, #0x2c]
	b _0225A528
_0225A4F2:
	movs r1, #0x2c
	ldrsh r1, [r4, r1]
	adds r0, r4, #0
	adds r0, #0x18
	bl ov90_02258D4C
	ldr r2, [r4, #0x18]
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	asrs r2, r2, #0xc
	bl ov90_0225A60C
	movs r0, #0x2c
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #0x2c]
	cmp r6, #1
	bne _0225A528
	movs r0, #0x2e
	ldrsh r0, [r4, r0]
	adds r0, r0, #1
	strh r0, [r4, #0x2e]
	b _0225A528
_0225A522:
	add sp, #4
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0225A528:
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0225A530: .4byte 0x00000581
_0225A534: .4byte 0x0225C228
_0225A538: .4byte 0x0225C234
_0225A53C: .4byte 0x0225C240
_0225A540: .4byte 0x0225C24C
	thumb_func_end ov90_0225A428

	thumb_func_start ov90_0225A544
ov90_0225A544: @ 0x0225A544
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r1, [r5, r1]
	cmp r1, #0
	beq _0225A558
	cmp r1, #1
	beq _0225A586
	b _0225A5B8
_0225A558:
	movs r1, #0x2c
	ldrsh r1, [r5, r1]
	adds r0, #0x18
	bl ov90_02258D4C
	ldr r2, [r5, #0x18]
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	asrs r2, r2, #0xc
	bl ov90_0225A60C
	movs r0, #0x2c
	ldrsh r0, [r5, r0]
	adds r0, r0, #1
	strh r0, [r5, #0x2c]
	cmp r6, #1
	bne _0225A5B8
	movs r0, #0x2e
	ldrsh r0, [r5, r0]
	adds r0, r0, #1
	strh r0, [r5, #0x2e]
	b _0225A5B8
_0225A586:
	bl FUN_0201D8C8
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov90_0225A5BC
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0201CAE0
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0201CAE0
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225A5B8:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov90_0225A544

	thumb_func_start ov90_0225A5BC
ov90_0225A5BC: @ 0x0225A5BC
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0x10]
	adds r5, r1, #0
	adds r4, r2, #0
	cmp r0, #0
	beq _0225A5D2
	cmp r0, #1
	beq _0225A5D2
	cmp r0, #2
	beq _0225A5EC
	b _0225A606
_0225A5D2:
	movs r1, #0
	ldr r0, [r5]
	adds r2, r1, #0
	adds r3, r4, #0
	bl FUN_0201BC8C
	ldr r0, [r5]
	movs r1, #1
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201BC8C
	pop {r3, r4, r5, pc}
_0225A5EC:
	ldr r0, [r5]
	movs r1, #0
	movs r2, #3
	adds r3, r4, #0
	bl FUN_0201BC8C
	ldr r0, [r5]
	movs r1, #1
	movs r2, #3
	adds r3, r4, #0
	bl FUN_0201BC8C
	pop {r3, r4, r5, pc}
_0225A606:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_0225A5BC

	thumb_func_start ov90_0225A60C
ov90_0225A60C: @ 0x0225A60C
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0x10]
	adds r5, r1, #0
	adds r4, r2, #0
	cmp r0, #0
	beq _0225A622
	cmp r0, #1
	beq _0225A622
	cmp r0, #2
	beq _0225A63C
	b _0225A656
_0225A622:
	movs r1, #0
	ldr r0, [r5]
	adds r2, r1, #0
	adds r3, r4, #0
	bl FUN_0201F238
	ldr r0, [r5]
	movs r1, #1
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201F238
	pop {r3, r4, r5, pc}
_0225A63C:
	ldr r0, [r5]
	movs r1, #0
	movs r2, #3
	adds r3, r4, #0
	bl FUN_0201F238
	ldr r0, [r5]
	movs r1, #1
	movs r2, #3
	adds r3, r4, #0
	bl FUN_0201F238
	pop {r3, r4, r5, pc}
_0225A656:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_0225A60C

	thumb_func_start ov90_0225A65C
ov90_0225A65C: @ 0x0225A65C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	beq _0225A672
	cmp r1, #1
	beq _0225A676
	cmp r1, #2
	beq _0225A67A
	b _0225A67E
_0225A672:
	movs r0, #1
	b _0225A680
_0225A676:
	movs r0, #2
	b _0225A680
_0225A67A:
	movs r0, #0
	b _0225A680
_0225A67E:
	movs r0, #1
_0225A680:
	lsls r4, r0, #5
	movs r0, #0xa0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0
	adds r3, r4, #0
	str r5, [sp, #8]
	bl FUN_02007BA4
	movs r0, #0xa0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #5
	movs r2, #4
	adds r3, r4, #0
	str r5, [sp, #8]
	bl FUN_02007BA4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov90_0225A65C

	thumb_func_start ov90_0225A6B4
ov90_0225A6B4: @ 0x0225A6B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r1, #0
	adds r5, r3, #0
	adds r6, r0, #0
	ldr r1, _0225A820 @ =0x00000664
	adds r0, r5, #0
	str r2, [sp, #4]
	bl FUN_0201AA8C
	ldr r2, _0225A820 @ =0x00000664
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r2, r4, #0
	adds r2, #0x1c
	movs r1, #0x18
_0225A6D8:
	ldrb r0, [r7]
	adds r7, r7, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0225A6D8
	adds r2, r4, #0
	adds r2, #0xc
	movs r1, #0x10
_0225A6EA:
	ldrb r0, [r6]
	adds r6, r6, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0225A6EA
	ldr r0, [sp, #4]
	strb r0, [r4, #7]
	adds r0, r4, #0
	bl ov90_0225C15C
	ldr r3, _0225A824 @ =0x04000050
	movs r1, #0
	strh r1, [r3]
	ldr r0, _0225A828 @ =0x04001050
	subs r3, #0x50
	strh r1, [r0]
	ldr r2, [r3]
	ldr r1, _0225A82C @ =0xFFFF1FFF
	subs r0, #0x50
	ands r2, r1
	str r2, [r3]
	ldr r2, [r0]
	ands r1, r2
	str r1, [r0]
	ldr r0, _0225A830 @ =0x0225C2F4
	bl FUN_02022BE8
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x34
	adds r1, #0xc
	strh r5, [r4, #2]
	bl ov90_0225A204
	movs r0, #0x10
	adds r1, r5, #0
	bl FUN_0202055C
	adds r0, r4, #0
	ldr r1, _0225A834 @ =0x0225C264
	ldr r2, _0225A838 @ =0x0225C43C
	adds r0, #0x4c
	movs r3, #6
	str r5, [sp]
	bl ov90_02258FF0
	adds r0, r4, #0
	movs r2, #2
	adds r0, #0xa0
	movs r1, #0x20
	adds r3, r2, #0
	str r5, [sp]
	bl ov90_022590CC
	movs r0, #0x73
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #2
	adds r2, r5, #0
	bl ov90_02258DD0
	adds r0, r4, #0
	adds r0, #0x58
	adds r1, r5, #0
	bl ov90_02259184
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov90_0225A850
	adds r0, r4, #0
	ldrb r1, [r4, #0x15]
	adds r0, #0xc
	bl ov90_0225888C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xc
	bl ov90_022588A4
	str r5, [sp]
	adds r3, r0, #0
	adds r0, r4, #0
	adds r1, r4, #0
	ldr r2, [r4, #0xc]
	adds r0, #0x68
	adds r1, #0x4c
	bl ov90_0225938C
	movs r0, #0x7a
	lsls r0, r0, #2
	adds r1, r4, #0
	ldrb r2, [r4, #0x16]
	adds r0, r4, r0
	adds r1, #0x4c
	adds r3, r5, #0
	bl ov90_0225B340
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0xc
	adds r1, #0x34
	bl ov90_0225A258
	strb r0, [r4, #5]
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _0225A7CE
	cmp r0, #1
	beq _0225A7CE
	cmp r0, #2
	beq _0225A7DE
	b _0225A7EE
_0225A7CE:
	ldr r0, _0225A83C @ =ov90_0225A980
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	ldr r1, _0225A840 @ =0x00000644
	str r0, [r4, r1]
	b _0225A800
_0225A7DE:
	ldr r0, _0225A844 @ =ov90_0225AE4C
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	ldr r1, _0225A840 @ =0x00000644
	str r0, [r4, r1]
	b _0225A800
_0225A7EE:
	bl GF_AssertFail
	ldr r0, _0225A83C @ =ov90_0225A980
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	ldr r1, _0225A840 @ =0x00000644
	str r0, [r4, r1]
_0225A800:
	ldr r0, _0225A848 @ =ov90_0225B230
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E374
	ldr r1, _0225A84C @ =0x00000648
	str r0, [r4, r1]
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	beq _0225A81A
	adds r0, r5, #0
	bl FUN_021E69A8
_0225A81A:
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225A820: .4byte 0x00000664
_0225A824: .4byte 0x04000050
_0225A828: .4byte 0x04001050
_0225A82C: .4byte 0xFFFF1FFF
_0225A830: .4byte 0x0225C2F4
_0225A834: .4byte 0x0225C264
_0225A838: .4byte 0x0225C43C
_0225A83C: .4byte ov90_0225A980
_0225A840: .4byte 0x00000644
_0225A844: .4byte ov90_0225AE4C
_0225A848: .4byte ov90_0225B230
_0225A84C: .4byte 0x00000648
	thumb_func_end ov90_0225A6B4

	thumb_func_start ov90_0225A850
ov90_0225A850: @ 0x0225A850
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0xc8
	adds r4, r1, #0
	bl FUN_02007688
	movs r1, #0x12
	lsls r1, r1, #4
	str r1, [sp]
	movs r2, #0
	movs r1, #4
	adds r3, r2, #0
	adds r6, r0, #0
	str r4, [sp, #4]
	bl FUN_02007B8C
	movs r0, #0x12
	lsls r0, r0, #4
	str r0, [sp]
	movs r1, #4
	adds r0, r6, #0
	adds r2, r1, #0
	movs r3, #0
	str r4, [sp, #4]
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5, #0x4c]
	adds r0, r6, #0
	movs r1, #6
	movs r3, #1
	bl FUN_02007B44
	movs r1, #0
	movs r0, #1
	str r1, [sp]
	lsls r0, r0, #0xe
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5, #0x4c]
	adds r0, r6, #0
	movs r1, #6
	movs r3, #5
	bl FUN_02007B44
	movs r3, #0x96
	lsls r3, r3, #2
	adds r0, r6, #0
	movs r1, #9
	movs r2, #0
	adds r3, r5, r3
	str r4, [sp]
	bl FUN_02007C2C
	movs r1, #0x95
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5, #0x4c]
	adds r0, r6, #0
	movs r1, #8
	movs r3, #3
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5, #0x4c]
	adds r0, r6, #0
	movs r1, #8
	movs r3, #5
	bl FUN_02007B68
	ldrb r1, [r5, #7]
	adds r0, r6, #0
	adds r2, r4, #0
	bl ov90_0225A65C
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0xd
	str r0, [sp, #4]
	movs r0, #0xe
	str r0, [sp, #8]
	ldr r0, _0225A95C @ =0x00001388
	adds r1, r6, #0
	str r0, [sp, #0xc]
	movs r0, #0x73
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r2, #0xb
	movs r3, #5
	str r4, [sp, #0x10]
	bl ov90_02258E54
	movs r1, #0x79
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov90_0225B254
	movs r3, #0x82
	lsls r3, r3, #2
	adds r0, r5, r3
	adds r1, r5, #0
	adds r2, r5, #0
	subs r3, #0x3c
	str r6, [sp]
	adds r1, #0x4c
	adds r2, #0xa0
	adds r3, r5, r3
	str r4, [sp, #4]
	bl ov90_0225B59C
	adds r0, r6, #0
	bl FUN_0200770C
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0225A95C: .4byte 0x00001388
	thumb_func_end ov90_0225A850

	thumb_func_start ov90_0225A960
ov90_0225A960: @ 0x0225A960
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x82
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov90_0225B690
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl ov90_0225B330
	pop {r4, pc}
	thumb_func_end ov90_0225A960

	thumb_func_start ov90_0225A980
ov90_0225A980: @ 0x0225A980
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r1, #0
	ldrb r1, [r4, #4]
	cmp r1, #0x17
	bhi _0225AA8A
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225A998: @ jump table
	.2byte _0225A9C8 - _0225A998 - 2 @ case 0
	.2byte _0225AA38 - _0225A998 - 2 @ case 1
	.2byte _0225AA48 - _0225A998 - 2 @ case 2
	.2byte _0225AA60 - _0225A998 - 2 @ case 3
	.2byte _0225AA7A - _0225A998 - 2 @ case 4
	.2byte _0225AAEC - _0225A998 - 2 @ case 5
	.2byte _0225AB5E - _0225A998 - 2 @ case 6
	.2byte _0225ABCA - _0225A998 - 2 @ case 7
	.2byte _0225ABDC - _0225A998 - 2 @ case 8
	.2byte _0225ABEC - _0225A998 - 2 @ case 9
	.2byte _0225AC08 - _0225A998 - 2 @ case 10
	.2byte _0225AC40 - _0225A998 - 2 @ case 11
	.2byte _0225AC74 - _0225A998 - 2 @ case 12
	.2byte _0225ACDC - _0225A998 - 2 @ case 13
	.2byte _0225ACF6 - _0225A998 - 2 @ case 14
	.2byte _0225AD1E - _0225A998 - 2 @ case 15
	.2byte _0225AD42 - _0225A998 - 2 @ case 16
	.2byte _0225AD60 - _0225A998 - 2 @ case 17
	.2byte _0225AD80 - _0225A998 - 2 @ case 18
	.2byte _0225AD8E - _0225A998 - 2 @ case 19
	.2byte _0225AD9C - _0225A998 - 2 @ case 20
	.2byte _0225ADCC - _0225A998 - 2 @ case 21
	.2byte _0225ADDC - _0225A998 - 2 @ case 22
	.2byte _0225ADF2 - _0225A998 - 2 @ case 23
_0225A9C8:
	ldr r0, [r4, #0x18]
	ldr r1, [r0]
	ldr r0, _0225ACA8 @ =0x0000064C
	str r1, [r4, r0]
	ldrb r0, [r4, #0x17]
	cmp r0, #1
	bne _0225A9DC
	movs r0, #0
	strb r0, [r4, #9]
	b _0225AA1A
_0225A9DC:
	adds r0, r4, #0
	bl ov90_0225BA14
	ldrb r2, [r4, #0x15]
	adds r1, r4, r2
	adds r1, #0x2c
	ldrb r1, [r1]
	cmp r1, #0
	bne _0225AA0A
	lsls r1, r2, #2
	adds r1, r4, r1
	ldr r1, [r1, #0x1c]
	cmp r1, r0
	bls _0225AA0A
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	bl ov90_0225A28C
	ldr r1, [r4, #0x18]
	str r0, [r1]
	movs r0, #1
	strb r0, [r4, #9]
	b _0225AA0E
_0225AA0A:
	movs r0, #0
	strb r0, [r4, #9]
_0225AA0E:
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	bne _0225AA1A
	adds r0, r4, #0
	bl ov90_0225BA38
_0225AA1A:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldrh r0, [r4, #2]
	ldr r3, _0225ACAC @ =0x0000FFFF
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #3
	bl FUN_0200FA24
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AA38:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225AA8A
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AA48:
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x68
	adds r1, #0x58
	movs r2, #1
	movs r3, #0
	bl ov90_02259464
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AA60:
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #0
	bl ov90_02259538
	cmp r0, #0
	beq _0225AA8A
	movs r0, #0x40
	strh r0, [r4]
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AA7A:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AA8A
	subs r0, r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AA8C
_0225AA8A:
	b _0225AE1C
_0225AA8C:
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #0
	movs r5, #1
	bl ov90_022594FC
	movs r0, #0xcf
	lsls r0, r0, #2
	adds r1, r4, #0
	ldrh r2, [r4, #2]
	adds r0, r4, r0
	adds r1, #0x4c
	bl ov90_0225A088
	adds r0, r4, #0
	bl ov90_0225BA14
	ldrb r6, [r4, #0x14]
	adds r2, r0, #0
	movs r1, #0
	cmp r6, #0
	ble _0225AACC
	adds r3, r4, #0
	adds r7, r1, #0
_0225AABC:
	ldr r0, [r3, #0x1c]
	cmp r0, r2
	bls _0225AAC4
	adds r5, r7, #0
_0225AAC4:
	adds r1, r1, #1
	adds r3, r3, #4
	cmp r1, r6
	blt _0225AABC
_0225AACC:
	cmp r5, #1
	bne _0225AADC
	ldr r0, _0225ACB0 @ =0x00000652
	movs r1, #0x10
	strh r1, [r4, r0]
	movs r0, #0x16
	strb r0, [r4, #4]
	b _0225AE1C
_0225AADC:
	ldrb r0, [r4, #4]
	movs r1, #4
	adds r0, r0, #1
	strb r0, [r4, #4]
	movs r0, #0x65
	lsls r0, r0, #4
	strh r1, [r4, r0]
	b _0225AE1C
_0225AAEC:
	movs r7, #0x65
	movs r1, #0
	movs r6, #1
	lsls r7, r7, #4
_0225AAF4:
	ldrh r0, [r4, r7]
	subs r0, r0, #1
	strh r0, [r4, r7]
	ldrb r3, [r4, #0x14]
	movs r0, #0
	cmp r3, #0
	ble _0225AB1A
	movs r2, #0x65
	lsls r2, r2, #4
	ldrh r2, [r4, r2]
_0225AB08:
	adds r5, r4, r0
	adds r5, #0x2c
	ldrb r5, [r5]
	cmp r2, r5
	bne _0225AB14
	adds r1, r6, #0
_0225AB14:
	adds r0, r0, #1
	cmp r0, r3
	blt _0225AB08
_0225AB1A:
	cmp r1, #0
	beq _0225AAF4
	movs r1, #0x65
	lsls r1, r1, #4
	ldrh r0, [r4, r1]
	cmp r0, #3
	bhi _0225AB4C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225AB34: @ jump table
	.2byte _0225AB44 - _0225AB34 - 2 @ case 0
	.2byte _0225AB44 - _0225AB34 - 2 @ case 1
	.2byte _0225AB3C - _0225AB34 - 2 @ case 2
	.2byte _0225AB3C - _0225AB34 - 2 @ case 3
_0225AB3C:
	movs r2, #0x10
	adds r0, r1, #2
	strh r2, [r4, r0]
	b _0225AB50
_0225AB44:
	movs r2, #0x20
	adds r0, r1, #2
	strh r2, [r4, r0]
	b _0225AB50
_0225AB4C:
	bl GF_AssertFail
_0225AB50:
	adds r0, r4, #0
	bl ov90_0225B8F0
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AB5E:
	ldr r0, _0225ACB0 @ =0x00000652
	ldrh r1, [r4, r0]
	subs r1, r1, #1
	strh r1, [r4, r0]
	adds r0, r4, #0
	bl ov90_0225B8F0
	ldr r0, _0225ACB0 @ =0x00000652
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _0225ABFC
	ldrb r0, [r4, #0x14]
	movs r5, #0
	cmp r0, #0
	ble _0225ABB2
	movs r6, #0x65
	adds r7, r5, #0
	lsls r6, r6, #4
_0225AB82:
	adds r1, r4, r5
	adds r1, #0x2c
	ldrb r2, [r1]
	ldrh r1, [r4, r6]
	adds r0, r7, #0
	cmp r1, r2
	bne _0225AB94
	movs r0, #1
	b _0225AB9E
_0225AB94:
	cmp r1, #1
	bne _0225AB9E
	cmp r2, #0
	bne _0225AB9E
	movs r0, #1
_0225AB9E:
	cmp r0, #0
	beq _0225ABAA
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov90_0225B7FC
_0225ABAA:
	ldrb r0, [r4, #0x14]
	adds r5, r5, #1
	cmp r5, r0
	blt _0225AB82
_0225ABB2:
	movs r0, #0x65
	lsls r0, r0, #4
	ldrh r0, [r4, r0]
	cmp r0, #1
	bls _0225ABC2
	movs r0, #5
	strb r0, [r4, #4]
	b _0225AE1C
_0225ABC2:
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225ABCA:
	adds r0, r4, #0
	bl ov90_0225B8F0
	cmp r0, #0
	beq _0225ABFC
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225ABDC:
	adds r0, r1, #1
	strb r0, [r4, #4]
	adds r0, r4, #0
	bl ov90_0225B274
	movs r0, #0x1e
	strh r0, [r4]
	b _0225AE1C
_0225ABEC:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225ABF6
	subs r0, r0, #1
	strh r0, [r4]
_0225ABF6:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225ABFE
_0225ABFC:
	b _0225AE1C
_0225ABFE:
	movs r0, #0xa
	strb r0, [r4, #4]
	movs r0, #0
	strh r0, [r4]
	b _0225AE1C
_0225AC08:
	ldrb r1, [r4, #0x15]
	adds r0, r4, r1
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225AC18
	movs r5, #0x11
	b _0225AC1A
_0225AC18:
	movs r5, #0x12
_0225AC1A:
	lsls r1, r1, #2
	adds r1, r4, r1
	adds r0, r4, #0
	ldr r1, [r1, #0x3c]
	adds r0, #0x58
	bl ov90_02259200
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x68
	adds r1, #0x58
	adds r2, r5, #0
	movs r3, #0
	bl ov90_02259464
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AC40:
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #0
	bl ov90_02259538
	cmp r0, #0
	beq _0225AD06
	adds r0, r4, #0
	bl ov90_0225B978
	cmp r0, #1
	bne _0225AD06
	ldrb r0, [r4, #0x17]
	cmp r0, #1
	bne _0225AC68
	movs r0, #0x66
	strh r0, [r4]
	movs r0, #0xe
	strb r0, [r4, #4]
	b _0225AE1C
_0225AC68:
	movs r0, #0x66
	strh r0, [r4]
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AC74:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AC80
	subs r0, r0, #1
	strh r0, [r4]
	b _0225AE1C
_0225AC80:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0225ACB4
	ldr r1, [r4, #0x18]
	adds r0, r4, #0
	ldr r1, [r1]
	adds r0, #0x58
	bl ov90_0225926C
	ldr r0, _0225ACA8 @ =0x0000064C
	ldr r1, [r4, r0]
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	bne _0225ACA2
	movs r5, #0x13
	b _0225ACB6
_0225ACA2:
	movs r5, #2
	b _0225ACB6
	nop
_0225ACA8: .4byte 0x0000064C
_0225ACAC: .4byte 0x0000FFFF
_0225ACB0: .4byte 0x00000652
_0225ACB4:
	movs r5, #9
_0225ACB6:
	ldrb r1, [r4, #0x15]
	adds r0, r4, #0
	adds r0, #0x58
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1, #0x3c]
	bl ov90_02259200
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x68
	adds r1, #0x58
	adds r2, r5, #0
	movs r3, #0
	bl ov90_02259464
	movs r0, #0xd
	strb r0, [r4, #4]
	b _0225AE1C
_0225ACDC:
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #0
	bl ov90_02259538
	cmp r0, #0
	beq _0225AD06
	movs r0, #0x66
	strh r0, [r4]
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225ACF6:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AD06
	subs r0, r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AD08
_0225AD06:
	b _0225AE1C
_0225AD08:
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #0
	bl ov90_022594FC
	movs r0, #0x1e
	strh r0, [r4]
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD1E:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AD2A
	subs r0, r0, #1
	strh r0, [r4]
	b _0225AE1C
_0225AD2A:
	movs r0, #0x82
	bl FUN_02037AC0
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	beq _0225AD3A
	bl FUN_021E6A4C
_0225AD3A:
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD42:
	movs r0, #0x82
	bl FUN_02037B38
	cmp r0, #0
	beq _0225AE1C
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq _0225AD58
	movs r0, #0x13
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD58:
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD60:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #0
	ldrh r0, [r4, #2]
	adds r2, r1, #0
	adds r3, r1, #0
	str r0, [sp, #8]
	movs r0, #3
	bl FUN_0200FA24
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD80:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225AE1C
	movs r0, #0x15
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD8E:
	adds r0, r4, #0
	bl ov90_0225B9A8
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD9C:
	ldrh r0, [r4, #2]
	adds r1, r4, #0
	adds r2, r4, #0
	str r0, [sp]
	movs r0, #0x7a
	lsls r0, r0, #2
	ldrb r3, [r4, #7]
	adds r0, r4, r0
	adds r1, #0x68
	adds r2, #0x58
	bl ov90_0225B38C
	cmp r0, #0
	beq _0225AE1C
	movs r0, #0x7a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov90_0225B538
	strb r0, [r4, #8]
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225ADCC:
	movs r0, #0xcf
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov90_0225A108
	movs r0, #1
	strb r0, [r4, #6]
	b _0225AE1C
_0225ADDC:
	ldr r0, _0225AE48 @ =0x00000652
	ldrh r1, [r4, r0]
	subs r1, r1, #1
	strh r1, [r4, r0]
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _0225AE1C
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225ADF2:
	ldrb r0, [r4, #0x14]
	movs r5, #0
	cmp r0, #0
	ble _0225AE18
_0225ADFA:
	subs r1, r0, #1
	adds r0, r4, r5
	adds r0, #0x2c
	strb r1, [r0]
	adds r2, r4, r5
	adds r2, #0x2c
	ldrb r2, [r2]
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov90_0225B7FC
	ldrb r0, [r4, #0x14]
	adds r5, r5, #1
	cmp r5, r0
	blt _0225ADFA
_0225AE18:
	movs r0, #7
	strb r0, [r4, #4]
_0225AE1C:
	adds r0, r4, #0
	bl ov90_0225B2A8
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov90_02259170
	ldr r0, [r4, #0x4c]
	movs r1, #3
	movs r2, #4
	movs r3, #2
	bl FUN_0201F238
	ldr r0, [r4, #0x4c]
	movs r1, #5
	movs r2, #4
	movs r3, #2
	bl FUN_0201F238
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225AE48: .4byte 0x00000652
	thumb_func_end ov90_0225A980

	thumb_func_start ov90_0225AE4C
ov90_0225AE4C: @ 0x0225AE4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r4, r1, #0
	ldrb r0, [r4, #4]
	cmp r0, #0x14
	bhi _0225AF36
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225AE64: @ jump table
	.2byte _0225AE8E - _0225AE64 - 2 @ case 0
	.2byte _0225AEDE - _0225AE64 - 2 @ case 1
	.2byte _0225AEF6 - _0225AE64 - 2 @ case 2
	.2byte _0225AF0C - _0225AE64 - 2 @ case 3
	.2byte _0225AF26 - _0225AE64 - 2 @ case 4
	.2byte _0225AF4A - _0225AE64 - 2 @ case 5
	.2byte _0225B02C - _0225AE64 - 2 @ case 6
	.2byte _0225B056 - _0225AE64 - 2 @ case 7
	.2byte _0225B07A - _0225AE64 - 2 @ case 8
	.2byte _0225B0A0 - _0225AE64 - 2 @ case 9
	.2byte _0225B0DE - _0225AE64 - 2 @ case 10
	.2byte _0225B100 - _0225AE64 - 2 @ case 11
	.2byte _0225B126 - _0225AE64 - 2 @ case 12
	.2byte _0225B13C - _0225AE64 - 2 @ case 13
	.2byte _0225B152 - _0225AE64 - 2 @ case 14
	.2byte _0225B16A - _0225AE64 - 2 @ case 15
	.2byte _0225B188 - _0225AE64 - 2 @ case 16
	.2byte _0225B1A8 - _0225AE64 - 2 @ case 17
	.2byte _0225B1B6 - _0225AE64 - 2 @ case 18
	.2byte _0225B1C8 - _0225AE64 - 2 @ case 19
	.2byte _0225B1F6 - _0225AE64 - 2 @ case 20
_0225AE8E:
	ldrb r0, [r4, #0x17]
	cmp r0, #1
	bne _0225AE9A
	movs r0, #0
	strb r0, [r4, #9]
	b _0225AEC0
_0225AE9A:
	ldr r0, [r4, #0x30]
	cmp r0, #0xa
	blo _0225AEB0
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	bl ov90_0225A28C
	ldr r1, [r4, #0x18]
	str r0, [r1]
	movs r0, #1
	b _0225AEB2
_0225AEB0:
	movs r0, #0
_0225AEB2:
	strb r0, [r4, #9]
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	bne _0225AEC0
	adds r0, r4, #0
	bl ov90_0225BAA0
_0225AEC0:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldrh r0, [r4, #2]
	ldr r3, _0225B1C4 @ =0x0000FFFF
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #3
	bl FUN_0200FA24
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225AEDE:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225AF36
	ldrb r0, [r4, #4]
	movs r1, #4
	adds r0, r0, #1
	strb r0, [r4, #4]
	movs r0, #0x65
	lsls r0, r0, #4
	strh r1, [r4, r0]
	b _0225B204
_0225AEF6:
	adds r0, r4, #0
	adds r0, #0x68
	adds r1, #0x58
	movs r2, #1
	movs r3, #0
	bl ov90_02259464
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225AF0C:
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #0
	bl ov90_02259538
	cmp r0, #0
	beq _0225AF36
	movs r0, #0x66
	strh r0, [r4]
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225AF26:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AF36
	subs r0, r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AF38
_0225AF36:
	b _0225B204
_0225AF38:
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #0
	bl ov90_022594FC
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225AF4A:
	movs r0, #0xcf
	lsls r0, r0, #2
	ldrh r2, [r4, #2]
	adds r0, r4, r0
	adds r1, #0x4c
	bl ov90_0225A088
	ldrb r1, [r4, #0x14]
	movs r6, #0
	cmp r1, #0
	ble _0225B020
	movs r0, #0x97
	lsls r0, r0, #2
	adds r5, r4, r0
	adds r0, r4, #0
	str r0, [sp, #0x1c]
	adds r0, #0x4c
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	str r0, [sp, #0x20]
	adds r0, #0xa0
	str r0, [sp, #0x20]
	adds r0, r4, #0
	str r0, [sp, #0x24]
	adds r0, #0xc
	str r0, [sp, #0x24]
	adds r0, r4, #0
	str r0, [sp, #0x28]
	adds r0, #0x58
	str r4, [sp, #0x18]
	adds r7, r6, #0
	str r0, [sp, #0x28]
_0225AF8A:
	ldr r0, [sp, #0x1c]
	movs r3, #0x96
	str r0, [sp]
	str r6, [sp, #4]
	ldrb r0, [r4, #0x15]
	lsls r3, r3, #2
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0xc]
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [sp, #0x10]
	ldrh r0, [r4, #2]
	str r0, [sp, #0x14]
	ldrb r2, [r4, #7]
	ldr r3, [r4, r3]
	adds r0, r5, #0
	bl ov90_02259BCC
	ldr r0, [sp, #0x24]
	adds r1, r6, #0
	bl ov90_0225888C
	adds r1, r0, #0
	ldr r0, [sp, #0x24]
	bl ov90_022588A4
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x28]
	ldr r2, [r2, #0x3c]
	adds r0, r5, #0
	movs r3, #8
	bl ov90_02259D50
	adds r0, r4, r6
	adds r0, #0x38
	ldrb r0, [r0]
	adds r3, r4, r6
	adds r3, #0x34
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	ldrb r2, [r4, #5]
	ldrb r3, [r3]
	ldr r1, [sp, #0x28]
	adds r0, r5, #0
	bl ov90_02259DAC
	ldr r1, [sp, #0x1c]
	adds r0, r5, #0
	bl ov90_02259E8C
	adds r0, r5, #0
	bl ov90_02259EA0
	movs r1, #7
	lsls r2, r7, #0x10
	adds r0, r5, #0
	mvns r1, r1
	asrs r2, r2, #0x10
	bl ov90_02259EE0
	ldr r0, [sp, #0x18]
	ldrb r1, [r4, #0x14]
	adds r0, r0, #4
	adds r6, r6, #1
	adds r5, #0x38
	str r0, [sp, #0x18]
	adds r7, r7, #3
	cmp r6, r1
	blt _0225AF8A
_0225B020:
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	movs r0, #0x10
	strh r0, [r4]
	b _0225B204
_0225B02C:
	adds r0, r4, #0
	bl ov90_0225B8F0
	cmp r0, #1
	bne _0225B0BE
	ldrh r0, [r4]
	subs r0, r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0
	bne _0225B0BE
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r1, [r4, #0x30]
	adds r0, r4, r0
	bl ov90_0225B6B0
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B056:
	movs r0, #0x82
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, #0x4c
	bl ov90_0225B6C4
	cmp r0, #1
	bne _0225B0BE
	ldrb r0, [r4, #9]
	cmp r0, #1
	bne _0225B072
	adds r0, r4, #0
	bl ov90_0225B954
_0225B072:
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B07A:
	adds r0, r4, #0
	ldr r1, [r4, #0x30]
	adds r0, #0x58
	bl ov90_02259250
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x68
	adds r1, #0x58
	movs r2, #7
	movs r3, #0
	bl ov90_02259464
	movs r0, #0x66
	strh r0, [r4]
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B0A0:
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #0
	bl ov90_02259538
	cmp r0, #1
	bne _0225B0BE
	ldrh r0, [r4]
	cmp r0, #0
	bne _0225B0D8
	adds r0, r4, #0
	bl ov90_0225B978
	cmp r0, #1
	beq _0225B0C0
_0225B0BE:
	b _0225B204
_0225B0C0:
	ldrb r0, [r4, #0x17]
	cmp r0, #1
	bne _0225B0D0
	movs r0, #0x66
	strh r0, [r4]
	movs r0, #0xc
	strb r0, [r4, #4]
	b _0225B204
_0225B0D0:
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B0D8:
	subs r0, r0, #1
	strh r0, [r4]
	b _0225B204
_0225B0DE:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0225B0E8
	movs r2, #8
	b _0225B0EA
_0225B0E8:
	movs r2, #9
_0225B0EA:
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x68
	adds r1, #0x58
	movs r3, #0
	bl ov90_02259464
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B100:
	adds r0, r4, #0
	adds r0, #0x68
	movs r1, #0
	bl ov90_02259538
	cmp r0, #0
	beq _0225B204
	movs r0, #0x66
	strh r0, [r4]
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0225B11E
	movs r0, #0xd
	strb r0, [r4, #4]
	b _0225B204
_0225B11E:
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B126:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225B204
	subs r0, r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0
	bne _0225B204
	movs r0, #0xe
	strb r0, [r4, #4]
	b _0225B204
_0225B13C:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225B146
	subs r0, r0, #1
	strh r0, [r4]
_0225B146:
	ldrh r0, [r4]
	cmp r0, #0
	bne _0225B204
	movs r0, #0xe
	strb r0, [r4, #4]
	b _0225B204
_0225B152:
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	beq _0225B15C
	bl FUN_021E6A4C
_0225B15C:
	movs r0, #0x82
	bl FUN_02037AC0
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B16A:
	movs r0, #0x82
	bl FUN_02037B38
	cmp r0, #0
	beq _0225B204
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq _0225B180
	movs r0, #0x12
	strb r0, [r4, #4]
	b _0225B204
_0225B180:
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B188:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #0
	ldrh r0, [r4, #2]
	adds r2, r1, #0
	adds r3, r1, #0
	str r0, [sp, #8]
	movs r0, #3
	bl FUN_0200FA24
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B1A8:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225B204
	movs r0, #0x14
	strb r0, [r4, #4]
	b _0225B204
_0225B1B6:
	adds r0, r4, #0
	bl ov90_0225B9A8
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
	.align 2, 0
_0225B1C4: .4byte 0x0000FFFF
_0225B1C8:
	ldrh r0, [r4, #2]
	adds r2, r4, #0
	adds r1, #0x68
	str r0, [sp]
	movs r0, #0x7a
	lsls r0, r0, #2
	ldrb r3, [r4, #7]
	adds r0, r4, r0
	adds r2, #0x58
	bl ov90_0225B38C
	cmp r0, #0
	beq _0225B204
	movs r0, #0x7a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov90_0225B538
	strb r0, [r4, #8]
	ldrb r0, [r4, #4]
	adds r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B1F6:
	movs r0, #0xcf
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov90_0225A108
	movs r0, #1
	strb r0, [r4, #6]
_0225B204:
	adds r0, r4, #0
	bl ov90_0225B2A8
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov90_02259170
	ldr r0, [r4, #0x4c]
	movs r1, #3
	movs r2, #4
	movs r3, #2
	bl FUN_0201F238
	ldr r0, [r4, #0x4c]
	movs r1, #5
	movs r2, #4
	movs r3, #2
	bl FUN_0201F238
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov90_0225AE4C

	thumb_func_start ov90_0225B230
ov90_0225B230: @ 0x0225B230
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_0202061C
	adds r0, r4, #0
	adds r0, #0x4c
	bl ov90_022590C0
	adds r0, r4, #0
	adds r0, #0xa0
	bl ov90_0225917C
	movs r0, #0xcf
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov90_0225A198
	pop {r4, pc}
	thumb_func_end ov90_0225B230

	thumb_func_start ov90_0225B254
ov90_0225B254: @ 0x0225B254
	push {r4, lr}
	adds r3, r2, #0
	adds r4, r0, #0
	ldr r2, _0225B26C @ =0x00000658
	adds r0, r1, #0
	movs r1, #5
	adds r2, r4, r2
	bl FUN_02007C48
	ldr r1, _0225B270 @ =0x00000654
	str r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_0225B26C: .4byte 0x00000658
_0225B270: .4byte 0x00000654
	thumb_func_end ov90_0225B254

	thumb_func_start ov90_0225B274
ov90_0225B274: @ 0x0225B274
	push {r3, lr}
	ldr r1, _0225B2A4 @ =0x0000065E
	movs r2, #1
	strh r2, [r0, r1]
	ldrb r3, [r0, #0x14]
	movs r2, #0
	cmp r3, #0
	ble _0225B2A0
_0225B284:
	adds r1, r0, r2
	adds r1, #0x2c
	ldrb r1, [r1]
	cmp r1, #0
	bne _0225B29A
	ldrb r1, [r0, #0x15]
	cmp r1, r2
	bne _0225B29A
	bl ov90_0225B954
	pop {r3, pc}
_0225B29A:
	adds r2, r2, #1
	cmp r2, r3
	blt _0225B284
_0225B2A0:
	pop {r3, pc}
	nop
_0225B2A4: .4byte 0x0000065E
	thumb_func_end ov90_0225B274

	thumb_func_start ov90_0225B2A8
ov90_0225B2A8: @ 0x0225B2A8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0225B320 @ =0x0000065E
	ldrh r1, [r5, r0]
	cmp r1, #0
	beq _0225B31E
	subs r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _0225B2C0
	cmp r0, #8
	bne _0225B30A
_0225B2C0:
	ldrb r0, [r5, #0x14]
	movs r6, #0
	cmp r0, #0
	ble _0225B30A
	ldr r4, _0225B324 @ =0x0225C1EC
	ldr r7, _0225B328 @ =0x0000065C
_0225B2CC:
	adds r0, r5, r6
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225B300
	ldr r0, _0225B32C @ =0x00000658
	ldrb r3, [r4]
	ldr r0, [r5, r0]
	ldr r2, [r0, #0xc]
	ldrh r0, [r5, r7]
	lsls r1, r3, #5
	cmp r0, #0
	bne _0225B2EA
	adds r0, r3, #3
	b _0225B2EC
_0225B2EA:
	adds r0, r3, #7
_0225B2EC:
	lsls r0, r0, #5
	adds r2, r2, r0
	movs r0, #0xf
	movs r3, #0x20
	bl FUN_020205D8
	cmp r0, #0
	bne _0225B300
	bl GF_AssertFail
_0225B300:
	ldrb r0, [r5, #0x14]
	adds r6, r6, #1
	adds r4, r4, #1
	cmp r6, r0
	blt _0225B2CC
_0225B30A:
	ldr r3, _0225B328 @ =0x0000065C
	ldrh r0, [r5, r3]
	adds r0, r0, #1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1c
	subs r1, r1, r2
	movs r0, #0x1c
	rors r1, r0
	adds r0, r2, r1
	strh r0, [r5, r3]
_0225B31E:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225B320: .4byte 0x0000065E
_0225B324: .4byte 0x0225C1EC
_0225B328: .4byte 0x0000065C
_0225B32C: .4byte 0x00000658
	thumb_func_end ov90_0225B2A8

	thumb_func_start ov90_0225B330
ov90_0225B330: @ 0x0225B330
	ldr r1, _0225B338 @ =0x00000654
	ldr r3, _0225B33C @ =FUN_0201AB0C
	ldr r0, [r0, r1]
	bx r3
	.align 2, 0
_0225B338: .4byte 0x00000654
_0225B33C: .4byte FUN_0201AB0C
	thumb_func_end ov90_0225B330

	thumb_func_start ov90_0225B340
ov90_0225B340: @ 0x0225B340
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r6, r2, #0
	movs r1, #0
	movs r2, #0x20
	adds r5, r0, #0
	adds r7, r3, #0
	blx FUN_020E5B44
	ldr r0, [r4]
	str r0, [r5, #8]
	movs r0, #4
	str r0, [r5, #0xc]
	movs r0, #0x8b
	str r0, [r5, #0x10]
	movs r0, #2
	str r0, [r5, #0x14]
	movs r0, #0x18
	strb r0, [r5, #0x18]
	movs r0, #8
	strb r0, [r5, #0x19]
	movs r0, #0
	strb r0, [r5, #0x1b]
	adds r0, r7, #0
	bl FUN_0201660C
	str r0, [r5, #4]
	strb r6, [r5, #1]
	movs r0, #1
	strb r0, [r5, #0x1d]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov90_0225B340

	thumb_func_start ov90_0225B380
ov90_0225B380: @ 0x0225B380
	ldr r3, _0225B388 @ =FUN_02016624
	ldr r0, [r0, #4]
	bx r3
	nop
_0225B388: .4byte FUN_02016624
	thumb_func_end ov90_0225B380

	thumb_func_start ov90_0225B38C
ov90_0225B38C: @ 0x0225B38C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r0, [r4]
	adds r5, r1, #0
	adds r6, r2, #0
	cmp r0, #0xc
	bhi _0225B42C
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225B3A8: @ jump table
	.2byte _0225B3C2 - _0225B3A8 - 2 @ case 0
	.2byte _0225B3F4 - _0225B3A8 - 2 @ case 1
	.2byte _0225B404 - _0225B3A8 - 2 @ case 2
	.2byte _0225B420 - _0225B3A8 - 2 @ case 3
	.2byte _0225B436 - _0225B3A8 - 2 @ case 4
	.2byte _0225B448 - _0225B3A8 - 2 @ case 5
	.2byte _0225B494 - _0225B3A8 - 2 @ case 6
	.2byte _0225B4AC - _0225B3A8 - 2 @ case 7
	.2byte _0225B4C0 - _0225B3A8 - 2 @ case 8
	.2byte _0225B4D8 - _0225B3A8 - 2 @ case 9
	.2byte _0225B4EC - _0225B3A8 - 2 @ case 10
	.2byte _0225B50C - _0225B3A8 - 2 @ case 11
	.2byte _0225B52A - _0225B3A8 - 2 @ case 12
_0225B3C2:
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	movs r2, #1
	ldr r5, [sp, #0x20]
	str r2, [sp, #4]
	adds r1, r0, #0
	adds r3, r0, #0
	str r5, [sp, #8]
	bl FUN_0200FA24
	ldr r1, [sp, #0x20]
	movs r0, #0
	bl FUN_0203A948
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0225B3EC
	adds r0, r5, #0
	bl FUN_021E69A8
_0225B3EC:
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B3F4:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225B42C
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B404:
	adds r0, r6, #0
	adds r1, r3, #0
	bl ov90_0225927C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl ov90_02259464
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B420:
	adds r0, r5, #0
	movs r1, #1
	bl ov90_02259538
	cmp r0, #1
	beq _0225B42E
_0225B42C:
	b _0225B530
_0225B42E:
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B436:
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #8
	bl FUN_020166FC
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B448:
	ldr r0, [r4, #4]
	bl FUN_020168F4
	subs r1, r0, #1
	cmp r1, #1
	bhi _0225B530
	cmp r0, #1
	bne _0225B464
	movs r1, #0
	movs r0, #0x16
	adds r2, r1, #0
	bl FUN_02037030
	b _0225B472
_0225B464:
	cmp r0, #2
	bne _0225B472
	movs r1, #0
	movs r0, #0x17
	adds r2, r1, #0
	bl FUN_02037030
_0225B472:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0xf
	movs r3, #1
	bl ov90_02259464
	adds r0, r5, #0
	movs r1, #1
	bl ov90_02259554
	ldr r0, [r4, #4]
	bl FUN_020169CC
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B494:
	ldrb r1, [r4, #0x1e]
	cmp r1, #0
	beq _0225B530
	ldrb r1, [r4, #0x1f]
	cmp r1, #0
	beq _0225B4A6
	movs r0, #0xa
	strb r0, [r4]
	b _0225B530
_0225B4A6:
	adds r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B4AC:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #6
	movs r3, #1
	bl ov90_02259464
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B4C0:
	adds r0, r5, #0
	movs r1, #1
	bl ov90_02259538
	cmp r0, #1
	bne _0225B530
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	movs r0, #0x66
	strh r0, [r4, #2]
	b _0225B530
_0225B4D8:
	ldrh r0, [r4, #2]
	subs r0, r0, #1
	strh r0, [r4, #2]
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _0225B530
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B4EC:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #4
	adds r3, r1, #0
	bl FUN_0200FA24
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B50C:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0225B530
	bl FUN_0203A914
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0225B522
	bl FUN_021E6A4C
_0225B522:
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B52A:
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0225B530:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov90_0225B38C

	thumb_func_start ov90_0225B538
ov90_0225B538: @ 0x0225B538
	ldrb r0, [r0, #0x1f]
	bx lr
	thumb_func_end ov90_0225B538

	thumb_func_start ov90_0225B53C
ov90_0225B53C: @ 0x0225B53C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, r3, #0
	movs r3, #1
	lsls r3, r1
	ldrb r1, [r4, #0x1c]
	tst r1, r3
	bne _0225B55A
	cmp r2, #0
	bne _0225B554
	movs r1, #0
	strb r1, [r4, #0x1d]
_0225B554:
	ldrb r1, [r4, #0x1c]
	orrs r1, r3
	strb r1, [r4, #0x1c]
_0225B55A:
	ldrb r3, [r4, #0x1c]
	movs r2, #0
	adds r1, r2, #0
	movs r5, #1
_0225B562:
	adds r6, r5, #0
	lsls r6, r1
	tst r6, r3
	beq _0225B56C
	adds r2, r2, #1
_0225B56C:
	adds r1, r1, #1
	cmp r1, #4
	blt _0225B562
	cmp r2, r0
	bne _0225B592
	ldrb r0, [r4, #0x1d]
	cmp r0, #0
	beq _0225B588
	movs r1, #0
	movs r0, #0x18
	adds r2, r1, #0
	bl FUN_02037030
	pop {r4, r5, r6, pc}
_0225B588:
	movs r1, #0
	movs r0, #0x19
	adds r2, r1, #0
	bl FUN_02037030
_0225B592:
	pop {r4, r5, r6, pc}
	thumb_func_end ov90_0225B53C

	thumb_func_start ov90_0225B594
ov90_0225B594: @ 0x0225B594
	movs r2, #1
	strb r2, [r0, #0x1e]
	strb r1, [r0, #0x1f]
	bx lr
	thumb_func_end ov90_0225B594

	thumb_func_start ov90_0225B59C
ov90_0225B59C: @ 0x0225B59C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r1, #0
	ldr r1, [sp, #0x44]
	str r2, [sp, #0x14]
	str r1, [sp, #0x44]
	movs r1, #0
	movs r2, #0x4c
	adds r7, r0, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x40]
	blx FUN_020E5B44
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x44]
	movs r3, #7
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #0
	lsls r3, r3, #6
	bl FUN_02007B8C
	movs r0, #0x8b
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x44]
	movs r1, #0x19
	str r0, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r4, #0
	movs r3, #2
	bl FUN_02007B44
	ldr r0, [sp, #0x44]
	movs r1, #0x1a
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	adds r3, r7, #4
	bl FUN_02007C2C
	str r0, [r7]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0x11
	str r0, [sp, #4]
	movs r0, #0x12
	str r0, [sp, #8]
	ldr r0, _0225B68C @ =0x00001389
	adds r1, r4, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x44]
	movs r2, #0xf
	str r0, [sp, #0x10]
	adds r0, r6, #0
	movs r3, #1
	bl ov90_02258E54
	str r0, [r7, #0x44]
	movs r0, #0x28
	str r0, [sp, #0x20]
	movs r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
_0225B624:
	ldr r0, [sp, #0x20]
	movs r4, #0x4a
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #0
	str r0, [sp, #0x24]
_0225B630:
	ldr r0, [sp, #0x1c]
	lsls r2, r4, #0x10
	adds r0, r6, r0
	lsls r0, r0, #2
	adds r5, r7, r0
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [r7, #0x44]
	ldr r1, [r1]
	ldr r3, [sp, #0x24]
	asrs r2, r2, #0x10
	bl ov90_02258EB4
	str r0, [r5, #8]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x18]
	bl FUN_020248F0
	ldr r0, [r5, #8]
	movs r1, #0
	bl FUN_02024A04
	adds r6, r6, #1
	adds r4, #0x18
	cmp r6, #5
	blt _0225B630
	ldr r0, [sp, #0x20]
	adds r0, #0x24
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	adds r0, r0, #5
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #3
	blt _0225B624
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225B68C: .4byte 0x00001389
	thumb_func_end ov90_0225B59C

	thumb_func_start ov90_0225B690
ov90_0225B690: @ 0x0225B690
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_0225B698:
	ldr r0, [r5, #8]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xf
	blt _0225B698
	ldr r0, [r6]
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov90_0225B690

	thumb_func_start ov90_0225B6B0
ov90_0225B6B0: @ 0x0225B6B0
	adds r2, r0, #0
	adds r2, #0x4b
	strb r1, [r2]
	adds r1, r0, #0
	movs r2, #0
	adds r1, #0x48
	strb r2, [r1]
	adds r0, #0x4a
	strb r2, [r0]
	bx lr
	thumb_func_end ov90_0225B6B0

	thumb_func_start ov90_0225B6C4
ov90_0225B6C4: @ 0x0225B6C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x48
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #3
	bls _0225B6D6
	b _0225B7F2
_0225B6D6:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225B6E2: @ jump table
	.2byte _0225B6EA - _0225B6E2 - 2 @ case 0
	.2byte _0225B738 - _0225B6E2 - 2 @ case 1
	.2byte _0225B784 - _0225B6E2 - 2 @ case 2
	.2byte _0225B7EC - _0225B6E2 - 2 @ case 3
_0225B6EA:
	ldr r0, [r4, #4]
	movs r1, #0x8b
	bl ov90_02258DB0
	movs r3, #0
	str r3, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x14
	str r0, [sp, #8]
	ldr r2, [r4, #4]
	ldr r0, [r5]
	movs r1, #2
	adds r2, #0xc
	bl FUN_0201C4C4
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #0xe
	str r0, [sp, #8]
	movs r2, #0
	ldr r0, [r5]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201CA4C
	ldr r0, [r5]
	movs r1, #2
	bl FUN_0201EFBC
	adds r0, r4, #0
	adds r0, #0x48
	ldrb r0, [r0]
	adds r4, #0x48
	adds r0, r0, #1
	strb r0, [r4]
	b _0225B7F2
_0225B738:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r1, r0
	bne _0225B750
	movs r0, #3
	adds r4, #0x48
	strb r0, [r4]
	b _0225B7F2
_0225B750:
	ldr r0, _0225B7F8 @ =0x00000594
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	movs r1, #0xf
	blx FUN_020F2998
	lsls r0, r1, #2
	adds r0, r4, r0
	ldr r0, [r0, #8]
	movs r1, #1
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #8
	adds r0, #0x49
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	ldrb r0, [r0]
	adds r4, #0x48
	adds r0, r0, #1
	strb r0, [r4]
	b _0225B7F2
_0225B784:
	adds r0, r4, #0
	adds r0, #0x49
	ldrb r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x49
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x49
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225B7F2
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x4a
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r5, [r0]
	movs r1, #0xf
	adds r0, r5, #0
	blx FUN_020F2998
	cmp r1, #0
	bne _0225B7E4
	adds r0, r4, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r5, r0
	beq _0225B7E4
	movs r6, #0
	adds r5, r4, #0
	adds r7, r6, #0
_0225B7CC:
	ldr r0, [r5, #8]
	adds r1, r7, #0
	bl FUN_02024830
	ldr r0, [r5, #8]
	movs r1, #2
	bl FUN_020248F0
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #0xf
	blt _0225B7CC
_0225B7E4:
	movs r0, #1
	adds r4, #0x48
	strb r0, [r4]
	b _0225B7F2
_0225B7EC:
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0225B7F2:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225B7F8: .4byte 0x00000594
	thumb_func_end ov90_0225B6C4

	thumb_func_start ov90_0225B7FC
ov90_0225B7FC: @ 0x0225B7FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r6, r1, #0
	adds r5, r0, #0
	movs r0, #0x38
	adds r4, r6, #0
	muls r4, r0, r4
	adds r0, r5, #0
	adds r0, #0x4c
	str r0, [sp]
	str r6, [sp, #4]
	ldrb r0, [r5, #0x15]
	movs r3, #0x97
	lsls r3, r3, #2
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0xa0
	str r0, [sp, #0xc]
	adds r0, r3, #0
	subs r0, #0x78
	ldr r0, [r5, r0]
	adds r7, r5, r3
	str r0, [sp, #0x10]
	ldrh r0, [r5, #2]
	str r2, [sp, #0x18]
	subs r3, r3, #4
	str r0, [sp, #0x14]
	ldrb r1, [r5, #0x14]
	ldrb r2, [r5, #7]
	ldr r3, [r5, r3]
	adds r0, r7, r4
	bl ov90_02259BCC
	adds r0, r5, #0
	adds r0, #0xc
	adds r1, r6, #0
	bl ov90_0225888C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0xc
	bl ov90_022588A4
	lsls r1, r6, #2
	str r1, [sp, #0x1c]
	movs r1, #0
	str r1, [sp]
	ldr r2, [sp, #0x1c]
	str r0, [sp, #4]
	adds r2, r5, r2
	adds r1, r5, #0
	ldr r2, [r2, #0x3c]
	adds r0, r7, r4
	adds r1, #0x58
	movs r3, #8
	bl ov90_02259D50
	adds r0, r5, r6
	adds r0, #0x38
	ldrb r0, [r0]
	adds r3, r5, r6
	adds r1, r5, #0
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	adds r3, #0x34
	ldrb r2, [r5, #5]
	ldrb r3, [r3]
	adds r0, r7, r4
	adds r1, #0x58
	bl ov90_02259DAC
	ldrb r0, [r5, #7]
	cmp r0, #0
	bne _0225B896
	movs r1, #5
	b _0225B898
_0225B896:
	movs r1, #6
_0225B898:
	ldr r3, [sp, #0x18]
	movs r0, #0
	adds r6, r3, #1
	movs r3, #4
	subs r3, r3, r6
	lsls r6, r3, #1
	ldr r3, _0225B8EC @ =0x0225C1F0
	ldr r2, [sp, #0x1c]
	str r0, [sp]
	ldrsh r6, [r3, r6]
	movs r3, #0xb0
	str r1, [sp, #4]
	adds r2, r5, r2
	subs r3, r3, r6
	adds r1, r5, #0
	lsls r3, r3, #0x10
	ldr r2, [r2, #0x1c]
	adds r0, r7, r4
	adds r1, #0x58
	asrs r3, r3, #0x10
	bl ov90_02259E38
	adds r5, #0x4c
	adds r0, r7, r4
	adds r1, r5, #0
	bl ov90_02259E8C
	ldr r1, [sp, #0x18]
	adds r0, r7, r4
	bl ov90_02259E18
	ldr r1, [sp, #0x18]
	adds r0, r7, r4
	lsls r2, r1, #1
	ldr r1, _0225B8EC @ =0x0225C1F0
	ldrsh r1, [r1, r2]
	movs r2, #0
	bl ov90_02259EE0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225B8EC: .4byte 0x0225C1F0
	thumb_func_end ov90_0225B7FC

	thumb_func_start ov90_0225B8F0
ov90_0225B8F0: @ 0x0225B8F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldrb r0, [r7, #0x14]
	cmp r0, #0
	ble _0225B94E
	movs r0, #0x97
	lsls r0, r0, #2
	adds r6, r7, r0
	adds r4, r7, #0
	adds r5, r6, #0
_0225B90E:
	movs r0, #0x9b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0225B938
	adds r0, r6, #0
	bl ov90_02259F7C
	str r0, [sp, #8]
	movs r0, #0xcf
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r1, r5, #0
	bl ov90_0225A134
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0225B93C
	movs r0, #0
	str r0, [sp]
	b _0225B93C
_0225B938:
	movs r0, #0
	str r0, [sp]
_0225B93C:
	ldr r0, [sp, #4]
	ldrb r1, [r7, #0x14]
	adds r0, r0, #1
	adds r4, #0x38
	adds r6, #0x38
	adds r5, #0x38
	str r0, [sp, #4]
	cmp r0, r1
	blt _0225B90E
_0225B94E:
	ldr r0, [sp]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov90_0225B8F0

	thumb_func_start ov90_0225B954
ov90_0225B954: @ 0x0225B954
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x66
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225B970
	ldr r0, _0225B974 @ =0x000004BF
	bl FUN_02006B24
	movs r0, #0x66
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r4, r0]
_0225B970:
	pop {r4, pc}
	nop
_0225B974: .4byte 0x000004BF
	thumb_func_end ov90_0225B954

	thumb_func_start ov90_0225B978
ov90_0225B978: @ 0x0225B978
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x66
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0225B996
	bl FUN_02006BCC
	cmp r0, #0
	bne _0225B996
	movs r0, #0x66
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
_0225B996:
	movs r0, #0x66
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #1
	beq _0225B9A4
	movs r0, #1
	pop {r4, pc}
_0225B9A4:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov90_0225B978

	thumb_func_start ov90_0225B9A8
ov90_0225B9A8: @ 0x0225B9A8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_0202C6F4
	adds r4, r0, #0
	ldrb r0, [r5, #0x14]
	movs r6, #0
	cmp r0, #0
	ble _0225BA12
	add r7, sp, #0
_0225B9BE:
	adds r0, r5, r6
	ldrb r0, [r0, #0x10]
	bl FUN_0203484C
	adds r1, r0, #0
	ldr r0, [r5, #0xc]
	adds r2, r7, #0
	bl FUN_0203A084
	cmp r0, #0
	beq _0225B9D8
	cmp r0, #1
	bne _0225BA0A
_0225B9D8:
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _0225B9E8
	cmp r0, #1
	beq _0225B9F4
	cmp r0, #2
	beq _0225BA00
	b _0225BA0A
_0225B9E8:
	ldr r1, [sp]
	adds r0, r4, #0
	movs r2, #1
	bl FUN_0202C554
	b _0225BA0A
_0225B9F4:
	ldr r1, [sp]
	adds r0, r4, #0
	movs r2, #1
	bl FUN_0202C584
	b _0225BA0A
_0225BA00:
	ldr r1, [sp]
	adds r0, r4, #0
	movs r2, #1
	bl FUN_0202C5B4
_0225BA0A:
	ldrb r0, [r5, #0x14]
	adds r6, r6, #1
	cmp r6, r0
	blt _0225B9BE
_0225BA12:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov90_0225B9A8

	thumb_func_start ov90_0225BA14
ov90_0225BA14: @ 0x0225BA14
	push {r3, lr}
	ldrb r1, [r0, #7]
	cmp r1, #0
	beq _0225BA26
	cmp r1, #1
	beq _0225BA2A
	cmp r1, #2
	beq _0225BA2E
	pop {r3, pc}
_0225BA26:
	movs r0, #0
	pop {r3, pc}
_0225BA2A:
	movs r0, #0
	pop {r3, pc}
_0225BA2E:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov90_0225BA14

	thumb_func_start ov90_0225BA38
ov90_0225BA38: @ 0x0225BA38
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r1, sp, #0xc
	movs r4, #0
	str r4, [r1]
	str r4, [r1, #4]
	str r4, [r1, #8]
	adds r5, r0, #0
	str r4, [r1, #0xc]
	bl ov90_0225BA14
	ldrb r2, [r5, #0x14]
	adds r1, r4, #0
	cmp r2, #0
	ble _0225BA7E
	adds r2, r5, #0
	add r3, sp, #0xc
_0225BA5A:
	adds r6, r5, r1
	adds r6, #0x2c
	ldrb r6, [r6]
	cmp r6, #0
	bne _0225BA74
	ldr r6, [r2, #0x1c]
	cmp r0, r6
	beq _0225BA74
	ldr r6, [r5, #0x18]
	adds r4, r4, #1
	adds r6, r6, r1
	ldrb r6, [r6, #4]
	stm r3!, {r6}
_0225BA74:
	ldrb r6, [r5, #0x14]
	adds r1, r1, #1
	adds r2, r2, #4
	cmp r1, r6
	blt _0225BA5A
_0225BA7E:
	cmp r4, #0
	beq _0225BA9C
	ldr r0, [sp, #0x10]
	adds r2, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [r5, #0x18]
	ldrb r1, [r5, #7]
	ldr r0, [r0, #0x30]
	ldr r3, [sp, #0xc]
	bl FUN_0222ACB8
_0225BA9C:
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov90_0225BA38

	thumb_func_start ov90_0225BAA0
ov90_0225BAA0: @ 0x0225BAA0
	push {lr}
	sub sp, #0xc
	adds r1, r0, #0
	ldrb r2, [r1, #0x14]
	cmp r2, #0
	beq _0225BACA
	ldr r0, [r1, #0x30]
	cmp r0, #0xa
	blo _0225BACA
	ldr r3, [r1, #0x18]
	ldrb r0, [r3, #5]
	str r0, [sp]
	ldrb r0, [r3, #6]
	str r0, [sp, #4]
	ldrb r0, [r3, #7]
	str r0, [sp, #8]
	ldr r0, [r3, #0x30]
	ldrb r1, [r1, #7]
	ldrb r3, [r3, #4]
	bl FUN_0222ACB8
_0225BACA:
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov90_0225BAA0

	thumb_func_start ov90_0225BAD0
ov90_0225BAD0: @ 0x0225BAD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	adds r0, #0xc
	movs r1, #0
	movs r2, #0xc0
	str r3, [sp, #0x10]
	blx FUN_020E5B44
	adds r0, r7, #0
	adds r0, #0xcc
	movs r1, #0
	movs r2, #0xc0
	blx FUN_020E5B44
	movs r6, #0
	strh r6, [r7, #8]
	movs r0, #0x63
	strh r6, [r7, #0xa]
	lsls r0, r0, #2
	ldr r4, _0225BBC4 @ =0x0225C2B4
	str r6, [r7, r0]
	adds r5, r7, #0
_0225BB02:
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	str r0, [sp, #4]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	lsls r2, r2, #4
	lsls r3, r3, #4
	ldr r0, [sp, #8]
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov90_02258EB4
	str r0, [r5]
	movs r1, #5
	bl FUN_020248F0
	ldr r0, [r5]
	movs r1, #0
	bl FUN_02024A04
	adds r6, r6, #1
	adds r4, #0xc
	adds r5, r5, #4
	cmp r6, #2
	blt _0225BB02
	movs r3, #1
	lsls r3, r3, #0x1a
	ldr r1, [r3]
	movs r0, #0xe
	lsls r0, r0, #0xc
	ands r1, r0
	ldr r4, [r3]
	ldr r2, _0225BBC8 @ =0xFFFF1FFF
	lsrs r1, r1, #0xd
	ands r4, r2
	movs r2, #1
	bics r1, r2
	lsls r1, r1, #0xd
	orrs r1, r4
	adds r2, r3, #0
	str r1, [r3]
	adds r2, #0x48
	ldrh r4, [r2]
	movs r1, #0x3f
	bics r4, r1
	movs r1, #0x1f
	orrs r4, r1
	movs r1, #0x20
	orrs r4, r1
	strh r4, [r2]
	adds r2, r3, #0
	movs r4, #0
	adds r2, #0x40
	strh r4, [r2]
	adds r2, r3, #0
	adds r2, #0x44
	strh r4, [r2]
	adds r2, r3, #0
	adds r2, #0x4a
	ldrb r4, [r2]
	movs r2, #0x19
	lsls r2, r2, #4
	strb r4, [r7, r2]
	ldr r3, [r3]
	ands r0, r3
	lsrs r3, r0, #0xd
	movs r0, #2
	ands r3, r0
	adds r0, r2, #4
	str r3, [r7, r0]
	adds r0, r2, #1
	ldrb r3, [r7, r0]
	movs r0, #0x1f
	bics r3, r0
	movs r0, #0xf
	orrs r3, r0
	adds r0, r2, #1
	strb r3, [r7, r0]
	ldrb r0, [r7, r0]
	orrs r1, r0
	adds r0, r2, #1
	strb r1, [r7, r0]
	ldr r0, _0225BBCC @ =ov90_0225BE08
	adds r1, r7, #0
	bl FUN_0201A120
	ldr r0, [r7, #4]
	movs r1, #2
	bl FUN_02024890
	adds r0, r7, #0
	bl ov90_0225BD84
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225BBC4: .4byte 0x0225C2B4
_0225BBC8: .4byte 0xFFFF1FFF
_0225BBCC: .4byte ov90_0225BE08
	thumb_func_end ov90_0225BAD0

	thumb_func_start ov90_0225BBD0
ov90_0225BBD0: @ 0x0225BBD0
	push {r4, lr}
	movs r1, #8
	ldrsh r2, [r0, r1]
	movs r4, #0
	adds r2, r2, #1
	strh r2, [r0, #8]
	ldrsh r2, [r0, r1]
	cmp r2, #8
	blt _0225BBE6
	strh r1, [r0, #8]
	movs r4, #1
_0225BBE6:
	movs r1, #1
	bl ov90_0225BC28
	adds r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov90_0225BBD0

	thumb_func_start ov90_0225BBF0
ov90_0225BBF0: @ 0x0225BBF0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #8
	ldrsh r2, [r5, r0]
	movs r1, #0
	adds r4, r1, #0
	subs r2, r2, #1
	strh r2, [r5, #8]
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bgt _0225BC18
	movs r4, #1
	strh r4, [r5, #8]
	ldr r0, [r5]
	bl FUN_02024830
	ldr r0, [r5, #4]
	movs r1, #0
	bl FUN_02024830
_0225BC18:
	movs r1, #0
	adds r0, r5, #0
	mvns r1, r1
	bl ov90_0225BC28
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov90_0225BBF0

	thumb_func_start ov90_0225BC28
ov90_0225BC28: @ 0x0225BC28
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	ldr r2, [sp]
	movs r0, #8
	ldrsh r2, [r2, r0]
	movs r3, #0x17
	adds r4, r2, #0
	muls r4, r3, r4
	asrs r2, r4, #2
	lsrs r2, r2, #0x1d
	adds r2, r4, r2
	asrs r4, r2, #3
	ldr r2, [sp]
	strh r4, [r2, #0xa]
	ldrsh r0, [r2, r0]
	adds r0, r0, r1
	cmp r0, #8
	bgt _0225BC62
	cmp r0, #0
	blt _0225BC62
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	str r0, [sp, #4]
	b _0225BC6A
_0225BC62:
	ldr r0, [sp]
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	str r0, [sp, #4]
_0225BC6A:
	ldr r0, [sp, #4]
	ldr r7, _0225BD04 @ =0x0225C2B4
	ldr r4, [sp]
	movs r6, #0
	lsls r5, r0, #0xc
_0225BC74:
	adds r3, r7, #0
	ldm r3!, {r0, r1}
	add r2, sp, #8
	stm r2!, {r0, r1}
	ldr r0, [r3]
	cmp r6, #0
	str r0, [r2]
	bne _0225BCB6
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _0225BC9C
	adds r0, r5, #0
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225BCAA
_0225BC9C:
	adds r0, r5, #0
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225BCAA:
	blx FUN_020F2104
	ldr r1, [sp, #0xc]
	subs r0, r1, r0
	str r0, [sp, #0xc]
	b _0225BCE6
_0225BCB6:
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _0225BCCE
	adds r0, r5, #0
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225BCDC
_0225BCCE:
	adds r0, r5, #0
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225BCDC:
	blx FUN_020F2104
	ldr r1, [sp, #0xc]
	adds r0, r1, r0
	str r0, [sp, #0xc]
_0225BCE6:
	ldr r0, [r4]
	add r1, sp, #8
	bl FUN_020247D4
	adds r6, r6, #1
	adds r7, #0xc
	adds r4, r4, #4
	cmp r6, #2
	blt _0225BC74
	ldr r0, [sp]
	bl ov90_0225BD84
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225BD04: .4byte 0x0225C2B4
	thumb_func_end ov90_0225BC28

	thumb_func_start ov90_0225BD08
ov90_0225BD08: @ 0x0225BD08
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0225BD22
	bl FUN_0200E390
	movs r0, #0x63
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r6, r0]
_0225BD22:
	movs r4, #0
	adds r5, r6, #0
	adds r7, r4, #0
_0225BD28:
	ldr r0, [r5]
	cmp r0, #0
	beq _0225BD34
	bl FUN_02024758
	str r7, [r5]
_0225BD34:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _0225BD28
	bl FUN_0201A108
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0225BD7C @ =0xFFFF1FFF
	adds r3, r1, #0
	ands r3, r0
	movs r0, #0x65
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	subs r0, r0, #4
	lsls r1, r1, #0xd
	orrs r1, r3
	str r1, [r2]
	adds r2, #0x4a
	ldrh r2, [r2]
	movs r1, #0x3f
	ldrb r0, [r6, r0]
	bics r2, r1
	lsls r1, r0, #0x1b
	lsrs r1, r1, #0x1b
	lsls r0, r0, #0x1a
	orrs r1, r2
	lsrs r0, r0, #0x1f
	beq _0225BD74
	movs r0, #0x20
	orrs r1, r0
_0225BD74:
	ldr r0, _0225BD80 @ =0x0400004A
	strh r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225BD7C: .4byte 0xFFFF1FFF
_0225BD80: .4byte 0x0400004A
	thumb_func_end ov90_0225BD08

	thumb_func_start ov90_0225BD84
ov90_0225BD84: @ 0x0225BD84
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0xcc
	movs r1, #0
	movs r2, #0xc0
	blx FUN_020E5B44
	movs r0, #0xa
	ldrsh r2, [r4, r0]
	movs r0, #0x17
	movs r1, #0
	subs r0, r0, r2
	cmp r0, #0
	ble _0225BDC0
	ldr r7, _0225BDDC @ =0x00000115
	movs r0, #1
	movs r2, #0x79
	movs r5, #0xa
	movs r6, #0x17
_0225BDAA:
	adds r3, r4, r1
	strb r0, [r3, r7]
	subs r3, r2, r1
	adds r3, r4, r3
	adds r3, #0xcc
	strb r0, [r3]
	ldrsh r3, [r4, r5]
	adds r1, r1, #1
	subs r3, r6, r3
	cmp r1, r3
	blt _0225BDAA
_0225BDC0:
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225BDDA
	ldr r0, _0225BDE0 @ =ov90_0225BDE4
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E374
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r4, r1]
_0225BDDA:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225BDDC: .4byte 0x00000115
_0225BDE0: .4byte ov90_0225BDE4
	thumb_func_end ov90_0225BD84

	thumb_func_start ov90_0225BDE4
ov90_0225BDE4: @ 0x0225BDE4
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0xc
	adds r1, #0xcc
	movs r2, #0xc0
	blx FUN_020E5AD8
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200E390
	movs r0, #0x63
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov90_0225BDE4

	thumb_func_start ov90_0225BE08
ov90_0225BE08: @ 0x0225BE08
	push {r4, r5}
	ldr r1, _0225BED0 @ =0x04000006
	ldrh r2, [r1]
	adds r2, r2, #1
	lsrs r4, r2, #0x1f
	lsls r3, r2, #0x18
	subs r3, r3, r4
	movs r2, #0x18
	rors r3, r2
	adds r2, r4, r3
	cmp r2, #0xc0
	bge _0225BECA
	subs r3, r1, #6
	ldr r4, [r3]
	movs r3, #0xe
	lsls r3, r3, #0xc
	ands r3, r4
	subs r4, r1, #2
	ldrh r5, [r4]
	movs r4, #2
	lsrs r3, r3, #0xd
	tst r4, r5
	beq _0225BECA
	cmp r2, #0x49
	blt _0225BE3E
	cmp r2, #0x79
	ble _0225BE6A
_0225BE3E:
	ldr r1, _0225BED4 @ =0x0400004A
	movs r4, #0x3f
	ldrh r1, [r1]
	bics r1, r4
	movs r4, #0x19
	lsls r4, r4, #4
	ldrb r4, [r0, r4]
	lsls r5, r4, #0x1b
	lsrs r5, r5, #0x1b
	lsls r4, r4, #0x1a
	orrs r1, r5
	lsrs r4, r4, #0x1f
	beq _0225BE5C
	movs r4, #0x20
	orrs r1, r4
_0225BE5C:
	ldr r4, _0225BED4 @ =0x0400004A
	strh r1, [r4]
	movs r1, #0x65
	lsls r1, r1, #2
	ldr r1, [r0, r1]
	orrs r3, r1
	b _0225BE98
_0225BE6A:
	adds r1, #0x44
	ldrh r1, [r1]
	movs r4, #0x3f
	bics r1, r4
	ldr r4, _0225BED8 @ =0x00000191
	ldrb r4, [r0, r4]
	lsls r5, r4, #0x1b
	lsrs r5, r5, #0x1b
	lsls r4, r4, #0x1a
	orrs r1, r5
	lsrs r4, r4, #0x1f
	beq _0225BE86
	movs r4, #0x20
	orrs r1, r4
_0225BE86:
	ldr r4, _0225BED4 @ =0x0400004A
	strh r1, [r4]
	movs r1, #0x65
	lsls r1, r1, #2
	ldr r4, [r0, r1]
	movs r1, #2
	orrs r1, r4
	mvns r1, r1
	ands r3, r1
_0225BE98:
	adds r0, r0, r2
	ldrb r0, [r0, #0xc]
	cmp r0, #1
	ldr r0, _0225BEDC @ =0xFFFF1FFF
	bne _0225BEB8
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ands r1, r0
	movs r0, #1
	orrs r0, r3
	lsls r0, r0, #0xd
	orrs r0, r1
	str r0, [r2]
	pop {r4, r5}
	bx lr
_0225BEB8:
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ands r1, r0
	movs r0, #1
	bics r3, r0
	lsls r0, r3, #0xd
	orrs r0, r1
	str r0, [r2]
_0225BECA:
	pop {r4, r5}
	bx lr
	nop
_0225BED0: .4byte 0x04000006
_0225BED4: .4byte 0x0400004A
_0225BED8: .4byte 0x00000191
_0225BEDC: .4byte 0xFFFF1FFF
	thumb_func_end ov90_0225BE08

	thumb_func_start ov90_0225BEE0
ov90_0225BEE0: @ 0x0225BEE0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r1, #0
	ldrh r0, [r4, #4]
	cmp r0, #5
	bhi _0225BF44
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225BEF8: @ jump table
	.2byte _0225C05E - _0225BEF8 - 2 @ case 0
	.2byte _0225BF04 - _0225BEF8 - 2 @ case 1
	.2byte _0225BF38 - _0225BEF8 - 2 @ case 2
	.2byte _0225BF54 - _0225BEF8 - 2 @ case 3
	.2byte _0225C018 - _0225BEF8 - 2 @ case 4
	.2byte _0225C03A - _0225BEF8 - 2 @ case 5
_0225BF04:
	adds r0, r4, #0
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #8]
	ldr r3, [r4]
	adds r0, #0x34
	bl ov90_0225BAD0
	movs r0, #0x40
	str r0, [sp]
	ldr r0, [r4]
	movs r2, #0x80
	str r0, [sp, #4]
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #8]
	movs r3, #0x61
	bl ov90_02258EB4
	str r0, [r4, #0x30]
	movs r1, #0
	bl FUN_02024A04
	ldrh r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	strh r0, [r4, #4]
	pop {r4, r5, r6, pc}
_0225BF38:
	adds r0, r4, #0
	adds r0, #0x34
	bl ov90_0225BBD0
	cmp r0, #1
	beq _0225BF46
_0225BF44:
	b _0225C05E
_0225BF46:
	ldrh r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	strh r0, [r4, #4]
	movs r0, #0
	strh r0, [r4, #6]
	pop {r4, r5, r6, pc}
_0225BF54:
	ldr r0, [r4, #0x30]
	bl FUN_020249F8
	adds r6, r0, #0
	movs r1, #2
	ldr r0, [r4, #0x30]
	lsls r1, r1, #0xc
	bl FUN_020249B0
	ldr r0, [r4, #0x30]
	bl FUN_020249F8
	adds r5, r0, #0
	cmp r6, r5
	beq _0225BFC8
	cmp r5, #0xf
	bhi _0225BFC8
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225BF82: @ jump table
	.2byte _0225BFC8 - _0225BF82 - 2 @ case 0
	.2byte _0225BFC8 - _0225BF82 - 2 @ case 1
	.2byte _0225BFC8 - _0225BF82 - 2 @ case 2
	.2byte _0225BFC8 - _0225BF82 - 2 @ case 3
	.2byte _0225BFC8 - _0225BF82 - 2 @ case 4
	.2byte _0225BFC8 - _0225BF82 - 2 @ case 5
	.2byte _0225BFC8 - _0225BF82 - 2 @ case 6
	.2byte _0225BFA2 - _0225BF82 - 2 @ case 7
	.2byte _0225BFC8 - _0225BF82 - 2 @ case 8
	.2byte _0225BFAA - _0225BF82 - 2 @ case 9
	.2byte _0225BFC8 - _0225BF82 - 2 @ case 10
	.2byte _0225BFB2 - _0225BF82 - 2 @ case 11
	.2byte _0225BFC8 - _0225BF82 - 2 @ case 12
	.2byte _0225BFBA - _0225BF82 - 2 @ case 13
	.2byte _0225BFC8 - _0225BF82 - 2 @ case 14
	.2byte _0225BFC2 - _0225BF82 - 2 @ case 15
_0225BFA2:
	ldr r0, _0225C064 @ =0x000005DD
	bl FUN_0200604C
	b _0225BFC8
_0225BFAA:
	ldr r0, _0225C064 @ =0x000005DD
	bl FUN_0200604C
	b _0225BFC8
_0225BFB2:
	ldr r0, _0225C064 @ =0x000005DD
	bl FUN_0200604C
	b _0225BFC8
_0225BFBA:
	ldr r0, _0225C064 @ =0x000005DD
	bl FUN_0200604C
	b _0225BFC8
_0225BFC2:
	ldr r0, _0225C068 @ =0x00000642
	bl FUN_0200604C
_0225BFC8:
	cmp r5, #0xf
	bne _0225BFFC
	movs r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _0225BFDE
	ldr r0, [r4, #0x30]
	movs r1, #0
	bl FUN_02024AA8
	b _0225BFEA
_0225BFDE:
	cmp r0, #4
	bne _0225BFEA
	ldr r0, [r4, #0x30]
	movs r1, #1
	bl FUN_02024AA8
_0225BFEA:
	movs r0, #6
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r0, [r4, r0]
	cmp r0, #8
	blt _0225BFFC
	movs r0, #0
	strh r0, [r4, #6]
_0225BFFC:
	ldr r0, [r4, #0x30]
	bl FUN_02024B68
	cmp r0, #0
	bne _0225C05E
	ldrh r0, [r4, #4]
	movs r1, #0
	adds r0, r0, #1
	strh r0, [r4, #4]
	ldr r0, [r4, #0x30]
	bl FUN_02024AA8
	add sp, #8
	pop {r4, r5, r6, pc}
_0225C018:
	adds r0, r4, #0
	adds r0, #0x34
	bl ov90_0225BBF0
	cmp r0, #1
	bne _0225C05E
	ldr r0, [r4, #0x30]
	bl FUN_02024758
	movs r1, #0
	str r1, [r4, #0x30]
	ldrh r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	strh r0, [r4, #4]
	strh r1, [r4, #6]
	pop {r4, r5, r6, pc}
_0225C03A:
	movs r0, #6
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r0, [r4, r0]
	cmp r0, #2
	blt _0225C05E
	movs r0, #0
	strh r0, [r4, #4]
	adds r0, r4, #0
	adds r0, #0x34
	bl ov90_0225BD08
	ldr r0, [r4, #0x2c]
	bl FUN_0200E390
	movs r0, #0
	str r0, [r4, #0x2c]
_0225C05E:
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0225C064: .4byte 0x000005DD
_0225C068: .4byte 0x00000642
	thumb_func_end ov90_0225BEE0

	thumb_func_start ov90_0225C06C
ov90_0225C06C: @ 0x0225C06C
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	ldrh r0, [r4, #4]
	cmp r0, #5
	bhi _0225C14C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225C084: @ jump table
	.2byte _0225C14C - _0225C084 - 2 @ case 0
	.2byte _0225C090 - _0225C084 - 2 @ case 1
	.2byte _0225C0CC - _0225C084 - 2 @ case 2
	.2byte _0225C0EE - _0225C084 - 2 @ case 3
	.2byte _0225C106 - _0225C084 - 2 @ case 4
	.2byte _0225C128 - _0225C084 - 2 @ case 5
_0225C090:
	adds r0, r4, #0
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #8]
	ldr r3, [r4]
	adds r0, #0x34
	bl ov90_0225BAD0
	movs r0, #0x40
	str r0, [sp]
	ldr r0, [r4]
	movs r2, #0x80
	str r0, [sp, #4]
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #8]
	movs r3, #0x61
	bl ov90_02258EB4
	str r0, [r4, #0x30]
	movs r1, #1
	bl FUN_020248F0
	ldr r0, [r4, #0x30]
	movs r1, #0
	bl FUN_02024A04
	ldrh r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	strh r0, [r4, #4]
	pop {r4, pc}
_0225C0CC:
	adds r0, r4, #0
	adds r0, #0x34
	bl ov90_0225BBD0
	cmp r0, #1
	bne _0225C14C
	ldr r0, [r4, #0x30]
	movs r1, #1
	bl FUN_0202484C
	ldrh r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	strh r0, [r4, #4]
	movs r0, #0
	strh r0, [r4, #6]
	pop {r4, pc}
_0225C0EE:
	movs r0, #6
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r0, [r4, r0]
	cmp r0, #0x32
	blt _0225C14C
	ldrh r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	strh r0, [r4, #4]
	pop {r4, pc}
_0225C106:
	adds r0, r4, #0
	adds r0, #0x34
	bl ov90_0225BBF0
	cmp r0, #1
	bne _0225C14C
	ldr r0, [r4, #0x30]
	bl FUN_02024758
	movs r0, #0
	str r0, [r4, #0x30]
	strh r0, [r4, #6]
	ldrh r0, [r4, #4]
	add sp, #8
	adds r0, r0, #1
	strh r0, [r4, #4]
	pop {r4, pc}
_0225C128:
	movs r0, #6
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r0, [r4, r0]
	cmp r0, #2
	blt _0225C14C
	movs r0, #0
	strh r0, [r4, #4]
	adds r0, r4, #0
	adds r0, #0x34
	bl ov90_0225BD08
	ldr r0, [r4, #0x2c]
	bl FUN_0200E390
	movs r0, #0
	str r0, [r4, #0x2c]
_0225C14C:
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov90_0225C06C

	thumb_func_start ov90_0225C150
ov90_0225C150: @ 0x0225C150
	ldr r0, _0225C154 @ =0x0225C4FC
	bx lr
	.align 2, 0
_0225C154: .4byte 0x0225C4FC
	thumb_func_end ov90_0225C150

	thumb_func_start ov90_0225C158
ov90_0225C158: @ 0x0225C158
	movs r0, #5
	bx lr
	thumb_func_end ov90_0225C158

	thumb_func_start ov90_0225C15C
ov90_0225C15C: @ 0x0225C15C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov90_0225C150
	adds r4, r0, #0
	bl ov90_0225C158
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_0203410C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov90_0225C15C

	thumb_func_start ov90_0225C178
ov90_0225C178: @ 0x0225C178
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov90_0225C150
	adds r4, r0, #0
	bl ov90_0225C158
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_0203410C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov90_0225C178

	thumb_func_start ov90_0225C194
ov90_0225C194: @ 0x0225C194
	movs r0, #0
	bx lr
	thumb_func_end ov90_0225C194

	thumb_func_start ov90_0225C198
ov90_0225C198: @ 0x0225C198
	movs r0, #4
	bx lr
	thumb_func_end ov90_0225C198

	thumb_func_start ov90_0225C19C
ov90_0225C19C: @ 0x0225C19C
	adds r0, r3, #0
	ldr r3, _0225C1A4 @ =ov90_02258B24
	ldr r1, [r2]
	bx r3
	.align 2, 0
_0225C1A4: .4byte ov90_02258B24
	thumb_func_end ov90_0225C19C

	thumb_func_start ov90_0225C1A8
ov90_0225C1A8: @ 0x0225C1A8
	adds r1, r0, #0
	adds r0, r3, #0
	ldr r3, _0225C1B4 @ =ov90_02258B2C
	movs r2, #1
	bx r3
	nop
_0225C1B4: .4byte ov90_02258B2C
	thumb_func_end ov90_0225C1A8

	thumb_func_start ov90_0225C1B8
ov90_0225C1B8: @ 0x0225C1B8
	adds r1, r0, #0
	adds r0, r3, #0
	ldr r3, _0225C1C4 @ =ov90_02258B2C
	movs r2, #0
	bx r3
	nop
_0225C1C4: .4byte ov90_02258B2C
	thumb_func_end ov90_0225C1B8

	thumb_func_start ov90_0225C1C8
ov90_0225C1C8: @ 0x0225C1C8
	adds r0, r3, #0
	ldr r3, _0225C1D0 @ =ov90_02258B44
	movs r1, #1
	bx r3
	.align 2, 0
_0225C1D0: .4byte ov90_02258B44
	thumb_func_end ov90_0225C1C8

	thumb_func_start ov90_0225C1D4
ov90_0225C1D4: @ 0x0225C1D4
	adds r0, r3, #0
	ldr r3, _0225C1DC @ =ov90_02258B44
	movs r1, #0
	bx r3
	.align 2, 0
_0225C1DC: .4byte ov90_02258B44
	thumb_func_end ov90_0225C1D4

	.rodata

_0225C1E0:
	.byte 0x55, 0x0F, 0x00, 0x00, 0x55, 0x0F, 0x00, 0x00, 0x4B, 0x0F, 0x0A, 0x00, 0x00, 0x01, 0x03, 0x02
	.byte 0x00, 0x00, 0xF6, 0xFF, 0xF0, 0xFF, 0xE8, 0xFF, 0x00, 0x80, 0x0C, 0x00, 0x00, 0x80, 0xF3, 0xFF
	.byte 0x00, 0x00, 0xF6, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x08, 0x07, 0x00, 0x06, 0x05, 0x04, 0x00, 0x03, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xFE, 0xFF, 0x00, 0x20, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x70, 0xFF, 0xFF, 0x00, 0x90, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0x00, 0x80, 0x0C, 0x00
	.byte 0x00, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x2C, 0x00, 0xEC, 0x00, 0x18, 0x00, 0x04, 0x00, 0x18, 0x00
	.byte 0x80, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00
	.byte 0x00, 0x03, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x20, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x04, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x0E, 0x08, 0x02, 0x00, 0x12, 0x00, 0x06, 0x00, 0x00, 0x02, 0x01, 0x00
	.byte 0x12, 0x0C, 0x00, 0x06, 0x12, 0x00, 0x06, 0x0C, 0x00, 0x02, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x14, 0x00, 0x03, 0x00, 0x03, 0x00, 0x04, 0x00, 0x04, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0x06, 0x00, 0x06, 0x00, 0x07, 0x00, 0x07, 0x00, 0x08, 0x00, 0x08, 0x00
	.byte 0x09, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x15, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00
	.byte 0x0D, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x10, 0x00
	.byte 0x11, 0x00, 0x16, 0x00, 0x12, 0x00, 0x17, 0x00, 0x13, 0x00, 0x13, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x19, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x18, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x14, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x1B, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x18, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA9, 0xC1, 0x25, 0x02
	.byte 0x95, 0xC1, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0xB9, 0xC1, 0x25, 0x02, 0x95, 0xC1, 0x25, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0xC9, 0xC1, 0x25, 0x02, 0x95, 0xC1, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0xD5, 0xC1, 0x25, 0x02, 0x95, 0xC1, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x9D, 0xC1, 0x25, 0x02
	.byte 0x99, 0xC1, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00
	@ 0x0225C538
